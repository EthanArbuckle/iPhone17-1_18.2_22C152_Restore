@interface PXPeopleRelatedWidget
+ (id)_deferredDataSourceLoadingQueue;
- (BOOL)_calculateLayoutInfosForWidth:(double)a3 cellSize:(CGSize *)a4 interitemSpacing:(double *)a5;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasContentForCurrentInput;
- (BOOL)hasLoadedContentData;
- (BOOL)hasStartedLoadingDataSource;
- (BOOL)isSummaryMode;
- (BOOL)isUserInteractionEnabled;
- (BOOL)showFooter;
- (CGSize)_sizeForItemWithWidth:(double)a3 withInterItemSpacing:(double)a4;
- (CGSize)cellSize;
- (CGSize)contentSize;
- (NSString)localizedTitle;
- (PXAnonymousView)contentView;
- (PXPeopleRelatedWidget)initWithViewType:(unint64_t)a3;
- (PXPeopleStripCollectionViewController)collectionViewController;
- (PXPeopleWidgetDataSource)dataSource;
- (PXPhotosDetailsContext)context;
- (PXWidgetDelegate)widgetDelegate;
- (PXWidgetSpec)spec;
- (PXWidgetUnlockDelegate)widgetUnlockDelegate;
- (UIEdgeInsets)_realContentInset;
- (UIEdgeInsets)sectionInset;
- (double)cellMinInteritemSpacing;
- (double)cellMinLineSpacing;
- (double)preferredContentHeightForWidth:(double)a3;
- (double)targetPrefetchWidth;
- (id)traitCollection;
- (int64_t)contentViewAnchoringType;
- (unint64_t)_numberOfVisibleFacesForWidth:(double)a3;
- (unint64_t)viewType;
- (void)_handleTap:(id)a3;
- (void)_loadContainerView;
- (void)_prepareDataSource;
- (void)_resetControllerLayoutInfosForWidth:(double)a3;
- (void)_setHasLoadedContentData:(BOOL)a3;
- (void)contentSizeCategoryChanged:(id)a3;
- (void)loadContentData;
- (void)memberTappedAtIndexPath:(id)a3 atPoint:(CGPoint)a4 forPeopleStripController:(id)a5;
- (void)peopleDataSource:(id)a3 didAddMembersAtIndexPaths:(id)a4;
- (void)peopleDataSource:(id)a3 didApplyIncrementalChanges:(id)a4;
- (void)peopleDataSource:(id)a3 didRemoveMembersAtIndexPaths:(id)a4;
- (void)peopleDataSource:(id)a3 didUpdateMembersAtIndexPaths:(id)a4;
- (void)peopleDataSourceMembersChanged:(id)a3;
- (void)setCellMinInteritemSpacing:(double)a3;
- (void)setCellMinLineSpacing:(double)a3;
- (void)setCellSize:(CGSize)a3;
- (void)setCollectionViewController:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContext:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setIsSummaryMode:(BOOL)a3;
- (void)setShowFooter:(BOOL)a3;
- (void)setSpec:(id)a3;
- (void)setStartedLoadingDataSource:(BOOL)a3;
- (void)setTargetPrefetchWidth:(double)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setViewType:(unint64_t)a3;
- (void)setWidgetDelegate:(id)a3;
- (void)setWidgetUnlockDelegate:(id)a3;
- (void)unloadContentData;
@end

@implementation PXPeopleRelatedWidget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionViewController, 0);
  objc_destroyWeak((id *)&self->_widgetUnlockDelegate);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

- (BOOL)hasLoadedContentData
{
  return self->_hasLoadedContentData;
}

- (void)setTargetPrefetchWidth:(double)a3
{
  self->_targetPrefetchWidth = a3;
}

- (double)targetPrefetchWidth
{
  return self->_targetPrefetchWidth;
}

- (void)setViewType:(unint64_t)a3
{
  self->_viewType = a3;
}

- (unint64_t)viewType
{
  return self->_viewType;
}

- (void)setStartedLoadingDataSource:(BOOL)a3
{
  self->_startedLoadingDataSource = a3;
}

- (BOOL)hasStartedLoadingDataSource
{
  return self->_startedLoadingDataSource;
}

- (void)setDataSource:(id)a3
{
}

