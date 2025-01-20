@interface POAgentAuthenticationProcess
- (BOOL)_doLoginWithPasswordContext:(id)a3 tokenId:(id)a4;
- (BOOL)_doRefreshWithPasswordContext:(id)a3 tokenId:(id)a4;
- (BOOL)enableNetworkChanges;
- (BOOL)handleUserAuthorizationNeededForAccountDisplayName:(id)a3 bundleIdentifier:(id)a4;
- (BOOL)handleUserNeedsReauthenticationAfterDelay:(double)a3;
- (BOOL)isCurrentSSOExtension:(id)a3;
- (BOOL)performLoginForCurrentUserWithPasswordContext:(id)a3;
- (BOOL)performLoginForCurrentUserWithPasswordContext:(id)a3 tokenId:(id)a4;
- (BOOL)platformSSOAccount;
- (BOOL)platformSSOActive;
- (BOOL)registrationFailed;
- (BOOL)screenUnlocked;
- (BOOL)shieldLowered;
- (BOOL)shouldRunConfigurationChangeWhenUnlocked;
- (NSDate)lastAuthenticationAttempt;
- (NSDistributedNotificationCenter)distributedNotificationCenter;
- (NSNotificationCenter)notificationCenter;
- (NSObject)authenticationTimerLock;
- (NSObject)platformSSOActiveLock;
- (NSObject)screenUnlockLock;
- (NSObject)shieldLoweredLock;
- (NSString)userName;
- (NSTimer)authenticationTimer;
- (OS_dispatch_queue)loginQueue;
- (POAgentAuthenticationProcess)initWithDelegate:(id)a3;
- (POAgentAuthenticationProcessKerberosDelegate)kerberosDelegate;
- (POAuthenticationProcess)authenticationProcess;
- (POConfigurationManager)configurationManager;
- (PODirectoryServices)directoryServices;
- (POJWKSStorageProvider)jwksStorageProvider;
- (POKerberosHelper)kerberosHelper;
- (POKeyBag)keyBag;
- (POKeyWrap)keyWrap;
- (POKeychainHelper)keychainHelper;
- (PORegistrationContext)registrationContext;
- (POTokenHelper)tokenHelper;
- (SOConfigurationHost)configurationHost;
- (SOExtensionManager)extensionManager;
- (UNUserNotificationCenter)userNotificationCenter;
- (id)__screenUnlockHandler;
- (id)__shieldLoweredHandler;
- (id)bestEncryptionAlgorithm:(id)a3 or:(id)a4;
- (id)bestSigningAlgorithm:(id)a3 or:(id)a4;
- (id)createPasswordChangedNotificationWithAccountName:(id)a3 extensionIdentifier:(id)a4;
- (id)createRegistrationNotificationWithAccountName:(id)a3;
- (id)createRegistrationUpdateNotificationWithAccountName:(id)a3;
- (id)createSignInNotificationWithAccountName:(id)a3 extensionIdentifier:(id)a4;
- (id)deviceEncryptionAlgorithmToUse:(id)a3 deviceConfiguration:(id)a4;
- (id)deviceSigningAlgorithmToUse:(id)a3 deviceConfiguration:(id)a4;
- (id)loadSSOExtensionWithExtensionBundleIdentifier:(id)a3;
- (id)userSigningAlgorithmToUse:(id)a3 userConfiguration:(id)a4;
- (int)ssoMethodToUse:(id)a3 profile:(id)a4;
- (int64_t)registrationState;
- (unint64_t)handleKeyRequestSync;
- (unint64_t)handleTokenBindingWithPasswordContext:(id)a3;
- (unint64_t)requestSmartCardForBinding:(BOOL)a3 tokenId:(id *)a4 tokenHash:(id *)a5 wrapTokenHash:(id *)a6;
- (unint64_t)requestUserPasswordChangePreference;
- (void)_doUnlockForTokenWithCredentialContext:(id)a3 atLogin:(BOOL)a4;
- (void)_handleLoginResult:(unint64_t)a3 authenticationContext:(id)a4 tokens:(id)a5 passwordContext:(id)a6 tokenId:(id)a7 tokenHash:(id)a8;
- (void)_startDeviceRegistration;
- (void)_startUserRegistration;
- (void)checkIfPlatformSSOIsActive;
- (void)configurationChanged;
- (void)configurationChanged:(id)a3;
- (void)continueDeviceRegistration:(id)a3;
- (void)continueUserRegistration:(id)a3;
- (void)dealloc;
- (void)doUnlockForPasswordWithCredentialContext:(id)a3 atLogin:(BOOL)a4;
- (void)doUnlockForSmartCardWithCredentialContext:(id)a3 tokenId:(id)a4 atLogin:(BOOL)a5;
- (void)doUnlockForTokenLoginWithCredentialContext:(id)a3 atLogin:(BOOL)a4;
- (void)doUnlockForTokenUnlockWithCredentialContext:(id)a3 atLogin:(BOOL)a4;
- (void)doUnlockWithEmptyCredentialContext:(id)a3 atLogin:(BOOL)a4;
- (void)exchangeTGTForStatus:(id)a3;
- (void)exitDeviceRegistration:(id)a3;
- (void)exitRegistration:(id)a3;
- (void)exitUserRegistration:(id)a3;
- (void)failDeviceRegistrationBeforeAuthorization;
- (void)failUserRegistrationBeforeAuthorization;
- (void)finishRegistrationWithRetry;
- (void)finishRegistrationWithStatus:(BOOL)a3;
- (void)finishRegistrationWithStatus:(BOOL)a3 message:(id)a4;
- (void)handleAgentStartup;
- (void)handleConfigurationChanged:(BOOL)a3;
- (void)handleConfigurationChanged:(BOOL)a3 startup:(BOOL)a4;
- (void)handleDeviceAndUserRegistrationForRepair:(BOOL)a3;
- (void)handleDeviceAndUserRegistrationForRepair:(BOOL)a3 newPasswordUser:(BOOL)a4 newSmartCardUser:(BOOL)a5 notified:(BOOL)a6 profile:(id)a7;
- (void)handleDeviceRegistrationNotification;
- (void)handleEncryptionKeyRotation;
- (void)handleKerberosMappingForTokens:(id)a3 extensionIdentifier:(id)a4 userConfiguration:(id)a5;
- (void)handleKerberosMappingForTokens:(id)a3 loginConfiguration:(id)a4 userConfiguration:(id)a5;
- (void)handleKeyRequestSync;
- (void)handleKeyRequestWithCompletion:(id)a3;
- (void)handleKeyUpdatesWithPasswordContext:(id)a3;
- (void)handleNetworkChange;
- (void)handlePendingSSOTokensWithSharedData:(id)a3;
- (void)handleRegistrationViewControllerForExtensionIdentifier:(id)a3 completion:(id)a4;
- (void)handleRemovingRegistrationForExtension:(id)a3 alreadyDeleted:(BOOL)a4;
- (void)handleRemovingSSOTokens;
- (void)handleScreenLock;
- (void)handleScreenUnlock;
- (void)handleScreenUnlockWithCredentialContext:(id)a3 tokenId:(id)a4 atLogin:(BOOL)a5 tokenUnlock:(BOOL)a6;
- (void)handleUnfinishedTGTExchanges;
- (void)handleUserCredentialNeededAtLogin:(BOOL)a3 smartCard:(BOOL)a4 accountDisplayName:(id)a5 bundleIdentifier:(id)a6 returningContext:(id *)a7;
- (void)handleUserRegistrationForUser:(id)a3 repair:(BOOL)a4;
- (void)handleUserRegistrationForUser:(id)a3 repair:(BOOL)a4 newPasswordUser:(BOOL)a5 newSmartCardUser:(BOOL)a6 notified:(BOOL)a7 profile:(id)a8;
- (void)handleUserRegistrationNotification;
- (void)notifyKerberosDelegateTGTDidBegin;
- (void)notifyKerberosDelegateTGTDidComplete;
- (void)postAuthenticationNotification:(unint64_t)a3;
- (void)promptUserForRegistration;
- (void)requestDidCompleteWithError:(id)a3;
- (void)requestUserAuthenticationSyncPassword:(BOOL)a3 completion:(id)a4;
- (void)requestUserAuthenticationWithUserInfo:(id)a3;
- (void)requestUserAuthenticationWithWindow:(id)a3 completion:(id)a4;
- (void)requestUserPasswordChangePreference;
- (void)resetRegistrationWithCompletion:(id)a3;
- (void)sendPasswordChangedNotification;
- (void)setAuthenticationProcess:(id)a3;
- (void)setAuthenticationTimer:(id)a3;
- (void)setAuthenticationTimerLock:(id)a3;
- (void)setConfigurationHost:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setDirectoryServices:(id)a3;
- (void)setDistributedNotificationCenter:(id)a3;
- (void)setEnableNetworkChanges:(BOOL)a3;
- (void)setExtensionManager:(id)a3;
- (void)setJwksStorageProvider:(id)a3;
- (void)setKerberosDelegate:(id)a3;
- (void)setKerberosHelper:(id)a3;
- (void)setKeyBag:(id)a3;
- (void)setKeyWrap:(id)a3;
- (void)setKeychainHelper:(id)a3;
- (void)setLastAuthenticationAttempt:(id)a3;
- (void)setLoginQueue:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setPlatformSSOAccount:(BOOL)a3;
- (void)setPlatformSSOActive:(BOOL)a3;
- (void)setPlatformSSOActiveLock:(id)a3;
- (void)setRegistrationContext:(id)a3;
- (void)setRegistrationFailed:(BOOL)a3;
- (void)setScreenUnlockLock:(id)a3;
- (void)setScreenUnlocked:(BOOL)a3;
- (void)setShieldLowered:(BOOL)a3;
- (void)setShieldLoweredLock:(id)a3;
- (void)setShouldRunConfigurationChangeWhenUnlocked:(BOOL)a3;
- (void)setTokenHelper:(id)a3;
- (void)setUserName:(id)a3;
- (void)setUserNotificationCenter:(id)a3;
- (void)set__screenUnlockHandler:(id)a3;
- (void)set__shieldLoweredHandler:(id)a3;
- (void)setupNotificationCategories;
- (void)setupTimerForAuthentication;
- (void)showAlertMessage:(id)a3 messageText:(id)a4 completion:(id)a5;
- (void)showAlertWithError:(id)a3 completion:(id)a4;
- (void)showRegistrationUI;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)waitForScreenUnlockithCompletion:(id)a3;
- (void)waitForShieldLoweredWithCompletion:(id)a3;
- (void)windowDidClose;
@end

@implementation POAgentAuthenticationProcess

- (POAgentAuthenticationProcess)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess initWithDelegate:]();
  }

  v41.receiver = self;
  v41.super_class = (Class)POAgentAuthenticationProcess;
  v6 = [(POAgentAuthenticationProcess *)&v41 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_kerberosDelegate, v4);
    v8 = (POAuthenticationProcess *)objc_alloc_init(MEMORY[0x263F5E5E0]);
    authenticationProcess = v7->_authenticationProcess;
    v7->_authenticationProcess = v8;

    [(POAuthenticationProcess *)v7->_authenticationProcess setWaitForConnectivity:1];
    uint64_t v10 = +[POConfigurationManager sharedInstance];
    configurationManager = v7->_configurationManager;
    v7->_configurationManager = (POConfigurationManager *)v10;

    v12 = (POKeyBag *)objc_alloc_init(MEMORY[0x263F5E628]);
    keyBag = v7->_keyBag;
    v7->_keyBag = v12;

    [(POKeyBag *)v7->_keyBag startObservingKeyBagLockStatusChanges];
    v14 = (POKeyWrap *)objc_alloc_init(MEMORY[0x263F5E630]);
    keyWrap = v7->_keyWrap;
    v7->_keyWrap = v14;

    uint64_t v16 = [MEMORY[0x263F25258] defaultManager];
    configurationHost = v7->_configurationHost;
    v7->_configurationHost = (SOConfigurationHost *)v16;

    uint64_t v18 = [MEMORY[0x263F25260] sharedInstance];
    extensionManager = v7->_extensionManager;
    v7->_extensionManager = (SOExtensionManager *)v18;

    v20 = objc_alloc_init(POKerberosHelper);
    kerberosHelper = v7->_kerberosHelper;
    v7->_kerberosHelper = v20;

    v7->_registrationFailed = 0;
    uint64_t v22 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.PlatformSSO.notifications"];
    userNotificationCenter = v7->_userNotificationCenter;
    v7->_userNotificationCenter = (UNUserNotificationCenter *)v22;

    [(UNUserNotificationCenter *)v7->_userNotificationCenter setDelegate:v7];
    [(UNUserNotificationCenter *)v7->_userNotificationCenter setWantsNotificationResponsesDelivered];
    [(POAgentAuthenticationProcess *)v7 setupNotificationCategories];
    uint64_t v24 = NSUserName();
    userName = v7->_userName;
    v7->_userName = (NSString *)v24;

    uint64_t v26 = [MEMORY[0x263F08A00] defaultCenter];
    notificationCenter = v7->_notificationCenter;
    v7->_notificationCenter = (NSNotificationCenter *)v26;

    uint64_t v28 = [MEMORY[0x263F087C8] defaultCenter];
    distributedNotificationCenter = v7->_distributedNotificationCenter;
    v7->_distributedNotificationCenter = (NSDistributedNotificationCenter *)v28;

    v30 = objc_alloc_init(PODirectoryServices);
    directoryServices = v7->_directoryServices;
    v7->_directoryServices = v30;

    *(_WORD *)&v7->_platformSSOActive = 0;
    v7->_shouldRunConfigurationChangeWhenUnlocked = 0;
    uint64_t v32 = [objc_alloc(MEMORY[0x263F5E658]) initWithIdentifierProvider:v7->_directoryServices];
    tokenHelper = v7->_tokenHelper;
    v7->_tokenHelper = (POTokenHelper *)v32;

    v34 = (POKeychainHelper *)objc_alloc_init(MEMORY[0x263F5E638]);
    keychainHelper = v7->_keychainHelper;
    v7->_keychainHelper = v34;

    v36 = [[POKeychainJWKSStorageProvider alloc] initWithSystem:0];
    jwksStorageProvider = v7->_jwksStorageProvider;
    v7->_jwksStorageProvider = (POJWKSStorageProvider *)v36;

    dispatch_queue_t v38 = dispatch_queue_create("com.apple.AppSSOAgent.PlatformSSO.login", 0);
    loginQueue = v7->_loginQueue;
    v7->_loginQueue = (OS_dispatch_queue *)v38;

    *(_WORD *)&v7->_screenUnlocked = 0;
  }

  return v7;
}

- (void)dealloc
{
  v3 = [(POAgentAuthenticationProcess *)self authenticationTimer];

  if (v3)
  {
    id v4 = [(POAgentAuthenticationProcess *)self authenticationTimer];
    [v4 invalidate];

    [(POAgentAuthenticationProcess *)self setAuthenticationTimer:0];
  }
  v5 = [(POAgentAuthenticationProcess *)self distributedNotificationCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)POAgentAuthenticationProcess;
  [(POAgentAuthenticationProcess *)&v6 dealloc];
}

- (int64_t)registrationState
{
  v2 = [(POAgentAuthenticationProcess *)self registrationContext];
  int64_t v3 = [v2 state];

  return v3;
}

- (void)handleScreenUnlockWithCredentialContext:(id)a3 tokenId:(id)a4 atLogin:(BOOL)a5 tokenUnlock:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess handleScreenUnlockWithCredentialContext:tokenId:atLogin:tokenUnlock:]();
  }

  int v13 = [v10 isCredentialSet:-3];
  if (v13)
  {
    v14 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[POAgentAuthenticationProcess handleScreenUnlockWithCredentialContext:tokenId:atLogin:tokenUnlock:]();
    }
    goto LABEL_9;
  }
  if ([v10 isCredentialSet:-9])
  {
    v14 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[POAgentAuthenticationProcess handleScreenUnlockWithCredentialContext:tokenId:atLogin:tokenUnlock:]();
    }
LABEL_9:
    int v15 = v13 ^ 1;

    if (!v7) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v16 = [(POAgentAuthenticationProcess *)self configurationManager];
    v17 = [(POAgentAuthenticationProcess *)self configurationManager];
    uint64_t v18 = [v17 currentDeviceConfiguration];
    v19 = [v18 extensionIdentifier];
    id v35 = 0;
    char v20 = [v16 setTokens:0 extensionIdentifier:v19 returningError:&v35];
    id v21 = v35;

    if ((v20 & 1) == 0)
    {
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __100__POAgentAuthenticationProcess_handleScreenUnlockWithCredentialContext_tokenId_atLogin_tokenUnlock___block_invoke;
      v33[3] = &unk_264BBECA8;
      id v34 = v21;
      id v22 = __100__POAgentAuthenticationProcess_handleScreenUnlockWithCredentialContext_tokenId_atLogin_tokenUnlock___block_invoke((uint64_t)v33);
    }
    id v11 = v27;
    BOOL v6 = v26;
    uint64_t v7 = HIDWORD(v26);
    if (v13) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
  int v15 = 0;
  if (v7) {
    goto LABEL_13;
  }
LABEL_10:
  if (v13)
  {
LABEL_11:
    [(POAgentAuthenticationProcess *)self doUnlockForSmartCardWithCredentialContext:v10 tokenId:v11 atLogin:v7];
    goto LABEL_26;
  }
LABEL_16:
  if (v15)
  {
    if (v6
      && ([(POAgentAuthenticationProcess *)self configurationManager],
          v23 = objc_claimAutoreleasedReturnValue(),
          [v23 currentUserConfiguration],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          uint64_t v25 = [v24 loginType],
          v24,
          v23,
          v25 == 1))
    {
      if (v7) {
        [(POAgentAuthenticationProcess *)self doUnlockForTokenLoginWithCredentialContext:v10 atLogin:1];
      }
      else {
        [(POAgentAuthenticationProcess *)self doUnlockForTokenUnlockWithCredentialContext:v10 atLogin:0];
      }
    }
    else
    {
      [(POAgentAuthenticationProcess *)self doUnlockForPasswordWithCredentialContext:v10 atLogin:v7];
    }
  }
  else if (v7)
  {
    [(POAgentAuthenticationProcess *)self doUnlockWithEmptyCredentialContext:0 atLogin:1];
  }
  else
  {
    objc_initWeak(&location, self);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __100__POAgentAuthenticationProcess_handleScreenUnlockWithCredentialContext_tokenId_atLogin_tokenUnlock___block_invoke_67;
    v28[3] = &unk_264BBF1D8;
    objc_copyWeak(&v30, &location);
    id v29 = v10;
    char v31 = 0;
    [(POAgentAuthenticationProcess *)self waitForScreenUnlockithCompletion:v28];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
LABEL_26:
}

id __100__POAgentAuthenticationProcess_handleScreenUnlockWithCredentialContext_tokenId_atLogin_tokenUnlock___block_invoke(uint64_t a1)
{
  v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to clear SSO tokens after login."];
  v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

void __100__POAgentAuthenticationProcess_handleScreenUnlockWithCredentialContext_tokenId_atLogin_tokenUnlock___block_invoke_67(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained doUnlockWithEmptyCredentialContext:*(void *)(a1 + 32) atLogin:*(unsigned __int8 *)(a1 + 48)];
}

- (void)doUnlockForSmartCardWithCredentialContext:(id)a3 tokenId:(id)a4 atLogin:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess doUnlockForSmartCardWithCredentialContext:tokenId:atLogin:]();
  }

  id v11 = [(POAgentAuthenticationProcess *)self loginQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__POAgentAuthenticationProcess_doUnlockForSmartCardWithCredentialContext_tokenId_atLogin___block_invoke;
  v14[3] = &unk_264BBF200;
  BOOL v17 = a5;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(v11, v14);
}

void __90__POAgentAuthenticationProcess_doUnlockForSmartCardWithCredentialContext_tokenId_atLogin___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) keyBag];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __90__POAgentAuthenticationProcess_doUnlockForSmartCardWithCredentialContext_tokenId_atLogin___block_invoke_2;
  v4[3] = &unk_264BBF200;
  char v7 = *(unsigned char *)(a1 + 56);
  int64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  [v2 waitForKeyBagUnlockWithCompletion:v4];
}

void __90__POAgentAuthenticationProcess_doUnlockForSmartCardWithCredentialContext_tokenId_atLogin___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) handleRemovingSSOTokens];
  }
  v2 = *(void **)(a1 + 32);
  int64_t v3 = [*(id *)(a1 + 40) dataUsingEncoding:4];
  [v2 handlePendingSSOTokensWithSharedData:v3];

  [*(id *)(a1 + 32) performLoginForCurrentUserWithPasswordContext:*(void *)(a1 + 48) tokenId:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) handleUnfinishedTGTExchanges];
  if (([*(id *)(a1 + 32) shouldRunConfigurationChangeWhenUnlocked] & 1) != 0
    || ([*(id *)(a1 + 32) configurationManager],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 currentUserConfiguration],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isNewUser],
        v5,
        v4,
        v6))
  {
    char v7 = *(void **)(a1 + 32);
    [v7 handleConfigurationChanged:0];
  }
}

- (void)doUnlockForPasswordWithCredentialContext:(id)a3 atLogin:(BOOL)a4
{
  id v6 = a3;
  char v7 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess doUnlockForPasswordWithCredentialContext:atLogin:]();
  }

  id v8 = [(POAgentAuthenticationProcess *)self loginQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke;
  block[3] = &unk_264BBF228;
  BOOL v12 = a4;
  block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);
}

void __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userNotificationCenter];
  v12[0] = @"com.apple.PlatformSSO.passwordchanged";
  int64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v2 removePendingNotificationRequestsWithIdentifiers:v3];

  id v4 = [*(id *)(a1 + 32) userNotificationCenter];
  id v11 = @"com.apple.PlatformSSO.passwordchanged";
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  [v4 removeDeliveredNotificationsWithIdentifiers:v5];

  id v6 = [*(id *)(a1 + 32) keyBag];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke_2;
  v8[3] = &unk_264BBF228;
  char v10 = *(unsigned char *)(a1 + 48);
  char v7 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v6 waitForKeyBagUnlockWithCompletion:v8];
}

void __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) handleRemovingSSOTokens];
  }
  uint64_t v2 = *(void *)(a1 + 40);
  id v16 = 0;
  int64_t v3 = [MEMORY[0x263F5E600] passwordDataFromContext:v2 error:&v16];
  id v4 = v16;
  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) keyWrap];
    uint64_t v6 = [v5 wrapBlob:v3];
    char v7 = [*(id *)(a1 + 32) configurationManager];
    id v8 = [v7 currentUserConfiguration];
    objc_msgSend(v8, "set_credential:", v6);

    id v9 = [*(id *)(a1 + 32) configurationManager];
    LOBYTE(v6) = [v9 saveCurrentUserConfigurationAndSyncToPreboot:0];

    if ((v6 & 1) == 0) {
      id v10 = __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke_3();
    }
    [*(id *)(a1 + 32) handlePendingSSOTokensWithSharedData:v3];
    id v11 = v3;
    memset_s((void *)[v11 mutableBytes], objc_msgSend(v11, "length"), 0, objc_msgSend(v11, "length"));
  }
  else
  {
    id v12 = __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke_74();
  }
  [*(id *)(a1 + 32) performLoginForCurrentUserWithPasswordContext:*(void *)(a1 + 40) tokenId:0];
  [*(id *)(a1 + 32) handleUnfinishedTGTExchanges];
  if (([*(id *)(a1 + 32) shouldRunConfigurationChangeWhenUnlocked] & 1) != 0
    || ([*(id *)(a1 + 32) configurationManager],
        id v13 = objc_claimAutoreleasedReturnValue(),
        [v13 currentUserConfiguration],
        v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 isNewUser],
        v14,
        v13,
        v15))
  {
    [*(id *)(a1 + 32) handleConfigurationChanged:0];
  }
}

id __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke_3()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after password unlock."];
  v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke_74()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to find credential after password unlock."];
  v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)doUnlockForTokenUnlockWithCredentialContext:(id)a3 atLogin:(BOOL)a4
{
  id v6 = a3;
  char v7 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess doUnlockForTokenUnlockWithCredentialContext:atLogin:]();
  }

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__POAgentAuthenticationProcess_doUnlockForTokenUnlockWithCredentialContext_atLogin___block_invoke;
  v9[3] = &unk_264BBF1D8;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  BOOL v12 = a4;
  [(POAgentAuthenticationProcess *)self waitForScreenUnlockithCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __84__POAgentAuthenticationProcess_doUnlockForTokenUnlockWithCredentialContext_atLogin___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _doUnlockForTokenWithCredentialContext:*(void *)(a1 + 32) atLogin:*(unsigned __int8 *)(a1 + 48)];
}

- (void)doUnlockForTokenLoginWithCredentialContext:(id)a3 atLogin:(BOOL)a4
{
  id v6 = a3;
  char v7 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess doUnlockForTokenLoginWithCredentialContext:atLogin:]();
  }

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__POAgentAuthenticationProcess_doUnlockForTokenLoginWithCredentialContext_atLogin___block_invoke;
  v9[3] = &unk_264BBF1D8;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  BOOL v12 = a4;
  [(POAgentAuthenticationProcess *)self waitForShieldLoweredWithCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __83__POAgentAuthenticationProcess_doUnlockForTokenLoginWithCredentialContext_atLogin___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _doUnlockForTokenWithCredentialContext:*(void *)(a1 + 32) atLogin:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_doUnlockForTokenWithCredentialContext:(id)a3 atLogin:(BOOL)a4
{
  id v6 = a3;
  char v7 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess _doUnlockForTokenWithCredentialContext:atLogin:]();
  }

  id v8 = [(POAgentAuthenticationProcess *)self loginQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke;
  block[3] = &unk_264BBF228;
  BOOL v12 = a4;
  block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);
}

void __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) userNotificationCenter];
  v12[0] = @"com.apple.PlatformSSO.passwordchanged";
  int64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v2 removePendingNotificationRequestsWithIdentifiers:v3];

  id v4 = [*(id *)(a1 + 32) userNotificationCenter];
  id v11 = @"com.apple.PlatformSSO.passwordchanged";
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  [v4 removeDeliveredNotificationsWithIdentifiers:v5];

  id v6 = [*(id *)(a1 + 32) keyBag];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_2;
  v8[3] = &unk_264BBF228;
  char v10 = *(unsigned char *)(a1 + 48);
  char v7 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v6 waitForKeyBagUnlockWithCompletion:v8];
}

void __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) handleRemovingSSOTokens];
  }
  uint64_t v2 = *(void *)(a1 + 40);
  id v18 = 0;
  int64_t v3 = [MEMORY[0x263F5E600] passwordDataFromContext:v2 error:&v18];
  id v4 = v18;
  if (!v3) {
    id v5 = __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_3();
  }
  id v6 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_2_cold_1();
  }

  char v7 = [[POAgentProcess alloc] initWithAuthenticationProcess:*(void *)(a1 + 32)];
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  id v9 = NSUserName();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_86;
  v14[3] = &unk_264BBF250;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  v14[4] = v10;
  id v15 = v3;
  id v16 = v11;
  dispatch_semaphore_t v17 = v8;
  BOOL v12 = v8;
  id v13 = v3;
  [(POAgentProcess *)v7 updateLocalAccountPassword:v9 passwordContext:v11 completion:v14];

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

id __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_3()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to find credential after token unlock."];
  v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

intptr_t __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_86(uint64_t a1, uint64_t a2)
{
  id v4 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_86_cold_1(a2, v4);
  }

  [*(id *)(a1 + 32) handlePendingSSOTokensWithSharedData:*(void *)(a1 + 40)];
  memset_s((void *)[*(id *)(a1 + 40) mutableBytes], objc_msgSend(*(id *)(a1 + 40), "length"), 0, objc_msgSend(*(id *)(a1 + 40), "length"));
  [*(id *)(a1 + 32) performLoginForCurrentUserWithPasswordContext:*(void *)(a1 + 48) tokenId:0];
  [*(id *)(a1 + 32) handleUnfinishedTGTExchanges];
  if (([*(id *)(a1 + 32) shouldRunConfigurationChangeWhenUnlocked] & 1) != 0
    || ([*(id *)(a1 + 32) configurationManager],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 currentUserConfiguration],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isNewUser],
        v6,
        v5,
        v7))
  {
    [*(id *)(a1 + 32) handleConfigurationChanged:0];
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)doUnlockWithEmptyCredentialContext:(id)a3 atLogin:(BOOL)a4
{
  id v6 = a3;
  int v7 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess doUnlockWithEmptyCredentialContext:atLogin:]();
  }

  dispatch_semaphore_t v8 = [(POAgentAuthenticationProcess *)self loginQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__POAgentAuthenticationProcess_doUnlockWithEmptyCredentialContext_atLogin___block_invoke;
  block[3] = &unk_264BBF228;
  BOOL v12 = a4;
  block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);
}

void __75__POAgentAuthenticationProcess_doUnlockWithEmptyCredentialContext_atLogin___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) keyBag];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __75__POAgentAuthenticationProcess_doUnlockWithEmptyCredentialContext_atLogin___block_invoke_2;
  v4[3] = &unk_264BBF228;
  char v6 = *(unsigned char *)(a1 + 48);
  int64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 waitForKeyBagUnlockWithCompletion:v4];
}

void __75__POAgentAuthenticationProcess_doUnlockWithEmptyCredentialContext_atLogin___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) handleRemovingSSOTokens];
  }
  [*(id *)(a1 + 32) performLoginForCurrentUserWithPasswordContext:*(void *)(a1 + 40) tokenId:0];
  [*(id *)(a1 + 32) handleUnfinishedTGTExchanges];
  if (([*(id *)(a1 + 32) shouldRunConfigurationChangeWhenUnlocked] & 1) != 0
    || ([*(id *)(a1 + 32) configurationManager],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [v2 currentUserConfiguration],
        int64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isNewUser],
        v3,
        v2,
        v4))
  {
    id v5 = *(void **)(a1 + 32);
    [v5 handleConfigurationChanged:0];
  }
}

- (void)handleAgentStartup
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

void __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke(uint64_t a1)
{
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_2;
  activity_block[3] = &unk_264BBF278;
  activity_block[4] = *(void *)(a1 + 32);
  _os_activity_initiate(&dword_230E51000, "PSSOAgentStartup", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_2(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_3;
  v10[3] = &unk_264BBECF8;
  objc_copyWeak(&v11, &location);
  uint64_t v2 = [*(id *)(a1 + 32) keyBag];
  [v2 setLockHandler:v10];

  uint64_t v3 = [*(id *)(a1 + 32) notificationCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel_configurationChanged_ name:*MEMORY[0x263F25278] object:0];

  uint64_t v4 = [NSNumber numberWithUnsignedInt:getuid()];
  uint64_t v5 = [v4 stringValue];

  char v6 = [*(id *)(a1 + 32) distributedNotificationCenter];
  [v6 addObserver:*(void *)(a1 + 32) selector:sel_handleScreenUnlock name:@"com.apple.screenIsUnlocked" object:v5];

  int v7 = [*(id *)(a1 + 32) distributedNotificationCenter];
  [v7 addObserver:*(void *)(a1 + 32) selector:sel_handleScreenLock name:@"com.apple.screenIsLocked" object:v5];

  [*(id *)(a1 + 32) checkIfPlatformSSOIsActive];
  dispatch_semaphore_t v8 = [*(id *)(a1 + 32) keyBag];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_4;
  v9[3] = &unk_264BBF278;
  void v9[4] = *(void *)(a1 + 32);
  [v8 waitForKeyBagFirstUnlockOnStartupWithCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setEnableNetworkChanges:0];
}

void __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) loginQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_5;
  block[3] = &unk_264BBF278;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_5_cold_1();
  }

  [*(id *)(a1 + 32) handleConfigurationChanged:0 startup:1];
  int v3 = [*(id *)(a1 + 32) platformSSOActive];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v4 configurationManager];
    char v6 = [v5 currentDeviceConfiguration];
    if ([v6 supportsTokenUnlock])
    {
      int v7 = [*(id *)(a1 + 32) configurationManager];
      dispatch_semaphore_t v8 = [v7 currentUserConfiguration];
      uint64_t v9 = [v8 loginType];

      if (v9 != 1)
      {
LABEL_8:
        [*(id *)(a1 + 32) setupTimerForAuthentication];
        return;
      }
      uint64_t v5 = [*(id *)(a1 + 32) tokenHelper];
      char v6 = NSUserName();
      [v5 insertTokenForUser:v6];
    }

    goto LABEL_8;
  }
  uint64_t v10 = [v4 userNotificationCenter];
  [v10 removeAllDeliveredNotifications];

  id v11 = [*(id *)(a1 + 32) userNotificationCenter];
  [v11 removeAllPendingNotificationRequests];
}

- (void)handleNetworkChange
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

void __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_cold_1();
  }

  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_102;
  activity_block[3] = &unk_264BBF278;
  activity_block[4] = *(void *)(a1 + 32);
  _os_activity_initiate(&dword_230E51000, "PSSONetworkChange", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_102(uint64_t a1)
{
  if (([*(id *)(a1 + 32) enableNetworkChanges] & 1) == 0)
  {
    uint64_t v5 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_102_cold_3();
    }
    goto LABEL_14;
  }
  if (([*(id *)(a1 + 32) platformSSOActive] & 1) == 0)
  {
    uint64_t v5 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_102_cold_2();
    }
    goto LABEL_14;
  }
  if (([*(id *)(a1 + 32) platformSSOAccount] & 1) == 0)
  {
    uint64_t v5 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_102_cold_1();
    }
LABEL_14:

    return;
  }
  uint64_t v2 = [*(id *)(a1 + 32) keyBag];
  int v3 = [v2 isUserKeybagUnlocked];

  if (v3)
  {
    [*(id *)(a1 + 32) performLoginForCurrentUserWithPasswordContext:0];
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 handleUnfinishedTGTExchanges];
  }
}

