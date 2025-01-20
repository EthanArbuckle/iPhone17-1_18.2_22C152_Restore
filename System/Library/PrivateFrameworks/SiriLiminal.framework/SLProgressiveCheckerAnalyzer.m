@interface SLProgressiveCheckerAnalyzer
- (BOOL)_setUpAnalyzerWithConfig:(id)a3 error:(id *)a4;
- (SLProgressiveCheckerAnalyzer)initWithConfig:(id)a3 withDelegate:(id)a4 error:(id *)a5;
- (id)_getTokenByInvocationType:(id)a3;
- (void)_addAudio:(id)a3;
- (void)_endAudio;
- (void)_startNewRequestWithContext:(id)a3;
@end

@implementation SLProgressiveCheckerAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationToPhraseMap, 0);
  objc_storeStrong((id *)&self->_circBuffer, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_checkerEndSamples, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_activeRecognizers, 0);
}

- (id)_getTokenByInvocationType:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_shouldUseMultiPhrasesCheckerOutput)
  {
    v6 = 0;
    goto LABEL_27;
  }
  if ([(SLProgressiveCheckerContext *)self->_context invocationType] == 4)
  {
    v5 = @"hsInvocationToken";
    goto LABEL_9;
  }
  if ([(SLProgressiveCheckerContext *)self->_context invocationType] == 5)
  {
    v5 = @"jsInvocationToken";
    goto LABEL_9;
  }
  if ([(SLProgressiveCheckerContext *)self->_context invocationType] == 6)
  {
    v5 = @"magusInvocationToken";
LABEL_9:
    v7 = [(NSDictionary *)self->_invocationToPhraseMap objectForKeyedSubscript:v5];
    if (v7)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
LABEL_12:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v12), "tokens", (void)v19);
          v6 = [v13 lastObject];

          v14 = [v6 tokenName];
          char v15 = [v14 isEqualToString:v7];

          if (v15) {
            break;
          }

          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
            if (v10) {
              goto LABEL_12;
            }
            goto LABEL_18;
          }
        }

        if (v6) {
          goto LABEL_26;
        }
      }
      else
      {
LABEL_18:
      }
      v16 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[SLProgressiveCheckerAnalyzer _getTokenByInvocationType:]";
        _os_log_debug_impl(&dword_21EFF4000, v16, OS_LOG_TYPE_DEBUG, "%s No token found in multiPhrases checker output, Check if phrases are correctly defined in asset decoder config", buf, 0xCu);
      }
    }
    goto LABEL_25;
  }
  v17 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SLProgressiveCheckerAnalyzer _getTokenByInvocationType:]";
    _os_log_debug_impl(&dword_21EFF4000, v17, OS_LOG_TYPE_DEBUG, "%s context invocation type does not map to either of HS/JS/MAGUS", buf, 0xCu);
  }
  v7 = 0;
LABEL_25:
  v6 = 0;
LABEL_26:

LABEL_27:
  return v6;
}

- (void)_endAudio
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_checkerType == 2)
  {
    v3 = -[CSAudioCircularBuffer copybufferFrom:to:](self->_circBuffer, "copybufferFrom:to:", [(CSAudioCircularBuffer *)self->_circBuffer sampleCount]- self->_numSamplesAddedToBufferSinceLastFlush);
    if (v3)
    {
      id v4 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t numSamplesAddedToBufferSinceLastFlush = self->_numSamplesAddedToBufferSinceLastFlush;
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[SLProgressiveCheckerAnalyzer _endAudio]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = numSamplesAddedToBufferSinceLastFlush;
        _os_log_impl(&dword_21EFF4000, v4, OS_LOG_TYPE_DEFAULT, "%s Flushed %lu samples to checker", buf, 0x16u);
      }
      char v6 = [(SLProgressiveCheckerContext *)self->_context audioOption];
      activeRecognizers = self->_activeRecognizers;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __41__SLProgressiveCheckerAnalyzer__endAudio__block_invoke;
      v13[3] = &unk_2644FFFE8;
      v13[4] = self;
      BOOL v15 = (v6 & 2) != 0;
      id v14 = v3;
      [(NSMutableArray *)activeRecognizers enumerateObjectsUsingBlock:v13];
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v17 = 0;
  id v8 = self->_activeRecognizers;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41__SLProgressiveCheckerAnalyzer__endAudio__block_invoke_2;
  v12[3] = &unk_264500010;
  v12[4] = self;
  v12[5] = buf;
  [(NSMutableArray *)v8 enumerateObjectsUsingBlock:v12];
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v9 = [SLProgressiveCheckerResult alloc];
    double latestScore = self->_latestScore;
    *(float *)&double latestScore = latestScore;
    uint64_t v11 = [(SLProgressiveCheckerResult *)v9 initWithScore:self->_checkerType ofType:self->_analyzedSamplesSoFar analyzedSamples:0 detailedResults:latestScore];
    [(SLProgressiveCheckerAnalyzerDelegate *)self->_delegate analyzer:self hasFinalResult:v11];
  }
  _Block_object_dispose(buf, 8);
}

