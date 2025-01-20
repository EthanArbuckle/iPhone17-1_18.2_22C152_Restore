@interface STIntroPasscodeViewController
- (BOOL)askForRecoveryAppleID;
- (BOOL)isChildOrNotSignedIntoiCloud;
- (BOOL)isNumeric;
- (NSString)altDSID;
- (NSString)initialPasscode;
- (STIntroPasscodeViewController)initWithIntroductionModel:(id)a3 askForRecoveryAppleID:(BOOL)a4 altDSID:(id)a5 isChildOrNotSignedIntoiCloud:(BOOL)a6 continueHandler:(id)a7;
- (STIntroductionViewModel)model;
- (id)continueHandler;
- (id)passcodeInputView;
- (int64_t)passcodeState;
- (unint64_t)numericLength;
- (void)_transitionToFirstPasscodePaneWithState:(int64_t)a3;
- (void)loadView;
- (void)nextButtonTapped;
- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4;
- (void)passcodeTypeChanged:(BOOL)a3;
- (void)setInitialPasscode:(id)a3;
- (void)setNumeric:(BOOL)a3;
- (void)setNumericLength:(unint64_t)a3;
- (void)setPasscodeState:(int64_t)a3;
- (void)updatePasscodeType;
- (void)userEnteredPasscode:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation STIntroPasscodeViewController

- (STIntroPasscodeViewController)initWithIntroductionModel:(id)a3 askForRecoveryAppleID:(BOOL)a4 altDSID:(id)a5 isChildOrNotSignedIntoiCloud:(BOOL)a6 continueHandler:(id)a7
{
  v12 = (STIntroductionViewModel *)a3;
  v23.receiver = self;
  v23.super_class = (Class)STIntroPasscodeViewController;
  id v13 = a7;
  id v14 = a5;
  v15 = [(STIntroPasscodeViewController *)&v23 initWithNibName:0 bundle:0];
  model = v15->_model;
  v15->_model = v12;
  v17 = v12;

  v15->_askForRecoveryAppleID = a4;
  uint64_t v18 = objc_msgSend(v14, "copy", v23.receiver, v23.super_class);

  altDSID = v15->_altDSID;
  v15->_altDSID = (NSString *)v18;

  v15->_childOrNotSignedIntoiCloud = a6;
  uint64_t v20 = [v13 copy];

  id continueHandler = v15->_continueHandler;
  v15->_id continueHandler = (id)v20;

  v15->_passcodeState = 0;
  v15->_numeric = 1;
  v15->_numericLength = 4;
  return v15;
}

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [v3 setAutoresizingMask:18];
  [v3 setPasscodeViewController:self];
  [(STIntroPasscodeViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)STIntroPasscodeViewController;
  [(STIntroPasscodeViewController *)&v8 viewDidLoad];
  id v3 = [(STIntroPasscodeViewController *)self _passcodeView];
  v4 = +[STScreenTimeSettingsUIBundle bundle];
  v5 = [v4 localizedStringForKey:@"IntroPasscodeSetupTitle" value:&stru_26D9391A8 table:0];
  [v3 setTitle:v5];

  v6 = [(STIntroPasscodeViewController *)self passcodeInputView];
  [v3 transitionToPasscodeInput:v6 delegate:self];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STIntroPasscodeViewController.viewDidLoad", v7, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)STIntroPasscodeViewController;
  -[STIntroPasscodeViewController viewDidAppear:](&v8, sel_viewDidAppear_);
  v5 = [(STIntroPasscodeViewController *)self _passcodeView];
  v6 = [v5 passcodeInputView];

  [v6 becomeFirstResponder];
  [(STIntroPasscodeViewController *)self passcodeTypeChanged:v3];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STIntroPasscodeViewController.viewDidAppear", v7, 2u);
  }
}

- (void)passcodeTypeChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(STIntroPasscodeViewController *)self navigationItem];
  [v4 setRightBarButtonItem:0 animated:v3];
}

