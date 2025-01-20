@interface SearchUICollectionViewDataSource
- (BOOL)deviceIsAuthenticated;
- (NSDirectionalEdgeInsets)sectionsInsetsForSection:(id)a3 sectionIndex:(unint64_t)a4 totalNumberOfSections:(int64_t)a5 attributes:(id)a6;
- (NSMutableSet)registeredCellIdentifiers;
- (OS_dispatch_queue)applyQueue;
- (SearchUICollectionViewController)controller;
- (SearchUICollectionViewDataSource)initWithController:(id)a3;
- (id)cellForRowModel:(id)a3 atIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)currentSnapshotLayoutConfiguration;
- (id)layoutSectionForSectionModel:(id)a3 layoutEnvironment:(id)a4 attributes:(id)a5;
- (id)pointerStringFrom:(id)a3;
- (id)rebuildAsyncLoaderResult:(id)a3 forCardSections:(id)a4;
- (id)rebuildSnapshot:(id)a3 replacingSectionModel:(id)a4 newSectionModel:(id)a5;
- (id)registerFooterView:(id)a3;
- (id)reuseIdentifierForFooterView:(id)a3;
- (id)reuseIdentifierForRowModel:(id)a3;
- (id)updateCompletionBlock;
- (int)numberOfUpdatesInProgress;
- (void)applySnapshot:(id)a3 animated:(BOOL)a4 skipsDiffing:(BOOL)a5 completion:(id)a6;
- (void)rebuildSnapshotForAsyncLoaders:(id)a3;
- (void)registerCellForRowModel:(id)a3;
- (void)registerSupplementaryViews;
- (void)reloadModel;
- (void)reloadSection:(id)a3 animated:(BOOL)a4;
- (void)reloadSection:(id)a3 animated:(BOOL)a4 reconfigureExisting:(BOOL)a5;
- (void)reloadSectionWithIdentifier:(id)a3 animated:(BOOL)a4 reconfigureExisting:(BOOL)a5;
- (void)removeRowModel:(id)a3 completion:(id)a4;
- (void)removeSectionContaining:(id)a3 completion:(id)a4;
- (void)removeSectionModel:(id)a3 completion:(id)a4;
- (void)setApplyQueue:(id)a3;
- (void)setController:(id)a3;
- (void)setNumberOfUpdatesInProgress:(int)a3;
- (void)setRegisteredCellIdentifiers:(id)a3;
- (void)setUpdateCompletionBlock:(id)a3;
- (void)updateWithSnapshot:(id)a3;
- (void)updateWithSnapshot:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation SearchUICollectionViewDataSource

