@interface _UISmartReplyFeedbackManager
+ (BOOL)candidateIsLongFormSmartReply:(id)a3;
+ (BOOL)candidateIsSmartReply:(id)a3;
+ (BOOL)showReportConcernUI;
- (BOOL)feedbackUIWasPresented;
- (BOOL)isLongFormCandidate;
- (BOOL)predictionsContainLongFormCandidates:(id)a3;
- (BOOL)predictionsContainSmartReplies:(id)a3;
- (BOOL)shouldShowSmartReplyFeedbackInputDashboardViewControllerWithKeyboardIsSplit:(BOOL)a3;
- (BOOL)smartReplyWasSelected;
- (BOOL)smartReplyWasShownOrSelected;
- (BOOL)willShowFeedbackUI;
- (NSArray)previouslyShownCandidates;
- (NSDate)reportFeedbackUIPresentedCalledTime;
- (NSString)analyticsSessionId;
- (NSString)selectedCandidateDescription;
- (NSTimer)predictionBarDebounceTimeIntervalTimer;
- (_UIKeyboardStateManager)keyboardStateManagerDelegate;
- (_UISmartReplyFeedbackManager)init;
- (_UISmartReplyFeedbackManager)initWithKeyboardStateManagerDelegate:(id)a3;
- (_UISmartReplyFeedbackManager)initWithoutBundleIdCheck;
- (double)predictionBarDebounceTimeInterval;
- (id)stringListFromPredictions:(id)a3;
- (unint64_t)state;
- (void)_sendAnalyticsForSignal:(id)a3 toChannel:(id)a4 withThreadId:(id)a5 payload:(id)a6;
- (void)composeFieldInFocusWithMailOrMsgThreadId:(id)a3;
- (void)inputModeWillChange;
- (void)predictionBarDebounceTimeIntervalExpired;
- (void)reportFeedbackUIPresented;
- (void)reportSmartRepliesConcern;
- (void)reportSmartRepliesFeedbackSignal:(id)a3;
- (void)reportSmartRepliesThumbsDown;
- (void)reportSmartRepliesThumbsUp;
- (void)reportWritingToolsPanelDismissed;
- (void)resetOnKeyboardCandidatesCleared;
- (void)resetSmartReplyFeedbackUIIfAlreadyShown;
- (void)resetStateIfNoSmartReplySelected;
- (void)resetWithDebug:(id)a3;
- (void)setAnalyticsSessionId:(id)a3;
- (void)setKeyboardStateManagerDelegate:(id)a3;
- (void)setPredictionBarDebounceTimeInterval:(double)a3;
- (void)setPredictionBarDebounceTimeIntervalTimer:(id)a3;
- (void)setPreviouslyShownCandidates:(id)a3;
- (void)setReportFeedbackUIPresentedCalledTime:(id)a3;
- (void)setSelectedCandidateDescription:(id)a3;
- (void)smartRepliesPresented;
- (void)updateCandidates:(id)a3;
- (void)userSelectedSmartReply:(id)a3 isLongForm:(BOOL)a4 withMailOrMsgThreadId:(id)a5;
@end

@implementation _UISmartReplyFeedbackManager

+ (BOOL)showReportConcernUI
{
  if (!os_variant_has_internal_diagnostics()) {
    return 1;
  }
  return _os_feature_enabled_impl();
}

- (_UISmartReplyFeedbackManager)initWithoutBundleIdCheck
{
  v6.receiver = self;
  v6.super_class = (Class)_UISmartReplyFeedbackManager;
  v2 = [(_UISmartReplyFeedbackManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    [(_UISmartReplyFeedbackManager *)v2 resetWithDebug:@"init"];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_inputModeWillChange name:@"UITextInputCurrentInputModeWillChangeNotification" object:0];
  }
  return v3;
}

