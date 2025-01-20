@interface PBFPosterGalleryAssetHelper
- (BOOL)_kickoffPreviewGeneratorForPosterPreview:(id)a3 context:(id)a4;
- (BOOL)_sizeContainerView:(id)a3 forPreview:(id)a4 displayContext:(id)a5;
- (BOOL)_updateHydrationStateIfNeeded;
- (BOOL)_updateHydrationStateTo:(int64_t)a3 reason:(id)a4;
- (BOOL)isSuspended;
- (CGSize)_contentSizeForPreview:(id)a3;
- (NSSet)knownDisplayContexts;
- (NSSet)posterPreviews;
- (PBFDisplayContext)activeDisplayContext;
- (PBFExtensionInstanceProviding)extensionInstanceProvider;
- (PBFPosterGalleryAssetHelper)initWithPreviewGenerator:(id)a3 extensionInstanceProvider:(id)a4;
- (PBFPosterGalleryAssetHelperDelegate)delegate;
- (PBFPosterPreviewGenerator)previewGenerator;
- (id)_newImageViewWithImage:(id)a3 posterPreview:(id)a4;
- (id)assetsForPosterPreview:(id)a3;
- (id)knownDisplayContextWithoutActiveDisplayContext;
- (void)_receiveUpdatedAssetForPosterPreview:(id)a3 definition:(id)a4 displayContext:(id)a5 image:(id)a6 fetchError:(id)a7;
- (void)_resetHydrationState;
- (void)_setupLiveDisplayStyleForPreview:(id)a3;
- (void)_setupLiveViewControllerForInstance:(id)a3 preview:(id)a4;
- (void)_sizeAssetsForActiveDisplayContext;
- (void)_stateWasUpdated:(BOOL)a3;
- (void)_stateWasUpdatedForPosterPreviews:(id)a3;
- (void)_teardownLiveViewController:(id)a3 invalidate:(BOOL)a4;
- (void)_teardownState:(id)a3;
- (void)_teardownStateForPosterPreviews:(id)a3;
- (void)_updateHydrationStateIfNeeded;
- (void)appendDisplayContext:(id)a3;
- (void)cancel;
- (void)cancelPrefetchForPosterPreviews:(id)a3;
- (void)galleryPosterViewController:(id)a3 stateChangedTo:(int64_t)a4;
- (void)invalidate;
- (void)prefetchPosterPreviews:(id)a3;
- (void)resetKnownDisplayContexts;
- (void)setActiveDisplayContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPosterPreviews:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)updatePosterPreview:(id)a3 isVisible:(BOOL)a4;
@end

@implementation PBFPosterGalleryAssetHelper

- (PBFPosterGalleryAssetHelper)initWithPreviewGenerator:(id)a3 extensionInstanceProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"previewGenerator"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterGalleryAssetHelper initWithPreviewGenerator:extensionInstanceProvider:](a2);
    }
LABEL_11:
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D322452CLL);
  }
  v9 = v8;
  if (!v8)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extensionInstanceProvider"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterGalleryAssetHelper initWithPreviewGenerator:extensionInstanceProvider:](a2);
    }
    goto LABEL_11;
  }
  v16.receiver = self;
  v16.super_class = (Class)PBFPosterGalleryAssetHelper;
  v10 = [(PBFPosterGalleryAssetHelper *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_previewGenerator, v7);
    objc_storeWeak((id *)&v11->_extensionInstanceProvider, v9);
    uint64_t v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    previewToState = v11->_previewToState;
    v11->_previewToState = (NSMapTable *)v12;

    v11->_isSuspended = 1;
  }

  return v11;
}

- (void)setPosterPreviews:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    v5 = PBFLogAssetHelper();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      v13 = self;
      v6 = "(%p) bail setPosterPreviews; invalidated";
LABEL_7:
      _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (BSEqualSets())
  {
    v5 = PBFLogAssetHelper();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      v13 = self;
      v6 = "(%p) bail setPosterPreviews; same poster previews, no need to do anything";
      goto LABEL_7;
    }
  }
  else
  {
    [(PBFPosterGalleryAssetHelper *)self _resetHydrationState];
    v5 = [v4 mutableCopy];
    [v5 minusSet:self->_posterPreviews];
    id v7 = [(NSSet *)self->_posterPreviews mutableCopy];
    [v7 minusSet:v4];
    id v8 = PBFLogAssetHelper();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 134218242;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_INFO, "(%p) added poster previews: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    v9 = PBFLogAssetHelper();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 134218242;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_INFO, "(%p) added poster removed: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    v10 = (NSSet *)[v4 copy];
    posterPreviews = self->_posterPreviews;
    self->_posterPreviews = v10;

    [(PBFPosterGalleryAssetHelper *)self _teardownStateForPosterPreviews:v7];
    [(PBFPosterGalleryAssetHelper *)self _stateWasUpdatedForPosterPreviews:v5];
  }
}

- (void)setActiveDisplayContext:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = (PBFDisplayContext *)a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    v6 = PBFLogAssetHelper();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134217984;
      v20 = self;
      id v7 = "(%p) bail setActiveDisplayContext; invalidated";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
      _os_log_impl(&dword_1D31CE000, v8, v9, v7, (uint8_t *)&v19, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  int v10 = BSEqualObjects();
  v11 = PBFLogAssetHelper();
  v6 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218242;
      v20 = self;
      __int16 v21 = 2114;
      v22 = v5;
      _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "(%p) updating active display context: %{public}@", (uint8_t *)&v19, 0x16u);
    }

    objc_storeStrong((id *)&self->_activeDisplayContext, a3);
    if (self->_activeDisplayContext)
    {
      +[PBFPosterGalleryViewSpec specForDisplayContext:](PBFPosterGalleryViewSpec, "specForDisplayContext:");
      int v12 = (PBFPosterGalleryViewSpec *)objc_claimAutoreleasedReturnValue();
      activeDisplayContextSpec = self->_activeDisplayContextSpec;
      self->_activeDisplayContextSpec = v12;

      __int16 v14 = PBFLogAssetHelper();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        activeDisplayContext = self->_activeDisplayContext;
        int v19 = 134218242;
        v20 = self;
        __int16 v21 = 2114;
        v22 = activeDisplayContext;
        uint64_t v16 = "(%p) updating spec for active display context: %{public}@";
LABEL_17:
        _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, 0x16u);
      }
    }
    else
    {
      v17 = self->_activeDisplayContextSpec;
      self->_activeDisplayContextSpec = 0;

      __int16 v14 = PBFLogAssetHelper();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_activeDisplayContext;
        int v19 = 134218242;
        v20 = self;
        __int16 v21 = 2114;
        v22 = v18;
        uint64_t v16 = "(%p) clearing spec for active display context: %{public}@";
        goto LABEL_17;
      }
    }

    [(PBFPosterGalleryAssetHelper *)self _resetHydrationState];
    [(PBFPosterGalleryAssetHelper *)self _stateWasUpdated:1];
    goto LABEL_9;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v19 = 134217984;
    v20 = self;
    id v7 = "(%p) abort updating active display context; same as existing context";
    id v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
}

- (void)appendDisplayContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isInvalidated)
  {
    v5 = PBFLogAssetHelper();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      int v10 = self;
      _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "(%p) bail appendDisplayContext; invalidated",
        (uint8_t *)&v9,
        0xCu);
    }
  }
  else
  {
    if (!self->_knownDisplayContexts)
    {
      v6 = (NSMutableSet *)objc_opt_new();
      knownDisplayContexts = self->_knownDisplayContexts;
      self->_knownDisplayContexts = v6;
    }
    id v8 = PBFLogAssetHelper();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218242;
      int v10 = self;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_DEFAULT, "(%p) appending display context: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    [(NSMutableSet *)self->_knownDisplayContexts addObject:v4];
  }
}

- (void)resetKnownDisplayContexts
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL isInvalidated = self->_isInvalidated;
  id v4 = PBFLogAssetHelper();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isInvalidated)
  {
    if (v5)
    {
      int v11 = 134217984;
      id v12 = self;
      v6 = "(%p) bail resetKnownDisplayContexts; invalidated";
      id v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
      _os_log_impl(&dword_1D31CE000, v7, v8, v6, (uint8_t *)&v11, 0xCu);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (v5)
  {
    int v11 = 134217984;
    id v12 = self;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "(%p) resetting known display context", (uint8_t *)&v11, 0xCu);
  }

  [(NSMutableSet *)self->_knownDisplayContexts removeAllObjects];
  int64_t assetHydrationState = self->_assetHydrationState;
  int v10 = PBFLogAssetHelper();
  id v4 = v10;
  if (assetHydrationState < 2)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      id v12 = self;
      v6 = "(%p) bail reset hydration state after resetKnownDisplayContexts";
      id v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_INFO;
      goto LABEL_12;
    }
LABEL_13:

    return;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    id v12 = self;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "(%p) known display context was reset during asset hydration state of alternate display context - resetting hydration state", (uint8_t *)&v11, 0xCu);
  }

  [(PBFPosterGalleryAssetHelper *)self _resetHydrationState];
  [(PBFPosterGalleryAssetHelper *)self _stateWasUpdated:1];
}

- (NSSet)knownDisplayContexts
{
  activeDisplayContext = self->_activeDisplayContext;
  knownDisplayContexts = self->_knownDisplayContexts;
  if (activeDisplayContext)
  {
    id v4 = -[NSMutableSet setByAddingObject:](knownDisplayContexts, "setByAddingObject:");
  }
  else
  {
    id v4 = (void *)[(NSMutableSet *)knownDisplayContexts copy];
  }
  return (NSSet *)v4;
}

- (id)knownDisplayContextWithoutActiveDisplayContext
{
  v3 = (void *)[(NSMutableSet *)self->_knownDisplayContexts mutableCopy];
  [v3 removeObject:self->_activeDisplayContext];
  return v3;
}

- (void)setSuspended:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_isInvalidated)
  {
    id v4 = PBFLogAssetHelper();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      id v12 = self;
      BOOL v5 = "(%p) bail setSuspended; invalidated";
      v6 = v4;
      uint32_t v7 = 12;
LABEL_7:
      _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, v7);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  int v8 = a3;
  int isSuspended = self->_isSuspended;
  id v4 = PBFLogAssetHelper();
  BOOL v10 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isSuspended == v8)
  {
    if (v10)
    {
      int v11 = 134218240;
      id v12 = self;
      __int16 v13 = 1024;
      int v14 = v8;
      BOOL v5 = "(%p) bail update suspended; isSuspended is already %{BOOL}u";
      v6 = v4;
      uint32_t v7 = 18;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  if (v10)
  {
    int v11 = 134218240;
    id v12 = self;
    __int16 v13 = 1024;
    int v14 = v8;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "(%p) update suspended: %{BOOL}u", (uint8_t *)&v11, 0x12u);
  }

  self->_int isSuspended = v8;
  [(PBFPosterGalleryAssetHelper *)self _stateWasUpdated:1];
}

- (void)updatePosterPreview:(id)a3 isVisible:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    uint32_t v7 = PBFLogAssetHelper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      id v12 = self;
      _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "(%p) bail updatePosterPreview; invalidated",
        (uint8_t *)&v11,
        0xCu);
    }
  }
  else
  {
    uint32_t v7 = [(NSMapTable *)self->_previewToState objectForKey:v6];
    int v8 = [v7 isVisible];
    int v9 = PBFLogAssetHelper();
    BOOL v10 = v9;
    if (v8 == v4)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PBFPosterGalleryAssetHelper updatePosterPreview:isVisible:]();
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 134218498;
        id v12 = self;
        __int16 v13 = 2114;
        id v14 = v6;
        __int16 v15 = 1024;
        BOOL v16 = v4;
        _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_INFO, "(%p) updatePosterPreview for posterPreview %{public}@; marking visible as %{BOOL}u",
          (uint8_t *)&v11,
          0x1Cu);
      }

      [v7 setVisible:v4];
      BOOL v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
      [(PBFPosterGalleryAssetHelper *)self _stateWasUpdatedForPosterPreviews:v10];
    }
  }
}

