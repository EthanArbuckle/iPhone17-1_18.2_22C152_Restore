@interface TRUserNotificationManager
+ (id)sharedInstance;
- (_TRUserNotification)activeUserNotification;
- (void)_showUserNotificationWithDictionary:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)presentAuthenticationFailureWithMessage:(id)a3 completion:(id)a4;
- (void)presentErrorWithTitle:(id)a3 message:(id)a4 completion:(id)a5;
- (void)presentLegacyAuthenticationFailedDialogWithMessage:(id)a3 completion:(id)a4;
- (void)presentWiFiNetworkConnectionError:(BOOL)a3 completion:(id)a4;
- (void)requestAppleIDAuthenticationWithAccountID:(id)a3 completion:(id)a4;
- (void)requestAuthenticationWithAccountID:(id)a3 message:(id)a4 completion:(id)a5;
- (void)requestLegacyAuthenticationWithAccountID:(id)a3 completion:(id)a4;
- (void)requestPermissionForDiagnosticSubmissionWithCompletion:(id)a3;
- (void)requestPermissionToInitiateSetupWithCompletion:(id)a3;
- (void)setActiveUserNotification:(id)a3;
@end

@implementation TRUserNotificationManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance___sharedInstance_0;
  return v2;
}

uint64_t __43__TRUserNotificationManager_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance_0 = objc_alloc_init(TRUserNotificationManager);
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  [(TRUserNotificationManager *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)TRUserNotificationManager;
  [(TRUserNotificationManager *)&v3 dealloc];
}

- (void)_showUserNotificationWithDictionary:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(id, _TRUserNotification *, void))a5;
  if (_TRLogEnabled == 1)
  {
    v10 = TRLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_2149BE000, v10, OS_LOG_TYPE_DEFAULT, "[TRUserNotificationManager] Showing user notification: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  unsigned int v13 = 0;
  v11 = [[_TRUserNotification alloc] initWithDictionary:v8 options:a4 error:&v13];
  if (v11)
  {
    [(TRUserNotificationManager *)self setActiveUserNotification:v11];
    v12 = [(TRUserNotificationManager *)self activeUserNotification];
    [v12 show];

    if (v9) {
      v9[2](v9, v11, 0);
    }
    [(TRUserNotificationManager *)self setActiveUserNotification:0];
  }
  else if (v9)
  {
    v9[2](v9, 0, v13);
  }
}

- (void)requestPermissionToInitiateSetupWithCompletion:(id)a3
{
  id v14 = a3;
  unsigned int v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v13 localizedStringForKey:@"INITIATE_SETUP_TITLE" value:&stru_26C5827A8 table:@"TouchRemote"];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"INITIATE_SETUP_MESSAGE" value:&stru_26C5827A8 table:@"TouchRemote"];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"INITIATE_SETUP_CONTINUE" value:&stru_26C5827A8 table:@"TouchRemote"];
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"CANCEL" value:&stru_26C5827A8 table:@"TouchRemote"];
  v11 = +[_TRUserNotification userNotificationDictionaryWithTitle:v4 message:v6 defaultButtonTitle:v8 alternateButtonTitle:v10];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__TRUserNotificationManager_requestPermissionToInitiateSetupWithCompletion___block_invoke;
  v15[3] = &unk_264221388;
  id v16 = v14;
  id v12 = v14;
  [(TRUserNotificationManager *)self _showUserNotificationWithDictionary:v11 options:0 completion:v15];
}

