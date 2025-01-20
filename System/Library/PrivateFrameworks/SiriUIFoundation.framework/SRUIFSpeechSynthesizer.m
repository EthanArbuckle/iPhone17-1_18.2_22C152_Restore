@interface SRUIFSpeechSynthesizer
- (AFQueue)_taskQueue;
- (BOOL)_isSynthesisQueueEmpty;
- (BOOL)isSpeaking;
- (NSMutableArray)_activeTasks;
- (NSMutableDictionary)_delayedTasks;
- (SRUIFSpeechSynthesizer)init;
- (SRUIFSpeechSynthesizerClientStateManagerDelegate)clientStateManagerDelegate;
- (SRUIFSpeechSynthesizerDelegate)delegate;
- (SiriTTSDaemonSession)ttsSession;
- (id)_activeTaskWithTTSRequest:(id)a3;
- (id)_filterVoices:(id)a3 gender:(id)a4;
- (int64_t)_genderForString:(id)a3;
- (int64_t)_speechFootPrintForVoice:(id)a3;
- (unsigned)audioSessionID;
- (void)_cancelByCancellingActiveTasksOnly:(BOOL)a3;
- (void)_duckTTSVolumeTo:(float)a3 rampTime:(double)a4 completion:(id)a5;
- (void)_enqueueText:(id)a3 audioData:(id)a4 identifier:(id)a5 sessionId:(id)a6 preferredVoice:(id)a7 language:(id)a8 gender:(id)a9 isPhonetic:(BOOL)a10 provisionally:(BOOL)a11 eligibleAfterDuration:(double)a12 delayed:(BOOL)a13 canUseServerTTS:(BOOL)a14 preparationIdentifier:(id)a15 shouldCache:(BOOL)a16 completion:(id)a17 analyticsContext:(id)a18 speakableContextInfo:(id)a19;
- (void)_findVoiceForLanguage:(id)a3 gender:(id)a4 completion:(id)a5;
- (void)_handleAudioData:(id)a3 completion:(id)a4;
- (void)_handleText:(id)a3 completion:(id)a4;
- (void)_processProvisionalTasks;
- (void)_processTaskQueue;
- (void)cancel;
- (void)dealloc;
- (void)didFinishAudioTask:(id)a3 withError:(id)a4;
- (void)didFinishSpeakTask:(id)a3 withError:(id)a4;
- (void)didStartAudioTask:(id)a3;
- (void)didStartSpeakTask:(id)a3;
- (void)duckTTSVolumeTo:(float)a3 rampTime:(double)a4 completion:(id)a5;
- (void)enqueueAudioData:(id)a3 identifier:(id)a4 sessionId:(id)a5 provisionally:(BOOL)a6 eligibleAfterDuration:(double)a7 completion:(id)a8;
- (void)enqueuePhaticWithCompletion:(id)a3;
- (void)enqueueSpeechSynthesisRequest:(id)a3;
- (void)enqueueText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6;
- (void)enqueueText:(id)a3 identifier:(id)a4 sessionId:(id)a5 language:(id)a6 gender:(id)a7 isPhonetic:(BOOL)a8 provisionally:(BOOL)a9 eligibleAfterDuration:(double)a10 delayed:(BOOL)a11 canUseServerTTS:(BOOL)a12 preparationIdentifier:(id)a13 completion:(id)a14 analyticsContext:(id)a15 speakableContextInfo:(id)a16;
- (void)enqueueText:(id)a3 identifier:(id)a4 sessionId:(id)a5 preferredVoice:(id)a6 language:(id)a7 gender:(id)a8 isPhonetic:(BOOL)a9 provisionally:(BOOL)a10 eligibleAfterDuration:(double)a11 delayed:(BOOL)a12 canUseServerTTS:(BOOL)a13 preparationIdentifier:(id)a14 completion:(id)a15 analyticsContext:(id)a16 speakableContextInfo:(id)a17;
- (void)invalidate;
- (void)isSynthesisQueueEmpty:(id)a3;
- (void)prewarmIfNeeded;
- (void)processDelayedItem:(id)a3;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setClientStateManagerDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOutputVoice:(id)a3;
- (void)setTtsSession:(id)a3;
- (void)skipCurrentSynthesis;
- (void)speakTask:(id)a3 didGenerateMetrics:(id)a4;
- (void)speakTask:(id)a3 didGenerateWordTimingInfo:(id)a4;
- (void)taskEligibilityDidChange:(id)a3;
@end

@implementation SRUIFSpeechSynthesizer

- (SRUIFSpeechSynthesizer)init
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)SRUIFSpeechSynthesizer;
  v2 = [(SRUIFSpeechSynthesizer *)&v24 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    activeTasks = v2->_activeTasks;
    v2->_activeTasks = (NSMutableArray *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    delayedTasks = v2->_delayedTasks;
    v2->_delayedTasks = v5;

    v7 = (AFQueue *)objc_alloc_init(MEMORY[0x263F285A8]);
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = v7;

    [(AFQueue *)v2->_taskQueue setDelegate:v2];
    v9 = [MEMORY[0x263F285A0] sharedPreferences];
    uint64_t v10 = [v9 outputVoice];
    outputVoice = v2->_outputVoice;
    v2->_outputVoice = (AFVoiceInfo *)v10;

    v12 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v2->_outputVoice;
      *(_DWORD *)buf = 136315394;
      v26 = "-[SRUIFSpeechSynthesizer init]";
      __int16 v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_225FBA000, v12, OS_LOG_TYPE_DEFAULT, "%s #tts outputVoice:%@", buf, 0x16u);
    }
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    availableVoicesForLanguage = v2->_availableVoicesForLanguage;
    v2->_availableVoicesForLanguage = v14;

    dispatch_queue_t v16 = dispatch_queue_create("SpeechSynthesisProcessingTasksQueue", 0);
    processingTasksQueue = v2->_processingTasksQueue;
    v2->_processingTasksQueue = (OS_dispatch_queue *)v16;

    v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v19 = dispatch_queue_create("SpeechSynthesisPendingTasksQueue", v18);
    pendingTasksQueue = v2->_pendingTasksQueue;
    v2->_pendingTasksQueue = (OS_dispatch_queue *)v19;

    dispatch_group_t v21 = dispatch_group_create();
    pendingTasksGroup = v2->_pendingTasksGroup;
    v2->_pendingTasksGroup = (OS_dispatch_group *)v21;
  }
  return v2;
}

- (SiriTTSDaemonSession)ttsSession
{
  if (!self->_ttsSession && AFDeviceSupportsTTS())
  {
    uint64_t v3 = (SiriTTSDaemonSession *)objc_alloc_init(MEMORY[0x263F74E20]);
    ttsSession = self->_ttsSession;
    self->_ttsSession = v3;
  }
  v5 = self->_ttsSession;
  return v5;
}

- (void)prewarmIfNeeded
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[SRUIFSpeechSynthesizer prewarmIfNeeded]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts", (uint8_t *)&v10, 0xCu);
  }
  id v4 = objc_alloc(MEMORY[0x263F74EA0]);
  v5 = [(AFVoiceInfo *)self->_outputVoice languageCode];
  v6 = [(AFVoiceInfo *)self->_outputVoice name];
  v7 = (void *)[v4 initWithLanguage:v5 name:v6];

  objc_msgSend(v7, "setFootprint:", -[SRUIFSpeechSynthesizer _speechFootPrintForVoice:](self, "_speechFootPrintForVoice:", self->_outputVoice));
  v8 = (void *)[objc_alloc(MEMORY[0x263F74E88]) initWithText:&stru_26D9AE000 voice:v7];
  v9 = [(SRUIFSpeechSynthesizer *)self ttsSession];
  [v9 prewarmWithRequest:v8 didFinish:&__block_literal_global_1];
}

void __41__SRUIFSpeechSynthesizer_prewarmIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      v5 = "-[SRUIFSpeechSynthesizer prewarmIfNeeded]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts Unable to prewarm session, error=%@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v6 = "-[SRUIFSpeechSynthesizer dealloc]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SRUIFSpeechSynthesizer;
  [(SRUIFSpeechSynthesizer *)&v4 dealloc];
}

- (BOOL)isSpeaking
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  objc_super v4 = [(SRUIFSpeechSynthesizer *)self ttsSession];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__SRUIFSpeechSynthesizer_isSpeaking__block_invoke;
  v8[3] = &unk_264785E40;
  int v10 = &v11;
  v5 = v3;
  v9 = v5;
  [v4 isSpeaking:v8];

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v6);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

intptr_t __36__SRUIFSpeechSynthesizer_isSpeaking__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)isSynthesisQueueEmpty:(id)a3
{
  id v4 = a3;
  processingTasksQueue = self->_processingTasksQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SRUIFSpeechSynthesizer_isSynthesisQueueEmpty___block_invoke;
  v7[3] = &unk_264785E90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(processingTasksQueue, v7);
}

void __48__SRUIFSpeechSynthesizer_isSynthesisQueueEmpty___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _isSynthesisQueueEmpty];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__SRUIFSpeechSynthesizer_isSynthesisQueueEmpty___block_invoke_2;
  v3[3] = &unk_264785E68;
  id v4 = *(id *)(a1 + 40);
  char v5 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __48__SRUIFSpeechSynthesizer_isSynthesisQueueEmpty___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (BOOL)_isSynthesisQueueEmpty
{
  dispatch_semaphore_t v3 = [(SRUIFSpeechSynthesizer *)self _activeTasks];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    char v5 = [(SRUIFSpeechSynthesizer *)self _taskQueue];
    BOOL v4 = [v5 count] == 0;
  }
  return v4;
}

