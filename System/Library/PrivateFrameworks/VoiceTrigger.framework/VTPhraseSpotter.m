@interface VTPhraseSpotter
+ (id)currentSpotter;
+ (void)initialize;
- (BOOL)_configureWithConfig:(id)a3 resourcePath:(id)a4;
- (BOOL)_configureWithDefaults;
- (BOOL)_getSecondChanceEffective;
- (BOOL)_isDeviceHandheld;
- (BOOL)_shouldCreateAudioBuffer;
- (BOOL)_shouldPerformRetrainingWithAnalyzerNDAPI:(id)a3 resourcePath:(id)a4;
- (NSData)firstChanceAudioBuffer;
- (NSDate)firstChanceTriggeredDate;
- (NSDictionary)firstChanceVTEventInfo;
- (VTPhraseSpotter)init;
- (VTPhraseSpotter)initWithConfig:(id)a3 assetDir:(id)a4 runMode:(unint64_t)a5;
- (VTPhraseSpotter)initWithConfig:(id)a3 resourcePath:(id)a4;
- (VTPhraseSpotter)initWithHardwareSampleRate:(double)a3;
- (VTPhraseSpotter)initWithHardwareSampleRate:(double)a3 readyCompletion:(id)a4;
- (VTPhraseSpotter)initWithLanguageCodeForSATEnrollment:(id)a3;
- (double)_computeSATScore:(const _ndresult *)a3;
- (double)lastScore;
- (double)lastSupervecScore;
- (id)_analyzeEvents:(const _ndresult *)a3;
- (id)_analyzeMakeResult:(const _ndresult *)a3 eventKind:(unsigned __int8)a4 satScore:(double)a5;
- (id)_capturePathWithPrefix:(id)a3 eventKind:(unsigned __int8)a4;
- (id)_createVTEventInfoString:(id)a3;
- (id)_desRecordFromTriggerData:(const _ndresult *)a3 sampleCount:(unint64_t *)a4;
- (id)_handleTriggerEvent:(const _ndresult *)a3 num_new_samples:(unsigned int)a4 satScore:(double)a5;
- (id)_randomSubset:(id)a3 numSelected:(unsigned int)a4;
- (id)_sampleFromSortedArray:(id)a3 numSelected:(unint64_t)a4;
- (id)_storeTrainingAudioAndMetaInfo;
- (id)analyze:(AudioBuffer)a3;
- (id)analyzeBufferList:(AudioBufferList *)a3;
- (id)assetDictionary;
- (id)getAudioBuffer;
- (id)getCorealisRTModel;
- (id)getLanguageCode;
- (id)getSATDirectory;
- (id)lastVoiceTriggerEventInfo;
- (int64_t)_getNumberOfAudioFilesInDirectory:(id)a3;
- (int64_t)isFollowedBySpeech;
- (int64_t)triggerCount;
- (unint64_t)_addExtraTime:(double)a3 to:(unint64_t)a4;
- (unint64_t)_applyExtraTime:(double)a3 to:(unint64_t)a4;
- (unint64_t)_getBiometricMatchResult;
- (unint64_t)_sampleLengthFrom:(unsigned int)a3 To:(unsigned int)a4;
- (unint64_t)getAdjustedDeviceStartTime:(unint64_t)a3;
- (unint64_t)sampleCount;
- (unint64_t)sampleCountAtEndOfTrigger;
- (unint64_t)sampleCountAtStartOfTrigger;
- (unint64_t)samplerate;
- (unsigned)lastTriggerType;
- (void)VTAssetMonitor:(id)a3 didReceiveNewAssetAvailable:(BOOL)a4;
- (void)VTLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)_analyzeResetWithOption:(unsigned __int8)a3;
- (void)_cancelSecondChance;
- (void)_clearDeviceHandHeld;
- (void)_commonInit;
- (void)_createFirstChanceMeta:(const _ndresult *)a3;
- (void)_firstUnlockedAndSpringBoardStarted;
- (void)_handleAssetChangeForLanguageCode:(id)a3;
- (void)_initDetector;
- (void)_logCorruptAudio;
- (void)_logDESRecord:(const _ndresult *)a3 result:(id)a4;
- (void)_logDESRecord:(const _ndresult *)a3 result:(id)a4 isActualTrigger:(BOOL)a5;
- (void)_logDESTriggerRecord:(const _ndresult *)a3 result:(id)a4;
- (void)_logMetaData:(id)a3;
- (void)_logPHSDESRecord:(const _ndsupervec *)a3;
- (void)_logPrepareProperty:(id)a3;
- (void)_notifyAssetChangedCallback;
- (void)_performReadyCompletion;
- (void)_phraseSpotterEnabledDidChange;
- (void)_resetCounters;
- (void)_resetVoiceTriggerDueToRTSTrigger;
- (void)_safeConfigureWithAnalyzer:(id)a3 path:(id)a4 data:(id)a5 resourcePath:(id)a6;
- (void)_safeReconfig;
- (void)_setDeviceHandHeld;
- (void)_setSecondChance;
- (void)_storeFirstChanceAudio;
- (void)_voiceTriggerEnabledDidChange;
- (void)clearTriggerCount;
- (void)dealloc;
- (void)didReceiveSiriSessionCancellation:(id)a3;
- (void)looseTriggerThreshold;
- (void)notifyAssetChangeWithCallback:(id)a3;
- (void)prepareWithProperty:(id)a3 readyCompletion:(id)a4;
- (void)requestFoceTrigger;
- (void)requestSecondChance;
- (void)setBypass:(BOOL)a3;
- (void)startAudioCapture;
- (void)stopAudioCapture;
- (void)textDependentSpeakerRecognizer:(id)a3 failedWithError:(id)a4;
- (void)textDependentSpeakerRecognizer:(id)a3 hasSatScore:(float)a4;
@end

@implementation VTPhraseSpotter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricMonitor, 0);
  objc_storeStrong((id *)&self->_lastVoiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_injectedAudioFilePath, 0);
  objc_storeStrong((id *)&self->_audioFileReader, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_firstChanceTriggeredDate, 0);
  objc_storeStrong((id *)&self->_firstChanceVTEventInfo, 0);
  objc_storeStrong((id *)&self->_firstChanceAudioBuffer, 0);
  objc_storeStrong((id *)&self->_corruptDetector, 0);
  objc_storeStrong((id *)&self->_nonceTriggerEvents, 0);
  objc_storeStrong((id *)&self->_satDetectionTdSrSemaphore, 0);
  objc_storeStrong((id *)&self->_satDetectionTdSr, 0);
  objc_storeStrong((id *)&self->_transcriber, 0);
  objc_storeStrong((id *)&self->_triggerTokens, 0);
  objc_storeStrong((id *)&self->_recognizerConfigName, 0);
  objc_storeStrong((id *)&self->_desQueue, 0);
  objc_storeStrong((id *)&self->siriNotifications, 0);
  objc_storeStrong(&self->_assetChangedCallback, 0);
  objc_storeStrong((id *)&self->_assetChangedQueue, 0);
  objc_storeStrong((id *)&self->_ndetectQueue, 0);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_retrainSamplingPolicy, 0);
  objc_storeStrong((id *)&self->_lastImplicitlyTrainedAudioFile, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_configLanguageCode, 0);
  objc_storeStrong((id *)&self->_configData, 0);
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_audioFileDir, 0);
  objc_storeStrong(&self->_readyForAnalyze, 0);
  objc_storeStrong(&self->_readyCompletion, 0);
  objc_storeStrong((id *)&self->_triggerPhrases, 0);

  objc_storeStrong((id *)&self->_analyzer, 0);
}

- (unint64_t)samplerate
{
  return self->_samplerate;
}

- (NSDate)firstChanceTriggeredDate
{
  return (NSDate *)objc_getProperty(self, a2, 720, 1);
}

- (NSDictionary)firstChanceVTEventInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 712, 1);
}

- (NSData)firstChanceAudioBuffer
{
  return (NSData *)objc_getProperty(self, a2, 704, 1);
}

- (int64_t)triggerCount
{
  return self->_triggerCount;
}

- (unsigned)lastTriggerType
{
  return self->_lastTriggerType;
}

- (double)lastSupervecScore
{
  return self->_lastSupervecScore;
}

- (double)lastScore
{
  return self->_lastScore;
}

- (void)textDependentSpeakerRecognizer:(id)a3 failedWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v6 = (VTTextDependentSpeakerRecognizer *)a3;
  id v7 = a4;
  v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    satDetectionTdSr = self->_satDetectionTdSr;
    int v15 = 138543874;
    *(void *)v16 = v6;
    *(_WORD *)&v16[8] = 2114;
    v17 = satDetectionTdSr;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "TDSR-ERROR:: tdSR: %{public}@, _tdSrForSatDetection:%{public}@, ERROR: %{public}@", (uint8_t *)&v15, 0x20u);
    v8 = VTLogContextFacilityVoiceTrigger;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isRunningSATDetection = self->_isRunningSATDetection;
    BOOL isRunningSATEnrollment = self->_isRunningSATEnrollment;
    int v15 = 67240448;
    *(_DWORD *)v16 = isRunningSATDetection;
    *(_WORD *)&v16[4] = 1026;
    *(_DWORD *)&v16[6] = isRunningSATEnrollment;
    _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "_isRunningSATDetection: %{public}d, _isRunningSATEnrollment: %{public}d", (uint8_t *)&v15, 0xEu);
    v8 = VTLogContextFacilityVoiceTrigger;
  }
  v12 = self->_satDetectionTdSr;
  BOOL v13 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v12 == v6)
  {
    if (v13)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "VTTextDependentSpeakerRecognizer failed with Error during DETECTION", (uint8_t *)&v15, 2u);
    }
    v14 = +[VTAggregator sharedAggregator];
    [v14 logTdPsrFailedDuringSATDetection];
  }
  else if (v13)
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "ERR: VTTextDependentSpeakerRecognizer failed for unmanaged TD-SR instance!!!", (uint8_t *)&v15, 2u);
  }
}

- (void)textDependentSpeakerRecognizer:(id)a3 hasSatScore:(float)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v6 = (VTTextDependentSpeakerRecognizer *)a3;
  id v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2050;
    double v12 = a4;
    _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "textDependentSpeakerRecognizer:hasSatScore: %{public}@: %{public}f, signalling now", (uint8_t *)&v9, 0x16u);
  }
  if (self->_satDetectionTdSr == v6)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_satDetectionTdSrSemaphore);
  }
  else
  {
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "ERR: textDependentSpeakerRecognizer called for unmanaged TD-SR instance: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (id)lastVoiceTriggerEventInfo
{
  return self->_lastVoiceTriggerEventInfo;
}

- (id)assetDictionary
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  resourcePath = self->_resourcePath;
  if (resourcePath && (v4 = self->_configVersion) != 0)
  {
    v9[0] = @"resourcePath";
    v9[1] = @"configVersion";
    v10[0] = resourcePath;
    v10[1] = v4;
    v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  }
  else
  {
    v6 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      configVersion = self->_configVersion;
      *(_DWORD *)buf = 138412546;
      double v12 = resourcePath;
      __int16 v13 = 2112;
      v14 = configVersion;
      _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "VoiceTrigger Asset Not confgiured yet!. _resourcePath=%@, _configVersion=%@", buf, 0x16u);
    }
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldCreateAudioBuffer
{
  return 1;
}

- (void)stopAudioCapture
{
  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__VTPhraseSpotter_stopAudioCapture__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(ndetectQueue, block);
}

void __35__VTPhraseSpotter_stopAudioCapture__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 161) = 0;
  id v1 = +[VTAudioFileLog sharedInstance];
  [v1 stopRecording];
}

- (void)startAudioCapture
{
  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__VTPhraseSpotter_startAudioCapture__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(ndetectQueue, block);
}

void __36__VTPhraseSpotter_startAudioCapture__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 160))
  {
    *(unsigned char *)(v1 + 161) = 1;
    id v2 = +[VTAudioFileLog sharedInstance];
    [v2 startRecording];
  }
}

- (int64_t)isFollowedBySpeech
{
  transcriber = self->_transcriber;
  if (transcriber)
  {
    BOOL v3 = [(VTTranscriber *)transcriber isTriggerFollowedByWords];
    v4 = VTLogContextFacilityVoiceTrigger;
    BOOL v5 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        int64_t v6 = 2;
        _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "isFollowedBySpeech: YES", buf, 2u);
      }
      else
      {
        return 2;
      }
    }
    else
    {
      if (v5)
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "isFollowedBySpeech: NO", v10, 2u);
      }
      return 1;
    }
  }
  else
  {
    id v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "isFollowedBySpeech: Unknown", v9, 2u);
    }
    return 0;
  }
  return v6;
}

- (void)_resetCounters
{
  self->_samplecount = 0;
  *(void *)&self->_samplecountAtLastTriggerStart = 0;
  *(void *)&self->_sampleCountAtFirstChance = 0;
  *(void *)((char *)&self->_lastEventEnd + 1) = 0;
  self->_lastScore = -INFINITY;
  self->_earlyDetectTime = 0.0;
  self->_earlyDetecFiredMachTime = 0;
  self->_heartbeatCounter = 0;
}

- (void)_safeReconfig
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446210;
    __int16 v13 = "-[VTPhraseSpotter _safeReconfig]";
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v12, 0xCu);
  }
  v4 = self->_configPath;
  BOOL v5 = self->_resourcePath;
  if (self->_audioLoggingEnabled
    && ([MEMORY[0x263F08850] defaultManager],
        int64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 fileExistsAtPath:v4],
        v6,
        v7))
  {
    v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v4];
    int v9 = v8;
    if (v8)
    {
      v10 = [v8 MD5HashString];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  __int16 v11 = [[VTAnalyzerNDAPI alloc] initWithConfigPath:v4 resourcePath:v5];
  if (v11) {
    [(VTPhraseSpotter *)self _safeConfigureWithAnalyzer:v11 path:v4 data:v10 resourcePath:v5];
  }
}

- (id)_sampleFromSortedArray:(id)a3 numSelected:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 count] <= a4)
  {
    id v6 = v5;
  }
  else if (a4)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a4];
    unint64_t v7 = [v5 count];
    if ([v5 count])
    {
      unint64_t v8 = 0;
      unint64_t v9 = (unint64_t)((double)v7 / (double)a4);
      unint64_t v10 = 1;
      do
      {
        __int16 v11 = [v5 objectAtIndexedSubscript:v8];
        [v6 addObject:v11];

        v8 += v9;
        if (v8 >= [v5 count]) {
          break;
        }
      }
      while (v10++ < a4);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_randomSubset:(id)a3 numSelected:(unsigned int)a4
{
  id v5 = a3;
  unint64_t v6 = a4;
  if ([v5 count] <= (unint64_t)a4)
  {
    id v9 = v5;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x263EFF980]);
    unint64_t v8 = objc_msgSend(v5, "subarrayWithRange:", 0, a4);
    id v9 = (id)[v7 initWithArray:v8];

    if ([v5 count] > (unint64_t)a4)
    {
      uint32_t v10 = a4 + 1;
      do
      {
        uint32_t v11 = arc4random_uniform(v10);
        if (v11 < a4)
        {
          uint32_t v12 = v11;
          __int16 v13 = [v5 objectAtIndexedSubscript:v6];
          [v9 setObject:v13 atIndexedSubscript:v12];
        }
        unint64_t v6 = v10++;
      }
      while ([v5 count] > v6);
    }
  }

  return v9;
}

- (void)_safeConfigureWithAnalyzer:(id)a3 path:(id)a4 data:(id)a5 resourcePath:(id)a6
{
  uint64_t v152 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  double v130 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:1 forLanguageCode:self->_languageCode];
  [(VTPhraseSpotter *)self _resetCounters];
  self->_samplerate = 16000;
  objc_storeStrong((id *)&self->_resourcePath, a6);
  objc_storeStrong((id *)&self->_configPath, a4);
  objc_storeStrong((id *)&self->_configData, a5);
  uint64_t v15 = (id)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    configVersion = self->_configVersion;
    configData = self->_configData;
    *(_DWORD *)buf = 138543618;
    uint64_t v144 = (uint64_t)configVersion;
    __int16 v145 = 2114;
    double v146 = *(double *)&configData;
    _os_log_impl(&dword_21844F000, v15, OS_LOG_TYPE_DEFAULT, "::: config version: %{public}@; data: %{public}@",
      buf,
      0x16u);
  }

  [v11 getNDAPITriggerThreshold];
  self->_ndapiThreshold = v18;
  [v11 getNDAPISecondChanceThreshold];
  self->_ndapiThresholdSecondChance = v19;
  [v11 getNDAPILoggingThreshold];
  self->_ndapiThresholdLogNearMisses = v20;
  *(_OWORD *)&self->_double threshold = *(_OWORD *)&self->_ndapiThreshold;
  self->_double thresholdLogNearMisses = v20;
  [v11 getCombinedTriggerThreshold];
  self->_combinedThreshold = v21;
  [v11 getCombinedSecondChanceThreshold];
  self->_combinedThresholdSecondChance = v22;
  [v11 getCombinedLoggingThreshold];
  self->_combinedThresholdLogNearMisses = v23;
  [v11 getExtraSamplesAtStart];
  self->_extraSamplesAtStart = v24;
  [v11 getSecondPassTrailingTime];
  self->_secondPassTrailingTime = v25;
  self->_doSuperVectorSecondaryTest = [v11 getDoSupervectorSecondaryTest];
  [v11 getThresholdPresuperVector];
  self->_thresholdPreSuperVector = v26;
  int v27 = [v11 getUseRecognizer];
  self->_useRecognizer = v27;
  if (v27)
  {
    if (+[VTUtilities supportPremiumAssets])
    {
      if (!self->_isRunningSATEnrollment)
      {
        v28 = [v11 getRecognizerConfig];
        recognizerConfigName = self->_recognizerConfigName;
        self->_recognizerConfigName = v28;

        [v11 getRecognizerThresholdOffset];
        self->_recognizerThresholdOffset = v30;
        [v11 getRecognizerWaitTime];
        self->_recognizerWaitTime = v31;
        [v11 getRecognizerScoreScaleFactor];
        self->_recognizerScoreScaleFactor = v32;
        v33 = [v11 getTriggerTokens];
        triggerTokens = self->_triggerTokens;
        self->_triggerTokens = v33;

        self->_useFallbackThresholdUponTimeout = [v11 getUseFallbackThresholdUponTimeout];
        self->_useKeywordSpotting = [v11 getUseKeywordSpotting];
        goto LABEL_12;
      }
    }
    else if (!self->_isRunningSATEnrollment)
    {
      v121 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21844F000, v121, OS_LOG_TYPE_DEFAULT, "Device does not support recognizer config, ignoring...", buf, 2u);
      }
      goto LABEL_11;
    }
    v35 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v35, OS_LOG_TYPE_DEFAULT, "recognizer config ignored during enrollment...", buf, 2u);
    }

LABEL_11:
    self->_useRecognizer = 0;
  }
LABEL_12:
  if (self->_isRunningSATEnrollment)
  {
    self->_BOOL isRunningSATDetection = 0;
    self->_double thresholdSAT = INFINITY;
    id v36 = +[VTSpeakerIdUtilities createSATDirectoriesForType:2 forLanguageCode:self->_languageCode];
    id v37 = +[VTSpeakerIdUtilities createSATDirectoriesForType:1 forLanguageCode:self->_languageCode];
    id v38 = +[VTSpeakerIdUtilities createSATDirectoriesForType:3 forLanguageCode:self->_languageCode];
    BOOL isRunningSATEnrollment = self->_isRunningSATEnrollment;
    if (self->_isRunningSATEnrollment) {
      goto LABEL_21;
    }
  }
  else
  {
    self->_BOOL isRunningSATDetection = [v11 getDoSAT];
    [v11 getThresholdSAT];
    self->_double thresholdSAT = v40;
    unsigned int v41 = [v11 getRetrainNumExplicitUtt];
    self->_retrainNumExplicitUtt = (int)v41;
    if (v41 <= 4)
    {
      v42 = (id)VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v144 = 5;
        _os_log_impl(&dword_21844F000, v42, OS_LOG_TYPE_DEFAULT, "# of explicit utterances must be larger than %{public}lu, overriding...", buf, 0xCu);
      }

      self->_retrainNumExplicitUtt = 5;
    }
    self->_retrainNumImplicitUtt = (int)[v11 getRetrainNumImplicitUtt];
    v43 = [v11 getRetrainSamplingPolicy];
    retrainSamplingPolicy = self->_retrainSamplingPolicy;
    self->_retrainSamplingPolicy = v43;

    [v11 getRetrainThresholdTrigger];
    self->_retrainThresholdTrigger = v45;
    [v11 getRetrainThresholdSAT];
    self->_retrainThresholdSAT = v46;
    BOOL isRunningSATEnrollment = self->_isRunningSATEnrollment;
    if (self->_isRunningSATEnrollment) {
      goto LABEL_21;
    }
  }
  if (!self->_isRunningSATDetection)
  {
    BOOL isRunningSATDetection = 0;
    goto LABEL_91;
  }
