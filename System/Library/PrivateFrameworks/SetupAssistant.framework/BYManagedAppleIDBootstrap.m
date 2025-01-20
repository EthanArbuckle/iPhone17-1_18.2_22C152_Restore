@interface BYManagedAppleIDBootstrap
+ (BOOL)isFirstTimeLogin;
+ (BOOL)isManagedAppleIDSignedIn;
+ (BOOL)isMultiUser;
+ (BOOL)isSettingUpMultiUser;
+ (id)delegateBundleIDsForManagedAccount;
+ (id)sharedManager;
- (BOOL)isLoginUser;
- (BOOL)needsToUpgradeShortLivedToken;
- (BOOL)passwordChangeFlowNeedsToRun;
- (BOOL)shouldRetrySilentLoginUpgrade;
- (BYManagedAppleIDBootstrap)init;
- (BYPreferencesController)buddyPreferences;
- (NSDictionary)authenticationResults;
- (NSString)shortLivedToken;
- (OS_dispatch_queue)notificationQueue;
- (UMUserSwitchContext)userSwitchContext;
- (id)_authenticationContextWithAuthenticationResults:(id)a3;
- (id)_fetchAKURLBagSynchronously;
- (id)_languageConfigurationDictionary;
- (int)notifyToken;
- (int64_t)silentLoginUpgradeRetryCount;
- (void)_createAppleAccountWithAuthenticationResults:(id)a3 completion:(id)a4;
- (void)_fetchAKURLBagSynchronously;
- (void)_modifyAuthenticationContextIfNeeded:(id)a3;
- (void)_registerForStartupCompletionNotificationWithTask:(id)a3;
- (void)_runPostStartupTasksWithAccountStore:(id)a3 completion:(id)a4;
- (void)_runSilentLoginUpgradeWithCompletion:(id)a3 shortLivedTokenUpgradeCompletion:(id)a4;
- (void)_upgradeShortLivedTokenCompletion:(id)a3;
- (void)dealloc;
- (void)ingestManagedBuddyData;
- (void)markUserWithManagedCredentials;
- (void)postUserSwitchContextHasBeenUsed;
- (void)recoverEMCSWithCompletion:(id)a3;
- (void)runSilentLoginUpgradeIfNeededWithCompletion:(id)a3 shortLivedTokenUpgradeCompletion:(id)a4;
- (void)runSilentLoginUpgradeIfNeededWithCompletion:(id)a3 shortLivedTokenUpgradeCompletion:(id)a4 willNotCompleteBlock:(id)a5;
- (void)setAuthenticationResults:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setShouldRetrySilentLoginUpgrade:(BOOL)a3;
- (void)setSilentLoginUpgradeRetryCount:(int64_t)a3;
- (void)switchToLoginWindowDueToError:(id)a3 completion:(id)a4;
- (void)userSwitchContextHasBeenUsed;
- (void)writeAccountConfigurationIfNeededWithCompletion:(id)a3;
@end

@implementation BYManagedAppleIDBootstrap

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_6);
  }
  v2 = (void *)sharedManager_instance_0;
  return v2;
}

uint64_t __42__BYManagedAppleIDBootstrap_sharedManager__block_invoke()
{
  sharedManager_instance_0 = objc_alloc_init(BYManagedAppleIDBootstrap);
  return MEMORY[0x1F41817F8]();
}

+ (id)delegateBundleIDsForManagedAccount
{
  return &unk_1EFE4E4C0;
}

- (BYManagedAppleIDBootstrap)init
{
  v8.receiver = self;
  v8.super_class = (Class)BYManagedAppleIDBootstrap;
  v2 = [(BYManagedAppleIDBootstrap *)&v8 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)BYUserSwitchContextHasBeenUsed, @"BYUserSwitchContextHasBeenUsed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = +[BYNetworkMonitor sharedInstance];
    [v4 addObserver:v2];

    v2->_silentLoginUpgradeRetryCount = 0;
    uint64_t v5 = +[BYPreferencesController buddyPreferences];
    buddyPreferences = v2->_buddyPreferences;
    v2->_buddyPreferences = (BYPreferencesController *)v5;
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"BYUserSwitchContextHasBeenUsed", 0);
  v4.receiver = self;
  v4.super_class = (Class)BYManagedAppleIDBootstrap;
  [(BYManagedAppleIDBootstrap *)&v4 dealloc];
}

+ (BOOL)isMultiUser
{
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  char v3 = [v2 isMultiUser];

  return v3;
}

+ (BOOL)isFirstTimeLogin
{
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  if ([v2 isMultiUser])
  {
    char v3 = [MEMORY[0x1E4FB36F8] sharedManager];
    objc_super v4 = [v3 currentUser];
    char v5 = [v4 inFirstLoginSession];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isSettingUpMultiUser
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v11 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getMCProfileConnectionClass_block_invoke;
    v7[3] = &unk_1E5D2B9E8;
    v7[4] = &v8;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  objc_super v4 = [v3 sharedConnection];
  BOOL v5 = [v4 userMode] == 1 && !objc_msgSend(v4, "isEphemeralMultiUser");

  return v5;
}

+ (BOOL)isManagedAppleIDSignedIn
{
  v2 = [MEMORY[0x1E4F179C8] defaultStore];
  id v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  LOBYTE(v2) = objc_msgSend(v3, "aa_isManagedAppleID");
  return (char)v2;
}

- (BOOL)isLoginUser
{
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v3 = [v2 currentUser];
  char v4 = [v3 isLoginUser];

  return v4;
}

- (void)userSwitchContextHasBeenUsed
{
  id v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "User switch context has been used", v6, 2u);
  }

  userSwitchContext = self->_userSwitchContext;
  if (userSwitchContext)
  {
    self->_userSwitchContext = 0;

    BOOL v5 = [MEMORY[0x1E4FB36F8] sharedManager];
    [v5 currentUserSwitchContextHasBeenUsed];
  }
}

