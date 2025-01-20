@interface SSRVTUITrainingServiceClient
- (BOOL)requireResetup;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (SSRVTUITrainingServiceClient)initWithDelegate:(id)a3;
- (SSRVTUITrainingServiceDelegate)delegate;
- (id)_connection;
- (id)_newConnection;
- (id)_service;
- (id)cleanupCompletion;
- (id)prepareCompletion;
- (id)remoteObjectProxy;
- (id)trainCompletion;
- (id)trainCompletionWithResult;
- (void)CSVTUIRemoteTrainingSessionRMSAvailable:(float)a3;
- (void)_handleXPCDisconnectedUnexpectedlyWithError:(id)a3;
- (void)_resetupIfNeeded;
- (void)audioSourceWithCompletion:(id)a3;
- (void)cancelTrainingViaXPCForID:(int64_t)a3;
- (void)cleanupViaXPCWithCompletion:(id)a3;
- (void)didDetectForceEndPoint;
- (void)getAudioSessionID:(id)a3;
- (void)invalidate;
- (void)playSoundEffectWithAudioTone:(int)a3;
- (void)prepareWithCompletion:(id)a3;
- (void)reset;
- (void)setCleanupCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setPrepareCompletion:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)setRequireResetup:(BOOL)a3;
- (void)setTrainCompletion:(id)a3;
- (void)setTrainCompletionWithResult:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setupWithLocaleID:(id)a3 appDomain:(id)a4 siriSharedUserId:(id)a5;
- (void)startRMS;
- (void)stopRMS;
- (void)trainUtteranceViaXPC:(int64_t)a3 shouldUseASR:(BOOL)a4 completion:(id)a5;
- (void)trainUtteranceViaXPC:(int64_t)a3 shouldUseASR:(BOOL)a4 mhUUID:(id)a5 completionWithResult:(id)a6;
- (void)voiceProfileWithCompletion:(id)a3;
@end

@implementation SSRVTUITrainingServiceClient

- (void).cxx_destruct
{
  objc_storeStrong(&self->_trainCompletionWithResult, 0);
  objc_storeStrong(&self->_trainCompletion, 0);
  objc_storeStrong(&self->_cleanupCompletion, 0);
  objc_storeStrong(&self->_prepareCompletion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_siriSharedUserId, 0);
  objc_storeStrong((id *)&self->_appDomain, 0);

  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

- (void)setRequireResetup:(BOOL)a3
{
  self->_requireResetup = a3;
}

- (BOOL)requireResetup
{
  return self->_requireResetup;
}

- (void)setTrainCompletionWithResult:(id)a3
{
}

- (id)trainCompletionWithResult
{
  return self->_trainCompletionWithResult;
}

- (void)setTrainCompletion:(id)a3
{
}

- (id)trainCompletion
{
  return self->_trainCompletion;
}

- (void)setCleanupCompletion:(id)a3
{
}

- (id)cleanupCompletion
{
  return self->_cleanupCompletion;
}

- (void)setPrepareCompletion:(id)a3
{
}

- (id)prepareCompletion
{
  return self->_prepareCompletion;
}

- (void)setDelegate:(id)a3
{
}

- (SSRVTUITrainingServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSRVTUITrainingServiceDelegate *)WeakRetained;
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (id)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_handleXPCDisconnectedUnexpectedlyWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[SSRVTUITrainingServiceClient _handleXPCDisconnectedUnexpectedlyWithError:]";
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  prepareCompletion = (void (**)(id, void))self->_prepareCompletion;
  if (prepareCompletion)
  {
    prepareCompletion[2](prepareCompletion, 0);
    id v7 = self->_prepareCompletion;
    self->_prepareCompletion = 0;
  }
  cleanupCompletion = (void (**)(void))self->_cleanupCompletion;
  if (cleanupCompletion)
  {
    cleanupCompletion[2]();
    id v9 = self->_cleanupCompletion;
    self->_cleanupCompletion = 0;
  }
  id trainCompletion = self->_trainCompletion;
  if (trainCompletion)
  {
    id v18 = v4;
    (*((void (**)(id, void, uint64_t, void, id *))trainCompletion + 2))(trainCompletion, 0, 5, 0, &v18);
    id v11 = v18;

    id v12 = self->_trainCompletion;
    self->_id trainCompletion = 0;

    id v4 = v11;
  }
  if (self->_trainCompletionWithResult)
  {
    v13 = [[CSVTUITrainingResult alloc] initWithSessionId:0 sessionStatus:5 audioStatus:2];
    trainCompletionWithResult = (void (**)(void))self->_trainCompletionWithResult;
    id v17 = v4;
    trainCompletionWithResult[2]();
    id v15 = v17;

    id v16 = self->_trainCompletionWithResult;
    self->_trainCompletionWithResult = 0;

    id v4 = v15;
  }
  self->_requireResetup = 1;
}