- (void)waitForShieldLoweredWithCompletion:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  uint64_t v4 = [(POAgentAuthenticationProcess *)self shieldLoweredLock];
  objc_sync_enter(v4);
  if ([(POAgentAuthenticationProcess *)self shieldLowered]) {
    v5[2](v5);
  }
  else {
    [(POAgentAuthenticationProcess *)self set__shieldLoweredHandler:v5];
  }
  objc_sync_exit(v4);
}

- (void)handleScreenUnlock
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)handleScreenLock
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)waitForScreenUnlockithCompletion:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  uint64_t v4 = [(POAgentAuthenticationProcess *)self screenUnlockLock];
  objc_sync_enter(v4);
  if ([(POAgentAuthenticationProcess *)self screenUnlocked]) {
    v5[2](v5);
  }
  else {
    [(POAgentAuthenticationProcess *)self set__screenUnlockHandler:v5];
  }
  objc_sync_exit(v4);
}

- (BOOL)performLoginForCurrentUserWithPasswordContext:(id)a3
{
  return [(POAgentAuthenticationProcess *)self performLoginForCurrentUserWithPasswordContext:a3 tokenId:0];
}

- (BOOL)performLoginForCurrentUserWithPasswordContext:(id)a3 tokenId:(id)a4
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess performLoginForCurrentUserWithPasswordContext:tokenId:]();
  }

  uint64_t v9 = self;
  objc_sync_enter(v9);
  if (![(POAgentAuthenticationProcess *)v9 platformSSOActive])
  {
    id v11 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_102_cold_2();
    }
    goto LABEL_20;
  }
  BOOL v10 = [(POAgentAuthenticationProcess *)v9 platformSSOAccount];
  id v11 = PO_LOG_POAgentAuthenticationProcess();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (!v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E51000, v11, OS_LOG_TYPE_INFO, "not a PlatformSSO account", buf, 2u);
    }
    goto LABEL_20;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230E51000, v11, OS_LOG_TYPE_INFO, "Checking Login for user", buf, 2u);
  }

  id v13 = [(POAgentAuthenticationProcess *)v9 configurationManager];
  id v11 = [v13 currentUserConfiguration];

  if (v11)
  {
    v14 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSObject state](v11, "state"));
      *(_DWORD *)buf = 136315650;
      v83 = "-[POAgentAuthenticationProcess performLoginForCurrentUserWithPasswordContext:tokenId:]";
      __int16 v84 = 2114;
      v85 = v15;
      __int16 v86 = 2112;
      v87 = v9;
      _os_log_impl(&dword_230E51000, v14, OS_LOG_TYPE_DEFAULT, "%s user state = %{public}@ on %@", buf, 0x20u);
    }
    if ([v11 state] == 2 || [v11 state] == 5)
    {
      id v16 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v16, OS_LOG_TYPE_INFO, "User state is needs registration or key is invalid", buf, 2u);
      }

      goto LABEL_20;
    }
    uint64_t v20 = [v11 state];
    if (v20 == 1)
    {
      id v21 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v21, OS_LOG_TYPE_INFO, "User state is needs authentication", buf, 2u);
      }
    }
    id v22 = [v11 lastLoginDate];
    if (v22)
    {
      v23 = [v11 lastLoginDate];
      [v23 timeIntervalSinceNow];
      double v25 = v24;
      BOOL v26 = [(POAgentAuthenticationProcess *)v9 configurationManager];
      v27 = [v26 currentDeviceConfiguration];
      uint64_t v28 = [v27 loginFrequency];
      BOOL v70 = v25 < (double)-(int)[v28 intValue];
    }
    else
    {
      BOOL v70 = 1;
    }

    if (v20 != 1 && v70)
    {
      id v29 = PO_LOG_POAgentAuthenticationProcess();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
LABEL_33:

        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      id v30 = "Time for user authentication";
    }
    else
    {
      if (v20 == 1)
      {
LABEL_38:
        id v35 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_230E51000, v35, OS_LOG_TYPE_INFO, "Attempting authentication", buf, 2u);
        }

        v36 = [(POAgentAuthenticationProcess *)v9 authenticationProcess];
        int v37 = [v36 waitForConnectivity];

        if (v37) {
          double v38 = 180.0;
        }
        else {
          double v38 = 2.0;
        }
        v39 = [(POAgentAuthenticationProcess *)v9 lastAuthenticationAttempt];
        if (v39)
        {
          v40 = [(POAgentAuthenticationProcess *)v9 lastAuthenticationAttempt];
          [v40 timeIntervalSinceNow];
          BOOL v42 = v41 > -v38;

          if (v42)
          {
            v43 = PO_LOG_POAgentAuthenticationProcess();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
              -[POAgentAuthenticationProcess performLoginForCurrentUserWithPasswordContext:tokenId:]();
            }

            goto LABEL_20;
          }
        }
        v44 = [(POAgentAuthenticationProcess *)v9 configurationManager];
        v45 = [v44 currentLoginConfiguration];

        if (!v45)
        {
          id v53 = __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke_106();
          BOOL v18 = 0;
LABEL_66:

          goto LABEL_21;
        }
        v46 = [(POAgentAuthenticationProcess *)v9 configurationManager];
        v47 = [v46 currentDeviceConfiguration];

        if (v47)
        {
          if ([v47 registrationCompleted])
          {
            if (v70) {
              goto LABEL_63;
            }
            if ([v11 loginType] == 2) {
              goto LABEL_63;
            }
            v48 = [v45 refreshEndpointURL];
            if (!v48) {
              goto LABEL_63;
            }
            v49 = [(POAgentAuthenticationProcess *)v9 configurationManager];
            v50 = [v49 currentRefreshToken];
            BOOL v51 = v50 == 0;

            if (v51) {
LABEL_63:
            }
              BOOL v52 = [(POAgentAuthenticationProcess *)v9 _doLoginWithPasswordContext:v6 tokenId:v7];
            else {
              BOOL v52 = [(POAgentAuthenticationProcess *)v9 _doRefreshWithPasswordContext:v6 tokenId:v7];
            }
            BOOL v18 = v52;
            goto LABEL_65;
          }
          id v55 = __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke_114();
        }
        else
        {
          id v54 = __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke_110();
        }
        BOOL v18 = 0;
LABEL_65:

        goto LABEL_66;
      }
      char v31 = [(POAgentAuthenticationProcess *)v9 configurationManager];
      uint64_t v32 = [v31 tokenReceived];
      [v32 timeIntervalSinceNow];
      BOOL v34 = v33 < -14400.0;

      if (v34)
      {
        id v29 = PO_LOG_POAgentAuthenticationProcess();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
          goto LABEL_33;
        }
        *(_WORD *)buf = 0;
        id v30 = "Tokens issued more than 4 hours ago";
      }
      else
      {
        v56 = [(POAgentAuthenticationProcess *)v9 configurationManager];
        v57 = [v56 tokenExpiration];
        [v57 timeIntervalSinceNow];
        BOOL v59 = v58 < 600.0;

        if (!v59)
        {
          long long v74 = 0u;
          long long v75 = 0u;
          long long v73 = 0u;
          long long v72 = 0u;
          v60 = [v11 kerberosStatus];
          uint64_t v61 = [v60 countByEnumeratingWithState:&v72 objects:v81 count:16];
          obj = v60;
          if (v61)
          {
            uint64_t v62 = *(void *)v73;
            while (2)
            {
              for (uint64_t i = 0; i != v61; ++i)
              {
                if (*(void *)v73 != v62) {
                  objc_enumerationMutation(obj);
                }
                v64 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                if ([v64 importSuccessful])
                {
                  if (([v64 exchangeRequired] & 1) == 0)
                  {
                    v65 = [(POAgentAuthenticationProcess *)v9 kerberosHelper];
                    v66 = [v64 cacheName];
                    char v67 = [v65 checkForValidKerberosTGT:v66];

                    if ((v67 & 1) == 0)
                    {
                      v69 = PO_LOG_POAgentAuthenticationProcess();
                      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_230E51000, v69, OS_LOG_TYPE_INFO, "Kerberos cache not valid", buf, 2u);
                      }

                      id v29 = obj;
                      goto LABEL_33;
                    }
                  }
                }
              }
              uint64_t v61 = [obj countByEnumeratingWithState:&v72 objects:v81 count:16];
              if (v61) {
                continue;
              }
              break;
            }
          }

          v68 = PO_LOG_POAgentAuthenticationProcess();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_230E51000, v68, OS_LOG_TYPE_INFO, "User does not need authentication", buf, 2u);
          }

          [(POAgentAuthenticationProcess *)v9 handleKeyUpdatesWithPasswordContext:v6];
          goto LABEL_20;
        }
        id v29 = PO_LOG_POAgentAuthenticationProcess();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
          goto LABEL_33;
        }
        *(_WORD *)buf = 0;
        id v30 = "Tokens expire soon";
      }
    }
    _os_log_impl(&dword_230E51000, v29, OS_LOG_TYPE_INFO, v30, buf, 2u);
    goto LABEL_33;
  }
  uint64_t v76 = MEMORY[0x263EF8330];
  uint64_t v77 = 3221225472;
  v78 = __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke;
  v79 = &unk_264BBECA8;
  v80 = v9;
  id v17 = __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke();
LABEL_20:
  BOOL v18 = 0;
LABEL_21:

  objc_sync_exit(v9);
  return v18;
}

id __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No user configuration for user for login."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke_106()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No login configuration for user for login."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke_110()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No device configuration for user for login."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke_114()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"Registration is not complete for user for login."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)_doRefreshWithPasswordContext:(id)a3 tokenId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess _doRefreshWithPasswordContext:tokenId:]();
  }

  uint64_t v9 = [(POAgentAuthenticationProcess *)self configurationManager];
  BOOL v10 = [v9 currentUserConfiguration];

  if (v10)
  {
    id v11 = [(POAgentAuthenticationProcess *)self configurationManager];
    BOOL v12 = [v11 currentDeviceConfiguration];

    if (v12)
    {
      id v13 = [(POAgentAuthenticationProcess *)self configurationManager];
      v14 = [v13 currentLoginConfiguration];

      BOOL v15 = v14 != 0;
      if (v14)
      {
        double v41 = v6;
        [(POAgentAuthenticationProcess *)self notifyKerberosDelegateTGTDidBegin];
        id v16 = [MEMORY[0x263EFF910] date];
        [(POAgentAuthenticationProcess *)self setLastAuthenticationAttempt:v16];

        id v17 = PO_LOG_POAgentAuthenticationProcess();
        os_signpost_id_t v18 = os_signpost_id_generate(v17);

        v19 = PO_LOG_POAgentAuthenticationProcess();
        uint64_t v20 = v19;
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_230E51000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PlatformSSO_RefreshAuth", " enableTelemetry=YES ", buf, 2u);
        }

        id v21 = [v10 userLoginConfiguration];
        uint64_t v22 = [v14 mergedConfigurationWithUserLoginConfiguration:v21];

        v23 = [v10 userLoginConfiguration];
        double v24 = [v23 loginUserName];
        double v25 = v24;
        os_signpost_id_t v42 = v18;
        if (v24)
        {
          id v26 = v24;
        }
        else
        {
          id v26 = [(POAgentAuthenticationProcess *)self userName];
        }
        id v30 = v26;
        v39 = v26;

        char v31 = [(POAgentAuthenticationProcess *)self authenticationProcess];
        v40 = (void *)v22;
        uint64_t v32 = [v31 createAuthenticationContextUsingLoginConfiguration:v22 deviceConfiguration:v12 userName:v30];

        double v33 = [(POAgentAuthenticationProcess *)self jwksStorageProvider];
        [v32 setJwksStorageProvider:v33];

        BOOL v34 = [(POAgentAuthenticationProcess *)self configurationManager];
        id v35 = [v34 currentRefreshToken];
        [v32 setRefreshToken:v35];

        v36 = [(POAgentAuthenticationProcess *)self authenticationProcess];
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke_136;
        v43[3] = &unk_264BBF2A0;
        id v6 = v41;
        os_signpost_id_t v47 = v42;
        v43[4] = self;
        id v44 = v32;
        id v45 = v41;
        id v46 = v7;
        id v37 = v32;
        [v36 performTokenRefreshUsingContext:v37 completion:v43];
      }
      else
      {
        id v29 = __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke_129();
      }
    }
    else
    {
      id v28 = __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke_123();
      BOOL v15 = 0;
    }
  }
  else
  {
    id v27 = __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke();
    BOOL v15 = 0;
  }

  return v15;
}

id __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No user configuration for refresh."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke_123()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No device configuration for refresh."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke_129()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No login configuration for refresh."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

void __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke_136(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  switch(a2)
  {
    case 0:
    case 3:
    case 6:
      uint64_t v9 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v9;
      os_signpost_id_t v11 = *(void *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
        goto LABEL_18;
      }
      LOWORD(v18) = 0;
      BOOL v12 = "Failed";
      id v13 = (uint8_t *)&v18;
      break;
    case 1:
      v14 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v14;
      os_signpost_id_t v11 = *(void *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v14)) {
        goto LABEL_18;
      }
      __int16 v22 = 0;
      BOOL v12 = "Success";
      id v13 = (uint8_t *)&v22;
      break;
    case 2:
      id v17 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v17;
      os_signpost_id_t v11 = *(void *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v17)) {
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      BOOL v12 = "PermanentFailure";
      id v13 = buf;
      break;
    case 4:
      BOOL v15 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v15;
      os_signpost_id_t v11 = *(void *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v15)) {
        goto LABEL_18;
      }
      __int16 v21 = 0;
      BOOL v12 = "CredentialFailure";
      id v13 = (uint8_t *)&v21;
      break;
    case 5:
      id v16 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v16;
      os_signpost_id_t v11 = *(void *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16)) {
        goto LABEL_18;
      }
      __int16 v19 = 0;
      BOOL v12 = "Unavailable";
      id v13 = (uint8_t *)&v19;
      break;
    default:
      goto LABEL_19;
  }
  _os_signpost_emit_with_name_impl(&dword_230E51000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_RefreshAuth", v12, v13, 2u);
LABEL_18:

LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "_handleLoginResult:authenticationContext:tokens:passwordContext:tokenId:tokenHash:", a2, *(void *)(a1 + 40), v8, *(void *)(a1 + 48), *(void *)(a1 + 56), 0, v18);
}

- (BOOL)_doLoginWithPasswordContext:(id)a3 tokenId:(id)a4
{
  uint64_t v229 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:].cold.8();
  }

  uint64_t v9 = [(POAgentAuthenticationProcess *)self configurationManager];
  BOOL v10 = [v9 currentUserConfiguration];

  if (v10)
  {
    os_signpost_id_t v11 = [(POAgentAuthenticationProcess *)self configurationManager];
    v178 = [v11 currentDeviceConfiguration];

    if (!v178)
    {
      uint64_t v215 = MEMORY[0x263EF8330];
      uint64_t v216 = 3221225472;
      v217 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_141;
      v218 = &unk_264BBECA8;
      v219 = self;
      id v33 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_141();
      LOBYTE(v32) = 0;
LABEL_45:

      goto LABEL_46;
    }
    BOOL v12 = [(POAgentAuthenticationProcess *)self configurationManager];
    v177 = [v12 currentLoginConfiguration];

    if (!v177)
    {
      uint64_t v210 = MEMORY[0x263EF8330];
      uint64_t v211 = 3221225472;
      v212 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_145;
      v213 = &unk_264BBECA8;
      v214 = self;
      id v34 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_145();
      goto LABEL_21;
    }
    id v13 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "loginType"));
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v226 = self;
      _os_log_impl(&dword_230E51000, v13, OS_LOG_TYPE_DEFAULT, "%s loginType = %{public}@ on %@", buf, 0x20u);
    }
    if ([v10 loginType] == 1)
    {
      BOOL v15 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v15, OS_LOG_TYPE_INFO, "Password authentication", buf, 2u);
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v226 = (POAgentAuthenticationProcess *)__Block_byref_object_copy__2;
      v227 = __Block_byref_object_dispose__2;
      id v228 = [MEMORY[0x263F5E600] passwordDataFromContext:v6 error:0];
      if (*(void *)(*(void *)&buf[8] + 40)) {
        goto LABEL_13;
      }
      id v16 = [(POAgentAuthenticationProcess *)self keyWrap];
      id v17 = [v10 _credential];
      uint64_t v18 = [v16 unwrapBlob:v17];
      __int16 v19 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v18;

      if (*(void *)(*(void *)&buf[8] + 40))
      {
LABEL_13:
        [(POAgentAuthenticationProcess *)self notifyKerberosDelegateTGTDidBegin];
        uint64_t v20 = [MEMORY[0x263EFF910] date];
        [(POAgentAuthenticationProcess *)self setLastAuthenticationAttempt:v20];

        __int16 v21 = PO_LOG_POAgentAuthenticationProcess();
        os_signpost_id_t v22 = os_signpost_id_generate(v21);

        v23 = PO_LOG_POAgentAuthenticationProcess();
        double v24 = v23;
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
        {
          *(_WORD *)v185 = 0;
          _os_signpost_emit_with_name_impl(&dword_230E51000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PlatformSSO_PasswordAuth", " enableTelemetry=YES ", v185, 2u);
        }

        double v25 = [v10 userLoginConfiguration];
        id v26 = [v177 mergedConfigurationWithUserLoginConfiguration:v25];

        id v27 = [v10 userLoginConfiguration];
        id v28 = [v27 loginUserName];
        id v29 = v28;
        if (v28)
        {
          id v30 = v28;
        }
        else
        {
          id v30 = [(POAgentAuthenticationProcess *)self userName];
        }
        v49 = v30;

        v50 = [(POAgentAuthenticationProcess *)self authenticationProcess];
        BOOL v51 = [v50 createAuthenticationContextUsingLoginConfiguration:v26 deviceConfiguration:v178 userName:v49];

        [v51 setPassword:*(void *)(*(void *)&buf[8] + 40)];
        BOOL v52 = [(POAgentAuthenticationProcess *)self jwksStorageProvider];
        [v51 setJwksStorageProvider:v52];

        id v53 = [(POAgentAuthenticationProcess *)self configurationManager];
        id v54 = [v53 currentRefreshToken];
        [v51 setRefreshToken:v54];

        id v55 = [(POAgentAuthenticationProcess *)self authenticationProcess];
        v200[0] = MEMORY[0x263EF8330];
        v200[1] = 3221225472;
        v200[2] = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_153;
        v200[3] = &unk_264BBF2C8;
        v203 = buf;
        os_signpost_id_t v204 = v22;
        v200[4] = self;
        id v201 = v6;
        id v202 = v7;
        [v55 performPasswordLoginUsingContext:v51 completion:v200];

        _Block_object_dispose(buf, 8);
        goto LABEL_43;
      }
      uint64_t v205 = MEMORY[0x263EF8330];
      uint64_t v206 = 3221225472;
      v207 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_149;
      v208 = &unk_264BBECA8;
      v209 = self;
      id v65 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_149();
      [(POAgentAuthenticationProcess *)self handleUserNeedsReauthenticationAfterDelay:1.0];
      _Block_object_dispose(buf, 8);

LABEL_21:
      LOBYTE(v32) = 0;
LABEL_44:

      goto LABEL_45;
    }
    if ([v10 loginType] == 2)
    {
      [(POAgentAuthenticationProcess *)self notifyKerberosDelegateTGTDidBegin];
      CFDictionaryRef v171 = SecKeyCopyAttributes((SecKeyRef)[v10 sepKey]);
      v173 = [(__CFDictionary *)v171 objectForKeyedSubscript:*MEMORY[0x263F16E70]];

      if (!v173 || !objc_msgSend(MEMORY[0x263F5E650], "checkIfBiometricConstraintsForSigning:"))
      {
        id v175 = 0;
LABEL_34:
        double v38 = [MEMORY[0x263EFF910] date];
        [(POAgentAuthenticationProcess *)self setLastAuthenticationAttempt:v38];

        v39 = PO_LOG_POAgentAuthenticationProcess();
        os_signpost_id_t v40 = os_signpost_id_generate(v39);

        double v41 = PO_LOG_POAgentAuthenticationProcess();
        os_signpost_id_t v42 = v41;
        if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_230E51000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "PlatformSSO_UserSEPKeyAuth", " enableTelemetry=YES ", buf, 2u);
        }

        v43 = [v10 userLoginConfiguration];
        id v44 = [v177 mergedConfigurationWithUserLoginConfiguration:v43];

        id v45 = [v10 userLoginConfiguration];
        id v46 = [v45 loginUserName];
        os_signpost_id_t v47 = v46;
        if (v46)
        {
          id v48 = v46;
        }
        else
        {
          id v48 = [(POAgentAuthenticationProcess *)self userName];
        }
        v56 = v48;

        v57 = [(POAgentAuthenticationProcess *)self authenticationProcess];
        double v58 = [v57 createAuthenticationContextUsingLoginConfiguration:v44 deviceConfiguration:v178 userName:v56];

        BOOL v59 = [(POAgentAuthenticationProcess *)self jwksStorageProvider];
        [v58 setJwksStorageProvider:v59];

        v60 = [(POAgentAuthenticationProcess *)self configurationManager];
        uint64_t v61 = [v60 currentRefreshToken];
        [v58 setRefreshToken:v61];

        objc_msgSend(v58, "setEmbeddedAssertionSigningKey:", objc_msgSend(v10, "sepKeyWithContext:", v175));
        objc_msgSend(v58, "setEmbeddedAssertionCertificate:", objc_msgSend(v10, "sepKeyCertificate"));
        uint64_t v62 = [v10 signingAlgorithm];
        [v58 setUserSepSigningAlgorithm:v62];

        v63 = [(POAgentAuthenticationProcess *)self authenticationProcess];
        v190[0] = MEMORY[0x263EF8330];
        v190[1] = 3221225472;
        v190[2] = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_199;
        v190[3] = &unk_264BBF338;
        os_signpost_id_t v193 = v40;
        v190[4] = self;
        id v191 = v6;
        id v192 = v7;
        [v63 performSEPKeyLoginUsingContext:v58 completion:v190];

        goto LABEL_43;
      }
      char v35 = [v177 userSEPKeyBiometricPolicy];
      if (v6 && (v35 & 4) != 0)
      {
        v36 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:]();
        }

        id v175 = v6;
        goto LABEL_34;
      }
      id v175 = objc_alloc_init(MEMORY[0x263F10468]);
      uint64_t v77 = [v178 accountDisplayName];
      BOOL v78 = [v77 length] == 0;

      if (v78)
      {
        v95 = [v177 accountDisplayName];
        BOOL v96 = [v95 length] == 0;

        v97 = NSString;
        v98 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v99 = [v98 localizedStringForKey:@"SMARTCARD_LOGIN_REASON_TEXT" value:&stru_26E5C8990 table:0];
        if (v96)
        {
          v136 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v137 = [v136 localizedStringForKey:@"IDENTITY_PROVIDER_TEXT" value:&stru_26E5C8990 table:0];
          v138 = objc_msgSend(v97, "localizedStringWithFormat:", v99, v137);
          [v175 setLocalizedReason:v138];

          v169 = 0;
        }
        else
        {
          v100 = [v177 accountDisplayName];
          v101 = objc_msgSend(v97, "localizedStringWithFormat:", v99, v100);
          [v175 setLocalizedReason:v101];

          v169 = [v177 accountDisplayName];
        }
      }
      else
      {
        v79 = NSString;
        v80 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v81 = [v80 localizedStringForKey:@"SMARTCARD_LOGIN_REASON_TEXT" value:&stru_26E5C8990 table:0];
        v82 = [v178 accountDisplayName];
        v83 = objc_msgSend(v79, "localizedStringWithFormat:", v81, v82);
        [v175 setLocalizedReason:v83];

        v169 = [v178 accountDisplayName];
      }
      v139 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v140 = [v139 localizedStringForKey:@"DEFAULT_LOGIN_PROMPT_NAME" value:&stru_26E5C8990 table:0];
      [v175 setOptionCallerName:v140];

      v141 = (void *)MEMORY[0x263F086E0];
      v142 = [v178 extensionIdentifier];
      v143 = [v141 bundleWithIdentifier:v142];
      v144 = [v143 bundlePath];
      [v175 setOptionCallerIconPath:v144];

      [v175 setInteractionNotAllowed:0];
      if (([v177 userSEPKeyBiometricPolicy] & 8) != 0)
      {
        if (!v169 || (unint64_t)[v169 length] >= 0x13)
        {
          v145 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v146 = [v145 localizedStringForKey:@"IDENTITY_PROVIDER_TEXT" value:&stru_26E5C8990 table:0];

          v169 = (void *)v146;
        }
        v147 = NSString;
        v148 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v149 = [v148 localizedStringForKey:@"CUSTOM_FALLBACK_BUTTON_TEXT" value:&stru_26E5C8990 table:0];
        v150 = objc_msgSend(v147, "localizedStringWithFormat:", v149, v169);
        [v175 setLocalizedFallbackTitle:v150];

        [v175 setOptionFallbackVisible:MEMORY[0x263EFFA88]];
      }
      v151 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v226 = (POAgentAuthenticationProcess *)__Block_byref_object_copy__2;
      v227 = __Block_byref_object_dispose__2;
      id v228 = 0;
      LODWORD(v32) = 10;
      v152 = (void *)0x263F08000;
      while (1)
      {
        uint64_t v153 = *(void *)&buf[8];
        id obj = *(id *)(*(void *)&buf[8] + 40);
        v154 = [v175 evaluateAccessControl:v173 operation:3 options:MEMORY[0x263EFFA78] error:&obj];
        objc_storeStrong((id *)(v153 + 40), obj);

        if ([*(id *)(*(void *)&buf[8] + 40) code] == -1004)
        {
          v155 = PO_LOG_POAgentAuthenticationProcess();
          if (os_log_type_enabled(v155, OS_LOG_TYPE_DEBUG)) {
            -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:].cold.5(v185, &v185[1]);
          }

          [MEMORY[0x263F08B88] sleepForTimeInterval:2.0];
        }
        if ([*(id *)(*(void *)&buf[8] + 40) code] != -4) {
          break;
        }
        v156 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v156, OS_LOG_TYPE_DEBUG)) {
          -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:](v198, &v198[1]);
        }

        [MEMORY[0x263F08B88] sleepForTimeInterval:5.0];
        v151 = v154;
        LODWORD(v32) = v32 - 1;
        if (!v32) {
          goto LABEL_116;
        }
      }
      uint64_t v32 = *(void *)(*(void *)&buf[8] + 40);
      v157 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v158 = os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG);
      if (v32)
      {
        if (v158) {
          -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:].cold.4();
        }
      }
      else if (v158)
      {
        -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:]();
      }

LABEL_116:
      if (!v154)
      {
        v197[0] = MEMORY[0x263EF8330];
        v197[1] = 3221225472;
        v197[2] = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_174;
        v197[3] = &unk_264BBEE80;
        v197[4] = buf;
        id v159 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_174((uint64_t)v197);
        uint64_t v160 = [v177 userSEPKeyBiometricPolicy];
        uint64_t v161 = [*(id *)(*(void *)&buf[8] + 40) code];
        unint64_t v162 = v160 & 8;
        if (v161 == -1)
        {
          uint64_t v160 = [*(id *)(*(void *)&buf[8] + 40) userInfo];
          v152 = [(id)v160 objectForKeyedSubscript:@"Subcode"];
          if ([v152 intValue] == 6)
          {

LABEL_122:
            v164 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v165 = [v164 localizedStringForKey:@"BIOMETRIC_CHANGED_TEXT" value:&stru_26E5C8990 table:0];

            v166 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v167 = [v166 localizedStringForKey:@"DEFAULT_REGISTRATION_REQUIRED_TEXT" value:&stru_26E5C8990 table:0];

            v194[0] = MEMORY[0x263EF8330];
            v194[1] = 3221225472;
            v194[2] = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_187;
            v194[3] = &unk_264BBF310;
            char v196 = v162 >> 3;
            v194[4] = self;
            id v195 = v10;
            [(POAgentAuthenticationProcess *)self showAlertMessage:v165 messageText:v167 completion:v194];

LABEL_125:
            LOBYTE(v32) = 0;
            goto LABEL_127;
          }
        }
        uint64_t v163 = [*(id *)(*(void *)&buf[8] + 40) code];
        if (v161 == -1)
        {
          BOOL v168 = v163 == -7;

          if (v168) {
            goto LABEL_122;
          }
        }
        else if (v163 == -7)
        {
          goto LABEL_122;
        }
        if (!v162) {
          goto LABEL_125;
        }
        [(POAgentAuthenticationProcess *)self requestUserAuthenticationSyncPassword:0 completion:&__block_literal_global_198];
        LOBYTE(v32) = 1;
      }
LABEL_127:

      _Block_object_dispose(buf, 8);
      if (!v154)
      {

        goto LABEL_44;
      }
      goto LABEL_34;
    }
    if ([v10 loginType] != 3)
    {
LABEL_43:
      LOBYTE(v32) = 1;
      goto LABEL_44;
    }
    if (v7)
    {
      id v37 = v7;
    }
    else
    {
      id v37 = [v10 smartCardTokenId];
      if (!v37) {
        goto LABEL_56;
      }
    }
    v66 = [(POAgentAuthenticationProcess *)self tokenHelper];
    char v67 = [v66 waitForTokenAvailable:v37];

    if (v67)
    {
LABEL_50:
      v68 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
        -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:].cold.7();
      }

      v69 = [(POAgentAuthenticationProcess *)self tokenHelper];
      BOOL v70 = [(POAgentAuthenticationProcess *)self userName];
      v187[0] = 0;
      id v176 = [v69 findTokenIdForSmartCardBoundUser:v70 tokenHash:v187];
      id v174 = v187[0];

      if (![v176 length])
      {
        v71 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
          -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:].cold.6();
        }

        long long v72 = [(POAgentAuthenticationProcess *)self tokenHelper];
        long long v73 = [(POAgentAuthenticationProcess *)self userName];
        id v186 = v174;
        uint64_t v74 = [v72 findTokenIdForSmartCardAMUser:v73 tokenHash:&v186];
        id v75 = v186;

        id v174 = v75;
        id v176 = (id)v74;
      }
LABEL_59:
      if (v6) {
        id v172 = v6;
      }
      else {
        id v172 = objc_alloc_init(MEMORY[0x263F10468]);
      }
      v85 = [v178 accountDisplayName];
      BOOL v86 = [v85 length] == 0;

      if (v86)
      {
        v92 = [v177 accountDisplayName];
        BOOL v93 = [v92 length] == 0;

        v94 = NSString;
        uint64_t v88 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v89 = [v88 localizedStringForKey:@"SMARTCARD_LOGIN_REASON_TEXT" value:&stru_26E5C8990 table:0];
        if (v93)
        {
          v90 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v91 = [v90 localizedStringForKey:@"IDENTITY_PROVIDER_TEXT" value:&stru_26E5C8990 table:0];
          v103 = objc_msgSend(v94, "localizedStringWithFormat:", v89, v91);
          [v172 setOptionAuthenticationTitle:v103];
        }
        else
        {
          v90 = [v177 accountDisplayName];
          v91 = objc_msgSend(v94, "localizedStringWithFormat:", v89, v90);
          [v172 setOptionAuthenticationTitle:v91];
        }
      }
      else
      {
        v87 = NSString;
        uint64_t v88 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v89 = [v88 localizedStringForKey:@"SMARTCARD_LOGIN_REASON_TEXT" value:&stru_26E5C8990 table:0];
        v90 = [v178 accountDisplayName];
        v91 = objc_msgSend(v87, "localizedStringWithFormat:", v89, v90);
        [v172 setOptionAuthenticationTitle:v91];
      }

      v104 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v105 = [v104 localizedStringForKey:@"DEFAULT_LOGIN_PROMPT_NAME" value:&stru_26E5C8990 table:0];
      [v172 setOptionCallerName:v105];

      v106 = (void *)MEMORY[0x263F086E0];
      v107 = [v178 extensionIdentifier];
      v108 = [v106 bundleWithIdentifier:v107];
      v109 = [v108 bundlePath];
      [v172 setOptionCallerIconPath:v109];

      *(void *)buf = 0;
      *(void *)v185 = 0;
      v110 = [(POAgentAuthenticationProcess *)self keychainHelper];
      LOBYTE(v106) = [v110 retrieveCertAndKeyForTokenId:v176 context:v172 forSigning:1 hash:v174 certificate:v185 privateKey:buf];

      if (v106) {
        goto LABEL_77;
      }
      v121 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v198 = 0;
        _os_log_impl(&dword_230E51000, v121, OS_LOG_TYPE_INFO, "Smartcard not found.", v198, 2u);
      }

      id v184 = v174;
      unint64_t v122 = [(POAgentAuthenticationProcess *)self requestSmartCardForBinding:1 tokenId:0 tokenHash:&v184 wrapTokenHash:0];
      id v123 = v184;

      if (v122 == 1)
      {
        v124 = [(POAgentAuthenticationProcess *)self keychainHelper];
        char v125 = [v124 retrieveCertAndKeyForTokenId:v176 context:v172 forSigning:1 hash:v123 certificate:v185 privateKey:buf];

        if (v125)
        {
          id v174 = v123;
LABEL_77:
          [(POAgentAuthenticationProcess *)self notifyKerberosDelegateTGTDidBegin];
          v111 = [MEMORY[0x263EFF910] date];
          [(POAgentAuthenticationProcess *)self setLastAuthenticationAttempt:v111];

          v112 = PO_LOG_POAgentAuthenticationProcess();
          os_signpost_id_t v113 = os_signpost_id_generate(v112);

          v114 = PO_LOG_POAgentAuthenticationProcess();
          v115 = v114;
          if (v113 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v114))
          {
            *(_WORD *)v198 = 0;
            _os_signpost_emit_with_name_impl(&dword_230E51000, v115, OS_SIGNPOST_INTERVAL_BEGIN, v113, "PlatformSSO_SmartCard", " enableTelemetry=YES ", v198, 2u);
          }

          v116 = [v10 userLoginConfiguration];
          v170 = [v177 mergedConfigurationWithUserLoginConfiguration:v116];

          v117 = [v10 userLoginConfiguration];
          v118 = [v117 loginUserName];
          v119 = v118;
          if (v118)
          {
            id v120 = v118;
          }
          else
          {
            id v120 = [(POAgentAuthenticationProcess *)self userName];
          }
          v127 = v120;

          v128 = [(POAgentAuthenticationProcess *)self authenticationProcess];
          v129 = [v128 createAuthenticationContextUsingLoginConfiguration:v170 deviceConfiguration:v178 userName:v127];

          v130 = [(POAgentAuthenticationProcess *)self jwksStorageProvider];
          [v129 setJwksStorageProvider:v130];

          v131 = [(POAgentAuthenticationProcess *)self configurationManager];
          v132 = [v131 currentRefreshToken];
          [v129 setRefreshToken:v132];

          [v129 setEmbeddedAssertionSigningKey:*(void *)buf];
          [v129 setEmbeddedAssertionCertificate:*(void *)v185];
          v133 = [(POAgentAuthenticationProcess *)self authenticationProcess];
          v179[0] = MEMORY[0x263EF8330];
          v179[1] = 3221225472;
          v179[2] = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_210;
          v179[3] = &unk_264BBF2A0;
          os_signpost_id_t v183 = v113;
          v179[4] = self;
          id v180 = v6;
          id v181 = v7;
          id v182 = v174;
          id v134 = v174;
          [v133 performSmartCardLoginUsingContext:v129 completion:v179];

          goto LABEL_43;
        }
        id v135 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_204();
      }
      else
      {
        v126 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v198 = 0;
          _os_log_impl(&dword_230E51000, v126, OS_LOG_TYPE_INFO, "Smartcard dialog cancelled", v198, 2u);
        }
      }
      goto LABEL_21;
    }
