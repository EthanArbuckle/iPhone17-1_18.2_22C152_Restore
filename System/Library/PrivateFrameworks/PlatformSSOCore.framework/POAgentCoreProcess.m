@interface POAgentCoreProcess
- (BOOL)verifyAgentEntitlement;
- (BOOL)verifyLoginUserEntitlement;
- (BOOL)verifyPasswordChangeEntitlement;
- (BOOL)verifySecurityEntitlement;
- (POAgentCoreProcess)initWithXPCConnection:(id)a3 identifierProvider:(id)a4 jwksStroageProvider:(id)a5;
- (POAuthenticationProcess)authenticationProcess;
- (POJWKSStorageProvider)jwksStorageProvider;
- (POKeychainHelper)keychainHelper;
- (POTokenHelper)tokenHelper;
- (POUserIdentifierProvider)userIdentifierProvider;
- (id)invalidationHandler;
- (void)_verifyLogin:(id)a3 passwordContext:(id)a4 smartCardContext:(id)a5 tokenId:(id)a6 deviceConfiguration:(id)a7 loginConfiguration:(id)a8 forAuthorization:(BOOL)a9 completion:(id)a10;
- (void)connectionInvalidated;
- (void)getLoginTypeForUser:(id)a3 completion:(id)a4;
- (void)setAuthenticationProcess:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setJwksStorageProvider:(id)a3;
- (void)setKeychainHelper:(id)a3;
- (void)setTokenHelper:(id)a3;
- (void)setUserIdentifierProvider:(id)a3;
- (void)verifyAgentEntitlement;
- (void)verifyPasswordLogin:(id)a3 passwordContext:(id)a4 completion:(id)a5;
- (void)verifyPasswordUser:(id)a3 passwordContext:(id)a4 completion:(id)a5;
@end

@implementation POAgentCoreProcess

- (POAgentCoreProcess)initWithXPCConnection:(id)a3 identifierProvider:(id)a4 jwksStroageProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[POAgentCoreProcess initWithXPCConnection:identifierProvider:jwksStroageProvider:](v8, (uint64_t)self, v11);
  }

  v22.receiver = self;
  v22.super_class = (Class)POAgentCoreProcess;
  v12 = [(POAgentCoreProcess *)&v22 init];
  if (v12)
  {
    v13 = objc_alloc_init(POAuthenticationProcess);
    authenticationProcess = v12->_authenticationProcess;
    v12->_authenticationProcess = v13;

    [(POAuthenticationProcess *)v12->_authenticationProcess setWaitForConnectivity:1];
    [(POAuthenticationProcess *)v12->_authenticationProcess setTimeoutIntervalForResource:15.0];
    objc_storeWeak((id *)&v12->_xpcConnection, v8);
    objc_storeStrong((id *)&v12->_userIdentifierProvider, a4);
    objc_storeStrong((id *)&v12->_jwksStorageProvider, a5);
    v15 = [[POTokenHelper alloc] initWithIdentifierProvider:v12->_userIdentifierProvider];
    tokenHelper = v12->_tokenHelper;
    v12->_tokenHelper = v15;

    v17 = objc_alloc_init(POKeychainHelper);
    keychainHelper = v12->_keychainHelper;
    v12->_keychainHelper = v17;
  }
  if ([(POAgentCoreProcess *)v12 verifyAgentEntitlement]
    || [(POAgentCoreProcess *)v12 verifyLoginUserEntitlement]
    || [(POAgentCoreProcess *)v12 verifyPasswordChangeEntitlement]
    || [(POAgentCoreProcess *)v12 verifySecurityEntitlement])
  {
    v19 = v12;
  }
  else
  {
    id v21 = __83__POAgentCoreProcess_initWithXPCConnection_identifierProvider_jwksStroageProvider___block_invoke();
    v19 = 0;
  }

  return v19;
}

