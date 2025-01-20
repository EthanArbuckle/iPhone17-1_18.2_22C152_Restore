@interface SVXClientActivationService
- (BOOL)_requestPermissionToActivateWithContext:(id)a3;
- (SVXClientActivationService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5;
- (SVXClientActivationServiceDelegate)delegate;
- (void)_activateWithContext:(id)a3 completion:(id)a4;
- (void)_deactivateWithContext:(id)a3 completion:(id)a4;
- (void)_enqueueButtonEvent:(id)a3;
- (void)_performManualEndpointing;
- (void)_preheatTimerArrivedWithToken:(id)a3;
- (void)_preheatWithActivationSource:(int64_t)a3;
- (void)_prewarmWithContext:(id)a3 completion:(id)a4;
- (void)_processLastButtonActivationContext;
- (void)_startPreheatTimer;
- (void)_stopPreheatTimer;
- (void)_transitToAutomaticEndpointingWithTimestamp:(unint64_t)a3;
- (void)activateWithButtonEvent:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)activateWithSystemEvent:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)activateWithText:(id)a3 completion:(id)a4;
- (void)activateWithUserInfo:(id)a3 completion:(id)a4;
- (void)deactivateWithButtonEvent:(id)a3 userInfo:(id)a4 options:(id)a5 completion:(id)a6;
- (void)deactivateWithUserInfo:(id)a3 completion:(id)a4;
- (void)deactivateWithUserInfo:(id)a3 options:(id)a4 completion:(id)a5;
- (void)enqueueButtonEvent:(id)a3;
- (void)handleButtonEvent:(id)a3;
- (void)handleDidActivateWithContext:(id)a3;
- (void)handleDidDeactivateWithContext:(id)a3;
- (void)handleDidNotActivateWithContext:(id)a3 error:(id)a4;
- (void)handleRequestPermissionToActivateWithContext:(id)a3 completion:(id)a4;
- (void)handleWillActivateWithContext:(id)a3;
- (void)handleWillDeactivateWithContext:(id)a3;
- (void)prewarmForSystemEvent:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SVXClientActivationService

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preheatToken, 0);
  objc_storeStrong((id *)&self->_lastButtonActivationContext, 0);
  objc_storeStrong((id *)&self->_queuedButtonEvents, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);

  objc_storeStrong((id *)&self->_performer, 0);
}

- (void)setDelegate:(id)a3
{
}

- (SVXClientActivationServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SVXClientActivationServiceDelegate *)WeakRetained;
}

- (void)_preheatTimerArrivedWithToken:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([(NSUUID *)self->_preheatToken isEqual:a3])
  {
    preheatToken = self->_preheatToken;
    self->_preheatToken = 0;

    v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      v7 = "-[SVXClientActivationService _preheatTimerArrivedWithToken:]";
      _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s Preheat timer fired!", (uint8_t *)&v6, 0xCu);
    }
    [(SVXClientActivationService *)self _preheatWithActivationSource:1];
  }
}

- (void)_stopPreheatTimer
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  preheatToken = self->_preheatToken;
  if (preheatToken)
  {
    v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      int v6 = "-[SVXClientActivationService _stopPreheatTimer]";
      _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s Stopped preheat timer.", (uint8_t *)&v5, 0xCu);
      preheatToken = self->_preheatToken;
    }
    self->_preheatToken = 0;
  }
}

- (void)_startPreheatTimer
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_preheatToken = &self->_preheatToken;
  if (!self->_preheatToken)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08C38]);
    objc_storeStrong((id *)p_preheatToken, v4);
    performer = self->_performer;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__SVXClientActivationService__startPreheatTimer__block_invoke;
    v8[3] = &unk_2645548C8;
    v8[4] = self;
    id v6 = v4;
    id v9 = v6;
    [(SVXPerforming *)performer performBlock:v8 afterDelay:0.25];
    uint64_t v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[SVXClientActivationService _startPreheatTimer]";
      __int16 v12 = 2048;
      uint64_t v13 = 0x3FD0000000000000;
      _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s Started preheat timer for %f seconds.", buf, 0x16u);
    }
  }
}

uint64_t __48__SVXClientActivationService__startPreheatTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _preheatTimerArrivedWithToken:*(void *)(a1 + 40)];
}

- (void)_preheatWithActivationSource:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SVXClientActivationService _preheatWithActivationSource:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  clientServiceProvider = self->_clientServiceProvider;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__SVXClientActivationService__preheatWithActivationSource___block_invoke;
  v7[3] = &__block_descriptor_40_e28_v16__0___SVXClientService__8l;
  v7[4] = a3;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v7 errorHandler:&__block_literal_global_18_6194];
}

uint64_t __59__SVXClientActivationService__preheatWithActivationSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 preheatWithActivationSource:*(void *)(a1 + 32)];
}

void __59__SVXClientActivationService__preheatWithActivationSource___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[SVXClientActivationService _preheatWithActivationSource:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_transitToAutomaticEndpointingWithTimestamp:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v10 = "-[SVXClientActivationService _transitToAutomaticEndpointingWithTimestamp:]";
    __int16 v11 = 2048;
    unint64_t v12 = a3;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s Endpoint trigger timestamp = %lld", buf, 0x16u);
  }
  clientServiceProvider = self->_clientServiceProvider;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__SVXClientActivationService__transitToAutomaticEndpointingWithTimestamp___block_invoke;
  v8[3] = &__block_descriptor_40_e28_v16__0___SVXClientService__8l;
  v8[4] = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__SVXClientActivationService__transitToAutomaticEndpointingWithTimestamp___block_invoke_2;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = a3;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v8 errorHandler:v7];
}