- (_UISmartReplyFeedbackManager)init
{
  v3 = _UIMainBundleIdentifier();
  char v4 = [v3 isEqualToString:@"com.apple.MobileSMS"];
  double v5 = 0.75;
  if ((v4 & 1) != 0 || (int v6 = objc_msgSend(v3, "isEqualToString:", @"com.apple.mobilemail", 0.75), v5 = 1.0, v6))
  {
    [(_UISmartReplyFeedbackManager *)self setPredictionBarDebounceTimeInterval:v5];
    self = [(_UISmartReplyFeedbackManager *)self initWithoutBundleIdCheck];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_UISmartReplyFeedbackManager)initWithKeyboardStateManagerDelegate:(id)a3
{
  id v4 = a3;
  double v5 = [(_UISmartReplyFeedbackManager *)self init];
  int v6 = v5;
  if (v5) {
    [(_UISmartReplyFeedbackManager *)v5 setKeyboardStateManagerDelegate:v4];
  }

  return v6;
}

- (BOOL)smartReplyWasShownOrSelected
{
  return [(_UISmartReplyFeedbackManager *)self state] > 1;
}

- (BOOL)smartReplyWasSelected
{
  return [(_UISmartReplyFeedbackManager *)self state] > 2;
}

- (BOOL)feedbackUIWasPresented
{
  return [(_UISmartReplyFeedbackManager *)self state] > 6;
}

- (BOOL)shouldShowSmartReplyFeedbackInputDashboardViewControllerWithKeyboardIsSplit:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UISmartReplyFeedbackManager *)self state] < 3) {
    return 0;
  }
  if (![(_UISmartReplyFeedbackManager *)self isLongFormCandidate])
  {
    BOOL result = 1;
    if (!v3) {
      return result;
    }
    goto LABEL_7;
  }
  BOOL result = [(_UISmartReplyFeedbackManager *)self state] > 4;
  if (v3)
  {
LABEL_7:
    BOOL result = 0;
    self->_state = 7;
  }
  return result;
}

- (BOOL)willShowFeedbackUI
{
  return [(_UISmartReplyFeedbackManager *)self state] > 2;
}

- (void)resetSmartReplyFeedbackUIIfAlreadyShown
{
  if ([(_UISmartReplyFeedbackManager *)self state] >= 7)
  {
    [(_UISmartReplyFeedbackManager *)self resetWithDebug:@"resetSmartReplyFeedbackUIIfAlreadyShown"];
  }
}

+ (BOOL)candidateIsSmartReply:(id)a3
{
  return ((unint64_t)[a3 candidateProperty] >> 1) & 1;
}

+ (BOOL)candidateIsLongFormSmartReply:(id)a3
{
  return ((unint64_t)[a3 candidateProperty] >> 4) & 1;
}

- (void)composeFieldInFocusWithMailOrMsgThreadId:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  double v5 = (id *)getIASignalSmartRepliesComposeFieldInFocusSymbolLoc_ptr;
  uint64_t v14 = getIASignalSmartRepliesComposeFieldInFocusSymbolLoc_ptr;
  if (!getIASignalSmartRepliesComposeFieldInFocusSymbolLoc_ptr)
  {
    int v6 = InputAnalyticsLibrary_0();
    v12[3] = (uint64_t)dlsym(v6, "IASignalSmartRepliesComposeFieldInFocus");
    getIASignalSmartRepliesComposeFieldInFocusSymbolLoc_ptr = v12[3];
    double v5 = (id *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    id v7 = *v5;
    v8 = getIAChannelSmartReplies();
    [(_UISmartReplyFeedbackManager *)self _sendAnalyticsForSignal:v7 toChannel:v8 withThreadId:v4 payload:0];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = [NSString stringWithUTF8String:"NSString *getIASignalSmartRepliesComposeFieldInFocus(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"_UISmartReplyFeedbackManager.m", 30, @"%s", dlerror());

    __break(1u);
  }
}

- (id)stringListFromPredictions:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v5 = 0;
    do
    {
      int v6 = [v3 objectAtIndexedSubscript:v5];
      id v7 = [v6 label];
      v8 = (void *)[v7 copy];
      [v4 setObject:v8 atIndexedSubscript:v5];

      ++v5;
    }
    while (v5 < [v3 count]);
  }

  return v4;
}