- (id)_service
{
  v2 = [(SSRVTUITrainingServiceClient *)self _connection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)_connection
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    id v4 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "-[SSRVTUITrainingServiceClient _connection]";
      _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Creating new xpc connection...", buf, 0xCu);
    }
    v5 = [(SSRVTUITrainingServiceClient *)self _newConnection];
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    objc_initWeak((id *)buf, self);
    id v7 = self->_xpcConnection;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __43__SSRVTUITrainingServiceClient__connection__block_invoke;
    v15[3] = &unk_264429BD0;
    objc_copyWeak(&v16, (id *)buf);
    [(NSXPCConnection *)v7 setInterruptionHandler:v15];
    v8 = self->_xpcConnection;
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __43__SSRVTUITrainingServiceClient__connection__block_invoke_10;
    v13 = &unk_264429BD0;
    objc_copyWeak(&v14, (id *)buf);
    [(NSXPCConnection *)v8 setInvalidationHandler:&v10];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
    xpcConnection = self->_xpcConnection;
  }

  return xpcConnection;
}

void __43__SSRVTUITrainingServiceClient__connection__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[SSRVTUITrainingServiceClient _connection]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = @"com.apple.siri.ssrvtuitrainingservice.xpc";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Interrupted", (uint8_t *)&v7, 0x16u);
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[6] setInvalidationHandler:0];
    [v4[6] invalidate];
    id v5 = v4[6];
    v4[6] = 0;

    v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1151 userInfo:0];
    [v4 _handleXPCDisconnectedUnexpectedlyWithError:v6];
  }
}

void __43__SSRVTUITrainingServiceClient__connection__block_invoke_10(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[SSRVTUITrainingServiceClient _connection]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = @"com.apple.siri.ssrvtuitrainingservice.xpc";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Invalidated", (uint8_t *)&v7, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 6);
    *((void *)WeakRetained + 6) = 0;

    v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1152 userInfo:0];
    [v4 _handleXPCDisconnectedUnexpectedlyWithError:v6];
  }
}

- (id)_newConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.siri.ssrvtuitrainingservice.xpc" options:0];
  id v4 = SSRVTUITrainingServiceGetXPCInterface();
  [v3 setRemoteObjectInterface:v4];

  id v5 = (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD48FD8];
  [v3 setExportedInterface:v5];

  [v3 setExportedObject:self];
  [v3 _setQueue:self->_queue];
  return v3;
}

- (void)CSVTUIRemoteTrainingSessionRMSAvailable:(float)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    *(float *)&double v8 = a3;
    [v9 CSVTUIRemoteTrainingSessionRMSAvailable:v8];
  }
}

- (void)getAudioSessionID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__SSRVTUITrainingServiceClient_getAudioSessionID___block_invoke;
  v7[3] = &unk_26442A298;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __50__SSRVTUITrainingServiceClient_getAudioSessionID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 getAudioSessionID:*(void *)(a1 + 40)];
}

- (void)_resetupIfNeeded
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_requireResetup)
  {
    self->_requireResetup = 0;
    v3 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[SSRVTUITrainingServiceClient _resetupIfNeeded]";
      _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Re-setup training service due to xpc rebuilt", (uint8_t *)&v5, 0xCu);
    }
    id v4 = [(SSRVTUITrainingServiceClient *)self _service];
    [v4 setupWithLocaleID:self->_localeIdentifier appDomain:self->_appDomain siriSharedUserId:self->_siriSharedUserId];
  }
}

- (void)audioSourceWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 6;
  int v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SSRVTUITrainingServiceClient_audioSourceWithCompletion___block_invoke;
  block[3] = &unk_26442A4D8;
  block[4] = self;
  uint64_t v11 = &v12;
  uint64_t v7 = v5;
  uint64_t v10 = v7;
  dispatch_async_and_wait(queue, block);
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v7, v8);
  if (v4) {
    v4[2](v4, v13[3]);
  }

  _Block_object_dispose(&v12, 8);
}