- (void)duckTTSVolumeTo:(float)a3 rampTime:(double)a4 completion:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__SRUIFSpeechSynthesizer_duckTTSVolumeTo_rampTime_completion___block_invoke;
  v11[3] = &unk_264785B90;
  id v12 = v8;
  id v9 = v8;
  *(float *)&double v10 = a3;
  [(SRUIFSpeechSynthesizer *)self _duckTTSVolumeTo:v11 rampTime:v10 completion:a4];
}

void __62__SRUIFSpeechSynthesizer_duckTTSVolumeTo_rampTime_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__SRUIFSpeechSynthesizer_duckTTSVolumeTo_rampTime_completion___block_invoke_2;
  v6[3] = &unk_264785EB8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __62__SRUIFSpeechSynthesizer_duckTTSVolumeTo_rampTime_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)_duckTTSVolumeTo:(float)a3 rampTime:(double)a4 completion:(id)a5
{
  id v8 = a5;
  ttsSession = self->_ttsSession;
  if (ttsSession)
  {
    *(float *)&double v9 = a3;
    [(SiriTTSDaemonSession *)ttsSession adjustVolume:v8 rampTime:v9 didFinish:a4];
  }
  else if (v8)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__0;
    v15[4] = __Block_byref_object_dispose__0;
    id v11 = objc_alloc(MEMORY[0x263F087E8]);
    id v16 = (id)[v11 initWithDomain:*MEMORY[0x263F28730] code:6 userInfo:0];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__SRUIFSpeechSynthesizer__duckTTSVolumeTo_rampTime_completion___block_invoke;
    v12[3] = &unk_264785EE0;
    id v13 = v8;
    char v14 = v15;
    dispatch_async(MEMORY[0x263EF83A0], v12);

    _Block_object_dispose(v15, 8);
  }
}

uint64_t __63__SRUIFSpeechSynthesizer__duckTTSVolumeTo_rampTime_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)cancel
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SRUIFSpeechSynthesizer cancel]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts", (uint8_t *)&v4, 0xCu);
  }
  [(SRUIFSpeechSynthesizer *)self _cancelByCancellingActiveTasksOnly:0];
}

- (void)skipCurrentSynthesis
{
}

- (void)_cancelByCancellingActiveTasksOnly:(BOOL)a3
{
  objc_initWeak(&location, self);
  processingTasksQueue = self->_processingTasksQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SRUIFSpeechSynthesizer__cancelByCancellingActiveTasksOnly___block_invoke;
  block[3] = &unk_264785F28;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_async(processingTasksQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __61__SRUIFSpeechSynthesizer__cancelByCancellingActiveTasksOnly___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      int v4 = 0;
    }
    else
    {
      id v5 = [WeakRetained _taskQueue];
      int v4 = [v5 dequeueAllObjects];

      [v4 enumerateObjectsUsingBlock:&__block_literal_global_23];
    }
    uint64_t v6 = [v3 _activeTasks];
    id v7 = (void *)[v6 copy];

    [v7 enumerateObjectsUsingBlock:&__block_literal_global_25];
    BOOL v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[SRUIFSpeechSynthesizer _cancelByCancellingActiveTasksOnly:]_block_invoke";
      _os_log_impl(&dword_225FBA000, v8, OS_LOG_TYPE_DEFAULT, "%s #tts Canceling speech synthesis", buf, 0xCu);
    }
    if (v3[12])
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            char v14 = (void *)v3[12];
            v15 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "ttsSessionRequest", (void)v16);
            [v14 cancelWithRequest:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v11);
      }
    }
    objc_msgSend(v4, "makeObjectsPerformSelector:", sel_executeCompletion, (void)v16);
  }
}

uint64_t __61__SRUIFSpeechSynthesizer__cancelByCancellingActiveTasksOnly___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSynthesisResult:3];
}

uint64_t __61__SRUIFSpeechSynthesizer__cancelByCancellingActiveTasksOnly___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setSynthesisResult:3];
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[SRUIFSpeechSynthesizer invalidate]";
    __int16 v6 = 2112;
    id v7 = self;
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts Invalidating %@", (uint8_t *)&v4, 0x16u);
  }
  [(SRUIFSpeechSynthesizer *)self performSelectorOnMainThread:sel_invalidateOnMainThread withObject:0 waitUntilDone:1];
}

- (void)taskEligibilityDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SRUIFSpeechSynthesizer taskEligibilityDidChange:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s #tts task=%@", (uint8_t *)&v6, 0x16u);
  }
  [(SRUIFSpeechSynthesizer *)self _processTaskQueue];
}

- (void)didStartAudioTask:(id)a3
{
  id v4 = [a3 identifier];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SRUIFSpeechSynthesizer_didStartAudioTask___block_invoke;
  v6[3] = &unk_264785F50;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __44__SRUIFSpeechSynthesizer_didStartAudioTask___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 speechSynthesisDidStartSpeakingWithIdentifier:*(void *)(a1 + 40)];
}

- (void)didFinishAudioTask:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  objc_initWeak(&location, self);
  processingTasksQueue = self->_processingTasksQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke;
  v11[3] = &unk_2647859D0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(processingTasksQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *(id *)(a1 + 32);
    id v4 = [v3 ttsSessionRequest];
    id v5 = [v4 description];

    id v6 = [WeakRetained clientStateManagerDelegate];
    [v6 notifyClientStateManagerTransactionBegan:WeakRetained];

    id v7 = (os_log_t *)MEMORY[0x263F28348];
    __int16 v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v28 = "-[SRUIFSpeechSynthesizer didFinishAudioTask:withError:]_block_invoke";
      __int16 v29 = 2112;
      v30 = v5;
      __int16 v31 = 2112;
      uint64_t v32 = v9;
      _os_log_impl(&dword_225FBA000, v8, OS_LOG_TYPE_DEFAULT, "%s #tts request=%@ error=%@", buf, 0x20u);
    }
    if (v3)
    {
      id v10 = [WeakRetained _activeTasks];
      [v10 removeObject:v3];
    }
    else
    {
      uint64_t v11 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
        __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_cold_2(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    uint64_t v20 = *(void *)(a1 + 40);
    long long v19 = (void *)(a1 + 40);
    if (v20)
    {
      objc_msgSend(v3, "setSynthesisError:");
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
        __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_cold_1();
      }
    }
    else
    {
      dispatch_group_t v21 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[SRUIFSpeechSynthesizer didFinishAudioTask:withError:]_block_invoke";
        __int16 v29 = 2112;
        v30 = v5;
        _os_log_impl(&dword_225FBA000, v21, OS_LOG_TYPE_DEFAULT, "%s #tts Finished speaking presynthesized audio \"%@\"", buf, 0x16u);
      }
    }
    if (![v3 synthesisResult])
    {
      if (*v19) {
        uint64_t v22 = 2;
      }
      else {
        uint64_t v22 = 1;
      }
      [v3 setSynthesisResult:v22];
    }
    [v3 executeCompletion];
    [WeakRetained _processTaskQueue];
    uint64_t v23 = WeakRetained[3];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_30;
    v25[3] = &unk_264785F50;
    v25[4] = WeakRetained;
    id v26 = v3;
    id v24 = v3;
    dispatch_async(v23, v25);
  }
}

void __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_30(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 80) count])
  {
    id v2 = [*(id *)(a1 + 32) clientStateManagerDelegate];
    [v2 notifyClientStateManagerSpeakingEnded:*(void *)(a1 + 32)];
  }
  id v3 = [*(id *)(a1 + 32) clientStateManagerDelegate];
  [v3 notifyClientStateManagerTransactionEnded:*(void *)(a1 + 32)];

  LOBYTE(v3) = [*(id *)(a1 + 32) _isSynthesisQueueEmpty];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_2;
  block[3] = &unk_264785F78;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  char v7 = (char)v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  id v2 = [*(id *)(a1 + 40) identifier];
  [v3 speechSynthesisDidStopSpeakingWithIdentifier:v2 queueIsEmpty:*(unsigned __int8 *)(a1 + 48)];
}

- (void)didStartSpeakTask:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 ttsSessionRequest];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[SRUIFSpeechSynthesizer didStartSpeakTask:]";
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_225FBA000, v6, OS_LOG_TYPE_DEFAULT, "%s #tts Started:%@", buf, 0x16u);
  }
  char v7 = [v4 identifier];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__SRUIFSpeechSynthesizer_didStartSpeakTask___block_invoke;
  v9[3] = &unk_264785F50;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __44__SRUIFSpeechSynthesizer_didStartSpeakTask___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 speechSynthesisDidStartSpeakingWithIdentifier:*(void *)(a1 + 40)];
}

- (void)didFinishSpeakTask:(id)a3 withError:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 ttsSessionRequest];
  uint64_t v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    dispatch_group_t v21 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]";
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    _os_log_impl(&dword_225FBA000, v9, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Finished %@", buf, 0x16u);
  }
  kdebug_trace();
  objc_initWeak((id *)buf, self);
  processingTasksQueue = self->_processingTasksQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke;
  block[3] = &unk_264785FA0;
  objc_copyWeak(&v19, (id *)buf);
  id v15 = v7;
  id v16 = v6;
  id v17 = v8;
  uint64_t v18 = self;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(processingTasksQueue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained) {
    goto LABEL_38;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = (void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  int v7 = [v6 canUseServerTTS];
  id v8 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v9 = (void *)*MEMORY[0x263F28348];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v10) {
      goto LABEL_8;
    }
    id v11 = v9;
    id v12 = [v6 text];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136316162;
    v52 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
    __int16 v53 = 2112;
    id v54 = v12;
    __int16 v55 = 2112;
    uint64_t v56 = v13;
    __int16 v57 = 2112;
    uint64_t v58 = v14;
    __int16 v59 = 1024;
    BOOL v60 = v5 == 0;
    id v15 = "%s #tts [Post] text=\"%@\" error=%@ request=%@ finishedSpeaking=%i";
  }
  else
  {
    if (!v10) {
      goto LABEL_8;
    }
    id v11 = v9;
    id v12 = [v6 text];
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136316163;
    v52 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
    __int16 v53 = 2117;
    id v54 = v12;
    __int16 v55 = 2112;
    uint64_t v56 = v16;
    __int16 v57 = 2112;
    uint64_t v58 = v17;
    __int16 v59 = 1024;
    BOOL v60 = v5 == 0;
    id v15 = "%s #tts [Post] text=\"%{sensitive}@\" error=%@ request=%@ finishedSpeaking=%i";
  }
  _os_log_impl(&dword_225FBA000, v11, OS_LOG_TYPE_DEFAULT, v15, buf, 0x30u);

