@interface TRDeviceSetupPeripheral
- (BOOL)_sendAction:(id)a3 sendDataHandler:(id)a4 error:(id *)a5;
- (BOOL)performSetupAndReturnError:(id *)a3;
- (NSString)authenticatediTunesStoreID;
- (TRDeviceSetupPeripheral)init;
- (TRDeviceSetupPeripheralDelegate)delegate;
- (id)pendingSendDataHandler;
- (void)_authenticateWithAction:(id)a3 replyHandler:(id)a4;
- (void)_cancelAuthenticationWithReceivedAction:(id)a3 replyHandler:(id)a4;
- (void)_cancelSetupWithAction:(id)a3 replyHandler:(id)a4;
- (void)_didDisconnect;
- (void)_didReceiveData:(id)a3 replyHandler:(id)a4;
- (void)_didTapWithSendDataHandler:(id)a3;
- (void)_finishSetupWithAction:(id)a3 replyHandler:(id)a4;
- (void)_legacyAuthenticateWithAction:(id)a3 attemptCount:(unint64_t)a4 replyHandler:(id)a5;
- (void)_legacyAuthenticateWithUserAgent:(id)a3 deviceGUID:(id)a4 accountID:(id)a5 password:(id)a6 attemptCount:(unint64_t)a7 completion:(id)a8;
- (void)_setUpWithAction:(id)a3 replyHandler:(id)a4;
- (void)_setupDidFailWithError:(id)a3 replyHandler:(id)a4;
- (void)_startAuthenticationWithReceivedAction:(id)a3 replyHandler:(id)a4;
- (void)cancelPreparingForSetup;
- (void)cancelSetupForStateChange;
- (void)cancelSetupForTimeout;
- (void)setAuthenticatediTunesStoreID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPendingSendDataHandler:(id)a3;
@end

@implementation TRDeviceSetupPeripheral

- (TRDeviceSetupPeripheral)init
{
  v6.receiver = self;
  v6.super_class = (Class)TRDeviceSetupPeripheral;
  v2 = [(TRDeviceSetupPeripheral *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TouchRemote.TRDeviceSetupPeripheral", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (BOOL)performSetupAndReturnError:(id *)a3
{
  if (self->_preparingForSetup)
  {
    if (self->_performingSetup) {
      return 1;
    }
    *(void *)buf = 0;
    v28 = buf;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    v7 = +[TRUserNotificationManager sharedInstance];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __54__TRDeviceSetupPeripheral_performSetupAndReturnError___block_invoke;
    v26[3] = &unk_264221468;
    v26[4] = buf;
    [v7 requestPermissionToInitiateSetupWithCompletion:v26];

    if (v28[24])
    {
      BOOL v25 = 0;
      id v23 = 0;
      id v24 = 0;
      char Config = TRCanPerformSetupGetConfig(&v25, &v24, &v23);
      id v9 = v24;
      id v10 = v23;
      if (Config)
      {
        v11 = +[TRAccountsManager sharedInstance];
        v12 = [v11 deviceName];

        v13 = [(TRDeviceSetupConnectAction *)[TRDeviceSetupLegacyAuthenticationAction alloc] initWithDeviceName:v12 networkSSID:v9 networkPassword:v10];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __54__TRDeviceSetupPeripheral_performSetupAndReturnError___block_invoke_2;
        v19[3] = &unk_2642214B0;
        v19[4] = self;
        v14 = (void *)MEMORY[0x2166AC110](v19);
        uint64_t v18 = 0;
        [(TRDeviceSetupPeripheral *)self _sendAction:v13 sendDataHandler:v14 error:&v18];
      }
      else
      {
        if (_TRLogEnabled == 1)
        {
          v16 = TRLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v22 = 0;
            _os_log_impl(&dword_2149BE000, v16, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Unable to perform setup, requirements not met.", v22, 2u);
          }
        }
        v17 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __54__TRDeviceSetupPeripheral_performSetupAndReturnError___block_invoke_93;
        block[3] = &__block_descriptor_33_e5_v8__0l;
        BOOL v21 = v25;
        dispatch_async(v17, block);

        [(TRDeviceSetupPeripheral *)self cancelPreparingForSetup];
        if (a3)
        {
          *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8108 userInfo:0];
        }
      }

      _Block_object_dispose(buf, 8);
      if (Config) {
        return 1;
      }
    }
    else
    {
      if (_TRLogEnabled == 1)
      {
        v15 = TRLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_2149BE000, v15, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Unable to perform setup, user did not give permission", v22, 2u);
        }
      }
      [(TRDeviceSetupPeripheral *)self cancelPreparingForSetup];
      _Block_object_dispose(buf, 8);
    }
  }
  else if (_TRLogEnabled == 1)
  {
    v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] -performSetup called before a tap was received, ignoring.", buf, 2u);
    }
  }
  return 0;
}

