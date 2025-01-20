@interface VTTranscriber
- (BOOL)isTriggerFollowedByWords;
- (VTTranscriber)initWithConfiguration:(id)a3 triggerTokens:(id)a4 useKeywordSpotting:(BOOL)a5;
- (double)_getConfidence:(id)a3;
- (double)triggerConfidence;
- (id)recognizedTokens;
- (void)endAudio;
- (void)recognizeWavData:(const signed __int16 *)a3 length:(int)a4;
- (void)reset;
- (void)runRecognitionWithCallback:(id)a3;
- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4;
@end

@implementation VTTranscriber

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizerBuffer, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_triggerTokenList, 0);
  objc_storeStrong((id *)&self->_previousUtteranceTokens, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)isTriggerFollowedByWords
{
  return self->_isTriggerFollowedByWords;
}

- (double)triggerConfidence
{
  return self->_triggerConfidence;
}

- (id)recognizedTokens
{
  return self->_previousUtteranceTokens;
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
    v8[2] = __32__VTTranscriber__getConfidence___block_invoke;
    v8[3] = &unk_264325880;
    v8[4] = self;
    v8[5] = &v9;
    [v4 enumerateObjectsUsingBlock:v8];
    double v6 = v10[3];
    _Block_object_dispose(&v9, 8);
  }

  return v6;
}

void __32__VTTranscriber__getConfidence___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 32) count] > a3)
  {
    double v6 = [v5 tokenName];
    v7 = [*(id *)(*(void *)(a1 + 32) + 32) objectAtIndex:a3];
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
  v8[2] = __64__VTTranscriber_speechRecognizer_didFinishRecognitionWithError___block_invoke;
  v8[3] = &unk_264325FF0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __64__VTTranscriber_speechRecognizer_didFinishRecognitionWithError___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v17 = [*(id *)(a1 + 32) description];
      int v18 = 136446210;
      uint64_t v19 = [v17 UTF8String];
      _os_log_error_impl(&dword_21844F000, v2, OS_LOG_TYPE_ERROR, "ERROR: %{public}s\n", (uint8_t *)&v18, 0xCu);
    }
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v3 + 65))
  {
    if (*(void *)(a1 + 32))
    {
      *(void *)(v3 + 24) = 0xC08F400000000000;
    }
    else
    {
      int v13 = [*(id *)(v3 + 16) lastObject];
      [v13 confidence];
      *(void *)(*(void *)(a1 + 40) + 24) = v14;
    }
    __int16 v15 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 24);
      int v18 = 134349056;
      uint64_t v19 = v16;
      _os_log_impl(&dword_21844F000, v15, OS_LOG_TYPE_DEFAULT, "EAR Keyword Spotting Confidence: %{public}f", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 40);
    if (v12) {
LABEL_21:
    }
      (*(void (**)(void))(v12 + 16))();
  }
  else
  {
    *(unsigned char *)(v3 + 64) = 0;
    uint64_t v4 = *(void *)(a1 + 40);
    if (*(void *)(v4 + 32))
    {
      unint64_t v5 = [*(id *)(v4 + 16) count];
      if (v5 >= [*(id *)(*(void *)(a1 + 40) + 32) count])
      {
        [*(id *)(a1 + 40) _getConfidence:*(void *)(*(void *)(a1 + 40) + 16)];
        *(void *)(*(void *)(a1 + 40) + 24) = v6;
        uint64_t v7 = *(void *)(a1 + 40);
        if (*(double *)(v7 + 24) >= 1.0)
        {
          unint64_t v8 = [*(id *)(v7 + 16) count];
          unint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 32) count];
          uint64_t v7 = *(void *)(a1 + 40);
          if (v8 > v9)
          {
            *(unsigned char *)(v7 + 64) = 1;
            uint64_t v7 = *(void *)(a1 + 40);
          }
        }
        id v10 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)(v7 + 24);
          int v18 = 134349056;
          uint64_t v19 = v11;
          _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "EAR Final Current Confidence: %{public}f", (uint8_t *)&v18, 0xCu);
          uint64_t v7 = *(void *)(a1 + 40);
        }
        uint64_t v12 = *(void *)(v7 + 40);
        if (v12) {
          goto LABEL_21;
        }
      }
    }
  }
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__VTTranscriber_speechRecognizer_didRecognizeFinalResults___block_invoke;
  v8[3] = &unk_264325FF0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __59__VTTranscriber_speechRecognizer_didRecognizeFinalResults___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) firstObject];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 16);
  id v5 = v2;
  uint64_t v4 = [v2 tokens];
  [v3 addObjectsFromArray:v4];
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (!self->_useKeywordSpotting)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__VTTranscriber_speechRecognizer_didRecognizePartialResult___block_invoke;
    v8[3] = &unk_264325FF0;
    void v8[4] = self;
    id v9 = v5;
    dispatch_async(queue, v8);
  }
}