LABEL_8:
  uint64_t v18 = [WeakRetained clientStateManagerDelegate];
  [v18 notifyClientStateManagerTransactionBegan:WeakRetained];

  id v19 = *v8;
  uint64_t v20 = *v8;
  if (v6)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
      __int16 v53 = 2112;
      id v54 = v6;
      _os_log_impl(&dword_225FBA000, v19, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Removing Task: %@", buf, 0x16u);
    }
    dispatch_group_t v21 = [WeakRetained _activeTasks];
    [v21 removeObject:v6];
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_cold_3(v19, v22, v23, v24, v25, v26, v27, v28);
  }
  if (!*v4) {
    goto LABEL_28;
  }
  objc_msgSend(v6, "setSynthesisError:");
  BOOL v29 = +[SRUIFSpeechSynthesisUtility isSpeechSynthesisErrorUserCancelled:*v4];
  int v30 = [v6 canUseServerTTS];
  os_log_t v31 = *v8;
  uint64_t v32 = *v8;
  if (!v29)
  {
    BOOL v38 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v38) {
        __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_cold_1(v31, v6);
      }
    }
    else if (v38)
    {
      __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_cold_2(v31, v6);
    }
    goto LABEL_28;
  }
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
  if (v30)
  {
    if (v33)
    {
      v34 = v31;
      v35 = [v6 text];
      uint64_t v36 = *v4;
      *(_DWORD *)buf = 136315650;
      v52 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
      __int16 v53 = 2112;
      id v54 = v35;
      __int16 v55 = 2114;
      uint64_t v56 = v36;
      v37 = "%s #tts [Post] Synthesis was cancelled, marking speech request finished \"%@\": %{public}@";
LABEL_24:
      _os_log_impl(&dword_225FBA000, v34, OS_LOG_TYPE_DEFAULT, v37, buf, 0x20u);
    }
  }
  else if (v33)
  {
    v34 = v31;
    v35 = [v6 text];
    uint64_t v39 = *v4;
    *(_DWORD *)buf = 136315651;
    v52 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
    __int16 v53 = 2117;
    id v54 = v35;
    __int16 v55 = 2114;
    uint64_t v56 = v39;
    v37 = "%s #tts [Post] Synthesis was cancelled, marking speech request finished \"%{sensitive}@\": %{public}@";
    goto LABEL_24;
  }
  [v6 setSynthesisResult:1];
LABEL_28:
  if (![v6 synthesisResult])
  {
    os_log_t v40 = *v8;
    BOOL v41 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
    if (v5) {
      uint64_t v42 = 2;
    }
    else {
      uint64_t v42 = 1;
    }
    if (v41)
    {
      v43 = v40;
      v44 = SRUIFSpeechSynthesisResultGetName(v42);
      *(_DWORD *)buf = 136315394;
      v52 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
      __int16 v53 = 2112;
      id v54 = v44;
      _os_log_impl(&dword_225FBA000, v43, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Marking result %@", buf, 0x16u);
    }
    [v6 setSynthesisResult:v42];
  }
  v45 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
    __int16 v53 = 2112;
    id v54 = v6;
    _os_log_impl(&dword_225FBA000, v45, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Calling completion for Task: %@", buf, 0x16u);
  }
  [v6 executeCompletion];
  [WeakRetained _processTaskQueue];
  v46 = WeakRetained[3];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_32;
  block[3] = &unk_2647859D0;
  objc_copyWeak(&v50, v2);
  void block[4] = *(void *)(a1 + 56);
  id v49 = v6;
  id v47 = v6;
  dispatch_async(v46, block);

  objc_destroyWeak(&v50);
LABEL_38:
}

void __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_32(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = *MEMORY[0x263F28348];
  if (WeakRetained)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = WeakRetained[10];
      id v6 = v4;
      *(_DWORD *)buf = 136315394;
      dispatch_group_t v21 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
      __int16 v22 = 2048;
      uint64_t v23 = [v5 count];
      _os_log_impl(&dword_225FBA000, v6, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Active Task count: %tu", buf, 0x16u);
    }
    if (![WeakRetained[10] count])
    {
      int v7 = [WeakRetained clientStateManagerDelegate];
      [v7 notifyClientStateManagerSpeakingEnded:*(void *)(a1 + 32)];
    }
    id v8 = [WeakRetained clientStateManagerDelegate];
    [v8 notifyClientStateManagerTransactionEnded:*(void *)(a1 + 32)];

    LOBYTE(v8) = [WeakRetained _isSynthesisQueueEmpty];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_33;
    block[3] = &unk_2647859A8;
    objc_copyWeak(&v18, v2);
    id v17 = *(id *)(a1 + 40);
    char v19 = (char)v8;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v18);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_32_cold_1(v4, v9, v10, v11, v12, v13, v14, v15);
  }
}

void __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_33(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained delegate];
  id v3 = [*(id *)(a1 + 32) identifier];
  [v2 speechSynthesisDidStopSpeakingWithIdentifier:v3 queueIsEmpty:*(unsigned __int8 *)(a1 + 48)];
}

- (void)speakTask:(id)a3 didGenerateMetrics:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 canUseServerTTS];
  uint64_t v9 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v10 = (void *)*MEMORY[0x263F28348];
  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v11) {
      goto LABEL_7;
    }
    uint64_t v12 = v10;
    uint64_t v13 = [v6 text];
    uint64_t v14 = [v6 ttsSessionRequest];
    *(_DWORD *)buf = 136315650;
    __int16 v59 = "-[SRUIFSpeechSynthesizer speakTask:didGenerateMetrics:]";
    __int16 v60 = 2112;
    uint64_t v61 = v13;
    __int16 v62 = 2112;
    v63 = v14;
    uint64_t v15 = "%s #tts [Post] text=%@ request=%@";
  }
  else
  {
    if (!v11) {
      goto LABEL_7;
    }
    uint64_t v12 = v10;
    uint64_t v13 = [v6 text];
    uint64_t v14 = [v6 ttsSessionRequest];
    *(_DWORD *)buf = 136315651;
    __int16 v59 = "-[SRUIFSpeechSynthesizer speakTask:didGenerateMetrics:]";
    __int16 v60 = 2117;
    uint64_t v61 = v13;
    __int16 v62 = 2112;
    v63 = v14;
    uint64_t v15 = "%s #tts [Post] text=%{sensitive}@ request=%@";
  }
  _os_log_impl(&dword_225FBA000, v12, OS_LOG_TYPE_DEFAULT, v15, buf, 0x20u);

LABEL_7:
  os_log_t v16 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v16;
    id v18 = [v6 ttsSessionRequest];
    *(_DWORD *)buf = 136315394;
    __int16 v59 = "-[SRUIFSpeechSynthesizer speakTask:didGenerateMetrics:]";
    __int16 v60 = 2112;
    uint64_t v61 = v18;
    _os_log_impl(&dword_225FBA000, v17, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Finished Metrics generated %@", buf, 0x16u);
  }
  if (v7)
  {
    id v47 = self;
    uint64_t v19 = [v6 analyticsContext];
    uint64_t v20 = (void *)v19;
    dispatch_group_t v21 = (void *)MEMORY[0x263EFFA78];
    if (v19) {
      __int16 v22 = (void *)v19;
    }
    else {
      __int16 v22 = (void *)MEMORY[0x263EFFA78];
    }
    id v23 = v22;

    uint64_t v24 = [MEMORY[0x263F283F8] sharedAnalytics];
    uint64_t v25 = [MEMORY[0x263F08C38] UUID];
    uint64_t v26 = [v25 UUIDString];

    v48 = [MEMORY[0x263EFF9A0] dictionary];
    [v48 setObject:v26 forKey:@"id"];
    uint64_t v56 = @"id";
    v46 = (void *)v26;
    uint64_t v57 = v26;
    uint64_t v27 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    if (AFIsInternalInstall())
    {
      id v54 = @"text";
      uint64_t v28 = [v6 text];
      BOOL v29 = (void *)v28;
      int v30 = &stru_26D9AE000;
      if (v28) {
        int v30 = (__CFString *)v28;
      }
      __int16 v55 = v30;
      dispatch_group_t v21 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    }
    uint64_t v31 = [v7 requestCreatedTime];
    if (v31)
    {
      uint64_t v32 = v31;
      v53[0] = v48;
      v53[1] = v23;
      v53[2] = v21;
      BOOL v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:3];
      v34 = AFAnalyticsContextsMerge();
      [v24 logEventWithType:1801 machAbsoluteTime:v32 context:v34];
    }
    uint64_t v35 = [v7 speechBeginTime];
    if (v35)
    {
      v52[0] = v27;
      v52[1] = v23;
      v52[2] = v21;
      uint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:3];
      v37 = AFAnalyticsContextsMerge();
      [v24 logEventWithType:1802 machAbsoluteTime:v35 context:v37];
    }
    uint64_t v38 = [v7 speechEndTime];
    if (v38)
    {
      v51[0] = v27;
      v51[1] = v23;
      v51[2] = v21;
      uint64_t v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:3];
      os_log_t v40 = AFAnalyticsContextsMerge();
      [v24 logEventWithType:1803 machAbsoluteTime:v38 context:v40];
    }
    id v41 = objc_alloc(MEMORY[0x263F28698]);
    uint64_t v42 = [v6 text];
    v43 = (void *)[v41 initWithUtterance:v42 beginTimestamp:v35 endTimestamp:v38];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__SRUIFSpeechSynthesizer_speakTask_didGenerateMetrics___block_invoke;
    block[3] = &unk_264785F50;
    void block[4] = v47;
    id v50 = v43;
    id v44 = v43;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    os_log_t v45 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)) {
      -[SRUIFSpeechSynthesizer speakTask:didGenerateMetrics:](v45, v6);
    }
  }
}

