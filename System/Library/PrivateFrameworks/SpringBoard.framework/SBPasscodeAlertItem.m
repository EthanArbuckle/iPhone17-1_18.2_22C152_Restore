@interface SBPasscodeAlertItem
- (BOOL)shouldShowInLockScreen;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (SBPasscodeAlertItem)initWithPasscodeMode:(int)a3 unlockScreenType:(int)a4 simplePasscodeType:(int)a5;
- (void)_clearAlertController;
- (void)_setErrorString:(id)a3;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)configureTextField:(id)a3;
- (void)dealloc;
- (void)didEndCall;
- (void)makeEmergencyCall;
- (void)submitPassword;
@end

@implementation SBPasscodeAlertItem

- (SBPasscodeAlertItem)initWithPasscodeMode:(int)a3 unlockScreenType:(int)a4 simplePasscodeType:(int)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SBPasscodeAlertItem;
  v8 = [(SBAlertItem *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    v8->_unlockScreenType = a4;
    v8->_simplePasscodeType = a5;
    v10 = +[SBTelephonyManager sharedTelephonyManager];
    v9->_hasEmergencyCall = [v10 hasCellularTelephony];

    v9->_alreadySubmittedPassword = 0;
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(SBAlertItem *)self alertController];
  v4 = [v3 textFields];
  v5 = [v4 firstObject];

  if (v5)
  {
    [v5 setDelegate:0];
    [v5 removeTarget:self action:sel_submitPassword forControlEvents:0x80000];
  }

  v6.receiver = self;
  v6.super_class = (Class)SBPasscodeAlertItem;
  [(SBPasscodeAlertItem *)&v6 dealloc];
}

- (void)submitPassword
{
  if (!self->_alreadySubmittedPassword)
  {
    self->_alreadySubmittedPassword = 1;
    v2 = [(SBAlertItem *)self alertController];
    v3 = [v2 textFields];
    v4 = [v3 firstObject];
    id v6 = [v4 text];

    v5 = +[SBPasscodeController sharedInstance];
    [v5 _passwordEntered:v6];
  }
}

- (void)makeEmergencyCall
{
  v2 = +[SBTelephonyManager sharedTelephonyManager];
  int v3 = [v2 inCall];

  if (v3)
  {
    v4 = +[SBWorkspace mainWorkspace];
    v5 = [v4 inCallPresentationManager];
    [v5 reactivateInCallForReason:3];
  }
  else
  {
    v4 = [(id)SBApp authenticationController];
    if ([v4 hasPasscodeSet]) {
      [v4 revokeAuthenticationImmediatelyForPublicReason:@"PasscodeController - makeEmergencyCall"];
    }
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_103);
  }

  id v6 = +[SBPasscodeController sharedInstance];
  [v6 _abort];
}

void __40__SBPasscodeAlertItem_makeEmergencyCall__block_invoke()
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v0 = +[SBLockScreenManager sharedInstance];
  v9[0] = @"SBUILockOptionsUseScreenOffModeKey";
  v1 = [NSNumber numberWithBool:0];
  v10[0] = v1;
  v9[1] = @"SBUILockOptionsLockAutomaticallyKey";
  v2 = [NSNumber numberWithBool:1];
  v10[1] = v2;
  v9[2] = @"SBUILockOptionsForceLockKey";
  int v3 = [NSNumber numberWithBool:1];
  v10[2] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  [v0 lockUIFromSource:9 withOptions:v4];

  dispatch_time_t v5 = dispatch_walltime(0, 250000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__SBPasscodeAlertItem_makeEmergencyCall__block_invoke_2;
  v7[3] = &unk_1E6AF4AC0;
  id v8 = v0;
  id v6 = v0;
  dispatch_after(v5, MEMORY[0x1E4F14428], v7);
}

void __40__SBPasscodeAlertItem_makeEmergencyCall__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lockScreenEnvironment];
  v1 = [v2 callController];
  [v1 launchEmergencyDialer];
}

