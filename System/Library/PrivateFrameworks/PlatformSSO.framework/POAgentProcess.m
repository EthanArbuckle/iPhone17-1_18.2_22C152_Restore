@interface POAgentProcess
+ (NSMutableDictionary)retainedContexts;
- (BOOL)verifyAgentEntitlement;
- (BOOL)verifyLoginUserEntitlement;
- (BOOL)verifyPasswordChangeEntitlement;
- (NSDistributedNotificationCenter)distributedNotificationCenter;
- (POAgentAuthenticationProcess)process;
- (POAgentProcess)initWithAuthenticationProcess:(id)a3;
- (POAgentProcess)initWithXPCConnection:(id)a3 authenticationProcess:(id)a4;
- (PODirectoryServices)directoryServices;
- (POKeyWrap)keyWrap;
- (POKeychainHelper)keychainHelper;
- (void)_saveCredentialForUserName:(id)a3 passwordContext:(id)a4 completion:(id)a5;
- (void)configurationDidChangeAndRemovedExtension:(id)a3 removed:(BOOL)a4 completion:(id)a5;
- (void)connectionInvalidated;
- (void)getLoginTypeForUser:(id)a3 completion:(id)a4;
- (void)passwordDidChangeForUsername:(id)a3 passwordContext:(id)a4 completion:(id)a5;
- (void)performPasswordLogin:(id)a3 loginUserName:(id)a4 passwordContext:(id)a5 updateLocalAccountPassword:(BOOL)a6 completion:(id)a7;
- (void)performPasswordLogin:(id)a3 passwordContext:(id)a4 updateLocalAccountPassword:(BOOL)a5 completion:(id)a6;
- (void)retainContextForUserName:(id)a3 context:(id)a4 completion:(id)a5;
- (void)saveCredentialForUserName:(id)a3 passwordContext:(id)a4 completion:(id)a5;
- (void)screenDidUnlockWithCredentialContext:(id)a3 smartCardContext:(id)a4 biometricContext:(id)a5 tokenId:(id)a6 atLogin:(BOOL)a7 tokenUnlock:(BOOL)a8 completion:(id)a9;
- (void)setDirectoryServices:(id)a3;
- (void)setDistributedNotificationCenter:(id)a3;
- (void)setKeyWrap:(id)a3;
- (void)setKeychainHelper:(id)a3;
- (void)setProcess:(id)a3;
- (void)updateLocalAccountPassword:(id)a3 passwordContext:(id)a4 completion:(id)a5;
- (void)updateLocalAccountPassword:(id)a3 passwordContextData:(id)a4 completion:(id)a5;
- (void)verifyAgentEntitlement;
- (void)verifyPasswordLogin:(id)a3 passwordContext:(id)a4 completion:(id)a5;
@end

@implementation POAgentProcess

- (POAgentProcess)initWithXPCConnection:(id)a3 authenticationProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POAgentProcess initWithXPCConnection:authenticationProcess:](v6, (uint64_t)self, v8);
  }

  v9 = objc_alloc_init(PODirectoryServices);
  v10 = [[POKeychainJWKSStorageProvider alloc] initWithSystem:0];
  v21.receiver = self;
  v21.super_class = (Class)POAgentProcess;
  v11 = [(POAgentCoreProcess *)&v21 initWithXPCConnection:v6 identifierProvider:v9 jwksStroageProvider:v10];

  if (v11)
  {
    objc_storeWeak((id *)&v11->_xpcConnection, v6);
    objc_storeStrong((id *)&v11->_process, a4);
    objc_storeStrong((id *)&v11->_directoryServices, v9);
    v12 = (POKeyWrap *)objc_alloc_init(MEMORY[0x263F5E630]);
    keyWrap = v11->_keyWrap;
    v11->_keyWrap = v12;

    v14 = (POKeychainHelper *)objc_alloc_init(MEMORY[0x263F5E638]);
    keychainHelper = v11->_keychainHelper;
    v11->_keychainHelper = v14;

    uint64_t v16 = [MEMORY[0x263F087C8] defaultCenter];
    distributedNotificationCenter = v11->_distributedNotificationCenter;
    v11->_distributedNotificationCenter = (NSDistributedNotificationCenter *)v16;
  }
  if ([(POAgentProcess *)v11 verifyAgentEntitlement]
    || [(POAgentProcess *)v11 verifyLoginUserEntitlement]
    || [(POAgentProcess *)v11 verifyPasswordChangeEntitlement])
  {
    v18 = v11;
  }
  else
  {
    id v20 = __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
    v18 = 0;
  }

  return v18;
}

