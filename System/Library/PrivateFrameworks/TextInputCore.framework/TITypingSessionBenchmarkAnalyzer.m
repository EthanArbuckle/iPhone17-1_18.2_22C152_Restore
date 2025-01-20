@interface TITypingSessionBenchmarkAnalyzer
- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5;
- (TITypingSessionBenchmarkAnalyzer)init;
- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4;
- (void)dispatchEvent;
- (void)registerEventSpec;
@end

@implementation TITypingSessionBenchmarkAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignedSession, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (void)dispatchEvent
{
  v31[15] = *MEMORY[0x1E4F143B8];
  v3 = [(TITypingSession *)self->_session userActionHistory];
  v4 = [v3 lastObject];
  v29 = [v4 keyboardState];

  v5 = [TIKBAnalyticsMetricsContext alloc];
  v6 = [(TITypingSession *)self->_session sessionParams];
  v7 = [v6 activeInputModes];
  v8 = [(TITypingSession *)self->_session sessionParams];
  v9 = [v8 testingParameters];
  v10 = [(TIKBAnalyticsMetricsContext *)v5 initWithKeyboardState:v29 activeInputModes:v7 testingParameters:v9];

  v30[0] = @"typingSessionConfidence";
  v28 = [NSNumber numberWithUnsignedInteger:self->_typingSessionConfidence];
  v31[0] = v28;
  v30[1] = kFeatureStringSessionAlignmentConfidence;
  v27 = [MEMORY[0x1E4FAE268] bucketRatioWithValue:10 bucketCount:self->_sessionAlignmentConfidence];
  v31[1] = v27;
  v30[2] = @"candidatesAccepted";
  v26 = objc_msgSend(NSNumber, "numberWithInt:", -[TITypingSession candidatesAccepted](self->_session, "candidatesAccepted"));
  v31[2] = v26;
  v30[3] = @"candidatesAcceptedWithText";
  v25 = objc_msgSend(NSNumber, "numberWithInt:", -[TITypingSession candidatesAcceptedWithText](self->_session, "candidatesAcceptedWithText"));
  v31[3] = v25;
  v30[4] = @"sessionWords";
  v24 = [NSNumber numberWithInt:self->_sessionWords];
  v31[4] = v24;
  v30[5] = @"sessionWordsWithText";
  v23 = [NSNumber numberWithInt:self->_sessionWordsWithText];
  v31[5] = v23;
  v30[6] = @"alignedWords";
  v22 = [NSNumber numberWithInt:self->_alignedWords];
  v31[6] = v22;
  v30[7] = @"alignedWordsWithText";
  v11 = [NSNumber numberWithInt:self->_alignedWordsWithText];
  v31[7] = v11;
  v30[8] = kFeatureStringKeyboardLanguage;
  v12 = [(TIAnalyticsMetricsContext *)v10 inputLanguage];
  v31[8] = v12;
  v30[9] = kFeatureStringKeyboardRegion;
  v13 = [(TIAnalyticsMetricsContext *)v10 inputRegion];
  v31[9] = v13;
  v30[10] = kFeatureStringKeyboardVariant;
  v14 = [(TIKBAnalyticsMetricsContext *)v10 inputVariant];
  v31[10] = v14;
  v30[11] = kFeatureStringKeyboardSecondaryLanguage;
  v15 = [(TIKBAnalyticsMetricsContext *)v10 secondaryLanguage];
  v31[11] = v15;
  v30[12] = kFeatureStringKeyboardSecondaryRegion;
  v16 = [(TIKBAnalyticsMetricsContext *)v10 secondaryRegion];
  v31[12] = v16;
  v30[13] = kFeatureStringKeyboardLayout;
  v17 = [(TIKBAnalyticsMetricsContext *)v10 layoutName];
  v31[13] = v17;
  v30[14] = kFeatureStringKeyboardType;
  v18 = +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:[(TIKBAnalyticsMetricsContext *)v10 keyboardType]];
  v31[14] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:15];

  v20 = [MEMORY[0x1E4FAE260] sharedInstance];
  v21 = [(TIKBAnalyticsMetricsContext *)v10 testingParameters];
  [v20 dispatchEventWithName:@"typingSessionBenchmark" payload:v19 testingParameters:v21 allowSparsePayload:0];
}