- (PXPeopleWidgetDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)showFooter
{
  return self->_showFooter;
}

- (void)setCellMinLineSpacing:(double)a3
{
  self->_cellMinLineSpacing = a3;
}

- (double)cellMinLineSpacing
{
  return self->_cellMinLineSpacing;
}

- (void)setCellMinInteritemSpacing:(double)a3
{
  self->_cellMinInteritemSpacing = a3;
}

- (double)cellMinInteritemSpacing
{
  return self->_cellMinInteritemSpacing;
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (CGSize)cellSize
{
  double width = self->_cellSize.width;
  double height = self->_cellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isSummaryMode
{
  return self->_isSummaryMode;
}

- (void)setCollectionViewController:(id)a3
{
}

- (PXPeopleStripCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void)setWidgetUnlockDelegate:(id)a3
{
}

- (PXWidgetUnlockDelegate)widgetUnlockDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetUnlockDelegate);
  return (PXWidgetUnlockDelegate *)WeakRetained;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (int64_t)contentViewAnchoringType
{
  return self->_contentViewAnchoringType;
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (void)setContext:(id)a3
{
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (void)setWidgetDelegate:(id)a3
{
}

- (PXWidgetDelegate)widgetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
  return (PXWidgetDelegate *)WeakRetained;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  v4 = (PXUITapGestureRecognizer *)a3;
  if ([(PXPeopleRelatedWidget *)self isUserInteractionEnabled]
    && (self->_tapGestureRecognizer == v4 || self->_pressGestureRecognizer == v4))
  {
    v6 = [(PXPeopleRelatedWidget *)self collectionViewController];
    v7 = [v6 collectionView];

    [(PXUITapGestureRecognizer *)v4 locationInView:v7];
    v8 = objc_msgSend(v7, "indexPathForItemAtPoint:");
    BOOL v5 = v8 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_setHasLoadedContentData:(BOOL)a3
{
  if (self->_hasLoadedContentData != a3)
  {
    self->_hasLoadedContentData = a3;
    id v4 = [(PXPeopleRelatedWidget *)self widgetDelegate];
    [v4 widgetHasLoadedContentDataDidChange:self];
  }
}

- (void)_resetControllerLayoutInfosForWidth:(double)a3
{
  if (a3 != 0.0)
  {
    uint64_t v9 = v3;
    uint64_t v10 = v4;
    double v7 = 0.0;
    double v8 = 0.0;
    double v6 = 0.0;
    -[PXPeopleRelatedWidget _calculateLayoutInfosForWidth:cellSize:interitemSpacing:](self, "_calculateLayoutInfosForWidth:cellSize:interitemSpacing:", &v7, &v6);
    -[PXPeopleRelatedWidget setCellSize:](self, "setCellSize:", v7, v8);
    [(PXPeopleRelatedWidget *)self setCellMinLineSpacing:v6];
    [(PXPeopleRelatedWidget *)self setCellMinInteritemSpacing:0.0];
  }
}

- (unint64_t)_numberOfVisibleFacesForWidth:(double)a3
{
  BOOL v5 = [(PXPeopleRelatedWidget *)self traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];
  uint64_t v7 = 3;
  if (a3 > 321.0) {
    uint64_t v7 = 4;
  }
  uint64_t v8 = 7;
  if (a3 <= 1200.0) {
    uint64_t v8 = 5;
  }
  if (v6 != 1 && a3 > 768.0) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = v7;
  }
  if ([(PXFeatureSpec *)self->_spec userInterfaceIdiom] == 3) {
    unint64_t v11 = 5;
  }
  else {
    unint64_t v11 = v10;
  }

  return v11;
}

- (id)traitCollection
{
  uint64_t v3 = [(PXPeopleRelatedWidget *)self widgetDelegate];
  uint64_t v4 = [v3 widgetExtendedTraitCollection:self];

  BOOL v5 = [v4 traitCollection];

  return v5;
}

- (CGSize)_sizeForItemWithWidth:(double)a3 withInterItemSpacing:(double)a4
{
  [(PXPeopleRelatedWidget *)self _realContentInset];
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(PXPeopleRelatedWidget *)self _numberOfVisibleFacesForWidth:a3];
  double v12 = (double)(((unint64_t)((a3 - v8 - v10 - (double)v11 * a4) / (double)v11) + 1) & 0xFFFFFFFFFFFFFFFELL);
  double v13 = v12;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (BOOL)_calculateLayoutInfosForWidth:(double)a3 cellSize:(CGSize *)a4 interitemSpacing:(double *)a5
{
  [(PXPeopleRelatedWidget *)self _realContentInset];
  if (a3 <= 1200.0)
  {
    double v10 = 28.0;
    if (a3 < 1024.0)
    {
      double v10 = 24.0;
      if (a3 < 730.0)
      {
        double v10 = 12.0;
        if (a3 >= 414.0) {
          double v10 = 20.0;
        }
      }
    }
  }
  else
  {
    double v10 = 32.0;
  }
  double v11 = v9 + -4.0;
  if (v11 < v10) {
    double v10 = v11;
  }
  double v12 = fmax(v10, 12.0);
  [(PXPeopleRelatedWidget *)self _sizeForItemWithWidth:a3 withInterItemSpacing:v12];
  if (a4)
  {
    a4->double width = v13;
    a4->double height = v14;
  }
  if (a5) {
    *a5 = v12;
  }
  return 1;
}

- (void)_loadContainerView
{
  [(PXPeopleRelatedWidget *)self _prepareDataSource];
  id v16 = [(PXPeopleRelatedWidget *)self dataSource];
  uint64_t v3 = [(PXPeopleRelatedWidget *)self collectionViewController];

  if (!v3 && v16)
  {
    uint64_t v4 = [[PXPeopleStripCollectionViewController alloc] initWithDataSource:v16 delegate:self];
    BOOL v5 = [(PXPeopleStripCollectionViewController *)v4 collectionView];
    [(PXPeopleRelatedWidget *)self setCollectionViewController:v4];
    [(PXPeopleRelatedWidget *)self _realContentInset];
    objc_msgSend(v5, "setFrame:", 0.0, 0.0, v6 + v7, v8 + v9);
    [v5 setShowsVerticalScrollIndicator:0];
    [v5 setShowsHorizontalScrollIndicator:0];
  }
  double v10 = [(PXPeopleRelatedWidget *)self widgetDelegate];
  double v11 = [v10 widgetViewHostingGestureRecognizers:self];
  double v12 = [[PXUITapGestureRecognizer alloc] initWithTarget:self action:sel__handleTap_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v12;

  [(PXUITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
  [(PXUITapGestureRecognizer *)self->_tapGestureRecognizer setCancelsTouchesInView:0];
  [v11 addGestureRecognizer:self->_tapGestureRecognizer];
  CGFloat v14 = [[PXUITapGestureRecognizer alloc] initWithTarget:self action:sel__handleTap_];
  pressGestureRecognizer = self->_pressGestureRecognizer;
  self->_pressGestureRecognizer = v14;

  [(PXUITapGestureRecognizer *)self->_pressGestureRecognizer setAllowedPressTypes:&unk_1F02D52D8];
  [(PXUITapGestureRecognizer *)self->_pressGestureRecognizer setDelegate:self];
  [v11 addGestureRecognizer:self->_pressGestureRecognizer];
}

- (UIEdgeInsets)_realContentInset
{
  v2 = [(PXPeopleRelatedWidget *)self spec];
  [v2 contentGuideInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v2 distanceBetweenHeaderBaselineAndWidgetContentTop];
  if (v11 > v4)
  {
    double v12 = v11;
    if ([v2 userInterfaceIdiom] != 3) {
      double v4 = v12;
    }
  }

  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)_prepareDataSource
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (![(PXPeopleRelatedWidget *)self hasStartedLoadingDataSource])
  {
    [(PXPeopleRelatedWidget *)self setStartedLoadingDataSource:1];
    double v3 = [(PXPeopleRelatedWidget *)self context];
    double v4 = [v3 assetCollections];
    double v5 = [v4 firstObject];

    if (v5)
    {
      double v6 = [PXPeopleWidgetDataSource alloc];
      double v7 = [v3 photosDataSource];
      double v8 = [v7 photoLibrary];
      double v9 = [(PXPeopleWidgetDataSource *)v6 initWithPhotoLibrary:v8 name:@"People Widget" objectsReloadBlock:&__block_literal_global_205_222029];

      if ([(PXPeopleRelatedWidget *)self viewType] == 1) {
        [(PXPeopleWidgetDataSource *)v9 setIsForOneUp:1];
      }
      objc_opt_class();
      double v10 = "TTRWorkflowBuilder";
      if (objc_opt_isKindOfClass())
      {
        [(PXPeopleWidgetDataSource *)v9 setContext:v3];
        double v11 = [MEMORY[0x1E4F1CA80] set];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        double v12 = [v3 people];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v37;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v37 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = [*(id *)(*((void *)&v36 + 1) + 8 * v16) localIdentifier];
              [v11 addObject:v17];

              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
          }
          while (v14);
        }

        v18 = (void *)MEMORY[0x1E4F28F60];
        v34[0] = MEMORY[0x1E4F143A8];
        double v10 = "TTRWorkflowBuilder";
        v34[1] = 3221225472;
        v34[2] = __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_2;
        v34[3] = &unk_1E5DC6720;
        id v35 = v11;
        id v19 = v11;
        v20 = [v18 predicateWithBlock:v34];
        [(PXPeopleDataSource *)v9 setFilterPredicate:v20];
      }
      [(PXPeopleDataSource *)v9 setDelegate:self];
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = *((void *)v10 + 415);
      uint64_t v21 = v28;
      v29 = __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_3;
      v30 = &unk_1E5DC6748;
      id v31 = v5;
      v32 = self;
      id v33 = v3;
      [(PXPeopleDataSource *)v9 setReloadBlock:&v27];
      [(PXPeopleRelatedWidget *)self setDataSource:v9];
      v22 = [(id)objc_opt_class() _deferredDataSourceLoadingQueue];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = v21;
      v24[2] = __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_4;
      v24[3] = &unk_1E5DD32A8;
      v25 = v9;
      v26 = self;
      v23 = v9;
      dispatch_async(v22, v24);
    }
  }
}

uint64_t __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = [MEMORY[0x1E4F1CA80] set];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 localIdentifier];
    [v4 addObject:v5];
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "localIdentifier", (void)v13);
          [v4 addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    goto LABEL_11;
  }
LABEL_12:
  int v11 = objc_msgSend(*(id *)(a1 + 32), "isEqualToSet:", v4, (void)v13);

  return v11 ^ 1u;
}

