@interface TVShelfViewController
@end

@implementation TVShelfViewController

uint64_t __60___TVShelfViewController_updateWithViewElement_cellMetrics___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 attributes];
  v3 = [v2 objectForKeyedSubscript:@"prominent"];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

void __77___TVShelfViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) indexPathForSnappedContent];
  LOBYTE(v2) = [v2 isEqual:v3];

  if ((v2 & 1) == 0)
  {
    uint64_t v4 = (void *)MEMORY[0x263F1CB60];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __77___TVShelfViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v5[3] = &unk_264BA64A0;
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    [v4 performWithoutAnimation:v5];
  }
}

uint64_t __77___TVShelfViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) snapContentToIndexPath:*(void *)(a1 + 40)];
}

void __72___TVShelfViewController_updateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __72___TVShelfViewController_updateFocusInContext_withAnimationCoordinator___block_invoke_2;
  v2[3] = &unk_264BA6918;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);

  objc_destroyWeak(&v4);
}

void __72___TVShelfViewController_updateFocusInContext_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) nextFocusedIndexPath];
  [WeakRetained _didSettleOnItemAtIndexPath:v2];
}

uint64_t __44___TVShelfViewController_setSpeedBumpEdges___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setSpeedBumpEdges:*(void *)(*(void *)(a1 + 32) + 1328)];
}

void __47___TVShelfViewController__delayedUpdatePreview__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __47___TVShelfViewController__delayedUpdatePreview__block_invoke_2;
  v2[3] = &unk_264BA6918;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);

  objc_destroyWeak(&v4);
}

void __47___TVShelfViewController__delayedUpdatePreview__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didSettleOnItemAtIndexPath:*(void *)(a1 + 32)];
}

@end