LABEL_21:
  double v129 = +[VTSpeakerIdUtilities getSpeakerModelPathForType:1 withLanguageCode:self->_languageCode withConfigPath:v12 createDirectory:isRunningSATEnrollment];
  v47 = (id)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(double *)&uint64_t v144 = v129;
    _os_log_impl(&dword_21844F000, v47, OS_LOG_TYPE_DEFAULT, "SAT speaker file location is %{public}@", buf, 0xCu);
  }

  v48 = (id)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(double *)&uint64_t v144 = v130;
    _os_log_impl(&dword_21844F000, v48, OS_LOG_TYPE_DEFAULT, "SAT training utterances stored in %{public}@", buf, 0xCu);
  }

  uint64_t v49 = +[VTUtilities getAssetHashFromConfigPath:v12];
  v127 = +[VTSpeakerIdUtilities getSATDirectoryForModelType:1 forLanguageCode:self->_languageCode];
  v128 = (void *)v49;
  v50 = [[VTTextDependentSpeakerRecognizer alloc] initWithResourcePath:v14 satDirectory:v127 assetHash:v49 shouldCreateModelDir:0 delegate:self];
  satDetectionTdSr = self->_satDetectionTdSr;
  self->_satDetectionTdSr = v50;

  v52 = (id)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    v53 = self->_satDetectionTdSr;
    *(_DWORD *)buf = 138543362;
    uint64_t v144 = (uint64_t)v53;
    _os_log_impl(&dword_21844F000, v52, OS_LOG_TYPE_DEFAULT, "TDSR:: Created _tdSrForSatDetection: %{public}@", buf, 0xCu);
  }

  double v54 = v130;
  if (self->_isRunningSATEnrollment)
  {
    v55 = [MEMORY[0x263F08850] defaultManager];
    int v56 = [v55 fileExistsAtPath:*(void *)&v129 isDirectory:0];

    if (v56)
    {
      v57 = [MEMORY[0x263F08850] defaultManager];
      id v141 = 0;
      [v57 removeItemAtPath:*(void *)&v129 error:&v141];
      id v58 = v141;

      if (v58)
      {
        v59 = (id)VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          double v60 = [v58 localizedDescription];
          *(_DWORD *)buf = 138543618;
          *(double *)&uint64_t v144 = v129;
          __int16 v145 = 2114;
          double v146 = v60;
          _os_log_impl(&dword_21844F000, v59, OS_LOG_TYPE_DEFAULT, "Couldn't delete speaker model at path %{public}@ %{public}@", buf, 0x16u);
        }
      }
    }
    v61 = [MEMORY[0x263F08850] defaultManager];
    id v140 = 0;
    v62 = [v61 contentsOfDirectoryAtPath:*(void *)&v130 error:&v140];
    id v63 = v140;

    v126 = v62;
    if (v63 || !v62)
    {
      v74 = (void *)VTLogContextFacilityVoiceTrigger;
      v75 = v63;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v76 = v74;
        double v77 = [v63 localizedDescription];
        *(_DWORD *)buf = 138543618;
        *(double *)&uint64_t v144 = v130;
        __int16 v145 = 2114;
        double v146 = v77;
        _os_log_impl(&dword_21844F000, v76, OS_LOG_TYPE_DEFAULT, "Coudn't fetch the list of training utterances at path: %{public}@ %{public}@", buf, 0x16u);
      }
    }
    else
    {
      id v122 = v14;
      id v123 = v13;
      id v124 = v12;
      id v125 = v11;
      long long v138 = 0u;
      long long v139 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      id v64 = v62;
      uint64_t v65 = [v64 countByEnumeratingWithState:&v136 objects:v151 count:16];
      if (v65)
      {
        uint64_t v66 = v65;
        uint64_t v67 = *(void *)v137;
        do
        {
          for (uint64_t i = 0; i != v66; ++i)
          {
            if (*(void *)v137 != v67) {
              objc_enumerationMutation(v64);
            }
            if (*(void *)(*((void *)&v136 + 1) + 8 * i))
            {
              objc_msgSend(*(id *)&v54, "stringByAppendingPathComponent:");
              double v69 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              v70 = [MEMORY[0x263F08850] defaultManager];
              id v135 = 0;
              [v70 removeItemAtPath:*(void *)&v69 error:&v135];
              id v71 = v135;

              if (v71)
              {
                v72 = (id)VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  double v73 = [v71 localizedDescription];
                  *(_DWORD *)buf = 138543618;
                  *(double *)&uint64_t v144 = v69;
                  __int16 v145 = 2114;
                  double v146 = v73;
                  _os_log_impl(&dword_21844F000, v72, OS_LOG_TYPE_DEFAULT, "Couldn't delete training utterance at path %{public}@ %{public}@", buf, 0x16u);

                  double v54 = v130;
                }
              }
            }
          }
          uint64_t v66 = [v64 countByEnumeratingWithState:&v136 objects:v151 count:16];
        }
        while (v66);
      }

      id v12 = v124;
      id v11 = v125;
      id v14 = v122;
      id v13 = v123;
      v75 = 0;
    }
  }
  if ([v11 initializeSAT:*(void *)&v129])
  {
    if (self->_isRunningSATDetection)
    {
      if (+[VTVoiceProfileMigration checkIfMigrationNecessaryForCompatibilityVersion:1 forLanguageCode:self->_languageCode])
      {
        v78 = (id)VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21844F000, v78, OS_LOG_TYPE_DEFAULT, "Performing Migration of Voice Profile...", buf, 2u);
        }

        BOOL v79 = +[VTVoiceProfileMigration migrateVoiceProfileToVersion:1 forLanguageCode:self->_languageCode];
      }
      else
      {
        BOOL v79 = 0;
      }
      v82 = [[VTVoiceProfileRetrainer alloc] initWithAnalyzer:v11 languageCode:self->_languageCode modelType:1 configPath:self->_configPath resourcePath:self->_resourcePath];
      if (v79
        || [(VTPhraseSpotter *)self _shouldPerformRetrainingWithAnalyzerNDAPI:v11 resourcePath:v14])
      {
        if ([(VTVoiceProfileRetrainer *)v82 pruneVoiceProfileIfNecessary])
        {
          v83 = (id)VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21844F000, v83, OS_LOG_TYPE_DEFAULT, "Pruned Voice profile", buf, 2u);
          }
        }
        v84 = +[VTPreferences sharedPreferences];
        int v85 = [v84 voiceTriggerEnabled];

        v86 = VTLogContextFacilityVoiceTrigger;
        if (v85)
        {
          v87 = (id)VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21844F000, v87, OS_LOG_TYPE_DEFAULT, "Retraining SAT speaker models with previous enrollment data", buf, 2u);
          }

          if (!+[VTSpeakerIdUtilities deleteExistingSATModelForLanguageCode:self->_languageCode])
          {
            v88 = (id)VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_21844F000, v88, OS_LOG_TYPE_ERROR, "ERR: Cannot delete invalidated spk model", buf, 2u);
            }
          }
          [(VTTextDependentSpeakerRecognizer *)self->_satDetectionTdSr deleteExistingSATModel];
          v131[0] = MEMORY[0x263EF8330];
          v131[1] = 3221225472;
          v131[2] = __69__VTPhraseSpotter__safeConfigureWithAnalyzer_path_data_resourcePath___block_invoke;
          v131[3] = &unk_264326128;
          v131[4] = self;
          id v132 = v14;
          id v133 = v127;
          id v134 = v128;
          [(VTVoiceProfileRetrainer *)v82 retrainSATModelWithCompletion:v131];
        }
        else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21844F000, v86, OS_LOG_TYPE_DEFAULT, "Not performing retraining while Voice Trigger is disabled", buf, 2u);
        }
      }
      if ((int)[v11 getSATVectorCount] <= 0)
      {
        v89 = (id)VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21844F000, v89, OS_LOG_TYPE_DEFAULT, "SAT model file can't be read correctly, turning off SAT for workaround", buf, 2u);
        }

        self->_BOOL isRunningSATDetection = 0;
      }
    }
  }
  else
  {
    v80 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(double *)&uint64_t v144 = v129;
      _os_log_impl(&dword_21844F000, v80, OS_LOG_TYPE_DEFAULT, "Couldn't load or initialize speaker model file at path %{public}@, disabling SAT", buf, 0xCu);
    }
    self->_BOOL isRunningSATDetection = 0;
  }

  BOOL isRunningSATDetection = self->_isRunningSATDetection;
  if (isRunningSATDetection)
  {
    v90 = self->_satDetectionTdSr;
    if (v90)
    {
      [(VTTextDependentSpeakerRecognizer *)v90 getThresholdSAT];
      self->_double tdSpeakerRecognizerSATThreshold = v91;
      [(VTTextDependentSpeakerRecognizer *)self->_satDetectionTdSr getCombinationWeight];
      self->_double tdSpeakerRecognizerCombinationWeight = v92;
    }
    v93 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      v94 = self->_satDetectionTdSr;
      double thresholdSAT = self->_thresholdSAT;
      double tdSpeakerRecognizerSATThreshold = self->_tdSpeakerRecognizerSATThreshold;
      double tdSpeakerRecognizerCombinationWeight = self->_tdSpeakerRecognizerCombinationWeight;
      *(_DWORD *)buf = 138544130;
      uint64_t v144 = (uint64_t)v94;
      __int16 v145 = 2050;
      double v146 = thresholdSAT;
      __int16 v147 = 2050;
      double v148 = tdSpeakerRecognizerSATThreshold;
      __int16 v149 = 2050;
      double v150 = tdSpeakerRecognizerCombinationWeight;
      _os_log_impl(&dword_21844F000, v93, OS_LOG_TYPE_DEFAULT, "_satDetectionTdSr: %{public}@: _thresholdSAT=%{public}f, _tdSpeakerRecognizerSATThreshold=%{public}f, _tdSpeakerRecognizerCombinationWeight=%{public}f", buf, 0x2Au);
    }

    BOOL isRunningSATDetection = self->_isRunningSATDetection;
  }
LABEL_91:
  self->_isSuperVectorNeeded = isRunningSATDetection
                            || self->_isRunningSATEnrollment
                            || self->_doSuperVectorSecondaryTest;
  if (self->_useRecognizer && self->_recognizerConfigName)
  {
    v98 = [MEMORY[0x263F08AB0] processInfo];
    [v98 systemUptime];
    double v100 = v99;

    double v101 = [(NSString *)self->_resourcePath stringByAppendingPathComponent:self->_recognizerConfigName];
    v102 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(double *)&uint64_t v144 = v101;
      _os_log_impl(&dword_21844F000, v102, OS_LOG_TYPE_DEFAULT, "Speech recognizer config path: %{public}@", buf, 0xCu);
    }

    v103 = [[VTTranscriber alloc] initWithConfiguration:*(void *)&v101 triggerTokens:self->_triggerTokens useKeywordSpotting:self->_useKeywordSpotting];
    transcriber = self->_transcriber;
    self->_transcriber = v103;

    v105 = [MEMORY[0x263F08AB0] processInfo];
    [v105 systemUptime];
    double v107 = v106;

    v108 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      *(double *)&uint64_t v144 = (v107 - v100) * 1000.0;
      _os_log_impl(&dword_21844F000, v108, OS_LOG_TYPE_DEFAULT, "Speech model loading took %{public}.3fms", buf, 0xCu);
    }

    if (!self->_transcriber) {
      self->_useRecognizer = 0;
    }
  }
  if (!self->_audioBuffer && [(VTPhraseSpotter *)self _shouldCreateAudioBuffer])
  {
    v109 = [[VTAudioCircularBuffer alloc] initWithNumChannels:1 recordingDuration:2 samplingRate:16000];
    audioBuffer = self->_audioBuffer;
    self->_audioBuffer = v109;
  }
  analyzer = self->_analyzer;
  if (analyzer)
  {
    self->_analyzer = 0;
  }
  objc_storeStrong((id *)&self->_analyzer, a3);
  v112 = +[VTPreferences sharedPreferences];
  v113 = [v112 localizedTriggerPhraseForLanguageCode:self->_languageCode];
  v142 = v113;
  v114 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v142 count:1];
  triggerPhrases = self->_triggerPhrases;
  self->_triggerPhrases = v114;

  self->_isMaximized = 0;
  self->_earlyDetected = 0;
  self->_earlyDetectTime = 0.0;
  self->_earlyDetecFiredMachTime = 0;
  self->_numFramesFromPreTrigger = 0;
  v116 = (id)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    languageCode = self->_languageCode;
    double threshold = self->_threshold;
    double thresholdLogNearMisses = self->_thresholdLogNearMisses;
    v120 = self->_triggerPhrases;
    *(_DWORD *)buf = 138544130;
    uint64_t v144 = (uint64_t)languageCode;
    __int16 v145 = 2050;
    double v146 = threshold;
    __int16 v147 = 2050;
    double v148 = thresholdLogNearMisses;
    __int16 v149 = 2114;
    double v150 = *(double *)&v120;
    _os_log_impl(&dword_21844F000, v116, OS_LOG_TYPE_DEFAULT, "Initialized detector. LanguageCode: %{public}@; Threshold set to %{public}f; logging threshold: %{public}f; trigge"
      "r phrases: %{public}@",
      buf,
      0x2Au);
  }
}

void __69__VTPhraseSpotter__safeConfigureWithAnalyzer_path_data_resourcePath___block_invoke(void *a1, int a2, int a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v5 = [[VTTextDependentSpeakerRecognizer alloc] initWithResourcePath:a1[5] satDirectory:a1[6] assetHash:a1[7] shouldCreateModelDir:0 delegate:a1[4]];
    uint64_t v6 = a1[4];
    id v7 = *(void **)(v6 + 592);
    *(void *)(v6 + 592) = v5;

    unint64_t v8 = VTLogContextFacilityVoiceTrigger;
    if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v9 = *(void *)(a1[4] + 592);
    int v15 = 138543362;
    uint64_t v16 = v9;
    uint32_t v10 = "TDSR:: _satRetrainingTdSr Success. Recreated _satDetectionTdSr: %{public}@";
  }
  else
  {
    uint64_t v11 = a1[4];
    id v12 = *(void **)(v11 + 592);
    *(void *)(v11 + 592) = 0;

    unint64_t v8 = VTLogContextFacilityVoiceTrigger;
    if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v13 = *(void *)(a1[4] + 592);
    int v15 = 138543362;
    uint64_t v16 = v13;
    uint32_t v10 = "TDSR:: _satRetrainingTdSr FAILED. Setting _satDetectionTdSr to nil: %{public}@";
  }
  _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, 0xCu);
LABEL_7:
  if (a2)
  {
    notify_post("com.apple.voicetrigger.PHSProfileModified");
  }
  else
  {
    id v14 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_21844F000, v14, OS_LOG_TYPE_DEFAULT, "Retraining failed, turning off SAT for workaround", (uint8_t *)&v15, 2u);
    }
    *(unsigned char *)(a1[4] + 241) = 0;
  }
}

- (BOOL)_shouldPerformRetrainingWithAnalyzerNDAPI:(id)a3 resourcePath:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v9 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:1 forLanguageCode:self->_languageCode];
  char v36 = 0;
  if (([v8 fileExistsAtPath:v9 isDirectory:&v36] & 1) != 0 || v36)
  {
    id v12 = +[VTSpeakerIdUtilities getSpeakerModelPathForType:1 withLanguageCode:self->_languageCode withConfigPath:self->_configPath createDirectory:0];
    if (([v8 fileExistsAtPath:v12 isDirectory:0] & 1) == 0)
    {
      uint64_t v19 = VTLogContextFacilityVoiceTrigger;
      if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:
        BOOL v11 = 1;
LABEL_33:

        goto LABEL_34;
      }
      *(_DWORD *)buf = 138543362;
      int64_t v38 = (int64_t)v12;
      double v20 = "Needs Retraining: phsSATFile doesnt exist at: %{public}@.";
      double v21 = v19;
      uint32_t v22 = 12;
LABEL_11:
      _os_log_impl(&dword_21844F000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      goto LABEL_12;
    }
    v34 = v12;
    id v35 = v7;
    int64_t v13 = [(VTPhraseSpotter *)self _getNumberOfAudioFilesInDirectory:v9];
    int v14 = [v6 getSATVectorCount];
    int v15 = [v6 getMaximumSpeakerVectors];
    uint64_t v16 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v14;
      *(_DWORD *)buf = 134349826;
      int64_t v18 = v15;
      int64_t v38 = v13;
      __int16 v39 = 2114;
      id v40 = v6;
      __int16 v41 = 2050;
      uint64_t v42 = v14;
      __int16 v43 = 2050;
      uint64_t v44 = v15;
      _os_log_impl(&dword_21844F000, v16, OS_LOG_TYPE_DEFAULT, "SV: numAudioFiles: %{public}ld, analyzerNDAPI: %{public}@, numSATSpeakerVectors: %{public}ld, maxSpeakerVectors: %{public}ld", buf, 0x2Au);
      if (v13 > v15) {
        goto LABEL_18;
      }
    }
    else
    {
      int64_t v18 = v15;
      uint64_t v17 = v14;
      if (v13 > v15) {
        goto LABEL_18;
      }
    }
    if (v13 != v17)
    {
      double v23 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21844F000, v23, OS_LOG_TYPE_DEFAULT, "Needs Retraining: (PHS)SpeakerVectors MISMATCH. numSATSpeakerVectors != numAudioFiles", buf, 2u);
      }
      BOOL v11 = 1;
      id v12 = v34;
      id v7 = v35;
      goto LABEL_33;
    }
LABEL_18:
    if (v13 > v18 && v14 != v15)
    {
      double v24 = VTLogContextFacilityVoiceTrigger;
      id v12 = v34;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21844F000, v24, OS_LOG_TYPE_DEFAULT, "Needs Retraining: (PHS)SpeakerVectors MISMATCH. numSATSpeakerVectors != maxSpeakerVectors", buf, 2u);
      }
      BOOL v11 = 1;
      id v7 = v35;
      goto LABEL_33;
    }
    id v7 = v35;
    id v12 = v34;
    if (+[VTTextDependentSpeakerRecognizer psrTdAssetExistsAtResourcePath:v35])
    {
      double v25 = [(VTTextDependentSpeakerRecognizer *)self->_satDetectionTdSr tdSATModelFilePath];
      char v26 = [v8 fileExistsAtPath:v25 isDirectory:0];

      if ((v26 & 1) == 0)
      {
        double v30 = (void *)VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          satDetectionTdSr = self->_satDetectionTdSr;
          double v32 = v30;
          v33 = [(VTTextDependentSpeakerRecognizer *)satDetectionTdSr tdSATModelFilePath];
          *(_DWORD *)buf = 138543362;
          int64_t v38 = (int64_t)v33;
          _os_log_impl(&dword_21844F000, v32, OS_LOG_TYPE_DEFAULT, "Needs Retraining: psrTD SAT file doesnt exist at: %{public}@", buf, 0xCu);
        }
        goto LABEL_12;
      }
      int64_t v27 = [(VTTextDependentSpeakerRecognizer *)self->_satDetectionTdSr getSATVectorCount];
      v28 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        int64_t v38 = v27;
        _os_log_impl(&dword_21844F000, v28, OS_LOG_TYPE_DEFAULT, "numPsrTdSpeakerVectors: %{public}ld", buf, 0xCu);
        v28 = VTLogContextFacilityVoiceTrigger;
      }
      if (v27 != v17)
      {
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        double v20 = "Needs Retraining: (TD-PSR)SpeakerVectors MISMATCH! numPsrTdSpeakerVectors != numSATSpeakerVectors";
        double v21 = v28;
        uint32_t v22 = 2;
        goto LABEL_11;
      }
    }
    else
    {
      v28 = VTLogContextFacilityVoiceTrigger;
    }
    BOOL v11 = 0;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v28, OS_LOG_TYPE_DEFAULT, "VT does not need retraining: ", buf, 2u);
      BOOL v11 = 0;
    }
    goto LABEL_33;
  }
  uint32_t v10 = VTLogContextFacilityVoiceTrigger;
  BOOL v11 = 0;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int64_t v38 = (int64_t)v9;
    __int16 v39 = 1026;
    LODWORD(v40) = 0;
    _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "Cannot find SAT Audio dir at %{public}@: isDir: %{public}d", buf, 0x12u);
    BOOL v11 = 0;
  }
LABEL_34:

  return v11;
}

- (int64_t)_getNumberOfAudioFilesInDirectory:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = [NSURL URLWithString:v3];
    id v5 = [MEMORY[0x263F08850] defaultManager];
    v17[0] = *MEMORY[0x263EFF750];
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    id v14 = 0;
    id v7 = [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v6 options:0 error:&v14];
    id v8 = v14;

    if (v8)
    {
      uint64_t v9 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v8;
        _os_log_error_impl(&dword_21844F000, v9, OS_LOG_TYPE_ERROR, "Error reading contents of audioDir: %{public}@, err: %{public}@", buf, 0x16u);
      }
      int64_t v10 = -1;
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      uint64_t v16 = 0;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __53__VTPhraseSpotter__getNumberOfAudioFilesInDirectory___block_invoke;
      v13[3] = &unk_264326100;
      v13[4] = buf;
      [v7 enumerateObjectsUsingBlock:v13];
      int64_t v10 = *(void *)(*(void *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    BOOL v11 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21844F000, v11, OS_LOG_TYPE_ERROR, "ERR: audioDir is nil - Bailing out", buf, 2u);
    }
    int64_t v10 = -1;
  }

  return v10;
}

void __53__VTPhraseSpotter__getNumberOfAudioFilesInDirectory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 pathExtension];
  int v4 = [v3 isEqualToString:@"wav"];

  if (v4) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (BOOL)_configureWithConfig:(id)a3 resourcePath:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v15 = "-[VTPhraseSpotter _configureWithConfig:resourcePath:]";
    __int16 v16 = 2114;
    id v17 = v5;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "::: %{public}s config: %{public}@; resources: %{public}@",
      buf,
      0x20u);
  }
  kdebug_trace();
  id v8 = [MEMORY[0x263F08850] defaultManager];
  int v9 = [v8 fileExistsAtPath:v5];

  if (v9)
  {
    int64_t v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v5];
    BOOL v11 = v10;
    if (v10)
    {
      [v10 MD5HashString];
      objc_claimAutoreleasedReturnValue();
    }
  }
  nd_initlog((uint64_t)ndapilog_callback);
  nd_logcontrol("NLogLevelVerbose", v12);
}

uint64_t __53__VTPhraseSpotter__configureWithConfig_resourcePath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _safeConfigureWithAnalyzer:*(void *)(a1 + 40) path:*(void *)(a1 + 48) data:*(void *)(a1 + 56) resourcePath:*(void *)(a1 + 64)];
}

- (void)VTAssetMonitor:(id)a3 didReceiveNewAssetAvailable:(BOOL)a4
{
}

- (void)_handleAssetChangeForLanguageCode:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  assetChangedQueue = self->_assetChangedQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__VTPhraseSpotter__handleAssetChangeForLanguageCode___block_invoke;
  v7[3] = &unk_2643260B0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  objc_copyWeak(&v10, &location);
  dispatch_async(assetChangedQueue, v7);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __53__VTPhraseSpotter__handleAssetChangeForLanguageCode___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  kdebug_trace();
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(v3 + 168);
  if (v2)
  {
    if ([v2 isEqualToString:v4]) {
      goto LABEL_7;
    }
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(id *)(a1 + 32);
    id v7 = *(void **)(v5 + 168);
    *(void *)(v5 + 168) = v6;
  }
  else
  {
    if (v4) {
      goto LABEL_7;
    }
    id v7 = 0;
    *(void *)(v3 + 168) = @"en-US";
  }

