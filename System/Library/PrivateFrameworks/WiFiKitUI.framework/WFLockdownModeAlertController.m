@interface WFLockdownModeAlertController
+ (id)lockdownModeAlertControllerWithNetworkName:(id)a3 securityType:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation WFLockdownModeAlertController

+ (id)lockdownModeAlertControllerWithNetworkName:(id)a3 securityType:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = v8;
  if (!v7)
  {
    v46 = WFLogForCategory(0);
    os_log_type_t v47 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v46 || !os_log_type_enabled(v46, v47)) {
      goto LABEL_23;
    }
    __int16 v51 = 0;
    v48 = "Missing network name";
    v49 = (uint8_t *)&v51;
    goto LABEL_22;
  }
  if (!v8)
  {
    v46 = WFLogForCategory(0);
    os_log_type_t v47 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v46 || !os_log_type_enabled(v46, v47)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v48 = "Missing completion handler";
    v49 = buf;
LABEL_22:
    _os_log_impl(&dword_2257EC000, v46, v47, v48, v49, 2u);
LABEL_23:

    v42 = 0;
    v40 = 0;
    v38 = 0;
    v13 = 0;
    v43 = 0;
    goto LABEL_13;
  }
  switch(a4)
  {
    case 0uLL:
      v10 = NSString;
      v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = [v11 localizedStringForKey:@"kWFLocLockdownModeOpenAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v13 = objc_msgSend(v10, "stringWithFormat:", v12, v7);

      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = v14;
      v16 = @"kWFLocLockdownModeOpenAlertMessage";
      break;
    case 1uLL:
      v20 = NSString;
      v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v22 = [v21 localizedStringForKey:@"kWFLocLockdownModeWeakAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v13 = objc_msgSend(v20, "stringWithFormat:", v22, v7);

      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = v14;
      v16 = @"kWFLocLockdownModeWPAAlertMessage";
      break;
    case 2uLL:
      v23 = NSString;
      v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v25 = [v24 localizedStringForKey:@"kWFLocLockdownModeWeakAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v13 = objc_msgSend(v23, "stringWithFormat:", v25, v7);

      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = v14;
      v16 = @"kWFLocLockdownModeWEPAlertMessage";
      break;
    case 3uLL:
      v26 = NSString;
      v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v28 = [v27 localizedStringForKey:@"kWFLocLockdownModeWeakAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v13 = objc_msgSend(v26, "stringWithFormat:", v28, v7);

      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = v14;
      v16 = @"kWFLocLockdownModeWAPIAlertMessage";
      break;
    case 4uLL:
      v29 = NSString;
      v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v31 = [v30 localizedStringForKey:@"kWFLocLockdownModeWeakAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v13 = objc_msgSend(v29, "stringWithFormat:", v31, v7);

      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = v14;
      v16 = @"kWFLocLockdownModeWPATKIPAlertMessage";
      break;
    case 5uLL:
      v32 = NSString;
      v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v34 = [v33 localizedStringForKey:@"kWFLocLockdownModePasspointAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v13 = objc_msgSend(v32, "stringWithFormat:", v34, v7);

      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = v14;
      v16 = @"kWFLocLockdownModePasspointAlertMessage";
      break;
    case 6uLL:
      v35 = NSString;
      v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v37 = [v36 localizedStringForKey:@"kWFLocLockdownModeCaptiveAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v13 = objc_msgSend(v35, "stringWithFormat:", v37, v7);

      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = v14;
      v16 = @"kWFLocLockdownModeCaptiveAlertMessage";
      break;
    default:
      v17 = NSString;
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = [v18 localizedStringForKey:@"kWFLocLockdownModeOtherAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v13 = objc_msgSend(v17, "stringWithFormat:", v19, v7);

      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = v14;
      v16 = @"kWFLocLockdownModeOtherAlertMessage";
      break;
  }
  v38 = [v14 localizedStringForKey:v16 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v40 = [v39 localizedStringForKey:@"kWFLocPromptAlertCancelButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v42 = [v41 localizedStringForKey:@"kWFLocPromptAlertJoinButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  v43 = +[WFPromptAlertController promptAlertControllerWithTitle:v13 message:v38 cancelTitle:v40 successTitle:v42 completionHandler:v9];
LABEL_13:
  id v44 = v43;

  return v44;
}

@end