uint64_t __74__SVXClientActivationService__transitToAutomaticEndpointingWithTimestamp___block_invoke(uint64_t a1, void *a2)
{
  return [a2 transitToAutomaticEndpointingWithTimestamp:*(void *)(a1 + 32)];
}

void __74__SVXClientActivationService__transitToAutomaticEndpointingWithTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[SVXClientActivationService _transitToAutomaticEndpointingWithTimestamp:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s error = %@, Endpoint trigger timestamp = %lld", (uint8_t *)&v6, 0x20u);
  }
}

- (void)_performManualEndpointing
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[SVXClientActivationService _performManualEndpointing]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(SVXClientServiceProviding *)self->_clientServiceProvider getClientServiceUsingBlock:&__block_literal_global_6202 errorHandler:&__block_literal_global_15];
}

void __55__SVXClientActivationService__performManualEndpointing__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SVXClientActivationService _performManualEndpointing]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t __55__SVXClientActivationService__performManualEndpointing__block_invoke(uint64_t a1, void *a2)
{
  return [a2 performManualEndpointing];
}

- (void)_deactivateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SVXClientActivationService _deactivateWithContext:completion:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  [(SVXClientActivationService *)self _stopPreheatTimer];
  clientServiceProvider = self->_clientServiceProvider;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__SVXClientActivationService__deactivateWithContext_completion___block_invoke;
  v14[3] = &unk_264553850;
  id v15 = v6;
  id v16 = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__SVXClientActivationService__deactivateWithContext_completion___block_invoke_13;
  v12[3] = &unk_264553998;
  id v13 = v16;
  id v10 = v16;
  id v11 = v6;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v14 errorHandler:v12];
}

void __64__SVXClientActivationService__deactivateWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  int v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__SVXClientActivationService__deactivateWithContext_completion___block_invoke_2;
  v5[3] = &unk_2645547D8;
  id v6 = v4;
  id v7 = *(id *)(a1 + 40);
  [a2 deactivateWithContext:v6 completion:v5];
}

void __64__SVXClientActivationService__deactivateWithContext_completion___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientActivationService _deactivateWithContext:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __64__SVXClientActivationService__deactivateWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    int v6 = "-[SVXClientActivationService _deactivateWithContext:completion:]_block_invoke_2";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s done (context = %@)", (uint8_t *)&v5, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_activateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "-[SVXClientActivationService _activateWithContext:completion:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  [(SVXClientActivationService *)self _stopPreheatTimer];
  clientServiceProvider = self->_clientServiceProvider;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__SVXClientActivationService__activateWithContext_completion___block_invoke;
  v14[3] = &unk_264552E30;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__SVXClientActivationService__activateWithContext_completion___block_invoke_12;
  v12[3] = &unk_264553998;
  id v13 = v17;
  id v10 = v17;
  id v11 = v6;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v14 errorHandler:v12];
}

void __62__SVXClientActivationService__activateWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  int v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__SVXClientActivationService__activateWithContext_completion___block_invoke_2;
  v6[3] = &unk_264553C40;
  id v7 = v4;
  id v5 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = v5;
  [a2 activateWithContext:v7 completion:v6];
}

void __62__SVXClientActivationService__activateWithContext_completion___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientActivationService _activateWithContext:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __62__SVXClientActivationService__activateWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v16 = "-[SVXClientActivationService _activateWithContext:completion:]_block_invoke_2";
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s done (context = %@, error = %@)", buf, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  id v7 = *(void **)(*(void *)(a1 + 40) + 8);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__SVXClientActivationService__activateWithContext_completion___block_invoke_11;
  v11[3] = &unk_2645547B0;
  id v12 = v3;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v13 = v8;
  uint64_t v14 = v9;
  id v10 = v3;
  [v7 performBlock:v11];
}

void __62__SVXClientActivationService__activateWithContext_completion___block_invoke_11(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32) && [*(id *)(a1 + 40) source] == 1)
  {
    id v2 = [*(id *)(a1 + 40) buttonEvent];
    uint64_t v3 = [v2 type];

    if (v3 == 1)
    {
      uint64_t v4 = [*(id *)(a1 + 40) copy];
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      id v7 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 40);
        int v9 = 136315394;
        id v10 = "-[SVXClientActivationService _activateWithContext:completion:]_block_invoke";
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s _lastButtonActivationContext = %@", (uint8_t *)&v9, 0x16u);
      }
      [*(id *)(a1 + 48) _processLastButtonActivationContext];
    }
  }
}

- (void)_prewarmWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientServiceProvider = self->_clientServiceProvider;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__SVXClientActivationService__prewarmWithContext_completion___block_invoke;
  v13[3] = &unk_264553850;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__SVXClientActivationService__prewarmWithContext_completion___block_invoke_3;
  v11[3] = &unk_264553998;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v13 errorHandler:v11];
}

void __61__SVXClientActivationService__prewarmWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__SVXClientActivationService__prewarmWithContext_completion___block_invoke_2;
  v4[3] = &unk_264553B00;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 prewarmWithContext:v3 completion:v4];
}