- (BOOL)predictionsContainSmartReplies:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (+[_UISmartReplyFeedbackManager candidateIsSmartReply:](_UISmartReplyFeedbackManager, "candidateIsSmartReply:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)predictionsContainLongFormCandidates:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (+[_UISmartReplyFeedbackManager candidateIsLongFormSmartReply:](_UISmartReplyFeedbackManager, "candidateIsLongFormSmartReply:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)updateCandidates:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UISmartReplyFeedbackManager *)self state] >= 3
    && [(_UISmartReplyFeedbackManager *)self state] <= 7)
  {
    uint64_t v5 = UIFeedbackServiceLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "updateCandidates called, but awaiting feedback UI still. Ignoring update.", (uint8_t *)&v11, 2u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if ([(_UISmartReplyFeedbackManager *)self predictionsContainSmartReplies:v4])
  {
    uint64_t v5 = [(_UISmartReplyFeedbackManager *)self stringListFromPredictions:v4];
    int v6 = [(_UISmartReplyFeedbackManager *)self previouslyShownCandidates];
    int v7 = [v6 isEqualToArray:v5];

    if (v7)
    {
      long long v8 = UIFeedbackServiceLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_error_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "updateCandidates: Ignoring update due to identical candidates", (uint8_t *)&v11, 2u);
      }
    }
    else
    {
      [(_UISmartReplyFeedbackManager *)self setPreviouslyShownCandidates:v5];
      [(_UISmartReplyFeedbackManager *)self resetWithDebug:@"updateCandidates"];
      self->_isLongFormCandidate = [(_UISmartReplyFeedbackManager *)self predictionsContainLongFormCandidates:v4];
      long long v9 = UIFeedbackServiceLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        if (self->_isLongFormCandidate) {
          long long v10 = @"Found";
        }
        else {
          long long v10 = @"Didn't find";
        }
        int v11 = 138477827;
        v12 = v10;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_INFO, "%{private}@ long form candidates", (uint8_t *)&v11, 0xCu);
      }

      [(_UISmartReplyFeedbackManager *)self smartRepliesPresented];
    }
    goto LABEL_17;
  }
  [(_UISmartReplyFeedbackManager *)self resetStateIfNoSmartReplySelected];
LABEL_18:
}

- (void)smartRepliesPresented
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(_UISmartReplyFeedbackManager *)self state] == 1)
  {
    self->_state = 2;
  }
  else
  {
    id v3 = UIFeedbackServiceLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 134217984;
      unint64_t v6 = [(_UISmartReplyFeedbackManager *)self state];
      _os_log_error_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Unexpected state %lu in smartRepliesPresented", (uint8_t *)&v5, 0xCu);
    }
  }
  id v4 = UIFeedbackServiceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_INFO, "smartRepliesPresented", (uint8_t *)&v5, 2u);
  }
}

