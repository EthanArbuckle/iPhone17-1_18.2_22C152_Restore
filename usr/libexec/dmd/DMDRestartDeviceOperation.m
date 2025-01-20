@interface DMDRestartDeviceOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRestartDeviceOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D30C8;
}

- (void)runWithRequest:(id)a3
{
  id v4 = [objc_alloc((Class)FBSShutdownOptions) initWithReason:@"dmd restart device"];
  [v4 setRebootType:1];
  v3 = +[FBSSystemService sharedService];
  [v3 shutdownWithOptions:v4];
}

@end