@interface TIAutocorrectionFeedbackAnalyzer
+ (id)analyzerForUserModel:(id)a3 revisionRateAnalysisSummary:(id)a4;
- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5;
- (NSArray)supportedLanguages;
- (TIAutocorrectionFeedbackAnalyzer)initWithUserModel:(id)a3 revisionRateAnalysisSummary:(id)a4;
- (TIUserModeling)userModel;
- (id)installedInputModesStringFromInputModes:(id)a3;
- (int64_t)studyStatusFromState:(int64_t)a3;
- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4;
- (void)accumulateWordCounts;
- (void)registerEventSpec;
- (void)resetWordCounts;
- (void)sendCAEventForStudyStatus:(int64_t)a3;
- (void)sendCompletionEventUsingStudyDataFromFeedbackController:(id)a3;
- (void)sendInitiationEventUsingStudyDataFromFeedbackController:(id)a3;
- (void)sendRequestSurveyEventUsingStudyDataFromFeedbackController:(id)a3;
- (void)sendTerminationEventUsingStudyDataFromFeedbackController:(id)a3;
- (void)setSupportedLanguages:(id)a3;
- (void)setUserModel:(id)a3;
@end

@implementation TIAutocorrectionFeedbackAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_userModel, 0);
  objc_storeStrong((id *)&self->_revisionRateAnalysisSummary, 0);
  objc_storeStrong((id *)&self->_alignedSession, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (void)setSupportedLanguages:(id)a3
{
}

- (NSArray)supportedLanguages
{
  return self->_supportedLanguages;
}

- (void)setUserModel:(id)a3
{
}

- (TIUserModeling)userModel
{
  return self->_userModel;
}

- (int64_t)studyStatusFromState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4) {
    return 2;
  }
  else {
    return qword_1E4155F40[a3 - 2];
  }
}

- (id)installedInputModesStringFromInputModes:(id)a3
{
  v3 = [a3 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
  v4 = [v3 componentsJoinedByString:@"|"];

  return v4;
}

- (void)registerEventSpec
{
  v18[12] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4FAE248];
  v17 = [MEMORY[0x1E4FAE250] enumFieldSpecWithName:@"studyStatus"];
  v18[0] = v17;
  v16 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"correctedWordCount" minValue:&unk_1F3FA7C40 maxValue:0 significantDigits:0];
  v18[1] = v16;
  v15 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"tappedWordCount" minValue:&unk_1F3FA7C40 maxValue:0 significantDigits:0];
  v18[2] = v15;
  v14 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"initialPreferenceValue"];
  v18[3] = v14;
  v3 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"initialInputModes"];
  v18[4] = v3;
  v4 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"finalPreferenceValue"];
  v18[5] = v4;
  v5 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"finalInputModes"];
  v18[6] = v5;
  v6 = [MEMORY[0x1E4FAE250] enumFieldSpecWithName:@"surveyOutcome"];
  v18[7] = v6;
  v7 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"revisedWordCount"];
  v18[8] = v7;
  v8 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"revisedWordAutocorrectionCount"];
  v18[9] = v8;
  v9 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"daysCount"];
  v18[10] = v9;
  v10 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"assetAvailabilityStatus"];
  v18[11] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:12];
  v12 = [v2 eventSpecWithName:@"deferredAutocorrectionFeedback" inputModeRequired:0 fieldSpecs:v11];

  v13 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v13 registerEventSpec:v12];
}

- (void)sendTerminationEventUsingStudyDataFromFeedbackController:(id)a3
{
  int64_t v4 = -[TIAutocorrectionFeedbackAnalyzer studyStatusFromState:](self, "studyStatusFromState:", objc_msgSend(MEMORY[0x1E4FAE2B0], "getFeedbackState", a3));

  [(TIAutocorrectionFeedbackAnalyzer *)self sendCAEventForStudyStatus:v4];
}

- (void)sendCompletionEventUsingStudyDataFromFeedbackController:(id)a3
{
  int64_t v4 = [(TIAutocorrectionFeedbackAnalyzer *)self studyStatusFromState:4];

  [(TIAutocorrectionFeedbackAnalyzer *)self sendCAEventForStudyStatus:v4];
}

