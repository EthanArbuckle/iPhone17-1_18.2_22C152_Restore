@interface PSKeychainSyncManager
+ (id)sharedManager;
+ (void)getStatusWithCompletion:(id)a3;
- (BOOL)_changeSecurityCode:(id)a3 type:(int)a4 smsTarget:(id)a5 smsTargetCountryInfo:(id)a6 username:(id)a7 passwordOrEquivalentToken:(id)a8 error:(id *)a9;
- (BOOL)_errorRequiresPasswordPrompt:(id)a3;
- (BOOL)_registerUserCredentialsName:(id)a3 rawPassword:(id)a4 error:(id *)a5;
- (BOOL)_resetCircleAndDisableBackupWithError:(id *)a3;
- (BOOL)circleWasReset;
- (NSString)appleIDPasswordOrEquivalentToken;
- (NSString)appleIDRawPassword;
- (NSString)appleIDUsername;
- (NSString)securityCodeRecoveryAttempt;
- (NSString)stagedSecurityCode;
- (PSKeychainSyncManager)init;
- (PSRootController)buddyNavigationController;
- (PSSetupController)settingsSetupController;
- (UIViewController)hostViewController;
- (UIViewController)resetPromptControllerHost;
- (id)_defaultKeychainViewSet;
- (id)changeSecurityCodeCompletion;
- (id)circleJoinCompletion;
- (id)completion;
- (id)navigationController;
- (id)passwordPromptCompletion;
- (id)preferencesApp;
- (id)resetCompletion;
- (id)viewControllerForPresentingAlerts;
- (int)stagedSecurityCodeType;
- (void)_autoVetSMSValidationWithToken:(id)a3;
- (void)_callCompletionWithStatus:(int)a3 error:(id)a4;
- (void)_changeToNewSecurityCode:(id)a3 type:(int)a4 smsTarget:(id)a5 smsTargetCountryInfo:(id)a6;
- (void)_circleJoinAfterRecoveryTimerFired:(id)a3;
- (void)_cleanup;
- (void)_cleanupAppleIDCredentials;
- (void)_disableCDPKeychainSyncOverController:(id)a3 deletingSafariPasswords:(BOOL)a4 withCompletion:(id)a5;
- (void)_disableKeychainSyncOverController:(id)a3 deletingSafariPasswords:(BOOL)a4 withCompletion:(id)a5;
- (void)_enableSecureBackupWithPhoneNumber:(id)a3 countryInfo:(id)a4;
- (void)_finishedWithStatus:(int)a3 error:(id)a4;
- (void)_peerApprovalFromRecoveryFlow;
- (void)_preSetupCancelledWithCurrentStatus;
- (void)_presentAuthControllerWithPresentingVC:(id)a3 completion:(id)a4;
- (void)_promptUserToDeleteSafariSavedContentWithCompletion:(id)a3;
- (void)_recoverWithSecurityCode:(id)a3 verificationCode:(id)a4;
- (void)_registerForCircleChangeNotifications;
- (void)_registerForCircleChangeNotificationsWithCompletion:(id)a3;
- (void)_resetFromRecoveryFlow;
- (void)_showGenericFlowErrorAlert;
- (void)_showGenericFlowErrorAlertWithDismissalHandler:(id)a3;
- (void)_showInvalidPhoneNumberAlertWithDigits:(id)a3 countryInfo:(id)a4;
- (void)_showResetFlowOverController:(id)a3 withEnableBackupText:(BOOL)a4 withCompletion:(id)a5;
- (void)_startCircleJoinAfterRecoveryTimer;
- (void)_stopCircleJoinAfterRecoveryTimer;
- (void)dealloc;
- (void)disableKeychainSyncOverController:(id)a3 withCompletion:(id)a4;
- (void)dismissAppleSupportPane:(id)a3;
- (void)handleCircleChangedNotification;
- (void)joinCircleAfterRecovery:(BOOL)a3 withCompletion:(id)a4;
- (void)joinCircleAndEnableSecureBackupWithPhoneNumber:(id)a3 countryInfo:(id)a4;
- (void)joinCircleWithCompletion:(id)a3;
- (void)keychainSyncController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)keychainSyncControllerCancel:(id)a3;
- (void)keychainSyncPhoneNumberController:(id)a3 didCompleteWithPhoneNumber:(id)a4 countryInfo:(id)a5;
- (void)makeSettingsSetupControllerWithSpecifier:(id)a3 parent:(id)a4 initialController:(id)a5;
- (void)pinChoiceAlertDidChooseToUseDevicePasscode:(BOOL)a3;
- (void)promptForDevicePasscodeChangeToPasscode:(id)a3 overController:(id)a4 completion:(id)a5;
- (void)promptForPasswordIfCredentialsNotCachedOverController:(id)a3 withCompletion:(id)a4;
- (void)promptForPasswordIfNeededForWritingOverController:(id)a3 withCompletion:(id)a4;
- (void)promptForPasswordIfNeededOverController:(id)a3 withCompletion:(id)a4;
- (void)promptForPasswordIfNeededWithCompletion:(id)a3;
- (void)promptForPasswordOverController:(id)a3 withCompletion:(id)a4;
- (void)setAppleIDRawPassword:(id)a3;
- (void)setAppleIDRawPassword:(id)a3 equivalentToken:(id)a4;
- (void)setAppleIDUsername:(id)a3;
- (void)setBuddyNavigationController:(id)a3;
- (void)setChangeSecurityCodeCompletion:(id)a3;
- (void)setCircleJoinCompletion:(id)a3;
- (void)setCircleWasReset:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)setPasswordPromptCompletion:(id)a3;
- (void)setResetCompletion:(id)a3;
- (void)setResetPromptControllerHost:(id)a3;
- (void)setSecurityCodeRecoveryAttempt:(id)a3;
- (void)setSettingsSetupController:(id)a3;
- (void)setStagedSecurityCode:(id)a3 type:(int)a4;
- (void)showAlert:(id)a3;
- (void)showChangeSecurityCodeFlowWithSpecifier:(id)a3 overController:(id)a4 completion:(id)a5;
- (void)showContactAppleSupportPane;
- (void)showController:(id)a3;
- (void)showEnableEscrowFlowWithSpecifier:(id)a3 overController:(id)a4 completion:(id)a5;
- (void)showEnableFlowWithNavigationController:(id)a3 completion:(id)a4;
- (void)showEnableSyncFlowWithSpecifier:(id)a3 overController:(id)a4 completion:(id)a5;
- (void)showNetworkReachabilityError;
- (void)showPinChoiceAlert;
- (void)showRecoveryFlowWithNavigationController:(id)a3 completion:(id)a4;
- (void)showRecoveryFlowWithSpecifier:(id)a3 overController:(id)a4 completion:(id)a5;
- (void)showResetAcknowledgementIfNeededWithCompletion:(id)a3;
- (void)showResetAndJoinFlowOverController:(id)a3 withCompletion:(id)a4;
- (void)startNavigationSpinnerInViewController:(id)a3;
- (void)stopNavigationSpinner;
@end

@implementation PSKeychainSyncManager

+ (id)sharedManager
{
  v2 = (void *)sharedManager__instance;
  if (!sharedManager__instance)
  {
    v3 = objc_alloc_init(PSKeychainSyncManager);
    v4 = (void *)sharedManager__instance;
    sharedManager__instance = (uint64_t)v3;

    v2 = (void *)sharedManager__instance;
  }
  return v2;
}

- (PSKeychainSyncManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSKeychainSyncManager;
  v2 = [(PSKeychainSyncManager *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_clearKeychainSyncCache, @"ClearKeychainSyncSettingsCache", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

+ (void)getStatusWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PSKeychainSyncManager_getStatusWithCompletion___block_invoke;
    block[3] = &unk_1E5C5D938;
    id v6 = v3;
    dispatch_async(v4, block);
  }
}

void __49__PSKeychainSyncManager_getStatusWithCompletion___block_invoke(uint64_t a1)
{
  id v10 = 0;
  int Status = PSKeychainSyncGetStatus(&v10);
  id v3 = v10;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PSKeychainSyncManager_getStatusWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5C5E7F0;
  id v4 = *(id *)(a1 + 32);
  int v9 = Status;
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __49__PSKeychainSyncManager_getStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)showEnableSyncFlowWithSpecifier:(id)a3 overController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  char v12 = [v11 isNetworkReachable];

  if (v12)
  {
    self->_flow = 1;
    [(PSKeychainSyncManager *)self setCompletion:v10];
    [(PSKeychainSyncManager *)self setHostViewController:v9];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke;
    v14[3] = &unk_1E5C5E840;
    v14[4] = self;
    id v17 = v10;
    id v15 = v8;
    id v16 = v9;
    [(PSKeychainSyncManager *)self promptForPasswordIfNeededForWritingOverController:v16 withCompletion:v14];
  }
  else
  {
    [(PSKeychainSyncManager *)self showNetworkReachabilityError];
    if (v10)
    {
      v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:4 userInfo:0];
      (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 1, v13);
    }
  }
}

void __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    int v3 = PSKeychainSyncCircleExists();
    id v4 = *(void **)(a1 + 32);
    if (v3)
    {
      uint64_t v5 = *(void *)(a1 + 56);
      [v4 joinCircleWithCompletion:v5];
    }
    else
    {
      [v4 makeSettingsSetupControllerWithSpecifier:*(void *)(a1 + 40) parent:*(void *)(a1 + 48) initialController:0];
      if (PSIsKeychainSecureBackupEnabled(0))
      {
        id v7 = (void *)MEMORY[0x1E4F42728];
        id v8 = PS_LocalizedStringForKeychainSync(@"ENABLE_IS_RECOVERY");
        id v9 = PS_LocalizedStringForKeychainSync(@"ENABLE_IS_RECOVERY_DESCRIPTION");
        id v10 = [v7 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

        v11 = (void *)MEMORY[0x1E4F42720];
        char v12 = PS_LocalizedStringForKeychainSync(@"RESTORE_WITH_SECURITY_CODE");
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_2;
        v36[3] = &unk_1E5C5D8C0;
        v13 = *(void **)(a1 + 40);
        v36[4] = *(void *)(a1 + 32);
        id v37 = v13;
        id v38 = *(id *)(a1 + 48);
        v14 = [v11 actionWithTitle:v12 style:0 handler:v36];
        [v10 addAction:v14];

        id v15 = (void *)MEMORY[0x1E4F42720];
        id v16 = PS_LocalizedStringForKeychainSync(@"RESET_ICLOUD_KEYCHAIN");
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_3;
        v33[3] = &unk_1E5C5D8C0;
        v33[4] = *(void *)(a1 + 32);
        id v34 = *(id *)(a1 + 48);
        id v35 = *(id *)(a1 + 40);
        id v17 = [v15 actionWithTitle:v16 style:0 handler:v33];
        [v10 addAction:v17];

        v18 = (void *)MEMORY[0x1E4F42720];
        v19 = PS_LocalizedStringForKeychainSync(@"CANCEL");
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_5;
        v32[3] = &unk_1E5C5DAE8;
        v32[4] = *(void *)(a1 + 32);
        v20 = [v18 actionWithTitle:v19 style:1 handler:v32];
        [v10 addAction:v20];

        [*(id *)(a1 + 32) showAlert:v10];
      }
      else
      {
        v21 = [MEMORY[0x1E4F74230] sharedConnection];
        int v22 = [v21 isPasscodeSet];

        if (v22)
        {
          v23 = *(void **)(a1 + 32);
          [v23 showPinChoiceAlert];
        }
        else
        {
          v24 = *(void **)(a1 + 40);
          v25 = (objc_class *)objc_opt_class();
          v26 = NSStringFromClass(v25);
          [v24 setProperty:v26 forKey:@"customControllerClass"];

          uint64_t v27 = objc_opt_new();
          uint64_t v28 = *(void *)(a1 + 32);
          v29 = *(void **)(v28 + 32);
          *(void *)(v28 + 32) = v27;

          [*(id *)(a1 + 32) makeSettingsSetupControllerWithSpecifier:*(void *)(a1 + 40) parent:*(void *)(a1 + 48) initialController:*(void *)(*(void *)(a1 + 32) + 32)];
          [*(id *)(*(void *)(a1 + 32) + 32) setShowsAdvancedSettings:1];
          [*(id *)(*(void *)(a1 + 32) + 32) setMode:1];
          v30 = *(void **)(a1 + 48);
          uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 200);
          [v30 presentViewController:v31 animated:1 completion:0];
        }
      }
    }
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    [v6 _preSetupCancelledWithCurrentStatus];
  }
}

void __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_2(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  id v4 = [v1 completion];
  [v1 showRecoveryFlowWithSpecifier:v2 overController:v3 completion:v4];
}

void __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_4;
  v4[3] = &unk_1E5C5E818;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v2 _showResetFlowOverController:v3 withEnableBackupText:1 withCompletion:v4];
}

void __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_4(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) completion];
    [v3 showEnableSyncFlowWithSpecifier:v4 overController:v5 completion:v7];
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    [v6 _finishedWithStatus:0 error:a3];
  }
}

uint64_t __83__PSKeychainSyncManager_showEnableSyncFlowWithSpecifier_overController_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _preSetupCancelledWithCurrentStatus];
}

- (void)showEnableEscrowFlowWithSpecifier:(id)a3 overController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  self->_flow = 2;
  [(PSKeychainSyncManager *)self setCompletion:a5];
  [(PSKeychainSyncManager *)self setHostViewController:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__PSKeychainSyncManager_showEnableEscrowFlowWithSpecifier_overController_completion___block_invoke;
  v12[3] = &unk_1E5C5E818;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(PSKeychainSyncManager *)self promptForPasswordIfNeededForWritingOverController:v10 withCompletion:v12];
}

uint64_t __85__PSKeychainSyncManager_showEnableEscrowFlowWithSpecifier_overController_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 makeSettingsSetupControllerWithSpecifier:*(void *)(a1 + 40) parent:*(void *)(a1 + 48) initialController:0];
    uint64_t v4 = [MEMORY[0x1E4F74230] sharedConnection];
    int v5 = [v4 isPasscodeSet];

    if (v5)
    {
      id v6 = *(void **)(a1 + 32);
      return [v6 showPinChoiceAlert];
    }
    else
    {
      uint64_t v8 = objc_opt_new();
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 32);
      *(void *)(v9 + 32) = v8;

      [*(id *)(a1 + 32) makeSettingsSetupControllerWithSpecifier:*(void *)(a1 + 40) parent:*(void *)(a1 + 48) initialController:*(void *)(*(void *)(a1 + 32) + 32)];
      [*(id *)(*(void *)(a1 + 32) + 32) setShowsAdvancedSettings:1];
      [*(id *)(*(void *)(a1 + 32) + 32) setMode:1];
      id v11 = *(void **)(a1 + 48);
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 200);
      return [v11 presentViewController:v12 animated:1 completion:0];
    }
  }
  else
  {
    return [v3 _preSetupCancelledWithCurrentStatus];
  }
}

- (void)showRecoveryFlowWithSpecifier:(id)a3 overController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void *))a5;
  id v11 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  char v12 = [v11 isNetworkReachable];

  if (v12)
  {
    self->_flow = 4;
    [(PSKeychainSyncManager *)self setCompletion:v10];
    [(PSKeychainSyncManager *)self setHostViewController:v9];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__PSKeychainSyncManager_showRecoveryFlowWithSpecifier_overController_completion___block_invoke;
    v14[3] = &unk_1E5C5E818;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    [(PSKeychainSyncManager *)self promptForPasswordIfNeededForWritingOverController:v16 withCompletion:v14];
  }
  else
  {
    [(PSKeychainSyncManager *)self showNetworkReachabilityError];
    if (v10)
    {
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:4 userInfo:0];
      v10[2](v10, 1, v13);
    }
  }
}

void __81__PSKeychainSyncManager_showRecoveryFlowWithSpecifier_overController_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = objc_alloc_init((Class)getSecureBackupClass_0());
    id v26 = 0;
    id v4 = (id)[v3 getAccountInfoWithInfo:0 results:&v26];
    id v5 = v26;
    id v6 = _PSLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v5;
      _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "Starting recovery flow, accountInfo = %@", buf, 0xCu);
    }

    id v7 = getkSecureBackupMetadataKey_0();
    id v8 = [v5 objectForKey:v7];

    id v9 = getkSecureBackupUsesComplexPassphraseKey();
    id v10 = [v8 objectForKey:v9];
    int v11 = [v10 BOOLValue];

    char v12 = getkSecureBackupUsesRandomPassphraseKey();
    id v13 = [v5 objectForKey:v12];
    int v14 = [v13 BOOLValue];

    id v15 = getkSecureBackupUsesNumericPassphraseKey();
    id v16 = [v8 objectForKey:v15];
    int v17 = [v16 BOOLValue];

    if (v17)
    {
      v18 = getkSecureBackupNumericPassphraseLengthKey();
      v19 = [v8 objectForKey:v18];
      uint64_t v20 = [v19 integerValue];
    }
    else
    {
      uint64_t v20 = 4;
    }
    uint64_t v22 = objc_opt_new();
    uint64_t v23 = *(void *)(a1 + 32);
    v24 = *(void **)(v23 + 56);
    *(void *)(v23 + 56) = v22;

    [*(id *)(a1 + 32) makeSettingsSetupControllerWithSpecifier:*(void *)(a1 + 40) parent:*(void *)(a1 + 48) initialController:*(void *)(*(void *)(a1 + 32) + 56)];
    if (v14) {
      uint64_t v25 = 2;
    }
    else {
      uint64_t v25 = v11 & ~v17;
    }
    [*(id *)(*(void *)(a1 + 32) + 56) setMode:2];
    [*(id *)(*(void *)(a1 + 32) + 56) setNumberOfPasscodeFields:v20];
    [*(id *)(*(void *)(a1 + 32) + 56) setSecurityCodeType:v25];
    [*(id *)(a1 + 48) presentViewController:*(void *)(*(void *)(a1 + 32) + 200) animated:1 completion:0];
    [*(id *)(a1 + 32) _registerForCircleChangeNotifications];
  }
  else
  {
    v21 = *(void **)(a1 + 32);
    [v21 _preSetupCancelledWithCurrentStatus];
  }
}

