@interface ICSAccountSaveErrorHandler
- (ICSAccountSaveErrorHandler)initWithPresenter:(id)a3;
- (void)_beginManateeUpgradeForAccount:(id)a3 failedDataclassName:(id)a4;
- (void)_displayAccountSaveErrorAlertWithTitle:(id)a3 message:(id)a4 alternativeAction:(id)a5;
- (void)_handleInsufficientStorageWithUserInfo:(id)a3;
- (void)_handleManateeErrorForAccount:(id)a3 withDescription:(id)a4 failedDataclasses:(id)a5;
- (void)_handleMaxTierAndInsufficientStorageErrorWithFailedDataclasses:(id)a3;
- (void)handleAccountSaveError:(id)a3 forAccount:(id)a4 failedDataclasses:(id)a5;
@end

@implementation ICSAccountSaveErrorHandler

- (ICSAccountSaveErrorHandler)initWithPresenter:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSAccountSaveErrorHandler;
  v5 = [(ICSAccountSaveErrorHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_presenter, v4);
  }

  return v6;
}

- (void)handleAccountSaveError:(id)a3 forAccount:(id)a4 failedDataclasses:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 domain];
  int v12 = [v11 isEqualToString:*MEMORY[0x263F25648]];

  if (v12)
  {
    uint64_t v13 = [v8 code];
    switch(v13)
    {
      case 2:
        v23 = LogSubsystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[ICSAccountSaveErrorHandler handleAccountSaveError:forAccount:failedDataclasses:].cold.4(v23, v24, v25, v26, v27, v28, v29, v30);
        }

        [(ICSAccountSaveErrorHandler *)self _handleMaxTierAndInsufficientStorageErrorWithFailedDataclasses:v10];
        break;
      case 1:
        v31 = LogSubsystem();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[ICSAccountSaveErrorHandler handleAccountSaveError:forAccount:failedDataclasses:](v31, v32, v33, v34, v35, v36, v37, v38);
        }

        v22 = [v8 localizedRecoverySuggestion];
        [(ICSAccountSaveErrorHandler *)self _handleManateeErrorForAccount:v9 withDescription:v22 failedDataclasses:v10];
        goto LABEL_14;
      case 0:
        v14 = LogSubsystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[ICSAccountSaveErrorHandler handleAccountSaveError:forAccount:failedDataclasses:](v14, v15, v16, v17, v18, v19, v20, v21);
        }

        v22 = [v8 userInfo];
        [(ICSAccountSaveErrorHandler *)self _handleInsufficientStorageWithUserInfo:v22];
LABEL_14:

        break;
      default:
        v39 = LogSubsystem();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          -[ICSAccountSaveErrorHandler handleAccountSaveError:forAccount:failedDataclasses:]((uint64_t)v8, v39);
        }

        break;
    }
  }
  [v9 reload];
}

- (void)_handleInsufficientStorageWithUserInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__ICSAccountSaveErrorHandler__handleInsufficientStorageWithUserInfo___block_invoke;
  v6[3] = &unk_2655B5900;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __69__ICSAccountSaveErrorHandler__handleInsufficientStorageWithUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  int v12 = objc_alloc_init(ICSCloudStorageOffersManager);
  v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F25650]];
  v3 = (void *)v8[5];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v5 = [WeakRetained navigationController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__ICSAccountSaveErrorHandler__handleInsufficientStorageWithUserInfo___block_invoke_40;
  v6[3] = &unk_2655B5BF0;
  void v6[4] = &v7;
  [v3 presentCloudStorageOffersPageFromNavigationController:v5 requiredStorageThreshold:v2 completionHandler:v6];

  _Block_object_dispose(&v7, 8);
}

void __69__ICSAccountSaveErrorHandler__handleInsufficientStorageWithUserInfo___block_invoke_40(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)_handleManateeErrorForAccount:(id)a3 withDescription:(id)a4 failedDataclasses:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__ICSAccountSaveErrorHandler__handleManateeErrorForAccount_withDescription_failedDataclasses___block_invoke;
  block[3] = &unk_2655B5C18;
  id v12 = v8;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __94__ICSAccountSaveErrorHandler__handleManateeErrorForAccount_withDescription_failedDataclasses___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) anyObject];
  id v8 = (id)v2;
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v2 = (uint64_t)v8;
    if (isKindOfClass)
    {
      id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      v6 = [v5 specifierForID:v8];

      id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      [v7 startSpinnerInSpecifier:v6];

      uint64_t v2 = (uint64_t)v8;
    }
  }
  [*(id *)(a1 + 40) _beginManateeUpgradeForAccount:*(void *)(a1 + 48) failedDataclassName:v2];
}

