@interface SSRSpeakerRecognitionScorer
+ (id)createVoiceScorersWithVoiceProfiles:(id)a3 withConfigFile:(id)a4 withResourceFile:(id)a5 withOffsetsType:(unint64_t)a6 forRetraining:(BOOL)a7;
- (BOOL)resetScorerWithModelFilePath:(id)a3;
- (BOOL)satModelAvailable;
- (NSString)profileID;
- (NSString)psrConfigFilePath;
- (NSString)psrConfigRoot;
- (NSString)sysConfigRoot;
- (NSURL)configFilePath;
- (NSURL)modelFilePath;
- (NSURL)resourceFilePath;
- (SSRSpeakerRecognitionScorer)initWithProfileID:(id)a3 withModelFile:(id)a4 withConfigFile:(id)a5 withResourceFile:(id)a6 configData:(id)a7 memoryIndex:(id)a8 withOffsetsType:(unint64_t)a9 forRetraining:(BOOL)a10;
- (SSRSpeakerRecognitionScorer)initWithProfileID:(id)a3 withModelFile:(id)a4 withConfigFile:(id)a5 withResourceFile:(id)a6 withOffsetsType:(unint64_t)a7 forRetraining:(BOOL)a8;
- (double)_getFloatValueForNDAPIConfigOption:(id)a3 defaultValue:(double)a4;
- (double)_getFloatValueFromConfigurationName:(id)a3 defaultTo:(double)a4;
- (float)_satLogitCeilScore;
- (float)_satLogitFloorScore;
- (float)_satScoreNonVTOffset;
- (float)_satScoreNonVTScale;
- (float)_satScoreVTOffset;
- (float)_satScoreVTScale;
- (float)analyzeSpeakerVector:(id)a3 withDimensions:(unint64_t)a4 withThresholdType:(unint64_t)a5;
- (float)analyzeSuperVector:(id)a3 withDimensions:(unint64_t)a4 withThresholdType:(unint64_t)a5;
- (float)normalizedScoreFromRawScore:(float)a3 forScoreType:(unint64_t)a4;
- (float)scoreSpeakerVector:(id)a3 withDimensions:(unint64_t)a4 withThresholdType:(unint64_t)a5;
- (id)_getOptionValueFromConfigurationName:(id)a3;
- (id)_getStringValueFromConfigurationName:(id)a3 defaultTo:(id)a4;
- (id)_getValueForNDAPIConfigOption:(id)a3;
- (id)getSpeakerVectorAtIndex:(unint64_t)a3;
- (int)_getIntValueFromConfigurationName:(id)a3 defaultTo:(int)a4;
- (unint64_t)getSATVectorCount;
- (void)dealloc;
- (void)deleteVectorAtIndex:(int)a3;
- (void)resetForNewRequest;
- (void)setConfigFilePath:(id)a3;
- (void)setModelFilePath:(id)a3;
- (void)setResourceFilePath:(id)a3;
- (void)updateSAT;
@end

@implementation SSRSpeakerRecognitionScorer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelFilePath, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);

  objc_storeStrong((id *)&self->_profileID, 0);
}

- (void)setModelFilePath:(id)a3
{
}

- (NSURL)modelFilePath
{
  return self->_modelFilePath;
}

- (void)setResourceFilePath:(id)a3
{
}

- (NSURL)resourceFilePath
{
  return self->_resourceFilePath;
}

- (void)setConfigFilePath:(id)a3
{
}

- (NSURL)configFilePath
{
  return self->_configFilePath;
}

- (BOOL)satModelAvailable
{
  return self->_satModelAvailable;
}

- (NSString)profileID
{
  return self->_profileID;
}

- (id)_getValueForNDAPIConfigOption:(id)a3
{
  id v4 = a3;
  v5 = v4;
  novDetect = self->_novDetect;
  if (novDetect)
  {
    [v4 UTF8String];
    uint64_t v7 = nd_getoption();
    if (v7)
    {
      novDetect = [NSString stringWithUTF8String:v7];
    }
    else
    {
      novDetect = 0;
    }
  }

  return novDetect;
}

