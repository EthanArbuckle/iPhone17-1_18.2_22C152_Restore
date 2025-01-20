@interface UIInlineTextCompletionController
+ (id)_documentTextThroughSelection:(id)a3;
- (BOOL)_deleteToUndoEnabled;
- (BOOL)_doesFirstPredictedCharacterEndWord:(id)a3;
- (BOOL)_inlineCompletionPreference;
- (BOOL)_isCompletion:(id)a3 continuingLastCompletion:(id)a4;
- (BOOL)_isRejectionWhenRemovingPromptForReason:(int64_t)a3;
- (BOOL)_shouldAcceptFirstWordOfCandidateForWordTerminator:(unsigned int)a3;
- (BOOL)_shouldAcceptUpToNextWordOfCandidateOnWordBoundaryForInteraction:(int64_t)a3;
- (BOOL)_shouldShowInlineTextCompletionCoachingUI;
- (BOOL)canUndoAcceptedTextCompletion;
- (BOOL)currentlyAcceptingInlineCompletionByDirectTap;
- (BOOL)hasForwardProgress;
- (BOOL)hasPrompt;
- (BOOL)isDeleting;
- (NSString)presentingTextCompletionAsMarkedText;
- (UIInlineTextCompletionControllerDelegate)delegate;
- (UIKBAnalyticsDispatcher)analyticsDispatcher;
- (UIKeyboardScheduledTask)inlineCompletionCoachingTask;
- (UIKeyboardScheduledTask)textCompletionPromptTask;
- (UITextInput)inputDelegate;
- (_UIInlineTextCompletion)acceptingTextCompletion;
- (_UIInlineTextCompletion)candidateRemovedOnWillPerformOutput;
- (_UIInlineTextCompletion)lastAcceptedTextCompletion;
- (_UIInlineTextCompletion)oneWordTextCompletion;
- (_UIInlineTextCompletion)textCompletion;
- (double)_updatePromptDelay;
- (id)_acceptTextCompletionWithInteraction:(int64_t)a3 wordTerminator:(id)a4;
- (id)_bestTextCompletion;
- (id)_candidateToUndoAcceptedTextCompletion;
- (id)_markedTextAttributes;
- (id)_oneWordTextCompletionFromTextCompletion:(id)a3;
- (id)_textCompletionPromptRectsForInput:(id)a3;
- (id)_textCompletions;
- (id)_upToNextWordTextCompletionFromTextCompletion:(id)a3;
- (id)acceptTextCompletionWithInteraction:(int64_t)a3 wordTerminator:(id)a4 outputHandledByCaller:(BOOL)a5;
- (id)textCompletionPrompt;
- (int64_t)_acceptTypeForInteraction:(int64_t)a3 wordTerminator:(id)a4;
- (int64_t)_acceptTypeForTypeWordTerminator:(id)a3;
- (unint64_t)_inlineCompletionModeForTraitsWithCurrentPreference:(BOOL)a3;
- (unint64_t)currentInlineTextCompletionMode;
- (void)_acceptTextCompletion:(id)a3 learningMode:(id)a4;
- (void)_clearInlineCompletionCoachingTimer;
- (void)_clearTextCompletionPromptTimer;
- (void)_presentInlineTextCompletionCoachingUIWithExecutionContext:(id)a3;
- (void)_registerLearningForInlineCompletion:(id)a3 learningMode:(id)a4;
- (void)_removeTextCompletionPromptForReason:(int64_t)a3;
- (void)_touchInlineCompletionCoachingTimer;
- (void)_touchTextCompletionPromptTimer;
- (void)_updateTextCompletionPrompt:(id)a3 executionContext:(id)a4;
- (void)_updateTextCompletionPrompt:(id)a3 inputRects:(id)a4;
- (void)_updateTextCompletionPromptWithTextCompletion:(id)a3 parentView:(id)a4 inputRects:(id)a5;
- (void)acceptTextCompletion:(id)a3;
- (void)acceptTextCompletionWithInteraction:(int64_t)a3 wordTerminator:(id)a4;
- (void)didPerformKeyboardOutput:(id)a3;
- (void)removeTextCompletionPrompt;
- (void)selectionDidChange;
- (void)setAcceptingTextCompletion:(id)a3;
- (void)setAnalyticsDispatcher:(id)a3;
- (void)setCandidateRemovedOnWillPerformOutput:(id)a3;
- (void)setCurrentlyAcceptingInlineCompletionByDirectTap:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleting:(BOOL)a3;
- (void)setHasForwardProgress:(BOOL)a3;
- (void)setInlineCompletionCoachingTask:(id)a3;
- (void)setLastAcceptedTextCompletion:(id)a3;
- (void)setPresentingTextCompletionAsMarkedText:(id)a3;
- (void)setTextCompletionPromptTask:(id)a3;
- (void)undoAcceptedTextCompletionExecutionContext:(id)a3;
- (void)updateTextCompletionDisplay;
- (void)updateTextCompletionPrompt;
- (void)updateTextCompletionPromptExecutionContext:(id)a3;
- (void)updateTextCompletionWithExternalSuggestion:(id)a3;
- (void)willAcceptPredictiveInput:(id)a3;
- (void)willPerformKeyboardOutput:(id)a3;
@end

@implementation UIInlineTextCompletionController

- (unint64_t)currentInlineTextCompletionMode
{
  unint64_t v3 = [(UIInlineTextCompletionController *)self _inlineCompletionModeForTraitsWithCurrentPreference:[(UIInlineTextCompletionController *)self _inlineCompletionPreference]];
  if ([(UIInlineTextCompletionController *)self hasForwardProgress]) {
    return v3;
  }
  else {
    return 0;
  }
}

- (BOOL)hasForwardProgress
{
  return self->_hasForwardProgress;
}

- (unint64_t)_inlineCompletionModeForTraitsWithCurrentPreference:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(UIInlineTextCompletionController *)self delegate];
  v6 = [v5 textInputTraits];

  if (+[UIDictationController isRunning])
  {
    v7 = +[UIDictationController sharedInstance];
    char v8 = [v7 isDictationPaused] ^ 1;
  }
  else
  {
    char v8 = 0;
  }
  BOOL v9 = +[UIScribbleInteraction isPencilInputExpected];
  unint64_t v10 = 0;
  if ((v8 & 1) == 0 && !v9)
  {
    if (!+[UIKeyboard isInlineTextCompletionUIEnabled])
    {
LABEL_13:
      unint64_t v10 = 0;
      goto LABEL_14;
    }
    if (+[UIKeyboard presentsInlineTextCompletionAsMarkedText])
    {
      v11 = [(UIInlineTextCompletionController *)self delegate];
      char v12 = [v11 delegateSupportsCorrectionUI];

      char v13 = v12 ^ 1;
    }
    else
    {
      char v13 = 0;
    }
    unint64_t v10 = 0;
    if ((v13 & 1) == 0 && v3)
    {
      if ([v6 isSecureTextEntry]) {
        goto LABEL_13;
      }
      unsigned int v15 = [v6 keyboardType];
      unint64_t v10 = 0;
      if ((v15 > 0xB || ((1 << v15) & 0x930) == 0) && v15 != 127)
      {
        uint64_t v16 = [v6 inlinePredictionType];
        if (v16 == 2)
        {
          unint64_t v10 = 1;
          goto LABEL_14;
        }
        if (v16) {
          goto LABEL_13;
        }
        v17 = [(UIInlineTextCompletionController *)self delegate];
        unsigned int v18 = [v17 inlineTextCompletionAllowedForAutocorrectionType];

        v19 = [v6 textContentType];
        if (v19) {
          unint64_t v10 = 0;
        }
        else {
          unint64_t v10 = v18;
        }
      }
    }
  }
LABEL_14:

  return v10;
}

- (UIInlineTextCompletionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIInlineTextCompletionControllerDelegate *)WeakRetained;
}

