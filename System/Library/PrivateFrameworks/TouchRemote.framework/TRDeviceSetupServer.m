@interface TRDeviceSetupServer
+ (void)initialize;
- (BOOL)_sendAction:(id)a3 sendDataHandler:(id)a4 shouldSendNilOnFailure:(BOOL)a5 error:(id *)a6;
- (NSMutableArray)accountsToAuthenticate;
- (NSMutableDictionary)cachedAuthInfo;
- (TRDeviceSetupServer)init;
- (TRDeviceSetupServerDelegate)delegate;
- (void)_authenticateAccount:(unint64_t)a3 withAuthInfo:(id)a4 completion:(id)a5;
- (void)_authenticateWithAction:(id)a3 replyHandler:(id)a4;
- (void)_cancelTransferConnection;
- (void)_cancelWithAction:(id)a3 replyHandler:(id)a4;
- (void)_connectWithAction:(id)a3 replyHandler:(id)a4;
- (void)_finishSetupWithError:(id)a3 replyHandler:(id)a4;
- (void)_finishWithAction:(id)a3 replyHandler:(id)a4;
- (void)_requestAuthenticationForAccount:(unint64_t)a3 replyHandler:(id)a4;
- (void)_requestAuthenticationForNextAccountWithReplyHandler:(id)a3;
- (void)_requestAuthenticationFromPeripheralForAccount:(unint64_t)a3 lastAttemptAction:(id)a4 lastAttemptError:(id)a5 replyHandler:(id)a6;
- (void)_requestGeneralSetupWithReplyHandler:(id)a3;
- (void)_setUpWithAction:(id)a3 replyHandler:(id)a4;
- (void)cancelActiveSetup;
- (void)dealloc;
- (void)server:(id)a3 didFailToReceiveData:(id)a4;
- (void)server:(id)a3 didReceiveData:(id)a4 replyHandler:(id)a5;
- (void)serverWillReceiveData:(id)a3;
- (void)setAccountsToAuthenticate:(id)a3;
- (void)setCachedAuthInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation TRDeviceSetupServer

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    TRLogInitialize();
  }
}

- (TRDeviceSetupServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)TRDeviceSetupServer;
  uint64_t v2 = [(TRDeviceSetupServer *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(TRTransferServer);
    transferServer = v2->_transferServer;
    v2->_transferServer = v3;

    [(TRTransferServer *)v2->_transferServer setDelegate:v2];
    v2->_notifyTokenIsValid = notify_register_check("com.apple.TouchRemote.deviceSetupActive", &v2->_notifyToken) == 0;
  }
  return v2;
}

- (void)dealloc
{
  [(TRTransferServer *)self->_transferServer setDelegate:0];
  if (self->_notifyTokenIsValid) {
    notify_cancel(self->_notifyToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)TRDeviceSetupServer;
  [(TRDeviceSetupServer *)&v3 dealloc];
}

- (void)serverWillReceiveData:(id)a3
{
  self->_setupInProgress = 1;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 deviceSetupServerDidPromptToBeginSetup:self];
  }
}

- (void)server:(id)a3 didReceiveData:(id)a4 replyHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_TRLogEnabled == 1)
  {
    v11 = TRLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = [v9 length];
      _os_log_impl(&dword_2149BE000, v11, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Server got data of length %li", buf, 0xCu);
    }
  }
  if (self->_cancelledSetupInProgress)
  {
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8104 userInfo:0];
    [(TRDeviceSetupServer *)self _finishSetupWithError:v12 replyHandler:v10];
  }
  else
  {
    id v19 = 0;
    v13 = +[TRDeviceSetupAction actionWithData:v9 error:&v19 supportsLegacy:0];
    id v12 = v19;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(TRDeviceSetupServer *)self _connectWithAction:v13 replyHandler:v10];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(TRDeviceSetupServer *)self _authenticateWithAction:v13 replyHandler:v10];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(TRDeviceSetupServer *)self _setUpWithAction:v13 replyHandler:v10];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(TRDeviceSetupServer *)self _finishWithAction:v13 replyHandler:v10];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(TRDeviceSetupServer *)self _cancelWithAction:v13 replyHandler:v10];
            }
            else
            {
              if (_TRLogEnabled == 1)
              {
                v14 = TRLogHandle();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v21 = (uint64_t)v13;
                  __int16 v22 = 2112;
                  id v23 = v12;
                  _os_log_impl(&dword_2149BE000, v14, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Failed to handle action: %@. Error: %@", buf, 0x16u);
                }
              }
              v15 = [MEMORY[0x263F087E8] errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8101 userInfo:0];
              [(TRDeviceSetupServer *)self _finishSetupWithError:v15 replyHandler:v10];
              v16 = [(TRDeviceSetupServer *)self delegate];
              char v17 = objc_opt_respondsToSelector();

              if (v17)
              {
                v18 = [(TRDeviceSetupServer *)self delegate];
                [v18 deviceSetupServer:self didFailSetupWithError:v15];
              }
            }
          }
        }
      }
    }
  }
}

