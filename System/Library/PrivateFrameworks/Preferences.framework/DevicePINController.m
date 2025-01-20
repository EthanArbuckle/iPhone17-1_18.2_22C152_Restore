@interface DevicePINController
+ (BOOL)settingEnabled;
- (BOOL)_asyncSetPinCompatible;
- (BOOL)_shouldCheckForWeakness;
- (BOOL)_shouldShowOptionsButton;
- (BOOL)_useSEPLockInfo;
- (BOOL)allowOptionsButton;
- (BOOL)attemptValidationWithPIN:(id)a3;
- (BOOL)completedInputIsValid:(id)a3;
- (BOOL)hidesCancelButton;
- (BOOL)hidesNavigationButtons;
- (BOOL)isBlocked;
- (BOOL)isCreatingPasscode;
- (BOOL)isNumericPIN;
- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4;
- (BOOL)requiresKeyboard;
- (BOOL)shouldDismissWhenDone;
- (BOOL)showSimplePINCancelButtonOnLeft;
- (BOOL)simplePIN;
- (BOOL)success;
- (BOOL)useProgressiveDelays;
- (BOOL)validatePIN:(id)a3;
- (CGSize)overallContentSizeForViewInPopover;
- (DevicePINController)init;
- (DevicePINControllerDelegate)pinDelegate;
- (NSString)doneButtonTitle;
- (NSString)passcodeOptionsTitle;
- (__CFString)blockTimeIntervalKey;
- (__CFString)blockedStateKey;
- (__CFString)defaultsID;
- (__CFString)failedAttemptsKey;
- (double)_secondsToBlockForFailedAttempts:(int64_t)a3;
- (double)blockedTimeRemaining;
- (double)unblockTime;
- (id)_createAndShowAnimatedNavBarSpinner;
- (id)_sepLockInfo;
- (id)localizedPINStringForKey:(id)a3;
- (id)passcodeOptionsAlertController;
- (id)passcodeOptionsHandler;
- (id)pinInstructionsPrompt;
- (id)pinInstructionsPromptFont;
- (id)pinPane;
- (id)stringsBundle;
- (id)stringsTable;
- (id)titleString;
- (int)_getScreenType;
- (int)_simplePasscodeType;
- (int)defaultPinLength;
- (int)mode;
- (int)pinLength;
- (int64_t)numberOfFailedAttempts;
- (void)_adjustUnblockTime;
- (void)_clearBlockedState;
- (void)_dismiss;
- (void)_invalidateSEPLockInfo;
- (void)_preflightPasswordForWeakness:(id)a3 withCompletion:(id)a4;
- (void)_removePinWithOldPassword:(id)a3;
- (void)_rereadBlockedState;
- (void)_setNumberOfFailedAttempts:(int64_t)a3;
- (void)_setPINPaneToSimple:(BOOL)a3 simpleLength:(int)a4 numeric:(BOOL)a5 requiresKeyboard:(int)a6;
- (void)_setUnblockTime:(double)a3;
- (void)_showFailedAttempts;
- (void)_showPINConfirmationError;
- (void)_showUnacceptablePINError:(id)a3 password:(id)a4;
- (void)_slidePasscodeFieldLeft:(BOOL)a3;
- (void)_updateErrorTextAndFailureCount:(BOOL)a3;
- (void)_updatePINButtons;
- (void)_updateUI;
- (void)adjustButtonsForPasswordLength:(unint64_t)a3;
- (void)cancelButtonTapped;
- (void)deactivateKeypad;
- (void)dealloc;
- (void)loadView;
- (void)optionsTapped;
- (void)pinEntered:(id)a3;
- (void)setAllowOptionsButton:(BOOL)a3;
- (void)setDoneButtonTitle:(id)a3;
- (void)setHidesCancelButton:(BOOL)a3;
- (void)setHidesNavigationButtons:(BOOL)a3;
- (void)setLastEntry:(id)a3;
- (void)setMode:(int)a3;
- (void)setNumericPIN:(BOOL)a3;
- (void)setOldPassword:(id)a3;
- (void)setPIN:(id)a3 completion:(id)a4;
- (void)setPane:(id)a3;
- (void)setPasscodeOptionsHandler:(id)a3;
- (void)setPasscodeOptionsTitle:(id)a3;
- (void)setPinBlocked:(BOOL)a3;
- (void)setPinDelegate:(id)a3;
- (void)setPinLength:(int)a3;
- (void)setRequiresKeyboard:(BOOL)a3;
- (void)setShouldDismissWhenDone:(BOOL)a3;
- (void)setSimplePIN:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)showPasscodeOptions:(id)a3;
- (void)suspend;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willUnlock;
@end

@implementation DevicePINController

+ (BOOL)settingEnabled
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

- (void)willUnlock
{
  if ([(DevicePINController *)self useProgressiveDelays])
  {
    [(DevicePINController *)self _rereadBlockedState];
    [(DevicePINController *)self _updateUI];
  }
}

- (DevicePINController)init
{
  v5.receiver = self;
  v5.super_class = (Class)DevicePINController;
  v2 = [(PSViewController *)&v5 init];
  char v3 = v2;
  if (v2)
  {
    if ([(DevicePINController *)v2 useProgressiveDelays]) {
      CFPreferencesAppSynchronize([(DevicePINController *)v3 defaultsID]);
    }
    v3->_mode = 1000;
    v3->_shouldDismissWhenDone = 1;
  }
  return v3;
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DevicePINController;
  [(PSViewController *)&v7 setSpecifier:v4];
  id WeakRetained = objc_loadWeakRetained(&self->_pinDelegate);

  if (!WeakRetained)
  {
    v6 = [v4 propertyForKey:@"PINControllerDelegate"];
    objc_storeWeak(&self->_pinDelegate, v6);

    [v4 removePropertyForKey:@"PINControllerDelegate"];
  }
  [(DevicePINController *)self overallContentSizeForViewInPopover];
  -[DevicePINController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
  id v4 = [(DevicePINController *)self title];
  [(DevicePINController *)self setTitle:v4];

  pinLength = self->_pinLength;
  self->_pinLength = 0;

  numericPIN = self->_numericPIN;
  self->_numericPIN = 0;

  requiresKeyboard = self->_requiresKeyboard;
  self->_requiresKeyboard = 0;

  simplePIN = self->_simplePIN;
  self->_simplePIN = 0;
}

- (int)mode
{
  return self->_mode;
}

- (CGSize)overallContentSizeForViewInPopover
{
  BOOL v2 = [(DevicePINController *)self requiresKeyboard];
  double v3 = 264.0;
  if (!v2) {
    double v3 = 480.0;
  }
  double v4 = 320.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)_dismiss
{
  self->_hasBeenDismissed = 1;
  double v3 = [MEMORY[0x1E4F42B08] activeKeyboard];
  [v3 setUserInteractionEnabled:1];

  [(PSEditingPane *)self->super._pane dismissKeypad];
  if (self->_shouldDismissWhenDone)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._parentController);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __31__DevicePINController__dismiss__block_invoke;
    v5[3] = &unk_1E5C5D680;
    v5[4] = self;
    [WeakRetained dismissWithCompletion:v5];
  }
}

void __31__DevicePINController__dismiss__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1064));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1064));
    [v4 devicePINControllerDidDismissPINPane:*(void *)(a1 + 32)];
  }
}

- (id)stringsTable
{
  return @"PIN Entry";
}

