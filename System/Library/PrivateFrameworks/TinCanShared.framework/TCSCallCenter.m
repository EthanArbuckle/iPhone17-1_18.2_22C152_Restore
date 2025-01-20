@interface TCSCallCenter
- (BOOL)hasValidConnection;
- (TCSCallCenter)init;
- (TCSCallCenterDelegate)delegate;
- (id)_callPassingPredicate:(id)a3;
- (id)activeCall;
- (id)currentCall;
- (id)endingCall;
- (id)ringingCall;
- (void)callConnected:(id)a3;
- (void)callStatusChanged:(id)a3;
- (void)completeInvitationFlowForContact:(id)a3;
- (void)disconnectCall:(id)a3;
- (void)invalidate;
- (void)logEntryForCallWithUniqueProxyIdentifier:(id)a3 completion:(id)a4;
- (void)queryIsTinCannable:(id)a3;
- (void)remoteUplinkMuteChanged:(id)a3;
- (void)sessionViewControllerViewDidAppear;
- (void)setDelegate:(id)a3;
- (void)setUplinkMuted:(BOOL)a3 for:(id)a4 completion:(id)a5;
- (void)synchronouslyFetchCall;
@end

@implementation TCSCallCenter

- (TCSCallCenter)init
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)TCSCallCenter;
  v2 = [(TCSCallCenter *)&v23 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.tincan.server" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = v2->_connection;
    v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFD5F88];
    [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

    v7 = v2->_connection;
    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFD6208];
    [(NSXPCConnection *)v7 setExportedInterface:v8];

    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    objc_initWeak(&location, v2);
    objc_initWeak(&from, v2->_connection);
    v9 = v2->_connection;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __21__TCSCallCenter_init__block_invoke;
    v19[3] = &unk_2644C8B00;
    objc_copyWeak(&v20, &location);
    [(NSXPCConnection *)v9 setInvalidationHandler:v19];
    v10 = v2->_connection;
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __21__TCSCallCenter_init__block_invoke_107;
    v17 = &unk_2644C8B00;
    objc_copyWeak(&v18, &from);
    [(NSXPCConnection *)v10 setInterruptionHandler:&v14];
    [(NSXPCConnection *)v2->_connection resume];
    [(TCSCallCenter *)v2 synchronouslyFetchCall];
    _TCSInitializeLogging();
    v11 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      call = v2->_call;
      *(_DWORD *)buf = 138412290;
      v25 = call;
      _os_log_impl(&dword_21E834000, v11, OS_LOG_TYPE_DEFAULT, "TCSCallCenter (init) now tracking call: %@", buf, 0xCu);
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __21__TCSCallCenter_init__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TCSInitializeLogging();
    v2 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = WeakRetained[1];
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_21E834000, v2, OS_LOG_TYPE_DEFAULT, "TCSCallCenter connection invalidation handler called for %@", (uint8_t *)&v5, 0xCu);
    }
    v4 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

void __21__TCSCallCenter_init__block_invoke_107(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TCSInitializeLogging();
    v2 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = WeakRetained;
      _os_log_impl(&dword_21E834000, v2, OS_LOG_TYPE_DEFAULT, "TCSCallCenter connection interruption handler called for %@", (uint8_t *)&v3, 0xCu);
    }
    [WeakRetained invalidate];
  }
}

- (void)invalidate
{
  _TCSInitializeLogging();
  int v3 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21E834000, v3, OS_LOG_TYPE_DEFAULT, "TCSCallCenter explicitly invalidating connection.", v4, 2u);
  }
  [(NSXPCConnection *)self->_connection invalidate];
}

- (BOOL)hasValidConnection
{
  return self->_connection != 0;
}

- (id)_callPassingPredicate:(id)a3
{
  if ((*((unsigned int (**)(id, TCSCall *))a3 + 2))(a3, self->_call)) {
    call = self->_call;
  }
  else {
    call = 0;
  }
  return call;
}

- (void)synchronouslyFetchCall
{
  int v3 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_110];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__TCSCallCenter_synchronouslyFetchCall__block_invoke_111;
  v4[3] = &unk_2644C8F10;
  v4[4] = self;
  [v3 getCall:v4];
}

void __39__TCSCallCenter_synchronouslyFetchCall__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    _TCSInitializeLogging();
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      __39__TCSCallCenter_synchronouslyFetchCall__block_invoke_cold_1();
    }
  }
}

void __39__TCSCallCenter_synchronouslyFetchCall__block_invoke_111(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setCallCenter:");
  _TCSInitializeLogging();
  uint64_t v5 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_21E834000, v5, OS_LOG_TYPE_DEFAULT, "TCSCallCenter synchronously fetched call: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)ringingCall
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [(TCSCallCenter *)self _callPassingPredicate:&__block_literal_global_104];
  if (v2)
  {
    _TCSInitializeLogging();
    int v3 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      int v6 = v2;
      _os_log_impl(&dword_21E834000, v3, OS_LOG_TYPE_DEFAULT, "TCSCallCenter has a ringing call: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return v2;
}

- (id)activeCall
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [(TCSCallCenter *)self _callPassingPredicate:&__block_literal_global_2];
  if (v2)
  {
    _TCSInitializeLogging();
    int v3 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      int v6 = v2;
      _os_log_impl(&dword_21E834000, v3, OS_LOG_TYPE_DEFAULT, "TCSCallCenter has an active call: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return v2;
}

- (id)currentCall
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [(TCSCallCenter *)self _callPassingPredicate:&__block_literal_global_100];
  if (v2)
  {
    _TCSInitializeLogging();
    int v3 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      int v6 = v2;
      _os_log_impl(&dword_21E834000, v3, OS_LOG_TYPE_DEFAULT, "TCSCallCenter has a current call: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return v2;
}

- (id)endingCall
{
  return [(TCSCallCenter *)self _callPassingPredicate:&__block_literal_global_102];
}

- (void)sessionViewControllerViewDidAppear
{
  id v2 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v2 sessionViewControllerViewDidAppear];
}

- (void)queryIsTinCannable:(id)a3
{
  id v4 = a3;
  if (+[TCSBehavior isRunningInStoreDemoModeOrSimulator])
  {
    _TCSInitializeLogging();
    int v5 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E834000, v5, OS_LOG_TYPE_DEFAULT, "Skipping invitation IDS query since we are running in store demo mode or the simulator.", buf, 2u);
    }
    int v6 = objc_opt_new();
    uint64_t v7 = [MEMORY[0x263EFF910] now];
    [v6 didReceiveCallFromContact:v4 date:v7];
  }
  else
  {
    id v8 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    [v8 queryIsTinCannable:v4];
  }
}

- (void)completeInvitationFlowForContact:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 completeInvitationFlowForContact:v4];
}

- (void)logEntryForCallWithUniqueProxyIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__TCSCallCenter_logEntryForCallWithUniqueProxyIdentifier_completion___block_invoke;
  v14[3] = &unk_2644C8F38;
  id v8 = v6;
  id v15 = v8;
  id v9 = a3;
  v10 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__TCSCallCenter_logEntryForCallWithUniqueProxyIdentifier_completion___block_invoke_117;
  v12[3] = &unk_2644C8F60;
  id v13 = v8;
  id v11 = v8;
  [v10 getLogEntryForCallWithUniqueProxyIdentifier:v9 completion:v12];
}

void __69__TCSCallCenter_logEntryForCallWithUniqueProxyIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    _TCSInitializeLogging();
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      __69__TCSCallCenter_logEntryForCallWithUniqueProxyIdentifier_completion___block_invoke_cold_1();
    }
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id v5 = objc_opt_new();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
    }
  }
}

uint64_t __69__TCSCallCenter_logEntryForCallWithUniqueProxyIdentifier_completion___block_invoke_117(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setUplinkMuted:(BOOL)a3 for:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  dispatch_time_t v10 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__TCSCallCenter_setUplinkMuted_for_completion___block_invoke;
  block[3] = &unk_2644C8F88;
  v19 = v20;
  id v11 = v9;
  id v18 = v11;
  dispatch_after(v10, MEMORY[0x263EF83A0], block);
  v12 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__TCSCallCenter_setUplinkMuted_for_completion___block_invoke_118;
  v14[3] = &unk_2644C8F88;
  v16 = v20;
  id v13 = v11;
  id v15 = v13;
  [v12 setUplinkMuted:v6 for:v8 completion:v14];

  _Block_object_dispose(v20, 8);
}

uint64_t __47__TCSCallCenter_setUplinkMuted_for_completion___block_invoke(uint64_t result)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    _TCSInitializeLogging();
    id v2 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      uint64_t v4 = "-[TCSCallCenter setUplinkMuted:for:completion:]_block_invoke";
      _os_log_impl(&dword_21E834000, v2, OS_LOG_TYPE_DEFAULT, "Timed out waiting for completion to fire for %s, manually firing", (uint8_t *)&v3, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __47__TCSCallCenter_setUplinkMuted_for_completion___block_invoke_118(uint64_t result)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    _TCSInitializeLogging();
    id v2 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      uint64_t v4 = "-[TCSCallCenter setUplinkMuted:for:completion:]_block_invoke";
      _os_log_impl(&dword_21E834000, v2, OS_LOG_TYPE_DEFAULT, "Calling completion for %s", (uint8_t *)&v3, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)disconnectCall:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 disconnectCall:v4];
}

- (void)callStatusChanged:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_call, a3);
  [(TCSCall *)self->_call setCallCenter:self];
  _TCSInitializeLogging();
  BOOL v6 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    call = self->_call;
    int v9 = 138412290;
    dispatch_time_t v10 = call;
    _os_log_impl(&dword_21E834000, v6, OS_LOG_TYPE_DEFAULT, "TCSCallCenter (callStatusChanged) now tracking call: %@", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [(TCSCallCenter *)self delegate];
  [v8 callStatusChanged:v5];
}

- (void)callConnected:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_call, a3);
  [(TCSCall *)self->_call setCallCenter:self];
  _TCSInitializeLogging();
  BOOL v6 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    call = self->_call;
    int v9 = 138412290;
    dispatch_time_t v10 = call;
    _os_log_impl(&dword_21E834000, v6, OS_LOG_TYPE_DEFAULT, "TCSCallCenter (callConnected) now tracking call: %@", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [(TCSCallCenter *)self delegate];
  [v8 callConnected:v5];
}

- (void)remoteUplinkMuteChanged:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_call, a3);
  [(TCSCall *)self->_call setCallCenter:self];
  _TCSInitializeLogging();
  BOOL v6 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    call = self->_call;
    int v9 = 138412290;
    dispatch_time_t v10 = call;
    _os_log_impl(&dword_21E834000, v6, OS_LOG_TYPE_DEFAULT, "TCSCallCenter (remoteUplinkMuteChanged) now tracking call: %@", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [(TCSCallCenter *)self delegate];
  [v8 remoteUplinkMuteChanged:v5];
}

- (TCSCallCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TCSCallCenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __39__TCSCallCenter_synchronouslyFetchCall__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21E834000, v0, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)v1, 0x16u);
}

void __69__TCSCallCenter_logEntryForCallWithUniqueProxyIdentifier_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21E834000, v0, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)v1, 0x16u);
}

@end