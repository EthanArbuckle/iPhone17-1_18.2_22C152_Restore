@interface KeychainSyncDevicePINController
- (KeychainSyncDevicePINController)init;
- (NSString)enterPasscodeReason;
- (NSString)enterPasscodeTitle;
- (UIKeyboard)disabledKeyboard;
- (id)specifiers;
- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4;
- (void)dealloc;
- (void)didFinishEnteringText:(id)a3;
- (void)setDisabledKeyboard:(id)a3;
- (void)setEnterPasscodeReason:(id)a3;
- (void)setEnterPasscodeTitle:(id)a3;
- (void)updateBlockedState:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation KeychainSyncDevicePINController

- (KeychainSyncDevicePINController)init
{
  v8.receiver = self;
  v8.super_class = (Class)KeychainSyncDevicePINController;
  v2 = [(PSKeychainSyncTextEntryController *)&v8 init];
  if (v2)
  {
    BOOL v7 = 0;
    PSIsUsingPasscode(&v7);
    if (v7) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    [(PSKeychainSyncTextEntryController *)v2 setTextEntryType:v3];
    [(PSKeychainSyncTextEntryController *)v2 setSecureTextEntry:1];
    v4 = objc_alloc_init(DevicePINController);
    devicePINController = v2->_devicePINController;
    v2->_devicePINController = v4;

    [(DevicePINController *)v2->_devicePINController setMode:3];
    [(PSKeychainSyncTextEntryController *)v2 setNumberOfPasscodeFields:[(DevicePINController *)v2->_devicePINController pinLength]];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  +[KeychainSyncDevicePINController cancelPreviousPerformRequestsWithTarget:self];
  v4.receiver = self;
  v4.super_class = (Class)KeychainSyncDevicePINController;
  [(PSKeychainSyncTextEntryController *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_updateBlockedState_ name:*MEMORY[0x1E4F43AC8] object:0];

  v6.receiver = self;
  v6.super_class = (Class)KeychainSyncDevicePINController;
  [(PSKeychainSyncTextEntryController *)&v6 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIKeyboard *)self->_disabledKeyboard setUserInteractionEnabled:1];
  [(KeychainSyncDevicePINController *)self setDisabledKeyboard:0];
  +[KeychainSyncDevicePINController cancelPreviousPerformRequestsWithTarget:self];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F43AC8] object:0];

  v6.receiver = self;
  v6.super_class = (Class)KeychainSyncDevicePINController;
  [(PSKeychainSyncTextEntryController *)&v6 viewWillDisappear:v3];
}

- (void)updateBlockedState:(id)a3
{
  BOOL v4 = [(DevicePINController *)self->_devicePINController isBlocked];
  id v7 = [MEMORY[0x1E4F42B08] activeKeyboard];
  [v7 setUserInteractionEnabled:!v4];
  if (v4) {
    id v5 = v7;
  }
  else {
    id v5 = 0;
  }
  [(KeychainSyncDevicePINController *)self setDisabledKeyboard:v5];
  if (!v4 && self->_showingBlockedMessage)
  {
    UIKeyboardDisableAutomaticAppearance();
    [(PSListController *)self reloadSpecifiers];
    UIKeyboardEnableAutomaticAppearance();
    objc_super v6 = [(PSKeychainSyncTextEntryController *)self textEntryView];
    [v6 becomeFirstResponder];
  }
}

