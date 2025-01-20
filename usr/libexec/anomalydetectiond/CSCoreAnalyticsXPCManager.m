@interface CSCoreAnalyticsXPCManager
- (CSCoreAnalyticsXPCManager)initWithMartyUploadHandler:(id)a3 andKappaHandler:(id)a4;
- (void)registerForCoreAnalyticsUserInfo;
- (void)registerForCoreAnalyticsUserInfoWithCriteria:(id)a3;
- (void)registerForCoreAnalyticsUserInfoWithExplicitCriteria;
@end

@implementation CSCoreAnalyticsXPCManager

- (CSCoreAnalyticsXPCManager)initWithMartyUploadHandler:(id)a3 andKappaHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CSCoreAnalyticsXPCManager;
  v8 = [(CSCoreAnalyticsXPCManager *)&v21 init];
  if (v8)
  {
    v9 = +[CSPersistentConfiguration sharedConfiguration];
    v8->_unint64_t xpcIntervalInSecs = (unint64_t)[v9 integerForKey:@"CoreAnalyticsUserInfoCadence"];

    if (!v8->_xpcIntervalInSecs) {
      v8->_unint64_t xpcIntervalInSecs = 86400;
    }
    if (qword_1003DB750 != -1) {
      dispatch_once(&qword_1003DB750, &stru_1003B69E8);
    }
    v10 = qword_1003DB758;
    if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_INFO))
    {
      unint64_t xpcIntervalInSecs = v8->_xpcIntervalInSecs;
      *(_DWORD *)buf = 134217984;
      unint64_t v23 = xpcIntervalInSecs;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "configure to send after %llu seconds", buf, 0xCu);
    }
    id v12 = objc_retainBlock(v6);
    id martyHandler = v8->_martyHandler;
    v8->_id martyHandler = v12;

    id v14 = objc_retainBlock(v7);
    id kappaHandler = v8->_kappaHandler;
    v8->_id kappaHandler = v14;

    v16 = +[CSPersistentConfiguration sharedConfiguration];
    unsigned int v17 = [v16 BOOLForKey:@"CAUnmanagedXPCActivity"];

    if (v17)
    {
      if (qword_1003DB750 != -1) {
        dispatch_once(&qword_1003DB750, &stru_1003B69E8);
      }
      v18 = qword_1003DB758;
      if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "unmanaged xpc activity", buf, 2u);
      }
      [(CSCoreAnalyticsXPCManager *)v8 registerForCoreAnalyticsUserInfoWithExplicitCriteria];
    }
    else
    {
      if (qword_1003DB750 != -1) {
        dispatch_once(&qword_1003DB750, &stru_1003B69E8);
      }
      v19 = qword_1003DB758;
      if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "launchd managed xpc activity", buf, 2u);
      }
      [(CSCoreAnalyticsXPCManager *)v8 registerForCoreAnalyticsUserInfo];
    }
  }

  return v8;
}

- (void)registerForCoreAnalyticsUserInfoWithExplicitCriteria
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, self->_xpcIntervalInSecs);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_PREVENT_DEVICE_SLEEP, 1);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  [(CSCoreAnalyticsXPCManager *)self registerForCoreAnalyticsUserInfoWithCriteria:xdict];
}

- (void)registerForCoreAnalyticsUserInfo
{
}

- (void)registerForCoreAnalyticsUserInfoWithCriteria:(id)a3
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1002B8370;
  handler[3] = &unk_1003B69C8;
  handler[4] = self;
  xpc_activity_register("com.apple.anomalydetectiond.CoreAnalytics.UserInfo", a3, handler);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_kappaHandler, 0);

  objc_storeStrong(&self->_martyHandler, 0);
}

@end