@interface PXPhotosSectionedLayout
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)maskCornerRadius;
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)preferredCornerRadius;
- (BOOL)_configureSectionLayout:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4;
- (BOOL)_shouldFaultInSection:(int64_t)a3 inDataSource:(id)a4;
- (BOOL)allowsDanglingUpdatesAssertions;
- (BOOL)allowsSublayoutUpdateCycleAssertions;
- (BOOL)layout:(id)a3 shouldPreventFaultOutOfSublayout:(id)a4;
- (BOOL)shouldApplyItemChangeDetailsToSublayout:(id)a3;
- (BOOL)shouldApplySpriteTransformToSublayouts;
- (CGRect)maskRect;
- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)a5;
- (PXAssetsDataSource)assetsDataSource;
- (PXGItemPlacement)placementOverride;
- (PXPhotosLayoutSpec)spec;
- (PXPhotosSectionBodyLayoutProvider)bodyLayoutProvider;
- (PXPhotosSectionHeaderLayoutProvider)headerLayoutProvider;
- (PXPhotosSectionedLayout)init;
- (PXPhotosSectionedLayout)initWithViewModel:(id)a3;
- (PXPhotosViewModel)viewModel;
- (double)horizontalScrollingHintFactor;
- (double)interSectionSpacing;
- (id)_createAnimationForChangeFromDataSource:(id)a3 toDataSource:(id)a4 changeDetails:(id)a5;
- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3;
- (id)assetsIteratorForContentInRect:(CGRect)a3;
- (id)axSpriteIndexes;
- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4;
- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4;
- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4;
- (id)locationNamesFutureForContentInRect:(CGRect)a3;
- (id)navigationObjectReferenceForLocation:(CGPoint)a3;
- (id)presentedItemsGeometryForSection:(unint64_t)a3 inDataSource:(id)a4;
- (id)topmostHeaderSnapshotInRect:(CGRect)a3;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (unint64_t)behaviorForCaptureSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (void)_forceSectionIfNeeded:(int64_t)a3;
- (void)_invalidateCaptureSprite;
- (void)_invalidatePreferredCornerRadius;
- (void)_invalidateSectionsBlur;
- (void)_invalidateSublayoutTransforms;
- (void)_invalidateSublayoutsConfiguration;
- (void)_invalidateSublayoutsDataSource;
- (void)_invalidateSublayoutsSpec;
- (void)_performAddActionForSectionLayout:(id)a3;
- (void)_updateCaptureSprite;
- (void)_updatePreferredCornerRadius;
- (void)_updateSectionsBlur;
- (void)_updateSublayoutGridConfiguratorForLayout:(id)a3;
- (void)_updateSublayoutTransforms;
- (void)_updateSublayoutsConfiguration;
- (void)_updateSublayoutsDataSource;
- (void)_updateSublayoutsSpec;
- (void)assetSectionLayoutDidConfigureLayouts:(id)a3;
- (void)assetSectionLayoutDidUpdateVisibleRectOvershootFactor:(id)a3;
- (void)didFaultInSublayout:(id)a3 atIndex:(int64_t)a4 fromEstimatedContentSize:(CGSize)a5;
- (void)didUpdate;
- (void)enumerateAssetsSectionSublayoutsInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)enumerateAssetsSectionSublayoutsUsingBlock:(id)a3;
- (void)enumerateBlurrableSectionsIn:(CGRect)a3 using:(id)a4;
- (void)enumerateItemsGeometriesInRect:(CGRect)a3 dataSource:(id)a4 usingBlock:(id)a5;
- (void)enumerateSectionBoundariesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setBlurIntensity:(double)a3 forSectionAt:(int64_t)a4;
- (void)setBodyLayoutProvider:(id)a3;
- (void)setHeaderLayoutProvider:(id)a3;
- (void)setHorizontalScrollingHintFactor:(double)a3;
- (void)setInterSectionSpacing:(double)a3;
- (void)setMaskCornerRadius:(id)a3;
- (void)setMaskRect:(CGRect)a3;
- (void)setPlacementOverride:(id)a3;
- (void)setPreferredCornerRadius:(id)a3;
- (void)setSpec:(id)a3;
- (void)update;
- (void)visibleRectDidChange;
- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5;
- (void)willUpdate;
@end

@implementation PXPhotosSectionedLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placementOverride, 0);
  objc_storeStrong((id *)&self->_bodyLayoutProvider, 0);
  objc_storeStrong((id *)&self->_headerLayoutProvider, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_assetsDataSource, 0);
  objc_storeStrong((id *)&self->_sectionsBlurController, 0);
  objc_storeStrong((id *)&self->_cachedSectionsWithSelectedItems, 0);
}

- (double)horizontalScrollingHintFactor
{
  return self->_horizontalScrollingHintFactor;
}

- (double)interSectionSpacing
{
  return self->_interSectionSpacing;
}

- (void)setPlacementOverride:(id)a3
{
}

- (PXGItemPlacement)placementOverride
{
  return self->_placementOverride;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)maskCornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (CGRect)maskRect
{
  double x = self->_maskRect.origin.x;
  double y = self->_maskRect.origin.y;
  double width = self->_maskRect.size.width;
  double height = self->_maskRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)preferredCornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (PXPhotosSectionBodyLayoutProvider)bodyLayoutProvider
{
  return self->_bodyLayoutProvider;
}

- (PXPhotosSectionHeaderLayoutProvider)headerLayoutProvider
{
  return self->_headerLayoutProvider;
}

- (PXPhotosLayoutSpec)spec
{
  return self->_spec;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (id)axSpriteIndexes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v2;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v14 = a3;
  if ((void *)PhotosViewModelObserverContext != a5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXPhotosSectionedLayout.m" lineNumber:1151 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (a4)
  {
    if (self->_isUpdatingSublayouts)
    {
      [(PXPhotosSectionedLayout *)self _updateSublayoutsDataSource];
    }
    else
    {
      [(PXPhotosSectionedLayout *)self _invalidateSublayoutsDataSource];
      if (([(PXAssetsDataSource *)self->_assetsDataSource areAllSectionsConsideredAccurate] & 1) == 0)[(PXGLayout *)self setNeedsUpdate]; {
    }
      }
  }
  if ((a4 & 0x144100000F06) == 0)
  {
LABEL_10:
    if ((a4 & 0x100000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (self->_isUpdatingSublayouts)
  {
    [(PXPhotosSectionedLayout *)self _updateSublayoutsConfiguration];
    goto LABEL_10;
  }
  [(PXPhotosSectionedLayout *)self _invalidateSublayoutsConfiguration];
  if ((a4 & 0x100000000000) != 0) {
LABEL_11:
  }
    [(PXPhotosSectionedLayout *)self _invalidateSectionsBlur];
LABEL_12:
  if ((a4 & 0x14000) != 0)
  {
    [(PXPhotosSectionedLayout *)self _invalidateSublayoutsSpec];
    [(PXPhotosSectionedLayout *)self _invalidateSublayoutsConfiguration];
    if ((~a4 & 0x4004000) == 0)
    {
      v9 = [(PXGLayout *)self createAnimation];
      [v9 setDuration:0.3];
    }
    v10 = [(PXGLayout *)self rootLayout];
    v11 = [v10 createAnchorForVisibleArea];
    id v12 = (id)[v11 autoInvalidate];
  }
  if ((a4 & 2) != 0) {
    self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems = *(void *)off_1E5DAAED8;
  }
}

- (void)setBlurIntensity:(double)a3 forSectionAt:(int64_t)a4
{
  v5 = [(PXGLayout *)self sublayoutAtIndex:a4 loadIfNeeded:0];
  objc_msgSend(v5, "px_assetsSectionLayout");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [v6 setBlurIntensity:a3];
}

- (void)enumerateBlurrableSectionsIn:(CGRect)a3 using:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__PXPhotosSectionedLayout_enumerateBlurrableSectionsIn_using___block_invoke;
  v11[3] = &unk_1E5DC9488;
  id v12 = v9;
  id v10 = v9;
  -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v11, x, y, width, height);
}

uint64_t __62__PXPhotosSectionedLayout_enumerateBlurrableSectionsIn_using___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)behaviorForCaptureSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (BOOL)layout:(id)a3 shouldPreventFaultOutOfSublayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 contentLayout];
    if (self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems == *(void *)off_1E5DAAED8)
    {
      id v9 = [(PXPhotosSectionedLayout *)self viewModel];
      id v10 = [v9 selectionSnapshot];

      v11 = [v10 dataSource];
      self->_int64_t dataSourceIdentifierOfCachedSectionsWithSelectedItems = [v11 identifier];

      id v12 = [v10 selectedIndexPaths];
      v13 = [v12 sectionsWithItemsForDataSourceIdentifier:self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems];
      cachedSectionsWithSelectedItems = self->_cachedSectionsWithSelectedItems;
      self->_cachedSectionsWithSelectedItems = v13;
    }
    v15 = [v8 dataSource];
    uint64_t v16 = [v15 identifier];
    int64_t dataSourceIdentifierOfCachedSectionsWithSelectedItems = self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems;

    if (v16 == dataSourceIdentifierOfCachedSectionsWithSelectedItems)
    {
      uint64_t v18 = [v8 section];
      v19 = self->_cachedSectionsWithSelectedItems;
      BOOL v20 = [(NSIndexSet *)v19 containsIndex:v18]
         || [(NSIndexSet *)v19 containsIndex:v18 - 1]
         || [(NSIndexSet *)v19 containsIndex:v18 + 1];
    }
    else
    {
      BOOL v20 = 0;
    }
    v21 = [(PXPhotosSectionedLayout *)self bodyLayoutProvider];
    v22 = [v8 bodyContentLayout];
    char v23 = [v21 shouldPreventFaultOutOfBodyLayout:v22 inAssetSectionLayout:v8];

    char v24 = 1;
    if (!v20 && (v23 & 1) == 0) {
      char v24 = [v6 hasPointReferences];
    }
  }
  else
  {
    char v24 = 0;
  }

  return v24;
}

