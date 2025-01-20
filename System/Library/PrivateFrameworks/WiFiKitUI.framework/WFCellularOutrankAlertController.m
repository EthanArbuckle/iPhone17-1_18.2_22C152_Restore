@interface WFCellularOutrankAlertController
+ (id)cancelButtonTitleForPrivateCellular:(BOOL)a3;
+ (id)cellularOutrankAlertControllerWithNetworkName:(id)a3 chinaDevice:(BOOL)a4 privateCellular:(BOOL)a5 completionHandler:(id)a6;
+ (id)defaultButtonTitleForChinaDevice:(BOOL)a3;
+ (id)messageForChinaDevice:(BOOL)a3 privateCellular:(BOOL)a4;
+ (id)titleForNetworkName:(id)a3 chinaDevice:(BOOL)a4 privateCellular:(BOOL)a5;
- (NSString)cancelButtonTitle;
- (NSString)defaultButtonTitle;
- (void)setCancelButtonTitle:(id)a3;
- (void)setDefaultButtonTitle:(id)a3;
@end

@implementation WFCellularOutrankAlertController

+ (id)cellularOutrankAlertControllerWithNetworkName:(id)a3 chinaDevice:(BOOL)a4 privateCellular:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a6;
  v11 = v10;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  if (v9)
  {
    if (v10)
    {
      v12 = +[WFCellularOutrankAlertController titleForNetworkName:v9 chinaDevice:v8 privateCellular:v7];
      v13 = +[WFCellularOutrankAlertController messageForChinaDevice:v8 privateCellular:v7];
      v14 = +[WFCellularOutrankAlertController cancelButtonTitleForPrivateCellular:v7];
      v15 = +[WFCellularOutrankAlertController defaultButtonTitleForChinaDevice:v8];
      uint64_t v16 = +[WFPromptAlertController alertControllerWithTitle:v12 message:v13 preferredStyle:1];
      v17 = (void *)v30[5];
      v30[5] = v16;

      [(id)v30[5] setCompletionHandler:v11];
      v18 = (void *)v30[5];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __128__WFCellularOutrankAlertController_cellularOutrankAlertControllerWithNetworkName_chinaDevice_privateCellular_completionHandler___block_invoke;
      v27[3] = &unk_264756168;
      v27[4] = &v29;
      v19 = [MEMORY[0x263F82400] actionWithTitle:v15 style:0 handler:v27];
      [v18 addAction:v19];

      v20 = (void *)v30[5];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __128__WFCellularOutrankAlertController_cellularOutrankAlertControllerWithNetworkName_chinaDevice_privateCellular_completionHandler___block_invoke_2;
      v26[3] = &unk_264756168;
      v26[4] = &v29;
      v21 = [MEMORY[0x263F82400] actionWithTitle:v14 style:0 handler:v26];
      [v20 addAction:v21];

      goto LABEL_4;
    }
    v14 = WFLogForCategory(0);
    os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
    v12 = 0;
    if (WFCurrentLogLevel() && v14)
    {
      if (os_log_type_enabled(v14, v24))
      {
        *(_WORD *)buf = 0;
        v25 = "Missing completion handler";
        goto LABEL_15;
      }
      goto LABEL_16;
    }
  }
  else
  {
    v14 = WFLogForCategory(0);
    os_log_type_t v24 = OSLogForWFLogLevel(1uLL);
    v12 = 0;
    if (WFCurrentLogLevel() && v14)
    {
      if (os_log_type_enabled(v14, v24))
      {
        *(_WORD *)buf = 0;
        v25 = "Missing network name";
LABEL_15:
        _os_log_impl(&dword_2257EC000, v14, v24, v25, buf, 2u);
      }
LABEL_16:
      v12 = 0;
      v13 = 0;
      goto LABEL_4;
    }
  }
  v13 = 0;
LABEL_4:

  id v22 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v22;
}

void __128__WFCellularOutrankAlertController_cellularOutrankAlertControllerWithNetworkName_chinaDevice_privateCellular_completionHandler___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) completionHandler];
  v1[2](v1, 1);
}

void __128__WFCellularOutrankAlertController_cellularOutrankAlertControllerWithNetworkName_chinaDevice_privateCellular_completionHandler___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) completionHandler];
  v1[2](v1, 0);
}

+ (id)titleForNetworkName:(id)a3 chinaDevice:(BOOL)a4 privateCellular:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = NSString;
  BOOL v8 = (void *)MEMORY[0x263F086E0];
  id v9 = a3;
  id v10 = [v8 bundleForClass:objc_opt_class()];
  v11 = v10;
  v12 = @"kWFLocCellularOutrankAlertTitle";
  if (v6) {
    v12 = @"kWFLocCellularOutrankAlertTitle_CH";
  }
  v13 = @"kWFLocPrivateCellularOutrankAlertTitle_CH";
  if (!v6) {
    v13 = @"kWFLocPrivateCellularOutrankAlertTitle";
  }
  if (v5) {
    v14 = v13;
  }
  else {
    v14 = v12;
  }
  v15 = [v10 localizedStringForKey:v14 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  uint64_t v16 = objc_msgSend(v7, "stringWithFormat:", v15, v9);

  return v16;
}

+ (id)messageForChinaDevice:(BOOL)a3 privateCellular:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v7 = v6;
  BOOL v8 = @"kWFLocCellularOutrankAlertMessage";
  if (v5) {
    BOOL v8 = @"kWFLocCellularOutrankAlertMessage_CH";
  }
  id v9 = @"kWFLocPrivateCellularOutrankAlertMessage_CH";
  if (!v5) {
    id v9 = @"kWFLocPrivateCellularOutrankAlertMessage";
  }
  if (v4) {
    id v10 = v9;
  }
  else {
    id v10 = v8;
  }
  v11 = [v6 localizedStringForKey:v10 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v11;
}

+ (id)cancelButtonTitleForPrivateCellular:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v5 = v4;
  if (v3) {
    BOOL v6 = @"kWFLocPromptAlertPrivateCellularOutrankCancelButton";
  }
  else {
    BOOL v6 = @"kWFLocPromptAlertCellularOutrankCancelButton";
  }
  BOOL v7 = [v4 localizedStringForKey:v6 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v7;
}

+ (id)defaultButtonTitleForChinaDevice:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v5 = v4;
  if (v3) {
    BOOL v6 = @"kWFLocPromptAlertCellularOutrankAcceptButton_CH";
  }
  else {
    BOOL v6 = @"kWFLocPromptAlertCellularOutrankAcceptButton";
  }
  BOOL v7 = [v4 localizedStringForKey:v6 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v7;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
}

@end