- (void)userSelectedSmartReply:(id)a3 isLongForm:(BOOL)a4 withMailOrMsgThreadId:(id)a5
{
  BOOL v6 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v8 = (__CFString *)a3;
  id v9 = a5;
  if ([(_UISmartReplyFeedbackManager *)self state] != 2)
  {
    long long v10 = UIFeedbackServiceLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = [(_UISmartReplyFeedbackManager *)self state];
      _os_log_error_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Unexpected state %lu in userSelectedSmartReply", buf, 0xCu);
    }
  }
  if ([(_UISmartReplyFeedbackManager *)self isLongFormCandidate] != v6)
  {
    int v11 = UIFeedbackServiceLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v30 = @"NO";
      if (v6) {
        v30 = @"YES";
      }
      *(_DWORD *)buf = 138477827;
      *(void *)&buf[4] = v30;
      _os_log_error_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Unexpected isLongForm %{private}@ in userSelectedSmartReply", buf, 0xCu);
    }
  }
  unint64_t v12 = 4;
  if (!v6) {
    unint64_t v12 = 5;
  }
  self->_state = v12;
  [(_UISmartReplyFeedbackManager *)self setSelectedCandidateDescription:v8];
  self->_isLongFormCandidate = v6;
  uint64_t v13 = [(_UISmartReplyFeedbackManager *)self keyboardStateManagerDelegate];
  [v13 updateAssistantView];

  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v14 = (id *)_MergedGlobals_1155;
  uint64_t v38 = _MergedGlobals_1155;
  if (!_MergedGlobals_1155)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getIASignalSmartRepliesIntentEngagedSymbolLoc_block_invoke;
    v42 = &unk_1E52D9900;
    v43 = &v35;
    v15 = InputAnalyticsLibrary_0();
    v16 = dlsym(v15, "IASignalSmartRepliesIntentEngaged");
    *(void *)(v43[1] + 24) = v16;
    _MergedGlobals_1155 = *(void *)(v43[1] + 24);
    uint64_t v14 = (id *)v36[3];
  }
  _Block_object_dispose(&v35, 8);
  if (!v14)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = [NSString stringWithUTF8String:"NSString *getIASignalSmartRepliesIntentEngaged(void)"];
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"_UISmartReplyFeedbackManager.m", 31, @"%s", dlerror());

    goto LABEL_28;
  }
  id v17 = *v14;
  v18 = getIAChannelSmartReplies();
  v19 = (void *)[v9 copy];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  v20 = (void **)qword_1EB261DC0;
  uint64_t v38 = qword_1EB261DC0;
  if (!qword_1EB261DC0)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getIAPayloadKeySmartRepliesSelectedIntentSymbolLoc_block_invoke;
    v42 = &unk_1E52D9900;
    v43 = &v35;
    v21 = InputAnalyticsLibrary_0();
    v22 = dlsym(v21, "IAPayloadKeySmartRepliesSelectedIntent");
    *(void *)(v43[1] + 24) = v22;
    qword_1EB261DC0 = *(void *)(v43[1] + 24);
    v20 = (void **)v36[3];
  }
  _Block_object_dispose(&v35, 8);
  if (!v20)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    v34 = [NSString stringWithUTF8String:"NSString *getIAPayloadKeySmartRepliesSelectedIntent(void)"];
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"_UISmartReplyFeedbackManager.m", 37, @"%s", dlerror());

LABEL_28:
    __break(1u);
  }
  v23 = *v20;
  v24 = @"None";
  if (v8) {
    v24 = v8;
  }
  v39 = *v20;
  v40 = v24;
  v25 = (void *)MEMORY[0x1E4F1C9E8];
  id v26 = v23;
  v27 = [v25 dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  [(_UISmartReplyFeedbackManager *)self _sendAnalyticsForSignal:v17 toChannel:v18 withThreadId:v19 payload:v27];

  v28 = UIFeedbackServiceLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = @"short form";
    if (v6) {
      v29 = @"long form";
    }
    *(_DWORD *)buf = 138478083;
    *(void *)&buf[4] = v29;
    *(_WORD *)&buf[12] = 2117;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_INFO, "userSelectedSmartReply %{private}@ '%{sensitive}@'", buf, 0x16u);
  }
}

- (void)reportWritingToolsPanelDismissed
{
  if ([(_UISmartReplyFeedbackManager *)self isLongFormCandidate])
  {
    if ([(_UISmartReplyFeedbackManager *)self state] <= 4) {
      self->_state = 5;
    }
    id v3 = UIFeedbackServiceLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_INFO, "reportWritingToolsPanelDismissed", v4, 2u);
    }
  }
}

