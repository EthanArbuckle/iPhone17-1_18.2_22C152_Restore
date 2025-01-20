@interface DMDStopAirPlayMirroringOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDStopAirPlayMirroringOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D32C0;
}

- (void)runWithRequest:(id)a3
{
  v4 = +[DMDAirPlayManager shared];
  id v9 = 0;
  unsigned __int8 v5 = [v4 stopAirPlaySessionOfType:3 error:&v9];
  id v6 = v9;

  if (v5)
  {
    [(DMDStopAirPlayMirroringOperation *)self endOperationWithResultObject:0];
  }
  else
  {
    if (v6)
    {
      NSErrorUserInfoKey v10 = NSUnderlyingErrorKey;
      id v11 = v6;
      v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      v8 = DMFErrorWithCodeAndUserInfo();
      [(DMDStopAirPlayMirroringOperation *)self endOperationWithError:v8];
    }
    else
    {
      v7 = DMFErrorWithCodeAndUserInfo();
      [(DMDStopAirPlayMirroringOperation *)self endOperationWithError:v7];
    }
  }
}

@end