void __61__SVXClientActivationService__prewarmWithContext_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientActivationService _prewarmWithContext:completion:]_block_invoke_3";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __61__SVXClientActivationService__prewarmWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_requestPermissionToActivateWithContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    id v12 = "-[SVXClientActivationService _requestPermissionToActivateWithContext:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v11, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = [v8 clientActivationService:self shouldActivateWithContext:v4];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)_processLastButtonActivationContext
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  lastButtonActivationContext = self->_lastButtonActivationContext;
  if (lastButtonActivationContext)
  {
    if ([(SVXActivationContext *)lastButtonActivationContext source] == 1)
    {
      id v4 = [(SVXActivationContext *)self->_lastButtonActivationContext buttonEvent];
      if ([(NSMutableArray *)v4 type] == 1)
      {
        uint64_t v5 = [(NSMutableArray *)v4 timestamp];
        if (v5)
        {
          uint64_t v6 = v5;
          *(void *)v41 = 0;
          *(void *)&v41[8] = v41;
          *(void *)&v41[16] = 0x3032000000;
          v42 = __Block_byref_object_copy__6222;
          v43 = __Block_byref_object_dispose__6223;
          id v44 = 0;
          uint64_t v29 = 0;
          v30 = &v29;
          uint64_t v31 = 0x2020000000;
          uint64_t v32 = 0;
          queuedButtonEvents = self->_queuedButtonEvents;
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __65__SVXClientActivationService__processLastButtonActivationContext__block_invoke;
          v28[3] = &unk_264552E08;
          v28[5] = &v29;
          v28[6] = v6;
          v28[4] = v41;
          [(NSMutableArray *)queuedButtonEvents enumerateObjectsUsingBlock:v28];
          id v8 = *(void **)(*(void *)&v41[8] + 40);
          char v9 = (os_log_t *)MEMORY[0x263F28348];
          uint64_t v10 = *MEMORY[0x263F28348];
          int v11 = *MEMORY[0x263F28348];
          if (v8)
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              id v12 = self->_lastButtonActivationContext;
              *(_DWORD *)buf = 136315906;
              v34 = "-[SVXClientActivationService _processLastButtonActivationContext]";
              __int16 v35 = 2112;
              double v36 = *(double *)&v8;
              __int16 v37 = 2112;
              v38 = v4;
              __int16 v39 = 2112;
              v40 = v12;
              _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s Matched button up event %@ for button down event %@ of last button activation context %@.", buf, 0x2Au);
              id v8 = *(void **)(*(void *)&v41[8] + 40);
            }
            [v8 timestamp];
            AFMachAbsoluteTimeGetTimeInterval();
            double v14 = v13;
            uint64_t v15 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v34 = "-[SVXClientActivationService _processLastButtonActivationContext]";
              __int16 v35 = 2048;
              double v36 = v14;
              _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s buttonHoldDuration = %f", buf, 0x16u);
            }
            if (_SVXClientActivationServiceGetButtonHoldToTalkThreshold_onceToken != -1) {
              dispatch_once(&_SVXClientActivationServiceGetButtonHoldToTalkThreshold_onceToken, &__block_literal_global_140);
            }
            if (v14 <= *(double *)&_SVXClientActivationServiceGetButtonHoldToTalkThreshold_threshold) {
              [(SVXClientActivationService *)self _transitToAutomaticEndpointingWithTimestamp:v30[3]];
            }
            else {
              [(SVXClientActivationService *)self _performManualEndpointing];
            }
            v24 = self->_lastButtonActivationContext;
            self->_lastButtonActivationContext = 0;

            [(AFAnalytics *)self->_analytics logEventWithType:1410 machAbsoluteTime:v6 context:0];
            [(AFAnalytics *)self->_analytics logEventWithType:1411 machAbsoluteTime:v30[3] context:0];
          }
          else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v23 = self->_queuedButtonEvents;
            uint64_t v22 = self->_lastButtonActivationContext;
            *(_DWORD *)buf = 136315650;
            v34 = "-[SVXClientActivationService _processLastButtonActivationContext]";
            __int16 v35 = 2112;
            double v36 = *(double *)&v22;
            __int16 v37 = 2112;
            v38 = v23;
            _os_log_error_impl(&dword_220062000, v10, OS_LOG_TYPE_ERROR, "%s Ignored because no matching button up event can be found in the button event queue. (_lastButtonActivationContext = %@, _queuedButtonEvents = %@)", buf, 0x20u);
          }
          _Block_object_dispose(&v29, 8);
          _Block_object_dispose(v41, 8);

          goto LABEL_30;
        }
        uint64_t v21 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
        {
          v27 = self->_lastButtonActivationContext;
          *(_DWORD *)v41 = 136315394;
          *(void *)&v41[4] = "-[SVXClientActivationService _processLastButtonActivationContext]";
          *(_WORD *)&v41[12] = 2112;
          *(void *)&v41[14] = v27;
          _os_log_error_impl(&dword_220062000, v21, OS_LOG_TYPE_ERROR, "%s Ignored because the timestamp of the button event in last button activation context is 0. (_lastButtonActivationContext = %@)", v41, 0x16u);
        }
      }
      else
      {
        __int16 v19 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
        {
          v26 = self->_lastButtonActivationContext;
          *(_DWORD *)v41 = 136315394;
          *(void *)&v41[4] = "-[SVXClientActivationService _processLastButtonActivationContext]";
          *(_WORD *)&v41[12] = 2112;
          *(void *)&v41[14] = v26;
          _os_log_error_impl(&dword_220062000, v19, OS_LOG_TYPE_ERROR, "%s Ignored because the type of the button event in last button activation context is not down. (_lastButtonActivationContext = %@)", v41, 0x16u);
        }
      }
      id v20 = self->_lastButtonActivationContext;
      self->_lastButtonActivationContext = 0;

