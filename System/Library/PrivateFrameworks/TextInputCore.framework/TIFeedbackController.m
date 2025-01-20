@interface TIFeedbackController
- (BOOL)currentPreferenceValue;
- (BOOL)feedbackFeatureEnabled;
- (BOOL)isFCSBuild;
- (BOOL)wasSurveySubmitted;
- (TIFeedbackController)init;
- (id)computeRandomizedTimeIntervalFromTimestamp:(id)a3;
- (id)currentInputModes;
- (void)assessAndScheduleRetry;
- (void)dispatchScheduledEventsWithDelegate:(id)a3 overrideSchedule:(BOOL)a4;
- (void)dispatchScheduledInitiationAndCompletionEventsImmediatelyWithDelegate:(id)a3;
- (void)dispatchScheduledInitiationAndTerminationEventsImmediatelyWithDelegate:(id)a3;
- (void)handleFeedbackActionsWithDelegate:(id)a3;
- (void)handleFeedbackStateCompletionPendingWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4;
- (void)handleFeedbackStateInitiatedWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4 isPreferenceEnabled:(BOOL)a5;
- (void)handleFeedbackStateNoneWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4;
- (void)handleFeedbackStateResponsePendingWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4;
- (void)handleFeedbackStateRetryPendingWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4;
- (void)initiateStudyWithInputModes:(id)a3 initialPreferenceValue:(BOOL)a4;
- (void)retrySurvey;
- (void)scheduleCompletionEvent;
- (void)scheduleInitiationEvent;
- (void)scheduleRetry;
- (void)scheduleSurveyRequestEvent;
- (void)setInitiationState;
- (void)setPreferenceValue:(BOOL)a3;
- (void)setTerminationStateWithValue:(int64_t)a3;
@end

@implementation TIFeedbackController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferenceName, 0);

  objc_storeStrong((id *)&self->_studyID, 0);
}

- (id)currentInputModes
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23426;
  v11 = __Block_byref_object_dispose__23427;
  id v12 = 0;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v2 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
    uint64_t v3 = [v2 enabledInputModeIdentifiers];
    v4 = (void *)v8[5];
    v8[5] = v3;
  }
  else
  {
    TIDispatchSync();
  }
  id v5 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v5;
}

void __41__TIFeedbackController_currentInputModes__block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
  uint64_t v2 = [v5 enabledInputModeIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setPreferenceValue:(BOOL)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4FAE3D8], "sharedPreferencesController", a3);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [v4 setValue:MEMORY[0x1E4F1CC38] forPreferenceKey:self->_preferenceName];
  }
  else
  {
    id v5 = v4;
    TIDispatchSync();
  }
}

uint64_t __43__TIFeedbackController_setPreferenceValue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:MEMORY[0x1E4F1CC38] forPreferenceKey:*(void *)(*(void *)(a1 + 40) + 16)];
}

- (BOOL)currentPreferenceValue
{
  uint64_t v3 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  LOBYTE(self) = [v3 BOOLForPreferenceKey:self->_preferenceName];

  return (char)self;
}

- (BOOL)feedbackFeatureEnabled
{
  if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
  }
  if (!TI_IS_INTERNAL_INSTALL::is_internal_install) {
    return 1;
  }
  uint64_t v2 = (void *)MEMORY[0x1E4FAE2B0];

  return [v2 isFeatureEnabledForInternalBuilds];
}

- (id)computeRandomizedTimeIntervalFromTimestamp:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4FAE2B0] shouldPublishCAEventsImmediately])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [v3 dateByAddingTimeInterval:(double)arc4random() / 4294967300.0 * 432000.0 + 0.0];
  }
  id v5 = v4;

  return v5;
}

