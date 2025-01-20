@interface SBPasscodeController
+ (id)sharedInstance;
- (BOOL)_isRestoreCompletedAlertActive;
- (SBPasscodeController)init;
- (void)_abort;
- (void)_activateComplianceAlert;
- (void)_didEndCall;
- (void)_fetchAndSetUnlockScreenTypeForNewPasscode:(BOOL)a3;
- (void)_passwordEntered:(id)a3;
- (void)_presentPasscodeAlertItemWithMode:(int)a3 alertItemErrorString:(id)a4 unlockScreenType:(int)a5;
- (void)_startListeningToManagedConfigurationNotification;
- (void)_startListeningToRestoreCompletedAlertStateChangedNotifications;
- (void)_startListeningToTelephonyNotifications;
- (void)_stopListeningToManagedConfigurationNotification;
- (void)_stopListeningToRestoreCompletedAlertStateChangedNotifications;
- (void)_stopListeningToTelephonyNotifications;
- (void)_userWantsToComplyNow:(BOOL)a3;
- (void)checkPasscodeCompliance;
- (void)dealloc;
- (void)forceUserToChangePasscode;
@end

@implementation SBPasscodeController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1) {
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_156);
  }
  v2 = (void *)__sharedInstance;
  return v2;
}

void __38__SBPasscodeController_sharedInstance__block_invoke()
{
  v0 = [MEMORY[0x1E4F74230] sharedConnection];
  char v1 = [v0 isPasscodeNagDaemonEnabled];

  if ((v1 & 1) == 0)
  {
    v2 = objc_alloc_init(SBPasscodeController);
    v3 = (void *)__sharedInstance;
    __sharedInstance = (uint64_t)v2;
  }
}

- (SBPasscodeController)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBPasscodeController;
  v2 = [(SBPasscodeController *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_restoreCompletedAlertStateChangedToken = 0;
    v2->_simplePasscodeType = -1;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);

    v6 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.SpringBoard.PasscodeCompliance", v5, v6);
    passcodeComplianceQueue = v3->_passcodeComplianceQueue;
    v3->_passcodeComplianceQueue = (OS_dispatch_queue *)v7;

    [(SBPasscodeController *)v3 _startListeningToManagedConfigurationNotification];
  }
  return v3;
}

- (void)dealloc
{
  if (self->_telephonyNotificationObserver)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_telephonyNotificationObserver];

    id telephonyNotificationObserver = self->_telephonyNotificationObserver;
    self->_id telephonyNotificationObserver = 0;
  }
  [(SBPasscodeController *)self _stopListeningToManagedConfigurationNotification];
  v5.receiver = self;
  v5.super_class = (Class)SBPasscodeController;
  [(SBPasscodeController *)&v5 dealloc];
}

- (void)forceUserToChangePasscode
{
  if (!self->_passcodeAlertItem)
  {
    v3 = [MEMORY[0x1E4F74230] sharedConnection];
    int v4 = [v3 isPasscodeSet];

    if (v4)
    {
      int v5 = 0;
    }
    else
    {
      previousPasscode = self->_previousPasscode;
      self->_previousPasscode = 0;

      int v5 = 1;
    }
    self->_uint64_t mode = v5;
    [(SBPasscodeController *)self _fetchAndSetUnlockScreenTypeForNewPasscode:v4 ^ 1u];
    uint64_t mode = self->_mode;
    uint64_t unlockScreenType = self->_unlockScreenType;
    [(SBPasscodeController *)self _presentPasscodeAlertItemWithMode:mode alertItemErrorString:0 unlockScreenType:unlockScreenType];
  }
}

