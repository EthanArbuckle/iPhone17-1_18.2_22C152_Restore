@interface AXKonaSpeechEngine
+ (id)allVoices;
- (AVAudioConverter)bufferConverter;
- (AVAudioFormat)engineFormat;
- (AVAudioFormat)outputFormat;
- (AXKonaConfiguration)currentConfiguration;
- (AXKonaParameters)currentParameters;
- (AXKonaParameters)parameters;
- (AXKonaSpeechEngine)initWithVoice:(id)a3;
- (AXKonaVoice)currentVoice;
- (BOOL)_initializeWrappedEngineForVoice:(id)a3;
- (BOOL)_loadDictionaryAtPath:(id)a3 type:(int64_t)a4 handle:(void *)a5;
- (BOOL)abbreviationDictionary;
- (BOOL)highQualityMode;
- (BOOL)phrasePrediction;
- (BOOL)preferCommunityDictionary;
- (NLTokenizer)tokenizer;
- (NSArray)currentSpeechSegments;
- (NSCondition)consumedBuffers;
- (NSCondition)producedBuffers;
- (NSDictionary)configurationMap;
- (NSMutableArray)currentMarkers;
- (NSMutableArray)queuedBuffers;
- (NSNumber)highFormantBandwidthScalingFactor;
- (NSNumber)highFormantFrequencyScalingFactor;
- (NSNumber)overrideAspirationGain;
- (NSNumber)overrideFricationGain;
- (NSNumber)overrideOverallGain;
- (NSNumber)overrideVoicingGain;
- (NSRegularExpression)commandRegex;
- (OS_dispatch_queue)synthesizerSyncQueue;
- (TTSRulesetRunner)ruleSetRunner;
- (TTSSpeechString)currentSpeechString;
- (float)lastSampVal;
- (id)_konaCrashPatterns;
- (id)_preprocessTextForIrregularities:(id)a3;
- (id)_segmentsForText:(id)a3;
- (id)dynamicLoggingBlock;
- (id)nextBuffer;
- (int64_t)eciCallback:(int64_t)a3 iParam:(int64_t)a4 instanceData:(void *)a5;
- (unint64_t)synthState;
- (unsigned)currentFrameCount;
- (void)_cancelSynthesis;
- (void)_enqueueBuffer:(id)a3;
- (void)_initializeConfigurationMap;
- (void)_loadDictionaryForVoice:(id)a3;
- (void)_resetEnginePreservingParams;
- (void)cancelSynthesis;
- (void)currentDictionary;
- (void)dealloc;
- (void)klattConstantHook:(id *)a3;
- (void)klattDynamicHook:(KlattFrame *)a3;
- (void)setAbbreviationDictionary:(BOOL)a3;
- (void)setBufferConverter:(id)a3;
- (void)setCommandRegex:(id)a3;
- (void)setConfigurationMap:(id)a3;
- (void)setConsumedBuffers:(id)a3;
- (void)setCurrentConfiguration:(id)a3;
- (void)setCurrentDictionary:(void *)a3;
- (void)setCurrentFrameCount:(unsigned int)a3;
- (void)setCurrentMarkers:(id)a3;
- (void)setCurrentParameters:(id)a3;
- (void)setCurrentSpeechSegments:(id)a3;
- (void)setCurrentSpeechString:(id)a3;
- (void)setCurrentVoice:(id)a3;
- (void)setDynamicLoggingBlock:(id)a3;
- (void)setEngineFormat:(id)a3;
- (void)setHighFormantBandwidthScalingFactor:(id)a3;
- (void)setHighFormantFrequencyScalingFactor:(id)a3;
- (void)setHighQualityMode:(BOOL)a3;
- (void)setLastSampVal:(float)a3;
- (void)setOutputFormat:(id)a3;
- (void)setOverrideAspirationGain:(id)a3;
- (void)setOverrideFricationGain:(id)a3;
- (void)setOverrideOverallGain:(id)a3;
- (void)setOverrideVoicingGain:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPhrasePrediction:(BOOL)a3;
- (void)setPreferCommunityDictionary:(BOOL)a3;
- (void)setProducedBuffers:(id)a3;
- (void)setQueuedBuffers:(id)a3;
- (void)setRuleSetRunner:(id)a3;
- (void)setSynthState:(unint64_t)a3;
- (void)setSynthesizerSyncQueue:(id)a3;
- (void)setTokenizer:(id)a3;
- (void)setVoice:(id)a3;
- (void)setWrappedInstance:(void *)a3;
- (void)synthesizeText:(id)a3;
- (void)wrappedInstance;
@end

@implementation AXKonaSpeechEngine

- (AXKonaSpeechEngine)initWithVoice:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)AXKonaSpeechEngine;
  v6 = [(AXKonaSpeechEngine *)&v32 init];
  if (v6)
  {
    id v31 = 0;
    id v8 = v31;
    commandRegex = v6->_commandRegex;
    v6->_commandRegex = (NSRegularExpression *)v7;

    if (v8)
    {
      v10 = 0;
    }
    else
    {
      v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
      dispatch_queue_t v12 = dispatch_queue_create("konaSpeechSyncQueue", v11);
      synthesizerSyncQueue = v6->_synthesizerSyncQueue;
      v6->_synthesizerSyncQueue = (OS_dispatch_queue *)v12;

      objc_storeStrong((id *)&v6->_currentVoice, a3);
      *(_WORD *)&v6->_highQualityMode = 257;
      v6->_phrasePrediction = 0;
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F153A0]) initWithCommonFormat:3 sampleRate:1 channels:0 interleaved:16000.0];
      engineFormat = v6->_engineFormat;
      v6->_engineFormat = (AVAudioFormat *)v14;

      uint64_t v16 = [objc_alloc(MEMORY[0x1E4F153A0]) initWithCommonFormat:1 sampleRate:1 channels:0 interleaved:16000.0];
      outputFormat = v6->_outputFormat;
      v6->_outputFormat = (AVAudioFormat *)v16;

      uint64_t v18 = [objc_alloc(MEMORY[0x1E4F15370]) initFromFormat:v6->_engineFormat toFormat:v6->_outputFormat];
      bufferConverter = v6->_bufferConverter;
      v6->_bufferConverter = (AVAudioConverter *)v18;

      [(AVAudioConverter *)v6->_bufferConverter setPrimeMethod:2];
      v6->_synthState = 0;
      uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
      queuedBuffers = v6->_queuedBuffers;
      v6->_queuedBuffers = (NSMutableArray *)v20;

      v6->_bufferLock._os_unfair_lock_opaque = 0;
      v22 = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
      producedBuffers = v6->_producedBuffers;
      v6->_producedBuffers = v22;

      v24 = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
      consumedBuffers = v6->_consumedBuffers;
      v6->_consumedBuffers = v24;

      v26 = (TTSRulesetRunner *)objc_alloc_init(MEMORY[0x1E4FAF2B0]);
      ruleSetRunner = v6->_ruleSetRunner;
      v6->_ruleSetRunner = v26;

      uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
      currentMarkers = v6->_currentMarkers;
      v6->_currentMarkers = (NSMutableArray *)v28;

      [(AXKonaSpeechEngine *)v6 _initializeConfigurationMap];
      if ([(AXKonaSpeechEngine *)v6 _initializeWrappedEngineForVoice:v5])
      {
        v6 = v6;
      }
      else
      {

        v6 = 0;
      }

      v10 = v6;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setPhrasePrediction:(BOOL)a3
{
  if (self->_phrasePrediction != a3)
  {
    self->_phrasePrediction = a3;
    [(AXKonaSpeechEngine *)self _resetEnginePreservingParams];
  }
}

- (void)setPreferCommunityDictionary:(BOOL)a3
{
  if (self->_preferCommunityDictionary != a3)
  {
    self->_preferCommunityDictionary = a3;
    [(AXKonaSpeechEngine *)self _resetEnginePreservingParams];
  }
}

- (void)setAbbreviationDictionary:(BOOL)a3
{
  if (self->_abbreviationDictionary != a3)
  {
    self->_abbreviationDictionary = a3;
    [(AXKonaSpeechEngine *)self _resetEnginePreservingParams];
  }
}

