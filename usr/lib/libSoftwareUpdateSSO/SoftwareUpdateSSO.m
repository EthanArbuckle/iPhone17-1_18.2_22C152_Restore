@interface SoftwareUpdateSSO
- (BOOL)callerHasRequiredEntitlements;
- (BOOL)ssoIsSupported;
- (NSDictionary)defaultAuthParameters;
- (NSString)appIdentifier;
- (NSString)dawToken;
- (NSString)envIdentifier;
- (NSString)interactivityLevel;
- (NSString)personID;
- (NSString)userName;
- (SoftwareUpdateExtensibleSSOAuthenticator)authenticator;
- (SoftwareUpdateSSO)initWithOptions:(id)a3;
- (id)buildSSOError:(int)a3 underlying:(id)a4 description:(id)a5;
- (id)copyUserInfo;
- (id)getDawToken;
- (id)resultCallBack;
- (void)authenticator:(id)a3 didCompleteWithError:(id)a4;
- (void)authenticator:(id)a3 didCompleteWithResult:(id)a4;
- (void)copyTokenFromAuthenticatorResponse:(id)a3 error:(id)a4;
- (void)setAppIdentifier:(id)a3;
- (void)setAuthenticator:(id)a3;
- (void)setDawToken:(id)a3;
- (void)setDefaultAuthParameters:(id)a3;
- (void)setEnvIdentifier:(id)a3;
- (void)setInteractivityLevel:(id)a3;
- (void)setPersonID:(id)a3;
- (void)setResultCallBack:(id)a3;
- (void)setUserName:(id)a3;
- (void)setupAuthenticator;
@end

@implementation SoftwareUpdateSSO

- (id)buildSSOError:(int)a3 underlying:(id)a4 description:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = objc_opt_new();
  v10 = v9;
  if (v9)
  {
    if (v8) {
      [v9 setObject:v8 forKey:*MEMORY[0x263F08320]];
    }
    if (v7) {
      [v10 setObject:v7 forKey:*MEMORY[0x263F08608]];
    }
  }
  v11 = [MEMORY[0x263F087E8] errorWithDomain:@"SoftwareUpdateSSOError" code:a3 userInfo:v10];

  return v11;
}

- (SoftwareUpdateSSO)initWithOptions:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SoftwareUpdateSSO;
  v5 = [(SoftwareUpdateSSO *)&v19 init];
  if (v5)
  {
    v6 = objc_opt_new();
    [(SoftwareUpdateSSO *)v5 setAuthenticator:v6];

    id v7 = [(SoftwareUpdateSSO *)v5 authenticator];
    [v7 setDelegate:v5];

    [(SoftwareUpdateSSO *)v5 setDawToken:0];
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    SoftwareUpdateSSOCompletionSemaphore = v5->SoftwareUpdateSSOCompletionSemaphore;
    v5->SoftwareUpdateSSOCompletionSemaphore = (OS_dispatch_semaphore *)v8;

    if (ssoControllerQueueOnce == -1)
    {
      if (!v4) {
        goto LABEL_14;
      }
    }
    else
    {
      dispatch_once(&ssoControllerQueueOnce, &__block_literal_global_0);
      if (!v4) {
        goto LABEL_14;
      }
    }
    v10 = [v4 objectForKeyedSubscript:@"applicationIdentifier"];
    [(SoftwareUpdateSSO *)v5 setAppIdentifier:v10];

    v11 = [v4 objectForKeyedSubscript:@"environmentIdentifier"];
    [(SoftwareUpdateSSO *)v5 setEnvIdentifier:v11];

    v12 = [v4 objectForKeyedSubscript:@"username"];
    [(SoftwareUpdateSSO *)v5 setUserName:v12];

    v13 = [v4 objectForKeyedSubscript:@"interactivity"];

    if (v13)
    {
      v14 = [v4 objectForKeyedSubscript:@"interactivity"];
      if (([v14 isEqualToString:@"0"] & 1) != 0
        || ([v14 isEqualToString:@"1"] & 1) != 0
        || [v14 isEqualToString:@"2"])
      {
        [(SoftwareUpdateSSO *)v5 setInteractivityLevel:v14];
      }
      else
      {
        v18 = SoftwareUpdateSSOlogError();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v14;
          _os_log_impl(&dword_226EA1000, v18, OS_LOG_TYPE_DEFAULT, "Invalid interactivity level was passed in: %@\n", buf, 0xCu);
        }
      }
    }
    v15 = [(SoftwareUpdateSSO *)v5 interactivityLevel];

    if (!v15)
    {
      v16 = SoftwareUpdateSSOlogInfo();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226EA1000, v16, OS_LOG_TYPE_DEFAULT, "Using default interactivity level(0)\n", buf, 2u);
      }

      [(SoftwareUpdateSSO *)v5 setInteractivityLevel:@"0"];
    }
  }
