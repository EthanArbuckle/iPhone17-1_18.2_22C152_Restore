@interface PCStatusConditionsReceiver
+ (BOOL)validateWhitelistingForCondition:(id)a3 forBundleIdentifier:(id)a4;
+ (BOOL)validateWhitelistingForRead:(id)a3;
- (APXPCConnection)connection;
- (BOOL)hasReadEntitlement;
- (BOOL)hasWriteEntitlement;
- (NSString)bundleID;
- (PCStatusConditionsReceiver)initWithBundleID:(id)a3 connection:(id)a4;
- (PCStatusConditionsService)conditionsService;
- (Protocol)exportedInterface;
- (id)requiredEntitlements;
- (void)_isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)clearStatusCondition:(id)a3 completionHandler:(id)a4;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setBundleID:(id)a3;
- (void)setConditionsService:(id)a3;
- (void)setConnection:(id)a3;
- (void)setStatusCondition:(id)a3 completionHandler:(id)a4;
@end

@implementation PCStatusConditionsReceiver

- (PCStatusConditionsReceiver)initWithBundleID:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PCStatusConditionsReceiver;
  v9 = [(PCStatusConditionsReceiver *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a4);
    objc_storeStrong((id *)&v10->_bundleID, a3);
    uint64_t v11 = +[PCStatusConditionsService sharedInstance];
    conditionsService = v10->_conditionsService;
    v10->_conditionsService = (PCStatusConditionsService *)v11;
  }
  return v10;
}

+ (BOOL)validateWhitelistingForCondition:(id)a3 forBundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (+[PCStatusConditionsDefaultsSettings settings](PCStatusConditionsDefaultsSettings, "settings"), id v7 = objc_claimAutoreleasedReturnValue(), [v7 whitelistingsDisabled], v8 = objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "isEqualToNumber:", &off_10024A400), v8, v7, v9))
  {
    v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "This is an internal build and whitelisting of status conditions has been disabled. Proceeding with operation.", v14, 2u);
    }

    unsigned __int8 v11 = 1;
  }
  else
  {
    if (qword_10028D280 != -1) {
      dispatch_once(&qword_10028D280, &stru_100238EF8);
    }
    v12 = [(id)qword_10028D278 objectForKey:v6];
    unsigned __int8 v11 = [v12 containsObject:v5];
  }
  return v11;
}

+ (BOOL)validateWhitelistingForRead:(id)a3
{
  id v3 = a3;
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (+[PCStatusConditionsDefaultsSettings settings](PCStatusConditionsDefaultsSettings, "settings"), v4 = objc_claimAutoreleasedReturnValue(), [v4 whitelistingsDisabled], id v5 = objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "isEqualToNumber:", &off_10024A400), v5, v4, v6))
  {
    id v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "This is an internal build and whitelisting of status condition reads has been disabled. Proceeding with operation.", v10, 2u);
    }

    unsigned __int8 v8 = 1;
  }
  else
  {
    if (qword_10028D290 != -1) {
      dispatch_once(&qword_10028D290, &stru_100238F18);
    }
    unsigned __int8 v8 = [(id)qword_10028D288 containsObject:v3];
  }

  return v8;
}

- (void)setStatusCondition:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018EFEC;
  block[3] = &unk_100233D18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)clearStatusCondition:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018F490;
  block[3] = &unk_100233D18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = dispatch_get_global_queue(0, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10018F95C;
  v15[3] = &unk_100238F90;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = (void (**)(id, BOOL, id))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [PCBooleanCondition alloc];
  unsigned __int8 v11 = [v9 UUIDString];

  id v12 = [(PCBooleanCondition *)v10 initWithType:@"sc" value:v11 identifier:v8];
  id v15 = 0;
  BOOL v13 = +[PCStatusConditionStorage isStatusConditionRegistered:v12 error:&v15];
  id v14 = v15;
  if (v7) {
    v7[2](v7, v13, v14);
  }
}

- (BOOL)hasReadEntitlement
{
  return [(APXPCConnection *)self->_connection hasEntitlement:@"com.apple.ap.adservicesd.statusconditionclient.allow_read"];
}

- (BOOL)hasWriteEntitlement
{
  return [(APXPCConnection *)self->_connection hasEntitlement:@"com.apple.ap.adservicesd.statusconditionclient.allow_write"];
}

- (Protocol)exportedInterface
{
  return (Protocol *)&OBJC_PROTOCOL___APStatusConditions_XPC;
}

- (void)connectionInterrupted
{
  v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Connection to client for StatusConditions was interrupted.", v3, 2u);
  }
}

- (void)connectionInvalidated
{
  v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Connection to client for StatusConditions was invalidated.", v3, 2u);
  }
}

- (id)requiredEntitlements
{
  return +[NSArray array];
}

- (APXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (PCStatusConditionsService)conditionsService
{
  return self->_conditionsService;
}

- (void)setConditionsService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionsService, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end