@interface PUPhotosAlbumViewController
- (BOOL)_hasAccurateCounts;
- (BOOL)_isCountingAssetTypes;
- (BOOL)allowSelectAllButton;
- (BOOL)canBeginStackCollapseTransition;
- (BOOL)canDragIn;
- (BOOL)canDragOut;
- (BOOL)canHandleDropSession:(id)a3;
- (BOOL)isCameraRoll;
- (BOOL)isTrashBinViewController;
- (BOOL)prepareForDismissingForced:(BOOL)a3;
- (BOOL)shouldShowSectionHeaders;
- (BOOL)updateSpec;
- (BOOL)wantsGlobalFooter;
- (NSString)globalFooterSubtitle;
- (PHAssetCollection)assetCollection;
- (PHFetchResult)assetCollectionAssets;
- (PLAlbumProtocol)album;
- (PUPhotosAlbumViewController)initWithAlbumSpec:(id)a3 photoLibrary:(id)a4;
- (PUPhotosAlbumViewController)initWithSpec:(id)a3;
- (PUPhotosAlbumViewController)initWithSpec:(id)a3 photoLibrary:(id)a4;
- (PUPhotosAlbumViewControllerSpec)_albumSpec;
- (double)globalHeaderHeight;
- (double)sectionedGridLayout:(id)a3 accessibilitySectionHeaderHeightForVisualSection:(int64_t)a4;
- (double)sectionedGridLayout:(id)a3 sectionHeaderHeightForVisualSection:(int64_t)a4;
- (id)_collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)_globalHeaderTitle;
- (id)filterPredicateForAlbum:(id)a3;
- (id)localizedTitleForAssets:(id)a3;
- (id)newGridLayout;
- (id)px_navigationDestination;
- (id)sessionInfoForTransferredAssets:(id)a3;
- (int64_t)cellFillMode;
- (int64_t)oneUpPresentationOrigin;
- (unint64_t)additionalOneUpViewControllerOptions;
- (unint64_t)routingOptionsForDestination:(id)a3;
- (void)_collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)_countAssetTypesIfNeeded;
- (void)_getDataForVisualSection:(int64_t)a3 hasActionButton:(BOOL *)a4 locations:(id *)a5 title:(id *)a6 startDate:(id *)a7 endDate:(id *)a8;
- (void)_invalideSectionHeaders;
- (void)_performAddDropWithSession:(id)a3;
- (void)_performMoveDropWithCoordinator:(id)a3;
- (void)_setAlbumSpec:(id)a3;
- (void)_setCountingAssetTypes:(BOOL)a3;
- (void)_setHasAccurateCounts:(BOOL)a3;
- (void)_updateSectionHeadersIfNeeded;
- (void)configureGlobalFooterView:(id)a3;
- (void)configureGlobalHeaderView:(id)a3;
- (void)configureSupplementaryView:(id)a3 ofKind:(id)a4 forIndexPath:(id)a5;
- (void)didTapHeaderView:(id)a3;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)handleAddFromAction;
- (void)handleAddToAlbum:(id)a3 pickedAssets:(id)a4;
- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)photosDataSource:(id)a3 didReceivePhotoLibraryChange:(id)a4;
- (void)setAlbum:(id)a3;
- (void)setAlbum:(id)a3 existingFetchResult:(id)a4;
- (void)setAssetCollection:(id)a3;
- (void)setAssetCollection:(id)a3 fetchResultContainingAssetCollection:(id)a4 filterPredicate:(id)a5;
- (void)setAssetCollection:(id)a3 fetchResultContainingAssetCollection:(id)a4 filterPredicate:(id)a5 existingFetchResults:(id)a6;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setSessionInfo:(id)a3;
- (void)updateLayoutMetrics;
- (void)updateTitle;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PUPhotosAlbumViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__albumSpec, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

- (PUPhotosAlbumViewControllerSpec)_albumSpec
{
  return self->__albumSpec;
}

- (void)_setHasAccurateCounts:(BOOL)a3
{
  self->__hasAccurateCounts = a3;
}

- (BOOL)_hasAccurateCounts
{
  return self->__hasAccurateCounts;
}

- (void)_setCountingAssetTypes:(BOOL)a3
{
  self->__isCountingAssetTypes = a3;
}

- (BOOL)_isCountingAssetTypes
{
  return self->__isCountingAssetTypes;
}

- (PLAlbumProtocol)album
{
  return self->_album;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (id)px_navigationDestination
{
  v2 = [(PUPhotosAlbumViewController *)self assetCollection];
  if (v2) {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F905E8]) initWithObject:v2 revealMode:0];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v11 = a3;
  v7 = (void (**)(id, uint64_t, void))a5;
  v8 = [v11 asset];
  v9 = [v11 assetCollection];
  if ([v11 type] != 7)
  {
    [(PUPhotosAlbumViewController *)self setEditing:0];
    [(PUPhotosGridViewController *)self navigateToRevealPhoto:v8 inAssetContainer:v9 animated:0];
    goto LABEL_5;
  }
  uint64_t v10 = [v11 revealMode];
  [(PUPhotosAlbumViewController *)self setEditing:0];
  [(PUPhotosGridViewController *)self navigateToRevealPhoto:v8 inAssetContainer:v9 animated:0];
  if (v10 != 2) {
LABEL_5:
  }
    [(PUPhotosGridViewController *)self navigateToPhoto:v8 inAssetContainer:v9 animated:0];
  v7[2](v7, 1, 0);
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 7)
  {
    v5 = [(PUPhotosGridViewController *)self photosDataSource];
    v6 = [v4 assetUUID];
    v7 = [(PUPhotosGridViewController *)self photosDataSource];
    v8 = [v7 indexPathForLastAsset];
    v9 = [v5 indexPathForAssetWithUUID:v6 orBurstIdentifier:0 hintIndexPath:v8 hintCollection:0];
    unint64_t v10 = v9 != 0;
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "dropInteraction: %@ performDrop: %@", (uint8_t *)&v9, 0x16u);
  }

  [(PUPhotosAlbumViewController *)self _performAddDropWithSession:v7];
}

