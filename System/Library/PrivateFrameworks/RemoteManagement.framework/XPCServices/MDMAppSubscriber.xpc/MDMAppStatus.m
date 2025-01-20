@interface MDMAppStatus
+ (id)appStatusForApp:(id)a3;
+ (id)connectionForStore:(id)a3;
+ (id)neededAppProperties;
+ (id)stringForAppState:(unint64_t)a3;
+ (id)supportedStatusKeys;
- (void)queryForStatusWithKeyPaths:(id)a3 store:(id)a4 completionHandler:(id)a5;
@end

@implementation MDMAppStatus

+ (id)supportedStatusKeys
{
  uint64_t v5 = RMModelStatusItemMDMApp;
  v2 = +[NSArray arrayWithObjects:&v5 count:1];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

+ (id)neededAppProperties
{
  return &off_1000043A0;
}

- (void)queryForStatusWithKeyPaths:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = +[RMLog mDMAppStatus];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100003118((uint64_t)v8, v11);
  }

  v12 = objc_opt_new();
  [v12 setManagedAppsOnly:1];
  v13 = [(id)objc_opt_class() neededAppProperties];
  [v12 setPropertyKeys:v13];

  v14 = [(id)objc_opt_class() connectionForStore:v10];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100002D00;
  v17[3] = &unk_1000041A8;
  id v18 = v8;
  id v19 = v9;
  v17[4] = self;
  id v15 = v8;
  id v16 = v9;
  [v14 performRequest:v12 completion:v17];
}

+ (id)connectionForStore:(id)a3
{
  id v3 = [a3 scope];
  if (v3 == (id)1)
  {
    id v3 = +[DMFConnection systemConnection];
  }
  else if (!v3)
  {
    id v3 = +[DMFConnection currentUserConnection];
  }

  return v3;
}

+ (id)appStatusForApp:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bundleIdentifier];
  v6 = [v4 displayName];
  v7 = [v4 externalVersionIdentifier];
  id v8 = [v7 stringValue];
  id v9 = [v4 version];
  id v10 = [v4 shortVersion];
  v11 = [v4 managementInformation];

  v12 = objc_msgSend(a1, "stringForAppState:", objc_msgSend(v11, "state"));
  v13 = +[RMModelStatusMDMApp buildWithIdentifier:v5 removed:0 name:v6 externalVersionId:v8 version:v9 shortVersion:v10 state:v12];

  return v13;
}

+ (id)stringForAppState:(unint64_t)a3
{
  if (a3 > 0x12) {
    id v3 = (id *)&RMModelStatusMDMApp_State_unknown;
  }
  else {
    id v3 = (id *)*(&off_1000041C8 + a3);
  }
  return *v3;
}

@end