- (void)prefetchPosterPreviews:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    BOOL v5 = PBFLogAssetHelper();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v15 = self;
      _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "(%p) bail prefetchPosterPreviews; invalidated",
        buf,
        0xCu);
    }
  }
  else
  {
    id v6 = (void *)[v4 mutableCopy];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    BOOL v10 = __54__PBFPosterGalleryAssetHelper_prefetchPosterPreviews___block_invoke;
    int v11 = &unk_1E6982718;
    id v12 = self;
    BOOL v5 = v6;
    __int16 v13 = v5;
    [v4 enumerateObjectsUsingBlock:&v8];
    uint32_t v7 = PBFLogAssetHelper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v15 = self;
      __int16 v16 = 2114;
      uint64_t v17 = v5;
      _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_INFO, "(%p) prefetchPosterPreviews: %{public}@", buf, 0x16u);
    }

    -[PBFPosterGalleryAssetHelper _stateWasUpdatedForPosterPreviews:](self, "_stateWasUpdatedForPosterPreviews:", v5, v8, v9, v10, v11, v12);
  }
}

void __54__PBFPosterGalleryAssetHelper_prefetchPosterPreviews___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKey:");
  if ([v3 shouldPrefetch]) {
    [*(id *)(a1 + 40) removeObject:v4];
  }
  else {
    [v3 setShouldPrefetch:1];
  }
}

- (void)cancelPrefetchForPosterPreviews:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    BOOL v5 = PBFLogAssetHelper();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v15 = self;
      _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "(%p) bail cancelPrefetchForPosterPreviews; invalidated",
        buf,
        0xCu);
    }
  }
  else
  {
    id v6 = (void *)[v4 mutableCopy];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    BOOL v10 = __63__PBFPosterGalleryAssetHelper_cancelPrefetchForPosterPreviews___block_invoke;
    int v11 = &unk_1E6982718;
    id v12 = self;
    BOOL v5 = v6;
    __int16 v13 = v5;
    [v4 enumerateObjectsUsingBlock:&v8];
    uint32_t v7 = PBFLogAssetHelper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v15 = self;
      __int16 v16 = 2114;
      uint64_t v17 = v5;
      _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "(%p) cancelPrefetchForPosterPreviews: %{public}@", buf, 0x16u);
    }

    -[PBFPosterGalleryAssetHelper _stateWasUpdatedForPosterPreviews:](self, "_stateWasUpdatedForPosterPreviews:", v5, v8, v9, v10, v11, v12);
  }
}

void __63__PBFPosterGalleryAssetHelper_cancelPrefetchForPosterPreviews___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKey:");
  if ([v3 shouldPrefetch]) {
    [v3 setShouldPrefetch:0];
  }
  else {
    [*(id *)(a1 + 40) removeObject:v4];
  }
}

- (id)assetsForPosterPreview:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    BOOL v5 = PBFLogAssetHelper();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 134217984;
      v31 = self;
      _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "(%p) bail assetsForPosterPreview; invalidated",
        (uint8_t *)&v30,
        0xCu);
    }
    id v6 = 0;
  }
  else
  {
    uint32_t v7 = [(NSMapTable *)self->_previewToState objectForKey:v4];
    BOOL v5 = v7;
    if (v7)
    {
      uint64_t v8 = [v7 previewImageView];
      uint64_t v9 = [v5 livePreviewViewController];
      BOOL v11 = [v5 livePreviewState] == 1 && v9 != 0;
      if ([v5 willUseLivePreview])
      {
        id v12 = +[PBFPosterSnapshotDefinition gallerySnapshotKeyFrameDefinition];
        __int16 v13 = [v5 snapshotCollection];
        id v14 = [v13 receivedImageForDefinition:v12 displayContext:self->_activeDisplayContext];

        if (!v14)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_previewGenerator);
          id v14 = [WeakRetained preparedSnapshotForPosterPreview:v4 context:self->_activeDisplayContext definition:v12];
        }
      }
      else
      {
        id v14 = 0;
      }
      __int16 v16 = [v5 snapshotCollection];
      uint64_t v17 = +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:v4];
      uint64_t v18 = [v16 receivedImageForDefinition:v17 displayContext:self->_activeDisplayContext];

      int v19 = [v8 image];

      if (v18 != v19)
      {
        [(PBFPosterGalleryAssetHelper *)self _contentSizeForPreview:v4];
        if (-[NSObject updateImage:imageSize:](v8, "updateImage:imageSize:", v18)) {
          [(PBFPosterGalleryAssetHelper *)self _sizeContainerView:v8 forPreview:v4 displayContext:self->_activeDisplayContext];
        }
      }
      v20 = PBFLogAssetHelper();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

      if (v21)
      {
        v22 = PBFLogAssetHelper();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          int v30 = 134219010;
          v31 = self;
          __int16 v32 = 2114;
          id v33 = v4;
          __int16 v34 = 2112;
          v35 = v8;
          __int16 v36 = 2112;
          v37 = v9;
          __int16 v38 = 1024;
          BOOL v39 = v11;
          _os_log_debug_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_DEBUG, "(%p) assetsForPosterPreview: %{public}@ -- imageView: %@; livePreviewViewController: %@; livePreviewIsReady: %{BOOL}u;",
            (uint8_t *)&v30,
            0x30u);
        }
      }
      id v6 = [v5 asset];
      uint64_t v23 = [v6 image];
      v24 = [v8 image];

      if (v23 != v24)
      {
        v25 = [v8 image];
        [v6 setImage:v25];
      }
      v26 = [v6 imageView];

      if (v26 != v8) {
        [v6 setImageView:v8];
      }
      if (v11)
      {
        v27 = [v6 liveViewController];

        if (v27 != v9) {
          [v6 setLiveViewController:v9];
        }
        v28 = [v6 keyFrameImage];

        if (v28 != v14) {
          [v6 setKeyFrameImage:v14];
        }
      }
      else
      {
        [v6 setLiveViewController:0];
      }
    }
    else
    {
      uint64_t v8 = PBFLogAssetHelper();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 134218242;
        v31 = self;
        __int16 v32 = 2114;
        id v33 = v4;
        _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_DEFAULT, "(%p) assetsForPosterPreview: %{public}@ -- no state found; not tracking poster preview?",
          (uint8_t *)&v30,
          0x16u);
      }
      id v6 = 0;
    }
  }
  return v6;
}

- (void)_stateWasUpdated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  BOOL isInvalidated = self->_isInvalidated;
  id v6 = PBFLogAssetHelper();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (isInvalidated)
  {
    if (v7) {
      -[PBFPosterGalleryAssetHelper _stateWasUpdated:]();
    }
  }
  else
  {
    if (v7) {
      -[PBFPosterGalleryAssetHelper _stateWasUpdated:]();
    }

    id v6 = [(PBFPosterGalleryAssetHelper *)self posterPreviews];
    BOOL v8 = [(PBFPosterGalleryAssetHelper *)self _updateHydrationStateIfNeeded];
    uint64_t v9 = PBFLogAssetHelper();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8 || v3)
    {
      if (v10)
      {
        int v11 = 134218498;
        id v12 = self;
        __int16 v13 = 1024;
        BOOL v14 = v3;
        __int16 v15 = 2114;
        __int16 v16 = v6;
        _os_log_debug_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_DEBUG, "(%p) _stateWasUpdated:%{BOOL}u; update hydration state was needed for poster previews: %{public}@",
          (uint8_t *)&v11,
          0x1Cu);
      }

      [(PBFPosterGalleryAssetHelper *)self _stateWasUpdatedForPosterPreviews:v6];
    }
    else
    {
      if (v10) {
        -[PBFPosterGalleryAssetHelper _stateWasUpdated:]();
      }
    }
    [(PBFPosterGalleryAssetHelper *)self _sizeAssetsForActiveDisplayContext];
  }
}

- (BOOL)_updateHydrationStateIfNeeded
{
  void (**v6)(void *__return_ptr);
  int8x16_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  char v17;
  BOOL v18;
  unint64_t v19;
  int64_t *v20;
  __CFString *v21;
  int v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  PBFPosterGalleryAssetHelper *v27;
  uint64_t v28;
  os_signpost_id_t v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  unint64_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  unint64_t v37;
  __CFString *v38;
  unint64_t v39;
  __CFString *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  unint64_t v44;
  __CFString *v45;
  __CFString *v46;
  char v48;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  long long v53;
  int8x16_t v54;
  long long v55;
  int64x2_t v56;
  long long v57;
  long long v58;
  void aBlock[5];
  _OWORD buf[5];
  long long v61;
  unsigned char v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E4F143B8];
  if (self->_isInvalidated)
  {
    BOOL v3 = PBFLogAssetHelper();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PBFPosterGalleryAssetHelper _updateHydrationStateIfNeeded]();
    }

    return 0;
  }
  p_int64_t assetHydrationState = &self->_assetHydrationState;
  if (self->_assetHydrationState)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PBFPosterGalleryAssetHelper__updateHydrationStateIfNeeded__block_invoke;
    aBlock[3] = &unk_1E6982740;
    aBlock[4] = self;
    id v6 = (void (**)(void *__return_ptr))_Block_copy(aBlock);
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    ((void (**)(long long *__return_ptr))v6)[2](&v53);
    BOOL v7 = (int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vextq_s8(v54, v54, 8uLL)), (int32x4_t)vceqzq_s64(v56));
    BOOL v8 = vaddvq_s32((int32x4_t)vbicq_s8((int8x16_t)xmmword_1D337EA40, v7));
    if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8(v7))))
    {
      uint64_t v9 = 0;
      BOOL v10 = 0;
    }
    else
    {
      v48 = v8;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      id v12 = [(PBFPosterGalleryAssetHelper *)self knownDisplayContexts];
      __int16 v13 = [v12 countByEnumeratingWithState:&v49 objects:v62 count:16];
      if (v13)
      {
        BOOL v14 = v13;
        uint64_t v9 = 0;
        BOOL v10 = 0;
        __int16 v15 = *(void *)v50;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(void *)v50 != v15) {
              objc_enumerationMutation(v12);
            }
            if (*(PBFDisplayContext **)(*((void *)&v49 + 1) + 8 * i) != self->_activeDisplayContext)
            {
              v61 = 0u;
              memset(buf, 0, sizeof(buf));
              ((void (*)(_OWORD *__return_ptr, void (**)(void *__return_ptr)))v6[2])(buf, v6);
              v10 += v61;
              v9 += *((void *)&v61 + 1);
            }
          }
          BOOL v14 = [v12 countByEnumeratingWithState:&v49 objects:v62 count:16];
        }
        while (v14);
      }
      else
      {
        uint64_t v9 = 0;
        BOOL v10 = 0;
      }

      p_int64_t assetHydrationState = &self->_assetHydrationState;
      BOOL v8 = v48;
    }
    uint64_t v17 = v8;
    uint64_t v18 = (v10 | v9) != 0;
    int v19 = *p_assetHydrationState - 1;
    v20 = p_assetHydrationState;
    if (v19 > 2) {
      BOOL v21 = @"PBFPosterGalleryAssetHydrationStateDefault";
    }
    else {
      BOOL v21 = off_1E6982820[v19];
    }
    v22 = v17 & 0xF;
    uint64_t v23 = [NSString stringWithFormat:@"(%@) ", v21];
    v24 = PBFLogAssetHelper();
    v25 = v24;
    if (v22)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[PBFPosterGalleryAssetHelper _updateHydrationStateIfNeeded]();
      }

      v26 = [v23 stringByAppendingString:@"outstanding active display context foreground hydration; transitioning back to initial hydration state to finish those up"];
      v27 = self;
      v28 = 1;
    }
    else
    {
      if (v18)
      {
        v29 = os_signpost_id_generate(v24);

        int v30 = PRIsLowQualityDevice();
        v31 = PBFLogAssetHelper();
        __int16 v32 = v31;
        id v33 = v29 - 1;
        if (!v30)
        {
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_1D31CE000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v29, "HighQualityGalleryHydration", "", (uint8_t *)buf, 2u);
          }

          v41 = PBFLogAssetHelper();
          v42 = v41;
          if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_1D31CE000, v42, OS_SIGNPOST_INTERVAL_END, v29, "HighQualityGalleryHydration", "", (uint8_t *)buf, 2u);
          }

          v43 = PBFLogAssetHelper();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v44 = *v20 - 1;
            if (v44 > 2) {
              v45 = @"PBFPosterGalleryAssetHydrationStateDefault";
            }
            else {
              v45 = off_1E6982820[v44];
            }
            LODWORD(buf[0]) = 134218498;
            *(void *)((char *)buf + 4) = self;
            WORD6(buf[0]) = 2114;
            *(void *)((char *)buf + 14) = v45;
            WORD3(buf[1]) = 2114;
            *((void *)&buf[1] + 1) = @"PBFPosterGalleryAssetHydrationStateAlternateDisplayContextHydration";
            _os_log_impl(&dword_1D31CE000, v43, OS_LOG_TYPE_INFO, "(%p) _updateHydrationStateIfNeeded; executing transitioning from %{public}@ -> %{public}@",
              (uint8_t *)buf,
              0x20u);
          }

          v26 = [v23 stringByAppendingString:@"Outstanding display context fetches are needed after initial hydration"];
          v27 = self;
          v28 = 2;
          goto LABEL_63;
        }
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
        {
          LOWORD(buf[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_1D31CE000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v29, "LowQualityGalleryHydration", "", (uint8_t *)buf, 2u);
        }

        __int16 v34 = PBFLogAssetHelper();
        v35 = v34;
        if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
        {
          LOWORD(buf[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_1D31CE000, v35, OS_SIGNPOST_INTERVAL_END, v29, "LowQualityGalleryHydration", "", (uint8_t *)buf, 2u);
        }

        __int16 v36 = PBFLogAssetHelper();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = *v20 - 1;
          if (v37 > 2) {
            __int16 v38 = @"PBFPosterGalleryAssetHydrationStateDefault";
          }
          else {
            __int16 v38 = off_1E6982820[v37];
          }
          LODWORD(buf[0]) = 134218498;
          *(void *)((char *)buf + 4) = self;
          WORD6(buf[0]) = 2114;
          *(void *)((char *)buf + 14) = v38;
          WORD3(buf[1]) = 2114;
          *((void *)&buf[1] + 1) = @"PBFPosterGalleryAssetHydrationStateComplete";
          _os_log_impl(&dword_1D31CE000, v36, OS_LOG_TYPE_INFO, "(%p) _updateHydrationStateIfNeeded; executing transitioning from %{public}@ -> %{public}@",
            (uint8_t *)buf,
            0x20u);
        }

        v46 = @"Low quality device; marking as complete...";
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          BOOL v39 = *v20 - 1;
          if (v39 > 2) {
            uint64_t v40 = @"PBFPosterGalleryAssetHydrationStateDefault";
          }
          else {
            uint64_t v40 = off_1E6982820[v39];
          }
          LODWORD(buf[0]) = 134218498;
          *(void *)((char *)buf + 4) = self;
          WORD6(buf[0]) = 2114;
          *(void *)((char *)buf + 14) = v40;
          WORD3(buf[1]) = 2114;
          *((void *)&buf[1] + 1) = @"PBFPosterGalleryAssetHydrationStateComplete";
          _os_log_impl(&dword_1D31CE000, v25, OS_LOG_TYPE_INFO, "(%p) _updateHydrationStateIfNeeded; executing transitioning from %{public}@ -> %{public}@",
            (uint8_t *)buf,
            0x20u);
        }

        v46 = @"All requests for active display context as well as other display contexts are complete.";
      }
      v26 = [v23 stringByAppendingString:v46];
      v27 = self;
      v28 = 3;
    }
