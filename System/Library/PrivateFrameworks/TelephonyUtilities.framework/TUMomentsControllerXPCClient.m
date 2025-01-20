@interface TUMomentsControllerXPCClient
+ (NSXPCInterface)momentsControllerClientXPCInterface;
+ (NSXPCInterface)momentsControllerServerXPCInterface;
+ (TUMomentsControllerXPCServer)asynchronousServer;
+ (TUMomentsControllerXPCServer)synchronousServer;
+ (void)setAsynchronousServer:(id)a3;
+ (void)setSynchronousServer:(id)a3;
- (NSString)processName;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (TUMomentsControllerDataSourceDelegate)delegate;
- (TUMomentsControllerXPCClient)init;
- (id)processBundleIdentifier;
- (id)serverWithErrorHandler:(id)a3;
- (id)synchronousServerWithErrorHandler:(id)a3;
- (int)processIdentifier;
- (int)token;
- (void)_registerConnection;
- (void)dealloc;
- (void)didFinishProcessingRawVideoMessage:(id)a3;
- (void)didFinishRecordingMedia:(id)a3;
- (void)didReceiveLocallyRequestedMomentDescriptor:(id)a3;
- (void)didReceiveMediaRecordingError:(id)a3;
- (void)didReceiveMessageRecordingError:(id)a3;
- (void)didUpdateCapabilities:(id)a3 forVideoStreamToken:(int64_t)a4;
- (void)discardVideoMessageWithUUID:(id)a3 completion:(id)a4;
- (void)endMediaRequestWithUUID:(id)a3 completion:(id)a4;
- (void)endRecordingMessageWithUUID:(id)a3 completion:(id)a4;
- (void)endRequestWithTransactionID:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)prewarmAudioClientWithCompletion:(id)a3;
- (void)prewarmMediaRequest:(id)a3 completion:(id)a4;
- (void)registerStreamToken:(int64_t)a3 requesterID:(id)a4 remoteIDSDestinations:(id)a5 remoteMomentsAvailable:(BOOL)a6 completion:(id)a7;
- (void)requestSandboxExtensionForURL:(id)a3 reply:(id)a4;
- (void)resetVideoMessagingWithSessionUUID:(id)a3 completion:(id)a4;
- (void)saveVideoMessageWithUUID:(id)a3 completion:(id)a4;
- (void)sendVideoMessageWithRequest:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)startMediaRequest:(id)a3 completion:(id)a4;
- (void)startRecordingMessageWithMediaType:(int)a3 completion:(id)a4;
- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 destinationID:(id)a6 completion:(id)a7;
- (void)unregisterStreamToken:(int64_t)a3 completion:(id)a4;
- (void)willCaptureRemoteRequestFromRequesterID:(id)a3;
@end

@implementation TUMomentsControllerXPCClient

+ (TUMomentsControllerXPCServer)asynchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_7);

  return (TUMomentsControllerXPCServer *)WeakRetained;
}

+ (void)setAsynchronousServer:(id)a3
{
}

+ (TUMomentsControllerXPCServer)synchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_7);

  return (TUMomentsControllerXPCServer *)WeakRetained;
}

+ (void)setSynchronousServer:(id)a3
{
}

- (int)processIdentifier
{
  v2 = [(TUMomentsControllerXPCClient *)self xpcConnection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (id)processBundleIdentifier
{
  v2 = [(TUMomentsControllerXPCClient *)self xpcConnection];
  int v3 = [v2 processBundleIdentifier];

  return v3;
}

- (NSString)processName
{
  v2 = [(TUMomentsControllerXPCClient *)self xpcConnection];
  int v3 = [v2 serviceName];

  return (NSString *)v3;
}

- (TUMomentsControllerXPCClient)init
{
  v15.receiver = self;
  v15.super_class = (Class)TUMomentsControllerXPCClient;
  v2 = [(TUMomentsControllerXPCClient *)&v15 init];
  if (v2)
  {
    int v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.telephonyutilities.momentscontrollerxpcclient", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_initWeak(&location, v2);
    v6 = v2->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __36__TUMomentsControllerXPCClient_init__block_invoke;
    handler[3] = &unk_1E58E5F18;
    objc_copyWeak(&v13, &location);
    notify_register_dispatch("com.apple.telephonyutilities.callservicesdaemon.connectionrequest", &v2->_token, v6, handler);
    id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_7);
    [WeakRetained registerClient:v2];

    v8 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__TUMomentsControllerXPCClient_init__block_invoke_3;
    block[3] = &unk_1E58E5BE0;
    v11 = v2;
    dispatch_async(v8, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __36__TUMomentsControllerXPCClient_init__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = TUDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      dispatch_queue_t v4 = "com.apple.telephonyutilities.callservicesdaemon.connectionrequest";
      _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection", (uint8_t *)&v3, 0xCu);
    }

    [WeakRetained _registerConnection];
  }
}

uint64_t __36__TUMomentsControllerXPCClient_init__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerConnection];
}