LABEL_7:
  id v8 = +[VTAssetManager sharedInstance];
  int v9 = [v8 assetForLanguage:*(void *)(*(void *)(a1 + 40) + 168)];

  if (!v9) {
    goto LABEL_36;
  }
  id v10 = [v9 path];
  BOOL v11 = [v10 stringByAppendingPathComponent:@"config.txt"];
  if (+[VTUtilities VTIsHorseman])
  {
    id v12 = [v10 stringByAppendingPathComponent:@"config_marsh.txt"];
    int64_t v13 = [MEMORY[0x263F08850] defaultManager];
    int v14 = [v13 fileExistsAtPath:v12 isDirectory:0];

    int v15 = VTLogContextFacilityVoiceTrigger;
    BOOL v16 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138543362;
        id v57 = v12;
        id v17 = "::: using marsh config: %{public}@";
LABEL_16:
        _os_log_impl(&dword_21844F000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    if (!v16) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138543362;
    id v57 = v12;
    double v21 = "::: marsh config doesn't exist: %{public}@, defaulting to normal config";
LABEL_22:
    _os_log_impl(&dword_21844F000, v15, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
    goto LABEL_23;
  }
  if (!+[VTUtilities isAlwaysOn]) {
    goto LABEL_24;
  }
  id v12 = [v10 stringByAppendingPathComponent:@"config_quasar.txt"];
  __int16 v18 = [MEMORY[0x263F08850] defaultManager];
  int v19 = [v18 fileExistsAtPath:v12 isDirectory:0];

  int v15 = VTLogContextFacilityVoiceTrigger;
  BOOL v20 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
  if (!v19)
  {
    if (!v20) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138543362;
    id v57 = v12;
    double v21 = "::: quasar config doesn't exist: %{public}@, defaulting to normal config";
    goto LABEL_22;
  }
  if (v20)
  {
    *(_DWORD *)buf = 138543362;
    id v57 = v12;
    id v17 = "::: using quasar config: %{public}@";
    goto LABEL_16;
  }
LABEL_17:
  id v12 = v12;

  BOOL v11 = v12;
LABEL_23:

LABEL_24:
  if (v10 && ([v9 isAvailableLocally] & 1) != 0)
  {
    if ([*(id *)(*(void *)(a1 + 40) + 176) isEqualToString:v11])
    {
      uint32_t v22 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        double v23 = *(void **)(*(void *)(a1 + 40) + 168);
        *(_DWORD *)buf = 138543362;
        id v57 = v23;
        _os_log_impl(&dword_21844F000, v22, OS_LOG_TYPE_DEFAULT, "resource path for %{public}@ has not been updated.", buf, 0xCu);
      }
      if (+[VTVoiceProfileMigration checkIfMigrationNecessaryForCompatibilityVersion:1 forLanguageCode:*(void *)(*(void *)(a1 + 40) + 168)])
      {
        double v24 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21844F000, v24, OS_LOG_TYPE_DEFAULT, "Performing Migration of Voice Profile...", buf, 2u);
        }
        +[VTVoiceProfileMigration migrateVoiceProfileToVersion:1 forLanguageCode:*(void *)(*(void *)(a1 + 40) + 168)];
      }
    }
    else
    {
      char v26 = [v9 languages];
      char v27 = [v26 containsObject:*(void *)(*(void *)(a1 + 40) + 168)];

      v28 = VTLogContextFacilityVoiceTrigger;
      BOOL v29 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
      if (v27)
      {
        if (v29)
        {
          *(_DWORD *)buf = 138543362;
          id v57 = v10;
          _os_log_impl(&dword_21844F000, v28, OS_LOG_TYPE_DEFAULT, "::: resource path:  %{public}@", buf, 0xCu);
        }
        double v30 = [v9 compatibilityVersion];
        uint64_t v31 = [v30 stringValue];
        uint64_t v32 = *(void *)(a1 + 40);
        v33 = *(void **)(v32 + 200);
        *(void *)(v32 + 200) = v31;

        uint64_t v34 = *(void *)(a1 + 40);
        if (*(void *)(v34 + 200))
        {
          id v35 = [v9 version];

          uint64_t v34 = *(void *)(a1 + 40);
          if (v35)
          {
            char v36 = *(void **)(v34 + 200);
            id v37 = [v9 version];
            int64_t v38 = [v37 stringValue];
            uint64_t v39 = [v36 stringByAppendingFormat:@".%@", v38];
            uint64_t v40 = *(void *)(a1 + 40);
            __int16 v41 = *(void **)(v40 + 200);
            *(void *)(v40 + 200) = v39;

            uint64_t v34 = *(void *)(a1 + 40);
          }
        }
        if (*(void *)(v34 + 200))
        {
          uint64_t v42 = [v9 footprint];

          if (v42)
          {
            __int16 v43 = *(void **)(*(void *)(a1 + 40) + 200);
            uint64_t v44 = [v9 footprint];
            uint64_t v45 = [v43 stringByAppendingFormat:@".%@", v44];
            uint64_t v46 = *(void *)(a1 + 40);
            v47 = *(void **)(v46 + 200);
            *(void *)(v46 + 200) = v45;
          }
        }
        v48 = +[VTAggregator sharedAggregator];
        [v48 setAssetString:*(void *)(*(void *)(a1 + 40) + 200)];

        objc_storeStrong((id *)(*(void *)(a1 + 40) + 192), *(id *)(*(void *)(a1 + 40) + 168));
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        [WeakRetained _configureWithConfig:v11 resourcePath:v10];

        uint64_t v50 = *(void *)(a1 + 40);
        v51 = *(NSObject **)(v50 + 448);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __53__VTPhraseSpotter__handleAssetChangeForLanguageCode___block_invoke_685;
        block[3] = &unk_264325ED0;
        block[4] = v50;
        dispatch_async(v51, block);
      }
      else if (v29)
      {
        v52 = v28;
        v53 = [v9 languages];
        uint64_t v54 = *(void *)(*(void *)(a1 + 40) + 168);
        *(_DWORD *)buf = 138543618;
        id v57 = v53;
        __int16 v58 = 2114;
        uint64_t v59 = v54;
        _os_log_impl(&dword_21844F000, v52, OS_LOG_TYPE_DEFAULT, "::: new resource for locales %{public}@ is not applicable to the current locale(%{public}@)", buf, 0x16u);
      }
    }
  }
  else
  {
    double v25 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v25, OS_LOG_TYPE_DEFAULT, "::: resource path NOT found, waiting to be notified...", buf, 2u);
    }
  }

LABEL_36:
}

uint64_t __53__VTPhraseSpotter__handleAssetChangeForLanguageCode___block_invoke_685(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 504);
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "VTPhraseSpotter is re-configured with new assets, calling back VTSM for model update", v4, 2u);
      uint64_t v1 = *(void *)(*(void *)(v2 + 32) + 504);
    }
    return (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
  }
  return result;
}

- (void)_notifyAssetChangedCallback
{
  assetChangedCallback = (void (**)(void))self->_assetChangedCallback;
  if (assetChangedCallback) {
    assetChangedCallback[2]();
  }
}

- (void)_firstUnlockedAndSpringBoardStarted
{
  objc_initWeak(&location, self);
  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__VTPhraseSpotter__firstUnlockedAndSpringBoardStarted__block_invoke;
  block[3] = &unk_264326088;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(ndetectQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__VTPhraseSpotter__firstUnlockedAndSpringBoardStarted__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleAssetChangeForLanguageCode:*(void *)(*(void *)(a1 + 32) + 168)];
}

- (void)requestSecondChance
{
  uint64_t v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "Received forrced second chance event creation", v4, 2u);
  }
  [(VTPhraseSpotter *)self looseTriggerThreshold];
}

- (void)requestFoceTrigger
{
  uint64_t v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "Received forrced trigger event creation", buf, 2u);
  }
  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__VTPhraseSpotter_requestFoceTrigger__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(ndetectQueue, block);
}

void __37__VTPhraseSpotter_requestFoceTrigger__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08AB0] processInfo];
  [v2 systemUptime];
  double v4 = v3;

  id v5 = *(void **)(*(void *)(a1 + 32) + 632);
  id v6 = [NSNumber numberWithDouble:v4];
  [v5 addObject:v6];
}

- (void)didReceiveSiriSessionCancellation:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "::: Received siriSessionCancel Event with reason: %{public}@", buf, 0xCu);
  }
  ndetectQueue = self->_ndetectQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__VTPhraseSpotter_didReceiveSiriSessionCancellation___block_invoke;
  v8[3] = &unk_264325FF0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(ndetectQueue, v8);
}

void __53__VTPhraseSpotter_didReceiveSiriSessionCancellation___block_invoke(uint64_t a1)
{
  v32[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 256))
  {
    double v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "::: Removing the last implicit utterance", buf, 2u);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    [*(id *)(v2 + 16) deleteVectorIndex:0xFFFFFFFFLL];
    [*(id *)(*(void *)(a1 + 32) + 592) deleteVectorAtIndex:0xFFFFFFFFLL];
    *(unsigned char *)(*(void *)(a1 + 32) + 256) = 0;
    if (*(void *)(*(void *)(a1 + 32) + 264))
    {
      id v4 = [MEMORY[0x263F08850] defaultManager];
      int v5 = [v4 fileExistsAtPath:*(void *)(*(void *)(a1 + 32) + 264)];

      if (v5)
      {
        id v6 = [MEMORY[0x263F08850] defaultManager];
        [v6 removeItemAtPath:*(void *)(*(void *)(a1 + 32) + 264) error:0];
      }
      id v7 = [*(id *)(*(void *)(a1 + 32) + 264) stringByDeletingPathExtension];
      id v8 = [v7 stringByAppendingPathExtension:@"json"];

      id v9 = [MEMORY[0x263F08850] defaultManager];
      int v10 = [v9 fileExistsAtPath:v8];

      if (v10)
      {
        id v11 = [MEMORY[0x263F08850] defaultManager];
        [v11 removeItemAtPath:v8 error:0];
      }
      uint64_t v12 = *(void *)(a1 + 32);
      int64_t v13 = *(void **)(v12 + 264);
      *(void *)(v12 + 264) = 0;

      if (*(void *)(*(void *)(a1 + 32) + 264))
      {
        int v14 = [MEMORY[0x263F08850] defaultManager];
        int v15 = [v14 fileExistsAtPath:*(void *)(*(void *)(a1 + 32) + 264)];

        if (v15)
        {
          BOOL v16 = [MEMORY[0x263F08850] defaultManager];
          [v16 removeItemAtPath:*(void *)(*(void *)(a1 + 32) + 264) error:0];

          uint64_t v17 = *(void *)(a1 + 32);
          __int16 v18 = *(void **)(v17 + 264);
          *(void *)(v17 + 264) = 0;
        }
      }
    }
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 136))
  {
    int v19 = @"???";
    if (*(void *)(a1 + 40)) {
      int v19 = *(__CFString **)(a1 + 40);
    }
    uint64_t v31 = @"siriCancelReason";
    v32[0] = v19;
    BOOL v20 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v28 = 0;
    double v21 = [MEMORY[0x263F08900] dataWithJSONObject:v20 options:1 error:&v28];
    id v22 = v28;
    double v23 = VTMakeTimestampedAudioLogFilenameWithPrefixAndSuffix(&stru_26C99F218, @"-cancel.json");
    if (v22)
    {
      double v24 = (void *)VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        double v25 = v24;
        char v26 = [v22 localizedDescription];
        *(_DWORD *)buf = 138543362;
        double v30 = v26;
        _os_log_impl(&dword_21844F000, v25, OS_LOG_TYPE_DEFAULT, "::: Error writing out Siri cancellation meta: %{public}@", buf, 0xCu);
      }
    }
    [v21 writeToFile:v23 atomically:0];
    char v27 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      double v30 = v23;
      _os_log_impl(&dword_21844F000, v27, OS_LOG_TYPE_DEFAULT, "::: Siri session cancellation data written into %{public}@", buf, 0xCu);
    }
  }
}

- (void)setBypass:(BOOL)a3
{
  ndetectQueue = self->_ndetectQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__VTPhraseSpotter_setBypass___block_invoke;
  v4[3] = &unk_264325FC8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(ndetectQueue, v4);
}

uint64_t __29__VTPhraseSpotter_setBypass___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 476) = *(unsigned char *)(result + 40);
  return result;
}

- (void)VTLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5 = a4;
  notify_post("com.apple.corespeech.voicetriggerassetchange");
  id v7 = v5;
  id v6 = +[VTAggregator sharedAggregator];
  [v6 setLanguageCode:v7];

  [(VTPhraseSpotter *)self _handleAssetChangeForLanguageCode:v7];
}

- (BOOL)_configureWithDefaults
{
  return 1;
}

- (id)_capturePathWithPrefix:(id)a3 eventKind:(unsigned __int8)a4
{
  if ((a4 - 1) > 3u) {
    id v4 = @"-triggered.wav";
  }
  else {
    id v4 = off_264326148[(a4 - 1)];
  }
  return (id)[NSString stringWithFormat:@"%@%@", a3, v4];
}

- (unint64_t)sampleCountAtEndOfTrigger
{
  return self->_samplecountAtLastTriggerEnd;
}

- (unint64_t)sampleCountAtStartOfTrigger
{
  return self->_samplecountAtLastTriggerStart;
}

- (unint64_t)sampleCount
{
  return self->_samplecount;
}

- (id)getSATDirectory
{
  return +[VTSpeakerIdUtilities getSATAudioDirectoryForType:1 forLanguageCode:self->_languageCode];
}

- (unint64_t)getAdjustedDeviceStartTime:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v4 = -[VTPhraseSpotter _applyExtraTime:to:](self, "_applyExtraTime:to:", 0.5);
  id v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134349568;
    uint64_t v8 = 0x3FE0000000000000;
    __int16 v9 = 2050;
    unint64_t v10 = a3;
    __int16 v11 = 2050;
    unint64_t v12 = v4;
    _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "Start audio device %{public}.1fs earlier -- received trigger time %{public}lld and adjusted device start time: %{public}lld", (uint8_t *)&v7, 0x20u);
  }
  return v4;
}

- (unint64_t)_addExtraTime:(double)a3 to:(unint64_t)a4
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  if (info.numer)
  {
    LODWORD(v6) = info.denom;
    unint64_t v7 = (unint64_t)((double)v6 / (double)info.numer * 1000000000.0 * a3);
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v7 + a4;
}

- (unint64_t)_applyExtraTime:(double)a3 to:(unint64_t)a4
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  if (info.numer)
  {
    LODWORD(v6) = info.denom;
    unint64_t v7 = (unint64_t)((double)v6 / (double)info.numer * 1000000000.0 * a3);
  }
  else
  {
    unint64_t v7 = 0;
  }
  BOOL v8 = a4 >= v7;
  unint64_t v9 = a4 - v7;
  if (v8) {
    return v9;
  }
  else {
    return 0;
  }
}

- (id)getLanguageCode
{
  return self->_languageCode;
}

- (id)getCorealisRTModel
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (self->_languageCode) {
    languageCode = (__CFString *)self->_languageCode;
  }
  else {
    languageCode = @"xx-XX";
  }
  unint64_t v4 = [@"RT Model for " stringByAppendingString:languageCode];
  id v5 = [v4 stringByAppendingString:@" from asset "];

  id v6 = v5;
  resourcePath = self->_resourcePath;
  if (!resourcePath || !self->_configPath) {
    goto LABEL_18;
  }
  BOOL v8 = [(NSString *)resourcePath stringByAppendingPathComponent:@"config_rt.txt"];
  if (!+[VTUtilities isAlwaysOn]) {
    goto LABEL_10;
  }
  unint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  char v10 = [v9 fileExistsAtPath:v8 isDirectory:0];

  if ((v10 & 1) == 0)
  {
    __int16 v11 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      configPath = self->_configPath;
      *(_DWORD *)buf = 138543618;
      BOOL v29 = v8;
      __int16 v30 = 2114;
      uint64_t v31 = configPath;
      _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "RT specific configuration %{public}@ does not exist, defaulting to unified configuration %{public}@", buf, 0x16u);
    }
LABEL_10:
    uint64_t v13 = self->_configPath;

    BOOL v8 = v13;
  }
  int v14 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    BOOL v29 = v8;
    _os_log_impl(&dword_21844F000, v14, OS_LOG_TYPE_DEFAULT, "Creating RT blob using: %{public}@", buf, 0xCu);
  }
  uint64_t v15 = +[VTBlobBuilder getBlobWithConfigFilename:v8 rootDirectory:self->_resourcePath];
  if (v15)
  {
    BOOL v16 = (void *)v15;
    uint64_t v17 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v17, OS_LOG_TYPE_DEFAULT, "CorealisRT model creation done successfully", buf, 2u);
    }
    __int16 v18 = +[VTUtilities getAssetHashFromConfigPath:v8];
    int v19 = [v6 stringByAppendingString:v18];

    goto LABEL_24;
  }

LABEL_18:
  BOOL v20 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v20, OS_LOG_TYPE_DEFAULT, "Defaulting to en_US CorealisRT model", buf, 2u);
  }
  uint64_t v21 = +[VTBlobBuilder getDefaultBlob];
  if (!v21)
  {
    double v23 = 0;
    int v19 = v6;
    goto LABEL_28;
  }
  BOOL v16 = (void *)v21;
  id v22 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v22, OS_LOG_TYPE_DEFAULT, "Default CorealisRT model creation done successfully", buf, 2u);
  }
  int v19 = [v6 stringByAppendingString:@"default config"];
  BOOL v8 = v6;
LABEL_24:

  v26[0] = @"CorealisRTModel";
  v26[1] = @"CorealisRTModelVersion";
  v27[0] = v16;
  v27[1] = v19;
  double v23 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  double v24 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    BOOL v29 = v19;
    _os_log_impl(&dword_21844F000, v24, OS_LOG_TYPE_DEFAULT, "RT Model queried - %{public}@", buf, 0xCu);
  }

LABEL_28:

  return v23;
}

- (void)_logPHSDESRecord:(const _ndsupervec *)a3
{
  desQueue = self->_desQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__VTPhraseSpotter__logPHSDESRecord___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(desQueue, block);
}

void __36__VTPhraseSpotter__logPHSDESRecord___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F3A478]) initWithBundleIdentifier:@"com.apple.fides.phs"];
  if ([v2 isPermitted]
    && ([v2 shouldMakeRecordWithFrequency:100] & 1) != 0)
  {
    double v3 = [MEMORY[0x263EFF8F8] dataWithBytes:**(void **)(a1 + 32) length:4 * *(unsigned int *)(*(void *)(a1 + 32) + 8)];
    [v2 saveRecordWithData:v3 recordInfo:MEMORY[0x263EFFA78] completion:&__block_literal_global_619];
  }
  else
  {
    unint64_t v4 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_INFO, "Skip creating PHS DES record because of lottery", v5, 2u);
    }
  }
}

void __36__VTPhraseSpotter__logPHSDESRecord___block_invoke_617(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = VTLogContextFacilityVoiceTrigger;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_error_impl(&dword_21844F000, v6, OS_LOG_TYPE_ERROR, "Error saving PHS DES record: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_INFO, "Saved PHS DES record with identifier: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_logDESRecord:(const _ndresult *)a3 result:(id)a4 isActualTrigger:(BOOL)a5
{
  id v8 = a4;
  uint64_t v9 = v8;
  if (!self->_isRunningSATEnrollment)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3810000000;
    v15[3] = "";
    long long v16 = *(_OWORD *)&a3->var0;
    uint64_t v17 = *(void *)&a3->var4;
    desQueue = self->_desQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__VTPhraseSpotter__logDESRecord_result_isActualTrigger___block_invoke;
    block[3] = &unk_264326060;
    BOOL v14 = a5;
    block[4] = self;
    uint64_t v13 = v15;
    id v12 = v8;
    dispatch_async(desQueue, block);

    _Block_object_dispose(v15, 8);
  }
}

void __56__VTPhraseSpotter__logDESRecord_result_isActualTrigger___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F3A478]) initWithBundleIdentifier:@"com.apple.fides.borealis"];
  double v3 = v2;
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v4 = 1000;
  }
  else {
    uint64_t v4 = 100;
  }
  if ([v2 shouldMakeRecordWithFrequency:v4])
  {
    uint64_t v10 = 0;
    id v5 = [*(id *)(a1 + 32) _desRecordFromTriggerData:*(void *)(*(void *)(a1 + 48) + 8) + 32 sampleCount:&v10];
    if (v5)
    {
      id v6 = (void *)[*(id *)(a1 + 40) mutableCopy];
      int v7 = [NSNumber numberWithUnsignedInteger:v10];
      [v6 setObject:v7 forKeyedSubscript:@"triggerSampleCount"];

      if (*(unsigned char *)(a1 + 56)) {
        id v8 = @"trigger";
      }
      else {
        id v8 = @"near-miss";
      }
      [v6 setObject:v8 forKeyedSubscript:@"type"];
      [v3 saveRecordWithData:v5 recordInfo:v6 completion:&__block_literal_global_612];
    }
  }
  else
  {
    uint64_t v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_INFO, "Skip creating DES record because of lottery", buf, 2u);
    }
  }
}

void __56__VTPhraseSpotter__logDESRecord_result_isActualTrigger___block_invoke_609(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = VTLogContextFacilityVoiceTrigger;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_error_impl(&dword_21844F000, v6, OS_LOG_TYPE_ERROR, "Error saving DES record: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_INFO, "Saved DES record with identifier: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_logDESRecord:(const _ndresult *)a3 result:(id)a4
{
}

- (void)_logDESTriggerRecord:(const _ndresult *)a3 result:(id)a4
{
}

- (id)_desRecordFromTriggerData:(const _ndresult *)a3 sampleCount:(unint64_t *)a4
{
  if (self->_audioBuffer)
  {
    uint64_t v9 = 0;
    unint64_t v6 = [(VTPhraseSpotter *)self _sampleLengthFrom:a3->var1 To:a3->var0];
    if (a4) {
      *a4 = v6;
    }
    id v7 = [(VTAudioCircularBuffer *)self->_audioBuffer copySamplesFrom:[(VTAudioCircularBuffer *)self->_audioBuffer sampleCount] - v6 to:[(VTAudioCircularBuffer *)self->_audioBuffer sampleCount] withNumSamplesCopiedIn:&v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_logMetaData:(id)a3
{
  v51[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    unint64_t v6 = (NSDictionary *)[v4 copy];
    lastVoiceTriggerEventInfo = self->_lastVoiceTriggerEventInfo;
    self->_lastVoiceTriggerEventInfo = v6;

    id v8 = [(VTPhraseSpotter *)self _createVTEventInfoString:v5];
    uint64_t v9 = [v5 objectForKeyedSubscript:@"isTriggerEvent"];
    int v10 = [v9 BOOLValue];

    if (self->_audioLoggingEnabled)
    {
      char v36 = [v5 objectForKey:@"captureFilePath"];
      __int16 v11 = [v5 objectForKey:@"triggerStartTime"];
      [v11 doubleValue];
      double v13 = v12;

      BOOL v14 = [v5 objectForKey:@"triggerEndTime"];
      [v14 doubleValue];
      double v16 = v15;

      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v5];
      v50[0] = @"totalSamplesAtTriggerEnd";
      char v35 = v10;
      [NSNumber numberWithUnsignedInt:self->_samplecountAtLastTriggerEnd];
      __int16 v18 = v37 = v8;
      v51[0] = v18;
      v50[1] = @"totalSamplesAtTriggerStart";
      int v19 = [NSNumber numberWithUnsignedInt:self->_samplecountAtLastTriggerStart];
      v51[1] = v19;
      v50[2] = @"totalSamplesAtEndOfCapture";
      uint64_t v20 = [NSNumber numberWithUnsignedInt:self->_samplecount];
      uint64_t v21 = (void *)v20;
      configPath = (__CFString *)self->_configPath;
      if (!configPath) {
        configPath = @"n/a";
      }
      v51[2] = v20;
      v51[3] = configPath;
      v50[3] = @"configPath";
      v50[4] = @"triggerDuration";
      double v23 = [NSNumber numberWithDouble:v16 - v13];
      v51[4] = v23;
      v50[5] = @"productVersion";
      double v24 = +[VTUtilities deviceProductVersion];
      v51[5] = v24;
      v50[6] = @"buildVersion";
      double v25 = (void *)MGCopyAnswer();
      v51[6] = v25;
      char v26 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:7];
      [v17 addEntriesFromDictionary:v26];

      id v8 = v37;
      loggingQueue = self->_loggingQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __32__VTPhraseSpotter__logMetaData___block_invoke;
      block[3] = &unk_264326018;
      id v39 = v36;
      id v40 = v17;
      char v43 = v35;
      id v41 = v5;
      id v42 = v37;
      id v28 = v17;
      id v29 = v36;
      dispatch_async(loggingQueue, block);
    }
    else
    {
      __int16 v30 = (void *)VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        if (v10) {
          uint64_t v31 = @"Trigger Event";
        }
        else {
          uint64_t v31 = @"Nearly Triggered Event";
        }
        uint64_t v32 = v30;
        v33 = [v5 objectForKeyedSubscript:@"triggerScore"];
        [v33 doubleValue];
        *(_DWORD *)buf = 138543874;
        uint64_t v45 = v31;
        __int16 v46 = 2050;
        uint64_t v47 = v34;
        __int16 v48 = 2114;
        uint64_t v49 = v8;
        _os_log_impl(&dword_21844F000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ [score %{public}7.5f]: %{public}@", buf, 0x20u);
      }
    }
  }
}

void __32__VTPhraseSpotter__logMetaData___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "stringByReplacingOccurrencesOfString:withString:options:range:", @".wav", @".json", 1, objc_msgSend(*(id *)(a1 + 32), "length") - 4, 4);
  uint64_t v3 = *(void *)(a1 + 40);
  id v15 = 0;
  id v4 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:1 error:&v15];
  id v5 = v15;
  [v4 writeToFile:v2 atomically:0];

  unint64_t v6 = VTLogContextFacilityVoiceTrigger;
  if (v5 && os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v5 localizedDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v8;
    _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "::: Error writing out metadata: %{public}@", buf, 0xCu);

    unint64_t v6 = VTLogContextFacilityVoiceTrigger;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 64)) {
      uint64_t v9 = @"Trigger Event";
    }
    else {
      uint64_t v9 = @"Nearly Triggered Event";
    }
    int v10 = *(void **)(a1 + 48);
    __int16 v11 = v6;
    double v12 = [v10 objectForKeyedSubscript:@"triggerScore"];
    [v12 doubleValue];
    uint64_t v13 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = v9;
    __int16 v18 = 2050;
    uint64_t v19 = v14;
    __int16 v20 = 2114;
    uint64_t v21 = v13;
    _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [score %{public}7.5f]: %{public}@", buf, 0x20u);
  }
}

