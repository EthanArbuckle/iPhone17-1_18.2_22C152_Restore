@interface PBUICachedSnapshotEffectProvider
- (PBUIBakedEffectSnapshotSource)makeBakedEffectSourceFrom:(uint64_t)a1;
- (id)_effectConfigurationForObserver:(uint64_t)a1;
- (id)cacheKeyForConfiguration:(uint64_t)a1;
- (id)compositeImage:(void *)a3 effectConfiguration:;
- (id)imageForConfiguration:(id *)a1;
- (id)initForSnapshotProvider:(id)a3 cacheIdentifier:(id)a4;
- (id)registerSnapshotSourceObserver:(id)a3;
- (id)snapshotSourceForObserver:(id)a3;
- (int64_t)effectiveStyle;
- (uint64_t)cache;
- (uint64_t)cacheIdentifier;
- (uint64_t)setCacheIdentifier:(uint64_t)a1;
- (void)dealloc;
- (void)invalidate;
- (void)setCache:(uint64_t)a1;
- (void)setNeedsSourceUpdate;
- (void)setSnapshotProvider:(id)a3;
@end

@implementation PBUICachedSnapshotEffectProvider

- (id)snapshotSourceForObserver:(id)a3
{
  v4 = -[PBUICachedSnapshotEffectProvider _effectConfigurationForObserver:]((uint64_t)self, a3);
  v5 = (void *)[(PBUIBakedEffectSnapshotSource *)self->_currentSource copy];
  [v5 setEffectConfiguration:v4];
  v6 = -[PBUICachedSnapshotEffectProvider imageForConfiguration:]((id *)&self->super.isa, v4);
  [v5 setSnapshot:v6];

  return v5;
}