- (void)assetSectionLayoutDidUpdateVisibleRectOvershootFactor:(id)a3
{
  id v4 = a3;
  v5 = [(PXPhotosSectionedLayout *)self viewModel];
  uint64_t v6 = [v5 scrollingBehavior];

  if (v6 == 1)
  {
    id v7 = +[PXLemonadeSettings sharedInstance];
    int v8 = [v7 enableHorizontalPagingHint];

    if (v8)
    {
      [(PXGLayout *)self visibleRect];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x3010000000;
      v25[3] = &unk_1AB5D584F;
      long long v26 = *MEMORY[0x1E4F1DB30];
      uint64_t v19 = 0;
      BOOL v20 = &v19;
      uint64_t v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__238006;
      char v23 = __Block_byref_object_dispose__238007;
      id v24 = 0;
      v17 = [(PXGLayout *)self sublayoutDataStore];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __81__PXPhotosSectionedLayout_assetSectionLayoutDidUpdateVisibleRectOvershootFactor___block_invoke;
      v18[3] = &unk_1E5DC96A8;
      *(double *)&v18[6] = v10;
      *(double *)&v18[7] = v12;
      *(double *)&v18[8] = v14;
      *(double *)&v18[9] = v16;
      v18[4] = v25;
      v18[5] = &v19;
      objc_msgSend(v17, "enumerateSublayoutsInRect:usingBlock:", v18, v10, v12, v14, v16);

      if ((id)v20[5] == v4)
      {
        [v4 visibleRectOvershootFactor];
        -[PXPhotosSectionedLayout setHorizontalScrollingHintFactor:](self, "setHorizontalScrollingHintFactor:");
      }
      _Block_object_dispose(&v19, 8);

      _Block_object_dispose(v25, 8);
    }
  }
}

void __81__PXPhotosSectionedLayout_assetSectionLayoutDidUpdateVisibleRectOvershootFactor___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, void *a7)
{
  id v18 = a7;
  v20.origin.double x = a2;
  v20.origin.double y = a3;
  v20.size.CGFloat width = a4;
  v20.size.CGFloat height = a5;
  CGRect v21 = CGRectIntersection(v20, *(CGRect *)(a1 + 48));
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  if (MEMORY[0x1AD10BB40](v21.size.width, v21.size.height, *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)))
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    *(CGFloat *)(v14 + 32) = width;
    *(CGFloat *)(v14 + 40) = height;
    uint64_t v15 = objc_msgSend(v18, "px_assetsSectionLayout");
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
}

- (void)assetSectionLayoutDidConfigureLayouts:(id)a3
{
  id v7 = a3;
  id v4 = [v7 bodyContentLayout];

  if (v4)
  {
    v5 = [(PXPhotosSectionedLayout *)self bodyLayoutProvider];
    uint64_t v6 = [v7 bodyContentLayout];
    [v5 configureSectionBodyLayout:v6 inAssetSectionLayout:v7 forSectionedLayout:self];
  }
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  uint64_t v6 = [(PXPhotosSectionedLayout *)self viewModel];
  [(PXPhotosSectionedLayout *)self _forceSectionIfNeeded:a4];
  id v7 = [v6 currentDataSource];
  v10[0] = [v7 identifier];
  v10[1] = a4;
  int64x2_t v11 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  int v8 = [v7 assetCollectionReferenceAtSectionIndexPath:v10];

  return v8;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  uint64_t v6 = [(PXPhotosSectionedLayout *)self viewModel];
  [(PXPhotosSectionedLayout *)self _forceSectionIfNeeded:a4];
  id v7 = [v6 currentDataSource];
  BOOL v8 = [(PXPhotosSectionedLayout *)self _shouldFaultInSection:a4 inDataSource:v7];

  if (v8)
  {
    double v9 = [PXAssetsSectionLayout alloc];
    double v10 = [(PXPhotosSectionedLayout *)self assetsDataSource];
    int64x2_t v11 = [v6 loadingStatusManager];
    double v12 = [v6 assetImportStatusManager];
    double v13 = [v6 inlinePlaybackController];
    uint64_t v14 = [(PXPhotosSectionedLayout *)self spec];
    uint64_t v15 = [v14 assetsSpec];
    uint64_t v16 = [(PXAssetsSectionLayout *)v9 initWithSection:a4 dataSource:v10 actionManager:0 loadingStatusManager:v11 assetImportStatusManager:v12 inlinePlaybackController:v13 zoomLevel:4 spec:v15];

    [(PXAssetsSectionLayout *)v16 setDelegate:self];
    if ([v6 wantsSingleRowScrollingLayout])
    {
      [(PXAssetsSectionLayout *)v16 setPreferredInitialContentLayoutAxis:2];
      [(PXAssetsSectionLayout *)v16 setPreferredInitialContentLayoutNumberOfRows:&unk_1F02D9B08];
    }
    uint64_t v17 = [v6 decorationViewClass];
    id v18 = [(PXAssetsSectionLayout *)v16 assetDecorationSource];
    [v18 setDecorationViewClass:v17];

    uint64_t v19 = [(PXPhotosSectionedLayout *)self assetsDataSource];
    uint64_t v20 = [v19 identifier];

    v26[0] = v20;
    v26[1] = a4;
    int64x2_t v27 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    [(PXPhotosSectionedLayout *)self _configureSectionLayout:v16 sectionIndexPath:v26];
  }
  else
  {
    uint64_t v16 = 0;
  }
  CGRect v21 = [(PXPhotosSectionedLayout *)self viewModel];
  uint64_t v22 = [v21 scrollingBehavior];

  if (v22 == 1)
  {
    char v23 = [[PXGScrollLayout alloc] initWithContentLayout:v16];
    LODWORD(v25) = 1140457472;
    [(PXGScrollLayout *)v23 setScrollViewSpriteZPosition:v25];
    [(PXGScrollLayout *)v23 setShowsHorizontalScrollIndicator:0];
    [(PXGScrollLayout *)v23 setShowsVerticalScrollIndicator:1];
    [(PXGScrollLayout *)v23 setAlwaysBounceVertical:1];
  }
  else
  {
    char v23 = v16;
  }

  return v23;
}

- (void)_forceSectionIfNeeded:(int64_t)a3
{
  v5 = [(PXPhotosSectionedLayout *)self viewModel];
  uint64_t v6 = v5;
  if (self->_numberOfForcedSections <= 19)
  {
    id v7 = [v5 currentDataSource];
    uint64_t v8 = [v7 numberOfItemsInSection:a3];

    if (!v8)
    {
      double v9 = [v6 dataSourceManager];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      void v10[2] = __49__PXPhotosSectionedLayout__forceSectionIfNeeded___block_invoke;
      v10[3] = &unk_1E5DD1480;
      v10[4] = self;
      v10[5] = a3;
      [v9 performChanges:v10];
    }
  }
}

void __49__PXPhotosSectionedLayout__forceSectionIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F28D60];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v3 indexSetWithIndex:v4];
  LODWORD(v4) = [v5 forceAccurateSectionsIfNeeded:v6];

  if (v4) {
    ++*(void *)(*(void *)(a1 + 32) + 1160);
  }
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v9 = [(PXPhotosSectionedLayout *)self assetsDataSource];
  v21[0] = [v9 identifier];
  v21[1] = a4;
  int64x2_t v22 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  double v10 = [v9 assetCollectionAtSectionIndexPath:v21];
  uint64_t v11 = [v9 numberOfItemsInSection:a4];
  uint64_t v12 = [v9 hasCurationForAssetCollection:v10];
  if (!v11)
  {
    if ([v10 estimatedAssetCount] == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = [v10 estimatedAssetCount];
    }
  }
  double v13 = [(PXPhotosSectionedLayout *)self spec];
  uint64_t v14 = [v13 assetsSpec];
  +[PXAssetsSectionLayout estimatedSizeWithReferenceSize:assetCollection:numberOfAssets:isCurated:zoomLevel:spec:](PXAssetsSectionLayout, "estimatedSizeWithReferenceSize:assetCollection:numberOfAssets:isCurated:zoomLevel:spec:", v10, v11, v12, 4, v14, width, height);
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (BOOL)shouldApplySpriteTransformToSublayouts
{
  id v2 = [(PXPhotosSectionedLayout *)self placementOverride];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)shouldApplyItemChangeDetailsToSublayout:(id)a3
{
  return !self->_shouldRecreateBodyLayouts;
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionedLayout;
  [(PXGStackLayout *)&v3 visibleRectDidChange];
  [(PXPhotosSectionedLayout *)self _invalidateSectionsBlur];
  [(PXPhotosSectionedLayout *)self _invalidateSublayoutTransforms];
}

- (id)navigationObjectReferenceForLocation:(CGPoint)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PXPhotosSectionedLayout;
  uint64_t v4 = -[PXGLayout navigationObjectReferenceForLocation:](&v16, sel_navigationObjectReferenceForLocation_, a3.x, a3.y);
  id v5 = [(PXPhotosSectionedLayout *)self viewModel];
  uint64_t v6 = [v5 currentDataSource];
  id v7 = [v5 currentDataSource];
  uint64_t v8 = [v7 numberOfSections];

  if (v8 >= 2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v9 = [v6 assetReferenceForAssetReference:v4];
      double v10 = v9;
      if (v9)
      {
        [v9 indexPath];
        if (v15 != *(void *)off_1E5DAAED8)
        {
          [v10 indexPath];
          v14[0] = v13;
          v14[1] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
          uint64_t v11 = [v6 assetCollectionReferenceAtSectionIndexPath:v14];

          uint64_t v4 = (void *)v11;
        }
      }
    }
  }

  return v4;
}

- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  v21.receiver = self;
  v21.super_class = (Class)PXPhotosSectionedLayout;
  id v9 = a3;
  [(PXGStackLayout *)&v21 willRemoveSublayout:v9 atIndex:a4 flags:a5];
  double v10 = objc_msgSend(v9, "px_assetsSectionLayout");

  if (!v10)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = (objc_class *)objc_opt_class();
    objc_super v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, self, @"PXPhotosSectionedLayout.m", 904, @"%@ should be an instance inheriting from %@, but it is nil", @"sublayout.px_assetsSectionLayout", v16 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    double v17 = (objc_class *)objc_opt_class();
    objc_super v16 = NSStringFromClass(v17);
    double v18 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a2, self, @"PXPhotosSectionedLayout.m", 904, @"%@ should be an instance inheriting from %@, but it is %@", @"sublayout.px_assetsSectionLayout", v16, v18 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  uint64_t v11 = [v10 assetCollection];
  uint64_t v12 = [(PXPhotosSectionedLayout *)self viewModel];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__PXPhotosSectionedLayout_willRemoveSublayout_atIndex_flags___block_invoke;
  v19[3] = &unk_1E5DC9680;
  id v20 = v11;
  id v13 = v11;
  [v12 performChanges:v19];
}