- (void)dealloc
{
  notify_cancel(self->_token);
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUMomentsControllerXPCClient;
  [(TUMomentsControllerXPCClient *)&v3 dealloc];
}

- (void)registerStreamToken:(int64_t)a3 requesterID:(id)a4 remoteIDSDestinations:(id)a5 remoteMomentsAvailable:(BOOL)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  objc_super v15 = [(TUMomentsControllerXPCClient *)self queue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __120__TUMomentsControllerXPCClient_registerStreamToken_requesterID_remoteIDSDestinations_remoteMomentsAvailable_completion___block_invoke;
  v19[3] = &unk_1E58E86E8;
  id v22 = v14;
  int64_t v23 = a3;
  v19[4] = self;
  id v20 = v12;
  id v21 = v13;
  BOOL v24 = a6;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  dispatch_async(v15, v19);
}

void __120__TUMomentsControllerXPCClient_registerStreamToken_requesterID_remoteIDSDestinations_remoteMomentsAvailable_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __120__TUMomentsControllerXPCClient_registerStreamToken_requesterID_remoteIDSDestinations_remoteMomentsAvailable_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  id v5 = *(id *)(a1 + 56);
  objc_super v3 = [v2 serverWithErrorHandler:v4];
  [v3 registerStreamToken:*(void *)(a1 + 64) requesterID:*(void *)(a1 + 40) remoteIDSDestinations:*(void *)(a1 + 48) remoteMomentsAvailable:*(unsigned __int8 *)(a1 + 72) reply:*(void *)(a1 + 56)];
}

void __120__TUMomentsControllerXPCClient_registerStreamToken_requesterID_remoteIDSDestinations_remoteMomentsAvailable_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __120__TUMomentsControllerXPCClient_registerStreamToken_requesterID_remoteIDSDestinations_remoteMomentsAvailable_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterStreamToken:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(TUMomentsControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__TUMomentsControllerXPCClient_unregisterStreamToken_completion___block_invoke;
  block[3] = &unk_1E58E7960;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __65__TUMomentsControllerXPCClient_unregisterStreamToken_completion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__TUMomentsControllerXPCClient_unregisterStreamToken_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 unregisterStreamToken:*(void *)(a1 + 48) reply:*(void *)(a1 + 40)];
}

void __65__TUMomentsControllerXPCClient_unregisterStreamToken_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__TUMomentsControllerXPCClient_unregisterStreamToken_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startRequestWithMediaType:(int)a3 forStreamToken:(int64_t)a4 requesteeID:(id)a5 destinationID:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  objc_super v15 = [(TUMomentsControllerXPCClient *)self queue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __110__TUMomentsControllerXPCClient_startRequestWithMediaType_forStreamToken_requesteeID_destinationID_completion___block_invoke;
  v19[3] = &unk_1E58E8710;
  int v24 = a3;
  id v22 = v14;
  int64_t v23 = a4;
  v19[4] = self;
  id v20 = v12;
  id v21 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  dispatch_async(v15, v19);
}

