@interface UIDiffableDataSourceSectionController
@end

@implementation UIDiffableDataSourceSectionController

void __163___UIDiffableDataSourceSectionController___applySnapshot_toSection_animatingDifferences_viewPropertyAnimator_animationsProvider_isOnDiffableApplyQueue_completion___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = WeakRetained;
  if (v2)
  {
    if (v3) {
      objc_msgSend(WeakRetained, "_onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:", v5, *(void *)(a1 + 32), *(void *)(a1 + 56));
    }
    else {
      objc_msgSend(WeakRetained, "_onApplyQueue_applyDifferencesFromSnapshot:animatingDifferences:completion:", v5, *(unsigned __int8 *)(a1 + 73), *(void *)(a1 + 64));
    }
  }
  else if (v3)
  {
    [WeakRetained _applyDifferencesFromSnapshot:v5 viewPropertyAnimator:*(void *)(a1 + 32) customAnimationsProvider:*(void *)(a1 + 56)];
  }
  else
  {
    [WeakRetained applyDifferencesFromSnapshot:v5 animatingDifferences:*(unsigned __int8 *)(a1 + 73) completion:*(void *)(a1 + 64)];
  }
}

uint64_t __162___UIDiffableDataSourceSectionController__applySnapshot_toSection_animatingDifferences_viewPropertyAnimator_animationsProvider_isOnDiffableApplyQueue_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePreparedCellsForExpansionStateWithSnapshot:*(void *)(a1 + 40)];
}

uint64_t __162___UIDiffableDataSourceSectionController__applySnapshot_toSection_animatingDifferences_viewPropertyAnimator_animationsProvider_isOnDiffableApplyQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76___UIDiffableDataSourceSectionController__configureCell_forItem_inSnapshot___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v7 = [WeakRetained _performDisclosureAction:a2 forItem:v5];

  return v7;
}

void __77___UIDiffableDataSourceSectionController__configureForItemRenderersIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained configureCell:v5 forItem:v8];
  }
}

@end