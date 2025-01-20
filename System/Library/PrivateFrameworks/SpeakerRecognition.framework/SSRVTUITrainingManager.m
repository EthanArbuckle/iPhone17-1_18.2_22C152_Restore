@interface SSRVTUITrainingManager
+ (SSRVTUITrainingManager)trainingManagerWithLocaleID:(id)a3 withAppDomain:(id)a4;
+ (SSRVTUITrainingManager)trainingManagerWithLocaleID:(id)a3 withAppDomain:(id)a4 withSiriSharedUserId:(id)a5;
+ (id)sharedtrainingSessionQueue;
- (BOOL)CSVTUITrainingSession:(id)a3 hasTrainUtterance:(id)a4 languageCode:(id)a5 payload:(BOOL)a6;
- (BOOL)_createAudioAnalyzer;
- (BOOL)_setupAudioSession;
- (BOOL)_shouldShowHeadsetDisconnectionMessage;
- (BOOL)_startAudioSession;
- (BOOL)_stopAudioSession;
- (BOOL)cancelTrainingForID:(int64_t)a3;
- (BOOL)createKeywordDetector;
- (BOOL)shouldPerformRMS;
- (BOOL)speechRecognizerAvailable;
- (BOOL)suspendAudio;
- (CSPlainAudioFileWriter)audioFileWriter;
- (SSRVTUITrainingManager)initWithLocaleIdentifier:(id)a3 withAudioSession:(id)a4 withAppDomain:(id)a5;
- (SSRVTUITrainingManager)initWithLocaleIdentifier:(id)a3 withAudioSession:(id)a4 withAppDomain:(id)a5 shouldTrainViaXPC:(BOOL)a6 withSiriSharedUserId:(id)a7;
- (SSRVTUITrainingManagerDelegate)delegate;
- (SSRVoiceProfile)voiceProfile;
- (float)rms;
- (id)_getAudioToneFileName:(int)a3;
- (id)cleanupWithCompletion:(id)a3;
- (id)updateTrainingManagerForDevice:(unint64_t)a3 trainingDeviceUUIDList:(id)a4;
- (int64_t)trainUtterance:(int64_t)a3 shouldUseASR:(BOOL)a4 completion:(id)a5;
- (int64_t)trainUtterance:(int64_t)a3 shouldUseASR:(BOOL)a4 mhUUID:(id)a5 completionWithResult:(id)a6;
- (unint64_t)_audioSource;
- (unint64_t)audioSource;
- (unsigned)getAudioSessionID;
- (void)CSVTUIRemoteTrainingSessionRMSAvailable:(float)a3;
- (void)CSVTUITrainingSessionRMSAvailable:(float)a3;
- (void)CSVTUITrainingSessionStopListen;
- (void)_destroyAudioSession;
- (void)_fetchCurrentAsset;
- (void)_playSoundsEffect:(int)a3;
- (void)_resetAudioAnalyzer;
- (void)audioSessionDidStartRecording:(BOOL)a3 error:(id)a4;
- (void)audioSessionDidStopRecording:(int64_t)a3;
- (void)audioSessionErrorDidOccur:(id)a3;
- (void)audioSessionRecordBufferAvailable:(id)a3;
- (void)audioSessionUnsupportedAudioRoute;
- (void)closeSessionBeforeStartWithStatus:(int)a3 successfully:(BOOL)a4 completionWithResult:(id)a5;
- (void)closeSessionBeforeStartWithStatus:(int)a3 successfully:(BOOL)a4 withCompletion:(id)a5;
- (void)createSpeechRecognizer;
- (void)destroySpeakerTrainer;
- (void)didDetectForceEndPoint;
- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4;
- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4;
- (void)fetchSpeechId;
- (void)getAudioSessionID:(id)a3;
- (void)playSoundEffectWithAudioTone:(int)a3;
- (void)playSoundsEffect:(int64_t)a3;
- (void)prepareWithCompletion:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setRms:(float)a3;
- (void)setSuspendAudio:(BOOL)a3;
- (void)startRMS;
- (void)stopRMS;
@end

@implementation SSRVTUITrainingManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_trainingServiceClient, 0);
  objc_storeStrong((id *)&self->_audioZeroCounter, 0);
  objc_storeStrong((id *)&self->_mhUUID, 0);
  objc_storeStrong((id *)&self->_didStopWaitingGroup, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_speechRecognizer, 0);
  objc_storeStrong(&self->_cleanupCompletion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentTrainingSession, 0);
  objc_storeStrong((id *)&self->_trainingSessions, 0);
  objc_storeStrong((id *)&self->_keywordDetector, 0);
  objc_storeStrong((id *)&self->_audioAnalyzer, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_vtAssetConfigVersion, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)setAudioFileWriter:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (BOOL)speechRecognizerAvailable
{
  return self->_speechRecognizerAvailable;
}

- (void)setDelegate:(id)a3
{
}

- (SSRVTUITrainingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSRVTUITrainingManagerDelegate *)WeakRetained;
}

- (void)setRms:(float)a3
{
  self->_rms = a3;
}

- (float)rms
{
  return self->_rms;
}

- (void)CSVTUIRemoteTrainingSessionRMSAvailable:(float)a3
{
  if (self->_shouldTrainViaXPC)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      id v7 = objc_loadWeakRetained((id *)p_delegate);
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v10 = objc_loadWeakRetained((id *)p_delegate);
        *(float *)&double v9 = a3;
        [v10 VTUITrainingManagerFeedLevel:v9];
      }
    }
  }
}

- (void)didDetectForceEndPoint
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SSRVTUITrainingManager_didDetectForceEndPoint__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

void __48__SSRVTUITrainingManager_didDetectForceEndPoint__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v1)
  {
    id v2 = v1;
    if (objc_opt_respondsToSelector()) {
      [v2 didDetectEndOfSpeech:2];
    }
  }
}

- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__SSRVTUITrainingManager_endpointer_didDetectHardEndpointAtTime___block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __65__SSRVTUITrainingManager_endpointer_didDetectHardEndpointAtTime___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[8];
  if (v3)
  {
    id v4 = v3;
    if (objc_opt_respondsToSelector()) {
      [v4 didDetectEndOfSpeech:1];
    }

    id v2 = *(void **)(a1 + 32);
  }

  return [v2 _resetAudioAnalyzer];
}

- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SSRVTUITrainingManager_endpointer_didDetectStartpointAtTime___block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

void __63__SSRVTUITrainingManager_endpointer_didDetectStartpointAtTime___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v1)
  {
    id v2 = v1;
    if (objc_opt_respondsToSelector()) {
      [v2 didDetectBeginOfSpeech];
    }
  }
}

- (void)audioSessionUnsupportedAudioRoute
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SSRVTUITrainingManager_audioSessionUnsupportedAudioRoute__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

