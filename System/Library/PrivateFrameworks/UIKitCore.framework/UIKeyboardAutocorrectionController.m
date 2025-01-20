@interface UIKeyboardAutocorrectionController
- (BOOL)_divertSmartReplyPredictionsToTextChoicesAssistant;
- (BOOL)hasActiveObservers;
- (BOOL)hasAutocorrection;
- (BOOL)hasAutofillCandidates;
- (BOOL)hasContinuousPathConversions;
- (BOOL)hasProactiveCandidates;
- (BOOL)hasTextSuggestionCandidates;
- (BOOL)isSmartReplyCandidates;
- (BOOL)requestedAutocorrection;
- (NSArray)textCompletions;
- (TIAutocorrectionList)autocorrectionList;
- (TIAutocorrectionList)textSuggestionList;
- (TIKeyboardCandidate)autocorrection;
- (UIKeyboardAutocorrectionController)init;
- (UIKeyboardAutocorrectionControllerDelegate)delegate;
- (id)storedListForCandidate:(id)a3;
- (unint64_t)maximumNumberOfCandidates;
- (void)_notifyObserversOfUpdatedAutocorrectionList:(uint64_t)a1;
- (void)_setAutocorrectionList:(int)a3 notifyObservers:;
- (void)addAutocorrectionObserver:(id)a3;
- (void)clearAutocorrection;
- (void)clearAutocorrectionAndNotifyObservers:(BOOL)a3;
- (void)clearAutofillAndTextSuggestions;
- (void)removeAutocorrectionObserver:(id)a3;
- (void)requestAutocorrectionWithExecutionContext:(id)a3;
- (void)setAutocorrectionList:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximumNumberOfCandidates:(unint64_t)a3;
- (void)setNeedsAutocorrection;
- (void)setTextSuggestionList:(id)a3;
- (void)updateAfterShiftStateChange;
@end

@implementation UIKeyboardAutocorrectionController

- (TIAutocorrectionList)textSuggestionList
{
  return self->_textSuggestionList;
}

- (UIKeyboardAutocorrectionController)init
{
  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardAutocorrectionController;
  v2 = [(UIKeyboardAutocorrectionController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    autocorrectionObservers = v2->_autocorrectionObservers;
    v2->_autocorrectionObservers = (NSHashTable *)v3;

    v2->_maximumNumberOfCandidates = 3;
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    recentCandidates = v2->_recentCandidates;
    v2->_recentCandidates = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)addAutocorrectionObserver:(id)a3
{
}

- (void)removeAutocorrectionObserver:(id)a3
{
}

- (void)_notifyObserversOfUpdatedAutocorrectionList:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v4 = objc_msgSend(*(id *)(a1 + 48), "copy", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) autocorrectionController:a1 didUpdateAutocorrectionList:v3];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (TIKeyboardCandidate)autocorrection
{
  id v3 = [(UIKeyboardAutocorrectionController *)self autocorrectionList];
  int v4 = [v3 shouldAcceptTopCandidate];

  if (v4)
  {
    uint64_t v5 = [(UIKeyboardAutocorrectionController *)self autocorrectionList];
    uint64_t v6 = [v5 candidates];
    uint64_t v7 = [v6 firstObject];

    uint64_t v8 = [v7 candidate];
    if ([v8 length])
    {
LABEL_3:

      goto LABEL_5;
    }
    int v10 = [v7 slotID];

    if (!v10)
    {
      uint64_t v8 = v7;
      uint64_t v7 = 0;
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_5:
  return (TIKeyboardCandidate *)v7;
}

- (NSArray)textCompletions
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(TIAutocorrectionList *)self->_autocorrectionList inlineCompletions];
  }
  else
  {
    id v3 = 0;
  }
  return (NSArray *)v3;
}

- (TIAutocorrectionList)autocorrectionList
{
  if (self->_needsAutocorrection)
  {
    if ([(UIKeyboardAutocorrectionController *)self requestedAutocorrection])
    {
      id v3 = [(UIKeyboardAutocorrectionController *)self delegate];
      int v4 = [v3 taskQueue];
      [v4 waitUntilAllTasksAreFinished];
    }
    else
    {
      if (qword_1EB261BB0 != -1) {
        dispatch_once(&qword_1EB261BB0, &__block_literal_global_351);
      }
      id v3 = [(UIKeyboardAutocorrectionController *)self delegate];
      int v4 = [v3 taskQueue];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __56__UIKeyboardAutocorrectionController_autocorrectionList__block_invoke_3;
      v7[3] = &unk_1E52E34C8;
      v7[4] = self;
      [v4 performTask:v7 breadcrumb:_MergedGlobals_1138];
    }
  }
  autocorrectionList = self->_autocorrectionList;
  return autocorrectionList;
}