id __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_3(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:*(void *)(a1 + 32)];
  id v3 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v2 setIncludedDetectionTypes:v3];

  if ([*(id *)(a1 + 40) viewType] == 1) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 3;
  }
  [v2 setPersonContext:v4];
  id v5 = [*(id *)(a1 + 48) assetsByCollection];
  uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 32)];

  uint64_t v7 = [MEMORY[0x1E4F391F0] fetchPersonsInAssetsFetchResult:v6 options:v2];

  return v7;
}

void __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_4(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_5;
  v4[3] = &unk_1E5DD32A8;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_6;
  v5[3] = &unk_1E5DD32A8;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v3 loadObjectsAndUpdateMembersWithCompletion:v5];
}

void __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) loadMembersWithCompletionBlock:0];
  [*(id *)(a1 + 40) targetPrefetchWidth];
  if (v2 > 0.0)
  {
    double v3 = v2;
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "_numberOfVisibleFacesForWidth:");
    double v11 = 0.0;
    double v12 = 0.0;
    [*(id *)(a1 + 40) _calculateLayoutInfosForWidth:&v11 cellSize:0 interitemSpacing:v3];
    double v2 = v11;
    if (v11 > 0.0)
    {
      double v2 = v12;
      if (v12 > 0.0)
      {
        id v5 = *(void **)(a1 + 32);
        id v6 = objc_msgSend(*(id *)(a1 + 40), "collectionViewController", v12);
        uint64_t v7 = [v6 collectionView];
        uint64_t v8 = [v7 traitCollection];
        [v8 displayScale];
        objc_msgSend(v5, "prefetchThumbnailsForTargetSize:displayScale:maxFetchCount:", v4 + 1, v11, v12, v9);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "startListeningForChanges", v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_7;
  block[3] = &unk_1E5DD36F8;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setHasLoadedContentData:1];
}