void __61__PXPhotosSectionedLayout_willRemoveSublayout_atIndex_flags___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 visibleAssetCollections];
  [v3 removeObject:*(void *)(a1 + 32)];
}

- (void)didFaultInSublayout:(id)a3 atIndex:(int64_t)a4 fromEstimatedContentSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  v22.receiver = self;
  v22.super_class = (Class)PXPhotosSectionedLayout;
  id v10 = a3;
  -[PXGLayout didFaultInSublayout:atIndex:fromEstimatedContentSize:](&v22, sel_didFaultInSublayout_atIndex_fromEstimatedContentSize_, v10, a4, width, height);
  uint64_t v11 = objc_msgSend(v10, "px_assetsSectionLayout");

  if (!v11)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v16 = (objc_class *)objc_opt_class();
    double v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"PXPhotosSectionedLayout.m", 894, @"%@ should be an instance inheriting from %@, but it is nil", @"sublayout.px_assetsSectionLayout", v17 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    double v18 = (objc_class *)objc_opt_class();
    double v17 = NSStringFromClass(v18);
    double v19 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v15 handleFailureInMethod:a2, self, @"PXPhotosSectionedLayout.m", 894, @"%@ should be an instance inheriting from %@, but it is %@", @"sublayout.px_assetsSectionLayout", v17, v19 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  uint64_t v12 = [v11 assetCollection];
  id v13 = [(PXPhotosSectionedLayout *)self viewModel];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80__PXPhotosSectionedLayout_didFaultInSublayout_atIndex_fromEstimatedContentSize___block_invoke;
  v20[3] = &unk_1E5DC9680;
  id v21 = v12;
  id v14 = v12;
  [v13 performChanges:v20];
}

void __80__PXPhotosSectionedLayout_didFaultInSublayout_atIndex_fromEstimatedContentSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 visibleAssetCollections];
  [v3 addObject:*(void *)(a1 + 32)];
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    id v10 = [(PXPhotosSectionedLayout *)self assetsDataSource];
    uint64_t v11 = [v10 assetReferenceForAssetReference:v9];

    if (v11)
    {
      id v12 = v11;
      *a5 = v12;
      [v12 indexPath];
      int64_t v13 = v23;
    }
    else if (a4)
    {
      double v17 = [(PXPhotosSectionedLayout *)self assetsDataSource];
      double v18 = [v17 objectReferenceNearestToObjectReference:v9];

      if (v18)
      {
        id v19 = v18;
        *a5 = v19;
        [v19 indexPath];
        int64_t v13 = v22;
      }
      else
      {
        int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_19:

    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    uint64_t v11 = [v9 decoratedSpriteReference];
    int64_t v13 = [(PXGLayout *)self sublayoutIndexForSpriteReference:v11 options:a4];
    if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
      *a5 = v9;
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    PXAssertGetLog();
  }
  id v9 = v8;
  id v14 = [(PXPhotosSectionedLayout *)self assetsDataSource];
  uint64_t v15 = [v14 assetCollectionReferenceForAssetCollectionReference:v9];

  if (v15)
  {
    id v16 = v15;
    *a5 = v16;
    [v16 indexPath];
    int64_t v13 = v21;
  }
  else
  {
    int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_20:
  return v13;
}

- (BOOL)allowsSublayoutUpdateCycleAssertions
{
  return 0;
}

- (BOOL)allowsDanglingUpdatesAssertions
{
  return 0;
}

- (void)setPreferredCornerRadius:(id)a3
{
  if (self->_preferredCornerRadius.var0.var0.topLeft != v3
    || self->_preferredCornerRadius.var0.var0.topRight != v4
    || self->_preferredCornerRadius.var0.var0.bottomLeft != v5
    || self->_preferredCornerRadius.var0.var0.bottomRight != v6)
  {
    self->_preferredCornerRadius.var0.var0.topLeft = v3;
    self->_preferredCornerRadius.var0.var0.topRight = v4;
    self->_preferredCornerRadius.var0.var0.bottomLeft = v5;
    self->_preferredCornerRadius.var0.var0.bottomRight = v6;
    [(PXPhotosSectionedLayout *)self _invalidateSublayoutsConfiguration];
  }
}

- (void)setMaskCornerRadius:(id)a3
{
  if (self->_maskCornerRadius.var0.var0.topLeft != v3
    || self->_maskCornerRadius.var0.var0.topRight != v4
    || self->_maskCornerRadius.var0.var0.bottomLeft != v5
    || self->_maskCornerRadius.var0.var0.bottomRight != v6)
  {
    self->_maskCornerRadius.var0.var0.topLeft = v3;
    self->_maskCornerRadius.var0.var0.topRight = v4;
    self->_maskCornerRadius.var0.var0.bottomLeft = v5;
    self->_maskCornerRadius.var0.var0.bottomRight = v6;
    [(PXPhotosSectionedLayout *)self _invalidateCaptureSprite];
  }
}

- (void)setMaskRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_maskRect = &self->_maskRect;
  if (!CGRectEqualToRect(self->_maskRect, a3))
  {
    p_maskRect->origin.CGFloat x = x;
    p_maskRect->origin.CGFloat y = y;
    p_maskRect->size.CGFloat width = width;
    p_maskRect->size.CGFloat height = height;
    [(PXPhotosSectionedLayout *)self _invalidateCaptureSprite];
  }
}

- (void)_updatePreferredCornerRadius
{
}

- (void)_invalidatePreferredCornerRadius
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      float v5 = [MEMORY[0x1E4F28B00] currentHandler];
      float v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout _invalidatePreferredCornerRadius]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosSectionedLayout.m", 811, @"invalidating %lu after it already has been updated", 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 32;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateSublayoutTransforms
{
  float v3 = [(PXPhotosSectionedLayout *)self viewModel];
  uint64_t v4 = [v3 scrollingBehavior];

  if (v4 == 1)
  {
    [(PXPhotosSectionedLayout *)self horizontalScrollingHintFactor];
    +[PXLemonadeSettings sharedInstance];
    [(id)objc_claimAutoreleasedReturnValue() horizontalPagingHintMaximumScale];
    PXClamp();
  }
}

void __53__PXPhotosSectionedLayout__updateSublayoutTransforms__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v35 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  float v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 geometryForSublayout:v5];
    double v7 = *(double *)&v30;
  }
  else
  {
    double v7 = 0.0;
  }
  double v8 = *(double *)(a1 + 40);
  long long v10 = *(_OWORD *)off_1E5DAAF78;
  long long v9 = *((_OWORD *)off_1E5DAAF78 + 1);
  long long v11 = *((_OWORD *)off_1E5DAAF78 + 2);
  *(_OWORD *)&v26.c = v9;
  *(_OWORD *)&v26.tCGFloat x = v11;
  double v12 = *((double *)off_1E5DAAF78 + 6);
  long long v23 = v10;
  long long v24 = v9;
  long long v25 = v11;
  *(_OWORD *)&v26.a = v10;
  if (v7 >= v8)
  {
    if (v7 <= v8) {
      PXFloatApproximatelyEqualToFloat();
    }
    double v13 = *(double *)(a1 + 72) * *(double *)&v29;
    double v14 = -0.5;
  }
  else
  {
    double v13 = *(double *)&v29 * *(double *)(a1 + 72);
    double v14 = 0.5;
  }
  *(_OWORD *)&v22.a = v10;
  *(_OWORD *)&v22.c = v9;
  *(_OWORD *)&v22.tCGFloat x = v11;
  *(_OWORD *)&v36.a = v10;
  *(_OWORD *)&v36.c = v9;
  *(_OWORD *)&v36.tCGFloat x = v11;
  CGAffineTransformTranslate(&v22, &v36, v13 * v14, 0.0);
  CGAffineTransform v26 = v22;
  uint64_t v15 = [*(id *)(a1 + 32) geometries] + 136 * a2;
  long long v16 = *(_OWORD *)&v26.c;
  *(_OWORD *)(v15 + 72) = *(_OWORD *)&v26.a;
  *(_OWORD *)(v15 + 88) = v16;
  *(_OWORD *)(v15 + 104) = *(_OWORD *)&v26.tx;
  *(double *)(v15 + 120) = v12 + 0.0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__PXPhotosSectionedLayout__updateSublayoutTransforms__block_invoke_2;
  v17[3] = &__block_descriptor_88_e93_v40__0q8_____CGSize_dd_dS_CGSize_dd____ddd_____CGAffineTransform_dddddd_d_d_16_____v_v_24_B32l;
  long long v20 = v25;
  long long v19 = v24;
  long long v18 = v23;
  double v21 = v12;
  objc_msgSend(v5, "px_modifyAssetsSectionLayoutGeometry:", v17);
}

__n128 __53__PXPhotosSectionedLayout__updateSublayoutTransforms__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 + 136 * a2;
  __n128 result = *(__n128 *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 64);
  *(void *)(v3 + 120) = *(void *)(a1 + 80);
  *(_OWORD *)(v3 + 104) = v6;
  *(_OWORD *)(v3 + 88) = v5;
  *(__n128 *)(v3 + 72) = result;
  return result;
}