- (BOOL)_inlineCompletionPreference
{
  v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  BOOL v3 = [v2 preferencesActions];
  if ([v3 BOOLForPreferenceKey:*MEMORY[0x1E4FAE948]])
  {
    v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v5 = [v4 preferencesActions];
    char v6 = [v5 BOOLForPreferenceKey:*MEMORY[0x1E4FAE888]];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_markedTextAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = *(void *)off_1E52D2048;
  v2 = +[UIColor systemGrayColor];
  v7[0] = v2;
  v6[1] = *(void *)off_1E52D1F58;
  BOOL v3 = +[UIColor clearColor];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (BOOL)_doesFirstPredictedCharacterEndWord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 candidate];
  char v6 = (void *)v5;
  v7 = &stru_1ED0E84C0;
  if (v5) {
    char v8 = (__CFString *)v5;
  }
  else {
    char v8 = &stru_1ED0E84C0;
  }
  BOOL v9 = v8;

  unint64_t v10 = [v4 input];

  if (v10) {
    v11 = v10;
  }
  else {
    v11 = &stru_1ED0E84C0;
  }
  char v12 = v11;

  unint64_t v13 = [(__CFString *)v9 length];
  if (v13 > [(__CFString *)v12 length])
  {
    v7 = [(__CFString *)v9 substringFromIndex:[(__CFString *)v12 length]];
  }

  if ([(__CFString *)v7 length]
    && (uint64_t v14 = [(__CFString *)v7 _rangeOfLongCharacterAtIndex:0],
        v14 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[__CFString substringWithRange:](v7, "substringWithRange:", v14, v15);
    uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v16 = &stru_1ED0E84C0;
  }

  if ([(__CFString *)v16 length])
  {
    v17 = [(UIInlineTextCompletionController *)self delegate];
    unsigned int v18 = [v17 inputManagerState];
    char v19 = [v18 stringEndsWord:v16];
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (UITextInput)inputDelegate
{
  v2 = [(UIInlineTextCompletionController *)self delegate];
  BOOL v3 = [v2 inputDelegateManager];
  id v4 = [v3 textInputDelegate];

  return (UITextInput *)v4;
}

- (BOOL)hasPrompt
{
  if (!+[UIKeyboard presentsInlineTextCompletionAsMarkedText])return self->m_textCompletionPrompt != 0; {
  BOOL v3 = [(UIInlineTextCompletionController *)self presentingTextCompletionAsMarkedText];
  }
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (BOOL)_deleteToUndoEnabled
{
  return 0;
}

- (double)_updatePromptDelay
{
  return 0.1;
}

- (id)_oneWordTextCompletionFromTextCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 input];
    char v6 = [v4 candidate];
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__218;
    v23 = __Block_byref_object_dispose__218;
    id v24 = 0;
    uint64_t v7 = [v6 length];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__UIInlineTextCompletionController__oneWordTextCompletionFromTextCompletion___block_invoke;
    v15[3] = &unk_1E530CAE8;
    id v8 = v5;
    id v16 = v8;
    unsigned int v18 = &v19;
    id v9 = v6;
    id v17 = v9;
    objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 3, v15);
    if ([(id)v20[5] length])
    {
      unint64_t v10 = [v4 completion];
      v11 = [v10 candidateByReplacingWithCandidate:v20[5] input:v8];

      char v12 = [v4 completion];
      unint64_t v13 = +[_UIInlineTextCompletion inlineTextCompletion:v11 source:v12];
    }
    else
    {
      unint64_t v13 = 0;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

void __77__UIInlineTextCompletionController__oneWordTextCompletionFromTextCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v9 = a3 + a4;
  if (a3 + a4 > (unint64_t)[*(id *)(a1 + 32) length])
  {
    uint64_t v10 = [*(id *)(a1 + 40) substringToIndex:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    char v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a7 = 1;
  }
}

- (id)_upToNextWordTextCompletionFromTextCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 input];
    char v6 = [v4 candidate];
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__218;
    v23 = __Block_byref_object_dispose__218;
    id v24 = 0;
    uint64_t v7 = [v6 length];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__UIInlineTextCompletionController__upToNextWordTextCompletionFromTextCompletion___block_invoke;
    v15[3] = &unk_1E530CAE8;
    id v8 = v5;
    id v16 = v8;
    unsigned int v18 = &v19;
    id v9 = v6;
    id v17 = v9;
    objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 3, v15);
    if ([(id)v20[5] length])
    {
      uint64_t v10 = [v4 completion];
      uint64_t v11 = [v10 candidateByReplacingWithCandidate:v20[5] input:v8];

      char v12 = [v4 completion];
      unint64_t v13 = +[_UIInlineTextCompletion inlineTextCompletion:v11 source:v12];
    }
    else
    {
      unint64_t v13 = 0;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

void __82__UIInlineTextCompletionController__upToNextWordTextCompletionFromTextCompletion___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if (a3 > [*(id *)(a1 + 32) length])
  {
    uint64_t v10 = [*(id *)(a1 + 40) substringToIndex:a3];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    char v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a7 = 1;
  }
}

- (_UIInlineTextCompletion)oneWordTextCompletion
{
  id v3 = [(UIInlineTextCompletionController *)self textCompletion];
  BOOL v4 = [(UIInlineTextCompletionController *)self _oneWordTextCompletionFromTextCompletion:v3];

  return (_UIInlineTextCompletion *)v4;
}

- (id)_textCompletions
{
  id v3 = [(UIInlineTextCompletionController *)self delegate];
  BOOL v4 = [v3 autocorrectionController];
  int v5 = [v4 hasAutocorrection];

  id v6 = (id)MEMORY[0x1E4F1CBF0];
  if (v5)
  {
    uint64_t v7 = [(UIInlineTextCompletionController *)self delegate];
    id v8 = [v7 autocorrectionController];
    uint64_t v9 = [v8 textCompletions];
    uint64_t v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (void *)v9;
    }
    else {
      uint64_t v11 = v6;
    }
    id v6 = v11;
  }
  return v6;
}

- (id)_bestTextCompletion
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v2 = [(UIInlineTextCompletionController *)self _textCompletions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (!v3) {
    goto LABEL_29;
  }
  uint64_t v5 = v3;
  uint64_t v6 = *(void *)v55;
  p_superclass = _UIFocusSystemHaloEffect.superclass;
  *(void *)&long long v4 = 138412546;
  long long v47 = v4;
  uint64_t v48 = *(void *)v55;
  v49 = v2;
  do
  {
    uint64_t v8 = 0;
    uint64_t v50 = v5;
    do
    {
      if (*(void *)v55 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v9 = *(void **)(*((void *)&v54 + 1) + 8 * v8);
      uint64_t v10 = objc_msgSend(v9, "candidate", v47);
      uint64_t v11 = [v10 lowercaseString];

      char v12 = [v9 input];
      unint64_t v13 = [v12 lowercaseString];

      uint64_t v14 = [v9 input];
      if (![v14 length])
      {

LABEL_11:
        v20 = [p_superclass + 259 inlineTextCompletion:v9 source:v9];
        goto LABEL_12;
      }
      char v15 = [v11 hasPrefix:v13];

      if (v15) {
        goto LABEL_11;
      }
      v53 = v11;
      id v16 = [v9 candidate];
      unint64_t v17 = [v16 length];
      unsigned int v18 = [v9 input];
      unint64_t v19 = [v18 length];

      if (v17 < v19)
      {

        p_superclass = (__objc2_class **)(_UIFocusSystemHaloEffect + 8);
        goto LABEL_13;
      }
      id v21 = v9;
      v22 = [v21 input];
      v23 = [v22 componentsSeparatedByString:@" "];

      id v24 = v21;
      if ((unint64_t)[v23 count] >= 2)
      {
        v25 = [v23 lastObject];
        v26 = [v21 candidate];
        id v24 = [v21 candidateByReplacingWithCandidate:v26 input:v25];
      }
      v51 = v21;
      v52 = v23;
      v27 = [v24 candidate];
      uint64_t v28 = [v27 length];
      v29 = [v24 input];
      unint64_t v30 = v28 - [v29 length];

      uint64_t v31 = 0;
      while (1)
      {
        v32 = [v24 candidate];
        v33 = [v32 substringFromIndex:v31];

        v34 = [v33 lowercaseString];
        v35 = [v24 input];
        v36 = [v35 lowercaseString];
        int v37 = [v34 hasPrefix:v36];

        if (v37) {
          break;
        }

        if (++v31 > v30) {
          goto LABEL_24;
        }
      }
      v38 = [v24 input];
      v39 = [v24 candidateByReplacingWithCandidate:v33 input:v38];

      v20 = +[_UIInlineTextCompletion inlineTextCompletion:v39 source:v51];
      v40 = _UIKBInlineTextCompletionLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = _shortCandidateDescr(v51);
        v42 = _shortCompletionDescr(v20);
        *(_DWORD *)buf = v47;
        v59 = v41;
        __int16 v60 = 2112;
        v61 = v42;
        _os_log_impl(&dword_1853B0000, v40, OS_LOG_TYPE_DEFAULT, "NOTICE: text completion with mismatched input was reconciled with contextBeforeInput\n    original=%@\n    reconciled=%@", buf, 0x16u);
      }
      if (!v20)
      {
LABEL_24:
        v43 = _UIKBInlineTextCompletionLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = _shortCandidateDescr(v51);
          *(_DWORD *)buf = 138412290;
          v59 = v44;
          _os_log_impl(&dword_1853B0000, v43, OS_LOG_TYPE_DEFAULT, "WARNING: text completion with mismatched input could not be reconciled with contextBeforeInput\n    %@", buf, 0xCu);
        }
        v20 = 0;
      }

      uint64_t v6 = v48;
      v2 = v49;
      uint64_t v5 = v50;
      p_superclass = (__objc2_class **)(_UIFocusSystemHaloEffect + 8);
      uint64_t v11 = v53;
LABEL_12:

      if (v20) {
        goto LABEL_30;
      }
LABEL_13:
      ++v8;
    }
    while (v8 != v5);
    uint64_t v45 = [v2 countByEnumeratingWithState:&v54 objects:v62 count:16];
    uint64_t v5 = v45;
  }
  while (v45);
LABEL_29:
  v20 = 0;
LABEL_30:

  return v20;
}

- (void)updateTextCompletionDisplay
{
  if (!+[UIKeyboard usesInputSystemUI])
  {
    uint64_t v3 = [(UIInlineTextCompletionController *)self delegate];
    long long v4 = [v3 inputDelegateManager];
    char v5 = [v4 hasAsyncCapableInputDelegate];

    if ((v5 & 1) == 0
      && [(UIInlineTextCompletionController *)self hasPrompt]
      && ([(UIInlineTextCompletionController *)self delegate],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          [v6 autocorrectionController],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 hasAutocorrection],
          v7,
          v6,
          v8))
    {
      [(UIInlineTextCompletionController *)self updateTextCompletionPrompt];
    }
    else
    {
      [(UIInlineTextCompletionController *)self _touchTextCompletionPromptTimer];
    }
  }
}

- (void)updateTextCompletionWithExternalSuggestion:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 inputText];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      int v8 = [v5 _keyboardCandidate];
      uint64_t v9 = [v5 _keyboardCandidate];
      uint64_t v10 = +[_UIInlineTextCompletion inlineTextCompletion:v8 source:v9];

      if (qword_1EB264978 != -1) {
        dispatch_once(&qword_1EB264978, &__block_literal_global_591);
      }
      uint64_t v11 = [(UIInlineTextCompletionController *)self delegate];
      char v12 = [v11 taskQueue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __79__UIInlineTextCompletionController_updateTextCompletionWithExternalSuggestion___block_invoke_3;
      v15[3] = &unk_1E52E3628;
      void v15[4] = self;
      id v16 = v10;
      uint64_t v13 = _MergedGlobals_1279;
      id v14 = v10;
      [v12 performSingleTask:v15 breadcrumb:v13];
    }
  }
}