LABEL_63:
    BOOL v4 = [(PBFPosterGalleryAssetHelper *)v27 _updateHydrationStateTo:v28 reason:v26];

    return v4;
  }
  int v11 = PBFLogAssetHelper();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[PBFPosterGalleryAssetHelper _updateHydrationStateIfNeeded]();
  }

  return [(PBFPosterGalleryAssetHelper *)self _updateHydrationStateTo:1 reason:@"Initial Default->Initial transition."];
}

void __60__PBFPosterGalleryAssetHelper__updateHydrationStateIfNeeded__block_invoke(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v29 = a2;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [*(id *)(a1 + 32) posterPreviews];
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v7 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKey:", v9, v16);
        if (!v10)
        {
          *(void *)(a3 + 88) = v27 + 1;
          *(void *)(a3 + 56) = v23 + 1;
          goto LABEL_27;
        }
        int v11 = (void *)v10;
        id v12 = +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:v9];
        if ([v11 isVisible]) {
          int v13 = 1;
        }
        else {
          int v13 = [v11 shouldPrefetch];
        }
        BOOL v14 = [v11 snapshotCollection];
        uint64_t v15 = [v14 snapshotRequestStatusForDefinition:v12 displayContext:v29 outInvalidationContext:0];

        switch(v15)
        {
          case 0:
            *(void *)(a3 + 88) = ++v27;
            if (v13) {
              *(void *)(a3 + 24) = ++v22;
            }
            else {
              *(void *)(a3 + 56) = ++v23;
            }
            break;
          case 1:
            *(void *)(a3 + 80) = ++v24;
            if (v13) {
              *(void *)(a3 + 16) = ++v18;
            }
            else {
              *(void *)(a3 + 48) = ++v17;
            }
            break;
          case 2:
            *(void *)(a3 + 72) = ++v26;
            if (v13) {
              *(void *)(a3 + 8) = ++v21;
            }
            else {
              *(void *)(a3 + 40) = ++v20;
            }
            break;
          case 3:
            *(void *)(a3 + 64) = ++v25;
            if (v13) {
              *(void *)a3 = ++v16;
            }
            else {
              *(void *)(a3 + 32) = ++v19;
            }
            break;
          default:
            break;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_27:
}

- (BOOL)_updateHydrationStateTo:(int64_t)a3 reason:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (__CFString *)a4;
  if (self->_isInvalidated)
  {
    uint64_t v7 = PBFLogAssetHelper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v19 = 134217984;
      uint64_t v20 = self;
      BOOL v8 = "(%p) bail _updateHydrationStateTo; invalidated";
      uint64_t v9 = v7;
      uint32_t v10 = 12;
LABEL_13:
      _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v19, v10);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  int64_t assetHydrationState = self->_assetHydrationState;
  uint64_t v7 = PBFLogAssetHelper();
  BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (assetHydrationState == a3)
  {
    if (v12)
    {
      if ((unint64_t)(a3 - 1) > 2) {
        int v13 = @"PBFPosterGalleryAssetHydrationStateDefault";
      }
      else {
        int v13 = off_1E6982820[a3 - 1];
      }
      int v19 = 134218498;
      uint64_t v20 = self;
      __int16 v21 = 2114;
      uint64_t v22 = v13;
      __int16 v23 = 2114;
      uint64_t v24 = v6;
      BOOL v8 = "(%p) bail _updateHydrationStateTo; state is same '%{public}@' / reason %{public}@";
      uint64_t v9 = v7;
      uint32_t v10 = 32;
      goto LABEL_13;
    }
LABEL_14:

    BOOL v16 = 0;
    goto LABEL_15;
  }
  if (v12)
  {
    unint64_t v14 = self->_assetHydrationState - 1;
    if (v14 > 2) {
      uint64_t v15 = @"PBFPosterGalleryAssetHydrationStateDefault";
    }
    else {
      uint64_t v15 = off_1E6982820[v14];
    }
    if ((unint64_t)(a3 - 1) > 2) {
      uint64_t v18 = @"PBFPosterGalleryAssetHydrationStateDefault";
    }
    else {
      uint64_t v18 = off_1E6982820[a3 - 1];
    }
    int v19 = 134218754;
    uint64_t v20 = self;
    __int16 v21 = 2114;
    uint64_t v22 = v15;
    __int16 v23 = 2114;
    uint64_t v24 = v18;
    __int16 v25 = 2114;
    uint64_t v26 = v6;
    _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_INFO, "(%p) bail _updateHydrationStateTo; updating state from %{public}@ to '%{public}@' / reason %{public}@",
      (uint8_t *)&v19,
      0x2Au);
  }

  self->_int64_t assetHydrationState = a3;
  BOOL v16 = 1;
LABEL_15:

  return v16;
}

- (void)_sizeAssetsForActiveDisplayContext
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (self->_isInvalidated)
  {
    BOOL v3 = PBFLogAssetHelper();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v54 = self;
      BOOL v4 = "(%p) bail _sizeAssetsForActiveDisplayContext; invalidated";
      uint64_t v5 = v3;
      os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
LABEL_4:
      _os_log_impl(&dword_1D31CE000, v5, v6, v4, buf, 0xCu);
    }
  }
  else
  {
    activeDisplayContext = self->_activeDisplayContext;
    BOOL v3 = PBFLogAssetHelper();
    BOOL v8 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (!activeDisplayContext)
    {
      if (!v8) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 134217984;
      v54 = self;
      BOOL v4 = "(%p) bail _sizeAssetsForActiveDisplayContext; null active display context";
      uint64_t v5 = v3;
      os_log_type_t v6 = OS_LOG_TYPE_INFO;
      goto LABEL_4;
    }
    if (v8)
    {
      uint64_t v9 = self->_activeDisplayContext;
      *(_DWORD *)buf = 134218242;
      v54 = self;
      __int16 v55 = 2114;
      v56 = v9;
      _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_INFO, "(%p) _sizeAssetsForActiveDisplayContext for %{public}@", buf, 0x16u);
    }

    v42 = objc_opt_new();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = [(PBFPosterGalleryAssetHelper *)self posterPreviews];
    uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v49 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v15 = [(NSMapTable *)self->_previewToState objectForKey:v14];
          BOOL v16 = +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:v14];
          uint64_t v17 = [v15 livePreviewViewController];
          if (v17 && (v18 = (void *)v17, uint64_t v19 = [v15 livePreviewState], v18, v19 == 1))
          {
            uint64_t v20 = [v15 livePreviewViewController];
            [v20 setDisplayContext:self->_activeDisplayContext];

            __int16 v21 = [v15 livePreviewViewController];
            uint64_t v22 = [v21 view];
            BOOL v23 = [(PBFPosterGalleryAssetHelper *)self _sizeContainerView:v22 forPreview:v14 displayContext:self->_activeDisplayContext];

            if (v23) {
              [v42 addObject:v14];
            }
          }
          else
          {
            uint64_t v24 = [v15 previewImageView];

            if (v24)
            {
              __int16 v25 = [v15 snapshotCollection];
              uint64_t v26 = [v25 receivedImageForDefinition:v16 displayContext:self->_activeDisplayContext];

              if (v26)
              {
                uint64_t v27 = [v15 previewImageView];
                [(PBFPosterGalleryAssetHelper *)self _contentSizeForPreview:v14];
                int v28 = objc_msgSend(v27, "updateImage:imageSize:", v26);

                if (v28)
                {
                  id v29 = [v15 previewImageView];
                  BOOL v30 = [(PBFPosterGalleryAssetHelper *)self _sizeContainerView:v29 forPreview:v14 displayContext:self->_activeDisplayContext];

                  if (v30) {
                    [v42 addObject:v14];
                  }
                }
              }
            }
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
      }
      while (v11);
    }

    BOOL v3 = v42;
    uint64_t v31 = [v42 count];
    long long v32 = PBFLogAssetHelper();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
    if (v31)
    {
      if (v33)
      {
        __int16 v34 = self->_activeDisplayContext;
        *(_DWORD *)buf = 134218498;
        v54 = self;
        __int16 v55 = 2114;
        v56 = v34;
        __int16 v57 = 2114;
        v58 = v42;
        _os_log_impl(&dword_1D31CE000, v32, OS_LOG_TYPE_INFO, "(%p) _sizeAssetsForActiveDisplayContext for %{public}@; notify delegate of updated assets: %{public}@",
          buf,
          0x20u);
      }

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v32 = v42;
      uint64_t v35 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v45 != v37) {
              objc_enumerationMutation(v32);
            }
            uint64_t v39 = *(void *)(*((void *)&v44 + 1) + 8 * j);
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            [WeakRetained assetHelper:self didUpdateAssetsForPosterPreview:v39];
          }
          uint64_t v36 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v36);
      }
    }
    else if (v33)
    {
      v41 = self->_activeDisplayContext;
      *(_DWORD *)buf = 134218242;
      v54 = self;
      __int16 v55 = 2114;
      v56 = v41;
      _os_log_impl(&dword_1D31CE000, v32, OS_LOG_TYPE_INFO, "(%p) bail _sizeAssetsForActiveDisplayContext for %{public}@; no updated poster previews to notify delegate of",
        buf,
        0x16u);
    }
  }
LABEL_41:
}

- (void)_stateWasUpdatedForPosterPreviews:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    uint64_t v5 = PBFLogAssetHelper();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v82 = self;
      os_log_type_t v6 = "(%p) bail _stateWasUpdatedForPosterPreviews; invalidated";