- (void)reportFeedbackUIPresented
{
  if (![(_UISmartReplyFeedbackManager *)self isLongFormCandidate]
    || [(_UISmartReplyFeedbackManager *)self state] >= 5)
  {
    id v3 = [(_UISmartReplyFeedbackManager *)self reportFeedbackUIPresentedCalledTime];

    if (!v3)
    {
      id v4 = [MEMORY[0x1E4F1C9C8] date];
      [(_UISmartReplyFeedbackManager *)self setReportFeedbackUIPresentedCalledTime:v4];

      self->_state = 6;
      int v5 = (void *)MEMORY[0x1E4F1CB00];
      [(_UISmartReplyFeedbackManager *)self predictionBarDebounceTimeInterval];
      BOOL v6 = objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_predictionBarDebounceTimeIntervalExpired, 0, 0);
      [(_UISmartReplyFeedbackManager *)self setPredictionBarDebounceTimeIntervalTimer:v6];

      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2020000000;
      uint64_t v7 = (id *)getIASignalFeedbackServiceSmartRepliesFeedbackUIPresentedSymbolLoc_ptr;
      uint64_t v23 = getIASignalFeedbackServiceSmartRepliesFeedbackUIPresentedSymbolLoc_ptr;
      if (!getIASignalFeedbackServiceSmartRepliesFeedbackUIPresentedSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v16 = 3221225472;
        id v17 = __getIASignalFeedbackServiceSmartRepliesFeedbackUIPresentedSymbolLoc_block_invoke;
        v18 = &unk_1E52D9900;
        v19 = &v20;
        long long v8 = InputAnalyticsLibrary_0();
        v21[3] = (uint64_t)dlsym(v8, "IASignalFeedbackServiceSmartRepliesFeedbackUIPresented");
        getIASignalFeedbackServiceSmartRepliesFeedbackUIPresentedSymbolLoc_ptr = *(void *)(v19[1] + 24);
        uint64_t v7 = (id *)v21[3];
      }
      _Block_object_dispose(&v20, 8);
      if (v7)
      {
        id v9 = *v7;
        long long v10 = getIAChannelFeedbackService();
        int v11 = [(_UISmartReplyFeedbackManager *)self analyticsSessionId];
        [(_UISmartReplyFeedbackManager *)self _sendAnalyticsForSignal:v9 toChannel:v10 withThreadId:v11 payload:0];

        unint64_t v12 = UIFeedbackServiceLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_INFO, "reportFeedbackUIPresented", buf, 2u);
        }
      }
      else
      {
        uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v14 = [NSString stringWithUTF8String:"NSString *getIASignalFeedbackServiceSmartRepliesFeedbackUIPresented(void)"];
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"_UISmartReplyFeedbackManager.m", 35, @"%s", dlerror());

        __break(1u);
      }
    }
  }
}

- (void)predictionBarDebounceTimeIntervalExpired
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(_UISmartReplyFeedbackManager *)self state] == 6)
  {
    self->_state = 7;
    id v3 = UIFeedbackServiceLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      id v4 = "predictionBarDebounceTimeIntervalExpired";
LABEL_7:
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v7, 2u);
    }
  }
  else
  {
    unint64_t v5 = [(_UISmartReplyFeedbackManager *)self state];
    BOOL v6 = UIFeedbackServiceLog();
    id v3 = v6;
    if (v5 == 1)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v7) = 0;
        id v4 = "predictionBarDebounceTimeIntervalExpired, but was previously reset";
        goto LABEL_7;
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134217984;
      unint64_t v8 = [(_UISmartReplyFeedbackManager *)self state];
      _os_log_error_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Unexpected state %lu in predictionBarDebounceTimeIntervalExpired", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)inputModeWillChange
{
  id v3 = UIFeedbackServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_INFO, "inputModeWillChange", v4, 2u);
  }

  [(_UISmartReplyFeedbackManager *)self resetWithDebug:@"resetOnInputModeWillChange"];
}

