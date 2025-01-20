@interface TIProactiveQuickTypeManager
+ (id)buildSecureCandidateFrom:(id)a3 withSecureCandidateRenderer:(id)a4 input:(id)a5;
+ (id)proactiveTriggerForTextContentType:(id)a3;
+ (id)proactiveTriggerForTextContentType:(id)a3 withContextBeforeInput:(id)a4 autofillMode:(unint64_t)a5;
+ (id)sharedInstance;
+ (id)singletonInstance;
+ (void)setSharedTIProactiveQuickTypeManager:(id)a3;
- (BOOL)isAutoCompleteEnabled;
- (BOOL)isAutoPopupEnabled;
- (BOOL)isEnabled;
- (BOOL)usePQT2Flow;
- (TIProactiveQuickTypeManager)init;
- (TIProactiveQuickTypeManager)initWithICManager:(id)a3;
- (id)_makeQueue;
- (id)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6;
- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14;
- (id)getLastSuggestionTime;
- (id)inputContextPredictionManager;
- (id)renderItems:(id)a3 withAdditionalPredictions:(id)a4 withSecureCandidateRenderer:(id)a5 withRenderTraits:(id)a6 withInput:(id)a7;
- (id)searchForMeCardEmailAddresses;
- (id)searchForMeCardRegions;
- (unint64_t)matchProactiveCandidateToUserInput:(id)a3 userInput:(id)a4;
- (void)addToTypologyTrace:(id)a3 withTriggerSource:(id)a4 withTriggerType:(id)a5 withTriggerSubType:(id)a6 withPredictionResults:(id)a7 withFirstTrigger:(id)a8;
- (void)dealloc;
- (void)generateAndRenderProactiveSuggestionsForInput:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withIsResponseDenyListed:(BOOL)a13 withShouldDisableAutoCaps:(BOOL)a14 withAvailableApps:(id)a15 logBlock:(id)a16 async:(BOOL)a17 completion:(id)a18;
- (void)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6 async:(BOOL)a7 completion:(id)a8;
- (void)keyboardActivityDidTransition:(id)a3;
- (void)loggingProactiveEngagementMetric:(unint64_t)a3 withLocale:(id)a4 fieldType:(id)a5;
- (void)propogateMetrics:(id)a3 data:(id)a4;
- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5;
- (void)reset;
- (void)suggestionAccepted:(id)a3 fieldType:(id)a4;
- (void)suggestionNotAccepted:(id)a3;
- (void)userActionWithNoNewTriggers:(id)a3 fieldType:(id)a4;
@end

@implementation TIProactiveQuickTypeManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxLengthProactiveCandidate, 0);
  objc_storeStrong((id *)&self->_lastSuggestionTime, 0);
  objc_storeStrong((id *)&self->_lastTriggerForSuggestion, 0);
  objc_storeStrong((id *)&self->_inputContextPredictionManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)isAutoCompleteEnabled
{
  v2 = TIGetProactiveQuickTypeSettingValue();
  unint64_t v3 = [v2 integerValue];

  return (v3 >> 2) & 1;
}

- (BOOL)isAutoPopupEnabled
{
  v2 = TIGetProactiveQuickTypeSettingValue();
  unint64_t v3 = [v2 integerValue];

  return (v3 >> 1) & 1;
}

- (BOOL)isEnabled
{
  v2 = TIGetProactiveQuickTypeSettingValue();
  char v3 = [v2 integerValue];

  return v3 & 1;
}

- (id)searchForMeCardRegions
{
  v2 = [(TIProactiveQuickTypeManager *)self inputContextPredictionManager];
  char v3 = [v2 searchForMeCardRegions];

  return v3;
}

- (void)propogateMetrics:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TIProactiveQuickTypeManager *)self inputContextPredictionManager];
  [v8 propogateMetrics:v7 data:v6];
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = TIProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = [NSString stringWithFormat:@"%s Sending feedback to Input Context, Type: %ud, ", "-[TIProactiveQuickTypeManager provideFeedbackForString:type:style:]", v6];
    *(_DWORD *)buf = 138412290;
    v13 = v11;
    _os_log_debug_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  v10 = [(TIProactiveQuickTypeManager *)self inputContextPredictionManager];
  [v10 provideFeedbackForString:v8 type:v6 style:v5];
}

- (void)reset
{
  char v3 = [(TIProactiveQuickTypeManager *)self inputContextPredictionManager];
  [v3 reset];

  lastSuggestionTime = self->_lastSuggestionTime;
  self->_lastSuggestionTime = 0;

  maxLengthProactiveCandidate = self->_maxLengthProactiveCandidate;
  self->_maxLengthProactiveCandidate = 0;
}

- (unint64_t)matchProactiveCandidateToUserInput:(id)a3 userInput:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:v6])
  {
    unint64_t v7 = 1;
  }
  else
  {
    float v8 = (float)(unint64_t)[v6 _editDistanceFrom:v5];
    double v9 = (float)((float)(v8 / (float)(unint64_t)[v5 length]) * 100.0);
    uint64_t v10 = 3;
    if (v9 > 66.66) {
      uint64_t v10 = 4;
    }
    if (v9 <= 33.33) {
      unint64_t v7 = 2;
    }
    else {
      unint64_t v7 = v10;
    }
  }

  return v7;
}

- (void)loggingProactiveEngagementMetric:(unint64_t)a3 withLocale:(id)a4 fieldType:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  switch(a3)
  {
    case 3uLL:
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      uint64_t v10 = TIOSLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = [NSString stringWithFormat:@"%s Proactive suggestion %@ not selected by user and mildly matching user input!", "-[TIProactiveQuickTypeManager loggingProactiveEngagementMetric:withLocale:fieldType:]", self->_maxLengthProactiveCandidate];
        *(_DWORD *)buf = 138412290;
        v18 = v14;
        _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      v11 = kTIStatisticsZeroEngagementDescriptionMildlyMatchedToUserInput;
      break;
    case 2uLL:
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      uint64_t v10 = TIOSLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v15 = [NSString stringWithFormat:@"%s Proactive suggestion %@ not selected by user and moderately matching user input!", "-[TIProactiveQuickTypeManager loggingProactiveEngagementMetric:withLocale:fieldType:]", self->_maxLengthProactiveCandidate];
        *(_DWORD *)buf = 138412290;
        v18 = v15;
        _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      v11 = kTIStatisticsZeroEngagementDescriptionModeratelyMatchedToUserInput;
      break;
    case 1uLL:
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      uint64_t v10 = TIOSLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v13 = [NSString stringWithFormat:@"%s Proactive suggestion %@ not selected by user and exactly matching user input!", "-[TIProactiveQuickTypeManager loggingProactiveEngagementMetric:withLocale:fieldType:]", self->_maxLengthProactiveCandidate];
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      v11 = kTIStatisticsZeroEngagementDescriptionExactlyMatchedToUserInput;
      break;
    default:
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      uint64_t v10 = TIOSLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v16 = [NSString stringWithFormat:@"%s Proactive suggestion %@ not selected by user and zero matching user input!", "-[TIProactiveQuickTypeManager loggingProactiveEngagementMetric:withLocale:fieldType:]", self->_maxLengthProactiveCandidate];
        *(_DWORD *)buf = 138412290;
        v18 = v16;
        _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      v11 = &kTIStatisticsZeroEngagementDescriptionNotMatchedToUserInput;
      break;
  }

  v12 = (void *)[(__CFString *)*v11 copy];
  TIStatisticLogProactiveDescription(v8, self->_lastTriggerForSuggestion, v12, @"engagement", v9);
}

- (void)keyboardActivityDidTransition:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__TIProactiveQuickTypeManager_keyboardActivityDidTransition___block_invoke;
  v7[3] = &unk_1E6E2E220;
  id v8 = v4;
  id v9 = self;
  id v5 = v4;
  dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v7);
  TIDispatchAsync();
}

void __61__TIProactiveQuickTypeManager_keyboardActivityDidTransition___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) toState];
  if (v2 == 3)
  {
    id v3 = [*(id *)(a1 + 40) inputContextPredictionManager];
    [v3 hibernate];
  }
  else
  {
    if (v2 != 1) {
      return;
    }
    id v3 = [*(id *)(a1 + 40) inputContextPredictionManager];
    [v3 warmUp];
  }
}