- (id)_createVTEventInfoString:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (_createVTEventInfoString__onceToken != -1) {
    dispatch_once(&_createVTEventInfoString__onceToken, &__block_literal_global_561);
  }
  id v4 = [MEMORY[0x263F089D8] stringWithUTF8String:"\n"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)_createVTEventInfoString__printingWhiteList;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        __int16 v11 = [v3 objectForKey:v10];

        if (v11)
        {
          double v12 = NSString;
          uint64_t v13 = [v3 objectForKey:v10];
          uint64_t v14 = [v12 stringWithFormat:@"\t%@: %@\n", v10, v13, (void)v16];
          [v4 appendString:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

void __44__VTPhraseSpotter__createVTEventInfoString___block_invoke()
{
  v2[29] = *MEMORY[0x263EF8340];
  v2[0] = @"configVersion";
  v2[1] = @"languageCode";
  v2[2] = @"isSecondChance";
  v2[3] = @"triggerScore";
  v2[4] = @"effectiveThreshold";
  v2[5] = @"threshold";
  v2[6] = @"firstPassScore";
  v2[7] = @"recognizerScore";
  v2[8] = @"recognizerThresholdOffset";
  v2[9] = @"recognizerWaitTime";
  v2[10] = @"recognizerScoreScaleFactor";
  v2[11] = @"tdSpeakerRecognizerScore";
  v2[12] = @"tdSpeakerRecognizerCombinedScore";
  v2[13] = @"tdSpeakerRecognizerCombinedThreshold";
  v2[14] = @"tdSpeakerRecognizerCombinationWeight";
  v2[15] = @"satTriggered";
  v2[16] = @"satScore";
  v2[17] = @"satThreshold";
  v2[18] = @"satNumTrainingUtts";
  v2[19] = @"earlyDetectFiredTime";
  v2[20] = @"triggerStartTime";
  v2[21] = @"triggerEndTime";
  v2[22] = @"triggerFiredTime";
  v2[23] = @"triggerFireSeconds";
  v2[24] = @"extraSamplesAtStart";
  v2[25] = @"onBatteryPower";
  v2[26] = @"uptime";
  v2[27] = @"downtime";
  v2[28] = @"configDataHash";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:29];
  uint64_t v1 = (void *)_createVTEventInfoString__printingWhiteList;
  _createVTEventInfoString__printingWhiteList = v0;
}

- (void)_logPrepareProperty:(id)a3
{
  v32[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4 && self->_audioLoggingEnabled)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"AOPVoiceTriggerData"];
    if (v6)
    {
      uint64_t v7 = [v5 objectForKeyedSubscript:@"currentHostTime"];
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = [v6 objectForKeyedSubscript:@"trigger-time"];

        if (v9)
        {
          uint64_t v10 = [v5 objectForKeyedSubscript:@"currentHostTime"];
          uint64_t v11 = [v10 longLongValue];

          double v12 = [v6 objectForKeyedSubscript:@"trigger-time"];
          uint64_t v13 = [v12 longLongValue];

          v31[0] = @"trigger-woke-ap";
          uint64_t v15 = objc_msgSend(v6, "objectForKeyedSubscript:");
          long long v17 = (void *)v15;
          uint64_t v18 = MEMORY[0x263EFFA80];
          if (v15) {
            uint64_t v18 = v15;
          }
          v32[0] = v18;
          v31[1] = @"trigger-start-time";
          float v14 = (double)(v13 - v11) / 24000.0;
          *(float *)&double v16 = v14;
          long long v19 = [NSNumber numberWithFloat:v16];
          v32[1] = v19;
          v31[2] = @"trigger-time";
          __int16 v20 = [NSNumber numberWithLongLong:v13];
          void v32[2] = v20;
          v31[3] = @"currentHostTime";
          uint64_t v21 = [NSNumber numberWithLongLong:v11];
          v32[3] = v21;
          uint64_t v22 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];

          double v23 = VTMakeTimestampedAudioLogFilenameWithPrefixAndSuffix(&stru_26C99F218, &stru_26C99F218);
          double v24 = [(VTPhraseSpotter *)self _capturePathWithPrefix:v23 eventKind:3];
          loggingQueue = self->_loggingQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __39__VTPhraseSpotter__logPrepareProperty___block_invoke;
          block[3] = &unk_264325FF0;
          id v29 = v24;
          id v30 = v22;
          id v26 = v22;
          id v27 = v24;
          dispatch_async(loggingQueue, block);
        }
      }
    }
  }
}

void __39__VTPhraseSpotter__logPrepareProperty___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) stringByReplacingOccurrencesOfString:@".wav" withString:@".json"];
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  id v4 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:1 error:&v9];
  id v5 = v9;
  if (v5)
  {
    uint64_t v6 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v6;
      uint64_t v8 = [v5 localizedDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "::: Error writing out prepare property: %{public}@", buf, 0xCu);
    }
  }
  [v4 writeToFile:v2 atomically:0];
}

- (void)_logCorruptAudio
{
  v18[2] = *MEMORY[0x263EF8340];
  if (self->_audioLoggingEnabled)
  {
    uint64_t v3 = VTMakeTimestampedAudioLogFilenameWithPrefixAndSuffix(&stru_26C99F218, &stru_26C99F218);
    id v4 = [(VTPhraseSpotter *)self _capturePathWithPrefix:v3 eventKind:4];
    uint64_t v5 = [(VTCorruptDetector *)self->_corruptDetector getMaxZeroSampleCount];
    int v6 = v5;
    v17[0] = @"num-zero-samples";
    uint64_t v7 = [NSNumber numberWithInt:v5];
    v17[1] = @"zero-in-seconds";
    v18[0] = v7;
    *(float *)&double v8 = (float)v6 / 16000.0;
    id v9 = [NSNumber numberWithFloat:v8];
    v18[1] = v9;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

    loggingQueue = self->_loggingQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__VTPhraseSpotter__logCorruptAudio__block_invoke;
    block[3] = &unk_264325FF0;
    id v15 = v4;
    id v16 = v10;
    id v12 = v10;
    id v13 = v4;
    dispatch_async(loggingQueue, block);
  }
}

void __35__VTPhraseSpotter__logCorruptAudio__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) stringByReplacingOccurrencesOfString:@".wav" withString:@".json"];
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  id v4 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:1 error:&v9];
  id v5 = v9;
  if (v5)
  {
    int v6 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v6;
      double v8 = [v5 localizedDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "::: Error writing out prepare property: %{public}@", buf, 0xCu);
    }
  }
  [v4 writeToFile:v2 atomically:0];
}

- (id)_analyzeMakeResult:(const _ndresult *)a3 eventKind:(unsigned __int8)a4 satScore:(double)a5
{
  v120[29] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    id v16 = 0;
    goto LABEL_58;
  }
  int v6 = a4;
  +[VTUtilities systemUpTime];
  double v10 = v9;
  unsigned int var1 = a3->var1;
  float samplerate = (float)self->_samplerate;
  double v13 = (float)((float)(a3->var0 - var1) / samplerate);
  double v14 = (float)((float)(a3->var0 - a3->var2) / samplerate);
  if (self->_audioLoggingEnabled)
  {
    v116 = VTMakeTimestampedAudioLogFilenameWithPrefixAndSuffix(&stru_26C99F218, &stru_26C99F218);
    uint64_t v15 = -[VTPhraseSpotter _capturePathWithPrefix:eventKind:](self, "_capturePathWithPrefix:eventKind:");
    unsigned int var1 = a3->var1;
  }
  else
  {
    uint64_t v15 = 0;
    v116 = 0;
  }
  double v17 = v10 - v13;
  double v18 = v10 - v14;
  self->_samplecountAtRealTriggerStart = var1;
  unsigned int extraSamplesAtStart = self->_extraSamplesAtStart;
  unsigned int v20 = a3->var1;
  if (extraSamplesAtStart >= v20) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = extraSamplesAtStart;
  }
  BOOL v22 = v20 >= extraSamplesAtStart;
  unsigned int v23 = v20 - extraSamplesAtStart;
  if (!v22) {
    unsigned int v23 = 0;
  }
  self->_samplecountAtLastTriggerStart = v23;
  self->_samplecountAtLastTriggerEnd = a3->var2;
  self->_lastSupervecScore = a5;
  double v24 = (double)(self->_samplecount - v23) / 16000.0;
  v115 = (void *)v15;
  if (v6 || self->_numFramesFromPreTrigger)
  {
    v113 = 0;
    v114 = 0;
  }
  else
  {
    int v85 = +[VTAggregator sharedAggregator];
    id v117 = 0;
    id v118 = 0;
    [v85 cumulativeUptime:&v118 cumulativeDowntime:&v117 reset:1];
    id v86 = v118;
    id v87 = v117;

    v114 = v86;
    [v86 floatValue];
    self->_lastUptime = v88;
    v113 = v87;
    [v87 floatValue];
    self->_lastDowntime = v89;
  }
  int v110 = v6;
  uint64_t v25 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:3 forLanguageCode:self->_languageCode];
  uint64_t v26 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:2 forLanguageCode:self->_languageCode];
  triggerPhrases = self->_triggerPhrases;
  if (!triggerPhrases) {
    triggerPhrases = (NSArray *)MEMORY[0x263EFFA68];
  }
  v120[0] = triggerPhrases;
  v119[0] = @"triggerPhrases";
  v119[1] = @"triggerScore";
  v109 = [NSNumber numberWithDouble:self->_lastScore];
  v120[1] = v109;
  v119[2] = @"earlyDetectFiredTime";
  v108 = [NSNumber numberWithDouble:self->_earlyDetectTime];
  v120[2] = v108;
  v119[3] = @"triggerStartTime";
  double v107 = [NSNumber numberWithDouble:v17];
  v120[3] = v107;
  v119[4] = @"triggerEndTime";
  double v106 = [NSNumber numberWithDouble:v10 - v14];
  v120[4] = v106;
  v119[5] = @"triggerFiredTime";
  v105 = [NSNumber numberWithDouble:v10];
  v120[5] = v105;
  v119[6] = @"triggerFireSeconds";
  v104 = [NSNumber numberWithDouble:v24];
  v120[6] = v104;
  v119[7] = @"isTriggerEvent";
  BOOL v90 = v6 == 0;
  v103 = [NSNumber numberWithInt:v6 == 0];
  v120[7] = v103;
  v119[8] = @"numFramesFromPreTrigger";
  v102 = [NSNumber numberWithInt:self->_numFramesFromPreTrigger];
  v120[8] = v102;
  v119[9] = @"isMaximized";
  double v101 = [NSNumber numberWithBool:self->_isMaximized];
  v120[9] = v101;
  v119[10] = @"extraSamplesAtStart";
  double v100 = [NSNumber numberWithUnsignedInt:v21];
  v120[10] = v100;
  v119[11] = @"isSecondChance";
  double v99 = [NSNumber numberWithBool:self->_isSecondChanceEffective];
  v120[11] = v99;
  v119[12] = @"threshold";
  v98 = [NSNumber numberWithDouble:self->_threshold];
  v120[12] = v98;
  v119[13] = @"effectiveThreshold";
  v97 = [NSNumber numberWithDouble:self->_effectiveThreshold];
  v120[13] = v97;
  v119[14] = @"hardwareSamplerate";
  v96 = [NSNumber numberWithDouble:self->_hardwareSampleRate];
  v120[14] = v96;
  v119[15] = @"uptime";
  v95 = [NSNumber numberWithDouble:self->_lastUptime];
  v120[15] = v95;
  v119[16] = @"downtime";
  v94 = [NSNumber numberWithDouble:self->_lastDowntime];
  v120[16] = v94;
  v119[17] = @"didWakeAP";
  v93 = [NSNumber numberWithBool:self->_didWakeAP];
  v120[17] = v93;
  v119[18] = @"onBatteryPower";
  id v28 = NSNumber;
  double v92 = +[VTBatteryMonitor sharedInstance];
  double v91 = objc_msgSend(v28, "numberWithInt:", objc_msgSend(v92, "batteryState") == 2);
  v120[18] = v91;
  v119[19] = @"siriIsActiveOrOtherAssertion";
  id v29 = NSNumber;
  id v30 = +[VTSiriAssertionMonitor sharedInstance];
  uint64_t v31 = objc_msgSend(v29, "numberWithBool:", objc_msgSend(v30, "isEnabled"));
  uint64_t v32 = (void *)v31;
  configVersion = (__CFString *)self->_configVersion;
  if (!configVersion) {
    configVersion = @"n/a";
  }
  v120[19] = v31;
  v120[20] = configVersion;
  v119[20] = @"configVersion";
  v119[21] = @"languageCode";
  languageCode = (__CFString *)self->_languageCode;
  if (!languageCode) {
    languageCode = @"n/a";
  }
  v120[21] = languageCode;
  v119[22] = @"deviceHandHeld";
  uint64_t v35 = objc_msgSend(NSNumber, "numberWithBool:", -[VTPhraseSpotter _isDeviceHandheld](self, "_isDeviceHandheld"));
  char v36 = (void *)v35;
  configData = (__CFString *)self->_configData;
  if (!configData) {
    configData = @"n/a";
  }
  v120[22] = v35;
  v120[23] = configData;
  v119[23] = @"configDataHash";
  v119[24] = @"biometricClue";
  int64_t v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VTPhraseSpotter _getBiometricMatchResult](self, "_getBiometricMatchResult"));
  v120[24] = v38;
  v119[25] = @"numberOfHSPayloadUtterances";
  v112 = (void *)v25;
  id v39 = objc_msgSend(NSNumber, "numberWithInteger:", -[VTPhraseSpotter _getNumberOfAudioFilesInDirectory:](self, "_getNumberOfAudioFilesInDirectory:", v25));
  v120[25] = v39;
  v119[26] = @"numberOfPayloadUtterances";
  v111 = (void *)v26;
  id v40 = objc_msgSend(NSNumber, "numberWithInteger:", -[VTPhraseSpotter _getNumberOfAudioFilesInDirectory:](self, "_getNumberOfAudioFilesInDirectory:", v26));
  v120[26] = v40;
  v119[27] = @"lastConsecutivePHSRejects";
  id v41 = [NSNumber numberWithDouble:self->_consecutivePHSRejects];
  v120[27] = v41;
  v119[28] = @"deltaTimeFromlastPHSReject";
  double consecutivePHSRejects = self->_consecutivePHSRejects;
  if (consecutivePHSRejects == 0.0)
  {
    uint64_t v45 = &unk_26C9A8A68;
  }
  else
  {
    char v43 = NSNumber;
    +[VTUtilities systemUpTime];
    uint64_t v45 = [v43 numberWithDouble:v44 - self->_lastPHSRejectedTime];
  }
  v120[28] = v45;
  __int16 v46 = [NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:29];
  if (consecutivePHSRejects != 0.0) {

  }
  if (v115)
  {
    uint64_t v47 = (void *)[v46 mutableCopy];
    [v47 setObject:v115 forKey:@"captureFilePath"];

    if (self->_audioBuffer)
    {
      unint64_t v48 = [(VTPhraseSpotter *)self _sampleLengthFrom:self->_samplecountAtLastTriggerStart To:self->_samplecount];
      audioBuffer = self->_audioBuffer;
      unint64_t v50 = [(VTAudioCircularBuffer *)audioBuffer sampleCount] - v48;
      unint64_t v51 = [(VTAudioCircularBuffer *)self->_audioBuffer sampleCount];
      v52 = [NSURL URLWithString:v115];
      [(VTAudioCircularBuffer *)audioBuffer saveRecordingBufferFrom:v50 to:v51 toURL:v52];

      if (self->_isSecondPass) {
        [(VTTextDependentSpeakerRecognizer *)self->_satDetectionTdSr logWithAudioFilepath:v115];
      }
    }
  }
  else
  {
    uint64_t v47 = v46;
  }
  if (!self->_isRunningSATDetection)
  {
    v53 = v47;
    goto LABEL_37;
  }
  v53 = (void *)[v47 mutableCopy];
  uint64_t v54 = [NSNumber numberWithDouble:a5];
  [v53 setObject:v54 forKey:@"satScore"];

  v55 = [NSNumber numberWithDouble:self->_thresholdSAT];
  [v53 setObject:v55 forKey:@"satThreshold"];

  int v56 = [NSNumber numberWithInt:v90];
  [v53 setObject:v56 forKey:@"satTriggered"];

  id v57 = [NSNumber numberWithBool:self->_implicitlyTrained];
  [v53 setObject:v57 forKey:@"satBeingTrained"];

  uint64_t v58 = [(VTAnalyzerNDAPI *)self->_analyzer getSATVectorCount];
  uint64_t v59 = [NSNumber numberWithInt:v58];
  [v53 setObject:v59 forKey:@"satNumTrainingUtts"];

  if (v110)
  {
    if (v110 == 1)
    {
      +[VTUtilities systemUpTime];
      self->_lastPHSRejectedTime = v60;
      double v61 = self->_consecutivePHSRejects + 1.0;
      goto LABEL_62;
    }
LABEL_37:
    if (!self->_isRunningRecognizer) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  self->_lastPHSRejectedTime = -INFINITY;
  double v61 = 0.0;
LABEL_62:
  self->_double consecutivePHSRejects = v61;
  if (self->_isRunningRecognizer)
  {
LABEL_38:
    v62 = (void *)[v53 mutableCopy];
    id v63 = [NSNumber numberWithDouble:self->_recognizerScore];
    [v62 setObject:v63 forKey:@"recognizerScore"];

    id v64 = [NSNumber numberWithDouble:self->_recognizerThresholdOffset];
    [v62 setObject:v64 forKey:@"recognizerThresholdOffset"];

    uint64_t v65 = [NSNumber numberWithDouble:self->_recognizerWaitTime];
    [v62 setObject:v65 forKey:@"recognizerWaitTime"];

    uint64_t v66 = [NSNumber numberWithDouble:self->_recognizerScoreScaleFactor];
    [v62 setObject:v66 forKey:@"recognizerScoreScaleFactor"];

    v53 = v62;
  }
LABEL_39:
  if (self->_isSecondPass)
  {
    satDetectionTdSr = self->_satDetectionTdSr;
    if (satDetectionTdSr)
    {
      if ([(VTTextDependentSpeakerRecognizer *)satDetectionTdSr tdPsrCanProcessRequest])
      {
        [(VTTextDependentSpeakerRecognizer *)self->_satDetectionTdSr lastRequestSatScore];
        if (v68 > 0.0)
        {
          double v69 = (void *)[v53 mutableCopy];
          v70 = NSNumber;
          [(VTTextDependentSpeakerRecognizer *)self->_satDetectionTdSr lastRequestSatScore];
          id v71 = objc_msgSend(v70, "numberWithFloat:");
          [v69 setObject:v71 forKeyedSubscript:@"tdSpeakerRecognizerScore"];

          v72 = [NSNumber numberWithDouble:self->_lastCombinedTdSpeakerRecognizerSATScore];
          [v69 setObject:v72 forKeyedSubscript:@"tdSpeakerRecognizerCombinedScore"];

          double v73 = [NSNumber numberWithDouble:self->_tdSpeakerRecognizerSATThreshold];
          [v69 setObject:v73 forKeyedSubscript:@"tdSpeakerRecognizerCombinedThreshold"];

          v74 = [NSNumber numberWithDouble:self->_tdSpeakerRecognizerCombinationWeight];
          [v69 setObject:v74 forKeyedSubscript:@"tdSpeakerRecognizerCombinationWeight"];

          v53 = v69;
        }
      }
    }
  }
  if (self->_injectedAudioFilePath)
  {
    v75 = (void *)[v53 mutableCopy];
    [v75 setObject:self->_injectedAudioFilePath forKeyedSubscript:@"injectedAudioFilePath"];

    v53 = v75;
  }
  id v16 = (void *)[v53 mutableCopy];
  if (self->_earlyDetecFiredMachTime)
  {
    v76 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    [v16 setObject:v76 forKey:@"earlyDetectFiredMachTime"];
  }
  if (self->_triggerStartMachTime)
  {
    unint64_t v77 = -[VTPhraseSpotter _addExtraTime:to:](self, "_addExtraTime:to:", v18 - v17);
    v78 = [NSNumber numberWithUnsignedLongLong:self->_triggerStartMachTime];
    [v16 setObject:v78 forKey:@"triggerStartMachTime"];

    BOOL v79 = [NSNumber numberWithUnsignedLongLong:v77];
    [v16 setObject:v79 forKey:@"triggerEndMachTime"];
  }
  if (self->_triggerFireMachTime)
  {
    v80 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    [v16 setObject:v80 forKey:@"triggerFireMachTime"];
  }
  if (!self->_triggerStartMachTime && self->_triggerFireMachTime)
  {
    unint64_t v81 = -[VTPhraseSpotter _applyExtraTime:to:](self, "_applyExtraTime:to:", v14);
    v82 = [NSNumber numberWithUnsignedLongLong:v81];
    [v16 setObject:v82 forKey:@"triggerEndMachTime"];
  }
  if (self->_isSecondPass)
  {
    v83 = [NSNumber numberWithDouble:self->_firstPassScore];
    [v16 setObject:v83 forKey:@"firstPassScore"];
  }
LABEL_58:

  return v16;
}

