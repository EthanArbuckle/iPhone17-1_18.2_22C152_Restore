@interface POUIAgentProcess
- (POAgentAuthenticationProcess)agentProcess;
- (POConfigurationManager)configurationManager;
- (POUIAgentProcess)initWithXPCConnection:(id)a3 authenticationProcess:(id)a4;
- (SOConfigurationHost)configurationHost;
- (id)invalidationHandler;
- (void)connectionInvalidated;
- (void)deviceStatusWithCompletion:(id)a3;
- (void)setAgentProcess:(id)a3;
- (void)setConfigurationHost:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)startAction:(int64_t)a3 forUserName:(id)a4 completion:(id)a5;
- (void)startDeviceAction:(int64_t)a3 completion:(id)a4;
- (void)statusForUser:(id)a3 completion:(id)a4;
@end

@implementation POUIAgentProcess

- (POUIAgentProcess)initWithXPCConnection:(id)a3 authenticationProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 valueForEntitlement:@"com.apple.private.platformsso.settings"];
  v9 = v8;
  if (v8 && ([v8 BOOLValue] & 1) != 0)
  {
    v19.receiver = self;
    v19.super_class = (Class)POUIAgentProcess;
    v10 = [(POUIAgentProcess *)&v19 init];
    if (v10)
    {
      uint64_t v11 = +[POConfigurationManager sharedInstance];
      configurationManager = v10->_configurationManager;
      v10->_configurationManager = (POConfigurationManager *)v11;

      uint64_t v13 = [MEMORY[0x263F25258] defaultManager];
      configurationHost = v10->_configurationHost;
      v10->_configurationHost = (SOConfigurationHost *)v13;

      id v15 = objc_storeWeak((id *)&v10->_xpcConnection, v6);
      [v6 setInterruptionHandler:&__block_literal_global_10];

      objc_storeStrong((id *)&v10->_agentProcess, a4);
    }
    self = v10;
    v16 = self;
  }
  else
  {
    v17 = PO_LOG_POAgentProcess_0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[POUIAgentProcess initWithXPCConnection:authenticationProcess:](v17);
    }

    v16 = 0;
  }

  return v16;
}