id __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1002 description:@"missing required entitlement"];
  v1 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (POAgentProcess)initWithAuthenticationProcess:(id)a3
{
  id v4 = a3;
  v5 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POAgentProcess initWithAuthenticationProcess:]((uint64_t)self, v5);
  }

  id v6 = [(POAgentProcess *)self initWithXPCConnection:0 authenticationProcess:v4];
  return v6;
}

+ (NSMutableDictionary)retainedContexts
{
  if (retainedContexts_onceToken != -1) {
    dispatch_once(&retainedContexts_onceToken, &__block_literal_global_9_0);
  }
  v2 = (void *)retainedContexts_instance;

  return (NSMutableDictionary *)v2;
}

uint64_t __34__POAgentProcess_retainedContexts__block_invoke()
{
  retainedContexts_instance = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);

  return MEMORY[0x270F9A758]();
}

- (BOOL)verifyAgentEntitlement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  v3 = [WeakRetained valueForEntitlement:@"com.apple.private.platformsso.agent"];

  if (v3 && ([v3 BOOLValue] & 1) != 0) {
    goto LABEL_6;
  }
  if (verifyAgentEntitlement_sOnce != -1) {
    dispatch_once(&verifyAgentEntitlement_sOnce, &__block_literal_global_15);
  }
  if (verifyAgentEntitlement_agentEntitlement)
  {
LABEL_6:
    BOOL v4 = 1;
  }
  else
  {
    v5 = PO_LOG_POAgentProcess();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[POAgentProcess verifyAgentEntitlement]();
    }

    BOOL v4 = 0;
  }

  return v4;
}

void __40__POAgentProcess_verifyAgentEntitlement__block_invoke()
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
    v5 = PO_LOG_POAgentProcess();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[POAgentProcess verifyAgentEntitlement]();
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
    v5 = PO_LOG_POAgentProcess();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[POAgentProcess verifyAgentEntitlement]();
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (void)connectionInvalidated
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  CFTypeID v3 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[POAgentProcess connectionInvalidated]";
    __int16 v6 = 2112;
    id v7 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)getLoginTypeForUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, POConfigurationManager *))a4;
  if (![(POAgentProcess *)self verifyAgentEntitlement]
    && ![(POAgentProcess *)self verifyPasswordChangeEntitlement])
  {
    __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
    uint64_t v8 = (POConfigurationManager *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v8);
LABEL_18:

    goto LABEL_19;
  }
  if (+[POConfigurationUtil platformSSOEnabled])
  {
    uint64_t v8 = [[POConfigurationManager alloc] initWithUserName:v6];
    v9 = PO_LOG_POAgentProcess();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[POAgentProcess getLoginTypeForUser:completion:]((uint64_t)v6, (uint64_t)self, v9);
    }

    v10 = [(POConfigurationManager *)v8 currentUserConfiguration];
    v11 = v10;
    if (v10)
    {
      if (v7) {
        v7[2](v7, [v10 loginType], 0);
      }
    }
    else
    {
      id v14 = v6;
      __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26();
      v13 = (POConfigurationManager *)objc_claimAutoreleasedReturnValue();
      if (v7) {
        v7[2](v7, 0, v13);
      }
    }
    goto LABEL_18;
  }
  v12 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[POAgentProcess getLoginTypeForUser:completion:]();
  }

  if (v7) {
    v7[2](v7, 0, 0);
  }
LABEL_19:
}

id __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"No user configuration for user."];
  v1 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

- (void)performPasswordLogin:(id)a3 passwordContext:(id)a4 updateLocalAccountPassword:(BOOL)a5 completion:(id)a6
{
}