uint64_t __54__TRDeviceSetupPeripheral_performSetupAndReturnError___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __54__TRDeviceSetupPeripheral_performSetupAndReturnError___block_invoke_93(uint64_t a1)
{
  id v2 = +[TRUserNotificationManager sharedInstance];
  [v2 presentWiFiNetworkConnectionError:*(unsigned __int8 *)(a1 + 32) completion:0];
}

void __54__TRDeviceSetupPeripheral_performSetupAndReturnError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 9))
  {
    id v6 = v3;
    *(unsigned char *)(v4 + 9) = 0;
    v5 = [*(id *)(a1 + 32) pendingSendDataHandler];
    [*(id *)(a1 + 32) setPendingSendDataHandler:0];
    if (v5) {
      ((void (**)(void, id))v5)[2](v5, v6);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;

    id v3 = v6;
  }
}

- (void)cancelPreparingForSetup
{
  if (self->_preparingForSetup)
  {
    self->_preparingForSetup = 0;
    uint64_t v4 = [(TRDeviceSetupPeripheral *)self pendingSendDataHandler];
    [(TRDeviceSetupPeripheral *)self setPendingSendDataHandler:0];
    id v3 = (void *)v4;
    if (v4)
    {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
      id v3 = (void *)v4;
    }
  }
}

- (void)cancelSetupForStateChange
{
  if (self->_performingSetup)
  {
    id v4 = [(TRDeviceSetupPeripheral *)self pendingSendDataHandler];
    [(TRDeviceSetupPeripheral *)self setPendingSendDataHandler:0];
    id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8105 userInfo:0];
    [(TRDeviceSetupPeripheral *)self _setupDidFailWithError:v3 replyHandler:v4];
  }
}

- (void)cancelSetupForTimeout
{
  if (self->_performingSetup)
  {
    id v4 = [(TRDeviceSetupPeripheral *)self pendingSendDataHandler];
    [(TRDeviceSetupPeripheral *)self setPendingSendDataHandler:0];
    id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8106 userInfo:0];
    [(TRDeviceSetupPeripheral *)self _setupDidFailWithError:v3 replyHandler:v4];
  }
}

- (void)_didDisconnect
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__TRDeviceSetupPeripheral__didDisconnect__block_invoke;
  block[3] = &unk_264220858;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __41__TRDeviceSetupPeripheral__didDisconnect__block_invoke(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (v2[8])
  {
    id v4 = [v2 pendingSendDataHandler];
    [*(id *)(a1 + 32) setPendingSendDataHandler:0];
    id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8104 userInfo:0];
    [*(id *)(a1 + 32) _setupDidFailWithError:v3 replyHandler:v4];
  }
}

- (void)_didReceiveData:(id)a3 replyHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v14 = 0;
  v7 = +[TRDeviceSetupAction actionWithData:a3 error:&v14 supportsLegacy:1];
  id v8 = v14;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(TRDeviceSetupPeripheral *)self _authenticateWithAction:v7 replyHandler:v6];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(TRDeviceSetupPeripheral *)self _setUpWithAction:v7 replyHandler:v6];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(TRDeviceSetupPeripheral *)self _legacyAuthenticateWithAction:v7 attemptCount:0 replyHandler:v6];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_11:
    [(TRDeviceSetupPeripheral *)self _cancelSetupWithAction:v7 replyHandler:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_6:
      [(TRDeviceSetupPeripheral *)self _finishSetupWithAction:v7 replyHandler:v6];
      goto LABEL_12;
    }
    if (_TRLogEnabled == 1)
    {
      id v10 = TRLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = v7;
        __int16 v19 = 2112;
        id v20 = v8;
        _os_log_impl(&dword_2149BE000, v10, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Failed to handle action: %@. Error: %@", buf, 0x16u);
      }
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08608];
    id v16 = v8;
    v12 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v13 = [v11 errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8100 userInfo:v12];

    [(TRDeviceSetupPeripheral *)self _setupDidFailWithError:v13 replyHandler:v6];
  }
