@interface SBXXAcquireFocusPreventingFullScreenPresentationAssertion
@end

@implementation SBXXAcquireFocusPreventingFullScreenPresentationAssertion

void ___SBXXAcquireFocusPreventingFullScreenPresentationAssertion_block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Disabling certain system gestures for assertion with reason=%@", buf, 0xCu);
  }

  v4 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F33478B0];
  v5 = +[SBSystemGestureManager mainDisplayManager];
  v6 = [v5 acquireSystemGestureDisableAssertionForReason:*(void *)(a1 + 32) forSystemGestureTypes:v4];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F4F770]) initWithPort:*(unsigned int *)(a1 + 40)];
  v8 = (void *)MEMORY[0x1E4F4F7E0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___SBXXAcquireFocusPreventingFullScreenPresentationAssertion_block_invoke_175;
  v10[3] = &unk_1E6AF5290;
  id v11 = *(id *)(a1 + 32);
  id v12 = v6;
  id v9 = v6;
  [v8 monitorSendRight:v7 withHandler:v10];
}

void ___SBXXAcquireFocusPreventingFullScreenPresentationAssertion_block_invoke_175(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = ___SBXXAcquireFocusPreventingFullScreenPresentationAssertion_block_invoke_2;
  v2[3] = &unk_1E6AF5290;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t ___SBXXAcquireFocusPreventingFullScreenPresentationAssertion_block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Re-enabling certain system gestures for assertion with reason=%@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) invalidate];
}

@end