LABEL_7:
      _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_INFO, v6, buf, 0xCu);
      goto LABEL_103;
    }
    goto LABEL_103;
  }
  if (![(PBFPosterGalleryAssetHelper *)self isSuspended])
  {
    uint64_t v5 = [(PBFPosterGalleryAssetHelper *)self activeDisplayContext];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v61 = v4;
    id obj = v4;
    uint64_t v65 = [obj countByEnumeratingWithState:&v76 objects:v91 count:16];
    if (!v65) {
      goto LABEL_102;
    }
    uint64_t v64 = *(void *)v77;
    v62 = v5;
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v77 != v64) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(__CFString **)(*((void *)&v76 + 1) + 8 * v7);
        -[NSMapTable objectForKey:](self->_previewToState, "objectForKey:", v8, v61);
        uint64_t v9 = (_PBFPosterGalleryAssetState *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          uint64_t v9 = [[_PBFPosterGalleryAssetState alloc] initWithPreview:v8];
          [(NSMapTable *)self->_previewToState setObject:v9 forKey:v8];
          if (!v5) {
            goto LABEL_81;
          }
LABEL_17:
          v67 = +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:v8];
          uint64_t v66 = [(_PBFPosterGalleryAssetState *)v9 snapshotCollection];
          BOOL v10 = [(_PBFPosterGalleryAssetState *)v9 isVisible];
          BOOL v11 = [(_PBFPosterGalleryAssetState *)v9 shouldPrefetch];
          BOOL v12 = [(_PBFPosterGalleryAssetState *)v9 willUseLivePreview];
          int v13 = PBFLogAssetHelper();
          BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
          if (!v12 || !v11 && !v10)
          {
            if (v14)
            {
              *(_DWORD *)buf = 134219010;
              v82 = self;
              __int16 v83 = 2114;
              v84 = v8;
              __int16 v85 = 1024;
              *(_DWORD *)v86 = v12;
              *(_WORD *)&v86[4] = 1024;
              *(_DWORD *)&v86[6] = v11;
              LOWORD(v87) = 1024;
              *(_DWORD *)((char *)&v87 + 2) = v10;
              _os_log_debug_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_DEBUG, "(%p) _stateWasUpdatedForPosterPreviews; skip live preview setup for %{public}@; willUseLivePreview: %{BO"
                "OL}u shouldPrefetch: %{BOOL}u; isVisible: %{BOOL}u",
                buf,
                0x28u);
            }

            BOOL v16 = (void *)v66;
          }
          else
          {
            if (v14)
            {
              *(_DWORD *)buf = 134218242;
              v82 = self;
              __int16 v83 = 2114;
              v84 = v8;
              _os_log_debug_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_DEBUG, "(%p) _stateWasUpdatedForPosterPreviews; checking if live preview is viable for %{public}@",
                buf,
                0x16u);
            }

            uint64_t v17 = [(_PBFPosterGalleryAssetState *)v9 livePreviewState];
            uint64_t v18 = PBFLogAssetHelper();
            uint64_t v19 = v18;
            BOOL v16 = (void *)v66;
            if (v17 == -1)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218242;
                v82 = self;
                __int16 v83 = 2114;
                v84 = v8;
                _os_log_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_INFO, "(%p) _stateWasUpdatedForPosterPreviews; setting up live preview for %{public}@",
                  buf,
                  0x16u);
              }

              [(PBFPosterGalleryAssetHelper *)self _setupLiveDisplayStyleForPreview:v8];
            }
            else
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218242;
                v82 = self;
                __int16 v83 = 2114;
                v84 = v8;
                _os_log_debug_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_DEBUG, "(%p) _stateWasUpdatedForPosterPreviews; live preview for %{public}@ is already setup",
                  buf,
                  0x16u);
              }
            }
          }
          uint64_t v20 = PBFLogAssetHelper();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v52 = self->_assetHydrationState - 1;
            v53 = @"PBFPosterGalleryAssetHydrationStateDefault";
            if (v52 <= 2) {
              v53 = off_1E6982820[v52];
            }
            *(_DWORD *)buf = 134218498;
            v82 = self;
            __int16 v83 = 2114;
            v84 = v53;
            __int16 v85 = 2114;
            *(void *)v86 = v8;
            _os_log_debug_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEBUG, "(%p; %{public}@) _stateWasUpdatedForPosterPreviews for %{public}@",
              buf,
              0x20u);
          }

          unint64_t assetHydrationState = self->_assetHydrationState;
          if (assetHydrationState < 2)
          {
            if (v10 || v11)
            {
              if ([v16 snapshotRequestStatusForDefinition:v67 displayContext:v5 outInvalidationContext:0] != 1)
              {
                if (![(PBFPosterGalleryAssetHelper *)self _kickoffPreviewGeneratorForPosterPreview:v8 context:v5])goto LABEL_79; {
                long long v50 = PBFLogAssetHelper();
                }
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                {
                  unint64_t v56 = self->_assetHydrationState - 1;
                  __int16 v57 = @"PBFPosterGalleryAssetHydrationStateDefault";
                  if (v56 <= 2) {
                    __int16 v57 = off_1E6982820[v56];
                  }
                  *(_DWORD *)buf = 134219010;
                  v82 = self;
                  __int16 v83 = 2114;
                  v84 = v57;
                  __int16 v85 = 2114;
                  *(void *)v86 = v8;
                  *(_WORD *)&v86[8] = 2114;
                  v87 = v5;
                  __int16 v88 = 1024;
                  BOOL v89 = v10;
                  _os_log_debug_impl(&dword_1D31CE000, v50, OS_LOG_TYPE_DEBUG, "(%p; %{public}@)  _stateWasUpdatedForPosterPreviews kickOffPreviewGenerator for posterPreview '%{pub"
                    "lic}@' w/ activeDisplayContext: %{public}@; notifyUpdatedContent? %{BOOL}u",
                    buf,
                    0x30u);
                }

                if (!v10) {
                  goto LABEL_79;
                }
                long long v51 = PBFLogAssetHelper();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                {
                  unint64_t v58 = self->_assetHydrationState - 1;
                  v59 = @"PBFPosterGalleryAssetHydrationStateDefault";
                  if (v58 <= 2) {
                    v59 = off_1E6982820[v58];
                  }
                  *(_DWORD *)buf = 134218498;
                  v82 = self;
                  __int16 v83 = 2114;
                  v84 = v59;
                  __int16 v85 = 2114;
                  *(void *)v86 = v8;
                  _os_log_debug_impl(&dword_1D31CE000, v51, OS_LOG_TYPE_DEBUG, "(%p; %{public}@)  _stateWasUpdatedForPosterPreviews will notifyUpdatedContent for posterPreview '%{public}@'",
                    buf,
                    0x20u);
                }

                id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
                [WeakRetained assetHelper:self didUpdateAssetsForPosterPreview:v8];
LABEL_80:

                goto LABEL_81;
              }
              id WeakRetained = PBFLogAssetHelper();
              if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_80;
              }
              unint64_t v26 = self->_assetHydrationState - 1;
              uint64_t v27 = @"PBFPosterGalleryAssetHydrationStateDefault";
              if (v26 <= 2) {
                uint64_t v27 = off_1E6982820[v26];
              }
              *(_DWORD *)buf = 134218498;
              v82 = self;
              __int16 v83 = 2114;
              v84 = v27;
              __int16 v85 = 2114;
              *(void *)v86 = v8;
              int v28 = WeakRetained;
              id v29 = "(%p; %{public}@) bail _stateWasUpdatedForPosterPreviews for posterPreview '%{public}@' because request is in flight";
LABEL_94:
              _os_log_debug_impl(&dword_1D31CE000, v28, OS_LOG_TYPE_DEBUG, v29, buf, 0x20u);
              goto LABEL_80;
            }
            uint64_t v22 = [v16 invalidateAndRemoveInProgressRequestsNotMatchingContext:v5];
            uint64_t v39 = PBFLogAssetHelper();
            BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG);

            if (!v40 || !v22) {
              goto LABEL_78;
            }
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            uint64_t v22 = v22;
            uint64_t v41 = [v22 countByEnumeratingWithState:&v72 objects:v90 count:16];
            if (v41)
            {
              uint64_t v42 = v41;
              uint64_t v43 = *(void *)v73;
              do
              {
                uint64_t v44 = 0;
                do
                {
                  if (*(void *)v73 != v43) {
                    objc_enumerationMutation(v22);
                  }
                  long long v45 = *(NSObject **)(*((void *)&v72 + 1) + 8 * v44);
                  long long v46 = PBFLogAssetHelper();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                  {
                    unint64_t v47 = self->_assetHydrationState - 1;
                    long long v48 = @"PBFPosterGalleryAssetHydrationStateDefault";
                    if (v47 <= 2) {
                      long long v48 = off_1E6982820[v47];
                    }
                    *(_DWORD *)buf = 134218754;
                    v82 = self;
                    __int16 v83 = 2114;
                    v84 = v48;
                    __int16 v85 = 2114;
                    *(void *)v86 = v8;
                    *(_WORD *)&v86[8] = 2114;
                    v87 = v45;
                    _os_log_debug_impl(&dword_1D31CE000, v46, OS_LOG_TYPE_DEBUG, "(%p; %{public}@) _stateWasUpdatedForPosterPreviews invalidating request for posterPreview '%{publi"
                      "c}@' because of non-activeDisplayContext %{public}@",
                      buf,
                      0x2Au);
                  }

                  ++v44;
                }
                while (v42 != v44);
                uint64_t v49 = [v22 countByEnumeratingWithState:&v72 objects:v90 count:16];
                uint64_t v42 = v49;
              }
              while (v49);
            }
          }
          else
          {
            if (assetHydrationState != 2)
            {
              if (assetHydrationState == 3)
              {
                uint64_t v22 = PBFLogAssetHelper();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                {
                  unint64_t v23 = self->_assetHydrationState - 1;
                  uint64_t v24 = @"PBFPosterGalleryAssetHydrationStateDefault";
                  if (v23 <= 2) {
                    uint64_t v24 = off_1E6982820[v23];
                  }
                  *(_DWORD *)buf = 134218498;
                  v82 = self;
                  __int16 v83 = 2114;
                  v84 = v24;
                  __int16 v85 = 2114;
                  *(void *)v86 = v8;
                  _os_log_debug_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_DEBUG, "(%p; %{public}@)  _stateWasUpdatedForPosterPreviews for posterPreview '%{public}@'",
                    buf,
                    0x20u);
                }
LABEL_78:
              }
LABEL_79:
              id WeakRetained = PBFLogAssetHelper();
              if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_80;
              }
              unint64_t v54 = self->_assetHydrationState - 1;
              __int16 v55 = @"PBFPosterGalleryAssetHydrationStateDefault";
              if (v54 <= 2) {
                __int16 v55 = off_1E6982820[v54];
              }
              *(_DWORD *)buf = 134218498;
              v82 = self;
              __int16 v83 = 2114;
              v84 = v55;
              __int16 v85 = 2114;
              *(void *)v86 = v8;
              int v28 = WeakRetained;
              id v29 = "(%p; %{public}@)  _stateWasUpdatedForPosterPreviews will *NOT* notifyUpdatedContent for posterPreview '%{public}@'";
              goto LABEL_94;
            }
            if (!v10 && !v11) {
              goto LABEL_79;
            }
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            uint64_t v22 = [(PBFPosterGalleryAssetHelper *)self knownDisplayContextWithoutActiveDisplayContext];
            uint64_t v30 = [v22 countByEnumeratingWithState:&v68 objects:v80 count:16];
            if (!v30) {
              goto LABEL_78;
            }
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v69;
            do
            {
              uint64_t v33 = 0;
              do
              {
                if (*(void *)v69 != v32) {
                  objc_enumerationMutation(v22);
                }
                __int16 v34 = *(NSObject **)(*((void *)&v68 + 1) + 8 * v33);
                uint64_t v35 = PBFLogAssetHelper();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                {
                  unint64_t v36 = self->_assetHydrationState - 1;
                  uint64_t v37 = @"PBFPosterGalleryAssetHydrationStateDefault";
                  if (v36 <= 2) {
                    uint64_t v37 = off_1E6982820[v36];
                  }
                  *(_DWORD *)buf = 134218754;
                  v82 = self;
                  __int16 v83 = 2114;
                  v84 = v37;
                  __int16 v85 = 2114;
                  *(void *)v86 = v8;
                  *(_WORD *)&v86[8] = 2114;
                  v87 = v34;
                  _os_log_debug_impl(&dword_1D31CE000, v35, OS_LOG_TYPE_DEBUG, "(%p; %{public}@)  _stateWasUpdatedForPosterPreviews kickOffPreviewGenerator for posterPreview '%{pub"
                    "lic}@' w/ display context: %{public}@;",
                    buf,
                    0x2Au);
                }

                [(PBFPosterGalleryAssetHelper *)self _kickoffPreviewGeneratorForPosterPreview:v8 context:v34];
                ++v33;
              }
              while (v31 != v33);
              uint64_t v38 = [v22 countByEnumeratingWithState:&v68 objects:v80 count:16];
              uint64_t v31 = v38;
            }
            while (v38);
          }
          uint64_t v5 = v62;
          BOOL v16 = (void *)v66;
          goto LABEL_78;
        }
        if (v5) {
          goto LABEL_17;
        }