void __55__SRUIFSpeechSynthesizer_speakTask_didGenerateMetrics___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 speechSynthesisDidFinish:*(void *)(a1 + 40)];
}

- (void)speakTask:(id)a3 didGenerateWordTimingInfo:(id)a4
{
  id v6 = a4;
  id v7 = [a3 identifier];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SRUIFSpeechSynthesizer_speakTask_didGenerateWordTimingInfo___block_invoke;
  block[3] = &unk_264785FC8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __62__SRUIFSpeechSynthesizer_speakTask_didGenerateWordTimingInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 speechSynthesisDidReceiveWordTimingInfo:*(void *)(a1 + 40) withIdentifier:*(void *)(a1 + 48)];
  }
}

- (void)setOutputVoice:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  outputVoice = self->_outputVoice;
  p_outputVoice = &self->_outputVoice;
  id v6 = outputVoice;
  if (!outputVoice || ([(AFVoiceInfo *)v6 isEqual:v5] & 1) == 0)
  {
    id v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      id v12 = "-[SRUIFSpeechSynthesizer setOutputVoice:]";
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_225FBA000, v9, OS_LOG_TYPE_DEFAULT, "%s #tts Updating synthesizer voice to %@", (uint8_t *)&v11, 0x16u);
    }
    objc_storeStrong((id *)p_outputVoice, a3);
    uint64_t v10 = [MEMORY[0x263F285A0] sharedPreferences];
    [v10 synchronizeVoiceServicesLanguageCode];
  }
}

- (void)enqueueSpeechSynthesisRequest:(id)a3
{
  id v3 = a3;
  id v21 = [v3 text];
  uint64_t v19 = [v3 audioData];
  id v18 = [v3 identifier];
  id v17 = [v3 sessionId];
  os_log_t v16 = [v3 language];
  id v4 = [v3 gender];
  char v5 = [v3 isPhonetic];
  char v6 = [v3 provisional];
  double v7 = (double)[v3 eligibleAfterDuration];
  char v8 = [v3 delayed];
  char v9 = [v3 canUseServerTTS];
  uint64_t v10 = [v3 preparationIdentifier];
  int v11 = [v3 completion];
  id v12 = [v3 analyticsContext];
  __int16 v13 = [v3 speakableContextInfo];

  LOBYTE(v15) = 1;
  BYTE3(v14) = v9;
  BYTE2(v14) = v8;
  BYTE1(v14) = v6;
  LOBYTE(v14) = v5;
  -[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:](self, "_enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:", v21, v19, v18, v17, 0, v16, v7, v4, v14, v10, v15, v11, v12, v13);
}

- (void)enqueueText:(id)a3 identifier:(id)a4 sessionId:(id)a5 language:(id)a6 gender:(id)a7 isPhonetic:(BOOL)a8 provisionally:(BOOL)a9 eligibleAfterDuration:(double)a10 delayed:(BOOL)a11 canUseServerTTS:(BOOL)a12 preparationIdentifier:(id)a13 completion:(id)a14 analyticsContext:(id)a15 speakableContextInfo:(id)a16
{
  LOBYTE(v17) = 1;
  WORD1(v16) = __PAIR16__(a12, a11);
  BYTE1(v16) = a9;
  LOBYTE(v16) = a8;
  -[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:](self, "_enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:", a3, 0, a4, a5, 0, a6, a10, a7, v16, a13, v17, a14, a15, a16);
}

- (void)enqueueText:(id)a3 identifier:(id)a4 sessionId:(id)a5 preferredVoice:(id)a6 language:(id)a7 gender:(id)a8 isPhonetic:(BOOL)a9 provisionally:(BOOL)a10 eligibleAfterDuration:(double)a11 delayed:(BOOL)a12 canUseServerTTS:(BOOL)a13 preparationIdentifier:(id)a14 completion:(id)a15 analyticsContext:(id)a16 speakableContextInfo:(id)a17
{
  LOBYTE(v18) = 1;
  WORD1(v17) = __PAIR16__(a13, a12);
  LOWORD(v17) = __PAIR16__(a10, a9);
  -[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:](self, "_enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:", a3, 0, a4, a5, a6, a7, a11, a8, v17, a14, v18, a15, a16, a17);
}

- (void)enqueueAudioData:(id)a3 identifier:(id)a4 sessionId:(id)a5 provisionally:(BOOL)a6 eligibleAfterDuration:(double)a7 completion:(id)a8
{
  LOBYTE(v9) = 1;
  WORD1(v8) = 256;
  BYTE1(v8) = a6;
  LOBYTE(v8) = 0;
  -[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:](self, "_enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:", 0, a3, a4, a5, 0, 0, a7, 0, v8, 0, v9, a8, 0, 0);
}

- (void)enqueuePhaticWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v11 = "-[SRUIFSpeechSynthesizer enqueuePhaticWithCompletion:]";
    _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s #phatic [Pre]", buf, 0xCu);
  }
  char v6 = [MEMORY[0x263F08C38] UUID];
  double v7 = [v6 UUIDString];

  LOBYTE(v9) = 0;
  LODWORD(v8) = 0x1000000;
  -[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:](self, "_enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:", @"\x1B\\mrk=play=phat\\"", 0, v7, v7, 0, 0, 0.0, 0, v8, 0, v9, v4, 0, 0);
}

- (void)_enqueueText:(id)a3 audioData:(id)a4 identifier:(id)a5 sessionId:(id)a6 preferredVoice:(id)a7 language:(id)a8 gender:(id)a9 isPhonetic:(BOOL)a10 provisionally:(BOOL)a11 eligibleAfterDuration:(double)a12 delayed:(BOOL)a13 canUseServerTTS:(BOOL)a14 preparationIdentifier:(id)a15 shouldCache:(BOOL)a16 completion:(id)a17 analyticsContext:(id)a18 speakableContextInfo:(id)a19
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v46 = a3;
  id v25 = a4;
  id v45 = a5;
  id v26 = a6;
  id v52 = a7;
  id v51 = a8;
  id v50 = a9;
  id v27 = a15;
  id v49 = a17;
  id v48 = a18;
  id v44 = a19;
  uint64_t v28 = *MEMORY[0x263F28348];
  BOOL v29 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (a14)
  {
    int v30 = v46;
    if (!v29) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    __int16 v62 = "-[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic"
          ":provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:anal"
          "yticsContext:speakableContextInfo:]";
    __int16 v63 = 2112;
    id v64 = v46;
    uint64_t v31 = "%s #tts [Pre] text:%@";
  }
  else
  {
    int v30 = v46;
    if (!v29) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315395;
    __int16 v62 = "-[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic"
          ":provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:anal"
          "yticsContext:speakableContextInfo:]";
    __int16 v63 = 2117;
    id v64 = v46;
    uint64_t v31 = "%s #tts [Pre] text:%{sensitive}@";
  }
  _os_log_impl(&dword_225FBA000, v28, OS_LOG_TYPE_DEFAULT, v31, buf, 0x16u);
LABEL_7:
  uint64_t v32 = v25;
  BOOL v33 = self;
  if (v27)
  {
    objc_initWeak((id *)buf, self);
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __255__SRUIFSpeechSynthesizer__enqueueText_audioData_identifier_sessionId_preferredVoice_language_gender_isPhonetic_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_preparationIdentifier_shouldCache_completion_analyticsContext_speakableContextInfo___block_invoke;
    v56[3] = &unk_264786018;
    objc_copyWeak(&v59, (id *)buf);
    id v57 = v27;
    id v58 = v30;
    BOOL v60 = a14;
    v34 = (void *)MEMORY[0x22A643DA0](v56);

    objc_destroyWeak(&v59);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v34 = 0;
  }
  uint64_t v35 = [SRUIFSpeechSynthesisTask alloc];
  double v36 = 0.0;
  if (a11) {
    double v36 = a12;
  }
  LOBYTE(v43) = a14;
  LOWORD(v42) = __PAIR16__(a13, a11);
  v37 = -[SRUIFSpeechSynthesisTask initWithText:audioData:identifier:sessionId:preferredVoice:language:gender:provisional:eligibleAfterDuration:delayed:preparation:completion:analyticsContext:speakableContextInfo:canUseServerTTS:eligibilityChangedQueue:](v35, "initWithText:audioData:identifier:sessionId:preferredVoice:language:gender:provisional:eligibleAfterDuration:delayed:preparation:completion:analyticsContext:speakableContextInfo:canUseServerTTS:eligibilityChangedQueue:", v30, v25, v45, v26, v52, v51, v36, v50, v42, v34, v49, v48, v44, v43, self->_processingTasksQueue);
  [(SRUIFSpeechSynthesisTask *)v37 setIsPhonetic:a10];
  [(SRUIFSpeechSynthesisTask *)v37 setDelegate:self];
  [(SRUIFSpeechSynthesisTask *)v37 setShouldCache:a16];
  if (a13)
  {
    if (v45)
    {
      uint64_t v38 = [(SRUIFSpeechSynthesizer *)self _delayedTasks];
      [v38 setObject:v37 forKeyedSubscript:v45];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        -[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:]();
      }
      [(SRUIFSpeechSynthesisTask *)v37 setDelayed:0];
    }
    BOOL v33 = self;
  }
  kdebug_trace();
  uint64_t v39 = v33;
  processingTasksQueue = v33->_processingTasksQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __255__SRUIFSpeechSynthesizer__enqueueText_audioData_identifier_sessionId_preferredVoice_language_gender_isPhonetic_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_preparationIdentifier_shouldCache_completion_analyticsContext_speakableContextInfo___block_invoke_51;
  block[3] = &unk_264785F50;
  id v54 = v37;
  __int16 v55 = v39;
  id v41 = v37;
  dispatch_async(processingTasksQueue, block);
}