void __59__SSRVTUITrainingManager_audioSessionUnsupportedAudioRoute__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v1)
  {
    id v2 = v1;
    if (objc_opt_respondsToSelector()) {
      [v2 audioSessionUnsupportedAudioRoute];
    }
  }
}

- (void)audioSessionErrorDidOccur:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__SSRVTUITrainingManager_audioSessionErrorDidOccur___block_invoke;
  v7[3] = &unk_26442A138;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __52__SSRVTUITrainingManager_audioSessionErrorDidOccur___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v1)
  {
    id v3 = v1;
    if (objc_opt_respondsToSelector()) {
      [v3 audioSessionErrorDidOccur:*(void *)(a1 + 40)];
    }
  }
}

- (void)audioSessionRecordBufferAvailable:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__SSRVTUITrainingManager_audioSessionRecordBufferAvailable___block_invoke;
  v7[3] = &unk_26442A138;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __60__SSRVTUITrainingManager_audioSessionRecordBufferAvailable___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) length];
  unint64_t v3 = [MEMORY[0x263F38018] inputRecordingSampleByteDepth];
  id v4 = *(void **)(a1 + 40);
  v5 = (void *)v4[18];
  unint64_t v6 = v2 / v3;
  if (v5)
  {
    [v5 getZeroStatisticsFromBuffer:*(void *)(a1 + 32) entireSamples:v6];
    id v4 = *(void **)(a1 + 40);
  }
  if (v4[5])
  {
    id v7 = objc_alloc(MEMORY[0x263F37FB8]);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [MEMORY[0x263F38018] inputRecordingSampleByteDepth];
    LOBYTE(v12) = [MEMORY[0x263F38018] inputRecordingIsFloat];
    id v10 = (void *)[v7 initWithData:v8 numChannels:1 numSamples:v6 sampleByteDepth:v9 startSampleCount:0 hostTime:0 remoteVAD:0 isFloat:v12];
    [*(id *)(*(void *)(a1 + 40) + 40) processAudioSamplesAsynchronously:v10];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 192), "addSamples:numSamples:", objc_msgSend(*(id *)(a1 + 32), "bytes"), v6);

    id v4 = *(void **)(a1 + 40);
  }
  v11 = (void *)v4[8];
  if (v11)
  {
    id v13 = v11;
    if (objc_opt_respondsToSelector()) {
      [v13 audioSessionRecordBufferAvailable:*(void *)(a1 + 32)];
    }
  }
}

- (void)audioSessionDidStopRecording:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SSRVTUITrainingManager_audioSessionDidStopRecording___block_invoke;
  v4[3] = &unk_2644290B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __55__SSRVTUITrainingManager_audioSessionDidStopRecording___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v1 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v1)
  {
    id v3 = v1;
    if (objc_opt_respondsToSelector()) {
      [v3 audioSessionDidStopRecording:*(void *)(a1 + 40)];
    }
  }
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    unint64_t v6 = "-[SSRVTUITrainingManager audioSessionDidStopRecording:]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s audioSessionDidStopRecording", (uint8_t *)&v5, 0xCu);
  }
}

- (void)audioSessionDidStartRecording:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SSRVTUITrainingManager_audioSessionDidStartRecording_error___block_invoke;
  block[3] = &unk_264429150;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __62__SSRVTUITrainingManager_audioSessionDidStartRecording_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v1)
  {
    id v3 = v1;
    if (objc_opt_respondsToSelector()) {
      [v3 audioSessionDidStartRecording:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
    }
  }
}

- (BOOL)CSVTUITrainingSession:(id)a3 hasTrainUtterance:(id)a4 languageCode:(id)a5 payload:(BOOL)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 getUtteranceId];
  BOOL v11 = [v9 getMhUUID];
  uint64_t v12 = [v9 getPhId];

  id v13 = +[SSRVoiceProfileComposer sharedTrainer];
  char v14 = [v13 addUtterance:v8 toProfile:self->_profile withAsset:self->_currentAsset sessionUtteranceId:v10 sessionMHUUID:v11 phId:v12];

  if ((v14 & 1) == 0)
  {
    v15 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      v18 = "-[SSRVTUITrainingManager CSVTUITrainingSession:hasTrainUtterance:languageCode:payload:]";
      _os_log_error_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_ERROR, "%s ERR: Failed to save explicit utterance", (uint8_t *)&v17, 0xCu);
    }
  }

  return v14;
}

- (void)CSVTUITrainingSessionStopListen
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    BOOL v11 = "-[SSRVTUITrainingManager CSVTUITrainingSessionStopListen]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Stop Listening", (uint8_t *)&v10, 0xCu);
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      [v9 VTUITrainingManagerStopListening];
    }
  }
}

- (void)CSVTUITrainingSessionRMSAvailable:(float)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v10 = objc_loadWeakRetained((id *)p_delegate);
      *(float *)&double v9 = a3;
      [v10 VTUITrainingManagerFeedLevel:v9];
    }
  }
}

- (BOOL)shouldPerformRMS
{
  return self->_performRMS;
}

- (void)stopRMS
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SSRVTUITrainingManager_stopRMS__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __33__SSRVTUITrainingManager_stopRMS__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 152)) {
    return [*(id *)(v1 + 160) stopRMS];
  }
  *(unsigned char *)(v1 + 8) = 0;
  return result;
}

- (void)startRMS
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SSRVTUITrainingManager_startRMS__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __34__SSRVTUITrainingManager_startRMS__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 152)) {
    return [*(id *)(v1 + 160) startRMS];
  }
  *(unsigned char *)(v1 + 8) = 1;
  return result;
}

- (void)setSuspendAudio:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v5 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[SSRVTUITrainingManager setSuspendAudio:]";
    __int16 v11 = 1026;
    BOOL v12 = v3;
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Setting suspendAudio:[%{public}d]", buf, 0x12u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SSRVTUITrainingManager_setSuspendAudio___block_invoke;
  v7[3] = &unk_26442A3E0;
  void v7[4] = self;
  BOOL v8 = v3;
  dispatch_async(queue, v7);
}

uint64_t __42__SSRVTUITrainingManager_setSuspendAudio___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(result + 32);
  if (*(unsigned char *)(v2 + 80))
  {
    if (!*(unsigned char *)(result + 40))
    {
      BOOL v3 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315138;
        id v6 = "-[SSRVTUITrainingManager setSuspendAudio:]_block_invoke";
        _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Resume training", (uint8_t *)&v5, 0xCu);
        uint64_t v2 = *(void *)(v1 + 32);
      }
      result = [*(id *)(v2 + 64) resumeTraining];
    }
  }
  else if (*(unsigned char *)(result + 40))
  {
    id v4 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[SSRVTUITrainingManager setSuspendAudio:]_block_invoke";
      _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Suspend training", (uint8_t *)&v5, 0xCu);
      uint64_t v2 = *(void *)(v1 + 32);
    }
    result = [*(id *)(v2 + 64) suspendTraining];
  }
  *(unsigned char *)(*(void *)(v1 + 32) + 80) = *(unsigned char *)(v1 + 40);
  return result;
}

