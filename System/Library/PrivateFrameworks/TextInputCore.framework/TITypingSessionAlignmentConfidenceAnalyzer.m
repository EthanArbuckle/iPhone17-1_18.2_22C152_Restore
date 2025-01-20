@interface TITypingSessionAlignmentConfidenceAnalyzer
- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5;
- (TITypingSessionAlignmentConfidenceAnalyzer)init;
- (id)_generateCountsOfWordsForAlignmentConfidences;
- (id)_generateFeatureUsageMetricsForContext:(id)a3;
- (id)_generateMetadataForTypingSessionFromContext:(id)a3;
- (id)_generatePercentageOfTotalWordsForAlignmentConfidencesFromRawCounts:(id)a3;
- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4;
- (void)dispatchEventWithPayload:(id)a3;
- (void)registerEventSpec;
@end

@implementation TITypingSessionAlignmentConfidenceAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_alignedSession, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (void)dispatchEventWithPayload:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FAE260];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 dispatchEventWithName:@"alignmentConfidence" payload:v4 testingParameters:0 allowSparsePayload:1];
}

- (void)registerEventSpec
{
  v48[24] = *MEMORY[0x1E4F143B8];
  v39 = (void *)MEMORY[0x1E4FAE248];
  v47 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"countWordsAlignmentConfidenceHigh" minValue:&unk_1F3FA7B08 maxValue:0 significantDigits:0];
  v48[0] = v47;
  v46 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"countWordsAlignmentConfidenceMid" minValue:&unk_1F3FA7B08 maxValue:0 significantDigits:0];
  v48[1] = v46;
  v45 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"countWordsAlignmentConfidenceLow" minValue:&unk_1F3FA7B08 maxValue:0 significantDigits:0];
  v48[2] = v45;
  v44 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"countWordsAlignmentConfidenceNone" minValue:&unk_1F3FA7B08 maxValue:0 significantDigits:0];
  v48[3] = v44;
  v43 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"totalAlignedWords" minValue:&unk_1F3FA7B08 maxValue:0 significantDigits:0];
  v48[4] = v43;
  v42 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"fractionWordsAlignmentConfidenceHigh" minValue:&unk_1F3FA7B08 maxValue:0 significantDigits:0];
  v48[5] = v42;
  v41 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"fractionWordsAlignmentConfidenceMid" minValue:&unk_1F3FA7B08 maxValue:0 significantDigits:0];
  v48[6] = v41;
  v40 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"fractionWordsAlignmentConfidenceLow" minValue:&unk_1F3FA7B08 maxValue:0 significantDigits:0];
  v48[7] = v40;
  v38 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"fractionWordsAlignmentConfidenceNone" minValue:&unk_1F3FA7B08 maxValue:0 significantDigits:0];
  v48[8] = v38;
  v37 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"sessionAlignmentSuccess"];
  v48[9] = v37;
  v36 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:kFeatureStringSessionAlignmentConfidence minValue:&unk_1F3FA7B08 maxValue:0 significantDigits:0];
  v48[10] = v36;
  v2 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v3 = kFeatureKeyboardUsage;
  v35 = TIFeatureUsageAllowedValues();
  v34 = [v2 stringFieldSpecWithName:v3 allowedValues:v35];
  v48[11] = v34;
  id v4 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v5 = kFeatureContinuousPathUsage;
  v33 = TIFeatureUsageAllowedValues();
  v32 = [v4 stringFieldSpecWithName:v5 allowedValues:v33];
  v48[12] = v32;
  v6 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v7 = kFeatureAutocorrectionUsage;
  v31 = TIFeatureUsageAllowedValues();
  v30 = [v6 stringFieldSpecWithName:v7 allowedValues:v31];
  v48[13] = v30;
  v8 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v9 = kFeatureCandidateBarUsage;
  v29 = TIFeatureUsageAllowedValues();
  v28 = [v8 stringFieldSpecWithName:v9 allowedValues:v29];
  v48[14] = v28;
  v10 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v11 = kFeatureMultilingualUsage;
  v27 = TIFeatureUsageAllowedValues();
  v26 = [v10 stringFieldSpecWithName:v11 allowedValues:v27];
  v48[15] = v26;
  v12 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v13 = kFeatureStringTypingSpeed;
  v25 = TITypingSpeedAllowedValues();
  v14 = [v12 stringFieldSpecWithName:v13 allowedValues:v25];
  v48[16] = v14;
  v15 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLanguage];
  v48[17] = v15;
  v16 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardRegion];
  v48[18] = v16;
  v17 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardVariant];
  v48[19] = v17;
  v18 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryLanguage];
  v48[20] = v18;
  v19 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryRegion];
  v48[21] = v19;
  v20 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLayout];
  v48[22] = v20;
  v21 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardType];
  v48[23] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:24];
  v23 = [v39 eventSpecWithName:@"alignmentConfidence" inputModeRequired:0 fieldSpecs:v22];

  v24 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v24 registerEventSpec:v23];
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (a5)
  {
    id v31 = v10;
    objc_storeStrong((id *)&self->_session, a3);
    objc_storeStrong((id *)&self->_alignedSession, a4);
    uint64_t v11 = [(TITypingSessionAlignmentConfidenceAnalyzer *)self _generateCountsOfWordsForAlignmentConfidences];
    [(NSMutableDictionary *)self->_payload addEntriesFromDictionary:v11];
    payload = self->_payload;
    uint64_t v13 = [(TITypingSessionAlignmentConfidenceAnalyzer *)self _generatePercentageOfTotalWordsForAlignmentConfidencesFromRawCounts:v11];
    [(NSMutableDictionary *)payload addEntriesFromDictionary:v13];

    +[TIStandardTypingSessionConfidenceEvaluator calculateAlignedTypingSessionConfidence:self->_alignedSession];
    v14 = objc_msgSend(MEMORY[0x1E4FAE268], "bucketPercentageWithValue:");
    [(NSMutableDictionary *)self->_payload setObject:v14 forKeyedSubscript:kFeatureStringSessionAlignmentConfidence];

    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[TITypingSessionAligned success](self->_alignedSession, "success"));
    [(NSMutableDictionary *)self->_payload setObject:v15 forKeyedSubscript:@"sessionAlignmentSuccess"];

    v16 = [(TITypingSession *)self->_session userActionHistory];
    v17 = [v16 lastObject];
    v18 = [v17 keyboardState];

    v19 = [TIKBAnalyticsMetricsContext alloc];
    v20 = [(TITypingSession *)self->_session sessionParams];
    v21 = [v20 activeInputModes];
    v22 = [(TITypingSession *)self->_session sessionParams];
    v23 = [v22 testingParameters];
    v24 = [(TIKBAnalyticsMetricsContext *)v19 initWithKeyboardState:v18 activeInputModes:v21 testingParameters:v23];

    v25 = self->_payload;
    v26 = [(TITypingSessionAlignmentConfidenceAnalyzer *)self _generateMetadataForTypingSessionFromContext:v24];
    [(NSMutableDictionary *)v25 addEntriesFromDictionary:v26];

    v27 = self->_payload;
    v28 = [(TITypingSessionAlignmentConfidenceAnalyzer *)self _generateFeatureUsageMetricsForContext:v24];
    [(NSMutableDictionary *)v27 addEntriesFromDictionary:v28];

    v29 = (void *)[(NSMutableDictionary *)self->_payload copy];
    [(TITypingSessionAlignmentConfidenceAnalyzer *)self dispatchEventWithPayload:v29];

    id v10 = v31;
  }

  return a5 != 0;
}