void __56__UIKeyboardAutocorrectionController_autocorrectionList__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_6_11 copy];
  v1 = (void *)_MergedGlobals_1138;
  _MergedGlobals_1138 = v0;
}

uint64_t __56__UIKeyboardAutocorrectionController_autocorrectionList__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __56__UIKeyboardAutocorrectionController_autocorrectionList__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) requestAutocorrectionWithExecutionContext:a2];
}

- (BOOL)_divertSmartReplyPredictionsToTextChoicesAssistant
{
  BOOL v3 = +[UIKeyboard isInHardwareKeyboardMode];
  int v4 = +[UIKeyboardImpl activeInstance];
  int v5 = [v4 _showsScribbleIconsInAssistantView];

  uint64_t v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  uint64_t v7 = [v6 systemInputAssistantViewController];
  uint64_t v8 = [v7 assistantBarStyle];

  long long v9 = [(UIKeyboardAutocorrectionController *)self delegate];
  char v10 = [v9 isPredictionViewControllerVisible];

  if (+[UIKeyboardImpl isSplit]) {
    return 1;
  }
  if ((v3 | v5) != 1) {
    return 0;
  }
  if ((unint64_t)(v8 - 2) < 3) {
    return 1;
  }
  return v10 ^ 1;
}

- (void)_setAutocorrectionList:(int)a3 notifyObservers:
{
  id obj = a2;
  if (!a1)
  {
LABEL_14:
    v23 = obj;
    goto LABEL_15;
  }
  *(unsigned char *)(a1 + 17) = 0;
  if ([(id)a1 _divertSmartReplyPredictionsToTextChoicesAssistant])
  {
    int v5 = [obj predictions];
    uint64_t v6 = _filteredCandidates(v5, &__block_literal_global_93_0);

    if ([v6 count])
    {
      id v7 = obj;
      uint64_t v8 = [v7 predictions];
      uint64_t v9 = [v8 count];

      if (v9)
      {
        char v10 = [v7 predictions];
        long long v11 = _filteredCandidates(v10, &__block_literal_global_98_2);

        id obj = v7;
        unint64_t v12 = [v11 count];
        v13 = [obj predictions];
        unint64_t v14 = [v13 count];

        if (v12 < v14)
        {
          v15 = (void *)MEMORY[0x1E4FAE278];
          v16 = [obj corrections];
          v17 = [obj emojiList];
          v18 = [obj inlineCompletions];
          v19 = [obj proactiveTriggers];
          uint64_t v20 = [v15 listWithCorrections:v16 predictions:v11 emojiList:v17 inlineCompletionList:v18 proactiveTriggers:v19];

          id obj = (id)v20;
        }
      }
      else
      {
        id obj = v7;
      }

      v21 = [(id)a1 delegate];
      v22 = [v21 _textChoicesAssistant];
      [v22 showChoicesForCandidates:v6];
    }
  }
  v23 = obj;
  if (*(id *)(a1 + 24) != obj)
  {
    objc_storeStrong((id *)(a1 + 24), obj);
    if (a3) {
      -[UIKeyboardAutocorrectionController _notifyObserversOfUpdatedAutocorrectionList:](a1, *(void **)(a1 + 24));
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)setAutocorrectionList:(id)a3
{
}

- (void)setTextSuggestionList:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_textSuggestionList, a3);
  if (self->_textSuggestionList) {
    -[UIKeyboardAutocorrectionController setAutocorrectionList:](self, "setAutocorrectionList:");
  }
  else {
    -[UIKeyboardAutocorrectionController _notifyObserversOfUpdatedAutocorrectionList:]((uint64_t)self, 0);
  }
}

