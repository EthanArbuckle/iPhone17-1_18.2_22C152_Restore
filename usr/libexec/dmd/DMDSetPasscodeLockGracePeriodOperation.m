@interface DMDSetPasscodeLockGracePeriodOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDSetPasscodeLockGracePeriodOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3260;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = +[MCProfileConnection sharedConnection];
  [v4 seconds];
  double v7 = v6;

  v8 = +[NSNumber numberWithDouble:v7];
  [v5 setValue:v8 forSetting:MCFeaturePasscodeLockGraceTime];

  [(DMDSetPasscodeLockGracePeriodOperation *)self endOperationWithResultObject:0];
}

@end