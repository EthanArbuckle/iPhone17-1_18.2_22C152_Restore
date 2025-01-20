@interface UIKeyboardArbiterClientInputUIHost
@end

@implementation UIKeyboardArbiterClientInputUIHost

void __51___UIKeyboardArbiterClientInputUIHost_arbiterProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = KeyboardArbiterClientLog_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputUIHost arbiterProxy]_block_invoke  Failed to access remote service: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __56___UIKeyboardArbiterClientInputUIHost_snapsShotKeyboard__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) resetSnapshotWithWindowCheck:0];
  id v2 = [*(id *)(a1 + 32) kbUIStateDelegate];
  v3 = [v2 keyboardWindow];
  int v4 = [v3 snapshotView];
  [*(id *)(a1 + 32) setKeyboardSnapshot:v4];

  id v5 = [*(id *)(a1 + 32) keyboardSnapshot];
  [v5 setUserInteractionEnabled:0];

  uint64_t v6 = [*(id *)(a1 + 32) keyboardSnapshot];
  v7 = [v6 layer];
  [v7 setAllowsHitTesting:0];

  id v10 = [*(id *)(a1 + 32) kbUIStateDelegate];
  v8 = [v10 keyboardWindow];
  v9 = [*(id *)(a1 + 32) keyboardSnapshot];
  [v8 addSubview:v9];
}

void __69___UIKeyboardArbiterClientInputUIHost_inputSessionDidEndUnexpectedly__block_invoke(uint64_t a1)
{
  id v2 = [_UIKeyboardUIInformation alloc];
  v3 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:](v2, "initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:", 0, 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [*(id *)(a1 + 32) setCurrentUIState:v3];
}

void __81___UIKeyboardArbiterClientInputUIHost_keyboardSendNotification_withInfo_isStart___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81___UIKeyboardArbiterClientInputUIHost_keyboardSendNotification_withInfo_isStart___block_invoke_2;
  block[3] = &unk_1E52DC308;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __81___UIKeyboardArbiterClientInputUIHost_keyboardSendNotification_withInfo_isStart___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeKeyboardChange];
}

void __93___UIKeyboardArbiterClientInputUIHost_keyboardVisibilityDidChangeWithFrame_visible_tracking___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93___UIKeyboardArbiterClientInputUIHost_keyboardVisibilityDidChangeWithFrame_visible_tracking___block_invoke_2;
  block[3] = &unk_1E52DC308;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __93___UIKeyboardArbiterClientInputUIHost_keyboardVisibilityDidChangeWithFrame_visible_tracking___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeKeyboardChange];
}

uint64_t __93___UIKeyboardArbiterClientInputUIHost_keyboardVisibilityDidChangeWithFrame_visible_tracking___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _clearPreservedInputViewsWithId:0x1ED117C40 clearKeyboard:0];
}

void __61___UIKeyboardArbiterClientInputUIHost_completeKeyboardChange__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) arbiterProxy];
  [v1 signalKeyboardChangeComplete];
}

@end