- (void)_collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "_collectionView: %@ performDropWithCoordinator: %@", (uint8_t *)&v12, 0x16u);
  }

  int v9 = [v7 proposal];
  uint64_t v10 = [v9 operation];

  if (v10 == 3)
  {
    [(PUPhotosAlbumViewController *)self _performMoveDropWithCoordinator:v7];
  }
  else
  {
    __int16 v11 = [v7 session];
    [(PUPhotosAlbumViewController *)self _performAddDropWithSession:v11];
  }
}

- (id)_collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v28 = 138412802;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    __int16 v32 = 2112;
    id v33 = v10;
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEBUG, "_collectionView: %@ dropSessionDidUpdate:%@ withDestinationIndexPath: %@", (uint8_t *)&v28, 0x20u);
  }

  int v12 = [(PUPhotosAlbumViewController *)self collectionView];
  [v9 locationInView:v12];
  double v14 = v13;
  double v16 = v15;

  v17 = -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:", 0, v14, v16);
  v18 = [(PUPhotosAlbumViewController *)self assetCollection];
  int v19 = [v18 canPerformEditOperation:5];

  if (v19
    && [v8 hasActiveDrag]
    && ([v9 items],
        v20 = objc_claimAutoreleasedReturnValue(),
        uint64_t v21 = [v20 count],
        v20,
        v21 == 1)
    && v17)
  {
    id v22 = objc_alloc(MEMORY[0x1E4FB15B8]);
    uint64_t v23 = 3;
    uint64_t v24 = 0;
  }
  else
  {
    int v25 = [v8 hasActiveDrag];
    id v22 = objc_alloc(MEMORY[0x1E4FB15B8]);
    if (v25) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = 2;
    }
    uint64_t v24 = 2;
  }
  v26 = (void *)[v22 initWithDropOperation:v23 dropLocation:v24];

  return v26;
}

- (void)_performMoveDropWithCoordinator:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v84 = v5;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEBUG, "_performMoveDropWithCoordinator: %@", buf, 0xCu);
  }

  id v7 = [v5 session];
  id v8 = [(PUPhotosAlbumViewController *)self collectionView];
  [v7 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  v60 = -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:", 0, v10, v12);
  double v13 = [v5 items];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __63__PUPhotosAlbumViewController__performMoveDropWithCoordinator___block_invoke;
  v80[3] = &unk_1E5F2A158;
  v80[4] = self;
  v80[5] = a2;
  uint64_t v14 = objc_msgSend(v13, "_pl_map:", v80);

  double v15 = [(PUPhotosAlbumViewController *)self assetCollection];
  double v16 = [(PUPhotosAlbumViewController *)self assetCollectionAssets];
  v17 = (void *)MEMORY[0x1E4F1CA80];
  v53 = v16;
  v18 = [v16 fetchedObjects];
  int v19 = [v17 setWithArray:v18];

  v57 = (void *)v14;
  v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
  [v19 intersectSet:v20];

  uint64_t v21 = objc_opt_new();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  obuint64_t j = v19;
  uint64_t v22 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v77 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v76 + 1) + 8 * i);
        v27 = [(PUPhotosGridViewController *)self photosDataSource];
        int v28 = [v27 indexPathForAsset:v26 inCollection:v15];

        [v21 addObject:v28];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
    }
    while (v23);
  }
  v56 = v21;
  v51 = self;

  uint64_t v29 = [v60 item];
  v52 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v29, objc_msgSend(v57, "count"));
  v55 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v52, objc_msgSend(v60, "section"));
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  __int16 v30 = [v5 items];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v72 objects:v81 count:16];
  v59 = v5;
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v73;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v73 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v72 + 1) + 8 * j);
        v36 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v29 + j, objc_msgSend(v60, "section", v51));
        v37 = [v35 dragItem];
        id v38 = (id)[v5 dropItem:v37 toItemAtIndexPath:v36];
      }
      v29 += j;
      uint64_t v32 = [v30 countByEnumeratingWithState:&v72 objects:v81 count:16];
    }
    while (v32);
  }

  v39 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __63__PUPhotosAlbumViewController__performMoveDropWithCoordinator___block_invoke_2;
  v66[3] = &unk_1E5F2C960;
  id v40 = v15;
  id v67 = v40;
  id v54 = v53;
  id v68 = v54;
  id v41 = obj;
  id v69 = v41;
  id v42 = v57;
  id v70 = v42;
  id v43 = v52;
  id v71 = v43;
  id v65 = 0;
  char v44 = [v39 performChangesAndWait:v66 error:&v65];
  id v45 = v65;

  if (v44)
  {
    v46 = [(PUPhotosGridViewController *)v51 photosDataSource];
    [v46 refetchResultsForAssetCollection:v40];

    v47 = [(PUPhotosAlbumViewController *)v51 collectionView];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __63__PUPhotosAlbumViewController__performMoveDropWithCoordinator___block_invoke_286;
    v61[3] = &unk_1E5F2E908;
    id v62 = v47;
    v48 = v56;
    id v63 = v56;
    v49 = v55;
    id v64 = v55;
    v50 = v47;
    [v50 performBatchUpdates:v61 completion:0];
  }
  else
  {
    v50 = PLDragAndDropGetLog();
    v49 = v55;
    v48 = v56;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v84 = v45;
      _os_log_impl(&dword_1AE9F8000, v50, OS_LOG_TYPE_ERROR, "Failed to perform changes during album reorder drop: %@", buf, 0xCu);
    }
  }
}

