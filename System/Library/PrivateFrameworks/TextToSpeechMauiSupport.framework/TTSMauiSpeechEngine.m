@interface TTSMauiSpeechEngine
- (BOOL)_addPathDictionaryEntriesForDirectory:(id)a3;
- (BOOL)_initializeEngine;
- (BOOL)_initializeVoiceDataFiles;
- (BOOL)_loadVoiceResource:(id)a3;
- (BOOL)loadVoiceResource:(id)a3;
- (BOOL)queue_unloadVoiceResource:(id)a3;
- (BOOL)setVoice:(id)a3;
- (BOOL)unloadVoiceResource:(id)a3;
- (NSCondition)producedBuffers;
- (NSMutableDictionary)pathDictionary;
- (NSMutableOrderedSet)finishedBuffers;
- (NSMutableOrderedSet)voiceResources;
- (NSNumber)pitch;
- (NSNumber)postSentencePauseDuration;
- (NSNumber)rate;
- (NSNumber)timbre;
- (NSNumber)volume;
- (NSOrderedSet)loadedResources;
- (NSString)brokerString;
- (OS_dispatch_queue)synthesisQueue;
- (TTSAXResource)currentVoice;
- (TTSMauiSpeechEngine)initWithVoice:(id)a3;
- (TTSMauiVocalizerBuffer)inProgressBuffer;
- (TTSRulesetRunner)ruleSetRunner;
- (TTSSpeechString)proccessedSpeechString;
- (VE_DATA_MAPPING_INTERFACE_S)dataMapImpl;
- (VE_DATA_STREAM_INTERFACE_S)dataStreamImpl;
- (_VE_HSAFE)vocalizerClassHandle;
- (_VE_HSAFE)vocalizerInstanceHandle;
- (id)_applyPostRuleRewrites:(id)a3;
- (id)_nextBuffer;
- (id)_parseBrokerString:(id)a3;
- (id)_preprocessText:(id)a3;
- (id)_rawLiteralCharacterRegexForCurrentLanguage;
- (id)_vocalizerClampNumber:(id)a3 between:(unsigned __int16)a4 and:(unsigned __int16)a5;
- (id)emptyBufferForVocalizer;
- (id)nextBuffer;
- (unint64_t)state;
- (unsigned)open:(id)a3 mode:(id)a4 outPointer:(__sFILE *)a5;
- (unsigned)processingCallback:(id *)a3;
- (void)_deinitializeEngine;
- (void)_initializeEngine;
- (void)_initializeVoiceDataFiles;
- (void)_speakString:(id)a3 withFormat:(int)a4;
- (void)_syncParametersWithEngine;
- (void)bufferDone:(id *)a3;
- (void)cancelSpeaking;
- (void)dealloc;
- (void)loadRuleset:(id)a3;
- (void)queue_unloadAllVoiceResources;
- (void)setBrokerString:(id)a3;
- (void)setCurrentVoice:(id)a3;
- (void)setFinishedBuffers:(id)a3;
- (void)setInProgressBuffer:(id)a3;
- (void)setPathDictionary:(id)a3;
- (void)setPitch:(id)a3;
- (void)setPostSentencePauseDuration:(id)a3;
- (void)setProccessedSpeechString:(id)a3;
- (void)setProducedBuffers:(id)a3;
- (void)setRate:(id)a3;
- (void)setRuleSetRunner:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setSynthesisQueue:(id)a3;
- (void)setTimbre:(id)a3;
- (void)setTrimEndingSilences:(BOOL)a3;
- (void)setVocalizerClassHandle:(_VE_HSAFE)a3;
- (void)setVocalizerInstanceHandle:(_VE_HSAFE)a3;
- (void)setVoiceResources:(id)a3;
- (void)setVolume:(id)a3;
- (void)speakSSMLString:(id)a3;
- (void)speakString:(id)a3;
- (void)unloadAllVoiceResources;
@end

@implementation TTSMauiSpeechEngine

- (TTSMauiSpeechEngine)initWithVoice:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)TTSMauiSpeechEngine;
  v6 = [(TTSMauiSpeechEngine *)&v35 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v6->_currentVoice, a3);
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  pathDictionary = v7->_pathDictionary;
  v7->_pathDictionary = (NSMutableDictionary *)v8;

  v10 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
  producedBuffers = v7->_producedBuffers;
  v7->_producedBuffers = v10;

  v12 = (TTSRulesetRunner *)objc_alloc_init(MEMORY[0x263F7EED8]);
  ruleSetRunner = v7->_ruleSetRunner;
  v7->_ruleSetRunner = v12;

  objc_initWeak(&location, v7);
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  v31 = __37__TTSMauiSpeechEngine_initWithVoice___block_invoke;
  v32 = &unk_26455D278;
  objc_copyWeak(&v33, &location);
  [(TTSRulesetRunner *)v7->_ruleSetRunner setPostRuleWriter:&v29];
  v7->_bufferLock._os_unfair_lock_opaque = 0;
  v7->_state = 0;
  uint64_t v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
  v15 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

  dispatch_queue_t v16 = dispatch_queue_create("com.maui.synthesis", v15);
  synthesisQueue = v7->_synthesisQueue;
  v7->_synthesisQueue = (OS_dispatch_queue *)v16;

  uint64_t v18 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSet", v29, v30, v31, v32);
  voiceResources = v7->_voiceResources;
  v7->_voiceResources = (NSMutableOrderedSet *)v18;

  pitch = v7->_pitch;
  v7->_pitch = (NSNumber *)&unk_26D21F3F8;

  volume = v7->_volume;
  v7->_volume = (NSNumber *)&unk_26D21F410;

  rate = v7->_rate;
  v7->_rate = (NSNumber *)&unk_26D21F3F8;

  timbre = v7->_timbre;
  v7->_timbre = (NSNumber *)&unk_26D21F3F8;

  postSentencePauseDuration = v7->_postSentencePauseDuration;
  v7->_postSentencePauseDuration = (NSNumber *)&unk_26D21F428;

  uint64_t v25 = [MEMORY[0x263EFF9B0] orderedSet];
  finishedBuffers = v7->_finishedBuffers;
  v7->_finishedBuffers = (NSMutableOrderedSet *)v25;

  LOBYTE(v14) = [(TTSMauiSpeechEngine *)v7 _initializeEngine];
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
  if ((v14 & 1) == 0) {
    v27 = 0;
  }
  else {
LABEL_3:
  }
    v27 = v7;

  return v27;
}

