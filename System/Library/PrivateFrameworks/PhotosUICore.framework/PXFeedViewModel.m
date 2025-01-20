@interface PXFeedViewModel
- (BOOL)isActive;
- (BOOL)wantsEmbeddedScrollView;
- (NSHashTable)accessoryTapToRadarDiagnosticsProviders;
- (NSString)subtitle;
- (OS_dispatch_queue)storyQueue;
- (PXAnonymousViewController)presentingViewController;
- (PXAssetCollectionActionPerformerDelegate)assetCollectionActionPerformerDelegate;
- (PXFeedItemLayoutFactory)itemLayoutFactory;
- (PXFeedPlaceholderFactory)placeholderFactory;
- (PXFeedViewActionPerformer)actionPerformer;
- (PXFeedViewLayoutSpec)spec;
- (PXFeedViewLayoutSpecManager)specManager;
- (PXFeedViewModel)init;
- (PXFeedViewModel)initWithDataSourceManager:(id)a3 specManager:(id)a4 itemLayoutFactory:(id)a5 placeholderFactory:(id)a6 wantsEmbeddedScrollView:(BOOL)a7 visibleRectChangeObserver:(id)a8;
- (PXFeedViewModel)initWithFeedViewConfiguration:(id)a3;
- (PXSectionedChangeDetailsRepository)dataSourceChangeHistory;
- (PXSectionedDataSource)dataSource;
- (PXSectionedDataSourceManager)dataSourceManager;
- (PXSectionedSelectionManager)selectionManager;
- (PXSelectionSnapshot)selectionSnapshot;
- (PXUpdater)updater;
- (id)visibleRectChangeObserver;
- (void)_invalidateDataSource;
- (void)_invalidateSelectionSnapshot;
- (void)_invalidateSpec;
- (void)_setNeedsUpdate;
- (void)_updateDataSource;
- (void)_updateSelectionSnapshot;
- (void)_updateSpec;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)registerAccessoryTapToRadarDiagnosticsProvider:(id)a3;
- (void)setActionPerformer:(id)a3;
- (void)setAssetCollectionActionPerformerDelegate:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSelectionSnapshot:(id)a3;
- (void)setSpec:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation PXFeedViewModel

- (PXFeedViewModel)initWithFeedViewConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [v4 feedConfiguration];
  v6 = [v5 dataSourceManager];
  v7 = [v4 extendedTraitCollection];

  v8 = [v5 specManagerWithExtendedTraitCollection:v7];

  v9 = [v5 itemLayoutFactory];
  v10 = [v5 placeholderFactory];
  uint64_t v11 = [v5 wantsEmbeddedScrollView];
  v12 = [v5 visibleRectChangeObserver];
  v13 = [(PXFeedViewModel *)self initWithDataSourceManager:v6 specManager:v8 itemLayoutFactory:v9 placeholderFactory:v10 wantsEmbeddedScrollView:v11 visibleRectChangeObserver:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__PXFeedViewModel_PXFeedDataSourceManager__initWithFeedViewConfiguration___block_invoke;
  v16[3] = &unk_1E5DC62F8;
  id v17 = v5;
  id v14 = v5;
  [(PXFeedViewModel *)v13 performChanges:v16];

  return v13;
}

void __74__PXFeedViewModel_PXFeedDataSourceManager__initWithFeedViewConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 localizedSubtitle];
  [v3 setSubtitle:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_accessoryTapToRadarDiagnosticsProviders, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong(&self->_visibleRectChangeObserver, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_placeholderFactory, 0);
  objc_storeStrong((id *)&self->_itemLayoutFactory, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_assetCollectionActionPerformerDelegate);
  objc_destroyWeak((id *)&self->_actionPerformer);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_dataSourceChangeHistory, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (PXSectionedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (NSHashTable)accessoryTapToRadarDiagnosticsProviders
{
  return self->_accessoryTapToRadarDiagnosticsProviders;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (id)visibleRectChangeObserver
{
  return self->_visibleRectChangeObserver;
}

- (BOOL)wantsEmbeddedScrollView
{
  return self->_wantsEmbeddedScrollView;
}

- (PXFeedViewLayoutSpecManager)specManager
{
  return self->_specManager;
}

- (PXFeedPlaceholderFactory)placeholderFactory
{
  return self->_placeholderFactory;
}

- (PXFeedItemLayoutFactory)itemLayoutFactory
{
  return self->_itemLayoutFactory;
}

- (PXAnonymousViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (PXAnonymousViewController *)WeakRetained;
}

- (PXAssetCollectionActionPerformerDelegate)assetCollectionActionPerformerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetCollectionActionPerformerDelegate);
  return (PXAssetCollectionActionPerformerDelegate *)WeakRetained;
}

- (PXFeedViewActionPerformer)actionPerformer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionPerformer);
  return (PXFeedViewActionPerformer *)WeakRetained;
}