id __63__PUPhotosAlbumViewController__performMoveDropWithCoordinator___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 dragItem];
  id v4 = [v3 localObject];

  id v5 = [v4 assetReference];
  id v6 = [v5 asset];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    double v15 = (objc_class *)objc_opt_class();
    double v12 = NSStringFromClass(v15);
    double v16 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:v13, v14, @"PUPhotosAlbumViewController.m", 757, @"%@ should be an instance inheriting from %@, but it is %@", @"draggingItemLocalObject.assetReference.asset", v12, v16 object file lineNumber description];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    double v11 = (objc_class *)objc_opt_class();
    double v12 = NSStringFromClass(v11);
    [v8 handleFailureInMethod:v9, v10, @"PUPhotosAlbumViewController.m", 757, @"%@ should be an instance inheriting from %@, but it is nil", @"draggingItemLocalObject.assetReference.asset", v12 object file lineNumber description];
  }

LABEL_3:
  return v6;
}

void __63__PUPhotosAlbumViewController__performMoveDropWithCoordinator___block_invoke_2(void *a1)
{
  id v2 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:a1[4] assets:a1[5]];
  [v2 removeAssets:a1[6]];
  [v2 insertAssets:a1[7] atIndexes:a1[8]];
}

uint64_t __63__PUPhotosAlbumViewController__performMoveDropWithCoordinator___block_invoke_286(uint64_t a1)
{
  [*(id *)(a1 + 32) deleteItemsAtIndexPaths:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 insertItemsAtIndexPaths:v3];
}

- (void)_performAddDropWithSession:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "_performAddDropWithCoordinator: %@", buf, 0xCu);
  }

  id v6 = [(PUPhotosAlbumViewController *)self assetCollection];
  objc_initWeak((id *)buf, self);
  id v7 = [MEMORY[0x1E4F902C8] defaultManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke;
  v10[3] = &unk_1E5F2A130;
  objc_copyWeak(&v14, (id *)buf);
  id v8 = v6;
  id v11 = v8;
  id v9 = v4;
  id v12 = v9;
  uint64_t v13 = self;
  [v7 fetchAssetsFromDrop:v9 importIfNeeded:1 completion:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([v3 count] >= 1)
  {
    id v4 = [v3 firstObject];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke_2;
    aBlock[3] = &unk_1E5F2AAE0;
    objc_copyWeak(&v26, a1 + 7);
    id v5 = v4;
    id v25 = v5;
    id v6 = _Block_copy(aBlock);
    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    int v8 = [WeakRetained isCameraRoll];

    if (v8)
    {
      id v9 = objc_loadWeakRetained(a1 + 7);
      [v9 setPendingProcessDataSourceUpdateBlock:v6];
    }
    else
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke_3;
      v21[3] = &unk_1E5F2ECC8;
      id v22 = v3;
      id v23 = a1[4];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke_4;
      v18 = &unk_1E5F2A108;
      objc_copyWeak(&v20, a1 + 7);
      id v19 = v6;
      [v10 performChanges:v21 completionHandler:&v15];

      objc_destroyWeak(&v20);
      id v9 = v22;
    }

    objc_destroyWeak(&v26);
  }
  uint64_t v11 = objc_msgSend(v3, "count", v15, v16, v17, v18);
  id v12 = [a1[5] items];
  uint64_t v13 = [v12 count];

  if (v11 != v13)
  {
    id v14 = [MEMORY[0x1E4F90118] dropImportErrorAlertControllerWithHandler:0];
    [a1[6] presentViewController:v14 animated:1 completion:0];
  }
}

BOOL __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained photosDataSource];
  id v5 = [v4 indexPathForAsset:*(void *)(a1 + 32) hintIndexPath:0 hintCollection:0];

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    id v7 = [v6 collectionView];
    [v7 scrollToItemAtIndexPath:v5 atScrollPosition:2 animated:1];
  }
  return v5 != 0;
}

void __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke_3(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F38EB8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = objc_msgSend(v2, "px_orderedAssetsFromAssets:sortDescriptors:", v3, v5);

  id v7 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:*(void *)(a1 + 40)];
  [v7 addAssets:v6];
}

void __58__PUPhotosAlbumViewController__performAddDropWithSession___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setPendingProcessDataSourceUpdateBlock:v2];
  }
}

- (BOOL)canHandleDropSession:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PUPhotosAlbumViewController *)self isCameraRoll])
  {
    id v5 = [v4 localDragSession];

    if (v5)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v6 = objc_msgSend(v4, "items", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) localObject];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 needsImport])
            {

              LOBYTE(v7) = 1;
              goto LABEL_17;
            }
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
      goto LABEL_17;
    }
  }
  if ([(PUPhotosAlbumViewController *)self canDragIn])
  {
    id v6 = [MEMORY[0x1E4F902C8] supportedTypeIdentifiers];
    LOBYTE(v7) = [v4 hasItemsConformingToTypeIdentifiers:v6];
LABEL_17:

    goto LABEL_18;
  }
  LOBYTE(v7) = 0;
LABEL_18:

  return v7;
}

- (BOOL)canDragIn
{
  v5.receiver = self;
  v5.super_class = (Class)PUPhotosAlbumViewController;
  unsigned __int8 v3 = [(PUPhotosGridViewController *)&v5 canDragIn];
  return [(PUPhotosAlbumViewController *)self isCameraRoll] | v3;
}