LABEL_14:

  return v5;
}

void __37__SoftwareUpdateSSO_initWithOptions___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MobileSoftwareUpdate.SoftwareUpdateSSO", v2);
  v1 = (void *)ssoControllerQueue;
  ssoControllerQueue = (uint64_t)v0;
}

- (void)setupAuthenticator
{
  id v7 = [(SoftwareUpdateSSO *)self authenticator];
  v3 = [(SoftwareUpdateSSO *)self appIdentifier];
  [v7 setAppIdentifier:v3];

  id v4 = [(SoftwareUpdateSSO *)self envIdentifier];
  [v7 setEnvIdentifier:v4];

  v5 = [(SoftwareUpdateSSO *)self userName];
  [v7 setUsername:v5];

  v6 = [(SoftwareUpdateSSO *)self interactivityLevel];
  [v7 setInteractivity:v6];

  [v7 setOtherParameters:0];
}

- (void)copyTokenFromAuthenticatorResponse:(id)a3 error:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3)
  {
    id v7 = (void *)[a3 mutableCopy];
    dispatch_semaphore_t v8 = SoftwareUpdateSSOlogInfo();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226EA1000, v8, OS_LOG_TYPE_DEFAULT, "Successfully retrieved response from authenticator\n", buf, 2u);
    }

    id v9 = objc_alloc_init(MEMORY[0x263F08BA0]);
    v10 = [v7 objectForKeyedSubscript:@"otherInfo"];
    [v9 setQuery:v10];

    v11 = [v9 queryItems];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __62__SoftwareUpdateSSO_copyTokenFromAuthenticatorResponse_error___block_invoke;
    v36[3] = &unk_2647EE840;
    v12 = v7;
    v37 = v12;
    [v11 enumerateObjectsUsingBlock:v36];

    v13 = [(SoftwareUpdateSSO *)self authenticator];
    v14 = [v13 otherParameters];
    v15 = [v14 objectForKeyedSubscript:@"DAWRequest"];
    v16 = [MEMORY[0x263EFFA88] stringValue];
    int v17 = [v15 isEqualToString:v16];

    v18 = SoftwareUpdateSSOlogInfo();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226EA1000, v18, OS_LOG_TYPE_DEFAULT, "Attempt to extract DAW token from response\n", buf, 2u);
      }
      v20 = @"dawToken";
    }
    else
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226EA1000, v18, OS_LOG_TYPE_DEFAULT, "Attempting to extract ACMToken from response\n", buf, 2u);
      }
      v20 = @"token";
    }

    v24 = [v12 objectForKeyedSubscript:v20];
    dawToken = self->_dawToken;
    self->_dawToken = v24;

    v26 = [(SoftwareUpdateSSO *)self userName];

    if (!v26)
    {
      v27 = [v12 objectForKeyedSubscript:@"username"];
      [(SoftwareUpdateSSO *)self setUserName:v27];
    }
    v28 = [(SoftwareUpdateSSO *)self personID];

    if (!v28)
    {
      v29 = [v12 objectForKeyedSubscript:@"personId"];
      [(SoftwareUpdateSSO *)self setPersonID:v29];
    }
    v30 = SoftwareUpdateSSOlogError();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [(SoftwareUpdateSSO *)self userName];
      v32 = [(SoftwareUpdateSSO *)self personID];
      if (v32)
      {
        v33 = [(SoftwareUpdateSSO *)self personID];
      }
      else
      {
        v33 = @"Unknown";
      }
      v34 = [(SoftwareUpdateSSO *)self dawToken];
      v35 = @"Valid";
      *(_DWORD *)buf = 138412802;
      v39 = v31;
      __int16 v40 = 2112;
      if (!v34) {
        v35 = @"Not present";
      }
      v41 = v33;
      __int16 v42 = 2112;
      v43 = v35;
      _os_log_impl(&dword_226EA1000, v30, OS_LOG_TYPE_DEFAULT, "Username :%@ personID: %@ token:%@", buf, 0x20u);

      if (v32) {
    }
      }

    uint64_t v22 = v37;
