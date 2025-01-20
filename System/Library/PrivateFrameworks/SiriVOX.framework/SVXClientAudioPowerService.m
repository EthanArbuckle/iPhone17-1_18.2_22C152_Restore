@interface SVXClientAudioPowerService
- (SVXClientAudioPowerService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5;
- (SVXClientAudioPowerService)initWithType:(int64_t)a3 clientServiceProvider:(id)a4 analytics:(id)a5 performer:(id)a6;
- (SVXClientAudioPowerServiceDelegate)delegate;
- (float)averagePower;
- (float)peakPower;
- (id)_provider;
- (void)_beginUpdateWithFrequency:(int64_t)a3;
- (void)_createUpdater;
- (void)_destroyUpdater;
- (void)_endUpdate;
- (void)_handleDidEndUpdateAudioPower;
- (void)_handleWillBeginUpdateAudioPowerWithProvider:(id)a3;
- (void)_setProvider:(id)a3;
- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5;
- (void)beginUpdateWithFrequency:(int64_t)a3;
- (void)clientServiceDidChange:(BOOL)a3;
- (void)endUpdate;
- (void)handleDidEndUpdateAudioPower;
- (void)handleWillBeginUpdateAudioPowerWithProvider:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SVXClientAudioPowerService

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);

  objc_storeStrong((id *)&self->_performer, 0);
}

- (void)setDelegate:(id)a3
{
}

- (SVXClientAudioPowerServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SVXClientAudioPowerServiceDelegate *)WeakRetained;
}

- (void)_setProvider:(id)a3
{
  v4 = (AFAudioPowerProviding *)a3;
  os_unfair_lock_lock(&self->_providerLock);
  provider = self->_provider;
  self->_provider = v4;

  os_unfair_lock_unlock(&self->_providerLock);
}

- (id)_provider
{
  p_providerLock = &self->_providerLock;
  os_unfair_lock_lock(&self->_providerLock);
  v4 = self->_provider;
  os_unfair_lock_unlock(p_providerLock);

  return v4;
}

- (void)_destroyUpdater
{
  updater = self->_updater;
  if (updater)
  {
    [(AFAudioPowerUpdater *)updater endUpdate];
    [(AFAudioPowerUpdater *)self->_updater invalidate];
    v4 = self->_updater;
    self->_updater = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained audioPowerServiceDidEndUpdate:self];
  }
}

- (void)_createUpdater
{
  [(SVXClientAudioPowerService *)self _destroyUpdater];
  if ((unint64_t)(self->_type - 1) <= 1 && self->_wantsUpdate && self->_provider)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained audioPowerServiceWillBeginUpdate:self];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [(SVXPerforming *)self->_performer queue];
    }
    else
    {
      v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);

      id v8 = dispatch_queue_create("com.apple.SiriVOX.client.audio-power-updater", v5);
    }
    v6 = (AFAudioPowerUpdater *)[objc_alloc(MEMORY[0x263F28428]) initWithProvider:self->_provider queue:v8 frequency:self->_frequency delegate:self];
    updater = self->_updater;
    self->_updater = v6;

    [(AFAudioPowerUpdater *)self->_updater beginUpdate];
  }
}

- (void)_handleDidEndUpdateAudioPower
{
  [(SVXClientAudioPowerService *)self _destroyUpdater];

  [(SVXClientAudioPowerService *)self _setProvider:0];
}

- (void)_handleWillBeginUpdateAudioPowerWithProvider:(id)a3
{
  id v4 = a3;
  [(SVXClientAudioPowerService *)self _handleDidEndUpdateAudioPower];
  [(SVXClientAudioPowerService *)self _setProvider:v4];

  [(SVXClientAudioPowerService *)self _createUpdater];
}

- (void)_endUpdate
{
  self->_frequency = 0;
  self->_wantsUpdate = 0;
}

- (void)_beginUpdateWithFrequency:(int64_t)a3
{
  [(SVXClientAudioPowerService *)self _endUpdate];
  self->_wantsUpdate = 1;
  if ((unint64_t)(a3 - 1) >= 3) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = a3;
  }
  self->_frequency = v5;

  [(SVXClientAudioPowerService *)self _createUpdater];
}

- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5
{
  id v8 = a3;
  performer = self->_performer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__SVXClientAudioPowerService_audioPowerUpdaterDidUpdate_averagePower_peakPower___block_invoke;
  v11[3] = &unk_264554738;
  v11[4] = self;
  id v12 = v8;
  float v13 = a4;
  float v14 = a5;
  id v10 = v8;
  [(SVXPerforming *)performer performBlock:v11 withOptions:2];
}