- (void)_invalidateSublayoutTransforms
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 4) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout _invalidateSublayoutTransforms]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosSectionedLayout.m", 774, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateCaptureSprite
{
  [(PXPhotosSectionedLayout *)self maskRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(PXPhotosSectionedLayout *)self maskCornerRadius];
  float v15 = v14;
  float v16 = v11;
  float v17 = v12;
  float v18 = v13;
  if (v14 == *(float *)off_1E5DAAF50
    && v11 == *((float *)off_1E5DAAF50 + 1)
    && v12 == *((float *)off_1E5DAAF50 + 2)
    && v13 == *((float *)off_1E5DAAF50 + 3))
  {
    v30.origin.CGFloat x = v4;
    v30.origin.CGFloat y = v6;
    v30.size.CGFloat width = v8;
    v30.size.CGFloat height = v10;
    if (CGRectIsInfinite(v30))
    {
      char v22 = 0;
      captureSpriteIndeCGFloat x = self->_captureSpriteIndex;
      goto LABEL_17;
    }
  }
  captureSpriteIndeCGFloat x = self->_captureSpriteIndex;
  if (captureSpriteIndex == -1)
  {
    captureSpriteIndeCGFloat x = [(PXGLayout *)self addSpriteWithInitialState:&__block_literal_global_238036];
    self->_captureSpriteIndeCGFloat x = captureSpriteIndex;
    char v22 = 1;
LABEL_17:
    if (captureSpriteIndex == -1) {
      return;
    }
    goto LABEL_18;
  }
  char v22 = 1;
LABEL_18:
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __47__PXPhotosSectionedLayout__updateCaptureSprite__block_invoke_2;
  v24[3] = &__block_descriptor_81_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
  *(CGFloat *)&v24[4] = v4;
  *(CGFloat *)&v24[5] = v6;
  *(CGFloat *)&v24[6] = v8;
  *(CGFloat *)&v24[7] = v10;
  char v29 = v22;
  float v25 = v15;
  float v26 = v16;
  float v27 = v17;
  float v28 = v18;
  [(PXGLayout *)self modifySpritesInRange:captureSpriteIndex | 0x100000000 state:v24];
}

__n128 __47__PXPhotosSectionedLayout__updateCaptureSprite__block_invoke_2(__n128 *a1, uint64_t a2, float32x2_t *a3, uint64_t a4)
{
  CGFloat v7 = a1[2].n128_f64[0];
  CGFloat v8 = a1[2].n128_f64[1];
  CGFloat v9 = a1[3].n128_f64[0];
  CGFloat v10 = a1[3].n128_f64[1];
  v18.origin.CGFloat x = v7;
  v18.origin.CGFloat y = v8;
  v18.size.CGFloat width = v9;
  v18.size.CGFloat height = v10;
  CGFloat MidX = CGRectGetMidX(v18);
  v19.origin.CGFloat x = v7;
  v19.origin.CGFloat y = v8;
  v19.size.CGFloat width = v9;
  v19.size.CGFloat height = v10;
  CGFloat MidY = CGRectGetMidY(v19);
  v20.origin.CGFloat x = v7;
  v20.origin.CGFloat y = v8;
  v20.size.CGFloat width = v9;
  v20.size.CGFloat height = v10;
  CGFloat Width = CGRectGetWidth(v20);
  v21.origin.CGFloat x = v7;
  v21.origin.CGFloat y = v8;
  v21.size.CGFloat width = v9;
  v21.size.CGFloat height = v10;
  CGFloat Height = CGRectGetHeight(v21);
  v14.f64[0] = Width;
  v14.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[3] = vcvt_f32_f64(v14);
  a3[2] = (float32x2_t)0xBFF0000000000000;
  float v15 = 1.0;
  if (!a1[5].n128_u8[0]) {
    float v15 = 0.0;
  }
  *(float *)a4 = v15;
  __n128 result = a1[4];
  *(__n128 *)(a4 + 36) = result;
  return result;
}

double __47__PXPhotosSectionedLayout__updateCaptureSprite__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v3 = (_OWORD *)a3[2];
  long long v4 = *((_OWORD *)off_1E5DAAF70 + 1);
  _OWORD *v3 = *(_OWORD *)off_1E5DAAF70;
  v3[1] = v4;
  double v5 = (_OWORD *)a3[3];
  long long v6 = *((_OWORD *)off_1E5DAAF90 + 1);
  _OWORD *v5 = *(_OWORD *)off_1E5DAAF90;
  v5[1] = v6;
  long long v7 = *((_OWORD *)off_1E5DAAF90 + 5);
  v5[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  v5[5] = v7;
  long long v8 = *((_OWORD *)off_1E5DAAF90 + 3);
  v5[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  v5[3] = v8;
  long long v9 = *((_OWORD *)off_1E5DAAF90 + 9);
  v5[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v5[9] = v9;
  long long v10 = *((_OWORD *)off_1E5DAAF90 + 7);
  v5[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v5[7] = v10;
  uint64_t v11 = a3[4];
  *(void *)(v11 + 32) = *((void *)off_1E5DAAF88 + 4);
  long long v12 = *((_OWORD *)off_1E5DAAF88 + 1);
  *(_OWORD *)uint64_t v11 = *(_OWORD *)off_1E5DAAF88;
  *(_OWORD *)(v11 + 16) = v12;
  uint64_t v13 = a3[4];
  *(unsigned char *)(v13 + 1) = 9;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)(v13 + 8) = result;
  *(unsigned char *)(a3[4] + 34) = 8;
  return result;
}

- (void)_invalidateCaptureSprite
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 2) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout _invalidateCaptureSprite]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosSectionedLayout.m", 743, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateSectionsBlur
{
  double v3 = [(PXPhotosSectionedLayout *)self spec];
  if (([v3 wantsSectionsBlur] & 1) == 0)
  {

    goto LABEL_7;
  }
  long long v4 = [(PXPhotosSectionedLayout *)self viewModel];
  double v5 = [v4 currentLens];
  int v6 = [v5 allowsBlur];

  if (!v6)
  {
LABEL_7:
    uint64_t v9 = 1;
    goto LABEL_8;
  }
  if (!self->_sectionsBlurController)
  {
    long long v7 = [[PXSectionsBlurController alloc] initWithBlurrableSectionsSource:self];
    sectionsBlurController = self->_sectionsBlurController;
    self->_sectionsBlurController = v7;
  }
  uint64_t v9 = 0;
LABEL_8:
  [(PXSectionsBlurController *)self->_sectionsBlurController setBehavior:v9];
  long long v10 = self->_sectionsBlurController;
  [(PXGLayout *)self visibleRect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(PXGLayout *)self safeAreaInsets];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  [(PXPhotosSectionedLayout *)self interSectionSpacing];
  -[PXSectionsBlurController updateSectionsBlurWithVisibleRect:safeAreaInsets:interSectionSpacing:](v10, "updateSectionsBlurWithVisibleRect:safeAreaInsets:interSectionSpacing:", v12, v14, v16, v18, v20, v22, v24, v26, v27);
}

- (void)_invalidateSectionsBlur
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_postUpdateFlags.updated)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      int v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout _invalidateSectionsBlur]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosSectionedLayout.m", 730, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateSublayoutsConfiguration
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (self->_shouldRecreateBodyLayouts)
  {
    p_isRecreatingContentLayouts = &self->_isRecreatingContentLayouts;
    self->_isRecreatingContentLayouts = 1;
  }
  else
  {
    BOOL shouldRecreateHeaderLayouts = self->_shouldRecreateHeaderLayouts;
    p_isRecreatingContentLayouts = &self->_isRecreatingContentLayouts;
    self->_isRecreatingContentLayouts = shouldRecreateHeaderLayouts;
    if (!shouldRecreateHeaderLayouts) {
      goto LABEL_5;
    }
  }
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
LABEL_5:
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__PXPhotosSectionedLayout__updateSublayoutsConfiguration__block_invoke;
  v6[3] = &unk_1E5DC95F0;
  v6[4] = self;
  v6[5] = &v7;
  [(PXPhotosSectionedLayout *)self enumerateAssetsSectionSublayoutsUsingBlock:v6];
  if (*((unsigned char *)v8 + 24)) {
    id v5 = [(PXGLayout *)self createDefaultAnimationForCurrentContext];
  }
  self->_shouldRecreateBodyLayouts = 0;
  self->_BOOL shouldRecreateHeaderLayouts = 0;
  BOOL *p_isRecreatingContentLayouts = 0;
  _Block_object_dispose(&v7, 8);
}

void __57__PXPhotosSectionedLayout__updateSublayoutsConfiguration__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 assetsDataSource];
  uint64_t v8 = [v7 identifier];

  uint64_t v9 = *(void **)(a1 + 32);
  v13[0] = v8;
  v13[1] = a2;
  int64x2_t v14 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  char v10 = [v9 _configureSectionLayout:v6 sectionIndexPath:v13];

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v11 + 24)) {
    char v12 = 1;
  }
  else {
    char v12 = v10;
  }
  *(unsigned char *)(v11 + 24) = v12;
}

- (void)_invalidateSublayoutsConfiguration
{
  if (!self->_isRecreatingContentLayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x10;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0x10) != 0)
      {
        id v5 = [MEMORY[0x1E4F28B00] currentHandler];
        id v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout _invalidateSublayoutsConfiguration]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosSectionedLayout.m", 703, @"invalidating %lu after it already has been updated", 16);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 16;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)_updateSublayoutGridConfiguratorForLayout:(id)a3
{
  id v4 = a3;
  id v5 = [v4 spec];
  id v6 = [v4 assetCollection];

  id v9 = [v5 sectionConfiguratorForAssetCollection:v6 inZoomLevel:4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [(PXPhotosSectionedLayout *)self viewModel];
    objc_msgSend(v9, "setAspectFitContent:", objc_msgSend(v7, "aspectFitContent"));
    [v7 zoomStep];
    [v9 setZoomStep:(uint64_t)v8];
  }
}

- (void)_updateSublayoutsSpec
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__PXPhotosSectionedLayout__updateSublayoutsSpec__block_invoke;
  v2[3] = &unk_1E5DC95C8;
  v2[4] = self;
  [(PXPhotosSectionedLayout *)self enumerateAssetsSectionSublayoutsUsingBlock:v2];
}

void __48__PXPhotosSectionedLayout__updateSublayoutsSpec__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 spec];
  id v9 = [v6 assetsSpec];

  [v5 setSpec:v9];
  uint64_t v7 = [v5 headerLayout];
  double v8 = [*(id *)(a1 + 32) spec];
  [v7 setSpec:v8];

  [*(id *)(a1 + 32) _updateSublayoutGridConfiguratorForLayout:v5];
}