LABEL_28:

    goto LABEL_29;
  }
  v21 = self->_dawToken;
  self->_dawToken = 0;

  if (v6)
  {
    uint64_t v22 = SoftwareUpdateSSOlogError();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [v6 description];
      *(_DWORD *)buf = 138412290;
      v39 = v23;
      _os_log_impl(&dword_226EA1000, v22, OS_LOG_TYPE_DEFAULT, "Failed to retrieve SSO token: %@\n", buf, 0xCu);
    }
    goto LABEL_28;
  }
LABEL_29:
  dispatch_semaphore_signal((dispatch_semaphore_t)self->SoftwareUpdateSSOCompletionSemaphore);
}

void __62__SoftwareUpdateSSO_copyTokenFromAuthenticatorResponse_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 value];
  id v4 = *(void **)(a1 + 32);
  v5 = [v3 name];

  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (BOOL)callerHasRequiredEntitlements
{
  dispatch_assert_queue_V2((dispatch_queue_t)ssoControllerQueue);
  v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  if (v2)
  {
    id v3 = v2;
    CFBooleanRef v4 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v2, @"com.apple.softwareupdatesso.tokenaccessallowed", 0);
    if (v4)
    {
      CFBooleanRef v5 = v4;
      CFTypeID v6 = CFGetTypeID(v4);
      BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
      CFRelease(v5);
    }
    else
    {
      BOOL v7 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    dispatch_semaphore_t v8 = SoftwareUpdateSSOlogError();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_226EA1000, v8, OS_LOG_TYPE_DEFAULT, "Unable to create taskref for permission check\n", v10, 2u);
    }

    return 0;
  }
  return v7;
}

- (id)copyUserInfo
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)ssoControllerQueue);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SoftwareUpdateSSO_copyUserInfo__block_invoke;
  block[3] = &unk_2647EE868;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)ssoControllerQueue, block);
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:self->_userName forKeyedSubscript:@"username"];
  [v3 setObject:self->_personID forKeyedSubscript:@"personId"];
  return v3;
}

void __33__SoftwareUpdateSSO_copyUserInfo__block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) callerHasRequiredEntitlements])
  {
    CFBooleanRef v5 = SoftwareUpdateSSOlogError();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      CFTypeID v6 = "Process does not have permissions to read the AC user info\n";
      BOOL v7 = (uint8_t *)&v8;
LABEL_10:
      _os_log_impl(&dword_226EA1000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
LABEL_11:

    return;
  }
  [*(id *)(a1 + 32) setupAuthenticator];
  if (([*(id *)(a1 + 32) ssoIsSupported] & 1) == 0)
  {
    CFBooleanRef v5 = SoftwareUpdateSSOlogError();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      CFTypeID v6 = "copyUserInfo called in unsupported environment\n";
      BOOL v7 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v2 = [*(id *)(a1 + 32) authenticator];
  [v2 authenticate];

  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  dispatch_time_t v4 = dispatch_time(0, 180000000000);

  dispatch_semaphore_wait(v3, v4);
}

- (id)getDawToken
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)ssoControllerQueue);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SoftwareUpdateSSO_getDawToken__block_invoke;
  block[3] = &unk_2647EE868;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)ssoControllerQueue, block);
  return self->_dawToken;
}

