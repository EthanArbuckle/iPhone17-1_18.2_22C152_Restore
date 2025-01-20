@interface VTKeywordAnalyzerQuasar
- (NSDictionary)ctcKwdToPhIdMap;
- (VTKeywordAnalyzerQuasar)initWithConfigPath:(id)a3 triggerTokens:(id)a4 useKeywordSpotting:(BOOL)a5;
- (VTKeywordAnalyzerQuasarScoreDelegate)delegate;
- (double)_getConfidence:(id)a3;
- (double)triggerConfidence;
- (id)_phIdToCtcScoreMap;
- (unint64_t)activeChannel;
- (void)_recognizeWavData:(const signed __int16 *)a3 length:(unint64_t)a4;
- (void)dealloc;
- (void)endAudio;
- (void)processAudioBuffer:(id)a3 numSamples:(unint64_t)a4;
- (void)reset;
- (void)runRecognition;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setCtcKwdToPhIdMap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4;
@end

@implementation VTKeywordAnalyzerQuasar

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ctcKwdToPhIdMap, 0);
  objc_storeStrong((id *)&self->_recognizerBuffer, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
  objc_storeStrong((id *)&self->_triggerTokenList, 0);
  objc_storeStrong((id *)&self->_previousUtteranceTokens, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (VTKeywordAnalyzerQuasarScoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VTKeywordAnalyzerQuasarScoreDelegate *)WeakRetained;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (double)triggerConfidence
{
  return self->_triggerConfidence;
}

- (void)setCtcKwdToPhIdMap:(id)a3
{
}

- (NSDictionary)ctcKwdToPhIdMap
{
  return self->_ctcKwdToPhIdMap;
}

- (double)_getConfidence:(id)a3
{
  id v4 = a3;
  v5 = v4;
  double v6 = 0.0;
  if (v4 && self->_triggerTokenList)
  {
    uint64_t v9 = 0;
    v10 = (double *)&v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0x3FF0000000000000;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __42__VTKeywordAnalyzerQuasar__getConfidence___block_invoke;
    v8[3] = &unk_264325880;
    v8[4] = self;
    v8[5] = &v9;
    [v4 enumerateObjectsUsingBlock:v8];
    double v6 = v10[3];
    _Block_object_dispose(&v9, 8);
  }

  return v6;
}

void __42__VTKeywordAnalyzerQuasar__getConfidence___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 24) count] > a3)
  {
    double v6 = [v5 tokenName];
    v7 = [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndex:a3];
    uint64_t v8 = [v6 caseInsensitiveCompare:v7];

    if (v8) {
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
    }
                                                                              + 24)
                                                                  * 0.0;
  }
  uint64_t v9 = (id)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v5 tokenName];
    uint64_t v11 = [v10 UTF8String];
    [v5 confidence];
    int v13 = 134349570;
    unint64_t v14 = a3;
    __int16 v15 = 2080;
    uint64_t v16 = v11;
    __int16 v17 = 2050;
    uint64_t v18 = v12;
    _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "EAR Token[%{public}lu]: %s (%{public}f)", (uint8_t *)&v13, 0x20u);
  }
}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__VTKeywordAnalyzerQuasar_speechRecognizer_didFinishRecognitionWithError___block_invoke;
  v8[3] = &unk_264325FF0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __74__VTKeywordAnalyzerQuasar_speechRecognizer_didFinishRecognitionWithError___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v23 = a1;
  if (*(void *)(a1 + 32))
  {
    v1 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      id v22 = [*(id *)(v23 + 32) description];
      *(_DWORD *)buf = 136446210;
      uint64_t v29 = [v22 UTF8String];
      _os_log_error_impl(&dword_21844F000, v1, OS_LOG_TYPE_ERROR, "ERROR: %{public}s\n", buf, 0xCu);
    }
    a1 = v23;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 40) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v25 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v7 = (id)VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [v6 tokenName];
          [v6 confidence];
          *(_DWORD *)buf = 138412802;
          uint64_t v29 = (uint64_t)v8;
          __int16 v30 = 2048;
          uint64_t v31 = v9;
          __int16 v32 = 2112;
          v33 = v6;
          _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "CTC: Final-tok: %@(%f):%@", buf, 0x20u);
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v3);
  }

  uint64_t v10 = v23;
  uint64_t v11 = *(void *)(v23 + 40);
  if (*(unsigned char *)(v11 + 48))
  {
    if (*(void *)(v23 + 32))
    {
      *(void *)(v11 + 64) = 0xC08F400000000000;
      goto LABEL_22;
    }
    unint64_t v14 = [*(id *)(v11 + 16) lastObject];
    [v14 confidence];
    *(void *)(*(void *)(v23 + 40) + 64) = v15;

    goto LABEL_21;
  }
  if (*(void *)(v11 + 24))
  {
    unint64_t v12 = [*(id *)(v11 + 16) count];
    uint64_t v10 = v23;
    if (v12 >= [*(id *)(*(void *)(v23 + 40) + 24) count])
    {
      [*(id *)(v23 + 40) _getConfidence:*(void *)(*(void *)(v23 + 40) + 16)];
      *(void *)(*(void *)(v23 + 40) + 64) = v13;
LABEL_21:
      uint64_t v10 = v23;
    }
  }