LABEL_56:
    id v188 = 0;
    id v189 = v37;
    unint64_t v76 = [(POAgentAuthenticationProcess *)self requestSmartCardForBinding:1 tokenId:&v189 tokenHash:&v188 wrapTokenHash:0];
    id v176 = v189;

    id v174 = v188;
    if (v76 == 1)
    {
      id v37 = v176;
      if (v176)
      {
        if (v174) {
          goto LABEL_59;
        }
        goto LABEL_50;
      }
      v187[1] = (id)MEMORY[0x263EF8330];
      v187[2] = (id)3221225472;
      v187[3] = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_200;
      v187[4] = &unk_264BBECA8;
      v187[5] = self;
      id v102 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_200();
      id v176 = 0;
    }
    else
    {
      __int16 v84 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v84, OS_LOG_TYPE_INFO, "Smartcard dialog cancelled", buf, 2u);
      }
    }
    goto LABEL_21;
  }
  uint64_t v220 = MEMORY[0x263EF8330];
  uint64_t v221 = 3221225472;
  v222 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke;
  v223 = &unk_264BBECA8;
  v224 = self;
  id v31 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke();
  LOBYTE(v32) = 0;
LABEL_46:

  return v32 & 1;
}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No user configuration for user for password login."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_141()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No device configuration for user for password login."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_145()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No login configuration for user for password login."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_149()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No credential for user for password login."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

void __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_153(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  switch(a2)
  {
    case 0:
    case 3:
    case 6:
      os_signpost_id_t v11 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v12 = v11;
      os_signpost_id_t v13 = *(void *)(a1 + 64);
      if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v11)) {
        goto LABEL_18;
      }
      LOWORD(v20) = 0;
      v14 = "Failed";
      BOOL v15 = (uint8_t *)&v20;
      break;
    case 1:
      id v16 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v12 = v16;
      os_signpost_id_t v13 = *(void *)(a1 + 64);
      if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16)) {
        goto LABEL_18;
      }
      __int16 v24 = 0;
      v14 = "Success";
      BOOL v15 = (uint8_t *)&v24;
      break;
    case 2:
      __int16 v19 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v12 = v19;
      os_signpost_id_t v13 = *(void *)(a1 + 64);
      if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v19)) {
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      v14 = "PermanentFailure";
      BOOL v15 = buf;
      break;
    case 4:
      id v17 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v12 = v17;
      os_signpost_id_t v13 = *(void *)(a1 + 64);
      if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v17)) {
        goto LABEL_18;
      }
      __int16 v23 = 0;
      v14 = "CredentialFailure";
      BOOL v15 = (uint8_t *)&v23;
      break;
    case 5:
      uint64_t v18 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v12 = v18;
      os_signpost_id_t v13 = *(void *)(a1 + 64);
      if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v18)) {
        goto LABEL_18;
      }
      __int16 v21 = 0;
      v14 = "Unavailable";
      BOOL v15 = (uint8_t *)&v21;
      break;
    default:
      goto LABEL_19;
  }
  _os_signpost_emit_with_name_impl(&dword_230E51000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PlatformSSO_PasswordAuth", v14, v15, 2u);
LABEL_18:

LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "_handleLoginResult:authenticationContext:tokens:passwordContext:tokenId:tokenHash:", a2, v7, v8, *(void *)(a1 + 40), *(void *)(a1 + 48), 0, v20);
}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_174(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) description:@"Error evaluating context for User Secure Enclave Key authentication"];
  uint64_t v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

void __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_187(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) requestUserAuthenticationSyncPassword:0 completion:&__block_literal_global_190];
  }
  uint64_t v2 = [*(id *)(a1 + 32) configurationManager];
  uint64_t v3 = [v2 currentUserConfiguration];
  [(id)v3 setState:5];

  uint64_t v4 = [*(id *)(a1 + 32) configurationManager];
  LOBYTE(v3) = [v4 saveCurrentUserConfigurationAndSyncToPreboot:0];

  if ((v3 & 1) == 0) {
    id v5 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_3();
  }
  id v6 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) userLoginConfiguration];
  id v7 = [v8 loginUserName];
  [v6 handleUserRegistrationForUser:v7 repair:1];
}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_3()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after biometric failure."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

void __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_199(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  switch(a2)
  {
    case 0:
    case 3:
    case 6:
      uint64_t v9 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v9;
      os_signpost_id_t v11 = *(void *)(a1 + 56);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
        goto LABEL_18;
      }
      LOWORD(v18) = 0;
      BOOL v12 = "Failed";
      os_signpost_id_t v13 = (uint8_t *)&v18;
      break;
    case 1:
      v14 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v14;
      os_signpost_id_t v11 = *(void *)(a1 + 56);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v14)) {
        goto LABEL_18;
      }
      __int16 v22 = 0;
      BOOL v12 = "Success";
      os_signpost_id_t v13 = (uint8_t *)&v22;
      break;
    case 2:
      id v17 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v17;
      os_signpost_id_t v11 = *(void *)(a1 + 56);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v17)) {
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      BOOL v12 = "PermanentFailure";
      os_signpost_id_t v13 = buf;
      break;
    case 4:
      BOOL v15 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v15;
      os_signpost_id_t v11 = *(void *)(a1 + 56);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v15)) {
        goto LABEL_18;
      }
      __int16 v21 = 0;
      BOOL v12 = "CredentialFailure";
      os_signpost_id_t v13 = (uint8_t *)&v21;
      break;
    case 5:
      id v16 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v16;
      os_signpost_id_t v11 = *(void *)(a1 + 56);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16)) {
        goto LABEL_18;
      }
      __int16 v19 = 0;
      BOOL v12 = "Unavailable";
      os_signpost_id_t v13 = (uint8_t *)&v19;
      break;
    default:
      goto LABEL_19;
  }
  _os_signpost_emit_with_name_impl(&dword_230E51000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_UserSEPKeyAuth", v12, v13, 2u);
LABEL_18:

LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "_handleLoginResult:authenticationContext:tokens:passwordContext:tokenId:tokenHash:", a2, v7, v8, *(void *)(a1 + 40), *(void *)(a1 + 48), 0, v18);
}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_200()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No SmartCard to use for SmartCard login."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_204()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"Failed to retrieve certificate and key from SmartCard for SmartCard login."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

void __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_210(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  switch(a2)
  {
    case 0:
    case 3:
    case 6:
      uint64_t v9 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v9;
      os_signpost_id_t v11 = *(void *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
        goto LABEL_18;
      }
      LOWORD(v18) = 0;
      BOOL v12 = "Failed";
      os_signpost_id_t v13 = (uint8_t *)&v18;
      break;
    case 1:
      v14 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v14;
      os_signpost_id_t v11 = *(void *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v14)) {
        goto LABEL_18;
      }
      __int16 v22 = 0;
      BOOL v12 = "Success";
      os_signpost_id_t v13 = (uint8_t *)&v22;
      break;
    case 2:
      id v17 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v17;
      os_signpost_id_t v11 = *(void *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v17)) {
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      BOOL v12 = "PermanentFailure";
      os_signpost_id_t v13 = buf;
      break;
    case 4:
      BOOL v15 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v15;
      os_signpost_id_t v11 = *(void *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v15)) {
        goto LABEL_18;
      }
      __int16 v21 = 0;
      BOOL v12 = "CredentialFailure";
      os_signpost_id_t v13 = (uint8_t *)&v21;
      break;
    case 5:
      id v16 = PO_LOG_POAgentAuthenticationProcess();
      BOOL v10 = v16;
      os_signpost_id_t v11 = *(void *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16)) {
        goto LABEL_18;
      }
      __int16 v19 = 0;
      BOOL v12 = "Unavailable";
      os_signpost_id_t v13 = (uint8_t *)&v19;
      break;
    default:
      goto LABEL_19;
  }
  _os_signpost_emit_with_name_impl(&dword_230E51000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_SmartCard", v12, v13, 2u);
LABEL_18:

LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "_handleLoginResult:authenticationContext:tokens:passwordContext:tokenId:tokenHash:", a2, v7, v8, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), v18);
}

- (void)_handleLoginResult:(unint64_t)a3 authenticationContext:(id)a4 tokens:(id)a5 passwordContext:(id)a6 tokenId:(id)a7 tokenHash:(id)a8
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  __int16 v19 = self;
  objc_sync_enter(v19);
  if (PO_LOG_PODiagnostics_once_0 != -1) {
    dispatch_once(&PO_LOG_PODiagnostics_once_0, &__block_literal_global_1111);
  }
  uint64_t v20 = (id)PO_LOG_PODiagnostics_log_0;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = [MEMORY[0x263F5E5F0] stringForLoginResult:a3];
    *(_DWORD *)buf = 138543362;
    v82 = v21;
    _os_log_impl(&dword_230E51000, v20, OS_LOG_TYPE_DEFAULT, "Login Result = %{public}@", buf, 0xCu);
  }
  __int16 v22 = (void *)MEMORY[0x263F5E5D8];
  __int16 v23 = objc_msgSend(MEMORY[0x263F5E5F0], "stringForLoginType:", objc_msgSend(v14, "loginType"));
  __int16 v24 = [MEMORY[0x263F5E5F0] stringForLoginResult:a3];
  [v22 analyticsForLoginType:v23 result:v24];

  [(POAgentAuthenticationProcess *)v19 setLastAuthenticationAttempt:0];
  [(POAgentAuthenticationProcess *)v19 setEnableNetworkChanges:0];
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
    case 6uLL:
      double v25 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v25, OS_LOG_TYPE_INFO, "Authentication failed", buf, 2u);
      }

      id v26 = __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_247();
      if ([v14 loginType] == 100) {
        [(POAgentAuthenticationProcess *)v19 _doLoginWithPasswordContext:v16 tokenId:v17];
      }
      goto LABEL_43;
    case 1uLL:
      id v27 = [(POAgentAuthenticationProcess *)v19 configurationManager];
      id v28 = NSUserName();
      id v29 = [MEMORY[0x263EFF910] date];
      objc_msgSend(v27, "updateLoginStateForUserName:state:loginDate:loginType:", v28, 0, v29, objc_msgSend(v14, "loginType"));

      id v30 = [(POAgentAuthenticationProcess *)v19 configurationManager];
      id v31 = [v30 currentUserConfiguration];
      [v31 setState:0];

      uint64_t v32 = [MEMORY[0x263EFF910] date];
      id v33 = [(POAgentAuthenticationProcess *)v19 configurationManager];
      id v34 = [v33 currentUserConfiguration];
      [v34 setLastLoginDate:v32];

      char v35 = [(POAgentAuthenticationProcess *)v19 configurationManager];
      v36 = [v14 deviceConfiguration];
      id v37 = [v36 extensionIdentifier];
      id v78 = 0;
      char v38 = [v35 setTokens:v15 extensionIdentifier:v37 returningError:&v78];
      id v77 = v78;

      if (v38)
      {
        v39 = [(POAgentAuthenticationProcess *)v19 configurationManager];
        os_signpost_id_t v40 = NSUserName();
        char v41 = [v39 saveStashedSSOTokens:v15 forUserName:v40];

        if ((v41 & 1) == 0) {
          id v42 = __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_217();
        }
        v43 = [(POAgentAuthenticationProcess *)v19 userNotificationCenter];
        v80 = @"com.apple.PlatformSSO.authentication";
        id v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v80 count:1];
        [v43 removeDeliveredNotificationsWithIdentifiers:v44];

        id v45 = [(POAgentAuthenticationProcess *)v19 userNotificationCenter];
        v79 = @"com.apple.PlatformSSO.authentication";
        id v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v79 count:1];
        [v45 removePendingNotificationRequestsWithIdentifiers:v46];

        [(POAgentAuthenticationProcess *)v19 setupTimerForAuthentication];
        os_signpost_id_t v47 = [v14 loginConfiguration];
        id v48 = [(POAgentAuthenticationProcess *)v19 configurationManager];
        v49 = [v48 currentUserConfiguration];
        [(POAgentAuthenticationProcess *)v19 handleKerberosMappingForTokens:v15 loginConfiguration:v47 userConfiguration:v49];

        if ([v14 loginType] == 3)
        {
          v50 = [(POAgentAuthenticationProcess *)v19 configurationManager];
          BOOL v51 = [v50 currentUserConfiguration];
          [v51 setSmartCardTokenId:v17];

          BOOL v52 = [(POAgentAuthenticationProcess *)v19 configurationManager];
          id v53 = [v52 currentUserConfiguration];
          [v53 setSmartCardHash:v18];
        }
        id v54 = [(POAgentAuthenticationProcess *)v19 configurationManager];
        char v55 = [v54 saveCurrentUserConfigurationAndSyncToPreboot:1];

        if (v55)
        {
          a3 = 1;
        }
        else
        {
          id v69 = __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_223();
          a3 = 3;
        }
        BOOL v70 = [(POAgentAuthenticationProcess *)v19 configurationManager];
        v71 = NSUserName();
        char v72 = [v70 savePendingSSOTokens:0 forUserName:v71];

        if ((v72 & 1) == 0) {
          id v73 = __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_229();
        }
        uint64_t v74 = NSUserName();
        id v75 = [(POAgentAuthenticationProcess *)v19 configurationManager];
        [(POAgentAuthenticationProcess *)v19 handleUserAuthorizationUsing:v14 userName:v74 tokens:v15 configurationManager:v75];

        [(POAgentAuthenticationProcess *)v19 handleKeyUpdatesWithPasswordContext:v16];
        [(POAgentAuthenticationProcess *)v19 handleEncryptionKeyRotation];
        unint64_t v76 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_230E51000, v76, OS_LOG_TYPE_INFO, "Authentication completed successfully", buf, 2u);
        }

LABEL_43:
        [(POAgentAuthenticationProcess *)v19 notifyKerberosDelegateTGTDidComplete];
        [(POAgentAuthenticationProcess *)v19 postAuthenticationNotification:a3];
      }
      else
      {
        id v68 = __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke();
        [(POAgentAuthenticationProcess *)v19 postAuthenticationNotification:3];
      }
      objc_sync_exit(v19);

      return;
    case 2uLL:
      v56 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v56, OS_LOG_TYPE_INFO, "Authentication failed and needs repair", buf, 2u);
      }

      [(POAgentAuthenticationProcess *)v19 handleDeviceAndUserRegistrationForRepair:1];
      a3 = 2;
      goto LABEL_43;
    case 4uLL:
      v57 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v57, OS_LOG_TYPE_INFO, "Authentication failed with invalid credential", buf, 2u);
      }

      if ([v14 loginType] == 100)
      {
        [(POAgentAuthenticationProcess *)v19 _doLoginWithPasswordContext:v16 tokenId:v17];
      }
      else if ([v14 loginType] == 2 || objc_msgSend(v14, "loginType") == 3)
      {
        v63 = [(POAgentAuthenticationProcess *)v19 configurationManager];
        uint64_t v64 = [v63 currentUserConfiguration];
        [(id)v64 setState:5];

        id v65 = [(POAgentAuthenticationProcess *)v19 configurationManager];
        LOBYTE(v64) = [v65 saveCurrentUserConfigurationAndSyncToPreboot:1];

        if ((v64 & 1) == 0)
        {
          id v66 = __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_235();
          [(POAgentAuthenticationProcess *)v19 postAuthenticationNotification:4];
        }
        char v67 = [v14 userName];
        [(POAgentAuthenticationProcess *)v19 handleUserRegistrationForUser:v67 repair:1 newPasswordUser:0 newSmartCardUser:0 notified:0 profile:0];
      }
      else
      {
        [(POAgentAuthenticationProcess *)v19 handleUserNeedsReauthenticationAfterDelay:1.0];
      }
      a3 = 4;
      goto LABEL_43;
    case 5uLL:
      double v58 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v58, OS_LOG_TYPE_INFO, "Authentication failed because network is unavailable", buf, 2u);
      }

      [(POAgentAuthenticationProcess *)v19 setEnableNetworkChanges:1];
      BOOL v59 = [(POAgentAuthenticationProcess *)v19 configurationManager];
      uint64_t v60 = [v59 currentUserConfiguration];
      [(id)v60 setState:1];

      uint64_t v61 = [(POAgentAuthenticationProcess *)v19 configurationManager];
      LOBYTE(v60) = [v61 saveCurrentUserConfigurationAndSyncToPreboot:0];

      if ((v60 & 1) == 0) {
        id v62 = __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_241();
      }
      a3 = 5;
      goto LABEL_43;
    default:
      goto LABEL_43;
  }
}

id __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save SSO tokens after authentication."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_217()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to stash SSO tokens after successful authentication."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_223()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after successful authentication."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_229()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to clear SSO tokens after successful authentication."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_235()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after credential failure."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_241()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after authentication unavailable."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_247()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to authenticate user."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

- (void)handleEncryptionKeyRotation
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

id __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No device configuration for key rotation."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_257()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"No platform SSO Profiles in key rotation."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_263()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Platform SSO extension has changed for key rotation."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_269()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Platform SSO extension not found for key rotation."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

void __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_275(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    uint64_t v2 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_275_cold_2();
    }
    goto LABEL_7;
  }
  if (a2 == 10)
  {
    uint64_t v2 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_275_cold_1();
    }
LABEL_7:

    return;
  }
  uint64_t v4 = [*(id *)(a1 + 32) configurationManager];
  id v8 = [v4 currentDeviceConfiguration];

  [v8 setDeviceEncryptionKey:*(void *)(a1 + 48)];
  [v8 setEncryptionAlgorithm:*(void *)(a1 + 40)];
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  [v8 setLastEncryptionKeyChange:v5];

  id v6 = [*(id *)(a1 + 32) configurationManager];
  LOBYTE(v5) = [v6 saveDeviceConfiguration:v8];

  if ((v5 & 1) == 0) {
    id v7 = __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_276();
  }
}

id __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_276()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save new device configuration during key rotation"];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)handleKeyUpdatesWithPasswordContext:(id)a3
{
  uint64_t v3 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess handleKeyUpdatesWithPasswordContext:]();
  }
}

- (void)requestUserAuthenticationWithUserInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess requestUserAuthenticationWithUserInfo:]();
  }

  id v6 = [(POAgentAuthenticationProcess *)self configurationManager];
  id v7 = [v6 currentUserConfiguration];
  uint64_t v8 = [v7 loginType];

  if (v8 == 1)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__POAgentAuthenticationProcess_requestUserAuthenticationWithUserInfo___block_invoke;
    v10[3] = &unk_264BBF388;
    void v10[4] = self;
    id v11 = v4;
    [(POAgentAuthenticationProcess *)self requestUserAuthenticationSyncPassword:1 completion:v10];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263F10468]);
    [(POAgentAuthenticationProcess *)self performLoginForCurrentUserWithPasswordContext:v9 tokenId:0];
  }
}

uint64_t __70__POAgentAuthenticationProcess_requestUserAuthenticationWithUserInfo___block_invoke(uint64_t result, unint64_t a2)
{
  if (a2 <= 6)
  {
    if (((1 << a2) & 0x59) != 0)
    {
      if (*(void *)(result + 40)) {
        return [*(id *)(result + 32) handleUserNeedsReauthenticationAfterDelay:1.0];
      }
    }
    else if (a2 == 2)
    {
      return [*(id *)(result + 32) handleDeviceAndUserRegistrationForRepair:1];
    }
  }
  return result;
}

- (void)requestUserAuthenticationSyncPassword:(BOOL)a3 completion:(id)a4
{
  id v4 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess requestUserAuthenticationSyncPassword:completion:]();
  }
}

- (unint64_t)requestSmartCardForBinding:(BOOL)a3 tokenId:(id *)a4 tokenHash:(id *)a5 wrapTokenHash:(id *)a6
{
  id v6 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess requestSmartCardForBinding:tokenId:tokenHash:wrapTokenHash:]();
  }

  return 0;
}

- (void)requestUserAuthenticationWithWindow:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, uint64_t))a4;
  id v6 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess requestUserAuthenticationWithWindow:completion:]();
  }

  uint64_t v7 = [(POAgentAuthenticationProcess *)self registrationContext];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(POAgentAuthenticationProcess *)self registrationContext];
    uint64_t v10 = [v9 state];

    if (v10 != 1)
    {
      id v16 = __79__POAgentAuthenticationProcess_requestUserAuthenticationWithWindow_completion___block_invoke();
      goto LABEL_10;
    }
  }
  if (![(POAgentAuthenticationProcess *)self platformSSOAccount])
  {
    id v15 = __79__POAgentAuthenticationProcess_requestUserAuthenticationWithWindow_completion___block_invoke_288();
LABEL_10:
    uint64_t v14 = 6;
    goto LABEL_14;
  }
  id v11 = [(POAgentAuthenticationProcess *)self configurationManager];
  BOOL v12 = [v11 currentUserConfiguration];
  uint64_t v13 = [v12 loginType];

  if (v13 == 1)
  {
    uint64_t v14 = 3;
  }
  else
  {
    id v17 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_230E51000, v17, OS_LOG_TYPE_INFO, "Not a password user", v18, 2u);
    }

    uint64_t v14 = 0;
  }
LABEL_14:
  v5[2](v5, v14);
}

id __79__POAgentAuthenticationProcess_requestUserAuthenticationWithWindow_completion___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"No user authentication during registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __79__POAgentAuthenticationProcess_requestUserAuthenticationWithWindow_completion___block_invoke_288()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Not a PlatformSSO account for user authentication."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)showAlertMessage:(id)a3 messageText:(id)a4 completion:(id)a5
{
  uint64_t v5 = (void (**)(id, uint64_t))a5;
  id v6 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess showAlertMessage:messageText:completion:]();
  }

  v5[2](v5, 3);
}

- (void)showAlertWithError:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, uint64_t))a4;
  uint64_t v5 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess showAlertWithError:completion:]();
  }

  v4[2](v4, 3);
}

- (unint64_t)handleKeyRequestSync
{
  uint64_t v3 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess handleKeyRequestSync]();
  }

  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__POAgentAuthenticationProcess_handleKeyRequestSync__block_invoke;
  v8[3] = &unk_264BBF3B0;
  uint64_t v10 = &v11;
  uint64_t v5 = v4;
  id v9 = v5;
  [(POAgentAuthenticationProcess *)self handleKeyRequestWithCompletion:v8];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

intptr_t __52__POAgentAuthenticationProcess_handleKeyRequestSync__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)handleKeyRequestWithCompletion:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    os_signpost_id_t v47 = "-[POAgentAuthenticationProcess handleKeyRequestWithCompletion:]";
    __int16 v48 = 2112;
    v49 = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  unint64_t v6 = [(POAgentAuthenticationProcess *)self configurationManager];
  uint64_t v7 = [v6 currentDeviceConfiguration];

  if (v7 && ([v7 registrationCompleted] & 1) != 0)
  {
    uint64_t v8 = [(POAgentAuthenticationProcess *)self configurationManager];
    id v9 = [v8 currentLoginConfiguration];

    if (v9)
    {
      uint64_t v10 = [(POAgentAuthenticationProcess *)self configurationManager];
      uint64_t v11 = [v10 currentUserConfiguration];

      if (v11)
      {
        BOOL v12 = [(POAgentAuthenticationProcess *)self configurationManager];
        uint64_t v13 = [v12 currentRefreshToken];

        if (v13)
        {
          uint64_t v14 = PO_LOG_POAgentAuthenticationProcess();
          os_signpost_id_t v15 = os_signpost_id_generate(v14);

          id v16 = PO_LOG_POAgentAuthenticationProcess();
          id v17 = v16;
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_230E51000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PlatformSSO_KeyRequest", " enableTelemetry=YES ", buf, 2u);
          }
          os_signpost_id_t v32 = v15;

          id v18 = [v11 userLoginConfiguration];
          __int16 v19 = [v9 mergedConfigurationWithUserLoginConfiguration:v18];

          uint64_t v20 = [v11 userLoginConfiguration];
          __int16 v21 = [v20 loginUserName];
          __int16 v22 = v21;
          if (v21)
          {
            id v23 = v21;
          }
          else
          {
            id v23 = [(POAgentAuthenticationProcess *)self userName];
          }
          id v28 = v23;

          id v29 = [(POAgentAuthenticationProcess *)self authenticationProcess];
          id v30 = [v29 createAuthenticationContextUsingLoginConfiguration:v19 deviceConfiguration:v7 userName:v28];

          [v30 setRefreshToken:v13];
          id v31 = [(POAgentAuthenticationProcess *)self authenticationProcess];
          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          v33[2] = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_313;
          v33[3] = &unk_264BBF3D8;
          os_signpost_id_t v35 = v32;
          void v33[4] = self;
          id v34 = v4;
          [v31 performKeyRequestUsingContext:v30 completion:v33];
        }
        else
        {
          uint64_t v36 = MEMORY[0x263EF8330];
          uint64_t v37 = 3221225472;
          char v38 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_309;
          v39 = &unk_264BBECA8;
          os_signpost_id_t v40 = self;
          id v27 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_309();
          (*((void (**)(id, uint64_t))v4 + 2))(v4, 3);
        }
      }
      else
      {
        uint64_t v41 = MEMORY[0x263EF8330];
        uint64_t v42 = 3221225472;
        v43 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_305;
        id v44 = &unk_264BBECA8;
        id v45 = self;
        id v26 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_305();
        (*((void (**)(id, uint64_t))v4 + 2))(v4, 3);
      }
    }
    else
    {
      id v25 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_299();
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 3);
    }
  }
  else
  {
    id v24 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke();
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 3);
  }
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No device configuration or registration not complete during key request."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_299()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No login configuration during key request."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_305()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No user configuration during key request."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_309()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No refresh token for user during key request."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

void __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_313(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  switch(a2)
  {
    case 0:
    case 3:
    case 4:
    case 6:
      os_signpost_id_t v15 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v15, OS_LOG_TYPE_INFO, "Key request failed", buf, 2u);
      }

      id v16 = PO_LOG_POAgentAuthenticationProcess();
      id v17 = v16;
      os_signpost_id_t v18 = *(void *)(a1 + 48);
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_230E51000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PlatformSSO_KeyRequest", "Failed", buf, 2u);
      }

      id v19 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_327();
      goto LABEL_32;
    case 1:
      os_signpost_id_t v32 = PO_LOG_POAgentAuthenticationProcess();
      id v33 = v32;
      os_signpost_id_t v34 = *(void *)(a1 + 48);
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_230E51000, v33, OS_SIGNPOST_INTERVAL_END, v34, "PlatformSSO_KeyRequest", "Success", buf, 2u);
      }

      os_signpost_id_t v35 = (__SecCertificate *)[MEMORY[0x263F5E650] certificateForData:v13];
      SecKeyRef v36 = SecCertificateCopyKey(v35);
      *(void *)buf = 0;
      uint64_t v37 = (void *)MEMORY[0x263F5E670];
      char v38 = NSUserName();
      id v70 = 0;
      id v71 = 0;
      LOBYTE(v37) = [v37 createUnlockKeyWithPublicKey:v36 userName:v38 returningCertificate:buf hash:&v71 encryptedData:&v70];
      id v58 = v71;
      id v56 = v70;

      if (v37)
      {
        if (v36) {
          CFRelease(v36);
        }
        v39 = objc_msgSend(*(id *)(a1 + 32), "configurationManager", v56);
        os_signpost_id_t v40 = [v39 currentUserConfiguration];
        [v40 setUserDecryptionKeyHash:v58];

        uint64_t v41 = *(void *)buf;
        uint64_t v42 = [*(id *)(a1 + 32) configurationManager];
        v43 = [v42 currentUserConfiguration];
        [v43 setUserDecryptionCertificate:v41];

        id v44 = [*(id *)(a1 + 32) configurationManager];
        id v45 = [v44 currentUserConfiguration];
        [v45 setUserDecryptionContext:v14];

        id v46 = [*(id *)(a1 + 32) configurationManager];
        os_signpost_id_t v47 = [v46 currentUserConfiguration];
        [v47 setUserUnlockData:v57];

        __int16 v48 = [*(id *)(a1 + 32) configurationManager];
        v49 = [v48 currentUserConfiguration];
        [v49 setUserUnlockHash:v12];

        uint64_t v50 = [*(id *)(a1 + 32) configurationManager];
        uint64_t v51 = [v50 currentUserConfiguration];
        [(id)v51 setUserUnlockCertificate:v35];

        BOOL v52 = [*(id *)(a1 + 32) configurationManager];
        LOBYTE(v51) = [v52 saveCurrentUserConfigurationAndSyncToPreboot:1];

        if ((v51 & 1) == 0)
        {
          uint64_t v60 = MEMORY[0x263EF8330];
          uint64_t v61 = 3221225472;
          id v62 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_319;
          v63 = &unk_264BBECA8;
          uint64_t v64 = *(void *)(a1 + 32);
          id v53 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_319();
        }
        id v54 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)BOOL v59 = 0;
          _os_log_impl(&dword_230E51000, v54, OS_LOG_TYPE_INFO, "Key request completed successfully", v59, 2u);
        }

LABEL_32:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        if (v36) {
          CFRelease(v36);
        }
        if (v35) {
          CFRelease(v35);
        }
        uint64_t v65 = MEMORY[0x263EF8330];
        uint64_t v66 = 3221225472;
        char v67 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_315;
        id v68 = &unk_264BBECA8;
        uint64_t v69 = *(void *)(a1 + 32);
        id v55 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_315();
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      return;
    case 2:
      uint64_t v20 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v20, OS_LOG_TYPE_INFO, "Authentication failed and needs repair", buf, 2u);
      }

      __int16 v21 = PO_LOG_POAgentAuthenticationProcess();
      __int16 v22 = v21;
      os_signpost_id_t v23 = *(void *)(a1 + 48);
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_230E51000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PlatformSSO_KeyRequest", "PermanentFailure", buf, 2u);
      }

      id v24 = [*(id *)(a1 + 32) configurationManager];
      uint64_t v25 = [v24 currentUserConfiguration];
      [(id)v25 setState:2];

      id v26 = [*(id *)(a1 + 32) configurationManager];
      LOBYTE(v25) = [v26 saveCurrentUserConfigurationAndSyncToPreboot:1];

      if ((v25 & 1) == 0) {
        id v27 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_323();
      }
      goto LABEL_32;
    case 5:
      id v28 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v28, OS_LOG_TYPE_INFO, "Key request failed because network is unavailable", buf, 2u);
      }

      id v29 = PO_LOG_POAgentAuthenticationProcess();
      id v30 = v29;
      os_signpost_id_t v31 = *(void *)(a1 + 48);
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_230E51000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PlatformSSO_KeyRequest", "Unavailable", buf, 2u);
      }

      goto LABEL_32;
    default:
      goto LABEL_32;
  }
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_315()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to create unlock key."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_319()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after successful key request."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_323()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after failed key request."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_327()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed key request."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

- (unint64_t)handleTokenBindingWithPasswordContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[POAgentAuthenticationProcess handleTokenBindingWithPasswordContext:]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_230E51000, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  return 1;
}

- (void)postAuthenticationNotification:(unint64_t)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess postAuthenticationNotification:]();
  }

  int v6 = [(POAgentAuthenticationProcess *)self notificationCenter];
  uint64_t v10 = @"authenticationResult";
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  v11[0] = v7;
  __int16 v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v6 postNotificationName:@"com.apple.PlatformSSO.authenticationCompleted" object:0 userInfo:v8];

  id v9 = [(POAgentAuthenticationProcess *)self distributedNotificationCenter];
  [v9 postNotificationName:@"com.apple.platformSSO.UserRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];
}