- (id)stringsBundle
{
  BOOL v2 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

- (id)localizedPINStringForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(DevicePINController *)self stringsBundle];
  v6 = [(DevicePINController *)self stringsTable];
  id v7 = [v5 localizedStringForKey:v4 value:&stru_1EFB51FD0 table:v6];

  if (v7 == v4)
  {
    PS_LocalizedStringForPINEntry(v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)dealloc
{
  [(PSEditingPane *)self->super._pane dismissKeypad];
  v3.receiver = self;
  v3.super_class = (Class)DevicePINController;
  [(PSDetailController *)&v3 dealloc];
}

- (void)setOldPassword:(id)a3
{
}

- (void)setLastEntry:(id)a3
{
}

- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v7 = [MEMORY[0x1E4F74230] sharedConnection];
  int v8 = [v7 passcode:v6 meetsCurrentConstraintsOutError:a4];

  if (!v8)
  {
    LOBYTE(v16) = 0;
    goto LABEL_10;
  }
  v9 = [(DevicePINController *)self pinDelegate];
  if (([v9 conformsToProtocol:&unk_1EFB7BC28] & 1) == 0)
  {

    goto LABEL_9;
  }
  v10 = [(DevicePINController *)self pinDelegate];
  v11 = [v10 specifier];
  v12 = [v11 objectForKeyedSubscript:@"passcode"];

  if (!v12)
  {
LABEL_9:
    int v16 = ![(DevicePINController *)self validatePIN:v6];
    goto LABEL_10;
  }
  v13 = [(DevicePINController *)self pinDelegate];
  v14 = [v13 specifier];
  v15 = [v14 objectForKeyedSubscript:@"passcode"];
  int v16 = [v15 isEqualToString:v6] ^ 1;

LABEL_10:
  return v16;
}

- (void)setPIN:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(DevicePINController *)self _createAndShowAnimatedNavBarSpinner];
  self->_showingSpinner = 1;
  v9 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v10 = [v9 beginBackgroundTaskWithName:@"com.apple.Preferences.passcode" expirationHandler:0];

  LODWORD(v9) = [(DevicePINController *)self mode];
  v11 = self->_oldPassword;
  v12 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__DevicePINController_setPIN_completion___block_invoke;
  block[3] = &unk_1E5C5FFC8;
  int v24 = (int)v9;
  v18 = v11;
  id v19 = v6;
  id v20 = v8;
  v21 = self;
  id v22 = v7;
  uint64_t v23 = v10;
  id v13 = v7;
  id v14 = v8;
  id v15 = v6;
  int v16 = v11;
  dispatch_async(v12, block);
}

void __41__DevicePINController_setPIN_completion___block_invoke(uint64_t a1)
{
  BOOL v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = *(_DWORD *)(a1 + 80);
  if (v3 == 1)
  {
    uint64_t v10 = _PSLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6597000, v10, OS_LOG_TYPE_DEFAULT, "Removing passcode...", buf, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v28 = 0;
    id v7 = (id *)&v28;
    int v8 = &v28;
    v9 = v2;
    uint64_t v6 = 0;
  }
  else if (v3 == 2)
  {
    id v4 = _PSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_DEFAULT, "Changing passcode...", buf, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v29 = 0;
    id v7 = (id *)&v29;
    int v8 = &v29;
    v9 = v2;
  }
  else
  {
    v11 = _PSLoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6597000, v11, OS_LOG_TYPE_DEFAULT, "Setting passcode...", buf, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v27 = 0;
    id v7 = (id *)&v27;
    int v8 = &v27;
    v9 = v2;
    uint64_t v5 = 0;
  }
  char v12 = [v9 changePasscodeFrom:v5 to:v6 outError:v8];
  id v13 = *v7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __41__DevicePINController_setPIN_completion___block_invoke_119;
  v18[3] = &unk_1E5C5FFA0;
  char v26 = v12;
  uint64_t v24 = *(void *)(a1 + 72);
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  int v16 = *(void **)(a1 + 64);
  id v19 = v14;
  uint64_t v20 = v15;
  id v23 = v16;
  id v21 = v13;
  int v25 = *(_DWORD *)(a1 + 80);
  id v22 = *(id *)(a1 + 40);
  id v17 = v13;
  dispatch_async(MEMORY[0x1E4F14428], v18);
}

void __41__DevicePINController_setPIN_completion___block_invoke_119(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 84)) {
    goto LABEL_4;
  }
  BOOL v2 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  [v2 saveDeviceUnlockPasscodeInputModes];

  int v3 = [MEMORY[0x1E4F42738] sharedApplication];
  [v3 endBackgroundTask:*(void *)(a1 + 72)];

  if (!*(unsigned char *)(a1 + 84)) {
    goto LABEL_4;
  }
  if (*(_DWORD *)(a1 + 80) != 1)
  {
    id v4 = +[PSKeychainSyncManager sharedManager];
    uint64_t v5 = *(void *)(a1 + 56);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__DevicePINController_setPIN_completion___block_invoke_2;
    v12[3] = &unk_1E5C5FF78;
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v13 = v7;
    uint64_t v14 = v8;
    id v9 = *(id *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 72);
    id v15 = v9;
    uint64_t v16 = v10;
    [v4 promptForDevicePasscodeChangeToPasscode:v5 overController:v6 completion:v12];
  }
  else
  {
LABEL_4:
    [*(id *)(a1 + 32) stopAnimating];
    *(unsigned char *)(*(void *)(a1 + 40) + 1137) = 0;
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v11 = [MEMORY[0x1E4F42738] sharedApplication];
    [v11 endBackgroundTask:*(void *)(a1 + 72)];
  }
}

void __41__DevicePINController_setPIN_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__DevicePINController_setPIN_completion___block_invoke_3;
  v10[3] = &unk_1E5C5FF50;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void **)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  char v16 = a2;
  id v13 = v5;
  id v14 = v8;
  uint64_t v15 = *(void *)(a1 + 56);
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __41__DevicePINController_setPIN_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) stopAnimating];
  *(unsigned char *)(*(void *)(a1 + 40) + 1137) = 0;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = [MEMORY[0x1E4F42738] sharedApplication];
  [v2 endBackgroundTask:*(void *)(a1 + 64)];
}

- (id)_createAndShowAnimatedNavBarSpinner
{
  int v3 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v3];
  id v5 = [(DevicePINController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];

  [v3 startAnimating];
  return v3;
}

- (BOOL)validatePIN:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4F74230];
  id v4 = a3;
  id v5 = [v3 sharedConnection];
  if ([v5 isPasscodeSet])
  {
    id v8 = 0;
    char v6 = [v5 unlockDeviceWithPasscode:v4 outError:&v8];

    id v4 = v8;
  }
  else
  {
    char v6 = [v4 isEqualToString:&stru_1EFB51FD0];
  }

  return v6;
}

- (BOOL)useProgressiveDelays
{
  return 1;
}

- (__CFString)defaultsID
{
  return @"com.apple.springboard";
}

- (__CFString)failedAttemptsKey
{
  return @"SBDeviceLockFailedAttempts";
}

- (__CFString)blockTimeIntervalKey
{
  return @"SBDeviceLockBlockTimeIntervalSinceReferenceDate";
}

- (__CFString)blockedStateKey
{
  return @"SBDeviceLockBlocked";
}

- (int)_getScreenType
{
  if ([(DevicePINController *)self isCreatingPasscode])
  {
    int v6 = 0;
    id v2 = [MEMORY[0x1E4F74230] sharedConnection];
    int v3 = [v2 defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:&v6];
  }
  else
  {
    id v2 = [MEMORY[0x1E4F74230] sharedConnection];
    int v3 = [v2 unlockScreenType];
  }
  int v4 = v3;

  return v4;
}

- (int)_simplePasscodeType
{
  int v6 = 0;
  BOOL v2 = [(DevicePINController *)self isCreatingPasscode];
  int v3 = [MEMORY[0x1E4F74230] sharedConnection];
  int v4 = v3;
  if (v2) {
    [v3 defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:&v6];
  }
  else {
    [v3 unlockScreenTypeWithOutSimplePasscodeType:&v6];
  }

  return v6;
}

- (void)setRequiresKeyboard:(BOOL)a3
{
  int v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  requiresKeyboard = self->_requiresKeyboard;
  self->_requiresKeyboard = v4;
  MEMORY[0x1F41817F8](v4, requiresKeyboard);
}