void __60__VTTranscriber_speechRecognizer_didRecognizePartialResult___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    v2 = [*(id *)(a1 + 40) tokens];
    unint64_t v3 = [v2 count];
    unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) count];

    if (v3 >= v4)
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = [*(id *)(a1 + 40) tokens];
      [v5 _getConfidence:v6];
      *(void *)(*(void *)(a1 + 32) + 24) = v7;

      uint64_t v8 = *(void *)(a1 + 32);
      if (*(double *)(v8 + 24) >= 1.0)
      {
        id v9 = [*(id *)(a1 + 40) tokens];
        unint64_t v10 = [v9 count];
        unint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 32) count];

        uint64_t v8 = *(void *)(a1 + 32);
        if (v10 > v11)
        {
          *(unsigned char *)(v8 + 64) = 1;
          uint64_t v8 = *(void *)(a1 + 32);
        }
      }
      uint64_t v12 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(v8 + 24);
        int v15 = 134349056;
        uint64_t v16 = v13;
        _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "EAR Partial Current Confidence: %{public}f", (uint8_t *)&v15, 0xCu);
        uint64_t v8 = *(void *)(a1 + 32);
      }
      uint64_t v14 = *(void *)(v8 + 40);
      if (v14) {
        (*(void (**)(void))(v14 + 16))();
      }
    }
  }
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__VTTranscriber_reset__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __22__VTTranscriber_reset__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = -1000.0;
  if (!*(unsigned char *)(v1 + 65)) {
    double v2 = 0.0;
  }
  *(double *)(v1 + 24) = v2;
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (void)endAudio
{
  unint64_t v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "VTTranscriber endAudio", buf, 2u);
  }
  [(_EARSpeechRecognitionAudioBuffer *)self->_recognizerBuffer endAudio];
}

- (void)recognizeWavData:(const signed __int16 *)a3 length:(int)a4
{
}

- (void)runRecognitionWithCallback:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x21D46B9F0]();
  id callback = self->_callback;
  self->_id callback = v5;

  uint64_t v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "VTTranscriber runRecognitionWithCallback", buf, 2u);
  }
  uint64_t v8 = [(_EARSpeechRecognizer *)self->_recognizer runRecognitionWithResultStream:self];
  recognizerBuffer = self->_recognizerBuffer;
  self->_recognizerBuffer = v8;
}

- (VTTranscriber)initWithConfiguration:(id)a3 triggerTokens:(id)a4 useKeywordSpotting:(BOOL)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)VTTranscriber;
  unint64_t v10 = [(VTTranscriber *)&v24 init];
  if (v10)
  {
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.transcribe.Transcriber", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    previousUtteranceTokens = v10->_previousUtteranceTokens;
    v10->_previousUtteranceTokens = v13;

    v10->_triggerConfidence = 0.0;
    uint64_t v15 = [v9 componentsSeparatedByString:@"_"];
    triggerTokenList = v10->_triggerTokenList;
    v10->_triggerTokenList = (NSArray *)v15;

    uint64_t v17 = v10->_triggerTokenList;
    if (v17)
    {
      int v18 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = v17;
        _os_log_impl(&dword_21844F000, v18, OS_LOG_TYPE_DEFAULT, "Transcriber trigger token list: %{public}@", buf, 0xCu);
      }
    }
    recognizerBuffer = v10->_recognizerBuffer;
    v10->_recognizerBuffer = 0;

    v10->_isTriggerFollowedByWords = 0;
    v10->_useKeywordSpotting = a5;
    uint64_t v20 = [objc_alloc(MEMORY[0x263F3B418]) initWithConfiguration:v8];
    recognizer = v10->_recognizer;
    v10->_recognizer = (_EARSpeechRecognizer *)v20;
  }
  v22 = v10;

  return v22;
}

@end