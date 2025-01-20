@interface POExtensionAgentProcess
- (BOOL)isCallerCurrentSSOExtension;
- (BOOL)isURL:(id)a3 validForProfile:(id)a4;
- (NSMutableArray)keyProxies;
- (NSMutableDictionary)_analytics;
- (NSNumber)pendingEncryptionAlgorithm;
- (NSNumber)pendingSigningAlgorithm;
- (NSNumber)pendingUserSEPSigningAlgorithm;
- (NSObject)authenticationObserver;
- (POAgentAuthenticationProcess)agentProcess;
- (POConfigurationManager)configurationManager;
- (POExtensionAgentProcess)initWithXPCConnection:(id)a3 authenticationProcess:(id)a4;
- (POKeychainHelper)keychainHelper;
- (SOConfigurationHost)configurationHost;
- (__SecKey)pendingEncryptionKey;
- (__SecKey)pendingSigningKey;
- (__SecKey)pendingUserSEPKey;
- (id)authenticationCompletion;
- (id)bundleIdentiferForXPCConnection:(id)a3;
- (id)identityForKeyType:(int64_t)a3;
- (id)invalidationHandler;
- (id)keyProxyEndpointForKeyType:(int64_t)a3;
- (void)addEvent:(id)a3;
- (void)addEvent:(id)a3 forKeyType:(int64_t)a4;
- (void)attestKey:(int64_t)a3 clientDataHash:(id)a4 completion:(id)a5;
- (void)completeRotationKeyForKeyType:(int64_t)a3 completion:(id)a4;
- (void)connectionInvalidated;
- (void)copyDeviceAttestationCertificateWithCompletion:(id)a3;
- (void)deviceRegistrationsNeedsRepairWithCompletion:(id)a3;
- (void)invalidateAllKeyProxies;
- (void)isCallerCurrentSSOExtension;
- (void)isDeviceRegisteredWithCompletion:(id)a3;
- (void)isUserRegisteredWithCompletion:(id)a3;
- (void)loginConfigurationWithCompletion:(id)a3;
- (void)loginUserNameWithCompletion:(id)a3;
- (void)presentRegistrationViewControllerWithCompletion:(id)a3;
- (void)registrationTokenWithCompletion:(id)a3;
- (void)resetDeviceKeysWithCompletion:(id)a3;
- (void)resetUserSecureEnclaveKeyWithCompletion:(id)a3;
- (void)rotateKeyForKeyType:(int64_t)a3 completion:(id)a4;
- (void)secIdentityProxyEndpointForKeyType:(int64_t)a3 completion:(id)a4;
- (void)secKeyProxyEndpointForKeyType:(int64_t)a3 completion:(id)a4;
- (void)setAgentProcess:(id)a3;
- (void)setAuthenticationCompletion:(id)a3;
- (void)setAuthenticationObserver:(id)a3;
- (void)setCertificateData:(id)a3 keyType:(int64_t)a4 completion:(id)a5;
- (void)setConfigurationHost:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setKeyProxies:(id)a3;
- (void)setKeychainHelper:(id)a3;
- (void)setLoginConfiguration:(id)a3 completion:(id)a4;
- (void)setLoginUserName:(id)a3 completion:(id)a4;
- (void)setPendingEncryptionAlgorithm:(id)a3;
- (void)setPendingEncryptionKey:(__SecKey *)a3;
- (void)setPendingSigningAlgorithm:(id)a3;
- (void)setPendingSigningKey:(__SecKey *)a3;
- (void)setPendingUserSEPKey:(__SecKey *)a3;
- (void)setPendingUserSEPSigningAlgorithm:(id)a3;
- (void)setRegistrationToken:(id)a3 completion:(id)a4;
- (void)setSsoTokens:(id)a3 completion:(id)a4;
- (void)setUserLoginConfiguration:(id)a3 completion:(id)a4;
- (void)set_analytics:(id)a3;
- (void)ssoTokensWithCompletion:(id)a3;
- (void)userLoginConfigurationWithCompletion:(id)a3;
- (void)userNeedsReauthenticationWithCompletion:(id)a3;
- (void)userRegistrationsNeedsRepairWithCompletion:(id)a3;
@end

@implementation POExtensionAgentProcess

- (POExtensionAgentProcess)initWithXPCConnection:(id)a3 authenticationProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)POExtensionAgentProcess;
  v8 = [(POExtensionAgentProcess *)&v24 init];
  if (v8)
  {
    uint64_t v9 = +[POConfigurationManager sharedInstance];
    configurationManager = v8->_configurationManager;
    v8->_configurationManager = (POConfigurationManager *)v9;

    uint64_t v11 = [MEMORY[0x263F25258] defaultManager];
    configurationHost = v8->_configurationHost;
    v8->_configurationHost = (SOConfigurationHost *)v11;

    objc_storeWeak((id *)&v8->_xpcConnection, v6);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __71__POExtensionAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke;
    v22[3] = &unk_264BBF278;
    v13 = v8;
    v23 = v13;
    id WeakRetained = objc_loadWeakRetained((id *)&v8->_xpcConnection);
    [WeakRetained setInterruptionHandler:v22];

    uint64_t v15 = [MEMORY[0x263EFF980] array];
    keyProxies = v13->_keyProxies;
    v13->_keyProxies = (NSMutableArray *)v15;

    objc_storeStrong((id *)&v13->_agentProcess, a4);
    v17 = (POKeychainHelper *)objc_alloc_init(MEMORY[0x263F5E638]);
    keychainHelper = v13->_keychainHelper;
    v13->_keychainHelper = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    analytics = v13->__analytics;
    v13->__analytics = v19;
  }
  return v8;
}

void __71__POExtensionAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateAllKeyProxies];
  v2 = [*(id *)(a1 + 32) authenticationObserver];

  if (v2)
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    v3 = [*(id *)(a1 + 32) authenticationObserver];
    [v4 removeObserver:v3];
  }
}

- (void)connectionInvalidated
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    v10 = "-[POExtensionAgentProcess connectionInvalidated]";
    __int16 v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v9, 0x16u);
  }

  id v4 = (void *)MEMORY[0x263F5E5D8];
  v5 = [(POExtensionAgentProcess *)self _analytics];
  [v4 analyticsForLoginManager:v5];

  [(POExtensionAgentProcess *)self invalidateAllKeyProxies];
  id v6 = [(POExtensionAgentProcess *)self authenticationObserver];

  if (v6)
  {
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    v8 = [(POExtensionAgentProcess *)self authenticationObserver];
    [v7 removeObserver:v8];
  }
}