void __58__SSRVTUITrainingServiceClient_audioSourceWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetupIfNeeded];
  id v2 = [*(id *)(a1 + 32) _service];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__SSRVTUITrainingServiceClient_audioSourceWithCompletion___block_invoke_2;
  v5[3] = &unk_264428DE8;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 audioSourceWithCompletion:v5];
}

void __58__SSRVTUITrainingServiceClient_audioSourceWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)voiceProfileWithCompletion:(id)a3
{
  long long v4 = (void (**)(id, void))a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1003;
  id v16 = __Block_byref_object_dispose__1004;
  id v17 = 0;
  int v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SSRVTUITrainingServiceClient_voiceProfileWithCompletion___block_invoke;
  block[3] = &unk_26442A4D8;
  block[4] = self;
  uint64_t v11 = &v12;
  uint64_t v7 = v5;
  uint64_t v10 = v7;
  dispatch_async(queue, block);
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v7, v8);
  if (v4) {
    v4[2](v4, v13[5]);
  }

  _Block_object_dispose(&v12, 8);
}

void __59__SSRVTUITrainingServiceClient_voiceProfileWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetupIfNeeded];
  id v2 = [*(id *)(a1 + 32) _service];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__SSRVTUITrainingServiceClient_voiceProfileWithCompletion___block_invoke_2;
  v5[3] = &unk_264428DC0;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 voiceProfileWithCompletion:v5];
}

void __59__SSRVTUITrainingServiceClient_voiceProfileWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)cancelTrainingViaXPCForID:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__SSRVTUITrainingServiceClient_cancelTrainingViaXPCForID___block_invoke;
  v4[3] = &unk_2644290B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __58__SSRVTUITrainingServiceClient_cancelTrainingViaXPCForID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetupIfNeeded];
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 cancelTrainingViaXPCForID:*(void *)(a1 + 40)];
}

- (void)playSoundEffectWithAudioTone:(int)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__SSRVTUITrainingServiceClient_playSoundEffectWithAudioTone___block_invoke;
  v4[3] = &unk_26442A0D8;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(queue, v4);
}

void __61__SSRVTUITrainingServiceClient_playSoundEffectWithAudioTone___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetupIfNeeded];
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 playSoundEffectWithAudioTone:*(unsigned int *)(a1 + 40)];
}

- (void)trainUtteranceViaXPC:(int64_t)a3 shouldUseASR:(BOOL)a4 mhUUID:(id)a5 completionWithResult:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_mhUUID_completionWithResult___block_invoke;
  block[3] = &unk_264429060;
  id v17 = v11;
  int64_t v18 = a3;
  BOOL v19 = a4;
  block[4] = self;
  id v16 = v10;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(queue, block);
}

void __94__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_mhUUID_completionWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x21D4B2740](*(void *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  [*(id *)(a1 + 32) _resetupIfNeeded];
  int v5 = [*(id *)(a1 + 32) _service];
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 64);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __94__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_mhUUID_completionWithResult___block_invoke_2;
  v9[3] = &unk_264428D98;
  uint64_t v8 = *(void *)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  [v5 trainUtteranceViaXPC:v6 shouldUseASR:v7 mhUUID:v8 completionWithResult:v9];
}

void __94__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_mhUUID_completionWithResult___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 96);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = 0;
  }
}

- (void)trainUtteranceViaXPC:(int64_t)a3 shouldUseASR:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_completion___block_invoke;
  v11[3] = &unk_264429038;
  v11[4] = self;
  id v12 = v8;
  int64_t v13 = a3;
  BOOL v14 = a4;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __77__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x21D4B2740](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 88);
  *(void *)(v3 + 88) = v2;

  [*(id *)(a1 + 32) _resetupIfNeeded];
  int v5 = [*(id *)(a1 + 32) _service];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_completion___block_invoke_2;
  v8[3] = &unk_264428D70;
  v8[4] = *(void *)(a1 + 32);
  [v5 trainUtteranceViaXPC:v6 shouldUseASR:v7 completion:v8];
}

void __77__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 88);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 88);
    *(void *)(v3 + 88) = 0;
  }
}

