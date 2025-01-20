@interface DMDRemoveProfileOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRemoveProfileOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3068;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___DMDRemoveProfileOperation;
  if (!objc_msgSendSuper2(&v10, "validateRequest:error:", v6, a4)) {
    goto LABEL_6;
  }
  v7 = [v6 profileIdentifier];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v11 = DMFInvalidParameterErrorKey;
    CFStringRef v12 = @"request.profileIdentifier";
    v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    DMFErrorWithCodeAndUserInfo();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  LOBYTE(a4) = 1;
LABEL_7:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  v4 = [a3 profileIdentifier];
  v5 = +[MCProfileConnection sharedConnection];
  id v6 = [v5 installedProfileWithIdentifier:v4];

  if (v6)
  {
    v7 = [(DMDTaskOperation *)self context];
    if ([v7 runAsUser])
    {
    }
    else
    {
      objc_super v10 = [(DMDRemoveProfileOperation *)self request];
      id v11 = [v10 type];

      if (v11 != (id)1)
      {
        uint64_t v12 = 1;
        goto LABEL_8;
      }
    }
    uint64_t v12 = 2;
LABEL_8:
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006DBF8;
    v13[3] = &unk_1000CADD0;
    v13[4] = self;
    [(DMDRemoveProfileOperation *)self removeProfileWithIdentifier:v4 installationType:v12 completion:v13];
    goto LABEL_9;
  }
  uint64_t v14 = DMFProfileIdentifierErrorKey;
  v15 = v4;
  v8 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v9 = DMFErrorWithCodeAndUserInfo();
  [(DMDRemoveProfileOperation *)self endOperationWithError:v9];

LABEL_9:
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[MCProfileConnection sharedConnection];
  [v9 removeProfileAsyncWithIdentifier:v8 installationType:a4 completion:v7];
}

@end