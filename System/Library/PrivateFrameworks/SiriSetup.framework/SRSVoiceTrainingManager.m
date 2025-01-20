@interface SRSVoiceTrainingManager
- (SRSTrainingManagerDelegate)delegate;
- (SRSVoiceTrainingManager)initWithLanguageCode:(id)a3;
- (SRSVoiceTrainingManager)initWithLanguageCode:(id)a3 withSharedUserId:(id)a4;
- (id)voiceProfile;
- (int64_t)convertStatus:(int)a3;
- (void)VTUITrainingManagerFeedLevel:(float)a3;
- (void)cancelTrainingForSessionId:(int64_t)a3;
- (void)cleanupWithCompletion:(id)a3;
- (void)getAudioSessionID:(id)a3;
- (void)playSoundsEffect:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)startRMS;
- (void)stopRMS;
- (void)trainUtterance:(int64_t)a3 shouldUseASR:(BOOL)a4 completion:(id)a5;
@end

@implementation SRSVoiceTrainingManager

- (SRSVoiceTrainingManager)initWithLanguageCode:(id)a3 withSharedUserId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SRSVoiceTrainingManager;
  v8 = [(SRSVoiceTrainingManager *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F78BA8] trainingManagerWithLocaleID:v6 withAppDomain:*MEMORY[0x263F78BC0] withSiriSharedUserId:v7];
    trainingManager = v8->_trainingManager;
    v8->_trainingManager = (SSRVTUITrainingManager *)v9;

    [(SSRVTUITrainingManager *)v8->_trainingManager setDelegate:v8];
  }

  return v8;
}

- (SRSVoiceTrainingManager)initWithLanguageCode:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRSVoiceTrainingManager;
  v5 = [(SRSVoiceTrainingManager *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F78BA8] trainingManagerWithLocaleID:v4 withAppDomain:*MEMORY[0x263F78BC0]];
    trainingManager = v5->_trainingManager;
    v5->_trainingManager = (SSRVTUITrainingManager *)v6;

    [(SSRVTUITrainingManager *)v5->_trainingManager setDelegate:v5];
  }

  return v5;
}

- (void)trainUtterance:(int64_t)a3 shouldUseASR:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  trainingManager = self->_trainingManager;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__SRSVoiceTrainingManager_trainUtterance_shouldUseASR_completion___block_invoke;
  v11[3] = &unk_264C67040;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(SSRVTUITrainingManager *)trainingManager trainUtterance:a3 shouldUseASR:v5 completion:v11];
}

uint64_t __66__SRSVoiceTrainingManager_trainUtterance_shouldUseASR_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "convertStatus:");
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)playSoundsEffect:(int64_t)a3
{
}

- (void)startRMS
{
}

- (void)stopRMS
{
}

- (void)getAudioSessionID:(id)a3
{
  id v4 = a3;
  trainingManager = self->_trainingManager;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SRSVoiceTrainingManager_getAudioSessionID___block_invoke;
  v7[3] = &unk_264C67068;
  id v8 = v4;
  id v6 = v4;
  [(SSRVTUITrainingManager *)trainingManager getAudioSessionID:v7];
}

uint64_t __45__SRSVoiceTrainingManager_getAudioSessionID___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)voiceProfile
{
  return (id)[(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
}

- (void)cancelTrainingForSessionId:(int64_t)a3
{
}

- (void)cleanupWithCompletion:(id)a3
{
  id v3 = (id)[(SSRVTUITrainingManager *)self->_trainingManager cleanupWithCompletion:a3];
}

- (void)VTUITrainingManagerFeedLevel:(float)a3
{
  id v5 = [(SRSVoiceTrainingManager *)self delegate];
  *(float *)&double v4 = a3;
  [v5 audioLevelDidChange:v4];
}

- (int64_t)convertStatus:(int)a3
{
  uint64_t v3 = (a3 - 1);
  if (v3 < 7) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

- (SRSTrainingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRSTrainingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trainingManager, 0);
}

@end