- (BOOL)suspendAudio
{
  return self->_suspendAudio;
}

- (void)getAudioSessionID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SSRVTUITrainingManager_getAudioSessionID___block_invoke;
  v7[3] = &unk_26442A298;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __44__SSRVTUITrainingManager_getAudioSessionID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 152))
  {
    BOOL v3 = *(void **)(v2 + 160);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 getAudioSessionID:v4];
  }
  else
  {
    unsigned int v6 = [*(id *)(v2 + 32) getAudioSessionID];
    uint64_t v7 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      double v9 = "-[SSRVTUITrainingManager getAudioSessionID:]_block_invoke";
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Fetching audioSessionID locally: %lu", (uint8_t *)&v8, 0x16u);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (unsigned)getAudioSessionID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__SSRVTUITrainingManager_getAudioSessionID__block_invoke;
  v5[3] = &unk_26442A648;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__SSRVTUITrainingManager_getAudioSessionID__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 152))
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    dispatch_time_t v4 = dispatch_time(0, 5000000000);
    int v5 = *(void **)(*(void *)(a1 + 32) + 160);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __43__SSRVTUITrainingManager_getAudioSessionID__block_invoke_2;
    v13[3] = &unk_264429128;
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v6 = v3;
    char v14 = v6;
    [v5 getAudioSessionID:v13];
    intptr_t v7 = dispatch_semaphore_wait(v6, v4);
    uint64_t v8 = *MEMORY[0x263F38100];
    if (v7)
    {
      intptr_t v9 = v7;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        int v17 = "-[SSRVTUITrainingManager getAudioSessionID]_block_invoke";
        __int16 v18 = 2048;
        intptr_t v19 = v9;
        __int16 v20 = 2048;
        uint64_t v21 = 0x4014000000000000;
        _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s Timedout waiting for [SSRVTUITrainingServiceClient getAudioSessionID:]. %ld, waitedFor: %f s. Returning '0'", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      intptr_t v12 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      *(_DWORD *)buf = 136315394;
      int v17 = "-[SSRVTUITrainingManager getAudioSessionID]_block_invoke";
      __int16 v18 = 2048;
      intptr_t v19 = v12;
      _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Fetching audioSessionID via XPC: %lu.", buf, 0x16u);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(v2 + 32) getAudioSessionID];
    __int16 v10 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      intptr_t v11 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      *(_DWORD *)buf = 136315394;
      int v17 = "-[SSRVTUITrainingManager getAudioSessionID]_block_invoke";
      __int16 v18 = 2048;
      intptr_t v19 = v11;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Fetching audioSessionID locally: %lu", buf, 0x16u);
    }
  }
}

intptr_t __43__SSRVTUITrainingManager_getAudioSessionID__block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_startAudioSession
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = (os_log_t *)MEMORY[0x263F38100];
  dispatch_time_t v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    intptr_t v9 = "-[SSRVTUITrainingManager _startAudioSession]";
    __int16 v10 = 2082;
    intptr_t v11 = "-[SSRVTUITrainingManager _startAudioSession]";
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s %{public}s called", (uint8_t *)&v8, 0x16u);
  }
  audioSession = self->_audioSession;
  if (audioSession)
  {
    if (([(CSVTUIAudioSession *)audioSession isRecording] & 1) != 0
      || ([(CSVTUIAudioSession *)self->_audioSession startRecording] & 1) != 0)
    {
      LOBYTE(audioSession) = 1;
    }
    else
    {
      uint64_t v6 = *v3;
      LODWORD(audioSession) = os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR);
      if (audioSession)
      {
        int v8 = 136315138;
        intptr_t v9 = "-[SSRVTUITrainingManager _startAudioSession]";
        _os_log_error_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_ERROR, "%s AudioSession StartRecording Failed", (uint8_t *)&v8, 0xCu);
        LOBYTE(audioSession) = 0;
      }
    }
  }
  return (char)audioSession;
}

- (BOOL)_shouldShowHeadsetDisconnectionMessage
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    intptr_t v7 = "-[SSRVTUITrainingManager _shouldShowHeadsetDisconnectionMessage]";
    __int16 v8 = 2082;
    intptr_t v9 = "-[SSRVTUITrainingManager _shouldShowHeadsetDisconnectionMessage]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}s called", (uint8_t *)&v6, 0x16u);
  }
  audioSession = self->_audioSession;
  if (audioSession) {
    LOBYTE(audioSession) = [(CSVTUIAudioSession *)audioSession hasCorrectAudioRoute] ^ 1;
  }
  return (char)audioSession;
}

- (void)_resetAudioAnalyzer
{
  audioAnalyzer = self->_audioAnalyzer;
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  [(CSVTUIEndpointAnalyzer *)audioAnalyzer resetForNewRequestWithSampleRate:(unint64_t)v4];
  [(CSVTUIEndpointAnalyzer *)self->_audioAnalyzer setStartWaitTime:5.0];
  int v5 = self->_audioAnalyzer;

  [(CSVTUIEndpointAnalyzer *)v5 setEndWaitTime:0.77];
}

- (BOOL)_createAudioAnalyzer
{
  if (self->_audioSession)
  {
    dispatch_semaphore_t v3 = objc_alloc_init(CSVTUIEndpointAnalyzer);
    audioAnalyzer = self->_audioAnalyzer;
    self->_audioAnalyzer = v3;

    int v5 = self->_audioAnalyzer;
    if (v5)
    {
      [(CSVTUIEndpointAnalyzer *)v5 setDelegate:self];
      [(SSRVTUITrainingManager *)self _resetAudioAnalyzer];
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (BOOL)_setupAudioSession
{
  [(CSVTUIAudioSession *)self->_audioSession setDelegate:self];
  audioSession = self->_audioSession;

  return [(CSVTUIAudioSession *)audioSession prepareRecord];
}

- (unint64_t)_audioSource
{
  audioSession = self->_audioSession;
  if (audioSession) {
    return [(CSVTUIAudioSession *)audioSession audioSource];
  }
  else {
    return 6;
  }
}

- (unint64_t)audioSource
{
  uint64_t v8 = 0;
  intptr_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 6;
  queue = self->_queue;
  if (self->_shouldTrainViaXPC)
  {
    dispatch_semaphore_t v3 = v7;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__SSRVTUITrainingManager_audioSource__block_invoke;
    v7[3] = &unk_26442A648;
    void v7[4] = self;
    void v7[5] = &v8;
  }
  else
  {
    dispatch_semaphore_t v3 = v6;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__SSRVTUITrainingManager_audioSource__block_invoke_3;
    v6[3] = &unk_26442A648;
    v6[4] = self;
    v6[5] = &v8;
  }
  dispatch_sync(queue, v3);
  unint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __37__SSRVTUITrainingManager_audioSource__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 160);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__SSRVTUITrainingManager_audioSource__block_invoke_2;
  v3[3] = &unk_264429100;
  v3[4] = *(void *)(a1 + 40);
  return [v1 audioSourceWithCompletion:v3];
}

uint64_t __37__SSRVTUITrainingManager_audioSource__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _audioSource];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __37__SSRVTUITrainingManager_audioSource__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)closeSessionBeforeStartWithStatus:(int)a3 successfully:(BOOL)a4 completionWithResult:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a5;
  intptr_t v9 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "-[SSRVTUITrainingManager closeSessionBeforeStartWithStatus:successfully:completionWithResult:]";
    __int16 v18 = 1026;
    int v19 = a3;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Called with status : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __94__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_completionWithResult___block_invoke;
  v12[3] = &unk_2644290D8;
  int v14 = a3;
  id v13 = v8;
  BOOL v15 = a4;
  id v11 = v8;
  dispatch_async(queue, v12);
}