LABEL_12:
  if (_TRLogEnabled == 1)
  {
    id v9 = TRLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2149BE000, v9, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Waiting for data to send...", buf, 2u);
    }
  }
  [(TRDeviceSetupPeripheral *)self setPendingSendDataHandler:v6];
}

- (void)_didTapWithSendDataHandler:(id)a3
{
  id v4 = a3;
  self->_preparingForSetup = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__TRDeviceSetupPeripheral__didTapWithSendDataHandler___block_invoke;
  block[3] = &unk_264220858;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  if (_TRLogEnabled == 1)
  {
    v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Waiting for data to send...", v6, 2u);
    }
  }
  [(TRDeviceSetupPeripheral *)self setPendingSendDataHandler:v4];
}

void __54__TRDeviceSetupPeripheral__didTapWithSendDataHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    if (_TRLogEnabled == 1)
    {
      id v4 = TRLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_2149BE000, v4, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Got tap.", v6, 2u);
      }
    }
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [v5 deviceSetupPeripheralDidTap:*(void *)(a1 + 32)];
  }
}

- (void)_legacyAuthenticateWithAction:(id)a3 attemptCount:(unint64_t)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[TRUserNotificationManager sharedInstance];
  v11 = +[TRAccountsManager sharedInstance];
  v12 = [v11 defaultAccountIDForAuthenticationAccountType:1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke;
  v15[3] = &unk_264221550;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  unint64_t v18 = a4;
  id v13 = v9;
  id v14 = v8;
  [v10 requestLegacyAuthenticationWithAccountID:v12 completion:v15];
}

void __83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (!a2) {
    goto LABEL_6;
  }
  if (![v7 length] || !objc_msgSend(v8, "length"))
  {
    [*(id *)(a1 + 32) _legacyAuthenticateWithAction:*(void *)(a1 + 40) attemptCount:*(void *)(a1 + 56) replyHandler:*(void *)(a1 + 48)];
    goto LABEL_8;
  }
  if ([v8 length])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v9 = *(void **)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) userAgent];
    v11 = [*(id *)(a1 + 40) deviceGUID];
    uint64_t v12 = *(void *)(a1 + 56);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke_2;
    v17[3] = &unk_264221528;
    objc_copyWeak(v20, &location);
    id v19 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 40);
    id v14 = *(void **)(a1 + 56);
    id v18 = v13;
    v20[1] = v14;
    [v9 _legacyAuthenticateWithUserAgent:v10 deviceGUID:v11 accountID:v7 password:v8 attemptCount:v12 completion:v17];

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_6:
    uint64_t v15 = *(void **)(a1 + 32);
    id v16 = [MEMORY[0x263F087E8] errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8102 userInfo:0];
    [v15 _setupDidFailWithError:v16 replyHandler:*(void *)(a1 + 48)];
  }
LABEL_8:
}

void __83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a3)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v22 = 0;
      char v9 = [WeakRetained _sendAction:v5 sendDataHandler:v8 error:&v22];
      id v10 = v22;
      v11 = v10;
      if ((v9 & 1) == 0)
      {
        uint64_t v12 = (void *)MEMORY[0x263F087E8];
        uint64_t v23 = *MEMORY[0x263F08608];
        v24[0] = v10;
        id v13 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
        uint64_t v14 = [v12 errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8100 userInfo:v13];

        [v7 _setupDidFailWithError:v14 replyHandler:*(void *)(a1 + 40)];
        v11 = (void *)v14;
      }
    }
    else
    {
      uint64_t v15 = +[TRUserNotificationManager sharedInstance];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke_3;
      v18[3] = &unk_264221500;
      v18[4] = v7;
      id v16 = *(id *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 56);
      id v19 = v16;
      uint64_t v21 = v17;
      id v20 = *(id *)(a1 + 40);
      [v15 presentLegacyAuthenticationFailedDialogWithMessage:0 completion:v18];
    }
  }
}