- (void)server:(id)a3 didFailToReceiveData:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_setupInProgress)
  {
    id v9 = (void *)MEMORY[0x263F087E8];
    if (v7)
    {
      uint64_t v12 = *MEMORY[0x263F08608];
      v13[0] = v7;
      id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v11 = [v9 errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8100 userInfo:v10];
    }
    else
    {
      v11 = [MEMORY[0x263F087E8] errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8100 userInfo:0];
    }
    [(TRDeviceSetupServer *)self _finishSetupWithError:v11 replyHandler:0];
    [(TRDeviceSetupServer *)self _cancelTransferConnection];
  }
}

- (void)cancelActiveSetup
{
  if (self->_setupInProgress)
  {
    self->_cancelledSetupInProgress = 1;
    [(TRDeviceSetupServer *)self _cancelTransferConnection];
  }
}

- (void)start
{
  [(TRTransferServer *)self->_transferServer start];
  self->_started = 1;
  if (self->_notifyTokenIsValid)
  {
    notify_set_state(self->_notifyToken, 1uLL);
    notify_post("com.apple.TouchRemote.deviceSetupActive");
  }
}

- (void)stop
{
  [(TRTransferServer *)self->_transferServer stop];
  self->_started = 0;
  self->_cancelledSetupInProgress = 0;
  if (self->_notifyTokenIsValid)
  {
    notify_set_state(self->_notifyToken, 0);
    notify_post("com.apple.TouchRemote.deviceSetupActive");
  }
}

- (void)_cancelTransferConnection
{
  [(TRTransferServer *)self->_transferServer setDelegate:0];
  [(TRTransferServer *)self->_transferServer stop];
  transferServer = self->_transferServer;
  self->_transferServer = 0;

  v4 = objc_alloc_init(TRTransferServer);
  v5 = self->_transferServer;
  self->_transferServer = v4;

  [(TRTransferServer *)self->_transferServer setDelegate:self];
  if (self->_started)
  {
    id v6 = self->_transferServer;
    [(TRTransferServer *)v6 start];
  }
}

