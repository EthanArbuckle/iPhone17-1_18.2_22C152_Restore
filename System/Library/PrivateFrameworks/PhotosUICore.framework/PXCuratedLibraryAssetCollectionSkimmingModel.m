@interface PXCuratedLibraryAssetCollectionSkimmingModel
- (BOOL)canStartSkimming;
- (BOOL)isInteractionInProgress;
- (BOOL)isPlayingSlideshow;
- (PXAssetCollectionReference)containingAssetCollectionReference;
- (PXCuratedLibraryAssetCollectionSkimmingModel)initWithViewModel:(id)a3;
- (PXCuratedLibraryViewModel)viewModel;
- (PXIndexPathSet)indexPathSetForSkimming;
- (PXSimpleIndexPath)initialIndexPath;
- (PXSimpleIndexPath)skimmedIndexPath;
- (id)validatedAssetCollectionReference:(id)a3;
- (void)_prepareIndexesForAssetCollectionReference:(id)a3 willStartSkimming:(BOOL)a4 willStartSlideshow:(BOOL)a5;
- (void)_updateViewModel;
- (void)persistSkimmingState;
- (void)prepareForShowingHintsForAssetCollectionReference:(id)a3;
- (void)prepareForSkimmingInAssetCollectionReference:(id)a3;
- (void)prepareForSlideshowForAssetCollectionReference:(id)a3;
- (void)setSkimmedIndexPath:(PXSimpleIndexPath *)a3;
- (void)tearDownAfterSkimmingShowHints:(BOOL)a3 persistState:(BOOL)a4;
- (void)transitionToSkimming;
- (void)transitionToSlideshow;
@end

@implementation PXCuratedLibraryAssetCollectionSkimmingModel

- (PXCuratedLibraryAssetCollectionSkimmingModel)initWithViewModel:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryAssetCollectionSkimmingModel;
  v6 = [(PXCuratedLibraryAssetCollectionSkimmingModel *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    v7->_zoomLevel = 0;
    long long v8 = *(_OWORD *)off_1E5DAB028;
    long long v9 = *((_OWORD *)off_1E5DAB028 + 1);
    *(_OWORD *)&v7->_skimmedIndexPath.dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
    *(_OWORD *)&v7->_skimmedIndexPath.item = v9;
    *(_OWORD *)&v7->_initialIndexPath.dataSourceIdentifier = v8;
    *(_OWORD *)&v7->_initialIndexPath.item = v9;
  }

  return v7;
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)canStartSkimming
{
  return [(PXCuratedLibraryViewModel *)self->_viewModel zoomLevel] == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathSetForSkimming, 0);
  objc_storeStrong((id *)&self->_containingAssetCollectionReference, 0);
  objc_storeStrong(&self->_dataSourcePauseToken, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (PXSimpleIndexPath)skimmedIndexPath
{
  long long v3 = *(_OWORD *)&self[3].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[3].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXSimpleIndexPath)initialIndexPath
{
  long long v3 = *(_OWORD *)&self[2].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[2].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXIndexPathSet)indexPathSetForSkimming
{
  return self->_indexPathSetForSkimming;
}

- (BOOL)isInteractionInProgress
{
  return self->_isInteractionInProgress;
}

- (BOOL)isPlayingSlideshow
{
  return self->_isPlayingSlideshow;
}

- (PXAssetCollectionReference)containingAssetCollectionReference
{
  return self->_containingAssetCollectionReference;
}

- (void)persistSkimmingState
{
  if (self->_skimmingZoomLevel)
  {
    int64_t dataSourceIdentifier = self->_skimmedIndexPath.dataSourceIdentifier;
    long long v14 = *(_OWORD *)&self->_skimmedIndexPath.section;
    int64_t subitem = self->_skimmedIndexPath.subitem;
    v4 = [(PXCuratedLibraryViewModel *)self->_viewModel assetsDataSourceManager];
    id v5 = [v4 dataSourceForZoomLevel:self->_skimmingZoomLevel];
    if ([v5 identifier] == dataSourceIdentifier)
    {
      int64_t v11 = dataSourceIdentifier;
      long long v12 = v14;
      int64_t v13 = subitem;
      v6 = [v5 keyAssetsInSectionIndexPath:&v11];
      v7 = [v6 firstObject];

      if (v7)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __68__PXCuratedLibraryAssetCollectionSkimmingModel_persistSkimmingState__block_invoke;
        v8[3] = &unk_1E5DC62C0;
        id v9 = v7;
        v10 = self;
        [v4 performChanges:v8];
      }
    }
  }
}

void __68__PXCuratedLibraryAssetCollectionSkimmingModel_persistSkimmingState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v7 = [v4 containingAssetCollectionReference];
  v6 = [v7 assetCollection];
  [v5 setTransientKeyAsset:v3 forAssetCollection:v6 zoomLevel:*(void *)(*(void *)(a1 + 40) + 16)];
}