void __79__UIInlineTextCompletionController_updateTextCompletionWithExternalSuggestion___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_67_5 copy];
  v1 = (void *)_MergedGlobals_1279;
  _MergedGlobals_1279 = v0;
}

uint64_t __79__UIInlineTextCompletionController_updateTextCompletionWithExternalSuggestion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __79__UIInlineTextCompletionController_updateTextCompletionWithExternalSuggestion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateTextCompletionPrompt:*(void *)(a1 + 40) executionContext:a2];
}

- (id)textCompletionPrompt
{
  return self->m_textCompletionPrompt;
}

- (BOOL)_isCompletion:(id)a3 continuingLastCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if ((v6 != 0) == (v7 == 0)) {
    goto LABEL_6;
  }
  if (v6 != v7)
  {
    uint64_t v9 = [v7 candidate];
    uint64_t v10 = [v6 candidate];
    int v11 = [v9 hasSuffix:v10];

    if (v11)
    {
      char v12 = [v6 input];
      uint64_t v13 = [v8 input];
      char v14 = [v12 hasPrefix:v13];

      if (v14) {
        goto LABEL_5;
      }
      unint64_t v17 = [(UIInlineTextCompletionController *)self delegate];
      unsigned int v18 = [v17 documentState];
      unint64_t v19 = [v18 contextBeforeInput];

      v20 = [v6 input];
      if ([v20 length]) {
        goto LABEL_9;
      }
      unint64_t v21 = [v19 length];
      v22 = [v8 input];
      unint64_t v23 = [v22 length];

      if (v21 < v23)
      {
        char v15 = 0;
        goto LABEL_11;
      }
      id v24 = [v8 candidate];
      v20 = [v24 componentsSeparatedByString:@" "];

      uint64_t v25 = [v20 firstObject];
      if (!v25)
      {
LABEL_9:
        char v15 = 0;
      }
      else
      {
        v26 = (void *)v25;
        v27 = [v8 input];
        if ([v26 hasPrefix:v27]) {
          char v15 = [v19 hasSuffix:v26];
        }
        else {
          char v15 = 0;
        }
      }
LABEL_11:

      goto LABEL_7;
    }
LABEL_6:
    char v15 = 0;
    goto LABEL_7;
  }
LABEL_5:
  char v15 = 1;
LABEL_7:

  return v15;
}

- (void)removeTextCompletionPrompt
{
}

+ (id)_documentTextThroughSelection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 contextBeforeInput];
  char v5 = (void *)v4;
  id v6 = &stru_1ED0E84C0;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = v6;

  int v8 = [v3 markedText];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    uint64_t v10 = [v3 markedText];
    uint64_t v11 = [v3 selectedRangeInMarkedText];
    uint64_t v13 = objc_msgSend(v10, "substringWithRange:", 0, v11 + v12);
  }
  else
  {
    char v14 = [v3 selectedText];

    if (!v14) {
      goto LABEL_8;
    }
    uint64_t v13 = [v3 selectedText];
  }
  uint64_t v15 = [(__CFString *)v7 stringByAppendingString:v13];

  id v7 = (__CFString *)v15;
LABEL_8:

  return v7;
}

- (void)selectionDidChange
{
  [(UIInlineTextCompletionController *)self setHasForwardProgress:0];
  [(UIInlineTextCompletionController *)self _removeTextCompletionPromptForReason:9];
  id v3 = _UIKBInlineTextCompletionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "Selection changed", v4, 2u);
  }
}

- (void)willPerformKeyboardOutput:(id)a3
{
  id v19 = a3;
  if (![(UIInlineTextCompletionController *)self _deleteToUndoEnabled])
  {
    uint64_t v4 = [(UIInlineTextCompletionController *)self delegate];
    char v5 = [v4 documentState];

    if (_outputIsSimpleDeletion(v19)
      || ([v5 selectedText],
          id v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 length],
          v6,
          v7))
    {
      [(UIInlineTextCompletionController *)self setHasForwardProgress:0];
      int v8 = [(UIInlineTextCompletionController *)self lastAcceptedTextCompletion];

      if (v8)
      {
        uint64_t v9 = [(id)objc_opt_class() _documentTextThroughSelection:v5];
        uint64_t v10 = [(UIInlineTextCompletionController *)self lastAcceptedTextCompletion];
        uint64_t v11 = [v10 candidate];
        uint64_t v12 = (void *)v11;
        uint64_t v13 = &stru_1ED0E84C0;
        if (v11) {
          uint64_t v13 = (__CFString *)v11;
        }
        char v14 = v13;

        int v15 = [v9 hasSuffix:v14];
        if (v15)
        {
          id v16 = [(UIInlineTextCompletionController *)self lastAcceptedTextCompletion];
          [(UIInlineTextCompletionController *)self _registerLearningForInlineCompletion:v16 learningMode:*MEMORY[0x1E4FAEA78]];

          [(UIInlineTextCompletionController *)self setLastAcceptedTextCompletion:0];
        }
      }
    }
  }
  if (+[UIKeyboard presentsInlineTextCompletionAsMarkedText])
  {
    unint64_t v17 = [(UIInlineTextCompletionController *)self presentingTextCompletionAsMarkedText];

    if (v17)
    {
      unsigned int v18 = [(UIInlineTextCompletionController *)self textCompletion];
      [(UIInlineTextCompletionController *)self _removeTextCompletionPromptForReason:7];
      [(UIInlineTextCompletionController *)self setCandidateRemovedOnWillPerformOutput:v18];
    }
  }
}

- (void)didPerformKeyboardOutput:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UIInlineTextCompletionController *)self setDeleting:_outputIsSimpleDeletion(v4)];
  char v5 = [v4 insertionText];
  uint64_t v6 = [v5 length];

  if (v6) {
    [(UIInlineTextCompletionController *)self setHasForwardProgress:1];
  }
  uint64_t v7 = [(UIInlineTextCompletionController *)self candidateRemovedOnWillPerformOutput];
  [(UIInlineTextCompletionController *)self setCandidateRemovedOnWillPerformOutput:0];
  if (v7)
  {
    id v8 = v4;
    uint64_t v9 = [v8 insertionText];
    uint64_t v10 = [v9 length];

    if (!v10 || [v8 deletionCount] || objc_msgSend(v8, "forwardDeletionCount"))
    {
    }
    else
    {
      uint64_t v11 = [v8 acceptedCandidate];

      if (!v11)
      {
        uint64_t v12 = [v7 candidate];
        unint64_t v13 = [v12 length];
        char v14 = [v7 input];
        unint64_t v15 = [v14 length];

        if (v13 > v15)
        {
          id v16 = [v7 candidate];
          unint64_t v17 = [v7 input];
          unsigned int v18 = objc_msgSend(v16, "substringFromIndex:", objc_msgSend(v17, "length"));

          unint64_t v19 = [v18 length];
          v20 = [v8 insertionText];
          unint64_t v21 = [v20 length];

          if (v19 > v21)
          {
            v22 = [v8 insertionText];
            char v23 = [v18 hasPrefix:v22];

            if (v23)
            {
              id v24 = [v7 input];
              uint64_t v25 = [v8 insertionText];
              v26 = [v24 stringByAppendingString:v25];

              v27 = [v7 completion];
              uint64_t v28 = [v7 candidate];
              v29 = [v27 candidateByReplacingWithCandidate:v28 input:v26];

              unint64_t v30 = [v7 source];
              uint64_t v31 = +[_UIInlineTextCompletion inlineTextCompletion:v29 source:v30];

              v32 = _UIKBInlineTextCompletionLog();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                v38 = _shortCompletionDescr(v7);
                v39 = _shortCompletionDescr(v31);
                *(_DWORD *)buf = 138412546;
                v43 = v38;
                __int16 v44 = 2112;
                uint64_t v45 = v39;
                _os_log_debug_impl(&dword_1853B0000, v32, OS_LOG_TYPE_DEBUG, "Last text completion remains valid after output: Last=%@, Updated=%@", buf, 0x16u);
              }
              if (qword_1EB264988 != -1) {
                dispatch_once(&qword_1EB264988, &__block_literal_global_73_4);
              }
              v33 = [(UIInlineTextCompletionController *)self delegate];
              v34 = [v33 taskQueue];
              v40[0] = MEMORY[0x1E4F143A8];
              v40[1] = 3221225472;
              v40[2] = __61__UIInlineTextCompletionController_didPerformKeyboardOutput___block_invoke_3;
              v40[3] = &unk_1E52E3628;
              v40[4] = self;
              id v41 = v31;
              uint64_t v35 = qword_1EB264980;
              id v36 = v31;
              [v34 performSingleTask:v40 breadcrumb:v35];
            }
            else
            {
              v26 = _UIKBInlineTextCompletionLog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                int v37 = _shortCompletionDescr(v7);
                *(_DWORD *)buf = 138412290;
                v43 = v37;
                _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_DEFAULT, "Declining last text completion (output does not match completion text): %@", buf, 0xCu);
              }
            }
          }
        }
      }
    }
  }
}

void __61__UIInlineTextCompletionController_didPerformKeyboardOutput___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_75_1 copy];
  v1 = (void *)qword_1EB264980;
  qword_1EB264980 = v0;
}

uint64_t __61__UIInlineTextCompletionController_didPerformKeyboardOutput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __61__UIInlineTextCompletionController_didPerformKeyboardOutput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateTextCompletionPrompt:*(void *)(a1 + 40) executionContext:a2];
}

