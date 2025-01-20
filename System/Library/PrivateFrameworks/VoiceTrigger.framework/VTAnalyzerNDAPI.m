@interface VTAnalyzerNDAPI
- (BOOL)_getBooleanValueFromConfigurationName:(id)a3 defaultTo:(BOOL)a4;
- (BOOL)getDoSAT;
- (BOOL)getDoSupervectorSecondaryTest;
- (BOOL)getUseFallbackThresholdUponTimeout;
- (BOOL)getUseKeywordSpotting;
- (BOOL)getUseRecognizer;
- (BOOL)initializeSAT:(id)a3;
- (VTAnalyzerNDAPI)initWithConfigPath:(id)a3 resourcePath:(id)a4;
- (const)_getOptionValueFromConfigurationName:(id)a3;
- (const)analyzeSAT:(const float *)a3 size:(unsigned int)a4;
- (const)getAnalyzedResult;
- (const)getAnalyzedResult:(unsigned int)a3;
- (const)getScoreSuperVector:(const float *)a3 size:(unsigned int)a4;
- (const)getSuperVectorWithEndPoint:(unsigned int)a3;
- (double)_getFloatValueFromConfigurationName:(id)a3 defaultTo:(double)a4;
- (double)getCombinedLoggingThreshold;
- (double)getCombinedSecondChanceThreshold;
- (double)getCombinedTriggerThreshold;
- (double)getExtraSamplesAtStart;
- (double)getNDAPILoggingThreshold;
- (double)getNDAPISecondChanceThreshold;
- (double)getNDAPITriggerThreshold;
- (double)getRecognizerScoreScaleFactor;
- (double)getRecognizerThresholdOffset;
- (double)getRecognizerWaitTime;
- (double)getRetrainExplicitUttThresholdSAT;
- (double)getRetrainExplicitUttThresholdTDSR;
- (double)getRetrainThresholdSAT;
- (double)getRetrainThresholdTDSR;
- (double)getRetrainThresholdTrigger;
- (double)getSecondPassTrailingTime;
- (double)getThresholdPresuperVector;
- (double)getThresholdSAT;
- (id)_decodeJson:(id)a3;
- (id)_getNumberForKey:(id)a3 category:(id)a4 default:(id)a5;
- (id)_getStringValueFromConfigurationName:(id)a3 defaultTo:(id)a4;
- (id)getRecognizerConfig;
- (id)getRetrainSamplingPolicy;
- (id)getTriggerTokens;
- (id)getVoiceProfilePruningCookie;
- (int)_getIntValueFromConfigurationName:(id)a3 defaultTo:(int)a4;
- (int)getMaximumSpeakerVectors;
- (int)getPayloadUtteranceLifeTimeInDays;
- (int)getRetrainNumExplicitUtt;
- (int)getRetrainNumImplicitUtt;
- (int)getSATVectorCount;
- (int)getVoiceProfilePruningNumRetentionUtterances;
- (void)analyzeWavData:(const signed __int16 *)a3 length:(int)a4;
- (void)dealloc;
- (void)deleteVectorIndex:(int)a3;
- (void)reset;
- (void)resetBest;
- (void)updateSAT;
@end

@implementation VTAnalyzerNDAPI

- (void).cxx_destruct
{
}

- (id)_decodeJson:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];
    if (!v6)
    {
      v12 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v3;
        _os_log_error_impl(&dword_21844F000, v12, OS_LOG_TYPE_ERROR, "Cannot read configuration file : %{public}@", buf, 0xCu);
      }
      id v11 = 0;
      goto LABEL_19;
    }
    id v16 = 0;
    v7 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v16];
    id v8 = v16;
    if (v8)
    {
      v9 = (id)VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v15 = [v8 localizedDescription];
        *(_DWORD *)buf = 138543362;
        id v18 = v15;
        _os_log_error_impl(&dword_21844F000, v9, OS_LOG_TYPE_ERROR, "Cannot decode configuration json file : %{public}@", buf, 0xCu);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v7;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v13 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21844F000, v13, OS_LOG_TYPE_ERROR, "Configuration json file is not expected format", buf, 2u);
      }
    }
    id v11 = 0;
    goto LABEL_18;
  }
  v10 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v3;
    _os_log_error_impl(&dword_21844F000, v10, OS_LOG_TYPE_ERROR, "Configuration file is not exists : %{public}@", buf, 0xCu);
  }
  id v11 = 0;