void __94__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_completionWithResult___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __94__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_completionWithResult___block_invoke_2;
  v2[3] = &unk_2644290D8;
  int v4 = *(_DWORD *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 44);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __94__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_completionWithResult___block_invoke_2(uint64_t a1)
{
  [[CSVTUITrainingResult alloc] initWithSessionId:0 sessionStatus:*(unsigned int *)(a1 + 40) audioStatus:0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }

  return MEMORY[0x270F9A758]();
}

- (void)closeSessionBeforeStartWithStatus:(int)a3 successfully:(BOOL)a4 withCompletion:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a5;
  intptr_t v9 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "-[SSRVTUITrainingManager closeSessionBeforeStartWithStatus:successfully:withCompletion:]";
    __int16 v18 = 1026;
    int v19 = a3;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Called with status : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_withCompletion___block_invoke;
  v12[3] = &unk_2644290D8;
  id v13 = v8;
  int v14 = a3;
  BOOL v15 = a4;
  id v11 = v8;
  dispatch_async(queue, v12);
}

void __88__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_withCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __88__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_withCompletion___block_invoke_2;
  v2[3] = &unk_2644290D8;
  id v3 = *(id *)(a1 + 32);
  int v4 = *(_DWORD *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 44);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __88__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void))(result + 16))(result, 0, *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44), 0);
  }
  return result;
}

- (BOOL)cancelTrainingForID:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v5 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[SSRVTUITrainingManager cancelTrainingForID:]";
    __int16 v13 = 2082;
    int v14 = "-[SSRVTUITrainingManager cancelTrainingForID:]";
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}s Canceling Training", buf, 0x16u);
  }
  if (self->_shouldTrainViaXPC)
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46__SSRVTUITrainingManager_cancelTrainingForID___block_invoke;
    v10[3] = &unk_2644290B0;
    v10[4] = self;
    v10[5] = a3;
    intptr_t v7 = v10;
  }
  else
  {
    [(CSVTUITrainingSession *)self->_currentTrainingSession closeSessionWithStatus:6 successfully:0];
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__SSRVTUITrainingManager_cancelTrainingForID___block_invoke_2;
    block[3] = &unk_26442A618;
    block[4] = self;
    intptr_t v7 = block;
  }
  dispatch_async(queue, v7);
  return 1;
}

uint64_t __46__SSRVTUITrainingManager_cancelTrainingForID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) cancelTrainingViaXPCForID:*(void *)(a1 + 40)];
}

uint64_t __46__SSRVTUITrainingManager_cancelTrainingForID___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopAudioSession];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 192);

  return [v2 endAudio];
}

- (void)playSoundEffectWithAudioTone:(int)a3
{
  BOOL shouldTrainViaXPC = self->_shouldTrainViaXPC;
  queue = self->_queue;
  if (shouldTrainViaXPC)
  {
    int v6 = v9;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    intptr_t v7 = __55__SSRVTUITrainingManager_playSoundEffectWithAudioTone___block_invoke;
  }
  else
  {
    int v6 = v8;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    intptr_t v7 = __55__SSRVTUITrainingManager_playSoundEffectWithAudioTone___block_invoke_2;
  }
  v6[2] = v7;
  v6[3] = &unk_26442A0D8;
  v6[4] = self;
  *((_DWORD *)v6 + 10) = a3;
  dispatch_async(queue, v6);
}

uint64_t __55__SSRVTUITrainingManager_playSoundEffectWithAudioTone___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) playSoundEffectWithAudioTone:*(unsigned int *)(a1 + 40)];
}

uint64_t __55__SSRVTUITrainingManager_playSoundEffectWithAudioTone___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playSoundsEffect:*(unsigned int *)(a1 + 40)];
}

- (void)playSoundsEffect:(int64_t)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ((unint64_t)a3 >= 5)
  {
    id v3 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      char v5 = "-[SSRVTUITrainingManager playSoundsEffect:]";
      _os_log_error_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_ERROR, "%s Failed to find the audio tone", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    -[SSRVTUITrainingManager playSoundEffectWithAudioTone:](self, "playSoundEffectWithAudioTone:");
  }
}

- (void)_playSoundsEffect:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  char v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [(SSRVTUITrainingManager *)self _getAudioToneFileName:v3];
  if (v6)
  {
    intptr_t v7 = [v5 URLForResource:v6 withExtension:@"caf"];
    id v8 = (os_log_t *)MEMORY[0x263F37FA8];
    intptr_t v9 = (void *)*MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      id v11 = [v7 path];
      *(_DWORD *)buf = 136315394;
      v27 = "-[SSRVTUITrainingManager _playSoundsEffect:]";
      __int16 v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Request Play SoundFileURL = %@", buf, 0x16u);
    }
    uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
    __int16 v13 = [v7 path];
    char v14 = [v12 fileExistsAtPath:v13];

    if (v14)
    {
      id v25 = 0;
      uint64_t v15 = (AVAudioPlayer *)[objc_alloc(MEMORY[0x263EF93B8]) initWithContentsOfURL:v7 error:&v25];
      id v16 = v25;
      audioPlayer = self->_audioPlayer;
      self->_audioPlayer = v15;

      __int16 v18 = self->_audioPlayer;
      if (v18)
      {
        if (![(AVAudioPlayer *)v18 play])
        {
          int v19 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v27 = "-[SSRVTUITrainingManager _playSoundsEffect:]";
            _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s Failed to play sounds file", buf, 0xCu);
          }
        }
      }
      else
      {
        os_log_t v22 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        {
          v23 = v22;
          v24 = [v16 localizedDescription];
          *(_DWORD *)buf = 136315394;
          v27 = "-[SSRVTUITrainingManager _playSoundsEffect:]";
          __int16 v28 = 2112;
          v29 = v24;
          _os_log_error_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_ERROR, "%s Failed to create audio player : %@", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v21 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[SSRVTUITrainingManager _playSoundsEffect:]";
        _os_log_error_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_ERROR, "%s Unable to find playback resource file", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v20 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[SSRVTUITrainingManager _playSoundsEffect:]";
      _os_log_debug_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_DEBUG, "%s Resource file name is nil", buf, 0xCu);
    }
  }
}