- (void)_updateViewModel
{
  viewModel = self->_viewModel;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__PXCuratedLibraryAssetCollectionSkimmingModel__updateViewModel__block_invoke;
  v3[3] = &unk_1E5DCF3F0;
  v3[4] = self;
  [(PXCuratedLibraryViewModel *)viewModel performChanges:v3];
}

void __64__PXCuratedLibraryAssetCollectionSkimmingModel__updateViewModel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 56) count];
  unsigned int v5 = [*(id *)(a1 + 32) isPlayingSlideshow];
  if (v4 > 1) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [*(id *)(a1 + 32) isInteractionInProgress];
  uint64_t v8 = v7;
  if ((v6 & 1) != 0 || v7)
  {
    id v9 = objc_alloc_init(PXCuratedLibraryAssetCollectionSkimmingInfo);
    [(PXCuratedLibraryAssetCollectionSkimmingInfo *)v9 setSlideshowStarted:v6];
    [(PXCuratedLibraryAssetCollectionSkimmingInfo *)v9 setTouchInteractionStarted:v8];
    v10 = [*(id *)(*(void *)(a1 + 32) + 48) assetCollection];
    [(PXCuratedLibraryAssetCollectionSkimmingInfo *)v9 setParentAssetCollection:v10];

    [(PXCuratedLibraryAssetCollectionSkimmingInfo *)v9 setChildCollectionsZoomLevel:*(void *)(*(void *)(a1 + 32) + 24)];
    [(PXCuratedLibraryAssetCollectionSkimmingInfo *)v9 setChildCollectionsIndexes:*(void *)(*(void *)(a1 + 32) + 56)];
    uint64_t v11 = *(void *)(a1 + 32);
    long long v12 = *(_OWORD *)(v11 + 112);
    v13[0] = *(_OWORD *)(v11 + 96);
    v13[1] = v12;
    [(PXCuratedLibraryAssetCollectionSkimmingInfo *)v9 setCurrentChildCollectionIndexPath:v13];
  }
  else
  {
    id v9 = 0;
  }
  [v3 setSkimmingInfo:v9];
}

- (void)setSkimmedIndexPath:(PXSimpleIndexPath *)a3
{
  if (a3->section != self->_skimmedIndexPath.section)
  {
    long long v3 = *(_OWORD *)&a3->item;
    *(_OWORD *)&self->_skimmedIndexPath.int64_t dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
    *(_OWORD *)&self->_skimmedIndexPath.item = v3;
    [(PXCuratedLibraryAssetCollectionSkimmingModel *)self _updateViewModel];
  }
}

- (void)tearDownAfterSkimmingShowHints:(BOOL)a3 persistState:(BOOL)a4
{
  if (self->_skimmingZoomLevel)
  {
    if (a4) {
      [(PXCuratedLibraryAssetCollectionSkimmingModel *)self persistSkimmingState];
    }
    if (self->_dataSourcePauseToken)
    {
      uint64_t v6 = [(PXCuratedLibraryViewModel *)self->_viewModel assetsDataSourceManager];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __92__PXCuratedLibraryAssetCollectionSkimmingModel_tearDownAfterSkimmingShowHints_persistState___block_invoke;
      v12[3] = &unk_1E5DC6298;
      v12[4] = self;
      [v6 performChanges:v12];

      id dataSourcePauseToken = self->_dataSourcePauseToken;
      self->_id dataSourcePauseToken = 0;
    }
    *(_WORD *)&self->_isPlayingSlideshow = 0;
    if (!a3)
    {
      containingAssetCollectionReference = self->_containingAssetCollectionReference;
      self->_containingAssetCollectionReference = 0;

      long long v10 = *(_OWORD *)off_1E5DAB028;
      long long v11 = *((_OWORD *)off_1E5DAB028 + 1);
      *(_OWORD *)&self->_skimmedIndexPath.int64_t dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
      *(_OWORD *)&self->_skimmedIndexPath.item = v11;
      indexPathSetForSkimming = self->_indexPathSetForSkimming;
      self->_indexPathSetForSkimming = 0;

      *(_OWORD *)&self->_initialIndexPath.int64_t dataSourceIdentifier = v10;
      *(_OWORD *)&self->_initialIndexPath.item = v11;
      self->_skimmingZoomLevel = 0;
    }
    [(PXCuratedLibraryAssetCollectionSkimmingModel *)self _updateViewModel];
  }
}

