@interface DMDFetchRestrictionsOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchRestrictionsOperation

+ (id)whitelistedClassesForRequest
{
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:v5 count:2];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000D2DF8;
}

- (void)runWithRequest:(id)a3
{
  id v8 = +[MCRestrictionManager sharedManager];
  v4 = [v8 currentRestrictions];
  v5 = [v8 defaultRestrictions];
  v6 = +[MCRestrictionManager filterRestrictionDictionary:v4 toIncludeOnlyRestrictionsThatDifferFromRestrictions:v5];

  id v7 = [objc_alloc((Class)DMFFetchRestrictionsResultObject) initWithRestrictions:v6];
  [(DMDFetchRestrictionsOperation *)self endOperationWithResultObject:v7];
}

@end