LABEL_20:

  return v11;
}

- (id)_getNumberForKey:(id)a3 category:(id)a4 default:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  decodedInfo = self->_decodedInfo;
  if (!decodedInfo) {
    goto LABEL_5;
  }
  v12 = [(NSDictionary *)decodedInfo objectForKeyedSubscript:v9];
  if (!v12) {
    goto LABEL_5;
  }
  v13 = [(NSDictionary *)self->_decodedInfo objectForKeyedSubscript:v9];
  v14 = [v13 objectForKeyedSubscript:v8];

  if (v14)
  {
    v15 = [(NSDictionary *)self->_decodedInfo objectForKeyedSubscript:v9];
    id v16 = [v15 objectForKeyedSubscript:v8];
  }
  else
  {
LABEL_5:
    v17 = VTLogContextFacilityVoiceTrigger;
    id v16 = v10;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138543618;
      id v20 = v9;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_error_impl(&dword_21844F000, v17, OS_LOG_TYPE_ERROR, "Cannot access to %{public}@ %{public}@ using default value", (uint8_t *)&v19, 0x16u);
      id v16 = v10;
    }
  }

  return v16;
}

- (const)_getOptionValueFromConfigurationName:(id)a3
{
  id v4 = a3;
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect) {
    IntNovDetect::getoption(novDetect, (const char *)[v4 UTF8String]);
  }

  return 0;
}

- (BOOL)_getBooleanValueFromConfigurationName:(id)a3 defaultTo:(BOOL)a4
{
  int v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(VTAnalyzerNDAPI *)self _getOptionValueFromConfigurationName:v6];
  if (v7)
  {
    id v8 = [NSString stringWithUTF8String:v7];
    LOBYTE(v4) = [v8 BOOLValue];
  }
  else
  {
    id v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = @"NO";
      if (v4) {
        id v10 = @"YES";
      }
      int v12 = 138543618;
      id v13 = v6;
      __int16 v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "::: ndetect config does not define external parameter %{public}@, defaulting to provided value: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v4;
}

- (double)_getFloatValueFromConfigurationName:(id)a3 defaultTo:(double)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(VTAnalyzerNDAPI *)self _getOptionValueFromConfigurationName:v6];
  if (v7)
  {
    id v8 = [NSString stringWithUTF8String:v7];
    [v8 floatValue];
    a4 = v9;
  }
  else
  {
    id v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v6;
      __int16 v14 = 2050;
      double v15 = a4;
      _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "::: ndetect config does not define external parameter %{public}@, defaulting to provided value: %{public}f", (uint8_t *)&v12, 0x16u);
    }
  }

  return a4;
}

- (int)_getIntValueFromConfigurationName:(id)a3 defaultTo:(int)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(VTAnalyzerNDAPI *)self _getOptionValueFromConfigurationName:v6];
  if (v7)
  {
    id v8 = [NSString stringWithUTF8String:v7];
    a4 = [v8 intValue];
  }
  else
  {
    float v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = v6;
      __int16 v13 = 1026;
      int v14 = a4;
      _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "::: ndetect config does not define external parameter %{public}@, defaulting to provided value: %{public}d", (uint8_t *)&v11, 0x12u);
    }
  }

  return a4;
}

