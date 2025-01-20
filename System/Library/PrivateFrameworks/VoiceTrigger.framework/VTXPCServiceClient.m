@interface VTXPCServiceClient
- (VTXPCServiceClient)init;
- (id)_service;
- (id)getFirstChanceAudioBuffer;
- (id)getFirstChanceTriggeredDate;
- (id)getFirstChanceVTEventInfo;
- (id)requestCurrentBuiltInRTModelDictionary;
- (id)requestCurrentVoiceTriggerAssetDictionary;
- (int64_t)getVoiceTriggerCount;
- (int64_t)isLastTriggerFollowedBySpeech;
- (unsigned)getLastTriggerType;
- (void)clearVoiceTriggerCount;
- (void)dealloc;
- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4;
- (void)notifySecondChanceRequest;
- (void)notifyTriggerEventRequest;
- (void)notifyVoiceTriggeredSiriSessionCancelled:(id)a3;
- (void)requestAudioCapture:(double)a3;
- (void)requestCurrentVoiceTriggerAssetDictionaryWithReply:(id)a3;
- (void)resetAssertions;
- (void)setCurrentBuiltInRTModelDictionary:(id)a3;
- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4;
- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4;
@end

@implementation VTXPCServiceClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vtxConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setCurrentBuiltInRTModelDictionary:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__VTXPCServiceClient_setCurrentBuiltInRTModelDictionary___block_invoke;
  v7[3] = &unk_264325FF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __57__VTXPCServiceClient_setCurrentBuiltInRTModelDictionary___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 setCurrentBuiltInRTModelDictionary:*(void *)(a1 + 40)];
}

- (id)requestCurrentBuiltInRTModelDictionary
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2037;
  v18 = __Block_byref_object_dispose__2038;
  id v19 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__VTXPCServiceClient_requestCurrentBuiltInRTModelDictionary__block_invoke;
  block[3] = &unk_264325940;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "Query for VoiceTrigger asset timed out", v10, 2u);
    }
  }
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __60__VTXPCServiceClient_requestCurrentBuiltInRTModelDictionary__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__VTXPCServiceClient_requestCurrentBuiltInRTModelDictionary__block_invoke_2;
  v5[3] = &unk_2643255A0;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 requestCurrentBuiltInRTModelDictionaryWithReply:v5];
}

void __60__VTXPCServiceClient_requestCurrentBuiltInRTModelDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)requestCurrentVoiceTriggerAssetDictionaryWithReply:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionaryWithReply___block_invoke;
  v7[3] = &unk_264325C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __73__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionaryWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __73__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionaryWithReply___block_invoke_2;
  v3[3] = &unk_2643255F0;
  id v4 = *(id *)(a1 + 40);
  [v2 requestCurrentVoiceTriggerAssetDictionaryWithReply:v3];
}

uint64_t __73__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionaryWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)requestCurrentVoiceTriggerAssetDictionary
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2037;
  v18 = __Block_byref_object_dispose__2038;
  id v19 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionary__block_invoke;
  block[3] = &unk_264325940;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "Query for VoiceTrigger asset timed out", v10, 2u);
    }
  }
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __63__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionary__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionary__block_invoke_2;
  v5[3] = &unk_2643255A0;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 requestCurrentVoiceTriggerAssetDictionaryWithReply:v5];
}

void __63__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)requestAudioCapture:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__VTXPCServiceClient_requestAudioCapture___block_invoke;
  v4[3] = &unk_264325FA0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

void __42__VTXPCServiceClient_requestAudioCapture___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 requestAudioCapture:*(double *)(a1 + 40)];
}

- (int64_t)isLastTriggerFollowedBySpeech
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__VTXPCServiceClient_isLastTriggerFollowedBySpeech__block_invoke;
  block[3] = &unk_264325940;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "Query for followedBySpeech timed out", v10, 2u);
    }
  }
  int64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __51__VTXPCServiceClient_isLastTriggerFollowedBySpeech__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__VTXPCServiceClient_isLastTriggerFollowedBySpeech__block_invoke_2;
  v5[3] = &unk_264325550;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 isLastTriggerFollowedBySpeechWithReply:v5];
}