- (void)showRegistrationUI
{
  uint64_t v3 = [(POAgentAuthenticationProcess *)self registrationContext];
  id v4 = [v3 ssoExtension];

  if (!v4)
  {
    uint64_t v5 = [(POAgentAuthenticationProcess *)self registrationContext];
    int v6 = [v5 extensionIdentifier];
    id v13 = [(POAgentAuthenticationProcess *)self loadSSOExtensionWithExtensionBundleIdentifier:v6];

    if (v13)
    {
      uint64_t v7 = [(POAgentAuthenticationProcess *)self registrationContext];
      [v7 setSsoExtension:v13];

      __int16 v8 = [(POAgentAuthenticationProcess *)self registrationContext];
      id v9 = [v8 ssoExtension];
      [v9 setDelegate:self];
    }
    else
    {
      [(POAgentAuthenticationProcess *)self setRegistrationFailed:1];
      uint64_t v10 = [(POAgentAuthenticationProcess *)self registrationContext];
      [v10 setState:8];

      id v11 = [(POAgentAuthenticationProcess *)self distributedNotificationCenter];
      [v11 postNotificationName:@"com.apple.platformSSO.DeviceRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];

      id v12 = __50__POAgentAuthenticationProcess_showRegistrationUI__block_invoke();
    }
  }
}

id __50__POAgentAuthenticationProcess_showRegistrationUI__block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Platform SSO extension not found in user registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)continueDeviceRegistration:(id)a3
{
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__POAgentAuthenticationProcess_continueDeviceRegistration___block_invoke;
  block[3] = &unk_264BBF278;
  block[4] = self;
  dispatch_async(v4, block);
}

void __59__POAgentAuthenticationProcess_continueDeviceRegistration___block_invoke(uint64_t a1)
{
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __59__POAgentAuthenticationProcess_continueDeviceRegistration___block_invoke_2;
  activity_block[3] = &unk_264BBF278;
  activity_block[4] = *(void *)(a1 + 32);
  _os_activity_initiate(&dword_230E51000, "PSSODeviceRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __59__POAgentAuthenticationProcess_continueDeviceRegistration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDeviceRegistration];
}

- (void)continueUserRegistration:(id)a3
{
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__POAgentAuthenticationProcess_continueUserRegistration___block_invoke;
  block[3] = &unk_264BBF278;
  block[4] = self;
  dispatch_async(v4, block);
}

void __57__POAgentAuthenticationProcess_continueUserRegistration___block_invoke(uint64_t a1)
{
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __57__POAgentAuthenticationProcess_continueUserRegistration___block_invoke_2;
  activity_block[3] = &unk_264BBF278;
  activity_block[4] = *(void *)(a1 + 32);
  _os_activity_initiate(&dword_230E51000, "PSSOUserRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __57__POAgentAuthenticationProcess_continueUserRegistration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startUserRegistration];
}

- (void)exitDeviceRegistration:(id)a3
{
  id v4 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v4 registrationUI];

  [(POAgentAuthenticationProcess *)self failDeviceRegistrationBeforeAuthorization];

  [(POAgentAuthenticationProcess *)self setRegistrationContext:0];
}

- (void)exitUserRegistration:(id)a3
{
  id v4 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v4 registrationUI];

  [(POAgentAuthenticationProcess *)self failUserRegistrationBeforeAuthorization];

  [(POAgentAuthenticationProcess *)self setRegistrationContext:0];
}

- (void)exitRegistration:(id)a3
{
  id v4 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v4 registrationUI];

  uint64_t v5 = [(POAgentAuthenticationProcess *)self distributedNotificationCenter];
  [v5 postNotificationName:@"com.apple.platformSSO.DeviceRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];

  [(POAgentAuthenticationProcess *)self setRegistrationContext:0];
}

- (BOOL)handleUserNeedsReauthenticationAfterDelay:(double)a3
{
  v62[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess handleUserNeedsReauthenticationAfterDelay:]();
  }

  uint64_t v6 = [(POAgentAuthenticationProcess *)self registrationContext];
  if (!v6
    || (uint64_t v7 = (void *)v6,
        [(POAgentAuthenticationProcess *)self registrationContext],
        __int16 v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 state],
        v8,
        v7,
        v9 == 1))
  {
    uint64_t v10 = NSUserName();
    if ([(POAgentAuthenticationProcess *)self platformSSOAccount])
    {
      id v11 = [(POAgentAuthenticationProcess *)self configurationManager];
      id v12 = [v11 currentUserConfiguration];

      if (v12)
      {
        id v13 = [(POAgentAuthenticationProcess *)self configurationManager];
        uint64_t v14 = [v13 currentUserConfiguration];
        [(id)v14 setState:1];

        os_signpost_id_t v15 = [(POAgentAuthenticationProcess *)self configurationManager];
        LOBYTE(v14) = [v15 saveCurrentUserConfigurationAndSyncToPreboot:0];

        if (v14)
        {
          id v16 = [(POAgentAuthenticationProcess *)self configurationManager];
          id v17 = [v16 currentUserConfiguration];
          uint64_t v18 = [v17 loginType];

          if (v18 == 1)
          {
            id v19 = [(POAgentAuthenticationProcess *)self configurationManager];
            uint64_t v20 = [v19 currentLoginConfiguration];

            BOOL v21 = v20 != 0;
            if (v20)
            {
              __int16 v22 = [(POAgentAuthenticationProcess *)self configurationManager];
              os_signpost_id_t v23 = [v22 currentDeviceConfiguration];
              id v24 = [v23 accountDisplayName];
              uint64_t v25 = v24;
              if (!v24)
              {
                uint64_t v25 = [v20 accountDisplayName];
              }
              os_signpost_id_t v47 = v20;
              id v26 = [(POAgentAuthenticationProcess *)self configurationManager];
              id v27 = [v26 currentDeviceConfiguration];
              id v28 = [v27 extensionIdentifier];
              uint64_t v46 = [(POAgentAuthenticationProcess *)self createSignInNotificationWithAccountName:v25 extensionIdentifier:v28];

              if (!v24) {
              id v29 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
              }
              v62[0] = @"com.apple.PlatformSSO.authentication";
              id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:1];
              [v29 removeDeliveredNotificationsWithIdentifiers:v30];

              os_signpost_id_t v31 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
              uint64_t v61 = @"com.apple.PlatformSSO.authentication";
              os_signpost_id_t v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
              [v31 removePendingNotificationRequestsWithIdentifiers:v32];

              id v33 = (void *)MEMORY[0x263F1DF48];
              os_signpost_id_t v34 = [MEMORY[0x263F1DFA8] triggerWithTimeInterval:0 repeats:a3];
              os_signpost_id_t v35 = [v33 requestWithIdentifier:@"com.apple.PlatformSSO.authentication" content:v46 trigger:v34 destinations:5];

              SecKeyRef v36 = PO_LOG_POAgentAuthenticationProcess();
              uint64_t v37 = (void *)v46;
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_230E51000, v36, OS_LOG_TYPE_INFO, "Sending login notification", buf, 2u);
              }

              char v38 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
              v48[0] = MEMORY[0x263EF8330];
              v48[1] = 3221225472;
              v48[2] = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_362;
              v48[3] = &unk_264BBF428;
              id v49 = v10;
              [v38 addNotificationRequest:v35 withCompletionHandler:v48];

              uint64_t v20 = v47;
            }
            else
            {
              uint64_t v50 = MEMORY[0x263EF8330];
              uint64_t v51 = 3221225472;
              BOOL v52 = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_356;
              id v53 = &unk_264BBECA8;
              id v54 = v10;
              id v45 = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_356();
              uint64_t v37 = v54;
            }
          }
          else
          {
            id v44 = PO_LOG_POAgentAuthenticationProcess();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_230E51000, v44, OS_LOG_TYPE_INFO, "Not a password user", buf, 2u);
            }

            [(POAgentAuthenticationProcess *)self performLoginForCurrentUserWithPasswordContext:0];
            BOOL v21 = 1;
          }
          goto LABEL_22;
        }
        id v42 = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_350();
      }
      else
      {
        uint64_t v56 = MEMORY[0x263EF8330];
        uint64_t v57 = 3221225472;
        id v58 = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_346;
        BOOL v59 = &unk_264BBECA8;
        id v60 = v10;
        id v41 = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_346();
      }
    }
    else
    {
      id v39 = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_340();
    }
    BOOL v21 = 0;
LABEL_22:

    return v21;
  }
  id v40 = __79__POAgentAuthenticationProcess_requestUserAuthenticationWithWindow_completion___block_invoke();
  return 0;
}

id __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_340()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Not a PlatformSSO account during authentication notification."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_346()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No user configuration for user for authentication notification."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_346_cold_1();
  }

  return v0;
}

id __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_350()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration before authentication notification."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_356()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No login configuration for user for authentication notification."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_346_cold_1();
  }

  return v0;
}

void __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_362(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_2;
    v6[3] = &unk_264BBF400;
    id v7 = v3;
    id v8 = *(id *)(a1 + 32);
    id v5 = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_2((uint64_t)v6);
  }
}

id __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error sending authentication notification."];
  uint64_t v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_2_cold_1();
  }

  return v1;
}

- (unint64_t)requestUserPasswordChangePreference
{
  uint64_t v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess requestUserPasswordChangePreference]();
  }

  return 0;
}

- (void)handleUserCredentialNeededAtLogin:(BOOL)a3 smartCard:(BOOL)a4 accountDisplayName:(id)a5 bundleIdentifier:(id)a6 returningContext:(id *)a7
{
  id v8 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess handleUserCredentialNeededAtLogin:smartCard:accountDisplayName:bundleIdentifier:returningContext:]();
  }

  if (a7) {
    *a7 = 0;
  }
}

- (BOOL)handleUserAuthorizationNeededForAccountDisplayName:(id)a3 bundleIdentifier:(id)a4
{
  id v4 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess handleUserAuthorizationNeededForAccountDisplayName:bundleIdentifier:]();
  }

  return 1;
}

- (void)_startDeviceRegistration
{
  uint64_t v222 = *MEMORY[0x263EF8340];
  id v3 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v219 = "-[POAgentAuthenticationProcess _startDeviceRegistration]";
    __int16 v220 = 2112;
    uint64_t v221 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v4 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v4 setState:4];

  id v5 = [(POAgentAuthenticationProcess *)self registrationContext];
  uint64_t v6 = [v5 ssoExtension];

  if (!v6)
  {
    id v7 = [(POAgentAuthenticationProcess *)self registrationContext];
    id v8 = [v7 extensionIdentifier];
    uint64_t v9 = [(POAgentAuthenticationProcess *)self loadSSOExtensionWithExtensionBundleIdentifier:v8];

    if (!v9)
    {
      [(POAgentAuthenticationProcess *)self setRegistrationFailed:1];
      id v68 = [(POAgentAuthenticationProcess *)self registrationContext];
      [v68 setState:5];

      uint64_t v69 = [(POAgentAuthenticationProcess *)self distributedNotificationCenter];
      [v69 postNotificationName:@"com.apple.platformSSO.DeviceRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];

      id v70 = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke();
      return;
    }
    uint64_t v10 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v10 setSsoExtension:v9];

    id v11 = [(POAgentAuthenticationProcess *)self registrationContext];
    id v12 = [v11 ssoExtension];
    [v12 setDelegate:self];
  }
  id v13 = [(POAgentAuthenticationProcess *)self configurationManager];
  [v13 enablePlatformSSORulesIfNeeded:&__block_literal_global_375];

  uint64_t v14 = [(POAgentAuthenticationProcess *)self jwksStorageProvider];
  os_signpost_id_t v15 = [(POAgentAuthenticationProcess *)self registrationContext];
  id v16 = [v15 extensionIdentifier];
  [v14 setJwksCache:0 forExtensionIdentifier:v16];

  id v17 = [(POAgentAuthenticationProcess *)self registrationContext];
  LODWORD(v15) = [v17 isRepair];

  if (v15) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = [(POAgentAuthenticationProcess *)self registrationContext];
  int v20 = [v19 userNotified];

  BOOL v21 = [(POAgentAuthenticationProcess *)self registrationContext];
  if ([v21 userNotified])
  {

    if ((v20 & 1) == 0)
    {
LABEL_11:
      int v20 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    __int16 v22 = [(POAgentAuthenticationProcess *)self registrationContext];
    os_signpost_id_t v23 = [v22 registrationToken];

    char v24 = v20 ^ 1;
    if (v23) {
      char v24 = 1;
    }
    if (v24) {
      goto LABEL_11;
    }
  }
  v18 |= 1uLL;
LABEL_16:
  uint64_t v25 = [(POAgentAuthenticationProcess *)self registrationContext];
  int v26 = [v25 useSharedDeviceKeys];

  if (v26) {
    uint64_t v27 = v18 | 4;
  }
  else {
    uint64_t v27 = v18;
  }
  id v28 = [(POAgentAuthenticationProcess *)self registrationContext];
  int v29 = [v28 migratingDeviceKeys];

  if (v29) {
    uint64_t v30 = v27 | 8;
  }
  else {
    uint64_t v30 = v27;
  }
  os_signpost_id_t v31 = [(POAgentAuthenticationProcess *)self registrationContext];
  int v32 = [v31 authMethod];

  if (v32 == 3)
  {
    id v33 = [(POAgentAuthenticationProcess *)self tokenHelper];
    os_signpost_id_t v34 = [(POAgentAuthenticationProcess *)self registrationContext];
    os_signpost_id_t v35 = [v34 userName];
    id v217 = 0;
    SecKeyRef v36 = [v33 findTokenIdForSmartCardBoundUser:v35 tokenHash:&v217];
    id v37 = v217;
    char v38 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v38 setSmartCardTokenId:v36];

    id v39 = [(POAgentAuthenticationProcess *)self registrationContext];
    id v40 = [v39 smartCardTokenId];
    uint64_t v41 = [v40 length];

    if (!v41)
    {
      id v42 = [(POAgentAuthenticationProcess *)self tokenHelper];
      v43 = [(POAgentAuthenticationProcess *)self registrationContext];
      id v44 = [v43 userName];
      id v216 = v37;
      id v45 = [v42 findTokenIdForSmartCardAMUser:v44 tokenHash:&v216];
      id v46 = v216;

      os_signpost_id_t v47 = [(POAgentAuthenticationProcess *)self registrationContext];
      [v47 setSmartCardTokenId:v45];

      id v37 = v46;
    }
    __int16 v48 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v48 setSmartCardHash:v37];
  }
  if (v20)
  {
    id v49 = [(POAgentAuthenticationProcess *)self registrationContext];
    char v50 = [v49 userIsPlatformSSOUser];

    uint64_t v51 = [(POAgentAuthenticationProcess *)self registrationContext];
    BOOL v52 = v51;
    if ((v50 & 1) == 0)
    {
      v63 = [v51 profile];
      uint64_t v64 = [v63 accountDisplayName];
      uint64_t v65 = [(POAgentAuthenticationProcess *)self registrationContext];
      uint64_t v66 = [v65 extensionIdentifier];
      BOOL v67 = [(POAgentAuthenticationProcess *)self handleUserAuthorizationNeededForAccountDisplayName:v64 bundleIdentifier:v66];

      if (!v67)
      {
        id v78 = PO_LOG_POAgentAuthenticationProcess();
        if (!os_log_type_enabled(v78, OS_LOG_TYPE_INFO)) {
          goto LABEL_100;
        }
        *(_WORD *)buf = 0;
        v79 = "Authorization not provided, starting over.";
        goto LABEL_99;
      }
LABEL_32:
      id v60 = [(POAgentAuthenticationProcess *)self registrationContext];
      [v60 setAuthorizationProvided:1];
      goto LABEL_43;
    }
    int v53 = [v51 authMethod];

    id v54 = [(POAgentAuthenticationProcess *)self registrationContext];
    id v55 = v54;
    if (v53 == 1)
    {
      uint64_t v56 = [v54 profile];
      uint64_t v57 = [v56 accountDisplayName];
      id v58 = [(POAgentAuthenticationProcess *)self registrationContext];
      BOOL v59 = [v58 extensionIdentifier];
      id v215 = 0;
      [(POAgentAuthenticationProcess *)self handleUserCredentialNeededAtLogin:0 smartCard:0 accountDisplayName:v57 bundleIdentifier:v59 returningContext:&v215];
      id v60 = v215;

      if (v60)
      {
LABEL_30:
        uint64_t v61 = [(POAgentAuthenticationProcess *)self registrationContext];
        [v61 setCredentialContext:v60];

        id v62 = [(POAgentAuthenticationProcess *)self registrationContext];
        [v62 setAuthorizationProvided:1];

LABEL_43:
        goto LABEL_44;
      }
      id v78 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v79 = "Credential not provided, starting over.";
        goto LABEL_99;
      }
LABEL_100:

      [(POAgentAuthenticationProcess *)self failDeviceRegistrationBeforeAuthorization];
      return;
    }
    if ([v54 authMethod] == 3)
    {
      id v71 = [(POAgentAuthenticationProcess *)self registrationContext];
      char v72 = [v71 smartCardTokenId];

      if (!v72)
      {
        id v73 = [(POAgentAuthenticationProcess *)self registrationContext];
        uint64_t v74 = [v73 profile];
        id v75 = [v74 accountDisplayName];
        unint64_t v76 = [(POAgentAuthenticationProcess *)self registrationContext];
        id v77 = [v76 extensionIdentifier];
        id v214 = 0;
        [(POAgentAuthenticationProcess *)self handleUserCredentialNeededAtLogin:0 smartCard:1 accountDisplayName:v75 bundleIdentifier:v77 returningContext:&v214];
        id v60 = v214;

        if (v60) {
          goto LABEL_30;
        }
        id v78 = PO_LOG_POAgentAuthenticationProcess();
        if (!os_log_type_enabled(v78, OS_LOG_TYPE_INFO)) {
          goto LABEL_100;
        }
        *(_WORD *)buf = 0;
        v79 = "Credential not provided, starting over.";
LABEL_99:
        _os_log_impl(&dword_230E51000, v78, OS_LOG_TYPE_INFO, v79, buf, 2u);
        goto LABEL_100;
      }
    }
    else
    {
    }
    id v60 = [(POAgentAuthenticationProcess *)self registrationContext];
    if ([v60 authMethod] == 1) {
      goto LABEL_43;
    }
    v203 = [(POAgentAuthenticationProcess *)self registrationContext];
    char v204 = [v203 isNewPasswordUser];

    if ((v204 & 1) == 0)
    {
      uint64_t v205 = [(POAgentAuthenticationProcess *)self registrationContext];
      uint64_t v206 = [v205 profile];
      v207 = [v206 accountDisplayName];
      v208 = [(POAgentAuthenticationProcess *)self registrationContext];
      v209 = [v208 extensionIdentifier];
      BOOL v210 = [(POAgentAuthenticationProcess *)self handleUserAuthorizationNeededForAccountDisplayName:v207 bundleIdentifier:v209];

      if (!v210)
      {
        id v78 = PO_LOG_POAgentAuthenticationProcess();
        if (!os_log_type_enabled(v78, OS_LOG_TYPE_INFO)) {
          goto LABEL_100;
        }
        *(_WORD *)buf = 0;
        v79 = "Authorization not provided, starting over.";
        goto LABEL_99;
      }
      goto LABEL_32;
    }
  }
LABEL_44:
  v80 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v80 userNotified];

  v81 = [(POAgentAuthenticationProcess *)self registrationContext];
  if (![v81 isRepair])
  {
    int v88 = 1;
    int v91 = 1;
LABEL_50:

    goto LABEL_51;
  }
  v82 = [(POAgentAuthenticationProcess *)self configurationManager];
  uint64_t v83 = [v82 currentDeviceConfiguration];

  if (v83)
  {
    __int16 v84 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E51000, v84, OS_LOG_TYPE_INFO, "Verifying device keys", buf, 2u);
    }

    v85 = (void *)MEMORY[0x263F5E650];
    BOOL v86 = [(POAgentAuthenticationProcess *)self configurationManager];
    v87 = [v86 currentDeviceConfiguration];
    int v88 = objc_msgSend(v85, "verifyKey:", objc_msgSend(v87, "deviceEncryptionKey"));

    v89 = (void *)MEMORY[0x263F5E650];
    v81 = [(POAgentAuthenticationProcess *)self configurationManager];
    v90 = [v81 currentDeviceConfiguration];
    int v91 = objc_msgSend(v89, "verifyKey:", objc_msgSend(v90, "deviceSigningKey"));

    goto LABEL_50;
  }
  int v88 = 1;
  int v91 = 1;
LABEL_51:
  v92 = [(POAgentAuthenticationProcess *)self registrationContext];
  if (![v92 isRepair])
  {
LABEL_56:

LABEL_57:
    v97 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v219 = "-[POAgentAuthenticationProcess _startDeviceRegistration]";
      __int16 v220 = 2112;
      uint64_t v221 = self;
      _os_log_impl(&dword_230E51000, v97, OS_LOG_TYPE_DEFAULT, "%s creating new device configuration on %@", buf, 0x16u);
    }

    v98 = [(POAgentAuthenticationProcess *)self configurationManager];
    v99 = [v98 currentDeviceConfiguration];
    v100 = v99;
    if (v99) {
      id v101 = v99;
    }
    else {
      id v101 = objc_alloc_init(MEMORY[0x263F5E608]);
    }
    id v102 = v101;

    [v102 setRegistrationCompleted:0];
    v103 = [(POAgentAuthenticationProcess *)self registrationContext];
    v104 = [v103 extensionIdentifier];
    [v102 setExtensionIdentifier:v104];

    v105 = [(POAgentAuthenticationProcess *)self registrationContext];
    objc_msgSend(v102, "setProtocolVersion:", objc_msgSend(v105, "protocolVersion"));

    v106 = [(POAgentAuthenticationProcess *)self registrationContext];
    v107 = [v106 profile];
    objc_msgSend(v102, "setCreateUsersEnabled:", objc_msgSend(v107, "createUsersEnabled"));

    v108 = [(POAgentAuthenticationProcess *)self registrationContext];
    v109 = [v108 profile];
    objc_msgSend(v102, "setAuthorizationEnabled:", objc_msgSend(v109, "authorizationEnabled"));

    v110 = [(POAgentAuthenticationProcess *)self registrationContext];
    v111 = [v110 profile];
    v112 = [v111 tokenToUserMapping];
    [v102 setTokenToUserMapping:v112];

    os_signpost_id_t v113 = [(POAgentAuthenticationProcess *)self registrationContext];
    v114 = [v113 profile];
    objc_msgSend(v102, "setNewUserAuthorizationMode:", objc_msgSend(v114, "newUserAuthorizationMode"));

    v115 = [(POAgentAuthenticationProcess *)self registrationContext];
    v116 = [v115 profile];
    objc_msgSend(v102, "setUserAuthorizationMode:", objc_msgSend(v116, "userAuthorizationMode"));

    v117 = [(POAgentAuthenticationProcess *)self registrationContext];
    v118 = [v117 profile];
    v119 = [v118 administratorGroups];
    [v102 setAdministratorGroups:v119];

    id v120 = [(POAgentAuthenticationProcess *)self registrationContext];
    v121 = [v120 profile];
    unint64_t v122 = [v121 authorizationGroups];
    [v102 setAuthorizationGroups:v122];

    id v123 = [(POAgentAuthenticationProcess *)self registrationContext];
    v124 = [v123 profile];
    char v125 = [v124 otherGroups];
    [v102 setOtherGroups:v125];

    v126 = [(POAgentAuthenticationProcess *)self registrationContext];
    v127 = [v126 profile];
    v128 = [v127 accountDisplayName];
    [v102 setAccountDisplayName:v128];

    v129 = [(POAgentAuthenticationProcess *)self registrationContext];
    v130 = [v129 profile];
    v131 = [v130 loginFrequency];
    [v102 setLoginFrequency:v131];

    v132 = [(POAgentAuthenticationProcess *)self registrationContext];
    v133 = [v132 ssoExtension];
    id v134 = [v133 sdkVersionString];
    [v102 setSdkVersionString:v134];

    id v135 = [(POAgentAuthenticationProcess *)self registrationContext];
    objc_msgSend(v102, "setLoginType:", (int)objc_msgSend(v135, "authMethod"));

    v136 = [(POAgentAuthenticationProcess *)self registrationContext];
    v137 = [v136 profile];
    objc_msgSend(v102, "setFileVaultPolicy:", objc_msgSend(v137, "fileVaultPolicy"));

    v138 = [(POAgentAuthenticationProcess *)self registrationContext];
    v139 = [v138 profile];
    objc_msgSend(v102, "setLoginPolicy:", objc_msgSend(v139, "loginPolicy"));

    v140 = [(POAgentAuthenticationProcess *)self registrationContext];
    v141 = [v140 profile];
    objc_msgSend(v102, "setUnlockPolicy:", objc_msgSend(v141, "unlockPolicy"));

    v142 = [(POAgentAuthenticationProcess *)self registrationContext];
    v143 = [v142 profile];
    objc_msgSend(v102, "setOfflineGracePeriod:", objc_msgSend(v143, "offlineGracePeriod"));

    v144 = [(POAgentAuthenticationProcess *)self registrationContext];
    v145 = [v144 profile];
    uint64_t v146 = [v145 nonPlatformSSOAccounts];
    [v102 setNonPlatformSSOAccounts:v146];

    v147 = [(POAgentAuthenticationProcess *)self registrationContext];
    v148 = [v147 profile];
    objc_msgSend(v102, "setRequireAuthGracePeriod:", objc_msgSend(v148, "requireAuthGracePeriod"));

    v149 = [MEMORY[0x263EFF910] date];
    [v102 setAuthGracePeriodStart:v149];

    if (![v102 deviceSigningKey]
      || ([(POAgentAuthenticationProcess *)self registrationContext],
          v150 = objc_claimAutoreleasedReturnValue(),
          char v151 = [v150 deviceKeysShouldChange],
          v150,
          (v151 & 1) != 0)
      || v91 != 1)
    {
      v152 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v152, OS_LOG_TYPE_INFO, "Creating new signing key", buf, 2u);
      }

      uint64_t v153 = [(POAgentAuthenticationProcess *)self registrationContext];
      v154 = [v153 ssoExtension];
      v155 = [(POAgentAuthenticationProcess *)self deviceSigningAlgorithmToUse:v154 deviceConfiguration:v102];
      v156 = [(POAgentAuthenticationProcess *)self registrationContext];
      [v156 setSigningAlgorithm:v155];

      v157 = (void *)MEMORY[0x263F5E650];
      BOOL v158 = [(POAgentAuthenticationProcess *)self registrationContext];
      id v159 = [v158 signingAlgorithm];
      uint64_t v160 = [(POAgentAuthenticationProcess *)self registrationContext];
      objc_msgSend(v102, "setDeviceSigningKey:", objc_msgSend(v157, "createSEPSigningKeyForAlgorithm:shared:", v159, objc_msgSend(v160, "useSharedDeviceKeys")));

      uint64_t v161 = [(POAgentAuthenticationProcess *)self registrationContext];
      objc_msgSend(v102, "setSharedDeviceKeys:", objc_msgSend(v161, "useSharedDeviceKeys"));

      unint64_t v162 = [(POAgentAuthenticationProcess *)self registrationContext];
      uint64_t v163 = [v162 signingAlgorithm];
      [v102 setSigningAlgorithm:v163];

      [v102 setPendingSigningAlgorithm:0];
    }
    if (![v102 deviceEncryptionKey]
      || ([(POAgentAuthenticationProcess *)self registrationContext],
          v164 = objc_claimAutoreleasedReturnValue(),
          char v165 = [v164 deviceKeysShouldChange],
          v164,
          (v165 & 1) != 0)
      || v88 != 1)
    {
      v166 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v166, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v166, OS_LOG_TYPE_INFO, "Creating new encryption key", buf, 2u);
      }

      v167 = [(POAgentAuthenticationProcess *)self registrationContext];
      BOOL v168 = [v167 ssoExtension];
      v169 = [(POAgentAuthenticationProcess *)self deviceEncryptionAlgorithmToUse:v168 deviceConfiguration:v102];
      v170 = [(POAgentAuthenticationProcess *)self registrationContext];
      [v170 setEncryptionAlgorithm:v169];

      CFDictionaryRef v171 = (void *)MEMORY[0x263F5E650];
      id v172 = [(POAgentAuthenticationProcess *)self registrationContext];
      v173 = [v172 encryptionAlgorithm];
      id v174 = [(POAgentAuthenticationProcess *)self registrationContext];
      objc_msgSend(v102, "setDeviceEncryptionKey:", objc_msgSend(v171, "createSEPEncryptionKeyForAlgorithm:shared:", v173, objc_msgSend(v174, "useSharedDeviceKeys")));

      id v175 = [MEMORY[0x263EFF910] date];
      [v102 setLastEncryptionKeyChange:v175];

      id v176 = [(POAgentAuthenticationProcess *)self registrationContext];
      objc_msgSend(v102, "setSharedDeviceKeys:", objc_msgSend(v176, "useSharedDeviceKeys"));

      v177 = [(POAgentAuthenticationProcess *)self registrationContext];
      v178 = [v177 encryptionAlgorithm];
      [v102 setEncryptionAlgorithm:v178];

      [v102 setPendingEncryptionAlgorithm:0];
    }
    v179 = [(POAgentAuthenticationProcess *)self registrationContext];
    int v180 = [v179 deviceKeysShouldChange];

    if (v180)
    {
      id v181 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v181, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v181, OS_LOG_TYPE_INFO, "Keys have changed", buf, 2u);
      }

      id v182 = [(POAgentAuthenticationProcess *)self registrationContext];
      [v182 setDeviceKeysShouldChange:0];
    }
    os_signpost_id_t v183 = [(POAgentAuthenticationProcess *)self configurationManager];
    [v183 setSharedOnly:0];

    id v184 = [(POAgentAuthenticationProcess *)self configurationManager];
    char v185 = [v184 saveDeviceConfigurationSyncAllConfigToPreboot:v102];

    if ((v185 & 1) == 0)
    {
      id v190 = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_377();
      [(POAgentAuthenticationProcess *)self handleDeviceAndUserRegistrationForRepair:1];

      return;
    }

    goto LABEL_80;
  }
  BOOL v93 = [(POAgentAuthenticationProcess *)self configurationManager];
  uint64_t v94 = [v93 currentDeviceConfiguration];
  if (!v94)
  {
LABEL_55:

    goto LABEL_56;
  }
  v95 = (void *)v94;
  BOOL v96 = [(POAgentAuthenticationProcess *)self registrationContext];
  if ([v96 deviceKeysShouldChange])
  {

    goto LABEL_55;
  }

  if ((v88 & v91 & 1) == 0) {
    goto LABEL_57;
  }
LABEL_80:
  id v186 = [(POAgentAuthenticationProcess *)self configurationManager];
  v187 = [v186 currentDeviceConfiguration];
  id v188 = [v187 pendingSigningAlgorithm];
  if (v188)
  {
    BOOL v189 = 1;
  }
  else
  {
    id v191 = [(POAgentAuthenticationProcess *)self configurationManager];
    id v192 = [v191 currentDeviceConfiguration];
    os_signpost_id_t v193 = [v192 pendingEncryptionAlgorithm];
    BOOL v189 = v193 != 0;
  }
  if (v189) {
    uint64_t v194 = v211 | 0x10;
  }
  else {
    uint64_t v194 = v211;
  }
  id v195 = [(POAgentAuthenticationProcess *)self distributedNotificationCenter];
  [v195 postNotificationName:@"com.apple.platformSSO.DeviceRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];

  char v196 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v196, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230E51000, v196, OS_LOG_TYPE_INFO, "Sending beginDeviceRegistration", buf, 2u);
  }

  v197 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v197 setOptions:v194];

  v198 = [(POAgentAuthenticationProcess *)self registrationContext];
  v199 = [v198 ssoExtension];
  v200 = [(POAgentAuthenticationProcess *)self registrationContext];
  id v201 = [v200 profile];
  id v202 = [v201 extensionData];
  v212[0] = MEMORY[0x263EF8330];
  v212[1] = 3221225472;
  v212[2] = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_383;
  v212[3] = &unk_264BBF478;
  v212[4] = self;
  v212[5] = v194;
  char v213 = v20;
  [v199 beginDeviceRegistrationUsingOptions:v194 extensionData:v202 completion:v212];
}

id __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Platform SSO extension not found in device registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_377()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save new device configuration during device registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

