@interface SBWallpaperPreviewSnapshotCache
+ (SBWallpaperPreviewSnapshotCache)sharedInstance;
+ (id)cacheKeyForVariant:(int64_t)a3 options:(unint64_t)a4;
+ (id)cacheKeyForVariant:(int64_t)a3 options:(unint64_t)a4 scalingWidth:(double)a5;
- (SBWallpaperPreviewSnapshotCache)init;
- (SBWallpaperPreviewSnapshotCache)initWithImageCache:(id)a3 iconController:(id)a4 wallpaperController:(id)a5;
- (id)_homeScreenSnapshotProviderWithOptions:(unint64_t)a3 wallpaperImage:(id)a4;
- (id)_lockScreenSnapshotProviderWithOptions:(unint64_t)a3 wallpaperImage:(id)a4;
- (id)mappedWallpaperPreviewForKey:(id)a3;
- (id)mappedWallpaperPreviewForScaledSnapshot:(id)a3 variant:(int64_t)a4 cacheKey:(id)a5;
- (id)snapshotProviderForVariant:(int64_t)a3 options:(unint64_t)a4 wallpaperImage:(id)a5;
- (int64_t)_orientationForOptions:(unint64_t)a3;
- (void)_backlightFadeFinished;
- (void)_iconControllerDidChangeIconModel:(id)a3;
- (void)_modelDidLayout;
- (void)_modelWillLayout;
- (void)_switchToIconModel:(id)a3;
- (void)dealloc;
- (void)invalidateSnapshotsForLocations:(int64_t)a3;
- (void)node:(id)a3 didAddContainedNodeIdentifiers:(id)a4;
- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4;
- (void)nodeDidMoveContainedNodes:(id)a3;
- (void)regenerateSnapshotsForLocations:(int64_t)a3;
- (void)wallpaperDidChangeForVariant:(int64_t)a3;
@end

@implementation SBWallpaperPreviewSnapshotCache

+ (SBWallpaperPreviewSnapshotCache)sharedInstance
{
  if (sharedInstance_onceToken_35 != -1) {
    dispatch_once(&sharedInstance_onceToken_35, &__block_literal_global_253);
  }
  v2 = (void *)sharedInstance_sharedInstance_7;
  return (SBWallpaperPreviewSnapshotCache *)v2;
}

void __49__SBWallpaperPreviewSnapshotCache_sharedInstance__block_invoke()
{
  v0 = [SBWallpaperPreviewSnapshotCache alloc];
  id v6 = [MEMORY[0x1E4F83BD0] wallpaperCache];
  v1 = [v6 imageCache];
  v2 = +[SBIconController sharedInstance];
  v3 = +[SBWallpaperController sharedInstance];
  uint64_t v4 = [(SBWallpaperPreviewSnapshotCache *)v0 initWithImageCache:v1 iconController:v2 wallpaperController:v3];
  v5 = (void *)sharedInstance_sharedInstance_7;
  sharedInstance_sharedInstance_7 = v4;
}

- (SBWallpaperPreviewSnapshotCache)initWithImageCache:(id)a3 iconController:(id)a4 wallpaperController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBWallpaperPreviewSnapshotCache;
  v12 = [(SBWallpaperPreviewSnapshotCache *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageCache, a3);
    objc_storeStrong((id *)&v13->_iconController, a4);
    objc_storeStrong((id *)&v13->_wallpaperController, a5);
    [v11 addObserver:v13 forVariant:0];
    [v11 addObserver:v13 forVariant:1];
    v14 = [(SBIconController *)v13->_iconController model];
    [(SBWallpaperPreviewSnapshotCache *)v13 _switchToIconModel:v14];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v13 selector:sel__backlightFadeFinished name:*MEMORY[0x1E4FA7A10] object:0];
    [v15 addObserver:v13 selector:sel__iconControllerDidChangeIconModel_ name:SBIconControllerIconModelDidChangeNotification object:v13->_iconController];
    v16 = v13;
  }
  return v13;
}

- (SBWallpaperPreviewSnapshotCache)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Use designated initializer" userInfo:0];
  objc_exception_throw(v2);
}

- (void)dealloc
{
  v3 = [(SBHIconModel *)self->_model rootFolder];
  [v3 removeNodeObserver:self];

  uint64_t v4 = self->_wallpaperController;
  [(SBWallpaperController *)v4 removeObserver:self forVariant:0];
  [(SBWallpaperController *)v4 removeObserver:self forVariant:1];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)SBWallpaperPreviewSnapshotCache;
  [(SBWallpaperPreviewSnapshotCache *)&v6 dealloc];
}