void __255__SRUIFSpeechSynthesizer__enqueueText_audioData_identifier_sessionId_preferredVoice_language_gender_isPhonetic_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_preparationIdentifier_shouldCache_completion_analyticsContext_speakableContextInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    char v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      __int16 v13 = "-[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonet"
            "ic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:"
            "analyticsContext:speakableContextInfo:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Preparation %@", buf, 0x16u);
    }
    id v7 = objc_loadWeakRetained(WeakRetained + 7);

    if (v7)
    {
      id v8 = objc_loadWeakRetained(WeakRetained + 7);
      uint64_t v9 = *(void *)(a1 + 32);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __255__SRUIFSpeechSynthesizer__enqueueText_audioData_identifier_sessionId_preferredVoice_language_gender_isPhonetic_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_preparationIdentifier_shouldCache_completion_analyticsContext_speakableContextInfo___block_invoke_47;
      v10[3] = &unk_264785FF0;
      id v11 = v3;
      [v8 speechSynthesisGetPreparedTextForIdentifier:v9 completion:v10];
    }
    else
    {
      (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
    }
  }
}

uint64_t __255__SRUIFSpeechSynthesizer__enqueueText_audioData_identifier_sessionId_preferredVoice_language_gender_isPhonetic_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_preparationIdentifier_shouldCache_completion_analyticsContext_speakableContextInfo___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __255__SRUIFSpeechSynthesizer__enqueueText_audioData_identifier_sessionId_preferredVoice_language_gender_isPhonetic_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_preparationIdentifier_shouldCache_completion_analyticsContext_speakableContextInfo___block_invoke_51(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    uint64_t v6 = "-[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:"
         "provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyt"
         "icsContext:speakableContextInfo:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_225FBA000, v2, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Enqueueing task: %@", (uint8_t *)&v5, 0x16u);
  }
  id v4 = [*(id *)(a1 + 40) _taskQueue];
  [v4 enqueueObject:*(void *)(a1 + 32)];
}

- (void)enqueueText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6
{
  LOBYTE(v7) = 1;
  LODWORD(v6) = 0x1000000;
  -[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:](self, "_enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:", a3, 0, a4, a5, 0, 0, 0.0, 0, v6, 0, v7, a6, 0, 0);
}

- (void)processDelayedItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(SRUIFSpeechSynthesizer *)self _delayedTasks];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];
    [v6 setDelayed:0];

    uint64_t v7 = [(SRUIFSpeechSynthesizer *)self _delayedTasks];
    [v7 removeObjectForKey:v4];
  }
  else
  {
    uint64_t v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFSpeechSynthesizer processDelayedItem:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)_handleAudioData:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SRUIFSpeechSynthesizer _handleAudioData:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_225FBA000, v9, OS_LOG_TYPE_DEFAULT, "%s #tts %@", buf, 0x16u);
  }
  uint64_t v10 = [(SRUIFSpeechSynthesizer *)self clientStateManagerDelegate];
  [v10 notifyClientStateManagerTransactionBegan:self];

  uint64_t v11 = [v6 audioData];
  uint64_t v40 = 0;
  memset(buf, 0, sizeof(buf));
  uint64_t v12 = [v6 audioData];
  uint64_t v13 = [v12 decoderStreamDescription];
  ASBDForSAUIAD(v13, (uint64_t)buf);

  id v14 = objc_alloc_init(MEMORY[0x263F74E00]);
  *(_OWORD *)v37 = *(_OWORD *)buf;
  *(_OWORD *)&v37[16] = *(_OWORD *)&buf[16];
  uint64_t v38 = v40;
  [v14 setAsbd:v37];
  uint64_t v15 = [v11 audioBuffer];
  [v14 setAudioData:v15];

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F74E10]) initWithAudio:v14];
  [v16 setAudioSessionId:self->_audioSessionID];
  id v17 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v18 = [v6 sessionId];
  uint64_t v19 = (void *)[v17 initWithUUIDString:v18];
  [v16 setSiriRequestId:v19];

  if (objc_opt_respondsToSelector())
  {
    id v20 = objc_alloc(MEMORY[0x263F08C38]);
    id v21 = [v6 identifier];
    __int16 v22 = (void *)[v20 initWithUUIDString:v21];
    [v16 setSiriAceViewId:v22];
  }
  objc_initWeak(&location, self);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __54__SRUIFSpeechSynthesizer__handleAudioData_completion___block_invoke;
  v33[3] = &unk_264785A48;
  objc_copyWeak(&v35, &location);
  id v23 = v6;
  id v34 = v23;
  [v16 setDidStartSpeaking:v33];
  [v23 setTtsSessionRequest:v16];
  uint64_t v24 = [(SRUIFSpeechSynthesizer *)self ttsSession];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __54__SRUIFSpeechSynthesizer__handleAudioData_completion___block_invoke_2;
  v30[3] = &unk_264786040;
  objc_copyWeak(&v32, &location);
  id v25 = v23;
  id v31 = v25;
  [v24 speakWithAudioRequest:v16 didFinish:v30];

  id v26 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v37 = 136315394;
    *(void *)&v37[4] = "-[SRUIFSpeechSynthesizer _handleAudioData:completion:]";
    *(_WORD *)&v37[12] = 2112;
    *(void *)&v37[14] = v25;
    _os_log_impl(&dword_225FBA000, v26, OS_LOG_TYPE_DEFAULT, "%s #tts started presynthesized audio for %@", v37, 0x16u);
  }
  kdebug_trace();
  id v27 = [(SRUIFSpeechSynthesizer *)self _activeTasks];
  [v27 addObject:v25];

  uint64_t v28 = [(SRUIFSpeechSynthesizer *)self clientStateManagerDelegate];
  [v28 notifyClientStateManagerSpeakingBegan:self];

  BOOL v29 = [(SRUIFSpeechSynthesizer *)self clientStateManagerDelegate];
  [v29 notifyClientStateManagerTransactionEnded:self];

  if (v7) {
    v7[2](v7);
  }

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __54__SRUIFSpeechSynthesizer__handleAudioData_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didStartAudioTask:*(void *)(a1 + 32)];
}

void __54__SRUIFSpeechSynthesizer__handleAudioData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained didFinishAudioTask:*(void *)(a1 + 32) withError:v4];
}

