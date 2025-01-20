@interface PXStoryOneUpViewModel
- (BOOL)canPresentOneUp;
- (PXAssetReference)hiddenAssetReference;
- (PXAssetReference)initialAssetReference;
- (PXAssetReference)visibleAssetReference;
- (PXAssetsDataSourceManager)assetsDataSourceManager;
- (PXOneUpPresentation)oneUpPresentation;
- (PXStoryClipSpriteReferencesProvider)spriteReferencesProvider;
- (PXStoryOneUpViewModel)init;
- (PXStoryOneUpViewModel)initWithResourcesDataSourceManager:(id)a3 mediaProvider:(id)a4;
- (PXStoryResourcesDataSourceManager)resourcesDataSourceManager;
- (PXStoryTimeline)timeline;
- (PXUIMediaProvider)mediaProvider;
- (PXUpdater)updater;
- (id)spriteReferenceForAssetReference:(id)a3;
- (int64_t)_clipIdentifierForAssetReference:(id)a3 failureHandler:(id)a4;
- (int64_t)hiddenClipIdentifier;
- (int64_t)initialClipIdentifier;
- (int64_t)visibleClipIdentifier;
- (void)_invalidateAssetsDataSourceManager;
- (void)_invalidateHiddenClipIdentifier;
- (void)_invalidateInitialAssetReference;
- (void)_invalidateVisibleClipIdentifier;
- (void)_setNeedsUpdate;
- (void)_updateAssetsDataSourceManager;
- (void)_updateHiddenClipIdentifier;
- (void)_updateInitialAssetReference;
- (void)_updateVisibleClipIdentifier;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)setAssetsDataSourceManager:(id)a3;
- (void)setHiddenAssetReference:(id)a3;
- (void)setHiddenClipIdentifier:(int64_t)a3;
- (void)setInitialAssetReference:(id)a3;
- (void)setInitialClipIdentifier:(int64_t)a3;
- (void)setOneUpPresentation:(id)a3;
- (void)setSpriteReferencesProvider:(id)a3;
- (void)setTimeline:(id)a3;
- (void)setVisibleAssetReference:(id)a3;
- (void)setVisibleClipIdentifier:(int64_t)a3;
@end

@implementation PXStoryOneUpViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenAssetReference, 0);
  objc_storeStrong((id *)&self->_visibleAssetReference, 0);
  objc_destroyWeak((id *)&self->_spriteReferencesProvider);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_oneUpPresentation, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_initialAssetReference, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_resourcesDataSourceManager, 0);
}

- (PXAssetReference)hiddenAssetReference
{
  return self->_hiddenAssetReference;
}

- (PXAssetReference)visibleAssetReference
{
  return self->_visibleAssetReference;
}

- (PXStoryClipSpriteReferencesProvider)spriteReferencesProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spriteReferencesProvider);
  return (PXStoryClipSpriteReferencesProvider *)WeakRetained;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXOneUpPresentation)oneUpPresentation
{
  return self->_oneUpPresentation;
}

- (int64_t)hiddenClipIdentifier
{
  return self->_hiddenClipIdentifier;
}

- (int64_t)visibleClipIdentifier
{
  return self->_visibleClipIdentifier;
}

- (int64_t)initialClipIdentifier
{
  return self->_initialClipIdentifier;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (void)setInitialAssetReference:(id)a3
{
}

- (PXAssetReference)initialAssetReference
{
  return self->_initialAssetReference;
}

- (void)setAssetsDataSourceManager:(id)a3
{
}

- (PXAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXStoryResourcesDataSourceManager)resourcesDataSourceManager
{
  return self->_resourcesDataSourceManager;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PXStoryOneUpViewModel_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5DCCD20;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  [(PXStoryOneUpViewModel *)self performChanges:v5];
}

void __54__PXStoryOneUpViewModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40) != ResourcesDataSourceManagerObservationContext_171576)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PXStoryOneUpViewModel.m" lineNumber:259 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v5 = v3;
    [*(id *)(a1 + 32) _invalidateAssetsDataSourceManager];
    [*(id *)(a1 + 32) _invalidateInitialAssetReference];
    [*(id *)(a1 + 32) _invalidateVisibleClipIdentifier];
    [*(id *)(a1 + 32) _invalidateHiddenClipIdentifier];
    id v3 = v5;
  }
}

- (void)_updateHiddenClipIdentifier
{
  id v3 = [(PXStoryOneUpViewModel *)self hiddenAssetReference];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PXStoryOneUpViewModel__updateHiddenClipIdentifier__block_invoke;
  v5[3] = &unk_1E5DD36F8;
  id v6 = v3;
  id v4 = v3;
  [(PXStoryOneUpViewModel *)self setHiddenClipIdentifier:[(PXStoryOneUpViewModel *)self _clipIdentifierForAssetReference:v4 failureHandler:v5]];
}