- (id)keyProxyEndpointForKeyType:(int64_t)a3
{
  v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess keyProxyEndpointForKeyType:]();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  id v7 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:WeakRetained];

  if (v7)
  {
    v8 = [(POExtensionAgentProcess *)self configurationManager];
    int v9 = [v8 currentDeviceConfiguration];

    if (v9 && [(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
    {
      v47[0] = 0;
      switch(a3)
      {
        case 1:
          v14 = [(POExtensionAgentProcess *)self configurationManager];
          uint64_t v15 = [v14 userDeviceConfiguration];

          if (!v15) {
            goto LABEL_7;
          }
          v16 = [(POExtensionAgentProcess *)self configurationManager];
          v17 = [v16 userDeviceConfiguration];
          uint64_t v18 = [v17 deviceSigningKey];
          goto LABEL_18;
        case 2:
          v19 = [(POExtensionAgentProcess *)self configurationManager];
          v20 = [v19 userDeviceConfiguration];

          if (!v20) {
            goto LABEL_14;
          }
          v16 = [(POExtensionAgentProcess *)self configurationManager];
          v17 = [v16 userDeviceConfiguration];
          uint64_t v18 = [v17 deviceEncryptionKey];
LABEL_18:
          uint64_t v21 = v18;
          v47[0] = v18;

          if (v21) {
            goto LABEL_19;
          }
          goto LABEL_28;
        case 3:
          v16 = [(POExtensionAgentProcess *)self configurationManager];
          v17 = [v16 currentUserConfiguration];
          uint64_t v18 = [v17 sepKey];
          goto LABEL_18;
        case 4:
        case 10:
LABEL_7:
          uint64_t v10 = [v9 deviceSigningKey];
          goto LABEL_15;
        case 5:
        case 11:
LABEL_14:
          uint64_t v10 = [v9 deviceEncryptionKey];
LABEL_15:
          v47[0] = v10;
          if (!v10) {
            goto LABEL_28;
          }
          goto LABEL_19;
        case 20:
          CFTypeRef cf = 0;
          id v26 = objc_alloc_init(MEMORY[0x263F10468]);
          long long v44 = 0u;
          long long v45 = 0u;
          id v27 = objc_loadWeakRetained((id *)&self->_xpcConnection);
          v28 = v27;
          if (v27)
          {
            [v27 auditToken];
          }
          else
          {
            long long v44 = 0u;
            long long v45 = 0u;
          }

          v29 = [MEMORY[0x263EFF8F8] dataWithBytes:&v44 length:32];
          [v26 setOptionCallerAuditToken:v29];

          v41 = [(POExtensionAgentProcess *)self keychainHelper];
          v43 = [(POExtensionAgentProcess *)self configurationManager];
          v42 = [v43 currentUserConfiguration];
          v30 = [v42 smartCardTokenId];
          v31 = [(POExtensionAgentProcess *)self configurationManager];
          v32 = [v31 currentUserConfiguration];
          v33 = [v32 smartCardHash];
          char v34 = [v41 retrieveCertAndKeyForTokenId:v30 context:v26 forSigning:1 hash:v33 certificate:&cf privateKey:v47];

          if ((v34 & 1) == 0) {
            id v35 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke_16();
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }

          if (!v47[0]) {
            goto LABEL_28;
          }
LABEL_19:
          id v22 = objc_alloc(MEMORY[0x263F16D70]);
          id v23 = (id)[v22 initWithKey:v47[0]];
          objc_super v24 = self;
          objc_sync_enter(v24);
          v25 = [(POExtensionAgentProcess *)v24 keyProxies];
          [v25 addObject:v23];

          objc_sync_exit(v24);
          v12 = [v23 endpoint];
          break;
        default:
LABEL_28:
          v36 = NSString;
          v37 = [NSNumber numberWithInteger:a3];
          v38 = [v36 stringWithFormat:@"%@, %@", v7, v37];

          id v23 = v38;
          id v39 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke_27();

          v12 = 0;
          break;
      }
    }
    else
    {
      v47[1] = MEMORY[0x263EF8330];
      v47[2] = 3221225472;
      v47[3] = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke_10;
      v47[4] = &unk_264BBECA8;
      id v48 = v7;
      id v11 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke_10();

      v12 = 0;
    }
  }
  else
  {
    id v13 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    v12 = 0;
  }

  return v12;
}

id __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to retrieve extension identifier."];
  v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke_10()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Failed to retrieve device configuration for extension."];
  v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

id __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke_16()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to find SmartCard."];
  v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke_27()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"Key not found for extension identifier."];
  v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

- (id)identityForKeyType:(int64_t)a3
{
  v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess identityForKeyType:]();
  }

  id v6 = [(POExtensionAgentProcess *)self configurationManager];
  id v7 = [v6 currentDeviceConfiguration];

  if (v7)
  {
    uint64_t v40 = 0;
    switch(a3)
    {
      case 1:
        v12 = [(POExtensionAgentProcess *)self configurationManager];
        id v13 = [v12 userDeviceConfiguration];

        if (!v13) {
          goto LABEL_5;
        }
        v14 = [(POExtensionAgentProcess *)self configurationManager];
        uint64_t v15 = [v14 userDeviceConfiguration];
        uint64_t v16 = [v15 deviceSigningIdentity];
        goto LABEL_14;
      case 2:
        v17 = [(POExtensionAgentProcess *)self configurationManager];
        uint64_t v18 = [v17 userDeviceConfiguration];

        if (!v18) {
          goto LABEL_17;
        }
        v14 = [(POExtensionAgentProcess *)self configurationManager];
        uint64_t v15 = [v14 userDeviceConfiguration];
        uint64_t v16 = [v15 deviceEncryptionIdentity];
LABEL_14:
        uint64_t v19 = v16;
        uint64_t v40 = v16;

        if (!v19) {
          goto LABEL_15;
        }
        goto LABEL_19;
      case 3:
      case 6:
      case 7:
      case 8:
      case 9:
        goto LABEL_15;
      case 4:
      case 10:
LABEL_5:
        uint64_t v8 = [v7 deviceSigningIdentity];
        goto LABEL_18;
      case 5:
      case 11:
LABEL_17:
        uint64_t v8 = [v7 deviceEncryptionIdentity];
LABEL_18:
        uint64_t v40 = v8;
        if (v8) {
          goto LABEL_19;
        }
        goto LABEL_15;
      default:
        if (a3 != 20) {
          goto LABEL_15;
        }
        id v36 = objc_alloc_init(MEMORY[0x263F10468]);
        long long v38 = 0u;
        long long v39 = 0u;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
        id v11 = WeakRetained;
        if (WeakRetained)
        {
          [WeakRetained auditToken];
        }
        else
        {
          long long v38 = 0u;
          long long v39 = 0u;
        }

        uint64_t v27 = [MEMORY[0x263EFF8F8] dataWithBytes:&v38 length:32];
        [v36 setOptionCallerAuditToken:v27];

        char v34 = [(POExtensionAgentProcess *)self keychainHelper];
        id v35 = [(POExtensionAgentProcess *)self configurationManager];
        v28 = [v35 currentUserConfiguration];
        v29 = [v28 smartCardTokenId];
        v30 = [(POExtensionAgentProcess *)self configurationManager];
        v31 = [v30 currentUserConfiguration];
        v32 = [v31 smartCardHash];
        LOBYTE(v27) = [v34 retrieveIdentityForTokenId:v29 context:v36 forSigning:1 hash:v32 identity:&v40];

        if ((v27 & 1) == 0) {
          id v33 = __46__POExtensionAgentProcess_identityForKeyType___block_invoke_37();
        }

        if (!v40)
        {
LABEL_15:
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __46__POExtensionAgentProcess_identityForKeyType___block_invoke_43;
          v37[3] = &__block_descriptor_40_e14___NSError_8__0l;
          v37[4] = a3;
          id v20 = __46__POExtensionAgentProcess_identityForKeyType___block_invoke_43((uint64_t)v37);
          goto LABEL_16;
        }
LABEL_19:
        id v22 = objc_alloc(MEMORY[0x263F16D70]);
        id v23 = (void *)[v22 initWithIdentity:v40];
        objc_super v24 = self;
        objc_sync_enter(v24);
        v25 = [(POExtensionAgentProcess *)v24 keyProxies];
        [v25 addObject:v23];

        objc_sync_exit(v24);
        uint64_t v21 = [v23 endpoint];

        break;
    }
  }
  else
  {
    id v9 = __46__POExtensionAgentProcess_identityForKeyType___block_invoke();
LABEL_16:
    uint64_t v21 = 0;
  }

  return v21;
}

id __46__POExtensionAgentProcess_identityForKeyType___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"No device configuration for identity."];
  v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __46__POExtensionAgentProcess_identityForKeyType___block_invoke_37()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"Failed to find SmartCard identity."];
  v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __46__POExtensionAgentProcess_identityForKeyType___block_invoke_43(uint64_t a1)
{
  v2 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"Key not found."];
  v3 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __46__POExtensionAgentProcess_identityForKeyType___block_invoke_43_cold_1((uint64_t)v2, a1, v3);
  }

  return v2;
}

- (void)invalidateAllKeyProxies
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (id)bundleIdentiferForXPCConnection:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = v3;
  memset(&v16, 0, sizeof(v16));
  if (v3) {
    [v3 auditToken];
  }
  uint64_t v15 = 0;
  audit_token_t buf = v16;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    uint64_t v5 = v15;
    id v6 = PO_LOG_POExtensionAgentProcess();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[POExtensionAgentProcess bundleIdentiferForXPCConnection:]();
    }
LABEL_6:

    goto LABEL_7;
  }
  uint64_t v8 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.val[0]) = 0;
    _os_log_impl(&dword_230E51000, v8, OS_LOG_TYPE_DEFAULT, "bundleIdentifier: CPCopyBundleIdentifierAndTeamFromAuditToken() failed, trying SecTaskCopySigningIdentifier().", (uint8_t *)&buf, 2u);
  }

  audit_token_t buf = v16;
  id v9 = SecTaskCreateWithAuditToken(0, &buf);
  uint64_t v5 = v9;
  if (v9)
  {
    CFErrorRef error = 0;
    id v6 = SecTaskCopySigningIdentifier(v9, &error);
    CFRelease(v5);
    if (error)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __59__POExtensionAgentProcess_bundleIdentiferForXPCConnection___block_invoke;
      v13[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v13[4] = error;
      id v10 = __59__POExtensionAgentProcess_bundleIdentiferForXPCConnection___block_invoke((uint64_t)v13);
      uint64_t v5 = 0;
    }
    else
    {
      v12 = PO_LOG_POExtensionAgentProcess();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        buf.val[0] = 138543362;
        *(void *)&buf.val[1] = v6;
        _os_log_impl(&dword_230E51000, v12, OS_LOG_TYPE_INFO, "bundleIdentifier: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v5 = v6;
    }
    goto LABEL_6;
  }
  id v11 = __59__POExtensionAgentProcess_bundleIdentiferForXPCConnection___block_invoke_50();
LABEL_7:

  return v5;
}

id __59__POExtensionAgentProcess_bundleIdentiferForXPCConnection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:v1 description:@"bundleIdentifier: SecTaskCopySigningIdentifier() failed"];

  id v3 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v2;
}

id __59__POExtensionAgentProcess_bundleIdentiferForXPCConnection___block_invoke_50()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"bundleIdentifier: SecTaskCreateWithAuditToken() failed."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)isCallerCurrentSSOExtension
{
  id v3 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess isCallerCurrentSSOExtension]();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  uint64_t v5 = [WeakRetained valueForEntitlement:@"com.apple.private.platformsso.loginmanager"];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_xpcConnection);
    id v9 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:v8];

    id v10 = [(POExtensionAgentProcess *)self configurationManager];
    id v11 = [v10 currentDeviceConfiguration];

    if (v11)
    {
      v12 = [(POExtensionAgentProcess *)self configurationManager];
      id v13 = [v12 currentDeviceConfiguration];
      v14 = [v13 extensionIdentifier];
      char v15 = [v14 isEqualToString:v9];

      if (v15)
      {
        BOOL v7 = 1;
LABEL_11:

        return v7;
      }
      audit_token_t v16 = (id *)v20;
      v20[0] = v9;
      id v18 = __54__POExtensionAgentProcess_isCallerCurrentSSOExtension__block_invoke_59();
    }
    else
    {
      v20[1] = MEMORY[0x263EF8330];
      v20[2] = 3221225472;
      v20[3] = __54__POExtensionAgentProcess_isCallerCurrentSSOExtension__block_invoke;
      v20[4] = &unk_264BBECA8;
      audit_token_t v16 = &v21;
      id v21 = v9;
      id v17 = __54__POExtensionAgentProcess_isCallerCurrentSSOExtension__block_invoke();
    }

    BOOL v7 = 0;
    goto LABEL_11;
  }
  return 1;
}

id __54__POExtensionAgentProcess_isCallerCurrentSSOExtension__block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Failed to retrieve device configuration for extension."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

id __54__POExtensionAgentProcess_isCallerCurrentSSOExtension__block_invoke_59()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Caller is not current extension"];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

- (void)isDeviceRegisteredWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess isDeviceRegisteredWithCompletion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"isDeviceRegistered"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  BOOL v7 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:WeakRetained];

  if (!v7)
  {
    char v15 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    if (v4) {
      v4[2](v4, 0, v15);
    }
    goto LABEL_11;
  }
  id v8 = [(POExtensionAgentProcess *)self configurationManager];
  uint64_t v9 = [v8 currentDeviceConfiguration];
  if (!v9) {
    goto LABEL_13;
  }
  id v10 = (void *)v9;
  id v11 = [(POExtensionAgentProcess *)self configurationManager];
  v12 = [v11 currentDeviceConfiguration];
  if (![v12 registrationCompleted])
  {

LABEL_13:
    goto LABEL_14;
  }
  BOOL v13 = [(POExtensionAgentProcess *)self isCallerCurrentSSOExtension];

  if (v13)
  {
    v14 = [(POExtensionAgentProcess *)self configurationManager];
    char v15 = [v14 currentLoginConfiguration];

    if (v4) {
      ((void (**)(id, BOOL, void *))v4)[2](v4, v15 != 0, 0);
    }
LABEL_11:

    goto LABEL_16;
  }
LABEL_14:
  if (v4) {
    v4[2](v4, 0, 0);
  }
LABEL_16:
}

