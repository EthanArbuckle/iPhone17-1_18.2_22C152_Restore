@interface TUNeighborhoodActivityConduitXPCClient
+ (NSXPCInterface)neighborhoodActivityClientXPCInterface;
+ (NSXPCInterface)neighborhoodActivityServerXPCInterface;
+ (id)allowedXPCClasses;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (TUNeighborhoodActivityConduitXPCClient)init;
- (TUNeighborhoodActivityConduitXPCClientDelegate)delegate;
- (id)server;
- (id)serverWithErrorHandler:(id)a3;
- (int)token;
- (void)activeSplitSessionTVDeviceWithCompletion:(id)a3;
- (void)approveSplitSessionForConversation:(id)a3 requestedFromDevice:(id)a4 pullContext:(int64_t)a5 completion:(id)a6;
- (void)cancelSplitSessionApproval;
- (void)dealloc;
- (void)disconnectTVDevice:(id)a3 completion:(id)a4;
- (void)ensureConnection;
- (void)handoffConversation:(id)a3 toTVDevice:(id)a4 completion:(id)a5;
- (void)inviteTVDevice:(id)a3 toConversationWithUUID:(id)a4 completion:(id)a5;
- (void)isRingingFaceTimeCallsOnConnectedTVDeviceChanged:(BOOL)a3;
- (void)isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion:(id)a3;
- (void)nearbyTVDevicesWithCompletion:(id)a3;
- (void)pullConversation:(id)a3 fromTVDevice:(id)a4 completion:(id)a5;
- (void)registerApprovalClientEnabled:(BOOL)a3;
- (void)respondToSuggestionWithResult:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSuggestedTVDeviceName:(id)a3 completion:(id)a4;
- (void)setToken:(int)a3;
- (void)setXpcConnection:(id)a3;
- (void)splitSessionUpdated:(id)a3;
- (void)startConversationWith:(id)a3 on:(id)a4 completion:(id)a5;
- (void)suggestionUpdated:(id)a3;
- (void)suggestionWithCompletion:(id)a3;
- (void)tvDeviceAppeared:(id)a3;
- (void)tvDeviceDisappeared:(id)a3;
- (void)xpcConnection;
@end

@implementation TUNeighborhoodActivityConduitXPCClient

- (TUNeighborhoodActivityConduitXPCClient)init
{
  v10.receiver = self;
  v10.super_class = (Class)TUNeighborhoodActivityConduitXPCClient;
  v2 = [(TUNeighborhoodActivityConduitXPCClient *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyservices.neighborhoodactivityconduitxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    v5 = v2->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__TUNeighborhoodActivityConduitXPCClient_init__block_invoke;
    v7[3] = &unk_1E58E5F18;
    objc_copyWeak(&v8, &location);
    notify_register_dispatch("NeighborhoodActivityConduitClientsShouldConnectNotification", &v2->_token, v5, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __46__TUNeighborhoodActivityConduitXPCClient_init__block_invoke(uint64_t a1)
{
  v2 = TUConduitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "TUConduitXPCClient: NeighborhoodActivityConduit restarted and requested re-connection", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = TUConduitLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __46__TUNeighborhoodActivityConduitXPCClient_init__block_invoke_cold_1(v4);
    }

    v5 = [WeakRetained delegate];
    v6 = v5;
    if (WeakRetained[4])
    {
      [v5 connectionEstablishedForClient:WeakRetained];
    }
    else
    {
      [WeakRetained xpcConnection];
    }
  }
}

- (void)dealloc
{
  dispatch_queue_t v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating TUNeighborhoodActivityConduitXPCClient", buf, 2u);
  }

  notify_cancel(self->_token);
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v4.receiver = self;
  v4.super_class = (Class)TUNeighborhoodActivityConduitXPCClient;
  [(TUNeighborhoodActivityConduitXPCClient *)&v4 dealloc];
}

- (void)ensureConnection
{
  dispatch_queue_t v3 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__TUNeighborhoodActivityConduitXPCClient_ensureConnection__block_invoke;
  block[3] = &unk_1E58E5BE0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __58__TUNeighborhoodActivityConduitXPCClient_ensureConnection__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) xpcConnection];

  if (!v1)
  {
    v2 = TUConduitLog();
    if (os_log_type_enabled(v2, (os_log_type_t)0x90u)) {
      __58__TUNeighborhoodActivityConduitXPCClient_ensureConnection__block_invoke_cold_1(v2);
    }
  }
}