uint64_t __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke()
{
  return 0;
}

- (void)peopleDataSource:(id)a3 didUpdateMembersAtIndexPaths:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", a4, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(PXPeopleRelatedWidget *)self collectionViewController];
  id v6 = [v5 collectionView];
  [v6 reloadItemsAtIndexPaths:v7];
}

- (void)peopleDataSource:(id)a3 didRemoveMembersAtIndexPaths:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", a4, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(PXPeopleRelatedWidget *)self collectionViewController];
  id v6 = [v5 collectionView];
  [v6 deleteItemsAtIndexPaths:v7];
}

- (void)peopleDataSource:(id)a3 didAddMembersAtIndexPaths:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", a4, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(PXPeopleRelatedWidget *)self collectionViewController];
  id v6 = [v5 collectionView];
  [v6 insertItemsAtIndexPaths:v7];
}

- (void)peopleDataSource:(id)a3 didApplyIncrementalChanges:(id)a4
{
  id v5 = a4;
  id v6 = [(PXPeopleRelatedWidget *)self collectionViewController];
  id v7 = [v6 collectionView];

  if ([v5 hasMoves])
  {
    [v7 reloadData];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28D58];
    double v9 = [v5 insertedIndexes];
    double v10 = objc_msgSend(v8, "px_indexPathsForItems:inSection:", v9, 0);

    double v11 = (void *)MEMORY[0x1E4F28D58];
    double v12 = [v5 removedIndexes];
    long long v13 = objc_msgSend(v11, "px_indexPathsForItems:inSection:", v12, 0);

    long long v14 = (void *)MEMORY[0x1E4F28D58];
    long long v15 = [v5 changedIndexes];
    long long v16 = objc_msgSend(v14, "px_indexPathsForItems:inSection:", v15, 0);

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __69__PXPeopleRelatedWidget_peopleDataSource_didApplyIncrementalChanges___block_invoke;
    v27[3] = &unk_1E5DCAEC8;
    id v28 = v13;
    id v29 = v7;
    id v30 = v10;
    id v31 = v16;
    id v17 = v16;
    id v18 = v10;
    id v19 = v13;
    [v29 performBatchUpdates:v27 completion:0];
  }
  v20 = [(PXPeopleRelatedWidget *)self collectionViewController];
  uint64_t v21 = [v20 collectionView];
  [v21 reloadData];

  v22 = [(PXPeopleRelatedWidget *)self widgetDelegate];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__PXPeopleRelatedWidget_peopleDataSource_didApplyIncrementalChanges___block_invoke_2;
  v24[3] = &unk_1E5DD32A8;
  id v25 = v22;
  v26 = self;
  id v23 = v22;
  [v23 widget:self animateChanges:v24 withAnimationOptions:0];
}

