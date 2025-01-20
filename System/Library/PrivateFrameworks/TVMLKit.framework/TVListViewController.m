@interface TVListViewController
@end

@implementation TVListViewController

uint64_t __59___TVListViewController_updateWithViewElement_cellMetrics___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = v7;
  if (a3)
  {
    id v13 = v7;
    id v7 = (id)[v7 numberOfItems];
    id v8 = v13;
    if (v7)
    {
      uint64_t v9 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:a3];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      id v8 = v13;
      *a4 = 1;
    }
  }
  return MEMORY[0x270F9A758](v7, v8);
}

void __76___TVListViewController_didUpdateCollectionViewByNeedingReload_focusUpdate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_msgSend(a2, "tv_associatedIKViewElement");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [v6 appDocument];

  if (!v5) {
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

void __46___TVListViewController__delayedUpdatePreview__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __46___TVListViewController__delayedUpdatePreview__block_invoke_2;
  v2[3] = &unk_264BA6918;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);

  objc_destroyWeak(&v4);
}

uint64_t __46___TVListViewController__delayedUpdatePreview__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    WeakRetained = (id *)[WeakRetained[167] isEqual:*(void *)(a1 + 32)];
    id v3 = v5;
    if (WeakRetained)
    {
      WeakRetained = (id *)[v5 _updatedPreviewWithItemAtIndexPath:*(void *)(a1 + 32)];
      id v3 = v5;
    }
  }
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

@end