- (void)willAcceptPredictiveInput:(id)a3
{
  id v4 = a3;
  if (!+[UIKeyboard usesInputSystemUI])
  {
    char v5 = [(UIInlineTextCompletionController *)self acceptingTextCompletion];

    if (!v5)
    {
      uint64_t v6 = [(UIInlineTextCompletionController *)self textCompletion];

      if (v6)
      {
        uint64_t v7 = [(UIInlineTextCompletionController *)self textCompletion];
        id v8 = [(UIInlineTextCompletionController *)self _oneWordTextCompletionFromTextCompletion:v7];

        uint64_t v9 = [v8 candidate];
        uint64_t v10 = [v4 candidate];
        uint64_t v11 = (void *)v10;
        if (v10) {
          uint64_t v12 = (__CFString *)v10;
        }
        else {
          uint64_t v12 = &stru_1ED0E84C0;
        }
        if ([v9 isEqualToString:v12])
        {
          unint64_t v13 = [v8 input];
          uint64_t v14 = [v4 input];
          unint64_t v15 = (void *)v14;
          if (v14) {
            id v16 = (__CFString *)v14;
          }
          else {
            id v16 = &stru_1ED0E84C0;
          }
          int v17 = [v13 isEqualToString:v16];
        }
        else
        {
          int v17 = 0;
        }

        unsigned int v18 = [v4 input];
        uint64_t v19 = [v4 candidate];
        v20 = (void *)v19;
        if (v19) {
          unint64_t v21 = (__CFString *)v19;
        }
        else {
          unint64_t v21 = &stru_1ED0E84C0;
        }
        char v22 = [v18 isEqualToString:v21];

        if (v17)
        {
          char v23 = _UIKBInlineTextCompletionLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEBUG, "Accepted text completion by selecting from prediction bar", buf, 2u);
          }

          [(UIInlineTextCompletionController *)self _registerLearningForInlineCompletion:v8 learningMode:*MEMORY[0x1E4FAEA38]];
          id v24 = self;
          uint64_t v25 = 2;
        }
        else
        {
          if ((v22 & 1) == 0)
          {
            uint64_t v27 = [v4 candidate];
            uint64_t v28 = (void *)v27;
            if (v27) {
              v29 = (__CFString *)v27;
            }
            else {
              v29 = &stru_1ED0E84C0;
            }
            unint64_t v30 = v29;

            uint64_t v31 = [v8 input];
            v32 = [v31 stringByAppendingString:v30];
            v33 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
            v34 = [v32 componentsSeparatedByCharactersInSet:v33];

            uint64_t v35 = [v8 candidate];
            id v36 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];

            int v37 = [v35 componentsSeparatedByCharactersInSet:v36];

            LODWORD(v36) = [v34 isEqual:v37];
            v38 = _UIKBInlineTextCompletionLog();
            BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
            if (v36)
            {
              if (v39)
              {
                *(_WORD *)__int16 v44 = 0;
                _os_log_debug_impl(&dword_1853B0000, v38, OS_LOG_TYPE_DEBUG, "Accepted text completion by selecting from prediction bar", v44, 2u);
              }
              v40 = (void *)MEMORY[0x1E4FAEA38];
              uint64_t v41 = 5;
            }
            else
            {
              if (v39)
              {
                *(_WORD *)v43 = 0;
                _os_log_debug_impl(&dword_1853B0000, v38, OS_LOG_TYPE_DEBUG, "Rejected text completion by selecting typed string from prediction bar", v43, 2u);
              }
              v40 = (void *)MEMORY[0x1E4FAEA80];
              uint64_t v41 = 6;
            }

            [(UIInlineTextCompletionController *)self _registerLearningForInlineCompletion:v8 learningMode:*v40];
            [(UIInlineTextCompletionController *)self _removeTextCompletionPromptForReason:v41];

            goto LABEL_36;
          }
          v26 = _UIKBInlineTextCompletionLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v42 = 0;
            _os_log_debug_impl(&dword_1853B0000, v26, OS_LOG_TYPE_DEBUG, "Rejected text completion by selecting other candidate from prediction bar", v42, 2u);
          }

          [(UIInlineTextCompletionController *)self _registerLearningForInlineCompletion:v8 learningMode:*MEMORY[0x1E4FAEA80]];
          id v24 = self;
          uint64_t v25 = 5;
        }
        [(UIInlineTextCompletionController *)v24 _removeTextCompletionPromptForReason:v25];
LABEL_36:
      }
    }
  }
}

- (BOOL)_isRejectionWhenRemovingPromptForReason:(int64_t)a3
{
  return a3 == 8 || a3 == 5;
}

- (void)_removeTextCompletionPromptForReason:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!+[UIKeyboard usesInputSystemUI])
  {
    [(UIInlineTextCompletionController *)self _clearInlineCompletionCoachingTimer];
    char v5 = +[UIKeyboardImpl activeInstance];
    [v5 dismissEducationTip];

    uint64_t v6 = [(UIInlineTextCompletionController *)self presentingTextCompletionAsMarkedText];
    if (v6)
    {

LABEL_4:
      if (a3 == 5
        && ![(UIInlineTextCompletionController *)self _isCompletion:0 continuingLastCompletion:self->_textCompletion])
      {
        uint64_t v7 = _UIKBInlineTextCompletionLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = _shortCompletionDescr(self->_textCompletion);
          int v16 = 138412290;
          int v17 = v8;
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Declining text completion (accepting predictive input): %@", (uint8_t *)&v16, 0xCu);
        }
      }
      uint64_t v9 = [(UIInlineTextCompletionController *)self delegate];
      [v9 updateKeyboardConfigurations];

      [(UIInlineTextCompletionController *)self _clearTextCompletionPromptTimer];
      if (+[UIKeyboard presentsInlineTextCompletionAsMarkedText])
      {
        uint64_t v10 = [(UIInlineTextCompletionController *)self presentingTextCompletionAsMarkedText];

        if (v10)
        {
          m_textCompletionPrompt = [(UIInlineTextCompletionController *)self presentingTextCompletionAsMarkedText];
          [(UIInlineTextCompletionController *)self setPresentingTextCompletionAsMarkedText:0];
          uint64_t v12 = [(UIInlineTextCompletionController *)self delegate];
          [v12 removeTextCompletionFromMarkedText:m_textCompletionPrompt];

LABEL_14:
        }
      }
      else
      {
        unint64_t v13 = [(UIView *)self->m_textCompletionPrompt superview];

        if (v13)
        {
          [(UIView *)self->m_textCompletionPrompt removeFromSuperview];
          [(UIInlineTextCompletionPrompt *)self->m_textCompletionPrompt setDelegate:0];
          m_textCompletionPrompt = self->m_textCompletionPrompt;
          self->m_textCompletionPrompt = 0;
          goto LABEL_14;
        }
      }
      [(UIInlineTextCompletionController *)self setCandidateRemovedOnWillPerformOutput:0];
      textCompletion = self->_textCompletion;
      self->_textCompletion = 0;

      return;
    }
    unint64_t v15 = [(UIInlineTextCompletionController *)self acceptingTextCompletion];

    if (!v15) {
      goto LABEL_4;
    }
  }
}

- (void)_touchTextCompletionPromptTimer
{
  id v3 = [(UIInlineTextCompletionController *)self inputDelegate];

  if (v3)
  {
    id v4 = [(UIInlineTextCompletionController *)self textCompletionPromptTask];
    int v5 = [v4 isValid];

    if (v5)
    {
      id v9 = [(UIInlineTextCompletionController *)self textCompletionPromptTask];
      [v9 resetTimer];
    }
    else
    {
      uint64_t v6 = [(UIInlineTextCompletionController *)self delegate];
      uint64_t v7 = [v6 taskQueue];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __67__UIInlineTextCompletionController__touchTextCompletionPromptTimer__block_invoke;
      v10[3] = &unk_1E52E34C8;
      v10[4] = self;
      [(UIInlineTextCompletionController *)self _updatePromptDelay];
      id v8 = objc_msgSend(v7, "scheduleTask:timeInterval:repeats:", v10, 0);
      [(UIInlineTextCompletionController *)self setTextCompletionPromptTask:v8];
    }
  }
}

void __67__UIInlineTextCompletionController__touchTextCompletionPromptTimer__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) delegate];
  id v4 = [v3 autocorrectionController];

  if ([v4 hasAutocorrection]
    && ([v4 textCompletions], int v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = [*(id *)(a1 + 32) _bestTextCompletion];
    [*(id *)(a1 + 32) _updateTextCompletionPrompt:v6 executionContext:v7];
  }
  else
  {
    [v7 returnExecutionToParent];
  }
}

- (void)_clearTextCompletionPromptTimer
{
  id v3 = [(UIInlineTextCompletionController *)self textCompletionPromptTask];
  [v3 invalidate];

  [(UIInlineTextCompletionController *)self setTextCompletionPromptTask:0];
}

- (void)_touchInlineCompletionCoachingTimer
{
  id v3 = [(UIInlineTextCompletionController *)self inputDelegate];

  if (v3)
  {
    id v4 = [(UIInlineTextCompletionController *)self inlineCompletionCoachingTask];
    int v5 = [v4 isValid];

    if (v5)
    {
      id v9 = [(UIInlineTextCompletionController *)self inlineCompletionCoachingTask];
      [v9 resetTimer];
    }
    else
    {
      uint64_t v6 = [(UIInlineTextCompletionController *)self delegate];
      id v7 = [v6 taskQueue];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __71__UIInlineTextCompletionController__touchInlineCompletionCoachingTimer__block_invoke;
      v10[3] = &unk_1E52E34C8;
      v10[4] = self;
      id v8 = [v7 scheduleTask:v10 timeInterval:0 repeats:2.0];
      [(UIInlineTextCompletionController *)self setInlineCompletionCoachingTask:v8];
    }
  }
}

void __71__UIInlineTextCompletionController__touchInlineCompletionCoachingTimer__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) delegate];
  id v4 = [v3 autocorrectionController];

  if ([v4 hasAutocorrection]
    && ([v4 textCompletions], int v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    [*(id *)(a1 + 32) _presentInlineTextCompletionCoachingUIWithExecutionContext:v6];
  }
  else
  {
    [v6 returnExecutionToParent];
  }
}

- (void)_clearInlineCompletionCoachingTimer
{
  id v3 = [(UIInlineTextCompletionController *)self inlineCompletionCoachingTask];
  [v3 invalidate];

  [(UIInlineTextCompletionController *)self setInlineCompletionCoachingTask:0];
}