- (void)reportSmartRepliesFeedbackSignal:(id)a3
{
  id v4 = a3;
  unint64_t v5 = getIAChannelFeedbackService();
  BOOL v6 = [(_UISmartReplyFeedbackManager *)self analyticsSessionId];
  [(_UISmartReplyFeedbackManager *)self _sendAnalyticsForSignal:v4 toChannel:v5 withThreadId:v6 payload:0];

  [(_UISmartReplyFeedbackManager *)self resetWithDebug:@"reportSmartRepliesFeedbackSignal"];
}

- (void)reportSmartRepliesConcern
{
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v3 = (void *)getIASignalFeedbackServiceLaunchSmartRepliesReportConcernSymbolLoc_ptr;
  uint64_t v10 = getIASignalFeedbackServiceLaunchSmartRepliesReportConcernSymbolLoc_ptr;
  if (!getIASignalFeedbackServiceLaunchSmartRepliesReportConcernSymbolLoc_ptr)
  {
    id v4 = InputAnalyticsLibrary_0();
    v8[3] = (uint64_t)dlsym(v4, "IASignalFeedbackServiceLaunchSmartRepliesReportConcern");
    getIASignalFeedbackServiceLaunchSmartRepliesReportConcernSymbolLoc_ptr = v8[3];
    id v3 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (v3)
  {
    [(_UISmartReplyFeedbackManager *)self reportSmartRepliesFeedbackSignal:*v3];
  }
  else
  {
    unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v6 = [NSString stringWithUTF8String:"NSString *getIASignalFeedbackServiceLaunchSmartRepliesReportConcern(void)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UISmartReplyFeedbackManager.m", 34, @"%s", dlerror());

    __break(1u);
  }
}

- (void)reportSmartRepliesThumbsUp
{
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v3 = (void *)getIASignalFeedbackServiceLaunchSmartRepliesThumbsUpSymbolLoc_ptr;
  uint64_t v10 = getIASignalFeedbackServiceLaunchSmartRepliesThumbsUpSymbolLoc_ptr;
  if (!getIASignalFeedbackServiceLaunchSmartRepliesThumbsUpSymbolLoc_ptr)
  {
    id v4 = InputAnalyticsLibrary_0();
    v8[3] = (uint64_t)dlsym(v4, "IASignalFeedbackServiceLaunchSmartRepliesThumbsUp");
    getIASignalFeedbackServiceLaunchSmartRepliesThumbsUpSymbolLoc_ptr = v8[3];
    id v3 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (v3)
  {
    [(_UISmartReplyFeedbackManager *)self reportSmartRepliesFeedbackSignal:*v3];
  }
  else
  {
    unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v6 = [NSString stringWithUTF8String:"NSString *getIASignalFeedbackServiceLaunchSmartRepliesThumbsUp(void)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UISmartReplyFeedbackManager.m", 32, @"%s", dlerror());

    __break(1u);
  }
}

- (void)reportSmartRepliesThumbsDown
{
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v3 = (void *)getIASignalFeedbackServiceLaunchSmartRepliesThumbsDownSymbolLoc_ptr;
  uint64_t v10 = getIASignalFeedbackServiceLaunchSmartRepliesThumbsDownSymbolLoc_ptr;
  if (!getIASignalFeedbackServiceLaunchSmartRepliesThumbsDownSymbolLoc_ptr)
  {
    id v4 = InputAnalyticsLibrary_0();
    v8[3] = (uint64_t)dlsym(v4, "IASignalFeedbackServiceLaunchSmartRepliesThumbsDown");
    getIASignalFeedbackServiceLaunchSmartRepliesThumbsDownSymbolLoc_ptr = v8[3];
    id v3 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (v3)
  {
    [(_UISmartReplyFeedbackManager *)self reportSmartRepliesFeedbackSignal:*v3];
  }
  else
  {
    unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v6 = [NSString stringWithUTF8String:"NSString *getIASignalFeedbackServiceLaunchSmartRepliesThumbsDown(void)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UISmartReplyFeedbackManager.m", 33, @"%s", dlerror());

    __break(1u);
  }
}

- (void)resetWithDebug:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UISmartReplyFeedbackManager *)self state] != 1)
  {
    unint64_t v5 = UIFeedbackServiceLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_INFO, "Resetting state (%{private}@)", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v6 = [(_UISmartReplyFeedbackManager *)self predictionBarDebounceTimeIntervalTimer];
    [(id)v6 invalidate];

    self->_state = 1;
    self->_isLongFormCandidate = 0;
    [(_UISmartReplyFeedbackManager *)self setPreviouslyShownCandidates:0];
    [(_UISmartReplyFeedbackManager *)self setSelectedCandidateDescription:0];
    uint64_t v7 = [(_UISmartReplyFeedbackManager *)self reportFeedbackUIPresentedCalledTime];
    LOBYTE(v6) = v7 == 0;

    if ((v6 & 1) == 0)
    {
      unint64_t v8 = UIFeedbackServiceLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_INFO, "Updating assistant view...", (uint8_t *)&buf, 2u);
      }

      [(_UISmartReplyFeedbackManager *)self setReportFeedbackUIPresentedCalledTime:0];
      uint64_t v9 = [(_UISmartReplyFeedbackManager *)self keyboardStateManagerDelegate];
      [v9 updateAssistantView];
    }
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v10 = (id *)getIASignalFeedbackServiceSmartRepliesFeedbackUIResetSymbolLoc_ptr;
    uint64_t v21 = getIASignalFeedbackServiceSmartRepliesFeedbackUIResetSymbolLoc_ptr;
    if (!getIASignalFeedbackServiceSmartRepliesFeedbackUIResetSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v23 = __getIASignalFeedbackServiceSmartRepliesFeedbackUIResetSymbolLoc_block_invoke;
      v24 = &unk_1E52D9900;
      v25 = &v18;
      int v11 = InputAnalyticsLibrary_0();
      unint64_t v12 = dlsym(v11, "IASignalFeedbackServiceSmartRepliesFeedbackUIReset");
      *(void *)(v25[1] + 24) = v12;
      getIASignalFeedbackServiceSmartRepliesFeedbackUIResetSymbolLoc_ptr = *(void *)(v25[1] + 24);
      uint64_t v10 = (id *)v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v10)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      id v17 = [NSString stringWithUTF8String:"NSString *getIASignalFeedbackServiceSmartRepliesFeedbackUIReset(void)"];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"_UISmartReplyFeedbackManager.m", 36, @"%s", dlerror());

      __break(1u);
    }
    id v13 = *v10;
    uint64_t v14 = getIAChannelFeedbackService();
    v15 = [(_UISmartReplyFeedbackManager *)self analyticsSessionId];
    [(_UISmartReplyFeedbackManager *)self _sendAnalyticsForSignal:v13 toChannel:v14 withThreadId:v15 payload:0];
  }
}