void __83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke_3(void *a1, int a2)
{
  if (a2)
  {
    dispatch_time_t v3 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke_4;
    block[3] = &unk_2642214D8;
    id v4 = (void *)a1[5];
    void block[4] = a1[4];
    id v5 = v4;
    id v7 = (void *)a1[6];
    uint64_t v6 = a1[7];
    id v11 = v5;
    uint64_t v13 = v6;
    id v12 = v7;
    dispatch_after(v3, MEMORY[0x263EF83A0], block);
  }
  else
  {
    uint64_t v8 = (void *)a1[4];
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8102 userInfo:0];
    [v8 _setupDidFailWithError:v9 replyHandler:a1[6]];
  }
}

void *__83__TRDeviceSetupPeripheral__legacyAuthenticateWithAction_attemptCount_replyHandler___block_invoke_4(void *a1)
{
  result = (void *)a1[4];
  if (result) {
    return (void *)[result _legacyAuthenticateWithAction:a1[5] attemptCount:a1[7] + 1 replyHandler:a1[6]];
  }
  return result;
}

- (void)_authenticateWithAction:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 attemptCount])
  {
    uint64_t v8 = +[TRUserNotificationManager sharedInstance];
    id v9 = [v6 failureMessage];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__TRDeviceSetupPeripheral__authenticateWithAction_replyHandler___block_invoke;
    v10[3] = &unk_264221578;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [v8 presentAuthenticationFailureWithMessage:v9 completion:v10];
  }
  else
  {
    [(TRDeviceSetupPeripheral *)self _startAuthenticationWithReceivedAction:v6 replyHandler:v7];
  }
}

uint64_t __64__TRDeviceSetupPeripheral__authenticateWithAction_replyHandler___block_invoke(void *a1, int a2)
{
  dispatch_time_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  if (a2) {
    return [v3 _startAuthenticationWithReceivedAction:v4 replyHandler:v5];
  }
  else {
    return [v3 _cancelAuthenticationWithReceivedAction:v4 replyHandler:v5];
  }
}

- (void)_startAuthenticationWithReceivedAction:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[TRAccountsManager sharedInstance];
  id v9 = objc_msgSend(v8, "defaultAccountIDForAuthenticationAccountType:", objc_msgSend(v6, "accountType"));

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  id v20[2] = __79__TRDeviceSetupPeripheral__startAuthenticationWithReceivedAction_replyHandler___block_invoke;
  v20[3] = &unk_2642215A0;
  id v10 = v6;
  id v21 = v10;
  id v22 = self;
  id v11 = v7;
  id v23 = v11;
  id v12 = (void *)MEMORY[0x2166AC110](v20);
  if ([v10 accountType] == 2)
  {
    uint64_t v13 = +[TRAccountsManager sharedInstance];
    uint64_t v14 = [v13 defaultAccountIDForAuthenticationAccountType:1];
    if ([v9 length]
      && ([v9 lowercaseString],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          [v14 lowercaseString],
          id v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v15 isEqualToString:v16],
          v16,
          v15,
          v17))
    {
      id v18 = +[TRUserNotificationManager sharedInstance];
      [v18 requestAppleIDAuthenticationWithAccountID:v9 completion:v12];
    }
    else
    {
      id v18 = +[TRUserNotificationManager sharedInstance];
      id v19 = [v10 requestMessage];
      [v18 requestAuthenticationWithAccountID:v9 message:v19 completion:v12];
    }
  }
  else
  {
    uint64_t v13 = +[TRUserNotificationManager sharedInstance];
    uint64_t v14 = [v10 requestMessage];
    [v13 requestAuthenticationWithAccountID:v9 message:v14 completion:v12];
  }
}