uint64_t __69__PXPeopleRelatedWidget_peopleDataSource_didApplyIncrementalChanges___block_invoke(id *a1)
{
  if ([a1[4] count]) {
    [a1[5] deleteItemsAtIndexPaths:a1[4]];
  }
  if ([a1[6] count]) {
    [a1[5] insertItemsAtIndexPaths:a1[6]];
  }
  uint64_t result = [a1[7] count];
  if (result)
  {
    id v3 = a1[5];
    id v4 = a1[7];
    return [v3 reloadItemsAtIndexPaths:v4];
  }
  return result;
}

uint64_t __69__PXPeopleRelatedWidget_peopleDataSource_didApplyIncrementalChanges___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) widgetLocalizedTitleDidChange:*(void *)(a1 + 40)];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 widgetPreferredContentHeightForWidthDidChange:v3];
}

- (void)peopleDataSourceMembersChanged:(id)a3
{
  [(PXPeopleRelatedWidget *)self _loadContainerView];
  id v4 = [(PXPeopleRelatedWidget *)self collectionViewController];
  id v5 = [v4 collectionView];
  [v5 reloadData];

  id v6 = [(PXPeopleRelatedWidget *)self widgetDelegate];
  [v6 widgetLocalizedTitleDidChange:self];

  long long v14 = *MEMORY[0x1E4F1DB30];
  [(PXPeopleRelatedWidget *)self contentSize];
  if (v7 != 0.0 && v8 != 0.0)
  {
    double v9 = v7;
    -[PXPeopleRelatedWidget _calculateLayoutInfosForWidth:cellSize:interitemSpacing:](self, "_calculateLayoutInfosForWidth:cellSize:interitemSpacing:", &v14, 0);
    [(PXPeopleRelatedWidget *)self cellSize];
    if (*(double *)&v14 != v11 || *((double *)&v14 + 1) != v10)
    {
      [(PXPeopleRelatedWidget *)self _resetControllerLayoutInfosForWidth:v9];
      double v12 = [(PXPeopleRelatedWidget *)self collectionViewController];
      [v12 contentWidthChanged];

      long long v13 = [(PXPeopleRelatedWidget *)self widgetDelegate];
      [v13 widgetPreferredContentHeightForWidthDidChange:self];
    }
  }
}