- (void)updateTextCompletionPrompt
{
  if (qword_1EB264998 != -1) {
    dispatch_once(&qword_1EB264998, &__block_literal_global_79_1);
  }
  id v3 = [(UIInlineTextCompletionController *)self delegate];
  id v4 = [v3 taskQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__UIInlineTextCompletionController_updateTextCompletionPrompt__block_invoke_3;
  v5[3] = &unk_1E52E34C8;
  v5[4] = self;
  [v4 performSingleTask:v5 breadcrumb:qword_1EB264990];
}

void __62__UIInlineTextCompletionController_updateTextCompletionPrompt__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_81_1 copy];
  v1 = (void *)qword_1EB264990;
  qword_1EB264990 = v0;
}

uint64_t __62__UIInlineTextCompletionController_updateTextCompletionPrompt__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __62__UIInlineTextCompletionController_updateTextCompletionPrompt__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateTextCompletionPromptExecutionContext:a2];
}

- (void)updateTextCompletionPromptExecutionContext:(id)a3
{
  id v10 = a3;
  if (+[UIKeyboard usesInputSystemUI]) {
    goto LABEL_2;
  }
  id v4 = [(UIInlineTextCompletionController *)self presentingTextCompletionAsMarkedText];
  if (v4)
  {
  }
  else
  {
    id v9 = [(UIInlineTextCompletionController *)self acceptingTextCompletion];

    if (v9)
    {
LABEL_2:
      [v10 returnExecutionToParent];
      goto LABEL_13;
    }
  }
  int v5 = [(UIInlineTextCompletionController *)self delegate];
  id v6 = [v5 autocorrectionController];

  id v7 = [v6 textCompletions];

  if (!v7) {
    goto LABEL_11;
  }
  if (![(UIInlineTextCompletionController *)self hasPrompt])
  {
    [(UIInlineTextCompletionController *)self _touchTextCompletionPromptTimer];
LABEL_11:
    [v10 returnExecutionToParent];
    goto LABEL_12;
  }
  id v8 = [(UIInlineTextCompletionController *)self _bestTextCompletion];
  [(UIInlineTextCompletionController *)self _updateTextCompletionPrompt:v8 executionContext:v10];

LABEL_12:
LABEL_13:
}

- (void)_updateTextCompletionPrompt:(id)a3 executionContext:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 candidate];
  id v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  else {
    uint64_t v11 = &stru_1ED0E84C0;
  }
  uint64_t v12 = v11;

  uint64_t v13 = [v7 input];
  uint64_t v14 = (void *)v13;
  if (v13) {
    unint64_t v15 = (__CFString *)v13;
  }
  else {
    unint64_t v15 = &stru_1ED0E84C0;
  }
  int v16 = v15;

  [(UIInlineTextCompletionController *)self setCandidateRemovedOnWillPerformOutput:0];
  [(UIInlineTextCompletionController *)self _clearTextCompletionPromptTimer];
  if ([(__CFString *)v12 length]
    && ![(__CFString *)v12 isEqualToString:v16])
  {
    textCompletion = self->_textCompletion;
    location = (id *)&self->_textCompletion;
    if (textCompletion)
    {
      unint64_t v21 = v8;
      uint64_t v22 = [(_UIInlineTextCompletion *)textCompletion candidate];
      char v23 = (void *)v22;
      if (v22) {
        id v24 = (__CFString *)v22;
      }
      else {
        id v24 = &stru_1ED0E84C0;
      }
      uint64_t v25 = v24;

      uint64_t v26 = [*location input];
      uint64_t v27 = (void *)v26;
      if (v26) {
        uint64_t v28 = (__CFString *)v26;
      }
      else {
        uint64_t v28 = &stru_1ED0E84C0;
      }
      v29 = v28;

      if ([(__CFString *)v25 isEqualToString:v12]
        && [(__CFString *)v29 isEqualToString:v16])
      {
        id v8 = v21;
        [v21 returnExecutionToParent];

        goto LABEL_15;
      }

      id v8 = v21;
    }
    unint64_t v30 = _UIKBInlineTextCompletionLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v48 = _shortCompletionDescr(v7);
      *(_DWORD *)buf = 138412290;
      v81 = v48;
      _os_log_debug_impl(&dword_1853B0000, v30, OS_LOG_TYPE_DEBUG, "Trying to present inline text completion: %@", buf, 0xCu);
    }
    if (![(UIInlineTextCompletionController *)self hasForwardProgress])
    {
      v34 = _UIKBInlineTextCompletionLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_DEFAULT, "Will not present text completion (no forward progress)", buf, 2u);
      }

      uint64_t v18 = self;
      uint64_t v19 = 9;
      goto LABEL_14;
    }
    uint64_t v31 = [(UIInlineTextCompletionController *)self delegate];
    v32 = [v31 documentState];

    v33 = [v32 markedText];
    if ([v33 length])
    {

LABEL_36:
      int v37 = _UIKBInlineTextCompletionLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_DEFAULT, "Will not present text completion (selected or marked text is not empty)", buf, 2u);
      }

      [(UIInlineTextCompletionController *)self _removeTextCompletionPromptForReason:10];
      [v8 returnExecutionToParent];
      goto LABEL_39;
    }
    [v32 selectedText];
    uint64_t v35 = v73 = v8;
    uint64_t v36 = [v35 length];

    id v8 = v73;
    if (v36) {
      goto LABEL_36;
    }
    v38 = [v32 contextAfterInput];
    BOOL v39 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v40 = [v38 stringByTrimmingCharactersInSet:v39];

    if ([v40 length])
    {
      uint64_t v41 = [v40 _firstLongCharacter];
      v42 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      LOBYTE(v41) = [v42 longCharacterIsMember:v41];

      if ((v41 & 1) == 0)
      {
        v49 = _UIKBInlineTextCompletionLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v49, OS_LOG_TYPE_DEFAULT, "Will not present text completion: contextAfterInput is not empty and has non-whitespace characters before the first newline", buf, 2u);
        }

        uint64_t v50 = self;
        uint64_t v51 = 10;
        goto LABEL_61;
      }
    }
    v43 = [(UIInlineTextCompletionController *)self inputDelegate];

    if (!v43)
    {
      v52 = _UIKBInlineTextCompletionLog();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v52, OS_LOG_TYPE_DEFAULT, "Will not present text completion: no input delegate", buf, 2u);
      }

      uint64_t v50 = self;
      uint64_t v51 = 13;
      goto LABEL_61;
    }
    __int16 v44 = [(UIInlineTextCompletionController *)self delegate];
    int v45 = [v44 isSelecting];

    if (v45)
    {
      uint64_t v46 = _UIKBInlineTextCompletionLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        long long v47 = "Will not present text completion: user is selecting text";
LABEL_56:
        _os_log_impl(&dword_1853B0000, v46, OS_LOG_TYPE_DEFAULT, v47, buf, 2u);
      }
    }
    else
    {
      if (![(UIInlineTextCompletionController *)self currentInlineTextCompletionMode])
      {
        long long v55 = _UIKBInlineTextCompletionLog();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v55, OS_LOG_TYPE_DEFAULT, "Will not present text completion: inline completion text completion mode for traits is NO", buf, 2u);
        }

        uint64_t v50 = self;
        uint64_t v51 = 12;
        goto LABEL_61;
      }
      v53 = [(UIInlineTextCompletionController *)self delegate];
      int v54 = [v53 showingEmojiSearch];

      if (!v54)
      {
        if (+[UIKeyboard presentsInlineTextCompletionAsMarkedText])
        {
          long long v56 = [(__CFString *)v12 substringFromIndex:[(__CFString *)v16 length]];
          long long v57 = _UIKBInlineTextCompletionLog();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            v58 = _shortCompletionDescr(v7);
            *(_DWORD *)buf = 138412290;
            v81 = v58;
            _os_log_impl(&dword_1853B0000, v57, OS_LOG_TYPE_DEFAULT, "Presenting inline text completion now: %@", buf, 0xCu);
          }
          id v59 = objc_alloc(MEMORY[0x1E4F28B18]);
          __int16 v60 = [(UIInlineTextCompletionController *)self _markedTextAttributes];
          v61 = (void *)[v59 initWithString:v56 attributes:v60];

          v62 = [MEMORY[0x1E4F95EF8] intermediateTextWithInputString:v56 displayString:v61 selectionLocation:0];
          [(UIInlineTextCompletionController *)self setPresentingTextCompletionAsMarkedText:v56];
          objc_storeStrong(location, a3);
          uint64_t v63 = [(UIInlineTextCompletionController *)self delegate];
          [v63 presentTextCompletionAsMarkedText:v62];

          v64 = [(UIInlineTextCompletionController *)self delegate];
          [v64 removeAutocorrectPrompt];

          [(UIInlineTextCompletionController *)self _touchInlineCompletionCoachingTimer];
          [v73 returnExecutionToParent];

          id v8 = v73;
        }
        else
        {
          v65 = v32;
          v66 = [(UIInlineTextCompletionController *)self delegate];
          v67 = [v66 inputDelegateManager];
          v68 = [v67 asyncCapableInputDelegate];

          if (v68)
          {
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke;
            aBlock[3] = &unk_1E52E36F0;
            id v76 = v68;
            v77 = v16;
            v78 = self;
            id v79 = v7;
            v69 = _Block_copy(aBlock);
            id v8 = v73;
            if (qword_1EB2649B8 != -1) {
              dispatch_once(&qword_1EB2649B8, &__block_literal_global_90_4);
            }
            v70 = [(UIInlineTextCompletionController *)self delegate];
            v71 = [v70 taskQueue];
            [v71 addTask:v69 breadcrumb:qword_1EB2649B0];

            [v73 returnExecutionToParent];
            v72 = v76;
          }
          else
          {
            v72 = [(UIInlineTextCompletionController *)self _textCompletionPromptRectsForInput:v16];
            [(UIInlineTextCompletionController *)self _updateTextCompletionPrompt:v7 inputRects:v72];
            id v8 = v73;
            [v73 returnExecutionToParent];
          }

          v32 = v65;
        }
        goto LABEL_62;
      }
      uint64_t v46 = _UIKBInlineTextCompletionLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        long long v47 = "Will not present text completion: showing emoji search";
        goto LABEL_56;
      }
    }

    uint64_t v50 = self;
    uint64_t v51 = 11;