- (id)layoutSectionForSectionModel:(id)a3 layoutEnvironment:(id)a4 attributes:(id)a5
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v88 = objc_opt_new();
  uint64_t v11 = [(SearchUICollectionViewDataSource *)self indexForSectionIdentifier:v8];
  v12 = [(SearchUICollectionViewDataSource *)self snapshot];
  uint64_t v13 = [v12 numberOfSections];

  int v85 = TLKSnippetModernizationEnabled();
  v14 = [v8 layoutSectionForEnvironment:v10 attributes:v9 dataSource:self];

  uint64_t v83 = v11;
  [(SearchUICollectionViewDataSource *)self sectionsInsetsForSection:v8 sectionIndex:v11 totalNumberOfSections:v13 attributes:v9];
  v87 = v14;
  objc_msgSend(v14, "setContentInsets:");
  v15 = (void *)MEMORY[0x1E4FB1338];
  v16 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v17 = (void *)MEMORY[0x1E4FB1308];
  v18 = (void *)MEMORY[0x1E4FAE198];
  v86 = self;
  v19 = [(SearchUICollectionViewDataSource *)self controller];
  v20 = [v19 view];
  [v18 pixelWidthForView:v20];
  v21 = objc_msgSend(v17, "absoluteDimension:");
  v89 = [v15 sizeWithWidthDimension:v16 heightDimension:v21];

  if ([v8 needsHeader])
  {
    v22 = (void *)MEMORY[0x1E4FB1338];
    v23 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v24 = [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
    v25 = [v22 sizeWithWidthDimension:v23 heightDimension:v24];

    [v8 headerInsetsWithAttributes:v9 sectionIndex:v83];
    double v27 = v26;
    double v29 = v28;
    double v30 = 0.0;
    if ([MEMORY[0x1E4FAE198] isMacOS]) {
      double v31 = v29;
    }
    else {
      double v31 = 0.0;
    }
    v32 = v9;
    if ([v8 needsHeaderSeparator]) {
      int v33 = [MEMORY[0x1E4FAE198] isMacOS] | v85;
    }
    else {
      int v33 = 0;
    }
    v35 = (void *)MEMORY[0x1E4FB12F8];
    v36 = +[SearchUISupplementaryIdentifiers sectionHeaderKind];
    v37 = [v35 boundarySupplementaryItemWithLayoutSize:v25 elementKind:v36 alignment:1];

    objc_msgSend(v37, "setContentInsets:", 0.0, v27, 0.0, v29);
    [v88 addObject:v37];

    double v34 = 0.0;
  }
  else
  {
    int v33 = 0;
    double v34 = *MEMORY[0x1E4FB12A8];
    double v27 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
    double v30 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
    double v31 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
    v32 = v9;
  }
  v38 = [v8 section];

  if (!v38)
  {
    v44 = v88;
    if (!v33) {
      goto LABEL_34;
    }
LABEL_29:
    LOBYTE(v60) = 0;
    goto LABEL_32;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v84 = [v32 shouldUseInsetRoundedSections];
  uint64_t v40 = [(SearchUICollectionViewDataSource *)self indexForSectionIdentifier:v8];
  v41 = [(SearchUICollectionViewDataSource *)self sectionIdentifierForIndex:v40 - 1];
  v42 = v32;
  if (isKindOfClass) {
    int v43 = 1;
  }
  else {
    int v43 = [v8 drawPlattersIfNecessary] ^ 1;
  }
  int v82 = v43;
  v45 = [v8 rowModels];
  if ([v45 count] == 1)
  {
    v46 = [v8 rowModels];
    v47 = [v46 firstObject];
    BOOL v81 = [v47 separatorStyle] != 1;
  }
  else
  {
    BOOL v81 = 1;
  }

  v48 = [v8 rowModels];
  v49 = [v48 firstObject];
  v50 = [v49 cardSection];
  objc_opt_class();
  char v51 = objc_opt_isKindOfClass();

  v52 = [v8 rowModels];
  v53 = [v52 firstObject];
  v54 = [v53 cardSection];
  objc_opt_class();
  char v55 = objc_opt_isKindOfClass();

  v56 = v41;
  if ((v51 & 1) != 0 || (v55 & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    int v57 = ([v8 drawPlattersIfNecessary] | v85) ^ 1;
  }
  else {
    int v57 = 0;
  }
  int v58 = v57 | v33;
  v32 = v42;
  if ((v84 ^ 1 | v82) != 1)
  {

    v44 = v88;
    if (!v58) {
      goto LABEL_34;
    }
    goto LABEL_29;
  }
  v59 = [(SearchUICollectionViewDataSource *)v86 snapshot];
  if (v40 == [v59 numberOfSections] - 1 && !objc_msgSend(v8, "needsHeader")) {
    int v60 = 0;
  }
  else {
    int v60 = v81 & (v85 ^ 1);
  }

  v44 = v88;
  if (v58)
  {
LABEL_32:
    v61 = (void *)MEMORY[0x1E4FB12F8];
    v62 = +[SearchUISupplementaryIdentifiers sectionTopSeparatorKind];
    v63 = [v61 boundarySupplementaryItemWithLayoutSize:v89 elementKind:v62 alignment:1];

    objc_msgSend(v63, "setContentInsets:", v34, v27, v30, v31);
    [v44 addObject:v63];

    if ((v60 & 1) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  if (v60)
  {
LABEL_33:
    v64 = (void *)MEMORY[0x1E4FB12F8];
    v65 = +[SearchUISupplementaryIdentifiers sectionBottomSeparatorKind];
    v66 = [v64 boundarySupplementaryItemWithLayoutSize:v89 elementKind:v65 alignment:5];

    [v44 addObject:v66];
  }
LABEL_34:
  if ([v8 sectionBackgroundStyleWithAttributes:v32] == 4)
  {
    v67 = (void *)MEMORY[0x1E4FB1338];
    v68 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v69 = [MEMORY[0x1E4FB1308] estimatedDimension:1.0];
    v70 = [v67 sizeWithWidthDimension:v68 heightDimension:v69];

    v71 = (void *)MEMORY[0x1E4FB12F8];
    v72 = [MEMORY[0x1E4FB12F0] layoutAnchorWithEdges:15];
    [v71 supplementaryItemWithLayoutSize:v70 elementKind:@"SearchUIBackgroundReuseIdentifer" containerAnchor:v72];
    v74 = v73 = v32;

    [v74 setZIndex:-10];
    v90[0] = v74;
    v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:1];
    v76 = [v87 boundarySupplementaryItems];
    v77 = [v75 arrayByAddingObjectsFromArray:v76];
    [v87 setBoundarySupplementaryItems:v77];

    v32 = v73;
  }
  v78 = [v87 boundarySupplementaryItems];
  v79 = [v44 arrayByAddingObjectsFromArray:v78];
  [v87 setBoundarySupplementaryItems:v79];

  [v87 setSupplementaryContentInsetsReference:2];
  [v87 setContentInsetsReference:2];

  return v87;
}

- (void)registerSupplementaryViews
{
  v2 = [(SearchUICollectionViewDataSource *)self controller];
  id v6 = [v2 collectionView];

  uint64_t v3 = objc_opt_class();
  v4 = +[SearchUILayoutFooterView reuseIdentifier];
  v5 = +[SearchUILayoutFooterView reuseIdentifier];
  [v6 registerClass:v3 forSupplementaryViewOfKind:v4 withReuseIdentifier:v5];

  [v6 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"SearchUIBackgroundReuseIdentifer" withReuseIdentifier:@"SearchUIBackgroundReuseIdentifer"];
  +[SearchUISupplementaryProvider registerSupplementariesForCollectionView:v6];
}

- (SearchUICollectionViewDataSource)initWithController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  v5 = [v4 collectionView];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__SearchUICollectionViewDataSource_initWithController___block_invoke;
  v20[3] = &unk_1E6E73C28;
  objc_copyWeak(&v21, &location);
  v19.receiver = self;
  v19.super_class = (Class)SearchUICollectionViewDataSource;
  id v6 = [(SearchUICollectionViewDataSource *)&v19 initWithCollectionView:v5 cellProvider:v20];

  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.searchui.datasource", v7);
    applyQueue = v6->_applyQueue;
    v6->_applyQueue = (OS_dispatch_queue *)v8;

    atomic_store(0, (unsigned int *)&v6->_numberOfUpdatesInProgress);
    objc_storeWeak((id *)&v6->_controller, v4);
    uint64_t v10 = objc_opt_new();
    registeredCellIdentifiers = v6->_registeredCellIdentifiers;
    v6->_registeredCellIdentifiers = (NSMutableSet *)v10;

    objc_initWeak(&from, v6);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __55__SearchUICollectionViewDataSource_initWithController___block_invoke_2;
    v16 = &unk_1E6E73C50;
    objc_copyWeak(&v17, &from);
    [(SearchUICollectionViewDataSource *)v6 setSupplementaryViewProvider:&v13];
    [(SearchUICollectionViewDataSource *)v6 registerSupplementaryViews];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);
  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v6;
}

- (id)currentSnapshotLayoutConfiguration
{
  uint64_t v3 = [SearchUICollectionViewLayoutConfiguration alloc];
  id v4 = [(SearchUICollectionViewDataSource *)self snapshot];
  v5 = [(SearchUICollectionViewLayoutConfiguration *)v3 initWithSnapshot:v4];

  return v5;
}

uint64_t __75__SearchUICollectionViewDataSource_updateWithSnapshot_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) asyncLoader];
        [v7 start];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateWithSnapshot:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [(SearchUICollectionViewDataSource *)self rebuildSnapshotForAsyncLoaders:v8];
  long long v10 = SearchUIDataSourceLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E45B5000, v10, OS_LOG_TYPE_DEFAULT, "Updating with snapshot.", buf, 2u);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__SearchUICollectionViewDataSource_updateWithSnapshot_animated_completion___block_invoke;
  v13[3] = &unk_1E6E72C68;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [(SearchUICollectionViewDataSource *)self applySnapshot:v12 animated:v6 skipsDiffing:v6 ^ 1 completion:v13];
}

