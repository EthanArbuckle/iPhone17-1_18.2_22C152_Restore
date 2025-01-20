@interface UIDiffableDataSource
@end

@implementation UIDiffableDataSource

uint64_t __49____UIDiffableDataSource__commitStateAtomically___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeState:*(void *)(a1 + 40)];
}

uint64_t __49____UIDiffableDataSource__commitStateAtomically___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103____UIDiffableDataSource__commitUpdate_snapshot_animated_animator_customAnimationsProvider_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _commitStateAtomically:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 _commitRebasedSectionSnapshotsFromCurrentTransactionIfNeeded];
}

void __152____UIDiffableDataSource__commitNewDataSource_withViewUpdates_viewPropertyAnimator_customAnimationsProvider_animated_commitAlongsideHandler_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)off_1E52D5498);
  v3 = [*(id *)(a1 + 32) state];
  id v5 = (id)[v2 initWithStateAdvancingGenerationID:v3];

  [*(id *)(a1 + 40) _commitStateAtomically:v5];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

uint64_t __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commitRebasedSectionSnapshotsFromCurrentTransactionIfNeeded];
}

uint64_t __47____UIDiffableDataSource__performOnApplyQueue___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)(a1 + 32) + 232), 0xFFFFFFFFFFFFFFFFLL, memory_order_relaxed);
  return result;
}

uint64_t __103____UIDiffableDataSource__applyDifferencesFromSnapshot_animatingDifferences_completion_isOnApplyQueue___block_invoke(uint64_t a1)
{
  int v2 = dyld_program_sdk_at_least();
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
LABEL_5:
    return objc_msgSend(v4, "_onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:animated:completion:", v5, 0, 0, v6, v3);
  }
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v6 = 1;
    goto LABEL_5;
  }
  uint64_t v8 = *(void *)(a1 + 48);
  return objc_msgSend(v4, "_onApplyQueue_reloadFromSnapshot:completion:", v5, v8);
}

void __70____UIDiffableDataSource__onApplyQueue_reloadFromSnapshot_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _computeCurrentTransactionForFinalSnapshot:*(void *)(a1 + 40) withDataSourceDiffer:0];
  [*(id *)(a1 + 32) _notifyWillApplyForCurrentTransactionIfNeeded];
  id v2 = objc_alloc((Class)off_1E52D5498);
  uint64_t v3 = [*(id *)(a1 + 40) state];
  id v9 = (id)[v2 initWithStateAdvancingGenerationID:v3];

  [*(id *)(a1 + 32) _commitStateAtomically:v9];
  [*(id *)(a1 + 32) _commitRebasedSectionSnapshotsFromCurrentTransactionIfNeeded];
  [*(id *)(a1 + 32) _notifyDidApplyForCurrentTransactionIfNeeded];
  int v4 = [*(id *)(a1 + 32) isSuppressingViewUpdates];
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 32) viewUpdater];
    [v5 _reloadData];
  }
  [*(id *)(a1 + 32) _resetCurrentTransaction];
  uint64_t v6 = *(void (***)(void))(a1 + 48);
  if (v6)
  {
    if (v4)
    {
      v7 = *(void **)(*(void *)(a1 + 32) + 256);
      uint64_t v8 = _Block_copy(v6);
      [v7 addObject:v8];
    }
    else
    {
      v6[2]();
    }
  }
}

void __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 72)
    && (int v4 = (id *)(a1 + 32),
        [*(id *)(a1 + 32) _validReloadOrReconfigureViewUpdatesInSnapshot:*(void *)(a1 + 40)],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v5 count];
    [*v4 _notifyWillApplyForCurrentTransactionIfNeeded];
    if (v7)
    {
      uint64_t v8 = 0;
      int v9 = 1;
      goto LABEL_7;
    }
  }
  else
  {
    int v4 = (id *)(a1 + 32);
    [*(id *)(a1 + 32) _notifyWillApplyForCurrentTransactionIfNeeded];
    uint64_t v6 = 0;
  }
  int v9 = 0;
  uint64_t v8 = *(const void **)(a1 + 56);