- (void)showRecoveryFlowWithNavigationController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void *))a4;
  id v8 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  char v9 = [v8 isNetworkReachable];

  if (v9)
  {
    self->_flow = 4;
    [(PSKeychainSyncManager *)self setCompletion:v7];
    [(PSKeychainSyncManager *)self setBuddyNavigationController:v6];
    id v10 = [v6 topViewController];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__PSKeychainSyncManager_showRecoveryFlowWithNavigationController_completion___block_invoke;
    v12[3] = &unk_1E5C5E6B0;
    v12[4] = self;
    [(PSKeychainSyncManager *)self promptForPasswordIfNeededForWritingOverController:v10 withCompletion:v12];
  }
  else
  {
    [(PSKeychainSyncManager *)self showNetworkReachabilityError];
    if (v7)
    {
      int v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:4 userInfo:0];
      v7[2](v7, 1, v11);
    }
  }
}

void __77__PSKeychainSyncManager_showRecoveryFlowWithNavigationController_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = objc_alloc_init((Class)getSecureBackupClass_0());
    id v25 = 0;
    id v4 = (id)[v3 getAccountInfoWithInfo:0 results:&v25];
    id v5 = v25;
    id v6 = getkSecureBackupMetadataKey_0();
    id v7 = [v5 objectForKey:v6];

    id v8 = getkSecureBackupUsesComplexPassphraseKey();
    char v9 = [v7 objectForKey:v8];
    unsigned int v10 = [v9 BOOLValue];

    int v11 = getkSecureBackupUsesRandomPassphraseKey();
    char v12 = [v5 objectForKey:v11];
    int v13 = [v12 BOOLValue];

    int v14 = getkSecureBackupUsesNumericPassphraseKey();
    id v15 = [v7 objectForKey:v14];
    int v16 = [v15 BOOLValue];

    if (v16)
    {
      int v17 = getkSecureBackupNumericPassphraseLengthKey();
      v18 = [v7 objectForKey:v17];
      uint64_t v19 = [v18 integerValue];
    }
    else
    {
      uint64_t v19 = 4;
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 16) = 4;
    v21 = objc_alloc_init(PSKeychainSyncSecurityCodeController);
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(void **)(v22 + 56);
    *(void *)(v22 + 56) = v21;

    [*(id *)(*(void *)(a1 + 32) + 56) setMode:2];
    if (v13) {
      uint64_t v24 = 2;
    }
    else {
      uint64_t v24 = v10;
    }
    [*(id *)(*(void *)(a1 + 32) + 56) setSecurityCodeType:v24];
    [*(id *)(*(void *)(a1 + 32) + 56) setNumberOfPasscodeFields:v19];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setDelegate:");
    [*(id *)(a1 + 32) showController:*(void *)(*(void *)(a1 + 32) + 56)];
    [*(id *)(a1 + 32) _registerForCircleChangeNotifications];
  }
  else
  {
    uint64_t v20 = *(void **)(a1 + 32);
    [v20 _preSetupCancelledWithCurrentStatus];
  }
}

- (void)showChangeSecurityCodeFlowWithSpecifier:(id)a3 overController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  self->_flow = 3;
  [(PSKeychainSyncManager *)self setChangeSecurityCodeCompletion:a5];
  [(PSKeychainSyncManager *)self setHostViewController:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__PSKeychainSyncManager_showChangeSecurityCodeFlowWithSpecifier_overController_completion___block_invoke;
  v12[3] = &unk_1E5C5E818;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(PSKeychainSyncManager *)self promptForPasswordIfNeededForWritingOverController:v10 withCompletion:v12];
}

uint64_t __91__PSKeychainSyncManager_showChangeSecurityCodeFlowWithSpecifier_overController_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    [*(id *)(a1 + 32) makeSettingsSetupControllerWithSpecifier:*(void *)(a1 + 40) parent:*(void *)(a1 + 48) initialController:*(void *)(*(void *)(a1 + 32) + 32)];
    [*(id *)(*(void *)(a1 + 32) + 32) setSecurityCodeType:0];
    [*(id *)(*(void *)(a1 + 32) + 32) setShowsAdvancedSettings:1];
    id v6 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 200);
    return [v6 presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    return [v9 _preSetupCancelledWithCurrentStatus];
  }
}

- (void)showEnableFlowWithNavigationController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  char v9 = [v8 isNetworkReachable];

  if (v9)
  {
    if (PSKeychainSyncCircleExists())
    {
      if (v7) {
        v7[2](v7, 2, 0);
      }
    }
    else
    {
      self->_flow = 1;
      [(PSKeychainSyncManager *)self setCompletion:v7];
      [(PSKeychainSyncManager *)self setBuddyNavigationController:v6];
      id v11 = [v6 topViewController];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __75__PSKeychainSyncManager_showEnableFlowWithNavigationController_completion___block_invoke;
      v12[3] = &unk_1E5C5DE98;
      v12[4] = self;
      id v13 = v6;
      [(PSKeychainSyncManager *)self promptForPasswordIfNeededForWritingOverController:v11 withCompletion:v12];
    }
  }
  else
  {
    [(PSKeychainSyncManager *)self showNetworkReachabilityError];
    if (v7)
    {
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:4 userInfo:0];
      ((void (**)(id, uint64_t, void *))v7)[2](v7, 1, v10);
    }
  }
}

uint64_t __75__PSKeychainSyncManager_showEnableFlowWithNavigationController_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
    int v4 = [v3 isPasscodeSet];

    if (v4)
    {
      id v5 = *(void **)(a1 + 32);
      return [v5 showPinChoiceAlert];
    }
    else
    {
      uint64_t v8 = objc_opt_new();
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 32);
      *(void *)(v9 + 32) = v8;

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
      [*(id *)(*(void *)(a1 + 32) + 32) setShowsAdvancedSettings:1];
      id v11 = *(void **)(a1 + 40);
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 32);
      return [v11 pushViewController:v12 animated:1];
    }
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 _preSetupCancelledWithCurrentStatus];
  }
}

- (void)_showResetFlowOverController:(id)a3 withEnableBackupText:(BOOL)a4 withCompletion:(id)a5
{
  self->_flow = 5;
  id v8 = a5;
  id v9 = a3;
  [(PSKeychainSyncManager *)self setResetPromptControllerHost:v9];
  [(PSKeychainSyncManager *)self setResetCompletion:v8];

  [(PSKeychainSyncManager *)self setHostViewController:v9];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke;
  v10[3] = &unk_1E5C5E868;
  BOOL v11 = a4;
  v10[4] = self;
  [(PSKeychainSyncManager *)self promptForPasswordIfNeededForWritingOverController:v9 withCompletion:v10];
}

void __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v3 = @"REPLACE_ICLOUD_KEYCHAIN_DETAILS_WITH_RECOVERY";
    }
    else {
      uint64_t v3 = @"REPLACE_ICLOUD_KEYCHAIN_DETAILS";
    }
    int v4 = PS_LocalizedStringForKeychainSync(v3);
    id v5 = (void *)MEMORY[0x1E4F42728];
    id v6 = PS_LocalizedStringForKeychainSync(@"RESET_ICLOUD_KEYCHAIN_QUESTION");
    uint64_t v7 = [v5 alertControllerWithTitle:v6 message:v4 preferredStyle:1];

    id v8 = (void *)MEMORY[0x1E4F42720];
    id v9 = PS_LocalizedStringForKeychainSync(@"CANCEL");
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_2;
    v16[3] = &unk_1E5C5DAE8;
    v16[4] = *(void *)(a1 + 32);
    id v10 = [v8 actionWithTitle:v9 style:1 handler:v16];
    [v7 addAction:v10];

    BOOL v11 = (void *)MEMORY[0x1E4F42720];
    uint64_t v12 = PS_LocalizedStringForKeychainSync(@"RESET");
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_3;
    v15[3] = &unk_1E5C5DAE8;
    v15[4] = *(void *)(a1 + 32);
    id v13 = [v11 actionWithTitle:v12 style:0 handler:v15];
    [v7 addAction:v13];

    [*(id *)(a1 + 32) showAlert:v7];
  }
  else
  {
    id v14 = *(void **)(a1 + 32);
    [v14 _preSetupCancelledWithCurrentStatus];
  }
}

uint64_t __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _preSetupCancelledWithCurrentStatus];
}

void __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) startNavigationSpinnerInViewController:*(void *)(*(void *)(a1 + 32) + 184)];
  [*(id *)(a1 + 32) setResetPromptControllerHost:0];
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_4;
  block[3] = &unk_1E5C5D680;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v10 = 0;
  char v3 = [v2 _resetCircleAndDisableBackupWithError:&v10];
  id v4 = v10;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_5;
  v7[3] = &unk_1E5C5E060;
  uint64_t v5 = *(void *)(a1 + 32);
  char v9 = v3;
  v7[4] = v5;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __90__PSKeychainSyncManager__showResetFlowOverController_withEnableBackupText_withCompletion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) stopNavigationSpinner];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[21];
  if (v3)
  {
    (*(void (**)(void, void, void))(v3 + 16))(v2[21], *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
    uint64_t v2 = *(void **)(a1 + 32);
  }
  return [v2 setResetCompletion:0];
}

- (void)showResetAndJoinFlowOverController:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PSKeychainSyncManager *)self setHostViewController:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PSKeychainSyncManager_showResetAndJoinFlowOverController_withCompletion___block_invoke;
  v10[3] = &unk_1E5C5E7A0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PSKeychainSyncManager *)self _showResetFlowOverController:v9 withEnableBackupText:0 withCompletion:v10];
}

void __75__PSKeychainSyncManager_showResetAndJoinFlowOverController_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) startNavigationSpinnerInViewController:*(void *)(a1 + 40)];
    id v6 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__PSKeychainSyncManager_showResetAndJoinFlowOverController_withCompletion___block_invoke_2;
    v8[3] = &unk_1E5C5E890;
    v8[4] = v6;
    id v9 = *(id *)(a1 + 48);
    [v6 joinCircleWithCompletion:v8];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v5);
    }
  }
}

void __75__PSKeychainSyncManager_showResetAndJoinFlowOverController_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) stopNavigationSpinner];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
  if (a2 == 2) {
    [*(id *)(a1 + 32) showResetAcknowledgementIfNeededWithCompletion:0];
  }
  [*(id *)(a1 + 32) setCircleWasReset:0];
}

- (void)disableKeychainSyncOverController:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PSKeychainSyncManager *)self setHostViewController:v6];
  if (PSKeychainSyncIsUsingICDP())
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__PSKeychainSyncManager_disableKeychainSyncOverController_withCompletion___block_invoke;
    v8[3] = &unk_1E5C5E7A0;
    v8[4] = self;
    id v9 = v6;
    id v10 = v7;
    [(PSKeychainSyncManager *)self _promptUserToDeleteSafariSavedContentWithCompletion:v8];
  }
  else
  {
    PSKeychainSyncGetStatus(0);
    [(PSKeychainSyncManager *)self _disableKeychainSyncOverController:v6 deletingSafariPasswords:0 withCompletion:v7];
  }
}

uint64_t __74__PSKeychainSyncManager_disableKeychainSyncOverController_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _disableCDPKeychainSyncOverController:*(void *)(a1 + 40) deletingSafariPasswords:a2 withCompletion:*(void *)(a1 + 48)];
}

- (void)_promptUserToDeleteSafariSavedContentWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
}

- (void)_disableCDPKeychainSyncOverController:(id)a3 deletingSafariPasswords:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id CDPKeychainSyncClass = getCDPKeychainSyncClass();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke;
  v13[3] = &unk_1E5C5E8B8;
  id v14 = v8;
  id v15 = self;
  BOOL v17 = a4;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  [CDPKeychainSyncClass setUserVisibleKeychainSyncEnabled:0 withCompletion:v13];
}

void __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [v5 domain];
  id v7 = getCDPStateErrorDomain();
  if ([v6 isEqualToString:v7])
  {
    uint64_t v8 = [v5 code];

    if (v8 == -5600)
    {
      id v9 = PS_LocalizedStringForKeychainSync(@"TURN_OFF_KEYCHAIN_OLDER_PEERS_TITLE");
      id v10 = PS_LocalizedStringForKeychainSync(@"TURN_OFF_KEYCHAIN_OLDER_PEERS_MESSAGE");
      id v11 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
      id v12 = (void *)MEMORY[0x1E4F42720];
      id v13 = PS_LocalizedStringForKeychainSync(@"TURN_OFF_KEYCHAIN_OLDER_PEERS_CONTINUE");
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      uint64_t v24 = __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_2;
      id v25 = &unk_1E5C5E908;
      id v14 = *(id *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = *(void **)(a1 + 48);
      id v26 = v14;
      uint64_t v27 = v15;
      char v29 = *(unsigned char *)(a1 + 56);
      id v28 = v16;
      BOOL v17 = [v12 actionWithTitle:v13 style:0 handler:&v22];
      objc_msgSend(v11, "addAction:", v17, v22, v23, v24, v25);

      v18 = (void *)MEMORY[0x1E4F42720];
      uint64_t v19 = PS_LocalizedStringForKeychainSync(@"TURN_OFF_KEYCHAIN_OLDER_PEERS_CANCEL");
      uint64_t v20 = [v18 actionWithTitle:v19 style:1 handler:0];
      [v11 addAction:v20];

      [*(id *)(a1 + 32) presentViewController:v11 animated:1 completion:0];
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (a2 && *(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 40) _deleteSafariAutoFillPasswords];
  }
  uint64_t v21 = *(void *)(a1 + 48);
  if (v21) {
    (*(void (**)(uint64_t, uint64_t, id))(v21 + 16))(v21, a2, v5);
  }
LABEL_10:
}

void __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  id v4 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass_0());
  id v5 = [v3 username];
  [v4 setUsername:v5];

  [v4 setAuthenticationType:2];
  [v4 setIsUsernameEditable:0];
  [v4 setPresentingViewController:*(void *)(a1 + 32)];
  id v6 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_3;
  v9[3] = &unk_1E5C5E8E0;
  int8x16_t v8 = *(int8x16_t *)(a1 + 32);
  id v7 = (id)v8.i64[0];
  int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
  char v12 = *(unsigned char *)(a1 + 56);
  id v11 = *(id *)(a1 + 48);
  [v6 authenticateWithContext:v4 completion:v9];
}

void __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)[objc_alloc((Class)getCDPContextClass()) initWithAuthenticationResults:v5];
    id CDPKeychainSyncClass = getCDPKeychainSyncClass();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_4;
    v11[3] = &unk_1E5C5E8B8;
    id v9 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v9;
    char v14 = *(unsigned char *)(a1 + 56);
    id v13 = *(id *)(a1 + 48);
    [CDPKeychainSyncClass removeNonViewAwarePeersFromCircleWithContext:v7 completion:v11];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v6);
    }
  }
}

uint64_t __102__PSKeychainSyncManager__disableCDPKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _disableCDPKeychainSyncOverController:*(void *)(a1 + 40) deletingSafariPasswords:*(unsigned __int8 *)(a1 + 56) withCompletion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
  return MEMORY[0x1F4181820]();
}

- (void)_disableKeychainSyncOverController:(id)a3 deletingSafariPasswords:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  id v11 = objc_msgSend(v10, "aa_primaryAppleAccount");
  id v12 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass_0());
  id v13 = [v11 username];
  [v12 setUsername:v13];

  [v12 setAuthenticationType:2];
  [v12 setIsUsernameEditable:0];
  [v12 setPresentingViewController:v9];

  id v14 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99__PSKeychainSyncManager__disableKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke;
  v16[3] = &unk_1E5C5E958;
  v16[4] = self;
  id v17 = v8;
  BOOL v18 = a4;
  id v15 = v8;
  [v14 authenticateWithContext:v12 completion:v16];
}