- (void)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6 async:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v20 = [v14 componentsSeparatedByCharactersInSet:v19];

  v21 = [v20 lastObject];
  if ([v21 length])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __156__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType_async_completion___block_invoke;
    aBlock[3] = &unk_1E6E2AD00;
    aBlock[4] = self;
    id v27 = v15;
    id v41 = v15;
    id v42 = v16;
    id v22 = v21;
    id v43 = v22;
    id v44 = v14;
    id v45 = v17;
    id v46 = v18;
    v23 = _Block_copy(aBlock);
    if (v9)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __156__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType_async_completion___block_invoke_2;
      block[3] = &unk_1E6E2E308;
      block[4] = self;
      id v38 = v22;
      id v39 = v23;
      dispatch_block_t v24 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
      TIDispatchAsync();

      v25 = v38;
    }
    else
    {
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__6357;
      v35 = __Block_byref_object_dispose__6358;
      v36 = 0;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __156__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType_async_completion___block_invoke_4;
      v28[3] = &unk_1E6E2E2A8;
      v30 = &v31;
      v28[4] = self;
      id v29 = v22;
      dispatch_block_t v26 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v28);
      TIDispatchSync();

      (*((void (**)(void *, uint64_t))v23 + 2))(v23, v32[5]);
      _Block_object_dispose(&v31, 8);
      v25 = v36;
    }

    id v15 = v27;
  }
  else
  {
    (*((void (**)(id, void))v18 + 2))(v18, 0);
  }
}

void __156__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType_async_completion___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  if ([v16 count])
  {
    id v3 = [*(id *)(a1 + 32) renderItems:v16 withAdditionalPredictions:0 withSecureCandidateRenderer:*(void *)(a1 + 40) withRenderTraits:*(void *)(a1 + 48) withInput:*(void *)(a1 + 56)];
    id v4 = (void *)[v3 mutableCopy];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 40))
  {
    if (*(void *)(v5 + 48)
      && (unint64_t)[*(id *)(a1 + 64) length] >= *(void *)(*(void *)(a1 + 32) + 48))
    {
      unint64_t v6 = [*(id *)(a1 + 64) length] - *(void *)(*(void *)(a1 + 32) + 48);
      if (v6 >= [*(id *)(*(void *)(a1 + 32) + 40) length])
      {
        unint64_t v7 = [*(id *)(a1 + 64) substringFromIndex:*(void *)(*(void *)(a1 + 32) + 48)];
        id v8 = [v7 lowercaseString];

        uint64_t v9 = [*(id *)(a1 + 32) matchProactiveCandidateToUserInput:*(void *)(*(void *)(a1 + 32) + 40) userInput:v8];
        uint64_t v10 = *(void **)(a1 + 32);
        v11 = [*(id *)(a1 + 40) localeIdentifier];
        [v10 loggingProactiveEngagementMetric:v9 withLocale:v11 fieldType:*(void *)(a1 + 72)];

        uint64_t v12 = *(void *)(a1 + 32);
        v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = 0;

        *(void *)(*(void *)(a1 + 32) + 48) = 0;
        uint64_t v14 = *(void *)(a1 + 32);
        id v15 = *(void **)(v14 + 24);
        *(void *)(v14 + 24) = 0;
      }
    }
    else
    {
      *(void *)(*(void *)(a1 + 32) + 48) = [*(id *)(a1 + 64) length] - 1;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

void __156__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType_async_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) inputContextPredictionManager];
  id v3 = [v2 lastCachedResultWithInitialCharacters:*(void *)(a1 + 40)];

  id v5 = *(id *)(a1 + 48);
  id v4 = v3;
  TIDispatchAsync();
}

void __156__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType_async_completion___block_invoke_4(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) inputContextPredictionManager];
  uint64_t v2 = [v5 lastCachedResultWithInitialCharacters:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __156__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType_async_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__6357;
  v13 = __Block_byref_object_dispose__6358;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __139__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType___block_invoke;
  v8[3] = &unk_1E6E2C938;
  v8[4] = &v9;
  [(TIProactiveQuickTypeManager *)self generateAndRenderProactiveSuggestionsWithInput:a3 withSecureCandidateRenderer:a4 withRenderTraits:a5 textContentType:a6 async:0 completion:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __139__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType___block_invoke(uint64_t a1, void *a2)
{
}

- (id)searchForMeCardEmailAddresses
{
  uint64_t v2 = [(TIProactiveQuickTypeManager *)self inputContextPredictionManager];
  uint64_t v3 = [v2 searchForMeCardEmailAddresses];

  return v3;
}

- (void)suggestionNotAccepted:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!self->_maxLengthProactiveCandidate)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v11 = [v10 candidate];
            unint64_t v12 = [v11 length];
            NSUInteger v13 = [(NSString *)self->_maxLengthProactiveCandidate length];

            if (v12 > v13)
            {
              id v14 = [v10 candidate];
              maxLengthProactiveCandidate = self->_maxLengthProactiveCandidate;
              self->_maxLengthProactiveCandidate = v14;
            }
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
    if ([(NSString *)self->_maxLengthProactiveCandidate length] >= 0x14)
    {
      id v16 = [(NSString *)self->_maxLengthProactiveCandidate substringToIndex:20];
      id v17 = self->_maxLengthProactiveCandidate;
      self->_maxLengthProactiveCandidate = v16;
    }
  }
}

- (void)suggestionAccepted:(id)a3 fieldType:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  lastSuggestionTime = self->_lastSuggestionTime;
  if (lastSuggestionTime)
  {
    [(NSDate *)lastSuggestionTime timeIntervalSinceNow];
    TIStatisticsLogProactiveTimeOnScreen(v6, self->_lastTriggerForSuggestion, 1, v7);
    uint64_t v9 = self->_lastSuggestionTime;
    self->_lastSuggestionTime = 0;
  }
  else
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    uint64_t v10 = TIOSLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s ProactiveQuickType:TI: ERROR on proactive Time SHOULD HAVE HAD A LAST SUGGESTION TIME", "-[TIProactiveQuickTypeManager suggestionAccepted:fieldType:]");
      *(_DWORD *)buf = 138412290;
      NSUInteger v13 = v11;
      _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (void)userActionWithNoNewTriggers:(id)a3 fieldType:(id)a4
{
  lastSuggestionTime = self->_lastSuggestionTime;
  if (lastSuggestionTime)
  {
    id v7 = a4;
    id v8 = a3;
    [(NSDate *)lastSuggestionTime timeIntervalSinceNow];
    TIStatisticsLogProactiveTimeOnScreen(v8, self->_lastTriggerForSuggestion, 0, v7);

    uint64_t v9 = self->_lastSuggestionTime;
    self->_lastSuggestionTime = 0;
  }
}