- (id)_getAudioToneFileName:(int)a3
{
  if (CSIsIOS())
  {
    if (a3 > 6) {
      return 0;
    }
    return off_264429170[a3];
  }
  int v5 = CSIsOSX();
  id result = 0;
  if (v5 && a3 < 7) {
    return off_264429170[a3];
  }
  return result;
}

- (int64_t)trainUtterance:(int64_t)a3 shouldUseASR:(BOOL)a4 mhUUID:(id)a5 completionWithResult:(id)a6
{
  BOOL v7 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (os_log_t *)MEMORY[0x263F38100];
  __int16 v13 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "-[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:]";
    __int16 v33 = 2050;
    int64_t v34 = a3;
    __int16 v35 = 1026;
    BOOL v36 = v7;
    _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s BEGIN num:%{public}ld use:%{public}d", buf, 0x1Cu);
  }
  if (self->_shouldTrainViaXPC)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke;
    block[3] = &unk_264429060;
    block[4] = self;
    int64_t v29 = a3;
    BOOL v30 = v7;
    id v27 = v10;
    id v28 = v11;
    dispatch_async(queue, block);

    int64_t v15 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_4;
    v20[3] = &unk_264429088;
    v20[4] = self;
    objc_copyWeak(v23, &location);
    id v21 = v10;
    id v16 = v11;
    BOOL v24 = v7;
    id v22 = v16;
    v23[1] = (id)a3;
    dispatch_async(MEMORY[0x263EF83A0], v20);
    int v17 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      int64_t sessionNumber = self->_sessionNumber;
      *(_DWORD *)buf = 136315394;
      v32 = "-[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:]";
      __int16 v33 = 2050;
      int64_t v34 = sessionNumber;
      _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s _sessionNumber [%{public}ld]", buf, 0x16u);
    }
    int64_t v15 = self->_sessionNumber;

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 160);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_2;
  v5[3] = &unk_264429010;
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v2 trainUtteranceViaXPC:v4 shouldUseASR:v3 mhUUID:v1 completionWithResult:v5];
}

void __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_5;
  v7[3] = &unk_264429088;
  objc_copyWeak(v11, (id *)(a1 + 56));
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  id v5 = *(id *)(a1 + 48);
  char v12 = *(unsigned char *)(a1 + 72);
  id v6 = *(void **)(a1 + 64);
  id v10 = v5;
  v11[1] = v6;
  dispatch_async(v2, v7);

  objc_destroyWeak(v11);
}

void __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_5(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = (os_log_t *)MEMORY[0x263F38100];
  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 136), v3);
    id v5 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v43 = "-[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:]_block_invoke_5";
      __int16 v44 = 2112;
      uint64_t v45 = v6;
      _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s CoreSpeech received the UUID from UI: %@", buf, 0x16u);
    }
  }
  if (!*(void *)(*(void *)(a1 + 40) + 48)) {
    [WeakRetained createKeywordDetector];
  }
  if (([WeakRetained _setupAudioSession] & 1) == 0)
  {
    id v11 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:]_block_invoke";
      id v16 = "%s AudioSession setup failed";
      goto LABEL_35;
    }
LABEL_14:
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = WeakRetained;
    uint64_t v10 = 5;
LABEL_15:
    [v9 closeSessionBeforeStartWithStatus:v10 successfully:0 completionWithResult:v8];
    goto LABEL_16;
  }
  if (!*(void *)(*(void *)(a1 + 40) + 40)) {
    [WeakRetained _createAudioAnalyzer];
  }
  if ([WeakRetained _shouldShowHeadsetDisconnectionMessage])
  {
    BOOL v7 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:]_block_invoke";
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Has wrong audio routing, ask user to unplug headset", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = WeakRetained;
    uint64_t v10 = 4;
    goto LABEL_15;
  }
  if (([WeakRetained _startAudioSession] & 1) == 0)
  {
    id v11 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:]_block_invoke";
      id v16 = "%s Start Audio Session failed";
LABEL_35:
      _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  char v12 = (void *)MEMORY[0x263F37FC8];
  [MEMORY[0x263F38038] utteranceFileASBD];
  [MEMORY[0x263F38038] utteranceFileASBD];
  uint64_t v13 = [v12 createAudioFileWriterForPHSTrainingWithInputFormat:v41 outputFormat:v40];
  uint64_t v14 = *(void *)(a1 + 40);
  int64_t v15 = *(void **)(v14 + 192);
  *(void *)(v14 + 192) = v13;

  if (*(unsigned char *)(a1 + 72))
  {
    [WeakRetained createSpeechRecognizer];
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 40);
    __int16 v18 = *(void **)(v17 + 104);
    *(void *)(v17 + 104) = 0;
  }
  int v19 = *(void **)(*(void *)(a1 + 40) + 144);
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  objc_msgSend(v19, "resetWithSampleRate:");
  uint64_t v20 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v43 = "-[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_DEFAULT, "%s Resetting zero counter", buf, 0xCu);
  }
  if (*(uint64_t *)(a1 + 64) <= 0) {
    id v21 = CSVTUITrainingSession;
  }
  else {
    id v21 = CSVTUITrainingSessionWithPayload;
  }
  id v22 = [v21 alloc];
  uint64_t v38 = *(void *)(a1 + 64);
  id v39 = v22;
  v23 = *(void **)(a1 + 40);
  uint64_t v24 = v23[9];
  uint64_t v25 = v23[2];
  uint64_t v26 = v23[3];
  uint64_t v27 = v23[4];
  uint64_t v28 = v23[6];
  uint64_t v29 = v23[13];
  BOOL v30 = +[SSRVTUITrainingManager sharedtrainingSessionQueue];
  uint64_t v31 = [v39 initWithUtteranceId:v38 sessionNumber:v24 Locale:v25 vtAssetConfigVersion:v26 audioSession:v27 keywordDetector:v28 speechRecognizer:v29 speechRecognitionRequest:0 sessionDelegate:v23 sessionDispatchQueue:v30 mhUUID:*(void *)(*(void *)(a1 + 40) + 136) zeroCounter:*(void *)(*(void *)(a1 + 40) + 144) completionWithResult:*(void *)(a1 + 48)];
  uint64_t v32 = *(void *)(a1 + 40);
  __int16 v33 = *(void **)(v32 + 64);
  *(void *)(v32 + 64) = v31;

  uint64_t v34 = *(void *)(a1 + 40);
  if (!*(void *)(v34 + 64))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = WeakRetained;
    uint64_t v10 = 3;
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(v34 + 56), "addObject:");
  [*(id *)(*(void *)(a1 + 40) + 64) startTraining];
  uint64_t v35 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v35 + 80))
  {
    [*(id *)(v35 + 64) suspendTraining];
    uint64_t v35 = *(void *)(a1 + 40);
  }
  uint64_t v36 = kCSVTUITrainingManagerSessionNo++;
  *(void *)(v35 + 72) = kCSVTUITrainingManagerSessionNo;
  uint64_t v37 = *(void *)(a1 + 40);
  if (!*(void *)(v37 + 72))
  {
    kCSVTUITrainingManagerSessionNo = v36 + 2;
    *(void *)(v37 + 72) = v36 + 2;
  }
