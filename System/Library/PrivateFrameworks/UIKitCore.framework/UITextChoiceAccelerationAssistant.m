@interface UITextChoiceAccelerationAssistant
@end

@implementation UITextChoiceAccelerationAssistant

void __72___UITextChoiceAccelerationAssistant_createPromptWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained updateDocumentFromPrompt:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

UIColor *__59___UITextChoiceAccelerationAssistant_defaultUnderlineColor__block_invoke(uint64_t a1, void *a2)
{
  double v3 = dbl_186B96870[[a2 userInterfaceStyle] == 2];
  double v4 = *(double *)(a1 + 32);
  double v5 = v3 + *(double *)(a1 + 40) * fmin(v3, 1.0 - v3);
  double v6 = 0.0;
  if (v5 != 0.0) {
    double v6 = 1.0 - v3 / v5 + 1.0 - v3 / v5;
  }
  return +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v4, v6);
}

void __96___UITextChoiceAccelerationAssistant_showPromptForReplacementCandidate_originalCandidate_delay___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textChoices];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      double v5 = [*(id *)(a1 + 48) prompt];
      [v5 setCandidate:v4];

      double v6 = [*(id *)(a1 + 48) delegate];
      v7 = [v6 keyboardState];
      v8 = [v7 secureCandidateRenderTraits];
      [v8 singleCellHeight];
      double v10 = v9;
      v11 = [*(id *)(a1 + 48) prompt];
      [v11 setSecureCandidateHeight:v10];
    }
    if ([*(id *)(a1 + 48) usingCustomInteraction])
    {
      v12 = [*(id *)(a1 + 48) textInputResponder];
      if (v12)
      {
        uint64_t v13 = *(void *)(a1 + 56);

        if (v13)
        {
          v14 = [*(id *)(a1 + 48) delegate];
          v15 = [*(id *)(a1 + 48) textInputResponder];
          [v14 updateTextChoicePromptSelection:v15 toRange:*(void *)(a1 + 56)];

          [*(id *)(a1 + 48) updateSelectionHighlights];
        }
      }
    }
    uint64_t v16 = *(void *)(a1 + 32);
    v17 = [*(id *)(a1 + 48) prompt];
    [v17 setReplacement:v16];

    v18 = [*(id *)(a1 + 48) prompt];
    v19 = [*(id *)(a1 + 32) candidateChoices];
    uint64_t v20 = *(void *)(a1 + 64);
    v21 = [*(id *)(a1 + 48) textInputView];
    [v18 updateWithChoices:v19 fromParentView:v20 referenceTextView:v21 presentedFromRect:*(void *)(a1 + 72) textHighlightColor:0];

    v22 = *(void **)(a1 + 48);
    v23 = [v22 prompt];
    [v22 updatePrompt:v23 forReplacementCandidate:*(void *)(a1 + 32)];

    v24 = *(void **)(a1 + 48);
    [v24 setupPassthroughContainer];
  }
}

void __97___UITextChoiceAccelerationAssistant_shouldShowPromptForWebKitText_atPosition_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) rangeOfAutocorrectionForString:*(void *)(a1 + 40) atPosition:*(void *)(a1 + 48) inDocument:a2];
  (*(void (**)(void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v3 != 0);
}

void __93___UITextChoiceAccelerationAssistant_fullAutocorrectionForWord_atPosition_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "rangeOfAutocorrectionForString:atPosition:inDocument:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  if (v3
    && ([v15 fullText],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        unint64_t v5 = [v4 length],
        uint64_t v6 = [v3 rangeValue],
        unint64_t v8 = v6 + v7,
        v4,
        v5 >= v8))
  {
    double v9 = [v15 fullText];
    uint64_t v10 = [v3 rangeValue];
    v12 = objc_msgSend(v9, "substringWithRange:", v10, v11);

    if (v12)
    {
      uint64_t v13 = [*(id *)(a1 + 32) underlinedWordData];
      v14 = [v13 objectForKey:v12];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __157___UITextChoiceAccelerationAssistant_decorateTextInRanges_replacementText_allowAutomaticReplacement_autoHide_voiceCommandTrackingUUID_withCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateSelectionHighlights];
  v2 = [*(id *)(a1 + 40) replacement];
  id v6 = [v2 revertText];

  id v3 = [*(id *)(a1 + 40) replacement];
  uint64_t v4 = [v3 textChoices];
  unint64_t v5 = [v4 firstObject];

  [*(id *)(a1 + 32) updateDocumentFromPrompt:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

uint64_t __157___UITextChoiceAccelerationAssistant_decorateTextInRanges_replacementText_allowAutomaticReplacement_autoHide_voiceCommandTrackingUUID_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetDictationChoices];
}

uint64_t __198___UITextChoiceAccelerationAssistant_decorateTextInRects_targetTextArray_replacementText_deltaRanges_originalSelectedRange_allowAutomaticReplacement_autoHide_voiceCommandUUID_withCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateSelectionHighlights];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 updateDocumentFromPrompt:v3 completionHandler:v4];
}

uint64_t __198___UITextChoiceAccelerationAssistant_decorateTextInRects_targetTextArray_replacementText_deltaRanges_originalSelectedRange_allowAutomaticReplacement_autoHide_voiceCommandUUID_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) resetDictationChoices];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end