intptr_t __51__VTXPCServiceClient_isLastTriggerFollowedBySpeech__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getFirstChanceTriggeredDate
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2037;
  v18 = __Block_byref_object_dispose__2038;
  id v19 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__VTXPCServiceClient_getFirstChanceTriggeredDate__block_invoke;
  block[3] = &unk_264325940;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "Query for voice trigger first chance triggered date", v10, 2u);
    }
  }
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __49__VTXPCServiceClient_getFirstChanceTriggeredDate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__VTXPCServiceClient_getFirstChanceTriggeredDate__block_invoke_2;
  v5[3] = &unk_2643255C8;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 getFirstChanceTriggeredDateWithReply:v5];
}

void __49__VTXPCServiceClient_getFirstChanceTriggeredDate__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getFirstChanceVTEventInfo
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2037;
  v18 = __Block_byref_object_dispose__2038;
  id v19 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__VTXPCServiceClient_getFirstChanceVTEventInfo__block_invoke;
  block[3] = &unk_264325940;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "Query for voice trigger first chance vt event info timed out", v10, 2u);
    }
  }
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __47__VTXPCServiceClient_getFirstChanceVTEventInfo__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__VTXPCServiceClient_getFirstChanceVTEventInfo__block_invoke_2;
  v5[3] = &unk_2643255A0;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 getFirstChanceVTEventInfoWithReply:v5];
}

void __47__VTXPCServiceClient_getFirstChanceVTEventInfo__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getFirstChanceAudioBuffer
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2037;
  v18 = __Block_byref_object_dispose__2038;
  id v19 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__VTXPCServiceClient_getFirstChanceAudioBuffer__block_invoke;
  block[3] = &unk_264325940;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "Query for voice trigger first chance audio buffer timed out", v10, 2u);
    }
  }
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __47__VTXPCServiceClient_getFirstChanceAudioBuffer__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__VTXPCServiceClient_getFirstChanceAudioBuffer__block_invoke_2;
  v5[3] = &unk_264325578;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 getFirstChanceAudioBufferWithReply:v5];
}

void __47__VTXPCServiceClient_getFirstChanceAudioBuffer__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int64_t)getVoiceTriggerCount
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__VTXPCServiceClient_getVoiceTriggerCount__block_invoke;
  block[3] = &unk_264325940;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "Query for voice trigger count timed out", v10, 2u);
    }
  }
  int64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __42__VTXPCServiceClient_getVoiceTriggerCount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__VTXPCServiceClient_getVoiceTriggerCount__block_invoke_2;
  v5[3] = &unk_264325550;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 getVoiceTriggerCountWithReply:v5];
}

intptr_t __42__VTXPCServiceClient_getVoiceTriggerCount__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)clearVoiceTriggerCount
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__VTXPCServiceClient_clearVoiceTriggerCount__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__VTXPCServiceClient_clearVoiceTriggerCount__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _service];
  [v1 clearVoiceTriggerCount];
}

- (void)resetAssertions
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__VTXPCServiceClient_resetAssertions__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__VTXPCServiceClient_resetAssertions__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _service];
  [v1 resetAssertions];
}

- (unsigned)getLastTriggerType
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__VTXPCServiceClient_getLastTriggerType__block_invoke;
  block[3] = &unk_264325940;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "Query for last trigger event type timed out", v10, 2u);
    }
  }
  unsigned __int8 v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __40__VTXPCServiceClient_getLastTriggerType__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__VTXPCServiceClient_getLastTriggerType__block_invoke_2;
  v5[3] = &unk_264325528;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 queryLastTriggerEventTypeWithReply:v5];
}

intptr_t __40__VTXPCServiceClient_getLastTriggerType__block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)notifyTriggerEventRequest
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__VTXPCServiceClient_notifyTriggerEventRequest__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __47__VTXPCServiceClient_notifyTriggerEventRequest__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _service];
  [v1 notifyTriggerEventRequest];
}