void __80__SVXClientAudioPowerService_audioPowerUpdaterDidUpdate_averagePower_peakPower___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 64) == *(void *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 72));
    LODWORD(v3) = *(_DWORD *)(a1 + 48);
    LODWORD(v4) = *(_DWORD *)(a1 + 52);
    [WeakRetained audioPowerServiceDidUpdate:*(void *)(a1 + 32) averagePower:v3 peakPower:v4];
  }
}

- (float)peakPower
{
  float v5 = 0.0;
  v2 = [(SVXClientAudioPowerService *)self _provider];
  if ([v2 getAveragePower:0 andPeakPower:&v5]) {
    float v3 = v5;
  }
  else {
    float v3 = 0.0;
  }

  return v3;
}

- (float)averagePower
{
  float v5 = 0.0;
  v2 = [(SVXClientAudioPowerService *)self _provider];
  if ([v2 getAveragePower:&v5 andPeakPower:0]) {
    float v3 = v5;
  }
  else {
    float v3 = 0.0;
  }

  return v3;
}

- (void)endUpdate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  float v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXClientAudioPowerService endUpdate]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__SVXClientAudioPowerService_endUpdate__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [(SVXPerforming *)performer performBlock:v5];
}

uint64_t __39__SVXClientAudioPowerService_endUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endUpdate];
}

- (void)beginUpdateWithFrequency:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  float v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    if ((unint64_t)a3 > 3) {
      v7 = @"(unknown)";
    }
    else {
      v7 = off_264554340[a3];
    }
    uint64_t v8 = v7;
    *(_DWORD *)buf = 136315394;
    id v12 = "-[SVXClientAudioPowerService beginUpdateWithFrequency:]";
    __int16 v13 = 2112;
    float v14 = v8;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s frequency = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__SVXClientAudioPowerService_beginUpdateWithFrequency___block_invoke;
  v10[3] = &unk_264554548;
  v10[4] = self;
  v10[5] = a3;
  [(SVXPerforming *)performer performBlock:v10];
}

uint64_t __55__SVXClientAudioPowerService_beginUpdateWithFrequency___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginUpdateWithFrequency:*(void *)(a1 + 40)];
}

- (void)clientServiceDidChange:(BOOL)a3
{
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke;
  v7[3] = &unk_2645548A0;
  v7[4] = self;
  [(SVXPerforming *)performer performBlock:v7];
  clientServiceProvider = self->_clientServiceProvider;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke_2;
  v6[3] = &unk_2645531B8;
  v6[4] = self;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v6 errorHandler:&__block_literal_global_8561];
}

uint64_t __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidEndUpdateAudioPower];
}

uint64_t __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke_3;
  v5[3] = &unk_264553190;
  v5[4] = v2;
  return [a2 fetchAudioPowerWithType:v3 completion:v5];
}

void __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    float v5 = "-[SVXClientAudioPowerService clientServiceDidChange:]_block_invoke_5";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

void __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x263F28430];
    id v4 = a2;
    float v5 = (void *)[[v3 alloc] initWithXPCWrapper:v4];

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 8);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke_4;
    v9[3] = &unk_2645548C8;
    v9[4] = v6;
    id v10 = v5;
    id v8 = v5;
    [v7 performBlock:v9];
  }
}

uint64_t __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleWillBeginUpdateAudioPowerWithProvider:*(void *)(a1 + 40)];
}

- (SVXClientAudioPowerService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  return [(SVXClientAudioPowerService *)self initWithType:0 clientServiceProvider:a3 analytics:a4 performer:a5];
}

- (void)handleDidEndUpdateAudioPower
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[SVXClientAudioPowerService handleDidEndUpdateAudioPower]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__SVXClientAudioPowerService_handleDidEndUpdateAudioPower__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [(SVXPerforming *)performer performBlock:v5];
}

uint64_t __58__SVXClientAudioPowerService_handleDidEndUpdateAudioPower__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidEndUpdateAudioPower];
}

- (void)handleWillBeginUpdateAudioPowerWithProvider:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientAudioPowerService handleWillBeginUpdateAudioPowerWithProvider:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s provider = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__SVXClientAudioPowerService_handleWillBeginUpdateAudioPowerWithProvider___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

uint64_t __74__SVXClientAudioPowerService_handleWillBeginUpdateAudioPowerWithProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleWillBeginUpdateAudioPowerWithProvider:*(void *)(a1 + 40)];
}

- (SVXClientAudioPowerService)initWithType:(int64_t)a3 clientServiceProvider:(id)a4 analytics:(id)a5 performer:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SVXClientAudioPowerService;
  __int16 v12 = [(SVXClientAudioPowerService *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_performer, a6);
    v13->_type = a3;
    objc_storeStrong((id *)&v13->_clientServiceProvider, a4);
    v13->_providerLock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

@end