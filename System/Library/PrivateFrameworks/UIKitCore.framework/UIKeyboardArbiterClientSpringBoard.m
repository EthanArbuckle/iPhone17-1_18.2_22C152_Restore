@interface UIKeyboardArbiterClientSpringBoard
@end

@implementation UIKeyboardArbiterClientSpringBoard

void __56___UIKeyboardArbiterClientSpringBoard_forceKeyboardAway__block_invoke(uint64_t a1)
{
  v2 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56___UIKeyboardArbiterClientSpringBoard_forceKeyboardAway__block_invoke_2;
  v4[3] = &unk_1E52D9F98;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 performAsync:v4];
}

uint64_t __56___UIKeyboardArbiterClientSpringBoard_forceKeyboardAway__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didHandleKeyboardClientChange:*(void *)(a1 + 40) shouldConsiderSnapshottingKeyboard:0 isLocalEvent:1];
}

void __62___UIKeyboardArbiterClientSpringBoard_preserveKeyboardWithId___block_invoke(uint64_t a1)
{
  v2 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62___UIKeyboardArbiterClientSpringBoard_preserveKeyboardWithId___block_invoke_2;
  v4[3] = &unk_1E52D9F98;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 performAsync:v4];
}

uint64_t __62___UIKeyboardArbiterClientSpringBoard_preserveKeyboardWithId___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didHandleKeyboardClientChange:*(void *)(a1 + 40) shouldConsiderSnapshottingKeyboard:0 isLocalEvent:1];
}

void __61___UIKeyboardArbiterClientSpringBoard_restoreKeyboardWithId___block_invoke(uint64_t a1)
{
  v2 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61___UIKeyboardArbiterClientSpringBoard_restoreKeyboardWithId___block_invoke_2;
  v4[3] = &unk_1E52D9F98;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 performAsync:v4];
}

uint64_t __61___UIKeyboardArbiterClientSpringBoard_restoreKeyboardWithId___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didHandleKeyboardClientChange:*(void *)(a1 + 40) shouldConsiderSnapshottingKeyboard:0 isLocalEvent:1];
}

uint64_t __75___UIKeyboardArbiterClientSpringBoard_queue_keyboardIAVChanged_onComplete___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHeightForRemoteIAVPlaceholderIfNecessary:*(double *)(a1 + 48)];
  if (([*(id *)(a1 + 32) keyboardVisible] & 1) == 0
    && [*(id *)(a1 + 32) currentInputDestination])
  {
    [*(id *)(a1 + 32) setUpdatingHeight:1];
    v2 = +[UIPeripheralHost sharedInstance];
    [v2 forceReloadInputViews];

    [*(id *)(a1 + 32) setUpdatingHeight:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

@end