- (UMUserSwitchContext)userSwitchContext
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  userSwitchContext = self->_userSwitchContext;
  if (!userSwitchContext)
  {
    char v4 = [MEMORY[0x1E4FB36F8] sharedManager];
    BOOL v5 = [v4 currentUserSwitchContext];
    v6 = self->_userSwitchContext;
    self->_userSwitchContext = v5;

    if (self->_userSwitchContext)
    {
      v7 = _BYLoggingFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = [(UMUserSwitchContext *)self->_userSwitchContext secondaryActionRequired];
        v9 = @"NERP";
        if (v8) {
          v9 = @"YASE";
        }
        int v11 = 138543362;
        v12 = v9;
        _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Fetched user switch context. Password change required = %{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
    userSwitchContext = self->_userSwitchContext;
  }
  return userSwitchContext;
}

- (NSString)shortLivedToken
{
  v2 = [(BYManagedAppleIDBootstrap *)self userSwitchContext];
  id v3 = [v2 shortLivedToken];
  char v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (BOOL)passwordChangeFlowNeedsToRun
{
  v2 = [(BYManagedAppleIDBootstrap *)self userSwitchContext];
  char v3 = [v2 secondaryActionRequired];

  return v3;
}

- (OS_dispatch_queue)notificationQueue
{
  notificationQueue = self->_notificationQueue;
  if (!notificationQueue)
  {
    char v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.purplebuddy.startupNotificationQueue", 0);
    BOOL v5 = self->_notificationQueue;
    self->_notificationQueue = v4;

    notificationQueue = self->_notificationQueue;
  }
  return notificationQueue;
}

- (void)postUserSwitchContextHasBeenUsed
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A7DED000, log, OS_LOG_TYPE_DEBUG, "Posting user switch context usage...", v1, 2u);
}

- (void)ingestManagedBuddyData
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_DEBUG, "Buddy data from IdMS: %@", (uint8_t *)&v2, 0xCu);
}

- (BOOL)needsToUpgradeShortLivedToken
{
  if (![(id)objc_opt_class() isMultiUser]) {
    return 0;
  }
  uint64_t v3 = [(BYManagedAppleIDBootstrap *)self shortLivedToken];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)switchToLoginWindowDueToError:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = _BYLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (_BYIsInternalInstall())
    {
      int v9 = 0;
      uint64_t v10 = v6;
    }
    else if (v6)
    {
      int v11 = NSString;
      BOOL v4 = [v6 domain];
      uint64_t v10 = [v11 stringWithFormat:@"<Error domain: %@, code %ld>", v4, objc_msgSend(v6, "code")];
      int v9 = 1;
    }
    else
    {
      int v9 = 0;
      uint64_t v10 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v17 = v10;
    _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "Unrecoverable error, switching to Login Window: %{public}@", buf, 0xCu);
    if (v9)
    {
    }
  }

  v12 = [MEMORY[0x1E4FB36F8] sharedManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__BYManagedAppleIDBootstrap_switchToLoginWindowDueToError_completion___block_invoke;
  v14[3] = &unk_1E5D2BE90;
  id v15 = v7;
  id v13 = v7;
  [v12 switchToLoginUserWithError:v6 completionHandler:v14];
}

void __70__BYManagedAppleIDBootstrap_switchToLoginWindowDueToError_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    BOOL v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = _BYIsInternalInstall();
      id v7 = v4;
      if ((v6 & 1) == 0)
      {
        int v8 = NSString;
        int v2 = [v4 domain];
        id v7 = [v8 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v4, "code")];
      }
      *(_DWORD *)buf = 138543362;
      int v11 = v7;
      _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Switch to Login Window failed: %{public}@", buf, 0xCu);
      if ((v6 & 1) == 0)
      {
      }
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v4);
  }
}

- (void)_runSilentLoginUpgradeWithCompletion:(id)a3 shortLivedTokenUpgradeCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__BYManagedAppleIDBootstrap__runSilentLoginUpgradeWithCompletion_shortLivedTokenUpgradeCompletion___block_invoke;
  v10[3] = &unk_1E5D2BF18;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(BYManagedAppleIDBootstrap *)self _upgradeShortLivedTokenCompletion:v10];
}