void __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_383(uint64_t a1, uint64_t a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [NSNumber numberWithInteger:a2];
    *(_DWORD *)buf = 138543362;
    id v45 = v5;
    _os_log_impl(&dword_230E51000, v4, OS_LOG_TYPE_INFO, "registrationResult = %{public}@", buf, 0xCu);
  }
  [MEMORY[0x263F5E5D8] analyticsForRegistrationType:@"device" options:*(void *)(a1 + 40) result:a2];
  switch(a2)
  {
    case 0:
      uint64_t v6 = [*(id *)(a1 + 32) configurationManager];
      id v7 = [v6 currentDeviceConfiguration];

      if (!v7)
      {
        id v33 = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_387();
LABEL_24:
        [*(id *)(a1 + 32) handleDeviceAndUserRegistrationForRepair:1];
        goto LABEL_21;
      }
      [v7 setRegistrationCompleted:1];
      id v8 = [*(id *)(a1 + 32) configurationManager];
      char v9 = [v8 saveDeviceConfiguration:v7];

      if ((v9 & 1) == 0)
      {
        id v34 = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_393();
        goto LABEL_24;
      }
      uint64_t v10 = [*(id *)(a1 + 32) registrationContext];
      char v11 = [v10 userIsPlatformSSOUser];

      if (v11)
      {
        id v12 = [*(id *)(a1 + 32) registrationContext];
        [v12 setState:6];

        id v13 = [*(id *)(a1 + 32) registrationContext];
        int v14 = [v13 userNotified];

        if (v14)
        {
          activity_block[0] = MEMORY[0x263EF8330];
          activity_block[1] = 3221225472;
          activity_block[2] = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_399;
          activity_block[3] = &unk_264BBF278;
          activity_block[4] = *(void *)(a1 + 32);
          _os_activity_initiate(&dword_230E51000, "PSSOUserRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
        }
        else
        {
          [*(id *)(a1 + 32) promptUserForRegistration];
        }

LABEL_20:
        id v7 = [*(id *)(a1 + 32) distributedNotificationCenter];
        [v7 postNotificationName:@"com.apple.platformSSO.DeviceRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];
      }
      else
      {
        os_signpost_id_t v35 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_383_cold_1();
        }

        SecKeyRef v36 = [*(id *)(a1 + 32) registrationContext];
        id v37 = [v36 ssoExtension];
        [v37 close];

        [*(id *)(a1 + 32) finishRegistrationWithStatus:1];
        char v38 = [*(id *)(a1 + 32) distributedNotificationCenter];
        [v38 postNotificationName:@"com.apple.platformSSO.DeviceRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];
      }
LABEL_21:

      return;
    case 1:
      os_signpost_id_t v15 = [*(id *)(a1 + 32) registrationContext];
      [v15 setRetry:1];

      int v16 = *(unsigned __int8 *)(a1 + 48);
      id v17 = [*(id *)(a1 + 32) registrationContext];
      uint64_t v18 = v17;
      if (v16) {
        uint64_t v19 = 3;
      }
      else {
        uint64_t v19 = 5;
      }
      [v17 setState:v19];

      int v20 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        id v45 = "-[POAgentAuthenticationProcess _startDeviceRegistration]_block_invoke_2";
        __int16 v46 = 2112;
        uint64_t v47 = v21;
        _os_log_impl(&dword_230E51000, v20, OS_LOG_TYPE_DEFAULT, "%s calling registrationDidComplete on %@", buf, 0x16u);
      }

      __int16 v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      os_signpost_id_t v23 = [v22 localizedStringForKey:@"REGISTRATION_FAILED_RETRY_TEXT" value:&stru_26E5C8990 table:0];

      char v24 = [*(id *)(a1 + 32) registrationContext];
      uint64_t v25 = [v24 ssoExtension];
      int v26 = v25;
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_403;
      v41[3] = &unk_264BBF450;
      v41[4] = *(void *)(a1 + 32);
      char v42 = *(unsigned char *)(a1 + 48);
      uint64_t v27 = v41;
      goto LABEL_19;
    case 2:
      id v28 = [*(id *)(a1 + 32) registrationContext];
      [v28 setState:3];

      [*(id *)(a1 + 32) promptUserForRegistration];
      goto LABEL_20;
    case 3:
      [*(id *)(a1 + 32) setRegistrationFailed:1];
      int v29 = [*(id *)(a1 + 32) registrationContext];
      [v29 setState:5];

      uint64_t v30 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        id v45 = "-[POAgentAuthenticationProcess _startDeviceRegistration]_block_invoke_2";
        __int16 v46 = 2112;
        uint64_t v47 = v31;
        _os_log_impl(&dword_230E51000, v30, OS_LOG_TYPE_DEFAULT, "%s calling registrationDidComplete on %@", buf, 0x16u);
      }

      int v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      os_signpost_id_t v23 = [v32 localizedStringForKey:@"REGISTRATION_FAILED_NO_RETRY_TEXT" value:&stru_26E5C8990 table:0];

      char v24 = [*(id *)(a1 + 32) registrationContext];
      uint64_t v25 = [v24 ssoExtension];
      int v26 = v25;
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_407;
      v39[3] = &unk_264BBF450;
      v39[4] = *(void *)(a1 + 32);
      char v40 = *(unsigned char *)(a1 + 48);
      uint64_t v27 = v39;
LABEL_19:
      [v25 registrationDidCompleteWithCompletion:v27];

      goto LABEL_20;
    case 10:
      return;
    default:
      goto LABEL_20;
  }
}

id __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_387()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"Failed to find device configuration after successful device registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_393()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save device configuration after successful device registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

uint64_t __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_399(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startUserRegistration];
}

void __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_403(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registrationContext];
  id v3 = [v2 ssoExtension];
  [v3 unload];

  id v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    [v4 promptUserForRegistration];
  }
  else
  {
    id v5 = [v4 registrationContext];
    uint64_t v6 = [v5 registrationUI];

    if (!v6)
    {
      id v7 = *(void **)(a1 + 32);
      [v7 setRegistrationContext:0];
    }
  }
}

void __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_407(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registrationContext];
  id v3 = [v2 ssoExtension];
  [v3 unload];

  if (!*(unsigned char *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) registrationContext];
    id v5 = [v4 registrationUI];

    if (!v5)
    {
      uint64_t v6 = *(void **)(a1 + 32);
      [v6 setRegistrationContext:0];
    }
  }
}

- (void)failDeviceRegistrationBeforeAuthorization
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    char v11 = "-[POAgentAuthenticationProcess failDeviceRegistrationBeforeAuthorization]";
    __int16 v12 = 2112;
    id v13 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v10, 0x16u);
  }

  id v4 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v4 setRetry:1];

  id v5 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v5 setState:5];

  uint64_t v6 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v6 setAuthorizationProvided:0];

  id v7 = [(POAgentAuthenticationProcess *)self registrationContext];
  id v8 = [v7 registrationUI];

  if (!v8) {
    [(POAgentAuthenticationProcess *)self promptUserForRegistration];
  }
  char v9 = [(POAgentAuthenticationProcess *)self distributedNotificationCenter];
  [v9 postNotificationName:@"com.apple.platformSSO.DeviceRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];
}

- (void)_startUserRegistration
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "New user binding failed.", v2, v3, v4, v5, v6);
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_411()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to create key durng user user registration because touchID or watch is not available."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_420()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save new user configuration during user registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

void __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_426(uint64_t a1, uint64_t a2)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  uint64_t v4 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [NSNumber numberWithInteger:a2];
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    int v88 = "-[POAgentAuthenticationProcess _startUserRegistration]_block_invoke";
    __int16 v89 = 2114;
    v90 = v5;
    __int16 v91 = 2112;
    uint64_t v92 = v6;
    _os_log_impl(&dword_230E51000, v4, OS_LOG_TYPE_DEFAULT, "%s registrationResult = %{public}@ on %@", buf, 0x20u);
  }
  [MEMORY[0x263F5E5D8] analyticsForRegistrationType:@"user" options:*(void *)(a1 + 40) result:a2];
  id v7 = [*(id *)(a1 + 32) registrationContext];
  id v8 = [v7 ssoExtension];
  [v8 close];

  switch(a2)
  {
    case 0:
      if ((*(unsigned char *)(a1 + 40) & 8) != 0)
      {
        char v9 = [*(id *)(a1 + 32) configurationManager];
        char v10 = [v9 removeUserDeviceConfiguration];

        if ((v10 & 1) == 0) {
          id v11 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_430();
        }
        __int16 v12 = [*(id *)(a1 + 32) configurationManager];
        char v13 = [v12 removeUserLoginConfiguration];

        if ((v13 & 1) == 0) {
          id v14 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_436();
        }
      }
      os_signpost_id_t v15 = [*(id *)(a1 + 32) configurationManager];
      int v16 = [v15 currentUserConfiguration];

      id v17 = [*(id *)(a1 + 32) registrationContext];
      int v18 = [v17 authMethod];

      if (v18 == 1)
      {
        uint64_t v19 = (void *)MEMORY[0x263F5E600];
        int v20 = [*(id *)(a1 + 32) registrationContext];
        uint64_t v21 = [v20 credentialContext];
        id v86 = 0;
        __int16 v22 = [v19 passwordDataFromContext:v21 error:&v86];
        id v23 = v86;

        if (v22)
        {
          char v24 = [*(id *)(a1 + 32) keyWrap];
          uint64_t v25 = [v24 wrapBlob:v22];
          objc_msgSend(v16, "set_credential:", v25);

          id v26 = v22;
          memset_s((void *)[v26 mutableBytes], objc_msgSend(v26, "length"), 0, objc_msgSend(v26, "length"));
          uint64_t v27 = [*(id *)(a1 + 32) configurationManager];
          LOBYTE(v25) = [v27 saveCurrentUserConfigurationAndSyncToPreboot:0];

          if ((v25 & 1) == 0) {
            id v28 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_446();
          }
        }
        else
        {
          v84[0] = MEMORY[0x263EF8330];
          v84[1] = 3221225472;
          v84[2] = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_442;
          v84[3] = &unk_264BBECA8;
          id v85 = v23;
          id v38 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_442((uint64_t)v84);
        }
      }
      else
      {
        id v23 = 0;
      }
      id v39 = [*(id *)(a1 + 32) registrationContext];
      char v40 = [v39 ssoExtension];
      uint64_t v41 = [v40 sdkVersionString];
      uint64_t v42 = [v41 compare:&unk_26E5D3418];

      v43 = [*(id *)(a1 + 32) registrationContext];
      char v44 = [v43 isNewPasswordUser];
      if (v42 == -1)
      {
        if (v44)
        {
          uint64_t v47 = 0;
        }
        else
        {
          id v54 = [*(id *)(a1 + 32) registrationContext];
          int v55 = [v54 isNewSmartCarddUser];

          uint64_t v47 = v55 ^ 1u;
        }

        uint64_t v56 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v57 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 136315394;
          int v88 = "-[POAgentAuthenticationProcess _startUserRegistration]_block_invoke";
          __int16 v89 = 2112;
          v90 = v57;
          _os_log_impl(&dword_230E51000, v56, OS_LOG_TYPE_DEFAULT, "%s calling registrationDidComplete on %@", buf, 0x16u);
        }

        id v58 = [*(id *)(a1 + 32) registrationContext];
        BOOL v59 = [v58 ssoExtension];
        v83[0] = MEMORY[0x263EF8330];
        v83[1] = 3221225472;
        v83[2] = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_452;
        v83[3] = &unk_264BBF278;
        v83[4] = *(void *)(a1 + 32);
        [v59 registrationDidCompleteWithCompletion:v83];

        [*(id *)(a1 + 32) setRegistrationFailed:0];
        id v60 = [*(id *)(a1 + 32) distributedNotificationCenter];
        [v60 postNotificationName:@"com.apple.platformSSO.UserRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];

        uint64_t v61 = [*(id *)(a1 + 32) registrationContext];
        [v61 setState:1];

        uint64_t v62 = [*(id *)(a1 + 32) configurationManager];
        v63 = [(id)v62 currentUserConfiguration];
        [v63 setState:v47];

        uint64_t v64 = [*(id *)(a1 + 32) configurationManager];
        LOBYTE(v62) = [v64 saveCurrentUserConfigurationAndSyncToPreboot:0];

        if ((v62 & 1) == 0) {
          id v65 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_2();
        }
        uint64_t v66 = [*(id *)(a1 + 32) registrationContext];
        int v67 = [v66 isRepair];

        id v68 = *(void **)(a1 + 32);
        if (v67)
        {
          uint64_t v69 = [v68 registrationContext];
          id v70 = [v69 credentialContext];
          [v68 performLoginForCurrentUserWithPasswordContext:v70];
        }
        else
        {
          [v68 performLoginForCurrentUserWithPasswordContext:0];
        }
      }
      else
      {
        if (v44)
        {
          id v45 = [*(id *)(a1 + 32) registrationContext];
          int v46 = [v45 newUserBindingComplete];

          if (v46) {
            goto LABEL_47;
          }
        }
        else
        {
        }
        uint64_t v48 = [*(id *)(a1 + 32) configurationManager];
        id v49 = [v48 currentDeviceConfiguration];
        if ([v49 supportsTokenUnlock])
        {
          char v50 = [*(id *)(a1 + 32) registrationContext];
          int v51 = [v50 authMethod];

          if (v51 == 1)
          {
            BOOL v52 = *(void **)(a1 + 32);
            v81[0] = MEMORY[0x263EF8330];
            v81[1] = 3221225472;
            v81[2] = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_458;
            v81[3] = &unk_264BBF388;
            v81[4] = v52;
            id v82 = v23;
            [v52 requestUserAuthenticationSyncPassword:1 completion:v81];

            goto LABEL_49;
          }
        }
        else
        {
        }
        int v53 = [*(id *)(a1 + 32) registrationContext];
        if ([v53 isNewPasswordUser])
        {

LABEL_47:
          id v73 = [*(id *)(a1 + 32) configurationManager];
          uint64_t v74 = [v73 currentUserConfiguration];
          [v74 setState:0];

LABEL_48:
          [*(id *)(a1 + 32) finishRegistrationWithStatus:1];
          goto LABEL_49;
        }
        id v71 = [*(id *)(a1 + 32) registrationContext];
        int v72 = [v71 isNewSmartCarddUser];

        if (v72) {
          goto LABEL_47;
        }
        id v75 = [*(id *)(a1 + 32) registrationContext];
        int v76 = [v75 authMethod];

        id v77 = *(void **)(a1 + 32);
        if (v76 != 1)
        {
          id v78 = [v77 configurationManager];
          v79 = [v78 currentUserConfiguration];
          [v79 setState:1];

          [*(id *)(a1 + 32) performLoginForCurrentUserWithPasswordContext:0];
          goto LABEL_48;
        }
        v80[0] = MEMORY[0x263EF8330];
        v80[1] = 3221225472;
        v80[2] = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_476;
        v80[3] = &unk_264BBF4A0;
        v80[4] = v77;
        [v77 requestUserAuthenticationSyncPassword:1 completion:v80];
      }
LABEL_49:

      return;
    case 1:
      [*(id *)(a1 + 32) finishRegistrationWithRetry];
      return;
    case 2:
      int v29 = [*(id *)(a1 + 32) registrationContext];
      [v29 setState:6];

      [*(id *)(a1 + 32) promptUserForRegistration];
      return;
    case 3:
      uint64_t v30 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        int v88 = "-[POAgentAuthenticationProcess _startUserRegistration]_block_invoke_2";
        __int16 v89 = 2112;
        v90 = v31;
        _os_log_impl(&dword_230E51000, v30, OS_LOG_TYPE_DEFAULT, "%s removing user configuration on %@", buf, 0x16u);
      }

      int v32 = [*(id *)(a1 + 32) registrationContext];
      if ([v32 isRetry])
      {
      }
      else
      {
        id v33 = [*(id *)(a1 + 32) configurationManager];
        id v34 = [*(id *)(a1 + 32) registrationContext];
        os_signpost_id_t v35 = [v34 userName];
        char v36 = [v33 removeUserConfigurationForUserName:v35];

        if ((v36 & 1) == 0) {
          id v37 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_478();
        }
      }
      [*(id *)(a1 + 32) finishRegistrationWithStatus:0];
      return;
    default:
      return;
  }
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_430()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to remove user device configuration after successful user registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_436()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to remove user login configuration after successful user registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_442(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to find user credential after successful user registration."];
  uint64_t v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_446()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after successful user registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

void __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_452(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registrationContext];
  uint64_t v3 = [v2 ssoExtension];
  [v3 unload];

  uint64_t v4 = [*(id *)(a1 + 32) registrationContext];
  uint64_t v5 = [v4 registrationUI];

  if (!v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    [v6 setRegistrationContext:0];
  }
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_2()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after successful SDK 13 user registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

void __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_458(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F10468]);
    uint64_t v4 = [*(id *)(a1 + 32) registrationContext];
    [v4 setCredentialContext:v3];

    uint64_t v5 = [*(id *)(a1 + 32) keyWrap];
    uint64_t v6 = [*(id *)(a1 + 32) configurationManager];
    id v7 = [v6 currentUserConfiguration];
    id v8 = [v7 _credential];
    char v9 = [v5 unwrapBlob:v8];

    if (v9)
    {
      [v3 setCredential:v9 type:-9];
      id v10 = v9;
      memset_s((void *)[v10 mutableBytes], objc_msgSend(v10, "length"), 0, objc_msgSend(v10, "length"));
      id v11 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_463;
      v17[3] = &unk_264BBF4A0;
      v17[4] = v11;
      [v11 handleKeyRequestWithCompletion:v17];
    }
    else
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_2_459;
      v18[3] = &unk_264BBECA8;
      id v19 = *(id *)(a1 + 40);
      id v16 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_2_459((uint64_t)v18);
      [*(id *)(a1 + 32) finishRegistrationWithRetry];
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRegistrationWithRetry];
    uint64_t v12 = [*(id *)(a1 + 32) configurationManager];
    char v13 = [(id)v12 currentUserConfiguration];
    [v13 setState:3];

    id v14 = [*(id *)(a1 + 32) configurationManager];
    LOBYTE(v12) = [v14 saveCurrentUserConfigurationAndSyncToPreboot:1];

    if ((v12 & 1) == 0) {
      id v15 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_470();
    }
  }
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_2_459(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to find user credential after successful authentication during user registration."];
  uint64_t v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

void __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_463(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2 == 1)
  {
    uint64_t v4 = [*(id *)(a1 + 32) registrationContext];
    uint64_t v5 = [v4 credentialContext];
    uint64_t v6 = [v3 handleTokenBindingWithPasswordContext:v5];

    id v7 = *(void **)(a1 + 32);
    if (v6 == 1)
    {
      [v7 finishRegistrationWithStatus:1];
      id v8 = [*(id *)(a1 + 32) configurationManager];
      char v9 = [v8 currentUserConfiguration];
      id v10 = v9;
      uint64_t v11 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
  }
  [v7 finishRegistrationWithRetry];
  id v8 = [*(id *)(a1 + 32) configurationManager];
  char v9 = [v8 currentUserConfiguration];
  id v10 = v9;
  uint64_t v11 = 3;
LABEL_6:
  [v9 setState:v11];

  uint64_t v12 = [*(id *)(a1 + 32) configurationManager];
  char v13 = [v12 saveCurrentUserConfigurationAndSyncToPreboot:1];

  if ((v13 & 1) == 0) {
    id v14 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_2_464();
  }
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_2_464()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after key request during user registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_470()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after failed authentication during user registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

uint64_t __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_476(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRegistrationWithStatus:1];
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_478()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to remove user configuration after failed no retry during user registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)failUserRegistrationBeforeAuthorization
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[POAgentAuthenticationProcess failUserRegistrationBeforeAuthorization]";
    __int16 v12 = 2112;
    char v13 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v4 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v4 setRetry:1];

  uint64_t v5 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v5 setState:8];

  uint64_t v6 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v6 setAuthorizationProvided:0];

  id v7 = [(POAgentAuthenticationProcess *)self registrationContext];
  id v8 = [v7 registrationUI];

  if (!v8) {
    [(POAgentAuthenticationProcess *)self promptUserForRegistration];
  }
  char v9 = [(POAgentAuthenticationProcess *)self distributedNotificationCenter];
  [v9 postNotificationName:@"com.apple.platformSSO.DeviceRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];
}

- (void)finishRegistrationWithStatus:(BOOL)a3
{
}

- (void)finishRegistrationWithStatus:(BOOL)a3 message:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [NSNumber numberWithBool:v4];
    *(_DWORD *)buf = 136315650;
    char v24 = "-[POAgentAuthenticationProcess finishRegistrationWithStatus:message:]";
    __int16 v25 = 2114;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = self;
    _os_log_impl(&dword_230E51000, v7, OS_LOG_TYPE_DEFAULT, "%s success = %{public}@ on %@", buf, 0x20u);
  }
  id v9 = v6;
  int v10 = v9;
  if (!v9)
  {
    int v10 = 0;
    if (!v4)
    {
      uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v10 = [v11 localizedStringForKey:@"REGISTRATION_FAILED_NO_RETRY_TEXT" value:&stru_26E5C8990 table:0];
    }
  }
  uint64_t v12 = [(POAgentAuthenticationProcess *)self registrationContext];
  char v13 = [(id)v12 ssoExtension];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __69__POAgentAuthenticationProcess_finishRegistrationWithStatus_message___block_invoke;
  v22[3] = &unk_264BBF278;
  v22[4] = self;
  [v13 registrationDidCompleteWithCompletion:v22];

  LOBYTE(v12) = !v4;
  [(POAgentAuthenticationProcess *)self setRegistrationFailed:v4 ^ 1];
  uint64_t v14 = [(POAgentAuthenticationProcess *)self registrationContext];
  id v15 = v14;
  if (v12)
  {
    int v20 = [v14 registrationUI];

    if (!v20) {
      [(POAgentAuthenticationProcess *)self showAlertMessage:v10 messageText:0 completion:0];
    }
  }
  else
  {
    [v14 setState:1];

    id v16 = [(POAgentAuthenticationProcess *)self configurationManager];
    uint64_t v17 = [v16 currentUserConfiguration];
    [(id)v17 setState:0];

    int v18 = [(POAgentAuthenticationProcess *)self configurationManager];
    LOBYTE(v17) = [v18 saveCurrentUserConfigurationAndSyncToPreboot:1];

    if ((v17 & 1) == 0) {
      id v19 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_446();
    }
  }
  uint64_t v21 = [(POAgentAuthenticationProcess *)self distributedNotificationCenter];
  [v21 postNotificationName:@"com.apple.platformSSO.UserRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];
}

void __69__POAgentAuthenticationProcess_finishRegistrationWithStatus_message___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registrationContext];
  id v3 = [v2 ssoExtension];
  [v3 unload];

  BOOL v4 = [*(id *)(a1 + 32) registrationContext];
  uint64_t v5 = [v4 registrationUI];

  if (!v5)
  {
    id v6 = *(void **)(a1 + 32);
    [v6 setRegistrationContext:0];
  }
}

- (void)finishRegistrationWithRetry
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    char v24 = "-[POAgentAuthenticationProcess finishRegistrationWithRetry]";
    __int16 v25 = 2112;
    id v26 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  BOOL v4 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v4 setRetry:1];

  uint64_t v5 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v5 setState:8];

  id v6 = [(POAgentAuthenticationProcess *)self configurationManager];
  uint64_t v7 = [v6 currentUserConfiguration];
  [(id)v7 setState:2];

  id v8 = [(POAgentAuthenticationProcess *)self configurationManager];
  LOBYTE(v7) = [v8 saveCurrentUserConfigurationAndSyncToPreboot:1];

  if ((v7 & 1) == 0) {
    id v9 = __59__POAgentAuthenticationProcess_finishRegistrationWithRetry__block_invoke();
  }
  int v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"REGISTRATION_FAILED_RETRY_TEXT" value:&stru_26E5C8990 table:0];

  uint64_t v12 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    char v24 = "-[POAgentAuthenticationProcess finishRegistrationWithRetry]";
    __int16 v25 = 2112;
    id v26 = self;
    _os_log_impl(&dword_230E51000, v12, OS_LOG_TYPE_DEFAULT, "%s calling registrationDidComplete on %@", buf, 0x16u);
  }

  char v13 = [(POAgentAuthenticationProcess *)self registrationContext];
  uint64_t v14 = [v13 ssoExtension];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __59__POAgentAuthenticationProcess_finishRegistrationWithRetry__block_invoke_491;
  int v20 = &unk_264BBF4F0;
  uint64_t v21 = self;
  id v22 = v11;
  id v15 = v11;
  [v14 registrationDidCompleteWithCompletion:&v17];

  id v16 = [(POAgentAuthenticationProcess *)self distributedNotificationCenter];
  [v16 postNotificationName:@"com.apple.platformSSO.UserRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];
}

id __59__POAgentAuthenticationProcess_finishRegistrationWithRetry__block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after failed user registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

uint64_t __59__POAgentAuthenticationProcess_finishRegistrationWithRetry__block_invoke_491(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registrationContext];
  id v3 = [v2 registrationUI];

  if (!v3) {
    [*(id *)(a1 + 32) showAlertMessage:*(void *)(a1 + 40) messageText:0 completion:0];
  }
  BOOL v4 = *(void **)(a1 + 32);

  return [v4 promptUserForRegistration];
}

- (void)handleDeviceAndUserRegistrationForRepair:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[POAgentAuthenticationProcess handleDeviceAndUserRegistrationForRepair:]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  [(POAgentAuthenticationProcess *)self handleDeviceAndUserRegistrationForRepair:v3 newPasswordUser:0 newSmartCardUser:0 notified:0 profile:0];
}

- (void)handleDeviceAndUserRegistrationForRepair:(BOOL)a3 newPasswordUser:(BOOL)a4 newSmartCardUser:(BOOL)a5 notified:(BOOL)a6 profile:(id)a7
{
  BOOL v7 = a6;
  uint64_t v8 = a5;
  uint64_t v9 = a4;
  BOOL v10 = a3;
  uint64_t v100 = *MEMORY[0x263EF8340];
  uint64_t v12 = (POProfile *)a7;
  char v13 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v97 = "-[POAgentAuthenticationProcess handleDeviceAndUserRegistrationForRepair:newPasswordUser:newSmartCardUser:notified:profile:]";
    __int16 v98 = 2112;
    v99 = self;
    _os_log_impl(&dword_230E51000, v13, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  uint64_t v14 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
  v95 = @"com.apple.PlatformSSO.registration";
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v95 count:1];
  [v14 removeDeliveredNotificationsWithIdentifiers:v15];

  id v16 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
  uint64_t v94 = @"com.apple.PlatformSSO.registration";
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v94 count:1];
  [v16 removePendingNotificationRequestsWithIdentifiers:v17];

  uint64_t v18 = [(POAgentAuthenticationProcess *)self registrationContext];
  if (v18)
  {
    id v19 = (void *)v18;
    int v20 = [(POAgentAuthenticationProcess *)self registrationContext];
    if ([v20 state] == 5)
    {
LABEL_9:

      goto LABEL_10;
    }
    BOOL v21 = v10;
    id v22 = [(POAgentAuthenticationProcess *)self registrationContext];
    if ([v22 state] == 3)
    {
LABEL_8:

      BOOL v10 = v21;
      goto LABEL_9;
    }
    unsigned int v90 = v9;
    uint64_t v23 = v8;
    BOOL v24 = v7;
    __int16 v25 = [(POAgentAuthenticationProcess *)self registrationContext];
    if ([v25 state] == 8)
    {

      BOOL v7 = v24;
      uint64_t v8 = v23;
      uint64_t v9 = v90;
      goto LABEL_8;
    }
    id v85 = [(POAgentAuthenticationProcess *)self registrationContext];
    uint64_t v89 = [v85 state];

    BOOL v7 = v24;
    uint64_t v8 = v23;
    uint64_t v9 = v90;
    BOOL v10 = v21;
    if (v89 != 6)
    {
      uint64_t v30 = PO_LOG_POAgentAuthenticationProcess();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
        goto LABEL_41;
      }
      id v86 = NSNumber;
      v87 = [(POAgentAuthenticationProcess *)self registrationContext];
      objc_msgSend(v86, "numberWithInteger:", objc_msgSend(v87, "state"));
      int v88 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v97 = v88;
      _os_log_impl(&dword_230E51000, v30, OS_LOG_TYPE_INFO, "registration already in progress: %{public}@", buf, 0xCu);

LABEL_40:
      goto LABEL_41;
    }
  }
LABEL_10:
  if (!v12)
  {
    id v26 = [POProfile alloc];
    uint64_t v27 = [(POAgentAuthenticationProcess *)self configurationHost];
    id v28 = [v27 validatedProfileForPlatformSSO];
    uint64_t v12 = [(POProfile *)v26 initWithProfile:v28];

    if (!v12)
    {
      id v66 = __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke();
      return;
    }
  }
  uint64_t v29 = [(POProfile *)v12 extensionBundleIdentifier];
  uint64_t v30 = [(POAgentAuthenticationProcess *)self loadSSOExtensionWithExtensionBundleIdentifier:v29];

  if (!v30)
  {
    id v33 = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke();
    goto LABEL_41;
  }
  uint64_t v31 = [(POAgentAuthenticationProcess *)self ssoMethodToUse:v30 profile:v12];
  if (v31 != 1000)
  {
    uint64_t v34 = v31;
    BOOL v91 = v10;
    os_signpost_id_t v35 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      -[POAgentAuthenticationProcess handleDeviceAndUserRegistrationForRepair:newPasswordUser:newSmartCardUser:notified:profile:](v34, v35);
    }

    char v36 = objc_alloc_init(PORegistrationContext);
    [(POAgentAuthenticationProcess *)self setRegistrationContext:v36];

    id v37 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v37 setState:4];

    id v38 = [(POProfile *)v12 extensionBundleIdentifier];
    id v39 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v39 setExtensionIdentifier:v38];

    char v40 = [(POProfile *)v12 registrationToken];
    uint64_t v41 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v41 setRegistrationToken:v40];

    uint64_t v42 = [v30 containerAppBundleIdentifier];
    v43 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v43 setContainerAppBundleIdentifier:v42];

    char v44 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v44 setAuthMethod:v34];

    id v45 = NSUserName();
    int v46 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v46 setUserName:v45];

    uint64_t v47 = [(POAgentAuthenticationProcess *)self configurationManager];
    uint64_t v48 = NSUserName();
    uint64_t v49 = [v47 isPlatformSSOUserName:v48];
    char v50 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v50 setUserIsPlatformSSOUser:v49];

    int v51 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v51 setRepair:v91];

    BOOL v52 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v52 setNewPasswordUser:v9];

    int v53 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v53 setNewSmartCardUser:v8];

    id v54 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v54 setUserNotified:v7];

    int v55 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v55 setSsoExtension:v30];

    uint64_t v56 = [(POAgentAuthenticationProcess *)self registrationContext];
    uint64_t v57 = [v56 ssoExtension];
    [v57 setDelegate:self];

    uint64_t v58 = [(POProfile *)v12 useSharedDeviceKeys];
    BOOL v59 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v59 setUseSharedDeviceKeys:v58];

    uint64_t v60 = [v30 protocolVersion];
    uint64_t v61 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v61 setProtocolVersion:v60];

    uint64_t v62 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v62 setProfile:v12];

    v63 = [(POAgentAuthenticationProcess *)self configurationManager];
    uint64_t v64 = [v63 currentUserConfiguration];
    if (v64)
    {
      uint64_t v8 = [(POAgentAuthenticationProcess *)self configurationManager];
      uint64_t v9 = [(id)v8 currentUserConfiguration];
      BOOL v65 = [(id)v9 state] == 5;
    }
    else
    {
      BOOL v65 = 0;
    }
    int v67 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v67 setUserSEPKeyInvalid:v65];

    if (v64)
    {
    }
    id v68 = [(POAgentAuthenticationProcess *)self configurationManager];
    uint64_t v69 = [v68 currentDeviceConfiguration];

    if (v69)
    {
      BOOL v70 = [(POProfile *)v12 useSharedDeviceKeys];
      id v71 = [(POAgentAuthenticationProcess *)self configurationManager];
      int v72 = [v71 currentDeviceConfiguration];
      uint64_t v73 = v70 ^ [v72 sharedDeviceKeys];
      uint64_t v74 = [(POAgentAuthenticationProcess *)self registrationContext];
      [v74 setDeviceKeysShouldChange:v73];
    }
    else
    {
      id v71 = [(POAgentAuthenticationProcess *)self registrationContext];
      [v71 setDeviceKeysShouldChange:1];
    }

    id v75 = [(POAgentAuthenticationProcess *)self registrationContext];
    if ([v75 useSharedDeviceKeys])
    {
      int v76 = [(POAgentAuthenticationProcess *)self configurationManager];
      id v77 = [v76 userDeviceConfiguration];

      if (!v77)
      {
LABEL_31:
        id v78 = [(POAgentAuthenticationProcess *)self registrationContext];
        int v79 = [v78 userNotified];

        if (v79)
        {
          activity_block[0] = MEMORY[0x263EF8330];
          activity_block[1] = 3221225472;
          activity_block[2] = __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_507;
          activity_block[3] = &unk_264BBF278;
          activity_block[4] = self;
          _os_activity_initiate(&dword_230E51000, "PSSODeviceRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
        }
        else
        {
          v80 = [(POAgentAuthenticationProcess *)self registrationContext];
          v81 = [v80 registrationToken];

          id v82 = [(POAgentAuthenticationProcess *)self registrationContext];
          uint64_t v83 = v82;
          if (v81)
          {
            [v82 setState:4];

            __int16 v84 = dispatch_get_global_queue(0, 0);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_2;
            block[3] = &unk_264BBF278;
            block[4] = self;
            dispatch_async(v84, block);
          }
          else
          {
            [v82 setState:3];

            [(POAgentAuthenticationProcess *)self promptUserForRegistration];
          }
        }
        v87 = [(POAgentAuthenticationProcess *)self distributedNotificationCenter];
        [v87 postNotificationName:@"com.apple.platformSSO.DeviceRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];
        goto LABEL_40;
      }
      id v75 = [(POAgentAuthenticationProcess *)self registrationContext];
      [v75 setMigratingDeviceKeys:1];
    }

    goto LABEL_31;
  }
  id v32 = __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_500();
LABEL_41:
}

id __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"No platform SSO Profiles in device registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_500()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"No supported authentication methods in device registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

uint64_t __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_507(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registrationContext];
  [v2 setState:4];

  BOOL v3 = *(void **)(a1 + 32);

  return [v3 showRegistrationUI];
}

void __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_2(uint64_t a1)
{
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_3;
  activity_block[3] = &unk_264BBF278;
  activity_block[4] = *(void *)(a1 + 32);
  _os_activity_initiate(&dword_230E51000, "PSSODeviceRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDeviceRegistration];
}

- (void)handleUserRegistrationForUser:(id)a3 repair:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[POAgentAuthenticationProcess handleUserRegistrationForUser:repair:]";
    __int16 v10 = 2112;
    uint64_t v11 = self;
    _os_log_impl(&dword_230E51000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v8, 0x16u);
  }

  [(POAgentAuthenticationProcess *)self handleUserRegistrationForUser:v6 repair:v4 newPasswordUser:0 newSmartCardUser:0 notified:0 profile:0];
}

