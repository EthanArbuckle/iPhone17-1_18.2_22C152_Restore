@interface TIRevisionRateAnalyzer
- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5;
- (BOOL)hasCursorMovement;
- (BOOL)hasEmojiInput;
- (NSNumber)sessionAlignmentConfidence;
- (TIRevisionRateAnalysisSummary)revisionRateAnalysisSummary;
- (TIRevisionRateAnalyzer)init;
- (id)_createEventSpec;
- (id)getLanguageRegionForSession:(id)a3;
- (id)getSessionFields;
- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4;
- (void)_dispatchEventPayloads:(id)a3 analyticsService:(id)a4 typingSession:(id)a5;
- (void)_registerAnalyticsEventSpecWithAnalyticsService;
- (void)setHasCursorMovement:(BOOL)a3;
- (void)setHasEmojiInput:(BOOL)a3;
- (void)setRevisionRateAnalysisSummary:(id)a3;
- (void)setSessionAlignmentConfidence:(id)a3;
- (void)summarizeWithEventDictionary:(id)a3 languageRegion:(id)a4;
@end

@implementation TIRevisionRateAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revisionRateAnalysisSummary, 0);

  objc_storeStrong((id *)&self->_sessionAlignmentConfidence, 0);
}

- (void)setRevisionRateAnalysisSummary:(id)a3
{
}

- (TIRevisionRateAnalysisSummary)revisionRateAnalysisSummary
{
  return self->_revisionRateAnalysisSummary;
}

- (void)setSessionAlignmentConfidence:(id)a3
{
}

- (NSNumber)sessionAlignmentConfidence
{
  return self->_sessionAlignmentConfidence;
}

- (void)setHasCursorMovement:(BOOL)a3
{
  self->_hasCursorMovement = a3;
}

- (BOOL)hasCursorMovement
{
  return self->_hasCursorMovement;
}

- (void)setHasEmojiInput:(BOOL)a3
{
  self->_hasEmojiInput = a3;
}

- (BOOL)hasEmojiInput
{
  return self->_hasEmojiInput;
}

- (id)getLanguageRegionForSession:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(a3, "userActionHistory", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    v7 = &stru_1F3F7A998;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (![v9 actionType])
        {
          v10 = [v9 keyboardState];
          v11 = [v10 inputMode];
          TIInputModeGetLanguageWithRegion();
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    v7 = &stru_1F3F7A998;
  }
LABEL_12:

  return v7;
}