- (void)invalidateSnapshotsForLocations:(int64_t)a3
{
  objc_super v6 = [(BSUIMappedImageCache *)self->_imageCache allKeys];
  id v5 = v6;
  PBUIWallpaperEnumerateVariantsForLocations();
  self->_invalidatedLocations |= a3;
}

void __67__SBWallpaperPreviewSnapshotCache_invalidateSnapshotsForLocations___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24);
  if ((PBUIWallpaperLocationForVariant() & v4) == 0)
  {
    id v5 = [(id)objc_opt_class() cacheKeyForVariant:a2 options:0];
    if (v5)
    {
      [*(id *)(*(void *)(a1 + 32) + 16) removeImageForKey:v5];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v6 = *(id *)(a1 + 40);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            if (objc_msgSend(v11, "hasPrefix:", v5, (void)v12)) {
              [*(id *)(*(void *)(a1 + 32) + 16) removeImageForKey:v11];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }
    }
  }
}

+ (id)cacheKeyForVariant:(int64_t)a3 options:(unint64_t)a4 scalingWidth:(double)a5
{
  if (a4)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v7 = NSString;
    uint64_t v8 = PBUIStringForWallpaperVariant();
    id v5 = [v7 stringWithFormat:@"WallpaperPreview-%@-%f", v8, *(void *)&a5];
  }
  return v5;
}

+ (id)cacheKeyForVariant:(int64_t)a3 options:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = NSString;
    id v6 = PBUIStringForWallpaperVariant();
    uint64_t v4 = [v5 stringWithFormat:@"WallpaperPreview-%@", v6];
  }
  return v4;
}

- (id)mappedWallpaperPreviewForKey:(id)a3
{
  return (id)[(BSUIMappedImageCache *)self->_imageCache imageForKey:a3];
}

- (id)mappedWallpaperPreviewForScaledSnapshot:(id)a3 variant:(int64_t)a4 cacheKey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__SBWallpaperPreviewSnapshotCache_mappedWallpaperPreviewForScaledSnapshot_variant_cacheKey___block_invoke;
  v17[3] = &unk_1E6B074D0;
  id v10 = v8;
  v19 = self;
  int64_t v20 = a4;
  id v18 = v10;
  uint64_t v11 = MEMORY[0x1D948C7A0](v17);
  long long v12 = (void *)v11;
  if (v9)
  {
    uint64_t v13 = [(BSUIMappedImageCache *)self->_imageCache imageForKey:v9 generatingIfNecessaryWithBlock:v11];
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v13 = (*(void (**)(uint64_t, uint64_t *))(v11 + 16))(v11, &v16);
  }
  long long v14 = (void *)v13;

  return v14;
}

id __92__SBWallpaperPreviewSnapshotCache_mappedWallpaperPreviewForScaledSnapshot_variant_cacheKey___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  int v5 = MGGetBoolAnswer();
  uint64_t v6 = 4;
  if (!v5) {
    uint64_t v6 = 0;
  }
  *a2 |= v6;
  if (MGGetBoolAnswer()) {
    *a2 |= 2uLL;
  }
  *(void *)(*(void *)(a1 + 40) + 24) &= ~PBUIWallpaperLocationForVariant();
  return v4;
}

- (void)regenerateSnapshotsForLocations:(int64_t)a3
{
}

void __67__SBWallpaperPreviewSnapshotCache_regenerateSnapshotsForLocations___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [(id)objc_opt_class() cacheKeyForVariant:a2 options:*(void *)(a1 + 40)];
  if (v4)
  {
    int v5 = [*(id *)(a1 + 32) snapshotProviderForVariant:a2 options:*(void *)(a1 + 40) wallpaperImage:0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__SBWallpaperPreviewSnapshotCache_regenerateSnapshotsForLocations___block_invoke_2;
    v7[3] = &unk_1E6B074F8;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v9 = a2;
    v7[4] = v6;
    id v8 = v4;
    [v5 snapshotWithImageBlock:v7];
  }
}

void __67__SBWallpaperPreviewSnapshotCache_regenerateSnapshotsForLocations___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  *(void *)(*(void *)(a1 + 32) + 24) &= ~PBUIWallpaperLocationForVariant();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = *(void **)(v3 + 16);
  if (MGGetBoolAnswer()) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 0;
  }
  [v5 setImage:v7 forKey:v4 withPersistenceOptions:v6];
}