void __79__TRDeviceSetupPeripheral__startAuthenticationWithReceivedAction_replyHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4, unsigned char *a5)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (a2)
  {
    if ([v9 length] && objc_msgSend(v10, "length"))
    {
      if ([*(id *)(a1 + 32) accountType] == 1) {
        [*(id *)(a1 + 40) setAuthenticatediTunesStoreID:v9];
      }
      id v11 = +[TRAccountsManager sharedInstance];
      id v12 = [v11 accountTypesWithDefaultAccountID:v9];

      uint64_t v13 = +[TRDeviceSetupAuthenticateAction actionForFinishedRequestWithOriginalAction:*(void *)(a1 + 32) accountID:v9 accountPassword:v10 accountTypesWithSharedCredentials:v12];
      uint64_t v14 = *(void **)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      id v22 = 0;
      char v16 = [v14 _sendAction:v13 sendDataHandler:v15 error:&v22];
      id v17 = v22;
      id v18 = v17;
      if ((v16 & 1) == 0)
      {
        id v19 = (void *)MEMORY[0x263F087E8];
        uint64_t v23 = *MEMORY[0x263F08608];
        v24[0] = v17;
        id v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
        uint64_t v21 = [v19 errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8100 userInfo:v20];

        [*(id *)(a1 + 40) _setupDidFailWithError:v21 replyHandler:*(void *)(a1 + 48)];
        id v18 = (void *)v21;
      }
    }
    else
    {
      *a5 = 1;
    }
  }
  else
  {
    [*(id *)(a1 + 40) _cancelAuthenticationWithReceivedAction:*(void *)(a1 + 32) replyHandler:*(void *)(a1 + 48)];
  }
}

- (void)_cancelAuthenticationWithReceivedAction:(id)a3 replyHandler:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = +[TRDeviceSetupAuthenticateAction actionForCancelledRequestWithOriginalAction:a3];
  id v14 = 0;
  BOOL v8 = [(TRDeviceSetupPeripheral *)self _sendAction:v7 sendDataHandler:v6 error:&v14];
  id v9 = v14;
  id v10 = v9;
  if (!v8)
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08608];
    v16[0] = v9;
    id v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v13 = [v11 errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8100 userInfo:v12];
    [(TRDeviceSetupPeripheral *)self _setupDidFailWithError:v13 replyHandler:v6];
  }
}

- (void)_setUpWithAction:(id)a3 replyHandler:(id)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = a4;
  uint64_t v5 = [TRDeviceSetupGeneralSetupAction alloc];
  id v6 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v7 = [v6 count];
  id v24 = v4;
  if (v7)
  {
    id v22 = [MEMORY[0x263EFF960] preferredLanguages];
    BOOL v8 = [v22 firstObject];
  }
  else
  {
    BOOL v8 = 0;
  }
  id v9 = [MEMORY[0x263EFF960] currentLocale];
  id v10 = [v9 objectForKey:*MEMORY[0x263EFF4D0]];
  id v11 = +[TRAccountsManager sharedInstance];
  id v12 = [v11 homeSharingAppleID];
  uint64_t v13 = +[TRAccountsManager sharedInstance];
  id v14 = [v13 homeSharingGroupID];
  uint64_t v15 = [(TRDeviceSetupGeneralSetupAction *)v5 initWithCountryCode:v8 language:v10 homeSharingID:v12 homeSharingGroupID:v14 isDiagnosticsEnabled:0 rememberPassword:0];

  if (v7)
  {
  }
  id v25 = 0;
  BOOL v16 = [(TRDeviceSetupPeripheral *)self _sendAction:v15 sendDataHandler:v24 error:&v25];
  id v17 = v25;
  id v18 = v17;
  if (!v16)
  {
    id v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08608];
    v27[0] = v17;
    id v20 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    uint64_t v21 = [v19 errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8100 userInfo:v20];

    [(TRDeviceSetupPeripheral *)self _setupDidFailWithError:v21 replyHandler:v24];
    id v18 = (void *)v21;
  }
}