void __99__PSKeychainSyncManager__disableKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5)
  {
    NSLog(&cfstr_CredentialRene.isa, v6);
    uint64_t v22 = *(void *)(a1 + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v7);
    }
    else
    {
      uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:1 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v23);
    }
    goto LABEL_26;
  }
  CFTypeRef cf = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  id v8 = (id *)getAKAuthenticationUsernameKeySymbolLoc_ptr;
  uint64_t v37 = getAKAuthenticationUsernameKeySymbolLoc_ptr;
  if (!getAKAuthenticationUsernameKeySymbolLoc_ptr)
  {
    CFTypeRef v29 = (CFTypeRef)MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __getAKAuthenticationUsernameKeySymbolLoc_block_invoke;
    v32 = &unk_1E5C5D4D8;
    v33 = &v34;
    id v9 = (void *)AuthKitLibrary_0();
    v35[3] = (uint64_t)dlsym(v9, "AKAuthenticationUsernameKey");
    getAKAuthenticationUsernameKeySymbolLoc_ptr = *(void *)(v33[1] + 24);
    id v8 = (id *)v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v8)
  {
    -[PSContactsAuthorizationLevelController dealloc]();
LABEL_28:
    -[PSContactsAuthorizationLevelController dealloc]();
    goto LABEL_29;
  }
  id v10 = *v8;
  id v11 = [v5 objectForKeyedSubscript:v10];
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  id v12 = (id *)getAKAuthenticationRawPasswordKeySymbolLoc_ptr;
  uint64_t v37 = getAKAuthenticationRawPasswordKeySymbolLoc_ptr;
  if (!getAKAuthenticationRawPasswordKeySymbolLoc_ptr)
  {
    CFTypeRef v29 = (CFTypeRef)MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __getAKAuthenticationRawPasswordKeySymbolLoc_block_invoke;
    v32 = &unk_1E5C5D4D8;
    v33 = &v34;
    id v13 = (void *)AuthKitLibrary_0();
    v35[3] = (uint64_t)dlsym(v13, "AKAuthenticationRawPasswordKey");
    getAKAuthenticationRawPasswordKeySymbolLoc_ptr = *(void *)(v33[1] + 24);
    id v12 = (id *)v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v12) {
    goto LABEL_28;
  }
  id v14 = *v12;
  id v15 = [v5 objectForKeyedSubscript:v14];
  [v15 dataUsingEncoding:4];
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  id v16 = (void *)getAKAuthenticationDSIDKeySymbolLoc_ptr;
  uint64_t v37 = getAKAuthenticationDSIDKeySymbolLoc_ptr;
  if (!getAKAuthenticationDSIDKeySymbolLoc_ptr)
  {
    CFTypeRef v29 = (CFTypeRef)MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __getAKAuthenticationDSIDKeySymbolLoc_block_invoke;
    v32 = &unk_1E5C5D4D8;
    v33 = &v34;
    id v17 = (void *)AuthKitLibrary_0();
    v35[3] = (uint64_t)dlsym(v17, "AKAuthenticationDSIDKey");
    getAKAuthenticationDSIDKeySymbolLoc_ptr = *(void *)(v33[1] + 24);
    id v16 = (void *)v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v16)
  {
LABEL_29:
    uint64_t v24 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v34, 8);
    _Unwind_Resume(v24);
  }
  BOOL v18 = [v5 objectForKeyedSubscript:*v16];
  [v18 stringValue];
  char v19 = SOSCCSetUserCredentialsAndDSID();

  if ((v19 & 1) == 0) {
    NSLog(&cfstr_CallingSosccse.isa, cf);
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  CFTypeRef v29 = 0;
  if ((SOSCCRemoveThisDeviceFromCircle() & 1) != 0
    || ![*(id *)(a1 + 32) _errorRequiresPasswordPrompt:v29])
  {
    if (*(unsigned char *)(a1 + 48)) {
      [*(id *)(a1 + 32) _deleteSafariAutoFillPasswords];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    NSLog(&cfstr_Sosccremovethi.isa);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __99__PSKeychainSyncManager__disableKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_2;
    v25[3] = &unk_1E5C5E930;
    uint64_t v20 = *(void **)(a1 + 32);
    id v21 = *(id *)(a1 + 40);
    char v27 = *(unsigned char *)(a1 + 48);
    v25[4] = *(void *)(a1 + 32);
    id v26 = v21;
    [v20 promptForPasswordOverController:0 withCompletion:v25];
  }
  if (v29) {
    CFRelease(v29);
  }
LABEL_26:
}

void __99__PSKeychainSyncManager__disableKeychainSyncOverController_deletingSafariPasswords_withCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5 || !a2)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v5);
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:1 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
  }
  else if (SOSCCRemoveThisDeviceFromCircle())
  {
    if (*(unsigned char *)(a1 + 48)) {
      [*(id *)(a1 + 32) _deleteSafariAutoFillPasswords];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    NSLog(&cfstr_ErrorLeavingCi.isa, 0);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    CFRelease(0);
  }
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"ClearKeychainSyncSettingsCache", 0);
  PSHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier();
  [(NSTimer *)self->_joinAfterRecoveryTimeoutTimer invalidate];
  [(NSTimer *)self->_credentialExpirationTimer invalidate];
  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncManager;
  [(PSKeychainSyncManager *)&v4 dealloc];
}

- (id)navigationController
{
  BOOL v3 = [(PSKeychainSyncManager *)self isRunningInBuddy];
  uint64_t v4 = 200;
  if (v3) {
    uint64_t v4 = 208;
  }
  id v5 = *(Class *)((char *)&self->super.isa + v4);
  return v5;
}

- (void)setCompletion:(id)a3
{
  if (self->_completion != a3)
  {
    uint64_t v4 = (void *)[a3 copy];
    id completion = self->_completion;
    self->_id completion = v4;
    MEMORY[0x1F41817F8](v4, completion);
  }
}

- (void)_cleanupAppleIDCredentials
{
  appleIDUsername = self->_appleIDUsername;
  self->_appleIDUsername = 0;

  appleIDRawPassword = self->_appleIDRawPassword;
  self->_appleIDRawPassword = 0;

  appleIDPasswordOrEquivalentToken = self->_appleIDPasswordOrEquivalentToken;
  self->_appleIDPasswordOrEquivalentToken = 0;

  [(NSTimer *)self->_credentialExpirationTimer invalidate];
  credentialExpirationTimer = self->_credentialExpirationTimer;
  self->_credentialExpirationTimer = 0;

  NSLog(&cfstr_ClearedCredent.isa);
}

- (void)setAppleIDRawPassword:(id)a3 equivalentToken:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (*(_OWORD *)&self->_appleIDRawPassword != __PAIR128__((unint64_t)v7, (unint64_t)v11))
  {
    objc_storeStrong((id *)&self->_appleIDRawPassword, a3);
    objc_storeStrong((id *)&self->_appleIDPasswordOrEquivalentToken, a4);
    [(NSTimer *)self->_credentialExpirationTimer invalidate];
    BOOL v8 = [(PSKeychainSyncManager *)self isRunningInBuddy];
    if (self->_appleIDRawPassword)
    {
      if (!v8)
      {
        id v9 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__cleanupAppleIDCredentials selector:0 userInfo:0 repeats:600.0];
        credentialExpirationTimer = self->_credentialExpirationTimer;
        self->_credentialExpirationTimer = v9;
      }
    }
  }
}

- (BOOL)_registerUserCredentialsName:(id)a3 rawPassword:(id)a4 error:(id *)a5
{
  id v6 = a3;
  [a4 dataUsingEncoding:4];
  LOBYTE(a4) = SOSCCSetUserCredentials();

  return (char)a4;
}

- (void)promptForPasswordOverController:(id)a3 withCompletion:(id)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  char v9 = [v8 isNetworkReachable];

  if (v9)
  {
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__5;
    v40 = __Block_byref_object_dispose__5;
    id v41 = [MEMORY[0x1E4F179C8] defaultStore];
    id v10 = objc_msgSend((id)v37[5], "aa_primaryAppleAccount");
    if (v10)
    {
      id v11 = [(PSKeychainSyncManager *)self appleIDRawPassword];
      id v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        objc_msgSend(v10, "_aa_rawPassword");
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v15 = v13;

      id v16 = [(PSKeychainSyncManager *)self appleIDPasswordOrEquivalentToken];
      id v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        objc_msgSend(v10, "aa_password");
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      char v19 = v18;

      if (v15)
      {
        if (v6) {
          [(PSKeychainSyncManager *)self startNavigationSpinnerInViewController:v6];
        }
        uint64_t v20 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke;
        block[3] = &unk_1E5C5E9A8;
        void block[4] = self;
        id v30 = v10;
        id v31 = v15;
        id v32 = v6;
        id v33 = v19;
        id v34 = v7;
        id v35 = &v36;
        dispatch_async(v20, block);
      }
      else if ([(PSKeychainSyncManager *)self isRunningInBuddy])
      {
        NSLog(&cfstr_TriedToDisplay.isa);
      }
      else
      {
        if (v6) {
          [(PSKeychainSyncManager *)self startNavigationSpinnerInViewController:v6];
        }
        uint64_t v42 = *MEMORY[0x1E4F17A40];
        v43[0] = MEMORY[0x1E4F1CC38];
        id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
        uint64_t v22 = (void *)v37[5];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_3;
        v23[3] = &unk_1E5C5EA20;
        id v24 = v10;
        id v25 = self;
        id v26 = v6;
        id v27 = v7;
        id v28 = &v36;
        [v22 renewCredentialsForAccount:v24 options:v21 completion:v23];
      }
    }
    else
    {
      if (!v7)
      {
LABEL_24:

        _Block_object_dispose(&v36, 8);
        goto LABEL_25;
      }
      id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:3 userInfo:0];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
    }

    goto LABEL_24;
  }
  [(PSKeychainSyncManager *)self showNetworkReachabilityError];
  if (v7)
  {
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:4 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
  }
LABEL_25:
}

void __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) username];
  uint64_t v4 = *(void *)(a1 + 48);
  id v22 = 0;
  char v5 = [v2 _registerUserCredentialsName:v3 rawPassword:v4 error:&v22];
  id v6 = v22;

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_2;
  v12[3] = &unk_1E5C5E980;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(void **)(a1 + 40);
  id v13 = v7;
  uint64_t v14 = v8;
  char v21 = v5;
  id v15 = v9;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  id v18 = v6;
  id v19 = v10;
  uint64_t v20 = *(void *)(a1 + 80);
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) stopNavigationSpinner];
  }
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 96))
  {
    BOOL v3 = [*(id *)(a1 + 48) username];
    [v2 setAppleIDUsername:v3];

    [*(id *)(a1 + 40) setAppleIDRawPassword:*(void *)(a1 + 56) equivalentToken:*(void *)(a1 + 64)];
  }
  else
  {
    [*(id *)(a1 + 40) _showGenericFlowErrorAlert];
  }
  uint64_t v4 = *(void *)(a1 + 80);
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, *(unsigned __int8 *)(a1 + 96), *(void *)(a1 + 72));
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 88) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_4;
  block[3] = &unk_1E5C5E9F8;
  uint64_t v20 = a2;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  char v9 = *(void **)(a1 + 48);
  id v14 = v7;
  uint64_t v15 = v8;
  id v16 = v9;
  id v17 = v5;
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  id v18 = v10;
  uint64_t v19 = v11;
  id v12 = v5;
  dispatch_async(v6, block);
}

void __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 80))
  {
    uint64_t v2 = 0;
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_aa_rawPassword");
    BOOL v3 = objc_msgSend(*(id *)(a1 + 32), "aa_password");
    if (v2)
    {
      id v6 = *(void **)(a1 + 40);
      id v7 = [*(id *)(a1 + 32) username];
      id v27 = 0;
      char v4 = [v6 _registerUserCredentialsName:v7 rawPassword:v2 error:&v27];
      id v5 = v27;

      goto LABEL_6;
    }
    NSLog(&cfstr_GotANilPasswor.isa);
  }
  char v4 = 0;
  id v5 = 0;
LABEL_6:
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_5;
  v15[3] = &unk_1E5C5E9D0;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 40);
  id v16 = v8;
  uint64_t v17 = v9;
  uint64_t v25 = *(void *)(a1 + 80);
  id v18 = *(id *)(a1 + 56);
  id v19 = v5;
  id v20 = v2;
  id v21 = v3;
  char v26 = v4;
  id v22 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  id v23 = v10;
  uint64_t v24 = v11;
  id v12 = v3;
  id v13 = v2;
  id v14 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

void __72__PSKeychainSyncManager_promptForPasswordOverController_withCompletion___block_invoke_5(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) stopNavigationSpinner];
  }
  uint64_t v2 = *(void *)(a1 + 104);
  if (v2 == 1)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:1 userInfo:0];
  }
  else if (v2)
  {
    uint64_t v6 = 0;
  }
  else
  {
    BOOL v3 = *(void **)(a1 + 48);
    if (!v3) {
      BOOL v3 = *(void **)(a1 + 56);
    }
    id v10 = v3;
    if (*(void *)(a1 + 64) && *(void *)(a1 + 72) && *(unsigned char *)(a1 + 112))
    {
      char v4 = *(void **)(a1 + 40);
      id v5 = [*(id *)(a1 + 80) username];
      [v4 setAppleIDUsername:v5];

      [*(id *)(a1 + 40) setAppleIDRawPassword:*(void *)(a1 + 64) equivalentToken:*(void *)(a1 + 72)];
    }
    else
    {
      [*(id *)(a1 + 40) _showGenericFlowErrorAlert];
    }
    uint64_t v6 = (uint64_t)v10;
  }
  id v11 = (id)v6;
  uint64_t v7 = *(void *)(a1 + 88);
  if (v7) {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, *(unsigned __int8 *)(a1 + 112), v11);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 96) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void)promptForPasswordIfNeededForWritingOverController:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  if (SOSCCCanAuthenticate())
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    [(PSKeychainSyncManager *)self promptForPasswordOverController:v6 withCompletion:v7];
  }
}

- (void)promptForPasswordIfNeededOverController:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PSKeychainSyncManager_promptForPasswordIfNeededOverController_withCompletion___block_invoke;
  block[3] = &unk_1E5C5DE48;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __80__PSKeychainSyncManager_promptForPasswordIfNeededOverController_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  SOSCCThisDeviceIsInCircle();
  if ([*(id *)(a1 + 32) _errorRequiresPasswordPrompt:0])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__PSKeychainSyncManager_promptForPasswordIfNeededOverController_withCompletion___block_invoke_2;
    block[3] = &unk_1E5C5DE48;
    uint64_t v2 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v8 = v2;
    id v9 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);

    BOOL v3 = v8;
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __80__PSKeychainSyncManager_promptForPasswordIfNeededOverController_withCompletion___block_invoke_3;
    v4[3] = &unk_1E5C5EA48;
    id v6 = *(id *)(a1 + 48);
    id v5 = 0;
    dispatch_async(MEMORY[0x1E4F14428], v4);

    BOOL v3 = v6;
  }
}

uint64_t __80__PSKeychainSyncManager_promptForPasswordIfNeededOverController_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) promptForPasswordOverController:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

uint64_t __80__PSKeychainSyncManager_promptForPasswordIfNeededOverController_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

- (void)promptForPasswordIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(PSKeychainSyncManager *)self navigationController];
  id v5 = [v6 topViewController];
  [(PSKeychainSyncManager *)self promptForPasswordIfNeededOverController:v5 withCompletion:v4];
}

- (void)promptForPasswordIfCredentialsNotCachedOverController:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PSKeychainSyncManager *)self appleIDUsername];
  id v9 = [(PSKeychainSyncManager *)self appleIDRawPassword];
  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    id v10 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass_0());
    [v10 setUsername:v8];
    [v10 _setPassword:v9];
    [v10 setAuthenticationType:1];
    id v11 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __94__PSKeychainSyncManager_promptForPasswordIfCredentialsNotCachedOverController_withCompletion___block_invoke;
    v12[3] = &unk_1E5C5EA98;
    void v12[4] = self;
    id v13 = v9;
    id v14 = v7;
    [v11 authenticateWithContext:v10 completion:v12];
  }
  else
  {
    [(PSKeychainSyncManager *)self promptForPasswordOverController:v6 withCompletion:v7];
  }
}

void __94__PSKeychainSyncManager_promptForPasswordIfCredentialsNotCachedOverController_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__PSKeychainSyncManager_promptForPasswordIfCredentialsNotCachedOverController_withCompletion___block_invoke_2;
  block[3] = &unk_1E5C5EA70;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = v8;
  id v9 = *(id *)(a1 + 48);
  id v16 = v6;
  id v17 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __94__PSKeychainSyncManager_promptForPasswordIfCredentialsNotCachedOverController_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    BOOL v3 = (void *)getAKAuthenticationPasswordKeySymbolLoc_ptr;
    uint64_t v13 = getAKAuthenticationPasswordKeySymbolLoc_ptr;
    if (!getAKAuthenticationPasswordKeySymbolLoc_ptr)
    {
      id v4 = (void *)AuthKitLibrary_0();
      v11[3] = (uint64_t)dlsym(v4, "AKAuthenticationPasswordKey");
      getAKAuthenticationPasswordKeySymbolLoc_ptr = v11[3];
      BOOL v3 = (void *)v11[3];
    }
    _Block_object_dispose(&v10, 8);
    if (!v3)
    {
      id v9 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
      _Block_object_dispose(&v10, 8);
      _Unwind_Resume(v9);
    }
    id v5 = [v2 objectForKey:*v3];
    [*(id *)(a1 + 40) setAppleIDRawPassword:*(void *)(a1 + 48) equivalentToken:v5];
    uint64_t v6 = *(void *)(a1 + 64);
    if (v6) {
      (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, 1, 0);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 64);
    if (v7)
    {
      id v8 = *(void (**)(void))(v7 + 16);
      v8();
    }
  }
}

- (BOOL)_errorRequiresPasswordPrompt:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F3B4D0]]) {
    BOOL v5 = [v3 code] == 1 || objc_msgSend(v3, "code") == 2;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)makeSettingsSetupControllerWithSpecifier:(id)a3 parent:(id)a4 initialController:(id)a5
{
  id v12 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[KeychainSyncSetupController alloc] initWithManager:self];
  [(PSKeychainSyncManager *)self setSettingsSetupController:v10];

  [(PSRootController *)self->_settingsSetupController setSpecifier:v9];
  [(PSSetupController *)self->_settingsSetupController setParentController:v8];

  [v12 setParentController:self->_settingsSetupController];
  [v12 setRootController:self->_settingsSetupController];
  [v12 setSpecifier:v9];

  id v11 = v12;
  if (v12)
  {
    [(PSRootController *)self->_settingsSetupController showController:v12];
    id v11 = v12;
  }
}

- (void)_registerForCircleChangeNotifications
{
  if (!self->_circleNotificationToken)
  {
    uint64_t v2 = (const char *)*MEMORY[0x1E4F3B4C8];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __62__PSKeychainSyncManager__registerForCircleChangeNotifications__block_invoke;
    handler[3] = &unk_1E5C5EAC0;
    handler[4] = self;
    notify_register_dispatch(v2, &self->_circleNotificationToken, MEMORY[0x1E4F14428], handler);
  }
}

uint64_t __62__PSKeychainSyncManager__registerForCircleChangeNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCircleChangedNotification];
}

- (void)_registerForCircleChangeNotificationsWithCompletion:(id)a3
{
  [(PSKeychainSyncManager *)self setCircleJoinCompletion:a3];
  [(PSKeychainSyncManager *)self _registerForCircleChangeNotifications];
}

- (void)showPinChoiceAlert
{
  id v3 = (void *)MEMORY[0x1E4F42728];
  id v4 = PS_LocalizedStringForKeychainSync(@"USE_DEVICE_PASSCODE_TITLE");
  BOOL v5 = PS_LocalizedStringForKeychainSync(@"SECURITY_CODE_DESCRIPTION");
  uint64_t v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  uint64_t v7 = (void *)MEMORY[0x1E4F42720];
  id v8 = PS_LocalizedStringForKeychainSync(@"USE_DEVICE_PASSCODE");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__PSKeychainSyncManager_showPinChoiceAlert__block_invoke;
  v14[3] = &unk_1E5C5DAE8;
  v14[4] = self;
  id v9 = [v7 actionWithTitle:v8 style:0 handler:v14];
  [v6 addAction:v9];

  uint64_t v10 = (void *)MEMORY[0x1E4F42720];
  id v11 = PS_LocalizedStringForKeychainSync(@"CREATE_DIFFERENT_CODE");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__PSKeychainSyncManager_showPinChoiceAlert__block_invoke_2;
  v13[3] = &unk_1E5C5DAE8;
  void v13[4] = self;
  id v12 = [v10 actionWithTitle:v11 style:0 handler:v13];
  [v6 addAction:v12];

  [(PSKeychainSyncManager *)self showAlert:v6];
}