void __99__BYManagedAppleIDBootstrap__runSilentLoginUpgradeWithCompletion_shortLivedTokenUpgradeCompletion___block_invoke(id *a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a1[4];
  if (a2)
  {
    [v6 postUserSwitchContextHasBeenUsed];
    if (a1[5])
    {
      id v7 = _BYLoggingFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Short lived token upgrade completed with success. Will call shortLivedTokenUpgradeCompletion", buf, 2u);
      }

      (*((void (**)(void))a1[5] + 2))();
    }
    kdebug_trace();
    id v8 = a1[4];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__BYManagedAppleIDBootstrap__runSilentLoginUpgradeWithCompletion_shortLivedTokenUpgradeCompletion___block_invoke_59;
    v19[3] = &unk_1E5D2BEC8;
    id v20 = a1[6];
    [v8 recoverEMCSWithCompletion:v19];
    id v9 = v20;
LABEL_11:

    goto LABEL_12;
  }
  if ([v6 silentLoginUpgradeRetryCount] <= 1)
  {
    objc_msgSend(a1[4], "setSilentLoginUpgradeRetryCount:", objc_msgSend(a1[4], "silentLoginUpgradeRetryCount") + 1);
    uint64_t v10 = _BYLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [a1[4] silentLoginUpgradeRetryCount];
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = v11;
      _os_log_impl(&dword_1A7DED000, v10, OS_LOG_TYPE_DEFAULT, "Retrying Silent Token Upgrade, retry count: %ld", buf, 0xCu);
    }

    id v12 = +[BYNetworkMonitor sharedInstance];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __99__BYManagedAppleIDBootstrap__runSilentLoginUpgradeWithCompletion_shortLivedTokenUpgradeCompletion___block_invoke_61;
    v16[3] = &unk_1E5D2BEF0;
    v16[4] = a1[4];
    id v17 = a1[6];
    id v18 = a1[5];
    [v12 withMinimumNetworkType:1 timeout:v16 runBlock:10.0];

    id v9 = v17;
    goto LABEL_11;
  }
  if (a1[6])
  {
    id v13 = _BYLoggingFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [a1[4] silentLoginUpgradeRetryCount];
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = v14;
      _os_log_impl(&dword_1A7DED000, v13, OS_LOG_TYPE_DEFAULT, "Silent login upgrade failed with an error, retry count: %ld", buf, 0xCu);
    }

    if (a1[5])
    {
      id v15 = _BYLoggingFacility();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7DED000, v15, OS_LOG_TYPE_DEFAULT, "Will call shortLivedTokenUpgradeCompletion", buf, 2u);
      }

      (*((void (**)(void))a1[5] + 2))();
    }
    (*((void (**)(void))a1[6] + 2))();
  }
LABEL_12:
}

void __99__BYManagedAppleIDBootstrap__runSilentLoginUpgradeWithCompletion_shortLivedTokenUpgradeCompletion___block_invoke_59(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  kdebug_trace();
  if (v6 || (a2 & 1) == 0)
  {
    id v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (_BYIsInternalInstall())
      {
        int v9 = 0;
        uint64_t v10 = v6;
      }
      else if (v6)
      {
        uint64_t v11 = NSString;
        uint64_t v3 = [v6 domain];
        uint64_t v10 = [v11 stringWithFormat:@"<Error domain: %@, code %ld>", v3, objc_msgSend(v6, "code")];
        int v9 = 1;
      }
      else
      {
        int v9 = 0;
        uint64_t v10 = 0;
      }
      *(_DWORD *)buf = 138543362;
      id v13 = v10;
      _os_log_error_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_ERROR, "Continuing despite EMCS recovery failure with error: %{public}@", buf, 0xCu);
      if (v9)
      {
      }
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
}

uint64_t __99__BYManagedAppleIDBootstrap__runSilentLoginUpgradeWithCompletion_shortLivedTokenUpgradeCompletion___block_invoke_61(uint64_t a1, int a2)
{
  id v4 = _BYLoggingFacility();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      __int16 v10 = 0;
      id v6 = "Timed out waiting for Wi-Fi!";
      id v7 = (uint8_t *)&v10;
LABEL_6:
      _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    __int16 v9 = 0;
    id v6 = "Wi-Fi Acquired!";
    id v7 = (uint8_t *)&v9;
    goto LABEL_6;
  }

  return [*(id *)(a1 + 32) _runSilentLoginUpgradeWithCompletion:*(void *)(a1 + 40) shortLivedTokenUpgradeCompletion:*(void *)(a1 + 48)];
}

- (void)runSilentLoginUpgradeIfNeededWithCompletion:(id)a3 shortLivedTokenUpgradeCompletion:(id)a4
{
}

- (void)runSilentLoginUpgradeIfNeededWithCompletion:(id)a3 shortLivedTokenUpgradeCompletion:(id)a4 willNotCompleteBlock:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v7 = a3;
  }
  else {
    id v7 = &__block_literal_global_64;
  }
  id v8 = a5;
  id v9 = a4;
  __int16 v10 = (void (**)(void, void))MEMORY[0x1AD0DBFE0](v7);
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = &__block_literal_global_66;
  }
  id v12 = (void (**)(void))MEMORY[0x1AD0DBFE0](v11);

  if (v8) {
    id v13 = v8;
  }
  else {
    id v13 = &__block_literal_global_68;
  }
  uint64_t v14 = (void *)MEMORY[0x1AD0DBFE0](v13);

  if (([(id)objc_opt_class() isMultiUser] & 1) == 0) {
    goto LABEL_22;
  }
  BOOL v15 = [(BYManagedAppleIDBootstrap *)self needsToUpgradeShortLivedToken];
  BOOL v16 = [(BYManagedAppleIDBootstrap *)self passwordChangeFlowNeedsToRun];
  if ([(id)objc_opt_class() isMultiUser]) {
    int v17 = v15 && !v16;
  }
  else {
    int v17 = 0;
  }
  id v18 = _BYLoggingFacility();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    BOOL v30 = v15;
    __int16 v31 = 1024;
    BOOL v32 = v16;
    __int16 v33 = 1024;
    int v34 = v17;
    _os_log_impl(&dword_1A7DED000, v18, OS_LOG_TYPE_DEFAULT, "Silent token upgrade requirements: needs upgrade: %d, password change required: %d, running silent upgrade: %d", buf, 0x14u);
  }

  if (v17)
  {
    if (+[BYManagedAppleIDBootstrap isFirstTimeLogin])
    {
      v19 = +[BYAppleIDAccountsManager sharedManager];
      id v20 = [(id)objc_opt_class() delegateBundleIDsForManagedAccount];
      [v19 preloadDefaultLoginParametersWithBundleIDs:v20];

      v21 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_70;
      block[3] = &unk_1E5D2BA60;
      block[4] = self;
      dispatch_async(v21, block);
    }
    CFPreferencesSetAppValue(@"silentTokenUpgradeInProgress", (CFPropertyListRef)*MEMORY[0x1E4F1CFD0], @"com.apple.purplebuddy.notbackedup");
    CFPreferencesAppSynchronize(@"com.apple.purplebuddy.notbackedup");
    kdebug_trace();
    uint64_t v22 = _BYLoggingFacility();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v22, OS_LOG_TYPE_DEFAULT, "Waiting for Wi-Fi...", buf, 2u);
    }

    uint64_t v23 = +[BYNetworkMonitor sharedInstance];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_71;
    v24[3] = &unk_1E5D2BFB0;
    v24[4] = self;
    v25 = v10;
    id v26 = v14;
    v27 = v12;
    [v23 withMinimumNetworkType:1 timeout:v24 runBlock:20.0];
  }
  else
  {
LABEL_22:
    v12[2](v12);
    v10[2](v10, 0);
  }
}

