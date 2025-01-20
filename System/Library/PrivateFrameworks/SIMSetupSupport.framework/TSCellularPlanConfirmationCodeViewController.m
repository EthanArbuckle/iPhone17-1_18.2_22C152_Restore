@interface TSCellularPlanConfirmationCodeViewController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)confirmationCode;
- (TSCellularPlanConfirmationCodeViewController)initWithCardData:(id)a3;
- (TSSIMSetupFlowDelegate)delegate;
- (UILabel)confirmationCodeMessageLabel;
- (UILabel)confirmationCodeTitleLabel;
- (UITextField)codeTextField;
- (id)initAsMidOperationWithCarrierName:(id)a3;
- (void)confirm:(id)a3;
- (void)setCodeTextField:(id)a3;
- (void)setConfirmationCodeMessageLabel:(id)a3;
- (void)setConfirmationCodeTitleLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)userDidTapCancel;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TSCellularPlanConfirmationCodeViewController

- (id)initAsMidOperationWithCarrierName:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9.receiver = self;
  v9.super_class = (Class)TSCellularPlanConfirmationCodeViewController;
  v7 = [(TSCellularPlanConfirmationCodeViewController *)&v9 initWithNibName:@"TSCellularPlanConfirmationCodeView" bundle:v6];

  if (v7)
  {
    [(TSCellularPlanConfirmationCodeViewController *)v7 setModalInPresentation:1];
    objc_storeStrong((id *)&v7->_carrierName, a3);
    v7->_isMidOperation = 1;
  }

  return v7;
}

- (TSCellularPlanConfirmationCodeViewController)initWithCardData:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9.receiver = self;
  v9.super_class = (Class)TSCellularPlanConfirmationCodeViewController;
  v7 = [(TSCellularPlanConfirmationCodeViewController *)&v9 initWithNibName:@"TSCellularPlanConfirmationCodeView" bundle:v6];

  if (v7)
  {
    [(TSCellularPlanConfirmationCodeViewController *)v7 setModalInPresentation:1];
    objc_storeStrong((id *)&v7->_fauxCardData, a3);
    v7->_isMidOperation = 0;
  }

  return v7;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)TSCellularPlanConfirmationCodeViewController;
  [(SSUIViewController *)&v31 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSCellularPlanConfirmationCodeViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v6 = [(TSCellularPlanConfirmationCodeViewController *)self navigationController];
  v7 = [v6 view];
  [v7 setBackgroundColor:v5];

  v8 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83608]];
  objc_super v9 = (void *)MEMORY[0x263F81708];
  v10 = [v8 fontDescriptorWithSymbolicTraits:2];
  v11 = [v9 fontWithDescriptor:v10 size:0.0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_confirmationCodeTitleLabel);
  [WeakRetained setFont:v11];

  if ([(NSString *)self->_carrierName length])
  {
    v13 = NSString;
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"CTCELLULARPLAN_CONFIRMATION_CODE_MESSAGE_%@" value:&stru_26DBE8E78 table:@"Localizable"];
    v16 = objc_msgSend(v13, "stringWithFormat:", v15, self->_carrierName);
    id v17 = objc_loadWeakRetained((id *)&self->_confirmationCodeMessageLabel);
    [v17 setText:v16];
  }
  else
  {
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"CTCELLULARPLAN_CONFIRMATION_CODE_MESSAGE_NO_CARRIER" value:&stru_26DBE8E78 table:@"Localizable"];
    v16 = objc_loadWeakRetained((id *)&self->_confirmationCodeMessageLabel);
    [v16 setText:v15];
  }

  id v18 = objc_loadWeakRetained((id *)&self->_codeTextField);
  [v18 setDelegate:self];

  id v19 = objc_loadWeakRetained((id *)&self->_codeTextField);
  [v19 setKeyboardType:2];

  id v20 = objc_loadWeakRetained((id *)&self->_codeTextField);
  [v20 setReturnKeyType:4];

  id v21 = objc_loadWeakRetained((id *)&self->_delegate);
  [v21 setDefaultNavigationItems:self];

  id v22 = objc_alloc(MEMORY[0x263F824A8]);
  v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v24 = [v23 localizedStringForKey:@"NPHCELLULAR_CARD_INFO_NEXT" value:&stru_26DBE8E78 table:@"Localizable"];
  v25 = (UIBarButtonItem *)[v22 initWithTitle:v24 style:2 target:self action:sel_confirm_];
  nextButton = self->_nextButton;
  self->_nextButton = v25;

  v27 = [(TSCellularPlanConfirmationCodeViewController *)self navigationItem];
  [v27 setRightBarButtonItem:self->_nextButton];

  [(UIBarButtonItem *)self->_nextButton setEnabled:0];
  v28 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_userDidTapCancel];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v28;

  v30 = [(TSCellularPlanConfirmationCodeViewController *)self navigationItem];
  [v30 setLeftBarButtonItem:self->_cancelButton];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TSCellularPlanConfirmationCodeViewController;
  [(TSCellularPlanConfirmationCodeViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3 = self;
  v6.receiver = self;
  v6.super_class = (Class)TSCellularPlanConfirmationCodeViewController;
  [(TSCellularPlanConfirmationCodeViewController *)&v6 viewWillDisappear:a3];
  objc_super v3 = (TSCellularPlanConfirmationCodeViewController *)((char *)v3 + 1032);
  id WeakRetained = objc_loadWeakRetained((id *)&v3->super.super.super.super.isa);
  [WeakRetained receivedResponse];

  id v5 = objc_loadWeakRetained((id *)&v3->super.super.super.super.isa);
  [v5 startTimer:1];
}

- (void)userDidTapCancel
{
  if (+[TSUtilities inBuddy])
  {
    objc_super v3 = (void *)MEMORY[0x263F82418];
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"SKIP_SETUP_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    objc_super v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"SKIP_SETUP_MESSAGE" value:&stru_26DBE8E78 table:@"Localizable"];
    v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

    objc_super v9 = (void *)MEMORY[0x263F82400];
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"SKIP" value:&stru_26DBE8E78 table:@"Localizable"];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __64__TSCellularPlanConfirmationCodeViewController_userDidTapCancel__block_invoke;
    v19[3] = &unk_264827F48;
    v19[4] = self;
    v12 = [v9 actionWithTitle:v11 style:1 handler:v19];
    [v8 addAction:v12];

    v13 = (void *)MEMORY[0x263F82400];
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_26DBE8E78 table:@"Localizable"];
    v16 = [v13 actionWithTitle:v15 style:0 handler:&__block_literal_global_14];
    [v8 addAction:v16];

    [(TSCellularPlanConfirmationCodeViewController *)self presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    id v17 = +[TSCellularPlanManagerCache sharedInstance];
    [v17 provideUserResponse:2 confirmationCode:&stru_26DBE8E78];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained userDidTapCancel];
  }
}

