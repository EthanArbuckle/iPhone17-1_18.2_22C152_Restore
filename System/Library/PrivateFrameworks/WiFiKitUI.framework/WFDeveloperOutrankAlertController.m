@interface WFDeveloperOutrankAlertController
+ (id)developerOutrankAlertControllerWithNetworkName:(id)a3 chinaDevice:(BOOL)a4 completionHandler:(id)a5;
+ (id)messageForChinaDevice:(BOOL)a3;
+ (id)okButtonTitle;
+ (id)settingsButtonTitle;
+ (id)titleForNetworkName:(id)a3 chinaDevice:(BOOL)a4;
- (NSString)okButtonTitle;
- (NSString)settingButtonTitle;
- (void)setOkButtonTitle:(id)a3;
- (void)setSettingButtonTitle:(id)a3;
@end

@implementation WFDeveloperOutrankAlertController

+ (id)developerOutrankAlertControllerWithNetworkName:(id)a3 chinaDevice:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  v9 = v8;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  if (v7)
  {
    if (v8)
    {
      v10 = +[WFDeveloperOutrankAlertController titleForNetworkName:v7 chinaDevice:v6];
      v11 = +[WFDeveloperOutrankAlertController messageForChinaDevice:v6];
      v12 = +[WFDeveloperOutrankAlertController okButtonTitle];
      v13 = +[WFDeveloperOutrankAlertController settingsButtonTitle];
      uint64_t v14 = +[WFPromptAlertController alertControllerWithTitle:v10 message:v11 preferredStyle:1];
      v15 = (void *)v28[5];
      v28[5] = v14;

      [(id)v28[5] setCompletionHandler:v9];
      v16 = (void *)v28[5];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __114__WFDeveloperOutrankAlertController_developerOutrankAlertControllerWithNetworkName_chinaDevice_completionHandler___block_invoke;
      v25[3] = &unk_264756168;
      v25[4] = &v27;
      v17 = [MEMORY[0x263F82400] actionWithTitle:v12 style:0 handler:v25];
      [v16 addAction:v17];

      v18 = (void *)v28[5];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __114__WFDeveloperOutrankAlertController_developerOutrankAlertControllerWithNetworkName_chinaDevice_completionHandler___block_invoke_2;
      v24[3] = &unk_264756168;
      v24[4] = &v27;
      v19 = [MEMORY[0x263F82400] actionWithTitle:v13 style:0 handler:v24];
      [v18 addAction:v19];

      goto LABEL_4;
    }
    v12 = WFLogForCategory(0);
    os_log_type_t v22 = OSLogForWFLogLevel(1uLL);
    v11 = 0;
    if (WFCurrentLogLevel() && v12)
    {
      if (os_log_type_enabled(v12, v22))
      {
        *(_WORD *)buf = 0;
        v23 = "Missing completion handler";
        goto LABEL_15;
      }
      goto LABEL_16;
    }
  }
  else
  {
    v12 = WFLogForCategory(0);
    os_log_type_t v22 = OSLogForWFLogLevel(1uLL);
    v11 = 0;
    if (WFCurrentLogLevel() && v12)
    {
      if (os_log_type_enabled(v12, v22))
      {
        *(_WORD *)buf = 0;
        v23 = "Missing network name";
LABEL_15:
        _os_log_impl(&dword_2257EC000, v12, v22, v23, buf, 2u);
      }
LABEL_16:
      v11 = 0;
      v10 = 0;
      goto LABEL_4;
    }
  }
  v10 = 0;
LABEL_4:

  id v20 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v20;
}

void __114__WFDeveloperOutrankAlertController_developerOutrankAlertControllerWithNetworkName_chinaDevice_completionHandler___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) completionHandler];
  v1[2](v1, 0);
}

void __114__WFDeveloperOutrankAlertController_developerOutrankAlertControllerWithNetworkName_chinaDevice_completionHandler___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) completionHandler];
  v1[2](v1, 1);
}

+ (id)titleForNetworkName:(id)a3 chinaDevice:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = NSString;
  BOOL v6 = (void *)MEMORY[0x263F086E0];
  id v7 = a3;
  id v8 = [v6 bundleForClass:objc_opt_class()];
  v9 = v8;
  if (v4) {
    v10 = @"kWFLocDeveloperOutrankAlertTitle_CH";
  }
  else {
    v10 = @"kWFLocDeveloperOutrankAlertTitle";
  }
  v11 = [v8 localizedStringForKey:v10 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v12 = objc_msgSend(v5, "stringWithFormat:", v11, v7);

  return v12;
}

+ (id)messageForChinaDevice:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = v4;
  if (v3) {
    BOOL v6 = @"kWFLocDeveloperOutrankAlertMessage_CH";
  }
  else {
    BOOL v6 = @"kWFLocDeveloperOutrankAlertMessage";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v7;
}

+ (id)okButtonTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"kWFLocPromptAlertDeveloperOutrankOKButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v3;
}

+ (id)settingsButtonTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"kWFLocPromptAlertDeveloperOutrankSettingsButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v3;
}

- (NSString)okButtonTitle
{
  return self->_okButtonTitle;
}

- (void)setOkButtonTitle:(id)a3
{
}

- (NSString)settingButtonTitle
{
  return self->_settingButtonTitle;
}

- (void)setSettingButtonTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingButtonTitle, 0);
  objc_storeStrong((id *)&self->_okButtonTitle, 0);
}

@end