- (void)resetOnKeyboardCandidatesCleared
{
  if ([(_UISmartReplyFeedbackManager *)self isLongFormCandidate]
    && [(_UISmartReplyFeedbackManager *)self smartReplyWasSelected]
    && ![(_UISmartReplyFeedbackManager *)self feedbackUIWasPresented])
  {
    id v3 = UIFeedbackServiceLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_INFO, "resetOnKeyboardCandidatesCleared ignored", v4, 2u);
    }
  }
  else
  {
    [(_UISmartReplyFeedbackManager *)self resetWithDebug:@"resetOnKeyboardCandidatesCleared"];
  }
}

- (void)resetStateIfNoSmartReplySelected
{
  if ([(_UISmartReplyFeedbackManager *)self state] == 2)
  {
    [(_UISmartReplyFeedbackManager *)self resetWithDebug:@"resetStateIfNoSmartReplySelected"];
  }
}

- (void)_sendAnalyticsForSignal:(id)a3 toChannel:(id)a4 withThreadId:(id)a5 payload:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2050000000;
  uint64_t v14 = (void *)getIASignalAnalyticsClass_softClass_0;
  uint64_t v22 = getIASignalAnalyticsClass_softClass_0;
  if (!getIASignalAnalyticsClass_softClass_0)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v24 = __getIASignalAnalyticsClass_block_invoke_0;
    v25 = &unk_1E52D9900;
    uint64_t v26 = &v19;
    InputAnalyticsLibraryCore_1();
    Class Class = objc_getClass("IASignalAnalytics");
    *(void *)(v26[1] + 24) = Class;
    getIASignalAnalyticsClass_softClass_0 = *(void *)(v26[1] + 24);
    uint64_t v14 = (void *)v20[3];
  }
  id v16 = v14;
  _Block_object_dispose(&v19, 8);
  -[_UISmartReplyFeedbackManager setAnalyticsSessionId:](self, "setAnalyticsSessionId:", v12, v19);
  if (v16)
  {
    if (v12)
    {
      [v16 sendSignal:v10 toChannel:v11 withUniqueStringID:v12 withPayload:v13];
    }
    else
    {
      uint64_t v18 = UIFeedbackServiceLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138477827;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_error_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "msgOrMailThreadId is nil for signal %{private}@", (uint8_t *)&buf, 0xCu);
      }

      [v16 sendSignal:v10 toChannel:v11 withPayload:v13];
    }
  }
  else
  {
    id v17 = UIFeedbackServiceLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Could not soft link InputAnalytics", (uint8_t *)&buf, 2u);
    }
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (_UIKeyboardStateManager)keyboardStateManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardStateManagerDelegate);
  return (_UIKeyboardStateManager *)WeakRetained;
}