id __83__POAgentCoreProcess_initWithXPCConnection_identifierProvider_jwksStroageProvider___block_invoke()
{
  v0 = +[POError errorWithCode:-1002 description:@"missing required entitlement"];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)verifyAgentEntitlement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  v3 = [WeakRetained valueForEntitlement:@"com.apple.private.platformsso.agent"];

  if (v3 && ([v3 BOOLValue] & 1) != 0) {
    goto LABEL_6;
  }
  if (verifyAgentEntitlement_sOnce != -1) {
    dispatch_once(&verifyAgentEntitlement_sOnce, &__block_literal_global_10);
  }
  if (verifyAgentEntitlement_agentEntitlement)
  {
LABEL_6:
    BOOL v4 = 1;
  }
  else
  {
    v5 = PO_LOG_POAgentCoreProcess();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[POAgentCoreProcess verifyAgentEntitlement]();
    }

    BOOL v4 = 0;
  }

  return v4;
}

void __44__POAgentCoreProcess_verifyAgentEntitlement__block_invoke()
{
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    CFTypeRef v2 = SecTaskCopyValueForEntitlement(v0, @"com.apple.private.platformsso.agent", 0);
    CFRelease(v1);
    if (v2)
    {
      CFTypeID v3 = CFGetTypeID(v2);
      if (v3 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v2))
      {
        CFRelease(v2);
        verifyAgentEntitlement_agentEntitlement = 1;
      }
      else
      {
        CFRelease(v2);
      }
    }
  }
}