- (void)registerEventSpec
{
  v21[15] = *MEMORY[0x1E4F143B8];
  v16 = (void *)MEMORY[0x1E4FAE248];
  v20 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"typingSessionConfidence" minValue:&unk_1F3FA7B98 maxValue:&unk_1F3FA7BB0 significantDigits:0];
  v21[0] = v20;
  v19 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:kFeatureStringSessionAlignmentConfidence minValue:&unk_1F3FA7B98 maxValue:&unk_1F3FA7BC8 significantDigits:0];
  v21[1] = v19;
  v18 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"candidatesAccepted" minValue:&unk_1F3FA7B98 maxValue:0 significantDigits:0];
  v21[2] = v18;
  v17 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"candidatesAcceptedWithText" minValue:&unk_1F3FA7B98 maxValue:0 significantDigits:0];
  v21[3] = v17;
  v15 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"sessionWords" minValue:&unk_1F3FA7B98 maxValue:0 significantDigits:0];
  v21[4] = v15;
  v14 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"sessionWordsWithText" minValue:&unk_1F3FA7B98 maxValue:0 significantDigits:0];
  v21[5] = v14;
  v13 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"alignedWords" minValue:&unk_1F3FA7B98 maxValue:0 significantDigits:0];
  v21[6] = v13;
  v2 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"alignedWordsWithText" minValue:&unk_1F3FA7B98 maxValue:0 significantDigits:0];
  v21[7] = v2;
  v3 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLanguage];
  v21[8] = v3;
  v4 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardRegion];
  v21[9] = v4;
  v5 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardVariant];
  v21[10] = v5;
  v6 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryLanguage];
  v21[11] = v6;
  v7 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryRegion];
  v21[12] = v7;
  v8 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLayout];
  v21[13] = v8;
  v9 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardType];
  v21[14] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:15];
  v11 = [v16 eventSpecWithName:@"typingSessionBenchmark" inputModeRequired:0 fieldSpecs:v10];

  v12 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v12 registerEventSpec:v11];
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (a5)
  {
    id v29 = v10;
    objc_storeStrong((id *)&self->_session, a3);
    objc_storeStrong((id *)&self->_alignedSession, a4);
    self->_typingSessionConfidence = a5;
    +[TIStandardTypingSessionConfidenceEvaluator calculateAlignedTypingSessionConfidence:self->_alignedSession];
    self->_sessionAlignmentConfidence = v11;
    self->_sessionWords = 0;
    self->_sessionWordsWithText = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v12 = [v9 userActionHistory];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (![v17 actionType])
          {
            ++self->_sessionWords;
            v18 = (void *)MEMORY[0x1E4FAE268];
            v19 = [v17 acceptedString];
            LODWORD(v18) = [v18 hasNonWhitespaceNonPunctuationText:v19];

            if (v18) {
              ++self->_sessionWordsWithText;
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v14);
    }

    self->_alignedWords = 0;
    self->_alignedWordsWithText = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v20 = [(TITypingSessionAligned *)self->_alignedSession alignedEntries];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          ++self->_alignedWords;
          v26 = (void *)MEMORY[0x1E4FAE268];
          v27 = [v25 expectedString];
          LODWORD(v26) = [v26 hasNonWhitespaceNonPunctuationText:v27];

          if (v26) {
            ++self->_alignedWordsWithText;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v22);
    }

    [(TITypingSessionBenchmarkAnalyzer *)self dispatchEvent];
    id v10 = v29;
  }

  return a5 != 0;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:a3 alignedSession:a4];
}

- (TITypingSessionBenchmarkAnalyzer)init
{
  v5.receiver = self;
  v5.super_class = (Class)TITypingSessionBenchmarkAnalyzer;
  v2 = [(TITypingSessionBenchmarkAnalyzer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TITypingSessionBenchmarkAnalyzer *)v2 registerEventSpec];
  }
  return v3;
}

@end