id __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_70(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _fetchAKURLBagSynchronously];
}

void __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_71(uint64_t a1, int a2)
{
  kdebug_trace();
  id v4 = _BYLoggingFacility();
  BOOL v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Timed out waiting for Wi-Fi!", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_71_cold_1(v5);
  }

  [*(id *)(a1 + 32) setSilentLoginUpgradeRetryCount:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_72;
  v8[3] = &unk_1E5D2BF88;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  id v10 = *(id *)(a1 + 48);
  [v6 _runSilentLoginUpgradeWithCompletion:v8 shortLivedTokenUpgradeCompletion:*(void *)(a1 + 56)];
}

void __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_72(id *a1, void *a2)
{
  id v3 = a2;
  CFPreferencesSetAppValue(@"silentTokenUpgradeInProgress", 0, @"com.apple.purplebuddy.notbackedup");
  CFPreferencesAppSynchronize(@"com.apple.purplebuddy.notbackedup");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"silentTokenUpgradeCompleted", 0, 0, 1u);
  if (!v3)
  {
    [a1[4] markUserWithManagedCredentials];
    id v6 = (void (*)(void))*((void *)a1[5] + 2);
LABEL_8:
    v6();
    goto LABEL_9;
  }
  if (!+[BYManagedAppleIDBootstrap isFirstTimeLogin])
  {
    id v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_72_cold_1((uint64_t)v3, v7);
    }

    id v6 = (void (*)(void))*((void *)a1[5] + 2);
    goto LABEL_8;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_73;
  v8[3] = &unk_1E5D2BF60;
  id v5 = a1[4];
  id v9 = a1[5];
  id v10 = a1[6];
  [v5 switchToLoginWindowDueToError:v3 completion:v8];

LABEL_9:
}

