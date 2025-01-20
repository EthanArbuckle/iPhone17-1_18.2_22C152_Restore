@interface TSTravelEducationExistingPlanViewController
- (CoreTelephonyClient)client;
- (TSSIMSetupFlowDelegate)delegate;
- (TSTravelEducationExistingPlanViewController)init;
- (void)_cancelButtonTapped;
- (void)_doneButtonTapped;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation TSTravelEducationExistingPlanViewController

- (TSTravelEducationExistingPlanViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"TRAVEL_EXISTING_PLAN_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"TRAVEL_EXISTING_PLAN_BODY" value:&stru_26DBE8E78 table:@"Localizable"];

  dispatch_queue_t v7 = dispatch_queue_create((const char *)@"Core Analytics", 0);
  v8 = (CoreTelephonyClient *)[objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v7];
  client = self->_client;
  self->_client = v8;

  v12.receiver = self;
  v12.super_class = (Class)TSTravelEducationExistingPlanViewController;
  v10 = [(TSTravelEducationExistingPlanViewController *)&v12 initWithTitle:v4 detailText:v6 symbolName:@"antenna.radiowaves.left.and.right"];

  return v10;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)TSTravelEducationExistingPlanViewController;
  [(TSOBWelcomeController *)&v14 viewDidLoad];
  v3 = [MEMORY[0x263F5B898] boldButton];
  [v3 addTarget:self action:sel__doneButtonTapped forControlEvents:64];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"CONTINUE" value:&stru_26DBE8E78 table:@"Localizable"];
  [v3 setTitle:v5 forState:0];

  v6 = [(TSTravelEducationExistingPlanViewController *)self buttonTray];
  [v6 addButton:v3];

  dispatch_queue_t v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped];
  v8 = [(OBBaseWelcomeController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  v9 = [(TSTravelEducationExistingPlanViewController *)self navigationController];
  v10 = [v9 navigationItem];
  [v10 setHidesBackButton:0];

  v11 = [(TSTravelEducationExistingPlanViewController *)self navigationController];
  objc_super v12 = [v11 navigationBar];
  v13 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v12 setBackgroundColor:v13];
}

- (void)_cancelButtonTapped
{
  client = self->_client;
  uint64_t v5 = 0;
  [(CoreTelephonyClient *)client sendTravelBuddyCAEvent:@"Existing Plan View Controller_Cancel" carrierName:&stru_26DBE8E78 error:&v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userDidTapCancel];
}

- (void)_doneButtonTapped
{
  client = self->_client;
  uint64_t v5 = 0;
  [(CoreTelephonyClient *)client sendTravelBuddyCAEvent:@"Existing Plan View Controller_Done" carrierName:&stru_26DBE8E78 error:&v5];
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

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end