- (void)setPinLength:(int)a3
{
  int v4 = [MEMORY[0x1E4F28ED0] numberWithInt:*(void *)&a3];
  pinLength = self->_pinLength;
  self->_pinLength = v4;
  MEMORY[0x1F41817F8](v4, pinLength);
}

- (void)setSimplePIN:(BOOL)a3
{
  int v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  simplePIN = self->_simplePIN;
  self->_simplePIN = v4;
  MEMORY[0x1F41817F8](v4, simplePIN);
}

- (void)setNumericPIN:(BOOL)a3
{
  int v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  numericPIN = self->_numericPIN;
  self->_numericPIN = v4;
  MEMORY[0x1F41817F8](v4, numericPIN);
}

- (BOOL)requiresKeyboard
{
  requiresKeyboard = self->_requiresKeyboard;
  if (requiresKeyboard)
  {
    return [(NSNumber *)requiresKeyboard BOOLValue];
  }
  else if (PSUsePadStylePIN())
  {
    if (self->_mode == 1000)
    {
      id v5 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"mode"];

      if (v5)
      {
        int v6 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"mode"];
        self->_mode = [v6 intValue];

        uint64_t v7 = [(DevicePINController *)self title];
        [(DevicePINController *)self setTitle:v7];
      }
    }
    return ![(DevicePINController *)self isNumericPIN];
  }
  else
  {
    return 1;
  }
}

- (BOOL)simplePIN
{
  if (!self->_simplePIN) {
    return [(DevicePINController *)self _getScreenType] == 0;
  }
  simplePIN = self->_simplePIN;
  return [(NSNumber *)simplePIN BOOLValue];
}

- (int)defaultPinLength
{
  int v2 = 6;
  if ((PSSupportsMesa() & 1) == 0)
  {
    if (PSIsPearlAvailable()) {
      return 6;
    }
    else {
      return 4;
    }
  }
  return v2;
}

- (int)pinLength
{
  pinLength = self->_pinLength;
  if (pinLength)
  {
    return [(NSNumber *)pinLength intValue];
  }
  else if ([(DevicePINController *)self _simplePasscodeType] == 1)
  {
    return 6;
  }
  else if ([(DevicePINController *)self isCreatingPasscode])
  {
    return [(DevicePINController *)self defaultPinLength];
  }
  else
  {
    return 4;
  }
}

- (BOOL)isCreatingPasscode
{
  int mode = self->_mode;
  if (!mode) {
    return 1;
  }
  if (mode == 2) {
    return self->_substate > 1;
  }
  return 0;
}

- (BOOL)isNumericPIN
{
  if (!self->_numericPIN) {
    return [(DevicePINController *)self _getScreenType] != 2;
  }
  numericPIN = self->_numericPIN;
  return [(NSNumber *)numericPIN BOOLValue];
}

- (BOOL)_useSEPLockInfo
{
  p_sepOnceToken = &self->_sepOnceToken;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__DevicePINController__useSEPLockInfo__block_invoke;
  block[3] = &unk_1E5C5D680;
  void block[4] = self;
  if (*p_sepOnceToken != -1) {
    dispatch_once(p_sepOnceToken, block);
  }
  return self->_useSEPLockInfo;
}

void __38__DevicePINController__useSEPLockInfo__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) useProgressiveDelays]
    && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "defaultsID"), "isEqualToString:", @"com.apple.springboard")&& objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "failedAttemptsKey"), "isEqualToString:", @"SBDeviceLockFailedAttempts")&& objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "blockTimeIntervalKey"), "isEqualToString:", @"SBDeviceLockBlockTimeIntervalSinceReferenceDate")&& objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "blockedStateKey"), "isEqualToString:", @"SBDeviceLockBlocked")&& MGGetBoolAnswer())
  {
    int v2 = [*(id *)(a1 + 32) _sepLockInfo];

    if (v2) {
      *(unsigned char *)(*(void *)(a1 + 32) + 1136) = 1;
    }
  }
}

- (id)_sepLockInfo
{
  sepLockInfo = self->_sepLockInfo;
  if (!sepLockInfo)
  {
    int v4 = (NSDictionary *)MKBGetDeviceLockStateInfo();
    id v5 = self->_sepLockInfo;
    self->_sepLockInfo = v4;

    sepLockInfo = self->_sepLockInfo;
  }
  return sepLockInfo;
}

- (void)_invalidateSEPLockInfo
{
  self->_sepLockInfo = 0;
  MEMORY[0x1F41817F8]();
}

- (void)_rereadBlockedState
{
  if ([(DevicePINController *)self _useSEPLockInfo])
  {
    [(DevicePINController *)self _invalidateSEPLockInfo];
  }
  else
  {
    int v3 = [(DevicePINController *)self defaultsID];
    CFPreferencesAppSynchronize(v3);
  }
}

- (int64_t)numberOfFailedAttempts
{
  if ([(DevicePINController *)self _useSEPLockInfo])
  {
    int v3 = [(DevicePINController *)self _sepLockInfo];
    int v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F78128]];

    int64_t v5 = [v4 longValue];
    return v5;
  }
  else
  {
    uint64_t v7 = [(DevicePINController *)self failedAttemptsKey];
    id v8 = [(DevicePINController *)self defaultsID];
    return CFPreferencesGetAppIntegerValue(v7, v8, 0);
  }
}

- (void)_setNumberOfFailedAttempts:(int64_t)a3
{
  if ([(DevicePINController *)self _useSEPLockInfo])
  {
    [(DevicePINController *)self _invalidateSEPLockInfo];
  }
  else
  {
    int64_t v5 = [(DevicePINController *)self defaultsID];
    value = [MEMORY[0x1E4F28ED0] numberWithLong:a3];
    CFPreferencesSetAppValue([(DevicePINController *)self failedAttemptsKey], value, v5);
    CFPreferencesAppSynchronize(v5);
  }
}

- (void)_clearBlockedState
{
  if ([(DevicePINController *)self _useSEPLockInfo])
  {
    [(DevicePINController *)self _invalidateSEPLockInfo];
  }
  else
  {
    int v3 = [(DevicePINController *)self defaultsID];
    CFPreferencesSetAppValue([(DevicePINController *)self failedAttemptsKey], 0, v3);
    CFPreferencesSetAppValue([(DevicePINController *)self blockTimeIntervalKey], 0, v3);
    int v4 = [(DevicePINController *)self blockedStateKey];
    CFPreferencesSetAppValue(v4, (CFPropertyListRef)*MEMORY[0x1E4F1CFC8], v3);
    CFPreferencesAppSynchronize(v3);
  }
}

- (double)unblockTime
{
  int v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  if (self->_useSEPLockInfo)
  {
    [(DevicePINController *)self blockedTimeRemaining];
    if (v6 > 0.0)
    {
      double v7 = v6;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      return v7 + v8;
    }
  }
  else
  {
    id v9 = (void *)CFPreferencesCopyAppValue([(DevicePINController *)self blockTimeIntervalKey], [(DevicePINController *)self defaultsID]);
    uint64_t v10 = v9;
    if (v9)
    {
      [v9 doubleValue];
      double v5 = v11;
    }
  }
  return v5;
}

- (double)blockedTimeRemaining
{
  if ([(DevicePINController *)self _useSEPLockInfo])
  {
    [(DevicePINController *)self _invalidateSEPLockInfo];
    int v3 = [(DevicePINController *)self _sepLockInfo];
    double v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F78118]];

    [v4 doubleValue];
    double v6 = v5;

    return v6;
  }
  else
  {
    BOOL v8 = [(DevicePINController *)self useProgressiveDelays];
    double result = 0.0;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", 0.0);
      double v10 = v9;
      [(DevicePINController *)self unblockTime];
      double v12 = v11 - v10;
      BOOL v13 = v10 < v11;
      double result = 0.0;
      if (v13) {
        return v12;
      }
    }
  }
  return result;
}