- (void)nearbyTVDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__TUNeighborhoodActivityConduitXPCClient_nearbyTVDevicesWithCompletion___block_invoke;
  v7[3] = &unk_1E58E60D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __72__TUNeighborhoodActivityConduitXPCClient_nearbyTVDevicesWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__TUNeighborhoodActivityConduitXPCClient_nearbyTVDevicesWithCompletion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_queue_t v3 = [v2 serverWithErrorHandler:v4];
  [v3 nearbyTVDevicesWithCompletion:*(void *)(a1 + 40)];
}

void __72__TUNeighborhoodActivityConduitXPCClient_nearbyTVDevicesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUConduitLog();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
    __72__TUNeighborhoodActivityConduitXPCClient_nearbyTVDevicesWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__TUNeighborhoodActivityConduitXPCClient_isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E58E60D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __98__TUNeighborhoodActivityConduitXPCClient_isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98__TUNeighborhoodActivityConduitXPCClient_isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion:*(void *)(a1 + 40)];
}

void __98__TUNeighborhoodActivityConduitXPCClient_isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUConduitLog();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
    __72__TUNeighborhoodActivityConduitXPCClient_nearbyTVDevicesWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activeSplitSessionTVDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__TUNeighborhoodActivityConduitXPCClient_activeSplitSessionTVDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E58E60D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __83__TUNeighborhoodActivityConduitXPCClient_activeSplitSessionTVDeviceWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__TUNeighborhoodActivityConduitXPCClient_activeSplitSessionTVDeviceWithCompletion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 activeSplitSessionTVDeviceWithCompletion:*(void *)(a1 + 40)];
}

void __83__TUNeighborhoodActivityConduitXPCClient_activeSplitSessionTVDeviceWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUConduitLog();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
    __83__TUNeighborhoodActivityConduitXPCClient_activeSplitSessionTVDeviceWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSuggestedTVDeviceName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__TUNeighborhoodActivityConduitXPCClient_setSuggestedTVDeviceName_completion___block_invoke;
  block[3] = &unk_1E58E7140;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __78__TUNeighborhoodActivityConduitXPCClient_setSuggestedTVDeviceName_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__TUNeighborhoodActivityConduitXPCClient_setSuggestedTVDeviceName_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 setSuggestedTVDeviceName:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __78__TUNeighborhoodActivityConduitXPCClient_setSuggestedTVDeviceName_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUConduitLog();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
    __78__TUNeighborhoodActivityConduitXPCClient_setSuggestedTVDeviceName_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__TUNeighborhoodActivityConduitXPCClient_suggestionWithCompletion___block_invoke;
  v7[3] = &unk_1E58E60D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__TUNeighborhoodActivityConduitXPCClient_suggestionWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__TUNeighborhoodActivityConduitXPCClient_suggestionWithCompletion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 suggestionWithCompletion:*(void *)(a1 + 40)];
}

