@interface SVXClientSessionService
- (SVXClientSessionService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5;
- (SVXClientSessionServiceDelegate)delegate;
- (int64_t)currentState;
- (void)_setCurrentState:(int64_t)a3;
- (void)clientServiceDidChange:(BOOL)a3;
- (void)fetchAlarmAndTimerFiringContextWithCompletion:(id)a3;
- (void)fetchStateWithCompletion:(id)a3;
- (void)handleDidBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4;
- (void)handleDidChangeStateFrom:(int64_t)a3 to:(int64_t)a4;
- (void)handleDidResignActiveWithDeactivationContext:(id)a3;
- (void)handleDidStartSoundWithID:(int64_t)a3;
- (void)handleDidStopSoundWithID:(int64_t)a3 error:(id)a4;
- (void)handleWillBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4;
- (void)handleWillChangeStateFrom:(int64_t)a3 to:(int64_t)a4;
- (void)handleWillPresentFeedbackWithDialogIdentifier:(id)a3;
- (void)handleWillResignActiveWithOptions:(unint64_t)a3 duration:(double)a4;
- (void)handleWillStartSoundWithID:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SVXClientSessionService

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);

  objc_storeStrong((id *)&self->_performer, 0);
}

- (void)setDelegate:(id)a3
{
}

- (SVXClientSessionServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SVXClientSessionServiceDelegate *)WeakRetained;
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
    v22 = "-[SVXClientSessionService _setCurrentState:]";
    __int16 v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s int64_t currentState = %@", (uint8_t *)&v21, 0x16u);
  }
  int64_t currentState = self->_currentState;
  if (currentState != a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sessionService:self willChangeStateFrom:currentState to:a3];

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
      v22 = "-[SVXClientSessionService _setCurrentState:]";
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
      v22 = "-[SVXClientSessionService _setCurrentState:]";
      __int16 v23 = 2112;
      v24 = v19;
      _os_log_impl(&dword_220062000, v17, OS_LOG_TYPE_INFO, "%s _int64_t currentState = %@", (uint8_t *)&v21, 0x16u);
    }
    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    [v20 sessionService:self didChangeStateFrom:currentState to:a3];
  }
}

- (void)fetchAlarmAndTimerFiringContextWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v13 = "-[SVXClientSessionService fetchAlarmAndTimerFiringContextWithCompletion:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  clientServiceProvider = self->_clientServiceProvider;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__SVXClientSessionService_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke;
  v10[3] = &unk_264553680;
  id v11 = v4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__SVXClientSessionService_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_25;
  v8[3] = &unk_264553998;
  id v9 = v11;
  id v7 = v11;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v10 errorHandler:v8];
}

void __73__SVXClientSessionService_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __73__SVXClientSessionService_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_2;
  v3[3] = &unk_2645536A8;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchAlarmAndTimerFiringContextWithCompletion:v3];
}

void __73__SVXClientSessionService_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientSessionService fetchAlarmAndTimerFiringContextWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void __73__SVXClientSessionService_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (os_log_t *)MEMORY[0x263F28348];
  if (v6
    && (__int16 v8 = *MEMORY[0x263F28348], os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)))
  {
    int v11 = 136315394;
    v12 = "-[SVXClientSessionService fetchAlarmAndTimerFiringContextWithCompletion:]_block_invoke_2";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_error_impl(&dword_220062000, v8, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v11, 0x16u);
    if (!v5) {
      goto LABEL_6;
    }
  }
  else if (!v5)
  {
    goto LABEL_6;
  }
  id v9 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "-[SVXClientSessionService fetchAlarmAndTimerFiringContextWithCompletion:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s alarmAndTimerFiringContext = %@", (uint8_t *)&v11, 0x16u);
  }
LABEL_6:
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v5);
  }
}

- (void)fetchStateWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v13 = "-[SVXClientSessionService fetchStateWithCompletion:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  clientServiceProvider = self->_clientServiceProvider;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke;
  v10[3] = &unk_264553850;
  void v10[4] = self;
  id v11 = v4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke_4;
  v8[3] = &unk_264553998;
  id v9 = v11;
  id v7 = v11;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v10 errorHandler:v8];
}

void __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke_2;
  v4[3] = &unk_264553828;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 fetchSessionStateWithCompletion:v4];
}

void __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientSessionService fetchStateWithCompletion:]_block_invoke_4";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3) {
    a2 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(v5 + 8);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke_3;
  v8[3] = &unk_264554650;
  void v8[4] = v5;
  uint64_t v10 = a2;
  id v9 = *(id *)(a1 + 40);
  id v7 = a3;
  [v6 performBlock:v8];
}