LABEL_30:
      return;
    }
    __int16 v17 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      v25 = self->_lastButtonActivationContext;
      *(_DWORD *)v41 = 136315394;
      *(void *)&v41[4] = "-[SVXClientActivationService _processLastButtonActivationContext]";
      *(_WORD *)&v41[12] = 2112;
      *(void *)&v41[14] = v25;
      _os_log_error_impl(&dword_220062000, v17, OS_LOG_TYPE_ERROR, "%s Ignored because the source of the last button activation context is not button. (_lastButtonActivationContext = %@)", v41, 0x16u);
    }
    uint64_t v18 = self->_lastButtonActivationContext;
    self->_lastButtonActivationContext = 0;
  }
  else
  {
    id v16 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v41 = 136315138;
      *(void *)&v41[4] = "-[SVXClientActivationService _processLastButtonActivationContext]";
      _os_log_impl(&dword_220062000, v16, OS_LOG_TYPE_INFO, "%s Ignored because the last button activation context is nil.", v41, 0xCu);
    }
  }
}

void __65__SVXClientActivationService__processLastButtonActivationContext__block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  unint64_t v8 = [v7 timestamp];
  if (v8 < a1[6])
  {
LABEL_2:
    *a4 = 1;
    goto LABEL_11;
  }
  unint64_t v9 = v8;
  uint64_t v10 = [v7 type];
  if (v10 == 2)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
    *(void *)(*(void *)(a1[5] + 8) + 24) = [v7 timestamp];
    id v12 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      unint64_t v13 = *(void *)(*(void *)(a1[5] + 8) + 24);
      int v14 = 136315394;
      uint64_t v15 = "-[SVXClientActivationService _processLastButtonActivationContext]_block_invoke";
      __int16 v16 = 2048;
      unint64_t v17 = v13;
      _os_log_debug_impl(&dword_220062000, v12, OS_LOG_TYPE_DEBUG, "%s queuedButtonEvent: button up, timestamp = %lld", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (v10 == 1)
  {
    int v11 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      uint64_t v15 = "-[SVXClientActivationService _processLastButtonActivationContext]_block_invoke";
      __int16 v16 = 2048;
      unint64_t v17 = v9;
      _os_log_debug_impl(&dword_220062000, v11, OS_LOG_TYPE_DEBUG, "%s queuedButtonEvent: button down, timestamp = %lld", (uint8_t *)&v14, 0x16u);
    }
    if (v9 == a1[6]) {
      goto LABEL_2;
    }
  }
LABEL_11:
}

- (void)_enqueueButtonEvent:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v5;
    unint64_t v7 = [v4 type];
    if (v7 > 2) {
      unint64_t v8 = @"(unknown)";
    }
    else {
      unint64_t v8 = off_264553908[v7];
    }
    unint64_t v9 = v8;
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SVXClientActivationService _enqueueButtonEvent:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v23 = [v4 timestamp];
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s type = %@, timestamp = %llu", buf, 0x20u);
  }
  queuedButtonEvents = self->_queuedButtonEvents;
  if (!queuedButtonEvents)
  {
    int v11 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:16];
    id v12 = self->_queuedButtonEvents;
    self->_queuedButtonEvents = v11;

    queuedButtonEvents = self->_queuedButtonEvents;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __50__SVXClientActivationService__enqueueButtonEvent___block_invoke;
  __int16 v19 = &unk_264552DE0;
  id v13 = v4;
  id v20 = v13;
  uint64_t v21 = buf;
  [(NSMutableArray *)queuedButtonEvents enumerateObjectsUsingBlock:&v16];
  int v14 = self->_queuedButtonEvents;
  if (*(void *)(*(void *)&buf[8] + 24) == 0x7FFFFFFFFFFFFFFFLL) {
    -[NSMutableArray addObject:](v14, "addObject:", v13, v16, v17, v18, v19);
  }
  else {
    -[NSMutableArray insertObject:atIndex:](v14, "insertObject:atIndex:", v13, v16, v17, v18, v19);
  }
  if ((unint64_t)[(NSMutableArray *)self->_queuedButtonEvents count] >= 0x11) {
    [(NSMutableArray *)self->_queuedButtonEvents removeLastObject];
  }
  [(SVXClientActivationService *)self _stopPreheatTimer];
  uint64_t v15 = [v13 type];
  if (v15 == 2)
  {
    [(SVXClientActivationService *)self _processLastButtonActivationContext];
  }
  else if (v15 == 1)
  {
    [(SVXClientActivationService *)self _startPreheatTimer];
  }

  _Block_object_dispose(buf, 8);
}

void __50__SVXClientActivationService__enqueueButtonEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  unint64_t v9 = [v7 timestamp];
  unint64_t v10 = [v8 timestamp];

  if (v9 > v10)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)deactivateWithButtonEvent:(id)a3 userInfo:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = mach_absolute_time();
  uint64_t v15 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v26 = "-[SVXClientActivationService deactivateWithButtonEvent:userInfo:options:completion:]";
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v11;
    __int16 v31 = 2112;
    id v32 = v12;
    _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s buttonEvent = %@, userInfo = %@, options = %@", buf, 0x2Au);
  }
  uint64_t v16 = [SVXDeactivationContext alloc];
  uint64_t v17 = SVXClientInfoGetCurrent();
  uint64_t v18 = [(SVXDeactivationContext *)v16 initWithSource:1 timestamp:v14 buttonEvent:v10 clientInfo:v17 userInfo:v11 options:v12];

  performer = self->_performer;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __84__SVXClientActivationService_deactivateWithButtonEvent_userInfo_options_completion___block_invoke;
  v22[3] = &unk_264554788;
  v22[4] = self;
  uint64_t v23 = v18;
  id v24 = v13;
  id v20 = v13;
  uint64_t v21 = v18;
  [(SVXPerforming *)performer performBlock:v22];
}