- (void)handleUserRegistrationForUser:(id)a3 repair:(BOOL)a4 newPasswordUser:(BOOL)a5 newSmartCardUser:(BOOL)a6 notified:(BOOL)a7 profile:(id)a8
{
  BOOL v9 = a7;
  uint64_t v10 = a6;
  BOOL v90 = a5;
  BOOL v11 = a4;
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v13 = a3;
  uint64_t v14 = (POProfile *)a8;
  id v15 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [NSNumber numberWithBool:v90];
    uint64_t v17 = [NSNumber numberWithBool:v10];
    *(_DWORD *)buf = 136315906;
    BOOL v96 = "-[POAgentAuthenticationProcess handleUserRegistrationForUser:repair:newPasswordUser:newSmartCardUser:notified:profile:]";
    __int16 v97 = 2114;
    __int16 v98 = v16;
    __int16 v99 = 2114;
    uint64_t v100 = v17;
    __int16 v101 = 2112;
    id v102 = self;
    _os_log_impl(&dword_230E51000, v15, OS_LOG_TYPE_DEFAULT, "%s New Password User = %{public}@, New SmartCard User = %{public}@ on %@", buf, 0x2Au);
  }
  uint64_t v18 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
  uint64_t v94 = @"com.apple.PlatformSSO.registration";
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v94 count:1];
  [v18 removeDeliveredNotificationsWithIdentifiers:v19];

  int v20 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
  uint64_t v93 = @"com.apple.PlatformSSO.registration";
  BOOL v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v93 count:1];
  [v20 removePendingNotificationRequestsWithIdentifiers:v21];

  id v22 = [(POAgentAuthenticationProcess *)self configurationManager];
  uint64_t v23 = [v22 currentDeviceConfiguration];
  char v24 = [v23 registrationCompleted];

  if ((v24 & 1) == 0)
  {
    id v28 = __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke();
LABEL_40:

    goto LABEL_41;
  }
  uint64_t v25 = [(POAgentAuthenticationProcess *)self registrationContext];
  if (v25)
  {
    id v26 = (void *)v25;
    uint64_t v27 = [(POAgentAuthenticationProcess *)self registrationContext];
    if ([v27 state] == 8)
    {
    }
    else
    {
      uint64_t v29 = [(POAgentAuthenticationProcess *)self registrationContext];
      int v30 = v10;
      uint64_t v10 = [v29 state];

      BOOL v31 = v10 == 6;
      LODWORD(v10) = v30;
      if (!v31)
      {
        uint64_t v74 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          int v76 = NSNumber;
          id v77 = [(POAgentAuthenticationProcess *)self registrationContext];
          objc_msgSend(v76, "numberWithInteger:", objc_msgSend(v77, "state"));
          id v78 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          BOOL v96 = v78;
          _os_log_impl(&dword_230E51000, v74, OS_LOG_TYPE_INFO, "User registration already in progress: %{public}@", buf, 0xCu);
        }
        goto LABEL_40;
      }
    }
  }
  if (v14) {
    goto LABEL_12;
  }
  id v32 = [POProfile alloc];
  id v33 = [(POAgentAuthenticationProcess *)self configurationHost];
  uint64_t v34 = [v33 validatedProfileForPlatformSSO];
  uint64_t v14 = [(POProfile *)v32 initWithProfile:v34];

  if (v14)
  {
LABEL_12:
    os_signpost_id_t v35 = [(POProfile *)v14 extensionBundleIdentifier];
    char v36 = [(POAgentAuthenticationProcess *)self loadSSOExtensionWithExtensionBundleIdentifier:v35];

    if (!v36)
    {
      id v39 = __50__POAgentAuthenticationProcess_showRegistrationUI__block_invoke();
      goto LABEL_39;
    }
    uint64_t v37 = [(POAgentAuthenticationProcess *)self ssoMethodToUse:v36 profile:v14];
    if (v37 == 1000)
    {
      id v38 = __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_522();
LABEL_39:

      goto LABEL_40;
    }
    uint64_t v40 = v37;
    unsigned int v89 = v10;
    uint64_t v41 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
      -[POAgentAuthenticationProcess handleDeviceAndUserRegistrationForRepair:newPasswordUser:newSmartCardUser:notified:profile:](v40, v41);
    }

    uint64_t v42 = objc_alloc_init(PORegistrationContext);
    [(POAgentAuthenticationProcess *)self setRegistrationContext:v42];

    v43 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v43 setState:7];

    char v44 = [(POProfile *)v14 extensionBundleIdentifier];
    id v45 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v45 setExtensionIdentifier:v44];

    int v46 = [(POProfile *)v14 registrationToken];
    uint64_t v47 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v47 setRegistrationToken:v46];

    uint64_t v48 = [v36 containerAppBundleIdentifier];
    uint64_t v49 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v49 setContainerAppBundleIdentifier:v48];

    char v50 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v50 setAuthMethod:v40];

    int v51 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v51 setRepair:v11];

    BOOL v52 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v52 setNewPasswordUser:v90];

    int v53 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v53 setNewSmartCardUser:v89];

    id v54 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v54 setUserNotified:v9];

    int v55 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v55 setLoginUserName:v13];

    uint64_t v56 = NSUserName();
    uint64_t v57 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v57 setUserName:v56];

    uint64_t v58 = [(POAgentAuthenticationProcess *)self configurationManager];
    BOOL v59 = NSUserName();
    uint64_t v60 = [v58 isPlatformSSOUserName:v59];
    uint64_t v61 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v61 setUserIsPlatformSSOUser:v60];

    uint64_t v62 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v62 setState:6];

    v63 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v63 setSsoExtension:v36];

    uint64_t v64 = [(POAgentAuthenticationProcess *)self registrationContext];
    BOOL v65 = [v64 ssoExtension];
    [v65 setDelegate:self];

    uint64_t v66 = [(POProfile *)v14 useSharedDeviceKeys];
    int v67 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v67 setUseSharedDeviceKeys:v66];

    uint64_t v68 = [v36 protocolVersion];
    uint64_t v69 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v69 setProtocolVersion:v68];

    BOOL v70 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v70 setProfile:v14];

    id v71 = [(POAgentAuthenticationProcess *)self configurationManager];
    int v72 = [v71 currentUserConfiguration];
    if (v72)
    {
      uint64_t v61 = [(POAgentAuthenticationProcess *)self configurationManager];
      uint64_t v49 = [v61 currentUserConfiguration];
      BOOL v73 = [v49 state] == 5;
    }
    else
    {
      BOOL v73 = 0;
    }
    v80 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v80 setUserSEPKeyInvalid:v73];

    if (v72)
    {
    }
    v81 = [(POAgentAuthenticationProcess *)self registrationContext];
    if ([v81 useSharedDeviceKeys])
    {
      id v82 = [(POAgentAuthenticationProcess *)self configurationManager];
      uint64_t v83 = [v82 userDeviceConfiguration];

      unsigned int v84 = v89;
      if (!v83) {
        goto LABEL_32;
      }
      v81 = [(POAgentAuthenticationProcess *)self registrationContext];
      [v81 setMigratingDeviceKeys:1];
    }
    else
    {
      unsigned int v84 = v89;
    }

LABEL_32:
    id v85 = [(POAgentAuthenticationProcess *)self registrationContext];
    int v86 = [v85 userNotified];

    if (v86)
    {
      v92[0] = MEMORY[0x263EF8330];
      v92[1] = 3221225472;
      v92[2] = __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_528;
      v92[3] = &unk_264BBF278;
      v92[4] = self;
      v87 = v92;
    }
    else
    {
      if (!v90 && !v84)
      {
        int v88 = [(POAgentAuthenticationProcess *)self registrationContext];
        [v88 setState:6];

        [(POAgentAuthenticationProcess *)self promptUserForRegistration];
        goto LABEL_39;
      }
      activity_block[0] = MEMORY[0x263EF8330];
      activity_block[1] = 3221225472;
      activity_block[2] = __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_2;
      activity_block[3] = &unk_264BBF278;
      activity_block[4] = self;
      v87 = activity_block;
    }
    _os_activity_initiate(&dword_230E51000, "PSSOUserRegistration", OS_ACTIVITY_FLAG_DEFAULT, v87);
    goto LABEL_39;
  }
  id v79 = __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_513();
LABEL_41:
}

id __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Device registration not complete in user registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_513()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"No platform SSO Profiles in user registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_522()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"No supported authentication methods in user registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

uint64_t __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_528(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registrationContext];
  [v2 setState:7];

  BOOL v3 = *(void **)(a1 + 32);

  return [v3 showRegistrationUI];
}

uint64_t __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startUserRegistration];
}

- (void)promptUserForRegistration
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "There is not an active Platform SSO registration.", v2, v3, v4, v5, v6);
}

void __57__POAgentAuthenticationProcess_promptUserForRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (v2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __57__POAgentAuthenticationProcess_promptUserForRegistration__block_invoke_2;
    v5[3] = &unk_264BBECA8;
    id v6 = v2;
    id v4 = __57__POAgentAuthenticationProcess_promptUserForRegistration__block_invoke_2((uint64_t)v5);
  }
}

id __57__POAgentAuthenticationProcess_promptUserForRegistration__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error sending local notification for registration."];
  id v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (void)checkIfPlatformSSOIsActive
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "no existing device configuration", v2, v3, v4, v5, v6);
}

- (void)configurationChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    uint64_t v12 = "-[POAgentAuthenticationProcess configurationChanged:]";
    __int16 v13 = 2112;
    uint64_t v14 = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v11, 0x16u);
  }

  uint8_t v6 = [v4 userInfo];

  BOOL v7 = [v6 objectForKeyedSubscript:@"reason"];
  uint64_t v8 = [v7 integerValue];
  BOOL v9 = PO_LOG_POAgentAuthenticationProcess();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8 == 2)
  {
    if (v10) {
      -[POAgentAuthenticationProcess configurationChanged:]();
    }
  }
  else
  {
    if (v10) {
      -[POAgentAuthenticationProcess configurationChanged:]();
    }

    [(POAgentAuthenticationProcess *)self configurationChanged];
  }
}

- (void)configurationChanged
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v7 = "-[POAgentAuthenticationProcess configurationChanged]";
    __int16 v8 = 2112;
    BOOL v9 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__POAgentAuthenticationProcess_configurationChanged__block_invoke;
  block[3] = &unk_264BBF278;
  block[4] = self;
  dispatch_async(v4, block);
}

void __52__POAgentAuthenticationProcess_configurationChanged__block_invoke(uint64_t a1)
{
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __52__POAgentAuthenticationProcess_configurationChanged__block_invoke_2;
  activity_block[3] = &unk_264BBF278;
  activity_block[4] = *(void *)(a1 + 32);
  _os_activity_initiate(&dword_230E51000, "configurationChanged", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __52__POAgentAuthenticationProcess_configurationChanged__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) keyBag];
  int v3 = [v2 isUserKeybagUnlocked];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    return [v4 handleConfigurationChanged:0];
  }
  else
  {
    return [v4 setShouldRunConfigurationChangeWhenUnlocked:1];
  }
}

- (void)handleConfigurationChanged:(BOOL)a3
{
}

- (void)handleConfigurationChanged:(BOOL)a3 startup:(BOOL)a4
{
  BOOL v79 = a4;
  uint64_t v97 = *MEMORY[0x263EF8340];
  uint64_t v5 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v94 = "-[POAgentAuthenticationProcess handleConfigurationChanged:startup:]";
    __int16 v95 = 2112;
    BOOL v96 = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  uint8_t v6 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230E51000, v6, OS_LOG_TYPE_INFO, "Configuration changed", buf, 2u);
  }

  [(POAgentAuthenticationProcess *)self setShouldRunConfigurationChangeWhenUnlocked:0];
  BOOL v7 = [(POAgentAuthenticationProcess *)self platformSSOActiveLock];
  objc_sync_enter(v7);
  __int16 v8 = [(POAgentAuthenticationProcess *)self configurationManager];
  BOOL v9 = [v8 currentDeviceConfiguration];

  if (!v9)
  {
    uint64_t v10 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[POAgentAuthenticationProcess handleConfigurationChanged:startup:]();
    }
  }
  int v11 = [(POAgentAuthenticationProcess *)self configurationManager];
  uint64_t v12 = [v11 currentUserConfiguration];

  if (!v12)
  {
    __int16 v13 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[POAgentAuthenticationProcess handleConfigurationChanged:startup:]();
    }
  }
  uint64_t v14 = [(POAgentAuthenticationProcess *)self configurationManager];
  uint64_t v15 = [v14 currentLoginConfiguration];

  if (v15) {
    goto LABEL_17;
  }
  id v16 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess handleConfigurationChanged:startup:]();
  }

  if (v9 != 0 || v12 != 0)
  {
LABEL_17:
    int v17 = 1;
    [(POAgentAuthenticationProcess *)self setPlatformSSOActive:1];
  }
  else
  {
    int v17 = 0;
  }
  uint64_t v18 = [v9 extensionIdentifier];
  if (v18
    || ([(POAgentAuthenticationProcess *)self registrationContext],
        id v19 = objc_claimAutoreleasedReturnValue(),
        [v19 extensionIdentifier],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18))
  {
    int v20 = [(POAgentAuthenticationProcess *)self configurationHost];
    int v21 = [v20 hasAnyMDMProfileForExtension:v18];

    if ((v17 & (v21 ^ 1)) != 0)
    {
      id v22 = PO_LOG_POAgentAuthenticationProcess();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E51000, v22, OS_LOG_TYPE_INFO, "Removing registration", buf, 2u);
      }

      [(POAgentAuthenticationProcess *)self handleRemovingRegistrationForExtension:v18 alreadyDeleted:0];
      uint64_t v15 = 0;
      uint64_t v12 = 0;
      BOOL v9 = 0;
    }
  }

  objc_sync_exit(v7);
  uint64_t v23 = [POProfile alloc];
  char v24 = [(POAgentAuthenticationProcess *)self configurationHost];
  uint64_t v25 = [v24 validatedProfileForPlatformSSO];
  id v26 = [(POProfile *)v23 initWithProfile:v25];

  if (v26)
  {
    uint64_t v27 = [(POProfile *)v26 extensionBundleIdentifier];
    id v28 = [(POAgentAuthenticationProcess *)self loadSSOExtensionWithExtensionBundleIdentifier:v27];

    if (!v28)
    {
      id v31 = __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_542();
      goto LABEL_32;
    }
    if (([v28 canPerformRegistration] & 1) == 0)
    {
      id v32 = __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_548();
      goto LABEL_32;
    }
    int v78 = [(POAgentAuthenticationProcess *)self ssoMethodToUse:v28 profile:v26];
    if (v78 == 1000)
    {
      id v29 = __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_554();
      goto LABEL_32;
    }
    if (![(POProfile *)v26 useSharedDeviceKeys]
      && ([(POProfile *)v26 createUsersEnabled]
       || [(POProfile *)v26 authorizationEnabled]))
    {
      id v67 = __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_560();
      goto LABEL_32;
    }
    id v33 = [(POAgentAuthenticationProcess *)self platformSSOActiveLock];
    objc_sync_enter(v33);
    [(POAgentAuthenticationProcess *)self setPlatformSSOActive:1];
    objc_sync_exit(v33);

    if (v9)
    {
      uint64_t v34 = [(POAgentAuthenticationProcess *)self deviceSigningAlgorithmToUse:v28 deviceConfiguration:v9];
      os_signpost_id_t v35 = [v9 signingAlgorithm];
      char v36 = [v34 isEqualToNumber:v35];

      if ((v36 & 1) == 0) {
        [v9 setPendingSigningAlgorithm:v34];
      }
      uint64_t v37 = [(POAgentAuthenticationProcess *)self deviceEncryptionAlgorithmToUse:v28 deviceConfiguration:v9];
      id v38 = [v9 encryptionAlgorithm];
      char v39 = [v37 isEqualToNumber:v38];

      if ((v39 & 1) == 0) {
        [v9 setPendingEncryptionAlgorithm:v37];
      }
      objc_msgSend(v9, "setCreateUsersEnabled:", -[POProfile createUsersEnabled](v26, "createUsersEnabled"));
      objc_msgSend(v9, "setAuthorizationEnabled:", -[POProfile authorizationEnabled](v26, "authorizationEnabled"));
      uint64_t v40 = [(POProfile *)v26 tokenToUserMapping];
      [v9 setTokenToUserMapping:v40];

      objc_msgSend(v9, "setNewUserAuthorizationMode:", -[POProfile newUserAuthorizationMode](v26, "newUserAuthorizationMode"));
      objc_msgSend(v9, "setUserAuthorizationMode:", -[POProfile userAuthorizationMode](v26, "userAuthorizationMode"));
      uint64_t v41 = [(POProfile *)v26 accountDisplayName];
      [v9 setAccountDisplayName:v41];

      uint64_t v42 = [(POProfile *)v26 loginFrequency];
      [v9 setLoginFrequency:v42];

      v43 = [v28 sdkVersionString];
      [v9 setSdkVersionString:v43];

      objc_msgSend(v9, "setProtocolVersion:", objc_msgSend(v28, "protocolVersion"));
      [v9 setLoginType:v78];
      objc_msgSend(v9, "setFileVaultPolicy:", -[POProfile fileVaultPolicy](v26, "fileVaultPolicy"));
      objc_msgSend(v9, "setLoginPolicy:", -[POProfile loginPolicy](v26, "loginPolicy"));
      objc_msgSend(v9, "setUnlockPolicy:", -[POProfile unlockPolicy](v26, "unlockPolicy"));
      objc_msgSend(v9, "setOfflineGracePeriod:", -[POProfile offlineGracePeriod](v26, "offlineGracePeriod"));
      char v44 = [(POProfile *)v26 nonPlatformSSOAccounts];
      [v9 setNonPlatformSSOAccounts:v44];

      objc_msgSend(v9, "setRequireAuthGracePeriod:", -[POProfile requireAuthGracePeriod](v26, "requireAuthGracePeriod"));
      uint64_t v45 = [v9 fileVaultPolicy];
      if (v45 != [(POProfile *)v26 fileVaultPolicy]
        && ([(POProfile *)v26 fileVaultPolicy] & 8) != 0
        || (uint64_t v46 = [v9 loginPolicy], v46 != -[POProfile loginPolicy](v26, "loginPolicy"))
        && ([(POProfile *)v26 loginPolicy] & 8) != 0
        || (uint64_t v47 = [v9 unlockPolicy], v47 != -[POProfile unlockPolicy](v26, "unlockPolicy"))
        && ([(POProfile *)v26 unlockPolicy] & 8) != 0)
      {
        uint64_t v48 = [MEMORY[0x263EFF910] date];
        [v9 setAuthGracePeriodStart:v48];
      }
      uint64_t v49 = [(POAgentAuthenticationProcess *)self configurationManager];
      char v50 = [v49 saveDeviceConfigurationSyncAllConfigToPreboot:v9];

      if ((v50 & 1) == 0) {
        id v51 = __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_566();
      }
    }
    if (v12)
    {
      if ([v12 loginType] == 2)
      {
        BOOL v52 = [(POAgentAuthenticationProcess *)self configurationManager];
        uint64_t v53 = [v52 currentUserConfiguration];
        int v76 = [(POAgentAuthenticationProcess *)self userSigningAlgorithmToUse:v28 userConfiguration:v53];

        id v54 = [(POAgentAuthenticationProcess *)self configurationManager];
        int v55 = [v54 currentUserConfiguration];
        uint64_t v56 = [v55 signingAlgorithm];
        LOBYTE(v53) = [v76 isEqualToNumber:v56];

        if ((v53 & 1) == 0)
        {
          uint64_t v57 = [(POAgentAuthenticationProcess *)self configurationManager];
          uint64_t v58 = [v57 currentUserConfiguration];
          [v58 setPendingSigningAlgorithm:v76];

          BOOL v59 = [(POAgentAuthenticationProcess *)self configurationManager];
          char v60 = [v59 saveCurrentUserConfigurationAndSyncToPreboot:1];

          if ((v60 & 1) == 0)
          {
            id v70 = __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_572();

            goto LABEL_32;
          }
        }
      }
      BOOL v62 = objc_msgSend(v12, "state", v76) == 4 && v78 == 1;
      BOOL v63 = [v12 state] == 6 && v78 == 3;
      char v64 = v63;
      int v65 = v63 || v62;
      if (v79 && v65)
      {
        uint64_t v66 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_230E51000, v66, OS_LOG_TYPE_INFO, "Delaying registration checks for new users during startup.", buf, 2u);
        }

        goto LABEL_32;
      }
    }
    else
    {
      char v64 = 0;
      int v65 = 0;
      LOBYTE(v62) = 0;
    }
    char v80 = v64;
    if (v9 && v15 && [v9 registrationCompleted])
    {
      id v77 = [v9 extensionIdentifier];
      uint64_t v68 = [(POProfile *)v26 extensionBundleIdentifier];
      if ([v77 isEqualToString:v68])
      {
        int v69 = [(POProfile *)v26 useSharedDeviceKeys];
        if (v69 == [v9 sharedDeviceKeys])
        {
          if ([v9 sharedDeviceKeys])
          {
          }
          else
          {
            BOOL v71 = [v12 state] == 2;

            if (v71) {
              goto LABEL_86;
            }
          }
          if (v12 && [v12 loginType] == v78)
          {
            if ([v9 sharedDeviceKeys])
            {
              int v72 = [(POAgentAuthenticationProcess *)self configurationManager];
              BOOL v73 = [v72 userDeviceConfiguration];
              if (v73 || [v12 state] == 2)
              {
              }
              else
              {
                if ([v12 state] == 5) {
                  char v75 = 1;
                }
                else {
                  char v75 = v65;
                }

                if ((v75 & 1) == 0) {
                  goto LABEL_32;
                }
              }
            }
            else if ([v12 state] != 2)
            {
              int v74 = [v12 state] == 5 ? 1 : v65;
              if (v74 != 1) {
                goto LABEL_32;
              }
            }
          }
          v82[0] = MEMORY[0x263EF8330];
          v82[1] = 3221225472;
          v82[2] = __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_3;
          v82[3] = &unk_264BBF540;
          v82[4] = self;
          id v83 = v12;
          BOOL v85 = v62;
          char v86 = v80;
          BOOL v87 = a3;
          unsigned int v84 = v26;
          [(POAgentAuthenticationProcess *)self resetRegistrationWithCompletion:v82];

LABEL_32:
          goto LABEL_33;
        }
      }
    }
LABEL_86:
    v88[0] = MEMORY[0x263EF8330];
    v88[1] = 3221225472;
    v88[2] = __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_575;
    v88[3] = &unk_264BBF518;
    v88[4] = self;
    BOOL v90 = v62;
    char v91 = v80;
    BOOL v92 = a3;
    unsigned int v89 = v26;
    [(POAgentAuthenticationProcess *)self resetRegistrationWithCompletion:v88];

    goto LABEL_32;
  }
  id v30 = __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke();
LABEL_33:
}

id __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"No validated Platform SSO Profiles in configuration changed."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_542()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Platform SSO extension not found in configuration changed."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_548()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Platform SSO extension does not implement registration protocol in configuration changed."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_554()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"No supported authentication methods in configuration changed."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_560()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Shared device keys required for creating or authorizing users in configuration changed."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_566()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed save device configuration with profile changes in configuration changed."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_572()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save new user configuration during user registration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

void __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_575(uint64_t a1)
{
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_2;
  block[3] = &unk_264BBF518;
  int v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 48);
  __int16 v7 = *(_WORD *)(a1 + 49);
  id v5 = v3;
  dispatch_async(v2, block);
}

uint64_t __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleDeviceAndUserRegistrationForRepair:0 newPasswordUser:*(unsigned __int8 *)(a1 + 48) newSmartCardUser:*(unsigned __int8 *)(a1 + 49) notified:*(unsigned __int8 *)(a1 + 50) profile:*(void *)(a1 + 40)];
}

void __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_4;
  v4[3] = &unk_264BBF540;
  int v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  char v7 = *(unsigned char *)(a1 + 56);
  __int16 v8 = *(_WORD *)(a1 + 57);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, v4);
}

void __67__POAgentAuthenticationProcess_handleConfigurationChanged_startup___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) userLoginConfiguration];
  int v3 = [v4 loginUserName];
  [v2 handleUserRegistrationForUser:v3 repair:0 newPasswordUser:*(unsigned __int8 *)(a1 + 56) newSmartCardUser:*(unsigned __int8 *)(a1 + 57) notified:*(unsigned __int8 *)(a1 + 58) profile:*(void *)(a1 + 48)];
}

- (void)resetRegistrationWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  id v5 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[POAgentAuthenticationProcess resetRegistrationWithCompletion:]";
    __int16 v20 = 2112;
    int v21 = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
  int v17 = @"com.apple.PlatformSSO.registration";
  char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  [v6 removeDeliveredNotificationsWithIdentifiers:v7];

  __int16 v8 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
  id v16 = @"com.apple.PlatformSSO.registration";
  BOOL v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  [v8 removePendingNotificationRequestsWithIdentifiers:v9];

  [(POAgentAuthenticationProcess *)self setRegistrationFailed:0];
  uint64_t v10 = [(POAgentAuthenticationProcess *)self registrationContext];
  int v11 = [v10 ssoExtension];

  uint64_t v12 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v12 registrationUI];

  [(POAgentAuthenticationProcess *)self setRegistrationContext:0];
  if (v11)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__POAgentAuthenticationProcess_resetRegistrationWithCompletion___block_invoke;
    v14[3] = &unk_264BBF568;
    v14[4] = self;
    uint64_t v15 = v4;
    [v11 registrationDidCancelWithCompletion:v14];
  }
  else
  {
    __int16 v13 = [(POAgentAuthenticationProcess *)self distributedNotificationCenter];
    [v13 postNotificationName:@"com.apple.platformSSO.UserRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];

    v4[2](v4);
  }
}

uint64_t __64__POAgentAuthenticationProcess_resetRegistrationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) distributedNotificationCenter];
  [v2 postNotificationName:@"com.apple.platformSSO.UserRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];

  int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)handleDeviceRegistrationNotification
{
  int v3 = [(POAgentAuthenticationProcess *)self registrationContext];

  if (v3)
  {
    id v4 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v4 setUserNotified:1];

    activity_block[0] = MEMORY[0x263EF8330];
    activity_block[1] = 3221225472;
    activity_block[2] = __68__POAgentAuthenticationProcess_handleDeviceRegistrationNotification__block_invoke;
    activity_block[3] = &unk_264BBF278;
    activity_block[4] = self;
    _os_activity_initiate(&dword_230E51000, "PSSODeviceRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  else
  {
    [(POAgentAuthenticationProcess *)self handleConfigurationChanged:1];
  }
}

uint64_t __68__POAgentAuthenticationProcess_handleDeviceRegistrationNotification__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registrationContext];
  [v2 setState:4];

  int v3 = *(void **)(a1 + 32);

  return [v3 showRegistrationUI];
}

- (void)handleUserRegistrationNotification
{
  uint64_t v3 = [(POAgentAuthenticationProcess *)self registrationContext];
  if (v3
    && (id v4 = (void *)v3,
        [(POAgentAuthenticationProcess *)self registrationContext],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 state],
        v5,
        v4,
        v6 != 1))
  {
    char v7 = [(POAgentAuthenticationProcess *)self registrationContext];
    [v7 setUserNotified:1];

    activity_block[0] = MEMORY[0x263EF8330];
    activity_block[1] = 3221225472;
    activity_block[2] = __66__POAgentAuthenticationProcess_handleUserRegistrationNotification__block_invoke;
    activity_block[3] = &unk_264BBF278;
    activity_block[4] = self;
    _os_activity_initiate(&dword_230E51000, "PSSOUserRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  else
  {
    [(POAgentAuthenticationProcess *)self handleConfigurationChanged:1];
  }
}

uint64_t __66__POAgentAuthenticationProcess_handleUserRegistrationNotification__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registrationContext];
  [v2 setState:7];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 showRegistrationUI];
}

- (int)ssoMethodToUse:(id)a3 profile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = 1000;
  if ([v6 authenticationMethod] == 1000)
  {
LABEL_13:
    int v10 = v7;
    goto LABEL_14;
  }
  uint64_t v8 = [v5 supportedGrantTypes];
  if (!v8)
  {
    int v11 = [v5 authenticationMethods];
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "authenticationMethod"));
    int v13 = [v11 containsObject:v12];

    if (v13) {
      int v7 = [v6 authenticationMethod];
    }

    goto LABEL_13;
  }
  char v9 = v8;
  if ((v8 & 1) == 0 || (int v10 = [v6 authenticationMethod], v10 != 1))
  {
    int v10 = 1000;
    if ((v9 & 2) != 0)
    {
      int v10 = [v6 authenticationMethod];
      if (v10 != 2)
      {
        if ([v6 authenticationMethod] == 3) {
          int v10 = 3;
        }
        else {
          int v10 = 1000;
        }
      }
    }
  }
LABEL_14:

  return v10;
}

- (id)loadSSOExtensionWithExtensionBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [POExtension alloc];
  id v6 = [(POAgentAuthenticationProcess *)self extensionManager];
  int v7 = [(POExtension *)v5 initWithExtensionBundleIdentifier:v4 extensionManager:v6];

  return v7;
}

- (void)handleRegistrationViewControllerForExtensionIdentifier:(id)a3 completion:(id)a4
{
  id v18 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  uint64_t v7 = [(POAgentAuthenticationProcess *)self registrationContext];
  if (!v7) {
    goto LABEL_3;
  }
  uint64_t v8 = (void *)v7;
  char v9 = [(POAgentAuthenticationProcess *)self registrationContext];
  int v10 = [v9 extensionIdentifier];
  char v11 = [v10 isEqualToString:v18];

  if ((v11 & 1) == 0)
  {
LABEL_3:
    uint64_t v12 = __98__POAgentAuthenticationProcess_handleRegistrationViewControllerForExtensionIdentifier_completion___block_invoke();
    int v13 = v12;
    if (v6)
    {
      v6[2](v6, 0, v12);

      goto LABEL_11;
    }
  }
  uint64_t v14 = [(POAgentAuthenticationProcess *)self registrationContext];
  char v15 = [v14 options];

  if ((v15 & 1) == 0)
  {
    id v16 = __98__POAgentAuthenticationProcess_handleRegistrationViewControllerForExtensionIdentifier_completion___block_invoke_582();
    int v17 = v16;
    if (v6)
    {
      v6[2](v6, 0, v16);

      goto LABEL_11;
    }
  }
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_590);
LABEL_11:
}

id __98__POAgentAuthenticationProcess_handleRegistrationViewControllerForExtensionIdentifier_completion___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Registration not in progress when presenting registration view controller."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __98__POAgentAuthenticationProcess_handleRegistrationViewControllerForExtensionIdentifier_completion___block_invoke_582()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"User interaction not allowed when presenting registration view controller."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)handleRemovingRegistrationForExtension:(id)a3 alreadyDeleted:(BOOL)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v37 = "-[POAgentAuthenticationProcess handleRemovingRegistrationForExtension:alreadyDeleted:]";
    __int16 v38 = 2112;
    char v39 = self;
    _os_log_impl(&dword_230E51000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (!a4)
  {
    id v30 = v6;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v8 = [(POAgentAuthenticationProcess *)self configurationManager];
    char v9 = [v8 currentUserConfiguration];
    int v10 = [v9 kerberosStatus];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v10);
          }
          char v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v16 = PO_LOG_POAgentAuthenticationProcess();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            int v17 = [v15 cacheName];
            *(_DWORD *)buf = 138543362;
            uint64_t v37 = v17;
            _os_log_impl(&dword_230E51000, v16, OS_LOG_TYPE_INFO, "Removing kerberos tickets for cache: %{public}@", buf, 0xCu);
          }
          id v18 = [(POAgentAuthenticationProcess *)self kerberosHelper];
          id v19 = [v15 cacheName];
          [v18 destroyCredentialForUUID:v19];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v12);
    }

    __int16 v20 = [(POAgentAuthenticationProcess *)self configurationManager];
    char v21 = [v20 resetStoredConfiguration];

    id v6 = v30;
    if ((v21 & 1) == 0) {
      id v22 = __86__POAgentAuthenticationProcess_handleRemovingRegistrationForExtension_alreadyDeleted___block_invoke();
    }
  }
  uint64_t v23 = [(POAgentAuthenticationProcess *)self configurationManager];
  [v23 setTokens:0 extensionIdentifier:v6 returningError:0];

  [(POAgentAuthenticationProcess *)self setupTimerForAuthentication];
  char v24 = [(POAgentAuthenticationProcess *)self configurationManager];
  [v24 setSharedOnly:0];

  uint64_t v25 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
  [v25 removeAllDeliveredNotifications];

  id v26 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
  [v26 removeAllPendingNotificationRequests];

  [(POAgentAuthenticationProcess *)self setPlatformSSOActive:0];
  uint64_t v27 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v27 registrationUI];

  [(POAgentAuthenticationProcess *)self setRegistrationContext:0];
  id v28 = [(POAgentAuthenticationProcess *)self distributedNotificationCenter];
  [v28 postNotificationName:@"com.apple.platformSSO.DeviceRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];

  id v29 = [(POAgentAuthenticationProcess *)self distributedNotificationCenter];
  [v29 postNotificationName:@"com.apple.platformSSO.UserRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];
}

id __86__POAgentAuthenticationProcess_handleRemovingRegistrationForExtension_alreadyDeleted___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to remove Platform SSO configuration folder when removing configuration."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)sendPasswordChangedNotification
{
  v23[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(POAgentAuthenticationProcess *)self configurationManager];
  id v4 = [v3 currentLoginConfiguration];

  id v5 = [(POAgentAuthenticationProcess *)self configurationManager];
  id v6 = [v5 currentDeviceConfiguration];
  uint64_t v7 = [v6 accountDisplayName];
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v8 = [v4 accountDisplayName];
  }
  char v9 = [(POAgentAuthenticationProcess *)self configurationManager];
  int v10 = [v9 currentDeviceConfiguration];
  uint64_t v11 = [v10 extensionIdentifier];
  uint64_t v12 = [(POAgentAuthenticationProcess *)self createPasswordChangedNotificationWithAccountName:v8 extensionIdentifier:v11];

  if (!v7) {
  uint64_t v13 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
  }
  v23[0] = @"com.apple.PlatformSSO.passwordchanged";
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  [v13 removePendingNotificationRequestsWithIdentifiers:v14];

  char v15 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
  id v22 = @"com.apple.PlatformSSO.passwordchanged";
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  [v15 removeDeliveredNotificationsWithIdentifiers:v16];

  int v17 = [MEMORY[0x263F1DFA8] triggerWithTimeInterval:0 repeats:1.0];
  id v18 = [MEMORY[0x263F1DF48] requestWithIdentifier:@"com.apple.PlatformSSO.passwordchanged" content:v12 trigger:v17 destinations:5];
  id v19 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)char v21 = 0;
    _os_log_impl(&dword_230E51000, v19, OS_LOG_TYPE_INFO, "Sending password changed notification", v21, 2u);
  }

  __int16 v20 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
  [v20 addNotificationRequest:v18 withCompletionHandler:&__block_literal_global_597];
}

