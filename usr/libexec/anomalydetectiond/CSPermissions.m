@interface CSPermissions
+ (id)sharedInstance;
- (BOOL)firstOrThirdPartyEnabled;
- (BOOL)isAuthorizedForIS;
- (BOOL)isAuthorizedToCollectData;
@end

@implementation CSPermissions

+ (id)sharedInstance
{
  if (qword_1003DD840 != -1) {
    dispatch_once(&qword_1003DD840, &stru_1003BB280);
  }
  v2 = (void *)qword_1003DD838;

  return v2;
}

- (BOOL)isAuthorizedForIS
{
  if (!objc_opt_class()) {
    return 0;
  }
  v2 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v3 = [v2 isSafetyDataSubmissionAllowed];

  return v3;
}

- (BOOL)firstOrThirdPartyEnabled
{
  unsigned __int8 v2 = +[SOSUtilities kappaTriggersEmergencySOS];
  unsigned __int8 v3 = +[SOSUtilities getKappaThirdPartyDisplayNameForApp];

  if (qword_1003DB6F0 != -1) {
    dispatch_once(&qword_1003DB6F0, &stru_1003BB2A0);
  }
  v4 = (id)qword_1003DB6F8;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v5 = +[SOSUtilities kappaTriggersEmergencySOS];
    v6 = +[SOSUtilities getKappaThirdPartyDisplayNameForApp];
    v8[0] = 67109376;
    v8[1] = v5;
    __int16 v9 = 1024;
    BOOL v10 = v6 != 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "1P %d 3P %d", (uint8_t *)v8, 0xEu);
  }
  if (v3) {
    unsigned __int8 v2 = 1;
  }

  return v2;
}

- (BOOL)isAuthorizedToCollectData
{
  if (objc_opt_class()) {
    unsigned int v2 = +[SOSUtilities kappaTriggersEmergencySOS];
  }
  else {
    unsigned int v2 = 0;
  }
  unsigned __int8 v3 = +[CSPersistentConfiguration sharedConfiguration];
  v4 = [v3 objectForKey:@"ForceCollectionAuthorized"];

  if (v4)
  {
    unsigned int v5 = +[CSPersistentConfiguration sharedConfiguration];
    unsigned int v6 = [v5 BOOLForKey:@"ForceCollectionAuthorized"];

    if (qword_1003DB6F0 != -1) {
      dispatch_once(&qword_1003DB6F0, &stru_1003BB2A0);
    }
    v7 = qword_1003DB6F8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6F8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 67109120;
      unsigned int v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "forcing collect authorized %d", (uint8_t *)&v12, 8u);
    }
  }
  else
  {
    if (qword_1003DB6F0 != -1) {
      dispatch_once(&qword_1003DB6F0, &stru_1003BB2A0);
    }
    v8 = qword_1003DB6F8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6F8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 67240192;
      unsigned int v13 = v2;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "logging enabled %{public}d", (uint8_t *)&v12, 8u);
    }
    __int16 v9 = +[CSPermissions sharedInstance];
    unsigned __int8 v10 = [v9 isAuthorizedForIS];
    if (v2) {
      LOBYTE(v6) = v10;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

@end