uint64_t __43__PSKeychainSyncManager_showPinChoiceAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pinChoiceAlertDidChooseToUseDevicePasscode:1];
}

uint64_t __43__PSKeychainSyncManager_showPinChoiceAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) pinChoiceAlertDidChooseToUseDevicePasscode:0];
}

- (void)setStagedSecurityCode:(id)a3 type:(int)a4
{
  uint64_t v7 = (NSString *)a3;
  p_stagedSecurityCode = &self->_stagedSecurityCode;
  if (self->_stagedSecurityCode != v7)
  {
    id v9 = v7;
    objc_storeStrong((id *)p_stagedSecurityCode, a3);
    uint64_t v7 = v9;
    self->_stagedSecurityCodeType = a4;
  }
  MEMORY[0x1F41817F8](p_stagedSecurityCode, v7);
}

- (id)preferencesApp
{
  uint64_t v2 = [MEMORY[0x1E4F42738] sharedApplication];
  NSClassFromString(&cfstr_Preferencesapp.isa);
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)startNavigationSpinnerInViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    spinningView = self->_spinningView;
    id v20 = v4;
    if (spinningView)
    {
      uint64_t v7 = [v4 view];

      BOOL v5 = v20;
      if (spinningView != v7) {
        goto LABEL_10;
      }
      id v8 = self->_spinningView;
      ++self->_spinnerCount;
      if (v8) {
        goto LABEL_10;
      }
    }
    else
    {
      ++self->_spinnerCount;
    }
    id v9 = [v5 navigationController];
    uint64_t v10 = [v9 view];
    id v11 = self->_spinningView;
    self->_spinningView = v10;

    id v12 = +[PSNavBarSpinnerManager sharedSpinnerManager];
    uint64_t v13 = [v20 navigationItem];
    [v12 startAnimatingInNavItem:v13 forIdentifier:@"KeychainSync"];

    [(UIView *)self->_spinningView setUserInteractionEnabled:0];
    id v4 = (id)[(PSKeychainSyncManager *)self isRunningInBuddy];
    BOOL v5 = v20;
    if ((v4 & 1) == 0)
    {
      uint64_t v14 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v15 = [v14 userInterfaceIdiom];

      BOOL v5 = v20;
      if (v15 == 1)
      {
        id v16 = [(PSKeychainSyncManager *)self preferencesApp];
        id v17 = [v16 rootController];

        id v18 = [v17 rootListController];
        id v19 = [v18 view];
        [v19 setUserInteractionEnabled:0];

        BOOL v5 = v20;
      }
    }
  }
LABEL_10:
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)stopNavigationSpinner
{
  if (self->_spinningView)
  {
    unsigned int v3 = self->_spinnerCount - 1;
    self->_spinnerCount = v3;
    if (!v3)
    {
      id v4 = +[PSNavBarSpinnerManager sharedSpinnerManager];
      [v4 stopAnimatingForIdentifier:@"KeychainSync"];

      [(UIView *)self->_spinningView setUserInteractionEnabled:1];
      spinningView = self->_spinningView;
      self->_spinningView = 0;

      if (![(PSKeychainSyncManager *)self isRunningInBuddy])
      {
        uint64_t v6 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v7 = [v6 userInterfaceIdiom];

        if (v7 == 1)
        {
          id v8 = [(PSKeychainSyncManager *)self preferencesApp];
          id v11 = [v8 rootController];

          id v9 = [v11 rootListController];
          uint64_t v10 = [v9 view];
          [v10 setUserInteractionEnabled:1];
        }
      }
    }
  }
}

- (BOOL)_changeSecurityCode:(id)a3 type:(int)a4 smsTarget:(id)a5 smsTargetCountryInfo:(id)a6 username:(id)a7 passwordOrEquivalentToken:(id)a8 error:(id *)a9
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v75 = a7;
  id v17 = a8;
  id v18 = objc_alloc_init((Class)getSecureBackupClass_0());
  v76[0] = 0;
  id v19 = [v18 getAccountInfoWithInfo:0 results:v76];
  id v20 = v76[0];
  if (!v19)
  {
    int v71 = a4;
    id v22 = getkSecureBackupMetadataKey_0();
    id v23 = [v20 objectForKey:v22];
    uint64_t v24 = (void *)[v23 mutableCopy];

    uint64_t v25 = [v15 length];
    id v68 = v17;
    v69 = v14;
    v74 = v20;
    if (v16 && v25)
    {
      char v26 = 0;
      id v27 = 0;
    }
    else
    {
      CFTypeRef v29 = getkSecureBackupSMSTargetInfoKey();
      id v30 = [v20 objectForKey:v29];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = getkSecureBackupSMSTargetPhoneNumberKey();
        uint64_t v32 = [v30 objectForKey:v31];

        id v33 = getkSecureBackupCountryDialCodeKey();
        id v27 = [v30 objectForKey:v33];

        id v34 = getkSecureBackupCountryCodeKey_0();
        uint64_t v35 = [v30 objectForKey:v34];

        if (v35)
        {
          uint64_t v36 = (void *)v35;
          id v15 = (id)v32;
          id v17 = v68;
          char v26 = v36;
        }
        else
        {
          uint64_t v37 = getkSecureBackupCountryCodeKey_0();
          char v26 = [v24 objectForKey:v37];

          id v15 = (id)v32;
          id v17 = v68;
        }
      }
      else
      {
        id v27 = 0;
        char v26 = 0;
      }

      if (!v16)
      {
LABEL_16:
        v72 = v26;
        v73 = v27;
        v40 = [MEMORY[0x1E4F28ED0] numberWithInt:v71 != 0];
        id v41 = getkSecureBackupUsesComplexPassphraseKey();
        [v24 setObject:v40 forKey:v41];

        uint64_t v42 = [MEMORY[0x1E4F28ED0] numberWithInt:v71 == 0];
        v43 = getkSecureBackupUsesNumericPassphraseKey();
        [v24 setObject:v42 forKey:v43];

        if (!v71)
        {
          v44 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v69, "length"));
          v45 = getkSecureBackupNumericPassphraseLengthKey();
          [v24 setObject:v44 forKey:v45];
        }
        v46 = getkSecureBackupIsEnabledKey();
        v47 = [v74 objectForKey:v46];
        int v48 = [v47 BOOLValue];

        v70 = v24;
        if (v48
          && ([v18 disableWithInfo:0], (v49 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v50 = 0;
          BOOL v21 = 0;
          id v19 = 0;
          v51 = v49;
          id v14 = v69;
          id v28 = v75;
          if (!a9) {
            goto LABEL_32;
          }
        }
        else
        {
          v66 = v18;
          id v67 = v16;
          v52 = (void *)MEMORY[0x1E4F1CA60];
          v53 = getkSecureBackupPassphraseKey();
          v54 = getkSecureBackupAuthenticationAppleID();
          getkSecureBackupAuthenticationPassword();
          v56 = v55 = v15;
          v57 = [MEMORY[0x1E4F28ED0] numberWithInt:v71 == 2];
          v58 = getkSecureBackupUsesRandomPassphraseKey();
          v59 = getkSecureBackupMetadataKey_0();
          v60 = v52;
          id v14 = v69;
          v51 = objc_msgSend(v60, "dictionaryWithObjectsAndKeys:", v69, v53, v75, v54, v17, v56, v57, v58, v24, v59, 0);

          id v15 = v55;
          if ([v55 length])
          {
            v61 = getkSecureBackupSMSTargetPhoneNumberKey();
            [v51 setObject:v55 forKey:v61];
          }
          if ([v73 length])
          {
            v62 = getkSecureBackupCountryDialCodeKey();
            [v51 setObject:v73 forKey:v62];
          }
          id v16 = v67;
          id v17 = v68;
          id v28 = v75;
          id v18 = v66;
          if ([v72 length])
          {
            v63 = getkSecureBackupCountryCodeKey_0();
            [v51 setObject:v72 forKey:v63];

            v64 = getkSecureBackupCountryCodeKey_0();
            [v70 setObject:v72 forKey:v64];
          }
          v49 = [v66 enableWithInfo:v51];
          BOOL v21 = v49 == 0;
          if (!a9)
          {
            id v19 = v49;
            goto LABEL_32;
          }
          v50 = v49;
          id v19 = v49;
          if (!v49)
          {
LABEL_32:

            id v20 = v74;
            goto LABEL_33;
          }
        }
        *a9 = v49;
        id v19 = v50;
        goto LABEL_32;
      }
    }
    uint64_t v38 = [v16 countryCode];

    uint64_t v39 = [v16 dialingPrefix];

    id v27 = (void *)v39;
    char v26 = (void *)v38;
    goto LABEL_16;
  }
  if (a9)
  {
    id v19 = v19;
    BOOL v21 = 0;
    *a9 = v19;
  }
  else
  {
    BOOL v21 = 0;
  }
  id v28 = v75;
LABEL_33:

  return v21;
}

- (void)_changeToNewSecurityCode:(id)a3 type:(int)a4 smsTarget:(id)a5 smsTargetCountryInfo:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(PSKeychainSyncManager *)self navigationController];
  id v14 = [v13 topViewController];
  [(PSKeychainSyncManager *)self startNavigationSpinnerInViewController:v14];

  id v15 = [(PSKeychainSyncManager *)self appleIDUsername];
  id v16 = [(PSKeychainSyncManager *)self appleIDPasswordOrEquivalentToken];
  id v17 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PSKeychainSyncManager__changeToNewSecurityCode_type_smsTarget_smsTargetCountryInfo___block_invoke;
  block[3] = &unk_1E5C5EB10;
  void block[4] = self;
  id v24 = v10;
  int v29 = a4;
  id v25 = v11;
  id v26 = v12;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  dispatch_async(v17, block);
}

void __86__PSKeychainSyncManager__changeToNewSecurityCode_type_smsTarget_smsTargetCountryInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned int *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  id v20 = 0;
  char v9 = [v2 _changeSecurityCode:v3 type:v5 smsTarget:v4 smsTargetCountryInfo:v6 username:v7 passwordOrEquivalentToken:v8 error:&v20];
  id v10 = v20;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PSKeychainSyncManager__changeToNewSecurityCode_type_smsTarget_smsTargetCountryInfo___block_invoke_2;
  block[3] = &unk_1E5C5EAE8;
  uint64_t v11 = *(void *)(a1 + 32);
  char v19 = v9;
  void block[4] = v11;
  id v14 = v10;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 40);
  int v18 = *(_DWORD *)(a1 + 80);
  id v12 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __86__PSKeychainSyncManager__changeToNewSecurityCode_type_smsTarget_smsTargetCountryInfo___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) stopNavigationSpinner];
  if (!*(unsigned char *)(a1 + 76))
  {
    uint64_t v2 = [*(id *)(a1 + 40) domain];
    uint64_t v3 = getkSecureBackupErrorDomain();
    if ([v2 isEqualToString:v3])
    {
      uint64_t v4 = [*(id *)(a1 + 40) code];

      if (v4 == 29)
      {
        [*(id *)(a1 + 32) _showInvalidPhoneNumberAlertWithDigits:*(void *)(a1 + 48) countryInfo:*(void *)(a1 + 56)];
        goto LABEL_7;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) _showGenericFlowErrorAlert];
  }
LABEL_7:
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 160);
  if (v6)
  {
    (*(void (**)(uint64_t, void, void, void, void))(v6 + 16))(v6, *(unsigned __int8 *)(a1 + 76), *(void *)(a1 + 64), *(unsigned int *)(a1 + 72), *(void *)(a1 + 40));
    [*(id *)(a1 + 32) setChangeSecurityCodeCompletion:0];
    uint64_t v5 = *(void *)(a1 + 32);
  }
  uint64_t v7 = [*(id *)(v5 + 200) rootController];
  [v7 dismissViewControllerAnimated:1 completion:0];

  *(_DWORD *)(*(void *)(a1 + 32) + 16) = 0;
}

- (void)promptForDevicePasscodeChangeToPasscode:(id)a3 overController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [getCDPAccountClass() sharedInstance];
  uint64_t v12 = [v11 primaryAccountSecurityLevel];

  uint64_t v13 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke;
  block[3] = &unk_1E5C5EC28;
  id v18 = v9;
  id v19 = v8;
  id v20 = self;
  id v21 = v10;
  BOOL v22 = v12 == 5;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  dispatch_async(v13, block);
}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke(uint64_t a1)
{
  if (PSKeychainSyncIsUsingICDP())
  {
    BOOL v28 = 0;
    int v2 = PSIsUsingPasscode(&v28);
    uint64_t v3 = 2;
    if (!v28) {
      uint64_t v3 = 3;
    }
    if (v2) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = objc_alloc_init((Class)getCDPContextClass());
    uint64_t v6 = (void *)[objc_alloc((Class)getCDPStateControllerClass()) initWithContext:v5];
    uint64_t v7 = (void *)[objc_alloc((Class)getCDPUIControllerClass()) initWithPresentingViewController:*(void *)(a1 + 32)];
    [v6 setUiProvider:v7];

    uint64_t v8 = *(void *)(a1 + 40);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2;
    v26[3] = &unk_1E5C5EB38;
    id v27 = *(id *)(a1 + 56);
    [v6 localSecretChangedTo:v8 secretType:v4 completion:v26];

    return;
  }
  BOOL v28 = 0;
  PSKeychainSyncGetCircleMembershipStatus(0, &v28);
  if (!v28)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      [*(id *)(a1 + 48) _presentAuthControllerWithPresentingVC:*(void *)(a1 + 32) completion:*(void *)(a1 + 56)];
      return;
    }
    goto LABEL_13;
  }
  id v9 = PSSecureBackupAccountInfo(0, 1);
  id v10 = getkSecureBackupIsEnabledKey();
  uint64_t v11 = [v9 objectForKey:v10];
  int v12 = [v11 BOOLValue];

  if (v9
    && (getkSecureBackupUsesRandomPassphraseKey(),
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        [v9 objectForKey:v13],
        id v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 BOOLValue],
        v14,
        v13,
        (v15 & 1) == 0))
  {
    BOOL v25 = 0;
    int v16 = v12 & PSIsUsingPasscode(&v25);
    if (v16 == 1)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_157;
      block[3] = &unk_1E5C5EC28;
      int8x16_t v19 = *(int8x16_t *)(a1 + 40);
      id v18 = (id)v19.i64[0];
      int8x16_t v21 = vextq_s8(v19, v19, 8uLL);
      BOOL v24 = v25;
      id v23 = *(id *)(a1 + 56);
      id v22 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  if ((v16 & 1) == 0)
  {
LABEL_13:
    uint64_t v17 = *(void *)(a1 + 56);
    if (v17) {
      (*(void (**)(uint64_t, uint64_t, void))(v17 + 16))(v17, 1, 0);
    }
  }
}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [MEMORY[0x1E4F42948] currentDevice];
    if (([v6 sf_isInternalInstall] & 1) != 0 || PSDiagnosticsAreEnabled())
    {
      uint64_t v7 = _PSLoggingFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2_cold_1(v7);
      }
    }
  }
  else
  {
    uint64_t v6 = _PSLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2_cold_2((uint64_t)v5, v6);
    }
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_157(uint64_t a1)
{
  [*(id *)(a1 + 32) setStagedSecurityCode:*(void *)(a1 + 40) type:*(unsigned char *)(a1 + 64) == 0];
  int v2 = (void *)MEMORY[0x1E4F42728];
  uint64_t v3 = PS_LocalizedStringForKeychainSync(@"USE_NEW_DEVICE_PASSCODE_AS_SECURITY_CODE");
  uint64_t v4 = PS_LocalizedStringForKeychainSync(@"USE_NEW_DEVICE_PASSCODE_AS_SECURITY_CODE_DETAILS");
  id v5 = [v2 alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  uint64_t v6 = (void *)MEMORY[0x1E4F42720];
  uint64_t v7 = PS_LocalizedStringForKeychainSync(@"DONT_CHANGE_SECURITY_CODE");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2_167;
  v14[3] = &unk_1E5C5EB60;
  id v15 = *(id *)(a1 + 56);
  uint64_t v8 = [v6 actionWithTitle:v7 style:1 handler:v14];
  [v5 addAction:v8];

  id v9 = (void *)MEMORY[0x1E4F42720];
  id v10 = PS_LocalizedStringForKeychainSync(@"USE_SAME_CODE_DEVICE_TO_ICSC");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_3;
  v12[3] = &unk_1E5C5EC00;
  void v12[4] = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 56);
  uint64_t v11 = [v9 actionWithTitle:v10 style:0 handler:v12];
  [v5 addAction:v11];

  [*(id *)(a1 + 48) presentViewController:v5 animated:1 completion:0];
}

uint64_t __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2_167(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_4;
  v2[3] = &unk_1E5C5EBD8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 promptForPasswordIfCredentialsNotCachedOverController:0 withCompletion:v2];
}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v7 = [v6 appleIDUsername];
    uint64_t v8 = [*(id *)(a1 + 32) appleIDPasswordOrEquivalentToken];
    id v9 = dispatch_get_global_queue(0, 0);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_5;
    v14[3] = &unk_1E5C5EBB0;
    id v10 = *(void **)(a1 + 40);
    void v14[4] = *(void *)(a1 + 32);
    id v15 = v7;
    id v16 = v8;
    id v17 = v10;
    id v11 = v8;
    id v12 = v7;
    dispatch_async(v9, v14);
  }
  else
  {
    [v6 _cleanup];
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, uint64_t, void))(v13 + 16))(v13, 1, 0);
    }
  }
}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_5(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = [v2 stagedSecurityCode];
  uint64_t v4 = [*(id *)(a1 + 32) stagedSecurityCodeType];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v15 = 0;
  LOBYTE(v2) = [v2 _changeSecurityCode:v3 type:v4 smsTarget:0 smsTargetCountryInfo:0 username:v5 passwordOrEquivalentToken:v6 error:&v15];
  id v7 = v15;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_6;
  block[3] = &unk_1E5C5EB88;
  char v14 = (char)v2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = *(id *)(a1 + 56);
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_6(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2) {
      (*(void (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, 1, 0);
    }
  }
  else
  {
    NSLog(&cfstr_ErrorChangingS.isa, *(void *)(a1 + 32));
    *(_DWORD *)(*(void *)(a1 + 40) + 16) = 3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_7;
    v5[3] = &unk_1E5C5D938;
    id v3 = *(void **)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    [v3 _showGenericFlowErrorAlertWithDismissalHandler:v5];
  }
  return [*(id *)(a1 + 40) _cleanup];
}

uint64_t __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_7(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_presentAuthControllerWithPresentingVC:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  uint64_t v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
  id v9 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass_0());
  id v10 = [v8 username];
  [v9 setUsername:v10];

  [v9 setAuthenticationType:2];
  [v9 setIsUsernameEditable:0];
  [v9 setPresentingViewController:v6];

  id v11 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PSKeychainSyncManager__presentAuthControllerWithPresentingVC_completion___block_invoke;
  v13[3] = &unk_1E5C5EC50;
  id v14 = v5;
  id v12 = v5;
  [v11 authenticateWithContext:v9 completion:v13];
}