- (id)imageForConfiguration:(id *)a1
{
  v3 = a2;
  if (a1)
  {
    v4 = [a1[6] snapshot];
    if (-[PBUIFakeBlurAsset imageURL]((uint64_t)v3) && v4)
    {
      v5 = -[PBUICachedSnapshotEffectProvider cacheKeyForConfiguration:]((uint64_t)a1, v3);
      objc_initWeak(&location, a1);
      id v6 = a1[8];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __58__PBUICachedSnapshotEffectProvider_imageForConfiguration___block_invoke;
      v8[3] = &unk_1E62B3948;
      objc_copyWeak(&v10, &location);
      v9 = v3;
      a1 = [v6 imageForKey:v5 generatingIfNecessaryWithBlock:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      a1 = v4;
    }
  }
  return a1;
}

- (id)cacheKeyForConfiguration:(uint64_t)a1
{
  if (a1)
  {
    v2 = NSString;
    v3 = -[PBUIWallpaperEffectConfiguration uniqueIdentifier](a2);
    v4 = [v2 stringWithFormat:@"CachedSnapshot-%@", v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_effectConfigurationForObserver:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = [*(id *)(a1 + 48) legibilitySettings];
    v5 = [v4 contentColor];

    id v6 = [MEMORY[0x1E4F42F80] currentTraitCollection];
    uint64_t v7 = [v6 userInterfaceStyle];

    if (objc_opt_respondsToSelector())
    {
      v8 = [v3 traitCollection];
      uint64_t v9 = objc_opt_class();
      id v10 = v8;
      if (v9)
      {
        if (objc_opt_isKindOfClass()) {
          v11 = v10;
        }
        else {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
      }
      id v12 = v11;

      if (v12) {
        uint64_t v7 = [v12 userInterfaceStyle];
      }
    }
    id v13 = -[PBUIWallpaperEffectConfiguration initWithStyle:contentColor:userInterfaceStyle:]([PBUIWallpaperEffectConfiguration alloc], [v3 effectiveStyle], v5, v7);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)initForSnapshotProvider:(id)a3 cacheIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PBUICachedSnapshotEffectProvider;
  uint64_t v9 = [(PBUICachedSnapshotEffectProvider *)&v27 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_snapshotProvider, a3);
    v11 = objc_alloc_init(PBUIBackdropCompositor);
    backdropCompositor = v10->_backdropCompositor;
    v10->_backdropCompositor = (PBUIWallpaperEffectCompositor *)v11;

    id v13 = objc_alloc_init(PBUIMaterialCompositor);
    materialCompositor = v10->_materialCompositor;
    v10->_materialCompositor = (PBUIWallpaperEffectCompositor *)v13;

    v15 = [getPUIMappedImageCacheManagerClass() defaultCacheManager];
    uint64_t v16 = [v15 checkoutImageCache:v8];
    cache = v10->_cache;
    v10->_cache = (PUIManagedCacheIdentifying *)v16;

    uint64_t v18 = [v8 copy];
    cacheIdentifier = v10->_cacheIdentifier;
    v10->_cacheIdentifier = (NSString *)v18;

    objc_initWeak(&location, v10);
    v20 = [PBUIReplicaSourceObserverBox alloc];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __76__PBUICachedSnapshotEffectProvider_initForSnapshotProvider_cacheIdentifier___block_invoke;
    v24[3] = &unk_1E62B3920;
    objc_copyWeak(&v25, &location);
    uint64_t v21 = [(PBUIReplicaSourceObserverBox *)v20 initWithIdentifier:&stru_1F1606C18 activeStateDidChangeHandler:v24];
    observers = v10->_observers;
    v10->_observers = (PBUIReplicaSourceObserverBox *)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __76__PBUICachedSnapshotEffectProvider_initForSnapshotProvider_cacheIdentifier___block_invoke(uint64_t a1, int a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    if (a2)
    {
      uint64_t v4 = [WeakRetained[2] registerSnapshotSourceObserver:WeakRetained];
      id v5 = v7[1];
      v7[1] = (id)v4;

      [v7 setNeedsSourceUpdate];
    }
    else
    {
      [WeakRetained[1] invalidate];
      id v6 = v7[1];
      v7[1] = 0;
    }
    WeakRetained = v7;
  }
}

- (uint64_t)setCacheIdentifier:(uint64_t)a1
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v13 = (void *)v3;
    uint64_t v3 = BSEqualStrings();
    uint64_t v4 = (uint64_t)v13;
    if ((v3 & 1) == 0)
    {
      id v5 = [getPUIMappedImageCacheManagerClass() defaultCacheManager];
      id v6 = v5;
      if (v13)
      {
        uint64_t v7 = objc_msgSend(v5, "checkoutImageCache:");
        id v8 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = v7;

        uint64_t v9 = [v13 copy];
      }
      else
      {
        id v10 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = 0;

        uint64_t v9 = 0;
      }
      v11 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v9;

      uint64_t v4 = (uint64_t)v13;
    }
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)setSnapshotProvider:(id)a3
{
  id v5 = (PBUIPosterReplicaSnapshotProviding *)a3;
  p_snapshotProvider = &self->_snapshotProvider;
  if (self->_snapshotProvider != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_snapshotProvider, a3);
    p_snapshotProvider = (PBUIPosterReplicaSnapshotProviding **)[(PBUICachedSnapshotEffectProvider *)self setNeedsSourceUpdate];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_snapshotProvider, v5);
}

- (void)dealloc
{
  [(PBUICachedSnapshotEffectProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBUICachedSnapshotEffectProvider;
  [(PBUICachedSnapshotEffectProvider *)&v3 dealloc];
}

- (void)invalidate
{
  [(BSInvalidatable *)self->_snapshotSubscription invalidate];
  [(PBUIReplicaSourceObserverBox *)self->_observers invalidate];
  cache = self->_cache;
  self->_cache = 0;

  cacheIdentifier = self->_cacheIdentifier;
  self->_cacheIdentifier = 0;
}

- (int64_t)effectiveStyle
{
  return 0;
}

- (void)setNeedsSourceUpdate
{
  id v9 = [(PBUIPosterReplicaSnapshotProviding *)self->_snapshotProvider snapshotSourceForObserver:self];
  -[PBUICachedSnapshotEffectProvider makeBakedEffectSourceFrom:]((uint64_t)self, v9);
  objc_super v3 = (PBUIBakedEffectSnapshotSource *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(PBUIBakedEffectSnapshotSource *)self->_currentSource cacheIdentifier];
  id v5 = [v9 cacheIdentifier];
  char v6 = BSEqualObjects();

  if ((v6 & 1) == 0) {
    [(PUIManagedCacheIdentifying *)self->_cache removeAllImagesWithCompletion:0];
  }
  currentSource = self->_currentSource;
  self->_currentSource = v3;
  id v8 = v3;

  [(PBUIReplicaSourceObserverBox *)self->_observers setNeedsSourceUpdate];
}

- (PBUIBakedEffectSnapshotSource)makeBakedEffectSourceFrom:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    objc_super v3 = [[PBUIBakedEffectSnapshotSource alloc] initWithSnapshotSource:v2];
  }
  else
  {
    objc_super v3 = 0;
  }
  return v3;
}

- (id)registerSnapshotSourceObserver:(id)a3
{
  return [(PBUIReplicaSourceObserverBox *)self->_observers registerSourceObserver:a3];
}

id __58__PBUICachedSnapshotEffectProvider_imageForConfiguration___block_invoke(uint64_t a1, void *a2)
{
  int v4 = MGGetBoolAnswer();
  uint64_t v5 = 4;
  if (!v4) {
    uint64_t v5 = 0;
  }
  *a2 |= v5;
  if (MGGetBoolAnswer()) {
    *a2 |= 2uLL;
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = [WeakRetained[6] snapshot];
  id v8 = -[PBUICachedSnapshotEffectProvider compositeImage:effectConfiguration:]((uint64_t)WeakRetained, v7, *(void **)(a1 + 32));

  return v8;
}

- (id)compositeImage:(void *)a3 effectConfiguration:
{
  id v5 = a2;
  char v6 = v5;
  uint64_t v7 = 0;
  if (a1 && v5)
  {
    id v8 = a3;
    BOOL v9 = -[PBUIWallpaperEffectConfiguration requiresMaterialKitRendering]((BOOL)v8);
    uint64_t v10 = 32;
    if (v9) {
      uint64_t v10 = 40;
    }
    id v11 = *(id *)(a1 + v10);
    id v15 = 0;
    uint64_t v7 = [v11 applyEffect:v8 toImage:v6 error:&v15];

    id v12 = v15;
    if (v12)
    {
      id v13 = PBUILogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[PBUICachedSnapshotEffectProvider compositeImage:effectConfiguration:]((uint64_t)v6, (uint64_t)v12, v13);
      }
    }
  }

  return v7;
}

- (uint64_t)cacheIdentifier
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)cache
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (void)setCache:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSource, 0);
  objc_storeStrong((id *)&self->_materialCompositor, 0);
  objc_storeStrong((id *)&self->_backdropCompositor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_snapshotProvider, 0);
  objc_storeStrong((id *)&self->_snapshotSubscription, 0);
}

- (void)compositeImage:(os_log_t)log effectConfiguration:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BC4B3000, log, OS_LOG_TYPE_ERROR, "Error compositing image %@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end