- (void)performPasswordLogin:(id)a3 loginUserName:(id)a4 passwordContext:(id)a5 updateLocalAccountPassword:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v32 = [NSNumber numberWithBool:v8];
    *(_DWORD *)buf = 136316162;
    v72 = "-[POAgentProcess performPasswordLogin:loginUserName:passwordContext:updateLocalAccountPassword:completion:]";
    __int16 v73 = 2114;
    id v74 = v12;
    __int16 v75 = 2114;
    id v76 = v14;
    __int16 v77 = 2114;
    v78 = v32;
    __int16 v79 = 2112;
    v80 = self;
    _os_log_debug_impl(&dword_230E51000, v16, OS_LOG_TYPE_DEBUG, "%s userName = %{public}@, passwordContext = %{public}@, updateLocalAccountPassword = %{public}@ on %@", buf, 0x34u);
  }
  if ([(POAgentProcess *)self verifyAgentEntitlement])
  {
    v17 = [[POConfigurationManager alloc] initWithUserName:v12];
    v18 = [(POConfigurationManager *)v17 currentDeviceConfiguration];
    if (v18)
    {
      v19 = [(POConfigurationManager *)v17 currentLoginConfiguration];
      if (v19)
      {
        uint64_t v20 = [(POConfigurationManager *)v17 userConfigurationForUserName:v12];
        objc_super v21 = (void *)v20;
        if (v20)
        {
          v47 = (void *)v20;
          v22 = (void *)[objc_alloc(MEMORY[0x263F10468]) initWithExternalizedContext:v14];
          v48 = [MEMORY[0x263F5E600] passwordDataFromContext:v22 error:0];
          if (v48 && [v48 length])
          {
            v45 = v22;
            v23 = PO_LOG_POAgentProcess();
            os_signpost_id_t v24 = os_signpost_id_generate(v23);

            v25 = PO_LOG_POAgentProcess();
            v26 = v25;
            if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_230E51000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PlatformSSO_PasswordAuth", " enableTelemetry=YES ", buf, 2u);
            }
            os_signpost_id_t v42 = v24;

            v27 = [v47 userLoginConfiguration];
            uint64_t v46 = [v19 mergedConfigurationWithUserLoginConfiguration:v27];

            if (v13)
            {
              id v28 = v13;
            }
            else
            {
              v43 = [v47 userLoginConfiguration];
              uint64_t v33 = [v43 loginUserName];
              v34 = (void *)v33;
              if (v33) {
                v35 = (void *)v33;
              }
              else {
                v35 = v12;
              }
              id v28 = v35;
            }
            v36 = [(POAgentCoreProcess *)self authenticationProcess];
            v44 = v28;
            v37 = [v36 createAuthenticationContextUsingLoginConfiguration:v46 deviceConfiguration:v18 userName:v28];

            [v37 setPassword:v48];
            v38 = [(POAgentCoreProcess *)self jwksStorageProvider];
            [v37 setJwksStorageProvider:v38];

            v39 = [(POConfigurationManager *)v17 currentRefreshToken];
            [v37 setRefreshToken:v39];

            v41 = [(POAgentCoreProcess *)self authenticationProcess];
            v49[0] = MEMORY[0x263EF8330];
            v49[1] = 3221225472;
            v49[2] = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_52;
            v49[3] = &unk_264BBF090;
            os_signpost_id_t v60 = v42;
            id v50 = v47;
            v51 = v17;
            id v52 = v12;
            id v53 = v37;
            id v54 = v18;
            id v59 = v15;
            v22 = v45;
            id v55 = v45;
            v56 = self;
            id v57 = v19;
            id v58 = v13;
            id v40 = v37;
            [v41 performPasswordLoginUsingContext:v40 completion:v49];

            v30 = (void *)v46;
          }
          else
          {
            uint64_t v61 = MEMORY[0x263EF8330];
            uint64_t v62 = 3221225472;
            v63 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_48;
            v64 = &unk_264BBECA8;
            id v65 = v12;
            v29 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_48();
            (*((void (**)(id, uint64_t, void *))v15 + 2))(v15, 2, v29);

            v30 = v65;
          }

          objc_super v21 = v47;
        }
        else
        {
          uint64_t v66 = MEMORY[0x263EF8330];
          uint64_t v67 = 3221225472;
          v68 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_45;
          v69 = &unk_264BBECA8;
          id v70 = v12;
          v31 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_45();
          (*((void (**)(id, uint64_t, void *))v15 + 2))(v15, 2, v31);

          v22 = v70;
        }
      }
      else
      {
        objc_super v21 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_39();
        (*((void (**)(id, uint64_t, void *))v15 + 2))(v15, 2, v21);
      }
    }
    else
    {
      v19 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_33();
      (*((void (**)(id, uint64_t, void *))v15 + 2))(v15, 2, v19);
    }
  }
  else
  {
    __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
    v17 = (POConfigurationManager *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, POConfigurationManager *))v15 + 2))(v15, 2, v17);
  }
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_33()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"No device configuration."];
  v1 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_39()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"No login configuration."];
  v1 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_45()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"No user configuration for user."];
  v1 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_48()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"no credential for user for login"];
  v1 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

