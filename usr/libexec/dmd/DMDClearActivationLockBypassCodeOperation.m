@interface DMDClearActivationLockBypassCodeOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDClearActivationLockBypassCodeOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2AC8;
}

- (void)runWithRequest:(id)a3
{
  +[MCCrypto clearStoredActivationLockBypassCode];

  [(DMDClearActivationLockBypassCodeOperation *)self endOperationWithResultObject:0];
}

@end