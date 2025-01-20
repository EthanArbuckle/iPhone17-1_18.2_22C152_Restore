@interface UIKeyboardAsyncTextSelectionController
@end

@implementation UIKeyboardAsyncTextSelectionController

void __82___UIKeyboardAsyncTextSelectionController_selectPositionAtPoint_executionContext___block_invoke(uint64_t a1)
{
  if (qword_1EB261E00 != -1) {
    dispatch_once(&qword_1EB261E00, &__block_literal_global_386);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82___UIKeyboardAsyncTextSelectionController_selectPositionAtPoint_executionContext___block_invoke_4;
  v4[3] = &unk_1E52E3880;
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  long long v6 = *(_OWORD *)(a1 + 56);
  [v2 transferExecutionToMainThreadWithTask:v4 breadcrumb:_MergedGlobals_1159];
}

void __82___UIKeyboardAsyncTextSelectionController_selectPositionAtPoint_executionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_3_3 copy];
  v1 = (void *)_MergedGlobals_1159;
  _MergedGlobals_1159 = v0;
}

uint64_t __82___UIKeyboardAsyncTextSelectionController_selectPositionAtPoint_executionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __82___UIKeyboardAsyncTextSelectionController_selectPositionAtPoint_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v17 = a2;
  v3 = [*(id *)(a1 + 32) inputDelegate];
  v4 = [v3 selectedTextRange];
  id v5 = [v4 start];
  [*(id *)(a1 + 32) setCursorPosition:v5];

  [*(id *)(a1 + 32) setSelectionGranularity:0];
  int v6 = [*(id *)(a1 + 40) conformsToProtocolCached:&unk_1ED7009A0];
  v7 = *(void **)(a1 + 40);
  if (v6)
  {
    if (![v7 hasMarkedText]) {
      goto LABEL_10;
    }
    id v8 = *(id *)(a1 + 40);
    objc_msgSend(v8, "updateCurrentSelectionTo:fromGesture:inState:", 14, 2, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v9 = [*(id *)(a1 + 32) inputDelegate];
    v10 = [v9 inputDelegate];
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0) {
      goto LABEL_9;
    }
    v12 = [*(id *)(a1 + 32) inputDelegate];
    v13 = [v12 inputDelegate];
    [v13 didChangePhraseBoundary];

LABEL_8:
LABEL_9:

    goto LABEL_10;
  }
  [v7 conformsToProtocolCached:&unk_1ED6D1028];
  if ([*(id *)(a1 + 40) hasMarkedText])
  {
    objc_msgSend(*(id *)(a1 + 40), "changeSelectionWithGestureAt:withGesture:withState:", 14, 2, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v14 = [*(id *)(a1 + 32) inputDelegate];
    v15 = [v14 inputDelegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v8 = [*(id *)(a1 + 32) inputDelegate];
      v12 = [v8 inputDelegate];
      [v12 didChangePhraseBoundary];
      goto LABEL_8;
    }
  }
LABEL_10:
  [v17 returnExecutionToParent];
}

uint64_t __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke(uint64_t a1)
{
  if (qword_1EB261E10 != -1) {
    dispatch_once(&qword_1EB261E10, &__block_literal_global_377_0);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_4;
  v4[3] = &unk_1E52E34C8;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [v2 transferExecutionToMainThreadWithTask:v4 breadcrumb:qword_1EB261E08];
}

void __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_379_2 copy];
  v1 = (void *)qword_1EB261E08;
  qword_1EB261E08 = v0;
}

uint64_t __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v8 = a2;
  v4 = [v3 inputDelegate];
  id v5 = [v4 selectedTextRange];
  int v6 = [v5 start];
  [*(id *)(a1 + 32) setCursorPosition:v6];

  [*(id *)(a1 + 32) setSelectionGranularity:0];
  v7 = [*(id *)(a1 + 32) interactionAssistant];
  [v7 scrollSelectionToVisible:0];

  [v8 returnExecutionToParent];
}

