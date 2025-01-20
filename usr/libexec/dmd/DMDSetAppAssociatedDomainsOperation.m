@interface DMDSetAppAssociatedDomainsOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDSetAppAssociatedDomainsOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3140;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[DMDAppController sharedController];
  v9 = [v7 associatedDomains];

  id v13 = 0;
  unsigned int v10 = [v8 setAssociatedDomains:v9 forBundleIdentifier:v6 error:&v13];

  id v11 = v13;
  if (v10)
  {
    v12 = +[DMDAppController sharedController];
    [v12 sendManagedAppsChangedNotification];

    [(DMDSetAppAssociatedDomainsOperation *)self endOperationWithResultObject:0];
  }
  else
  {
    [(DMDSetAppAssociatedDomainsOperation *)self endOperationWithError:v11];
  }
}

@end