void __67__TUNeighborhoodActivityConduitXPCClient_suggestionWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUConduitLog();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
    __67__TUNeighborhoodActivityConduitXPCClient_suggestionWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)inviteTVDevice:(id)a3 toConversationWithUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__TUNeighborhoodActivityConduitXPCClient_inviteTVDevice_toConversationWithUUID_completion___block_invoke;
  v15[3] = &unk_1E58E7670;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __91__TUNeighborhoodActivityConduitXPCClient_inviteTVDevice_toConversationWithUUID_completion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __91__TUNeighborhoodActivityConduitXPCClient_inviteTVDevice_toConversationWithUUID_completion___block_invoke_2;
  v4[3] = &unk_1E58E68C8;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 inviteTVDevice:*(void *)(a1 + 40) toConversation:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __91__TUNeighborhoodActivityConduitXPCClient_inviteTVDevice_toConversationWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUConduitLog();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
    __91__TUNeighborhoodActivityConduitXPCClient_inviteTVDevice_toConversationWithUUID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)disconnectTVDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__TUNeighborhoodActivityConduitXPCClient_disconnectTVDevice_completion___block_invoke;
  block[3] = &unk_1E58E75D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __72__TUNeighborhoodActivityConduitXPCClient_disconnectTVDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __72__TUNeighborhoodActivityConduitXPCClient_disconnectTVDevice_completion___block_invoke_2;
  id v7 = &unk_1E58E7648;
  v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v3 = [v2 serverWithErrorHandler:&v4];
  objc_msgSend(v3, "disconnectTVDevice:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), v4, v5, v6, v7);
}

void __72__TUNeighborhoodActivityConduitXPCClient_disconnectTVDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = TUConduitLog();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
    __72__TUNeighborhoodActivityConduitXPCClient_disconnectTVDevice_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)respondToSuggestionWithResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__TUNeighborhoodActivityConduitXPCClient_respondToSuggestionWithResult_completion___block_invoke;
  block[3] = &unk_1E58E75D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __83__TUNeighborhoodActivityConduitXPCClient_respondToSuggestionWithResult_completion___block_invoke(uint64_t a1)
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __83__TUNeighborhoodActivityConduitXPCClient_respondToSuggestionWithResult_completion___block_invoke_2;
  id v7 = &unk_1E58E7648;
  v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v3 = [v2 serverWithErrorHandler:&v4];
  objc_msgSend(v3, "respondToSuggestionWithResult:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), v4, v5, v6, v7);
}

void __83__TUNeighborhoodActivityConduitXPCClient_respondToSuggestionWithResult_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = TUConduitLog();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
    __83__TUNeighborhoodActivityConduitXPCClient_respondToSuggestionWithResult_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)registerApprovalClientEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = TUConduitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "NO";
    if (v3) {
      id v6 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    v11 = v6;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Sending approval registration: %s", buf, 0xCu);
  }

  id v7 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__TUNeighborhoodActivityConduitXPCClient_registerApprovalClientEnabled___block_invoke;
  v8[3] = &unk_1E58E6280;
  v8[4] = self;
  BOOL v9 = v3;
  dispatch_async(v7, v8);
}

void __72__TUNeighborhoodActivityConduitXPCClient_registerApprovalClientEnabled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serverWithErrorHandler:&__block_literal_global_37];
  [v2 registerSplitSessionApprovalEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void __72__TUNeighborhoodActivityConduitXPCClient_registerApprovalClientEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = TUConduitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __72__TUNeighborhoodActivityConduitXPCClient_registerApprovalClientEnabled___block_invoke_2_cold_1();
  }
}