void __64__TSCellularPlanConfirmationCodeViewController_userDidTapCancel__block_invoke(uint64_t a1)
{
  v2 = +[TSCellularPlanManagerCache sharedInstance];
  [v2 provideUserResponse:2 confirmationCode:&stru_26DBE8E78];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 userDidTapCancel];
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  v10 = [a3 text];
  v11 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);

  -[UIBarButtonItem setEnabled:](self->_nextButton, "setEnabled:", [v11 length] != 0);
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)confirm:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  p_codeTextField = &self->_codeTextField;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_codeTextField);
  objc_super v6 = [WeakRetained text];
  uint64_t v7 = [v6 length];

  v8 = _TSLogDomain();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)p_codeTextField);
      v11 = [v10 text];
      int v21 = 138412546;
      id v22 = v11;
      __int16 v23 = 2080;
      v24 = "-[TSCellularPlanConfirmationCodeViewController confirm:]";
      _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "confirmation code:%@ @%s", (uint8_t *)&v21, 0x16u);
    }
    id v12 = objc_loadWeakRetained((id *)p_codeTextField);
    [v12 resignFirstResponder];

    id v13 = objc_loadWeakRetained((id *)p_codeTextField);
    v14 = [v13 text];
    confirmationCode = self->_confirmationCode;
    self->_confirmationCode = v14;

    if (self->_isMidOperation)
    {
      v8 = [(TSCellularPlanConfirmationCodeViewController *)self delegate];
      [v8 viewControllerDidComplete:self];
    }
    else
    {
      p_delegate = &self->_delegate;
      id v17 = objc_loadWeakRetained((id *)&self->_delegate);
      [v17 waitForResponse:self];

      v8 = +[TSCellularPlanManagerCache sharedInstance];
      fauxCardData = self->_fauxCardData;
      id v19 = self->_confirmationCode;
      id v20 = objc_loadWeakRetained((id *)p_delegate);
      -[NSObject addNewPlanWithCardData:confirmationCode:userConsentResponse:completion:](v8, "addNewPlanWithCardData:confirmationCode:userConsentResponse:completion:", fauxCardData, v19, [v20 signupUserConsentResponse], &__block_literal_global_68);
    }
  }
  else if (v9)
  {
    int v21 = 136315138;
    id v22 = "-[TSCellularPlanConfirmationCodeViewController confirm:]";
    _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "No Confirmation Code @%s", (uint8_t *)&v21, 0xCu);
  }
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)confirmationCode
{
  return self->_confirmationCode;
}

- (UILabel)confirmationCodeTitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_confirmationCodeTitleLabel);
  return (UILabel *)WeakRetained;
}

- (void)setConfirmationCodeTitleLabel:(id)a3
{
}

- (UILabel)confirmationCodeMessageLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_confirmationCodeMessageLabel);
  return (UILabel *)WeakRetained;
}

- (void)setConfirmationCodeMessageLabel:(id)a3
{
}

- (UITextField)codeTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_codeTextField);
  return (UITextField *)WeakRetained;
}

- (void)setCodeTextField:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_codeTextField);
  objc_destroyWeak((id *)&self->_confirmationCodeMessageLabel);
  objc_destroyWeak((id *)&self->_confirmationCodeTitleLabel);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_confirmationCode, 0);
  objc_storeStrong((id *)&self->_fauxCardData, 0);
}

@end