uint64_t __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_5(uint64_t a1)
{
  if (qword_1EB261E20 != -1) {
    dispatch_once(&qword_1EB261E20, &__block_literal_global_381_3);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_8;
  v4[3] = &unk_1E52E34C8;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [v2 transferExecutionToMainThreadWithTask:v4 breadcrumb:qword_1EB261E18];
}

void __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_6()
{
  uint64_t v0 = [&__block_literal_global_383_0 copy];
  v1 = (void *)qword_1EB261E18;
  qword_1EB261E18 = v0;
}

uint64_t __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_8(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v8 = a2;
  v4 = [v3 inputDelegate];
  id v5 = [v4 selectedTextRange];
  int v6 = [v5 start];
  [*(id *)(a1 + 32) setCursorPosition:v6];

  [*(id *)(a1 + 32) setSelectionGranularity:0];
  v7 = [*(id *)(a1 + 32) interactionAssistant];
  [v7 scrollSelectionToVisible:0];

  [v8 returnExecutionToParent];
}

uint64_t __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_9(uint64_t a1)
{
  if (qword_1EB261E30 != -1) {
    dispatch_once(&qword_1EB261E30, &__block_literal_global_385_1);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_12;
  v4[3] = &unk_1E52E34C8;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [v2 transferExecutionToMainThreadWithTask:v4 breadcrumb:qword_1EB261E28];
}

void __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_10()
{
  uint64_t v0 = [&__block_literal_global_387_2 copy];
  v1 = (void *)qword_1EB261E28;
  qword_1EB261E28 = v0;
}

uint64_t __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_12(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v8 = a2;
  v4 = [v3 inputDelegate];
  id v5 = [v4 selectedTextRange];
  int v6 = [v5 start];
  [*(id *)(a1 + 32) setCursorPosition:v6];

  [*(id *)(a1 + 32) setSelectionGranularity:0];
  v7 = [*(id *)(a1 + 32) interactionAssistant];
  [v7 scrollSelectionToVisible:0];

  [v8 returnExecutionToParent];
}

unsigned char *__94___UIKeyboardAsyncTextSelectionController_selectTextWithGranularity_atPoint_executionContext___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (qword_1EB261E40 != -1) {
      dispatch_once(&qword_1EB261E40, &__block_literal_global_389_1);
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __94___UIKeyboardAsyncTextSelectionController_selectTextWithGranularity_atPoint_executionContext___block_invoke_4;
    v6[3] = &unk_1E52E3F00;
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 48);
    v6[4] = *(void *)(a1 + 40);
    v6[5] = v3;
    return (unsigned char *)[v2 transferExecutionToMainThreadWithTask:v6 breadcrumb:qword_1EB261E38];
  }
  else
  {
    [*(id *)(a1 + 40) setSelectionGranularity:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) showSelectionView];
    id v5 = [*(id *)(a1 + 40) selectionInteractionAssistant];
    [v5 updateSelectionRects:1];

    [*(id *)(a1 + 40) scrollSelectionToVisible];
    result = *(unsigned char **)(a1 + 40);
    if (result[96])
    {
      return (unsigned char *)[result showSelectionCommands];
    }
  }
  return result;
}

void __94___UIKeyboardAsyncTextSelectionController_selectTextWithGranularity_atPoint_executionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_391_1 copy];
  v1 = (void *)qword_1EB261E38;
  qword_1EB261E38 = v0;
}

uint64_t __94___UIKeyboardAsyncTextSelectionController_selectTextWithGranularity_atPoint_executionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __94___UIKeyboardAsyncTextSelectionController_selectTextWithGranularity_atPoint_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  [v4 setSelectionGranularity:v3];
  [*(id *)(a1 + 32) scrollSelectionToVisible];
  [v5 returnExecutionToParent];
}

uint64_t __95___UIKeyboardAsyncTextSelectionController_selectTextWithGranularity_atPoint_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56) == 1 && [*(id *)(a1 + 32) isEmpty])
  {
    v2 = [*(id *)(a1 + 40) inputDelegate];
    uint64_t v3 = [v2 _rangeOfSmartSelectionIncludingRange:*(void *)(a1 + 32)];

    if (v3 && ([v3 isEmpty] & 1) == 0)
    {
      v4 = [*(id *)(a1 + 40) inputDelegate];
      [v4 setSelectedTextRange:v3];
    }
  }
  [*(id *)(a1 + 40) setSelectionGranularity:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) showSelectionView];
  id v5 = [*(id *)(a1 + 40) selectionInteractionAssistant];
  [v5 updateSelectionRects:1];

  [*(id *)(a1 + 40) scrollSelectionToVisible];
  int v6 = *(unsigned char **)(a1 + 40);
  if (v6[96]) {
    [v6 showSelectionCommands];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

uint64_t __132___UIKeyboardAsyncTextSelectionController_beginSelectionWithBaseAtSelectionBoundaryInDirection_initialExtentPoint_executionContext___block_invoke(uint64_t a1, char a2)
{
  if (qword_1EB261E50 != -1) {
    dispatch_once(&qword_1EB261E50, &__block_literal_global_396);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __132___UIKeyboardAsyncTextSelectionController_beginSelectionWithBaseAtSelectionBoundaryInDirection_initialExtentPoint_executionContext___block_invoke_4;
  v6[3] = &unk_1E52E4108;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  char v7 = a2;
  return [v4 transferExecutionToMainThreadWithTask:v6 breadcrumb:qword_1EB261E48];
}

void __132___UIKeyboardAsyncTextSelectionController_beginSelectionWithBaseAtSelectionBoundaryInDirection_initialExtentPoint_executionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_398 copy];
  v1 = (void *)qword_1EB261E48;
  qword_1EB261E48 = v0;
}