id __37__TTSMauiSpeechEngine_initWithVoice___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _applyPostRuleRewrites:v3];

  return v5;
}

- (void)dealloc
{
  [(TTSMauiSpeechEngine *)self _deinitializeEngine];
  v3.receiver = self;
  v3.super_class = (Class)TTSMauiSpeechEngine;
  [(TTSMauiSpeechEngine *)&v3 dealloc];
}

- (BOOL)setVoice:(id)a3
{
  id v4 = a3;
  [(TTSMauiSpeechEngine *)self cancelSpeaking];
  [(TTSMauiSpeechEngine *)self unloadAllVoiceResources];
  [(TTSMauiSpeechEngine *)self _deinitializeEngine];
  id v5 = [MEMORY[0x263EFF9B0] orderedSet];
  [(TTSMauiSpeechEngine *)self setVoiceResources:v5];

  v6 = [MEMORY[0x263EFF9A0] dictionary];
  [(TTSMauiSpeechEngine *)self setPathDictionary:v6];

  [(TTSMauiSpeechEngine *)self setBrokerString:0];
  [(TTSMauiSpeechEngine *)self setCurrentVoice:v4];

  return [(TTSMauiSpeechEngine *)self _initializeEngine];
}

- (NSOrderedSet)loadedResources
{
  return (NSOrderedSet *)self->_voiceResources;
}

- (VE_DATA_STREAM_INTERFACE_S)dataStreamImpl
{
  if (dataStreamImpl_onceToken != -1) {
    dispatch_once(&dataStreamImpl_onceToken, &__block_literal_global);
  }
  return (VE_DATA_STREAM_INTERFACE_S *)&dataStreamImpl_interface;
}

__n128 __37__TTSMauiSpeechEngine_dataStreamImpl__block_invoke()
{
  DataStreamImpl = TTSMauiVocalizerGetDataStreamImpl();
  long long v2 = *((_OWORD *)DataStreamImpl + 1);
  __n128 result = *((__n128 *)DataStreamImpl + 2);
  long long v3 = *(_OWORD *)DataStreamImpl;
  qword_267F18250 = (uint64_t)DataStreamImpl[6];
  xmmword_267F18230 = v2;
  unk_267F18240 = result;
  dataStreamImpl_interface = v3;
  *(void *)&dataStreamImpl_interface = MauiStreamOpen;
  return result;
}

- (VE_DATA_MAPPING_INTERFACE_S)dataMapImpl
{
  if (dataMapImpl_onceToken != -1) {
    dispatch_once(&dataMapImpl_onceToken, &__block_literal_global_94);
  }
  return (VE_DATA_MAPPING_INTERFACE_S *)&dataMapImpl_interface;
}

__n128 __34__TTSMauiSpeechEngine_dataMapImpl__block_invoke()
{
  DataMappingImpl = TTSMauiVocalizerGetDataMappingImpl();
  uint64_t v1 = (uint64_t)DataMappingImpl[4];
  __n128 result = *((__n128 *)DataMappingImpl + 1);
  dataMapImpl_interface = *(_OWORD *)DataMappingImpl;
  *(__n128 *)algn_267F18270 = result;
  qword_267F18280 = v1;
  *(void *)&dataMapImpl_interface = MauiMappingOpen;
  return result;
}

- (unsigned)open:(id)a3 mode:(id)a4 outPointer:(__sFILE *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(TTSMauiSpeechEngine *)self pathDictionary];
  v11 = [v10 objectForKeyedSubscript:v9];

  if (v11)
  {
    v12 = (const char *)[v11 fileSystemRepresentation];
    id v13 = v8;
    uint64_t v14 = fopen(v12, (const char *)objc_msgSend(v13, "cStringUsingEncoding:", objc_msgSend(NSString, "defaultCStringEncoding")));
    if (v14)
    {
      unsigned int v15 = 0;
      *a5 = v14;
    }
    else
    {
      unsigned int v15 = -2147483645;
    }
  }
  else
  {
    unsigned int v15 = -2147483628;
  }

  return v15;
}

- (id)emptyBufferForVocalizer
{
  if ([(TTSMauiSpeechEngine *)self state] == 3)
  {
    long long v3 = 0;
  }
  else
  {
    AX_PERFORM_WITH_LOCK();
    long long v3 = [(TTSMauiSpeechEngine *)self inProgressBuffer];
  }

  return v3;
}

void __46__TTSMauiSpeechEngine_emptyBufferForVocalizer__block_invoke(uint64_t a1)
{
  long long v2 = objc_alloc_init(TTSMauiVocalizerBuffer);
  [*(id *)(a1 + 32) setInProgressBuffer:v2];
}

- (void)bufferDone:(id *)a3
{
}

