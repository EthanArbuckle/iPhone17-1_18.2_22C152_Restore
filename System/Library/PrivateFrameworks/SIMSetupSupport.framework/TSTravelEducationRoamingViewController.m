@interface TSTravelEducationRoamingViewController
- (CoreTelephonyClient)client;
- (TSSIMSetupFlowDelegate)delegate;
- (TSTravelEducationRoamingViewController)init;
- (void)_cancelButtonTapped;
- (void)_doneButtonTapped;
- (void)_openRoamingSettings;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation TSTravelEducationRoamingViewController

- (TSTravelEducationRoamingViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"TRAVEL_ROAMING_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"TRAVEL_ROAMING_BODY" value:&stru_26DBE8E78 table:@"Localizable"];

  dispatch_queue_t v7 = dispatch_queue_create((const char *)@"Core Analytics", 0);
  v8 = (CoreTelephonyClient *)[objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v7];
  client = self->_client;
  self->_client = v8;

  v12.receiver = self;
  v12.super_class = (Class)TSTravelEducationRoamingViewController;
  v10 = [(TSTravelEducationRoamingViewController *)&v12 initWithTitle:v4 detailText:v6 symbolName:@"antenna.radiowaves.left.and.right"];

  return v10;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)TSTravelEducationRoamingViewController;
  [(TSOBWelcomeController *)&v17 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSTravelEducationRoamingViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  v6 = [MEMORY[0x263F5B898] boldButton];
  [v6 addTarget:self action:sel__doneButtonTapped forControlEvents:64];
  dispatch_queue_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"CONTINUE" value:&stru_26DBE8E78 table:@"Localizable"];
  [v6 setTitle:v8 forState:0];

  v9 = [(TSTravelEducationRoamingViewController *)self buttonTray];
  [v9 addButton:v6];

  v10 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped];
  v11 = [(OBBaseWelcomeController *)self navigationItem];
  [v11 setRightBarButtonItem:v10];

  objc_super v12 = [(TSTravelEducationRoamingViewController *)self navigationController];
  v13 = [v12 navigationItem];
  [v13 setHidesBackButton:0];

  v14 = [(TSTravelEducationRoamingViewController *)self navigationController];
  v15 = [v14 navigationBar];
  v16 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v15 setBackgroundColor:v16];
}

- (void)_cancelButtonTapped
{
  client = self->_client;
  uint64_t v5 = 0;
  [(CoreTelephonyClient *)client sendTravelBuddyCAEvent:@"Roaming View Controller_Cancel" carrierName:&stru_26DBE8E78 error:&v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userDidTapCancel];
}

- (void)_doneButtonTapped
{
  client = self->_client;
  uint64_t v5 = 0;
  [(CoreTelephonyClient *)client sendTravelBuddyCAEvent:@"Roaming View Controller_Done" carrierName:&stru_26DBE8E78 error:&v5];
  [(TSTravelEducationRoamingViewController *)self _openRoamingSettings];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained viewControllerDidComplete:self];
}

- (void)_openRoamingSettings
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F01880]);
  v3 = NSURL;
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"TRAVEL_OPEN_ROAMING_URL" value:&stru_26DBE8E78 table:@"Localizable"];
  v6 = [v3 URLWithString:v5];

  id v12 = 0;
  int v7 = [v2 openSensitiveURL:v6 withOptions:0 error:&v12];
  id v8 = v12;
  if (v8)
  {
    v9 = _TSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 localizedDescription];
      uint64_t v11 = [v10 UTF8String];
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = v11;
      __int16 v15 = 1024;
      int v16 = v7;
      __int16 v17 = 2080;
      v18 = "-[TSTravelEducationRoamingViewController _openRoamingSettings]";
      _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "launching data roaming settings failed with error: %s, isOpened:%d\n @%s", buf, 0x1Cu);
    }
  }
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