uint64_t __92__PXCuratedLibraryAssetCollectionSkimmingModel_tearDownAfterSkimmingShowHints_persistState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 resumeChangeDelivery:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (void)_prepareIndexesForAssetCollectionReference:(id)a3 willStartSkimming:(BOOL)a4 willStartSlideshow:(BOOL)a5
{
  BOOL v51 = a5;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int64_t v9 = [(PXCuratedLibraryViewModel *)self->_viewModel zoomLevel];
  self->_zoomLevel = v9;
  if (v9 == 1)
  {
    long long v12 = [v8 assetCollection];
    uint64_t v13 = objc_msgSend(v12, "px_highlightKind");

    if (v13 != 2)
    {
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      v45 = [v8 assetCollection];
      [v44 handleFailureInMethod:a2, self, @"PXCuratedLibrarySkimmingController.m", 546, @"Expected Year highlight, received %@", v45 object file lineNumber description];
    }
    self->_int64_t skimmingZoomLevel = 2;
  }
  else if ((unint64_t)(v9 - 2) < 3 || v9 == 0)
  {
    long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXCuratedLibrarySkimmingController.m" lineNumber:554 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  objc_storeStrong((id *)&self->_containingAssetCollectionReference, a3);
  long long v14 = [(PXCuratedLibraryViewModel *)self->_viewModel assetsDataSourceManager];
  int64_t skimmingZoomLevel = self->_skimmingZoomLevel;
  id v71 = 0;
  v16 = [v14 assetCollectionReferencesInDataSourceForZoomLevel:skimmingZoomLevel withParentAssetCollectionReference:v8 assetCollectionReferenceWithSameKeyAssetAsParent:&v71];
  id v17 = v71;
  id v18 = objc_alloc_init((Class)off_1E5DA7430);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v19 = v16;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v68 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        if (v23) {
          [v23 indexPath];
        }
        else {
          memset(v66, 0, sizeof(v66));
        }
        [v18 addIndexPath:v66];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v67 objects:v72 count:16];
    }
    while (v20);
  }

  v24 = (PXIndexPathSet *)[v18 copy];
  indexPathSetForSkimming = self->_indexPathSetForSkimming;
  self->_indexPathSetForSkimming = v24;

  if (a4 || v51)
  {
    v26 = self->_indexPathSetForSkimming;
    *(void *)&long long v64 = 0;
    *((void *)&v64 + 1) = &v64;
    *(void *)&long long v65 = 0x2020000000;
    BYTE8(v65) = 0;
    if ([(PXIndexPathSet *)v26 count] >= 1)
    {
      if (v26)
      {
        [(PXIndexPathSet *)v26 anySectionIndexPath];
        uint64_t v27 = v62;
      }
      else
      {
        uint64_t v27 = 0;
        long long v62 = 0u;
        long long v63 = 0u;
      }
      v28 = [(PXIndexPathSet *)v26 sectionIndexSetForDataSourceIdentifier:v27];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __128__PXCuratedLibraryAssetCollectionSkimmingModel__prepareIndexesForAssetCollectionReference_willStartSkimming_willStartSlideshow___block_invoke;
      v58[3] = &unk_1E5DC6270;
      v61 = &v64;
      id v29 = v28;
      id v59 = v29;
      v60 = self;
      [v14 performChanges:v58];
    }
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __128__PXCuratedLibraryAssetCollectionSkimmingModel__prepareIndexesForAssetCollectionReference_willStartSkimming_willStartSlideshow___block_invoke_2;
    v57[3] = &unk_1E5DC6298;
    v57[4] = self;
    [v14 performChanges:v57];
    _Block_object_dispose(&v64, 8);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  if (v17)
  {
    [v17 indexPath];
  }
  else
  {
    long long v30 = *((_OWORD *)off_1E5DAB028 + 1);
    long long v64 = *(_OWORD *)off_1E5DAB028;
    long long v65 = v30;
  }
  if ((void)v64 == *(void *)off_1E5DAAED8)
  {
    v31 = [v14 dataSourceForZoomLevel:self->_skimmingZoomLevel];
    v32 = [v31 objectReferenceNearestToObjectReference:v8];
    if (v32)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v49 = [MEMORY[0x1E4F28B00] currentHandler];
        v46 = (objc_class *)objc_opt_class();
        v48 = NSStringFromClass(v46);
        v47 = objc_msgSend(v32, "px_descriptionForAssertionMessage");
        [v49 handleFailureInMethod:a2, self, @"PXCuratedLibrarySkimmingController.m", 594, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[dataSource objectReferenceNearestToObjectReference:assetCollectionReference]", v48, v47 object file lineNumber description];
      }
    }
    if (v31)
    {
      [v31 indexPathForAssetCollectionReference:v32];
    }
    else
    {
      long long v55 = 0u;
      long long v56 = 0u;
    }
    long long v64 = v55;
    long long v65 = v56;
    if (([(PXIndexPathSet *)self->_indexPathSetForSkimming containsIndexPath:&v55] & 1) == 0)
    {
      long long v55 = 0u;
      long long v56 = 0u;
      v33 = self->_indexPathSetForSkimming;
      p_initialIndexPath = &self->_initialIndexPath;
      if (v33)
      {
        long long v35 = *(_OWORD *)&self->_initialIndexPath.item;
        long long v53 = *(_OWORD *)&p_initialIndexPath->dataSourceIdentifier;
        long long v54 = v35;
        [(PXIndexPathSet *)v33 indexPathLessThanIndexPath:&v53];
        v33 = self->_indexPathSetForSkimming;
      }
      long long v53 = v55;
      long long v54 = v56;
      if ([(PXIndexPathSet *)v33 containsIndexPath:&v53])
      {
        long long v36 = v55;
        long long v37 = v56;
      }
      else
      {
        v38 = self->_indexPathSetForSkimming;
        if (v38)
        {
          long long v39 = *(_OWORD *)&self->_initialIndexPath.item;
          v52[0] = *(_OWORD *)&p_initialIndexPath->dataSourceIdentifier;
          v52[1] = v39;
          [(PXIndexPathSet *)v38 indexPathGreaterThanIndexPath:v52];
        }
        else
        {
          long long v53 = 0u;
          long long v54 = 0u;
        }
        long long v36 = v53;
        long long v37 = v54;
      }
      long long v64 = v36;
      long long v65 = v37;
    }
  }
  v40 = self->_indexPathSetForSkimming;
  long long v55 = v64;
  long long v56 = v65;
  if (([(PXIndexPathSet *)v40 containsIndexPath:&v55] & 1) == 0)
  {
    v41 = self->_indexPathSetForSkimming;
    if (v41)
    {
      [(PXIndexPathSet *)v41 anySectionIndexPath];
    }
    else
    {
      long long v55 = 0u;
      long long v56 = 0u;
    }
    long long v64 = v55;
    long long v65 = v56;
  }
  long long v42 = v64;
  long long v43 = v65;
  *(_OWORD *)&self->_initialIndexPath.int64_t dataSourceIdentifier = v64;
  *(_OWORD *)&self->_initialIndexPath.item = v43;
  self->_isPlayingSlideshow = v51;
  self->_isInteractionInProgress = a4;
  *(_OWORD *)&self->_skimmedIndexPath.int64_t dataSourceIdentifier = v42;
  *(_OWORD *)&self->_skimmedIndexPath.item = v43;
  [(PXCuratedLibraryAssetCollectionSkimmingModel *)self _updateViewModel];
}