LABEL_61:
    [(UIInlineTextCompletionController *)v50 _removeTextCompletionPromptForReason:v51];
    id v8 = v73;
    [v73 returnExecutionToParent];
LABEL_62:

LABEL_39:
    goto LABEL_15;
  }
  if (self->_textCompletion)
  {
    int v17 = _UIKBInlineTextCompletionLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEFAULT, "Removing text completion prompt (text completion is nil/empty)", buf, 2u);
    }
  }
  uint64_t v18 = self;
  uint64_t v19 = 4;
LABEL_14:
  [(UIInlineTextCompletionController *)v18 _removeTextCompletionPromptForReason:v19];
  [v8 returnExecutionToParent];
LABEL_15:
}

void __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke_2;
  v9[3] = &unk_1E530CB10;
  uint64_t v6 = a1[6];
  id v7 = (void *)a1[7];
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v7;
  id v8 = v3;
  [v4 requestAutocorrectionRectsForString:v5 withCompletionHandler:v9];
}

void __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (qword_1EB2649A8 != -1) {
    dispatch_once(&qword_1EB2649A8, &__block_literal_global_85_0);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke_5;
  v9[3] = &unk_1E52E3678;
  uint64_t v5 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v6 = (void *)a1[6];
  id v10 = v3;
  uint64_t v11 = v4;
  id v12 = v6;
  uint64_t v7 = qword_1EB2649A0;
  id v8 = v3;
  [v5 transferExecutionToMainThreadWithTask:v9 breadcrumb:v7];
}

void __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke_3()
{
  uint64_t v0 = [&__block_literal_global_87_0 copy];
  v1 = (void *)qword_1EB2649A0;
  qword_1EB2649A0 = v0;
}

uint64_t __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke_5(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (*(void *)(a1 + 32))
  {
    id v3 = [*(id *)(a1 + 40) delegate];
    [*(id *)(a1 + 32) firstRect];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [*(id *)(a1 + 32) lastRect];
    int v16 = objc_msgSend(v3, "textCompletionInputRectsFromFirstRect:lastRect:", v5, v7, v9, v11, v12, v13, v14, v15);
  }
  else
  {
    int v16 = 0;
  }
  [*(id *)(a1 + 40) _updateTextCompletionPrompt:*(void *)(a1 + 48) inputRects:v16];
  [v17 returnExecutionToParent];
}

void __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke_6()
{
  uint64_t v0 = [&__block_literal_global_92_1 copy];
  v1 = (void *)qword_1EB2649B0;
  qword_1EB2649B0 = v0;
}

uint64_t __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)_textCompletionPromptRectsForInput:(id)a3
{
  id v4 = a3;
  double v5 = [(UIInlineTextCompletionController *)self delegate];
  double v6 = [v5 rangeForTextCompletionInput:v4];

  if (!v6) {
    goto LABEL_5;
  }
  if (([v6 isEmpty] & 1) == 0)
  {
    uint64_t v28 = [(UIInlineTextCompletionController *)self inputDelegate];
    [v28 firstRectForRange:v6];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;

    int v37 = [(UIInlineTextCompletionController *)self inputDelegate];
    [v37 _lastRectForRange:v6];
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;

    id v17 = [(UIInlineTextCompletionController *)self delegate];
    uint64_t v18 = v17;
    double v19 = v30;
    double v20 = v32;
    double v21 = v34;
    double v22 = v36;
    double v23 = v39;
    double v24 = v41;
    double v25 = v43;
    double v26 = v45;
    goto LABEL_7;
  }
  if (![v6 isEmpty])
  {
LABEL_5:
    uint64_t v27 = 0;
    goto LABEL_8;
  }
  double v7 = [(UIInlineTextCompletionController *)self inputDelegate];
  double v8 = [v6 start];
  [v7 caretRectForPosition:v8];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  id v17 = [(UIInlineTextCompletionController *)self delegate];
  uint64_t v18 = v17;
  double v19 = v10;
  double v20 = v12;
  double v21 = v14;
  double v22 = v16;
  double v23 = v10;
  double v24 = v12;
  double v25 = v14;
  double v26 = v16;
LABEL_7:
  uint64_t v27 = objc_msgSend(v17, "textCompletionInputRectsFromFirstRect:lastRect:", v19, v20, v21, v22, v23, v24, v25, v26);

LABEL_8:
  return v27;
}

- (void)_updateTextCompletionPrompt:(id)a3 inputRects:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 candidate];
  double v9 = [v6 input];
  if (![v7 count])
  {
    double v19 = _UIKBInlineTextCompletionLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v20 = "Will not present text completion: missing rects for input text";
      double v21 = buf;
      goto LABEL_7;
    }
LABEL_8:

    [(UIInlineTextCompletionController *)self _removeTextCompletionPromptForReason:13];
    goto LABEL_15;
  }
  double v10 = [v7 lastObject];
  [v10 rect];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v29.origin.x = v12;
  v29.origin.y = v14;
  v29.size.width = v16;
  v29.size.height = v18;
  if (CGRectIsEmpty(v29))
  {
    double v19 = _UIKBInlineTextCompletionLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v27 = 0;
      double v20 = "Will not present text completion: input rect is empty";
      double v21 = (uint8_t *)&v27;
LABEL_7:
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, v20, v21, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  double v22 = [(UIInlineTextCompletionController *)self delegate];
  double v23 = [v22 inputOverlayContainer];

  if (v23)
  {
    double v24 = [(UIInlineTextCompletionController *)self delegate];
    [v24 updateKeyboardConfigurations];

    [(UIInlineTextCompletionController *)self _updateTextCompletionPromptWithTextCompletion:v6 parentView:v23 inputRects:v7];
  }
  else
  {
    double v25 = _UIKBInlineTextCompletionLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v26 = 0;
      _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_DEFAULT, "Will not present text completion: no input overlay container", v26, 2u);
    }

    [(UIInlineTextCompletionController *)self _removeTextCompletionPromptForReason:13];
  }

LABEL_15:
}

- (void)_updateTextCompletionPromptWithTextCompletion:(id)a3 parentView:(id)a4 inputRects:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  double v8 = (_UIInlineTextCompletion *)a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(_UIInlineTextCompletion *)v8 candidate];
  CGFloat v12 = [(_UIInlineTextCompletion *)v8 input];
  if ([(UIInlineTextCompletionController *)self _isCompletion:v8 continuingLastCompletion:self->_textCompletion])
  {
    double v13 = _UIKBInlineTextCompletionLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    CGFloat v14 = _shortCompletionDescr(v8);
    *(_DWORD *)double v38 = 138412290;
    *(void *)&v38[4] = v14;
    double v15 = "Continuing presentation of text completion: %@";
    goto LABEL_10;
  }
  if (self->_textCompletion)
  {
    CGFloat v16 = _UIKBInlineTextCompletionLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = _shortCompletionDescr(self->_textCompletion);
      *(_DWORD *)double v38 = 138412290;
      *(void *)&v38[4] = v17;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "User ignored discontinued text completion: %@", v38, 0xCu);
    }
  }
  double v13 = _UIKBInlineTextCompletionLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v14 = _shortCompletionDescr(v8);
    *(_DWORD *)double v38 = 138412290;
    *(void *)&v38[4] = v14;
    double v15 = "Presenting user with new text completion: %@";
LABEL_10:
    _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, v15, v38, 0xCu);
  }
LABEL_11:

  m_textCompletionPrompt = self->m_textCompletionPrompt;
  if (m_textCompletionPrompt)
  {
    id v19 = [(UIView *)m_textCompletionPrompt superview];

    if (v19 == v9) {
      goto LABEL_16;
    }
  }
  else
  {
    double v20 = [UIInlineTextCompletionPrompt alloc];
    double v21 = -[UIInlineTextCompletionPrompt initWithFrame:](v20, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v22 = self->m_textCompletionPrompt;
    self->m_textCompletionPrompt = v21;

    [(UIInlineTextCompletionPrompt *)self->m_textCompletionPrompt setDelegate:self];
  }
  objc_msgSend(v9, "addSubview:", self->m_textCompletionPrompt, *(_OWORD *)v38);
LABEL_16:
  double v23 = self->m_textCompletionPrompt;
  double v24 = [(UIInlineTextCompletionController *)self inputDelegate];
  double v25 = [v24 textInputView];
  [v25 _convertVisualAltitude:self->m_textCompletionPrompt toView:0.0];
  -[UIView _setVisualAltitude:](v23, "_setVisualAltitude:");

  double v26 = [v10 lastObject];

  [v26 rect];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  double v35 = self->m_textCompletionPrompt;
  double v36 = [(_UIInlineTextCompletion *)v8 completion];
  -[UIInlineTextCompletionPrompt setTextCompletion:inRect:](v35, "setTextCompletion:inRect:", v36, v28, v30, v32, v34);

  -[UIView setSize:](self->m_textCompletionPrompt, "setSize:", v32, v34);
  textCompletion = self->_textCompletion;
  self->_textCompletion = v8;
}

- (void)_presentInlineTextCompletionCoachingUIWithExecutionContext:(id)a3
{
  id v9 = a3;
  [(UIInlineTextCompletionController *)self _clearInlineCompletionCoachingTimer];
  if ([(UIInlineTextCompletionController *)self _shouldShowInlineTextCompletionCoachingUI])
  {
    id v4 = _UINSLocalizedStringWithDefaultValue(@"Inline Predictions", @"Inline Predictions");
    double v5 = _UINSLocalizedStringWithDefaultValue(@"Press space to input predictive text.", @"Press space to input predictive text.");
    id v6 = +[UIKeyboardImpl activeInstance];
    [v6 presentEducationTipWithTitle:v4 description:v5];

    id v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v8 = [v7 preferencesActions];
    [v8 didTriggerOneTimeAction:@"DidShowInlineCompletionEducationTip"];
  }
  [v9 returnExecutionToParent];
}