- (BOOL)canDragOut
{
  unsigned __int8 v3 = [MEMORY[0x1E4F90110] sharedInstance];
  char v4 = [v3 alwaysAllowDragsWithinUserAlbums];

  objc_super v5 = [(PUPhotosGridViewController *)self sessionInfo];
  char v6 = [v5 isSelectingAssets];

  uint64_t v7 = [(PUPhotosAlbumViewController *)self assetCollection];
  char v8 = [v7 canPerformEditOperation:5];

  id v9 = [MEMORY[0x1E4F90110] sharedInstance];
  char v10 = [v9 dragOutEnabled] | v4 & v8;

  return v10 & ~[(PUPhotosAlbumViewController *)self isTrashBinViewController] & (v6 ^ 1);
}

- (void)photosDataSource:(id)a3 didReceivePhotoLibraryChange:(id)a4
{
  id v5 = a4;
  char v6 = [(PUPhotosAlbumViewController *)self assetCollection];
  uint64_t v7 = [v5 changeDetailsForObject:v6];

  id v9 = [v7 objectAfterChanges];

  char v8 = v9;
  if (v9)
  {
    [(PUPhotosAlbumViewController *)self setAssetCollection:v9];
    char v8 = v9;
  }
}

- (void)didTapHeaderView:(id)a3
{
  uint64_t v4 = [a3 sectionIndex];
  id v5 = [(PUPhotosGridViewController *)self collectionListFetchResult];
  id v6 = [v5 objectAtIndex:v4];

  [(PUPhotosGridViewController *)self navigateToPhotosDetailsForAssetCollection:v6];
}

- (double)sectionedGridLayout:(id)a3 accessibilitySectionHeaderHeightForVisualSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  if (IsAccessibilityCategory)
  {
    id v9 = [(PUPhotosAlbumViewController *)self _albumSpec];
    char v10 = [v9 gridSpec];
    [v10 sectionHeaderInsets];
    double v12 = v11;
    double v14 = v13;

    uint64_t v15 = [v9 fullMomentsSectionHeaderStyle];
    char v30 = 0;
    id v28 = 0;
    id v29 = 0;
    id v26 = 0;
    id v27 = 0;
    [(PUPhotosAlbumViewController *)self _getDataForVisualSection:a4 hasActionButton:&v30 locations:&v29 title:&v28 startDate:&v27 endDate:&v26];
    id v16 = v29;
    id v17 = v28;
    id v18 = v27;
    id v19 = v26;
    id v20 = [MEMORY[0x1E4F90580] sharedMetrics];
    uint64_t v21 = [v6 collectionView];
    [v21 bounds];
    objc_msgSend(v20, "accessibilitySectionHeaderHeightForStyle:width:actionButton:disclosure:title:startDate:endDate:locations:actionButtonSpec:", v15, CGRectGetWidth(v31) - v12 - v14, v16, 0);
    double v23 = v22;
  }
  else
  {
    [(PUPhotosAlbumViewController *)self sectionedGridLayout:v6 sectionHeaderHeightForVisualSection:a4];
    double v23 = v24;
  }

  return v23;
}

- (double)sectionedGridLayout:(id)a3 sectionHeaderHeightForVisualSection:(int64_t)a4
{
  id v6 = [(PUPhotosAlbumViewController *)self _albumSpec];
  uint64_t v7 = [v6 fullMomentsSectionHeaderStyle];
  char v24 = 0;
  id v22 = 0;
  id v23 = 0;
  id v20 = 0;
  id v21 = 0;
  [(PUPhotosAlbumViewController *)self _getDataForVisualSection:a4 hasActionButton:&v24 locations:&v23 title:&v22 startDate:&v21 endDate:&v20];
  id v8 = v23;
  id v9 = v22;
  id v10 = v21;
  id v11 = v20;
  double v12 = v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  uint64_t v14 = !v13;
  BOOL v15 = [v8 count] != 0;
  id v16 = [MEMORY[0x1E4F90580] sharedMetrics];
  [v16 sectionHeaderHeightForStyle:v7 hasTitle:v9 != 0 hasDates:v14 hasLocation:v15];
  double v18 = v17;

  return v18;
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotosAlbumViewController;
  return [(PUPhotosGridViewController *)&v4 prepareForDismissingForced:a3];
}

- (void)handleAddFromAction
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUPhotosAlbumViewController.m" lineNumber:580 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (void)handleAddToAlbum:(id)a3 pickedAssets:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([v7 canPerformEditOperation:3] & 1) == 0)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUPhotosAlbumViewController.m", 563, @"Attempting to edit a non-editable album: %@", v7 object file lineNumber description];
  }
  if ([v8 count])
  {
    id v9 = [(PUPhotosGridViewController *)self assetsInAssetCollection:v7];
    id v10 = [v9 photoLibrary];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__PUPhotosAlbumViewController_handleAddToAlbum_pickedAssets___block_invoke;
    v13[3] = &unk_1E5F2E908;
    id v14 = v8;
    id v15 = v7;
    id v16 = v9;
    id v11 = v9;
    [v10 performChanges:v13 completionHandler:0];
  }
}

void __61__PUPhotosAlbumViewController_handleAddToAlbum_pickedAssets___block_invoke(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F38EB8];
  uint64_t v3 = a1[4];
  objc_super v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = objc_msgSend(v2, "px_orderedAssetsFromAssets:sortDescriptors:", v3, v5);

  id v7 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:a1[5] assets:a1[6]];
  [v7 addAssets:v6];
}