id __41__SLProgressiveCheckerAnalyzer__endAudio__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(a1 + 32) + 32) += *(void *)(*(void *)(a1 + 32) + 72);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 72);
  if (*(unsigned char *)(a1 + 48)) {
    return (id)[a2 resultsWithAddedFloatAudio:v2 numberOfSamples:v3 taskName:&stru_26D09E668];
  }
  else {
    return (id)[a2 resultsWithAddedAudio:v2 numberOfSamples:v3 taskName:&stru_26D09E668];
  }
}

void __41__SLProgressiveCheckerAnalyzer__endAudio__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 resultsWithEndedAudio];
  v5 = [*(id *)(a1 + 32) _getTokenByInvocationType:v4];
  if (!v5)
  {
    char v6 = [v4 firstObject];
    v7 = [v6 tokens];
    v5 = [v7 lastObject];

    if (!v5) {
      goto LABEL_5;
    }
  }
  [v5 end];
  if (v8 > *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [v5 confidence];
    *(void *)(*(void *)(a1 + 32) + 40) = v9;
    [v5 end];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
  }
  else
  {
LABEL_5:
    uint64_t v11 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      uint64_t v18 = "-[SLProgressiveCheckerAnalyzer _endAudio]_block_invoke_2";
      _os_log_impl(&dword_21EFF4000, v11, OS_LOG_TYPE_DEFAULT, "%s All Checkers Finished, but with confidence of last audio chunk not updated", (uint8_t *)&v17, 0xCu);
    }
  }
  uint64_t v12 = (void *)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 32);
    id v14 = v12;
    BOOL v15 = [v5 tokenName];
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 40);
    int v17 = 136315906;
    uint64_t v18 = "-[SLProgressiveCheckerAnalyzer _endAudio]_block_invoke";
    __int16 v19 = 2050;
    uint64_t v20 = v13;
    __int16 v21 = 2114;
    long long v22 = v15;
    __int16 v23 = 2050;
    uint64_t v24 = v16;
    _os_log_impl(&dword_21EFF4000, v14, OS_LOG_TYPE_DEFAULT, "%s All Checkers Finished, analyzed %{public}lu samples, token %{public}@, confidence %{public}f", (uint8_t *)&v17, 0x2Au);
  }
  [*(id *)(*(void *)(a1 + 32) + 8) removeObject:v3];
}