uint64_t __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_73(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  else
  {
    id v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Blocking indefinitely as we are attempting logout.", v6, 2u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_runPostStartupTasksWithAccountStore:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [(BYManagedAppleIDBootstrap *)self authenticationResults];

  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F4D938]) initWithAccountStore:v6];
    id v10 = [(BYManagedAppleIDBootstrap *)self authenticationResults];
    uint64_t v11 = [(BYManagedAppleIDBootstrap *)self _authenticationContextWithAuthenticationResults:v10];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke;
    v32[3] = &unk_1E5D2BFD8;
    v32[4] = self;
    id v33 = v6;
    id v12 = (void *)MEMORY[0x1AD0DBFE0](v32);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_76;
    v29[3] = &unk_1E5D2BFD8;
    id v13 = v9;
    id v30 = v13;
    id v14 = v11;
    id v31 = v14;
    BOOL v15 = (void *)MEMORY[0x1AD0DBFE0](v29);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_78;
    v26[3] = &unk_1E5D2BFD8;
    id v27 = v13;
    id v28 = v14;
    id v16 = v14;
    id v17 = v13;
    id v18 = (void *)MEMORY[0x1AD0DBFE0](v26);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_81;
    v22[3] = &unk_1E5D2C078;
    id v23 = v12;
    id v24 = v18;
    v25 = v7;
    v19 = (void (*)(void *, void *))v15[2];
    id v20 = v18;
    id v21 = v12;
    v19(v15, v22);
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [BYAppleIDAccountsManager alloc];
  id v5 = [(id)objc_opt_class() delegateBundleIDsForManagedAccount];
  id v6 = [(BYAppleIDAccountsManager *)v4 initForDelegateBundleIDs:v5];

  id v7 = objc_msgSend(*(id *)(a1 + 40), "aa_primaryAppleAccount");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2;
  v9[3] = &unk_1E5D2BEC8;
  id v10 = v3;
  id v8 = v3;
  [v6 enableDataClassesForAccount:v7 completion:v9];
}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _BYLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (_BYIsInternalInstall())
    {
      int v8 = 0;
      id v9 = v6;
    }
    else if (v6)
    {
      id v10 = NSString;
      id v3 = [v6 domain];
      id v9 = [v10 stringWithFormat:@"<Error domain: %@, code %ld>", v3, objc_msgSend(v6, "code")];
      int v8 = 1;
    }
    else
    {
      int v8 = 0;
      id v9 = 0;
    }
    *(_DWORD *)buf = 67109378;
    int v13 = a2;
    __int16 v14 = 2114;
    BOOL v15 = v9;
    _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Finished enabling data classes with success: %d, error: %{public}@", buf, 0x12u);
    if (v8)
    {
    }
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(void))(v11 + 16))();
  }
}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_76(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4F4D908];
  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2_77;
  v8[3] = &unk_1E5D2BEC8;
  id v9 = v3;
  id v7 = v3;
  [v6 signInService:v4 withContext:v5 completion:v8];
}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2_77(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _BYLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (_BYIsInternalInstall())
    {
      int v8 = 0;
      id v9 = v6;
    }
    else if (v6)
    {
      id v10 = NSString;
      id v3 = [v6 domain];
      id v9 = [v10 stringWithFormat:@"<Error domain: %@, code %ld>", v3, objc_msgSend(v6, "code")];
      int v8 = 1;
    }
    else
    {
      int v8 = 0;
      id v9 = 0;
    }
    *(_DWORD *)buf = 67109378;
    int v13 = a2;
    __int16 v14 = 2114;
    BOOL v15 = v9;
    _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Finished signing in iTunes account with success: %d, error: %{public}@", buf, 0x12u);
    if (v8)
    {
    }
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(void))(v11 + 16))();
  }
}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_78(uint64_t a1, void *a2)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *MEMORY[0x1E4F4D8F0];
  v11[0] = *MEMORY[0x1E4F4D900];
  v11[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2_79;
  v9[3] = &unk_1E5D2C000;
  id v10 = v3;
  id v8 = v3;
  [v4 signInToServices:v6 usingContext:v7 completion:v9];
}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2_79(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "Finished signing in Messages & FaceTime account with success: %d, result: %{public}@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_81(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2_82;
  v3[3] = &unk_1E5D2C050;
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2_82(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_3;
  v2[3] = &unk_1E5D2C028;
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)recoverEMCSWithCompletion:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "Starting EMCS Recovery...", buf, 2u);
  }

  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2050000000;
  id v5 = (void *)getSecureBackupClass_softClass;
  uint64_t v25 = getSecureBackupClass_softClass;
  if (!getSecureBackupClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __getSecureBackupClass_block_invoke;
    id v20 = &unk_1E5D2B9E8;
    id v21 = &v22;
    __getSecureBackupClass_block_invoke((uint64_t)buf);
    id v5 = (void *)v23[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v22, 8);
  uint64_t v7 = objc_opt_new();
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  id v8 = (id *)getkSecureBackupContainsEMCSDataKeySymbolLoc_ptr;
  uint64_t v25 = getkSecureBackupContainsEMCSDataKeySymbolLoc_ptr;
  if (!getkSecureBackupContainsEMCSDataKeySymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __getkSecureBackupContainsEMCSDataKeySymbolLoc_block_invoke;
    id v20 = &unk_1E5D2B9E8;
    id v21 = &v22;
    __int16 v9 = (void *)CloudServicesLibrary();
    id v10 = dlsym(v9, "kSecureBackupContainsEMCSDataKey");
    *(void *)(v21[1] + 24) = v10;
    getkSecureBackupContainsEMCSDataKeySymbolLoc_ptr = *(void *)(v21[1] + 24);
    id v8 = (id *)v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (!v8)
  {
    +[BYSiriUtilities deviceSupportsSystemAssistantExperience]();
    __break(1u);
  }
  id v26 = *v8;
  v27[0] = MEMORY[0x1E4F1CC38];
  uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
  id v12 = v26;
  int v13 = [v11 dictionaryWithObjects:v27 forKeys:&v26 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__BYManagedAppleIDBootstrap_recoverEMCSWithCompletion___block_invoke;
  v15[3] = &unk_1E5D2C0A0;

  id v16 = v3;
  id v14 = v3;
  [v7 recoverWithInfo:v13 completionBlock:v15];
}

void __55__BYManagedAppleIDBootstrap_recoverEMCSWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (_BYIsInternalInstall())
    {
      int v7 = 0;
      id v8 = v5;
    }
    else if (v5)
    {
      __int16 v9 = NSString;
      id v3 = [v5 domain];
      id v8 = [v9 stringWithFormat:@"<Error domain: %@, code %ld>", v3, objc_msgSend(v5, "code")];
      int v7 = 1;
    }
    else
    {
      int v7 = 0;
      id v8 = 0;
    }
    *(_DWORD *)buf = 138543362;
    id v12 = v8;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "EMCS recovery completed with error: %{public}@", buf, 0xCu);
    if (v7)
    {
    }
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, v5 == 0, v5);
  }
}

- (void)_createAppleAccountWithAuthenticationResults:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  kdebug_trace();
  id v8 = objc_alloc_init((Class)getACAccountStoreClass());
  __int16 v9 = [(BYManagedAppleIDBootstrap *)self _authenticationContextWithAuthenticationResults:v7];

  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F4D938]) initWithAccountStore:v8];
  uint64_t v11 = *MEMORY[0x1E4F4D8E8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__BYManagedAppleIDBootstrap__createAppleAccountWithAuthenticationResults_completion___block_invoke;
  v13[3] = &unk_1E5D2BEC8;
  id v14 = v6;
  id v12 = v6;
  [v10 signInService:v11 withContext:v9 completion:v13];
}

