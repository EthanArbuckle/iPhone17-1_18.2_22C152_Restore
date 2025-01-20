@interface DMDSetMaximumResidentUsersOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDSetMaximumResidentUsersOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3248;
}

- (void)runWithRequest:(id)a3
{
  CFStringRef v4 = (const __CFString *)kMCMaximumResidentUsersKey;
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 count]);
  CFStringRef v6 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  CFPreferencesSetAppValue(v4, v5, kMCNotBackedUpPreferencesDomain);
  CFPreferencesAppSynchronize(v6);

  [(DMDSetMaximumResidentUsersOperation *)self endOperationWithResultObject:0];
}

@end