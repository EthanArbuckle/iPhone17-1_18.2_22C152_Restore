@interface DMDLogOutUserOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDLogOutUserOperation

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
  return &off_1000D2F18;
}

- (void)runWithRequest:(id)a3
{
  v4 = +[UMUserManager sharedManager];
  v5 = [v4 currentUser];
  unsigned int v6 = [v5 isLoginUser];

  if (v6)
  {
    v7 = DMFErrorWithCodeAndUserInfo();
    [(DMDLogOutUserOperation *)self endOperationWithError:v7];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005217C;
    v8[3] = &unk_1000CADD0;
    v8[4] = self;
    [v4 switchToLoginUserWithCompletionHandler:v8];
  }
}

@end