- (void)rebuildSnapshotForAsyncLoaders:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SearchUIDataSourceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E45B5000, v5, OS_LOG_TYPE_DEFAULT, "Reloading snapshot for SectionAsyncLoaders", buf, 2u);
  }

  [v4 sectionIdentifiers];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v41;
    *(void *)&long long v7 = 138412546;
    long long v34 = v7;
    uint64_t v35 = *(void *)v41;
    v36 = self;
    do
    {
      uint64_t v10 = 0;
      uint64_t v37 = v8;
      do
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v40 + 1) + 8 * v10);
        id v12 = objc_msgSend(v11, "asyncLoader", v34);

        if (v12)
        {
          uint64_t v13 = [v11 asyncLoader];
          [v13 setDelegate:self];
          id v14 = [v11 asyncLoader];
          id v15 = [v14 cardSections];

          if (v15)
          {
            v16 = SearchUIDataSourceLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              id v17 = (objc_class *)objc_opt_class();
              v18 = NSStringFromClass(v17);
              *(_DWORD *)buf = v34;
              v46 = v11;
              __int16 v47 = 2112;
              v48 = v18;
              _os_log_impl(&dword_1E45B5000, v16, OS_LOG_TYPE_DEFAULT, "Rebuilding section %@ because of asyncLoader (%@).", buf, 0x16u);
            }
            objc_super v19 = [v4 itemIdentifiersInSectionWithIdentifier:v11];
            [v4 deleteItemsWithIdentifiers:v19];

            v20 = [[SearchUIDataSourceSnapshotBuilder alloc] initWithSnapshot:v4];
            id v21 = [v13 searchResult];
            v22 = [(SearchUICollectionViewDataSource *)self rebuildAsyncLoaderResult:v21 forCardSections:v15];
            v39 = v20;
            v23 = -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromCardSections:result:isInline:queryId:](v20, "buildRowModelsFromCardSections:result:isInline:queryId:", v15, v22, 0, [v13 queryId]);

            v24 = (void *)[v11 copyWithRowModels:v23];
            v25 = [v24 rowModels];
            uint64_t v26 = [v25 count];

            if (v26)
            {
              uint64_t v27 = [(SearchUICollectionViewDataSource *)self rebuildSnapshot:v4 replacingSectionModel:v11 newSectionModel:v24];

              double v28 = SearchUIDataSourceLog();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                double v29 = (objc_class *)objc_opt_class();
                double v30 = NSStringFromClass(v29);
                *(_DWORD *)buf = v34;
                v46 = v11;
                __int16 v47 = 2112;
                v48 = v30;
                _os_log_impl(&dword_1E45B5000, v28, OS_LOG_TYPE_DEFAULT, "Reloading section %@ because of asyncLoader (%@).", buf, 0x16u);
              }
              id v4 = (id)v27;
            }
            else
            {
              v44 = v11;
              double v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
              [v4 deleteSectionsWithIdentifiers:v31];

              double v28 = SearchUIDataSourceLog();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v32 = (objc_class *)objc_opt_class();
                int v33 = NSStringFromClass(v32);
                *(_DWORD *)buf = v34;
                v46 = v11;
                __int16 v47 = 2112;
                v48 = v33;
                _os_log_impl(&dword_1E45B5000, v28, OS_LOG_TYPE_DEFAULT, "Removing section %@ because of asyncLoader (%@).", buf, 0x16u);
              }
            }
            uint64_t v9 = v35;

            self = v36;
            uint64_t v8 = v37;
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v8);
  }
}