void __110__TUMomentsControllerXPCClient_startRequestWithMediaType_forStreamToken_requesteeID_destinationID_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __110__TUMomentsControllerXPCClient_startRequestWithMediaType_forStreamToken_requesteeID_destinationID_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  id v5 = *(id *)(a1 + 56);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 startRequestWithMediaType:*(unsigned int *)(a1 + 72) forStreamToken:*(void *)(a1 + 64) requesteeID:*(void *)(a1 + 40) destinationID:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
}

void __110__TUMomentsControllerXPCClient_startRequestWithMediaType_forStreamToken_requesteeID_destinationID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __110__TUMomentsControllerXPCClient_startRequestWithMediaType_forStreamToken_requesteeID_destinationID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endRequestWithTransactionID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUMomentsControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__TUMomentsControllerXPCClient_endRequestWithTransactionID_completion___block_invoke;
  block[3] = &unk_1E58E7140;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __71__TUMomentsControllerXPCClient_endRequestWithTransactionID_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__TUMomentsControllerXPCClient_endRequestWithTransactionID_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 endRequestWithTransactionID:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __71__TUMomentsControllerXPCClient_endRequestWithTransactionID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__TUMomentsControllerXPCClient_endRequestWithTransactionID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  id v3 = [(TUMomentsControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__TUMomentsControllerXPCClient_invalidate__block_invoke;
  block[3] = &unk_1E58E5BE0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __42__TUMomentsControllerXPCClient_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_7);
  [WeakRetained unregisterClient:*(void *)(a1 + 32)];
}

- (void)prewarmAudioClientWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(TUMomentsControllerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__TUMomentsControllerXPCClient_prewarmAudioClientWithCompletion___block_invoke;
  v7[3] = &unk_1E58E60D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__TUMomentsControllerXPCClient_prewarmAudioClientWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__TUMomentsControllerXPCClient_prewarmAudioClientWithCompletion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 prewarmAudioClientWithCompletion:*(void *)(a1 + 40)];
}

void __65__TUMomentsControllerXPCClient_prewarmAudioClientWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__TUMomentsControllerXPCClient_prewarmAudioClientWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startRecordingMessageWithMediaType:(int)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(TUMomentsControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__TUMomentsControllerXPCClient_startRecordingMessageWithMediaType_completion___block_invoke;
  block[3] = &unk_1E58E6088;
  void block[4] = self;
  id v10 = v6;
  int v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __78__TUMomentsControllerXPCClient_startRecordingMessageWithMediaType_completion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__TUMomentsControllerXPCClient_startRecordingMessageWithMediaType_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 startRecordingMessageWithMediaType:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

void __78__TUMomentsControllerXPCClient_startRecordingMessageWithMediaType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__TUMomentsControllerXPCClient_startRecordingMessageWithMediaType_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endRecordingMessageWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUMomentsControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__TUMomentsControllerXPCClient_endRecordingMessageWithUUID_completion___block_invoke;
  block[3] = &unk_1E58E7140;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __71__TUMomentsControllerXPCClient_endRecordingMessageWithUUID_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__TUMomentsControllerXPCClient_endRecordingMessageWithUUID_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 endRecordingMessageWithUUID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __71__TUMomentsControllerXPCClient_endRecordingMessageWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__TUMomentsControllerXPCClient_endRecordingMessageWithUUID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)discardVideoMessageWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUMomentsControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__TUMomentsControllerXPCClient_discardVideoMessageWithUUID_completion___block_invoke;
  block[3] = &unk_1E58E7140;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __71__TUMomentsControllerXPCClient_discardVideoMessageWithUUID_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__TUMomentsControllerXPCClient_discardVideoMessageWithUUID_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 discardVideoMessageWithUUID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __71__TUMomentsControllerXPCClient_discardVideoMessageWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__TUMomentsControllerXPCClient_discardVideoMessageWithUUID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendVideoMessageWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUMomentsControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__TUMomentsControllerXPCClient_sendVideoMessageWithRequest_completion___block_invoke;
  block[3] = &unk_1E58E7140;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __71__TUMomentsControllerXPCClient_sendVideoMessageWithRequest_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__TUMomentsControllerXPCClient_sendVideoMessageWithRequest_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 sendVideoMessageWithRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __71__TUMomentsControllerXPCClient_sendVideoMessageWithRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__TUMomentsControllerXPCClient_sendVideoMessageWithRequest_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveVideoMessageWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUMomentsControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__TUMomentsControllerXPCClient_saveVideoMessageWithUUID_completion___block_invoke;
  block[3] = &unk_1E58E7140;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __68__TUMomentsControllerXPCClient_saveVideoMessageWithUUID_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__TUMomentsControllerXPCClient_saveVideoMessageWithUUID_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 saveVideoMessageWithUUID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __68__TUMomentsControllerXPCClient_saveVideoMessageWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__TUMomentsControllerXPCClient_saveVideoMessageWithUUID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetVideoMessagingWithSessionUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUMomentsControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__TUMomentsControllerXPCClient_resetVideoMessagingWithSessionUUID_completion___block_invoke;
  block[3] = &unk_1E58E7140;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __78__TUMomentsControllerXPCClient_resetVideoMessagingWithSessionUUID_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__TUMomentsControllerXPCClient_resetVideoMessagingWithSessionUUID_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 resetVideoMessagingWithSessionUUID:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