- (void)_invalidateSublayoutsSpec
{
  if (!self->_isRecreatingContentLayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        id v5 = [MEMORY[0x1E4F28B00] currentHandler];
        id v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout _invalidateSublayoutsSpec]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosSectionedLayout.m", 677, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)_updateSublayoutsDataSource
{
  id v4 = [(PXPhotosSectionedLayout *)self viewModel];
  id v5 = [v4 dataSourceManager];

  id v6 = self->_assetsDataSource;
  uint64_t v7 = [v5 dataSource];
  if (v6 != v7)
  {
    double v8 = [(PXGLayout *)self sublayoutDataStore];
    uint64_t v9 = [(PXAssetsDataSource *)v6 numberOfSections];
    v46 = v8;
    if (v9 != [v8 count])
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      [v38 handleFailureInMethod:a2, self, @"PXPhotosSectionedLayout.m", 580, @"Invalid parameter not satisfying: %@", @"numberOfSublayoutsBefore == sublayoutDataStore.count" object file lineNumber description];
    }
    char v10 = [v5 changeHistory];
    uint64_t v11 = objc_msgSend(v10, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", -[PXAssetsDataSource identifier](v6, "identifier"), -[PXAssetsDataSource identifier](v7, "identifier"));

    if (self->_isUpdatingSublayouts)
    {
      if ([v11 count] != 1)
      {
        v39 = [MEMORY[0x1E4F28B00] currentHandler];
        [v39 handleFailureInMethod:a2, self, @"PXPhotosSectionedLayout.m", 590, @"While updating sublayouts, expecting only one data source change, got %lu", objc_msgSend(v11, "count") object file lineNumber description];
      }
      char v12 = [v11 firstObject];
      double v13 = [v12 sectionsWithItemChanges];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke;
      v59[3] = &unk_1E5DC9550;
      v59[4] = self;
      v59[5] = a2;
      SEL v45 = a2;
      [v13 enumerateIndexesUsingBlock:v59];

      int64x2_t v14 = [v12 sectionChanges];
      if (([v14 hasIncrementalChanges] & 1) == 0)
      {
        v40 = [MEMORY[0x1E4F28B00] currentHandler];
        [v40 handleFailureInMethod:v45 object:self file:@"PXPhotosSectionedLayout.m" lineNumber:596 description:@"Section changes while updating sublayouts must be incremental."];
      }
      double v15 = [v14 insertedIndexes];
      uint64_t v16 = [v15 count];

      if (v16)
      {
        v41 = [MEMORY[0x1E4F28B00] currentHandler];
        v42 = [v14 insertedIndexes];
        [v41 handleFailureInMethod:v45, self, @"PXPhotosSectionedLayout.m", 597, @"Sections %@ inserted while updating sublayouts, this is not supported.", v42 object file lineNumber description];
      }
      double v17 = [v14 removedIndexes];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        v43 = [MEMORY[0x1E4F28B00] currentHandler];
        v44 = [v14 removedIndexes];
        [v43 handleFailureInMethod:v45, self, @"PXPhotosSectionedLayout.m", 598, @"Sections %@ removed while updating sublayouts, this is not supported.", v44 object file lineNumber description];
      }
    }
    else
    {
      if ([(PXAssetsDataSource *)v6 containsAnyItems]) {
        int v19 = 0;
      }
      else {
        int v19 = [(PXAssetsDataSource *)v6 areAllSectionsConsideredAccurate] ^ 1;
      }
      if ([(PXAssetsDataSource *)v7 containsAnyItems]) {
        int v20 = 0;
      }
      else {
        int v20 = [(PXAssetsDataSource *)v7 areAllSectionsConsideredAccurate] ^ 1;
      }
      if (v19 == v20) {
        id v21 = [(PXPhotosSectionedLayout *)self _createAnimationForChangeFromDataSource:v6 toDataSource:v7 changeDetails:v11];
      }
      double v22 = [(PXPhotosSectionedLayout *)self viewModel];
      double v23 = [v22 libraryFilterState];
      if (v23)
      {
        if ([(PXAssetsDataSource *)v6 areAllSectionsConsideredAccurate])
        {
          if ([(PXAssetsDataSource *)v7 areAllSectionsConsideredAccurate])uint64_t v24 = 0; {
          else
          }
            uint64_t v24 = 15;
        }
        else
        {
          uint64_t v24 = 15;
        }
      }
      else
      {
        double v25 = [v22 contentFilterState];
        if (v25)
        {
          if ([(PXAssetsDataSource *)v6 areAllSectionsConsideredAccurate])
          {
            if ([(PXAssetsDataSource *)v7 areAllSectionsConsideredAccurate])uint64_t v24 = 0; {
            else
            }
              uint64_t v24 = 15;
          }
          else
          {
            uint64_t v24 = 15;
          }
        }
        else
        {
          uint64_t v24 = 0;
        }
      }
      double v26 = [(PXGLayout *)self rootLayout];
      uint64_t v27 = [v26 createAnchorForVisibleAreaIgnoringEdges:v24];
      float v28 = [v27 autoInvalidate];

      char v29 = [(PXGLayout *)self activeAnchor];

      if (!v29)
      {
        CGRect v30 = [(PXGLayout *)self createAnchorWithAnchor:v28];
        id v31 = (id)[v30 autoInvalidate];
      }
    }
    objc_storeStrong((id *)&self->_assetsDataSource, v7);
    id v57 = 0;
    id v58 = 0;
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke_2;
    v54[3] = &unk_1E5DC9578;
    v55 = v6;
    long long v32 = v7;
    v56 = v32;
    [(PXGLayout *)self applySectionedChangeDetails:v11 dataSourceBeforeChanges:v55 dataSourceAfterChanges:v32 sublayoutProvider:self outChangedSections:&v58 outSectionsWithItemChanges:&v57 changeMediaVersionHandler:v54];
    id v33 = v58;
    id v34 = v57;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke_3;
    v51[3] = &unk_1E5DD3088;
    v51[4] = self;
    uint64_t v35 = v32;
    v52 = v35;
    id v36 = v46;
    id v53 = v36;
    [v34 enumerateIndexesUsingBlock:v51];
    [(PXGLayout *)self invalidateVersion];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke_4;
    v47[3] = &unk_1E5DC95A0;
    id v37 = v33;
    id v48 = v37;
    v49 = v35;
    v50 = self;
    [(PXPhotosSectionedLayout *)self enumerateAssetsSectionSublayoutsUsingBlock:v47];
    if (!self->_isUpdatingSublayouts)
    {
      [(PXPhotosSectionedLayout *)self _invalidateSublayoutsSpec];
      [(PXPhotosSectionedLayout *)self _invalidateSublayoutsConfiguration];
    }
  }
}

void __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) sublayoutAtIndex:a2 loadIfNeeded:0];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"PXPhotosSectionedLayout.m", 593, @"While updating sublayouts, got a change to section %lu that's already loaded.", a2 object file lineNumber description];
  }
}

BOOL __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke_2(uint64_t a1, long long *a2, long long *a3)
{
  id v5 = *(void **)(a1 + 32);
  long long v6 = a2[1];
  long long v18 = *a2;
  long long v19 = v6;
  uint64_t v7 = [v5 assetAtItemIndexPath:&v18];
  double v8 = *(void **)(a1 + 40);
  long long v9 = a3[1];
  long long v18 = *a3;
  long long v19 = v9;
  char v10 = [v8 assetAtItemIndexPath:&v18];
  id v11 = v7;
  id v12 = v10;
  double v13 = v12;
  if (v11 == v12)
  {
    BOOL v15 = 0;
  }
  else
  {
    if (v11) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {
      BOOL v15 = 1;
    }
    else
    {
      uint64_t v16 = [v11 isContentEqualTo:v12];
      if (!v16) {
        uint64_t v16 = [v13 isContentEqualTo:v11];
      }
      BOOL v15 = v16 != 2;
    }
  }

  return v15;
}

void __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke_3(uint64_t a1, uint64_t a2)
{
  int v4 = [*(id *)(a1 + 32) _shouldFaultInSection:a2 inDataSource:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 48) sublayoutProviderAtIndex:a2];

  long long v6 = [*(id *)(a1 + 48) sublayoutAtIndex:a2];

  if (v6)
  {
    if ((v4 ^ (v5 == 0))) {
      return;
    }
    goto LABEL_8;
  }
  if (v5) {
    int v7 = 0;
  }
  else {
    int v7 = v4;
  }
  if (v7 == 1)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "removeSublayoutsInRange:", a2, 1);
    double v8 = *(void **)(a1 + 32);
    if (v4) {
      uint64_t v9 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v9 = 0;
    }
    objc_msgSend(v8, "insertSublayoutProvider:inRange:", v9, a2, 1);
  }
}

void __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke_4(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a1[4] containsIndex:a2];
  uint64_t v7 = [a1[5] identifier];
  [v5 setDataSource:a1[5] section:a2];
  double v8 = [v5 bodyContentLayout];

  if (v8)
  {
    uint64_t v9 = [a1[6] bodyLayoutProvider];
    id v10 = a1[6];
    id v11 = [v5 bodyContentLayout];
    id v12 = a1[5];
    uint64_t v17 = v7;
    uint64_t v18 = a2;
    int64x2_t v19 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    [v9 sectionedLayout:v10 bodyLayout:v11 didChangeDataSource:v12 sectionIndexPath:&v17 hasSectionChanges:v6];
  }
  double v13 = [v5 headerLayout];
  if (v13)
  {
    BOOL v14 = [a1[6] headerLayoutProvider];
    id v16 = a1[5];
    id v15 = a1[6];
    uint64_t v17 = v7;
    uint64_t v18 = a2;
    int64x2_t v19 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    [v14 sectionedLayout:v15 headerLayout:v13 didChangeDataSource:v16 sectionIndexPath:&v17 hasSectionChanges:v6];
  }
}

