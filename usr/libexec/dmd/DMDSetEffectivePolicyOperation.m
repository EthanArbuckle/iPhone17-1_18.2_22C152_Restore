@interface DMDSetEffectivePolicyOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDSetEffectivePolicyOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &__NSArray0__struct;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [(DMDTaskOperation *)self configurationEngine];
  v6 = [v5 policyPersistence];
  id v7 = [v4 policy];
  v8 = [v4 type];
  v9 = [v4 identifiers];
  id v10 = [v4 priority];
  v11 = [v4 organizationIdentifier];
  v12 = [v4 declarationIdentifier];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100070618;
  v13[3] = &unk_1000CADD0;
  v13[4] = self;
  [v6 setEffectivePolicy:v7 forType:v8 identifiers:v9 priority:v10 organizationIdentifier:v11 declarationIdentifier:v12 completionHandler:v13];
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___DMDSetEffectivePolicyOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4)) {
    goto LABEL_13;
  }
  id v7 = [v6 organizationIdentifier];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v19 = DMFInvalidParameterErrorKey;
    CFStringRef v20 = @"request.organizationIdentifier";
    id v10 = &v20;
    v11 = &v19;
    goto LABEL_12;
  }
  v8 = [v6 declarationIdentifier];

  if (!v8)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v17 = DMFInvalidParameterErrorKey;
    CFStringRef v18 = @"request.declarationIdentifier";
    id v10 = &v18;
    v11 = &v17;
    goto LABEL_12;
  }
  v9 = [v6 type];

  if (!v9)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v15 = DMFInvalidParameterErrorKey;
    CFStringRef v16 = @"request.type";
    id v10 = &v16;
    v11 = &v15;
LABEL_12:
    v12 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:1];
    DMFErrorWithCodeAndUserInfo();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
    LOBYTE(a4) = 0;
    goto LABEL_14;
  }
  LOBYTE(a4) = 1;
LABEL_14:

  return (char)a4;
}

@end