uint64_t __76__TRUserNotificationManager_requestPermissionToInitiateSetupWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 didAccept];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (void)requestAuthenticationWithAccountID:(id)a3 message:(id)a4 completion:(id)a5
{
  v36[2] = *MEMORY[0x263EF8340];
  v29 = (__CFString *)a3;
  id v8 = a4;
  id v28 = a5;
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"SIGN_IN_TITLE" value:&stru_26C5827A8 table:@"TouchRemote"];
  v11 = v8;
  v30 = v8;
  if (!v8)
  {
    v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v27 localizedStringForKey:@"SIGN_IN_MESSAGE" value:&stru_26C5827A8 table:@"TouchRemote"];
  }
  id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unsigned int v13 = [v12 localizedStringForKey:@"OK" value:&stru_26C5827A8 table:@"TouchRemote"];
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v15 = [v14 localizedStringForKey:@"SKIP" value:&stru_26C5827A8 table:@"TouchRemote"];
  id v16 = +[_TRUserNotification userNotificationDictionaryWithTitle:v10 message:v11 defaultButtonTitle:v13 alternateButtonTitle:v15];

  if (!v30)
  {
  }
  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"APPLE_ID" value:&stru_26C5827A8 table:@"TouchRemote"];
  v36[0] = v18;
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v20 = [v19 localizedStringForKey:@"PASSWORD" value:&stru_26C5827A8 table:@"TouchRemote"];
  v36[1] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  [v16 setObject:v21 forKeyedSubscript:*MEMORY[0x263F00028]];

  if (v29) {
    v22 = v29;
  }
  else {
    v22 = &stru_26C5827A8;
  }
  v35[0] = v22;
  v35[1] = &stru_26C5827A8;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
  [v16 setObject:v23 forKeyedSubscript:*MEMORY[0x263F00030]];

  [v16 setObject:&unk_26C58CDA0 forKeyedSubscript:*MEMORY[0x263F00010]];
  [v16 setObject:&unk_26C58CDB8 forKeyedSubscript:*MEMORY[0x263F79690]];
  [v16 setObject:&unk_26C58CDD0 forKeyedSubscript:*MEMORY[0x263F79698]];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __83__TRUserNotificationManager_requestAuthenticationWithAccountID_message_completion___block_invoke;
  v31[3] = &unk_2642213D8;
  v31[4] = self;
  v32 = v29;
  id v33 = v30;
  id v34 = v28;
  id v24 = v30;
  v25 = v29;
  id v26 = v28;
  [(TRUserNotificationManager *)self _showUserNotificationWithDictionary:v16 options:0x20000 completion:v31];
}

void __83__TRUserNotificationManager_requestAuthenticationWithAccountID_message_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 textFieldValueAtIndex:0];
  v5 = [v3 textFieldValueAtIndex:1];
  char v13 = 0;
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, void *, void *, char *))(v6 + 16))(v6, [v3 didAccept], v4, v5, &v13);
    if (v13)
    {
      dispatch_time_t v7 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __83__TRUserNotificationManager_requestAuthenticationWithAccountID_message_completion___block_invoke_2;
      block[3] = &unk_2642213B0;
      id v8 = *(void **)(a1 + 40);
      block[4] = *(void *)(a1 + 32);
      id v10 = v8;
      id v11 = *(id *)(a1 + 48);
      id v12 = *(id *)(a1 + 56);
      dispatch_after(v7, MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __83__TRUserNotificationManager_requestAuthenticationWithAccountID_message_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestAuthenticationWithAccountID:*(void *)(a1 + 40) message:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)requestAppleIDAuthenticationWithAccountID:(id)a3 completion:(id)a4
{
  v30[2] = *MEMORY[0x263EF8340];
  id v24 = (__CFString *)a3;
  id v25 = a4;
  v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v22 = [v23 localizedStringForKey:@"AUTH_APPLE_ID_TITLE" value:&stru_26C5827A8 table:@"TouchRemote"];
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  dispatch_time_t v7 = [v6 localizedStringForKey:@"AUTH_APPLE_ID_MESSAGE" value:&stru_26C5827A8 table:@"TouchRemote"];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"OK" value:&stru_26C5827A8 table:@"TouchRemote"];
  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"SKIP" value:&stru_26C5827A8 table:@"TouchRemote"];
  id v12 = +[_TRUserNotification userNotificationDictionaryWithTitle:v22 message:v7 defaultButtonTitle:v9 alternateButtonTitle:v11];

  char v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"APPLE_ID" value:&stru_26C5827A8 table:@"TouchRemote"];
  v30[0] = v14;
  uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v16 = [v15 localizedStringForKey:@"PASSWORD" value:&stru_26C5827A8 table:@"TouchRemote"];
  v30[1] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  [v12 setObject:v17 forKeyedSubscript:*MEMORY[0x263F00028]];

  if (v24) {
    v18 = v24;
  }
  else {
    v18 = &stru_26C5827A8;
  }
  v29[0] = v18;
  v29[1] = &stru_26C5827A8;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  [v12 setObject:v19 forKeyedSubscript:*MEMORY[0x263F00030]];

  [v12 setObject:&unk_26C58CDE8 forKeyedSubscript:*MEMORY[0x263F00010]];
  [v12 setObject:&unk_26C58CE00 forKeyedSubscript:*MEMORY[0x263F79690]];
  [v12 setObject:&unk_26C58CE18 forKeyedSubscript:*MEMORY[0x263F79698]];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __82__TRUserNotificationManager_requestAppleIDAuthenticationWithAccountID_completion___block_invoke;
  v26[3] = &unk_264221428;
  v27 = v24;
  id v28 = v25;
  v26[4] = self;
  v20 = v24;
  id v21 = v25;
  [(TRUserNotificationManager *)self _showUserNotificationWithDictionary:v12 options:0x20000 completion:v26];
}