void __34__TTSMauiSpeechEngine_bufferDone___block_invoke(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) inProgressBuffer];

  if (v2)
  {
    unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 40) + 8);
    id v4 = [*(id *)(a1 + 32) inProgressBuffer];
    id v5 = [v4 audioBuffer];
    v6 = [v5 format];
    uint64_t v7 = v3 / *(_DWORD *)([v6 streamDescription] + 24);

    id v8 = [*(id *)(a1 + 32) inProgressBuffer];
    id v9 = [v8 audioBuffer];
    [v9 setFrameLength:v7];

    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 24);
    v11 = [*(id *)(a1 + 32) inProgressBuffer];
    v11[225] = v10;

    v12 = [*(id *)(a1 + 32) inProgressBuffer];
    id v13 = [*(id *)(a1 + 32) proccessedSpeechString];
    [v12 computeMarkers:v13];

    uint64_t v14 = [*(id *)(a1 + 32) finishedBuffers];
    unsigned int v15 = [*(id *)(a1 + 32) inProgressBuffer];
    [v14 addObject:v15];

    [*(id *)(a1 + 32) setInProgressBuffer:0];
    id v16 = [*(id *)(a1 + 32) producedBuffers];
    [v16 broadcast];
  }
}

- (id)nextBuffer
{
  while (1)
  {
    unint64_t v3 = [(TTSMauiSpeechEngine *)self state];
    unint64_t v4 = v3;
    if (v3 != 4 && v3 != 2) {
      break;
    }
    id v5 = [(TTSMauiSpeechEngine *)self _nextBuffer];
    if (v5) {
      goto LABEL_7;
    }
    if (v4 != 2) {
      break;
    }
    producedBuffers = self->_producedBuffers;
    uint64_t v7 = [MEMORY[0x263EFF910] now];
    id v8 = [v7 dateByAddingTimeInterval:0.5];
    [(NSCondition *)producedBuffers waitUntilDate:v8];
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (id)_nextBuffer
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy_;
  id v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  AX_PERFORM_WITH_LOCK();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __34__TTSMauiSpeechEngine__nextBuffer__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) finishedBuffers];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) finishedBuffers];
    uint64_t v5 = [v4 firstObject];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = [*(id *)(a1 + 32) finishedBuffers];
    [v8 removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

- (unsigned)processingCallback:(id *)a3
{
  if (a3->var0 == 16)
  {
    [(TTSMauiSpeechEngine *)self bufferDone:a3->var2];
    return 0;
  }
  if (a3->var0 != 8) {
    return 0;
  }
  uint64_t v4 = [(TTSMauiSpeechEngine *)self emptyBufferForVocalizer];
  if (v4)
  {
    uint64_t v5 = v4;
    [v4 fillInOutDataForBuffer:a3->var2];

    return 0;
  }
  return -2147481593;
}

- (void)speakSSMLString:(id)a3
{
}

- (void)speakString:(id)a3
{
}

- (id)_preprocessText:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 precomposedStringWithCanonicalMapping];
  uint64_t v6 = [(TTSMauiSpeechEngine *)self currentVoice];
  uint64_t v7 = [v6 primaryLanguage];
  int v8 = [v7 hasPrefix:@"ko"];

  if (v8)
  {
    id v9 = [MEMORY[0x263F7EEC8] sharedInstance];
    uint64_t v10 = [v9 regexForString:@"[\\u1100-\\u1112\\u1161-\\u1175\\u11A8-\\u11AF\\u11B7-\\u11C2\\uD558]" atStart:0];

    v26 = v10;
    v11 = objc_msgSend(v10, "matchesInString:options:range:", v5, 2, 0, objc_msgSend(v5, "length"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (v16)
          {
            uint64_t v17 = [*(id *)(*((void *)&v27 + 1) + 8 * i) range];
            v19 = objc_msgSend(v5, "substringWithRange:", v17, v18);
            uint64_t v20 = [v16 range];
            uint64_t v22 = v21;
            v23 = TTSChoseong_JongseongToHangul();
            uint64_t v24 = objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", v20, v22, v23);

            uint64_t v5 = (void *)v24;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }
  }

  return v5;
}

- (void)_speakString:(id)a3 withFormat:(int)a4
{
  id v6 = a3;
  [(TTSMauiSpeechEngine *)self cancelSpeaking];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy_;
  v15[4] = __Block_byref_object_dispose_;
  id v7 = v6;
  id v16 = v7;
  int v8 = [(TTSMauiSpeechEngine *)self _preprocessText:v7];

  [(TTSMauiSpeechEngine *)self setState:2];
  id v9 = [(TTSMauiSpeechEngine *)self synthesisQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__TTSMauiSpeechEngine__speakString_withFormat___block_invoke;
  v11[3] = &unk_26455D338;
  v11[4] = self;
  id v12 = v8;
  uint64_t v13 = v15;
  int v14 = a4;
  id v10 = v8;
  dispatch_async(v9, v11);

  _Block_object_dispose(v15, 8);
}

void __47__TTSMauiSpeechEngine__speakString_withFormat___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) state] == 2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) ruleSetRunner];
    id v4 = [v3 processText:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setProccessedSpeechString:v4];

    uint64_t v5 = [*(id *)(a1 + 32) proccessedSpeechString];
    uint64_t v6 = [v5 transformedString];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = @" ";
    }
    v11 = [MEMORY[0x263F7EEC8] sharedInstance];
    id v12 = [v11 regexForString:@"((\\\\!|\\x1B)\\\\(rate|pitch|vol|tn)=(\\d|spell|normal)*\\\\)*(?=(((\\\\!|\\x1B)\\\\pause=(\\d)*\\\\)*$))" atStart:0];

    uint64_t v13 = objc_msgSend(v12, "firstMatchInString:options:range:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 2, 0, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "length"));
    int v14 = v13;
    if (v13)
    {
      unsigned int v15 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v16 = [v13 range];
      uint64_t v18 = objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", v16, v17, &stru_26D21B548);
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
    uint64_t v21 = [MEMORY[0x263F7EEC8] sharedInstance];
    uint64_t v22 = [v21 regexForString:@"(?:(?:\\\\!|\\x1B)\\\\pause=(?:\\d)*\\\\)+\\s*$"];

    v23 = objc_msgSend(v22, "firstMatchInString:options:range:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 2, 0, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "length"));
    BOOL v24 = v23 == 0;

    [*(id *)(a1 + 32) setTrimEndingSilences:v24];
    v32[0] = 0;
    LODWORD(v32[0]) = *(_DWORD *)(a1 + 56);
    v32[1] = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) lengthOfBytesUsingEncoding:10];
    v32[2] = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) cStringUsingEncoding:10];
    uint64_t v25 = [*(id *)(a1 + 32) vocalizerInstanceHandle];
    uint64_t v27 = ve_ttsProcessText2Speech(v25, v26, (uint64_t)v32);
    if (v27 != -2147481593)
    {
      uint64_t v28 = v27;
      if (v27)
      {
        long long v30 = AXTTSLogCommon();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          __47__TTSMauiSpeechEngine__speakString_withFormat___block_invoke_cold_1(v2, v28);
        }

        uint64_t v29 = 3;
      }
      else
      {
        uint64_t v29 = 4;
      }
      [*v2 setState:v29];
    }
    v31 = [*v2 producedBuffers];
    [v31 broadcast];
  }
}

