@interface SVXClientKeepAliveService
- (SVXClientKeepAliveService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5;
- (void)_connectWithRetryCount:(unint64_t)a3 completion:(id)a4;
- (void)clientServiceDidChange:(BOOL)a3;
- (void)connectWithCompletion:(id)a3;
@end

@implementation SVXClientKeepAliveService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);

  objc_storeStrong((id *)&self->_performer, 0);
}

- (void)_connectWithRetryCount:(unint64_t)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SVXClientKeepAliveService _connectWithRetryCount:completion:]";
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s retryCount = %tu", buf, 0x16u);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__SVXClientKeepAliveService__connectWithRetryCount_completion___block_invoke;
  v14[3] = &unk_264552EB8;
  id v15 = v6;
  unint64_t v16 = a3;
  v14[4] = self;
  id v8 = v6;
  v9 = (void *)MEMORY[0x223C65C40](v14);
  clientServiceProvider = self->_clientServiceProvider;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__SVXClientKeepAliveService__connectWithRetryCount_completion___block_invoke_2;
  v12[3] = &unk_264553680;
  id v13 = v9;
  id v11 = v9;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v12 errorHandler:v11];
}

void __63__SVXClientKeepAliveService__connectWithRetryCount_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[SVXClientKeepAliveService _connectWithRetryCount:completion:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_220062000, v4, OS_LOG_TYPE_DEBUG, "%s error = %@", buf, 0x16u);
  }
  uint64_t v5 = a1[4];
  id v6 = *(void **)(v5 + 8);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__SVXClientKeepAliveService__connectWithRetryCount_completion___block_invoke_3;
  v9[3] = &unk_264553A38;
  v7 = (void *)a1[5];
  uint64_t v13 = a1[6];
  id v10 = v3;
  uint64_t v11 = v5;
  id v12 = v7;
  id v8 = v3;
  [v6 performBlock:v9];
}

uint64_t __63__SVXClientKeepAliveService__connectWithRetryCount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 pingWithReply:*(void *)(a1 + 32)];
}

uint64_t __63__SVXClientKeepAliveService__connectWithRetryCount_completion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v1 = *(void *)(a1 + 56);
    if (v1) {
      return [*(id *)(a1 + 40) _connectWithRetryCount:v1 - 1 completion:*(void *)(a1 + 48)];
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)clientServiceDidChange:(BOOL)a3
{
  performer = self->_performer;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__SVXClientKeepAliveService_clientServiceDidChange___block_invoke;
  v4[3] = &unk_264553AD8;
  BOOL v5 = a3;
  v4[4] = self;
  [(SVXPerforming *)performer performBlock:v4];
}

uint64_t __52__SVXClientKeepAliveService_clientServiceDidChange___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) connectWithCompletion:0];
  }
  return result;
}

- (SVXClientKeepAliveService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SVXClientKeepAliveService;
  id v10 = [(SVXClientKeepAliveService *)&v13 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_performer, a5);
    objc_storeStrong((id *)&v11->_clientServiceProvider, a3);
  }

  return v11;
}

- (void)connectWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[SVXClientKeepAliveService connectWithCompletion:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s Connecting...", buf, 0xCu);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__SVXClientKeepAliveService_connectWithCompletion___block_invoke;
  v8[3] = &unk_2645547D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

void __51__SVXClientKeepAliveService_connectWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__SVXClientKeepAliveService_connectWithCompletion___block_invoke_2;
  v2[3] = &unk_264553998;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _connectWithRetryCount:5 completion:v2];
}

void __51__SVXClientKeepAliveService_connectWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[SVXClientKeepAliveService connectWithCompletion:]_block_invoke_2";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s Failed to connect due to error %@.", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[SVXClientKeepAliveService connectWithCompletion:]_block_invoke";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s Connected.", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

@end