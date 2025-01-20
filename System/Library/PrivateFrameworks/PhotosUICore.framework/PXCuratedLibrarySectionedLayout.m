@interface PXCuratedLibrarySectionedLayout
+ (BOOL)shouldDisableLaunchOptimizations;
+ (void)setShouldDisableLaunchOptimizations:(BOOL)a3;
- (BOOL)allowsDanglingUpdatesAssertions;
- (BOOL)allowsSublayoutUpdateCycleAssertions;
- (BOOL)isInitialLoad;
- (BOOL)layout:(id)a3 shouldPreventFaultOutOfSublayout:(id)a4;
- (BOOL)performedInitialLoad;
- (BOOL)prefersDominantHeroForZoomLevel:(int64_t)a3;
- (CGRect)sectionBoundariesForAssetCollectionReference:(id)a3;
- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)a5;
- (PXAssetsDataSource)presentedDataSource;
- (PXAssetsSectionLayout)dominantSectionLayout;
- (PXCuratedLibraryLayoutSpec)spec;
- (PXCuratedLibrarySectionedLayout)init;
- (PXCuratedLibrarySectionedLayout)initWithViewModel:(id)a3 spec:(id)a4;
- (PXCuratedLibraryViewModel)viewModel;
- (PXGSpriteReference)lastHitSpriteReference;
- (UIEdgeInsets)padding;
- (double)defaultInterlayoutSpacing;
- (double)lateralMargin;
- (id)_heroAssetCollectionReferenceClosestToAssetCollectionReference:(id)a3 zoomLevel:(int64_t)a4;
- (id)_heroSectionLayoutClosestToSectionLayout:(id)a3 zoomLevel:(int64_t)a4;
- (id)_targetAssetCollectionReferenceInZoomLevel:(int64_t)a3 forTransitionFromAssetCollectionReference:(id)a4;
- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3;
- (id)assetsIteratorForContentInRect:(CGRect)a3;
- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4;
- (id)dominantHeroPreferences;
- (id)lastVisibleDominantObjectReference;
- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4;
- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4;
- (id)layoutSnapshotDataSource;
- (id)locationNamesFutureForContentInRect:(CGRect)a3;
- (id)viewModel:(id)a3 dominantAssetCollectionReferenceForZoomLevel:(int64_t)a4;
- (int64_t)presentedZoomLevel;
- (int64_t)scrollableAxis;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)_anchorVisibleArea;
- (void)_configureSectionLayout:(id)a3 atIndex:(int64_t)a4;
- (void)_prepareAccumulatedSectionItemsBufferForSections:(int64_t)a3;
- (void)_updateFaultOutsets;
- (void)_updatePrefetchedSectionsForFaultedInSublayout:(id)a3;
- (void)_updatePreheating;
- (void)_updateSublayoutsDataSource;
- (void)_updateSublayoutsForSkimming;
- (void)clearLastVisibleAreaAnchoringInformation;
- (void)dealloc;
- (void)didFaultInSublayout:(id)a3 atIndex:(int64_t)a4 fromEstimatedContentSize:(CGSize)a5;
- (void)enumerateAssetsSectionSublayoutsInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)enumerateAssetsSectionSublayoutsUsingBlock:(id)a3;
- (void)enumerateHeroSpritesInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)enumerateScrollablePagesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateSectionBoundariesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3;
- (void)layout:(id)a3 collectIndexesOfChapterHeaderSublayouts:(id)a4 heroSublayouts:(id)a5 inRange:(_NSRange)a6;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDominantHeroPreferences:(id)a3;
- (void)setIsInitialLoad:(BOOL)a3;
- (void)setLastHitSpriteReference:(id)a3;
- (void)setLastVisibleDominantObjectReference:(id)a3;
- (void)setLateralMargin:(double)a3;
- (void)setPerformedInitialLoad:(BOOL)a3;
- (void)setPrefersDominantHero:(BOOL)a3 forZoomLevel:(int64_t)a4;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setSpec:(id)a3;
- (void)update;
- (void)willFaultOutSublayout:(id)a3 atIndex:(int64_t)a4;
@end

@implementation PXCuratedLibrarySectionedLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedDataSource, 0);
  objc_storeStrong((id *)&self->_lastHitSpriteReference, 0);
  objc_storeStrong(&self->_lastVisibleDominantObjectReference, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_cachedSectionsWithSelectedItems, 0);
  objc_storeStrong((id *)&self->_zoomLevelsPreferringDominantHeros, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
}

- (PXAssetsDataSource)presentedDataSource
{
  return self->_presentedDataSource;
}

- (int64_t)presentedZoomLevel
{
  return self->_presentedZoomLevel;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)defaultInterlayoutSpacing
{
  return self->_defaultInterlayoutSpacing;
}

- (BOOL)performedInitialLoad
{
  return self->_performedInitialLoad;
}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (PXGSpriteReference)lastHitSpriteReference
{
  return self->_lastHitSpriteReference;
}

- (void)setLastVisibleDominantObjectReference:(id)a3
{
}

- (id)lastVisibleDominantObjectReference
{
  return self->_lastVisibleDominantObjectReference;
}

- (double)lateralMargin
{
  return self->_lateralMargin;
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXCuratedLibraryLayoutSpec)spec
{
  return self->_spec;
}

- (id)_targetAssetCollectionReferenceInZoomLevel:(int64_t)a3 forTransitionFromAssetCollectionReference:(id)a4
{
  id v7 = a4;
  v8 = v7;
  if (a3 == 3)
  {
    v9 = [v7 assetCollection];
    uint64_t v10 = objc_msgSend(v9, "px_highlightKind");

    if (v10 == 1)
    {
      v11 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
      v12 = [v11 assetsDataSourceManager];
      v13 = [v12 firstAssetCollectionReferenceInDataSourceForZoomLevel:3 withParent:v8];
LABEL_4:

      goto LABEL_7;
    }
  }
  v14 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
  v15 = [v14 assetsDataSourceManager];
  v11 = [v15 dataSourceForZoomLevel:a3];

  v13 = [v11 objectReferenceNearestToObjectReference:v8];
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      v19 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
      [v12 handleFailureInMethod:a2, self, @"PXCuratedLibrarySectionedLayout.m", 1282, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[dataSource objectReferenceNearestToObjectReference:sourceCollectionReference]", v18, v19 object file lineNumber description];

      goto LABEL_4;
    }
  }
LABEL_7:

  return v13;
}

- (id)viewModel:(id)a3 dominantAssetCollectionReferenceForZoomLevel:(int64_t)a4
{
  v6 = [a3 assetsDataSourceManager];
  id v7 = [v6 dataSourceForZoomLevel:a4];

  v8 = [(PXCuratedLibrarySectionedLayout *)self lastVisibleDominantObjectReference];
  v9 = [v7 assetCollectionReferenceNearestToObjectReference:v8];

  if (v9)
  {
    if ([(PXCuratedLibrarySectionedLayout *)self prefersDominantHeroForZoomLevel:a4])
    {
      uint64_t v29 = 0;
      int64_t v10 = [(PXCuratedLibrarySectionedLayout *)self sublayoutIndexForObjectReference:v9 options:0 updatedObjectReference:&v29];
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = [(PXCuratedLibrarySectionedLayout *)self _heroAssetCollectionReferenceClosestToAssetCollectionReference:v9 zoomLevel:a4];
        v12 = (void *)v11;
        v13 = v11 ? (void *)v11 : v9;
        id v14 = v13;
      }
      else
      {
        int64_t v21 = v10;
        v22 = [(PXGLayout *)self sublayoutDataStore];
        v12 = [v22 sublayoutAtIndex:v21];

        v23 = [(PXCuratedLibrarySectionedLayout *)self _heroSectionLayoutClosestToSectionLayout:v12 zoomLevel:a4];
        uint64_t v24 = [v23 assetCollectionReference];
        v25 = (void *)v24;
        v26 = v24 ? (void *)v24 : v9;
        id v14 = v26;

        v9 = v23;
      }

      v9 = v14;
      if (!v14) {
        goto LABEL_22;
      }
    }
    goto LABEL_18;
  }
  v15 = [(PXCuratedLibrarySectionedLayout *)self dominantSectionLayout];
  v9 = [v15 assetCollectionReference];
  if ([v15 presentedSkimming])
  {
    v16 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
    v17 = [v16 skimmingInfo];
    uint64_t v18 = [v17 childCollectionsZoomLevel];

    if (v18 == a4)
    {
      v19 = [(PXCuratedLibrarySectionedLayout *)self presentedDataSource];
      v20 = [v19 assetCollectionReferenceNearestToObjectReference:v9];

      v9 = [(PXCuratedLibrarySectionedLayout *)self _targetAssetCollectionReferenceInZoomLevel:a4 forTransitionFromAssetCollectionReference:v20];
    }
  }

  if (v9)
  {
LABEL_18:
    if (v7) {
      [v7 indexPathForAssetCollectionReference:v9];
    }
    if (!*(void *)off_1E5DAAED8)
    {
      uint64_t v27 = [(PXCuratedLibrarySectionedLayout *)self _targetAssetCollectionReferenceInZoomLevel:a4 forTransitionFromAssetCollectionReference:v9];

      v9 = (void *)v27;
    }
  }
LABEL_22:

  return v9;
}