- (void)_switchToIconModel:(id)a3
{
  int v5 = (SBIconModel *)a3;
  p_model = &self->_model;
  if (self->_model != v5)
  {
    long long v12 = v5;
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v8 = (void *)MEMORY[0x1E4FA6700];
    uint64_t v9 = (void *)MEMORY[0x1E4FA66F0];
    if (*p_model)
    {
      id v10 = [(SBHIconModel *)*p_model rootFolder];
      [v10 removeNodeObserver:self];

      [v7 removeObserver:self name:*v8 object:self->_model];
      [v7 removeObserver:self name:*v9 object:self->_model];
    }
    objc_storeStrong((id *)&self->_model, a3);
    if (*p_model)
    {
      uint64_t v11 = [(SBHIconModel *)*p_model rootFolder];
      [v11 addNodeObserver:self];

      [v7 addObserver:self selector:sel__modelWillLayout name:*v8 object:self->_model];
      [v7 addObserver:self selector:sel__modelDidLayout name:*v9 object:self->_model];
    }

    int v5 = v12;
  }
}

- (void)_iconControllerDidChangeIconModel:(id)a3
{
  id v4 = [(SBIconController *)self->_iconController model];
  [(SBWallpaperPreviewSnapshotCache *)self _switchToIconModel:v4];
}

- (void)node:(id)a3 didAddContainedNodeIdentifiers:(id)a4
{
}

- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4
{
}

- (void)nodeDidMoveContainedNodes:(id)a3
{
}

- (void)_modelWillLayout
{
  id v3 = [(SBHIconModel *)self->_model rootFolder];
  [v3 removeNodeObserver:self];
}

- (void)_modelDidLayout
{
  id v3 = [(SBHIconModel *)self->_model rootFolder];
  [v3 addNodeObserver:self];

  [(SBWallpaperPreviewSnapshotCache *)self invalidateSnapshotsForLocations:2];
}

- (void)_backlightFadeFinished
{
  id v3 = +[SBBacklightController sharedInstance];
  char v4 = [v3 screenIsOn];

  if ((v4 & 1) == 0)
  {
    [(SBWallpaperPreviewSnapshotCache *)self invalidateSnapshotsForLocations:3];
    self->_invalidatedLocations = 0;
  }
}

- (id)_homeScreenSnapshotProviderWithOptions:(unint64_t)a3 wallpaperImage:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SBWallpaperPreviewSnapshotCache *)self _orientationForOptions:a3];
  SBScreenBoundsRotatedRoundCenter(v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [SBHomeScreenPreviewView alloc];
  uint64_t v17 = [(SBIconController *)self->_iconController iconManager];
  id v18 = -[SBHomeScreenPreviewView initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:](v16, "initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:", v17, self->_wallpaperController, a3, v6, 0, v9, v11, v13, v15);

  v19 = [(SBWallpaperController *)self->_wallpaperController windowScene];
  int64_t v20 = [[SBViewSnapshotProvider alloc] initWithWindowScene:v19 view:v18 orientation:v7];
  [(SBViewSnapshotProvider *)v20 setIncludeWindowSceneWallpaper:(a3 & 0x40) == 0];

  return v20;
}

- (id)_lockScreenSnapshotProviderWithOptions:(unint64_t)a3 wallpaperImage:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SBWallpaperPreviewSnapshotCache *)self _orientationForOptions:a3];
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  SBScreenBounds(v7);
  double v12 = -[SBLockScreenPreviewView initWithFrame:wallpaperController:options:wallpaperImage:]([SBLockScreenPreviewView alloc], "initWithFrame:wallpaperController:options:wallpaperImage:", self->_wallpaperController, a3, v6, v8, v9, v10, v11);

  double v13 = [(SBWallpaperController *)self->_wallpaperController windowScene];
  double v14 = [[SBViewSnapshotProvider alloc] initWithWindowScene:v13 view:v12 orientation:v7];

  return v14;
}

- (id)snapshotProviderForVariant:(int64_t)a3 options:(unint64_t)a4 wallpaperImage:(id)a5
{
  id v8 = a5;
  if (!a3)
  {
    uint64_t v9 = [(SBWallpaperPreviewSnapshotCache *)self _lockScreenSnapshotProviderWithOptions:a4 wallpaperImage:v8];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v9 = [(SBWallpaperPreviewSnapshotCache *)self _homeScreenSnapshotProviderWithOptions:a4 wallpaperImage:v8];
LABEL_5:
    double v10 = (void *)v9;
    goto LABEL_7;
  }
  double v10 = 0;
LABEL_7:

  return v10;
}

- (int64_t)_orientationForOptions:(unint64_t)a3
{
  if ((a3 & 0x180) == 0x100) {
    return 3;
  }
  else {
    return 1;
  }
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  uint64_t v4 = PBUIWallpaperLocationForVariant();
  [(SBWallpaperPreviewSnapshotCache *)self invalidateSnapshotsForLocations:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
}

@end