void __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_52(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = PO_LOG_POAgentProcess();
  v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 112);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_230E51000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_PasswordAuth", (const char *)&unk_230EAB9BB, buf, 2u);
  }

  id v12 = (void *)MEMORY[0x263F5E5D8];
  id v13 = objc_msgSend(MEMORY[0x263F5E5F0], "stringForLoginType:", objc_msgSend(*(id *)(a1 + 32), "loginType"));
  id v14 = [MEMORY[0x263F5E5F0] stringForLoginResult:a2];
  [v12 analyticsForLoginType:v13 result:v14];

  if (PO_LOG_PODiagnostics_once != -1) {
    dispatch_once(&PO_LOG_PODiagnostics_once, &__block_literal_global_248);
  }
  id v15 = (void *)PO_LOG_PODiagnostics_log;
  if (os_log_type_enabled((os_log_t)PO_LOG_PODiagnostics_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = (void *)MEMORY[0x263F5E5F0];
    v17 = v15;
    v18 = [v16 stringForLoginResult:a2];
    *(_DWORD *)buf = 138543362;
    uint64_t v61 = v18;
    _os_log_impl(&dword_230E51000, v17, OS_LOG_TYPE_DEFAULT, "Login Result = %{public}@", buf, 0xCu);
  }
  switch(a2)
  {
    case 0:
    case 3:
    case 4:
    case 5:
    case 6:
      goto LABEL_9;
    case 1:
      uint64_t v20 = *(void **)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 48);
      v22 = [MEMORY[0x263EFF910] date];
      objc_msgSend(v20, "updateLoginStateForUserName:state:loginDate:loginType:", v21, 0, v22, objc_msgSend(*(id *)(a1 + 56), "loginType"));

      v23 = [*(id *)(a1 + 40) currentUserConfiguration];
      [v23 setState:0];

      os_signpost_id_t v24 = [MEMORY[0x263EFF910] date];
      v25 = [*(id *)(a1 + 40) currentUserConfiguration];
      [v25 setLastLoginDate:v24];

      SecKeyRef v26 = SecKeyCopyPublicKey((SecKeyRef)[*(id *)(a1 + 64) deviceEncryptionKey]);
      if (!v26)
      {
        __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_56();
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        v36 = *(void (**)(void))(*(void *)(a1 + 104) + 16);
        goto LABEL_19;
      }
      SecKeyRef v27 = v26;
      id v28 = [MEMORY[0x263F5E600] passwordDataFromContext:*(void *)(a1 + 72) error:0];
      id v59 = 0;
      char v29 = [MEMORY[0x263F5E600] encryptPendingSSOTokens:v8 usingPublicKey:v27 sharedData:v28 encryptedTokens:&v59];
      id v30 = v59;
      id v31 = v28;
      memset_s((void *)[v31 mutableBytes], objc_msgSend(v31, "length"), 0, objc_msgSend(v31, "length"));
      if ((v29 & 1) == 0)
      {
        __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_62();
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        CFRelease(v27);
LABEL_36:
        (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
        goto LABEL_37;
      }
      CFRelease(v27);
      if (([*(id *)(a1 + 40) saveStashedSSOTokens:v30 forUserName:*(void *)(a1 + 48)] & 1) == 0)
      {
        uint64_t v34 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_68();
        goto LABEL_35;
      }
      uid_t v32 = getuid();
      uint64_t v33 = *(void **)(a1 + 40);
      if (v32 == 92)
      {
        if (([*(id *)(a1 + 40) savePendingSSOTokens:v30 forUserName:*(void *)(a1 + 48)] & 1) == 0)
        {
          uint64_t v34 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_78();
LABEL_35:
          id v37 = (id)v34;
          goto LABEL_36;
        }
      }
      else
      {
        v38 = [*(id *)(a1 + 64) extensionIdentifier];
        id v58 = 0;
        int v39 = [v33 setTokens:v8 extensionIdentifier:v38 returningError:&v58];
        id v40 = v58;

        if (!v39)
        {
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_74;
          v56[3] = &unk_264BBECA8;
          id v57 = v40;
          id v37 = v40;
          id v54 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_74((uint64_t)v56);
          (*(void (**)(void))(*(void *)(a1 + 104) + 16))();

LABEL_37:
          goto LABEL_38;
        }
        v41 = [*(id *)(a1 + 80) process];
        [v41 setupTimerForAuthentication];

        os_signpost_id_t v42 = [*(id *)(a1 + 80) process];
        [v42 handleKerberosMappingForTokens:v8 loginConfiguration:*(void *)(a1 + 88) userConfiguration:*(void *)(a1 + 32)];

        v43 = [*(id *)(a1 + 80) distributedNotificationCenter];
        [v43 postNotificationName:@"com.apple.platformSSO.UserRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];
      }
      v44 = *(void **)(a1 + 96);
      if (v44)
      {
        v45 = [*(id *)(a1 + 32) userLoginConfiguration];
        uint64_t v46 = [v45 loginUserName];
        char v47 = [v44 isEqualToString:v46];

        if ((v47 & 1) == 0)
        {
          uint64_t v48 = *(void *)(a1 + 96);
          v49 = [*(id *)(a1 + 40) currentUserConfiguration];
          id v50 = [v49 userLoginConfiguration];
          [v50 setLoginUserName:v48];
        }
      }
      if (([*(id *)(a1 + 40) saveCurrentUserConfigurationAndSyncToPreboot:1] & 1) == 0)
      {
        uint64_t v34 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_81();
        goto LABEL_35;
      }
      v51 = [*(id *)(a1 + 80) process];
      [v51 handleUserAuthorizationUsing:v7 userName:*(void *)(a1 + 48) tokens:v8 configurationManager:*(void *)(a1 + 40)];

      id v52 = PO_LOG_POAgentProcess();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v52, OS_LOG_TYPE_INFO, "Authentication completed successfully", buf, 2u);
      }

LABEL_31:
      uint64_t v53 = *(void *)(a1 + 104);
      if (v53) {
        (*(void (**)(uint64_t, uint64_t, void))(v53 + 16))(v53, 1, 0);
      }
LABEL_39:

      return;
    case 2:
      v35 = [*(id *)(a1 + 40) currentUserConfiguration];
      [v35 setState:2];

      if ([*(id *)(a1 + 40) saveCurrentUserConfigurationAndSyncToPreboot:1])
      {
LABEL_9:
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_93;
        v55[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v55[4] = a2;
        v19 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_93((uint64_t)v55);
        (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
      }
      else
      {
        __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_87();
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        v36 = *(void (**)(void))(*(void *)(a1 + 104) + 16);
LABEL_19:
        v36();
LABEL_38:
      }
      goto LABEL_39;
    default:
      goto LABEL_31;
  }
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_56()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to get public key for encrypting tokens"];
  v1 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_62()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to encrypt login tokens"];
  v1 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_68()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to stash login tokens"];
  v1 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_74(uint64_t a1)
{
  v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to save login tokens"];
  CFTypeRef v2 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_78()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save login tokens"];
  v1 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_81()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after login success."];
  v1 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_87()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after permanent failure."];
  v1 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_93(uint64_t a1)
{
  CFTypeRef v2 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Login failed"];
  CFTypeID v3 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_93_cold_1((uint64_t)v2, a1, v3);
  }

  return v2;
}

- (void)updateLocalAccountPassword:(id)a3 passwordContextData:(id)a4 completion:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x263F10468];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (id)[[v8 alloc] initWithExternalizedContext:v10];

  [(POAgentProcess *)self updateLocalAccountPassword:v11 passwordContext:v12 completion:v9];
}

