@interface WFCarPlayAlertController
+ (id)carPlayAlertControllerWithNetworkName:(id)a3 carName:(id)a4 completionHandler:(id)a5;
@end

@implementation WFCarPlayAlertController

+ (id)carPlayAlertControllerWithNetworkName:(id)a3 carName:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (!v7)
  {
    v27 = WFLogForCategory(0);
    os_log_type_t v28 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v27 || !os_log_type_enabled(v27, v28)) {
      goto LABEL_17;
    }
    __int16 v33 = 0;
    v29 = "Missing network name";
    v30 = (uint8_t *)&v33;
    goto LABEL_16;
  }
  if (!v9)
  {
    v27 = WFLogForCategory(0);
    os_log_type_t v28 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v27 || !os_log_type_enabled(v27, v28)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v29 = "Missing completion handler";
    v30 = buf;
LABEL_16:
    _os_log_impl(&dword_2257EC000, v27, v28, v29, v30, 2u);
LABEL_17:

    v23 = 0;
    v21 = 0;
    v15 = 0;
    v19 = 0;
    v24 = 0;
    goto LABEL_7;
  }
  id v31 = v9;
  if (v8)
  {
    v11 = NSString;
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"kWFLocDisableCarPlayAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    id v14 = v8;
    v15 = objc_msgSend(v11, "stringWithFormat:", v13, v8);
  }
  else
  {
    id v14 = 0;
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v12 localizedStringForKey:@"kWFLocDisableCarPlayAlertTitleNoCarName" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  }

  v16 = NSString;
  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"kWFLocDisableCarPlayAlertMessage" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v19 = objc_msgSend(v16, "stringWithFormat:", v18, v7);

  v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"kWFLocPromptAlertCancelButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v23 = [v22 localizedStringForKey:@"kWFLocPromptAlertJoinButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  v10 = v31;
  v24 = +[WFPromptAlertController promptAlertControllerWithTitle:v15 message:v19 cancelTitle:v21 successTitle:v23 completionHandler:v31];
  id v8 = v14;
LABEL_7:
  id v25 = v24;

  return v25;
}

@end