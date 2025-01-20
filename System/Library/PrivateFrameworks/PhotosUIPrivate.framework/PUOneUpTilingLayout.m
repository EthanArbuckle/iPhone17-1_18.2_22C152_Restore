@interface PUOneUpTilingLayout
+ (CGRect)rectForFittingToTargetPixelSize:(CGSize)a3 imagePixelSize:(CGSize)a4 bestSquareUnitRect:(CGRect)a5;
+ (CGRect)untransformedRectForItemWithAspectRatio:(double)a3 pageRect:(CGRect)a4 safeInsets:(UIEdgeInsets)a5;
+ (id)centerTileKinds;
+ (void)initialize;
- (BOOL)_accessoryViewVisibilityForItemAtIndexPath:(id)a3;
- (BOOL)_isShowingInfoPanelForItemAtIndexPath:(id)a3;
- (BOOL)_isVideoPlacholderVisibleForItemAtIndexPath:(id)a3;
- (BOOL)_shouldApplyInsetStylingToContentWithRect:(CGRect)a3 indexPath:(id)a4;
- (BOOL)_shouldShowRenderIndicatorForIndexPath:(id)a3 size:(CGSize)a4;
- (BOOL)canDisplayLoadingIndicators;
- (BOOL)shouldHideMainContent;
- (BOOL)shouldPinContentToTop;
- (BOOL)useAssetExplorerReviewScreenBadgeTiles;
- (BOOL)useBackgroundTile;
- (BOOL)useBadgeTiles;
- (BOOL)useImportStatusIndicatorTiles;
- (BOOL)useReviewScreenBars;
- (BOOL)useSelectionIndicatorTiles;
- (BOOL)useSyndicationAttributionTile;
- (BOOL)useUserTransformTiles;
- (BOOL)useVerticalReviewScreenControlBarLayout;
- (CGPoint)_contentOffsetForItemAtIndexPath:(id)a3;
- (CGRect)_frameForTileWithSize:(CGSize)a3 centeredOnItemAtIndexPath:(id)a4;
- (CGRect)_pageRectForItemAtIndexPath:(id)a3;
- (CGRect)_untransformedRectForItemAtIndexPath:(id)a3;
- (CGRect)_untransformedRectForItemAtIndexPath:(id)a3 pageRect:(CGRect)a4;
- (CGRect)visibleRectForItemAtIndexPath:(id)a3 transitionProgress:(double)a4;
- (CGSize)_contentPixelSizeForItemAtIndexPath:(id)a3;
- (CGSize)_itemSize;
- (CGSize)assetExplorerReviewScreenProgressIndicatorSize;
- (CGSize)bufferingIndicatorSize;
- (CGSize)displaySizeForInsetMatching;
- (CGSize)estimatedSectionSize;
- (CGSize)interpageSpacing;
- (CGSize)peopleRowSize;
- (CGSize)playButtonSize;
- (CGSize)progressIndicatorSize;
- (CGSize)renderIndicatorSize;
- (CGSize)sizeForSection:(int64_t)a3 numberOfItems:(int64_t)a4;
- (NSIndexPath)indexPathOfCurrentItem;
- (PUOneUpTilingLayout)init;
- (PUOneUpTilingLayoutDelegate)delegate;
- (PUParallaxComputer)parallaxComputer;
- (UIColor)insetContentBorderColor;
- (UIEdgeInsets)_cropInsetsForTileAtIndexPath:(id)a3 layoutRect:(CGRect)a4;
- (UIEdgeInsets)contentDecorationAdditionalInsets;
- (UIEdgeInsets)contentGuideInsets;
- (UIEdgeInsets)contentSafeInsets;
- (UIEdgeInsets)progressIndicatorContentInsets;
- (UITraitCollection)traitCollection;
- (double)_minimumBottomContentInsetsForItemAtIndexPath:(id)a3;
- (double)_normalizedTransitionProgressFrom:(id)a3 withAbscissa:(double)a4 outNeighbor:(id *)a5;
- (double)insetContentBorderWidth;
- (double)insetContentCornerRadius;
- (double)minimumMarginForInsetContent;
- (double)transitionProgress;
- (id)_createLayoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4;
- (id)_displayTileTransformForItemAtIndexPath:(id)a3 options:(unint64_t)a4;
- (id)_displayTileTransformForItemAtIndexPath:(id)a3 pageSize:(CGSize)a4 secondaryDisplayTransform:(id)a5 options:(unint64_t)a6;
- (id)_indexPathOfItemClosestToAbscissa:(double)a3;
- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4;
- (id)preferredScrollInfo;
- (int64_t)windowInterfaceOrientation;
- (void)_collectLayoutInfosForTilesInRect:(CGRect)a3 withIndexPath:(id)a4 kinds:(id)a5 toSet:(id)a6;
- (void)_getLayoutRect:(CGRect *)a3 transform:(CGAffineTransform *)a4 parallaxOffset:(CGPoint *)a5 contentsRect:(CGRect *)a6 alpha:(double *)a7 forContentOfItemAtIndexPath:(id)a8 options:(unint64_t)a9;
- (void)_getLayoutRect:(CGRect *)a3 transform:(CGAffineTransform *)a4 parallaxOffset:(CGPoint *)a5 forContentOfItemAtIndexPath:(id)a6 options:(unint64_t)a7;
- (void)_invalidateContentRelatedTilesWithIndexPath:(id)a3 inContext:(id)a4;
- (void)addLayoutInfosForSupplementaryTilesInRect:(CGRect)a3 toSet:(id)a4;
- (void)addLayoutInfosForTilesInRect:(CGRect)a3 section:(int64_t)a4 toSet:(id)a5;
- (void)invalidateAccessoryForItemAtIndexPath:(id)a3 withOptions:(unint64_t)a4;
- (void)invalidateAllContentTiles;
- (void)invalidateBadgeSizeForItemAtIndexPath:(id)a3;
- (void)invalidateContentOffsetForItemAtIndexPath:(id)a3 withOptions:(unint64_t)a4;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)invalidateLoadingIndicatorForItemAtIndexPath:(id)a3;
- (void)invalidateModelTileTransformForItemAtIndexPath:(id)a3;
- (void)invalidatePrimaryContentTiles;
- (void)invalidateProgressIndicatorForItemAtIndexPath:(id)a3;
- (void)invalidateVideoPlaceholderForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
- (void)setAssetExplorerReviewScreenProgressIndicatorSize:(CGSize)a3;
- (void)setBufferingIndicatorSize:(CGSize)a3;
- (void)setCanDisplayLoadingIndicators:(BOOL)a3;
- (void)setContentDecorationAdditionalInsets:(UIEdgeInsets)a3;
- (void)setContentGuideInsets:(UIEdgeInsets)a3;
- (void)setContentSafeInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplaySizeForInsetMatching:(CGSize)a3;
- (void)setInsetContentBorderColor:(id)a3;
- (void)setInsetContentBorderWidth:(double)a3;
- (void)setInsetContentCornerRadius:(double)a3;
- (void)setInterpageSpacing:(CGSize)a3;
- (void)setMinimumMarginForInsetContent:(double)a3;
- (void)setParallaxComputer:(id)a3;
- (void)setPeopleRowSize:(CGSize)a3;
- (void)setPlayButtonSize:(CGSize)a3;
- (void)setProgressIndicatorContentInsets:(UIEdgeInsets)a3;
- (void)setProgressIndicatorSize:(CGSize)a3;
- (void)setRenderIndicatorSize:(CGSize)a3;
- (void)setShouldHideMainContent:(BOOL)a3;
- (void)setShouldPinContentToTop:(BOOL)a3;
- (void)setTraitCollection:(id)a3;
- (void)setUseAssetExplorerReviewScreenBadgeTiles:(BOOL)a3;
- (void)setUseBackgroundTile:(BOOL)a3;
- (void)setUseBadgeTiles:(BOOL)a3;
- (void)setUseImportStatusIndicatorTiles:(BOOL)a3;
- (void)setUseReviewScreenBars:(BOOL)a3;
- (void)setUseSelectionIndicatorTiles:(BOOL)a3;
- (void)setUseSyndicationAttributionTile:(BOOL)a3;
- (void)setUseUserTransformTiles:(BOOL)a3;
- (void)setUseVerticalReviewScreenControlBarLayout:(BOOL)a3;
- (void)setVisibleRect:(CGRect)a3;
- (void)setWindowInterfaceOrientation:(int64_t)a3;
@end

@implementation PUOneUpTilingLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insetContentBorderColor, 0);
  objc_storeStrong((id *)&self->_parallaxComputer, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutInfosByIndexPathByTileKind, 0);
  objc_storeStrong((id *)&self->_neighborIndexPath, 0);
  objc_storeStrong((id *)&self->_inFocusIndexPath, 0);
}

- (double)insetContentBorderWidth
{
  return self->_insetContentBorderWidth;
}

- (UIColor)insetContentBorderColor
{
  return self->_insetContentBorderColor;
}

- (double)insetContentCornerRadius
{
  return self->_insetContentCornerRadius;
}

- (void)setMinimumMarginForInsetContent:(double)a3
{
  self->_minimumMarginForInsetContent = a3;
}

- (double)minimumMarginForInsetContent
{
  return self->_minimumMarginForInsetContent;
}

- (BOOL)useSyndicationAttributionTile
{
  return self->_useSyndicationAttributionTile;
}

- (BOOL)shouldHideMainContent
{
  return self->_shouldHideMainContent;
}

- (void)setParallaxComputer:(id)a3
{
}

- (PUParallaxComputer)parallaxComputer
{
  return self->_parallaxComputer;
}

- (BOOL)shouldPinContentToTop
{
  return self->_shouldPinContentToTop;
}

- (CGSize)displaySizeForInsetMatching
{
  double width = self->_displaySizeForInsetMatching.width;
  double height = self->_displaySizeForInsetMatching.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTraitCollection:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setUseUserTransformTiles:(BOOL)a3
{
  self->_useUserTransformTiles = a3;
}

- (BOOL)useUserTransformTiles
{
  return self->_useUserTransformTiles;
}

- (BOOL)canDisplayLoadingIndicators
{
  return self->_canDisplayLoadingIndicators;
}

- (CGSize)bufferingIndicatorSize
{
  double width = self->_bufferingIndicatorSize.width;
  double height = self->_bufferingIndicatorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)assetExplorerReviewScreenProgressIndicatorSize
{
  double width = self->_assetExplorerReviewScreenProgressIndicatorSize.width;
  double height = self->_assetExplorerReviewScreenProgressIndicatorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)renderIndicatorSize
{
  double width = self->_renderIndicatorSize.width;
  double height = self->_renderIndicatorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)progressIndicatorContentInsets
{
  double top = self->_progressIndicatorContentInsets.top;
  double left = self->_progressIndicatorContentInsets.left;
  double bottom = self->_progressIndicatorContentInsets.bottom;
  double right = self->_progressIndicatorContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)peopleRowSize
{
  double width = self->_peopleRowSize.width;
  double height = self->_peopleRowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)progressIndicatorSize
{
  double width = self->_progressIndicatorSize.width;
  double height = self->_progressIndicatorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)playButtonSize
{
  double width = self->_playButtonSize.width;
  double height = self->_playButtonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)useVerticalReviewScreenControlBarLayout
{
  return self->_useVerticalReviewScreenControlBarLayout;
}

- (int64_t)windowInterfaceOrientation
{
  return self->_windowInterfaceOrientation;
}

- (void)setUseReviewScreenBars:(BOOL)a3
{
  self->_useReviewScreenBars = a3;
}

- (BOOL)useReviewScreenBars
{
  return self->_useReviewScreenBars;
}

- (BOOL)useImportStatusIndicatorTiles
{
  return self->_useImportStatusIndicatorTiles;
}

- (BOOL)useSelectionIndicatorTiles
{
  return self->_useSelectionIndicatorTiles;
}

- (BOOL)useAssetExplorerReviewScreenBadgeTiles
{
  return self->_useAssetExplorerReviewScreenBadgeTiles;
}

- (BOOL)useBadgeTiles
{
  return self->_useBadgeTiles;
}

- (void)setUseBackgroundTile:(BOOL)a3
{
  self->_useBackgroundTile = a3;
}

- (BOOL)useBackgroundTile
{
  return self->_useBackgroundTile;
}

- (UIEdgeInsets)contentDecorationAdditionalInsets
{
  double top = self->_contentDecorationAdditionalInsets.top;
  double left = self->_contentDecorationAdditionalInsets.left;
  double bottom = self->_contentDecorationAdditionalInsets.bottom;
  double right = self->_contentDecorationAdditionalInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)contentSafeInsets
{
  double top = self->_contentSafeInsets.top;
  double left = self->_contentSafeInsets.left;
  double bottom = self->_contentSafeInsets.bottom;
  double right = self->_contentSafeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentGuideInsets:(UIEdgeInsets)a3
{
  self->_contentGuideInsets = a3;
}

- (UIEdgeInsets)contentGuideInsets
{
  double top = self->_contentGuideInsets.top;
  double left = self->_contentGuideInsets.left;
  double bottom = self->_contentGuideInsets.bottom;
  double right = self->_contentGuideInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (void)setInterpageSpacing:(CGSize)a3
{
  self->_interpageSpacing = a3;
}

- (CGSize)interpageSpacing
{
  double width = self->_interpageSpacing.width;
  double height = self->_interpageSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PUOneUpTilingLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUOneUpTilingLayoutDelegate *)WeakRetained;
}

- (BOOL)_shouldApplyInsetStylingToContentWithRect:(CGRect)a3 indexPath:(id)a4
{
  id v5 = a4;
  if ([v5 length] != 2
    || -[PUOneUpTilingLayout _accessoryViewVisibilityForItemAtIndexPath:](self, "_accessoryViewVisibilityForItemAtIndexPath:", v5)|| self->_delegateFlags.respondsToCanApplyInsetStylingToItemAtIndexPath&& (-[PUOneUpTilingLayout delegate](self, "delegate"), v6 = objc_claimAutoreleasedReturnValue(), int v7 = [v6 layout:self canApplyInsetStylingToItemAtIndexPath:v5], v6, !v7))
  {
    char v8 = 0;
  }
  else
  {
    [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v5];
    char v8 = PXRectStrictlyContainsAnyVertexOfRect();
  }

  return v8;
}

- (double)_normalizedTransitionProgressFrom:(id)a3 withAbscissa:(double)a4 outNeighbor:(id *)a5
{
  id v9 = a3;
  if (!v9)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PUOneUpTilingLayout.m", 1930, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];
  }
  [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v9];
  CGFloat x = v42.origin.x;
  CGFloat y = v42.origin.y;
  CGFloat width = v42.size.width;
  CGFloat height = v42.size.height;
  double MidX = CGRectGetMidX(v42);
  BOOL v15 = [(PUSectionedTilingLayout *)self leftToRight];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__49338;
  v40 = __Block_byref_object_dispose__49339;
  id v41 = 0;
  v16 = [(PUTilingLayout *)self dataSource];
  if (v15) {
    BOOL v17 = MidX > a4;
  }
  else {
    BOOL v17 = MidX < a4;
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __82__PUOneUpTilingLayout__normalizedTransitionProgressFrom_withAbscissa_outNeighbor___block_invoke;
  v33[3] = &unk_1E5F2BB28;
  id v18 = v9;
  id v34 = v18;
  v35 = &v36;
  [v16 enumerateIndexPathsStartingAtIndexPath:v18 reverseDirection:v17 usingBlock:v33];

  if (v37[5])
  {
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:");
    double v19 = fmax((a4 - MidX) / vabdd_f64(CGRectGetMidX(v43), MidX), -1.0);
    if (v19 > 1.0) {
      double v19 = 1.0;
    }
    if (v15) {
      double v20 = v19;
    }
    else {
      double v20 = -v19;
    }
  }
  else
  {
    [(PUTilingLayout *)self visibleRect];
    v52.origin.CGFloat x = x;
    v52.origin.CGFloat y = y;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    double v20 = 0.0;
    if (!CGRectContainsRect(v44, v52))
    {
      [(PUTilingLayout *)self visibleRect];
      CGFloat v21 = v45.size.height;
      CGFloat v31 = v45.origin.y;
      CGFloat v32 = v45.origin.x;
      CGFloat rect = v45.size.width;
      v53.origin.CGFloat x = x;
      v53.origin.CGFloat y = y;
      v53.size.CGFloat width = width;
      v53.size.CGFloat height = height;
      CGRect v46 = CGRectIntersection(v45, v53);
      double v22 = CGRectGetWidth(v46);
      v47.origin.CGFloat x = x;
      v47.origin.CGFloat y = y;
      v47.size.CGFloat width = width;
      v47.size.CGFloat height = height;
      double v23 = CGRectGetWidth(v47);
      v48.origin.CGFloat x = x;
      v48.origin.CGFloat y = y;
      v48.size.CGFloat width = width;
      v48.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v48);
      v49.origin.CGFloat y = v31;
      v49.origin.CGFloat x = v32;
      v49.size.CGFloat width = rect;
      v49.size.CGFloat height = v21;
      double v20 = 1.0 - v22 / v23;
      if (MaxX > CGRectGetMaxX(v49) && v15) {
        goto LABEL_21;
      }
      v50.origin.CGFloat x = x;
      v50.origin.CGFloat y = y;
      v50.size.CGFloat width = width;
      v50.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v50);
      v51.origin.CGFloat y = v31;
      v51.origin.CGFloat x = v32;
      v51.size.CGFloat width = rect;
      v51.size.CGFloat height = v21;
      if (MinX < CGRectGetMinX(v51) && !v15) {
LABEL_21:
      }
        double v20 = -v20;
    }
  }
  if (a5) {
    *a5 = (id) v37[5];
  }

  _Block_object_dispose(&v36, 8);
  return v20;
}

