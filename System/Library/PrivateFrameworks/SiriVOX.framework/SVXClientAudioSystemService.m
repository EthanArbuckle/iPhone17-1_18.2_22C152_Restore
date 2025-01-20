@interface SVXClientAudioSystemService
- (SVXClientAudioSystemService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5;
- (SVXClientAudioSystemServiceDelegate)delegate;
- (void)handleAudioSessionDidBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5;
- (void)handleAudioSessionIDDidChange:(unsigned int)a3;
- (void)handleAudioSessionWillBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation SVXClientAudioSystemService

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);

  objc_storeStrong((id *)&self->_performer, 0);
}

- (void)setDelegate:(id)a3
{
}

- (SVXClientAudioSystemServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SVXClientAudioSystemServiceDelegate *)WeakRetained;
}

- (SVXClientAudioSystemService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SVXClientAudioSystemService;
  v10 = [(SVXClientAudioSystemService *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_performer, a5);
    objc_storeStrong((id *)&v11->_clientServiceProvider, a3);
  }

  return v11;
}

- (void)handleAudioSessionIDDidChange:(unsigned int)a3
{
  performer = self->_performer;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__SVXClientAudioSystemService_handleAudioSessionIDDidChange___block_invoke;
  v4[3] = &unk_264554A08;
  v4[4] = self;
  unsigned int v5 = a3;
  [(SVXPerforming *)performer performBlock:v4];
}

void __61__SVXClientAudioSystemService_handleAudioSessionIDDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v4 audioSystemService:*(void *)(a1 + 32) audioSessionIDDidChange:*(unsigned int *)(a1 + 40)];
  }
}

- (void)handleAudioSessionDidBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  performer = self->_performer;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __103__SVXClientAudioSystemService_handleAudioSessionDidBecomeActive_activationContext_deactivationContext___block_invoke;
  v13[3] = &unk_2645549E0;
  BOOL v17 = a3;
  id v14 = v8;
  id v15 = v9;
  v16 = self;
  id v11 = v9;
  id v12 = v8;
  [(SVXPerforming *)performer performBlock:v13];
}

void __103__SVXClientAudioSystemService_handleAudioSessionDidBecomeActive_activationContext_deactivationContext___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = (os_log_t *)MEMORY[0x263F28348];
  char v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v19 = 136315906;
    v20 = "-[SVXClientAudioSystemService handleAudioSessionDidBecomeActive:activationContext:deactivationContext:]_block_invoke";
    __int16 v21 = 1024;
    int v22 = v4;
    __int16 v23 = 2112;
    uint64_t v24 = v5;
    __int16 v25 = 2112;
    uint64_t v26 = v6;
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s flag = %d, activationContext = %@, deactivationContext = %@", (uint8_t *)&v19, 0x26u);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  int v8 = *(unsigned __int8 *)(v7 + 24);
  int v9 = *(unsigned __int8 *)(a1 + 56);
  if (v8 == v9)
  {
    v10 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      v20 = "-[SVXClientAudioSystemService handleAudioSessionDidBecomeActive:activationContext:deactivationContext:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = v8;
      _os_log_error_impl(&dword_220062000, v10, OS_LOG_TYPE_ERROR, "%s _isAudioSessionActive = %d, no need to deliver the delegate callbacka again.", (uint8_t *)&v19, 0x12u);
    }
  }
  else
  {
    *(unsigned char *)(v7 + 24) = v9;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 32));
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 32));
      [v13 audioSystemService:*(void *)(a1 + 48) audioSessionDidBecomeActive:*(unsigned __int8 *)(a1 + 56)];
    }
    int v14 = *(unsigned __int8 *)(a1 + 56);
    id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 32));
    if (v14)
    {
      char v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) == 0) {
        return;
      }
      id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 32));
      [v17 audioSystemService:*(void *)(a1 + 48) audioSessionDidBecomeActiveWithActivationContext:*(void *)(a1 + 32)];
    }
    else
    {
      int v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0) {
        return;
      }
      id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 32));
      [v17 audioSystemService:*(void *)(a1 + 48) audioSessionDidBecomeInactiveWithDeactivationContext:*(void *)(a1 + 40)];
    }
  }
}

- (void)handleAudioSessionWillBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  performer = self->_performer;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __104__SVXClientAudioSystemService_handleAudioSessionWillBecomeActive_activationContext_deactivationContext___block_invoke;
  v13[3] = &unk_2645549E0;
  BOOL v17 = a3;
  id v14 = v8;
  id v15 = v9;
  char v16 = self;
  id v11 = v9;
  id v12 = v8;
  [(SVXPerforming *)performer performBlock:v13];
}

void __104__SVXClientAudioSystemService_handleAudioSessionWillBecomeActive_activationContext_deactivationContext___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v14 = 136315906;
    id v15 = "-[SVXClientAudioSystemService handleAudioSessionWillBecomeActive:activationContext:deactivationContext:]_block_invoke";
    __int16 v16 = 1024;
    int v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    __int16 v20 = 2112;
    uint64_t v21 = v5;
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s flag = %d, activationContext = %@, deactivationContext = %@", (uint8_t *)&v14, 0x26u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 32));
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 32));
    [v8 audioSystemService:*(void *)(a1 + 48) audioSessionWillBecomeActive:*(unsigned __int8 *)(a1 + 56)];
  }
  int v9 = *(unsigned __int8 *)(a1 + 56);
  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 32));
  if (v9)
  {
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0) {
      return;
    }
    id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 32));
    [v12 audioSystemService:*(void *)(a1 + 48) audioSessionWillBecomeActiveWithActivationContext:*(void *)(a1 + 32)];
  }
  else
  {
    int v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      return;
    }
    id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 32));
    [v12 audioSystemService:*(void *)(a1 + 48) audioSessionWillBecomeInactiveWithDeactivationContext:*(void *)(a1 + 40)];
  }
}

@end