- (void)setHighQualityMode:(BOOL)a3
{
  if (self->_highQualityMode != a3)
  {
    BOOL v3 = a3;
    id v5 = objc_alloc(MEMORY[0x1E4F153A0]);
    double v6 = 11025.0;
    if (v3) {
      double v6 = 16000.0;
    }
    uint64_t v7 = (AVAudioFormat *)[v5 initWithCommonFormat:3 sampleRate:1 channels:0 interleaved:v6];
    engineFormat = self->_engineFormat;
    self->_engineFormat = v7;

    self->_highQualityMode = v3;
    v9 = (AVAudioConverter *)[objc_alloc(MEMORY[0x1E4F15370]) initFromFormat:self->_engineFormat toFormat:self->_outputFormat];
    bufferConverter = self->_bufferConverter;
    self->_bufferConverter = v9;

    [(AVAudioConverter *)self->_bufferConverter setPrimeMethod:2];
    [(AXKonaSpeechEngine *)self _resetEnginePreservingParams];
  }
}

- (void)_resetEnginePreservingParams
{
  [(AXKonaSpeechEngine *)self cancelSynthesis];
  if ([(AXKonaSpeechEngine *)self currentDictionary])
  {
    [(AXKonaSpeechEngine *)self wrappedInstance];
    [(AXKonaSpeechEngine *)self currentDictionary];
    eciDeleteDict2();
    [(AXKonaSpeechEngine *)self setCurrentDictionary:0];
  }
  [(AXKonaSpeechEngine *)self wrappedInstance];
  eciDelete2();
  id v4 = [(AXKonaSpeechEngine *)self currentParameters];
  BOOL v3 = [(AXKonaSpeechEngine *)self currentVoice];
  [(AXKonaSpeechEngine *)self _initializeWrappedEngineForVoice:v3];

  [(AXKonaSpeechEngine *)self setParameters:v4];
}

- (void)dealloc
{
  if ([(AXKonaSpeechEngine *)self wrappedInstance])
  {
    BOOL v3 = self;
    objc_sync_enter(v3);
    id v4 = [(AXKonaSpeechEngine *)v3 ruleSetRunner];
    [v4 cancelProcessing];

    [(AXKonaSpeechEngine *)v3 _cancelSynthesis];
    objc_sync_exit(v3);

    if ([(AXKonaSpeechEngine *)v3 currentDictionary])
    {
      [(AXKonaSpeechEngine *)v3 wrappedInstance];
      [(AXKonaSpeechEngine *)v3 currentDictionary];
      eciDeleteDict2();
    }
    [(AXKonaSpeechEngine *)v3 wrappedInstance];
    eciDelete2();
  }
  v5.receiver = self;
  v5.super_class = (Class)AXKonaSpeechEngine;
  [(AXKonaSpeechEngine *)&v5 dealloc];
}

- (void)_initializeConfigurationMap
{
  v20[14] = *MEMORY[0x1E4F143B8];
  v19[0] = &unk_1F2EB4338;
  uint64_t v18 = [[AXKonaConfiguration alloc] initWithDylib:@"enu" dialectCode:@"1.0" dialect:0x10000];
  v20[0] = v18;
  v19[1] = &unk_1F2EB4350;
  v17 = [[AXKonaConfiguration alloc] initWithDylib:@"eng" dialectCode:@"1.1" dialect:65537];
  v20[1] = v17;
  v19[2] = &unk_1F2EB4368;
  uint64_t v16 = [[AXKonaConfiguration alloc] initWithDylib:@"esp" dialectCode:@"2.0" dialect:0x20000];
  v20[2] = v16;
  v19[3] = &unk_1F2EB4380;
  v15 = [[AXKonaConfiguration alloc] initWithDylib:@"esm" dialectCode:@"2.1" dialect:131073];
  v20[3] = v15;
  v19[4] = &unk_1F2EB4398;
  uint64_t v14 = [[AXKonaConfiguration alloc] initWithDylib:@"fra" dialectCode:@"3.0" dialect:196608];
  v20[4] = v14;
  v19[5] = &unk_1F2EB43B0;
  BOOL v3 = [[AXKonaConfiguration alloc] initWithDylib:@"frc" dialectCode:@"3.1" dialect:196609];
  v20[5] = v3;
  v19[6] = &unk_1F2EB43C8;
  id v4 = [[AXKonaConfiguration alloc] initWithDylib:@"deu" dialectCode:@"4.0" dialect:0x40000];
  v20[6] = v4;
  v19[7] = &unk_1F2EB43E0;
  objc_super v5 = [[AXKonaConfiguration alloc] initWithDylib:@"ita" dialectCode:@"5.0" dialect:327680];
  v20[7] = v5;
  v19[8] = &unk_1F2EB43F8;
  double v6 = [[AXKonaConfiguration alloc] initWithDylib:@"ptb" dialectCode:@"7.0" dialect:458752];
  v20[8] = v6;
  v19[9] = &unk_1F2EB4410;
  uint64_t v7 = [[AXKonaConfiguration alloc] initWithDylib:@"fin" dialectCode:@"9.0" dialect:589824];
  v20[9] = v7;
  v19[10] = &unk_1F2EB4428;
  id v8 = [[AXKonaConfiguration alloc] initWithDylib:@"jpn" romanizerDylib:@"jpnrom" encoding:8 dialectCode:@"8.0" dialect:0x80000];
  v20[10] = v8;
  v19[11] = &unk_1F2EB4440;
  v9 = [[AXKonaConfiguration alloc] initWithDylib:@"kor" romanizerDylib:@"korrom" encoding:CFStringConvertEncodingToNSStringEncoding(0x422u) dialectCode:@"10.0" dialect:655360];
  v20[11] = v9;
  v19[12] = &unk_1F2EB4458;
  v10 = [[AXKonaConfiguration alloc] initWithDylib:@"chs" romanizerDylib:@"chsrom" encoding:CFStringConvertEncodingToNSStringEncoding(0x421u) dialectCode:@"6.0" dialect:393216];
  v20[12] = v10;
  v19[13] = &unk_1F2EB4470;
  v11 = [[AXKonaConfiguration alloc] initWithDylib:@"cht" romanizerDylib:@"chtrom" encoding:CFStringConvertEncodingToNSStringEncoding(0xA03u) dialectCode:@"6.1" dialect:393217];
  v20[13] = v11;
  dispatch_queue_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:14];
  configurationMap = self->_configurationMap;
  self->_configurationMap = v12;
}

- (BOOL)_initializeWrappedEngineForVoice:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AXKonaSpeechEngine *)self configurationMap];
  double v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "konaLanguage"));
  uint64_t v7 = [v5 objectForKey:v6];

  id v8 = [v7 iniString];
  [v8 cStringUsingEncoding:4];
  [v8 lengthOfBytesUsingEncoding:4];
  eciSetIniContent();
  [v7 eciDialect];
  uint64_t v9 = eciNew2();
  if (v9) {
    goto LABEL_11;
  }
  [(AXKonaSpeechEngine *)self setWrappedInstance:0];
  [(AXKonaSpeechEngine *)self wrappedInstance];
  if (eciRegisterCallback2())
  {
    uint64_t v18 = "eciRegisterCallback2(self.wrappedInstance, globalEciCallback, (__bridge void *)self, 0, NULL) == ECISUCCESS_SUCCESS";
    int v19 = 483;
    goto LABEL_14;
  }
  [(AXKonaSpeechEngine *)self wrappedInstance];
  if (eciRegisterKlattHooks2())
  {
    uint64_t v18 = "eciRegisterKlattHooks2(self.wrappedInstance, GlobalKlattConstHook, GlobalKlattDynamicHook, (__bridge void *)se"
          "lf) == ECISUCCESS_SUCCESS";
    int v19 = 484;
LABEL_14:
    __assert_rtn("-[AXKonaSpeechEngine _initializeWrappedEngineForVoice:]", "AXKonaSpeechEngine.mm", v19, v18);
  }
  [(AXKonaSpeechEngine *)self highQualityMode];
  [(AXKonaSpeechEngine *)self wrappedInstance];
  if (eciRegisterSampleBuffer2())
  {
    uint64_t v20 = "eciRegisterSampleBuffer2(self.wrappedInstance, _pSampleBuffer, KONA_AUDIOBUFFER_SIZE, &eciSampleFmt) == ECISUCCESS_SUCCESS";
    int v21 = 490;
    goto LABEL_18;
  }
  [v4 eciVoiceNumber];
  eciSetStandardVoice2();
  [(AXKonaSpeechEngine *)self phrasePrediction];
  if (eciSetParam2())
  {
    uint64_t v20 = "eciSetParam2(handle, ECIPARAMTYPE_ENVIRONMENT, ECIENVPARAM_PHRASEPREDICTIONMODE, self.phrasePrediction ? ECIEN"
          "VPARAM_PHRASEPREDICTIONMODE_ENABLED : ECIENVPARAM_PHRASEPREDICTIONMODE_DISABLED) == ECISUCCESS_SUCCESS";
    int v21 = 494;
    goto LABEL_18;
  }
  [(AXKonaSpeechEngine *)self abbreviationDictionary];
  if (eciSetParam2())
  {
    uint64_t v20 = "eciSetParam2(handle, ECIPARAMTYPE_ENVIRONMENT, ECIENVPARAM_ABBRDICTMODE, self.abbreviationDictionary ? ECIENVP"
          "ARAM_ABBRDICTMODE_ENABLED : ECIENVPARAM_ABBRDICTMODE_DISABLED) == ECISUCCESS_SUCCESS";
    int v21 = 496;
LABEL_18:
    __assert_rtn("-[AXKonaSpeechEngine _initializeWrappedEngineForVoice:]", "AXKonaSpeechEngine.mm", v21, v20);
  }
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F38908]) initWithUnit:0];
  [(AXKonaSpeechEngine *)self setTokenizer:v10];

  v11 = [(AXKonaSpeechEngine *)self tokenizer];
  dispatch_queue_t v12 = (void *)kKonaLangToNLLang;
  v13 = [v4 languageCode];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];
  v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = *MEMORY[0x1E4F386F0];
  }
  [v11 setLanguage:v16];

  [(AXKonaSpeechEngine *)self _loadDictionaryForVoice:v4];
  [(AXKonaSpeechEngine *)self setCurrentConfiguration:v7];