- (void)generateAndRenderProactiveSuggestionsForInput:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withIsResponseDenyListed:(BOOL)a13 withShouldDisableAutoCaps:(BOOL)a14 withAvailableApps:(id)a15 logBlock:(id)a16 async:(BOOL)a17 completion:(id)a18
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v98 = a3;
  id v102 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a7;
  v96 = (__CFString *)a8;
  id v26 = a9;
  id v27 = v25;
  id v28 = a10;
  id v101 = a11;
  id v100 = a15;
  id v29 = a16;
  id v30 = a18;
  uint64_t v31 = v30;
  v95 = v27;
  if (v27)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    v32 = v98;
    v92 = v31;
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v33 = TIOSLogFacility();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        id v85 = v29;
        v86 = [NSString stringWithFormat:@"%s ProactiveQuickType:TI: Found triggers, count = %lu", "-[TIProactiveQuickTypeManager generateAndRenderProactiveSuggestionsForInput:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:nextInputWillInsertAutospace:withIsResponseDenyListed:withShouldDisableAutoCaps:withAvailableApps:logBlock:async:completion:]", objc_msgSend(v98, "count")];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v86;
        _os_log_debug_impl(&dword_1E3F0E000, v33, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

        id v29 = v85;
        v32 = v98;
      }
    }
    v87 = [MEMORY[0x1E4F1C9C8] date];
    v99 = [MEMORY[0x1E4F1CA48] array];
    v88 = v26;
    v89 = v24;
    v93 = v23;
    id v90 = v29;
    id v91 = v28;
    if ([(TIProactiveQuickTypeManager *)self usePQT2Flow])
    {

      v34 = [v102 documentState];
      v35 = [v34 contextBeforeInput];
      if (v35)
      {
        v36 = [v102 documentState];
        v37 = [v36 contextBeforeInput];
      }
      else
      {
        v37 = &stru_1F3F7A998;
      }

      v57 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      v58 = [(__CFString *)v37 componentsSeparatedByCharactersInSet:v57];
      v59 = [v58 lastObject];

      if (a12)
      {
        uint64_t v60 = [v59 stringByAppendingString:@" "];

        v59 = (void *)v60;
      }
      v61 = [v102 textInputTraits];
      v62 = [v61 textContentType];

      v63 = v96;
      if (![v62 length])
      {
        uint64_t v64 = [v102 autofillMode];
        if ((unint64_t)(v64 - 4) <= 2)
        {
          id v65 = **((id **)&unk_1E6E2AD40 + v64 - 4);

          v62 = v65;
        }
      }
      id v66 = objc_alloc(MEMORY[0x1E4F6F4D8]);
      v67 = [v102 inputContextHistory];
      v68 = (void *)[v66 initWithContext:v59 inputContextHistory:v67 contentType:v62];

      [v68 setAvailableApps:v100];
      [v99 addObject:v68];
      if ([v62 length])
      {
        v69 = v59;
        v70 = v59;
      }
      else
      {
        uint64_t v71 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        v69 = v59;
        v72 = [v59 componentsSeparatedByCharactersInSet:v71];
        uint64_t v73 = [v72 lastObject];
        v74 = (void *)v73;
        if (v73) {
          v75 = (__CFString *)v73;
        }
        else {
          v75 = &stru_1F3F7A998;
        }
        v70 = v75;

        v63 = (void *)v71;
      }

      int v56 = 0;
      v53 = 0;
      v54 = v70;
      v55 = 0;
      id v29 = v90;
      id v28 = v91;
      id v39 = v69;
    }
    else
    {
      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      id v39 = v32;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v145 objects:v154 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        v97 = 0;
        int v42 = 0;
        uint64_t v43 = *(void *)v146;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v146 != v43) {
              objc_enumerationMutation(v39);
            }
            id v45 = *(void **)(*((void *)&v145 + 1) + 8 * i);
            uint64_t v46 = [v45 triggerSourceType];
            if (v46 > 2)
            {
              uint64_t v47 = 0;
            }
            else
            {
              uint64_t v47 = v46;
              v97 = off_1E6E2AD58[v46];
              int v42 = dword_1E41559A8[v46];
            }
            v48 = [v102 textInputTraits];
            v49 = [v48 textContentType];
            TIStatisticLogProactive(v101, v45, 0, v49, 0);

            id v50 = objc_alloc(MEMORY[0x1E4F6F4D8]);
            v51 = [v45 attributes];
            v52 = (void *)[v50 initWithSource:v47 attributes:v51];

            [v52 setAvailableApps:v100];
            [v99 addObject:v52];
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v145 objects:v154 count:16];
        }
        while (v41);
        v53 = v39;
        id v29 = v90;
        id v28 = v91;
        v54 = v96;
        v55 = v97;
        int v56 = v42;
      }
      else
      {
        v55 = 0;
        int v56 = 0;
        v53 = v39;
        v54 = v96;
      }
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke;
    aBlock[3] = &unk_1E6E2AC88;
    aBlock[4] = self;
    id v38 = v53;
    id v131 = v38;
    id v142 = v29;
    v132 = v55;
    id v76 = v87;
    id v133 = v76;
    id v77 = v28;
    id v134 = v77;
    id v135 = v102;
    id v78 = v101;
    id v136 = v78;
    id v143 = v92;
    id v137 = v95;
    id v138 = v93;
    id v24 = v89;
    id v139 = v89;
    v96 = v54;
    v140 = v96;
    id v79 = v99;
    id v141 = v79;
    int v144 = v56;
    v80 = _Block_copy(aBlock);
    if ([(TIProactiveQuickTypeManager *)self usePQT2Flow]) {
      int v81 = 3;
    }
    else {
      int v81 = 2;
    }
    if (a17)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_167;
      block[3] = &unk_1E6E2ACB0;
      block[4] = self;
      id v121 = v79;
      id v122 = v77;
      id v26 = v88;
      id v123 = v88;
      id v124 = v78;
      BOOL v128 = a13;
      BOOL v129 = a14;
      int v126 = v56;
      int v127 = v81;
      id v125 = v80;
      dispatch_block_t v82 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
      TIDispatchAsync();

      v83 = v121;
    }
    else
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v150 = 0x3032000000;
      v151 = __Block_byref_object_copy__6357;
      v152 = __Block_byref_object_dispose__6358;
      v153 = 0;
      uint64_t v114 = 0;
      v115 = &v114;
      uint64_t v116 = 0x3032000000;
      v117 = __Block_byref_object_copy__6357;
      v118 = __Block_byref_object_dispose__6358;
      id v119 = 0;
      v103[0] = MEMORY[0x1E4F143A8];
      v103[1] = 3221225472;
      v103[2] = __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_3_169;
      v103[3] = &unk_1E6E2ACD8;
      v108 = &v114;
      v103[4] = self;
      id v104 = v79;
      id v105 = v77;
      id v26 = v88;
      id v106 = v88;
      BOOL v112 = a13;
      BOOL v113 = a14;
      int v110 = v56;
      int v111 = v81;
      id v107 = v78;
      p_long long buf = &buf;
      id v24 = v89;
      dispatch_block_t v84 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v103);
      TIDispatchSync();

      (*((void (**)(void *, uint64_t, void))v80 + 2))(v80, v115[5], *(void *)(*((void *)&buf + 1) + 40));
      _Block_object_dispose(&v114, 8);

      _Block_object_dispose(&buf, 8);
      v83 = v153;
    }

    uint64_t v31 = v92;
    id v23 = v93;
    id v29 = v90;
    id v28 = v91;
  }
  else
  {
    (*((void (**)(id, void))v30 + 2))(v30, MEMORY[0x1E4F1CBF0]);
    id v38 = v98;
  }
}

void __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v165[2] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (([*(id *)(a1 + 32) usePQT2Flow] & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
    uint64_t v9 = [v8 attributes];
    uint64_t v10 = [v9 valueForKey:*MEMORY[0x1E4F72330]];

    a3 = [v8 attributes];
    uint64_t v3 = [a3 valueForKey:*MEMORY[0x1E4F72308]];

    [*(id *)(a1 + 32) addToTypologyTrace:*(void *)(a1 + 128) withTriggerSource:*(void *)(a1 + 48) withTriggerType:v10 withTriggerSubType:v3 withPredictionResults:v6 withFirstTrigger:v8];
  }
  [*(id *)(a1 + 56) timeIntervalSinceNow];
  double v12 = v11;
  id v119 = v6;
  id v127 = v7;
  if ([v6 count])
  {
    NSUInteger v13 = [v6 objectAtIndexedSubscript:0];
    uint64_t v14 = [v13 trigger];
    if ([v14 triggerSourceType] == 3)
    {

      goto LABEL_16;
    }
    uint64_t v3 = [v6 objectAtIndexedSubscript:0];
    id v15 = [v3 trigger];
    if ([v15 triggerSourceType] == 2)
    {
    }
    else
    {
      uint64_t v16 = *MEMORY[0x1E4F722E8];
      v165[0] = *MEMORY[0x1E4F722E0];
      v165[1] = v16;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v165 count:2];
      long long v18 = [v6 objectAtIndexedSubscript:0];
      long long v19 = [v18 trigger];
      long long v20 = [v19 attributedString];
      a3 = [v20 objectForKeyedSubscript:@"subtype"];
      char v123 = [v17 containsObject:a3];

      id v6 = v119;
      id v7 = v127;

      if ((v123 & 1) == 0) {
        goto LABEL_16;
      }
    }
    long long v21 = [v6 objectAtIndexedSubscript:0];
    id v22 = [v21 trigger];
    int v23 = [v22 triggerSourceType];

    id v24 = [v6 firstObject];
    id v124 = [v24 originatingBundleID];

    obuint64_t j = *(id *)(a1 + 64);
    id v25 = [v6 objectAtIndexedSubscript:0];
    uint64_t v26 = [v25 predictionAge];

    if (v26 == -1)
    {
      uint64_t v117 = 0;
    }
    else
    {
      id v27 = [v6 objectAtIndexedSubscript:0];
      uint64_t v117 = [v27 predictionAge];
    }
    id v28 = [v6 objectAtIndexedSubscript:0];
    [v28 trigger];
    v30 = id v29 = v6;
    uint64_t v31 = [v30 attributedString];
    v32 = [v31 objectForKeyedSubscript:@"field"];
    uint64_t v33 = v32;
    if (v32)
    {
      id v34 = v32;
    }
    else
    {
      v35 = [v29 objectAtIndexedSubscript:0];
      v36 = [v35 trigger];
      v37 = [v36 attributedString];
      id v34 = [v37 objectForKeyedSubscript:@"type"];
    }
    a3 = +[TIConnectionsMetricsTracker sharedInstance];
    id v38 = [*(id *)(a1 + 72) textInputTraits];
    id v39 = [v38 textContentType];
    BYTE1(v113) = v23 == 2;
    LOBYTE(v113) = v23 != 2;
    uint64_t v3 = obj;
    objc_msgSend(a3, "trackPredictionEngagmentWithConversion:age:fieldType:resultType:fromBundleId:targetApp:linguistic:semantic:", 0, v117, v39, v34, v124, obj, v113);

    id v6 = v119;
    id v7 = v127;
  }