- (PXFeedViewLayoutSpec)spec
{
  return self->_spec;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (PXSectionedChangeDetailsRepository)dataSourceChangeHistory
{
  return self->_dataSourceChangeHistory;
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[PXFeedViewModel isActive](self, "isActive"));
  [v4 setObject:v5 forKeyedSubscript:@"isActive"];

  v6 = [(PXFeedViewModel *)self dataSource];
  [v4 setObject:v6 forKeyedSubscript:@"dataSource"];

  v7 = [(PXFeedViewModel *)self spec];
  [v4 setObject:v7 forKeyedSubscript:@"spec"];

  v8 = [(PXFeedViewModel *)self itemLayoutFactory];
  [v4 setObject:v8 forKeyedSubscript:@"itemLayoutFactory"];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = [(PXFeedViewModel *)self accessoryTapToRadarDiagnosticsProviders];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [v4 addSubprovider:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PXFeedViewModel_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5DB0BE8;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  [(PXFeedViewModel *)self performChanges:v5];
}

void __48__PXFeedViewModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == DataSourceManagerObservationContext)
  {
    if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
      goto LABEL_11;
    }
    id v6 = v3;
    [*(id *)(a1 + 32) _invalidateDataSource];
    goto LABEL_10;
  }
  if (v4 == SelectionManagerObservationContext)
  {
    if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
      goto LABEL_11;
    }
    id v6 = v3;
    [*(id *)(a1 + 32) _invalidateSelectionSnapshot];
    goto LABEL_10;
  }
  if (v4 != SpecManagerObservationContext)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PXFeedViewModel.m" lineNumber:204 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v6 = v3;
    [*(id *)(a1 + 32) _invalidateSpec];
LABEL_10:
    id v3 = v6;
  }
LABEL_11:
}

- (void)_updateSpec
{
  id v4 = [(PXFeedViewModel *)self specManager];
  id v3 = [v4 spec];
  [(PXFeedViewModel *)self setSpec:v3];
}

- (void)_invalidateSpec
{
  id v2 = [(PXFeedViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSpec];
}

- (void)_updateSelectionSnapshot
{
  id v4 = [(PXFeedViewModel *)self selectionManager];
  id v3 = [v4 selectionSnapshot];
  [(PXFeedViewModel *)self setSelectionSnapshot:v3];
}

- (void)_invalidateSelectionSnapshot
{
  id v2 = [(PXFeedViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSelectionSnapshot];
}

- (void)_updateDataSource
{
  id v4 = [(PXFeedViewModel *)self dataSourceManager];
  id v3 = [v4 dataSource];
  [(PXFeedViewModel *)self setDataSource:v3];
}

- (void)_invalidateDataSource
{
  id v2 = [(PXFeedViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDataSource];
}

- (void)_setNeedsUpdate
{
}

- (void)setSubtitle:(id)a3
{
  v8 = (NSString *)a3;
  id v4 = self->_subtitle;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      subtitle = self->_subtitle;
      self->_subtitle = v6;

      [(PXFeedViewModel *)self signalChange:16];
    }
  }
}

- (void)setSpec:(id)a3
{
  v7 = (PXFeedViewLayoutSpec *)a3;
  char v5 = self->_spec;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXFeedViewLayoutSpec *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_spec, a3);
      [(PXFeedViewModel *)self signalChange:8];
    }
  }
}

- (void)setSelectionSnapshot:(id)a3
{
  v7 = (PXSelectionSnapshot *)a3;
  char v5 = self->_selectionSnapshot;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXSelectionSnapshot *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectionSnapshot, a3);
      [(PXFeedViewModel *)self signalChange:4];
    }
  }
}

- (void)setDataSource:(id)a3
{
  v7 = (PXSectionedDataSource *)a3;
  char v5 = self->_dataSource;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXSectionedDataSource *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dataSource, a3);
      [(PXFeedViewModel *)self signalChange:2];
    }
  }
}

- (void)setPresentingViewController:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_presentingViewController = &self->_presentingViewController;
  id WeakRetained = objc_loadWeakRetained((id *)p_presentingViewController);

  if (WeakRetained != v4)
  {
    id v7 = objc_loadWeakRetained((id *)p_presentingViewController);

    if (v7) {
      PXAssertGetLog();
    }
    objc_storeWeak((id *)p_presentingViewController, v4);
  }
}

- (void)setAssetCollectionActionPerformerDelegate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_assetCollectionActionPerformerDelegate = &self->_assetCollectionActionPerformerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_assetCollectionActionPerformerDelegate);

  if (WeakRetained != v4)
  {
    id v7 = objc_loadWeakRetained((id *)p_assetCollectionActionPerformerDelegate);

    if (v7) {
      PXAssertGetLog();
    }
    objc_storeWeak((id *)p_assetCollectionActionPerformerDelegate, v4);
  }
}