LABEL_81:

        ++v7;
      }
      while (v7 != v65);
      uint64_t v60 = [obj countByEnumeratingWithState:&v76 objects:v91 count:16];
      uint64_t v65 = v60;
      if (!v60)
      {
LABEL_102:

        id v4 = v61;
        goto LABEL_103;
      }
    }
  }
  uint64_t v5 = PBFLogAssetHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v82 = self;
    os_log_type_t v6 = "(%p) bail _stateWasUpdatedForPosterPreviews; is suspended";
    goto LABEL_7;
  }
LABEL_103:
}

- (BOOL)_kickoffPreviewGeneratorForPosterPreview:(id)a3 context:(id)a4
{
  v94[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v72 = (PBFDisplayContext *)a4;
  BSDispatchQueueAssertMain();
  long long v70 = v6;
  if (self->_isInvalidated)
  {
    uint64_t v7 = PBFLogAssetHelper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v85 = self;
      _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_INFO, "(%p) bail _kickoffPreviewGeneratorForPosterPreview; invalidated",
        buf,
        0xCu);
    }
    LOBYTE(v63) = 0;
    goto LABEL_86;
  }
  val = self;
  BOOL v8 = [(NSMapTable *)self->_previewToState objectForKey:v6];
  unint64_t v58 = v8;
  if (v8)
  {
    long long v68 = [v8 snapshotCollection];
    uint64_t v66 = +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:v6];
    uint64_t v65 = +[PBFPosterSnapshotDefinition gallerySnapshotKeyFrameDefinition];
    if ([v58 willUseLivePreview])
    {
      v94[0] = v66;
      v94[1] = v65;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
    }
    else
    {
      v93 = v66;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
    }
    BOOL v11 = (void *)v9;
    id v69 = [v58 previewImageView];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = v11;
    uint64_t v67 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
    if (!v67)
    {
      LOBYTE(v63) = 0;
      goto LABEL_84;
    }
    LOBYTE(v63) = 0;
    location = (id *)&self->_previewGenerator;
    uint64_t v64 = *(void *)v81;
    double v13 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    *(void *)&long long v12 = 134218242;
    long long v57 = v12;
    while (1)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v81 != v64) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v80 + 1) + 8 * v15);
        int v17 = objc_msgSend(v65, "isEqualToDefinition:", v16, v57);
        int v18 = [v66 isEqualToDefinition:v16];
        uint64_t v19 = [v68 receivedImageForDefinition:v16 displayContext:v72];
        uint64_t v20 = PBFLogAssetHelper();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          __int16 v85 = val;
          __int16 v86 = 2114;
          v87 = v70;
          __int16 v88 = 1024;
          LODWORD(v89) = v19 != 0;
          _os_log_debug_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; checking state image cache for %{public}@; found? %{BOOL}u",
            buf,
            0x1Cu);
        }

        if (v19)
        {
          BOOL v21 = 0;
LABEL_21:
          BOOL v22 = val->_activeDisplayContext == v72;
          goto LABEL_22;
        }
        __int16 v25 = [v70 type];
        int v26 = [v25 isEqual:PBFPreviewTypeHero];

        if ((v26 & v18) != 0)
        {
          uint64_t v27 = PBFLogAssetHelper();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v57;
            __int16 v85 = val;
            __int16 v86 = 2114;
            v87 = v70;
            _os_log_debug_impl(&dword_1D31CE000, v27, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; processing PBFPreviewTypeHero for poster preview %{public}@",
              buf,
              0x16u);
          }

          int v28 = [v70 posterDescriptorLookupInfo];
          v62 = [v28 posterDescriptorPath];
          id v29 = [v28 posterDescriptorExtension];
          uint64_t v30 = [v62 descriptorIdentifier];
          uint64_t v19 = objc_msgSend(MEMORY[0x1E4FB1818], "pbf_galleryHeroSnapshotForExtension:descriptorIdentifier:displayContext:", v29, v30, v72);
          if (v19)
          {
            int v31 = 1;
          }
          else
          {
            uint64_t v35 = PBFLogAssetHelper();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v57;
              __int16 v85 = val;
              __int16 v86 = 2114;
              v87 = v70;
              _os_log_debug_impl(&dword_1D31CE000, v35, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; No image for PBFPreviewTypeHero for preview %{public}@; a"
                "ttempting to check galleryOptions",
                buf,
                0x16u);
            }

            v59 = [v58 galleryOptions];
            if (!v59) {
              goto LABEL_53;
            }
            unint64_t v36 = [v59 galleryAssetLookupInfo];
            uint64_t v37 = [v29 posterExtensionBundle];
            uint64_t v19 = objc_msgSend(v36, "pbf_imageFromBundle:displayContext:error:", v37, v72, 0);

            if (v19)
            {
              uint64_t v38 = PBFLogAssetHelper();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v57;
                __int16 v85 = val;
                __int16 v86 = 2114;
                v87 = v70;
                _os_log_debug_impl(&dword_1D31CE000, v38, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; image generated for preview type PBFPreviewTypeHero for %{public}@",
                  buf,
                  0x16u);
              }
              int v31 = 1;
            }
            else
            {
LABEL_53:
              uint64_t v38 = PBFLogAssetHelper();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v57;
                __int16 v85 = val;
                __int16 v86 = 2114;
                v87 = v70;
                _os_log_error_impl(&dword_1D31CE000, v38, OS_LOG_TYPE_ERROR, "(%p) _kickoffPreviewGeneratorForPosterPreview; NO image generated for preview type PBFPreviewTypeHero for %{public}@",
                  buf,
                  0x16u);
              }
              uint64_t v19 = 0;
              int v31 = 0;
            }
          }
          BOOL v21 = v31 != 0;
          if (v19) {
            goto LABEL_21;
          }
        }
        id WeakRetained = objc_loadWeakRetained(location);
        uint64_t v19 = [WeakRetained preparedSnapshotForPosterPreview:v70 context:v72 definition:v16];

        BOOL v21 = v19 != 0;
        BOOL v40 = PBFLogAssetHelper();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          __int16 v85 = val;
          __int16 v86 = 2114;
          v87 = v70;
          __int16 v88 = 1024;
          LODWORD(v89) = v19 != 0;
          _os_log_debug_impl(&dword_1D31CE000, v40, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; checking previewGenerator image cache for %{public}@; found? %{BOOL}u",
            buf,
            0x1Cu);
        }

        activeDisplayContext = val->_activeDisplayContext;
        BOOL v22 = activeDisplayContext == v72;
        if (!v19)
        {
          uint64_t v42 = PBFLogAssetHelper();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v57;
            __int16 v85 = val;
            __int16 v86 = 2114;
            v87 = v70;
            _os_log_debug_impl(&dword_1D31CE000, v42, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; no image found for %{public}@; cleaning up state",
              buf,
              0x16u);
          }

          if (v69)
          {
            BOOL v43 = activeDisplayContext == v72;
            uint64_t v44 = [v69 image];
            if (!v44) {
              BOOL v43 = 0;
            }

            if ((v43 & v18) != 0)
            {
              long long v45 = PBFLogAssetHelper();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v57;
                __int16 v85 = val;
                __int16 v86 = 2114;
                v87 = v70;
                _os_log_debug_impl(&dword_1D31CE000, v45, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; no image found for %{public}@; updating image view to nil",
                  buf,
                  0x16u);
              }

              objc_msgSend(v69, "updateImage:imageSize:", 0, v13, v14);
            }
          }
          if ([v68 shouldProceedFetchingSnapshotForDefinition:v16 displayContext:v72 maxNumberOfRetryAfterErrors:3])
          {
            long long v46 = PBFLogAssetHelper();
            BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_INFO);
            if (v17)
            {
              if (v47)
              {
                *(_DWORD *)buf = 134218754;
                __int16 v85 = val;
                __int16 v86 = 2114;
                v87 = v70;
                __int16 v88 = 2114;
                BOOL v89 = v72;
                __int16 v90 = 1024;
                BOOL v91 = activeDisplayContext == v72;
                long long v48 = v46;
                uint64_t v49 = "(%p) _kickoffPreviewGeneratorForPosterPreview; no image found for %{public}@ / keyframe definition"
                      "; kicking off image request for display context %{public}@, isActiveDisplayContext? %{BOOL}u";
                goto LABEL_76;
              }
            }
            else if (v47)
            {
              *(_DWORD *)buf = 134218754;
              __int16 v85 = val;
              __int16 v86 = 2114;
              v87 = v70;
              __int16 v88 = 2114;
              BOOL v89 = v72;
              __int16 v90 = 1024;
              BOOL v91 = activeDisplayContext == v72;
              long long v48 = v46;
              uint64_t v49 = "(%p) _kickoffPreviewGeneratorForPosterPreview; no image found for %{public}@ / default definition; k"
                    "icking off image request for display context %{public}@, isActiveDisplayContext? %{BOOL}u";
LABEL_76:
              _os_log_impl(&dword_1D31CE000, v48, OS_LOG_TYPE_INFO, v49, buf, 0x26u);
            }

            objc_initWeak(&from, val);
            id v50 = objc_loadWeakRetained(location);
            v73[0] = MEMORY[0x1E4F143A8];
            v73[1] = 3221225472;
            v73[2] = __80__PBFPosterGalleryAssetHelper__kickoffPreviewGeneratorForPosterPreview_context___block_invoke;
            v73[3] = &unk_1E6982790;
            objc_copyWeak(&v77, &from);
            char v78 = v17;
            id v51 = v70;
            id v74 = v51;
            unint64_t v52 = v72;
            long long v75 = v52;
            uint64_t v76 = v16;
            v53 = [v50 fetchSnapshotForPosterPreview:v51 context:v52 definition:v16 completion:v73];

            unint64_t v54 = PBFLogAssetHelper();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              __int16 v85 = val;
              __int16 v86 = 2114;
              v87 = v70;
              __int16 v88 = 2114;
              BOOL v89 = v72;
              _os_log_debug_impl(&dword_1D31CE000, v54, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; stashing invalidation context for %{public}@ && context %{public}@;",
                buf,
                0x20u);
            }

            [v68 beginRequestForDefinition:v16 displayContext:v52 invalidationContext:v53];
            objc_destroyWeak(&v77);
            objc_destroyWeak(&from);
          }
          uint64_t v19 = 0;
          goto LABEL_44;
        }
LABEL_22:
        unint64_t v23 = PBFLogAssetHelper();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218754;
          __int16 v85 = val;
          __int16 v86 = 2114;
          v87 = v70;
          __int16 v88 = 2114;
          BOOL v89 = v72;
          __int16 v90 = 1024;
          BOOL v91 = v22;
          _os_log_debug_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; image hydrated already for %{public}@ && context %{public}@; "
            "isActiveContext: %{BOOL}u",
            buf,
            0x26u);
        }

        if ((v22 & v18) == 1)
        {
          if (v69)
          {
            uint64_t v24 = PBFLogAssetHelper();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              __int16 v85 = val;
              __int16 v86 = 2114;
              v87 = v70;
              __int16 v88 = 2114;
              BOOL v89 = v72;
              _os_log_debug_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; updating image view for %{public}@ && context %{public}@;",
                buf,
                0x20u);
            }

            [(PBFPosterGalleryAssetHelper *)val _contentSizeForPreview:v70];
            objc_msgSend(v69, "updateImage:imageSize:", v19);
          }
          else
          {
            id v69 = [(PBFPosterGalleryAssetHelper *)val _newImageViewWithImage:v19 posterPreview:v70];
            [v58 setPreviewImageView:v69];
            uint64_t v32 = PBFLogAssetHelper();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              __int16 v85 = val;
              __int16 v86 = 2114;
              v87 = v70;
              __int16 v88 = 2114;
              BOOL v89 = v72;
              _os_log_debug_impl(&dword_1D31CE000, v32, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; new image view created for %{public}@ && context %{public}@;",
                buf,
                0x20u);
            }
          }
          BOOL v63 = [(PBFPosterGalleryAssetHelper *)val _sizeContainerView:v69 forPreview:v70 displayContext:v72];
          uint64_t v33 = PBFLogAssetHelper();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218754;
            __int16 v85 = val;
            __int16 v86 = 2114;
            v87 = v70;
            __int16 v88 = 2114;
            BOOL v89 = v72;
            __int16 v90 = 1024;
            BOOL v91 = v63;
            _os_log_debug_impl(&dword_1D31CE000, v33, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; finished updating image view for %{public}@ && context %{pu"
              "blic}@; notifyDidUpdateContent: %{BOOL}u",
              buf,
              0x26u);
          }
        }
        if (v21)
        {
          __int16 v34 = PBFLogAssetHelper();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218498;
            __int16 v85 = val;
            __int16 v86 = 2114;
            v87 = v70;
            __int16 v88 = 2114;
            BOOL v89 = v72;
            _os_log_debug_impl(&dword_1D31CE000, v34, OS_LOG_TYPE_DEBUG, "(%p) _kickoffPreviewGeneratorForPosterPreview; stashing generated image for %{public}@ && context %{public"
              "}@; and marking notifyDidUpdateContent",
              buf,
              0x20u);
          }

          [v68 completeRequestForDefinition:v16 displayContext:v72 receivedSnapshot:v19 receivedError:0];
          LOBYTE(v63) = 1;
        }
