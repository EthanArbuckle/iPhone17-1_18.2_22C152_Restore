@interface VTXPCConnection
+ (void)initialize;
- (VTXPCConnection)init;
- (void)_setPhraseSpotterBypassing:(BOOL)a3;
- (void)clearVoiceTriggerCount;
- (void)enableTriggerEventXPCNotification:(BOOL)a3;
- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4 timestamp:(double)a5;
- (void)getFirstChanceAudioBufferWithReply:(id)a3;
- (void)getFirstChanceTriggeredDateWithReply:(id)a3;
- (void)getFirstChanceVTEventInfoWithReply:(id)a3;
- (void)getTestResponse:(id)a3;
- (void)getVoiceTriggerCountWithReply:(id)a3;
- (void)handleDisconnect;
- (void)isLastTriggerFollowedBySpeechWithReply:(id)a3;
- (void)notifySecondChanceRequest;
- (void)notifyTriggerEventRequest;
- (void)notifyVoiceTriggeredSiriSessionCancelled:(id)a3;
- (void)queryLastTriggerEventTypeWithReply:(id)a3;
- (void)requestAudioCapture:(double)a3;
- (void)requestCurrentBuiltInRTModelDictionaryWithReply:(id)a3;
- (void)requestCurrentVoiceTriggerAssetDictionaryWithReply:(id)a3;
- (void)resetAssertions;
- (void)setCurrentBuiltInRTModelDictionary:(id)a3;
- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4 timestamp:(double)a5;
- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4 timestamp:(double)a5;
@end

@implementation VTXPCConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasher, 0);

  objc_storeStrong((id *)&self->_activationAssertions, 0);
}

- (void)enableTriggerEventXPCNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67240192;
    v7[1] = v3;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "EnableTriggerEventXPCNotification: %{public}d", (uint8_t *)v7, 8u);
  }
  v5 = +[VTTriggerEventMonitorManager sharedManager];
  v6 = [MEMORY[0x263F08D68] currentConnection];
  if (v3) {
    [v5 addConnection:v6];
  }
  else {
    [v5 removeConnection:v6];
  }
}

- (void)setCurrentBuiltInRTModelDictionary:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Setting builtIn RTModel dictionary : %{public}@", (uint8_t *)&v6, 0xCu);
  }
  v5 = +[VTBuiltInRTModel sharedInstance];
  [v5 setBuiltInRTModelDictionary:v3];
}

- (void)requestCurrentBuiltInRTModelDictionaryWithReply:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = (void (**)(id, void *))a3;
  v4 = +[VTBuiltInRTModel sharedInstance];
  v5 = [v4 builtInRTModelDictionary];

  if (v3)
  {
    int v6 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "returning builtIn RTModel dictionary : %{public}@", (uint8_t *)&v7, 0xCu);
    }
    v3[2](v3, v5);
  }
}

- (void)requestCurrentVoiceTriggerAssetDictionaryWithReply:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = (void (**)(id, void *))a3;
  v4 = +[VTPhraseSpotter currentSpotter];
  v5 = [v4 assetDictionary];
  if (v3)
  {
    int v6 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "returning asset dictionary : %{public}@", (uint8_t *)&v7, 0xCu);
    }
    v3[2](v3, v5);
  }
}

- (void)requestAudioCapture:(double)a3
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  if (a3 <= 0.0)
  {
    uint64_t v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 134349056;
      *(id *)((char *)location + 4) = *(id *)&a3;
      _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "::: Not capturing given wrong duration: %{public}.3f", (uint8_t *)location, 0xCu);
    }
  }
  else
  {
    if (requestAudioCapture__onceToken != -1) {
      dispatch_once(&requestAudioCapture__onceToken, &__block_literal_global_29);
    }
    v5 = +[VTPhraseSpotter currentSpotter];
    objc_initWeak(location, self);
    int v6 = requestAudioCapture___queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__VTXPCConnection_requestAudioCapture___block_invoke_2;
    v9[3] = &unk_264325D20;
    v12[1] = *(id *)&a3;
    id v10 = v5;
    v11 = self;
    id v7 = v5;
    objc_copyWeak(v12, location);
    dispatch_sync(v6, v9);
    objc_destroyWeak(v12);

    objc_destroyWeak(location);
  }
}