- (void)dispatchScheduledInitiationAndTerminationEventsImmediatelyWithDelegate:(id)a3
{
  id v5 = a3;
  id v4 = [MEMORY[0x1E4FAE2B0] getInitiationEventTimestamp];
  if (v4)
  {
    [v5 sendInitiationEventUsingStudyDataFromFeedbackController:self];
    [MEMORY[0x1E4FAE2B0] removeInitiationEventTimestamp];
  }
  [v5 sendTerminationEventUsingStudyDataFromFeedbackController:self];
}

- (void)dispatchScheduledInitiationAndCompletionEventsImmediatelyWithDelegate:(id)a3
{
  id v5 = a3;
  id v4 = [MEMORY[0x1E4FAE2B0] getInitiationEventTimestamp];
  if (v4)
  {
    [v5 sendInitiationEventUsingStudyDataFromFeedbackController:self];
    [MEMORY[0x1E4FAE2B0] removeInitiationEventTimestamp];
  }
  [v5 sendCompletionEventUsingStudyDataFromFeedbackController:self];
  [MEMORY[0x1E4FAE2B0] removeCompletionEventTimestamp];
}

- (void)dispatchScheduledEventsWithDelegate:(id)a3 overrideSchedule:(BOOL)a4
{
  BOOL v4 = a4;
  id v16 = a3;
  v6 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v7 = [MEMORY[0x1E4FAE2B0] getInitiationEventTimestamp];
  v8 = v7;
  if (v7)
  {
    if ([v7 compare:v6] == -1 || v4)
    {
      [v16 sendInitiationEventUsingStudyDataFromFeedbackController:self];
      [MEMORY[0x1E4FAE2B0] removeInitiationEventTimestamp];
    }
  }
  v10 = [MEMORY[0x1E4FAE2B0] getRequestSurveyEventTimestamp];
  v11 = v10;
  if (v10)
  {
    if ([v10 compare:v6] == -1 || v4)
    {
      [v16 sendRequestSurveyEventUsingStudyDataFromFeedbackController:self];
      [MEMORY[0x1E4FAE2B0] removeRequestSurveyEventTimestamp];
    }
  }
  v13 = [MEMORY[0x1E4FAE2B0] getCompletionEventTimestamp];
  v14 = v13;
  if (v13)
  {
    if ([v13 compare:v6] == -1 || v4)
    {
      [v16 sendCompletionEventUsingStudyDataFromFeedbackController:self];
      [MEMORY[0x1E4FAE2B0] removeCompletionEventTimestamp];
    }
  }
}

- (void)scheduleCompletionEvent
{
  id v3 = [MEMORY[0x1E4FAE2B0] getFinalTimestamp];
  id v4 = [(TIFeedbackController *)self computeRandomizedTimeIntervalFromTimestamp:v3];

  [MEMORY[0x1E4FAE2B0] setCompletionEventTimestamp:v4];
}

- (void)scheduleSurveyRequestEvent
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(TIFeedbackController *)self computeRandomizedTimeIntervalFromTimestamp:v3];

  [MEMORY[0x1E4FAE2B0] setRequestSurveyEventTimestamp:v4];
}

- (void)scheduleInitiationEvent
{
  id v3 = [MEMORY[0x1E4FAE2B0] getInitialTimestamp];
  id v4 = [(TIFeedbackController *)self computeRandomizedTimeIntervalFromTimestamp:v3];

  [MEMORY[0x1E4FAE2B0] setInitiationEventTimestamp:v4];
}

- (BOOL)wasSurveySubmitted
{
  uint64_t v2 = [MEMORY[0x1E4FAE2B0] getSurveyOutcome];
  return v2 == 4 || v2 == 7;
}