void __78__TUMomentsControllerXPCClient_resetVideoMessagingWithSessionUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__TUMomentsControllerXPCClient_resetVideoMessagingWithSessionUUID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prewarmMediaRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUMomentsControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__TUMomentsControllerXPCClient_prewarmMediaRequest_completion___block_invoke;
  block[3] = &unk_1E58E7140;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __63__TUMomentsControllerXPCClient_prewarmMediaRequest_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__TUMomentsControllerXPCClient_prewarmMediaRequest_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 prewarmMediaRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __63__TUMomentsControllerXPCClient_prewarmMediaRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__TUMomentsControllerXPCClient_prewarmMediaRequest_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startMediaRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUMomentsControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__TUMomentsControllerXPCClient_startMediaRequest_completion___block_invoke;
  block[3] = &unk_1E58E7140;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __61__TUMomentsControllerXPCClient_startMediaRequest_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__TUMomentsControllerXPCClient_startMediaRequest_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 startMediaRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __61__TUMomentsControllerXPCClient_startMediaRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__TUMomentsControllerXPCClient_startMediaRequest_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endMediaRequestWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUMomentsControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__TUMomentsControllerXPCClient_endMediaRequestWithUUID_completion___block_invoke;
  block[3] = &unk_1E58E7140;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __67__TUMomentsControllerXPCClient_endMediaRequestWithUUID_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__TUMomentsControllerXPCClient_endMediaRequestWithUUID_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 serverWithErrorHandler:v4];
  [v3 endMediaRequestWithUUID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __67__TUMomentsControllerXPCClient_endMediaRequestWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__TUMomentsControllerXPCClient_resetVideoMessagingWithSessionUUID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_registerConnection
{
  id v3 = [(TUMomentsControllerXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(TUMomentsControllerXPCClient *)self serverWithErrorHandler:&__block_literal_global_56];
  [v4 registerXPCClientWithReply:&__block_literal_global_10_2];
}

void __51__TUMomentsControllerXPCClient__registerConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __51__TUMomentsControllerXPCClient__registerConnection__block_invoke_cold_1();
  }
}

void __51__TUMomentsControllerXPCClient__registerConnection__block_invoke_8()
{
  v0 = TUDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19C496000, v0, OS_LOG_TYPE_DEFAULT, "Registered moments connection", v1, 2u);
  }
}

- (NSXPCConnection)xpcConnection
{
  id v3 = [(TUMomentsControllerXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    id v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.FTLivePhotoService"];
    id v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    id v7 = +[TUMomentsControllerXPCClient momentsControllerServerXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v7];

    id v8 = +[TUMomentsControllerXPCClient momentsControllerClientXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v8];

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke;
    v12[3] = &unk_1E58E5C50;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke_12;
    v10[3] = &unk_1E58E5C50;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v10];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }

  return xpcConnection;
}

void __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

void __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Moments XPC connection invalidated (client side)", v6, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = 0;

  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 serverDiedForDataSource:*(void *)(a1 + 32)];
}