- (id)_heroAssetCollectionReferenceClosestToAssetCollectionReference:(id)a3 zoomLevel:(int64_t)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  v6 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
  id v7 = [v6 assetsDataSourceManager];
  v8 = [v7 dataSourceForZoomLevel:a4];

  long long v35 = 0u;
  long long v36 = 0u;
  if (v8) {
    [v8 indexPathForAssetCollectionReference:v26];
  }
  if (a4 != 2) {
    PXAssertGetLog();
  }
  if ((void)v35 != *(void *)off_1E5DAAED8
    && *((void *)&v35 + 1) != 0x7FFFFFFFFFFFFFFFLL
    && (void)v36 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [v8 identifier];
    uint64_t v12 = *((void *)&v35 + 1);
    *(void *)buf = 0;
    v38 = buf;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__237370;
    v41 = __Block_byref_object_dispose__237371;
    id v42 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__PXCuratedLibrarySectionedLayout__heroAssetCollectionReferenceClosestToAssetCollectionReference_zoomLevel___block_invoke;
    aBlock[3] = &unk_1E5DC9208;
    id v13 = v8;
    uint64_t v32 = v12;
    uint64_t v33 = v11;
    uint64_t v34 = 2;
    id v30 = v13;
    v31 = buf;
    id v14 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
    uint64_t v15 = v14[2](v14, -1);
    if (*((void *)v38 + 5) && (uint64_t v16 = v15, v17 = v14[2](v14, 1), v16 <= v17))
    {
      uint64_t v18 = v17 + 1;
      int64x2_t v25 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      while (1)
      {
        v27[0] = v11;
        v27[1] = v16;
        int64x2_t v28 = v25;
        v23 = objc_msgSend(v13, "assetCollectionReferenceAtSectionIndexPath:", v27, *(_OWORD *)&v25);
        id v19 = [v23 assetCollection];
        objc_opt_class();
        id v20 = (objc_opt_isKindOfClass() & 1) != 0 ? v19 : 0;
        id v21 = v20;
        v22 = [v21 keyAssetObjectIDForKind];

        LOBYTE(v21) = [v22 isEqual:*((void *)v38 + 5)];
        if (v21) {
          break;
        }

        if (v18 == ++v16) {
          goto LABEL_20;
        }
      }
    }
    else
    {
LABEL_20:
      v23 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

uint64_t __108__PXCuratedLibrarySectionedLayout__heroAssetCollectionReferenceClosestToAssetCollectionReference_zoomLevel___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) numberOfSections];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5 + a2 >= 0)
  {
    uint64_t v6 = v4;
    if (v5 + a2 < v4)
    {
      uint64_t v7 = 2 * a2;
      int64x2_t v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      while (1)
      {
        v8 = *(void **)(a1 + 32);
        v22[0] = *(void *)(a1 + 56);
        v22[1] = a2 + v5;
        int64x2_t v23 = v21;
        v9 = objc_msgSend(v8, "assetCollectionReferenceAtSectionIndexPath:", v22, *(_OWORD *)&v21);
        int64_t v10 = v9;
        if (!v9) {
          break;
        }
        uint64_t v11 = [v9 assetCollection];
        BOOL v12 = PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v11, *(void *)(a1 + 64));

        if (v12)
        {
          if (a2 < 0)
          {
            uint64_t v15 = [v10 assetCollection];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v16 = v15;
            }
            else {
              uint64_t v16 = 0;
            }
            uint64_t v17 = [v16 keyAssetObjectIDForKind];
            uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
            id v19 = *(void **)(v18 + 40);
            *(void *)(v18 + 40) = v17;
          }
          break;
        }

        uint64_t v14 = v7 + v5;
        BOOL v13 = v7 + v5 < 0;
        v5 += a2;
        if (v13 || v14 >= v6) {
          return v5;
        }
      }
    }
  }
  return v5;
}

- (id)_heroSectionLayoutClosestToSectionLayout:(id)a3 zoomLevel:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4 != 2) {
    PXAssertGetLog();
  }
  if (v6)
  {
    id v8 = [(PXGLayout *)self sublayoutDataStore];
    uint64_t v9 = [v8 indexOfSublayout:v7];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v10 = v9;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __86__PXCuratedLibrarySectionedLayout__heroSectionLayoutClosestToSectionLayout_zoomLevel___block_invoke;
      aBlock[3] = &unk_1E5DC91E0;
      id v8 = v8;
      id v18 = v8;
      uint64_t v19 = v10;
      uint64_t v20 = 2;
      uint64_t v11 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
      uint64_t v12 = v11[2](v11, -1);
      uint64_t v13 = v11[2](v11, 1);
      if (v12 > v13)
      {
LABEL_8:
        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v14 = v13 + 1;
        while (1)
        {
          uint64_t v15 = [v8 sublayoutAtIndex:v12];
          if (([v15 referenceOptions] & 4) != 0) {
            break;
          }

          if (v14 == ++v12) {
            goto LABEL_8;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __86__PXCuratedLibrarySectionedLayout__heroSectionLayoutClosestToSectionLayout_zoomLevel___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) count];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5 + a2 >= 0)
  {
    uint64_t v6 = v4;
    if (v5 + a2 < v4)
    {
      uint64_t v7 = 2 * a2;
      while (1)
      {
        id v8 = [*(id *)(a1 + 32) sublayoutAtIndex:a2 + v5];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        uint64_t v9 = [v8 assetCollection];
        uint64_t v10 = v9;
        if (!v9 || PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v9, *(void *)(a1 + 48)))
        {

          break;
        }

        uint64_t v12 = v7 + v5;
        BOOL v11 = v7 + v5 < 0;
        v5 += a2;
        if (v11 || v12 >= v6) {
          return v5;
        }
      }
    }
  }
  return v5;
}

- (PXAssetsSectionLayout)dominantSectionLayout
{
  v3 = [(PXCuratedLibrarySectionedLayout *)self lastHitSpriteReference];
  if (v3) {
    int64_t v4 = [(PXGLayout *)self sublayoutIndexForSpriteReference:v3 options:0];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v5 = [(PXCuratedLibrarySectionedLayout *)self presentedZoomLevel];
  uint64_t v6 = [(PXCuratedLibrarySectionedLayout *)self lastVisibleDominantObjectReference];
  if (v6)
  {
    uint64_t v7 = [(PXGLayout *)self spriteReferenceForObjectReference:v6];
    int64_t v4 = [(PXGLayout *)self sublayoutIndexForSpriteReference:v7 options:1];
  }
  uint64_t v27 = 0;
  int64x2_t v28 = (id *)&v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__237370;
  v31 = __Block_byref_object_dispose__237371;
  id v32 = 0;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL
    || ([(PXGLayout *)self sublayoutAtIndex:v4 loadIfNeeded:0],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = v28[5],
        v28[5] = (id)v8,
        v9,
        !v28[5]))
  {
    [(PXGLayout *)self visibleRect];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    char v18 = [(PXGLayout *)self fullyVisibleEdgesWithDefaultTolerance];
    if ((v18 & 5) == 0)
    {
      [(PXGLayout *)self safeAreaInsets];
      uint64_t v19 = +[PXCuratedLibrarySettings sharedInstance];
      [v19 topInsetForVisibilityAnchoring];

      PXEdgeInsetsInsetRect();
    }
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v26[3] = 0x7FEFFFFFFFFFFFFFLL;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __56__PXCuratedLibrarySectionedLayout_dominantSectionLayout__block_invoke;
    v23[3] = &unk_1E5DC9190;
    BOOL v24 = (v18 & 4) != 0;
    v23[4] = self;
    v23[5] = v26;
    v23[6] = v25;
    v23[7] = &v27;
    v23[8] = v5;
    -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v23, v11, v13, v15, v17);
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v26, 8);
  }
  if ([(PXCuratedLibrarySectionedLayout *)self prefersDominantHeroForZoomLevel:v5])
  {
    uint64_t v20 = [(PXCuratedLibrarySectionedLayout *)self _heroSectionLayoutClosestToSectionLayout:v28[5] zoomLevel:v5];
    if (v20) {
      objc_storeStrong(v28 + 5, v20);
    }
  }
  id v21 = v28[5];
  _Block_object_dispose(&v27, 8);

  return (PXAssetsSectionLayout *)v21;
}

void __56__PXCuratedLibrarySectionedLayout_dominantSectionLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v22 = a3;
  int64_t v5 = [v22 assetCollection];
  uint64_t v6 = v5;
  if (v5 && !PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v5, *(void *)(a1 + 64)))
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v22 contentSize];
    objc_msgSend(*(id *)(a1 + 32), "convertRect:fromDescendantLayout:", v22, v7, v8, v9, v10);
    double v15 = *(unsigned char *)(a1 + 72) ? -CGRectGetMaxY(*(CGRect *)&v11) : CGRectGetMinY(*(CGRect *)&v11);
    double v16 = round(v15);
    if (*(unsigned char *)(a1 + 72))
    {
      double v17 = [v6 endDate];
      [v17 timeIntervalSinceReferenceDate];
      double v19 = -v18;
    }
    else
    {
      double v17 = [v6 startDate];
      [v17 timeIntervalSinceReferenceDate];
      double v19 = v20;
    }

    double v21 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v16 < v21 || v16 == v21 && v19 < *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v16;
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v19;
    }
  }
}

void __56__PXCuratedLibrarySectionedLayout_dominantSectionLayout__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v17 = a3;
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v17 contentSize];
  objc_msgSend(*(id *)(a1 + 32), "convertRect:fromDescendantLayout:", v17, v4, v5, v6, v7);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v16 = [v17 assetCollection];
  if (v16
    && !PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v16, *(void *)(a1 + 64))
    && ([v17 referenceOptions] & 4) != 0)
  {
    v18.origin.x = v9;
    v18.origin.y = v11;
    v18.size.width = v13;
    v18.size.height = v15;
    CGRectContainsRect(*(CGRect *)(a1 + 72), v18);
  }
  PXRectShortestDistanceToPoint();
}

- (CGRect)sectionBoundariesForAssetCollectionReference:(id)a3
{
  uint64_t v16 = 0;
  int64_t v4 = [(PXCuratedLibrarySectionedLayout *)self sublayoutIndexForObjectReference:a3 options:0 updatedObjectReference:&v16];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v5 = *MEMORY[0x1E4F1DB20];
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    int64_t v9 = v4;
    id v10 = [(PXGLayout *)self sublayoutDataStore];
    CGFloat v11 = (double *)([v10 geometries] + 136 * v9);
    double v7 = v11[4];
    double v8 = v11[5];
    double v5 = v11[6];
    double v6 = v11[7];
  }
  double v12 = v5;
  double v13 = v6;
  double v14 = v7;
  double v15 = v8;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)enumerateHeroSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PXCuratedLibrarySectionedLayout_enumerateHeroSpritesInRect_usingBlock___block_invoke;
  v11[3] = &unk_1E5DC9168;
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  v11[4] = self;
  id v12 = v9;
  id v10 = v9;
  -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v11, x, y, width, height);
}

void __73__PXCuratedLibrarySectionedLayout_enumerateHeroSpritesInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  double v6 = [a3 bodyContentLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(*(id *)(a1 + 32), "convertRect:toDescendantLayout:", v6, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__PXCuratedLibrarySectionedLayout_enumerateHeroSpritesInRect_usingBlock___block_invoke_2;
    v17[3] = &unk_1E5DC9140;
    id v15 = *(id *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 32);
    id v19 = v15;
    v17[4] = v16;
    id v18 = v6;
    uint64_t v20 = a4;
    objc_msgSend(v18, "enumerateHeroSpritesInRect:usingBlock:", v17, v8, v10, v12, v14);
  }
}

uint64_t __73__PXCuratedLibrarySectionedLayout_enumerateHeroSpritesInRect_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = [*(id *)(a1 + 32) convertSpriteIndex:a2 fromDescendantLayout:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "convertRect:fromDescendantLayout:", *(void *)(a1 + 40), a4, a5, a6, a7);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned char *))(v13 + 16))(v13, v14, a3);
  if (*a3) {
    **(unsigned char **)(a1 + 56) = 1;
  }
  return result;
}