- (void)setTerminationStateWithValue:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4FAE2B0], "setFeedbackState:");
  id v5 = (void *)MEMORY[0x1E4FAE2B0];
  v6 = [(TIFeedbackController *)self currentInputModes];
  [v5 setFinalInputModes:v6];

  uint64_t v7 = (void *)MEMORY[0x1E4FAE2B0];
  v8 = [MEMORY[0x1E4F1C9C8] now];
  [v7 setFinalTimestamp:v8];

  objc_msgSend(MEMORY[0x1E4FAE2B0], "setFinalPreferenceValue:", -[TIFeedbackController currentPreferenceValue](self, "currentPreferenceValue"));
  if (IXACanLogMessageAtLevel())
  {
    uint64_t v9 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = [NSString stringWithFormat:@"%s Feedback %@: set termination state with value:%ld", "-[TIFeedbackController setTerminationStateWithValue:]", self->_studyID, a3];
      *(_DWORD *)buf = 138412290;
      id v12 = v10;
      _os_log_debug_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (void)initiateStudyWithInputModes:(id)a3 initialPreferenceValue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4FAE2B0];
  id v7 = a3;
  [v6 setFeedbackState:2];
  [MEMORY[0x1E4FAE2B0] setInitialInputModes:v7];

  v8 = (void *)MEMORY[0x1E4FAE2B0];
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
  [v8 setInitialTimestamp:v9];

  [MEMORY[0x1E4FAE2B0] setInitialPreferenceValue:v4];
  v10 = (void *)MEMORY[0x1E4FAE2B0];
  v11 = [MEMORY[0x1E4FAE2B0] getSupportedLangRegion];
  [v10 setStudyLanguageAndRegion:v11];

  if (IXACanLogMessageAtLevel())
  {
    id v12 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = [NSString stringWithFormat:@"%s Feedback %@: set initiation state", "-[TIFeedbackController initiateStudyWithInputModes:initialPreferenceValue:]", self->_studyID];
      *(_DWORD *)buf = 138412290;
      v15 = v13;
      _os_log_debug_impl(&dword_1E3F0E000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (void)setInitiationState
{
  BOOL v3 = [(TIFeedbackController *)self currentPreferenceValue];
  if (!v3) {
    [(TIFeedbackController *)self setPreferenceValue:1];
  }
  id v4 = [(TIFeedbackController *)self currentInputModes];
  [(TIFeedbackController *)self initiateStudyWithInputModes:v4 initialPreferenceValue:v3];
}

- (void)handleFeedbackActionsWithDelegate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(TIFeedbackController *)self isFCSBuild])
  {
    id v5 = [MEMORY[0x1E4FAE2B0] getStudyEnrollment];
    if (![v5 length]
      && [MEMORY[0x1E4FAE2B0] isStudyForFCS]
      && [MEMORY[0x1E4FAE2B0] isEligibleDevice])
    {
      if (![(TIFeedbackController *)self currentPreferenceValue]) {
        [(TIFeedbackController *)self setPreferenceValue:1];
      }
      [MEMORY[0x1E4FAE2B0] setStudyEnrollment];
    }
LABEL_23:
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4FAE2B0] isEligibleDevice];
    uint64_t v7 = [MEMORY[0x1E4FAE2B0] getFeedbackState];
    BOOL v8 = [(TIFeedbackController *)self currentPreferenceValue];
    if ([(TIFeedbackController *)self feedbackFeatureEnabled])
    {
      if (!KeyboardSettingsFeedbackLibraryCore_frameworkLibrary)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v14 = __KeyboardSettingsFeedbackLibraryCore_block_invoke;
        v15 = &__block_descriptor_40_e5_v8__0l;
        uint64_t v16 = 0;
        long long v17 = xmmword_1E6E2E268;
        uint64_t v18 = 0;
        KeyboardSettingsFeedbackLibraryCore_frameworkLibrary = _sl_dlopen();
      }
      BOOL v9 = KeyboardSettingsFeedbackLibraryCore_frameworkLibrary != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
    if (IXACanLogMessageAtLevel())
    {
      v10 = IXAFeedbackLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = [NSString stringWithFormat:@"%s Feedback %@: enabled: %ld, eligible: %ld, state: %ld, preferenceEnabled: %ld", "-[TIFeedbackController handleFeedbackActionsWithDelegate:]", self->_studyID, v9, v6, v7, v8];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (v9)
    {
      [(TIFeedbackController *)self dispatchScheduledEventsWithDelegate:v4 overrideSchedule:0];
      switch(v7)
      {
        case 0:
          [(TIFeedbackController *)self handleFeedbackStateNoneWithDelegate:v4 isEligibleDevice:v6];
          break;
        case 2:
          [(TIFeedbackController *)self handleFeedbackStateInitiatedWithDelegate:v4 isEligibleDevice:v6 isPreferenceEnabled:v8];
          break;
        case 3:
          [(TIFeedbackController *)self handleFeedbackStateCompletionPendingWithDelegate:v4 isEligibleDevice:v6];
          break;
        case 8:
          [(TIFeedbackController *)self handleFeedbackStateRetryPendingWithDelegate:v4 isEligibleDevice:v6];
          break;
        case 9:
          [(TIFeedbackController *)self handleFeedbackStateResponsePendingWithDelegate:v4 isEligibleDevice:v6];
          break;
        default:
          if (IXACanLogMessageAtLevel())
          {
            id v5 = IXASessionDetailsLogFacility();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
            {
              id v12 = [NSString stringWithFormat:@"%s Feedback %@: action: none", "-[TIFeedbackController handleFeedbackActionsWithDelegate:]", self->_studyID];
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v12;
              _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
            }
            goto LABEL_23;
          }
          break;
      }
    }
  }
}