void __82__PUOneUpTilingLayout__normalizedTransitionProgressFrom_withAbscissa_outNeighbor___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)_indexPathOfItemClosestToAbscissa:(double)a3
{
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__49338;
  v65 = __Block_byref_object_dispose__49339;
  id v66 = 0;
  BOOL v6 = [(PUSectionedTilingLayout *)self leftToRight];
  uint64_t v7 = [(PUSectionedTilingLayout *)self computedSections];
  uint64_t v9 = v7 + v8;
  if (v7 < (unint64_t)(v7 + v8))
  {
    uint64_t v10 = v9 - 1;
    while (1)
    {
      [(PUSectionedTilingLayout *)self boundsForSection:v7];
      CGFloat v15 = v11;
      CGFloat v16 = v12;
      CGFloat v17 = v13;
      CGFloat v18 = v14;
      if (v6) {
        BOOL v19 = CGRectGetMinX(*(CGRect *)&v11) >= a3;
      }
      else {
        BOOL v19 = CGRectGetMaxX(*(CGRect *)&v11) <= a3;
      }
      uint64_t v20 = [(PUSectionedTilingLayout *)self numberOfItemsInSection:v7];
      v68.origin.CGFloat x = v15;
      v68.origin.CGFloat y = v16;
      v68.size.CGFloat width = v17;
      v68.size.CGFloat height = v18;
      if (CGRectGetMinX(v68) <= a3)
      {
        v72.origin.CGFloat x = v15;
        v72.origin.CGFloat y = v16;
        v72.size.CGFloat width = v17;
        v72.size.CGFloat height = v18;
        if (CGRectGetMaxX(v72) >= a3 && v20 >= 1)
        {
          v73.origin.CGFloat x = v15;
          v73.origin.CGFloat y = v16;
          v73.size.CGFloat width = v17;
          v73.size.CGFloat height = v18;
          double MinX = CGRectGetMinX(v73);
          [(PUOneUpTilingLayout *)self _itemSize];
          double v35 = v34;
          [(PUOneUpTilingLayout *)self interpageSpacing];
          double v37 = (a3 - MinX) / (v35 + v36);
          uint64_t v38 = (uint64_t)v37;
          if (!v6) {
            uint64_t v38 = v20 + ~(uint64_t)v37;
          }
          if (v38 >= v20) {
            uint64_t v39 = v20 - 1;
          }
          else {
            uint64_t v39 = v38;
          }
          if (v38 >= 0) {
            uint64_t v40 = v39;
          }
          else {
            uint64_t v40 = 0;
          }
          uint64_t v41 = [MEMORY[0x1E4F28D58] indexPathForItem:v40 inSection:v7];
LABEL_36:
          CGRect v44 = (void *)v62[5];
          v62[5] = v41;
          goto LABEL_37;
        }
      }
      if (!v19)
      {
        if (v7 != v10 || v7 < 0) {
          goto LABEL_38;
        }
        uint64_t v42 = v9;
        while ([(PUSectionedTilingLayout *)self numberOfItemsInSection:--v42] < 1)
        {
          if (v42 <= 0) {
            goto LABEL_38;
          }
        }
        int64_t v47 = [(PUSectionedTilingLayout *)self numberOfItemsInSection:v42];
        uint64_t v41 = [MEMORY[0x1E4F28D58] indexPathForItem:v47 - 1 inSection:v42];
        goto LABEL_36;
      }
      if (!v7)
      {
        uint64_t v21 = 0;
LABEL_31:
        uint64_t v43 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v21];
LABEL_32:
        CGRect v44 = (void *)v43;
        if (v43)
        {
          CGRect v45 = [(PUTilingLayout *)self dataSource];
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __57__PUOneUpTilingLayout__indexPathOfItemClosestToAbscissa___block_invoke;
          v60[3] = &unk_1E5F27E00;
          v60[4] = &v61;
          [v45 enumerateIndexPathsStartingAtIndexPath:v44 reverseDirection:1 usingBlock:v60];

          if (!v62[5])
          {
            CGRect v46 = [(PUTilingLayout *)self dataSource];
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = 3221225472;
            v59[2] = __57__PUOneUpTilingLayout__indexPathOfItemClosestToAbscissa___block_invoke_2;
            v59[3] = &unk_1E5F27E00;
            v59[4] = &v61;
            [v46 enumerateIndexPathsStartingAtIndexPath:v44 reverseDirection:0 usingBlock:v59];
          }
        }
        goto LABEL_37;
      }
      uint64_t v21 = v9 - 1;
      if (v7 == v10) {
        goto LABEL_31;
      }
      -[PUSectionedTilingLayout boundsForSection:](self, "boundsForSection:", v7 - 1, v21);
      CGFloat v57 = v24;
      CGFloat v58 = v25;
      CGFloat v26 = v22;
      CGFloat v27 = v23;
      if (v6)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v22);
        v69.origin.CGFloat x = v15;
        v69.origin.CGFloat y = v16;
        v69.size.CGFloat width = v17;
        v69.size.CGFloat height = v18;
        if (MaxX <= CGRectGetMinX(v69)) {
          goto LABEL_12;
        }
      }
      else
      {
        double v49 = CGRectGetMinX(*(CGRect *)&v22);
        v74.origin.CGFloat x = v15;
        v74.origin.CGFloat y = v16;
        v74.size.CGFloat width = v17;
        v74.size.CGFloat height = v18;
        if (v49 >= CGRectGetMaxX(v74)) {
          goto LABEL_42;
        }
      }
      v54 = [MEMORY[0x1E4F28B00] currentHandler];
      [v54 handleFailureInMethod:a2, self, @"PUOneUpTilingLayout.m", 1872, @"Invalid parameter not satisfying: %@", @"leftToRight ? CGRectGetMaxX(previousSectionBounds) <= CGRectGetMinX(sectionBounds) : CGRectGetMinX(previousSectionBounds) >= CGRectGetMaxX(sectionBounds)" object file lineNumber description];

      if (!v6)
      {
LABEL_42:
        v75.origin.CGFloat x = v26;
        v75.origin.CGFloat y = v27;
        v75.size.CGFloat width = v57;
        v75.size.CGFloat height = v58;
        double v50 = CGRectGetMinX(v75);
        v76.origin.CGFloat x = v15;
        v76.origin.CGFloat y = v16;
        v76.size.CGFloat width = v17;
        v76.size.CGFloat height = v18;
        CGFloat v51 = CGRectGetMaxX(v76);
        double v31 = v50 - a3;
        double v32 = a3 - v51;
        goto LABEL_43;
      }
LABEL_12:
      v70.origin.CGFloat x = v26;
      v70.origin.CGFloat y = v27;
      v70.size.CGFloat width = v57;
      v70.size.CGFloat height = v58;
      double v29 = CGRectGetMaxX(v70);
      v71.origin.CGFloat x = v15;
      v71.origin.CGFloat y = v16;
      v71.size.CGFloat width = v17;
      v71.size.CGFloat height = v18;
      CGFloat v30 = CGRectGetMinX(v71);
      double v31 = a3 - v29;
      double v32 = v30 - a3;
LABEL_43:
      if (v31 > v32)
      {
        uint64_t v43 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v7];
        goto LABEL_32;
      }
      uint64_t v52 = v7;
      if (v7 >= 1)
      {
        while ([(PUSectionedTilingLayout *)self numberOfItemsInSection:--v52] < 1)
        {
          CGRect v44 = 0;
          if (v52 <= 0) {
            goto LABEL_37;
          }
        }
        int64_t v53 = [(PUSectionedTilingLayout *)self numberOfItemsInSection:v52];
        uint64_t v43 = [MEMORY[0x1E4F28D58] indexPathForItem:v53 - 1 inSection:v52];
        goto LABEL_32;
      }
      CGRect v44 = 0;
LABEL_37:

LABEL_38:
      CGRect v48 = (void *)v62[5];
      if (v48) {
        goto LABEL_54;
      }
      if (++v7 == v9)
      {
        CGRect v48 = 0;
        goto LABEL_54;
      }
    }
  }
  CGRect v48 = (void *)v62[5];
LABEL_54:
  id v55 = v48;
  _Block_object_dispose(&v61, 8);

  return v55;
}

void __57__PUOneUpTilingLayout__indexPathOfItemClosestToAbscissa___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

void __57__PUOneUpTilingLayout__indexPathOfItemClosestToAbscissa___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (void)_getLayoutRect:(CGRect *)a3 transform:(CGAffineTransform *)a4 parallaxOffset:(CGPoint *)a5 contentsRect:(CGRect *)a6 alpha:(double *)a7 forContentOfItemAtIndexPath:(id)a8 options:(unint64_t)a9
{
  uint64_t v180 = *MEMORY[0x1E4F143B8];
  id v13 = a8;
  [(PUOneUpTilingLayout *)self _untransformedRectForItemAtIndexPath:v13];
  v169[0].origin.double x = v14;
  CGFloat v16 = v15;
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [(PUOneUpTilingLayout *)self _displayTileTransformForItemAtIndexPath:v13 options:a9];
  if (self->_delegateFlags.respondsToWillApplyDisplayTransform)
  {
    CGFloat v22 = [(PUOneUpTilingLayout *)self delegate];
    [v22 layout:self willApplyDisplayTileTransform:v21 forItemAtIndexPath:v13];
  }
  long long v175 = 0u;
  long long v176 = 0u;
  long long v174 = 0u;
  if (v21) {
    [v21 affineTransform];
  }
  double v23 = (CGPoint *)MEMORY[0x1E4F1DAD8];
  double v24 = *MEMORY[0x1E4F1DAD8];
  double v25 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if ((a9 & 2) == 0)
  {
    [(PUOneUpTilingLayout *)self _contentOffsetForItemAtIndexPath:v13];
    double v24 = v26;
    double v25 = v27;
  }
  [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v13];
  CGFloat rect = v28;
  CGFloat rect_16 = v29;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGPoint v173 = *v23;
  uint64_t v171 = 0;
  double v172 = 0.0;
  CGFloat angle = 0.0;
  *(_OWORD *)transform = v174;
  *(_OWORD *)&transform[16] = v175;
  *(_OWORD *)&transform[32] = v176;
  PUDecomposeTransform((uint64_t)transform, &v173, &v172, (double *)&v171, (long double *)&angle);
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    double v34 = PXAssertGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_OWORD *)transform = v174;
      *(_OWORD *)&transform[16] = v175;
      *(_OWORD *)&transform[32] = v176;
      v135 = NSStringFromCGAffineTransform((CGAffineTransform *)transform);
      v164 = [(PUOneUpTilingLayout *)self delegate];
      v207.origin.double x = rect;
      v207.origin.CGFloat y = rect_16;
      v207.size.CGFloat width = v31;
      v207.size.CGFloat height = v33;
      uint64_t v136 = NSStringFromCGRect(v207);
      *(_DWORD *)transform = 138413570;
      *(void *)&transform[4] = v135;
      *(_WORD *)&transform[12] = 2112;
      *(void *)&transform[14] = v21;
      *(_WORD *)&transform[22] = 2112;
      *(void *)&transform[24] = self;
      *(_WORD *)&transform[32] = 2112;
      *(void *)&transform[34] = v164;
      *(_WORD *)&transform[42] = 2112;
      *(void *)&transform[44] = v13;
      __int16 v178 = 2112;
      uint64_t v179 = v136;
      v137 = (void *)v136;
      _os_log_fault_impl(&dword_1AE9F8000, v34, OS_LOG_TYPE_FAULT, "Invalid affine transform (%@) from displayTileTransform %@: 1-up layout doesn't support shearing transforms. layout=%@; delegate=%@; indexPath=%@, pageRect=%@",
        transform,
        0x3Eu);
    }
  }
  v182.origin.double x = v169[0].origin.x;
  v182.origin.CGFloat y = v16;
  v182.size.CGFloat width = v18;
  v182.size.CGFloat height = v20;
  double MidX = CGRectGetMidX(v182);
  v183.origin.double x = v169[0].origin.x;
  v183.origin.CGFloat y = v16;
  v183.size.CGFloat width = v18;
  v183.size.CGFloat height = v20;
  double MidY = CGRectGetMidY(v183);
  CGFloat v156 = v18;
  CGFloat v157 = v31;
  CGFloat v160 = v16;
  CGFloat v158 = v33;
  if (self->_delegateFlags.respondsToShouldUseSquareImageInAccessoryForItemAtIndexPath)
  {
    double v36 = [(PUOneUpTilingLayout *)self delegate];
    int v37 = [v36 layout:self shouldUseSquareImageInAccessoryForItemAtIndexPath:v13];

    if (v37)
    {
      double v147 = MidY;
      v148 = a4;
      v150 = a5;
      uint64_t v38 = [MEMORY[0x1E4FB1438] sharedApplication];
      uint64_t v39 = [v38 windows];
      uint64_t v40 = [v39 firstObject];
      uint64_t v41 = [v40 windowScene];
      uint64_t v42 = [v41 interfaceOrientation];

      uint64_t v43 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v44 = [v43 userInterfaceIdiom];

      if (v44) {
        BOOL v45 = 1;
      }
      else {
        BOOL v45 = (unint64_t)(v42 - 3) >= 2;
      }
      int v46 = !v45;
      v184.origin.double x = rect;
      v184.origin.CGFloat y = rect_16;
      v184.size.CGFloat width = v31;
      v184.size.CGFloat height = v33;
      double Width = CGRectGetWidth(v184);
      v185.origin.double x = rect;
      v185.origin.CGFloat y = rect_16;
      v185.size.CGFloat width = v31;
      v185.size.CGFloat height = v33;
      double Height = CGRectGetHeight(v185);
      double point = v25;
      if (self->_delegateFlags.respondsToBestSquareRectForItemAtIndexPath)
      {
        int64_t v47 = [(PUOneUpTilingLayout *)self delegate];
        [v47 layout:self bestSquareRectForItemAtIndexPath:v13];
        double v49 = v48;
        double v51 = v50;
        double v53 = v52;
        double v55 = v54;

        double v56 = v55;
        double v57 = v51;
        CGFloat v16 = v160;
      }
      else
      {
        double v49 = *MEMORY[0x1E4F1DB28];
        double v57 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v53 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v56 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      }
      v81 = a7;
      double v82 = v49;
      double v154 = v57;
      double v83 = v53;
      double v146 = v56;
      if (CGRectIsEmpty(*(CGRect *)(&v57 - 1)))
      {
        v190.origin.double x = v169[0].origin.x;
        v190.origin.CGFloat y = v16;
        v190.size.CGFloat width = v18;
        v190.size.CGFloat height = v20;
        CGRectGetWidth(v190);
        v191.origin.double x = v169[0].origin.x;
        v191.origin.CGFloat y = v16;
        v191.size.CGFloat width = v18;
        v191.size.CGFloat height = v20;
        CGRectGetHeight(v191);
        PXRectWithAspectRatioFittingRect();
        PXRectNormalize();
        double v49 = v84;
        double v154 = v85;
        double v53 = v86;
        double v146 = v87;
      }
      double v142 = v49;
      double v88 = v25;
      double MidY = v147;
      if (v81)
      {
        double v88 = v25;
        if ((a9 & 2) != 0) {
          [(PUOneUpTilingLayout *)self _contentOffsetForItemAtIndexPath:v13];
        }
      }
      double v141 = v53;
      if (v88 >= 0.0)
      {
        double v59 = v20;
        double v60 = v18;
        a4 = v148;
        a5 = v150;
        if (!a6) {
          goto LABEL_24;
        }
        goto LABEL_84;
      }
      double v155 = v24;
      if (Width >= Height) {
        double v89 = Height;
      }
      else {
        double v89 = Width;
      }
      double v140 = v88;
      if (v46)
      {
        PXSizeGetAspectRatio();
        CGFloat v90 = v89;
        if (v91 <= 2.0) {
          double v89 = Width - Height;
        }
      }
      else
      {
        v112 = +[PUOneUpSettings sharedInstance];
        int v113 = [v112 squareImageCapToHalfHeight];

        double v114 = Height * 0.5;
        if (Height * 0.5 >= v89) {
          double v114 = v89;
        }
        if (v113) {
          CGFloat v90 = v114;
        }
        else {
          CGFloat v90 = v89;
        }
      }
      v193.origin.double x = rect;
      v193.origin.CGFloat y = rect_16;
      v193.size.CGFloat width = v89;
      v193.size.CGFloat height = v90;
      double v139 = CGRectGetWidth(v193);
      v194.origin.double x = v169[0].origin.x;
      v194.origin.CGFloat y = v160;
      v194.size.CGFloat width = v18;
      v194.size.CGFloat height = v20;
      double v138 = v139 - CGRectGetWidth(v194);
      v195.origin.double x = rect;
      v195.origin.CGFloat y = rect_16;
      CGFloat v144 = v89;
      v195.size.CGFloat width = v89;
      v195.size.CGFloat height = v90;
      double v115 = CGRectGetHeight(v195);
      v196.origin.double x = v169[0].origin.x;
      v196.origin.CGFloat y = v160;
      v196.size.CGFloat width = v18;
      v196.size.CGFloat height = v20;
      double v116 = v115 - CGRectGetHeight(v196);
      if (v46)
      {
        double v117 = v116;
        v197.origin.double x = v169[0].origin.x;
        v197.origin.CGFloat y = v160;
        v197.size.CGFloat width = v18;
        v197.size.CGFloat height = v20;
        double v118 = Height + (Height - CGRectGetHeight(v197)) * -0.5;
        [(PUOneUpTilingLayout *)self contentGuideInsets];
        double v120 = fabs(v140) / (v118 - v119);
        if (v120 <= 1.0) {
          double v121 = v120;
        }
        else {
          double v121 = 1.0;
        }
        if ((a9 & 2) == 0)
        {
          v198.size.CGFloat height = v90;
          double v60 = v18 + v138 * v121;
          double v59 = v20 + v117 * v121;
          v198.origin.double x = rect;
          v198.origin.CGFloat y = rect_16;
          v198.size.CGFloat width = v144;
          CGRectGetMaxX(v198);
          v199.origin.double x = v169[0].origin.x;
          v199.origin.CGFloat y = v160;
          v199.size.CGFloat width = v18;
          v199.size.CGFloat height = v20;
          CGRectGetMaxX(v199);
          v200.origin.double x = v169[0].origin.x;
          v200.origin.CGFloat y = v160;
          v200.size.CGFloat width = v18;
          v200.size.CGFloat height = v20;
          CGRectGetMaxX(v200);
          PXRectGetCenter();
          double MidX = v122;
          v201.origin.double x = rect;
          v201.origin.CGFloat y = rect_16;
          v201.size.CGFloat width = v144;
          v201.size.CGFloat height = v90;
          CGRectGetMaxY(v201);
          v202.origin.double x = v169[0].origin.x;
          v202.origin.CGFloat y = v160;
          v202.size.CGFloat width = v18;
          v202.size.CGFloat height = v20;
          CGRectGetMaxY(v202);
          v203.origin.double x = v169[0].origin.x;
          v203.origin.CGFloat y = v160;
          v203.size.CGFloat width = v18;
          v203.size.CGFloat height = v20;
          CGRectGetMaxY(v203);
          PXRectGetCenter();
          double MidY = v123;
          PXPointMultiplyWithFloat();
          v173.double x = v124;
          v173.CGFloat y = v125;
          double v25 = 0.0;
          goto LABEL_81;
        }
      }
      else
      {
        v204.origin.double x = rect;
        v204.origin.CGFloat y = rect_16;
        v204.size.CGFloat width = v89;
        v204.size.CGFloat height = v90;
        double MaxY = CGRectGetMaxY(v204);
        v205.origin.double x = v169[0].origin.x;
        v205.origin.CGFloat y = v160;
        v205.size.CGFloat width = v18;
        v205.size.CGFloat height = v20;
        double v127 = fabs(v140 / (MaxY - CGRectGetMaxY(v205)));
        if (v127 <= 1.0) {
          double v121 = v127;
        }
        else {
          double v121 = 1.0;
        }
        if ((a9 & 2) == 0)
        {
          double v128 = v116;
          double v60 = v18 + v138 * v121;
          double v59 = v20 + v128 * v121;
          PXRectGetCenter();
          v206.origin.double x = v169[0].origin.x;
          double MidY = v129;
          v206.origin.CGFloat y = v160;
          v206.size.CGFloat width = v18;
          v206.size.CGFloat height = v20;
          double v25 = v140 + CGRectGetMaxY(v206) - v59;
LABEL_81:
          a4 = v148;
          a5 = v150;
          double v24 = v155;
          if (!v81) {
            goto LABEL_83;
          }
          goto LABEL_82;
        }
      }
      double v59 = v20;
      double v60 = v18;
      a4 = v148;
      a5 = v150;
      double v24 = v155;
      double v25 = point;
      double MidY = v147;
      if (!v81)
      {
LABEL_83:
        if (!a6) {
          goto LABEL_24;
        }
LABEL_84:
        if ((a9 & 2) != 0)
        {
          CGSize v130 = *(CGSize *)(MEMORY[0x1E4F91340] + 16);
          a6->origin = (CGPoint)*MEMORY[0x1E4F91340];
          a6->size = v130;
        }
        else
        {
          +[PUOneUpTilingLayout rectForFittingToTargetPixelSize:imagePixelSize:bestSquareUnitRect:](PUOneUpTilingLayout, "rectForFittingToTargetPixelSize:imagePixelSize:bestSquareUnitRect:", v60, v59, v18, v20, v142, v154, v141, v146);
          a6->origin.double x = v131;
          a6->origin.CGFloat y = v132;
          a6->size.CGFloat width = v133;
          a6->size.CGFloat height = v134;
        }
        goto LABEL_24;
      }
LABEL_82:
      double *v81 = v121;
      goto LABEL_83;
    }
  }
  if (a6)
  {
    CGSize v58 = *(CGSize *)(MEMORY[0x1E4F91340] + 16);
    a6->origin = (CGPoint)*MEMORY[0x1E4F91340];
    a6->size = v58;
  }
  double v59 = v20;
  double v60 = v18;