- (void)cancelSpeaking
{
  [(TTSMauiSpeechEngine *)self setState:3];
  uint64_t v3 = [(TTSMauiSpeechEngine *)self ruleSetRunner];
  [v3 cancelProcessing];

  id v4 = [(TTSMauiSpeechEngine *)self synthesisQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__TTSMauiSpeechEngine_cancelSpeaking__block_invoke;
  block[3] = &unk_26455D2C0;
  block[4] = self;
  dispatch_sync(v4, block);
}

uint64_t __37__TTSMauiSpeechEngine_cancelSpeaking__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:1];
}

void __37__TTSMauiSpeechEngine_cancelSpeaking__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setInProgressBuffer:0];
  id v2 = [*(id *)(a1 + 32) finishedBuffers];
  [v2 removeAllObjects];

  [*(id *)(a1 + 32) setInProgressBuffer:0];
  id v3 = [*(id *)(a1 + 32) producedBuffers];
  [v3 broadcast];
}

- (void)setRate:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToNumber:self->_rate] & 1) == 0)
  {
    id v4 = [(TTSMauiSpeechEngine *)self _vocalizerClampNumber:v6 between:50 and:400];
    rate = self->_rate;
    self->_rate = v4;

    [(TTSMauiSpeechEngine *)self _syncParametersWithEngine];
  }
}

- (void)setPitch:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToNumber:self->_pitch] & 1) == 0)
  {
    id v4 = [(TTSMauiSpeechEngine *)self _vocalizerClampNumber:v6 between:50 and:200];
    pitch = self->_pitch;
    self->_pitch = v4;

    [(TTSMauiSpeechEngine *)self _syncParametersWithEngine];
  }
}

- (void)setVolume:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToNumber:self->_volume] & 1) == 0)
  {
    id v4 = [(TTSMauiSpeechEngine *)self _vocalizerClampNumber:v6 between:0 and:100];
    volume = self->_volume;
    self->_volume = v4;

    [(TTSMauiSpeechEngine *)self _syncParametersWithEngine];
  }
}

- (void)setTimbre:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToNumber:self->_timbre] & 1) == 0)
  {
    id v4 = [(TTSMauiSpeechEngine *)self _vocalizerClampNumber:v6 between:50 and:200];
    timbre = self->_timbre;
    self->_timbre = v4;

    [(TTSMauiSpeechEngine *)self _syncParametersWithEngine];
  }
}

- (void)setPostSentencePauseDuration:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToNumber:self->_postSentencePauseDuration] & 1) == 0)
  {
    id v4 = [(TTSMauiSpeechEngine *)self _vocalizerClampNumber:v6 between:0 and:9];
    postSentencePauseDuration = self->_postSentencePauseDuration;
    self->_postSentencePauseDuration = v4;

    [(TTSMauiSpeechEngine *)self _syncParametersWithEngine];
  }
}

- (id)_vocalizerClampNumber:(id)a3 between:(unsigned __int16)a4 and:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  unsigned int v6 = a4;
  unsigned int v7 = [a3 unsignedShortValue];
  if (v7 >= v5) {
    unsigned int v8 = v5;
  }
  else {
    unsigned int v8 = v7;
  }
  if (v7 >= v6) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v6;
  }
  id v10 = NSNumber;

  return (id)[v10 numberWithUnsignedShort:v9];
}

- (BOOL)_initializeVoiceDataFiles
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 pathForResource:@"common" ofType:0 inDirectory:@"TTSResources"];

  if (![(TTSMauiSpeechEngine *)self _addPathDictionaryEntriesForDirectory:v4])
  {
    unsigned int v5 = AXTTSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[TTSMauiSpeechEngine _initializeVoiceDataFiles]();
    }
  }
  unsigned int v6 = [(TTSMauiSpeechEngine *)self currentVoice];
  unsigned int v7 = [v6 contentPath];
  BOOL v8 = [(TTSMauiSpeechEngine *)self _addPathDictionaryEntriesForDirectory:v7];

  return v8;
}

- (BOOL)_addPathDictionaryEntriesForDirectory:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v5 = [MEMORY[0x263F08850] defaultManager];
  id v24 = 0;
  unsigned int v6 = [v5 contentsOfDirectoryAtPath:v4 error:&v24];
  id v7 = v24;

  if (v7)
  {
    obj = AXTTSLogCommon();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[TTSMauiSpeechEngine _addPathDictionaryEntriesForDirectory:]();
    }
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v18 = v6;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v13 = [v4 stringByAppendingPathComponent:v12];
          int v14 = [v12 stringByDeletingPathExtension];
          unsigned int v15 = [v14 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];

          if (([v12 hasSuffix:@".hdr"] & 1) != 0
            || [v12 hasSuffix:@".hdr.asset"])
          {

            unsigned int v15 = @"broker";
          }
          uint64_t v16 = [(TTSMauiSpeechEngine *)self pathDictionary];
          [v16 setObject:v13 forKeyedSubscript:v15];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v9);
      id v7 = 0;
      unsigned int v6 = v18;
    }
  }

  return v7 == 0;
}