void __63__POAgentAuthenticationProcess_sendPasswordChangedNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (v2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __63__POAgentAuthenticationProcess_sendPasswordChangedNotification__block_invoke_2;
    v5[3] = &unk_264BBECA8;
    id v6 = v2;
    id v4 = __63__POAgentAuthenticationProcess_sendPasswordChangedNotification__block_invoke_2((uint64_t)v5);
  }
}

id __63__POAgentAuthenticationProcess_sendPasswordChangedNotification__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error sending local notification for password changed."];
  id v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (void)handleKerberosMappingForTokens:(id)a3 extensionIdentifier:(id)a4 userConfiguration:(id)a5
{
  id v11 = a3;
  id v7 = a5;
  uint64_t v8 = [(POAgentAuthenticationProcess *)self configurationManager];
  char v9 = [v8 currentLoginConfiguration];

  if (v9) {
    [(POAgentAuthenticationProcess *)self handleKerberosMappingForTokens:v11 loginConfiguration:v9 userConfiguration:v7];
  }
  else {
    id v10 = __101__POAgentAuthenticationProcess_handleKerberosMappingForTokens_extensionIdentifier_userConfiguration___block_invoke();
  }
}

id __101__POAgentAuthenticationProcess_handleKerberosMappingForTokens_extensionIdentifier_userConfiguration___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"No login configuration when handling kerberos mapping."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)exchangeTGTForStatus:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(POAgentAuthenticationProcess *)self kerberosDelegate];
  id v6 = [v4 realm];
  uint64_t v7 = [v5 isRealmConfiguredForKerberosExtension:v6];

  uint64_t v8 = [(POAgentAuthenticationProcess *)self kerberosDelegate];
  char v9 = [v4 realm];
  [v8 triggerVPNForRealm:v9];

  if (v7)
  {
    id v10 = [(POAgentAuthenticationProcess *)self kerberosDelegate];
    id v11 = [v4 realm];
    uint64_t v12 = [v10 isNetworkConnectedForRealm:v11];
  }
  else
  {
    uint64_t v12 = 1;
  }
  uint64_t v13 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [NSNumber numberWithBool:v7];
    char v15 = [NSNumber numberWithBool:v12];
    int v21 = 136315906;
    id v22 = "-[POAgentAuthenticationProcess exchangeTGTForStatus:]";
    __int16 v23 = 2114;
    char v24 = v14;
    __int16 v25 = 2114;
    id v26 = v15;
    __int16 v27 = 2112;
    id v28 = self;
    _os_log_impl(&dword_230E51000, v13, OS_LOG_TYPE_DEFAULT, "%s kerberos extension = %{public}@, isNetworkConnected = %{public}@ on %@", (uint8_t *)&v21, 0x2Au);
  }
  if (v12)
  {
    id v16 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = [v4 realm];
      int v21 = 138543362;
      id v22 = v17;
      _os_log_impl(&dword_230E51000, v16, OS_LOG_TYPE_INFO, "Exchanging TGT for realm: %{public}@", (uint8_t *)&v21, 0xCu);
    }
    id v18 = [(POAgentAuthenticationProcess *)self kerberosHelper];
    [v18 exchangeKerberosTGTForEntry:v4];
  }
  id v19 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    __int16 v20 = [v4 realm];
    int v21 = 138543362;
    id v22 = v20;
    _os_log_impl(&dword_230E51000, v19, OS_LOG_TYPE_INFO, "Successfully imported Kerberos ticket for realm: %{public}@", (uint8_t *)&v21, 0xCu);
  }
}

- (void)handleKerberosMappingForTokens:(id)a3 loginConfiguration:(id)a4 userConfiguration:(id)a5
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v87 = "-[POAgentAuthenticationProcess handleKerberosMappingForTokens:loginConfiguration:userConfiguration:]";
    __int16 v88 = 2112;
    unsigned int v89 = self;
    _os_log_impl(&dword_230E51000, v11, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v84 = 0;
  uint64_t v12 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:16 error:&v84];
  id v13 = v84;
  if (v13)
  {
    v82[0] = MEMORY[0x263EF8330];
    v82[1] = 3221225472;
    v82[2] = __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke;
    v82[3] = &unk_264BBECA8;
    id v14 = v13;
    id v83 = v14;
    id v15 = __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke((uint64_t)v82);
    id v16 = v83;
  }
  else
  {
    uint64_t v61 = v10;
    id v63 = v8;
    id v65 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v62 = v9;
    id obj = [v9 kerberosTicketMappings];
    uint64_t v70 = [obj countByEnumeratingWithState:&v78 objects:v85 count:16];
    if (v70)
    {
      uint64_t v68 = 0;
      uint64_t v69 = *(void *)v79;
      uint64_t v66 = v12;
      do
      {
        for (uint64_t i = 0; i != v70; ++i)
        {
          if (*(void *)v79 != v69) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          id v19 = PO_LOG_POAgentAuthenticationProcess();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            __int16 v20 = [v18 ticketKeyPath];
            *(_DWORD *)buf = 138543362;
            BOOL v87 = v20;
            _os_log_impl(&dword_230E51000, v19, OS_LOG_TYPE_INFO, "Mapping Kerberos TGT for %{public}@", buf, 0xCu);
          }
          int v21 = [v18 ticketKeyPath];
          id v22 = [v12 valueForKeyPath:v21];

          if (v22)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              __int16 v23 = (void *)MEMORY[0x263F08900];
              char v24 = [v22 dataUsingEncoding:4];
              id v75 = v68;
              __int16 v25 = [v23 JSONObjectWithData:v24 options:16 error:&v75];
              id v26 = v75;

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                __int16 v27 = v25;

                id v22 = v27;
              }

              uint64_t v68 = v26;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v22 = v22;
              id v28 = objc_alloc_init(POKerberosEntry);
              uint64_t v29 = [v18 ticketKeyPath];
              [(POKerberosEntry *)v28 setTicketKeyPath:v29];

              id v30 = [v18 messageBufferKeyName];
              long long v31 = [v22 objectForKeyedSubscript:v30];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v32 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v31 options:0];
                [(POKerberosEntry *)v28 setMessageBuffer:v32];
              }
              long long v33 = [v18 realmKeyName];
              long long v34 = [v22 objectForKeyedSubscript:v33];

              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [(POKerberosEntry *)v28 setRealm:v34];
              }
              os_signpost_id_t v35 = [v18 serviceNameKeyName];
              char v36 = [v22 objectForKeyedSubscript:v35];

              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [(POKerberosEntry *)v28 setServiceName:v36];
              }
              uint64_t v37 = [v18 clientNameKeyName];
              __int16 v38 = [v22 objectForKeyedSubscript:v37];

              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [(POKerberosEntry *)v28 setClientName:v38];
              }
              char v39 = [v18 encryptionKeyTypeKeyName];
              uint64_t v40 = [v22 objectForKeyedSubscript:v39];

              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                -[POKerberosEntry setEncryptionKeyType:](v28, "setEncryptionKeyType:", [v40 intValue]);
              }
              uint64_t v41 = [v18 sessionKeyKeyName];
              uint64_t v42 = [v22 objectForKeyedSubscript:v41];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v43 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v42 options:0];
                [(POKerberosEntry *)v28 setSessionKey:v43];
              }
              if ([(POKerberosEntry *)v28 hasAllRequiredValues])
              {
                char v44 = PO_LOG_POAgentAuthenticationProcess();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  uint64_t v45 = [(POKerberosEntry *)v28 realm];
                  *(_DWORD *)buf = 138543362;
                  BOOL v87 = v45;
                  _os_log_impl(&dword_230E51000, v44, OS_LOG_TYPE_INFO, "Importing Kerberos TGT for %{public}@", buf, 0xCu);
                }
                uint64_t v46 = [(POAgentAuthenticationProcess *)self kerberosHelper];
                v74[0] = 0;
                uint64_t v47 = [v46 importKerberosEntry:v28 error:v74];
                id v48 = v74[0];

                [v65 addObject:v47];
                if (([v47 importSuccessful] & 1) == 0)
                {
                  v71[0] = MEMORY[0x263EF8330];
                  v71[1] = 3221225472;
                  v71[2] = __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_617;
                  v71[3] = &unk_264BBF400;
                  id v72 = v48;
                  BOOL v73 = v18;
                  id v49 = __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_617((uint64_t)v71);
                }
                uint64_t v12 = v66;
                if ([v47 exchangeRequired])
                {
                  char v50 = PO_LOG_POAgentAuthenticationProcess();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                  {
                    id v51 = [(POKerberosEntry *)v28 realm];
                    *(_DWORD *)buf = 138543362;
                    BOOL v87 = v51;
                    _os_log_impl(&dword_230E51000, v50, OS_LOG_TYPE_INFO, "Exchanging Kerberos TGT for %{public}@", buf, 0xCu);

                    uint64_t v12 = v66;
                  }

                  [(POAgentAuthenticationProcess *)self exchangeTGTForStatus:v47];
                }
                if ([v47 failedToConnect]) {
                  [(POAgentAuthenticationProcess *)self setEnableNetworkChanges:1];
                }
                if (([v47 exchangeRequired] & 1) == 0)
                {
                  id v64 = v48;
                  BOOL v52 = PO_LOG_POAgentAuthenticationProcess();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v53 = [v47 realm];
                    *(_DWORD *)buf = 138543362;
                    BOOL v87 = v53;
                    _os_log_impl(&dword_230E51000, v52, OS_LOG_TYPE_INFO, "Notifying TGT delegate for realm: %{public}@", buf, 0xCu);
                  }
                  id v54 = [(POAgentAuthenticationProcess *)self kerberosDelegate];
                  int v55 = [v47 realm];
                  [v47 upn];
                  v57 = uint64_t v56 = self;
                  uint64_t v58 = [v47 cacheName];
                  [v54 TGTReceivedForRealm:v55 upn:v57 cache:v58];

                  self = v56;
                  uint64_t v12 = v66;
                  id v48 = v64;
                }
              }
              else
              {
                id v60 = __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_621();
              }
            }
            else
            {
              v74[1] = (id)MEMORY[0x263EF8330];
              v74[2] = (id)3221225472;
              v74[3] = __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_611;
              v74[4] = &unk_264BBECA8;
              v74[5] = v18;
              id v59 = __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_611();
            }
          }
          else
          {
            id v22 = PO_LOG_POAgentAuthenticationProcess();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
              -[POAgentAuthenticationProcess handleKerberosMappingForTokens:loginConfiguration:userConfiguration:](&v76, v77);
            }
          }
        }
        uint64_t v70 = [obj countByEnumeratingWithState:&v78 objects:v85 count:16];
      }
      while (v70);
    }
    else
    {
      uint64_t v68 = 0;
    }

    id v10 = v61;
    id v16 = v65;
    [v61 setKerberosStatus:v65];
    id v9 = v62;
    id v8 = v63;
    id v14 = v68;
  }
}

id __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error deserializing mapping when handling kerberos mapping."];
  id v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_611()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Ticket key path not NSDictionary when handling kerberos mapping."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_611_cold_1();
  }

  return v0;
}

id __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_617(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to import kerberos ticketmapping when handling kerberos mapping."];
  id v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_617_cold_1();
  }

  return v1;
}

id __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_621()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"Kerberos mapping is missing all required values when handling kerberos mapping."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)handleRemovingSSOTokens
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[POAgentAuthenticationProcess handleRemovingSSOTokens]";
    __int16 v19 = 2112;
    __int16 v20 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v4 = [(POAgentAuthenticationProcess *)self configurationManager];
  id v5 = [v4 currentDeviceConfiguration];
  id v6 = [v5 extensionIdentifier];

  if (v6)
  {
    uint64_t v7 = [(POAgentAuthenticationProcess *)self configurationManager];
    id v8 = [(POAgentAuthenticationProcess *)self configurationManager];
    id v9 = [v8 currentDeviceConfiguration];
    id v10 = [v9 extensionIdentifier];
    id v16 = 0;
    char v11 = [v7 setTokens:0 extensionIdentifier:v10 returningError:&v16];
    id v12 = v16;

    if ((v11 & 1) == 0)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __55__POAgentAuthenticationProcess_handleRemovingSSOTokens__block_invoke;
      v14[3] = &unk_264BBECA8;
      id v12 = v12;
      id v15 = v12;
      id v13 = __55__POAgentAuthenticationProcess_handleRemovingSSOTokens__block_invoke((uint64_t)v14);
    }
  }
  else
  {
    id v12 = 0;
  }
}

id __55__POAgentAuthenticationProcess_handleRemovingSSOTokens__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to save pending SSO tokens."];
  id v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (void)handlePendingSSOTokensWithSharedData:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v51 = "-[POAgentAuthenticationProcess handlePendingSSOTokensWithSharedData:]";
    __int16 v52 = 2112;
    uint64_t v53 = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = [(POAgentAuthenticationProcess *)self configurationManager];
  uint64_t v7 = NSUserName();
  id v8 = [v6 retrievePendingSSOTokensForUserName:v7];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x263F5E600];
    id v10 = [(POAgentAuthenticationProcess *)self configurationManager];
    char v11 = [v10 currentDeviceConfiguration];
    id v12 = objc_msgSend(v9, "decryptPendingSSOTokens:UsingPrivateKey:sharedData:", v8, objc_msgSend(v11, "deviceEncryptionKey"), v4);

    if (!v12)
    {
      id v13 = [(POAgentAuthenticationProcess *)self registrationContext];
      if ([v13 migratingDeviceKeys])
      {
        id v14 = [(POAgentAuthenticationProcess *)self configurationManager];
        id v15 = [v14 userDeviceConfiguration];

        if (!v15)
        {
          id v12 = 0;
          goto LABEL_14;
        }
        id v16 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_230E51000, v16, OS_LOG_TYPE_INFO, "Handling Pending SSO During Migration", buf, 2u);
        }

        int v17 = (void *)MEMORY[0x263F5E600];
        id v13 = [(POAgentAuthenticationProcess *)self configurationManager];
        id v18 = [v13 userDeviceConfiguration];
        id v12 = objc_msgSend(v17, "decryptPendingSSOTokens:UsingPrivateKey:sharedData:", v8, objc_msgSend(v18, "deviceEncryptionKey"), v4);
      }
      else
      {
        id v12 = 0;
      }
    }
LABEL_14:
    __int16 v19 = [(POAgentAuthenticationProcess *)self configurationManager];
    __int16 v20 = [(POAgentAuthenticationProcess *)self configurationManager];
    uint64_t v21 = [v20 currentDeviceConfiguration];
    id v22 = [v21 extensionIdentifier];
    id v47 = 0;
    char v23 = [v19 setTokens:v12 extensionIdentifier:v22 returningError:&v47];
    id v24 = v47;

    if (v23)
    {
      [(POAgentAuthenticationProcess *)self setupTimerForAuthentication];
      if (v12)
      {
        __int16 v25 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_230E51000, v25, OS_LOG_TYPE_INFO, "Pending SSO Tokens Saved", buf, 2u);
        }

        id v26 = [(POAgentAuthenticationProcess *)self configurationManager];
        __int16 v27 = [v26 currentUserConfiguration];
        uint64_t v28 = [v27 state];

        if (v28 == 1)
        {
          uint64_t v29 = [(POAgentAuthenticationProcess *)self configurationManager];
          uint64_t v30 = [v29 currentUserConfiguration];
          [(id)v30 setState:0];

          long long v31 = [(POAgentAuthenticationProcess *)self configurationManager];
          LOBYTE(v30) = [v31 saveCurrentUserConfigurationAndSyncToPreboot:0];

          if ((v30 & 1) == 0) {
            id v32 = __69__POAgentAuthenticationProcess_handlePendingSSOTokensWithSharedData___block_invoke_630();
          }
        }
        long long v33 = [(POAgentAuthenticationProcess *)self configurationManager];
        long long v34 = [v33 currentLoginConfiguration];
        uint64_t v35 = [(POAgentAuthenticationProcess *)self configurationManager];
        char v36 = [(id)v35 currentUserConfiguration];
        [(POAgentAuthenticationProcess *)self handleKerberosMappingForTokens:v12 loginConfiguration:v34 userConfiguration:v36];

        uint64_t v37 = [(POAgentAuthenticationProcess *)self configurationManager];
        __int16 v38 = NSUserName();
        LOBYTE(v35) = [v37 savePendingSSOTokens:0 forUserName:v38];

        if (v35)
        {
          char v39 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
          id v49 = @"com.apple.PlatformSSO.authentication";
          uint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
          [v39 removeDeliveredNotificationsWithIdentifiers:v40];

          uint64_t v41 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
          id v48 = @"com.apple.PlatformSSO.authentication";
          uint64_t v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
          [v41 removePendingNotificationRequestsWithIdentifiers:v42];
        }
        else
        {
          id v44 = __69__POAgentAuthenticationProcess_handlePendingSSOTokensWithSharedData___block_invoke_636();
        }
      }
    }
    else
    {
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __69__POAgentAuthenticationProcess_handlePendingSSOTokensWithSharedData___block_invoke;
      v45[3] = &unk_264BBECA8;
      id v46 = v24;
      id v43 = __69__POAgentAuthenticationProcess_handlePendingSSOTokensWithSharedData___block_invoke((uint64_t)v45);
    }
    goto LABEL_26;
  }
  id v12 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess handlePendingSSOTokensWithSharedData:]();
  }
LABEL_26:
}

id __69__POAgentAuthenticationProcess_handlePendingSSOTokensWithSharedData___block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to save pending SSO tokens."];
  id v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __69__POAgentAuthenticationProcess_handlePendingSSOTokensWithSharedData___block_invoke_630()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration after saving pending SSO tokens."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __69__POAgentAuthenticationProcess_handlePendingSSOTokensWithSharedData___block_invoke_636()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to clear pending SSO tokens."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)handleUnfinishedTGTExchanges
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v3 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v32 = "-[POAgentAuthenticationProcess handleUnfinishedTGTExchanges]";
    __int16 v33 = 2112;
    long long v34 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v4 = [(POAgentAuthenticationProcess *)self configurationManager];
  id v5 = [v4 currentUserConfiguration];

  if (v5)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = [v5 kerberosStatus];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      __int16 v25 = v5;
      char v9 = 0;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v12 exchangeRequired])
          {
            id v13 = PO_LOG_POAgentAuthenticationProcess();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              id v14 = [v12 realm];
              *(_DWORD *)buf = 138543362;
              id v32 = v14;
              _os_log_impl(&dword_230E51000, v13, OS_LOG_TYPE_INFO, "Exchanging Kerberos TGT for %{public}@", buf, 0xCu);
            }
            [(POAgentAuthenticationProcess *)self exchangeTGTForStatus:v12];
            if ([v12 failedToConnect]) {
              [(POAgentAuthenticationProcess *)self setEnableNetworkChanges:1];
            }
            if (([v12 exchangeRequired] & 1) == 0)
            {
              id v15 = PO_LOG_POAgentAuthenticationProcess();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                id v16 = [v12 realm];
                *(_DWORD *)buf = 138543362;
                id v32 = v16;
                _os_log_impl(&dword_230E51000, v15, OS_LOG_TYPE_INFO, "Notifying TGT delegate for realm: %{public}@", buf, 0xCu);
              }
              int v17 = [(POAgentAuthenticationProcess *)self kerberosDelegate];
              id v18 = [v12 realm];
              __int16 v19 = [v12 upn];
              __int16 v20 = [v12 cacheName];
              [v17 TGTReceivedForRealm:v18 upn:v19 cache:v20];

              char v9 = 1;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);

      id v5 = v25;
      if (v9)
      {
        uint64_t v21 = [(POAgentAuthenticationProcess *)self configurationManager];
        char v22 = [v21 saveCurrentUserConfigurationAndSyncToPreboot:0];

        if ((v22 & 1) == 0) {
          id v23 = __60__POAgentAuthenticationProcess_handleUnfinishedTGTExchanges__block_invoke_647();
        }
      }
    }
    else
    {
    }
  }
  else
  {
    id v24 = __60__POAgentAuthenticationProcess_handleUnfinishedTGTExchanges__block_invoke();
  }
}

id __60__POAgentAuthenticationProcess_handleUnfinishedTGTExchanges__block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"No user configuration when handling unfinished TGT exchanges."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POAgentAuthenticationProcess_handleUnfinishedTGTExchanges__block_invoke_647()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save user configuration when handling unfinished TGT exchanges."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)notifyKerberosDelegateTGTDidBegin
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[POAgentAuthenticationProcess notifyKerberosDelegateTGTDidBegin]";
    __int16 v7 = 2112;
    uint64_t v8 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v5, 0x16u);
  }

  id v4 = [(POAgentAuthenticationProcess *)self kerberosDelegate];
  [v4 TGTRequestDidBegin];
}

- (void)notifyKerberosDelegateTGTDidComplete
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[POAgentAuthenticationProcess notifyKerberosDelegateTGTDidComplete]";
    __int16 v7 = 2112;
    uint64_t v8 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v5, 0x16u);
  }

  id v4 = [(POAgentAuthenticationProcess *)self kerberosDelegate];
  [v4 TGTRequestDidComplete];
}

- (void)setupTimerForAuthentication
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    char v22 = "-[POAgentAuthenticationProcess setupTimerForAuthentication]";
    __int16 v23 = 2112;
    id v24 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v21, 0x16u);
  }

  id v4 = [(POAgentAuthenticationProcess *)self authenticationTimerLock];
  objc_sync_enter(v4);
  int v5 = [(POAgentAuthenticationProcess *)self authenticationTimer];

  if (v5)
  {
    id v6 = [(POAgentAuthenticationProcess *)self authenticationTimer];
    [v6 invalidate];

    [(POAgentAuthenticationProcess *)self setAuthenticationTimer:0];
  }
  objc_sync_exit(v4);

  __int16 v7 = [(POAgentAuthenticationProcess *)self configurationManager];
  uint64_t v8 = [v7 currentUserConfiguration];

  if (v8)
  {
    uint64_t v9 = [(POAgentAuthenticationProcess *)self configurationManager];
    uint64_t v10 = [v9 tokenReceived];

    [v10 timeIntervalSinceNow];
    if (v11 >= -14400.0)
    {
      id v13 = [v10 dateByAddingTimeInterval:14400.0];
      if (!v13)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      id v12 = [(POAgentAuthenticationProcess *)self configurationManager];
      id v13 = [v12 tokenExpiration];

      if (!v13) {
        goto LABEL_14;
      }
    }
    id v15 = [(POAgentAuthenticationProcess *)self authenticationTimerLock];
    objc_sync_enter(v15);
    id v16 = PO_LOG_POAgentAuthenticationProcess();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543362;
      char v22 = (const char *)v13;
      _os_log_impl(&dword_230E51000, v16, OS_LOG_TYPE_INFO, "Refresh token timer set: %{public}@", (uint8_t *)&v21, 0xCu);
    }

    int v17 = (void *)[objc_alloc(MEMORY[0x263EFFA20]) initWithFireDate:v13 interval:self target:sel_performLoginForCurrentUserWithPasswordContext_ selector:0 userInfo:0 repeats:0.0];
    [(POAgentAuthenticationProcess *)self setAuthenticationTimer:v17];

    id v18 = [(POAgentAuthenticationProcess *)self authenticationTimer];
    [v18 setTolerance:300.0];

    __int16 v19 = [MEMORY[0x263EFF9F0] currentRunLoop];
    __int16 v20 = [(POAgentAuthenticationProcess *)self authenticationTimer];
    [v19 addTimer:v20 forMode:*MEMORY[0x263EFF478]];

    objc_sync_exit(v15);
    goto LABEL_14;
  }
  id v14 = __59__POAgentAuthenticationProcess_setupTimerForAuthentication__block_invoke();
LABEL_15:
}

id __59__POAgentAuthenticationProcess_setupTimerForAuthentication__block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"No user configuration when handling setting up authentication timer."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)isCurrentSSOExtension:(id)a3
{
  id v4 = a3;
  int v5 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess isCurrentSSOExtension:]();
  }

  id v6 = [(POAgentAuthenticationProcess *)self configurationManager];
  __int16 v7 = [v6 currentDeviceConfiguration];

  if (!v7)
  {
    id v13 = __54__POAgentAuthenticationProcess_isCurrentSSOExtension___block_invoke();
LABEL_8:
    BOOL v12 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = [(POAgentAuthenticationProcess *)self configurationManager];
  uint64_t v9 = [v8 currentDeviceConfiguration];
  uint64_t v10 = [v9 extensionIdentifier];
  char v11 = [v10 isEqualToString:v4];

  if ((v11 & 1) == 0)
  {
    id v16 = v4;
    id v14 = __54__POAgentAuthenticationProcess_isCurrentSSOExtension___block_invoke_667();

    goto LABEL_8;
  }
  BOOL v12 = 1;
LABEL_9:

  return v12;
}

id __54__POAgentAuthenticationProcess_isCurrentSSOExtension___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"No device configuration when checking sso extension."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __54__POAgentAuthenticationProcess_isCurrentSSOExtension___block_invoke_667()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"Caller is not current extension when checking sso extension."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_346_cold_1();
  }

  return v0;
}

- (id)deviceSigningAlgorithmToUse:(id)a3 deviceConfiguration:(id)a4
{
  id v6 = a4;
  __int16 v7 = [a3 supportedDeviceSigningAlgorithms];
  if (![v7 count])
  {
    uint64_t v11 = [v6 signingAlgorithm];
    BOOL v12 = (void *)v11;
    id v13 = (void *)*MEMORY[0x263F5E698];
    if (v11) {
      id v13 = (void *)v11;
    }
    id v14 = v13;
    goto LABEL_8;
  }
  uint64_t v8 = (void *)*MEMORY[0x263F5E6A0];
  if ([v7 containsObject:*MEMORY[0x263F5E6A0]]
    || (uint64_t v8 = (void *)*MEMORY[0x263F5E698], [v7 containsObject:*MEMORY[0x263F5E698]]))
  {
    uint64_t v9 = [v6 signingAlgorithm];
    id v10 = [(POAgentAuthenticationProcess *)self bestSigningAlgorithm:v8 or:v9];

    goto LABEL_9;
  }
  uint64_t v16 = *MEMORY[0x263F5E6A8];
  if ([v7 containsObject:*MEMORY[0x263F5E6A8]])
  {
    BOOL v12 = [v6 signingAlgorithm];
    id v14 = [(POAgentAuthenticationProcess *)self bestSigningAlgorithm:v16 or:v12];
LABEL_8:
    id v10 = v14;

    goto LABEL_9;
  }
  id v10 = v8;
LABEL_9:

  return v10;
}

- (id)bestSigningAlgorithm:(id)a3 or:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x263F5E6A0];
  char v8 = [v5 isEqualToNumber:*MEMORY[0x263F5E6A0]];
  uint64_t v9 = v5;
  if ((v8 & 1) == 0)
  {
    char v10 = [v6 isEqualToNumber:v7];
    uint64_t v9 = v6;
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = (void *)*MEMORY[0x263F5E698];
      char v12 = [v5 isEqualToNumber:*MEMORY[0x263F5E698]];
      uint64_t v9 = v5;
      if ((v12 & 1) == 0)
      {
        char v13 = [v6 isEqualToNumber:v11];
        uint64_t v9 = v6;
        if ((v13 & 1) == 0)
        {
          uint64_t v14 = *MEMORY[0x263F5E6A8];
          char v15 = [v5 isEqualToNumber:*MEMORY[0x263F5E6A8]];
          uint64_t v9 = v5;
          if ((v15 & 1) == 0)
          {
            if ([v6 isEqualToNumber:v14]) {
              uint64_t v9 = v6;
            }
            else {
              uint64_t v9 = v11;
            }
          }
        }
      }
    }
  }
  id v16 = v9;

  return v16;
}

- (id)deviceEncryptionAlgorithmToUse:(id)a3 deviceConfiguration:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 supportedDeviceEncryptionAlgorithms];
  if ([v7 count])
  {
    char v8 = (void *)*MEMORY[0x263F5E690];
    if ([v7 containsObject:*MEMORY[0x263F5E690]]
      || (char v8 = (void *)*MEMORY[0x263F5E688], [v7 containsObject:*MEMORY[0x263F5E688]])
      || (char v8 = (void *)*MEMORY[0x263F5E680], [v7 containsObject:*MEMORY[0x263F5E680]])
      || (char v8 = (void *)*MEMORY[0x263F5E678], [v7 containsObject:*MEMORY[0x263F5E678]]))
    {
      uint64_t v9 = [v6 encryptionAlgorithm];
      id v10 = [(POAgentAuthenticationProcess *)self bestEncryptionAlgorithm:v8 or:v9];
    }
    else
    {
      id v10 = v8;
    }
  }
  else
  {
    uint64_t v11 = [v6 encryptionAlgorithm];
    char v12 = (void *)v11;
    char v13 = (void *)*MEMORY[0x263F5E678];
    if (v11) {
      char v13 = (void *)v11;
    }
    id v10 = v13;
  }

  return v10;
}

- (id)bestEncryptionAlgorithm:(id)a3 or:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x263F5E690];
  char v8 = [v5 isEqualToNumber:*MEMORY[0x263F5E690]];
  uint64_t v9 = v5;
  if ((v8 & 1) == 0)
  {
    char v10 = [v6 isEqualToNumber:v7];
    uint64_t v9 = v6;
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = *MEMORY[0x263F5E688];
      char v12 = [v5 isEqualToNumber:*MEMORY[0x263F5E688]];
      uint64_t v9 = v5;
      if ((v12 & 1) == 0)
      {
        char v13 = [v6 isEqualToNumber:v11];
        uint64_t v9 = v6;
        if ((v13 & 1) == 0)
        {
          uint64_t v14 = *MEMORY[0x263F5E680];
          char v15 = [v5 isEqualToNumber:*MEMORY[0x263F5E680]];
          uint64_t v9 = v5;
          if ((v15 & 1) == 0)
          {
            char v16 = [v6 isEqualToNumber:v14];
            uint64_t v9 = v6;
            if ((v16 & 1) == 0)
            {
              int v17 = (void *)*MEMORY[0x263F5E678];
              char v18 = [v5 isEqualToNumber:*MEMORY[0x263F5E678]];
              uint64_t v9 = v5;
              if ((v18 & 1) == 0)
              {
                if ([v6 isEqualToNumber:v17]) {
                  uint64_t v9 = v6;
                }
                else {
                  uint64_t v9 = v17;
                }
              }
            }
          }
        }
      }
    }
  }
  id v19 = v9;

  return v19;
}

- (id)userSigningAlgorithmToUse:(id)a3 userConfiguration:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 supportedUserSecureEnclaveKeySigningAlgorithms];
  if (![v7 count])
  {
    uint64_t v11 = [v6 signingAlgorithm];
    char v12 = (void *)v11;
    char v13 = (void *)*MEMORY[0x263F5E698];
    if (v11) {
      char v13 = (void *)v11;
    }
    id v14 = v13;
    goto LABEL_8;
  }
  char v8 = (void *)*MEMORY[0x263F5E6A0];
  if ([v7 containsObject:*MEMORY[0x263F5E6A0]]
    || (char v8 = (void *)*MEMORY[0x263F5E698], [v7 containsObject:*MEMORY[0x263F5E698]]))
  {
    uint64_t v9 = [v6 signingAlgorithm];
    id v10 = [(POAgentAuthenticationProcess *)self bestSigningAlgorithm:v8 or:v9];

    goto LABEL_9;
  }
  uint64_t v16 = *MEMORY[0x263F5E6A8];
  if ([v7 containsObject:*MEMORY[0x263F5E6A8]])
  {
    char v12 = [v6 signingAlgorithm];
    id v14 = [(POAgentAuthenticationProcess *)self bestSigningAlgorithm:v16 or:v12];
LABEL_8:
    id v10 = v14;

    goto LABEL_9;
  }
  id v10 = v8;
LABEL_9:

  return v10;
}

- (void)windowDidClose
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = NSNumber;
    id v5 = [(POAgentAuthenticationProcess *)self registrationContext];
    id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "state"));
    uint64_t v7 = NSNumber;
    char v8 = [(POAgentAuthenticationProcess *)self registrationContext];
    uint64_t v9 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "failureCount"));
    int v11 = 136315906;
    char v12 = "-[POAgentAuthenticationProcess windowDidClose]";
    __int16 v13 = 2114;
    id v14 = v6;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    char v18 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s state = %{public}@, failureCount = %{public}@ on %@", (uint8_t *)&v11, 0x2Au);
  }
  id v10 = [(POAgentAuthenticationProcess *)self registrationContext];
  [v10 state];
}