- (void)_countAssetTypesIfNeeded
{
  if (![(PUPhotosAlbumViewController *)self _isCountingAssetTypes]
    && ![(PUPhotosAlbumViewController *)self _hasAccurateCounts])
  {
    uint64_t v3 = [(PUPhotosGridViewController *)self photosDataSource];
    if ([v3 estimatedPhotosCount] || objc_msgSend(v3, "estimatedVideosCount"))
    {
      [(PUPhotosAlbumViewController *)self _setHasAccurateCounts:1];
      if ([(PUPhotosGridViewController *)self isContentViewInSyncWithModel]) {
        [(PUPhotosGridViewController *)self updateGlobalFooter];
      }
    }
    else
    {
      [(PUPhotosAlbumViewController *)self _setCountingAssetTypes:1];
      objc_super v4 = [MEMORY[0x1E4F1CA48] array];
      if ([v3 numberOfSections] >= 1)
      {
        uint64_t v5 = 0;
        do
        {
          id v6 = [v3 assetsInSection:v5];
          [v4 addObject:v6];

          ++v5;
        }
        while (v5 < [v3 numberOfSections]);
      }
      objc_initWeak(&location, self);
      id v7 = dispatch_get_global_queue(17, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__PUPhotosAlbumViewController__countAssetTypesIfNeeded__block_invoke;
      block[3] = &unk_1E5F2E4E8;
      id v10 = v4;
      id v8 = v4;
      objc_copyWeak(&v11, &location);
      dispatch_async(v7, block);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __55__PUPhotosAlbumViewController__countAssetTypesIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v7 countOfAssetsWithMediaType:1];
        [v7 countOfAssetsWithMediaType:2];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PUPhotosAlbumViewController__countAssetTypesIfNeeded__block_invoke_2;
  block[3] = &unk_1E5F2E530;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v9);
}

void __55__PUPhotosAlbumViewController__countAssetTypesIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setCountingAssetTypes:0];
  [WeakRetained _setHasAccurateCounts:1];
  if ([WeakRetained isContentViewInSyncWithModel]) {
    [WeakRetained updateGlobalFooter];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotosAlbumViewController;
  [(PUPhotosGridViewController *)&v4 viewDidAppear:a3];
  [(PUPhotosAlbumViewController *)self _countAssetTypesIfNeeded];
}

- (int64_t)oneUpPresentationOrigin
{
  uint64_t v3 = [(PUPhotosAlbumViewController *)self assetCollection];
  int64_t v4 = PXOneUpPresentationOriginForAssetCollection();

  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)PUPhotosAlbumViewController;
    return [(PUPhotosGridViewController *)&v6 oneUpPresentationOrigin];
  }
  return v4;
}

- (unint64_t)additionalOneUpViewControllerOptions
{
  v7.receiver = self;
  v7.super_class = (Class)PUPhotosAlbumViewController;
  unint64_t v3 = [(PUPhotosGridViewController *)&v7 additionalOneUpViewControllerOptions];
  int64_t v4 = [(PUPhotosAlbumViewController *)self assetCollection];
  uint64_t v5 = [v4 assetCollectionSubtype];

  if (v5 == 1000000201 || v5 == 205) {
    v3 |= 0x2000uLL;
  }
  return v3;
}

- (int64_t)cellFillMode
{
  v7.receiver = self;
  v7.super_class = (Class)PUPhotosAlbumViewController;
  id v3 = [(PUPhotosGridViewController *)&v7 cellFillMode];
  int64_t v4 = [(PUPhotosAlbumViewController *)self _albumSpec];
  uint64_t v5 = v4;
  if (v4) {
    id v3 = (id)[v4 cellFillMode];
  }

  return (int64_t)v3;
}

- (BOOL)allowSelectAllButton
{
  if ([(PUPhotosAlbumViewController *)self isCameraRoll]) {
    return 0;
  }
  else {
    return ![(PUPhotosAlbumViewController *)self isTrashBinViewController];
  }
}

- (BOOL)isCameraRoll
{
  id v2 = [(PUPhotosAlbumViewController *)self assetCollection];
  uint64_t v3 = [v2 assetCollectionSubtype];

  return v3 == 209;
}

- (BOOL)isTrashBinViewController
{
  id v2 = [(PUPhotosAlbumViewController *)self assetCollection];
  BOOL v3 = [v2 assetCollectionSubtype] == 1000000201;

  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PUPhotosAlbumViewController;
  [(PUPhotosGridViewController *)&v5 setEditing:a3 animated:a4];
  [(PUPhotosAlbumViewController *)self updateTitle];
}

- (void)updateTitle
{
  if ([(PUPhotosAlbumViewController *)self isEditing])
  {
    id v5 = [(PUPhotosAlbumViewController *)self navigationItem];
    [v5 setTitleView:0];
  }
  else
  {
    id v5 = [(PUPhotosAlbumViewController *)self assetCollection];
    BOOL v3 = [v5 localizedTitle];
    [(PUPhotosAlbumViewController *)self setTitle:v3];
    int64_t v4 = [(PUPhotosAlbumViewController *)self navigationItem];
    [v4 setTitleView:0];
  }
}