LABEL_11:

  return v9 == 0;
}

- (id)_konaCrashPatterns
{
  return &unk_1F2EB4488;
}

- (id)_segmentsForText:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  BOOL v3 = AXTTSLogKona();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[AXKonaSpeechEngine _segmentsForText:]();
  }

  id v4 = [(AXKonaSpeechEngine *)self commandRegex];
  objc_super v32 = objc_msgSend(v4, "matchesInString:options:range:", v36, 2, 0, objc_msgSend(v36, "length"));

  objc_super v5 = [(AXKonaSpeechEngine *)self tokenizer];
  [v5 setString:v36];

  v33 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy_;
  v61 = __Block_byref_object_dispose_;
  id v62 = 0;
  double v6 = [MEMORY[0x1E4FAF2A8] sharedInstance];
  v34 = [v6 regexForString:@"(^|\\s+)['\"]\\s*$" atStart:0];

  uint64_t v7 = [(AXKonaSpeechEngine *)self tokenizer];
  uint64_t v8 = [v36 length];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __39__AXKonaSpeechEngine__segmentsForText___block_invoke;
  v49[3] = &unk_1E6A6FE78;
  id v30 = v32;
  id v50 = v30;
  id v31 = v34;
  id v51 = v31;
  id v35 = v36;
  id v52 = v35;
  v53 = self;
  v55 = &v63;
  v56 = &v57;
  id v9 = v33;
  id v54 = v9;
  objc_msgSend(v7, "enumerateTokensInRange:usingBlock:", 0, v8, v49);

  v37 = objc_alloc_init(AXKonaSpeechSegment);
  uint64_t v10 = v64[3];
  uint64_t v11 = [v35 length];
  -[AXKonaSpeechSegment setRange:](v37, "setRange:", v10, v11 - v64[3]);
  uint64_t v12 = [(AXKonaSpeechSegment *)v37 range];
  uint64_t v14 = objc_msgSend(v35, "substringWithRange:", v12, v13);
  [(AXKonaSpeechSegment *)v37 setText:v14];

  [(AXKonaSpeechSegment *)v37 setMarker:v58[5]];
  v15 = [(AXKonaSpeechEngine *)self currentConfiguration];
  -[AXKonaSpeechSegment setTargetEncoding:](v37, "setTargetEncoding:", [v15 encoding]);

  [v9 addObject:v37];
  uint64_t v16 = AXTTSLogKona();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[AXKonaSpeechEngine _segmentsForText:]();
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v9;
  uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v68 count:16];
  if (v17)
  {
    uint64_t v39 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v46 != v39) {
          objc_enumerationMutation(obj);
        }
        int v19 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        uint64_t v20 = [(AXKonaSpeechEngine *)self _konaCrashPatterns];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v67 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v42;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v42 != v22) {
                objc_enumerationMutation(v20);
              }
              uint64_t v24 = *(void *)(*((void *)&v41 + 1) + 8 * j);
              v25 = [v19 text];
              v26 = objc_msgSend(v25, "stringByReplacingOccurrencesOfString:withString:options:range:", v24, &stru_1F2EB2788, 1025, 0, objc_msgSend(v25, "length"));
              [v19 setText:v26];
            }
            uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v67 count:16];
          }
          while (v21);
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v68 count:16];
    }
    while (v17);
  }

  v27 = AXTTSLogKona();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    -[AXKonaSpeechEngine _segmentsForText:]();
  }

  id v28 = obj;
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  return v28;
}

void __39__AXKonaSpeechEngine__segmentsForText___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v6);
        }
        unint64_t v10 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "range", (void)v30);
        if (a2 >= v10 && a2 - v10 < v11)
        {

          return;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }

  if (a2)
  {
    uint64_t v13 = objc_msgSend(*(id *)(a1 + 40), "matchesInString:options:range:", *(void *)(a1 + 48), 2, 0, a2);
    uint64_t v14 = [v13 firstObject];

    uint64_t v15 = a2;
    if (v14)
    {
      [v14 range];
      uint64_t v15 = [v14 range];
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v17 = v15 - v16;
  if (v15 != v16)
  {
    uint64_t v18 = objc_alloc_init(AXKonaSpeechSegment);
    int v19 = [*(id *)(a1 + 56) currentConfiguration];
    -[AXKonaSpeechSegment setTargetEncoding:](v18, "setTargetEncoding:", [v19 encoding]);

    -[AXKonaSpeechSegment setRange:](v18, "setRange:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), v17);
    uint64_t v20 = *(void **)(a1 + 48);
    uint64_t v21 = [(AXKonaSpeechSegment *)v18 range];
    v23 = objc_msgSend(v20, "substringWithRange:", v21, v22);
    [(AXKonaSpeechSegment *)v18 setText:v23];

    [(AXKonaSpeechSegment *)v18 setMarker:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    [*(id *)(a1 + 64) addObject:v18];
    uint64_t v24 = *(void *)(*(void *)(a1 + 80) + 8);
    v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = 0;
  }
  v26 = objc_alloc_init(AXKonaMarker);
  uint64_t v27 = *(void *)(*(void *)(a1 + 80) + 8);
  id v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v26;

  v29 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", a2, a3);
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setText:v29];

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "setOriginalStringRange:", a2, a3);
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v15;
}

- (id)_preprocessTextForIrregularities:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)-[AXKonaSpeechEngine _preprocessTextForIrregularities:]::TimeDurationRegex;
  if (!-[AXKonaSpeechEngine _preprocessTextForIrregularities:]::TimeDurationRegex)
  {
    uint64_t v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\b((?<!:)[0-9]{1,2}:[0-9]{2}(?!:))\\s?(am|pm|AM|PM|[:cntrl:])?" options:0 error:0];
    id v6 = (void *)-[AXKonaSpeechEngine _preprocessTextForIrregularities:]::TimeDurationRegex;
    -[AXKonaSpeechEngine _preprocessTextForIrregularities:]::TimeDurationRegex = v5;

    id v4 = (void *)-[AXKonaSpeechEngine _preprocessTextForIrregularities:]::TimeDurationRegex;
  }
  uint64_t v7 = objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  if ([v7 count])
  {
    id v8 = (id)[v3 mutableCopy];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = objc_msgSend(v7, "reverseObjectEnumerator", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) range];
          objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", @":", @" ", 0, v13, v14);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v8 = v3;
  }

  return v8;
}