LABEL_24:
  double v61 = MidY + v173.y + v25;
  double v62 = v60 * v172;
  CGFloat v63 = v25;
  double v64 = v59 * v172;
  double v65 = MidX + v173.x + v24 - v62 * 0.5;
  double v66 = v61 - v59 * v172 * 0.5;
  CGAffineTransformMakeRotation((CGAffineTransform *)transform, angle);
  long long v174 = *(_OWORD *)transform;
  long long v175 = *(_OWORD *)&transform[16];
  long long v176 = *(_OWORD *)&transform[32];
  if (([v21 hasUserInput] & 1) == 0)
  {
    CGFloat v152 = v20;
    v186.origin.double x = rect;
    v186.origin.CGFloat y = rect_16;
    v186.size.CGFloat width = v157;
    v186.size.CGFloat height = v158;
    CGRect v187 = CGRectOffset(v186, v24, v63);
    CGFloat y = v187.origin.y;
    CGFloat rect_16a = v187.origin.x;
    CGFloat v163 = v187.size.height;
    CGFloat recta = v187.size.width;
    v208.origin.double x = v65;
    v208.origin.CGFloat y = v66;
    v208.size.CGFloat width = v62;
    v208.size.CGFloat height = v64;
    CGRect v188 = CGRectIntersection(v187, v208);
    double x = v188.origin.x;
    double v69 = v188.origin.y;
    double v70 = v188.size.width;
    double v71 = v188.size.height;
    if (a5)
    {
      CGRect v72 = [(PUOneUpTilingLayout *)self parallaxComputer];
      [(PUTilingLayout *)self visibleRect];
      objc_msgSend(v72, "contentParallaxOffsetForViewFrame:visibleRect:", x, v69, v70, v71, v73, v74, v75, v76);
    }
    if (!PXFloatApproximatelyEqualToFloat()
      || !PXFloatApproximatelyEqualToFloat()
      || (PXFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      v77 = PLOneUpGetLog();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        v149 = a4;
        v151 = a5;
        v78 = NSStringFromCGPoint(v173);
        CGFloat v79 = angle;
        v189.origin.double x = v169[0].origin.x;
        v189.origin.CGFloat y = v160;
        v189.size.CGFloat width = v156;
        v189.size.CGFloat height = v152;
        v80 = NSStringFromCGRect(v189);
        if (v21) {
          [v21 affineTransform];
        }
        else {
          memset(&v169[0].origin.y, 0, 48);
        }
        v92 = NSStringFromCGAffineTransform((CGAffineTransform *)&v169[0].origin.y);
        v192.origin.double x = rect_16a;
        v192.origin.CGFloat y = y;
        v192.size.CGFloat height = v163;
        v192.size.CGFloat width = recta;
        v93 = NSStringFromCGRect(v192);
        v181.double x = v24;
        v181.CGFloat y = v63;
        v94 = NSStringFromCGPoint(v181);
        *(_DWORD *)transform = 138413570;
        *(void *)&transform[4] = v78;
        *(_WORD *)&transform[12] = 2048;
        *(CGFloat *)&transform[14] = v79;
        *(_WORD *)&transform[22] = 2112;
        *(void *)&transform[24] = v80;
        *(_WORD *)&transform[32] = 2112;
        *(void *)&transform[34] = v92;
        *(_WORD *)&transform[42] = 2112;
        *(void *)&transform[44] = v93;
        __int16 v178 = 2112;
        uint64_t v179 = (uint64_t)v94;
        _os_log_impl(&dword_1AE9F8000, v77, OS_LOG_TYPE_DEFAULT, "Clipped tile doesn't appear to be centered, the content might not be displayed properly. translation=%@; rotat"
          "ion=%f; untransformedRect=%@, affineTransform=%@, pageRect=%@, contentOffset=%@",
          transform,
          0x3Eu);

        a4 = v149;
        a5 = v151;
      }
    }
  }
  [(PUOneUpTilingLayout *)self shouldPinContentToTop];
  v95 = [(PUOneUpTilingLayout *)self traitCollection];
  [v95 displayScale];
  double v97 = v96;

  if (v97 == 0.0)
  {
    v98 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v98 scale];
  }
  PXPointRoundToPixel();
  CGFloat v100 = v99;
  double v102 = v101;
  PXSizeRoundToPixel();
  CGFloat v104 = v103;
  CGFloat v106 = v105;
  int v107 = PXFloatApproximatelyEqualToFloat();
  PXPointRoundToPixel();
  if (a3)
  {
    double v110 = 0.0;
    if (!v107) {
      double v110 = v102;
    }
    a3->origin.double x = v100;
    a3->origin.CGFloat y = v110;
    a3->size.CGFloat width = v104;
    a3->size.CGFloat height = v106;
  }
  if (a4)
  {
    long long v111 = v175;
    *(_OWORD *)&a4->a = v174;
    *(_OWORD *)&a4->c = v111;
    *(_OWORD *)&a4->tdouble x = v176;
  }
  if (a5)
  {
    a5->double x = v108;
    a5->CGFloat y = v109;
  }
}

- (void)_getLayoutRect:(CGRect *)a3 transform:(CGAffineTransform *)a4 parallaxOffset:(CGPoint *)a5 forContentOfItemAtIndexPath:(id)a6 options:(unint64_t)a7
{
}

- (id)_displayTileTransformForItemAtIndexPath:(id)a3 pageSize:(CGSize)a4 secondaryDisplayTransform:(id)a5 options:(unint64_t)a6
{
  char v6 = a6;
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = a5;
  if ((v6 & 1) != 0
    || !self->_delegateFlags.respondsToModelTileTransformForItemAtIndexPath
    || ([(PUOneUpTilingLayout *)self delegate],
        id v13 = objc_claimAutoreleasedReturnValue(),
        [v13 layout:self modelTileTransformForItemAtIndexPath:v11],
        CGFloat v14 = (PUModelTileTransform *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
    CGFloat v14 = [[PUModelTileTransform alloc] initWithNoUserInput];
  }
  -[PUOneUpTilingLayout _untransformedRectForItemAtIndexPath:pageRect:](self, "_untransformedRectForItemAtIndexPath:pageRect:", v11, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
  double v16 = v15;
  double v18 = v17;
  if (self->_delegateFlags.respondsToShouldInitiallyZoomToFillForItemAtIndexPath)
  {
    double v19 = [(PUOneUpTilingLayout *)self delegate];
    int v20 = objc_msgSend(v19, "layout:shouldInitiallyZoomToFillForItemAtIndexPath:contentSize:viewportSize:", self, v11, v16, v18, width, height);

    double v21 = 1.0;
    if (v20)
    {
      CGFloat v22 = [MEMORY[0x1E4F903D0] sharedInstance];
      objc_msgSend(v22, "zoomFactorForContentWithSize:toFillViewWithSize:", v16, v18, width, height);
      double v21 = v23;
    }
  }
  else
  {
    double v21 = 1.0;
  }
  double v24 = +[PUDisplayTileTransform displayTileTransformWithModelTileTransform:initialScale:initialSize:displaySize:secondaryDisplayTileTransform:](PUDisplayTileTransform, "displayTileTransformWithModelTileTransform:initialScale:initialSize:displaySize:secondaryDisplayTileTransform:", v14, v12, v21, v16 * v21, v18 * v21, width, height);

  return v24;
}

- (id)_displayTileTransformForItemAtIndexPath:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  [(PUOneUpTilingLayout *)self displaySizeForInsetMatching];
  if (v8 == *MEMORY[0x1E4F1DB30] && v7 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = -[PUOneUpTilingLayout _displayTileTransformForItemAtIndexPath:pageSize:secondaryDisplayTransform:options:](self, "_displayTileTransformForItemAtIndexPath:pageSize:secondaryDisplayTransform:options:", v6, 0, a4);
  }
  [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v6];
  id v13 = -[PUOneUpTilingLayout _displayTileTransformForItemAtIndexPath:pageSize:secondaryDisplayTransform:options:](self, "_displayTileTransformForItemAtIndexPath:pageSize:secondaryDisplayTransform:options:", v6, v10, a4, v11, v12);

  return v13;
}

- (CGRect)_untransformedRectForItemAtIndexPath:(id)a3 pageRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = a3;
  if (self->_delegateFlags.respondsToAspectRatioForItemAtIndexPath)
  {
    uint64_t v9 = [(PUOneUpTilingLayout *)self delegate];
    [v9 layout:self aspectRatioForItemAtIndexPath:v8];
    double v11 = v10;
  }
  else
  {
    double v11 = 1.0;
  }
  if (self->_delegateFlags.respondsToInsetsWhenScaledToFitForItemAtIndexPath)
  {
    double v12 = [(PUOneUpTilingLayout *)self delegate];
    objc_msgSend(v12, "layout:insetsWhenScaledToFitForItemAtIndexPath:inViewportSize:", self, v8, width, height);
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    uint64_t v20 = v19;
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4FB2848];
    uint64_t v16 = *(void *)(MEMORY[0x1E4FB2848] + 8);
    uint64_t v18 = *(void *)(MEMORY[0x1E4FB2848] + 16);
    uint64_t v20 = *(void *)(MEMORY[0x1E4FB2848] + 24);
  }
  if ([(PUOneUpTilingLayout *)self useReviewScreenBars])
  {
    +[PUReviewScreenUtilities reviewScreenContentGeometryForReferenceBounds:forContentSize:withOrientation:](PUReviewScreenUtilities, "reviewScreenContentGeometryForReferenceBounds:forContentSize:withOrientation:", [(PUOneUpTilingLayout *)self windowInterfaceOrientation], x, y, width, height, v11, 1.0);
    UIRectCenteredAboutPoint();
  }
  else
  {
    double v25 = objc_opt_class();
    [(PUOneUpTilingLayout *)self minimumMarginForInsetContent];
    objc_msgSend(v25, "untransformedRectForItemWithAspectRatio:pageRect:safeInsets:minimumInsetMargin:", v11, x, y, width, height, v14, v16, v18, v20, v26);
  }
  double v27 = v21;
  double v28 = v22;
  double v29 = v23;
  double v30 = v24;

  double v31 = v27;
  double v32 = v28;
  double v33 = v29;
  double v34 = v30;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (CGSize)_contentPixelSizeForItemAtIndexPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_delegateFlags.respondsToPixelSizeForItemAtIndexPath)
  {
    id v5 = [(PUOneUpTilingLayout *)self delegate];
    [v5 layout:self pixelSizeForItemAtIndexPath:v4];
    double v7 = v6;
    double v9 = v8;
  }
  else if (self->_delegateFlags.respondsToAspectRatioForItemAtIndexPath)
  {
    double v10 = [(PUOneUpTilingLayout *)self delegate];
    [v10 layout:self aspectRatioForItemAtIndexPath:v4];

    [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v4];
    PFSizeWithAspectRatioFittingSize();
    double v7 = v11;
    double v9 = v12;
  }
  else
  {
    uint64_t v13 = PXAssertGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_fault_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_FAULT, "Unable to get content pixel size for item at index path %@. Delegate must implement pixelSizeForItemAtIndexPath or aspectRatioForItemAtIndexPath.", (uint8_t *)&v16, 0xCu);
    }

    double v7 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v14 = v7;
  double v15 = v9;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGRect)_untransformedRectForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v4];
  -[PUOneUpTilingLayout _untransformedRectForItemAtIndexPath:pageRect:](self, "_untransformedRectForItemAtIndexPath:pageRect:", v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)_frameForTileWithSize:(CGSize)a3 centeredOnItemAtIndexPath:(id)a4
{
  double rect_16 = a3.height;
  double rect_24 = a3.width;
  id v5 = a4;
  [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v5];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGSize v14 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v39.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v39.size = v14;
  [(PUOneUpTilingLayout *)self _getLayoutRect:&v39 transform:0 parallaxOffset:0 forContentOfItemAtIndexPath:v5 options:0];

  CGFloat y = v39.origin.y;
  CGFloat x = v39.origin.x;
  CGFloat height = v39.size.height;
  CGFloat width = v39.size.width;
  v46.origin.CGFloat x = v7;
  CGFloat rect_8 = v9;
  v46.origin.CGFloat y = v9;
  CGFloat v19 = v11;
  v46.size.CGFloat width = v11;
  CGFloat v20 = v13;
  v46.size.CGFloat height = v13;
  if (CGRectIntersectsRect(v39, v46))
  {
    v47.origin.CGFloat x = v7;
    v47.origin.CGFloat y = rect_8;
    CGFloat v21 = v19;
    v47.size.CGFloat width = v19;
    v47.size.CGFloat height = v20;
    CGRect v40 = CGRectIntersection(v39, v47);
    CGFloat x = v40.origin.x;
    CGFloat y = v40.origin.y;
    CGFloat width = v40.size.width;
    CGFloat height = v40.size.height;
    double v22 = rect_24 + 20.0 - CGRectGetWidth(v40);
    if (v22 >= 0.0) {
      double v23 = v22;
    }
    else {
      double v23 = 0.0;
    }
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    double v24 = rect_16 + 20.0 - CGRectGetHeight(v41);
    if (v24 < 0.0) {
      double v24 = 0.0;
    }
    CGFloat v25 = rect_8;
    if (v23 > 0.0 || v24 > 0.0)
    {
      CGFloat v26 = -v24;
      CGFloat v27 = v7;
      CGFloat v28 = v21;
      CGFloat v29 = v20;
      CGRect v48 = CGRectInset(*(CGRect *)(&v25 - 1), -v23, v26);
      CGRect v42 = CGRectIntersection(v39, v48);
      CGFloat x = v42.origin.x;
      CGFloat y = v42.origin.y;
      CGFloat width = v42.size.width;
      CGFloat height = v42.size.height;
    }
  }
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v43);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v44);
  double v32 = rect_24;
  double v33 = MidY - rect_16 * 0.5;
  double v34 = MidX - rect_24 * 0.5;
  double v35 = rect_16;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v34;
  return result;
}

