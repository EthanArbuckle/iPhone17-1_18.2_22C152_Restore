@interface PXCuratedLibraryVideoPlaybackController
- (BOOL)_canPlayVideosInZoomLevel:(int64_t)a3;
- (BOOL)canPlayAsset:(id)a3;
- (BOOL)canProvideGeometriesForRecords;
- (BOOL)canUpdatePlayingRecords;
- (BOOL)shouldEnablePlayback;
- (CGRect)currentVisibleRect;
- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4;
- (PXCuratedLibraryLayout)curatedLibraryLayout;
- (PXCuratedLibraryVideoPlaybackController)init;
- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5;
- (id)currentHoveredDisplayAsset;
- (id)filterSortedRecordsToPlay:(id)a3;
- (id)initViewViewModel:(id)a3;
- (int64_t)maxNumberOfPlayingItems;
- (void)didUpdatePlayingRecords;
- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCuratedLibraryLayout:(id)a3;
@end

@implementation PXCuratedLibraryVideoPlaybackController

- (int64_t)maxNumberOfPlayingItems
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  if (-[PXCuratedLibraryVideoPlaybackController _canPlayVideosInZoomLevel:](self, "_canPlayVideosInZoomLevel:", [WeakRetained zoomLevel]))
  {
    v4 = +[PXCuratedLibrarySettings sharedInstance];
    int64_t v5 = [v4 maxNumberOfPlayingItems];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_canPlayVideosInZoomLevel:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    return 1;
  }
  if (a3 != 4) {
    return 0;
  }
  int64_t v5 = +[PXCuratedLibrarySettings sharedInstance];
  int v6 = [v5 enableInlinePlaybackInZoomableGrids];

  if (!v6) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  v8 = [WeakRetained zoomablePhotosViewModel];
  char v9 = [v8 isDisplayingIndividualItems];

  return v9;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v13 = a3;
  if ((void *)PXCuratedLibraryViewModelObservableContext == a5)
  {
    if ((v6 & 0x805) != 0) {
      [(PXGridInlinePlaybackController *)self invalidatePlaybackEnabled];
    }
    if ((v6 & 0x2200) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
      uint64_t v10 = [WeakRetained zoomLevelTransitionPhase];

      if (!v10)
      {
        id v11 = objc_loadWeakRetained((id *)&self->_viewModel);
        self->_newZoomLevel = [v11 zoomLevel];

        [(PXGridInlinePlaybackController *)self invalidatePlayingRecords];
      }
    }
    if ((v6 & 8) != 0 && [(PXGridInlinePlaybackController *)self shouldPlayOnHover]) {
      [(PXGridInlinePlaybackController *)self invalidatePlayingRecords];
    }
  }
  else
  {
    if ((void *)PXCuratedLibraryViewModelZoomablePhotosObserverContext_176893 != a5)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryVideoPlaybackController.m" lineNumber:113 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((v6 & 1) != 0 && [(PXGridInlinePlaybackController *)self shouldPlayOnHover]) {
      [(PXGridInlinePlaybackController *)self invalidatePlaybackEnabled];
    }
  }
}

- (id)initViewViewModel:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibraryVideoPlaybackController;
  int64_t v5 = [(PXGridInlinePlaybackController *)&v9 init];
  __int16 v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewModel, v4);
    v6->_newZoomLevel = [v4 zoomLevel];
    [v4 registerChangeObserver:v6 context:PXCuratedLibraryViewModelObservableContext];
    v7 = [v4 zoomablePhotosViewModel];
    [v7 registerChangeObserver:v6 context:PXCuratedLibraryViewModelZoomablePhotosObserverContext_176893];
  }
  return v6;
}

- (BOOL)shouldEnablePlayback
{
  v2 = self;
  p_viewModel = &self->_viewModel;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  LODWORD(v2) = -[PXCuratedLibraryVideoPlaybackController _canPlayVideosInZoomLevel:](v2, "_canPlayVideosInZoomLevel:", [WeakRetained zoomLevel]);

  if (!v2) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_viewModel);
  char v6 = [v5 isSelecting];

  if (v6) {
    return 0;
  }
  id v7 = objc_loadWeakRetained((id *)p_viewModel);
  uint64_t v8 = [v7 scrollRegime];

  if (v8 > 1) {
    return 0;
  }
  else {
    return objc_msgSend(off_1E5DA5398, "px_accessibilityIsReduceMotionEnabled") ^ 1;
  }
}

- (BOOL)canUpdatePlayingRecords
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  BOOL v3 = [WeakRetained zoomLevelTransitionPhase] == 0;

  return v3;
}

- (void)setCuratedLibraryLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedLibraryLayout, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

