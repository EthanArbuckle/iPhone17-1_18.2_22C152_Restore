@interface TIAutocorrectionAccuracyAnalyzer
- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5;
- (BOOL)analyzeWordEntryAligned:(id)a3;
- (TIAutocorrectionAccuracyAnalyzer)init;
- (TITypingSession)currentSession;
- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4;
- (void)registerEventSpec;
- (void)setCurrentSession:(id)a3;
@end

@implementation TIAutocorrectionAccuracyAnalyzer

- (void).cxx_destruct
{
}

- (void)setCurrentSession:(id)a3
{
}

- (TITypingSession)currentSession
{
  return self->_currentSession;
}

- (void)registerEventSpec
{
  v51[17] = *MEMORY[0x1E4F143B8];
  v49 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"outcome"];
  v51[0] = v49;
  v48 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"alignmentConfidence"];
  v51[1] = v48;
  v2 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v3 = kFeatureKeyboardUsage;
  v47 = TIFeatureUsageAllowedValues();
  v46 = [v2 stringFieldSpecWithName:v3 allowedValues:v47];
  v51[2] = v46;
  v4 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v5 = kFeatureContinuousPathUsage;
  v45 = TIFeatureUsageAllowedValues();
  v44 = [v4 stringFieldSpecWithName:v5 allowedValues:v45];
  v51[3] = v44;
  v6 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v7 = kFeatureAutocorrectionUsage;
  v43 = TIFeatureUsageAllowedValues();
  v42 = [v6 stringFieldSpecWithName:v7 allowedValues:v43];
  v51[4] = v42;
  v8 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v9 = kFeatureCandidateBarUsage;
  v41 = TIFeatureUsageAllowedValues();
  v40 = [v8 stringFieldSpecWithName:v9 allowedValues:v41];
  v51[5] = v40;
  v10 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v11 = kFeatureMultilingualUsage;
  v39 = TIFeatureUsageAllowedValues();
  v38 = [v10 stringFieldSpecWithName:v11 allowedValues:v39];
  v51[6] = v38;
  v12 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v13 = kFeatureStringTypingSpeed;
  v37 = TITypingSpeedAllowedValues();
  v36 = [v12 stringFieldSpecWithName:v13 allowedValues:v37];
  v51[7] = v36;
  v14 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v15 = kFeatureStringTypingEngine;
  v35 = TITypingEngineAllowedValues();
  v34 = [v14 stringFieldSpecWithName:v15 allowedValues:v35];
  v51[8] = v34;
  v16 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v17 = kFeatureStringAssetAvailabilityStatus;
  v18 = TIAssetAvailabilityStatusAllowedValues();
  v19 = [v16 stringFieldSpecWithName:v17 allowedValues:v18];
  v51[9] = v19;
  v20 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLanguage];
  v51[10] = v20;
  v21 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardRegion];
  v51[11] = v21;
  v22 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardVariant];
  v51[12] = v22;
  v23 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryLanguage];
  v51[13] = v23;
  v24 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryRegion];
  v51[14] = v24;
  v25 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLayout];
  v51[15] = v25;
  v26 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardType];
  v51[16] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:17];

  v50[0] = v27;
  v28 = fieldNameSuffices();
  v29 = fieldSpecWithSuffices(v28);
  v50[1] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  v31 = concatArrays(v30);

  v32 = [MEMORY[0x1E4FAE248] eventSpecWithName:@"autocorrectionAccuracy" inputModeRequired:0 fieldSpecs:v31];
  v33 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v33 registerEventSpec:v32];
}

