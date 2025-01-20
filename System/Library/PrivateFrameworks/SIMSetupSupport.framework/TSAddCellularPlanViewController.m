@interface TSAddCellularPlanViewController
- (TSAddCellularPlanViewController)initWithType:(unint64_t)a3 allowDismiss:(BOOL)a4;
- (TSSIMSetupFlowDelegate)delegate;
- (void)_cancelButtonTapped;
- (void)_doneButtonTapped;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation TSAddCellularPlanViewController

- (TSAddCellularPlanViewController)initWithType:(unint64_t)a3 allowDismiss:(BOOL)a4
{
  if (a3 == 1)
  {
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v11 localizedStringForKey:@"SET_UP_CELLULAR" value:&stru_26DBE8E78 table:@"Localizable"];

    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = v8;
    v10 = @"ADD_CELLULAR_PLAN_DETAIL";
  }
  else if (a3)
  {
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v12 localizedStringForKey:@"FINISH_SETTING_UP_CELLULAR_PLAN_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = v8;
    v10 = @"FINISH_SETTING_UP_CELLULAR_PLAN_DESCRIPTION";
  }
  else
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"ADD_CELLULAR_PLAN_TITLE_ADD_PLAN" value:&stru_26DBE8E78 table:@"Localizable"];

    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = v8;
    v10 = @"ADD_CELLULAR_PLAN_DETAIL_ADD_PLAN";
  }
  v13 = [v8 localizedStringForKey:v10 value:&stru_26DBE8E78 table:@"Localizable"];

  v17.receiver = self;
  v17.super_class = (Class)TSAddCellularPlanViewController;
  v14 = [(TSAddCellularPlanViewController *)&v17 initWithTitle:v7 detailText:v13 icon:0];
  v15 = v14;
  if (v14) {
    v14->_allowDismiss = a4;
  }

  return v15;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)TSAddCellularPlanViewController;
  [(TSOBWelcomeController *)&v15 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSAddCellularPlanViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  v6 = [MEMORY[0x263F5B898] boldButton];
  [v6 addTarget:self action:sel__doneButtonTapped forControlEvents:64];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"CONTINUE" value:&stru_26DBE8E78 table:@"Localizable"];
  [v6 setTitle:v8 forState:0];

  v9 = [(TSAddCellularPlanViewController *)self buttonTray];
  [v9 addButton:v6];

  if (self->_allowDismiss)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped];
    v11 = [(OBBaseWelcomeController *)self navigationItem];
    [v11 setLeftBarButtonItem:v10];
  }
  if (!+[TSUtilities inBuddy])
  {
    v12 = [(TSAddCellularPlanViewController *)self navigationController];
    v13 = [v12 navigationBar];
    v14 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v13 setBackgroundColor:v14];
  }
}

- (void)_cancelButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userDidTapCancel];
}

- (void)_doneButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained viewControllerDidComplete:self];
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
}

@end