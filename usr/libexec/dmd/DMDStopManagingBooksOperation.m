@interface DMDStopManagingBooksOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDStopManagingBooksOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D32F0;
}

- (void)runWithRequest:(id)a3
{
  v4 = +[DMDPowerAssertion assertionForOperation:@"DMDStopManagingBooksOperation: run"];
  if (MCHasMDMMigrated())
  {
    v5 = +[DMDManagedMediaManager sharedManager];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100072B00;
    v6[3] = &unk_1000CA508;
    v6[4] = self;
    [v5 uprootWithAssertion:v4 completionBlock:v6];
  }
  else
  {
    [(DMDTaskOperation *)self endOperationWithDMFErrorCode:1650];
  }
}

@end