- (void)_invalidateSublayoutsDataSource
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout _invalidateSublayoutsDataSource]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosSectionedLayout.m", 567, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)didUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosSectionedLayout;
  [(PXGStackLayout *)&v7 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    int v4 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXPhotosSectionedLayout.m", 562, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout didUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXPhotosSectionedLayout.m", 563, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)update
{
  self->_numberOfForcedSections = 0;
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      double v13 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v14 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout update]"];
      [v13 handleFailureInFunction:v14, @"PXPhotosSectionedLayout.m", 526, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXPhotosSectionedLayout *)self _updateSublayoutsDataSource];
      if (!p_updateFlags->isPerformingUpdate)
      {
        uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
        float v28 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout update]"];
        [v27 handleFailureInFunction:v28, @"PXPhotosSectionedLayout.m", 530, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXPhotosSectionedLayout *)self _updateSublayoutsSpec];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      id v16 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout update]"];
      [v15 handleFailureInFunction:v16, @"PXPhotosSectionedLayout.m", 533, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v6 & 0x20) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFDFLL;
      [(PXPhotosSectionedLayout *)self _updatePreferredCornerRadius];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout update]"];
      [v17 handleFailureInFunction:v18, @"PXPhotosSectionedLayout.m", 536, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v7 & 0x10) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXPhotosSectionedLayout *)self _updateSublayoutsConfiguration];
      unint64_t v7 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v7)
    {
      int64x2_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      int v20 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout update]"];
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"PXPhotosSectionedLayout.m", 540, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  BOOL isUpdatingSublayouts = self->_isUpdatingSublayouts;
  self->_BOOL isUpdatingSublayouts = 1;
  v31.receiver = self;
  v31.super_class = (Class)PXPhotosSectionedLayout;
  [(PXGStackLayout *)&v31 update];
  self->_BOOL isUpdatingSublayouts = isUpdatingSublayouts;
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.BOOL willPerformUpdate = 0;
  unint64_t v10 = self->_postUpdateFlags.needsUpdate;
  if (v10)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      double v22 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout update]"];
      [v21 handleFailureInFunction:v22, @"PXPhotosSectionedLayout.m", 547, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t v10 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1;
    if (v10)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v10 & 0xFFFFFFFFFFFFFFFELL;
      [(PXPhotosSectionedLayout *)self _updateSectionsBlur];
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        char v29 = [MEMORY[0x1E4F28B00] currentHandler];
        CGRect v30 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout update]"];
        [v29 handleFailureInFunction:v30, @"PXPhotosSectionedLayout.m", 551, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v11 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 2uLL;
    if ((v11 & 2) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v11 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXPhotosSectionedLayout *)self _updateCaptureSprite];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      double v23 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v24 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout update]"];
      [v23 handleFailureInFunction:v24, @"PXPhotosSectionedLayout.m", 554, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v12 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 4uLL;
    if ((v12 & 4) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v12 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXPhotosSectionedLayout *)self _updateSublayoutTransforms];
      unint64_t v12 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v12)
    {
      double v25 = [MEMORY[0x1E4F28B00] currentHandler];
      double v26 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout update]"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"PXPhotosSectionedLayout.m", 557, @"still needing to update %lu after update pass", p_postUpdateFlags->needsUpdate);
    }
  }
}

- (void)willUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosSectionedLayout;
  [(PXGStackLayout *)&v7 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    int v4 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXPhotosSectionedLayout.m", 519, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  self->_postUpdateFlags.BOOL willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionedLayout willUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXPhotosSectionedLayout.m", 520, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (BOOL)_configureSectionLayout:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  id v6 = a3;
  objc_super v7 = [(PXPhotosSectionedLayout *)self viewModel];
  double v8 = [v6 dropTargetAssetReference];
  uint64_t v9 = [v7 dropTargetAssetReference];

  unint64_t v10 = [v6 tapbackStatusManager];
  unint64_t v11 = [v7 tapbackStatusManager];

  BOOL v13 = v10 != v11 || v8 != v9;
  BOOL v14 = [v6 headerLayout];
  if (v14)
  {
    BOOL shouldRecreateHeaderLayouts = self->_shouldRecreateHeaderLayouts;

    if (!shouldRecreateHeaderLayouts) {
      goto LABEL_23;
    }
  }
  else
  {
    id v16 = [(PXPhotosSectionedLayout *)self headerLayoutProvider];
    if (v16)
    {
    }
    else if (!self->_shouldRecreateHeaderLayouts)
    {
      goto LABEL_23;
    }
  }
  uint64_t v73 = 1;
  uint64_t v17 = [(PXPhotosSectionedLayout *)self headerLayoutProvider];
  uint64_t v18 = [(PXPhotosSectionedLayout *)self assetsDataSource];
  int64x2_t v19 = [(PXPhotosSectionedLayout *)self spec];
  long long v20 = *(_OWORD *)&a4->item;
  *(_OWORD *)location = *(_OWORD *)&a4->dataSourceIdentifier;
  long long v72 = v20;
  id v21 = [v17 createSectionHeaderLayoutForSectionedLayout:self dataSource:v18 sectionIndexPath:location spec:v19 outAlignment:&v73];

  double v22 = [v6 headerLayout];

  if (v22 != v21)
  {
    [v6 setHeaderLayout:v21];
    BOOL v13 = 1;
  }
  switch(v73)
  {
    case 1:
      uint64_t v23 = 0;
      uint64_t v24 = 1;
      goto LABEL_19;
    case 2:
      uint64_t v24 = 0;
      uint64_t v23 = 0;
LABEL_19:
      uint64_t v25 = 1;
      break;
    case 3:
      uint64_t v23 = 0;
      uint64_t v24 = 1;
      uint64_t v25 = 2;
      break;
    case 4:
      uint64_t v24 = 1;
      uint64_t v25 = 7;
      uint64_t v23 = 1;
      break;
    default:
      uint64_t v23 = 0;
      uint64_t v25 = 0;
      uint64_t v24 = 1;
      break;
  }
  [v6 setMode:v25];
  [v6 setFloatingModesRespectSafeArea:v24];
  [v6 setAdjustSublayoutZPositions:v23];
  [v6 setShouldExcludeTopAndBottomPaddingFromReferenceSize:v23];

LABEL_23:
  double v26 = [v6 bodyContentLayout];
  if (v26)
  {
    BOOL shouldRecreateBodyLayouts = self->_shouldRecreateBodyLayouts;

    if (!shouldRecreateBodyLayouts) {
      goto LABEL_32;
    }
  }
  else
  {
    float v28 = [(PXPhotosSectionedLayout *)self bodyLayoutProvider];
    if (v28)
    {
    }
    else if (!self->_shouldRecreateBodyLayouts)
    {
      goto LABEL_32;
    }
  }
  LOBYTE(v73) = 1;
  char v29 = [(PXPhotosSectionedLayout *)self bodyLayoutProvider];
  CGRect v30 = [(PXPhotosSectionedLayout *)self assetsDataSource];
  objc_super v31 = [(PXPhotosSectionedLayout *)self spec];
  long long v32 = *(_OWORD *)&a4->item;
  *(_OWORD *)location = *(_OWORD *)&a4->dataSourceIdentifier;
  long long v72 = v32;
  id v33 = [v29 createSectionBodyLayoutForSectionedLayout:self dataSource:v30 sectionIndexPath:location spec:v31 outWantsDecoration:&v73];

  [v6 setDisableConfigurators:v33 != 0];
  id v34 = [v6 bodyContentLayout];

  if (v34 != v33) {
    BOOL v13 = 1;
  }
  [v6 setBodyContentLayout:v33 wantsDecoration:v73];

LABEL_32:
  [v7 headerFloatingThresholdOffset];
  objc_msgSend(v6, "setFloatingThresholdOffset:");
  uint64_t v35 = [v7 selectionSnapshot];
  [v6 setSelectionSnapshot:v35];

  id v36 = [v7 draggedAssetReferences];
  [v6 setDraggedAssetReferences:v36];

  id v37 = [v7 dropTargetAssetReference];
  [v6 setDropTargetAssetReference:v37];

  objc_msgSend(v6, "setIsSelecting:", objc_msgSend(v7, "isInSelectMode"));
  [v6 setCanStartSelecting:1];
  objc_msgSend(v6, "setWantsDimmedSelectionStyle:", objc_msgSend(v7, "wantsDimmedSelectionStyle"));
  objc_msgSend(v6, "setWantsNumberedSelectionStyle:", objc_msgSend(v7, "wantsNumberedSelectionStyle"));
  objc_msgSend(v6, "setWantsFileSizeBadge:", objc_msgSend(v7, "wantsFileSizeBadge"));
  objc_msgSend(v6, "setWantsAssetIndexBadge:", objc_msgSend(v7, "wantsAssetIndexBadge"));
  [v6 setRemovesContentLayoutWhenEmpty:0];
  v38 = [v7 tapbackStatusManager];
  [v6 setTapbackStatusManager:v38];

  uint64_t v39 = [v7 decorationDataSource];
  [v6 setDecorationDataSource:v39];

  [(PXPhotosSectionedLayout *)self preferredCornerRadius];
  objc_msgSend(v6, "setPreferredCornerRadius:");
  LODWORD(v39) = [v6 isFaceModeEnabled];
  int v40 = v39 ^ [v7 isFaceModeEnabled] | v13;
  objc_msgSend(v6, "setFaceModeEnabled:", objc_msgSend(v7, "isFaceModeEnabled"));
  v41 = [v6 dataSource];
  v69[0] = [v41 identifier];
  v69[1] = [v6 section];
  int64x2_t v70 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v42 = [v41 assetCollectionReferenceAtSectionIndexPath:v69];
  v43 = [v7 assetCollectionActionManager];
  if (![v7 allowsInlineAddBehavior]
    || ([v7 isInSelectMode] & 1) != 0
    || ![v43 canPerformActionType:@"PXAssetCollectionActionTypeAddFrom" assetCollectionReference:v42]|| (objc_msgSend(v41, "containsAnyItems") & 1) == 0 && (objc_msgSend(v7, "allowsEmptyPlaceholderBehavior") & 1) != 0)
  {
    v44 = [v6 addContentActionHandler];

    if (!v44) {
      goto LABEL_40;
    }
    [v6 setAddContentActionHandler:0];
    goto LABEL_39;
  }
  v66 = [v6 addContentActionHandler];

  if (!v66)
  {
    objc_initWeak(location, self);
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __68__PXPhotosSectionedLayout__configureSectionLayout_sectionIndexPath___block_invoke;
    v67[3] = &unk_1E5DC9528;
    objc_copyWeak(&v68, location);
    [v6 setAddContentActionHandler:v67];
    objc_destroyWeak(&v68);
    objc_destroyWeak(location);
LABEL_39:
    LOBYTE(v40) = 1;
  }
LABEL_40:
  [v6 setAutomaticallyUpdatesPadding:1];
  [(PXPhotosSectionedLayout *)self interSectionSpacing];
  objc_msgSend(v6, "setIntersectionSpacing:");
  SEL v45 = [v6 headerLayout];
  if ([v7 allowsSelectSectionAction]) {
    uint64_t v46 = [v7 isInSelectMode];
  }
  else {
    uint64_t v46 = 0;
  }
  [v45 setIsInSelectMode:v46];
  v47 = [v7 selectionSnapshot];
  [v45 setSelectionSnapshot:v47];

  int v48 = [v7 viewBasedDecorationsEnabled];
  v49 = [v6 assetDecorationSource];
  v50 = v49;
  if (!v48)
  {
    uint64_t v53 = [v7 forbiddenBadges];
    unint64_t v52 = [v50 forbiddenBadges] | v53;
    goto LABEL_47;
  }
  [v49 setForbiddenBadges:-1];

  v51 = [v6 assetDecorationSource];
  [v51 setDurationAlwaysHidden:1];

  if ([v7 wantsAssetIndexBadge])
  {
    v50 = [v6 assetDecorationSource];
    unint64_t v52 = [v50 forbiddenBadges] & 0xFFFFDFFFFFFFFFFFLL;
LABEL_47:
    [v50 setForbiddenBadges:v52];
  }
  uint64_t v54 = [v7 allowsInteractiveFavoriteBadges] ^ 1;
  v55 = [v6 assetDecorationSource];
  [v55 setHidesInteractiveFavoriteBadges:v54];

  v56 = [v7 badgesModifier];
  id v57 = [v6 assetDecorationSource];
  [v57 setBadgesModifier:v56];

  objc_msgSend(v6, "setItemCaptionsVisible:", objc_msgSend(v7, "captionsVisible"));
  [v6 setShowAllAffordanceStyle:0];
  [(PXPhotosSectionedLayout *)self _updateSublayoutGridConfiguratorForLayout:v6];
  id v58 = [v6 headerLayout];
  if (v58)
  {
    BOOL configureSectionHeaderLayout = self->_headerProviderRespondsTo.configureSectionHeaderLayout;

    if (configureSectionHeaderLayout)
    {
      v60 = [(PXPhotosSectionedLayout *)self headerLayoutProvider];
      v61 = [v6 headerLayout];
      [v60 configureSectionHeaderLayout:v61 inAssetSectionLayout:v6 forSectionedLayout:self];
    }
  }
  v62 = [v6 bodyContentLayout];

  if (v62)
  {
    v63 = [(PXPhotosSectionedLayout *)self bodyLayoutProvider];
    v64 = [v6 bodyContentLayout];
    [v63 configureSectionBodyLayout:v64 inAssetSectionLayout:v6 forSectionedLayout:self];
  }
  return v40;
}