uint64_t __75__PSKeychainSyncManager__presentAuthControllerWithPresentingVC_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_showGenericFlowErrorAlertWithDismissalHandler:(id)a3
{
  id v4 = a3;
  int v5 = self->_flow - 1;
  if (v5 > 4) {
    id v6 = @"GENERIC_KEYCHAIN_ERROR_TITLE";
  }
  else {
    id v6 = *(&off_1E5C5EEF8 + v5);
  }
  id v7 = (void *)MEMORY[0x1E4F42728];
  uint64_t v8 = PS_LocalizedStringForKeychainSync(v6);
  id v9 = [v7 alertControllerWithTitle:v8 message:0 preferredStyle:1];

  id v10 = (void *)MEMORY[0x1E4F42720];
  id v11 = PS_LocalizedStringForKeychainSync(@"OK");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PSKeychainSyncManager__showGenericFlowErrorAlertWithDismissalHandler___block_invoke;
  v14[3] = &unk_1E5C5EB60;
  id v15 = v4;
  id v12 = v4;
  id v13 = [v10 actionWithTitle:v11 style:1 handler:v14];
  [v9 addAction:v13];

  [(PSKeychainSyncManager *)self showAlert:v9];
}

uint64_t __72__PSKeychainSyncManager__showGenericFlowErrorAlertWithDismissalHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_showGenericFlowErrorAlert
{
}

- (void)_showInvalidPhoneNumberAlertWithDigits:(id)a3 countryInfo:(id)a4
{
  id v15 = +[PSKeychainSyncPhoneNumber phoneNumberWithDigits:a3 countryInfo:a4];
  int v5 = NSString;
  id v6 = PS_LocalizedStringForKeychainSync(@"INVALID_PHONE_NUMBER");
  id v7 = [v15 formattedStringWithDialingPrefix];
  uint64_t v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

  id v9 = (void *)MEMORY[0x1E4F42728];
  id v10 = PS_LocalizedStringForKeychainSync(@"KEYCHAIN_VERIFICATION");
  id v11 = [v9 alertControllerWithTitle:v10 message:v8 preferredStyle:1];

  id v12 = (void *)MEMORY[0x1E4F42720];
  id v13 = PS_LocalizedStringForKeychainSync(@"OK");
  id v14 = [v12 actionWithTitle:v13 style:0 handler:0];
  [v11 addAction:v14];

  [(PSKeychainSyncManager *)self showAlert:v11];
}

- (void)showResetAcknowledgementIfNeededWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(PSKeychainSyncManager *)self circleWasReset])
  {
    int v5 = (void *)MEMORY[0x1E4F42728];
    id v6 = PS_LocalizedStringForKeychainSync(@"RESET_COMPLETED_TITLE");
    id v7 = PS_LocalizedStringForKeychainSync(@"RESET_COMPLETED_DESCRIPTION");
    uint64_t v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

    id v9 = (void *)MEMORY[0x1E4F42720];
    id v10 = PS_LocalizedStringForKeychainSync(@"OK");
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__PSKeychainSyncManager_showResetAcknowledgementIfNeededWithCompletion___block_invoke;
    v12[3] = &unk_1E5C5EB60;
    id v13 = v4;
    id v11 = [v9 actionWithTitle:v10 style:0 handler:v12];
    [v8 addAction:v11];

    [(PSKeychainSyncManager *)self showAlert:v8];
  }
  else if (v4)
  {
    v4[2](v4);
  }
  [(PSKeychainSyncManager *)self setCircleWasReset:0];
}

uint64_t __72__PSKeychainSyncManager_showResetAcknowledgementIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_resetCircleAndDisableBackupWithError:(id *)a3
{
  uint64_t v5 = SOSCCResetToEmpty();
  [(PSKeychainSyncManager *)self setCircleWasReset:v5];
  id v6 = objc_alloc_init((Class)getSecureBackupClass_0());
  uint64_t v7 = [v6 disableWithInfo:0];
  uint64_t v8 = (void *)v7;
  if (v7)
  {
    NSLog(&cfstr_ErrorDisabling.isa, v7);
    LOBYTE(v5) = 0;
  }
  if (a3 && v8) {
    *a3 = v8;
  }

  return v5;
}

- (void)_resetFromRecoveryFlow
{
  id v3 = [(PSKeychainSyncManager *)self navigationController];
  id v4 = [v3 topViewController];
  [(PSKeychainSyncManager *)self startNavigationSpinnerInViewController:v4];

  uint64_t v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke;
  block[3] = &unk_1E5C5D680;
  void block[4] = self;
  dispatch_async(v5, block);
}

void __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke(uint64_t a1)
{
  uint64_t v2 = PSSecureBackupAccountInfo(0, 1);
  id v3 = getkSecureBackupIsEnabledKey();
  id v4 = [v2 objectForKey:v3];
  char v5 = [v4 BOOLValue];

  [*(id *)(a1 + 32) _resetCircleAndDisableBackupWithError:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke_2;
  v6[3] = &unk_1E5C5EC78;
  char v7 = v5;
  void v6[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 stopNavigationSpinner];
    int v4 = [*(id *)(a1 + 32) isRunningInBuddy];
    char v5 = *(id **)(a1 + 32);
    if (v4)
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:5 userInfo:0];
      [v5 _finishedWithStatus:1 error:v7];
    }
    else
    {
      id v6 = [v5[25] rootController];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke_3;
      v9[3] = &unk_1E5C5D680;
      void v9[4] = *(void *)(a1 + 32);
      [v6 dismissViewControllerAnimated:1 completion:v9];
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke_4;
    v8[3] = &unk_1E5C5E728;
    v8[4] = v3;
    [v3 joinCircleWithCompletion:v8];
  }
}

void __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke_3(uint64_t a1)
{
  int v2 = *(id **)(a1 + 32);
  id v5 = [v2[25] specifier];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 200) parentController];
  int v4 = [*(id *)(a1 + 32) completion];
  [v2 showEnableSyncFlowWithSpecifier:v5 overController:v3 completion:v4];
}

void __47__PSKeychainSyncManager__resetFromRecoveryFlow__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 stopNavigationSpinner];
  [*(id *)(a1 + 32) _finishedWithStatus:a2 error:v6];
}

- (void)_peerApprovalFromRecoveryFlow
{
  id v3 = [(PSKeychainSyncManager *)self navigationController];
  int v4 = [v3 topViewController];
  [(PSKeychainSyncManager *)self startNavigationSpinnerInViewController:v4];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PSKeychainSyncManager__peerApprovalFromRecoveryFlow__block_invoke;
  v5[3] = &unk_1E5C5E728;
  void v5[4] = self;
  [(PSKeychainSyncManager *)self joinCircleWithCompletion:v5];
}

void __54__PSKeychainSyncManager__peerApprovalFromRecoveryFlow__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) stopNavigationSpinner];
  id v6 = *(void **)(a1 + 32);
  if (a3)
  {
    [*(id *)(a1 + 32) _showGenericFlowErrorAlert];
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = v7[7];
    [v7 keychainSyncControllerCancel:v8];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:6 userInfo:0];
    [v6 _finishedWithStatus:a2 error:v9];
  }
}

- (void)_cleanup
{
  devicePinController = self->_devicePinController;
  self->_devicePinController = 0;

  simpleSecurityCodeController = self->_simpleSecurityCodeController;
  self->_simpleSecurityCodeController = 0;

  complexSecurityCodeController = self->_complexSecurityCodeController;
  self->_complexSecurityCodeController = 0;

  advancedSecurityCodeChoiceController = self->_advancedSecurityCodeChoiceController;
  self->_advancedSecurityCodeChoiceController = 0;

  securityCodeRecoveryController = self->_securityCodeRecoveryController;
  self->_securityCodeRecoveryController = 0;

  phoneNumberController = self->_phoneNumberController;
  self->_phoneNumberController = 0;

  smsValidationController = self->_smsValidationController;
  self->_smsValidationController = 0;

  stagedSecurityCode = self->_stagedSecurityCode;
  self->_stagedSecurityCode = 0;

  int circleNotificationToken = self->_circleNotificationToken;
  if (circleNotificationToken)
  {
    notify_cancel(circleNotificationToken);
    self->_int circleNotificationToken = 0;
  }
  [(PSKeychainSyncManager *)self setCircleJoinCompletion:0];
  [(PSKeychainSyncManager *)self setHostViewController:0];
}

- (void)showController:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:self];
  if ([(PSKeychainSyncManager *)self isRunningInBuddy])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setRootController:self->_buddyNavigationController];
    }
    [(PSRootController *)self->_buddyNavigationController pushViewController:v4 animated:1];
  }
  else
  {
    [(PSRootController *)self->_settingsSetupController showController:v4];
  }
}

- (id)viewControllerForPresentingAlerts
{
  if ([(PSKeychainSyncManager *)self isRunningInBuddy])
  {
    id v3 = self->_buddyNavigationController;
  }
  else
  {
    id v4 = [(PSKeychainSyncManager *)self navigationController];
    id v5 = [v4 presentingViewController];
    if (v5) {
      [(PSKeychainSyncManager *)self navigationController];
    }
    else {
    id v3 = [(PSKeychainSyncManager *)self hostViewController];
    }
  }
  return v3;
}

- (void)showAlert:(id)a3
{
  id v4 = a3;
  id v5 = [(PSKeychainSyncManager *)self viewControllerForPresentingAlerts];
  [v5 presentViewController:v4 animated:1 completion:0];
}

- (void)showNetworkReachabilityError
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4BE78]);
  char v4 = [v3 airplaneMode];

  if (v4)
  {
    id v5 = SFLocalizableWAPIStringKeyForKey();
    PS_LocalizedStringForKeychainSync(v5);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PS_LocalizedStringForKeychainSync(@"NO_NETWORK_REACHABILITY_MESSAGE");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v10 message:0 preferredStyle:1];
  id v7 = (void *)MEMORY[0x1E4F42720];
  uint64_t v8 = PS_LocalizedStringForKeychainSync(@"OK");
  id v9 = [v7 actionWithTitle:v8 style:0 handler:0];
  [v6 addAction:v9];

  [(PSKeychainSyncManager *)self showAlert:v6];
}

- (void)showContactAppleSupportPane
{
  if ([(PSKeychainSyncManager *)self isRunningInBuddy])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F42BF8]);
    id v3 = [v11 navigationBar];
    [v3 _setHidesShadow:1];

    char v4 = [v11 navigationBar];
    id v5 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.96];
    [v4 setBarTintColor:v5];

    id v6 = [[KeychainSyncAppleSupportController alloc] initWithNibName:0 bundle:0];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_dismissAppleSupportPane_];
    uint64_t v8 = [(KeychainSyncAppleSupportController *)v6 navigationItem];
    [v8 setRightBarButtonItem:v7];

    [v11 pushViewController:v6 animated:0];
    [v11 setModalPresentationStyle:2];
    id v9 = [(PSKeychainSyncManager *)self navigationController];
    id v10 = [v9 topViewController];
    [v10 presentViewController:v11 animated:1 completion:0];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F42738] sharedApplication];
    id v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"http://apple.com/support/icloud/keychain"];
    [v11 openURL:v6 options:MEMORY[0x1E4F1CC08] completionHandler:0];
  }
}

- (void)dismissAppleSupportPane:(id)a3
{
  char v4 = [(PSKeychainSyncManager *)self navigationController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PSKeychainSyncManager_dismissAppleSupportPane___block_invoke;
  v5[3] = &unk_1E5C5D680;
  void v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

void __49__PSKeychainSyncManager_dismissAppleSupportPane___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  v1 = [v2 topViewController];
  [v1 becomeFirstResponder];
}

- (id)_defaultKeychainViewSet
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F3B4F8], *MEMORY[0x1E4F3B4D8], *MEMORY[0x1E4F3B4F0], *MEMORY[0x1E4F3B4E8], 0);
}

- (void)joinCircleAfterRecovery:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v22 = 0;
  uint64_t Status = PSKeychainSyncGetStatus(&v22);
  id v8 = v22;
  id v9 = v8;
  char v10 = Status != 3 || v4;
  if (Status == 2 || (v10 & 1) == 0)
  {
    if (v6)
    {
      id v11 = (void (*)(void *, uint64_t, void *))v6[2];
      id v12 = v6;
      uint64_t v13 = Status;
      id v14 = 0;
      goto LABEL_12;
    }
  }
  else if (v8)
  {
    NSLog(&cfstr_ErrorCheckingC_1.isa, v8);
    if (v6)
    {
      id v11 = (void (*)(void *, uint64_t, void *))v6[2];
      id v12 = v6;
      uint64_t v13 = 0;
LABEL_9:
      id v14 = v9;
LABEL_12:
      v11(v12, v13, v14);
    }
  }
  else
  {
    [(PSKeychainSyncManager *)self _registerForCircleChangeNotificationsWithCompletion:v6];
    self->_joiningCircle = 1;
    self->_joiningCircleAfterRecovery = v4;
    int8x16_t v21 = 0;
    if (v4) {
      int v15 = SOSCCRequestToJoinCircleAfterRestore();
    }
    else {
      int v15 = SOSCCRequestToJoinCircle();
    }
    int v16 = v15;
    [(PSKeychainSyncManager *)self _defaultKeychainViewSet];
    [MEMORY[0x1E4F1CAD0] set];
    SOSCCViewSet();
    id v9 = v21;
    if ((v16 & 1) == 0)
    {
      NSLog(&cfstr_RequestToJoinC.isa, v21);
      self->_joiningCircle = 0;
    }
    if ([(PSKeychainSyncManager *)self _errorRequiresPasswordPrompt:v9])
    {
      id v17 = [(PSKeychainSyncManager *)self navigationController];
      id v18 = [v17 topViewController];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __64__PSKeychainSyncManager_joinCircleAfterRecovery_withCompletion___block_invoke;
      v19[3] = &unk_1E5C5EBD8;
      v19[4] = self;
      id v20 = v6;
      [(PSKeychainSyncManager *)self promptForPasswordOverController:v18 withCompletion:v19];

      goto LABEL_13;
    }
    if (v6 && v16 != 1)
    {
      id v11 = (void (*)(void *, uint64_t, void *))v6[2];
      id v12 = v6;
      uint64_t v13 = 1;
      goto LABEL_9;
    }
  }
LABEL_13:
}

uint64_t __64__PSKeychainSyncManager_joinCircleAfterRecovery_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  a3;
  if (a2)
  {
    [*(id *)(a1 + 32) joinCircleWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }
  }
  return MEMORY[0x1F4181820]();
}

- (void)joinCircleWithCompletion:(id)a3
{
}

- (void)_recoverWithSecurityCode:(id)a3 verificationCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PSKeychainSyncManager *)self navigationController];
  id v9 = [v8 topViewController];
  [(PSKeychainSyncManager *)self startNavigationSpinnerInViewController:v9];

  char v10 = (void *)MEMORY[0x1E4F1C9E8];
  id v11 = getkSecureBackupPassphraseKey();
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  id v12 = (void *)getkSecureBackupVerificationTokenKeySymbolLoc_ptr;
  uint64_t v28 = getkSecureBackupVerificationTokenKeySymbolLoc_ptr;
  if (!getkSecureBackupVerificationTokenKeySymbolLoc_ptr)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __getkSecureBackupVerificationTokenKeySymbolLoc_block_invoke;
    id v23 = &unk_1E5C5D4D8;
    BOOL v24 = &v25;
    uint64_t v13 = (void *)CloudServicesLibrary_1();
    v26[3] = (uint64_t)dlsym(v13, "kSecureBackupVerificationTokenKey");
    getkSecureBackupVerificationTokenKeySymbolLoc_ptr = *(void *)(v24[1] + 24);
    id v12 = (void *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v12)
  {
    id v17 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v25, 8);
    _Unwind_Resume(v17);
  }
  id v14 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v6, v11, v7, *v12, 0);

  id v15 = objc_alloc_init((Class)getSecureBackupClass_0());
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke;
  v18[3] = &unk_1E5C5DDA8;
  v18[4] = self;
  id v19 = v7;
  id v16 = v7;
  [v15 recoverWithInfo:v14 completionBlockWithResults:v18];
}