- (void)isUserRegisteredWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess isUserRegisteredWithCompletion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"isUserRegistered"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  BOOL v7 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:WeakRetained];

  if (!v7)
  {
    uint64_t v9 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    if (v4) {
      v4[2](v4, 0, v9);
    }
    goto LABEL_9;
  }
  if ([(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
  {
    id v8 = [(POExtensionAgentProcess *)self configurationManager];
    uint64_t v9 = [v8 currentUserConfiguration];

    if (v4) {
      ((void (**)(id, BOOL, void *))v4)[2](v4, v9 != 0, 0);
    }
LABEL_9:

    goto LABEL_12;
  }
  if (v4) {
    v4[2](v4, 0, 0);
  }
LABEL_12:
}

- (void)registrationTokenWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess registrationTokenWithCompletion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"registrationToken"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  BOOL v7 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:WeakRetained];

  if (v7)
  {
    id v8 = [POProfile alloc];
    uint64_t v9 = [(POExtensionAgentProcess *)self configurationHost];
    id v10 = [v9 validatedProfileForPlatformSSO];
    id v11 = [(POProfile *)v8 initWithProfile:v10];

    if (v11)
    {
      if (![(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
      {
        (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
        goto LABEL_12;
      }
      v12 = [(POProfile *)v11 registrationToken];
      (*((void (**)(id, void *, void))v4 + 2))(v4, v12, 0);
    }
    else
    {
      v12 = __59__POExtensionAgentProcess_registrationTokenWithCompletion___block_invoke_79();
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v12);
    }
  }
  else
  {
    __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    id v11 = (POProfile *)objc_claimAutoreleasedReturnValue();
    if (v4) {
      (*((void (**)(id, void, POProfile *))v4 + 2))(v4, 0, v11);
    }
  }
LABEL_12:
}

id __59__POExtensionAgentProcess_registrationTokenWithCompletion___block_invoke_79()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"No platform SSO Profiles."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)setRegistrationToken:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, void, void *))a4;
  uint64_t v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess setRegistrationToken:completion:]();
  }

  if (v4)
  {
    char v6 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"not impl"];
    v4[2](v4, 0, v6);
  }
}

- (void)ssoTokensWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess ssoTokensWithCompletion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"SSOTokens"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  BOOL v7 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:WeakRetained];

  if (v7)
  {
    id v8 = [(POExtensionAgentProcess *)self configurationManager];
    uint64_t v9 = [v8 currentDeviceConfiguration];

    if (!v9 || ![(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
    {
      error[1] = (CFErrorRef)MEMORY[0x263EF8330];
      error[2] = (CFErrorRef)3221225472;
      error[3] = (CFErrorRef)__51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_93;
      error[4] = (CFErrorRef)&unk_264BBECA8;
      CFDataRef v22 = v7;
      audit_token_t v16 = __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_93();
      if (v4) {
        v4[2](v4, 0, v16);
      }

      CFDataRef v12 = v22;
      goto LABEL_29;
    }
    id v10 = [(POExtensionAgentProcess *)self configurationManager];
    id v11 = [v9 extensionIdentifier];
    CFDataRef v12 = [v10 tokensForExtensionIdentifier:v11];

    if (!v12)
    {
      id v17 = PO_LOG_POExtensionAgentProcess();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[POExtensionAgentProcess ssoTokensWithCompletion:](v17);
      }

      if (v4) {
        v4[2](v4, 0, 0);
      }
      goto LABEL_29;
    }
    if ([v9 deviceEncryptionKey])
    {
      BOOL v13 = SecKeyCopyPublicKey((SecKeyRef)[v9 deviceEncryptionKey]);
      if (v13)
      {
        v14 = v13;
        if (SecKeyIsAlgorithmSupported(v13, kSecKeyOperationTypeEncrypt, (SecKeyAlgorithm)*MEMORY[0x263F17310]))
        {
          error[0] = 0;
          CFDataRef EncryptedData = SecKeyCreateEncryptedData(v14, (SecKeyAlgorithm)*MEMORY[0x263F17320], v12, error);
          CFRelease(v14);
          if (error[0] || !EncryptedData)
          {
            v20[0] = MEMORY[0x263EF8330];
            v20[1] = 3221225472;
            v20[2] = __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_112;
            v20[3] = &__block_descriptor_40_e14___NSError_8__0l;
            v20[4] = error[0];
            uint64_t v19 = __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_112((uint64_t)v20);
            if (v4) {
              v4[2](v4, 0, v19);
            }
          }
          else if (v4)
          {
            ((void (**)(id, CFDataRef, void *))v4)[2](v4, EncryptedData, 0);
          }
LABEL_28:

LABEL_29:
          goto LABEL_30;
        }
        CFRelease(v14);
        uint64_t v18 = __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_106();
      }
      else
      {
        uint64_t v18 = __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_100();
      }
    }
    else
    {
      uint64_t v18 = __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_94();
    }
    CFDataRef EncryptedData = (CFDataRef)v18;
    if (v4) {
      v4[2](v4, 0, (void *)v18);
    }
    goto LABEL_28;
  }
  uint64_t v9 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
  if (v4) {
    v4[2](v4, 0, v9);
  }
LABEL_30:
}

id __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_93()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Failed to retrieve device configuration for extension."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

id __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_94()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"Missing device encryption key."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_100()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"Missing device encryption public key."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_106()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Encryption algorithm not supported."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_112(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:v1 description:@"Failed to encrypt tokens."];

  id v3 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v2;
}

- (void)setSsoTokens:(id)a3 completion:(id)a4
{
  CFDataRef v6 = (const __CFData *)a3;
  BOOL v7 = (void (**)(id, void, void *))a4;
  id v8 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess setSsoTokens:completion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"setSSOTokens"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  id v10 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:WeakRetained];

  if (!v10)
  {
    CFDataRef v12 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    if (v7) {
      v7[2](v7, 0, v12);
    }
    goto LABEL_38;
  }
  id v11 = [(POExtensionAgentProcess *)self configurationManager];
  CFDataRef v12 = [v11 currentDeviceConfiguration];

  if (!v12 || ![(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
  {
    v52[1] = (id)MEMORY[0x263EF8330];
    v52[2] = (id)3221225472;
    v52[3] = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_121;
    v52[4] = &unk_264BBECA8;
    id v53 = v10;
    id v26 = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_121();
    if (v7) {
      v7[2](v7, 0, v26);
    }

    goto LABEL_38;
  }
  if (!v6)
  {
    uint64_t v27 = [(POExtensionAgentProcess *)self configurationManager];
    v28 = [v12 extensionIdentifier];
    v52[0] = 0;
    int v29 = [v27 setTokens:0 extensionIdentifier:v28 returningError:v52];
    CFDataRef v16 = (CFDataRef)v52[0];
    if (v29)
    {
      v30 = [(POExtensionAgentProcess *)self configurationManager];
      v31 = NSUserName();
      if ([v30 savePendingSSOTokens:0 forUserName:v31])
      {
        v32 = [(POExtensionAgentProcess *)self configurationManager];
        NSUserName();
        v33 = CFDataRef v39 = v16;
        char v38 = [v32 saveStashedSSOTokens:0 forUserName:v33];

        CFDataRef v16 = v39;
        if (v38)
        {
          if (v7) {
            v7[2](v7, 1, 0);
          }
          goto LABEL_37;
        }
        goto LABEL_33;
      }
    }
LABEL_33:
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_122;
    v50[3] = &unk_264BBECA8;
    CFDataRef v51 = v16;
    id v36 = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_122((uint64_t)v50);
    v7[2](v7, 0, v36);

LABEL_37:
    goto LABEL_38;
  }
  BOOL v13 = (__SecKey *)[v12 deviceEncryptionKey];
  if (SecKeyIsAlgorithmSupported(v13, kSecKeyOperationTypeDecrypt, (SecKeyAlgorithm)*MEMORY[0x263F17310]))
  {
    CFErrorRef error = 0;
    v14 = (__SecKey *)[v12 deviceEncryptionKey];
    CFDataRef v15 = SecKeyCreateDecryptedData(v14, (SecKeyAlgorithm)*MEMORY[0x263F17320], v6, &error);
    CFDataRef v16 = v15;
    if (error || !v15)
    {
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_129;
      v48[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v48[4] = error;
      __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_129((uint64_t)v48);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v7) {
        v7[2](v7, 0, v20);
      }
    }
    else
    {
      id v17 = [(POExtensionAgentProcess *)self configurationManager];
      uint64_t v18 = [v12 extensionIdentifier];
      id v47 = 0;
      char v19 = [v17 setTokens:v16 extensionIdentifier:v18 returningError:&v47];
      id v20 = v47;

      if (v19)
      {
        id v21 = [(POExtensionAgentProcess *)self configurationManager];
        CFDataRef v22 = NSUserName();
        char v23 = [v21 saveStashedSSOTokens:v16 forUserName:v22];

        if (v23)
        {
          objc_super v24 = dispatch_get_global_queue(0, 0);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_141;
          block[3] = &unk_264BBF858;
          block[4] = self;
          CFDataRef v41 = v16;
          id v42 = v10;
          dispatch_async(v24, block);

          if (v7) {
            v7[2](v7, 1, 0);
          }

          CFDataRef v25 = v41;
        }
        else
        {
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_137;
          v43[3] = &unk_264BBECA8;
          id v20 = v20;
          CFDataRef v44 = (const __CFData *)v20;
          v37 = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_137((uint64_t)v43);
          v7[2](v7, 0, v37);

          CFDataRef v25 = v44;
        }
      }
      else
      {
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_133;
        v45[3] = &unk_264BBECA8;
        id v20 = v20;
        CFDataRef v46 = (const __CFData *)v20;
        id v35 = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_133((uint64_t)v45);
        v7[2](v7, 0, v35);

        CFDataRef v25 = v46;
      }
    }
    goto LABEL_37;
  }
  char v34 = __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_106();
  if (v7) {
    v7[2](v7, 0, v34);
  }

LABEL_38:
}

id __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_121()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Failed to retrieve device configuration for extension."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

id __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_122(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to remove tokens."];
  uint64_t v2 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_129(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:v1 description:@"Failed to decrypt tokens."];

  id v3 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v2;
}

id __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_133(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to save tokens."];
  uint64_t v2 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_137(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to stash tokens."];
  uint64_t v2 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

void __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_141(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) agentProcess];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 32) configurationManager];
  CFDataRef v6 = [v5 currentUserConfiguration];
  [(id)v2 handleKerberosMappingForTokens:v4 extensionIdentifier:v3 userConfiguration:v6];

  BOOL v7 = [*(id *)(a1 + 32) configurationManager];
  LOBYTE(v2) = [v7 saveCurrentUserConfigurationAndSyncToPreboot:0];

  if ((v2 & 1) == 0) {
    id v8 = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_2();
  }
}

