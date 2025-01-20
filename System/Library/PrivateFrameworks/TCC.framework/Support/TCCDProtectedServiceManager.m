@interface TCCDProtectedServiceManager
- (BOOL)authenticateForAccessToService:(id)a3;
- (BOOL)authenticateForBundle:(id)a3;
- (NSDictionary)serviceBundleMap;
- (OS_os_log)logHandle;
- (TCCDProtectedServiceManager)init;
- (id)bundleIdForService:(id)a3;
- (void)setLogHandle:(id)a3;
- (void)setServiceBundleMap:(id)a3;
@end

@implementation TCCDProtectedServiceManager

- (TCCDProtectedServiceManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)TCCDProtectedServiceManager;
  v2 = [(TCCDProtectedServiceManager *)&v8 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.TCC", "access");
    logHandle = v2->_logHandle;
    v2->_logHandle = (OS_os_log *)v3;

    v9[0] = kTCCServicePhotos;
    v9[1] = kTCCServicePhotosAdd;
    v10[0] = @"com.apple.mobileslideshow";
    v10[1] = @"com.apple.mobileslideshow";
    v9[2] = kTCCServiceCalendar;
    v9[3] = kTCCServiceReminders;
    v10[2] = @"com.apple.mobilecal";
    v10[3] = @"com.apple.reminders";
    v9[4] = kTCCServiceWillow;
    v9[5] = kTCCServiceMediaLibrary;
    v10[4] = @"com.apple.Home";
    v10[5] = @"com.apple.Music";
    v9[6] = kTCCServiceFinancialData;
    v10[6] = @"com.apple.Passbook";
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:7];
    serviceBundleMap = v2->_serviceBundleMap;
    v2->_serviceBundleMap = (NSDictionary *)v5;
  }
  return v2;
}

- (BOOL)authenticateForBundle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[APApplication applicationWithBundleIdentifier:v4];
  if (!v5)
  {
    id v8 = 0;
LABEL_8:
    unsigned __int8 v7 = 0;
    goto LABEL_9;
  }
  v6 = +[APGuard sharedGuard];
  id v11 = 0;
  unsigned __int8 v7 = [v6 authenticateSyncForSubject:v5 error:&v11];
  id v8 = v11;

  if ((v7 & 1) == 0 && v8)
  {
    v9 = [(TCCDProtectedServiceManager *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error during authenticating for client %@: %@", buf, 0x16u);
    }

    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

- (BOOL)authenticateForAccessToService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TCCDProtectedServiceManager *)self bundleIdForService:v4];
  v6 = [(TCCDProtectedServiceManager *)self logHandle];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Authenticating for client: %@", (uint8_t *)&v10, 0xCu);
    }

    BOOL v8 = [(TCCDProtectedServiceManager *)self authenticateForBundle:v5];
  }
  else
  {
    if (v7)
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "service not protected: %@", (uint8_t *)&v10, 0xCu);
    }

    BOOL v8 = 1;
  }

  return v8;
}

- (id)bundleIdForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TCCDProtectedServiceManager *)self serviceBundleMap];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSDictionary)serviceBundleMap
{
  return self->_serviceBundleMap;
}

- (void)setServiceBundleMap:(id)a3
{
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (void)setLogHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_serviceBundleMap, 0);
}

@end