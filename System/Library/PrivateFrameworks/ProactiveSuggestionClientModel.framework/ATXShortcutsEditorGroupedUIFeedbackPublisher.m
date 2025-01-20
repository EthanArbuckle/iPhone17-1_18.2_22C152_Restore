@interface ATXShortcutsEditorGroupedUIFeedbackPublisher
- (ATXShortcutsEditorGroupedUIFeedbackPublisher)initWithUIFeedbackPublisher:(id)a3;
- (id)shortcutsEditorUIFeedbackPublisher;
@end

@implementation ATXShortcutsEditorGroupedUIFeedbackPublisher

- (ATXShortcutsEditorGroupedUIFeedbackPublisher)initWithUIFeedbackPublisher:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXShortcutsEditorGroupedUIFeedbackPublisher;
  v6 = [(ATXShortcutsEditorGroupedUIFeedbackPublisher *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uiFeedbackPublisher, a3);
  }

  return v7;
}

- (id)shortcutsEditorUIFeedbackPublisher
{
  v3 = objc_opt_new();
  uiFeedbackPublisher = self->_uiFeedbackPublisher;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__ATXShortcutsEditorGroupedUIFeedbackPublisher_shortcutsEditorUIFeedbackPublisher__block_invoke;
  v9[3] = &unk_1E5F01BC8;
  id v10 = v3;
  id v5 = v3;
  v6 = [(BPSPublisher *)uiFeedbackPublisher scanWithInitial:v5 nextPartialResult:v9];
  v7 = [v6 filterWithIsIncluded:&__block_literal_global_21];

  return v7;
}

id __82__ATXShortcutsEditorGroupedUIFeedbackPublisher_shortcutsEditorUIFeedbackPublisher__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 session];
  v8 = [v7 sessionMetadata];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [v6 session];
    v11 = [v10 sessionMetadata];

    if ([v5 isGroupSessionComplete])
    {
      v12 = objc_opt_new();

      objc_msgSend(v12, "setNumShortcutsAtStart:", objc_msgSend(v11, "numStepsInShortcutAtStart"));
      id v5 = v12;
    }
    v13 = [v5 startDateOfFirstSession];

    if (!v13) {
      objc_msgSend(v5, "setNumShortcutsAtStart:", objc_msgSend(v11, "numStepsInShortcutAtStart"));
    }
    [v5 updateWithIntermediateSessionResults:v6];
    if ([v11 stepWasManuallyAdded]) {
      objc_msgSend(v5, "setNumManuallyAddedSteps:", objc_msgSend(v5, "numManuallyAddedSteps") + 1);
    }
    if ([v11 isLastSession])
    {
      [v5 setIsGroupSessionComplete:1];
      objc_msgSend(v5, "setNumShortcutsAtEnd:", objc_msgSend(v11, "numStepsInShortcutAtEnd"));
    }
    id v5 = v5;

    id v14 = v5;
  }
  else
  {
    v15 = __atxlog_handle_blending();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      __82__ATXShortcutsEditorGroupedUIFeedbackPublisher_shortcutsEditorUIFeedbackPublisher__block_invoke_cold_1(v15);
    }

    id v14 = *(id *)(a1 + 32);
  }

  return v14;
}

uint64_t __82__ATXShortcutsEditorGroupedUIFeedbackPublisher_shortcutsEditorUIFeedbackPublisher__block_invoke_61(uint64_t a1, void *a2)
{
  return [a2 isGroupSessionComplete];
}

- (void).cxx_destruct
{
}

void __82__ATXShortcutsEditorGroupedUIFeedbackPublisher_shortcutsEditorUIFeedbackPublisher__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "There was no session on the feedbackResult while processing Shortcuts Editor feedback.", v1, 2u);
}

@end