- (void)sendRequestSurveyEventUsingStudyDataFromFeedbackController:(id)a3
{
}

- (void)sendCAEventForStudyStatus:(int64_t)a3
{
  v50[12] = *MEMORY[0x1E4F143B8];
  int64_t v4 = [(TIAutocorrectionFeedbackAnalyzer *)self userModel];
  uint64_t v5 = [v4 valueForDurableKey:kFeedbackCounterAutocorrectionEnablementTappedWords];

  v6 = [(TIAutocorrectionFeedbackAnalyzer *)self userModel];
  uint64_t v7 = [v6 valueForDurableKey:kFeedbackCounterAutocorrectionEnablementCorrectedWords];

  v8 = [(TIAutocorrectionFeedbackAnalyzer *)self userModel];
  uint64_t v9 = [v8 valueForDurableKey:kFeedbackCounterAutocorrectionEnablementRevisedWords];

  v10 = [(TIAutocorrectionFeedbackAnalyzer *)self userModel];
  uint64_t v11 = [v10 valueForDurableKey:kFeedbackCounterAutocorrectionEnablementRevisedCorrectedWords];

  v12 = [(TITypingSession *)self->_session sessionParams];
  BOOL v13 = [v12 assetAvailabilityStatus] != 0;

  unsigned int v43 = [MEMORY[0x1E4FAE2B0] getInitialPreferenceValue];
  v14 = [MEMORY[0x1E4FAE2B0] getInitialInputModes];
  uint64_t v15 = [(TIAutocorrectionFeedbackAnalyzer *)self installedInputModesStringFromInputModes:v14];

  unsigned int v39 = [MEMORY[0x1E4FAE2B0] getFinalPreferenceValue];
  v16 = [MEMORY[0x1E4FAE2B0] getFinalInputModes];
  uint64_t v17 = [(TIAutocorrectionFeedbackAnalyzer *)self installedInputModesStringFromInputModes:v16];

  uint64_t v38 = [MEMORY[0x1E4FAE2B0] getSurveyOutcome];
  uint64_t v18 = [MEMORY[0x1E4FAE2B0] getInitialTimestamp];
  v41 = [MEMORY[0x1E4FAE2B0] getFinalTimestamp];
  v42 = (void *)v18;
  [v41 timeIntervalSinceDate:v18];
  int v37 = (int)v19 / 86400;
  v49[0] = @"studyStatus";
  v40 = [NSNumber numberWithInteger:a3];
  v50[0] = v40;
  v49[1] = @"tappedWordCount";
  v20 = [NSNumber numberWithInt:v5];
  v50[1] = v20;
  v49[2] = @"correctedWordCount";
  v21 = [NSNumber numberWithInt:v7];
  v50[2] = v21;
  v49[3] = @"revisedWordCount";
  v22 = [NSNumber numberWithInt:v9];
  v50[3] = v22;
  v49[4] = @"revisedWordAutocorrectionCount";
  v23 = [NSNumber numberWithInt:v11];
  v50[4] = v23;
  v49[5] = kFeatureStringAssetAvailabilityStatus;
  v24 = [NSNumber numberWithBool:v13];
  v50[5] = v24;
  v49[6] = @"initialPreferenceValue";
  uint64_t v25 = [NSNumber numberWithBool:v43];
  v26 = (void *)v25;
  v46 = (void *)v15;
  if (v15) {
    v27 = (__CFString *)v15;
  }
  else {
    v27 = &stru_1F3F7A998;
  }
  v50[6] = v25;
  v50[7] = v27;
  v49[7] = @"initialInputModes";
  v49[8] = @"finalPreferenceValue";
  uint64_t v28 = [NSNumber numberWithBool:v39];
  v29 = (void *)v28;
  v44 = (void *)v17;
  if (v17) {
    v30 = (__CFString *)v17;
  }
  else {
    v30 = &stru_1F3F7A998;
  }
  v50[8] = v28;
  v50[9] = v30;
  v49[9] = @"finalInputModes";
  v49[10] = @"surveyOutcome";
  v31 = [NSNumber numberWithInteger:v38];
  v50[10] = v31;
  v49[11] = @"daysCount";
  v32 = [NSNumber numberWithInteger:v37];
  v50[11] = v32;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:12];

  v34 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v34 dispatchEventWithName:@"deferredAutocorrectionFeedback" payload:v33 testingParameters:0 allowSparsePayload:1];

  if (IXACanLogMessageAtLevel())
  {
    v35 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v36 = [NSString stringWithFormat:@"%s Feedback %@: sentCAEvent payload: %@", "-[TIAutocorrectionFeedbackAnalyzer sendCAEventForStudyStatus:]", @"KeyboardAutocorrection", v33];
      *(_DWORD *)buf = 138412290;
      v48 = v36;
      _os_log_debug_impl(&dword_1E3F0E000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (void)sendInitiationEventUsingStudyDataFromFeedbackController:(id)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"studyStatus";
  int64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[TIAutocorrectionFeedbackAnalyzer studyStatusFromState:](self, "studyStatusFromState:", 2));
  v18[0] = v4;
  v17[1] = @"initialInputModes";
  uint64_t v5 = [MEMORY[0x1E4FAE2B0] getInitialInputModes];
  v6 = [(TIAutocorrectionFeedbackAnalyzer *)self installedInputModesStringFromInputModes:v5];
  v18[1] = v6;
  v17[2] = @"initialPreferenceValue";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4FAE2B0], "getInitialPreferenceValue"));
  v18[2] = v7;
  v17[3] = kFeatureStringAssetAvailabilityStatus;
  v8 = NSNumber;
  uint64_t v9 = [(TITypingSession *)self->_session sessionParams];
  v10 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "assetAvailabilityStatus") != 0);
  v18[3] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  v12 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v12 dispatchEventWithName:@"deferredAutocorrectionFeedback" payload:v11 testingParameters:0 allowSparsePayload:1];

  if (IXACanLogMessageAtLevel())
  {
    BOOL v13 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = [NSString stringWithFormat:@"%s Feedback %@: sendInitiationEvent payload: %@", "-[TIAutocorrectionFeedbackAnalyzer sendInitiationEventUsingStudyDataFromFeedbackController:]", @"KeyboardAutocorrection", v11];
      *(_DWORD *)buf = 138412290;
      v16 = v14;
      _os_log_debug_impl(&dword_1E3F0E000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (void)resetWordCounts
{
  v3 = [(TIAutocorrectionFeedbackAnalyzer *)self userModel];
  [v3 resetDurableCounterForKey:kFeedbackCounterAutocorrectionEnablementTappedWords];

  int64_t v4 = [(TIAutocorrectionFeedbackAnalyzer *)self userModel];
  [v4 resetDurableCounterForKey:kFeedbackCounterAutocorrectionEnablementCorrectedWords];

  uint64_t v5 = [(TIAutocorrectionFeedbackAnalyzer *)self userModel];
  [v5 resetDurableCounterForKey:kFeedbackCounterAutocorrectionEnablementRevisedWords];

  id v6 = [(TIAutocorrectionFeedbackAnalyzer *)self userModel];
  [v6 resetDurableCounterForKey:kFeedbackCounterAutocorrectionEnablementRevisedCorrectedWords];
}

- (void)accumulateWordCounts
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(TIRevisionRateAnalysisSummary *)self->_revisionRateAnalysisSummary hasEmojiInput]
    || [(TIRevisionRateAnalysisSummary *)self->_revisionRateAnalysisSummary hasCursorMovement])
  {
    if (!IXACanLogMessageAtLevel()) {
      return;
    }
    v3 = IXAFeedbackLogFacility();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_5;
    }
    uint64_t v15 = [NSString stringWithFormat:@"%s Feedback %@: accumulateWordCounts will not count - session has cursor movement", "-[TIAutocorrectionFeedbackAnalyzer accumulateWordCounts]", @"KeyboardAutocorrection"];
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v15;
    goto LABEL_15;
  }
  int64_t v4 = [(TIAutocorrectionFeedbackAnalyzer *)self supportedLanguages];
  uint64_t v5 = [(TIRevisionRateAnalysisSummary *)self->_revisionRateAnalysisSummary languageRegion];
  char v6 = [v4 containsObject:v5];

  if (v6)
  {
    uint64_t v7 = [(TIAutocorrectionFeedbackAnalyzer *)self userModel];
    int64_t v8 = [(TIRevisionRateAnalysisSummary *)self->_revisionRateAnalysisSummary tappedCount];
    [v7 addToDurableCounter:v8 forKey:kFeedbackCounterAutocorrectionEnablementTappedWords];

    uint64_t v9 = [(TIAutocorrectionFeedbackAnalyzer *)self userModel];
    int64_t v10 = [(TIRevisionRateAnalysisSummary *)self->_revisionRateAnalysisSummary autocorrectedCount];
    [v9 addToDurableCounter:v10 forKey:kFeedbackCounterAutocorrectionEnablementCorrectedWords];

    uint64_t v11 = [(TIAutocorrectionFeedbackAnalyzer *)self userModel];
    int64_t v12 = [(TIRevisionRateAnalysisSummary *)self->_revisionRateAnalysisSummary revisedCount];
    [v11 addToDurableCounter:v12 forKey:kFeedbackCounterAutocorrectionEnablementRevisedWords];

    BOOL v13 = [(TIAutocorrectionFeedbackAnalyzer *)self userModel];
    int64_t v14 = [(TIRevisionRateAnalysisSummary *)self->_revisionRateAnalysisSummary revisedAutocorrectionCount];
    [v13 addToDurableCounter:v14 forKey:kFeedbackCounterAutocorrectionEnablementRevisedCorrectedWords];

    if (IXACanLogMessageAtLevel())
    {
      v3 = IXAFeedbackLogFacility();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = [NSString stringWithFormat:@"%s Feedback %@: accumulateWordCounts tapped: %ld, corrected: %ld, revised: %ld, revised-autocorection: %ld,", "-[TIAutocorrectionFeedbackAnalyzer accumulateWordCounts]", @"KeyboardAutocorrection", -[TIRevisionRateAnalysisSummary tappedCount](self->_revisionRateAnalysisSummary, "tappedCount"), -[TIRevisionRateAnalysisSummary autocorrectedCount](self->_revisionRateAnalysisSummary, "autocorrectedCount"), -[TIRevisionRateAnalysisSummary revisedCount](self->_revisionRateAnalysisSummary, "revisedCount"), -[TIRevisionRateAnalysisSummary revisedAutocorrectionCount](self->_revisionRateAnalysisSummary, "revisedAutocorrectionCount")];
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v15;
LABEL_15:
        _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        goto LABEL_5;
      }
      goto LABEL_5;
    }
  }
  else if (IXACanLogMessageAtLevel())
  {
    v3 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = [NSString stringWithFormat:@"%s Feedback %@: accumulateWordCounts will not count - unsupported language", "-[TIAutocorrectionFeedbackAnalyzer accumulateWordCounts]", @"KeyboardAutocorrection"];
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v15;
      goto LABEL_15;
    }