LABEL_22:
  uint64_t v16 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(*(void *)(v10 + 40) + 64);
    *(_DWORD *)buf = 134349056;
    uint64_t v29 = v17;
    _os_log_impl(&dword_21844F000, v16, OS_LOG_TYPE_DEFAULT, "Final result confidence: %{public}f", buf, 0xCu);
  }
  uint64_t v18 = +[VTPreferences sharedPreferences];
  int v19 = [v18 isMphVTEnabled];

  if (v19)
  {
    v20 = [*(id *)(v23 + 40) _phIdToCtcScoreMap];
  }
  else
  {
    v20 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v23 + 40) + 80));
  [WeakRetained keywordAnalyzerQuasar:*(void *)(v23 + 40) hasResultAvailable:v20 forChannel:*(void *)(*(void *)(v23 + 40) + 72)];
}

- (id)_phIdToCtcScoreMap
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  p_ctcKwdToPhIdMap = &self->_ctcKwdToPhIdMap;
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSDictionary count](self->_ctcKwdToPhIdMap, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = *p_ctcKwdToPhIdMap;
  uint64_t v5 = [(NSDictionary *)obj countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [(NSDictionary *)self->_ctcKwdToPhIdMap objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        [v4 setObject:&unk_26C9A8B70 forKey:v8];
      }
      uint64_t v5 = [(NSDictionary *)obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v5);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obja = self->_previousUtteranceTokens;
  uint64_t v9 = [(NSMutableArray *)obja countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v30;
    *(void *)&long long v10 = 138543618;
    long long v26 = v10;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obja);
        }
        uint64_t v13 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        ctcKwdToPhIdMap = self->_ctcKwdToPhIdMap;
        uint64_t v15 = objc_msgSend(v13, "tokenName", v26);
        uint64_t v16 = [(NSDictionary *)ctcKwdToPhIdMap objectForKeyedSubscript:v15];

        uint64_t v17 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v26;
          v38 = v16;
          __int16 v39 = 2114;
          v40 = v13;
          _os_log_impl(&dword_21844F000, v17, OS_LOG_TYPE_DEFAULT, "MpVT: phId=%{public}@, tok=%{public}@", buf, 0x16u);
        }
        uint64_t v18 = [v4 objectForKey:v16];
        int v19 = v18;
        if (!v18 || ([v18 floatValue], float v21 = v20, objc_msgSend(v13, "confidence"), v22 > v21))
        {
          uint64_t v23 = NSNumber;
          [v13 confidence];
          long long v24 = objc_msgSend(v23, "numberWithDouble:");
          [v4 setObject:v24 forKey:v16];
        }
      }
      uint64_t v9 = [(NSMutableArray *)obja countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v9);
  }

  return v4;
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__VTKeywordAnalyzerQuasar_speechRecognizer_didRecognizeFinalResults___block_invoke;
  v8[3] = &unk_264325FF0;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __69__VTKeywordAnalyzerQuasar_speechRecognizer_didRecognizeFinalResults___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v16 = [*(id *)(a1 + 32) firstObject];
  [v16 tokens];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v7 = +[VTPreferences sharedPreferences];
        int v8 = [v7 isMphVTEnabled];

        uint64_t v9 = *(void *)(a1 + 40);
        if (!v8) {
          goto LABEL_4;
        }
        long long v10 = *(void **)(v9 + 24);
        uint64_t v11 = [v6 tokenName];
        LODWORD(v10) = [v10 containsObject:v11];

        unint64_t v12 = (id)VTLogContextFacilityVoiceTrigger;
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        if (v10)
        {
          if (v13)
          {
            unint64_t v14 = [v6 tokenName];
            *(_DWORD *)buf = 138543362;
            double v22 = v14;
            _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "CTC: Adding tok=%{public}@", buf, 0xCu);
          }
          uint64_t v9 = *(void *)(a1 + 40);
