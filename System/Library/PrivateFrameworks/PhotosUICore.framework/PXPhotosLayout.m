@interface PXPhotosLayout
- (BOOL)_shouldShowSectionedLayout;
- (BOOL)alignsHeaderTitleWithLayoutMargins;
- (BOOL)appliesAlphaToSublayouts;
- (BOOL)canHandleVisibleRectRejection;
- (BOOL)canScrollToInitialPosition;
- (BOOL)stackLayout:(id)a3 shouldAlignSublayoutToVisibleBottomEdge:(id)a4;
- (BOOL)stackLayout:(id)a3 shouldAlignSublayoutToVisibleTopEdge:(id)a4;
- (BOOL)wantsHeaderInSafeArea;
- (CGPoint)adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:(CGPoint)a3 scrollingVelocity:(CGPoint)a4 decelerationRate:(int64_t *)a5;
- (CGPoint)headerTitleOrigin;
- (CGPoint)visibleOriginForScrollingToNeighboringSectionInDirection:(unint64_t)a3;
- (CGRect)originalPlacementRect;
- (CGSize)_headerTitleReferenceSize;
- (CGSize)_headerTitleSize;
- (CGSize)headerTitleSize;
- (CGSize)swift_contentSizeForProposedContentSize:(CGSize)a3;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSDateIntervalFormatter)dateIntervalFormatter;
- (NSDictionary)headerSubtitleOverBackgroundAttributes;
- (NSDictionary)headerSubtitleOverContentAttributes;
- (NSDictionary)headerTitleOverBackgroundAttributes;
- (NSDictionary)headerTitleOverContentAttributes;
- (NSString)headerSubtitle;
- (NSString)headerTitle;
- (PXFloatRange)bottomCollapsibleArea;
- (PXFloatRange)topCollapsibleArea;
- (PXGItemPlacement)placementOverride;
- (PXPhotosGlobalHeaderLayoutProvider)globalHeaderProvider;
- (PXPhotosHeaderCustomizationModel)headerCustomizationModel;
- (PXPhotosLayout)initWithViewModel:(id)a3 specManager:(id)a4 overlayController:(id)a5;
- (PXPhotosLayoutAnimationProvider)animationProvider;
- (PXPhotosLayoutDelegate)delegate;
- (PXPhotosLayoutSpecManager)specManager;
- (PXPhotosLayoutState)presentedLayoutState;
- (PXPhotosOverlayController)overlayController;
- (PXPhotosSectionBodyLayoutProvider)sectionBodyProvider;
- (PXPhotosSectionHeaderLayoutProvider)sectionHeaderProvider;
- (PXPhotosViewModel)viewModel;
- (PXScrollDetent)detentForInitialScrollPosition;
- (UIEdgeInsets)additionalSafeAreaInsetsForSublayout:(id)a3;
- (UIEdgeInsets)paddingForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (UIEdgeInsets)scrollableContentInsets;
- (UIView)footerView;
- (UIView)headerView;
- (double)_headerSubtitleLineHeight;
- (double)_headerTitleLineHeight;
- (double)headerTitleBaselineToBottom;
- (double)statusBarHeight;
- (double)titleBackgroundGradientAdditionalCoverage;
- (double)titleBackgroundSpriteHeight;
- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3;
- (id)assetsIteratorForContentInRect:(CGRect)a3;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axSpriteIndexes;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)createAnchorForScrollingToInitialPosition;
- (id)createAnchorForVisibleAreaIgnoringEdges:(unint64_t)a3;
- (id)createCurrentLayoutState;
- (id)createDefaultAnimationForCurrentContext;
- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)itemPlacementControllerForItemReference:(id)a3;
- (id)locationNamesFutureForContentInRect:(CGRect)a3;
- (id)placementInContext:(id)a3 forItemReference:(id)a4;
- (id)presentedDataSource;
- (id)presentedItemsGeometryForSection:(unint64_t)a3 inDataSource:(id)a4;
- (id)regionOfInterestForAssetReference:(id)a3;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)topmostSectionHeaderSnapshotInRect:(CGRect)a3;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)headerTitleDrawingOptions;
- (int64_t)pendingHideAnimationType;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (unint64_t)fullyVisibleEdgesWithDefaultTolerance;
- (unsigned)_expectedLocalSpriteCount;
- (unsigned)_titleBackgroundSpriteIndex;
- (void)_informTopHeaderLayoutAboutDataSourceChange;
- (void)_invalidateContentBelowTitle;
- (void)_invalidateDynamicHeaderTitle;
- (void)_invalidateFooter;
- (void)_invalidateGlobalBackground;
- (void)_invalidateGlobalHeaderLayout;
- (void)_invalidateHeaderAnimated:(BOOL)a3;
- (void)_invalidateHeaderAttributes;
- (void)_invalidateHeaderMeasurements;
- (void)_invalidateHeaderMeasurementsForTitleChange;
- (void)_invalidateHeaderTitle;
- (void)_invalidateLocalSprites;
- (void)_invalidateLocalSpritesAlpha;
- (void)_invalidateLocalSpritesCount;
- (void)_invalidateScrollDetentAnchor;
- (void)_invalidateSectionedLayout;
- (void)_invalidateSectionedLayoutPlacementOverrides;
- (void)_invalidateTopHeaderLayout;
- (void)_performPreUpdateInvalidationDeferredIfNeeded:(id)a3;
- (void)_updateContentBelowTitle;
- (void)_updateFooter;
- (void)_updateGlobalHeaderLayout;
- (void)_updateHeaderAnimated:(BOOL)a3;
- (void)_updateHeaderAttributes;
- (void)_updateHeaderFooterAlphaAnimator;
- (void)_updateHeaderMeasurements;
- (void)_updateHeaderOrigin;
- (void)_updateHeaderTitle;
- (void)_updateLocalSprites;
- (void)_updateLocalSpritesAlpha;
- (void)_updateLocalSpritesCount;
- (void)_updatePresentedLayoutState;
- (void)_updateScrollDetentAnchor;
- (void)_updateSectionedLayout;
- (void)_updateSectionedLayoutPlacementOverrides;
- (void)_updateTopHeaderLayout;
- (void)adjustCopiedSprites:(id *)a3;
- (void)clearLastVisibleAreaAnchoringInformation;
- (void)didUpdate;
- (void)displayScaleDidChange;
- (void)enumerateItemsGeometriesInRect:(CGRect)a3 dataSource:(id)a4 usingBlock:(id)a5;
- (void)enumerateScrollablePagesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)hideSpritesForObjectReferences:(id)a3;
- (void)invalidateFooterHeight;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceSizeDidChange;
- (void)safeAreaInsetsDidChange;
- (void)setAlignsHeaderTitleWithLayoutMargins:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setGlobalHeaderProvider:(id)a3;
- (void)setHeaderSubtitle:(id)a3;
- (void)setHeaderSubtitleOverBackgroundAttributes:(id)a3;
- (void)setHeaderSubtitleOverContentAttributes:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHeaderTitleBaselineToBottom:(double)a3;
- (void)setHeaderTitleOrigin:(CGPoint)a3;
- (void)setHeaderTitleOverBackgroundAttributes:(id)a3;
- (void)setHeaderTitleOverContentAttributes:(id)a3;
- (void)setHeaderTitleSize:(CGSize)a3;
- (void)setHeaderView:(id)a3;
- (void)setHeaderView:(id)a3 animated:(BOOL)a4;
- (void)setPendingHideAnimationType:(int64_t)a3;
- (void)setPlacementOverride:(id)a3;
- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4;
- (void)setPresentedLayoutState:(id)a3;
- (void)setScrollableContentInsets:(UIEdgeInsets)a3;
- (void)setSectionBodyProvider:(id)a3;
- (void)setSectionHeaderProvider:(id)a3;
- (void)setStatusBarHeight:(double)a3;
- (void)setTitleBackgroundGradientAdditionalCoverage:(double)a3;
- (void)setTitleBackgroundSpriteHeight:(double)a3;
- (void)setWantsHeaderInSafeArea:(BOOL)a3;
- (void)update;
- (void)visibleRectDidChange;
- (void)willUpdate;
@end

@implementation PXPhotosLayout

- (UIEdgeInsets)scrollableContentInsets
{
  v2 = self;
  sub_1AA298D08();
}

- (void)setScrollableContentInsets:(UIEdgeInsets)a3
{
  v3 = self;
  sub_1AA298D08();
}

- (PXScrollDetent)detentForInitialScrollPosition
{
  v2 = self;
  sub_1AA298EBC();
}

- (BOOL)canScrollToInitialPosition
{
  v2 = self;
  sub_1AA298FF8();
}

- (CGSize)swift_contentSizeForProposedContentSize:(CGSize)a3
{
  v3 = self;
  sub_1AA2990CC();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_headerCustomizationModel, 0);
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_placementOverride, 0);
  objc_storeStrong((id *)&self->_headerSubtitleOverContentAttributes, 0);
  objc_storeStrong((id *)&self->_headerSubtitleOverBackgroundAttributes, 0);
  objc_storeStrong((id *)&self->_headerTitleOverBackgroundAttributes, 0);
  objc_storeStrong((id *)&self->_headerTitleOverContentAttributes, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_presentedLayoutState, 0);
  objc_storeStrong((id *)&self->_animationProvider, 0);
  objc_storeStrong((id *)&self->_sectionBodyProvider, 0);
  objc_storeStrong((id *)&self->_globalHeaderProvider, 0);
  objc_storeStrong((id *)&self->_sectionHeaderProvider, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_dynamicLocationName, 0);
  objc_storeStrong((id *)&self->_dynamicDateInterval, 0);
  objc_storeStrong((id *)&self->_footerLayout, 0);
  objc_storeStrong((id *)&self->_headerLayout, 0);
  objc_storeStrong((id *)&self->_topHeaderLayout, 0);
  objc_storeStrong((id *)&self->_globalHeaderLayout, 0);
  objc_storeStrong((id *)&self->_headerFooterAlphaAnimator, 0);
  objc_storeStrong((id *)&self->_sectionedLayout, 0);
  objc_storeStrong((id *)&self->_alternateAppearanceMixAnimator, 0);
}

- (PXPhotosOverlayController)overlayController
{
  return self->_overlayController;
}

- (PXPhotosHeaderCustomizationModel)headerCustomizationModel
{
  return self->_headerCustomizationModel;
}

- (NSDateIntervalFormatter)dateIntervalFormatter
{
  return self->_dateIntervalFormatter;
}

- (PXGItemPlacement)placementOverride
{
  return self->_placementOverride;
}

- (double)titleBackgroundGradientAdditionalCoverage
{
  return self->_titleBackgroundGradientAdditionalCoverage;
}

- (double)titleBackgroundSpriteHeight
{
  return self->_titleBackgroundSpriteHeight;
}

- (double)headerTitleBaselineToBottom
{
  return self->_headerTitleBaselineToBottom;
}

- (CGSize)headerTitleSize
{
  double width = self->_headerTitleSize.width;
  double height = self->_headerTitleSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)headerTitleOrigin
{
  double x = self->_headerTitleOrigin.x;
  double y = self->_headerTitleOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)headerTitleDrawingOptions
{
  return self->_headerTitleDrawingOptions;
}

- (NSDictionary)headerSubtitleOverContentAttributes
{
  return self->_headerSubtitleOverContentAttributes;
}

- (NSDictionary)headerSubtitleOverBackgroundAttributes
{
  return self->_headerSubtitleOverBackgroundAttributes;
}

- (NSDictionary)headerTitleOverBackgroundAttributes
{
  return self->_headerTitleOverBackgroundAttributes;
}

- (NSDictionary)headerTitleOverContentAttributes
{
  return self->_headerTitleOverContentAttributes;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setPresentedLayoutState:(id)a3
{
}

- (PXPhotosLayoutState)presentedLayoutState
{
  return self->_presentedLayoutState;
}

- (PXPhotosLayoutAnimationProvider)animationProvider
{
  return self->_animationProvider;
}

- (void)setPendingHideAnimationType:(int64_t)a3
{
  self->_pendingHideAnimationType = a3;
}

- (int64_t)pendingHideAnimationType
{
  return self->_pendingHideAnimationType;
}

- (BOOL)alignsHeaderTitleWithLayoutMargins
{
  return self->_alignsHeaderTitleWithLayoutMargins;
}

- (BOOL)wantsHeaderInSafeArea
{
  return self->_wantsHeaderInSafeArea;
}

- (double)statusBarHeight
{
  return self->_statusBarHeight;
}

- (PXPhotosSectionBodyLayoutProvider)sectionBodyProvider
{
  return self->_sectionBodyProvider;
}

- (PXPhotosGlobalHeaderLayoutProvider)globalHeaderProvider
{
  return self->_globalHeaderProvider;
}

- (PXPhotosSectionHeaderLayoutProvider)sectionHeaderProvider
{
  return self->_sectionHeaderProvider;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotosLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosLayoutDelegate *)WeakRetained;
}

- (PXPhotosLayoutSpecManager)specManager
{
  return self->_specManager;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)stackLayout:(id)a3 shouldAlignSublayoutToVisibleBottomEdge:(id)a4
{
  footerLayout = self->_footerLayout;
  return footerLayout && footerLayout == a4;
}