- (void)connectionInvalidated
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = PO_LOG_POAgentProcess_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[POUIAgentProcess connectionInvalidated]";
    __int16 v6 = 2112;
    id v7 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)deviceStatusWithCompletion:(id)a3
{
  int v4 = (void (**)(id, PODeviceRegistrationStatus *, void))a3;
  v5 = PO_LOG_POAgentProcess_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POUIAgentProcess deviceStatusWithCompletion:]();
  }

  __int16 v6 = objc_alloc_init(PODeviceRegistrationStatus);
  [(PODeviceRegistrationStatus *)v6 setPlatformSSOEnabled:+[POConfigurationUtil platformSSOEnabled]];
  if ([(PODeviceRegistrationStatus *)v6 isPlatformSSOEnabled])
  {
    id v7 = [(POUIAgentProcess *)self configurationManager];
    uint64_t v8 = [v7 currentDeviceConfiguration];

    if (!v8) {
      id v9 = __47__POUIAgentProcess_deviceStatusWithCompletion___block_invoke();
    }
    v10 = [POProfile alloc];
    uint64_t v11 = [(POUIAgentProcess *)self configurationHost];
    v12 = [v11 validatedProfileForPlatformSSO];
    uint64_t v13 = [(POProfile *)v10 initWithProfile:v12];

    if (!v13) {
      id v14 = __47__POUIAgentProcess_deviceStatusWithCompletion___block_invoke_13();
    }
    id v15 = [v8 accountDisplayName];
    if (v15)
    {
      [(PODeviceRegistrationStatus *)v6 setAccountName:v15];
    }
    else
    {
      v16 = [(POUIAgentProcess *)self configurationManager];
      v17 = [v16 currentLoginConfiguration];
      v18 = [v17 accountDisplayName];
      [(PODeviceRegistrationStatus *)v6 setAccountName:v18];
    }
    objc_super v19 = [v8 extensionIdentifier];
    if (v19)
    {
      [(PODeviceRegistrationStatus *)v6 setRegisteredBundleIdentifier:v19];
    }
    else
    {
      v20 = [(POProfile *)v13 extensionBundleIdentifier];
      [(PODeviceRegistrationStatus *)v6 setRegisteredBundleIdentifier:v20];
    }
    v21 = (void *)MEMORY[0x263F01890];
    v22 = [(PODeviceRegistrationStatus *)v6 registeredBundleIdentifier];
    id v34 = 0;
    v23 = [v21 bundleRecordWithBundleIdentifier:v22 allowPlaceholder:1 error:&v34];
    id v24 = v34;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [v23 localizedName];
      [(PODeviceRegistrationStatus *)v6 setRegisteredExtensionName:v25];
    }
    v26 = [(POUIAgentProcess *)self agentProcess];
    uint64_t v27 = [v26 registrationState];

    uint64_t v28 = 1;
    uint64_t v29 = 2;
    uint64_t v30 = 2;
    switch(v27)
    {
      case 0:
        if (v8 && (objc_msgSend(v8, "registrationCompleted", 2) & 1) != 0)
        {
          uint64_t v28 = 1;
          uint64_t v29 = 2;
          uint64_t v30 = 2;
          goto LABEL_29;
        }
        v31 = [(POUIAgentProcess *)self agentProcess];
        int v32 = [v31 registrationFailed];

        if (v32) {
          uint64_t v29 = 3;
        }
        else {
          uint64_t v29 = 0;
        }
        uint64_t v28 = 1;
        goto LABEL_28;
      case 1:
      case 6:
      case 7:
      case 8:
        goto LABEL_29;
      case 2:
      case 4:
        uint64_t v28 = 0;
        uint64_t v29 = 1;
        goto LABEL_28;
      case 3:
        uint64_t v29 = 1;
        uint64_t v28 = 1;
LABEL_28:
        uint64_t v30 = 1;
        goto LABEL_29;
      case 5:
        uint64_t v30 = 1;
        uint64_t v29 = 3;
        uint64_t v28 = 1;
LABEL_29:
        [(PODeviceRegistrationStatus *)v6 setDeviceRegistrationStatus:v29];
        [(PODeviceRegistrationStatus *)v6 setActionButtonEnabled:v28];
        [(PODeviceRegistrationStatus *)v6 setActionButtonAction:v30];
        break;
      default:
        break;
    }
    v33 = PO_LOG_POAgentProcess_0();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[POUIAgentProcess deviceStatusWithCompletion:]();
    }

    v4[2](v4, v6, 0);
  }
  else
  {
    v4[2](v4, v6, 0);
  }
}

id __47__POUIAgentProcess_deviceStatusWithCompletion___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"Device configuration not found when retrieving device UI status."];
  v1 = PO_LOG_POAgentProcess_0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __47__POUIAgentProcess_deviceStatusWithCompletion___block_invoke_13()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"No validated Platform SSO Profiles found when retrieving device UI status."];
  v1 = PO_LOG_POAgentProcess_0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)startDeviceAction:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = PO_LOG_POAgentProcess_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POUIAgentProcess startDeviceAction:completion:](a3);
  }

  uint64_t v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__POUIAgentProcess_startDeviceAction_completion___block_invoke;
  block[3] = &unk_264BBF650;
  id v11 = v6;
  int64_t v12 = a3;
  block[4] = self;
  id v9 = v6;
  dispatch_async(v8, block);
}

uint64_t __49__POUIAgentProcess_startDeviceAction_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 2)
  {
    v3 = [*(id *)(a1 + 32) agentProcess];
    int v4 = v3;
    uint64_t v5 = 1;
  }
  else
  {
    if (v2 != 1) {
      goto LABEL_6;
    }
    v3 = [*(id *)(a1 + 32) agentProcess];
    int v4 = v3;
    uint64_t v5 = 0;
  }
  [v3 handleDeviceAndUserRegistrationForRepair:v5 newPasswordUser:0 newSmartCardUser:0 notified:1 profile:0];

LABEL_6:
  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

