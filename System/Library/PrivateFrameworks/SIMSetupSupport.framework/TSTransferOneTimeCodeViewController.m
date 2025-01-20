@interface TSTransferOneTimeCodeViewController
- (BOOL)animating;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)usePin;
- (CoreTelephonyClient)client;
- (NSArray)cachedButtons;
- (NSString)details;
- (NSString)sourceIccid;
- (OBLinkTrayButton)skipButton;
- (SSOBBoldTrayButton)continueButton;
- (SSOBLinkTrayButton)resendOTPButton;
- (SSSpinner)spinner;
- (TSSIMSetupFlowDelegate)delegate;
- (TSTransferOneTimeCodeViewController)initWithSourceIccid:(id)a3 phoneNumber:(id)a4 carrierName:(id)a5 usePin:(BOOL)a6;
- (UIBarButtonItem)cancelButton;
- (UITextField)otpEditor;
- (UIView)spinnerContainer;
- (void)_cancelButtonTapped:(id)a3;
- (void)_changeOtpTextFieldState:(BOOL)a3;
- (void)_continueButtonTapped:(id)a3;
- (void)_hideKeyboard;
- (void)_resendOTP;
- (void)_setupLayoutConstraint;
- (void)_textFieldDidChange;
- (void)disableButtonsAndHideSpinnerText;
- (void)setAnimating:(BOOL)a3;
- (void)setCachedButtons:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setClient:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetails:(id)a3;
- (void)setOtpEditor:(id)a3;
- (void)setResendOTPButton:(id)a3;
- (void)setSkipButton:(id)a3;
- (void)setSourceIccid:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setSpinnerContainer:(id)a3;
- (void)setUsePin:(BOOL)a3;
- (void)updateOtpState:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation TSTransferOneTimeCodeViewController

- (TSTransferOneTimeCodeViewController)initWithSourceIccid:(id)a3 phoneNumber:(id)a4 carrierName:(id)a5 usePin:(BOOL)a6
{
  LODWORD(v6) = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = v14;
  if (v6)
  {
    v16 = [v14 localizedStringForKey:@"ENTER_ACCOUNT_PIN" value:&stru_26DBE8E78 table:@"Localizable"];

    if ([v13 length])
    {
      v17 = NSString;
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = [v18 localizedStringForKey:@"ENTER_PIN_DETAILS_%@" value:&stru_26DBE8E78 table:@"Localizable"];
      objc_msgSend(v17, "stringWithFormat:", v19, v13);
      v28 = LABEL_10:;

      goto LABEL_16;
    }
    v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v18 = v29;
    v30 = @"ENTER_PIN_DETAILS_NO_CARRIER";
  }
  else
  {
    v16 = [v14 localizedStringForKey:@"ENTER_ONE_TIME_PASSCODE" value:&stru_26DBE8E78 table:@"Localizable"];

    if ([v12 length])
    {
      uint64_t v20 = [NSString stringWithFormat:@"%@%@", @"****", v12];
      if (v20)
      {
        v18 = (void *)v20;
        id v41 = v11;
        uint64_t v21 = [v13 length];
        v22 = NSString;
        v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v24 = v23;
        if (v21)
        {
          v25 = [v23 localizedStringForKey:@"ONE_TIME_PASSCODE_DETAILS_%@_%@" value:&stru_26DBE8E78 table:@"Localizable"];
          objc_msgSend(v22, "stringWithFormat:", v25, v18, v13);
        }
        else
        {
          v25 = [v23 localizedStringForKey:@"ONE_TIME_PASSCODE_DETAILS_NO_CARRIER_%@" value:&stru_26DBE8E78 table:@"Localizable"];
          objc_msgSend(v22, "stringWithFormat:", v25, v18, v40);
        v28 = };

        id v11 = v41;
        goto LABEL_16;
      }
    }
    if ([v13 length])
    {
      id v6 = v11;
      v26 = NSString;
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = [v18 localizedStringForKey:@"ONE_TIME_PASSCODE_DETAILS_NO_PHONE_NUMBER_%@" value:&stru_26DBE8E78 table:@"Localizable"];
      v27 = v26;
      id v11 = v6;
      LOBYTE(v6) = 0;
      objc_msgSend(v27, "stringWithFormat:", v19, v13);
      goto LABEL_10;
    }
    id v6 = v11;
    v31 = (void *)MEMORY[0x263F086E0];
    uint64_t v32 = objc_opt_class();
    v33 = v31;
    id v11 = v6;
    LOBYTE(v6) = 0;
    v29 = [v33 bundleForClass:v32];
    v18 = v29;
    v30 = @"ONE_TIME_PASSCODE_DETAILS_NO_CARRIER_NO_PHONE_NUMBER";
  }
  v28 = [v29 localizedStringForKey:v30 value:&stru_26DBE8E78 table:@"Localizable"];
LABEL_16:

  v42.receiver = self;
  v42.super_class = (Class)TSTransferOneTimeCodeViewController;
  v34 = [(TSTransferOneTimeCodeViewController *)&v42 initWithTitle:v16 detailText:v28 icon:0];
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_details, v28);
    objc_storeStrong((id *)&v35->_sourceIccid, a3);
    v35->_usePin = (char)v6;
    id v36 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v37 = [v36 initWithQueue:MEMORY[0x263EF83A0]];
    client = v35->_client;
    v35->_client = (CoreTelephonyClient *)v37;
  }
  return v35;
}