- (BOOL)isBlocked
{
  [(DevicePINController *)self blockedTimeRemaining];
  return v2 > 0.0;
}

- (void)_setUnblockTime:(double)a3
{
  double v5 = [(DevicePINController *)self defaultsID];
  value = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  CFPreferencesSetAppValue([(DevicePINController *)self blockTimeIntervalKey], value, v5);
  CFPreferencesAppSynchronize(v5);
}

- (double)_secondsToBlockForFailedAttempts:(int64_t)a3
{
  double result = 0.0;
  unint64_t v4 = a3 - 6;
  if (a3 >= 6)
  {
    if (v4 > 2) {
      return 3600.0;
    }
    else {
      return dbl_1A667F570[v4];
    }
  }
  return result;
}

- (void)_adjustUnblockTime
{
  int v3 = [MEMORY[0x1E4F74230] sharedConnection];
  id v9 = [v3 valueRestrictionForFeature:*MEMORY[0x1E4F740B8]];

  if (v9) {
    uint64_t v4 = [v9 longValue];
  }
  else {
    uint64_t v4 = -1;
  }
  int64_t v5 = [(DevicePINController *)self numberOfFailedAttempts];
  [(DevicePINController *)self _setNumberOfFailedAttempts:v5 + 1];
  if (v4 < 0 || v5 < v4)
  {
    [(DevicePINController *)self _secondsToBlockForFailedAttempts:v5 + 1];
    double v6 = v7;
    if (v7 == 0.0) {
      goto LABEL_9;
    }
  }
  else
  {
    double v6 = 3600.0;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [(DevicePINController *)self _setUnblockTime:v6 + v8];
LABEL_9:
}

- (BOOL)attemptValidationWithPIN:(id)a3
{
  BOOL v4 = [(DevicePINController *)self validatePIN:a3];
  if (v4)
  {
    [(DevicePINController *)self _clearBlockedState];
  }
  else if (![(DevicePINController *)self _useSEPLockInfo] {
         && [(DevicePINController *)self useProgressiveDelays])
  }
  {
    [(DevicePINController *)self _adjustUnblockTime];
  }
  return v4;
}

- (void)suspend
{
}

- (void)_showFailedAttempts
{
  int mode = self->_mode;
  if (mode == 2)
  {
    BOOL v4 = self->_substate == 3;
  }
  else
  {
    if (!mode)
    {
      [(DevicePINController *)self useProgressiveDelays];
      goto LABEL_9;
    }
    BOOL v4 = 0;
  }
  BOOL v5 = [(DevicePINController *)self useProgressiveDelays];
  if (!v4 && v5) {
    [(PSEditingPane *)self->super._pane showFailedAttempts:[(DevicePINController *)self numberOfFailedAttempts]];
  }
LABEL_9:
  if ([(DevicePINController *)self isBlocked])
  {
    [(DevicePINController *)self performSelector:sel__updateUI withObject:0 afterDelay:30.0];
  }
}

- (void)_updateErrorTextAndFailureCount:(BOOL)a3
{
  BOOL v4 = [(DevicePINController *)self isBlocked];
  if (!self->_error1)
  {
    BOOL v5 = [(DevicePINController *)self localizedPINStringForKey:@"WRONG_1"];
    error1 = self->_error1;
    self->_error1 = v5;
  }
  HIDWORD(v7) = 0;
  if (!self->_error2)
  {
    id v21 = [(DevicePINController *)self localizedPINStringForKey:@"WRONG_2"];
    error2 = self->_error2;
    self->_error2 = v21;

    if (v4) {
      goto LABEL_5;
    }
LABEL_13:
    id v23 = self->_error2;
    +[DevicePINController cancelPreviousPerformRequestsWithTarget:self];
    goto LABEL_14;
  }
  if (!v4) {
    goto LABEL_13;
  }
LABEL_5:
  [(DevicePINController *)self unblockTime];
  double v9 = v8;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v11 = (v9 - v10) / 60.0;
  float v12 = v11;
  LODWORD(v7) = vcvtps_s32_f32(v12);
  float v13 = (v11 - (double)((int)v7 - 1)) * 60.0;
  id v14 = @"MULTIPLE_MINUTES_TO_UNBLOCK";
  if ((int)v7 <= 1) {
    id v14 = 0;
  }
  if (v7 == 1) {
    uint64_t v15 = @"ONE_MINUTE_TO_UNBLOCK";
  }
  else {
    uint64_t v15 = v14;
  }
  char v16 = NSString;
  id v17 = [(DevicePINController *)self localizedPINStringForKey:v15];
  v18 = (void *)MEMORY[0x1E4F28EE0];
  id v19 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
  uint64_t v20 = [v18 localizedStringFromNumber:v19 numberStyle:1];
  objc_msgSend(v16, "stringWithFormat:", v17, v20);
  id v23 = (NSString *)objc_claimAutoreleasedReturnValue();

  +[DevicePINController cancelPreviousPerformRequestsWithTarget:self];
  if (v13 > 0.0) {
    [(DevicePINController *)self performSelector:sel__updateUI withObject:0 afterDelay:v13];
  }
LABEL_14:
  -[PSEditingPane showError:error:isBlocked:animate:](self->super._pane, "showError:error:isBlocked:animate:", self->_error1);
  if ([(DevicePINController *)self numberOfFailedAttempts] < 1) {
    [(PSEditingPane *)self->super._pane hideFailedAttempts];
  }
  else {
    [(DevicePINController *)self _showFailedAttempts];
  }
}

- (void)_updateUI
{
  [(DevicePINController *)self _updateErrorTextAndFailureCount:1];
  if (![(DevicePINController *)self isBlocked])
  {
    pane = self->super._pane;
    [(PSEditingPane *)pane hideError];
  }
}

- (void)_showUnacceptablePINError:(id)a3 password:(id)a4
{
  id v11 = a3;
  if ([(DevicePINController *)self validatePIN:a4])
  {
    uint64_t v6 = [(DevicePINController *)self localizedPINStringForKey:@"CANNOT_REUSE_PASSCODE"];
LABEL_5:
    double v9 = (void *)v6;
    goto LABEL_7;
  }
  uint64_t v7 = [v11 domain];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F741E0]];

  if (v8)
  {
    uint64_t v6 = [v11 localizedDescription];
    goto LABEL_5;
  }
  double v10 = [MEMORY[0x1E4F74230] sharedConnection];
  double v9 = [v10 localizedDescriptionOfCurrentPasscodeConstraints];

LABEL_7:
  [(PSEditingPane *)self->super._pane setPINPolicyString:v9 visible:1];
}

- (void)_showPINConfirmationError
{
  id v3 = [(DevicePINController *)self localizedPINStringForKey:@"CONFIRMATION_FAILURE"];
  [(PSEditingPane *)self->super._pane setPINPolicyString:v3 visible:1];
}

- (BOOL)showSimplePINCancelButtonOnLeft
{
  return 0;
}

- (void)optionsTapped
{
  id v2 = [(PSEditingPane *)self->super._pane pinView];
  [v2 optionsButtonTapped];
}

- (void)setPinBlocked:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PSEditingPane *)self->super._pane pinView];
  [v4 setBlocked:v3];
}

- (void)deactivateKeypad
{
  [(PSEditingPane *)self->super._pane resignFirstResponder];
  [(PSEditingPane *)self->super._pane dismissKeypad];
  [(DevicePINController *)self setPinBlocked:1];
}