- (void)enumerateScrollablePagesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v7 = a4;
  double v8 = [(PXCuratedLibrarySectionedLayout *)self spec];
  int64_t v9 = [(PXCuratedLibrarySectionedLayout *)self presentedZoomLevel];
  switch(v9)
  {
    case 3:
      goto LABEL_16;
    case 2:
      double v10 = [(PXGCompositeLayout *)self composition];
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v22 = [MEMORY[0x1E4F28B00] currentHandler];
          int64x2_t v23 = (objc_class *)objc_opt_class();
          BOOL v24 = NSStringFromClass(v23);
          int64x2_t v25 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
          [v22 handleFailureInMethod:a2, self, @"PXCuratedLibrarySectionedLayout.m", 965, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.composition", v24, v25 object file lineNumber description];
        }
      }
      if (![v8 allowsPaginatedScrollingInYearsAndMonths]) {
        goto LABEL_18;
      }
      if (([v10 presentedSingleColumn] & 1) == 0)
      {
        v47[0] = 0;
        v47[1] = v47;
        v47[2] = 0x4010000000;
        v47[3] = &unk_1AB5D584F;
        long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
        long long v48 = *MEMORY[0x1E4F1DB20];
        long long v49 = v12;
        v46[0] = 0;
        v46[1] = v46;
        v46[2] = 0x2020000000;
        v46[3] = 0x7FFFFFFFFFFFFFFFLL;
        v44[0] = 0;
        v44[1] = v44;
        v44[2] = 0x2020000000;
        char v45 = 1;
        v42[0] = 0;
        v42[1] = v42;
        v42[2] = 0x2020000000;
        char v43 = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __82__PXCuratedLibrarySectionedLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke;
        aBlock[3] = &unk_1E5DC90C8;
        uint64_t v39 = v47;
        v40 = v42;
        id v38 = v7;
        v41 = v44;
        uint64_t v13 = _Block_copy(aBlock);
        uint64_t v14 = [(PXCuratedLibrarySectionedLayout *)self presentedDataSource];
        uint64_t v15 = [v14 identifier];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __82__PXCuratedLibrarySectionedLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke_2;
        v28[3] = &unk_1E5DC90F0;
        id v16 = v14;
        uint64_t v35 = v15;
        uint64_t v36 = 2;
        id v29 = v16;
        v31 = v47;
        id v32 = v46;
        uint64_t v33 = v44;
        id v17 = v13;
        id v30 = v17;
        uint64_t v34 = v42;
        [(PXCuratedLibrarySectionedLayout *)self enumerateSectionBoundariesWithOptions:a3 usingBlock:v28];
        v17[2](v17);

        _Block_object_dispose(v42, 8);
        _Block_object_dispose(v44, 8);
        _Block_object_dispose(v46, 8);
        _Block_object_dispose(v47, 8);
        goto LABEL_18;
      }

LABEL_16:
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __82__PXCuratedLibrarySectionedLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke_3;
      v26[3] = &unk_1E5DC9118;
      id v27 = v7;
      [(PXCuratedLibrarySectionedLayout *)self enumerateSectionBoundariesWithOptions:a3 usingBlock:v26];

      break;
    case 1:
      double v10 = [(PXGCompositeLayout *)self composition];
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v18 = [MEMORY[0x1E4F28B00] currentHandler];
          id v19 = (objc_class *)objc_opt_class();
          uint64_t v20 = NSStringFromClass(v19);
          double v21 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
          [v18 handleFailureInMethod:a2, self, @"PXCuratedLibrarySectionedLayout.m", 955, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.composition", v20, v21 object file lineNumber description];
        }
      }
      if ([v8 allowsPaginatedScrollingInYearsAndMonths])
      {
        uint64_t v11 = [v10 presentedNumberOfColumns];

        if (v11 != 1) {
          break;
        }
        goto LABEL_16;
      }
LABEL_18:

      break;
  }
}

__n128 __82__PXCuratedLibrarySectionedLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke(void *a1)
{
  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1[5] + 8) + 32)) && !*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    (*(void (**)(double, double, double, double))(a1[4] + 16))(*(double *)(*(void *)(a1[5] + 8) + 32), *(double *)(*(void *)(a1[5] + 8) + 40), *(double *)(*(void *)(a1[5] + 8) + 48), *(double *)(*(void *)(a1[5] + 8) + 56));
  }
  uint64_t v2 = *(void *)(a1[5] + 8);
  __n128 result = *(__n128 *)MEMORY[0x1E4F1DB20];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *(_OWORD *)(v2 + 32) = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)(v2 + 48) = v4;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  return result;
}

void __82__PXCuratedLibrarySectionedLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke_2(void *a1, uint64_t a2, char a3, unsigned char *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  id v16 = (void *)a1[4];
  v20[0] = a1[10];
  v20[1] = a2;
  int64x2_t v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  id v17 = [v16 assetCollectionAtSectionIndexPath:v20];
  if (PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v17, a1[11]))
  {
    (*(void (**)(void))(a1[5] + 16))();
    *a4 = *(unsigned char *)(*(void *)(a1[9] + 8) + 24);
  }
  else
  {
    v22.origin.double x = a5;
    v22.origin.double y = a6;
    v22.size.double width = a7;
    v22.size.double height = a8;
    *(CGRect *)(*(void *)(a1[6] + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(a1[6] + 8) + 32), v22);
    *(void *)(*(void *)(a1[7] + 8) + 24) = a2;
    uint64_t v18 = *(void *)(a1[8] + 8);
    if (*(unsigned char *)(v18 + 24)) {
      char v19 = a3;
    }
    else {
      char v19 = 0;
    }
    *(unsigned char *)(v18 + 24) = v19;
  }
}

uint64_t __82__PXCuratedLibrarySectionedLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateSectionBoundariesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(PXGLayout *)self sublayoutDataStore];
  uint64_t v8 = [v7 count];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PXCuratedLibrarySectionedLayout_enumerateSectionBoundariesWithOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E5DC9500;
  id v11 = v6;
  id v9 = v6;
  objc_msgSend(v7, "enumerateSublayoutGeometriesInRange:options:usingBlock:", 0, v8, a3, v10);
}

uint64_t __84__PXCuratedLibrarySectionedLayout_enumerateSectionBoundariesWithOptions_usingBlock___block_invoke(uint64_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, uint64_t a6, void *a7)
{
  a2.n128_u64[0] = a7[6];
  a3.n128_u64[0] = a7[7];
  a4.n128_u64[0] = a7[4];
  a5.n128_u64[0] = a7[5];
  return (*(uint64_t (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 32) + 16))(a2, a3, a4, a5);
}

- (void)enumerateAssetsSectionSublayoutsInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = [(PXGLayout *)self sublayoutDataStore];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__PXCuratedLibrarySectionedLayout_enumerateAssetsSectionSublayoutsInRect_usingBlock___block_invoke;
  v12[3] = &unk_1E5DC94D8;
  id v13 = v9;
  id v11 = v9;
  objc_msgSend(v10, "enumerateSublayoutsInRect:usingBlock:", v12, x, y, width, height);
}

void __85__PXCuratedLibrarySectionedLayout_enumerateAssetsSectionSublayoutsInRect_usingBlock___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  id v12 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(a2, a3, a4, a5);
  }
}

- (void)enumerateAssetsSectionSublayoutsUsingBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(PXGLayout *)self sublayoutDataStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PXCuratedLibrarySectionedLayout_enumerateAssetsSectionSublayoutsUsingBlock___block_invoke;
  v7[3] = &unk_1E5DC94B0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateSublayoutsUsingBlock:v7];
}

void __78__PXCuratedLibrarySectionedLayout_enumerateAssetsSectionSublayoutsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)layout:(id)a3 collectIndexesOfChapterHeaderSublayouts:(id)a4 heroSublayouts:(id)a5 inRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  int64_t location = a6.location;
  id v11 = a3;
  id v29 = a4;
  id v28 = a5;
  id v12 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
  id v13 = [v12 currentDataSource];

  uint64_t v14 = [v13 identifier];
  if (location < (uint64_t)(location + length))
  {
    uint64_t v15 = v14;
    id v27 = v11;
    v31 = 0;
    int64x2_t v30 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    unint64_t v16 = 0x1E4F39000uLL;
    id v17 = &OBJC_IVAR___PXActionProgressToast__secondaryLabel;
    do
    {
      v32[0] = v15;
      v32[1] = location;
      int64x2_t v33 = v30;
      uint64_t v18 = [v13 assetCollectionAtSectionIndexPath:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v19 = v18;
      }
      else {
        char v19 = 0;
      }
      uint64_t v20 = [v19 keyAssetObjectIDForKind];
      if (PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v18, *(uint64_t *)((char *)&self->super.super.super.isa + v17[55])))
      {
        [v29 addIndex:location];
        uint64_t v21 = v15;
        CGRect v22 = v13;
        int64x2_t v23 = self;
        BOOL v24 = v17;
        unint64_t v25 = v16;
        id v26 = v20;

        v31 = v26;
        unint64_t v16 = v25;
        id v17 = v24;
        self = v23;
        id v13 = v22;
        uint64_t v15 = v21;
      }
      else if ([v20 isEqual:v31])
      {
        [v28 addIndex:location];
      }

      ++location;
      --length;
    }
    while (length);

    id v11 = v27;
  }
}

- (BOOL)layout:(id)a3 shouldPreventFaultOutOfSublayout:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v18 = 0;
    goto LABEL_10;
  }
  id v6 = v5;
  if (self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems == *(void *)off_1E5DAAED8)
  {
    id v7 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
    id v8 = [v7 selectionSnapshot];

    id v9 = [v8 dataSource];
    self->_int64_t dataSourceIdentifierOfCachedSectionsWithSelectedItems = [v9 identifier];

    double v10 = [v8 selectedIndexPaths];
    id v11 = [v10 sectionsWithItemsForDataSourceIdentifier:self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems];
    cachedSectionsWithSelectedItems = self->_cachedSectionsWithSelectedItems;
    self->_cachedSectionsWithSelectedItems = v11;
  }
  id v13 = [v6 dataSource];
  uint64_t v14 = [v13 identifier];
  int64_t dataSourceIdentifierOfCachedSectionsWithSelectedItems = self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems;

  if (v14 != dataSourceIdentifierOfCachedSectionsWithSelectedItems) {
    goto LABEL_12;
  }
  uint64_t v16 = [v6 section];
  id v17 = self->_cachedSectionsWithSelectedItems;
  if (![(NSIndexSet *)v17 containsIndex:v16]
    && ![(NSIndexSet *)v17 containsIndex:v16 - 1]
    && ![(NSIndexSet *)v17 containsIndex:v16 + 1])
  {

LABEL_12:
    char v18 = [v6 hasPointReferences];
    goto LABEL_9;
  }

  char v18 = 1;
LABEL_9:

LABEL_10:
  return v18;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (void)_configureSectionLayout:(id)a3 atIndex:(int64_t)a4
{
  id v16 = a3;
  id v6 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
  [(PXCuratedLibrarySectionedLayout *)self defaultInterlayoutSpacing];
  objc_msgSend(v16, "setIntersectionSpacing:");
  objc_msgSend(v16, "setIsSelecting:", objc_msgSend(v6, "isSelecting"));
  id v7 = [v6 draggedAssetReferences];
  [v16 setDraggedAssetReferences:v7];

  id v8 = [v6 allowedActions];
  objc_msgSend(v16, "setCanStartSelecting:", objc_msgSend(v8, "containsObject:", @"PXCuratedLibraryActionEnterSelectMode"));

  if ([v6 zoomLevel] == 4) {
    int64_t v9 = self->_accumulatedSectionItems[a4];
  }
  else {
    int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [v16 setNumberOfPrecedingAssets:v9];
  double v10 = [v16 dataSource];
  uint64_t v11 = [v10 identifier];
  id v12 = [v6 selectionSnapshot];
  id v13 = [v12 dataSource];
  uint64_t v14 = [v13 identifier];

  if (v11 == v14)
  {
    uint64_t v15 = [v6 selectionSnapshot];
  }
  else
  {
    uint64_t v15 = 0;
  }
  [v16 setSelectionSnapshot:v15];
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  id v6 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
  id v7 = [v6 currentDataSource];
  uint64_t v8 = [v7 numberOfItemsInSection:a4];

  if (!v8)
  {
    int64_t v9 = [v6 assetsDataSourceManager];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __65__PXCuratedLibrarySectionedLayout_layout_createSublayoutAtIndex___block_invoke;
    v19[3] = &__block_descriptor_40_e58_v16__0___PXCuratedLibraryMutableAssetsDataSourceManager__8l;
    v19[4] = a4;
    [v9 performChanges:v19];
  }
  double v10 = [PXAssetsSectionLayout alloc];
  currentDataSource = self->_currentDataSource;
  id v12 = [v6 actionManager];
  id v13 = [v6 videoPlaybackController];
  int64_t currentZoomLevel = self->_currentZoomLevel;
  uint64_t v15 = [(PXCuratedLibrarySectionedLayout *)self spec];
  id v16 = [v15 sectionLayoutSpec];
  id v17 = [(PXAssetsSectionLayout *)v10 initWithSection:a4 dataSource:currentDataSource actionManager:v12 loadingStatusManager:0 assetImportStatusManager:0 inlinePlaybackController:v13 zoomLevel:currentZoomLevel spec:v16];

  [(PXCuratedLibrarySectionedLayout *)self _configureSectionLayout:v17 atIndex:a4];
  return v17;
}

void __65__PXCuratedLibrarySectionedLayout_layout_createSublayoutAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28D60];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 indexSetWithIndex:v3];
  [v4 forceAccurateSectionsIfNeeded:v5];
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  currentDataSource = self->_currentDataSource;
  v22[0] = [(PXAssetsDataSource *)currentDataSource identifier];
  v22[1] = a4;
  int64x2_t v23 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  double v10 = [(PXAssetsDataSource *)currentDataSource assetCollectionAtSectionIndexPath:v22];
  uint64_t v11 = [v10 estimatedAssetCount];
  uint64_t v12 = [(PXAssetsDataSource *)self->_currentDataSource hasCurationForAssetCollection:v10];
  int64_t currentZoomLevel = self->_currentZoomLevel;
  uint64_t v14 = [(PXCuratedLibrarySectionedLayout *)self spec];
  uint64_t v15 = [v14 sectionLayoutSpec];
  +[PXAssetsSectionLayout estimatedSizeWithReferenceSize:assetCollection:numberOfAssets:isCurated:zoomLevel:spec:](PXAssetsSectionLayout, "estimatedSizeWithReferenceSize:assetCollection:numberOfAssets:isCurated:zoomLevel:spec:", v10, v11, v12, currentZoomLevel, v15, width, height);
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v8 = a3;
  if ((void *)PXCuratedLibraryViewModelObserverContext_237391 != a5) {
    goto LABEL_44;
  }
  if ((v6 & 0x10) != 0)
  {
    if (self->_isUpdatingSublayouts)
    {
      [(PXCuratedLibrarySectionedLayout *)self _updateSublayoutsDataSource];
      goto LABEL_13;
    }
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_10:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
LABEL_11:
        if (([(PXAssetsDataSource *)self->_currentDataSource areAllSectionsConsideredAccurate] & 1) == 0)[(PXGLayout *)self setNeedsUpdate]; {
        goto LABEL_13;
        }
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 2;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_11;
    }
    if ((self->_updateFlags.updated & 2) != 0)
    {
      id v26 = [MEMORY[0x1E4F28B00] currentHandler];
      id v27 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout observable:didChange:context:]"];
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"PXCuratedLibrarySectionedLayout.m", 770, @"invalidating %lu after it already has been updated", 2);
      goto LABEL_60;
    }
    goto LABEL_10;
  }
LABEL_13:
  if ((v6 & 4) == 0) {
    goto LABEL_21;
  }
  uint64_t v11 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
  uint64_t v12 = [v11 zoomLevel];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __64__PXCuratedLibrarySectionedLayout_observable_didChange_context___block_invoke;
  v28[3] = &__block_descriptor_40_e38_v32__0q8__PXAssetsSectionLayout_16_B24l;
  void v28[4] = v12;
  [(PXCuratedLibrarySectionedLayout *)self enumerateAssetsSectionSublayoutsUsingBlock:v28];
  id v13 = &self->_updateFlags;
  unint64_t v14 = self->_updateFlags.needsUpdate;
  if (!v14)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL v22 = self->_updateFlags.willPerformUpdate;
      v13->unint64_t needsUpdate = 4;
      if (!v22) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_18:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      id v26 = [MEMORY[0x1E4F28B00] currentHandler];
      id v27 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout observable:didChange:context:]"];
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"PXCuratedLibrarySectionedLayout.m", 786, @"invalidating %lu after it already has been updated", 4);
      goto LABEL_60;
    }
  }
  v13->unint64_t needsUpdate = v14 | 4;
LABEL_20:
  [(PXGLayout *)self setNeedsUpdate];
LABEL_21:
  if ((*(void *)&v6 & 0x210009) == 0) {
    goto LABEL_28;
  }
  uint64_t v15 = &self->_updateFlags;
  unint64_t v16 = self->_updateFlags.needsUpdate;
  if (v16)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_27:
      v15->unint64_t needsUpdate = v16 | 8;
      goto LABEL_28;
    }
LABEL_26:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      id v26 = [MEMORY[0x1E4F28B00] currentHandler];
      id v27 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout observable:didChange:context:]"];
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"PXCuratedLibrarySectionedLayout.m", 798, @"invalidating %lu after it already has been updated", 8);
      goto LABEL_60;
    }
    goto LABEL_27;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_26;
  }
  BOOL v21 = self->_updateFlags.willPerformUpdate;
  v15->unint64_t needsUpdate = 8;
  if (!v21) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_28:
  if ((v6 & 0x200) == 0) {
    goto LABEL_35;
  }
  double v17 = &self->_updateFlags;
  unint64_t v18 = self->_updateFlags.needsUpdate;
  if (v18)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_34:
      v17->unint64_t needsUpdate = v18 | 0x10;
      goto LABEL_35;
    }
LABEL_33:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      id v26 = [MEMORY[0x1E4F28B00] currentHandler];
      id v27 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout observable:didChange:context:]"];
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"PXCuratedLibrarySectionedLayout.m", 802, @"invalidating %lu after it already has been updated", 16);
      goto LABEL_60;
    }
    goto LABEL_34;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_33;
  }
  BOOL v23 = self->_updateFlags.willPerformUpdate;
  v17->unint64_t needsUpdate = 16;
  if (!v23) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_35:
  if ((v6 & 8) != 0) {
    self->_int64_t dataSourceIdentifierOfCachedSectionsWithSelectedItems = *(void *)off_1E5DAAED8;
  }
  if ((v6 & 0x800) != 0)
  {
    double v19 = &self->_updateFlags;
    unint64_t v20 = self->_updateFlags.needsUpdate;
    if (v20)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
    if (self->_updateFlags.isPerformingUpdate)
    {
LABEL_42:
      if ((self->_updateFlags.updated & 0x40) == 0)
      {
LABEL_43:
        v19->unint64_t needsUpdate = v20 | 0x40;
        goto LABEL_44;
      }
      id v26 = [MEMORY[0x1E4F28B00] currentHandler];
      id v27 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout observable:didChange:context:]"];
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"PXCuratedLibrarySectionedLayout.m", 810, @"invalidating %lu after it already has been updated", 64);
LABEL_60:

      abort();
    }
    BOOL v24 = self->_updateFlags.willPerformUpdate;
    v19->unint64_t needsUpdate = 64;
    if (!v24) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_44:
}

uint64_t __64__PXCuratedLibrarySectionedLayout_observable_didChange_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setTargetZoomLevel:*(void *)(a1 + 32)];
}

- (id)assetsIteratorForContentInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__PXCuratedLibrarySectionedLayout_assetsIteratorForContentInRect___block_invoke;
  v15[3] = &unk_1E5DC9348;
  v15[4] = self;
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  id v9 = v8;
  id v16 = v9;
  -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v15, x, y, width, height);
  if ([v9 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PXCuratedLibrarySectionedLayout_assetsIteratorForContentInRect___block_invoke_2;
    aBlock[3] = &unk_1E5DC9410;
    id v14 = v9;
    double v10 = _Block_copy(aBlock);
  }
  else
  {
    double v10 = 0;
  }
  uint64_t v11 = _Block_copy(v10);

  return v11;
}

void __66__PXCuratedLibrarySectionedLayout_assetsIteratorForContentInRect___block_invoke(double *a1, uint64_t a2, void *a3)
{
  id v4 = (void *)*((void *)a1 + 4);
  double v5 = a1[6];
  double v6 = a1[7];
  double v7 = a1[8];
  double v8 = a1[9];
  id v9 = a3;
  objc_msgSend(v4, "convertRect:toDescendantLayout:", v9, v5, v6, v7, v8);
  aBlock = objc_msgSend(v9, "assetsIteratorForContentInRect:");

  double v10 = aBlock;
  if (aBlock)
  {
    uint64_t v11 = (void *)*((void *)a1 + 5);
    uint64_t v12 = _Block_copy(aBlock);
    [v11 addObject:v12];

    double v10 = aBlock;
  }
}

void __66__PXCuratedLibrarySectionedLayout_assetsIteratorForContentInRect___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PXCuratedLibrarySectionedLayout_assetsIteratorForContentInRect___block_invoke_3;
  v6[3] = &unk_1E5DC93E8;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

uint64_t __66__PXCuratedLibrarySectionedLayout_assetsIteratorForContentInRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__PXCuratedLibrarySectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke;
  v15[3] = &unk_1E5DC9348;
  v15[4] = self;
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  id v9 = v8;
  id v16 = v9;
  -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v15, x, y, width, height);
  if ([v9 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__PXCuratedLibrarySectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke_2;
    aBlock[3] = &unk_1E5DC93C0;
    id v14 = v9;
    double v10 = _Block_copy(aBlock);
  }
  else
  {
    double v10 = 0;
  }
  uint64_t v11 = _Block_copy(v10);

  return v11;
}

void __76__PXCuratedLibrarySectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke(double *a1, uint64_t a2, void *a3)
{
  id v4 = (void *)*((void *)a1 + 4);
  double v5 = a1[6];
  double v6 = a1[7];
  double v7 = a1[8];
  double v8 = a1[9];
  id v9 = a3;
  objc_msgSend(v4, "convertRect:toDescendantLayout:", v9, v5, v6, v7, v8);
  aBlock = objc_msgSend(v9, "assetCollectionsIteratorForContentInRect:");

  double v10 = aBlock;
  if (aBlock)
  {
    uint64_t v11 = (void *)*((void *)a1 + 5);
    uint64_t v12 = _Block_copy(aBlock);
    [v11 addObject:v12];

    double v10 = aBlock;
  }
}