- (void)requestDidCompleteWithError:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSNumber;
    uint64_t v7 = [(POAgentAuthenticationProcess *)self registrationContext];
    char v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "state"));
    uint64_t v9 = NSNumber;
    id v10 = [(POAgentAuthenticationProcess *)self registrationContext];
    int v11 = objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "failureCount"));
    *(_DWORD *)buf = 136315906;
    __int16 v23 = "-[POAgentAuthenticationProcess requestDidCompleteWithError:]";
    __int16 v24 = 2114;
    uint64_t v25 = v8;
    __int16 v26 = 2114;
    long long v27 = v11;
    __int16 v28 = 2112;
    long long v29 = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s state = %{public}@, failureCount = %{public}@ on %@", buf, 0x2Au);
  }
  char v12 = [(POAgentAuthenticationProcess *)self registrationContext];
  BOOL v13 = [v12 state] == 1;

  if (!v13)
  {
    id v14 = self;
    objc_sync_enter(v14);
    __int16 v15 = [(POAgentAuthenticationProcess *)v14 registrationContext];
    uint64_t v16 = [v15 ssoExtension];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      objc_sync_exit(v14);
    }
    else
    {
      char v18 = [(POAgentAuthenticationProcess *)v14 registrationContext];
      uint64_t v19 = [v18 ssoExtension];
      [v19 unload];

      __int16 v20 = [(POAgentAuthenticationProcess *)v14 registrationContext];
      [v20 setSsoExtension:0];

      objc_sync_exit(v14);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke;
      v21[3] = &unk_264BBF4A0;
      v21[4] = v14;
      [(POAgentAuthenticationProcess *)v14 showAlertWithError:v4 completion:v21];
    }
  }
}

void __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) registrationContext];
  objc_msgSend(v2, "setFailureCount:", objc_msgSend(v2, "failureCount") + 1);

  uint64_t v3 = [*(id *)(a1 + 32) registrationContext];
  int v4 = [v3 failureCount];

  id v5 = *(void **)(a1 + 32);
  if (v4 >= 2)
  {
    [v5 setRegistrationFailed:1];
    id v6 = [*(id *)(a1 + 32) registrationContext];
    if ([v6 isRetry])
    {
    }
    else
    {
      char v12 = [*(id *)(a1 + 32) registrationContext];
      uint64_t v13 = [v12 state];

      if (v13 == 4)
      {
        id v14 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136315394;
          char v39 = "-[POAgentAuthenticationProcess requestDidCompleteWithError:]_block_invoke";
          __int16 v40 = 2112;
          uint64_t v41 = v15;
          _os_log_impl(&dword_230E51000, v14, OS_LOG_TYPE_DEFAULT, "%s removing login configuration on %@", buf, 0x16u);
        }

        uint64_t v16 = [*(id *)(a1 + 32) configurationManager];
        char v17 = [v16 removeLoginConfiguration];

        if ((v17 & 1) == 0) {
          id v18 = __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_671();
        }
        goto LABEL_21;
      }
    }
    uint64_t v19 = [*(id *)(a1 + 32) registrationContext];
    if ([v19 isRetry])
    {
    }
    else
    {
      char v22 = [*(id *)(a1 + 32) registrationContext];
      uint64_t v23 = [v22 state];

      if (v23 == 7)
      {
        __int16 v24 = PO_LOG_POAgentAuthenticationProcess();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136315394;
          char v39 = "-[POAgentAuthenticationProcess requestDidCompleteWithError:]_block_invoke";
          __int16 v40 = 2112;
          uint64_t v41 = v25;
          _os_log_impl(&dword_230E51000, v24, OS_LOG_TYPE_DEFAULT, "%s removing user configuration on %@", buf, 0x16u);
        }

        __int16 v26 = [*(id *)(a1 + 32) configurationManager];
        uint64_t v27 = [v26 currentUserConfiguration];
        [(id)v27 setState:2];

        __int16 v28 = [*(id *)(a1 + 32) configurationManager];
        LOBYTE(v27) = [v28 saveCurrentUserConfigurationAndSyncToPreboot:1];

        if ((v27 & 1) == 0) {
          id v29 = __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_677();
        }
      }
    }
LABEL_21:
    uint64_t v30 = [*(id *)(a1 + 32) registrationContext];
    long long v31 = [v30 registrationUI];

    if (!v31) {
      [*(id *)(a1 + 32) setRegistrationContext:0];
    }
    id v32 = [*(id *)(a1 + 32) distributedNotificationCenter];
    [v32 postNotificationName:@"com.apple.platformSSO.UserRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];

    __int16 v33 = [*(id *)(a1 + 32) distributedNotificationCenter];
    [v33 postNotificationName:@"com.apple.platformSSO.DeviceRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];

    return;
  }
  uint64_t v7 = [v5 registrationContext];
  uint64_t v8 = [v7 state];

  if (v8 == 4)
  {
    uint64_t v9 = dispatch_get_global_queue(0, 0);
    id v10 = v9;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_683;
    v37[3] = &unk_264BBF278;
    v37[4] = *(void *)(a1 + 32);
    int v11 = v37;
LABEL_15:
    dispatch_async(v9, v11);

    return;
  }
  __int16 v20 = [*(id *)(a1 + 32) registrationContext];
  uint64_t v21 = [v20 state];

  if (v21 == 7)
  {
    uint64_t v9 = dispatch_get_global_queue(0, 0);
    id v10 = v9;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_3;
    block[3] = &unk_264BBF278;
    block[4] = *(void *)(a1 + 32);
    int v11 = block;
    goto LABEL_15;
  }
  [*(id *)(a1 + 32) setRegistrationFailed:1];
  long long v34 = [*(id *)(a1 + 32) distributedNotificationCenter];
  [v34 postNotificationName:@"com.apple.platformSSO.UserRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];

  id v35 = [*(id *)(a1 + 32) distributedNotificationCenter];
  [v35 postNotificationName:@"com.apple.platformSSO.DeviceRegistrationStatusDidChange" object:0 userInfo:0 deliverImmediately:1];
}

id __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_671()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to remove login configuration after extension crash."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

id __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_677()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to remove user configuration after extension crash."];
  uint64_t v1 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

void __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_683(uint64_t a1)
{
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_2;
  activity_block[3] = &unk_264BBF278;
  activity_block[4] = *(void *)(a1 + 32);
  _os_activity_initiate(&dword_230E51000, "PSSODeviceRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registrationContext];
  int v3 = [v2 userNotified];

  int v4 = *(void **)(a1 + 32);
  if (v3)
  {
    return [v4 _startDeviceRegistration];
  }
  else
  {
    return [v4 showRegistrationUI];
  }
}

void __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_3(uint64_t a1)
{
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_4;
  activity_block[3] = &unk_264BBF278;
  activity_block[4] = *(void *)(a1 + 32);
  _os_activity_initiate(&dword_230E51000, "PSSOUserRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registrationContext];
  int v3 = [v2 userNotified];

  int v4 = *(void **)(a1 + 32);
  if (v3)
  {
    return [v4 _startUserRegistration];
  }
  else
  {
    return [v4 showRegistrationUI];
  }
}

- (id)createSignInNotificationWithAccountName:(id)a3 extensionIdentifier:(id)a4
{
  void v23[2] = *MEMORY[0x263EF8340];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  uint64_t v8 = [(POAgentAuthenticationProcess *)self loadSSOExtensionWithExtensionBundleIdentifier:v7];
  id v9 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  if (v6) {
    id v10 = v6;
  }
  else {
    id v10 = &stru_26E5C8990;
  }
  v22[0] = @"account_name";
  v22[1] = @"extension_identifier";
  v23[0] = v10;
  v23[1] = v7;
  int v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v9 setUserInfo:v11];

  [v9 setShouldBackgroundDefaultAction:1];
  char v12 = (void *)MEMORY[0x263F1DF40];
  uint64_t v13 = [v8 containerAppBundleIdentifier];
  id v14 = [v12 iconForApplicationIdentifier:v13];
  [v9 setIcon:v14];

  uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v16 = [v15 localizedStringForKey:@"NOTIFICATION_SIGNIN_TITLE" value:&stru_26E5C8990 table:0];
  [v9 setTitle:v16];

  if ([(__CFString *)v6 length])
  {
    char v17 = NSString;
    id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v19 = [v18 localizedStringForKey:@"CUSTOM_NOTIFICATION_SIGNIN_BODY" value:&stru_26E5C8990 table:0];
    __int16 v20 = objc_msgSend(v17, "localizedStringWithFormat:", v19, v6);
    [v9 setBody:v20];
  }
  else
  {
    id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v19 = [v18 localizedStringForKey:@"DEFAULT_NOTIFICATION_SIGNIN_BODY" value:&stru_26E5C8990 table:0];
    [v9 setBody:v19];
  }

  [v9 setCategoryIdentifier:@"LOGIN_USER"];
  [v9 setInterruptionLevel:2];
  [v9 setShouldPreventNotificationDismissalAfterDefaultAction:1];

  return v9;
}

- (id)createRegistrationNotificationWithAccountName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  [v5 setShouldBackgroundDefaultAction:1];
  id v6 = (void *)MEMORY[0x263F1DF40];
  id v7 = [(POAgentAuthenticationProcess *)self registrationContext];
  uint64_t v8 = [v7 containerAppBundleIdentifier];
  id v9 = [v6 iconForApplicationIdentifier:v8];
  [v5 setIcon:v9];

  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v11 = [v10 localizedStringForKey:@"NOTIFICATION_REGISTRATION_TITLE" value:&stru_26E5C8990 table:0];
  [v5 setTitle:v11];

  uint64_t v12 = [v4 length];
  uint64_t v13 = [(POAgentAuthenticationProcess *)self registrationContext];
  char v14 = [v13 isNewPasswordUser];

  if (v12)
  {
    if (v14)
    {
      uint64_t v15 = @"CUSTOM_NOTIFICATION_COMPLETE_REGISTRATION_BODY";
    }
    else
    {
      char v17 = [(POAgentAuthenticationProcess *)self registrationContext];
      int v18 = [v17 authMethod];

      if (v18 == 1) {
        uint64_t v15 = @"CUSTOM_PASSWORD_NOTIFICATION_REGISTRATION_BODY";
      }
      else {
        uint64_t v15 = @"CUSTOM_NOTIFICATION_REGISTRATION_BODY";
      }
    }
    uint64_t v19 = NSString;
    __int16 v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v21 = [v20 localizedStringForKey:v15 value:&stru_26E5C8990 table:0];
    char v22 = objc_msgSend(v19, "localizedStringWithFormat:", v21, v4);
    [v5 setBody:v22];
  }
  else
  {
    if (v14)
    {
      uint64_t v16 = @"DEFAULT_NOTIFICATION_COMPLETE_REGISTRATION_BODY";
    }
    else
    {
      uint64_t v23 = [(POAgentAuthenticationProcess *)self registrationContext];
      int v24 = [v23 authMethod];

      if (v24 == 1) {
        uint64_t v16 = @"DEFAULT_PASSWORD_NOTIFICATION_REGISTRATION_BODY";
      }
      else {
        uint64_t v16 = @"DEFAULT_NOTIFICATION_REGISTRATION_BODY";
      }
    }
    __int16 v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v21 = [v20 localizedStringForKey:v16 value:&stru_26E5C8990 table:0];
    [v5 setBody:v21];
  }

  uint64_t v25 = [(POAgentAuthenticationProcess *)self registrationContext];
  if ([v25 isUserNotification]) {
    __int16 v26 = @"REGISTER_USER";
  }
  else {
    __int16 v26 = @"REGISTER_DEVICE";
  }
  [v5 setCategoryIdentifier:v26];

  [v5 setInterruptionLevel:2];
  [v5 setShouldPreventNotificationDismissalAfterDefaultAction:1];

  return v5;
}

- (id)createRegistrationUpdateNotificationWithAccountName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  [v5 setShouldBackgroundDefaultAction:1];
  id v6 = (void *)MEMORY[0x263F1DF40];
  id v7 = [(POAgentAuthenticationProcess *)self registrationContext];
  uint64_t v8 = [v7 containerAppBundleIdentifier];
  id v9 = [v6 iconForApplicationIdentifier:v8];
  [v5 setIcon:v9];

  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v11 = [v10 localizedStringForKey:@"NOTIFICATION_REGISTRATION_UPDATE_TITLE" value:&stru_26E5C8990 table:0];
  [v5 setTitle:v11];

  if ([v4 length])
  {
    uint64_t v12 = NSString;
    uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v14 = [v13 localizedStringForKey:@"CUSTOM_NOTIFICATION_REGISTRATION_UPDATE_BODY" value:&stru_26E5C8990 table:0];
    uint64_t v15 = objc_msgSend(v12, "localizedStringWithFormat:", v14, v4);
    [v5 setBody:v15];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v14 = [v13 localizedStringForKey:@"DEFAULT_NOTIFICATION_REGISTRATION_UPDATE_BODY" value:&stru_26E5C8990 table:0];
    [v5 setBody:v14];
  }

  uint64_t v16 = [(POAgentAuthenticationProcess *)self registrationContext];
  if ([v16 isUserNotification]) {
    char v17 = @"REGISTER_USER";
  }
  else {
    char v17 = @"REGISTER_DEVICE";
  }
  [v5 setCategoryIdentifier:v17];

  [v5 setInterruptionLevel:2];
  [v5 setShouldPreventNotificationDismissalAfterDefaultAction:1];

  return v5;
}

- (id)createPasswordChangedNotificationWithAccountName:(id)a3 extensionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = (objc_class *)MEMORY[0x263F1DEF0];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  [v8 setShouldBackgroundDefaultAction:1];
  uint64_t v21 = 0;
  id v9 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v7 allowPlaceholder:0 error:&v21];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v9 containingBundleRecord];
    int v11 = [v10 bundleIdentifier];

    uint64_t v12 = [MEMORY[0x263F1DF40] iconForApplicationIdentifier:v11];
    [v8 setIcon:v12];
  }
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v14 = [v13 localizedStringForKey:@"NOTIFICATION_PASSWORDCHANGED_TITLE" value:&stru_26E5C8990 table:0];
  [v8 setTitle:v14];

  if ([v5 length])
  {
    uint64_t v15 = NSString;
    uint64_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v17 = [v16 localizedStringForKey:@"CUSTOM_NOTIFICATION_PASSWORDCHANGED_BODY" value:&stru_26E5C8990 table:0];
    int v18 = objc_msgSend(v15, "localizedStringWithFormat:", v17, v5);
    [v8 setBody:v18];
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v17 = [v16 localizedStringForKey:@"DEFAULT_NOTIFICATION_PASSWORDCHANGED_BODY" value:&stru_26E5C8990 table:0];
    [v8 setBody:v17];
  }

  [v8 setInterruptionLevel:2];
  uint64_t v19 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:180.0];
  [v8 setExpirationDate:v19];

  return v8;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[POAgentAuthenticationProcess userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]();
  }

  id v10 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  block[3] = &unk_264BBF590;
  id v14 = v7;
  uint64_t v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, block);
}

void __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v2 = PO_LOG_POAgentAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = [*(id *)(a1 + 32) actionIdentifier];
    id v4 = [*(id *)(a1 + 32) notification];
    id v5 = [v4 request];
    id v6 = [v5 content];
    id v7 = [v6 categoryIdentifier];
    *(_DWORD *)buf = 138543618;
    long long v79 = v3;
    __int16 v80 = 2114;
    long long v81 = v7;
    _os_log_impl(&dword_230E51000, v2, OS_LOG_TYPE_INFO, "%{public}@, %{public}@", buf, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) notification];
  id v9 = [v8 request];
  id v10 = [v9 content];
  id v11 = [v10 categoryIdentifier];

  int v12 = [v11 isEqualToString:@"LOGIN_USER"];
  uint64_t v13 = (void *)MEMORY[0x263F1E0D0];
  if (v12)
  {
    id v14 = [*(id *)(a1 + 32) actionIdentifier];
    if ([v14 isEqualToString:*MEMORY[0x263F1E0C8]])
    {
    }
    else
    {
      uint64_t v15 = [*(id *)(a1 + 32) actionIdentifier];
      int v16 = [v15 isEqualToString:@"LOGIN"];

      if (!v16)
      {
LABEL_8:
        char v22 = [*(id *)(a1 + 32) actionIdentifier];
        int v23 = [v22 isEqualToString:*v13];

        if (v23)
        {
          int v24 = dispatch_get_global_queue(0, 0);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_736;
          block[3] = &unk_264BBF278;
          void block[4] = *(void *)(a1 + 40);
          dispatch_async(v24, block);
        }
        uint64_t v25 = [*(id *)(a1 + 40) userNotificationCenter];
        __int16 v26 = [*(id *)(a1 + 32) notification];
        uint64_t v27 = [v26 request];
        __int16 v28 = [v27 identifier];
        id v77 = v28;
        id v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v77 count:1];
        [v25 removeDeliveredNotificationsWithIdentifiers:v29];

        uint64_t v30 = [*(id *)(a1 + 40) userNotificationCenter];
        long long v31 = [*(id *)(a1 + 32) notification];
        id v32 = [v31 request];
        __int16 v33 = [v32 identifier];
        char v76 = v33;
        long long v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:1];
        [v30 removePendingNotificationRequestsWithIdentifiers:v34];

        goto LABEL_11;
      }
    }
    char v17 = *(void **)(a1 + 40);
    int v18 = [*(id *)(a1 + 32) notification];
    uint64_t v19 = [v18 request];
    __int16 v20 = [v19 content];
    uint64_t v21 = [v20 userInfo];
    [v17 requestUserAuthenticationWithUserInfo:v21];

    goto LABEL_8;
  }
LABEL_11:
  if ([v11 isEqualToString:@"REGISTER_DEVICE"])
  {
    id v35 = [*(id *)(a1 + 32) actionIdentifier];
    char v36 = [v35 isEqualToString:*v13];

    uint64_t v37 = dispatch_get_global_queue(0, 0);
    __int16 v38 = v37;
    if (v36)
    {
      char v39 = v69;
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      __int16 v40 = __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_3;
    }
    else
    {
      char v39 = v70;
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      __int16 v40 = __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2;
    }
    v39[2] = v40;
    v39[3] = &unk_264BBF278;
    v39[4] = *(void *)(a1 + 40);
    dispatch_async(v37, v39);

    uint64_t v41 = [*(id *)(a1 + 40) userNotificationCenter];
    uint64_t v42 = [*(id *)(a1 + 32) notification];
    id v43 = [v42 request];
    id v44 = [v43 identifier];
    id v75 = v44;
    uint64_t v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v75 count:1];
    [v41 removeDeliveredNotificationsWithIdentifiers:v45];

    id v46 = [*(id *)(a1 + 40) userNotificationCenter];
    id v47 = [*(id *)(a1 + 32) notification];
    id v48 = [v47 request];
    id v49 = [v48 identifier];
    int v74 = v49;
    char v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v74 count:1];
    [v46 removePendingNotificationRequestsWithIdentifiers:v50];
  }
  if ([v11 isEqualToString:@"REGISTER_USER"])
  {
    id v51 = [*(id *)(a1 + 32) actionIdentifier];
    char v52 = [v51 isEqualToString:*v13];

    uint64_t v53 = dispatch_get_global_queue(0, 0);
    uint64_t v54 = v53;
    if (v52)
    {
      int v55 = v67;
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      uint64_t v56 = __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_5;
    }
    else
    {
      int v55 = v68;
      v68[0] = MEMORY[0x263EF8330];
      v68[1] = 3221225472;
      uint64_t v56 = __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_4;
    }
    v55[2] = v56;
    v55[3] = &unk_264BBF278;
    v55[4] = *(void *)(a1 + 40);
    dispatch_async(v53, v55);

    uint64_t v57 = [*(id *)(a1 + 40) userNotificationCenter];
    uint64_t v58 = [*(id *)(a1 + 32) notification];
    id v59 = [v58 request];
    id v60 = [v59 identifier];
    BOOL v73 = v60;
    uint64_t v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v73 count:1];
    [v57 removeDeliveredNotificationsWithIdentifiers:v61];

    id v62 = [*(id *)(a1 + 40) userNotificationCenter];
    id v63 = [*(id *)(a1 + 32) notification];
    id v64 = [v63 request];
    id v65 = [v64 identifier];
    id v72 = v65;
    uint64_t v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v72 count:1];
    [v62 removePendingNotificationRequestsWithIdentifiers:v66];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_736(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleUserNeedsReauthenticationAfterDelay:30.0];
}

uint64_t __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleDeviceRegistrationNotification];
}

uint64_t __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registrationContext];
  [v2 setRetry:1];

  int v3 = *(void **)(a1 + 32);

  return [v3 promptUserForRegistration];
}

uint64_t __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleUserRegistrationNotification];
}

uint64_t __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registrationContext];
  [v2 setRetry:1];

  int v3 = *(void **)(a1 + 32);

  return [v3 promptUserForRegistration];
}

- (void)setupNotificationCategories
{
  v28[1] = *MEMORY[0x263EF8340];
  int v3 = (void *)MEMORY[0x263F1DF10];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"NOTIFICATION_SIGNIN_BUTTON" value:&stru_26E5C8990 table:0];
  id v6 = [v3 actionWithIdentifier:@"LOGIN" title:v5 options:1];

  id v7 = (void *)MEMORY[0x263F1DF10];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"NOTIFICATION_REGISTER_BUTTON" value:&stru_26E5C8990 table:0];
  id v10 = [v7 actionWithIdentifier:@"REGISTER" title:v9 options:65537];

  id v11 = (void *)MEMORY[0x263F1DF28];
  v28[0] = v6;
  int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
  uint64_t v13 = MEMORY[0x263EFFA68];
  id v14 = [v11 categoryWithIdentifier:@"LOGIN_USER" actions:v12 intentIdentifiers:MEMORY[0x263EFFA68] options:5];

  uint64_t v15 = (void *)MEMORY[0x263F1DF28];
  uint64_t v27 = v10;
  int v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
  char v17 = [v15 categoryWithIdentifier:@"REGISTER_USER" actions:v16 intentIdentifiers:v13 options:5];

  int v18 = (void *)MEMORY[0x263F1DF28];
  __int16 v26 = v10;
  uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  __int16 v20 = [v18 categoryWithIdentifier:@"REGISTER_DEVICE" actions:v19 intentIdentifiers:v13 options:5];

  uint64_t v21 = [(POAgentAuthenticationProcess *)self userNotificationCenter];
  char v22 = (void *)MEMORY[0x263EFFA08];
  v25[0] = v14;
  v25[1] = v17;
  v25[2] = v20;
  int v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  int v24 = [v22 setWithArray:v23];
  [v21 setNotificationCategories:v24];
}

- (BOOL)registrationFailed
{
  return self->_registrationFailed;
}

- (void)setRegistrationFailed:(BOOL)a3
{
  self->_registrationFailed = a3;
}

- (POConfigurationManager)configurationManager
{
  return (POConfigurationManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfigurationManager:(id)a3
{
}

- (POAuthenticationProcess)authenticationProcess
{
  return (POAuthenticationProcess *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAuthenticationProcess:(id)a3
{
}

- (POJWKSStorageProvider)jwksStorageProvider
{
  return (POJWKSStorageProvider *)objc_getProperty(self, a2, 32, 1);
}

- (void)setJwksStorageProvider:(id)a3
{
}

- (SOConfigurationHost)configurationHost
{
  return (SOConfigurationHost *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfigurationHost:(id)a3
{
}

- (SOExtensionManager)extensionManager
{
  return (SOExtensionManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExtensionManager:(id)a3
{
}

- (POKeyBag)keyBag
{
  return (POKeyBag *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeyBag:(id)a3
{
}

- (POKeyWrap)keyWrap
{
  return (POKeyWrap *)objc_getProperty(self, a2, 64, 1);
}

- (void)setKeyWrap:(id)a3
{
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return (UNUserNotificationCenter *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUserNotificationCenter:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNotificationCenter:(id)a3
{
}

- (NSDistributedNotificationCenter)distributedNotificationCenter
{
  return (NSDistributedNotificationCenter *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDistributedNotificationCenter:(id)a3
{
}

- (POKerberosHelper)kerberosHelper
{
  return (POKerberosHelper *)objc_getProperty(self, a2, 96, 1);
}

- (void)setKerberosHelper:(id)a3
{
}

- (PODirectoryServices)directoryServices
{
  return (PODirectoryServices *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDirectoryServices:(id)a3
{
}

- (POTokenHelper)tokenHelper
{
  return (POTokenHelper *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTokenHelper:(id)a3
{
}

- (POKeychainHelper)keychainHelper
{
  return (POKeychainHelper *)objc_getProperty(self, a2, 120, 1);
}

- (void)setKeychainHelper:(id)a3
{
}

- (PORegistrationContext)registrationContext
{
  return (PORegistrationContext *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRegistrationContext:(id)a3
{
}

- (NSTimer)authenticationTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAuthenticationTimer:(id)a3
{
}

- (NSObject)authenticationTimerLock
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setAuthenticationTimerLock:(id)a3
{
}

- (NSDate)lastAuthenticationAttempt
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLastAuthenticationAttempt:(id)a3
{
}

- (NSString)userName
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUserName:(id)a3
{
}

- (BOOL)platformSSOAccount
{
  return self->_platformSSOAccount;
}

- (void)setPlatformSSOAccount:(BOOL)a3
{
  self->_platformSSOAccount = a3;
}

- (BOOL)platformSSOActive
{
  return self->_platformSSOActive;
}

- (void)setPlatformSSOActive:(BOOL)a3
{
  self->_platformSSOActive = a3;
}

- (NSObject)platformSSOActiveLock
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setPlatformSSOActiveLock:(id)a3
{
}

- (BOOL)enableNetworkChanges
{
  return self->_enableNetworkChanges;
}

- (void)setEnableNetworkChanges:(BOOL)a3
{
  self->_enableNetworkChanges = a3;
}

- (BOOL)shouldRunConfigurationChangeWhenUnlocked
{
  return self->_shouldRunConfigurationChangeWhenUnlocked;
}

- (void)setShouldRunConfigurationChangeWhenUnlocked:(BOOL)a3
{
  self->_shouldRunConfigurationChangeWhenUnlocked = a3;
}

- (OS_dispatch_queue)loginQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLoginQueue:(id)a3
{
}

- (id)__screenUnlockHandler
{
  return self->___screenUnlockHandler;
}

- (void)set__screenUnlockHandler:(id)a3
{
}

- (BOOL)screenUnlocked
{
  return self->_screenUnlocked;
}

- (void)setScreenUnlocked:(BOOL)a3
{
  self->_screenUnlocked = a3;
}

- (NSObject)screenUnlockLock
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setScreenUnlockLock:(id)a3
{
}

- (id)__shieldLoweredHandler
{
  return self->___shieldLoweredHandler;
}

- (void)set__shieldLoweredHandler:(id)a3
{
}

- (BOOL)shieldLowered
{
  return self->_shieldLowered;
}

- (void)setShieldLowered:(BOOL)a3
{
  self->_shieldLowered = a3;
}

- (NSObject)shieldLoweredLock
{
  return objc_getProperty(self, a2, 208, 1);
}

- (void)setShieldLoweredLock:(id)a3
{
}

- (POAgentAuthenticationProcessKerberosDelegate)kerberosDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_kerberosDelegate);

  return (POAgentAuthenticationProcessKerberosDelegate *)WeakRetained;
}

- (void)setKerberosDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_kerberosDelegate);
  objc_storeStrong((id *)&self->_shieldLoweredLock, 0);
  objc_storeStrong(&self->___shieldLoweredHandler, 0);
  objc_storeStrong((id *)&self->_screenUnlockLock, 0);
  objc_storeStrong(&self->___screenUnlockHandler, 0);
  objc_storeStrong((id *)&self->_loginQueue, 0);
  objc_storeStrong((id *)&self->_platformSSOActiveLock, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_lastAuthenticationAttempt, 0);
  objc_storeStrong((id *)&self->_authenticationTimerLock, 0);
  objc_storeStrong((id *)&self->_authenticationTimer, 0);
  objc_storeStrong((id *)&self->_registrationContext, 0);
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_tokenHelper, 0);
  objc_storeStrong((id *)&self->_directoryServices, 0);
  objc_storeStrong((id *)&self->_kerberosHelper, 0);
  objc_storeStrong((id *)&self->_distributedNotificationCenter, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_keyWrap, 0);
  objc_storeStrong((id *)&self->_keyBag, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_configurationHost, 0);
  objc_storeStrong((id *)&self->_jwksStorageProvider, 0);
  objc_storeStrong((id *)&self->_authenticationProcess, 0);

  objc_storeStrong((id *)&self->_configurationManager, 0);
}

- (void)initWithDelegate:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)handleScreenUnlockWithCredentialContext:tokenId:atLogin:tokenUnlock:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "PIN is set", v2, v3, v4, v5, v6);
}

- (void)handleScreenUnlockWithCredentialContext:tokenId:atLogin:tokenUnlock:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Password is set", v2, v3, v4, v5, v6);
}

- (void)handleScreenUnlockWithCredentialContext:tokenId:atLogin:tokenUnlock:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)doUnlockForSmartCardWithCredentialContext:tokenId:atLogin:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)doUnlockForPasswordWithCredentialContext:atLogin:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)doUnlockForTokenUnlockWithCredentialContext:atLogin:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)doUnlockForTokenLoginWithCredentialContext:atLogin:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)_doUnlockForTokenWithCredentialContext:atLogin:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

void __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Updating local account password", v2, v3, v4, v5, v6);
}

void __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_86_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F5E5F0] stringForLoginResult:a1];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_230E51000, a2, v4, "Password update result: %{public}@", v5);
}

- (void)doUnlockWithEmptyCredentialContext:atLogin:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

void __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "First Unlock", v2, v3, v4, v5, v6);
}

void __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Network Changed", v2, v3, v4, v5, v6);
}

void __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_102_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "not a PlatformSSO account", v2, v3, v4, v5, v6);
}

void __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_102_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Platform SSO not enabled", v2, v3, v4, v5, v6);
}

void __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_102_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Nothing to do", v2, v3, v4, v5, v6);
}

- (void)performLoginForCurrentUserWithPasswordContext:tokenId:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Auth in progress, skipping", v2, v3, v4, v5, v6);
}

- (void)performLoginForCurrentUserWithPasswordContext:tokenId:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)_doRefreshWithPasswordContext:tokenId:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)_doLoginWithPasswordContext:tokenId:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Using context from unlock.", v2, v3, v4, v5, v6);
}

- (void)_doLoginWithPasswordContext:(unsigned char *)a1 tokenId:(unsigned char *)a2 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_13(a1, a2);
  OUTLINED_FUNCTION_12(&dword_230E51000, v2, v3, "System cancelled context", v4);
}

- (void)_doLoginWithPasswordContext:tokenId:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "UI is available", v2, v3, v4, v5, v6);
}

- (void)_doLoginWithPasswordContext:tokenId:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Error evaluating context", v2, v3, v4, v5, v6);
}

- (void)_doLoginWithPasswordContext:(unsigned char *)a1 tokenId:(unsigned char *)a2 .cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_13(a1, a2);
  OUTLINED_FUNCTION_12(&dword_230E51000, v2, v3, "Waiting for UI to be available", v4);
}

- (void)_doLoginWithPasswordContext:tokenId:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "find attribute mapping token id hash", v2, v3, v4, v5, v6);
}

- (void)_doLoginWithPasswordContext:tokenId:.cold.7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "find bound token id hash", v2, v3, v4, v5, v6);
}

- (void)_doLoginWithPasswordContext:tokenId:.cold.8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

void __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_275_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Key rotation was cancelled.", v2, v3, v4, v5, v6);
}

void __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_275_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Key rotation failed.", v2, v3, v4, v5, v6);
}

- (void)handleKeyUpdatesWithPasswordContext:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Checking for key updates", v2, v3, v4, v5, v6);
}

- (void)requestUserAuthenticationWithUserInfo:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)requestUserAuthenticationSyncPassword:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)requestSmartCardForBinding:tokenId:tokenHash:wrapTokenHash:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)requestUserAuthenticationWithWindow:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)showAlertMessage:messageText:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)showAlertWithError:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)handleKeyRequestSync
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)postAuthenticationNotification:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)handleUserNeedsReauthenticationAfterDelay:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

void __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_346_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_8(&dword_230E51000, v0, (uint64_t)v0, "%{public}@, %{public}@", v1);
}

void __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_8(&dword_230E51000, v0, (uint64_t)v0, "%{public}@, %{public}@", v1);
}

- (void)requestUserPasswordChangePreference
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)handleUserCredentialNeededAtLogin:smartCard:accountDisplayName:bundleIdentifier:returningContext:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)handleUserAuthorizationNeededForAccountDisplayName:bundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

void __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_383_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Registration is repair or non PlatformSSO User, completing registration.", v2, v3, v4, v5, v6);
}

- (void)handleDeviceAndUserRegistrationForRepair:(int)a1 newPasswordUser:(NSObject *)a2 newSmartCardUser:notified:profile:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_debug_impl(&dword_230E51000, a2, OS_LOG_TYPE_DEBUG, "Using authentication method %{public}d", (uint8_t *)v2, 8u);
}

- (void)configurationChanged:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "configurationChanged changed by MDM, waiting for daemon", v2, v3, v4, v5, v6);
}

- (void)configurationChanged:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_230E51000, v0, v1, "configurationChanged reason: %{public}@", v2);
}

- (void)handleConfigurationChanged:startup:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "no existing login configuration for config changed", v2, v3, v4, v5, v6);
}

- (void)handleConfigurationChanged:startup:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "no existing user configuration for config changed", v2, v3, v4, v5, v6);
}

- (void)handleConfigurationChanged:startup:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "no existing device configuration for config changed", v2, v3, v4, v5, v6);
}

- (void)handleKerberosMappingForTokens:(unsigned char *)a1 loginConfiguration:(unsigned char *)a2 userConfiguration:.cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_13(a1, a2);
  OUTLINED_FUNCTION_12(&dword_230E51000, v2, v3, "TGT mapping not found", v4);
}

void __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_611_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  int v2 = objc_msgSend((id)OUTLINED_FUNCTION_7_1(v0, v1), "ticketKeyPath");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_230E51000, v3, v4, "%{public}@, %{public}@", v5, v6, v7, v8, v9);
}

void __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_617_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  uint64_t v1 = [*(id *)(v0 + 40) ticketKeyPath];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_230E51000, v2, v3, "%{public}@, %{public}@", v4, v5, v6, v7, v8);
}

- (void)handlePendingSSOTokensWithSharedData:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "no stored tokens", v2, v3, v4, v5, v6);
}

- (void)isCurrentSSOExtension:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

@end