- (double)_getFloatValueForNDAPIConfigOption:(id)a3 defaultValue:(double)a4
{
  v5 = [(SSRSpeakerRecognitionScorer *)self _getValueForNDAPIConfigOption:a3];
  v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    a4 = v7;
  }

  return a4;
}

- (id)_getStringValueFromConfigurationName:(id)a3 defaultTo:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(SSRSpeakerRecognitionScorer *)self _getOptionValueFromConfigurationName:v6];
  v9 = v8;
  if (!v8)
  {
    v10 = *MEMORY[0x263F38100];
    BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT);
    v9 = v7;
    if (v11)
    {
      int v14 = 136315650;
      v15 = "-[SSRSpeakerRecognitionScorer _getStringValueFromConfigurationName:defaultTo:]";
      __int16 v16 = 2114;
      id v17 = v6;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s ::: ndetect config does not define external parameter %{public}@, defaulting to provided value: %{public}@", (uint8_t *)&v14, 0x20u);
      v9 = v7;
    }
  }
  id v12 = v9;

  return v12;
}

- (int)_getIntValueFromConfigurationName:(id)a3 defaultTo:(int)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(SSRSpeakerRecognitionScorer *)self _getOptionValueFromConfigurationName:v6];
  v8 = v7;
  if (v7)
  {
    a4 = [v7 intValue];
  }
  else
  {
    v9 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      id v12 = "-[SSRSpeakerRecognitionScorer _getIntValueFromConfigurationName:defaultTo:]";
      __int16 v13 = 2114;
      id v14 = v6;
      __int16 v15 = 1026;
      int v16 = a4;
      _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s ::: ndetect config does not define external parameter %{public}@, defaulting to provided value: %{public}d", (uint8_t *)&v11, 0x1Cu);
    }
  }

  return a4;
}

- (double)_getFloatValueFromConfigurationName:(id)a3 defaultTo:(double)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(SSRSpeakerRecognitionScorer *)self _getOptionValueFromConfigurationName:v6];
  v8 = v7;
  if (v7)
  {
    [v7 floatValue];
    a4 = v9;
  }
  else
  {
    v10 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      __int16 v13 = "-[SSRSpeakerRecognitionScorer _getFloatValueFromConfigurationName:defaultTo:]";
      __int16 v14 = 2114;
      id v15 = v6;
      __int16 v16 = 2050;
      double v17 = a4;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s ::: ndetect config does not define external parameter %{public}@, defaulting to provided value: %{public}f", (uint8_t *)&v12, 0x20u);
    }
  }

  return a4;
}

- (id)_getOptionValueFromConfigurationName:(id)a3
{
  v5 = 0;
  if (a3)
  {
    if (self->_novDetect)
    {
      [a3 UTF8String];
      v5 = (void *)nd_getoption();
      if (v5)
      {
        v5 = [NSString stringWithUTF8String:v5];
      }
    }
    uint64_t v3 = vars8;
  }
  return v5;
}

- (float)_satLogitFloorScore
{
  [(SSRSpeakerRecognitionScorer *)self _getFloatValueForNDAPIConfigOption:@"logit_floor_score" defaultValue:-7.0];
  return v2;
}

- (float)_satLogitCeilScore
{
  [(SSRSpeakerRecognitionScorer *)self _getFloatValueForNDAPIConfigOption:@"logit_ceil_score" defaultValue:7.0];
  return v2;
}

- (float)_satScoreNonVTOffset
{
  [(SSRSpeakerRecognitionScorer *)self _getFloatValueForNDAPIConfigOption:@"score_nonvt_offset" defaultValue:-1.158097];
  return v2;
}

- (float)_satScoreVTOffset
{
  [(SSRSpeakerRecognitionScorer *)self _getFloatValueForNDAPIConfigOption:@"score_offset" defaultValue:-2.421951];
  return v2;
}

- (float)_satScoreNonVTScale
{
  [(SSRSpeakerRecognitionScorer *)self _getFloatValueForNDAPIConfigOption:@"score_nonvt_scale" defaultValue:1.041342];
  return v2;
}

- (float)_satScoreVTScale
{
  [(SSRSpeakerRecognitionScorer *)self _getFloatValueForNDAPIConfigOption:@"score_scale" defaultValue:1.352725];
  return v2;
}

