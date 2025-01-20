@interface NDOFollowUpRefresh
+ (id)nextFollowUpRefreshDateWithDevicesInfo:(id)a3 isInitialCall:(BOOL)a4;
- (BOOL)requiresNetwork;
- (NSString)identifier;
- (NSString)uuid;
- (void)performActivityForScheduler:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation NDOFollowUpRefresh

- (NSString)uuid
{
  return 0;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.ndoagent.followuprefresh";
}

- (BOOL)requiresNetwork
{
  return 0;
}

- (void)performActivityForScheduler:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  v6 = [[NDOAgent alloc] initWithCallingProcessBundleID:@"com.apple.ndoagent.followuprefresh"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FF58;
  v8[3] = &unk_10001CC90;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(NDOAgent *)v6 getAllFUPEligibleDeviceInfosUsingPolicy:1 updateFollowUps:0 withReply:v8];
}

+ (id)nextFollowUpRefreshDateWithDevicesInfo:(id)a3 isInitialCall:(BOOL)a4
{
  id v5 = a3;
  v6 = +[NSUserDefaults standardUserDefaults];
  id v7 = [v6 objectForKey:@"OneDayInterval"];
  [v7 doubleValue];
  double v9 = v8;

  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100010344;
  v19 = sub_100010354;
  id v20 = 0;
  if (!a4)
  {
    uint64_t v10 = +[NSDate dateWithTimeIntervalSinceNow:v9];
    v11 = (void *)v16[5];
    v16[5] = v10;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001035C;
  v14[3] = &unk_10001CCB8;
  *(double *)&v14[5] = v9;
  v14[4] = &v15;
  [v5 enumerateObjectsUsingBlock:v14];
  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

@end