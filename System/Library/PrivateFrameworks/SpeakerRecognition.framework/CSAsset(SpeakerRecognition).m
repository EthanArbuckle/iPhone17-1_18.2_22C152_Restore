@interface CSAsset(SpeakerRecognition)
- (BOOL)containsMultiUserThresholds;
- (float)pruningExplicitUttThresholdPSR;
- (float)pruningExplicitUttThresholdSAT;
- (float)pruningThresholdPSR;
- (float)pruningThresholdSAT;
- (float)psrCombinationWeight;
- (float)satImplicitProfileDeltaThreshold;
- (float)satImplicitProfileThreshold;
- (float)satScoreThreshold;
- (float)satScoreThresholdForPhId:()SpeakerRecognition;
- (float)satVTImplicitThreshold;
- (id)getPhraseConfig:()SpeakerRecognition;
- (id)keywordDetectorNDAPIConfigFilePath;
- (id)keywordDetectorQuasarConfigFilePath;
- (uint64_t)containsSpeakerRecognitionCategory;
- (uint64_t)maxAllowedEnrollmentUtterances;
- (uint64_t)multiUserConfidentScoreThreshold;
- (uint64_t)multiUserDeltaScoreThreshold;
- (uint64_t)multiUserHighScoreThreshold;
- (uint64_t)multiUserLowScoreThreshold;
- (uint64_t)pruningNumRetentionUtterance;
- (uint64_t)satImplicitTrainingEnabled;
- (uint64_t)useSpeakerRecognitionAsset;
- (uint64_t)useTDTIEnrollment;
- (uint64_t)voiceProfilePruningCookie;
- (unint64_t)multiUserConfidentScoreThresholdForPhId:()SpeakerRecognition;
- (unint64_t)multiUserDeltaScoreThresholdForPhId:()SpeakerRecognition;
- (unint64_t)multiUserHighScoreThresholdForPhId:()SpeakerRecognition;
- (unint64_t)multiUserLowScoreThresholdForPhId:()SpeakerRecognition;
@end

@implementation CSAsset(SpeakerRecognition)

- (uint64_t)useTDTIEnrollment
{
  return [a1 getBoolForKey:@"useTDTIEnrollment" category:@"speakerRecognition" default:0];
}

- (uint64_t)useSpeakerRecognitionAsset
{
  v1 = [a1 getNumberForKey:@"useSpeakerRecognitionAsset" category:@"speakerRecognition" default:0];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (BOOL)containsMultiUserThresholds
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v1 = [a1 path];
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  char v3 = [v2 fileExistsAtPath:v1];

  if (v3)
  {
    v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v1];
    if (!v4)
    {
      v10 = *MEMORY[0x263F37FA8];
      BOOL v8 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSAsset(SpeakerRecognition) containsMultiUserThresholds]";
        __int16 v18 = 2114;
        v19 = v1;
        _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Could not read: %{public}@", buf, 0x16u);
        BOOL v8 = 0;
      }
      goto LABEL_17;
    }
    id v15 = 0;
    v5 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v15];
    id v6 = v15;
    if (v6)
    {
      v7 = *MEMORY[0x263F37FA8];
      BOOL v8 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      *(_DWORD *)buf = 136315650;
      v17 = "-[CSAsset(SpeakerRecognition) containsMultiUserThresholds]";
      __int16 v18 = 2114;
      v19 = v1;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Could not decode contents of: %{public}@: err: %{public}@", buf, 0x20u);
    }
    else if (v5)
    {
      v11 = [v5 objectForKeyedSubscript:@"speakerRecognition"];
      if (v11)
      {
        v12 = [v5 objectForKeyedSubscript:@"speakerRecognition"];
        v13 = [v12 objectForKeyedSubscript:@"multiUserConfidentScoreThreshold"];
        BOOL v8 = v13 != 0;
      }
      else
      {
        BOOL v8 = 0;
      }

      goto LABEL_16;
    }
    BOOL v8 = 0;
    goto LABEL_16;
  }
  v9 = *MEMORY[0x263F37FA8];
  BOOL v8 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[CSAsset(SpeakerRecognition) containsMultiUserThresholds]";
    __int16 v18 = 2114;
    v19 = v1;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@ doesnt exist", buf, 0x16u);
    BOOL v8 = 0;
  }