- (void)synthesizeText:(id)a3
{
  id v4 = a3;
  [(AXKonaSpeechEngine *)self cancelSynthesis];
  uint64_t v5 = [(AXKonaSpeechEngine *)self _preprocessTextForIrregularities:v4];

  id v6 = [(AXKonaSpeechEngine *)self ruleSetRunner];
  uint64_t v7 = [v6 processText:v5];
  [(AXKonaSpeechEngine *)self setCurrentSpeechString:v7];

  id v8 = [(AXKonaSpeechEngine *)self currentSpeechString];
  id v9 = [v8 transformedString];

  uint64_t v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = [(AXKonaSpeechEngine *)v10 bufferConverter];
  [v11 reset];

  [(AXKonaSpeechEngine *)v10 setLastSampVal:0.0];
  [(AXKonaSpeechEngine *)v10 setCurrentFrameCount:0];
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  [(AXKonaSpeechEngine *)v10 setCurrentMarkers:v12];

  uint64_t v13 = [(AXKonaSpeechEngine *)v10 _segmentsForText:v9];
  [(AXKonaSpeechEngine *)v10 setCurrentSpeechSegments:v13];

  uint64_t v14 = [(AXKonaSpeechEngine *)v10 synthesizerSyncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__AXKonaSpeechEngine_synthesizeText___block_invoke;
  block[3] = &unk_1E6A6FEA0;
  block[4] = v10;
  dispatch_async(v14, block);

  objc_sync_exit(v10);
  uint64_t v15 = [(AXKonaSpeechEngine *)v10 producedBuffers];
  [v15 wait];
}

void __37__AXKonaSpeechEngine_synthesizeText___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  [*(id *)(a1 + 32) setSynthState:1];
  [*(id *)(a1 + 32) wrappedInstance];
  id v3 = [*(id *)(a1 + 32) currentVoice];
  [v3 eciVoiceNumber];
  eciSetStandardVoice2();

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 currentParameters];
  [v4 setParameters:v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "currentSpeechSegments", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [*(id *)(a1 + 32) wrappedInstance];
        eciInsertIndex2();
        [*(id *)(a1 + 32) wrappedInstance];
        [v11 encodedString];
        [v11 encodedStringLength];
        eciAddText2();
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      v8 += i;
    }
    while (v7);
  }

  [*(id *)(a1 + 32) wrappedInstance];
  eciSynthesize2();
  objc_sync_exit(v2);

  [*(id *)(a1 + 32) wrappedInstance];
  eciSynchronize2();
  id v12 = *(id *)(a1 + 32);
  objc_sync_enter(v12);
  if ([*(id *)(a1 + 32) synthState] == 1) {
    [*(id *)(a1 + 32) setSynthState:3];
  }
  uint64_t v13 = [*(id *)(a1 + 32) producedBuffers];
  [v13 broadcast];

  uint64_t v14 = [*(id *)(a1 + 32) consumedBuffers];
  [v14 broadcast];

  objc_sync_exit(v12);
}

- (id)nextBuffer
{
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy_;
  long long v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  AX_PERFORM_WITH_LOCK();
  id v3 = (void *)v15[5];
  if (v3)
  {
    id v4 = v3;
LABEL_3:
    uint64_t v5 = v4;
    goto LABEL_7;
  }
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(AXKonaSpeechEngine *)v6 synthState];
  objc_sync_exit(v6);

  if (v7 == 1)
  {
    uint64_t v8 = [(AXKonaSpeechEngine *)v6 producedBuffers];
    [v8 wait];

    uint64_t v9 = v6;
    objc_sync_enter(v9);
    uint64_t v10 = [(AXKonaSpeechEngine *)v9 synthState];
    objc_sync_exit(v9);

    if (v10 != 2)
    {
      id v4 = [(AXKonaSpeechEngine *)v9 nextBuffer];
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
LABEL_7:
  _Block_object_dispose(&v14, 8);

  return v5;
}

void __32__AXKonaSpeechEngine_nextBuffer__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) queuedBuffers];
  uint64_t v2 = [v6 count];

  if (v2)
  {
    id v7 = [*(id *)(a1 + 32) queuedBuffers];
    uint64_t v3 = [v7 firstObject];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v8 = [*(id *)(a1 + 32) queuedBuffers];
    [v8 removeObjectAtIndex:0];

    id v9 = [*(id *)(a1 + 32) consumedBuffers];
    [v9 signal];
  }
}

- (void)_enqueueBuffer:(id)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v4 = a3;
  AX_PERFORM_WITH_LOCK();
  if (!*((unsigned char *)v9 + 24))
  {
    uint64_t v5 = [(AXKonaSpeechEngine *)self consumedBuffers];
    [v5 wait];

    id v6 = self;
    objc_sync_enter(v6);
    uint64_t v7 = [(AXKonaSpeechEngine *)v6 synthState];
    objc_sync_exit(v6);

    if (v7 != 2) {
      [(AXKonaSpeechEngine *)v6 _enqueueBuffer:v4];
    }
  }

  _Block_object_dispose(&v8, 8);
}

void __37__AXKonaSpeechEngine__enqueueBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queuedBuffers];
  unint64_t v3 = [v2 count];

  if (v3 <= 0x18)
  {
    id v4 = [*(id *)(a1 + 32) queuedBuffers];
    [v4 addObject:*(void *)(a1 + 40)];

    uint64_t v5 = [*(id *)(a1 + 32) producedBuffers];
    [v5 signal];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)cancelSynthesis
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(AXKonaSpeechEngine *)v2 ruleSetRunner];
  [v3 cancelProcessing];

  [(AXKonaSpeechEngine *)v2 _cancelSynthesis];
  objc_sync_exit(v2);

  id v4 = [(AXKonaSpeechEngine *)v2 synthesizerSyncQueue];
  dispatch_sync(v4, &__block_literal_global);
}

- (void)_cancelSynthesis
{
  AX_PERFORM_WITH_LOCK();
  [(AXKonaSpeechEngine *)self setSynthState:2];
  unint64_t v3 = [(AXKonaSpeechEngine *)self producedBuffers];
  [v3 broadcast];

  id v4 = [(AXKonaSpeechEngine *)self consumedBuffers];
  [v4 broadcast];

  [(AXKonaSpeechEngine *)self setCurrentSpeechString:0];
}

void __38__AXKonaSpeechEngine__cancelSynthesis__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(*(id *)(a1 + 32), "setQueuedBuffers:");
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_currentParameters, a3);
  [(AXKonaSpeechEngine *)self wrappedInstance];
  id v4 = [(AXKonaSpeechEngine *)self currentParameters];
  [v4 headSize];
  eciSetParam2();

  [(AXKonaSpeechEngine *)self wrappedInstance];
  id v5 = [(AXKonaSpeechEngine *)self currentParameters];
  [v5 vocalTract];
  eciSetParam2();

  [(AXKonaSpeechEngine *)self wrappedInstance];
  id v6 = [(AXKonaSpeechEngine *)self currentParameters];
  [v6 pitchBase];
  eciSetParam2();

  [(AXKonaSpeechEngine *)self wrappedInstance];
  id v7 = [(AXKonaSpeechEngine *)self currentParameters];
  [v7 pitchFluctuation];
  eciSetParam2();

  [(AXKonaSpeechEngine *)self wrappedInstance];
  id v8 = [(AXKonaSpeechEngine *)self currentParameters];
  [v8 roughness];
  eciSetParam2();

  [(AXKonaSpeechEngine *)self wrappedInstance];
  id v9 = [(AXKonaSpeechEngine *)self currentParameters];
  [v9 breathiness];
  eciSetParam2();

  [(AXKonaSpeechEngine *)self wrappedInstance];
  id v10 = [(AXKonaSpeechEngine *)self currentParameters];
  [v10 speed];
  eciSetParam2();

  [(AXKonaSpeechEngine *)self wrappedInstance];
  id v11 = [(AXKonaSpeechEngine *)self currentParameters];
  [v11 volume];
  eciSetParam2();
}

- (AXKonaParameters)parameters
{
  currentParameters = self->_currentParameters;
  if (currentParameters)
  {
    unint64_t v3 = currentParameters;
  }
  else
  {
    id v4 = [(AXKonaSpeechEngine *)self currentVoice];
    unint64_t v3 = [v4 parameters];
  }
  return v3;
}

- (void)setVoice:(id)a3
{
  id v8 = a3;
  id v4 = [(AXKonaSpeechEngine *)self currentVoice];
  id v5 = [v4 identifier];
  id v6 = [v8 identifier];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    [(AXKonaSpeechEngine *)self cancelSynthesis];
    if ([(AXKonaSpeechEngine *)self currentDictionary])
    {
      [(AXKonaSpeechEngine *)self wrappedInstance];
      [(AXKonaSpeechEngine *)self currentDictionary];
      eciDeleteDict2();
      [(AXKonaSpeechEngine *)self setCurrentDictionary:0];
    }
    [(AXKonaSpeechEngine *)self wrappedInstance];
    eciDelete2();
    [(AXKonaSpeechEngine *)self _initializeWrappedEngineForVoice:v8];
    [(AXKonaSpeechEngine *)self setCurrentVoice:v8];
    [(AXKonaSpeechEngine *)self setCurrentParameters:0];
  }
}