void __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    NSLog(&cfstr_ErrorRecoverin.isa, v4);
  }
  char v6 = PSKeychainSyncCircleExists();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_2;
  block[3] = &unk_1E5C5ECA0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v8;
  char v14 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    [v2 stopNavigationSpinner];
    id v4 = [*(id *)(a1 + 32) domain];
    uint64_t v5 = getkSecureBackupErrorDomain();
    int v6 = [v4 isEqualToString:v5];

    if (v6)
    {
      switch([*(id *)(a1 + 32) code])
      {
        case 12:
        case 25:
        case 26:
          if (*(void *)(a1 + 48)) {
            uint64_t v7 = @"INCORRECT_SECURITY_OR_VERIFICATION_CODE";
          }
          else {
            uint64_t v7 = @"INCORRECT_SECURITY_CODE";
          }
          id v8 = PS_LocalizedStringForKeychainSync(v7);
          if (*(void *)(a1 + 48)) {
            id v9 = @"ENTER_SECURITY_AND_VERIFICATION_CODES_AGAIN";
          }
          else {
            id v9 = @"ENTER_SECURITY_CODE_AGAIN";
          }
          char v10 = PS_LocalizedStringForKeychainSync(v9);
          id v11 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v8 message:v10 preferredStyle:1];
          uint64_t v12 = (void *)MEMORY[0x1E4F42720];
          id v13 = PS_LocalizedStringForKeychainSync(@"OK");
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_3;
          v59[3] = &unk_1E5C5DAE8;
          v59[4] = *(void *)(a1 + 40);
          char v14 = [v12 actionWithTitle:v13 style:1 handler:v59];
          [v11 addAction:v14];

          goto LABEL_23;
        case 13:
          id v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          char v17 = [v16 BOOLForKey:@"keychainSyncTreatSoftLimitAsHardLimit"];

          if (v17) {
            goto LABEL_13;
          }
          v43 = (void *)MEMORY[0x1E4F42728];
          v44 = PS_LocalizedStringForKeychainSync(@"SECURITY_CODE_SOFT_LIMIT_TITLE");
          v45 = PS_LocalizedStringForKeychainSync(@"SECURITY_CODE_SOFT_LIMIT_MESSAGE");
          id v8 = [v43 alertControllerWithTitle:v44 message:v45 preferredStyle:1];

          v46 = (void *)MEMORY[0x1E4F42720];
          v47 = PS_LocalizedStringForKeychainSync(@"CONTACT_APPLE_SUPPORT");
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_4;
          v58[3] = &unk_1E5C5DAE8;
          v58[4] = *(void *)(a1 + 40);
          int v48 = [v46 actionWithTitle:v47 style:0 handler:v58];
          [v8 addAction:v48];

          v49 = (void *)MEMORY[0x1E4F42720];
          id v30 = PS_LocalizedStringForKeychainSync(@"SET_UP_LATER");
          v57[0] = MEMORY[0x1E4F143A8];
          v57[1] = 3221225472;
          v57[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_5;
          v57[3] = &unk_1E5C5DAE8;
          v57[4] = *(void *)(a1 + 40);
          id v31 = v57;
          uint64_t v32 = v49;
          id v33 = v30;
          uint64_t v34 = 0;
          goto LABEL_29;
        case 14:
LABEL_13:
          if (*(unsigned char *)(a1 + 56)) {
            id v18 = @"SECURITY_CODE_HARD_LIMIT_MESSAGE_WITH_APPROVAL";
          }
          else {
            id v18 = @"SECURITY_CODE_HARD_LIMIT_MESSAGE";
          }
          id v8 = PS_LocalizedStringForKeychainSync(v18);
          char v10 = PS_LocalizedStringForKeychainSync(@"SECURITY_CODE_HARD_LIMIT_TITLE");
          int v19 = *(unsigned __int8 *)(a1 + 56);
          id v11 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v10 message:v8 preferredStyle:1];
          uint64_t v20 = (void *)MEMORY[0x1E4F42720];
          if (v19)
          {
            uint64_t v21 = PS_LocalizedStringForKeychainSync(@"APPROVE_FROM_OTHER_DEVICE");
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_6;
            v56[3] = &unk_1E5C5DAE8;
            v56[4] = *(void *)(a1 + 40);
            id v22 = [v20 actionWithTitle:v21 style:0 handler:v56];
            [v11 addAction:v22];

            id v23 = (void *)MEMORY[0x1E4F42720];
            BOOL v24 = PS_LocalizedStringForKeychainSync(@"RESET_ICLOUD_KEYCHAIN");
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_7;
            v55[3] = &unk_1E5C5DAE8;
            v55[4] = *(void *)(a1 + 40);
            uint64_t v25 = v55;
          }
          else
          {
            uint64_t v35 = PS_LocalizedStringForKeychainSync(@"CANCEL");
            v54[0] = MEMORY[0x1E4F143A8];
            v54[1] = 3221225472;
            v54[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_8;
            v54[3] = &unk_1E5C5DAE8;
            v54[4] = *(void *)(a1 + 40);
            uint64_t v36 = [v20 actionWithTitle:v35 style:1 handler:v54];
            [v11 addAction:v36];

            id v23 = (void *)MEMORY[0x1E4F42720];
            BOOL v24 = PS_LocalizedStringForKeychainSync(@"RESET_ICLOUD_KEYCHAIN");
            v53[0] = MEMORY[0x1E4F143A8];
            v53[1] = 3221225472;
            v53[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_9;
            v53[3] = &unk_1E5C5DAE8;
            v53[4] = *(void *)(a1 + 40);
            uint64_t v25 = v53;
          }
          uint64_t v37 = [v23 actionWithTitle:v24 style:0 handler:v25];
          [v11 addAction:v37];

LABEL_23:
          [*(id *)(a1 + 40) showAlert:v11];

          goto LABEL_24;
        case 19:
          if ([*(id *)(*(void *)(a1 + 40) + 56) securityCodeType] != 2) {
            goto LABEL_20;
          }
          id v26 = (void *)MEMORY[0x1E4F42728];
          uint64_t v27 = PS_LocalizedStringForKeychainSync(@"INCORRECT_SECURITY_CODE");
          uint64_t v28 = PS_LocalizedStringForKeychainSync(@"ENTER_SECURITY_CODE_AGAIN");
          id v8 = [v26 alertControllerWithTitle:v27 message:v28 preferredStyle:1];

          int v29 = (void *)MEMORY[0x1E4F42720];
          id v30 = PS_LocalizedStringForKeychainSync(@"OK");
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_10;
          v52[3] = &unk_1E5C5DAE8;
          v52[4] = *(void *)(a1 + 40);
          id v31 = v52;
          uint64_t v32 = v29;
          id v33 = v30;
          uint64_t v34 = 1;
LABEL_29:
          v50 = [v32 actionWithTitle:v33 style:v34 handler:v31];
          [v8 addAction:v50];

          [*(id *)(a1 + 40) showAlert:v8];
LABEL_24:

          break;
        default:
          goto LABEL_20;
      }
    }
    else
    {
LABEL_20:
      [*(id *)(a1 + 40) _showGenericFlowErrorAlert];
    }
    [*(id *)(*(void *)(a1 + 40) + 56) setTextEntryText:&stru_1EFB51FD0];
    uint64_t v38 = [*(id *)(a1 + 40) navigationController];
    uint64_t v39 = [v38 topViewController];
    v40 = *(void **)(*(void *)(a1 + 40) + 56);

    if (v39 != v40)
    {
      id v41 = [*(id *)(a1 + 40) navigationController];
      id v42 = (id)[v41 popToViewController:*(void *)(*(void *)(a1 + 40) + 56) animated:1];
    }
  }
  else
  {
    [v2 _startCircleJoinAfterRecoveryTimer];
    id v15 = *(void **)(a1 + 40);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_11;
    v51[3] = &unk_1E5C5E728;
    v51[4] = v15;
    [v15 joinCircleAfterRecovery:1 withCompletion:v51];
  }
}

void __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) navigationController];
  id v2 = (id)[v3 popToViewController:*(void *)(*(void *)(a1 + 32) + 56) animated:1];
}

uint64_t __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) showContactAppleSupportPane];
}

uint64_t __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedWithStatus:1 error:0];
}

uint64_t __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _peerApprovalFromRecoveryFlow];
}

uint64_t __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetFromRecoveryFlow];
}

uint64_t __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedWithStatus:1 error:0];
}

uint64_t __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetFromRecoveryFlow];
}

void __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_10(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) navigationController];
  id v2 = (id)[v3 popToViewController:*(void *)(*(void *)(a1 + 32) + 56) animated:1];
}

void __67__PSKeychainSyncManager__recoverWithSecurityCode_verificationCode___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) _stopCircleJoinAfterRecoveryTimer];
  [*(id *)(a1 + 32) stopNavigationSpinner];
  if (a2 != 2) {
    NSLog(&cfstr_FailedToJoinCi.isa, a2, v5);
  }
  [*(id *)(a1 + 32) _finishedWithStatus:a2 error:v5];
}

- (void)_circleJoinAfterRecoveryTimerFired:(id)a3
{
  id v10 = 0;
  uint64_t Status = PSKeychainSyncGetStatus(&v10);
  id v5 = v10;
  NSLog(&cfstr_CircleJoinAfte.isa, Status);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__PSKeychainSyncManager__circleJoinAfterRecoveryTimerFired___block_invoke;
  v7[3] = &unk_1E5C5ECC8;
  int v9 = Status;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PSKeychainSyncManager *)self _showGenericFlowErrorAlertWithDismissalHandler:v7];
}

uint64_t __60__PSKeychainSyncManager__circleJoinAfterRecoveryTimerFired___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 176);
  if (result)
  {
    (*(void (**)(uint64_t, void, void))(result + 16))(result, *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
    id v3 = *(void **)(a1 + 32);
    return [v3 setCircleJoinCompletion:0];
  }
  return result;
}

- (void)_startCircleJoinAfterRecoveryTimer
{
  [(NSTimer *)self->_joinAfterRecoveryTimeoutTimer invalidate];
  id v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__circleJoinAfterRecoveryTimerFired_ selector:0 userInfo:0 repeats:15.0];
  joinAfterRecoveryTimeoutTimer = self->_joinAfterRecoveryTimeoutTimer;
  self->_joinAfterRecoveryTimeoutTimer = v3;
  MEMORY[0x1F41817F8](v3, joinAfterRecoveryTimeoutTimer);
}

- (void)_stopCircleJoinAfterRecoveryTimer
{
  [(NSTimer *)self->_joinAfterRecoveryTimeoutTimer invalidate];
  joinAfterRecoveryTimeoutTimer = self->_joinAfterRecoveryTimeoutTimer;
  self->_joinAfterRecoveryTimeoutTimer = 0;
}

- (void)handleCircleChangedNotification
{
  if (self->_joiningCircle)
  {
    uint64_t v3 = SOSCCThisDeviceIsInCircle();
    if (v3)
    {
      if (v3 == 2)
      {
        uint64_t v7 = 3;
      }
      else
      {
        if (v3 == 1)
        {
          if (self->_joiningCircleAfterRecovery) {
            SOSCCRequestToJoinCircleAfterRestore();
          }
          else {
            SOSCCRequestToJoinCircle();
          }
          [(PSKeychainSyncManager *)self _defaultKeychainViewSet];
          [MEMORY[0x1E4F1CAD0] set];
          SOSCCViewSet();

          goto LABEL_21;
        }
        NSLog(&cfstr_StatusNoLonger.isa, v3);
        NSLog(&cfstr_FailedRequestT.isa, 0);
        uint64_t v7 = 1;
      }
    }
    else
    {
      uint64_t v7 = 2;
    }
    circleJoinCompletion = (void (**)(id, uint64_t, void))self->_circleJoinCompletion;
    if (circleJoinCompletion) {
      circleJoinCompletion[2](circleJoinCompletion, v7, 0);
    }
    [(PSKeychainSyncManager *)self setCircleJoinCompletion:0];
    self->_joiningCircle = 0;
    goto LABEL_21;
  }
  if (self->_flow != 4) {
    return;
  }
  if (!SOSCCThisDeviceIsInCircle())
  {
    id v4 = [(PSKeychainSyncManager *)self viewControllerForPresentingAlerts];
    id v5 = [v4 presentedViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(PSKeychainSyncManager *)self navigationController];
      [v6 dismissViewControllerAnimated:1 completion:0];
    }
    [(PSKeychainSyncSecurityCodeController *)self->_securityCodeRecoveryController dismissAlerts];
    [(KeychainSyncSMSVerificationController *)self->_smsValidationController dismissAlerts];
    [(PSKeychainSyncManager *)self _finishedWithStatus:0 error:0];
  }
LABEL_21:
}

- (void)_callCompletionWithStatus:(int)a3 error:(id)a4
{
  id completion = self->_completion;
  if (completion)
  {
    id v6 = a4;
    id v9 = (id)MEMORY[0x1AD0BE2A0](completion);
    (*((void (**)(void))self->_completion + 2))();

    id v7 = (id)MEMORY[0x1AD0BE2A0](self->_completion);
    id v8 = v9;
    if (v7 == v9)
    {
      [(PSKeychainSyncManager *)self setCompletion:0];
      id v8 = v9;
    }
  }
}

- (void)_finishedWithStatus:(int)a3 error:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__PSKeychainSyncManager__finishedWithStatus_error___block_invoke;
  v13[3] = &unk_1E5C5ECC8;
  void v13[4] = self;
  int v15 = a3;
  id v7 = v6;
  id v14 = v7;
  id v8 = (void (**)(void))MEMORY[0x1AD0BE2A0](v13);
  if (![(PSKeychainSyncManager *)self isRunningInBuddy]) {
    goto LABEL_6;
  }
  id v9 = [v7 domain];
  if (([v9 isEqualToString:@"com.apple.Preferences.KeychainSync"] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v10 = [v7 code];

  if (v10 != 5)
  {
LABEL_6:
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__PSKeychainSyncManager__finishedWithStatus_error___block_invoke_2;
    v11[3] = &unk_1E5C5ECF0;
    v11[4] = self;
    uint64_t v12 = v8;
    [(PSKeychainSyncManager *)self showResetAcknowledgementIfNeededWithCompletion:v11];

    goto LABEL_7;
  }
  v8[2](v8);
LABEL_7:
}

uint64_t __51__PSKeychainSyncManager__finishedWithStatus_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanup];
  *(_DWORD *)(*(void *)(a1 + 32) + 16) = 0;
  uint64_t v2 = *(unsigned int *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 _callCompletionWithStatus:v2 error:v4];
}

uint64_t __51__PSKeychainSyncManager__finishedWithStatus_error___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isRunningInBuddy] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 200) rootController];
    [v2 dismissViewControllerAnimated:1 completion:0];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)_preSetupCancelledWithCurrentStatus
{
  [(PSKeychainSyncManager *)self _cleanup];
  int flow = self->_flow;
  if (flow == 5)
  {
    if (self->_resetCompletion)
    {
      uint64_t v4 = (void *)MEMORY[0x1AD0BE2A0]();
      resetCompletion = (void (**)(id, void, void *))self->_resetCompletion;
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:2 userInfo:0];
      resetCompletion[2](resetCompletion, 0, v9);

      uint64_t v10 = (void *)MEMORY[0x1AD0BE2A0](self->_resetCompletion);
      if (v10 == v4) {
        [(PSKeychainSyncManager *)self setResetCompletion:0];
      }
      goto LABEL_10;
    }
  }
  else
  {
    if (flow != 3)
    {
      uint64_t Status = PSKeychainSyncGetStatus(0);
      uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:2 userInfo:0];
      [(PSKeychainSyncManager *)self _callCompletionWithStatus:Status error:v4];
LABEL_10:

      goto LABEL_11;
    }
    if (self->_changeSecurityCodeCompletion)
    {
      uint64_t v4 = (void *)MEMORY[0x1AD0BE2A0]();
      id changeSecurityCodeCompletion = self->_changeSecurityCodeCompletion;
      id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Preferences.KeychainSync" code:2 userInfo:0];
      (*((void (**)(id, void, void, uint64_t, void *))changeSecurityCodeCompletion + 2))(changeSecurityCodeCompletion, 0, 0, 0xFFFFFFFFLL, v6);

      id v7 = (void *)MEMORY[0x1AD0BE2A0](self->_changeSecurityCodeCompletion);
      if (v7 == v4) {
        [(PSKeychainSyncManager *)self setChangeSecurityCodeCompletion:0];
      }
      goto LABEL_10;
    }
  }
LABEL_11:
  [(PSKeychainSyncManager *)self setCircleWasReset:0];
  self->_int flow = 0;
}

- (void)keychainSyncControllerCancel:(id)a3
{
  if (![(PSKeychainSyncManager *)self isRunningInBuddy])
  {
    uint64_t v4 = [(PSRootController *)self->_settingsSetupController rootController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
  [(PSKeychainSyncManager *)self _preSetupCancelledWithCurrentStatus];
}

- (void)_autoVetSMSValidationWithToken:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(PSKeychainSyncManager *)self navigationController];
  id v5 = [v4 topViewController];
  smsValidationController = self->_smsValidationController;

  if (v5 == smsValidationController)
  {
    NSLog(&cfstr_AutoVettingKey.isa, v7);
    [(PSKeychainSyncTextEntryController *)self->_smsValidationController setTextEntryText:v7];
  }
  PSHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier();
}