uint64_t __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _setCurrentState:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)clientServiceDidChange:(BOOL)a3
{
  [(SVXClientSessionService *)self fetchStateWithCompletion:0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__SVXClientSessionService_clientServiceDidChange___block_invoke;
  v11[3] = &unk_2645545B8;
  v11[4] = self;
  id v4 = (void *)MEMORY[0x223C65C40](v11);
  clientServiceProvider = self->_clientServiceProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__SVXClientSessionService_clientServiceDidChange___block_invoke_3;
  v9[3] = &unk_264553680;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__SVXClientSessionService_clientServiceDidChange___block_invoke_20;
  v7[3] = &unk_264553998;
  id v8 = v10;
  id v6 = v10;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v9 errorHandler:v7];
}

uint64_t __50__SVXClientSessionService_clientServiceDidChange___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__SVXClientSessionService_clientServiceDidChange___block_invoke_2;
  v5[3] = &unk_264553AD8;
  v5[4] = v2;
  char v6 = a2;
  return [v3 performBlock:v5];
}

void __50__SVXClientSessionService_clientServiceDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__SVXClientSessionService_clientServiceDidChange___block_invoke_4;
  v3[3] = &unk_264553658;
  id v4 = *(id *)(a1 + 32);
  [a2 fetchSessionActivityStateWithCompletion:v3];
}

void __50__SVXClientSessionService_clientServiceDidChange___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    char v6 = "-[SVXClientSessionService clientServiceDidChange:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__SVXClientSessionService_clientServiceDidChange___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    int v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      __int16 v7 = "-[SVXClientSessionService clientServiceDidChange:]_block_invoke_4";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__SVXClientSessionService_clientServiceDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 24) != v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 40));
    if (v2)
    {
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
        [v6 sessionService:*(void *)(a1 + 32) didBecomeActiveWithActivationContext:0];
LABEL_7:
      }
    }
    else
    {
      int v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
        [v6 sessionService:*(void *)(a1 + 32) didResignActiveWithDeactivationContext:0];
        goto LABEL_7;
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = *(unsigned char *)(a1 + 40);
  }
}

- (SVXClientSessionService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SVXClientSessionService;
  uint64_t v10 = [(SVXClientSessionService *)&v13 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_performer, a5);
    objc_storeStrong((id *)&v11->_clientServiceProvider, a3);
  }

  return v11;
}

- (void)handleDidResignActiveWithDeactivationContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SVXClientSessionService handleDidResignActiveWithDeactivationContext:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s deactivationContext = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__SVXClientSessionService_handleDidResignActiveWithDeactivationContext___block_invoke;
  v8[3] = &unk_2645548C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

void __72__SVXClientSessionService_handleDidResignActiveWithDeactivationContext___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 0;
  }
  else
  {
    id v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[SVXClientSessionService handleDidResignActiveWithDeactivationContext:]_block_invoke";
      _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s Client session activity state is inactive when end resigning active.", (uint8_t *)&v7, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v6 sessionService:*(void *)(a1 + 32) didResignActiveWithDeactivationContext:*(void *)(a1 + 40)];
  }
}

- (void)handleWillResignActiveWithOptions:(unint64_t)a3 duration:(double)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    uint64_t v9 = SVXSessionResignActiveOptionsGetNames(a3);
    *(_DWORD *)buf = 136315650;
    id v13 = "-[SVXClientSessionService handleWillResignActiveWithOptions:duration:]";
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2048;
    double v17 = a4;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s options = %@, duration = %f", buf, 0x20u);
  }
  performer = self->_performer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__SVXClientSessionService_handleWillResignActiveWithOptions_duration___block_invoke;
  v11[3] = &unk_264554760;
  v11[4] = self;
  void v11[5] = a3;
  *(double *)&v11[6] = a4;
  [(SVXPerforming *)performer performBlock:v11];
}

void __70__SVXClientSessionService_handleWillResignActiveWithOptions_duration___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 24))
  {
    id v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[SVXClientSessionService handleWillResignActiveWithOptions:duration:]_block_invoke";
      _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s Client session activity state is inactive when begin resigning active.", (uint8_t *)&v5, 0xCu);
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 40));
  [WeakRetained sessionService:*(void *)(a1 + 32) willResignActiveWithOptions:*(void *)(a1 + 40) duration:*(double *)(a1 + 48)];
}