void __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke_2_13;
    block[3] = &unk_1E58E5BE0;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

void __45__TUMomentsControllerXPCClient_xpcConnection__block_invoke_2_13(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Moments XPC connection interrupted (client side)", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  [v3 serverDiedForDataSource:*(void *)(a1 + 32)];
}

- (id)serverWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TUMomentsControllerXPCClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_7);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
  }
  else
  {
    id v9 = [(TUMomentsControllerXPCClient *)self xpcConnection];
    id v8 = [v9 remoteObjectProxyWithErrorHandler:v4];
  }

  return v8;
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TUMomentsControllerXPCClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_7);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
  }
  else
  {
    id v9 = [(TUMomentsControllerXPCClient *)self xpcConnection];
    id v8 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }

  return v8;
}

- (void)didUpdateCapabilities:(id)a3 forVideoStreamToken:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TUMomentsControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__TUMomentsControllerXPCClient_didUpdateCapabilities_forVideoStreamToken___block_invoke;
  block[3] = &unk_1E58E68F0;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __74__TUMomentsControllerXPCClient_didUpdateCapabilities_forVideoStreamToken___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataSource:*(void *)(a1 + 32) didUpdateCapabilities:*(void *)(a1 + 40) forVideoStreamToken:*(void *)(a1 + 48)];
}

- (void)willCaptureRemoteRequestFromRequesterID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUMomentsControllerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__TUMomentsControllerXPCClient_willCaptureRemoteRequestFromRequesterID___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __72__TUMomentsControllerXPCClient_willCaptureRemoteRequestFromRequesterID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataSource:*(void *)(a1 + 32) willCaptureRemoteRequestFromRequesterID:*(void *)(a1 + 40)];
}

- (void)didReceiveLocallyRequestedMomentDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(TUMomentsControllerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__TUMomentsControllerXPCClient_didReceiveLocallyRequestedMomentDescriptor___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __75__TUMomentsControllerXPCClient_didReceiveLocallyRequestedMomentDescriptor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataSource:*(void *)(a1 + 32) didReceiveLocallyRequestedMomentDescriptor:*(void *)(a1 + 40)];
}

- (void)requestSandboxExtensionForURL:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUMomentsControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__TUMomentsControllerXPCClient_requestSandboxExtensionForURL_reply___block_invoke;
  block[3] = &unk_1E58E75D0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__TUMomentsControllerXPCClient_requestSandboxExtensionForURL_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataSource:*(void *)(a1 + 32) requestSandboxExtensionForURL:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)didFinishProcessingRawVideoMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(TUMomentsControllerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__TUMomentsControllerXPCClient_didFinishProcessingRawVideoMessage___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__TUMomentsControllerXPCClient_didFinishProcessingRawVideoMessage___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataSource:*(void *)(a1 + 32) didFinishProcessingRawVideoMessage:*(void *)(a1 + 40)];
}