- (void)viewDidLoad
{
  v42[2] = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)TSTransferOneTimeCodeViewController;
  [(TSOBWelcomeController *)&v41 viewDidLoad];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__updateTrayButtonText_ name:@"esim.install.state.changed" object:0];

  [(TSTransferOneTimeCodeViewController *)self setModalInPresentation:1];
  v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v5 = [(TSTransferOneTimeCodeViewController *)self view];
  [v5 setBackgroundColor:v4];

  id v6 = objc_alloc(MEMORY[0x263F82CF0]);
  v7 = (UITextField *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  otpEditor = self->_otpEditor;
  self->_otpEditor = v7;

  [(UITextField *)self->_otpEditor setBorderStyle:3];
  [(UITextField *)self->_otpEditor setKeyboardType:4];
  [(UITextField *)self->_otpEditor setTextContentType:*MEMORY[0x263F83A60]];
  [(UITextField *)self->_otpEditor setClearButtonMode:1];
  [(UITextField *)self->_otpEditor setReturnKeyType:9];
  [(UITextField *)self->_otpEditor addTarget:self action:sel__textFieldDidChange forControlEvents:0x20000];
  [(UITextField *)self->_otpEditor setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextField *)self->_otpEditor setDelegate:self];
  if (self->_usePin) {
    [(UITextField *)self->_otpEditor setSecureTextEntry:1];
  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x263F82D70]), "initWithFrame:", 0.0, 0.0, 320.0, 50.0);
  v10 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  v42[0] = v10;
  id v11 = objc_alloc(MEMORY[0x263F824A8]);
  id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"DONE" value:&stru_26DBE8E78 table:@"Localizable"];
  v14 = (void *)[v11 initWithTitle:v13 style:2 target:self action:sel__hideKeyboard];
  v42[1] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
  [v9 setItems:v15];

  [v9 sizeToFit];
  [(UITextField *)self->_otpEditor setInputAccessoryView:v9];
  v16 = [(TSTransferOneTimeCodeViewController *)self view];
  [v16 addSubview:self->_otpEditor];

  if (!self->_usePin)
  {
    v17 = +[OBLinkTrayButton linkButton];
    resendOTPButton = self->_resendOTPButton;
    self->_resendOTPButton = v17;

    v19 = self->_resendOTPButton;
    uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v21 = [v20 localizedStringForKey:@"RENEW_ONE_TIME_PASSCODE" value:&stru_26DBE8E78 table:@"Localizable"];
    [(SSOBLinkTrayButton *)v19 setTitle:v21 forState:0];

    [(SSOBLinkTrayButton *)self->_resendOTPButton addTarget:self action:sel__resendOTP forControlEvents:64];
    v22 = [(TSTransferOneTimeCodeViewController *)self view];
    [v22 addSubview:self->_resendOTPButton];
  }
  v23 = +[OBBoldTrayButton boldButton];
  continueButton = self->_continueButton;
  self->_continueButton = v23;

  v25 = self->_continueButton;
  v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v27 = [v26 localizedStringForKey:@"CONTINUE" value:&stru_26DBE8E78 table:@"Localizable"];
  [(SSOBBoldTrayButton *)v25 setTitle:v27 forState:0];

  [(SSOBBoldTrayButton *)self->_continueButton addTarget:self action:sel__continueButtonTapped_ forControlEvents:64];
  [(OBBoldTrayButton *)self->_continueButton setEnabled:0];
  v28 = [(TSTransferOneTimeCodeViewController *)self buttonTray];
  [v28 addButton:self->_continueButton];

  if (+[TSUtilities inBuddy])
  {
    v29 = [MEMORY[0x263F5B8D0] linkButton];
    skipButton = self->_skipButton;
    self->_skipButton = v29;

    [(OBLinkTrayButton *)self->_skipButton setRole:2];
    v31 = self->_skipButton;
    uint64_t v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v33 = [v32 localizedStringForKey:@"SET_UP_LATER_IN_SETTINGS" value:&stru_26DBE8E78 table:@"Localizable"];
    [(OBLinkTrayButton *)v31 setTitle:v33 forState:0];

    [(OBLinkTrayButton *)self->_skipButton addTarget:self action:sel__cancelButtonTapped_ forControlEvents:64];
    v34 = [(TSTransferOneTimeCodeViewController *)self buttonTray];
    [v34 addButton:self->_skipButton];

    v35 = [(TSTransferOneTimeCodeViewController *)self buttonTray];
    [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  else
  {
    id v36 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped_];
    cancelButton = self->_cancelButton;
    self->_cancelButton = v36;

    v35 = [(OBBaseWelcomeController *)self navigationItem];
    [v35 setLeftBarButtonItem:self->_cancelButton];
  }

  [(TSTransferOneTimeCodeViewController *)self _setupLayoutConstraint];
  v38 = [(OBBaseWelcomeController *)self navigationItem];
  [v38 setHidesBackButton:1 animated:0];

  v39 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__hideKeyboard];
  uint64_t v40 = [(TSTransferOneTimeCodeViewController *)self view];
  [v40 addGestureRecognizer:v39];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  otpEditor = self->_otpEditor;
  if (otpEditor == a3) {
    [(TSTransferOneTimeCodeViewController *)self _hideKeyboard];
  }
  return otpEditor != a3;
}