void __52__PXStoryOneUpViewModel__updateHiddenClipIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PLStoryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Can't resolve a hidden clip identifier for 1up from hidden asset reference %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_invalidateHiddenClipIdentifier
{
  id v2 = [(PXStoryOneUpViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateHiddenClipIdentifier];
}

- (void)_updateVisibleClipIdentifier
{
  uint64_t v3 = [(PXStoryOneUpViewModel *)self visibleAssetReference];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PXStoryOneUpViewModel__updateVisibleClipIdentifier__block_invoke;
  v5[3] = &unk_1E5DD36F8;
  id v6 = v3;
  id v4 = v3;
  [(PXStoryOneUpViewModel *)self setVisibleClipIdentifier:[(PXStoryOneUpViewModel *)self _clipIdentifierForAssetReference:v4 failureHandler:v5]];
}

void __53__PXStoryOneUpViewModel__updateVisibleClipIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PLStoryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Can't resolve a visible clip identifier for 1up from visible asset reference %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_invalidateVisibleClipIdentifier
{
  id v2 = [(PXStoryOneUpViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateVisibleClipIdentifier];
}

- (void)_updateInitialAssetReference
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PXStoryOneUpViewModel *)self initialClipIdentifier];
  int v4 = [(PXStoryOneUpViewModel *)self timeline];
  uint64_t v5 = [(PXStoryOneUpViewModel *)self resourcesDataSourceManager];
  uint64_t v6 = [v5 dataSource];

  v7 = 0;
  if (v3 && v4 && v6)
  {
    uint64_t v8 = [v4 indexOfResourceForClipWithIdentifier:v3 inResourcesDataSource:v6 resourceKind:1];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = PLStoryGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v15 = 134217984;
        *(void *)&v15[4] = v3;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Can't resolve an initial asset reference for 1up from resource of clip with id %lu", v15, 0xCu);
      }
      v7 = 0;
    }
    else
    {
      uint64_t v10 = v8;
      v9 = [v6 displayAssetResourceAtIndex:v8];
      if ([v9 px_storyResourceKind] == 1)
      {
        v11 = [v9 px_storyResourceDisplayAsset];
        v12 = [(PXStoryOneUpViewModel *)self assetsDataSourceManager];
        v13 = [v12 dataSource];
        uint64_t v14 = [v13 identifier];

        *(void *)v15 = v14;
        *(void *)&v15[8] = 0;
        *(void *)&v15[16] = v10;
        uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
        v7 = (void *)[objc_alloc((Class)off_1E5DA55E0) initWithSectionObject:0 itemObject:v11 subitemObject:0 indexPath:v15];
      }
      else
      {
        v11 = PLStoryGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v15 = 138412546;
          *(void *)&v15[4] = v9;
          *(_WORD *)&v15[12] = 2048;
          *(void *)&v15[14] = v3;
          _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Can't resolve an initial asset reference for 1up from resource %@ of clip with id %lu", v15, 0x16u);
        }
        v7 = 0;
      }
    }
  }
  [(PXStoryOneUpViewModel *)self setInitialAssetReference:v7];
}

- (void)_invalidateInitialAssetReference
{
  id v2 = [(PXStoryOneUpViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateInitialAssetReference];
}

- (void)_updateAssetsDataSourceManager
{
  int64_t v3 = [(PXStoryOneUpViewModel *)self resourcesDataSourceManager];
  id v8 = [v3 dataSource];

  int v4 = [v8 displayAssets];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [[PXPhotosDataSourceConfiguration alloc] initWithAssetFetchResult:v4 options:0];
    uint64_t v6 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v5];
    v7 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSource:v6];
    [(PXStoryOneUpViewModel *)self setAssetsDataSourceManager:v7];
  }
}

- (void)_invalidateAssetsDataSourceManager
{
  id v2 = [(PXStoryOneUpViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAssetsDataSourceManager];
}

- (void)_setNeedsUpdate
{
}

- (int64_t)_clipIdentifierForAssetReference:(id)a3 failureHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (v6)
  {
    [v6 indexPath];
    id v8 = [(PXStoryOneUpViewModel *)self timeline];
    v9 = [(PXStoryOneUpViewModel *)self resourcesDataSourceManager];
    uint64_t v10 = [v9 dataSource];
    int64_t v11 = [v8 identifierOfFirstClipContainingResourceAtIndex:v13 inResourcesDataSource:v10 resourceKind:1];

    if (v7 && !v11) {
      v7[2](v7);
    }
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (void)setOneUpPresentation:(id)a3
{
  uint64_t v5 = (PXOneUpPresentation *)a3;
  if (self->_oneUpPresentation != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_oneUpPresentation, a3);
    uint64_t v5 = v6;
  }
}

- (void)setSpriteReferencesProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spriteReferencesProvider);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_spriteReferencesProvider, obj);
    self->_spriteReferencesProviderRespondsTo.spriteReferenceForClipWithIdentifier = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setHiddenClipIdentifier:(int64_t)a3
{
  self->_hiddenClipIdentifier = a3;
  [(PXStoryOneUpViewModel *)self signalChange:2];
}