- (void)_handleText:(id)a3 completion:(id)a4
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v71 = (id *)a4;
  int v7 = [v6 canUseServerTTS];
  uint64_t v8 = (void *)*MEMORY[0x263F28348];
  BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = v8;
      uint64_t v11 = [v6 text];
      *(_DWORD *)buf = 136315394;
      v99 = "-[SRUIFSpeechSynthesizer _handleText:completion:]";
      __int16 v100 = 2112;
      v101 = v11;
      _os_log_impl(&dword_225FBA000, v10, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] text:%@", buf, 0x16u);
    }
  }
  else if (v9)
  {
    uint64_t v12 = v8;
    uint64_t v13 = [v6 text];
    *(_DWORD *)buf = 136315395;
    v99 = "-[SRUIFSpeechSynthesizer _handleText:completion:]";
    __int16 v100 = 2117;
    v101 = v13;
    _os_log_impl(&dword_225FBA000, v12, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] text:%{sensitive}@", buf, 0x16u);
  }
  id v14 = [(SRUIFSpeechSynthesizer *)self clientStateManagerDelegate];
  [v14 notifyClientStateManagerTransactionBegan:self];

  uint64_t v15 = [v6 text];
  int v16 = [v6 isPhonetic];
  if (v15) {
    int v17 = v16;
  }
  else {
    int v17 = 0;
  }
  if (v17 == 1)
  {
    uint64_t v18 = [[NSString alloc] initWithFormat:@"\x1B/+%@\x1B/+", v15];

    uint64_t v15 = (void *)v18;
  }
  uint64_t v19 = [v6 language];
  if (v19)
  {
    id v20 = [(AFVoiceInfo *)self->_outputVoice languageCode];
    id v21 = [v6 language];
    BOOL v22 = [v20 caseInsensitiveCompare:v21] != 0;
  }
  else
  {
    BOOL v22 = 0;
  }

  id v23 = [v6 gender];
  int v24 = !v22;
  if (v23)
  {
    id v25 = [(AFVoiceInfo *)self->_outputVoice genderString];
    id v26 = [v6 gender];
    BOOL v27 = [v25 caseInsensitiveCompare:v26] == 0;

    v24 &= v27;
  }
  uint64_t v28 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    outputVoice = self->_outputVoice;
    int v30 = v28;
    id v31 = [(AFVoiceInfo *)outputVoice languageCode];
    id v32 = [(AFVoiceInfo *)self->_outputVoice genderString];
    if (v24) {
      BOOL v33 = @"matches";
    }
    else {
      BOOL v33 = @"mismatches";
    }
    id v34 = [v6 language];
    id v35 = [v6 gender];
    *(_DWORD *)buf = 136316418;
    v99 = "-[SRUIFSpeechSynthesizer _handleText:completion:]";
    __int16 v100 = 2112;
    v101 = v31;
    __int16 v102 = 2112;
    v103 = v32;
    __int16 v104 = 2112;
    v105 = v33;
    __int16 v106 = 2112;
    v107 = v34;
    __int16 v108 = 2112;
    v109 = v35;
    _os_log_impl(&dword_225FBA000, v30, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Output voice [%@, %@] %@ specified language %@, gender %@", buf, 0x3Eu);
  }
  v94[0] = MEMORY[0x263EF8330];
  v94[1] = 3221225472;
  v94[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke;
  v94[3] = &unk_264786068;
  id v36 = v6;
  id v95 = v36;
  v96 = self;
  v37 = v71;
  v97 = v37;
  uint64_t v38 = (void *)MEMORY[0x22A643DA0](v94);
  objc_initWeak(&location, self);
  v86[0] = MEMORY[0x263EF8330];
  v86[1] = 3221225472;
  v86[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_66;
  v86[3] = &unk_2647860E0;
  objc_copyWeak(&v92, &location);
  id v39 = v15;
  id v87 = v39;
  id v40 = v36;
  id v88 = v40;
  id v41 = v38;
  v89 = self;
  id v90 = v41;
  uint64_t v42 = v37;
  v91 = v42;
  uint64_t v43 = (void (**)(void, void))MEMORY[0x22A643DA0](v86);
  v82[0] = MEMORY[0x263EF8330];
  v82[1] = 3221225472;
  v82[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_77;
  v82[3] = &unk_264786108;
  id v44 = v40;
  id v83 = v44;
  v84 = self;
  id v45 = v42;
  v85 = v45;
  id v46 = (void (**)(void))MEMORY[0x22A643DA0](v82);
  v78[0] = MEMORY[0x263EF8330];
  v78[1] = 3221225472;
  v78[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_78;
  v78[3] = &unk_264786108;
  id v47 = v44;
  id v79 = v47;
  v80 = self;
  id v48 = v45;
  v81 = v48;
  id v49 = (void *)MEMORY[0x22A643DA0](v78);
  if (v39)
  {
    if (v24)
    {
      id v50 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v99 = "-[SRUIFSpeechSynthesizer _handleText:completion:]";
        _os_log_impl(&dword_225FBA000, v50, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] outputVoiceMatches", buf, 0xCu);
      }
      ((void (**)(void, AFVoiceInfo *))v43)[2](v43, self->_outputVoice);
    }
    else
    {
      id v59 = [v47 preferredVoice];
      BOOL v60 = *MEMORY[0x263F28348];
      BOOL v61 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
      v70 = v59;
      if (v59)
      {
        if (v61)
        {
          *(_DWORD *)buf = 136315138;
          v99 = "-[SRUIFSpeechSynthesizer _handleText:completion:]";
          _os_log_impl(&dword_225FBA000, v60, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Using preferredVoice", buf, 0xCu);
        }
        id v62 = objc_alloc(MEMORY[0x263F286E0]);
        __int16 v63 = [v59 languageString];
        id v64 = [v59 name];
        id v65 = (id)[v62 initWithLanguageCode:v63 gender:0 isCustom:0 name:v64 footprint:0 contentVersion:0 masteredVersion:0];

        ((void (**)(void, id))v43)[2](v43, v65);
      }
      else
      {
        if (v61)
        {
          *(_DWORD *)buf = 136315138;
          v99 = "-[SRUIFSpeechSynthesizer _handleText:completion:]";
          _os_log_impl(&dword_225FBA000, v60, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] No match for output voice", buf, 0xCu);
        }
        v66 = [v47 language];
        v67 = v66;
        if (v66)
        {
          id v69 = v66;
        }
        else
        {
          id v69 = [(AFVoiceInfo *)self->_outputVoice languageCode];
        }

        v68 = [v47 gender];
        v72[0] = MEMORY[0x263EF8330];
        v72[1] = 3221225472;
        v72[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_80;
        v72[3] = &unk_264786158;
        objc_copyWeak(&v77, &location);
        id v73 = v47;
        v75 = v43;
        id v65 = v69;
        id v74 = v65;
        id v76 = v49;
        [(SRUIFSpeechSynthesizer *)self _findVoiceForLanguage:v65 gender:v68 completion:v72];

        objc_destroyWeak(&v77);
      }
    }
  }
  else
  {
    id v51 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFSpeechSynthesizer _handleText:completion:](v51, v52, v53, v54, v55, v56, v57, v58);
    }
    v46[2](v46);
  }

  objc_destroyWeak(&v92);
  objc_destroyWeak(&location);
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_cold_1((uint64_t)v3, a1, v4);
  }
  if (![*(id *)(a1 + 32) synthesisResult]) {
    [*(id *)(a1 + 32) setSynthesisResult:2];
  }
  [*(id *)(a1 + 32) setSynthesisError:v3];
  [*(id *)(a1 + 32) executeCompletion];
  int v5 = [*(id *)(a1 + 40) clientStateManagerDelegate];
  [v5 notifyClientStateManagerTransactionEnded:*(void *)(a1 + 40)];

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_66(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v3;
    _os_log_impl(&dword_225FBA000, v4, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Success ValidOutputVoice:%@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v6 = objc_alloc(MEMORY[0x263F74EA0]);
    int v7 = [v3 languageCode];
    uint64_t v8 = [v3 name];
    id v39 = (void *)[v6 initWithLanguage:v7 name:v8];

    BOOL v9 = (void *)[objc_alloc(MEMORY[0x263F74E78]) initWithText:*(void *)(a1 + 32) voice:v39];
    if (_os_feature_enabled_impl())
    {
      uint64_t v10 = [MEMORY[0x263F285A0] sharedPreferences];
      uint64_t v11 = [v10 siriSpeechRate];
      [v11 floatValue];
      int v13 = v12;

      LODWORD(v14) = v13;
      [v9 setRate:v14];
    }
    id v15 = objc_alloc(MEMORY[0x263F08C38]);
    int v16 = [*(id *)(a1 + 40) sessionId];
    int v17 = (void *)[v15 initWithUUIDString:v16];
    [v9 setSiriRequestId:v17];

    if (objc_opt_respondsToSelector())
    {
      id v18 = objc_alloc(MEMORY[0x263F08C38]);
      uint64_t v19 = [*(id *)(a1 + 40) identifier];
      id v20 = (void *)[v18 initWithUUIDString:v19];
      [v9 setSiriAceViewId:v20];
    }
    id v21 = [*(id *)(a1 + 40) speakableContextInfo];
    [v9 setContextInfo:v21];

    objc_msgSend(v9, "setPrivacySensitive:", objc_msgSend(*(id *)(a1 + 40), "canUseServerTTS") ^ 1);
    objc_msgSend(v9, "setAudioSessionId:", objc_msgSend(WeakRetained, "audioSessionID"));
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_70;
    void v52[3] = &unk_264785A48;
    objc_copyWeak(&v54, (id *)(a1 + 72));
    id v53 = *(id *)(a1 + 40);
    [v9 setDidStartSpeaking:v52];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_2;
    v49[3] = &unk_264786090;
    id location = &v51;
    objc_copyWeak(&v51, (id *)(a1 + 72));
    id v50 = *(id *)(a1 + 40);
    [v9 setDidReportInstrument:v49];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_3;
    v46[3] = &unk_2647860B8;
    objc_copyWeak(&v48, (id *)(a1 + 72));
    id v47 = *(id *)(a1 + 40);
    [v9 setDidGenerateWordTimings:v46];
    if ([*(id *)(a1 + 32) isEqualToString:@"\x1B\\mrk=play=phat\\""])
    {
      dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v58) = 0;
      id v23 = objc_msgSend(WeakRetained, "ttsSession", &v51);
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_4;
      v43[3] = &unk_264785E40;
      id v45 = buf;
      int v24 = v22;
      id v44 = v24;
      [v23 queryPhaticCapabilityWithVoice:v39 reply:v43];

      dispatch_time_t v25 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v24, v25);
      if (!*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        uint64_t v35 = *(void *)(a1 + 56);
        id v36 = [MEMORY[0x263F28508] errorWithCode:401];
        (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v36);

        v37 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v55 = 136315138;
          uint64_t v56 = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke_5";
          _os_log_impl(&dword_225FBA000, v37, OS_LOG_TYPE_DEFAULT, "%s #phatic [Post] Fail! Phatic Not Supported", v55, 0xCu);
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_21;
      }

      _Block_object_dispose(buf, 8);
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", @"\x1B\\mrk=play=phat\\"", location))
    {
      id v26 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke";
        _os_log_impl(&dword_225FBA000, v26, OS_LOG_TYPE_DEFAULT, "%s #phatic [Pre] Success", buf, 0xCu);
      }
    }
    BOOL v27 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_225FBA000, v27, OS_LOG_TYPE_DEFAULT, "%s #tts 24 [Pre] Calling speakWithSpeechRequest:%@", buf, 0x16u);
    }
    uint64_t v28 = [WeakRetained ttsSession];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_74;
    v40[3] = &unk_264786040;
    objc_copyWeak(&v42, (id *)(a1 + 72));
    id v41 = *(id *)(a1 + 40);
    [v28 speakWithSpeechRequest:v9 didFinish:v40];

    BOOL v29 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke_2";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v58 = v30;
      _os_log_impl(&dword_225FBA000, v29, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Started synthesis, %@, %@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) setTtsSessionRequest:v9];
    kdebug_trace();
    id v31 = [WeakRetained _activeTasks];
    [v31 addObject:*(void *)(a1 + 40)];

    id v32 = [*(id *)(a1 + 48) clientStateManagerDelegate];
    [v32 notifyClientStateManagerSpeakingBegan:*(void *)(a1 + 48)];

    BOOL v33 = [*(id *)(a1 + 48) clientStateManagerDelegate];
    [v33 notifyClientStateManagerTransactionEnded:*(void *)(a1 + 48)];

    uint64_t v34 = *(void *)(a1 + 64);
    if (v34) {
      (*(void (**)(void))(v34 + 16))();
    }

    objc_destroyWeak(&v42);
