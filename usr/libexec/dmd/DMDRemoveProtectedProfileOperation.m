@interface DMDRemoveProtectedProfileOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5;
@end

@implementation DMDRemoveProtectedProfileOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3080;
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[MCProfileConnection sharedConnection];
  [v9 removeProtectedProfileAsyncWithIdentifier:v8 installationType:a4 completion:v7];
}

@end