- (BOOL)stackLayout:(id)a3 shouldAlignSublayoutToVisibleTopEdge:(id)a4
{
  topHeaderLayout = self->_topHeaderLayout;
  if (topHeaderLayout) {
    BOOL v5 = topHeaderLayout == a4;
  }
  else {
    BOOL v5 = 0;
  }
  return v5 && self->_topHeaderLayoutShouldFloat;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (a3)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXPhotosLayout.m" lineNumber:2208 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = v7;
  v9 = [(PXPhotosLayout *)self specManager];
  v10 = [v9 spec];
  v11 = [v10 contentBackgroundColor];

  return v11;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if ([(PXPhotosLayout *)self _titleBackgroundSpriteIndex] != a3)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = v17;
    SEL v19 = a2;
    v20 = self;
    uint64_t v21 = 2198;
    goto LABEL_14;
  }
  v8 = [(PXPhotosLayout *)self viewModel];
  unint64_t v9 = [v8 navBarStyle];

  if (v9 <= 8)
  {
    if (((1 << v9) & 0x60) != 0)
    {
      v12 = [(PXPhotosLayout *)self specManager];
      v13 = [v12 spec];
      v14 = [v13 visualEffectViewGroupName];
      goto LABEL_7;
    }
    if (((1 << v9) & 0x84) != 0)
    {
      v10 = [(PXPhotosLayout *)self specManager];
      v11 = [v10 spec];
      v12 = [v11 backgroundGradientImageConfiguration];

      v13 = [v12 imageName];
      v14 = [[PXTitleLegibilityDimmingViewConfiguration alloc] initWithGradientImageName:v13];
LABEL_7:
      v15 = v14;

      goto LABEL_9;
    }
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = v17;
    SEL v19 = a2;
    v20 = self;
    uint64_t v21 = 2182;
LABEL_14:
    [v17 handleFailureInMethod:v19 object:v20 file:@"PXPhotosLayout.m" lineNumber:v21 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v15 = 0;
LABEL_9:

  return v15;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if ([(PXPhotosLayout *)self _titleBackgroundSpriteIndex] != a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = v11;
    SEL v13 = a2;
    v14 = self;
    uint64_t v15 = 2169;
    goto LABEL_11;
  }
  v8 = [(PXPhotosLayout *)self viewModel];
  unint64_t v9 = [v8 navBarStyle];

  if (v9 > 8) {
    goto LABEL_6;
  }
  if (((1 << v9) & 0x60) == 0 && ((1 << v9) & 0x84) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = v11;
    SEL v13 = a2;
    v14 = self;
    uint64_t v15 = 2156;
LABEL_11:
    [v11 handleFailureInMethod:v13 object:v14 file:@"PXPhotosLayout.m" lineNumber:v15 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  objc_opt_class();
  self = (PXPhotosLayout *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (Class)self;
}

- (id)axSpriteIndexes
{
  if (self->_managesHeaderSprites && [(PXGLayout *)self localNumberOfSprites])
  {
    v2 = [MEMORY[0x1E4F28D60] indexSetWithIndex:3];
  }
  else
  {
    v2 = [MEMORY[0x1E4F28D60] indexSet];
  }
  return v2;
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if ([(PXPhotosLayout *)self _titleBackgroundSpriteIndex] == a3)
  {
    v8 = [(PXPhotosLayout *)self specManager];
    unint64_t v9 = [v8 spec];
    uint64_t v10 = [v9 backgroundGradientImageConfiguration];
  }
  else
  {
    if (a3 != 2)
    {
      SEL v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PXPhotosLayout.m" lineNumber:2130 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v8 = [(PXPhotosLayout *)self specManager];
    unint64_t v9 = [v8 spec];
    uint64_t v10 = [v9 behindContentBackgroundGradientImageConfiguration];
  }
  v11 = (void *)v10;

  return v11;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  v8 = [(PXPhotosLayout *)self headerTitle];
  uint64_t v9 = [(PXPhotosLayout *)self headerSubtitle];
  uint64_t v10 = (void *)v9;
  v11 = 0;
  if (v8 && v9)
  {
    if (a3 == 3)
    {
      v12 = [(PXPhotosLayout *)self headerTitleOverContentAttributes];
      uint64_t v13 = [(PXPhotosLayout *)self headerSubtitleOverContentAttributes];
    }
    else
    {
      if (a3 != 4)
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2 object:self file:@"PXPhotosLayout.m" lineNumber:2112 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      v12 = [(PXPhotosLayout *)self headerTitleOverBackgroundAttributes];
      uint64_t v13 = [(PXPhotosLayout *)self headerSubtitleOverBackgroundAttributes];
    }
    v14 = (void *)v13;
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8 attributes:v12];
    id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
    v16 = [(PXPhotosLayout *)self headerSubtitle];
    v17 = [@"\n" stringByAppendingString:v16];
    v18 = (void *)[v15 initWithString:v17 attributes:v14];

    [v11 appendAttributedString:v18];
  }

  return v11;
}

- (UIEdgeInsets)paddingForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  double v4 = 6.0;
  double v5 = 0.0;
  double v6 = 6.0;
  double v7 = 0.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 2;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (a3 == 4)
  {
    uint64_t v8 = [(PXPhotosLayout *)self headerTitleOverBackgroundAttributes];
  }
  else
  {
    if (a3 != 3)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXPhotosLayout.m" lineNumber:2080 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v8 = [(PXPhotosLayout *)self headerTitleOverContentAttributes];
  }
  uint64_t v9 = (void *)v8;

  return v9;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (a3 - 3 > 1)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXPhotosLayout.m" lineNumber:2070 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  uint64_t v8 = v7;
  uint64_t v9 = [(PXPhotosLayout *)self headerTitle];
  uint64_t v10 = v9;
  if (!v9) {
    uint64_t v9 = &stru_1F00B0030;
  }
  v11 = v9;

  return v11;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  uint64_t v10 = v9;
  if ((void *)ViewModelObservationContext_206403 == a5)
  {
    if (a4)
    {
      v11 = [(PXPhotosLayout *)self viewModel];
      int v12 = [v11 wantsDynamicTitles];

      if (v12) {
        [(PXPhotosLayout *)self _invalidateDynamicHeaderTitle];
      }
      else {
        [(PXPhotosLayout *)self _performPreUpdateInvalidationDeferredIfNeeded:&__block_literal_global_377_206404];
      }
      if (self->_headerProviderRespondsTo.topHeaderLayoutDidChangeDataSource && self->_topHeaderLayout) {
        [(PXPhotosLayout *)self _performPreUpdateInvalidationDeferredIfNeeded:&__block_literal_global_379_206405];
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __47__PXPhotosLayout_observable_didChange_context___block_invoke_3;
      v26[3] = &unk_1E5DC4DB8;
      v26[4] = self;
      [(PXPhotosLayout *)self _performPreUpdateInvalidationDeferredIfNeeded:v26];
      if ((a4 & 0x4000) == 0)
      {
LABEL_12:
        if ((a4 & 4) == 0) {
          goto LABEL_13;
        }
        goto LABEL_48;
      }
    }
    else if ((a4 & 0x4000) == 0)
    {
      goto LABEL_12;
    }
    [(PXPhotosLayout *)self _invalidateSectionedLayout];
    if ((a4 & 4) == 0)
    {
LABEL_13:
      if ((a4 & 0x100000000) == 0) {
        goto LABEL_14;
      }
      goto LABEL_49;
    }
LABEL_48:
    [(PXPhotosLayout *)self _invalidateTopHeaderLayout];
    if ((a4 & 0x100000000) == 0)
    {
LABEL_14:
      if ((a4 & 0x800000000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_50;
    }
LABEL_49:
    [(PXGStackLayout *)self invalidateAdditionalSafeAreaInsets];
    [(PXPhotosLayout *)self _invalidateLocalSprites];
    [(PXPhotosLayout *)self _invalidateLocalSpritesAlpha];
    if ((a4 & 0x800000000) == 0)
    {
LABEL_15:
      if ((a4 & 0x40) == 0) {
        goto LABEL_16;
      }
      goto LABEL_51;
    }
LABEL_50:
    [(PXPhotosLayout *)self _invalidateLocalSpritesAlpha];
    if ((a4 & 0x40) == 0)
    {
LABEL_16:
      if ((a4 & 0x20000000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_51:
    [(PXPhotosLayout *)self clearLastVisibleAreaAnchoringInformation];
    if ((a4 & 0x20000000) == 0)
    {
LABEL_18:
      if ((a4 & 0x80002000) != 0) {
        [(PXPhotosLayout *)self _invalidateLocalSpritesAlpha];
      }
      if ((a4 & 0x1001000) != 0) {
        [(PXPhotosLayout *)self _invalidateLocalSprites];
      }
      if ((a4 & 0x400000000) != 0)
      {
        uint64_t v13 = [(PXGLayout *)self createFenceWithType:3];
        [v13 setTimeout:0.5];

        [(PXPhotosLayout *)self _invalidateFooter];
        [(PXPhotosLayout *)self _invalidateSectionedLayout];
        if ((a4 & 0x100000000000) == 0)
        {
LABEL_24:
          if ((a4 & 0x20000000000000) == 0) {
            goto LABEL_25;
          }
          goto LABEL_34;
        }
      }
      else if ((a4 & 0x100000000000) == 0)
      {
        goto LABEL_24;
      }
      [(PXPhotosLayout *)self _invalidateFooter];
      [(PXPhotosLayout *)self _invalidateSectionedLayout];
      [(PXPhotosLayout *)self _invalidateScrollDetentAnchor];
      [(PXPhotosLayout *)self _invalidateContentBelowTitle];
      if ((a4 & 0x20000000000000) == 0)
      {
LABEL_25:
        if ((a4 & 0x40000000000000) == 0) {
          goto LABEL_26;
        }
        goto LABEL_35;
      }
LABEL_34:
      [(PXPhotosLayout *)self _invalidateLocalSpritesAlpha];
      if ((a4 & 0x40000000000000) == 0)
      {
LABEL_26:
        if ((a4 & 0x400000000000) == 0) {
          goto LABEL_62;
        }
        goto LABEL_36;
      }
LABEL_35:
      [(PXPhotosLayout *)self _invalidateLocalSprites];
      if ((a4 & 0x400000000000) == 0) {
        goto LABEL_62;
      }
LABEL_36:
      [(PXPhotosLayout *)self _invalidateHeaderMeasurements];
      goto LABEL_62;
    }
LABEL_17:
    [(PXPhotosLayout *)self _updateHeaderFooterAlphaAnimator];
    goto LABEL_18;
  }
  if ((void *)SpecManagerObservationContext_206406 == a5)
  {
    if (a4)
    {
      [(PXPhotosLayout *)self _invalidateHeaderAttributes];
      [(PXPhotosLayout *)self _invalidateHeaderMeasurements];
      [(PXPhotosLayout *)self _invalidateTopHeaderLayout];
      [(PXPhotosLayout *)self _invalidateGlobalHeaderLayout];
      [(PXPhotosLayout *)self _invalidateSectionedLayout];
      [(PXPhotosLayout *)self _invalidateSectionedLayoutPlacementOverrides];
      [(PXPhotosLayout *)self _invalidateGlobalBackground];
      [(PXPhotosLayout *)self _invalidateLocalSprites];
    }
    goto LABEL_62;
  }
  if ((void *)AlternateAppearanceMixAnimatorObservationContext_206407 == a5)
  {
    if ((a4 & 2) == 0) {
      goto LABEL_62;
    }
    id v14 = v9;
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_40;
      }
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v18 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v18);
      SEL v19 = objc_msgSend(v14, "px_descriptionForAssertionMessage");
      [v15 handleFailureInMethod:a2, self, @"PXPhotosLayout.m", 2033, @"%@ should be an instance inheriting from %@, but it is %@", @"observable", v17, v19 object file lineNumber description];
    }
    else
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      [v15 handleFailureInMethod:a2, self, @"PXPhotosLayout.m", 2033, @"%@ should be an instance inheriting from %@, but it is nil", @"observable", v17 object file lineNumber description];
    }

LABEL_40:
    if (([v14 isBeingMutated] & 1) == 0) {
      [(PXPhotosLayout *)self _invalidateLocalSpritesAlpha];
    }
    goto LABEL_58;
  }
  if ((void *)HeaderFooterAlphaAnimatorObservationContext == a5)
  {
    if ((a4 & 2) == 0) {
      goto LABEL_62;
    }
    id v14 = v9;
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_56;
      }
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v23);
      v24 = objc_msgSend(v14, "px_descriptionForAssertionMessage");
      [v20 handleFailureInMethod:a2, self, @"PXPhotosLayout.m", 2040, @"%@ should be an instance inheriting from %@, but it is %@", @"observable", v22, v24 object file lineNumber description];
    }
    else
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      [v20 handleFailureInMethod:a2, self, @"PXPhotosLayout.m", 2040, @"%@ should be an instance inheriting from %@, but it is nil", @"observable", v22 object file lineNumber description];
    }

LABEL_56:
    if (([v14 isBeingMutated] & 1) == 0)
    {
      [(PXPhotosLayout *)self _invalidateLocalSpritesAlpha];
      [(PXPhotosLayout *)self _invalidateHeaderAnimated:0];
      [(PXPhotosLayout *)self _invalidateFooter];
    }
LABEL_58:

    goto LABEL_62;
  }
  if ((void *)HeaderCustomizationModelObservationContext != a5)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"PXPhotosLayout.m" lineNumber:2060 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (a4)
  {
    [(PXGStackLayout *)self invalidateAdditionalSafeAreaInsets];
    [(PXPhotosLayout *)self _invalidateHeaderOrigin];
    if ((a4 & 2) == 0)
    {
LABEL_8:
      if ((a4 & 4) == 0) {
        goto LABEL_62;
      }
      goto LABEL_61;
    }
  }
  else if ((a4 & 2) == 0)
  {
    goto LABEL_8;
  }
  [(PXPhotosLayout *)self _invalidateLocalSprites];
  if ((a4 & 4) != 0)
  {
LABEL_61:
    [(PXPhotosLayout *)self _invalidateHeaderAnimated:0];
    [(PXPhotosLayout *)self _invalidateLocalSpritesAlpha];
  }
LABEL_62:
}

uint64_t __47__PXPhotosLayout_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateScrollDetentAnchor];
}

uint64_t __47__PXPhotosLayout_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _informTopHeaderLayoutAboutDataSourceChange];
}

uint64_t __47__PXPhotosLayout_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _invalidateHeaderTitle];
}

- (void)_performPreUpdateInvalidationDeferredIfNeeded:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_isUpdatingSublayouts)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PXPhotosLayout__performPreUpdateInvalidationDeferredIfNeeded___block_invoke;
    block[3] = &unk_1E5DD1848;
    id v7 = v5;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v8);

    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, PXPhotosLayout *))v4 + 2))(v4, self);
  }
}

void __64__PXPhotosLayout__performPreUpdateInvalidationDeferredIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);
}

- (void)_informTopHeaderLayoutAboutDataSourceChange
{
  if (self->_headerProviderRespondsTo.topHeaderLayoutDidChangeDataSource && self->_topHeaderLayout)
  {
    id v6 = [(PXPhotosLayout *)self sectionHeaderProvider];
    topHeaderLayout = self->_topHeaderLayout;
    id v4 = [(PXPhotosLayout *)self viewModel];
    double v5 = [v4 currentDataSource];
    [v6 topHeaderLayout:topHeaderLayout didChangeDataSource:v5];
  }
}

- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXPhotosLayout *)self viewModel];
  id v9 = [v8 currentDataSource];
  uint64_t v10 = [v9 containerCollection];
  int v11 = [v7 isEqual:v10];

  if (!v11) {
    PXAssertGetLog();
  }
  if ([v6 hasGeometry]) {
    id v12 = v6;
  }
  else {
    id v12 = 0;
  }
  [(PXPhotosLayout *)self setPlacementOverride:v12];
  [(PXGLayout *)self setDetailedPlacementOverride:v6 forItemReference:v7];
}

- (id)placementInContext:(id)a3 forItemReference:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXPhotosLayout *)self viewModel];
  id v9 = [v8 currentDataSource];
  uint64_t v10 = [v9 containerCollection];
  int v11 = [v7 isEqual:v10];

  if (!v11) {
    PXAssertGetLog();
  }
  id v12 = [PXGItemPlacement alloc];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__PXPhotosLayout_placementInContext_forItemReference___block_invoke;
  v15[3] = &unk_1E5DC4D90;
  v15[4] = self;
  uint64_t v13 = [(PXGItemPlacement *)v12 initWithContext:v6 configuration:v15];

  return v13;
}

void __54__PXPhotosLayout_placementInContext_forItemReference___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v8 = a2;
  [v3 originalPlacementRect];
  objc_msgSend(v8, "setRect:velocity:inLayout:", *(void *)(a1 + 32));
  [v8 setAlpha:1.0];
  [v8 setChromeAlpha:1.0];
  LODWORD(v4) = *(_DWORD *)off_1E5DAAF50;
  LODWORD(v5) = *((_DWORD *)off_1E5DAAF50 + 1);
  LODWORD(v6) = *((_DWORD *)off_1E5DAAF50 + 2);
  LODWORD(v7) = *((_DWORD *)off_1E5DAAF50 + 3);
  objc_msgSend(v8, "setCornerRadius:", v4, v5, v6, v7);
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4 = a3;
  double v5 = [(PXPhotosLayout *)self viewModel];
  double v6 = [v5 currentDataSource];
  double v7 = [v6 containerCollection];
  int v8 = [v4 isEqual:v7];

  if (v8) {
    id v9 = self;
  }
  else {
    id v9 = [[PXGOtherItemPlacementController alloc] initWithOriginalItemPlacementController:self originalItemReference:v4];
  }
  uint64_t v10 = v9;

  return v10;
}