- (void)_loadDictionaryForVoice:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = [v4 languageCode];
  char v7 = [v5 pathForResource:v6 ofType:0 inDirectory:@"Dictionaries"];

  if (v7)
  {
    id v8 = [v7 stringByAppendingPathComponent:@"community"];
    id v9 = [v7 stringByAppendingPathComponent:@"system"];
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v11 = [v10 fileExistsAtPath:v8];

    if (!v11
      || (BOOL v12 = [(AXKonaSpeechEngine *)self preferCommunityDictionary], v13 = v8, !v12))
    {
      uint64_t v13 = v9;
    }
    uint64_t v14 = v13;

    long long v15 = [v4 languageCode];
    uint64_t v16 = [&unk_1F2EB44A0 objectForKeyedSubscript:v15];
    [v16 intValue];

    [(AXKonaSpeechEngine *)self wrappedInstance];
    if (eciNewDict2())
    {
      long long v17 = AXTTSLogKona();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        long long v18 = [v4 languageCode];
        [(AXKonaSpeechEngine *)v18 _loadDictionaryForVoice:v17];
      }
    }
    else
    {
      long long v17 = [v14 stringByAppendingPathComponent:@"root.kdict"];
      [(AXKonaSpeechEngine *)self _loadDictionaryAtPath:v17 type:1 handle:0];
      uint64_t v21 = [v14 stringByAppendingPathComponent:@"abbrv.kdict"];
      [(AXKonaSpeechEngine *)self _loadDictionaryAtPath:v21 type:2 handle:0];
      uint64_t v22 = [v14 stringByAppendingPathComponent:@"main.kdict"];
      [(AXKonaSpeechEngine *)self _loadDictionaryAtPath:v22 type:0 handle:0];
      [(AXKonaSpeechEngine *)self wrappedInstance];
      if (eciActivateDict2())
      {
        v23 = AXTTSLogKona();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = [(AXKonaSpeechEngine *)self currentVoice];
          v25 = [v24 languageCode];
          -[AXKonaSpeechEngine _loadDictionaryForVoice:](v25, (uint64_t)v26, v23, v24);
        }
      }
      [(AXKonaSpeechEngine *)self setCurrentDictionary:0];
    }
  }
  else
  {
    uint64_t v14 = AXTTSLogKona();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(AXKonaSpeechEngine *)v14 _loadDictionaryForVoice:v20];
    }
  }
}

- (BOOL)_loadDictionaryAtPath:(id)a3 type:(int64_t)a4 handle:(void *)a5
{
  id v6 = a3;
  char v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {
    [v6 cStringUsingEncoding:5];
    [(AXKonaSpeechEngine *)self wrappedInstance];
    if (!eciLoadDictVolume2())
    {
      BOOL v10 = 1;
      goto LABEL_7;
    }
    id v9 = AXTTSLogKona();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AXKonaSpeechEngine _loadDictionaryAtPath:type:handle:]();
    }
  }
  BOOL v10 = 0;
LABEL_7:

  return v10;
}

- (void)setOverrideVoicingGain:(id)a3
{
  id v8 = a3;
  [(NSNumber *)self->_overrideVoicingGain floatValue];
  float v6 = v5;
  [v8 floatValue];
  if (v6 != v7)
  {
    objc_storeStrong((id *)&self->_overrideVoicingGain, a3);
    [(AXKonaSpeechEngine *)self _resetEnginePreservingParams];
  }
}

- (void)setOverrideFricationGain:(id)a3
{
  id v8 = a3;
  [(NSNumber *)self->_overrideFricationGain floatValue];
  float v6 = v5;
  [v8 floatValue];
  if (v6 != v7)
  {
    objc_storeStrong((id *)&self->_overrideFricationGain, a3);
    [(AXKonaSpeechEngine *)self _resetEnginePreservingParams];
  }
}

- (void)setOverrideAspirationGain:(id)a3
{
  id v8 = a3;
  [(NSNumber *)self->_overrideAspirationGain floatValue];
  float v6 = v5;
  [v8 floatValue];
  if (v6 != v7)
  {
    objc_storeStrong((id *)&self->_overrideAspirationGain, a3);
    [(AXKonaSpeechEngine *)self _resetEnginePreservingParams];
  }
}

- (void)setOverrideOverallGain:(id)a3
{
  id v8 = a3;
  [(NSNumber *)self->_overrideOverallGain floatValue];
  float v6 = v5;
  [v8 floatValue];
  if (v6 != v7)
  {
    objc_storeStrong((id *)&self->_overrideOverallGain, a3);
    [(AXKonaSpeechEngine *)self _resetEnginePreservingParams];
  }
}