- (BOOL)verifySecurityEntitlement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  CFTypeID v3 = [WeakRetained valueForEntitlement:@"com.apple.private.platformsso.security"];

  if (v3 && ([v3 BOOLValue] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = PO_LOG_POAgentCoreProcess();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[POAgentCoreProcess verifyAgentEntitlement]();
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)verifyLoginUserEntitlement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  CFTypeID v3 = [WeakRetained valueForEntitlement:@"com.apple.private.platformsso.loginuser"];

  if (v3 && ([v3 BOOLValue] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = PO_LOG_POAgentCoreProcess();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[POAgentCoreProcess verifyAgentEntitlement]();
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)verifyPasswordChangeEntitlement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  CFTypeID v3 = [WeakRetained valueForEntitlement:@"com.apple.private.platformsso.passwordchange"];

  if (v3 && ([v3 BOOLValue] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = PO_LOG_POAgentCoreProcess();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[POAgentCoreProcess verifyAgentEntitlement]();
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (void)connectionInvalidated
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  CFTypeID v3 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[POAgentCoreProcess connectionInvalidated]";
    __int16 v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_259DFE000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getLoginTypeForUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if (![(POAgentCoreProcess *)self verifyAgentEntitlement]
    && ![(POAgentCoreProcess *)self verifyPasswordChangeEntitlement])
  {
    __83__POAgentCoreProcess_initWithXPCConnection_identifierProvider_jwksStroageProvider___block_invoke();
    id v10 = (POConfigurationCoreManager *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);
LABEL_18:

    goto LABEL_19;
  }
  if (+[POCoreConfigurationUtil platformSSOEnabled])
  {
    uint64_t v8 = [POConfigurationCoreManager alloc];
    id v9 = [(POAgentCoreProcess *)self userIdentifierProvider];
    id v10 = [(POConfigurationCoreManager *)v8 initWithUserName:v6 identifierProvider:v9 sharedOnly:0];

    v11 = PO_LOG_POAgentCoreProcess();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[POAgentCoreProcess getLoginTypeForUser:completion:]((uint64_t)v6, (uint64_t)self, v11);
    }

    v12 = [(POConfigurationCoreManager *)v10 currentUserConfiguration];
    v13 = v12;
    if (v12)
    {
      if (v7) {
        v7[2](v7, [v12 loginType], 0);
      }
    }
    else
    {
      id v16 = v6;
      v15 = __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_24();
      if (v7) {
        v7[2](v7, 0, v15);
      }
    }
    goto LABEL_18;
  }
  v14 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[POAgentCoreProcess getLoginTypeForUser:completion:]();
  }

  if (v7) {
    v7[2](v7, 0, 0);
  }
LABEL_19:
}

id __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_24()
{
  v0 = +[POError errorWithCode:-1004 description:@"No user configuration for user."];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

- (void)verifyPasswordLogin:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_super v22 = +[POCredentialUtil maskName:v8];
    *(_DWORD *)buf = 136315906;
    v30 = "-[POAgentCoreProcess verifyPasswordLogin:passwordContext:completion:]";
    __int16 v31 = 2114;
    v32 = v22;
    __int16 v33 = 2114;
    id v34 = v9;
    __int16 v35 = 2112;
    v36 = self;
    _os_log_debug_impl(&dword_259DFE000, v11, OS_LOG_TYPE_DEBUG, "%s loginUserName = %{public}@, passwordContext = %{public}@ on %@", buf, 0x2Au);
  }
  v12 = [POConfigurationCoreManager alloc];
  v13 = [(POAgentCoreProcess *)self userIdentifierProvider];
  v14 = [(POConfigurationCoreManager *)v12 initWithUserName:0 identifierProvider:v13 sharedOnly:1];

  v15 = [(POConfigurationCoreManager *)v14 currentDeviceConfiguration];
  if (v15)
  {
    id v16 = [(POConfigurationCoreManager *)v14 currentLoginConfiguration];
    if (v16)
    {
      v17 = (void *)[objc_alloc(MEMORY[0x263F10468]) initWithExternalizedContext:v9];
      v18 = +[POCredentialUtil passwordDataFromContext:v17 error:0];
      v19 = v18;
      if (v18 && [v18 length])
      {
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_45;
        v24[3] = &unk_265463FB8;
        v27[0] = v10;
        id v25 = v15;
        id v26 = v17;
        LOBYTE(v23) = 1;
        v20 = (id *)v27;
        [(POAgentCoreProcess *)self _verifyLogin:v8 passwordContext:v9 smartCardContext:0 tokenId:0 deviceConfiguration:v25 loginConfiguration:v16 forAuthorization:v23 completion:v24];

        id v21 = v25;
      }
      else
      {
        v27[1] = MEMORY[0x263EF8330];
        v27[2] = 3221225472;
        v27[3] = __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_41;
        v27[4] = &unk_265463860;
        v20 = &v28;
        id v28 = v8;
        id v21 = __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_41();
        (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 2, v21);
      }
    }
    else
    {
      v17 = __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_34();
      (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 2, v17);
    }
  }
  else
  {
    id v16 = __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke();
    (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 2, v16);
  }
}