void __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 48));
  signed int v3 = atomic_load(WeakRetained + 6);
  atomic_fetch_add_explicit((atomic_uint *volatile)WeakRetained + 6, 1u, memory_order_relaxed);
  int v4 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v5 = SearchUIDataSourceLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4) {
    BOOL v7 = v3 < 1;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E45B5000, v5, OS_LOG_TYPE_DEFAULT, "Applying snapshot synchronously", buf, 2u);
    }

    uint64_t v10 = [WeakRetained applyQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_29;
    v13[3] = &unk_1E6E73B70;
    void v13[4] = WeakRetained;
    id v11 = &v14;
    id v14 = *(id *)(a1 + 32);
    id v12 = &v15;
    id v15 = *(id *)(a1 + 40);
    dispatch_sync(v10, v13);
  }
  else
  {
    if (v6)
    {
      int v8 = *(unsigned __int8 *)(a1 + 56);
      unsigned int v9 = atomic_load(WeakRetained + 6);
      *(_DWORD *)buf = 67109376;
      int v22 = v8;
      __int16 v23 = 1024;
      unsigned int v24 = v9;
      _os_log_impl(&dword_1E45B5000, v5, OS_LOG_TYPE_DEFAULT, "Applying snapshot asynchronously, skipsDiffing:%d, updatesInProgress:%d", buf, 0xEu);
    }

    uint64_t v10 = [WeakRetained applyQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_28;
    block[3] = &unk_1E6E73CC8;
    char v19 = *(unsigned char *)(a1 + 56);
    block[4] = WeakRetained;
    id v11 = &v17;
    id v17 = *(id *)(a1 + 32);
    id v12 = &v18;
    id v18 = *(id *)(a1 + 40);
    char v20 = *(unsigned char *)(a1 + 57);
    dispatch_async(v10, block);
  }
}

- (OS_dispatch_queue)applyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

void __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = SearchUIDataSourceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 67109120;
    int v9 = v3;
    _os_log_impl(&dword_1E45B5000, v2, OS_LOG_TYPE_DEFAULT, "Applied snapshot, skisDiffing %d", buf, 8u);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_27;
  v4[3] = &unk_1E6E73C78;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  +[SearchUIUtilities dispatchMainIfNecessary:v4];

  objc_destroyWeak(&v7);
}

- (void)applySnapshot:(id)a3 animated:(BOOL)a4 skipsDiffing:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_opt_new();
  }
  uint64_t v13 = v12;
  id v14 = (void *)MEMORY[0x1E4FB1790];
  id v15 = [(SearchUICollectionViewDataSource *)self controller];
  v16 = [v14 focusSystemForEnvironment:v15];

  if (v16)
  {
    id v17 = [(SearchUICollectionViewDataSource *)self controller];
    v16 = [v17 focusableIndexPath];

    id v18 = [(SearchUICollectionViewDataSource *)self controller];
    [v18 setFocusableIndexPath:0];
  }
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke;
  aBlock[3] = &unk_1E6E73CA0;
  BOOL v34 = a5;
  objc_copyWeak(&v33, location);
  id v19 = v11;
  id v32 = v19;
  id v20 = v16;
  id v31 = v20;
  id v21 = _Block_copy(aBlock);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_2;
  v24[3] = &unk_1E6E73CF0;
  objc_copyWeak(&v27, location);
  BOOL v28 = a5;
  id v22 = v13;
  id v25 = v22;
  id v23 = v21;
  id v26 = v23;
  BOOL v29 = a4;
  +[SearchUIUtilities dispatchMainIfNecessary:v24];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v33);
  objc_destroyWeak(location);
}

id __55__SearchUICollectionViewDataSource_initWithController___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  int v9 = [WeakRetained cellForRowModel:v6 atIndexPath:v7];

  return v9;
}

id __55__SearchUICollectionViewDataSource_initWithController___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v11 = [WeakRetained collectionView:v9 viewForSupplementaryElementOfKind:v8 atIndexPath:v7];

  return v11;
}