- (void)_finishSetupWithAction:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__TRDeviceSetupPeripheral__finishSetupWithAction_replyHandler___block_invoke;
  block[3] = &unk_264221400;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __63__TRDeviceSetupPeripheral__finishSetupWithAction_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 0;
    [*(id *)(a1 + 32) _sendAction:*(void *)(a1 + 40) sendDataHandler:*(void *)(a1 + 48) error:0];
    dispatch_time_t v3 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__TRDeviceSetupPeripheral__finishSetupWithAction_replyHandler___block_invoke_2;
    block[3] = &unk_264220858;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v3, block);
  }
}

void __63__TRDeviceSetupPeripheral__finishSetupWithAction_replyHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [v4 deviceSetupPeripheralSetupDidComplete:*(void *)(a1 + 32)];
  }
}

- (void)_cancelSetupWithAction:(id)a3 replyHandler:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F087E8];
  id v6 = a4;
  id v7 = [v5 errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8104 userInfo:0];
  [(TRDeviceSetupPeripheral *)self _setupDidFailWithError:v7 replyHandler:v6];
}

- (void)_setupDidFailWithError:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__TRDeviceSetupPeripheral__setupDidFailWithError_replyHandler___block_invoke;
  block[3] = &unk_2642215C8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __63__TRDeviceSetupPeripheral__setupDidFailWithError_replyHandler___block_invoke(uint64_t a1)
{
  id v2 = +[TRUserNotificationManager sharedInstance];
  [v2 cancel];

  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 8))
  {
    *(unsigned char *)(v3 + 8) = 0;
    id v4 = objc_alloc_init(TRDeviceSetupCancelAction);
    [*(id *)(a1 + 32) _sendAction:v4 sendDataHandler:*(void *)(a1 + 48) error:0];
    uint64_t v5 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __63__TRDeviceSetupPeripheral__setupDidFailWithError_replyHandler___block_invoke_2;
    v7[3] = &unk_264220880;
    id v6 = *(void **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    dispatch_async(v5, v7);
  }
}

void __63__TRDeviceSetupPeripheral__setupDidFailWithError_replyHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [v4 deviceSetupPeripheralSetupDidFail:*(void *)(a1 + 32) withError:*(void *)(a1 + 40)];
  }
}

- (BOOL)_sendAction:(id)a3 sendDataHandler:(id)a4 error:(id *)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    id v8 = [a3 dataRepresentationWithError:a5];
    BOOL v9 = v8 != 0;
    if (v8)
    {
      if (_TRLogEnabled == 1)
      {
        id v10 = TRLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 134217984;
          uint64_t v13 = [v8 length];
          _os_log_impl(&dword_2149BE000, v10, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Data to send length: %ld", (uint8_t *)&v12, 0xCu);
        }
      }
      v7[2](v7, v8);
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)_legacyAuthenticateWithUserAgent:(id)a3 deviceGUID:(id)a4 accountID:(id)a5 password:(id)a6 attemptCount:(unint64_t)a7 completion:(id)a8
{
  v29[6] = *MEMORY[0x263EF8340];
  id v13 = a6;
  id v14 = a8;
  uint64_t v15 = (objc_class *)MEMORY[0x263F7B290];
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = objc_alloc_init(v15);
  [v19 setURLBagKey:@"authenticateAccount"];
  [v19 setHTTPMethod:@"POST"];
  [v19 setValue:v18 forHTTPHeaderField:*MEMORY[0x263F7B788]];

  [v19 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  v28[0] = @"appleId";
  v28[1] = @"password";
  v29[0] = v16;
  v29[1] = v13;
  v28[2] = @"guid";
  v28[3] = @"why";
  v29[2] = v17;
  v29[3] = @"purchase";
  v29[4] = @"0";
  v28[4] = @"rmp";
  v28[5] = @"attempt";
  id v20 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a7);
  v29[5] = v20;
  uint64_t v21 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];
  [v19 setRequestParameters:v21];

  [v19 setITunesStoreRequest:1];
  [v19 setShouldProcessProtocol:0];
  [v19 setShouldSetCookies:0];
  id v22 = (void *)[objc_alloc(MEMORY[0x263F7B360]) initWithRequestProperties:v19];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __114__TRDeviceSetupPeripheral__legacyAuthenticateWithUserAgent_deviceGUID_accountID_password_attemptCount_completion___block_invoke;
  v25[3] = &unk_2642215F0;
  id v26 = v13;
  id v27 = v14;
  id v23 = v14;
  id v24 = v13;
  [v22 startWithConnectionResponseBlock:v25];
}