- (void)_hideKeyboard
{
  if ([(UITextField *)self->_otpEditor isFirstResponder])
  {
    id v3 = [(TSTransferOneTimeCodeViewController *)self view];
    [v3 endEditing:1];
  }
}

- (void)_setupLayoutConstraint
{
  id v3 = [(UITextField *)self->_otpEditor topAnchor];
  v4 = [(TSTransferOneTimeCodeViewController *)self headerView];
  v5 = [v4 bottomAnchor];
  id v6 = [v3 constraintGreaterThanOrEqualToAnchor:v5 constant:20.0];
  [v6 setActive:1];

  v7 = [(UITextField *)self->_otpEditor leadingAnchor];
  v8 = [(TSTransferOneTimeCodeViewController *)self contentView];
  v9 = [v8 layoutMarginsGuide];
  v10 = [v9 leadingAnchor];
  id v11 = [v7 constraintGreaterThanOrEqualToAnchor:v10];
  [v11 setActive:1];

  id v12 = [(UITextField *)self->_otpEditor trailingAnchor];
  id v13 = [(TSTransferOneTimeCodeViewController *)self contentView];
  v14 = [v13 layoutMarginsGuide];
  v15 = [v14 trailingAnchor];
  v16 = [v12 constraintGreaterThanOrEqualToAnchor:v15];
  [v16 setActive:1];

  v17 = [(UITextField *)self->_otpEditor centerXAnchor];
  v18 = [(TSTransferOneTimeCodeViewController *)self view];
  v19 = [v18 centerXAnchor];
  uint64_t v20 = [v17 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  if (!self->_usePin)
  {
    uint64_t v21 = [(SSOBLinkTrayButton *)self->_resendOTPButton topAnchor];
    v22 = [(UITextField *)self->_otpEditor bottomAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:20.0];
    [v23 setActive:1];

    id v27 = [(SSOBLinkTrayButton *)self->_resendOTPButton centerXAnchor];
    v24 = [(TSTransferOneTimeCodeViewController *)self view];
    v25 = [v24 centerXAnchor];
    v26 = [v27 constraintEqualToAnchor:v25];
    [v26 setActive:1];
  }
}

- (void)updateOtpState:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v27 = a3;
    __int16 v28 = 2080;
    v29 = "-[TSTransferOneTimeCodeViewController updateOtpState:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "updating otpState to %ld @%s", buf, 0x16u);
  }

  if (a3 == 1)
  {
    BOOL v8 = !self->_usePin;
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = v9;
    if (v8) {
      id v11 = @"INCORRECT_ONE_TIME_PASSCODE";
    }
    else {
      id v11 = @"INCORRECT_PIN";
    }
    id v12 = [v9 localizedStringForKey:v11 value:&stru_26DBE8E78 table:@"Localizable"];

    BOOL v13 = !self->_usePin;
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = v14;
    if (v13) {
      v16 = @"INCORRECT_ONE_TIME_PASSCODE_MESSAGE";
    }
    else {
      v16 = @"INCORRECT_PIN_MESSAGE";
    }
    v17 = [v14 localizedStringForKey:v16 value:&stru_26DBE8E78 table:@"Localizable"];

    objc_initWeak((id *)buf, self);
    v18 = [MEMORY[0x263F82418] alertControllerWithTitle:v12 message:v17 preferredStyle:1];
    v19 = (void *)MEMORY[0x263F82400];
    uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v21 = [v20 localizedStringForKey:@"OK" value:&stru_26DBE8E78 table:@"Localizable"];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __54__TSTransferOneTimeCodeViewController_updateOtpState___block_invoke;
    v24[3] = &unk_264827A48;
    objc_copyWeak(&v25, (id *)buf);
    v22 = [v19 actionWithTitle:v21 style:0 handler:v24];
    [v18 addAction:v22];

    [(TSTransferOneTimeCodeViewController *)self presentViewController:v18 animated:1 completion:0];
    objc_destroyWeak(&v25);

    objc_destroyWeak((id *)buf);
  }
  else if (a3 == 2)
  {
    [(TSTransferOneTimeCodeViewController *)self disableButtonsAndHideSpinnerText];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"CONTINUE_BUTTON_STATE_INSTALLING" value:&stru_26DBE8E78 table:@"Localizable"];
    [(OBWelcomeController *)self _showButtonTraySpinnerWithBusyText:v7];

    return;
  }
  [(OBWelcomeController *)self _hideButtonTraySpinner];
  [(SSOBLinkTrayButton *)self->_resendOTPButton hideSpinner];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __54__TSTransferOneTimeCodeViewController_updateOtpState___block_invoke_2;
  v23[3] = &unk_2648279D0;
  v23[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v23);
}