void __76__PXCuratedLibrarySectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__PXCuratedLibrarySectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke_3;
  v6[3] = &unk_1E5DC9078;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

uint64_t __76__PXCuratedLibrarySectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (id)locationNamesFutureForContentInRect:(CGRect)a3
{
  return 0;
}

- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__PXCuratedLibrarySectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke;
  v17[3] = &unk_1E5DC9348;
  v17[4] = self;
  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  id v10 = v9;
  id v18 = v10;
  -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v17, x, y, width, height);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PXCuratedLibrarySectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke_2;
  aBlock[3] = &unk_1E5DC9320;
  id v16 = v10;
  id v11 = v10;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = (void *)[v12 copy];

  return v13;
}

void __75__PXCuratedLibrarySectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke(double *a1, uint64_t a2, void *a3)
{
  id v4 = (void *)*((void *)a1 + 4);
  double v5 = a1[6];
  double v6 = a1[7];
  double v7 = a1[8];
  double v8 = a1[9];
  id v9 = a3;
  objc_msgSend(v4, "convertRect:toDescendantLayout:", v9, v5, v6, v7, v8);
  aBlock = objc_msgSend(v9, "dateIntervalFutureForContentInRect:type:", 0);

  id v10 = aBlock;
  if (aBlock)
  {
    id v11 = (void *)*((void *)a1 + 5);
    uint64_t v12 = _Block_copy(aBlock);
    [v11 addObject:v12];

    id v10 = aBlock;
  }
}

id __75__PXCuratedLibrarySectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = 0;
    id v5 = 0;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      double v8 = v4;
      id v9 = v5;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v1);
        }
        id v10 = (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v7) + 16))();
        id v13 = v8;
        id v14 = v9;
        objc_msgSend(MEMORY[0x1E4F1C9C8], "px_unionStartDate:endDate:withDateInterval:", &v14, &v13, v10);
        id v5 = v14;

        id v4 = v13;
        ++v7;
        double v8 = v4;
        id v9 = v5;
      }
      while (v3 != v7);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);

    id v11 = 0;
    if (v5 && v4) {
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v4];
    }
  }
  else
  {

    id v5 = 0;
    id v4 = 0;
    id v11 = 0;
  }

  return v11;
}

- (void)setDominantHeroPreferences:(id)a3
{
  id v4 = (NSMutableIndexSet *)[a3 mutableCopy];
  zoomLevelsPreferringDominantHeros = self->_zoomLevelsPreferringDominantHeros;
  self->_zoomLevelsPreferringDominantHeros = v4;
}

- (id)dominantHeroPreferences
{
  uint64_t v2 = (void *)[(NSMutableIndexSet *)self->_zoomLevelsPreferringDominantHeros copy];
  return v2;
}

- (void)setPrefersDominantHero:(BOOL)a3 forZoomLevel:(int64_t)a4
{
  zoomLevelsPreferringDominantHeros = self->_zoomLevelsPreferringDominantHeros;
  if (a3)
  {
    if (!zoomLevelsPreferringDominantHeros)
    {
      uint64_t v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
      double v8 = self->_zoomLevelsPreferringDominantHeros;
      self->_zoomLevelsPreferringDominantHeros = v7;

      zoomLevelsPreferringDominantHeros = self->_zoomLevelsPreferringDominantHeros;
    }
    [(NSMutableIndexSet *)zoomLevelsPreferringDominantHeros addIndex:a4];
  }
  else
  {
    [(NSMutableIndexSet *)zoomLevelsPreferringDominantHeros removeIndex:a4];
  }
}

- (BOOL)prefersDominantHeroForZoomLevel:(int64_t)a3
{
  return [(NSMutableIndexSet *)self->_zoomLevelsPreferringDominantHeros containsIndex:a3];
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibrarySectionedLayout;
  -[PXGLayout setSafeAreaInsets:](&v9, sel_setSafeAreaInsets_, a3.top, a3.left, a3.bottom, a3.right);
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      double v8 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout setSafeAreaInsets:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXCuratedLibrarySectionedLayout.m", 654, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)setLateralMargin:(double)a3
{
  if (self->_lateralMargin != a3)
  {
    self->_lateralMargin = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout setLateralMargin:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibrarySectionedLayout.m", 649, @"invalidating %lu after it already has been updated", 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 4;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setSpec:(id)a3
{
  id v5 = (PXCuratedLibraryLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    id v11 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_10:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 5;
        goto LABEL_11;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 5;
      id v5 = v11;
      if (willPerformUpdate) {
        goto LABEL_2;
      }
      [(PXGLayout *)self setNeedsUpdate];
LABEL_11:
      id v5 = v11;
      goto LABEL_2;
    }
    if ((self->_updateFlags.updated & 5) != 0)
    {
      objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
      id v10 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout setSpec:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"PXCuratedLibrarySectionedLayout.m", 641, @"invalidating %lu after it already has been updated", 5);

      abort();
    }
    goto LABEL_10;
  }
LABEL_2:
}

- (id)layoutSnapshotDataSource
{
  return self->_currentDataSource;
}

- (BOOL)allowsSublayoutUpdateCycleAssertions
{
  return 0;
}

- (BOOL)allowsDanglingUpdatesAssertions
{
  return 0;
}

- (int64_t)scrollableAxis
{
  return 1;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [(PXCuratedLibrarySectionedLayout *)self presentedDataSource];
    if (a4 & 2) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v11 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
      uint64_t v12 = -[PXCuratedLibrarySectionedLayout _targetAssetCollectionReferenceInZoomLevel:forTransitionFromAssetCollectionReference:](self, "_targetAssetCollectionReferenceInZoomLevel:forTransitionFromAssetCollectionReference:", [v11 zoomLevel], v9);
    }
    else
    {
      if (a4) {
        [v10 objectReferenceNearestToObjectReference:v9];
      }
      else {
      uint64_t v12 = [v10 objectReferenceForObjectReference:v9];
      }
    }
    *(_OWORD *)buf = 0u;
    long long v31 = 0u;
    if (v12)
    {
      [v12 indexPath];
      uint64_t v17 = *(void *)buf;
    }
    else
    {
      uint64_t v17 = 0;
    }
    if (v17 == *(void *)off_1E5DAAED8)
    {
      int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      id v15 = v9;
    }
    else
    {
      int64_t v14 = *(void *)&buf[8];
      if (*(void *)&buf[8] == 0x7FFFFFFFFFFFFFFFLL || (void)v31 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v15 = v12;
      }
      else
      {
        long long v18 = [(PXGLayout *)self sublayoutAtIndex:*(void *)&buf[8] loadIfNeeded:0];
        id v15 = [v18 assetCollectionReference];

        id v9 = v18;
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v26 = 0;
      id v27 = &v26;
      uint64_t v28 = 0x2020000000;
      uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&long long v31 = 0x3032000000;
      *((void *)&v31 + 1) = __Block_byref_object_copy__237370;
      id v32 = __Block_byref_object_dispose__237371;
      id v33 = 0;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      void v22[2] = __99__PXCuratedLibrarySectionedLayout_sublayoutIndexForObjectReference_options_updatedObjectReference___block_invoke;
      v22[3] = &unk_1E5DC9050;
      id v13 = v9;
      id v23 = v13;
      BOOL v24 = &v26;
      unint64_t v25 = buf;
      [(PXCuratedLibrarySectionedLayout *)self enumerateAssetsSectionSublayoutsUsingBlock:v22];
      int64_t v14 = v27[3];
      id v15 = *(id *)(*(void *)&buf[8] + 40);

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v26, 8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        PXAssertGetLog();
      }
      long long v16 = [v9 decoratedSpriteReference];
      int64_t v14 = [(PXGLayout *)self sublayoutIndexForSpriteReference:v16 options:a4];

      id v15 = v9;
    }
  }
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v19 = PLUIGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v15;
      _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEBUG, "library layout couldn't find a match for %@", buf, 0xCu);
    }
    int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (v14 < [(PXGLayout *)self numberOfSublayouts]) {
      goto LABEL_31;
    }
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXCuratedLibrarySectionedLayout.m", 600, @"sublayoutIndex %li out of bounds (0..%li) for object reference %@", v14, [(PXGLayout *)self numberOfSublayouts] - 1, v15 object file lineNumber description];
  }

LABEL_31:
  id v20 = v15;
  *a5 = v20;

  return v14;
}

void __99__PXCuratedLibrarySectionedLayout_sublayoutIndexForObjectReference_options_updatedObjectReference___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v15 = a3;
  id v7 = [v15 showAllActionPerformer];
  id v8 = *(id *)(a1 + 32);
  if (v7 == v8)
  {

    goto LABEL_5;
  }
  id v9 = v8;
  int v10 = [v7 isEqual:v8];

  id v11 = v15;
  if (v10)
  {
LABEL_5:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    uint64_t v12 = [v15 showAllActionPerformer];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    int64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    id v11 = v15;
    *a4 = 1;
  }
}

- (void)clearLastVisibleAreaAnchoringInformation
{
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibrarySectionedLayout;
  [(PXGLayout *)&v3 clearLastVisibleAreaAnchoringInformation];
  [(PXCuratedLibrarySectionedLayout *)self setLastHitSpriteReference:0];
}

- (void)setLastHitSpriteReference:(id)a3
{
  id v5 = (PXGSpriteReference *)a3;
  if (self->_lastHitSpriteReference != v5)
  {
    uint64_t v6 = v5;
    if (v5) {
      [(PXCuratedLibrarySectionedLayout *)self clearLastVisibleAreaAnchoringInformation];
    }
    objc_storeStrong((id *)&self->_lastHitSpriteReference, a3);
    id v5 = v6;
  }
}

- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  id v5 = [(PXCuratedLibrarySectionedLayout *)self dominantSectionLayout];
  if (v5)
  {
    char v7 = 0;
    v4[2](v4, v5, &v7);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXCuratedLibrarySectionedLayout;
    [(PXGLayout *)&v6 enumerateVisibleAnchoringLayoutsUsingBlock:v4];
  }
}

- (void)_anchorVisibleArea
{
  id v4 = [(PXGLayout *)self rootLayout];
  uint64_t v2 = [v4 createAnchorForVisibleArea];
  id v3 = (id)[v2 autoInvalidate];
}

