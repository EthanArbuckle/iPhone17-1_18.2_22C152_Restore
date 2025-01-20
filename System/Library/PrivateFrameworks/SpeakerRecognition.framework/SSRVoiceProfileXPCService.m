@interface SSRVoiceProfileXPCService
+ (id)sharedService;
- (OS_dispatch_queue)queue;
- (SSRVoiceProfileXPCClient)xpcClient;
- (SSRVoiceProfileXPCService)init;
- (id)_createXPCClientConnectionIfNeeded:(id)a3;
- (void)_teardownXPCClientIfNeeded;
- (void)fetchEnrollmentStatusForSiriProfileId:(id)a3 forLanguageCode:(id)a4 completion:(id)a5;
- (void)setQueue:(id)a3;
- (void)setXpcClient:(id)a3;
- (void)ssrVoiceProfileXPCClient:(id)a3 didDisconnect:(BOOL)a4;
@end

@implementation SSRVoiceProfileXPCService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setXpcClient:(id)a3
{
}

- (SSRVoiceProfileXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_teardownXPCClientIfNeeded
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcClient = self->_xpcClient;
  if (xpcClient)
  {
    v4 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "-[SSRVoiceProfileXPCService _teardownXPCClientIfNeeded]";
      _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
      xpcClient = self->_xpcClient;
    }
    [(SSRVoiceProfileXPCClient *)xpcClient setDelegate:0];
    v5 = self->_xpcClient;
    self->_xpcClient = 0;
  }
}

- (void)ssrVoiceProfileXPCClient:(id)a3 didDisconnect:(BOOL)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SSRVoiceProfileXPCService_ssrVoiceProfileXPCClient_didDisconnect___block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __68__SSRVoiceProfileXPCService_ssrVoiceProfileXPCClient_didDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[SSRVoiceProfileXPCService ssrVoiceProfileXPCClient:didDisconnect:]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s reset xpcClient since it disconnected", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _teardownXPCClientIfNeeded];
}

- (id)_createXPCClientConnectionIfNeeded:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v5 = (SSRVoiceProfileXPCClient *)v4;
LABEL_6:
    v9 = v5;
    goto LABEL_7;
  }
  xpcClient = self->_xpcClient;
  if (xpcClient
    || (v7 = objc_alloc_init(SSRVoiceProfileXPCClient),
        uint64_t v8 = self->_xpcClient,
        self->_xpcClient = v7,
        v8,
        [(SSRVoiceProfileXPCClient *)self->_xpcClient setDelegate:self],
        [(SSRVoiceProfileXPCClient *)self->_xpcClient connect],
        (xpcClient = self->_xpcClient) != 0))
  {
    v5 = xpcClient;
    goto LABEL_6;
  }
  v11 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315138;
    v13 = "-[SSRVoiceProfileXPCService _createXPCClientConnectionIfNeeded:]";
    _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s voiceProfileXPC client doesn't exist", (uint8_t *)&v12, 0xCu);
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (void)fetchEnrollmentStatusForSiriProfileId:(id)a3 forLanguageCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __94__SSRVoiceProfileXPCService_fetchEnrollmentStatusForSiriProfileId_forLanguageCode_completion___block_invoke;
  v15[3] = &unk_26442A488;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __94__SSRVoiceProfileXPCService_fetchEnrollmentStatusForSiriProfileId_forLanguageCode_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[SSRVoiceProfileXPCService fetchEnrollmentStatusForSiriProfileId:forLanguageCode:completion:]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  v3 = [*(id *)(a1 + 32) _createXPCClientConnectionIfNeeded:0];
  [v3 fetchEnrollmentStatusForSiriProfileId:*(void *)(a1 + 40) forLanguageCode:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (SSRVoiceProfileXPCService)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSRVoiceProfileXPCService;
  v2 = [(SSRVoiceProfileXPCService *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("SSRVoiceProfileXPCService Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_6035);
  }
  v2 = (void *)sharedService_sharedInstance;

  return v2;
}

uint64_t __42__SSRVoiceProfileXPCService_sharedService__block_invoke()
{
  sharedService_sharedInstance = objc_alloc_init(SSRVoiceProfileXPCService);

  return MEMORY[0x270F9A758]();
}

@end