- (void)keychainSyncController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8 = (PSKeychainSyncSecurityCodeController *)a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  if (self->_securityCodeRecoveryController == v8)
  {
    if (@"usePeerApproval" == v9)
    {
      [(PSKeychainSyncManager *)self _peerApprovalFromRecoveryFlow];
      goto LABEL_70;
    }
    if (@"resetKeychain" == v9)
    {
      [(PSKeychainSyncManager *)self _resetFromRecoveryFlow];
      goto LABEL_70;
    }
    if (@"setUpLater" == v9)
    {
LABEL_29:
      [(PSKeychainSyncManager *)self _finishedWithStatus:1 error:0];
      goto LABEL_70;
    }
    id v11 = v9;
    uint64_t v12 = [(__CFString *)v11 objectForKey:@"securityCode"];
    [(PSKeychainSyncManager *)self setSecurityCodeRecoveryAttempt:v12];

    [(PSKeychainSyncManager *)self startNavigationSpinnerInViewController:self->_securityCodeRecoveryController];
    id v13 = objc_alloc_init((Class)getSecureBackupClass_0());
    id v90 = 0;
    id v14 = [v13 getAccountInfoWithInfo:0 results:&v90];
    id v15 = v90;
    if (v14)
    {
      [(PSKeychainSyncManager *)self stopNavigationSpinner];
      NSLog(&cfstr_ErrorLoadingAc_0.isa, v14);
      [(PSKeychainSyncManager *)self _showGenericFlowErrorAlert];
LABEL_67:

      goto LABEL_68;
    }
    v76 = v11;
    uint64_t v96 = 0;
    v97 = &v96;
    uint64_t v98 = 0x2020000000;
    v43 = (void *)getkSecureBackupAccountIsHighSecurityKeySymbolLoc_ptr;
    uint64_t v99 = getkSecureBackupAccountIsHighSecurityKeySymbolLoc_ptr;
    if (!getkSecureBackupAccountIsHighSecurityKeySymbolLoc_ptr)
    {
      id location = (id)MEMORY[0x1E4F143A8];
      uint64_t v92 = 3221225472;
      v93 = __getkSecureBackupAccountIsHighSecurityKeySymbolLoc_block_invoke;
      v94 = &unk_1E5C5D4D8;
      v95 = &v96;
      v44 = (void *)CloudServicesLibrary_1();
      v45 = dlsym(v44, "kSecureBackupAccountIsHighSecurityKey");
      *(void *)(v95[1] + 24) = v45;
      getkSecureBackupAccountIsHighSecurityKeySymbolLoc_ptr = *(void *)(v95[1] + 24);
      v43 = (void *)v97[3];
    }
    p_cb = (uint32_t *)&v96;
    _Block_object_dispose(&v96, 8);
    if (v43)
    {
      v47 = [v15 objectForKey:*v43];
      char v48 = [v47 BOOLValue];

      uint64_t v96 = 0;
      v97 = &v96;
      uint64_t v98 = 0x2020000000;
      p_cb = &OBJC_PROTOCOL___PINEntryView.cb;
      v49 = (void *)getkSecureBackupRecoveryRequiresVerificationTokenKeySymbolLoc_ptr;
      uint64_t v99 = getkSecureBackupRecoveryRequiresVerificationTokenKeySymbolLoc_ptr;
      if (!getkSecureBackupRecoveryRequiresVerificationTokenKeySymbolLoc_ptr)
      {
        id location = (id)MEMORY[0x1E4F143A8];
        uint64_t v92 = 3221225472;
        v93 = __getkSecureBackupRecoveryRequiresVerificationTokenKeySymbolLoc_block_invoke;
        v94 = &unk_1E5C5D4D8;
        v95 = &v96;
        v50 = (void *)CloudServicesLibrary_1();
        v51 = dlsym(v50, "kSecureBackupRecoveryRequiresVerificationTokenKey");
        *(void *)(v95[1] + 24) = v51;
        getkSecureBackupRecoveryRequiresVerificationTokenKeySymbolLoc_ptr = *(void *)(v95[1] + 24);
        v49 = (void *)v97[3];
      }
      char v74 = v48;
      _Block_object_dispose(&v96, 8);
      if (v49)
      {
        v52 = [v15 objectForKey:*v49];
        int v72 = [v52 BOOLValue];

        v53 = getkSecureBackupSMSTargetInfoKey();
        v77 = v15;
        v54 = [v15 objectForKey:v53];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v55 = getkSecureBackupSMSTargetPhoneNumberKey();
          v56 = [v54 objectForKey:v55];

          v57 = getkSecureBackupCountryDialCodeKey();
          uint64_t v71 = [v54 objectForKey:v57];

          v58 = getkSecureBackupCountryCodeKey_0();
          v59 = [v54 objectForKey:v58];

          if (![v59 length])
          {
            v70 = getkSecureBackupMetadataKey_0();
            id v68 = [v77 objectForKey:v70];
            v60 = getkSecureBackupCountryCodeKey_0();
            uint64_t v69 = objc_msgSend(v68, "objectForKey:");

            v59 = (void *)v69;
          }
          v61 = (void *)v71;
        }
        else
        {
          v59 = 0;
          v61 = 0;
          v56 = 0;
        }
        if ((v74 & 1) == 0)
        {
          int v62 = v72;
          if (!v56) {
            int v62 = 0;
          }
          if (v62 == 1 && v61)
          {
            v73 = v56;
            [getFTDeviceSupportClass() sharedInstance];
            id v75 = v13;
            v63 = v54;
            v65 = v64 = v61;
            int v66 = [v65 isTelephonyDevice];

            v61 = v64;
            v54 = v63;
            id v13 = v75;
            if (v66 && [(PSKeychainSyncManager *)self isRunningInBuddy])
            {
              objc_initWeak(&location, self);
              v88[0] = MEMORY[0x1E4F143A8];
              v88[1] = 3221225472;
              v88[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke;
              v88[3] = &unk_1E5C5ED18;
              objc_copyWeak(&v89, &location);
              PSHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier(v88);
              objc_destroyWeak(&v89);
              objc_destroyWeak(&location);
            }
            v84[0] = MEMORY[0x1E4F143A8];
            v84[1] = 3221225472;
            v84[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_3;
            v84[3] = &unk_1E5C5ED68;
            v84[4] = self;
            id v85 = v59;
            id v86 = v61;
            v56 = v73;
            id v87 = v73;
            [v75 startSMSChallengeWithInfo:0 completionBlockWithResults:v84];

            goto LABEL_66;
          }
          if (v72 && (!v56 || !v61)) {
            NSLog(&cfstr_RequiresVerifi.isa);
          }
        }
        [(PSKeychainSyncManager *)self stopNavigationSpinner];
        [(PSKeychainSyncManager *)self _recoverWithSecurityCode:self->_securityCodeRecoveryAttempt verificationCode:0];
LABEL_66:

        id v11 = v76;
        id v15 = v77;
        goto LABEL_67;
      }
    }
    else
    {
      -[PSContactsAuthorizationLevelController dealloc]();
    }
    id v67 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    objc_destroyWeak((id *)p_cb);
    objc_destroyWeak(&location);
    _Unwind_Resume(v67);
  }
  if ((PSKeychainSyncSecurityCodeController *)self->_advancedSecurityCodeChoiceController == v8)
  {
    int v19 = [(__CFString *)v9 intValue];
    if (v19 == 3)
    {
      uint64_t v20 = [(PSKeychainSyncManager *)self navigationController];
      uint64_t v21 = [v20 topViewController];
      [(PSKeychainSyncManager *)self startNavigationSpinnerInViewController:v21];

      id v11 = (__CFString *)objc_alloc_init((Class)getSecureBackupClass_0());
      [(__CFString *)v11 disableWithInfo:0 completionBlock:&__block_literal_global_16];
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_7;
      v83[3] = &unk_1E5C5E728;
      v83[4] = self;
      [(PSKeychainSyncManager *)self joinCircleWithCompletion:v83];
      goto LABEL_69;
    }
    int v22 = v19;
    id v23 = objc_alloc_init(PSKeychainSyncSecurityCodeController);
    complexSecurityCodeController = self->_complexSecurityCodeController;
    self->_complexSecurityCodeController = v23;

    [(PSKeychainSyncViewController *)self->_complexSecurityCodeController setDelegate:self];
    [(PSKeychainSyncSecurityCodeController *)self->_complexSecurityCodeController setMode:1];
    if (v22 == 1) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = 2;
    }
    [(PSKeychainSyncSecurityCodeController *)self->_complexSecurityCodeController setSecurityCodeType:v25];
    id v26 = self->_complexSecurityCodeController;
    goto LABEL_36;
  }
  if (self->_simpleSecurityCodeController == v8 || self->_complexSecurityCodeController == v8)
  {
    if (@"advancedOptions" != v9)
    {
      id v11 = [(__CFString *)v9 objectForKey:@"securityCodeType"];
      uint64_t v16 = [(__CFString *)v11 intValue];
      char v17 = [(__CFString *)v9 objectForKey:@"securityCode"];
      [(PSKeychainSyncManager *)self setStagedSecurityCode:v17 type:v16];

      if (self->_flow == 3)
      {
        [(PSKeychainSyncManager *)self startNavigationSpinnerInViewController:v8];
        id v18 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_8;
        block[3] = &unk_1E5C5ECC8;
        int v82 = v16;
        void block[4] = self;
        v81 = v8;
        dispatch_async(v18, block);
      }
      else if (v16 == 2)
      {
        [(PSKeychainSyncManager *)self joinCircleAndEnableSecureBackupWithPhoneNumber:0 countryInfo:0];
      }
      else
      {
        phoneNumberController = self->_phoneNumberController;
        if (!phoneNumberController)
        {
          id v41 = objc_alloc_init(KeychainSyncPhoneNumberController);
          id v42 = self->_phoneNumberController;
          self->_phoneNumberController = v41;

          phoneNumberController = self->_phoneNumberController;
        }
        [(PSKeychainSyncManager *)self showController:phoneNumberController];
      }
      goto LABEL_69;
    }
    uint64_t v27 = objc_alloc_init(KeychainSyncAdvancedSecurityCodeController);
    advancedSecurityCodeChoiceController = self->_advancedSecurityCodeChoiceController;
    self->_advancedSecurityCodeChoiceController = v27;

    [(PSKeychainSyncViewController *)self->_advancedSecurityCodeChoiceController setDelegate:self];
    [(KeychainSyncAdvancedSecurityCodeController *)self->_advancedSecurityCodeChoiceController setShowsDisableRecoveryOption:self->_flow == 1];
    id v26 = self->_advancedSecurityCodeChoiceController;
LABEL_36:
    [(PSKeychainSyncManager *)self showController:v26];
    goto LABEL_70;
  }
  if ((PSKeychainSyncSecurityCodeController *)self->_devicePinController == v8)
  {
    LOBYTE(location) = 0;
    PSIsUsingPasscode((BOOL *)&location);
    [(PSKeychainSyncManager *)self setStagedSecurityCode:v9 type:(_BYTE)location == 0];
    if (!self->_phoneNumberController)
    {
      int v29 = objc_alloc_init(KeychainSyncPhoneNumberController);
      id v30 = self->_phoneNumberController;
      self->_phoneNumberController = v29;
    }
    if (![(PSKeychainSyncManager *)self isRunningInBuddy])
    {
      [(PSKeychainSyncManager *)self stagedSecurityCode];
      if (SecPasswordIsPasswordWeak2())
      {
        NSLog(&cfstr_DevicePinIsToo.isa);
        id v31 = (void *)MEMORY[0x1E4F42728];
        uint64_t v32 = PS_LocalizedStringForKeychainSync(@"DEVICE_PASSCODE_TOO_WEAK");
        id v33 = PS_LocalizedStringForKeychainSync(@"DEVICE_PASSCODE_TOO_WEAK_DETAILS");
        id v11 = [v31 alertControllerWithTitle:v32 message:v33 preferredStyle:1];

        uint64_t v34 = (void *)MEMORY[0x1E4F42720];
        uint64_t v35 = PS_LocalizedStringForKeychainSync(@"CANCEL");
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_11;
        v79[3] = &unk_1E5C5DAE8;
        v79[4] = self;
        uint64_t v36 = [v34 actionWithTitle:v35 style:1 handler:v79];
        [(__CFString *)v11 addAction:v36];

        uint64_t v37 = (void *)MEMORY[0x1E4F42720];
        uint64_t v38 = PS_LocalizedStringForKeychainSync(@"USE_CODE");
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_12;
        v78[3] = &unk_1E5C5DAE8;
        v78[4] = self;
        uint64_t v39 = [v37 actionWithTitle:v38 style:0 handler:v78];
        [(__CFString *)v11 addAction:v39];

        [(PSKeychainSyncManager *)self showAlert:v11];
        goto LABEL_69;
      }
    }
    id v26 = self->_phoneNumberController;
    goto LABEL_36;
  }
  if ((PSKeychainSyncSecurityCodeController *)self->_phoneNumberController == v8)
  {
    id v11 = [(__CFString *)v9 objectForKey:@"phoneNumber"];
    id v13 = [(__CFString *)v9 objectForKey:@"countryInfo"];
    [(PSKeychainSyncManager *)self keychainSyncPhoneNumberController:v8 didCompleteWithPhoneNumber:v11 countryInfo:v13];
LABEL_68:

    goto LABEL_69;
  }
  if ((PSKeychainSyncSecurityCodeController *)self->_smsValidationController == v8)
  {
    if (v9)
    {
      id v11 = [(PSKeychainSyncManager *)self securityCodeRecoveryAttempt];
      [(PSKeychainSyncManager *)self _recoverWithSecurityCode:v11 verificationCode:v9];
LABEL_69:

      goto LABEL_70;
    }
    goto LABEL_29;
  }
LABEL_70:
}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_2;
  v8[3] = &unk_1E5C5D7C8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(&v10);
}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _autoVetSMSValidationWithToken:*(void *)(a1 + 32)];
}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_4;
  v10[3] = &unk_1E5C5ED40;
  id v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = v7;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v15 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) stopNavigationSpinner];
  uint64_t v2 = [*(id *)(a1 + 40) domain];
  uint64_t v3 = getkSecureBackupErrorDomain();
  if ([v2 isEqualToString:v3])
  {
    if ([*(id *)(a1 + 40) code] == 28)
    {

LABEL_10:
      id v6 = +[KeychainSyncCountryInfo countryInfoForCountryCode:*(void *)(a1 + 48) dialingPrefix:*(void *)(a1 + 56)];
      id v7 = +[PSKeychainSyncPhoneNumber phoneNumberWithDigits:*(void *)(a1 + 64) countryInfo:v6];
      NSLog(&cfstr_ErrorSendingSm.isa, *(void *)(a1 + 40));
      id v8 = NSString;
      id v9 = PS_LocalizedStringForKeychainSync(@"SMS_RETRY_LIMIT_REACHED");
      id v10 = [v7 formattedAndObfuscatedString];
      id v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);

      id v12 = (void *)MEMORY[0x1E4F42728];
      id v13 = PS_LocalizedStringForKeychainSync(@"TRY_SETTING_UP_LATER");
      id v14 = [v12 alertControllerWithTitle:v11 message:v13 preferredStyle:1];

      id v15 = (void *)MEMORY[0x1E4F42720];
      uint64_t v16 = PS_LocalizedStringForKeychainSync(@"OK");
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_5;
      v26[3] = &unk_1E5C5DAE8;
      void v26[4] = *(void *)(a1 + 32);
      char v17 = [v15 actionWithTitle:v16 style:0 handler:v26];
      [v14 addAction:v17];

      [*(id *)(a1 + 32) showAlert:v14];
LABEL_18:

      return;
    }
    uint64_t v5 = [*(id *)(a1 + 40) code];

    if (v5 == 27) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (!*(void *)(a1 + 40))
  {
    id v18 = *(void **)(a1 + 72);
    uint64_t v28 = 0;
    int v29 = &v28;
    uint64_t v30 = 0x2020000000;
    int v19 = (void *)getkSecureBackupRecoveryVerificationTokenLengthKeySymbolLoc_ptr;
    uint64_t v31 = getkSecureBackupRecoveryVerificationTokenLengthKeySymbolLoc_ptr;
    if (!getkSecureBackupRecoveryVerificationTokenLengthKeySymbolLoc_ptr)
    {
      v26[5] = MEMORY[0x1E4F143A8];
      v26[6] = 3221225472;
      v26[7] = __getkSecureBackupRecoveryVerificationTokenLengthKeySymbolLoc_block_invoke;
      v26[8] = &unk_1E5C5D4D8;
      uint64_t v27 = &v28;
      uint64_t v20 = (void *)CloudServicesLibrary_1();
      v29[3] = (uint64_t)dlsym(v20, "kSecureBackupRecoveryVerificationTokenLengthKey");
      getkSecureBackupRecoveryVerificationTokenLengthKeySymbolLoc_ptr = *(void *)(v27[1] + 24);
      int v19 = (void *)v29[3];
    }
    _Block_object_dispose(&v28, 8);
    if (!v19)
    {
      uint64_t v25 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
      _Block_object_dispose(&v28, 8);
      _Unwind_Resume(v25);
    }
    id v6 = [v18 objectForKey:*v19];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v21 = [v6 unsignedIntegerValue];
    }
    else {
      uint64_t v21 = 0;
    }
    int v22 = objc_alloc_init(KeychainSyncSMSVerificationController);
    uint64_t v23 = *(void *)(a1 + 32);
    BOOL v24 = *(void **)(v23 + 72);
    *(void *)(v23 + 72) = v22;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setKeychainSyncManager:");
    [*(id *)(*(void *)(a1 + 32) + 72) setPhoneNumber:*(void *)(a1 + 64)];
    [*(id *)(*(void *)(a1 + 32) + 72) setDialingPrefix:*(void *)(a1 + 56)];
    [*(id *)(*(void *)(a1 + 32) + 72) setCountryCode:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 72) setNumberOfPasscodeFields:v21];
    [*(id *)(a1 + 32) showController:*(void *)(*(void *)(a1 + 32) + 72)];
    goto LABEL_18;
  }
  NSLog(&cfstr_ErrorSendingSm.isa, *(void *)(a1 + 40));
  [*(id *)(a1 + 32) _showGenericFlowErrorAlert];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 56);
  [v4 setTextEntryText:&stru_1EFB51FD0];
}

uint64_t __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) setTextEntryText:&stru_1EFB51FD0];
}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 stopNavigationSpinner];
  [*(id *)(a1 + 32) _finishedWithStatus:a2 error:v6];
}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_8(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48) == 2)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = objc_alloc_init((Class)getSecureBackupClass_0());
    id v19 = 0;
    id v5 = (id)[v4 getAccountInfoWithInfo:0 results:&v19];
    id v6 = v19;
    id v7 = getkSecureBackupSMSTargetInfoKey();
    id v8 = [v6 objectForKey:v7];

    objc_opt_class();
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    if (objc_opt_isKindOfClass())
    {
      id v9 = getkSecureBackupSMSTargetPhoneNumberKey();
      uint64_t v3 = [v8 objectForKey:v9];

      id v10 = getkSecureBackupCountryDialCodeKey();
      uint64_t v2 = [v8 objectForKey:v10];
    }
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_9;
  v14[3] = &unk_1E5C5EDB8;
  int v18 = *(_DWORD *)(a1 + 48);
  id v11 = *(void **)(a1 + 40);
  void v14[4] = *(void *)(a1 + 32);
  id v15 = v3;
  id v16 = v2;
  id v17 = v11;
  id v12 = v2;
  id v13 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_9(uint64_t a1)
{
  [*(id *)(a1 + 32) stopNavigationSpinner];
  int v2 = *(_DWORD *)(a1 + 64);
  if (v2 == 2) {
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 40) length] && objc_msgSend(*(id *)(a1 + 48), "length"))
  {
    int v2 = *(_DWORD *)(a1 + 64);
LABEL_5:
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = *(void **)(a1 + 56);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_10;
    v10[3] = &unk_1E5C5ED90;
    v10[4] = v3;
    int v12 = v2;
    id v11 = v4;
    [v3 promptForPasswordIfCredentialsNotCachedOverController:v11 withCompletion:v10];

    return;
  }
  id v5 = objc_alloc_init(KeychainSyncPhoneNumberController);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v5;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setDelegate:");
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = v8[8];
  [v8 showController:v9];
}

