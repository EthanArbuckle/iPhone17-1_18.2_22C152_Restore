@interface DMDCreateConfigurationOrganizationOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDCreateConfigurationOrganizationOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2BB8;
}

- (unint64_t)queueGroup
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [(DMDTaskOperation *)self configurationEngine];

  if (v5)
  {
    v6 = [(DMDTaskOperation *)self configurationEngine];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100039284;
    v7[3] = &unk_1000CADD0;
    v7[4] = self;
    [v6 handleCreateConfigurationOrganizationRequest:v4 completionHandler:v7];
  }
  else
  {
    v6 = DMFErrorWithCodeAndUserInfo();
    [(DMDCreateConfigurationOrganizationOperation *)self endOperationWithError:v6];
  }
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___DMDCreateConfigurationOrganizationOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4)) {
    goto LABEL_13;
  }
  v7 = [v6 organizationIdentifier];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v19 = DMFInvalidParameterErrorKey;
    CFStringRef v20 = @"request.organizationIdentifier";
    v10 = &v20;
    v11 = &v19;
    goto LABEL_12;
  }
  v8 = [v6 organizationDisplayName];

  if (!v8)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v17 = DMFInvalidParameterErrorKey;
    CFStringRef v18 = @"request.organizationDisplayName";
    v10 = &v18;
    v11 = &v17;
    goto LABEL_12;
  }
  v9 = [v6 organizationType];

  if (!v9)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v15 = DMFInvalidParameterErrorKey;
    CFStringRef v16 = @"request.organizationType";
    v10 = &v16;
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