- (CGRect)_pageRectForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  -[PUSectionedTilingLayout boundsForSection:](self, "boundsForSection:", [v4 section]);
  double v6 = v5;
  double v8 = v7;
  [(PUOneUpTilingLayout *)self _itemSize];
  double v10 = v9;
  double v12 = v11;
  [(PUOneUpTilingLayout *)self interpageSpacing];
  double v14 = v13;
  int64_t v15 = -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", [v4 section]);
  LODWORD(self) = [(PUSectionedTilingLayout *)self leftToRight];
  uint64_t v16 = [v4 item];

  uint64_t v17 = v15 + ~v16;
  if (self) {
    uint64_t v17 = v16;
  }
  double v18 = v6 + (double)v17 * (v10 + v14);
  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGSize)_itemSize
{
  p_itemSize = &self->_itemSize;
  double width = self->_itemSize.width;
  double height = self->_itemSize.height;
  if (width == -1.79769313e308 && height == -1.79769313e308)
  {
    [(PUOneUpTilingLayout *)self prepareLayout];
    double width = p_itemSize->width;
    double height = p_itemSize->height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setUseSyndicationAttributionTile:(BOOL)a3
{
  if (self->_useSyndicationAttributionTile != a3)
  {
    self->_useSyndicationAttributionTile = a3;
    id v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTilesWithKind:PUTileKindSyndicationAttribution];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (void)setShouldHideMainContent:(BOOL)a3
{
  if (self->_shouldHideMainContent != a3)
  {
    self->_shouldHideMainContent = a3;
    id v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTiles];
    [(PUTilingLayout *)self invalidateLayoutWithContext:v4 updateImmediately:1];
  }
}

- (void)setUseVerticalReviewScreenControlBarLayout:(BOOL)a3
{
  if (self->_useVerticalReviewScreenControlBarLayout != a3)
  {
    self->_useVerticalReviewScreenControlBarLayout = a3;
    id v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTilesWithKind:PUTileKindReviewScreenControlBar];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (void)setShouldPinContentToTop:(BOOL)a3
{
  if (self->_shouldPinContentToTop != a3)
  {
    self->_shouldPinContentToTop = a3;
    id v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTiles];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (void)setDisplaySizeForInsetMatching:(CGSize)a3
{
  if (a3.width != self->_displaySizeForInsetMatching.width || a3.height != self->_displaySizeForInsetMatching.height)
  {
    self->_displaySizeForInsetMatching = a3;
    double v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v5 invalidateAllTilesWithKind:PUTileKindUserTransform];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v5];
  }
}

- (void)setCanDisplayLoadingIndicators:(BOOL)a3
{
  if (self->_canDisplayLoadingIndicators != a3)
  {
    self->_canDisplayLoadingIndicators = a3;
    id v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTilesWithKind:PUTileKindLoadingIndicator];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (void)setBufferingIndicatorSize:(CGSize)a3
{
  if (a3.width != self->_bufferingIndicatorSize.width || a3.height != self->_bufferingIndicatorSize.height)
  {
    self->_bufferingIndicatorSize = a3;
    double v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v5 invalidateAllTilesWithKind:PUTileKindBufferingIndicator];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v5];
  }
}

- (void)setWindowInterfaceOrientation:(int64_t)a3
{
  if (self->_windowInterfaceOrientation != a3)
  {
    self->_windowInterfaceOrientation = a3;
    if ([(PUOneUpTilingLayout *)self useReviewScreenBars])
    {
      id v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
      [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTilesWithKind:PUTileKindReviewScreenTopBar];
      [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTilesWithKind:PUTileKindReviewScreenControlBar];
      [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTilesWithKind:@"PUTileKindItemContent"];
      [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v4];
    }
  }
}

- (void)setUseAssetExplorerReviewScreenBadgeTiles:(BOOL)a3
{
  if (self->_useAssetExplorerReviewScreenBadgeTiles != a3)
  {
    self->_useAssetExplorerReviewScreenBadgeTiles = a3;
    id v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTilesWithKind:PUTileKindAssetExplorerReviewScreenBadge];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (void)setAssetExplorerReviewScreenProgressIndicatorSize:(CGSize)a3
{
  if (a3.width != self->_assetExplorerReviewScreenProgressIndicatorSize.width
    || a3.height != self->_assetExplorerReviewScreenProgressIndicatorSize.height)
  {
    self->_assetExplorerReviewScreenProgressIndicatorSize = a3;
    double v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v5 invalidateAllTilesWithKind:PUTileKindAssetExplorerReviewScreenProgressIndicator];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v5];
  }
}

- (void)setRenderIndicatorSize:(CGSize)a3
{
  if (a3.width != self->_renderIndicatorSize.width || a3.height != self->_renderIndicatorSize.height)
  {
    self->_renderIndicatorSize = a3;
    double v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v5 invalidateAllTilesWithKind:PUTileKindRenderIndicator];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v5];
  }
}

- (void)setProgressIndicatorContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_progressIndicatorContentInsets.left
    || a3.top != self->_progressIndicatorContentInsets.top
    || a3.right != self->_progressIndicatorContentInsets.right
    || a3.bottom != self->_progressIndicatorContentInsets.bottom)
  {
    self->_progressIndicatorContentInsets = a3;
    double v7 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v7 invalidateAllTilesWithKind:PUTileKindProgressIndicator];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v7];
  }
}

- (void)setPeopleRowSize:(CGSize)a3
{
  if (a3.width != self->_peopleRowSize.width || a3.height != self->_peopleRowSize.height)
  {
    self->_peopleRowSize = a3;
    double v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v5 invalidateAllTilesWithKind:PUTileKindPeople];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v5];
  }
}

- (void)setProgressIndicatorSize:(CGSize)a3
{
  if (a3.width != self->_progressIndicatorSize.width || a3.height != self->_progressIndicatorSize.height)
  {
    self->_progressIndicatorSize = a3;
    double v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v5 invalidateAllTilesWithKind:PUTileKindProgressIndicator];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v5];
  }
}

- (void)setUseBadgeTiles:(BOOL)a3
{
  if (self->_useBadgeTiles != a3)
  {
    self->_useBadgeTiles = a3;
    id v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTilesWithKind:PUTileKindBadge];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (void)setPlayButtonSize:(CGSize)a3
{
  if (a3.width != self->_playButtonSize.width || a3.height != self->_playButtonSize.height)
  {
    self->_playButtonSize = a3;
    double v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v5 invalidateAllTilesWithKind:PUTileKindPlayButton];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v5];
  }
}

- (void)setUseImportStatusIndicatorTiles:(BOOL)a3
{
  if (self->_useImportStatusIndicatorTiles != a3)
  {
    self->_useImportStatusIndicatorTiles = a3;
    id v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTilesWithKind:PUTileKindImportStatusIndicator];
    [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTilesWithKind:PUTileKindProgressIndicator];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (void)setUseSelectionIndicatorTiles:(BOOL)a3
{
  if (self->_useSelectionIndicatorTiles != a3)
  {
    self->_useSelectionIndicatorTiles = a3;
    id v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTilesWithKind:PUTileKindSelectionIndicator];
    [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTilesWithKind:PUTileKindProgressIndicator];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (void)setInsetContentCornerRadius:(double)a3
{
  if (self->_insetContentCornerRadius != a3)
  {
    self->_insetContentCornerRadius = a3;
    [(PUOneUpTilingLayout *)self invalidateAllContentTiles];
  }
}

- (void)setInsetContentBorderColor:(id)a3
{
  double v7 = (UIColor *)a3;
  double v5 = self->_insetContentBorderColor;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(UIColor *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_insetContentBorderColor, a3);
      [(PUOneUpTilingLayout *)self invalidateAllContentTiles];
    }
  }
}

- (void)setInsetContentBorderWidth:(double)a3
{
  if (self->_insetContentBorderWidth != a3)
  {
    self->_insetContentBorderdouble Width = a3;
    [(PUOneUpTilingLayout *)self invalidateAllContentTiles];
  }
}

- (void)setContentDecorationAdditionalInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentDecorationAdditionalInsets.left
    || a3.top != self->_contentDecorationAdditionalInsets.top
    || a3.right != self->_contentDecorationAdditionalInsets.right
    || a3.bottom != self->_contentDecorationAdditionalInsets.bottom)
  {
    self->_contentDecorationAdditionalInsets = a3;
    double v7 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v7 invalidateAllTilesWithKind:PUTileKindSelectionIndicator];
    [(PUTilingLayoutInvalidationContext *)v7 invalidateAllTilesWithKind:PUTileKindProgressIndicator];
    [(PUTilingLayoutInvalidationContext *)v7 invalidateAllTilesWithKind:PUTileKindAssetExplorerReviewScreenProgressIndicator];
    [(PUTilingLayoutInvalidationContext *)v7 invalidateAllTilesWithKind:PUTileKindPeople];
    [(PUTilingLayoutInvalidationContext *)v7 invalidateAllTilesWithKind:PUTileKindImportStatusIndicator];
    [(PUTilingLayoutInvalidationContext *)v7 invalidateAllTilesWithKind:PUTileKindRenderIndicator];
    [(PUOneUpTilingLayoutInvalidationContext *)v7 invalidatedContentInsets];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v7];
  }
}

- (void)setContentSafeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentSafeInsets.left
    || a3.top != self->_contentSafeInsets.top
    || a3.right != self->_contentSafeInsets.right
    || a3.bottom != self->_contentSafeInsets.bottom)
  {
    self->_contentSafeInsets = a3;
    double v7 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    [(PUOneUpTilingLayoutInvalidationContext *)v7 _setInvalidatedContentInsets:1];
    [(PUTilingLayoutInvalidationContext *)v7 invalidateAllTilesWithKind:@"PUTileKindItemContent"];
    [(PUTilingLayoutInvalidationContext *)v7 invalidateAllTilesWithKind:PUTileKindProgressIndicator];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v7];
  }
}

- (void)invalidateAllContentTiles
{
  v3 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
  [(PUOneUpTilingLayoutInvalidationContext *)v3 _setInvalidatedContentInsets:1];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:@"PUTileKindItemContent"];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindUserTransform];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindBadge];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindBufferingIndicator];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindLoadingIndicator];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindPlayButton];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindProgressIndicator];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindPeople];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindRenderIndicator];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindImportStatusIndicator];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindAccessory];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindAssetExplorerReviewScreenBadge];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindSelectionIndicator];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindAssetExplorerReviewScreenProgressIndicator];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindSyndicationAttribution];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindCropButton];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:PUTileKindLivePhotoVideoPlaybackOverlay];
  [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v3];
}

- (void)invalidatePrimaryContentTiles
{
  v3 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
  [(PUOneUpTilingLayoutInvalidationContext *)v3 _setInvalidatedContentInsets:1];
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:@"PUTileKindItemContent"];
  [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v3];
}

- (BOOL)_shouldShowRenderIndicatorForIndexPath:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if ([a3 length] != 2) {
    return 0;
  }
  if (height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    return width != *MEMORY[0x1E4F1DB30];
  }
  return 1;
}

- (BOOL)_isVideoPlacholderVisibleForItemAtIndexPath:(id)a3
{
  if (!self->_delegateFlags.respondsToShouldShowVideoPlaceholderForItemAtIndexPath) {
    return 0;
  }
  v3 = self;
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v3) = [WeakRetained layout:v3 shouldShowVideoPlaceholderForItemAtIndexPath:v5];

  return (char)v3;
}

- (BOOL)_isShowingInfoPanelForItemAtIndexPath:(id)a3
{
  if (!self->_delegateFlags.respondsToIsShowingInfoPanelForItemAtIndexPath) {
    return 0;
  }
  v3 = self;
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v3) = [WeakRetained layout:v3 isShowingInfoPanelForItemAtIndexPath:v5];

  return (char)v3;
}

- (BOOL)_accessoryViewVisibilityForItemAtIndexPath:(id)a3
{
  if (!self->_delegateFlags.respondsToShouldShowAccessoryForItemAtIndexPath) {
    return 0;
  }
  v3 = self;
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v3) = [WeakRetained layout:v3 shouldShowAccessoryForItemAtIndexPath:v5];

  return (char)v3;
}

- (CGPoint)_contentOffsetForItemAtIndexPath:(id)a3
{
  if (self->_delegateFlags.respondsToContentOffsetForItemAtIndexPath)
  {
    id v4 = a3;
    id v5 = [(PUOneUpTilingLayout *)self delegate];
    [v5 layout:self contentOffsetForItemAtIndexPath:v4];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v10 = v7;
  double v11 = v9;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (double)_minimumBottomContentInsetsForItemAtIndexPath:(id)a3
{
  [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:a3];
  return v3 * 0.400000006;
}

- (void)invalidateProgressIndicatorForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PUTilingLayoutInvalidationContext);
  [(PUTilingLayoutInvalidationContext *)v5 invalidateTileWithIndexPath:v4 kind:PUTileKindProgressIndicator];

  [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v5];
}

- (void)invalidateLoadingIndicatorForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PUTilingLayoutInvalidationContext);
  [(PUTilingLayoutInvalidationContext *)v5 invalidateTileWithIndexPath:v4 kind:PUTileKindLoadingIndicator];

  [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v5];
}

- (void)invalidateVideoPlaceholderForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
  [(PUOneUpTilingLayoutInvalidationContext *)v5 _setInvalidatedVideoPlaceholderTile:1];
  [(PUTilingLayoutInvalidationContext *)v5 invalidateTileWithIndexPath:v4 kind:PUTileKindVideoPlaceholder];

  [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v5];
}

- (void)_invalidateContentRelatedTilesWithIndexPath:(id)a3 inContext:(id)a4
{
  id v6 = a4;
  id v5 = a3;
  [v6 invalidateTileWithIndexPath:v5 kind:@"PUTileKindItemContent"];
  [v6 invalidateTileWithIndexPath:v5 kind:PUTileKindUserTransform];
  [v6 invalidateTileWithIndexPath:v5 kind:PUTileKindBadge];
  [v6 invalidateTileWithIndexPath:v5 kind:PUTileKindPlayButton];
  [v6 invalidateTileWithIndexPath:v5 kind:PUTileKindProgressIndicator];
  [v6 invalidateTileWithIndexPath:v5 kind:PUTileKindPeople];
  [v6 invalidateTileWithIndexPath:v5 kind:PUTileKindRenderIndicator];
  [v6 invalidateTileWithIndexPath:v5 kind:PUTileKindImportStatusIndicator];
  [v6 invalidateTileWithIndexPath:v5 kind:PUTileKindBufferingIndicator];
  [v6 invalidateTileWithIndexPath:v5 kind:PUTileKindLoadingIndicator];
  [v6 invalidateTileWithIndexPath:v5 kind:PUTileKindAccessory];
  [v6 invalidateTileWithIndexPath:v5 kind:PUTileKindAssetExplorerReviewScreenBadge];
  [v6 invalidateTileWithIndexPath:v5 kind:PUTileKindSelectionIndicator];
  [v6 invalidateTileWithIndexPath:v5 kind:PUTileKindAssetExplorerReviewScreenProgressIndicator];
  [v6 invalidateTileWithIndexPath:v5 kind:PUTileKindCropButton];

  [v6 invalidateAllTilesWithKind:PUTileKindLivePhotoVideoPlaybackOverlay];
}

- (void)invalidateContentOffsetForItemAtIndexPath:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  double v7 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
  [(PUOneUpTilingLayoutInvalidationContext *)v7 _setInvalidatedContentOffset:1];
  [(PUOneUpTilingLayoutInvalidationContext *)v7 _setOptions:a4];
  [(PUOneUpTilingLayout *)self _invalidateContentRelatedTilesWithIndexPath:v6 inContext:v7];

  [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v7];
}

- (void)invalidateAccessoryForItemAtIndexPath:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  double v7 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
  [(PUOneUpTilingLayoutInvalidationContext *)v7 _setInvalidatedAccessoryTile:1];
  [(PUOneUpTilingLayoutInvalidationContext *)v7 _setOptions:a4];
  [(PUOneUpTilingLayout *)self _invalidateContentRelatedTilesWithIndexPath:v6 inContext:v7];

  [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v7];
}

- (void)invalidateModelTileTransformForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PUTilingLayoutInvalidationContext);
  [(PUOneUpTilingLayout *)self _invalidateContentRelatedTilesWithIndexPath:v4 inContext:v5];

  [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v5];
}

- (void)invalidateBadgeSizeForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PUTilingLayoutInvalidationContext);
  [(PUTilingLayoutInvalidationContext *)v5 invalidateTileWithIndexPath:v4 kind:PUTileKindBadge];
  [(PUTilingLayoutInvalidationContext *)v5 invalidateTileWithIndexPath:v4 kind:PUTileKindAssetExplorerReviewScreenBadge];

  [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v5];
}

- (NSIndexPath)indexPathOfCurrentItem
{
  return self->_inFocusIndexPath;
}

- (CGRect)visibleRectForItemAtIndexPath:(id)a3 transitionProgress:(double)a4
{
  id v6 = a3;
  [(PUOneUpTilingLayout *)self _itemSize];
  double v8 = v7;
  [(PUOneUpTilingLayout *)self interpageSpacing];
  double v10 = v8 + v9;
  if ([(PUSectionedTilingLayout *)self leftToRight]) {
    double v11 = v10 * a4;
  }
  else {
    double v11 = -(v10 * a4);
  }
  [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v6];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;

  uint64_t v20 = v13;
  uint64_t v21 = v15;
  uint64_t v22 = v17;
  uint64_t v23 = v19;
  return CGRectOffset(*(CGRect *)&v20, v11, 0.0);
}

- (UIEdgeInsets)_cropInsetsForTileAtIndexPath:(id)a3 layoutRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  double v10 = [(PUOneUpTilingLayout *)self delegate];
  uint64_t v11 = [v10 layout:self insetModeForItemAtIndexPath:v9];

  if (v11 == 1)
  {
    CGFloat v45 = width;
    CGFloat v46 = height;
    [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v9];
    double v15 = v14;
    double v17 = v16;
    double v47 = v12;
    double v48 = v13;
    if (self->_delegateFlags.respondsToInsetsWhenScaledToFitForItemAtIndexPath)
    {
      double v18 = v12;
      double v19 = v13;
      uint64_t v20 = [(PUOneUpTilingLayout *)self delegate];
      objc_msgSend(v20, "layout:insetsWhenScaledToFitForItemAtIndexPath:inViewportSize:", self, v9, v18, v19);
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
    }
    else
    {
      double v22 = *MEMORY[0x1E4FB2848];
      double v24 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v26 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v28 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    }
    double v43 = v15 + v24;
    double v44 = v17 + v22;
    double v33 = v47 - (v28 + v24);
    double v34 = v48 - (v26 + v22);
    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.CGFloat width = v45;
    v49.size.CGFloat height = v46;
    if (!CGRectIsNull(v49))
    {
      v50.origin.CGFloat x = x;
      v50.origin.CGFloat y = y;
      v50.size.CGFloat width = v45;
      v50.size.CGFloat height = v46;
      v52.origin.CGFloat x = v43;
      v52.origin.CGFloat y = v44;
      v52.size.CGFloat width = v33;
      v52.size.CGFloat height = v34;
      CGRectIntersection(v50, v52);
    }
    PXEdgeInsetsBetweenRects();
    PXEdgeInsetsMaxEachEdge();
    double v29 = v35;
    double v30 = v36;
    double v31 = v37;
    double v32 = v38;
  }
  else
  {
    double v29 = *MEMORY[0x1E4F91320];
    double v30 = *(double *)(MEMORY[0x1E4F91320] + 8);
    double v31 = *(double *)(MEMORY[0x1E4F91320] + 16);
    double v32 = *(double *)(MEMORY[0x1E4F91320] + 24);
  }

  double v39 = v29;
  double v40 = v30;
  double v41 = v31;
  double v42 = v32;
  result.double right = v42;
  result.double bottom = v41;
  result.double left = v40;
  result.double top = v39;
  return result;
}