- (BOOL)_shouldShowInlineTextCompletionCoachingUI
{
  v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v3 = [v2 preferencesActions];
  char v4 = [v3 oneTimeActionCompleted:@"DidShowInlineCompletionEducationTip"];

  if (v4) {
    return 0;
  }
  id v6 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v7 = [v6 preferencesActions];
  double v8 = [v7 valueForPreferenceKey:@"InlineCompletionAcceptedBySpaceEventCount"];
  uint64_t v9 = [v8 integerValue];

  return v9 < 3;
}

- (void)_acceptTextCompletion:(id)a3 learningMode:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!+[UIKeyboard usesInputSystemUI])
  {
    double v8 = _UIKBInlineTextCompletionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = _shortCompletionDescr(v6);
      int v13 = 138412290;
      CGFloat v14 = v9;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "User accepted text completion: %@", (uint8_t *)&v13, 0xCu);
    }
    [(UIInlineTextCompletionController *)self setAcceptingTextCompletion:v6];
    if ((id)*MEMORY[0x1E4FAEA40] == v7)
    {
      id v10 = [(UIInlineTextCompletionController *)self analyticsDispatcher];
      [v10 setNextCandidateReplacementSource:7];
    }
    [(UIInlineTextCompletionController *)self _registerLearningForInlineCompletion:v6 learningMode:v7];
    double v11 = [(UIInlineTextCompletionController *)self delegate];
    CGFloat v12 = [v6 completion];
    [v11 acceptPredictiveInput:v12];

    [(UIInlineTextCompletionController *)self setAcceptingTextCompletion:0];
    [(UIInlineTextCompletionController *)self setLastAcceptedTextCompletion:v6];
    [(UIInlineTextCompletionController *)self _removeTextCompletionPromptForReason:2];
  }
}

- (BOOL)_shouldAcceptFirstWordOfCandidateForWordTerminator:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_1EB2649C8 != -1) {
    dispatch_once(&qword_1EB2649C8, &__block_literal_global_101_2);
  }
  if (+[UIKeyboard doesSpacebarAcceptFullInlineTextCompletion])
  {
    return 0;
  }
  double v5 = (void *)qword_1EB2649C0;
  return [v5 longCharacterIsMember:v3];
}

void __87__UIInlineTextCompletionController__shouldAcceptFirstWordOfCandidateForWordTerminator___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" "];
  v1 = (void *)qword_1EB2649C0;
  qword_1EB2649C0 = v0;
}

- (BOOL)_shouldAcceptUpToNextWordOfCandidateOnWordBoundaryForInteraction:(int64_t)a3
{
  return a3 == 1 || a3 == 4;
}

- (int64_t)_acceptTypeForTypeWordTerminator:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [v4 _rangeOfLongCharacterAtIndex:0];
    uint64_t v7 = v6;
    uint64_t v8 = [v4 length];
    int64_t v9 = 0;
    if (!v5 && v7 == v8)
    {
      if (-[UIInlineTextCompletionController _shouldAcceptFirstWordOfCandidateForWordTerminator:](self, "_shouldAcceptFirstWordOfCandidateForWordTerminator:", [v4 _firstLongCharacter]))
      {
        int64_t v9 = 2;
      }
      else
      {
        id v10 = [(UIInlineTextCompletionController *)self delegate];
        double v11 = [v10 inputManagerState];
        unsigned int v12 = [v11 stringEndsWord:v4];

        int64_t v9 = v12;
      }
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (int64_t)_acceptTypeForInteraction:(int64_t)a3 wordTerminator:(id)a4
{
  id v6 = a4;
  int64_t v7 = 1;
  if ((unint64_t)(a3 - 1) >= 2 && a3 != 4)
  {
    if (a3) {
      int64_t v7 = 0;
    }
    else {
      int64_t v7 = [(UIInlineTextCompletionController *)self _acceptTypeForTypeWordTerminator:v6];
    }
  }

  return v7;
}

- (void)acceptTextCompletion:(id)a3
{
}

- (void)acceptTextCompletionWithInteraction:(int64_t)a3 wordTerminator:(id)a4
{
  id v4 = [(UIInlineTextCompletionController *)self _acceptTextCompletionWithInteraction:a3 wordTerminator:a4];
}

- (id)_acceptTextCompletionWithInteraction:(int64_t)a3 wordTerminator:(id)a4
{
  int64_t v6 = [(UIInlineTextCompletionController *)self _acceptTypeForInteraction:a3 wordTerminator:a4];
  if (v6 == 2)
  {
    uint64_t v7 = [(UIInlineTextCompletionController *)self oneWordTextCompletion];
  }
  else
  {
    if (v6 != 1)
    {
      id v8 = 0;
      goto LABEL_11;
    }
    uint64_t v7 = [(UIInlineTextCompletionController *)self textCompletion];
  }
  id v8 = (id)v7;
  if (!v7)
  {
LABEL_11:
    double v11 = 0;
    goto LABEL_17;
  }
  if (![(UIInlineTextCompletionController *)self _doesFirstPredictedCharacterEndWord:v7])
  {
LABEL_13:
    id v8 = v8;
    goto LABEL_14;
  }
  if (![(UIInlineTextCompletionController *)self _shouldAcceptUpToNextWordOfCandidateOnWordBoundaryForInteraction:a3])
  {
    if (a3 != 2)
    {
      CGFloat v14 = [v8 completion];
      uint64_t v15 = [v8 input];
      CGFloat v16 = [v14 candidateByReplacingWithCandidate:v15];

      double v17 = [v8 source];
      CGFloat v18 = +[_UIInlineTextCompletion inlineTextCompletion:v16 source:v17];

      [(UIInlineTextCompletionController *)self _registerLearningForInlineCompletion:v18 learningMode:*MEMORY[0x1E4FAEA50]];
      id v19 = _UIKBInlineTextCompletionLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v20 = 0;
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "Will not accept proposed text completion: first predicted character ends words", v20, 2u);
      }

      goto LABEL_11;
    }
    goto LABEL_13;
  }
  int64_t v9 = [(UIInlineTextCompletionController *)self textCompletion];
  id v10 = [(UIInlineTextCompletionController *)self _upToNextWordTextCompletionFromTextCompletion:v9];

  id v8 = v10;
  if (!v8) {
    goto LABEL_11;
  }
LABEL_14:
  unsigned int v12 = (void *)MEMORY[0x1E4FAEA40];
  if (a3 != 2) {
    unsigned int v12 = (void *)MEMORY[0x1E4FAEA48];
  }
  [(UIInlineTextCompletionController *)self _acceptTextCompletion:v8 learningMode:*v12];
  double v11 = v8;
LABEL_17:

  return v11;
}

- (id)acceptTextCompletionWithInteraction:(int64_t)a3 wordTerminator:(id)a4 outputHandledByCaller:(BOOL)a5
{
  if (!a5)
  {
    id v10 = [(UIInlineTextCompletionController *)self _acceptTextCompletionWithInteraction:a3 wordTerminator:a4];
    double v11 = [v10 completion];
    goto LABEL_28;
  }
  int64_t v7 = [(UIInlineTextCompletionController *)self _acceptTypeForInteraction:a3 wordTerminator:a4];
  int64_t v8 = v7;
  if (v7 == 2)
  {
    uint64_t v9 = [(UIInlineTextCompletionController *)self oneWordTextCompletion];
  }
  else
  {
    if (v7 != 1)
    {
      id v10 = 0;
      goto LABEL_15;
    }
    uint64_t v9 = [(UIInlineTextCompletionController *)self textCompletion];
  }
  id v10 = (id)v9;
  if (v9)
  {
    if ([(UIInlineTextCompletionController *)self _doesFirstPredictedCharacterEndWord:v9])
    {
      if ([(UIInlineTextCompletionController *)self _shouldAcceptUpToNextWordOfCandidateOnWordBoundaryForInteraction:a3])
      {
        unsigned int v12 = [(UIInlineTextCompletionController *)self textCompletion];
        int v13 = [(UIInlineTextCompletionController *)self _upToNextWordTextCompletionFromTextCompletion:v12];

        CGFloat v14 = _UIKBInlineTextCompletionLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "Accepting up to next word of the full text completion", buf, 2u);
        }

        id v10 = v13;
        if (!v10) {
          goto LABEL_15;
        }
LABEL_24:
        double v20 = (void *)MEMORY[0x1E4FAEA40];
        if (a3 != 2) {
          double v20 = (void *)MEMORY[0x1E4FAEA48];
        }
        -[UIInlineTextCompletionController _registerLearningForInlineCompletion:learningMode:](self, "_registerLearningForInlineCompletion:learningMode:", v10, *v20, v28);
        [(UIInlineTextCompletionController *)self setLastAcceptedTextCompletion:v10];
        [(UIInlineTextCompletionController *)self _removeTextCompletionPromptForReason:2];
        uint64_t v15 = v10;
        goto LABEL_27;
      }
      if (a3 != 2)
      {
        double v22 = [v10 completion];
        double v23 = [v10 input];
        double v24 = [v22 candidateByReplacingWithCandidate:v23];

        double v25 = [v10 source];
        double v26 = +[_UIInlineTextCompletion inlineTextCompletion:v24 source:v25];

        [(UIInlineTextCompletionController *)self _registerLearningForInlineCompletion:v26 learningMode:*MEMORY[0x1E4FAEA50]];
        double v27 = _UIKBInlineTextCompletionLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v31 = 0;
          _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_DEFAULT, "Will not accept proposed text completion: first predicted character ends words", v31, 2u);
        }

        goto LABEL_15;
      }
    }
    CGFloat v16 = _UIKBInlineTextCompletionLog();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v8 == 2)
    {
      if (v17)
      {
        __int16 v29 = 0;
        CGFloat v18 = "Accepting one word of the text completion";
        id v19 = (uint8_t *)&v29;
LABEL_22:
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
      }
    }
    else if (v17)
    {
      LOWORD(v28) = 0;
      CGFloat v18 = "Accepting full text completion";
      id v19 = (uint8_t *)&v28;
      goto LABEL_22;
    }

    id v10 = v10;
    goto LABEL_24;
  }