- (void)summarizeWithEventDictionary:(id)a3 languageRegion:(id)a4
{
  v61[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(TIRevisionRateAnalyzer *)self hasEmojiInput];
  v9 = [(TIRevisionRateAnalyzer *)self revisionRateAnalysisSummary];
  [v9 setHasEmojiInput:v8];

  v10 = [(TIRevisionRateAnalyzer *)self sessionAlignmentConfidence];
  v11 = [(TIRevisionRateAnalyzer *)self revisionRateAnalysisSummary];
  [v11 setSessionAlignmentConfidence:v10];

  BOOL v12 = [(TIRevisionRateAnalyzer *)self hasCursorMovement];
  long long v13 = [(TIRevisionRateAnalyzer *)self revisionRateAnalysisSummary];
  [v13 setHasCursorMovement:v12];

  long long v14 = [(TIRevisionRateAnalyzer *)self revisionRateAnalysisSummary];
  v52 = v7;
  [v14 setLanguageRegion:v7];

  long long v15 = [(TIRevisionRateAnalyzer *)self revisionRateAnalysisSummary];
  [v15 setTappedCount:0];

  long long v16 = [(TIRevisionRateAnalyzer *)self revisionRateAnalysisSummary];
  [v16 setAutocorrectedCount:0];

  v17 = [(TIRevisionRateAnalyzer *)self revisionRateAnalysisSummary];
  [v17 setRevisedCount:0];

  uint64_t v18 = [(TIRevisionRateAnalyzer *)self revisionRateAnalysisSummary];
  [v18 setRevisedAutocorrectionCount:0];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  v61[0] = @"Tapped";
  v61[1] = @"Candidate Bar";
  v61[2] = @"TappedWithBackspace";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
  v21 = [v19 setWithArray:v20];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v22 = v6;
  v23 = self;
  id obj = v22;
  uint64_t v24 = [v22 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v57;
    v27 = @"enteredModality";
    v55 = v23;
    do
    {
      uint64_t v28 = 0;
      uint64_t v53 = v25;
      do
      {
        if (*(void *)v57 != v26) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v56 + 1) + 8 * v28);
        v30 = [v29 objectForKey:v27];
        if ([v21 containsObject:v30])
        {
          v31 = v27;
          uint64_t v32 = v26;
          v33 = v21;
          v34 = [(TIRevisionRateAnalyzer *)v23 revisionRateAnalysisSummary];
          uint64_t v35 = [v34 tappedCount] + 1;
          v36 = [(TIRevisionRateAnalyzer *)v23 revisionRateAnalysisSummary];
          [v36 setTappedCount:v35];

          v37 = [v29 objectForKey:@"revisedModality"];
          uint64_t v38 = [v37 length];

          v39 = [v29 objectForKey:@"correctedSource"];
          uint64_t v40 = [v39 length];

          if (v40)
          {
            v41 = [(TIRevisionRateAnalyzer *)v23 revisionRateAnalysisSummary];
            uint64_t v42 = [v41 autocorrectedCount] + 1;
            v43 = [(TIRevisionRateAnalyzer *)v23 revisionRateAnalysisSummary];
            [v43 setAutocorrectedCount:v42];

            v23 = v55;
          }
          v21 = v33;
          uint64_t v26 = v32;
          v27 = v31;
          uint64_t v25 = v53;
          if (v38)
          {
            v44 = [(TIRevisionRateAnalyzer *)v23 revisionRateAnalysisSummary];
            uint64_t v45 = [v44 revisedCount] + 1;
            v46 = [(TIRevisionRateAnalyzer *)v55 revisionRateAnalysisSummary];
            uint64_t v47 = v45;
            v23 = v55;
            [v46 setRevisedCount:v47];

            if (v40)
            {
              v48 = [(TIRevisionRateAnalyzer *)v55 revisionRateAnalysisSummary];
              uint64_t v49 = [v48 revisedAutocorrectionCount] + 1;
              v50 = [(TIRevisionRateAnalyzer *)v55 revisionRateAnalysisSummary];
              uint64_t v51 = v49;
              v23 = v55;
              [v50 setRevisedAutocorrectionCount:v51];
            }
          }
        }

        ++v28;
      }
      while (v25 != v28);
      uint64_t v25 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v25);
  }
}

- (id)getSessionFields
{
  v3 = objc_opt_new();
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[TIRevisionRateAnalyzer hasEmojiInput](self, "hasEmojiInput"));
  [v3 setObject:v4 forKeyedSubscript:@"hasEmojiInput"];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[TIRevisionRateAnalyzer hasCursorMovement](self, "hasCursorMovement"));
  [v3 setObject:v5 forKeyedSubscript:@"hasCursorMovement"];

  id v6 = [(TIRevisionRateAnalyzer *)self sessionAlignmentConfidence];
  [v3 setObject:v6 forKeyedSubscript:kFeatureStringSessionAlignmentConfidence];

  return v3;
}

- (id)_createEventSpec
{
  if (_createEventSpec_onceToken != -1) {
    dispatch_once(&_createEventSpec_onceToken, &__block_literal_global_7685);
  }
  v2 = (void *)_createEventSpec___eventSpec;

  return v2;
}