- (id)_createLayoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [(PUSectionedTilingLayout *)self leftToRight];
  if ([v8 isEqualToString:@"PUTileKindItemContent"])
  {
    if ([v7 length] == 2)
    {
      CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      slice.size = v10;
      CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
      v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
      v662.size = v11;
      long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      long long v670 = *MEMORY[0x1E4F1DAD8];
      long long v12 = *(_OWORD *)(MEMORY[0x1E4F91340] + 16);
      float64x2_t v668 = *(float64x2_t *)MEMORY[0x1E4F91340];
      long long v669 = v12;
      [(PUOneUpTilingLayout *)self _getLayoutRect:&slice transform:&v662 parallaxOffset:&v670 contentsRect:&v668 alpha:0 forContentOfItemAtIndexPath:v7 options:0];
      if ([(PUOneUpTilingLayout *)self shouldHideMainContent]) {
        double v13 = 0.0;
      }
      else {
        double v13 = 1.0;
      }
      double rect2 = v13;
      if (-[PUOneUpTilingLayout _shouldApplyInsetStylingToContentWithRect:indexPath:](self, "_shouldApplyInsetStylingToContentWithRect:indexPath:", v7, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height))
      {
        [(PUOneUpTilingLayout *)self insetContentCornerRadius];
        double v647 = v14;
        id v15 = (id)*MEMORY[0x1E4F39EA8];
        double v16 = [(PUOneUpTilingLayout *)self insetContentBorderColor];
        [(PUOneUpTilingLayout *)self insetContentBorderWidth];
        double v650 = v17;
      }
      else
      {
        double v650 = 0.0;
        double v40 = +[PUOneUpSettings sharedInstance];
        [v40 itemContentCornerRadius];
        double v647 = v41;

        id v15 = (id)*MEMORY[0x1E4F39EA8];
        double v16 = 0;
      }
      -[PUOneUpTilingLayout _cropInsetsForTileAtIndexPath:layoutRect:](self, "_cropInsetsForTileAtIndexPath:layoutRect:", v7, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      uint64_t v43 = v42;
      uint64_t v45 = v44;
      uint64_t v47 = v46;
      uint64_t v49 = v48;
      CGRect v50 = [(PUOneUpTilingLayout *)self delegate];
      int v51 = [v50 layout:self wantsContentLegibilityTreatmentForItemAtIndexPath:v7];

      double v52 = 0.0;
      if (v51)
      {
        if (PXEdgeInsetsEqualToEdgeInsets()) {
          double v52 = 0.25;
        }
        else {
          double v52 = 0.15;
        }
      }
      double v53 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
      double v54 = [PUParallaxedTileLayoutInfo alloc];
      uint64_t v640 = v47;
      uint64_t v643 = v43;
      CGFloat x = slice.origin.x;
      CGFloat y = slice.origin.y;
      CGFloat width = slice.size.width;
      CGFloat height = slice.size.height;
      double MidX = CGRectGetMidX(slice);
      v674.origin.CGFloat x = x;
      v674.origin.CGFloat y = y;
      v674.size.CGFloat width = width;
      v674.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v674);
      double v61 = [(PUTilingLayout *)self coordinateSystem];
      CGRect remainder = v662;
      long long v667 = v663;
      double v32 = -[PUParallaxedTileLayoutInfo initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:parallaxOffset:contentsRect:coordinateSystem:cropInsets:verticalLegibilityFraction:](v54, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:parallaxOffset:contentsRect:coordinateSystem:cropInsets:verticalLegibilityFraction:", v53, v15, 0, v16, &remainder, v61, MidX, MidY, slice.size.width, slice.size.height, rect2, v647, v650, 1.0, v670, *(_OWORD *)&v668,
              v669,
              v643,
              v45,
              v640,
              v49,
              *(void *)&v52);

LABEL_23:
      goto LABEL_24;
    }
    goto LABEL_198;
  }
  if ([v8 isEqualToString:PUTileKindBackground])
  {
    if (![v7 length] && -[PUOneUpTilingLayout useBackgroundTile](self, "useBackgroundTile"))
    {
      [(PUTilingLayout *)self visibleRect];
      PXRectScaleFromCenter();
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      double v23 = v22;
      double v25 = v24;
      id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
      double v26 = [PUTileLayoutInfo alloc];
      v672.origin.CGFloat x = v19;
      v672.origin.CGFloat y = v21;
      v672.size.CGFloat width = v23;
      v672.size.CGFloat height = v25;
      double v27 = CGRectGetMidX(v672);
      v673.origin.CGFloat x = v19;
      v673.origin.CGFloat y = v21;
      v673.size.CGFloat width = v23;
      v673.size.CGFloat height = v25;
      double v28 = CGRectGetMidY(v673);
      double v29 = *(double *)&PUTilingLayoutBackgroundZPosition;
      double v30 = [(PUTilingLayout *)self coordinateSystem];
      CGSize v31 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
      v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
      v662.size = v31;
      long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      double v32 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](v26, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", v15, &v662, v30, v27, v28, v23, v25, 1.0, v29);

      [(PUTilingLayout *)self visibleRect];
      PXEdgeInsetsBetweenRects();
      -[PUTileLayoutInfo setExpandedRectInsets:](v32, "setExpandedRectInsets:");
LABEL_24:

      goto LABEL_199;
    }
    goto LABEL_198;
  }
  if ([v8 isEqualToString:PUTileKindReviewScreenTopBar])
  {
    if (!-[PUOneUpTilingLayout useReviewScreenBars](self, "useReviewScreenBars") || [v7 length]) {
      goto LABEL_198;
    }
    [(PUTilingLayout *)self visibleRect];
    long long v665 = 0u;
    long long v663 = 0u;
    memset(&v664, 0, sizeof(v664));
    memset(&v662, 0, sizeof(v662));
    +[PUReviewScreenUtilities reviewScreenTopBarGeometryForReferenceBounds:withOrientation:](PUReviewScreenUtilities, "reviewScreenTopBarGeometryForReferenceBounds:withOrientation:", [(PUOneUpTilingLayout *)self windowInterfaceOrientation], v33, v34, v35, v36);
    memset(&remainder, 0, sizeof(remainder));
    long long v667 = 0u;
    if (self->_delegateFlags.respondsToAlphaForReviewScreenBarsInLayout)
    {
      double v37 = [(PUOneUpTilingLayout *)self delegate];
      [v37 alphaForReviewScreenBarsInLayout:self];
      double v39 = v38;
    }
    else
    {
      double v39 = 1.0;
    }
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    double v102 = [PUTileLayoutInfo alloc];
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGRect slice = remainder;
    long long v661 = v667;
    double v104 = 1001.0;
    goto LABEL_66;
  }
  if ([v8 isEqualToString:PUTileKindReviewScreenControlBar])
  {
    if (!-[PUOneUpTilingLayout useReviewScreenBars](self, "useReviewScreenBars") || [v7 length]) {
      goto LABEL_198;
    }
    [(PUTilingLayout *)self visibleRect];
    long long v665 = 0u;
    long long v663 = 0u;
    memset(&v664, 0, sizeof(v664));
    memset(&v662, 0, sizeof(v662));
    +[PUReviewScreenUtilities reviewScreenControlBarGeometryForReferenceBounds:withOrientation:](PUReviewScreenUtilities, "reviewScreenControlBarGeometryForReferenceBounds:withOrientation:", [(PUOneUpTilingLayout *)self windowInterfaceOrientation], v62, v63, v64, v65);
    memset(&remainder, 0, sizeof(remainder));
    long long v667 = 0u;
    if (self->_delegateFlags.respondsToAlphaForReviewScreenBarsInLayout)
    {
      double v66 = [(PUOneUpTilingLayout *)self delegate];
      [v66 alphaForReviewScreenBarsInLayout:self];
      double v39 = v67;
    }
    else
    {
      double v39 = 1.0;
    }
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    double v102 = [PUTileLayoutInfo alloc];
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGRect slice = remainder;
    long long v661 = v667;
    double v104 = 1000.0;
LABEL_66:
    p_CGRect slice = &slice;
    double v138 = v102;
    id v139 = v15;
    double v140 = 0.0;
    double v141 = 0.0;
    double v142 = 0.0;
    double v143 = 0.0;
    double v136 = v39;
LABEL_67:
    uint64_t v144 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](v138, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", v139, p_slice, v103, v140, v141, v142, v143, v136, v104);
    goto LABEL_68;
  }
  if ([v8 isEqualToString:PUTileKindReviewScreenScrubberBar])
  {
    if (![(PUOneUpTilingLayout *)self useReviewScreenBars]) {
      goto LABEL_198;
    }
    uint64_t v68 = [v7 length];
    if (self->_delegateFlags.respondsToShouldShowReviewScreenScrubberBar)
    {
      if (v68) {
        goto LABEL_198;
      }
      double v69 = [(PUOneUpTilingLayout *)self delegate];
      char v70 = [v69 layoutShouldShowReviewScreenScrubberBar:self];

      if ((v70 & 1) == 0) {
        goto LABEL_198;
      }
    }
    else if (v68)
    {
      goto LABEL_198;
    }
    [(PUTilingLayout *)self visibleRect];
    double v120 = v119;
    double v122 = v121;
    double v124 = v123;
    double v126 = v125;
    int64_t v127 = [(PUOneUpTilingLayout *)self windowInterfaceOrientation];
    [(PUOneUpTilingLayout *)self contentSafeInsets];
    long long v665 = 0u;
    long long v663 = 0u;
    memset(&v664, 0, sizeof(v664));
    memset(&v662, 0, sizeof(v662));
    +[PUReviewScreenUtilities reviewScreenScrubberBarGeometryForReferenceBounds:withOrientation:safeAreaInsets:](PUReviewScreenUtilities, "reviewScreenScrubberBarGeometryForReferenceBounds:withOrientation:safeAreaInsets:", v127, v120, v122, v124, v126, v128, v129, v130, v131);
    double v109 = 0.0;
    double v132 = 0.0;
    if (*MEMORY[0x1E4F1DB30] == 0.0 && v662.size.height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      goto LABEL_198;
    }
    double v134 = *((double *)&v663 + 1);
    double v133 = *(double *)&v663;
    CGRect remainder = v664;
    long long v667 = v665;
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    v135 = [PUTileLayoutInfo alloc];
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGRect slice = remainder;
    long long v661 = v667;
    double v104 = 1002.0;
    double v136 = 1.0;
    p_CGRect slice = &slice;
    goto LABEL_63;
  }
  if ([v8 isEqualToString:PUTileKindUserTransform])
  {
    if ([v7 length] != 2 || !-[PUOneUpTilingLayout useUserTransformTiles](self, "useUserTransformTiles")) {
      goto LABEL_198;
    }
    [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v7];
    double v72 = v71;
    double v74 = v73;
    double v76 = v75;
    double v78 = v77;
    [(PUOneUpTilingLayout *)self _untransformedRectForItemAtIndexPath:v7];
    double v80 = v79;
    double v82 = v81;
    uint64_t v84 = v83;
    uint64_t v86 = v85;
    [(PUOneUpTilingLayout *)self _contentPixelSizeForItemAtIndexPath:v7];
    uint64_t v639 = v88;
    uint64_t v641 = v87;
    uint64_t v651 = v86;
    uint64_t rect2a = v84;
    double v644 = v82 - v74;
    double v648 = v80 - v72;
    if (self->_delegateFlags.respondsToInsetsWhenScaledToFitForItemAtIndexPath)
    {
      double v89 = [(PUOneUpTilingLayout *)self delegate];
      objc_msgSend(v89, "layout:insetsWhenScaledToFitForItemAtIndexPath:inViewportSize:", self, v7, v76, v78);
      uint64_t v637 = v91;
      uint64_t v638 = v90;
      uint64_t v635 = v93;
      uint64_t v636 = v92;
    }
    else
    {
      [(PUOneUpTilingLayout *)self contentGuideInsets];
      uint64_t v637 = v191;
      uint64_t v638 = v190;
      uint64_t v635 = v193;
      uint64_t v636 = v192;
    }
    -[PUOneUpTilingLayout _cropInsetsForTileAtIndexPath:layoutRect:](self, "_cropInsetsForTileAtIndexPath:layoutRect:", v7, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    uint64_t v195 = v194;
    uint64_t v197 = v196;
    uint64_t v199 = v198;
    uint64_t v201 = v200;
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    CGRect v202 = [PUUserTransformTileLayoutInfo alloc];
    double Center = PURectGetCenter(v72, v74, v76, v78);
    double v205 = v204;
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v206 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    v662.size = v206;
    long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    uint64_t v144 = -[PUUserTransformTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:chromeInsets:contentPixelSize:cropInsets:](v202, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:chromeInsets:contentPixelSize:cropInsets:", v15, &v662, v103, Center, v205, v76, v78, 1.0, 20.0, *(void *)&v648, *(void *)&v644, rect2a, v651, v638, v637, v636,
             v635,
             v641,
             v639,
             v195,
             v197,
             v199,
             v201);
LABEL_68:
    double v32 = (PUParallaxedTileLayoutInfo *)v144;

    goto LABEL_24;
  }
  if ([v8 isEqualToString:PUTileKindPlayButton])
  {
    uint64_t v94 = [v7 length];
    [(PUOneUpTilingLayout *)self playButtonSize];
    if (v94 != 2) {
      goto LABEL_198;
    }
    double v97 = v95;
    double v98 = v96;
    BOOL v99 = v95 != *MEMORY[0x1E4F1DB30];
    if (v96 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      BOOL v99 = 1;
    }
    if (self->_delegateFlags.respondsToShouldShowPlayButtonForItemAtIndexPath)
    {
      if (!v99) {
        goto LABEL_198;
      }
      CGFloat v100 = [(PUOneUpTilingLayout *)self delegate];
      char v101 = [v100 layout:self shouldShowPlayButtonForItemAtIndexPath:v7];

      if ((v101 & 1) == 0) {
        goto LABEL_198;
      }
    }
    else if (!v99)
    {
      goto LABEL_198;
    }
    -[PUOneUpTilingLayout _frameForTileWithSize:centeredOnItemAtIndexPath:](self, "_frameForTileWithSize:centeredOnItemAtIndexPath:", v7, v97, v98);
    CGFloat v208 = v207;
    CGFloat v210 = v209;
    CGFloat v181 = v211;
    CGFloat v183 = v212;
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    CGRect v184 = [PUTileLayoutInfo alloc];
    double v185 = PURectGetCenter(v208, v210, v181, v183);
    double v187 = v213;
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v214 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    v662.size = v214;
    long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v136 = 1.0;
    p_CGRect slice = &v662;
    double v104 = 30.0;
    goto LABEL_88;
  }
  if ([v8 isEqualToString:PUTileKindProgressIndicator])
  {
    uint64_t v105 = [v7 length];
    [(PUOneUpTilingLayout *)self progressIndicatorSize];
    double v107 = v106;
    double v109 = v108;
    [(PUOneUpTilingLayout *)self progressIndicatorContentInsets];
    if (v105 != 2) {
      goto LABEL_198;
    }
    double v113 = v110;
    double v114 = v111;
    double v115 = v112;
    BOOL v116 = v107 != *MEMORY[0x1E4F1DB30];
    if (v109 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      BOOL v116 = 1;
    }
    if (self->_delegateFlags.respondsToShouldShowProgressIndicatorForItemAtIndexPath)
    {
      if (!v116) {
        goto LABEL_198;
      }
      double v117 = [(PUOneUpTilingLayout *)self delegate];
      char v118 = [v117 layout:self shouldShowProgressIndicatorForItemAtIndexPath:v7];

      if ((v118 & 1) == 0) {
        goto LABEL_198;
      }
    }
    else if (!v116)
    {
      goto LABEL_198;
    }
    double v645 = v115;
    double v642 = v113;
    double rect2b = v107;
    [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v7];
    double v245 = v244;
    double v247 = v246;
    double v249 = v248;
    double v652 = v250;
    [(PUOneUpTilingLayout *)self contentGuideInsets];
    [(PUOneUpTilingLayout *)self contentSafeInsets];
    UIEdgeInsetsMax();
    double v252 = v245 + v251;
    double v254 = v247 + v253;
    double v256 = v249 - (v251 + v255);
    double v258 = v253 + v257;
    CGSize v259 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    double v260 = v652 - v258;
    remainder.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    remainder.size = v259;
    [(PUOneUpTilingLayout *)self _getLayoutRect:&remainder transform:0 parallaxOffset:0 forContentOfItemAtIndexPath:v7 options:0];
    v688.origin.CGFloat x = v252;
    v688.origin.CGFloat y = v254;
    v688.size.CGFloat width = v256;
    v688.size.CGFloat height = v260;
    if (CGRectIntersectsRect(remainder, v688))
    {
      v689.origin.CGFloat x = v252;
      v689.origin.CGFloat y = v254;
      v689.size.CGFloat width = v256;
      v689.size.CGFloat height = v260;
      CGRect remainder = CGRectIntersection(remainder, v689);
    }
    [(PUOneUpTilingLayout *)self contentDecorationAdditionalInsets];
    double v262 = v261;
    double v264 = v263;
    double v266 = v265;
    CGFloat v267 = remainder.origin.x + v263;
    double v268 = v262 + remainder.origin.y;
    double v270 = remainder.size.width - (v264 + v269);
    double v271 = remainder.size.height - (v262 + v266);
    remainder.origin.CGFloat x = v267;
    remainder.origin.CGFloat y = v262 + remainder.origin.y;
    remainder.size.CGFloat width = v270;
    remainder.size.CGFloat height = v271;
    if (!self->_delegateFlags.respondsToShouldMoveProgressIndicatorForItemAtIndexPath) {
      goto LABEL_111;
    }
    v272 = [(PUOneUpTilingLayout *)self delegate];
    int v273 = [v272 layout:self shouldMoveProgressIndicatorForItemAtIndexPath:v7];

    CGFloat v267 = remainder.origin.x;
    double v268 = remainder.origin.y;
    double v270 = remainder.size.width;
    double v271 = remainder.size.height;
    if (v273)
    {
      double v274 = _PUOneUpSelectionIndicatorFrame(v9, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
      CGFloat v276 = v275;
      CGFloat v278 = v277;
      CGFloat v280 = v279;
      PURectGetCenter(v274, v275, v277, v279);
      double v282 = v281 + v109 * -0.5;
      double v283 = PURectGetCenter(v274, v276, v278, v280);
      double v284 = v283 + 15.5 + 17.0 - v642;
      double v285 = v645 + v283 + -15.5 + -17.0 - rect2b;
      if (v9) {
        double v286 = v285;
      }
      else {
        double v286 = v284;
      }
    }
    else
    {
LABEL_111:
      if (v9) {
        double v286 = v645 + CGRectGetMaxX(*(CGRect *)&v267) + -17.0 - v107;
      }
      else {
        double v286 = CGRectGetMinX(*(CGRect *)&v267) + 17.0 - v113;
      }
      double v282 = v114 + CGRectGetMaxY(remainder) + -17.0 - v109;
    }
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    v377 = [PUTileLayoutInfo alloc];
    double v378 = PURectGetCenter(v286, v282, rect2b, v109);
    double v380 = v379;
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v381 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    v662.size = v381;
    long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v136 = 1.0;
    p_CGRect slice = &v662;
    double v104 = 31.0;
    double v138 = v377;
    id v139 = v15;
    double v140 = v378;
    double v141 = v380;
    double v142 = rect2b;
    goto LABEL_130;
  }
  if ([v8 isEqualToString:PUTileKindPeople])
  {
    uint64_t v145 = [v7 length];
    [(PUOneUpTilingLayout *)self peopleRowSize];
    if (v145 != 2) {
      goto LABEL_198;
    }
    double v148 = v146;
    double v149 = v147;
    BOOL v150 = v146 != *MEMORY[0x1E4F1DB30];
    if (v147 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      BOOL v150 = 1;
    }
    if (self->_delegateFlags.respondsToShouldShowPeopleRowForItemAtIndexPath)
    {
      if (!v150) {
        goto LABEL_198;
      }
      v151 = [(PUOneUpTilingLayout *)self delegate];
      char v152 = [v151 layout:self shouldShowPeopleRowForItemAtIndexPath:v7];

      if ((v152 & 1) == 0) {
        goto LABEL_198;
      }
    }
    else if (!v150)
    {
      goto LABEL_198;
    }
    CGFloat rect2c = v149;
    [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v7];
    double v321 = v320;
    double v323 = v322;
    double v325 = v324;
    double v653 = v326;
    [(PUOneUpTilingLayout *)self contentGuideInsets];
    [(PUOneUpTilingLayout *)self contentSafeInsets];
    UIEdgeInsetsMax();
    double v328 = v321 + v327;
    double v330 = v323 + v329;
    double v332 = v325 - (v327 + v331);
    double v334 = v653 - (v329 + v333);
    CGSize v335 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    remainder.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    remainder.size = v335;
    slice.origin.CGFloat x = 1.0;
    [(PUOneUpTilingLayout *)self _getLayoutRect:&remainder transform:0 parallaxOffset:0 contentsRect:0 alpha:&slice forContentOfItemAtIndexPath:v7 options:0];
    v692.origin.CGFloat x = v328;
    v692.origin.CGFloat y = v330;
    v692.size.CGFloat width = v332;
    v692.size.CGFloat height = v334;
    if (CGRectIntersectsRect(remainder, v692))
    {
      v693.origin.CGFloat x = v328;
      v693.origin.CGFloat y = v330;
      v693.size.CGFloat width = v332;
      v693.size.CGFloat height = v334;
      CGRect remainder = CGRectIntersection(remainder, v693);
    }
    [(PUOneUpTilingLayout *)self contentDecorationAdditionalInsets];
    remainder.origin.CGFloat x = remainder.origin.x + v339;
    remainder.origin.CGFloat y = v338 + remainder.origin.y;
    remainder.size.CGFloat width = remainder.size.width - (v339 + v336);
    remainder.size.CGFloat height = remainder.size.height - (v338 + v337);
    [(PUOneUpTilingLayout *)self contentSafeInsets];
    CGFloat v341 = remainder.size.width;
    if (v148 >= remainder.size.width * 0.5) {
      double v342 = remainder.size.width * 0.5;
    }
    else {
      double v342 = v148;
    }
    if (v9)
    {
      double v343 = v340;
      CGFloat v344 = remainder.origin.x;
      CGFloat v345 = remainder.origin.y;
      CGFloat v346 = remainder.size.height;
      double v347 = CGRectGetMinX(*(CGRect *)(&v341 - 2)) + v343 * -2.0;
    }
    else
    {
      CGFloat v382 = remainder.origin.x;
      CGFloat v383 = remainder.origin.y;
      CGFloat v384 = remainder.size.height;
      double v347 = CGRectGetMaxX(*(CGRect *)(&v341 - 2)) - v148;
    }
    if (self->_delegateFlags.respondsToShouldMovePeopleRowForItemAtIndexPath
      && ([(PUOneUpTilingLayout *)self renderIndicatorSize],
          -[PUOneUpTilingLayout _shouldShowRenderIndicatorForIndexPath:size:](self, "_shouldShowRenderIndicatorForIndexPath:size:", v7))&& (-[PUOneUpTilingLayout delegate](self, "delegate"), v385 = objc_claimAutoreleasedReturnValue(), int v386 = [v385 layout:self shouldMovePeopleRowForItemAtIndexPath:v7], v385, v386))
    {
      [(PUOneUpTilingLayout *)self renderIndicatorSize];
      _PUOneUpRenderIndicatorFrame(v9, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height, v387);
      double MaxY = v388 + 10.0;
    }
    else
    {
      double MaxY = CGRectGetMaxY(remainder);
    }
    CGFloat v390 = MaxY - v149;
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    v391 = [PUTileLayoutInfo alloc];
    double v392 = PURectGetCenter(v347, v390, v342, rect2c);
    double v394 = v393;
    CGFloat v395 = slice.origin.x;
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v396 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    v662.size = v396;
    long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v104 = 37.0;
    p_CGRect slice = &v662;
    double v138 = v391;
    id v139 = v15;
    double v140 = v392;
    double v141 = v394;
    double v142 = v342;
    double v143 = rect2c;
    double v136 = v395;
    goto LABEL_67;
  }
  if ([v8 isEqualToString:PUTileKindRenderIndicator])
  {
    [(PUOneUpTilingLayout *)self renderIndicatorSize];
    double v154 = v153;
    if (!-[PUOneUpTilingLayout _shouldShowRenderIndicatorForIndexPath:size:](self, "_shouldShowRenderIndicatorForIndexPath:size:", v7))goto LABEL_198; {
    [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v7];
    }
    double v156 = v155;
    double v158 = v157;
    double v160 = v159;
    double v162 = v161;
    [(PUOneUpTilingLayout *)self contentGuideInsets];
    [(PUOneUpTilingLayout *)self contentSafeInsets];
    UIEdgeInsetsMax();
    double v164 = v156 + v163;
    double v166 = v158 + v165;
    double v168 = v160 - (v163 + v167);
    double v170 = v165 + v169;
    CGSize v171 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    double v172 = v162 - v170;
    remainder.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    remainder.size = v171;
    [(PUOneUpTilingLayout *)self _getLayoutRect:&remainder transform:0 parallaxOffset:0 forContentOfItemAtIndexPath:v7 options:0];
    v684.origin.CGFloat x = v164;
    v684.origin.CGFloat y = v166;
    v684.size.CGFloat width = v168;
    v684.size.CGFloat height = v172;
    if (CGRectIntersectsRect(remainder, v684))
    {
      v685.origin.CGFloat x = v164;
      v685.origin.CGFloat y = v166;
      v685.size.CGFloat width = v168;
      v685.size.CGFloat height = v172;
      CGRect remainder = CGRectIntersection(remainder, v685);
    }
    [(PUOneUpTilingLayout *)self contentDecorationAdditionalInsets];
    remainder.origin.CGFloat x = remainder.origin.x + v176;
    remainder.origin.CGFloat y = v175 + remainder.origin.y;
    remainder.size.CGFloat width = remainder.size.width - (v176 + v173);
    remainder.size.CGFloat height = remainder.size.height - (v175 + v174);
    double v177 = _PUOneUpRenderIndicatorFrame(v9, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height, v154);
    CGFloat v179 = v178;
    CGFloat v181 = v180;
    CGFloat v183 = v182;
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    CGRect v184 = [PUTileLayoutInfo alloc];
    double v185 = PURectGetCenter(v177, v179, v181, v183);
    double v187 = v186;
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v188 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    v662.size = v188;
    long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(double *)&uint64_t v189 = 36.0;
    goto LABEL_82;
  }
  if ([v8 isEqualToString:PUTileKindImportStatusIndicator])
  {
    if ([v7 length] != 2
      || ![(PUOneUpTilingLayout *)self useImportStatusIndicatorTiles])
    {
      goto LABEL_198;
    }
    [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v7];
    double v216 = v215;
    double v218 = v217;
    double v220 = v219;
    double v222 = v221;
    [(PUOneUpTilingLayout *)self contentGuideInsets];
    double v224 = v216 + v223;
    double v226 = v218 + v225;
    double v228 = v220 - (v223 + v227);
    double v230 = v225 + v229;
    CGSize v231 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    double v232 = v222 - v230;
    remainder.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    remainder.size = v231;
    [(PUOneUpTilingLayout *)self _getLayoutRect:&remainder transform:0 parallaxOffset:0 forContentOfItemAtIndexPath:v7 options:0];
    v686.origin.CGFloat x = v224;
    v686.origin.CGFloat y = v226;
    v686.size.CGFloat width = v228;
    v686.size.CGFloat height = v232;
    if (CGRectIntersectsRect(remainder, v686))
    {
      v687.origin.CGFloat x = v224;
      v687.origin.CGFloat y = v226;
      v687.size.CGFloat width = v228;
      v687.size.CGFloat height = v232;
      CGRect remainder = CGRectIntersection(remainder, v687);
    }
    [(PUOneUpTilingLayout *)self contentDecorationAdditionalInsets];
    remainder.origin.CGFloat x = remainder.origin.x + v236;
    remainder.origin.CGFloat y = v235 + remainder.origin.y;
    remainder.size.CGFloat width = remainder.size.width - (v236 + v233);
    remainder.size.CGFloat height = remainder.size.height - (v235 + v234);
    double v237 = _PUOneUpSelectionIndicatorFrame(v9, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    CGFloat v239 = v238;
    CGFloat v181 = v240;
    CGFloat v183 = v241;
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    CGRect v184 = [PUTileLayoutInfo alloc];
    double v185 = PURectGetCenter(v237, v239, v181, v183);
    double v187 = v242;
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v243 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    v662.size = v243;
    long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v104 = 35.0;
    goto LABEL_83;
  }
  if ([v8 isEqualToString:PUTileKindAssetExplorerReviewScreenProgressIndicator])
  {
    uint64_t v287 = [v7 length];
    [(PUOneUpTilingLayout *)self assetExplorerReviewScreenProgressIndicatorSize];
    if (v287 != 2) {
      goto LABEL_198;
    }
    double v132 = v288;
    double v109 = v289;
    if (v288 == *MEMORY[0x1E4F1DB30] && v289 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      goto LABEL_198;
    }
    [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v7];
    double v291 = v290;
    double v293 = v292;
    double v295 = v294;
    double v297 = v296;
    [(PUOneUpTilingLayout *)self contentGuideInsets];
    double v299 = v291 + v298;
    double v301 = v293 + v300;
    double v303 = v295 - (v298 + v302);
    double v305 = v300 + v304;
    CGSize v306 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    double v307 = v297 - v305;
    remainder.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    remainder.size = v306;
    [(PUOneUpTilingLayout *)self _getLayoutRect:&remainder transform:0 parallaxOffset:0 forContentOfItemAtIndexPath:v7 options:0];
    v690.origin.CGFloat x = v299;
    v690.origin.CGFloat y = v301;
    v690.size.CGFloat width = v303;
    v690.size.CGFloat height = v307;
    if (CGRectIntersectsRect(remainder, v690))
    {
      v691.origin.CGFloat x = v299;
      v691.origin.CGFloat y = v301;
      v691.size.CGFloat width = v303;
      v691.size.CGFloat height = v307;
      CGRect remainder = CGRectIntersection(remainder, v691);
    }
    [(PUOneUpTilingLayout *)self contentDecorationAdditionalInsets];
    double v309 = v308;
    double v311 = v310;
    double v313 = v312;
    CGFloat v314 = remainder.origin.x + v310;
    double v315 = v309 + remainder.origin.y;
    double v317 = remainder.size.width - (v311 + v316);
    double v318 = remainder.size.height - (v309 + v313);
    remainder.origin.CGFloat x = v314;
    remainder.origin.CGFloat y = v309 + remainder.origin.y;
    remainder.size.CGFloat width = v317;
    remainder.size.CGFloat height = v318;
    if (v9) {
      double v319 = CGRectGetMaxX(*(CGRect *)&v314) + -10.0 - v132;
    }
    else {
      double v319 = CGRectGetMinX(*(CGRect *)&v314) + 10.0;
    }
    CGFloat v419 = CGRectGetMaxY(remainder) + -15.0 - v109;
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    v135 = [PUTileLayoutInfo alloc];
    double v133 = PURectGetCenter(v319, v419, v132, v109);
    double v134 = v420;
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v421 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    v662.size = v421;
    long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v104 = 32.0;
    double v136 = 1.0;
    p_CGRect slice = &v662;
LABEL_63:
    double v138 = v135;
    id v139 = v15;
    double v140 = v133;
    double v141 = v134;
    double v142 = v132;
LABEL_130:
    double v143 = v109;
    goto LABEL_67;
  }
  if ([v8 isEqualToString:PUTileKindSelectionIndicator])
  {
    if ([v7 length] != 2
      || ![(PUOneUpTilingLayout *)self useSelectionIndicatorTiles])
    {
      goto LABEL_198;
    }
    [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v7];
    double v349 = v348;
    double v351 = v350;
    double v353 = v352;
    double v355 = v354;
    [(PUOneUpTilingLayout *)self contentGuideInsets];
    double v357 = v349 + v356;
    double v359 = v351 + v358;
    double v361 = v353 - (v356 + v360);
    double v363 = v358 + v362;
    CGSize v364 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    double v365 = v355 - v363;
    remainder.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    remainder.size = v364;
    [(PUOneUpTilingLayout *)self _getLayoutRect:&remainder transform:0 parallaxOffset:0 forContentOfItemAtIndexPath:v7 options:0];
    v694.origin.CGFloat x = v357;
    v694.origin.CGFloat y = v359;
    v694.size.CGFloat width = v361;
    v694.size.CGFloat height = v365;
    if (CGRectIntersectsRect(remainder, v694))
    {
      v695.origin.CGFloat x = v357;
      v695.origin.CGFloat y = v359;
      v695.size.CGFloat width = v361;
      v695.size.CGFloat height = v365;
      CGRect remainder = CGRectIntersection(remainder, v695);
    }
    [(PUOneUpTilingLayout *)self contentDecorationAdditionalInsets];
    remainder.origin.CGFloat x = remainder.origin.x + v369;
    remainder.origin.CGFloat y = v368 + remainder.origin.y;
    remainder.size.CGFloat width = remainder.size.width - (v369 + v366);
    remainder.size.CGFloat height = remainder.size.height - (v368 + v367);
    double v370 = _PUOneUpSelectionIndicatorFrame(v9, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    CGFloat v372 = v371;
    CGFloat v181 = v373;
    CGFloat v183 = v374;
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    CGRect v184 = [PUTileLayoutInfo alloc];
    double v185 = PURectGetCenter(v370, v372, v181, v183);
    double v187 = v375;
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v376 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    v662.size = v376;
    long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v104 = 33.0;
    goto LABEL_83;
  }
  if ([v8 isEqualToString:PUTileKindBufferingIndicator])
  {
    if ([v7 length] != 2
      || [(PUOneUpTilingLayout *)self _accessoryViewVisibilityForItemAtIndexPath:v7]|| [(PUOneUpTilingLayout *)self _isShowingInfoPanelForItemAtIndexPath:v7])
    {
      goto LABEL_198;
    }
    [(PUOneUpTilingLayout *)self bufferingIndicatorSize];
    double v398 = v397;
    double v400 = v399;
    BOOL v401 = v397 != *MEMORY[0x1E4F1DB30];
    if (v399 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      BOOL v401 = 1;
    }
    if (self->_delegateFlags.respondsToShouldShowBufferingIndicatorForItemAtIndexPath)
    {
      if (!v401) {
        goto LABEL_198;
      }
      v402 = [(PUOneUpTilingLayout *)self delegate];
      char v403 = [v402 layout:self shouldShowBufferingIndicatorForItemAtIndexPath:v7];

      if ((v403 & 1) == 0) {
        goto LABEL_198;
      }
    }
    else if (!v401)
    {
      goto LABEL_198;
    }
    -[PUOneUpTilingLayout _frameForTileWithSize:centeredOnItemAtIndexPath:](self, "_frameForTileWithSize:centeredOnItemAtIndexPath:", v7, v398, v400);
    CGFloat v506 = v505;
    CGFloat v508 = v507;
    CGFloat v181 = v509;
    CGFloat v183 = v510;
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    CGRect v184 = [PUTileLayoutInfo alloc];
    double v185 = PURectGetCenter(v506, v508, v181, v183);
    double v187 = v511;
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v512 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    v662.size = v512;
    long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v136 = 1.0;
    p_CGRect slice = &v662;
    double v104 = 12.0;
    goto LABEL_88;
  }
  if ([v8 isEqualToString:PUTileKindLoadingIndicator])
  {
    double v405 = *MEMORY[0x1E4F1DB30];
    double v404 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v406 = *MEMORY[0x1E4F1DB30];
    double v407 = v404;
    if ([(PUOneUpTilingLayout *)self canDisplayLoadingIndicators])
    {
      double v406 = v405;
      double v407 = v404;
      if ([v7 length] == 2)
      {
        double v406 = v405;
        double v407 = v404;
        if (self->_delegateFlags.respondsToLoadingIndicatorSizeForItemAtIndexPath)
        {
          v408 = [(PUOneUpTilingLayout *)self delegate];
          [v408 layout:self loadingIndicatorSizeForItemAtIndexPath:v7];
          double v406 = v409;
          double v407 = v410;
        }
      }
    }
    if (v406 == v405 && v407 == v404) {
      goto LABEL_198;
    }
    -[PUOneUpTilingLayout _frameForTileWithSize:centeredOnItemAtIndexPath:](self, "_frameForTileWithSize:centeredOnItemAtIndexPath:", v7, v406, v407);
    CGFloat v412 = v411;
    CGFloat v414 = v413;
    CGFloat v181 = v415;
    CGFloat v183 = v416;
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    CGRect v184 = [PUTileLayoutInfo alloc];
    double v185 = PURectGetCenter(v412, v414, v181, v183);
    double v187 = v417;
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v418 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    v662.size = v418;
    long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v136 = 1.0;
    p_CGRect slice = &v662;
    double v104 = 10.0;
    goto LABEL_88;
  }
  if ([v8 isEqualToString:PUTileKindBadge])
  {
    if ([v7 length] != 2 || !-[PUOneUpTilingLayout useBadgeTiles](self, "useBadgeTiles")) {
      goto LABEL_198;
    }
    double v423 = *MEMORY[0x1E4F1DB30];
    double v422 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    CGSize v424 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    remainder.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    remainder.size = v424;
    if (self->_delegateFlags.respondsToBadgeSizeForItemAtIndexPath)
    {
      [(PUOneUpTilingLayout *)self _getLayoutRect:&remainder transform:0 parallaxOffset:0 forContentOfItemAtIndexPath:v7 options:0];
      CGFloat v425 = remainder.size.width + -12.0;
      v426 = [(PUOneUpTilingLayout *)self delegate];
      double v649 = v425;
      [v426 layout:self badgeSizeForItemAtIndexPath:v7 contentWidth:v425];
      double v654 = v428;
      double rect2d = v427;
    }
    else
    {
      double v649 = 0.0;
      double v654 = v422;
      double rect2d = v423;
    }
    double v517 = rect2d;
    if (rect2d == v423)
    {
      double v517 = v654;
      if (v654 == v422) {
        goto LABEL_198;
      }
    }
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v7, v517);
    double v520 = v519;
    double v522 = v521;
    double v524 = v523;
    double v526 = v525;
    [(PUOneUpTilingLayout *)self contentGuideInsets];
    if (v528 < 6.0) {
      double v528 = 6.0;
    }
    if (v530 < 6.0) {
      double v530 = 6.0;
    }
    double v531 = v520 + v528;
    double v532 = v522 + v527;
    CGFloat v533 = v524 - (v528 + v530);
    double v534 = v526 - (v527 + v529);
    v676.origin.CGFloat x = v531;
    v676.origin.CGFloat y = v532;
    v676.size.CGFloat width = v533;
    v676.size.CGFloat height = v534;
    CGFloat v535 = CGRectGetMinX(v676) + 6.0;
    double v646 = v533;
    v677.origin.CGFloat x = v531;
    v677.origin.CGFloat y = v532;
    v677.size.CGFloat width = v533;
    v677.size.CGFloat height = v534;
    CGFloat v536 = CGRectGetMinY(v677) + 11.0;
    [(PUOneUpTilingLayout *)self _untransformedRectForItemAtIndexPath:v7];
    PXEdgeInsetsMake();
    PXEdgeInsetsInsetRect();
    v699.origin.CGFloat x = v537;
    v699.origin.CGFloat y = v538;
    v699.size.CGFloat width = v539;
    v699.size.CGFloat height = v540;
    double v541 = v535;
    v678.origin.CGFloat x = v535;
    double v542 = v536;
    v678.origin.CGFloat y = v536;
    v678.size.CGFloat height = v654;
    v678.size.CGFloat width = rect2d;
    if (CGRectIntersectsRect(v678, v699))
    {
      v700.origin.CGFloat x = v531;
      v700.size.CGFloat width = v646;
      v700.origin.CGFloat y = v532;
      v700.size.CGFloat height = v534;
      if (CGRectIntersectsRect(remainder, v700))
      {
        v701.origin.CGFloat x = v531;
        v701.size.CGFloat width = v646;
        v701.origin.CGFloat y = v532;
        v701.size.CGFloat height = v534;
        CGRect v679 = CGRectIntersection(remainder, v701);
        CGRect remainder = v679;
        CGFloat v543 = v679.size.width + -12.0;
        v544 = [(PUOneUpTilingLayout *)self delegate];
        double v649 = v543;
        [v544 layout:self badgeSizeForItemAtIndexPath:v7 contentWidth:v543];
        double v654 = v546;
        double rect2d = v545;

        double v541 = CGRectGetMinX(remainder) + 6.0;
        double v542 = CGRectGetMinY(remainder) + 11.0;
      }
    }
    if (!CGRectIsNull(remainder))
    {
      CGFloat v547 = CGRectGetMaxY(remainder) + -11.0;
      v680.origin.CGFloat x = v541;
      v680.origin.CGFloat y = v542;
      v680.size.CGFloat height = v654;
      v680.size.CGFloat width = rect2d;
      double v548 = v547 - CGRectGetHeight(v680);
      if (v542 >= v548) {
        double v542 = v548;
      }
    }
    v702.size.CGFloat height = v654;
    double v549 = fmin(v649, v646 + -12.0);
    v702.origin.CGFloat x = v541;
    v702.origin.CGFloat y = v542;
    v702.size.CGFloat width = rect2d;
    BOOL v550 = CGRectIntersectsRect(remainder, v702);
    if (self->_delegateFlags.respondsToLeadingBadgesWidthForItemAtIndexPath)
    {
      v551 = [(PUOneUpTilingLayout *)self delegate];
      [v551 layout:self leadingBadgesWidthForItemAtIndexPath:v7 contentWidth:v549];
      uint64_t v553 = v552;
    }
    else
    {
      uint64_t v553 = 0;
    }
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    v585 = [PUBadgeTileLayoutInfo alloc];
    double v586 = PURectGetCenter(v541, v542, rect2d, v654);
    double v588 = v587;
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v589 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    v662.size = v589;
    long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    uint64_t v144 = -[PUBadgeTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:hitTestOutset:coordinateSystem:isOverContent:contentWidth:leadingContentWidth:](v585, "initWithTileIdentifier:center:size:alpha:transform:zPosition:hitTestOutset:coordinateSystem:isOverContent:contentWidth:leadingContentWidth:", v15, &v662, v103, v550, v586, v588, rect2d, v654, 1.0, 26.0, *MEMORY[0x1E4F91318], *(void *)(MEMORY[0x1E4F91318] + 8), *(void *)(MEMORY[0x1E4F91318] + 16), *(void *)(MEMORY[0x1E4F91318] + 24), *(void *)&v549, v553);
    goto LABEL_68;
  }
  if ([v8 isEqualToString:PUTileKindAssetExplorerReviewScreenBadge])
  {
    if ([v7 length] != 2
      || ![(PUOneUpTilingLayout *)self useAssetExplorerReviewScreenBadgeTiles])
    {
      goto LABEL_198;
    }
    double v430 = *MEMORY[0x1E4F1DB30];
    double v429 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v431 = *MEMORY[0x1E4F1DB30];
    double v432 = v429;
    if (self->_delegateFlags.respondsToAssetExplorerReviewScreenBadgeSizeForItemAtIndexPath)
    {
      v433 = [(PUOneUpTilingLayout *)self delegate];
      [v433 layout:self assetExplorerReviewScreenBadgeSizeForItemAtIndexPath:v7];
      double v431 = v434;
      double v432 = v435;
    }
    if (v431 == v430 && v432 == v429) {
      goto LABEL_198;
    }
    [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v7];
    double v437 = v436;
    double v439 = v438;
    double v441 = v440;
    double v443 = v442;
    [(PUOneUpTilingLayout *)self contentGuideInsets];
    double v445 = v437 + v444;
    double v447 = v439 + v446;
    double v449 = v441 - (v444 + v448);
    double v451 = v446 + v450;
    CGSize v452 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    double v453 = v443 - v451;
    remainder.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    remainder.size = v452;
    [(PUOneUpTilingLayout *)self _getLayoutRect:&remainder transform:0 parallaxOffset:0 forContentOfItemAtIndexPath:v7 options:0];
    v696.origin.CGFloat x = v445;
    v696.origin.CGFloat y = v447;
    v696.size.CGFloat width = v449;
    v696.size.CGFloat height = v453;
    BOOL v454 = CGRectIntersectsRect(remainder, v696);
    CGFloat v455 = remainder.origin.x;
    CGFloat v456 = remainder.origin.y;
    CGFloat v457 = remainder.size.width;
    CGFloat v458 = remainder.size.height;
    if (v454)
    {
      v697.origin.CGFloat x = v445;
      v697.origin.CGFloat y = v447;
      v697.size.CGFloat width = v449;
      v697.size.CGFloat height = v453;
      *(CGRect *)&CGFloat v455 = CGRectIntersection(*(CGRect *)&v455, v697);
      remainder.origin.CGFloat x = v455;
      remainder.origin.CGFloat y = v456;
      remainder.size.CGFloat width = v457;
      remainder.size.CGFloat height = v458;
    }
    CGFloat v459 = CGRectGetMinX(*(CGRect *)&v455) + 10.0;
    CGFloat v460 = CGRectGetMinY(remainder) + 10.0;
    v698.origin.CGFloat x = v459;
    v698.origin.CGFloat y = v460;
    v698.size.CGFloat width = v431;
    v698.size.CGFloat height = v432;
    BOOL v461 = CGRectIntersectsRect(remainder, v698);
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    v462 = [PUBadgeTileLayoutInfo alloc];
    double v463 = PURectGetCenter(v459, v460, v431, v432);
    double v465 = v464;
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v466 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    v662.size = v466;
    long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    uint64_t v144 = -[PUBadgeTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:hitTestOutset:coordinateSystem:isOverContent:contentWidth:leadingContentWidth:](v462, "initWithTileIdentifier:center:size:alpha:transform:zPosition:hitTestOutset:coordinateSystem:isOverContent:contentWidth:leadingContentWidth:", v15, &v662, v103, v461, v463, v465, v431, v432, 1.0, 34.0, *MEMORY[0x1E4FB2848], *(void *)(MEMORY[0x1E4FB2848] + 8), *(void *)(MEMORY[0x1E4FB2848] + 16), *(void *)(MEMORY[0x1E4FB2848] + 24), 0, 0);
    goto LABEL_68;
  }
  if ([v8 isEqualToString:PUTileKindAccessory])
  {
    if ([v7 length] != 2
      || ![(PUOneUpTilingLayout *)self _accessoryViewVisibilityForItemAtIndexPath:v7])
    {
      goto LABEL_198;
    }
    [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v7];
    CGFloat v468 = v467;
    CGFloat v470 = v469;
    CGFloat v472 = v471;
    CGFloat v474 = v473;
    v475 = +[PUOneUpSettings sharedInstance];
    [v475 minimumVisibleContentHeight];
    double v477 = v476;

    if (self->_delegateFlags.respondsToMinimumVisibleContentHeightForItemAtIndexPath)
    {
      v478 = [(PUOneUpTilingLayout *)self delegate];
      [v478 layout:self minimumVisibleContentHeightForItemAtIndexPath:v7];
      double v477 = v479;
    }
    memset(&remainder, 0, sizeof(remainder));
    memset(&slice, 0, sizeof(slice));
    [(PUOneUpTilingLayout *)self contentGuideInsets];
    CGFloat v481 = v477 + v480;
    v675.origin.CGFloat x = v468;
    v675.origin.CGFloat y = v470;
    v675.size.CGFloat width = v472;
    v675.size.CGFloat height = v474;
    CGRectDivide(v675, &slice, &remainder, v481, CGRectMinYEdge);
    long long v482 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    float64x2_t v668 = *(float64x2_t *)MEMORY[0x1E4F1DB28];
    long long v669 = v482;
    *(void *)&long long v670 = 0x3FF0000000000000;
    v483 = +[PUOneUpSettings sharedInstance];
    int v484 = [v483 shouldFadeAccessoryView];

    if (v484) {
      v485 = &v670;
    }
    else {
      v485 = 0;
    }
    [(PUOneUpTilingLayout *)self _getLayoutRect:&v668 transform:0 parallaxOffset:0 contentsRect:0 alpha:v485 forContentOfItemAtIndexPath:v7 options:3];
    float64x2_t v668 = vsubq_f64(v668, (float64x2_t)remainder.origin);
    [(PUOneUpTilingLayout *)self contentGuideInsets];
    uint64_t v487 = v486;
    uint64_t v489 = v488;
    uint64_t v491 = v490;
    uint64_t v493 = v492;
    if (self->_delegateFlags.respondsToMinimumVisibleAccessoryHeightForItemAtIndexPath)
    {
      v494 = [(PUOneUpTilingLayout *)self delegate];
      [v494 layout:self minimumVisibleAccessoryHeightForItemAtIndexPath:v7];
      uint64_t v496 = v495;
    }
    else
    {
      uint64_t v496 = 0x4049000000000000;
    }
    v603 = [(PUOneUpTilingLayout *)self delegate];
    [v603 layout:self accessoryOffsetForItemAtIndexPath:v7];
    double v605 = v604;
    double v607 = v606;

    remainder.origin.CGFloat x = remainder.origin.x + v605;
    remainder.origin.CGFloat y = remainder.origin.y + v607;
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    v608 = [PUAccessoryTileLayoutInfo alloc];
    double v609 = PURectGetCenter(remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    double v611 = v610;
    double v612 = *(double *)&v670;
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v613 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    v662.size = v613;
    long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    uint64_t v144 = -[PUAccessoryTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:contentInsets:minimumVisibleHeight:](v608, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:contentInsets:minimumVisibleHeight:", v15, &v662, v103, v609, v611, remainder.size.width, remainder.size.height, v612, 0.0, *(_OWORD *)&v668, v669, v487, v489, v491, v493, v496);
    goto LABEL_68;
  }
  if ([v8 isEqualToString:PUTileKindVideoPlaceholder])
  {
    if ([v7 length] != 2
      || ![(PUOneUpTilingLayout *)self _isVideoPlacholderVisibleForItemAtIndexPath:v7])
    {
      goto LABEL_198;
    }
    [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v7];
    CGFloat v498 = v497;
    CGFloat v500 = v499;
    CGFloat v181 = v501;
    CGFloat v183 = v502;
    id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    CGRect v184 = [PUTileLayoutInfo alloc];
    double v185 = PURectGetCenter(v498, v500, v181, v183);
    double v187 = v503;
    double v103 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v504 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    v662.size = v504;
    long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(double *)&uint64_t v189 = 100.0;
LABEL_82:
    double v104 = *(double *)&v189;
LABEL_83:
    double v136 = 1.0;
    p_CGRect slice = &v662;
LABEL_88:
    double v138 = v184;
    id v139 = v15;
    double v140 = v185;
    double v141 = v187;
    double v142 = v181;
    double v143 = v183;
    goto LABEL_67;
  }
  if (![v8 isEqualToString:PUTileKindLivePhotoVideoPlaybackOverlay])
  {
    if (![v8 isEqualToString:PUTileKindSyndicationAttribution])
    {
      if (![v8 isEqualToString:PUTileKindCropButton]) {
        goto LABEL_198;
      }
      if (!self->_delegateFlags.respondsToShouldShowCropButtonForItemAtIndexPath) {
        goto LABEL_198;
      }
      v590 = [(PUOneUpTilingLayout *)self delegate];
      int v591 = [v590 layout:self shouldShowCropButtonForItemAtIndexPath:v7];

      if (!v591) {
        goto LABEL_198;
      }
      [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v7];
      CGFloat v592 = v681.origin.x;
      CGFloat v593 = v681.origin.y;
      CGFloat v594 = v681.size.width;
      CGFloat v595 = v681.size.height;
      CGFloat v596 = CGRectGetMaxX(v681) + -140.0;
      v682.origin.CGFloat x = v592;
      v682.origin.CGFloat y = v593;
      v682.size.CGFloat width = v594;
      v682.size.CGFloat height = v595;
      CGFloat MinY = CGRectGetMinY(v682);
      id v15 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
      v598 = [PUTileLayoutInfo alloc];
      double v599 = PURectGetCenter(v596, MinY, 140.0, 80.0);
      double v601 = v600;
      double v103 = [(PUTilingLayout *)self coordinateSystem];
      CGSize v602 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
      v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
      v662.size = v602;
      long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      double v104 = 38.0;
      double v136 = 1.0;
      p_CGRect slice = &v662;
      double v138 = v598;
      id v139 = v15;
      double v140 = v599;
      double v141 = v601;
      double v142 = 140.0;
      double v143 = 80.0;
      goto LABEL_67;
    }
    if (![(PUOneUpTilingLayout *)self useSyndicationAttributionTile]) {
      goto LABEL_198;
    }
    if (!self->_delegateFlags.respondsToShouldShowAttributionViewForItemAtIndexPath) {
      goto LABEL_198;
    }
    v554 = [(PUOneUpTilingLayout *)self delegate];
    int v555 = [v554 layout:self shouldShowAttributionViewForItemAtIndexPath:v7];

    if (!v555) {
      goto LABEL_198;
    }
    [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v7];
    double v557 = v556;
    double v559 = v558;
    double v561 = v560;
    double v563 = v562;
    [(PUOneUpTilingLayout *)self contentGuideInsets];
    double v565 = v564;
    double v567 = v559 + v566;
    double v569 = v564 + v568;
    double v571 = v566 + v570;
    v572 = [(PUOneUpTilingLayout *)self layoutInfoForTileWithIndexPath:v7 kind:PUTileKindBadge];
    [v572 size];
    double v574 = v573;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_222:
      double v577 = v557 + v565;
      double v578 = v561 - v569;
      double v579 = v563 - v571;
      double v580 = v574 + 10.0;
      v581 = [MEMORY[0x1E4F90090] sharedInstance];
      uint64_t v582 = [v581 syndicated1upPillAlignment];

      if (v582 == 1)
      {
        double v583 = v578 - v580 + -10.0;
        double v584 = v577 + v580;
      }
      else
      {
        double v583 = v578 * 0.5 - v580 + v578 * 0.5 - v580;
        v683.origin.CGFloat x = v577;
        v683.origin.CGFloat y = v567 + 9.0;
        v683.size.CGFloat width = v578;
        v683.size.CGFloat height = v563 - v571;
        double v584 = CGRectGetMidX(v683) - v583 * 0.5;
      }
      v623 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
      v624 = [PUTileLayoutInfo alloc];
      double v625 = PURectGetCenter(v584, v567 + 9.0, v583, v579);
      double v627 = v626;
      v628 = [(PUTilingLayout *)self coordinateSystem];
      CGSize v629 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
      v662.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
      v662.size = v629;
      long long v663 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      double v32 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](v624, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", v623, &v662, v628, v625, v627, v583, v579, 1.0, 14.0);

      goto LABEL_199;
    }
    id v575 = v572;
    if (v575)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_221:
        [v575 leadingContentWidth];
        double v574 = v576;

        goto LABEL_222;
      }
      v630 = [MEMORY[0x1E4F28B00] currentHandler];
      v633 = (objc_class *)objc_opt_class();
      v632 = NSStringFromClass(v633);
      v634 = objc_msgSend(v575, "px_descriptionForAssertionMessage");
      [v630 handleFailureInMethod:a2, self, @"PUOneUpTilingLayout.m", 972, @"%@ should be an instance inheriting from %@, but it is %@", @"potentialBadgesLayoutInfo", v632, v634 object file lineNumber description];
    }
    else
    {
      v630 = [MEMORY[0x1E4F28B00] currentHandler];
      v631 = (objc_class *)objc_opt_class();
      v632 = NSStringFromClass(v631);
      [v630 handleFailureInMethod:a2, self, @"PUOneUpTilingLayout.m", 972, @"%@ should be an instance inheriting from %@, but it is nil", @"potentialBadgesLayoutInfo", v632 object file lineNumber description];
    }

    goto LABEL_221;
  }
  v513 = +[PUOneUpSettings sharedInstance];
  int v514 = [v513 shouldMergeOverlappingLivePhotos];

  if (v514)
  {
    id v15 = [(PUOneUpTilingLayout *)self indexPathOfCurrentItem];
    double v32 = 0;
    if ([v7 length] || !v15) {
      goto LABEL_24;
    }
    memset(&slice, 0, sizeof(slice));
    long long v663 = 0u;
    memset(&v662, 0, sizeof(v662));
    [(PUOneUpTilingLayout *)self _getLayoutRect:&slice transform:&v662 parallaxOffset:0 contentsRect:0 alpha:0 forContentOfItemAtIndexPath:v15 options:0];
    if (-[PUOneUpTilingLayout _shouldApplyInsetStylingToContentWithRect:indexPath:](self, "_shouldApplyInsetStylingToContentWithRect:indexPath:", v7, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height))
    {
      [(PUOneUpTilingLayout *)self insetContentCornerRadius];
      double v516 = v515;
    }
    else
    {
      v614 = +[PUOneUpSettings sharedInstance];
      [v614 itemContentCornerRadius];
      double v516 = v615;
    }
    uint64_t v616 = *MEMORY[0x1E4F39EA8];
    double v16 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v7 kind:v8];
    v617 = [PUTileLayoutInfo alloc];
    double v618 = PURectGetCenter(slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    double v620 = v619;
    v621 = [(PUTilingLayout *)self coordinateSystem];
    CGSize v622 = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    remainder.origin = (CGPoint)*MEMORY[0x1E4F1DAB8];
    remainder.size = v622;
    long long v667 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v32 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:](v617, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:", v16, v616, 0, &remainder, v621, v618, v620, slice.size.width, slice.size.height, 1.0, v516, 11.0, *MEMORY[0x1E4F91340], *(void *)(MEMORY[0x1E4F91340] + 8), *(void *)(MEMORY[0x1E4F91340] + 16), *(void *)(MEMORY[0x1E4F91340] + 24));

    goto LABEL_23;
  }
LABEL_198:
  double v32 = 0;
LABEL_199:

  return v32;
}

- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_layoutInfosByIndexPathByTileKind objectForKeyedSubscript:v7];
  int v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    int v9 = [(PUOneUpTilingLayout *)self _createLayoutInfoForTileWithIndexPath:v6 kind:v7];
    id v10 = [(NSMutableDictionary *)self->_layoutInfosByIndexPathByTileKind objectForKeyedSubscript:v7];
    if (v10)
    {
      if (v9)
      {
LABEL_4:
        id v11 = v9;
LABEL_7:
        long long v12 = v11;
        [v10 setObject:v11 forKeyedSubscript:v6];

        goto LABEL_8;
      }
    }
    else
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableDictionary *)self->_layoutInfosByIndexPathByTileKind setObject:v10 forKeyedSubscript:v7];
      if (v9) {
        goto LABEL_4;
      }
    }
    id v11 = [MEMORY[0x1E4F1CA98] null];
    goto LABEL_7;
  }