id __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke()
{
  v0 = +[POError errorWithCode:-1004 description:@"No device configuration."];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_34()
{
  v0 = +[POError errorWithCode:-1004 description:@"No login configuration."];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_41()
{
  v0 = +[POError errorWithCode:-1008 description:@"no credential for user for login"];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

void __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_45(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v10 = a3;
  id v11 = a7;
  if (a2 == 1)
  {
    SecKeyRef v12 = SecKeyCopyPublicKey((SecKeyRef)[*(id *)(a1 + 32) deviceEncryptionKey]);
    if (v12)
    {
      SecKeyRef v13 = v12;
      v14 = +[POCredentialUtil passwordDataFromContext:*(void *)(a1 + 40) error:0];
      id v19 = 0;
      BOOL v15 = +[POCredentialUtil encryptPendingSSOTokens:v10 usingPublicKey:v13 sharedData:v14 encryptedTokens:&v19];
      id v16 = v19;
      id v17 = v14;
      memset_s((void *)[v17 mutableBytes], objc_msgSend(v17, "length"), 0, objc_msgSend(v17, "length"));
      if (v15)
      {
        CFRelease(v13);
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      else
      {
        uint64_t v18 = __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_51();
        CFRelease(v13);
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        id v16 = (id)v18;
      }
    }
    else
    {
      __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_2();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to get public key for encrypting tokens"];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_51()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to encrypt login tokens"];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)verifyPasswordUser:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_super v22 = +[POCredentialUtil maskName:v8];
    *(_DWORD *)buf = 136315906;
    __int16 v35 = "-[POAgentCoreProcess verifyPasswordUser:passwordContext:completion:]";
    __int16 v36 = 2114;
    uint64_t v37 = v22;
    __int16 v38 = 2114;
    id v39 = v9;
    __int16 v40 = 2112;
    v41 = self;
    _os_log_debug_impl(&dword_259DFE000, v11, OS_LOG_TYPE_DEBUG, "%s loginUserName = %{public}@, passwordContext = %{public}@ on %@", buf, 0x2Au);
  }
  SecKeyRef v12 = [POConfigurationCoreManager alloc];
  SecKeyRef v13 = [(POAgentCoreProcess *)self userIdentifierProvider];
  v14 = [(POConfigurationCoreManager *)v12 initWithUserName:v8 identifierProvider:v13 sharedOnly:1];

  BOOL v15 = [(POConfigurationCoreManager *)v14 currentDeviceConfiguration];
  if (v15)
  {
    id v16 = [(POConfigurationCoreManager *)v14 currentLoginConfiguration];
    if (v16)
    {
      id v17 = [(POConfigurationCoreManager *)v14 currentUserConfiguration];
      if (v17)
      {
        uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F10468]) initWithExternalizedContext:v9];
        id v19 = +[POCredentialUtil passwordDataFromContext:v18 error:0];
        v20 = v19;
        if (v19 && [v19 length])
        {
          id v25 = [v17 userLoginConfiguration];
          v24 = [v25 loginUserName];
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_73;
          v27[3] = &unk_265463FE0;
          id v26 = (id *)v32;
          v32[0] = v10;
          id v28 = v14;
          id v29 = v8;
          id v30 = v15;
          id v31 = v18;
          LOBYTE(v23) = 1;
          [(POAgentCoreProcess *)self _verifyLogin:v24 passwordContext:v9 smartCardContext:0 tokenId:0 deviceConfiguration:v30 loginConfiguration:v16 forAuthorization:v23 completion:v27];

          id v21 = v28;
        }
        else
        {
          v32[1] = MEMORY[0x263EF8330];
          v32[2] = 3221225472;
          v32[3] = __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_69;
          v32[4] = &unk_265463860;
          id v26 = &v33;
          id v33 = v8;
          id v21 = __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_69();
          (*((void (**)(id, uint64_t, void, void, void, void, void *))v10 + 2))(v10, 2, 0, 0, 0, 0, v21);
        }
      }
      else
      {
        uint64_t v18 = __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_63();
        (*((void (**)(id, uint64_t, void, void, void, void, void *))v10 + 2))(v10, 2, 0, 0, 0, 0, v18);
      }
    }
    else
    {
      id v17 = __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_34();
      (*((void (**)(id, uint64_t, void, void, void, void, void *))v10 + 2))(v10, 2, 0, 0, 0, 0, v17);
    }
  }
  else
  {
    id v16 = __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke();
    (*((void (**)(id, uint64_t, void, void, void, void, void *))v10 + 2))(v10, 2, 0, 0, 0, 0, v16);
  }
}

