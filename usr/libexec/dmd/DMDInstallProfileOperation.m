@interface DMDInstallProfileOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)_installInteractiveProfile:(id)a3;
- (void)_installSilentProfileData:(id)a3 managingProfileIdentifier:(id)a4 personaID:(id)a5;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDInstallProfileOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2EB8;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___DMDInstallProfileOperation;
  if (!objc_msgSendSuper2(&v15, "validateRequest:error:", v6, a4)) {
    goto LABEL_11;
  }
  v7 = [v6 profileData];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_12;
    }
    uint64_t v18 = DMFInvalidParameterErrorKey;
    CFStringRef v19 = @"request.profileData";
    v11 = &v19;
    v12 = &v18;
    goto LABEL_10;
  }
  uint64_t v8 = [v6 managingProfileIdentifier];
  if (v8)
  {
    v9 = (void *)v8;
    id v10 = [v6 style];

    if (v10 != (id)1)
    {
      if (!a4) {
        goto LABEL_12;
      }
      uint64_t v16 = DMFInvalidParameterErrorKey;
      CFStringRef v17 = @"request.managingProfileIdentifier";
      v11 = &v17;
      v12 = &v16;
LABEL_10:
      v13 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v12 count:1];
      DMFErrorWithCodeAndUserInfo();
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
      LOBYTE(a4) = 0;
      goto LABEL_12;
    }
  }
  LOBYTE(a4) = 1;
LABEL_12:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  id v10 = a3;
  v4 = [v10 profileData];
  v5 = [v10 managingProfileIdentifier];
  id v6 = +[MCHacks sharedHacks];
  unsigned int v7 = [v6 isSetupBuddyDone];

  id v8 = [v10 style];
  if (v8 != (id)2)
  {
    if (v8 == (id)1) {
      goto LABEL_6;
    }
    if (v8) {
      goto LABEL_10;
    }
    if (!v7 || getuid() == 502)
    {
LABEL_6:
      v9 = [v10 personaID];
      [(DMDInstallProfileOperation *)self _installSilentProfileData:v4 managingProfileIdentifier:v5 personaID:v9];

      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (v7)
  {
LABEL_8:
    [(DMDInstallProfileOperation *)self _installInteractiveProfile:v4];
    goto LABEL_10;
  }
  [(DMDTaskOperation *)self endOperationWithDMFErrorCode:2001];
LABEL_10:
}

- (void)_installSilentProfileData:(id)a3 managingProfileIdentifier:(id)a4 personaID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = +[MCProfileConnection sharedConnection];
  v12 = [(DMDTaskOperation *)self context];
  if ([v12 runAsUser])
  {

LABEL_4:
    uint64_t v15 = 2;
    goto LABEL_6;
  }
  v13 = [(DMDInstallProfileOperation *)self request];
  id v14 = [v13 type];

  if (v14 == (id)1) {
    goto LABEL_4;
  }
  uint64_t v15 = 1;
LABEL_6:
  uint64_t v27 = kMCInstallProfileOptionInstallationType;
  uint64_t v16 = +[NSNumber numberWithInteger:v15];
  v28 = v16;
  CFStringRef v17 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v18 = [v17 mutableCopy];

  if (v8)
  {
    [v18 setObject:&__kCFBooleanTrue forKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
    [v18 setObject:v8 forKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
  }
  if (v9) {
    [v18 setObject:v9 forKeyedSubscript:kMDMPersonaKey];
  }
  id v19 = [v18 copy];
  id v24 = 0;
  v20 = [v11 installProfileData:v10 options:v19 outError:&v24];

  id v21 = v24;
  if (v20)
  {
    [(DMDInstallProfileOperation *)self endOperationWithResultObject:0];
  }
  else
  {
    if (v21)
    {
      NSErrorUserInfoKey v25 = NSUnderlyingErrorKey;
      id v26 = v21;
      v22 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      v23 = DMFErrorWithCodeAndUserInfo();
      [(DMDInstallProfileOperation *)self endOperationWithError:v23];
    }
    else
    {
      v22 = DMFErrorWithCodeAndUserInfo();
      [(DMDInstallProfileOperation *)self endOperationWithError:v22];
    }
  }
}

- (void)_installInteractiveProfile:(id)a3
{
  id v4 = a3;
  id v16 = 0;
  v5 = +[MCProfile profileWithData:v4 outError:&v16];
  id v6 = v16;
  unsigned int v7 = v6;
  if (v5)
  {
    id v8 = +[MCProfileConnection sharedConnection];
    if ([v8 mustInstallProfileNonInteractively:v5])
    {
      [(DMDTaskOperation *)self endOperationWithDMFErrorCode:2000];
    }
    else
    {
      id v15 = v7;
      id v11 = [v8 queueFileDataForAcceptance:v4 originalFileName:0 outError:&v15];
      id v12 = v15;

      if (v12)
      {
        NSErrorUserInfoKey v17 = NSUnderlyingErrorKey;
        id v18 = v12;
        v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        id v14 = DMFErrorWithCodeAndUserInfo();
        [(DMDInstallProfileOperation *)self endOperationWithError:v14];
      }
      else
      {
        [(DMDInstallProfileOperation *)self endOperationWithResultObject:0];
      }
    }
    unsigned int v7 = v8;
  }
  else if (v6)
  {
    NSErrorUserInfoKey v19 = NSUnderlyingErrorKey;
    id v20 = v6;
    id v9 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v10 = DMFErrorWithCodeAndUserInfo();
    [(DMDInstallProfileOperation *)self endOperationWithError:v10];
  }
  else
  {
    unsigned int v7 = DMFErrorWithCodeAndUserInfo();
    [(DMDInstallProfileOperation *)self endOperationWithError:v7];
  }
}

@end