LABEL_8:
  double v13 = [MEMORY[0x1E4F1CA98] null];
  int v14 = [v13 isEqual:v9];

  if (v14)
  {

    int v9 = 0;
  }

  return v9;
}

- (CGSize)sizeForSection:(int64_t)a3 numberOfItems:(int64_t)a4
{
  [(PUOneUpTilingLayout *)self _itemSize];
  double v8 = v7;
  if (a4 < 1)
  {
    double v11 = *MEMORY[0x1E4F1DB30];
  }
  else
  {
    double v9 = v6;
    [(PUOneUpTilingLayout *)self interpageSpacing];
    double v11 = -(v10 - (double)a4 * (v9 + v10));
  }
  double v12 = v8;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (void)_collectLayoutInfosForTilesInRect:(CGRect)a3 withIndexPath:(id)a4 kinds:(id)a5 toSet:(id)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v14);
        }
        double v20 = [(PUOneUpTilingLayout *)self layoutInfoForTileWithIndexPath:v13 kind:*(void *)(*((void *)&v22 + 1) + 8 * v19)];
        CGFloat v21 = v20;
        if (v20)
        {
          [v20 frame];
          v29.origin.CGFloat x = x;
          v29.origin.CGFloat y = y;
          v29.size.CGFloat width = width;
          v29.size.CGFloat height = height;
          if (CGRectIntersectsRect(v28, v29)) {
            [v15 addObject:v21];
          }
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }
}

