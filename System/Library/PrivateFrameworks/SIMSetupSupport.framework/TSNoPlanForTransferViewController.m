@interface TSNoPlanForTransferViewController
+ (id)getTitleAndDetailsForTransferCapability:(unint64_t)a3 carrier:(id)a4 phoneNumber:(id)a5 sourceDeviceName:(id)a6 isTransferNotSupportedFromiPhone:(BOOL)a7 isTransferBackPlan:(BOOL)a8;
- (BOOL)isStartOverRequiredOnBackButtonTapped;
- (TSNoPlanForTransferViewController)initWithCarrier:(id)a3 phoneNumber:(id)a4 transferCapability:(unint64_t)a5 showOtherOptions:(BOOL)a6 entryPoint:(unint64_t)a7 sourceDeviceName:(id)a8 isTransferNotSupportedFromiPhone:(BOOL)a9 isTransferBackPlan:(BOOL)a10;
- (TSSIMSetupFlowDelegate)delegate;
- (unint64_t)entryPoint;
- (void)_cancelButtonTapped;
- (void)_scanButtonTapped;
- (void)setDelegate:(id)a3;
- (void)setEntryPoint:(unint64_t)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TSNoPlanForTransferViewController

- (TSNoPlanForTransferViewController)initWithCarrier:(id)a3 phoneNumber:(id)a4 transferCapability:(unint64_t)a5 showOtherOptions:(BOOL)a6 entryPoint:(unint64_t)a7 sourceDeviceName:(id)a8 isTransferNotSupportedFromiPhone:(BOOL)a9 isTransferBackPlan:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  if (!v16)
  {
    v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v16 = [v19 localizedStringForKey:@"YOUR_CARRIER" value:&stru_26DBE8E78 table:@"Localizable"];
  }
  v20 = +[TSNoPlanForTransferViewController getTitleAndDetailsForTransferCapability:a5 carrier:v16 phoneNumber:v17 sourceDeviceName:v18 isTransferNotSupportedFromiPhone:a9 isTransferBackPlan:a10];
  v21 = [v20 objectForKeyedSubscript:@"title"];
  v22 = [v20 objectForKeyedSubscript:@"details"];
  v26.receiver = self;
  v26.super_class = (Class)TSNoPlanForTransferViewController;
  v23 = [(OBTableWelcomeController *)&v26 initWithTitle:v21 detailText:v22 symbolName:@"antenna.radiowaves.left.and.right"];
  v24 = v23;
  if (v23)
  {
    [(TSNoPlanForTransferViewController *)v23 setEntryPoint:a7];
    v24->_showOtherOptions = a6;
  }

  return v24;
}

+ (id)getTitleAndDetailsForTransferCapability:(unint64_t)a3 carrier:(id)a4 phoneNumber:(id)a5 sourceDeviceName:(id)a6 isTransferNotSupportedFromiPhone:(BOOL)a7 isTransferBackPlan:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  v53[2] = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  unint64_t v16 = 0x263F08000uLL;
  if (!v13)
  {
    id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v13 = [v17 localizedStringForKey:@"YOUR_CARRIER" value:&stru_26DBE8E78 table:@"Localizable"];
  }
  id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"TRANSFER_INELIGIBLE_PLAN" value:&stru_26DBE8E78 table:@"Localizable"];

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 0xAuLL:
    case 0xCuLL:
      v20 = _TSLogDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[TSNoPlanForTransferViewController getTitleAndDetailsForTransferCapability:carrier:phoneNumber:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:](a3, v20);
      }

      if (v8)
      {
        BOOL v21 = +[TSUtilities isPad];
        if (v14 && !v21 && [v14 length])
        {
          v22 = NSString;
          v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v24 = [v23 localizedStringForKey:@"TRANSFER_BACK_PLAN_NOT_FOUND_DETAIL_%@%@" value:&stru_26DBE8E78 table:@"Localizable"];
          objc_msgSend(v22, "stringWithFormat:", v24, v14, v13);
          v28 = LABEL_14:;

          goto LABEL_15;
        }
        v25 = NSString;
        objc_super v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v23 = v26;
        v27 = @"TRANSFER_BACK_PLAN_NOT_FOUND_DETAIL_%@";
      }
      else
      {
        v25 = NSString;
        objc_super v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v23 = v26;
        v27 = @"TRANSFER_INELIGIBLE_PLAN_DETAIL_%@";
      }
      v24 = [v26 localizedStringForKey:v27 value:&stru_26DBE8E78 table:@"Localizable"];
      objc_msgSend(v25, "stringWithFormat:", v24, v13, v51);
      goto LABEL_14;
    case 9uLL:
      v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v23 = v38;
      v39 = @"SINGLE_INELIGIBLE_ESIM_TRANSFER_CAPABILITY_INELIGIBLE_DETAIL";
      goto LABEL_25;
    case 0xBuLL:
      v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v23 = v38;
      v39 = @"SINGLE_INELIGIBLE_ESIM_TRANSFER_CAPABILITY_INELIGIBLE_DETAIL_ACTIVATION_POLICY_MISMATCH_CARRIER_UNLOCK";