- (void)_addAudio:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(SLProgressiveCheckerContext *)self->_context audioOption];
  unint64_t v6 = [v4 length];
  unint64_t v7 = v5 & 2;
  char v8 = 1;
  if ((v5 & 2) != 0) {
    char v8 = 2;
  }
  unint64_t v9 = v6 >> v8;
  if (self->_checkerType != 2) {
    goto LABEL_11;
  }
  circBuffer = self->_circBuffer;
  id v11 = v4;
  -[CSAudioCircularBuffer addSamples:numSamples:](circBuffer, "addSamples:numSamples:", [v11 bytes], v9);
  uint64_t v12 = self->_circBuffer;
  self->_numSamplesAddedToBufferSinceLastFlush += v9;
  unint64_t v13 = [(CSAudioCircularBuffer *)v12 sampleCount];
  if (self->_numSamplesAddedToBufferSinceLastFlush < self->_numSamplesInStride
    || (unint64_t v14 = v13, v13 < [(CSAudioCircularBuffer *)self->_circBuffer bufferLength]))
  {
    id v4 = v11;
    goto LABEL_14;
  }
  unint64_t v27 = 0;
  id v4 = (id)[(CSAudioCircularBuffer *)self->_circBuffer copyBufferWithNumSamplesCopiedIn:&v27];

  unint64_t v9 = v27;
  BOOL v15 = SLLogContextFacilityCoreSpeech;
  if (v27)
  {
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t numSamplesAddedToBufferSinceLastFlush = self->_numSamplesAddedToBufferSinceLastFlush;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[SLProgressiveCheckerAnalyzer _addAudio:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2048;
      v29 = (uint64_t (*)(uint64_t, uint64_t))numSamplesAddedToBufferSinceLastFlush;
      LOWORD(v30) = 2048;
      *(void *)((char *)&v30 + 2) = v14;
      _os_log_impl(&dword_21EFF4000, v15, OS_LOG_TYPE_DEFAULT, "%s Flushed %lu samples to checker, samples since last flush %lu, total samples in buffer %lu", buf, 0x2Au);
      unint64_t v9 = v27;
    }
    self->_unint64_t numSamplesAddedToBufferSinceLastFlush = 0;
LABEL_11:
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v29 = __Block_byref_object_copy__778;
    *(void *)&long long v30 = __Block_byref_object_dispose__779;
    *((void *)&v30 + 1) = 0;
    activeRecognizers = self->_activeRecognizers;
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __42__SLProgressiveCheckerAnalyzer__addAudio___block_invoke;
    __int16 v21 = &unk_2644FFFC0;
    long long v22 = self;
    unint64_t v25 = v9;
    char v26 = v7 >> 1;
    id v4 = v4;
    id v23 = v4;
    uint64_t v24 = buf;
    [(NSMutableArray *)activeRecognizers enumerateObjectsUsingBlock:&v18];
    if (*(void *)(*(void *)&buf[8] + 40)) {
      -[NSMutableArray removeObjectsAtIndexes:](self->_activeRecognizers, "removeObjectsAtIndexes:", v18, v19, v20, v21, v22);
    }

    _Block_object_dispose(buf, 8);
    goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SLProgressiveCheckerAnalyzer _addAudio:]";
    _os_log_error_impl(&dword_21EFF4000, v15, OS_LOG_TYPE_ERROR, "%s Unable to copy from circular buffer !", buf, 0xCu);
  }
LABEL_14:
}

void __42__SLProgressiveCheckerAnalyzer__addAudio___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  unint64_t v6 = v5;
  *(void *)(*(void *)(a1 + 32) + 32) += *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  if (*(unsigned char *)(a1 + 64)) {
    [v5 resultsWithAddedFloatAudio:v7 numberOfSamples:v8 taskName:&stru_26D09E668];
  }
  else {
  unint64_t v9 = [v5 resultsWithAddedAudio:v7 numberOfSamples:v8 taskName:&stru_26D09E668];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  unint64_t v11 = *(void *)(v10 + 32);
  uint64_t v12 = [*(id *)(v10 + 24) objectAtIndexedSubscript:a3];
  unint64_t v13 = [v12 unsignedIntegerValue];

  if (v11 >= v13)
  {
    unint64_t v14 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 32);
      int v34 = 136315394;
      v35 = "-[SLProgressiveCheckerAnalyzer _addAudio:]_block_invoke";
      __int16 v36 = 2050;
      uint64_t v37 = v15;
      _os_log_impl(&dword_21EFF4000, v14, OS_LOG_TYPE_DEFAULT, "%s Calling endAudio after feeding %{public}lu samples to recognizer", (uint8_t *)&v34, 0x16u);
    }
    uint64_t v16 = [v6 resultsWithEndedAudio];

    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectAtIndex:a3];
    unint64_t v9 = (void *)v16;
  }
  if ([v9 count])
  {
    int v17 = [*(id *)(a1 + 32) _getTokenByInvocationType:v9];
    if (v17) {
      goto LABEL_11;
    }
    uint64_t v18 = [v9 firstObject];
    uint64_t v19 = [v18 tokens];
    int v17 = [v19 lastObject];

    if (v17) {
LABEL_11:
    }
      [v17 confidence];
    else {
      unint64_t v20 = 0xC08F400000000000;
    }
    *(void *)(*(void *)(a1 + 32) + 40) = v20;
    __int16 v21 = (void *)SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 32);
      id v23 = v21;
      uint64_t v24 = [v17 tokenName];
      uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 40);
      int v34 = 136316162;
      v35 = "-[SLProgressiveCheckerAnalyzer _addAudio:]_block_invoke";
      __int16 v36 = 2048;
      uint64_t v37 = a3;
      __int16 v38 = 2050;
      uint64_t v39 = v22;
      __int16 v40 = 2114;
      v41 = v24;
      __int16 v42 = 2050;
      uint64_t v43 = v25;
      _os_log_impl(&dword_21EFF4000, v23, OS_LOG_TYPE_DEFAULT, "%s Checker %lu fired, analyzed %{public}lu samples, token %{public}@,  confidence %{public}f", (uint8_t *)&v34, 0x34u);
    }
    if (*(void *)(*(void *)(a1 + 32) + 48) && (objc_opt_respondsToSelector() & 1) != 0)
    {
      char v26 = [SLProgressiveCheckerResult alloc];
      uint64_t v27 = *(void *)(a1 + 32);
      double v28 = *(double *)(v27 + 40);
      *(float *)&double v28 = v28;
      v29 = [(SLProgressiveCheckerResult *)v26 initWithScore:*(void *)(v27 + 56) ofType:*(void *)(v27 + 32) analyzedSamples:0 detailedResults:v28];
      [*(id *)(*(void *)(a1 + 32) + 48) analyzer:*(void *)(a1 + 32) hasPartialResult:v29];
    }
    if (!*(void *)(*(void *)(a1 + 32) + 56))
    {
      id v30 = (id)[v6 resultsWithEndedAudio];
      uint64_t v31 = [MEMORY[0x263F089C8] indexSetWithIndex:a3];
      uint64_t v32 = *(void *)(*(void *)(a1 + 48) + 8);
      v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = v31;
    }
  }
}

