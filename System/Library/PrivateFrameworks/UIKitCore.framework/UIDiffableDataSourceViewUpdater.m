@interface UIDiffableDataSourceViewUpdater
@end

@implementation UIDiffableDataSourceViewUpdater

uint64_t __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) performBatchUpdates:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _expectedDiffableUpdateItem];
  if (!v2)
  {
    if (*(unsigned char *)(a1 + 112))
    {
      uint64_t v4 = *(void *)(a1 + 56);
      v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 80);
      if (v4) {
        [v5 _performBatchUpdates:v6 viewPropertyAnimator:v4 customAnimationsProvider:*(void *)(a1 + 88)];
      }
      else {
        [v5 performBatchUpdates:v6 completion:*(void *)(a1 + 96)];
      }
      goto LABEL_19;
    }
    if (*(unsigned char *)(a1 + 113))
    {
LABEL_10:
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 2;
      [*(id *)(a1 + 32) reloadData];
      (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
      goto LABEL_19;
    }
    v7 = [*(id *)(a1 + 32) window];
    if (v7)
    {
    }
    else
    {
      if (_UIInternalPreferencesRevisionOnce != -1) {
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
      }
      int v8 = _UIInternalPreferencesRevisionVar;
      if (_UIInternalPreferencesRevisionVar < 1) {
        goto LABEL_17;
      }
      int v9 = _UIInternalPreference_DiffableDataSourceSnapshotApplyBehaviorOutsideWindow;
      if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_DiffableDataSourceSnapshotApplyBehaviorOutsideWindow) {
        goto LABEL_17;
      }
      while (v8 >= v9)
      {
        _UIInternalPreferenceSync(v8, &_UIInternalPreference_DiffableDataSourceSnapshotApplyBehaviorOutsideWindow, @"DiffableDataSourceSnapshotApplyBehaviorOutsideWindow", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
        int v9 = _UIInternalPreference_DiffableDataSourceSnapshotApplyBehaviorOutsideWindow;
        if (v8 == _UIInternalPreference_DiffableDataSourceSnapshotApplyBehaviorOutsideWindow) {
          goto LABEL_17;
        }
      }
      if (qword_1EB256EE0 == -1) {
        goto LABEL_10;
      }
      if (qword_1EB256EE0 != 1)
      {
LABEL_17:
        if ((dyld_program_sdk_at_least() & 1) == 0) {
          goto LABEL_10;
        }
      }
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_4;
    v10[3] = &unk_1E52E45C8;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 80);
    id v13 = *(id *)(a1 + 96);
    +[UIView performWithoutAnimation:v10];

    goto LABEL_19;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if (([*(id *)(a1 + 40) _doesExpectedUpdate:v2 matchActualUpdates:*(void *)(a1 + 48) allowingEmptyUpdates:1] & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 2;
    [*(id *)(a1 + 32) reloadData];
  }
  v3 = *(void **)(a1 + 72);
  if (v3) {
    dispatch_async(MEMORY[0x1E4F14428], v3);
  }
LABEL_19:
}

uint64_t __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  return [v2 _performViewUpdates:v3];
}

uint64_t __47___UIDiffableDataSourceViewUpdater__reloadData__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

uint64_t __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __47___UIDiffableDataSourceViewUpdater__reloadData__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

uint64_t __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_5(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  return [v2 _performViewUpdates:v3];
}

uint64_t __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_7(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _expectedDiffableUpdateItem];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    if (([*(id *)(a1 + 40) _doesExpectedUpdate:v2 matchActualUpdates:*(void *)(a1 + 48) allowingEmptyUpdates:0] & 1) == 0)
    {
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 2;
      [*(id *)(a1 + 32) reloadData];
    }
    uint64_t v3 = *(void **)(a1 + 64);
    if (v3) {
      dispatch_async(MEMORY[0x1E4F14428], v3);
    }
  }
  else if (*(unsigned char *)(a1 + 96))
  {
    [*(id *)(a1 + 32) performBatchUpdates:*(void *)(a1 + 72) completion:*(void *)(a1 + 80)];
  }
  else if (*(unsigned char *)(a1 + 97) {
         || ([*(id *)(a1 + 32) window],
  }
             uint64_t v4 = objc_claimAutoreleasedReturnValue(),
             v4,
             !v4))
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 2;
    [*(id *)(a1 + 32) reloadData];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_8;
    v5[3] = &unk_1E52E45C8;
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 72);
    id v8 = *(id *)(a1 + 80);
    +[UIView performWithoutAnimation:v5];
  }
}

uint64_t __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) performBatchUpdates:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

BOOL __96___UIDiffableDataSourceViewUpdater__doesExpectedUpdate_matchActualUpdates_allowingEmptyUpdates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateAction] == 1;
}

BOOL __96___UIDiffableDataSourceViewUpdater__doesExpectedUpdate_matchActualUpdates_allowingEmptyUpdates___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateAction] == 0;
}

uint64_t __51___UIDiffableDataSourceViewUpdater__deleteAllItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

uint64_t __51___UIDiffableDataSourceViewUpdater__deleteAllItems__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

@end