- (id)getSpeakerVectorAtIndex:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->_novDetect && (uint64_t v4 = nd_sat_getspeakervector()) != 0)
  {
    if (*(void *)v4)
    {
      v5 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)v4 length:4 * *(unsigned int *)(v4 + 8)];
      goto LABEL_7;
    }
    id v6 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      v10 = "-[SSRSpeakerRecognitionScorer getSpeakerVectorAtIndex:]";
      __int16 v11 = 1024;
      int v12 = v3;
      v8 = "%s ERR: vector data is nil for index %u";
LABEL_13:
      _os_log_error_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v9, 0x12u);
    }
  }
  else
  {
    id v6 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      v10 = "-[SSRSpeakerRecognitionScorer getSpeakerVectorAtIndex:]";
      __int16 v11 = 1024;
      int v12 = v3;
      v8 = "%s ERR: ndspeakervector is nil for index %u";
      goto LABEL_13;
    }
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (NSString)psrConfigRoot
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = [(SSRSpeakerRecognitionScorer *)self _getValueForNDAPIConfigOption:@"spid_frontend_sys_conf_root_node"];
  if (!v3)
  {
    int v3 = [(SSRSpeakerRecognitionScorer *)self _getValueForNDAPIConfigOption:@"td_sr_frontend_sys_conf_root_node"];
    if (!v3)
    {
      uint64_t v4 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        configFilePath = self->_configFilePath;
        int v7 = 136315394;
        v8 = "-[SSRSpeakerRecognitionScorer psrConfigRoot]";
        __int16 v9 = 2114;
        v10 = configFilePath;
        _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s ERR: td_sr_frontend_sys_conf_root_node option missing in %{public}@", (uint8_t *)&v7, 0x16u);
      }
      int v3 = 0;
    }
  }

  return (NSString *)v3;
}

- (NSString)psrConfigFilePath
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = [(SSRSpeakerRecognitionScorer *)self _getValueForNDAPIConfigOption:@"spid_frontend_config_file"];
  if (!v3)
  {
    int v3 = [(SSRSpeakerRecognitionScorer *)self _getValueForNDAPIConfigOption:@"td_sr_frontend_config_file"];
    if (!v3)
    {
      uint64_t v4 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        configFilePath = self->_configFilePath;
        int v7 = 136315394;
        v8 = "-[SSRSpeakerRecognitionScorer psrConfigFilePath]";
        __int16 v9 = 2114;
        v10 = configFilePath;
        _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s ERR: FrontEnd Config option missing in %{public}@", (uint8_t *)&v7, 0x16u);
      }
      int v3 = 0;
    }
  }

  return (NSString *)v3;
}

- (NSString)sysConfigRoot
{
  return (NSString *)[(SSRSpeakerRecognitionScorer *)self _getValueForNDAPIConfigOption:@"spid_frontend_sys_conf_root_node"];
}

- (unint64_t)getSATVectorCount
{
  unint64_t result = (unint64_t)self->_novDetect;
  if (result)
  {
    int v3 = nd_sat_vectorcount();
    return v3 & ~(v3 >> 31);
  }
  return result;
}