id __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_2()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after handling kerberos mapping."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)loginConfigurationWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess loginConfigurationWithCompletion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"loginConfiguration"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  BOOL v7 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:WeakRetained];

  if (v7)
  {
    id v8 = [(POExtensionAgentProcess *)self configurationManager];
    uint64_t v9 = [v8 currentLoginConfiguration];

    if (v4) {
      v4[2](v4, v9, 0);
    }
  }
  else
  {
    uint64_t v9 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    if (v4) {
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v9);
    }
  }
}

- (void)setLoginConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, uint64_t))a4;
  id v8 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess setLoginConfiguration:completion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"setLoginConfiguration"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  id v10 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:WeakRetained];

  if (!v10)
  {
    uint64_t v38 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    goto LABEL_63;
  }
  if (![MEMORY[0x263F25268] isAssociatedDomainValidated]) {
    goto LABEL_11;
  }
  id v11 = [POProfile alloc];
  CFDataRef v12 = [(POExtensionAgentProcess *)self configurationHost];
  BOOL v13 = [v12 validatedProfileForPlatformSSO];
  v14 = [(POProfile *)v11 initWithProfile:v13];

  if (!v14)
  {
    uint64_t v39 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_158();
LABEL_47:
    v50 = (void *)v39;
    if (v7) {
      v7[2](v7, 0, v39);
    }

    goto LABEL_66;
  }
  CFDataRef v15 = [v6 tokenEndpointURL];
  BOOL v16 = [(POExtensionAgentProcess *)self isURL:v15 validForProfile:v14];

  if (!v16)
  {
    uint64_t v39 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_164();
    goto LABEL_47;
  }
  id v17 = [v6 nonceEndpointURL];
  BOOL v18 = [(POExtensionAgentProcess *)self isURL:v17 validForProfile:v14];

  if (!v18)
  {
    uint64_t v39 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_170();
    goto LABEL_47;
  }
  uint64_t v19 = [v6 refreshEndpointURL];
  if (v19)
  {
    id v20 = (void *)v19;
    id v21 = [v6 refreshEndpointURL];
    BOOL v22 = [(POExtensionAgentProcess *)self isURL:v21 validForProfile:v14];

    if (!v22)
    {
      uint64_t v39 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_176();
      goto LABEL_47;
    }
  }

LABEL_11:
  char v23 = [v6 invalidCredentialPredicate];
  uint64_t v24 = [v23 length];

  if (v24)
  {
    CFDataRef v25 = (void *)MEMORY[0x263F08A98];
    id v26 = [v6 invalidCredentialPredicate];
    uint64_t v27 = [v25 predicateWithFormat:v26];

    [v27 evaluateWithObject:MEMORY[0x263EFFA78]];
  }
  if ([v6 federationType] == 1 || objc_msgSend(v6, "federationType") == 2)
  {
    v28 = [v6 federationRequestURN];

    if (!v28)
    {
      uint64_t v38 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_189();
      goto LABEL_63;
    }
  }
  if ([v6 federationType] == 2)
  {
    int v29 = [v6 federationUserPreauthenticationURL];

    if (!v29)
    {
      uint64_t v38 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_195();
      goto LABEL_63;
    }
    v30 = [v6 federationMexURLKeypath];

    if (!v30)
    {
      uint64_t v38 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_201();
      goto LABEL_63;
    }
    v31 = (void *)MEMORY[0x263F08A98];
    v32 = [v6 federationPredicate];
    id v33 = [v31 predicateWithFormat:v32];

    [v33 evaluateWithObject:MEMORY[0x263EFFA78]];
  }
  if ([v6 federationType] == 1)
  {
    char v34 = [v6 federationMexURL];

    if (!v34)
    {
      uint64_t v38 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_213();
      goto LABEL_63;
    }
  }
  id v35 = [v6 hpkePsk];

  if (v35)
  {
    id v36 = [v6 hpkePsk];
    unint64_t v37 = [v36 length];

    if (v37 <= 0x1F)
    {
      uint64_t v38 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_219();
LABEL_63:
      v59 = (void *)v38;
      if (v7) {
        v7[2](v7, 0, v38);
      }

      goto LABEL_66;
    }
    uint64_t v40 = objc_msgSend(v6, "hpkePsk_id");
    uint64_t v41 = [v40 length];

    if (!v41)
    {
      uint64_t v38 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_225();
      goto LABEL_63;
    }
  }
  id v42 = objc_msgSend(v6, "hpkePsk_id");
  if ([v42 length])
  {
    v43 = [v6 hpkePsk];
    uint64_t v44 = [v43 length];

    if (!v44)
    {
      uint64_t v38 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_231();
      goto LABEL_63;
    }
  }
  else
  {
  }
  if (![v6 hpkeAuthPublicKey]) {
    goto LABEL_40;
  }
  long long v45 = [(POExtensionAgentProcess *)self configurationManager];
  CFDataRef v46 = [v45 currentDeviceConfiguration];
  v14 = [v46 encryptionAlgorithm];

  if ((objc_msgSend(MEMORY[0x263F5E650], "isEncryptionAlgorithm:validForKey:", v14, objc_msgSend(v6, "hpkeAuthPublicKey")) & 1) == 0)
  {
    uint64_t v39 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_238();
    goto LABEL_47;
  }

LABEL_40:
  id v47 = [v6 loginRequestHpkePsk];

  if (v47)
  {
    id v48 = [v6 loginRequestHpkePsk];
    unint64_t v49 = [v48 length];

    if (v49 <= 0x1F)
    {
      uint64_t v38 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_244();
      goto LABEL_63;
    }
    CFDataRef v51 = objc_msgSend(v6, "loginRequestHpkePsk_id");
    uint64_t v52 = [v51 length];

    if (!v52)
    {
      uint64_t v38 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_250();
      goto LABEL_63;
    }
  }
  id v53 = objc_msgSend(v6, "loginRequestHpkePsk_id");
  if ([v53 length])
  {
    v54 = [v6 loginRequestHpkePsk];
    uint64_t v55 = [v54 length];

    if (!v55)
    {
      uint64_t v38 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_256();
      goto LABEL_63;
    }
  }
  else
  {
  }
  if ([v6 userSEPKeyBiometricPolicy])
  {
    uint64_t v56 = [v6 userSEPKeyBiometricPolicy] & 2;
    if (!(v56 & 0xFFFFFFFFFFFFFFFELL | [v6 userSEPKeyBiometricPolicy] & 1))
    {
      uint64_t v38 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_262();
      goto LABEL_63;
    }
  }
  v57 = [(POExtensionAgentProcess *)self configurationManager];
  char v58 = [v57 saveLoginConfiguration:v6];

  if ((v58 & 1) == 0)
  {
    uint64_t v38 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_268();
    goto LABEL_63;
  }
  [MEMORY[0x263F5E5D8] analyticsForLoginConfiguration:v6];
  if (v7) {
    v7[2](v7, 1, 0);
  }
LABEL_66:
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_158()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"No validated Platform SSO Profiles."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_164()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Token endpoint URL is not approved profile URL."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_170()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Nonce endpoint URL is not approved profile URL."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_176()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Refresh endpoint URL is not approved profile URL."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_183()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"The invalidCredentialPredicate is not formatted correctly."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_189()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"The federationRequestURN is missing."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_195()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"The federationUserPreauthenticationURL is missing."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_201()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"The federationMexURLKeypath is missing."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_207()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"The federationPredicate is not formatted correctly."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_213()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"The federationMexURL is missing."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_219()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"The HPKE PSK must be at least 32 bytes."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_225()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"The HPKE PSK_id is required when the PSK is set."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_231()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"The HPKE PSK is required when the PSK_id is set."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_238()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"The HPKE Auth Key is not valid for current encryption algorithm."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_244()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"The login request HPKE PSK must be at least 32 bytes."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_250()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"The login request HPKE PSK_id is required when the PSK is set."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_256()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"The login request HPKE PSK is required when the login request PSK_id is set."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_262()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Invalid user secure enclave key biometric policy."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_268()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save the login configuration."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)isURL:(id)a3 validForProfile:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [a3 absoluteString];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v7 = [v5 URLPrefix];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v17 = v5;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        CFDataRef v12 = (void *)MEMORY[0x263F08A98];
        uint64_t v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) stringByAppendingString:@"*"];
        v14 = [v12 predicateWithFormat:@"SELF LIKE[c] %@", v13];

        LOBYTE(v13) = [v14 evaluateWithObject:v6];
        if (v13)
        {
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    BOOL v15 = 0;
LABEL_11:
    id v5 = v17;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)setCertificateData:(id)a3 keyType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, uint64_t, void))a5;
  uint64_t v10 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess setCertificateData:keyType:completion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"setCertificateData" forKeyType:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  CFDataRef v12 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:WeakRetained];

  if (v12)
  {
    uint64_t v13 = [(POExtensionAgentProcess *)self configurationManager];
    v14 = [v13 currentDeviceConfiguration];

    if (v14 && [(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
    {
      if ((unint64_t)a4 <= 0xB)
      {
        if (((1 << a4) & 0x412) != 0)
        {
          objc_msgSend(v14, "setDeviceSigningCertificate:", objc_msgSend(MEMORY[0x263F5E650], "certificateForData:", v8));
          goto LABEL_16;
        }
        if (((1 << a4) & 0x824) != 0)
        {
          objc_msgSend(v14, "setDeviceEncryptionCertificate:", objc_msgSend(MEMORY[0x263F5E650], "certificateForData:", v8));
          goto LABEL_16;
        }
      }
      if (v9)
      {
        long long v18 = __65__POExtensionAgentProcess_setCertificateData_keyType_completion___block_invoke_286();
        goto LABEL_23;
      }
LABEL_16:
      BOOL v16 = [(POExtensionAgentProcess *)self configurationManager];
      char v17 = [v16 saveDeviceConfiguration:v14];

      if (v17)
      {
        if (v9) {
          v9[2](v9, 1, 0);
        }
        goto LABEL_25;
      }
      long long v18 = __65__POExtensionAgentProcess_setCertificateData_keyType_completion___block_invoke_292();
      if (!v9)
      {
LABEL_24:

        goto LABEL_25;
      }
LABEL_23:
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v18);
      goto LABEL_24;
    }
    id v19 = v12;
    BOOL v15 = __65__POExtensionAgentProcess_setCertificateData_keyType_completion___block_invoke_285();
    if (v9) {
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v15);
    }
  }
  else
  {
    v14 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    if (v9) {
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v14);
    }
  }