void __85__BYManagedAppleIDBootstrap__createAppleAccountWithAuthenticationResults_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _BYLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (_BYIsInternalInstall())
    {
      int v8 = 0;
      __int16 v9 = v6;
    }
    else if (v6)
    {
      uint64_t v10 = NSString;
      id v3 = [v6 domain];
      __int16 v9 = [v10 stringWithFormat:@"<Error domain: %@, code %ld>", v3, objc_msgSend(v6, "code")];
      int v8 = 1;
    }
    else
    {
      int v8 = 0;
      __int16 v9 = 0;
    }
    *(_DWORD *)buf = 67109378;
    int v13 = a2;
    __int16 v14 = 2114;
    BOOL v15 = v9;
    _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Finished signing in iCloud account with success: %d, error: %{public}@", buf, 0x12u);
    if (v8)
    {
    }
  }

  kdebug_trace();
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v6);
  }
}

- (void)_registerForStartupCompletionNotificationWithTask:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  id v5 = (const char *)[@"com.apple.LoginKit.isLoggedIn" UTF8String];
  id v6 = [(BYManagedAppleIDBootstrap *)self notificationQueue];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __79__BYManagedAppleIDBootstrap__registerForStartupCompletionNotificationWithTask___block_invoke;
  handler[3] = &unk_1E5D2C0C8;
  id v7 = v4;
  id v16 = v7;
  id v17 = v18;
  LODWORD(v5) = notify_register_dispatch(v5, &self->_notifyToken, v6, handler);

  if (v5)
  {
    int v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BYManagedAppleIDBootstrap _registerForStartupCompletionNotificationWithTask:](v8);
    }
  }
  dispatch_time_t v9 = dispatch_time(0, 30000000000);
  uint64_t v10 = [(BYManagedAppleIDBootstrap *)self notificationQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__BYManagedAppleIDBootstrap__registerForStartupCompletionNotificationWithTask___block_invoke_85;
  v12[3] = &unk_1E5D2C0F0;
  id v13 = v7;
  __int16 v14 = v18;
  id v11 = v7;
  dispatch_after(v9, v10, v12);

  _Block_object_dispose(v18, 8);
}

uint64_t __79__BYManagedAppleIDBootstrap__registerForStartupCompletionNotificationWithTask___block_invoke(uint64_t a1)
{
  uint64_t v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "User logged in notification received", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      uint64_t result = (*(uint64_t (**)(void))(result + 16))();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t __79__BYManagedAppleIDBootstrap__registerForStartupCompletionNotificationWithTask___block_invoke_85(uint64_t a1)
{
  uint64_t v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Stop waiting for startup completion", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      uint64_t result = (*(uint64_t (**)(void))(result + 16))();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

- (void)_upgradeShortLivedTokenCompletion:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "Running silent short-lived token upgrade...", buf, 2u);
  }

  id v31 = 0;
  if (!AppleAccountLibraryCore_frameworkLibrary)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __AppleAccountLibraryCore_block_invoke;
    v41 = (uint64_t (*)(uint64_t, uint64_t))&__block_descriptor_40_e5_v8__0l;
    v42 = &v31;
    *(_OWORD *)uint64_t v35 = xmmword_1E5D2C248;
    uint64_t v36 = 0;
    AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
    id v5 = v31;
    if (AppleAccountLibraryCore_frameworkLibrary)
    {
      if (!v31) {
        goto LABEL_6;
      }
    }
    else
    {
      id v23 = v31;
      id v5 = (void *)abort_report_np();
      __break(1u);
    }
    free(v5);
  }