- (void)handleDidBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[SVXClientSessionService handleDidBecomeActiveWithActivationContext:turnID:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s activationContext = %@, turnID = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__SVXClientSessionService_handleDidBecomeActiveWithActivationContext_turnID___block_invoke;
  v12[3] = &unk_2645547B0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SVXPerforming *)performer performBlock:v12];
}

void __77__SVXClientSessionService_handleDidBecomeActiveWithActivationContext_turnID___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 24))
  {
    id v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "-[SVXClientSessionService handleDidBecomeActiveWithActivationContext:turnID:]_block_invoke";
      _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s Client session activity state is active when end becoming active.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    *(unsigned char *)(v2 + 24) = 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  char v5 = objc_opt_respondsToSelector();

  id v6 = objc_loadWeakRetained((id *)(a1[4] + 40));
  id v7 = v6;
  if (v5)
  {
    [v6 sessionService:a1[4] didBecomeActiveWithActivationContext:a1[5] turnID:a1[6]];
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      return;
    }
    id v7 = objc_loadWeakRetained((id *)(a1[4] + 40));
    [v7 sessionService:a1[4] didBecomeActiveWithActivationContext:a1[5]];
  }
}

- (void)handleWillBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[SVXClientSessionService handleWillBecomeActiveWithActivationContext:turnID:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s activationContext = %@, turnID = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__SVXClientSessionService_handleWillBecomeActiveWithActivationContext_turnID___block_invoke;
  v12[3] = &unk_2645547B0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SVXPerforming *)performer performBlock:v12];
}

void __78__SVXClientSessionService_handleWillBecomeActiveWithActivationContext_turnID___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 24))
  {
    id v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "-[SVXClientSessionService handleWillBecomeActiveWithActivationContext:turnID:]_block_invoke";
      _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s Client session activity state is active when begin becoming active.", (uint8_t *)&v9, 0xCu);
      uint64_t v2 = a1[4];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 40));
  char v5 = objc_opt_respondsToSelector();

  id v6 = objc_loadWeakRetained((id *)(a1[4] + 40));
  id v7 = v6;
  if (v5)
  {
    [v6 sessionService:a1[4] willBecomeActiveWithActivationContext:a1[5] turnID:a1[6]];
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      return;
    }
    id v7 = objc_loadWeakRetained((id *)(a1[4] + 40));
    [v7 sessionService:a1[4] willBecomeActiveWithActivationContext:a1[5]];
  }
}

- (void)handleDidStopSoundWithID:(int64_t)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    char v8 = v7;
    if ((unint64_t)a3 > 6) {
      int v9 = @"(unknown)";
    }
    else {
      int v9 = off_2645530B0[a3];
    }
    id v10 = v9;
    *(_DWORD *)buf = 136315650;
    __int16 v17 = "-[SVXClientSessionService handleDidStopSoundWithID:error:]";
    __int16 v18 = 2112;
    __int16 v19 = v10;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s soundID = %@, error = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__SVXClientSessionService_handleDidStopSoundWithID_error___block_invoke;
  v13[3] = &unk_264554738;
  id v14 = v6;
  int64_t v15 = a3;
  v13[4] = self;
  id v12 = v6;
  [(SVXPerforming *)performer performBlock:v13];
}

void __58__SVXClientSessionService_handleDidStopSoundWithID_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1[4] + 40));
    [v4 sessionService:a1[4] didStopSoundWithID:a1[6] error:a1[5]];
  }
}

- (void)handleDidStartSoundWithID:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    if ((unint64_t)a3 > 6) {
      id v7 = @"(unknown)";
    }
    else {
      id v7 = off_2645530B0[a3];
    }
    char v8 = v7;
    *(_DWORD *)buf = 136315394;
    id v12 = "-[SVXClientSessionService handleDidStartSoundWithID:]";
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s soundID = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__SVXClientSessionService_handleDidStartSoundWithID___block_invoke;
  v10[3] = &unk_264554548;
  void v10[4] = self;
  void v10[5] = a3;
  [(SVXPerforming *)performer performBlock:v10];
}

void __53__SVXClientSessionService_handleDidStartSoundWithID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v4 sessionService:*(void *)(a1 + 32) didStartSoundWithID:*(void *)(a1 + 40)];
  }
}

- (void)handleWillStartSoundWithID:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    if ((unint64_t)a3 > 6) {
      id v7 = @"(unknown)";
    }
    else {
      id v7 = off_2645530B0[a3];
    }
    char v8 = v7;
    *(_DWORD *)buf = 136315394;
    id v12 = "-[SVXClientSessionService handleWillStartSoundWithID:]";
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s soundID = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__SVXClientSessionService_handleWillStartSoundWithID___block_invoke;
  v10[3] = &unk_264554548;
  void v10[4] = self;
  void v10[5] = a3;
  [(SVXPerforming *)performer performBlock:v10];
}