void __42__TIRevisionRateAnalyzer__createEventSpec__block_invoke()
{
  v63[8] = *MEMORY[0x1E4F143B8];
  v63[0] = @"OriginalText";
  v63[1] = @"Tapped";
  v63[2] = @"Pathed";
  v63[3] = @"Candidate Bar";
  v63[4] = @"TappedWithBackspace";
  v63[5] = @"Deleted";
  v63[6] = @"RevisionBubble";
  v63[7] = @"InlineCompletion";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:8];
  v62[0] = @"Lower";
  v62[1] = @"Title";
  v62[2] = @"Upper";
  v62[3] = @"Mixed";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];
  v61[0] = @"None";
  v61[1] = @"Short";
  v61[2] = @"Medium";
  v61[3] = @"Long";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:4];
  uint64_t v3 = TIFeatureUsageAllowedValues();
  v29 = TITypingSpeedAllowedValues();
  v52 = (void *)v0;
  long long v59 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"enteredModality" allowedValues:v0];
  v60[0] = v59;
  long long v58 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"enteredSource" allowedValues:0];
  v60[1] = v58;
  long long v57 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"enteredCapitalization" allowedValues:v1];
  v60[2] = v57;
  long long v56 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"enteredDiacritics"];
  v60[3] = v56;
  v55 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"enteredApostrophe"];
  v60[4] = v55;
  v54 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"enteredWordLength" minValue:&unk_1F3FA7B50 maxValue:&unk_1F3FA7B68 significantDigits:0];
  v60[5] = v54;
  uint64_t v53 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"correctedSource" allowedValues:0];
  v60[6] = v53;
  uint64_t v49 = (void *)v1;
  uint64_t v51 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"correctedCapitalization" allowedValues:v1];
  v60[7] = v51;
  v50 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"correctedDiacritics"];
  v60[8] = v50;
  v48 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"correctedApostrophe"];
  v60[9] = v48;
  v46 = (void *)v2;
  uint64_t v47 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"correctedEditDistance" allowedValues:v2];
  v60[10] = v47;
  uint64_t v45 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"correctedWordLength" minValue:&unk_1F3FA7B50 maxValue:&unk_1F3FA7B68 significantDigits:0];
  v60[11] = v45;
  v44 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"correctedHasLeftHandContext"];
  v60[12] = v44;
  v43 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"correctedOperationType" allowedValues:0];
  v60[13] = v43;
  uint64_t v42 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"revisedModality" allowedValues:v0];
  v60[14] = v42;
  v41 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"revisedSource" allowedValues:0];
  v60[15] = v41;
  uint64_t v40 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"revisedCapitalization" allowedValues:v1];
  v60[16] = v40;
  v39 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"revisedDiacritics"];
  v60[17] = v39;
  uint64_t v38 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"revisedApostrophe"];
  v60[18] = v38;
  v37 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"revisedEditDistance" allowedValues:v2];
  v60[19] = v37;
  v36 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"revisedWordLength" minValue:&unk_1F3FA7B50 maxValue:&unk_1F3FA7B68 significantDigits:0];
  v60[20] = v36;
  uint64_t v35 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"revisedWordRevisionCount" minValue:&unk_1F3FA7B50 maxValue:&unk_1F3FA7B68 significantDigits:0];
  v60[21] = v35;
  v34 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"textTraitAutocorrectionEnabled"];
  v60[22] = v34;
  v33 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardType];
  v60[23] = v33;
  uint64_t v32 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLayout];
  v60[24] = v32;
  v30 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardLanguage];
  v60[25] = v30;
  uint64_t v28 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardRegion];
  v60[26] = v28;
  v27 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardVariant];
  v60[27] = v27;
  uint64_t v26 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryLanguage];
  v60[28] = v26;
  uint64_t v25 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringKeyboardSecondaryRegion];
  v60[29] = v25;
  uint64_t v4 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v5 = kFeatureStringTypingEngine;
  uint64_t v24 = TITypingEngineAllowedValues();
  v23 = [v4 stringFieldSpecWithName:v5 allowedValues:v24];
  v60[30] = v23;
  id v6 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v7 = kFeatureStringAssetAvailabilityStatus;
  id v22 = TIAssetAvailabilityStatusAllowedValues();
  v21 = [v6 stringFieldSpecWithName:v7 allowedValues:v22];
  v60[31] = v21;
  uint64_t v8 = v3;
  v9 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureKeyboardUsage allowedValues:v3];
  v60[32] = v9;
  v31 = (void *)v3;
  v10 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureContinuousPathUsage allowedValues:v3];
  v60[33] = v10;
  v11 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureCandidateBarUsage allowedValues:v3];
  v60[34] = v11;
  BOOL v12 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureAutocorrectionUsage allowedValues:v8];
  v60[35] = v12;
  long long v13 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureMultilingualUsage allowedValues:v8];
  v60[36] = v13;
  long long v14 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:kFeatureStringTypingSpeed allowedValues:v29];
  v60[37] = v14;
  long long v15 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"hasCursorMovement"];
  v60[38] = v15;
  long long v16 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"hasEmojiInput"];
  v60[39] = v16;
  v17 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:kFeatureStringSessionAlignmentConfidence minValue:&unk_1F3FA7B50 maxValue:&unk_1F3FA7B80 significantDigits:0];
  v60[40] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:41];

  uint64_t v19 = [MEMORY[0x1E4FAE248] eventSpecWithName:@"revisionRate" inputModeRequired:0 fieldSpecs:v18];
  v20 = (void *)_createEventSpec___eventSpec;
  _createEventSpec___eventSpec = v19;
}