- (void)setNeedsAutocorrection
{
  if (!self->_needsAutocorrection)
  {
    self->_needsAutocorrection = 1;
    self->_signpostToken = arc4random();
    uint64_t v3 = mach_absolute_time();
    kdebug_trace();
    kac_get_log();
    int v4 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, (const void *)self->_signpostToken);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1853B0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "appAutocorrect", " enableTelemetry=YES ", buf, 2u);
      }
    }

    if (!self->_hasPendingAutocorrection && !self->_requestedAutocorrection)
    {
      self->_hasPendingAutocorrection = 1;
      if (qword_1EB261BC0 != -1) {
        dispatch_once(&qword_1EB261BC0, &__block_literal_global_12_5);
      }
      id v7 = [(UIKeyboardAutocorrectionController *)self delegate];
      uint64_t v8 = [v7 taskQueue];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __60__UIKeyboardAutocorrectionController_setNeedsAutocorrection__block_invoke_3;
      v9[3] = &unk_1E52E3F00;
      v9[4] = self;
      v9[5] = v3;
      [v8 addDeferredTask:v9 breadcrumb:qword_1EB261BB8];
    }
  }
}

void __60__UIKeyboardAutocorrectionController_setNeedsAutocorrection__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_14_5 copy];
  v1 = (void *)qword_1EB261BB8;
  qword_1EB261BB8 = v0;
}

uint64_t __60__UIKeyboardAutocorrectionController_setNeedsAutocorrection__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __60__UIKeyboardAutocorrectionController_setNeedsAutocorrection__block_invoke_3(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 18) = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__UIKeyboardAutocorrectionController_setNeedsAutocorrection__block_invoke_4;
  v6[3] = &unk_1E52E3F00;
  uint64_t v3 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  v6[5] = v3;
  int v4 = [a2 childWithContinuation:v6];
  os_signpost_id_t v5 = *(unsigned char **)(a1 + 32);
  if (v5[17] && !v5[16]) {
    [v5 requestAutocorrectionWithExecutionContext:v4];
  }
  else {
    [v4 returnExecutionToParent];
  }
}

void __60__UIKeyboardAutocorrectionController_setNeedsAutocorrection__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = mach_absolute_time();
  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, *(const void **)(*(void *)(a1 + 32) + 8));
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v5, OS_SIGNPOST_INTERVAL_END, v7, "appAutocorrect", " enableTelemetry=YES ", v8, 2u);
    }
  }

  +[_UIKeyboardDiagnosticCollection _requestTailspinWithDescription:@"KeyboardAutocorrectionLatency" startMAT:*(void *)(a1 + 40) endMAT:v4 ifExceedsThresholdSec:0.25];
  *(void *)(*(void *)(a1 + 32) + 8) = 0;
  [v3 returnExecutionToParent];
}

- (void)clearAutocorrection
{
}

- (void)clearAutocorrectionAndNotifyObservers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![(UIKeyboardAutocorrectionController *)self hasAutofillCandidates])
  {
    -[UIKeyboardAutocorrectionController _setAutocorrectionList:notifyObservers:]((uint64_t)self, 0, 0);
    if (v3)
    {
      if (self)
      {
        long long v12 = 0u;
        long long v13 = 0u;
        long long v10 = 0u;
        long long v11 = 0u;
        os_signpost_id_t v5 = (void *)[(NSHashTable *)self->_autocorrectionObservers copy];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v11;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v11 != v8) {
                objc_enumerationMutation(v5);
              }
              [*(id *)(*((void *)&v10 + 1) + 8 * v9++) autocorrectionControllerDidClearAutocorrections:self];
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
          }
          while (v7);
        }
      }
    }
  }
}

- (void)clearAutofillAndTextSuggestions
{
}

- (BOOL)hasAutocorrection
{
  return !self->_needsAutocorrection;
}