- (void)deleteVectorAtIndex:(int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!self->_novDetect)
  {
    __int16 v9 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", *(void *)&a3);
    [v9 handleFailureInMethod:a2 object:self file:@"SSRSpeakerRecognitionScorer.m" lineNumber:401 description:@"deleteVectorAtIndex called with _novDetect = nullptr"];
  }
  int v4 = nd_sat_deletevector();
  if (v4)
  {
    int v5 = v4;
    id v6 = (void *)*MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = v6;
      int v10 = 136315650;
      uint64_t v11 = "-[SSRSpeakerRecognitionScorer deleteVectorAtIndex:]";
      __int16 v12 = 1024;
      int v13 = v5;
      __int16 v14 = 2080;
      uint64_t v15 = nd_error();
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to nd_sat_delete: %d, %s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)updateSAT
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!self->_novDetect)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SSRSpeakerRecognitionScorer.m" lineNumber:391 description:@"updateSAT called with _novDetect = nullptr"];
  }
  int v3 = nd_sat_update();
  if (v3)
  {
    int v4 = v3;
    int v5 = (void *)*MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      int v9 = 136315650;
      int v10 = "-[SSRSpeakerRecognitionScorer updateSAT]";
      __int16 v11 = 1024;
      int v12 = v4;
      __int16 v13 = 2080;
      uint64_t v14 = nd_error();
      _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to persist via sat_update: %d, %s", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

- (float)normalizedScoreFromRawScore:(float)a3 forScoreType:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  [(SSRSpeakerRecognitionScorer *)self _satScoreVTScale];
  float v8 = v7;
  [(SSRSpeakerRecognitionScorer *)self _satScoreVTOffset];
  float v10 = v9;
  [(SSRSpeakerRecognitionScorer *)self _satLogitCeilScore];
  float v12 = v11;
  [(SSRSpeakerRecognitionScorer *)self _satLogitFloorScore];
  float v14 = v13;
  if (self->_offsetsType == 1)
  {
    [(SSRSpeakerRecognitionScorer *)self _satScoreNonVTScale];
    float v8 = v15;
    [(SSRSpeakerRecognitionScorer *)self _satScoreNonVTOffset];
    float v10 = v16;
  }
  float v17 = v10 + (float)(v8 * a3);
  if (a4 - 1 <= 1) {
    return 1.0 / (exp((float)(v17 * -2.0)) + 1.0);
  }
  if ((float)(v12 - v14) >= 0.1)
  {
    float v21 = v14;
    float v20 = v12;
  }
  else
  {
    id v19 = *MEMORY[0x263F38100];
    float v20 = 7.0;
    float v21 = -7.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v24 = 136316162;
      v25 = "-[SSRSpeakerRecognitionScorer normalizedScoreFromRawScore:forScoreType:]";
      __int16 v26 = 2048;
      double v27 = v12;
      __int16 v28 = 2048;
      double v29 = v14;
      __int16 v30 = 2048;
      uint64_t v31 = 0x401C000000000000;
      __int16 v32 = 2048;
      unint64_t v33 = 0xC01C000000000000;
      _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s Incorrect logitCeil %f and logitFloor %f - defaulting them to %f and %f", (uint8_t *)&v24, 0x34u);
    }
  }
  float v22 = 1.0 / (float)(v20 - v21);
  float v23 = -(v21 * v22);
  float result = v23 + (float)(v22 * (float)(v17 + v17));
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (float)scoreSpeakerVector:(id)a3 withDimensions:(unint64_t)a4 withThresholdType:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  float v9 = [MEMORY[0x263F38068] sharedPreferences];
  uint64_t v10 = [v9 speakerIdScoreReportingType];

  if (v8 && a4)
  {
    [v8 bytes];
    if (self->_novDetect)
    {
      float v11 = (float *)nd_sat_analyze();
      if (v11)
      {
        float v13 = *v11;
      }
      else
      {
        float v17 = (void *)*MEMORY[0x263F37FA0];
        float v13 = -1.0;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = v17;
          int v21 = 136315394;
          float v22 = "-[SSRSpeakerRecognitionScorer scoreSpeakerVector:withDimensions:withThresholdType:]";
          __int16 v23 = 2080;
          uint64_t v24 = nd_error();
          _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to compute SAT score: err: %s", (uint8_t *)&v21, 0x16u);
        }
      }
    }
    else
    {
      float v16 = [MEMORY[0x263F08690] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"SSRSpeakerRecognitionScorer.m" lineNumber:332 description:@"Unexpected _novDetect is nil"];

      float v13 = -1.0;
    }
    *(float *)&double v12 = v13;
    [(SSRSpeakerRecognitionScorer *)self normalizedScoreFromRawScore:v10 forScoreType:v12];
    float v15 = v19;
  }
  else
  {
    float v14 = *MEMORY[0x263F37FA0];
    float v15 = -1.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315650;
      float v22 = "-[SSRSpeakerRecognitionScorer scoreSpeakerVector:withDimensions:withThresholdType:]";
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v8;
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s ERR: speakerVec invalid: %@:%lu", (uint8_t *)&v21, 0x20u);
    }
  }

  return v15;
}