- (void)_updatePreheating
{
  id v3 = +[PXZoomablePhotosSettings sharedInstance];
  if ([v3 preheatThumbnailsWhenIdle])
  {
    id v4 = [(PXGLayout *)self mediaProvider];
    id v5 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
    uint64_t v6 = [v5 scrollRegime];

    if (!v6)
    {
      uint64_t v27 = 0;
      uint64_t v28 = &v27;
      uint64_t v29 = 0x2020000000;
      uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
      [(PXGLayout *)self visibleRect];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __52__PXCuratedLibrarySectionedLayout__updatePreheating__block_invoke;
      v26[3] = &unk_1E5DC9438;
      void v26[4] = &v27;
      -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v26);
      char v7 = self->_currentDataSource;
      id v8 = v7;
      uint64_t v9 = v28[3];
      if (v9 != 0x7FFFFFFFFFFFFFFFLL && v9 < [(PXAssetsDataSource *)v7 numberOfSections])
      {
        NSUInteger v10 = [(PXAssetsDataSource *)v8 numberOfSections];
        uint64_t v11 = v28[3];
        if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        {
          double v21 = [MEMORY[0x1E4F28B00] currentHandler];
          double v22 = objc_msgSend(NSString, "stringWithUTF8String:", "NSRange PXRangeWithMidLocationAndPadding(NSInteger, NSInteger)");
          [v21 handleFailureInFunction:v22, @"NSRange+PhotosUIFoundation.h", 53, @"Invalid parameter not satisfying: %@", @"midLocation != NSNotFound" file lineNumber description];
        }
        uint64_t v12 = 100;
        if (v11 > 100) {
          uint64_t v12 = v11;
        }
        v31.NSUInteger location = v12 - 100;
        v31.NSUInteger length = v11 - v12 + 201;
        v32.NSUInteger location = 0;
        v32.NSUInteger length = v10;
        NSRange v13 = NSIntersectionRange(v31, v32);
        NSUInteger length = v13.length;
        if (v13.length)
        {
          NSUInteger location = v13.location;
          uint64_t v16 = [(PXAssetsDataSource *)v8 identifier];
          uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v13.length];
          if (location < location + v13.length)
          {
            uint64_t v18 = 0;
            int64x2_t v23 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
            do
            {
              v24[0] = v16;
              v24[1] = location;
              int64x2_t v25 = v23;
              double v19 = [(PXAssetsDataSource *)v8 assetsInSectionIndexPath:v24];
              if ([v19 count] >= 1)
              {
                [v17 addObject:v19];
                if (location == v28[3]) {
                  [v19 count];
                }
                v18 += [v19 count];
              }

              ++location;
              --length;
            }
            while (length);
          }
          PXDisplayAssetFetchResultFromFetchResults();
        }
      }

      _Block_object_dispose(&v27, 8);
    }
    [v4 masterThumbnailSize];
    [v4 preheatThumbnailDataForAssets:0 origin:0 targetSize:v20 + 1.0];
  }
}

uint64_t __52__PXCuratedLibrarySectionedLayout__updatePreheating__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

- (void)_updateSublayoutsForSkimming
{
  id v3 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
  id v4 = [v3 skimmingInfo];
  if ([v4 childCollectionsZoomLevel])
  {
    id v5 = [v4 parentAssetCollection];
    if (v5
      && (([v4 touchInteractionStarted] & 1) != 0 || objc_msgSend(v4, "slideshowStarted")))
    {
      id v6 = objc_alloc((Class)off_1E5DA55C0);
      long long v7 = *((_OWORD *)off_1E5DAB028 + 1);
      v20[0] = *(_OWORD *)off_1E5DAB028;
      v20[1] = v7;
      id v8 = (void *)[v6 initWithSectionObject:v5 itemObject:0 subitemObject:0 indexPath:v20];
      presentedDataSource = self->_presentedDataSource;
      if (presentedDataSource)
      {
        [(PXAssetsDataSource *)presentedDataSource indexPathForAssetCollectionReference:v8];
        uint64_t v10 = *((void *)&v18 + 1);
      }
      else
      {
        uint64_t v10 = 0;
        long long v18 = 0u;
        long long v19 = 0u;
      }
    }
    else
    {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__PXCuratedLibrarySectionedLayout__updateSublayoutsForSkimming__block_invoke;
  v13[3] = &unk_1E5DC9028;
  id v14 = v4;
  id v15 = v3;
  uint64_t v16 = self;
  uint64_t v17 = v10;
  id v11 = v3;
  id v12 = v4;
  [(PXCuratedLibrarySectionedLayout *)self enumerateAssetsSectionSublayoutsUsingBlock:v13];
}

void __63__PXCuratedLibrarySectionedLayout__updateSublayoutsForSkimming__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (*(void *)(a1 + 56) == a2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v7 = *(void **)(a1 + 32);
    if (v7) {
      [v7 currentChildCollectionIndexPath];
    }
    [v6 setIsSkimming:1];
    id v8 = [*(id *)(a1 + 32) childCollectionsIndexes];
    [v6 setSkimmingIndexPaths:v8];

    objc_msgSend(v6, "setShowsSkimmingSlideshow:", objc_msgSend(*(id *)(a1 + 32), "slideshowStarted"));
    objc_msgSend(v6, "setShowsSkimmingInteraction:", objc_msgSend(*(id *)(a1 + 32), "touchInteractionStarted"));
    uint64_t v9 = [*(id *)(a1 + 32) childCollectionsIndexes];
    uint64_t v10 = [v9 count];

    if (v10 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    [v6 setMaxSkimmingIndex:v11 - 1];
    uint64_t v20 = 0;
    double v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    id v12 = [*(id *)(a1 + 32) childCollectionsIndexes];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    long long v18 = v24;
    long long v19 = v25;
    v17[2] = __63__PXCuratedLibrarySectionedLayout__updateSublayoutsForSkimming__block_invoke_2;
    v17[3] = &unk_1E5DC9000;
    v17[4] = &v20;
    [v12 enumerateSectionIndexPathsUsingBlock:v17];

    [v6 setCurrentSkimmingIndex:v21[3]];
    NSRange v13 = [*(id *)(a1 + 40) assetsDataSourceManager];
    id v14 = objc_msgSend(v13, "dataSourceForZoomLevel:", objc_msgSend(*(id *)(a1 + 32), "childCollectionsZoomLevel"));

    if (*((void *)&v24 + 1) == *((void *)off_1E5DAB028 + 1))
    {
      BOOL v15 = 0;
    }
    else
    {
      uint64_t v16 = v24;
      BOOL v15 = v16 == [v14 identifier];
    }
    if ([*(id *)(a1 + 32) slideshowStarted])
    {
      if (!v15) {
        goto LABEL_16;
      }
    }
    else if (([*(id *)(a1 + 32) touchInteractionStarted] & v15 & 1) == 0)
    {
LABEL_16:

      _Block_object_dispose(&v20, 8);
      goto LABEL_17;
    }
    [v6 setDataSource:v14 section:*((void *)&v24 + 1)];
    goto LABEL_16;
  }
  [v5 setDataSource:*(void *)(*(void *)(a1 + 48) + 1016) section:a2];
  [v6 setIsSkimming:0];
  [v6 setShowsSkimmingSlideshow:0];
  [v6 setShowsSkimmingInteraction:0];
  [v6 setMaxSkimmingIndex:0];
  [v6 setCurrentSkimmingIndex:0x7FFFFFFFFFFFFFFFLL];
LABEL_17:
}

uint64_t __63__PXCuratedLibrarySectionedLayout__updateSublayoutsForSkimming__block_invoke_2(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(a2 + 8) == *(void *)(result + 48)) {
    *a3 = 1;
  }
  else {
    ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

- (void)_prepareAccumulatedSectionItemsBufferForSections:(int64_t)a3
{
  if (self->_accumulatedSectionItemsCount < a3) {
    _PXGArrayResize();
  }
}

- (void)_updateSublayoutsDataSource
{
  id v4 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
  id v5 = [v4 assetsDataSourceManager];

  p_currentDataSource = &self->_currentDataSource;
  long long v7 = self->_currentDataSource;
  id v8 = [v5 dataSource];
  if (v7 != v8)
  {
    uint64_t v9 = [v5 zoomLevel];
    if (v9 != 4)
    {
      int64_t v10 = v9;
      uint64_t v11 = [(PXGLayout *)self sublayoutDataStore];
      uint64_t v12 = [(PXAssetsDataSource *)v7 numberOfSections];
      long long v48 = v11;
      if (v12 != [v11 count])
      {
        v37 = [MEMORY[0x1E4F28B00] currentHandler];
        [v37 handleFailureInMethod:a2, self, @"PXCuratedLibrarySectionedLayout.m", 363, @"Invalid parameter not satisfying: %@", @"numberOfSublayoutsBefore == sublayoutDataStore.count" object file lineNumber description];
      }
      NSRange v13 = [v5 changeHistory];
      id v14 = objc_msgSend(v13, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", -[PXAssetsDataSource identifier](v7, "identifier"), -[PXAssetsDataSource identifier](v8, "identifier"));

      BOOL v15 = "TTRWorkflowBuilder";
      long long v49 = v5;
      v50 = v14;
      if (self->_isUpdatingSublayouts)
      {
        if ([v14 count] != 1)
        {
          id v38 = [MEMORY[0x1E4F28B00] currentHandler];
          [v38 handleFailureInMethod:a2, self, @"PXCuratedLibrarySectionedLayout.m", 373, @"While updating sublayouts, expecting only one data source change, got %lu", objc_msgSend(v14, "count") object file lineNumber description];
        }
        [v14 firstObject];
        v17 = SEL v16 = a2;
        long long v18 = [v17 sectionsWithItemChanges];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __62__PXCuratedLibrarySectionedLayout__updateSublayoutsDataSource__block_invoke;
        v63[3] = &unk_1E5DC9550;
        v63[4] = self;
        v63[5] = v16;
        SEL v51 = v16;
        [v18 enumerateIndexesUsingBlock:v63];

        long long v19 = [v17 sectionChanges];
        if (([v19 hasIncrementalChanges] & 1) == 0)
        {
          uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
          [v39 handleFailureInMethod:v51 object:self file:@"PXCuratedLibrarySectionedLayout.m" lineNumber:379 description:@"Section changes while updating sublayouts must be incremental."];
        }
        uint64_t v20 = [v19 insertedIndexes];
        uint64_t v21 = [v20 count];

        if (v21)
        {
          v40 = [MEMORY[0x1E4F28B00] currentHandler];
          v41 = [v19 insertedIndexes];
          [v40 handleFailureInMethod:v51, self, @"PXCuratedLibrarySectionedLayout.m", 380, @"Sections %@ inserted while updating sublayouts, this is not supported.", v41 object file lineNumber description];
        }
        uint64_t v22 = [v19 removedIndexes];
        uint64_t v23 = [v22 count];

        if (v23)
        {
          id v42 = [MEMORY[0x1E4F28B00] currentHandler];
          char v43 = [v19 removedIndexes];
          [v42 handleFailureInMethod:v51, self, @"PXCuratedLibrarySectionedLayout.m", 381, @"Sections %@ removed while updating sublayouts, this is not supported.", v43 object file lineNumber description];
        }
        id v14 = v50;
        BOOL v15 = "TTRWorkflowBuilder";
      }
      else
      {
        id v24 = [(PXGLayout *)self createCuratedLibraryLayoutAnimationIfNeededWithContext:1];
        [(PXCuratedLibrarySectionedLayout *)self _anchorVisibleArea];
      }
      objc_storeStrong((id *)&self->_currentDataSource, v8);
      self->_int64_t currentZoomLevel = v10;
      id v61 = 0;
      id v62 = 0;
      v58[0] = MEMORY[0x1E4F143A8];
      uint64_t v25 = *((void *)v15 + 415);
      v58[1] = v25;
      v58[2] = __62__PXCuratedLibrarySectionedLayout__updateSublayoutsDataSource__block_invoke_2;
      v58[3] = &unk_1E5DC9578;
      v59 = v7;
      uint64_t v26 = v8;
      v60 = v26;
      [(PXGLayout *)self applySectionedChangeDetails:v14 dataSourceBeforeChanges:v59 dataSourceAfterChanges:v26 sublayoutProvider:self outChangedSections:&v62 outSectionsWithItemChanges:&v61 changeMediaVersionHandler:v58];
      id v27 = v62;
      id v28 = v61;
      [(PXGLayout *)self invalidateVersion];
      v47 = v27;
      [v27 enumerateIndexesUsingBlock:&__block_literal_global_237435];
      v46 = v28;
      [v28 enumerateIndexesUsingBlock:&__block_literal_global_261_237436];
      uint64_t v29 = [(PXAssetsDataSource *)*p_currentDataSource numberOfSections];
      [(PXCuratedLibrarySectionedLayout *)self _prepareAccumulatedSectionItemsBufferForSections:v29];
      if (v29 >= 1)
      {
        uint64_t v30 = 0;
        int64_t v31 = 0;
        int64x2_t v52 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        do
        {
          self->_accumulatedSectionItems[v30] = v31;
          NSRange v32 = *p_currentDataSource;
          v56[0] = [(PXAssetsDataSource *)*p_currentDataSource identifier];
          v56[1] = v30;
          int64x2_t v57 = v52;
          v31 += [(PXAssetsDataSource *)v32 estimatedAssetCountForSectionIndexPath:v56];
          ++v30;
        }
        while (v29 != v30);
      }
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = v25;
      v53[2] = __62__PXCuratedLibrarySectionedLayout__updateSublayoutsDataSource__block_invoke_5;
      v53[3] = &unk_1E5DC8FD8;
      v54 = v26;
      v55 = self;
      [(PXCuratedLibrarySectionedLayout *)self enumerateAssetsSectionSublayoutsUsingBlock:v53];
      p_updateFlags = &self->_updateFlags;
      unint64_t needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        id v5 = v49;
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_24:
          p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x5D;
          uint64_t v35 = v50;
LABEL_25:

          goto LABEL_26;
        }
      }
      else
      {
        id v5 = v49;
        if (!self->_updateFlags.isPerformingUpdate)
        {
          BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
          p_updateFlags->unint64_t needsUpdate = 93;
          uint64_t v35 = v50;
          if (!willPerformUpdate) {
            [(PXGLayout *)self setNeedsUpdate];
          }
          goto LABEL_25;
        }
      }
      if ((self->_updateFlags.updated & 0x5D) != 0)
      {
        v44 = [MEMORY[0x1E4F28B00] currentHandler];
        char v45 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout _updateSublayoutsDataSource]"];
        objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"PXCuratedLibrarySectionedLayout.m", 426, @"invalidating %lu after it already has been updated", 93);

        abort();
      }
      goto LABEL_24;
    }
  }
LABEL_26:
}

