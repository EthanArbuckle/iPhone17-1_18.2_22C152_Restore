@interface SBWorkspaceActivateSpringBoardWithResult
@end

@implementation SBWorkspaceActivateSpringBoardWithResult

uint64_t ____SBWorkspaceActivateSpringBoardWithResult_block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 72))
  {
LABEL_2:
    v4 = [(id)SBApp lockOutController];
    v5 = [*(id *)(a1 + 48) authenticationStatusProvider];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(id)SBApp authenticationController];
    }
    v9 = v7;

    v10 = [*(id *)(a1 + 48) uiLockStateProvider];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = +[SBLockScreenManager sharedInstance];
    }
    v13 = v12;

    if (([v4 isBlocked] & 1) != 0 || !objc_msgSend(v9, "isAuthenticated")) {
      int v14 = 1;
    }
    else {
      int v14 = [v13 isUILocked];
    }
    if (objc_opt_respondsToSelector()) {
      int v15 = [v13 isUIUnlocking] ^ 1;
    }
    else {
      int v15 = 1;
    }
    if ((v14 & v15) == 1)
    {
      v16 = v24;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v17 = ____SBWorkspaceActivateSpringBoardWithResult_block_invoke_5;
    }
    else
    {
      v16 = v23;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v17 = ____SBWorkspaceActivateSpringBoardWithResult_block_invoke_6;
    }
    v16[2] = v17;
    v16[3] = &unk_1E6AF60E8;
    v16[4] = *(id *)(a1 + 32);
    v16[5] = *(id *)(a1 + 56);
    [v3 setTransactionProvider:v16];

    uint64_t v18 = 1;
    goto LABEL_22;
  }
  if (*(unsigned char *)(a1 + 73))
  {
    v8 = [*(id *)(a1 + 32) transientOverlayPresentationManager];
    if ([v8 hasActivePresentation])
    {

      goto LABEL_2;
    }
    uint64_t v20 = [*(id *)(a1 + 40) unlockedEnvironmentMode];

    if (v20 == 3) {
      goto LABEL_2;
    }
  }
  else if ([*(id *)(a1 + 40) unlockedEnvironmentMode] == 3)
  {
    goto LABEL_2;
  }
  uint64_t v21 = *(void *)(a1 + 64);
  if (v21) {
    (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
  }
  uint64_t v22 = *(void *)(a1 + 56);
  if (v22) {
    (*(void (**)(uint64_t, void))(v22 + 16))(v22, 0);
  }
  uint64_t v18 = 0;
LABEL_22:

  return v18;
}

id ____SBWorkspaceActivateSpringBoardWithResult_block_invoke_6(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _selectTransactionForAppActivationRequest:a2];
  [v3 setCompletionBlock:*(void *)(a1 + 40)];
  return v3;
}

void ____SBWorkspaceActivateSpringBoardWithResult_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setResultBlock:v2];
  id v4 = +[SBWorkspaceEntity entity];
  [v3 setActivatingEntity:v4];
}

void ____SBWorkspaceActivateSpringBoardWithResult_block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) currentTransaction];
  [v1 failWithReason:@"force activate SpringBoard"];
}

uint64_t ____SBWorkspaceActivateSpringBoardWithResult_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) interruptWithReason:@"home"];
}

id ____SBWorkspaceActivateSpringBoardWithResult_block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _selectTransactionForReturningToTheLockScreenWithRequest:a2];
  [v3 setCompletionBlock:*(void *)(a1 + 40)];
  return v3;
}

@end