- (void)_passwordEntered:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F74230] sharedConnection];
  int mode = self->_mode;
  if (mode == 2)
  {
    if (![v5 length]
      || ![(NSString *)self->_newPasscode length]
      || ![v5 isEqualToString:self->_newPasscode])
    {
LABEL_19:
      id v13 = 0;
LABEL_20:
      v27 = [MEMORY[0x1E4F28B50] mainBundle];
      v28 = v27;
      int v29 = self->_mode;
      if (v29 == 2)
      {
        self->_int mode = 1;
        if (![v5 isEqualToString:self->_newPasscode])
        {
          v32 = NSString;
          v33 = [v28 localizedStringForKey:@"CONFIRM_NEW_PASSCODE_MISMATCH" value:&stru_1F3084718 table:@"SpringBoard"];
          v34 = [MEMORY[0x1E4F74230] sharedConnection];
          v35 = [v34 localizedDescriptionOfDefaultNewPasscodeConstraints];
          v30 = objc_msgSend(v32, "stringWithFormat:", v33, v35);

LABEL_36:
          goto LABEL_38;
        }
        v30 = [v13 localizedDescription];
      }
      else
      {
        if (v29 != 1)
        {
          if (v29) {
            goto LABEL_41;
          }
          v30 = [v27 localizedStringForKey:@"PASSCODE_ALERT_INCORRECT_PASSCODE" value:&stru_1F3084718 table:@"SpringBoard"];
          uint64_t v31 = 0;
LABEL_39:
          [(SBPasscodeController *)self _fetchAndSetUnlockScreenTypeForNewPasscode:v31];
          if (v30)
          {
            [(SBAlertItem *)self->_passcodeAlertItem deactivate];
            passcodeAlertItem = self->_passcodeAlertItem;
            self->_passcodeAlertItem = 0;

            [(SBPasscodeController *)self _presentPasscodeAlertItemWithMode:self->_mode alertItemErrorString:v30 unlockScreenType:self->_unlockScreenType];
LABEL_42:

            goto LABEL_43;
          }
LABEL_41:
          [(SBPasscodeAlertItem *)self->_passcodeAlertItem _setErrorString:0];
          goto LABEL_42;
        }
        if (!v13) {
          goto LABEL_34;
        }
        v30 = [v13 localizedDescription];
        if ([v30 isEqualToString:&stru_1F3084718])
        {

LABEL_34:
          if (!self->_unlockScreenType)
          {
            v30 = 0;
            goto LABEL_38;
          }
          v33 = [MEMORY[0x1E4F74230] sharedConnection];
          v30 = [v33 localizedDescriptionOfDefaultNewPasscodeConstraints];
          goto LABEL_36;
        }
        if (!v30) {
          goto LABEL_34;
        }
      }
LABEL_38:
      uint64_t v31 = 1;
      goto LABEL_39;
    }
    previousPasscode = self->_previousPasscode;
    newPasscode = self->_newPasscode;
    v37 = 0;
    char v16 = [v6 changePasscodeFrom:previousPasscode to:newPasscode outError:&v37];
    v17 = v37;
  }
  else
  {
    if (mode != 1)
    {
      if (!mode)
      {
        uint64_t v40 = 0;
        v41 = &v40;
        uint64_t v42 = 0x2020000000;
        char v43 = 0;
        v8 = (void *)[objc_alloc(MEMORY[0x1E4FA5EA0]) initForPasscode:v5 source:0];
        v9 = [(id)SBApp authenticationController];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __41__SBPasscodeController__passwordEntered___block_invoke;
        v39[3] = &unk_1E6AF56B0;
        v39[4] = &v40;
        objc_super v10 = [MEMORY[0x1E4FA6050] responderWithSuccessHandler:v39 failureHandler:0 invalidHandler:0];
        [v9 processAuthenticationRequest:v8 responder:v10];

        if (*((unsigned char *)v41 + 24))
        {
          v11 = (NSString *)[v5 copy];
          v12 = self->_previousPasscode;
          self->_previousPasscode = v11;

          _Block_object_dispose(&v40, 8);
          id v13 = 0;
          goto LABEL_13;
        }

        _Block_object_dispose(&v40, 8);
      }
      goto LABEL_19;
    }
    objc_storeStrong((id *)&self->_newPasscode, a3);
    if (![(NSString *)self->_newPasscode length])
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      v24 = (void *)MEMORY[0x1E4F1C9E8];
      v25 = [v6 localizedDescriptionOfDefaultNewPasscodeConstraints];
      v26 = objc_msgSend(v24, "dictionaryWithObjectsAndKeys:", v25, *MEMORY[0x1E4F28568], 0);
      id v13 = [v23 errorWithDomain:@"EmptyPasscode" code:0 userInfo:v26];

      goto LABEL_20;
    }
    v18 = self->_newPasscode;
    v38 = 0;
    char v16 = [v6 passcode:v18 meetsCurrentConstraintsOutError:&v38];
    v17 = v38;
  }
  id v13 = v17;
  if ((v16 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_13:
  [(SBAlertItem *)self->_passcodeAlertItem deactivate];
  v19 = self->_passcodeAlertItem;
  self->_passcodeAlertItem = 0;

  uint64_t v20 = self->_mode;
  if (!v20)
  {
    self->_int mode = 1;
    [(SBPasscodeController *)self _fetchAndSetUnlockScreenTypeForNewPasscode:1];
    uint64_t v20 = self->_mode;
    goto LABEL_32;
  }
  if (v20 == 1)
  {
    uint64_t v20 = 2;
    self->_int mode = 2;
    goto LABEL_32;
  }
  if (v20 != 2)
  {
LABEL_32:
    [(SBPasscodeController *)self _presentPasscodeAlertItemWithMode:v20 alertItemErrorString:0 unlockScreenType:self->_unlockScreenType];
    goto LABEL_43;
  }
  [(SBPasscodeController *)self _stopListeningToRestoreCompletedAlertStateChangedNotifications];
  v21 = self->_previousPasscode;
  self->_previousPasscode = 0;

  v22 = self->_newPasscode;
  self->_newPasscode = 0;

LABEL_43:
}

uint64_t __41__SBPasscodeController__passwordEntered___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)_fetchAndSetUnlockScreenTypeForNewPasscode:(BOOL)a3
{
  BOOL v3 = a3;
  v6 = [MEMORY[0x1E4F74230] sharedConnection];
  dispatch_queue_t v7 = v6;
  p_simplePasscodeType = &self->_simplePasscodeType;
  if (v3) {
    int v9 = [v6 defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:p_simplePasscodeType];
  }
  else {
    int v9 = [v6 unlockScreenTypeWithOutSimplePasscodeType:p_simplePasscodeType];
  }
  self->_uint64_t unlockScreenType = v9;

  if (!self->_unlockScreenType && self->_simplePasscodeType == -1)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBPasscodeController.m" lineNumber:467 description:@"Cannot be simple and have a non-simple passcode type."];
  }
}

