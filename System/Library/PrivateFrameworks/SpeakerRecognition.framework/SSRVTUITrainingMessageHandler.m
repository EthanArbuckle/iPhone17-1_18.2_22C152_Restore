@interface SSRVTUITrainingMessageHandler
- (CSVTUIAudioSession)audioSession;
- (NSString)siriSharedUserId;
- (SSRVTUITrainingAudioSessionDelegate)audioSessionDelegate;
- (SSRVTUITrainingManager)trainingManager;
- (SSRVTUITrainingMessageHandler)init;
- (SSRVTUITrainingServiceDelegate)remoteObjectProxy;
- (void)VTUITrainingManagerFeedLevel:(float)a3;
- (void)audioSourceWithCompletion:(id)a3;
- (void)cancelTrainingViaXPCForID:(int64_t)a3;
- (void)cleanupViaXPCWithCompletion:(id)a3;
- (void)didDetectForceEndPoint;
- (void)getAudioSessionID:(id)a3;
- (void)playSoundEffectWithAudioTone:(int)a3;
- (void)prepareWithCompletion:(id)a3;
- (void)requestAudioProviderForTrainingWithSyncBlock:(id)a3;
- (void)setAudioSession:(id)a3;
- (void)setAudioSessionDelegate:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)setSiriSharedUserId:(id)a3;
- (void)setTrainingManager:(id)a3;
- (void)setupWithLocaleID:(id)a3 appDomain:(id)a4 siriSharedUserId:(id)a5;
- (void)startRMS;
- (void)stopRMS;
- (void)trainUtteranceViaXPC:(int64_t)a3 shouldUseASR:(BOOL)a4 completion:(id)a5;
- (void)trainUtteranceViaXPC:(int64_t)a3 shouldUseASR:(BOOL)a4 mhUUID:(id)a5 completionWithResult:(id)a6;
- (void)voiceProfileWithCompletion:(id)a3;
- (void)vtuiTrainingXPCDisconnected;
@end

@implementation SSRVTUITrainingMessageHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriSharedUserId, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_trainingManager, 0);
  objc_destroyWeak((id *)&self->_audioSessionDelegate);

  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
}

- (void)setSiriSharedUserId:(id)a3
{
}

- (NSString)siriSharedUserId
{
  return self->_siriSharedUserId;
}

- (void)setAudioSession:(id)a3
{
}

- (CSVTUIAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setTrainingManager:(id)a3
{
}

- (SSRVTUITrainingManager)trainingManager
{
  return self->_trainingManager;
}

- (void)setAudioSessionDelegate:(id)a3
{
}

- (SSRVTUITrainingAudioSessionDelegate)audioSessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioSessionDelegate);

  return (SSRVTUITrainingAudioSessionDelegate *)WeakRetained;
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (SSRVTUITrainingServiceDelegate)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)requestAudioProviderForTrainingWithSyncBlock:(id)a3
{
  id v10 = a3;
  p_audioSessionDelegate = &self->_audioSessionDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_audioSessionDelegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_audioSessionDelegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_audioSessionDelegate);
      [v9 requestAudioProviderForTrainingWithSyncBlock:v10];
    }
  }
}

- (void)VTUITrainingManagerFeedLevel:(float)a3
{
}

- (void)getAudioSessionID:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  audioSession = self->_audioSession;
  v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = [(CSVTUIAudioSession *)audioSession getAudioSessionID];
  v6 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    char v8 = "-[SSRVTUITrainingMessageHandler getAudioSessionID:]";
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Get AudioSessionID: %lu", (uint8_t *)&v7, 0x16u);
  }
  v4[2](v4, v5);
}

- (void)audioSourceWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, unint64_t))a3;
  unint64_t v5 = [(SSRVTUITrainingManager *)self->_trainingManager audioSource];
  v6 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    char v8 = "-[SSRVTUITrainingMessageHandler audioSourceWithCompletion:]";
    __int16 v9 = 2048;
    unint64_t v10 = v5;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s audioSource : %lu", (uint8_t *)&v7, 0x16u);
  }
  if (v4) {
    v4[2](v4, v5);
  }
}

- (void)voiceProfileWithCompletion:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  unint64_t v5 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    char v8 = "-[SSRVTUITrainingMessageHandler voiceProfileWithCompletion:]";
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  v6 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
  if (v4) {
    v4[2](v4, v6);
  }
}