- (void)notifySecondChanceRequest
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__VTXPCServiceClient_notifySecondChanceRequest__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __47__VTXPCServiceClient_notifySecondChanceRequest__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _service];
  [v1 notifySecondChanceRequest];
}

- (void)notifyVoiceTriggeredSiriSessionCancelled:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__VTXPCServiceClient_notifyVoiceTriggeredSiriSessionCancelled___block_invoke;
  v7[3] = &unk_264325FF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__VTXPCServiceClient_notifyVoiceTriggeredSiriSessionCancelled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 notifyVoiceTriggeredSiriSessionCancelled:*(void *)(a1 + 40)];
}

- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__VTXPCServiceClient_setRaiseToSpeakBypassing_timeout___block_invoke;
  block[3] = &unk_264325500;
  block[4] = self;
  BOOL v6 = a3;
  *(double *)&void block[5] = a4;
  dispatch_async(queue, block);
}

void __55__VTXPCServiceClient_setRaiseToSpeakBypassing_timeout___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _service];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  double v3 = *(double *)(a1 + 40);
  id v4 = [MEMORY[0x263F08AB0] processInfo];
  [v4 systemUptime];
  [v6 setRaiseToSpeakBypassing:v2 timeout:v3 timestamp:v5];
}

- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__VTXPCServiceClient_setPhraseSpotterBypassing_timeout___block_invoke;
  block[3] = &unk_264325500;
  block[4] = self;
  BOOL v6 = a3;
  *(double *)&void block[5] = a4;
  dispatch_async(queue, block);
}

void __56__VTXPCServiceClient_setPhraseSpotterBypassing_timeout___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _service];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  double v3 = *(double *)(a1 + 40);
  id v4 = [MEMORY[0x263F08AB0] processInfo];
  [v4 systemUptime];
  [v6 setPhraseSpotterBypassing:v2 timeout:v3 timestamp:v5];
}

- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__VTXPCServiceClient_enableVoiceTrigger_withAssertion___block_invoke;
  block[3] = &unk_2643254D8;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __55__VTXPCServiceClient_enableVoiceTrigger_withAssertion___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _service];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x263F08AB0] processInfo];
  [v4 systemUptime];
  objc_msgSend(v5, "enableVoiceTrigger:withAssertion:timestamp:", v2, v3);
}

- (id)_service
{
  vtxConnection = self->_vtxConnection;
  if (!vtxConnection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.voicetrigger.voicetriggerservice" options:4096];
    id v5 = self->_vtxConnection;
    self->_vtxConnection = v4;

    id v6 = self->_vtxConnection;
    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9B1EB8];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    [(NSXPCConnection *)self->_vtxConnection setInterruptionHandler:&__block_literal_global_2056];
    [(NSXPCConnection *)self->_vtxConnection setInvalidationHandler:&__block_literal_global_84];
    [(NSXPCConnection *)self->_vtxConnection resume];
    vtxConnection = self->_vtxConnection;
  }

  return [(NSXPCConnection *)vtxConnection remoteObjectProxy];
}

void __30__VTXPCServiceClient__service__block_invoke_82()
{
  v0 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_21844F000, v0, OS_LOG_TYPE_DEFAULT, "VTXConnection Invalidated", v1, 2u);
  }
}

void __30__VTXPCServiceClient__service__block_invoke()
{
  v0 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_21844F000, v0, OS_LOG_TYPE_DEFAULT, "VTXConnection Interrupted", v1, 2u);
  }
}

- (void)dealloc
{
  vtxConnection = self->_vtxConnection;
  if (vtxConnection) {
    [(NSXPCConnection *)vtxConnection invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)VTXPCServiceClient;
  [(VTXPCServiceClient *)&v4 dealloc];
}

- (VTXPCServiceClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)VTXPCServiceClient;
  uint64_t v2 = [(VTXPCServiceClient *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("VTServiceClient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end