- (void)_presentPasscodeAlertItemWithMode:(int)a3 alertItemErrorString:(id)a4 unlockScreenType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if (self->_passcodeAlertItem)
  {
    int v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "WARNING: Activating passcode compliance alert before existing compliance alert was dismissed", buf, 2u);
    }

    [(SBAlertItem *)self->_passcodeAlertItem deactivate];
    passcodeAlertItem = self->_passcodeAlertItem;
    self->_passcodeAlertItem = 0;
  }
  v11 = [MEMORY[0x1E4F74230] sharedConnection];
  int v12 = [v11 isPasscodeModificationAllowed];

  if (v12)
  {
    id v13 = [[SBPasscodeAlertItem alloc] initWithPasscodeMode:v6 unlockScreenType:v5 simplePasscodeType:self->_simplePasscodeType];
    v14 = self->_passcodeAlertItem;
    self->_passcodeAlertItem = v13;

    [(SBPasscodeAlertItem *)self->_passcodeAlertItem _setErrorString:v8];
    v15 = +[SBAlertItemsController sharedInstance];
    [v15 activateAlertItem:self->_passcodeAlertItem];
  }
  else
  {
    v15 = SBLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v16 = 0;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, "NOTE: Skipping presentation of passcode alert item (passcode modification not allowed by MC)", v16, 2u);
    }
  }
}