void __82__TRUserNotificationManager_requestAppleIDAuthenticationWithAccountID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 textFieldValueAtIndex:0];
  v5 = [v3 textFieldValueAtIndex:1];
  char v12 = 0;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, void *, void *, char *))(v6 + 16))(v6, [v3 didAccept], v4, v5, &v12);
    if (v12)
    {
      dispatch_time_t v7 = dispatch_time(0, 500000000);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __82__TRUserNotificationManager_requestAppleIDAuthenticationWithAccountID_completion___block_invoke_2;
      v9[3] = &unk_264221400;
      id v8 = *(void **)(a1 + 40);
      v9[4] = *(void *)(a1 + 32);
      id v10 = v8;
      id v11 = *(id *)(a1 + 48);
      dispatch_after(v7, MEMORY[0x263EF83A0], v9);
    }
  }
}

uint64_t __82__TRUserNotificationManager_requestAppleIDAuthenticationWithAccountID_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestAppleIDAuthenticationWithAccountID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)presentAuthenticationFailureWithMessage:(id)a3 completion:(id)a4
{
  id v18 = a4;
  uint64_t v6 = (void *)MEMORY[0x263F086E0];
  id v7 = a3;
  v17 = [v6 bundleForClass:objc_opt_class()];
  id v8 = [v17 localizedStringForKey:@"AUTH_FAILED_TITLE" value:&stru_26C5827A8 table:@"TouchRemote"];
  v9 = v7;
  if (!v7)
  {
    id v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v16 localizedStringForKey:@"AUTH_FAILED_DEFAULT_MESSAGE" value:&stru_26C5827A8 table:@"TouchRemote"];
  }
  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"AUTH_FAILED_RETRY_BUTTON" value:&stru_26C5827A8 table:@"TouchRemote"];
  char v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v13 = [v12 localizedStringForKey:@"CANCEL" value:&stru_26C5827A8 table:@"TouchRemote"];
  id v14 = +[_TRUserNotification userNotificationDictionaryWithTitle:v8 message:v9 defaultButtonTitle:v11 alternateButtonTitle:v13];

  if (!v7)
  {
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __80__TRUserNotificationManager_presentAuthenticationFailureWithMessage_completion___block_invoke;
  v19[3] = &unk_264221388;
  id v20 = v18;
  id v15 = v18;
  [(TRUserNotificationManager *)self _showUserNotificationWithDictionary:v14 options:0 completion:v19];
}

uint64_t __80__TRUserNotificationManager_presentAuthenticationFailureWithMessage_completion___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    uint64_t v3 = [a2 didAccept];
    v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

- (void)requestPermissionForDiagnosticSubmissionWithCompletion:(id)a3
{
  id v14 = a3;
  char v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v13 localizedStringForKey:@"DIAGNOSTIC_TITLE" value:&stru_26C5827A8 table:@"TouchRemote"];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"DIAGNOSTIC_MESSAGE" value:&stru_26C5827A8 table:@"TouchRemote"];
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_26C5827A8 table:@"TouchRemote"];
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"NO_THANKS_BUTTON" value:&stru_26C5827A8 table:@"TouchRemote"];
  id v11 = +[_TRUserNotification userNotificationDictionaryWithTitle:v4 message:v6 defaultButtonTitle:v8 alternateButtonTitle:v10];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__TRUserNotificationManager_requestPermissionForDiagnosticSubmissionWithCompletion___block_invoke;
  v15[3] = &unk_264221388;
  id v16 = v14;
  id v12 = v14;
  [(TRUserNotificationManager *)self _showUserNotificationWithDictionary:v11 options:0 completion:v15];
}