- (PXCuratedLibraryLayout)curatedLibraryLayout
{
  return self->_curatedLibraryLayout;
}

- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *, void *, unsigned char *, double, double, double, double))a4;
  unsigned __int8 v31 = 0;
  v30[0] = 0;
  v30[1] = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(PXGridInlinePlaybackController *)self currentRecords];
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
      [(PXCuratedLibraryVideoPlaybackController *)self frameForPlaybackRecord:v10 minPlayableSize:v30];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      v19 = NSString;
      v20 = [v10 diagnosticLog];
      v21 = [v10 diagnosticScoresDescription];
      v22 = [v10 videoStatusDescription];
      v23 = [v19 stringWithFormat:@"\n%@\n%@\n%@", v20, v21, v22];

      v24 = [MEMORY[0x1E4FB1618] cyanColor];
      v5[2](v5, v24, v23, &v31, v12, v14, v16, v18);

      LODWORD(v24) = v31;
      if (v24) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)canPlayAsset:(id)a3
{
  if ((unint64_t)([a3 playbackStyle] - 3) > 2) {
    return 0;
  }
  BOOL v3 = +[PXCuratedLibrarySettings sharedInstance];
  char v4 = [v3 enableInlinePlayback];

  return v4;
}

- (BOOL)canProvideGeometriesForRecords
{
  v2 = [(PXCuratedLibraryVideoPlaybackController *)self curatedLibraryLayout];
  char v3 = [v2 allowsObjectReferenceSpriteIndexLookup];

  return v3;
}

- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PXCuratedLibraryVideoPlaybackController *)self curatedLibraryLayout];
  uint64_t v8 = [v6 geometryReference];
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x4010000000;
  v48[3] = &unk_1AB5D584F;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v49 = *MEMORY[0x1E4F1DB28];
  long long v50 = v9;
  if ((unint64_t)(self->_newZoomLevel - 1) <= 1)
  {
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __82__PXCuratedLibraryVideoPlaybackController_frameForPlaybackRecord_minPlayableSize___block_invoke;
    v45[3] = &unk_1E5DC21C8;
    id v46 = v6;
    v47 = v48;
    [v7 enumerateVisibleAssetsSectionSublayoutsUsingBlock:v45];
    uint64_t v10 = v46;
    goto LABEL_17;
  }
  double v11 = [v8 objectReference];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v11 keyAssetReference];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v10 = 0;
      goto LABEL_9;
    }
    id v12 = v11;
  }
  uint64_t v10 = v12;
LABEL_9:
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = -1;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__176875;
  v39 = __Block_byref_object_dispose__176876;
  id v40 = 0;
  if (v10)
  {
    if (self->_presentedZoomLevel == 4
      && (+[PXCuratedLibrarySettings sharedInstance],
          double v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 enableInlinePlaybackInZoomableGrids],
          v13,
          v14))
    {
      unsigned int v15 = [v7 spriteIndexForObjectReference:v10];
      *((_DWORD *)v42 + 6) = v15;
    }
    else
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __82__PXCuratedLibraryVideoPlaybackController_frameForPlaybackRecord_minPlayableSize___block_invoke_216;
      v31[3] = &unk_1E5DC21F0;
      uint64_t v33 = &v41;
      id v32 = v10;
      v34 = &v35;
      [v7 enumerateVisibleAssetsSectionSublayoutsUsingBlock:v31];
      int v16 = [v7 convertSpriteIndex:*((unsigned int *)v42 + 6) fromDescendantLayout:v36[5]];
      *((_DWORD *)v42 + 6) = v16;

      unsigned int v15 = *((_DWORD *)v42 + 6);
    }
    if (v15 != -1)
    {
      int v30 = *(_DWORD *)off_1E5DAAF60;
      long long v17 = *((_OWORD *)off_1E5DAAF70 + 1);
      v29[0] = *(_OWORD *)off_1E5DAAF70;
      v29[1] = v17;
      long long v18 = *((_OWORD *)off_1E5DAAF90 + 7);
      v51[6] = *((_OWORD *)off_1E5DAAF90 + 6);
      v51[7] = v18;
      long long v19 = *((_OWORD *)off_1E5DAAF90 + 9);
      v51[8] = *((_OWORD *)off_1E5DAAF90 + 8);
      v51[9] = v19;
      long long v20 = *((_OWORD *)off_1E5DAAF90 + 3);
      v51[2] = *((_OWORD *)off_1E5DAAF90 + 2);
      v51[3] = v20;
      long long v21 = *((_OWORD *)off_1E5DAAF90 + 5);
      v51[4] = *((_OWORD *)off_1E5DAAF90 + 4);
      v51[5] = v21;
      long long v22 = *((_OWORD *)off_1E5DAAF90 + 1);
      v51[0] = *(_OWORD *)off_1E5DAAF90;
      v51[1] = v22;
      long long v23 = *((_OWORD *)off_1E5DAAF88 + 1);
      v27[0] = *(_OWORD *)off_1E5DAAF88;
      v27[1] = v23;
      uint64_t v28 = *((void *)off_1E5DAAF88 + 4);
      [v7 copyLayoutForSpritesInRange:v15 | 0x100000000 entities:&v30 geometries:v29 styles:v51 infos:v27];
      [v7 minPlayableSizeForSpriteAtIndex:*((unsigned int *)v42 + 6)];
      a4->width = v24;
      a4->height = v25;
      PXRectWithCenterAndSize();
    }
  }
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
LABEL_17:

  [v7 displayScale];
  if (v26 > 0.0) {
    [v7 displayScale];
  }
  PXRectRoundToPixel();
}