- (void)_updatePINButtons
{
  if (!self->_hidesNavigationButtons)
  {
    id v21 = self->super._pane;
    BOOL v3 = [(PSEditingPane *)v21 password];
    uint64_t v4 = [v3 length];

    BOOL v5 = [(DevicePINController *)self navigationItem];
    if (!self->_cancelButton && !self->_hidesCancelButton)
    {
      uint64_t v6 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonTapped];
      cancelButton = self->_cancelButton;
      self->_cancelButton = v6;
    }
    if ([(DevicePINController *)self simplePIN])
    {
      if ([(DevicePINController *)self showSimplePINCancelButtonOnLeft])
      {
        [v5 setLeftBarButtonItem:self->_cancelButton];
        int v8 = v5;
        double v9 = 0;
      }
      else
      {
        [v5 setLeftBarButtonItem:0];
        double v9 = self->_cancelButton;
        int v8 = v5;
      }
      [v8 setRightBarButtonItem:v9];
    }
    else
    {
      switch(self->_mode)
      {
        case 0:
          if (self->_substate == 2) {
            goto LABEL_15;
          }
          goto LABEL_10;
        case 1:
        case 3:
          goto LABEL_15;
        case 2:
          if (self->_substate != 3) {
            goto LABEL_10;
          }
LABEL_15:
          p_doneButton = &self->_doneButton;
          doneButton = self->_doneButton;
          if (doneButton) {
            goto LABEL_20;
          }
          float v13 = self->_doneButtonTitle;
          if (!v13)
          {
            PS_LocalizedStringForPINEntry(@"DONE");
            float v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          }
          id v15 = objc_alloc(MEMORY[0x1E4F427C0]);
          pane = self->super._pane;
          char v16 = v13;
          uint64_t v17 = 2;
          break;
        default:
LABEL_10:
          p_doneButton = &self->_nextButton;
          doneButton = self->_nextButton;
          if (doneButton) {
            goto LABEL_20;
          }
          id v12 = objc_alloc(MEMORY[0x1E4F427C0]);
          PS_LocalizedStringForPINEntry(@"NEXT");
          float v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          pane = self->super._pane;
          id v15 = v12;
          char v16 = v13;
          uint64_t v17 = 0;
          break;
      }
      uint64_t v18 = [v15 initWithTitle:v16 style:v17 target:pane action:sel_okButtonPressed];
      id v19 = *p_doneButton;
      *p_doneButton = (UIBarButtonItem *)v18;

      doneButton = *p_doneButton;
LABEL_20:
      [v5 setRightBarButtonItem:doneButton];
      [v5 setLeftBarButtonItem:self->_cancelButton];
      BOOL v20 = v4 != 0;
      [(UIBarButtonItem *)self->_nextButton setEnabled:v20];
      [(UIBarButtonItem *)self->_doneButton setEnabled:v20];
    }
  }
}

- (void)adjustButtonsForPasswordLength:(unint64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__DevicePINController_adjustButtonsForPasswordLength___block_invoke;
  block[3] = &unk_1E5C5D680;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__DevicePINController_adjustButtonsForPasswordLength___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePINButtons];
}

- (BOOL)completedInputIsValid:(id)a3
{
  return 1;
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)DevicePINController;
  [(PSDetailController *)&v4 loadView];
  BOOL v3 = [(DevicePINController *)self view];
  [v3 setAutoresizingMask:18];
}

- (void)viewWillLayoutSubviews
{
  BOOL v3 = [(PSViewController *)self parentController];
  objc_super v4 = [v3 popoverPresentationController];

  if (v4)
  {
    [(DevicePINController *)self overallContentSizeForViewInPopover];
    double v6 = v5;
    double v8 = v7;
    pane = self->super._pane;
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    -[PSEditingPane setFrame:](pane, "setFrame:", v10, v11, v6, v8);
  }
}

- (void)_slidePasscodeFieldLeft:(BOOL)a3
{
  int v3 = a3;
  double v5 = [(PSViewController *)self parentController];
  double v6 = [v5 popoverPresentationController];

  if (v6)
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    [(DevicePINController *)self overallContentSizeForViewInPopover];
    double v10 = v9;
    double v12 = v11;
    -[PSEditingPane setFrame:](self->super._pane, "setFrame:", v7, v8, v9, v11);
    -[DevicePINController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v12);
    float v13 = [(DevicePINController *)self navigationController];
    objc_msgSend(v13, "setPreferredContentSize:", v10, v12);
  }
  id v14 = [(DevicePINController *)self pinPane];
  objc_msgSend(v14, "setPINLength:", -[DevicePINController pinLength](self, "pinLength"));

  id v15 = [(DevicePINController *)self pinPane];
  int v16 = [v15 _shouldReverseLayoutDirection];

  if (v16 != v3) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = 2;
  }
  uint64_t v18 = [(DevicePINController *)self pinPane];
  objc_msgSend(v18, "slideToNewPasscodeField:requiresKeyboard:numericOnly:transition:showsOptionsButton:", -[DevicePINController simplePIN](self, "simplePIN"), -[DevicePINController requiresKeyboard](self, "requiresKeyboard"), -[DevicePINController isNumericPIN](self, "isNumericPIN"), v17, -[DevicePINController _shouldShowOptionsButton](self, "_shouldShowOptionsButton"));

  [(DevicePINController *)self _updatePINButtons];
}

- (BOOL)_asyncSetPinCompatible
{
  return 0;
}

- (void)pinEntered:(id)a3
{
  id v4 = a3;
  if (![(DevicePINController *)self isBlocked])
  {
    double v5 = (void *)[v4 copy];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__DevicePINController_pinEntered___block_invoke;
    v6[3] = &unk_1E5C5DDD0;
    v6[4] = self;
    id v4 = v5;
    id v7 = v4;
    [(DevicePINController *)self _preflightPasswordForWeakness:v4 withCompletion:v6];
  }
}

