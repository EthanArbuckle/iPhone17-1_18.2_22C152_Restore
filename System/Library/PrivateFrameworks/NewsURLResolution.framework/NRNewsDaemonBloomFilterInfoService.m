@interface NRNewsDaemonBloomFilterInfoService
- (FCAsyncOnceOperation)fetchOnceOperation;
- (NRNewsDaemonBloomFilterInfoService)init;
- (NTPBBloomFilterInfo)bloomFilterInfo;
- (void)_fetchBloomFilterInfoWithCompletion:(id)a3;
- (void)fetchWebURLBloomFilterInfoWithCompletion:(id)a3;
- (void)setBloomFilterInfo:(id)a3;
@end

@implementation NRNewsDaemonBloomFilterInfoService

- (NRNewsDaemonBloomFilterInfoService)init
{
  v10.receiver = self;
  v10.super_class = (Class)NRNewsDaemonBloomFilterInfoService;
  v2 = [(NRNewsDaemonBloomFilterInfoService *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F59390]);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __42__NRNewsDaemonBloomFilterInfoService_init__block_invoke;
    v8[3] = &unk_264708B30;
    v4 = v2;
    v9 = v4;
    uint64_t v5 = [v3 initWithBlock:v8];
    fetchOnceOperation = v4->_fetchOnceOperation;
    v4->_fetchOnceOperation = (FCAsyncOnceOperation *)v5;
  }
  return v2;
}

uint64_t __42__NRNewsDaemonBloomFilterInfoService_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__NRNewsDaemonBloomFilterInfoService_init__block_invoke_2;
  v7[3] = &unk_264708B08;
  id v8 = v4;
  id v9 = v3;
  id v5 = v3;
  [v8 _fetchBloomFilterInfoWithCompletion:v7];

  return 0;
}

void __42__NRNewsDaemonBloomFilterInfoService_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id obj = a2;
  id v5 = a3;
  v6 = obj;
  if (!obj)
  {
    v6 = objc_msgSend(MEMORY[0x263F5A280], "fc_fullBloomFilterInfo");
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), v6);
  if (!obj) {

  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchWebURLBloomFilterInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NRNewsDaemonBloomFilterInfoService *)self fetchOnceOperation];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__NRNewsDaemonBloomFilterInfoService_fetchWebURLBloomFilterInfoWithCompletion___block_invoke;
  v8[3] = &unk_264708B58;
  void v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 executeWithCompletionHandler:v8];
}

void __79__NRNewsDaemonBloomFilterInfoService_fetchWebURLBloomFilterInfoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) bloomFilterInfo];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_fetchBloomFilterInfoWithCompletion:(id)a3
{
  id v3 = a3;
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NRNewsDaemonBloomFilterInfoService _fetchBloomFilterInfoWithCompletion:]();
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.newsd.url-resolution" options:0];
  id v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D848BC0];
  id v6 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v5 setClasses:v6 forSelector:sel_fetchWebURLBloomFilterInfoWithCompletion_ argumentIndex:0 ofReply:1];

  [v4 setRemoteObjectInterface:v5];
  [v4 resume];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__NRNewsDaemonBloomFilterInfoService__fetchBloomFilterInfoWithCompletion___block_invoke;
  v15[3] = &unk_264708B80;
  id v7 = v3;
  id v17 = v7;
  id v8 = v4;
  id v16 = v8;
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__NRNewsDaemonBloomFilterInfoService__fetchBloomFilterInfoWithCompletion___block_invoke_2;
  v12[3] = &unk_264708BA8;
  id v13 = v8;
  id v14 = v7;
  id v10 = v8;
  id v11 = v7;
  [v9 fetchWebURLBloomFilterInfoWithCompletion:v12];
}

uint64_t __74__NRNewsDaemonBloomFilterInfoService__fetchBloomFilterInfoWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);
  return [v2 invalidate];
}

uint64_t __74__NRNewsDaemonBloomFilterInfoService__fetchBloomFilterInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);
  return [v2 invalidate];
}

- (NTPBBloomFilterInfo)bloomFilterInfo
{
  return self->_bloomFilterInfo;
}

- (void)setBloomFilterInfo:(id)a3
{
}

- (FCAsyncOnceOperation)fetchOnceOperation
{
  return self->_fetchOnceOperation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchOnceOperation, 0);
  objc_storeStrong((id *)&self->_bloomFilterInfo, 0);
}

- (void)_fetchBloomFilterInfoWithCompletion:.cold.1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion");
  *(_DWORD *)buf = 136315906;
  id v2 = "-[NRNewsDaemonBloomFilterInfoService _fetchBloomFilterInfoWithCompletion:]";
  __int16 v3 = 2080;
  id v4 = "NRNewsDaemonBloomFilterInfoService.m";
  __int16 v5 = 1024;
  int v6 = 55;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl(&dword_224EA7000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end