- (void)configureGlobalFooterView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewModel];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F90230]);
    [v4 setViewModel:v6];
  }
  if ([(PUPhotosAlbumViewController *)self wantsGlobalFooter])
  {
    objc_super v7 = [(PUPhotosGridViewController *)self photosDataSource];
    uint64_t v8 = [v7 estimatedPhotosCount];
    uint64_t v9 = [v7 estimatedVideosCount];
    uint64_t v10 = [v7 estimatedOtherCount];
    uint64_t v11 = v10;
    if (!v8 && !v9 && !v10)
    {
      if ([(PUPhotosAlbumViewController *)self _hasAccurateCounts]
        && [v7 numberOfSections] >= 1)
      {
        uint64_t v8 = 0;
        uint64_t v9 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        do
        {
          long long v13 = [v7 assetsInSection:v12];
          uint64_t v14 = [v13 countOfAssetsWithMediaType:1];
          uint64_t v15 = [v13 countOfAssetsWithMediaType:2];
          v8 += v14;
          v9 += v15;
          uint64_t v11 = v11 - (v14 + v15) + [v13 count];

          ++v12;
        }
        while (v12 < [v7 numberOfSections]);
      }
      else
      {
        uint64_t v11 = 0;
        uint64_t v9 = 0;
        uint64_t v8 = 0;
      }
    }
    double v18 = [(PUPhotosAlbumViewController *)self assetCollection];
    if ([v18 pendingItemsCount])
    {
      [v18 pendingItemsType];
      double v17 = PLProgressDescription();
      id v16 = 0;
    }
    else if (v8 || v9 || v11)
    {
      double v17 = PLLocalizedCountDescription();
      id v16 = [(PUPhotosAlbumViewController *)self globalFooterSubtitle];
    }
    else
    {
      id v16 = 0;
      double v17 = 0;
    }
  }
  else
  {
    id v16 = 0;
    double v17 = 0;
  }
  id v19 = [v4 viewModel];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __57__PUPhotosAlbumViewController_configureGlobalFooterView___block_invoke;
  v22[3] = &unk_1E5F2A0E0;
  id v23 = v17;
  id v24 = v16;
  id v20 = v16;
  id v21 = v17;
  [v19 performChanges:v22];
}

void __57__PUPhotosAlbumViewController_configureGlobalFooterView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTitle:v3];
  [v4 setSubtitle1:*(void *)(a1 + 40)];
}

- (NSString)globalFooterSubtitle
{
  return 0;
}

- (void)configureGlobalHeaderView:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotosAlbumViewController *)self _globalHeaderTitle];
  [v4 setTitle:v5];
}

- (double)globalHeaderHeight
{
  double v3 = 0.0;
  if ([(PUPhotosAlbumViewController *)self isTrashBinViewController])
  {
    id v4 = [(PUPhotosAlbumViewController *)self _globalHeaderTitle];
    id v5 = [(PUPhotosAlbumViewController *)self _existingView];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;

    objc_msgSend(MEMORY[0x1E4F90570], "sizeThatFits:forTitle:", v4, v7, v9);
    double v3 = v10;
  }
  return v3;
}

- (id)_globalHeaderTitle
{
  if ([(PUPhotosAlbumViewController *)self isTrashBinViewController])
  {
    double v3 = [(PHAssetCollection *)self->_assetCollection photoLibrary];
    if ([v3 isCloudPhotoLibraryEnabled]) {
      PXLocalizedStringWithCount();
    }
    else {
    id v4 = PXLocalizedString();
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)configureSupplementaryView:(id)a3 ofKind:(id)a4 forIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"PUFullMomentsHeader"])
  {
    id v11 = v8;
    uint64_t v12 = [v10 section];

    unsigned __int8 v31 = 0;
    id v29 = 0;
    id v30 = 0;
    id v27 = 0;
    id v28 = 0;
    [(PUPhotosAlbumViewController *)self _getDataForVisualSection:v12 hasActionButton:&v31 locations:&v30 title:&v29 startDate:&v28 endDate:&v27];
    id v13 = v30;
    id v14 = v29;
    id v15 = v28;
    id v16 = v27;
    double v17 = [(PUPhotosAlbumViewController *)self _albumSpec];
    objc_msgSend(v11, "setStyle:", objc_msgSend(v17, "fullMomentsSectionHeaderStyle"));
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __78__PUPhotosAlbumViewController_configureSupplementaryView_ofKind_forIndexPath___block_invoke;
    v22[3] = &unk_1E5F2D098;
    id v23 = v11;
    id v24 = v14;
    id v25 = v15;
    id v26 = v16;
    id v18 = v16;
    id v19 = v15;
    id v21 = v14;
    id v10 = v11;
    [v10 performBatchUpdateOfDateDependentPropertiesWithBlock:v22];
    [v10 setSectionIndex:v12];
    id v20 = [(PUPhotosGridViewController *)self gridSpec];
    [v20 sectionHeaderInsets];
    objc_msgSend(v10, "setContentInsets:");

    [v17 fullMomentsLevelSectionHeaderHighlightInset];
    objc_msgSend(v10, "setHighlightInsets:");
    [v10 setDelegate:self];
    [v10 setShowsActionButton:v31];
    [v10 setAllowsPhotosDetailsInteraction:1];
    [v10 setSectionLocations:v13];
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)PUPhotosAlbumViewController;
    [(PUPhotosGridViewController *)&v32 configureSupplementaryView:v8 ofKind:v9 forIndexPath:v10];
  }
}

uint64_t __78__PUPhotosAlbumViewController_configureSupplementaryView_ofKind_forIndexPath___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSectionTitle:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  return [v2 setSectionStartDate:v3 endDate:v4];
}

- (void)_getDataForVisualSection:(int64_t)a3 hasActionButton:(BOOL *)a4 locations:(id *)a5 title:(id *)a6 startDate:(id *)a7 endDate:(id *)a8
{
  id v25 = [(PUPhotosGridViewController *)self assetCollectionForSectionHeaderAtIndex:a3];
  *a6 = [v25 localizedTitle];
  *a5 = [v25 localizedLocationNames];
  *a4 = 0;
  id v14 = [v25 startDate];
  uint64_t v15 = [v25 endDate];
  id v16 = (void *)v15;
  if (!v14 || !v15)
  {
    double v17 = [(PUPhotosGridViewController *)self assetsInAssetCollection:v25];
    id v18 = [v17 lastObject];

    uint64_t v19 = [v18 creationDate];

    if (v18)
    {
      id v20 = [(PUPhotosGridViewController *)self assetsInAssetCollection:v25];
      id v21 = [v20 firstObject];

      uint64_t v22 = [v21 creationDate];

      id v14 = (void *)v22;
    }

    id v16 = (void *)v19;
  }
  id v23 = v14;
  *a7 = v23;
  id v24 = v16;
  *a8 = v24;
}