- (id)_generateFeatureUsageMetricsForContext:(id)a3
{
  v15[6] = *MEMORY[0x1E4F143B8];
  session = self->_session;
  id v4 = a3;
  uint64_t v5 = [(TITypingSession *)session featureUsageMetricsCache];
  v14[0] = kFeatureKeyboardUsage;
  v6 = objc_msgSend(v5, "featureUsageMetricFromName:forContext:");
  v15[0] = v6;
  v14[1] = kFeatureContinuousPathUsage;
  uint64_t v7 = objc_msgSend(v5, "featureUsageMetricFromName:forContext:");
  v15[1] = v7;
  v14[2] = kFeatureCandidateBarUsage;
  v8 = objc_msgSend(v5, "featureUsageMetricFromName:forContext:");
  v15[2] = v8;
  v14[3] = kFeatureAutocorrectionUsage;
  id v9 = objc_msgSend(v5, "featureUsageMetricFromName:forContext:");
  v15[3] = v9;
  v14[4] = kFeatureMultilingualUsage;
  id v10 = objc_msgSend(v5, "featureUsageMetricFromName:forContext:");
  v15[4] = v10;
  v14[5] = kFeatureStringTypingSpeed;
  uint64_t v11 = objc_msgSend(v5, "featureUsageMetricFromName:forContext:");

  v15[5] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:6];

  return v12;
}

- (id)_generateMetadataForTypingSessionFromContext:(id)a3
{
  void v15[7] = *MEMORY[0x1E4F143B8];
  v14[0] = kFeatureStringKeyboardLanguage;
  id v3 = a3;
  id v4 = [v3 inputLanguage];
  v15[0] = v4;
  v14[1] = kFeatureStringKeyboardRegion;
  uint64_t v5 = [v3 inputRegion];
  v15[1] = v5;
  v14[2] = kFeatureStringKeyboardVariant;
  v6 = [v3 inputVariant];
  v15[2] = v6;
  v14[3] = kFeatureStringKeyboardSecondaryLanguage;
  uint64_t v7 = [v3 secondaryLanguage];
  v15[3] = v7;
  v14[4] = kFeatureStringKeyboardSecondaryRegion;
  v8 = [v3 secondaryRegion];
  v15[4] = v8;
  v14[5] = kFeatureStringKeyboardLayout;
  id v9 = [v3 layoutName];
  v15[5] = v9;
  void v14[6] = kFeatureStringKeyboardType;
  uint64_t v10 = [v3 keyboardType];

  uint64_t v11 = +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:v10];
  v15[6] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:7];

  return v12;
}