void __32__SoftwareUpdateSSO_getDawToken__block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) callerHasRequiredEntitlements];
  [*(id *)(a1 + 32) setDawToken:0];
  if (v2)
  {
    [*(id *)(a1 + 32) setupAuthenticator];
    if ([*(id *)(a1 + 32) ssoIsSupported])
    {
      v12 = @"DAWRequest";
      id v3 = [MEMORY[0x263EFFA88] stringValue];
      v13[0] = v3;
      dispatch_time_t v4 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      CFBooleanRef v5 = [*(id *)(a1 + 32) authenticator];
      [v5 setOtherParameters:v4];

      CFTypeID v6 = [*(id *)(a1 + 32) authenticator];
      [v6 authenticate];

      BOOL v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      dispatch_time_t v8 = dispatch_time(0, 180000000000);
      dispatch_semaphore_wait(v7, v8);
      return;
    }
    id v9 = SoftwareUpdateSSOlogError();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      v10 = "GenerateDawToken called in unsupported environment\n";
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = SoftwareUpdateSSOlogError();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      v10 = "Process does not have permissions to read the sso token\n";
LABEL_8:
      _os_log_impl(&dword_226EA1000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }
  }
}

- (BOOL)ssoIsSupported
{
  id v3 = [(SoftwareUpdateSSO *)self authenticator];

  if (v3)
  {
    dispatch_time_t v4 = [(SoftwareUpdateSSO *)self authenticator];
    char v5 = [v4 authenticationSupported];

    return v5;
  }
  else
  {
    BOOL v7 = SoftwareUpdateSSOlogError();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v8 = 0;
      _os_log_impl(&dword_226EA1000, v7, OS_LOG_TYPE_DEFAULT, "No authenticator object found. Assuming sso not supported\n", v8, 2u);
    }

    return 0;
  }
}

- (void)authenticator:(id)a3 didCompleteWithResult:(id)a4
{
  id v5 = a4;
  CFTypeID v6 = SoftwareUpdateSSOlogInfo();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl(&dword_226EA1000, v6, OS_LOG_TYPE_DEFAULT, "INFO: ExtensibleSSOAuthentication callback returned success\n", v7, 2u);
  }

  [(SoftwareUpdateSSO *)self copyTokenFromAuthenticatorResponse:v5 error:0];
}

- (void)authenticator:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  CFTypeID v6 = SoftwareUpdateSSOlogError();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = [v5 description];
    int v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_226EA1000, v6, OS_LOG_TYPE_DEFAULT, "ExtensibleSSOAuthentication callback returned error: %@\n", (uint8_t *)&v9, 0xCu);
  }
  dispatch_time_t v8 = [(SoftwareUpdateSSO *)self buildSSOError:1 underlying:v5 description:@"Call to SSOAuthenticator Authenticate failed"];
  [(SoftwareUpdateSSO *)self copyTokenFromAuthenticatorResponse:0 error:v8];
}

- (SoftwareUpdateExtensibleSSOAuthenticator)authenticator
{
  return (SoftwareUpdateExtensibleSSOAuthenticator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAuthenticator:(id)a3
{
}

- (NSDictionary)defaultAuthParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDefaultAuthParameters:(id)a3
{
}

- (NSString)appIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)userName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUserName:(id)a3
{
}

- (NSString)personID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPersonID:(id)a3
{
}

- (NSString)envIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEnvIdentifier:(id)a3
{
}

- (NSString)dawToken
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDawToken:(id)a3
{
}

- (NSString)interactivityLevel
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInteractivityLevel:(id)a3
{
}

- (id)resultCallBack
{
  return self->_resultCallBack;
}

- (void)setResultCallBack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultCallBack, 0);
  objc_storeStrong((id *)&self->_interactivityLevel, 0);
  objc_storeStrong((id *)&self->_dawToken, 0);
  objc_storeStrong((id *)&self->_envIdentifier, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultAuthParameters, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);

  objc_storeStrong((id *)&self->SoftwareUpdateSSOCompletionSemaphore, 0);
}

@end