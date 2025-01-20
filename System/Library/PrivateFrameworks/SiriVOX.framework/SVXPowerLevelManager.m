@interface SVXPowerLevelManager
- (SVXPowerLevelManager)initWithModule:(id)a3 audioPowerProvider:(id)a4;
- (SVXPowerLevelManager)initWithModule:(id)a3 audioPowerProvider:(id)a4 powerLevelListener:(id)a5;
- (void)_beginUpdateAudioPowerWithCompletion:(id)a3;
- (void)_endUpdateAudioPower;
- (void)beginUpdateAudioPowerWithCompletion:(id)a3;
- (void)endUpdateAudioPower;
@end

@implementation SVXPowerLevelManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLevelListener, 0);
  objc_storeStrong((id *)&self->_audioPowerProvider, 0);

  objc_storeStrong((id *)&self->_module, 0);
}

- (void)_endUpdateAudioPower
{
  v3 = [(SVXModule *)self->_module instanceContext];
  int v4 = [v3 supportsAudioPowerUpdate];

  if (v4)
  {
    powerLevelListener = self->_powerLevelListener;
    [(SVXPowerLevelListener *)powerLevelListener endListening];
  }
}

- (void)_beginUpdateAudioPowerWithCompletion:(id)a3
{
  id v7 = a3;
  int v4 = [(SVXModule *)self->_module instanceContext];
  if ([v4 supportsAudioPowerUpdate])
  {
    audioPowerProvider = self->_audioPowerProvider;

    v6 = (void (**)(void, void))v7;
    if (audioPowerProvider)
    {
      [(SVXPowerLevelListener *)self->_powerLevelListener beginListeningToAudioPowerProvider:self->_audioPowerProvider completion:v7];
      goto LABEL_7;
    }
  }
  else
  {

    v6 = (void (**)(void, void))v7;
  }
  if (!v6) {
    goto LABEL_8;
  }
  v6[2](v6, 0);
LABEL_7:
  v6 = (void (**)(void, void))v7;
LABEL_8:
}

- (void)endUpdateAudioPower
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[SVXPowerLevelManager endUpdateAudioPower]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  int v4 = [(SVXModule *)self->_module performer];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__SVXPowerLevelManager_endUpdateAudioPower__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [v4 performBlock:v5];
}

uint64_t __43__SVXPowerLevelManager_endUpdateAudioPower__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endUpdateAudioPower];
}

- (void)beginUpdateAudioPowerWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SVXPowerLevelManager beginUpdateAudioPowerWithCompletion:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v6 = [(SVXModule *)self->_module performer];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__SVXPowerLevelManager_beginUpdateAudioPowerWithCompletion___block_invoke;
  v8[3] = &unk_2645547D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlock:v8];
}

uint64_t __60__SVXPowerLevelManager_beginUpdateAudioPowerWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginUpdateAudioPowerWithCompletion:*(void *)(a1 + 40)];
}

- (SVXPowerLevelManager)initWithModule:(id)a3 audioPowerProvider:(id)a4 powerLevelListener:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SVXPowerLevelManager;
  uint64_t v12 = [(SVXPowerLevelManager *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_module, a3);
    objc_storeStrong((id *)&v13->_audioPowerProvider, a4);
    objc_storeStrong((id *)&v13->_powerLevelListener, a5);
  }

  return v13;
}

- (SVXPowerLevelManager)initWithModule:(id)a3 audioPowerProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(SVXPowerLevelListener);
  id v9 = [(SVXPowerLevelManager *)self initWithModule:v7 audioPowerProvider:v6 powerLevelListener:v8];

  return v9;
}

@end