- (void)didFinishRecordingMedia:(id)a3
{
  id v4 = a3;
  id v5 = [(TUMomentsControllerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__TUMomentsControllerXPCClient_didFinishRecordingMedia___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__TUMomentsControllerXPCClient_didFinishRecordingMedia___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataSource:*(void *)(a1 + 32) didFinishRecordingMedia:*(void *)(a1 + 40)];
}

- (void)didReceiveMessageRecordingError:(id)a3
{
  id v4 = a3;
  id v5 = [(TUMomentsControllerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__TUMomentsControllerXPCClient_didReceiveMessageRecordingError___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__TUMomentsControllerXPCClient_didReceiveMessageRecordingError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataSource:*(void *)(a1 + 32) didReceiveMessageRecordingError:*(void *)(a1 + 40)];
}

- (void)didReceiveMediaRecordingError:(id)a3
{
  id v4 = a3;
  id v5 = [(TUMomentsControllerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__TUMomentsControllerXPCClient_didReceiveMediaRecordingError___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__TUMomentsControllerXPCClient_didReceiveMediaRecordingError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataSource:*(void *)(a1 + 32) didReceiveMediaRecordingError:*(void *)(a1 + 40)];
}

+ (NSXPCInterface)momentsControllerClientXPCInterface
{
  if (momentsControllerClientXPCInterface_onceToken != -1) {
    dispatch_once(&momentsControllerClientXPCInterface_onceToken, &__block_literal_global_15_0);
  }
  id v2 = (void *)momentsControllerClientXPCInterface_momentsControllerClientXPCInterface;

  return (NSXPCInterface *)v2;
}

uint64_t __67__TUMomentsControllerXPCClient_momentsControllerClientXPCInterface__block_invoke()
{
  momentsControllerClientXPCInterface_momentsControllerClientXPCInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED4D948];

  return MEMORY[0x1F41817F8]();
}

+ (NSXPCInterface)momentsControllerServerXPCInterface
{
  if (momentsControllerServerXPCInterface_onceToken != -1) {
    dispatch_once(&momentsControllerServerXPCInterface_onceToken, &__block_literal_global_77_0);
  }
  id v2 = (void *)momentsControllerServerXPCInterface_momentsControllerServerXPCInterface;

  return (NSXPCInterface *)v2;
}

void __67__TUMomentsControllerXPCClient_momentsControllerServerXPCInterface__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED61C68];
  v1 = (void *)momentsControllerServerXPCInterface_momentsControllerServerXPCInterface;
  momentsControllerServerXPCInterface_momentsControllerServerXPCInterface = v0;

  id v2 = (void *)momentsControllerServerXPCInterface_momentsControllerServerXPCInterface;
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:3];
  id v5 = objc_msgSend(v3, "setWithArray:", v4, v6, v7);
  [v2 setClasses:v5 forSelector:sel_sendVideoMessageWithRequest_completion_ argumentIndex:0 ofReply:0];
}

- (TUMomentsControllerDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUMomentsControllerDataSourceDelegate *)WeakRetained;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __120__TUMomentsControllerXPCClient_registerStreamToken_requesterID_remoteIDSDestinations_remoteMomentsAvailable_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error registering stream token: %@", v2, v3, v4, v5, v6);
}

void __65__TUMomentsControllerXPCClient_unregisterStreamToken_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error unregistering stream token: %@", v2, v3, v4, v5, v6);
}

void __110__TUMomentsControllerXPCClient_startRequestWithMediaType_forStreamToken_requesteeID_destinationID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error starting request: %@", v2, v3, v4, v5, v6);
}

void __71__TUMomentsControllerXPCClient_endRequestWithTransactionID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error ending request: %@", v2, v3, v4, v5, v6);
}

void __65__TUMomentsControllerXPCClient_prewarmAudioClientWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error prewarming audio client: %@", v2, v3, v4, v5, v6);
}

void __78__TUMomentsControllerXPCClient_startRecordingMessageWithMediaType_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error starting recording video message: %@", v2, v3, v4, v5, v6);
}

void __71__TUMomentsControllerXPCClient_endRecordingMessageWithUUID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error ending recording video message: %@", v2, v3, v4, v5, v6);
}

void __71__TUMomentsControllerXPCClient_discardVideoMessageWithUUID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error discarding video message: %@", v2, v3, v4, v5, v6);
}

void __71__TUMomentsControllerXPCClient_sendVideoMessageWithRequest_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error sending video message: %@", v2, v3, v4, v5, v6);
}

void __68__TUMomentsControllerXPCClient_saveVideoMessageWithUUID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error saving video message: %@", v2, v3, v4, v5, v6);
}

void __78__TUMomentsControllerXPCClient_resetVideoMessagingWithSessionUUID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error resetting video messaging: %@", v2, v3, v4, v5, v6);
}

void __63__TUMomentsControllerXPCClient_prewarmMediaRequest_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error prewarming media request: %@", v2, v3, v4, v5, v6);
}

void __61__TUMomentsControllerXPCClient_startMediaRequest_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error Starting media request: %@", v2, v3, v4, v5, v6);
}

void __51__TUMomentsControllerXPCClient__registerConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error registering moments connection: %@", v2, v3, v4, v5, v6);
}

@end