- (id)cellForRowModel:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[SearchUICollectionViewDataSource sectionIdentifierForIndex:](self, "sectionIdentifierForIndex:", [v7 section]);
  [(SearchUICollectionViewDataSource *)self registerCellForRowModel:v6];
  uint64_t v9 = [(SearchUICollectionViewDataSource *)self reuseIdentifierForRowModel:v6];
  id v10 = [v8 overriddenAccessibilityIdentifier];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v6 accessibilityIdentifier];
  }
  id v13 = v12;

  unsigned int v32 = objc_msgSend(v8, "shouldDisplayChevronForIndex:nextCardsEnabled:", objc_msgSend(v7, "item"), 1);
  unsigned int v31 = objc_msgSend(v8, "shouldLeaveSpaceForChevronForIndex:", objc_msgSend(v7, "item"));
  id v14 = [(SearchUICollectionViewDataSource *)self controller];
  id v15 = [v14 collectionView];
  v16 = [v15 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v7];

  id v17 = [(SearchUICollectionViewDataSource *)self controller];
  [v16 setDelegate:v17];

  if (v13)
  {
    id v18 = [NSString stringWithFormat:@"Identifier:%@,Section:%ld,Row:%ld", v13, objc_msgSend(v7, "section"), objc_msgSend(v7, "row")];
    [v16 setAccessibilityIdentifier:v18];
  }
  objc_msgSend(v6, "setSectionType:", objc_msgSend((id)objc_opt_class(), "sectionType"));
  [v16 updateWithRowModel:v6];
  objc_opt_class();
  id v33 = v13;
  id v19 = (void *)v9;
  if (objc_opt_isKindOfClass())
  {
    id v20 = v8;
    id v21 = [(SearchUICollectionViewDataSource *)self controller];
    id v22 = [v21 searchUIAttributes];
    uint64_t v23 = [v20 sectionBackgroundStyleWithAttributes:v22 forRowModel:v6];
  }
  else
  {
    id v21 = [(SearchUICollectionViewDataSource *)self controller];
    id v22 = [v21 searchUIAttributes];
    uint64_t v23 = [v8 sectionBackgroundStyleWithAttributes:v22];
  }
  [v16 setSectionBackgroundStyle:v23];

  if ([v8 isMemberOfClass:objc_opt_class()]
    && [v16 sectionBackgroundStyle] == 4
    && ([v8 rowModels],
        unsigned int v24 = objc_claimAutoreleasedReturnValue(),
        unint64_t v25 = [v24 count],
        v24,
        v25 >= 2))
  {
    if ([v7 row]) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = 5;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if ([v8 shouldInsetGroupedCollectionStyle])
    {
      id v27 = [(SearchUICollectionViewDataSource *)self controller];
      BOOL v28 = [v27 traitCollection];
      uint64_t v29 = [v28 userInterfaceIdiom];

      if (v29 != 3) {
        uint64_t v26 = 1;
      }
    }
  }
  objc_msgSend(v16, "setSearchui_focusStyle:", v26);
  [v16 updateChevronVisible:v32 leaveSpaceForChevron:v31];
  objc_msgSend(v16, "setSfSeparatorStyle:", objc_msgSend(v8, "separatorStyleForIndex:", objc_msgSend(v7, "item")));

  return v16;
}

- (SearchUICollectionViewController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (SearchUICollectionViewController *)WeakRetained;
}

- (void)registerCellForRowModel:(id)a3
{
  id v10 = a3;
  int v4 = -[SearchUICollectionViewDataSource reuseIdentifierForRowModel:](self, "reuseIdentifierForRowModel:");
  if (v4)
  {
    id v5 = [(SearchUICollectionViewDataSource *)self registeredCellIdentifiers];
    char v6 = [v5 containsObject:v4];

    if ((v6 & 1) == 0)
    {
      id v7 = [(SearchUICollectionViewDataSource *)self registeredCellIdentifiers];
      [v7 addObject:v4];

      id v8 = [(SearchUICollectionViewDataSource *)self controller];
      uint64_t v9 = [v8 collectionView];
      objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", objc_msgSend(v10, "collectionViewCellClass"), v4);
    }
  }
}

- (NSMutableSet)registeredCellIdentifiers
{
  return self->_registeredCellIdentifiers;
}

- (id)reuseIdentifierForRowModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 reuseIdentifier];
  char v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(SearchUICollectionViewDataSource *)self pointerStringFrom:v4];
  }
  id v8 = v7;

  return v8;
}

- (void)reloadModel
{
  int v3 = SearchUIDataSourceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E45B5000, v3, OS_LOG_TYPE_DEFAULT, "Reloading with current snapshot.", v5, 2u);
  }

  id v4 = [(SearchUICollectionViewDataSource *)self snapshot];
  [(SearchUICollectionViewDataSource *)self applySnapshot:v4 animated:0 skipsDiffing:1 completion:0];
}

- (void)reloadSection:(id)a3 animated:(BOOL)a4
{
}