LABEL_25:
}

id __65__POExtensionAgentProcess_setCertificateData_keyType_completion___block_invoke_285()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Failed to retrieve device configuration for extension."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

id __65__POExtensionAgentProcess_setCertificateData_keyType_completion___block_invoke_286()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Invalid key type for certificate."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __65__POExtensionAgentProcess_setCertificateData_keyType_completion___block_invoke_292()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save the device configuration."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)secKeyProxyEndpointForKeyType:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *, void))a4;
  BOOL v7 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess secKeyProxyEndpointForKeyType:completion:]();
  }

  id v8 = [(POExtensionAgentProcess *)self keyProxyEndpointForKeyType:a3];
  if (v8)
  {
    if (v6) {
      v6[2](v6, v8, 0);
    }
  }
  else
  {
    uint64_t v9 = __68__POExtensionAgentProcess_secKeyProxyEndpointForKeyType_completion___block_invoke();
    if (v6) {
      ((void (**)(id, void *, void *))v6)[2](v6, 0, v9);
    }
  }
}

id __68__POExtensionAgentProcess_secKeyProxyEndpointForKeyType_completion___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to receive key proxy endpoint."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)secIdentityProxyEndpointForKeyType:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *, void))a4;
  BOOL v7 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess secIdentityProxyEndpointForKeyType:completion:]();
  }

  id v8 = [(POExtensionAgentProcess *)self identityForKeyType:a3];
  if (v8)
  {
    if (v6) {
      v6[2](v6, v8, 0);
    }
  }
  else
  {
    uint64_t v9 = __73__POExtensionAgentProcess_secIdentityProxyEndpointForKeyType_completion___block_invoke();
    if (v6) {
      ((void (**)(id, void *, void *))v6)[2](v6, 0, v9);
    }
  }
}

id __73__POExtensionAgentProcess_secIdentityProxyEndpointForKeyType_completion___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to receive identity key proxy endpoint."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)attestKey:(int64_t)a3 clientDataHash:(id)a4 completion:(id)a5
{
  id v5 = (void (**)(id, void, void *))a5;
  id v6 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess attestKey:clientDataHash:completion:]();
  }

  if (v5)
  {
    BOOL v7 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"not impl"];
    v5[2](v5, 0, v7);
  }
}

- (void)copyDeviceAttestationCertificateWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, void, void *))a3;
  uint64_t v4 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess copyDeviceAttestationCertificateWithCompletion:]();
  }

  if (v3)
  {
    id v5 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"not impl"];
    v3[2](v3, 0, v5);
  }
}

- (void)userNeedsReauthenticationWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess userNeedsReauthenticationWithCompletion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"userNeedsReauthentication"];
  if ([(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
  {
    id v6 = [(POExtensionAgentProcess *)self authenticationCompletion];

    if (v6)
    {
      BOOL v7 = [(POExtensionAgentProcess *)self authenticationCompletion];
      id v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = getASAuthorizationErrorDomain_0();
      uint64_t v10 = [v8 errorWithDomain:v9 code:1001 userInfo:0];
      ((void (**)(void, void, void *))v7)[2](v7, 0, v10);

      [(POExtensionAgentProcess *)self setAuthenticationCompletion:0];
    }
    [(POExtensionAgentProcess *)self setAuthenticationCompletion:v4];
    id v11 = [MEMORY[0x263F08A00] defaultCenter];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke_317;
    v16[3] = &unk_264BBF880;
    v16[4] = self;
    CFDataRef v12 = [v11 addObserverForName:@"com.apple.PlatformSSO.authenticationCompleted" object:0 queue:0 usingBlock:v16];
    [(POExtensionAgentProcess *)self setAuthenticationObserver:v12];

    uint64_t v13 = dispatch_get_global_queue(0, 0);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke_2;
    v15[3] = &unk_264BBF278;
    v15[4] = self;
    dispatch_async(v13, v15);
  }
  else
  {
    v14 = __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
    v4[2](v4, 0, v14);
  }
}

id __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Caller is not current SSO extension."];
  uint64_t v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

void __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke_317(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInfo];
  id v17 = [v3 objectForKeyedSubscript:@"authenticationResult"];

  switch([v17 intValue])
  {
    case 0u:
    case 5u:
      uint64_t v9 = (void *)MEMORY[0x263F087E8];
      id v5 = getASAuthorizationErrorDomain_0();
      id v6 = v9;
      BOOL v7 = v5;
      uint64_t v8 = 1000;
      goto LABEL_7;
    case 1u:
      uint64_t v10 = 0;
      uint64_t v11 = 1;
      goto LABEL_9;
    case 2u:
    case 3u:
    case 4u:
      uint64_t v4 = (void *)MEMORY[0x263F087E8];
      id v5 = getASAuthorizationErrorDomain_0();
      id v6 = v4;
      BOOL v7 = v5;
      uint64_t v8 = 1004;
      goto LABEL_7;
    case 6u:
      CFDataRef v12 = (void *)MEMORY[0x263F087E8];
      id v5 = getASAuthorizationErrorDomain_0();
      id v6 = v12;
      BOOL v7 = v5;
      uint64_t v8 = 1001;
LABEL_7:
      uint64_t v10 = [v6 errorWithDomain:v7 code:v8 userInfo:0];

      break;
    default:
      uint64_t v10 = 0;
      break;
  }
  uint64_t v11 = 0;
LABEL_9:
  uint64_t v13 = [*(id *)(a1 + 32) authenticationCompletion];

  if (v13)
  {
    v14 = [*(id *)(a1 + 32) authenticationCompletion];
    ((void (**)(void, uint64_t, void *))v14)[2](v14, v11, v10);

    [*(id *)(a1 + 32) setAuthenticationCompletion:0];
  }
  BOOL v15 = [MEMORY[0x263F08A00] defaultCenter];
  BOOL v16 = [*(id *)(a1 + 32) authenticationObserver];
  [v15 removeObserver:v16];

  [*(id *)(a1 + 32) setAuthenticationObserver:0];
}

void __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) agentProcess];
  char v3 = [v2 handleUserNeedsReauthenticationAfterDelay:1.0];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
    id v5 = [*(id *)(a1 + 32) authenticationObserver];
    [v4 removeObserver:v5];

    [*(id *)(a1 + 32) setAuthenticationObserver:0];
    id v6 = [*(id *)(a1 + 32) authenticationCompletion];

    if (v6)
    {
      BOOL v7 = [*(id *)(a1 + 32) authenticationCompletion];
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = getASAuthorizationErrorDomain_0();
      uint64_t v10 = [v8 errorWithDomain:v9 code:1004 userInfo:0];
      ((void (**)(void, void, void *))v7)[2](v7, 0, v10);

      uint64_t v11 = *(void **)(a1 + 32);
      [v11 setAuthenticationCompletion:0];
    }
  }
}

- (void)deviceRegistrationsNeedsRepairWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess deviceRegistrationsNeedsRepairWithCompletion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"deviceRegistrationNeedsRepair"];
  if ([(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
  {
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__POExtensionAgentProcess_deviceRegistrationsNeedsRepairWithCompletion___block_invoke_324;
    block[3] = &unk_264BBF278;
    block[4] = self;
    dispatch_async(v6, block);

    if (v4) {
      v4[2](v4, 1, 0);
    }
  }
  else
  {
    BOOL v7 = __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v7);
  }
}

void __72__POExtensionAgentProcess_deviceRegistrationsNeedsRepairWithCompletion___block_invoke_324(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) agentProcess];
  [v1 handleDeviceAndUserRegistrationForRepair:1];
}

- (void)userRegistrationsNeedsRepairWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess userRegistrationsNeedsRepairWithCompletion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"userRegistrationNeedsRepair"];
  if ([(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
  {
    id v6 = [(POExtensionAgentProcess *)self configurationManager];
    BOOL v7 = NSUserName();
    uint64_t v8 = [v6 userConfigurationForUserName:v7];

    uint64_t v9 = [v8 userLoginConfiguration];
    uint64_t v10 = [v9 loginUserName];

    uint64_t v11 = dispatch_get_global_queue(0, 0);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __70__POExtensionAgentProcess_userRegistrationsNeedsRepairWithCompletion___block_invoke_330;
    v13[3] = &unk_264BBF4F0;
    v13[4] = self;
    id v14 = v10;
    id v12 = v10;
    dispatch_async(v11, v13);

    if (v4) {
      v4[2](v4, 1, 0);
    }
  }
  else
  {
    uint64_t v8 = __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v8);
  }
}

void __70__POExtensionAgentProcess_userRegistrationsNeedsRepairWithCompletion___block_invoke_330(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) agentProcess];
  [v2 handleUserRegistrationForUser:*(void *)(a1 + 40) repair:1];
}

- (void)presentRegistrationViewControllerWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess presentRegistrationViewControllerWithCompletion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"presentRegistrationViewController"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  BOOL v7 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:WeakRetained];

  if (v7)
  {
    uint64_t v8 = [(POExtensionAgentProcess *)self agentProcess];
    [v8 handleRegistrationViewControllerForExtensionIdentifier:v7 completion:v4];
  }
  else
  {
    uint64_t v8 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    if (v4) {
      v4[2](v4, 0, v8);
    }
  }
}

- (void)resetDeviceKeysWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess resetDeviceKeysWithCompletion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"resetDeviceKeys"];
  if ([(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
    BOOL v7 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:WeakRetained];

    if (v7)
    {
      uint64_t v8 = [(POExtensionAgentProcess *)self configurationManager];
      uint64_t v9 = [v8 currentDeviceConfiguration];

      if (v9 && [(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
      {
        [(POExtensionAgentProcess *)self invalidateAllKeyProxies];
        uint64_t v10 = (void *)MEMORY[0x263F5E650];
        uint64_t v11 = [v9 signingAlgorithm];
        objc_msgSend(v9, "setDeviceSigningKey:", objc_msgSend(v10, "createSEPSigningKeyForAlgorithm:shared:", v11, objc_msgSend(v9, "sharedDeviceKeys")));

        id v12 = (void *)MEMORY[0x263F5E650];
        uint64_t v13 = [v9 encryptionAlgorithm];
        objc_msgSend(v9, "setDeviceEncryptionKey:", objc_msgSend(v12, "createSEPEncryptionKeyForAlgorithm:shared:", v13, objc_msgSend(v9, "sharedDeviceKeys")));

        id v14 = [(POExtensionAgentProcess *)self configurationManager];
        LOBYTE(v12) = [v14 saveDeviceConfiguration:v9];

        if (v12)
        {
          if (v4) {
            v4[2](v4, 1, 0);
          }
        }
        else
        {
          BOOL v16 = __57__POExtensionAgentProcess_resetDeviceKeysWithCompletion___block_invoke_345();
          if (v4) {
            ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v16);
          }
        }
      }
      else
      {
        id v17 = v7;
        BOOL v15 = __57__POExtensionAgentProcess_resetDeviceKeysWithCompletion___block_invoke_344();
        if (v4) {
          ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v15);
        }
      }
    }
    else
    {
      uint64_t v9 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
      if (v4) {
        ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v9);
      }
    }
  }
  else
  {
    BOOL v7 = __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v7);
  }
}