LABEL_44:

        ++v15;
      }
      while (v67 != v15);
      uint64_t v55 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
      uint64_t v67 = v55;
      if (!v55)
      {
LABEL_84:

        BOOL v10 = v68;
        goto LABEL_85;
      }
    }
  }
  BOOL v10 = PBFLogAssetHelper();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v85 = self;
    _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_INFO, "(%p) bail _kickoffPreviewGeneratorForPosterPreview; no state",
      buf,
      0xCu);
  }
  LOBYTE(v63) = 0;
LABEL_85:

  uint64_t v7 = v58;
LABEL_86:

  return v63;
}

void __80__PBFPosterGalleryAssetHelper__kickoffPreviewGeneratorForPosterPreview_context___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    id v8 = v6;
    id v9 = a1[4];
    id v10 = a1[5];
    id v11 = v5;
    BSDispatchMain();
  }
}

uint64_t __80__PBFPosterGalleryAssetHelper__kickoffPreviewGeneratorForPosterPreview_context___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    if (*(unsigned char *)(a1 + 80)) {
      NSLog(&cfstr_ReceivedKeyFra.isa);
    }
    BOOL v3 = PBFLogAssetHelper();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __80__PBFPosterGalleryAssetHelper__kickoffPreviewGeneratorForPosterPreview_context___block_invoke_2_cold_1((void *)a1, v2, v3);
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 80)) {
      NSLog(&cfstr_ReceivedKeyFra.isa);
    }
    BOOL v3 = PBFLogAssetHelper();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 56);
      uint64_t v7 = *(void *)(a1 + 64);
      int v9 = 134218754;
      uint64_t v10 = v4;
      __int16 v11 = 2114;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_INFO, "(%p) _kickoffPreviewGeneratorForPosterPreview; request finished for %{public}@ && context %{public}@; image: %{public}@",
        (uint8_t *)&v9,
        0x2Au);
    }
  }

  return [*(id *)(a1 + 40) _receiveUpdatedAssetForPosterPreview:*(void *)(a1 + 48) definition:*(void *)(a1 + 72) displayContext:*(void *)(a1 + 56) image:*(void *)(a1 + 64) fetchError:*(void *)(a1 + 32)];
}

- (id)_newImageViewWithImage:(id)a3 posterPreview:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_isInvalidated)
  {
    id v8 = PBFLogAssetHelper();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v23 = self;
      _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_INFO, "(%p) bail _newImageViewWithImage; invalidated", buf, 0xCu);
    }
    int v9 = 0;
  }
  else
  {
    [(PBFPosterGalleryAssetHelper *)self _contentSizeForPreview:v7];
    double v11 = v10;
    double v13 = v12;
    int v9 = -[_PBFImageView initWithFrame:]([_PBFImageView alloc], "initWithFrame:", 0.0, 0.0, v10, v12);
    [(_PBFImageView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    -[_PBFImageView updateImage:imageSize:](v9, "updateImage:imageSize:", v6, v11, v13);
    id v8 = [v7 posterDescriptorLookupInfo];
    uint64_t v14 = [v8 posterDescriptorExtension];
    __int16 v15 = [v14 posterExtensionBundleIdentifier];

    uint64_t v16 = [v8 posterDescriptorPath];
    uint64_t v17 = [v16 descriptorIdentifier];

    int v18 = [NSString stringWithFormat:@"%@:%@", v15, v17];
    [(_PBFImageView *)v9 setAccessibilityIdentifier:v18];
    uint64_t v19 = PBFLogAssetHelper();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v31.width = v11;
      v31.height = v13;
      BOOL v21 = NSStringFromCGSize(v31);
      *(_DWORD *)buf = 134218754;
      unint64_t v23 = self;
      __int16 v24 = 2114;
      id v25 = v7;
      __int16 v26 = 2114;
      uint64_t v27 = v18;
      __int16 v28 = 2114;
      id v29 = v21;
      _os_log_debug_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_DEBUG, "(%p) _newImageViewWithImage; building new image view for %{public}@/%{public}@; size: %{public}@",
        buf,
        0x2Au);
    }
  }

  return v9;
}

- (CGSize)_contentSizeForPreview:(id)a3
{
  uint64_t v4 = [a3 type];
  int v5 = [v4 isEqual:PBFPreviewTypeHero];

  activeDisplayContextSpec = self->_activeDisplayContextSpec;
  if (v5)
  {
    id v7 = self->_activeDisplayContextSpec;
    [(PBFPosterGalleryViewSpec *)v7 posterHeroContentSize];
  }
  else
  {
    uint64_t v10 = [(PBFDisplayContext *)self->_activeDisplayContext pbf_interfaceOrientation];
    [(PBFPosterGalleryViewSpec *)activeDisplayContextSpec posterContentSizeForOrientation:v10];
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)_sizeContainerView:(id)a3 forPreview:(id)a4 displayContext:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (PBFDisplayContext *)a5;
  double v11 = v10;
  if (self->_isInvalidated)
  {
    double v12 = PBFLogAssetHelper();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 134217984;
      id v25 = self;
      _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_DEFAULT, "(%p) bail _sizeContainerView; invalidated",
        (uint8_t *)&v24,
        0xCu);
    }

    goto LABEL_14;
  }
  if (self->_activeDisplayContext != v10) {
    goto LABEL_14;
  }
  double v13 = [v9 type];
  int v14 = [v13 isEqual:PBFPreviewTypeHero];

  if (v14) {
    [(PBFPosterGalleryViewSpec *)self->_activeDisplayContextSpec posterHeroContentSize];
  }
  else {
    [(PBFPosterGalleryViewSpec *)self->_activeDisplayContextSpec posterContentSizeForOrientation:[(PBFDisplayContext *)self->_activeDisplayContext pbf_interfaceOrientation]];
  }
  double v17 = v15;
  double v18 = v16;
  [v8 frame];
  if (v20 == v17 && v19 == v18)
  {
LABEL_14:
    BOOL v22 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v8, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v17, v18);
  [v8 setNeedsLayout];
  BOOL v22 = 1;
LABEL_15:

  return v22;
}

- (void)_receiveUpdatedAssetForPosterPreview:(id)a3 definition:(id)a4 displayContext:(id)a5 image:(id)a6 fetchError:(id)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  double v13 = a4;
  int v14 = (PBFDisplayContext *)a5;
  id v15 = a6;
  id v16 = a7;
  BSDispatchQueueAssertMain();
  if (!self->_isInvalidated)
  {
    double v17 = [(NSMapTable *)self->_previewToState objectForKey:v12];
    if (!v17)
    {
      double v18 = PBFLogAssetHelper();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        long long v45 = self;
        _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_INFO, "(%p) bail _receiveUpdatedAssetForPosterPreview; no state",
          buf,
          0xCu);
      }
      goto LABEL_48;
    }
    double v18 = +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:v12];
    double v19 = [v17 snapshotCollection];
    if ([v19 snapshotRequestStatusForDefinition:v13 displayContext:v14 outInvalidationContext:0] != 1)
    {
      uint64_t v26 = PBFLogAssetHelper();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        long long v45 = self;
        _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_INFO, "(%p) bail _receiveUpdatedAssetForPosterPreview; request was cancelled",
          buf,
          0xCu);
      }

      goto LABEL_47;
    }
    [v19 completeRequestForDefinition:v13 displayContext:v14 receivedSnapshot:v15 receivedError:v16];
    uint64_t v41 = v19;
    if (!v15 || v16)
    {
      int v27 = objc_msgSend(v16, "pbf_isGeneralCancelledError");
      __int16 v28 = PBFLogAssetHelper();
      id v29 = v28;
      if (v27)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          long long v45 = self;
          __int16 v46 = 2114;
          id v47 = v12;
          __int16 v48 = 2114;
          id v49 = v16;
          _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEFAULT, "(%p) _receiveUpdatedAssetForPosterPreview; request was cancelled for preview %{public}@: %{public}@",
            buf,
            0x20u);
        }

        uint64_t v30 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
        [(PBFPosterGalleryAssetHelper *)self _stateWasUpdatedForPosterPreviews:v30];
      }
      else
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          long long v45 = self;
          __int16 v46 = 2114;
          id v47 = v12;
          __int16 v48 = 2114;
          id v49 = v16;
          _os_log_error_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_ERROR, "(%p) _receiveUpdatedAssetForPosterPreview; request failed for preview %{public}@ with error: %{public}@",
            buf,
            0x20u);
        }

        if (!v16)
        {
          CGSize v31 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v42 = *MEMORY[0x1E4F28588];
          BOOL v43 = @"Received no error and image as a result of a poster preview request.  Bug in implementation.";
          char v21 = 1;
          BOOL v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
          uint64_t v32 = objc_msgSend(v31, "pbf_generalErrorWithCode:userInfo:", 10, v40);
          [v41 failPreviewImageForDefinition:v13 displayContext:v14 error:v32];

          goto LABEL_34;
        }
        [v41 failPreviewImageForDefinition:v13 displayContext:v14 error:v16];
      }
    }
    else
    {
      activeDisplayContext = self->_activeDisplayContext;
      double v20 = PBFLogAssetHelper();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        long long v45 = self;
        __int16 v46 = 2114;
        id v47 = v12;
        __int16 v48 = 2114;
        id v49 = v15;
        _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_INFO, "(%p) _receiveUpdatedAssetForPosterPreview; preview %{public}@ received image %{public}@",
          buf,
          0x20u);
      }

      char v21 = 1;
      if (activeDisplayContext != v14 || v18 != v13) {
        goto LABEL_34;
      }
      BOOL v22 = PBFLogAssetHelper();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        long long v45 = self;
        __int16 v46 = 2114;
        id v47 = v12;
        _os_log_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_INFO, "(%p) _receiveUpdatedAssetForPosterPreview; preview %{public}@ received active display context image; updating image views",
          buf,
          0x16u);
      }

      unint64_t v23 = [v17 previewImageView];

      if (!v23)
      {
        id v33 = [(PBFPosterGalleryAssetHelper *)self _newImageViewWithImage:v15 posterPreview:v12];
        [v17 setPreviewImageView:v33];

LABEL_33:
        __int16 v34 = [v17 previewImageView];
        [(PBFPosterGalleryAssetHelper *)self _sizeContainerView:v34 forPreview:v12 displayContext:v14];

        char v21 = 0;
        goto LABEL_34;
      }
      int v24 = [v17 previewImageView];
      [(PBFPosterGalleryAssetHelper *)self _contentSizeForPreview:v12];
      int v25 = objc_msgSend(v24, "updateImage:imageSize:", v15);

      if (v25) {
        goto LABEL_33;
      }
    }
    char v21 = 1;
LABEL_34:
    uint64_t v35 = PBFLogAssetHelper();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      -[PBFPosterGalleryAssetHelper _receiveUpdatedAssetForPosterPreview:definition:displayContext:image:fetchError:]();
    }

    if ([v17 isVisible]
      && (self->_activeDisplayContext != v14 ? (char v36 = 1) : (char v36 = v21), (v36 & 1) == 0))
    {
      uint64_t v38 = PBFLogAssetHelper();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        -[PBFPosterGalleryAssetHelper _receiveUpdatedAssetForPosterPreview:definition:displayContext:image:fetchError:]();
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained assetHelper:self didUpdateAssetsForPosterPreview:v12];
    }
    else
    {
      id WeakRetained = PBFLogAssetHelper();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG)) {
        -[PBFPosterGalleryAssetHelper _receiveUpdatedAssetForPosterPreview:definition:displayContext:image:fetchError:]();
      }
    }
    double v19 = v41;

    [(PBFPosterGalleryAssetHelper *)self _stateWasUpdated:0];
LABEL_47:

LABEL_48:
    goto LABEL_49;
  }
  double v17 = PBFLogAssetHelper();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    long long v45 = self;
    _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "(%p) bail _receiveUpdatedAssetForPosterPreview; invalidated",
      buf,
      0xCu);
  }
LABEL_49:
}

- (void)_teardownStateForPosterPreviews:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v13 = v4;
  int v5 = (void *)[v4 copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        double v11 = [(NSMapTable *)self->_previewToState objectForKey:v10];
        if (v11)
        {
          [(PBFPosterGalleryAssetHelper *)self _teardownState:v11];
          [(NSMapTable *)self->_previewToState removeObjectForKey:v10];
        }
        else
        {
          id v12 = PBFLogAssetHelper();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            double v19 = self;
            __int16 v20 = 2114;
            uint64_t v21 = v10;
            _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_INFO, "(%p) bail _teardownStateForPosterPreviews; bail teardown for %{public}@; no state",
              buf,
              0x16u);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)_teardownState:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  int v5 = PBFLogAssetHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [v4 preview];
    int v17 = 134218242;
    double v18 = self;
    __int16 v19 = 2114;
    __int16 v20 = v6;
    _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_INFO, "(%p) bail _teardownState; %{public}@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v7 = [v4 livePreviewViewController];

  if (v7)
  {
    uint64_t v8 = PBFLogAssetHelper();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v4 preview];
      int v17 = 134218242;
      double v18 = self;
      __int16 v19 = 2114;
      __int16 v20 = v9;
      _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_INFO, "(%p) _teardownState; %{public}@; tearing down live view controller",
        (uint8_t *)&v17,
        0x16u);
    }
    uint64_t v10 = [v4 livePreviewViewController];
    [(PBFPosterGalleryAssetHelper *)self _teardownLiveViewController:v10 invalidate:1];
  }
  double v11 = [v4 previewImageView];

  if (v11)
  {
    id v12 = PBFLogAssetHelper();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      double v13 = [v4 preview];
      int v17 = 134218242;
      double v18 = self;
      __int16 v19 = 2114;
      __int16 v20 = v13;
      _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_INFO, "(%p) _teardownState; %{public}@; tearing down previewImageView",
        (uint8_t *)&v17,
        0x16u);
    }
    long long v14 = [v4 previewImageView];
    objc_msgSend(v14, "updateImage:imageSize:", 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

    long long v15 = [v4 previewImageView];
    [v15 removeFromSuperview];
  }
  [v4 setPreviewImageView:0];
  long long v16 = [v4 snapshotCollection];
  [v16 cancel];
}

- (void)_resetHydrationState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  BOOL v3 = PBFLogAssetHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v4 = self->_assetHydrationState - 1;
    int v5 = @"PBFPosterGalleryAssetHydrationStateDefault";
    if (v4 <= 2) {
      int v5 = off_1E6982820[v4];
    }
    int v6 = 134218498;
    uint64_t v7 = self;
    __int16 v8 = 2114;
    id v9 = v5;
    __int16 v10 = 2114;
    double v11 = @"PBFPosterGalleryAssetHydrationStateDefault";
    _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_DEFAULT, "(%p) _resetHydrationState; going from %{public}@ -> %{public}@",
      (uint8_t *)&v6,
      0x20u);
  }

  self->_unint64_t assetHydrationState = 0;
}

- (void)_setupLiveDisplayStyleForPreview:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    int v5 = PBFLogAssetHelper();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      CGSize v31 = self;
      _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "(%p) bail _setupLiveDisplayStyleForPreview; invalidated",
        buf,
        0xCu);
    }
    goto LABEL_19;
  }
  int v6 = [v4 type];
  int v7 = [v6 isEqual:PBFPreviewTypeHero];

  if (!v7)
  {
    __int16 v8 = [(NSMapTable *)self->_previewToState objectForKey:v4];
    int v5 = v8;
    if (v8)
    {
      if ([v8 willUseLivePreview])
      {
        id v9 = [v5 livePreviewViewController];

        if (v9)
        {
          __int16 v10 = PBFLogAssetHelper();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            CGSize v31 = self;
            double v11 = "(%p) bail _setupLiveDisplayStyleForPreview; livePreviewViewController already setup";
LABEL_16:
            uint64_t v12 = v10;
            uint32_t v13 = 12;
            goto LABEL_17;
          }
        }
        else
        {
          if ([v5 livePreviewState] == -1)
          {
            id v14 = v4;
            long long v15 = [v14 posterDescriptorLookupInfo];
            long long v16 = [v15 posterDescriptorExtension];
            int v17 = [v16 posterExtensionBundleIdentifier];

            double v18 = [NSString stringWithFormat:@"%@ - LIVE POSTER PREVIEW FOR %@", v17, v14];

            __int16 v10 = [v14 posterDescriptorLookupInfo];
            __int16 v19 = [v10 posterDescriptorExtension];
            __int16 v20 = [v19 posterExtensionBundleIdentifier];

            [v5 setLivePreviewState:0];
            uint64_t v21 = PBFLogAssetHelper();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218242;
              CGSize v31 = self;
              __int16 v32 = 2114;
              id v33 = v14;
              _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_INFO, "(%p) bail _setupLiveDisplayStyleForPreview: %{public}@; moving state to PBFPosterGalleryLivePreviewStateStartingUp",
                buf,
                0x16u);
            }

            BOOL v22 = [@"Start Poster Process for PBFPosterGalleryPreviewViewController/" stringByAppendingFormat:@"%@", v18];
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __64__PBFPosterGalleryAssetHelper__setupLiveDisplayStyleForPreview___block_invoke;
            v25[3] = &unk_1E69825A0;
            v25[4] = self;
            id v26 = v20;
            id v27 = v18;
            id v28 = v14;
            id v29 = v5;
            id v23 = v18;
            id v24 = v20;
            PBFDispatchAsyncWithString(v22, QOS_CLASS_USER_INITIATED, v25);

            goto LABEL_18;
          }
          __int16 v10 = PBFLogAssetHelper();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            CGSize v31 = self;
            double v11 = "(%p) bail _setupLiveDisplayStyleForPreview; livePreviewViewController already setup and state is not n"
                  "ull... so letting it do its thing";
            goto LABEL_16;
          }
        }
      }
      else
      {
        __int16 v10 = PBFLogAssetHelper();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          CGSize v31 = self;
          double v11 = "(%p) bail _setupLiveDisplayStyleForPreview; state doesn't want live previews used";
          goto LABEL_16;
        }
      }
    }
    else
    {
      __int16 v10 = PBFLogAssetHelper();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        CGSize v31 = self;
        __int16 v32 = 2114;
        id v33 = v4;
        double v11 = "(%p) bail _setupLiveDisplayStyleForPreview; state doesn't exist for preview %{public}@";
        uint64_t v12 = v10;
        uint32_t v13 = 22;
LABEL_17:
        _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
      }
    }
LABEL_18:

    goto LABEL_19;
  }
  int v5 = PBFLogAssetHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PBFPosterGalleryAssetHelper _setupLiveDisplayStyleForPreview:]();
  }
LABEL_19:
}

void __64__PBFPosterGalleryAssetHelper__setupLiveDisplayStyleForPreview___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v31 = 0;
  int v5 = [WeakRetained acquireExtensionInstance:v3 reason:v4 error:&v31];
  id v6 = v31;

  if (v6)
  {
    int v7 = PBFLogAssetHelper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 48);
      uint64_t v19 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134218754;
      uint64_t v33 = v18;
      __int16 v34 = 2114;
      uint64_t v35 = v19;
      __int16 v36 = 2114;
      uint64_t v37 = v20;
      __int16 v38 = 2114;
      id v39 = v6;
      _os_log_error_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_ERROR, "(%p) bail _setupLiveDisplayStyleForPreview: %{public}@; no extension instance was vended for livePosterKey %{pub"
        "lic}@: %{public}@",
        buf,
        0x2Au);
    }
    __int16 v8 = 0;
  }
  else if (v5)
  {
    id v30 = 0;
    __int16 v8 = objc_msgSend(v5, "pr_assetUpdaterWithError:", &v30);
    id v6 = v30;
    int v7 = PBFLogAssetHelper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134218498;
      uint64_t v33 = v12;
      __int16 v34 = 2114;
      uint64_t v35 = v13;
      __int16 v36 = 2114;
      uint64_t v37 = v14;
      _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_INFO, "(%p) bail _setupLiveDisplayStyleForPreview: %{public}@; received extension instance was vended for livePosterKey %{public}@",
        buf,
        0x20u);
    }
  }
  else
  {
    int v7 = PBFLogAssetHelper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134218498;
      uint64_t v33 = v15;
      __int16 v34 = 2114;
      uint64_t v35 = v16;
      __int16 v36 = 2114;
      uint64_t v37 = v17;
      _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_INFO, "(%p) bail _setupLiveDisplayStyleForPreview: %{public}@; no extension instance was vended for livePosterKey %{public}@",
        buf,
        0x20u);
    }
    __int16 v8 = 0;
    id v6 = 0;
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__PBFPosterGalleryAssetHelper__setupLiveDisplayStyleForPreview___block_invoke_58;
  v21[3] = &unk_1E69827B8;
  id v22 = v6;
  id v23 = v8;
  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = v5;
  id v26 = *(id *)(a1 + 56);
  id v27 = *(id *)(a1 + 40);
  id v28 = *(id *)(a1 + 48);
  id v29 = *(id *)(a1 + 64);
  id v9 = v5;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v21);
}

void __64__PBFPosterGalleryAssetHelper__setupLiveDisplayStyleForPreview___block_invoke_58(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    uint64_t v3 = PBFLogAssetHelper();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __64__PBFPosterGalleryAssetHelper__setupLiveDisplayStyleForPreview___block_invoke_58_cold_1((void *)a1, v2, v3);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 64));
    [WeakRetained relinquishExtensionInstance:*(void *)(a1 + 72) reason:*(void *)(a1 + 80)];

    [*(id *)(a1 + 88) setLivePreviewState:2];
    int v5 = PBFLogAssetHelper();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 64);
      int v11 = 134218242;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_INFO, "(%p) bail _setupLiveDisplayStyleForPreview: %{public}@; moving state to PBFPosterGalleryLivePreviewStateInvalidated",
        (uint8_t *)&v11,
        0x16u);
    }
  }
  else
  {
    __int16 v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    [v8 _setupLiveViewControllerForInstance:v9 preview:v10];
  }
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  BOOL isInvalidated = self->_isInvalidated;
  uint64_t v4 = PBFLogAssetHelper();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isInvalidated)
  {
    if (v5)
    {
      int v6 = 134217984;
      uint64_t v7 = self;
      _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "(%p) bail invalidate; invalidated", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      int v6 = 134217984;
      uint64_t v7 = self;
      _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "(%p) invalidate: invalidating...", (uint8_t *)&v6, 0xCu);
    }

    [(PBFPosterGalleryAssetHelper *)self cancel];
    self->_BOOL isInvalidated = 1;
  }
}

- (void)cancel
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  uint64_t v3 = PBFLogAssetHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = self;
    _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_DEFAULT, "(%p) cancelling...", buf, 0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(NSMapTable *)self->_previewToState keyEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v14;
    *(void *)&long long v6 = 134218242;
    long long v12 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = -[NSMapTable objectForKey:](self->_previewToState, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * v9), v12);
        int v11 = PBFLogAssetHelper();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v12;
          uint64_t v18 = self;
          __int16 v19 = 2114;
          uint64_t v20 = v10;
          _os_log_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_DEFAULT, "(%p) cancelling... tearing down %{public}@", buf, 0x16u);
        }

        [(PBFPosterGalleryAssetHelper *)self _teardownState:v10];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v7);
  }

  [(NSMapTable *)self->_previewToState removeAllObjects];
}