void __54__TSTransferOneTimeCodeViewController_updateOtpState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presentedViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

uint64_t __54__TSTransferOneTimeCodeViewController_updateOtpState___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _changeOtpTextFieldState:1];
  v2 = [*(id *)(*(void *)(a1 + 32) + 1240) text];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1248), "setEnabled:", objc_msgSend(v2, "length") != 0);

  [*(id *)(*(void *)(a1 + 32) + 1272) setEnabled:1];
  [*(id *)(*(void *)(a1 + 32) + 1256) setEnabled:1];
  id v3 = *(void **)(*(void *)(a1 + 32) + 1264);
  return [v3 setEnabled:1];
}

- (void)disableButtonsAndHideSpinnerText
{
  [(OBWelcomeController *)self _showButtonTraySpinnerWithBusyText:@" "];
  [(SSOBLinkTrayButton *)self->_resendOTPButton hideSpinner];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__TSTransferOneTimeCodeViewController_disableButtonsAndHideSpinnerText__block_invoke;
  block[3] = &unk_2648279D0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __71__TSTransferOneTimeCodeViewController_disableButtonsAndHideSpinnerText__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _changeOtpTextFieldState:0];
  [*(id *)(*(void *)(a1 + 32) + 1272) setEnabled:0];
  [*(id *)(*(void *)(a1 + 32) + 1256) setEnabled:0];
  v2 = *(void **)(*(void *)(a1 + 32) + 1264);
  return [v2 setEnabled:0];
}

- (void)_continueButtonTapped:(id)a3
{
  id v5 = [(UITextField *)self->_otpEditor text];
  [(TSTransferOneTimeCodeViewController *)self disableButtonsAndHideSpinnerText];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained startTimer:1];

  [(CoreTelephonyClient *)self->_client handleUserEnteredOtp:self->_sourceIccid otp:v5 completion:&__block_literal_global_5];
}