LABEL_6:
  id v6 = [(BYManagedAppleIDBootstrap *)self shortLivedToken];
  id v7 = [MEMORY[0x1E4FB36F8] sharedManager];
  int v8 = [v7 currentUser];
  dispatch_time_t v9 = [v8 username];
  uint64_t v10 = [v8 alternateDSID];
  id v11 = _BYLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    v41 = v6;
    _os_log_debug_impl(&dword_1A7DED000, v11, OS_LOG_TYPE_DEBUG, "Username: %@, altDSID: %@, SLT: %@", buf, 0x20u);
  }

  if (v9 && v10 && v6)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v41 = __Block_byref_object_copy__1;
    v42 = (void **)__Block_byref_object_dispose__1;
    id v31 = 0;
    BOOL v32 = &v31;
    uint64_t v33 = 0x2050000000;
    id v12 = (void *)getAKAppleIDAuthenticationContextClass_softClass;
    uint64_t v34 = getAKAppleIDAuthenticationContextClass_softClass;
    if (!getAKAppleIDAuthenticationContextClass_softClass)
    {
      *(void *)uint64_t v35 = MEMORY[0x1E4F143A8];
      *(void *)&v35[8] = 3221225472;
      uint64_t v36 = (uint64_t)__getAKAppleIDAuthenticationContextClass_block_invoke;
      v37 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5D2B9E8;
      v38 = &v31;
      __getAKAppleIDAuthenticationContextClass_block_invoke((uint64_t)v35);
      id v12 = v32[3];
    }
    id v13 = v12;
    _Block_object_dispose(&v31, 8);
    id v43 = objc_alloc_init(v13);
    [*(id *)(*(void *)&buf[8] + 40) setShouldPreventInteractiveAuth:1];
    [*(id *)(*(void *)&buf[8] + 40) setUsername:v9];
    [*(id *)(*(void *)&buf[8] + 40) _setShortLivedToken:v6];
    [*(id *)(*(void *)&buf[8] + 40) setAltDSID:v10];
    [*(id *)(*(void *)&buf[8] + 40) setShouldUpdatePersistentServiceTokens:1];
    [(BYManagedAppleIDBootstrap *)self _modifyAuthenticationContextIfNeeded:*(void *)(*(void *)&buf[8] + 40)];
    id v14 = objc_alloc_init((Class)getACAccountStoreClass());
    BOOL v15 = objc_msgSend(v14, "aa_primaryAppleAccount");
    BOOL v16 = v15 != 0;

    id v17 = _BYLoggingFacility();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = @"NERP";
      if (v15) {
        uint64_t v18 = @"YASE";
      }
      *(_DWORD *)uint64_t v35 = 138412290;
      *(void *)&v35[4] = v18;
      _os_log_impl(&dword_1A7DED000, v17, OS_LOG_TYPE_DEFAULT, "Primary account exists: %@", v35, 0xCu);
    }

    if (!v15) {
      [*(id *)(*(void *)&buf[8] + 40) setFirstTimeLogin:1];
    }
    *(void *)uint64_t v35 = 0;
    *(void *)&v35[8] = v35;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__1;
    v38 = (void **)__Block_byref_object_dispose__1;
    id v39 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
    kdebug_trace();
    char v19 = *(void **)(*(void *)&v35[8] + 40);
    uint64_t v20 = *(void *)(*(void *)&buf[8] + 40);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke;
    v25[3] = &unk_1E5D2C190;
    BOOL v30 = v16;
    id v27 = v24;
    v25[4] = self;
    id v21 = v14;
    id v26 = v21;
    id v28 = buf;
    v29 = v35;
    [v19 authenticateWithContext:v20 completion:v25];

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(buf, 8);
  }
  else if (v24)
  {
    uint64_t v22 = _BYLoggingFacility();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v22, OS_LOG_TYPE_DEFAULT, "Missing required data to do token upgrade", buf, 2u);
    }

    (*((void (**)(id, void, void))v24 + 2))(v24, 0, 0);
  }
}

void __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  kdebug_trace();
  id v7 = _BYLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v6;
    _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Silent token upgrade error: %@", buf, 0xCu);
  }

  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      dispatch_time_t v9 = *(void (**)(void))(v8 + 16);
LABEL_9:
      v9();
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 72))
    {
      uint64_t v11 = [v5 copy];
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(v12 + 48);
      *(void *)(v12 + 48) = v11;

      id v14 = *(void **)(a1 + 32);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke_86;
      v19[3] = &unk_1E5D2C168;
      void v19[4] = v14;
      id v20 = *(id *)(a1 + 40);
      id v21 = *(id *)(a1 + 48);
      [v14 _createAppleAccountWithAuthenticationResults:v5 completion:v19];

      goto LABEL_11;
    }
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10)
    {
      dispatch_time_t v9 = *(void (**)(void))(v10 + 16);
      goto LABEL_9;
    }
  }
LABEL_11:
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;

  uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = 0;
}

void __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke_86(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__1;
    void v15[4] = __Block_byref_object_dispose__1;
    id v16 = (id)os_transaction_create();
    id v6 = [MEMORY[0x1E4FB36F8] sharedManager];
    [v6 registerUserSwitchStakeHolder:*(void *)(a1 + 32)];

    id v7 = [MEMORY[0x1E4FB3720] taskWithName:@"BuddUserSwitchBlockingTask" reason:@"Post Startup tasks"];
    [v7 begin];
    uint64_t v8 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke_2;
    void v11[3] = &unk_1E5D2C140;
    v11[4] = v8;
    id v12 = *(id *)(a1 + 40);
    id v9 = v7;
    id v13 = v9;
    id v14 = v15;
    [v8 _registerForStartupCompletionNotificationWithTask:v11];

    _Block_object_dispose(v15, 8);
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }
}

void __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke_3;
  v6[3] = &unk_1E5D2C118;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  uint64_t v9 = *(void *)(a1 + 56);
  [v2 _runPostStartupTasksWithAccountStore:v3 completion:v6];
}