- (UIEdgeInsets)additionalSafeAreaInsetsForSublayout:(id)a3
{
  id v4 = (PXPhotosGlobalHeader *)a3;
  double v5 = [(PXPhotosLayout *)self headerCustomizationModel];
  [v5 verticalVisibilityOffset];
  double v7 = v6;

  int v8 = [(PXPhotosLayout *)self viewModel];
  [v8 floatingTitleOpacity];
  double v10 = v9;

  if (v10 == 1.0)
  {
    [(PXPhotosLayout *)self titleBackgroundSpriteHeight];
    double v7 = v7 + v11;
  }
  else if ([(PXPhotosLayout *)self wantsHeaderInSafeArea])
  {
    [(PXGLayout *)self safeAreaInsets];
    double v13 = v12;
    [(PXPhotosLayout *)self statusBarHeight];
    double v7 = v7 - (v13 - v14);
  }
  double v15 = *((double *)off_1E5DAAF10 + 1);
  double v16 = *((double *)off_1E5DAAF10 + 2);
  double v17 = *((double *)off_1E5DAAF10 + 3);
  topHeaderLayout = self->_topHeaderLayout;
  if (topHeaderLayout != v4)
  {
    if (topHeaderLayout) {
      BOOL v19 = self->_globalHeaderLayout == v4;
    }
    else {
      BOOL v19 = 1;
    }
    if (!v19 && self->_topHeaderLayoutShouldFloat)
    {
      [(PXPhotosSectionedLayoutHeader *)topHeaderLayout contentSize];
      double v7 = v7 + v20;
    }
  }

  double v21 = v7;
  double v22 = v15;
  double v23 = v16;
  double v24 = v17;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (void)adjustCopiedSprites:(id *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)PXPhotosLayout;
  long long v5 = *(_OWORD *)&a3->var2;
  v19[0] = *(_OWORD *)&a3->var0;
  v19[1] = v5;
  var4 = a3->var4;
  [(PXGLayout *)&v21 adjustCopiedSprites:v19];
  double v6 = [(PXPhotosLayout *)self placementOverride];
  double v7 = v6;
  if (v6)
  {
    [v6 alpha];
    uint64_t var0 = a3->var0;
    if (var0)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 40 * var0;
      double v12 = (char *)a3->var4 + 1;
      do
      {
        unsigned int v13 = v12[v10];
        BOOL v14 = v13 > 0xD;
        int v15 = (1 << v13) & 0x3DFB;
        if (!v14 && v15 != 0)
        {
          var3 = a3->var3;
          float v18 = v8 * *((float *)var3 + v10);
          *((float *)var3 + v10) = v18;
        }
        v10 += 40;
      }
      while (v11 != v10);
    }
  }
}

- (void)hideSpritesForObjectReferences:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosLayout;
  [(PXGLayout *)&v9 hideSpritesForObjectReferences:a3];
  int64_t v4 = [(PXPhotosLayout *)self pendingHideAnimationType];
  [(PXPhotosLayout *)self setPendingHideAnimationType:0];
  long long v5 = +[PXPhotosGridHideAssetAnimationHelper createDecorationAnimationsForLayout:self animationType:v4];
  if ([v5 count]) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    double v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Failed to create animations for hiding/unhiding assets", v8, 2u);
    }
  }
}

- (id)createDefaultAnimationForCurrentContext
{
  v3 = [(PXPhotosLayout *)self viewModel];
  if ([v3 isAppearing])
  {
    int64_t v4 = 0;
  }
  else
  {
    if ([v3 isEmbedded])
    {
      v12.receiver = self;
      v12.super_class = (Class)PXPhotosLayout;
      long long v5 = [(PXGLayout *)&v12 createDefaultAnimationForCurrentContext];
      BOOL v6 = +[PXPhotosGridSettings sharedInstance];
      [v6 defaultAnimationDuration];
      objc_msgSend(v5, "setDuration:");
    }
    else
    {
      BOOL v6 = [(PXPhotosLayout *)self animationProvider];
      double v7 = [(PXPhotosLayout *)self presentedLayoutState];
      double v8 = [(PXPhotosLayout *)self createCurrentLayoutState];
      long long v5 = [v6 createAnimationForLayout:self presentedLayoutState:v7 targetLayoutState:v8];
    }
    objc_super v9 = [(PXPhotosLayout *)self delegate];
    uint64_t v10 = v9;
    if (v5 && v9)
    {
      int64_t v4 = [v9 photosLayout:self animationForProposedAnimation:v5];
      if (v5 != v4)
      {
        [(PXGLayout *)self removeAnimation:v5];
        if (v4) {
          [(PXGLayout *)self addAnimation:v4];
        }
      }
    }
    else
    {
      int64_t v4 = v5;
    }
  }
  return v4;
}

- (unint64_t)fullyVisibleEdgesWithDefaultTolerance
{
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosLayout;
  [(PXGLayout *)&v3 safeAreaInsetsDidChange];
  [(PXPhotosLayout *)self _invalidateHeaderMeasurements];
  [(PXPhotosLayout *)self _invalidateContentBelowTitle];
  [(PXPhotosLayout *)self _invalidateLocalSprites];
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosLayout;
  [(PXGStackLayout *)&v3 displayScaleDidChange];
  [(PXPhotosLayout *)self _invalidateLocalSprites];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosLayout;
  [(PXGStackLayout *)&v3 referenceSizeDidChange];
  [(PXPhotosLayout *)self _invalidateHeaderMeasurements];
}

- (void)visibleRectDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)PXPhotosLayout;
  [(PXGStackLayout *)&v5 visibleRectDidChange];
  [(PXPhotosLayout *)self _invalidateContentBelowTitle];
  [(PXPhotosLayout *)self _invalidateLocalSprites];
  [(PXPhotosLayout *)self _invalidateHeaderOrigin];
  objc_super v3 = [(PXPhotosLayout *)self viewModel];
  int v4 = [v3 wantsDynamicTitles];

  if (v4) {
    [(PXPhotosLayout *)self _invalidateDynamicHeaderTitle];
  }
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  v26.receiver = self;
  v26.super_class = (Class)PXPhotosLayout;
  int v4 = [(PXGLayout *)&v26 hitTestResultForSpriteIndex:*(void *)&a3];
  objc_super v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:@"PXGHitTestUserDataIdentifierItem"];

  if (v6)
  {
    double v7 = [PXGHitTestResult alloc];
    double v8 = [v4 spriteReference];
    objc_super v9 = [v4 layout];
    uint64_t v10 = [v4 userData];
    uint64_t v11 = [(PXGHitTestResult *)v7 initWithSpriteReference:v8 layout:v9 identifier:@"PXPhotosLayoutHitTestIdentifierAsset" userData:v10];

    int v4 = (void *)v10;
  }
  else
  {
    objc_super v12 = [v4 identifier];
    int v13 = [v12 isEqualToString:@"PXGHitTestUserDataIdentifierAccessoryItem"];

    if (v13)
    {
      BOOL v14 = [PXGHitTestResult alloc];
      double v8 = [v4 spriteReference];
      objc_super v9 = [v4 layout];
      int v15 = @"PXPhotosLayoutHitTestIdentifierAccessoryCell";
      double v16 = v14;
      double v17 = v8;
      float v18 = v9;
      BOOL v19 = 0;
    }
    else
    {
      double v20 = [(PXPhotosLayout *)self overlayController];
      objc_super v21 = [v4 spriteReference];
      double v22 = [v21 objectReference];
      int v23 = [v20 canHandleObjectReference:v22];

      if (!v23) {
        goto LABEL_9;
      }
      double v24 = [PXGHitTestResult alloc];
      double v8 = [v4 spriteReference];
      objc_super v9 = [v4 layout];
      int v15 = @"PXPhotosLayoutHitTestIdentifierOverlayItem";
      double v16 = v24;
      double v17 = v8;
      float v18 = v9;
      BOOL v19 = v4;
    }
    uint64_t v11 = [(PXGHitTestResult *)v16 initWithSpriteReference:v17 layout:v18 identifier:v15 userData:v19];
  }

  int v4 = (void *)v11;
LABEL_9:
  return v4;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8 = a3;
  *a5 = v8;
  if ([(PXPhotosLayout *)self _shouldShowSectionedLayout])
  {
    if (!self->_sectionedLayout)
    {
      objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"PXPhotosLayout.m", 1718, @"missing _sectionedLayout in %@", self object file lineNumber description];
    }
    objc_super v9 = [(PXGLayout *)self sublayoutDataStore];
    int64_t v10 = [v9 indexOfSublayout:self->_sectionedLayout];
  }
  else
  {
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (void)_updateLocalSpritesAlpha
{
  if (self->_managesHeaderSprites || self->_managesOnlyLegibilityGradientSprites)
  {
    objc_super v3 = [(PXPhotosLayout *)self viewModel];
    int v4 = [(PXPhotosLayout *)self specManager];
    objc_super v5 = [v4 spec];

    int v6 = +[PXPhotosGridSettings sharedInstance];
    uint64_t v7 = [v3 navBarStyle];
    [v5 contentBackgroundOpacity];
    double v9 = v8;
    [v3 contentBackgroundOpacity];
    if (v9 >= v10) {
      double v11 = v9;
    }
    else {
      double v11 = v10;
    }
    unsigned int v12 = [(PXPhotosLayout *)self _titleBackgroundSpriteIndex];
    if ((unint64_t)(v7 - 5) > 1)
    {
      if (v7 != 7)
      {
        [v3 titleBackgroundOpacity];
        uint64_t v21 = v20;
        [(PXNumberAnimator *)self->_alternateAppearanceMixAnimator presentationValue];
        double v23 = v22;
        double v24 = 1.0 - v22;
        if ([v5 userInterfaceStyle] == 2) {
          double v25 = 1.0;
        }
        else {
          double v25 = v23;
        }
        uint64_t v26 = 0;
        if ([v5 userInterfaceStyle] == 2) {
          double v27 = 0.0;
        }
        else {
          double v27 = v24;
        }
        [v6 headerGradientAlpha];
        uint64_t v29 = v28;
        if (![(PXPhotosLayout *)self wantsHeaderInSafeArea])
        {
          v30 = [(PXPhotosLayout *)self viewModel];
          if ([v30 isInCompactMode])
          {
            [v6 behindContentBackgroundGradientAlpha];
            uint64_t v26 = v31;
          }
        }
        if ([v3 wantsFloatingTitle]) {
          [v3 floatingTitleOpacity];
        }
        else {
          [(PXNumberAnimator *)self->_headerFooterAlphaAnimator presentationValue];
        }
        double v33 = v32;
        v34 = [(PXPhotosLayout *)self headerCustomizationModel];
        v35 = v34;
        if (v34)
        {
          [v34 alpha];
          double v33 = v33 * v36;
        }
        uint64_t v37 = [(PXPhotosLayout *)self _expectedLocalSpriteCount];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __42__PXPhotosLayout__updateLocalSpritesAlpha__block_invoke_3;
        v38[3] = &__block_descriptor_100_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
        unsigned int v39 = v12;
        *(double *)&v38[4] = v11;
        v38[5] = v21;
        *(double *)&v38[6] = v23;
        v38[7] = v29;
        v38[8] = v26;
        *(double *)&v38[9] = v33;
        *(double *)&v38[10] = v25;
        *(double *)&v38[11] = v27;
        [(PXGLayout *)self modifySpritesInRange:v37 << 32 state:v38];

        goto LABEL_33;
      }
      if ([v3 isScrolledToTop]) {
        float v18 = 0.0;
      }
      else {
        float v18 = 0.65;
      }
      uint64_t v19 = [(PXPhotosLayout *)self _expectedLocalSpriteCount];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __42__PXPhotosLayout__updateLocalSpritesAlpha__block_invoke_2;
      v40[3] = &__block_descriptor_40_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
      uint64_t v16 = v19 << 32;
      unsigned int v41 = v12;
      float v42 = v18;
      double v17 = v40;
    }
    else
    {
      BOOL v13 = self->_topHeaderLayout == 0;
      if (([v3 isScrolledToTop] & v13) != 0) {
        float v14 = 0.0;
      }
      else {
        float v14 = 1.0;
      }
      uint64_t v15 = [(PXPhotosLayout *)self _expectedLocalSpriteCount];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __42__PXPhotosLayout__updateLocalSpritesAlpha__block_invoke;
      v43[3] = &__block_descriptor_48_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
      uint64_t v16 = v15 << 32;
      *(double *)&v43[4] = v11;
      unsigned int v44 = v12;
      float v45 = v14;
      double v17 = v43;
    }
    [(PXGLayout *)self modifySpritesInRange:v16 state:v17];
LABEL_33:
  }
}

float __42__PXPhotosLayout__updateLocalSpritesAlpha__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  float v4 = *(double *)(a1 + 32);
  *(float *)a4 = v4;
  float result = *(float *)(a1 + 44);
  *(float *)(a4 + 160 * *(unsigned int *)(a1 + 40)) = result;
  *(_DWORD *)(a4 + 320) = 0;
  *(_DWORD *)(a4 + 480) = 0;
  *(_DWORD *)(a4 + 640) = 1065353216;
  return result;
}

float __42__PXPhotosLayout__updateLocalSpritesAlpha__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  float result = *(float *)(a1 + 36);
  *(float *)(a4 + 160 * *(unsigned int *)(a1 + 32)) = result;
  return result;
}

float __42__PXPhotosLayout__updateLocalSpritesAlpha__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v4 = *(double *)(a1 + 40);
  float v5 = *(double *)(a1 + 32);
  *(float *)a4 = v5;
  double v6 = v4 * *(double *)(a1 + 48);
  *(float *)&double v4 = v6 * *(double *)(a1 + 56);
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(a1 + 96)) = LODWORD(v4);
  double v7 = *(double *)(a1 + 72);
  *(float *)&double v6 = v6 * *(double *)(a1 + 64);
  *(_DWORD *)(a4 + 320) = LODWORD(v6);
  double v8 = *(double *)(a1 + 88);
  *(float *)&double v6 = v7 * *(double *)(a1 + 80);
  *(_DWORD *)(a4 + 480) = LODWORD(v6);
  float result = v7 * v8;
  *(float *)(a4 + 640) = result;
  return result;
}

- (void)_invalidateLocalSpritesAlpha
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x1000000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x1000000) != 0)
    {
      float v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateLocalSpritesAlpha]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosLayout.m", 1654, @"invalidating %lu after it already has been updated", 0x1000000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 0x1000000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateLocalSprites
{
  if (self->_managesHeaderSprites || self->_managesOnlyLegibilityGradientSprites)
  {
    objc_super v3 = [(PXPhotosLayout *)self viewModel];
    double v4 = [(PXPhotosLayout *)self specManager];
    float v5 = [v4 spec];

    double v6 = [(PXPhotosLayout *)self headerCustomizationModel];
    [(PXPhotosLayout *)self headerTitleOrigin];
    [(PXGLayout *)self displayScale];
    [(PXGLayout *)self referenceSize];
    [(PXPhotosLayout *)self headerTitleSize];
    [(PXGLayout *)self visibleRect];
    double v8 = v7;
    [v6 verticalVisibilityOffset];
    if (([v3 wantsFloatingTitle] & 1) == 0) {
      [(PXGLayout *)self safeAreaInsets];
    }
    [v5 isTV];
    [v6 verticalFloatingOffset];
    [(PXGLayout *)self safeAreaInsets];
    [(PXPhotosLayout *)self titleBackgroundSpriteHeight];
    [(PXPhotosLayout *)self titleBackgroundGradientAdditionalCoverage];
    [(PXGLayout *)self visibleRect];
    [(PXGLayout *)self contentSize];
    PXRectWithOriginAndSize();
  }
}

__n128 __37__PXPhotosLayout__updateLocalSprites__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v4 = *(_OWORD *)(a3 + 64);
  long long v6 = *(_OWORD *)(a3 + 16);
  long long v5 = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v3 + 96) = v4;
  *(_OWORD *)(v3 + 48) = v6;
  *(_OWORD *)(v3 + 64) = v5;
  long long v8 = *(_OWORD *)(a3 + 96);
  long long v7 = *(_OWORD *)(a3 + 112);
  long long v9 = *(_OWORD *)(a3 + 80);
  *(void *)(v3 + 160) = *(void *)(a3 + 128);
  *(_OWORD *)(v3 + 128) = v8;
  *(_OWORD *)(v3 + 144) = v7;
  *(_OWORD *)(v3 + 112) = v9;
  __n128 result = *(__n128 *)a3;
  *(_OWORD *)(v3 + 32) = *(_OWORD *)a3;
  return result;
}