void __61__TSTransferOneTimeCodeViewController__continueButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __61__TSTransferOneTimeCodeViewController__continueButtonTapped___block_invoke_cold_1();
    }
  }
}

- (void)_cancelButtonTapped:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = _TSLogDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[TSTransferOneTimeCodeViewController _cancelButtonTapped:]";
    _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "cancelled otp verification @%s", (uint8_t *)&v6, 0xCu);
  }

  [(TSTransferOneTimeCodeViewController *)self disableButtonsAndHideSpinnerText];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userDidTapCancel];
}

- (void)_resendOTP
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[TSTransferOneTimeCodeViewController _resendOTP]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "requested new OTP @%s", (uint8_t *)&v5, 0xCu);
  }

  [(TSTransferOneTimeCodeViewController *)self _changeOtpTextFieldState:0];
  [(OBBoldTrayButton *)self->_continueButton setEnabled:0];
  [(SSOBLinkTrayButton *)self->_resendOTPButton setEnabled:0];
  [(SSOBLinkTrayButton *)self->_resendOTPButton showSpinner];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained startTimer:1];

  [(CoreTelephonyClient *)self->_client renewOneTimePassword:self->_sourceIccid completion:&__block_literal_global_118];
}

void __49__TSTransferOneTimeCodeViewController__resendOTP__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __49__TSTransferOneTimeCodeViewController__resendOTP__block_invoke_cold_1();
    }
  }
}

- (void)_textFieldDidChange
{
  id v3 = [(UITextField *)self->_otpEditor text];
  -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", [v3 length] != 0);
}

- (void)_changeOtpTextFieldState:(BOOL)a3
{
  BOOL v3 = a3;
  -[UITextField setEnabled:](self->_otpEditor, "setEnabled:");
  if (v3)
  {
    otpEditor = self->_otpEditor;
    [(UITextField *)otpEditor setTextColor:0];
  }
  else
  {
    id v6 = [MEMORY[0x263F825C8] grayColor];
    [(UITextField *)self->_otpEditor setTextColor:v6];
  }
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (NSArray)cachedButtons
{
  return (NSArray *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setCachedButtons:(id)a3
{
}

- (SSSpinner)spinner
{
  return (SSSpinner *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setSpinner:(id)a3
{
}

- (UIView)spinnerContainer
{
  return (UIView *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setSpinnerContainer:(id)a3
{
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setClient:(id)a3
{
}

- (NSString)sourceIccid
{
  return (NSString *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setSourceIccid:(id)a3
{
}

- (UITextField)otpEditor
{
  return (UITextField *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setOtpEditor:(id)a3
{
}

- (SSOBBoldTrayButton)continueButton
{
  return (SSOBBoldTrayButton *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setContinueButton:(id)a3
{
}

- (OBLinkTrayButton)skipButton
{
  return (OBLinkTrayButton *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setSkipButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setCancelButton:(id)a3
{
}

- (SSOBLinkTrayButton)resendOTPButton
{
  return (SSOBLinkTrayButton *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setResendOTPButton:(id)a3
{
}

- (BOOL)usePin
{
  return self->_usePin;
}

- (void)setUsePin:(BOOL)a3
{
  self->_usePin = a3;
}

- (NSString)details
{
  return (NSString *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_resendOTPButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_otpEditor, 0);
  objc_storeStrong((id *)&self->_sourceIccid, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerContainer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cachedButtons, 0);
}

void __61__TSTransferOneTimeCodeViewController__continueButtonTapped___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  id v2 = "-[TSTransferOneTimeCodeViewController _continueButtonTapped:]_block_invoke";
  _os_log_error_impl(&dword_227A17000, v0, OS_LOG_TYPE_ERROR, "[E]handleUserEnteredOtp failed : %@ @%s", v1, 0x16u);
}

void __49__TSTransferOneTimeCodeViewController__resendOTP__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  id v2 = "-[TSTransferOneTimeCodeViewController _resendOTP]_block_invoke";
  _os_log_error_impl(&dword_227A17000, v0, OS_LOG_TYPE_ERROR, "[E]renewOneTimePassword failed : %@ @%s", v1, 0x16u);
}

@end