void __62__PXCuratedLibrarySectionedLayout__updateSublayoutsDataSource__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) sublayoutAtIndex:a2 loadIfNeeded:0];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"PXCuratedLibrarySectionedLayout.m", 376, @"While updating sublayouts, got a change to section %lu that's already loaded.", a2 object file lineNumber description];
  }
}

BOOL __62__PXCuratedLibrarySectionedLayout__updateSublayoutsDataSource__block_invoke_2(uint64_t a1, long long *a2, long long *a3)
{
  id v5 = *(void **)(a1 + 32);
  long long v6 = a2[1];
  long long v17 = *a2;
  long long v18 = v6;
  long long v7 = [v5 assetAtItemIndexPath:&v17];
  id v8 = *(void **)(a1 + 40);
  long long v9 = a3[1];
  long long v17 = *a3;
  long long v18 = v9;
  id v10 = [v8 assetAtItemIndexPath:&v17];
  id v11 = v7;
  uint64_t v12 = v11;
  if (v10 == v11)
  {
    BOOL v14 = 0;
  }
  else
  {
    if (v11) {
      BOOL v13 = v10 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      BOOL v14 = 1;
    }
    else
    {
      uint64_t v15 = [v10 isContentEqualTo:v11];
      if (!v15) {
        uint64_t v15 = [v12 isContentEqualTo:v10];
      }
      BOOL v14 = v15 != 2;
    }
  }

  return v14;
}

void __62__PXCuratedLibrarySectionedLayout__updateSublayoutsDataSource__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  [v6 setDataSource:v5 section:a2];
  [*(id *)(a1 + 40) _configureSectionLayout:v6 atIndex:a2];
}

- (void)willFaultOutSublayout:(id)a3 atIndex:(int64_t)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXCuratedLibrarySectionedLayout;
  [(PXGLayout *)&v19 willFaultOutSublayout:v7 atIndex:a4];
  id v8 = v7;
  if (!v8)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v13 = (objc_class *)objc_opt_class();
    BOOL v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PXCuratedLibrarySectionedLayout.m", 339, @"%@ should be an instance inheriting from %@, but it is nil", @"sublayout", v14 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = (objc_class *)objc_opt_class();
    BOOL v14 = NSStringFromClass(v15);
    SEL v16 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, self, @"PXCuratedLibrarySectionedLayout.m", 339, @"%@ should be an instance inheriting from %@, but it is %@", @"sublayout", v14, v16 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  long long v9 = [v8 assetCollection];
  id v10 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__PXCuratedLibrarySectionedLayout_willFaultOutSublayout_atIndex___block_invoke;
  v17[3] = &unk_1E5DCF3F0;
  id v18 = v9;
  id v11 = v9;
  [v10 performChanges:v17];
}

void __65__PXCuratedLibrarySectionedLayout_willFaultOutSublayout_atIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 visibleAssetCollections];
  [v3 removeObject:*(void *)(a1 + 32)];
}

- (void)didFaultInSublayout:(id)a3 atIndex:(int64_t)a4 fromEstimatedContentSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXCuratedLibrarySectionedLayout;
  -[PXGLayout didFaultInSublayout:atIndex:fromEstimatedContentSize:](&v22, sel_didFaultInSublayout_atIndex_fromEstimatedContentSize_, v10, a4, width, height);
  [(PXCuratedLibrarySectionedLayout *)self _updatePrefetchedSectionsForFaultedInSublayout:v10];
  id v11 = v10;
  if (!v11)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    SEL v16 = (objc_class *)objc_opt_class();
    long long v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"PXCuratedLibrarySectionedLayout.m", 329, @"%@ should be an instance inheriting from %@, but it is nil", @"sublayout", v17 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    id v18 = (objc_class *)objc_opt_class();
    long long v17 = NSStringFromClass(v18);
    objc_super v19 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v15 handleFailureInMethod:a2, self, @"PXCuratedLibrarySectionedLayout.m", 329, @"%@ should be an instance inheriting from %@, but it is %@", @"sublayout", v17, v19 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  uint64_t v12 = [v11 assetCollection];
  BOOL v13 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  _OWORD v20[2] = __88__PXCuratedLibrarySectionedLayout_didFaultInSublayout_atIndex_fromEstimatedContentSize___block_invoke;
  v20[3] = &unk_1E5DCF3F0;
  id v21 = v12;
  id v14 = v12;
  [v13 performChanges:v20];
}

void __88__PXCuratedLibrarySectionedLayout_didFaultInSublayout_atIndex_fromEstimatedContentSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 visibleAssetCollections];
  [v3 addObject:*(void *)(a1 + 32)];
}

- (void)_updatePrefetchedSectionsForFaultedInSublayout:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = +[PXCuratedLibrarySettings sharedInstance];
    uint64_t v6 = [v5 sectionsToPrefetch];

    uint64_t v7 = [(PXAssetsDataSource *)self->_currentDataSource numberOfSections];
    if (v7 > v6)
    {
      uint64_t v8 = v7;
      uint64_t v9 = [v4 section];
      unint64_t v10 = (v9 - v6) & ~((v9 - v6) >> 63);
      if (v9 + v6 >= v8 - 1) {
        unint64_t v11 = v8 - 1;
      }
      else {
        unint64_t v11 = v9 + v6;
      }
      uint64_t v12 = [off_1E5DA7430 indexPathSet];
      if (v10 < v11)
      {
        int64x2_t v13 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        do
        {
          v14[0] = [(PXAssetsDataSource *)self->_currentDataSource identifier];
          v14[1] = v10;
          int64x2_t v15 = v13;
          [v12 addIndexPath:v14];
          ++v10;
        }
        while (v11 != v10);
      }
      [(PXAssetsDataSource *)self->_currentDataSource prefetchSections:v12];
    }
  }
}

- (void)setPerformedInitialLoad:(BOOL)a3
{
  if (self->_performedInitialLoad != a3)
  {
    self->_performedInitialLoad = a3;
    if (a3)
    {
      id v4 = +[PXPreloadScheduler sharedScheduler];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __59__PXCuratedLibrarySectionedLayout_setPerformedInitialLoad___block_invoke;
      v5[3] = &unk_1E5DD36F8;
      v5[4] = self;
      [v4 scheduleMainQueueTask:v5];
    }
  }
}

uint64_t __59__PXCuratedLibrarySectionedLayout_setPerformedInitialLoad___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsInitialLoad:0];
}