- (void)_analyzeResetWithOption:(unsigned __int8)a3
{
  ndetectQueue = self->_ndetectQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__VTPhraseSpotter__analyzeResetWithOption___block_invoke;
  v4[3] = &unk_264325FC8;
  v4[4] = self;
  unsigned __int8 v5 = a3;
  dispatch_sync(ndetectQueue, v4);
}

uint64_t __43__VTPhraseSpotter__analyzeResetWithOption___block_invoke(uint64_t a1)
{
  if (+[VTUtilities VTIsHorseman])
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
LABEL_5:
    uint64_t result = [v2 reset];
    goto LABEL_6;
  }
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (*(unsigned char *)(a1 + 40) != 1) {
    goto LABEL_5;
  }
  uint64_t result = [v2 resetBest];
LABEL_6:
  *(void *)(*(void *)(a1 + 32) + 416) = 0xFFF0000000000000;
  *(unsigned char *)(*(void *)(a1 + 32) + 52) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 424) = 0;
  *(void *)(*(void *)(a1 + 32) + 432) = 0;
  *(void *)(*(void *)(a1 + 32) + 664) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
  *(void *)(*(void *)(a1 + 32) + 400) = 0;
  *(void *)(*(void *)(a1 + 32) + 408) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 372) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 376) = 0;
  return result;
}

- (double)_computeSATScore:(const _ndresult *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = [(VTAnalyzerNDAPI *)self->_analyzer getSuperVectorWithEndPoint:a3->var2];
  unsigned __int8 v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    int v6 = @"NO";
    if (v4 && v4->var0) {
      int v6 = @"YES";
    }
    int v10 = 138543362;
    uint64_t v11 = v6;
    _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_INFO, "::: getting supervector successful? %{public}@", (uint8_t *)&v10, 0xCu);
  }
  double v7 = 0.0;
  if (v4)
  {
    double v8 = [(VTAnalyzerNDAPI *)self->_analyzer analyzeSAT:v4->var0 size:v4->var1];
    if (v8) {
      return v8->var0;
    }
  }
  return v7;
}

- (id)_analyzeEvents:(const _ndresult *)a3
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  if (!a3) {
    goto LABEL_13;
  }
  unsigned int samplecount = self->_samplecount;
  unsigned int var0 = a3->var0;
  self->_unsigned int samplecount = a3->var0;
  uint64_t v7 = var0 - samplecount;
  if (var0 >= samplecount)
  {
    unsigned int lastEventEnd = self->_lastEventEnd;
  }
  else
  {
    unsigned int lastEventEnd = 0;
    self->_unsigned int lastEventEnd = 0;
    self->_unsigned int sampleCountAtFirstChance = 0;
  }
  int nearMissLogPreDelayTimer = self->_nearMissLogPreDelayTimer;
  if (nearMissLogPreDelayTimer >= 0) {
    int v10 = v7;
  }
  else {
    int v10 = 0;
  }
  self->_int nearMissLogPreDelayTimer = nearMissLogPreDelayTimer - v10;
  if (a3->var1 < lastEventEnd)
  {
    uint64_t v11 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "::: Not a new event. Must reset scores", buf, 2u);
    }
    uint64_t v12 = self;
    uint64_t v13 = 1;
LABEL_12:
    [(VTPhraseSpotter *)v12 _analyzeResetWithOption:v13];
LABEL_13:
    double v14 = 0;
    goto LABEL_14;
  }
  float var4 = a3->var4;
  if (self->_isRunningRecognizer)
  {
    [(VTTranscriber *)self->_transcriber triggerConfidence];
    self->_recognizerScore = v17;
    float var4 = var4 + v17 * self->_recognizerScoreScaleFactor;
  }
  double v18 = var4;
  self->_isMaximized = self->_lastScore >= v18;
  self->_lastScore = v18;
  if (self->_isSecondPass)
  {
    double secondPassBestScore = self->_secondPassBestScore;
    if (secondPassBestScore < v18) {
      double secondPassBestScore = v18;
    }
    self->_double secondPassBestScore = secondPassBestScore;
  }
  int heartbeatCounter = self->_heartbeatCounter;
  self->_int heartbeatCounter = heartbeatCounter + 1;
  HIDWORD(v21) = -286331153 * heartbeatCounter + 143165576;
  LODWORD(v21) = HIDWORD(v21);
  if ((v21 >> 1) <= 0x8888888)
  {
    BOOL v22 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
    {
      unsigned int v23 = self->_samplecount;
      *(_DWORD *)buf = 67240448;
      *(_DWORD *)BOOL v90 = v23;
      *(_WORD *)&v90[4] = 2050;
      *(double *)&v90[6] = v18;
      _os_log_impl(&dword_21844F000, v22, OS_LOG_TYPE_INFO, "::: heartbeat: %{public}u score: %{public}f", buf, 0x12u);
    }
  }
  if (!self->_isRunningSATEnrollment && a3->var5 && !self->_earlyDetected)
  {
    self->_earlyDetected = 1;
    id v40 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v40, OS_LOG_TYPE_DEFAULT, "::: Early detect.  Send a notification to preheat.", buf, 2u);
    }
    kdebug_trace();
    +[VTUtilities systemUpTime];
    self->_earlyDetectTime = v41;
    self->_earlyDetecFiredMachTime = mach_absolute_time();
    id v42 = +[VTPreferences sharedPreferences];
    int v43 = [v42 useSiriActivationSPIForiOS];

    if (v43)
    {
      AFSiriActivationBuiltInMicVoiceTriggerPrewarm();
    }
    else
    {
      notify_post("com.apple.voicetrigger.EarlyDetect");
      v76 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21844F000, v76, OS_LOG_TYPE_DEFAULT, "Use legacy notification", buf, 2u);
      }
    }
  }
  unsigned int var1 = a3->var1;
  unsigned int sampleCountAtFirstChance = self->_sampleCountAtFirstChance;
  self->_isSecondChanceEffective = 0;
  if (var1 >= sampleCountAtFirstChance)
  {
    BOOL v28 = [(VTPhraseSpotter *)self _getSecondChanceEffective];
    double threshold = self->_threshold;
    self->_effectiveThreshold = threshold;
    p_effectiveThreshold = &self->_effectiveThreshold;
    self->_isSecondChanceEffective = v28;
    if (v28)
    {
      if (threshold >= self->_thresholdSecondChance) {
        double threshold = self->_thresholdSecondChance;
      }
      self->_effectiveThreshold = threshold;
    }
  }
  else
  {
    double threshold = self->_threshold;
    self->_effectiveThreshold = threshold;
    p_effectiveThreshold = &self->_effectiveThreshold;
  }
  if (self->_isRunningRecognizer) {
    self->_effectiveThreshold = self->_recognizerThresholdOffset + threshold;
  }
  BOOL doSuperVectorSecondaryTest = self->_doSuperVectorSecondaryTest;
  uint64_t v30 = 128;
  if (self->_doSuperVectorSecondaryTest) {
    uint64_t v30 = 336;
  }
  if (*(double *)((char *)&self->super.isa + v30) <= v18)
  {
    if (self->_isSecondPass) {
      self->_secondPassAccepted = 1;
    }
    if (self->_isSuperVectorNeeded)
    {
      id v37 = [(VTAnalyzerNDAPI *)self->_analyzer getSuperVectorWithEndPoint:a3->var2];
      int64_t v38 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
      {
        id v39 = @"NO";
        if (v37 && v37->var0) {
          id v39 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        *(void *)BOOL v90 = v39;
        _os_log_impl(&dword_21844F000, v38, OS_LOG_TYPE_INFO, "::: getting supervector successful? %{public}@", buf, 0xCu);
      }
      if (!v37 || !v37->var0 || !v37->var1)
      {
        double v44 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21844F000, v44, OS_LOG_TYPE_DEFAULT, "supervector is not available, cannot proceed", buf, 2u);
        }
        uint64_t v12 = self;
        uint64_t v13 = 0;
        goto LABEL_12;
      }
      BOOL doSuperVectorSecondaryTest = self->_doSuperVectorSecondaryTest;
    }
    else
    {
      id v37 = 0;
    }
    if (doSuperVectorSecondaryTest)
    {
      uint64_t v45 = [(VTAnalyzerNDAPI *)self->_analyzer getScoreSuperVector:v37->var0 size:v37->var1];
      if (v45)
      {
        double v46 = v45->var0;
        self->_lastSupervecScore = v46;
        uint64_t v47 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          *(double *)BOOL v90 = v46;
          _os_log_impl(&dword_21844F000, v47, OS_LOG_TYPE_DEFAULT, "::: supervector score is computed: %{public}.3f", buf, 0xCu);
        }
        if (*p_effectiveThreshold <= v46)
        {
          int v51 = 1;
          goto LABEL_84;
        }
        if (var1 >= sampleCountAtFirstChance && self->_thresholdSecondChance < v46)
        {
          unint64_t v48 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v49 = a3->var1;
            unsigned int var2 = a3->var2;
            *(_DWORD *)buf = 134349568;
            *(double *)BOOL v90 = v18;
            *(_WORD *)&v90[8] = 1026;
            *(_DWORD *)&v90[10] = v49;
            *(_WORD *)&v90[14] = 1026;
            *(_DWORD *)&v90[16] = var2;
            _os_log_impl(&dword_21844F000, v48, OS_LOG_TYPE_DEFAULT, "::: Detected a second chance trigger - 1st of 2 [score: %{public}5.3f]  start: %{public}d end: %{public}d", buf, 0x18u);
          }
          self->_unsigned int sampleCountAtFirstChance = a3->var2;
          [(VTPhraseSpotter *)self _setSecondChance];
          [(VTPhraseSpotter *)self _storeFirstChanceAudio];
          [(VTPhraseSpotter *)self _createFirstChanceMeta:a3];
        }
        [(VTPhraseSpotter *)self _analyzeResetWithOption:0];
      }
    }
    int v51 = 0;
LABEL_84:
    self->_implicitlyTrained = 0;
    lastImplicitlyTrainedAudioFile = self->_lastImplicitlyTrainedAudioFile;
    self->_lastImplicitlyTrainedAudioFile = 0;

    double v53 = 0.0;
    if (!self->_isRunningSATDetection
      || !self->_isMaximized
      || (double thresholdSAT = self->_thresholdSAT,
          (v55 = [(VTAnalyzerNDAPI *)self->_analyzer analyzeSAT:v37->var0 size:v37->var1]) == 0))
    {
      BOOL v71 = 0;
      BOOL v72 = 1;
      if (!self->_isRunningSATEnrollment)
      {
LABEL_110:
        if (self->_doSuperVectorSecondaryTest)
        {
          if (self->_isRunningSATDetection) {
            int v78 = v51;
          }
          else {
            int v78 = 1;
          }
          if (!self->_isRunningSATDetection) {
            BOOL v71 = v51;
          }
          if (v78 != 1) {
            goto LABEL_120;
          }
        }
        else if (!self->_isRunningSATDetection)
        {
          if (!self->_isMaximized) {
            goto LABEL_120;
          }
          goto LABEL_127;
        }
        if (!v71) {
          goto LABEL_120;
        }
LABEL_127:
        self->_triggerFireMachTime = mach_absolute_time();
        BOOL v79 = [(VTPhraseSpotter *)self _handleTriggerEvent:a3 num_new_samples:v7 satScore:v53];
        if (self->_isSecondPass && !self->_secondPassTriggered)
        {
          self->_secondPassTriggered = 1;
          unint64_t v81 = +[VTAggregator sharedAggregator];
          [v81 logSecondPassResult:1];

          if (self->_secondPassAudioLoggingEnabled)
          {
            v82 = +[VTAudioFileLog sharedInstance];
            [v82 stopRecording];
          }
        }
        goto LABEL_131;
      }
LABEL_95:
      if (!self->_isMaximized)
      {
LABEL_120:
        BOOL v79 = 0;
LABEL_131:
        char v83 = !self->_isRunningSATDetection || v72;
        if (v83)
        {
          double v14 = v79;
        }
        else
        {
          double v14 = [(VTPhraseSpotter *)self _analyzeMakeResult:a3 eventKind:1 satScore:v53];

          if (+[VTUtilities isInternalInstall])
          {
            v84 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21844F000, v84, OS_LOG_TYPE_DEFAULT, "Sending PHS reject notification", buf, 2u);
            }
            notify_post("com.apple.voicetrigger.PHSReject");
          }
          [(VTPhraseSpotter *)self _logMetaData:v14];
          [(VTPhraseSpotter *)self _analyzeResetWithOption:0];
          self->_unsigned int lastEventEnd = a3->var2;
        }
        goto LABEL_14;
      }
      if ([(VTAnalyzerNDAPI *)self->_analyzer analyzeSAT:v37->var0 size:v37->var1]) {
        [(VTAnalyzerNDAPI *)self->_analyzer updateSAT];
      }
      goto LABEL_127;
    }
    double v53 = v55->var0;
    self->_lastCombinedTdSpeakerRecognizerSATScore = v53;
    if (!self->_isSecondPass
      || (satDetectionTdSr = self->_satDetectionTdSr) == 0
      || ![(VTTextDependentSpeakerRecognizer *)satDetectionTdSr tdPsrCanProcessRequest])
    {
      intptr_t v59 = 0;
      double v73 = v53;
      goto LABEL_99;
    }
    id v57 = [MEMORY[0x263EFF910] date];
    dispatch_time_t v58 = dispatch_time(0, 300000000);
    intptr_t v59 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_satDetectionTdSrSemaphore, v58);
    double v60 = [MEMORY[0x263EFF910] date];
    [v60 timeIntervalSinceDate:v57];
    double v62 = v61 * 1000.0;
    id v63 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      id v64 = self->_satDetectionTdSr;
      uint64_t v65 = v63;
      [(VTTextDependentSpeakerRecognizer *)v64 lastRequestSatScore];
      double tdSpeakerRecognizerCombinationWeight = self->_tdSpeakerRecognizerCombinationWeight;
      double tdSpeakerRecognizerSATThreshold = self->_tdSpeakerRecognizerSATThreshold;
      *(_DWORD *)buf = 138544642;
      *(void *)BOOL v90 = v64;
      *(_WORD *)&v90[8] = 2050;
      *(void *)&v90[10] = v59;
      *(_WORD *)&v90[18] = 2050;
      double v91 = v62;
      __int16 v92 = 2050;
      double v93 = v68;
      __int16 v94 = 2050;
      double v95 = tdSpeakerRecognizerCombinationWeight;
      __int16 v96 = 2050;
      double v97 = tdSpeakerRecognizerSATThreshold;
      _os_log_impl(&dword_21844F000, v65, OS_LOG_TYPE_DEFAULT, "TDSR:: SATDetection: Done Waiting with _satDetectionTdSr: %{public}@, psrTDTimedOut=%{public}ld, tdPsrSATDetectionWaitTimeMs: %{public}fms, _lastTdSpeakerRecognizerSATScore=%{public}f, _tdSpeakerRecognizerCombinationWeight=%{public}f, _tdSpeakerRecognizerSATThreshold: %{public}f", buf, 0x3Eu);
    }
    double v69 = +[VTAggregator sharedAggregator];
    v70 = v69;
    if (v59)
    {
      [v69 logTdPsrSATDetectionTimedOut];
    }
    else
    {
      [v69 logTdPsrSATDetectionWaitTimeMs:v62];

      if (self->_tdSpeakerRecognizerCombinationWeight > 0.0)
      {
        [(VTTextDependentSpeakerRecognizer *)self->_satDetectionTdSr lastRequestSatScore];
        double v73 = v53;
        if (v85 > 0.0)
        {
          double v86 = self->_tdSpeakerRecognizerCombinationWeight;
          [(VTTextDependentSpeakerRecognizer *)self->_satDetectionTdSr lastRequestSatScore];
          double v73 = v86 * v87 + (1.0 - v86) * v53;
          self->_lastCombinedTdSpeakerRecognizerSATScore = v73;
          double thresholdSAT = self->_tdSpeakerRecognizerSATThreshold;
        }
        goto LABEL_145;
      }
    }
    double v73 = v53;
LABEL_145:

LABEL_99:
    v74 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349568;
      *(double *)BOOL v90 = v53;
      *(_WORD *)&v90[8] = 2050;
      *(double *)&v90[10] = v73;
      *(_WORD *)&v90[18] = 2050;
      double v91 = thresholdSAT;
      _os_log_impl(&dword_21844F000, v74, OS_LOG_TYPE_DEFAULT, ":::[SAT Result] SAT score: %{public}f, combinedScore=%{public}f, vs threshold %{public}f", buf, 0x20u);
    }
    BOOL v71 = v73 >= thresholdSAT;
    if (v73 < thresholdSAT)
    {
      unint64_t v77 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349568;
        *(double *)BOOL v90 = v53;
        *(_WORD *)&v90[8] = 2050;
        *(double *)&v90[10] = v73;
        *(_WORD *)&v90[18] = 2050;
        double v91 = thresholdSAT;
        _os_log_impl(&dword_21844F000, v77, OS_LOG_TYPE_DEFAULT, ":::[SAT Rejection] SAT rejected (SAT {satScore=[%{public}f], combinedScore=[%{public}f]} < threshold [%{public}f])", buf, 0x20u);
      }
    }
    else
    {
      ndetectQueue = self->_ndetectQueue;
      v88[0] = MEMORY[0x263EF8330];
      v88[1] = 3221225472;
      v88[2] = __34__VTPhraseSpotter__analyzeEvents___block_invoke_540;
      v88[3] = &unk_264325FA0;
      v88[4] = self;
      v88[5] = v59;
      dispatch_sync(ndetectQueue, v88);
    }
    [(VTPhraseSpotter *)self _logPHSDESRecord:v37];
    BOOL v72 = v73 >= thresholdSAT;
    if (!self->_isRunningSATEnrollment) {
      goto LABEL_110;
    }
    goto LABEL_95;
  }
  double v14 = 0;
  if (!self->_doSuperVectorSecondaryTest && self->_isMaximized)
  {
    double thresholdLogNearMisses = self->_thresholdLogNearMisses;
    if (var1 >= sampleCountAtFirstChance && self->_thresholdSecondChance < v18)
    {
      uint64_t v32 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v33 = a3->var1;
        unsigned int v34 = a3->var2;
        *(_DWORD *)buf = 134349568;
        *(double *)BOOL v90 = v18;
        *(_WORD *)&v90[8] = 1026;
        *(_DWORD *)&v90[10] = v33;
        *(_WORD *)&v90[14] = 1026;
        *(_DWORD *)&v90[16] = v34;
        _os_log_impl(&dword_21844F000, v32, OS_LOG_TYPE_DEFAULT, "::: Detected a second chance trigger - 1st of 2 [score: %{public}5.3f]  start: %{public}d end: %{public}d", buf, 0x18u);
      }
      self->_unsigned int sampleCountAtFirstChance = a3->var2;
      [(VTPhraseSpotter *)self _setSecondChance];
      [(VTPhraseSpotter *)self _storeFirstChanceAudio];
      [(VTPhraseSpotter *)self _createFirstChanceMeta:a3];
    }
    if (thresholdLogNearMisses >= v18) {
      goto LABEL_13;
    }
    if (self->_nearMissLogPending)
    {
      int v35 = self->_nearMissLogPreDelayTimer;
      if ((v35 & 0x80000000) == 0)
      {
        char v36 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)BOOL v90 = v35;
          _os_log_impl(&dword_21844F000, v36, OS_LOG_TYPE_INFO, "::: will log in %{public}d elapsed samples", buf, 8u);
        }
        goto LABEL_13;
      }
      [(VTPhraseSpotter *)self _computeSATScore:a3];
      double v14 = -[VTPhraseSpotter _analyzeMakeResult:eventKind:satScore:](self, "_analyzeMakeResult:eventKind:satScore:", a3, 2);
      if (+[VTUtilities isInternalInstall])
      {
        v80 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21844F000, v80, OS_LOG_TYPE_DEFAULT, "Sending near trigger notification", buf, 2u);
        }
        notify_post("com.apple.voicetrigger.NearTrigger");
      }
      [(VTPhraseSpotter *)self _logMetaData:v14];
      [(VTPhraseSpotter *)self _logDESRecord:a3 result:v14];
      [(VTPhraseSpotter *)self _analyzeResetWithOption:1];
    }
    else
    {
      double v14 = 0;
      self->_int nearMissLogPreDelayTimer = 8000;
      self->_nearMissLogPending = 1;
    }
  }
LABEL_14:

  return v14;
}

uint64_t __34__VTPhraseSpotter__analyzeEvents___block_invoke_540(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 16) getSATVectorCount];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 477))
  {
    id v4 = *(void **)(v3 + 592);
    if (!v4)
    {
      unsigned __int8 v5 = *(void **)(v3 + 16);
      goto LABEL_9;
    }
    if (!*(void *)(a1 + 40) && [v4 tdPsrCanProcessRequest])
    {
      [*(id *)(*(void *)(a1 + 32) + 16) updateSAT];
      unsigned __int8 v5 = *(void **)(*(void *)(a1 + 32) + 592);
LABEL_9:
      [v5 updateSAT];
      goto LABEL_10;
    }
    int v6 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      double v8 = *(void **)(*(void *)(a1 + 32) + 592);
      double v9 = v6;
      int v11 = 134349570;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      double v14 = v8;
      __int16 v15 = 1026;
      int v16 = [v8 tdPsrCanProcessRequest];
      _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "Not updating SAT & PSR models: psrTDTimedOut: %{public}ld, _satDetectionTdSr: %{public}@, tdPsrCanProcessRequest: %{public}d", (uint8_t *)&v11, 0x1Cu);
    }
  }
LABEL_10:
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) getSATVectorCount];
  *(unsigned char *)(*(void *)(a1 + 32) + 256) = result - v2 == 1;
  return result;
}