LABEL_16:
}

void __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_2(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_3;
    v9[3] = &unk_264429038;
    id v11 = v8;
    char v13 = a3;
    id v10 = v7;
    uint64_t v12 = a4;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

uint64_t __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48));
}

- (int64_t)trainUtterance:(int64_t)a3 shouldUseASR:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__SSRVTUITrainingManager_trainUtterance_shouldUseASR_completion___block_invoke;
  v12[3] = &unk_264429010;
  id v13 = v8;
  id v9 = v8;
  int64_t v10 = [(SSRVTUITrainingManager *)self trainUtterance:a3 shouldUseASR:v5 mhUUID:0 completionWithResult:v12];

  return v10;
}

uint64_t __65__SSRVTUITrainingManager_trainUtterance_shouldUseASR_completion___block_invoke(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(result + 32);
  if (v4)
  {
    id v7 = a2;
    uint64_t v8 = [v7 sessionId];
    uint64_t v9 = [v7 sessionStatus];

    int64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16);
    return v10(v4, v8, v9, a3, a4);
  }
  return result;
}

- (void)destroySpeakerTrainer
{
  keywordDetector = self->_keywordDetector;
  self->_keywordDetector = 0;

  currentAsset = self->_currentAsset;
  self->_currentAsset = 0;
}

- (id)cleanupWithCompletion:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[SSRVTUITrainingManager cleanupWithCompletion:]";
    __int16 v28 = 2082;
    uint64_t v29 = "-[SSRVTUITrainingManager cleanupWithCompletion:]";
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}s Called", buf, 0x16u);
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke;
  v24[3] = &unk_264428FC0;
  id v6 = v4;
  id v25 = v6;
  id v7 = (void *)MEMORY[0x21D4B2740](v24);
  if (self->_shouldTrainViaXPC)
  {
    objc_initWeak((id *)buf, self->_trainingServiceClient);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_25;
    block[3] = &unk_264429AE0;
    block[4] = self;
    id v22 = v7;
    objc_copyWeak(&v23, (id *)buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v23);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v9 = +[SSRAssetManager sharedManager];
    [v9 releaseAssetsLocksIfNecessary];

    currentAsset = self->_currentAsset;
    self->_currentAsset = 0;

    int v11 = CSIsOSX();
    uint64_t v12 = self->_queue;
    if (v11)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_3;
      v20[3] = &unk_26442A618;
      v20[4] = self;
      dispatch_async(v12, v20);
      dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_29);
      [(CSDispatchGroup *)self->_didStopWaitingGroup waitWithTimeout:dispatch_time(0, 2000000000)];
      id v13 = self->_queue;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_30;
      v18[3] = &unk_26442A298;
      v18[4] = self;
      id v19 = v7;
      dispatch_async(v13, v18);
      uint64_t v14 = v19;
    }
    else
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_31;
      v16[3] = &unk_26442A298;
      v16[4] = self;
      id v17 = v7;
      dispatch_async(v12, v16);
      uint64_t v14 = v17;
    }
  }
  return 0;
}

void __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_2;
    block[3] = &unk_264428FC0;
    id v3 = v1;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_25(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 160);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_2_26;
  v3[3] = &unk_264428FE8;
  id v4 = *(id *)(a1 + 40);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  [v2 cleanupViaXPCWithCompletion:v3];
  objc_destroyWeak(&v5);
}

uint64_t __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[SSRVTUITrainingManager cleanupWithCompletion:]_block_invoke_3";
    __int16 v6 = 2082;
    id v7 = "-[SSRVTUITrainingManager cleanupWithCompletion:]_block_invoke_3";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s %{public}s async called", (uint8_t *)&v4, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 32) + 128) enter];
  if (([*(id *)(a1 + 32) _stopAudioSession] & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 128) leave];
  }
  return [*(id *)(a1 + 32) destroySpeakerTrainer];
}

uint64_t __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_30(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SSRVTUITrainingManager cleanupWithCompletion:]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Done waiting for didStop", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(a1 + 32) _destroyAudioSession];
  [*(id *)(*(void *)(a1 + 32) + 192) endAudio];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_31(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[SSRVTUITrainingManager cleanupWithCompletion:]_block_invoke";
    __int16 v6 = 2082;
    id v7 = "-[SSRVTUITrainingManager cleanupWithCompletion:]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s %{public}s async called", (uint8_t *)&v4, 0x16u);
  }
  [*(id *)(a1 + 32) _stopAudioSession];
  [*(id *)(a1 + 32) destroySpeakerTrainer];
  [*(id *)(a1 + 32) _destroyAudioSession];
  [*(id *)(*(void *)(a1 + 32) + 192) endAudio];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_27()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    uint64_t v2 = "-[SSRVTUITrainingManager cleanupWithCompletion:]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v0, OS_LOG_TYPE_DEFAULT, "%s Waiting for didStop", (uint8_t *)&v1, 0xCu);
  }
}

void __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_2_26(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [v2 invalidate];
}

uint64_t __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SSRVTUITrainingManager cleanupWithCompletion:]_block_invoke_2";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Called before completion called", (uint8_t *)&v4, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_destroyAudioSession
{
  audioSession = self->_audioSession;
  if (audioSession) {
    [(CSVTUIAudioSession *)audioSession releaseAudioSession];
  }
}

- (BOOL)_stopAudioSession
{
  audioSession = self->_audioSession;
  if (audioSession)
  {
    LODWORD(audioSession) = [(CSVTUIAudioSession *)audioSession isRecording];
    if (audioSession)
    {
      [(CSVTUIAudioSession *)self->_audioSession stopRecording];
      LOBYTE(audioSession) = 1;
    }
  }
  return (char)audioSession;
}

- (void)prepareWithCompletion:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke;
  v11[3] = &unk_264428F98;
  id v12 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x21D4B2740](v11);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke_3;
  block[3] = &unk_26442A298;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke_2;
    v4[3] = &unk_264428F70;
    id v5 = v2;
    char v6 = a2;
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
}