LABEL_25:
      v28 = [v38 localizedStringForKey:v39 value:&stru_26DBE8E78 table:@"Localizable"];
LABEL_15:

      goto LABEL_16;
    case 0xDuLL:
      v40 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v40 localizedStringForKey:@"TRANSFER_UPDATE_REQUIRED_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
      v42 = id v41 = v15;

      v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v28 = [v43 localizedStringForKey:@"TRANSFER_TARGET_UPDATE_REQUIRED_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];

      v19 = (void *)v42;
      id v15 = v41;
      unint64_t v16 = 0x263F08000;
      goto LABEL_16;
    case 0xEuLL:
      v44 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v45 = [v44 localizedStringForKey:@"TRANSFER_UPDATE_REQUIRED_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

      if (v15 && [v15 length])
      {
        v46 = NSString;
        v47 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        [v47 localizedStringForKey:@"TRANSFER_SOURCE_UPDATE_REQUIRED_DETAIL_%@" value:&stru_26DBE8E78 table:@"Localizable"];
        v49 = id v48 = v15;
        v28 = objc_msgSend(v46, "stringWithFormat:", v49, v48);

        id v15 = v48;
        unint64_t v16 = 0x263F08000;
      }
      else
      {
        v50 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v28 = [v50 localizedStringForKey:@"TRANSFER_SOURCE_UPDATE_REQUIRED_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];
      }
      v19 = (void *)v45;
      goto LABEL_16;
    default:
      v28 = 0;
LABEL_16:
      if (v9 && +[TSUtilities isPad])
      {
        v29 = [*(id *)(v16 + 1760) bundleForClass:objc_opt_class()];
        [v29 localizedStringForKey:@"TRANSFER_FROM_IPHONE_NOT_SUPPORTED" value:&stru_26DBE8E78 table:@"Localizable"];
        id v30 = v13;
        id v31 = v14;
        v33 = id v32 = v15;

        v34 = [*(id *)(v16 + 1760) bundleForClass:objc_opt_class()];
        uint64_t v35 = [v34 localizedStringForKey:@"PRX_TRANSFER_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];

        v19 = (void *)v33;
        id v15 = v32;
        id v14 = v31;
        id v13 = v30;
        v28 = (void *)v35;
      }
      v52[0] = @"title";
      v52[1] = @"details";
      v53[0] = v19;
      v53[1] = v28;
      v36 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

      return v36;
  }
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)TSNoPlanForTransferViewController;
  [(TSOBTableWelcomeController *)&v15 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSNoPlanForTransferViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  if (self->_showOtherOptions)
  {
    v6 = [MEMORY[0x263F5B8D0] linkButton];
    [v6 addTarget:self action:sel__scanButtonTapped forControlEvents:64];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v8 = [v7 localizedStringForKey:@"OTHER_OPTIONS" value:&stru_26DBE8E78 table:@"Localizable"];
    [v6 setTitle:v8 forState:0];

    BOOL v9 = [(TSNoPlanForTransferViewController *)self buttonTray];
    [v9 addButton:v6];
  }
  if (+[TSUtilities inBuddy])
  {
    v10 = [MEMORY[0x263F5B8D0] linkButton];
    [v10 addTarget:self action:sel__cancelButtonTapped forControlEvents:64];
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"SKIP" value:&stru_26DBE8E78 table:@"Localizable"];
    [v10 setTitle:v12 forState:0];

    id v13 = [(TSNoPlanForTransferViewController *)self buttonTray];
    [v13 addButton:v10];

    id v14 = [(OBBaseWelcomeController *)self navigationItem];
    [v14 setHidesBackButton:0 animated:0];
  }
  else
  {
    v10 = [(TSNoPlanForTransferViewController *)self delegate];
    [v10 setDefaultNavigationItems:self];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TSNoPlanForTransferViewController;
  [(TSNoPlanForTransferViewController *)&v3 viewDidDisappear:a3];
}

- (void)_cancelButtonTapped
{
  [(TSNoPlanForTransferViewController *)self setEntryPoint:2];
  id v3 = [(TSNoPlanForTransferViewController *)self delegate];
  [v3 userDidTapCancel];
}

- (void)_scanButtonTapped
{
  id v3 = [(TSNoPlanForTransferViewController *)self delegate];
  [v3 restartWith:self];
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

- (unint64_t)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(unint64_t)a3
{
  self->_entryPoint = a3;
}

- (void).cxx_destruct
{
}

+ (void)getTitleAndDetailsForTransferCapability:(uint64_t)a1 carrier:(NSObject *)a2 phoneNumber:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  v5 = "+[TSNoPlanForTransferViewController getTitleAndDetailsForTransferCapability:carrier:phoneNumber:sourceDeviceName:"
       "isTransferNotSupportedFromiPhone:isTransferBackPlan:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]unexpected transfer capability : %lu @%s", (uint8_t *)&v2, 0x16u);
}

@end