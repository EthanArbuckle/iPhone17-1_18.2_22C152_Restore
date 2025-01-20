@interface DMDRemoveProvisioningProfileOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRemoveProvisioningProfileOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3098;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___DMDRemoveProvisioningProfileOperation;
  if (!objc_msgSendSuper2(&v13, "validateRequest:error:", v6, a4)) {
    goto LABEL_10;
  }
  v7 = [v6 profileIdentifier];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v16 = DMFInvalidParameterErrorKey;
    CFStringRef v17 = @"request.profileIdentifier";
    v9 = &v17;
    v10 = &v16;
    goto LABEL_9;
  }
  v8 = [v6 managingProfileIdentifier];

  if (!v8)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v14 = DMFInvalidParameterErrorKey;
    CFStringRef v15 = @"request.managingProfileIdentifier";
    v9 = &v15;
    v10 = &v14;
LABEL_9:
    v11 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v10 count:1];
    DMFErrorWithCodeAndUserInfo();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    LOBYTE(a4) = 0;
    goto LABEL_11;
  }
  LOBYTE(a4) = 1;
LABEL_11:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 profileIdentifier];
  id v6 = +[MCDependencyReader sharedReader];
  v7 = [v4 managingProfileIdentifier];

  v8 = [v6 dependentsOfParent:v7 inDomain:kMCDMManagingProfileToProvisioningProfileKey];

  if ([v8 containsObject:v5])
  {
    v9 = +[MCProfileConnection sharedConnection];
    id v14 = 0;
    unsigned int v10 = [v9 removeProvisioningProfileWithUUID:v5 outError:&v14];
    id v11 = v14;

    if (v10)
    {
      [(DMDRemoveProvisioningProfileOperation *)self endOperationWithResultObject:0];
    }
    else
    {
      if (v11)
      {
        NSErrorUserInfoKey v15 = NSUnderlyingErrorKey;
        id v16 = v11;
        v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
        objc_super v13 = DMFErrorWithCodeAndUserInfo();
        [(DMDRemoveProvisioningProfileOperation *)self endOperationWithError:v13];
      }
      else
      {
        v12 = DMFErrorWithCodeAndUserInfo();
        [(DMDRemoveProvisioningProfileOperation *)self endOperationWithError:v12];
      }
    }
  }
  else
  {
    [(DMDTaskOperation *)self endOperationWithDMFErrorCode:1201];
  }
}

@end