- (void)reloadSection:(id)a3 animated:(BOOL)a4 reconfigureExisting:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(SearchUICollectionViewDataSource *)self snapshot];
  id v10 = v9;
  if (v8 && [v9 indexOfSectionIdentifier:v8] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v18 = [v8 asyncLoader];

    if (v18)
    {
      id v19 = [v8 asyncLoader];
      id v20 = [v8 asyncLoader];
      id v21 = [v20 cardSections];

      if (v21)
      {
        unsigned int v46 = v6;
        id v22 = SearchUIDataSourceLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = (objc_class *)objc_opt_class();
          unsigned int v24 = NSStringFromClass(v23);
          *(_DWORD *)buf = 138412546;
          id v49 = v8;
          __int16 v50 = 2112;
          char v51 = v24;
          _os_log_impl(&dword_1E45B5000, v22, OS_LOG_TYPE_DEFAULT, "Rebuilding section %@ because of asyncLoader (%@).", buf, 0x16u);
        }
        unint64_t v25 = [v10 itemIdentifiersInSectionWithIdentifier:v8];
        [v10 deleteItemsWithIdentifiers:v25];

        uint64_t v26 = [[SearchUIDataSourceSnapshotBuilder alloc] initWithSnapshot:v10];
        id v27 = [v19 searchResult];
        BOOL v28 = [(SearchUICollectionViewDataSource *)self rebuildAsyncLoaderResult:v27 forCardSections:v21];
        uint64_t v29 = -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromCardSections:result:isInline:queryId:](v26, "buildRowModelsFromCardSections:result:isInline:queryId:", v21, v28, 0, [v19 queryId]);

        uint64_t v30 = [v8 copyWithRowModels:v29];
        uint64_t v31 = [(SearchUICollectionViewDataSource *)self rebuildSnapshot:v10 replacingSectionModel:v8 newSectionModel:v30];

        id v10 = (void *)v31;
        id v8 = (id)v30;
        uint64_t v6 = v46;
      }
    }
    unsigned int v32 = [v8 rowModels];
    uint64_t v33 = [v32 count];

    if (v33)
    {
      BOOL v34 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(v10, "indexOfSectionIdentifier:", v8));
      uint64_t v35 = [(SearchUICollectionViewDataSource *)self controller];
      v36 = [v35 collectionView];
      uint64_t v37 = [v36 supplementaryViewForElementKind:@"SearchUIBackgroundReuseIdentifer" atIndexPath:v34];

      if (v37)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v38 = v37;
          v39 = [v8 backgroundColor];
          long long v40 = [v38 colorView];

          [v40 setColor:v39];
        }
      }
      long long v41 = [v10 itemIdentifiersInSectionWithIdentifier:v8];
      [v10 deleteItemsWithIdentifiers:v41];

      long long v42 = [v8 rowModels];
      [v10 appendItemsWithIdentifiers:v42 intoSectionWithIdentifier:v8];

      if (v5)
      {
        long long v43 = [v8 rowModels];
        [v10 reconfigureItemsWithIdentifiers:v43];
      }
      v44 = SearchUIDataSourceLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v8;
        _os_log_impl(&dword_1E45B5000, v44, OS_LOG_TYPE_DEFAULT, "Reloading section %@.", buf, 0xCu);
      }
    }
    else
    {
      id v47 = v8;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      [v10 deleteSectionsWithIdentifiers:v45];

      BOOL v34 = SearchUIDataSourceLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v8;
        _os_log_impl(&dword_1E45B5000, v34, OS_LOG_TYPE_DEFAULT, "Reloading section %@. Removing because section is empty!", buf, 0xCu);
      }
    }

    [(SearchUICollectionViewDataSource *)self applySnapshot:v10 animated:v6 skipsDiffing:0 completion:0];
  }
  else
  {
    id v11 = SearchUIDataSourceLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SearchUICollectionViewDataSource reloadSection:animated:reconfigureExisting:]((uint64_t)v8, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (void)reloadSectionWithIdentifier:(id)a3 animated:(BOOL)a4 reconfigureExisting:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 length])
  {
    BOOL v27 = v6;
    BOOL v28 = v5;
    uint64_t v26 = self;
    uint64_t v9 = [(SearchUICollectionViewDataSource *)self snapshot];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = [v9 sectionIdentifiers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * v14);
        uint64_t v16 = [v15 section];
        uint64_t v17 = [v16 sectionIdentifier];
        char v18 = [v17 isEqualToString:v8];

        if (v18) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v12) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v19 = v15;

      if (!v19) {
        goto LABEL_13;
      }
      [(SearchUICollectionViewDataSource *)v26 reloadSection:v19 animated:v27 reconfigureExisting:v28];
    }
    else
    {
LABEL_10:

LABEL_13:
      id v19 = SearchUIDataSourceLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[SearchUICollectionViewDataSource reloadSectionWithIdentifier:animated:reconfigureExisting:]((uint64_t)v8, v19, v20, v21, v22, v23, v24, v25);
      }
    }
  }
  else
  {
    uint64_t v9 = SearchUIDataSourceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SearchUICollectionViewDataSource reloadSectionWithIdentifier:animated:reconfigureExisting:](v9);
    }
  }
}

- (BOOL)deviceIsAuthenticated
{
  v2 = [(SearchUICollectionViewDataSource *)self controller];
  int v3 = [v2 view];
  BOOL v4 = +[SearchUIUtilities deviceIsAuthenticatedForView:v3];

  return v4;
}

- (void)updateWithSnapshot:(id)a3
{
}

- (id)rebuildSnapshot:(id)a3 replacingSectionModel:(id)a4 newSectionModel:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 indexOfSectionIdentifier:v8];
  v19[0] = v8;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v7 deleteSectionsWithIdentifiers:v11];

  if (v10 == [v7 numberOfSections])
  {
    id v18 = v9;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    [v7 appendSectionsWithIdentifiers:v12];
  }
  else
  {
    uint64_t v13 = [v7 sectionIdentifiers];
    uint64_t v12 = [v13 objectAtIndexedSubscript:v10];

    id v17 = v9;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [v7 insertSectionsWithIdentifiers:v14 beforeSectionWithIdentifier:v12];
  }
  uint64_t v15 = [v9 rowModels];
  [v7 appendItemsWithIdentifiers:v15 intoSectionWithIdentifier:v9];

  return v7;
}

- (id)rebuildAsyncLoaderResult:(id)a3 forCardSections:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSearchResult:v6];
  id v8 = +[SearchUIUtilities cardForRenderingResult:v6];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [v7 card];
  }
  uint64_t v10 = v9;

  uint64_t v11 = [v10 cardSections];
  if ([v11 count] == 1)
  {
    uint64_t v12 = [v10 cardSections];
    uint64_t v13 = [v12 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v15 = [v10 cardSections];
      uint64_t v16 = [v15 firstObject];
      id v17 = (void *)[v16 copy];

      [v17 setCardSections:v5];
      v20[0] = v17;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [v10 setCardSections:v18];
    }
  }
  else
  {
  }
  return v7;
}

- (id)registerFooterView:(id)a3
{
  BOOL v4 = [(SearchUICollectionViewDataSource *)self reuseIdentifierForFooterView:a3];
  id v5 = [(SearchUICollectionViewDataSource *)self controller];
  id v6 = [v5 collectionView];
  [v6 registerClass:objc_opt_class() forSupplementaryViewOfKind:v4 withReuseIdentifier:v4];

  return v4;
}