void __34__DevicePINController_pinEntered___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  switch(*(_DWORD *)(v2 + 1032))
  {
    case 0:
      int v3 = *(_DWORD *)(v2 + 1036);
      if (v3 == 2)
      {
        if (![*(id *)(a1 + 40) isEqualToString:*(void *)(v2 + 1048)]
          || ![*(id *)(a1 + 32) completedInputIsValid:*(void *)(a1 + 40)])
        {
          [*(id *)(a1 + 32) setLastEntry:0];
          uint64_t v37 = *(void *)(a1 + 32);
          int v38 = 1;
          goto LABEL_46;
        }
        objc_initWeak(&buf, *(id *)(a1 + 32));
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __34__DevicePINController_pinEntered___block_invoke_2;
        v49[3] = &unk_1E5C5DB58;
        objc_copyWeak(&v51, &buf);
        id v50 = *(id *)(a1 + 40);
        char v26 = (void (**)(void, void, void))MEMORY[0x1AD0BE2A0](v49);
        if (([*(id *)(a1 + 32) isMemberOfClass:objc_opt_class()] & 1) != 0
          || [*(id *)(a1 + 32) _asyncSetPinCompatible])
        {
          [*(id *)(a1 + 32) setPIN:*(void *)(a1 + 40) completion:v26];
        }
        else
        {
          [*(id *)(a1 + 32) setPIN:*(void *)(a1 + 40)];
          v26[2](v26, 1, 0);
        }

        objc_destroyWeak(&v51);
        objc_destroyWeak(&buf);
      }
      else if (v3 == 1)
      {
        uint64_t v4 = *(void *)(a1 + 40);
        id v52 = 0;
        int v5 = [(id)v2 pinIsAcceptable:v4 outError:&v52];
        id v6 = v52;
        id v7 = *(void **)(a1 + 32);
        if (v5)
        {
          [v7 setLastEntry:*(void *)(a1 + 40)];
          ++*(_DWORD *)(*(void *)(a1 + 32) + 1036);
          [*(id *)(a1 + 32) _slidePasscodeFieldLeft:1];
        }
        else
        {
          [v7 _showUnacceptablePINError:v6 password:*(void *)(a1 + 40)];
        }
      }
      return;
    case 1:
      if (![(id)v2 attemptValidationWithPIN:*(void *)(a1 + 40)]
        || ![*(id *)(a1 + 32) completedInputIsValid:*(void *)(a1 + 40)])
      {
        goto LABEL_51;
      }
      double v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      [v8 _removePinWithOldPassword:v9];
      return;
    case 2:
      int v10 = *(_DWORD *)(v2 + 1036);
      switch(v10)
      {
        case 3:
          if ([*(id *)(a1 + 40) isEqualToString:*(void *)(v2 + 1048)]
            && [*(id *)(a1 + 32) completedInputIsValid:*(void *)(a1 + 40)])
          {
            uint64_t v27 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
            [v27 addObject:*(void *)(a1 + 32)];
            uint64_t v42 = MEMORY[0x1E4F143A8];
            uint64_t v43 = 3221225472;
            v44 = __34__DevicePINController_pinEntered___block_invoke_184;
            v45 = &unk_1E5C5DE98;
            id v28 = v27;
            id v46 = v28;
            id v47 = *(id *)(a1 + 40);
            uint64_t v29 = (void (**)(void, void, void))MEMORY[0x1AD0BE2A0](&v42);
            int v30 = objc_msgSend(*(id *)(a1 + 32), "isMemberOfClass:", objc_opt_class(), v42, v43, v44, v45);
            v31 = *(void **)(a1 + 32);
            uint64_t v32 = *(void *)(a1 + 40);
            if (v30)
            {
              [v31 setPIN:v32 completion:v29];
            }
            else
            {
              [v31 setPIN:v32];
              v29[2](v29, 1, 0);
            }
          }
          else
          {
            [*(id *)(a1 + 32) setLastEntry:0];
            uint64_t v37 = *(void *)(a1 + 32);
            int v38 = 2;
LABEL_46:
            *(_DWORD *)(v37 + 1036) = v38;
            [*(id *)(a1 + 32) _slidePasscodeFieldLeft:0];
            v39 = *(void **)(a1 + 32);
            [v39 _showPINConfirmationError];
          }
          break;
        case 2:
          uint64_t v33 = *(void *)(a1 + 40);
          id v48 = 0;
          int v34 = [(id)v2 pinIsAcceptable:v33 outError:&v48];
          id v35 = v48;
          v36 = *(void **)(a1 + 32);
          if (v34)
          {
            [v36 setLastEntry:*(void *)(a1 + 40)];
            ++*(_DWORD *)(*(void *)(a1 + 32) + 1036);
            [*(id *)(a1 + 32) _slidePasscodeFieldLeft:1];
          }
          else
          {
            [v36 _showUnacceptablePINError:v35 password:*(void *)(a1 + 40)];
          }

          break;
        case 1:
          int v11 = [(id)v2 attemptValidationWithPIN:*(void *)(a1 + 40)];
          double v12 = *(_DWORD **)(a1 + 32);
          if (v11)
          {
            ++v12[259];
            [*(id *)(a1 + 32) setOldPassword:*(void *)(a1 + 40)];
            float v13 = *(void **)(a1 + 32);
            [v13 _slidePasscodeFieldLeft:1];
          }
          else
          {
            [v12 setLastEntry:0];
LABEL_51:
            v40 = *(void **)(a1 + 32);
            [v40 _updateErrorTextAndFailureCount:1];
          }
          break;
      }
      return;
    case 3:
      if ([(id)v2 attemptValidationWithPIN:*(void *)(a1 + 40)]
        && [*(id *)(a1 + 32) completedInputIsValid:*(void *)(a1 + 40)])
      {
        id v14 = _PSLoggingFacility();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A6597000, v14, OS_LOG_TYPE_DEFAULT, "Succeeded passcode entry", (uint8_t *)&buf, 2u);
        }

        [*(id *)(*(void *)(a1 + 32) + 1024) hideFailedAttempts];
        [*(id *)(a1 + 32) setSuccess:1];
        [*(id *)(a1 + 32) setOldPassword:*(void *)(a1 + 40)];
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1064));
        if (WeakRetained)
        {
          id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1064));
          char v17 = objc_opt_respondsToSelector();

          if (v17)
          {
            id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1064));
            [v18 willAcceptEnteredPIN];
          }
        }
        [*(id *)(a1 + 32) performActionAfterPINEntry];
        id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1064));

        if (!v19) {
          goto LABEL_58;
        }
        id v20 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1064));
        char v21 = objc_opt_respondsToSelector();

        id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1064));
        id v23 = v22;
        if (v21)
        {
          [v22 didAcceptEnteredPIN:*(void *)(*(void *)(a1 + 32) + 1040)];
        }
        else
        {
          char v41 = objc_opt_respondsToSelector();

          if ((v41 & 1) == 0)
          {
LABEL_58:
            [*(id *)(a1 + 32) _dismiss];
            return;
          }
          id v23 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1064));
          [v23 didAcceptEnteredPIN];
        }

        goto LABEL_58;
      }
      [*(id *)(a1 + 32) _updateErrorTextAndFailureCount:1];
      uint64_t v24 = _PSLoggingFacility();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = [*(id *)(a1 + 32) numberOfFailedAttempts];
        LODWORD(buf) = 67109120;
        HIDWORD(buf) = v25;
        _os_log_impl(&dword_1A6597000, v24, OS_LOG_TYPE_DEFAULT, "Failed passcode entry, attempts = %i", (uint8_t *)&buf, 8u);
      }

      return;
    default:
      return;
  }
}

void __34__DevicePINController_pinEntered___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setSuccess:1];
    double v8 = [v7 pane];
    [v8 hideFailedAttempts];

    [v7 _dismiss];
    [v7 performActionAfterPINSet];
    if (a2)
    {
      uint64_t v9 = [v7 pinDelegate];
      char v10 = objc_opt_respondsToSelector();

      int v11 = [v7 pinDelegate];
      double v12 = v11;
      if (v10)
      {
        [v11 devicePINController:v7 didAcceptSetPIN:*(void *)(a1 + 32)];

        goto LABEL_12;
      }
      char v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) == 0) {
        goto LABEL_12;
      }
      id v16 = [v7 pinDelegate];
      [v16 didAcceptSetPIN];
LABEL_11:

      goto LABEL_12;
    }
    float v13 = _PSLoggingFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v5;
      _os_log_impl(&dword_1A6597000, v13, OS_LOG_TYPE_DEFAULT, "Failed to set passcode with error: %@", (uint8_t *)&v18, 0xCu);
    }

    id v14 = [v7 pinDelegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = [v7 pinDelegate];
      [v16 devicePINController:v7 didFailToSetPinWithError:v5];
      goto LABEL_11;
    }
  }
LABEL_12:
}

void __34__DevicePINController_pinEntered___block_invoke_184(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = a3;
  uint64_t v4 = [*(id *)(a1 + 32) anyObject];
  [v4 setOldPassword:0];
  [v4 setSuccess:1];
  id v5 = [v4 pane];
  [v5 hideFailedAttempts];

  if (v13
    && ([v4 pinDelegate],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        (v7 & 1) != 0))
  {
    double v8 = [v4 pinDelegate];
    [v8 devicePINController:v4 didFailToChangePinWithError:v13];
  }
  else
  {
    uint64_t v9 = [v4 pinDelegate];
    char v10 = objc_opt_respondsToSelector();

    int v11 = [v4 pinDelegate];
    double v8 = v11;
    if (v10)
    {
      [v11 devicePINController:v4 didAcceptChangedPIN:*(void *)(a1 + 40)];
    }
    else
    {
      char v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0) {
        goto LABEL_9;
      }
      double v8 = [v4 pinDelegate];
      [v8 didAcceptChangedPIN];
    }
  }

LABEL_9:
  [v4 _dismiss];
}