- (void)klattDynamicHook:(KlattFrame *)a3
{
  v155[62] = *MEMORY[0x1E4F143B8];
  v154[0] = @"ui";
  *(float *)&double v3 = a3->var0;
  v152 = [MEMORY[0x1E4F28ED0] numberWithFloat:v3];
  v155[0] = v152;
  v154[1] = @"f0";
  *(float *)&double v5 = a3->var1;
  v150 = [MEMORY[0x1E4F28ED0] numberWithFloat:v5];
  v155[1] = v150;
  v154[2] = @"av";
  *(float *)&double v6 = a3->var2;
  v149 = [MEMORY[0x1E4F28ED0] numberWithFloat:v6];
  v155[2] = v149;
  v154[3] = @"oq";
  *(float *)&double v7 = a3->var3;
  v148 = [MEMORY[0x1E4F28ED0] numberWithFloat:v7];
  v155[3] = v148;
  v154[4] = @"tl";
  *(float *)&double v8 = a3->var4;
  v147 = [MEMORY[0x1E4F28ED0] numberWithFloat:v8];
  v155[4] = v147;
  v154[5] = @"fl";
  *(float *)&double v9 = a3->var5;
  v146 = [MEMORY[0x1E4F28ED0] numberWithFloat:v9];
  v155[5] = v146;
  v154[6] = @"di";
  *(float *)&double v10 = a3->var6;
  v145 = [MEMORY[0x1E4F28ED0] numberWithFloat:v10];
  v155[6] = v145;
  v154[7] = @"ah";
  *(float *)&double v11 = a3->var7;
  v144 = [MEMORY[0x1E4F28ED0] numberWithFloat:v11];
  v155[7] = v144;
  v154[8] = @"af";
  *(float *)&double v12 = a3->var8;
  v143 = [MEMORY[0x1E4F28ED0] numberWithFloat:v12];
  v155[8] = v143;
  v154[9] = @"f1";
  *(float *)&double v13 = a3->var9;
  v142 = [MEMORY[0x1E4F28ED0] numberWithFloat:v13];
  v155[9] = v142;
  v154[10] = @"b1";
  *(float *)&double v14 = a3->var10;
  v141 = [MEMORY[0x1E4F28ED0] numberWithFloat:v14];
  v155[10] = v141;
  v154[11] = @"df1";
  *(float *)&double v15 = a3->var11;
  v140 = [MEMORY[0x1E4F28ED0] numberWithFloat:v15];
  v155[11] = v140;
  v154[12] = @"db1";
  *(float *)&double v16 = a3->var12;
  v139 = [MEMORY[0x1E4F28ED0] numberWithFloat:v16];
  v155[12] = v139;
  v154[13] = @"f2";
  *(float *)&double v17 = a3->var13;
  v138 = [MEMORY[0x1E4F28ED0] numberWithFloat:v17];
  v155[13] = v138;
  v154[14] = @"b2";
  *(float *)&double v18 = a3->var14;
  v137 = [MEMORY[0x1E4F28ED0] numberWithFloat:v18];
  v155[14] = v137;
  v154[15] = @"f3";
  *(float *)&double v19 = a3->var15;
  v136 = [MEMORY[0x1E4F28ED0] numberWithFloat:v19];
  v155[15] = v136;
  v154[16] = @"b3";
  *(float *)&double v20 = a3->var16;
  v135 = [MEMORY[0x1E4F28ED0] numberWithFloat:v20];
  v155[16] = v135;
  v154[17] = @"f4";
  *(float *)&double v21 = a3->var17;
  v134 = [MEMORY[0x1E4F28ED0] numberWithFloat:v21];
  v155[17] = v134;
  v154[18] = @"b4";
  *(float *)&double v22 = a3->var18;
  v133 = [MEMORY[0x1E4F28ED0] numberWithFloat:v22];
  v155[18] = v133;
  v154[19] = @"f5";
  *(float *)&double v23 = a3->var19;
  v132 = [MEMORY[0x1E4F28ED0] numberWithFloat:v23];
  v155[19] = v132;
  v154[20] = @"b5";
  *(float *)&double v24 = a3->var20;
  v131 = [MEMORY[0x1E4F28ED0] numberWithFloat:v24];
  v155[20] = v131;
  v154[21] = @"f6";
  *(float *)&double v25 = a3->var21;
  v130 = [MEMORY[0x1E4F28ED0] numberWithFloat:v25];
  v155[21] = v130;
  v154[22] = @"b6";
  *(float *)&double v26 = a3->var22;
  v129 = [MEMORY[0x1E4F28ED0] numberWithFloat:v26];
  v155[22] = v129;
  v154[23] = @"f7";
  *(float *)&double v27 = a3->var23;
  v128 = [MEMORY[0x1E4F28ED0] numberWithFloat:v27];
  v155[23] = v128;
  v154[24] = @"b7";
  *(float *)&double v28 = a3->var24;
  v127 = [MEMORY[0x1E4F28ED0] numberWithFloat:v28];
  v155[24] = v127;
  v154[25] = @"f8";
  *(float *)&double v29 = a3->var25;
  v126 = [MEMORY[0x1E4F28ED0] numberWithFloat:v29];
  v155[25] = v126;
  v154[26] = @"b8";
  *(float *)&double v30 = a3->var26;
  v125 = [MEMORY[0x1E4F28ED0] numberWithFloat:v30];
  v155[26] = v125;
  v154[27] = @"fnp";
  *(float *)&double v31 = a3->var27;
  v124 = [MEMORY[0x1E4F28ED0] numberWithFloat:v31];
  v155[27] = v124;
  v154[28] = @"bnp";
  *(float *)&double v32 = a3->var28;
  v123 = [MEMORY[0x1E4F28ED0] numberWithFloat:v32];
  v155[28] = v123;
  v154[29] = @"fnz";
  *(float *)&double v33 = a3->var29;
  v122 = [MEMORY[0x1E4F28ED0] numberWithFloat:v33];
  v155[29] = v122;
  v154[30] = @"bnz";
  *(float *)&double v34 = a3->var30;
  v121 = [MEMORY[0x1E4F28ED0] numberWithFloat:v34];
  v155[30] = v121;
  v154[31] = @"ftp";
  *(float *)&double v35 = a3->var31;
  v120 = [MEMORY[0x1E4F28ED0] numberWithFloat:v35];
  v155[31] = v120;
  v154[32] = @"btp";
  *(float *)&double v36 = a3->var32;
  v119 = [MEMORY[0x1E4F28ED0] numberWithFloat:v36];
  v155[32] = v119;
  v154[33] = @"ftz";
  *(float *)&double v37 = a3->var33;
  v118 = [MEMORY[0x1E4F28ED0] numberWithFloat:v37];
  v155[33] = v118;
  v154[34] = @"btz";
  *(float *)&double v38 = a3->var34;
  v117 = [MEMORY[0x1E4F28ED0] numberWithFloat:v38];
  v155[34] = v117;
  v154[35] = @"a1f";
  *(float *)&double v39 = a3->var35;
  v116 = [MEMORY[0x1E4F28ED0] numberWithFloat:v39];
  v155[35] = v116;
  v154[36] = @"a2f";
  *(float *)&double v40 = a3->var36;
  v115 = [MEMORY[0x1E4F28ED0] numberWithFloat:v40];
  v155[36] = v115;
  v154[37] = @"a3f";
  *(float *)&double v41 = a3->var37;
  v114 = [MEMORY[0x1E4F28ED0] numberWithFloat:v41];
  v155[37] = v114;
  v154[38] = @"a4f";
  *(float *)&double v42 = a3->var38;
  v113 = [MEMORY[0x1E4F28ED0] numberWithFloat:v42];
  v155[38] = v113;
  v154[39] = @"a5f";
  *(float *)&double v43 = a3->var39;
  v112 = [MEMORY[0x1E4F28ED0] numberWithFloat:v43];
  v155[39] = v112;
  v154[40] = @"a6f";
  *(float *)&double v44 = a3->var40;
  v111 = [MEMORY[0x1E4F28ED0] numberWithFloat:v44];
  v155[40] = v111;
  v154[41] = @"a7f";
  *(float *)&double v45 = a3->var41;
  v110 = [MEMORY[0x1E4F28ED0] numberWithFloat:v45];
  v155[41] = v110;
  v154[42] = @"a8f";
  *(float *)&double v46 = a3->var42;
  v109 = [MEMORY[0x1E4F28ED0] numberWithFloat:v46];
  v155[42] = v109;
  v154[43] = @"ab";
  *(float *)&double v47 = a3->var43;
  v108 = [MEMORY[0x1E4F28ED0] numberWithFloat:v47];
  v155[43] = v108;
  v154[44] = @"b1f";
  *(float *)&double v48 = a3->var44;
  v107 = [MEMORY[0x1E4F28ED0] numberWithFloat:v48];
  v155[44] = v107;
  v154[45] = @"b2f";
  *(float *)&double v49 = a3->var45;
  v106 = [MEMORY[0x1E4F28ED0] numberWithFloat:v49];
  v155[45] = v106;
  v154[46] = @"b3f";
  *(float *)&double v50 = a3->var46;
  v105 = [MEMORY[0x1E4F28ED0] numberWithFloat:v50];
  v155[46] = v105;
  v154[47] = @"b4f";
  *(float *)&double v51 = a3->var47;
  v104 = [MEMORY[0x1E4F28ED0] numberWithFloat:v51];
  v155[47] = v104;
  v154[48] = @"b5f";
  *(float *)&double v52 = a3->var48;
  v103 = [MEMORY[0x1E4F28ED0] numberWithFloat:v52];
  v155[48] = v103;
  v154[49] = @"b6f";
  *(float *)&double v53 = a3->var49;
  v102 = [MEMORY[0x1E4F28ED0] numberWithFloat:v53];
  v155[49] = v102;
  v154[50] = @"b7f";
  *(float *)&double v54 = a3->var50;
  v101 = [MEMORY[0x1E4F28ED0] numberWithFloat:v54];
  v155[50] = v101;
  v154[51] = @"b8f";
  *(float *)&double v55 = a3->var51;
  v100 = [MEMORY[0x1E4F28ED0] numberWithFloat:v55];
  v155[51] = v100;
  v154[52] = @"anv";
  *(float *)&double v56 = a3->var52;
  v99 = [MEMORY[0x1E4F28ED0] numberWithFloat:v56];
  v155[52] = v99;
  v154[53] = @"a1v";
  *(float *)&double v57 = a3->var53;
  v58 = [MEMORY[0x1E4F28ED0] numberWithFloat:v57];
  v155[53] = v58;
  v154[54] = @"a2v";
  *(float *)&double v59 = a3->var54;
  v60 = [MEMORY[0x1E4F28ED0] numberWithFloat:v59];
  v155[54] = v60;
  v154[55] = @"a3v";
  *(float *)&double v61 = a3->var55;
  id v62 = [MEMORY[0x1E4F28ED0] numberWithFloat:v61];
  v155[55] = v62;
  v154[56] = @"a4v";
  *(float *)&double v63 = a3->var56;
  v64 = [MEMORY[0x1E4F28ED0] numberWithFloat:v63];
  v155[56] = v64;
  v154[57] = @"a5v";
  *(float *)&double v65 = a3->var57;
  uint64_t v66 = [MEMORY[0x1E4F28ED0] numberWithFloat:v65];
  v155[57] = v66;
  v154[58] = @"a6v";
  *(float *)&double v67 = a3->var58;
  v68 = [MEMORY[0x1E4F28ED0] numberWithFloat:v67];
  v155[58] = v68;
  v154[59] = @"a7v";
  *(float *)&double v69 = a3->var59;
  uint64_t v70 = [MEMORY[0x1E4F28ED0] numberWithFloat:v69];
  v155[59] = v70;
  v154[60] = @"a8v";
  *(float *)&double v71 = a3->var60;
  v72 = [MEMORY[0x1E4F28ED0] numberWithFloat:v71];
  v155[60] = v72;
  v154[61] = @"atv";
  *(float *)&double v73 = a3->var61;
  v74 = [MEMORY[0x1E4F28ED0] numberWithFloat:v73];
  v155[61] = v74;
  v151 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v155 forKeys:v154 count:62];

  v75 = [(AXKonaSpeechEngine *)self highFormantBandwidthScalingFactor];
  LOBYTE(v70) = v75 == 0;

  if ((v70 & 1) == 0)
  {
    float var22 = a3->var22;
    v77 = [(AXKonaSpeechEngine *)self highFormantBandwidthScalingFactor];
    [v77 floatValue];
    a3->float var22 = var22 * v78;

    float var24 = a3->var24;
    v80 = [(AXKonaSpeechEngine *)self highFormantBandwidthScalingFactor];
    [v80 floatValue];
    a3->float var22 = var24 * v81;

    float var26 = a3->var26;
    v83 = [(AXKonaSpeechEngine *)self highFormantBandwidthScalingFactor];
    [v83 floatValue];
    a3->float var22 = var26 * v84;
  }
  v85 = [(AXKonaSpeechEngine *)self highFormantFrequencyScalingFactor];
  BOOL v86 = v85 == 0;

  if (!v86)
  {
    float var21 = a3->var21;
    v88 = [(AXKonaSpeechEngine *)self highFormantFrequencyScalingFactor];
    [v88 floatValue];
    a3->float var21 = var21 * v89;

    float var23 = a3->var23;
    v91 = [(AXKonaSpeechEngine *)self highFormantFrequencyScalingFactor];
    [v91 floatValue];
    a3->float var21 = var23 * v92;

    float var25 = a3->var25;
    v94 = [(AXKonaSpeechEngine *)self highFormantFrequencyScalingFactor];
    [v94 floatValue];
    a3->float var21 = var25 * v95;
  }
  v96 = [(AXKonaSpeechEngine *)self dynamicLoggingBlock];
  BOOL v97 = v96 == 0;

  if (!v97)
  {
    v98 = [(AXKonaSpeechEngine *)self dynamicLoggingBlock];
    ((void (**)(void, void *))v98)[2](v98, v151);
  }
}

