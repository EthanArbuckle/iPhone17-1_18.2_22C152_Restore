@interface DMDSetDiagnosticSubmissionEnabledOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDSetDiagnosticSubmissionEnabledOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3200;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = +[MCProfileConnection sharedConnection];
  id v6 = [v4 enabled];

  [v5 setBoolValue:v6 forSetting:MCFeatureDiagnosticsSubmissionAllowed];

  [(DMDSetDiagnosticSubmissionEnabledOperation *)self endOperationWithResultObject:0];
}

@end