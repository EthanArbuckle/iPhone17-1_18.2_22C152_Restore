@interface DMDInstallProvisioningProfileOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDInstallProvisioningProfileOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2ED0;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___DMDInstallProvisioningProfileOperation;
  if (!objc_msgSendSuper2(&v10, "validateRequest:error:", v6, a4)) {
    goto LABEL_6;
  }
  v7 = [v6 profileData];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v11 = DMFInvalidParameterErrorKey;
    CFStringRef v12 = @"request.profileData";
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
  id v4 = a3;
  v5 = +[MCProfileConnection sharedConnection];
  id v6 = [v4 profileData];
  v7 = [v4 managingProfileIdentifier];

  id v11 = 0;
  LODWORD(v4) = [v5 installProvisioningProfileData:v6 managingProfileIdentifier:v7 outError:&v11];
  id v8 = v11;

  if (v4)
  {
    [(DMDInstallProvisioningProfileOperation *)self endOperationWithResultObject:0];
  }
  else
  {
    if (v8)
    {
      NSErrorUserInfoKey v12 = NSUnderlyingErrorKey;
      id v13 = v8;
      v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      objc_super v10 = DMFErrorWithCodeAndUserInfo();
      [(DMDInstallProvisioningProfileOperation *)self endOperationWithError:v10];
    }
    else
    {
      v9 = DMFErrorWithCodeAndUserInfo();
      [(DMDInstallProvisioningProfileOperation *)self endOperationWithError:v9];
    }
  }
}

@end