- (void)_connectWithAction:(id)a3 replyHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (_TRLogEnabled == 1)
  {
    id v8 = TRLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Beginning the setup process.", buf, 2u);
    }
  }
  id v9 = [(TRDeviceSetupServer *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(TRDeviceSetupServer *)self delegate];
    uint64_t v12 = [v6 deviceName];
    [v11 deviceSetupServer:self didBeginSetupWithDeviceName:v12];
  }
  if (_TRLogEnabled == 1)
  {
    v13 = TRLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v6 networkSSID];
      *(_DWORD *)buf = 138412290;
      id v23 = v14;
      _os_log_impl(&dword_2149BE000, v13, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Asking delegate to connect to a network. Recommended network SSID = \"%@\".", buf, 0xCu);
    }
  }
  objc_initWeak((id *)buf, self);
  v15 = [(TRDeviceSetupServer *)self delegate];
  v16 = [v6 networkSSID];
  char v17 = [v6 networkPassword];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __55__TRDeviceSetupServer__connectWithAction_replyHandler___block_invoke;
  v19[3] = &unk_264220D70;
  objc_copyWeak(&v21, (id *)buf);
  id v18 = v7;
  id v20 = v18;
  [v15 deviceSetupServer:self connectToNetworkWithRecommendedSSID:v16 password:v17 completionHandler:v19];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __55__TRDeviceSetupServer__connectWithAction_replyHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (_TRLogEnabled == 1)
  {
    id v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = @"failed to connect to";
      if (a2) {
        id v7 = @"successfully connected to";
      }
      int v17 = 138412290;
      id v18 = v7;
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Delegate %@ a network.", (uint8_t *)&v17, 0xCu);
    }
  }
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setCachedAuthInfo:0];

    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    char v10 = [v9 delegate];
    id v11 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v12 = [v10 accountsToAuthenticateForDeviceSetupServer:v11];
    v13 = (void *)[v12 mutableCopy];
    id v14 = objc_loadWeakRetained((id *)(a1 + 40));
    [v14 setAccountsToAuthenticate:v13];

    v15 = objc_loadWeakRetained((id *)(a1 + 40));
    [v15 _requestAuthenticationForNextAccountWithReplyHandler:*(void *)(a1 + 32)];
LABEL_11:

    goto LABEL_12;
  }
  if (*(void *)(a1 + 32))
  {
    v15 = [MEMORY[0x263F087E8] errorWithDomain:@"TRDeviceSetupErrorDomain" code:-8110 userInfo:0];
    id v16 = objc_loadWeakRetained((id *)(a1 + 40));
    [v16 _finishSetupWithError:v15 replyHandler:*(void *)(a1 + 32)];

    goto LABEL_11;
  }
LABEL_12:
}

- (void)_requestAuthenticationForNextAccountWithReplyHandler:(id)a3
{
  id v13 = a3;
  v4 = [(TRDeviceSetupServer *)self accountsToAuthenticate];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(TRDeviceSetupServer *)self accountsToAuthenticate];
    id v7 = [v6 firstObject];
    uint64_t v8 = [v7 unsignedIntegerValue];

    id v9 = [(TRDeviceSetupServer *)self accountsToAuthenticate];
    [v9 removeObjectAtIndex:0];
  }
  else
  {
    uint64_t v8 = 0;
  }
  char v10 = [(TRDeviceSetupServer *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v12 = [(TRDeviceSetupServer *)self delegate];
    [v12 deviceSetupServer:self willRequestAuthenticationForAccount:v8];
  }
  [(TRDeviceSetupServer *)self _requestAuthenticationForAccount:v8 replyHandler:v13];
}

- (void)_requestAuthenticationForAccount:(unint64_t)a3 replyHandler:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = [(TRDeviceSetupServer *)self cachedAuthInfo];
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
    id v9 = [v7 objectForKeyedSubscript:v8];

    objc_initWeak(&location, self);
    if (v9)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __69__TRDeviceSetupServer__requestAuthenticationForAccount_replyHandler___block_invoke;
      v10[3] = &unk_264220D98;
      objc_copyWeak(v12, &location);
      id v11 = v6;
      v12[1] = (id)a3;
      [(TRDeviceSetupServer *)self _authenticateAccount:a3 withAuthInfo:v9 completion:v10];

      objc_destroyWeak(v12);
    }
    else
    {
      [(TRDeviceSetupServer *)self _requestAuthenticationFromPeripheralForAccount:a3 lastAttemptAction:0 lastAttemptError:0 replyHandler:v6];
    }
    objc_destroyWeak(&location);
  }
  else
  {
    [(TRDeviceSetupServer *)self _requestGeneralSetupWithReplyHandler:v6];
  }
}

void __69__TRDeviceSetupServer__requestAuthenticationForAccount_replyHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (a2 == 1)
  {
    [WeakRetained _requestAuthenticationForNextAccountWithReplyHandler:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = [WeakRetained cachedAuthInfo];
    id v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v6 removeObjectForKey:v7];

    id v8 = objc_loadWeakRetained(v4);
    [v8 _requestAuthenticationForAccount:*(void *)(a1 + 48) replyHandler:*(void *)(a1 + 32)];
  }
}

