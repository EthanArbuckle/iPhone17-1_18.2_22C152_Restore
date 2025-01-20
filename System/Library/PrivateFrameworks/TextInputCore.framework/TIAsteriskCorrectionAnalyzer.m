@interface TIAsteriskCorrectionAnalyzer
- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5;
- (BOOL)checkIfSession:(id)a3 isFromAllowedApp:(id)a4;
- (TIAsteriskCorrectionAnalyzer)init;
- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4;
- (void)registerEventSpec;
@end

@implementation TIAsteriskCorrectionAnalyzer

- (void)registerEventSpec
{
  v48[17] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4FAE248];
  v3 = (void *)MEMORY[0x1E4FAE250];
  v47 = TIACCorrectionTypeValues();
  v46 = [v3 stringFieldSpecWithName:@"correctionType" allowedValues:v47];
  v48[0] = v46;
  v45 = [MEMORY[0x1E4FAE250] enumFieldSpecWithName:@"prevMessageAutoCorrectionType"];
  v48[1] = v45;
  v4 = (void *)MEMORY[0x1E4FAE250];
  id v5 = &unk_1F3FA76E8;
  v44 = [v4 stringFieldSpecWithName:@"bundleId" allowedValues:&unk_1F3FA76E8];
  v48[2] = v44;
  v6 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v7 = kFeatureKeyboardUsage;
  v43 = TIFeatureUsageAllowedValues();
  v42 = [v6 stringFieldSpecWithName:v7 allowedValues:v43];
  v48[3] = v42;
  v8 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v9 = kFeatureContinuousPathUsage;
  v41 = TIFeatureUsageAllowedValues();
  v40 = [v8 stringFieldSpecWithName:v9 allowedValues:v41];
  v48[4] = v40;
  v10 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v11 = kFeatureAutocorrectionUsage;
  v39 = TIFeatureUsageAllowedValues();
  v38 = [v10 stringFieldSpecWithName:v11 allowedValues:v39];
  v48[5] = v38;
  v12 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v13 = kFeatureCandidateBarUsage;
  v37 = TIFeatureUsageAllowedValues();
  v36 = [v12 stringFieldSpecWithName:v13 allowedValues:v37];
  v48[6] = v36;
  v14 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v15 = kFeatureMultilingualUsage;
  v35 = TIFeatureUsageAllowedValues();
  v34 = [v14 stringFieldSpecWithName:v15 allowedValues:v35];
  v48[7] = v34;
  v16 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v17 = kFeatureStringTypingSpeed;
  v33 = TITypingSpeedAllowedValues();
  v32 = [v16 stringFieldSpecWithName:v17 allowedValues:v33];
  v48[8] = v32;
  v18 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v19 = kFeatureStringAssetAvailabilityStatus;
  v31 = TIAssetAvailabilityStatusAllowedValues();
  v20 = [v18 stringFieldSpecWithName:v19 allowedValues:v31];
  v48[9] = v20;
  v21 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLanguage];
  v48[10] = v21;
  v22 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardRegion];
  v48[11] = v22;
  v23 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardVariant];
  v48[12] = v23;
  v24 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryLanguage];
  v48[13] = v24;
  v25 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryRegion];
  v48[14] = v25;
  v26 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLayout];
  v48[15] = v26;
  v27 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardType];
  v48[16] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:17];
  v29 = [v2 eventSpecWithName:@"asteriskCorrection" inputModeRequired:0 fieldSpecs:v28];

  v30 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v30 registerEventSpec:v29];
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    id v10 = &unk_1F3FA76E8;
    BOOL v11 = [(TIAsteriskCorrectionAnalyzer *)self checkIfSession:v8 isFromAllowedApp:&unk_1F3FA76E8];

    if (v11)
    {
      id v37 = v9;
      v12 = [MEMORY[0x1E4F1CA48] array];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v39 = v8;
      uint64_t v13 = [v8 userActionHistory];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (!v14)
      {
        v16 = 0;
        goto LABEL_26;
      }
      uint64_t v15 = v14;
      uint64_t v41 = 0;
      v16 = 0;
      uint64_t v17 = 1;
      uint64_t v18 = *(void *)v43;
      v38 = v13;
      while (1)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v43 != v18) {
            objc_enumerationMutation(v13);
          }
          v20 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if ([v20 actionType])
          {
            v21 = [v20 documentState];
            if (![v21 documentIsEmpty] || !objc_msgSend(v12, "count"))
            {

              goto LABEL_21;
            }
            if ([v20 actionType] == 2)
            {
            }
            else
            {
              int v24 = [v20 actionType];

              if (v24 != 11) {
                goto LABEL_21;
              }
            }
            v25 = [TITypingSession alloc];
            v26 = [v39 locale];
            v27 = [(TITypingSession *)v25 initWithLocale:v26 keyboardLayout:0];

            v28 = [v39 sessionParams];
            [(TITypingSession *)v27 setSessionParams:v28];

            v29 = [v39 featureUsageMetricsCache];
            [(TITypingSession *)v27 setFeatureUsageMetricsCache:v29];

            [(TITypingSession *)v27 setUserActionHistory:v12];
            uint64_t v40 = [MEMORY[0x1E4F1CA48] array];

            v30 = [TIAsteriskCorrectionMessageEvent alloc];
            [v39 applicationID];
            uint64_t v31 = v15;
            uint64_t v32 = v18;
            v34 = v33 = v16;
            v35 = [(TIAsteriskCorrectionMessageEvent *)v30 initWithSession:v27 andPrevMsgAutocorrectionType:v41 andBundleId:v34];

            uint64_t v18 = v32;
            uint64_t v15 = v31;

            [(TIAsteriskCorrectionMessageEvent *)v35 analyzeEvent];
            uint64_t v41 = v17;
            uint64_t v17 = 1;
            v12 = (void *)v40;
            v16 = v35;
            uint64_t v13 = v38;
          }
          else
          {
            char v22 = [v20 wordEntryType];
            uint64_t v23 = 2;
            if (v17 != 3) {
              uint64_t v23 = v17;
            }
            if (v22) {
              uint64_t v17 = 3;
            }
            else {
              uint64_t v17 = v23;
            }
          }
LABEL_21:
          [v12 addObject:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (!v15)
        {
LABEL_26:

          LOBYTE(v11) = 1;
          id v8 = v39;
          id v9 = v37;
          break;
        }
      }
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)checkIfSession:(id)a3 isFromAllowedApp:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        BOOL v11 = objc_msgSend(v5, "applicationID", (void)v13);
        LOBYTE(v10) = [v11 isEqualToString:v10];

        if (v10)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:a3 alignedSession:a4];
}

- (TIAsteriskCorrectionAnalyzer)init
{
  v5.receiver = self;
  v5.super_class = (Class)TIAsteriskCorrectionAnalyzer;
  v2 = [(TIAsteriskCorrectionAnalyzer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TIAsteriskCorrectionAnalyzer *)v2 registerEventSpec];
  }
  return v3;
}

@end