- (void)handoffConversation:(id)a3 toTVDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__TUNeighborhoodActivityConduitXPCClient_handoffConversation_toTVDevice_completion___block_invoke;
  v15[3] = &unk_1E58E7670;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __84__TUNeighborhoodActivityConduitXPCClient_handoffConversation_toTVDevice_completion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__TUNeighborhoodActivityConduitXPCClient_handoffConversation_toTVDevice_completion___block_invoke_2;
  v4[3] = &unk_1E58E68C8;
  id v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  BOOL v3 = [v2 serverWithErrorHandler:v4];
  [v3 handoffConversation:*(void *)(a1 + 40) toTVDevice:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __84__TUNeighborhoodActivityConduitXPCClient_handoffConversation_toTVDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = TUConduitLog();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
    __84__TUNeighborhoodActivityConduitXPCClient_handoffConversation_toTVDevice_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)pullConversation:(id)a3 fromTVDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__TUNeighborhoodActivityConduitXPCClient_pullConversation_fromTVDevice_completion___block_invoke;
  v15[3] = &unk_1E58E7670;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __83__TUNeighborhoodActivityConduitXPCClient_pullConversation_fromTVDevice_completion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__TUNeighborhoodActivityConduitXPCClient_pullConversation_fromTVDevice_completion___block_invoke_2;
  v4[3] = &unk_1E58E68C8;
  id v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 pullConversation:*(void *)(a1 + 40) fromTVDevice:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __83__TUNeighborhoodActivityConduitXPCClient_pullConversation_fromTVDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = TUConduitLog();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
    __83__TUNeighborhoodActivityConduitXPCClient_pullConversation_fromTVDevice_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)startConversationWith:(id)a3 on:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__TUNeighborhoodActivityConduitXPCClient_startConversationWith_on_completion___block_invoke;
  v15[3] = &unk_1E58E68A0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __78__TUNeighborhoodActivityConduitXPCClient_startConversationWith_on_completion___block_invoke(uint64_t a1)
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __78__TUNeighborhoodActivityConduitXPCClient_startConversationWith_on_completion___block_invoke_2;
  id v7 = &unk_1E58E7648;
  id v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 56);
  id v3 = [v2 serverWithErrorHandler:&v4];
  objc_msgSend(v3, "startConversationWith:on:completion:", *(void *)(a1 + 48), *(void *)(a1 + 40), *(void *)(a1 + 56), v4, v5, v6, v7);
}

void __78__TUNeighborhoodActivityConduitXPCClient_startConversationWith_on_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = TUConduitLog();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
    __78__TUNeighborhoodActivityConduitXPCClient_startConversationWith_on_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)tvDeviceAppeared:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__TUNeighborhoodActivityConduitXPCClient_tvDeviceAppeared___block_invoke;
  v7[3] = &unk_1E58E5C08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__TUNeighborhoodActivityConduitXPCClient_tvDeviceAppeared___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 tvDeviceAppeared:*(void *)(a1 + 40)];
}

- (void)tvDeviceDisappeared:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__TUNeighborhoodActivityConduitXPCClient_tvDeviceDisappeared___block_invoke;
  v7[3] = &unk_1E58E5C08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__TUNeighborhoodActivityConduitXPCClient_tvDeviceDisappeared___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 tvDeviceDisappeared:*(void *)(a1 + 40)];
}

- (void)splitSessionUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__TUNeighborhoodActivityConduitXPCClient_splitSessionUpdated___block_invoke;
  v7[3] = &unk_1E58E5C08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__TUNeighborhoodActivityConduitXPCClient_splitSessionUpdated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 splitSessionUpdated:*(void *)(a1 + 40)];
}

- (void)suggestionUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__TUNeighborhoodActivityConduitXPCClient_suggestionUpdated___block_invoke;
  v7[3] = &unk_1E58E5C08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__TUNeighborhoodActivityConduitXPCClient_suggestionUpdated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 suggestionUpdated:*(void *)(a1 + 40)];
}

- (void)isRingingFaceTimeCallsOnConnectedTVDeviceChanged:(BOOL)a3
{
  uint64_t v5 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__TUNeighborhoodActivityConduitXPCClient_isRingingFaceTimeCallsOnConnectedTVDeviceChanged___block_invoke;
  v6[3] = &unk_1E58E6280;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __91__TUNeighborhoodActivityConduitXPCClient_isRingingFaceTimeCallsOnConnectedTVDeviceChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 isRingingFaceTimeCallsOnConnectedTVDeviceChanged:*(unsigned __int8 *)(a1 + 40)];
}