- (id)_getStringValueFromConfigurationName:(id)a3 defaultTo:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VTAnalyzerNDAPI *)self _getOptionValueFromConfigurationName:v6];
  if (v8)
  {
    id v9 = [NSString stringWithUTF8String:v8];
  }
  else
  {
    id v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      id v14 = v6;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "::: ndetect config does not define external parameter %{public}@, defaulting to provided value: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    id v9 = v7;
  }
  int v11 = v9;

  return v11;
}

- (BOOL)getUseKeywordSpotting
{
  return [(VTAnalyzerNDAPI *)self _getBooleanValueFromConfigurationName:@"use_keyword_spotting" defaultTo:0];
}

- (BOOL)getUseFallbackThresholdUponTimeout
{
  return [(VTAnalyzerNDAPI *)self _getBooleanValueFromConfigurationName:@"use_fallback_threshold_upon_timeout" defaultTo:0];
}

- (id)getTriggerTokens
{
  return [(VTAnalyzerNDAPI *)self _getStringValueFromConfigurationName:@"trigger_tokens" defaultTo:@"hey_Siri"];
}

- (double)getRecognizerScoreScaleFactor
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"recognizer_score_scale_factor" defaultTo:1.0];
  return result;
}

- (double)getRecognizerWaitTime
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"recognizer_wait_time" defaultTo:1.0];
  return result;
}

- (double)getRecognizerThresholdOffset
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"recognizer_threshold_offset" defaultTo:0.5];
  return result;
}

- (id)getRecognizerConfig
{
  return [(VTAnalyzerNDAPI *)self _getStringValueFromConfigurationName:@"recognizer_config" defaultTo:0];
}

- (BOOL)getUseRecognizer
{
  return [(VTAnalyzerNDAPI *)self _getBooleanValueFromConfigurationName:@"use_recognizer" defaultTo:0];
}

- (int)getPayloadUtteranceLifeTimeInDays
{
  return [(VTAnalyzerNDAPI *)self _getIntValueFromConfigurationName:@"payload_utterance_lifetime_days" defaultTo:180];
}

- (int)getMaximumSpeakerVectors
{
  return [(VTAnalyzerNDAPI *)self _getIntValueFromConfigurationName:@"max_speaker_vectors" defaultTo:40];
}

- (double)getRetrainExplicitUttThresholdTDSR
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"retrain_explicit_threshold_tdsr" defaultTo:-INFINITY];
  return result;
}

- (double)getRetrainExplicitUttThresholdSAT
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"retrain_explicit_threshold_sat" defaultTo:-INFINITY];
  return result;
}

- (double)getRetrainThresholdTDSR
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"retrain_threshold_tdsr" defaultTo:-INFINITY];
  return result;
}

- (double)getRetrainThresholdSAT
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"retrain_threshold_sat" defaultTo:-INFINITY];
  return result;
}

- (double)getRetrainThresholdTrigger
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"retrain_threshold_trigger" defaultTo:-INFINITY];
  return result;
}

- (id)getVoiceProfilePruningCookie
{
  return [(VTAnalyzerNDAPI *)self _getStringValueFromConfigurationName:@"voice_profile_pruning_cookie" defaultTo:0];
}

- (int)getVoiceProfilePruningNumRetentionUtterances
{
  return [(VTAnalyzerNDAPI *)self _getIntValueFromConfigurationName:@"pruning_retention_utterances" defaultTo:7];
}

- (id)getRetrainSamplingPolicy
{
  return [(VTAnalyzerNDAPI *)self _getStringValueFromConfigurationName:@"retrain_sampling_policy" defaultTo:@"random"];
}

- (int)getRetrainNumImplicitUtt
{
  return [(VTAnalyzerNDAPI *)self _getIntValueFromConfigurationName:@"retrain_num_implicit_utt" defaultTo:0x7FFFFFFFLL];
}

- (int)getRetrainNumExplicitUtt
{
  return [(VTAnalyzerNDAPI *)self _getIntValueFromConfigurationName:@"retrain_num_explicit_utt" defaultTo:0x7FFFFFFFLL];
}