- (void)_setAlbumSpec:(id)a3
{
  id v5 = (PUPhotosAlbumViewControllerSpec *)a3;
  if (self->__albumSpec != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->__albumSpec, a3);
    [(PUPhotosAlbumViewController *)self updateLayoutMetrics];
    id v5 = v6;
  }
}

- (BOOL)updateSpec
{
  v9.receiver = self;
  v9.super_class = (Class)PUPhotosAlbumViewController;
  BOOL v3 = [(PUPhotosGridViewController *)&v9 updateSpec];
  uint64_t v4 = [(PUPhotosAlbumViewController *)self traitCollection];
  if ([v4 horizontalSizeClass] && objc_msgSend(v4, "verticalSizeClass"))
  {
    +[PUInterfaceManager shouldUsePhoneLayoutWithTraitCollection:v4];
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = objc_opt_class();
    if (v6 == objc_opt_class() || v6 == objc_opt_class()) {
      id v5 = (objc_class *)objc_opt_class();
    }
    if (v5 != (objc_class *)v6)
    {
      id v7 = objc_alloc_init(v5);
      [(PUPhotosAlbumViewController *)self _setAlbumSpec:v7];

      BOOL v3 = 1;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)updateLayoutMetrics
{
  v5.receiver = self;
  v5.super_class = (Class)PUPhotosAlbumViewController;
  [(PUPhotosGridViewController *)&v5 updateLayoutMetrics];
  BOOL v3 = [(PUPhotosAlbumViewController *)self _albumSpec];
  uint64_t v4 = [(PUPhotosAlbumViewController *)self collectionViewLayout];
  [v3 configureCollectionViewGridLayout:v4];
}

- (void)_updateSectionHeadersIfNeeded
{
  if (self->_needsUpdateFlags.sectionHeadersEnabled)
  {
    self->_needsUpdateFlags.sectionHeadersEnabled = 0;
    id v3 = [(PUPhotosGridViewController *)self gridLayout];
    objc_msgSend(v3, "setSectionHeadersEnabled:", -[PUPhotosAlbumViewController shouldShowSectionHeaders](self, "shouldShowSectionHeaders"));
  }
}

- (void)_invalideSectionHeaders
{
  self->_needsUpdateFlags.sectionHeadersEnabled = 1;
  [(PUPhotosAlbumViewController *)self _setNeedsUpdate];
}

- (id)newGridLayout
{
  v8.receiver = self;
  v8.super_class = (Class)PUPhotosAlbumViewController;
  id v4 = [(PUPhotosGridViewController *)&v8 newGridLayout];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUPhotosAlbumViewController.m", 243, @"Invalid parameter not satisfying: %@", @"[gridLayout isKindOfClass:[PUSectionedGridLayout class]]" object file lineNumber description];
  }
  [v4 setSectionHeaderElementKind:@"PUFullMomentsHeader"];
  objc_super v5 = [(PUPhotosAlbumViewController *)self _albumSpec];
  [v5 configureCollectionViewGridLayout:v4];

  return v4;
}

- (BOOL)canBeginStackCollapseTransition
{
  id v2 = [(PUPhotosGridViewController *)self gridSpec];
  char v3 = [v2 usesStackPopTransition];

  return v3;
}

- (BOOL)wantsGlobalFooter
{
  char v3 = [(PUPhotosAlbumViewController *)self assetCollection];
  int v4 = [v3 pendingItemsCount];
  BOOL v5 = [(PUPhotosAlbumViewController *)self _hasAccurateCounts];
  BOOL v6 = v4 <= 0;
  BOOL v7 = v4 > 0;
  if (v6 && v5) {
    BOOL v7 = [(PUPhotosGridViewController *)self hasScrollableContent];
  }

  return v7;
}

- (BOOL)shouldShowSectionHeaders
{
  char v3 = [(PUPhotosAlbumViewController *)self assetCollection];
  uint64_t v4 = [v3 assetCollectionType];

  if (v4 == 2) {
    return 0;
  }
  BOOL v6 = [(PUPhotosAlbumViewController *)self assetCollection];
  unint64_t v7 = [v6 assetCollectionSubtype];

  BOOL v5 = 0;
  if ((v7 > 6 || ((1 << v7) & 0x58) == 0) && v7 != 101)
  {
    objc_super v8 = [(PUPhotosGridViewController *)self sessionInfo];
    if (v8)
    {
      objc_super v9 = [(PUPhotosGridViewController *)self sessionInfo];
      id v10 = [v9 targetAlbum];
      if (v10)
      {
        BOOL v5 = 0;
      }
      else
      {
        id v11 = [(PUPhotosGridViewController *)self sessionInfo];
        uint64_t v12 = [v11 targetAlbumName];
        BOOL v5 = v12 == 0;
      }
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  return v5;
}

- (id)sessionInfoForTransferredAssets:(id)a3
{
  id v4 = a3;
  BOOL v5 = [PUAlbumPickerSessionInfo alloc];
  BOOL v6 = [(PUPhotosAlbumViewController *)self assetCollection];
  unint64_t v7 = [(PUAlbumPickerSessionInfo *)v5 initWithSourceAlbum:v6 transferredAssets:v4];

  return v7;
}

- (id)localizedTitleForAssets:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PUPhotosAlbumViewController *)self assetCollection];
  BOOL v6 = [v5 localizedTitle];

  if (!v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)PUPhotosAlbumViewController;
    BOOL v6 = [(PUPhotosGridViewController *)&v8 localizedTitleForAssets:v4];
  }

  return v6;
}