void __37__PXPhotosLayout__updateLocalSprites__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v9 = 0;
  char v10 = 0;
  switch([*(id *)(a1 + 32) navBarStyle])
  {
    case 0:
    case 8:
      v64 = [MEMORY[0x1E4F28B00] currentHandler];
      [v64 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 40) file:@"PXPhotosLayout.m" lineNumber:1562 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
    case 3:
      char v10 = 0;
      char v9 = 1;
      break;
    case 2:
    case 7:
      char v9 = 1;
      char v10 = 1;
      break;
    case 5:
    case 6:
      char v10 = 1;
      char v9 = 10;
      break;
    default:
      break;
  }
  double v11 = *(unsigned char **)(a1 + 40);
  if (v11[1152])
  {
    CGFloat v12 = *(double *)(a1 + 64);
    CGFloat v13 = *(double *)(a1 + 72);
    CGFloat v14 = *(double *)(a1 + 80);
    CGFloat v15 = *(double *)(a1 + 88);
    v70.origin.double x = v12;
    v70.origin.double y = v13;
    v70.size.double width = v14;
    v70.size.double height = v15;
    CGFloat MidX = CGRectGetMidX(v70);
    v71.origin.double x = v12;
    v71.origin.double y = v13;
    v71.size.double width = v14;
    v71.size.double height = v15;
    CGFloat MidY = CGRectGetMidY(v71);
    v72.origin.double x = v12;
    v72.origin.double y = v13;
    v72.size.double width = v14;
    v72.size.double height = v15;
    CGFloat Width = CGRectGetWidth(v72);
    v73.origin.double x = v12;
    v73.origin.double y = v13;
    v73.size.double width = v14;
    v73.size.double height = v15;
    CGFloat Height = CGRectGetHeight(v73);
    v19.f64[0] = Width;
    v19.f64[1] = Height;
    *(CGFloat *)a3 = MidX;
    *(CGFloat *)(a3 + 8) = MidY;
    *(void *)(a3 + 16) = 0x4059000000000000;
    *(float32x2_t *)(a3 + 24) = vcvt_f32_f64(v19);
    *(unsigned char *)(a5 + 1) = 5;
    __asm { FMOV            V0.2S, #1.0 }
    *(void *)(a5 + 8) = _D0;
    *(_WORD *)(a5 + 32) = *(_WORD *)(*(void *)(a1 + 40) + 1140);
    double v11 = *(unsigned char **)(a1 + 40);
    if (v11[1152]) {
      goto LABEL_8;
    }
  }
  if (v11[1153])
  {
LABEL_8:
    char v69 = v10;
    unsigned int v25 = [v11 _titleBackgroundSpriteIndex];
    uint64_t v26 = (float32x2_t *)(a3 + 32 * v25);
    CGFloat v27 = *(double *)(a1 + 96);
    CGFloat v28 = *(double *)(a1 + 104);
    CGFloat v29 = *(double *)(a1 + 112);
    CGFloat v30 = *(double *)(a1 + 120);
    v74.origin.double x = v27;
    v74.origin.double y = v28;
    v74.size.double width = v29;
    v74.size.double height = v30;
    CGFloat v31 = CGRectGetMidX(v74);
    v75.origin.double x = v27;
    v75.origin.double y = v28;
    v75.size.double width = v29;
    v75.size.double height = v30;
    CGFloat v32 = CGRectGetMidY(v75);
    v76.origin.double x = v27;
    v76.origin.double y = v28;
    v76.size.double width = v29;
    v76.size.double height = v30;
    CGFloat v65 = CGRectGetWidth(v76);
    v77.origin.double x = v27;
    v77.origin.double y = v28;
    v77.size.double width = v29;
    v77.size.double height = v30;
    CGFloat v33 = CGRectGetHeight(v77);
    v34.f64[0] = v65;
    v34.f64[1] = v33;
    *(CGFloat *)uint64_t v26 = v31;
    *(CGFloat *)&v26[1] = v32;
    v26[2] = (float32x2_t)0xBFF0000000000000;
    v26[3] = vcvt_f32_f64(v34);
    uint64_t v35 = a4 + 160 * v25;
    *(_WORD *)(v35 + 68) = *(_WORD *)(*(void *)(a1 + 40) + 1142);
    [*(id *)(a1 + 48) backgroundGradientCornerRadius];
    *(float *)&CGFloat v27 = v36;
    [*(id *)(a1 + 48) backgroundGradientCornerRadius];
    *(float *)&double v37 = v37;
    *(_DWORD *)(v35 + 36) = LODWORD(v27);
    *(_DWORD *)(v35 + 40) = LODWORD(v37);
    *(_DWORD *)(v35 + 44) = 0;
    *(_DWORD *)(v35 + 48) = 0;
    v38 = (float32x2_t *)(a5 + 40 * v25);
    v38->i8[1] = v9;
    v38[1] = vmul_n_f32(v26[3], *(float *)(a1 + 160));
    v38->i8[0] = v69;
    if (*(unsigned char *)(*(void *)(a1 + 40) + 1152))
    {
      CGFloat v39 = *(double *)(a1 + 96);
      CGFloat v40 = *(double *)(a1 + 104);
      CGFloat v41 = *(double *)(a1 + 112);
      CGFloat v42 = *(double *)(a1 + 120);
      v78.origin.double x = v39;
      v78.origin.double y = v40;
      v78.size.double width = v41;
      v78.size.double height = v42;
      CGFloat v43 = CGRectGetMidX(v78);
      v79.origin.double x = v39;
      v79.origin.double y = v40;
      v79.size.double width = v41;
      v79.size.double height = v42;
      CGFloat v44 = CGRectGetMidY(v79);
      v80.origin.double x = v39;
      v80.origin.double y = v40;
      v80.size.double width = v41;
      v80.size.double height = v42;
      CGFloat v66 = CGRectGetWidth(v80);
      v81.origin.double x = v39;
      v81.origin.double y = v40;
      v81.size.double width = v41;
      v81.size.double height = v42;
      CGFloat v45 = CGRectGetHeight(v81);
      v46.f64[0] = v66;
      v46.f64[1] = v45;
      *(CGFloat *)(a3 + 64) = v43;
      *(CGFloat *)(a3 + 72) = v44;
      *(void *)(a3 + 80) = 0x4069000000000000;
      *(float32x2_t *)(a3 + 88) = vcvt_f32_f64(v46);
      *(_WORD *)(a4 + 388) = *(_WORD *)(*(void *)(a1 + 40) + 1142);
      [*(id *)(a1 + 48) backgroundGradientCornerRadius];
      *(float *)&CGFloat v39 = v47;
      [*(id *)(a1 + 48) backgroundGradientCornerRadius];
      *(float *)&double v48 = v48;
      *(_DWORD *)(a4 + 356) = LODWORD(v39);
      *(_DWORD *)(a4 + 360) = LODWORD(v48);
      *(void *)(a4 + 364) = 0;
      *(unsigned char *)(a5 + 81) = 1;
      *(float32x2_t *)(a5 + 88) = vmul_n_f32(*(float32x2_t *)(a3 + 88), *(float *)(a1 + 160));
      *(unsigned char *)(a5 + 80) = 0;
      if (*(unsigned char *)(*(void *)(a1 + 40) + 1152))
      {
        CGFloat v49 = *(double *)(a1 + 128);
        CGFloat v50 = *(double *)(a1 + 136);
        CGFloat v51 = *(double *)(a1 + 144);
        CGFloat v52 = *(double *)(a1 + 152);
        v82.origin.double x = v49;
        v82.origin.double y = v50;
        v82.size.double width = v51;
        v82.size.double height = v52;
        CGFloat v53 = CGRectGetMidX(v82);
        v83.origin.double x = v49;
        v83.origin.double y = v50;
        v83.size.double width = v51;
        v83.size.double height = v52;
        CGFloat v54 = CGRectGetMidY(v83);
        v84.origin.double x = v49;
        v84.origin.double y = v50;
        v84.size.double width = v51;
        v84.size.double height = v52;
        CGFloat v67 = CGRectGetWidth(v84);
        v85.origin.double x = v49;
        v85.origin.double y = v50;
        v85.size.double width = v51;
        v85.size.double height = v52;
        CGFloat v55 = CGRectGetHeight(v85);
        v56.f64[0] = v67;
        v56.f64[1] = v55;
        *(CGFloat *)(a3 + 96) = v53;
        *(CGFloat *)(a3 + 104) = v54;
        *(void *)(a3 + 112) = 0xBFF19999A0000000;
        *(float32x2_t *)(a3 + 120) = vcvt_f32_f64(v56);
        *(unsigned char *)(a4 + 550) = 10;
        *(unsigned char *)(a5 + 121) = 3;
        *(float32x2_t *)(a5 + 128) = vmul_n_f32(*(float32x2_t *)(a3 + 120), *(float *)(a1 + 160));
        *(_WORD *)(a5 + 152) = *(_WORD *)(*(void *)(a1 + 40) + 1138);
        *(unsigned char *)(a5 + 120) = v69;
        long long v57 = *(_OWORD *)(a3 + 112);
        *(_OWORD *)(a3 + 128) = *(_OWORD *)(a3 + 96);
        *(_OWORD *)(a3 + 144) = v57;
        long long v58 = *(_OWORD *)(a4 + 560);
        *(_OWORD *)(a4 + 704) = *(_OWORD *)(a4 + 544);
        *(_OWORD *)(a4 + 720) = v58;
        long long v59 = *(_OWORD *)(a4 + 528);
        *(_OWORD *)(a4 + 672) = *(_OWORD *)(a4 + 512);
        *(_OWORD *)(a4 + 688) = v59;
        long long v60 = *(_OWORD *)(a4 + 624);
        *(_OWORD *)(a4 + 768) = *(_OWORD *)(a4 + 608);
        *(_OWORD *)(a4 + 784) = v60;
        long long v61 = *(_OWORD *)(a4 + 592);
        *(_OWORD *)(a4 + 736) = *(_OWORD *)(a4 + 576);
        *(_OWORD *)(a4 + 752) = v61;
        long long v62 = *(_OWORD *)(a4 + 496);
        *(_OWORD *)(a4 + 640) = *(_OWORD *)(a4 + 480);
        *(_OWORD *)(a4 + 656) = v62;
        long long v63 = *(_OWORD *)(a5 + 136);
        *(_OWORD *)(a5 + 160) = *(_OWORD *)(a5 + 120);
        *(_OWORD *)(a5 + 176) = v63;
        *(void *)(a5 + 192) = *(void *)(a5 + 152);
      }
    }
  }
}

uint64_t __37__PXPhotosLayout__updateLocalSprites__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

uint64_t __37__PXPhotosLayout__updateLocalSprites__block_invoke_4(uint64_t result)
{
  BOOL v1 = *(double *)(result + 40) > 0.0 && *(_DWORD *)(result + 48) != 0;
  *(unsigned char *)(*(void *)(result + 32) + 1154) = v1;
  return result;
}

- (void)_invalidateLocalSprites
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x800000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x800000) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateLocalSprites]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosLayout.m", 1503, @"invalidating %lu after it already has been updated", 0x800000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 0x800000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_invalidateGlobalBackground
{
}

- (void)_updateContentBelowTitle
{
  uint64_t v3 = [(PXPhotosLayout *)self viewModel];
  long long v4 = [v3 currentLens];
  int v5 = [v4 ignoresTopSafeAreaInset];

  [(PXPhotosLayout *)self headerTitleBaselineToBottom];
  double v7 = v6;
  [(PXGLayout *)self visibleRect];
  double v9 = v8;
  [(PXGLayout *)self safeAreaInsets];
  if (v5) {
    BOOL v11 = v7 + v9 + v10 * 2.0 <= 0.0;
  }
  else {
    BOOL v11 = v9 + v10 <= v7;
  }
  int v12 = !v11;
  CGFloat v13 = [(PXPhotosLayout *)self viewModel];
  if (v12 != [v13 isContentBelowTitle])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__PXPhotosLayout__updateContentBelowTitle__block_invoke;
    v14[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
    char v15 = v12;
    [v13 performChanges:v14];
  }
}

uint64_t __42__PXPhotosLayout__updateContentBelowTitle__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentBelowTitle:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_invalidateContentBelowTitle
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x200000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x200000) != 0)
    {
      int v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateContentBelowTitle]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosLayout.m", 1478, @"invalidating %lu after it already has been updated", 0x200000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 0x200000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateScrollDetentAnchor
{
  uint64_t v3 = [(PXPhotosLayout *)self viewModel];
  long long v4 = [v3 lastPreferredScrollDetent];

  if (v4)
  {
    [(PXPhotosLayout *)self viewModel];
    [(id)objc_claimAutoreleasedReturnValue() lastPreferredScrollDetent];
    [(id)objc_claimAutoreleasedReturnValue() offset];
    PXEdgeInsetsMake();
  }
}

- (void)_invalidateScrollDetentAnchor
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x800;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x800) != 0)
    {
      int v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateScrollDetentAnchor]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosLayout.m", 1463, @"invalidating %lu after it already has been updated", 2048);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2048;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateLocalSpritesCount
{
  if (self->_managesHeaderSprites || self->_managesOnlyLegibilityGradientSprites)
  {
    unsigned int v3 = [(PXGLayout *)self localNumberOfSprites];
    if (v3 != [(PXPhotosLayout *)self _expectedLocalSpriteCount])
    {
      uint64_t v4 = [(PXPhotosLayout *)self _expectedLocalSpriteCount];
      [(PXGLayout *)self applySpriteChangeDetails:0 countAfterChanges:v4 initialState:&__block_literal_global_345 modifyState:0];
    }
  }
}

void __42__PXPhotosLayout__updateLocalSpritesCount__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (HIDWORD(a2) + a2);
  if (v3 > a2)
  {
    uint64_t v4 = v3 - a2;
    long long v5 = *((_OWORD *)off_1E5DAAF90 + 6);
    long long v6 = *((_OWORD *)off_1E5DAAF90 + 7);
    uint64_t v7 = 160 * a2;
    long long v8 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v9 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v10 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v11 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v12 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v13 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v14 = *(_OWORD *)off_1E5DAAF90;
    long long v15 = *((_OWORD *)off_1E5DAAF90 + 1);
    do
    {
      uint64_t v16 = (_OWORD *)(*(void *)(a3 + 24) + v7);
      v16[6] = v5;
      v16[7] = v6;
      v16[8] = v8;
      v16[9] = v9;
      v16[2] = v10;
      v16[3] = v11;
      v16[4] = v12;
      v16[5] = v13;
      _OWORD *v16 = v14;
      v16[1] = v15;
      v7 += 160;
      --v4;
    }
    while (v4);
  }
}

- (void)_invalidateLocalSpritesCount
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x400;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x400) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateLocalSpritesCount]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosLayout.m", 1445, @"invalidating %lu after it already has been updated", 1024);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1024;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateSectionedLayoutPlacementOverrides
{
  if (self->_sectionedLayout)
  {
    long long v18 = *((_OWORD *)off_1E5DAAF78 + 1);
    long long v24 = *(_OWORD *)off_1E5DAAF78;
    long long v25 = v18;
    long long v26 = *((_OWORD *)off_1E5DAAF78 + 2);
    uint64_t v4 = *((void *)off_1E5DAAF78 + 6);
    long long v5 = [(PXPhotosLayout *)self placementOverride];
    long long v6 = v5;
    if (v5)
    {
      if (([v5 hasGeometry] & 1) == 0)
      {
        double v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2, self, @"PXPhotosLayout.m", 1414, @"Invalid parameter not satisfying: %@", @"placementOverride.hasGeometry" object file lineNumber description];
      }
      [(PXPhotosLayout *)self originalPlacementRect];
      [v6 rectInLayout:self velocity:0];
      PXRectGetCenter();
    }
    int v7 = *(_DWORD *)off_1E5DAAF50;
    int v8 = *((_DWORD *)off_1E5DAAF50 + 1);
    int v9 = *((_DWORD *)off_1E5DAAF50 + 2);
    int v10 = *((_DWORD *)off_1E5DAAF50 + 3);
    -[PXPhotosSectionedLayout setMaskRect:](self->_sectionedLayout, "setMaskRect:", *MEMORY[0x1E4F1DB10], *(double *)(MEMORY[0x1E4F1DB10] + 8), *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
    LODWORD(v11) = v7;
    LODWORD(v12) = v8;
    LODWORD(v13) = v9;
    LODWORD(v14) = v10;
    -[PXPhotosSectionedLayout setMaskCornerRadius:](self->_sectionedLayout, "setMaskCornerRadius:", v11, v12, v13, v14);
    [(PXPhotosSectionedLayout *)self->_sectionedLayout setPlacementOverride:0];
    int64_t v15 = [(PXGLayout *)self indexOfSublayout:self->_sectionedLayout];
    uint64_t v16 = [(PXGLayout *)self sublayoutDataStore];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    _OWORD v19[2] = __58__PXPhotosLayout__updateSectionedLayoutPlacementOverrides__block_invoke;
    v19[3] = &__block_descriptor_88_e93_v40__0q8_____CGSize_dd_dS_CGSize_dd____ddd_____CGAffineTransform_dddddd_d_d_16_____v_v_24_B32l;
    long long v20 = v24;
    long long v21 = v25;
    long long v22 = v26;
    uint64_t v23 = v4;
    objc_msgSend(v16, "enumerateSublayoutGeometriesInRange:options:usingBlock:", v15, 1, 0, v19);
  }
}