- (id)passcodeInputView
{
  id v3 = objc_alloc(MEMORY[0x263F68050]);
  unint64_t v4 = [(STIntroPasscodeViewController *)self numericLength];
  v5 = objc_msgSend(v3, "initWithFrame:numberOfEntryFields:", v4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  switch([(STIntroPasscodeViewController *)self passcodeState])
  {
    case 0:
      v6 = +[STScreenTimeSettingsUIBundle bundle];
      v7 = v6;
      objc_super v8 = @"IntroPasscodeSetupInstructions";
      goto LABEL_7;
    case 1:
      v6 = +[STScreenTimeSettingsUIBundle bundle];
      v7 = v6;
      objc_super v8 = @"IntroPasscodeSetupInstructionsReentry";
      goto LABEL_7;
    case 2:
      v6 = +[STScreenTimeSettingsUIBundle bundle];
      v7 = v6;
      objc_super v8 = @"IntroPasscodeSetupInstructionsFailure";
      goto LABEL_7;
    case 3:
      v6 = +[STScreenTimeSettingsUIBundle bundle];
      v7 = v6;
      objc_super v8 = @"RecoveryAppleIDInvalidError";
LABEL_7:
      v9 = [v6 localizedStringForKey:v8 value:&stru_26D9391A8 table:0];

      break;
    default:
      v9 = 0;
      break;
  }
  v10 = [v5 instructions];
  [v10 setText:v9];

  [v5 setFooterView:0];

  return v5;
}

- (void)nextButtonTapped
{
  id v5 = [(STIntroPasscodeViewController *)self _passcodeView];
  id v3 = [v5 passcodeInputView];
  unint64_t v4 = [v3 passcode];
  [(STIntroPasscodeViewController *)self userEnteredPasscode:v4];
}

- (void)userEnteredPasscode:(id)a3
{
  id v4 = a3;
  if ([(STIntroPasscodeViewController *)self passcodeState] == 1)
  {
    id v5 = [(STIntroPasscodeViewController *)self initialPasscode];
    int v6 = [v4 isEqualToString:v5];

    if (!v6)
    {
      [(STIntroPasscodeViewController *)self _transitionToFirstPasscodePaneWithState:2];
      goto LABEL_9;
    }
    if (![(STIntroPasscodeViewController *)self askForRecoveryAppleID])
    {
      v16 = [(STIntroPasscodeViewController *)self model];
      [v16 setParentalControlsPasscode:v4];

      v17 = [(STIntroPasscodeViewController *)self continueHandler];
      v17[2]();

      goto LABEL_9;
    }
    v7 = objc_opt_new();
    [v7 setIsEphemeral:1];
    [v7 setAuthenticationType:2];
    [v7 setShouldPromptForPasswordOnly:1];
    [v7 _setProxiedAppName:@"ScreenTime"];
    [v7 setPresentingViewController:self];
    [v7 setAppProvidedContext:@"setup"];
    objc_super v8 = +[STScreenTimeSettingsUIBundle bundle];
    v9 = [v8 localizedStringForKey:@"RecoveryAppleIDAlertTitle" value:&stru_26D9391A8 table:0];
    [v7 setTitle:v9];

    v10 = [v8 localizedStringForKey:@"RecoveryAppleIDAlertReason" value:&stru_26D9391A8 table:0];
    [v7 setReason:v10];

    v11 = [v8 localizedStringForKey:@"ConfirmationButtonOK" value:&stru_26D9391A8 table:0];
    [v7 setDefaultButtonString:v11];

    v12 = [v8 localizedStringForKey:@"RecoveryAppleIDAlertSkipButton" value:&stru_26D9391A8 table:0];
    [v7 setCancelButtonString:v12];

    id v13 = objc_opt_new();
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke;
    v18[3] = &unk_264767DE8;
    v18[4] = self;
    id v19 = v4;
    id v20 = v8;
    id v14 = v8;
    [v13 authenticateWithContext:v7 completion:v18];
  }
  else
  {
    [(STIntroPasscodeViewController *)self setInitialPasscode:v4];
    [(STIntroPasscodeViewController *)self setPasscodeState:1];
    v7 = [(STIntroPasscodeViewController *)self _passcodeView];
    v15 = [v7 passcodeInputView];
    [v15 setPasscode:&stru_26D9391A8];

    id v14 = [(STIntroPasscodeViewController *)self passcodeInputView];
    [v7 animateTransitionToPasscodeInput:v14 animation:2];
  }

LABEL_9:
}

void __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [MEMORY[0x263F08A48] mainQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2;
  v11[3] = &unk_264767DC0;
  id v12 = v5;
  id v13 = v6;
  objc_super v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v16 = *(id *)(a1 + 48);
  id v9 = v6;
  id v10 = v5;
  [v7 addOperationWithBlock:v11];
}

void __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F28F58]];
  id v5 = (id *)(a1 + 40);
  id v4 = *(void **)(a1 + 40);
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (v6)
  {
    v7 = [v4 domain];
    if ([v7 isEqualToString:*MEMORY[0x263F28F30]])
    {
      uint64_t v8 = [*v5 code];

      if (v8 == -7003)
      {
        id v9 = @"RecoveryAppleIDAlertConfirmSkipTitle";
LABEL_20:
        id v13 = [*(id *)(a1 + 64) localizedStringForKey:v9 value:&stru_26D9391A8 table:0];
        if ([*(id *)(a1 + 48) isChildOrNotSignedIntoiCloud]) {
          id v15 = @"RecoveryAppleIDAlertConfirmSkipMessageChild";
        }
        else {
          id v15 = @"RecoveryAppleIDAlertConfirmSkipMessage";
        }
        id v16 = [*(id *)(a1 + 64) localizedStringForKey:v15 value:&stru_26D9391A8 table:0];
        v17 = [MEMORY[0x263F82418] alertControllerWithTitle:v13 message:v16 preferredStyle:1];
        uint64_t v18 = [*(id *)(a1 + 64) localizedStringForKey:@"RecoveryAppleIDAlertSkipButton" value:&stru_26D9391A8 table:0];
        id v19 = (void *)MEMORY[0x263F82400];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_74;
        v32[3] = &unk_264767368;
        id v20 = *(void **)(a1 + 56);
        v32[4] = *(void *)(a1 + 48);
        id v33 = v20;
        v21 = [v19 actionWithTitle:v18 style:0 handler:v32];
        [v17 addAction:v21];

        v22 = [*(id *)(a1 + 64) localizedStringForKey:@"RecoveryAppleIDAlertSetButton" value:&stru_26D9391A8 table:0];
        objc_super v23 = (void *)MEMORY[0x263F82400];
        uint64_t v26 = MEMORY[0x263EF8330];
        uint64_t v27 = 3221225472;
        v28 = __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2_79;
        v29 = &unk_264767368;
        v24 = *(void **)(a1 + 56);
        uint64_t v30 = *(void *)(a1 + 48);
        id v31 = v24;
        v25 = [v23 actionWithTitle:v22 style:1 handler:&v26];
        objc_msgSend(v17, "addAction:", v25, v26, v27, v28, v29, v30);

        [*(id *)(a1 + 48) presentViewController:v17 animated:1 completion:0];
        goto LABEL_24;
      }
    }
    else
    {
    }
    if (*v5)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2_cold_2((uint64_t *)(a1 + 40));
      }
    }
    else if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2_cold_1(v2);
    }
    id v9 = @"RecoveryAppleIDUnknownError";
    goto LABEL_20;
  }
  id v10 = [*(id *)(a1 + 48) altDSID];
  int v11 = [v10 isEqualToString:v3];

  id v12 = *(void **)(a1 + 48);
  if (!v11)
  {
    id v13 = [v12 model];
    [v13 setParentalControlsPasscode:*(void *)(a1 + 56)];
    [v13 setRecoveryAltDSID:v3];
    uint64_t v14 = [*(id *)(a1 + 48) continueHandler];
    v14[2]();

LABEL_24:
    goto LABEL_25;
  }
  [v12 _transitionToFirstPasscodePaneWithState:3];