- (void)removeRowModel:(id)a3 completion:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SearchUICollectionViewDataSource *)self snapshot];
  id v9 = [v8 sectionIdentifierForSectionContainingItemIdentifier:v6];
  if (v9)
  {
    v23[0] = v6;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [v8 deleteItemsWithIdentifiers:v10];

    if (![v8 numberOfItemsInSection:v9])
    {
      uint64_t v22 = v9;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      [v8 deleteSectionsWithIdentifiers:v11];
    }
    uint64_t v12 = SearchUIDataSourceLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = [v6 itemIdentifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      uint64_t v21 = v14;
      _os_log_impl(&dword_1E45B5000, v12, OS_LOG_TYPE_DEFAULT, "Removing rowModel %@ (%@).", buf, 0x16u);
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__SearchUICollectionViewDataSource_removeRowModel_completion___block_invoke;
    v16[3] = &unk_1E6E73068;
    id v17 = v7;
    [(SearchUICollectionViewDataSource *)self applySnapshot:v8 animated:1 skipsDiffing:0 completion:v16];
  }
  else
  {
    uint64_t v15 = SearchUIDataSourceLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SearchUICollectionViewDataSource removeRowModel:completion:](v6, v15);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

uint64_t __62__SearchUICollectionViewDataSource_removeRowModel_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)removeSectionContaining:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SearchUICollectionViewDataSource *)self snapshot];
  id v9 = [v8 sectionIdentifierForSectionContainingItemIdentifier:v6];
  uint64_t v10 = SearchUIDataSourceLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [v6 itemIdentifier];
    int v13 = 138412802;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl(&dword_1E45B5000, v10, OS_LOG_TYPE_DEFAULT, "Trying to remove section %@ containing rowModel %@ (%@).", (uint8_t *)&v13, 0x20u);
  }
  [(SearchUICollectionViewDataSource *)self removeSectionModel:v9 completion:v7];
}

- (void)removeSectionModel:(id)a3 completion:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SearchUICollectionViewDataSource *)self snapshot];
  if (v6)
  {
    v23[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [v8 deleteSectionsWithIdentifiers:v9];

    uint64_t v10 = SearchUIDataSourceLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_1E45B5000, v10, OS_LOG_TYPE_DEFAULT, "Removing section %@", buf, 0xCu);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __66__SearchUICollectionViewDataSource_removeSectionModel_completion___block_invoke;
    v19[3] = &unk_1E6E73068;
    id v20 = v7;
    [(SearchUICollectionViewDataSource *)self applySnapshot:v8 animated:1 skipsDiffing:0 completion:v19];
  }
  else
  {
    uint64_t v11 = SearchUIDataSourceLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SearchUICollectionViewDataSource removeSectionModel:completion:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

uint64_t __66__SearchUICollectionViewDataSource_removeSectionModel_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_27(uint64_t a1)
{
  id WeakRetained = (atomic_uint *)objc_loadWeakRetained((id *)(a1 + 48));
  int v3 = WeakRetained;
  if (WeakRetained) {
    atomic_fetch_add_explicit(WeakRetained + 6, 0xFFFFFFFF, memory_order_relaxed);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    int v3 = v9;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = [(atomic_uint *)v3 controller];
    [v6 setFocusableIndexPath:v5];

    int v3 = v9;
  }
  id v7 = [(atomic_uint *)v3 updateCompletionBlock];

  if (v7)
  {
    id v8 = [(atomic_uint *)v9 updateCompletionBlock];
    ((void (**)(void, atomic_uint *))v8)[2](v8, v9);
  }
}

uint64_t __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_28(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return [v3 applySnapshotUsingReloadData:v4 completion:*(void *)(a1 + 48)];
  }
  else {
    return [v3 applySnapshot:v4 animatingDifferences:*(unsigned __int8 *)(a1 + 57) completion:*(void *)(a1 + 48)];
  }
}

uint64_t __83__SearchUICollectionViewDataSource_applySnapshot_animated_skipsDiffing_completion___block_invoke_29(uint64_t a1)
{
  return [*(id *)(a1 + 32) applySnapshotUsingReloadData:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (id)reuseIdentifierForFooterView:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  id v6 = +[SearchUILayoutFooterView reuseIdentifier];
  id v7 = [(SearchUICollectionViewDataSource *)self pointerStringFrom:v5];

  id v8 = [v4 stringWithFormat:@"%@-%@", v6, v7];

  return v8;
}

- (id)pointerStringFrom:(id)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", a3);
}

- (void)setUpdateCompletionBlock:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  id updateCompletionBlock = self->_updateCompletionBlock;
  self->_id updateCompletionBlock = v4;
  MEMORY[0x1F41817F8](v4, updateCompletionBlock);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = -[SearchUICollectionViewDataSource sectionIdentifierForIndex:](self, "sectionIdentifierForIndex:", [v10 section]);
  uint64_t v12 = [(SearchUICollectionViewDataSource *)self controller];
  uint64_t v13 = [v12 footerView];
  uint64_t v14 = [(SearchUICollectionViewDataSource *)self reuseIdentifierForFooterView:v13];

  if ([v9 isEqualToString:v14])
  {
    uint64_t v15 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v14 forIndexPath:v10];
    uint64_t v16 = [(SearchUICollectionViewDataSource *)self controller];
    uint64_t v17 = [v16 footerView];
    [v15 setFooterView:v17];

    uint64_t v18 = [(SearchUICollectionViewDataSource *)self controller];
    uint64_t v19 = [v18 footerView];
    [v15 setHidden:v19 == 0];