- (void)setIsInitialLoad:(BOOL)a3
{
  if (self->_isInitialLoad != a3)
  {
    self->_isInitialLoad = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x20;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0x20) != 0)
      {
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout setIsInitialLoad:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibrarySectionedLayout.m", 288, @"invalidating %lu after it already has been updated", 32);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 32;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)_updateFaultOutsets
{
  id v3 = +[PXCuratedLibrarySettings sharedInstance];
  [v3 faultInDistance];
  [v3 faultOutPadding];
  if (![(PXCuratedLibrarySectionedLayout *)self isInitialLoad]) {
    objc_msgSend(v3, "faultInDistance", 0.0);
  }
  PXEdgeInsetsMake();
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (!needsUpdate) {
    goto LABEL_76;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
    id v42 = [MEMORY[0x1E4F28B00] currentHandler];
    char v43 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout update]"];
    [v42 handleFailureInFunction:v43, @"PXCuratedLibrarySectionedLayout.m", 122, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

    unint64_t needsUpdate = p_updateFlags->needsUpdate;
  }
  p_updateFlags->isPerformingUpdate = 1;
  p_updateFlags->updated = 32;
  if ((needsUpdate & 0x20) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFDFLL;
    [(PXCuratedLibrarySectionedLayout *)self _updateFaultOutsets];
    if (!p_updateFlags->isPerformingUpdate)
    {
      v56 = [MEMORY[0x1E4F28B00] currentHandler];
      int64x2_t v57 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout update]"];
      [v56 handleFailureInFunction:v57, @"PXCuratedLibrarySectionedLayout.m", 128, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
  }
  unint64_t v5 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 2uLL;
  if ((v5 & 2) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
    [(PXCuratedLibrarySectionedLayout *)self _updateSublayoutsDataSource];
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    char v45 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout update]"];
    [v44 handleFailureInFunction:v45, @"PXCuratedLibrarySectionedLayout.m", 132, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v6 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 0x10uLL;
  if ((v6 & 0x10) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFEFLL;
    [(PXCuratedLibrarySectionedLayout *)self _updateSublayoutsForSkimming];
  }
  uint64_t v7 = [(PXCuratedLibrarySectionedLayout *)self spec];
  if (!p_updateFlags->isPerformingUpdate)
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    v47 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout update]"];
    [v46 handleFailureInFunction:v47, @"PXCuratedLibrarySectionedLayout.m", 138, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v8 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 1uLL;
  if (v8)
  {
    p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v9 = [v7 sectionLayoutSpec];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __41__PXCuratedLibrarySectionedLayout_update__block_invoke;
    v65[3] = &unk_1E5DC95C8;
    id v66 = v9;
    id v10 = v9;
    [(PXCuratedLibrarySectionedLayout *)self enumerateAssetsSectionSublayoutsUsingBlock:v65];
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    long long v48 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v49 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout update]"];
    [v48 handleFailureInFunction:v49, @"PXCuratedLibrarySectionedLayout.m", 145, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v11 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 4uLL;
  if ((v11 & 4) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v11 & 0xFFFFFFFFFFFFFFFBLL;
    int64_t currentZoomLevel = self->_currentZoomLevel;
    [v7 defaultInterlayoutSpacingForZoomLevel:currentZoomLevel];
    self->_defaultInterlayoutSpacing = v13;
    [(PXCuratedLibrarySectionedLayout *)self lateralMargin];
    CGFloat v15 = v14;
    uint64_t v16 = [v7 userInterfaceIdiom];
    if ((unint64_t)(currentZoomLevel - 1) <= 1)
    {
      if (v16 != 4)
      {
        [(PXGLayout *)self safeAreaInsets];
        objc_super v19 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
        uint64_t v20 = [v19 styleGuide];
        [v20 secondaryToolbarContentInsets];

        if (currentZoomLevel == 2) {
          [v7 spacingBetweenSafeAreaTopAndFirstMonthTitle];
        }
        else {
          [v7 spacingBetweenSafeAreaTopAndFirstYearCard];
        }
      }
      PXEdgeInsetsMake();
    }
    CGFloat v17 = *((double *)off_1E5DAAF10 + 2);
    if (v16 == 4)
    {
      double v18 = *(double *)off_1E5DAAF10;
    }
    else
    {
      [(PXGLayout *)self safeAreaInsets];
      double v18 = -v21;
    }
    p_padding = &self->_padding;
    self->_padding.double top = v18;
    self->_padding.double left = v15;
    self->_padding.double bottom = v17;
    self->_padding.double right = v15;
    uint64_t v23 = [(PXGCompositeLayout *)self composition];
    id v24 = v23;
    if (currentZoomLevel == 1)
    {
      objc_opt_class();
      uint64_t v25 = v24;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v25 = objc_alloc_init(PXYearsSublayoutComposition);
      }
      uint64_t v26 = [v7 yearsLayoutMetrics];
    }
    else
    {
      if (currentZoomLevel != 2)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(PXYearsSublayoutComposition *)v24 padding];
          PXEdgeInsetsEqualToEdgeInsets();
        }
        uint64_t v25 = objc_alloc_init(PXGStackedSublayoutComposition);

        [(PXYearsSublayoutComposition *)v25 setAxis:1];
        [(PXYearsSublayoutComposition *)v25 setInterlayoutSpacing:self->_defaultInterlayoutSpacing];
        -[PXYearsSublayoutComposition setPadding:](v25, "setPadding:", p_padding->top, self->_padding.left, self->_padding.bottom, self->_padding.right);
        goto LABEL_43;
      }
      objc_opt_class();
      uint64_t v25 = v24;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v25 = objc_alloc_init(PXMonthsSublayoutComposition);
      }
      uint64_t v26 = [v7 monthsLayoutMetrics];
    }
    id v27 = v26;
    id v28 = (PXYearsSublayoutComposition *)[v26 copy];

    [(PXYearsSublayoutComposition *)v28 padding];
    [(PXYearsSublayoutComposition *)v28 setPadding:p_padding->top];
    [(PXYearsSublayoutComposition *)v25 setMetrics:v28];

    id v24 = v28;
LABEL_43:

    [(PXGCompositeLayout *)self setComposition:v25];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __41__PXCuratedLibrarySectionedLayout_update__block_invoke_2;
    v64[3] = &__block_descriptor_40_e38_v32__0q8__PXAssetsSectionLayout_16_B24l;
    v64[4] = currentZoomLevel;
    [(PXCuratedLibrarySectionedLayout *)self enumerateAssetsSectionSublayoutsUsingBlock:v64];
    if ((unint64_t)(self->_currentZoomLevel - 3) <= 1) {
      [(PXGCompositeLayout *)self setSublayoutIndex:0x7FFFFFFFFFFFFFFFLL forUniquelyStylableType:0 animated:0];
    }
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    SEL v51 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout update]"];
    [v50 handleFailureInFunction:v51, @"PXCuratedLibrarySectionedLayout.m", 227, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v29 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 8uLL;
  if ((v29 & 8) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v29 & 0xFFFFFFFFFFFFFFF7;
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __41__PXCuratedLibrarySectionedLayout_update__block_invoke_3;
    v63[3] = &unk_1E5DC95C8;
    v63[4] = self;
    [(PXCuratedLibrarySectionedLayout *)self enumerateAssetsSectionSublayoutsUsingBlock:v63];
    if ((unint64_t)(self->_currentZoomLevel - 1) <= 1)
    {
      uint64_t v30 = [(PXCuratedLibrarySectionedLayout *)self viewModel];
      int64_t v31 = [v30 selectionSnapshot];

      int64_t v32 = [(PXCuratedLibraryViewModel *)self->_viewModel zoomLevelTransitionPhase];
      long long v61 = 0u;
      long long v62 = 0u;
      if (v31)
      {
        [v31 pendingIndexPath];
        uint64_t v33 = v61;
      }
      else
      {
        uint64_t v33 = 0;
      }
      uint64_t v34 = *(void *)off_1E5DAAED8;
      uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
      if (v33 != *(void *)off_1E5DAAED8
        && (void)v62 == 0x7FFFFFFFFFFFFFFFLL
        && *((void *)&v61 + 1) != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v35 = *((void *)&v61 + 1);
      }
      [(PXGCompositeLayout *)self setSublayoutIndex:v35 forUniquelyStylableType:0 animated:v32 == 0];
      long long v59 = 0u;
      long long v60 = 0u;
      if (v31)
      {
        [v31 cursorIndexPath];
        uint64_t v37 = v59;
      }
      else
      {
        uint64_t v37 = 0;
      }
      uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
      if (v37 != v34 && (void)v60 == 0x7FFFFFFFFFFFFFFFLL && *((void *)&v59 + 1) != 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v38 = *((void *)&v59 + 1);
      }
      [(PXGCompositeLayout *)self setSublayoutIndex:v38 forUniquelyStylableType:1 animated:v32 == 0];
    }
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    int64x2_t v52 = [MEMORY[0x1E4F28B00] currentHandler];
    v53 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout update]"];
    [v52 handleFailureInFunction:v53, @"PXCuratedLibrarySectionedLayout.m", 251, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v40 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 0x40uLL;
  if ((v40 & 0x40) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v40 & 0xFFFFFFFFFFFFFFBFLL;
    [(PXCuratedLibrarySectionedLayout *)self _updatePreheating];
  }
  self->_presentedZoomLevel = self->_currentZoomLevel;
  objc_storeStrong((id *)&self->_presentedDataSource, self->_currentDataSource);
  p_updateFlags->isPerformingUpdate = 0;
  if (p_updateFlags->needsUpdate)
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    v55 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout update]"];
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, @"PXCuratedLibrarySectionedLayout.m", 257, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
  }
LABEL_76:
  BOOL isUpdatingSublayouts = self->_isUpdatingSublayouts;
  self->_BOOL isUpdatingSublayouts = 1;
  v58.receiver = self;
  v58.super_class = (Class)PXCuratedLibrarySectionedLayout;
  [(PXGCompositeLayout *)&v58 update];
  self->_BOOL isUpdatingSublayouts = isUpdatingSublayouts;
  [(PXCuratedLibrarySectionedLayout *)self setPerformedInitialLoad:1];
}

uint64_t __41__PXCuratedLibrarySectionedLayout_update__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setSpec:*(void *)(a1 + 32)];
}

uint64_t __41__PXCuratedLibrarySectionedLayout_update__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setZoomLevel:*(void *)(a1 + 32)];
}

uint64_t __41__PXCuratedLibrarySectionedLayout_update__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _configureSectionLayout:a3 atIndex:a2];
}

- (void)dealloc
{
  free(self->_accumulatedSectionItems);
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibrarySectionedLayout;
  [(PXGCompositeLayout *)&v3 dealloc];
}

- (PXCuratedLibrarySectionedLayout)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibrarySectionedLayout.m", 113, @"%s is not available as initializer", "-[PXCuratedLibrarySectionedLayout init]");

  abort();
}

- (PXCuratedLibrarySectionedLayout)initWithViewModel:(id)a3 spec:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXCuratedLibrarySectionedLayout;
  uint64_t v9 = [(PXGCompositeLayout *)&v17 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_spec, a4);
    objc_storeStrong((id *)&v10->_viewModel, a3);
    [(PXCuratedLibraryViewModel *)v10->_viewModel registerChangeObserver:v10 context:PXCuratedLibraryViewModelObserverContext_237391];
    [(PXGCompositeLayout *)v10 setSublayoutFaultingDelegate:v10];
    if (!+[PXCuratedLibrarySectionedLayout shouldDisableLaunchOptimizations])v10->_isInitialLoad = 1; {
    p_updateFlags = (uint64_t *)&v10->_updateFlags;
    }
    unint64_t needsUpdate = v10->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!v10->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        uint64_t *p_updateFlags = needsUpdate | 0x7F;
        goto LABEL_10;
      }
LABEL_8:
      if ((v10->_updateFlags.updated & 0x7F) != 0)
      {
        CGFloat v15 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v16 = [NSString stringWithUTF8String:"-[PXCuratedLibrarySectionedLayout initWithViewModel:spec:]"];
        objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"PXCuratedLibrarySectionedLayout.m", 107, @"invalidating %lu after it already has been updated", 127);

        abort();
      }
      goto LABEL_9;
    }
    if (v10->_updateFlags.isPerformingUpdate) {
      goto LABEL_8;
    }
    BOOL willPerformUpdate = v10->_updateFlags.willPerformUpdate;
    uint64_t *p_updateFlags = 127;
    if (!willPerformUpdate) {
      [(PXGLayout *)v10 setNeedsUpdate];
    }
  }
LABEL_10:

  return v10;
}

+ (void)setShouldDisableLaunchOptimizations:(BOOL)a3
{
  _shouldDisableLaunchOptimizations = a3;
}

+ (BOOL)shouldDisableLaunchOptimizations
{
  return _shouldDisableLaunchOptimizations;
}

@end