- (void)approveSplitSessionForConversation:(id)a3 requestedFromDevice:(id)a4 pullContext:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__TUNeighborhoodActivityConduitXPCClient_approveSplitSessionForConversation_requestedFromDevice_pullContext_completion___block_invoke;
  block[3] = &unk_1E58E7988;
  block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a5;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __120__TUNeighborhoodActivityConduitXPCClient_approveSplitSessionForConversation_requestedFromDevice_pullContext_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 approveSplitSessionForConversation:*(void *)(a1 + 40) device:*(void *)(a1 + 48) pullContext:*(void *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

- (void)cancelSplitSessionApproval
{
  id v3 = [(TUNeighborhoodActivityConduitXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__TUNeighborhoodActivityConduitXPCClient_cancelSplitSessionApproval__block_invoke;
  block[3] = &unk_1E58E5BE0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __68__TUNeighborhoodActivityConduitXPCClient_cancelSplitSessionApproval__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 cancelSplitSessionApproval];
}

- (NSXPCConnection)xpcConnection
{
  if (+[TUNeighborhoodActivityConduit isConduitAvailable])
  {
    xpcConnection = self->_xpcConnection;
    if (!xpcConnection)
    {
      id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.NeighborhoodActivityConduitService" options:0];
      uint64_t v5 = self->_xpcConnection;
      self->_xpcConnection = v4;

      id v6 = [(id)objc_opt_class() neighborhoodActivityServerXPCInterface];
      [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v6];

      BOOL v7 = [(id)objc_opt_class() neighborhoodActivityClientXPCInterface];
      [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v7];

      [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
      objc_initWeak(&location, self);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke;
      v14[3] = &unk_1E58E5C50;
      objc_copyWeak(&v15, &location);
      [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v14];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke_11;
      v12[3] = &unk_1E58E5C50;
      objc_copyWeak(&v13, &location);
      [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v12];
      [(NSXPCConnection *)self->_xpcConnection resume];
      id v8 = [(TUNeighborhoodActivityConduitXPCClient *)self delegate];
      [v8 connectionEstablishedForClient:self];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
      xpcConnection = self->_xpcConnection;
    }
    id v9 = xpcConnection;
  }
  else
  {
    id v10 = TUConduitLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[TUNeighborhoodActivityConduitXPCClient xpcConnection](v10);
    }

    id v9 = 0;
  }

  return v9;
}

void __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

void __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = TUConduitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    int v6 = 136446210;
    Name = class_getName(v3);
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: XPC connection invalidated", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;
}

void __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke_2_12;
    block[3] = &unk_1E58E5BE0;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

void __55__TUNeighborhoodActivityConduitXPCClient_xpcConnection__block_invoke_2_12(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = TUConduitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    int v7 = 136446210;
    Name = class_getName(v3);
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: XPC connection interrupted", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  int v6 = [*(id *)(a1 + 32) delegate];
  [v6 connectionLostForClient:*(void *)(a1 + 32)];
}

- (id)server
{
  id v2 = [(TUNeighborhoodActivityConduitXPCClient *)self xpcConnection];
  id v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)serverWithErrorHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(TUNeighborhoodActivityConduitXPCClient *)self xpcConnection];
  int v6 = v5;
  if (v5)
  {
    int v7 = [v5 remoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    uint64_t v8 = TUMakeNeighborhoodConduitError(4, 0);
    v4[2](v4, v8);

    int v7 = 0;
  }

  return v7;
}

+ (id)allowedXPCClasses
{
  id v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  return (id)objc_msgSend(v15, "setWithObjects:", v14, v13, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
}

+ (NSXPCInterface)neighborhoodActivityClientXPCInterface
{
  if (neighborhoodActivityClientXPCInterface_onceToken != -1) {
    dispatch_once(&neighborhoodActivityClientXPCInterface_onceToken, &__block_literal_global_27_0);
  }
  uint64_t v2 = (void *)neighborhoodActivityClientXPCInterface_interface;

  return (NSXPCInterface *)v2;
}

void __80__TUNeighborhoodActivityConduitXPCClient_neighborhoodActivityClientXPCInterface__block_invoke()
{
  id v13 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  uint64_t v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED40160];
  uint64_t v11 = (void *)neighborhoodActivityClientXPCInterface_interface;
  neighborhoodActivityClientXPCInterface_interface = v10;

  id v12 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [(id)neighborhoodActivityClientXPCInterface_interface setClasses:v9 forSelector:sel_tvDeviceAppeared_ argumentIndex:0 ofReply:0];
  [(id)neighborhoodActivityClientXPCInterface_interface setClasses:v9 forSelector:sel_tvDeviceDisappeared_ argumentIndex:0 ofReply:0];
  [(id)neighborhoodActivityClientXPCInterface_interface setClasses:v9 forSelector:sel_splitSessionUpdated_ argumentIndex:0 ofReply:0];
  [(id)neighborhoodActivityClientXPCInterface_interface setClasses:v9 forSelector:sel_suggestionUpdated_ argumentIndex:0 ofReply:0];
  [(id)neighborhoodActivityClientXPCInterface_interface setClasses:v13 forSelector:sel_approveSplitSessionForConversation_requestedFromDevice_pullContext_completion_ argumentIndex:0 ofReply:0];
  [(id)neighborhoodActivityClientXPCInterface_interface setClasses:v9 forSelector:sel_approveSplitSessionForConversation_requestedFromDevice_pullContext_completion_ argumentIndex:1 ofReply:0];
  [(id)neighborhoodActivityClientXPCInterface_interface setClasses:v12 forSelector:sel_approveSplitSessionForConversation_requestedFromDevice_pullContext_completion_ argumentIndex:1 ofReply:1];
}