id __57__POExtensionAgentProcess_resetDeviceKeysWithCompletion___block_invoke_344()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Failed to retrieve device configuration for extension."];
  id v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

id __57__POExtensionAgentProcess_resetDeviceKeysWithCompletion___block_invoke_345()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save device configuration."];
  id v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)resetUserSecureEnclaveKeyWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess resetUserSecureEnclaveKeyWithCompletion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"resetUserSecureEnclaveKey"];
  if ([(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
    BOOL v7 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:WeakRetained];

    if (!v7)
    {
      uint64_t v9 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
      if (v4) {
        v4[2](v4, 0, v9);
      }
      goto LABEL_38;
    }
    uint64_t v8 = [(POExtensionAgentProcess *)self configurationManager];
    uint64_t v9 = [v8 currentDeviceConfiguration];

    if (!v9 || ![(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
    {
      id v33 = v7;
      BOOL v22 = __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_359();
      if (v4) {
        v4[2](v4, 0, v22);
      }

      id v12 = v33;
      goto LABEL_37;
    }
    uint64_t v10 = [(POExtensionAgentProcess *)self configurationManager];
    uint64_t v11 = NSUserName();
    id v12 = [v10 userConfigurationForUserName:v11];

    if (!v12)
    {
      uint64_t v23 = __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_360();
      goto LABEL_34;
    }
    [(POExtensionAgentProcess *)self invalidateAllKeyProxies];
    if (![v12 sepKey] || objc_msgSend(v12, "loginType") != 2)
    {
      [v12 setSepKey:0];
LABEL_30:
      int v29 = [(POExtensionAgentProcess *)self configurationManager];
      v30 = NSUserName();
      char v31 = [v29 saveUserConfiguration:v12 forUserName:v30 syncToPreboot:1];

      if (v31)
      {
        if (v4) {
          v4[2](v4, 1, 0);
        }
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      uint64_t v23 = __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_372();
LABEL_34:
      v32 = (void *)v23;
      if (v4) {
        v4[2](v4, 0, (void *)v23);
      }

      goto LABEL_37;
    }
    uint64_t v13 = [(POExtensionAgentProcess *)self configurationManager];
    id v14 = [v13 currentLoginConfiguration];
    uint64_t v15 = [v14 userSEPKeyBiometricPolicy];

    BOOL v16 = PO_LOG_POExtensionAgentProcess();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[POExtensionAgentProcess resetUserSecureEnclaveKeyWithCompletion:](v15, v16);
    }

    if (!v15) {
      goto LABEL_16;
    }
    id v17 = objc_alloc_init(MEMORY[0x263F10468]);
    char v18 = [v17 canEvaluatePolicy:1 error:0];

    if ((v18 & 1) == 0)
    {
      uint64_t v23 = __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_366();
      goto LABEL_34;
    }
    if (v15)
    {
      uint64_t v24 = (void *)MEMORY[0x263F5E650];
      long long v20 = [v12 signingAlgorithm];
      CFDataRef v25 = v24;
      id v26 = v20;
      uint64_t v27 = 1;
    }
    else
    {
      if ((v15 & 2) == 0)
      {
LABEL_16:
        id v19 = (void *)MEMORY[0x263F5E650];
        long long v20 = [v12 signingAlgorithm];
        uint64_t v21 = [v19 createUserSEPSigningKeyForAlgorithm:v20];
LABEL_29:
        [v12 setSepKey:v21];

        goto LABEL_30;
      }
      v28 = (void *)MEMORY[0x263F5E650];
      long long v20 = [v12 signingAlgorithm];
      CFDataRef v25 = v28;
      id v26 = v20;
      uint64_t v27 = 0;
    }
    uint64_t v21 = [v25 createUserSEPSigningKeyForAlgorithm:v26 userPresence:1 currentSet:v27];
    goto LABEL_29;
  }
  BOOL v7 = __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
  v4[2](v4, 0, v7);
LABEL_39:
}

id __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_359()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Failed to retrieve device configuration for extension."];
  id v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

id __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_360()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"Failed to retrieve user configuration."];
  id v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_366()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to create key during reset key because companion is not available."];
  id v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_372()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration."];
  id v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)loginUserNameWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess loginUserNameWithCompletion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"loginUserName"];
  if ([(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
  {
    id v6 = [(POExtensionAgentProcess *)self configurationManager];
    BOOL v7 = NSUserName();
    uint64_t v8 = [v6 userConfigurationForUserName:v7];

    if (!v8)
    {
      uint64_t v9 = __55__POExtensionAgentProcess_loginUserNameWithCompletion___block_invoke_383();
      if (v4) {
        v4[2](v4, 0, v9);
      }
      goto LABEL_10;
    }
    if (v4)
    {
      uint64_t v9 = [v8 userLoginConfiguration];
      uint64_t v10 = [v9 loginUserName];
      ((void (**)(id, void *, void *))v4)[2](v4, v10, 0);

LABEL_10:
    }
  }
  else
  {
    uint64_t v8 = __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
    v4[2](v4, 0, v8);
  }
}

id __55__POExtensionAgentProcess_loginUserNameWithCompletion___block_invoke_383()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to retrieve user configuration."];
  id v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)setLoginUserName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess setLoginUserName:completion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"setLoginUserName"];
  if (![(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
  {
    uint64_t v11 = __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
    v7[2](v7, 0, v11);
    goto LABEL_17;
  }
  uint64_t v9 = [(POExtensionAgentProcess *)self configurationManager];
  uint64_t v10 = NSUserName();
  uint64_t v11 = [v9 userConfigurationForUserName:v10];

  if (v11)
  {
    id v12 = [v11 userLoginConfiguration];

    if (v12)
    {
      uint64_t v13 = [v11 userLoginConfiguration];
      [v13 setLoginUserName:v6];
    }
    else
    {
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F5E668]) initWithLoginUserName:v6];
      [v11 setUserLoginConfiguration:v13];
    }

    uint64_t v15 = [(POExtensionAgentProcess *)self configurationManager];
    BOOL v16 = NSUserName();
    char v17 = [v15 saveUserConfiguration:v11 forUserName:v16 syncToPreboot:1];

    if (v17)
    {
      if (v7) {
        v7[2](v7, 1, 0);
      }
      goto LABEL_17;
    }
    uint64_t v14 = __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_372();
  }
  else
  {
    uint64_t v14 = __55__POExtensionAgentProcess_loginUserNameWithCompletion___block_invoke_383();
  }
  char v18 = (void *)v14;
  if (v7) {
    v7[2](v7, 0, (void *)v14);
  }

LABEL_17:
}

- (void)userLoginConfigurationWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id v5 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess userLoginConfigurationWithCompletion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"userLoginConfiguration"];
  id v6 = [(POExtensionAgentProcess *)self configurationManager];
  uint64_t v7 = [v6 currentUserConfiguration];
  if (!v7)
  {

    goto LABEL_7;
  }
  uint64_t v8 = (void *)v7;
  BOOL v9 = [(POExtensionAgentProcess *)self isCallerCurrentSSOExtension];

  if (!v9)
  {
LABEL_7:
    id v12 = __64__POExtensionAgentProcess_userLoginConfigurationWithCompletion___block_invoke();
    v4[2](v4, 0, v12);
    goto LABEL_8;
  }
  uint64_t v10 = [(POExtensionAgentProcess *)self configurationManager];
  uint64_t v11 = [v10 currentUserConfiguration];
  id v12 = [v11 userLoginConfiguration];

  ((void (**)(id, void *, void *))v4)[2](v4, v12, 0);
LABEL_8:
}

id __64__POExtensionAgentProcess_userLoginConfigurationWithCompletion___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to retrieve user login configuration."];
  id v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)setUserLoginConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v8 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess setUserLoginConfiguration:completion:]();
  }

  [(POExtensionAgentProcess *)self addEvent:@"setUserLoginConfiguration"];
  BOOL v9 = [(POExtensionAgentProcess *)self configurationManager];
  uint64_t v10 = [v9 currentUserConfiguration];
  if (!v10)
  {

    goto LABEL_8;
  }
  uint64_t v11 = (void *)v10;
  BOOL v12 = [(POExtensionAgentProcess *)self isCallerCurrentSSOExtension];

  if (!v12)
  {
LABEL_8:
    uint64_t v16 = __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_360();
LABEL_9:
    char v17 = (void *)v16;
    v7[2](v7, 0, v16);

    goto LABEL_10;
  }
  uint64_t v13 = [(POExtensionAgentProcess *)self configurationManager];
  uint64_t v14 = [(id)v13 currentUserConfiguration];
  [v14 setUserLoginConfiguration:v6];

  uint64_t v15 = [(POExtensionAgentProcess *)self configurationManager];
  LOBYTE(v13) = [v15 saveCurrentUserConfigurationAndSyncToPreboot:1];

  if ((v13 & 1) == 0)
  {
    uint64_t v16 = __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_372();
    goto LABEL_9;
  }
  v7[2](v7, 1, 0);
LABEL_10:
}

