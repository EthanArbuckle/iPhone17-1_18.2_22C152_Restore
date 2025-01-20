@interface WFSecurityMismatchAlertController
+ (id)securityMismatchAlertControllerWithNetworkName:(id)a3 previousSecurity:(id)a4 newSecurity:(id)a5 completionHandler:(id)a6;
@end

@implementation WFSecurityMismatchAlertController

+ (id)securityMismatchAlertControllerWithNetworkName:(id)a3 previousSecurity:(id)a4 newSecurity:(id)a5 completionHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v30 = a4;
  id v29 = a5;
  id v10 = a6;
  v11 = v10;
  if (!v9)
  {
    v23 = WFLogForCategory(0);
    os_log_type_t v27 = OSLogForWFLogLevel(1uLL);
    v21 = 0;
    if (WFCurrentLogLevel() && v23)
    {
      if (os_log_type_enabled(v23, v27))
      {
        *(_WORD *)buf = 0;
        v28 = "Missing network name";
LABEL_16:
        _os_log_impl(&dword_2257EC000, v23, v27, v28, buf, 2u);
      }
LABEL_17:
      v21 = 0;
      v19 = 0;
      v15 = 0;
      v17 = 0;
      v22 = 0;
      goto LABEL_7;
    }
LABEL_18:
    v19 = 0;
    v15 = 0;
    v17 = 0;
    v22 = 0;
    goto LABEL_7;
  }
  if (!v10)
  {
    v23 = WFLogForCategory(0);
    os_log_type_t v27 = OSLogForWFLogLevel(1uLL);
    v21 = 0;
    if (WFCurrentLogLevel() && v23)
    {
      if (os_log_type_enabled(v23, v27))
      {
        *(_WORD *)buf = 0;
        v28 = "Missing completion handler";
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v12 = NSString;
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"kCWLocSecurityMismatchPromptTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v15 = objc_msgSend(v12, "stringWithFormat:", v14, v9, v30, v29);

  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"kCWLocSecurityMismatchPromptDescription" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"kWFLocPromptAlertCancelButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"kWFLocPromptAlertJoinButton" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  v22 = +[WFPromptAlertController promptAlertControllerWithTitle:v15 message:v17 cancelTitle:v19 successTitle:v21 completionHandler:v11];
  v23 = WFLogForCategory(0);
  os_log_type_t v24 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v23 && os_log_type_enabled(v23, v24))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "+[WFSecurityMismatchAlertController securityMismatchAlertControllerWithNetworkName:previousSecurity:newSecurit"
          "y:completionHandler:]";
    __int16 v33 = 2112;
    v34 = v15;
    __int16 v35 = 2112;
    v36 = v17;
    _os_log_impl(&dword_2257EC000, v23, v24, "%s: title='%@' message='%@'", buf, 0x20u);
  }
LABEL_7:

  id v25 = v22;
  return v25;
}

@end