void __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) end];
  uint64_t v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  [v2 unregisterStakeHolder:*(void *)(a1 + 40) status:0 reason:@"Tasks completed"];

  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (id)_languageConfigurationDictionary
{
  CFDictionaryRef v2 = CFPreferencesCopyMultiple((CFArrayRef)&unk_1EFE4E4D8, (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  return v2;
}

- (void)writeAccountConfigurationIfNeededWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(id)objc_opt_class() isMultiUser])
  {
    uint64_t v5 = dispatch_get_global_queue(25, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__BYManagedAppleIDBootstrap_writeAccountConfigurationIfNeededWithCompletion___block_invoke;
    v6[3] = &unk_1E5D2C1E0;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

void __77__BYManagedAppleIDBootstrap_writeAccountConfigurationIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  uint64_t v3 = [v2 currentUser];
  id v4 = [v3 alternateDSID];

  uint64_t v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Write account configuration? altDSID = %@", (uint8_t *)&buf, 0xCu);
  }

  if (v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CFDictionaryRef v7 = CFPreferencesCopyMultiple(0, @"com.apple.purplebuddy", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    [v6 addEntriesFromDictionary:v7];
    uint64_t v8 = [*(id *)(a1 + 32) buddyPreferences];
    uint64_t v9 = [v8 preferences];
    [v6 addEntriesFromDictionary:v9];

    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SetupDone"];
    uint64_t v10 = _BYLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A7DED000, v10, OS_LOG_TYPE_DEFAULT, "Writing defaults to IdMS...", (uint8_t *)&buf, 2u);
    }

    if (_BYLoggingEnabled())
    {
      uint64_t v11 = _BYLoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_1A7DED000, v11, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v12 = [*(id *)(a1 + 32) _languageConfigurationDictionary];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__1;
    id v26 = __Block_byref_object_dispose__1;
    getAKAppleIDAuthenticationControllerClass();
    id v27 = (id)objc_opt_new();
    id v13 = *(void **)(*((void *)&buf + 1) + 40);
    id v14 = (void *)[v6 copy];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__BYManagedAppleIDBootstrap_writeAccountConfigurationIfNeededWithCompletion___block_invoke_123;
    void v18[3] = &unk_1E5D2C1B8;
    p_long long buf = &buf;
    id v15 = v12;
    id v19 = v15;
    id v20 = v4;
    id v21 = *(id *)(a1 + 40);
    [v13 setConfigurationInfo:v14 forIdentifier:@"com.apple.idms.config.BuddyData" forAltDSID:v20 completion:v18];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v16 = _BYLoggingFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A7DED000, v16, OS_LOG_TYPE_DEFAULT, "No account altDSID, not writing configuration data.", (uint8_t *)&buf, 2u);
    }

    uint64_t v17 = *(void *)(a1 + 40);
    if (v17) {
      (*(void (**)(void))(v17 + 16))();
    }
  }
}

void __77__BYManagedAppleIDBootstrap_writeAccountConfigurationIfNeededWithCompletion___block_invoke_123(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109378;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "Wrote Buddy data to IdMS, success = %d, error = %@", buf, 0x12u);
  }

  CFDictionaryRef v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__BYManagedAppleIDBootstrap_writeAccountConfigurationIfNeededWithCompletion___block_invoke_124;
  v12[3] = &unk_1E5D2BEC8;
  id v13 = *(id *)(a1 + 48);
  [v7 setConfigurationInfo:v8 forIdentifier:@"com.apple.idms.config.Language" forAltDSID:v9 completion:v12];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

void __77__BYManagedAppleIDBootstrap_writeAccountConfigurationIfNeededWithCompletion___block_invoke_124(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "Wrote Language data to IdMS, success = %d, error = %@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (id)_fetchAKURLBagSynchronously
{
  CFDictionaryRef v2 = [MEMORY[0x1E4F4F0C8] sharedBag];
  id v6 = 0;
  [v2 requestNewURLBagIfNecessaryWithError:&v6];
  id v3 = v6;

  if (v3)
  {
    id v4 = _BYLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(BYManagedAppleIDBootstrap *)(uint64_t)v3 _fetchAKURLBagSynchronously];
    }
  }
  return v3;
}

- (id)_authenticationContextWithAuthenticationResults:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F4D928];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setAuthenticationResults:v4];

  [v5 setShouldForceOperation:0];
  [v5 setOperationUIPermissions:0];
  return v5;
}

- (void)markUserWithManagedCredentials
{
  CFDictionaryRef v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v3 = [v2 currentUser];

  [v3 refetchUser];
  if (([v3 hasManagedCredentials] & 1) == 0)
  {
    id v4 = _BYLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "User has a managed credential set up, update it", v6, 2u);
    }

    id v5 = (void *)[v3 mutableCopy];
    [v5 setHasManagedCredentials:1];
    [v5 commitChanges];
  }
}

- (void)_modifyAuthenticationContextIfNeeded:(id)a3
{
  id v6 = a3;
  if (os_variant_has_internal_ui())
  {
    id v3 = [v6 altDSID];
    int v4 = [v3 containsString:@"restrictionlessLogin"];

    if (v4)
    {
      [v6 setAltDSID:0];
      id v5 = [v6 _shortLivedToken];
      [v6 _setPassword:v5];

      [v6 _setShortLivedToken:0];
    }
  }
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void)setNotificationQueue:(id)a3
{
}

- (BOOL)shouldRetrySilentLoginUpgrade
{
  return self->_shouldRetrySilentLoginUpgrade;
}

- (void)setShouldRetrySilentLoginUpgrade:(BOOL)a3
{
  self->_shouldRetrySilentLoginUpgrade = a3;
}

- (int64_t)silentLoginUpgradeRetryCount
{
  return self->_silentLoginUpgradeRetryCount;
}

- (void)setSilentLoginUpgradeRetryCount:(int64_t)a3
{
  self->_silentLoginUpgradeRetryCount = a3;
}

- (NSDictionary)authenticationResults
{
  return self->_authenticationResults;
}

- (void)setAuthenticationResults:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_authenticationResults, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_userSwitchContext, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
}

void __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_71_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A7DED000, log, OS_LOG_TYPE_DEBUG, "Wi-Fi Acquired!", v1, 2u);
}

void __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_72_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "Failed to upgrade the short lived token due to error, but continuing anyway. Error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_registerForStartupCompletionNotificationWithTask:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A7DED000, log, OS_LOG_TYPE_ERROR, "Failed to regsiter for startup notification", v1, 2u);
}

- (void)_fetchAKURLBagSynchronously
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "Fetching AKURLBag failed with error:%@", (uint8_t *)&v2, 0xCu);
}

@end