LABEL_16:
  if (v7)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    uint64_t v40 = TIOSLogFacility();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      id v107 = [NSString stringWithFormat:@"%s ProactiveQuickType:TI: Error returned from InputContext: %@, response time = %lf seconds", "-[TIProactiveQuickTypeManager generateAndRenderProactiveSuggestionsForInput:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:nextInputWillInsertAutospace:withIsResponseDenyListed:withShouldDisableAutoCaps:withAvailableApps:logBlock:async:completion:]_block_invoke", v7, -v12];
      *(_DWORD *)long long buf = 138412290;
      v164 = v107;
      _os_log_debug_impl(&dword_1E3F0E000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    if (([*(id *)(a1 + 32) usePQT2Flow] & 1) == 0)
    {
      long long v157 = 0u;
      long long v158 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      id v41 = *(id *)(a1 + 40);
      uint64_t v42 = [v41 countByEnumeratingWithState:&v155 objects:v162 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v156;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v156 != v44) {
              objc_enumerationMutation(v41);
            }
            uint64_t v46 = *(void **)(*((void *)&v155 + 1) + 8 * i);
            if ([v7 code] == 5)
            {
              uint64_t v47 = [v7 localizedDescription];
              v48 = *(void **)(a1 + 80);
              v49 = [*(id *)(a1 + 72) textInputTraits];
              id v50 = [v49 textContentType];
              TIStatisticsLogProactiveSuggestedZeroDescription(v48, v46, v47, v50);

              v51 = *(void **)(a1 + 80);
              v52 = [*(id *)(a1 + 72) textInputTraits];
              v53 = [v52 textContentType];
              TIStatisticLogProactive(v51, v46, 1, v53, 0);

              id v7 = v127;
            }
            else
            {
              v54 = *(void **)(a1 + 80);
              uint64_t v47 = [*(id *)(a1 + 72) textInputTraits];
              v52 = [v47 textContentType];
              TIStatisticLogProactive(v54, v46, 2, v52, 0);
            }
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v155 objects:v162 count:16];
        }
        while (v43);
      }

      id v6 = v119;
    }
    (*(void (**)(void))(*(void *)(a1 + 136) + 16))();
    goto LABEL_103;
  }
  int v55 = [v6 count];
  if (v55 >= 1)
  {
    if ([*(id *)(a1 + 40) count])
    {
      v118 = [*(id *)(a1 + 40) objectAtIndex:0];
    }
    else
    {
      v118 = 0;
    }
    while (1)
    {
      if (!_os_feature_enabled_impl() || [*(id *)(a1 + 72) autofillMode] != 4) {
        goto LABEL_68;
      }
      v68 = [*(id *)(a1 + 72) documentState];
      v69 = [v68 contextBeforeInput];
      if (v69)
      {
        a3 = [*(id *)(a1 + 72) documentState];
        uint64_t v3 = [a3 contextBeforeInput];
        if ([v3 length]) {
          break;
        }
      }
      id obja = v3;
      id v125 = a3;
      uint64_t v71 = [*(id *)(a1 + 72) documentState];
      uint64_t v72 = [v71 contextAfterInput];
      if (!v72)
      {

        a3 = v125;
        if (!v69)
        {

          id v6 = v119;
LABEL_65:
          if (([*(id *)(a1 + 88) disableHideMyEmail] & 1) == 0) {
            [*(id *)(a1 + 88) setShouldOfferHideMyEmail:1];
          }
          goto LABEL_68;
        }
        BOOL v70 = 1;
        goto LABEL_64;
      }
      uint64_t v73 = (void *)v72;
      v74 = [*(id *)(a1 + 72) documentState];
      v75 = [v74 contextAfterInput];
      uint64_t v76 = [v75 length];
      BOOL v70 = v76 == 0;

      if (v69)
      {
        uint64_t v3 = obja;
        a3 = v125;
LABEL_64:

        id v6 = v119;
        if (v70) {
          goto LABEL_65;
        }
        goto LABEL_68;
      }

      id v6 = v119;
      uint64_t v3 = obja;
      a3 = v125;
      if (!v76) {
        goto LABEL_65;
      }
LABEL_68:
      if (!--v55)
      {
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        if (TICanLogMessageAtLevel_logLevel > 1)
        {
          id v77 = TIOSLogFacility();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
          {
            v108 = NSString;
            uint64_t v109 = [v6 count];
            [*(id *)(a1 + 56) timeIntervalSinceNow];
            int v111 = [v108 stringWithFormat:@"%s ProactiveQuickType:TI: %lu results returned from InputContext, response time = %lf seconds", "-[TIProactiveQuickTypeManager generateAndRenderProactiveSuggestionsForInput:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:nextInputWillInsertAutospace:withIsResponseDenyListed:withShouldDisableAutoCaps:withAvailableApps:logBlock:async:completion:]_block_invoke", v109, -v110];
            *(_DWORD *)long long buf = 138412290;
            v164 = v111;
            _os_log_debug_impl(&dword_1E3F0E000, v77, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
        id v78 = [*(id *)(a1 + 32) renderItems:v6 withAdditionalPredictions:*(void *)(a1 + 96) withSecureCandidateRenderer:*(void *)(a1 + 104) withRenderTraits:*(void *)(a1 + 88) withInput:*(void *)(a1 + 112)];
        uint64_t v116 = (void *)[v78 mutableCopy];

        context = (void *)MEMORY[0x1E4E7C3D0]();
        if ([*(id *)(a1 + 32) usePQT2Flow])
        {
          long long v153 = 0u;
          long long v154 = 0u;
          long long v151 = 0u;
          long long v152 = 0u;
          id v79 = v6;
          uint64_t v80 = [v79 countByEnumeratingWithState:&v151 objects:v161 count:16];
          if (v80)
          {
            uint64_t v81 = v80;
            uint64_t v82 = *(void *)v152;
            do
            {
              for (uint64_t j = 0; j != v81; ++j)
              {
                if (*(void *)v152 != v82) {
                  objc_enumerationMutation(v79);
                }
                dispatch_block_t v84 = *(void **)(*((void *)&v151 + 1) + 8 * j);
                id v85 = [v84 value];
                uint64_t v86 = [v85 length];

                if (v86)
                {
                  v87 = +[TIProactiveQuickTypeManager sharedInstance];
                  v88 = [v84 value];
                  [v87 provideFeedbackForString:v88 type:3 style:1];
                }
              }
              uint64_t v81 = [v79 countByEnumeratingWithState:&v151 objects:v161 count:16];
            }
            while (v81);
          }

          v89 = +[TIProactiveQuickTypeManager sharedInstance];
          [v89 provideFeedbackForString:&stru_1F3F7A998 type:3 style:1];
        }
        else
        {
          uint64_t v114 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 120), "count"));
          id v90 = [MEMORY[0x1E4F28E60] indexSet];
          [MEMORY[0x1E4F28E60] indexSet];
          v92 = id v91 = v6;
          int v126 = objc_opt_new();
          long long v147 = 0u;
          long long v148 = 0u;
          long long v149 = 0u;
          long long v150 = 0u;
          id objb = v91;
          uint64_t v93 = [objb countByEnumeratingWithState:&v147 objects:v160 count:16];
          if (v93)
          {
            uint64_t v94 = v93;
            uint64_t v95 = *(void *)v148;
            do
            {
              for (uint64_t k = 0; k != v94; ++k)
              {
                if (*(void *)v148 != v95) {
                  objc_enumerationMutation(objb);
                }
                v97 = *(void **)(*((void *)&v147 + 1) + 8 * k);
                id v98 = *(void **)(a1 + 120);
                v146[0] = MEMORY[0x1E4F143A8];
                v146[1] = 3221225472;
                v146[2] = __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_159;
                v146[3] = &unk_1E6E2AC10;
                v146[4] = v97;
                uint64_t v99 = [v98 indexOfObjectPassingTest:v146];
                id v100 = [v97 value];
                [v126 addObject:v100];

                if ([v90 containsIndex:v99]) {
                  id v101 = v92;
                }
                else {
                  id v101 = v90;
                }
                [v101 addIndex:v99];
              }
              uint64_t v94 = [objb countByEnumeratingWithState:&v147 objects:v160 count:16];
            }
            while (v94);
          }

          v89 = v114;
          [v114 removeIndexes:v90];
          [v90 removeIndexes:v92];
          v142[0] = MEMORY[0x1E4F143A8];
          v142[1] = 3221225472;
          v142[2] = __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_2;
          v142[3] = &unk_1E6E2AC38;
          id v143 = *(id *)(a1 + 80);
          id v144 = *(id *)(a1 + 40);
          id v145 = *(id *)(a1 + 72);
          [v114 enumerateIndexesUsingBlock:v142];
          v137[0] = MEMORY[0x1E4F143A8];
          v137[1] = 3221225472;
          v137[2] = __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_3;
          v137[3] = &unk_1E6E2AC60;
          id v138 = *(id *)(a1 + 80);
          id v139 = *(id *)(a1 + 40);
          id v140 = *(id *)(a1 + 72);
          id v102 = v126;
          id v141 = v102;
          [v90 enumerateIndexesUsingBlock:v137];
          v132[0] = MEMORY[0x1E4F143A8];
          v132[1] = 3221225472;
          v132[2] = __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_4;
          v132[3] = &unk_1E6E2AC60;
          id v133 = *(id *)(a1 + 80);
          id v134 = *(id *)(a1 + 40);
          id v135 = *(id *)(a1 + 72);
          id v136 = v102;
          id v103 = v102;
          [v92 enumerateIndexesUsingBlock:v132];

          id v6 = v119;
        }

        (*(void (**)(void))(*(void *)(a1 + 136) + 16))();
        id v7 = v127;
        if ([v116 count] && v118)
        {
          uint64_t v104 = [MEMORY[0x1E4F1C9C8] date];
          uint64_t v105 = *(void *)(a1 + 32);
          id v106 = *(void **)(v105 + 32);
          *(void *)(v105 + 32) = v104;

          objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v118);
        }

        goto LABEL_103;
      }
    }
    BOOL v70 = 0;
    goto LABEL_64;
  }
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    int v56 = TIOSLogFacility();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      BOOL v112 = [NSString stringWithFormat:@"%s ProactiveQuickType:TI: No suggestions returned from InputContext, response time = %lf seconds", "-[TIProactiveQuickTypeManager generateAndRenderProactiveSuggestionsForInput:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:nextInputWillInsertAutospace:withIsResponseDenyListed:withShouldDisableAutoCaps:withAvailableApps:logBlock:async:completion:]_block_invoke_5", -v12];
      *(_DWORD *)long long buf = 138412290;
      v164 = v112;
      _os_log_debug_impl(&dword_1E3F0E000, v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  int v57 = *(_DWORD *)(a1 + 144);
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id v58 = *(id *)(a1 + 40);
  uint64_t v59 = [v58 countByEnumeratingWithState:&v128 objects:v159 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v129;
    if (v12 * -1000.0 <= (double)v57) {
      uint64_t v62 = 1;
    }
    else {
      uint64_t v62 = 3;
    }
    do
    {
      for (uint64_t m = 0; m != v60; ++m)
      {
        if (*(void *)v129 != v61) {
          objc_enumerationMutation(v58);
        }
        uint64_t v64 = *(void **)(*((void *)&v128 + 1) + 8 * m);
        id v65 = *(void **)(a1 + 80);
        id v66 = [*(id *)(a1 + 72) textInputTraits];
        v67 = [v66 textContentType];
        TIStatisticLogProactive(v65, v64, v62, v67, 0);
      }
      uint64_t v60 = [v58 countByEnumeratingWithState:&v128 objects:v159 count:16];
    }
    while (v60);
  }

  (*(void (**)(void))(*(void *)(a1 + 136) + 16))();
  id v6 = v119;
  id v7 = v127;
LABEL_103:
}