void __82__PXCuratedLibraryVideoPlaybackController_frameForPlaybackRecord_minPlayableSize___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7, unsigned char *a8)
{
  id v24 = a7;
  uint64_t v14 = [v24 bodyContentLayout];
  if (!v14) {
    goto LABEL_12;
  }
  unsigned int v15 = (void *)v14;
  int v16 = [*(id *)(a1 + 32) displayAsset];
  long long v17 = [v24 keyAssetsFetchResult];
  long long v18 = [v17 firstObject];
  id v19 = v16;
  id v20 = v18;
  if (v19 == v20)
  {

    goto LABEL_10;
  }
  long long v21 = v20;
  if (!v19 || !v20)
  {

    goto LABEL_12;
  }
  uint64_t v22 = [v19 isContentEqualTo:v20];
  if (!v22) {
    uint64_t v22 = [v21 isContentEqualTo:v19];
  }

  if (v22 == 2)
  {
LABEL_10:
    long long v23 = *(double **)(*(void *)(a1 + 40) + 8);
    v23[4] = a2;
    v23[5] = a3;
    v23[6] = a4;
    v23[7] = a5;
    *a8 = 1;
  }
LABEL_12:
}

void __82__PXCuratedLibraryVideoPlaybackController_frameForPlaybackRecord_minPlayableSize___block_invoke_216(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  uint64_t v8 = a1[4];
  uint64_t v9 = 0;
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = [v7 spriteIndexForObjectReference:v8 options:0 updatedObjectReference:&v9];
  if (*(_DWORD *)(*(void *)(a1[5] + 8) + 24) != -1)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    *a4 = 1;
  }
}

- (id)filterSortedRecordsToPlay:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v38 = v4;
    id v5 = [(PXCuratedLibraryVideoPlaybackController *)self curatedLibraryLayout];
    id v37 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
    id v7 = [WeakRetained skimmingInfo];
    uint64_t v36 = [v7 parentAssetCollection];

    uint64_t v8 = (void *)v36;
    if (v36)
    {
      id v9 = objc_alloc((Class)off_1E5DA55C0);
      long long v10 = *((_OWORD *)off_1E5DAB028 + 1);
      long long v46 = *(_OWORD *)off_1E5DAB028;
      long long v47 = v10;
      uint64_t v35 = (void *)[v9 initWithSectionObject:v36 itemObject:0 subitemObject:0 indexPath:&v46];
      id v45 = 0;
      uint64_t v11 = [v5 spriteIndexForObjectReference:v35 options:1 updatedObjectReference:&v45];
      id v34 = v45;
      id v12 = [v5 leafSublayoutForSpriteIndex:v11];
      id v39 = (id)[v37 mutableCopy];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v13 = v37;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v48 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v42 != v15) {
                objc_enumerationMutation(v13);
              }
              long long v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              long long v18 = [v17 geometryReference];
              uint64_t v19 = [v5 spriteIndexForSpriteReference:v18];

              id v20 = [v5 leafSublayoutForSpriteIndex:v19];
              long long v21 = [v12 bodyContentLayout];
              BOOL v23 = v21 != v20 && v12 != v20;

              if (v23)
              {
                [v17 setDiagnosticLog:@"Record doesn't belong to skimming card"];
                [v39 removeObject:v17];
              }
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v48 count:16];
          }
          while (v14);
        }
      }
    }
    else
    {
      int64_t newZoomLevel = self->_newZoomLevel;
      if (newZoomLevel == 1)
      {
        unsigned __int8 v31 = [v5 libraryBodyLayout];
        id v32 = [v31 composition];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = 0;
          id v33 = v37;
          if ([v32 presentedNumberOfColumns] >= 2)
          {

            id v33 = (id)MEMORY[0x1E4F1CBF0];
          }
        }
        else
        {
          uint64_t v8 = 0;
          id v33 = v37;
        }

        id v39 = v33;
        goto LABEL_22;
      }
      if (newZoomLevel != 2)
      {
        id v39 = v37;
        goto LABEL_22;
      }
      double v26 = [v5 libraryBodyLayout];
      long long v27 = [v26 composition];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (([v27 presentedSingleColumn] & 1) == 0 && (unint64_t)objc_msgSend(v37, "count") >= 2)
        {
          uint64_t v28 = (void *)[v37 mutableCopy];
          id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          *(void *)&long long v46 = 0;
          *((void *)&v46 + 1) = &v46;
          long long v47 = 0x2020000000uLL;
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __69__PXCuratedLibraryVideoPlaybackController_filterSortedRecordsToPlay___block_invoke;
          v40[3] = &unk_1E5DC2158;
          v40[6] = &v46;
          v40[4] = v28;
          id v30 = v29;
          v40[5] = v30;
          [v5 enumerateVisibleAssetsSectionSublayoutsUsingBlock:v40];
          [v30 allValues];
          objc_claimAutoreleasedReturnValue();
          PXMap();
        }
        id v39 = v37;
      }
      else
      {
        id v39 = v37;
      }
    }
    uint64_t v8 = (void *)v36;