- (id)_generatePercentageOfTotalWordsForAlignmentConfidencesFromRawCounts:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 objectForKeyedSubscript:@"totalAlignedWords"];
  int v6 = [v5 intValue];

  if (v6 < 1)
  {
    [v4 setObject:&unk_1F3FA7B08 forKeyedSubscript:@"fractionWordsAlignmentConfidenceHigh"];
    [v4 setObject:&unk_1F3FA7B08 forKeyedSubscript:@"fractionWordsAlignmentConfidenceMid"];
    [v4 setObject:&unk_1F3FA7B08 forKeyedSubscript:@"fractionWordsAlignmentConfidenceLow"];
    [v4 setObject:&unk_1F3FA7B08 forKeyedSubscript:@"fractionWordsAlignmentConfidenceNone"];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4FAE268];
    v8 = [v3 objectForKeyedSubscript:@"countWordsAlignmentConfidenceHigh"];
    id v9 = [v3 objectForKeyedSubscript:@"totalAlignedWords"];
    uint64_t v10 = [v7 bucketPercentageWithNumerator:v8 andDenominator:v9];
    [v4 setObject:v10 forKeyedSubscript:@"fractionWordsAlignmentConfidenceHigh"];

    uint64_t v11 = (void *)MEMORY[0x1E4FAE268];
    v12 = [v3 objectForKeyedSubscript:@"countWordsAlignmentConfidenceMid"];
    uint64_t v13 = [v3 objectForKeyedSubscript:@"totalAlignedWords"];
    v14 = [v11 bucketPercentageWithNumerator:v12 andDenominator:v13];
    [v4 setObject:v14 forKeyedSubscript:@"fractionWordsAlignmentConfidenceMid"];

    v15 = (void *)MEMORY[0x1E4FAE268];
    v16 = [v3 objectForKeyedSubscript:@"countWordsAlignmentConfidenceLow"];
    v17 = [v3 objectForKeyedSubscript:@"totalAlignedWords"];
    v18 = [v15 bucketPercentageWithNumerator:v16 andDenominator:v17];
    [v4 setObject:v18 forKeyedSubscript:@"fractionWordsAlignmentConfidenceLow"];

    v19 = (void *)MEMORY[0x1E4FAE268];
    v20 = [v3 objectForKeyedSubscript:@"countWordsAlignmentConfidenceNone"];
    v21 = [v3 objectForKeyedSubscript:@"totalAlignedWords"];
    v22 = [v19 bucketPercentageWithNumerator:v20 andDenominator:v21];
    [v4 setObject:v22 forKeyedSubscript:@"fractionWordsAlignmentConfidenceNone"];
  }

  return v4;
}

- (id)_generateCountsOfWordsForAlignmentConfidences
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"countWordsAlignmentConfidenceHigh", &unk_1F3FA7B08, @"countWordsAlignmentConfidenceMid", &unk_1F3FA7B08, @"countWordsAlignmentConfidenceLow", &unk_1F3FA7B08, @"countWordsAlignmentConfidenceNone", &unk_1F3FA7B08, @"totalAlignedWords", 0);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [(TITypingSessionAligned *)self->_alignedSession alignedEntries];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [*(id *)(*((void *)&v23 + 1) + 8 * i) inSessionAlignmentConfidence];
        switch(v9)
        {
          case 1:
            uint64_t v10 = NSNumber;
            uint64_t v11 = v3;
            v12 = @"countWordsAlignmentConfidenceLow";
            goto LABEL_12;
          case 2:
            uint64_t v10 = NSNumber;
            uint64_t v11 = v3;
            v12 = @"countWordsAlignmentConfidenceMid";
            goto LABEL_12;
          case 3:
            uint64_t v10 = NSNumber;
            uint64_t v11 = v3;
            v12 = @"countWordsAlignmentConfidenceHigh";
LABEL_12:
            uint64_t v13 = [v11 objectForKeyedSubscript:v12];
            v14 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v13, "intValue") + 1);
            v15 = v3;
            v16 = v14;
            v17 = v12;
            goto LABEL_14;
        }
        v18 = NSNumber;
        uint64_t v13 = [v3 objectForKeyedSubscript:@"countWordsAlignmentConfidenceNone"];
        v14 = objc_msgSend(v18, "numberWithInt:", objc_msgSend(v13, "intValue") + 1);
        v15 = v3;
        v16 = v14;
        v17 = @"countWordsAlignmentConfidenceNone";
LABEL_14:
        [v15 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  v19 = NSNumber;
  v20 = [(TITypingSessionAligned *)self->_alignedSession alignedEntries];
  v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
  [v3 setObject:v21 forKeyedSubscript:@"totalAlignedWords"];

  return v3;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:a3 alignedSession:a4];
}

- (TITypingSessionAlignmentConfidenceAnalyzer)init
{
  v6.receiver = self;
  v6.super_class = (Class)TITypingSessionAlignmentConfidenceAnalyzer;
  v2 = [(TITypingSessionAlignmentConfidenceAnalyzer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    payload = v2->_payload;
    v2->_payload = (NSMutableDictionary *)v3;

    [(TITypingSessionAlignmentConfidenceAnalyzer *)v2 registerEventSpec];
  }
  return v2;
}

@end