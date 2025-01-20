@interface TSCellularSetupCompleteViewController
- (TSCellularSetupCompleteViewController)initWithPhoneNumber:(id)a3 planName:(id)a4 planActiveOnSource:(BOOL)a5;
- (TSSIMSetupFlowDelegate)delegate;
- (void)_continueButtonTapped;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation TSCellularSetupCompleteViewController

- (TSCellularSetupCompleteViewController)initWithPhoneNumber:(id)a3 planName:(id)a4 planActiveOnSource:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (a5)
  {
    uint64_t v11 = [v9 length];
    v12 = NSString;
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = v13;
    if (v11)
    {
      v15 = [v13 localizedStringForKey:@"CELLULAR_PLAN_COMPLETE_DETAIL_PHONENUMBER_%@" value:&stru_26DBE8E78 table:@"Localizable"];
      v5 = +[TSUtilities formattedPhoneNumber:v9 withCountryCode:0];
      v16 = objc_msgSend(v12, "stringWithFormat:", v15, v5);
LABEL_10:

      goto LABEL_11;
    }
    v17 = @"CELLULAR_PLAN_COMPLETE_DETAIL_%@";
  }
  else
  {
    v12 = NSString;
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = v13;
    v17 = @"CELLULAR_PLAN_COMPLETE_DETAIL_FOR_DISABLED_ESIM_%@";
  }
  v15 = [v13 localizedStringForKey:v17 value:&stru_26DBE8E78 table:@"Localizable"];
  uint64_t v18 = [v10 length];
  v19 = v10;
  if (!v18)
  {
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v19 = [v5 localizedStringForKey:@"TRANSFER_PLAN_ITEM_TITLE_NO_CARRIER_NAME" value:&stru_26DBE8E78 table:@"Localizable"];
  }
  v16 = objc_msgSend(v12, "stringWithFormat:", v15, v19);
  if (!v18)
  {

    goto LABEL_10;
  }
LABEL_11:

  v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"CELLULAR_PLAN_COMPLETE_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
  v24.receiver = self;
  v24.super_class = (Class)TSCellularSetupCompleteViewController;
  v22 = [(TSCellularSetupCompleteViewController *)&v24 initWithTitle:v21 detailText:v16 symbolName:@"antenna.radiowaves.left.and.right"];

  return v22;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)TSCellularSetupCompleteViewController;
  [(TSOBWelcomeController *)&v18 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSCellularSetupCompleteViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  v6 = [MEMORY[0x263F5B898] boldButton];
  continueButton = self->_continueButton;
  self->_continueButton = v6;

  [(OBBoldTrayButton *)self->_continueButton addTarget:self action:sel__continueButtonTapped forControlEvents:64];
  LODWORD(v3) = +[TSUtilities inBuddy];
  v8 = self->_continueButton;
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = v9;
  if (v3) {
    uint64_t v11 = @"CONTINUE";
  }
  else {
    uint64_t v11 = @"DONE";
  }
  v12 = [v9 localizedStringForKey:v11 value:&stru_26DBE8E78 table:@"Localizable"];
  [(OBBoldTrayButton *)v8 setTitle:v12 forState:0];

  v13 = [(TSCellularSetupCompleteViewController *)self buttonTray];
  [v13 addButton:self->_continueButton];

  [(OBBoldTrayButton *)self->_continueButton setEnabled:1];
  if (!+[TSUtilities inBuddy])
  {
    v14 = [(TSCellularSetupCompleteViewController *)self navigationController];
    v15 = [v14 navigationBar];
    v16 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v15 setBackgroundColor:v16];
  }
  v17 = [(OBBaseWelcomeController *)self navigationItem];
  [v17 setHidesBackButton:1 animated:0];
}

- (void)_continueButtonTapped
{
  id v3 = [(TSCellularSetupCompleteViewController *)self delegate];
  [v3 viewControllerDidComplete:self];
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
  objc_storeStrong(&self->viewController, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
}

@end