- (double)getThresholdSAT
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"threshold_sat" defaultTo:INFINITY];
  return result;
}

- (BOOL)getDoSAT
{
  return [(VTAnalyzerNDAPI *)self _getBooleanValueFromConfigurationName:@"do_sat" defaultTo:0];
}

- (double)getThresholdPresuperVector
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"threshold_presupervector" defaultTo:INFINITY];
  return result;
}

- (BOOL)getDoSupervectorSecondaryTest
{
  return [(VTAnalyzerNDAPI *)self _getBooleanValueFromConfigurationName:@"do_supervector_secondarytest" defaultTo:0];
}

- (double)getSecondPassTrailingTime
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"second_pass_trailing_time" defaultTo:0.5];
  return result;
}

- (double)getExtraSamplesAtStart
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"extra_samples_at_start" defaultTo:0.0];
  return result;
}

- (double)getNDAPILoggingThreshold
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"threshold_logging" defaultTo:INFINITY];
  return result;
}

- (double)getCombinedLoggingThreshold
{
  v2 = [(VTAnalyzerNDAPI *)self _getNumberForKey:@"loggingThreshold" category:@"voiceTriggerSecondPass" default:&unk_26C9A8B90];
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (double)getNDAPISecondChanceThreshold
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"threshold_2ndchance" defaultTo:INFINITY];
  return result;
}

- (double)getCombinedSecondChanceThreshold
{
  v2 = [(VTAnalyzerNDAPI *)self _getNumberForKey:@"2ndChanceThreshold" category:@"voiceTriggerSecondPass" default:&unk_26C9A8B90];
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (double)getNDAPITriggerThreshold
{
  [(VTAnalyzerNDAPI *)self _getFloatValueFromConfigurationName:@"threshold_normal" defaultTo:INFINITY];
  return result;
}

- (double)getCombinedTriggerThreshold
{
  v2 = [(VTAnalyzerNDAPI *)self _getNumberForKey:@"threshold" category:@"voiceTriggerSecondPass" default:&unk_26C9A8B90];
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (int)getSATVectorCount
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  novDetect = self->_novDetect;
  if (!novDetect) {
    return -1;
  }
  if (*novDetect != -1838836561)
  {
    char v5 = "Invalid NovDetect Object Signature";
    goto LABEL_10;
  }
  if (novDetect[3] != 1)
  {
    char v5 = "NovDetect: sat_vectorcount() can only be called after sat_initialize()";
LABEL_10:
    Error::chuck((Error *)v5, a2);
  }
  int v3 = novDetect[577];
  if (*((unsigned char *)novDetect + 40))
  {
    v6[0] = 6;
    (*(void (**)(_DWORD *, const char *, int *))(*((void *)novDetect + 2) + 64))(novDetect + 4, "all ok", v6);
    *((unsigned char *)novDetect + 40) = 0;
  }
  return v3;
}

- (void)deleteVectorIndex:(int)a3
{
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect) {
    IntNovDetect::sat_deletevector(novDetect, *(const char **)&a3);
  }
}

- (const)getScoreSuperVector:(const float *)a3 size:(unsigned int)a4
{
  double result = (const _ndsvscore *)self->_novDetect;
  if (result) {
    return (const _ndsvscore *)IntNovDetect::scoresupervector((IntNovDetect *)result, a3, *(uint64_t *)&a4);
  }
  return result;
}

- (void)updateSAT
{
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect) {
    IntNovDetect::sat_update(novDetect, a2);
  }
}