- (void)addLayoutInfosForSupplementaryTilesInRect:(CGRect)a3 toSet:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = PUTileKindBackground;
  uint64_t v14 = PUTileKindReviewScreenTopBar;
  uint64_t v15 = PUTileKindReviewScreenControlBar;
  uint64_t v16 = PUTileKindReviewScreenScrubberBar;
  uint64_t v17 = PUTileKindLivePhotoVideoPlaybackOverlay;
  double v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  double v11 = [v9 arrayWithObjects:&v13 count:5];
  double v12 = objc_msgSend(MEMORY[0x1E4F28D58], "pu_rootIndexPath", v13, v14, v15, v16, v17, v18);
  -[PUOneUpTilingLayout _collectLayoutInfosForTilesInRect:withIndexPath:kinds:toSet:](self, "_collectLayoutInfosForTilesInRect:withIndexPath:kinds:toSet:", v12, v11, v10, x, y, width, height);
}

- (void)addLayoutInfosForTilesInRect:(CGRect)a3 section:(int64_t)a4 toSet:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v33[16] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  [(PUSectionedTilingLayout *)self boundsForSection:a4];
  double v13 = v12;
  [(PUOneUpTilingLayout *)self _itemSize];
  double v15 = v14;
  [(PUOneUpTilingLayout *)self interpageSpacing];
  double v17 = v15 + v16;
  int64_t v18 = [(PUSectionedTilingLayout *)self numberOfItemsInSection:a4];
  BOOL v19 = [(PUSectionedTilingLayout *)self leftToRight];
  double v20 = x - v13;
  double v21 = -0.0;
  if (!v19) {
    double v21 = width;
  }
  double v22 = v20 + v21;
  double v23 = v20 - width;
  if (v19) {
    double v23 = width + v22;
  }
  uint64_t v24 = vcvtmd_s64_f64(v22 / v17);
  if (!v19) {
    uint64_t v24 = v18 + ~v24;
  }
  uint64_t v25 = v24 & ~(v24 >> 63);
  int64_t v26 = vcvtpd_s64_f64(v23 / v17);
  if (!v19) {
    int64_t v26 = v18 + ~v26;
  }
  if (v26 >= v18 - 1) {
    int64_t v26 = v18 - 1;
  }
  if (v25 <= v26)
  {
    int64_t v27 = v26 + 1;
    do
    {
      CGRect v28 = [MEMORY[0x1E4F28D58] indexPathForItem:v25 inSection:a4];
      [(PUOneUpTilingLayout *)self _pageRectForItemAtIndexPath:v28];
      v35.origin.double x = x;
      v35.origin.double y = y;
      v35.size.double width = width;
      v35.size.double height = height;
      if (CGRectIntersectsRect(v34, v35))
      {
        v33[0] = @"PUTileKindItemContent";
        v33[1] = PUTileKindUserTransform;
        v33[2] = PUTileKindPlayButton;
        v33[3] = PUTileKindProgressIndicator;
        void v33[4] = PUTileKindPeople;
        v33[5] = PUTileKindRenderIndicator;
        v33[6] = PUTileKindBufferingIndicator;
        v33[7] = PUTileKindLoadingIndicator;
        v33[8] = PUTileKindBadge;
        v33[9] = PUTileKindAccessory;
        v33[10] = PUTileKindVideoPlaceholder;
        v33[11] = PUTileKindAssetExplorerReviewScreenBadge;
        v33[12] = PUTileKindSelectionIndicator;
        v33[13] = PUTileKindImportStatusIndicator;
        v33[14] = PUTileKindAssetExplorerReviewScreenProgressIndicator;
        v33[15] = PUTileKindSyndicationAttribution;
        CGRect v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:16];
        double v30 = +[PUOneUpSettings sharedInstance];
        int v31 = [v30 quickCropEnabled];

        if (v31)
        {
          uint64_t v32 = [v29 arrayByAddingObject:PUTileKindCropButton];

          CGRect v29 = (void *)v32;
        }
        -[PUOneUpTilingLayout _collectLayoutInfosForTilesInRect:withIndexPath:kinds:toSet:](self, "_collectLayoutInfosForTilesInRect:withIndexPath:kinds:toSet:", v28, v29, v11, x, y, width, height);
      }
      ++v25;
    }
    while (v27 != v25);
  }
}