- (void)statusForUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, POUserRegistrationStatus *, void))a4;
  uint64_t v8 = PO_LOG_POAgentProcess_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POUIAgentProcess statusForUser:completion:]();
  }

  id v9 = objc_alloc_init(POUserRegistrationStatus);
  [(POUserRegistrationStatus *)v9 setPlatformSSOEnabled:+[POConfigurationUtil platformSSOEnabled]];
  if ([(POUserRegistrationStatus *)v9 isPlatformSSOEnabled])
  {
    v10 = [(POUIAgentProcess *)self configurationManager];
    id v11 = NSUserName();
    char v12 = [v6 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [[POConfigurationManager alloc] initWithUserName:v6];

      v10 = v13;
    }
    id v14 = [v10 currentDeviceConfiguration];
    if (v14)
    {
      id v15 = [v10 currentUserConfiguration];
      if (!v15) {
        id v16 = __45__POUIAgentProcess_statusForUser_completion___block_invoke_28();
      }
      v17 = [v15 userLoginConfiguration];
      v18 = [v17 loginUserName];
      [(POUserRegistrationStatus *)v9 setLoginUserName:v18];

      -[POUserRegistrationStatus setAuthenticationMethod:](v9, "setAuthenticationMethod:", [v15 loginType]);
      objc_super v19 = [(POUIAgentProcess *)self agentProcess];
      uint64_t v20 = [v19 registrationState];

      switch(v20)
      {
        case 0:
        case 1:
          id v24 = [(POUIAgentProcess *)self agentProcess];
          int v25 = [v24 registrationFailed];

          if (v25) {
            goto LABEL_14;
          }
          [(POUserRegistrationStatus *)v9 setUserRegistrationStatus:2];
          [(POUserRegistrationStatus *)v9 setActionButtonEnabled:1];
          [(POUserRegistrationStatus *)v9 setActionButtonAction:2];
          [(POUserRegistrationStatus *)v9 setAuthenticateButtonEnabled:1];
          break;
        case 2:
        case 3:
        case 4:
        case 5:
          [(POUserRegistrationStatus *)v9 setPlatformSSOEnabled:1];
          v21 = v9;
          uint64_t v22 = 0;
          goto LABEL_16;
        case 6:
        case 7:
          v21 = v9;
          uint64_t v22 = 1;
LABEL_16:
          [(POUserRegistrationStatus *)v21 setUserRegistrationStatus:v22];
          v26 = v9;
          uint64_t v27 = 0;
          goto LABEL_17;
        case 8:
LABEL_14:
          [(POUserRegistrationStatus *)v9 setUserRegistrationStatus:3];
          v26 = v9;
          uint64_t v27 = 1;
LABEL_17:
          [(POUserRegistrationStatus *)v26 setActionButtonEnabled:v27];
          [(POUserRegistrationStatus *)v9 setActionButtonAction:1];
          break;
        default:
          break;
      }
      uint64_t v28 = [v10 currentRefreshToken];

      if (v28)
      {
        uint64_t v29 = [v10 tokenExpiration];
        [v29 timeIntervalSinceNow];
        double v31 = v30;

        if (v31 > 0.0) {
          uint64_t v32 = 1;
        }
        else {
          uint64_t v32 = 2;
        }
      }
      else
      {
        uint64_t v32 = 0;
      }
      [(POUserRegistrationStatus *)v9 setUserTokenStatus:v32];
      v33 = [v14 nonPlatformSSOAccounts];
      id v34 = NSUserName();
      v35 = [v34 lowercaseString];
      int v36 = [v33 containsObject:v35];

      if (v36)
      {
        [(POUserRegistrationStatus *)v9 setPlatformSSOEnabled:0];
        [(POUserRegistrationStatus *)v9 setUserRegistrationStatus:0];
        [(POUserRegistrationStatus *)v9 setActionButtonAction:0];
        [(POUserRegistrationStatus *)v9 setActionButtonEnabled:0];
        [(POUserRegistrationStatus *)v9 setAuthenticateButtonEnabled:0];
      }
      v37 = NSUserName();
      char v38 = [v6 isEqualToString:v37];

      if ((v38 & 1) == 0)
      {
        [(POUserRegistrationStatus *)v9 setActionButtonEnabled:0];
        [(POUserRegistrationStatus *)v9 setAuthenticateButtonEnabled:0];
      }
      v39 = PO_LOG_POAgentProcess_0();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        -[POUIAgentProcess statusForUser:completion:]();
      }

      v7[2](v7, v9, 0);
    }
    else
    {
      id v23 = __45__POUIAgentProcess_statusForUser_completion___block_invoke();
      [(POUserRegistrationStatus *)v9 setPlatformSSOEnabled:0];
      v7[2](v7, v9, 0);
    }
  }
  else
  {
    v7[2](v7, v9, 0);
  }
}

