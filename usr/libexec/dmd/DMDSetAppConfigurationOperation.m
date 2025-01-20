@interface DMDSetAppConfigurationOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDSetAppConfigurationOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3158;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[DMDAppController sharedController];
  v9 = [v7 configuration];

  id v13 = 0;
  unsigned int v10 = [v8 setConfiguration:v9 forBundleIdentifier:v6 error:&v13];

  id v11 = v13;
  if (v10)
  {
    v12 = +[DMDAppController sharedController];
    [v12 sendManagedAppsChangedNotification];

    [(DMDSetAppConfigurationOperation *)self endOperationWithResultObject:0];
  }
  else
  {
    [(DMDSetAppConfigurationOperation *)self endOperationWithError:v11];
  }
}

@end