- (void)_requestAuthenticationFromPeripheralForAccount:(unint64_t)a3 lastAttemptAction:(id)a4 lastAttemptError:(id)a5 replyHandler:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(TRDeviceSetupServer *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    v15 = [(TRDeviceSetupServer *)self delegate];
    id v16 = [v15 deviceSetupServer:self localizedAuthenticationMessageForAccount:a3];

    if (!v11) {
      goto LABEL_7;
    }
  }
  else
  {
    id v16 = 0;
    if (!v11) {
      goto LABEL_7;
    }
  }
  int v17 = [v11 domain];
  int v18 = [v17 isEqualToString:@"TRDeviceSetupErrorDomain"];

  if (v18)
  {
    uint64_t v19 = [v11 localizedDescription];
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v19 = 0;
LABEL_8:
  if (v10) {
    +[TRDeviceSetupAuthenticateAction actionForFailedAttemptWithOriginalAction:v10 requestMessage:v16 failureMessage:v19];
  }
  else {
  id v20 = +[TRDeviceSetupAuthenticateAction actionForInitialAttemptWithAccountType:a3 requestMessage:v16];
  }
  id v24 = 0;
  BOOL v21 = [(TRDeviceSetupServer *)self _sendAction:v20 sendDataHandler:v12 shouldSendNilOnFailure:0 error:&v24];
  id v22 = v24;
  if (!v21)
  {
    if (_TRLogEnabled == 1)
    {
      id v23 = TRLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v26 = v20;
        __int16 v27 = 2112;
        id v28 = v22;
        _os_log_impl(&dword_2149BE000, v23, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Failed to send auth request, moving on to general setup. Action: %@. Error: %@.", buf, 0x16u);
      }
    }
    [(TRDeviceSetupServer *)self _requestGeneralSetupWithReplyHandler:v12];
  }
}

- (void)_authenticateAccount:(unint64_t)a3 withAuthInfo:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 objectForKeyedSubscript:@"TRDeviceSetupAuthenticationKeyAccountID"];
  id v11 = [v8 objectForKeyedSubscript:@"TRDeviceSetupAuthenticationKeyAccountPassword"];
  if (a3
    && [v10 length]
    && [v11 length]
    && ([(TRDeviceSetupServer *)self delegate],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    if (_TRLogEnabled == 1)
    {
      id v13 = TRLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        char v14 = TRStringFromSetupAccountType(a3);
        *(_DWORD *)buf = 138412290;
        id v24 = v14;
        _os_log_impl(&dword_2149BE000, v13, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Asking delegate to authenticate account \"%@\".", buf, 0xCu);
      }
    }
    v15 = [(TRDeviceSetupServer *)self delegate];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __68__TRDeviceSetupServer__authenticateAccount_withAuthInfo_completion___block_invoke;
    v20[3] = &unk_264220DC0;
    unint64_t v22 = a3;
    id v21 = v9;
    [v15 deviceSetupServer:self authenticateAccount:a3 withInfo:v8 completionHandler:v20];
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      id v16 = TRLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = TRStringFromSetupAccountType(a3);
        int v18 = [(TRDeviceSetupServer *)self delegate];
        uint64_t v19 = &stru_26C5827A8;
        if (!v18) {
          uint64_t v19 = @" (No delegate)";
        }
        *(_DWORD *)buf = 138412546;
        id v24 = v17;
        __int16 v25 = 2112;
        v26 = v19;
        _os_log_impl(&dword_2149BE000, v16, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Skipping authentication for account \"%@\".%@", buf, 0x16u);
      }
    }
    if (v9) {
      (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 2, 0);
    }
  }
}

void __68__TRDeviceSetupServer__authenticateAccount_withAuthInfo_completion___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (_TRLogEnabled == 1)
  {
    id v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        id v7 = @"successfully authenticated";
      }
      else {
        id v7 = @"failed to authenticate";
      }
      id v8 = TRStringFromSetupAccountType(*(void *)(a1 + 40));
      int v10 = 138412546;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Delegate %@ account \"%@\".", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, a2, v5);
  }
}

