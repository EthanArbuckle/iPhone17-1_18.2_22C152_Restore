@interface TITypingSpeedDetailsAnalyzer
- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5;
- (TITypingSpeedDetailsAnalyzer)init;
- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4;
- (void)registerEventSpec;
@end

@implementation TITypingSpeedDetailsAnalyzer

- (void)registerEventSpec
{
  v63[36] = *MEMORY[0x1E4F143B8];
  v50 = (void *)MEMORY[0x1E4FAE248];
  v62 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"totalMessageDuration" minValue:&unk_1F3FA7F40 maxValue:0 significantDigits:0];
  v63[0] = v62;
  v61 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"totalMessageLength" minValue:&unk_1F3FA7F40 maxValue:0 significantDigits:0];
  v63[1] = v61;
  v60 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"totalWordsEntered" minValue:&unk_1F3FA7F40 maxValue:0 significantDigits:0];
  v63[2] = v60;
  v59 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"totalFinalWordEntered" minValue:&unk_1F3FA7F40 maxValue:0 significantDigits:0];
  v63[3] = v59;
  v58 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"messageDuration" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F58 significantDigits:0];
  v63[4] = v58;
  v57 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"messageLength" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F58 significantDigits:0];
  v63[5] = v57;
  v56 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"wordsEntered" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F58 significantDigits:0];
  v63[6] = v56;
  v55 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"finalWordEntered" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F58 significantDigits:0];
  v63[7] = v55;
  v54 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"static" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F70 significantDigits:0];
  v63[8] = v54;
  v53 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"dynamic" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F70 significantDigits:0];
  v63[9] = v53;
  v52 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"textReplacements" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F70 significantDigits:0];
  v63[10] = v52;
  v49 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"addressBook" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F70 significantDigits:0];
  v63[11] = v49;
  v48 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"namedEntities" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F70 significantDigits:0];
  v63[12] = v48;
  v47 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"oov" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F70 significantDigits:0];
  v63[13] = v47;
  v46 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"supplementalLexicon" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F70 significantDigits:0];
  v63[14] = v46;
  v45 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiPlane" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F70 significantDigits:0];
  v63[15] = v45;
  v44 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiPrediction" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F70 significantDigits:0];
  v63[16] = v44;
  v43 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiSearch" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F70 significantDigits:0];
  v63[17] = v43;
  v42 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"emojiPopover" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F70 significantDigits:0];
  v63[18] = v42;
  v41 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"responseKit" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F70 significantDigits:0];
  v63[19] = v41;
  v40 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"pqt" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F70 significantDigits:0];
  v63[20] = v40;
  v39 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"multilingual" minValue:&unk_1F3FA7F40 maxValue:&unk_1F3FA7F70 significantDigits:0];
  v63[21] = v39;
  v2 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v3 = kFeatureKeyboardUsage;
  v38 = TIFeatureUsageAllowedValues();
  v37 = [v2 stringFieldSpecWithName:v3 allowedValues:v38];
  v63[22] = v37;
  v4 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v5 = kFeatureContinuousPathUsage;
  v36 = TIFeatureUsageAllowedValues();
  v35 = [v4 stringFieldSpecWithName:v5 allowedValues:v36];
  v63[23] = v35;
  v6 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v7 = kFeatureAutocorrectionUsage;
  v34 = TIFeatureUsageAllowedValues();
  v33 = [v6 stringFieldSpecWithName:v7 allowedValues:v34];
  v63[24] = v33;
  v8 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v9 = kFeatureCandidateBarUsage;
  v32 = TIFeatureUsageAllowedValues();
  v31 = [v8 stringFieldSpecWithName:v9 allowedValues:v32];
  v63[25] = v31;
  v10 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v11 = kFeatureMultilingualUsage;
  v30 = TIFeatureUsageAllowedValues();
  v29 = [v10 stringFieldSpecWithName:v11 allowedValues:v30];
  v63[26] = v29;
  v12 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v13 = kFeatureStringTypingSpeed;
  v28 = TITypingSpeedAllowedValues();
  v27 = [v12 stringFieldSpecWithName:v13 allowedValues:v28];
  v63[27] = v27;
  v14 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v15 = kFeatureStringAssetAvailabilityStatus;
  v16 = TIAssetAvailabilityStatusAllowedValues();
  v17 = [v14 stringFieldSpecWithName:v15 allowedValues:v16];
  v63[28] = v17;
  v18 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLanguage];
  v63[29] = v18;
  v19 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardRegion];
  v63[30] = v19;
  v20 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardVariant];
  v63[31] = v20;
  v21 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryLanguage];
  v63[32] = v21;
  v22 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryRegion];
  v63[33] = v22;
  v23 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLayout];
  v63[34] = v23;
  v24 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardType];
  v63[35] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:36];
  v51 = [v50 eventSpecWithName:@"typingSpeedDetails" inputModeRequired:0 fieldSpecs:v25];

  v26 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v26 registerEventSpec:v51];
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a5)
  {
    uint64_t v9 = [v7 applicationID];
    int v10 = [v9 isEqualToString:@"com.apple.MobileSMS"];

    if (v10)
    {
      v48 = v8;
      v49 = objc_opt_new();
      id v11 = objc_alloc(MEMORY[0x1E4F28E10]);
      v12 = [v7 userActionHistory];
      uint64_t v13 = objc_msgSend(v11, "initWithKeyOptions:valueOptions:capacity:", 0, 5, objc_msgSend(v12, "count"));

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v14 = [v7 userActionHistory];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v60 objects:v66 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        v51 = 0;
        v17 = 0;
        uint64_t v18 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v61 != v18) {
              objc_enumerationMutation(v14);
            }
            v20 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            v21 = objc_msgSend(v20, "documentState", v48);
            int v22 = [v21 documentIsEmpty];

            if (v22)
            {

              v17 = 0;
            }
            if (![v20 actionType])
            {
              id v23 = v20;
              if (!v17)
              {
                v17 = objc_opt_new();
                [v49 addObject:v17];
              }
              [v17 analyzeWordEntry:v23];
              [v13 setObject:v17 forKey:v23];
              uint64_t v24 = [v23 keyboardState];

              v51 = (void *)v24;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v60 objects:v66 count:16];
        }
        while (v16);
      }
      else
      {
        v51 = 0;
        v17 = 0;
      }
      v50 = v7;

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v8 = v48;
      v25 = [v48 alignedEntries];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v57 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v56 + 1) + 8 * j);
            v31 = objc_msgSend(v30, "originalWord", v48);
            v32 = [v13 objectForKey:v31];

            [v32 analyzeWordEntryAligned:v30];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v56 objects:v65 count:16];
        }
        while (v27);
      }

      a5 = (unint64_t)v49;
      if ([v49 count])
      {
        v33 = [TIKBAnalyticsMetricsContext alloc];
        v34 = [v50 sessionParams];
        v35 = [v34 activeInputModes];
        v36 = [v50 sessionParams];
        v37 = [v36 testingParameters];
        v38 = [(TIKBAnalyticsMetricsContext *)v33 initWithKeyboardState:v51 activeInputModes:v35 testingParameters:v37];

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v39 = v49;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v52 objects:v64 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v53;
          do
          {
            for (uint64_t k = 0; k != v41; ++k)
            {
              if (*(void *)v53 != v42) {
                objc_enumerationMutation(v39);
              }
              v44 = *(void **)(*((void *)&v52 + 1) + 8 * k);
              v45 = objc_msgSend(v50, "featureUsageMetricsCache", v48);
              v46 = [v50 sessionParams];
              objc_msgSend(v44, "dispatchWithFeatureUsageMetricsCache:andContext:assetAvailabilityStatus:", v45, v38, objc_msgSend(v46, "assetAvailabilityStatus"));
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v52 objects:v64 count:16];
          }
          while (v41);
        }

        id v8 = v48;
        a5 = (unint64_t)v49;
      }

      LOBYTE(a5) = 1;
      id v7 = v50;
    }
    else
    {
      LOBYTE(a5) = 0;
    }
  }

  return a5;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:a3 alignedSession:a4];
}

- (TITypingSpeedDetailsAnalyzer)init
{
  v5.receiver = self;
  v5.super_class = (Class)TITypingSpeedDetailsAnalyzer;
  v2 = [(TITypingSpeedDetailsAnalyzer *)&v5 init];
  uint64_t v3 = v2;
  if (v2) {
    [(TITypingSpeedDetailsAnalyzer *)v2 registerEventSpec];
  }
  return v3;
}

@end