void __54__SVXClientSessionService_handleWillStartSoundWithID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v4 sessionService:*(void *)(a1 + 32) willStartSoundWithID:*(void *)(a1 + 40)];
  }
}

- (void)handleWillPresentFeedbackWithDialogIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[SVXClientSessionService handleWillPresentFeedbackWithDialogIdentifier:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s dialogIdentifier = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__SVXClientSessionService_handleWillPresentFeedbackWithDialogIdentifier___block_invoke;
  v8[3] = &unk_2645548C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

void __73__SVXClientSessionService_handleWillPresentFeedbackWithDialogIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained sessionService:*(void *)(a1 + 32) willPresentFeedbackWithDialogIdentifier:*(void *)(a1 + 40)];
}

- (void)handleDidChangeStateFrom:(int64_t)a3 to:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    char v8 = v7;
    if ((unint64_t)a3 > 4) {
      id v9 = @"(unknown)";
    }
    else {
      id v9 = off_2645542F8[a3];
    }
    id v10 = v9;
    if ((unint64_t)a4 > 4) {
      uint64_t v11 = @"(unknown)";
    }
    else {
      uint64_t v11 = off_2645542F8[a4];
    }
    __int16 v12 = v11;
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[SVXClientSessionService handleDidChangeStateFrom:to:]";
    __int16 v17 = 2112;
    __int16 v18 = v10;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__SVXClientSessionService_handleDidChangeStateFrom_to___block_invoke;
  v14[3] = &unk_264554760;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  [(SVXPerforming *)performer performBlock:v14];
}

uint64_t __55__SVXClientSessionService_handleDidChangeStateFrom_to___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[4];
  unint64_t v3 = v2[4];
  if (v3 == a1[5])
  {
    id v4 = (NSObject **)MEMORY[0x263F28348];
    char v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      id v6 = v5;
      if (v3 > 4) {
        id v7 = @"(unknown)";
      }
      else {
        id v7 = off_2645542F8[v3];
      }
      char v8 = v7;
      int v15 = 136315394;
      __int16 v16 = "-[SVXClientSessionService handleDidChangeStateFrom:to:]_block_invoke";
      __int16 v17 = 2112;
      __int16 v18 = v8;
      _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s _int64_t currentState = %@", (uint8_t *)&v15, 0x16u);

      uint64_t v2 = (void *)a1[4];
      char v5 = *v4;
    }
    v2[4] = a1[6];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = *(void *)(a1[4] + 32);
      id v10 = v5;
      if (v9 > 4) {
        uint64_t v11 = @"(unknown)";
      }
      else {
        uint64_t v11 = off_2645542F8[v9];
      }
      __int16 v12 = v11;
      int v15 = 136315394;
      __int16 v16 = "-[SVXClientSessionService handleDidChangeStateFrom:to:]_block_invoke";
      __int16 v17 = 2112;
      __int16 v18 = v12;
      _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s _int64_t currentState = %@", (uint8_t *)&v15, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
    [WeakRetained sessionService:a1[4] didChangeStateFrom:a1[5] to:a1[6]];

    uint64_t v2 = (void *)a1[4];
  }
  return [v2 _setCurrentState:a1[6]];
}

- (void)handleWillChangeStateFrom:(int64_t)a3 to:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    char v8 = v7;
    if ((unint64_t)a3 > 4) {
      unint64_t v9 = @"(unknown)";
    }
    else {
      unint64_t v9 = off_2645542F8[a3];
    }
    id v10 = v9;
    if ((unint64_t)a4 > 4) {
      uint64_t v11 = @"(unknown)";
    }
    else {
      uint64_t v11 = off_2645542F8[a4];
    }
    __int16 v12 = v11;
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[SVXClientSessionService handleWillChangeStateFrom:to:]";
    __int16 v17 = 2112;
    __int16 v18 = v10;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__SVXClientSessionService_handleWillChangeStateFrom_to___block_invoke;
  v14[3] = &unk_264554760;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  [(SVXPerforming *)performer performBlock:v14];
}

void __56__SVXClientSessionService_handleWillChangeStateFrom_to___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setCurrentState:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32) == *(void *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 40));
    [WeakRetained sessionService:*(void *)(a1 + 32) willChangeStateFrom:*(void *)(a1 + 40) to:*(void *)(a1 + 48)];
  }
}

@end