- (CGSize)estimatedSectionSize
{
  [(PUOneUpTilingLayout *)self sizeForSection:0x7FFFFFFFFFFFFFFFLL numberOfItems:20];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (id)preferredScrollInfo
{
  [(PUOneUpTilingLayout *)self interpageSpacing];
  double v4 = v3;
  double v6 = v5;
  [(PUSectionedTilingLayout *)self interSectionSpacing];
  if (v4 != v7)
  {
    double v8 = PLOneUpGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v21[0] = 0;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "One-up layout has different interpage and inter-section spacings. This will result in undefined paging behavior.", (uint8_t *)v21, 2u);
    }
  }
  double v9 = +[PUOneUpSettings sharedInstance];
  [v9 pagingSpringPullAdjustment];
  double v11 = v10;

  double v12 = +[PUOneUpSettings sharedInstance];
  [v12 pagingFrictionAdjustment];
  double v14 = v13;

  double v15 = +[PURootSettings sharedInstance];
  int v16 = [v15 irisUIEnabled];

  if (v16) {
    double v17 = v11;
  }
  else {
    double v17 = 0.0;
  }
  if (v16) {
    double v18 = v14;
  }
  else {
    double v18 = 0.0;
  }
  BOOL v19 = +[PUTilingScrollInfo scrollInfoWithScrollDirections:enabledPagingWithInterpageSpacing:pagingSpringPullAdjustment:pagingFrictionAdjustment:](PUTilingScrollInfo, "scrollInfoWithScrollDirections:enabledPagingWithInterpageSpacing:pagingSpringPullAdjustment:pagingFrictionAdjustment:", 2, v4, v6, v17, v18);
  return v19;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 invalidatedAllTiles])
  {
    [(NSMutableDictionary *)self->_layoutInfosByIndexPathByTileKind removeAllObjects];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v5 = [v4 invalidatedTileKinds];
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
          double v10 = [(NSMutableDictionary *)self->_layoutInfosByIndexPathByTileKind objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
          [v10 removeAllObjects];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__PUOneUpTilingLayout_invalidateLayoutWithContext___block_invoke;
    v12[3] = &unk_1E5F2BB00;
    v12[4] = self;
    [v4 enumerateInvalidatedTilesUsingBlock:v12];
  }
  v11.receiver = self;
  v11.super_class = (Class)PUOneUpTilingLayout;
  [(PUTilingLayout *)&v11 invalidateLayoutWithContext:v4];
}

void __51__PUOneUpTilingLayout_invalidateLayoutWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 248);
  id v5 = a2;
  id v6 = [v4 objectForKeyedSubscript:a3];
  [v6 removeObjectForKey:v5];
}

- (void)prepareLayout
{
  v14.receiver = self;
  v14.super_class = (Class)PUOneUpTilingLayout;
  [(PUSectionedTilingLayout *)&v14 prepareLayout];
  [(PUTilingLayout *)self visibleRect];
  self->_itemSize.double width = v3;
  self->_itemSize.double height = v4;
  [(PUTilingLayout *)self visibleRect];
  double MidX = CGRectGetMidX(v15);
  -[PUOneUpTilingLayout _indexPathOfItemClosestToAbscissa:](self, "_indexPathOfItemClosestToAbscissa:");
  id v6 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  inFocusIndexPath = self->_inFocusIndexPath;
  self->_inFocusIndexPath = v6;

  uint64_t v8 = self->_inFocusIndexPath;
  if (v8)
  {
    id v13 = 0;
    [(PUOneUpTilingLayout *)self _normalizedTransitionProgressFrom:v8 withAbscissa:&v13 outNeighbor:MidX];
    double v10 = v9;
    objc_super v11 = (NSIndexPath *)v13;
  }
  else
  {
    objc_super v11 = 0;
    double v10 = 0.0;
  }
  self->_transitionProgress = v10;
  neighborIndexPath = self->_neighborIndexPath;
  self->_neighborIndexPath = v11;
}

- (void)setVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUTilingLayout *)self visibleRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v21.receiver = self;
  v21.super_class = (Class)PUOneUpTilingLayout;
  -[PUSectionedTilingLayout setVisibleRect:](&v21, sel_setVisibleRect_, x, y, width, height);
  if (width != v13 || height != v15)
  {
    self->_itemSize = (CGSize)PUSizeNull;
    double v17 = objc_alloc_init(PUTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v17 invalidateContentBounds];
    [(PUTilingLayoutInvalidationContext *)v17 invalidateAllTiles];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v17];
  }
  if (x != v9 || y != v11)
  {
    BOOL v19 = objc_alloc_init(PUTilingLayoutInvalidationContext);
    double v20 = [(PUOneUpTilingLayout *)self parallaxComputer];

    if (v20) {
      [(PUTilingLayoutInvalidationContext *)v19 invalidateAllTilesWithKind:@"PUTileKindItemContent"];
    }
    [(PUTilingLayoutInvalidationContext *)v19 invalidateAllTilesWithKind:PUTileKindBackground];
    [(PUTilingLayoutInvalidationContext *)v19 invalidateAllTilesWithKind:PUTileKindReviewScreenTopBar];
    [(PUTilingLayoutInvalidationContext *)v19 invalidateAllTilesWithKind:PUTileKindReviewScreenControlBar];
    [(PUTilingLayoutInvalidationContext *)v19 invalidateAllTilesWithKind:PUTileKindReviewScreenScrubberBar];
    [(PUTilingLayoutInvalidationContext *)v19 invalidateAllTilesWithKind:PUTileKindLivePhotoVideoPlaybackOverlay];
    [(PUOneUpTilingLayout *)self invalidateLayoutWithContext:v19];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToPixelSizeForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAspectRatioForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToInsetsWhenScaledToFitForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToBadgeSizeForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToLeadingBadgesWidthForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAssetExplorerReviewScreenBadgeSizeForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowPlayButtonForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowCropButtonForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowProgressIndicatorForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldMoveProgressIndicatorForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowPeopleRowForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldMovePeopleRowForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowBufferingIndicatorForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToLoadingIndicatorSizeForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToModelTileTransformForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToContentOffsetForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowAccessoryForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToIsShowingInfoPanelForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMinimumVisibleContentHeightForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMinimumVisibleAccessoryHeightForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowVideoPlaceholderForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldInitiallyZoomToFillForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowReviewScreenScrubberBar = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAlphaForReviewScreenBarsInLayout = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToBestSquareRectForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMinimumItemHeightNeededInAccessoryForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldUseSquareImageInAccessoryForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowAttributionViewForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCanApplyInsetStylingToItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillApplyDisplayTransform = objc_opt_respondsToSelector() & 1;
  }
}

- (PUOneUpTilingLayout)init
{
  v12.receiver = self;
  v12.super_class = (Class)PUOneUpTilingLayout;
  double v2 = [(PUTilingLayout *)&v12 init];
  CGFloat v3 = v2;
  if (v2)
  {
    __asm { FMOV            V0.2D, #20.0 }
    v2->_interpageSpacing = _Q0;
    v2->_itemSize = (CGSize)PUSizeNull;
    -[PUSectionedTilingLayout setInterSectionSpacing:](v2, "setInterSectionSpacing:", v2->_interpageSpacing.width, v2->_interpageSpacing.height);
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    layoutInfosByIndexPathByTileKind = v3->_layoutInfosByIndexPathByTileKind;
    v3->_layoutInfosByIndexPathByTileKind = (NSMutableDictionary *)v9;
  }
  return v3;
}

+ (CGRect)untransformedRectForItemWithAspectRatio:(double)a3 pageRect:(CGRect)a4 safeInsets:(UIEdgeInsets)a5
{
  objc_msgSend(a1, "untransformedRectForItemWithAspectRatio:pageRect:safeInsets:minimumInsetMargin:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(void *)&a5.top, *(void *)&a5.left, *(void *)&a5.bottom, *(void *)&a5.right, 0);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

+ (id)centerTileKinds
{
  if (centerTileKinds_onceToken != -1) {
    dispatch_once(&centerTileKinds_onceToken, &__block_literal_global_49472);
  }
  double v2 = (void *)centerTileKinds_centerTileKinds;
  return v2;
}

void __38__PUOneUpTilingLayout_centerTileKinds__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = PUTileKindBufferingIndicator;
  v4[1] = PUTileKindLoadingIndicator;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  CGFloat v3 = (void *)centerTileKinds_centerTileKinds;
  centerTileKinds_centerTileKinds = v2;
}

+ (CGRect)rectForFittingToTargetPixelSize:(CGSize)a3 imagePixelSize:(CGSize)a4 bestSquareUnitRect:(CGRect)a5
{
  double v5 = 0.0;
  PXRectWithAspectRatioFittingRect();
  PXRectNormalize();
  PXRectGetCenter();
  PXRectWithCenterAndSize();
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  if (CGRectGetMinX(v19) >= 0.0)
  {
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    if (CGRectGetMaxX(v20) <= 1.0)
    {
      double v5 = x;
    }
    else
    {
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      double v5 = 1.0 - CGRectGetWidth(v21);
    }
  }
  v22.origin.CGFloat x = v5;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double v10 = 0.0;
  if (CGRectGetMinY(v22) >= 0.0)
  {
    v23.origin.CGFloat x = v5;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    double v10 = y;
    if (CGRectGetMaxY(v23) > 1.0)
    {
      v24.origin.CGFloat x = v5;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      double v10 = 1.0 - CGRectGetHeight(v24);
    }
  }
  double v11 = *MEMORY[0x1E4F91340];
  double v12 = *(double *)(MEMORY[0x1E4F91340] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F91340] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F91340] + 24);
  if (PXRectApproximatelyEqualToRect())
  {
    CGFloat height = v14;
    CGFloat width = v13;
    double v10 = v12;
    double v5 = v11;
  }
  double v15 = v5;
  double v16 = v10;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

+ (void)initialize
{
}

@end