id __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_63()
{
  v0 = +[POError errorWithCode:-1004 description:@"No user configuration."];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_69()
{
  v0 = +[POError errorWithCode:-1008 description:@"no credential for user"];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

void __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_73(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (a2 == 1)
  {
    uint64_t v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    v20 = [MEMORY[0x263EFF910] date];
    [v18 updateLoginStateForUserName:v19 state:0 loginDate:v20 loginType:1];

    SecKeyRef v21 = SecKeyCopyPublicKey((SecKeyRef)[*(id *)(a1 + 48) deviceEncryptionKey]);
    if (v21)
    {
      SecKeyRef v22 = v21;
      id v33 = v15;
      id v34 = v14;
      uint64_t v23 = +[POCredentialUtil passwordDataFromContext:*(void *)(a1 + 56) error:0];
      id v35 = 0;
      BOOL v24 = +[POCredentialUtil encryptPendingSSOTokens:v13 usingPublicKey:v22 sharedData:v23 encryptedTokens:&v35];
      id v25 = v35;
      id v26 = v23;
      memset_s((void *)[v26 mutableBytes], objc_msgSend(v26, "length"), 0, objc_msgSend(v26, "length"));
      if (v24)
      {
        CFRelease(v22);
        v27 = v25;
        if ([*(id *)(a1 + 32) savePendingSSOTokens:v25 forUserName:*(void *)(a1 + 40)])
        {
          char v28 = [*(id *)(a1 + 32) saveStashedSSOTokens:v25 forUserName:*(void *)(a1 + 40)];
          id v15 = v33;
          id v14 = v34;
          if (v28)
          {
            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          }
          else
          {
            v32 = __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_86();
            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          }
          goto LABEL_12;
        }
        id v31 = __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_80();
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      else
      {
        id v30 = __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_51();
        CFRelease(v22);
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

        v27 = v25;
      }
      id v15 = v33;
      id v14 = v34;
LABEL_12:

      goto LABEL_13;
    }
    id v29 = __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_2();
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
LABEL_13:
}

id __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_80()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to save login tokens"];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_86()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to stash login tokens"];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)_verifyLogin:(id)a3 passwordContext:(id)a4 smartCardContext:(id)a5 tokenId:(id)a6 deviceConfiguration:(id)a7 loginConfiguration:(id)a8 forAuthorization:(BOOL)a9 completion:(id)a10
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  uint64_t v23 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v48 = +[POCredentialUtil maskName:v16];
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "-[POAgentCoreProcess _verifyLogin:passwordContext:smartCardContext:tokenId:deviceConfiguration:"
                         "loginConfiguration:forAuthorization:completion:]";
    __int16 v86 = 2114;
    v87 = v48;
    __int16 v88 = 2114;
    id v89 = v17;
    __int16 v90 = 2114;
    id v91 = v18;
    __int16 v92 = 2114;
    id v93 = v19;
    __int16 v94 = 2112;
    v95 = self;
    _os_log_debug_impl(&dword_259DFE000, v23, OS_LOG_TYPE_DEBUG, "%s loginUserName = %{public}@, passwordContext = %{public}@, smartcardContext = %{public}@, tokenId = %{public}@ on %@", buf, 0x3Eu);
  }
  if ([(POAgentCoreProcess *)self verifyAgentEntitlement])
  {
    BOOL v24 = objc_alloc_init(POAuthenticationProcess);
    if (!v17 || v18)
    {
      if (v18 && v19)
      {
        spida = v16;
        int v75 = 0;
        id v34 = objc_alloc_init(MEMORY[0x263F10468]);
        [v34 setInteractionNotAllowed:1];
        uint64_t v74 = 0;
        v55 = (void *)[objc_alloc(MEMORY[0x263F10468]) initWithExternalizedContext:v18 userSession:&v75];
        id v35 = +[POCredentialUtil passwordDataFromContext:error:](POCredentialUtil, "passwordDataFromContext:error:");
        id v59 = 0;
        v53 = v35;
        if (v35)
        {
          v61 = v21;
          id v52 = v20;
          [v34 setCredential:v35 type:-3];
          id v36 = v35;
          memset_s((void *)[v36 mutableBytes], objc_msgSend(v36, "length"), 0, objc_msgSend(v36, "length"));
          *(void *)buf = 0;
          v72[0] = 0;
          uint64_t v37 = [(POAgentCoreProcess *)self tokenHelper];
          id v51 = v34;
          char v38 = [v37 retrieveCertAndKeyForTokenId:v19 context:v34 certificate:v72 privateKey:buf];

          if (v38)
          {
            id v39 = PO_LOG_POAgentCoreProcess();
            os_signpost_id_t v40 = os_signpost_id_generate(v39);

            v41 = PO_LOG_POAgentCoreProcess();
            uint64_t v42 = v41;
            if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
            {
              *(_WORD *)v66 = 0;
              _os_signpost_emit_with_name_impl(&dword_259DFE000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "PlatformSSO_SmartCardAuth", " enableTelemetry=YES ", v66, 2u);
            }

            id v20 = v52;
            v43 = [(POAuthenticationProcess *)v24 createAuthenticationContextUsingLoginConfiguration:v21 deviceConfiguration:v52 userName:spida];
            [v43 setEmbeddedAssertionSigningKey:*(void *)buf];
            [v43 setEmbeddedAssertionCertificate:v72[0]];
            v44 = [(POAgentCoreProcess *)self jwksStorageProvider];
            [v43 setJwksStorageProvider:v44];

            [v43 addRequiredScope:@"profile"];
            if (a9)
            {
              v45 = [v61 additionalAuthorizationScopes];
              [v43 addRequiredScope:v45];
            }
            v62[0] = MEMORY[0x263EF8330];
            v62[1] = 3221225472;
            v62[2] = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_118;
            v62[3] = &unk_265464008;
            os_signpost_id_t v65 = v40;
            v63 = v24;
            id v64 = v22;
            [(POAuthenticationProcess *)v63 performSmartCardLoginUsingContext:v43 completion:v62];
          }
          else
          {
            uint64_t v67 = MEMORY[0x263EF8330];
            uint64_t v68 = 3221225472;
            v69 = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_114;
            v70 = &unk_265463860;
            id v71 = v19;
            v50 = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_114();
            (*((void (**)(id, uint64_t, void, void, void, void, void *))v22 + 2))(v22, 3, 0, 0, 0, 0, v50);

            v43 = v71;
            id v20 = v52;
          }
          id v34 = v51;

          id v21 = v61;
        }
        else
        {
          v72[1] = MEMORY[0x263EF8330];
          v72[2] = 3221225472;
          v72[3] = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_110;
          v72[4] = &unk_265463860;
          id v73 = spida;
          v49 = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_110();
          (*((void (**)(id, uint64_t, void, void, void, void, void *))v22 + 2))(v22, 3, 0, 0, 0, 0, v49);
        }
        v47 = v59;

        id v16 = spida;
      }
      else
      {
        v47 = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_123();
        (*((void (**)(id, uint64_t, void, void, void, void, void *))v22 + 2))(v22, 2, 0, 0, 0, 0, v47);
      }
    }
    else
    {
      v60 = v21;
      uint64_t v58 = [objc_alloc(MEMORY[0x263F10468]) initWithExternalizedContext:v17];
      id v25 = +[POCredentialUtil passwordDataFromContext:error:](POCredentialUtil, "passwordDataFromContext:error:");
      id v26 = v25;
      if (v25 && [v25 length])
      {
        id v54 = v19;
        v27 = PO_LOG_POAgentCoreProcess();
        os_signpost_id_t v28 = os_signpost_id_generate(v27);

        id v29 = PO_LOG_POAgentCoreProcess();
        id v30 = v29;
        os_signpost_id_t spid = v28;
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_259DFE000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "PlatformSSO_PasswordAuth", " enableTelemetry=YES ", buf, 2u);
        }

        id v31 = [(POAuthenticationProcess *)v24 createAuthenticationContextUsingLoginConfiguration:v60 deviceConfiguration:v20 userName:v16];
        [v31 setPassword:v26];
        v32 = [(POAgentCoreProcess *)self jwksStorageProvider];
        [v31 setJwksStorageProvider:v32];

        [v31 addRequiredScope:@"profile"];
        id v19 = v54;
        if (a9)
        {
          id v33 = [v60 additionalAuthorizationScopes];
          [v31 addRequiredScope:v33];
        }
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_101;
        v76[3] = &unk_265464008;
        os_signpost_id_t v79 = spid;
        v77 = v24;
        id v78 = v22;
        [(POAuthenticationProcess *)v77 performPasswordLoginUsingContext:v31 completion:v76];
      }
      else
      {
        uint64_t v80 = MEMORY[0x263EF8330];
        uint64_t v81 = 3221225472;
        v82 = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_94;
        v83 = &unk_265463860;
        id v84 = v16;
        v46 = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_94();
        (*((void (**)(id, uint64_t, void, void, void, void, void *))v22 + 2))(v22, 3, 0, 0, 0, 0, v46);
      }
      v47 = (void *)v58;
      id v21 = v60;
    }
  }
  else
  {
    __83__POAgentCoreProcess_initWithXPCConnection_identifierProvider_jwksStroageProvider___block_invoke();
    BOOL v24 = (POAuthenticationProcess *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void, void, void, void, POAuthenticationProcess *))v22 + 2))(v22, 2, 0, 0, 0, 0, v24);
  }
}