- (void)_removePinWithOldPassword:(id)a3
{
  [(DevicePINController *)self setOldPassword:a3];
  uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  [v4 addObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__DevicePINController__removePinWithOldPassword___block_invoke;
  v7[3] = &unk_1E5C5E6B0;
  id v5 = v4;
  id v8 = v5;
  id v6 = (void (**)(void, void, void))MEMORY[0x1AD0BE2A0](v7);
  if ([(DevicePINController *)self isMemberOfClass:objc_opt_class()])
  {
    [(DevicePINController *)self setPIN:0 completion:v6];
  }
  else
  {
    [(DevicePINController *)self setPIN:0];
    v6[2](v6, 1, 0);
  }
}

void __49__DevicePINController__removePinWithOldPassword___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) anyObject];
  [v7 setSuccess:1];
  [v7 performActionAfterPINRemove];
  uint64_t v1 = [v7 pinDelegate];
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    int v3 = [v7 pinDelegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [v7 pinDelegate];
      [v5 didAcceptRemovePIN];
    }
  }
  id v6 = [v7 pane];
  [v6 hideFailedAttempts];

  [v7 _dismiss];
}

- (void)_preflightPasswordForWeakness:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([(DevicePINController *)self _shouldCheckForWeakness]
    && ([(DevicePINController *)self pinDelegate],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) != 0))
  {
    id v19 = 0;
    BOOL v10 = [(DevicePINController *)self pinIsAcceptable:v6 outError:&v19];
    id v11 = v19;
    if (v10
      || ([(DevicePINController *)self pinDelegate],
          char v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = objc_opt_respondsToSelector(),
          v12,
          (v13 & 1) == 0))
    {
      char v15 = [(DevicePINController *)self pinDelegate];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __68__DevicePINController__preflightPasswordForWeakness_withCompletion___block_invoke_2;
      v16[3] = &unk_1E5C60018;
      v16[4] = self;
      char v17 = v7;
      [v15 devicePINController:self shouldAcceptPIN:v6 withCompletion:v16];
    }
    else
    {
      id v14 = [(DevicePINController *)self pinDelegate];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __68__DevicePINController__preflightPasswordForWeakness_withCompletion___block_invoke;
      v18[3] = &unk_1E5C5FFF0;
      void v18[4] = self;
      [v14 showWeakWarningAlertForController:self offerUseAnyway:0 withCompletion:v18];
    }
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

uint64_t __68__DevicePINController__preflightPasswordForWeakness_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1024) clearPassword];
}

uint64_t __68__DevicePINController__preflightPasswordForWeakness_withCompletion___block_invoke_2(uint64_t a1, int a2)
{
  if (!a2) {
    return [*(id *)(*(void *)(a1 + 32) + 1024) clearPassword];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_shouldCheckForWeakness
{
  int mode = self->_mode;
  if (mode == 2) {
    return self->_substate == mode;
  }
  if (!mode)
  {
    int mode = 1;
    return self->_substate == mode;
  }
  return 0;
}

- (void)cancelButtonTapped
{
  [(DevicePINController *)self setOldPassword:0];
  p_pinDelegate = &self->_pinDelegate;
  id WeakRetained = objc_loadWeakRetained(&self->_pinDelegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained(&self->_pinDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained(&self->_pinDelegate);
      [v8 willCancelEnteringPIN];
    }
  }
  [(DevicePINController *)self setSuccess:0];
  [(DevicePINController *)self _dismiss];
  id v9 = objc_loadWeakRetained(&self->_pinDelegate);
  if (v9)
  {
    BOOL v10 = v9;
    id v11 = objc_loadWeakRetained(p_pinDelegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained(p_pinDelegate);
      [v13 didCancelEnteringPIN];
    }
  }
}

- (id)pinInstructionsPrompt
{
  uint64_t mode = self->_mode;
  if (mode > 3)
  {
    char v4 = &stru_1EFB51FD0;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", off_1E5C60060[mode], self->_substate);
    char v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v5 = [(DevicePINController *)self localizedPINStringForKey:v4];

  return v5;
}

- (id)pinInstructionsPromptFont
{
  return (id)[MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DevicePINController;
  [(PSDetailController *)&v6 viewWillAppear:a3];
  char v4 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_msgSend(v4, "sf_isiPhone"))
  {

LABEL_4:
    [(PSEditingPane *)self->super._pane becomeFirstResponder];
    goto LABEL_5;
  }
  BOOL v5 = [(DevicePINController *)self simplePIN];

  if (v5) {
    goto LABEL_4;
  }
LABEL_5:
  self->_hasBeenDismissed = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DevicePINController;
  [(PSDetailController *)&v4 viewDidAppear:a3];
  if (PSUsePadStylePIN()) {
    [(PSEditingPane *)self->super._pane becomeFirstResponder];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DevicePINController;
  [(PSDetailController *)&v4 viewWillDisappear:a3];
  [(PSEditingPane *)self->super._pane resignFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DevicePINController;
  [(PSViewController *)&v7 viewDidDisappear:a3];
  if (!self->_hasBeenDismissed)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_pinDelegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained(&self->_pinDelegate);
      [v6 devicePINControllerDidDismissPINPane:self];
    }
  }
}

- (BOOL)_shouldShowOptionsButton
{
  int mode = self->_mode;
  if (mode == 2)
  {
    if (!self->_allowOptionsButton || self->_substate != 2) {
      goto LABEL_13;
    }
  }
  else if (mode || self->_substate != 1 || !self->_allowOptionsButton)
  {
    goto LABEL_13;
  }
  char v5 = [(DevicePINController *)self passcodeOptionsAlertController];
  id v6 = [v5 actions];
  unint64_t v7 = [v6 count];

  if (v7 > 1) {
    return 1;
  }
LABEL_13:
  id v9 = [(DevicePINController *)self passcodeOptionsTitle];
  if (v9)
  {
    BOOL v10 = [(DevicePINController *)self passcodeOptionsHandler];
    BOOL v8 = v10 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_setPINPaneToSimple:(BOOL)a3 simpleLength:(int)a4 numeric:(BOOL)a5 requiresKeyboard:(int)a6
{
  BOOL v6 = a5;
  BOOL v7 = a3;
  [(DevicePINController *)self setPinLength:*(void *)&a4];
  id v9 = [(DevicePINController *)self pinPane];
  objc_msgSend(v9, "setPINLength:", -[DevicePINController pinLength](self, "pinLength"));

  [(DevicePINController *)self setSimplePIN:v7];
  [(DevicePINController *)self setNumericPIN:v6];
  BOOL v10 = [(DevicePINController *)self pinPane];
  objc_msgSend(v10, "slideToNewPasscodeField:requiresKeyboard:numericOnly:transition:showsOptionsButton:", -[DevicePINController simplePIN](self, "simplePIN"), -[DevicePINController requiresKeyboard](self, "requiresKeyboard"), -[DevicePINController isNumericPIN](self, "isNumericPIN"), 6, -[DevicePINController _shouldShowOptionsButton](self, "_shouldShowOptionsButton"));

  [(DevicePINController *)self _updatePINButtons];
}

- (id)passcodeOptionsAlertController
{
  int v26 = 0;
  int v3 = [MEMORY[0x1E4F74230] sharedConnection];
  int v4 = [v3 minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:&v26];

  char v5 = [MEMORY[0x1E4F42728] alertControllerWithTitle:0 message:0 preferredStyle:0];
  if ([(DevicePINController *)self isNumericPIN])
  {
    BOOL v6 = (void *)MEMORY[0x1E4F42720];
    BOOL v7 = PS_LocalizedStringForPINEntry(@"CUSTOM_ALPHANUMERIC_CODE");
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __53__DevicePINController_passcodeOptionsAlertController__block_invoke;
    v25[3] = &unk_1E5C5DAE8;
    v25[4] = self;
    BOOL v8 = [v6 actionWithTitle:v7 style:0 handler:v25];
    [v5 addAction:v8];
  }
  if (v4 != 2)
  {
    if (![(DevicePINController *)self isNumericPIN]
      || [(DevicePINController *)self simplePIN])
    {
      id v9 = (void *)MEMORY[0x1E4F42720];
      BOOL v10 = PS_LocalizedStringForPINEntry(@"CUSTOM_NUMERIC_CODE");
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __53__DevicePINController_passcodeOptionsAlertController__block_invoke_2;
      v24[3] = &unk_1E5C5DAE8;
      v24[4] = self;
      id v11 = [v9 actionWithTitle:v10 style:0 handler:v24];
      [v5 addAction:v11];
    }
    if (!v4)
    {
      if (![(DevicePINController *)self simplePIN]
        || [(DevicePINController *)self pinLength] != 6)
      {
        char v12 = (void *)MEMORY[0x1E4F42720];
        id v13 = PS_LocalizedStringForPINEntry(@"6_DIGIT_CODE");
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __53__DevicePINController_passcodeOptionsAlertController__block_invoke_3;
        v23[3] = &unk_1E5C5DAE8;
        v23[4] = self;
        id v14 = [v12 actionWithTitle:v13 style:0 handler:v23];
        [v5 addAction:v14];
      }
      if (v26 != 1
        && (![(DevicePINController *)self simplePIN]
         || [(DevicePINController *)self pinLength] != 4))
      {
        char v15 = (void *)MEMORY[0x1E4F42720];
        id v16 = PS_LocalizedStringForPINEntry(@"4_DIGIT_CODE");
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __53__DevicePINController_passcodeOptionsAlertController__block_invoke_4;
        v22[3] = &unk_1E5C5DAE8;
        v22[4] = self;
        char v17 = [v15 actionWithTitle:v16 style:0 handler:v22];
        [v5 addAction:v17];
      }
    }
  }
  int v18 = (void *)MEMORY[0x1E4F42720];
  id v19 = PS_LocalizedStringForPINEntry(@"CANCEL");
  uint64_t v20 = [v18 actionWithTitle:v19 style:1 handler:0];
  [v5 addAction:v20];

  return v5;
}

uint64_t __53__DevicePINController_passcodeOptionsAlertController__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 requiresKeyboard];
  return [v1 _setPINPaneToSimple:0 simpleLength:0 numeric:0 requiresKeyboard:v2];
}

uint64_t __53__DevicePINController_passcodeOptionsAlertController__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 requiresKeyboard];
  return [v1 _setPINPaneToSimple:0 simpleLength:0 numeric:1 requiresKeyboard:v2];
}

uint64_t __53__DevicePINController_passcodeOptionsAlertController__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 requiresKeyboard];
  return [v1 _setPINPaneToSimple:1 simpleLength:6 numeric:1 requiresKeyboard:v2];
}