void __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 152))
  {
    uint64_t v3 = *(void **)(v2 + 160);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke_4;
    v5[3] = &unk_264428F98;
    id v6 = *(id *)(a1 + 40);
    [v3 prepareWithCompletion:v5];
  }
  else
  {
    id v4 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v8 = "-[SSRVTUITrainingManager prepareWithCompletion:]_block_invoke_3";
      __int16 v9 = 2080;
      id v10 = "-[SSRVTUITrainingManager prepareWithCompletion:]_block_invoke_3";
      _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s %s async called", buf, 0x16u);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    [*(id *)(v2 + 32) prepareRecord];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)createSpeechRecognizer
{
  speechRecognizer = self->_speechRecognizer;
  if (speechRecognizer)
  {
    self->_speechRecognizer = 0;
  }
  id v4 = objc_alloc(MEMORY[0x263F17B98]);
  id v7 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:self->_locale];
  id v5 = (SFSpeechRecognizer *)[v4 initWithLocale:v7];
  id v6 = self->_speechRecognizer;
  self->_speechRecognizer = v5;
}

- (BOOL)createKeywordDetector
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_locale)
  {
    currentAsset = self->_currentAsset;
    if (!currentAsset)
    {
      [(SSRVTUITrainingManager *)self _fetchCurrentAsset];
      currentAsset = self->_currentAsset;
    }
    id v4 = [MEMORY[0x263F380F8] decodeConfigFrom:currentAsset forFirstPassSource:0];
    if ([v4 useRecognizerCombination]
      && +[SSRUtils isMphVTUIKeywordDetectorSupportedPlatform])
    {
      if ([MEMORY[0x263F380D0] supportsMphForLanguageCode:self->_locale])
      {
        id v5 = [[CSVoiceTriggerUserSelectedPhrase alloc] initWithEndpointId:0];
        uint64_t v6 = [(CSVoiceTriggerUserSelectedPhrase *)v5 multiPhraseSelected];
      }
      else
      {
        uint64_t v6 = 0;
      }
      id v7 = [[CSVTUITwoPassKeywordDetector alloc] initWithAsset:self->_currentAsset supportMph:v6];
    }
    else
    {
      id v7 = [[CSVTUIKeywordDetector alloc] initWithAsset:self->_currentAsset];
    }
    keywordDetector = self->_keywordDetector;
    self->_keywordDetector = &v7->super;

    uint64_t v11 = self->_keywordDetector;
    BOOL v9 = v11 != 0;
    if (!v11)
    {
      id v12 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315138;
        int64_t v15 = "-[SSRVTUITrainingManager createKeywordDetector]";
        _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s Creation of Keyword Detector failed.", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else
  {
    id v8 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      int64_t v15 = "-[SSRVTUITrainingManager createKeywordDetector]";
      _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s No locale set when creating phrase spotter.", (uint8_t *)&v14, 0xCu);
    }
    return 0;
  }
  return v9;
}

- (void)fetchSpeechId
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F285E0]);
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  uint64_t v6 = (os_log_t *)MEMORY[0x263F38100];
  id v7 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v18 = "-[SSRVTUITrainingManager fetchSpeechId]";
    _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Fetching active account using AFSettingConnection...", buf, 0xCu);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __39__SSRVTUITrainingManager_fetchSpeechId__block_invoke;
  v15[3] = &unk_264428F48;
  id v8 = v4;
  uint64_t v16 = v8;
  [v2 fetchActiveAccount:v15];
  intptr_t v9 = dispatch_semaphore_wait(v8, v5);
  id v10 = [MEMORY[0x263EFF910] date];
  uint64_t v11 = *v6;
  BOOL v12 = os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315650;
      __int16 v18 = "-[SSRVTUITrainingManager fetchSpeechId]";
      __int16 v19 = 2050;
      double v20 = *(double *)&v9;
      __int16 v21 = 1026;
      int v22 = 5000;
      _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Timedout waiting for AFSettingsConnection:fetchActiveAccount: %{public}ld, waitedFor: %{public}d, Returning false", buf, 0x1Cu);
    }
  }
  else if (v12)
  {
    id v13 = v11;
    [v10 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 136315394;
    __int16 v18 = "-[SSRVTUITrainingManager fetchSpeechId]";
    __int16 v19 = 2050;
    double v20 = v14 * 1000.0;
    _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s timeToRet(AFSettingsConnection:fetchActiveAccount:): %{public}fms", buf, 0x16u);
  }
}

void __39__SSRVTUITrainingManager_fetchSpeechId__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (os_log_t *)MEMORY[0x263F38100];
  id v8 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    intptr_t v9 = v8;
    id v10 = [v5 debugDescription];
    int v14 = 136315394;
    int64_t v15 = "-[SSRVTUITrainingManager fetchSpeechId]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Active Assistant Account is %@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v11 = [v5 speechIdentifier];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  BOOL v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    int64_t v15 = "-[SSRVTUITrainingManager fetchSpeechId]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v11;
    _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s speechIdentifier is %@", (uint8_t *)&v14, 0x16u);
  }
  id v13 = +[SSRVoiceProfileComposer sharedTrainer];
  [v13 setSpeechIdForDonationLogging:v11];
}

- (void)setLocaleIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (self->_shouldTrainViaXPC)
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __46__SSRVTUITrainingManager_setLocaleIdentifier___block_invoke;
    v13[3] = &unk_26442A138;
    void v13[4] = self;
    id v14 = v5;
    dispatch_async(queue, v13);
  }
  else
  {
    objc_storeStrong((id *)&self->_locale, a3);
    [(SSRVTUITrainingManager *)self _fetchCurrentAsset];
    if (self->_keywordDetector) {
      [(SSRVTUITrainingManager *)self createKeywordDetector];
    }
    currentAsset = self->_currentAsset;
    if (currentAsset)
    {
      intptr_t v9 = [(CSAsset *)currentAsset configVersion];
      vtAssetConfigVersion = self->_vtAssetConfigVersion;
      self->_vtAssetConfigVersion = v9;
    }
    uint64_t v11 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      locale = self->_locale;
      *(_DWORD *)buf = 136315394;
      __int16 v16 = "-[SSRVTUITrainingManager setLocaleIdentifier:]";
      __int16 v17 = 2114;
      uint64_t v18 = locale;
      _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Locale: [%{public}@]", buf, 0x16u);
    }
    [(SSRVTUITrainingManager *)self fetchSpeechId];
  }
}

uint64_t __46__SSRVTUITrainingManager_setLocaleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) setLocaleIdentifier:*(void *)(a1 + 40)];
}

