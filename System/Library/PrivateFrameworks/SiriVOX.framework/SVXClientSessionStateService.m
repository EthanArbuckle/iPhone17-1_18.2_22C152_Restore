@interface SVXClientSessionStateService
- (SVXClientSessionStateService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5;
- (SVXClientSessionStateServiceDelegate)delegate;
- (int64_t)currentState;
- (void)_setCurrentState:(int64_t)a3;
- (void)clientServiceDidChange:(BOOL)a3;
- (void)fetchStateWithCompletion:(id)a3;
- (void)handleDidChangeSessionStateFrom:(int64_t)a3 to:(int64_t)a4;
- (void)handleWillChangeSessionStateFrom:(int64_t)a3 to:(int64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SVXClientSessionStateService

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);

  objc_storeStrong((id *)&self->_performer, 0);
}

- (void)setDelegate:(id)a3
{
}

- (SVXClientSessionStateServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SVXClientSessionStateServiceDelegate *)WeakRetained;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)_setCurrentState:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v5 = (os_log_t *)MEMORY[0x263F28348];
  v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    if ((unint64_t)a3 > 4) {
      v8 = @"(unknown)";
    }
    else {
      v8 = off_2645542F8[a3];
    }
    v9 = v8;
    int v21 = 136315394;
    v22 = "-[SVXClientSessionStateService _setCurrentState:]";
    __int16 v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s int64_t currentState = %@", (uint8_t *)&v21, 0x16u);
  }
  int64_t currentState = self->_currentState;
  if (currentState != a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sessionStateService:self willChangeStateFrom:currentState to:a3];

    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v13 = self->_currentState;
      v14 = v12;
      if (v13 > 4) {
        v15 = @"(unknown)";
      }
      else {
        v15 = off_2645542F8[v13];
      }
      v16 = v15;
      int v21 = 136315394;
      v22 = "-[SVXClientSessionStateService _setCurrentState:]";
      __int16 v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_220062000, v14, OS_LOG_TYPE_INFO, "%s _int64_t currentState = %@", (uint8_t *)&v21, 0x16u);

      v12 = *v5;
    }
    self->_int64_t currentState = a3;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v17 = v12;
      if ((unint64_t)a3 > 4) {
        v18 = @"(unknown)";
      }
      else {
        v18 = off_2645542F8[a3];
      }
      v19 = v18;
      int v21 = 136315394;
      v22 = "-[SVXClientSessionStateService _setCurrentState:]";
      __int16 v23 = 2112;
      v24 = v19;
      _os_log_impl(&dword_220062000, v17, OS_LOG_TYPE_INFO, "%s _int64_t currentState = %@", (uint8_t *)&v21, 0x16u);
    }
    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    [v20 sessionStateService:self didChangeStateFrom:currentState to:a3];
  }
}

- (void)fetchStateWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v13 = "-[SVXClientSessionStateService fetchStateWithCompletion:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  clientServiceProvider = self->_clientServiceProvider;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke;
  v10[3] = &unk_264553850;
  v10[4] = self;
  id v11 = v4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke_4;
  v8[3] = &unk_264553BF0;
  v8[4] = self;
  id v9 = v11;
  id v7 = v11;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v10 errorHandler:v8];
}

void __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke_2;
  v4[3] = &unk_264553828;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 fetchSessionStateWithCompletion:v4];
}

void __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[SVXClientSessionStateService fetchStateWithCompletion:]_block_invoke_4";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
  }
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke_3;
  v6[3] = &unk_264553B00;
  id v7 = *(id *)(a1 + 40);
  [v5 performBlock:v6];
}

uint64_t __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

