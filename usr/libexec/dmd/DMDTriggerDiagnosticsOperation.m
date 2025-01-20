@interface DMDTriggerDiagnosticsOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDTriggerDiagnosticsOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3308;
}

- (void)runWithRequest:(id)a3
{
  v4 = +[DMDPowerAssertion assertionForOperation:@"DMDTriggerDiagnosticsOperation: run"];
  v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000770C4;
  v7[3] = &unk_1000C9BE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

@end