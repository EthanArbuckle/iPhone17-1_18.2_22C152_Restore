@interface SVXClientDeviceService
- (SVXClientDeviceService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5;
- (void)_beginSetupWithContext:(id)a3;
- (void)_endSetup;
- (void)_prepareForSetupWithContext:(id)a3 completion:(id)a4;
- (void)_updateSetupContext;
- (void)beginSetupWithContext:(id)a3;
- (void)clientServiceDidChange:(BOOL)a3;
- (void)endSetup;
- (void)prepareForSetupWithContext:(id)a3 completion:(id)a4;
@end

@implementation SVXClientDeviceService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSetupContext, 0);
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);

  objc_storeStrong((id *)&self->_performer, 0);
}

- (void)_updateSetupContext
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    currentSetupContext = self->_currentSetupContext;
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientDeviceService _updateSetupContext]";
    __int16 v12 = 2112;
    v13 = currentSetupContext;
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s _currentSetupContext = %@", buf, 0x16u);
  }
  v5 = self->_currentSetupContext;
  clientServiceProvider = self->_clientServiceProvider;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SVXClientDeviceService__updateSetupContext__block_invoke;
  v8[3] = &unk_2645531B8;
  v9 = v5;
  v7 = v5;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v8 errorHandler:&__block_literal_global_5764];
}

uint64_t __45__SVXClientDeviceService__updateSetupContext__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeviceSetupContext:*(void *)(a1 + 32)];
}

void __45__SVXClientDeviceService__updateSetupContext__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientDeviceService _updateSetupContext]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_endSetup
{
  currentSetupContext = self->_currentSetupContext;
  self->_currentSetupContext = 0;

  [(SVXClientDeviceService *)self _updateSetupContext];
}

- (void)_beginSetupWithContext:(id)a3
{
  int v4 = (SVXDeviceSetupContext *)[a3 copy];
  currentSetupContext = self->_currentSetupContext;
  self->_currentSetupContext = v4;

  [(SVXClientDeviceService *)self _updateSetupContext];
}

- (void)_prepareForSetupWithContext:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SVXClientDeviceService _prepareForSetupWithContext:completion:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  clientServiceProvider = self->_clientServiceProvider;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__SVXClientDeviceService__prepareForSetupWithContext_completion___block_invoke;
  v14[3] = &unk_264553850;
  id v15 = v6;
  id v16 = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__SVXClientDeviceService__prepareForSetupWithContext_completion___block_invoke_4;
  v12[3] = &unk_264553998;
  id v13 = v16;
  id v10 = v16;
  id v11 = v6;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v14 errorHandler:v12];
}

void __65__SVXClientDeviceService__prepareForSetupWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__SVXClientDeviceService__prepareForSetupWithContext_completion___block_invoke_2;
  v4[3] = &unk_2645546F0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 prepareForDeviceSetupWithContext:v3 completion:v4];
}

void __65__SVXClientDeviceService__prepareForSetupWithContext_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientDeviceService _prepareForSetupWithContext:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __65__SVXClientDeviceService__prepareForSetupWithContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *MEMORY[0x263F28348];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[SVXClientDeviceService _prepareForSetupWithContext:completion:]_block_invoke_2";
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_error_impl(&dword_220062000, v7, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[SVXClientDeviceService _prepareForSetupWithContext:completion:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s flow = %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)endSetup
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[SVXClientDeviceService endSetup]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__SVXClientDeviceService_endSetup__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [(SVXPerforming *)performer performBlock:v5];
}

uint64_t __34__SVXClientDeviceService_endSetup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endSetup];
}

- (void)beginSetupWithContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[SVXClientDeviceService beginSetupWithContext:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__SVXClientDeviceService_beginSetupWithContext___block_invoke;
  v8[3] = &unk_2645548C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

uint64_t __48__SVXClientDeviceService_beginSetupWithContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginSetupWithContext:*(void *)(a1 + 40)];
}

- (void)prepareForSetupWithContext:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[SVXClientDeviceService prepareForSetupWithContext:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__SVXClientDeviceService_prepareForSetupWithContext_completion___block_invoke;
  v12[3] = &unk_264554788;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SVXPerforming *)performer performBlock:v12];
}

void __64__SVXClientDeviceService_prepareForSetupWithContext_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__SVXClientDeviceService_prepareForSetupWithContext_completion___block_invoke_2;
  v5[3] = &unk_264552D98;
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _prepareForSetupWithContext:v3 completion:v5];
}

void __64__SVXClientDeviceService_prepareForSetupWithContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 8);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __64__SVXClientDeviceService_prepareForSetupWithContext_completion___block_invoke_3;
    v9[3] = &unk_264554788;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    [v8 performBlock:v9];
  }
}

uint64_t __64__SVXClientDeviceService_prepareForSetupWithContext_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)clientServiceDidChange:(BOOL)a3
{
  performer = self->_performer;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__SVXClientDeviceService_clientServiceDidChange___block_invoke;
  v4[3] = &unk_264553AD8;
  BOOL v5 = a3;
  void v4[4] = self;
  [(SVXPerforming *)performer performBlock:v4];
}

uint64_t __49__SVXClientDeviceService_clientServiceDidChange___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _updateSetupContext];
  }
  return result;
}

- (SVXClientDeviceService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SVXClientDeviceService;
  id v10 = [(SVXClientDeviceService *)&v13 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_performer, a5);
    objc_storeStrong((id *)&v11->_clientServiceProvider, a3);
  }

  return v11;
}

@end