- (id)_parseBrokerString:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F7EEC8] sharedInstance];
  unsigned int v5 = [v4 regexForString:@"([\\s]*<(?<parameter>.*)>(?<value>.*)<\\/.*>\\n)" atStart:0];

  id v27 = [MEMORY[0x263EFF9A0] dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v26 = v5;
  uint64_t v29 = v3;
  objc_msgSend(v5, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    uint64_t v9 = @"parameter";
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v12 = [v11 rangeWithName:v9];
        uint64_t v14 = v13;
        uint64_t v15 = [v11 rangeWithName:@"value"];
        if (v14) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17)
        {
          uint64_t v18 = v15;
          uint64_t v19 = v16;
          long long v20 = v9;
          long long v21 = objc_msgSend(v29, "substringWithRange:", v12, v14);
          long long v22 = [v21 uppercaseString];
          char v23 = [v22 isEqualToString:@"COMPONENT"];

          if ((v23 & 1) == 0)
          {
            id v24 = objc_msgSend(v29, "substringWithRange:", v18, v19);
            [v27 setObject:v24 forKeyedSubscript:v21];
          }
          uint64_t v9 = v20;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }

  return v27;
}

- (void)_deinitializeEngine
{
  uint64_t v3 = [(TTSMauiSpeechEngine *)self vocalizerInstanceHandle];
  ve_ttsClose(v3, v4, v5, v6, v7, v8, v9, v10);
  uint64_t v11 = [(TTSMauiSpeechEngine *)self vocalizerClassHandle];
  ve_ttsUnInitialize(v11, v12);

  [(TTSMauiSpeechEngine *)self setState:0];
}

- (void)setTrimEndingSilences:(BOOL)a3
{
  __int16 v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  bzero(v12, 0x83CuLL);
  int v11 = 22;
  v12[0] = v3;
  uint64_t v5 = [(TTSMauiSpeechEngine *)self vocalizerInstanceHandle];
  ve_ttsSetParamList(v5, v6, &v11, 1, v7, v8, v9, v10);
}

- (BOOL)_initializeEngine
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  if ([(TTSMauiSpeechEngine *)self _initializeVoiceDataFiles])
  {
    __int16 v3 = [(TTSMauiSpeechEngine *)self pathDictionary];
    int v4 = [v3 objectForKeyedSubscript:@"broker"];

    if (!v4)
    {
      uint64_t v7 = AXTTSLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[TTSMauiSpeechEngine _initializeEngine](self);
      }
      BOOL v14 = 0;
      goto LABEL_19;
    }
    id v50 = 0;
    uint64_t v5 = [NSString stringWithContentsOfFile:v4 encoding:4 error:&v50];
    int v6 = v50;
    uint64_t v7 = v6;
    if (!v5 || v6)
    {
      uint64_t v9 = AXTTSLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[TTSMauiSpeechEngine _initializeEngine](self);
      }
      goto LABEL_17;
    }
    [(TTSMauiSpeechEngine *)self setBrokerString:v5];
    uint64_t v8 = [(TTSMauiSpeechEngine *)self brokerString];
    uint64_t v9 = [(TTSMauiSpeechEngine *)self _parseBrokerString:v8];

    v49[0] = 8963;
    id v10 = [(TTSMauiSpeechEngine *)self brokerString];
    v49[1] = objc_msgSend(v10, "cStringUsingEncoding:", objc_msgSend(NSString, "defaultCStringEncoding"));
    v49[2] = TTSMauiVocalizerGetHeapImpl();
    v49[3] = 0;
    v49[4] = TTSMauiVocalizerGetCriticalSectionImpl();
    v49[5] = 0;
    v49[6] = [(TTSMauiSpeechEngine *)self dataStreamImpl];
    v49[7] = [(TTSMauiSpeechEngine *)self dataMapImpl];
    v49[8] = TTSMauiVocalizerGetDLDImpl();
    v49[9] = self;
    v49[10] = TTSMauiVocalizerGetLogImpl();
    memset(&v49[11], 0, 24);
    v49[14] = TTSMauiVocalizerGetThreadImpl();
    v49[15] = TTSMauiVocalizerGetSemaphoreImpl();
    v49[16] = 0;

    uint64_t __b = 0;
    uint64_t v48 = 0;
    uint64_t v11 = ve_ttsInitialize((uint64_t)v49, &__b);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = AXTTSLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(TTSMauiSpeechEngine *)self _initializeEngine];
      }

LABEL_17:
      BOOL v14 = 0;
LABEL_18:

LABEL_19:
      goto LABEL_20;
    }
    -[TTSMauiSpeechEngine setVocalizerClassHandle:](self, "setVocalizerClassHandle:", __b, v48);
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    uint64_t v16 = [(TTSMauiSpeechEngine *)self vocalizerClassHandle];
    if (ve_ttsOpen(v16, v17, 0, 0, (uint64_t)&v45, v18, v19, v20))
    {
      long long v21 = AXTTSLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[TTSMauiSpeechEngine _initializeEngine].cold.6(self);
      }
      BOOL v14 = 0;
      goto LABEL_35;
    }
    -[TTSMauiSpeechEngine setVocalizerInstanceHandle:](self, "setVocalizerInstanceHandle:", v45, v46);
    long long v21 = [v9 objectForKeyedSubscript:@"voice"];
    uint64_t v22 = [v9 objectForKeyedSubscript:@"langcode"];
    char v23 = (void *)v22;
    if (v21 && v22)
    {
      id v24 = v21;
      __source = (char *)-[NSObject cStringUsingEncoding:](v24, "cStringUsingEncoding:", [NSString defaultCStringEncoding]);
      id v25 = v23;
      uint64_t v26 = (const char *)objc_msgSend(v25, "cStringUsingEncoding:", objc_msgSend(NSString, "defaultCStringEncoding"));
      bzero(v52, 0x83CuLL);
      int v51 = 1;
      strlcpy(v52, v26, 0x80uLL);
      int v53 = 2;
      strlcpy(v54, __source, 0x80uLL);
      int v55 = 19;
      __int16 v56 = 1;
      int v57 = 7;
      __int16 v58 = 1;
      uint64_t v27 = [(TTSMauiSpeechEngine *)self vocalizerInstanceHandle];
      if (!ve_ttsSetParamList(v27, v28, &v51, 4, v29, v30, v31, v32))
      {
        v44[0] = self;
        v44[1] = MauiProcCallback;
        uint64_t v34 = [(TTSMauiSpeechEngine *)self vocalizerInstanceHandle];
        int v41 = ve_ttsSetOutDevice(v34, v35, (uint64_t)v44, v36, v37, v38, v39, v40);
        BOOL v14 = v41 == 0;
        if (v41)
        {
          v42 = AXTTSLogCommon();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            -[TTSMauiSpeechEngine _initializeEngine].cold.4(self);
          }
        }
        else
        {
          [(TTSMauiSpeechEngine *)self setState:1];
          [(TTSMauiSpeechEngine *)self _syncParametersWithEngine];
        }
        goto LABEL_34;
      }
      long long v33 = AXTTSLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[TTSMauiSpeechEngine _initializeEngine].cold.5(self);
      }
    }
    else
    {
      long long v33 = AXTTSLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[TTSMauiSpeechEngine _initializeEngine](self);
      }
    }

    BOOL v14 = 0;
LABEL_34:

LABEL_35:
    goto LABEL_18;
  }
  int v4 = AXTTSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[TTSMauiSpeechEngine _initializeEngine].cold.8(self);
  }
  BOOL v14 = 0;
LABEL_20:

  return v14;
}

- (id)_rawLiteralCharacterRegexForCurrentLanguage
{
  id v2 = [(TTSMauiSpeechEngine *)self currentVoice];
  __int16 v3 = [v2 primaryLanguage];

  if ([v3 hasPrefix:@"el"])
  {
    int v4 = [MEMORY[0x263F7EEC8] sharedInstance];
    uint64_t v5 = v4;
    int v6 = @"[\\u03B1-\\u03C9]";
LABEL_7:
    uint64_t v7 = [v4 regexForString:v6 atStart:0];

    goto LABEL_8;
  }
  if ([v3 hasPrefix:@"da"])
  {
    int v4 = [MEMORY[0x263F7EEC8] sharedInstance];
    uint64_t v5 = v4;
    int v6 = @"[æøå]";
    goto LABEL_7;
  }
  if ([v3 hasPrefix:@"ja"])
  {
    int v4 = [MEMORY[0x263F7EEC8] sharedInstance];
    uint64_t v5 = v4;
    int v6 = @"[\\u30a0-\\u30ff]";
    goto LABEL_7;
  }
  uint64_t v7 = 0;
LABEL_8:

  return v7;
}

- (id)_applyPostRuleRewrites:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TTSMauiSpeechEngine *)self _rawLiteralCharacterRegexForCurrentLanguage];
  int v6 = [(TTSMauiSpeechEngine *)self currentVoice];
  uint64_t v7 = [v6 primaryLanguage];
  int v8 = [v7 hasPrefix:@"ja"];

  if (v8)
  {
    uint64_t v9 = [v4 originalString];
    id v10 = [MEMORY[0x263F7EEC8] sharedInstance];
    uint64_t v11 = [v10 regexForString:@"((?<=(\\\\!|\\x1B)\\\\tn=spell\\\\)[\\s\\S]*?(?=((\\\\!|\\x1B)\\\\tn=)|$))" atStart:0];

    uint64_t v12 = [MEMORY[0x263F7EEC8] sharedInstance];
    uint64_t v13 = [v12 regexForString:@"[ぁぃぅぇぉっゃゅょァィゥェォッャュョァィゥェォャュョッㇱっ]" atStart:0];

    BOOL v14 = [v4 originalString];
    uint64_t v15 = [v14 length];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke;
    v29[3] = &unk_26455D388;
    id v30 = v13;
    id v31 = v9;
    id v32 = v4;
    id v16 = v9;
    id v17 = v13;
    objc_msgSend(v11, "enumerateMatchesInString:options:range:usingBlock:", v16, 2, 0, v15, v29);
  }
  if (v5)
  {
    uint64_t v18 = [v4 originalString];
    uint64_t v19 = [MEMORY[0x263F7EEC8] sharedInstance];
    uint64_t v20 = [v19 regexForString:@"((?<=(\\\\!|\\x1B)\\\\tn=spell\\\\)[\\s\\S]*?(?=((\\\\!|\\x1B)\\\\tn=)|$))" atStart:0];

    long long v21 = [v4 originalString];
    uint64_t v22 = [v21 length];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke_3;
    v25[3] = &unk_26455D388;
    id v26 = v5;
    id v27 = v18;
    id v28 = v4;
    id v23 = v18;
    objc_msgSend(v20, "enumerateMatchesInString:options:range:usingBlock:", v23, 2, 0, v22, v25);
  }

  return v4;
}

void __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    __int16 v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [a2 range];
    uint64_t v7 = v6;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke_2;
    v8[3] = &unk_26455D360;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "enumerateMatchesInString:options:range:usingBlock:", v4, 2, v5, v7, v8);
  }
}

