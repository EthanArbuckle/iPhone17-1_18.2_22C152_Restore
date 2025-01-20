@interface DMDFetchDMDStateOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchDMDStateOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2D38;
}

- (void)runWithRequest:(id)a3
{
  v4 = +[DMDServer sharedServer];
  v5 = +[DMDAppController sharedController];
  id v7 = +[NSString stringWithFormat:@"Server:\n%@\nApps:\n%@", v4, v5];

  id v6 = [objc_alloc((Class)DMFFetchDMDStateResultObject) initWithStateDescription:v7];
  [(DMDFetchDMDStateOperation *)self endOperationWithResultObject:v6];
}

@end