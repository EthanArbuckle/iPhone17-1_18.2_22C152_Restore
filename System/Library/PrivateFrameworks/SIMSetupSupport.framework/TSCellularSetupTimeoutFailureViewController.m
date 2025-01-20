@interface TSCellularSetupTimeoutFailureViewController
- (BOOL)isStartOverRequiredOnBackButtonTapped;
- (TSCellularSetupTimeoutFailureViewController)initWithTimeoutReason:(int64_t)a3;
- (TSSIMSetupFlowDelegate)delegate;
- (void)_continueButtonTapped;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation TSCellularSetupTimeoutFailureViewController

- (TSCellularSetupTimeoutFailureViewController)initWithTimeoutReason:(int64_t)a3
{
  self->_timeoutReason = a3;
  BOOL v5 = +[TSUtilities inBuddy];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = v6;
  if (a3 == 1)
  {
    if (v5) {
      v8 = @"ERROR_TRANSFER_ITEM_CONSENT_TIMEOUT_MESSAGE_BUDDY";
    }
    else {
      v8 = @"ERROR_TRANSFER_ITEM_CONSENT_TIMEOUT_MESSAGE";
    }
    v9 = [v6 localizedStringForKey:v8 value:&stru_26DBE8E78 table:@"Localizable"];

    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"ERROR_TRANSFER_ITEM_ACTIVATION_TIMEOUT_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    v12 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:](&v18, sel_initWithTitle_detailText_symbolName_, v11, v9, 0, v17.receiver, v17.super_class, self, TSCellularSetupTimeoutFailureViewController);
  }
  else
  {
    if (v5) {
      v13 = @"ACTIVATE_EXCEED_DETAIL";
    }
    else {
      v13 = @"ACTIVATE_EXCEED_DETAIL_POSTBUDDY";
    }
    v9 = [v6 localizedStringForKey:v13 value:&stru_26DBE8E78 table:@"Localizable"];

    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"ACTIVATE_EXCEED_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    v12 = [(OBTableWelcomeController *)&v17 initWithTitle:v11, v9, @"antenna.radiowaves.left.and.right", self, TSCellularSetupTimeoutFailureViewController, v18.receiver, v18.super_class detailText symbolName];
  }
  v14 = v12;

  v15 = v14;
  return v15;
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)TSCellularSetupTimeoutFailureViewController;
  [(TSOBTableWelcomeController *)&v26 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSCellularSetupTimeoutFailureViewController *)self navigationController];
  BOOL v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  v6 = [MEMORY[0x263F5B898] boldButton];
  continueButton = self->_continueButton;
  self->_continueButton = v6;

  [(OBBoldTrayButton *)self->_continueButton addTarget:self action:sel__continueButtonTapped forControlEvents:64];
  LODWORD(v4) = +[TSUtilities inBuddy];
  v8 = self->_continueButton;
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = v9;
  if (v4) {
    v11 = @"CONTINUE";
  }
  else {
    v11 = @"DONE";
  }
  v12 = [v9 localizedStringForKey:v11 value:&stru_26DBE8E78 table:@"Localizable"];
  [(OBBoldTrayButton *)v8 setTitle:v12 forState:0];

  v13 = [(TSCellularSetupTimeoutFailureViewController *)self buttonTray];
  [v13 addButton:self->_continueButton];

  [(OBBoldTrayButton *)self->_continueButton setEnabled:1];
  if (!+[TSUtilities inBuddy])
  {
    v14 = [(TSCellularSetupTimeoutFailureViewController *)self navigationController];
    v15 = [v14 navigationBar];
    v16 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v15 setBackgroundColor:v16];
  }
  objc_super v17 = [(OBBaseWelcomeController *)self navigationItem];
  [v17 setHidesBackButton:1 animated:0];

  if (+[TSUtilities inBuddy])
  {
    if (self->_timeoutReason == 1)
    {
      objc_super v18 = [(OBBaseWelcomeController *)self navigationItem];
      [v18 setHidesBackButton:0 animated:0];

      v19 = [MEMORY[0x263F5B8D0] linkButton];
      skipButton = self->_skipButton;
      self->_skipButton = v19;

      [(OBLinkTrayButton *)self->_skipButton setRole:2];
      v21 = self->_skipButton;
      v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v23 = [v22 localizedStringForKey:@"FINISH_SETUP" value:&stru_26DBE8E78 table:@"Localizable"];
      [(OBLinkTrayButton *)v21 setTitle:v23 forState:0];

      [(OBLinkTrayButton *)self->_skipButton addTarget:self action:sel__continueButtonTapped forControlEvents:64];
      v24 = [(TSCellularSetupTimeoutFailureViewController *)self buttonTray];
      [v24 addButton:self->_skipButton];

      v25 = [(TSCellularSetupTimeoutFailureViewController *)self buttonTray];
      [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

      [(OBBoldTrayButton *)self->_continueButton setEnabled:0];
    }
  }
}

- (void)_continueButtonTapped
{
  if (self->_timeoutReason == 1)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 postNotificationName:@"ss.user.canceled" object:@"cancel.button.event"];
  }
  else
  {
    id v3 = [(TSCellularSetupTimeoutFailureViewController *)self delegate];
    [v3 viewControllerDidComplete:self];
  }
}

- (BOOL)isStartOverRequiredOnBackButtonTapped
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
}

@end