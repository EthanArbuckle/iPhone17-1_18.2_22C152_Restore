@interface UIWindow(PXImageModulationManager)
- (PXImageModulationManager)px_imageModulationManager;
- (void)_dismantleImageModulationManager;
@end

@implementation UIWindow(PXImageModulationManager)

- (void)_dismantleImageModulationManager
{
}

- (PXImageModulationManager)px_imageModulationManager
{
  objc_getAssociatedObject(a1, (const void *)modulationManagerKey);
  v2 = (PXImageModulationManager *)objc_claimAutoreleasedReturnValue();
  v3 = [a1 rootViewController];
  if (!v2)
  {
    v4 = [PXImageModulationManager alloc];
    v5 = [a1 screen];
    v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    v2 = [(PXImageModulationManager *)v4 initWithRootViewController:v3 mainScreen:v5 == v6];

    objc_setAssociatedObject(a1, (const void *)modulationManagerKey, v2, (void *)1);
    objc_initWeak(&location, a1);
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v8 = *MEMORY[0x1E4FB30F8];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__UIWindow_PXImageModulationManager__px_imageModulationManager__block_invoke;
    v11[3] = &unk_1E5DCFD58;
    objc_copyWeak(&v12, &location);
    v9 = [v7 addObserverForName:v8 object:a1 queue:0 usingBlock:v11];

    objc_setAssociatedObject(a1, (const void *)px_imageModulationManager_resignKeyObserverKey, v9, (void *)1);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v2;
}

@end