- (BOOL)analyzeWordEntryAligned:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 originalWord];
  v6 = [v5 keyboardState];

  uint64_t v7 = [TIKBAnalyticsMetricsContext alloc];
  v8 = [(TITypingSession *)self->_currentSession sessionParams];
  uint64_t v9 = [v8 activeInputModes];
  v10 = [(TITypingSession *)self->_currentSession sessionParams];
  uint64_t v11 = [v10 testingParameters];
  v12 = [(TIKBAnalyticsMetricsContext *)v7 initWithKeyboardState:v6 activeInputModes:v9 testingParameters:v11];

  id v13 = objc_alloc(MEMORY[0x1E4F1CA20]);
  v14 = [(TIAnalyticsMetricsContext *)v12 inputLanguageAndRegion];
  uint64_t v15 = (void *)[v13 initWithLocaleIdentifier:v14];

  if (v15)
  {
    uint64_t v16 = payloadForWordEntryAligned(v4, v15);
    if (v16)
    {
      uint64_t v17 = v16;
      v53[0] = kFeatureKeyboardUsage;
      v48 = [(TITypingSession *)self->_currentSession featureUsageMetricsCache];
      v47 = [v48 featureUsageMetricFromName:kFeatureKeyboardUsage forContext:v12];
      v54[0] = v47;
      v53[1] = kFeatureContinuousPathUsage;
      v46 = [(TITypingSession *)self->_currentSession featureUsageMetricsCache];
      v45 = [v46 featureUsageMetricFromName:kFeatureContinuousPathUsage forContext:v12];
      v54[1] = v45;
      v53[2] = kFeatureAutocorrectionUsage;
      v44 = [(TITypingSession *)self->_currentSession featureUsageMetricsCache];
      v43 = [v44 featureUsageMetricFromName:kFeatureAutocorrectionUsage forContext:v12];
      v54[2] = v43;
      v53[3] = kFeatureCandidateBarUsage;
      v42 = [(TITypingSession *)self->_currentSession featureUsageMetricsCache];
      v41 = [v42 featureUsageMetricFromName:kFeatureCandidateBarUsage forContext:v12];
      v54[3] = v41;
      v53[4] = kFeatureMultilingualUsage;
      v40 = [(TITypingSession *)self->_currentSession featureUsageMetricsCache];
      v39 = [v40 featureUsageMetricFromName:kFeatureMultilingualUsage forContext:v12];
      v54[4] = v39;
      v53[5] = kFeatureStringTypingSpeed;
      v38 = [(TITypingSession *)self->_currentSession featureUsageMetricsCache];
      v37 = [v38 featureUsageMetricFromName:kFeatureStringTypingSpeed forContext:v12];
      v54[5] = v37;
      v53[6] = kFeatureStringAssetAvailabilityStatus;
      v36 = [(TITypingSession *)self->_currentSession sessionParams];
      uint64_t v18 = [v36 assetAvailabilityStatus];
      v19 = @"Installed";
      if (!v18) {
        v19 = @"Unavailable";
      }
      v35 = v19;
      v54[6] = v35;
      v53[7] = kFeatureStringKeyboardLanguage;
      [(TIAnalyticsMetricsContext *)v12 inputLanguage];
      v20 = v49 = v17;
      v54[7] = v20;
      v53[8] = kFeatureStringKeyboardRegion;
      v21 = [(TIAnalyticsMetricsContext *)v12 inputRegion];
      v54[8] = v21;
      v53[9] = kFeatureStringKeyboardVariant;
      [(TIKBAnalyticsMetricsContext *)v12 inputVariant];
      v22 = id v51 = v4;
      v54[9] = v22;
      v53[10] = kFeatureStringKeyboardSecondaryLanguage;
      [(TIKBAnalyticsMetricsContext *)v12 secondaryLanguage];
      v23 = v50 = v6;
      v54[10] = v23;
      v53[11] = kFeatureStringKeyboardSecondaryRegion;
      v24 = [(TIKBAnalyticsMetricsContext *)v12 secondaryRegion];
      v54[11] = v24;
      v53[12] = kFeatureStringKeyboardLayout;
      v25 = [(TIKBAnalyticsMetricsContext *)v12 layoutName];
      v54[12] = v25;
      v53[13] = kFeatureStringKeyboardType;
      v26 = +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:[(TIKBAnalyticsMetricsContext *)v12 keyboardType]];
      v54[13] = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:14];

      v6 = v50;
      id v4 = v51;

      v28 = v49;
      v52[0] = v27;
      v52[1] = v49;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
      v30 = mergeDicts(v29);

      v31 = [MEMORY[0x1E4FAE260] sharedInstance];
      v32 = [(TIKBAnalyticsMetricsContext *)v12 testingParameters];
      [v31 dispatchEventWithName:@"autocorrectionAccuracy" payload:v30 testingParameters:v32 allowSparsePayload:1];
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
    v28 = IXADefaultLogFacility();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"%s Input context has no locale", "-[TIAutocorrectionAccuracyAnalyzer analyzeWordEntryAligned:]");
      *(_DWORD *)buf = 138412290;
      v56 = v33;
      _os_log_error_impl(&dword_1E3F0E000, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }

  return v15 != 0;
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)&self->_currentSession, a3);
  if (a5)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = objc_msgSend(v10, "alignedEntries", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          if (![(TIAutocorrectionAccuracyAnalyzer *)self analyzeWordEntryAligned:*(void *)(*((void *)&v18 + 1) + 8 * i)])
          {
            BOOL v16 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    BOOL v16 = 1;
LABEL_12:
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:a3 alignedSession:a4];
}

- (TIAutocorrectionAccuracyAnalyzer)init
{
  v5.receiver = self;
  v5.super_class = (Class)TIAutocorrectionAccuracyAnalyzer;
  v2 = [(TIAutocorrectionAccuracyAnalyzer *)&v5 init];
  uint64_t v3 = v2;
  if (v2) {
    [(TIAutocorrectionAccuracyAnalyzer *)v2 registerEventSpec];
  }
  return v3;
}

@end