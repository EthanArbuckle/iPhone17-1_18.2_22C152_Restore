@interface TICandidateBarUsageAnalyzer
- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5;
- (TICandidateBarUsageAnalyzer)init;
- (id)stringFromInputMethod:(unint64_t)a3;
- (id)stringFromSelectionType:(unint64_t)a3;
- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4;
- (void)analyzeWordEntry:(id)a3;
- (void)dispatchEventWithInputMethod:(unint64_t)a3 typingEngineType:(unsigned int)a4 selectionType:(unint64_t)a5 keyboardState:(id)a6;
- (void)registerEventSpec;
@end

@implementation TICandidateBarUsageAnalyzer

- (void).cxx_destruct
{
}

- (id)stringFromSelectionType:(unint64_t)a3
{
  if (a3 - 1 > 9) {
    return @"None";
  }
  else {
    return *(&off_1E6E2CA60 + a3 - 1);
  }
}

- (id)stringFromInputMethod:(unint64_t)a3
{
  if (a3) {
    return @"Pathed";
  }
  else {
    return @"Tapped";
  }
}

- (void)dispatchEventWithInputMethod:(unint64_t)a3 typingEngineType:(unsigned int)a4 selectionType:(unint64_t)a5 keyboardState:(id)a6
{
  v52[20] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  v10 = [TIKBAnalyticsMetricsContext alloc];
  v11 = [(TITypingSession *)self->_currentSession sessionParams];
  v12 = [v11 activeInputModes];
  v13 = [(TITypingSession *)self->_currentSession sessionParams];
  v14 = [v13 testingParameters];
  v15 = [(TIKBAnalyticsMetricsContext *)v10 initWithKeyboardState:v9 activeInputModes:v12 testingParameters:v14];

  v51[0] = @"inputMethod";
  v50 = [(TICandidateBarUsageAnalyzer *)self stringFromInputMethod:a3];
  v52[0] = v50;
  v51[1] = @"selectionType";
  v49 = [(TICandidateBarUsageAnalyzer *)self stringFromSelectionType:a5];
  v52[1] = v49;
  v51[2] = @"predictionEnabled";
  v48 = [NSNumber numberWithBool:self->_predictionEnabled];
  v52[2] = v48;
  v51[3] = @"continuousPathEnabled";
  v47 = [NSNumber numberWithBool:self->_continuousPathEnabled];
  v52[3] = v47;
  v51[4] = @"autocorrectionEnabled";
  v16 = NSNumber;
  int v17 = [(TIKBAnalyticsMetricsContext *)v15 keyboardType];
  uint64_t v18 = 18;
  if (v17 == 5) {
    uint64_t v18 = 19;
  }
  v46 = [v16 numberWithBool:*((unsigned __int8 *)&self->super.isa + v18)];
  v52[4] = v46;
  v51[5] = kFeatureKeyboardUsage;
  v45 = [(TITypingSession *)self->_currentSession featureUsageMetricsCache];
  v44 = [v45 featureUsageMetricFromName:kFeatureKeyboardUsage forContext:v15];
  v52[5] = v44;
  v51[6] = kFeatureContinuousPathUsage;
  v43 = [(TITypingSession *)self->_currentSession featureUsageMetricsCache];
  v42 = [v43 featureUsageMetricFromName:kFeatureContinuousPathUsage forContext:v15];
  v52[6] = v42;
  v51[7] = kFeatureAutocorrectionUsage;
  v41 = [(TITypingSession *)self->_currentSession featureUsageMetricsCache];
  v40 = [v41 featureUsageMetricFromName:kFeatureAutocorrectionUsage forContext:v15];
  v52[7] = v40;
  v51[8] = kFeatureCandidateBarUsage;
  v39 = [(TITypingSession *)self->_currentSession featureUsageMetricsCache];
  v38 = [v39 featureUsageMetricFromName:kFeatureCandidateBarUsage forContext:v15];
  v52[8] = v38;
  v51[9] = kFeatureMultilingualUsage;
  v37 = [(TITypingSession *)self->_currentSession featureUsageMetricsCache];
  v36 = [v37 featureUsageMetricFromName:kFeatureMultilingualUsage forContext:v15];
  v52[9] = v36;
  v51[10] = kFeatureStringTypingSpeed;
  v35 = [(TITypingSession *)self->_currentSession featureUsageMetricsCache];
  v34 = [v35 featureUsageMetricFromName:kFeatureStringTypingSpeed forContext:v15];
  v52[10] = v34;
  v51[11] = kFeatureStringTypingEngine;
  v33 = TIKeyboardCandidateTypingEngineTypeToString();
  v52[11] = v33;
  v51[12] = kFeatureStringAssetAvailabilityStatus;
  v19 = [(TITypingSession *)self->_currentSession sessionParams];
  uint64_t v20 = [v19 assetAvailabilityStatus];
  v21 = @"Installed";
  if (!v20) {
    v21 = @"Unavailable";
  }
  v22 = v21;
  v52[12] = v22;
  v51[13] = kFeatureStringKeyboardLanguage;
  v23 = [(TIAnalyticsMetricsContext *)v15 inputLanguage];
  v52[13] = v23;
  v51[14] = kFeatureStringKeyboardRegion;
  v24 = [(TIAnalyticsMetricsContext *)v15 inputRegion];
  v52[14] = v24;
  v51[15] = kFeatureStringKeyboardVariant;
  v25 = [(TIKBAnalyticsMetricsContext *)v15 inputVariant];
  v52[15] = v25;
  v51[16] = kFeatureStringKeyboardSecondaryLanguage;
  v26 = [(TIKBAnalyticsMetricsContext *)v15 secondaryLanguage];
  v52[16] = v26;
  v51[17] = kFeatureStringKeyboardSecondaryRegion;
  v27 = [(TIKBAnalyticsMetricsContext *)v15 secondaryRegion];
  v52[17] = v27;
  v51[18] = kFeatureStringKeyboardLayout;
  v28 = [(TIKBAnalyticsMetricsContext *)v15 layoutName];
  v52[18] = v28;
  v51[19] = kFeatureStringKeyboardType;
  v29 = +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:[(TIKBAnalyticsMetricsContext *)v15 keyboardType]];
  v52[19] = v29;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:20];

  v30 = [MEMORY[0x1E4FAE260] sharedInstance];
  v31 = [(TIKBAnalyticsMetricsContext *)v15 testingParameters];
  [v30 dispatchEventWithName:@"candidateBarUsage" payload:v32 testingParameters:v31 allowSparsePayload:0];
}