void __39__VTXPCConnection_requestAudioCapture___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134349056;
    uint64_t v16 = v3;
    _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_DEFAULT, "::: Starting audio capture for %{public}.2f seconds", buf, 0xCu);
  }
  [*(id *)(a1 + 32) startAudioCapture];
  *(unsigned char *)(*(void *)(a1 + 40) + 17) = 1;
  if (requestAudioCapture___timer)
  {
    dispatch_source_cancel((dispatch_source_t)requestAudioCapture___timer);
    v4 = (void *)requestAudioCapture___timer;
    requestAudioCapture___timer = 0;
  }
  if (*(double *)(a1 + 56) > 0.0)
  {
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)requestAudioCapture___queue);
    int v6 = (void *)requestAudioCapture___timer;
    requestAudioCapture___timer = (uint64_t)v5;

    id v7 = requestAudioCapture___timer;
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    uint64_t v9 = requestAudioCapture___timer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __39__VTXPCConnection_requestAudioCapture___block_invoke_31;
    handler[3] = &unk_2643260B0;
    objc_copyWeak(&v14, (id *)(a1 + 48));
    int8x16_t v11 = *(int8x16_t *)(a1 + 32);
    id v10 = (id)v11.i64[0];
    int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)requestAudioCapture___timer);

    objc_destroyWeak(&v14);
  }
}

void __39__VTXPCConnection_requestAudioCapture___block_invoke_31(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "::: Stopping audio capture", v4, 2u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 17) = 0;
    [*(id *)(a1 + 40) stopAudioCapture];
  }
}

uint64_t __39__VTXPCConnection_requestAudioCapture___block_invoke()
{
  requestAudioCapture___queue = (uint64_t)dispatch_queue_create("audio capture assertion queue", 0);

  return MEMORY[0x270F9A758]();
}

- (void)isLastTriggerFollowedBySpeechWithReply:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t))a3;
  v4 = +[VTPhraseSpotter currentSpotter];
  dispatch_source_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 isFollowedBySpeech];
    if (v3) {
LABEL_3:
    }
      v3[2](v3, v6);
  }
  else
  {
    id v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)dispatch_time_t v8 = 0;
      _os_log_error_impl(&dword_21844F000, v7, OS_LOG_TYPE_ERROR, "No VoiceTrigger PhraseSpotter avail for trigger followed by speech", v8, 2u);
    }
    uint64_t v6 = 0;
    if (v3) {
      goto LABEL_3;
    }
  }
}

- (void)getFirstChanceTriggeredDateWithReply:(id)a3
{
  uint64_t v3 = (void (**)(id, void *))a3;
  v4 = +[VTPhraseSpotter currentSpotter];
  dispatch_source_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 firstChanceTriggeredDate];
    if (v3) {
LABEL_3:
    }
      v3[2](v3, v6);
  }
  else
  {
    id v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)dispatch_time_t v8 = 0;
      _os_log_error_impl(&dword_21844F000, v7, OS_LOG_TYPE_ERROR, "No VoiceTrigger PhraseSpotter avail for first chance triggered date", v8, 2u);
    }
    uint64_t v6 = 0;
    if (v3) {
      goto LABEL_3;
    }
  }
}

- (void)getFirstChanceVTEventInfoWithReply:(id)a3
{
  uint64_t v3 = (void (**)(id, void *))a3;
  v4 = +[VTPhraseSpotter currentSpotter];
  dispatch_source_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 firstChanceVTEventInfo];
    if (v3) {
LABEL_3:
    }
      v3[2](v3, v6);
  }
  else
  {
    id v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)dispatch_time_t v8 = 0;
      _os_log_error_impl(&dword_21844F000, v7, OS_LOG_TYPE_ERROR, "No VoiceTrigger PhraseSpotter avail for first chance voicetrigger event info", v8, 2u);
    }
    uint64_t v6 = 0;
    if (v3) {
      goto LABEL_3;
    }
  }
}