- (void)cancelTrainingViaXPCForID:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v5 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[SSRVTUITrainingMessageHandler cancelTrainingViaXPCForID:]";
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(SSRVTUITrainingManager *)self->_trainingManager cancelTrainingForID:a3];
}

- (void)playSoundEffectWithAudioTone:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v5 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[SSRVTUITrainingMessageHandler playSoundEffectWithAudioTone:]";
    __int16 v8 = 1024;
    int v9 = v3;
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Audio tone: %d", (uint8_t *)&v6, 0x12u);
  }
  [(SSRVTUITrainingManager *)self->_trainingManager playSoundEffectWithAudioTone:v3];
}

- (void)trainUtteranceViaXPC:(int64_t)a3 shouldUseASR:(BOOL)a4 mhUUID:(id)a5 completionWithResult:(id)a6
{
  BOOL v7 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  v12 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315906;
    v14 = "-[SSRVTUITrainingMessageHandler trainUtteranceViaXPC:shouldUseASR:mhUUID:completionWithResult:]";
    __int16 v15 = 2048;
    int64_t v16 = a3;
    __int16 v17 = 1024;
    BOOL v18 = v7;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s utterance: %ld, shouldUseASR : %d, mhuuid : %@", (uint8_t *)&v13, 0x26u);
  }
  [(SSRVTUITrainingManager *)self->_trainingManager trainUtterance:a3 shouldUseASR:v7 mhUUID:v10 completionWithResult:v11];
}

- (void)trainUtteranceViaXPC:(int64_t)a3 shouldUseASR:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a5;
  int v9 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    id v11 = "-[SSRVTUITrainingMessageHandler trainUtteranceViaXPC:shouldUseASR:completion:]";
    __int16 v12 = 2048;
    int64_t v13 = a3;
    __int16 v14 = 1024;
    BOOL v15 = v5;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s utterance: %ld, shouldUseASR : %d", (uint8_t *)&v10, 0x1Cu);
  }
  [(SSRVTUITrainingManager *)self->_trainingManager trainUtterance:a3 shouldUseASR:v5 completion:v8];
}

- (void)cleanupViaXPCWithCompletion:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[SSRVTUITrainingMessageHandler cleanupViaXPCWithCompletion:]";
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(SSRVTUITrainingManager *)self->_trainingManager cleanupWithCompletion:v4];
}

- (void)prepareWithCompletion:(id)a3
{
}

- (void)didDetectForceEndPoint
{
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (void)stopRMS
{
}

- (void)startRMS
{
}

- (void)vtuiTrainingXPCDisconnected
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SSRVTUITrainingMessageHandler vtuiTrainingXPCDisconnected]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s end training and clean up", (uint8_t *)&v5, 0xCu);
  }
  [(SSRVTUITrainingManager *)self->_trainingManager cancelTrainingForID:0];
  id v4 = [(SSRVTUITrainingManager *)self->_trainingManager cleanupWithCompletion:0];
}

- (void)setupWithLocaleID:(id)a3 appDomain:(id)a4 siriSharedUserId:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = (NSString *)a5;
  id v11 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315906;
    __int16 v19 = "-[SSRVTUITrainingMessageHandler setupWithLocaleID:appDomain:siriSharedUserId:]";
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2114;
    id v23 = v9;
    __int16 v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s localeIdentifier : %{public}@, appDomain : %{public}@, siriSharedUserId: %@", (uint8_t *)&v18, 0x2Au);
  }
  __int16 v12 = [[CSVTUIAudioSessionRecorder alloc] initWithDelegate:self];
  audioSession = self->_audioSession;
  self->_audioSession = (CSVTUIAudioSession *)v12;

  siriSharedUserId = self->_siriSharedUserId;
  self->_siriSharedUserId = v10;
  BOOL v15 = v10;

  uint64_t v16 = [[SSRVTUITrainingManager alloc] initWithLocaleIdentifier:v8 withAudioSession:self->_audioSession withAppDomain:v9 shouldTrainViaXPC:0 withSiriSharedUserId:v15];
  trainingManager = self->_trainingManager;
  self->_trainingManager = v16;

  [(SSRVTUITrainingManager *)self->_trainingManager setDelegate:self];
}

- (SSRVTUITrainingMessageHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSRVTUITrainingMessageHandler;
  v2 = [(SSRVTUITrainingMessageHandler *)&v5 init];
  if (v2)
  {
    SSRLogInitIfNeeded();
    trainingManager = v2->_trainingManager;
    v2->_trainingManager = 0;
  }
  return v2;
}

@end