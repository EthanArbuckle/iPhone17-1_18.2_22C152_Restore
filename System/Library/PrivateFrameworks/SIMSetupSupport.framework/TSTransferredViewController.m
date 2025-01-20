@interface TSTransferredViewController
- (TSSIMSetupFlowDelegate)delegate;
- (TSTransferredViewController)initWithTransferredPlan:(id)a3;
- (void)_doneButtonTapped;
- (void)_skipButtonTapped;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation TSTransferredViewController

- (TSTransferredViewController)initWithTransferredPlan:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"planItem"];
  v6 = [v5 phoneNumber];
  v7 = +[TSUtilities formattedPhoneNumber:v6 withCountryCode:0];

  v8 = [v4 objectForKeyedSubscript:@"deviceInfo"];
  v9 = [v8 deviceName];

  v10 = _TSLogDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[TSTransferredViewController initWithTransferredPlan:]((uint64_t)v4, v10);
  }

  uint64_t v11 = [v7 length];
  uint64_t v12 = [v9 length];
  uint64_t v13 = v12;
  if (v11)
  {
    v14 = NSString;
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = v15;
    if (v13)
    {
      v17 = [v15 localizedStringForKey:@"PLAN_TRANSFERRED_DETAIL_%@_%@" value:&stru_26DBE8E78 table:@"Localizable"];
      v24 = v9;
    }
    else
    {
      v17 = [v15 localizedStringForKey:@"PLAN_TRANSFERRED_DETAIL_NO_DEVICE_NAME_%@" value:&stru_26DBE8E78 table:@"Localizable"];
    }
    objc_msgSend(v14, "stringWithFormat:", v17, v7, v24);
  }
  else
  {
    if (!v12)
    {
      v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = [v16 localizedStringForKey:@"PLAN_TRANSFERRED_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];
      goto LABEL_11;
    }
    v18 = NSString;
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"PLAN_TRANSFERRED_DETAIL_NO_PHONENUMBER_%@" value:&stru_26DBE8E78 table:@"Localizable"];
    objc_msgSend(v18, "stringWithFormat:", v17, v9, v24);
  v19 = };

LABEL_11:
  v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"PLAN_TRANSFERRED_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
  v25.receiver = self;
  v25.super_class = (Class)TSTransferredViewController;
  v22 = [(TSTransferredViewController *)&v25 initWithTitle:v21 detailText:v19 icon:0];

  return v22;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)TSTransferredViewController;
  [(TSOBWelcomeController *)&v14 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  id v4 = [(TSTransferredViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  v6 = [MEMORY[0x263F5B898] boldButton];
  [v6 addTarget:self action:sel__doneButtonTapped forControlEvents:64];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"CONTINUE" value:&stru_26DBE8E78 table:@"Localizable"];
  [v6 setTitle:v8 forState:0];

  v9 = [(TSTransferredViewController *)self buttonTray];
  [v9 addButton:v6];

  v10 = [MEMORY[0x263F5B8D0] linkButton];
  [v10 addTarget:self action:sel__skipButtonTapped forControlEvents:64];
  uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 localizedStringForKey:@"NOT_NOW" value:&stru_26DBE8E78 table:@"Localizable"];
  [v10 setTitle:v12 forState:0];

  uint64_t v13 = [(TSTransferredViewController *)self buttonTray];
  [v13 addButton:v10];
}

- (void)_skipButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained viewControllerDidComplete:self];
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

- (void)initWithTransferredPlan:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  v5 = "-[TSTransferredViewController initWithTransferredPlan:]";
  _os_log_debug_impl(&dword_227A17000, a2, OS_LOG_TYPE_DEBUG, "[Db] transferred plan: %@ @%s", (uint8_t *)&v2, 0x16u);
}

@end