@interface UIAlertController(SensorKitUI)
+ (uint64_t)skui_alertControllerForRequiredAuthorizationIfNeccesaryForBundle:()SensorKitUI authGroup:destructiveHandler:;
+ (uint64_t)skui_alertControllerForRequiredAuthorizationIfNeccesaryForBundle:()SensorKitUI authGroup:tableView:indexPath:destructiveHandler:;
+ (void)skui_requiredAuthorizationAlertIfNeccesaryForBundle:()SensorKitUI authGroup:title:message:destructiveButtonTitle:destructiveHandler:cancelButtonTitle:cancelHandler:;
@end

@implementation UIAlertController(SensorKitUI)

+ (uint64_t)skui_alertControllerForRequiredAuthorizationIfNeccesaryForBundle:()SensorKitUI authGroup:destructiveHandler:
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v9 = [a4 localizedDisplayName];
  uint64_t v10 = objc_msgSend(a3, "sk_appName");
  uint64_t v11 = objc_msgSend(a3, "srui_localizedStudyDataAlertTitleWithAuthGroupName:", v9);
  uint64_t v12 = [a4 localizedRequiredAuthAlertDetail];
  uint64_t v17 = 0;
  uint64_t v13 = [NSString stringWithValidatedFormat:v12, @"%@%@", &v17, v10, v9 validFormatSpecifiers error];
  if (!v13)
  {
    if (_MergedGlobals_10 != -1) {
      dispatch_once(&_MergedGlobals_10, &__block_literal_global_5);
    }
    v14 = qword_26870D0A0;
    if (os_log_type_enabled((os_log_t)qword_26870D0A0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v17;
      _os_log_fault_impl(&dword_230B11000, v14, OS_LOG_TYPE_FAULT, "Failed to localize string because %{public}@", buf, 0xCu);
    }
  }
  uint64_t v15 = objc_msgSend(NSString, "srui_localizedStringForCode:", 39);
  return objc_msgSend(a1, "skui_requiredAuthorizationAlertIfNeccesaryForBundle:authGroup:title:message:destructiveButtonTitle:destructiveHandler:cancelButtonTitle:cancelHandler:", a3, a4, v11, v13, v15, a5, objc_msgSend(NSString, "srui_localizedStringForCode:", 40), 0);
}

+ (void)skui_requiredAuthorizationAlertIfNeccesaryForBundle:()SensorKitUI authGroup:title:message:destructiveButtonTitle:destructiveHandler:cancelButtonTitle:cancelHandler:
{
  if (!objc_msgSend((id)objc_msgSend(a3, "sk_requiredCategories"), "containsObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F176A8], "sensorDescriptionsForAuthorizationService:", objc_msgSend(a4, "authorizationService")), "firstObject"), "infoPlistAuthorizationCategory")))return 0; {
  v14 = (void *)[MEMORY[0x263F1C3F8] alertControllerWithTitle:a5 message:a6 preferredStyle:1];
  }
  uint64_t v15 = [MEMORY[0x263F1C3F0] actionWithTitle:a7 style:2 handler:a8];
  uint64_t v16 = [MEMORY[0x263F1C3F0] actionWithTitle:a9 style:0 handler:a10];
  [v14 addAction:v15];
  [v14 addAction:v16];
  return v14;
}

+ (uint64_t)skui_alertControllerForRequiredAuthorizationIfNeccesaryForBundle:()SensorKitUI authGroup:tableView:indexPath:destructiveHandler:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v13 = [a4 localizedDisplayName];
  uint64_t v14 = objc_msgSend(a3, "srui_localizedStudyDataAlertTitleWithAuthGroupName:", v13);
  uint64_t v15 = [a4 localizedRevokeRequiredAuthAlertDetail];
  uint64_t v22 = 0;
  uint64_t v16 = [NSString stringWithValidatedFormat:v15, @"%@", &v22, v13 validFormatSpecifiers error];
  if (!v16)
  {
    if (_MergedGlobals_10 != -1) {
      dispatch_once(&_MergedGlobals_10, &__block_literal_global_5);
    }
    uint64_t v17 = qword_26870D0A0;
    if (os_log_type_enabled((os_log_t)qword_26870D0A0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v22;
      _os_log_fault_impl(&dword_230B11000, v17, OS_LOG_TYPE_FAULT, "Failed to localize string because %{public}@", buf, 0xCu);
    }
  }
  uint64_t v18 = objc_msgSend(NSString, "srui_localizedStringForCode:", 41);
  uint64_t v19 = objc_msgSend(NSString, "srui_localizedStringForCode:", 26);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __148__UIAlertController_SensorKitUI__skui_alertControllerForRequiredAuthorizationIfNeccesaryForBundle_authGroup_tableView_indexPath_destructiveHandler___block_invoke;
  v21[3] = &unk_264BA3138;
  v21[4] = a5;
  v21[5] = a6;
  return objc_msgSend(a1, "skui_requiredAuthorizationAlertIfNeccesaryForBundle:authGroup:title:message:destructiveButtonTitle:destructiveHandler:cancelButtonTitle:cancelHandler:", a3, a4, v14, v16, v18, a7, v19, v21);
}

@end