id __45__POUIAgentProcess_statusForUser_completion___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"Device configuration not found when retrieving user UI status."];
  v1 = PO_LOG_POAgentProcess_0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __45__POUIAgentProcess_statusForUser_completion___block_invoke_28()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"User configuration not found when retrieving user UI status."];
  v1 = PO_LOG_POAgentProcess_0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)startAction:(int64_t)a3 forUserName:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = PO_LOG_POAgentProcess_0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[POUIAgentProcess startAction:forUserName:completion:](a3);
  }

  id v11 = dispatch_get_global_queue(0, 0);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__POUIAgentProcess_startAction_forUserName_completion___block_invoke;
  v14[3] = &unk_264BBF678;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

uint64_t __55__POUIAgentProcess_startAction_forUserName_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  switch(v2)
  {
    case 3:
      v3 = [*(id *)(a1 + 32) agentProcess];
      [(POConfigurationManager *)v3 requestUserAuthenticationWithUserInfo:0];
      break;
    case 2:
      v3 = [[POConfigurationManager alloc] initWithUserName:*(void *)(a1 + 40)];
      int v4 = [(POConfigurationManager *)v3 currentUserConfiguration];
      uint64_t v5 = [v4 userLoginConfiguration];
      id v6 = [v5 loginUserName];

      id v7 = [*(id *)(a1 + 32) agentProcess];
      [v7 handleUserRegistrationForUser:v6 repair:1 newPasswordUser:0 newSmartCardUser:0 notified:1 profile:0];

      break;
    case 1:
      v3 = [*(id *)(a1 + 32) agentProcess];
      [(POConfigurationManager *)v3 handleUserRegistrationForUser:0 repair:0 newPasswordUser:0 newSmartCardUser:0 notified:1 profile:0];
      break;
    default:
      goto LABEL_8;
  }

LABEL_8:
  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v8();
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

- (SOConfigurationHost)configurationHost
{
  return (SOConfigurationHost *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfigurationHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationHost, 0);
  objc_storeStrong((id *)&self->_agentProcess, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_destroyWeak((id *)&self->_xpcConnection);
}

- (void)initWithXPCConnection:(os_log_t)log authenticationProcess:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_230E51000, log, OS_LOG_TYPE_ERROR, "missing required entitlement", v1, 2u);
}

- (void)deviceStatusWithCompletion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_230E51000, v0, OS_LOG_TYPE_DEBUG, "Device Status: %{private}@", v1, 0xCu);
}

- (void)deviceStatusWithCompletion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_230E51000, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

- (void)startDeviceAction:(uint64_t)a1 completion:.cold.1(uint64_t a1)
{
  v1 = +[POConstantUtil stringForDeviceAction:a1];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_230E51000, v2, v3, "%s action=%{public}@ on %@", v4, v5, v6, v7, 2u);
}

- (void)statusForUser:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_230E51000, v0, OS_LOG_TYPE_DEBUG, "User Status: %{private}@", v1, 0xCu);
}

- (void)statusForUser:completion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_230E51000, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

- (void)startAction:(uint64_t)a1 forUserName:completion:.cold.1(uint64_t a1)
{
  v1 = +[POConstantUtil stringForUserAction:a1];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_230E51000, v2, v3, "%s action=%{public}@ on %@", v4, v5, v6, v7, 2u);
}

@end