- (void)setHiddenAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenAssetReference, a3);
  [(PXStoryOneUpViewModel *)self _invalidateHiddenClipIdentifier];
}

- (void)setVisibleClipIdentifier:(int64_t)a3
{
  self->_visibleClipIdentifier = a3;
  [(PXStoryOneUpViewModel *)self signalChange:1];
}

- (void)setVisibleAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_visibleAssetReference, a3);
  [(PXStoryOneUpViewModel *)self _invalidateVisibleClipIdentifier];
}

- (void)setInitialClipIdentifier:(int64_t)a3
{
  self->_initialClipIdentifier = a3;
  [(PXStoryOneUpViewModel *)self _invalidateInitialAssetReference];
}

- (BOOL)canPresentOneUp
{
  int64_t v3 = [(PXStoryOneUpViewModel *)self assetsDataSourceManager];
  if (v3)
  {
    int v4 = [(PXStoryOneUpViewModel *)self oneUpPresentation];
    char v5 = [v4 canStart];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)spriteReferenceForAssetReference:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__PXStoryOneUpViewModel_spriteReferenceForAssetReference___block_invoke;
    v11[3] = &unk_1E5DD36F8;
    id v12 = v4;
    int64_t v6 = [(PXStoryOneUpViewModel *)self _clipIdentifierForAssetReference:v12 failureHandler:v11];
    if (v6 && self->_spriteReferencesProviderRespondsTo.spriteReferenceForClipWithIdentifier)
    {
      int64_t v7 = v6;
      id v8 = [(PXStoryOneUpViewModel *)self spriteReferencesProvider];
      v9 = [v8 spriteReferenceForClipWithIdentifier:v7];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __58__PXStoryOneUpViewModel_spriteReferenceForAssetReference___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PLStoryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Can't resolve a clip identifier for 1up from asset reference %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setTimeline:(id)a3
{
  int64_t v7 = (PXStoryTimeline *)a3;
  uint64_t v5 = self->_timeline;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryTimeline *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_timeline, a3);
      [(PXStoryOneUpViewModel *)self _invalidateInitialAssetReference];
      [(PXStoryOneUpViewModel *)self _invalidateVisibleClipIdentifier];
      [(PXStoryOneUpViewModel *)self _invalidateHiddenClipIdentifier];
    }
  }
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryOneUpViewModel;
  [(PXStoryOneUpViewModel *)&v4 didPerformChanges];
  uint64_t v3 = [(PXStoryOneUpViewModel *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryOneUpViewModel;
  [(PXStoryOneUpViewModel *)&v3 performChanges:a3];
}

- (PXStoryOneUpViewModel)initWithResourcesDataSourceManager:(id)a3 mediaProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryOneUpViewModel;
  v9 = [(PXStoryOneUpViewModel *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourcesDataSourceManager, a3);
    [(PXStoryResourcesDataSourceManager *)v10->_resourcesDataSourceManager registerChangeObserver:v10 context:ResourcesDataSourceManagerObservationContext_171576];
    objc_storeStrong((id *)&v10->_mediaProvider, a4);
    uint64_t v11 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v10 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v10->_updater;
    v10->_updater = (PXUpdater *)v11;

    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateAssetsDataSourceManager];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateInitialAssetReference];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateVisibleClipIdentifier];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateHiddenClipIdentifier];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__PXStoryOneUpViewModel_initWithResourcesDataSourceManager_mediaProvider___block_invoke;
    v14[3] = &unk_1E5DD0FA8;
    v15 = v10;
    [(PXStoryOneUpViewModel *)v15 performChanges:v14];
  }
  return v10;
}

uint64_t __74__PXStoryOneUpViewModel_initWithResourcesDataSourceManager_mediaProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAssetsDataSourceManager];
}

- (PXStoryOneUpViewModel)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryOneUpViewModel.m", 43, @"%s is not available as initializer", "-[PXStoryOneUpViewModel init]");

  abort();
}

@end