void __34__VTPhraseSpotter__analyzeEvents___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned __int8 v5 = VTLogContextFacilityVoiceTrigger;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "AFSiriActivationBuiltInMicVoiceTriggerPrewarm success", (uint8_t *)&v8, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    int v6 = v5;
    uint64_t v7 = [v4 localizedDescription];
    int v8 = 138543362;
    double v9 = v7;
    _os_log_error_impl(&dword_21844F000, v6, OS_LOG_TYPE_ERROR, "AFSiriActivationBuiltInMicVoiceTriggerPrewarm failed : %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_createFirstChanceMeta:(const _ndresult *)a3
{
  v46[20] = *MEMORY[0x263EF8340];
  if (a3)
  {
    unsigned __int8 v5 = [MEMORY[0x263EFF910] date];
    firstChanceTriggeredDate = self->_firstChanceTriggeredDate;
    self->_firstChanceTriggeredDate = v5;

    +[VTUtilities systemUpTime];
    double v8 = v7;
    unsigned int var1 = a3->var1;
    float samplerate = (float)self->_samplerate;
    double v11 = v7 - (float)((float)(a3->var0 - var1) / samplerate);
    double v12 = v7 - (float)((float)(a3->var0 - a3->var2) / samplerate);
    unsigned int extraSamplesAtStart = self->_extraSamplesAtStart;
    if (extraSamplesAtStart >= var1) {
      uint64_t v14 = var1;
    }
    else {
      uint64_t v14 = extraSamplesAtStart;
    }
    triggerPhrases = self->_triggerPhrases;
    if (!triggerPhrases) {
      triggerPhrases = (NSArray *)MEMORY[0x263EFFA68];
    }
    v46[0] = triggerPhrases;
    v45[0] = @"triggerPhrases";
    v45[1] = @"triggerScore";
    id v42 = [NSNumber numberWithDouble:self->_lastScore];
    v46[1] = v42;
    v45[2] = @"earlyDetectFiredTime";
    double v41 = [NSNumber numberWithDouble:self->_earlyDetectTime];
    v46[2] = v41;
    v45[3] = @"triggerStartTime";
    id v40 = [NSNumber numberWithDouble:v11];
    v46[3] = v40;
    v45[4] = @"triggerEndTime";
    id v39 = [NSNumber numberWithDouble:v12];
    v46[4] = v39;
    v45[5] = @"triggerFiredTime";
    int64_t v38 = [NSNumber numberWithDouble:v8];
    v46[5] = v38;
    v45[6] = @"numFramesFromPreTrigger";
    id v37 = [NSNumber numberWithInt:self->_numFramesFromPreTrigger];
    v46[6] = v37;
    v45[7] = @"isMaximized";
    char v36 = [NSNumber numberWithBool:self->_isMaximized];
    v46[7] = v36;
    v45[8] = @"extraSamplesAtStart";
    int v35 = [NSNumber numberWithUnsignedInt:v14];
    v46[8] = v35;
    v45[9] = @"isSecondChance";
    unsigned int v34 = [NSNumber numberWithBool:self->_isSecondChanceEffective];
    v46[9] = v34;
    v45[10] = @"threshold";
    unsigned int v33 = [NSNumber numberWithDouble:self->_threshold];
    v46[10] = v33;
    v45[11] = @"effectiveThreshold";
    uint64_t v32 = [NSNumber numberWithDouble:self->_effectiveThreshold];
    v46[11] = v32;
    v45[12] = @"hardwareSamplerate";
    int v16 = [NSNumber numberWithDouble:self->_hardwareSampleRate];
    v46[12] = v16;
    v45[13] = @"uptime";
    uint64_t v17 = [NSNumber numberWithDouble:self->_lastUptime];
    v46[13] = v17;
    v45[14] = @"downtime";
    double v18 = [NSNumber numberWithDouble:self->_lastDowntime];
    v46[14] = v18;
    v45[15] = @"didWakeAP";
    long long v19 = [NSNumber numberWithBool:self->_didWakeAP];
    v46[15] = v19;
    v45[16] = @"onBatteryPower";
    unsigned int v20 = NSNumber;
    unint64_t v21 = +[VTBatteryMonitor sharedInstance];
    BOOL v22 = objc_msgSend(v20, "numberWithInt:", objc_msgSend(v21, "batteryState") == 2);
    v46[16] = v22;
    v45[17] = @"siriIsActiveOrOtherAssertion";
    unsigned int v23 = NSNumber;
    double v24 = +[VTSiriAssertionMonitor sharedInstance];
    uint64_t v25 = objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "isEnabled"));
    uint64_t v26 = (void *)v25;
    configVersion = (__CFString *)self->_configVersion;
    if (!configVersion) {
      configVersion = @"n/a";
    }
    v46[17] = v25;
    v46[18] = configVersion;
    v45[18] = @"configVersion";
    v45[19] = @"languageCode";
    languageCode = (__CFString *)self->_languageCode;
    if (!languageCode) {
      languageCode = @"n/a";
    }
    v46[19] = languageCode;
    id v29 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:20];

    objc_storeStrong((id *)&self->_firstChanceVTEventInfo, v29);
    uint64_t v30 = [NSString stringWithFormat:@"%@", self->_firstChanceVTEventInfo];
    uint64_t v31 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      double v44 = v30;
      _os_log_impl(&dword_21844F000, v31, OS_LOG_TYPE_DEFAULT, "First Chance Meta : %{public}@", buf, 0xCu);
    }
  }
}

- (void)_storeFirstChanceAudio
{
  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__VTPhraseSpotter__storeFirstChanceAudio__block_invoke;
  block[3] = &unk_264325ED0;
  void block[4] = self;
  dispatch_async(ndetectQueue, block);
}

void __41__VTPhraseSpotter__storeFirstChanceAudio__block_invoke(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 312);
  if (v2)
  {
    uint64_t v4 = 0;
    uint64_t v3 = (void *)[v2 copyBufferWithNumSamplesCopiedIn:&v4];
    if (v3) {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 704), v3);
    }
  }
}

- (BOOL)_getSecondChanceEffective
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ndetectQueue = self->_ndetectQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__VTPhraseSpotter__getSecondChanceEffective__block_invoke;
  v5[3] = &unk_264325F50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ndetectQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__VTPhraseSpotter__getSecondChanceEffective__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 377))
  {
    uint64_t v1 = result;
    uint64_t result = +[VTUtilities systemUpTime];
    uint64_t v3 = *(void *)(v1 + 32);
    if (v2 > 0.0
      && (double v4 = *(double *)(v3 + 384), v4 > 0.0)
      && ((double v5 = v2 - v4, v5 > 0.0) ? (v6 = v5 < 8.0) : (v6 = 0), v6))
    {
      *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
    }
    else
    {
      *(unsigned char *)(v3 + 377) = 0;
    }
  }
  return result;
}

- (void)_cancelSecondChance
{
  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__VTPhraseSpotter__cancelSecondChance__block_invoke;
  block[3] = &unk_264325ED0;
  void block[4] = self;
  dispatch_async(ndetectQueue, block);
}

uint64_t __38__VTPhraseSpotter__cancelSecondChance__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 377) = 0;
  return result;
}

- (void)_setSecondChance
{
  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__VTPhraseSpotter__setSecondChance__block_invoke;
  block[3] = &unk_264325ED0;
  void block[4] = self;
  dispatch_async(ndetectQueue, block);
}

uint64_t __35__VTPhraseSpotter__setSecondChance__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 377) = 1;
  uint64_t result = +[VTUtilities systemUpTime];
  *(void *)(*(void *)(a1 + 32) + 384) = v3;
  return result;
}

- (unint64_t)_getBiometricMatchResult
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unsigned __int8 v13 = 0;
  uint64_t v12 = 0;
  uint64_t v3 = mach_continuous_time();
  if ([(VTBiometricMatchMonitor *)self->_biometricMonitor getLastBiometricMatchEvent:&v13 atTime:&v12])
  {
    +[VTUtilities VTMachAbsoluteTimeGetTimeInterval:v3 - v12];
    double v5 = v4;
    int v6 = v13;
    double v7 = VTLogContextFacilityVoiceTrigger;
    BOOL v8 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
    if (v6 && v5 < 3.0)
    {
      if (v8)
      {
        *(_DWORD *)buf = 134349056;
        double v15 = v5;
        _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "Biometric match happened in last %{public}f secs", buf, 0xCu);
      }
      return 1;
    }
    else
    {
      if (v8)
      {
        double v11 = @"MATCH";
        if (!v6) {
          double v11 = @"MIS-MATCH";
        }
        *(_DWORD *)buf = 138543618;
        double v15 = *(double *)&v11;
        __int16 v16 = 2050;
        double v17 = v5;
        _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "Biometric match result: %{public}@ happened in last %{public}f secs", buf, 0x16u);
        int v6 = v13;
      }
      if (v6) {
        return 3;
      }
      else {
        return 2;
      }
    }
  }
  else
  {
    uint64_t v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "No biometric information available", buf, 2u);
    }
    return 0;
  }
}

- (id)_storeTrainingAudioAndMetaInfo
{
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  double v4 = [v3 UUIDString];
  double v5 = [v4 stringByAppendingString:@".wav"];

  if (self->_audioBuffer)
  {
    int v6 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:1 forLanguageCode:self->_languageCode];
    double v7 = [v6 stringByAppendingPathComponent:v5];

    unint64_t v8 = [(VTPhraseSpotter *)self _sampleLengthFrom:self->_samplecountAtLastTriggerStart To:self->_samplecount];
    audioBuffer = self->_audioBuffer;
    unint64_t v10 = [(VTAudioCircularBuffer *)audioBuffer sampleCount] - v8;
    unint64_t v11 = [(VTAudioCircularBuffer *)self->_audioBuffer sampleCount];
    uint64_t v12 = [NSURL URLWithString:v7];
    [(VTAudioCircularBuffer *)audioBuffer saveRecordingBufferFrom:v10 to:v11 toURL:v12];

    +[VTUtteranceMetadataManager saveUtteranceMetadataForUtterance:v7 isExplicitEnrollment:self->_isRunningSATEnrollment isHandheldEnrollment:[(VTPhraseSpotter *)self _isDeviceHandheld] withBiometricResult:[(VTPhraseSpotter *)self _getBiometricMatchResult]];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (unint64_t)_sampleLengthFrom:(unsigned int)a3 To:(unsigned int)a4
{
  unsigned int v4 = -a3;
  if (a3 > a4) {
    unsigned int v4 = ~a3;
  }
  return v4 + a4;
}

- (id)_handleTriggerEvent:(const _ndresult *)a3 num_new_samples:(unsigned int)a4 satScore:(double)a5
{
  *(void *)&v35[5] = *MEMORY[0x263EF8340];
  unint64_t v8 = [(VTPhraseSpotter *)self _analyzeMakeResult:a3 eventKind:0 satScore:a5];
  self->_numFramesFromPreTrigger += a4;
  if (!self->_isMaximized) {
    goto LABEL_26;
  }
  kdebug_trace();
  ++self->_triggerCount;
  self->_lastTriggerType = 1;
  if (self->_isSecondChanceEffective)
  {
    char v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      double var4 = a3->var4;
      unsigned int var1 = a3->var1;
      unsigned int var2 = a3->var2;
      *(_DWORD *)buf = 134349568;
      *(double *)&uint8_t buf[4] = var4;
      __int16 v34 = 1026;
      *(_DWORD *)int v35 = var1;
      v35[2] = 1026;
      *(_DWORD *)&v35[3] = var2;
      _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "::: Detected a second chance trigger - 2nd of 2 [score: %{public}5.3f] start: %{public}d end: %{public}d", buf, 0x18u);
    }
    self->_lastTriggerType = 2;
  }
  [(VTPhraseSpotter *)self _cancelSecondChance];
  if (self->_audioBuffer)
  {
    unint64_t samplecountAtLastTriggerEnd = self->_samplecountAtLastTriggerEnd;
    if (+[VTSiriPHash sampleSizeForSignalEstimate] <= samplecountAtLastTriggerEnd)
    {
      unsigned int v15 = self->_samplecountAtLastTriggerEnd;
      uint64_t v14 = v15
          - +[VTSiriPHash sampleSizeForSignalEstimate];
    }
    else
    {
      uint64_t v14 = 0;
    }
    unint64_t v16 = [(VTPhraseSpotter *)self _sampleLengthFrom:v14 To:self->_samplecount];
    unint64_t v17 = [(VTAudioCircularBuffer *)self->_audioBuffer sampleCount] - v16;
    unint64_t v18 = [(VTAudioCircularBuffer *)self->_audioBuffer sampleCount];
    long long v19 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349312;
      *(void *)&uint8_t buf[4] = v17;
      __int16 v34 = 2050;
      *(void *)int v35 = v18;
      _os_log_impl(&dword_21844F000, v19, OS_LOG_TYPE_DEFAULT, "BTLE broadcastAudioPayload ringBuffer startpoint: %{public}llu to: %{public}llu", buf, 0x16u);
    }
    *(void *)buf = 0;
    id v20 = [(VTAudioCircularBuffer *)self->_audioBuffer copySamplesFrom:v17 to:v18 withNumSamplesCopiedIn:buf];
    if (*(void *)buf)
    {
      unint64_t v21 = [v8 objectForKeyedSubscript:@"triggerEndMachTime"];

      if (v21)
      {
        BOOL v22 = [v8 objectForKeyedSubscript:@"triggerEndMachTime"];
        uint64_t v23 = [v22 unsignedLongLongValue];

        [(VTSiriNotifications *)self->siriNotifications broadcastAudioPayload:v20 numSamples:*(void *)buf superVectorScore:v23 absoluteTime:self->_lastSupervecScore];
LABEL_18:

        goto LABEL_19;
      }
      double v24 = VTLogContextFacilityVoiceTrigger;
      if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_WORD *)uint64_t v32 = 0;
      uint64_t v25 = "BTLE trigger end mach time is not available";
    }
    else
    {
      double v24 = VTLogContextFacilityVoiceTrigger;
      if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_WORD *)uint64_t v32 = 0;
      uint64_t v25 = "BTLE ring buffer returns 0 length buffer";
    }
    _os_log_error_impl(&dword_21844F000, v24, OS_LOG_TYPE_ERROR, v25, v32, 2u);
    goto LABEL_18;
  }
LABEL_19:
  uint64_t v26 = +[VTAggregator sharedAggregator];
  [v26 logActivation];

  [(VTPhraseSpotter *)self _logMetaData:v8];
  [(VTPhraseSpotter *)self _logDESTriggerRecord:a3 result:v8];
  [(VTPhraseSpotter *)self _analyzeResetWithOption:0];
  self->_unsigned int lastEventEnd = a3->var2;
  if (self->_isRunningSATEnrollment)
  {
    id v27 = [(VTPhraseSpotter *)self _storeTrainingAudioAndMetaInfo];
  }
  else if (self->_isRunningSATDetection && self->_implicitlyTrained)
  {
    uint64_t v30 = [(VTPhraseSpotter *)self _storeTrainingAudioAndMetaInfo];
    lastImplicitlyTrainedAudioFile = self->_lastImplicitlyTrainedAudioFile;
    self->_lastImplicitlyTrainedAudioFile = v30;

    notify_post("com.apple.voicetrigger.PHSProfileModified");
  }
  if (!+[VTUtilities VTIsHorseman] && self->_isRunningRecognizer)
  {
    BOOL v28 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v28, OS_LOG_TYPE_DEFAULT, "Stopping audio feed to recognizer per trigger event", buf, 2u);
    }
    [(VTTranscriber *)self->_transcriber endAudio];
  }
LABEL_26:

  return v8;
}

- (id)analyzeBufferList:(AudioBufferList *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v5 = (void *)MEMORY[0x21D46B7E0](self, a2);
  if (!a3)
  {
    unint64_t v16 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21[0]) = 0;
      _os_log_error_impl(&dword_21844F000, v16, OS_LOG_TYPE_ERROR, "Received NULL bufferList", (uint8_t *)v21, 2u);
    }
    goto LABEL_14;
  }
  if (!+[VTUtilities VTIsHorseman] || self->_numChannels < 2)
  {
    unsigned int v15 = -[VTPhraseSpotter analyze:](self, "analyze:", *(void *)&a3->mBuffers[0].mNumberChannels, a3->mBuffers[0].mData);
    goto LABEL_15;
  }
  unint64_t mDataByteSize = (int)a3->mBuffers[0].mDataByteSize;
  id v7 = [MEMORY[0x263EFF990] dataWithLength:mDataByteSize];
  uint64_t v8 = [v7 mutableBytes];
  unint64_t numChannels = self->_numChannels;
  unint64_t v10 = mDataByteSize / numChannels;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  unint64_t v13 = (int)(mDataByteSize / numChannels);
  do
  {
    uint64_t v14 = (char *)self->_deinterleavedABL + v11;
    *((_DWORD *)v14 + 2) = 1;
    *((_DWORD *)v14 + 3) = v10;
    *((void *)v14 + 2) = v8 + v12 * (int)v10;
    ++v12;
    v11 += 16;
    --numChannels;
  }
  while (numChannels);
  OSStatus v17 = AudioConverterConvertComplexBuffer(self->_deinterleaver, v13 >> 1, a3, self->_deinterleavedABL);
  if (v17)
  {
    OSStatus v18 = v17;
    long long v19 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v21[0] = 67240192;
      v21[1] = v18;
      _os_log_impl(&dword_21844F000, v19, OS_LOG_TYPE_DEFAULT, "Failed to deinterleave data: %{public}d", (uint8_t *)v21, 8u);
    }

LABEL_14:
    unsigned int v15 = 0;
    goto LABEL_15;
  }
  unsigned int v15 = -[VTPhraseSpotter analyze:](self, "analyze:", *(void *)&self->_deinterleavedABL->mBuffers[0].mNumberChannels, self->_deinterleavedABL->mBuffers[0].mData);

LABEL_15:

  return v15;
}