void __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    __int16 v3 = *(void **)(a1 + 32);
    id v4 = a2;
    uint64_t v5 = [v4 range];
    objc_msgSend(v3, "substringWithRange:", v5, v6);
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (([(__CFString *)v13 isEqualToString:@"っ"] & 1) != 0
      || ([(__CFString *)v13 isEqualToString:@"ッ"] & 1) != 0
      || ([(__CFString *)v13 isEqualToString:@"ッ"] & 1) != 0
      || [(__CFString *)v13 isEqualToString:@"ㇱ"])
    {

      uint64_t v7 = @"つ";
    }
    else
    {
      uint64_t v7 = v13;
    }
    BOOL v14 = v7;
    int v8 = [NSString stringWithFormat:@"\x1B\\tn=normal\\%@\x1B\\pause=100\\%@\x1B\\pause=100\\\x1B\\tn=spell\\", @"小さい"", v7];
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = [v4 range];
    uint64_t v12 = v11;

    objc_msgSend(v9, "transformRange:to:", v10, v12, v8);
  }
}

void __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke_3(uint64_t a1, void *a2)
{
  if (a2)
  {
    __int16 v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [a2 range];
    uint64_t v7 = v6;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke_4;
    v8[3] = &unk_26455D360;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "enumerateMatchesInString:options:range:usingBlock:", v4, 2, v5, v7, v8);
  }
}

void __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke_4(uint64_t a1, void *a2)
{
  if (a2)
  {
    __int16 v3 = *(void **)(a1 + 32);
    id v4 = a2;
    uint64_t v5 = [v4 range];
    objc_msgSend(v3, "substringWithRange:", v5, v6);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [NSString stringWithFormat:@"\x1B\\tn=raw\\%@\x1B\\tn=spell\\"", v12];
    int v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v4 range];
    uint64_t v11 = v10;

    objc_msgSend(v8, "transformRange:to:", v9, v11, v7);
  }
}

- (void)_syncParametersWithEngine
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 rate];
  uint64_t v7 = [a1 pitch];
  int v8 = [a1 volume];
  uint64_t v9 = [a1 timbre];
  uint64_t v10 = [NSNumber numberWithUnsignedInt:a2];
  int v11 = 138413314;
  id v12 = v6;
  __int16 v13 = 2112;
  BOOL v14 = v7;
  __int16 v15 = 2112;
  id v16 = v8;
  __int16 v17 = 2112;
  uint64_t v18 = v9;
  __int16 v19 = 2112;
  uint64_t v20 = v10;
  _os_log_error_impl(&dword_2201BD000, a3, OS_LOG_TYPE_ERROR, "Failed to set vocalizer paramters rate: %@ pitch: %@ volume: %@ timbre: %@ error: %@", (uint8_t *)&v11, 0x34u);
}

- (BOOL)loadVoiceResource:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(TTSMauiSpeechEngine *)self synthesisQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__TTSMauiSpeechEngine_loadVoiceResource___block_invoke;
  block[3] = &unk_26455D3B0;
  id v9 = v4;
  uint64_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __41__TTSMauiSpeechEngine_loadVoiceResource___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _loadVoiceResource:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)loadRuleset:(id)a3
{
  id v4 = a3;
  uint64_t v7 = [[TTSMauiVoiceResource alloc] init];
  [(TTSMauiVoiceResource *)v7 setType:0];
  [(TTSMauiVoiceResource *)v7 setRuleSet:v4];
  uint64_t v5 = [(TTSMauiSpeechEngine *)self ruleSetRunner];
  [v5 loadRuleSet:v4];

  id v6 = [(TTSMauiSpeechEngine *)self voiceResources];
  [v6 addObject:v7];
}

- (BOOL)_loadVoiceResource:(id)a3
{
  id v4 = a3;
  if ([v4 type])
  {
    unint64_t v5 = [v4 type];
    if (v5 > 2) {
      id v6 = "";
    }
    else {
      id v6 = off_26455D3D0[v5];
    }
    id v9 = [v4 resourceData];

    if (v9)
    {
      id v10 = [v4 resourceData];
      uint64_t v11 = (char *)[v10 bytes];

      id v12 = [v4 resourceData];
      uint64_t v13 = [v12 length];
    }
    else
    {
      id v14 = [v4 resourceString];
      uint64_t v11 = (char *)[v14 cStringUsingEncoding:4];

      id v12 = [v4 resourceString];
      uint64_t v13 = [v12 lengthOfBytesUsingEncoding:4];
    }
    uint64_t v15 = v13;

    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v16 = [(TTSMauiSpeechEngine *)self vocalizerInstanceHandle];
    int v20 = ve_ttsResourceLoad(v16, v17, v6, v15, v11, &v31, v18, v19);
    BOOL v21 = v20 == 0;
    if (!v20)
    {
      objc_msgSend(v4, "setVoiceResourceHandle:", v31, v32);
      uint64_t v22 = [(TTSMauiSpeechEngine *)self voiceResources];
      [v22 addObject:v4];
    }
  }
  else
  {
    uint64_t v7 = [v4 resourceData];
    if (v7)
    {
      int v8 = [v4 resourceData];
    }
    else
    {
      id v23 = [v4 resourceString];
      int v8 = [v23 dataUsingEncoding:4];
    }
    id v24 = (void *)MEMORY[0x263F7EED0];
    id v25 = [v4 resourceName];
    id v26 = [(TTSMauiSpeechEngine *)self loadedResources];
    id v27 = objc_msgSend(v24, "rulesetWithData:identifier:priority:", v8, v25, objc_msgSend(v26, "count"));

    [v4 setRuleSet:v27];
    id v28 = [(TTSMauiSpeechEngine *)self ruleSetRunner];
    [v28 loadRuleSet:v27];

    uint64_t v29 = [(TTSMauiSpeechEngine *)self voiceResources];
    [v29 addObject:v4];

    BOOL v21 = 1;
  }

  return v21;
}