- (void)_authenticateWithAction:(id)a3 replyHandler:(id)a4
{
  v27[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v26[0] = @"TRDeviceSetupAuthenticationKeyAccountID";
  uint64_t v8 = [v6 accountID];
  uint64_t v9 = (void *)v8;
  if (v8) {
    int v10 = (__CFString *)v8;
  }
  else {
    int v10 = &stru_26C5827A8;
  }
  v27[0] = v10;
  v26[1] = @"TRDeviceSetupAuthenticationKeyAccountPassword";
  uint64_t v11 = [v6 accountPassword];
  __int16 v12 = (void *)v11;
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  else {
    id v13 = &stru_26C5827A8;
  }
  v27[1] = v13;
  v26[2] = @"TRDeviceSetupAuthenticationKeyAttemptCount";
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "attemptCount"));
  v27[2] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

  objc_initWeak(&location, self);
  uint64_t v16 = [v6 accountType];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __60__TRDeviceSetupServer__authenticateWithAction_replyHandler___block_invoke;
  v20[3] = &unk_264220DE8;
  id v17 = v6;
  id v21 = v17;
  objc_copyWeak(&v24, &location);
  id v18 = v15;
  id v22 = v18;
  id v19 = v7;
  id v23 = v19;
  [(TRDeviceSetupServer *)self _authenticateAccount:v16 withAuthInfo:v18 completion:v20];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __60__TRDeviceSetupServer__authenticateWithAction_replyHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2 != 2)
  {
    if (a2 != 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(WeakRetained, "_requestAuthenticationFromPeripheralForAccount:lastAttemptAction:lastAttemptError:replyHandler:", objc_msgSend(*(id *)(a1 + 32), "accountType"), *(void *)(a1 + 32), v5, *(void *)(a1 + 48));
      goto LABEL_16;
    }
    id v6 = [*(id *)(a1 + 32) accountTypesWithSharedCredentials];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      id v24 = v5;
      id v8 = objc_loadWeakRetained((id *)(a1 + 56));
      uint64_t v9 = [v8 cachedAuthInfo];

      if (!v9)
      {
        id v10 = objc_loadWeakRetained((id *)(a1 + 56));
        uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
        [v10 setCachedAuthInfo:v11];
      }
      __int16 v12 = (void *)[*(id *)(a1 + 40) mutableCopy];
      [v12 setObject:&unk_26C58CC98 forKeyedSubscript:@"TRDeviceSetupAuthenticationKeyAttemptCount"];
      id v23 = v12;
      id v13 = (void *)[v12 copy];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v14 = [*(id *)(a1 + 32) accountTypesWithSharedCredentials];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v26;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * v18);
            id v20 = objc_loadWeakRetained((id *)(a1 + 56));
            id v21 = [v20 cachedAuthInfo];
            [v21 setObject:v13 forKeyedSubscript:v19];

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v16);
      }

      id v5 = v24;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _requestAuthenticationForNextAccountWithReplyHandler:*(void *)(a1 + 48)];
LABEL_16:
}

- (void)_requestGeneralSetupWithReplyHandler:(id)a3
{
  id v4 = a3;
  [(TRDeviceSetupServer *)self setAccountsToAuthenticate:0];
  id v5 = objc_alloc_init(TRDeviceSetupGeneralSetupAction);
  [(TRDeviceSetupServer *)self _sendAction:v5 sendDataHandler:v4 shouldSendNilOnFailure:1 error:0];
}

