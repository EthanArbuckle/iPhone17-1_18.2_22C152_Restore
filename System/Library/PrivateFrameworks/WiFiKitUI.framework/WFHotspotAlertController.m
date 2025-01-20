@interface WFHotspotAlertController
+ (id)hotspotAlertControllerWithNetworkName:(id)a3 completionHandler:(id)a4;
@end

@implementation WFHotspotAlertController

+ (id)hotspotAlertControllerWithNetworkName:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v21 = WFLogForCategory(0);
    os_log_type_t v22 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v21 || !os_log_type_enabled(v21, v22)) {
      goto LABEL_14;
    }
    __int16 v26 = 0;
    v23 = "Missing network name";
    v24 = (uint8_t *)&v26;
    goto LABEL_13;
  }
  if (!v6)
  {
    v21 = WFLogForCategory(0);
    os_log_type_t v22 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v21 || !os_log_type_enabled(v21, v22)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v23 = "Missing completion handler";
    v24 = buf;
LABEL_13:
    _os_log_impl(&dword_2257EC000, v21, v22, v23, v24, 2u);
LABEL_14:

    v17 = 0;
    v15 = 0;
    v13 = 0;
    v9 = 0;
    v18 = 0;
    goto LABEL_4;
  }
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"kWFLocDisablePersonalHotspotAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  v10 = NSString;
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"kWFLocDisablePersonalHotspotAlertMessage" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v13 = objc_msgSend(v10, "stringWithFormat:", v12, v5);

  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"kWFLocPromptAlertCancelButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"kWFLocPromptAlertJoinButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  v18 = +[WFPromptAlertController promptAlertControllerWithTitle:v9 message:v13 cancelTitle:v15 successTitle:v17 completionHandler:v7];
LABEL_4:
  id v19 = v18;

  return v19;
}

@end