- (BOOL)unloadVoiceResource:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  unint64_t v5 = [(TTSMauiSpeechEngine *)self synthesisQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__TTSMauiSpeechEngine_unloadVoiceResource___block_invoke;
  block[3] = &unk_26455D3B0;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __43__TTSMauiSpeechEngine_unloadVoiceResource___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "queue_unloadVoiceResource:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)queue_unloadVoiceResource:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TTSMauiSpeechEngine *)self voiceResources];
  [v5 removeObject:v4];

  id v6 = [v4 ruleSet];

  if (v6)
  {
    uint64_t v7 = [(TTSMauiSpeechEngine *)self ruleSetRunner];
    int v8 = [v4 ruleSet];
    [v7 unloadRuleset:v8];

    [v4 setRuleSet:0];
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v10 = [(TTSMauiSpeechEngine *)self vocalizerInstanceHandle];
    int v12 = v11;
    uint64_t v13 = (uint64_t *)[v4 voiceResourceHandle];
    BOOL v9 = ve_ttsResourceUnload(v10, v12, v13, v14, v15, v16, v17, v18) == 0;
  }

  return v9;
}

- (void)unloadAllVoiceResources
{
  __int16 v3 = [(TTSMauiSpeechEngine *)self synthesisQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__TTSMauiSpeechEngine_unloadAllVoiceResources__block_invoke;
  block[3] = &unk_26455D2C0;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __46__TTSMauiSpeechEngine_unloadAllVoiceResources__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_unloadAllVoiceResources");
}

- (void)queue_unloadAllVoiceResources
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  __int16 v3 = [(TTSMauiSpeechEngine *)self voiceResources];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(TTSMauiSpeechEngine *)self queue_unloadVoiceResource:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (TTSRulesetRunner)ruleSetRunner
{
  return self->_ruleSetRunner;
}

- (void)setRuleSetRunner:(id)a3
{
}

- (NSNumber)pitch
{
  return self->_pitch;
}

- (NSNumber)rate
{
  return self->_rate;
}

- (NSNumber)volume
{
  return self->_volume;
}

- (NSNumber)timbre
{
  return self->_timbre;
}

- (NSNumber)postSentencePauseDuration
{
  return self->_postSentencePauseDuration;
}

- (TTSAXResource)currentVoice
{
  return self->_currentVoice;
}

- (void)setCurrentVoice:(id)a3
{
}

- (NSMutableDictionary)pathDictionary
{
  return self->_pathDictionary;
}

- (void)setPathDictionary:(id)a3
{
}

- (NSString)brokerString
{
  return self->_brokerString;
}

- (void)setBrokerString:(id)a3
{
}

- (_VE_HSAFE)vocalizerClassHandle
{
  uint64_t v2 = *(void *)&self->_vocalizerClassHandle.u32Check;
  pHandleData = self->_vocalizerClassHandle.pHandleData;
  result.u32Check = v2;
  result.pHandleData = pHandleData;
  return result;
}

- (void)setVocalizerClassHandle:(_VE_HSAFE)a3
{
  self->_vocalizerClassHandle = a3;
}

- (_VE_HSAFE)vocalizerInstanceHandle
{
  uint64_t v2 = *(void *)&self->_vocalizerInstanceHandle.u32Check;
  pHandleData = self->_vocalizerInstanceHandle.pHandleData;
  result.u32Check = v2;
  result.pHandleData = pHandleData;
  return result;
}

- (void)setVocalizerInstanceHandle:(_VE_HSAFE)a3
{
  self->_vocalizerInstanceHandle = a3;
}

- (NSCondition)producedBuffers
{
  return self->_producedBuffers;
}

- (void)setProducedBuffers:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSMutableOrderedSet)finishedBuffers
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFinishedBuffers:(id)a3
{
}

- (TTSMauiVocalizerBuffer)inProgressBuffer
{
  return self->_inProgressBuffer;
}

- (void)setInProgressBuffer:(id)a3
{
}

- (OS_dispatch_queue)synthesisQueue
{
  return self->_synthesisQueue;
}

- (void)setSynthesisQueue:(id)a3
{
}

- (NSMutableOrderedSet)voiceResources
{
  return self->_voiceResources;
}

- (void)setVoiceResources:(id)a3
{
}

- (TTSSpeechString)proccessedSpeechString
{
  return self->_proccessedSpeechString;
}

- (void)setProccessedSpeechString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proccessedSpeechString, 0);
  objc_storeStrong((id *)&self->_voiceResources, 0);
  objc_storeStrong((id *)&self->_synthesisQueue, 0);
  objc_storeStrong((id *)&self->_inProgressBuffer, 0);
  objc_storeStrong((id *)&self->_finishedBuffers, 0);
  objc_storeStrong((id *)&self->_producedBuffers, 0);
  objc_storeStrong((id *)&self->_brokerString, 0);
  objc_storeStrong((id *)&self->_pathDictionary, 0);
  objc_storeStrong((id *)&self->_currentVoice, 0);
  objc_storeStrong((id *)&self->_postSentencePauseDuration, 0);
  objc_storeStrong((id *)&self->_timbre, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_rate, 0);
  objc_storeStrong((id *)&self->_pitch, 0);

  objc_storeStrong((id *)&self->_ruleSetRunner, 0);
}

void __47__TTSMauiSpeechEngine__speakString_withFormat___block_invoke_cold_1(id *a1, uint64_t a2)
{
  __int16 v3 = [*a1 currentVoice];
  uint64_t v4 = [NSNumber numberWithUnsignedInt:a2];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2201BD000, v5, v6, "ve_ttsProcessText2Speech failed for resource: %@ nuanceError: %@", v7, v8, v9, v10, v11);
}

- (void)_initializeVoiceDataFiles
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2201BD000, v0, OS_LOG_TYPE_ERROR, "Failed to load common resources at %@", v1, 0xCu);
}

- (void)_addPathDictionaryEntriesForDirectory:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2201BD000, v1, OS_LOG_TYPE_ERROR, "Maui vocalizer failed to load files in directory %@ with error %@", v2, 0x16u);
}

- (void)_initializeEngine
{
  os_log_t v1 = [a1 currentVoice];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2201BD000, v2, v3, "Failed to initialize engine for resource: %@", v4, v5, v6, v7, v8);
}

@end