- (void)_beginManateeUpgradeForAccount:(id)a3 failedDataclassName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263F34A18]);
  id v9 = objc_msgSend(v6, "aa_altDSID");
  id v10 = (void *)[v8 initWithAltDSID:v9];

  [v10 setDeviceToDeviceEncryptionUpgradeUIStyle:0];
  [v10 setDeviceToDeviceEncryptionUpgradeType:0];
  if ([v7 isEqualToString:*MEMORY[0x263EFACC8]])
  {
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"UPGRADE_ACCOUNT_SECURITY_FEATURE_MESSAGES" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    [v10 setFeatureName:v12];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  [v10 setPresentingViewController:WeakRetained];

  id v14 = (void *)[objc_alloc(MEMORY[0x263F34A20]) initWithContext:v10];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__ICSAccountSaveErrorHandler__beginManateeUpgradeForAccount_failedDataclassName___block_invoke;
  v17[3] = &unk_2655B5C68;
  v17[4] = self;
  id v18 = v7;
  id v19 = v6;
  id v15 = v6;
  id v16 = v7;
  [v14 performDeviceToDeviceEncryptionStateRepairWithCompletion:v17];
}

void __81__ICSAccountSaveErrorHandler__beginManateeUpgradeForAccount_failedDataclassName___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v8 stopSpinnerInActiveSpecifier];
  }
  if ((a2 & 1) == 0)
  {
    id v14 = LogSubsystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __81__ICSAccountSaveErrorHandler__beginManateeUpgradeForAccount_failedDataclassName___block_invoke_cold_1((uint64_t)v5, v14);
    }

    id v15 = [v5 domain];
    if ([v15 isEqualToString:*MEMORY[0x263F342B0]]) {
      BOOL v16 = [v5 code] == 5900;
    }
    else {
      BOOL v16 = 0;
    }

    if ([MEMORY[0x263F20318] isInternalBuild] && objc_msgSend(v5, "code") != -5307)
    {
      char v17 = [v5 code] != -5308 || v16;
      if ((v17 & 1) == 0) {
        goto LABEL_25;
      }
    }
    else if (!v16)
    {
      goto LABEL_25;
    }
    id v18 = NSString;
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v21 = v20;
    if (v19)
    {
      v22 = [v20 localizedStringForKey:@"HSA2_UPGRADE_FAILURE_MESSAGE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
      v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v24 = [v23 localizedStringForKey:*(void *)(a1 + 40) value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
      uint64_t v25 = objc_msgSend(*(id *)(a1 + 48), "aa_formattedUsername");
      id v9 = objc_msgSend(v18, "stringWithFormat:", v22, v24, v25);

      uint64_t v26 = NSString;
      uint64_t v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v28 = [v27 localizedStringForKey:@"HSA2_UPGRADE_FAILURE_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
      uint64_t v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v30 = [v29 localizedStringForKey:*(void *)(a1 + 40) value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
      v31 = objc_msgSend(v26, "stringWithFormat:", v28, v30);
    }
    else
    {
      uint64_t v32 = [v20 localizedStringForKey:@"HSA2_UPGRADE_FAILURE_MESSAGE_NO_FEATURE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
      uint64_t v33 = objc_msgSend(*(id *)(a1 + 48), "aa_formattedUsername");
      id v9 = objc_msgSend(v18, "stringWithFormat:", v32, v33);

      uint64_t v34 = NSString;
      uint64_t v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v28 = [v27 localizedStringForKey:@"HSA2_UPGRADE_FAILURE_TITLE_NO_FEATURE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
      v31 = [v34 stringWithFormat:v28];
    }

    uint64_t v35 = (void *)MEMORY[0x263F82400];
    uint64_t v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v37 = [v36 localizedStringForKey:@"LEARN_MORE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __81__ICSAccountSaveErrorHandler__beginManateeUpgradeForAccount_failedDataclassName___block_invoke_74;
    v39[3] = &unk_2655B5C40;
    v39[4] = *(void *)(a1 + 32);
    uint64_t v38 = [v35 actionWithTitle:v37 style:0 handler:v39];

    [*(id *)(a1 + 32) _displayAccountSaveErrorAlertWithTitle:v31 message:v9 alternativeAction:v38];
    goto LABEL_24;
  }
  if (*(void *)(a1 + 40))
  {
    id v9 = (void *)[*(id *)(a1 + 48) copy];
    [v9 reload];
    [v9 setEnabled:1 forDataclass:*(void *)(a1 + 40)];
    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      uint64_t v13 = [v12 accountOperationsHelper];
      [v13 saveAccount:v9 requireVerification:0];
    }
LABEL_24:
  }
LABEL_25:
}

void __81__ICSAccountSaveErrorHandler__beginManateeUpgradeForAccount_failedDataclassName___block_invoke_74()
{
  id v4 = [MEMORY[0x263F82438] sharedApplication];
  v0 = NSURL;
  uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v2 = [v1 localizedStringForKey:@"HSA2_UPGRADE_FAILURE_ARTICLE_PATH" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  v3 = [v0 URLWithString:v2];
  [v4 openURL:v3 withCompletionHandler:0];
}

- (void)_handleMaxTierAndInsufficientStorageErrorWithFailedDataclasses:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [v15 count];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = v5;
  if (v4)
  {
    id v7 = [v15 anyObject];
    uint64_t v8 = [v6 localizedStringForKey:v7 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

    id v9 = NSString;
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v11 = [v10 localizedStringForKey:@"MAX_TIER_AND_INSUFFICIENT_STORAGE_ALERT_MESSAGE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    id v12 = objc_msgSend(v9, "stringWithFormat:", v11, v8);

    id v6 = (void *)v8;
  }
  else
  {
    id v12 = [v5 localizedStringForKey:@"MAX_TIER_AND_INSUFFICIENT_STORAGE_ALERT_MESSAGE_NO_FEATURE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  }

  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"MAX_TIER_AND_INSUFFICIENT_STORAGE_ALERT_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [(ICSAccountSaveErrorHandler *)self _displayAccountSaveErrorAlertWithTitle:v14 message:v12 alternativeAction:0];
}

- (void)_displayAccountSaveErrorAlertWithTitle:(id)a3 message:(id)a4 alternativeAction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __95__ICSAccountSaveErrorHandler__displayAccountSaveErrorAlertWithTitle_message_alternativeAction___block_invoke;
  v14[3] = &unk_2655B5C90;
  id v15 = v9;
  BOOL v16 = self;
  id v17 = v8;
  id v18 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __95__ICSAccountSaveErrorHandler__displayAccountSaveErrorAlertWithTitle_message_alternativeAction___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if ([MEMORY[0x263F20318] isInternalBuild])
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"ACCOUNT_SAVE_ERROR_INTERNAL_MESSAGE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    uint64_t v6 = [v3 stringByAppendingFormat:@"\n%@", v5];

    id v7 = (void *)MEMORY[0x263F82400];
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"TAP_TO_RADAR_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __95__ICSAccountSaveErrorHandler__displayAccountSaveErrorAlertWithTitle_message_alternativeAction___block_invoke_2;
    v17[3] = &unk_2655B5C40;
    id v18 = *(id *)(a1 + 48);
    id v10 = [v7 actionWithTitle:v9 style:0 handler:v17];

    id v2 = (id)v6;
  }
  else
  {
    id v10 = 0;
  }
  id v11 = [MEMORY[0x263F82418] alertWithTitle:*(void *)(a1 + 48) message:v2];
  id v12 = (void *)MEMORY[0x263F82400];
  id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"OK" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  id v15 = [v12 actionWithTitle:v14 style:1 handler:0];
  [v11 addAction:v15];

  if (v10) {
    [v11 addAction:v10];
  }
  if (*(void *)(a1 + 56)) {
    objc_msgSend(v11, "addAction:");
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  [WeakRetained presentViewController:v11 animated:1 completion:0];
}

uint64_t __95__ICSAccountSaveErrorHandler__displayAccountSaveErrorAlertWithTitle_message_alternativeAction___block_invoke_2(uint64_t a1)
{
  return +[ICSRadarHelper tapToRadarWithTitle:*(void *)(a1 + 32) initialMessage:@"Error saving account"];
}

- (void).cxx_destruct
{
}

- (void)handleAccountSaveError:(uint64_t)a1 forAccount:(NSObject *)a2 failedDataclasses:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_262993000, a2, OS_LOG_TYPE_ERROR, "Failed to handle error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)handleAccountSaveError:(uint64_t)a3 forAccount:(uint64_t)a4 failedDataclasses:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleAccountSaveError:(uint64_t)a3 forAccount:(uint64_t)a4 failedDataclasses:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleAccountSaveError:(uint64_t)a3 forAccount:(uint64_t)a4 failedDataclasses:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __81__ICSAccountSaveErrorHandler__beginManateeUpgradeForAccount_failedDataclassName___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_262993000, a2, OS_LOG_TYPE_ERROR, "Failed to repair device to device encryption state, error: %@", (uint8_t *)&v2, 0xCu);
}

@end