__n128 __58__PXPhotosLayout__updateSectionedLayoutPlacementOverrides__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 result = *(__n128 *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(void *)(a3 + 120) = *(void *)(a1 + 80);
  *(_OWORD *)(a3 + 104) = v5;
  *(_OWORD *)(a3 + 88) = v4;
  *(__n128 *)(a3 + 72) = result;
  return result;
}

- (void)_invalidateSectionedLayoutPlacementOverrides
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x40;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateSectionedLayoutPlacementOverrides]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosLayout.m", 1400, @"invalidating %lu after it already has been updated", 64);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 64;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateSectionedLayout
{
  BOOL v3 = [(PXPhotosLayout *)self _shouldShowSectionedLayout];
  sectionedLayout = self->_sectionedLayout;
  if (v3)
  {
    if (sectionedLayout) {
      goto LABEL_13;
    }
    long long v5 = [PXPhotosSectionedLayout alloc];
    long long v6 = [(PXPhotosLayout *)self viewModel];
    int v7 = [(PXPhotosSectionedLayout *)v5 initWithViewModel:v6];
    int v8 = self->_sectionedLayout;
    self->_sectionedLayout = v7;

    if (self->_globalHeaderLayout) {
      uint64_t v9 = (self->_topHeaderLayout != 0) + 1;
    }
    else {
      uint64_t v9 = self->_topHeaderLayout != 0;
    }
    if (self->_headerLayout) {
      uint64_t v10 = v9 + 1;
    }
    else {
      uint64_t v10 = v9;
    }
    [(PXGLayout *)self insertSublayout:self->_sectionedLayout atIndex:v10];
  }
  else
  {
    if (!sectionedLayout) {
      return;
    }
    [(PXGLayout *)sectionedLayout removeFromSuperlayout];
    double v11 = self->_sectionedLayout;
    self->_sectionedLayout = 0;
  }
  if (self->_sectionedLayout)
  {
LABEL_13:
    double v12 = [(PXPhotosLayout *)self sectionHeaderProvider];
    [(PXPhotosSectionedLayout *)self->_sectionedLayout setHeaderLayoutProvider:v12];

    double v13 = [(PXPhotosLayout *)self sectionBodyProvider];
    [(PXPhotosSectionedLayout *)self->_sectionedLayout setBodyLayoutProvider:v13];

    double v14 = [(PXPhotosLayout *)self specManager];
    id v22 = [v14 spec];

    [(PXPhotosSectionedLayout *)self->_sectionedLayout setSpec:v22];
    int64_t v15 = [(PXPhotosLayout *)self viewModel];
    if ([v15 aspectFitContent]) {
      [v22 aspectFitContentVerticalPadding];
    }
    else {
      [v22 squareContentVerticalPadding];
    }

    if (!self->_headerLayout)
    {
      uint64_t v16 = [(PXPhotosLayout *)self sectionHeaderProvider];
      if (v16 || self->_managesHeaderSprites)
      {
      }
      else if (!self->_managesOnlyLegibilityGradientSprites)
      {
        goto LABEL_26;
      }
    }
    double v17 = [(PXPhotosLayout *)self specManager];
    unint64_t v18 = [v17 gridStyle];

    if (v18 >= 4)
    {
      if (v18 - 4 >= 2) {
        goto LABEL_23;
      }
    }
    else
    {
      float64x2_t v19 = [(PXPhotosLayout *)self viewModel];
      long long v20 = [v19 currentLens];
      int v21 = [v20 ignoresTopSafeAreaInset];

      if (!v21)
      {
LABEL_23:
        [(PXPhotosLayout *)self titleBackgroundSpriteHeight];
        goto LABEL_26;
      }
    }
    [(PXGLayout *)self safeAreaInsets];
LABEL_26:
    PXEdgeInsetsMake();
  }
}

- (void)_invalidateSectionedLayout
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateSectionedLayout]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosLayout.m", 1338, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)clearLastVisibleAreaAnchoringInformation
{
  if (self->_isClearingLastVisibleAreaAnchoringInformation
    || ([(PXGLayout *)self superlayout],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v3,
        (isKindOfClass & 1) == 0))
  {
    v6.receiver = self;
    v6.super_class = (Class)PXPhotosLayout;
    [(PXGLayout *)&v6 clearLastVisibleAreaAnchoringInformation];
  }
  else
  {
    self->_isClearingLastVisibleAreaAnchoringInformation = 1;
    long long v5 = [(PXGLayout *)self superlayout];
    [v5 clearLastVisibleAreaAnchoringInformation];

    self->_isClearingLastVisibleAreaAnchoringInformation = 0;
  }
}

- (id)createAnchorForVisibleAreaIgnoringEdges:(unint64_t)a3
{
  long long v5 = [(PXPhotosLayout *)self viewModel];
  uint64_t v6 = [v5 scrollingBehavior];

  if (v6 == 1) {
    unint64_t v7 = 15;
  }
  else {
    unint64_t v7 = a3;
  }
  v10.receiver = self;
  v10.super_class = (Class)PXPhotosLayout;
  int v8 = [(PXGLayout *)&v10 createAnchorForVisibleAreaIgnoringEdges:v7];
  return v8;
}

- (void)_updateFooter
{
  footerLayout = self->_footerLayout;
  uint64_t v4 = [(PXPhotosLayout *)self footerView];
  if (v4)
  {
    long long v5 = (void *)v4;
    id v6 = [(PXPhotosLayout *)self viewModel];
    if ([v6 contentPrivacyState] == 1 || objc_msgSend(v6, "scrollingBehavior") == 1)
    {
    }
    else
    {
      double v17 = [v6 currentLens];
      uint64_t v18 = [v17 defaultSectionBodyStyle];

      if (v18 != 4)
      {
        uint64_t v9 = self->_footerLayout;
        if (v9) {
          goto LABEL_9;
        }
        float64x2_t v19 = objc_alloc_init(PXGSingleViewLayout);
        long long v20 = self->_footerLayout;
        self->_footerLayout = v19;

        [(PXGLayout *)self insertSublayout:self->_footerLayout atIndex:[(PXGLayout *)self numberOfSublayouts]];
        goto LABEL_7;
      }
    }
  }
  unint64_t v7 = self->_footerLayout;
  if (!v7)
  {
    uint64_t v9 = 0;
    goto LABEL_9;
  }
  [(PXGLayout *)v7 removeFromSuperlayout];
  int v8 = self->_footerLayout;
  self->_footerLayout = 0;

LABEL_7:
  uint64_t v9 = self->_footerLayout;
LABEL_9:
  objc_super v10 = [(PXPhotosLayout *)self footerView];
  [(PXGSingleViewLayout *)self->_footerLayout setContentView:v10];

  [(PXNumberAnimator *)self->_headerFooterAlphaAnimator presentationValue];
  -[PXGLayout setAlpha:](self->_footerLayout, "setAlpha:");
  if ((footerLayout == 0) == (v9 != 0))
  {
    [(PXPhotosLayout *)self _invalidateSectionedLayout];
    if (v9)
    {
      if (!self->_footerHasAppearedInitially)
      {
        double v11 = [(PXPhotosLayout *)self viewModel];
        char v12 = [v11 hasScrollableContent];

        if ((v12 & 1) == 0)
        {
          double v13 = [(PXGLayout *)self->_footerLayout createAnimation];
          double v14 = +[PXPhotosGridSettings sharedInstance];
          [v14 defaultAnimationDuration];
          objc_msgSend(v13, "setDuration:");

          [v13 setScope:1];
        }
      }
      self->_footerHasAppearedInitialldouble y = 1;
    }
  }
  id v21 = [(PXGLayout *)self rootLayout];
  int64_t v15 = [v21 createAnchorForVisibleAreaIgnoringEdges:4];
  id v16 = (id)[v15 autoInvalidate];
}

- (void)_invalidateFooter
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x80;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x80) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateFooter]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosLayout.m", 1278, @"invalidating %lu after it already has been updated", 128);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 128;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateHeaderFooterAlphaAnimator
{
  BOOL v3 = [(PXPhotosLayout *)self viewModel];
  double v4 = (double)([v3 hideSurroundingContent] ^ 1);

  [(PXNumberAnimator *)self->_headerFooterAlphaAnimator value];
  if (v5 != v4)
  {
    headerFooterAlphaAnimator = self->_headerFooterAlphaAnimator;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__PXPhotosLayout__updateHeaderFooterAlphaAnimator__block_invoke;
    v7[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v7[4] = v4;
    [(PXNumberAnimator *)headerFooterAlphaAnimator performChangesWithDuration:1 curve:v7 changes:0.2];
  }
}

uint64_t __50__PXPhotosLayout__updateHeaderFooterAlphaAnimator__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

- (void)_updateHeaderAnimated:(BOOL)a3
{
  if (a3) {
    id v4 = [(PXPhotosLayout *)self createDefaultAnimationForCurrentContext];
  }
  headerLayout = self->_headerLayout;
  if (headerLayout) {
    goto LABEL_4;
  }
  int v8 = [(PXPhotosLayout *)self headerView];

  if (v8)
  {
    uint64_t v9 = objc_alloc_init(PXGSingleViewLayout);
    objc_super v10 = self->_headerLayout;
    self->_headerLayout = v9;

    [(PXGLayout *)self insertSublayout:self->_headerLayout atIndex:self->_topHeaderLayout != 0];
    unint64_t v7 = [(PXGLayout *)self rootLayout];
    double v11 = [v7 createAnchorForVisibleAreaIgnoringEdges:1];
    id v12 = (id)[v11 autoInvalidate];

LABEL_8:
    goto LABEL_9;
  }
  if (self->_headerLayout)
  {
LABEL_4:
    id v6 = [(PXPhotosLayout *)self headerView];

    if (v6) {
      goto LABEL_9;
    }
    [(PXGLayout *)self->_headerLayout removeFromSuperlayout];
    unint64_t v7 = self->_headerLayout;
    self->_headerLayout = 0;
    goto LABEL_8;
  }
LABEL_9:
  double v13 = [(PXPhotosLayout *)self headerView];
  [(PXGSingleViewLayout *)self->_headerLayout setContentView:v13];

  [(PXNumberAnimator *)self->_headerFooterAlphaAnimator presentationValue];
  double v15 = v14;
  id v16 = [(PXPhotosLayout *)self headerCustomizationModel];

  if (v16)
  {
    double v17 = [(PXPhotosLayout *)self headerCustomizationModel];
    [v17 alpha];
    double v15 = v15 * v18;
  }
  [(PXGLayout *)self->_headerLayout setAlpha:v15];
  if ((headerLayout != 0) == (self->_headerLayout == 0))
  {
    [(PXPhotosLayout *)self _invalidateSectionedLayout];
  }
}

- (void)_invalidateHeaderAnimated:(BOOL)a3
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
      uint64_t v5 = 512;
      if (a3) {
        uint64_t v5 = 256;
      }
LABEL_10:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | v5;
      return;
    }
LABEL_7:
    uint64_t v5 = 512;
    if (a3) {
      uint64_t v5 = 256;
    }
    if ((self->_updateFlags.updated & v5) != 0)
    {
      uint64_t v8 = v5;
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v10 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateHeaderAnimated:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"PXPhotosLayout.m", 1236, @"invalidating %lu after it already has been updated", v8);

      abort();
    }
    goto LABEL_10;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_7;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  uint64_t v7 = 512;
  if (a3) {
    uint64_t v7 = 256;
  }
  p_updateFlags->unint64_t needsUpdate = v7;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateGlobalHeaderLayout
{
  id v17 = [(PXPhotosLayout *)self viewModel];
  uint64_t v3 = [(PXPhotosLayout *)self globalHeaderProvider];
  id v4 = (void *)v3;
  globalHeaderLayout = self->_globalHeaderLayout;
  if (globalHeaderLayout) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (!v6)
  {
    uint64_t v7 = [(PXPhotosLayout *)self viewModel];
    uint64_t v8 = [v17 currentDataSource];
    uint64_t v9 = [(PXPhotosLayout *)self specManager];
    objc_super v10 = [v9 spec];
    double v11 = [v4 createGlobalHeaderLayoutForPhotosViewModel:v7 dataSource:v8 spec:v10];
    id v12 = self->_globalHeaderLayout;
    self->_globalHeaderLayout = v11;

    double v13 = self->_globalHeaderLayout;
    if (!v13) {
      goto LABEL_9;
    }
    [(PXGLayout *)self insertSublayout:v13 atIndex:0];
    [(PXPhotosLayout *)self _invalidateLocalSpritesAlpha];
    globalHeaderLayout = self->_globalHeaderLayout;
  }
  if (globalHeaderLayout)
  {
    double v14 = [v17 currentDataSource];
    double v15 = [(PXPhotosLayout *)self specManager];
    id v16 = [v15 spec];
    [v4 configureGlobalHeaderLayout:globalHeaderLayout dataSource:v14 spec:v16];
  }
LABEL_9:
}

- (void)_invalidateGlobalHeaderLayout
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x10;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateGlobalHeaderLayout]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosLayout.m", 1216, @"invalidating %lu after it already has been updated", 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 16;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateTopHeaderLayout
{
  if (self->_topHeaderLayout) {
    goto LABEL_2;
  }
  if (self->_headerProviderRespondsTo.createTopHeaderLayoutForDataSource)
  {
    BOOL v21 = 0;
    double v13 = [(PXPhotosLayout *)self sectionHeaderProvider];
    sectionedLayout = self->_sectionedLayout;
    double v15 = [(PXPhotosLayout *)self viewModel];
    id v16 = [v15 currentDataSource];
    id v17 = [(PXPhotosLayout *)self specManager];
    double v18 = [v17 spec];
    float64x2_t v19 = [v13 createTopHeaderLayoutForSectionedLayout:sectionedLayout dataSource:v16 spec:v18 outShouldFloat:&v21];
    topHeaderLayout = self->_topHeaderLayout;
    self->_topHeaderLayout = v19;

    if (self->_topHeaderLayout)
    {
      -[PXGLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:");
      [(PXPhotosLayout *)self _invalidateLocalSpritesAlpha];
    }
    self->_topHeaderLayoutShouldFloat = v21;
    if (self->_topHeaderLayout)
    {
LABEL_2:
      uint64_t v3 = [(PXPhotosLayout *)self viewModel];
      id v4 = [v3 selectionSnapshot];
      [(PXPhotosSectionedLayoutHeader *)self->_topHeaderLayout setSelectionSnapshot:v4];

      -[PXPhotosSectionedLayoutHeader setIsInSelectMode:](self->_topHeaderLayout, "setIsInSelectMode:", [v3 isInSelectMode]);
      uint64_t v5 = [(PXPhotosLayout *)self specManager];
      BOOL v6 = [v5 spec];
      [(PXPhotosSectionedLayoutHeader *)self->_topHeaderLayout setSpec:v6];

      if (self->_headerProviderRespondsTo.configureTopHeaderLayout)
      {
        uint64_t v7 = [(PXPhotosLayout *)self sectionHeaderProvider];
        uint64_t v8 = self->_topHeaderLayout;
        uint64_t v9 = [(PXPhotosLayout *)self viewModel];
        objc_super v10 = [v9 currentDataSource];
        double v11 = [(PXPhotosLayout *)self specManager];
        id v12 = [v11 spec];
        [v7 configureTopHeaderLayout:v8 dataSource:v10 spec:v12];
      }
    }
  }
}

- (void)_invalidateTopHeaderLayout
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
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateTopHeaderLayout]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosLayout.m", 1189, @"invalidating %lu after it already has been updated", 32);

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

