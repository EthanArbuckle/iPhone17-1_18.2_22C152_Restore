@interface APPCPolicyFormatDaemon
+ (BOOL)storeAdPolicies:(id)a3;
+ (id)adPolicies;
@end

@implementation APPCPolicyFormatDaemon

+ (BOOL)storeAdPolicies:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"a/p/"];
  if ([v3 count])
  {
    uint64_t v9 = 0;
    v5 = (id *)&v9;
    [v4 storeObject:v3 atPath:@"APAdPolicy" error:&v9];
  }
  else
  {
    uint64_t v10 = 0;
    v5 = (id *)&v10;
    [v4 removeObjectAtPath:@"APAdPolicy" error:&v10];
  }
  id v6 = *v5;
  if (v6)
  {
    v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error storing EFS Settings object for policy: %{public}@", buf, 0xCu);
    }
  }
  return v6 == 0;
}

+ (id)adPolicies
{
  id v2 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"a/p/"];
  id v3 = +[NSSet setWithObject:objc_opt_class()];
  +[APSupportedSecureEncodedClass addClasses:v3];
  id v11 = 0;
  unsigned int v4 = [v2 fileExistsAtPath:@"APAdPolicy" error:&v11];
  id v5 = v11;
  if (v5)
  {
    id v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error finding EFS Settings object for policy: %{public}@", buf, 0xCu);
    }
  }
  if (v4)
  {
    id v10 = v5;
    v7 = [v2 objectStoredAtPath:@"APAdPolicy" error:&v10];
    id v8 = v10;

    id v5 = v8;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end