- (BOOL)isFCSBuild
{
  if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
  }
  return !TI_IS_INTERNAL_INSTALL::is_internal_install
      || ([MEMORY[0x1E4FAE2B0] isFeatureEnabledForInternalBuilds] & 1) == 0;
}

- (void)handleFeedbackStateResponsePendingWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4FAE2B0], "getFormIdentifier", a3, a4);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__TIFeedbackController_handleFeedbackStateResponsePendingWithDelegate_isEligibleDevice___block_invoke;
  v6[3] = &unk_1E6E2E1A8;
  v6[4] = self;
  [MEMORY[0x1E4F61958] fetchCountsForFormWithIdentifier:v5 completion:v6];
}

void __88__TIFeedbackController_handleFeedbackStateResponsePendingWithDelegate_isEligibleDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (IXACanLogMessageAtLevel())
    {
      uint64_t v7 = IXAFeedbackLogFacility();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
LABEL_4:

        goto LABEL_14;
      }
      id v12 = [NSString stringWithFormat:@"%s Feedback %@: error getting response from feedback service: %@", "-[TIFeedbackController handleFeedbackStateResponsePendingWithDelegate:isEligibleDevice:]_block_invoke", *(void *)(*(void *)(a1 + 32) + 8), v6];
      *(_DWORD *)long long buf = 138412290;
      v15 = v12;
LABEL_16:
      _os_log_debug_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      goto LABEL_4;
    }
  }
  else
  {
    BOOL v8 = [v5 feedbackFiled];
    uint64_t v9 = [v8 count];

    int v10 = IXACanLogMessageAtLevel();
    if (!v9)
    {
      if (!v10) {
        goto LABEL_14;
      }
      uint64_t v7 = IXAFeedbackLogFacility();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_4;
      }
      id v12 = [NSString stringWithFormat:@"%s Feedback %@: retry is is still pending", "-[TIFeedbackController handleFeedbackStateResponsePendingWithDelegate:isEligibleDevice:]_block_invoke", *(void *)(*(void *)(a1 + 32) + 8)];
      *(_DWORD *)long long buf = 138412290;
      v15 = v12;
      goto LABEL_16;
    }
    if (v10)
    {
      v11 = IXAFeedbackLogFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = [NSString stringWithFormat:@"%s Feedback %@: survey filed: complete", "-[TIFeedbackController handleFeedbackStateResponsePendingWithDelegate:isEligibleDevice:]_block_invoke", *(void *)(*(void *)(a1 + 32) + 8)];
        *(_DWORD *)long long buf = 138412290;
        v15 = v13;
        _os_log_debug_impl(&dword_1E3F0E000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [MEMORY[0x1E4FAE2B0] setFeedbackState:4];
    [*(id *)(a1 + 32) scheduleCompletionEvent];
  }
LABEL_14:
}

- (void)handleFeedbackStateRetryPendingWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [MEMORY[0x1E4FAE2B0] getRetryTimestamp];
  if ([v6 compare:v5] != -1) {
    [(TIFeedbackController *)self retrySurvey];
  }
}

- (void)retrySurvey
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4FAE2B0] getFormIdentifier];
  if (IXACanLogMessageAtLevel())
  {
    id v4 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [NSString stringWithFormat:@"%s Feedback %@: retrying survey: %@", "-[TIFeedbackController retrySurvey]", self->_studyID, v3];
      *(_DWORD *)long long buf = 138412290;
      v11 = v7;
      _os_log_debug_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  id v5 = (void *)MEMORY[0x1E4F61958];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__TIFeedbackController_retrySurvey__block_invoke;
  v8[3] = &unk_1E6E2E1F8;
  v8[4] = self;
  id v9 = v3;
  id v6 = v3;
  [v5 fetchCountsForFormWithIdentifier:v6 completion:v8];
}

void __35__TIFeedbackController_retrySurvey__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (IXACanLogMessageAtLevel())
    {
      uint64_t v7 = IXAFeedbackLogFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v27 = [NSString stringWithFormat:@"%s Feedback %@: error getting response from feedback service: %@", "-[TIFeedbackController retrySurvey]_block_invoke", *(void *)(*(void *)(a1 + 32) + 8), v6];
        *(_DWORD *)long long buf = 138412290;
        v37 = v27;
        _os_log_debug_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    BOOL v8 = (void *)MEMORY[0x1E4FAE2B0];
    uint64_t v9 = 5;
LABEL_13:
    [v8 setFeedbackState:v9];
    [*(id *)(a1 + 32) scheduleCompletionEvent];
    goto LABEL_14;
  }
  int v10 = [v5 feedbackFiled];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    if (IXACanLogMessageAtLevel())
    {
      uint64_t v12 = IXAFeedbackLogFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v28 = [NSString stringWithFormat:@"%s Feedback %@: survey filed: complete", "-[TIFeedbackController retrySurvey]_block_invoke", *(void *)(*(void *)(a1 + 32) + 8)];
        *(_DWORD *)long long buf = 138412290;
        v37 = v28;
        _os_log_debug_impl(&dword_1E3F0E000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    BOOL v8 = (void *)MEMORY[0x1E4FAE2B0];
    uint64_t v9 = 4;
    goto LABEL_13;
  }
  uint64_t v13 = [v5 currentCampaign];

  if (v13 && IXACanLogMessageAtLevel())
  {
    v14 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v29 = [NSString stringWithFormat:@"%s Feedback %@: already running a campaign - maybe they cancelled and we can retry", "-[TIFeedbackController retrySurvey]_block_invoke", *(void *)(*(void *)(a1 + 32) + 8)];
      *(_DWORD *)long long buf = 138412290;
      v37 = v29;
      _os_log_debug_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F61960]) initWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v16 = [MEMORY[0x1E4FAE2B0] getFormMetadata];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v22 = [v16 objectForKey:v21];
        [v15 prefill:v21 answer:v22];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v18);
  }
  [v15 setAuthenticationMethod:1];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F61950]) initWithFeedbackForm:v15];
  id v24 = objc_alloc_init(MEMORY[0x1E4F61968]);
  v25 = [MEMORY[0x1E4F28B50] mainBundle];
  v26 = [v25 localizedStringForKey:@"Tell us why you turned off autocorrection" value:@"Will you provide more insights on autocorrection" table:0];
  [v24 setLocalizedPromptTitle:v26];

  [v24 setPromptStyle:2];
  [MEMORY[0x1E4FAE2B0] setFeedbackState:9];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __35__TIFeedbackController_retrySurvey__block_invoke_66;
  v30[3] = &unk_1E6E2E1D0;
  v30[4] = *(void *)(a1 + 32);
  [v23 collectFeedbackWithLaunchConfiguration:v24 completion:v30];

