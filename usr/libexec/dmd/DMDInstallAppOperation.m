@interface DMDInstallAppOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)appIdentityForBundleIdentifier:(id)a3 persona:(id)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)appCoordinatorExistsForBundleIdentifier:(id)a3 persona:(id)a4;
- (DMDAppMetadata)metadata;
- (void)_resumeInstallationForRequest:(id)a3;
- (void)_runWithRequest:(id)a3;
- (void)installAppForRequest:(id)a3;
- (void)runWithRequest:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation DMDInstallAppOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___DMDInstallAppOperation;
  if (!objc_msgSendSuper2(&v12, "validateRequest:error:", v6, a4)) {
    goto LABEL_7;
  }
  uint64_t v7 = [v6 storeItemIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [v6 licenseType];

    if (!v9)
    {
      if (!a4) {
        goto LABEL_8;
      }
      uint64_t v13 = DMFInvalidParameterErrorKey;
      CFStringRef v14 = @"request.licenseType";
      v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      DMFErrorWithCodeAndUserInfo();
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      LOBYTE(a4) = 0;
      goto LABEL_8;
    }
  }
  LOBYTE(a4) = 1;
LABEL_8:

  return (char)a4;
}

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2E70;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = +[DMDAppController sharedController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004D6D4;
  v7[3] = &unk_1000CB228;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getMetadataForAppRequest:v6 completion:v7];
}

- (BOOL)appCoordinatorExistsForBundleIdentifier:(id)a3 persona:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() appIdentityForBundleIdentifier:v6 persona:v5];

  id v15 = 0;
  id v8 = +[IXAppInstallCoordinator existingCoordinatorForAppWithIdentity:v7 error:&v15];
  id v9 = v15;
  v10 = v9;
  if (v8) {
    goto LABEL_2;
  }
  objc_super v12 = [v9 domain];
  unsigned int v13 = [v12 isEqualToString:IXErrorDomain];

  if (!v13)
  {
LABEL_7:
    BOOL v11 = 0;
    goto LABEL_8;
  }
  if ([v10 code] != (id)48)
  {
    if ([v10 code] != (id)46) {
      [v10 code];
    }
    goto LABEL_7;
  }
LABEL_2:
  BOOL v11 = 1;
LABEL_8:

  return v11;
}

+ (id)appIdentityForBundleIdentifier:(id)a3 persona:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)IXApplicationIdentity);
  if (v5) {
    id v8 = [v7 initWithBundleIdentifier:v6 personaUniqueString:v5];
  }
  else {
    id v8 = [v7 initWithBundleIdentifier:v6];
  }
  id v9 = v8;

  return v9;
}

- (void)installAppForRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[DMDAppController sharedController];
  id v6 = [v4 manifestURL];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004DB98;
  v11[3] = &unk_1000CADD0;
  v11[4] = self;
  id v7 = objc_retainBlock(v11);
  id v8 = DMFAppLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      v10 = [v6 host];
      *(_DWORD *)buf = 138543362;
      id v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Start installing enterprise app with manifest URL from: %{public}@", buf, 0xCu);
    }
    [v5 startInstallingEnterpriseAppWithManifestURL:v6 completion:v7];
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Start installing non-enterprise app for request: %{public}@", buf, 0xCu);
    }

    [v5 startInstallingNonEnterpriseAppForRequest:v4 completion:v7];
  }
}

- (void)_runWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(DMDInstallAppOperation *)self metadata];
  id v6 = [v5 lifeCycle];
  id v7 = (char *)[v6 currentState];

  if ((unint64_t)(v7 - 4) < 4)
  {
    uint64_t v12 = DMFBundleIdentifierErrorKey;
    id v8 = [(DMDInstallAppOperation *)self metadata];
    BOOL v9 = [v8 bundleIdentifier];
    id v13 = v9;
    v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
LABEL_5:
    BOOL v11 = DMFErrorWithCodeAndUserInfo();
    [(DMDInstallAppOperation *)self endOperationWithError:v11];

    goto LABEL_6;
  }
  if ((unint64_t)(v7 - 1) < 2)
  {
    uint64_t v14 = DMFBundleIdentifierErrorKey;
    id v8 = [(DMDInstallAppOperation *)self metadata];
    BOOL v9 = [v8 bundleIdentifier];
    id v15 = v9;
    v10 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    goto LABEL_5;
  }
  if (v7 == (char *)3) {
    [(DMDInstallAppOperation *)self _resumeInstallationForRequest:v4];
  }
  else {
    [(DMDInstallAppOperation *)self installAppForRequest:v4];
  }
LABEL_6:
}

- (void)_resumeInstallationForRequest:(id)a3
{
  id v4 = [(DMDInstallAppOperation *)self metadata];
  id v5 = [v4 bundleIdentifier];

  id v6 = +[DMDAppController sharedController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004DE18;
  v7[3] = &unk_1000CADD0;
  v7[4] = self;
  [v6 resumeAppInstallationWithBundleIdentifier:v5 completion:v7];
}

- (DMDAppMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end