- (void)updateLocalAccountPassword:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  v5 = (void (**)(id, uint64_t, void))a5;
  id v6 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_230E51000, v6, OS_LOG_TYPE_INFO, "Checking local account", v7, 2u);
  }

  if (v5) {
    v5[2](v5, 3, 0);
  }
}

- (void)verifyPasswordLogin:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v18 = [MEMORY[0x263F5E600] maskName:v8];
    *(_DWORD *)buf = 136315906;
    v23 = "-[POAgentProcess verifyPasswordLogin:passwordContext:completion:]";
    __int16 v24 = 2114;
    v25 = v18;
    __int16 v26 = 2114;
    id v27 = v9;
    __int16 v28 = 2112;
    char v29 = self;
    _os_log_debug_impl(&dword_230E51000, v11, OS_LOG_TYPE_DEBUG, "%s loginUserName = %{public}@, passwordContext = %{public}@ on %@", buf, 0x2Au);
  }
  id v12 = [POConfigurationManager alloc];
  id v13 = [(POAgentProcess *)self directoryServices];
  id v14 = [(POConfigurationManager *)v12 initWithUserName:0 directoryServices:v13 sharedOnly:1];

  id v15 = [(POConfigurationManager *)v14 currentDeviceConfiguration];
  if (v15)
  {
    uint64_t v16 = [(POConfigurationManager *)v14 currentLoginConfiguration];
    if (v16)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __65__POAgentProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_103;
      v20[3] = &unk_264BBF0B8;
      id v21 = v10;
      v19.receiver = self;
      v19.super_class = (Class)POAgentProcess;
      [(POAgentCoreProcess *)&v19 _verifyLogin:v8 passwordContext:v9 smartCardContext:0 tokenId:0 deviceConfiguration:v15 loginConfiguration:v16 forAuthorization:1 completion:v20];
      v17 = v21;
    }
    else
    {
      v17 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_39();
      (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 2, v17);
    }
  }
  else
  {
    uint64_t v16 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_33();
    (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 2, v16);
  }
}