- (void)memberTappedAtIndexPath:(id)a3 atPoint:(CGPoint)a4 forPeopleStripController:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = a3;
    double v7 = [(PXPeopleRelatedWidget *)self dataSource];
    uint64_t v8 = [v6 item];

    double v9 = [v7 memberAtIndex:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v11 = 0;
        goto LABEL_10;
      }
      v16[0] = v9;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    }
    double v11 = v10;
    if (v10)
    {
      double v12 = [[PXPeopleDetailViewController alloc] initWithPeople:v10 ignoreSharedLibraryFilters:0];
      if (v12)
      {
        p_super = &v12->super.super.super.super;
        long long v14 = [(PXPeopleRelatedWidget *)self widgetDelegate];
        [v14 widget:self transitionToViewController:p_super withTransitionType:1];

LABEL_12:
        return;
      }
    }
LABEL_10:
    p_super = PLUIGetLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v15 = 0;
      _os_log_impl(&dword_1A9AE7000, p_super, OS_LOG_TYPE_DEFAULT, "PXPeopleDetailViewController failed to init, can't transition to view controller.", v15, 2u);
    }
    goto LABEL_12;
  }
}

- (UIEdgeInsets)sectionInset
{
  [(PXPeopleRelatedWidget *)self _realContentInset];
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (void)contentSizeCategoryChanged:(id)a3
{
  [(PXPeopleRelatedWidget *)self contentSize];
  if (v5 != 0.0 && v4 != 0.0)
  {
    [(PXPeopleRelatedWidget *)self _resetControllerLayoutInfosForWidth:"_resetControllerLayoutInfosForWidth:"];
    id v6 = [(PXPeopleRelatedWidget *)self collectionViewController];
    [v6 contentWidthChanged];

    id v7 = [(PXPeopleRelatedWidget *)self widgetDelegate];
    [v7 widgetPreferredContentHeightForWidthDidChange:self];
  }
}

- (NSString)localizedTitle
{
  double v2 = [(PXPeopleRelatedWidget *)self dataSource];
  double v3 = [v2 objects];
  double v4 = [v3 firstObject];
  double v5 = [v4 photoLibrary];

  id v6 = +[PXPeopleWidgetUtilities localizedTitleStringForWidgetDataSource:v2 photoLibrary:v5];

  return (NSString *)v6;
}

- (PXAnonymousView)contentView
{
  [(PXPeopleRelatedWidget *)self _loadContainerView];
  double v3 = [(PXPeopleRelatedWidget *)self collectionViewController];
  double v4 = [v3 collectionView];

  return (PXAnonymousView *)v4;
}

- (double)preferredContentHeightForWidth:(double)a3
{
  -[PXPeopleRelatedWidget setTargetPrefetchWidth:](self, "setTargetPrefetchWidth:");
  [(PXPeopleRelatedWidget *)self _prepareDataSource];
  [(PXPeopleRelatedWidget *)self _realContentInset];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(PXPeopleRelatedWidget *)self dataSource];
  id v10 = v9;
  if (v9)
  {
    if ([v9 numberOfMembers])
    {
      uint64_t v13 = 0;
      double v14 = 0.0;
      [(PXPeopleRelatedWidget *)self _calculateLayoutInfosForWidth:&v13 cellSize:0 interitemSpacing:a3];
      double v11 = v8 + v6 + v14;
    }
    else
    {
      double v11 = 0.0;
    }
  }
  else
  {
    double v11 = v6 + v8;
  }

  return v11;
}

- (void)setSpec:(id)a3
{
  double v5 = (PXWidgetSpec *)a3;
  if (self->_spec != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    double v6 = [(PXPeopleRelatedWidget *)self widgetDelegate];
    [v6 widgetPreferredContentHeightForWidthDidChange:self];

    double v5 = v7;
  }
}