- (void)_startNewRequestWithContext:(id)a3
{
  id v5 = a3;
  p_context = &self->_context;
  objc_storeStrong((id *)&self->_context, a3);
  uint64_t v7 = [(SLProgressiveCheckerContext *)self->_context vtei];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(SLProgressiveCheckerContext *)*p_context vtei];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"triggerEndSampleCount"];
    if (!v10)
    {
LABEL_5:

      goto LABEL_6;
    }
    unint64_t v11 = (void *)v10;
    uint64_t v12 = [(SLProgressiveCheckerContext *)*p_context vtei];
    unint64_t v13 = [v12 objectForKeyedSubscript:@"triggerStartSampleCount"];

    if (v13)
    {
      uint64_t v8 = [(SLProgressiveCheckerContext *)*p_context vtei];
      unint64_t v9 = [v8 objectForKeyedSubscript:@"triggerEndSampleCount"];
      [v9 unsignedIntegerValue];
      unint64_t v14 = [(SLProgressiveCheckerContext *)*p_context vtei];
      uint64_t v15 = [v14 objectForKeyedSubscript:@"triggerStartSampleCount"];
      [v15 unsignedIntegerValue];

      goto LABEL_5;
    }
  }
LABEL_6:
  activeRecognizers = self->_activeRecognizers;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__SLProgressiveCheckerAnalyzer__startNewRequestWithContext___block_invoke;
  v18[3] = &unk_2644FFF98;
  id v19 = v5;
  id v17 = v5;
  [(NSMutableArray *)activeRecognizers enumerateObjectsUsingBlock:v18];
  [(CSAudioCircularBuffer *)self->_circBuffer reset];
}

void __60__SLProgressiveCheckerAnalyzer__startNewRequestWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 locale];
  LODWORD(v5) = 120;
  LOBYTE(v4) = 0;
  [v3 resetWithSamplingRate:16000 language:v6 taskType:@"Dictation" userId:&stru_26D09E668 sessionId:&stru_26D09E668 deviceId:&stru_26D09E668 farField:v4 audioSource:@"ftm" maxAudioBufferSizeSeconds:v5];
}