uint64_t __65__POAgentProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_103(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveCredentialForUserName:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315906;
    id v14 = "-[POAgentProcess saveCredentialForUserName:passwordContext:completion:]";
    __int16 v15 = 2114;
    id v16 = v8;
    __int16 v17 = 2114;
    id v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = self;
    _os_log_impl(&dword_230E51000, v11, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@, passwordContext = %{public}@ on %@", (uint8_t *)&v13, 0x2Au);
  }

  if ([(POAgentProcess *)self verifyAgentEntitlement]
    || [(POAgentProcess *)self verifyLoginUserEntitlement])
  {
    [(POAgentProcess *)self _saveCredentialForUserName:v8 passwordContext:v9 completion:v10];
  }
  else
  {
    id v12 = __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
    v10[2](v10, 0, v12);
  }
}

- (void)_saveCredentialForUserName:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v28 = "-[POAgentProcess _saveCredentialForUserName:passwordContext:completion:]";
    __int16 v29 = 2114;
    id v30 = v8;
    __int16 v31 = 2114;
    id v32 = v9;
    __int16 v33 = 2112;
    uint64_t v34 = self;
    _os_log_debug_impl(&dword_230E51000, v11, OS_LOG_TYPE_DEBUG, "%s userName = %{public}@, passwordContext = %{public}@ on %@", buf, 0x2Au);
  }

  id v12 = [[POConfigurationManager alloc] initWithUserName:v8];
  int v13 = (void *)[objc_alloc(MEMORY[0x263F10468]) initWithExternalizedContext:v9];
  id v26 = 0;
  id v14 = [MEMORY[0x263F5E600] passwordDataFromContext:v13 error:&v26];
  id v15 = v26;
  id v16 = v15;
  if (v15)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __72__POAgentProcess__saveCredentialForUserName_passwordContext_completion___block_invoke;
    v24[3] = &unk_264BBECA8;
    id v25 = v15;
    __int16 v17 = __72__POAgentProcess__saveCredentialForUserName_passwordContext_completion___block_invoke((uint64_t)v24);
    if (v10) {
      v10[2](v10, 0, v17);
    }
  }
  else
  {
    id v18 = [(POAgentProcess *)self keyWrap];
    __int16 v19 = [v18 wrapBlob:v14];
    uint64_t v20 = [(POConfigurationManager *)v12 currentUserConfiguration];
    objc_msgSend(v20, "set_credential:", v19);

    id v21 = v14;
    memset_s((void *)[v21 mutableBytes], objc_msgSend(v21, "length"), 0, objc_msgSend(v21, "length"));

    if ([(POConfigurationManager *)v12 saveCurrentUserConfigurationAndSyncToPreboot:0])
    {
      if (v10) {
        v10[2](v10, 1, 0);
      }
    }
    else
    {
      id v23 = v8;
      v22 = __72__POAgentProcess__saveCredentialForUserName_passwordContext_completion___block_invoke_112();
      if (v10) {
        v10[2](v10, 0, v22);
      }
    }
  }
}

id __72__POAgentProcess__saveCredentialForUserName_passwordContext_completion___block_invoke(uint64_t a1)
{
  v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Credential not found when saving credential for user"];
  CFTypeRef v2 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __72__POAgentProcess__saveCredentialForUserName_passwordContext_completion___block_invoke_112()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user credential."];
  v1 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

- (void)passwordDidChangeForUsername:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315906;
    id v14 = "-[POAgentProcess passwordDidChangeForUsername:passwordContext:completion:]";
    __int16 v15 = 2114;
    id v16 = v8;
    __int16 v17 = 2114;
    id v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = self;
    _os_log_impl(&dword_230E51000, v11, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@, passwordContext = %{public}@ on %@", (uint8_t *)&v13, 0x2Au);
  }

  if ([(POAgentProcess *)self verifyPasswordChangeEntitlement])
  {
    [(POAgentProcess *)self _saveCredentialForUserName:v8 passwordContext:v9 completion:v10];
  }
  else
  {
    id v12 = __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
    v10[2](v10, 0, v12);
  }
}