- (void)setActionPerformer:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_actionPerformer = &self->_actionPerformer;
  id WeakRetained = objc_loadWeakRetained((id *)p_actionPerformer);

  if (WeakRetained != v4)
  {
    id v7 = objc_loadWeakRetained((id *)p_actionPerformer);

    if (v7) {
      PXAssertGetLog();
    }
    objc_storeWeak((id *)p_actionPerformer, v4);
  }
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    [(PXFeedViewModel *)self signalChange:1];
  }
}

- (void)registerAccessoryTapToRadarDiagnosticsProvider:(id)a3
{
  id v7 = a3;
  if (!self->_accessoryTapToRadarDiagnosticsProviders)
  {
    id v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    accessoryTapToRadarDiagnosticsProviders = self->_accessoryTapToRadarDiagnosticsProviders;
    self->_accessoryTapToRadarDiagnosticsProviders = v4;
  }
  char v6 = [(PXFeedViewModel *)self accessoryTapToRadarDiagnosticsProviders];
  [v6 addObject:v7];
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXFeedViewModel;
  [(PXFeedViewModel *)&v4 didPerformChanges];
  id v3 = [(PXFeedViewModel *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXFeedViewModel;
  [(PXFeedViewModel *)&v3 performChanges:a3];
}

- (PXFeedViewModel)initWithDataSourceManager:(id)a3 specManager:(id)a4 itemLayoutFactory:(id)a5 placeholderFactory:(id)a6 wantsEmbeddedScrollView:(BOOL)a7 visibleRectChangeObserver:(id)a8
{
  id v31 = a3;
  id v30 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v34.receiver = self;
  v34.super_class = (Class)PXFeedViewModel;
  v18 = [(PXFeedViewModel *)&v34 init];
  uint64_t v19 = v18;
  if (v18)
  {
    p_dataSourceManager = (id *)&v18->_dataSourceManager;
    objc_storeStrong((id *)&v18->_dataSourceManager, a3);
    [*p_dataSourceManager registerChangeObserver:v19 context:DataSourceManagerObservationContext];
    uint64_t v21 = [*p_dataSourceManager changeHistory];
    dataSourceChangeHistory = v19->_dataSourceChangeHistory;
    v19->_dataSourceChangeHistory = (PXSectionedChangeDetailsRepository *)v21;

    uint64_t v23 = [objc_alloc((Class)off_1E5DA84B0) initWithDataSourceManager:*p_dataSourceManager];
    selectionManager = v19->_selectionManager;
    v19->_selectionManager = (PXSectionedSelectionManager *)v23;

    [(PXSectionedSelectionManager *)v19->_selectionManager registerChangeObserver:v19 context:SelectionManagerObservationContext];
    objc_storeStrong((id *)&v19->_specManager, a4);
    [(PXFeedViewLayoutSpecManager *)v19->_specManager registerChangeObserver:v19 context:SpecManagerObservationContext];
    objc_storeStrong((id *)&v19->_itemLayoutFactory, a5);
    objc_storeStrong((id *)&v19->_placeholderFactory, a6);
    objc_storeStrong((id *)&v19->_storyQueue, MEMORY[0x1E4F14428]);
    v19->_wantsEmbeddedScrollView = a7;
    uint64_t v25 = [v17 copy];
    id visibleRectChangeObserver = v19->_visibleRectChangeObserver;
    v19->_id visibleRectChangeObserver = (id)v25;

    uint64_t v27 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v19 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v19->_updater;
    v19->_updater = (PXUpdater *)v27;

    [(PXUpdater *)v19->_updater addUpdateSelector:sel__updateDataSource];
    [(PXUpdater *)v19->_updater addUpdateSelector:sel__updateSelectionSnapshot];
    [(PXUpdater *)v19->_updater addUpdateSelector:sel__updateSpec];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __144__PXFeedViewModel_initWithDataSourceManager_specManager_itemLayoutFactory_placeholderFactory_wantsEmbeddedScrollView_visibleRectChangeObserver___block_invoke;
    v32[3] = &unk_1E5DD0FA8;
    v33 = v19;
    [(PXFeedViewModel *)v33 performChanges:v32];
  }
  return v19;
}

uint64_t __144__PXFeedViewModel_initWithDataSourceManager_specManager_itemLayoutFactory_placeholderFactory_wantsEmbeddedScrollView_visibleRectChangeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateDataSource];
  [*(id *)(a1 + 32) _invalidateSelectionSnapshot];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateSpec];
}

- (PXFeedViewModel)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedViewModel.m", 33, @"%s is not available as initializer", "-[PXFeedViewModel init]");

  abort();
}

@end