void __68__PXPhotosSectionedLayout__configureSectionLayout_sectionIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performAddActionForSectionLayout:v3];
}

- (void)enumerateSectionBoundariesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  objc_super v7 = [(PXGLayout *)self sublayoutDataStore];
  uint64_t v8 = [v7 count];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __76__PXPhotosSectionedLayout_enumerateSectionBoundariesWithOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E5DC9500;
  id v11 = v6;
  id v9 = v6;
  objc_msgSend(v7, "enumerateSublayoutGeometriesInRange:options:usingBlock:", 0, v8, a3, v10);
}

uint64_t __76__PXPhotosSectionedLayout_enumerateSectionBoundariesWithOptions_usingBlock___block_invoke(uint64_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, uint64_t a6, void *a7)
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
  unint64_t v10 = [(PXGLayout *)self sublayoutDataStore];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PXPhotosSectionedLayout_enumerateAssetsSectionSublayoutsInRect_usingBlock___block_invoke;
  v12[3] = &unk_1E5DC94D8;
  id v13 = v9;
  id v11 = v9;
  objc_msgSend(v10, "enumerateSublayoutsInRect:usingBlock:", v12, x, y, width, height);
}

void __77__PXPhotosSectionedLayout_enumerateAssetsSectionSublayoutsInRect_usingBlock___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  unint64_t v12 = objc_msgSend(a7, "px_assetsSectionLayout");
  if (v12)
  {
    id v13 = v12;
    (*(void (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(a2, a3, a4, a5);
    unint64_t v12 = v13;
  }
}

- (void)enumerateAssetsSectionSublayoutsUsingBlock:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PXGLayout *)self sublayoutDataStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PXPhotosSectionedLayout_enumerateAssetsSectionSublayoutsUsingBlock___block_invoke;
  v7[3] = &unk_1E5DC94B0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateSublayoutsUsingBlock:v7];
}

void __70__PXPhotosSectionedLayout_enumerateAssetsSectionSublayoutsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = objc_msgSend(a3, "px_assetsSectionLayout");
  if (v4)
  {
    unint64_t v5 = v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v4 = v5;
  }
}

- (BOOL)_shouldFaultInSection:(int64_t)a3 inDataSource:(id)a4
{
  if ([a4 numberOfItemsInSection:a3] <= 0)
  {
    id v6 = [(PXPhotosSectionedLayout *)self viewModel];
    int v5 = [v6 allowsEmptyPlaceholderBehavior] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)_performAddActionForSectionLayout:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 dataSource];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = [v4 section];

  v16[0] = v6;
  v16[1] = v7;
  int64x2_t v17 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  id v8 = [v5 assetCollectionReferenceAtSectionIndexPath:v16];
  id v9 = [(PXPhotosSectionedLayout *)self viewModel];
  unint64_t v10 = [v9 assetCollectionActionManager];

  id v11 = [v10 actionPerformerForActionType:@"PXAssetCollectionActionTypeAddFrom" assetCollectionReference:v8];
  if (v11)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    _OWORD v14[2] = __61__PXPhotosSectionedLayout__performAddActionForSectionLayout___block_invoke;
    v14[3] = &unk_1E5DD3158;
    id v15 = v8;
    [v11 performActionWithCompletionHandler:v14];
    unint64_t v12 = v15;
  }
  else
  {
    unint64_t v12 = PLGridZeroGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v8 assetCollection];
      *(_DWORD *)buf = 138412290;
      int64x2_t v19 = v13;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Missing action performer for add button action. Asset collection: %@", buf, 0xCu);
    }
  }
}

void __61__PXPhotosSectionedLayout__performAddActionForSectionLayout___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLGridZeroGetLog();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) assetCollection];
      int v13 = 138412290;
      BOOL v14 = v8;
      id v9 = "Add action succeeded for asset collection %@";
      unint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v8 = [*(id *)(a1 + 32) assetCollection];
    int v13 = 138412546;
    BOOL v14 = v8;
    __int16 v15 = 2112;
    id v16 = v5;
    id v9 = "Add action failed for asset collection %@ with error %@";
    unint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

- (id)_createAnimationForChangeFromDataSource:(id)a3 toDataSource:(id)a4 changeDetails:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_log_type_t v11 = [(PXGLayout *)self createDefaultAnimationForCurrentContext];
  uint32_t v12 = [v11 delegate];

  if (!v12
    && [off_1E5DA8488 changeDetailsAreOnlyInsertionsOrOnlyRemovalsAtEnd:v10 fromDataSource:v8 toDataSource:v9])
  {
    int v13 = objc_alloc_init(PXPhotosSlideAnimationDelegate);
    [v11 setDelegate:v13];
  }
  return v11;
}

- (void)enumerateItemsGeometriesInRect:(CGRect)a3 dataSource:(id)a4 usingBlock:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  id v12 = a4;
  int v13 = [(PXPhotosSectionedLayout *)self assetsDataSource];
  int v14 = [v12 isEqual:v13];

  if (v14)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__PXPhotosSectionedLayout_enumerateItemsGeometriesInRect_dataSource_usingBlock___block_invoke;
    v15[3] = &unk_1E5DC9488;
    id v16 = v11;
    -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v15, x, y, width, height);
  }
}

void __80__PXPhotosSectionedLayout_enumerateItemsGeometriesInRect_dataSource_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [a3 bodyItemsGeometry];
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v6 + 16))(v6, v7, a2, a4);
}