LABEL_5:
  }
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  uint64_t v7 = (TITypingSession *)a3;
  int64_t v8 = (TITypingSessionAligned *)a4;
  session = self->_session;
  self->_session = v7;
  int64_t v10 = v7;

  alignedSession = self->_alignedSession;
  self->_alignedSession = v8;
  int64_t v12 = v8;

  BOOL v13 = objc_alloc_init(TIFeedbackController);
  [(TIFeedbackController *)v13 handleFeedbackActionsWithDelegate:self];

  return 1;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:a3 alignedSession:a4];
}

- (TIAutocorrectionFeedbackAnalyzer)initWithUserModel:(id)a3 revisionRateAnalysisSummary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TIAutocorrectionFeedbackAnalyzer;
  uint64_t v9 = [(TIAutocorrectionFeedbackAnalyzer *)&v14 init];
  int64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userModel, a3);
    uint64_t v11 = [MEMORY[0x1E4FAE2B0] getSupportedFeedbackLanguages];
    supportedLanguages = v10->_supportedLanguages;
    v10->_supportedLanguages = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_revisionRateAnalysisSummary, a4);
    [(TIAutocorrectionFeedbackAnalyzer *)v10 registerEventSpec];
  }

  return v10;
}

+ (id)analyzerForUserModel:(id)a3 revisionRateAnalysisSummary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithUserModel:v6 revisionRateAnalysisSummary:v5];

  return v7;
}

@end