- (void)_setUpWithAction:(id)a3 replyHandler:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v8 = [v22 countryCode];

  if (v8)
  {
    uint64_t v9 = [v22 countryCode];
    [v7 setObject:v9 forKeyedSubscript:@"TRDeviceSetupInfoKeyCountryCode"];
  }
  id v10 = [v22 language];

  if (v10)
  {
    uint64_t v11 = [v22 language];
    [v7 setObject:v11 forKeyedSubscript:@"TRDeviceSetupInfoKeyLanguage"];
  }
  __int16 v12 = [v22 homeSharingID];

  if (v12)
  {
    id v13 = [v22 homeSharingID];
    [v7 setObject:v13 forKeyedSubscript:@"TRDeviceSetupInfoKeyHomeSharingAppleID"];
  }
  uint64_t v14 = [v22 homeSharingGroupID];

  if (v14)
  {
    uint64_t v15 = [v22 homeSharingGroupID];
    [v7 setObject:v15 forKeyedSubscript:@"TRDeviceSetupInfoKeyHomeSharingGroupID"];
  }
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v22, "isDiagnosticsEnabled"));
  [v7 setObject:v16 forKeyedSubscript:@"TRDeviceSetupInfoKeyDiagnosticsEnabled"];

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v22, "rememberPassword"));
  [v7 setObject:v17 forKeyedSubscript:@"TRDeviceSetupInfoKeyRememberPasswordEnabled"];

  uint64_t v18 = [(TRDeviceSetupServer *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    id v20 = [(TRDeviceSetupServer *)self delegate];
    id v21 = (void *)[v7 copy];
    [v20 deviceSetupServer:self didReceiveSetupInfo:v21];
  }
  [(TRDeviceSetupServer *)self _finishSetupWithError:0 replyHandler:v6];
}

- (void)_finishWithAction:(id)a3 replyHandler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6) {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
  self->_setupInProgress = 0;
  self->_cancelledSetupInProgress = 0;
  id v8 = [(TRDeviceSetupServer *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(TRDeviceSetupServer *)self delegate];
    [v10 deviceSetupServerDidFinishSetup:self];
  }
}

- (void)_cancelWithAction:(id)a3 replyHandler:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6) {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
  self->_setupInProgress = 0;
  self->_cancelledSetupInProgress = 0;
  id v8 = [(TRDeviceSetupServer *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(TRDeviceSetupServer *)self delegate];
    id v11 = [v12 error];
    [v10 deviceSetupServer:self didFailSetupWithError:v11];
  }
}

- (void)_finishSetupWithError:(id)a3 replyHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (_TRLogEnabled == 1)
    {
      id v8 = TRLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Setup failed. Error: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    char v9 = [[TRDeviceSetupCancelAction alloc] initWithError:v6];
    [(TRDeviceSetupServer *)self _sendAction:v9 sendDataHandler:v7 shouldSendNilOnFailure:1 error:0];
    id v10 = [(TRDeviceSetupServer *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(TRDeviceSetupServer *)self delegate];
      [v12 deviceSetupServer:self didFailSetupWithError:v6];
    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      id v13 = TRLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_2149BE000, v13, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Setup is finished.", (uint8_t *)&v14, 2u);
      }
    }
    char v9 = objc_alloc_init(TRDeviceSetupFinishAction);
    [(TRDeviceSetupServer *)self _sendAction:v9 sendDataHandler:v7 shouldSendNilOnFailure:1 error:0];
  }
}

- (BOOL)_sendAction:(id)a3 sendDataHandler:(id)a4 shouldSendNilOnFailure:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v9 = (void (**)(id, void *))a4;
  if (v9)
  {
    id v10 = [a3 dataRepresentationWithError:a6];
    BOOL v11 = v10 != 0;
    if (v10)
    {
      if (_TRLogEnabled == 1)
      {
        id v12 = TRLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 134217984;
          uint64_t v15 = [v10 length];
          _os_log_impl(&dword_2149BE000, v12, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupServer] Data to send length: %ld", (uint8_t *)&v14, 0xCu);
        }
      }
      v9[2](v9, v10);
    }
    else if (v7)
    {
      v9[2](v9, 0);
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (TRDeviceSetupServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TRDeviceSetupServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)accountsToAuthenticate
{
  return self->_accountsToAuthenticate;
}

- (void)setAccountsToAuthenticate:(id)a3
{
}

- (NSMutableDictionary)cachedAuthInfo
{
  return self->_cachedAuthInfo;
}

- (void)setCachedAuthInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAuthInfo, 0);
  objc_storeStrong((id *)&self->_accountsToAuthenticate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataToSendSemaphore, 0);
  objc_storeStrong((id *)&self->_dataToSend, 0);
  objc_storeStrong((id *)&self->_transferServer, 0);
}

@end