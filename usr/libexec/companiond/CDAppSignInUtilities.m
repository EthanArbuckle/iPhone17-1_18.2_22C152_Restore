@interface CDAppSignInUtilities
+ (id)credentialRequestFromClientAuthenticationContext:(id)a3;
+ (void)allWebCredentialsDomainsForApplicationIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)approvedWebCredentialsDomainsForApplicationIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)canPerformAuthKitRequest:(id)a3 withAuthKitAccount:(id)a4 clientBundleIdentifier:(id)a5 completionHandler:(id)a6;
+ (void)preparePasskeyRequestsWithRequest:(id)a3 applicationIdentifier:(id)a4 approvedWebCredentialsDomains:(id)a5 completionHandler:(id)a6;
+ (void)sendSessionActivatedMetricsWithRequest:(id)a3 approvedAssociatedDomains:(id)a4;
+ (void)sendSessionCompletedMetricsWithError:(id)a3;
@end

@implementation CDAppSignInUtilities

+ (void)approvedWebCredentialsDomainsForApplicationIdentifier:(id)a3 completionHandler:(id)a4
{
}

+ (void)allWebCredentialsDomainsForApplicationIdentifier:(id)a3 completionHandler:(id)a4
{
}

+ (void)canPerformAuthKitRequest:(id)a3 withAuthKitAccount:(id)a4 clientBundleIdentifier:(id)a5 completionHandler:(id)a6
{
}

+ (void)sendSessionActivatedMetricsWithRequest:(id)a3 approvedAssociatedDomains:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2810000000;
  v16 = &unk_10002CEFF;
  char v17 = 0;
  v7 = [v5 appleIDRequest];

  if (v7) {
    *((unsigned char *)v14 + 32) |= 1u;
  }
  v8 = [v5 passwordRequest];

  if (v8) {
    *((unsigned char *)v14 + 32) |= 2u;
  }
  v9 = [v5 customAuthenticationMethods];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001A500;
  v12[3] = &unk_100035000;
  v12[4] = &v13;
  [v9 enumerateObjectsUsingBlock:v12];

  id v10 = [v6 count];
  unsigned int v11 = *((unsigned __int8 *)v14 + 32);
  if (v10)
  {
    v11 |= 0x20u;
    *((unsigned char *)v14 + 32) = v11;
  }
  +[CPSMetrics sendAppSignInSessionActivatedEvent:v11];
  _Block_object_dispose(&v13, 8);
}

+ (void)sendSessionCompletedMetricsWithError:(id)a3
{
  id v7 = a3;
  v3 = CPSErrorGetCustomAuthenticationMethod();
  if (v3)
  {
    uint64_t v4 = CPSMetricsSessionResultWithCustomMethod();
    goto LABEL_8;
  }
  id v5 = [v7 domain];
  if ([v5 isEqualToString:CPSErrorDomain])
  {
    id v6 = [v7 code];

    if (v6 == (id)104)
    {
      uint64_t v4 = 2;
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v4 = 3;
LABEL_8:
  +[CPSMetrics sendAppSignInSessionCompletedEvent:v4];
}

+ (id)credentialRequestFromClientAuthenticationContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 appleIDRequest];
  id v6 = [v4 platformKeyCredentialAssertionOptions];
  id v7 = [v4 platformKeyCredentialRegistrationOptions];
  v8 = sub_10001A8E0((uint64_t)a1, v6, v7);
  v9 = [v4 passwordRequest];
  BOOL v10 = v9 != 0;

  uint64_t v11 = v10 | (2 * (v5 != 0));
  if (v6) {
    v11 |= 8uLL;
  }
  if (v7) {
    uint64_t v12 = v11 | 4;
  }
  else {
    uint64_t v12 = v11;
  }
  id v13 = [objc_alloc((Class)ASCCredentialRequestContext) initWithRequestTypes:v12];
  [v13 setAppleIDAuthorizationRequest:v5];
  [v13 setPlatformKeyCredentialAssertionOptions:v6];
  [v13 setPlatformKeyCredentialCreationOptions:v7];
  v14 = [v4 appIdentifier];
  [v13 setProxiedAppIdentifier:v14];

  uint64_t v15 = [v4 appName];
  [v13 setProxiedAppName:v15];

  v16 = [v4 appDomains];
  [v13 setProxiedAssociatedDomains:v16];

  char v17 = [v4 appBundleIdentifier];
  [v13 setProxiedBundleIdentifier:v17];

  v18 = [v4 appIconData];
  [v13 setProxiedIconData:v18];

  v19 = [v4 appIconScale];
  [v13 setProxiedIconScale:v19];

  v20 = [v4 deviceName];
  [v13 setProxiedOriginDeviceName:v20];

  v21 = [v4 appTeamIdentifier];

  [v13 setProxiedTeamIdentifier:v21];
  [v13 setRelyingPartyIdentifier:v8];

  return v13;
}

+ (void)preparePasskeyRequestsWithRequest:(id)a3 applicationIdentifier:(id)a4 approvedWebCredentialsDomains:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  uint64_t v14 = [v10 platformKeyCredentialAssertionOptions];
  uint64_t v15 = [v10 platformKeyCredentialRegistrationOptions];
  if (!(v14 | v15))
  {
    v27 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"passkeyAssertionOptions || passkeyRegistrationOptions"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10002277C(a2);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10001AD2CLL);
  }
  v16 = (void *)v15;
  if ([v11 length])
  {
    char v17 = sub_10001A8E0((uint64_t)CDAppSignInUtilities, (void *)v14, v16);
    if ([v17 length])
    {
      if ([v12 containsObject:v17])
      {
        v13[2](v13, 0);
      }
      else
      {
        uint64_t v23 = CPSErrorDomain;
        NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
        v24 = +[NSString stringWithFormat:@"Application (%@) is not associated with relying party identifier (%@)", v11, v17];
        v29 = v24;
        v25 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        v26 = +[NSError errorWithDomain:v23 code:205 userInfo:v25];
        ((void (**)(id, void *))v13)[2](v13, v26);
      }
    }
    else
    {
      uint64_t v20 = CPSErrorDomain;
      NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
      CFStringRef v31 = @"Missing relying party identifier";
      v21 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      v22 = +[NSError errorWithDomain:v20 code:205 userInfo:v21];
      ((void (**)(id, void *))v13)[2](v13, v22);
    }
  }
  else
  {
    uint64_t v18 = CPSErrorDomain;
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    CFStringRef v33 = @"Missing application identifier";
    char v17 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    v19 = +[NSError errorWithDomain:v18 code:205 userInfo:v17];
    ((void (**)(id, void *))v13)[2](v13, v19);
  }
}

@end