- (id)analyze:(AudioBuffer)a3
{
  mData = a3.mData;
  unint64_t v4 = *(void *)&a3.mNumberChannels;
  uint64_t v68 = *MEMORY[0x263EF8340];
  uint64_t v57 = 0;
  dispatch_time_t v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  uint64_t v6 = *(void *)&a3.mNumberChannels >> 33;
  int v7 = analyze__audioSampleHeartBeat;
  if ((-286331153 * analyze__audioSampleHeartBeat + 143165576) <= 0x11111110)
  {
    char v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240448;
      *(_DWORD *)&uint8_t buf[4] = v6;
      LOWORD(v65) = 1026;
      *(_DWORD *)((char *)&v65 + 2) = v7;
      _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "::: Received %{public}d samples, heartbeat : %{public}d", buf, 0xEu);
    }
    int v8 = 1;
  }
  else
  {
    int v8 = analyze__audioSampleHeartBeat + 1;
  }
  analyze__audioSampleHeartBeat = v8;
  audioFileReader = self->_audioFileReader;
  if (audioFileReader)
  {
    uint64_t v11 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "::: Reading %d samples from file", buf, 8u);
      audioFileReader = self->_audioFileReader;
    }
    id v12 = [(VTAudioFileReader *)audioFileReader readSamples:v6];
    mData = (void *)[v12 bytes];
    LODWORD(v6) = [v12 length];

    if (!self->_isSecondPass)
    {
LABEL_18:
      if (self->_audioCaptureRequested)
      {
        unint64_t v16 = +[VTAudioFileLog sharedInstance];
        objc_msgSend(v16, "appendAudioData:", v4 | ((unint64_t)v6 << 32), mData);
      }
      mach_absolute_time();
      kdebug_trace();
      *(void *)buf = 0;
      uint64_t v65 = buf;
      uint64_t v66 = 0x2020000000;
      char v67 = 0;
      ndetectQueue = self->_ndetectQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __27__VTPhraseSpotter_analyze___block_invoke;
      block[3] = &unk_264325F78;
      int v54 = v4;
      int v55 = v6;
      int v56 = mData;
      void block[4] = self;
      void block[5] = &v57;
      block[6] = buf;
      dispatch_sync(ndetectQueue, block);
      if (+[VTUtilities VTIsHorseman])
      {
        if (self->_useRecognizer)
        {
          OSStatus v18 = (int *)v58[3];
          if (v18)
          {
            if (*((unsigned char *)v18 + 21) && !self->_isRunningRecognizer)
            {
              long long v19 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
              {
                int v21 = *v18;
                int v20 = v18[1];
                *(_DWORD *)id v63 = 67240448;
                *(_DWORD *)&v63[4] = v20;
                *(_WORD *)&v63[8] = 1026;
                *(_DWORD *)&v63[10] = v21;
                _os_log_impl(&dword_21844F000, v19, OS_LOG_TYPE_DEFAULT, "Let's start running recognizer from trigger_start: %{public}d samples_fed %{public}d", v63, 0xEu);
                long long v19 = VTLogContextFacilityVoiceTrigger;
              }
              self->_isSecondPass = 1;
              self->_secondPassTriggered = 0;
              self->_secondPassAccepted = 0;
              self->_double secondPassBestScore = -INFINITY;
              self->_isRunningRecognizer = 1;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)id v63 = 134349056;
                *(void *)&v63[4] = 0x3FF0000000000000;
                _os_log_impl(&dword_21844F000, v19, OS_LOG_TYPE_DEFAULT, "Set to wait up to samples of %{public}.2f seconds for the first recognition results to come back", v63, 0xCu);
              }
              self->_int secondPassResetTimer = 16000;
              self->_int nearMissLogPreDelayTimer = 24000;
              if (!self->_nearMissLogPending) {
                self->_nearMissLogPending = 1;
              }
              self->_firstRecognitionResultReceived = 0;
              [(VTTranscriber *)self->_transcriber reset];
              transcriber = self->_transcriber;
              v52[0] = MEMORY[0x263EF8330];
              v52[1] = 3221225472;
              v52[2] = __27__VTPhraseSpotter_analyze___block_invoke_498;
              v52[3] = &unk_264325ED0;
              v52[4] = self;
              [(VTTranscriber *)transcriber runRecognitionWithCallback:v52];
              *(void *)id v63 = 0;
              id v23 = [(VTAudioCircularBuffer *)self->_audioBuffer copySamplesFrom:[(VTAudioCircularBuffer *)self->_audioBuffer sampleCount]- [(VTPhraseSpotter *)self _sampleLengthFrom:*(unsigned int *)(v58[3] + 4) To:*(unsigned int *)v58[3]] to:[(VTAudioCircularBuffer *)self->_audioBuffer sampleCount] withNumSamplesCopiedIn:v63];
              double v24 = self->_transcriber;
              id v25 = v23;
              uint64_t v26 = [v25 bytes];
              [(VTTranscriber *)v24 recognizeWavData:v26 length:*(unsigned int *)v63];
              self->_isRecognitionResultPending = 1;
              dispatch_time_t v27 = dispatch_time(0, 500000000);
              BOOL v28 = self->_ndetectQueue;
              v51[0] = MEMORY[0x263EF8330];
              v51[1] = 3221225472;
              v51[2] = __27__VTPhraseSpotter_analyze___block_invoke_499;
              v51[3] = &unk_264325ED0;
              v51[4] = self;
              dispatch_after(v27, v28, v51);
            }
          }
        }
      }
      if (v65[24])
      {
        unsigned int samplecount = self->_samplecount;
        self->_samplecountAtLastTriggerStart = samplecount;
        self->_unint64_t samplecountAtLastTriggerEnd = samplecount;
        double v61 = @"isTriggerEvent";
        uint64_t v62 = MEMORY[0x263EFFA88];
        uint64_t v14 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        id v30 = 0;
        self->_lastTriggerType = 3;
LABEL_65:

        _Block_object_dispose(buf, 8);
        goto LABEL_66;
      }
      if (v58[3])
      {
        -[VTPhraseSpotter _analyzeEvents:](self, "_analyzeEvents:");
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        if (!self->_isSecondPass)
        {
LABEL_59:
          if (+[VTUtilities VTIsHorseman]
            && self->_useRecognizer
            && self->_isSecondPass
            && self->_secondPassTriggered)
          {
            self->_isSecondPass = 0;
            self->_secondPassTriggered = 0;
            self->_secondPassAccepted = 0;
            self->_double secondPassBestScore = -INFINITY;
            *(_WORD *)&self->_isRunningRecognizer = 0;
          }
          id v30 = v30;
          uint64_t v14 = v30;
          goto LABEL_65;
        }
      }
      else
      {
        id v30 = 0;
        if (!self->_isSecondPass) {
          goto LABEL_59;
        }
      }
      if (!self->_secondPassTriggered)
      {
        int secondPassResetTimer = self->_secondPassResetTimer;
        if (secondPassResetTimer < 0)
        {
          uint64_t v32 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v63 = 67240192;
            *(_DWORD *)&v63[4] = secondPassResetTimer;
            _os_log_impl(&dword_21844F000, v32, OS_LOG_TYPE_DEFAULT, "secondPassResetTimerFired: %{public}d", v63, 8u);
          }
          [(VTTextDependentSpeakerRecognizer *)self->_satDetectionTdSr endAudio];
          if (self->_isRunningRecognizer)
          {
            if (self->_isRecognitionResultPending)
            {
              if (!self->_firstRecognitionResultReceived)
              {
                unsigned int v33 = +[VTAggregator sharedAggregator];
                [v33 logRecognizerTimedOut];

                if (self->_useFallbackThresholdUponTimeout)
                {
                  self->_isRunningRecognizer = 0;
                  self->_isMaximized = 0;
                  __int16 v34 = VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)id v63 = 0;
                    _os_log_impl(&dword_21844F000, v34, OS_LOG_TYPE_DEFAULT, "We are falling back to normal threshold due to recognizer timeout", v63, 2u);
                  }
                }
              }
            }
            else
            {
              int v35 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)id v63 = 0;
                _os_log_impl(&dword_21844F000, v35, OS_LOG_TYPE_DEFAULT, "Stopping audio feed to recognizer per second pass stop timer", v63, 2u);
              }
              [(VTTranscriber *)self->_transcriber endAudio];
              if (!self->_firstRecognitionResultReceived)
              {
                self->_isRecognitionResultPending = 1;
                uint64_t v47 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                {
                  float recognizerWaitTime = self->_recognizerWaitTime;
                  *(_DWORD *)id v63 = 134349056;
                  *(double *)&v63[4] = recognizerWaitTime;
                  _os_log_impl(&dword_21844F000, v47, OS_LOG_TYPE_DEFAULT, "Set to wait up to samples of %{public}.2f seconds for the first recognition results to come back", v63, 0xCu);
                }
                int v49 = (int)(self->_recognizerWaitTime * 16000.0);
                self->_int secondPassResetTimer = v49;
                int nearMissLogPreDelayTimer = self->_nearMissLogPreDelayTimer;
                uint64_t v14 = 0;
                if ((nearMissLogPreDelayTimer & 0x80000000) == 0) {
                  self->_int nearMissLogPreDelayTimer = nearMissLogPreDelayTimer + v49;
                }
                goto LABEL_65;
              }
            }
          }
          if (self->_isMaximized || (uint64_t v37 = v58[3]) == 0)
          {
            char v36 = v30;
          }
          else
          {
            int64_t v38 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)id v63 = 0;
              _os_log_impl(&dword_21844F000, v38, OS_LOG_TYPE_DEFAULT, "Checking one more time if we are triggered by enforcing maximization", v63, 2u);
              uint64_t v37 = v58[3];
            }
            char v36 = [(VTPhraseSpotter *)self _analyzeEvents:v37];
          }
          if (!self->_secondPassTriggered)
          {
            id v40 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              double secondPassBestScore = self->_secondPassBestScore;
              *(_DWORD *)id v63 = 134349056;
              *(double *)&v63[4] = secondPassBestScore;
              _os_log_impl(&dword_21844F000, v40, OS_LOG_TYPE_DEFAULT, "We didn't trigger with 2nd-pass score at most up to: %{public}.3f", v63, 0xCu);
            }
            id v42 = +[VTAggregator sharedAggregator];
            [v42 logSecondPassResult:self->_secondPassAccepted];

            int v43 = +[VTAggregator sharedAggregator];
            [v43 logFalseWakeUp:self->_didWakeAP];

            if (self->_secondPassAudioLoggingEnabled)
            {
              double v44 = +[VTAudioFileLog sharedInstance];
              [v44 stopRecording];
            }
            if (self->_secondPassAccepted
              || self->_nearMissLogPreDelayTimer < 0
              || !v58[3]
              || self->_lastScore < self->_thresholdLogNearMisses)
            {
              id v30 = v36;
            }
            else
            {
              -[VTPhraseSpotter _computeSATScore:](self, "_computeSATScore:");
              -[VTPhraseSpotter _analyzeMakeResult:eventKind:satScore:](self, "_analyzeMakeResult:eventKind:satScore:", v58[3], 2);
              id v30 = (id)objc_claimAutoreleasedReturnValue();

              if (+[VTUtilities isInternalInstall])
              {
                double v46 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)id v63 = 0;
                  _os_log_impl(&dword_21844F000, v46, OS_LOG_TYPE_DEFAULT, "Sending near trigger notification...", v63, 2u);
                }
                notify_post("com.apple.voicetrigger.NearTrigger");
              }
              [(VTPhraseSpotter *)self _logMetaData:v30];
              [(VTPhraseSpotter *)self _logDESRecord:v58[3] result:v30];
              [(VTPhraseSpotter *)self _analyzeResetWithOption:0];
            }
            if (+[VTUtilities VTIsHorseman] && self->_useRecognizer)
            {
              [(VTPhraseSpotter *)self _analyzeResetWithOption:0];
              uint64_t v14 = 0;
              self->_isSecondPass = 0;
              self->_secondPassTriggered = 0;
              self->_secondPassAccepted = 0;
              self->_double secondPassBestScore = -INFINITY;
              *(_WORD *)&self->_isRunningRecognizer = 0;
            }
            else
            {
              if ([(VTCorruptDetector *)self->_corruptDetector audioHasZeroRun])
              {
                [(VTPhraseSpotter *)self _logCorruptAudio];
                uint64_t v45 = +[VTAggregator sharedAggregator];
                objc_msgSend(v45, "logZeroRunAudio:", -[VTCorruptDetector getMaxZeroSampleCount](self->_corruptDetector, "getMaxZeroSampleCount"));
              }
              self->_secondPassStopSent = 1;
              uint64_t v14 = &unk_26C9A8B48;
            }
            goto LABEL_65;
          }
          id v30 = v36;
        }
      }
      goto LABEL_59;
    }
  }
  else
  {
    uint64_t v6 = HIDWORD(v4);
    if (!self->_isSecondPass) {
      goto LABEL_18;
    }
  }
  if (!self->_secondPassStopSent)
  {
    if (self->_secondPassAudioLoggingEnabled)
    {
      unsigned int v15 = +[VTAudioFileLog sharedInstance];
      objc_msgSend(v15, "appendAudioData:", v4 | ((unint64_t)v6 << 32), mData);
    }
    goto LABEL_18;
  }
  unint64_t v13 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v13, OS_LOG_TYPE_DEFAULT, "We already returned secondPassStop = 1, returning again to ensure stopping", buf, 2u);
  }
  uint64_t v14 = &unk_26C9A8B20;
LABEL_66:
  _Block_object_dispose(&v57, 8);

  return v14;
}

uint64_t __27__VTPhraseSpotter_analyze___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unint64_t v2 = (unint64_t)*(unsigned int *)(a1 + 60) >> 1;
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void **)(v3 + 16);
  if (v4 && *(unsigned char *)(v3 + 473) && !*(unsigned char *)(v3 + 476) && !*(unsigned char *)(v3 + 792))
  {
    [v4 analyzeWavData:*(void *)(a1 + 64) length:v2];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) getAnalyzedResult:0];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 312);
    if (v6)
    {
      [v6 addSamples:*(void *)(a1 + 64) numSamples:v2];
      uint64_t v5 = *(void *)(a1 + 32);
    }
    if (*(unsigned char *)(v5 + 477) && !*(unsigned char *)(v5 + 240))
    {
      int v7 = *(void **)(v5 + 592);
      if (v7)
      {
        [v7 processAudio:*(void *)(a1 + 64) numSamples:v2];
      }
      else
      {
        int v8 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 138412546;
          double v23 = 0.0;
          __int16 v24 = 1024;
          LODWORD(v25) = v2;
          _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "Unable to feed audio to TDSR: _satDetectionTdSr=%@, missedSamples=%d", (uint8_t *)&v22, 0x12u);
        }
      }
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v9 + 529))
    {
      [*(id *)(v9 + 584) recognizeWavData:*(void *)(a1 + 64) length:v2];
      uint64_t v9 = *(void *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v9 + 648), "analyze:", *(void *)(a1 + 56), *(void *)(a1 + 64));
    uint64_t v3 = *(void *)(a1 + 32);
  }
  uint64_t result = [*(id *)(v3 + 632) count];
  if (result)
  {
    uint64_t v11 = [MEMORY[0x263F08AB0] processInfo];
    [v11 systemUptime];
    double v13 = v12;

    uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 632) lastObject];
    [v14 doubleValue];
    double v16 = v15;

    OSStatus v17 = VTLogContextFacilityVoiceTrigger;
    BOOL v18 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
    if (v13 - v16 > 0.0 && v13 - v16 < 7.0)
    {
      if (v18)
      {
        int v22 = 134349312;
        double v23 = v16;
        __int16 v24 = 2050;
        double v25 = v13;
        _os_log_impl(&dword_21844F000, v17, OS_LOG_TYPE_DEFAULT, "nonceTrigger time::: received %{public}f vs. current %{public}f", (uint8_t *)&v22, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t result = [*(id *)(*(void *)(a1 + 32) + 632) removeLastObject];
    }
    else
    {
      if (v18)
      {
        int v22 = 134349312;
        double v23 = v16;
        __int16 v24 = 2050;
        double v25 = v13;
        _os_log_impl(&dword_21844F000, v17, OS_LOG_TYPE_DEFAULT, "nonceTrigger is outdated::: received %{public}f vs. current %{public}f", (uint8_t *)&v22, 0x16u);
      }
      uint64_t result = [*(id *)(*(void *)(a1 + 32) + 632) removeAllObjects];
    }
  }
  uint64_t v20 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v20 + 477))
  {
    int v21 = *(_DWORD *)(v20 + 480);
    if ((v21 & 0x80000000) == 0) {
      *(_DWORD *)(v20 + 480) = v21 - v2;
    }
  }
  return result;
}

void __27__VTPhraseSpotter_analyze___block_invoke_498(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 531))
  {
    uint64_t v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "Received first recognition result...", v5, 2u);
      uint64_t v1 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v1 + 531) = 1;
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v4 + 530)) {
      *(_DWORD *)(v4 + 480) = -10101;
    }
  }
}

uint64_t __27__VTPhraseSpotter_analyze___block_invoke_499(uint64_t a1)
{
  unint64_t v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_DEFAULT, "Stopping audio feed to recognizer per dispatch timer", v4, 2u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 584) endAudio];
}

- (void)_resetVoiceTriggerDueToRTSTrigger
{
  uint64_t v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "RTSTriggered. Resetting VoiceTrigger", v4, 2u);
  }
  [(VTPhraseSpotter *)self _commonInit];
  self->_isSecondPass = 0;
  self->_int secondPassResetTimer = 0;
  *(_WORD *)&self->_didWakeAP = 0;
  self->_earlyDetecFiredMachTime = 0;
  self->_triggerFireMachTime = 0;
  self->_triggerStartMachTime = 0;
  self->_firstPassScore = -1000.0;
  [(VTCorruptDetector *)self->_corruptDetector reset];
}

- (BOOL)_isDeviceHandheld
{
  if (!self->_deviceHandheld) {
    return 0;
  }
  +[VTUtilities systemUpTime];
  if (v3 <= 0.0) {
    return 0;
  }
  double handHeldDetectedTime = self->_handHeldDetectedTime;
  if (handHeldDetectedTime <= 0.0) {
    return 0;
  }
  double v5 = v3 - handHeldDetectedTime;
  if (v5 > 0.0 && v5 < 8.0) {
    return 1;
  }
  BOOL result = 0;
  self->_deviceHandheld = 0;
  return result;
}

- (void)_clearDeviceHandHeld
{
  self->_deviceHandheld = 0;
}

- (void)_setDeviceHandHeld
{
  self->_deviceHandheld = 1;
  +[VTUtilities systemUpTime];
  self->_double handHeldDetectedTime = v3;
}

- (void)clearTriggerCount
{
  self->_triggerCount = 0;
}

- (void)looseTriggerThreshold
{
  double v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "::: will loose trigger threshold", v4, 2u);
  }
  [(VTPhraseSpotter *)self _setSecondChance];
}

- (id)getAudioBuffer
{
  return self->_audioBuffer;
}

- (void)_voiceTriggerEnabledDidChange
{
  assetChangedQueue = self->_assetChangedQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__VTPhraseSpotter__voiceTriggerEnabledDidChange__block_invoke;
  block[3] = &unk_264325ED0;
  void block[4] = self;
  dispatch_async(assetChangedQueue, block);
}

void __48__VTPhraseSpotter__voiceTriggerEnabledDidChange__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unint64_t v2 = *(NSObject **)(v1 + 448);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__VTPhraseSpotter__voiceTriggerEnabledDidChange__block_invoke_2;
  block[3] = &unk_264325ED0;
  void block[4] = v1;
  dispatch_async(v2, block);
}

void __48__VTPhraseSpotter__voiceTriggerEnabledDidChange__block_invoke_2(uint64_t a1)
{
  unint64_t v2 = +[VTPreferences sharedPreferences];
  int v3 = [v2 voiceTriggerEnabled];

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v4 + 475) != v3)
  {
    *(unsigned char *)(v4 + 475) = v3;
    double v5 = *(unsigned char **)(a1 + 32);
    if (v5[475])
    {
      uint64_t v6 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v7 = 0;
        _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "VoiceTrigger is enabled, reload phrase spotter", v7, 2u);
        double v5 = *(unsigned char **)(a1 + 32);
      }
      [v5 _safeReconfig];
    }
  }
}

- (void)_phraseSpotterEnabledDidChange
{
  assetChangedQueue = self->_assetChangedQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__VTPhraseSpotter__phraseSpotterEnabledDidChange__block_invoke;
  block[3] = &unk_264325ED0;
  void block[4] = self;
  dispatch_async(assetChangedQueue, block);
}

void __49__VTPhraseSpotter__phraseSpotterEnabledDidChange__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unint64_t v2 = *(NSObject **)(v1 + 448);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__VTPhraseSpotter__phraseSpotterEnabledDidChange__block_invoke_2;
  block[3] = &unk_264325ED0;
  void block[4] = v1;
  dispatch_async(v2, block);
}

void __49__VTPhraseSpotter__phraseSpotterEnabledDidChange__block_invoke_2(uint64_t a1)
{
  unint64_t v2 = +[VTPreferences sharedPreferences];
  int v3 = [v2 phraseSpotterEnabled];

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v4 + 473) != v3)
  {
    *(unsigned char *)(v4 + 473) = v3;
    double v5 = *(unsigned char **)(a1 + 32);
    if (v5[473])
    {
      [v5 _safeReconfig];
    }
  }
}

- (void)_performReadyCompletion
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__6640;
  v4[4] = __Block_byref_object_dispose__6641;
  id v5 = 0;
  ndetectQueue = self->_ndetectQueue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__VTPhraseSpotter__performReadyCompletion__block_invoke;
  v3[3] = &unk_264325F50;
  v3[4] = self;
  v3[5] = v4;
  dispatch_async(ndetectQueue, v3);
  _Block_object_dispose(v4, 8);
}

void __42__VTPhraseSpotter__performReadyCompletion__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32))
  {
    uint64_t v3 = MEMORY[0x21D46B9F0]();
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
    uint64_t v6 = 32;
  }
  else
  {
    if (!*(void *)(v2 + 40)) {
      goto LABEL_6;
    }
    uint64_t v7 = MEMORY[0x21D46B9F0]();
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
    uint64_t v6 = 40;
  }

  uint64_t v9 = *(void *)(a1 + 32);
  unint64_t v10 = *(void **)(v9 + v6);
  *(void *)(v9 + v6) = 0;

LABEL_6:
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v11)
  {
    double v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "calling back to start feeding us the samples", v13, 2u);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    (*(void (**)(uint64_t))(v11 + 16))(v11);
  }
}

- (void)dealloc
{
  if (self->_registeredforVoiceTriggerEnabledNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"kVTPreferencesVoiceTriggerEnabledDidChangeDarwinNotification", 0);
    self->_registeredforVoiceTriggerEnabledNotification = 0;
  }
  if (self->_registeredForPhraseSpotterNotification)
  {
    uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v4, self, @"kVTPreferencesPhraseSpotterEnabledDidChangeDarwinNotification", 0);
    self->_registeredForPhraseSpotterNotification = 0;
  }
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  analyzer = self->_analyzer;
  if (analyzer)
  {
    self->_analyzer = 0;
  }
  uint64_t v7 = +[VTLanguageCodeUpdateMonitor sharedInstance];
  [v7 removeObserver:self];

  uint64_t v8 = +[VTAssetMonitor sharedInstance];
  [v8 removeObserver:self];

  audioBuffer = self->_audioBuffer;
  self->_audioBuffer = 0;

  unint64_t v10 = (void *)_currentSpotter;
  _currentSpotter = 0;

  transcriber = self->_transcriber;
  self->_transcriber = 0;

  [(VTTextDependentSpeakerRecognizer *)self->_satDetectionTdSr endAudio];
  satDetectionTdSr = self->_satDetectionTdSr;
  self->_satDetectionTdSr = 0;

  deinterleavedABL = self->_deinterleavedABL;
  if (deinterleavedABL) {
    free(deinterleavedABL);
  }
  v14.receiver = self;
  v14.super_class = (Class)VTPhraseSpotter;
  [(VTPhraseSpotter *)&v14 dealloc];
}

- (void)_commonInit
{
  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__VTPhraseSpotter__commonInit__block_invoke;
  block[3] = &unk_264325ED0;
  void block[4] = self;
  dispatch_async(ndetectQueue, block);
}

void *__30__VTPhraseSpotter__commonInit__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) reset];
  *(unsigned char *)(*(void *)(a1 + 32) + 424) = 0;
  *(void *)(*(void *)(a1 + 32) + 432) = 0;
  *(void *)(*(void *)(a1 + 32) + 664) = 0;
  [*(id *)(a1 + 32) _resetCounters];
  BOOL result = *(void **)(*(void *)(a1 + 32) + 312);
  if (result)
  {
    return (void *)[result reset];
  }
  return result;
}

- (void)_initDetector
{
  self->_BOOL isRunningSATEnrollment = 0;
  if (self->_ndetectQueue)
  {
    if (self->_assetChangedQueue) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v28 = (OS_dispatch_queue *)dispatch_queue_create("voiceTrigger reload queue", 0);
    ndetectQueue = self->_ndetectQueue;
    self->_ndetectQueue = v28;

    if (self->_assetChangedQueue) {
      goto LABEL_3;
    }
  }
  id v30 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  uint64_t v31 = (OS_dispatch_queue *)dispatch_queue_create("voiceTrigger asset changed", v30);
  assetChangedQueue = self->_assetChangedQueue;
  self->_assetChangedQueue = v31;

LABEL_3:
  uint64_t v3 = +[VTPreferences sharedPreferences];
  [v3 synchronize];

  uint64_t v4 = +[VTPreferences sharedPreferences];
  self->_audioLoggingEnabled = [v4 fileLoggingIsEnabled];

  *(_WORD *)&self->_secondPassAudioLoggingEnabled = 0;
  if (self->_audioLoggingEnabled)
  {
    if (!self->_loggingQueue)
    {
      id v5 = (OS_dispatch_queue *)dispatch_queue_create("voiceTrigger logging queue", MEMORY[0x263EF83A8]);
      loggingQueue = self->_loggingQueue;
      self->_loggingQueue = v5;
    }
    id v7 = VTMakeTimestampedAudioLogFilenameWithPrefixAndSuffix(&stru_26C99F218, &stru_26C99F218);
    uint64_t v8 = +[VTPreferences sharedPreferences];
    self->_secondPassAudioLoggingEnabled = [v8 secondPassAudioLoggingEnabled];
  }
  uint64_t v9 = +[VTPreferences sharedPreferences];
  self->_voiceTriggerEnabled = [v9 voiceTriggerEnabled];

  if (!self->_registeredforVoiceTriggerEnabledNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_VoiceTriggerEnabledDidChange, @"kVTPreferencesVoiceTriggerEnabledDidChangeDarwinNotification", 0, CFNotificationSuspensionBehaviorDrop);
    self->_registeredforVoiceTriggerEnabledNotification = 1;
  }
  uint64_t v11 = +[VTPreferences sharedPreferences];
  self->_phraseSpotterEnabled = [v11 phraseSpotterEnabled];

  if (!self->_registeredForPhraseSpotterNotification)
  {
    double v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v12, self, (CFNotificationCallback)_PhraseSpotterEnabledDidChange, @"kVTPreferencesPhraseSpotterEnabledDidChangeDarwinNotification", 0, CFNotificationSuspensionBehaviorDrop);
    self->_registeredForPhraseSpotterNotification = 1;
  }
  self->_phraseSpotterBypassed = 0;
  self->_externalPhraseSpotterRunning = 0;
  double v13 = +[VTLanguageCodeUpdateMonitor sharedInstance];
  [v13 addObserver:self];

  objc_super v14 = objc_alloc_init(VTPhraseSpotterEnabledPolicy);
  policy = self->_policy;
  self->_policy = v14;

  objc_initWeak(&location, self);
  double v16 = self->_policy;
  uint64_t v33 = MEMORY[0x263EF8330];
  uint64_t v34 = 3221225472;
  int v35 = __32__VTPhraseSpotter__initDetector__block_invoke;
  char v36 = &unk_264325F28;
  objc_copyWeak(&v37, &location);
  [(VTPolicy *)v16 setCallback:&v33];
  OSStatus v17 = +[VTAssetMonitor sharedInstance];
  [v17 addObserver:self];

  BOOL v18 = AFPreferencesMobileUserSessionLanguage();
  long long v19 = +[VTAggregator sharedAggregator];
  [v19 setLanguageCode:v18];

  [(VTPhraseSpotter *)self _handleAssetChangeForLanguageCode:v18];
  uint64_t v20 = objc_alloc_init(VTSiriNotifications);
  siriNotifications = self->siriNotifications;
  self->siriNotifications = v20;

  int v22 = [MEMORY[0x263EFF980] array];
  nonceTriggerEvents = self->_nonceTriggerEvents;
  self->_nonceTriggerEvents = v22;

  __int16 v24 = objc_alloc_init(VTCorruptDetector);
  corruptDetector = self->_corruptDetector;
  self->_corruptDetector = v24;

  self->_triggerCount = 0;
  uint64_t v26 = +[VTBiometricMatchMonitor sharedInstance];
  biometricMonitor = self->_biometricMonitor;
  self->_biometricMonitor = v26;

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

void __32__VTPhraseSpotter__initDetector__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    id v4 = WeakRetained;
    [WeakRetained _firstUnlockedAndSpringBoardStarted];
    id WeakRetained = v4;
  }
}