- (id)presentedItemsGeometryForSection:(unint64_t)a3 inDataSource:(id)a4
{
  id v6 = a4;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__238006;
  id v16 = __Block_byref_object_dispose__238007;
  id v17 = 0;
  id v7 = [(PXPhotosSectionedLayout *)self assetsDataSource];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__PXPhotosSectionedLayout_presentedItemsGeometryForSection_inDataSource___block_invoke;
    v11[3] = &unk_1E5DC9460;
    void v11[4] = &v12;
    v11[5] = a3;
    [(PXPhotosSectionedLayout *)self enumerateAssetsSectionSublayoutsUsingBlock:v11];
  }
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __73__PXPhotosSectionedLayout_presentedItemsGeometryForSection_inDataSource___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  if (*(void *)(a1 + 40) == a2)
  {
    uint64_t v6 = [a3 bodyItemsGeometry];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (id)topmostHeaderSnapshotInRect:(CGRect)a3
{
  if (self->_headerProviderRespondsTo.floatingHeaderSnapshot)
  {
    uint64_t v14 = 0;
    __int16 v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__238006;
    uint64_t v18 = __Block_byref_object_dispose__238007;
    id v19 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __55__PXPhotosSectionedLayout_topmostHeaderSnapshotInRect___block_invoke;
    v13[3] = &unk_1E5DC9438;
    v13[4] = &v14;
    -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v13, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    id v4 = (void *)v15[5];
    if (v4)
    {
      id v5 = [v4 dataSource];
      uint64_t v6 = [v5 identifier];
      uint64_t v7 = [(id)v15[5] section];
      int v8 = [(PXPhotosSectionedLayout *)self headerLayoutProvider];
      v11[0] = v6;
      v11[1] = v7;
      int64x2_t v12 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      id v9 = [v8 floatingHeaderSnapshotForSectionedLayout:self dataSource:v5 sectionIndexPath:v11];
    }
    else
    {
      id v9 = 0;
    }
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

void __55__PXPhotosSectionedLayout_topmostHeaderSnapshotInRect___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7, unsigned char *a8)
{
  id v12 = a7;
  if (a5 > 0.0)
  {
    id v13 = v12;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a7);
    id v12 = v13;
    *a8 = 1;
  }
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
  v15[2] = __58__PXPhotosSectionedLayout_assetsIteratorForContentInRect___block_invoke;
  v15[3] = &unk_1E5DC9348;
  void v15[4] = self;
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  id v9 = v8;
  id v16 = v9;
  -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v15, x, y, width, height);
  if ([v9 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PXPhotosSectionedLayout_assetsIteratorForContentInRect___block_invoke_2;
    aBlock[3] = &unk_1E5DC9410;
    id v14 = v9;
    id v10 = _Block_copy(aBlock);
  }
  else
  {
    id v10 = 0;
  }
  id v11 = _Block_copy(v10);

  return v11;
}

void __58__PXPhotosSectionedLayout_assetsIteratorForContentInRect___block_invoke(double *a1, uint64_t a2, void *a3)
{
  id v4 = (void *)*((void *)a1 + 4);
  double v5 = a1[6];
  double v6 = a1[7];
  double v7 = a1[8];
  double v8 = a1[9];
  id v9 = a3;
  objc_msgSend(v4, "convertRect:toDescendantLayout:", v9, v5, v6, v7, v8);
  aBlock = objc_msgSend(v9, "assetsIteratorForContentInRect:");

  id v10 = aBlock;
  if (aBlock)
  {
    id v11 = (void *)*((void *)a1 + 5);
    id v12 = _Block_copy(aBlock);
    [v11 addObject:v12];

    id v10 = aBlock;
  }
}

void __58__PXPhotosSectionedLayout_assetsIteratorForContentInRect___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PXPhotosSectionedLayout_assetsIteratorForContentInRect___block_invoke_3;
  v6[3] = &unk_1E5DC93E8;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

uint64_t __58__PXPhotosSectionedLayout_assetsIteratorForContentInRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3
{
  id v3 = [(PXPhotosSectionedLayout *)self viewModel];
  id v4 = [v3 visibleAssetCollections];
  id v5 = (void *)[v4 copy];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PXPhotosSectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke;
  aBlock[3] = &unk_1E5DC93C0;
  id v11 = v5;
  id v6 = v5;
  id v7 = _Block_copy(aBlock);
  double v8 = _Block_copy(v7);

  return v8;
}

void __68__PXPhotosSectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PXPhotosSectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke_2;
  v6[3] = &unk_1E5DC9398;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

uint64_t __68__PXPhotosSectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)locationNamesFutureForContentInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __63__PXPhotosSectionedLayout_locationNamesFutureForContentInRect___block_invoke;
  v16[3] = &unk_1E5DC9348;
  v16[4] = self;
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  id v9 = v8;
  id v17 = v9;
  -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v16, x, y, width, height);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PXPhotosSectionedLayout_locationNamesFutureForContentInRect___block_invoke_2;
  aBlock[3] = &unk_1E5DC9370;
  id v15 = v9;
  id v10 = v9;
  id v11 = _Block_copy(aBlock);
  id v12 = (void *)[v11 copy];

  return v12;
}

void __63__PXPhotosSectionedLayout_locationNamesFutureForContentInRect___block_invoke(double *a1, uint64_t a2, void *a3)
{
  id v4 = (void *)*((void *)a1 + 4);
  double v5 = a1[6];
  double v6 = a1[7];
  double v7 = a1[8];
  double v8 = a1[9];
  id v9 = a3;
  objc_msgSend(v4, "convertRect:toDescendantLayout:", v9, v5, v6, v7, v8);
  aBlock = objc_msgSend(v9, "locationNamesFutureForContentInRect:");

  id v10 = aBlock;
  if (aBlock)
  {
    id v11 = (void *)*((void *)a1 + 5);
    id v12 = _Block_copy(aBlock);
    [v11 addObject:v12];

    id v10 = aBlock;
  }
}

void __63__PXPhotosSectionedLayout_locationNamesFutureForContentInRect___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v7));
        objc_msgSend(v2, "addObjectsFromArray:", v8, (void)v9);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  PXArrayFromFrequencySortAndDeduplicationOfNSStringSet();
}

- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __67__PXPhotosSectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke;
  v21[3] = &unk_1E5DC92F8;
  v21[4] = self;
  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  unint64_t v27 = a4;
  id v11 = v10;
  id v22 = v11;
  -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v21, x, y, width, height);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  double v18 = __67__PXPhotosSectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke_2;
  double v19 = &unk_1E5DC9320;
  id v20 = v11;
  id v12 = v11;
  id v13 = _Block_copy(&v16);
  uint64_t v14 = objc_msgSend(v13, "copy", v16, v17, v18, v19);

  return v14;
}

void __67__PXPhotosSectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke(double *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)*((void *)a1 + 4);
  double v5 = a1[6];
  double v6 = a1[7];
  double v7 = a1[8];
  double v8 = a1[9];
  id v9 = a3;
  objc_msgSend(v4, "convertRect:toDescendantLayout:", v9, v5, v6, v7, v8);
  aBlock = objc_msgSend(v9, "dateIntervalFutureForContentInRect:type:", *((void *)a1 + 10));

  id v10 = aBlock;
  if (aBlock)
  {
    id v11 = (void *)*((void *)a1 + 5);
    id v12 = _Block_copy(aBlock);
    [v11 addObject:v12];

    id v10 = aBlock;
  }
}

id __67__PXPhotosSectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke_2(uint64_t a1)
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

- (void)setHorizontalScrollingHintFactor:(double)a3
{
}

- (void)setBodyLayoutProvider:(id)a3
{
  id v5 = (PXPhotosSectionBodyLayoutProvider *)a3;
  bodyLayoutProvider = self->_bodyLayoutProvider;
  if (bodyLayoutProvider != v5)
  {
    uint64_t v7 = v5;
    [(PXPhotosSectionBodyLayoutProvider *)bodyLayoutProvider setInvalidationDelegate:0];
    objc_storeStrong((id *)&self->_bodyLayoutProvider, a3);
    [(PXPhotosSectionBodyLayoutProvider *)self->_bodyLayoutProvider setInvalidationDelegate:self];
    self->_BOOL shouldRecreateBodyLayouts = 1;
    [(PXPhotosSectionedLayout *)self _invalidateSublayoutsConfiguration];
    id v5 = v7;
  }
}

- (void)setHeaderLayoutProvider:(id)a3
{
  id v5 = (PXPhotosSectionHeaderLayoutProvider *)a3;
  headerLayoutProvider = self->_headerLayoutProvider;
  if (headerLayoutProvider != v5)
  {
    double v8 = v5;
    p_headerProviderRespondsTo = &self->_headerProviderRespondsTo;
    if (self->_headerProviderRespondsTo.invalidationDelegate) {
      [(PXPhotosSectionHeaderLayoutProvider *)headerLayoutProvider setInvalidationDelegate:0];
    }
    objc_storeStrong((id *)&self->_headerLayoutProvider, a3);
    p_headerProviderRespondsTo->invalidationDelegate = objc_opt_respondsToSelector() & 1;
    self->_headerProviderRespondsTo.floatingHeaderSnapshot = objc_opt_respondsToSelector() & 1;
    self->_headerProviderRespondsTo.BOOL configureSectionHeaderLayout = objc_opt_respondsToSelector() & 1;
    if (p_headerProviderRespondsTo->invalidationDelegate) {
      [(PXPhotosSectionHeaderLayoutProvider *)self->_headerLayoutProvider setInvalidationDelegate:self];
    }
    self->_BOOL shouldRecreateHeaderLayouts = 1;
    [(PXPhotosSectionedLayout *)self _invalidateSublayoutsConfiguration];
    id v5 = v8;
  }
}

- (void)setInterSectionSpacing:(double)a3
{
  if (self->_interSectionSpacing != a3)
  {
    self->_interSectionSpacing = a3;
    [(PXPhotosSectionedLayout *)self _invalidateSublayoutsConfiguration];
  }
}

- (void)setSpec:(id)a3
{
  id v5 = (PXPhotosLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXPhotosSectionedLayout *)self _invalidateSublayoutsSpec];
    [(PXPhotosSectionedLayout *)self _invalidateSectionsBlur];
    [(PXPhotosSectionedLayout *)self _invalidateSublayoutsConfiguration];
    [(PXPhotosLayoutSpec *)v5 interSectionSpacing];
    -[PXPhotosSectionedLayout setInterSectionSpacing:](self, "setInterSectionSpacing:");
  }
}

- (PXAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (PXPhotosSectionedLayout)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosSectionedLayout.m", 144, @"%s is not available as initializer", "-[PXPhotosSectionedLayout init]");

  abort();
}

- (PXPhotosSectionedLayout)initWithViewModel:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXPhotosSectionedLayout;
  uint64_t v6 = [(PXGStackLayout *)&v14 init];
  uint64_t v7 = v6;
  if (v6)
  {
    CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB10] + 16);
    v6->_maskRect.origin = (CGPoint)*MEMORY[0x1E4F1DB10];
    v6->_maskRect.size = v8;
    v6->_captureSpriteIndedouble x = -1;
    int v9 = [v5 wantsSingleRowScrollingLayout];
    if ([v5 scrollingBehavior] == 1) {
      int v10 = 1;
    }
    else {
      int v10 = v9;
    }
    if (v10) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    [(PXGStackLayout *)v7 setAxis:v11];
    objc_storeStrong((id *)&v7->_viewModel, a3);
    [v5 registerChangeObserver:v7 context:PhotosViewModelObserverContext];
    [(PXPhotosSectionedLayout *)v7 _invalidateSublayoutsDataSource];
    [(PXPhotosSectionedLayout *)v7 _invalidateSublayoutsSpec];
    [(PXPhotosSectionedLayout *)v7 _invalidateSublayoutsConfiguration];
    [(PXGLayout *)v7 setContentSource:v7];
    [(PXGStackLayout *)v7 setSublayoutFaultingDelegate:v7];
    id v12 = [(PXGLayout *)v7 axGroup];
    [v12 setAxIdentifier:@"photos_sectioned_layout"];
  }
  return v7;
}

@end