id __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_94()
{
  v0 = +[POError errorWithCode:-1001 description:@"Missing password credential for user."];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_94_cold_1();
  }

  return v0;
}

void __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_101(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = PO_LOG_POAgentCoreProcess();
  id v10 = v9;
  os_signpost_id_t v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_259DFE000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_PasswordAuth", "", buf, 2u);
  }

  SecKeyRef v12 = +[POConstantCoreUtil stringForLoginType:1];
  id v13 = +[POConstantCoreUtil stringForLoginResult:a2];
  +[POAnalytics analyticsForLoginType:v12 result:v13];

  if ((unint64_t)(a2 - 2) >= 5 && a2)
  {
    if (a2 == 1)
    {
      id v18 = PO_LOG_POAgentCoreProcess();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_259DFE000, v18, OS_LOG_TYPE_INFO, "Authentication completed successfully", buf, 2u);
      }

      id v19 = (void *)a1[4];
      id v22 = 0;
      id v23 = 0;
      id v21 = 0;
      [v19 extractGroupsAndSubUsingAuthorizationWithContext:v7 tokens:v8 returningGroups:&v23 identifier:&v22 refreshToken:&v21];
      id v15 = v23;
      id v16 = v22;
      id v17 = v21;
    }
    else
    {
      id v15 = 0;
      id v16 = 0;
      id v17 = 0;
    }
    uint64_t v20 = a1[5];
    if (v20) {
      (*(void (**)(uint64_t, uint64_t, id, id, id, id, void))(v20 + 16))(v20, 1, v8, v16, v15, v17, 0);
    }
  }
  else
  {
    id v14 = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_104();
    (*(void (**)(void, uint64_t, void, void, void))(a1[5] + 16))(a1[5], a2, 0, 0, 0);

    id v15 = 0;
    id v16 = 0;
    id v17 = 0;
  }
}