- (void)getFirstChanceAudioBufferWithReply:(id)a3
{
  uint64_t v3 = (void (**)(id, void *))a3;
  v4 = +[VTPhraseSpotter currentSpotter];
  dispatch_source_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 firstChanceAudioBuffer];
    if (v3) {
LABEL_3:
    }
      v3[2](v3, v6);
  }
  else
  {
    id v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)dispatch_time_t v8 = 0;
      _os_log_error_impl(&dword_21844F000, v7, OS_LOG_TYPE_ERROR, "No VoiceTrigger PhraseSpotter avail for first chance audio buffer", v8, 2u);
    }
    uint64_t v6 = 0;
    if (v3) {
      goto LABEL_3;
    }
  }
}

- (void)handleDisconnect
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "HandleDisconnect", buf, 2u);
  }
  v4 = (void *)[(NSMutableSet *)self->_activationAssertions copy];
  if ([v4 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          int8x16_t v11 = objc_msgSend(MEMORY[0x263F08AB0], "processInfo", (void)v15);
          [v11 systemUptime];
          -[VTXPCConnection enableVoiceTrigger:withAssertion:timestamp:](self, "enableVoiceTrigger:withAssertion:timestamp:", 0, v10);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v7);
    }
  }
  if (self->_isPhraseSpotterBypassed)
  {
    v12 = [MEMORY[0x263F08AB0] processInfo];
    [v12 systemUptime];
    [(VTXPCConnection *)self setPhraseSpotterBypassing:0 timeout:0.0 timestamp:v13];

    self->_isPhraseSpotterBypassed = 0;
  }
  if (self->_isRecording)
  {
    id v14 = +[VTPhraseSpotter currentSpotter];
    [v14 stopAudioCapture];

    self->_isRecording = 0;
  }
}

- (void)getVoiceTriggerCountWithReply:(id)a3
{
  uint64_t v6 = (void (**)(id, uint64_t))a3;
  uint64_t v3 = +[VTPhraseSpotter currentSpotter];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 triggerCount];
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v5 = 0;
  if (v6) {
LABEL_3:
  }
    v6[2](v6, v5);
LABEL_4:
}

- (void)clearVoiceTriggerCount
{
  id v2 = +[VTPhraseSpotter currentSpotter];
  [v2 clearTriggerCount];
}

- (void)resetAssertions
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446210;
    v4 = "-[VTXPCConnection resetAssertions]";
    _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_DEFAULT, "::: %{public}s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)queryLastTriggerEventTypeWithReply:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = (void (**)(id, uint64_t))a3;
  v4 = +[VTPhraseSpotter currentSpotter];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 lastTriggerType];
  }
  else
  {
    uint64_t v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9[0]) = 0;
      _os_log_error_impl(&dword_21844F000, v7, OS_LOG_TYPE_ERROR, "No VTPhraseSpotter available to query last trigger event type", (uint8_t *)v9, 2u);
    }
    uint64_t v6 = 0;
  }
  uint64_t v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67240192;
    v9[1] = v6;
    _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "Requesting LastTriggerType : %{public}d", (uint8_t *)v9, 8u);
  }
  if (v3) {
    v3[2](v3, v6);
  }
}

- (void)notifyTriggerEventRequest
{
  id v2 = +[VTPhraseSpotter currentSpotter];
  [v2 requestFoceTrigger];
}

- (void)notifySecondChanceRequest
{
  id v2 = +[VTPhraseSpotter currentSpotter];
  [v2 requestSecondChance];
}

- (void)notifyVoiceTriggeredSiriSessionCancelled:(id)a3
{
  id v3 = a3;
  id v4 = +[VTPhraseSpotter currentSpotter];
  [v4 didReceiveSiriSessionCancellation:v3];
}

- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4 timestamp:(double)a5
{
  BOOL v6 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (setRaiseToSpeakBypassing_timeout_timestamp__onceToken != -1) {
    dispatch_once(&setRaiseToSpeakBypassing_timeout_timestamp__onceToken, &__block_literal_global_24_6479);
  }
  uint64_t v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"NOT bypassed";
    if (v6) {
      uint64_t v9 = @"bypassed";
    }
    *(_DWORD *)buf = 138543618;
    long long v15 = v9;
    __int16 v16 = 2050;
    double v17 = a4;
    _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "::: Asserting that RaiseToSpeak should be %{public}@, timeout: %{public}f", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  uint64_t v10 = setRaiseToSpeakBypassing_timeout_timestamp___queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__VTXPCConnection_setRaiseToSpeakBypassing_timeout_timestamp___block_invoke_26;
  v11[3] = &unk_264325CF8;
  v11[4] = self;
  BOOL v13 = v6;
  v12[1] = *(id *)&a4;
  objc_copyWeak(v12, (id *)buf);
  dispatch_sync(v10, v11);
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)buf);
}

void __62__VTXPCConnection_setRaiseToSpeakBypassing_timeout_timestamp___block_invoke_26(uint64_t a1)
{
  [*(id *)(a1 + 32) _setRaiseToSpeakBypassing:*(unsigned __int8 *)(a1 + 56)];
  if (setRaiseToSpeakBypassing_timeout_timestamp___timer)
  {
    dispatch_source_cancel((dispatch_source_t)setRaiseToSpeakBypassing_timeout_timestamp___timer);
    id v2 = (void *)setRaiseToSpeakBypassing_timeout_timestamp___timer;
    setRaiseToSpeakBypassing_timeout_timestamp___timer = 0;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    if (*(double *)(a1 + 48) > 0.0)
    {
      dispatch_source_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)setRaiseToSpeakBypassing_timeout_timestamp___queue);
      id v4 = (void *)setRaiseToSpeakBypassing_timeout_timestamp___timer;
      setRaiseToSpeakBypassing_timeout_timestamp___timer = (uint64_t)v3;

      uint64_t v5 = setRaiseToSpeakBypassing_timeout_timestamp___timer;
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
      dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      uint64_t v7 = setRaiseToSpeakBypassing_timeout_timestamp___timer;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __62__VTXPCConnection_setRaiseToSpeakBypassing_timeout_timestamp___block_invoke_2;
      handler[3] = &unk_264325CD0;
      objc_copyWeak(&v9, (id *)(a1 + 40));
      dispatch_source_set_event_handler(v7, handler);
      dispatch_resume((dispatch_object_t)setRaiseToSpeakBypassing_timeout_timestamp___timer);
      objc_destroyWeak(&v9);
    }
  }
}

void __62__VTXPCConnection_setRaiseToSpeakBypassing_timeout_timestamp___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_source_t v3 = 0;
      _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_DEFAULT, "::: Timeout!! RaiseToSpeak should be NOT bypassed", v3, 2u);
    }
    [WeakRetained _setRaiseToSpeakBypassing:0];
  }
}

uint64_t __62__VTXPCConnection_setRaiseToSpeakBypassing_timeout_timestamp___block_invoke()
{
  setRaiseToSpeakBypassing_timeout_timestamp___queue = (uint64_t)dispatch_queue_create("RaiseToSpeak assertion queue", 0);

  return MEMORY[0x270F9A758]();
}

- (void)_setPhraseSpotterBypassing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[VTPhraseSpotter currentSpotter];
  if (self->_isPhraseSpotterBypassed != v3)
  {
    self->_isPhraseSpotterBypassed = v3;
    id v6 = v5;
    [v5 setBypass:v3];
    uint64_t v5 = v6;
  }
}

- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4 timestamp:(double)a5
{
  BOOL v6 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (setPhraseSpotterBypassing_timeout_timestamp__onceToken != -1) {
    dispatch_once(&setPhraseSpotterBypassing_timeout_timestamp__onceToken, &__block_literal_global_13_6490);
  }
  uint64_t v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NOT bypassed";
    if (v6) {
      id v9 = @"bypassed";
    }
    *(_DWORD *)buf = 138543618;
    long long v15 = v9;
    __int16 v16 = 2050;
    double v17 = a4;
    _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "::: Asserting that PhraseSpotter should be %{public}@, timeout: %{public}f", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  uint64_t v10 = setPhraseSpotterBypassing_timeout_timestamp___queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__VTXPCConnection_setPhraseSpotterBypassing_timeout_timestamp___block_invoke_21;
  v11[3] = &unk_264325CF8;
  v11[4] = self;
  BOOL v13 = v6;
  v12[1] = *(id *)&a4;
  objc_copyWeak(v12, (id *)buf);
  dispatch_sync(v10, v11);
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)buf);
}

void __63__VTXPCConnection_setPhraseSpotterBypassing_timeout_timestamp___block_invoke_21(uint64_t a1)
{
  [*(id *)(a1 + 32) _setPhraseSpotterBypassing:*(unsigned __int8 *)(a1 + 56)];
  if (setPhraseSpotterBypassing_timeout_timestamp___timer)
  {
    dispatch_source_cancel((dispatch_source_t)setPhraseSpotterBypassing_timeout_timestamp___timer);
    id v2 = (void *)setPhraseSpotterBypassing_timeout_timestamp___timer;
    setPhraseSpotterBypassing_timeout_timestamp___timer = 0;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    if (*(double *)(a1 + 48) > 0.0)
    {
      dispatch_source_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)setPhraseSpotterBypassing_timeout_timestamp___queue);
      id v4 = (void *)setPhraseSpotterBypassing_timeout_timestamp___timer;
      setPhraseSpotterBypassing_timeout_timestamp___timer = (uint64_t)v3;

      uint64_t v5 = setPhraseSpotterBypassing_timeout_timestamp___timer;
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
      dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      uint64_t v7 = setPhraseSpotterBypassing_timeout_timestamp___timer;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __63__VTXPCConnection_setPhraseSpotterBypassing_timeout_timestamp___block_invoke_2;
      handler[3] = &unk_264325CD0;
      objc_copyWeak(&v9, (id *)(a1 + 40));
      dispatch_source_set_event_handler(v7, handler);
      dispatch_resume((dispatch_object_t)setPhraseSpotterBypassing_timeout_timestamp___timer);
      objc_destroyWeak(&v9);
    }
  }
}

void __63__VTXPCConnection_setPhraseSpotterBypassing_timeout_timestamp___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_source_t v3 = 0;
      _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_DEFAULT, "::: Timeout!! PhraseSpotter should be NOT bypassed", v3, 2u);
    }
    [WeakRetained _setPhraseSpotterBypassing:0];
  }
}

uint64_t __63__VTXPCConnection_setPhraseSpotterBypassing_timeout_timestamp___block_invoke()
{
  setPhraseSpotterBypassing_timeout_timestamp___queue = (uint64_t)dispatch_queue_create("phrasespotter assertion queue", 0);

  return MEMORY[0x270F9A758]();
}

- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4 timestamp:(double)a5
{
  BOOL v6 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v18 = "-[VTXPCConnection enableVoiceTrigger:withAssertion:timestamp:]";
    __int16 v19 = 1026;
    BOOL v20 = v6;
    __int16 v21 = 2114;
    id v22 = v8;
    _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "::: %{public}s enable: %{public}d reason: %{public}@", buf, 0x1Cu);
  }
  if (enableVoiceTrigger_withAssertion_timestamp__onceToken == -1)
  {
    if (v8)
    {
LABEL_5:
      uint64_t v10 = enableVoiceTrigger_withAssertion_timestamp___queue;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      id v12[2] = __62__VTXPCConnection_enableVoiceTrigger_withAssertion_timestamp___block_invoke_5;
      v12[3] = &unk_264325CA8;
      BOOL v16 = v6;
      double v15 = a5;
      id v13 = v8;
      id v14 = self;
      dispatch_sync(v10, v12);

      goto LABEL_9;
    }
  }
  else
  {
    dispatch_once(&enableVoiceTrigger_withAssertion_timestamp__onceToken, &__block_literal_global_6496);
    if (v8) {
      goto LABEL_5;
    }
  }
  int8x16_t v11 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring request to enable/disable voice trigger with nil reason.", buf, 2u);
  }