LABEL_22:

    id v4 = v38;
    goto LABEL_24;
  }
  id v39 = v4;
LABEL_24:

  return v39;
}

void __69__PXCuratedLibraryVideoPlaybackController_filterSortedRecordsToPlay___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 assetCollection];
  BOOL v6 = PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v5, 2);

  if (v6)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  else
  {
    id v7 = [v4 bodyContentLayout];

    if (v7)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v26 = a1;
        uint64_t v11 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v28 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = [*(id *)(*((void *)&v27 + 1) + 8 * i) displayAsset];
            uint64_t v14 = [v4 keyAssetsFetchResult];
            uint64_t v15 = [v14 firstObject];
            id v16 = v13;
            id v17 = v15;
            if (v16 == v17)
            {

LABEL_23:
              uint64_t v22 = *(void **)(v26 + 40);
              BOOL v23 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(v26 + 48) + 8) + 24)];
              id v24 = [v22 objectForKeyedSubscript:v23];
              CGFloat v25 = [v24 second];
              [v25 CGRectValue];

              PXRectArea();
            }
            long long v18 = v17;
            if (v16) {
              BOOL v19 = v17 == 0;
            }
            else {
              BOOL v19 = 1;
            }
            if (v19)
            {
            }
            else
            {
              uint64_t v20 = [v16 isContentEqualTo:v17];
              uint64_t v21 = v20;
              if (!v20) {
                uint64_t v21 = [v18 isContentEqualTo:v16];
              }

              if (v21 == 2) {
                goto LABEL_23;
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v10);
        a1 = v26;
      }

      [*(id *)(a1 + 32) removeObject:0];
    }
  }
}

uint64_t __69__PXCuratedLibraryVideoPlaybackController_filterSortedRecordsToPlay___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __69__PXCuratedLibraryVideoPlaybackController_filterSortedRecordsToPlay___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 first];
}

- (void)didUpdatePlayingRecords
{
  self->_presentedZoomLevel = self->_newZoomLevel;
}

- (id)currentHoveredDisplayAsset
{
  long long v14 = 0u;
  long long v15 = 0u;
  p_viewModel = &self->_viewModel;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  id v4 = [WeakRetained selectionSnapshot];
  id v5 = v4;
  if (v4)
  {
    [v4 pendingIndexPath];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }

  if ((void)v14 == *(void *)off_1E5DAAED8)
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_viewModel);
    id v8 = [v7 currentDataSource];
    v13[0] = v14;
    v13[1] = v15;
    BOOL v6 = [v8 objectReferenceAtIndexPath:v13];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
LABEL_11:
    uint64_t v10 = v9;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v6 keyAssetReference];
    goto LABEL_11;
  }
  uint64_t v10 = 0;
LABEL_13:
  uint64_t v11 = [v10 asset];

  return v11;
}

- (CGRect)currentVisibleRect
{
  v2 = [(PXCuratedLibraryVideoPlaybackController *)self curatedLibraryLayout];
  [v2 visibleRect];
  [v2 safeAreaInsets];
  PXEdgeInsetsInsetRect();
}

- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[PXGridInlineVideoSessionAssetPlaybackRecord alloc] initWithDisplayAsset:v9 mediaProvider:v8 spriteReference:v7 playLivePhotosWithSettlingEffectIfPossible:0];

  return v10;
}

- (PXCuratedLibraryVideoPlaybackController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryVideoPlaybackController.m", 70, @"%s is not available as initializer", "-[PXCuratedLibraryVideoPlaybackController init]");

  abort();
}

@end