LABEL_14:
}

void __35__TIFeedbackController_retrySurvey__block_invoke_66(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = IXACanLogMessageAtLevel();
  if (v3)
  {
    if (v4)
    {
      id v5 = IXAFeedbackLogFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = [NSString stringWithFormat:@"%s Feedback %@: error launching retry survey: %@", "-[TIFeedbackController retrySurvey]_block_invoke", *(void *)(*(void *)(a1 + 32) + 8), v3];
        *(_DWORD *)long long buf = 138412290;
        int v10 = v7;
        _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [MEMORY[0x1E4FAE2B0] setFeedbackState:5];
    [*(id *)(a1 + 32) scheduleCompletionEvent];
  }
  else if (v4)
  {
    id v6 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      BOOL v8 = [NSString stringWithFormat:@"%s Feedback %@: retry survey sucessfully submitted", "-[TIFeedbackController retrySurvey]_block_invoke", *(void *)(*(void *)(a1 + 32) + 8)];
      *(_DWORD *)long long buf = 138412290;
      int v10 = v8;
      _os_log_debug_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (void)handleFeedbackStateCompletionPendingWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(TIFeedbackController *)self scheduleSurveyRequestEvent];
  uint64_t v7 = [MEMORY[0x1E4FAE2B0] getSurveyOutcome];
  uint64_t v8 = v7;
  if (a4)
  {
    switch(v7)
    {
      case 4:
        if (IXACanLogMessageAtLevel())
        {
          uint64_t v9 = IXAFeedbackLogFacility();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v18 = [NSString stringWithFormat:@"%s Feedback %@: survey outcome is submitted, device is eligible, will evaluate for plan retry if necessary", "-[TIFeedbackController handleFeedbackStateCompletionPendingWithDelegate:isEligibleDevice:]", self->_studyID];
            *(_DWORD *)long long buf = 138412290;
            v22 = v18;
            _os_log_debug_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
        [(TIFeedbackController *)self assessAndScheduleRetry];
        goto LABEL_30;
      case 5:
        if (!IXACanLogMessageAtLevel()) {
          goto LABEL_29;
        }
        v14 = IXAFeedbackLogFacility();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
        v15 = [NSString stringWithFormat:@"%s Feedback %@: survey outcome is connection error, will plan retry", "-[TIFeedbackController handleFeedbackStateCompletionPendingWithDelegate:isEligibleDevice:]", self->_studyID];
        *(_DWORD *)long long buf = 138412290;
        v22 = v15;
        goto LABEL_32;
      case 6:
        if (IXACanLogMessageAtLevel())
        {
          uint64_t v16 = IXAFeedbackLogFacility();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v20 = [NSString stringWithFormat:@"%s Feedback %@: survey outcome is state error, device is ineligble action: terminateInvalid", "-[TIFeedbackController handleFeedbackStateCompletionPendingWithDelegate:isEligibleDevice:]", self->_studyID];
            *(_DWORD *)long long buf = 138412290;
            v22 = v20;
            _os_log_debug_impl(&dword_1E3F0E000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
        goto LABEL_24;
      case 7:
        if (IXACanLogMessageAtLevel())
        {
          v14 = IXAFeedbackLogFacility();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v15 = [NSString stringWithFormat:@"%s Feedback %@: survey outcome is launch error, will plan retry", "-[TIFeedbackController handleFeedbackStateCompletionPendingWithDelegate:isEligibleDevice:]", self->_studyID];
            *(_DWORD *)long long buf = 138412290;
            v22 = v15;
LABEL_32:
            _os_log_debug_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
LABEL_28:
        }
LABEL_29:
        [(TIFeedbackController *)self scheduleRetry];
        goto LABEL_30;
      default:
        if (IXACanLogMessageAtLevel())
        {
          uint64_t v13 = IXAFeedbackLogFacility();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v19 = [NSString stringWithFormat:@"%s Feedback %@: survey outcome is unexpected as %ld: terminateInvalid", "-[TIFeedbackController handleFeedbackStateCompletionPendingWithDelegate:isEligibleDevice:]", self->_studyID, v8];
            *(_DWORD *)long long buf = 138412290;
            v22 = v19;
            _os_log_debug_impl(&dword_1E3F0E000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
LABEL_24:
        uint64_t v11 = self;
        uint64_t v12 = 5;
        break;
    }
  }
  else
  {
    if (IXACanLogMessageAtLevel())
    {
      int v10 = IXAFeedbackLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = [NSString stringWithFormat:@"%s Feedback %@: survey outcome is %ld, device is ineligble action: terminateIneligible", "-[TIFeedbackController handleFeedbackStateCompletionPendingWithDelegate:isEligibleDevice:]", self->_studyID, v8];
        *(_DWORD *)long long buf = 138412290;
        v22 = v17;
        _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    uint64_t v11 = self;
    uint64_t v12 = 6;
  }
  [(TIFeedbackController *)v11 setTerminationStateWithValue:v12];
  [(TIFeedbackController *)self dispatchScheduledInitiationAndTerminationEventsImmediatelyWithDelegate:v6];
LABEL_30:
}

- (void)scheduleRetry
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IXACanLogMessageAtLevel())
  {
    id v3 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [NSString stringWithFormat:@"%s Feedback %@: scheduling a retry", "-[TIFeedbackController scheduleRetry]", self->_studyID];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v9 = v7;
      _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  int v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v4 dateByAddingTimeInterval:86400.0];
  if ([MEMORY[0x1E4FAE2B0] shouldPublishCAEventsImmediately])
  {
    uint64_t v6 = [v4 dateByAddingTimeInterval:10.0];

    id v5 = (void *)v6;
  }
  [MEMORY[0x1E4FAE2B0] setRetryTimestamp:v5];
  [MEMORY[0x1E4FAE2B0] setFeedbackState:8];
}

- (void)assessAndScheduleRetry
{
  id v3 = [MEMORY[0x1E4FAE2B0] getFormIdentifier];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__TIFeedbackController_assessAndScheduleRetry__block_invoke;
  v4[3] = &unk_1E6E2E1A8;
  v4[4] = self;
  [MEMORY[0x1E4F61958] fetchCountsForFormWithIdentifier:v3 completion:v4];
}

void __46__TIFeedbackController_assessAndScheduleRetry__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!IXACanLogMessageAtLevel())
    {
LABEL_5:
      [*(id *)(a1 + 32) scheduleRetry];
      goto LABEL_12;
    }
    uint64_t v7 = IXAFeedbackLogFacility();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
LABEL_4:

      goto LABEL_5;
    }
    v14 = [NSString stringWithFormat:@"%s Feedback %@: error getting response from feedback service: %@", "-[TIFeedbackController assessAndScheduleRetry]_block_invoke", *(void *)(*(void *)(a1 + 32) + 8), v6];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v17 = v14;
LABEL_21:
    _os_log_debug_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    goto LABEL_4;
  }
  uint64_t v8 = [v5 feedbackFiled];
  uint64_t v9 = [v8 count];

  uint64_t v10 = [v5 declineCount];
  if (v9 < 1)
  {
    uint64_t v12 = v10;
    int v13 = IXACanLogMessageAtLevel();
    if (v12)
    {
      if (!v13) {
        goto LABEL_5;
      }
      uint64_t v7 = IXAFeedbackLogFacility();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_4;
      }
      v14 = [NSString stringWithFormat:@"%s Feedback %@: feedback declined!", "-[TIFeedbackController assessAndScheduleRetry]_block_invoke", *(void *)(*(void *)(a1 + 32) + 8)];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v14;
    }
    else
    {
      if (!v13) {
        goto LABEL_5;
      }
      uint64_t v7 = IXAFeedbackLogFacility();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_4;
      }
      v14 = [NSString stringWithFormat:@"%s Feedback %@: feedback not filed for some other reason", "-[TIFeedbackController assessAndScheduleRetry]_block_invoke", *(void *)(*(void *)(a1 + 32) + 8)];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v14;
    }
    goto LABEL_21;
  }
  if (IXACanLogMessageAtLevel())
  {
    uint64_t v11 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v15 = [NSString stringWithFormat:@"%s Feedback %@: survey filed: complete", "-[TIFeedbackController assessAndScheduleRetry]_block_invoke", *(void *)(*(void *)(a1 + 32) + 8)];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v15;
      _os_log_debug_impl(&dword_1E3F0E000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  [MEMORY[0x1E4FAE2B0] setFeedbackState:4];
  [*(id *)(a1 + 32) scheduleCompletionEvent];
LABEL_12:
}

- (void)handleFeedbackStateInitiatedWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4 isPreferenceEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v6)
  {
    if (IXACanLogMessageAtLevel())
    {
      uint64_t v10 = IXAFeedbackLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v14 = [NSString stringWithFormat:@"%s Feedback %@: action: terminateIneligible", "-[TIFeedbackController handleFeedbackStateInitiatedWithDelegate:isEligibleDevice:isPreferenceEnabled:]", self->_studyID];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v18 = v14;
        _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    uint64_t v11 = self;
    uint64_t v12 = 6;
    goto LABEL_18;
  }
  if (!v5)
  {
    if (IXACanLogMessageAtLevel())
    {
      int v13 = IXAFeedbackLogFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = [NSString stringWithFormat:@"%s Feedback %@: action: terminateInvalid", "-[TIFeedbackController handleFeedbackStateInitiatedWithDelegate:isEligibleDevice:isPreferenceEnabled:]", self->_studyID];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v18 = v16;
        _os_log_debug_impl(&dword_1E3F0E000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    uint64_t v11 = self;
    uint64_t v12 = 5;
LABEL_18:
    [(TIFeedbackController *)v11 setTerminationStateWithValue:v12];
    [(TIFeedbackController *)self dispatchScheduledInitiationAndTerminationEventsImmediatelyWithDelegate:v8];
    goto LABEL_19;
  }
  if (IXACanLogMessageAtLevel())
  {
    uint64_t v9 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v15 = [NSString stringWithFormat:@"%s Feedback %@: action: accumulateWordCounts", "-[TIFeedbackController handleFeedbackStateInitiatedWithDelegate:isEligibleDevice:isPreferenceEnabled:]", self->_studyID];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v18 = v15;
      _os_log_debug_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  [v8 accumulateWordCounts];
LABEL_19:
}

- (void)handleFeedbackStateNoneWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4)
  {
    if (IXACanLogMessageAtLevel())
    {
      uint64_t v7 = IXAFeedbackLogFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v8 = [NSString stringWithFormat:@"%s Feedback %@: action: initiate", "-[TIFeedbackController handleFeedbackStateNoneWithDelegate:isEligibleDevice:]", self->_studyID];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v10 = v8;
        _os_log_debug_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [v6 resetWordCounts];
    [(TIFeedbackController *)self setInitiationState];
    [(TIFeedbackController *)self scheduleInitiationEvent];
    [MEMORY[0x1E4FAE2B0] setStudyEnrollment];
  }
}

- (TIFeedbackController)init
{
  v8.receiver = self;
  v8.super_class = (Class)TIFeedbackController;
  uint64_t v2 = [(TIFeedbackController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FAE2B0] getStudyID];
    studyID = v2->_studyID;
    v2->_studyID = (NSString *)v3;

    uint64_t v5 = [MEMORY[0x1E4FAE2B0] getPreferenceKey];
    preferenceName = v2->_preferenceName;
    v2->_preferenceName = (NSString *)v5;
  }
  return v2;
}

@end