void __84__SVXClientActivationService_deactivateWithButtonEvent_userInfo_options_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__SVXClientActivationService_deactivateWithButtonEvent_userInfo_options_completion___block_invoke_2;
  v5[3] = &unk_2645547D8;
  id v4 = *(id *)(a1 + 48);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _deactivateWithContext:v3 completion:v5];
}

void __84__SVXClientActivationService_deactivateWithButtonEvent_userInfo_options_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 8);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __84__SVXClientActivationService_deactivateWithButtonEvent_userInfo_options_completion___block_invoke_3;
    v3[3] = &unk_264553B00;
    id v4 = v1;
    [v2 performBlock:v3];
  }
}

uint64_t __84__SVXClientActivationService_deactivateWithButtonEvent_userInfo_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deactivateWithUserInfo:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = mach_absolute_time();
  id v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v23 = "-[SVXClientActivationService deactivateWithUserInfo:options:completion:]";
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s userInfo = %@, options = %@", buf, 0x20u);
  }
  id v13 = [SVXDeactivationContext alloc];
  uint64_t v14 = SVXClientInfoGetCurrent();
  uint64_t v15 = [(SVXDeactivationContext *)v13 initWithSource:2 timestamp:v11 buttonEvent:0 clientInfo:v14 userInfo:v8 options:v9];

  performer = self->_performer;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __72__SVXClientActivationService_deactivateWithUserInfo_options_completion___block_invoke;
  v19[3] = &unk_264554788;
  v19[4] = self;
  id v20 = v15;
  id v21 = v10;
  id v17 = v10;
  uint64_t v18 = v15;
  [(SVXPerforming *)performer performBlock:v19];
}

void __72__SVXClientActivationService_deactivateWithUserInfo_options_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__SVXClientActivationService_deactivateWithUserInfo_options_completion___block_invoke_2;
  v5[3] = &unk_2645547D8;
  id v4 = *(id *)(a1 + 48);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _deactivateWithContext:v3 completion:v5];
}

void __72__SVXClientActivationService_deactivateWithUserInfo_options_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 8);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __72__SVXClientActivationService_deactivateWithUserInfo_options_completion___block_invoke_3;
    v3[3] = &unk_264553B00;
    id v4 = v1;
    [v2 performBlock:v3];
  }
}

uint64_t __72__SVXClientActivationService_deactivateWithUserInfo_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deactivateWithUserInfo:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_t *)MEMORY[0x263F28348];
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v24 = "-[SVXClientActivationService deactivateWithUserInfo:completion:]";
    _os_log_error_impl(&dword_220062000, v9, OS_LOG_TYPE_ERROR, "%s Deprecated. Please use -deactivateWithUserInfo:options:completion: or -deactiateWithButtonEvent:userInfo:options:completion:", buf, 0xCu);
  }
  uint64_t v10 = mach_absolute_time();
  uint64_t v11 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v24 = "-[SVXClientActivationService deactivateWithUserInfo:completion:]";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  id v12 = [v6 objectForKey:@"deactivationSource"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v12 integerValue] == 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2;
    }
  }
  else
  {
    uint64_t v13 = 2;
  }
  uint64_t v14 = [SVXDeactivationContext alloc];
  uint64_t v15 = SVXClientInfoGetCurrent();
  uint64_t v16 = [(SVXDeactivationContext *)v14 initWithSource:v13 timestamp:v10 buttonEvent:0 clientInfo:v15 userInfo:v6 options:0];

  performer = self->_performer;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __64__SVXClientActivationService_deactivateWithUserInfo_completion___block_invoke;
  v20[3] = &unk_264554788;
  v20[4] = self;
  id v21 = v16;
  id v22 = v7;
  id v18 = v7;
  __int16 v19 = v16;
  [(SVXPerforming *)performer performBlock:v20];
}

void __64__SVXClientActivationService_deactivateWithUserInfo_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__SVXClientActivationService_deactivateWithUserInfo_completion___block_invoke_2;
  v5[3] = &unk_2645547D8;
  id v4 = *(id *)(a1 + 48);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _deactivateWithContext:v3 completion:v5];
}

void __64__SVXClientActivationService_deactivateWithUserInfo_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 8);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __64__SVXClientActivationService_deactivateWithUserInfo_completion___block_invoke_3;
    v3[3] = &unk_264553B00;
    id v4 = v1;
    [v2 performBlock:v3];
  }
}

