@interface SVXPowerLevelListener
- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4;
- (SVXAudioPowerProviding)audioPowerProvider;
- (SVXPowerLevelListener)init;
- (SVXPowerLevelListener)initWithAudioPowerUpdaterProvider:(id)a3;
- (int64_t)_frequency;
- (void)beginListeningToAudioPowerProvider:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)endListening;
- (void)setAudioPowerProvider:(id)a3;
@end

@implementation SVXPowerLevelListener

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_audioPowerProvider);
  objc_storeStrong((id *)&self->_outputAudioPowerUpdaterQueue, 0);
  objc_storeStrong((id *)&self->_outputAudioPowerUpdater, 0);

  objc_storeStrong((id *)&self->_audioPowerUpdaterProvider, 0);
}

- (void)setAudioPowerProvider:(id)a3
{
}

- (SVXAudioPowerProviding)audioPowerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioPowerProvider);

  return (SVXAudioPowerProviding *)WeakRetained;
}

- (int64_t)_frequency
{
  return 1;
}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  uint64_t v21 = 0;
  v22 = (float *)&v21;
  uint64_t v23 = 0x2020000000;
  int v24 = -1024458752;
  uint64_t v17 = 0;
  v18 = (float *)&v17;
  uint64_t v19 = 0x2020000000;
  int v20 = -1024458752;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioPowerProvider);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__SVXPowerLevelListener_getAveragePower_andPeakPower___block_invoke;
  v13[3] = &unk_2645534F0;
  v15 = &v21;
  v16 = &v17;
  v9 = v7;
  v14 = v9;
  [WeakRetained getAudioPower:v13];

  dispatch_time_t v10 = dispatch_time(0, 500000000);
  intptr_t v11 = dispatch_semaphore_wait(v9, v10);
  *a3 = v22[6];
  *a4 = v18[6];
  LOBYTE(a4) = v11 == 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return (char)a4;
}

intptr_t __54__SVXPowerLevelListener_getAveragePower_andPeakPower___block_invoke(uint64_t a1, float a2, float a3)
{
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)dealloc
{
  [(SVXPowerLevelListener *)self endListening];
  v3.receiver = self;
  v3.super_class = (Class)SVXPowerLevelListener;
  [(SVXPowerLevelListener *)&v3 dealloc];
}

- (void)endListening
{
  objc_storeWeak((id *)&self->_audioPowerProvider, 0);
  [(AFAudioPowerUpdater *)self->_outputAudioPowerUpdater endUpdate];
  [(AFAudioPowerUpdater *)self->_outputAudioPowerUpdater invalidate];
  outputAudioPowerUpdater = self->_outputAudioPowerUpdater;
  self->_outputAudioPowerUpdater = 0;

  outputAudioPowerUpdaterQueue = self->_outputAudioPowerUpdaterQueue;
  self->_outputAudioPowerUpdaterQueue = 0;
}

- (void)beginListeningToAudioPowerProvider:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SVXPowerLevelListener *)self endListening];
  objc_storeWeak((id *)&self->_audioPowerProvider, v7);

  v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v8 = (OS_dispatch_queue *)dispatch_queue_create("TTSPowerUpdateQueue", v12);
  outputAudioPowerUpdaterQueue = self->_outputAudioPowerUpdaterQueue;
  self->_outputAudioPowerUpdaterQueue = v8;

  dispatch_time_t v10 = [(SVXAFAudioPowerUpdaterProvider *)self->_audioPowerUpdaterProvider createWithProvider:self queue:self->_outputAudioPowerUpdaterQueue frequency:[(SVXPowerLevelListener *)self _frequency] delegate:0];
  outputAudioPowerUpdater = self->_outputAudioPowerUpdater;
  self->_outputAudioPowerUpdater = v10;

  [(AFAudioPowerUpdater *)self->_outputAudioPowerUpdater createNewXPCWrapperWithCompletion:v6];
  [(AFAudioPowerUpdater *)self->_outputAudioPowerUpdater beginUpdate];
}

- (SVXPowerLevelListener)initWithAudioPowerUpdaterProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXPowerLevelListener;
  id v6 = [(SVXPowerLevelListener *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_audioPowerUpdaterProvider, a3);
  }

  return v7;
}

- (SVXPowerLevelListener)init
{
  objc_super v3 = objc_alloc_init(SVXAFAudioPowerUpdaterProvider);
  v4 = [(SVXPowerLevelListener *)self initWithAudioPowerUpdaterProvider:v3];

  return v4;
}

@end