LABEL_21:

    objc_destroyWeak(&v48);
    objc_destroyWeak(location);

    objc_destroyWeak(&v54);
  }
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didStartSpeakTask:*(void *)(a1 + 32)];
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained speakTask:*(void *)(a1 + 32) didGenerateMetrics:v4];
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained speakTask:*(void *)(a1 + 32) didGenerateWordTimingInfo:v4];
}

intptr_t __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_4(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_74(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained didFinishSpeakTask:*(void *)(a1 + 32) withError:v4];
}

uint64_t __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_77(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke";
    _os_log_impl(&dword_225FBA000, v2, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] No text, marking finished", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 32) setSynthesisResult:1];
  [*(id *)(a1 + 32) executeCompletion];
  id v3 = [*(id *)(a1 + 40) clientStateManagerDelegate];
  [v3 notifyClientStateManagerTransactionEnded:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_78(uint64_t a1)
{
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_78_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  [*(id *)(a1 + 32) setSynthesisResult:2];
  [*(id *)(a1 + 32) executeCompletion];
  uint64_t v10 = [*(id *)(a1 + 40) clientStateManagerDelegate];
  [v10 notifyClientStateManagerTransactionEnded:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_80(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 8);
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[4];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_2_81;
    v7[3] = &unk_264786130;
    objc_copyWeak(&v13, a1 + 8);
    id v8 = v3;
    id v9 = a1[4];
    id v11 = a1[6];
    id v10 = a1[5];
    id v12 = a1[7];
    dispatch_async(v6, v7);

    objc_destroyWeak(&v13);
  }
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_2_81(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v4 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void **)(a1 + 40);
        uint64_t v6 = v4;
        uint64_t v7 = [v5 language];
        id v8 = [*(id *)(a1 + 40) gender];
        id v9 = *(void **)(a1 + 32);
        int v20 = 136315906;
        id v21 = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke_2";
        __int16 v22 = 2112;
        id v23 = v7;
        __int16 v24 = 2112;
        dispatch_time_t v25 = v8;
        __int16 v26 = 2112;
        BOOL v27 = v9;
        _os_log_impl(&dword_225FBA000, v6, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Found voice for %@ %@: %@", (uint8_t *)&v20, 0x2Au);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      id v10 = [WeakRetained[2] objectForKey:*(void *)(a1 + 48)];
      uint64_t v11 = [v10 count];

      if (v11)
      {
        id v12 = [v3[2] objectForKey:*(void *)(a1 + 48)];
        id v13 = [v12 firstObject];

        double v14 = (void *)*MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          id v15 = *(void **)(a1 + 40);
          int v16 = v14;
          int v17 = [v15 language];
          id v18 = [*(id *)(a1 + 40) gender];
          int v20 = 136315906;
          id v21 = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke";
          __int16 v22 = 2112;
          id v23 = v17;
          __int16 v24 = 2112;
          dispatch_time_t v25 = v18;
          __int16 v26 = 2112;
          BOOL v27 = v13;
          _os_log_impl(&dword_225FBA000, v16, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] No voice for %@ %@. Using %@", (uint8_t *)&v20, 0x2Au);
        }
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      else
      {
        uint64_t v19 = (void *)*MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
          __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_2_81_cold_1(a1, v19);
        }
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
    }
  }
}

- (void)_processTaskQueue
{
  objc_initWeak(&location, self);
  processingTasksQueue = self->_processingTasksQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke;
  v4[3] = &unk_264785A20;
  objc_copyWeak(&v5, &location);
  dispatch_async(processingTasksQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = (os_log_t *)MEMORY[0x263F28348];
    uint64_t v4 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      uint64_t v6 = [(dispatch_group_t *)WeakRetained _activeTasks];
      uint64_t v7 = [v6 count];
      id v8 = [(dispatch_group_t *)WeakRetained _taskQueue];
      *(_DWORD *)buf = 136315650;
      id v47 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
      __int16 v48 = 2048;
      uint64_t v49 = v7;
      __int16 v50 = 2048;
      uint64_t v51 = [v8 count];
      _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s #tts activeTasks=%tu taskQueue=%tu", buf, 0x20u);
    }
    id v9 = [(dispatch_group_t *)WeakRetained _taskQueue];
    id v10 = [(dispatch_group_t *)WeakRetained _activeTasks];
    if ([v10 count])
    {
LABEL_5:
    }
    else
    {
      *(void *)&long long v11 = 136315395;
      long long v39 = v11;
      while (1)
      {
        BOOL v12 = objc_msgSend(v9, "count", v39) == 0;

        if (v12) {
          break;
        }
        [(dispatch_group_t *)WeakRetained _processProvisionalTasks];
        id v10 = [v9 frontObject];
        int v13 = [v10 canUseServerTTS];
        os_log_t v14 = *v3;
        BOOL v15 = os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            int v16 = v14;
            int v17 = [v10 text];
            id v18 = [v10 identifier];
            *(_DWORD *)buf = 136315650;
            id v47 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
            __int16 v48 = 2112;
            uint64_t v49 = (uint64_t)v17;
            __int16 v50 = 2112;
            uint64_t v51 = (uint64_t)v18;
            _os_log_impl(&dword_225FBA000, v16, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Processing task text=\"%@\" identifier=%@", buf, 0x20u);
          }
        }
        else if (v15)
        {
          uint64_t v19 = v14;
          int v20 = [v10 text];
          id v21 = [v10 identifier];
          *(_DWORD *)buf = 136315651;
          id v47 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
          __int16 v48 = 2117;
          uint64_t v49 = (uint64_t)v20;
          __int16 v50 = 2112;
          uint64_t v51 = (uint64_t)v21;
          _os_log_impl(&dword_225FBA000, v19, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Processing task text=\"%{sensitive}@\" identifier=%@", buf, 0x20u);
        }
        if (([v10 isEligibleForSynthesis] & 1) == 0)
        {
          uint64_t v38 = *v3;
          if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            id v47 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
            __int16 v48 = 2112;
            uint64_t v49 = (uint64_t)v10;
            _os_log_impl(&dword_225FBA000, v38, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] task not eligible: %@", buf, 0x16u);
          }
          goto LABEL_5;
        }
        id v22 = (id)[v9 dequeueObject];
        id v23 = [v10 audioData];

        if (v23)
        {
          dispatch_group_enter(WeakRetained[5]);
          os_log_t v24 = *v3;
          if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
          {
            dispatch_time_t v25 = v24;
            __int16 v26 = [v10 audioData];
            *(_DWORD *)buf = 136315394;
            id v47 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
            __int16 v48 = 2112;
            uint64_t v49 = (uint64_t)v26;
            _os_log_impl(&dword_225FBA000, v25, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Audio Data:%@", buf, 0x16u);
          }
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke_82;
          v42[3] = &unk_264785A20;
          objc_copyWeak(&v43, v1);
          [(dispatch_group_t *)WeakRetained _handleAudioData:v10 completion:v42];
          dispatch_group_wait(WeakRetained[5], 0xFFFFFFFFFFFFFFFFLL);
          objc_destroyWeak(&v43);
        }
        else
        {
          BOOL v27 = [v10 text];

          if (v27)
          {
            int v28 = [v10 canUseServerTTS];
            os_log_t v29 = *v3;
            BOOL v30 = os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT);
            if (v28)
            {
              if (v30)
              {
                id v31 = v29;
                id v32 = [v10 text];
                *(_DWORD *)buf = 136315394;
                id v47 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke_2";
                __int16 v48 = 2112;
                uint64_t v49 = (uint64_t)v32;
                _os_log_impl(&dword_225FBA000, v31, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] text:%@", buf, 0x16u);
              }
            }
            else if (v30)
            {
              uint64_t v34 = v29;
              uint64_t v35 = [v10 text];
              *(_DWORD *)buf = v39;
              id v47 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
              __int16 v48 = 2117;
              uint64_t v49 = (uint64_t)v35;
              _os_log_impl(&dword_225FBA000, v34, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] text:%{sensitive}@", buf, 0x16u);
            }
            dispatch_group_enter(WeakRetained[5]);
            v40[0] = MEMORY[0x263EF8330];
            v40[1] = 3221225472;
            v40[2] = __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke_84;
            v40[3] = &unk_264785A20;
            objc_copyWeak(&v41, v1);
            [(dispatch_group_t *)WeakRetained _handleText:v10 completion:v40];
            id v36 = *v3;
            if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              id v47 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke_2";
              _os_log_impl(&dword_225FBA000, v36, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Pending Tasks Group Wait", buf, 0xCu);
            }
            dispatch_group_wait(WeakRetained[5], 0xFFFFFFFFFFFFFFFFLL);
            v37 = *v3;
            if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              id v47 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
              _os_log_impl(&dword_225FBA000, v37, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Pending Tasks Group Complete", buf, 0xCu);
            }
            objc_destroyWeak(&v41);
          }
          else
          {
            BOOL v33 = *v3;
            if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR)) {
              __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke_cold_1(v44, &v45, v33);
            }
            [v10 executeCompletion];
          }
        }

        id v10 = [(dispatch_group_t *)WeakRetained _activeTasks];
        if ([v10 count]) {
          goto LABEL_5;
        }
      }
    }
  }
}