- (void)rotateKeyForKeyType:(int64_t)a3 completion:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void, void *))a4;
  uint64_t v7 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess rotateKeyForKeyType:completion:](a3);
  }

  [(POExtensionAgentProcess *)self addEvent:@"rotateKeyForKeyType"];
  if ([(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
    BOOL v9 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:WeakRetained];

    if (!v9)
    {
      uint64_t v11 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
      if (v6) {
        v6[2](v6, 0, v11);
      }
      goto LABEL_30;
    }
    uint64_t v10 = [(POExtensionAgentProcess *)self configurationManager];
    uint64_t v11 = [v10 currentDeviceConfiguration];

    if (!v11 || ![(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
    {
      CFDataRef v46 = v9;
      uint64_t v27 = __58__POExtensionAgentProcess_rotateKeyForKeyType_completion___block_invoke_422();
      if (v6) {
        v6[2](v6, 0, v27);
      }

      BOOL v12 = v46;
      goto LABEL_27;
    }
    BOOL v12 = self;
    objc_sync_enter(v12);
    if (a3 == 11)
    {
      v28 = [v11 pendingEncryptionAlgorithm];
      int v29 = v28;
      if (!v28)
      {
        int v29 = [v11 encryptionAlgorithm];
      }
      [(POExtensionAgentProcess *)v12 setPendingEncryptionAlgorithm:v29];
      if (!v28) {

      }
      v30 = (void *)MEMORY[0x263F5E650];
      char v31 = [(POExtensionAgentProcess *)v12 pendingEncryptionAlgorithm];
      uint64_t v32 = objc_msgSend(v30, "createSEPEncryptionKeyForAlgorithm:shared:", v31, objc_msgSend(v11, "sharedDeviceKeys"));
      [v11 setDeviceEncryptionKey:v32];
      [(POExtensionAgentProcess *)v12 setPendingEncryptionKey:v32];

      uint64_t v33 = [(POExtensionAgentProcess *)v12 pendingEncryptionKey];
    }
    else
    {
      if (a3 != 10)
      {
        if (a3 == 3)
        {
          uint64_t v13 = [(POExtensionAgentProcess *)v12 configurationManager];
          uint64_t v14 = NSUserName();
          uint64_t v15 = [v13 userConfigurationForUserName:v14];

          if (v15)
          {
            if ([v15 loginType] != 2)
            {
              [(POExtensionAgentProcess *)v12 setPendingUserSEPKey:0];
              uint64_t v38 = 0;
LABEL_54:

LABEL_55:
              objc_sync_exit(v12);

              if (v38)
              {
                id v42 = (POExtensionAgentProcess *)[objc_alloc(MEMORY[0x263F16D70]) initWithKey:v38];
                v43 = v12;
                objc_sync_enter(v43);
                uint64_t v44 = [(POExtensionAgentProcess *)v43 keyProxies];
                [v44 addObject:v42];

                objc_sync_exit(v43);
                long long v45 = [(POExtensionAgentProcess *)v42 endpoint];
                ((void (**)(id, void *, void *))v6)[2](v6, v45, 0);

                BOOL v12 = v42;
              }
              else
              {
                __58__POExtensionAgentProcess_rotateKeyForKeyType_completion___block_invoke_435();
                BOOL v12 = (POExtensionAgentProcess *)objc_claimAutoreleasedReturnValue();
                v6[2](v6, 0, v12);
              }
              goto LABEL_27;
            }
            uint64_t v16 = [v15 pendingSigningAlgorithm];
            char v17 = v16;
            if (!v16)
            {
              char v17 = [v15 signingAlgorithm];
            }
            [(POExtensionAgentProcess *)v12 setPendingUserSEPSigningAlgorithm:v17];
            if (!v16) {

            }
            char v18 = [(POExtensionAgentProcess *)v12 configurationManager];
            id v19 = [v18 currentLoginConfiguration];
            uint64_t v20 = [v19 userSEPKeyBiometricPolicy];

            uint64_t v21 = PO_LOG_POExtensionAgentProcess();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              BOOL v22 = [NSNumber numberWithUnsignedInteger:v20];
              -[POExtensionAgentProcess rotateKeyForKeyType:completion:](v22, buf, v21);
            }

            if (!v20) {
              goto LABEL_22;
            }
            id v23 = objc_alloc_init(MEMORY[0x263F10468]);
            char v24 = [v23 canEvaluatePolicy:1 error:0];

            if (v24)
            {
              if (v20)
              {
                uint64_t v40 = (void *)MEMORY[0x263F5E650];
                id v26 = [(POExtensionAgentProcess *)v12 pendingUserSEPSigningAlgorithm];
                -[POExtensionAgentProcess setPendingUserSEPKey:](v12, "setPendingUserSEPKey:", [v40 createUserSEPSigningKeyForAlgorithm:v26 userPresence:1 currentSet:1]);
                goto LABEL_53;
              }
              if ((v20 & 2) != 0)
              {
                uint64_t v41 = (void *)MEMORY[0x263F5E650];
                id v26 = [(POExtensionAgentProcess *)v12 pendingUserSEPSigningAlgorithm];
                -[POExtensionAgentProcess setPendingUserSEPKey:](v12, "setPendingUserSEPKey:", [v41 createUserSEPSigningKeyForAlgorithm:v26 userPresence:1 currentSet:0]);
                goto LABEL_53;
              }
LABEL_22:
              CFDataRef v25 = (void *)MEMORY[0x263F5E650];
              id v26 = [(POExtensionAgentProcess *)v12 pendingUserSEPSigningAlgorithm];
              -[POExtensionAgentProcess setPendingUserSEPKey:](v12, "setPendingUserSEPKey:", [v25 createUserSEPSigningKeyForAlgorithm:v26]);
LABEL_53:

              uint64_t v38 = [(POExtensionAgentProcess *)v12 pendingUserSEPKey];
              goto LABEL_54;
            }
            uint64_t v39 = __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_366();
            if (v6) {
              v6[2](v6, 0, v39);
            }
          }
          else
          {
            uint64_t v39 = __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_360();
            if (v6) {
              v6[2](v6, 0, v39);
            }
          }
        }
        else
        {
          uint64_t v15 = __58__POExtensionAgentProcess_rotateKeyForKeyType_completion___block_invoke_429();
          v6[2](v6, 0, v15);
        }

        objc_sync_exit(v12);
LABEL_27:

LABEL_30:
        goto LABEL_31;
      }
      char v34 = [v11 pendingSigningAlgorithm];
      id v35 = v34;
      if (!v34)
      {
        id v35 = [v11 signingAlgorithm];
      }
      [(POExtensionAgentProcess *)v12 setPendingSigningAlgorithm:v35];
      if (!v34) {

      }
      id v36 = (void *)MEMORY[0x263F5E650];
      unint64_t v37 = [(POExtensionAgentProcess *)v12 pendingSigningAlgorithm];
      -[POExtensionAgentProcess setPendingSigningKey:](v12, "setPendingSigningKey:", objc_msgSend(v36, "createSEPSigningKeyForAlgorithm:shared:", v37, objc_msgSend(v11, "sharedDeviceKeys")));

      uint64_t v33 = [(POExtensionAgentProcess *)v12 pendingSigningKey];
    }
    uint64_t v38 = v33;
    goto LABEL_55;
  }
  BOOL v9 = __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
  v6[2](v6, 0, v9);
LABEL_31:
}

id __58__POExtensionAgentProcess_rotateKeyForKeyType_completion___block_invoke_422()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Failed to retrieve device configuration for extension."];
  id v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

id __58__POExtensionAgentProcess_rotateKeyForKeyType_completion___block_invoke_429()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Invalid key type for rotation."];
  id v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __58__POExtensionAgentProcess_rotateKeyForKeyType_completion___block_invoke_435()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Missing key for rotation."];
  id v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)completeRotationKeyForKeyType:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  uint64_t v7 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POExtensionAgentProcess completeRotationKeyForKeyType:completion:](a3);
  }

  [(POExtensionAgentProcess *)self addEvent:@"completeRotationKeyForKeyType"];
  if ([(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
    BOOL v9 = [(POExtensionAgentProcess *)self bundleIdentiferForXPCConnection:WeakRetained];

    if (!v9)
    {
      uint64_t v11 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
      if (v6) {
        v6[2](v6, 0, v11);
      }
      goto LABEL_34;
    }
    uint64_t v10 = [(POExtensionAgentProcess *)self configurationManager];
    uint64_t v11 = [v10 currentDeviceConfiguration];

    if (!v11 || ![(POExtensionAgentProcess *)self isCallerCurrentSSOExtension])
    {
      uint64_t v32 = v9;
      uint64_t v21 = __68__POExtensionAgentProcess_completeRotationKeyForKeyType_completion___block_invoke_449();
      if (v6) {
        v6[2](v6, 0, v21);
      }

      BOOL v12 = v32;
      goto LABEL_33;
    }
    BOOL v12 = self;
    objc_sync_enter(v12);
    if (a3 == 11)
    {
      if (![(POExtensionAgentProcess *)v12 pendingEncryptionKey]) {
        goto LABEL_30;
      }
      BOOL v22 = [(POExtensionAgentProcess *)v12 pendingEncryptionAlgorithm];

      if (!v22) {
        goto LABEL_30;
      }
      objc_msgSend(v11, "setDeviceEncryptionKey:", -[POExtensionAgentProcess pendingEncryptionKey](v12, "pendingEncryptionKey"));
      id v23 = [(POExtensionAgentProcess *)v12 pendingEncryptionAlgorithm];
      [v11 setEncryptionAlgorithm:v23];

      char v24 = [MEMORY[0x263EFF910] date];
      [v11 setLastEncryptionKeyChange:v24];

      [v11 setPendingEncryptionAlgorithm:0];
      CFDataRef v25 = [(POExtensionAgentProcess *)v12 configurationManager];
      char v26 = [v25 saveDeviceConfiguration:v11];

      if (v26)
      {
        [(POExtensionAgentProcess *)v12 setPendingEncryptionKey:0];
        [(POExtensionAgentProcess *)v12 setPendingEncryptionAlgorithm:0];
LABEL_29:
        v6[2](v6, 1, 0);
LABEL_32:
        objc_sync_exit(v12);
LABEL_33:

LABEL_34:
        goto LABEL_35;
      }
      uint64_t v16 = __57__POExtensionAgentProcess_resetDeviceKeysWithCompletion___block_invoke_345();
      if (!v6) {
        goto LABEL_31;
      }
    }
    else
    {
      if (a3 != 10)
      {
        if (a3 == 3)
        {
          if ([(POExtensionAgentProcess *)v12 pendingUserSEPKey])
          {
            uint64_t v13 = [(POExtensionAgentProcess *)v12 pendingUserSEPSigningAlgorithm];

            if (v13)
            {
              uint64_t v14 = [(POExtensionAgentProcess *)v12 configurationManager];
              uint64_t v15 = NSUserName();
              uint64_t v16 = [v14 userConfigurationForUserName:v15];

              if (v16)
              {
                objc_msgSend(v16, "setSepKey:", -[POExtensionAgentProcess pendingUserSEPKey](v12, "pendingUserSEPKey"));
                char v17 = [(POExtensionAgentProcess *)v12 pendingUserSEPSigningAlgorithm];
                [v16 setSigningAlgorithm:v17];

                [v16 setPendingSigningAlgorithm:0];
                char v18 = [(POExtensionAgentProcess *)v12 configurationManager];
                id v19 = NSUserName();
                char v20 = [v18 saveUserConfiguration:v16 forUserName:v19 syncToPreboot:1];

                if (v20)
                {
                  [(POExtensionAgentProcess *)v12 setPendingUserSEPKey:0];
                  [(POExtensionAgentProcess *)v12 setPendingUserSEPSigningAlgorithm:0];
                  v6[2](v6, 1, 0);
LABEL_31:

                  goto LABEL_32;
                }
                char v31 = __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_372();
                v6[2](v6, 0, v31);
              }
              else
              {
                char v31 = __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_360();
                v6[2](v6, 0, v31);
              }

              goto LABEL_31;
            }
          }
        }
LABEL_30:
        uint64_t v16 = __68__POExtensionAgentProcess_completeRotationKeyForKeyType_completion___block_invoke_463();
        v6[2](v6, 0, v16);
        goto LABEL_31;
      }
      if (![(POExtensionAgentProcess *)v12 pendingSigningKey]) {
        goto LABEL_30;
      }
      uint64_t v27 = [(POExtensionAgentProcess *)v12 pendingSigningAlgorithm];

      if (!v27) {
        goto LABEL_30;
      }
      objc_msgSend(v11, "setDeviceSigningKey:", -[POExtensionAgentProcess pendingSigningKey](v12, "pendingSigningKey"));
      v28 = [(POExtensionAgentProcess *)v12 pendingSigningAlgorithm];
      [v11 setSigningAlgorithm:v28];

      [v11 setPendingSigningAlgorithm:0];
      int v29 = [(POExtensionAgentProcess *)v12 configurationManager];
      char v30 = [v29 saveDeviceConfiguration:v11];

      if (v30)
      {
        [(POExtensionAgentProcess *)v12 setPendingSigningKey:0];
        [(POExtensionAgentProcess *)v12 setPendingSigningAlgorithm:0];
        goto LABEL_29;
      }
      uint64_t v16 = __57__POExtensionAgentProcess_resetDeviceKeysWithCompletion___block_invoke_345();
      if (!v6) {
        goto LABEL_31;
      }
    }
    v6[2](v6, 0, v16);
    goto LABEL_31;
  }
  BOOL v9 = __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
  v6[2](v6, 0, v9);
LABEL_35:
}

id __68__POExtensionAgentProcess_completeRotationKeyForKeyType_completion___block_invoke_449()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Failed to retrieve device configuration for extension."];
  id v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_26_cold_1();
  }

  return v0;
}