void __114__TRDeviceSetupPeripheral__legacyAuthenticateWithUserAgent_deviceGUID_accountID_password_attemptCount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v29 = a3;
  if ([v5 statusCode] == 200)
  {
    id v27 = [v5 allHeaderFields];
    id v26 = [v5 bodyData];
    if (v26)
    {
      id v6 = [MEMORY[0x263F08AC0] propertyListWithData:v26 options:0 format:0 error:0];
    }
    else
    {
      id v6 = 0;
    }
    v28 = [v6 objectForKey:@"failureType"];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v28 intValue])
    {
      if (_TRLogEnabled != 1)
      {
        id v7 = 0;
LABEL_24:

        goto LABEL_25;
      }
      oslog = TRLogHandle();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_2149BE000, oslog, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Authentication failed: %@", (uint8_t *)&buf, 0xCu);
      }
      id v7 = 0;
    }
    else
    {
      id v7 = 0;
      if (!v27 || !v6) {
        goto LABEL_24;
      }
      if (_TRLogEnabled == 1)
      {
        id v8 = TRLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupPeripheral] Authentication completed.", (uint8_t *)&buf, 2u);
        }
      }
      oslog = [v6 mutableCopy];
      [oslog setObject:*(void *)(a1 + 32) forKey:@"password"];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v34 = 0x2020000000;
      char v35 = 0;
      BOOL v9 = +[TRUserNotificationManager sharedInstance];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __114__TRDeviceSetupPeripheral__legacyAuthenticateWithUserAgent_deviceGUID_accountID_password_attemptCount_completion___block_invoke_164;
      v32[3] = &unk_264221468;
      v32[4] = &buf;
      [v9 requestPermissionForDiagnosticSubmissionWithCompletion:v32];

      id v10 = [MEMORY[0x263EFF960] preferredLanguages];
      if ([v10 count])
      {
        id v11 = [MEMORY[0x263EFF960] preferredLanguages];
        id v24 = [v11 objectAtIndex:0];
      }
      else
      {
        id v24 = 0;
      }

      int v12 = [MEMORY[0x263EFF960] currentLocale];
      id v23 = [v12 objectForKey:*MEMORY[0x263EFF4D0]];

      id v30 = 0;
      id v31 = 0;
      TRGetCurrentWiFiNetwork(&v31, &v30);
      id v21 = v31;
      id v22 = v30;
      id v13 = [[TRDeviceSetupLegacySetupActionAuthInfo alloc] initWithHeaders:v27 body:oslog];
      id v14 = [TRDeviceSetupLegacySetupAction alloc];
      int v15 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      id v16 = +[TRAccountsManager sharedInstance];
      id v17 = [v16 homeSharingAppleID];
      id v18 = +[TRAccountsManager sharedInstance];
      id v19 = [v18 homeSharingGroupID];
      LOBYTE(v20) = 0;
      id v7 = [(TRDeviceSetupLegacySetupAction *)v14 initWithAuthInfo:v13 networkSSID:v21 networkPassword:v22 diagnosticsEnabled:v15 != 0 language:v24 countryCode:v23 homeSharingAppleID:v17 homeSharingGroupID:v19 rememberPassword:v20];

      _Block_object_dispose(&buf, 8);
    }

    goto LABEL_24;
  }
  id v7 = 0;
  id v6 = 0;
LABEL_25:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __114__TRDeviceSetupPeripheral__legacyAuthenticateWithUserAgent_deviceGUID_accountID_password_attemptCount_completion___block_invoke_164(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (TRDeviceSetupPeripheralDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TRDeviceSetupPeripheralDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)pendingSendDataHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setPendingSendDataHandler:(id)a3
{
}

- (NSString)authenticatediTunesStoreID
{
  return self->_authenticatediTunesStoreID;
}

- (void)setAuthenticatediTunesStoreID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatediTunesStoreID, 0);
  objc_storeStrong(&self->_pendingSendDataHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end