- (const)analyzeSAT:(const float *)a3 size:(unsigned int)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  novDetect = (char *)self->_novDetect;
  if (!novDetect) {
    return 0;
  }
  if (*(_DWORD *)novDetect != -1838836561)
  {
    uint64_t v7 = "Invalid NovDetect Object Signature";
    goto LABEL_8;
  }
  if (*((_DWORD *)novDetect + 3) != 1)
  {
    uint64_t v7 = "NovDetect: sat_analyze() can only be called after sat_initialize()";
LABEL_8:
    Error::chuck((Error *)v7, a2, a3, *(void *)&a4);
  }
  *((_DWORD *)novDetect + 670) = 0;
  TSSATScorer::score((TSSATScorer *)(novDetect + 2184), a3, *(uint64_t *)&a4);
  char v5 = (const _ndsvscore *)(novDetect + 2680);
  *((_DWORD *)novDetect + 670) = v6;
  if (novDetect[40])
  {
    int v9 = 6;
    (*(void (**)(char *, const char *, int *))(*((void *)novDetect + 2) + 64))(novDetect + 16, "all ok", &v9);
    novDetect[40] = 0;
  }
  return v5;
}

- (const)getSuperVectorWithEndPoint:(unsigned int)a3
{
  double result = (const _ndsupervec *)self->_novDetect;
  if (result) {
    return (const _ndsupervec *)IntNovDetect::getsupervector((IntNovDetect *)result, *(const char **)&a3, v3);
  }
  return result;
}

- (BOOL)initializeSAT:(id)a3
{
  id v4 = a3;
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect) {
    IntNovDetect::sat_initialize(novDetect, (const char *)[v4 cStringUsingEncoding:4]);
  }

  return 0;
}

- (const)getAnalyzedResult:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  novDetect = self->_novDetect;
  if (!novDetect) {
    return 0;
  }
  if (*novDetect != -1838836561)
  {
    id v8 = "Invalid NovDetect Object Signature";
    goto LABEL_11;
  }
  if (novDetect[1] != 1)
  {
    id v8 = "NovDetect: phrasecount() can only be called after initialize()";
LABEL_11:
    Error::chuck((Error *)v8, a2, *(void *)&a3);
  }
  id v4 = *(const char **)&a3;
  int v6 = (IntNovDetect *)self->_novDetect;
  if (*((unsigned char *)novDetect + 40))
  {
    int v9 = 6;
    (*(void (**)(_DWORD *, const char *, int *))(*((void *)novDetect + 2) + 64))(novDetect + 4, "all ok", &v9);
    *((unsigned char *)novDetect + 40) = 0;
    int v6 = (IntNovDetect *)self->_novDetect;
  }
  if ((int)novDetect[770] < 1) {
    return (const _ndresult *)IntNovDetect::getresults(v6, a2);
  }
  else {
    return (const _ndresult *)IntNovDetect::getphraseresults(v6, v4);
  }
}

- (const)getAnalyzedResult
{
  double result = (const _ndresult *)self->_novDetect;
  if (result) {
    return (const _ndresult *)IntNovDetect::getresults((IntNovDetect *)result, a2);
  }
  return result;
}

- (void)analyzeWavData:(const signed __int16 *)a3 length:(int)a4
{
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect) {
    IntNovDetect::wavedata(novDetect, (const char *)a3, a4);
  }
}

- (void)resetBest
{
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect) {
    IntNovDetect::resetbest(novDetect, a2);
  }
}

- (void)reset
{
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect) {
    IntNovDetect::reset(novDetect, a2);
  }
}

- (void)dealloc
{
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect)
  {
    IntNovDetect::~IntNovDetect(novDetect);
    MEMORY[0x21D46B240]();
  }
  v4.receiver = self;
  v4.super_class = (Class)VTAnalyzerNDAPI;
  [(VTAnalyzerNDAPI *)&v4 dealloc];
}

- (VTAnalyzerNDAPI)initWithConfigPath:(id)a3 resourcePath:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)VTAnalyzerNDAPI;
  if ([(VTAnalyzerNDAPI *)&v10 init]) {
    operator new();
  }
  id v8 = (VTAnalyzerNDAPI *)0;

  return v8;
}

@end