uint64_t __64__SVXClientActivationService_deactivateWithUserInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activateWithSystemEvent:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = mach_absolute_time();
  id v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v22 = "-[SVXClientActivationService activateWithSystemEvent:userInfo:completion:]";
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s systemEvent = %@, userInfo = %@", buf, 0x20u);
  }
  if (_SVXClientActivationServiceValidateSystemEventForActivation(v8))
  {
    uint64_t v13 = [SVXActivationContext alloc];
    uint64_t v14 = SVXClientInfoGetCurrent();
    uint64_t v15 = [(SVXActivationContext *)v13 initWithSource:5 timestamp:v11 buttonEvent:0 systemEvent:v8 clientInfo:v14 requestInfo:0 userInfo:v9];

    performer = self->_performer;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __74__SVXClientActivationService_activateWithSystemEvent_userInfo_completion___block_invoke;
    v18[3] = &unk_264554788;
    v18[4] = self;
    __int16 v19 = v15;
    id v20 = v10;
    id v17 = v15;
    [(SVXPerforming *)performer performBlock:v18];
  }
}

void __74__SVXClientActivationService_activateWithSystemEvent_userInfo_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _requestPermissionToActivateWithContext:*(void *)(a1 + 40)])
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __74__SVXClientActivationService_activateWithSystemEvent_userInfo_completion___block_invoke_2;
    v5[3] = &unk_264553BF0;
    id v4 = *(id *)(a1 + 48);
    void v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    [v2 _activateWithContext:v3 completion:v5];
  }
}

void __74__SVXClientActivationService_activateWithSystemEvent_userInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __74__SVXClientActivationService_activateWithSystemEvent_userInfo_completion___block_invoke_3;
    v6[3] = &unk_2645547D8;
    id v8 = v4;
    id v7 = v3;
    [v5 performBlock:v6];
  }
}

uint64_t __74__SVXClientActivationService_activateWithSystemEvent_userInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)prewarmForSystemEvent:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = mach_absolute_time();
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "-[SVXClientActivationService prewarmForSystemEvent:completion:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s systemEvent = %@", buf, 0x16u);
  }
  if (_SVXClientActivationServiceValidateSystemEventForActivation(v6))
  {
    id v10 = [SVXActivationContext alloc];
    uint64_t v11 = SVXClientInfoGetCurrent();
    id v12 = [(SVXActivationContext *)v10 initWithSource:5 timestamp:v8 buttonEvent:0 systemEvent:v6 clientInfo:v11 requestInfo:0 userInfo:0];

    performer = self->_performer;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __63__SVXClientActivationService_prewarmForSystemEvent_completion___block_invoke;
    v15[3] = &unk_264554788;
    v15[4] = self;
    uint64_t v16 = v12;
    id v17 = v7;
    uint64_t v14 = v12;
    [(SVXPerforming *)performer performBlock:v15];
  }
}

void __63__SVXClientActivationService_prewarmForSystemEvent_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__SVXClientActivationService_prewarmForSystemEvent_completion___block_invoke_2;
  v5[3] = &unk_2645547D8;
  id v4 = *(id *)(a1 + 48);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _prewarmWithContext:v3 completion:v5];
}

void __63__SVXClientActivationService_prewarmForSystemEvent_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 8);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __63__SVXClientActivationService_prewarmForSystemEvent_completion___block_invoke_3;
    v3[3] = &unk_264553B00;
    id v4 = v1;
    [v2 performBlock:v3];
  }
}

uint64_t __63__SVXClientActivationService_prewarmForSystemEvent_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activateWithButtonEvent:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = mach_absolute_time();
  id v12 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v13 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v33 = "-[SVXClientActivationService activateWithButtonEvent:userInfo:completion:]";
    __int16 v34 = 2112;
    __int16 v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s buttonEvent = %@, userInfo = %@", buf, 0x20u);
  }
  uint64_t v14 = v8;
  uint64_t v15 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v33 = "_SVXClientActivationServiceValidateButtonEventForActivation";
    __int16 v34 = 2112;
    __int16 v35 = v14;
    _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s Validating button event %@ for activation...", buf, 0x16u);
  }
  if (v14)
  {
    if ([(__CFString *)v14 type] == 1)
    {
      if ([(__CFString *)v14 timestamp])
      {

        uint64_t v16 = [SVXActivationContext alloc];
        id v17 = SVXClientInfoGetCurrent();
        id v18 = [(SVXActivationContext *)v16 initWithSource:1 timestamp:v11 buttonEvent:v14 systemEvent:0 clientInfo:v17 requestInfo:0 userInfo:v9];

        performer = self->_performer;
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __74__SVXClientActivationService_activateWithButtonEvent_userInfo_completion___block_invoke;
        v29[3] = &unk_264554788;
        v29[4] = self;
        id v30 = v18;
        id v31 = v10;
        __int16 v20 = v18;
        [(SVXPerforming *)performer performBlock:v29];

        goto LABEL_16;
      }
      os_log_t v26 = *v12;
      __int16 v20 = (SVXActivationContext *)v14;
      if (!os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      __int16 v23 = v26;
      uint64_t v28 = [(__CFString *)v14 timestamp];
      *(_DWORD *)buf = 136315394;
      uint64_t v33 = "_SVXClientActivationServiceValidateButtonEventForActivation";
      __int16 v34 = 2048;
      __int16 v35 = (__CFString *)v28;
      _os_log_error_impl(&dword_220062000, v23, OS_LOG_TYPE_ERROR, "%s Rejected button event for activation because the timestamp is %llu.", buf, 0x16u);
    }
    else
    {
      os_log_t v22 = *v12;
      __int16 v20 = (SVXActivationContext *)v14;
      if (!os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      __int16 v23 = v22;
      unint64_t v24 = [(__CFString *)v14 type];
      if (v24 > 2) {
        __int16 v25 = @"(unknown)";
      }
      else {
        __int16 v25 = off_264553908[v24];
      }
      uint64_t v27 = v25;
      *(_DWORD *)buf = 136315394;
      uint64_t v33 = "_SVXClientActivationServiceValidateButtonEventForActivation";
      __int16 v34 = 2112;
      __int16 v35 = v27;
      _os_log_error_impl(&dword_220062000, v23, OS_LOG_TYPE_ERROR, "%s Rejected button event for activation because the type is %@.", buf, 0x16u);
    }
    __int16 v20 = (SVXActivationContext *)v14;
    goto LABEL_16;
  }
  id v21 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v33 = "_SVXClientActivationServiceValidateButtonEventForActivation";
    _os_log_error_impl(&dword_220062000, v21, OS_LOG_TYPE_ERROR, "%s Rejected button event for activation because it is nil.", buf, 0xCu);
  }
  __int16 v20 = 0;
LABEL_16:
}