+ (NSXPCInterface)neighborhoodActivityServerXPCInterface
{
  if (neighborhoodActivityServerXPCInterface_onceToken != -1) {
    dispatch_once(&neighborhoodActivityServerXPCInterface_onceToken, &__block_literal_global_94);
  }
  uint64_t v2 = (void *)neighborhoodActivityServerXPCInterface_interface;

  return (NSXPCInterface *)v2;
}

void __80__TUNeighborhoodActivityConduitXPCClient_neighborhoodActivityServerXPCInterface__block_invoke()
{
  id v25 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  id v18 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
  uint64_t v19 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED61AE8];
  id v20 = (void *)neighborhoodActivityServerXPCInterface_interface;
  neighborhoodActivityServerXPCInterface_interface = v19;

  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v10 forSelector:sel_nearbyTVDevicesWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v18 forSelector:sel_nearbyTVDevicesWithCompletion_ argumentIndex:1 ofReply:1];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v18 forSelector:sel_isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion_ argumentIndex:1 ofReply:1];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v10 forSelector:sel_activeSplitSessionTVDeviceWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v18 forSelector:sel_activeSplitSessionTVDeviceWithCompletion_ argumentIndex:1 ofReply:1];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v10 forSelector:sel_suggestionWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v18 forSelector:sel_suggestionWithCompletion_ argumentIndex:1 ofReply:1];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v10 forSelector:sel_setSuggestedTVDeviceName_completion_ argumentIndex:0 ofReply:0];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v10 forSelector:sel_setSuggestedTVDeviceName_completion_ argumentIndex:0 ofReply:1];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v18 forSelector:sel_setSuggestedTVDeviceName_completion_ argumentIndex:1 ofReply:1];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v10 forSelector:sel_inviteTVDevice_toConversation_completion_ argumentIndex:0 ofReply:0];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v25 forSelector:sel_inviteTVDevice_toConversation_completion_ argumentIndex:1 ofReply:0];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v18 forSelector:sel_inviteTVDevice_toConversation_completion_ argumentIndex:1 ofReply:1];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v10 forSelector:sel_disconnectTVDevice_completion_ argumentIndex:0 ofReply:0];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v18 forSelector:sel_disconnectTVDevice_completion_ argumentIndex:1 ofReply:1];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v10 forSelector:sel_respondToSuggestionWithResult_completion_ argumentIndex:0 ofReply:0];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v18 forSelector:sel_respondToSuggestionWithResult_completion_ argumentIndex:1 ofReply:1];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v25 forSelector:sel_handoffConversation_toTVDevice_completion_ argumentIndex:0 ofReply:0];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v10 forSelector:sel_handoffConversation_toTVDevice_completion_ argumentIndex:1 ofReply:0];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v18 forSelector:sel_handoffConversation_toTVDevice_completion_ argumentIndex:1 ofReply:1];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v25 forSelector:sel_pullConversation_fromTVDevice_completion_ argumentIndex:0 ofReply:0];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v10 forSelector:sel_pullConversation_fromTVDevice_completion_ argumentIndex:1 ofReply:0];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v18 forSelector:sel_pullConversation_fromTVDevice_completion_ argumentIndex:1 ofReply:1];
  int64_t v21 = (void *)neighborhoodActivityServerXPCInterface_interface;
  v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  [v21 setClasses:v24 forSelector:sel_startConversationWith_on_completion_ argumentIndex:0 ofReply:0];

  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v10 forSelector:sel_pullConversation_fromTVDevice_completion_ argumentIndex:1 ofReply:0];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v25 forSelector:sel_pullConversation_fromTVDevice_completion_ argumentIndex:0 ofReply:1];
  [(id)neighborhoodActivityServerXPCInterface_interface setClasses:v18 forSelector:sel_pullConversation_fromTVDevice_completion_ argumentIndex:1 ofReply:1];
}

- (TUNeighborhoodActivityConduitXPCClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUNeighborhoodActivityConduitXPCClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setXpcConnection:(id)a3
{
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __46__TUNeighborhoodActivityConduitXPCClient_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_19C496000, log, OS_LOG_TYPE_DEBUG, "TUConduitXPCClient: informing delegate of connection restart", v1, 2u);
}

void __58__TUNeighborhoodActivityConduitXPCClient_ensureConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19C496000, log, (os_log_type_t)0x90u, "TUConduit XPC connection is nil after prompting!", v1, 2u);
}

void __72__TUNeighborhoodActivityConduitXPCClient_nearbyTVDevicesWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_19C496000, v0, v1, "Error fetching nearby TVs: %@", v2, v3, v4, v5, v6);
}

void __83__TUNeighborhoodActivityConduitXPCClient_activeSplitSessionTVDeviceWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_19C496000, v0, v1, "Error fetching active split session TV: %@", v2, v3, v4, v5, v6);
}

void __78__TUNeighborhoodActivityConduitXPCClient_setSuggestedTVDeviceName_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_19C496000, v0, v1, "Error setting suggested TV name: %@", v2, v3, v4, v5, v6);
}

void __67__TUNeighborhoodActivityConduitXPCClient_suggestionWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_19C496000, v0, v1, "Error fetching suggested TV: %@", v2, v3, v4, v5, v6);
}

void __91__TUNeighborhoodActivityConduitXPCClient_inviteTVDevice_toConversationWithUUID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_4_0(&dword_19C496000, v0, v1, "Error inviting TV %@ to conversation %@: %@");
}

void __72__TUNeighborhoodActivityConduitXPCClient_disconnectTVDevice_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3(&dword_19C496000, v0, v1, "Error disconnecting TV %@: %@");
}

void __83__TUNeighborhoodActivityConduitXPCClient_respondToSuggestionWithResult_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3(&dword_19C496000, v0, v1, "Error responding to suggestion with result %@: %@");
}

void __72__TUNeighborhoodActivityConduitXPCClient_registerApprovalClientEnabled___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_19C496000, v0, OS_LOG_TYPE_ERROR, "Error registering as approval handler: %@", v1, 0xCu);
}

void __84__TUNeighborhoodActivityConduitXPCClient_handoffConversation_toTVDevice_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_4_0(&dword_19C496000, v0, v1, "Error handing off conversation %@ to TV %@: %@");
}

void __83__TUNeighborhoodActivityConduitXPCClient_pullConversation_fromTVDevice_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_4_0(&dword_19C496000, v0, v1, "Error pulling conversation %@ from TV %@: %@");
}

void __78__TUNeighborhoodActivityConduitXPCClient_startConversationWith_on_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3(&dword_19C496000, v0, v1, "Error starting conversation on %@: %@");
}

- (void)xpcConnection
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_19C496000, log, OS_LOG_TYPE_DEBUG, "TUNeighborhoodActivityConduitXPCClient connection requested while conduit is disabled (runtime).", v1, 2u);
}

@end