- (PHFetchResult)assetCollectionAssets
{
  char v3 = [(PUPhotosAlbumViewController *)self assetCollection];
  id v4 = [(PUPhotosGridViewController *)self assetsInAssetCollection:v3];

  return (PHFetchResult *)v4;
}

- (void)setAssetCollection:(id)a3 fetchResultContainingAssetCollection:(id)a4 filterPredicate:(id)a5
{
}

- (void)setAssetCollection:(id)a3 fetchResultContainingAssetCollection:(id)a4 filterPredicate:(id)a5 existingFetchResults:(id)a6
{
  id v20 = (PHAssetCollection *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_assetCollection != v20
    || ([(PUPhotosGridViewController *)self photosDataSource],
        id v14 = objc_claimAutoreleasedReturnValue(),
        [v14 filterPredicate],
        id v15 = (id)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v15 != v12))
  {
    objc_storeStrong((id *)&self->_assetCollection, a3);
    id v16 = [(PUPhotosGridViewController *)self photosDataSource];

    if (v16)
    {
      double v17 = [(PUPhotosGridViewController *)self photosDataSource];
      [v17 setCollectionListFetchResult:v11];

      id v18 = [(PUPhotosGridViewController *)self photosDataSource];
      [v18 setFilterPredicate:v12];
    }
    else
    {
      id v18 = (void *)[objc_alloc(MEMORY[0x1E4F90508]) initWithCollectionListFetchResult:v11 options:2];
      [v18 setExistingAssetCollectionFetchResults:v13];
      [v18 setFilterPredicate:v12];
      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F90500]) initWithPhotosDataSourceConfiguration:v18];
      [(PUPhotosGridViewController *)self setPhotosDataSource:v19];
    }
    if ([(PUPhotosAlbumViewController *)self isTrashBinViewController]) {
      [(PUPhotosGridViewController *)self setAllowedActions:1];
    }
    [(PUPhotosAlbumViewController *)self updateTitle];
    if ([(PHAssetCollection *)self->_assetCollection keyAssetsAtEnd]) {
      [(PUPhotosGridViewController *)self setInitiallyScrolledToBottom:1];
    }
    [(PUPhotosAlbumViewController *)self _invalideSectionHeaders];
    [(PUPhotosAlbumViewController *)self _updateSectionHeadersIfNeeded];
  }
}

- (void)setAssetCollection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (PHAssetCollection *)a3;
  if (self->_assetCollection != v5)
  {
    objc_storeStrong((id *)&self->_assetCollection, a3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v6 = [(PUPhotosAlbumViewController *)self collectionView];
    unint64_t v7 = [v6 indexPathsForVisibleSupplementaryElementsOfKind:@"PUFullMomentsHeader"];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v13 = [(PUPhotosAlbumViewController *)self collectionView];
          id v14 = [v13 supplementaryViewForElementKind:@"PUFullMomentsHeader" atIndexPath:v12];

          [(PUPhotosAlbumViewController *)self configureSupplementaryView:v14 ofKind:@"PUFullMomentsHeader" forIndexPath:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [(PUPhotosAlbumViewController *)self updateTitle];
  }
}

- (void)setAlbum:(id)a3 existingFetchResult:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1E4F390B0];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v11 = objc_msgSend(v9, "pl_fetchResultContainingAssetContainer:photoLibrary:", v7, v10);

  uint64_t v12 = [(PUPhotosAlbumViewController *)self filterPredicateForAlbum:v7];
  id v13 = [v11 firstObject];
  objc_storeStrong((id *)&self->_album, a3);
  id v14 = 0;
  if (v8 && v13)
  {
    long long v15 = v13;
    v16[0] = v8;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  }
  [(PUPhotosAlbumViewController *)self setAssetCollection:v13 fetchResultContainingAssetCollection:v11 filterPredicate:v12 existingFetchResults:v14];
}

- (void)setAlbum:(id)a3
{
}

- (void)setSessionInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotosAlbumViewController;
  [(PUPhotosGridViewController *)&v4 setSessionInfo:a3];
  [(PUPhotosAlbumViewController *)self _invalideSectionHeaders];
  [(PUPhotosAlbumViewController *)self _updateSectionHeadersIfNeeded];
}

- (id)filterPredicateForAlbum:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F390B0], "pl_filterPredicateForAssetContainer:", a3);
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotosAlbumViewController;
  [(PUPhotosGridViewController *)&v6 viewDidLoad];
  char v3 = [(PUPhotosAlbumViewController *)self collectionView];
  objc_super v4 = +[PUInterfaceManager currentTheme];
  BOOL v5 = [v4 photoCollectionViewBackgroundColor];
  [v3 setBackgroundColor:v5];

  [v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"PUFullMomentsHeader" withReuseIdentifier:@"PUFullMomentsHeader"];
}

- (PUPhotosAlbumViewController)initWithAlbumSpec:(id)a3 photoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 gridSpec];
  uint64_t v9 = [(PUPhotosAlbumViewController *)self initWithSpec:v8 photoLibrary:v7];

  if (v9) {
    [(PUPhotosAlbumViewController *)v9 _setAlbumSpec:v6];
  }

  return v9;
}

- (PUPhotosAlbumViewController)initWithSpec:(id)a3 photoLibrary:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PUPhotosAlbumViewController;
  return [(PUPhotosGridViewController *)&v5 initWithSpec:a3 photoLibrary:a4];
}

- (PUPhotosAlbumViewController)initWithSpec:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F39228];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "px_deprecated_appPhotoLibrary");
  id v7 = [(PUPhotosAlbumViewController *)self initWithSpec:v5 photoLibrary:v6];

  return v7;
}

@end