void __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_167(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) inputContextPredictionManager];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 89);
  unsigned int v9 = *(_DWORD *)(a1 + 80);
  unsigned int v10 = *(_DWORD *)(a1 + 84);
  id v16 = 0;
  double v11 = [v2 searchWithTriggers:v3 application:v4 recipient:v5 localeIdentifier:v6 isResponseDenyListed:v7 shouldDisableAutoCaps:v8 timeoutInMilliseconds:__PAIR64__(v10 resultLimit:v9) error:&v16];
  id v12 = v16;

  id v15 = *(id *)(a1 + 72);
  id v13 = v12;
  id v14 = v11;
  TIDispatchAsync();
}

void __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_3_169(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) inputContextPredictionManager];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 96);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 97);
  unsigned int v9 = *(_DWORD *)(a1 + 88);
  unsigned int v10 = *(_DWORD *)(a1 + 92);
  uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
  obuint64_t j = *(id *)(v11 + 40);
  uint64_t v12 = [v2 searchWithTriggers:v3 application:v4 recipient:v5 localeIdentifier:v6 isResponseDenyListed:v7 shouldDisableAutoCaps:v8 timeoutInMilliseconds:__PAIR64__(v10 resultLimit:v9) error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

uint64_t __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_2_168(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_159(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 attributedString];
  uint64_t v4 = [*(id *)(a1 + 32) trigger];
  uint64_t v5 = [v4 attributedString];
  uint64_t v6 = [v3 isEqual:v5];

  return v6;
}

void __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  uint64_t v4 = [*(id *)(a1 + 48) textInputTraits];
  uint64_t v5 = [v4 textContentType];
  TIStatisticLogProactive(v3, v6, 1, v5, 0);
}

void __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  uint64_t v4 = [*(id *)(a1 + 48) textInputTraits];
  uint64_t v5 = [v4 textContentType];
  id v6 = [*(id *)(a1 + 56) firstObject];
  TIStatisticsLogProactiveSuggestedOne(v3, v7, v5, v6);
}

void __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  uint64_t v4 = [*(id *)(a1 + 48) textInputTraits];
  uint64_t v5 = [v4 textContentType];
  TIStatisticLogProactive(v3, v6, 5, v5, *(void **)(a1 + 56));
}

- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14
{
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__6357;
  int v23 = __Block_byref_object_dispose__6358;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __277__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithTriggers_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withAvailableApps_logBlock___block_invoke;
  v18[3] = &unk_1E6E2C938;
  v18[4] = &v19;
  LOBYTE(v17) = 0;
  *(_WORD *)((char *)&v16 + 1) = 0;
  LOBYTE(v16) = a12;
  -[TIProactiveQuickTypeManager generateAndRenderProactiveSuggestionsForInput:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:nextInputWillInsertAutospace:withIsResponseDenyListed:withShouldDisableAutoCaps:withAvailableApps:logBlock:async:completion:](self, "generateAndRenderProactiveSuggestionsForInput:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:nextInputWillInsertAutospace:withIsResponseDenyListed:withShouldDisableAutoCaps:withAvailableApps:logBlock:async:completion:", a3, a4, a5, a6, a7, a8, a9, a10, a11, v16, a13, a14, v17, v18);
  id v14 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v14;
}

void __277__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithTriggers_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withAvailableApps_logBlock___block_invoke(uint64_t a1, void *a2)
{
}

