@interface DMDFetchActivationLockBypassCodeOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchActivationLockBypassCodeOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2C60;
}

- (void)runWithRequest:(id)a3
{
  v4 = +[MCProfileConnection sharedConnection];
  id v9 = 0;
  v5 = [v4 fetchActivationLockBypassKeyWithError:&v9];
  id v6 = v9;

  if (v5)
  {
    id v7 = [objc_alloc((Class)DMFFetchActivationLockBypassCodeResultObject) initWithBypassCode:v5];
    [(DMDFetchActivationLockBypassCodeOperation *)self endOperationWithResultObject:v7];
  }
  else if (v6)
  {
    NSErrorUserInfoKey v10 = NSUnderlyingErrorKey;
    id v11 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v8 = DMFErrorWithCodeAndUserInfo();
    [(DMDFetchActivationLockBypassCodeOperation *)self endOperationWithError:v8];
  }
  else
  {
    DMFErrorWithCodeAndUserInfo();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(DMDFetchActivationLockBypassCodeOperation *)self endOperationWithError:v7];
  }
}

@end