- (void)updateAfterShiftStateChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_needsAutocorrection)
  {
    BOOL v3 = [(TIAutocorrectionList *)self->_autocorrectionList corrections];
    uint64_t v4 = [v3 autocorrection];
    BOOL v5 = __65__UIKeyboardAutocorrectionController_updateAfterShiftStateChange__block_invoke(v4);

    if (v5)
    {
      [(UIKeyboardAutocorrectionController *)self setNeedsAutocorrection];
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      uint64_t v6 = [(TIAutocorrectionList *)self->_autocorrectionList candidates];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            if (__65__UIKeyboardAutocorrectionController_updateAfterShiftStateChange__block_invoke(*(void **)(*((void *)&v11 + 1) + 8 * i)))
            {
              [(UIKeyboardAutocorrectionController *)self setNeedsAutocorrection];
              goto LABEL_16;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
  }
}

BOOL __65__UIKeyboardAutocorrectionController_updateAfterShiftStateChange__block_invoke(void *a1)
{
  id v1 = a1;
  v2 = v1;
  BOOL v3 = v1
    && ([v1 isForShortcutConversion] & 1) == 0
    && ([v2 isReplacement] & 1) == 0
    && ([v2 candidateProperty] & 2) == 0;

  return v3;
}

- (BOOL)hasAutofillCandidates
{
  return [(TIAutocorrectionList *)self->_autocorrectionList containsAutofillCandidates];
}

- (BOOL)hasContinuousPathConversions
{
  return [(TIAutocorrectionList *)self->_autocorrectionList containsContinuousPathConversions];
}

- (BOOL)hasProactiveCandidates
{
  return [(TIAutocorrectionList *)self->_autocorrectionList containsProactiveTriggers];
}

- (BOOL)hasActiveObservers
{
  if (self) {
    self = (UIKeyboardAutocorrectionController *)self->_autocorrectionObservers;
  }
  return [(UIKeyboardAutocorrectionController *)self count] != 0;
}

- (BOOL)hasTextSuggestionCandidates
{
  v2 = [(UIKeyboardAutocorrectionController *)self textSuggestionList];
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 predictions];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isSmartReplyCandidates
{
  v2 = [(UIKeyboardAutocorrectionController *)self autocorrectionList];
  BOOL v3 = [v2 corrections];
  uint64_t v4 = [v3 autocorrection];
  if (v4)
  {
  }
  else
  {
    uint64_t v6 = [v2 candidates];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v11 = 0;
      long long v12 = &v11;
      uint64_t v13 = 0x2020000000;
      char v14 = 1;
      uint64_t v8 = [v2 candidates];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __60__UIKeyboardAutocorrectionController_isSmartReplyCandidates__block_invoke;
      v10[3] = &unk_1E52FC490;
      v10[4] = &v11;
      [v8 enumerateObjectsUsingBlock:v10];

      BOOL v5 = *((unsigned char *)v12 + 24) != 0;
      _Block_object_dispose(&v11, 8);
      goto LABEL_6;
    }
  }
  BOOL v5 = 0;
LABEL_6:

  return v5;
}

uint64_t __60__UIKeyboardAutocorrectionController_isSmartReplyCandidates__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 candidateProperty];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) &= result >> 1;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

- (void)requestAutocorrectionWithExecutionContext:(id)a3
{
  id v4 = a3;
  if (self) {
    self->_requestedAutocorrection = 1;
  }
  BOOL v5 = [(UIKeyboardAutocorrectionController *)self delegate];
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__UIKeyboardAutocorrectionController_requestAutocorrectionWithExecutionContext___block_invoke;
    v7[3] = &unk_1E52E34C8;
    v7[4] = self;
    uint64_t v6 = [v4 childWithContinuation:v7];
    [v5 generateAutocorrectionWithExecutionContext:v6];
  }
  else
  {
    [v4 returnExecutionToParent];
  }
}

uint64_t __80__UIKeyboardAutocorrectionController_requestAutocorrectionWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    *(unsigned char *)(v2 + 16) = 0;
  }
  return [a2 returnExecutionToParent];
}

- (id)storedListForCandidate:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_autocorrectionList;
  if (!v5)
  {
    if (+[UIKeyboard usesInputSystemUI])
    {
      BOOL v5 = [MEMORY[0x1E4FAE278] listWithAutocorrection:v4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)requestedAutocorrection
{
  return self->_requestedAutocorrection;
}

- (unint64_t)maximumNumberOfCandidates
{
  return self->_maximumNumberOfCandidates;
}

- (void)setMaximumNumberOfCandidates:(unint64_t)a3
{
  self->_maximumNumberOfCandidates = a3;
}

- (UIKeyboardAutocorrectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardAutocorrectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recentCandidates, 0);
  objc_storeStrong((id *)&self->_autocorrectionObservers, 0);
  objc_storeStrong((id *)&self->_textSuggestionList, 0);
  objc_storeStrong((id *)&self->_autocorrectionList, 0);
}

@end