- (void)_fetchCurrentAsset
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[SSRAssetManager sharedManager];
  dispatch_semaphore_t v4 = [v3 installedAssetOfType:0 forLanguage:self->_locale];
  currentAsset = self->_currentAsset;
  self->_currentAsset = v4;

  id v6 = (os_log_t *)MEMORY[0x263F38100];
  if (!self->_currentAsset)
  {
    id v7 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      id v13 = "-[SSRVTUITrainingManager _fetchCurrentAsset]";
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Cannot find voicetrigger asset from asset manager, let's fallback to asset in the framework", (uint8_t *)&v12, 0xCu);
    }
    id v8 = [MEMORY[0x263F37FB0] defaultFallBackAssetForVoiceTrigger];
    intptr_t v9 = self->_currentAsset;
    self->_currentAsset = v8;
  }
  id v10 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = self->_currentAsset;
    int v12 = 136315394;
    id v13 = "-[SSRVTUITrainingManager _fetchCurrentAsset]";
    __int16 v14 = 2114;
    int64_t v15 = v11;
    _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerAsset found: %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (id)updateTrainingManagerForDevice:(unint64_t)a3 trainingDeviceUUIDList:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315651;
    intptr_t v9 = "-[SSRVTUITrainingManager updateTrainingManagerForDevice:trainingDeviceUUIDList:]";
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    __int16 v12 = 2113;
    id v13 = v5;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_INFO, "%s Remote device type: %zu, Remote device UUID list: %{private}@", (uint8_t *)&v8, 0x20u);
  }

  return 0;
}

- (SSRVTUITrainingManager)initWithLocaleIdentifier:(id)a3 withAudioSession:(id)a4 withAppDomain:(id)a5 shouldTrainViaXPC:(BOOL)a6 withSiriSharedUserId:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v33.receiver = self;
  v33.super_class = (Class)SSRVTUITrainingManager;
  uint64_t v16 = [(SSRVTUITrainingManager *)&v33 init];
  if (v16)
  {
    SSRLogInitIfNeeded();
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.VoiceTriggerUI.TrainingManager", 0);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v17;

    v16->_BOOL shouldTrainViaXPC = v8;
    if (v8)
    {
      uint64_t v19 = [[SSRVTUITrainingServiceClient alloc] initWithDelegate:v16];
      trainingServiceClient = v16->_trainingServiceClient;
      v16->_trainingServiceClient = v19;

      [(SSRVTUITrainingServiceClient *)v16->_trainingServiceClient setupWithLocaleID:v12 appDomain:v14 siriSharedUserId:v15];
    }
    else
    {
      [(SSRVTUITrainingManager *)v16 setLocaleIdentifier:v12];
      objc_storeStrong((id *)&v16->_audioSession, a4);
      [(CSVTUIAudioSession *)v16->_audioSession setDelegate:v16];
      v16->_suspendAudio = 0;
      keywordDetector = v16->_keywordDetector;
      v16->_keywordDetector = 0;

      id cleanupCompletion = v16->_cleanupCompletion;
      v16->_id cleanupCompletion = 0;

      uint64_t v23 = (CSDispatchGroup *)objc_alloc_init(MEMORY[0x263F38030]);
      didStopWaitingGroup = v16->_didStopWaitingGroup;
      v16->_didStopWaitingGroup = v23;

      id v25 = objc_alloc(MEMORY[0x263F38010]);
      uint64_t v26 = (objc_class *)objc_opt_class();
      uint64_t v27 = NSStringFromClass(v26);
      [MEMORY[0x263F38018] inputRecordingSampleRate];
      uint64_t v28 = objc_msgSend(v25, "initWithToken:sampleRate:numChannels:", v27, 1);
      audioZeroCounter = v16->_audioZeroCounter;
      v16->_audioZeroCounter = (CSAudioZeroCounter *)v28;

      uint64_t v30 = [[SSRVoiceProfile alloc] initNewVoiceProfileWithLocale:v12 withAppDomain:v14];
      profile = v16->_profile;
      v16->_profile = v30;

      if (v15) {
        [(SSRVoiceProfile *)v16->_profile setSharedSiriProfileId:v15];
      }
    }
  }

  return v16;
}

- (SSRVTUITrainingManager)initWithLocaleIdentifier:(id)a3 withAudioSession:(id)a4 withAppDomain:(id)a5
{
  return [(SSRVTUITrainingManager *)self initWithLocaleIdentifier:a3 withAudioSession:a4 withAppDomain:a5 shouldTrainViaXPC:0 withSiriSharedUserId:0];
}

- (SSRVoiceProfile)voiceProfile
{
  if (self->_shouldTrainViaXPC)
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x3032000000;
    intptr_t v9 = __Block_byref_object_copy__2124;
    __int16 v10 = __Block_byref_object_dispose__2125;
    id v11 = 0;
    queue = self->_queue;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __38__SSRVTUITrainingManager_voiceProfile__block_invoke;
    v5[3] = &unk_26442A648;
    void v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(queue, v5);
    uint64_t v3 = (SSRVoiceProfile *)(id)v7[5];
    _Block_object_dispose(&v6, 8);
  }
  else
  {
    uint64_t v3 = self->_profile;
  }

  return v3;
}

uint64_t __38__SSRVTUITrainingManager_voiceProfile__block_invoke(uint64_t a1)
{
  int v1 = *(void **)(*(void *)(a1 + 32) + 160);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__SSRVTUITrainingManager_voiceProfile__block_invoke_2;
  v3[3] = &unk_264428F20;
  void v3[4] = *(void *)(a1 + 40);
  return [v1 voiceProfileWithCompletion:v3];
}

void __38__SSRVTUITrainingManager_voiceProfile__block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)sharedtrainingSessionQueue
{
  if (sharedtrainingSessionQueue_onceToken != -1) {
    dispatch_once(&sharedtrainingSessionQueue_onceToken, &__block_literal_global_2132);
  }
  id v2 = (void *)sharedtrainingSessionQueue_sharedQueue;

  return v2;
}

uint64_t __52__SSRVTUITrainingManager_sharedtrainingSessionQueue__block_invoke()
{
  sharedtrainingSessionQueue_sharedQueue = (uint64_t)dispatch_queue_create("com.apple.VoiceTriggerUI.TrainingSessionQueue", 0);

  return MEMORY[0x270F9A758]();
}

+ (SSRVTUITrainingManager)trainingManagerWithLocaleID:(id)a3 withAppDomain:(id)a4 withSiriSharedUserId:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  SSRLogInitIfNeeded();
  uint64_t v10 = [MEMORY[0x263F380D0] isExclaveHardware];
  if (v10) {
    id v11 = 0;
  }
  else {
    id v11 = [[CSVTUIAudioSessionRecorder alloc] initWithDelegate:0];
  }
  id v12 = [[SSRVTUITrainingManager alloc] initWithLocaleIdentifier:v9 withAudioSession:v11 withAppDomain:v8 shouldTrainViaXPC:v10 withSiriSharedUserId:v7];

  return v12;
}

+ (SSRVTUITrainingManager)trainingManagerWithLocaleID:(id)a3 withAppDomain:(id)a4
{
  return +[SSRVTUITrainingManager trainingManagerWithLocaleID:a3 withAppDomain:a4 withSiriSharedUserId:0];
}

@end