- (void)registerEventSpec
{
  v56[20] = *MEMORY[0x1E4F143B8];
  v46 = (void *)MEMORY[0x1E4FAE248];
  v2 = (void *)MEMORY[0x1E4FAE250];
  v55[0] = @"Tapped";
  v55[1] = @"Pathed";
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  v52 = [v2 stringFieldSpecWithName:@"inputMethod" allowedValues:v53];
  v56[0] = v52;
  v3 = (void *)MEMORY[0x1E4FAE250];
  v54[0] = @"None";
  v54[1] = @"Typed String";
  v54[2] = @"Autocorrection";
  v54[3] = @"Prediction";
  v54[4] = @"Completion";
  v54[5] = @"Emoji Prediction";
  v54[6] = @"Emoji Replacement";
  v54[7] = @"Text Replacement";
  v54[8] = @"PQT";
  v54[9] = @"Smart Response";
  v54[10] = @"Other";
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:11];
  v50 = [v3 stringFieldSpecWithName:@"selectionType" allowedValues:v51];
  v56[1] = v50;
  v49 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"predictionEnabled"];
  v56[2] = v49;
  v48 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"continuousPathEnabled"];
  v56[3] = v48;
  v47 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"autocorrectionEnabled"];
  v56[4] = v47;
  v4 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v5 = kFeatureKeyboardUsage;
  v45 = TIFeatureUsageAllowedValues();
  v44 = [v4 stringFieldSpecWithName:v5 allowedValues:v45];
  v56[5] = v44;
  v6 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v7 = kFeatureContinuousPathUsage;
  v43 = TIFeatureUsageAllowedValues();
  v42 = [v6 stringFieldSpecWithName:v7 allowedValues:v43];
  v56[6] = v42;
  v8 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v9 = kFeatureAutocorrectionUsage;
  v41 = TIFeatureUsageAllowedValues();
  v40 = [v8 stringFieldSpecWithName:v9 allowedValues:v41];
  v56[7] = v40;
  v10 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v11 = kFeatureCandidateBarUsage;
  v39 = TIFeatureUsageAllowedValues();
  v38 = [v10 stringFieldSpecWithName:v11 allowedValues:v39];
  v56[8] = v38;
  v12 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v13 = kFeatureMultilingualUsage;
  v37 = TIFeatureUsageAllowedValues();
  v36 = [v12 stringFieldSpecWithName:v13 allowedValues:v37];
  v56[9] = v36;
  v14 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v15 = kFeatureStringTypingSpeed;
  v35 = TITypingSpeedAllowedValues();
  v34 = [v14 stringFieldSpecWithName:v15 allowedValues:v35];
  v56[10] = v34;
  v16 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v17 = kFeatureStringTypingEngine;
  v33 = TITypingEngineAllowedValues();
  v32 = [v16 stringFieldSpecWithName:v17 allowedValues:v33];
  v56[11] = v32;
  uint64_t v18 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v19 = kFeatureStringAssetAvailabilityStatus;
  v31 = TIAssetAvailabilityStatusAllowedValues();
  uint64_t v20 = [v18 stringFieldSpecWithName:v19 allowedValues:v31];
  v56[12] = v20;
  v21 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLanguage];
  v56[13] = v21;
  v22 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardRegion];
  v56[14] = v22;
  v23 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardVariant];
  v56[15] = v23;
  v24 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryLanguage];
  v56[16] = v24;
  v25 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryRegion];
  v56[17] = v25;
  v26 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLayout];
  v56[18] = v26;
  v27 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardType];
  v56[19] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:20];
  v29 = [v46 eventSpecWithName:@"candidateBarUsage" inputModeRequired:0 fieldSpecs:v28];

  v30 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v30 registerEventSpec:v29];
}