- (void)klattConstantHook:(id *)a3
{
  double v5 = [(AXKonaSpeechEngine *)self overrideFricationGain];

  if (v5)
  {
    id v13 = [(AXKonaSpeechEngine *)self overrideFricationGain];
    [v13 floatValue];
    a3->var10 = v6;
  }
  double v7 = [(AXKonaSpeechEngine *)self overrideAspirationGain];

  if (v7)
  {
    id v14 = [(AXKonaSpeechEngine *)self overrideAspirationGain];
    [v14 floatValue];
    a3->var9 = v8;
  }
  double v9 = [(AXKonaSpeechEngine *)self overrideVoicingGain];

  if (v9)
  {
    id v15 = [(AXKonaSpeechEngine *)self overrideVoicingGain];
    [v15 floatValue];
    a3->var8 = v10;
  }
  double v11 = [(AXKonaSpeechEngine *)self overrideOverallGain];

  if (v11)
  {
    id v16 = [(AXKonaSpeechEngine *)self overrideOverallGain];
    [v16 floatValue];
    a3->var11 = v12;
  }
}

- (int64_t)eciCallback:(int64_t)a3 iParam:(int64_t)a4 instanceData:(void *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if ([(AXKonaSpeechEngine *)self synthState] != 2)
  {
    if (a3 == 1)
    {
      double v17 = [(AXKonaSpeechEngine *)self engineFormat];
      [v17 sampleRate];
      double v19 = v18;

      double v20 = [(AXKonaSpeechEngine *)self outputFormat];
      [v20 sampleRate];
      double v22 = v21;

      v57[0] = 1;
      v57[2] = 1;
      v57[3] = a4;
      pSampleBuffer = self->_pSampleBuffer;
      id v23 = objc_alloc(MEMORY[0x1E4F153B0]);
      double v24 = [(AXKonaSpeechEngine *)self engineFormat];
      double v46 = (void *)[v23 initWithPCMFormat:v24 bufferListNoCopy:v57 deallocator:0];

      id v25 = objc_alloc(MEMORY[0x1E4F153B0]);
      double v26 = [(AXKonaSpeechEngine *)self outputFormat];
      LODWORD(v27) = vcvtpd_u64_f64((double)(a4 >> 1) / (v19 / v22));
      double v28 = (void *)[v25 initWithPCMFormat:v26 frameCapacity:v27];

      v55[0] = 0;
      v55[1] = v55;
      v55[2] = 0x2020000000;
      char v56 = 0;
      double v29 = [(AXKonaSpeechEngine *)self bufferConverter];
      double v53 = v55;
      id v54 = 0;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __54__AXKonaSpeechEngine_eciCallback_iParam_instanceData___block_invoke;
      v51[3] = &unk_1E6A6FF38;
      id v30 = v46;
      id v52 = v30;
      [v29 convertToBuffer:v28 error:&v54 withInputFromBlock:v51];
      id v45 = v54;

      -[AXKonaSpeechEngine setCurrentFrameCount:](self, "setCurrentFrameCount:", -[AXKonaSpeechEngine currentFrameCount](self, "currentFrameCount")+ [v28 frameLength]);
      double v31 = objc_alloc_init(AXKonaBuffer);
      [(AXKonaBuffer *)v31 setBuffer:v28];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      double v32 = [(AXKonaSpeechEngine *)self currentMarkers];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v47 objects:v59 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v48;
        do
        {
          uint64_t v35 = 0;
          do
          {
            if (*(void *)v48 != v34) {
              objc_enumerationMutation(v32);
            }
            double v36 = *(void **)(*((void *)&v47 + 1) + 8 * v35);
            double v37 = [(AXKonaSpeechEngine *)self currentSpeechString];
            uint64_t v38 = [v36 originalStringRange];
            uint64_t v40 = objc_msgSend(v37, "translateRangeInTransformedString:", v38, v39);
            objc_msgSend(v36, "setOriginalStringRange:", v40, v41);

            ++v35;
          }
          while (v33 != v35);
          uint64_t v33 = [v32 countByEnumeratingWithState:&v47 objects:v59 count:16];
        }
        while (v33);
      }

      double v42 = [(AXKonaSpeechEngine *)self currentMarkers];
      [(AXKonaBuffer *)v31 setMarkers:v42];

      [(AXKonaSpeechEngine *)self _enqueueBuffer:v31];
      double v43 = [MEMORY[0x1E4F1CA48] array];
      [(AXKonaSpeechEngine *)self setCurrentMarkers:v43];

      _Block_object_dispose(v55, 8);
    }
    else if (!a3)
    {
      float v8 = [(AXKonaSpeechEngine *)self currentSpeechSegments];
      unint64_t v9 = [v8 count];

      if (v9 > a4)
      {
        float v10 = [(AXKonaSpeechEngine *)self currentSpeechSegments];
        double v11 = [v10 objectAtIndex:a4];

        float v12 = [v11 marker];

        if (v12)
        {
          uint64_t v13 = [(AXKonaSpeechEngine *)self currentFrameCount];
          id v14 = [v11 marker];
          [v14 setFramePosition:v13];

          id v15 = [(AXKonaSpeechEngine *)self currentMarkers];
          id v16 = [v11 marker];
          [v15 addObject:v16];
        }
      }
    }
  }
  return 0;
}

id __54__AXKonaSpeechEngine_eciCallback_iParam_instanceData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    id v4 = 0;
    *a3 = 1;
  }
  else
  {
    *(unsigned char *)(v3 + 24) = 1;
    *a3 = 0;
    id v4 = *(id *)(a1 + 32);
  }
  return v4;
}