- (void)cleanupViaXPCWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[SSRVTUITrainingServiceClient cleanupViaXPCWithCompletion:]";
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Cleaning up training service client", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__SSRVTUITrainingServiceClient_cleanupViaXPCWithCompletion___block_invoke;
  v8[3] = &unk_26442A298;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __60__SSRVTUITrainingServiceClient_cleanupViaXPCWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x21D4B2740](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  [*(id *)(a1 + 32) _resetupIfNeeded];
  int v5 = [*(id *)(a1 + 32) _service];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__SSRVTUITrainingServiceClient_cleanupViaXPCWithCompletion___block_invoke_2;
  v6[3] = &unk_26442A618;
  v6[4] = *(void *)(a1 + 32);
  [v5 cleanupViaXPCWithCompletion:v6];
}

void __60__SSRVTUITrainingServiceClient_cleanupViaXPCWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 80);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 80);
    *(void *)(v3 + 80) = 0;
  }
}

- (void)prepareWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SSRVTUITrainingServiceClient_prepareWithCompletion___block_invoke;
  v7[3] = &unk_26442A298;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __54__SSRVTUITrainingServiceClient_prepareWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x21D4B2740](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  [*(id *)(a1 + 32) _resetupIfNeeded];
  int v5 = [*(id *)(a1 + 32) _service];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__SSRVTUITrainingServiceClient_prepareWithCompletion___block_invoke_2;
  v6[3] = &unk_264428D48;
  v6[4] = *(void *)(a1 + 32);
  [v5 prepareWithCompletion:v6];
}

void __54__SSRVTUITrainingServiceClient_prepareWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = 0;
  }
}

- (void)didDetectForceEndPoint
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SSRVTUITrainingServiceClient_didDetectForceEndPoint__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__SSRVTUITrainingServiceClient_didDetectForceEndPoint__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetupIfNeeded];
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 didDetectForceEndPoint];
}

- (void)setLocaleIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__SSRVTUITrainingServiceClient_setLocaleIdentifier___block_invoke;
  v7[3] = &unk_26442A138;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __52__SSRVTUITrainingServiceClient_setLocaleIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetupIfNeeded];
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 setLocaleIdentifier:*(void *)(a1 + 40)];
}

- (void)stopRMS
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SSRVTUITrainingServiceClient_stopRMS__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

void __39__SSRVTUITrainingServiceClient_stopRMS__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetupIfNeeded];
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 stopRMS];
}

- (void)startRMS
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SSRVTUITrainingServiceClient_startRMS__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

void __40__SSRVTUITrainingServiceClient_startRMS__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetupIfNeeded];
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 startRMS];
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SSRVTUITrainingServiceClient_reset__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__SSRVTUITrainingServiceClient_reset__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetupIfNeeded];
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 reset];
}

- (void)setupWithLocaleID:(id)a3 appDomain:(id)a4 siriSharedUserId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__SSRVTUITrainingServiceClient_setupWithLocaleID_appDomain_siriSharedUserId___block_invoke;
  v15[3] = &unk_264428D20;
  id v16 = v8;
  id v17 = v9;
  int64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __77__SSRVTUITrainingServiceClient_setupWithLocaleID_appDomain_siriSharedUserId___block_invoke(id *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    int v6 = 136315650;
    id v7 = "-[SSRVTUITrainingServiceClient setupWithLocaleID:appDomain:siriSharedUserId:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s localeIdentifier : %{public}@, appDomain : %{public}@", (uint8_t *)&v6, 0x20u);
  }
  objc_storeStrong((id *)a1[6] + 1, a1[4]);
  objc_storeStrong((id *)a1[6] + 2, a1[5]);
  objc_storeStrong((id *)a1[6] + 3, a1[7]);
  int v5 = [a1[6] _service];
  [v5 setupWithLocaleID:a1[4] appDomain:a1[5] siriSharedUserId:a1[7]];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SSRVTUITrainingServiceClient_invalidate__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

void __42__SSRVTUITrainingServiceClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    __int16 v8 = "-[SSRVTUITrainingServiceClient invalidate]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 48) setInvalidationHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = 0;
}

- (SSRVTUITrainingServiceClient)initWithDelegate:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSRVTUITrainingServiceClient;
  uint64_t v5 = [(SSRVTUITrainingServiceClient *)&v10 init];
  if (v5)
  {
    SSRLogInitIfNeeded();
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.VoiceTriggerUI.TrainingService", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v5->_delegate, v4);
    v5->_requireResetup = 0;
    __int16 v8 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v12 = "-[SSRVTUITrainingServiceClient initWithDelegate:]";
      _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
  }

  return v5;
}

@end