uint64_t __132___UIKeyboardAsyncTextSelectionController_beginSelectionWithBaseAtSelectionBoundaryInDirection_initialExtentPoint_executionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __132___UIKeyboardAsyncTextSelectionController_beginSelectionWithBaseAtSelectionBoundaryInDirection_initialExtentPoint_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v16 = a2;
  v4 = [v3 inputDelegate];
  id v5 = [*(id *)(a1 + 32) inputDelegate];
  int v6 = [v5 selectedTextRange];
  char v7 = [v6 start];
  [v4 caretRectForPosition:v7];

  id v8 = [*(id *)(a1 + 32) inputDelegate];
  v9 = [*(id *)(a1 + 32) inputDelegate];
  v10 = [v9 selectedTextRange];
  char v11 = [v10 end];
  [v8 caretRectForPosition:v11];

  LODWORD(v10) = *(unsigned __int8 *)(a1 + 40);
  v12 = [*(id *)(a1 + 32) inputDelegate];
  v13 = [v12 selectedTextRange];
  v14 = v13;
  if (v10) {
    [v13 end];
  }
  else {
  v15 = [v13 start];
  }
  [*(id *)(a1 + 32) setCursorPosition:v15];

  [*(id *)(a1 + 32) setSelectionGranularity:0];
  [v16 returnExecutionToParent];
}

uint64_t __91___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_executionContext___block_invoke(uint64_t a1, char a2)
{
  if (qword_1EB261E60 != -1) {
    dispatch_once(&qword_1EB261E60, &__block_literal_global_401_0);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_executionContext___block_invoke_4;
  v6[3] = &unk_1E52E4108;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  char v7 = a2;
  return [v4 transferExecutionToMainThreadWithTask:v6 breadcrumb:qword_1EB261E58];
}

void __91___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_executionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_403_0 copy];
  v1 = (void *)qword_1EB261E58;
  qword_1EB261E58 = v0;
}

uint64_t __91___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_executionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __91___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v16 = a2;
  v4 = [v3 inputDelegate];
  id v5 = [*(id *)(a1 + 32) inputDelegate];
  int v6 = [v5 selectedTextRange];
  char v7 = [v6 start];
  [v4 caretRectForPosition:v7];

  id v8 = [*(id *)(a1 + 32) inputDelegate];
  v9 = [*(id *)(a1 + 32) inputDelegate];
  v10 = [v9 selectedTextRange];
  char v11 = [v10 end];
  [v8 caretRectForPosition:v11];

  LODWORD(v10) = *(unsigned __int8 *)(a1 + 40);
  v12 = [*(id *)(a1 + 32) inputDelegate];
  v13 = [v12 selectedTextRange];
  v14 = v13;
  if (v10) {
    [v13 end];
  }
  else {
  v15 = [v13 start];
  }
  [*(id *)(a1 + 32) setCursorPosition:v15];

  [*(id *)(a1 + 32) setSelectionGranularity:0];
  [v16 returnExecutionToParent];
}

uint64_t __104___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_withBoundary_executionContext___block_invoke(uint64_t a1, char a2)
{
  if (qword_1EB261E70 != -1) {
    dispatch_once(&qword_1EB261E70, &__block_literal_global_408_0);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __104___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_withBoundary_executionContext___block_invoke_4;
  v6[3] = &unk_1E52E4108;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  char v7 = a2;
  return [v4 transferExecutionToMainThreadWithTask:v6 breadcrumb:qword_1EB261E68];
}

void __104___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_withBoundary_executionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_410 copy];
  v1 = (void *)qword_1EB261E68;
  qword_1EB261E68 = v0;
}

uint64_t __104___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_withBoundary_executionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __104___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_withBoundary_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = *(void **)(a1 + 32);
  id v9 = a2;
  id v5 = [v4 inputDelegate];
  int v6 = [v5 selectedTextRange];
  char v7 = v6;
  if (v3) {
    [v6 end];
  }
  else {
  id v8 = [v6 start];
  }
  [*(id *)(a1 + 32) setCursorPosition:v8];

  [*(id *)(a1 + 32) setSelectionGranularity:0];
  [v9 returnExecutionToParent];
}

@end