- (void)screenDidUnlockWithCredentialContext:(id)a3 smartCardContext:(id)a4 biometricContext:(id)a5 tokenId:(id)a6 atLogin:(BOOL)a7 tokenUnlock:(BOOL)a8 completion:(id)a9
{
  uint64_t v9 = a8;
  BOOL v10 = a7;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  __int16 v19 = (void (**)(id, void))a9;
  uint64_t v20 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v53 = "-[POAgentProcess screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenU"
          "nlock:completion:]";
    __int16 v54 = 1026;
    uid_t v55 = getuid();
    __int16 v56 = 2114;
    id v57 = v15;
    __int16 v58 = 2114;
    id v59 = v16;
    __int16 v60 = 2114;
    id v61 = v17;
    __int16 v62 = 2112;
    v63 = self;
    _os_log_impl(&dword_230E51000, v20, OS_LOG_TYPE_DEFAULT, "%s uid = %{public}d, context = %{public}@, sccontext = %{public}@, bcontext = %{public}@ on %@", buf, 0x3Au);
  }

  if ([(POAgentProcess *)self verifyAgentEntitlement])
  {
    *(_DWORD *)buf = 0;
    id v21 = objc_alloc_init(MEMORY[0x263F10468]);
    unsigned int v48 = v9;
    BOOL v49 = v10;
    if (v15)
    {
      id v46 = v18;
      id v47 = v17;
      v22 = (void *)[objc_alloc(MEMORY[0x263F10468]) initWithExternalizedContext:v15 userSession:buf];
      id v51 = 0;
      id v23 = [MEMORY[0x263F5E600] passwordDataFromContext:v22 error:&v51];
      id v24 = v51;
      if (v23)
      {
        [v21 setCredential:v23 type:-9];
        id v25 = v23;
        v44 = self;
        id v26 = v15;
        id v27 = v16;
        id v28 = v21;
        uint64_t v29 = [v25 mutableBytes];
        id v30 = v19;
        __int16 v31 = v22;
        uint64_t v32 = [v25 length];
        rsize_t v33 = [v25 length];
        uint64_t v34 = (void *)v29;
        id v21 = v28;
        id v16 = v27;
        id v15 = v26;
        self = v44;
        rsize_t v35 = v32;
        v22 = v31;
        __int16 v19 = v30;
LABEL_11:
        memset_s(v34, v35, 0, v33);
LABEL_19:
        [v22 invalidate];

        id v18 = v46;
        id v17 = v47;
        goto LABEL_20;
      }
      os_signpost_id_t v42 = PO_LOG_POAgentProcess();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[POAgentProcess screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenUnlock:completion:]();
      }
    }
    else
    {
      if (!v16)
      {
        if (!v17)
        {
          id v24 = 0;
          goto LABEL_21;
        }
        id v24 = 0;
        v22 = v21;
        id v21 = (id)[objc_alloc(MEMORY[0x263F10468]) initWithExternalizedContext:v17 userSession:buf];
LABEL_20:

        uint64_t v9 = v48;
LABEL_21:
        v43 = [(POAgentProcess *)self process];
        [v43 handleScreenUnlockWithCredentialContext:v21 tokenId:v18 atLogin:v49 tokenUnlock:v9];

        v19[2](v19, 0);
        goto LABEL_22;
      }
      id v46 = v18;
      id v47 = v17;
      v22 = (void *)[objc_alloc(MEMORY[0x263F10468]) initWithExternalizedContext:v16 userSession:buf];
      id v50 = 0;
      id v23 = [MEMORY[0x263F5E600] passwordDataFromContext:v22 error:&v50];
      id v24 = v50;
      if (v23)
      {
        [v21 setCredential:v23 type:-3];
        v45 = v22;
        id v36 = v23;
        uint64_t v37 = [v36 mutableBytes];
        id v38 = v16;
        id v39 = v21;
        uint64_t v40 = [v36 length];
        v41 = v36;
        v22 = v45;
        rsize_t v33 = [v41 length];
        uint64_t v34 = (void *)v37;
        rsize_t v35 = v40;
        id v21 = v39;
        id v16 = v38;
        id v15 = 0;
        goto LABEL_11;
      }
      os_signpost_id_t v42 = PO_LOG_POAgentProcess();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[POAgentProcess screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenUnlock:completion:]();
      }
    }

    goto LABEL_19;
  }
  __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, id))v19)[2](v19, v24);