LABEL_18:

  return v8;
}

- (uint64_t)satImplicitTrainingEnabled
{
  BOOL v2 = (CSIsIOS() & 1) != 0 || CSIsMac();

  return [a1 getBoolForKey:@"implicit_training_enabled" category:@"speakerRecognition" default:v2];
}

- (id)keywordDetectorNDAPIConfigFilePath
{
  BOOL v2 = [a1 resourcePath];
  char v3 = [a1 getStringForKey:@"configFileNDAPI" category:@"voiceTriggerSecondPassAOP" default:@"config.txt"];
  v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

- (id)keywordDetectorQuasarConfigFilePath
{
  BOOL v2 = [a1 resourcePath];
  if ([MEMORY[0x263F380D0] horsemanDeviceType] != 1
    || ([MEMORY[0x263F380F8] getDefaultRecognizerForB238],
        char v3 = objc_claimAutoreleasedReturnValue(),
        [a1 getStringForKey:v3 category:@"voiceTriggerSecondPass" default:0],
        v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v4 = [a1 getStringForKey:@"configFileRecognizer" category:@"voiceTriggerSecondPassAOP" default:@"recognizer.json"];
  }
  v5 = [v2 stringByAppendingPathComponent:v4];

  return v5;
}

- (uint64_t)voiceProfilePruningCookie
{
  return [a1 getStringForKey:@"pruningCookie" category:@"speakerRecognition" default:0];
}

- (uint64_t)maxAllowedEnrollmentUtterances
{
  v1 = [a1 getNumberForKey:@"maxEnrollmentUtterances" category:@"speakerRecognition" default:&unk_26CD456D0];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (uint64_t)pruningNumRetentionUtterance
{
  v1 = [a1 getNumberForKey:@"numPruningRetentionUtt" category:@"speakerRecognition" default:&unk_26CD456B8];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (float)pruningThresholdPSR
{
  v1 = [a1 getNumberForKey:@"pruningPSRThreshold" category:@"speakerRecognition" default:&unk_26CD456F8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)pruningThresholdSAT
{
  v1 = [a1 getNumberForKey:@"pruningSATThreshold" category:@"speakerRecognition" default:&unk_26CD456F8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)pruningExplicitUttThresholdPSR
{
  v1 = [a1 getNumberForKey:@"pruningExplicitPSRThreshold" category:@"speakerRecognition" default:&unk_26CD456F8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)pruningExplicitUttThresholdSAT
{
  v1 = [a1 getNumberForKey:@"pruningExplicitSATThreshold" category:@"speakerRecognition" default:&unk_26CD456F8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)satVTImplicitThreshold
{
  v1 = [a1 getNumberForKey:@"implicitVTThreshold" category:@"speakerRecognition" default:&unk_26CD456F8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)satImplicitProfileDeltaThreshold
{
  v1 = [a1 getNumberForKey:@"implicitProfileDeltaThreshold" category:@"speakerRecognition" default:&unk_26CD45718];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)satImplicitProfileThreshold
{
  [a1 satScoreThreshold];
  float v2 = objc_msgSend(NSNumber, "numberWithFloat:");
  float v3 = [a1 getNumberForKey:@"implicitProfileThreshold" category:@"speakerRecognition" default:v2];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (float)psrCombinationWeight
{
  v1 = [a1 getNumberForKey:@"combinationWeight" category:@"speakerRecognition" default:&unk_26CD45708];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (uint64_t)multiUserDeltaScoreThreshold
{
  v1 = [a1 getNumberForKey:@"multiUserDeltaScoreThreshold" category:@"speakerRecognition" default:&unk_26CD456A0];
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (unint64_t)multiUserDeltaScoreThresholdForPhId:()SpeakerRecognition
{
  uint64_t v2 = objc_msgSend(a1, "getPhraseConfig:");
  float v3 = v2;
  if (v2
    && ([v2 objectForKeyedSubscript:@"multiUserDeltaScoreThreshold"],
        float v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    float v5 = [v3 objectForKeyedSubscript:@"multiUserDeltaScoreThreshold"];
    [v5 floatValue];
    unint64_t v7 = (unint64_t)v6;
  }
  else
  {
    unint64_t v7 = [a1 multiUserDeltaScoreThreshold];
  }

  return v7;
}

- (uint64_t)multiUserConfidentScoreThreshold
{
  v1 = [a1 getNumberForKey:@"multiUserConfidentScoreThreshold" category:@"speakerRecognition" default:&unk_26CD45688];
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (unint64_t)multiUserConfidentScoreThresholdForPhId:()SpeakerRecognition
{
  uint64_t v2 = objc_msgSend(a1, "getPhraseConfig:");
  float v3 = v2;
  if (v2
    && ([v2 objectForKeyedSubscript:@"multiUserConfidentScoreThreshold"],
        float v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    float v5 = [v3 objectForKeyedSubscript:@"multiUserConfidentScoreThreshold"];
    [v5 floatValue];
    unint64_t v7 = (unint64_t)v6;
  }
  else
  {
    unint64_t v7 = [a1 multiUserConfidentScoreThreshold];
  }

  return v7;
}

- (uint64_t)multiUserHighScoreThreshold
{
  v1 = [a1 getNumberForKey:@"multiUserHighScoreThreshold" category:@"speakerRecognition" default:&unk_26CD45670];
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (unint64_t)multiUserHighScoreThresholdForPhId:()SpeakerRecognition
{
  uint64_t v2 = objc_msgSend(a1, "getPhraseConfig:");
  float v3 = v2;
  if (v2
    && ([v2 objectForKeyedSubscript:@"multiUserHighScoreThreshold"],
        float v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    float v5 = [v3 objectForKeyedSubscript:@"multiUserHighScoreThreshold"];
    [v5 floatValue];
    unint64_t v7 = (unint64_t)v6;
  }
  else
  {
    unint64_t v7 = [a1 multiUserHighScoreThreshold];
  }

  return v7;
}

- (uint64_t)multiUserLowScoreThreshold
{
  v1 = [a1 getNumberForKey:@"multiUserLowScoreThreshold" category:@"speakerRecognition" default:&unk_26CD45658];
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (unint64_t)multiUserLowScoreThresholdForPhId:()SpeakerRecognition
{
  uint64_t v2 = objc_msgSend(a1, "getPhraseConfig:");
  float v3 = v2;
  if (v2
    && ([v2 objectForKeyedSubscript:@"multiUserLowScoreThreshold"],
        float v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    float v5 = [v3 objectForKeyedSubscript:@"multiUserLowScoreThreshold"];
    [v5 floatValue];
    unint64_t v7 = (unint64_t)v6;
  }
  else
  {
    unint64_t v7 = [a1 multiUserLowScoreThreshold];
  }

  return v7;
}

- (float)satScoreThreshold
{
  v1 = [a1 getNumberForKey:@"satThreshold" category:@"speakerRecognition" default:&unk_26CD456E8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)satScoreThresholdForPhId:()SpeakerRecognition
{
  float v2 = objc_msgSend(a1, "getPhraseConfig:");
  float v3 = v2;
  if (v2
    && ([v2 objectForKeyedSubscript:@"satThreshold"],
        float v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    float v5 = [v3 objectForKeyedSubscript:@"satThreshold"];
    [v5 floatValue];
    float v7 = v6;
  }
  else
  {
    [a1 satScoreThreshold];
    float v7 = v8;
  }

  return v7;
}

- (id)getPhraseConfig:()SpeakerRecognition
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  float v4 = [a1 getValueForKey:@"phrase" category:@"speakerRecognition"];
  float v5 = v4;
  if (v4 && [v4 count] <= a3)
  {
    float v7 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      v10 = "-[CSAsset(SpeakerRecognition) getPhraseConfig:]";
      __int16 v11 = 1024;
      int v12 = a3;
      _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s Config for ph: %d doesn't exist, use default", (uint8_t *)&v9, 0x12u);
    }
    float v6 = 0;
  }
  else
  {
    float v6 = [v5 objectAtIndex:a3];
  }

  return v6;
}

- (uint64_t)containsSpeakerRecognitionCategory
{
  return [a1 containsCategory:@"speakerRecognition"];
}

@end