- (void)analyzeWordEntry:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 acceptedCandidate];
  v6 = [v4 candidatesOffered];
  uint64_t v7 = [v6 lastObject];

  v8 = [v5 candidate];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    uint64_t v10 = [v5 isContinuousPathConversion];
    if (([v4 wordEntryType] & 4) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v5 proactiveTrigger],
            v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            v12))
      {
        uint64_t v11 = 8;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = 7;
        }
        else
        {
          if (([v5 isResponseKitCandidate] & 1) == 0)
          {
            uint64_t v13 = [v5 candidate];
            if ([v13 _containsEmoji])
            {
              v14 = [v5 input];
              uint64_t v15 = [v14 length];

              if (!v15)
              {
                uint64_t v11 = 5;
                goto LABEL_35;
              }
            }
            else
            {
            }
            v16 = [v5 candidate];
            if ([v16 _containsEmoji])
            {
              uint64_t v17 = [v5 input];
              uint64_t v18 = [v17 length];

              if (v18)
              {
                uint64_t v11 = 6;
                goto LABEL_35;
              }
            }
            else
            {
            }
            uint64_t v19 = [v5 input];
            uint64_t v20 = [v19 length];

            if (v20)
            {
              v21 = [v5 candidate];
              v22 = [v7 corrections];
              v23 = [v22 autocorrection];
              v24 = [v23 input];
              char v25 = [v21 isEqualToString:v24];

              if (v25)
              {
                uint64_t v11 = 1;
              }
              else
              {
                v26 = [v5 candidate];
                v27 = [v7 corrections];
                v28 = [v27 autocorrection];
                v29 = [v28 candidate];
                char v30 = [v26 isEqualToString:v29];

                if (v30)
                {
                  uint64_t v11 = 2;
                }
                else
                {
                  long long v44 = 0u;
                  long long v45 = 0u;
                  long long v42 = 0u;
                  long long v43 = 0u;
                  id obj = [v7 predictions];
                  uint64_t v41 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
                  if (v41)
                  {
                    uint64_t v40 = *(void *)v43;
                    uint64_t v11 = 4;
LABEL_27:
                    uint64_t v31 = 0;
                    while (1)
                    {
                      if (*(void *)v43 != v40) {
                        objc_enumerationMutation(obj);
                      }
                      v32 = *(void **)(*((void *)&v42 + 1) + 8 * v31);
                      v33 = [v5 candidate];
                      v34 = [v32 candidate];
                      char v35 = [v33 isEqualToString:v34];

                      if (v35) {
                        break;
                      }
                      if (v41 == ++v31)
                      {
                        uint64_t v41 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
                        if (v41) {
                          goto LABEL_27;
                        }
                        goto LABEL_33;
                      }
                    }
                  }
                  else
                  {
LABEL_33:
                    uint64_t v11 = 10;
                  }
                }
              }
            }
            else
            {
              uint64_t v11 = 3;
            }
            goto LABEL_35;
          }
          uint64_t v11 = 9;
        }
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
LABEL_35:
    v36 = [v4 acceptedCandidate];
    uint64_t v37 = [v36 typingEngine];
    v38 = [v4 keyboardState];
    [(TICandidateBarUsageAnalyzer *)self dispatchEventWithInputMethod:v10 typingEngineType:v37 selectionType:v11 keyboardState:v38];
  }
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a5)
  {
    objc_storeStrong((id *)&self->_currentSession, a3);
    uint64_t v9 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
    self->_predictionEnabled = [v9 BOOLForPreferenceKey:*MEMORY[0x1E4FAE948]];
    self->_continuousPathEnabled = [v9 BOOLForPreferenceKey:*MEMORY[0x1E4FAE840]];
    self->_autocorrectionEnabled = [v9 BOOLForPreferenceKey:*MEMORY[0x1E4FAE7A8]];
    self->_hwAutocorrectionEnabled = [v9 BOOLForPreferenceKey:*MEMORY[0x1E4FAE5F0]];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = [(TITypingSession *)self->_currentSession userActionHistory];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (![v15 actionType]) {
            [(TICandidateBarUsageAnalyzer *)self analyzeWordEntry:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
  return a5 != 0;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:a3 alignedSession:a4];
}

- (TICandidateBarUsageAnalyzer)init
{
  v5.receiver = self;
  v5.super_class = (Class)TICandidateBarUsageAnalyzer;
  v2 = [(TICandidateBarUsageAnalyzer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TICandidateBarUsageAnalyzer *)v2 registerEventSpec];
  }
  return v3;
}

@end