- (void)addToTypologyTrace:(id)a3 withTriggerSource:(id)a4 withTriggerType:(id)a5 withTriggerSubType:(id)a6 withPredictionResults:(id)a7 withFirstTrigger:(id)a8
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (void (**)(id, void *))a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if ([v17 count])
  {
    if (v14 && [v14 length])
    {
      uint64_t v19 = [@"Proactive Trigger:\n" stringByAppendingString:v14];
      v13[2](v13, v19);
    }
    if (v15 && [v15 length])
    {
      long long v20 = [@"Proactive Trigger Type:\n" stringByAppendingString:v15];
      v13[2](v13, v20);
    }
    id v35 = v18;
    id v36 = v14;
    if (v16 && [v16 length])
    {
      uint64_t v21 = [@"Proactive Trigger SubType:\n" stringByAppendingString:v16];
      v13[2](v13, v21);
    }
    v13[2](v13, @"Proactive Suggestions:");
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v22 = v17;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v38;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v38 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v26), "value", v35, v36, (void)v37);
          v13[2](v13, v27);

          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v24);
    }

    id v18 = v35;
    id v14 = v36;
  }
  else
  {
    id v28 = [v18 attributes];
    id v29 = [v28 objectForKey:*MEMORY[0x1E4F721D0]];
    id v30 = [MEMORY[0x1E4F1CA98] null];
    char v31 = [v29 isEqual:v30];

    if ((v31 & 1) == 0)
    {
      if (v14 && [v14 length])
      {
        v32 = [@"Proactive Triggers:\n" stringByAppendingString:v14];
        v13[2](v13, v32);
      }
      if (v15 && [v15 length])
      {
        uint64_t v33 = [@"Proactive Trigger Type:\n" stringByAppendingString:v15];
        v13[2](v13, v33);
      }
      if (v16 && [v16 length])
      {
        id v34 = [@"Proactive Trigger SubType:\n" stringByAppendingString:v16];
        v13[2](v13, v34);
      }
      v13[2](v13, @"Proactive Suggestions:\nNone");
    }
  }
}

- (id)renderItems:(id)a3 withAdditionalPredictions:(id)a4 withSecureCandidateRenderer:(id)a5 withRenderTraits:(id)a6 withInput:(id)a7
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = self;
  id v17 = v15;
  id v18 = a7;
  unint64_t v19 = 0x1E4F1C000uLL;
  long long v20 = [MEMORY[0x1E4F1CA48] array];
  id v105 = v13;
  id v106 = v17;
  id v110 = v18;
  int v111 = v14;
  if (![(TIProactiveQuickTypeManager *)v16 usePQT2Flow])
  {
LABEL_12:
    uint64_t v109 = v20;
    v32 = [(id)objc_opt_class() buildSecureCandidateFrom:v12 withSecureCandidateRenderer:v14 input:v18];
    if (![v12 count]
      || ([v12 objectAtIndexedSubscript:0],
          uint64_t v33 = objc_claimAutoreleasedReturnValue(),
          int v34 = [v33 layoutHint],
          v33,
          v34 != 1))
    {
      long long v37 = v32;
      goto LABEL_34;
    }
    [v17 setSharedCellCount:0];
    id v35 = (void *)MEMORY[0x1E4F1C978];
    id v36 = [v32 objectAtIndexedSubscript:0];
    long long v37 = [v35 arrayWithObject:v36];

    [v17 setSharedCellCount:0];
    if ([(TIProactiveQuickTypeManager *)v16 usePQT2Flow]
      && (unint64_t)[v12 count] >= 2)
    {
      if ((unint64_t)[v12 count] < 2) {
        goto LABEL_34;
      }
      id obja = v37;
      uint64_t v38 = 0;
      uint64_t v39 = 1;
      while (1)
      {
        long long v40 = [v12 objectAtIndexedSubscript:v39];
        id v41 = [v40 identifier];
        int v42 = [v41 isEqualToString:@"SmartReply"];

        if (v42)
        {
          id v43 = objc_alloc(MEMORY[0x1E4FAE500]);
          uint64_t v44 = [v40 value];
          id v45 = [v40 label];
          uint64_t v46 = (void *)[v43 initWithCandidate:v44 responseKitCategory:v45];
          [v109 addObject:v46];

          if (v38 == 1)
          {

LABEL_32:
            long long v37 = obja;
            id v17 = v106;
LABEL_33:
            unint64_t v19 = 0x1E4F1C000uLL;
            goto LABEL_34;
          }
          uint64_t v38 = 1;
        }

        if (++v39 >= (unint64_t)[v12 count]) {
          goto LABEL_32;
        }
      }
    }
    unint64_t v47 = [v13 count];
    if (v47 >= 2) {
      uint64_t v48 = 2;
    }
    else {
      uint64_t v48 = v47;
    }
    if (v48)
    {
      id objb = v37;
      for (uint64_t i = 0; i != v48; ++i)
      {
        id v50 = [v13 objectAtIndexedSubscript:i];
        v51 = (void *)MEMORY[0x1E4FAE318];
        v52 = [v50 candidate];
        v53 = [v50 input];
        v54 = [v51 candidateWithCandidate:v52 forInput:v53];
        [v109 addObject:v54];
      }
      id v17 = v106;
      long long v37 = objb;
      goto LABEL_33;
    }
LABEL_34:
    if (!_os_feature_enabled_impl() || ![v17 shouldOfferHideMyEmail])
    {
      uint64_t v59 = 0;
      goto LABEL_48;
    }
    int v55 = +[TIAppAutofillManager sharedInstance];
    int v56 = [v55 secureCandidateRenderer];

    if (v56)
    {
      int v57 = +[TIAppAutofillManager sharedInstance];
      id v58 = [v57 secureCandidateRenderer];
      uint64_t v59 = [v58 localizedStringForKey:@"SAFARI_HIDE_MY_EMAIL_SUGGESTION"];

      if (v59 && [v59 length])
      {
LABEL_47:
        [v17 setHideMyEmailLocalizedText:v59];
        v63 = (void *)[objc_alloc(MEMORY[0x1E4FAE508]) initWithSecureHeader:&stru_1F3F7A998 secureContent:v59 secureFormattedContent:v59 input:&stru_1F3F7A998 truncationSentinel:0];
        uint64_t v64 = (void *)[v37 mutableCopy];
        [v64 removeLastObject];
        [v64 addObject:v63];

        long long v37 = v64;
LABEL_48:
        id v65 = objc_msgSend(*(id *)(v19 + 2632), "arrayWithCapacity:", objc_msgSend(v37, "count"));
        id v66 = [v14 slotIDsFromSecureCandidates:v37 withRenderTraits:v17 outWidths:v65];
        int v67 = _os_feature_enabled_impl();
        obuint64_t j = v37;
        uint64_t v104 = v59;
        if (v59)
        {
          if (v67)
          {
            if ([v106 shouldOfferHideMyEmail])
            {
              uint64_t v68 = [v37 count];
              if (v68 == [v66 count])
              {
                v69 = [v37 lastObject];
                BOOL v70 = [v69 secureContent];
                int v71 = [v70 isEqualToString:v59];

                if (v71)
                {
                  uint64_t v72 = objc_msgSend(v66, "subarrayWithRange:", 0, 1);

                  id v66 = (void *)v72;
                }
              }
            }
          }
        }
        if ([v66 count])
        {
          unint64_t v73 = 0;
          v108 = v65;
          do
          {
            v74 = [v12 objectAtIndexedSubscript:v73];
            v75 = [v74 trigger];
            if ([v75 triggerSourceType] == 3)
            {
              uint64_t v76 = 3;
            }
            else
            {
              id v77 = [v12 objectAtIndexedSubscript:v73];
              id v78 = [v77 trigger];
              int v79 = [v78 triggerSourceType];
              if (v79 == 2) {
                uint64_t v76 = 2;
              }
              else {
                uint64_t v76 = v79 == 1;
              }
            }
            uint64_t v80 = [TIProactiveTrigger alloc];
            uint64_t v81 = [v12 objectAtIndexedSubscript:v73];
            uint64_t v82 = [v81 trigger];
            v83 = [v82 attributedString];
            dispatch_block_t v84 = [(TIProactiveTrigger *)v80 initWithSourceType:v76 attributes:v83];

            id v85 = [v66 objectAtIndexedSubscript:v73];
            uint64_t v86 = [v85 unsignedIntegerValue];

            v87 = [MEMORY[0x1E4FAE318] secureCandidateForInput:&stru_1F3F7A998 slotID:v86];
            if ([v65 count] <= v73)
            {
              [v87 setSecureCandidateWidth:0.0];
            }
            else
            {
              v88 = [v65 objectAtIndexedSubscript:v73];
              [v88 floatValue];
              [v87 setSecureCandidateWidth:v89];
            }
            id v90 = [obj objectAtIndexedSubscript:v73];
            objc_msgSend(v87, "setSecureCandidateHash:", objc_msgSend(v90, "candidateHash"));

            [v87 setIndexForMetrics:v73];
            [v109 addObject:v87];
            id v91 = objc_alloc(MEMORY[0x1E4FAE500]);
            v92 = [obj objectAtIndexedSubscript:v73];
            uint64_t v93 = [v92 secureFormattedContent];
            uint64_t v94 = [v12 objectAtIndexedSubscript:v73];
            LOBYTE(v103) = 1;
            uint64_t v95 = (void *)[v91 initWithCandidate:v93 forInput:v110 rawInput:0 wordOriginFeedbackID:0 usageTrackingMask:0 sourceMask:0 secureContentCandidate:v103 proactiveTrigger:v84 proactivePredictedItem:v94];

            [v95 setIndexForMetrics:v73];
            v96 = [v12 objectAtIndexedSubscript:v73];
            objc_msgSend(v95, "setAgeForConnectionsMetrics:", objc_msgSend(v96, "predictionAge"));

            v97 = [v111 secureCandidateCache];
            id v98 = [NSNumber numberWithUnsignedInt:v86];
            [v97 setObject:v95 forKey:v98];

            uint64_t v99 = +[TIKeyboardSecureTouchManager sharedInstance];
            [v99 registerSlotID:v86];

            ++v73;
            id v65 = v108;
          }
          while (v73 < [v66 count]);
        }

        id v13 = v105;
        id v14 = v111;
        long long v20 = v109;
        goto LABEL_67;
      }
    }
    else
    {
      uint64_t v60 = TIProactiveQuickTypeOSLogFacility();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        id v102 = objc_msgSend(NSString, "stringWithFormat:", @"%s self.secureCandidateRenderer is nil", "-[TIProactiveQuickTypeManager renderItems:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:]");
        *(_DWORD *)long long buf = 138412290;
        v120 = v102;
        _os_log_debug_impl(&dword_1E3F0E000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      uint64_t v59 = 0;
    }
    uint64_t v61 = TIProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      id v101 = objc_msgSend(NSString, "stringWithFormat:", @"%s Localized Hide My Email text is nil", "-[TIProactiveQuickTypeManager renderItems:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:]");
      *(_DWORD *)long long buf = 138412290;
      v120 = v101;
      _os_log_debug_impl(&dword_1E3F0E000, v61, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    id v62 = (id)*MEMORY[0x1E4FAE9A8];

    uint64_t v59 = v62;
    goto LABEL_47;
  }
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  obuint64_t j = v12;
  uint64_t v21 = [obj countByEnumeratingWithState:&v115 objects:v121 count:16];
  if (!v21) {
    goto LABEL_68;
  }
  uint64_t v22 = v21;
  id v107 = v16;
  uint64_t v23 = *(void *)v116;
  while (2)
  {
    for (uint64_t j = 0; j != v22; ++j)
    {
      if (*(void *)v116 != v23) {
        objc_enumerationMutation(obj);
      }
      uint64_t v25 = *(void **)(*((void *)&v115 + 1) + 8 * j);
      uint64_t v26 = [v25 identifier];
      int v27 = [v26 isEqualToString:@"SmartReply"];

      if (!v27)
      {
        [v20 removeAllObjects];

        id v13 = v105;
        id v17 = v106;
        unint64_t v19 = 0x1E4F1C000;
        id v16 = v107;
        goto LABEL_12;
      }
      id v28 = objc_alloc(MEMORY[0x1E4FAE500]);
      id v29 = [v25 value];
      id v30 = [v25 label];
      char v31 = (void *)[v28 initWithCandidate:v29 responseKitCategory:v30];
      [v20 addObject:v31];
    }
    uint64_t v22 = [obj countByEnumeratingWithState:&v115 objects:v121 count:16];
    if (v22) {
      continue;
    }
    break;
  }
  id v13 = v105;
LABEL_67:
  id v17 = v106;
  id v18 = v110;
LABEL_68:

  return v20;
}

- (id)_makeQueue
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.TextInput.ProactiveQuickTypeManager", v2);

  return v3;
}