- (void)_updateHeaderMeasurements
{
  if (self->_managesHeaderSprites || self->_managesOnlyLegibilityGradientSprites)
  {
    uint64_t v3 = [(PXPhotosLayout *)self viewModel];
    if ([v3 wantsDynamicTitles]) {
      [(PXPhotosLayout *)self _headerTitleReferenceSize];
    }
    else {
      [(PXPhotosLayout *)self _headerTitleSize];
    }
    double v5 = -0.0;
    if (v4 > 0.0) {
      double v5 = 12.0;
    }
    double v6 = v4 + v5;
    -[PXPhotosLayout setHeaderTitleSize:](self, "setHeaderTitleSize:");
    [(PXPhotosLayout *)self _updateHeaderOrigin];
    uint64_t v7 = [(PXPhotosLayout *)self specManager];
    uint64_t v8 = [v7 spec];

    if (v6 <= 0.0)
    {
      double v13 = 0.0;
      [(PXPhotosLayout *)self setHeaderTitleBaselineToBottom:0.0];
      double v14 = 0.0;
    }
    else
    {
      uint64_t v9 = [v8 headerTitleFont];
      [v9 descender];
      double v11 = v6 + -6.0 + v10;

      [v8 headerTitleBottomSpacing];
      double v13 = v6 + v12;
      [(PXPhotosLayout *)self setHeaderTitleBaselineToBottom:v6 + v12 - v11];
      double v14 = 0.0;
      if (v13 > 0.0)
      {
        char v15 = [v8 isTV];
        double v16 = 0.0;
        if ((v15 & 1) == 0) {
          objc_msgSend(v8, "headerTitleTopSpacing", 0.0);
        }
        double v14 = v13 + v16;
      }
    }
    if ([(PXPhotosLayout *)self wantsHeaderInSafeArea])
    {
      [(PXPhotosLayout *)self headerTitleOrigin];
      double v18 = v13 + v17;
      [(PXGLayout *)self safeAreaInsets];
      double v20 = v18 - v19;
      if (v20 >= 0.0) {
        double v14 = v20;
      }
      else {
        double v14 = 0.0;
      }
    }
    [(PXPhotosLayout *)self setTitleBackgroundSpriteHeight:v14];
    unint64_t v21 = [v3 navBarStyle];
    double v22 = 0.0;
    if (v21 <= 7 && ((1 << v21) & 0x8E) != 0)
    {
      [(PXGLayout *)self safeAreaInsets];
      double v24 = v23;
      [(PXPhotosLayout *)self statusBarHeight];
      double v26 = v24 - v25;
      CGFloat v27 = +[PXPhotosGridSettings sharedInstance];
      [v27 headerGradientHeight];
      double v29 = v28 - v26;

      [(PXPhotosLayout *)self titleBackgroundSpriteHeight];
      double v22 = fmax(v29 - v30, 0.0);
    }
    [(PXPhotosLayout *)self setTitleBackgroundGradientAdditionalCoverage:v22];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __43__PXPhotosLayout__updateHeaderMeasurements__block_invoke;
    v31[3] = &unk_1E5DCF6C0;
    v31[4] = self;
    [v3 performChanges:v31];
  }
}

void __43__PXPhotosLayout__updateHeaderMeasurements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v8 = a2;
  [v3 titleBackgroundSpriteHeight];
  double v5 = v4;
  [*(id *)(a1 + 32) safeAreaInsets];
  double v7 = v5 - v6;
  if (v7 < 0.0) {
    double v7 = 0.0;
  }
  [v8 setHeaderTitleTopInset:v7];
}

- (void)_invalidateHeaderMeasurements
{
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
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateHeaderMeasurements]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosLayout.m", 1138, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_invalidateHeaderMeasurementsForTitleChange
{
  uint64_t v3 = [(PXPhotosLayout *)self viewModel];
  char v4 = [v3 wantsDynamicTitles];

  if ((v4 & 1) == 0)
  {
    [(PXPhotosLayout *)self _invalidateHeaderMeasurements];
  }
}

- (void)_updateHeaderOrigin
{
  uint64_t v3 = [(PXPhotosLayout *)self specManager];
  id v32 = [v3 spec];

  [v32 headerTitleLeadingSpacing];
  double v5 = v4;
  if ([v32 isTV])
  {
    [(PXGLayout *)self visibleRect];
    double v6 = 0.0;
    if (v7 >= 0.0)
    {
      [v32 headerTitleTopSpacing];
      double v6 = v8;
    }
  }
  else if ([(PXPhotosLayout *)self wantsHeaderInSafeArea])
  {
    uint64_t v9 = [(PXPhotosLayout *)self headerCustomizationModel];
    [v9 verticalVisibilityOffset];
    double v11 = v10;
    [v9 verticalFloatingOffset];
    double v13 = v11 - v12;
    [(PXGLayout *)self safeAreaInsets];
    double v15 = v14 - v13;
    [(PXPhotosLayout *)self statusBarHeight];
    double v17 = v16;
    [(PXPhotosLayout *)self statusBarHeight];
    double v19 = v17 + (v15 - v18) * 0.5;
    [(PXPhotosLayout *)self _headerTitleLineHeight];
    double v21 = v19 - v20 * 0.5;
    [(PXPhotosLayout *)self statusBarHeight];
    if (v21 >= v22) {
      double v22 = v21;
    }
    double v6 = v13 + v22;
  }
  else
  {
    double v23 = [(PXPhotosLayout *)self viewModel];
    double v24 = 0.0;
    if ([v23 navBarStyle] != 5)
    {
      double v25 = [(PXPhotosLayout *)self viewModel];
      if ([v25 navBarStyle] != 6
        && ![(PXPhotosLayout *)self alignsHeaderTitleWithLayoutMargins])
      {
        [v32 headerTitleButtonAlignmentSpacing];
        double v24 = v26;
      }
    }
    double v5 = v5 + v24;

    [(PXGLayout *)self safeAreaInsets];
    double v28 = v27;
    [v32 headerTitleTopSpacing];
    double v6 = v28 + v29;
  }
  [(PXPhotosLayout *)self headerTitleSize];
  double v30 = 0.0;
  if (v31 > 0.0) {
    double v30 = 6.0;
  }
  -[PXPhotosLayout setHeaderTitleOrigin:](self, "setHeaderTitleOrigin:", v5, v6 - v30);
}

- (CGSize)_headerTitleSize
{
  [(PXPhotosLayout *)self _headerTitleReferenceSize];
  double v4 = v3;
  double v6 = v5;
  int64_t v7 = [(PXPhotosLayout *)self headerTitleDrawingOptions];
  double v8 = [(PXPhotosLayout *)self attributedStringForSpriteAtIndex:3 inLayout:self];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "boundingRectWithSize:options:context:", v7, 0, v4, v6);
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v14 = [(PXPhotosLayout *)self headerTitle];
    double v15 = [(PXPhotosLayout *)self headerTitleOverContentAttributes];
    objc_msgSend(v14, "boundingRectWithSize:options:attributes:context:", v7, v15, 0, v4, v6);
    double v11 = v16;
    double v13 = v17;
  }
  double v18 = v11;
  double v19 = v13;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (CGSize)_headerTitleReferenceSize
{
  double v3 = [(PXPhotosLayout *)self specManager];
  double v4 = [v3 spec];

  [v4 headerTitleLeadingSpacing];
  double v6 = v5;
  [v4 headerTitleButtonAlignmentSpacing];
  double v8 = v6 + v7;
  [(PXGLayout *)self referenceSize];
  double v10 = v9 + v8 * -2.0;
  BOOL v11 = [(PXPhotosLayout *)self wantsHeaderInSafeArea];
  double v12 = 1.0;
  if (v11) {
    double v12 = 1.5;
  }
  double v13 = v10 / v12;
  [(PXPhotosLayout *)self _headerTitleLineHeight];
  double v15 = v14;
  [(PXPhotosLayout *)self _headerSubtitleLineHeight];
  double v17 = (v16 + v15 * 2.0) * 1.1;

  double v18 = v13;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (double)_headerSubtitleLineHeight
{
  double v3 = [(PXPhotosLayout *)self specManager];
  double v4 = [v3 spec];

  double v5 = [v4 headerSubtitleFont];
  double v6 = v5;
  if (v5)
  {
    [v5 lineHeight];
    double v8 = v7;
    [v6 leading];
    double v10 = v8 + v9;
  }
  else
  {
    [(PXPhotosLayout *)self _headerTitleLineHeight];
    double v10 = v11;
  }

  return v10;
}

- (double)_headerTitleLineHeight
{
  v2 = [(PXPhotosLayout *)self specManager];
  double v3 = [v2 spec];

  double v4 = [v3 headerTitleFont];
  [v4 lineHeight];
  double v6 = v5;
  [v4 leading];
  double v8 = v6 + v7;

  return v8;
}

- (void)_updateHeaderAttributes
{
  if (self->_managesHeaderSprites || self->_managesOnlyLegibilityGradientSprites)
  {
    double v3 = [(PXPhotosLayout *)self specManager];
    id v14 = [v3 spec];

    double v4 = [MEMORY[0x1E4F1CA60] dictionary];
    double v5 = [v14 headerTitleFont];
    uint64_t v6 = *MEMORY[0x1E4FB06F8];
    [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

    double v7 = [v14 headerTitleOverContentColor];
    uint64_t v8 = *MEMORY[0x1E4FB0700];
    [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

    [(PXPhotosLayout *)self setHeaderTitleOverContentAttributes:v4];
    double v9 = [v14 headerTitleOverBackgroundColor];
    [v4 setObject:v9 forKeyedSubscript:v8];

    [(PXPhotosLayout *)self setHeaderTitleOverBackgroundAttributes:v4];
    double v10 = [MEMORY[0x1E4F1CA60] dictionary];
    double v11 = [v14 headerSubtitleFont];
    [v10 setObject:v11 forKeyedSubscript:v6];

    double v12 = [v14 headerTitleOverBackgroundColor];
    [v10 setObject:v12 forKeyedSubscript:v8];

    [(PXPhotosLayout *)self setHeaderSubtitleOverBackgroundAttributes:v10];
    double v13 = [v14 headerTitleOverContentColor];
    [v10 setObject:v13 forKeyedSubscript:v8];

    [(PXPhotosLayout *)self setHeaderSubtitleOverContentAttributes:v10];
  }
}

- (void)_invalidateHeaderAttributes
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateHeaderAttributes]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosLayout.m", 1020, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)didUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosLayout;
  [(PXGStackLayout *)&v7 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    double v4 = [NSString stringWithUTF8String:"-[PXPhotosLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXPhotosLayout.m", 1015, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout didUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXPhotosLayout.m", 1016, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  if (self->_updateFlags.needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      double v16 = [MEMORY[0x1E4F28B00] currentHandler];
      double v17 = [NSString stringWithUTF8String:"-[PXPhotosLayout update]"];
      [v16 handleFailureInFunction:v17, @"PXPhotosLayout.m", 927, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 0;
    if (!self->_presentedLayoutState) {
      [(PXPhotosLayout *)self _updatePresentedLayoutState];
    }
    id v5 = [(PXGLayout *)self rootLayout];
    [v5 visibleRect];
    [v5 safeAreaInsets];
    PXEdgeInsetsInsetRect();
  }
  BOOL isUpdatingSublayouts = self->_isUpdatingSublayouts;
  self->_BOOL isUpdatingSublayouts = 1;
  v30.receiver = self;
  v30.super_class = (Class)PXPhotosLayout;
  [(PXGStackLayout *)&v30 update];
  self->_BOOL isUpdatingSublayouts = isUpdatingSublayouts;
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.BOOL willPerformUpdate = 0;
  if (self->_postUpdateFlags.needsUpdate)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      double v18 = [MEMORY[0x1E4F28B00] currentHandler];
      double v19 = [NSString stringWithUTF8String:"-[PXPhotosLayout update]"];
      [v18 handleFailureInFunction:v19, @"PXPhotosLayout.m", 985, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 0;
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = -1;
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      double v20 = [MEMORY[0x1E4F28B00] currentHandler];
      double v21 = [NSString stringWithUTF8String:"-[PXPhotosLayout update]"];
      [v20 handleFailureInFunction:v21, @"PXPhotosLayout.m", 986, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t needsUpdate = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x200000uLL;
    if ((needsUpdate & 0x200000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFDFFFFFLL;
      [(PXPhotosLayout *)self _updateContentBelowTitle];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      double v22 = [MEMORY[0x1E4F28B00] currentHandler];
      double v23 = [NSString stringWithUTF8String:"-[PXPhotosLayout update]"];
      [v22 handleFailureInFunction:v23, @"PXPhotosLayout.m", 989, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v9 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x400000uLL;
    if ((v9 & 0x400000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFBFFFFFLL;
      [(PXPhotosLayout *)self _updateHeaderTitle];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      double v24 = [MEMORY[0x1E4F28B00] currentHandler];
      double v25 = [NSString stringWithUTF8String:"-[PXPhotosLayout update]"];
      [v24 handleFailureInFunction:v25, @"PXPhotosLayout.m", 992, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v10 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x800000uLL;
    if ((v10 & 0x800000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v10 & 0xFFFFFFFFFF7FFFFFLL;
      [(PXPhotosLayout *)self _updateLocalSprites];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      double v26 = [MEMORY[0x1E4F28B00] currentHandler];
      double v27 = [NSString stringWithUTF8String:"-[PXPhotosLayout update]"];
      [v26 handleFailureInFunction:v27, @"PXPhotosLayout.m", 995, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v11 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x1000000uLL;
    if ((v11 & 0x1000000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v11 & 0xFFFFFFFFFEFFFFFFLL;
      [(PXPhotosLayout *)self _updateLocalSpritesAlpha];
      unint64_t v11 = p_postUpdateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    p_updateFlags->updated = 0;
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v11)
    {
      double v28 = [MEMORY[0x1E4F28B00] currentHandler];
      double v29 = [NSString stringWithUTF8String:"-[PXPhotosLayout update]"];
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"PXPhotosLayout.m", 998, @"still needing to update %lu after update pass", p_postUpdateFlags->needsUpdate);
    }
  }
  if (p_updateFlags->needsUpdate)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXPhotosLayout.m" lineNumber:999 description:@"post-update pass invalidated pre-update flags"];
  }
  double v12 = [(PXGLayout *)self pendingAnimations];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    id v14 = [(PXGLayout *)self createAnimation];
    [v14 setCurve:0];
    [v14 setDuration:0.0];
    [v14 setScope:2];
  }
  [(PXPhotosLayout *)self _updatePresentedLayoutState];
}

- (void)willUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosLayout;
  [(PXGStackLayout *)&v7 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    double v4 = [NSString stringWithUTF8String:"-[PXPhotosLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXPhotosLayout.m", 922, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  self->_postUpdateFlags.BOOL willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout willUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXPhotosLayout.m", 923, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)_updatePresentedLayoutState
{
  id v3 = [(PXPhotosLayout *)self createCurrentLayoutState];
  [(PXPhotosLayout *)self setPresentedLayoutState:v3];
}

- (id)createCurrentLayoutState
{
  id v3 = objc_alloc_init(PXPhotosLayoutState);
  double v4 = [(PXPhotosLayout *)self viewModel];
  id v5 = [v4 currentLens];
  [(PXPhotosLayoutState *)v3 setLens:v5];

  uint64_t v6 = [(PXPhotosLayout *)self sectionBodyProvider];
  [(PXPhotosLayoutState *)v3 setBodyProvider:v6];

  objc_super v7 = [(PXPhotosLayout *)self sectionHeaderProvider];
  [(PXPhotosLayoutState *)v3 setHeaderProvider:v7];

  return v3;
}

- (void)setPlacementOverride:(id)a3
{
  id v5 = (PXGItemPlacement *)a3;
  if (self->_placementOverride != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_placementOverride, a3);
    [(PXPhotosLayout *)self _invalidateSectionedLayoutPlacementOverrides];
    id v5 = v6;
  }
}

- (void)setTitleBackgroundGradientAdditionalCoverage:(double)a3
{
  if (self->_titleBackgroundGradientAdditionalCoverage != a3)
  {
    self->_titleBackgroundGradientAdditionalCoverage = a3;
    [(PXPhotosLayout *)self _invalidateLocalSprites];
  }
}

- (void)setTitleBackgroundSpriteHeight:(double)a3
{
  if (self->_titleBackgroundSpriteHeight != a3)
  {
    self->_titleBackgroundSpriteCGFloat Height = a3;
    [(PXPhotosLayout *)self _invalidateSectionedLayout];
    [(PXPhotosLayout *)self _invalidateLocalSprites];
  }
}

- (void)setHeaderTitleBaselineToBottom:(double)a3
{
  if (self->_headerTitleBaselineToBottom != a3)
  {
    self->_headerTitleBaselineToBottom = a3;
    [(PXPhotosLayout *)self _invalidateContentBelowTitle];
  }
}

- (void)setHeaderTitleSize:(CGSize)a3
{
  if (self->_headerTitleSize.width != a3.width || self->_headerTitleSize.height != a3.height)
  {
    self->_headerTitleSize = a3;
    [(PXPhotosLayout *)self _invalidateLocalSprites];
  }
}

- (void)setHeaderTitleOrigin:(CGPoint)a3
{
  if (self->_headerTitleOrigin.x != a3.x || self->_headerTitleOrigin.y != a3.y)
  {
    self->_headerTitleOrigin = a3;
    [(PXPhotosLayout *)self _invalidateLocalSprites];
  }
}

- (void)setHeaderSubtitleOverContentAttributes:(id)a3
{
  uint64_t v8 = (NSDictionary *)a3;
  double v4 = self->_headerSubtitleOverContentAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      headerSubtitleOverContentAttributes = self->_headerSubtitleOverContentAttributes;
      self->_headerSubtitleOverContentAttributes = v6;

      [(PXPhotosLayout *)self _invalidateLocalSprites];
    }
  }
}

- (void)setHeaderSubtitleOverBackgroundAttributes:(id)a3
{
  uint64_t v8 = (NSDictionary *)a3;
  double v4 = self->_headerSubtitleOverBackgroundAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      headerSubtitleOverBackgroundAttributes = self->_headerSubtitleOverBackgroundAttributes;
      self->_headerSubtitleOverBackgroundAttributes = v6;

      [(PXPhotosLayout *)self _invalidateLocalSprites];
    }
  }
}

- (void)setHeaderTitleOverBackgroundAttributes:(id)a3
{
  uint64_t v8 = (NSDictionary *)a3;
  double v4 = self->_headerTitleOverBackgroundAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      headerTitleOverBackgroundAttributes = self->_headerTitleOverBackgroundAttributes;
      self->_headerTitleOverBackgroundAttributes = v6;

      [(PXPhotosLayout *)self _invalidateLocalSprites];
    }
  }
}

- (void)setHeaderTitleOverContentAttributes:(id)a3
{
  uint64_t v8 = (NSDictionary *)a3;
  double v4 = self->_headerTitleOverContentAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      headerTitleOverContentAttributes = self->_headerTitleOverContentAttributes;
      self->_headerTitleOverContentAttributes = v6;

      [(PXPhotosLayout *)self _invalidateLocalSprites];
    }
  }
}

- (void)setHeaderSubtitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_headerSubtitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      headerSubtitle = self->_headerSubtitle;
      self->_headerSubtitle = v6;

      ++self->_headerTitleVersion;
      [(PXPhotosLayout *)self _invalidateHeaderMeasurementsForTitleChange];
      [(PXPhotosLayout *)self _invalidateLocalSprites];
    }
  }
}

- (void)setHeaderTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_headerTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      headerTitle = self->_headerTitle;
      self->_headerTitle = v6;

      ++self->_headerTitleVersion;
      [(PXPhotosLayout *)self _invalidateHeaderMeasurementsForTitleChange];
      [(PXPhotosLayout *)self _invalidateLocalSprites];
    }
  }
}