void __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke_82(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    dispatch_group_leave(WeakRetained[5]);
    id WeakRetained = v2;
  }
}

void __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke_84(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    dispatch_group_leave(WeakRetained[5]);
    id WeakRetained = v2;
  }
}

- (id)_activeTaskWithTTSRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = __Block_byref_object_copy__0;
  int v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  id v5 = [(SRUIFSpeechSynthesizer *)self _activeTasks];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__SRUIFSpeechSynthesizer__activeTaskWithTTSRequest___block_invoke;
  v9[3] = &unk_264786180;
  id v6 = v4;
  id v10 = v6;
  long long v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__SRUIFSpeechSynthesizer__activeTaskWithTTSRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 ttsSessionRequest];
  id v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_findVoiceForLanguage:(id)a3 gender:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  long long v11 = [(NSMutableDictionary *)self->_availableVoicesForLanguage objectForKey:v8];

  if (v11)
  {
    uint64_t v12 = [(NSMutableDictionary *)self->_availableVoicesForLanguage objectForKey:v8];
    int v13 = [(SRUIFSpeechSynthesizer *)self _filterVoices:v12 gender:v9];

    if (v10) {
      v10[2](v10, v13);
    }
  }
  else
  {
    int v13 = [MEMORY[0x263F286E0] allVoicesForSiriSessionLanguage:v8];
    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    os_log_t v24 = __66__SRUIFSpeechSynthesizer__findVoiceForLanguage_gender_completion___block_invoke;
    dispatch_time_t v25 = &unk_2647861A8;
    id v15 = v8;
    id v26 = v15;
    id v16 = v14;
    id v27 = v16;
    [v13 enumerateObjectsUsingBlock:&v22];
    if (objc_msgSend(v16, "count", v22, v23, v24, v25))
    {
      id v17 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        id v18 = NSNumber;
        uint64_t v19 = v17;
        int v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
        *(_DWORD *)buf = 136315650;
        os_log_t v29 = "-[SRUIFSpeechSynthesizer _findVoiceForLanguage:gender:completion:]";
        __int16 v30 = 2112;
        id v31 = v15;
        __int16 v32 = 2112;
        BOOL v33 = v20;
        _os_log_impl(&dword_225FBA000, v19, OS_LOG_TYPE_DEFAULT, "%s #tts %@ has %@ available Voices", buf, 0x20u);
      }
      [(NSMutableDictionary *)self->_availableVoicesForLanguage setObject:v16 forKey:v15];
      id v21 = [(SRUIFSpeechSynthesizer *)self _filterVoices:v16 gender:v9];
      if (v10) {
        v10[2](v10, v21);
      }
    }
    else if (v10)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        -[SRUIFSpeechSynthesizer _findVoiceForLanguage:gender:completion:]();
      }
      v10[2](v10, 0);
    }
  }
}

void __66__SRUIFSpeechSynthesizer__findVoiceForLanguage_gender_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 languageCode];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (int64_t)_genderForString:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (v3)
  {
    if ([v3 caseInsensitiveCompare:@"female"])
    {
      if ([v4 caseInsensitiveCompare:@"male"])
      {
        if ([v4 caseInsensitiveCompare:@"neutral"]) {
          int64_t v5 = 0;
        }
        else {
          int64_t v5 = 3;
        }
      }
      else
      {
        int64_t v5 = 1;
      }
    }
    else
    {
      int64_t v5 = 2;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)_filterVoices:(id)a3 gender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(SRUIFSpeechSynthesizer *)self _genderForString:v7];
  uint64_t v20 = 0;
  id v21 = (id *)&v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__0;
  os_log_t v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__SRUIFSpeechSynthesizer__filterVoices_gender___block_invoke;
  v13[3] = &unk_2647861D0;
  v13[5] = &v14;
  v13[6] = v8;
  v13[4] = &v20;
  [v6 enumerateObjectsUsingBlock:v13];
  id v9 = v21[5];
  if (!v9)
  {
    id v10 = (void *)v15[5];
    if (v10)
    {
      objc_storeStrong(v21 + 5, v10);
      id v9 = v21[5];
    }
    else
    {
      id v9 = 0;
    }
  }
  id v11 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __47__SRUIFSpeechSynthesizer__filterVoices_gender___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v9 = v7;
  if (!a1[6] || (v8 = [v7 gender] == a1[6], id v7 = v9, v8))
  {
    if ([v7 isCustom])
    {
      objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
      *a4 = 1;
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    }
    id v7 = v9;
  }
}

- (void)_processProvisionalTasks
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [(SRUIFSpeechSynthesizer *)self _taskQueue];
  id v3 = [v2 frontObject];
  if ([v3 isProvisional])
  {
    int64_t v5 = (os_log_t *)MEMORY[0x263F28348];
    *(void *)&long long v4 = 136315394;
    long long v10 = v4;
    do
    {
      if ((unint64_t)objc_msgSend(v2, "count", v10) <= 1) {
        break;
      }
      id v6 = [v2 objectAtIndex:1];
      int v7 = [v6 isEligibleForProcessing];

      if (!v7) {
        goto LABEL_11;
      }
      BOOL v8 = [v2 dequeueObject];
      id v9 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v10;
        uint64_t v12 = "-[SRUIFSpeechSynthesizer _processProvisionalTasks]";
        __int16 v13 = 2112;
        uint64_t v14 = v8;
        _os_log_impl(&dword_225FBA000, v9, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Discarding %@; it is provisional and there are other tasks enqueued",
          buf,
          0x16u);
      }
      if (![v8 synthesisResult]) {
        [v8 setSynthesisResult:2];
      }
      [v8 executeCompletion];

      id v3 = [v2 frontObject];
    }
    while (([v3 isProvisional] & 1) != 0);
  }

LABEL_11:
}

- (int64_t)_speechFootPrintForVoice:(id)a3
{
  int64_t result = [a3 footprint];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (SRUIFSpeechSynthesizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRUIFSpeechSynthesizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SRUIFSpeechSynthesizerClientStateManagerDelegate)clientStateManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientStateManagerDelegate);
  return (SRUIFSpeechSynthesizerClientStateManagerDelegate *)WeakRetained;
}

- (void)setClientStateManagerDelegate:(id)a3
{
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (AFQueue)_taskQueue
{
  return self->_taskQueue;
}

- (NSMutableArray)_activeTasks
{
  return self->_activeTasks;
}

- (NSMutableDictionary)_delayedTasks
{
  return self->_delayedTasks;
}

- (void)setTtsSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttsSession, 0);
  objc_storeStrong((id *)&self->_delayedTasks, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_destroyWeak((id *)&self->_clientStateManagerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingTasksGroup, 0);
  objc_storeStrong((id *)&self->_pendingTasksQueue, 0);
  objc_storeStrong((id *)&self->_processingTasksQueue, 0);
  objc_storeStrong((id *)&self->_availableVoicesForLanguage, 0);
  objc_storeStrong((id *)&self->_outputVoice, 0);
}

void __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_cold_1()
{
  LODWORD(v2) = 136315650;
  *(void *)((char *)&v2 + 4) = "-[SRUIFSpeechSynthesizer didFinishAudioTask:withError:]_block_invoke";
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_225FBA000, v0, v1, "%s #tts Unable to finish speaking presynthesized request\"%@\": %{public}@", (void)v2, DWORD2(v2));
}

void __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  long long v4 = [a2 text];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_225FBA000, v5, v6, "%s #tts [Post] Unable to finish speaking \"%@\": %{public}@", v7, v8, v9, v10, 2u);
}

void __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_cold_2(void *a1, void *a2)
{
  id v3 = a1;
  long long v4 = [a2 text];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_225FBA000, v5, v6, "%s #tts [Post] Unable to finish speaking \"%{sensitive}@\": %{public}@", v7, v8, v9, v10, 3u);
}

void __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_32_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_225FBA000, a1, a3, "%s #tts strongSelf==nil", a5, a6, a7, a8, 2u);
}

- (void)speakTask:(void *)a1 didGenerateMetrics:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a1;
  long long v4 = [a2 ttsSessionRequest];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225FBA000, v3, OS_LOG_TYPE_ERROR, "%s #tts [Post] Event metrics was missing for the request\"%@\"", (uint8_t *)v5, 0x16u);
}

- (void)_enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225FBA000, v0, OS_LOG_TYPE_ERROR, "%s #tts [Pre] Task is delayed but no identifier provided. This will likely result in out-of-order TTS: %@", (uint8_t *)v1, 0x16u);
}

- (void)processDelayedItem:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleText:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 136315650;
  *(void *)&void v3[4] = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_4(&dword_225FBA000, a2, a3, "%s #tts [Post] Synthesis failed for with %@ for %@ ", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *(void *)(a2 + 32));
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_78_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_2_81_cold_1(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = [v3 language];
  uint64_t v12 = [*(id *)(a1 + 40) gender];
  OUTLINED_FUNCTION_3(&dword_225FBA000, v6, v7, "%s #tts [Pre] Could not find voice for %@ %@", v8, v9, v10, v11, 2u);
}

void __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s #tts [Pre] Invalid speak request. No text and no audio data", buf, 0xCu);
}

- (void)_findVoiceForLanguage:gender:completion:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_225FBA000, v0, v1, "%s #tts No voice found for language: %@ gender: %@", v2);
}

@end