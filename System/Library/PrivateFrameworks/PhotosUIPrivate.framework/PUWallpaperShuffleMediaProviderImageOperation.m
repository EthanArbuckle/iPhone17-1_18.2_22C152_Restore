@interface PUWallpaperShuffleMediaProviderImageOperation
@end

@implementation PUWallpaperShuffleMediaProviderImageOperation

void __72___PUWallpaperShuffleMediaProviderImageOperation__handleRenderResponse___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) resultHandler];
  v2[2](v2, *(void *)(a1 + 48), 0, *(void *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "px_finishIfPossible");
  v3 = *(CGImage **)(a1 + 48);
  CGImageRelease(v3);
}

void __58___PUWallpaperShuffleMediaProviderImageOperation_px_start__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleRenderResponse:v3];
}

@end