void __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_10(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (a2)
  {
    [*(id *)(a1 + 32) _changeToNewSecurityCode:*(void *)(*(void *)(a1 + 32) + 224) type:*(unsigned int *)(a1 + 48) smsTarget:0 smsTargetCountryInfo:0];
    goto LABEL_9;
  }
  uint64_t v6 = [v5 domain];
  if ([v6 isEqualToString:@"com.apple.Preferences.KeychainSync"]
    && [v9 code] == 1)
  {
  }
  else
  {
    int v7 = *(_DWORD *)(a1 + 48);

    if (v7)
    {
      [*(id *)(a1 + 40) reloadSpecifiers];
      [*(id *)(a1 + 40) becomeFirstResponder];
      goto LABEL_9;
    }
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 200) rootController];
  [v8 dismissViewControllerAnimated:1 completion:0];

  *(_DWORD *)(*(void *)(a1 + 32) + 16) = 0;
LABEL_9:
}

uint64_t __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedWithStatus:1 error:0];
}

uint64_t __74__PSKeychainSyncManager_keychainSyncController_didFinishWithResult_error___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) showController:*(void *)(*(void *)(a1 + 32) + 64)];
}

- (void)_enableSecureBackupWithPhoneNumber:(id)a3 countryInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = getkSecureBackupMetadataKey_0();
  id v11 = [v9 dictionaryWithObject:v8 forKey:v10];

  if (v7)
  {
    int v12 = [v7 countryCode];
    id v13 = getkSecureBackupCountryCodeKey_0();
    [v8 setObject:v12 forKey:v13];
  }
  if ([(PSKeychainSyncManager *)self isRunningInBuddy]
    && ([(PSKeychainSyncManager *)self stagedSecurityCode],
        id v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 length],
        v14,
        !v15))
  {
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2020000000;
    uint64_t v28 = (void *)getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr;
    uint64_t v72 = getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr;
    if (!getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v65 = 3221225472;
      int v66 = __getkSecureBackupUseCachedPassphraseKeySymbolLoc_block_invoke;
      id v67 = &unk_1E5C5D4D8;
      id v68 = &v69;
      int v29 = (void *)CloudServicesLibrary_1();
      v70[3] = (uint64_t)dlsym(v29, "kSecureBackupUseCachedPassphraseKey");
      getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr = *(void *)(v68[1] + 24);
      uint64_t v28 = (void *)v70[3];
    }
    _Block_object_dispose(&v69, 8);
    if (!v28)
    {
      v57 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
      _Block_object_dispose(&v69, 8);
      _Unwind_Resume(v57);
    }
    [v11 setObject:MEMORY[0x1E4F1CC38] forKey:*v28];
    LOBYTE(v69) = 0;
    PSIsUsingPasscode((BOOL *)&v69);
    uint64_t v30 = [MEMORY[0x1E4F28ED0] numberWithInt:(_BYTE)v69 == 0];
    uint64_t v31 = getkSecureBackupUsesComplexPassphraseKey();
    [v8 setObject:v30 forKey:v31];

    uint64_t v32 = [MEMORY[0x1E4F28ED0] numberWithInt:v69];
    id v33 = getkSecureBackupUsesNumericPassphraseKey();
    [v8 setObject:v32 forKey:v33];

    if ((_BYTE)v69)
    {
      *(_DWORD *)buf = -1;
      uint64_t v34 = [MEMORY[0x1E4F74230] sharedConnection];
      [v34 unlockScreenTypeWithOutSimplePasscodeType:buf];

      if (*(_DWORD *)buf) {
        uint64_t v35 = 6;
      }
      else {
        uint64_t v35 = 4;
      }
      uint64_t v36 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v35];
      uint64_t v37 = getkSecureBackupNumericPassphraseLengthKey();
      [v8 setObject:v36 forKey:v37];
    }
  }
  else
  {
    id v16 = [(PSKeychainSyncManager *)self stagedSecurityCode];
    id v17 = getkSecureBackupPassphraseKey();
    [v11 setObject:v16 forKey:v17];

    int v18 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_stagedSecurityCodeType == 2];
    id v19 = getkSecureBackupUsesRandomPassphraseKey();
    [v11 setObject:v18 forKey:v19];

    uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_stagedSecurityCodeType != 0];
    uint64_t v21 = getkSecureBackupUsesComplexPassphraseKey();
    [v8 setObject:v20 forKey:v21];

    int v22 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_stagedSecurityCodeType == 0];
    uint64_t v23 = getkSecureBackupUsesNumericPassphraseKey();
    [v8 setObject:v22 forKey:v23];

    if (!self->_stagedSecurityCodeType)
    {
      BOOL v24 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v25 = [(PSKeychainSyncManager *)self stagedSecurityCode];
      id v26 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "length"));
      uint64_t v27 = getkSecureBackupNumericPassphraseLengthKey();
      [v8 setObject:v26 forKey:v27];
    }
  }
  uint64_t v38 = [(PSKeychainSyncManager *)self appleIDPasswordOrEquivalentToken];

  if (!v38)
  {
    uint64_t v39 = _PSLoggingFacility();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6597000, v39, OS_LOG_TYPE_DEFAULT, "Missing password or password equivalent!", buf, 2u);
    }
  }
  if (v6)
  {
    if (v7)
    {
      v40 = [(PSKeychainSyncManager *)self appleIDPasswordOrEquivalentToken];

      if (v40)
      {
        id v41 = getkSecureBackupSMSTargetPhoneNumberKey();
        [v11 setObject:v6 forKey:v41];

        id v42 = [v7 dialingPrefix];
        v43 = getkSecureBackupCountryDialCodeKey();
        [v11 setObject:v42 forKey:v43];

        v44 = [v7 countryCode];
        v45 = getkSecureBackupCountryCodeKey_0();
        [v11 setObject:v44 forKey:v45];

        v46 = [(PSKeychainSyncManager *)self appleIDUsername];
        v47 = getkSecureBackupAuthenticationAppleID();
        [v11 setObject:v46 forKey:v47];

        char v48 = [(PSKeychainSyncManager *)self appleIDPasswordOrEquivalentToken];
        v49 = getkSecureBackupAuthenticationPassword();
        [v11 setObject:v48 forKey:v49];
      }
    }
  }
  v50 = [(PSKeychainSyncManager *)self navigationController];
  v51 = [v50 topViewController];
  [(PSKeychainSyncManager *)self startNavigationSpinnerInViewController:v51];

  id v52 = objc_alloc_init((Class)getSecureBackupClass_0());
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __72__PSKeychainSyncManager__enableSecureBackupWithPhoneNumber_countryInfo___block_invoke;
  v58[3] = &unk_1E5C5EE08;
  id v59 = v52;
  id v60 = v11;
  v61 = self;
  id v62 = v6;
  id v63 = v7;
  id v53 = v7;
  id v54 = v6;
  id v55 = v11;
  id v56 = v52;
  [v56 disableWithInfo:0 completionBlock:v58];
}

void __72__PSKeychainSyncManager__enableSecureBackupWithPhoneNumber_countryInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_FailedToDisabl_0.isa, a2);
  }
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PSKeychainSyncManager__enableSecureBackupWithPhoneNumber_countryInfo___block_invoke_2;
  v6[3] = &unk_1E5C5EDE0;
  id v5 = *(void **)(a1 + 56);
  void v6[4] = *(void *)(a1 + 48);
  id v7 = v5;
  id v8 = *(id *)(a1 + 64);
  [v3 enableWithInfo:v4 completionBlock:v6];
}

void __72__PSKeychainSyncManager__enableSecureBackupWithPhoneNumber_countryInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PSKeychainSyncManager__enableSecureBackupWithPhoneNumber_countryInfo___block_invoke_3;
  v6[3] = &unk_1E5C5DDF8;
  uint64_t v4 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __72__PSKeychainSyncManager__enableSecureBackupWithPhoneNumber_countryInfo___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) stopNavigationSpinner];
  if (*(void *)(a1 + 40))
  {
    NSLog(&cfstr_FailedToEnable.isa, *(void *)(a1 + 40));
    if (*(_DWORD *)(*(void *)(a1 + 32) + 16) == 1) {
      SOSCCRemoveThisDeviceFromCircle();
    }
    int v2 = [*(id *)(a1 + 40) domain];
    id v3 = getkSecureBackupErrorDomain();
    if ([v2 isEqualToString:v3])
    {
      uint64_t v4 = [*(id *)(a1 + 40) code];

      if (v4 == 29)
      {
        id v5 = *(void **)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 48);
        uint64_t v7 = *(void *)(a1 + 56);
        return [v5 _showInvalidPhoneNumberAlertWithDigits:v6 countryInfo:v7];
      }
    }
    else
    {
    }
    id v10 = *(void **)(a1 + 32);
    return [v10 _showGenericFlowErrorAlert];
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    return [v9 _finishedWithStatus:2 error:0];
  }
}

- (void)joinCircleAndEnableSecureBackupWithPhoneNumber:(id)a3 countryInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PSKeychainSyncManager *)self navigationController];
  id v9 = [v8 topViewController];
  [(PSKeychainSyncManager *)self startNavigationSpinnerInViewController:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__PSKeychainSyncManager_joinCircleAndEnableSecureBackupWithPhoneNumber_countryInfo___block_invoke;
  v12[3] = &unk_1E5C5EE30;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(PSKeychainSyncManager *)self joinCircleWithCompletion:v12];
}

void __84__PSKeychainSyncManager_joinCircleAndEnableSecureBackupWithPhoneNumber_countryInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) stopNavigationSpinner];
  id v6 = *(void **)(a1 + 32);
  if (a2 == 2)
  {
    id v7 = [*(id *)(a1 + 32) navigationController];
    id v8 = [v7 topViewController];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __84__PSKeychainSyncManager_joinCircleAndEnableSecureBackupWithPhoneNumber_countryInfo___block_invoke_2;
    v10[3] = &unk_1E5C5E818;
    id v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    id v12 = *(id *)(a1 + 48);
    [v6 promptForPasswordIfCredentialsNotCachedOverController:v8 withCompletion:v10];
  }
  else
  {
    [*(id *)(a1 + 32) _showGenericFlowErrorAlert];
    [*(id *)(a1 + 32) _finishedWithStatus:a2 error:v5];
  }
}

uint64_t __84__PSKeychainSyncManager_joinCircleAndEnableSecureBackupWithPhoneNumber_countryInfo___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _enableSecureBackupWithPhoneNumber:*(void *)(result + 40) countryInfo:*(void *)(result + 48)];
  }
  return result;
}

- (void)keychainSyncPhoneNumberController:(id)a3 didCompleteWithPhoneNumber:(id)a4 countryInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__PSKeychainSyncManager_keychainSyncPhoneNumberController_didCompleteWithPhoneNumber_countryInfo___block_invoke;
  v12[3] = &unk_1E5C5E818;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(PSKeychainSyncManager *)self promptForPasswordIfCredentialsNotCachedOverController:a3 withCompletion:v12];
}

void __98__PSKeychainSyncManager_keychainSyncPhoneNumberController_didCompleteWithPhoneNumber_countryInfo___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(_DWORD **)(a1 + 32);
    int v7 = v6[4];
    id v9 = v5;
    if (v7 == 3)
    {
      id v8 = [v6 stagedSecurityCode];
      objc_msgSend(v6, "_changeToNewSecurityCode:type:smsTarget:smsTargetCountryInfo:", v8, objc_msgSend(*(id *)(a1 + 32), "stagedSecurityCodeType"), *(void *)(a1 + 40), *(void *)(a1 + 48));
    }
    else if (v7 == 2)
    {
      [v6 _enableSecureBackupWithPhoneNumber:*(void *)(a1 + 40) countryInfo:*(void *)(a1 + 48)];
    }
    else
    {
      [v6 joinCircleAndEnableSecureBackupWithPhoneNumber:*(void *)(a1 + 40) countryInfo:*(void *)(a1 + 48)];
    }
    id v5 = v9;
  }
}

- (void)pinChoiceAlertDidChooseToUseDevicePasscode:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PSKeychainSyncManager *)self isRunningInBuddy])
  {
    if (v3)
    {
      phoneNumberController = self->_phoneNumberController;
      if (!phoneNumberController)
      {
        id v6 = objc_alloc_init(KeychainSyncPhoneNumberController);
        int v7 = self->_phoneNumberController;
        self->_phoneNumberController = v6;

        phoneNumberController = self->_phoneNumberController;
      }
      [(PSKeychainSyncManager *)self showController:phoneNumberController];
      return;
    }
    id v10 = objc_alloc_init(PSKeychainSyncSecurityCodeController);
    simpleSecurityCodeController = self->_simpleSecurityCodeController;
    self->_simpleSecurityCodeController = v10;

    [(PSKeychainSyncSecurityCodeController *)self->_simpleSecurityCodeController setShowsAdvancedSettings:1];
    id v12 = self->_simpleSecurityCodeController;
    if (!v12) {
      return;
    }
  }
  else
  {
    if (v3)
    {
      objc_opt_class();
      id v14 = (id)objc_opt_new();
      objc_storeStrong((id *)&self->_devicePinController, v14);
      if (!v14) {
        return;
      }
      devicePinController = self->_devicePinController;
      id v9 = PS_LocalizedStringForKeychainSync(@"ENTER_YOUR_PASSCODE");
      [(KeychainSyncDevicePINController *)devicePinController setEnterPasscodeTitle:v9];

      goto LABEL_13;
    }
    objc_opt_class();
    uint64_t v15 = (PSKeychainSyncSecurityCodeController *)objc_opt_new();
    objc_storeStrong((id *)&self->_simpleSecurityCodeController, v15);
    [(PSKeychainSyncSecurityCodeController *)self->_simpleSecurityCodeController setShowsAdvancedSettings:1];
    id v12 = v15;
    if (!v15) {
      return;
    }
  }
  id v14 = v12;
  [(PSKeychainSyncSecurityCodeController *)v12 setMode:1];
LABEL_13:
  [v14 setDelegate:self];
  if ([(PSKeychainSyncManager *)self isRunningInBuddy])
  {
    [(PSKeychainSyncManager *)self showController:v14];
  }
  else
  {
    [(PSRootController *)self->_settingsSetupController showController:v14];
    id v13 = [(PSSetupController *)self->_settingsSetupController parentController];
    [v13 presentViewController:self->_settingsSetupController animated:1 completion:0];
  }
}

- (NSString)appleIDUsername
{
  return self->_appleIDUsername;
}

- (void)setAppleIDUsername:(id)a3
{
}

- (NSString)appleIDRawPassword
{
  return self->_appleIDRawPassword;
}

- (void)setAppleIDRawPassword:(id)a3
{
}

- (NSString)appleIDPasswordOrEquivalentToken
{
  return self->_appleIDPasswordOrEquivalentToken;
}

- (id)completion
{
  return self->_completion;
}

- (id)passwordPromptCompletion
{
  return self->_passwordPromptCompletion;
}

- (void)setPasswordPromptCompletion:(id)a3
{
}

- (id)changeSecurityCodeCompletion
{
  return self->_changeSecurityCodeCompletion;
}

- (void)setChangeSecurityCodeCompletion:(id)a3
{
}

- (id)resetCompletion
{
  return self->_resetCompletion;
}

- (void)setResetCompletion:(id)a3
{
}

- (id)circleJoinCompletion
{
  return self->_circleJoinCompletion;
}

- (void)setCircleJoinCompletion:(id)a3
{
}

- (UIViewController)resetPromptControllerHost
{
  return self->_resetPromptControllerHost;
}

- (void)setResetPromptControllerHost:(id)a3
{
}

- (UIViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setHostViewController:(id)a3
{
}

- (PSSetupController)settingsSetupController
{
  return self->_settingsSetupController;
}

- (void)setSettingsSetupController:(id)a3
{
}

- (PSRootController)buddyNavigationController
{
  return self->_buddyNavigationController;
}

- (void)setBuddyNavigationController:(id)a3
{
}

- (NSString)securityCodeRecoveryAttempt
{
  return self->_securityCodeRecoveryAttempt;
}

- (void)setSecurityCodeRecoveryAttempt:(id)a3
{
}

- (NSString)stagedSecurityCode
{
  return self->_stagedSecurityCode;
}

- (int)stagedSecurityCodeType
{
  return self->_stagedSecurityCodeType;
}

- (BOOL)circleWasReset
{
  return self->_circleWasReset;
}

- (void)setCircleWasReset:(BOOL)a3
{
  self->_circleWasReset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedSecurityCode, 0);
  objc_storeStrong((id *)&self->_securityCodeRecoveryAttempt, 0);
  objc_storeStrong((id *)&self->_buddyNavigationController, 0);
  objc_storeStrong((id *)&self->_settingsSetupController, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_resetPromptControllerHost, 0);
  objc_storeStrong(&self->_circleJoinCompletion, 0);
  objc_storeStrong(&self->_resetCompletion, 0);
  objc_storeStrong(&self->_changeSecurityCodeCompletion, 0);
  objc_storeStrong(&self->_passwordPromptCompletion, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_appleIDPasswordOrEquivalentToken, 0);
  objc_storeStrong((id *)&self->_appleIDRawPassword, 0);
  objc_storeStrong((id *)&self->_appleIDUsername, 0);
  objc_storeStrong((id *)&self->_joinAfterRecoveryTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_credentialExpirationTimer, 0);
  objc_storeStrong((id *)&self->_spinningView, 0);
  objc_storeStrong((id *)&self->_smsValidationController, 0);
  objc_storeStrong((id *)&self->_phoneNumberController, 0);
  objc_storeStrong((id *)&self->_securityCodeRecoveryController, 0);
  objc_storeStrong((id *)&self->_advancedSecurityCodeChoiceController, 0);
  objc_storeStrong((id *)&self->_complexSecurityCodeController, 0);
  objc_storeStrong((id *)&self->_simpleSecurityCodeController, 0);
  objc_storeStrong((id *)&self->_devicePinController, 0);
}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A6597000, log, OS_LOG_TYPE_DEBUG, "iCDP: Successfully updated local secret after passcode change", v1, 2u);
}

void __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6597000, a2, OS_LOG_TYPE_ERROR, "iCDP: Failed to update local secret after passcode change with error %@", (uint8_t *)&v2, 0xCu);
}

@end