- (id)inputContextPredictionManager
{
  return self->_inputContextPredictionManager;
}

- (BOOL)usePQT2Flow
{
  return _os_feature_enabled_impl();
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[TIKeyboardActivityController sharedController];
  [v3 removeActivityObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TIProactiveQuickTypeManager;
  [(TIProactiveQuickTypeManager *)&v4 dealloc];
}

- (TIProactiveQuickTypeManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)TIProactiveQuickTypeManager;
  uint64_t v2 = [(TIProactiveQuickTypeManager *)&v12 init];
  dispatch_queue_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(TIProactiveQuickTypeManager *)v2 _makeQueue];
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F6F4C0] predictionManager];
    inputContextPredictionManager = v3->_inputContextPredictionManager;
    v3->_inputContextPredictionManager = (_ICPredictionManaging *)v6;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__TIProactiveQuickTypeManager_init__block_invoke;
    block[3] = &unk_1E6E2DE00;
    uint64_t v11 = v3;
    dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    TIDispatchAsync();
  }
  return v3;
}

void __35__TIProactiveQuickTypeManager_init__block_invoke(uint64_t a1)
{
  id v2 = +[TIKeyboardActivityController sharedController];
  [v2 addActivityObserver:*(void *)(a1 + 32)];
}

+ (id)buildSecureCandidateFrom:(id)a3 withSecureCandidateRenderer:(id)a4 input:(id)a5
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v82 = a5;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  id v85 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v7 count] >= 2)
  {
    unint64_t v9 = 1;
    do
    {
      unsigned int v10 = NSString;
      uint64_t v11 = [v7 objectAtIndexedSubscript:v9 - 1];
      objc_super v12 = [v11 identifier];
      id v13 = [v7 objectAtIndexedSubscript:v9];
      id v14 = [v13 identifier];
      LODWORD(v10) = [v10 _string:v12 matchesString:v14];

      int v83 = (int)v10;
      if ((v10 & 1) == 0) {
        break;
      }
      ++v9;
    }
    while (v9 < [v7 count]);
  }
  else
  {
    int v83 = 1;
  }
  v87 = [v8 _truncationSentinel];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  obuint64_t j = v7;
  uint64_t v84 = [obj countByEnumeratingWithState:&v95 objects:v101 count:16];
  if (v84)
  {
    uint64_t v81 = *(void *)v96;
    id v80 = v8;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v96 != v81) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v95 + 1) + 8 * v15);
        id v17 = [v16 operationData];
        id v18 = &stru_1F3F7A998;
        if (!v17)
        {
          id v18 = [v16 value];
        }

        uint64_t v19 = [v16 label];
        if (v19)
        {
          long long v20 = (void *)v19;
          int v21 = [v16 shouldAggregate];

          if (v21)
          {
            uint64_t v22 = [v8 localizedStringForKey:@"LOCATION_AGGREGATED_NAME_AND_ADDRESS"];
            uint64_t v23 = NSString;
            id v94 = 0;
            uint64_t v24 = [v16 label];
            uint64_t v25 = [v16 value];
            uint64_t v26 = [v23 stringWithValidatedFormat:v22, @"%@%@", &v94, v24, v25 validFormatSpecifiers error];
            id v27 = v94;
            id v28 = &stru_1F3F7A998;
            if (v26) {
              id v28 = v26;
            }
            id v29 = v28;

            if (v27)
            {
              if (TICanLogMessageAtLevel_onceToken != -1) {
                dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
              }
              id v30 = TIOSLogFacility();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                v75 = [NSString stringWithFormat:@"%s ProactiveQuickType:TI: ERROR: invalid localized format for key LOCATION_AGGREGATED_NAME_AND_ADDRESS: %@", "+[TIProactiveQuickTypeManager buildSecureCandidateFrom:withSecureCandidateRenderer:input:]", v27];
                *(_DWORD *)long long buf = 138412290;
                id v100 = v75;
                _os_log_debug_impl(&dword_1E3F0E000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }

            id v18 = v29;
          }
        }
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          char v31 = TIOSLogFacility();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v72 = NSString;
            unint64_t v73 = [v16 value];
            v74 = [v72 stringWithFormat:@"%s ProactiveQuickType:TI: Rendering results with value= %@", "+[TIProactiveQuickTypeManager buildSecureCandidateFrom:withSecureCandidateRenderer:input:]", v73];
            *(_DWORD *)long long buf = 138412290;
            id v100 = v74;
            _os_log_debug_impl(&dword_1E3F0E000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
        id v90 = [v8 localizedStringForKey:@"PARENTHESIZED_LABEL"];
        float v89 = [v8 localizedStringForKey:@"APP_CONNECTION_ATTRIBUTION"];
        if ((unint64_t)[obj count] > 1) {
          int v32 = v83;
        }
        else {
          int v32 = 0;
        }
        char v33 = [v16 flags];
        int v34 = [v16 label];
        if ([v34 length])
        {
          id v35 = [v16 label];
          char v36 = [v35 isEqualToString:@"unlabeled"];
        }
        else
        {
          char v36 = 1;
        }

        long long v37 = [v16 originatingBundleID];

        if (!v37)
        {
          uint64_t v39 = 0;
LABEL_48:
          v88 = 0;
          goto LABEL_49;
        }
        uint64_t v38 = [v16 originatingBundleID];
        uint64_t v39 = [v8 localizedApplicationNameWithBundleIdentifier:v38];

        if (!v39) {
          goto LABEL_48;
        }
        id v93 = 0;
        long long v40 = [NSString stringWithValidatedFormat:v89, @"%@", &v93, v39 validFormatSpecifiers error];
        id v41 = v93;
        int v42 = &stru_1F3F7A998;
        if (v40) {
          int v42 = v40;
        }
        v88 = v42;

        if (v41)
        {
          if (TICanLogMessageAtLevel_onceToken != -1) {
            dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
          }
          id v43 = TIOSLogFacility();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            int v79 = [NSString stringWithFormat:@"%s ProactiveQuickType:TI: ERROR: invalid localized format for key APP_CONNECTION_ATTRIBUTION: %@", "+[TIProactiveQuickTypeManager buildSecureCandidateFrom:withSecureCandidateRenderer:input:]", v41];
            *(_DWORD *)long long buf = 138412290;
            id v100 = v79;
            _os_log_debug_impl(&dword_1E3F0E000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }

LABEL_49:
        if (((v33 & 1) == 0) & ~v32 | v36 & 1)
        {
          BOOL v44 = 0;
          id v45 = 0;
        }
        else
        {
          int v55 = [v16 label];
          id v45 = v55;
          BOOL v44 = v55 != 0;
          if ((v33 & 1) != 0 && v55)
          {
            v53 = v55;
            id v45 = v53;
            goto LABEL_73;
          }
        }
        uint64_t v46 = [v16 name];

        if (v46 && v44)
        {
          unint64_t v47 = NSString;
          id v92 = 0;
          uint64_t v48 = [v16 name];
          v49 = [v48 stringByAppendingString:v87];
          id v50 = [v47 stringWithValidatedFormat:v90, @"%@%@", &v92, v49, v45 validFormatSpecifiers error];
          id v51 = v92;
          v52 = &stru_1F3F7A998;
          if (v50) {
            v52 = v50;
          }
          v53 = v52;

          if (v51)
          {
            if (TICanLogMessageAtLevel_onceToken != -1) {
              dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
            }
            v54 = TIOSLogFacility();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_93;
            }
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        int v56 = [v16 label];

        if (v56 && v39)
        {
          int v57 = NSString;
          id v91 = 0;
          id v58 = [v16 label];
          uint64_t v59 = [v58 stringByAppendingString:v87];
          uint64_t v60 = [v57 stringWithValidatedFormat:v90, @"%@%@", &v91, v59, v88 validFormatSpecifiers error];
          id v51 = v91;
          uint64_t v61 = &stru_1F3F7A998;
          if (v60) {
            uint64_t v61 = v60;
          }
          v53 = v61;

          if (v51)
          {
            if (TICanLogMessageAtLevel_onceToken != -1) {
              dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
            }
            v54 = TIOSLogFacility();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
LABEL_93:
              uint64_t v76 = [NSString stringWithFormat:@"%s ProactiveQuickType:TI: ERROR: invalid localized format for key PARENTHESIZED_LABEL: %@", "+[TIProactiveQuickTypeManager buildSecureCandidateFrom:withSecureCandidateRenderer:input:]", v51];
              *(_DWORD *)long long buf = 138412290;
              id v100 = v76;
              _os_log_debug_impl(&dword_1E3F0E000, v54, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
LABEL_71:
          }
LABEL_72:

          id v8 = v80;
LABEL_73:
          id v62 = [v16 value];
          int v63 = [(__CFString *)v53 isEqualToString:v62];

          if (!v63) {
            goto LABEL_75;
          }
          goto LABEL_74;
        }
        uint64_t v68 = [v16 label];
        if (v68 || !v39)
        {
        }
        else if (![v16 itemType])
        {
          v69 = v88;
          goto LABEL_90;
        }
        BOOL v70 = [v16 name];

        if (v70)
        {
          v69 = [v16 name];
        }
        else
        {
          int v71 = [v16 label];

          if (!v71)
          {
            v53 = 0;
            goto LABEL_74;
          }
          v69 = [v16 label];
        }
LABEL_90:
        v53 = v69;
        if (v69) {
          goto LABEL_73;
        }
LABEL_74:

        v53 = &stru_1F3F7A998;
LABEL_75:
        uint64_t v64 = [v16 value];
        if (([v16 flags] & 4) != 0)
        {
          uint64_t v65 = [v16 label];

          uint64_t v66 = [v16 name];

          v53 = (__CFString *)v65;
          uint64_t v64 = (void *)v66;
        }
        int v67 = (void *)[objc_alloc(MEMORY[0x1E4FAE508]) initWithSecureHeader:v53 secureContent:v64 secureFormattedContent:v18 input:v82 truncationSentinel:v87];
        if (([v85 containsObject:v67] & 1) == 0) {
          [v85 addObject:v67];
        }

        ++v15;
      }
      while (v84 != v15);
      uint64_t v77 = [obj countByEnumeratingWithState:&v95 objects:v101 count:16];
      uint64_t v84 = v77;
    }
    while (v77);
  }

  return v85;
}

+ (id)proactiveTriggerForTextContentType:(id)a3 withContextBeforeInput:(id)a4 autofillMode:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 length] | a5)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v9 setValue:@"triggerTypeConnections" forKey:*MEMORY[0x1E4F72330]];
    if ([v7 length]) {
      [v9 setValue:v7 forKey:@"textContentTypeTag"];
    }
    unsigned int v10 = [v8 stringByReplacingOccurrencesOfString:@"​" withString:&stru_1F3F7A998];

    if (_os_feature_enabled_impl())
    {
      if (v10)
      {
        uint64_t v11 = [v10 length];
        unint64_t v12 = a5 - 4;
        if (v12 <= 2)
        {
          if (v11)
          {
            if (![v7 length]) {
              [v9 setValue:**((void **)&unk_1E6E2AD40 + v12) forKey:@"textContentTypeTag"];
            }
            [v9 setValue:v10 forKey:@"contextBeforeInput"];
          }
        }
      }
    }
    id v13 = [[TIProactiveTrigger alloc] initWithSourceType:2 attributes:v9];
  }
  else
  {
    id v13 = 0;
    unsigned int v10 = v8;
  }

  return v13;
}