- (void)_startListeningToManagedConfigurationNotification
{
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F73EC0];
  int v4 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v5 = [v7 addObserverForName:v3 object:0 queue:v4 usingBlock:&__block_literal_global_181];
  id manageConfigurationEffectiveSettingsObserver = self->_manageConfigurationEffectiveSettingsObserver;
  self->_id manageConfigurationEffectiveSettingsObserver = v5;
}

void __73__SBPasscodeController__startListeningToManagedConfigurationNotification__block_invoke()
{
  v0 = [MEMORY[0x1E4F74230] sharedConnection];
  char v1 = [v0 isPasscodeModificationAllowed];

  v2 = +[SBPasscodeController sharedInstance];
  id v3 = v2;
  if (v1) {
    [v2 checkPasscodeCompliance];
  }
  else {
    [v2 _abort];
  }
}

- (void)_stopListeningToManagedConfigurationNotification
{
  if (self->_manageConfigurationEffectiveSettingsObserver)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_manageConfigurationEffectiveSettingsObserver];

    id manageConfigurationEffectiveSettingsObserver = self->_manageConfigurationEffectiveSettingsObserver;
    self->_id manageConfigurationEffectiveSettingsObserver = 0;
  }
}

- (void)_userWantsToComplyNow:(BOOL)a3
{
  BOOL v3 = a3;
  complianceAlertItem = self->_complianceAlertItem;
  self->_complianceAlertItem = 0;

  if (v3)
  {
    [(SBPasscodeController *)self forceUserToChangePasscode];
  }
}

- (void)_abort
{
  [(SBAlertItem *)self->_complianceAlertItem deactivate];
  complianceAlertItem = self->_complianceAlertItem;
  self->_complianceAlertItem = 0;

  [(SBAlertItem *)self->_passcodeAlertItem deactivate];
  passcodeAlertItem = self->_passcodeAlertItem;
  self->_passcodeAlertItem = 0;

  [(SBPasscodeController *)self _stopListeningToTelephonyNotifications];
  [(SBPasscodeController *)self _stopListeningToRestoreCompletedAlertStateChangedNotifications];
  self->_delayedComplianceAlertUntilAfterRestoreCompletedAlert = 0;
}

- (void)_didEndCall
{
}

- (void)_startListeningToTelephonyNotifications
{
  id v8 = +[SBTelephonyManager sharedTelephonyManager];
  if ([v8 hasCellularTelephony])
  {
    id telephonyNotificationObserver = self->_telephonyNotificationObserver;

    if (telephonyNotificationObserver) {
      return;
    }
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v4 = *MEMORY[0x1E4FA79D8];
    uint64_t v5 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v6 = [v8 addObserverForName:v4 object:0 queue:v5 usingBlock:&__block_literal_global_183];
    id v7 = self->_telephonyNotificationObserver;
    self->_id telephonyNotificationObserver = v6;
  }
}

void __63__SBPasscodeController__startListeningToTelephonyNotifications__block_invoke()
{
  v0 = +[SBTelephonyManager sharedTelephonyManager];
  int v1 = [v0 inCall];

  v2 = +[SBPasscodeController sharedInstance];
  id v3 = v2;
  if (v1) {
    [v2 _abort];
  }
  else {
    [v2 _didEndCall];
  }
}

- (void)_stopListeningToTelephonyNotifications
{
  if (self->_telephonyNotificationObserver)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_telephonyNotificationObserver];

    id telephonyNotificationObserver = self->_telephonyNotificationObserver;
    self->_id telephonyNotificationObserver = 0;
  }
}