- (void)_updateHeaderTitle
{
  id v3 = [(PXPhotosLayout *)self viewModel];
  BOOL v4 = [v3 navBarStyle] == 3
    || [v3 navBarStyle] == 4
    || [v3 navBarStyle] == 6
    || [v3 navBarStyle] == 7;
  if (([v3 wantsDynamicTitles] & 1) == 0 && v4)
  {
    [(PXPhotosLayout *)self setHeaderTitle:0];
    [(PXPhotosLayout *)self setHeaderSubtitle:0];
    goto LABEL_52;
  }
  BOOL v5 = [v3 title];
  uint64_t v6 = [v3 currentDataSource];
  int v46 = !v4;
  if ([v3 wantsDynamicTitles])
  {
    uint64_t v7 = [v6 identifier];
    uint64_t v8 = [v3 viewOptionsModel];
    unint64_t v9 = v8;
    if (v8) {
      uint64_t v10 = [v8 browserDateType];
    }
    else {
      uint64_t v10 = 0;
    }
    [(PXGLayout *)self visibleRect];
    -[PXPhotosLayout dateIntervalFutureForContentInRect:type:](self, "dateIntervalFutureForContentInRect:type:", v10);
    double v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    CGFloat v44 = v12[2](v12, v7);
    if (v44)
    {
      uint64_t v13 = [(PXPhotosLayout *)self dateIntervalFormatter];
      id v14 = [v13 stringFromDateInterval:v44];

      if (v9)
      {
        double v15 = [v9 browserDateIntervalStringForDateIntervalString:v14];
      }
      else
      {
        double v15 = v14;
      }
      objc_storeStrong((id *)&self->_dynamicDateInterval, v15);
      if (v9) {
    }
      }
    BOOL v43 = v4;
    [(PXGLayout *)self visibleRect];
    -[PXPhotosLayout locationNamesFutureForContentInRect:](self, "locationNamesFutureForContentInRect:");
    double v16 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    double v17 = v16[2](v16, v7);
    double v18 = objc_msgSend(v17, "px_localizedComposedStringWithCount:useUndefinedMoreCount:", 1, 1);
    if (v18) {
      objc_storeStrong((id *)&self->_dynamicLocationName, v18);
    }
    unint64_t v11 = self->_dynamicDateInterval;
    if (!v5)
    {
      BOOL v5 = v11;
      unint64_t v11 = self->_dynamicLocationName;
    }

    BOOL v4 = v43;
    uint64_t v6 = v42;
  }
  else
  {
    unint64_t v11 = 0;
  }
  double v19 = [(PXPhotosLayout *)self specManager];
  double v20 = [v19 spec];
  if ([v20 allowsEmptyTitles])
  {
    [(PXPhotosLayout *)self viewModel];
    CGFloat v45 = v3;
    v22 = double v21 = v11;
    [v22 currentDataSource];
    BOOL v23 = v4;
    double v24 = v5;
    double v26 = v25 = v6;
    int v27 = [v26 containsAnyItems];

    uint64_t v6 = v25;
    BOOL v5 = v24;
    BOOL v4 = v23;

    unint64_t v11 = v21;
    id v3 = v45;

    if (v5 || (v27 & 1) == 0)
    {
      if (v11 || !v5 || ((v27 ^ 1) & 1) != 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
  else
  {

    if (v5) {
      goto LABEL_35;
    }
  }
  double v28 = [v6 containerCollection];
  BOOL v5 = [v28 localizedTitle];

LABEL_35:
  if (!v11)
  {
LABEL_36:
    double v29 = [v6 containerCollection];
    unint64_t v11 = [v29 localizedSubtitle];
  }
LABEL_37:
  objc_super v30 = [(PXPhotosLayout *)self viewModel];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __36__PXPhotosLayout__updateHeaderTitle__block_invoke;
  v47[3] = &unk_1E5DC4C68;
  id v48 = v5;
  CGFloat v49 = v11;
  double v31 = v11;
  id v32 = v5;
  [v30 performChanges:v47];

  CGFloat v33 = [(PXPhotosLayout *)self specManager];
  float64x2_t v34 = [v33 spec];
  int v35 = [v34 allowsEmptyTitles];
  double v36 = @" ";
  if ((v35 & v46) == 0) {
    double v36 = 0;
  }
  double v37 = v36;

  if ([(__CFString *)v32 length]) {
    int v38 = v4;
  }
  else {
    int v38 = 1;
  }
  if (v38) {
    CGFloat v39 = v37;
  }
  else {
    CGFloat v39 = v32;
  }
  [(PXPhotosLayout *)self setHeaderTitle:v39];
  if ([(NSString *)v31 length]) {
    int v40 = v4;
  }
  else {
    int v40 = 1;
  }
  if (v40) {
    CGFloat v41 = v37;
  }
  else {
    CGFloat v41 = (__CFString *)v31;
  }
  [(PXPhotosLayout *)self setHeaderSubtitle:v41];

LABEL_52:
}

void __36__PXPhotosLayout__updateHeaderTitle__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setHeaderTitle:v3];
  [v4 setHeaderSubtitle:*(void *)(a1 + 40)];
}

- (void)_invalidateHeaderTitle
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
      BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateHeaderTitle]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosLayout.m", 717, @"invalidating %lu after it already has been updated", 1);

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

- (void)_invalidateDynamicHeaderTitle
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x400000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x400000) != 0)
    {
      BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXPhotosLayout _invalidateDynamicHeaderTitle]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosLayout.m", 713, @"invalidating %lu after it already has been updated", 0x400000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 0x400000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)enumerateScrollablePagesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  unint64_t v9 = self->_sectionedLayout;
  -[PXGLayout convertPoint:fromLayout:](self, "convertPoint:fromLayout:", v9, v7, v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PXPhotosLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke;
  v13[3] = &unk_1E5DC4C40;
  id v14 = v6;
  uint64_t v15 = v10;
  uint64_t v16 = v11;
  id v12 = v6;
  [(PXPhotosSectionedLayout *)v9 enumerateSectionBoundariesWithOptions:a3 usingBlock:v13];
}

uint64_t __65__PXPhotosLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  uint64_t v11 = *(void *)(a1 + 32);
  CGRect v15 = CGRectOffset(*(CGRect *)&a5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
  id v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128, __n128, __n128))(v11 + 16);
  return v12(v11, a2, a3, a4, (__n128)v15.origin, *(__n128 *)&v15.origin.y, (__n128)v15.size, *(__n128 *)&v15.size.height);
}

- (unsigned)_titleBackgroundSpriteIndex
{
  if (self->_managesHeaderSprites) {
    return 1;
  }
  if (!self->_managesOnlyLegibilityGradientSprites)
  {
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PXPhotosLayout.m" lineNumber:696 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 0;
}

- (unsigned)_expectedLocalSpriteCount
{
  if (self->_managesHeaderSprites) {
    return 5;
  }
  if (!self->_managesOnlyLegibilityGradientSprites)
  {
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PXPhotosLayout.m" lineNumber:686 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 1;
}

- (BOOL)_shouldShowSectionedLayout
{
  v2 = [(PXPhotosLayout *)self viewModel];
  BOOL v3 = [v2 contentPrivacyState] != 1;

  return v3;
}

- (CGRect)originalPlacementRect
{
  [(PXGLayout *)self referenceSize];
  double v4 = v3;
  double v6 = v5;
  [(PXGLayout *)self safeAreaInsets];
  double v8 = -v7;
  double v9 = 0.0;
  double v10 = v4;
  double v11 = v6;
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v8;
  result.origin.double x = v9;
  return result;
}

- (BOOL)canHandleVisibleRectRejection
{
  double v3 = [(PXPhotosLayout *)self viewModel];
  uint64_t v4 = [v3 scrollingBehavior];

  if (v4 == 1) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)PXPhotosLayout;
  return [(PXGLayout *)&v6 canHandleVisibleRectRejection];
}

- (CGPoint)visibleOriginForScrollingToNeighboringSectionInDirection:(unint64_t)a3
{
  v24[3] = *MEMORY[0x1E4F143B8];
  if (a3 <= 6 && ((1 << a3) & 0x19) != 0) {
    PXAssertGetLog();
  }
  uint64_t v4 = [PXScrollSnapController alloc];
  [(PXGLayout *)self visibleRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(PXGLayout *)self safeAreaInsets];
  double v17 = -[PXScrollSnapController initWithSnapBehavior:scrollAxis:visibleRect:visibilityInsets:scrollablePageSource:](v4, "initWithSnapBehavior:scrollAxis:visibleRect:visibilityInsets:scrollablePageSource:", 2, 1, self, v6, v8, v10, v12, v13, v14, v15, v16);
  [(PXScrollSnapController *)v17 setMaximumDecelerationFactor:1.0];
  [(PXScrollSnapController *)v17 setMaximumAccelerationFactor:1.79769313e308];
  [(PXGLayout *)self visibleRect];
  -[PXScrollSnapController adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:scrollingVelocity:decelerationRate:](v17, "adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:scrollingVelocity:decelerationRate:", v24);
  double v19 = v18;
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (CGPoint)adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:(CGPoint)a3 scrollingVelocity:(CGPoint)a4 decelerationRate:(int64_t *)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  double v11 = [(PXPhotosLayout *)self specManager];
  double v12 = [v11 spec];

  double v13 = [PXScrollSnapController alloc];
  [(PXGLayout *)self visibleRect];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [(PXGLayout *)self safeAreaInsets];
  double v26 = -[PXScrollSnapController initWithSnapBehavior:scrollAxis:visibleRect:visibilityInsets:scrollablePageSource:](v13, "initWithSnapBehavior:scrollAxis:visibleRect:visibilityInsets:scrollablePageSource:", 0, 1, self, v15, v17, v19, v21, v22, v23, v24, v25);
  [v12 configureScrollSnapController:v26];
  int v27 = [(PXPhotosLayout *)self viewModel];
  double v28 = [v27 currentLens];
  char v29 = [v28 allowsScrollSnap];

  if ((v29 & 1) == 0) {
    [(PXScrollSnapController *)v26 setSnapBehavior:0];
  }
  -[PXScrollSnapController adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:scrollingVelocity:decelerationRate:](v26, "adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:scrollingVelocity:decelerationRate:", a5, v9, v8, x, y);
  double v31 = v30;
  double v33 = v32;

  double v34 = v31;
  double v35 = v33;
  result.double y = v35;
  result.double x = v34;
  return result;
}

- (id)regionOfInterestForAssetReference:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(PXGLayout *)self rootLayout];
  double v6 = [v5 coordinateSpace];
  double v7 = [(PXGLayout *)self spriteReferenceForObjectReference:v4];

  double v8 = 0;
  if (v6 && v7)
  {
    unsigned int v9 = [v5 spriteIndexForSpriteReference:v7];
    if (v9 == -1)
    {
      double v8 = 0;
    }
    else
    {
      int v24 = *(_DWORD *)off_1E5DAAF60;
      long long v10 = *((_OWORD *)off_1E5DAAF70 + 1);
      long long v22 = *(_OWORD *)off_1E5DAAF70;
      long long v23 = v10;
      long long v11 = *((_OWORD *)off_1E5DAAF90 + 7);
      long long v32 = *((_OWORD *)off_1E5DAAF90 + 6);
      long long v33 = v11;
      long long v12 = *((_OWORD *)off_1E5DAAF90 + 9);
      long long v34 = *((_OWORD *)off_1E5DAAF90 + 8);
      long long v35 = v12;
      long long v13 = *((_OWORD *)off_1E5DAAF90 + 3);
      long long v28 = *((_OWORD *)off_1E5DAAF90 + 2);
      long long v29 = v13;
      long long v14 = *((_OWORD *)off_1E5DAAF90 + 5);
      long long v30 = *((_OWORD *)off_1E5DAAF90 + 4);
      long long v31 = v14;
      long long v15 = *((_OWORD *)off_1E5DAAF90 + 1);
      long long v26 = *(_OWORD *)off_1E5DAAF90;
      long long v27 = v15;
      long long v16 = *((_OWORD *)off_1E5DAAF88 + 1);
      v20[0] = *(_OWORD *)off_1E5DAAF88;
      v20[1] = v16;
      uint64_t v21 = *((void *)off_1E5DAAF88 + 4);
      [v5 copyLayoutForSpritesInRange:v9 | 0x100000000 entities:&v24 geometries:&v22 styles:&v26 infos:v20];
      v19[0] = v22;
      v19[1] = v23;
      v25[6] = v32;
      v25[7] = v33;
      v25[8] = v34;
      v25[9] = v35;
      v25[2] = v28;
      v25[3] = v29;
      v25[4] = v30;
      v25[5] = v31;
      v25[0] = v26;
      v25[1] = v27;
      double v8 = PXGRegionOfInterestForSprite((uint64_t)v19, (float *)v25, v17, v6);
    }
  }

  return v8;
}

