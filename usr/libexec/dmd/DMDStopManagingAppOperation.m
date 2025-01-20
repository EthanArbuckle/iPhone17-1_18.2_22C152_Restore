@interface DMDStopManagingAppOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDStopManagingAppOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D32D8;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a4;
  v6 = +[DMDAppController sharedController];
  v7 = [v6 managementInformationForBundleIdentifier:v5];

  v8 = +[DMDAppController sharedController];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000725FC;
  v11[3] = &unk_1000CB748;
  id v12 = v5;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v5;
  [v8 setRemovability:0 forBundleIdentifier:v10 completion:v11];
}

@end