- (BOOL)_isRestoreCompletedAlertActive
{
  uint64_t state64 = 0;
  return !notify_get_state(self->_restoreCompletedAlertStateChangedToken, &state64) && state64 == 1;
}

- (void)_startListeningToRestoreCompletedAlertStateChangedNotifications
{
  p_restoreCompletedAlertStateChangedToken = &self->_restoreCompletedAlertStateChangedToken;
  if (!self->_restoreCompletedAlertStateChangedToken)
  {
    uint64_t v4 = (const char *)[(id)*MEMORY[0x1E4F78038] UTF8String];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __87__SBPasscodeController__startListeningToRestoreCompletedAlertStateChangedNotifications__block_invoke;
    handler[3] = &unk_1E6AF5558;
    handler[4] = self;
    notify_register_dispatch(v4, p_restoreCompletedAlertStateChangedToken, MEMORY[0x1E4F14428], handler);
  }
}

uint64_t __87__SBPasscodeController__startListeningToRestoreCompletedAlertStateChangedNotifications__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(unsigned char *)(result + 84))
  {
    uint64_t result = [(id)result _isRestoreCompletedAlertActive];
    if ((result & 1) == 0)
    {
      id v3 = SBLogCommon();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Activating passcode compliance alert now that the restore completed alert is inactive", v4, 2u);
      }

      *(unsigned char *)(*(void *)(a1 + 32) + 84) = 0;
      return [*(id *)(a1 + 32) _activateComplianceAlert];
    }
  }
  return result;
}

- (void)_stopListeningToRestoreCompletedAlertStateChangedNotifications
{
  int restoreCompletedAlertStateChangedToken = self->_restoreCompletedAlertStateChangedToken;
  if (restoreCompletedAlertStateChangedToken)
  {
    notify_cancel(restoreCompletedAlertStateChangedToken);
    self->_int restoreCompletedAlertStateChangedToken = 0;
  }
}

- (void)_activateComplianceAlert
{
  id v3 = +[SBAlertItemsController sharedInstance];
  [v3 activateAlertItem:self->_complianceAlertItem];

  uint64_t v4 = [MEMORY[0x1E4F74230] sharedConnection];
  uint64_t v5 = [(id)SBApp authenticationController];
  uint64_t v6 = [v5 lastRevokedAuthenticationDate];
  [v4 notifyUserHasSeenComplianceMessageWithLastLockDate:v6];

  [(SBPasscodeController *)self _stopListeningToRestoreCompletedAlertStateChangedNotifications];
}

- (void)checkPasscodeCompliance
{
  passcodeAlertItem = self->_passcodeAlertItem;
  if (passcodeAlertItem)
  {
    [(SBAlertItem *)passcodeAlertItem deactivate];
    uint64_t v4 = self->_passcodeAlertItem;
    self->_passcodeAlertItem = 0;
  }
  complianceAlertItem = self->_complianceAlertItem;
  if (complianceAlertItem)
  {
    [(SBAlertItem *)complianceAlertItem deactivate];
    uint64_t v6 = self->_complianceAlertItem;
    self->_complianceAlertItem = 0;
  }
  [(SBPasscodeController *)self _startListeningToTelephonyNotifications];
  self->_delayedComplianceAlertUntilAfterRestoreCompletedAlert = 0;
  [(SBPasscodeController *)self _startListeningToRestoreCompletedAlertStateChangedNotifications];
  id v7 = [(id)SBApp authenticationController];
  id v8 = [v7 lastRevokedAuthenticationDate];

  passcodeComplianceQueue = self->_passcodeComplianceQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__SBPasscodeController_checkPasscodeCompliance__block_invoke;
  v11[3] = &unk_1E6AF5290;
  id v12 = v8;
  id v13 = self;
  id v10 = v8;
  dispatch_async(passcodeComplianceQueue, v11);
}