- (void)galleryPosterViewController:(id)a3 stateChangedTo:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_isInvalidated)
  {
    if (!v6)
    {
      uint64_t v7 = PBFLogAssetHelper();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      int v14 = 134217984;
      long long v15 = self;
      uint64_t v8 = "(%p) bail galleryPosterViewController:stateChangedTo: no galleryPosterVC?";
      goto LABEL_4;
    }
    uint64_t v7 = [v6 preview];
    uint64_t v9 = [(NSMapTable *)self->_previewToState objectForKey:v7];
    if (a4)
    {
      if (a4 == 2)
      {
        long long v13 = PBFLogAssetHelper();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 134218242;
          long long v15 = self;
          __int16 v16 = 2114;
          uint64_t v17 = v7;
          _os_log_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_DEFAULT, "(%p) galleryPosterViewController:stateChangedTo: state is invalidated for %{public}@", (uint8_t *)&v14, 0x16u);
        }

        [(PBFPosterGalleryAssetHelper *)self _teardownLiveViewController:v6 invalidate:1];
        goto LABEL_23;
      }
      if (a4 != 1) {
        goto LABEL_23;
      }
      uint64_t v10 = PBFLogAssetHelper();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134218498;
        long long v15 = self;
        __int16 v16 = 2114;
        uint64_t v17 = v7;
        __int16 v18 = 2114;
        __int16 v19 = @"PBFGalleryPosterViewControllerStateActive";
        _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_DEFAULT, "(%p) galleryPosterViewController:stateChangedTo: updating state for %{public}@ to %{public}@", (uint8_t *)&v14, 0x20u);
      }

      [v9 setLivePreviewState:1];
      if (![v9 isVisible])
      {
LABEL_23:

        goto LABEL_24;
      }
      int v11 = PBFLogAssetHelper();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134218242;
        long long v15 = self;
        __int16 v16 = 2114;
        uint64_t v17 = v7;
        _os_log_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_DEFAULT, "(%p) galleryPosterViewController:stateChangedTo: state is visible for %{public}@; notifying delegate for updated assets",
          (uint8_t *)&v14,
          0x16u);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained assetHelper:self didUpdateAssetsForPosterPreview:v7];
    }
    else
    {
      id WeakRetained = PBFLogAssetHelper();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
      {
        int v14 = 134218242;
        long long v15 = self;
        __int16 v16 = 2114;
        uint64_t v17 = v7;
        _os_log_impl(&dword_1D31CE000, WeakRetained, OS_LOG_TYPE_INFO, "(%p) galleryPosterViewController:stateChangedTo: state is not ready for %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }

    goto LABEL_23;
  }
  uint64_t v7 = PBFLogAssetHelper();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    long long v15 = self;
    uint64_t v8 = "(%p) bail galleryPosterViewController:stateChangedTo: invalidated";
LABEL_4:
    _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0xCu);
  }
LABEL_24:
}

- (void)_setupLiveViewControllerForInstance:(id)a3 preview:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  if (self->_isInvalidated)
  {
    uint64_t v8 = PBFLogAssetHelper();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v27 = self;
      _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_DEFAULT, "(%p) bail _setupLiveViewControllerForInstance; invalidated",
        buf,
        0xCu);
    }
  }
  else
  {
    uint64_t v8 = [(NSMapTable *)self->_previewToState objectForKey:v7];
    if (v8)
    {
      uint64_t v9 = [PBFGalleryPosterViewController alloc];
      uint64_t v10 = +[PBFPosterSnapshotDefinition gallerySnapshotDefinition];
      int v11 = [(PBFGalleryPosterViewController *)v9 initWithExtensionInstance:v6 preview:v7 definition:v10];

      [v11 setDelegate:self];
      [v11 setDisplayContext:self->_activeDisplayContext];
      long long v12 = [v11 view];
      [(PBFPosterGalleryAssetHelper *)self _sizeContainerView:v12 forPreview:v7 displayContext:self->_activeDisplayContext];

      long long v13 = [v7 posterDescriptorLookupInfo];
      int v14 = [v13 posterDescriptorExtension];
      uint64_t v15 = [v14 posterExtensionBundleIdentifier];

      __int16 v16 = [v13 posterDescriptorPath];
      uint64_t v17 = [v16 descriptorIdentifier];

      id v25 = (void *)v15;
      __int16 v18 = [NSString stringWithFormat:@"%@:%@:livePoster", v15, v17];
      __int16 v19 = [v11 view];
      [v19 setAccessibilityIdentifier:v18];

      if ([v11 state] == 2)
      {
        uint64_t v20 = PBFLogAssetHelper();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          id v27 = self;
          __int16 v28 = 2114;
          id v29 = v7;
          _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "(%p) bail _setupLiveViewControllerForInstance; invalidated state for %{public}@",
            buf,
            0x16u);
        }

        [(PBFPosterGalleryAssetHelper *)self _teardownLiveViewController:v11 invalidate:1];
      }
      else
      {
        [v8 setLivePreviewViewController:v11];
        uint64_t v21 = PBFLogAssetHelper();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          id v27 = self;
          __int16 v28 = 2114;
          id v29 = v7;
          _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "(%p) _setupLiveViewControllerForInstance; live preview for %{public}@ is setup; notifying delegate",
            buf,
            0x16u);
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained assetHelper:self prepareForPosterPreview:v7 movingToLive:v11];

        if ([v11 state] == 1)
        {
          id v23 = PBFLogAssetHelper();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            id v27 = self;
            __int16 v28 = 2114;
            id v29 = v7;
            _os_log_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_DEFAULT, "(%p) _setupLiveViewControllerForInstance; live preview for %{public}@ is setup; state has moved to PBFGall"
              "eryPosterViewControllerStateActive; notifying delegate for updated assets",
              buf,
              0x16u);
          }

          [v8 setLivePreviewState:1];
          id v24 = objc_loadWeakRetained((id *)&self->_delegate);
          [v24 assetHelper:self didUpdateAssetsForPosterPreview:v7];
        }
      }
    }
    else
    {
      int v11 = PBFLogAssetHelper();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v27 = self;
        __int16 v28 = 2114;
        id v29 = v7;
        _os_log_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_DEFAULT, "(%p) bail _setupLiveViewControllerForInstance; no state for %{public}@",
          buf,
          0x16u);
      }
    }
  }
}

- (void)_teardownLiveViewController:(id)a3 invalidate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BSDispatchQueueAssertMain();
  id v7 = PBFLogAssetHelper();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134218498;
      id v25 = self;
      __int16 v26 = 2114;
      id v27 = v6;
      __int16 v28 = 1024;
      BOOL v29 = v4;
      _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "(%p) _teardownLiveViewController; gallery poster vc %{public}@ shouldInvalidate? %{BOOL}u",
        buf,
        0x1Cu);
    }

    uint64_t v9 = [v6 preview];
    uint64_t v10 = [(NSMapTable *)self->_previewToState objectForKey:v9];
    id v7 = v9;
    int v11 = [v7 posterDescriptorLookupInfo];
    long long v12 = [v11 posterDescriptorExtension];
    long long v13 = [v12 posterExtensionBundleIdentifier];

    int v14 = [NSString stringWithFormat:@"%@ - LIVE POSTER PREVIEW FOR %@", v13, v7];

    uint64_t v15 = [v6 view];
    [v15 removeFromSuperview];

    [v6 removeFromParentViewController];
    [v6 invalidate];
    [v10 setLivePreviewViewController:0];
    __int16 v16 = [v7 posterDescriptorLookupInfo];
    uint64_t v17 = [v16 posterDescriptorExtension];
    __int16 v18 = [v17 posterExtensionBundleIdentifier];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionInstanceProvider);
    [WeakRetained relinquishExtensionInstance:v18 reason:v14];

    if (v4)
    {
      [v10 setLivePreviewState:2];
      uint64_t v20 = PBFLogAssetHelper();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v25 = self;
        __int16 v26 = 2114;
        id v27 = v7;
        uint64_t v21 = "(%p) _setupLiveViewControllerForInstance; state for %{public}@ moving to PBFPosterGalleryLivePreviewStateInvalidated";
LABEL_11:
        _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0x16u);
      }
    }
    else
    {
      [v10 setLivePreviewState:-1];
      uint64_t v20 = PBFLogAssetHelper();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v25 = self;
        __int16 v26 = 2114;
        id v27 = v7;
        uint64_t v21 = "(%p) _setupLiveViewControllerForInstance; state for %{public}@ moving to PBFPosterGalleryLivePreviewStateNull";
        goto LABEL_11;
      }
    }

    uint64_t v22 = PBFLogAssetHelper();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      id v25 = self;
      __int16 v26 = 2114;
      id v27 = v6;
      __int16 v28 = 1024;
      BOOL v29 = v4;
      _os_log_debug_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_DEBUG, "(%p) _teardownLiveViewController; notifying delegate of teardown gallery poster vc %{public}@ shouldInvalidate? %{BOOL}u",
        buf,
        0x1Cu);
    }

    id v23 = objc_loadWeakRetained((id *)&self->_delegate);
    [v23 assetHelper:self posterPreview:v7 teardownLiveViewController:v6];

    goto LABEL_15;
  }
  if (v8)
  {
    *(_DWORD *)buf = 134217984;
    id v25 = self;
    _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "(%p) bail _teardownLiveViewController; no gallery poster vc?",
      buf,
      0xCu);
  }
LABEL_15:
}

- (PBFPosterPreviewGenerator)previewGenerator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewGenerator);
  return (PBFPosterPreviewGenerator *)WeakRetained;
}

- (PBFExtensionInstanceProviding)extensionInstanceProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionInstanceProvider);
  return (PBFExtensionInstanceProviding *)WeakRetained;
}

- (PBFPosterGalleryAssetHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBFPosterGalleryAssetHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (PBFDisplayContext)activeDisplayContext
{
  return self->_activeDisplayContext;
}

- (NSSet)posterPreviews
{
  return self->_posterPreviews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterPreviews, 0);
  objc_storeStrong((id *)&self->_activeDisplayContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_extensionInstanceProvider);
  objc_destroyWeak((id *)&self->_previewGenerator);
  objc_storeStrong((id *)&self->_activeDisplayContextSpec, 0);
  objc_storeStrong((id *)&self->_previewToState, 0);
  objc_storeStrong((id *)&self->_knownDisplayContexts, 0);
}

- (void)initWithPreviewGenerator:(const char *)a1 extensionInstanceProvider:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPreviewGenerator:(const char *)a1 extensionInstanceProvider:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updatePosterPreview:isVisible:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_2(&dword_1D31CE000, v0, v1, "(%p) bail updatePosterPreview; posterPreview %{public}@ is already marked as visible");
}

- (void)_stateWasUpdated:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9_1();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

- (void)_stateWasUpdated:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9_1();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x12u);
}

- (void)_stateWasUpdated:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_1(&dword_1D31CE000, v0, v1, "(%p) bail _stateWasUpdated; invalidated", v2, v3, v4, v5, v6);
}

- (void)_updateHydrationStateIfNeeded
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_1(&dword_1D31CE000, v0, v1, "(%p) bail _updateHydrationStateIfNeeded; invalidated",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __80__PBFPosterGalleryAssetHelper__kickoffPreviewGeneratorForPosterPreview_context___block_invoke_2_cold_1(void *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = *a2;
  int v8 = 134219010;
  uint64_t v9 = v3;
  __int16 v10 = 2114;
  uint64_t v11 = v4;
  __int16 v12 = 2114;
  uint64_t v13 = v5;
  __int16 v14 = 2114;
  uint64_t v15 = v6;
  __int16 v16 = 2114;
  uint64_t v17 = v7;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "(%p) _kickoffPreviewGeneratorForPosterPreview; request failed for %{public}@ && context %{public}@; image: %{public}"
    "@ error: %{public}@",
    (uint8_t *)&v8,
    0x34u);
}

- (void)_receiveUpdatedAssetForPosterPreview:definition:displayContext:image:fetchError:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_2(&dword_1D31CE000, v0, v1, "(%p) _receiveUpdatedAssetForPosterPreview; preview %{public}@ will *NOT* notify of content update");
}

- (void)_receiveUpdatedAssetForPosterPreview:definition:displayContext:image:fetchError:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_2(&dword_1D31CE000, v0, v1, "(%p) _receiveUpdatedAssetForPosterPreview; preview %{public}@ notify of content update");
}

- (void)_receiveUpdatedAssetForPosterPreview:definition:displayContext:image:fetchError:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_2(&dword_1D31CE000, v0, v1, "(%p) _receiveUpdatedAssetForPosterPreview; finished processing received updated asset for poster preview preview %{public}@");
}

- (void)_setupLiveDisplayStyleForPreview:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_1(&dword_1D31CE000, v0, v1, "(%p) bail _setupLiveDisplayStyleForPreview; hero previews don't go live",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __64__PBFPosterGalleryAssetHelper__setupLiveDisplayStyleForPreview___block_invoke_58_cold_1(void *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[8];
  uint64_t v4 = *a2;
  uint64_t v6 = a1[5];
  uint64_t v5 = a1[6];
  int v7 = 134218754;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v3;
  __int16 v11 = 2114;
  uint64_t v12 = v4;
  __int16 v13 = 2114;
  uint64_t v14 = v6;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "(%p) bail _setupLiveDisplayStyleForPreview: %{public}@; error? %{public}@ updatingService? %{public}@",
    (uint8_t *)&v7,
    0x2Au);
}

@end