void __74__SVXClientActivationService_activateWithButtonEvent_userInfo_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _requestPermissionToActivateWithContext:*(void *)(a1 + 40)])
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __74__SVXClientActivationService_activateWithButtonEvent_userInfo_completion___block_invoke_2;
    v5[3] = &unk_264553BF0;
    id v4 = *(id *)(a1 + 48);
    void v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    [v2 _activateWithContext:v3 completion:v5];
  }
}

void __74__SVXClientActivationService_activateWithButtonEvent_userInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __74__SVXClientActivationService_activateWithButtonEvent_userInfo_completion___block_invoke_3;
    v6[3] = &unk_2645547D8;
    id v8 = v4;
    id v7 = v3;
    [v5 performBlock:v6];
  }
}

uint64_t __74__SVXClientActivationService_activateWithButtonEvent_userInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)activateWithText:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = mach_absolute_time();
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v21 = "-[SVXClientActivationService activateWithText:completion:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s text = %@", buf, 0x16u);
  }
  id v10 = objc_alloc_init(MEMORY[0x263F285B0]);
  [v10 setText:v6];
  uint64_t v11 = [SVXActivationContext alloc];
  id v12 = SVXClientInfoGetCurrent();
  uint64_t v13 = [(SVXActivationContext *)v11 initWithSource:2 timestamp:v8 buttonEvent:0 systemEvent:0 clientInfo:v12 requestInfo:v10 userInfo:0];

  performer = self->_performer;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__SVXClientActivationService_activateWithText_completion___block_invoke;
  v17[3] = &unk_264554788;
  v17[4] = self;
  id v18 = v13;
  id v19 = v7;
  id v15 = v7;
  uint64_t v16 = v13;
  [(SVXPerforming *)performer performBlock:v17];
}

void __58__SVXClientActivationService_activateWithText_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _requestPermissionToActivateWithContext:*(void *)(a1 + 40)])
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __58__SVXClientActivationService_activateWithText_completion___block_invoke_2;
    v5[3] = &unk_264553BF0;
    id v4 = *(id *)(a1 + 48);
    void v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    [v2 _activateWithContext:v3 completion:v5];
  }
}

void __58__SVXClientActivationService_activateWithText_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__SVXClientActivationService_activateWithText_completion___block_invoke_3;
    v6[3] = &unk_2645547D8;
    id v8 = v4;
    id v7 = v3;
    [v5 performBlock:v6];
  }
}

uint64_t __58__SVXClientActivationService_activateWithText_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)activateWithUserInfo:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = mach_absolute_time();
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v20 = "-[SVXClientActivationService activateWithUserInfo:completion:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  id v10 = [SVXActivationContext alloc];
  uint64_t v11 = SVXClientInfoGetCurrent();
  id v12 = [(SVXActivationContext *)v10 initWithSource:2 timestamp:v8 buttonEvent:0 systemEvent:0 clientInfo:v11 requestInfo:0 userInfo:v6];

  performer = self->_performer;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__SVXClientActivationService_activateWithUserInfo_completion___block_invoke;
  v16[3] = &unk_264554788;
  v16[4] = self;
  id v17 = v12;
  id v18 = v7;
  id v14 = v7;
  id v15 = v12;
  [(SVXPerforming *)performer performBlock:v16];
}

void __62__SVXClientActivationService_activateWithUserInfo_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _requestPermissionToActivateWithContext:*(void *)(a1 + 40)])
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __62__SVXClientActivationService_activateWithUserInfo_completion___block_invoke_2;
    v5[3] = &unk_264553BF0;
    id v4 = *(id *)(a1 + 48);
    void v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    [v2 _activateWithContext:v3 completion:v5];
  }
}

void __62__SVXClientActivationService_activateWithUserInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__SVXClientActivationService_activateWithUserInfo_completion___block_invoke_3;
    v6[3] = &unk_2645547D8;
    id v8 = v4;
    id v7 = v3;
    [v5 performBlock:v6];
  }
}