- (id)specifiers
{
  BOOL v3 = [(KeychainSyncDevicePINController *)self navigationItem];
  BOOL v4 = PS_LocalizedStringForKeychainSync(@"ENTER_PASSCODE");
  [v3 setTitle:v4];

  v30.receiver = self;
  v30.super_class = (Class)KeychainSyncDevicePINController;
  id v5 = [(PSKeychainSyncTextEntryController *)&v30 specifiers];
  objc_super v6 = [(PSKeychainSyncViewController *)self headerView];
  id v7 = [(KeychainSyncDevicePINController *)self enterPasscodeTitle];
  [v6 setDetailText:v7];

  self->_showingBlockedMessage = 0;
  BOOL v8 = [(DevicePINController *)self->_devicePINController isBlocked];
  devicePINController = self->_devicePINController;
  if (v8)
  {
    [(DevicePINController *)devicePINController unblockTime];
    double v11 = v10;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v13 = (v11 - v12) / 60.0;
    *(float *)&double v12 = v13;
    LODWORD(v6) = vcvtps_s32_f32(*(float *)&v12);
    int v14 = v6 - 1;
    if (v6 == 1) {
      v15 = @"UNBLOCK_MINUTES_SINGLE";
    }
    else {
      v15 = @"UNBLOCK_MINUTES_PLURAL";
    }
    v16 = PS_LocalizedStringForKeychainSync(v15);
    v17 = NSString;
    v18 = (void *)MEMORY[0x1E4F28EE0];
    v19 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
    v20 = [v18 localizedStringFromNumber:v19 numberStyle:1];
    v21 = objc_msgSend(v17, "stringWithFormat:", v16, v20);

    self->_showingBlockedMessage = 1;
    float v22 = (v13 - (double)v14) * 60.0;
    if (v22 > 0.0) {
      [(KeychainSyncDevicePINController *)self performSelector:sel_updateBlockedState_ withObject:0 afterDelay:v22];
    }
    goto LABEL_12;
  }
  if ([(DevicePINController *)devicePINController numberOfFailedAttempts] >= 1)
  {
    if ([(DevicePINController *)self->_devicePINController numberOfFailedAttempts] == 1) {
      v23 = @"PASSCODE_INCORRECT_SINGLE";
    }
    else {
      v23 = @"PASSCODE_INCORRECT_PLURAL";
    }
    v16 = PS_LocalizedStringForKeychainSync(v23);
    v24 = NSString;
    v25 = (void *)MEMORY[0x1E4F28EE0];
    v26 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", -[DevicePINController numberOfFailedAttempts](self->_devicePINController, "numberOfFailedAttempts"));
    v27 = [v25 localizedStringFromNumber:v26 numberStyle:1];
    v21 = objc_msgSend(v24, "stringWithFormat:", v16, v27);

LABEL_12:
    goto LABEL_14;
  }
  v21 = [(KeychainSyncDevicePINController *)self enterPasscodeReason];
LABEL_14:
  v28 = [(PSKeychainSyncViewController *)self groupSpecifier];
  [v28 setProperty:v21 forKey:@"footerText"];

  return v5;
}

- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4
{
  return 1;
}

- (void)didFinishEnteringText:(id)a3
{
  id v4 = a3;
  if ([(DevicePINController *)self->_devicePINController isBlocked]
    || ![(DevicePINController *)self->_devicePINController attemptValidationWithPIN:v4])
  {
    UIKeyboardDisableAutomaticAppearance();
    [(PSListController *)self reloadSpecifiers];
    UIKeyboardEnableAutomaticAppearance();
    id v5 = [(PSKeychainSyncTextEntryController *)self textEntryView];
    [v5 becomeFirstResponder];

    [(KeychainSyncDevicePINController *)self updateBlockedState:0];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)KeychainSyncDevicePINController;
    [(PSKeychainSyncTextEntryController *)&v6 didFinishEnteringText:v4];
  }
}

- (NSString)enterPasscodeTitle
{
  return self->_enterPasscodeTitle;
}

- (void)setEnterPasscodeTitle:(id)a3
{
}

- (NSString)enterPasscodeReason
{
  return self->_enterPasscodeReason;
}

- (void)setEnterPasscodeReason:(id)a3
{
}

- (UIKeyboard)disabledKeyboard
{
  return self->_disabledKeyboard;
}

- (void)setDisabledKeyboard:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledKeyboard, 0);
  objc_storeStrong((id *)&self->_enterPasscodeReason, 0);
  objc_storeStrong((id *)&self->_enterPasscodeTitle, 0);
  objc_storeStrong((id *)&self->_devicePINController, 0);
}

@end