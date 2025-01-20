@interface UISceneSnapshotBSActionsHandler
@end

@implementation UISceneSnapshotBSActionsHandler

uint64_t __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id location = 0;
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = +[UISnapshottingAssertionManager sharedInstance];
    v3 = [v2 acquireNewAssertion];

    objc_storeWeak(&location, v3);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_3;
  aBlock[3] = &unk_1E53113E0;
  id v21 = *(id *)(a1 + 32);
  char v24 = *(unsigned char *)(a1 + 56);
  objc_copyWeak(&v23, &location);
  id v22 = *(id *)(a1 + 40);
  v4 = _Block_copy(aBlock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(a1 + 48);
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v9 = (void *)UIApp;
        uint64_t v10 = *(void *)(a1 + 32);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_6;
        v13[3] = &unk_1E52E87F0;
        char v15 = *(unsigned char *)(a1 + 57);
        id v11 = v4;
        v13[4] = v8;
        id v14 = v11;
        [v9 prepareSnapshotsWithAction:v8 forScene:v10 completion:v13];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v5);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)UIApp;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_4;
  v6[3] = &unk_1E52EAD18;
  char v9 = *(unsigned char *)(a1 + 56);
  objc_copyWeak(&v8, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 40);
  [v4 _performSnapshotsWithAction:v3 forScene:v5 completion:v6];

  objc_destroyWeak(&v8);
}

void __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      id v2 = +[UISnapshottingAssertionManager sharedInstance];
      [v2 relinquishAssertion:WeakRetained];
    }
    if ([*(id *)(a1 + 32) _isReadyForSuspension])
    {
      id v3 = +[UISnapshottingAssertionManager sharedInstance];
      [v3 executeIfNoActiveAssertions:&__block_literal_global_4_21];
    }
  }
}

void __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_5()
{
  id v0 = +[_UISceneLifecycleMultiplexer sharedInstance];
  [v0 collectBackingStores];
}

void __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_6(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = (void *)UIApp;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_7;
    v5[3] = &unk_1E52DB330;
    id v3 = *(id *)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    [v2 _performBlockAfterCATransactionCommits:v5];
  }
  else
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

uint64_t __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end