uint64_t __62__SVXClientActivationService_activateWithUserInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)enqueueButtonEvent:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  id v6 = (os_log_t *)MEMORY[0x263F28348];
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v30 = "-[SVXClientActivationService enqueueButtonEvent:]";
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v4;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s buttonEvent = %@", buf, 0x16u);
  }
  uint64_t v8 = [v4 type];
  if (v8 == 2)
  {
    uint64_t v17 = [v4 timestamp];
    if (v17) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = v5;
    }
    id v19 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v30 = "-[SVXClientActivationService enqueueButtonEvent:]";
      __int16 v31 = 2048;
      uint64_t v32 = v18;
      _os_log_debug_impl(&dword_220062000, v19, OS_LOG_TYPE_DEBUG, "%s SVXButtonEventTypeUp: time = %lld", buf, 0x16u);
    }
    analytics = self->_analytics;
    uint64_t v21 = [v4 timestamp];
    if (v21) {
      uint64_t v14 = v21;
    }
    else {
      uint64_t v14 = v18;
    }
    id v15 = analytics;
    uint64_t v16 = 1411;
    goto LABEL_23;
  }
  if (v8 == 1)
  {
    uint64_t v9 = [v4 timestamp];
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = v5;
    }
    uint64_t v11 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v30 = "-[SVXClientActivationService enqueueButtonEvent:]";
      __int16 v31 = 2048;
      uint64_t v32 = v10;
      _os_log_debug_impl(&dword_220062000, v11, OS_LOG_TYPE_DEBUG, "%s SVXButtonEventTypeDown: time = %lld", buf, 0x16u);
    }
    id v12 = self->_analytics;
    uint64_t v13 = [v4 timestamp];
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v10;
    }
    id v15 = v12;
    uint64_t v16 = 1410;
LABEL_23:
    [(AFAnalytics *)v15 logEventWithType:v16 machAbsoluteTime:v14 context:0];
    goto LABEL_26;
  }
  os_log_t v22 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
  {
    __int16 v25 = v22;
    uint64_t v26 = [v4 type];
    *(_DWORD *)buf = 136315394;
    id v30 = "-[SVXClientActivationService enqueueButtonEvent:]";
    __int16 v31 = 2048;
    uint64_t v32 = v26;
    _os_log_debug_impl(&dword_220062000, v25, OS_LOG_TYPE_DEBUG, "%s Unspecified or unknown button event = %ld", buf, 0x16u);
  }
LABEL_26:
  performer = self->_performer;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __49__SVXClientActivationService_enqueueButtonEvent___block_invoke;
  v27[3] = &unk_2645548C8;
  v27[4] = self;
  id v28 = v4;
  id v24 = v4;
  [(SVXPerforming *)performer performBlock:v27];
}

uint64_t __49__SVXClientActivationService_enqueueButtonEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueButtonEvent:*(void *)(a1 + 40)];
}

- (void)handleButtonEvent:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[SVXClientActivationService handleButtonEvent:]";
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s This SPI has been deprecated, please use -enqueueButtonEvent: instead.", (uint8_t *)&v4, 0xCu);
  }
}

- (SVXClientActivationService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SVXClientActivationService;
  id v12 = [(SVXClientActivationService *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_performer, a5);
    objc_storeStrong((id *)&v13->_clientServiceProvider, a3);
    objc_storeStrong((id *)&v13->_analytics, a4);
  }

  return v13;
}

- (void)handleDidDeactivateWithContext:(id)a3
{
  id v4 = a3;
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__SVXClientActivationService_handleDidDeactivateWithContext___block_invoke;
  v7[3] = &unk_2645548C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SVXPerforming *)performer performBlock:v7];
}

void __61__SVXClientActivationService_handleDidDeactivateWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained clientActivationService:*(void *)(a1 + 32) didDeactivateWithContext:*(void *)(a1 + 40)];
}

- (void)handleWillDeactivateWithContext:(id)a3
{
  id v4 = a3;
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__SVXClientActivationService_handleWillDeactivateWithContext___block_invoke;
  v7[3] = &unk_2645548C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SVXPerforming *)performer performBlock:v7];
}

void __62__SVXClientActivationService_handleWillDeactivateWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained clientActivationService:*(void *)(a1 + 32) willDeactivateWithContext:*(void *)(a1 + 40)];
}

- (void)handleDidNotActivateWithContext:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  performer = self->_performer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__SVXClientActivationService_handleDidNotActivateWithContext_error___block_invoke;
  v11[3] = &unk_2645547B0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(SVXPerforming *)performer performBlock:v11];
}

void __68__SVXClientActivationService_handleDidNotActivateWithContext_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopPreheatTimer];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained clientActivationService:*(void *)(a1 + 32) didNotActivateWithContext:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)handleDidActivateWithContext:(id)a3
{
  id v4 = a3;
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__SVXClientActivationService_handleDidActivateWithContext___block_invoke;
  v7[3] = &unk_2645548C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SVXPerforming *)performer performBlock:v7];
}

void __59__SVXClientActivationService_handleDidActivateWithContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopPreheatTimer];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained clientActivationService:*(void *)(a1 + 32) didActivateWithContext:*(void *)(a1 + 40)];
}

- (void)handleWillActivateWithContext:(id)a3
{
  id v4 = a3;
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__SVXClientActivationService_handleWillActivateWithContext___block_invoke;
  v7[3] = &unk_2645548C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SVXPerforming *)performer performBlock:v7];
}

void __60__SVXClientActivationService_handleWillActivateWithContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopPreheatTimer];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained clientActivationService:*(void *)(a1 + 32) willActivateWithContext:*(void *)(a1 + 40)];
}

- (void)handleRequestPermissionToActivateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  performer = self->_performer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__SVXClientActivationService_handleRequestPermissionToActivateWithContext_completion___block_invoke;
  v11[3] = &unk_264554788;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(SVXPerforming *)performer performBlock:v11];
}

uint64_t __86__SVXClientActivationService_handleRequestPermissionToActivateWithContext_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _requestPermissionToActivateWithContext:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end