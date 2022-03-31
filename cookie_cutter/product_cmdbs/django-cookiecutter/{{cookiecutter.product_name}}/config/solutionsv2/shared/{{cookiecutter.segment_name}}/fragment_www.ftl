[#case "www-v1"]

    [#switch _context.Mode ]
        [#case "CELERYWORKER"]
        [#case "CELERYBEAT"]
        [#case "FLOWER" ]
            [#assign command = "/start-" + _context.Mode?lower_case ]
            [#break]
        [#case "TASK"]
            [#assign command = [ "sh" , "-c", "python /app/manage.py $\{APP_TASK_LIST}" ] ]
            [#break]
        [#default]
            [#assign command = "/start"]
    [/#switch]

    [@Command command /]

    [@includeServicesConfiguration
        provider=AWS_PROVIDER
        services=AWS_SIMPLE_EMAIL_SERVICE
        deploymentFramework=CLOUD_FORMATION_DEPLOYMENT_FRAMEWORK
    /]

    [@Policy getSESSendStatement() /]

    [#assign allowedHosts = [ ] +
        (_context.Links["SITE"].State.Attributes.INTERNAL_FQDN)?has_content?then(
            [ _context.Links["SITE"].State.Attributes.INTERNAL_FQDN ],
            []
        ) +
        (_context.Links["SITE"].State.Attributes.FQDN)?has_content?then(
            [ _context.Links["SITE"].State.Attributes.FQDN ],
            []
        )]
        
    [@Settings 
        {
            "DJANGO_ALLOWED_HOSTS" : allowedHosts?has_content?then(
                allowedHosts?join(","),
                "localhost"
            )
        } 
    /]
    [#assign sentryLogLevel = 20 ]
    [#switch ((_context.DefaultEnvironment["LOG_LEVEL"])!INFO)?upper_case ]
        [#case "CRITICAL" ]
            [#assign sentryLogLevel = 50 ]
            [#break]
        [#case "ERROR" ]
            [#assign sentryLogLevel = 40 ]
            [#break]
        [#case "WARNING" ]
            [#assign sentryLogLevel = 30 ]
            [#break]
        [#case "INFO" ]
            [#assign sentryLogLevel = 20 ]
            [#break]
        [#case "DEBUG" ]
            [#assign sentryLogLevel = 10 ]
            [#break]
        [#case "NONE" ]
            [#assign sentryLogLevel = 0 ]
            [#break]
    [/#switch]

    [@Settings {
        "DJANGO_SENTRY_LOG_LEVEL" : sentryLogLevel
    }]

    {% if cookiecutter.use_celery == "yes" %}[@Settings 
        {
            "CELERY_BROKER_URL" : (_context.Links["redis"].State.Attributes.URL)!""
        }
    /]{% endif %}

    [#break]