void __47__SBPasscodeController_checkPasscodeCompliance__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SBPasscodeController_checkPasscodeCompliance__block_invoke_2;
  v4[3] = &unk_1E6AFD920;
  uint64_t v3 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  [v2 getPasscodeComplianceWarningLastLockDate:v3 completionBlock:v4];
}

void __47__SBPasscodeController_checkPasscodeCompliance__block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__SBPasscodeController_checkPasscodeCompliance__block_invoke_3;
  v12[3] = &unk_1E6AF67D8;
  uint64_t v9 = *(void *)(a1 + 32);
  int v15 = a2;
  v12[4] = v9;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __47__SBPasscodeController_checkPasscodeCompliance__block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 48)) {
    return;
  }
  int v2 = *(_DWORD *)(a1 + 56);
  if (v2 == 3)
  {
    id v11 = [SBPasscodeComplianceAlertItem alloc];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
    id v7 = [v6 localizedStringForKey:@"PASSCODE_REMINDER_CONTINUE" value:&stru_1F3084718 table:@"SpringBoard"];
    id v14 = [MEMORY[0x1E4F28B50] mainBundle];
    id v10 = v14;
    int v15 = @"PASSCODE_REMINDER_CANCEL";
LABEL_9:
    char v16 = [v14 localizedStringForKey:v15 value:&stru_1F3084718 table:@"SpringBoard"];
    uint64_t v17 = [(SBPasscodeComplianceAlertItem *)v11 initWithTitle:v12 message:v13 continueButtonTitle:v7 cancelButtonTitle:v16];
    uint64_t v18 = *(void *)(a1 + 32);
    v19 = *(void **)(v18 + 48);
    *(void *)(v18 + 48) = v17;

    goto LABEL_10;
  }
  if (v2 == 2)
  {
    id v11 = [SBPasscodeComplianceAlertItem alloc];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
    id v7 = [v6 localizedStringForKey:@"NON_COMPLIANT_PASSCODE_CONTINUE" value:&stru_1F3084718 table:@"SpringBoard"];
    id v14 = [MEMORY[0x1E4F28B50] mainBundle];
    id v10 = v14;
    int v15 = @"NON_COMPLIANT_PASSCODE_LATER";
    goto LABEL_9;
  }
  if (v2 != 1) {
    goto LABEL_11;
  }
  uint64_t v3 = [SBPasscodeComplianceAlertItem alloc];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
  id v7 = [v6 localizedStringForKey:@"NON_COMPLIANT_PASSCODE_CONTINUE" value:&stru_1F3084718 table:@"SpringBoard"];
  uint64_t v8 = [(SBPasscodeComplianceAlertItem *)v3 initWithTitle:v4 message:v5 continueButtonTitle:v7 cancelButtonTitle:0];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 48);
  *(void *)(v9 + 48) = v8;
LABEL_10:

LABEL_11:
  uint64_t v20 = *(void **)(a1 + 32);
  if (v20[6])
  {
    if ([v20 _isRestoreCompletedAlertActive])
    {
      v21 = SBLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_INFO, "Dealying activating passcode compliance alert until after restore completed alert", v23, 2u);
      }

      *(unsigned char *)(*(void *)(a1 + 32) + 84) = 1;
    }
    else
    {
      v22 = *(void **)(a1 + 32);
      [v22 _activateComplianceAlert];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeComplianceQueue, 0);
  objc_storeStrong(&self->_telephonyNotificationObserver, 0);
  objc_storeStrong(&self->_manageConfigurationEffectiveSettingsObserver, 0);
  objc_storeStrong((id *)&self->_forcedComplianceDate, 0);
  objc_storeStrong((id *)&self->_complianceAlertItem, 0);
  objc_storeStrong((id *)&self->_newPasscode, 0);
  objc_storeStrong((id *)&self->_previousPasscode, 0);
  objc_storeStrong((id *)&self->_passcodeAlertItem, 0);
}

@end