- (void)_registerAnalyticsEventSpecWithAnalyticsService
{
  id v3 = [(TIRevisionRateAnalyzer *)self _createEventSpec];
  uint64_t v2 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v2 registerEventSpec:v3];
}

- (void)_dispatchEventPayloads:(id)a3 analyticsService:(id)a4 typingSession:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v20 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4FAE260] sharedInstance];
  }
  v11 = v10;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v18 = [v9 sessionParams];
        uint64_t v19 = [v18 testingParameters];
        [v11 dispatchEventWithName:@"revisionRate" payload:v17 testingParameters:v19 allowSparsePayload:1];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }
}

- (TIRevisionRateAnalyzer)init
{
  v7.receiver = self;
  v7.super_class = (Class)TIRevisionRateAnalyzer;
  uint64_t v2 = [(TIRevisionRateAnalyzer *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    [(TIRevisionRateAnalyzer *)v2 _registerAnalyticsEventSpecWithAnalyticsService];
    uint64_t v4 = objc_alloc_init(TIRevisionRateAnalysisSummary);
    revisionRateAnalysisSummary = v3->_revisionRateAnalysisSummary;
    v3->_revisionRateAnalysisSummary = v4;
  }
  return v3;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return 2;
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a5)
  {
    id v9 = (void *)MEMORY[0x1E4FAE268];
    +[TIStandardTypingSessionConfidenceEvaluator calculateAlignedTypingSessionConfidence:a4];
    id v10 = objc_msgSend(v9, "bucketRatioWithValue:bucketCount:", 10);
    [(TIRevisionRateAnalyzer *)self setSessionAlignmentConfidence:v10];

    v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v12 = [(TIRevisionRateAnalyzer *)self getSessionFields];
    uint64_t v13 = _analyzeEditEvents(v8, v12);
    [v11 addObjectsFromArray:v13];

    uint64_t v14 = _analyzeNonEditEvents(v8, v12);
    [v11 addObjectsFromArray:v14];

    uint64_t v15 = _analyzeDeletedOriginalWordEvents(v8, v12);
    [v11 addObjectsFromArray:v15];

    if ([v11 count])
    {
      long long v16 = [(TIRevisionRateAnalyzer *)self getLanguageRegionForSession:v8];
      [(TIRevisionRateAnalyzer *)self summarizeWithEventDictionary:v11 languageRegion:v16];

      [(TIRevisionRateAnalyzer *)self _dispatchEventPayloads:v11 analyticsService:0 typingSession:v8];
    }
    else if (IXACanLogMessageAtLevel())
    {
      uint64_t v17 = IXADefaultLogFacility();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s No revision metric payloads could be generated from the keyboard typing session.", "-[TIRevisionRateAnalyzer analyzeSession:alignedSession:withConfidence:]");
        *(_DWORD *)buf = 138412290;
        long long v21 = v19;
        _os_log_debug_impl(&dword_1E3F0E000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    goto LABEL_10;
  }
  v11 = IXADefaultLogFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s Typing session confidence is set to 'none' and will not be analyzed by the autocorrection revision rate analyzer.", "-[TIRevisionRateAnalyzer analyzeSession:alignedSession:withConfidence:]");
    *(_DWORD *)buf = 138412290;
    long long v21 = v12;
    _os_log_debug_impl(&dword_1E3F0E000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
LABEL_10:
  }
  return a5 != 0;
}

@end