- (float)analyzeSuperVector:(id)a3 withDimensions:(unint64_t)a4 withThresholdType:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  float v9 = [MEMORY[0x263F38068] sharedPreferences];
  uint64_t v10 = [v9 speakerIdScoreReportingType];

  if (v8 && a4)
  {
    [v8 bytes];
    if (self->_novDetect)
    {
      float v11 = (float *)nd_sat_analyze();
      if (v11)
      {
        float v13 = *v11;
      }
      else
      {
        float v17 = (void *)*MEMORY[0x263F37FA0];
        float v13 = -1.0;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = v17;
          int v21 = 136315394;
          float v22 = "-[SSRSpeakerRecognitionScorer analyzeSuperVector:withDimensions:withThresholdType:]";
          __int16 v23 = 2080;
          uint64_t v24 = nd_error();
          _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to compute SAT score: err: %s", (uint8_t *)&v21, 0x16u);
        }
      }
    }
    else
    {
      float v16 = [MEMORY[0x263F08690] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"SSRSpeakerRecognitionScorer.m" lineNumber:291 description:@"Unexpected _novDetect is nil"];

      float v13 = -1.0;
    }
    *(float *)&double v12 = v13;
    [(SSRSpeakerRecognitionScorer *)self normalizedScoreFromRawScore:v10 forScoreType:v12];
    float v15 = v19;
  }
  else
  {
    float v14 = *MEMORY[0x263F37FA0];
    float v15 = -1.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315650;
      float v22 = "-[SSRSpeakerRecognitionScorer analyzeSuperVector:withDimensions:withThresholdType:]";
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v8;
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s ERR: superVec invalid: %@:%lu", (uint8_t *)&v21, 0x20u);
    }
  }

  return v15;
}

- (float)analyzeSpeakerVector:(id)a3 withDimensions:(unint64_t)a4 withThresholdType:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  float v9 = [MEMORY[0x263F38068] sharedPreferences];
  uint64_t v10 = [v9 speakerIdScoreReportingType];

  if (v8 && a4)
  {
    [v8 bytes];
    if (self->_novDetect)
    {
      float v11 = (float *)nd_sat_analyze();
      if (v11)
      {
        float v13 = *v11;
      }
      else
      {
        float v17 = (void *)*MEMORY[0x263F37FA0];
        float v13 = -1.0;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = v17;
          int v21 = 136315394;
          float v22 = "-[SSRSpeakerRecognitionScorer analyzeSpeakerVector:withDimensions:withThresholdType:]";
          __int16 v23 = 2080;
          uint64_t v24 = nd_error();
          _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to compute SAT score: err: %s", (uint8_t *)&v21, 0x16u);
        }
      }
    }
    else
    {
      float v16 = [MEMORY[0x263F08690] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"SSRSpeakerRecognitionScorer.m" lineNumber:260 description:@"Unexpected _novDetect is nil"];

      float v13 = -1.0;
    }
    *(float *)&double v12 = v13;
    [(SSRSpeakerRecognitionScorer *)self normalizedScoreFromRawScore:v10 forScoreType:v12];
    float v15 = v19;
  }
  else
  {
    float v14 = *MEMORY[0x263F37FA0];
    float v15 = -1.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315650;
      float v22 = "-[SSRSpeakerRecognitionScorer analyzeSpeakerVector:withDimensions:withThresholdType:]";
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v8;
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s ERR: speakerVec invalid: %@:%lu", (uint8_t *)&v21, 0x20u);
    }
  }

  return v15;
}

- (void)resetForNewRequest
{
}

- (BOOL)resetScorerWithModelFilePath:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  if (!self->_novDetect) {
    goto LABEL_5;
  }
  id v6 = [v4 path];
  [v6 UTF8String];
  int v7 = nd_sat_initialize();

  if (!v7)
  {
    BOOL v9 = 1;
    goto LABEL_7;
  }
  id v8 = (void *)*MEMORY[0x263F37FA0];
  BOOL v9 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v8;
    int v12 = 136315906;
    float v13 = "-[SSRSpeakerRecognitionScorer resetScorerWithModelFilePath:]";
    __int16 v14 = 2114;
    float v15 = v5;
    __int16 v16 = 1026;
    int v17 = v7;
    __int16 v18 = 2082;
    uint64_t v19 = nd_error();
    _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to initialize at %{public}@, err=%{public}d:%{public}s", (uint8_t *)&v12, 0x26u);

