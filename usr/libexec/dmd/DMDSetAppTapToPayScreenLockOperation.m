@interface DMDSetAppTapToPayScreenLockOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDSetAppTapToPayScreenLockOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3230;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[DMDAppController sharedController];
  v9 = [v7 tapToPayScreenLock];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100070A50;
  v10[3] = &unk_1000CADD0;
  v10[4] = self;
  [v8 setTapToPayScreenLock:v9 forBundleIdentifier:v6 completion:v10];
}

@end