- (void)setContentSize:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  id v7 = [(PXPeopleRelatedWidget *)self collectionViewController];
  [(PXPeopleRelatedWidget *)self contentSize];
  if (width != v6)
  {
    [(PXPeopleRelatedWidget *)self _resetControllerLayoutInfosForWidth:width];
    [v7 contentWidthChanged];
  }
  self->_contentSize.double width = width;
  self->_contentSize.CGFloat height = height;
}

- (BOOL)hasContentForCurrentInput
{
  double v2 = self;
  double v3 = [(PXPeopleRelatedWidget *)self widgetUnlockDelegate];
  LOBYTE(v2) = [v3 widgetDeviceIsUnlocked:v2];

  return (char)v2;
}

- (void)unloadContentData
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  double v4 = [(PXPeopleRelatedWidget *)self dataSource];
  [v4 stopListeningForChanges];

  [(PXPeopleRelatedWidget *)self setCollectionViewController:0];
  [(PXPeopleRelatedWidget *)self setDataSource:0];
  self->_startedLoadingDataSource = 0;
}

- (void)loadContentData
{
  [(PXPeopleRelatedWidget *)self _prepareDataSource];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_contentSizeCategoryChanged_ name:*MEMORY[0x1E4FB27A8] object:0];
}

- (void)setIsSummaryMode:(BOOL)a3
{
  if (self->_isSummaryMode != a3)
  {
    BOOL v3 = a3;
    self->_isSummaryMode = a3;
    double v5 = [(PXPeopleRelatedWidget *)self widgetDelegate];
    id v7 = v5;
    int64_t v6 = 1;
    if (v3) {
      int64_t v6 = 2;
    }
    self->_contentViewAnchoringType = v6;
    [v5 widgetInvalidateContentViewAnchoringType:self];
    [v7 widgetLocalizedDisclosureTitleDidChange:self];
  }
}

- (void)setShowFooter:(BOOL)a3
{
  if (self->_showFooter != a3)
  {
    self->_showFooter = a3;
    id v4 = [(PXPeopleRelatedWidget *)self widgetDelegate];
    [v4 widgetLocalizedDisclosureTitleDidChange:self];
  }
}

- (void)_handleTap:(id)a3
{
  id v4 = a3;
  double v5 = [(PXPeopleRelatedWidget *)self collectionViewController];
  int64_t v6 = [v5 collectionView];

  [v4 locationInView:v6];
  objc_msgSend(v6, "indexPathForItemAtPoint:");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v4 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  -[PXPeopleRelatedWidget memberTappedAtIndexPath:atPoint:forPeopleStripController:](self, "memberTappedAtIndexPath:atPoint:forPeopleStripController:", v11, self->_collectionViewController, v8, v10);
}

- (PXPeopleRelatedWidget)initWithViewType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleRelatedWidget;
  UIEdgeInsets result = [(PXPeopleRelatedWidget *)&v5 init];
  if (result)
  {
    result->_viewType = a3;
    *(_WORD *)&result->_isSummaryMode = 1;
    result->_startedLoadingDataSource = 0;
    result->_contentViewAnchoringType = 1;
    result->_contentSize = (CGSize)*MEMORY[0x1E4F1DB30];
    result->_cellSize = (CGSize)vdupq_n_s64(0x4052000000000000uLL);
  }
  return result;
}

+ (id)_deferredDataSourceLoadingQueue
{
  if (_deferredDataSourceLoadingQueue_onceToken != -1) {
    dispatch_once(&_deferredDataSourceLoadingQueue_onceToken, &__block_literal_global_222053);
  }
  double v2 = (void *)_deferredDataSourceLoadingQueue_deferDataSourceLoadingQueue;
  return v2;
}

void __56__PXPeopleRelatedWidget__deferredDataSourceLoadingQueue__block_invoke()
{
  double v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.photos.people.peopleRelatedWidgetDeferredLoading", v2);
  v1 = (void *)_deferredDataSourceLoadingQueue_deferDataSourceLoadingQueue;
  _deferredDataSourceLoadingQueue_deferDataSourceLoadingQueue = (uint64_t)v0;
}

@end