id __68__POExtensionAgentProcess_completeRotationKeyForKeyType_completion___block_invoke_463()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Invalid key type for rotation completion."];
  id v1 = PO_LOG_POExtensionAgentProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)addEvent:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(POExtensionAgentProcess *)self _analytics];
  id v5 = [v4 objectForKeyedSubscript:v8];

  if (v5)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
    uint64_t v7 = [(POExtensionAgentProcess *)self _analytics];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
  else
  {
    id v6 = [(POExtensionAgentProcess *)self _analytics];
    [v6 setObject:&unk_26E5D3400 forKeyedSubscript:v8];
  }
}

- (void)addEvent:(id)a3 forKeyType:(int64_t)a4
{
  id v6 = (void *)MEMORY[0x263F5E5F0];
  id v7 = a3;
  id v13 = [v6 stringForKeyType:a4];
  id v8 = objc_msgSend(v7, "stringByAppendingString:");

  BOOL v9 = [(POExtensionAgentProcess *)self _analytics];
  uint64_t v10 = [v9 objectForKeyedSubscript:v8];

  if (v10)
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "intValue") + 1);
    BOOL v12 = [(POExtensionAgentProcess *)self _analytics];
    [v12 setObject:v11 forKeyedSubscript:v8];
  }
  else
  {
    uint64_t v11 = [(POExtensionAgentProcess *)self _analytics];
    [v11 setObject:&unk_26E5D3400 forKeyedSubscript:v8];
  }
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (POConfigurationManager)configurationManager
{
  return (POConfigurationManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfigurationManager:(id)a3
{
}

- (POAgentAuthenticationProcess)agentProcess
{
  return (POAgentAuthenticationProcess *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAgentProcess:(id)a3
{
}

- (NSMutableArray)keyProxies
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setKeyProxies:(id)a3
{
}

- (NSObject)authenticationObserver
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setAuthenticationObserver:(id)a3
{
}

- (id)authenticationCompletion
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setAuthenticationCompletion:(id)a3
{
}

- (SOConfigurationHost)configurationHost
{
  return (SOConfigurationHost *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConfigurationHost:(id)a3
{
}

- (POKeychainHelper)keychainHelper
{
  return (POKeychainHelper *)objc_getProperty(self, a2, 72, 1);
}

- (void)setKeychainHelper:(id)a3
{
}

- (__SecKey)pendingEncryptionKey
{
  return self->_pendingEncryptionKey;
}

- (void)setPendingEncryptionKey:(__SecKey *)a3
{
  self->_pendingEncryptionKey = a3;
}

- (__SecKey)pendingSigningKey
{
  return self->_pendingSigningKey;
}

- (void)setPendingSigningKey:(__SecKey *)a3
{
  self->_pendingSigningKey = a3;
}

- (__SecKey)pendingUserSEPKey
{
  return self->_pendingUserSEPKey;
}

- (void)setPendingUserSEPKey:(__SecKey *)a3
{
  self->_pendingUserSEPKey = a3;
}

- (NSNumber)pendingEncryptionAlgorithm
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPendingEncryptionAlgorithm:(id)a3
{
}

- (NSNumber)pendingSigningAlgorithm
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPendingSigningAlgorithm:(id)a3
{
}

- (NSNumber)pendingUserSEPSigningAlgorithm
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPendingUserSEPSigningAlgorithm:(id)a3
{
}

- (NSMutableDictionary)_analytics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)set_analytics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__analytics, 0);
  objc_storeStrong((id *)&self->_pendingUserSEPSigningAlgorithm, 0);
  objc_storeStrong((id *)&self->_pendingSigningAlgorithm, 0);
  objc_storeStrong((id *)&self->_pendingEncryptionAlgorithm, 0);
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_configurationHost, 0);
  objc_storeStrong(&self->_authenticationCompletion, 0);
  objc_storeStrong((id *)&self->_authenticationObserver, 0);
  objc_storeStrong((id *)&self->_keyProxies, 0);
  objc_storeStrong((id *)&self->_agentProcess, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_destroyWeak((id *)&self->_xpcConnection);
}

- (void)keyProxyEndpointForKeyType:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)identityForKeyType:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

void __46__POExtensionAgentProcess_identityForKeyType___block_invoke_43_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [NSNumber numberWithInteger:*(void *)(a2 + 32)];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  BOOL v9 = v5;
  _os_log_error_impl(&dword_230E51000, a3, OS_LOG_TYPE_ERROR, "%{public}@, %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)bundleIdentiferForXPCConnection:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_230E51000, v0, OS_LOG_TYPE_DEBUG, "bundleIdentifier: CPCopyBundleIdentifierAndTeamFromAuditToken(): %{public}@", v1, 0xCu);
}

- (void)isCallerCurrentSSOExtension
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)isDeviceRegisteredWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)isUserRegisteredWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)registrationTokenWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)setRegistrationToken:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)ssoTokensWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_230E51000, log, OS_LOG_TYPE_DEBUG, "No stored SSO Tokens.", v1, 2u);
}

- (void)ssoTokensWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)setSsoTokens:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)loginConfigurationWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)setLoginConfiguration:(uint64_t)a3 completion:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  objc_begin_catch(a1);
  objc_end_catch();
  uint64_t v4 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_207();
  if (a3)
  {
    uint64_t v5 = OUTLINED_FUNCTION_11();
    v6(v5);
  }
}

- (void)setLoginConfiguration:(uint64_t)a3 completion:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  objc_begin_catch(a1);
  objc_end_catch();
  uint64_t v4 = __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_183();
  if (a3)
  {
    uint64_t v5 = OUTLINED_FUNCTION_11();
    v6(v5);
  }
}

- (void)setLoginConfiguration:completion:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)setCertificateData:keyType:completion:.cold.1()
{
  OUTLINED_FUNCTION_10();
  os_log_t v0 = objc_msgSend(NSNumber, "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_230E51000, v1, v2, "%s keyType = %{public}@ on %@", v3, v4, v5, v6, 2u);
}

- (void)secKeyProxyEndpointForKeyType:completion:.cold.1()
{
  OUTLINED_FUNCTION_10();
  os_log_t v0 = objc_msgSend(NSNumber, "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_230E51000, v1, v2, "%s keyType = %{public}@ on %@", v3, v4, v5, v6, 2u);
}

- (void)secIdentityProxyEndpointForKeyType:completion:.cold.1()
{
  OUTLINED_FUNCTION_10();
  os_log_t v0 = objc_msgSend(NSNumber, "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_230E51000, v1, v2, "%s keyType = %{public}@ on %@", v3, v4, v5, v6, 2u);
}

- (void)attestKey:clientDataHash:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)copyDeviceAttestationCertificateWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)userNeedsReauthenticationWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)deviceRegistrationsNeedsRepairWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)userRegistrationsNeedsRepairWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)presentRegistrationViewControllerWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)resetDeviceKeysWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)resetUserSecureEnclaveKeyWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_230E51000, a2, OS_LOG_TYPE_DEBUG, "Key policy = %{public}@", v4, 0xCu);
}

- (void)resetUserSecureEnclaveKeyWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)loginUserNameWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)setLoginUserName:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)userLoginConfigurationWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)setUserLoginConfiguration:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)rotateKeyForKeyType:(os_log_t)log completion:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)audit_token_t buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_230E51000, log, OS_LOG_TYPE_DEBUG, "Key policy = %{public}@", buf, 0xCu);
}

- (void)rotateKeyForKeyType:(uint64_t)a1 completion:.cold.2(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_230E51000, v2, v3, "%s keyType = %{public}@ on %@", v4, v5, v6, v7, 2u);
}

- (void)completeRotationKeyForKeyType:(uint64_t)a1 completion:.cold.1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_230E51000, v2, v3, "%s keyType = %{public}@ on %@", v4, v5, v6, v7, 2u);
}

@end