id __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_104()
{
  v0 = +[POError errorWithCode:-1001 description:@"Password login failed"];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_104_cold_1();
  }

  return v0;
}

id __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_110()
{
  v0 = +[POError errorWithCode:-1001 description:@"Missing SmartCard credential for user"];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_94_cold_1();
  }

  return v0;
}

id __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_114()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to find smartcard."];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

void __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_118(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = PO_LOG_POAgentCoreProcess();
  id v10 = v9;
  os_signpost_id_t v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_259DFE000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_SmartCardAuth", "", buf, 2u);
  }

  SecKeyRef v12 = +[POConstantCoreUtil stringForLoginType:1];
  id v13 = +[POConstantCoreUtil stringForLoginResult:a2];
  +[POAnalytics analyticsForLoginType:v12 result:v13];

  if ((unint64_t)(a2 - 2) >= 5 && a2)
  {
    if (a2 == 1)
    {
      id v18 = PO_LOG_POAgentCoreProcess();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_259DFE000, v18, OS_LOG_TYPE_INFO, "Authentication completed successfully", buf, 2u);
      }

      id v19 = (void *)a1[4];
      id v22 = 0;
      id v23 = 0;
      id v21 = 0;
      [v19 extractGroupsAndSubUsingAuthorizationWithContext:v7 tokens:v8 returningGroups:&v23 identifier:&v22 refreshToken:&v21];
      id v15 = v23;
      id v16 = v22;
      id v17 = v21;
    }
    else
    {
      id v15 = 0;
      id v16 = 0;
      id v17 = 0;
    }
    uint64_t v20 = a1[5];
    if (v20) {
      (*(void (**)(uint64_t, uint64_t, id, id, id, id, void))(v20 + 16))(v20, 1, v8, v16, v15, v17, 0);
    }
  }
  else
  {
    id v14 = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_119();
    (*(void (**)(void, uint64_t, void, void, void))(a1[5] + 16))(a1[5], a2, 0, 0, 0);

    id v15 = 0;
    id v16 = 0;
    id v17 = 0;
  }
}

