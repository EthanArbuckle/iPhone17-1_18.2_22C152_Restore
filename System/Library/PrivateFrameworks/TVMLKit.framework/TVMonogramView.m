@interface TVMonogramView
@end

@implementation TVMonogramView

void __59___TVMonogramView__loadWithMonogramDescription_imageProxy___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  v7 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a4)
  {
    uint64_t v9 = [*(id *)(a1 + 32) preferedMonogramType];
    if (a2 || !v9)
    {
      [WeakRetained[104] setHidden:1];
      [WeakRetained[115] setHidden:0];
      [WeakRetained _updateAppearanceForSelectionStateWithCoordinator:0];
      if (a2)
      {
        v13 = [MEMORY[0x263F08A00] defaultCenter];
        [v13 postNotificationName:@"TVMonogramViewImageDidUpdateNotification" object:WeakRetained];
      }
    }
    else
    {
      if ((unint64_t)(v9 - 3) >= 3) {
        uint64_t v10 = v9 - 1;
      }
      else {
        uint64_t v10 = 2;
      }
      v11 = (void *)[*(id *)(a1 + 32) copyWithType:v10];
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      v16 = __59___TVMonogramView__loadWithMonogramDescription_imageProxy___block_invoke_2;
      v17 = &unk_264BA6918;
      objc_copyWeak(&v19, v7);
      id v18 = v11;
      id v12 = v11;
      dispatch_async(MEMORY[0x263EF83A0], &v14);

      objc_destroyWeak(&v19);
      objc_msgSend(WeakRetained, "_updateAppearanceForSelectionStateWithCoordinator:", 0, v14, v15, v16, v17);
    }
  }
}

void __59___TVMonogramView__loadWithMonogramDescription_imageProxy___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _loadWithMonogramDescription:*(void *)(a1 + 32) imageProxy:0];
    id WeakRetained = v3;
  }
}

@end