- (void)_clearAlertController
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v3 = [(SBAlertItem *)self alertController];
  v4 = [v3 textFields];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v9 setDelegate:0];
        [v9 removeTarget:self action:sel_submitPassword forControlEvents:0x80000];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)SBPasscodeAlertItem;
  [(SBAlertItem *)&v10 _clearAlertController];
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", a3, a4);
  uint64_t v6 = [(SBAlertItem *)self alertController];
  uint64_t v7 = [v6 textFields];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [v6 textFields];
    objc_super v10 = [v9 objectAtIndex:0];
    [(SBPasscodeAlertItem *)self configureTextField:v10];
  }
  else
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __59__SBPasscodeAlertItem_configure_requirePasscodeForActions___block_invoke;
    v31[3] = &unk_1E6AFD8F8;
    v31[4] = self;
    [v6 addTextFieldWithConfigurationHandler:v31];
  }
  int mode = self->_mode;
  long long v12 = @"PASSCODE_ALERT_NEXT";
  if (mode == 2)
  {
    long long v14 = @"CONFIRM_NEW_PASSCODE";
    v15 = v5;
LABEL_9:
    uint64_t v16 = [v15 localizedStringForKey:v14 value:&stru_1F3084718 table:@"SpringBoard"];
    [v6 setTitle:v16];
LABEL_10:

    goto LABEL_13;
  }
  if (mode != 1)
  {
    if (mode) {
      goto LABEL_15;
    }
    long long v13 = [v5 localizedStringForKey:@"ENTER_CURRENT_PASSCODE" value:&stru_1F3084718 table:@"SpringBoard"];
    [v6 setMessage:v13];

    long long v14 = @"PASSCODE_ALERT_TITLE";
    v15 = v5;
    goto LABEL_9;
  }
  v17 = [v5 localizedStringForKey:@"ENTER_NEW_PASSCODE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v6 setTitle:v17];

  if (!self->_errorString)
  {
    uint64_t v16 = [MEMORY[0x1E4F74230] sharedConnection];
    v28 = [v16 localizedDescriptionOfDefaultNewPasscodeConstraints];
    [v6 setMessage:v28];

    goto LABEL_10;
  }
  objc_msgSend(v6, "setMessage:");
LABEL_13:
  if (self->_mode == 2) {
    long long v12 = @"PASSCODE_ALERT_DONE";
  }
LABEL_15:
  v18 = [v5 localizedStringForKey:v12 value:&stru_1F3084718 table:@"SpringBoard"];
  if (self->_hasEmergencyCall)
  {
    v19 = +[SBTelephonyManager sharedTelephonyManager];
    int v20 = [v19 inCall];
    v21 = @"PASSCODE_ALERT_EMERGENCY";
    if (v20) {
      v21 = @"PASSCODE_ALERT_CANCEL";
    }
    v22 = v21;

    v23 = (void *)MEMORY[0x1E4F42720];
    v24 = [v5 localizedStringForKey:v22 value:&stru_1F3084718 table:@"SpringBoard"];

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __59__SBPasscodeAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v30[3] = &unk_1E6AF4918;
    v30[4] = self;
    v25 = [v23 actionWithTitle:v24 style:1 handler:v30];
    [v6 addAction:v25];

    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = 1;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __59__SBPasscodeAlertItem_configure_requirePasscodeForActions___block_invoke_3;
  v29[3] = &unk_1E6AF4918;
  v29[4] = self;
  v27 = [MEMORY[0x1E4F42720] actionWithTitle:v18 style:v26 handler:v29];
  [v6 addAction:v27];
}

uint64_t __59__SBPasscodeAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) configureTextField:a2];
}

uint64_t __59__SBPasscodeAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeEmergencyCall];
}

uint64_t __59__SBPasscodeAlertItem_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) submitPassword];
}

- (void)configureTextField:(id)a3
{
  id v4 = a3;
  [v4 setSecureTextEntry:1];
  [v4 setDelegate:self];
  [v4 addTarget:self action:sel_submitPassword forControlEvents:0x80000];
  [v4 setKeyboardAppearance:1];
  [v4 setKeyboardType:4 * (self->_unlockScreenType != 2)];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  id v11 = a5;
  if (self->_unlockScreenType) {
    goto LABEL_8;
  }
  int simplePasscodeType = self->_simplePasscodeType;
  if (simplePasscodeType == 1)
  {
    unint64_t v14 = 6;
  }
  else
  {
    if (simplePasscodeType == -1)
    {
      long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"SBPasscodeController.m", 191, @"Illegal condition: unlock type is simple, but no simple passcode type detected." object file lineNumber description];
    }
    unint64_t v14 = 4;
  }
  if (location + length < v14) {
LABEL_8:
  }
    BOOL v15 = 1;
  else {
    BOOL v15 = [v11 length] == 0;
  }

  return v15;
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (void)_setErrorString:(id)a3
{
}

- (void)didEndCall
{
  if (self->_hasEmergencyCall)
  {
    int v3 = [(SBAlertItem *)self alertController];
    id v4 = [v3 actions];
    uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"PASSCODE_ALERT_EMERGENCY" value:&stru_1F3084718 table:@"SpringBoard"];

    uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __33__SBPasscodeAlertItem_didEndCall__block_invoke;
    v13[3] = &unk_1E6AF4918;
    v13[4] = self;
    uint64_t v8 = [MEMORY[0x1E4F42720] actionWithTitle:v6 style:1 handler:v13];
    v9 = [v7 arrayWithObject:v8];

    if ((unint64_t)[v4 count] >= 2)
    {
      unint64_t v10 = 1;
      do
      {
        id v11 = [v4 objectAtIndex:v10];
        [v9 addObject:v11];

        ++v10;
      }
      while (v10 < [v4 count]);
    }
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithArray:v9];
    [v3 _setActions:v12];
  }
}

uint64_t __33__SBPasscodeAlertItem_didEndCall__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeEmergencyCall];
}

- (void).cxx_destruct
{
}

@end