LABEL_9:
}

void __62__VTXPCConnection_enableVoiceTrigger_withAssertion_timestamp___block_invoke_5(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = [(id)enableVoiceTrigger_withAssertion_timestamp__sTimestampsByReason objectForKey:*(void *)(a1 + 32)];
  dispatch_source_t v3 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 56)) {
      id v4 = @"Enabled";
    }
    else {
      id v4 = @"Disabled";
    }
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = (void *)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons;
    uint64_t v7 = v3;
    uint64_t v8 = [v6 count];
    uint64_t v9 = *(void *)(a1 + 48);
    int v16 = 138544642;
    double v17 = v4;
    __int16 v18 = 2114;
    uint64_t v19 = v5;
    __int16 v20 = 2050;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    uint64_t v23 = enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons;
    __int16 v24 = 2114;
    v25 = v2;
    __int16 v26 = 2050;
    uint64_t v27 = v9;
    _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "::: Asserting that VoiceTrigger should be %{public}@ with reason: %{public}@. Existing assertions (%{public}lu): %{public}@; times: %{public}@ vs %{public}f",
      (uint8_t *)&v16,
      0x3Eu);
  }
  [v2 doubleValue];
  if (v10 >= *(double *)(a1 + 48))
  {
    double v15 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_21844F000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring request to enable/disable voice trigger - time order violation.", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    int8x16_t v11 = (void *)enableVoiceTrigger_withAssertion_timestamp__sTimestampsByReason;
    v12 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v11 setObject:v12 forKey:*(void *)(a1 + 32)];

    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v13 = [(id)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons count];
      [(id)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons addObject:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(a1 + 40) + 8) addObject:*(void *)(a1 + 32)];
      if (!v13)
      {
        id v14 = +[VTSiriAssertionMonitor sharedInstance];
        [v14 enableAssertionReceived];
LABEL_14:
      }
    }
    else
    {
      [(id)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons removeObject:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 32)];
      if (![(id)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons count])
      {
        id v14 = +[VTSiriAssertionMonitor sharedInstance];
        [v14 disableAssertionReceived];
        goto LABEL_14;
      }
    }
  }
}

uint64_t __62__VTXPCConnection_enableVoiceTrigger_withAssertion_timestamp___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9C0] set];
  v1 = (void *)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons;
  enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons = v0;

  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  dispatch_source_t v3 = (void *)enableVoiceTrigger_withAssertion_timestamp__sTimestampsByReason;
  enableVoiceTrigger_withAssertion_timestamp__sTimestampsByReason = v2;

  enableVoiceTrigger_withAssertion_timestamp___queue = (uint64_t)dispatch_queue_create("voicetrigger assertion queue", 0);

  return MEMORY[0x270F9A758]();
}

- (void)getTestResponse:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  dispatch_source_t v3 = (void (**)(id, void *))a3;
  id v4 = [MEMORY[0x263F08C38] UUID];
  uint64_t v5 = [v4 UUIDString];

  BOOL v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    uint64_t v8 = "-[VTXPCConnection getTestResponse:]";
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "::: %{public}s", (uint8_t *)&v7, 0xCu);
  }
  if (v3) {
    v3[2](v3, v5);
  }
}

- (VTXPCConnection)init
{
  v8.receiver = self;
  v8.super_class = (Class)VTXPCConnection;
  uint64_t v2 = [(VTXPCConnection *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    activationAssertions = v2->_activationAssertions;
    v2->_activationAssertions = (NSMutableSet *)v3;

    *(_WORD *)&v2->_isPhraseSpotterBypassed = 0;
    uint64_t v5 = +[VTSiriPHash sharedPhash];
    hasher = v2->_hasher;
    v2->_hasher = (VTSiriPHash *)v5;
  }
  return v2;
}

+ (void)initialize
{
  if (VTLogInitIfNeeded_once != -1) {
    dispatch_once(&VTLogInitIfNeeded_once, &__block_literal_global_30);
  }
}

@end