uint64_t __84__TRUserNotificationManager_requestPermissionForDiagnosticSubmissionWithCompletion___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    uint64_t v3 = [a2 didAccept];
    v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

- (void)presentErrorWithTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v9 = (void *)MEMORY[0x263F086E0];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 bundleForClass:objc_opt_class()];
  char v13 = [v12 localizedStringForKey:@"OK" value:&stru_26C5827A8 table:@"TouchRemote"];
  id v14 = +[_TRUserNotification userNotificationDictionaryWithTitle:v11 message:v10 defaultButtonTitle:v13 alternateButtonTitle:0];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __70__TRUserNotificationManager_presentErrorWithTitle_message_completion___block_invoke;
  v16[3] = &unk_264221388;
  id v17 = v8;
  id v15 = v8;
  [(TRUserNotificationManager *)self _showUserNotificationWithDictionary:v14 options:0 completion:v16];
}

uint64_t __70__TRUserNotificationManager_presentErrorWithTitle_message_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentWiFiNetworkConnectionError:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v15 = a4;
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = v6;
  if (v4)
  {
    id v8 = [v6 localizedStringForKey:@"CONNECT_TO_WIFI_MESSAGE_DHCP" value:&stru_26C5827A8 table:@"TouchRemote"];

    if ((MGGetBoolAnswer() & 1) == 0) {
      goto LABEL_7;
    }
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = v9;
    id v11 = @"CONNECT_TO_WLAN_MESSAGE_DHCP";
  }
  else
  {
    id v8 = [v6 localizedStringForKey:@"CONNECT_TO_WIFI_MESSAGE" value:&stru_26C5827A8 table:@"TouchRemote"];

    if (!MGGetBoolAnswer()) {
      goto LABEL_7;
    }
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = v9;
    id v11 = @"CONNECT_TO_WLAN_MESSAGE";
  }
  uint64_t v12 = [v9 localizedStringForKey:v11 value:&stru_26C5827A8 table:@"TouchRemote"];

  id v8 = (void *)v12;
LABEL_7:
  char v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"CONNECT_TO_WIFI_TITLE" value:&stru_26C5827A8 table:@"TouchRemote"];
  [(TRUserNotificationManager *)self presentErrorWithTitle:v14 message:v8 completion:v15];
}

- (void)cancel
{
  id v2 = [(TRUserNotificationManager *)self activeUserNotification];
  [v2 cancel];
}