- (void)notifyAssetChangeWithCallback:(id)a3
{
  self->_assetChangedCallback = (id)MEMORY[0x21D46B9F0](a3, a2);

  MEMORY[0x270F9A758]();
}

- (void)prepareWithProperty:(id)a3 readyCompletion:(id)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(VTPhraseSpotter *)self _commonInit];
  uint64_t v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.mSampleRate) = 138543362;
    *(void *)((char *)&buf.mSampleRate + 4) = v6;
    _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "preparing VTPhraseSpotter with property: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  self->_isSecondPass = 0;
  self->_int secondPassResetTimer = 0;
  *(_WORD *)&self->_didWakeAP = 0;
  self->_earlyDetecFiredMachTime = 0;
  self->_triggerFireMachTime = 0;
  self->_triggerStartMachTime = 0;
  self->_firstPassScore = -1000.0;
  *(_WORD *)&self->_isRunningRecognizer = 0;
  self->_firstRecognitionResultReceived = 0;
  [(VTTranscriber *)self->_transcriber reset];
  *(_OWORD *)&self->_double threshold = *(_OWORD *)&self->_ndapiThreshold;
  self->_double thresholdLogNearMisses = self->_ndapiThresholdLogNearMisses;
  if (v6)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"isSecondPass"];
    unint64_t v10 = v9;
    if (v9 && [v9 BOOLValue])
    {
      satDetectionTdSr = self->_satDetectionTdSr;
      if (satDetectionTdSr)
      {
        self->_lastCombinedTdSpeakerRecognizerSATScore = 0.0;
        [(VTTextDependentSpeakerRecognizer *)satDetectionTdSr resetForNewRequest];
        double v12 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
        satDetectionTdSrSemaphore = self->_satDetectionTdSrSemaphore;
        self->_satDetectionTdSrSemaphore = v12;

        objc_super v14 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.mSampleRate) = 138412546;
          *(void *)((char *)&buf.mSampleRate + 4) = v10;
          LOWORD(buf.mFormatFlags) = 2112;
          *(void *)((char *)&buf.mFormatFlags + 2) = v6;
          _os_log_impl(&dword_21844F000, v14, OS_LOG_TYPE_DEFAULT, "Created _satDetectionTdSrSemaphore: isSecondPass=%@, property: %@", (uint8_t *)&buf, 0x16u);
        }
      }
      self->_isSecondPass = 1;
      self->_int secondPassResetTimer = 48000;
      self->_secondPassAccepted = 0;
      self->_secondPassStopSent = 0;
      self->_double secondPassBestScore = -INFINITY;
      if (self->_secondPassAudioLoggingEnabled)
      {
        double v15 = +[VTAudioFileLog sharedInstance];
        [v15 startRecording];
      }
      double v16 = [v6 objectForKeyedSubscript:@"AOPVoiceTriggerData"];
      OSStatus v17 = v16;
      if (v16)
      {
        BOOL v18 = [v16 objectForKeyedSubscript:@"trigger-woke-ap"];
        long long v19 = v18;
        if (v18 && [v18 BOOLValue]) {
          self->_didWakeAP = 1;
        }
        double v73 = v19;
        if (!self->_isRunningSATEnrollment)
        {
          uint64_t v20 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.mSampleRate) = 0;
            _os_log_impl(&dword_21844F000, v20, OS_LOG_TYPE_DEFAULT, "Received AOPVoiceTrigger, need to send early detect", (uint8_t *)&buf, 2u);
          }
          +[VTUtilities systemUpTime];
          self->_earlyDetectTime = v21;
          self->_earlyDetecFiredMachTime = mach_absolute_time();
          int v22 = +[VTPreferences sharedPreferences];
          int v23 = [v22 useSiriActivationSPIForiOS];

          if (v23)
          {
            AFSiriActivationBuiltInMicVoiceTriggerPrewarm();
          }
          else
          {
            notify_post("com.apple.voicetrigger.EarlyDetect");
            __int16 v24 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf.mSampleRate) = 0;
              _os_log_impl(&dword_21844F000, v24, OS_LOG_TYPE_DEFAULT, "Use legacy notification", (uint8_t *)&buf, 2u);
            }
          }
        }
        double v25 = [v17 objectForKeyedSubscript:@"trigger-time"];
        uint64_t v26 = [v6 objectForKeyedSubscript:@"currentHostTime"];
        dispatch_time_t v27 = (void *)v26;
        if (v25)
        {
          if (v26)
          {
            self->_triggerStartMachTime = [v25 unsignedLongLongValue];
            unint64_t v28 = -[VTPhraseSpotter _applyExtraTime:to:](self, "_applyExtraTime:to:", [v25 unsignedLongLongValue], 0.5);
            if ([v27 unsignedLongLongValue] > v28)
            {
              uint64_t v29 = [v27 unsignedLongLongValue];
              info.mSampleRate = 0.0;
              mach_timebase_info((mach_timebase_info_t)&info);
              if (LODWORD(info.mSampleRate))
              {
                LODWORD(v30) = HIDWORD(info.mSampleRate);
                double secondPassTrailingTime = self->_secondPassTrailingTime;
                double v32 = secondPassTrailingTime
                    + (double)(v29 - v28) / ((double)v30 / (double)LODWORD(info.mSampleRate) * 1000000000.0);
                int v33 = (int)(v32 * 16000.0);
                if (v33 >= 1 && self->_secondPassResetTimer > v33)
                {
                  self->_int secondPassResetTimer = v33;
                  uint64_t v34 = VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf.mSampleRate) = 134349568;
                    *(double *)((char *)&buf.mSampleRate + 4) = v32;
                    LOWORD(buf.mFormatFlags) = 2050;
                    *(double *)((char *)&buf.mFormatFlags + 2) = secondPassTrailingTime;
                    HIWORD(buf.mFramesPerPacket) = 1026;
                    buf.mBytesPerFrame = (int)(v32 * 16000.0);
                    _os_log_impl(&dword_21844F000, v34, OS_LOG_TYPE_DEFAULT, "VT 2nd-pass is set to analyze %{public}.2f (%{public}.2f more) seconds (%{public}d samples)", (uint8_t *)&buf, 0x1Cu);
                  }
                }
              }
            }
          }
        }
        int v35 = [v17 objectForKeyedSubscript:@"trigger-config-blob"];
        char v36 = v35;
        self->_firstPassScore = -1000.0;
        if (v35)
        {
          if ((unint64_t)[v35 length] >= 0x18
            && (id v37 = v36, [v37 bytes]))
          {
            self->_firstPassScore = *(float *)([v37 bytes] + 16);
          }
          else
          {
            int64_t v38 = (void *)VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
            {
              log = v38;
              int v70 = [v36 length];
              uint64_t v71 = [v36 bytes];
              LODWORD(buf.mSampleRate) = 67240448;
              HIDWORD(buf.mSampleRate) = v70;
              LOWORD(buf.mFormatID) = 1026;
              *(AudioFormatID *)((char *)&buf.mFormatID + 2) = v71 == 0;
              _os_log_error_impl(&dword_21844F000, log, OS_LOG_TYPE_ERROR, "firstPassOutData is invalid. VoiceTrigger is not able to decode size(%{public}d), isNull(%{public}d)", (uint8_t *)&buf, 0xEu);
            }
          }
        }
      }
      if (self->_useRecognizer)
      {
        self->_isRunningRecognizer = 1;
        *(_OWORD *)&self->_double threshold = *(_OWORD *)&self->_combinedThreshold;
        self->_double thresholdLogNearMisses = self->_combinedThresholdLogNearMisses;
        transcriber = self->_transcriber;
        v74[0] = MEMORY[0x263EF8330];
        v74[1] = 3221225472;
        v74[2] = __55__VTPhraseSpotter_prepareWithProperty_readyCompletion___block_invoke_472;
        v74[3] = &unk_264325ED0;
        v74[4] = self;
        [(VTTranscriber *)transcriber runRecognitionWithCallback:v74];
      }
    }
    if (+[VTUtilities VTIsHorseman])
    {
      self->_unint64_t numChannels = 1;
      id v40 = [v6 objectForKeyedSubscript:@"channelCount"];
      double v41 = v40;
      if (v40 && [v40 integerValue] >= 2)
      {
        uint64_t v42 = [v41 integerValue];
        self->_unint64_t numChannels = v42;
        AudioConverterRef outAudioConverter = 0;
        buf.mSampleRate = 16000.0;
        *(void *)&buf.mFormatID = 0xC6C70636DLL;
        buf.mBytesPerFrame = 2 * v42;
        buf.mChannelsPerFrame = v42;
        buf.mBytesPerPacket = 2 * v42;
        buf.mFramesPerPacket = 1;
        *(void *)&buf.mBitsPerChannel = 16;
        *(_OWORD *)&info.mSampleRate = *(_OWORD *)&buf.mSampleRate;
        *(_OWORD *)&info.mBytesPerPacket = *(_OWORD *)&buf.mBytesPerPacket;
        *(void *)&info.mBitsPerChannel = 16;
        info.mBytesPerFrame = 2;
        info.mFormatFlags = 44;
        info.mBytesPerPacket = 2;
        OSStatus v43 = AudioConverterNew(&buf, &info, &outAudioConverter);
        if (v43)
        {
          OSStatus v44 = v43;
          uint64_t v45 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)unint64_t v77 = 67240192;
            OSStatus v78 = v44;
            _os_log_impl(&dword_21844F000, v45, OS_LOG_TYPE_DEFAULT, "Cannot create AudioConverter using AudioConverterNew: %{public}d", v77, 8u);
          }
          double v46 = 0;
        }
        else
        {
          double v46 = outAudioConverter;
        }
        self->_deinterleaver = v46;
        deinterleavedABL = self->_deinterleavedABL;
        if (deinterleavedABL) {
          free(deinterleavedABL);
        }
        unint64_t v48 = (AudioBufferList *)malloc_type_malloc(24 * self->_numChannels, 0x10800404ACF7207uLL);
        self->_deinterleavedABL = v48;
        v48->mNumberBuffers = self->_numChannels;
      }
    }
  }
  [(VTCorruptDetector *)self->_corruptDetector reset];
  int v49 = +[VTPreferences sharedPreferences];
  unint64_t v50 = [v49 audioInjectionFilePath];

  if (v50)
  {
    self->_int secondPassResetTimer = 48000;
    unint64_t audioInjectionIndex = self->_audioInjectionIndex;
    if (audioInjectionIndex >= [v50 count])
    {
      unint64_t v52 = 0;
      self->_unint64_t audioInjectionIndex = 0;
    }
    else
    {
      unint64_t v52 = self->_audioInjectionIndex;
    }
    int v55 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v56 = v55;
      uint64_t v57 = [v50 objectAtIndexedSubscript:v52];
      unint64_t v58 = self->_audioInjectionIndex;
      LODWORD(buf.mSampleRate) = 138412546;
      *(void *)((char *)&buf.mSampleRate + 4) = v57;
      LOWORD(buf.mFormatFlags) = 1024;
      *(AudioFormatFlags *)((char *)&buf.mFormatFlags + 2) = v58;
      _os_log_impl(&dword_21844F000, v56, OS_LOG_TYPE_DEFAULT, "::: Audio Injection for file : %@, %d", (uint8_t *)&buf, 0x12u);

      unint64_t v52 = self->_audioInjectionIndex;
    }
    uint64_t v59 = [v50 objectAtIndexedSubscript:v52];
    injectedAudioFilePath = self->_injectedAudioFilePath;
    self->_injectedAudioFilePath = v59;

    double v61 = [VTAudioFileReader alloc];
    uint64_t v62 = NSURL;
    id v63 = [v50 objectAtIndexedSubscript:self->_audioInjectionIndex];
    id v64 = [v62 URLWithString:v63];
    uint64_t v65 = [(VTAudioFileReader *)v61 initWithURL:v64];
    audioFileReader = self->_audioFileReader;
    self->_audioFileReader = v65;

    ++self->_audioInjectionIndex;
  }
  else
  {
    double v53 = self->_audioFileReader;
    self->_audioFileReader = 0;

    int v54 = self->_injectedAudioFilePath;
    self->_injectedAudioFilePath = 0;
  }
  char v67 = (void *)MEMORY[0x21D46B9F0](v7);

  id readyForAnalyze = self->_readyForAnalyze;
  self->_id readyForAnalyze = v67;

  [(VTPhraseSpotter *)self _performReadyCompletion];
  double v69 = (void *)[v6 copy];
  [(VTPhraseSpotter *)self _logPrepareProperty:v69];
}

void __55__VTPhraseSpotter_prepareWithProperty_readyCompletion___block_invoke_472(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 531))
  {
    uint64_t v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "Received first recognition result...", v5, 2u);
      uint64_t v1 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v1 + 531) = 1;
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v4 + 530)) {
      *(_DWORD *)(v4 + 480) = -10101;
    }
  }
}

void __55__VTPhraseSpotter_prepareWithProperty_readyCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VTLogContextFacilityVoiceTrigger;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "AFSiriActivationBuiltInMicVoiceTriggerPrewarm success", (uint8_t *)&v8, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    id v6 = v5;
    id v7 = [v4 localizedDescription];
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_error_impl(&dword_21844F000, v6, OS_LOG_TYPE_ERROR, "AFSiriActivationBuiltInMicVoiceTriggerPrewarm failed : %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (VTPhraseSpotter)initWithConfig:(id)a3 assetDir:(id)a4 runMode:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[VTPreferences sharedPreferences];
  char v11 = [v10 corespeechDaemonEnabled];

  if (v11)
  {
    double v12 = 0;
  }
  else
  {
    double v13 = [(VTPhraseSpotter *)self init];
    objc_super v14 = v13;
    if (v13)
    {
      languageCode = v13->_languageCode;
      v13->_languageCode = (NSString *)@"XX-XX";

      if (a5 <= 2) {
        *((unsigned char *)&v14->super.isa + qword_21852EC68[a5]) = 1;
      }
      v14->_phraseSpotterEnabled = 1;
      v14->_phraseSpotterBypassed = 0;
      v14->_externalPhraseSpotterRunning = 0;
      configVersion = v14->_configVersion;
      v14->_configVersion = (NSString *)@"1.0";

      objc_storeStrong((id *)&v14->_configLanguageCode, v14->_languageCode);
      [(VTPhraseSpotter *)v14 _configureWithConfig:v8 resourcePath:v9];
      dispatch_sync((dispatch_queue_t)v14->_ndetectQueue, &__block_literal_global_448);
      objc_storeStrong((id *)&_currentSpotter, v14);
    }
    self = v14;
    double v12 = self;
  }

  return v12;
}

- (VTPhraseSpotter)initWithConfig:(id)a3 resourcePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[VTPreferences sharedPreferences];
  char v9 = [v8 corespeechDaemonEnabled];

  if (v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    char v11 = [(VTPhraseSpotter *)self init];
    double v12 = v11;
    if (v11)
    {
      [(VTPhraseSpotter *)v11 _commonInit];
      languageCode = v12->_languageCode;
      v12->_languageCode = (NSString *)@"??-??";

      [(VTPhraseSpotter *)v12 _configureWithConfig:v6 resourcePath:v7];
    }
    dispatch_sync((dispatch_queue_t)v12->_ndetectQueue, &__block_literal_global_6656);
    objc_storeStrong((id *)&_currentSpotter, v12);
    self = v12;
    uint64_t v10 = self;
  }

  return v10;
}

- (VTPhraseSpotter)initWithLanguageCodeForSATEnrollment:(id)a3
{
  id v5 = a3;
  id v6 = +[VTPreferences sharedPreferences];
  char v7 = [v6 corespeechDaemonEnabled];

  if ((v7 & 1) == 0)
  {
    v46.receiver = self;
    v46.super_class = (Class)VTPhraseSpotter;
    char v9 = [(VTPhraseSpotter *)&v46 init];
    uint64_t v10 = v9;
    if (!v9)
    {
LABEL_20:
      objc_storeStrong((id *)&_currentSpotter, v10);
      self = v10;
      id v8 = self;
      goto LABEL_21;
    }
    v9->_BOOL isRunningSATEnrollment = 1;
    v9->_phraseSpotterEnabled = 1;
    v9->_phraseSpotterBypassed = 0;
    v9->_externalPhraseSpotterRunning = 0;
    v9->_hardwareSampleRate = 0.0;
    objc_storeStrong((id *)&v9->_languageCode, a3);
    if (v10->_ndetectQueue)
    {
      if (v10->_assetChangedQueue)
      {
LABEL_6:
        dispatch_queue_t v11 = dispatch_queue_create("com.apple.fides-record-creation", 0);
        desQueue = v10->_desQueue;
        v10->_desQueue = (OS_dispatch_queue *)v11;

        double v13 = +[VTAssetManager sharedInstance];
        objc_super v14 = [v13 installedAssetForLanguage:v10->_languageCode];

        if (v14)
        {
          double v15 = [v14 path];
          double v16 = [v15 stringByAppendingPathComponent:@"config.txt"];
          OSStatus v17 = [v14 compatibilityVersion];
          uint64_t v18 = [v17 stringValue];
          configVersion = v10->_configVersion;
          v10->_configVersion = (NSString *)v18;

          if (v10->_configVersion)
          {
            uint64_t v20 = [v14 version];

            if (v20)
            {
              double v21 = v10->_configVersion;
              int v22 = [v14 version];
              int v23 = [v22 stringValue];
              uint64_t v24 = [(NSString *)v21 stringByAppendingFormat:@".%@", v23];
              double v25 = v10->_configVersion;
              v10->_configVersion = (NSString *)v24;
            }
            if (v10->_configVersion)
            {
              uint64_t v26 = [v14 footprint];

              if (v26)
              {
                dispatch_time_t v27 = v10->_configVersion;
                unint64_t v28 = [v14 footprint];
                uint64_t v29 = [(NSString *)v27 stringByAppendingFormat:@".%@", v28];
                unint64_t v30 = v10->_configVersion;
                v10->_configVersion = (NSString *)v29;
              }
            }
          }
          uint64_t v31 = +[VTAggregator sharedAggregator];
          [v31 setAssetString:v10->_configVersion];

          objc_storeStrong((id *)&v10->_configLanguageCode, v10->_languageCode);
          [(VTPhraseSpotter *)v10 _configureWithConfig:v16 resourcePath:v15];
        }
        else
        {
          id v37 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)AudioStreamBasicDescription buf = 0;
            _os_log_impl(&dword_21844F000, v37, OS_LOG_TYPE_DEFAULT, "::: asset is not available for SAT enrollment, cannot do anything", buf, 2u);
          }
          v10->_phraseSpotterEnabled = 0;
        }
        ndetectQueue = v10->_ndetectQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __56__VTPhraseSpotter_initWithLanguageCodeForSATEnrollment___block_invoke;
        block[3] = &unk_264325ED0;
        id v39 = v10;
        OSStatus v44 = v39;
        dispatch_async(ndetectQueue, block);
        [(VTPhraseSpotter *)v39 _resetCounters];
        id v40 = objc_alloc_init(VTCorruptDetector);
        corruptDetector = v39->_corruptDetector;
        v39->_corruptDetector = v40;

        goto LABEL_20;
      }
    }
    else
    {
      dispatch_queue_t v32 = dispatch_queue_create("voiceTrigger reload queue", 0);
      int v33 = v10->_ndetectQueue;
      v10->_ndetectQueue = (OS_dispatch_queue *)v32;

      if (v10->_assetChangedQueue) {
        goto LABEL_6;
      }
    }
    uint64_t v34 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v35 = dispatch_queue_create("voiceTrigger asset changed", v34);
    assetChangedQueue = v10->_assetChangedQueue;
    v10->_assetChangedQueue = (OS_dispatch_queue *)v35;

    goto LABEL_6;
  }
  id v8 = 0;
LABEL_21:

  return v8;
}

uint64_t __56__VTPhraseSpotter_initWithLanguageCodeForSATEnrollment___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) reset];
}

- (VTPhraseSpotter)initWithHardwareSampleRate:(double)a3 readyCompletion:(id)a4
{
  id v6 = a4;
  char v7 = +[VTPreferences sharedPreferences];
  char v8 = [v7 corespeechDaemonEnabled];

  if (v8) {
    goto LABEL_7;
  }
  char v9 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)AudioStreamBasicDescription buf = 0;
    _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "VT initialization start", buf, 2u);
  }
  v21.receiver = self;
  v21.super_class = (Class)VTPhraseSpotter;
  self = [(VTPhraseSpotter *)&v21 init];
  if (+[VTUtilities VTIsHorseman])
  {
    uint64_t v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)AudioStreamBasicDescription buf = 0;
      _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "VoiceTrigger framework not available. Returning nil for VTPhraseSpotter", buf, 2u);
      dispatch_queue_t v11 = 0;
      goto LABEL_16;
    }
LABEL_7:
    dispatch_queue_t v11 = 0;
    goto LABEL_16;
  }
  if (self)
  {
    [(VTPhraseSpotter *)self _initDetector];
    self->_hardwareSampleRate = a3;
    [(VTPhraseSpotter *)self _commonInit];
    [(VTPhraseSpotter *)self _configureWithDefaults];
    if (v6)
    {
      double v12 = (void *)MEMORY[0x21D46B9F0](v6);
      id readyCompletion = self->_readyCompletion;
      self->_id readyCompletion = v12;

      [(VTPhraseSpotter *)self _performReadyCompletion];
    }
    else
    {
      ndetectQueue = self->_ndetectQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __62__VTPhraseSpotter_initWithHardwareSampleRate_readyCompletion___block_invoke;
      block[3] = &unk_264325ED0;
      uint64_t v20 = self;
      dispatch_sync(ndetectQueue, block);
    }
    double v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.fides-record-creation", 0);
    desQueue = self->_desQueue;
    self->_desQueue = v15;
  }
  objc_storeStrong((id *)&_currentSpotter, self);
  self->_unint64_t audioInjectionIndex = 0;
  OSStatus v17 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)AudioStreamBasicDescription buf = 0;
    _os_log_impl(&dword_21844F000, v17, OS_LOG_TYPE_DEFAULT, "VT initialization complete", buf, 2u);
  }
  self = self;
  dispatch_queue_t v11 = self;
LABEL_16:

  return v11;
}

void __62__VTPhraseSpotter_initWithHardwareSampleRate_readyCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

- (VTPhraseSpotter)initWithHardwareSampleRate:(double)a3
{
  id v5 = +[VTPreferences sharedPreferences];
  char v6 = [v5 corespeechDaemonEnabled];

  if (v6)
  {
    char v7 = 0;
  }
  else
  {
    self = [(VTPhraseSpotter *)self initWithHardwareSampleRate:0 readyCompletion:a3];
    char v7 = self;
  }

  return v7;
}

- (VTPhraseSpotter)init
{
  uint64_t v3 = +[VTPreferences sharedPreferences];
  char v4 = [v3 corespeechDaemonEnabled];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    self = [(VTPhraseSpotter *)self initWithHardwareSampleRate:16000.0];
    id v5 = self;
  }

  return v5;
}

+ (id)currentSpotter
{
  return (id)_currentSpotter;
}

+ (void)initialize
{
  if (VTLogInitIfNeeded_once != -1) {
    dispatch_once(&VTLogInitIfNeeded_once, &__block_literal_global_30);
  }
}

@end