id __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_119()
{
  v0 = +[POError errorWithCode:-1001 description:@"SmartCard login failed"];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_104_cold_1();
  }

  return v0;
}

id __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_123()
{
  v0 = +[POError errorWithCode:-1001 description:@"Invalid login request."];
  v1 = PO_LOG_POAgentCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (POAuthenticationProcess)authenticationProcess
{
  return (POAuthenticationProcess *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAuthenticationProcess:(id)a3
{
}

- (POUserIdentifierProvider)userIdentifierProvider
{
  return (POUserIdentifierProvider *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserIdentifierProvider:(id)a3
{
}

- (POJWKSStorageProvider)jwksStorageProvider
{
  return (POJWKSStorageProvider *)objc_getProperty(self, a2, 40, 1);
}

- (void)setJwksStorageProvider:(id)a3
{
}

- (POTokenHelper)tokenHelper
{
  return (POTokenHelper *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTokenHelper:(id)a3
{
}

- (POKeychainHelper)keychainHelper
{
  return (POKeychainHelper *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeychainHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_tokenHelper, 0);
  objc_storeStrong((id *)&self->_jwksStorageProvider, 0);
  objc_storeStrong((id *)&self->_userIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_authenticationProcess, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
}

- (void)initWithXPCConnection:(void *)a1 identifierProvider:(uint64_t)a2 jwksStroageProvider:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = 136315650;
  id v6 = "-[POAgentCoreProcess initWithXPCConnection:identifierProvider:jwksStroageProvider:]";
  __int16 v7 = 1026;
  int v8 = [a1 auditSessionIdentifier];
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_259DFE000, a3, OS_LOG_TYPE_DEBUG, "%s asid= %{public}d on %@", (uint8_t *)&v5, 0x1Cu);
}

- (void)verifyAgentEntitlement
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_259DFE000, v0, v1, "missing required entitlement", v2, v3, v4, v5, v6);
}

- (void)getLoginTypeForUser:(os_log_t)log completion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "-[POAgentCoreProcess getLoginTypeForUser:completion:]";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_259DFE000, log, OS_LOG_TYPE_DEBUG, "%s userName = %{public}@ on %@", (uint8_t *)&v3, 0x20u);
}

- (void)getLoginTypeForUser:completion:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_259DFE000, v0, OS_LOG_TYPE_DEBUG, "Platform SSO is not configured.", v1, 2u);
}

void __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_94_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = +[POCredentialUtil maskName:*(void *)(v0 + 32)];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_259DFE000, v2, v3, "%{public}@, %{public}@", v4, v5, v6, v7, v8);
}

void __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_104_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:*(void *)(v0 + 32)];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_259DFE000, v2, v3, "%{public}@, %{public}@", v4, v5, v6, v7, v8);
}

@end