{
  uint64_t result;
  uint64_t (*v3)(void);
  uint64_t vars8;

  [*(id *)(a1 + 32) _setCurrentState:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3) {
    a2 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke_3;
  v8[3] = &unk_264554650;
  v8[4] = v5;
  uint64_t v10 = a2;
  id v9 = *(id *)(a1 + 40);
  id v7 = a3;
  [v6 performBlock:v8];
}

- (void)clientServiceDidChange:(BOOL)a3
{
}

- (SVXClientSessionStateService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SVXClientSessionStateService;
  uint64_t v10 = [(SVXClientSessionStateService *)&v13 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_performer, a5);
    objc_storeStrong((id *)&v11->_clientServiceProvider, a3);
  }

  return v11;
}

- (void)handleDidChangeSessionStateFrom:(int64_t)a3 to:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    if ((unint64_t)a3 > 4) {
      id v9 = @"(unknown)";
    }
    else {
      id v9 = off_2645542F8[a3];
    }
    uint64_t v10 = v9;
    if ((unint64_t)a4 > 4) {
      id v11 = @"(unknown)";
    }
    else {
      id v11 = off_2645542F8[a4];
    }
    uint64_t v12 = v11;
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXClientSessionStateService handleDidChangeSessionStateFrom:to:]";
    __int16 v17 = 2112;
    v18 = v10;
    __int16 v19 = 2112;
    id v20 = v12;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__SVXClientSessionStateService_handleDidChangeSessionStateFrom_to___block_invoke;
  v14[3] = &unk_264554760;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  [(SVXPerforming *)performer performBlock:v14];
}

uint64_t __67__SVXClientSessionStateService_handleDidChangeSessionStateFrom_to___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  unint64_t v3 = v2[3];
  if (v3 == a1[5])
  {
    id v4 = (NSObject **)MEMORY[0x263F28348];
    uint64_t v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      if (v3 > 4) {
        id v7 = @"(unknown)";
      }
      else {
        id v7 = off_2645542F8[v3];
      }
      id v8 = v7;
      int v15 = 136315394;
      v16 = "-[SVXClientSessionStateService handleDidChangeSessionStateFrom:to:]_block_invoke";
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s _int64_t currentState = %@", (uint8_t *)&v15, 0x16u);

      v2 = (void *)a1[4];
      uint64_t v5 = *v4;
    }
    v2[3] = a1[6];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = *(void *)(a1[4] + 24);
      uint64_t v10 = v5;
      if (v9 > 4) {
        id v11 = @"(unknown)";
      }
      else {
        id v11 = off_2645542F8[v9];
      }
      uint64_t v12 = v11;
      int v15 = 136315394;
      v16 = "-[SVXClientSessionStateService handleDidChangeSessionStateFrom:to:]_block_invoke";
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s _int64_t currentState = %@", (uint8_t *)&v15, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
    [WeakRetained sessionStateService:a1[4] didChangeStateFrom:a1[5] to:a1[6]];

    v2 = (void *)a1[4];
  }
  return [v2 _setCurrentState:a1[6]];
}

- (void)handleWillChangeSessionStateFrom:(int64_t)a3 to:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    if ((unint64_t)a3 > 4) {
      unint64_t v9 = @"(unknown)";
    }
    else {
      unint64_t v9 = off_2645542F8[a3];
    }
    uint64_t v10 = v9;
    if ((unint64_t)a4 > 4) {
      id v11 = @"(unknown)";
    }
    else {
      id v11 = off_2645542F8[a4];
    }
    uint64_t v12 = v11;
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXClientSessionStateService handleWillChangeSessionStateFrom:to:]";
    __int16 v17 = 2112;
    v18 = v10;
    __int16 v19 = 2112;
    id v20 = v12;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__SVXClientSessionStateService_handleWillChangeSessionStateFrom_to___block_invoke;
  v14[3] = &unk_264554760;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  [(SVXPerforming *)performer performBlock:v14];
}

void __68__SVXClientSessionStateService_handleWillChangeSessionStateFrom_to___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setCurrentState:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 24) == *(void *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
    [WeakRetained sessionStateService:*(void *)(a1 + 32) willChangeStateFrom:*(void *)(a1 + 40) to:*(void *)(a1 + 48)];
  }
}

@end