LABEL_7:
  v10 = _Block_copy(v8);
  v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v15 = *(unsigned __int8 *)(a1 + 73);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_3;
  v27[3] = &unk_1E52D9F70;
  v27[4] = v11;
  uint64_t v16 = [v11 _commitNewDataSource:v12 withViewUpdates:v3 viewPropertyAnimator:v13 customAnimationsProvider:v14 animated:v15 commitAlongsideHandler:v27 completion:v10];
  [*(id *)(a1 + 32) _notifyDidApplyForCurrentTransactionIfNeeded];
  [*(id *)(a1 + 32) _resetCurrentTransaction];
  if (v9)
  {
    if (v16 == 2)
    {
      v17 = *(void **)(a1 + 56);
      if (v17) {
        dispatch_async(MEMORY[0x1E4F14428], v17);
      }
    }
    else
    {
      v18 = (void *)[objc_alloc((Class)off_1E52D2BB8) initWithState:*((void *)*v4 + 15)];
      uint64_t v19 = [*v4 _transactionForReloadUpdatesWithSnapshot:v18];
      v20 = (void *)*((void *)*v4 + 7);
      *((void *)*v4 + 7) = v19;

      if (dyld_program_sdk_at_least())
      {
        v21 = *(id **)(a1 + 32);
        v22 = [v21[15] dataSourceSnapshot];
        [v21 _performReloadOrReconfigureUpdateWithItems:v6 dataSourceSnapshot:v22 animated:*(unsigned __int8 *)(a1 + 73) completion:*(void *)(a1 + 56)];
      }
      else
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_4;
        v23[3] = &unk_1E52DA138;
        v23[4] = *(void *)(a1 + 32);
        id v24 = v6;
        char v26 = *(unsigned char *)(a1 + 73);
        id v25 = *(id *)(a1 + 56);
        +[UIView performWithoutAnimation:v23];
      }
      [*v4 _resetCurrentTransaction];
    }
  }
}

id __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke(uint64_t a1)
{
  kdebug_trace();
  id v2 = *(void **)(*(void *)(a1 + 32) + 120);
  id v3 = [*(id *)(a1 + 40) state];
  int v4 = +[_UIDiffableDataSourceDiffer differWithBeforeDataSourceState:afterDataSourceState:]((uint64_t)_UIDiffableDataSourceDiffer, v2, v3);

  if (v4) {
    uint64_t v5 = (void *)v4[1];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  [*(id *)(a1 + 32) _computeCurrentTransactionForFinalSnapshot:*(void *)(a1 + 40) withDataSourceDiffer:v4];
  kdebug_trace();
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  return v8;
}

void __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 pendingSnapshotUpdates];
  uint64_t v5 = [v4 count];

  if (v5 != 1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"_UIDiffableDataSourceImpl.m", 918, @"Invalid parameter not satisfying: %@", @"snapshot.pendingSnapshotUpdates.count == 1" object file lineNumber description];
  }
  id v6 = [v3 pendingSnapshotUpdates];
  id v8 = [v6 firstObject];

  [*(id *)(a1 + 32) _commitUpdate:v8 snapshot:v3 animated:*(unsigned __int8 *)(a1 + 72) animator:*(void *)(a1 + 40) customAnimationsProvider:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __56____UIDiffableDataSource_reloadFromSnapshot_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onApplyQueue_reloadFromSnapshot:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __98____UIDiffableDataSource__applyDifferencesFromSnapshot_toSection_animatingDifferences_completion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __98____UIDiffableDataSource__applyDifferencesFromSnapshot_toSection_animatingDifferences_completion___block_invoke_2;
  v3[3] = &unk_1E52E32C0;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  char v8 = *(unsigned char *)(a1 + 72);
  id v7 = *(id *)(a1 + 64);
  [v2 _performApplyWithoutRebasingSectionSnapshots:v3];
}

uint64_t __98____UIDiffableDataSource__applyDifferencesFromSnapshot_toSection_animatingDifferences_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applySnapshot:*(void *)(a1 + 40) toSection:*(void *)(a1 + 48) animatingDifferences:*(unsigned __int8 *)(a1 + 64) viewPropertyAnimator:0 animationsProvider:0 isOnDiffableApplyQueue:1 completion:*(void *)(a1 + 56)];
}

void __53____UIDiffableDataSource__snapshotWithHandlerAtomic___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __34____UIDiffableDataSource_snapshot__block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc((Class)off_1E52D64D8) initWithState:*(void *)(*(void *)(a1 + 32) + 120)];
  return v1;
}

void __36____UIDiffableDataSource_initialize__block_invoke()
{
  objc_opt_class();
  _CVCDiffableDataSourceInitializeWithUpdateItemClass();
}