uint64_t __53__DevicePINController_passcodeOptionsAlertController__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 requiresKeyboard];
  return [v1 _setPINPaneToSimple:1 simpleLength:4 numeric:1 requiresKeyboard:v2];
}

- (void)showPasscodeOptions:(id)a3
{
  id v6 = a3;
  int v4 = [(DevicePINController *)self passcodeOptionsAlertController];
  if (PSUsePadStylePIN())
  {
    [v4 setModalPresentationStyle:7];
    char v5 = [v4 popoverPresentationController];
    [v5 setSourceView:v6];
    [v6 bounds];
    objc_msgSend(v5, "setSourceRect:");
  }
  [(DevicePINController *)self presentViewController:v4 animated:1 completion:0];
}

- (id)pinPane
{
  return self->super._pane;
}

- (void)setPane:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DevicePINController;
  [(PSDetailController *)&v15 setPane:v4];
  self->_substate = 1;
  [(DevicePINController *)self setSuccess:0];
  if (self->_mode == 1000)
  {
    char v5 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"mode"];
    self->_int mode = [v5 intValue];

    id v6 = [(DevicePINController *)self title];
    [(DevicePINController *)self setTitle:v6];
  }
  BOOL v7 = [(DevicePINController *)self passcodeOptionsHandler];
  if (v7)
  {
    [v4 setPasscodeOptionsHandler:v7];
  }
  else if (self->_allowOptionsButton)
  {
    objc_initWeak(&location, self);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __31__DevicePINController_setPane___block_invoke;
    char v12 = &unk_1E5C60040;
    objc_copyWeak(&v13, &location);
    [v4 setPasscodeOptionsHandler:&v9];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  BOOL v8 = [(DevicePINController *)self passcodeOptionsTitle];
  [v4 setPasscodeOptionsTitle:v8];

  objc_msgSend(v4, "setPINLength:", -[DevicePINController pinLength](self, "pinLength"));
  objc_msgSend(v4, "setSimplePIN:requiresKeyboard:numericOnly:showsOptions:", -[DevicePINController simplePIN](self, "simplePIN"), -[DevicePINController requiresKeyboard](self, "requiresKeyboard"), -[DevicePINController isNumericPIN](self, "isNumericPIN"), -[DevicePINController _shouldShowOptionsButton](self, "_shouldShowOptionsButton"));
  if ([(DevicePINController *)self isBlocked])
  {
    [(DevicePINController *)self _updateErrorTextAndFailureCount:0];
  }
  else if ([(DevicePINController *)self numberOfFailedAttempts])
  {
    [(DevicePINController *)self _showFailedAttempts];
  }
  [(DevicePINController *)self _updatePINButtons];
}

void __31__DevicePINController_setPane___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained showPasscodeOptions:v3];
}

- (id)titleString
{
  uint64_t mode = self->_mode;
  if (mode > 3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(DevicePINController *)self localizedPINStringForKey:off_1E5C60080[mode]];
  }
  return v3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (DevicePINControllerDelegate)pinDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_pinDelegate);
  return (DevicePINControllerDelegate *)WeakRetained;
}

- (void)setPinDelegate:(id)a3
{
}

- (BOOL)hidesNavigationButtons
{
  return self->_hidesNavigationButtons;
}

- (void)setHidesNavigationButtons:(BOOL)a3
{
  self->_hidesNavigationButtons = a3;
}

- (BOOL)hidesCancelButton
{
  return self->_hidesCancelButton;
}

- (void)setHidesCancelButton:(BOOL)a3
{
  self->_hidesCancelButton = a3;
}

- (BOOL)shouldDismissWhenDone
{
  return self->_shouldDismissWhenDone;
}

- (void)setShouldDismissWhenDone:(BOOL)a3
{
  self->_shouldDismissWhenDone = a3;
}

- (NSString)doneButtonTitle
{
  return self->_doneButtonTitle;
}

- (void)setDoneButtonTitle:(id)a3
{
}

- (BOOL)allowOptionsButton
{
  return self->_allowOptionsButton;
}

- (void)setAllowOptionsButton:(BOOL)a3
{
  self->_allowOptionsButton = a3;
}

- (NSString)passcodeOptionsTitle
{
  return self->_passcodeOptionsTitle;
}

- (void)setPasscodeOptionsTitle:(id)a3
{
}

- (id)passcodeOptionsHandler
{
  return self->_passcodeOptionsHandler;
}

- (void)setPasscodeOptionsHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_passcodeOptionsHandler, 0);
  objc_storeStrong((id *)&self->_passcodeOptionsTitle, 0);
  objc_storeStrong((id *)&self->_doneButtonTitle, 0);
  objc_storeStrong((id *)&self->_numericPIN, 0);
  objc_storeStrong((id *)&self->_simplePIN, 0);
  objc_storeStrong((id *)&self->_pinLength, 0);
  objc_storeStrong((id *)&self->_requiresKeyboard, 0);
  objc_storeStrong((id *)&self->_sepLockInfo, 0);
  objc_storeStrong((id *)&self->_error2, 0);
  objc_storeStrong((id *)&self->_error1, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_destroyWeak(&self->_pinDelegate);
  objc_storeStrong((id *)&self->_lastEntry, 0);
  objc_storeStrong((id *)&self->_oldPassword, 0);
}

@end