- (void)setKeyboardStateManagerDelegate:(id)a3
{
}

- (BOOL)isLongFormCandidate
{
  return self->_isLongFormCandidate;
}

- (NSString)analyticsSessionId
{
  return self->_analyticsSessionId;
}

- (void)setAnalyticsSessionId:(id)a3
{
}

- (NSArray)previouslyShownCandidates
{
  return self->_previouslyShownCandidates;
}

- (void)setPreviouslyShownCandidates:(id)a3
{
}

- (NSString)selectedCandidateDescription
{
  return self->_selectedCandidateDescription;
}

- (void)setSelectedCandidateDescription:(id)a3
{
}

- (NSDate)reportFeedbackUIPresentedCalledTime
{
  return self->_reportFeedbackUIPresentedCalledTime;
}

- (void)setReportFeedbackUIPresentedCalledTime:(id)a3
{
}

- (double)predictionBarDebounceTimeInterval
{
  return self->_predictionBarDebounceTimeInterval;
}

- (void)setPredictionBarDebounceTimeInterval:(double)a3
{
  self->_predictionBarDebounceTimeInterval = a3;
}

- (NSTimer)predictionBarDebounceTimeIntervalTimer
{
  return self->_predictionBarDebounceTimeIntervalTimer;
}

- (void)setPredictionBarDebounceTimeIntervalTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionBarDebounceTimeIntervalTimer, 0);
  objc_storeStrong((id *)&self->_reportFeedbackUIPresentedCalledTime, 0);
  objc_storeStrong((id *)&self->_selectedCandidateDescription, 0);
  objc_storeStrong((id *)&self->_previouslyShownCandidates, 0);
  objc_storeStrong((id *)&self->_analyticsSessionId, 0);
  objc_destroyWeak((id *)&self->_keyboardStateManagerDelegate);
}

@end