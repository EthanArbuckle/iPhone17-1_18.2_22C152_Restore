@interface MSDPushNotificationHandler
+ (id)sharedInstance;
- (APSConnection)apsConnection;
- (MSDPushNotificationHandler)init;
- (NSString)apsToken;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)enablePushNotifications;
- (void)setApsConnection:(id)a3;
- (void)setApsToken:(id)a3;
@end

@implementation MSDPushNotificationHandler

+ (id)sharedInstance
{
  if (qword_100189938 != -1) {
    dispatch_once(&qword_100189938, &stru_100152558);
  }
  v2 = (void *)qword_100189930;

  return v2;
}

- (MSDPushNotificationHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDPushNotificationHandler;
  v2 = [(MSDPushNotificationHandler *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MSDPushNotificationHandler *)v2 setApsConnection:0];
    [(MSDPushNotificationHandler *)v3 setApsToken:0];
    v4 = v3;
  }

  return v3;
}

- (void)enablePushNotifications
{
  v3 = [(MSDPushNotificationHandler *)self apsConnection];

  if (!v3)
  {
    id v4 = objc_alloc((Class)APSConnection);
    uint64_t v5 = APSEnvironmentProduction;
    objc_super v6 = +[MSDWorkQueueSet sharedInstance];
    v7 = [v6 pollingQueue];
    id v8 = [v4 initWithEnvironmentName:v5 namedDelegatePort:@"com.apple.aps.mobilestoredemoport" queue:v7];
    [(MSDPushNotificationHandler *)self setApsConnection:v8];

    v9 = [(MSDPushNotificationHandler *)self apsConnection];
    [v9 setDelegate:self];

    v10 = [(MSDPushNotificationHandler *)self apsConnection];
    [v10 requestTokenForTopic:@"com.apple.ist.demounit.demodevicenotifications" identifier:&stru_100155450];

    id v12 = [(MSDPushNotificationHandler *)self apsConnection];
    v11 = +[NSArray arrayWithObject:@"com.apple.ist.demounit.demodevicenotifications"];
    [v12 setEnabledTopics:v11];
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v4 = a4;
  uint64_t v5 = [v4 topic];
  if ([v5 isEqualToString:@"com.apple.ist.demounit.demodevicenotifications"])
  {
    objc_super v6 = [v4 userInfo];
    v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000CB220((uint64_t)v6, v7);
    }

    id v8 = [v6 objectForKey:@"action"];
    unsigned int v9 = [v8 isEqualToString:@"ping_hub"];

    if (v9)
    {
      v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received request to ping the hub.", (uint8_t *)&v28, 2u);
      }

      v11 = +[MSDMailProcessor sharedInstance];
      [v11 sendPushNotificationPing];
      goto LABEL_32;
    }
    id v12 = [v6 objectForKey:@"action"];
    unsigned int v13 = [v12 isEqualToString:@"collect_logs"];

    if (v13)
    {
      v14 = [v6 objectForKey:@"parameters"];
      v11 = [v14 objectForKey:@"url"];
      v15 = [v14 objectForKey:@"retryAttempts"];
      id v16 = [v15 integerValue];

      v17 = [v14 objectForKey:@"headers"];
      v18 = sub_100068600();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138543618;
        v29 = (const char *)v11;
        __int16 v30 = 2048;
        id v31 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received request to collect MobileStoreDemo logs. Upload url: %{public}@, retry attempts: %ld", (uint8_t *)&v28, 0x16u);
      }

      v19 = +[MSDS3UploadHandler sharedInstance];
      [v19 uploadDemoLogsTo:v11 HttpHeaders:v17 andMaxAttempts:v16];

      goto LABEL_32;
    }
    v20 = [v6 objectForKey:@"action"];
    unsigned int v21 = [v20 isEqualToString:@"demo_device_lock"];

    if (v21)
    {
      if (!os_variant_has_internal_content())
      {
LABEL_33:

        goto LABEL_34;
      }
      v11 = +[MSDTargetDevice sharedInstance];
      if (![v11 isDDLDevice]
        || ![v11 isContentFrozen])
      {
        v22 = sub_100068600();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_1000CB158(v22);
        }
        goto LABEL_31;
      }
      if (([v11 unenrollWithObliteration:0 preserveESim:1 callUnregister:0 preserveDDLFlag:1] & 1) == 0)
      {
        v22 = sub_100068600();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_1000CB114(v22);
        }
        goto LABEL_31;
      }
    }
    else
    {
      v23 = [v6 objectForKey:@"action"];
      unsigned int v24 = [v23 isEqualToString:@"discover"];

      v11 = sub_100068600();
      BOOL v25 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v24)
      {
        if (v25)
        {
          int v28 = 136315138;
          v29 = "-[MSDPushNotificationHandler connection:didReceiveIncomingMessage:]";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s - INFO - Received request to flash the device.", (uint8_t *)&v28, 0xCu);
        }

        v11 = +[MSDAVFlashlight sharedInstance];
        v22 = [v6 objectForKey:@"parameters"];
        v26 = [v22 objectForKey:@"flashDeviceDuration"];
        if ((-[NSObject flash:](v11, "flash:", [v26 unsignedIntegerValue]) & 1) == 0)
        {
          v27 = sub_100068600();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_1000CB19C(v27);
          }
        }
        goto LABEL_31;
      }
      if (v25)
      {
        v22 = [v6 objectForKey:@"action"];
        int v28 = 138543362;
        v29 = (const char *)v22;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received invalid command from DU. %{public}@", (uint8_t *)&v28, 0xCu);
LABEL_31:
      }
    }
LABEL_32:

    goto LABEL_33;
  }
LABEL_34:
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  v7 = [a4 hexStringRepresentation:a3];
  [(MSDPushNotificationHandler *)self setApsToken:v7];

  id v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000CB298(self, v8);
  }
}

- (NSString)apsToken
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setApsToken:(id)a3
{
}

- (APSConnection)apsConnection
{
  return (APSConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApsConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsConnection, 0);

  objc_storeStrong((id *)&self->_apsToken, 0);
}

@end