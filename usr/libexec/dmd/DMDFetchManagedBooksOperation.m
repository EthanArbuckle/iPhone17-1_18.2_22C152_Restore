@interface DMDFetchManagedBooksOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchManagedBooksOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2D68;
}

- (void)runWithRequest:(id)a3
{
  v4 = +[DMDPowerAssertion assertionForOperation:@"DMDFetchManagedBooksOperation: run"];
  if (MCHasMDMMigrated())
  {
    +[DMDManagedMediaManager sharedManager];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004BC70;
    v6[3] = &unk_1000C9BE0;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = self;
    id v5 = v7;
    [v5 cleanUpWithAssertion:v4 completionBlock:v6];
  }
  else
  {
    [(DMDTaskOperation *)self endOperationWithDMFErrorCode:1650];
  }
}

@end