LABEL_15:
  uint64_t v15 = 0;
LABEL_27:
  double v11 = [v15 completion];

LABEL_28:
  return v11;
}

- (id)_candidateToUndoAcceptedTextCompletion
{
  uint64_t v3 = [(UIInlineTextCompletionController *)self lastAcceptedTextCompletion];

  if (v3)
  {
    id v4 = [(UIInlineTextCompletionController *)self delegate];
    uint64_t v5 = [v4 documentState];

    uint64_t v6 = [v5 contextBeforeInput];
    int64_t v7 = (void *)v6;
    if (v6) {
      int64_t v8 = (__CFString *)v6;
    }
    else {
      int64_t v8 = &stru_1ED0E84C0;
    }
    uint64_t v9 = v8;

    id v10 = [(UIInlineTextCompletionController *)self lastAcceptedTextCompletion];
    uint64_t v11 = [v10 candidate];
    unsigned int v12 = (void *)v11;
    if (v11) {
      int v13 = (__CFString *)v11;
    }
    else {
      int v13 = &stru_1ED0E84C0;
    }
    CGFloat v14 = v13;

    uint64_t v15 = [v10 input];
    CGFloat v16 = (void *)v15;
    if (v15) {
      BOOL v17 = (__CFString *)v15;
    }
    else {
      BOOL v17 = &stru_1ED0E84C0;
    }
    CGFloat v18 = v17;

    id v19 = v14;
    if ([(__CFString *)v9 length])
    {
      uint64_t v20 = [(__CFString *)v9 _rangeOfLongCharacterAtIndex:[(__CFString *)v9 length] - 1];
      double v22 = -[__CFString substringWithRange:](v9, "substringWithRange:", v20, v21);
      double v23 = [(UIInlineTextCompletionController *)self delegate];
      double v24 = [v23 inputManagerState];
      int v25 = [v24 stringEndsWord:v22];

      double v26 = v19;
      if (v25)
      {
        double v26 = [(__CFString *)v19 stringByAppendingString:v22];
      }
      if ([(__CFString *)v9 hasSuffix:v26])
      {
        double v27 = [MEMORY[0x1E4FAE318] candidateWithCandidate:v18 forInput:v26];
        uint64_t v28 = [v10 source];
        __int16 v29 = +[_UIInlineTextCompletion inlineTextCompletion:v27 source:v28];
      }
      else
      {
        __int16 v29 = 0;
      }
    }
    else
    {
      __int16 v29 = 0;
      double v26 = v19;
    }
  }
  else
  {
    __int16 v29 = 0;
  }
  return v29;
}

- (BOOL)canUndoAcceptedTextCompletion
{
  if (![(UIInlineTextCompletionController *)self _deleteToUndoEnabled]) {
    return 0;
  }
  uint64_t v3 = [(UIInlineTextCompletionController *)self _candidateToUndoAcceptedTextCompletion];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)undoAcceptedTextCompletionExecutionContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UIInlineTextCompletionController *)self _candidateToUndoAcceptedTextCompletion];
  if (v5)
  {
    uint64_t v6 = _UIKBInlineTextCompletionLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v7 = [(UIInlineTextCompletionController *)self lastAcceptedTextCompletion];
      int64_t v8 = _shortCompletionDescr(v7);
      uint64_t v9 = _shortCompletionDescr(v5);
      *(_DWORD *)buf = 138412546;
      BOOL v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "Undo accepted text completion: (Accepted: %@, Undo: %@)", buf, 0x16u);
    }
    id v10 = [(UIInlineTextCompletionController *)self lastAcceptedTextCompletion];
    if (v10) {
      [(UIInlineTextCompletionController *)self _registerLearningForInlineCompletion:v10 learningMode:*MEMORY[0x1E4FAEA78]];
    }
    lastAcceptedTextCompletion = self->_lastAcceptedTextCompletion;
    self->_lastAcceptedTextCompletion = 0;

    [(UIInlineTextCompletionController *)self _removeTextCompletionPromptForReason:3];
    unsigned int v12 = [(UIInlineTextCompletionController *)self delegate];
    int v13 = [v5 completion];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__UIInlineTextCompletionController_undoAcceptedTextCompletionExecutionContext___block_invoke;
    v15[3] = &unk_1E52E34C8;
    void v15[4] = self;
    CGFloat v14 = [v4 childWithContinuation:v15];
    [v12 acceptPredictiveInput:v13 appendSeparator:0 executionContext:v14];
  }
  else
  {
    [v4 returnExecutionToParent];
  }
}

void __79__UIInlineTextCompletionController_undoAcceptedTextCompletionExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  [v3 setDeleting:1];
  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 generateCandidates];

  [v5 returnExecutionToParent];
}

- (void)_registerLearningForInlineCompletion:(id)a3 learningMode:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((id)*MEMORY[0x1E4FAEA48] == v7)
  {
    int64_t v8 = +[UIKeyboardPreferencesController sharedPreferencesController];
    uint64_t v9 = [v8 preferencesActions];
    id v10 = [v9 valueForPreferenceKey:@"InlineCompletionAcceptedBySpaceEventCount"];
    uint64_t v11 = [v10 integerValue];

    unsigned int v12 = +[UIKeyboardPreferencesController sharedPreferencesController];
    int v13 = [v12 preferencesActions];
    CGFloat v14 = [NSNumber numberWithInteger:v11 + 1];
    [v13 setValue:v14 forPreferenceKey:@"InlineCompletionAcceptedBySpaceEventCount"];
  }
  uint64_t v15 = [(UIInlineTextCompletionController *)self delegate];
  [v15 refreshKeyboardState];

  CGFloat v16 = [(UIInlineTextCompletionController *)self delegate];
  BOOL v17 = [v16 keyboardState];

  __int16 v18 = _UIKBInlineTextCompletionLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    double v23 = _shortCompletionDescr(v6);
    double v24 = [v6 source];
    int v25 = _shortCandidateDescr(v24);
    int v26 = 138412802;
    double v27 = v23;
    __int16 v28 = 2112;
    __int16 v29 = v25;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_debug_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEBUG, "Register learning for completion:%@ sourceCandidate:%@ mode:%@", (uint8_t *)&v26, 0x20u);
  }
  id v19 = [(UIInlineTextCompletionController *)self delegate];
  uint64_t v20 = [v19 inlineTextCompletionLearner];

  if (v20)
  {
    uint64_t v21 = [v6 completion];
    double v22 = [v6 source];
    [v20 registerLearning:v21 fullCandidate:v22 keyboardState:v17 mode:v7];
  }
  else
  {
    uint64_t v21 = _UIKBInlineTextCompletionLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "NOTE: inlineTextCompletionLearner not found", (uint8_t *)&v26, 2u);
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (NSString)presentingTextCompletionAsMarkedText
{
  return self->_presentingTextCompletionAsMarkedText;
}

- (void)setPresentingTextCompletionAsMarkedText:(id)a3
{
}

- (BOOL)currentlyAcceptingInlineCompletionByDirectTap
{
  return self->_currentlyAcceptingInlineCompletionByDirectTap;
}

- (void)setCurrentlyAcceptingInlineCompletionByDirectTap:(BOOL)a3
{
  self->_currentlyAcceptingInlineCompletionByDirectTap = a3;
}

- (UIKBAnalyticsDispatcher)analyticsDispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDispatcher);
  return (UIKBAnalyticsDispatcher *)WeakRetained;
}

- (void)setAnalyticsDispatcher:(id)a3
{
}

- (_UIInlineTextCompletion)textCompletion
{
  return self->_textCompletion;
}

- (UIKeyboardScheduledTask)textCompletionPromptTask
{
  return self->_textCompletionPromptTask;
}

- (void)setTextCompletionPromptTask:(id)a3
{
}

- (UIKeyboardScheduledTask)inlineCompletionCoachingTask
{
  return self->_inlineCompletionCoachingTask;
}

- (void)setInlineCompletionCoachingTask:(id)a3
{
}

- (_UIInlineTextCompletion)candidateRemovedOnWillPerformOutput
{
  return self->_candidateRemovedOnWillPerformOutput;
}

- (void)setCandidateRemovedOnWillPerformOutput:(id)a3
{
}

- (_UIInlineTextCompletion)acceptingTextCompletion
{
  return self->_acceptingTextCompletion;
}

- (void)setAcceptingTextCompletion:(id)a3
{
}

- (_UIInlineTextCompletion)lastAcceptedTextCompletion
{
  return self->_lastAcceptedTextCompletion;
}

- (void)setLastAcceptedTextCompletion:(id)a3
{
}

- (BOOL)isDeleting
{
  return self->_deleting;
}

- (void)setDeleting:(BOOL)a3
{
  self->_deleting = a3;
}

- (void)setHasForwardProgress:(BOOL)a3
{
  self->_hasForwardProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAcceptedTextCompletion, 0);
  objc_storeStrong((id *)&self->_acceptingTextCompletion, 0);
  objc_storeStrong((id *)&self->_candidateRemovedOnWillPerformOutput, 0);
  objc_storeStrong((id *)&self->_inlineCompletionCoachingTask, 0);
  objc_storeStrong((id *)&self->_textCompletionPromptTask, 0);
  objc_storeStrong((id *)&self->_textCompletion, 0);
  objc_destroyWeak((id *)&self->_analyticsDispatcher);
  objc_storeStrong((id *)&self->_presentingTextCompletionAsMarkedText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->m_textCompletionPrompt, 0);
}

@end