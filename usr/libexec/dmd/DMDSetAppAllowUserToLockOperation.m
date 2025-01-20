@interface DMDSetAppAllowUserToLockOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDSetAppAllowUserToLockOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2DE0;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[DMDAppController sharedController];
  v9 = [v7 allowUserToLock];

  id v13 = 0;
  unsigned __int8 v10 = [v8 setAllowUserToLock:v9 forBundleIdentifier:v6 error:&v13];

  id v11 = v13;
  if (v10)
  {
    [(DMDSetAppAllowUserToLockOperation *)self endOperationWithResultObject:0];
  }
  else
  {
    v12 = +[DMDAppController sharedController];
    [v12 sendManagedAppsChangedNotification];

    [(DMDSetAppAllowUserToLockOperation *)self endOperationWithError:v11];
  }
}

@end