+ (id)allVoices
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 pathForResource:@"KonaVoicePresets" ofType:@"plist"];

  uint64_t v40 = (void *)v4;
  [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v4];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v43 != v6) {
          objc_enumerationMutation(obj);
        }
        float v8 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        unint64_t v9 = objc_alloc_init(AXKonaVoice);
        float v10 = [v8 objectForKey:@"name"];
        [(AXKonaVoice *)v9 setName:v10];

        double v11 = [v8 objectForKey:@"languageCode"];
        [(AXKonaVoice *)v9 setLanguageCode:v11];

        float v12 = [v8 objectForKey:@"konaDialect"];
        -[AXKonaVoice setKonaLanguage:](v9, "setKonaLanguage:", [v12 unsignedIntValue]);

        uint64_t v13 = objc_alloc_init(AXKonaParameters);
        [(AXKonaVoice *)v9 setParameters:v13];

        id v14 = [v8 objectForKey:@"vocalTract"];
        int v15 = [v14 intValue];
        id v16 = [(AXKonaVoice *)v9 parameters];
        [v16 setVocalTract:v15];

        double v17 = [v8 objectForKey:@"headSize"];
        int v18 = [v17 intValue];
        double v19 = [(AXKonaVoice *)v9 parameters];
        [v19 setHeadSize:v18];

        double v20 = [v8 objectForKey:@"pitchBase"];
        int v21 = [v20 intValue];
        double v22 = [(AXKonaVoice *)v9 parameters];
        [v22 setPitchBase:v21];

        id v23 = [v8 objectForKey:@"pitchFluctuation"];
        int v24 = [v23 intValue];
        id v25 = [(AXKonaVoice *)v9 parameters];
        [v25 setPitchFluctuation:v24];

        double v26 = [v8 objectForKey:@"breathiness"];
        int v27 = [v26 intValue];
        double v28 = [(AXKonaVoice *)v9 parameters];
        [v28 setBreathiness:v27];

        double v29 = [v8 objectForKey:@"roughness"];
        int v30 = [v29 intValue];
        double v31 = [(AXKonaVoice *)v9 parameters];
        [v31 setRoughness:v30];

        double v32 = [v8 objectForKey:@"volume"];
        int v33 = [v32 intValue];
        uint64_t v34 = [(AXKonaVoice *)v9 parameters];
        [v34 setVolume:v33];

        uint64_t v35 = [v8 objectForKey:@"speed"];
        int v36 = [v35 intValue];
        double v37 = [(AXKonaVoice *)v9 parameters];
        [v37 setSpeed:v36];

        uint64_t v38 = [v8 objectForKey:@"eciVoiceNumber"];
        -[AXKonaVoice setEciVoiceNumber:](v9, "setEciVoiceNumber:", (int)[v38 intValue]);

        [v2 addObject:v9];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)dynamicLoggingBlock
{
  return self->_dynamicLoggingBlock;
}

- (void)setDynamicLoggingBlock:(id)a3
{
}

- (BOOL)highQualityMode
{
  return self->_highQualityMode;
}

- (BOOL)abbreviationDictionary
{
  return self->_abbreviationDictionary;
}

- (BOOL)phrasePrediction
{
  return self->_phrasePrediction;
}

- (BOOL)preferCommunityDictionary
{
  return self->_preferCommunityDictionary;
}

- (NSNumber)overrideFricationGain
{
  return self->_overrideFricationGain;
}

- (NSNumber)overrideAspirationGain
{
  return self->_overrideAspirationGain;
}

- (NSNumber)overrideVoicingGain
{
  return self->_overrideVoicingGain;
}

- (NSNumber)overrideOverallGain
{
  return self->_overrideOverallGain;
}

- (NSNumber)highFormantBandwidthScalingFactor
{
  return self->_highFormantBandwidthScalingFactor;
}

- (void)setHighFormantBandwidthScalingFactor:(id)a3
{
}

- (NSNumber)highFormantFrequencyScalingFactor
{
  return self->_highFormantFrequencyScalingFactor;
}

- (void)setHighFormantFrequencyScalingFactor:(id)a3
{
}

- (TTSRulesetRunner)ruleSetRunner
{
  return self->_ruleSetRunner;
}

- (void)setRuleSetRunner:(id)a3
{
}

- (void)wrappedInstance
{
  return self->_wrappedInstance;
}

- (void)setWrappedInstance:(void *)a3
{
  self->_wrappedInstance = a3;
}

- (void)currentDictionary
{
  return self->_currentDictionary;
}

- (void)setCurrentDictionary:(void *)a3
{
  self->_currentDictionary = a3;
}

- (OS_dispatch_queue)synthesizerSyncQueue
{
  return self->_synthesizerSyncQueue;
}

- (void)setSynthesizerSyncQueue:(id)a3
{
}

- (AXKonaVoice)currentVoice
{
  return self->_currentVoice;
}

- (void)setCurrentVoice:(id)a3
{
}

- (AXKonaConfiguration)currentConfiguration
{
  return self->_currentConfiguration;
}

- (void)setCurrentConfiguration:(id)a3
{
}

- (NLTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(id)a3
{
}

- (AXKonaParameters)currentParameters
{
  return self->_currentParameters;
}

- (void)setCurrentParameters:(id)a3
{
}

- (NSDictionary)configurationMap
{
  return self->_configurationMap;
}

- (void)setConfigurationMap:(id)a3
{
}

- (NSArray)currentSpeechSegments
{
  return self->_currentSpeechSegments;
}

- (void)setCurrentSpeechSegments:(id)a3
{
}

- (NSMutableArray)currentMarkers
{
  return self->_currentMarkers;
}

- (void)setCurrentMarkers:(id)a3
{
}

- (unsigned)currentFrameCount
{
  return self->_currentFrameCount;
}

- (void)setCurrentFrameCount:(unsigned int)a3
{
  self->_currentFrameCount = a3;
}

- (AVAudioConverter)bufferConverter
{
  return self->_bufferConverter;
}

- (void)setBufferConverter:(id)a3
{
}

- (float)lastSampVal
{
  return self->_lastSampVal;
}

- (void)setLastSampVal:(float)a3
{
  self->_lastSampVal = a3;
}

- (AVAudioFormat)engineFormat
{
  return self->_engineFormat;
}

- (void)setEngineFormat:(id)a3
{
}

- (AVAudioFormat)outputFormat
{
  return self->_outputFormat;
}

- (void)setOutputFormat:(id)a3
{
}

- (NSRegularExpression)commandRegex
{
  return self->_commandRegex;
}

- (void)setCommandRegex:(id)a3
{
}

- (unint64_t)synthState
{
  return self->_synthState;
}

- (void)setSynthState:(unint64_t)a3
{
  self->_synthState = a3;
}

- (NSMutableArray)queuedBuffers
{
  return self->_queuedBuffers;
}

- (void)setQueuedBuffers:(id)a3
{
}

- (NSCondition)producedBuffers
{
  return self->_producedBuffers;
}

- (void)setProducedBuffers:(id)a3
{
}

- (NSCondition)consumedBuffers
{
  return self->_consumedBuffers;
}

- (void)setConsumedBuffers:(id)a3
{
}

- (TTSSpeechString)currentSpeechString
{
  return self->_currentSpeechString;
}

- (void)setCurrentSpeechString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSpeechString, 0);
  objc_storeStrong((id *)&self->_consumedBuffers, 0);
  objc_storeStrong((id *)&self->_producedBuffers, 0);
  objc_storeStrong((id *)&self->_queuedBuffers, 0);
  objc_storeStrong((id *)&self->_commandRegex, 0);
  objc_storeStrong((id *)&self->_outputFormat, 0);
  objc_storeStrong((id *)&self->_engineFormat, 0);
  objc_storeStrong((id *)&self->_bufferConverter, 0);
  objc_storeStrong((id *)&self->_currentMarkers, 0);
  objc_storeStrong((id *)&self->_currentSpeechSegments, 0);
  objc_storeStrong((id *)&self->_configurationMap, 0);
  objc_storeStrong((id *)&self->_currentParameters, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_currentVoice, 0);
  objc_storeStrong((id *)&self->_synthesizerSyncQueue, 0);
  objc_storeStrong((id *)&self->_ruleSetRunner, 0);
  objc_storeStrong((id *)&self->_highFormantFrequencyScalingFactor, 0);
  objc_storeStrong((id *)&self->_highFormantBandwidthScalingFactor, 0);
  objc_storeStrong((id *)&self->_overrideOverallGain, 0);
  objc_storeStrong((id *)&self->_overrideVoicingGain, 0);
  objc_storeStrong((id *)&self->_overrideAspirationGain, 0);
  objc_storeStrong((id *)&self->_overrideFricationGain, 0);
  objc_storeStrong(&self->_dynamicLoggingBlock, 0);
}

- (void)_segmentsForText:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7223000, v0, v1, "Outgoing segments after crash-word removal: %@", v2, v3, v4, v5, v6);
}

- (void)_segmentsForText:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7223000, v0, v1, "Outgoing segments before crash-word removal: %@", v2, v3, v4, v5, v6);
}

- (void)_segmentsForText:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7223000, v0, v1, "Processing segments for text: %@", v2, v3, v4, v5, v6);
}

- (void)_loadDictionaryForVoice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = 0;
  OUTLINED_FUNCTION_2(&dword_1D7223000, a1, a3, "No resources found at %@", (uint8_t *)&v3);
}

- (void)_loadDictionaryForVoice:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2(&dword_1D7223000, a3, (uint64_t)a3, "Could not activate dictionary for %@", (uint8_t *)a2);
}

- (void)_loadDictionaryForVoice:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2(&dword_1D7223000, a3, (uint64_t)a3, "Could not create dictionary for %@", (uint8_t *)a2);
}

- (void)_loadDictionaryAtPath:type:handle:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1D7223000, v0, v1, "Failed to load dictionaty at %@", v2);
}

@end