LABEL_5:

    goto LABEL_7;
  }
  if ([v9 isEqualToString:@"SearchUIBackgroundReuseIdentifer"])
  {
    uint64_t v15 = [v8 dequeueReusableSupplementaryViewOfKind:@"SearchUIBackgroundReuseIdentifer" withReuseIdentifier:@"SearchUIBackgroundReuseIdentifer" forIndexPath:v10];
    +[SearchUIAutoLayout sectionCornerRadius];
    objc_msgSend(v15, "tlks_setCornerRadius:withStyle:", *MEMORY[0x1E4F39EA8]);
    [v15 setHighlighted:0];
    uint64_t v18 = [v11 backgroundColor];
    uint64_t v19 = [v15 colorView];
    [v19 setColor:v18];
    goto LABEL_5;
  }
  uint64_t v18 = [(SearchUICollectionViewDataSource *)self controller];
  uint64_t v15 = +[SearchUISupplementaryProvider viewForSupplementaryOfKind:v9 atIndexPath:v10 forSectionModel:v11 controller:v18];
LABEL_7:

  return v15;
}

- (NSDirectionalEdgeInsets)sectionsInsetsForSection:(id)a3 sectionIndex:(unint64_t)a4 totalNumberOfSections:(int64_t)a5 attributes:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [(SearchUICollectionViewDataSource *)self snapshot];
  uint64_t v13 = [v12 numberOfSections];

  int v14 = [v10 shouldInsetGroupedCollectionStyle];
  if ([(id)objc_opt_class() sectionType]) {
    int v15 = 1;
  }
  else {
    int v15 = v14;
  }
  if ([MEMORY[0x1E4FAE198] isSiri]) {
    BOOL v16 = [(id)objc_opt_class() sectionType] == 1;
  }
  else {
    BOOL v16 = 0;
  }
  if ([v11 inPreviewPlatter]) {
    LOBYTE(v17) = 0;
  }
  else {
    int v17 = [MEMORY[0x1E4FAE198] isSiri] ^ 1;
  }
  [v10 sectionInsetsWithAttributes:v11 sectionIndex:a4];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  if (v14)
  {
    +[SearchUIUtilities disambiguationTableCellContentInset];
  }
  else if (v16)
  {
    +[SearchUIUtilities imageGridContentInset];
  }
  else
  {
    +[SearchUIUtilities standardTableCellContentInset];
  }
  double v27 = v26;
  uint64_t v28 = v13 - 1;
  if (a4) {
    char v29 = 1;
  }
  else {
    char v29 = v17;
  }
  if (v29) {
    goto LABEL_33;
  }
  long long v30 = [v10 rowModels];
  long long v31 = [v30 firstObject];

  long long v32 = [v31 cardSection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v16)
    {
LABEL_27:
      if ([v31 fillsBackgroundWithContent]) {
        double v19 = 12.0;
      }
      else {
        double v19 = 0.0;
      }
      goto LABEL_32;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (([v31 fillsBackgroundWithContent] ^ 1 | v16) & 1) == 0)
    {
      goto LABEL_27;
    }
  }
  if (a5 == 1)
  {
    double v19 = v27;
    if (v15) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  double v19 = v27;
  if ((([v31 fillsBackgroundWithContent] | v15) & 1) == 0) {
LABEL_31:
  }
    double v19 = 0.0;
LABEL_32:

LABEL_33:
  if (v28 == a4) {
    char v33 = v17;
  }
  else {
    char v33 = 1;
  }
  if ((v33 & 1) == 0)
  {
    uint64_t v34 = [v10 rowModels];
    uint64_t v35 = [v34 lastObject];

    if (a5 == 1)
    {
      if (v15) {
        goto LABEL_42;
      }
    }
    else if (([v35 fillsBackgroundWithContent] | v15))
    {
LABEL_42:

      double v23 = v27;
      goto LABEL_43;
    }
    double v27 = 0.0;
    goto LABEL_42;
  }
LABEL_43:

  double v36 = v19;
  double v37 = v21;
  double v38 = v23;
  double v39 = v25;
  result.trailing = v39;
  result.bottom = v38;
  result.leading = v37;
  result.top = v36;
  return result;
}

- (void)setController:(id)a3
{
}

- (void)setRegisteredCellIdentifiers:(id)a3
{
}

- (void)setApplyQueue:(id)a3
{
}

- (int)numberOfUpdatesInProgress
{
  return self->_numberOfUpdatesInProgress;
}

- (void)setNumberOfUpdatesInProgress:(int)a3
{
  self->_numberOfUpdatesInProgress = a3;
}

- (id)updateCompletionBlock
{
  return self->_updateCompletionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateCompletionBlock, 0);
  objc_storeStrong((id *)&self->_applyQueue, 0);
  objc_storeStrong((id *)&self->_registeredCellIdentifiers, 0);
  objc_destroyWeak((id *)&self->_controller);
}

- (void)reloadSection:(uint64_t)a3 animated:(uint64_t)a4 reconfigureExisting:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reloadSectionWithIdentifier:(os_log_t)log animated:reconfigureExisting:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "Attempted to reload section with invalid identifier!", v1, 2u);
}

- (void)reloadSectionWithIdentifier:(uint64_t)a3 animated:(uint64_t)a4 reconfigureExisting:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeRowModel:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  id v5 = [a1 itemIdentifier];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "Attempted to remove rowModel %@ (%@) which is not part of current snapshot!", (uint8_t *)&v6, 0x16u);
}

- (void)removeSectionModel:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end