+ (id)proactiveTriggerForTextContentType:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v4 = TIOSLogFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        id v8 = [NSString stringWithFormat:@"%s ProactiveQuickType:TI: Creating a connections trigger for tagged text field: %@", "+[TIProactiveQuickTypeManager proactiveTriggerForTextContentType:]", v3];
        *(_DWORD *)long long buf = 138412290;
        unsigned int v10 = v8;
        _os_log_debug_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v5 setValue:@"triggerTypeConnections" forKey:*MEMORY[0x1E4F72330]];
    [v5 setValue:v3 forKey:@"textContentTypeTag"];
    uint64_t v6 = [[TIProactiveTrigger alloc] initWithSourceType:2 attributes:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken_6518 != -1) {
    dispatch_once(&singletonInstance_onceToken_6518, &__block_literal_global_6519);
  }
  id v2 = (void *)singletonInstance_singleton;

  return v2;
}

uint64_t __48__TIProactiveQuickTypeManager_singletonInstance__block_invoke()
{
  singletonInstance_singleton = objc_alloc_init(TIProactiveQuickTypeManager);

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedInstance
{
  if (__testingInstance_6521)
  {
    id v2 = (id)__testingInstance_6521;
  }
  else
  {
    id v2 = +[TIProactiveQuickTypeManager singletonInstance];
  }

  return v2;
}

- (id)getLastSuggestionTime
{
  return self->_lastSuggestionTime;
}

- (TIProactiveQuickTypeManager)initWithICManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIProactiveQuickTypeManager;
  uint64_t v6 = [(TIProactiveQuickTypeManager *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(TIProactiveQuickTypeManager *)v6 _makeQueue];
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v7->_inputContextPredictionManager, a3);
    unsigned int v10 = +[TIKeyboardActivityController sharedController];
    [v10 addActivityObserver:v7];
  }
  return v7;
}

+ (void)setSharedTIProactiveQuickTypeManager:(id)a3
{
  id v4 = a3;
  if ((id)__testingInstance_6521 != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&__testingInstance_6521, a3);
    id v4 = v5;
  }
}

@end