LABEL_5:
    BOOL v9 = 0;
  }
LABEL_7:

  return v9;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F37FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[SSRSpeakerRecognitionScorer dealloc]";
    __int16 v7 = 2114;
    id v8 = self;
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s dealloc %{public}@", buf, 0x16u);
  }
  if (self->_novDetect)
  {
    nd_close();
    self->_novDetect = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRSpeakerRecognitionScorer;
  [(SSRSpeakerRecognitionScorer *)&v4 dealloc];
}

- (SSRSpeakerRecognitionScorer)initWithProfileID:(id)a3 withModelFile:(id)a4 withConfigFile:(id)a5 withResourceFile:(id)a6 configData:(id)a7 memoryIndex:(id)a8 withOffsetsType:(unint64_t)a9 forRetraining:(BOOL)a10
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v72 = a3;
  id v17 = a4;
  id v18 = a5;
  id v71 = a6;
  unint64_t v19 = (unint64_t)a7;
  unint64_t v20 = (unint64_t)a8;
  v76.receiver = self;
  v76.super_class = (Class)SSRSpeakerRecognitionScorer;
  int v21 = [(SSRSpeakerRecognitionScorer *)&v76 init];
  float v22 = v21;
  if (!v21) {
    goto LABEL_46;
  }
  p_configFilePath = (id *)&v21->_configFilePath;
  objc_storeStrong((id *)&v21->_configFilePath, a5);
  objc_storeStrong((id *)&v22->_resourceFilePath, a6);
  objc_storeStrong((id *)&v22->_modelFilePath, a4);
  objc_storeStrong((id *)&v22->_profileID, a3);
  v70 = [MEMORY[0x263F08850] defaultManager];
  if (v19 | v20
    || ([*p_configFilePath path],
        uint64_t v24 = objc_claimAutoreleasedReturnValue(),
        char v25 = [v70 fileExistsAtPath:v24],
        v24,
        (v25 & 1) != 0))
  {
    uint64_t v26 = nd_create();
    v22->_novDetect = (void *)v26;
    if (v26)
    {
      if (v18)
      {
        id v27 = [v18 path];
        [v27 UTF8String];
        id v28 = [(NSURL *)v22->_resourceFilePath path];
        [v28 UTF8String];
        int v29 = nd_initialize();

        if (v29)
        {
          __int16 v30 = (void *)*MEMORY[0x263F37FA0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v31 = v30;
            uint64_t v32 = nd_error();
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResour"
                                 "ceFile:configData:memoryIndex:withOffsetsType:forRetraining:]";
            *(_WORD *)&buf[12] = 1026;
            *(_DWORD *)&buf[14] = v29;
            *(_WORD *)&buf[18] = 2082;
            *(void *)&buf[20] = v32;
            _os_log_impl(&dword_21C8A5000, v31, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to initialize _novDetect: err=[%{public}d]:%{public}s", buf, 0x1Cu);
          }
          goto LABEL_15;
        }
        goto LABEL_27;
      }
      if (!v19 || !v20)
      {
        os_log_t v43 = (os_log_t)*MEMORY[0x263F37FA0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFi"
                             "le:configData:memoryIndex:withOffsetsType:forRetraining:]";
        uint64_t v34 = "%s ERR: Failed to initialize _novDetect: config path or config data or memory index is nil";
LABEL_42:
        v36 = v43;
        uint32_t v37 = 12;
        goto LABEL_14;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      buf[24] = 1;
      v39 = [(id)v20 memoryIndexes];
      v73[0] = MEMORY[0x263EF8330];
      v73[1] = 3221225472;
      v73[2] = __148__SSRSpeakerRecognitionScorer_initWithProfileID_withModelFile_withConfigFile_withResourceFile_configData_memoryIndex_withOffsetsType_forRetraining___block_invoke;
      v73[3] = &unk_2644299B8;
      v75 = buf;
      v74 = v22;
      [v39 enumerateKeysAndObjectsUsingBlock:v73];

      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        [ (id) v19 cStringUsingEncoding:4];
        int v40 = nd_initialize();
        if (!v40)
        {

          _Block_object_dispose(buf, 8);
LABEL_27:
          v44 = [MEMORY[0x263F08850] defaultManager];
          v45 = [v17 path];
          char v46 = [v44 fileExistsAtPath:v45];

          if (v46)
          {
            v22->_satModelAvailable = 1;
LABEL_33:
            id v53 = [v17 path];
            [v53 UTF8String];
            int v54 = nd_sat_initialize();

            if (v54)
            {
              v55 = (void *)*MEMORY[0x263F37FA0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
              {
                v56 = v55;
                uint64_t v57 = nd_error();
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withRe"
                                     "sourceFile:configData:memoryIndex:withOffsetsType:forRetraining:]";
                *(_WORD *)&buf[12] = 1026;
                *(_DWORD *)&buf[14] = v54;
                *(_WORD *)&buf[18] = 2082;
                *(void *)&buf[20] = v57;
                _os_log_impl(&dword_21C8A5000, v56, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to initialize: err=%{public}d:%{public}s", buf, 0x1Cu);
              }
              goto LABEL_15;
            }
            int v58 = nd_sat_vectorcount();
            if (!a10)
            {
              int v59 = v58;
              if (v58 <= 0)
              {
                v60 = *MEMORY[0x263F37FA0];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_15;
                }
                *(_DWORD *)buf = 136315394;
                *(void *)&uint8_t buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withRe"
                                     "sourceFile:configData:memoryIndex:withOffsetsType:forRetraining:]";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v59;
                uint64_t v34 = "%s ERR: numVectors:%d for inference, abort";
                v36 = v60;
                uint32_t v37 = 18;
                goto LABEL_14;
              }
            }
            v22->_offsetsType = a9;
            v61 = [v17 URLByDeletingLastPathComponent];
            v62 = (void *)*MEMORY[0x263F37FA0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
            {
              v63 = v62;
              int v68 = [(SSRSpeakerRecognitionScorer *)v22 getSATVectorCount];
              v69 = [v17 lastPathComponent];
              v64 = [v61 lastPathComponent];
              v65 = [v61 URLByDeletingLastPathComponent];
              v66 = [v65 lastPathComponent];
              *(_DWORD *)buf = 136316674;
              *(void *)&uint8_t buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withReso"
                                   "urceFile:configData:memoryIndex:withOffsetsType:forRetraining:]";
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v72;
              *(_WORD *)&buf[22] = 2114;
              *(void *)&buf[24] = v22;
              __int16 v78 = 1026;
              int v79 = v68;
              __int16 v80 = 2114;
              v81 = v69;
              __int16 v82 = 2114;
              v83 = v64;
              __int16 v84 = 2114;
              v85 = v66;
              _os_log_impl(&dword_21C8A5000, v63, OS_LOG_TYPE_DEFAULT, "%s Initialized Scorer for %{public}@ - (%{public}@, %{public}d, %{public}@, %{public}@, %{public}@)", buf, 0x44u);
            }
LABEL_46:
            v38 = v22;
            goto LABEL_47;
          }
          v47 = (os_log_t *)MEMORY[0x263F37FA0];
          v48 = (void *)*MEMORY[0x263F37FA0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
          {
            v49 = v48;
            v50 = [v17 path];
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResour"
                                 "ceFile:configData:memoryIndex:withOffsetsType:forRetraining:]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v50;
            _os_log_impl(&dword_21C8A5000, v49, OS_LOG_TYPE_DEFAULT, "%s %@, satModel doesn't exist", buf, 0x16u);
          }
          v22->_satModelAvailable = 0;
          if (a10)
          {
            v51 = [v17 URLByDeletingLastPathComponent];
            v52 = [v51 path];
            +[SSRUtils createDirectoryIfDoesNotExist:v52];

            goto LABEL_33;
          }
          os_log_t v43 = *v47;
          if (!os_log_type_enabled(*v47, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_15;
          }
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResource"
                               "File:configData:memoryIndex:withOffsetsType:forRetraining:]";
          uint64_t v34 = "%s Bailing out since we don't have modelPath for inference";
          goto LABEL_42;
        }
        v41 = (id)*MEMORY[0x263F37FA0];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v42 = nd_error();
          *(_DWORD *)v86 = 136315650;
          v87 = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFile:configData"
                ":memoryIndex:withOffsetsType:forRetraining:]";
          __int16 v88 = 1026;
          int v89 = v40;
          __int16 v90 = 2082;
          uint64_t v91 = v42;
          _os_log_impl(&dword_21C8A5000, v41, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to initialize secure _novDetect: err=[%{public}d]:%{public}s", v86, 0x1Cu);
        }
      }
      _Block_object_dispose(buf, 8);
      goto LABEL_15;
    }
    unint64_t v33 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFile"
                           ":configData:memoryIndex:withOffsetsType:forRetraining:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      uint64_t v34 = "%s ERR: Failed to create NovDetect using %{public}@";
LABEL_13:
      v36 = v33;
      uint32_t v37 = 22;
LABEL_14:
      _os_log_impl(&dword_21C8A5000, v36, OS_LOG_TYPE_DEFAULT, v34, buf, v37);
    }
  }
  else
  {
    unint64_t v33 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      id v35 = *p_configFilePath;
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFile"
                           ":configData:memoryIndex:withOffsetsType:forRetraining:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v35;
      uint64_t v34 = "%s ERR: Config file not found at %{public}@";
      goto LABEL_13;
    }
  }
LABEL_15:

  v38 = 0;
LABEL_47:

  return v38;
}

void __148__SSRSpeakerRecognitionScorer_initWithProfileID_withModelFile_withConfigFile_withResourceFile_configData_memoryIndex_withOffsetsType_forRetraining___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v9 = v7;
    [v9 cStringUsingEncoding:4];
    id v10 = v8;
    [v10 bytes];
    [v10 length];
    if (nd_addresource())
    {
      float v11 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEBUG))
      {
        int v12 = 136315395;
        float v13 = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFile:configData:m"
              "emoryIndex:withOffsetsType:forRetraining:]_block_invoke";
        __int16 v14 = 2113;
        id v15 = v9;
        _os_log_debug_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEBUG, "%s Failed to add resource %{private}@", (uint8_t *)&v12, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
}

- (SSRSpeakerRecognitionScorer)initWithProfileID:(id)a3 withModelFile:(id)a4 withConfigFile:(id)a5 withResourceFile:(id)a6 withOffsetsType:(unint64_t)a7 forRetraining:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return [(SSRSpeakerRecognitionScorer *)self initWithProfileID:a3 withModelFile:a4 withConfigFile:a5 withResourceFile:a6 configData:0 memoryIndex:0 withOffsetsType:a7 forRetraining:v9];
}

+ (id)createVoiceScorersWithVoiceProfiles:(id)a3 withConfigFile:(id)a4 withResourceFile:(id)a5 withOffsetsType:(unint64_t)a6 forRetraining:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v27 = a4;
  id v12 = a5;
  if (v11 && [v11 count])
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v25 = v11;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * v17);
          unint64_t v19 = [SSRSpeakerRecognitionScorer alloc];
          unint64_t v20 = [v13 objectForKeyedSubscript:v18];
          int v21 = [(SSRSpeakerRecognitionScorer *)v19 initWithProfileID:v18 withModelFile:v20 withConfigFile:v27 withResourceFile:v12 withOffsetsType:a6 forRetraining:v7];

          if (v21 && [(SSRSpeakerRecognitionScorer *)v21 satModelAvailable])
          {
            [v26 addObject:v21];
          }
          else
          {
            float v22 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              unint64_t v33 = "+[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:wi"
                    "thOffsetsType:forRetraining:]";
              __int16 v34 = 2114;
              uint64_t v35 = v18;
              __int16 v36 = 2114;
              id v37 = v12;
              _os_log_error_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_ERROR, "%s ERR: Failed to initialize satAnalyzer for profile %{public}@ with asset %{public}@", buf, 0x20u);
            }
          }

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v15);
    }

    id v11 = v25;
  }
  else
  {
    __int16 v23 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v33 = "+[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffset"
            "sType:forRetraining:]";
      _os_log_error_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_ERROR, "%s ERR: Voice Recognition models not provided - Bailing out", buf, 0xCu);
    }
    id v26 = 0;
  }

  return v26;
}

@end