- (void)enumerateItemsGeometriesInRect:(CGRect)a3 dataSource:(id)a4 usingBlock:(id)a5
{
  sectionedLayout = self->_sectionedLayout;
  if (sectionedLayout)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    id v12 = a5;
    id v13 = a4;
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", sectionedLayout, x, y, width, height);
    -[PXPhotosSectionedLayout enumerateItemsGeometriesInRect:dataSource:usingBlock:](self->_sectionedLayout, "enumerateItemsGeometriesInRect:dataSource:usingBlock:", v13, v12);
  }
}

- (id)presentedItemsGeometryForSection:(unint64_t)a3 inDataSource:(id)a4
{
  return [(PXPhotosSectionedLayout *)self->_sectionedLayout presentedItemsGeometryForSection:a3 inDataSource:a4];
}

- (id)topmostSectionHeaderSnapshotInRect:(CGRect)a3
{
  if (self->_sectionedLayout)
  {
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    id v4 = -[PXPhotosSectionedLayout topmostHeaderSnapshotInRect:](self->_sectionedLayout, "topmostHeaderSnapshotInRect:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)assetsIteratorForContentInRect:(CGRect)a3
{
  if (self->_sectionedLayout)
  {
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
  }
  else
  {
    CGFloat v4 = *MEMORY[0x1E4F1DB20];
    CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  v14.origin.double x = v4;
  v14.origin.double y = v6;
  v14.size.double width = v8;
  v14.size.double height = v10;
  if (!CGRectIsNull(v14)) {
    PXPointIsNull();
  }
  long long v11 = _Block_copy(0);

  return v11;
}

- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3
{
  if (self->_sectionedLayout)
  {
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
  }
  else
  {
    CGFloat v4 = *MEMORY[0x1E4F1DB20];
    CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  v14.origin.double x = v4;
  v14.origin.double y = v6;
  v14.size.double width = v8;
  v14.size.double height = v10;
  if (!CGRectIsNull(v14)) {
    PXPointIsNull();
  }
  long long v11 = _Block_copy(0);

  return v11;
}

- (id)locationNamesFutureForContentInRect:(CGRect)a3
{
  if (self->_sectionedLayout)
  {
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
  }
  else
  {
    CGFloat v4 = *MEMORY[0x1E4F1DB20];
    CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  v14.origin.double x = v4;
  v14.origin.double y = v6;
  v14.size.double width = v8;
  v14.size.double height = v10;
  if (!CGRectIsNull(v14)) {
    PXPointIsNull();
  }
  long long v11 = (void *)[&__block_literal_global_277_206489 copy];

  return v11;
}

uint64_t __54__PXPhotosLayout_locationNamesFutureForContentInRect___block_invoke()
{
  return 0;
}

- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4
{
  if (self->_sectionedLayout)
  {
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
  }
  else
  {
    CGFloat v5 = *MEMORY[0x1E4F1DB20];
    CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  v15.origin.double x = v5;
  v15.origin.double y = v7;
  v15.size.double width = v9;
  v15.size.double height = v11;
  if (!CGRectIsNull(v15)) {
    PXPointIsNull();
  }
  id v12 = (void *)[&__block_literal_global_274_206491 copy];

  return v12;
}

uint64_t __58__PXPhotosLayout_dateIntervalFutureForContentInRect_type___block_invoke()
{
  return 0;
}

- (id)createAnchorForScrollingToInitialPosition
{
  double v3 = [(PXPhotosLayout *)self viewModel];
  double v4 = [v3 initialNavigationObjectReference];

  if (v4)
  {
    unint64_t v5 = [v3 initialNavigationScrollPosition];
    if (v5 > 3) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = qword_1AB35B6D8[v5];
    }
    unint64_t v11 = [v3 navBarStyle];
    if (v11 > 8)
    {
      long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v17 = [NSString stringWithUTF8String:"BOOL _IsNavigationBarBackgroundVisibleForNavigationBarStyle(PXPhotosViewNavigationBarStyle)"];
      [v16 handleFailureInFunction:v17 file:@"PXPhotosLayout.m" lineNumber:149 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if (((1 << v11) & 0x19F) != 0) {
      uint64_t v12 = v6 | 0x100;
    }
    else {
      uint64_t v12 = v6;
    }
    double v8 = [(PXGLayout *)self rootLayout];
    id v13 = [v3 initialNavigationObjectReference];
    CGRect v14 = objc_msgSend(v8, "createAnchorForScrollingSpriteForObjectReference:toScrollPosition:padding:", v13, v12, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
  }
  else
  {
    [v3 contentStartsAtEnd];
    CGFloat v7 = [(PXPhotosLayout *)self specManager];
    double v8 = [v7 spec];

    if ([(PXPhotosLayout *)self canScrollToInitialPosition])
    {
      CGFloat v9 = [(PXPhotosLayout *)self detentForInitialScrollPosition];
      if (v9)
      {
        [v9 offset];
        double v10 = [v8 extendedTraitCollection];
        [v10 safeAreaInsets];
      }
      [(PXGLayout *)self rootLayout];
      objc_claimAutoreleasedReturnValue();
      PXEdgeInsetsMake();
    }
    CGRect v14 = 0;
  }

  return v14;
}

- (void)setAlignsHeaderTitleWithLayoutMargins:(BOOL)a3
{
  if (self->_alignsHeaderTitleWithLayoutMargins != a3)
  {
    self->_alignsHeaderTitleWithLayoutMargins = a3;
    [(PXPhotosLayout *)self _invalidateHeaderMeasurements];
  }
}

- (void)setWantsHeaderInSafeArea:(BOOL)a3
{
  if (self->_wantsHeaderInSafeArea != a3)
  {
    self->_wantsHeaderInSafeArea = a3;
    [(PXPhotosLayout *)self _invalidateHeaderMeasurements];
    [(PXPhotosLayout *)self _invalidateLocalSpritesAlpha];
  }
}

- (void)setStatusBarHeight:(double)a3
{
  if (self->_statusBarHeight != a3)
  {
    self->_statusBarCGFloat Height = a3;
    [(PXPhotosLayout *)self _invalidateHeaderMeasurements];
  }
}

- (void)setSectionBodyProvider:(id)a3
{
  unint64_t v5 = (PXPhotosSectionBodyLayoutProvider *)a3;
  if (self->_sectionBodyProvider != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_sectionBodyProvider, a3);
    [(PXPhotosLayout *)self _invalidateSectionedLayout];
    unint64_t v5 = v6;
  }
}

- (void)setGlobalHeaderProvider:(id)a3
{
  unint64_t v5 = (PXPhotosGlobalHeaderLayoutProvider *)a3;
  if (self->_globalHeaderProvider != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_globalHeaderProvider, a3);
    [(PXPhotosLayout *)self _invalidateGlobalHeaderLayout];
    [(PXPhotosLayout *)self _invalidateTopHeaderLayout];
    [(PXPhotosLayout *)self _invalidateSectionedLayout];
    unint64_t v5 = v6;
  }
}

- (void)setSectionHeaderProvider:(id)a3
{
  unint64_t v5 = (PXPhotosSectionHeaderLayoutProvider *)a3;
  if (self->_sectionHeaderProvider != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_sectionHeaderProvider, a3);
    self->_headerProviderRespondsTo.createTopHeaderLayoutForDataSource = objc_opt_respondsToSelector() & 1;
    self->_headerProviderRespondsTo.topHeaderLayoutDidChangeDataSource = objc_opt_respondsToSelector() & 1;
    self->_headerProviderRespondsTo.configureTopHeaderLayout = objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      [(PXPhotosSectionHeaderLayoutProvider *)v6 setTopHeaderInvalidationDelegate:self];
    }
    [(PXPhotosLayout *)self _invalidateTopHeaderLayout];
    [(PXPhotosLayout *)self _invalidateSectionedLayout];
    unint64_t v5 = v6;
  }
}

- (void)invalidateFooterHeight
{
}

- (PXFloatRange)bottomCollapsibleArea
{
  if (self->_footerLayout)
  {
    long long v7 = 0u;
    long long v8 = 0u;
    double v3 = [(PXGLayout *)self sublayoutDataStore];
    double v4 = v3;
    if (v3)
    {
      [v3 geometryForSublayout:self->_footerLayout];
    }
    else
    {
      long long v7 = 0u;
      long long v8 = 0u;
    }

    double v5 = *((double *)&v8 + 1);
    double v6 = *((double *)&v7 + 1);
  }
  else
  {
    double v5 = 0.0;
    double v6 = 0.0;
  }
  result.var1 = v6;
  result.uint64_t var0 = v5;
  return result;
}

- (PXFloatRange)topCollapsibleArea
{
  double v3 = [(PXPhotosLayout *)self viewModel];
  double v4 = [v3 currentLens];
  char v5 = [v4 ignoresTopSafeAreaInset];

  double v6 = 0.0;
  double v7 = 0.0;
  if ((v5 & 1) == 0)
  {
    [(PXGLayout *)self safeAreaInsets];
    double v9 = v8;
    double v6 = -v8;
    [(PXPhotosLayout *)self titleBackgroundSpriteHeight];
    double v7 = v9 + v10;
  }
  double v11 = v6;
  result.var1 = v7;
  result.uint64_t var0 = v11;
  return result;
}

- (void)setFooterView:(id)a3
{
  char v5 = (UIView *)a3;
  if (self->_footerView != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_footerView, a3);
    [(PXPhotosLayout *)self _performPreUpdateInvalidationDeferredIfNeeded:&__block_literal_global_206501];
    char v5 = v6;
  }
}

uint64_t __32__PXPhotosLayout_setFooterView___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _invalidateFooter];
}

- (void)setHeaderView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (UIView *)a3;
  if (self->_headerView != v7)
  {
    double v8 = v7;
    objc_storeStrong((id *)&self->_headerView, a3);
    [(PXPhotosLayout *)self _invalidateHeaderAnimated:v4];
    double v7 = v8;
  }
}

- (void)setHeaderView:(id)a3
{
}

- (BOOL)appliesAlphaToSublayouts
{
  return 1;
}

- (id)presentedDataSource
{
  return [(PXPhotosSectionedLayout *)self->_sectionedLayout assetsDataSource];
}

- (PXPhotosLayout)initWithViewModel:(id)a3 specManager:(id)a4 overlayController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)PXPhotosLayout;
  uint64_t v12 = [(PXGStackLayout *)&v33 init];
  if (v12)
  {
    if ([v9 scrollingBehavior] == 1)
    {
      uint64_t v13 = 2;
    }
    else if ([v9 wantsSingleRowScrollingLayout])
    {
      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v13 = 1;
    }
    [(PXGStackLayout *)v12 setAxis:v13];
    CGRect v14 = [(PXGLayout *)v12 axGroup];
    [v14 setAxRole:3];

    CGRect v15 = [(PXGLayout *)v12 axGroup];
    [v15 setAxIdentifier:@"photos_layout"];

    [(PXGLayout *)v12 setContentSource:v12];
    [(PXGStackLayout *)v12 setSublayoutAlignmentDelegate:v12];
    objc_storeStrong((id *)&v12->_viewModel, a3);
    [(PXPhotosViewModel *)v12->_viewModel registerChangeObserver:v12 context:ViewModelObservationContext_206403];
    objc_storeStrong((id *)&v12->_specManager, a4);
    [(PXPhotosLayoutSpecManager *)v12->_specManager registerChangeObserver:v12 context:SpecManagerObservationContext_206406];
    LODWORD(v16) = 1.0;
    v12->_titleBackgroundGradientResizableCapInsetsIndedouble x = -[PXGLayout addResizableCapInsets:](v12, "addResizableCapInsets:", 0.0, 0.0, v16, 0.0);
    objc_storeStrong((id *)&v12->_overlayController, a5);
    uint64_t v17 = objc_alloc_init(PXPhotosLayoutDefaultAnimationProvider);
    animationProvider = v12->_animationProvider;
    v12->_animationProvider = (PXPhotosLayoutAnimationProvider *)v17;

    id v19 = objc_alloc((Class)off_1E5DA74E8);
    int v20 = [v9 requiresLightTopBars];
    uint64_t v21 = [(PXFeatureSpecManager *)v12->_specManager spec];
    double v22 = 0.0;
    if (v20) {
      double v22 = 1.0;
    }
    uint64_t v23 = [v19 initWithValue:v22];
    alternateAppearanceMixAnimator = v12->_alternateAppearanceMixAnimator;
    v12->_alternateAppearanceMixAnimator = (PXNumberAnimator *)v23;

    [(PXNumberAnimator *)v12->_alternateAppearanceMixAnimator registerChangeObserver:v12 context:AlternateAppearanceMixAnimatorObservationContext_206407];
    [(PXNumberAnimator *)v12->_alternateAppearanceMixAnimator setLabel:@"alternateAppearanceMixAnimator"];
    v12->_managesHeaderSprites = (unint64_t)([v9 navBarStyle] - 1) < 6;
    v12->_managesOnlyLegibilityGradientSprites = [v9 navBarStyle] == 7;
    uint64_t v25 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:1.0];
    headerFooterAlphaAnimator = v12->_headerFooterAlphaAnimator;
    v12->_headerFooterAlphaAnimator = (PXNumberAnimator *)v25;

    [(PXNumberAnimator *)v12->_headerFooterAlphaAnimator registerChangeObserver:v12 context:HeaderFooterAlphaAnimatorObservationContext];
    [(PXNumberAnimator *)v12->_headerFooterAlphaAnimator setLabel:@"headerFooterAlphaAnimator"];
    v12->_headerTitleDrawingOptions = 35;
    uint64_t v27 = [v10 headerCustomizationModel];
    headerCustomizationModel = v12->_headerCustomizationModel;
    v12->_headerCustomizationModel = (PXPhotosHeaderCustomizationModel *)v27;

    [(PXPhotosHeaderCustomizationModel *)v12->_headerCustomizationModel registerChangeObserver:v12 context:HeaderCustomizationModelObservationContext];
    long long v29 = (NSDateIntervalFormatter *)objc_alloc_init(MEMORY[0x1E4F28C20]);
    dateIntervalFormatter = v12->_dateIntervalFormatter;
    v12->_dateIntervalFormatter = v29;

    long long v31 = [(NSDateIntervalFormatter *)v12->_dateIntervalFormatter px_dateTemplateForGranularity:16 abbreviated:1];
    [(NSDateIntervalFormatter *)v12->_dateIntervalFormatter setDateTemplate:v31];

    [(PXPhotosLayout *)v12 _invalidateHeaderTitle];
    [(PXPhotosLayout *)v12 _invalidateHeaderAttributes];
    [(PXPhotosLayout *)v12 _invalidateHeaderMeasurements];
    [(PXPhotosLayout *)v12 _invalidateHeaderAnimated:0];
    [(PXPhotosLayout *)v12 _invalidateSectionedLayout];
    [(PXPhotosLayout *)v12 _invalidateSectionedLayoutPlacementOverrides];
    [(PXPhotosLayout *)v12 _invalidateFooter];
    [(PXPhotosLayout *)v12 _invalidateLocalSpritesCount];
    [(PXPhotosLayout *)v12 _invalidateLocalSprites];
    [(PXPhotosLayout *)v12 _invalidateLocalSpritesAlpha];
  }

  return v12;
}

@end