LABEL_25:
}

void __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_74(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) model];
  [v3 setParentalControlsPasscode:v2];

  id v4 = [*(id *)(a1 + 32) continueHandler];
  v4[2]();
}

uint64_t __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2_79(uint64_t a1)
{
  return [*(id *)(a1 + 32) userEnteredPasscode:*(void *)(a1 + 40)];
}

- (void)_transitionToFirstPasscodePaneWithState:(int64_t)a3
{
  [(STIntroPasscodeViewController *)self setInitialPasscode:0];
  [(STIntroPasscodeViewController *)self setPasscodeState:a3];
  id v7 = [(STIntroPasscodeViewController *)self _passcodeView];
  id v5 = [v7 passcodeInputView];
  [v5 setPasscode:&stru_26D9391A8];

  BOOL v6 = [(STIntroPasscodeViewController *)self passcodeInputView];
  [v7 animateTransitionToPasscodeInput:v6 animation:1];
}

- (void)updatePasscodeType
{
  [(STIntroPasscodeViewController *)self setPasscodeState:0];
  [(STIntroPasscodeViewController *)self passcodeTypeChanged:1];
  id v5 = [(STIntroPasscodeViewController *)self _passcodeView];
  id v3 = [(STIntroPasscodeViewController *)self passcodeInputView];
  [v5 transitionToPasscodeInput:v3 delegate:self];

  id v4 = [v5 passcodeInputView];
  [v4 becomeFirstResponder];
}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
}

- (STIntroductionViewModel)model
{
  return (STIntroductionViewModel *)objc_getProperty(self, a2, 984, 1);
}

- (BOOL)askForRecoveryAppleID
{
  return self->_askForRecoveryAppleID;
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 992, 1);
}

- (BOOL)isChildOrNotSignedIntoiCloud
{
  return self->_childOrNotSignedIntoiCloud;
}

- (id)continueHandler
{
  return objc_getProperty(self, a2, 1000, 1);
}

- (int64_t)passcodeState
{
  return self->_passcodeState;
}

- (void)setPasscodeState:(int64_t)a3
{
  self->_passcodeState = a3;
}

- (NSString)initialPasscode
{
  return (NSString *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setInitialPasscode:(id)a3
{
}

- (BOOL)isNumeric
{
  return self->_numeric;
}

- (void)setNumeric:(BOOL)a3
{
  self->_numeric = a3;
}

- (unint64_t)numericLength
{
  return self->_numericLength;
}

- (void)setNumericLength:(unint64_t)a3
{
  self->_numericLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialPasscode, 0);
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

void __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2_cold_1(uint64_t *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_fault_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Authenticated user without an altDSID: %@", (uint8_t *)&v2, 0xCu);
}

void __53__STIntroPasscodeViewController_userEnteredPasscode___block_invoke_2_cold_2(uint64_t *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to authenticate recovery Apple ID: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end