LABEL_22:
}

- (void)retainContextForUserName:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void))a5;
  id v11 = PO_LOG_POAgentProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    id v16 = "-[POAgentProcess retainContextForUserName:context:completion:]";
    __int16 v17 = 2114;
    id v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = self;
    _os_log_impl(&dword_230E51000, v11, OS_LOG_TYPE_DEFAULT, "%s context = %{public}@ on %@", (uint8_t *)&v15, 0x20u);
  }

  if ([(POAgentProcess *)self verifyAgentEntitlement])
  {
    if (v9)
    {
      id v12 = (void *)[objc_alloc(MEMORY[0x263F10468]) initWithExternalizedContext:v9];
      int v13 = [(id)objc_opt_class() retainedContexts];
      [v13 setObject:v12 forKeyedSubscript:v8];
    }
    else
    {
      id v12 = [(id)objc_opt_class() retainedContexts];
      [v12 setObject:0 forKeyedSubscript:v8];
    }

    v10[2](v10, 0);
  }
  else
  {
    id v14 = __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
    ((void (**)(id, void *))v10)[2](v10, v14);
  }
}

- (void)configurationDidChangeAndRemovedExtension:(id)a3 removed:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  id v8 = (void (**)(id, uint64_t, void))a5;
  if ([(POAgentProcess *)self verifyAgentEntitlement])
  {
    if (v6)
    {
      id v9 = [(POAgentProcess *)self process];
      [v9 configurationRemovedForExtension:v12];
    }
    BOOL v10 = [(POAgentProcess *)self process];
    [v10 configurationChanged];

    v8[2](v8, 1, 0);
  }
  else
  {
    uint64_t v11 = __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
    v8[2](v8, 0, v11);

    id v8 = (void (**)(id, uint64_t, void))v11;
  }
}

- (PODirectoryServices)directoryServices
{
  return (PODirectoryServices *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDirectoryServices:(id)a3
{
}

- (POAgentAuthenticationProcess)process
{
  return (POAgentAuthenticationProcess *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProcess:(id)a3
{
}

- (POKeyWrap)keyWrap
{
  return (POKeyWrap *)objc_getProperty(self, a2, 88, 1);
}

- (void)setKeyWrap:(id)a3
{
}

- (POKeychainHelper)keychainHelper
{
  return (POKeychainHelper *)objc_getProperty(self, a2, 96, 1);
}

- (void)setKeychainHelper:(id)a3
{
}

- (NSDistributedNotificationCenter)distributedNotificationCenter
{
  return (NSDistributedNotificationCenter *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDistributedNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distributedNotificationCenter, 0);
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_keyWrap, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_directoryServices, 0);

  objc_destroyWeak((id *)&self->_xpcConnection);
}

- (void)initWithXPCConnection:(NSObject *)a3 authenticationProcess:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = 136315650;
  BOOL v6 = "-[POAgentProcess initWithXPCConnection:authenticationProcess:]";
  __int16 v7 = 1026;
  int v8 = [a1 auditSessionIdentifier];
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_230E51000, a3, OS_LOG_TYPE_DEBUG, "%s asid= %{public}d on %@", (uint8_t *)&v5, 0x1Cu);
}

- (void)initWithAuthenticationProcess:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  CFTypeID v3 = "-[POAgentProcess initWithAuthenticationProcess:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_230E51000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

- (void)verifyAgentEntitlement
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_230E51000, v0, v1, "missing required entitlement", v2, v3, v4, v5, v6);
}

- (void)getLoginTypeForUser:(os_log_t)log completion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "-[POAgentProcess getLoginTypeForUser:completion:]";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_230E51000, log, OS_LOG_TYPE_DEBUG, "%s userName = %{public}@ on %@", (uint8_t *)&v3, 0x20u);
}

- (void)getLoginTypeForUser:completion:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Platform SSO is not configured.", v2, v3, v4, v5, v6);
}

void __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_1(&dword_230E51000, v0, v1, "%{public}@, %{public}@");
}

void __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_93_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:*(void *)(a2 + 32)];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_230E51000, a3, OS_LOG_TYPE_ERROR, "%{public}@, %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenUnlock:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "PIN is missing", v2, v3, v4, v5, v6);
}

- (void)screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenUnlock:completion:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Password is missing", v2, v3, v4, v5, v6);
}

@end