uint64_t __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __55____UIDiffableDataSource_applyDifferencesFromSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:animated:completion:", *(void *)(a1 + 40), 0, 0, 1, 0);
}

uint64_t __66____UIDiffableDataSource_applyDifferencesFromSnapshot_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:animated:completion:", *(void *)(a1 + 40), 0, 0, 1, *(void *)(a1 + 48));
}

uint64_t __45____UIDiffableDataSource_reloadFromSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onApplyQueue_reloadFromSnapshot:completion:", *(void *)(a1 + 40), 0);
}

uint64_t __81____UIDiffableDataSource__applyDifferencesFromSnapshot_customAnimationsProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:animated:completion:", *(void *)(a1 + 40), 0, *(void *)(a1 + 48), 1, 0);
}

uint64_t __102____UIDiffableDataSource__applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:animated:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), 1, 0);
}

void __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [v2[15] dataSourceSnapshot];
  [v2 _performReloadOrReconfigureUpdateWithItems:v3 dataSourceSnapshot:v4 animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

uint64_t __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id __76____UIDiffableDataSource__registerItemRenderers_rendererIdentifierProvider___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  char v8 = (id *)(a1 + 32);
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  if (!WeakRetained)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[__UIDiffableDataSource _registerItemRenderers:rendererIdentifierProvider:]_block_invoke"];
    [v12 handleFailureInFunction:v13 file:@"_UIDiffableDataSourceImpl.m" lineNumber:1170 description:@"Failed to generate a new cell."];
  }
  id v14 = *((id *)WeakRetained + 3);
  if ([v14 count] == 1)
  {
    uint64_t v15 = [v14 objectEnumerator];
    uint64_t v16 = [v15 allObjects];
    uint64_t v17 = [v16 firstObject];
  }
  else
  {
    uint64_t v15 = (void (**)(void, void))_Block_copy(*((const void **)WeakRetained + 4));
    uint64_t v16 = ((void (**)(void, id))v15)[2](v15, v7);
    if (!v16)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      v28 = [NSString stringWithUTF8String:"-[__UIDiffableDataSource _registerItemRenderers:rendererIdentifierProvider:]_block_invoke"];
      [v27 handleFailureInFunction:v28, @"_UIDiffableDataSourceImpl.m", 1180, @"Invalid parameter not satisfying: %@", @"rendererIdentifier" file lineNumber description];
    }
    uint64_t v17 = [v14 objectForKey:v16];
  }
  v18 = (void *)v17;

  if (!v18)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    id v24 = [NSString stringWithUTF8String:"-[__UIDiffableDataSource _registerItemRenderers:rendererIdentifierProvider:]_block_invoke"];
    [v23 handleFailureInFunction:v24, @"_UIDiffableDataSourceImpl.m", 1183, @"No registered item renderer found for identifier %@", v7 file lineNumber description];
  }
  uint64_t v19 = [v18 cellReuseIdentifier];
  v20 = [v10 dequeueReusableCellWithReuseIdentifier:v19 forIndexPath:v9];

  if (!v20)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    char v26 = [NSString stringWithUTF8String:"-[__UIDiffableDataSource _registerItemRenderers:rendererIdentifierProvider:]_block_invoke"];
    [v25 handleFailureInFunction:v26, @"_UIDiffableDataSourceImpl.m", 1185, @"Invalid parameter not satisfying: %@", @"cell" file lineNumber description];
  }
  v21 = [v18 handler];
  ((void (**)(void, id, void *))v21)[2](v21, v7, v20);

  return v20;
}

NSDiffableDataSourceSectionSnapshot *__68____UIDiffableDataSource__reorderingTransactionForReorderingUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"_UIDiffableDataSourceImpl.m", 1406, @"Invalid parameter not satisfying: %@", @"sectionIdentifier" object file lineNumber description];
  }
  id v4 = [*(id *)(a1 + 32) associatedSectionControllerForSectionIdentifier:v3];
  id v5 = v4;
  if (!v4
    || ([v4 snapshotForSection:v3],
        (id v6 = (NSDiffableDataSourceSectionSnapshot *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([*(id *)(a1 + 40) indexOfSectionIdentifier:v3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v7 = [*(id *)(a1 + 40) itemIdentifiersInSectionWithIdentifier:v3];
    }
    id v6 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
    [(NSDiffableDataSourceSectionSnapshot *)v6 appendItems:v7];
  }
  return v6;
}

@end