- (void)requestLegacyAuthenticationWithAccountID:(id)a3 completion:(id)a4
{
  void v35[2] = *MEMORY[0x263EF8340];
  v29 = (__CFString *)a3;
  id v28 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SIGN_IN_TITLE" value:&stru_26C5827A8 table:@"TouchRemote"];
  [v6 setObject:v8 forKey:*MEMORY[0x263EFFFC8]];

  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"SIGN_IN_MESSAGE" value:&stru_26C5827A8 table:@"TouchRemote"];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v13 = [v12 localizedStringForKey:@"SIGN_IN_MESSAGE" value:&stru_26C5827A8 table:@"TouchRemote"];
    [v6 setObject:v13 forKey:*MEMORY[0x263EFFFD8]];
  }
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"APPLE_ID" value:&stru_26C5827A8 table:@"TouchRemote"];
  v35[0] = v15;
  id v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v17 = [v16 localizedStringForKey:@"PASSWORD" value:&stru_26C5827A8 table:@"TouchRemote"];
  v35[1] = v17;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
  [v6 setObject:v18 forKey:*MEMORY[0x263F00028]];

  if (v29) {
    v19 = v29;
  }
  else {
    v19 = &stru_26C5827A8;
  }
  v34[0] = v19;
  v34[1] = &stru_26C5827A8;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  [v6 setObject:v20 forKey:*MEMORY[0x263F00030]];

  [v6 setObject:&unk_26C58CE30 forKey:*MEMORY[0x263F00010]];
  [v6 setObject:&unk_26C58CE48 forKey:*MEMORY[0x263F79690]];
  [v6 setObject:&unk_26C58CE60 forKey:*MEMORY[0x263F79698]];
  id v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"CANCEL" value:&stru_26C5827A8 table:@"TouchRemote"];
  [v6 setObject:v22 forKey:*MEMORY[0x263EFFFE8]];

  v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v24 = [v23 localizedStringForKey:@"OK" value:&stru_26C5827A8 table:@"TouchRemote"];
  [v6 setObject:v24 forKey:*MEMORY[0x263F00000]];

  [v6 setObject:&unk_26C58CD10 forKey:*MEMORY[0x263F79600]];
  uint64_t v25 = *MEMORY[0x263EFFB40];
  [v6 setObject:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263EFFFE0]];
  [v6 setObject:v25 forKey:*MEMORY[0x263F79628]];
  if (_TRLogEnabled == 1)
  {
    id v26 = TRLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v6;
      _os_log_impl(&dword_2149BE000, v26, OS_LOG_TYPE_DEFAULT, "Showing user notification: %@", buf, 0xCu);
    }
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __81__TRUserNotificationManager_requestLegacyAuthenticationWithAccountID_completion___block_invoke;
  void v30[3] = &unk_264221388;
  id v31 = v28;
  id v27 = v28;
  [(TRUserNotificationManager *)self _showUserNotificationWithDictionary:v6 options:0x20000 completion:v30];
}

void __81__TRUserNotificationManager_requestLegacyAuthenticationWithAccountID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 textFieldValueAtIndex:0];
  BOOL v4 = [v3 textFieldValueAtIndex:1];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [v3 didAccept];

  (*(void (**)(uint64_t, uint64_t, id, void *))(v5 + 16))(v5, v6, v7, v4);
}

- (void)presentLegacyAuthenticationFailedDialogWithMessage:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"AUTH_FAILED_TITLE" value:&stru_26C5827A8 table:@"TouchRemote"];
  [v8 setObject:v10 forKey:*MEMORY[0x263EFFFC8]];

  if (v6)
  {
    id v11 = v6;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v11 = [v12 localizedStringForKey:@"AUTH_FAILED_DEFAULT_MESSAGE" value:&stru_26C5827A8 table:@"TouchRemote"];
  }
  [v8 setObject:v11 forKey:*MEMORY[0x263EFFFD8]];
  char v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"CANCEL" value:&stru_26C5827A8 table:@"TouchRemote"];
  [v8 setObject:v14 forKey:*MEMORY[0x263EFFFE8]];

  id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v16 = [v15 localizedStringForKey:@"AUTH_FAILED_RETRY_BUTTON" value:&stru_26C5827A8 table:@"TouchRemote"];
  [v8 setObject:v16 forKey:*MEMORY[0x263F00000]];

  [v8 setObject:&unk_26C58CD10 forKey:*MEMORY[0x263F79600]];
  uint64_t v17 = *MEMORY[0x263EFFB40];
  [v8 setObject:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263EFFFE0]];
  [v8 setObject:v17 forKey:*MEMORY[0x263F79628]];
  if (_TRLogEnabled == 1)
  {
    id v18 = TRLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_impl(&dword_2149BE000, v18, OS_LOG_TYPE_DEFAULT, "[TRUserNotificationManager] Showing user notification: %@", buf, 0xCu);
    }
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __91__TRUserNotificationManager_presentLegacyAuthenticationFailedDialogWithMessage_completion___block_invoke;
  v20[3] = &unk_264221388;
  id v21 = v7;
  id v19 = v7;
  [(TRUserNotificationManager *)self _showUserNotificationWithDictionary:v8 options:0 completion:v20];
}

uint64_t __91__TRUserNotificationManager_presentLegacyAuthenticationFailedDialogWithMessage_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 didAccept];
  BOOL v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (_TRUserNotification)activeUserNotification
{
  return self->_activeUserNotification;
}

- (void)setActiveUserNotification:(id)a3
{
}

- (void).cxx_destruct
{
}

@end