LABEL_4:
          [*(id *)(v9 + 16) addObject:v6];
          continue;
        }
        if (v13)
        {
          uint64_t v15 = [v6 tokenName];
          *(_DWORD *)buf = 138543362;
          double v22 = v15;
          _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "CTC: Ignoring tok=%{public}@", buf, 0xCu);
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v3);
  }
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__VTKeywordAnalyzerQuasar_speechRecognizer_didRecognizePartialResult___block_invoke;
  v8[3] = &unk_264325FF0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __70__VTKeywordAnalyzerQuasar_speechRecognizer_didRecognizePartialResult___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    id v2 = [*(id *)(a1 + 40) tokens];
    unint64_t v3 = [v2 count];
    unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) count];

    if (v3 >= v4)
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = [*(id *)(a1 + 40) tokens];
      [v5 _getConfidence:v6];
      *(void *)(*(void *)(a1 + 32) + 64) = v7;

      int v8 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 64);
        int v11 = 134349056;
        uint64_t v12 = v9;
        _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "Partial result confidence: %{public}f", (uint8_t *)&v11, 0xCu);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
      [WeakRetained keywordAnalyzerQuasar:*(void *)(a1 + 32) hasResultAvailable:0 forChannel:*(void *)(*(void *)(a1 + 32) + 72)];
    }
  }
}

- (void)_recognizeWavData:(const signed __int16 *)a3 length:(unint64_t)a4
{
}

- (void)processAudioBuffer:(id)a3 numSamples:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__VTKeywordAnalyzerQuasar_processAudioBuffer_numSamples___block_invoke;
  block[3] = &unk_264325858;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __57__VTKeywordAnalyzerQuasar_processAudioBuffer_numSamples___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) bytes];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v2 _recognizeWavData:v3 length:v4];
}

- (void)endAudio
{
  uint64_t v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__VTKeywordAnalyzerQuasar_endAudio__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__VTKeywordAnalyzerQuasar_endAudio__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) endAudio];
}

- (void)runRecognition
{
  uint64_t v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__VTKeywordAnalyzerQuasar_runRecognition__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __41__VTKeywordAnalyzerQuasar_runRecognition__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "runRecognitionWithResultStream:");

  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  uint64_t v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)VTKeywordAnalyzerQuasar;
  [(VTKeywordAnalyzerQuasar *)&v4 dealloc];
}

- (void)reset
{
  uint64_t v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__VTKeywordAnalyzerQuasar_reset__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __32__VTKeywordAnalyzerQuasar_reset__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = -1000.0;
  if (!*(unsigned char *)(v1 + 48)) {
    double v2 = 0.0;
  }
  *(double *)(v1 + 64) = v2;
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (VTKeywordAnalyzerQuasar)initWithConfigPath:(id)a3 triggerTokens:(id)a4 useKeywordSpotting:(BOOL)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)VTKeywordAnalyzerQuasar;
  id v10 = [(VTKeywordAnalyzerQuasar *)&v27 init];
  if (v10)
  {
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.transcribe.Transcriber", 0);
    uint64_t v12 = (void *)*((void *)v10 + 1);
    *((void *)v10 + 1) = v11;

    uint64_t v13 = *((void *)v10 + 1);
    unint64_t v14 = dispatch_get_global_queue(33, 0);
    dispatch_set_target_queue(v13, v14);

    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v16 = (void *)*((void *)v10 + 2);
    *((void *)v10 + 2) = v15;

    *((void *)v10 + 8) = 0;
    uint64_t v17 = [v9 componentsSeparatedByString:@"_"];
    long long v18 = (void *)*((void *)v10 + 3);
    *((void *)v10 + 3) = v17;

    uint64_t v19 = *((void *)v10 + 3);
    if (v19)
    {
      long long v20 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = v19;
        _os_log_impl(&dword_21844F000, v20, OS_LOG_TYPE_DEFAULT, "Transcriber trigger token list: %{public}@", buf, 0xCu);
      }
    }
    float v21 = (void *)*((void *)v10 + 5);
    *((void *)v10 + 5) = 0;

    *((unsigned char *)v10 + 48) = a5;
    double v22 = *((void *)v10 + 1);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __79__VTKeywordAnalyzerQuasar_initWithConfigPath_triggerTokens_useKeywordSpotting___block_invoke;
    v24[3] = &unk_264325FF0;
    id v25 = v8;
    id v26 = v10;
    dispatch_async(v22, v24);
  }
  return (VTKeywordAnalyzerQuasar *)v10;
}

void __79__VTKeywordAnalyzerQuasar_initWithConfigPath_triggerTokens_useKeywordSpotting___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v2 = [MEMORY[0x263F08AB0] processInfo];
  [v2 systemUptime];
  double v4 = v3;

  id v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = *(double *)(a1 + 32);
    int v14 = 138543362;
    double v15 = v6;
    _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "Initializing Quasar with config: %{public}@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v7 = [objc_alloc(MEMORY[0x263F3B418]) initWithConfiguration:*(void *)(a1 + 32)];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v7;

  id v10 = [MEMORY[0x263F08AB0] processInfo];
  [v10 systemUptime];
  double v12 = v11;

  uint64_t v13 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134349056;
    double v15 = (v12 - v4) * 1000.0;
    _os_log_impl(&dword_21844F000, v13, OS_LOG_TYPE_DEFAULT, "Speech model loading took %{public}.3fms", (uint8_t *)&v14, 0xCu);
  }
}

@end