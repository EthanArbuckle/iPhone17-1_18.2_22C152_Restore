@interface APServerConfiguration
- (APServerConfiguration)init;
- (NSDictionary)configurations;
- (NSOperationQueue)operationQueue;
- (id)notificationObject;
- (id)serverURLForMessageID:(id)a3 andBundleID:(id)a4;
- (void)dealloc;
- (void)setConfigurations:(id)a3;
- (void)setNotificationObject:(id)a3;
@end

@implementation APServerConfiguration

- (APServerConfiguration)init
{
  v23.receiver = self;
  v23.super_class = (Class)APServerConfiguration;
  v2 = [(APServerConfiguration *)&v23 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    v5 = +[APServerConfigurationSettings settings];
    uint64_t v6 = [v5 serverConfig];
    configurations = v2->_configurations;
    v2->_configurations = (NSDictionary *)v6;

    v8 = v2->_configurations;
    v9 = APLogForCategory();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        v11 = "Read configurations from settings module.";
        v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_INFO;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)buf, 2u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      v11 = "Error reading from settings module.";
      v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }

    objc_initWeak(buf, v2);
    v14 = +[NSDistributedNotificationCenter defaultCenter];
    uint64_t v15 = kAPAdLibBundleID;
    v16 = v2->_operationQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10009E40C;
    v20[3] = &unk_100234A68;
    objc_copyWeak(&v21, buf);
    uint64_t v17 = [v14 addObserverForName:@"ADConfigurationDidChangeNotification" object:v15 queue:v16 usingBlock:v20];
    id notificationObject = v2->_notificationObject;
    v2->_id notificationObject = (id)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self->_notificationObject];

  v4.receiver = self;
  v4.super_class = (Class)APServerConfiguration;
  [(APServerConfiguration *)&v4 dealloc];
}

- (id)serverURLForMessageID:(id)a3 andBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!+[APSystemInternal isAppleInternalInstall])goto LABEL_4; {
  v8 = +[APMockAdServerSettings settings];
  }
  v9 = [v8 mockAdServerUrl];

  if (!v9) {
    goto LABEL_4;
  }
  v10 = +[APMockAdServerSettings settings];
  v11 = [v10 mockAdServerUrl];
  id v12 = +[NSURL URLWithString:v11];

  if (!v12)
  {
LABEL_4:
    os_log_type_t v13 = +[NSURL URLWithString:@"https://iadsdk.apple.com/adserver"];
    v14 = [(APServerConfiguration *)self configurations];

    if (v14)
    {
      uint64_t v15 = [(APServerConfiguration *)self configurations];
      v16 = [v15 objectForKeyedSubscript:v7];

      if (v16)
      {
        uint64_t v17 = [v16 objectForKeyedSubscript:v6];
        v18 = APLogForCategory();
        v19 = v18;
        if (v17)
        {
          v20 = v17;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            int v24 = 138543362;
            v25 = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Returning serverConfig URL: %{public}@", (uint8_t *)&v24, 0xCu);
            v20 = v17;
          }
        }
        else
        {
          v20 = v13;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v24) = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Did not find serverURL. Returning default serverURL", (uint8_t *)&v24, 2u);
            v20 = v13;
          }
        }

        id v12 = v20;
      }
      else
      {
        v22 = APLogForCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Did not find requestTypeDictionary in serverConfigRecord. Returning default serverURL", (uint8_t *)&v24, 2u);
        }

        id v12 = v13;
      }
    }
    else
    {
      id v21 = APLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Did not find configurations in serverConfigRecord. Returning default serverURL", (uint8_t *)&v24, 2u);
      }

      id v12 = v13;
    }
  }

  return v12;
}

- (NSDictionary)configurations
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfigurations:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (id)notificationObject
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setNotificationObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationObject, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_configurations, 0);
}

@end