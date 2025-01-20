@interface FTBannerEngagementDescriptor
+ (id)engagementDescriptorWithTargetURL:(id)a3;
- (FTBannerEngagementDescriptor)init;
@end

@implementation FTBannerEngagementDescriptor

- (FTBannerEngagementDescriptor)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTBannerEngagementDescriptor init]";
    __int16 v7 = 2080;
    v8 = "FTBannerEngagementDescriptor.m";
    __int16 v9 = 1024;
    int v10 = 18;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FTBannerEngagementDescriptor init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

+ (id)engagementDescriptorWithTargetURL:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015AE8;
  v7[3] = &unk_1000FB7D8;
  id v8 = a3;
  id v3 = v8;
  id v4 = objc_retainBlock(v7);
  v5 = [[FTOpenArbitraryURLEngagementDescriptor alloc] initWithURL:v3 engagementReporter:v4];

  return v5;
}

@end