- (BOOL)_setUpAnalyzerWithConfig:(id)a3 error:(id *)a4
{
  v77[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 stringByDeletingLastPathComponent];
  uint64_t v8 = [MEMORY[0x263F38060] decodeJsonFromFile:v6];
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__778;
  v66 = __Block_byref_object_dispose__779;
  id v67 = 0;
  if (!v8
    || ([MEMORY[0x263F38060] getAftmCheckerConfigFromConfigDict:v8],
        unint64_t v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = v9 == 0,
        v9,
        v10))
  {
    unint64_t v11 = [NSString stringWithFormat:@"Missing config for Progressive checker %@", v8];
    uint64_t v12 = (void *)MEMORY[0x263F087E8];
    v76 = @"reason";
    v77[0] = v11;
    unint64_t v13 = [NSDictionary dictionaryWithObjects:v77 forKeys:&v76 count:1];
    uint64_t v14 = [v12 errorWithDomain:@"com.apple.sl" code:103 userInfo:v13];
    uint64_t v15 = (void *)v63[5];
    v63[5] = v14;

    if (a4)
    {
LABEL_14:
      BOOL v28 = 0;
      *a4 = (id) v63[5];
      goto LABEL_32;
    }
  }
  self->_shouldUseMultiPhrasesCheckerOutput = 0;
  uint64_t v16 = [v8 objectForKeyedSubscript:@"tokenToInvocationMap"];

  if (v16)
  {
    self->_shouldUseMultiPhrasesCheckerOutput = 1;
    id v17 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v69 = "-[SLProgressiveCheckerAnalyzer _setUpAnalyzerWithConfig:error:]";
      _os_log_impl(&dword_21EFF4000, v17, OS_LOG_TYPE_INFO, "%s multi phreases output checker model is used", buf, 0xCu);
    }
    uint64_t v18 = [v8 objectForKeyedSubscript:@"tokenToInvocationMap"];
    invocationToPhraseMap = self->_invocationToPhraseMap;
    self->_invocationToPhraseMap = v18;

    unint64_t v20 = [(NSDictionary *)self->_invocationToPhraseMap objectForKeyedSubscript:@"hsInvocationToken"];
    if (v20)
    {
      __int16 v21 = [(NSDictionary *)self->_invocationToPhraseMap objectForKeyedSubscript:@"jsInvocationToken"];
      if (v21)
      {
        uint64_t v22 = [(NSDictionary *)self->_invocationToPhraseMap objectForKeyedSubscript:@"magusInvocationToken"];
        BOOL v23 = v22 == 0;

        if (!v23) {
          goto LABEL_16;
        }
      }
      else
      {
      }
    }
    unint64_t v11 = [NSString stringWithFormat:@"Missing keys hsInvocationToken/jsInvocationToken/magusInvocationToken in 'tokenToInvocationMap'  %@", self->_invocationToPhraseMap];
    self->_shouldUseMultiPhrasesCheckerOutput = 0;
    uint64_t v24 = (void *)MEMORY[0x263F087E8];
    v74 = @"reason";
    v75 = v11;
    uint64_t v25 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    uint64_t v26 = [v24 errorWithDomain:@"com.apple.sl" code:103 userInfo:v25];
    uint64_t v27 = (void *)v63[5];
    v63[5] = v26;

    if (a4) {
      goto LABEL_14;
    }
  }
LABEL_16:
  unint64_t v11 = [MEMORY[0x263F38060] getAftmCheckerConfigFromConfigDict:v8];
  v29 = [MEMORY[0x263EFF980] array];
  activeRecognizers = self->_activeRecognizers;
  self->_activeRecognizers = v29;

  uint64_t v31 = [v11 objectForKey:@"checkerType"];
  self->_unint64_t checkerType = [v31 unsignedIntValue];

  uint64_t v32 = [v11 objectForKey:@"checkerTimes"];
  v33 = [MEMORY[0x263EFF980] array];
  checkerEndSamples = self->_checkerEndSamples;
  self->_checkerEndSamples = v33;

  unint64_t checkerType = self->_checkerType;
  if (checkerType == 2)
  {
    __int16 v36 = [v32 firstObject];
    [v36 floatValue];
    float v38 = v37;

    uint64_t v39 = [v32 lastObject];
    [v39 floatValue];
    self->_unint64_t numSamplesInStride = (unint64_t)(float)(v40 * 16000.0);

    id v41 = objc_alloc(MEMORY[0x263F37FC0]);
    LODWORD(v42) = 1182400512;
    *(float *)&double v43 = v38;
    uint64_t v44 = (CSAudioCircularBuffer *)[v41 initWithNumChannels:1 recordingDuration:v43 samplingRate:v42];
    circBuffer = self->_circBuffer;
    self->_circBuffer = v44;

    v46 = self->_checkerEndSamples;
    v47 = [NSNumber numberWithUnsignedInteger:0xFFFFFFFFLL];
    [(NSMutableArray *)v46 addObject:v47];

    self->_unint64_t numSamplesAddedToBufferSinceLastFlush = 0;
    v48 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t numSamplesInStride = self->_numSamplesInStride;
      *(_DWORD *)buf = 136315650;
      v69 = "-[SLProgressiveCheckerAnalyzer _setUpAnalyzerWithConfig:error:]";
      __int16 v70 = 2048;
      double v71 = (float)(v38 * 16000.0);
      __int16 v72 = 2048;
      unint64_t v73 = numSamplesInStride;
      _os_log_impl(&dword_21EFF4000, v48, OS_LOG_TYPE_DEFAULT, "%s Configured buffer size: %f samples, to be flushed after every %lu samples", buf, 0x20u);
    }
  }
  else if (checkerType)
  {
    v50 = self->_checkerEndSamples;
    v51 = [NSNumber numberWithUnsignedInteger:0xFFFFFFFFLL];
    [(NSMutableArray *)v50 addObject:v51];
  }
  else
  {
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __63__SLProgressiveCheckerAnalyzer__setUpAnalyzerWithConfig_error___block_invoke;
    v61[3] = &unk_2644FFF48;
    v61[4] = self;
    [v32 enumerateObjectsUsingBlock:v61];
  }
  if (v8)
  {
    v52 = [MEMORY[0x263F38060] getAftmRecognizerRelativeConfigFromConfigDict:v8];
  }
  else
  {
    v52 = 0;
  }
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __63__SLProgressiveCheckerAnalyzer__setUpAnalyzerWithConfig_error___block_invoke_109;
  v57[3] = &unk_2644FFF70;
  v59 = self;
  v60 = &v62;
  id v58 = v7;
  [v52 enumerateObjectsUsingBlock:v57];
  v53 = (void *)v63[5];
  BOOL v28 = v53 == 0;
  if (v53)
  {
    if (a4) {
      *a4 = v53;
    }
    v54 = (id)SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      double v55 = [(id)v63[5] localizedDescription];
      *(_DWORD *)buf = 136315394;
      v69 = "-[SLProgressiveCheckerAnalyzer _setUpAnalyzerWithConfig:error:]";
      __int16 v70 = 2114;
      double v71 = v55;
      _os_log_impl(&dword_21EFF4000, v54, OS_LOG_TYPE_DEFAULT, "%s Failed to initialize SLProgressiveCheckerAnalyzer with error %{public}@", buf, 0x16u);
    }
  }