uint64_t __128__PXCuratedLibraryAssetCollectionSkimmingModel__prepareIndexesForAssetCollectionReference_willStartSkimming_willStartSlideshow___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 forceAccurateSectionsIfNeeded:a1[4] inZoomLevel:*(void *)(a1[5] + 24)];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

void __128__PXCuratedLibraryAssetCollectionSkimmingModel__prepareIndexesForAssetCollectionReference_willStartSkimming_willStartSlideshow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 pauseChangeDeliveryWithTimeout:@"PXCuratedLibrarySkimmingController" identifier:180.0];
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v3;
}

- (void)transitionToSkimming
{
  if (!self->_isInteractionInProgress)
  {
    *(_WORD *)&self->_isPlayingSlideshow = 256;
    [(PXCuratedLibraryAssetCollectionSkimmingModel *)self _updateViewModel];
  }
}

- (void)transitionToSlideshow
{
  if (!self->_isPlayingSlideshow)
  {
    *(_WORD *)&self->_isPlayingSlideshow = 1;
    [(PXCuratedLibraryAssetCollectionSkimmingModel *)self _updateViewModel];
  }
}

- (void)prepareForSkimmingInAssetCollectionReference:(id)a3
{
}

- (void)prepareForShowingHintsForAssetCollectionReference:(id)a3
{
}

- (void)prepareForSlideshowForAssetCollectionReference:(id)a3
{
}

- (id)validatedAssetCollectionReference:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 assetCollection];
  if (objc_msgSend(v5, "px_highlightKind") == 2)
  {
    uint64_t v6 = v4;
  }
  else
  {
    int64_t v7 = [(PXCuratedLibraryViewModel *)self->_viewModel zoomLevel];

    uint64_t v6 = v4;
    if (v7 != 1) {
      goto LABEL_6;
    }
    id v8 = [(PXCuratedLibraryViewModel *)self->_viewModel assetsDataSourceManager];
    unsigned int v5 = objc_msgSend(v8, "dataSourceForZoomLevel:", -[PXCuratedLibraryViewModel zoomLevel](self->_viewModel, "zoomLevel"));

    uint64_t v6 = [v5 assetCollectionReferenceNearestToObjectReference:v4];
  }
LABEL_6:

  return v6;
}

@end