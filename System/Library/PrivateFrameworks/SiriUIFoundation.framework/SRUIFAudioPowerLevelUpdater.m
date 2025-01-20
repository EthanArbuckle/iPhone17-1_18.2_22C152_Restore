@interface SRUIFAudioPowerLevelUpdater
- (CSAudioPowerServiceClient)_inputAudioPowerUpdater;
- (SRUIFAudioPowerLevelUpdater)initWithDelegate:(id)a3;
- (SRUIFAudioPowerLevelUpdaterDelegate)_delegate;
- (float)_averageAudioPower;
- (float)averagePower;
- (void)audioPowerDidUpdateWithType:(unint64_t)a3 averagePower:(float)a4 peakPower:(float)a5;
- (void)dealloc;
- (void)sessionStateDidChangeTo:(int64_t)a3 isAttending:(BOOL)a4;
- (void)startObservingUpdates;
- (void)stopObservingUpdates;
@end

@implementation SRUIFAudioPowerLevelUpdater

- (SRUIFAudioPowerLevelUpdater)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SRUIFAudioPowerLevelUpdater;
  v5 = [(SRUIFAudioPowerLevelUpdater *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (float)averagePower
{
  return self->_averageAudioPower;
}

- (void)startObservingUpdates
{
  inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
  if (!inputAudioPowerUpdater)
  {
    id v4 = objc_alloc(MEMORY[0x263F37FD8]);
    v5 = (CSAudioPowerServiceClient *)[v4 initWithQueue:MEMORY[0x263EF83A0] frequency:1 delegate:self];
    v6 = self->_inputAudioPowerUpdater;
    self->_inputAudioPowerUpdater = v5;

    inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
  }
  [(CSAudioPowerServiceClient *)inputAudioPowerUpdater beginUpdate];
}

- (void)stopObservingUpdates
{
  [(CSAudioPowerServiceClient *)self->_inputAudioPowerUpdater endUpdate];
  [(CSAudioPowerServiceClient *)self->_inputAudioPowerUpdater invalidate];
  inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
  self->_inputAudioPowerUpdater = 0;

  self->_averageAudioPower = 0.0;
}

- (void)sessionStateDidChangeTo:(int64_t)a3 isAttending:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = v7;
    v9 = SRUIFSiriSessionStateGetDescription(a3);
    int v10 = 136315650;
    v11 = "-[SRUIFAudioPowerLevelUpdater sessionStateDidChangeTo:isAttending:]";
    __int16 v12 = 2112;
    v13 = v9;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl(&dword_225FBA000, v8, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation state=%@ attending=%d", (uint8_t *)&v10, 0x1Cu);
  }
  if (a3 == 3)
  {
    if (!v4)
    {
LABEL_7:
      [(SRUIFAudioPowerLevelUpdater *)self stopObservingUpdates];
      return;
    }
  }
  else if (a3 != 1 && (a3 || !v4))
  {
    goto LABEL_7;
  }
  [(SRUIFAudioPowerLevelUpdater *)self startObservingUpdates];
}

- (void)audioPowerDidUpdateWithType:(unint64_t)a3 averagePower:(float)a4 peakPower:(float)a5
{
  self->_averageAudioPower = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  *(float *)&double v8 = a4;
  *(float *)&double v9 = a5;
  [WeakRetained audioPowerUpdaterDidUpdate:self averagePower:v8 peakPower:v9];
}

- (void)dealloc
{
  [(CSAudioPowerServiceClient *)self->_inputAudioPowerUpdater endUpdate];
  [(CSAudioPowerServiceClient *)self->_inputAudioPowerUpdater invalidate];
  inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
  self->_inputAudioPowerUpdater = 0;

  v4.receiver = self;
  v4.super_class = (Class)SRUIFAudioPowerLevelUpdater;
  [(SRUIFAudioPowerLevelUpdater *)&v4 dealloc];
}

- (CSAudioPowerServiceClient)_inputAudioPowerUpdater
{
  return self->_inputAudioPowerUpdater;
}

- (float)_averageAudioPower
{
  return self->_averageAudioPower;
}

- (SRUIFAudioPowerLevelUpdaterDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRUIFAudioPowerLevelUpdaterDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inputAudioPowerUpdater, 0);
}

@end