LABEL_32:
  _Block_object_dispose(&v62, 8);

  return v28;
}

void __63__SLProgressiveCheckerAnalyzer__setUpAnalyzerWithConfig_error___block_invoke(uint64_t a1, void *a2)
{
  [a2 floatValue];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
  id v5 = [NSNumber numberWithUnsignedInteger:(unint64_t)(float)(v3 * 16000.0)];
  [v4 addObject:v5];
}

void __63__SLProgressiveCheckerAnalyzer__setUpAnalyzerWithConfig_error___block_invoke_109(uint64_t a1, void *a2, uint64_t a3)
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v5];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F3B420]) initWithConfiguration:v6];
  if (v7)
  {
    [*(id *)(*(void *)(a1 + 40) + 8) addObject:v7];
    uint64_t v8 = (void *)SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = *(void **)(*(void *)(a1 + 40) + 24);
      BOOL v10 = v8;
      unint64_t v11 = [v9 objectAtIndexedSubscript:a3];
      *(_DWORD *)buf = 136315650;
      id v19 = "-[SLProgressiveCheckerAnalyzer _setUpAnalyzerWithConfig:error:]_block_invoke";
      __int16 v20 = 2050;
      uint64_t v21 = [v11 unsignedIntegerValue];
      __int16 v22 = 2114;
      id v23 = v5;
      _os_log_impl(&dword_21EFF4000, v10, OS_LOG_TYPE_INFO, "%s Added checker to analyze %{public}lu samples with config file %{public}@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v12 = [NSString stringWithFormat:@"EAR recognizer init failed for config: %@", v6];
    unint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = @"reason";
    v25[0] = v12;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v15 = [v13 errorWithDomain:@"com.apple.sl" code:104 userInfo:v14];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
}

- (SLProgressiveCheckerAnalyzer)initWithConfig:(id)a3 withDelegate:(id)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLProgressiveCheckerAnalyzer;
  BOOL v10 = [(SLProgressiveCheckerAnalyzer *)&v14 init];
  if (v10)
  {
    if (SLLogInitIfNeeded_once != -1) {
      dispatch_once(&SLLogInitIfNeeded_once, &__block_literal_global);
    }
    if (![(SLProgressiveCheckerAnalyzer *)v10 _setUpAnalyzerWithConfig:v8 error:a5])
    {
      uint64_t v12 = 0;
      goto LABEL_9;
    }
    objc_storeStrong((id *)&v10->_delegate, a4);
    unint64_t v11 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[SLProgressiveCheckerAnalyzer initWithConfig:withDelegate:error:]";
      _os_log_impl(&dword_21EFF4000, v11, OS_LOG_TYPE_INFO, "%s Initialized Progressive Checkers !", buf, 0xCu);
    }
  }
  uint64_t v12 = v10;
LABEL_9:

  return v12;
}

@end