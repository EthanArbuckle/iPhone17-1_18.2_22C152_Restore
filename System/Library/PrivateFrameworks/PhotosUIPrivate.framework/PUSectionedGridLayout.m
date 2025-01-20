@interface PUSectionedGridLayout
+ (Class)invalidationContextClass;
- (BOOL)_ensureUpdatedLayoutData:(id)a3 isForward:(BOOL)a4 outDeltaOriginY:(double *)a5;
- (BOOL)_hasAccessibilityLargeText;
- (BOOL)_isSupportedSupplementaryViewKind:(id)a3;
- (BOOL)_isTransitionForeignSupplementaryViewKind:(id)a3;
- (BOOL)_supportsAdvancedTransitionAnimations;
- (BOOL)_visualSectionsMatchTransitionSectionsToOrFromLayout:(id)a3;
- (BOOL)dynamicLayoutEnabled;
- (BOOL)floatingSectionHeadersEnabled;
- (BOOL)hasItemAtGridCoordinates:(PUGridCoordinates)a3 inTransitionSection:(int64_t)a4;
- (BOOL)sectionHeadersEnabled;
- (BOOL)shouldHideVisualSection:(int64_t)a3;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)transitionAnchorShiftsColumns;
- (BOOL)transitionIsAnimated;
- (BOOL)transitionIsAppearing;
- (BOOL)transitionZoomingOut;
- (BOOL)usesAspectItems;
- (BOOL)usesRenderedStripTopExtendersForTransitions;
- (CATransform3D)_transformToConvertRect:(SEL)a3 intoRect:(CGRect)a4 referenceCenter:(CGRect)a5;
- (CGPoint)_currentVisibleRectOrigin;
- (CGPoint)_targetContentOffsetWithAnchorItemIndexPath:(id)a3 isRotation:(BOOL)a4 orTransitionFromLayout:(id)a5 keepAnchorStable:(BOOL)a6;
- (CGPoint)_visibleRectOriginForScrollOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForTransitionFromGridLayout:(id)a3;
- (CGPoint)targetContentOffsetForViewSizeTransitionContext:(id)a3;
- (CGPoint)transitionEffectiveContentOrigin;
- (CGPoint)transitionEndContentOffset;
- (CGPoint)transitionStartContentOffset;
- (CGRect)_frameByAdjustingOffScreenEnteringFrame:(CGRect)a3 forRowAtVisualIndexPath:(PUSimpleIndexPath)a4 transitionSectionInfo:(id)a5 toOrFromGridLayout:(id)a6 isAppearing:(BOOL)a7;
- (CGRect)frameForItemAtGridCoordinates:(PUGridCoordinates)a3 inTransitionSection:(int64_t)a4;
- (CGRect)frameForItemAtGridCoordinates:(PUGridCoordinates)a3 inVisualSection:(int64_t)a4;
- (CGRect)frameForItemAtGridCoordinates:(PUGridCoordinates)a3 inVisualSection:(int64_t)a4 indexPath:(id)a5;
- (CGRect)frameForSectionHeaderAtVisualSection:(int64_t)a3;
- (CGRect)frameForSectionHeaderOfRealItem:(id)a3;
- (CGSize)collectionViewContentSize;
- (CGSize)interItemSpacing;
- (CGSize)itemSize;
- (CGSize)layoutItemSizeForColumn:(int64_t)a3;
- (CGSize)transitionActualContentSize;
- (NSIndexPath)globalFooterIndexPath;
- (NSIndexPath)globalHeaderIndexPath;
- (NSIndexPath)transitionExplicitAnchorItemIndexPath;
- (NSIndexPath)transitionFirstVisibleRowVisualPath;
- (NSIndexPath)transitionLastVisibleRowVisualPath;
- (NSNumber)cachedDefaultGlobalFooterHeight;
- (NSSet)hiddenItemIndexPaths;
- (NSString)description;
- (NSString)renderedStripsElementKind;
- (NSString)sectionHeaderElementKind;
- (PUCollectionViewLayoutTransitioningDelegate)transitioningDelegate;
- (PUGridCoordinates)_targetTransitionGridCoordsForGridCoords:(PUGridCoordinates)a3 atVisualSection:(int64_t)a4 transitionSectionInfo:(id)a5;
- (PUGridCoordinates)gridCoordinatesInSectionForItemAtVisualIndex:(int64_t)a3;
- (PUGridCoordinates)gridCoordinatesInTransitionSectionForItemAtIndexPath:(id)a3;
- (PUGridCoordinates)gridCoordinatesInVisualSectionForItemAtIndexPath:(id)a3;
- (PUGridCoordinates)targetTransitionGridCoordsForGridCoords:(PUGridCoordinates)a3 atVisualSection:(int64_t)a4 outTransitionSection:(int64_t *)a5;
- (PUGridCoordinates)visualGridCoordsForTransitionGridCoords:(PUGridCoordinates)a3 atTransitionSection:(int64_t)a4 outVisualSection:(int64_t *)a5;
- (PULayoutSampledSectioning)layoutSectioning;
- (PUSectionedGridLayout)init;
- (PUSectionedGridLayoutDelegate)delegate;
- (PUSimpleIndexPath)_itemVisualIndexPathAtPoint:(CGPoint)a3;
- (PUSimpleIndexPath)_visualIndexPathForTransitionCoordinates:(PUGridCoordinates)a3 inTransitionSection:(int64_t)a4;
- (PUSimpleIndexPath)_visualRowPathForTransitionRowIndex:(int64_t)a3 transitionSectionInfo:(id)a4;
- (UICollectionViewLayout)transitionLayout;
- (UICollectionViewLayoutAttributes)globalHeaderAttributes;
- (UIEdgeInsets)_finalContentInset;
- (UIEdgeInsets)sectionContentInset;
- (_NSRange)visualRowsInRect:(CGRect)a3 inVisualSection:(int64_t)a4 totalVisualSectionRows:(int64_t *)a5;
- (_NSRange)visualSectionsInRect:(CGRect)a3;
- (double)_delegateAccessibilitySectionHeaderHeightForSection:(int64_t)a3;
- (double)_finalSectionHeaderHeightForSection:(int64_t)a3;
- (double)_heightOfSectionAtVisualIndex:(int64_t)a3;
- (double)_sectionHeaderHeightDeltaForSection:(int64_t)a3;
- (double)_sectionWidth;
- (double)_startYOfContentAtVisualSectionIndex:(int64_t)a3;
- (double)_startYOfContentAtVisualSectionIndexWithDynamicLayout:(int64_t)a3;
- (double)_startYOfVisualSectionAtIndex:(int64_t)a3;
- (double)cropAmount;
- (double)globalBottomPadding;
- (double)globalFooterHeight;
- (double)globalHeaderHeight;
- (double)globalTopPadding;
- (double)sectionBottomPadding;
- (double)sectionTopPadding;
- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5;
- (id)_gridTransitionLayout;
- (id)_layoutAttributesForItemAtVisualIndexPath:(PUSimpleIndexPath)a3 realIndexPath:(id)a4 isMainRealItem:(BOOL)a5;
- (id)_layoutAttributesForSupplementaryViewOfKind:(id)a3 forVisualSection:(int64_t)a4 supplementaryViewIndex:(int64_t)a5;
- (id)_realItemIndexPathClosestToPoint:(CGPoint)a3 inRect:(CGRect)a4 withTest:(id)a5;
- (id)_supplementaryViewKinds;
- (id)assetIndexPathsForElementsInRect:(CGRect)a3;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)itemIndexPathAtCenterOfRect:(CGRect)a3;
- (id)itemIndexPathAtPoint:(CGPoint)a3;
- (id)itemIndexPathClosestToPoint:(CGPoint)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)mainRealIndexPathAtGridCoordinates:(PUGridCoordinates)a3 inTransitionSection:(int64_t)a4;
- (id)maxItemIndexPathAbovePoint:(CGPoint)a3;
- (id)maxItemIndexPathLeftOfPoint:(CGPoint)a3;
- (id)prepareForViewTransitionToSize:(CGSize)a3;
- (id)pu_debugRows;
- (id)pu_layoutAttributesForElementClosestToPoint:(CGPoint)a3 inRect:(CGRect)a4 passingTest:(id)a5;
- (id)realSectionsForVisualSection:(int64_t)a3 forSectioning:(id)a4;
- (id)reorderedIndexPath:(id)a3;
- (id)supplementaryViewIndexPathForVisualSection:(int64_t)a3 supplementaryViewItemIndex:(int64_t)a4;
- (id)targetTransitionRealIndexPathForIndexPath:(id)a3;
- (id)transitionAnchorIndexPathForTransitionSection:(int64_t)a3;
- (id)transitionSectionsInRect:(CGRect)a3 toOrFromGridLayout:(id)a4;
- (int64_t)_firstVisualItemIndexForRenderedStripIndex:(int64_t)a3;
- (int64_t)_floatingHeaderVisualSectionForVisibleOrigin:(CGPoint)a3;
- (int64_t)_nextVisualSectionForSupplementaryViewSection:(int64_t)a3 forward:(BOOL)a4;
- (int64_t)_renderedStripIndexForSectionRowIndex:(int64_t)a3;
- (int64_t)_visualSectionAtPoint:(CGPoint)a3;
- (int64_t)columnsPerRow;
- (int64_t)cropType;
- (int64_t)firstPreparedVisualSection;
- (int64_t)itemsPerRow;
- (int64_t)lastPreparedVisualSection;
- (int64_t)mainRealSectionForVisualSection:(int64_t)a3;
- (int64_t)maximumNumberOfItemsInVisualSection:(int64_t)a3 withNumberOfRealItems:(int64_t)a4 forSectioning:(id)a5;
- (int64_t)numberOfColumnsForWidth:(double)a3;
- (int64_t)numberOfContiguousRowsInTransitionSection:(int64_t)a3;
- (int64_t)numberOfItemsInRealSection:(int64_t)a3 forSectioning:(id)a4;
- (int64_t)numberOfRealItemsInRealSection:(int64_t)a3;
- (int64_t)numberOfRealItemsInVisualSection:(int64_t)a3;
- (int64_t)numberOfRealSections;
- (int64_t)numberOfRealSectionsForSectioning:(id)a3;
- (int64_t)numberOfRowsInVisualSection:(int64_t)a3;
- (int64_t)numberOfVisualItemsInVisualSection:(int64_t)a3;
- (int64_t)numberOfVisualSections;
- (int64_t)numberOfVisualSectionsForSectioning:(id)a3;
- (int64_t)transitionAnchorColumnOffset;
- (int64_t)visualIndexForItemAtGridCoordinates:(PUGridCoordinates)a3;
- (int64_t)visualSectionForHeaderIndexPath:(id)a3;
- (int64_t)visualSectionForRealSection:(int64_t)a3;
- (int64_t)visualSectionForSupplementaryViewIndexPath:(id)a3;
- (void)_adjustGridTransitionLayoutAttributes:(id)a3 toOrFromGridLayout:(id)a4 outTargetRowExists:(BOOL *)a5 isAppearing:(BOOL)a6;
- (void)_adjustItemLayoutAttributesForReordering:(id)a3;
- (void)_adjustRenderedStripLayoutAttributes:(id)a3 toOrFromGridLayout:(id)a4 isAppearing:(BOOL)a5;
- (void)_adjustSectionHeaderLayoutAttributes:(id)a3 toOrFromGridLayout:(id)a4 isAppearing:(BOOL)a5;
- (void)_clearLayoutCaches;
- (void)_clearRetainedCaches;
- (void)_clearSamplingCaches;
- (void)_clearSectioningCaches;
- (void)_didFinishLayoutTransitionAnimations:(BOOL)a3;
- (void)_ensureRect:(CGRect)a3 inData:(id)a4 outDeltaOriginY:(double *)a5;
- (void)_ensureVisualSection:(int64_t)a3 inData:(id)a4;
- (void)_enumerateVisualItemFramesInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)_invalidateFloatingHeadersLayout;
- (void)_invalidateLayoutWithContext:(id)a3;
- (void)_invalidateSupplementaryViewKinds;
- (void)_prepareFloatingHeadersLayoutIfNeeded;
- (void)_prepareForTransitionToOrFromGridLayout:(id)a3 isAppearing:(BOOL)a4;
- (void)_prepareLayoutIfNeeded;
- (void)_prepareSamplingDataIfNeeded;
- (void)_prepareSectioningDataIfNeeded;
- (void)_setColumnsPerRow:(int64_t)a3;
- (void)_updateHasFloatingHeaders;
- (void)adjustEffectiveContentOriginForTransitionEndContentOffset:(CGPoint)a3;
- (void)beginInsertingItemAtIndexPath:(id)a3;
- (void)beginReorderingItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)endInsertingItem;
- (void)endReordering;
- (void)enumerateItemIndexPathsForVisualSection:(int64_t)a3 inVisualItemRange:(_NSRange)a4 usingBlock:(id)a5;
- (void)enumerateRealSectionsForVisualSection:(int64_t)a3 usingBlock:(id)a4;
- (void)finalizeAnimatedBoundsChange;
- (void)finalizeCollectionViewUpdates;
- (void)finalizeLayoutTransition;
- (void)finalizeViewTransitionToSize;
- (void)getVisualSectionIndex:(int64_t *)a3 visualItemRange:(_NSRange *)a4 forRenderStripAtIndexPath:(id)a5;
- (void)invalidateLayoutForMetricsChange;
- (void)invalidateLayoutForVerticalScroll;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareForAnimatedBoundsChange:(CGRect)a3;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareForTransitionFromLayout:(id)a3;
- (void)prepareForTransitionToLayout:(id)a3;
- (void)prepareLayout;
- (void)setCachedDefaultGlobalFooterHeight:(id)a3;
- (void)setCropAmount:(double)a3;
- (void)setCropType:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDynamicLayoutEnabled:(BOOL)a3;
- (void)setFloatingSectionHeadersEnabled:(BOOL)a3;
- (void)setGlobalBottomPadding:(double)a3;
- (void)setGlobalFooterHeight:(double)a3;
- (void)setGlobalHeaderHeight:(double)a3;
- (void)setGlobalTopPadding:(double)a3;
- (void)setHiddenItemIndexPaths:(id)a3;
- (void)setInterItemSpacing:(CGSize)a3;
- (void)setIsPreparingLayout:(BOOL)a3;
- (void)setItemSize:(CGSize)a3;
- (void)setRenderedStripsElementKind:(id)a3;
- (void)setSectionBottomPadding:(double)a3;
- (void)setSectionContentInset:(UIEdgeInsets)a3;
- (void)setSectionHeaderElementKind:(id)a3;
- (void)setSectionHeadersEnabled:(BOOL)a3;
- (void)setSectionTopPadding:(double)a3;
- (void)setTransitionAnchorShiftsColumns:(BOOL)a3;
- (void)setTransitionEffectiveContentOrigin:(CGPoint)a3;
- (void)setTransitionExplicitAnchorItemIndexPath:(id)a3;
- (void)setTransitionIsAnimated:(BOOL)a3;
- (void)setTransitionStartContentOffset:(CGPoint)a3;
- (void)setTransitionZoomingOut:(BOOL)a3;
- (void)setTransitioningDelegate:(id)a3;
- (void)setUsesAspectItems:(BOOL)a3;
- (void)setUsesRenderedStripTopExtendersForTransitions:(BOOL)a3;
- (void)updateReorderingTargetIndexPath:(id)a3;
@end

@implementation PUSectionedGridLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedStripsElementKind, 0);
  objc_storeStrong((id *)&self->_cachedDefaultGlobalFooterHeight, 0);
  objc_storeStrong((id *)&self->_layoutSectioning, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transitionLastVisibleRowVisualPath, 0);
  objc_storeStrong((id *)&self->_transitionFirstVisibleRowVisualPath, 0);
  objc_storeStrong((id *)&self->_transitionExplicitAnchorItemIndexPath, 0);
  objc_storeStrong((id *)&self->_transitionLayout, 0);
  objc_destroyWeak((id *)&self->_transitioningDelegate);
  objc_storeStrong((id *)&self->_sectionHeaderElementKind, 0);
  objc_storeStrong((id *)&self->_hiddenItemIndexPaths, 0);
  objc_storeStrong(&self->_transitionAnimationEndCleanupBlock, 0);
  objc_storeStrong((id *)&self->_transitionAnimationsHelper, 0);
  objc_storeStrong((id *)&self->_reorderingInsertedIndexPath, 0);
  objc_storeStrong((id *)&self->_reorderingTargetIndexPath, 0);
  objc_storeStrong((id *)&self->_reorderingSourceIndexPath, 0);
  objc_storeStrong((id *)&self->_layoutData, 0);
  objc_storeStrong((id *)&self->_axLargeTextSectionHeaderHeightByVisualSection, 0);
  objc_storeStrong((id *)&self->_transitionSectionInfosByVisualSection, 0);
  objc_storeStrong((id *)&self->_transitionSectionInfosByTransitionSection, 0);
  objc_storeStrong((id *)&self->_cachedFloatingHeaderInvalidationContext, 0);
  objc_storeStrong((id *)&self->_viewSizeTransitionAnchorItem, 0);
  objc_storeStrong((id *)&self->_deletedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedSections, 0);
  objc_storeStrong((id *)&self->_cachedNonHeaderLayoutAttributesInRect, 0);
  objc_storeStrong((id *)&self->_samplingHelpersByVisualSection, 0);
  objc_storeStrong((id *)&self->_visualToRealSectionIndexes, 0);
  objc_storeStrong((id *)&self->_realToVisualSections, 0);
  objc_storeStrong((id *)&self->_supplementaryViewKinds, 0);
  objc_storeStrong((id *)&self->_globalFooterAttributes, 0);
  objc_storeStrong((id *)&self->_globalHeaderAttributes, 0);
}

- (BOOL)usesAspectItems
{
  return self->_usesAspectItems;
}

- (void)setUsesRenderedStripTopExtendersForTransitions:(BOOL)a3
{
  self->_usesRenderedStripTopExtendersForTransitions = a3;
}

- (BOOL)usesRenderedStripTopExtendersForTransitions
{
  return self->_usesRenderedStripTopExtendersForTransitions;
}

- (double)cropAmount
{
  return self->_cropAmount;
}

- (int64_t)cropType
{
  return self->_cropType;
}

- (NSString)renderedStripsElementKind
{
  return self->_renderedStripsElementKind;
}

- (BOOL)dynamicLayoutEnabled
{
  return self->_dynamicLayoutEnabled;
}

- (void)setCachedDefaultGlobalFooterHeight:(id)a3
{
}

- (NSNumber)cachedDefaultGlobalFooterHeight
{
  return self->_cachedDefaultGlobalFooterHeight;
}

- (double)globalFooterHeight
{
  return self->_globalFooterHeight;
}

- (void)setGlobalHeaderHeight:(double)a3
{
  self->_globalHeaderHeight = a3;
}

- (double)globalHeaderHeight
{
  return self->_globalHeaderHeight;
}

- (BOOL)floatingSectionHeadersEnabled
{
  return self->_floatingSectionHeadersEnabled;
}

- (UIEdgeInsets)sectionContentInset
{
  double top = self->_sectionContentInset.top;
  double left = self->_sectionContentInset.left;
  double bottom = self->_sectionContentInset.bottom;
  double right = self->_sectionContentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)sectionBottomPadding
{
  return self->_sectionBottomPadding;
}

- (CGSize)itemSize
{
  double width = self->_itemSize.width;
  double height = self->_itemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)interItemSpacing
{
  double width = self->_interItemSpacing.width;
  double height = self->_interItemSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PULayoutSampledSectioning)layoutSectioning
{
  return self->_layoutSectioning;
}

- (UICollectionViewLayoutAttributes)globalHeaderAttributes
{
  return self->_globalHeaderAttributes;
}

- (void)_setColumnsPerRow:(int64_t)a3
{
  self->_columnsPerRow = a3;
}

- (int64_t)columnsPerRow
{
  return self->_columnsPerRow;
}

- (PUSectionedGridLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUSectionedGridLayoutDelegate *)WeakRetained;
}

- (NSIndexPath)transitionLastVisibleRowVisualPath
{
  return self->_transitionLastVisibleRowVisualPath;
}

- (NSIndexPath)transitionFirstVisibleRowVisualPath
{
  return self->_transitionFirstVisibleRowVisualPath;
}

- (void)setTransitionZoomingOut:(BOOL)a3
{
  self->_transitionZoomingOut = a3;
}

- (BOOL)transitionZoomingOut
{
  return self->_transitionZoomingOut;
}

- (void)setTransitionExplicitAnchorItemIndexPath:(id)a3
{
}

- (NSIndexPath)transitionExplicitAnchorItemIndexPath
{
  return self->_transitionExplicitAnchorItemIndexPath;
}

- (void)setTransitionAnchorShiftsColumns:(BOOL)a3
{
  self->_transitionAnchorShiftsColumns = a3;
}

- (BOOL)transitionAnchorShiftsColumns
{
  return self->_transitionAnchorShiftsColumns;
}

- (int64_t)transitionAnchorColumnOffset
{
  return self->_transitionAnchorColumnOffset;
}

- (void)setTransitionEffectiveContentOrigin:(CGPoint)a3
{
  self->_transitionEffectiveContentOrigin = a3;
}

- (CGPoint)transitionEffectiveContentOrigin
{
  double x = self->_transitionEffectiveContentOrigin.x;
  double y = self->_transitionEffectiveContentOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)transitionEndContentOffset
{
  double x = self->_transitionEndContentOffset.x;
  double y = self->_transitionEndContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTransitionIsAnimated:(BOOL)a3
{
  self->_transitionIsAnimated = a3;
}

- (BOOL)transitionIsAnimated
{
  return self->_transitionIsAnimated;
}

- (void)setTransitionStartContentOffset:(CGPoint)a3
{
  self->_transitionStartContentOffset = a3;
}

- (CGPoint)transitionStartContentOffset
{
  double x = self->_transitionStartContentOffset.x;
  double y = self->_transitionStartContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UICollectionViewLayout)transitionLayout
{
  return self->_transitionLayout;
}

- (BOOL)transitionIsAppearing
{
  return self->_transitionIsAppearing;
}

- (double)globalBottomPadding
{
  return self->_globalBottomPadding;
}

- (double)globalTopPadding
{
  return self->_globalTopPadding;
}

- (void)setTransitioningDelegate:(id)a3
{
}

- (PUCollectionViewLayoutTransitioningDelegate)transitioningDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitioningDelegate);
  return (PUCollectionViewLayoutTransitioningDelegate *)WeakRetained;
}

- (double)sectionTopPadding
{
  return self->_sectionTopPadding;
}

- (BOOL)sectionHeadersEnabled
{
  return self->_sectionHeadersEnabled;
}

- (NSString)sectionHeaderElementKind
{
  return self->_sectionHeaderElementKind;
}

- (NSSet)hiddenItemIndexPaths
{
  return self->_hiddenItemIndexPaths;
}

- (id)pu_debugRows
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__PUSectionedGridLayout_pu_debugRows__block_invoke;
  v5[3] = &unk_1E5F2BE60;
  v5[4] = self;
  v2 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:output:", @"Dump Sectioning", v5);
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v3;
}

id __37__PUSectionedGridLayout_pu_debugRows__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 728) sectioningDescription];
  v3 = [*(id *)(*(void *)(a1 + 32) + 728) sectioningHash];
  v4 = [NSString stringWithFormat:@"Hash: %@\n\n%@", v3, v2];

  return v4;
}

- (void)endInsertingItem
{
  reorderingInsertedIndexPath = self->_reorderingInsertedIndexPath;
  self->_reorderingInsertedIndexPath = 0;

  [(PUSectionedGridLayout *)self invalidateLayout];
}

- (void)beginInsertingItemAtIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_reorderingInsertedIndexPath, a3);
  [(PUSectionedGridLayout *)self invalidateLayout];
}

- (id)reorderedIndexPath:(id)a3
{
  return (id)objc_msgSend(a3, "pu_alteredIndexPathAfterMovingItemAtIndexPath:toIndexPath:", self->_reorderingSourceIndexPath, self->_reorderingTargetIndexPath);
}

- (void)endReordering
{
  reorderingSourceIndexPath = self->_reorderingSourceIndexPath;
  self->_reorderingSourceIndexPath = 0;

  reorderingTargetIndexPath = self->_reorderingTargetIndexPath;
  self->_reorderingTargetIndexPath = 0;

  [(PUSectionedGridLayout *)self invalidateLayout];
}

- (void)updateReorderingTargetIndexPath:(id)a3
{
  id v4 = a3;
  if (([v4 isEqual:self->_reorderingTargetIndexPath] & 1) == 0)
  {
    v5 = [(PUSectionedGridLayout *)self collectionView];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __57__PUSectionedGridLayout_updateReorderingTargetIndexPath___block_invoke;
    v6[3] = &unk_1E5F2ECC8;
    v6[4] = self;
    id v7 = v4;
    [v5 performBatchUpdates:v6 completion:0];
  }
}

uint64_t __57__PUSectionedGridLayout_updateReorderingTargetIndexPath___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 552), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  return [v2 invalidateLayout];
}

- (void)beginReorderingItemAtIndexPath:(id)a3
{
  v5 = (NSIndexPath *)a3;
  objc_storeStrong((id *)&self->_reorderingTargetIndexPath, a3);
  reorderingSourceIndexPath = self->_reorderingSourceIndexPath;
  self->_reorderingSourceIndexPath = v5;

  [(PUSectionedGridLayout *)self invalidateLayout];
}

- (void)_adjustItemLayoutAttributesForReordering:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_reorderingSourceIndexPath)
  {
    v17 = v4;
    uint64_t v6 = [v4 representedElementCategory];
    v5 = v17;
    if (!v6)
    {
      id v7 = [v17 indexPath];
      v8 = [(PUSectionedGridLayout *)self reorderedIndexPath:v7];
      if (([v8 isEqual:v7] & 1) == 0)
      {
        layoutSectioning = self->_layoutSectioning;
        id v10 = v8;
        uint64_t v11 = [v10 item];
        uint64_t v12 = [v10 section];

        uint64_t v13 = -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", v12, v11, 0);
        uint64_t v15 = [(PUSectionedGridLayout *)self gridCoordinatesInSectionForItemAtVisualIndex:v14];
        -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:](self, "frameForItemAtGridCoordinates:inVisualSection:", v15, v16, v13);
        objc_msgSend(v17, "setFrame:");
      }
      if ([v7 isEqual:self->_reorderingSourceIndexPath]) {
        [v17 setHidden:1];
      }
      if ([v7 isEqual:self->_reorderingInsertedIndexPath]) {
        [v17 setAlpha:0.0];
      }

      v5 = v17;
    }
  }
}

- (PUGridCoordinates)gridCoordinatesInTransitionSectionForItemAtIndexPath:(id)a3
{
  layoutSectioning = self->_layoutSectioning;
  id v5 = a3;
  uint64_t v6 = [v5 item];
  uint64_t v7 = [v5 section];

  uint64_t v8 = -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", v7, v6, 0);
  uint64_t v10 = [(PUSectionedGridLayout *)self gridCoordinatesInSectionForItemAtVisualIndex:v9];
  int64_t v12 = v11;
  transitionSectionInfosByVisualSection = self->_transitionSectionInfosByVisualSection;
  uint64_t v14 = [NSNumber numberWithInteger:v8];
  uint64_t v15 = [(NSDictionary *)transitionSectionInfosByVisualSection objectForKey:v14];

  if (v15)
  {
    uint64_t v16 = [v15 visualSections];
    v17 = [v15 visualRowStartMarkers];
    v18 = v17;
    if (v16) {
      BOOL v19 = v17 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    if (!v19)
    {
      v20 = objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v16, "countOfIndexesInRange:", 0, v8));
      v10 += [v20 integerValue];
    }
  }

  int64_t v21 = v10;
  int64_t v22 = v12;
  result.column = v22;
  result.row = v21;
  return result;
}

- (PUGridCoordinates)gridCoordinatesInVisualSectionForItemAtIndexPath:(id)a3
{
  layoutSectioning = self->_layoutSectioning;
  id v5 = a3;
  uint64_t v6 = [v5 item];
  uint64_t v7 = [v5 section];

  -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", v7, v6, 0);
  int64_t v9 = [(PUSectionedGridLayout *)self gridCoordinatesInSectionForItemAtVisualIndex:v8];
  result.column = v10;
  result.row = v9;
  return result;
}

- (id)pu_layoutAttributesForElementClosestToPoint:(CGPoint)a3 inRect:(CGRect)a4 passingTest:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = a3.y;
  double v10 = a3.x;
  id v12 = a5;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  BOOL v19 = __88__PUSectionedGridLayout_pu_layoutAttributesForElementClosestToPoint_inRect_passingTest___block_invoke;
  v20 = &unk_1E5F2BE38;
  int64_t v21 = self;
  id v22 = v12;
  id v13 = v12;
  uint64_t v14 = -[PUSectionedGridLayout _realItemIndexPathClosestToPoint:inRect:withTest:](self, "_realItemIndexPathClosestToPoint:inRect:withTest:", &v17, v10, v9, x, y, width, height);
  uint64_t v15 = -[PUSectionedGridLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v14, v17, v18, v19, v20, v21);

  return v15;
}

uint64_t __88__PUSectionedGridLayout_pu_layoutAttributesForElementClosestToPoint_inRect_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:a2];
  id v5 = [*(id *)(a1 + 32) layoutAttributesForItemAtIndexPath:v4];
  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

  return v6;
}

- (id)_realItemIndexPathClosestToPoint:(CGPoint)a3 inRect:(CGRect)a4 withTest:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v9 = a3.y;
  CGFloat v10 = a3.x;
  id v12 = a5;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3010000000;
  v29 = "";
  int64x2_t v30 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0x7FEFFFFFFFFFFFFFLL;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__PUSectionedGridLayout__realItemIndexPathClosestToPoint_inRect_withTest___block_invoke;
  v19[3] = &unk_1E5F2BE10;
  id v13 = v12;
  CGFloat v23 = v10;
  CGFloat v24 = v9;
  id v20 = v13;
  int64_t v21 = v25;
  id v22 = &v26;
  -[PUSectionedGridLayout _enumerateVisualItemFramesInRect:usingBlock:](self, "_enumerateVisualItemFramesInRect:usingBlock:", v19, x, y, width, height);
  uint64_t v14 = v27[4];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v16 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v14, v27[5]);
    uint64_t v15 = [MEMORY[0x1E4F28D58] indexPathForItem:v17 inSection:v16];
  }

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

uint64_t __74__PUSectionedGridLayout__realItemIndexPathClosestToPoint_inRect_withTest___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1[4];
  if (!v6 || (uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a3), result))
  {
    uint64_t result = UIDistanceBetweenPointAndRect();
    uint64_t v9 = *(void *)(a1[5] + 8);
    if (v8 < *(double *)(v9 + 24))
    {
      *(double *)(v9 + 24) = v8;
      uint64_t v10 = *(void *)(a1[6] + 8);
      *(void *)(v10 + 32) = a2;
      *(void *)(v10 + 40) = a3;
    }
  }
  return result;
}

- (PUSimpleIndexPath)_visualIndexPathForTransitionCoordinates:(PUGridCoordinates)a3 inTransitionSection:(int64_t)a4
{
  int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3.column < 0) {
    goto LABEL_6;
  }
  int64_t row = a3.row;
  int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if ((a3.row & 0x8000000000000000) == 0)
  {
    int64_t column = a3.column;
    if (a3.column < self->_columnsPerRow)
    {
      int64_t v13 = 0;
      uint64_t v10 = -[PUSectionedGridLayout visualGridCoordsForTransitionGridCoords:atTransitionSection:outVisualSection:](self, "visualGridCoordsForTransitionGridCoords:atTransitionSection:outVisualSection:", a3.row, a3.column, a4, &v13);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSLog(&cfstr_CouldNotFindVi.isa, row, column, a4);
LABEL_6:
        int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_10;
      }
      int64_t v4 = -[PUSectionedGridLayout visualIndexForItemAtGridCoordinates:](self, "visualIndexForItemAtGridCoordinates:", v10, v11);
      if (v4 < [(PUSectionedGridLayout *)self numberOfVisualItemsInVisualSection:v13])
      {
        int64_t v7 = v13;
      }
      else
      {
        int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
        int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
LABEL_10:
  int64_t v12 = v4;
  result.var1 = v12;
  result.var0 = v7;
  return result;
}

- (BOOL)hasItemAtGridCoordinates:(PUGridCoordinates)a3 inTransitionSection:(int64_t)a4
{
  -[PUSectionedGridLayout _visualIndexPathForTransitionCoordinates:inTransitionSection:](self, "_visualIndexPathForTransitionCoordinates:inTransitionSection:", a3.row, a3.column, a4);
  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)mainRealIndexPathAtGridCoordinates:(PUGridCoordinates)a3 inTransitionSection:(int64_t)a4
{
  uint64_t v5 = -[PUSectionedGridLayout _visualIndexPathForTransitionCoordinates:inTransitionSection:](self, "_visualIndexPathForTransitionCoordinates:inTransitionSection:", a3.row, a3.column, a4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v5, v6);
    int64_t v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:v8];
  }
  return v7;
}

- (id)targetTransitionRealIndexPathForIndexPath:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PUSectionedGridLayout *)self _gridTransitionLayout];

  if (!v6)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"PUSectionedGridLayout.m" lineNumber:3552 description:@"Cannot be called if a grid transition is not ongoing."];
  }
  layoutSectioning = self->_layoutSectioning;
  id v8 = v5;
  uint64_t v9 = [v8 item];
  uint64_t v10 = [v8 section];

  uint64_t v11 = -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", v10, v9, 0);
  uint64_t v13 = [(PUSectionedGridLayout *)self gridCoordinatesInSectionForItemAtVisualIndex:v12];
  uint64_t v15 = v14;
  transitionSectionInfosByVisualSection = self->_transitionSectionInfosByVisualSection;
  uint64_t v17 = [NSNumber numberWithInteger:v11];
  uint64_t v18 = [(NSDictionary *)transitionSectionInfosByVisualSection objectForKey:v17];

  uint64_t v19 = -[PUSectionedGridLayout _targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:](self, "_targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:", v13, v15, v11, v18);
  uint64_t v21 = v20;
  id v22 = [(PUSectionedGridLayout *)self _gridTransitionLayout];
  CGFloat v23 = objc_msgSend(v22, "mainRealIndexPathAtGridCoordinates:inTransitionSection:", v19, v21, objc_msgSend(v18, "transitionSection"));

  return v23;
}

- (PUGridCoordinates)visualGridCoordsForTransitionGridCoords:(PUGridCoordinates)a3 atTransitionSection:(int64_t)a4 outVisualSection:(int64_t *)a5
{
  int64_t column = a3.column;
  int64_t row = a3.row;
  uint64_t v9 = [NSNumber numberWithInteger:a4];
  uint64_t v10 = [(NSDictionary *)self->_transitionSectionInfosByTransitionSection objectForKey:v9];
  int64_t v11 = [(PUSectionedGridLayout *)self _visualRowPathForTransitionRowIndex:row transitionSectionInfo:v10];
  int64_t v13 = v12;
  if (a5) {
    *a5 = v11;
  }

  int64_t v14 = v13;
  int64_t v15 = column;
  result.int64_t column = v15;
  result.int64_t row = v14;
  return result;
}

- (PUGridCoordinates)targetTransitionGridCoordsForGridCoords:(PUGridCoordinates)a3 atVisualSection:(int64_t)a4 outTransitionSection:(int64_t *)a5
{
  int64_t column = a3.column;
  int64_t row = a3.row;
  transitionSectionInfosByVisualSection = self->_transitionSectionInfosByVisualSection;
  int64_t v11 = [NSNumber numberWithInteger:a4];
  int64_t v12 = [(NSDictionary *)transitionSectionInfosByVisualSection objectForKey:v11];

  uint64_t v13 = -[PUSectionedGridLayout _targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:](self, "_targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:", row, column, a4, v12);
  int64_t v15 = v14;
  if (a5) {
    *a5 = [v12 transitionSection];
  }

  int64_t v16 = v13;
  int64_t v17 = v15;
  result.int64_t column = v17;
  result.int64_t row = v16;
  return result;
}

- (id)transitionAnchorIndexPathForTransitionSection:(int64_t)a3
{
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSDictionary *)self->_transitionSectionInfosByTransitionSection objectForKey:v4];
  uint64_t v6 = [v5 anchorRealPath];

  return v6;
}

- (id)transitionSectionsInRect:(CGRect)a3 toOrFromGridLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  unint64_t v10 = -[PUSectionedGridLayout visualSectionsInRect:](self, "visualSectionsInRect:", x, y, width, height);
  uint64_t v12 = v11;
  BOOL v13 = [(PUSectionedGridLayout *)self _visualSectionsMatchTransitionSectionsToOrFromLayout:v9];
  id v14 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  int64_t v15 = v14;
  if (v13)
  {
    objc_msgSend(v14, "addIndexesInRange:", v10, v12);
  }
  else if (v10 < v10 + v12)
  {
    do
    {
      int64_t v16 = [(PULayoutSampledSectioning *)self->_layoutSectioning mainRealSectionForVisualSection:v10];
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v17 = [v9 visualSectionForRealSection:v16];
        if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
          [v15 addIndex:v17];
        }
      }
      ++v10;
      --v12;
    }
    while (v12);
  }

  return v15;
}

- (id)maxItemIndexPathLeftOfPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  uint64_t v23 = 0;
  CGFloat v24 = &v23;
  uint64_t v25 = 0x3010000000;
  uint64_t v26 = "";
  int64x2_t v27 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  uint64_t v6 = [(PUSectionedGridLayout *)self collectionView];
  [v6 bounds];

  [(PUSectionedGridLayout *)self interItemSpacing];
  int64_t v7 = [(PUSectionedGridLayout *)self collectionView];
  [v7 bounds];

  [(PUSectionedGridLayout *)self interItemSpacing];
  id v8 = [(PUSectionedGridLayout *)self collectionView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __53__PUSectionedGridLayout_maxItemIndexPathLeftOfPoint___block_invoke;
  v22[3] = &unk_1E5F2BDE8;
  *(CGFloat *)&v22[6] = x;
  *(CGFloat *)&v22[7] = y;
  v22[4] = self;
  v22[5] = &v23;
  -[PUSectionedGridLayout _enumerateVisualItemFramesInRect:usingBlock:](self, "_enumerateVisualItemFramesInRect:usingBlock:", v22, v10, v12, v14, v16);
  uint64_t v17 = v24[4];
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v19 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v17, v24[5]);
    uint64_t v18 = [MEMORY[0x1E4F28D58] indexPathForItem:v20 inSection:v19];
  }
  _Block_object_dispose(&v23, 8);
  return v18;
}

uint64_t __53__PUSectionedGridLayout_maxItemIndexPathLeftOfPoint___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, double a4, double a5)
{
  double v5 = *(double *)(result + 56);
  if (a5 < v5 && a5 + *(double *)(*(void *)(result + 32) + 848) > v5 && a4 < *(double *)(result + 48))
  {
    uint64_t v6 = *(void *)(*(void *)(result + 40) + 8);
    uint64_t v7 = *(void *)(v6 + 32);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || (id v8 = (void *)(v6 + 40), v9 = *(void *)(v6 + 40), v9 == 0x7FFFFFFFFFFFFFFFLL))
    {
      *(void *)(v6 + 32) = a2;
      id v8 = (void *)(v6 + 40);
LABEL_13:
      void *v8 = a3;
      return result;
    }
    if (a2 > v7 || (a2 == v7 ? (BOOL v10 = a3 <= v9) : (BOOL v10 = 1), !v10))
    {
      *(void *)(v6 + 32) = a2;
      goto LABEL_13;
    }
  }
  return result;
}

- (id)maxItemIndexPathAbovePoint:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3010000000;
  id v22 = "";
  int64x2_t v23 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  uint64_t v6 = [(PUSectionedGridLayout *)self collectionView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__PUSectionedGridLayout_maxItemIndexPathAbovePoint___block_invoke;
  v18[3] = &unk_1E5F2BDC0;
  *(CGFloat *)&v18[5] = x;
  *(double *)&v18[6] = y;
  v18[4] = &v19;
  -[PUSectionedGridLayout _enumerateVisualItemFramesInRect:usingBlock:](self, "_enumerateVisualItemFramesInRect:usingBlock:", v18, v8, v10, v12, y);
  uint64_t v13 = v20[4];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v14 = 0;
  }
  else
  {
    uint64_t v15 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v13, v20[5]);
    double v14 = [MEMORY[0x1E4F28D58] indexPathForItem:v16 inSection:v15];
  }
  _Block_object_dispose(&v19, 8);
  return v14;
}

uint64_t __52__PUSectionedGridLayout_maxItemIndexPathAbovePoint___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, double a4, double a5)
{
  if (a5 < *(double *)(result + 48))
  {
    uint64_t v5 = *(void *)(*(void *)(result + 32) + 8);
    uint64_t v6 = *(void *)(v5 + 32);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL || (double v7 = (void *)(v5 + 40), v8 = *(void *)(v5 + 40), v8 == 0x7FFFFFFFFFFFFFFFLL))
    {
      *(void *)(v5 + 32) = a2;
      double v7 = (void *)(v5 + 40);
LABEL_11:
      *double v7 = a3;
      return result;
    }
    if (a2 > v6 || (a2 == v6 ? (BOOL v9 = a3 <= v8) : (BOOL v9 = 1), !v9))
    {
      *(void *)(v5 + 32) = a2;
      goto LABEL_11;
    }
  }
  return result;
}

- (id)itemIndexPathClosestToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  double v6 = self->_contentSize.width * 0.5;
  return -[PUSectionedGridLayout _realItemIndexPathClosestToPoint:inRect:withTest:](self, "_realItemIndexPathClosestToPoint:inRect:withTest:", 0, x, y, x - v6, y - v6);
}

- (id)itemIndexPathAtPoint:(CGPoint)a3
{
  uint64_t v4 = -[PUSectionedGridLayout _itemVisualIndexPathAtPoint:](self, "_itemVisualIndexPathAtPoint:", a3.x, a3.y);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v6 = 0;
  }
  else
  {
    uint64_t v7 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v4, v5);
    double v6 = [MEMORY[0x1E4F28D58] indexPathForItem:v8 inSection:v7];
  }
  return v6;
}

- (id)itemIndexPathAtCenterOfRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  return -[PUSectionedGridLayout _realItemIndexPathClosestToPoint:inRect:withTest:](self, "_realItemIndexPathClosestToPoint:inRect:withTest:", 0, x + width * 0.5, y + height * 0.5, x, y, width, height);
}

- (int64_t)numberOfRowsInVisualSection:(int64_t)a3
{
  return vcvtpd_s64_f64((double)[(PUSectionedGridLayout *)self numberOfVisualItemsInVisualSection:a3]/ (double)self->_columnsPerRow);
}

- (int64_t)numberOfVisualItemsInVisualSection:(int64_t)a3
{
  return [(PULayoutSampledSectioning *)self->_layoutSectioning numberOfVisualItemsInVisualSection:a3];
}

- (int64_t)numberOfRealItemsInVisualSection:(int64_t)a3
{
  if (self->_totalVisualSections <= a3)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUSectionedGridLayout.m", 3354, @"Requested count for visual section (%ld) beyond bounds (%ld).", a3, self->_totalVisualSections);
  }
  layoutSectioning = self->_layoutSectioning;
  return [(PULayoutSampledSectioning *)layoutSectioning numberOfRealItemsInVisualSection:a3];
}

- (int64_t)numberOfRealItemsInRealSection:(int64_t)a3
{
  if (self->_totalRealSections <= a3)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUSectionedGridLayout.m", 3348, @"Requested count for real section (%ld) beyond bounds (%ld).", a3, self->_totalRealSections);
  }
  return self->_realSectionItemCounts[a3];
}

- (int64_t)numberOfRealSections
{
  return self->_totalRealSections;
}

- (void)enumerateRealSectionsForVisualSection:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  [(PULayoutSampledSectioning *)self->_layoutSectioning enumerateRealSectionsForVisualSection:a3 usingBlock:v6];
}

- (int64_t)mainRealSectionForVisualSection:(int64_t)a3
{
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  layoutSectioning = self->_layoutSectioning;
  return [(PULayoutSampledSectioning *)layoutSectioning mainRealSectionForVisualSection:a3];
}

- (int64_t)visualSectionForRealSection:(int64_t)a3
{
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  layoutSectioning = self->_layoutSectioning;
  return [(PULayoutSampledSectioning *)layoutSectioning visualSectionForRealSection:a3];
}

- (BOOL)shouldHideVisualSection:(int64_t)a3
{
  return ![(PULayoutSampledSectioning *)self->_layoutSectioning numberOfRealItemsInVisualSection:a3]|| [(PULayoutSampledSectioning *)self->_layoutSectioning mainRealSectionForVisualSection:a3] == 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)numberOfVisualSections
{
  return self->_totalVisualSections;
}

- (int64_t)itemsPerRow
{
  return self->_columnsPerRow;
}

- (int64_t)_renderedStripIndexForSectionRowIndex:(int64_t)a3
{
  return a3;
}

- (int64_t)_firstVisualItemIndexForRenderedStripIndex:(int64_t)a3
{
  return self->_columnsPerRow * a3;
}

- (void)getVisualSectionIndex:(int64_t *)a3 visualItemRange:(_NSRange *)a4 forRenderStripAtIndexPath:(id)a5
{
  id v13 = a5;
  [(PUSectionedGridLayout *)self _prepareFloatingHeadersLayoutIfNeeded];
  int64_t v8 = [(PUSectionedGridLayout *)self visualSectionForSupplementaryViewIndexPath:v13];
  *a3 = v8;
  NSUInteger v9 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t columnsPerRow = self->_columnsPerRow;
    int64_t v12 = -[PUSectionedGridLayout numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:");
    NSUInteger v9 = -[PUSectionedGridLayout _firstVisualItemIndexForRenderedStripIndex:](self, "_firstVisualItemIndexForRenderedStripIndex:", [v13 item]);
    NSUInteger v10 = v12 - v9;
    if (columnsPerRow < (uint64_t)(v12 - v9)) {
      NSUInteger v10 = columnsPerRow;
    }
  }
  a4->location = v9;
  a4->length = v10;
}

- (void)enumerateItemIndexPathsForVisualSection:(int64_t)a3 inVisualItemRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  [(PUSectionedGridLayout *)self _prepareSamplingDataIfNeeded];
  -[PULayoutSampledSectioning enumerateRealMainItemIndexPathsForVisualSection:inVisualItemRange:usingBlock:](self->_layoutSectioning, "enumerateRealMainItemIndexPathsForVisualSection:inVisualItemRange:usingBlock:", a3, location, length, v9);
}

- (void)setRenderedStripsElementKind:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  if (self->_renderedStripsElementKind != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_renderedStripsElementKind, a3);
    self->_usesRenderedStrips = self->_renderedStripsElementKind != 0;
    [(PUSectionedGridLayout *)self _invalidateSupplementaryViewKinds];
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
    uint64_t v5 = v6;
  }
}

- (int64_t)visualSectionForHeaderIndexPath:(id)a3
{
  id v4 = a3;
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  int64_t v5 = [(PUSectionedGridLayout *)self visualSectionForSupplementaryViewIndexPath:v4];

  return v5;
}

- (int64_t)_nextVisualSectionForSupplementaryViewSection:(int64_t)a3 forward:(BOOL)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t result = a4 ? a3 + 1 : a3 - 1;
  if (result < 0 || result >= self->_totalVisualSections) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (int64_t)numberOfItemsInRealSection:(int64_t)a3 forSectioning:(id)a4
{
  if (!self->_sectioningDataIsValid) {
    [(PUSectionedGridLayout *)self _prepareSectioningDataIfNeeded];
  }
  return self->_realSectionItemCounts[a3];
}

- (id)realSectionsForVisualSection:(int64_t)a3 forSectioning:(id)a4
{
  id v6 = a4;
  if (!self->_sectioningDataIsValid) {
    [(PUSectionedGridLayout *)self _prepareSectioningDataIfNeeded];
  }
  if (self->_delegateSupportsGroupedSections)
  {
    uint64_t v7 = [(PUSectionedGridLayout *)self delegate];
    int64_t v8 = [v7 sectionedGridLayout:self sectionsForVisualSection:a3];
  }
  else
  {
    int64_t v8 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  }

  return v8;
}

- (int64_t)numberOfRealSectionsForSectioning:(id)a3
{
  if (!self->_sectioningDataIsValid) {
    [(PUSectionedGridLayout *)self _prepareSectioningDataIfNeeded];
  }
  return self->_totalRealSections;
}

- (int64_t)maximumNumberOfItemsInVisualSection:(int64_t)a3 withNumberOfRealItems:(int64_t)a4 forSectioning:(id)a5
{
  id v8 = a5;
  if (!self->_samplingDataIsValid) {
    [(PUSectionedGridLayout *)self _prepareSamplingDataIfNeeded];
  }
  int64_t columnsPerRow = self->_columnsPerRow;
  if (columnsPerRow >= 1
    && (visualSectionMaxRows = self->_visualSectionMaxRows) != 0
    && (uint64_t v11 = visualSectionMaxRows[a3], v11 >= 1))
  {
    int64_t v12 = a4 / columnsPerRow;
    if ((unint64_t)(a4 / columnsPerRow) <= 1) {
      int64_t v12 = 1;
    }
    if (v12 < v11) {
      uint64_t v11 = v12;
    }
    int64_t v13 = v11 * columnsPerRow;
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

- (int64_t)numberOfVisualSectionsForSectioning:(id)a3
{
  if (!self->_sectioningDataIsValid) {
    [(PUSectionedGridLayout *)self _prepareSectioningDataIfNeeded];
  }
  return self->_totalVisualSections;
}

- (void)_ensureVisualSection:(int64_t)a3 inData:(id)a4
{
  id v23 = a4;
  id v6 = [v23 headerLayoutAttributes];
  uint64_t v7 = [v6 count];

  if (!v7) {
    [(PUSectionedGridLayout *)self _ensureUpdatedLayoutData:v23 isForward:1 outDeltaOriginY:0];
  }
  id v8 = [(PUSectionedGridLayout *)self supplementaryViewIndexPathForVisualSection:a3 supplementaryViewItemIndex:0];
  id v9 = [v23 headerLayoutAttributes];
  NSUInteger v10 = [v9 firstObject];
  uint64_t v11 = [v10 indexPath];

  while ([v8 compare:v11] == -1)
  {
    BOOL v12 = [(PUSectionedGridLayout *)self _ensureUpdatedLayoutData:v23 isForward:0 outDeltaOriginY:0];
    int64_t v13 = [v23 headerLayoutAttributes];
    double v14 = [v13 firstObject];
    uint64_t v15 = [v14 indexPath];

    uint64_t v11 = v15;
    if (!v12) {
      goto LABEL_8;
    }
  }
  uint64_t v15 = v11;
LABEL_8:
  uint64_t v16 = [v23 headerLayoutAttributes];
  uint64_t v17 = [v16 lastObject];
  uint64_t v18 = [v17 indexPath];

  while ([v8 compare:v18] == 1)
  {
    BOOL v19 = [(PUSectionedGridLayout *)self _ensureUpdatedLayoutData:v23 isForward:1 outDeltaOriginY:0];
    uint64_t v20 = [v23 headerLayoutAttributes];
    uint64_t v21 = [v20 lastObject];
    id v22 = [v21 indexPath];

    uint64_t v18 = v22;
    if (!v19) {
      goto LABEL_13;
    }
  }
  id v22 = v18;
LABEL_13:
}

- (void)_ensureRect:(CGRect)a3 inData:(id)a4 outDeltaOriginY:(double *)a5
{
  CGFloat width = a3.size.width;
  CGFloat height = a3.size.height;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  NSUInteger v10 = v9;
  double v11 = -y;
  if (y >= 0.0) {
    double v11 = 0.0;
  }
  double v51 = 0.0;
  objc_msgSend(v9, "currentContentBounds", *(void *)&v11);
  CGFloat v12 = v52.origin.x;
  CGFloat v13 = v52.origin.y;
  CGFloat v14 = v52.size.width;
  CGFloat v15 = v52.size.height;
  if (CGRectIsEmpty(v52))
  {
    [(PUSectionedGridLayout *)self _ensureUpdatedLayoutData:v10 isForward:1 outDeltaOriginY:&v51];
    [v10 currentContentBounds];
    CGFloat v12 = v16;
    CGFloat v13 = v17;
    CGFloat v14 = v18;
    CGFloat v15 = v19;
    double v20 = v51;
  }
  else
  {
    double v20 = 0.0;
  }
  double v21 = y + v20;
  do
  {
    v53.origin.CGFloat x = x;
    v53.origin.double y = v21;
    v53.size.CGFloat width = width;
    v53.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v53);
    v54.origin.CGFloat x = v12;
    v54.origin.double y = v13;
    v54.size.CGFloat width = v14;
    v54.size.CGFloat height = v15;
    if (MinY >= CGRectGetMinY(v54)) {
      break;
    }
    BOOL v23 = [(PUSectionedGridLayout *)self _ensureUpdatedLayoutData:v10 isForward:0 outDeltaOriginY:&v51];
    double v24 = v51;
    if (y < 0.0) {
      double v24 = 0.0;
    }
    double v21 = v21 + v24;
    [v10 currentContentBounds];
    CGFloat v12 = v25;
    CGFloat v13 = v26;
    CGFloat v14 = v27;
    CGFloat v15 = v28;
  }
  while (v23);
  do
  {
    v55.origin.CGFloat x = x;
    v55.origin.double y = v21;
    v55.size.CGFloat width = width;
    v55.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v55);
    v56.origin.CGFloat x = v12;
    v56.origin.double y = v13;
    v56.size.CGFloat width = v14;
    v56.size.CGFloat height = v15;
    if (MaxY <= CGRectGetMaxY(v56)) {
      break;
    }
    BOOL v30 = [(PUSectionedGridLayout *)self _ensureUpdatedLayoutData:v10 isForward:1 outDeltaOriginY:&v51];
    double v31 = v51;
    if (y < 0.0) {
      double v31 = 0.0;
    }
    double v21 = v21 + v31;
    [v10 currentContentBounds];
    CGFloat v12 = v32;
    CGFloat v13 = v33;
    CGFloat v14 = v34;
    CGFloat v15 = v35;
  }
  while (v30);
  v36 = [(PUSectionedGridLayoutData *)self->_layoutData headerLayoutAttributes];
  v37 = [v36 lastObject];

  if (v37)
  {
    v38 = [v37 indexPath];
    int64_t v39 = [(PUSectionedGridLayout *)self visualSectionForSupplementaryViewIndexPath:v38];
    int64_t v40 = self->_totalVisualSections - 1;

    if (v39 == v40)
    {
      globalFooterAttributes = self->_globalFooterAttributes;
      if (globalFooterAttributes)
      {
        [(UICollectionViewLayoutAttributes *)globalFooterAttributes frame];
        double v43 = v42;
        double v45 = v44;
        double v47 = v46;
        [v10 currentContentBounds];
        -[UICollectionViewLayoutAttributes setFrame:](self->_globalFooterAttributes, "setFrame:", v43, CGRectGetMaxY(v57), v45, v47);
      }
    }
  }
  if (a5) {
    *a5 = v48 + v51;
  }
}

- (BOOL)_ensureUpdatedLayoutData:(id)a3 isForward:(BOOL)a4 outDeltaOriginY:(double *)a5
{
  BOOL v5 = a4;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!self->_dynamicLayoutEnabled)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v80 = id v79 = v8;
    [v80 handleFailureInMethod:a2 object:self file:@"PUSectionedGridLayout.m" lineNumber:3019 description:@"This should be called only when dynamic layout is enabled."];

    id v8 = v79;
  }
  v89 = [(PUSectionedGridLayout *)self collectionView];
  [v89 bounds];
  double x = v9;
  double y = v11;
  double v85 = v13;
  uint64_t v14 = [v8 numberOfPagesToCache];
  [v8 currentContentBounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  double height = v21;
  BOOL v23 = [v8 headerLayoutAttributes];
  *(void *)&r2[2] = [v8 headerLayoutAttributesByVisualSection];
  if (v5) {
    [v23 lastObject];
  }
  else {
  double v24 = [v23 firstObject];
  }
  double v25 = [v24 indexPath];
  int64_t v26 = [(PUSectionedGridLayout *)self visualSectionForSupplementaryViewIndexPath:v25];
  [v24 frame];
  r2[0] = v27;
  CGFloat rect = v28;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  if (v24)
  {
    int64_t v33 = [(PUSectionedGridLayout *)self _nextVisualSectionForSupplementaryViewSection:v26 forward:v5];
    double y = v18;
    double x = v16;
  }
  else
  {
    if ([v23 count]
      || [*(id *)&r2[2] count]
      || (v96.origin.x = v16, v96.origin.y = v18, v96.size.double width = v20, v96.size.height = height, !CGRectIsEmpty(v96)))
    {
      v78 = [MEMORY[0x1E4F28B00] currentHandler];
      [v78 handleFailureInMethod:a2 object:self file:@"PUSectionedGridLayout.m" lineNumber:3042 description:0];
    }
    int64_t v33 = -[PUSectionedGridLayout _visualSectionAtPoint:](self, "_visualSectionAtPoint:", x, y);
    double height = 0.0;
    double v20 = 0.0;
  }
  *(void *)&r2[1] = v23;
  if (v33 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v84 = v8;
    [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    uint64_t v39 = v38 = v14;
    int64_t v40 = [v23 firstObject];
    v41 = [v40 indexPath];
    v82 = (void *)v39;
    int v81 = [v41 isEqual:v39];

    double v42 = v85 * (double)v38;
    double v43 = x;
    double v44 = y;
    double v45 = v20;
    double v46 = height;
    if (v5) {
      double v47 = v42 + CGRectGetMaxY(*(CGRect *)&v43);
    }
    else {
      double v47 = CGRectGetMinY(*(CGRect *)&v43) - v42;
    }
    BOOL v48 = v24 == 0;
    char v34 = 0;
    while (1)
    {
      v97.origin.double x = x;
      v97.origin.double y = y;
      v97.size.double width = v20;
      v97.size.double height = height;
      if (v47 >= CGRectGetMinY(v97))
      {
        v98.origin.double x = x;
        v98.origin.double y = y;
        v98.size.double width = v20;
        v98.size.double height = height;
        if (v47 <= CGRectGetMaxY(v98)) {
          break;
        }
      }
      id v8 = v84;
      while ([(PUSectionedGridLayout *)self shouldHideVisualSection:v33])
      {
        int64_t v33 = [(PUSectionedGridLayout *)self _nextVisualSectionForSupplementaryViewSection:v33 forward:v5];
        if (v33 == 0x7FFFFFFFFFFFFFFFLL)
        {

          v37 = v89;
          goto LABEL_39;
        }
      }
      double v83 = v47;
      [(PUSectionedGridLayout *)self _delegateAccessibilitySectionHeaderHeightForSection:v33];
      double v50 = v49;
      double width = self->_contentSize.width;
      if (v48)
      {
        [(PUSectionedGridLayout *)self _startYOfVisualSectionAtIndex:v33];
        double v53 = v52;
        double v54 = r2[1];
      }
      else
      {
        v99.origin.double x = r2[0];
        v99.origin.double y = rect;
        v99.size.double width = v30;
        v99.size.double height = v32;
        double MinY = CGRectGetMinY(v99);
        double v54 = r2[1];
        if (v5)
        {
          [(PUSectionedGridLayout *)self _heightOfSectionAtVisualIndex:v33 - 1];
          double v57 = MinY + v56;
        }
        else
        {
          [(PUSectionedGridLayout *)self _heightOfSectionAtVisualIndex:v33];
          double v57 = MinY - v58;
        }
        if (PUMainScreenScale_onceToken != -1) {
          dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
        }
        double v53 = round(*(double *)&PUMainScreenScale_screenScale * v57) / *(double *)&PUMainScreenScale_screenScale;
      }
      uint64_t v59 = [(PUSectionedGridLayout *)self supplementaryViewIndexPathForVisualSection:v33 supplementaryViewItemIndex:0];

      v60 = [(PUSectionedGridLayout *)self sectionHeaderElementKind];
      v86 = (void *)v59;
      v36 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v60 withIndexPath:v59];

      objc_msgSend(v36, "setFrame:", r2[0], v53, width, v50);
      uint64_t v61 = 0;
      if (v5) {
        uint64_t v61 = [*(id *)&v54 count];
      }
      [*(id *)&v54 insertObject:v36 atIndex:v61];
      v62 = [NSNumber numberWithInteger:v33];
      [*(id *)&r2[2] setObject:v36 forKey:v62];

      [(PUSectionedGridLayout *)self _heightOfSectionAtVisualIndex:v33];
      v102.size.double height = v63;
      v100.origin.double x = x;
      v100.origin.double y = y;
      v100.size.double width = v20;
      v100.size.double height = height;
      v102.origin.double x = r2[0];
      CGFloat rect = v53;
      v102.origin.double y = v53;
      v102.size.double width = width;
      CGRect v101 = CGRectUnion(v100, v102);
      double x = v101.origin.x;
      double y = v101.origin.y;
      double v20 = v101.size.width;
      double height = v101.size.height;
      int64_t v33 = [(PUSectionedGridLayout *)self _nextVisualSectionForSupplementaryViewSection:v33 forward:v5];
      BOOL v48 = 0;
      char v34 = 1;
      double v24 = v36;
      CGFloat v32 = v50;
      CGFloat v30 = width;
      v64 = v86;
      double v25 = v86;
      double v47 = v83;
      if (v33 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_41;
      }
    }
    v64 = v25;
    v36 = v24;
LABEL_41:
    double v25 = v64;
    v66 = [*(id *)&r2[1] firstObject];
    v67 = [v66 indexPath];
    int v68 = [v67 isEqual:v82];

    double globalTopPadding = self->_globalTopPadding;
    [(PUSectionedGridLayout *)self globalHeaderHeight];
    double v71 = globalTopPadding + v70;
    double sectionTopPadding = 0.0;
    if (y <= v71)
    {
      id v8 = v84;
      if ((v81 | v68 ^ 1))
      {
        double sectionTopPadding = v71 - y;
      }
      else
      {
        double sectionTopPadding = self->_sectionTopPadding;
        double height = height + sectionTopPadding;
      }
      if (sectionTopPadding == 0.0) {
        goto LABEL_56;
      }
      long long v92 = 0u;
      long long v93 = 0u;
      *(_OWORD *)&r2[3] = 0u;
      long long v91 = 0u;
      id v72 = *(id *)&r2[1];
      uint64_t v73 = [v72 countByEnumeratingWithState:&r2[3] objects:v94 count:16];
      if (v73)
      {
        uint64_t v74 = v73;
        uint64_t v75 = *(void *)v91;
        do
        {
          for (uint64_t i = 0; i != v74; ++i)
          {
            if (*(void *)v91 != v75) {
              objc_enumerationMutation(v72);
            }
            v77 = *(void **)(*(void *)&r2[4] + 8 * i);
            [v77 frame];
            objc_msgSend(v77, "setFrame:");
          }
          uint64_t v74 = [v72 countByEnumeratingWithState:&r2[3] objects:v94 count:16];
        }
        while (v74);
      }
    }
    else
    {
      double v71 = y;
    }
    id v8 = v84;
LABEL_56:
    objc_msgSend(v8, "setCurrentContentBounds:", x, v71, v20, height);

    goto LABEL_14;
  }
  char v34 = 0;
  double sectionTopPadding = 0.0;
  v36 = v24;
LABEL_14:
  v37 = v89;
  if (a5) {
    *a5 = sectionTopPadding;
  }
  double v24 = v36;
LABEL_39:

  return v34 & 1;
}

- (CGPoint)_visibleRectOriginForScrollOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PUSectionedGridLayout *)self _finalContentInset];
  double v6 = y + v5;
  double v8 = x + v7;
  double v9 = v6;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)_currentVisibleRectOrigin
{
  if (self->_transitionLayout)
  {
    BOOL v3 = [(PUSectionedGridLayout *)self transitionIsAppearing];
    [(PUSectionedGridLayout *)self transitionEffectiveContentOrigin];
    if (v3)
    {
      double x = v4 + self->_transitionEndContentOffset.x;
      double y = v5 + self->_transitionEndContentOffset.y;
    }
    else
    {
      double x = self->_transitionStartContentOffset.x;
      double y = self->_transitionStartContentOffset.y;
    }
  }
  else
  {
    double v8 = [(PUSectionedGridLayout *)self collectionView];
    [v8 contentOffset];
    double x = v9;
    double y = v10;
  }
  -[PUSectionedGridLayout _visibleRectOriginForScrollOffset:](self, "_visibleRectOriginForScrollOffset:", x, y);
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (double)_sectionWidth
{
  BOOL v3 = [(PUSectionedGridLayout *)self collectionView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(PUSectionedGridLayout *)self sectionContentInset];
  double v13 = v12;
  double v15 = v14;
  v17.origin.double x = v5;
  v17.origin.double y = v7;
  v17.size.double width = v9;
  v17.size.double height = v11;
  return CGRectGetWidth(v17) - (v13 + v15);
}

- (int64_t)numberOfColumnsForWidth:(double)a3
{
  [(PUSectionedGridLayout *)self interItemSpacing];
  double v6 = v5;
  [(PUSectionedGridLayout *)self itemSize];
  double v8 = v7;
  int64_t v9 = [(PUSectionedGridLayout *)self cropType];
  if (v8 <= 0.0) {
    return 0;
  }
  if (v9 == 3) {
    return llround((v6 + a3) / (v6 + v8) + 0.00000999999975);
  }
  if (v9 != 2)
  {
    if (v9 != 1) {
      return vcvtmd_s64_f64((v6 + a3) / (v6 + v8) + 0.00000999999975);
    }
    [(PUSectionedGridLayout *)self cropAmount];
    return (uint64_t)((a3 + v10 * -2.0) / (v8 - v10));
  }
  [(PUSectionedGridLayout *)self cropAmount];
  if (a3 <= 0.0) {
    return 0;
  }
  int64_t result = 0;
  double v13 = 0.0;
  do
  {
    if ((result & 1) != 0 && (unint64_t)result >= 2) {
      double v15 = v12;
    }
    else {
      double v15 = 0.0;
    }
    double v16 = v13 + v8 - v15;
    BOOL v17 = v16 > a3;
    double v18 = -0.0;
    if (v16 <= a3) {
      double v18 = v6;
    }
    double v13 = v16 + v18;
    if (!v17) {
      ++result;
    }
  }
  while (v13 < a3);
  return result;
}

- (CGSize)layoutItemSizeForColumn:(int64_t)a3
{
  [(PUSectionedGridLayout *)self itemSize];
  double v6 = v5;
  double v8 = v7;
  if (a3 >= 0) {
    int64_t v9 = a3;
  }
  else {
    int64_t v9 = -a3;
  }
  if ([(PUSectionedGridLayout *)self cropType] == 1)
  {
    [(PUSectionedGridLayout *)self _sectionWidth];
    int64_t v10 = -[PUSectionedGridLayout numberOfColumnsForWidth:](self, "numberOfColumnsForWidth:");
    if (!a3 || v9 == v10 - 1) {
      goto LABEL_17;
    }
LABEL_12:
    [(PUSectionedGridLayout *)self cropAmount];
    double v6 = v6 - v12;
    goto LABEL_17;
  }
  if ([(PUSectionedGridLayout *)self cropType] == 2)
  {
    [(PUSectionedGridLayout *)self _sectionWidth];
    int64_t v11 = -[PUSectionedGridLayout numberOfColumnsForWidth:](self, "numberOfColumnsForWidth:");
    if (a3 && v9 != v11 - 1 && (v9 & 1) != 0) {
      goto LABEL_12;
    }
  }
  else if ([(PUSectionedGridLayout *)self cropType] == 3)
  {
    double v13 = v6 * (double)a3;
    if (PUMainScreenScale_onceToken != -1)
    {
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
      double v13 = v6 * (double)a3;
    }
    double v6 = round(*(double *)&PUMainScreenScale_screenScale * (v6 * (double)(a3 + 1)))
       / *(double *)&PUMainScreenScale_screenScale
       - round(*(double *)&PUMainScreenScale_screenScale * v13) / *(double *)&PUMainScreenScale_screenScale;
  }
LABEL_17:
  double v14 = v6;
  double v15 = v8;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (_NSRange)visualSectionsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (self->_dynamicLayoutEnabled)
  {
    double v37 = 0.0;
    -[PUSectionedGridLayout _ensureRect:inData:outDeltaOriginY:](self, "_ensureRect:inData:outDeltaOriginY:", self->_layoutData, &v37, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    double y = y + v37;
    double v8 = [(PUSectionedGridLayoutData *)self->_layoutData headerLayoutAttributes];
    uint64_t v9 = [v8 count];

    v39.origin.CGFloat x = x;
    v39.origin.double y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    if (CGRectGetMinY(v39) == 0.0
      && ([(PUSectionedGridLayoutData *)self->_layoutData headerLayoutAttributes],
          int64_t v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 count],
          v10,
          v11))
    {
      double v12 = [(PUSectionedGridLayoutData *)self->_layoutData headerLayoutAttributes];
      double v13 = [v12 objectAtIndexedSubscript:0];
LABEL_5:
    }
    else
    {
      uint64_t v15 = v9 - 1;
      if (v9 - 1 < 0) {
        goto LABEL_18;
      }
      uint64_t v16 = 0;
      double v13 = 0;
      do
      {
        BOOL v17 = v13;
        uint64_t v18 = v15 - v16;
        if (v15 < v16) {
          ++v18;
        }
        uint64_t v19 = v16 + (v18 >> 1);
        double v20 = [(PUSectionedGridLayoutData *)self->_layoutData headerLayoutAttributes];
        double v13 = [v20 objectAtIndexedSubscript:v19];

        uint64_t v21 = v19 + 1;
        id v22 = [(PUSectionedGridLayoutData *)self->_layoutData headerLayoutAttributes];
        uint64_t v23 = [v22 count];

        if (v19 + 1 == v23) {
          break;
        }
        double v24 = [(PUSectionedGridLayoutData *)self->_layoutData headerLayoutAttributes];
        double v12 = [v24 objectAtIndexedSubscript:v19 + 1];

        v40.origin.CGFloat x = x;
        v40.origin.double y = y;
        v40.size.CGFloat width = width;
        v40.size.CGFloat height = height;
        double MinY = CGRectGetMinY(v40);
        [v13 frame];
        if (MinY >= CGRectGetMinY(v41))
        {
          v42.origin.CGFloat x = x;
          v42.origin.double y = y;
          v42.size.CGFloat width = width;
          v42.size.CGFloat height = height;
          double v26 = CGRectGetMinY(v42);
          [v12 frame];
          if (v26 < CGRectGetMinY(v43)) {
            goto LABEL_5;
          }
        }
        else
        {
          uint64_t v15 = v19 - 1;
          uint64_t v21 = v16;
        }

        uint64_t v16 = v21;
      }
      while (v21 <= v15);
    }
    if (v13)
    {
      double v27 = [v13 indexPath];
      int64_t v14 = [(PUSectionedGridLayout *)self visualSectionForSupplementaryViewIndexPath:v27];

      goto LABEL_19;
    }
LABEL_18:
    int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_19;
  }
  int64_t v14 = -[PUSectionedGridLayout _visualSectionAtPoint:](self, "_visualSectionAtPoint:", a3.origin.x, a3.origin.y);
LABEL_19:
  if (v14 == 0x7FFFFFFFFFFFFFFFLL || v14 >= self->_totalVisualSections)
  {
    NSUInteger v28 = 0;
  }
  else
  {
    NSUInteger v28 = 0;
    do
    {
      if (self->_dynamicLayoutEnabled)
      {
        double v29 = [(PUSectionedGridLayoutData *)self->_layoutData headerLayoutAttributesByVisualSection];
        CGFloat v30 = [NSNumber numberWithInteger:v14 + v28];
        double v31 = [v29 objectForKey:v30];

        if (!v31) {
          break;
        }
        [v31 frame];
        double v33 = v32;
      }
      else
      {
        [(PUSectionedGridLayout *)self _startYOfVisualSectionAtIndex:v14 + v28];
        double v33 = v34;
      }
      v44.origin.CGFloat x = x;
      v44.origin.double y = y;
      v44.size.CGFloat width = width;
      v44.size.CGFloat height = height;
      if (v33 > CGRectGetMaxY(v44)) {
        break;
      }
      ++v28;
    }
    while ((int64_t)(v14 + v28) < self->_totalVisualSections);
  }
  NSUInteger v35 = v14;
  NSUInteger v36 = v28;
  result.NSUInteger length = v36;
  result.NSUInteger location = v35;
  return result;
}

- (int64_t)_visualSectionAtPoint:(CGPoint)a3
{
  int64_t totalVisualSections = self->_totalVisualSections;
  int64_t v4 = totalVisualSections - 1;
  if (totalVisualSections < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  double y = a3.y;
  int64_t v7 = 0;
  do
  {
    uint64_t v8 = v4 - v7;
    if (v4 < v7) {
      ++v8;
    }
    int64_t v9 = v7 + (v8 >> 1);
    visualSectionStartYs = self->_visualSectionStartYs;
    if (y >= visualSectionStartYs[v9])
    {
      if (y >= visualSectionStartYs[v9 + 1])
      {
        int64_t v7 = v9 + 1;
      }
      else if (![(PUSectionedGridLayout *)self shouldHideVisualSection:v9])
      {
        break;
      }
    }
    else
    {
      int64_t v4 = v9 - 1;
    }
  }
  while (v7 <= v4);
  if (v9 >= self->_totalVisualSections) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  -[PUSectionedGridLayout _startYOfVisualSectionAtIndex:](self, "_startYOfVisualSectionAtIndex:");
  if (y >= v11) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v9;
}

- (double)_heightOfSectionAtVisualIndex:(int64_t)a3
{
  -[PUSectionedGridLayout _startYOfVisualSectionAtIndex:](self, "_startYOfVisualSectionAtIndex:");
  double v6 = v5;
  [(PUSectionedGridLayout *)self _startYOfVisualSectionAtIndex:a3 + 1];
  double v8 = v7 - v6;
  [(PUSectionedGridLayout *)self _sectionHeaderHeightDeltaForSection:a3];
  return v8 + v9;
}

- (double)_startYOfContentAtVisualSectionIndexWithDynamicLayout:(int64_t)a3
{
  double v3 = 0.0;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return v3;
  }
  if (self->_dynamicLayoutEnabled && !self->_isPreparingLayout)
  {
    [(PUSectionedGridLayout *)self _ensureVisualSection:a3 inData:self->_layoutData];
    double v7 = [(PUSectionedGridLayoutData *)self->_layoutData headerLayoutAttributesByVisualSection];
    double v8 = [NSNumber numberWithInteger:a3];
    double v9 = [v7 objectForKey:v8];

    [v9 frame];
    double v11 = v10;
    [(PUSectionedGridLayout *)self _delegateAccessibilitySectionHeaderHeightForSection:a3];
    double v3 = v12 + v11 + self->_sectionContentInset.top;

    return v3;
  }
  -[PUSectionedGridLayout _startYOfVisualSectionAtIndex:](self, "_startYOfVisualSectionAtIndex:");
  return result;
}

- (double)_startYOfContentAtVisualSectionIndex:(int64_t)a3
{
  -[PUSectionedGridLayout _startYOfVisualSectionAtIndex:](self, "_startYOfVisualSectionAtIndex:");
  double v6 = v5 + self->_sectionTopPadding;
  [(PUSectionedGridLayout *)self _finalSectionHeaderHeightForSection:a3];
  return v6 + v7 + self->_sectionContentInset.top;
}

- (double)_startYOfVisualSectionAtIndex:(int64_t)a3
{
  return self->_visualSectionStartYs[a3];
}

- (CGRect)frameForSectionHeaderAtVisualSection:(int64_t)a3
{
  -[PUSectionedGridLayout _startYOfVisualSectionAtIndex:](self, "_startYOfVisualSectionAtIndex:");
  double v6 = v5;
  double sectionTopPadding = self->_sectionTopPadding;
  [(PUSectionedGridLayout *)self _finalSectionHeaderHeightForSection:a3];
  double v9 = v8;
  if (self->_floatingHeaderVisualSectionIndex == a3)
  {
    [(PUSectionedGridLayout *)self _currentVisibleRectOrigin];
    double v11 = v10;
    [(PUSectionedGridLayout *)self _heightOfSectionAtVisualIndex:a3];
    double v13 = v6 + v12 + self->_sectionTopPadding;
    if (v9 + v11 <= v13) {
      double v14 = v11;
    }
    else {
      double v14 = v13 - v9;
    }
  }
  else
  {
    double v14 = v6 + sectionTopPadding;
  }
  double width = self->_contentSize.width;
  double v16 = 0.0;
  double v17 = v9;
  result.size.CGFloat height = v17;
  result.size.double width = width;
  result.origin.double y = v14;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)frameForSectionHeaderOfRealItem:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    -[PUSectionedGridLayout frameForSectionHeaderAtVisualSection:](self, "frameForSectionHeaderAtVisualSection:", -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](self->_layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", [v4 section], objc_msgSend(v4, "item"), 0));
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)frameForItemAtGridCoordinates:(PUGridCoordinates)a3 inTransitionSection:(int64_t)a4
{
  uint64_t v11 = 0;
  uint64_t v5 = -[PUSectionedGridLayout visualGridCoordsForTransitionGridCoords:atTransitionSection:outVisualSection:](self, "visualGridCoordsForTransitionGridCoords:atTransitionSection:outVisualSection:", a3.row, a3.column, a4, &v11);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [(PUSectionedGridLayout *)self frameForItemAtGridCoordinates:v5 inVisualSection:v6];
  }
  result.size.CGFloat height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (PUSimpleIndexPath)_visualRowPathForTransitionRowIndex:(int64_t)a3 transitionSectionInfo:(id)a4
{
  id v5 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3010000000;
  double v24 = "";
  int64x2_t v25 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  uint64_t v6 = [v5 visualSections];
  double v7 = [v5 visualRowStartMarkers];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__PUSectionedGridLayout__visualRowPathForTransitionRowIndex_transitionSectionInfo___block_invoke;
  v14[3] = &unk_1E5F2BD98;
  id v8 = v7;
  id v15 = v8;
  double v17 = v20;
  int64_t v19 = a3;
  id v9 = v6;
  id v16 = v9;
  uint64_t v18 = &v21;
  [v9 enumerateIndexesUsingBlock:v14];
  int64_t v10 = v22[4];
  int64_t v11 = v22[5];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);

  int64_t v12 = v10;
  int64_t v13 = v11;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

void __83__PUSectionedGridLayout__visualRowPathForTransitionRowIndex_transitionSectionInfo___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  unint64_t v7 = [v6 integerValue];

  id v8 = [*(id *)(a1 + 32) objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 1];
  uint64_t v9 = [v8 integerValue];

  unint64_t v10 = *(void *)(a1 + 64);
  if ((v10 & 0x8000000000000000) != 0
    || ((v12 = v10 >= v7, unint64_t v11 = v10 - v7, v12) ? (v12 = v11 >= v9 - v7) : (v12 = 1),
        !v12 || [*(id *)(a1 + 40) indexGreaterThanIndex:a2] == 0x7FFFFFFFFFFFFFFFLL))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = a2;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = *(void *)(a1 + 64) - v7;
    *a3 = 1;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (int64_t)numberOfContiguousRowsInTransitionSection:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSDictionary *)self->_transitionSectionInfosByTransitionSection objectForKey:v4];
  int64_t v6 = [v5 contiguousRows];

  return v6;
}

- (CGRect)frameForItemAtGridCoordinates:(PUGridCoordinates)a3 inVisualSection:(int64_t)a4 indexPath:(id)a5
{
  int64_t column = a3.column;
  int64_t row = a3.row;
  id v9 = a5;
  if (self->_dynamicLayoutEnabled) {
    [(PUSectionedGridLayout *)self _startYOfContentAtVisualSectionIndexWithDynamicLayout:a4];
  }
  else {
    [(PUSectionedGridLayout *)self _startYOfContentAtVisualSectionIndex:a4];
  }
  double v11 = v10;
  double v12 = self->_itemSize.height + self->_interItemSpacing.height;
  double v13 = (double)row;
  [(PUSectionedGridLayout *)self layoutItemSizeForColumn:column];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  double left = self->_sectionContentInset.left;
  if (column)
  {
    uint64_t v19 = 0;
    if (column >= 0) {
      int64_t v20 = column;
    }
    else {
      int64_t v20 = -column;
    }
    do
    {
      [(PUSectionedGridLayout *)self layoutItemSizeForColumn:v19];
      double v22 = v21 + self->_interItemSpacing.width;
      if (column < 0) {
        double v22 = -v22;
      }
      double left = left + v22;
      ++v19;
    }
    while (v20 != v19);
  }
  double v23 = v11 + v13 * v12;
  if ([(PUSectionedGridLayout *)self usesAspectItems]
    && self->_delegateSupportsAspectRatioForItemAtIndexPath)
  {
    double v24 = [(PUSectionedGridLayout *)self delegate];
    [v24 sectionedGridLayout:self aspectRatioForItemAtIndexPath:v9];
    double v26 = v25;

    if (v26 > 0.0)
    {
      double left = PURectWithAspectRatioFittingRect(v26, left, v23, v15, v17);
      double v23 = v27;
      CGFloat v15 = v28;
      CGFloat v17 = v29;
    }
  }

  double v30 = left;
  double v31 = v23;
  double v32 = v15;
  double v33 = v17;
  result.size.CGFloat height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (CGRect)frameForItemAtGridCoordinates:(PUGridCoordinates)a3 inVisualSection:(int64_t)a4
{
  -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:indexPath:](self, "frameForItemAtGridCoordinates:inVisualSection:indexPath:", a3.row, a3.column, a4, 0);
  result.size.CGFloat height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (PUSimpleIndexPath)_itemVisualIndexPathAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PUSectionedGridLayout *)self itemSize];
  double v7 = v6;
  [(PUSectionedGridLayout *)self interItemSpacing];
  double v9 = v7 + v8;
  [(PUSectionedGridLayout *)self itemSize];
  double v11 = v10;
  [(PUSectionedGridLayout *)self interItemSpacing];
  double v13 = v11 + v12;
  double v14 = x - v9;
  double v15 = y - v13;
  double v16 = v9 + v9;
  double v17 = v13 + v13;
  unint64_t v18 = -[PUSectionedGridLayout visualSectionsInRect:](self, "visualSectionsInRect:", v14, y - v13, v16, v13 + v13);
  uint64_t v20 = v18 + v19;
  uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  if (v18 < v18 + v19)
  {
    unint64_t v23 = v18;
    do
    {
      uint64_t v24 = -[PUSectionedGridLayout visualRowsInRect:inVisualSection:totalVisualSectionRows:](self, "visualRowsInRect:inVisualSection:totalVisualSectionRows:", v23, 0, v14, v15, v16, v17);
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v26 = v24;
        uint64_t v27 = v25;
        int64_t v28 = [(PUSectionedGridLayout *)self numberOfVisualItemsInVisualSection:v23];
        int64_t columnsPerRow = self->_columnsPerRow;
        int64_t v30 = columnsPerRow * v26;
        uint64_t v31 = columnsPerRow * (v26 + v27) - 1;
        if (v31 >= v28 - 1) {
          uint64_t v31 = v28 - 1;
        }
        if (v30 <= v31)
        {
          uint64_t v32 = v31 + 1;
          while (1)
          {
            uint64_t v33 = [(PUSectionedGridLayout *)self gridCoordinatesInSectionForItemAtVisualIndex:v30];
            -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:](self, "frameForItemAtGridCoordinates:inVisualSection:", v33, v34, v23);
            v38.double x = x;
            v38.double y = y;
            if (CGRectContainsPoint(v39, v38)) {
              break;
            }
            if (v32 == ++v30) {
              goto LABEL_12;
            }
          }
          uint64_t v21 = v30;
          uint64_t v22 = v23;
        }
      }
LABEL_12:
      ++v23;
    }
    while (v23 != v20);
  }
  int64_t v35 = v22;
  int64_t v36 = v21;
  result.var1 = v36;
  result.var0 = v35;
  return result;
}

- (void)_enumerateVisualItemFramesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v31 = (void (**)(id, unint64_t, uint64_t, double, double, double, double))a4;
  unint64_t v9 = -[PUSectionedGridLayout visualSectionsInRect:](self, "visualSectionsInRect:", x, y, width, height);
  uint64_t v30 = v9 + v10;
  if (v9 < v9 + v10)
  {
    unint64_t v11 = v9;
    do
    {
      if (![(PUSectionedGridLayout *)self shouldHideVisualSection:v11])
      {
        uint64_t v12 = -[PUSectionedGridLayout visualRowsInRect:inVisualSection:totalVisualSectionRows:](self, "visualRowsInRect:inVisualSection:totalVisualSectionRows:", v11, 0, x, y, width, height);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v14 = v12;
          uint64_t v15 = v13;
          int64_t v16 = [(PUSectionedGridLayout *)self numberOfVisualItemsInVisualSection:v11];
          int64_t columnsPerRow = self->_columnsPerRow;
          uint64_t v18 = columnsPerRow * v14;
          uint64_t v19 = columnsPerRow * (v14 + v15) - 1;
          if (v19 >= v16 - 1) {
            uint64_t v19 = v16 - 1;
          }
          if (v18 <= v19)
          {
            uint64_t v20 = v19 + 1;
            do
            {
              uint64_t v21 = [(PUSectionedGridLayout *)self gridCoordinatesInSectionForItemAtVisualIndex:v18];
              int64_t v23 = v22;
              uint64_t v24 = [(PUSectionedGridLayout *)self collectionView];
              int v25 = [v24 _shouldReverseLayoutDirection];

              if (v25) {
                int64_t v23 = self->_columnsPerRow + ~v23;
              }
              -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:](self, "frameForItemAtGridCoordinates:inVisualSection:", v21, v23, v11);
              double v26 = v33.origin.x;
              double v27 = v33.origin.y;
              double v28 = v33.size.width;
              double v29 = v33.size.height;
              v34.origin.double x = x;
              v34.origin.double y = y;
              v34.size.double width = width;
              v34.size.double height = height;
              if (CGRectIntersectsRect(v33, v34)) {
                v31[2](v31, v11, v18, v26, v27, v28, v29);
              }
              ++v18;
            }
            while (v20 != v18);
          }
        }
      }
      ++v11;
    }
    while (v11 != v30);
  }
}

- (int64_t)visualIndexForItemAtGridCoordinates:(PUGridCoordinates)a3
{
  int64_t column = a3.column;
  int64_t row = a3.row;
  double v6 = [(PUSectionedGridLayout *)self collectionView];
  int v7 = [v6 _shouldReverseLayoutDirection];

  int64_t columnsPerRow = self->_columnsPerRow;
  int64_t v9 = columnsPerRow + ~column;
  if (!v7) {
    int64_t v9 = column;
  }
  return v9 + columnsPerRow * row;
}

- (PUGridCoordinates)gridCoordinatesInSectionForItemAtVisualIndex:(int64_t)a3
{
  double v5 = [(PUSectionedGridLayout *)self collectionView];
  int v6 = [v5 _shouldReverseLayoutDirection];

  int64_t columnsPerRow = self->_columnsPerRow;
  int64_t v8 = a3 / columnsPerRow;
  int64_t v9 = a3 % columnsPerRow;
  int64_t v10 = columnsPerRow + ~(a3 % columnsPerRow);
  if (v6) {
    int64_t v11 = v10;
  }
  else {
    int64_t v11 = v9;
  }
  result.int64_t column = v11;
  result.int64_t row = v8;
  return result;
}

- (_NSRange)visualRowsInRect:(CGRect)a3 inVisualSection:(int64_t)a4 totalVisualSectionRows:(int64_t *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  if (self->_dynamicLayoutEnabled
    && (double v26 = 0.0,
        -[PUSectionedGridLayout _ensureRect:inData:outDeltaOriginY:](self, "_ensureRect:inData:outDeltaOriginY:", self->_layoutData, &v26, x, y, width, height), double y = y + v26, self->_dynamicLayoutEnabled))
  {
    [(PUSectionedGridLayout *)self _startYOfContentAtVisualSectionIndexWithDynamicLayout:a4];
  }
  else
  {
    [(PUSectionedGridLayout *)self _startYOfContentAtVisualSectionIndex:a4];
  }
  double v13 = v12;
  double v14 = self->_itemSize.height + self->_interItemSpacing.height;
  uint64_t v15 = [(PUSectionedGridLayout *)self numberOfVisualItemsInVisualSection:a4];
  int64_t columnsPerRow = self->_columnsPerRow;
  unint64_t v17 = vcvtpd_s64_f64((double)v15 / (double)columnsPerRow);
  if (columnsPerRow >= 1) {
    unint64_t v18 = v17;
  }
  else {
    unint64_t v18 = self->_columnsPerRow;
  }
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  int64_t v19 = vcvtmd_s64_f64((CGRectGetMinY(v28) - v13) / v14);
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  double MaxY = CGRectGetMaxY(v29);
  if ((uint64_t)v18 <= v19) {
    goto LABEL_21;
  }
  uint64_t v21 = vcvtmd_s64_f64((MaxY - v13) / v14);
  if (v21 < 0) {
    goto LABEL_21;
  }
  if ((uint64_t)(v18 - 1) >= v19) {
    uint64_t v22 = v19;
  }
  else {
    uint64_t v22 = v18 - 1;
  }
  int64_t v23 = v22 & ~(v22 >> 63);
  if ((uint64_t)(v18 - 1) < v21) {
    uint64_t v21 = v18 - 1;
  }
  if (v21 <= v23) {
    uint64_t v21 = v22 & ~(v22 >> 63);
  }
  uint64_t v24 = v21 - v23;
  NSUInteger v25 = v24 + 1 < v18 ? v24 + 1 : v18;
  if (!v25)
  {
LABEL_21:
    NSUInteger v25 = 0;
    int64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a5) {
    *a5 = v18;
  }
  result.NSUInteger length = v25;
  result.NSUInteger location = v23;
  return result;
}

- (void)setIsPreparingLayout:(BOOL)a3
{
  self->_isPreparingLayout = a3;
}

- (double)_sectionHeaderHeightDeltaForSection:(int64_t)a3
{
  if (!self->_dynamicLayoutEnabled) {
    return 0.0;
  }
  -[PUSectionedGridLayout _finalSectionHeaderHeightForSection:](self, "_finalSectionHeaderHeightForSection:");
  double v6 = v5;
  [(PUSectionedGridLayout *)self _delegateAccessibilitySectionHeaderHeightForSection:a3];
  if (v7 < v6) {
    double v7 = v6;
  }
  return v7 - v6;
}

- (double)_delegateAccessibilitySectionHeaderHeightForSection:(int64_t)a3
{
  if (self->_delegateSupportsSectionHeaderHeightForVisualSection)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sectionedGridLayout:self sectionHeaderHeightForVisualSection:a3];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }
  if (self->_delegateSupportsAccessibilitySectionHeaderHeightForVisualSection
    && [(PUSectionedGridLayout *)self _hasAccessibilityLargeText])
  {
    int64_t v8 = [NSNumber numberWithInteger:a3];
    axLargeTextSectionHeaderHeightByVisualSection = self->_axLargeTextSectionHeaderHeightByVisualSection;
    int64_t v10 = [NSNumber numberWithInteger:a3];
    int64_t v11 = [(NSMutableDictionary *)axLargeTextSectionHeaderHeightByVisualSection objectForKey:v10];

    if (v11)
    {
      [v11 floatValue];
      double v13 = v12;
    }
    else
    {
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      [v14 sectionedGridLayout:self accessibilitySectionHeaderHeightForVisualSection:a3];
      double v13 = v15;

      int64_t v16 = self->_axLargeTextSectionHeaderHeightByVisualSection;
      unint64_t v17 = [NSNumber numberWithDouble:v13];
      [(NSMutableDictionary *)v16 setObject:v17 forKey:v8];
    }
    if (v7 < v13) {
      double v7 = v13;
    }
  }
  return v7;
}

- (double)_finalSectionHeaderHeightForSection:(int64_t)a3
{
  BOOL v3 = a3 == 0x7FFFFFFFFFFFFFFFLL || !self->_sectionHeadersEnabled;
  if (v3 || !self->_delegateSupportsSectionHeaderHeightForVisualSection) {
    return 0.0;
  }
  if ([(PUSectionedGridLayout *)self _hasAccessibilityLargeText]
    && !self->_dynamicLayoutEnabled)
  {
    [(PUSectionedGridLayout *)self _delegateAccessibilitySectionHeaderHeightForSection:a3];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sectionedGridLayout:self sectionHeaderHeightForVisualSection:a3];
    double v8 = v7;

    return v8;
  }
  return result;
}

- (id)_gridTransitionLayout
{
  v2 = self->_transitionLayout;
  if (([(UICollectionViewLayout *)v2 conformsToProtocol:&unk_1F083ED00] & 1) == 0)
  {

    v2 = 0;
  }
  return v2;
}

- (void)setUsesAspectItems:(BOOL)a3
{
  if (self->_usesAspectItems != a3)
  {
    self->_usesAspectItems = a3;
    [(PUSectionedGridLayout *)self invalidateLayout];
  }
}

- (void)setHiddenItemIndexPaths:(id)a3
{
  double v5 = (NSSet *)a3;
  if (self->_hiddenItemIndexPaths != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_hiddenItemIndexPaths, a3);
    [(PUSectionedGridLayout *)self invalidateLayout];
    double v5 = v6;
  }
}

- (void)setCropAmount:(double)a3
{
  if (self->_cropAmount != a3)
  {
    self->_cropAmount = a3;
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
  }
}

- (void)setCropType:(int64_t)a3
{
  if (self->_cropType != a3)
  {
    self->_cropType = a3;
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
  }
}

- (void)setSectionHeaderElementKind:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_sectionHeaderElementKind != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_sectionHeaderElementKind, a3);
    [(PUSectionedGridLayout *)self _invalidateSupplementaryViewKinds];
    [(PUSectionedGridLayout *)self _updateHasFloatingHeaders];
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
    double v5 = v6;
  }
}

- (void)setGlobalFooterHeight:(double)a3
{
  if (self->_globalFooterHeight != a3)
  {
    self->_globalFooterHeight = a3;
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
  }
}

- (void)setGlobalBottomPadding:(double)a3
{
  if (self->_globalBottomPadding != a3)
  {
    self->_globalBottomPadding = a3;
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
  }
}

- (void)setGlobalTopPadding:(double)a3
{
  if (self->_globalTopPadding != a3)
  {
    self->_double globalTopPadding = a3;
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
  }
}

- (void)setDynamicLayoutEnabled:(BOOL)a3
{
  if (self->_dynamicLayoutEnabled != a3)
  {
    self->_dynamicLayoutEnabled = a3;
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
  }
}

- (void)setFloatingSectionHeadersEnabled:(BOOL)a3
{
  if (self->_floatingSectionHeadersEnabled != a3)
  {
    self->_floatingSectionHeadersEnabled = a3;
    [(PUSectionedGridLayout *)self _updateHasFloatingHeaders];
  }
}

- (void)setSectionHeadersEnabled:(BOOL)a3
{
  if (self->_sectionHeadersEnabled != a3)
  {
    self->_sectionHeadersEnabled = a3;
    [(PUSectionedGridLayout *)self _updateHasFloatingHeaders];
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
  }
}

- (void)setSectionContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_sectionContentInset.left
    || a3.top != self->_sectionContentInset.top
    || a3.right != self->_sectionContentInset.right
    || a3.bottom != self->_sectionContentInset.bottom)
  {
    self->_sectionContentInset = a3;
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
  }
}

- (void)setSectionBottomPadding:(double)a3
{
  if (self->_sectionBottomPadding != a3)
  {
    self->_sectionBottomPadding = a3;
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
  }
}

- (void)setSectionTopPadding:(double)a3
{
  if (self->_sectionTopPadding != a3)
  {
    self->_double sectionTopPadding = a3;
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
  }
}

- (void)setItemSize:(CGSize)a3
{
  if (a3.width > 0.0 && a3.height > 0.0 && (a3.width != self->_itemSize.width || a3.height != self->_itemSize.height))
  {
    self->_itemSize = a3;
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
  }
}

- (void)setInterItemSpacing:(CGSize)a3
{
  if (a3.width != self->_interItemSpacing.width || a3.height != self->_interItemSpacing.height)
  {
    self->_interItemSpacing = a3;
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_storeWeak((id *)&self->_delegate, obj);
    if (objc_opt_respondsToSelector())
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      self->_delegateSupportsGroupedSections = objc_opt_respondsToSelector() & 1;
    }
    else
    {
      self->_delegateSupportsGroupedSections = 0;
    }

    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsAnchorItemForContentOffset = objc_opt_respondsToSelector() & 1;

    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsTargetContentOffset = objc_opt_respondsToSelector() & 1;

    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsTransitionAutoContentOffsetEnabled = objc_opt_respondsToSelector() & 1;

    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsFinalContentInsetForCurrentContentInset = objc_opt_respondsToSelector() & 1;

    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsDidInvalidateWithContext = objc_opt_respondsToSelector() & 1;

    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsAspectRatioForItemAtIndexPath = objc_opt_respondsToSelector() & 1;

    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsSectionHeaderHeightForVisualSection = objc_opt_respondsToSelector() & 1;

    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsAccessibilitySectionHeaderHeightForVisualSection = objc_opt_respondsToSelector() & 1;

    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsWillPrepareLayout = objc_opt_respondsToSelector() & 1;

    [(PUSectionedGridLayout *)self invalidateLayout];
    double v5 = obj;
  }
}

- (NSIndexPath)globalFooterIndexPath
{
  return (NSIndexPath *)[MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
}

- (NSIndexPath)globalHeaderIndexPath
{
  return (NSIndexPath *)[MEMORY[0x1E4F28D58] indexPathForItem:1 inSection:0];
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)PUSectionedGridLayout;
  BOOL v3 = [(PUSectionedGridLayout *)&v7 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v5 = [v3 stringByAppendingFormat:@" delegate: %@", WeakRetained];

  return (NSString *)v5;
}

- (CATransform3D)_transformToConvertRect:(SEL)a3 intoRect:(CGRect)a4 referenceCenter:(CGRect)a5
{
  CGFloat v7 = a5.size.width / a4.size.width;
  CGFloat v8 = a5.size.height / a4.size.height;
  CGFloat v9 = a4.origin.x
     + a4.size.width * 0.5
     - -(v39
       - (a4.origin.x
        + a4.size.width * 0.5)
       - (v39 - (a4.origin.x + a4.size.width * 0.5)) * (a5.size.width / a4.size.width));
  CGFloat v10 = a4.origin.y
      + a4.size.height * 0.5
      - -(v40
        - (a4.origin.y
         + a4.size.height * 0.5)
        - (v40 - (a4.origin.y + a4.size.height * 0.5)) * (a5.size.height / a4.size.height));
  CGFloat v11 = a5.origin.x + a5.size.width * 0.5;
  id v12 = (long long *)MEMORY[0x1E4F39B10];
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&retstr->m31 = v13;
  *(_OWORD *)&retstr->m33 = v14;
  CGFloat v15 = a5.size.height * 0.5;
  long long v16 = v12[6];
  long long v17 = v12[7];
  *(_OWORD *)&retstr->m41 = v16;
  *(_OWORD *)&retstr->m43 = v17;
  long long v18 = *v12;
  long long v19 = v12[1];
  *(_OWORD *)&retstr->m11 = *v12;
  *(_OWORD *)&retstr->m13 = v19;
  CGFloat v20 = a5.origin.y + v15;
  CGFloat v21 = v11 - v9;
  long long v22 = v12[2];
  long long v23 = v12[3];
  *(_OWORD *)&retstr->m21 = v22;
  *(_OWORD *)&retstr->m23 = v23;
  *(_OWORD *)&v37.m31 = v13;
  *(_OWORD *)&v37.m33 = v14;
  *(_OWORD *)&v37.m41 = v16;
  *(_OWORD *)&v37.m43 = v17;
  *(_OWORD *)&v37.m11 = v18;
  *(_OWORD *)&v37.m13 = v19;
  *(_OWORD *)&v37.m21 = v22;
  *(_OWORD *)&v37.m23 = v23;
  CATransform3DTranslate(&v38, &v37, v21, v20 - v10, 0.0);
  long long v24 = *(_OWORD *)&v38.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v38.m31;
  *(_OWORD *)&retstr->m33 = v24;
  long long v25 = *(_OWORD *)&v38.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v38.m41;
  *(_OWORD *)&retstr->m43 = v25;
  long long v26 = *(_OWORD *)&v38.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v38.m11;
  *(_OWORD *)&retstr->m13 = v26;
  long long v27 = *(_OWORD *)&v38.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v38.m21;
  *(_OWORD *)&retstr->m23 = v27;
  long long v28 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v37.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v37.m33 = v28;
  long long v29 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v37.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v37.m43 = v29;
  long long v30 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v37.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v37.m13 = v30;
  long long v31 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v37.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v37.m23 = v31;
  double result = CATransform3DScale(&v38, &v37, v7, v8, 1.0);
  long long v33 = *(_OWORD *)&v38.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v38.m31;
  *(_OWORD *)&retstr->m33 = v33;
  long long v34 = *(_OWORD *)&v38.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v38.m41;
  *(_OWORD *)&retstr->m43 = v34;
  long long v35 = *(_OWORD *)&v38.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v38.m11;
  *(_OWORD *)&retstr->m13 = v35;
  long long v36 = *(_OWORD *)&v38.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v38.m21;
  *(_OWORD *)&retstr->m23 = v36;
  return result;
}

- (void)adjustEffectiveContentOriginForTransitionEndContentOffset:(CGPoint)a3
{
  p_transitionEndContentOffset = &self->_transitionEndContentOffset;
  self->_transitionEndContentOffset = a3;
  if (self->_delegateSupportsTransitionAutoContentOffsetEnabled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = [WeakRetained sectionedGridLayoutTransitionAutoAdjustContentOffsetEnabled:self];

    if ((v6 & 1) == 0)
    {
      self->_transitionEffectiveContentOrigin = (CGPoint)vsubq_f64((float64x2_t)self->_transitionStartContentOffset, *(float64x2_t *)p_transitionEndContentOffset);
      self->_transitionApplyingEffectiveContentOrigin = 1;
      [(PUSectionedGridLayout *)self _invalidateLayoutWithContext:0];
    }
  }
}

- (BOOL)_visualSectionsMatchTransitionSectionsToOrFromLayout:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PUSectionedGridLayout *)self numberOfVisualSections];
  uint64_t v6 = [v4 numberOfVisualSections];

  return v5 <= v6;
}

- (void)_adjustRenderedStripLayoutAttributes:(id)a3 toOrFromGridLayout:(id)a4 isAppearing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  CGFloat v10 = [v8 indexPath];
  int64_t v11 = [(PUSectionedGridLayout *)self visualSectionForSupplementaryViewIndexPath:v10];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v12 = v11;
    uint64_t v13 = [v10 item];
    int64_t v14 = -[PUSectionedGridLayout visualIndexForItemAtGridCoordinates:](self, "visualIndexForItemAtGridCoordinates:", v13, 0);
    if (v14 >= [(PULayoutSampledSectioning *)self->_layoutSectioning numberOfVisualItemsInVisualSection:v12])
    {
      [v8 setAlpha:0.0];
    }
    else
    {
      -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:](self, "frameForItemAtGridCoordinates:inVisualSection:", v13, 0, v12);
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      [(PUSectionedGridLayout *)self interItemSpacing];
      double v24 = v20 + v23;
      uint64_t v25 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v12, v14);
      long long v27 = [MEMORY[0x1E4F28D58] indexPathForItem:v26 inSection:v25];
      long long v28 = [(PUSectionedGridLayout *)self layoutAttributesForItemAtIndexPath:v27];
      v61[0] = 0;
      [(PUSectionedGridLayout *)self _adjustGridTransitionLayoutAttributes:v28 toOrFromGridLayout:v9 outTargetRowExists:v61 isAppearing:v5];
      [v28 frame];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      [v9 interItemSpacing];
      double v38 = v34 + v37;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      [v8 center];
      -[PUSectionedGridLayout _transformToConvertRect:intoRect:referenceCenter:](self, "_transformToConvertRect:intoRect:referenceCenter:", v16, v18, v24, v22, v30, v32, v38, v36, v39, v40);
      v52[4] = v57;
      v52[5] = v58;
      v52[6] = v59;
      v52[7] = v60;
      v52[0] = v53;
      v52[1] = v54;
      v52[2] = v55;
      v52[3] = v56;
      [v8 setTransform3D:v52];
      [v8 setExists:v61[0]];
      if (self->_usesRenderedStripTopExtendersForTransitions && v5 && self->_transitionZoomingOut)
      {
        [v9 interItemSpacing];
        if (v41 > 0.0) {
          goto LABEL_8;
        }
        transitionSectionInfosByVisualSection = self->_transitionSectionInfosByVisualSection;
        [NSNumber numberWithInteger:v12];
        CGRect v42 = v49 = v27;
        double v51 = [(NSDictionary *)transitionSectionInfosByVisualSection objectForKey:v42];

        uint64_t v48 = -[PUSectionedGridLayout _targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:](self, "_targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:", v13, 0, v12, v51);
        uint64_t v44 = v43;
        uint64_t v45 = [v51 transitionSection];
        uint64_t v46 = v44;
        long long v27 = v49;
        uint64_t v47 = objc_msgSend(v9, "visualGridCoordsForTransitionGridCoords:atTransitionSection:outVisualSection:", v48, v46, v45, 0);

        if (!v47)
        {
LABEL_8:
          if (v13) {
            [v8 setExtendsTopContent:1];
          }
        }
      }
      if (self->_transitionZoomingOut != v5 || !v61[0]) {
        [v8 setAlpha:0.0];
      }
    }
  }
}

- (void)_adjustSectionHeaderLayoutAttributes:(id)a3 toOrFromGridLayout:(id)a4 isAppearing:(BOOL)a5
{
  BOOL v5 = a5;
  id v29 = a3;
  id v8 = a4;
  id v9 = [v29 indexPath];
  int64_t v10 = [(PUSectionedGridLayout *)self visualSectionForSupplementaryViewIndexPath:v9];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v11 = v10;
    [v29 frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    if (self->_floatingHeaderVisualSectionIndex == v11)
    {
      [v8 transitionEffectiveContentOrigin];
      if (v5) {
        double y = self->_transitionStartContentOffset.y;
      }
      else {
        double y = v19 + self->_transitionEndContentOffset.y;
      }
      [(PUSectionedGridLayout *)self _finalContentInset];
      double v21 = y + v28;
    }
    else
    {
      double v21 = v12;
      if ([(PULayoutSampledSectioning *)self->_layoutSectioning numberOfVisualItemsInVisualSection:v11] >= 1)
      {
        uint64_t v22 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v11, 0);
        double v24 = [MEMORY[0x1E4F28D58] indexPathForItem:v23 inSection:v22];
        uint64_t v25 = [(PUSectionedGridLayout *)self layoutAttributesForItemAtIndexPath:v24];
        [(PUSectionedGridLayout *)self _adjustGridTransitionLayoutAttributes:v25 toOrFromGridLayout:v8 outTargetRowExists:0 isAppearing:v5];
        [v25 frame];
        double v27 = v26;
        v31.origin.double x = v14;
        v31.origin.double y = v21;
        v31.size.double width = v16;
        v31.size.double height = v18;
        double v21 = v27 - CGRectGetHeight(v31) - self->_sectionContentInset.top;
      }
    }
    objc_msgSend(v29, "setFrame:", v14, v21, v16, v18);
    [v29 setAlpha:0.0];
  }
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUSectionedGridLayout *)self _gridTransitionLayout];
  if (v8)
  {
    id v9 = [(PUSectionedGridLayout *)self sectionHeaderElementKind];
    if ([v6 isEqualToString:v9])
    {
      BOOL transitionIsAnimated = self->_transitionIsAnimated;

      if (transitionIsAnimated)
      {
        id v11 = [(PUSectionedGridLayout *)self layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];
        [(PUSectionedGridLayout *)self _adjustSectionHeaderLayoutAttributes:v11 toOrFromGridLayout:v8 isAppearing:0];
        goto LABEL_20;
      }
    }
    else
    {
    }
    double v12 = [(PUSectionedGridLayout *)self renderedStripsElementKind];
    if ([v6 isEqualToString:v12])
    {
      BOOL v13 = self->_transitionIsAnimated;

      if (v13)
      {
        id v11 = [(PUSectionedGridLayout *)self layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];
        [(PUSectionedGridLayout *)self _adjustRenderedStripLayoutAttributes:v11 toOrFromGridLayout:v8 isAppearing:0];
        goto LABEL_20;
      }
    }
    else
    {
    }
    if ([v6 isEqualToString:@"PUGridGlobalFooter"])
    {
      v22.receiver = self;
      v22.super_class = (Class)PUSectionedGridLayout;
      double v14 = [(PUSectionedGridLayout *)&v22 finalLayoutAttributesForDisappearingSupplementaryElementOfKind:v6 atIndexPath:v7];
      if ([v14 isHidden])
      {
        double v15 = [(PUSectionedGridLayout *)self layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];
        id v11 = (id)[v15 copy];

        [v11 setAlpha:0.0];
      }
      else
      {
        id v11 = v14;
      }

      goto LABEL_20;
    }
  }
  if (-[NSIndexSet containsIndex:](self->_deletedSections, "containsIndex:", [v7 section]))
  {
    [0 setAlpha:0.0];
    double v16 = [(PUSectionedGridLayout *)self sectionHeaderElementKind];
    int v17 = [v6 isEqualToString:v16];

    id v11 = 0;
    if (v17)
    {
      memset(&v20, 0, sizeof(v20));
      CATransform3DScale(&v21, &v20, 1.0, 0.600000024, 1.0);
      CATransform3D v20 = v21;
      [0 setTransform3D:&v20];
      id v11 = 0;
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)PUSectionedGridLayout;
    id v11 = [(PUSectionedGridLayout *)&v19 finalLayoutAttributesForDisappearingSupplementaryElementOfKind:v6 atIndexPath:v7];
    if ([(PUSectionedGridLayout *)self _isTransitionForeignSupplementaryViewKind:v6])
    {
      [v11 setAlpha:0.0];
    }
  }
LABEL_20:

  return v11;
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUSectionedGridLayout *)self _gridTransitionLayout];
  if (v8)
  {
    id v9 = [(PUSectionedGridLayout *)self sectionHeaderElementKind];
    if ([v6 isEqualToString:v9])
    {
      BOOL transitionIsAnimated = self->_transitionIsAnimated;

      if (transitionIsAnimated)
      {
        id v11 = [(PUSectionedGridLayout *)self layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];
        [(PUSectionedGridLayout *)self _adjustSectionHeaderLayoutAttributes:v11 toOrFromGridLayout:v8 isAppearing:1];
        goto LABEL_17;
      }
    }
    else
    {
    }
    if ([v6 isEqualToString:@"PUGridGlobalFooter"])
    {
      double v12 = [(PUSectionedGridLayout *)self layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];
      if ([v12 isHidden])
      {
        id v11 = v12;
        [v11 setAlpha:0.0];
      }
      else
      {
        v17.receiver = self;
        v17.super_class = (Class)PUSectionedGridLayout;
        id v11 = [(PUSectionedGridLayout *)&v17 initialLayoutAttributesForAppearingSupplementaryElementOfKind:v6 atIndexPath:v7];
      }

      goto LABEL_17;
    }
    BOOL v13 = [(PUSectionedGridLayout *)self renderedStripsElementKind];
    if ([v6 isEqualToString:v13])
    {
      BOOL v14 = self->_transitionIsAnimated;

      if (v14)
      {
        id v11 = [(PUSectionedGridLayout *)self layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];
        [(PUSectionedGridLayout *)self _adjustRenderedStripLayoutAttributes:v11 toOrFromGridLayout:v8 isAppearing:1];
        goto LABEL_17;
      }
    }
    else
    {
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)PUSectionedGridLayout;
  id v11 = [(PUSectionedGridLayout *)&v16 initialLayoutAttributesForAppearingSupplementaryElementOfKind:v6 atIndexPath:v7];
  if ([(PUSectionedGridLayout *)self _isTransitionForeignSupplementaryViewKind:v6])
  {
    [v11 setAlpha:0.0];
  }
LABEL_17:

  return v11;
}

- (CGRect)_frameByAdjustingOffScreenEnteringFrame:(CGRect)a3 forRowAtVisualIndexPath:(PUSimpleIndexPath)a4 transitionSectionInfo:(id)a5 toOrFromGridLayout:(id)a6 isAppearing:(BOOL)a7
{
  BOOL v7 = a7;
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v16 = a5;
  id v17 = a6;
  [v17 transitionEffectiveContentOrigin];
  if (v7) {
    double MinY = self->_transitionStartContentOffset.y;
  }
  else {
    double MinY = v18 + self->_transitionEndContentOffset.y;
  }
  CATransform3D v20 = [(PUSectionedGridLayout *)self collectionView];
  [v20 bounds];
  double v21 = MinY + CGRectGetHeight(v65);

  v66.origin.CGFloat x = x;
  v66.origin.double y = y;
  v66.size.CGFloat width = width;
  v66.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v66);
  if (MaxY < MinY)
  {
    BOOL v63 = v7;
    uint64_t v23 = [v17 transitionFirstVisibleRowVisualPath];
    goto LABEL_8;
  }
  v67.origin.CGFloat x = x;
  v67.origin.double y = y;
  v67.size.CGFloat width = width;
  v67.size.CGFloat height = height;
  if (CGRectGetMinY(v67) > v21)
  {
    BOOL v63 = v7;
    uint64_t v23 = [v17 transitionLastVisibleRowVisualPath];
LABEL_8:
    double v24 = v23;
    uint64_t v64 = 0;
    uint64_t v25 = objc_msgSend(v17, "targetTransitionGridCoordsForGridCoords:atVisualSection:outTransitionSection:", objc_msgSend(v23, "item"), 0, objc_msgSend(v23, "section"), &v64);
    transitionSectionInfosByTransitionSection = self->_transitionSectionInfosByTransitionSection;
    double v27 = [NSNumber numberWithInteger:v64];
    double v28 = [(NSDictionary *)transitionSectionInfosByTransitionSection objectForKey:v27];

    uint64_t v29 = [v28 contiguousRows];
    if (v29 <= 0 || (v25 & ~(v25 >> 63)) < v29) {
      uint64_t v31 = v25 & ~(v25 >> 63);
    }
    else {
      uint64_t v31 = v29 - 1;
    }
    uint64_t v32 = [(PUSectionedGridLayout *)self _visualRowPathForTransitionRowIndex:v31 transitionSectionInfo:v28];
    if (MaxY < MinY && var0 > v32) {
      goto LABEL_43;
    }
    int64_t v35 = v32;
    int64_t v62 = var0;
    if (MaxY >= MinY)
    {
      int64_t v36 = v33;
      int64_t v33 = var1;
      int64_t v37 = var0;
      int64_t var0 = v32;
      int64_t v35 = v37;
      if (v37 < v32) {
        goto LABEL_37;
      }
    }
    else
    {
      int64_t v36 = var1;
    }
    int64_t v60 = var1;
    id v61 = v16;
    if (v35 >= var0)
    {
      uint64_t v39 = 1;
      if (v35 == var0) {
        uint64_t v39 = -v36;
      }
      uint64_t v38 = v33 + v39;
      if (v35 > var0)
      {
        uint64_t v40 = -v36;
        do
        {
          int64_t v41 = v35 - 1;
          int64_t v42 = [(PUSectionedGridLayout *)self numberOfRowsInVisualSection:v35 - 1];
          if (var0 + 1 == v35) {
            uint64_t v43 = v40;
          }
          else {
            uint64_t v43 = 1;
          }
          uint64_t v38 = v42 + v38 + v43 - 1;
          --v35;
        }
        while (v41 > var0);
      }
    }
    else
    {
      uint64_t v38 = 0;
    }
    objc_msgSend(v17, "frameForItemAtGridCoordinates:inVisualSection:", objc_msgSend(v24, "row"), 0, objc_msgSend(v24, "section"));
    if (MaxY >= MinY)
    {
      double v21 = CGRectGetMaxY(*(CGRect *)&v44);
      id v16 = v61;
      if (v38 > 0)
      {
LABEL_44:
        [v17 itemSize];
        double v54 = v53;
        [v17 interItemSpacing];
        double y = v21 + v55 * (double)v38 + (double)(v38 - 1) * v54;
        goto LABEL_45;
      }
      double v52 = @"N";
      if (v63) {
        double v52 = @"Y";
      }
      NSLog(&cfstr_Offscreenrowof.isa, v38, v62, v60, v52);
LABEL_43:
      uint64_t v38 = 1;
      goto LABEL_44;
    }
    double MinY = CGRectGetMinY(*(CGRect *)&v44);
    id v16 = v61;
    if (v38 >= 1)
    {
LABEL_38:
      [v17 itemSize];
      double v50 = v49;
      [v17 interItemSpacing];
      double y = MinY - (v50 + v51) * (double)v38;
LABEL_45:

      goto LABEL_46;
    }
    uint64_t v48 = @"N";
    if (v63) {
      uint64_t v48 = @"Y";
    }
    NSLog(&cfstr_Offscreenrowof.isa, v38, v62, v60, v48);
LABEL_37:
    uint64_t v38 = 1;
    goto LABEL_38;
  }
LABEL_46:

  double v56 = x;
  double v57 = y;
  double v58 = width;
  double v59 = height;
  result.size.CGFloat height = v59;
  result.size.CGFloat width = v58;
  result.origin.double y = v57;
  result.origin.CGFloat x = v56;
  return result;
}

- (PUGridCoordinates)_targetTransitionGridCoordsForGridCoords:(PUGridCoordinates)a3 atVisualSection:(int64_t)a4 transitionSectionInfo:(id)a5
{
  int64_t column = a3.column;
  int64_t row = a3.row;
  id v10 = a5;
  id v11 = [(PUSectionedGridLayout *)self _gridTransitionLayout];
  if (!v11)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PUSectionedGridLayout.m" lineNumber:1853 description:@"Cannot compute transition coordinates while not in a transition"];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    if (self->_transitionIsAppearing) {
      id v17 = @"Y";
    }
    else {
      id v17 = @"N";
    }
    NSLog(&cfstr_NoTransitionSe.isa, row, column, a4, v17);
    int64_t column = 0;
    uint64_t v15 = 0;
    goto LABEL_9;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  double v12 = [v10 visualSections];
  BOOL v13 = [v10 visualRowStartMarkers];
  BOOL v14 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v12, "countOfIndexesInRange:", 0, a4));
  uint64_t v15 = [v14 integerValue] + row;

LABEL_9:
  uint64_t v18 = [v10 anchorShiftOffset];
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_transitionIsAppearing) {
      objc_msgSend(v11, "transitionAnchorIndexPathForTransitionSection:", objc_msgSend(v10, "transitionSection"));
    }
    else {
    objc_super v22 = [v10 anchorRealPath];
    }
    if (v22)
    {
      uint64_t v23 = [(PUSectionedGridLayout *)self gridCoordinatesInTransitionSectionForItemAtIndexPath:v22];
      uint64_t v20 = [v11 gridCoordinatesInTransitionSectionForItemAtIndexPath:v22] - v23;
    }
    else
    {
      uint64_t v20 = 0;
    }
    if (self->_transitionIsAppearing) {
      uint64_t v21 = -[v11 transitionAnchorColumnOffset];
    }
    else {
      uint64_t v21 = [(PUSectionedGridLayout *)self transitionAnchorColumnOffset];
    }
    objc_msgSend(v10, "setAnchorShiftOffset:", v20, v21);
  }
  else
  {
    uint64_t v20 = v18;
    uint64_t v21 = v19;
  }

  int64_t v24 = v20 + v15;
  int64_t v25 = v21 + column;
  result.int64_t column = v25;
  result.int64_t row = v24;
  return result;
}

- (void)_adjustGridTransitionLayoutAttributes:(id)a3 toOrFromGridLayout:(id)a4 outTargetRowExists:(BOOL *)a5 isAppearing:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  double v55 = [v10 indexPath];
  uint64_t v12 = -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](self->_layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", [v55 section], objc_msgSend(v55, "item"), 0);
  uint64_t v14 = v13;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v51 = [MEMORY[0x1E4F28B00] currentHandler];
    double v52 = v51;
    double v53 = @"disappearing";
    if (v6) {
      double v53 = @"appearing";
    }
    [v51 handleFailureInMethod:a2, self, @"PUSectionedGridLayout.m", 1792, @"Adjusting grid transition layout attributes %@ betweet %@ (self) and %@ (%@) for an unknown visual section", v10, self, v11, v53 object file lineNumber description];
  }
  uint64_t v15 = [(PUSectionedGridLayout *)self gridCoordinatesInSectionForItemAtVisualIndex:v14];
  uint64_t v17 = v16;
  transitionSectionInfosByVisualSection = self->_transitionSectionInfosByVisualSection;
  uint64_t v19 = [NSNumber numberWithInteger:v12];
  uint64_t v20 = [(NSDictionary *)transitionSectionInfosByVisualSection objectForKey:v19];

  uint64_t v21 = -[PUSectionedGridLayout _targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:](self, "_targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:", v15, v17, v12, v20);
  uint64_t v23 = v22;
  objc_msgSend(v11, "frameForItemAtGridCoordinates:inTransitionSection:", v21, v22, objc_msgSend(v20, "transitionSection"));
  [(PUSectionedGridLayout *)self _frameByAdjustingOffScreenEnteringFrame:v12 forRowAtVisualIndexPath:v15 transitionSectionInfo:v20 toOrFromGridLayout:v11 isAppearing:v6];
  double v54 = v24;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  uint64_t v31 = objc_msgSend(v11, "numberOfContiguousRowsInTransitionSection:", objc_msgSend(v20, "transitionSection"));
  uint64_t v32 = [v11 itemsPerRow];
  BOOL v34 = v21 >= 0 && v21 < v31;
  int v36 = v23 >= 0 && v23 < v32;
  unsigned int v37 = objc_msgSend(v11, "hasItemAtGridCoordinates:inTransitionSection:", v21, v23, objc_msgSend(v20, "transitionSection"));
  [v10 alpha];
  double v39 = 0.0;
  if (v34 & (v37 | ~v36) & v6) {
    double v39 = v38;
  }
  if (self->_usesRenderedStrips) {
    double v40 = v38;
  }
  else {
    double v40 = v39;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  [v10 frame];
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  [v10 center];
  -[PUSectionedGridLayout _transformToConvertRect:intoRect:referenceCenter:](self, "_transformToConvertRect:intoRect:referenceCenter:", v42, v44, v46, v48, v54, v26, v28, v30, v49, v50);
  v57[4] = v62;
  v57[5] = v63;
  v57[6] = v64;
  v57[7] = v65;
  v57[0] = v58;
  v57[1] = v59;
  v57[2] = v60;
  v57[3] = v61;
  [v10 setTransform3D:v57];
  [v10 setAlpha:v40];
  [v10 setExists:v34 & v36 & v37];
  if (a5) {
    *a5 = v34;
  }
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PUSectionedGridLayout *)self _gridTransitionLayout];
  if (v5 && (BOOL transitionIsAnimated = self->_transitionIsAnimated, v5, transitionIsAnimated))
  {
    BOOL v7 = [(PUSectionedGridLayout *)self layoutAttributesForItemAtIndexPath:v4];
    id v8 = [(PUSectionedGridLayout *)self _gridTransitionLayout];
    [(PUSectionedGridLayout *)self _adjustGridTransitionLayoutAttributes:v7 toOrFromGridLayout:v8 outTargetRowExists:0 isAppearing:0];
  }
  else if ([(NSSet *)self->_deletedItemIndexPaths containsObject:v4] {
         || -[NSIndexSet containsIndex:](self->_deletedSections, "containsIndex:", [v4 section]))
  }
  {
    v15.receiver = self;
    v15.super_class = (Class)PUSectionedGridLayout;
    id v9 = [(PUSectionedGridLayout *)&v15 finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
    BOOL v7 = v9;
    memset(&v14, 0, sizeof(v14));
    if (v9) {
      [v9 transform3D];
    }
    CATransform3D v12 = v14;
    CATransform3DScale(&v13, &v12, 0.600000024, 0.600000024, 1.0);
    CATransform3D v14 = v13;
    [v7 setAlpha:0.0];
    CATransform3D v13 = v14;
    [v7 setTransform3D:&v13];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PUSectionedGridLayout;
    BOOL v7 = [(PUSectionedGridLayout *)&v11 finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
  }

  return v7;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PUSectionedGridLayout *)self _gridTransitionLayout];
  if (v5 && (BOOL transitionIsAnimated = self->_transitionIsAnimated, v5, transitionIsAnimated))
  {
    BOOL v7 = [(PUSectionedGridLayout *)self layoutAttributesForItemAtIndexPath:v4];
    id v8 = [(PUSectionedGridLayout *)self _gridTransitionLayout];
    [(PUSectionedGridLayout *)self _adjustGridTransitionLayoutAttributes:v7 toOrFromGridLayout:v8 outTargetRowExists:0 isAppearing:1];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PUSectionedGridLayout;
    BOOL v7 = [(PUSectionedGridLayout *)&v10 initialLayoutAttributesForAppearingItemAtIndexPath:v4];
  }

  return v7;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  if (self->_transitionLayout)
  {
    double x = self->_transitionEndContentOffset.x + self->_transitionEffectiveContentOrigin.x;
    double y = self->_transitionEndContentOffset.y + self->_transitionEffectiveContentOrigin.y;
  }
  else
  {
    viewSizeTransitionAnchorItem = self->_viewSizeTransitionAnchorItem;
    if (viewSizeTransitionAnchorItem)
    {
      [(PUSectionedGridLayout *)self _targetContentOffsetWithAnchorItemIndexPath:viewSizeTransitionAnchorItem isRotation:1 orTransitionFromLayout:0 keepAnchorStable:1];
      double x = v7;
      double y = v8;
    }
    else if (self->_processingCollectionViewUpdates && self->_delegateSupportsTargetContentOffset)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "sectionedGridLayout:targetContentOffsetForProposedUpdatesContentOffset:", self, x, y);
      double x = v10;
      double y = v11;
    }
  }
  double v12 = x;
  double v13 = y;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGPoint)_targetContentOffsetWithAnchorItemIndexPath:(id)a3 isRotation:(BOOL)a4 orTransitionFromLayout:(id)a5 keepAnchorStable:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  double v12 = (CGFloat *)MEMORY[0x1E4F1DAD8];
  double v13 = [(PUSectionedGridLayout *)self collectionView];
  [v13 bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double v21 = v20;

  [(PUSectionedGridLayout *)self _finalContentInset];
  double v23 = v22;
  double v25 = v24;
  double height = self->_contentSize.height;
  uint64_t v27 = [(PUSectionedGridLayout *)self numberOfRealSections];
  uint64_t v28 = v27 - 1;
  if (v27 < 1
    || [(PUSectionedGridLayout *)self numberOfRealItemsInRealSection:v28] < 1)
  {
    double v29 = 0;
  }
  else
  {
    double v29 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", -[PUSectionedGridLayout numberOfRealItemsInRealSection:](self, "numberOfRealItemsInRealSection:", v28) - 1, v28);
  }
  CGFloat v30 = *v12;
  double v69 = -v23;
  double v70 = height;
  if (v10)
  {
    if (![v10 section] && !objc_msgSend(v10, "item"))
    {
      double v40 = -v23;
      double v31 = v69;
      goto LABEL_24;
    }
    if ([v29 isEqual:v10])
    {
      double v31 = v25 + height - v21;
    }
    else
    {
      double v68 = v25;
      double v32 = v21;
      int64_t v33 = [(PUSectionedGridLayout *)self layoutAttributesForItemAtIndexPath:v10];
      [v33 center];
      double v35 = v34;
      if (v8)
      {
        double viewSizeTransitionAnchorItemNormalizedYOffset = self->_viewSizeTransitionAnchorItemNormalizedYOffset;
        v72.origin.double x = v15;
        v72.origin.double y = v17;
        v72.size.CGFloat width = v19;
        v72.size.double height = v32;
        double v37 = viewSizeTransitionAnchorItemNormalizedYOffset * CGRectGetHeight(v72);
      }
      else if (v11 && v6)
      {
        double v38 = [v11 layoutAttributesForItemAtIndexPath:v10];
        [v38 center];
        double v37 = v39 - self->_transitionStartContentOffset.y;
      }
      else
      {
        v73.origin.double x = v15;
        v73.origin.double y = v17;
        v73.size.CGFloat width = v19;
        v73.size.double height = v32;
        double v37 = CGRectGetHeight(v73) * 0.5;
      }
      double v66 = v17;
      double v67 = v15;
      double v41 = v35 - v37;
      double v42 = 0.0;
      if (!self->_dynamicLayoutEnabled) {
        -[PUSectionedGridLayout _finalSectionHeaderHeightForSection:](self, "_finalSectionHeaderHeightForSection:", 0x7FFFFFFFFFFFFFFFLL, 0.0);
      }
      double v43 = v23 + v42 + 4.0;
      CGFloat v44 = v41 + v43;
      CGFloat v45 = v32 - (v68 + v43 + 4.0);
      objc_msgSend(v33, "frame", v41 + v43, *(void *)&v32);
      double v65 = v41;
      CGFloat v47 = v46;
      CGFloat v49 = v48;
      CGFloat v51 = v50;
      CGFloat v53 = v52;
      v74.origin.double x = v30;
      v74.origin.double y = v44;
      v74.size.CGFloat width = v19;
      v74.size.double height = v45;
      double MinY = CGRectGetMinY(v74);
      v75.origin.double x = v47;
      v75.origin.double y = v49;
      v75.size.CGFloat width = v51;
      v75.size.double height = v53;
      double v55 = MinY - CGRectGetMinY(v75);
      v76.origin.double x = v47;
      v76.origin.double y = v49;
      double v25 = v68;
      v76.size.CGFloat width = v51;
      v76.size.double height = v53;
      double MaxY = CGRectGetMaxY(v76);
      v77.origin.double x = v30;
      v77.size.CGFloat width = v19;
      v77.size.double height = v45;
      v77.origin.double y = v63;
      double v21 = v64;
      double v57 = MaxY - CGRectGetMaxY(v77);
      double v58 = v65 - fmax(v55, 0.0);
      if (v57 <= 0.0) {
        double v57 = -0.0;
      }
      double v31 = v58 + v57;

      CGFloat v17 = v66;
      CGFloat v15 = v67;
    }
  }
  else
  {
    double v31 = v12[1];
  }
  double v40 = v69;
LABEL_24:
  v78.origin.double x = v15;
  v78.origin.double y = v17;
  v78.size.CGFloat width = v19;
  v78.size.double height = v21;
  double v59 = v25 + v70 - CGRectGetHeight(v78);
  if (v31 < v59) {
    double v59 = v31;
  }
  if (v59 >= v40) {
    double v60 = v59;
  }
  else {
    double v60 = v40;
  }

  double v61 = v30;
  double v62 = v60;
  result.double y = v62;
  result.double x = v61;
  return result;
}

- (CGPoint)targetContentOffsetForViewSizeTransitionContext:(id)a3
{
  BOOL v5 = self->_viewSizeTransitionAnchorItem;
  double viewSizeTransitionAnchorItemNormalizedYOffset = self->_viewSizeTransitionAnchorItemNormalizedYOffset;
  id v7 = a3;
  BOOL v8 = [v7 objectForKeyedSubscript:@"anchorItem"];
  viewSizeTransitionAnchorItem = self->_viewSizeTransitionAnchorItem;
  self->_viewSizeTransitionAnchorItem = v8;

  id v10 = [v7 objectForKeyedSubscript:@"normalizedYOffset"];

  [v10 floatValue];
  self->_double viewSizeTransitionAnchorItemNormalizedYOffset = v11;

  [(PUSectionedGridLayout *)self _targetContentOffsetWithAnchorItemIndexPath:self->_viewSizeTransitionAnchorItem isRotation:1 orTransitionFromLayout:0 keepAnchorStable:1];
  double v13 = v12;
  double v15 = v14;
  double v16 = self->_viewSizeTransitionAnchorItem;
  self->_viewSizeTransitionAnchorItem = v5;
  CGFloat v17 = v5;

  self->_double viewSizeTransitionAnchorItemNormalizedYOffset = viewSizeTransitionAnchorItemNormalizedYOffset;
  double v18 = v13;
  double v19 = v15;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (CGPoint)targetContentOffsetForTransitionFromGridLayout:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PUSectionedGridLayout *)self transitionExplicitAnchorItemIndexPath];
  [(PUSectionedGridLayout *)self _targetContentOffsetWithAnchorItemIndexPath:v5 isRotation:0 orTransitionFromLayout:v4 keepAnchorStable:1];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)_didFinishLayoutTransitionAnimations:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUSectionedGridLayout;
  [(PUSectionedGridLayout *)&v7 _didFinishLayoutTransitionAnimations:sel__didFinishLayoutTransitionAnimations_];
  transitionAnimationEndCleanupBlock = (void (**)(id, BOOL))self->_transitionAnimationEndCleanupBlock;
  if (transitionAnimationEndCleanupBlock)
  {
    transitionAnimationEndCleanupBlock[2](transitionAnimationEndCleanupBlock, v3);
    id v6 = self->_transitionAnimationEndCleanupBlock;
    self->_transitionAnimationEndCleanupBlock = 0;
  }
}

- (void)finalizeLayoutTransition
{
  v27.receiver = self;
  v27.super_class = (Class)PUSectionedGridLayout;
  [(PUSectionedGridLayout *)&v27 finalizeLayoutTransition];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = self->_transitionLayout;
    id v4 = v3;
    if (v3)
    {
      BOOL v5 = [(UICollectionViewLayout *)v3 transitionLayout];

      if (v5 != self) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    id v4 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 sectionedGridLayout:self didFinalizePrepareTransitionIsAppearing:self->_transitionIsAppearing];
  }
  double v9 = [(UICollectionViewLayout *)v4 delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = [(UICollectionViewLayout *)v4 delegate];
    objc_msgSend(v11, "sectionedGridLayout:didFinalizePrepareTransitionIsAppearing:", v4, -[UICollectionViewLayout transitionIsAppearing](v4, "transitionIsAppearing"));
  }
LABEL_10:
  double v12 = self->_transitionLayout;
  BOOL transitionIsAppearing = self->_transitionIsAppearing;
  transitionSectionInfosByTransitionSection = self->_transitionSectionInfosByTransitionSection;
  self->_transitionSectionInfosByTransitionSection = 0;

  transitionSectionInfosByVisualSection = self->_transitionSectionInfosByVisualSection;
  self->_transitionSectionInfosByVisualSection = 0;

  transitionFirstVisibleRowVisualPath = self->_transitionFirstVisibleRowVisualPath;
  self->_transitionFirstVisibleRowVisualPath = 0;

  transitionLastVisibleRowVisualPath = self->_transitionLastVisibleRowVisualPath;
  self->_transitionLastVisibleRowVisualPath = 0;

  self->_transitionAnchorColumnOffset = 0;
  self->_transitionAnchorShiftsColumns = 0;
  transitionExplicitAnchorItemIndexPath = self->_transitionExplicitAnchorItemIndexPath;
  self->_transitionExplicitAnchorItemIndexPath = 0;

  self->_transitionZoomingOut = 0;
  transitionLayout = self->_transitionLayout;
  self->_transitionLayout = 0;

  self->_BOOL transitionIsAnimated = 0;
  CGPoint v20 = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_transitionStartContentOffset = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_transitionEndContentOffset = v20;
  self->_transitionEffectiveContentOrigin = v20;
  self->_transitionApplyingEffectiveContentOrigin = 0;
  self->_BOOL transitionIsAppearing = 0;
  if (v12)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__PUSectionedGridLayout_finalizeLayoutTransition__block_invoke;
    aBlock[3] = &unk_1E5F2BD70;
    BOOL v26 = transitionIsAppearing;
    aBlock[4] = self;
    double v25 = v12;
    double v21 = _Block_copy(aBlock);
    double v22 = _Block_copy(v21);
    id transitionAnimationEndCleanupBlock = self->_transitionAnimationEndCleanupBlock;
    self->_id transitionAnimationEndCleanupBlock = v22;
  }
}

uint64_t __49__PUSectionedGridLayout_finalizeLayoutTransition__block_invoke(uint64_t a1, uint64_t a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PUSectionedGridLayout_finalizeLayoutTransition__block_invoke_2;
  v5[3] = &unk_1E5F2BD48;
  char v6 = *(unsigned char *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  char v7 = a2;
  uint64_t result = [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
  if (*(unsigned char *)(a1 + 48)) {
    return [*(id *)(a1 + 40) _didFinishLayoutTransitionAnimations:a2];
  }
  return result;
}

void __49__PUSectionedGridLayout_finalizeLayoutTransition__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) invalidateLayout];
    v2 = [*(id *)(a1 + 32) collectionView];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) collectionView];
      [v4 _commitDeferredContentOffsetTransition];
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 592) didFinishLayoutTransitionAnimations:*(unsigned __int8 *)(a1 + 41) transitionIsAppearing:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(void **)(v5 + 592);
  *(void *)(v5 + 592) = 0;

  if (*(unsigned char *)(a1 + 40))
  {
    id v7 = [*(id *)(a1 + 32) collectionView];
    [v7 layoutIfNeeded];
  }
}

- (void)_prepareForTransitionToOrFromGridLayout:(id)a3 isAppearing:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = (UICollectionViewLayout *)a3;
  double v9 = v8;
  transitionLayout = self->_transitionLayout;
  if (transitionLayout) {
    BOOL v11 = transitionLayout == v8;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    double v59 = [MEMORY[0x1E4F28B00] currentHandler];
    [v59 handleFailureInMethod:a2 object:self file:@"PUSectionedGridLayout.m" lineNumber:1266 description:@"The initial transition layout doesn't match the one we will transition to/from."];

    transitionLayout = self->_transitionLayout;
  }
  if (transitionLayout && self->_transitionIsAppearing != v4)
  {
    double v60 = [MEMORY[0x1E4F28B00] currentHandler];
    [v60 handleFailureInMethod:a2 object:self file:@"PUSectionedGridLayout.m" lineNumber:1267 description:@"The initial transitionIsAppearing doesn't match actual transition direction."];
  }
  self->_BOOL transitionIsAppearing = v4;
  objc_storeStrong((id *)&self->_transitionLayout, a3);
  viewSizeTransitionAnchorItem = self->_viewSizeTransitionAnchorItem;
  self->_viewSizeTransitionAnchorItem = 0;

  if (v4)
  {
    double v13 = [(PUSectionedGridLayout *)self collectionView];
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      goto LABEL_14;
    }
    double v15 = [(PUSectionedGridLayout *)self collectionView];
    -[UICollectionViewLayout _beginDeferredContentOffsetTransitionToOffset:contentSize:](v15, "_beginDeferredContentOffsetTransitionToOffset:contentSize:", self->_transitionEndContentOffset.x, self->_transitionEndContentOffset.y, self->_contentSize.width, self->_contentSize.height);
  }
  else
  {
    double v15 = v9;
    [(UICollectionViewLayout *)v15 setIsPreparingLayout:1];
    [(UICollectionViewLayout *)v15 targetContentOffsetForTransitionFromGridLayout:self];
    self->_transitionEndContentOffset.double x = v16;
    self->_transitionEndContentOffset.double y = v17;
    -[UICollectionViewLayout adjustEffectiveContentOriginForTransitionEndContentOffset:](v15, "adjustEffectiveContentOriginForTransitionEndContentOffset:");
    [(UICollectionViewLayout *)v15 setIsPreparingLayout:0];
  }

LABEL_14:
  [(PUSectionedGridLayout *)self _invalidateFloatingHeadersLayout];
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  double v18 = [(PUSectionedGridLayout *)self collectionView];
  [v18 bounds];
  double v20 = v19;
  double v22 = v21;
  if (v4)
  {
    [(PUSectionedGridLayout *)self transitionEffectiveContentOrigin];
    double v24 = v23 + self->_transitionEndContentOffset.x;
    double v26 = v25 + self->_transitionEndContentOffset.y;
    double x = self->_transitionStartContentOffset.x;
    double y = self->_transitionStartContentOffset.y;
  }
  else
  {
    [(UICollectionViewLayout *)v9 transitionEffectiveContentOrigin];
    double v24 = self->_transitionStartContentOffset.x;
    double v26 = self->_transitionStartContentOffset.y;
    double x = v29 + self->_transitionEndContentOffset.x;
    double y = v30 + self->_transitionEndContentOffset.y;
  }
  uint64_t v31 = -[PUSectionedGridLayout transitionSectionsInRect:toOrFromGridLayout:](self, "transitionSectionsInRect:toOrFromGridLayout:", v9, v24, v26, v20, v22);
  uint64_t v32 = -[UICollectionViewLayout transitionSectionsInRect:toOrFromGridLayout:](v9, "transitionSectionsInRect:toOrFromGridLayout:", self, x, y, v20, v22);
  int64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndexSet:v31];
  [v33 addIndexes:v32];
  double v64 = v18;
  double v62 = (void *)v32;
  CGFloat v63 = (void *)v31;
  BOOL v65 = [(PUSectionedGridLayout *)self _visualSectionsMatchTransitionSectionsToOrFromLayout:v9];
  if (v4
    || ([(PUSectionedGridLayout *)self transitionExplicitAnchorItemIndexPath],
        (double v34 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v36 = 0;
    uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    layoutSectioning = self->_layoutSectioning;
    id v36 = v34;
    uint64_t v37 = [v36 item];
    uint64_t v38 = [v36 section];

    uint64_t v39 = -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", v38, v37, 0);
    uint64_t v41 = v40;
  }
  double v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v33, "count"));
  double v43 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:self->_totalVisualSections];
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3010000000;
  long long v91 = "";
  int64x2_t v92 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  uint64_t v83 = 0;
  id v84 = &v83;
  uint64_t v85 = 0x3010000000;
  v86 = "";
  int64x2_t v87 = v92;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __77__PUSectionedGridLayout__prepareForTransitionToOrFromGridLayout_isAppearing___block_invoke;
  v67[3] = &unk_1E5F2BD20;
  id v61 = v42;
  id v68 = v61;
  BOOL v81 = v65;
  double v66 = v9;
  double v69 = v66;
  double v70 = self;
  id v44 = v43;
  double v75 = v24;
  double v76 = v26;
  double v77 = v20;
  double v78 = v22;
  id v71 = v44;
  CGRect v73 = &v88;
  CGRect v74 = &v83;
  BOOL v82 = v4;
  uint64_t v79 = v39;
  uint64_t v80 = v41;
  id v45 = v36;
  id v72 = v45;
  [v33 enumerateIndexesUsingBlock:v67];
  objc_storeStrong((id *)&self->_transitionSectionInfosByTransitionSection, v42);
  objc_storeStrong((id *)&self->_transitionSectionInfosByVisualSection, v43);
  double v46 = [MEMORY[0x1E4F28D58] indexPathForItem:v89[5] inSection:v89[4]];
  transitionFirstVisibleRowVisualPath = self->_transitionFirstVisibleRowVisualPath;
  self->_transitionFirstVisibleRowVisualPath = v46;

  double v48 = [MEMORY[0x1E4F28D58] indexPathForItem:v84[5] inSection:v84[4]];
  transitionLastVisibleRowVisualPath = self->_transitionLastVisibleRowVisualPath;
  self->_transitionLastVisibleRowVisualPath = v48;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v50 = self->_transitionLayout;
    CGFloat v51 = v50;
    if (v50)
    {
      double v52 = [(UICollectionViewLayout *)v50 transitionLayout];

      if (v52 != self) {
        goto LABEL_30;
      }
    }
  }
  else
  {
    CGFloat v51 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v54 = objc_opt_respondsToSelector();

  if (v54)
  {
    id v55 = objc_loadWeakRetained((id *)&self->_delegate);
    [v55 sectionedGridLayout:self didPrepareTransitionIsAppearing:self->_transitionIsAppearing];
  }
  double v56 = [(UICollectionViewLayout *)v51 delegate];
  char v57 = objc_opt_respondsToSelector();

  if (v57)
  {
    double v58 = [(UICollectionViewLayout *)v51 delegate];
    objc_msgSend(v58, "sectionedGridLayout:didPrepareTransitionIsAppearing:", v51, -[UICollectionViewLayout transitionIsAppearing](v51, "transitionIsAppearing"));
  }
LABEL_30:

  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v88, 8);
}

void __77__PUSectionedGridLayout__prepareForTransitionToOrFromGridLayout_isAppearing___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = [NSNumber numberWithInteger:a2];
  uint64_t v5 = objc_alloc_init(PUTransitionSectionInfo);
  [(PUTransitionSectionInfo *)v5 setTransitionSection:a2];
  [*(id *)(a1 + 32) setObject:v5 forKey:v4];
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x2020000000;
  uint64_t v88 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v81 = 0;
  BOOL v82 = &v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  uint64_t v76 = 0;
  double v77 = &v76;
  uint64_t v78 = 0x3010000000;
  uint64_t v79 = "";
  int64x2_t v80 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  uint64_t v71 = 0;
  id v72 = &v71;
  uint64_t v73 = 0x3010000000;
  CGRect v74 = "";
  int64x2_t v75 = v80;
  uint64_t v67 = 0;
  id v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v63 = 0;
  double v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 0x7FFFFFFFFFFFFFFFLL;
  char v6 = [MEMORY[0x1E4F28E60] indexSet];
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:&unk_1F078CE60];
  [(PUTransitionSectionInfo *)v5 setVisualSections:v6];
  [(PUTransitionSectionInfo *)v5 setVisualRowStartMarkers:v7];
  if (*(unsigned char *)(a1 + 136))
  {
    [v6 addIndex:a2];
  }
  else
  {
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __77__PUSectionedGridLayout__prepareForTransitionToOrFromGridLayout_isAppearing___block_invoke_173;
    v61[3] = &unk_1E5F2BCD0;
    id v8 = *(void **)(a1 + 40);
    v61[4] = *(void *)(a1 + 48);
    id v62 = v6;
    [v8 enumerateRealSectionsForVisualSection:a2 usingBlock:v61];
  }
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  v60[3] = 0;
  uint64_t v56 = 0;
  char v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v55[3] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  uint64_t v37 = __77__PUSectionedGridLayout__prepareForTransitionToOrFromGridLayout_isAppearing___block_invoke_2;
  uint64_t v38 = &unk_1E5F2BCF8;
  id v39 = *(id *)(a1 + 56);
  double v9 = v5;
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v40 = v9;
  uint64_t v41 = v10;
  long long v53 = *(_OWORD *)(a1 + 88);
  long long v54 = *(_OWORD *)(a1 + 104);
  double v43 = v60;
  id v11 = v7;
  id v42 = v11;
  id v44 = &v76;
  id v45 = &v67;
  double v46 = &v71;
  CGFloat v47 = &v63;
  long long v48 = *(_OWORD *)(a1 + 72);
  CGFloat v49 = v55;
  double v50 = &v85;
  CGFloat v51 = &v56;
  double v52 = &v81;
  [v6 enumerateIndexesUsingBlock:&v35];
  -[PUTransitionSectionInfo setContiguousRows:](v9, "setContiguousRows:", v82[3], v35, v36, v37, v38);
  if (!*(unsigned char *)(a1 + 137))
  {
    if ([v6 containsIndex:*(void *)(a1 + 120)])
    {
      id v12 = *(id *)(a1 + 64);
      [*(id *)(a1 + 48) gridCoordinatesInSectionForItemAtVisualIndex:*(void *)(a1 + 128)];
      if (*(unsigned char *)(*(void *)(a1 + 48) + 611))
      {
        uint64_t v14 = v13;
        [*(id *)(a1 + 40) gridCoordinatesInVisualSectionForItemAtIndexPath:v12];
        *(void *)(*(void *)(a1 + 48) + 680) = v15 - v14;
      }
      goto LABEL_27;
    }
    if (v77[5] == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
    uint64_t v16 = *(void *)(a1 + 120);
    BOOL v17 = v16 != 0x7FFFFFFFFFFFFFFFLL && v16 > v86[3];
    uint64_t v18 = v77[4];
    BOOL v19 = v18 != [v6 firstIndex] || v77[5] != 0;
    uint64_t v20 = v57[3];
    BOOL v21 = v20 < 1;
    uint64_t v22 = v20 - 1;
    BOOL v23 = !v21 && v72[4] == v86[3] && v72[5] == v22;
    if (v19 || v23 && v17)
    {
      if (!v23)
      {
        uint64_t v29 = v86[3];
        if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_10;
        }
        if (v77[4] > v29) {
          goto LABEL_10;
        }
        uint64_t v30 = v82[3];
        BOOL v21 = v30 < 1;
        uint64_t v31 = v30 - 1;
        if (v21) {
          goto LABEL_10;
        }
        uint64_t v32 = v64[3];
        double v33 = (double)v32 / (double)v31 * ((double)v68[3] / (double)(v68[3] + v31 - v32))
            + (double)v68[3] / (double)v31 * ((double)(v31 - v32) / (double)(v68[3] + v31 - v32));
        if (v33 < 0.0) {
          double v33 = 0.0;
        }
        uint64_t v26 = objc_msgSend(*(id *)(a1 + 48), "_visualRowPathForTransitionRowIndex:transitionSectionInfo:", llround(fmin(v33, 1.0) * (double)v31), v9);
        if (v26 == 0x7FFFFFFFFFFFFFFFLL
          || (uint64_t v24 = objc_msgSend(*(id *)(a1 + 48), "visualIndexForItemAtGridCoordinates:", v34, 0),
              v24 == 0x7FFFFFFFFFFFFFFFLL))
        {
LABEL_10:
          id v12 = 0;
LABEL_27:
          [(PUTransitionSectionInfo *)v9 setAnchorRealPath:v12];
          goto LABEL_28;
        }
LABEL_26:
        uint64_t v27 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 728), "mainRealItemIndexPathForVisualIndexPath:", v26, v24);
        id v12 = [MEMORY[0x1E4F28D58] indexPathForItem:v28 inSection:v27];
        goto LABEL_27;
      }
      uint64_t v24 = [*(id *)(a1 + 48) numberOfVisualItemsInVisualSection:v86[3]] - 1;
      double v25 = v86 + 3;
    }
    else
    {
      uint64_t v24 = 0;
      double v25 = v77 + 4;
    }
    uint64_t v26 = *v25;
    goto LABEL_26;
  }
  id v12 = 0;
LABEL_28:

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(v60, 8);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);
}

uint64_t __77__PUSectionedGridLayout__prepareForTransitionToOrFromGridLayout_isAppearing___block_invoke_173(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) visualSectionForRealSection:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void **)(a1 + 40);
    return [v5 addIndex:v4];
  }
  return result;
}

void __77__PUSectionedGridLayout__prepareForTransitionToOrFromGridLayout_isAppearing___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  char v6 = [NSNumber numberWithInteger:a2];
  [v4 setObject:v5 forKey:v6];

  uint64_t v30 = 0;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 48), "visualRowsInRect:inVisualSection:totalVisualSectionRows:", a2, &v30, *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168), *(double *)(a1 + 176));
  uint64_t v9 = v8;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += v30;
  uint64_t v10 = *(void **)(a1 + 56);
  id v11 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v10 addObject:v11];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v9)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v13 = v30;
    if (*(void *)(v12 + 40) == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(void *)(v12 + 32) = a2;
      *(void *)(v12 + 40) = v7;
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 24)
                                                                  - v13
                                                                  + *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                              + 40);
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8);
    *(void *)(v14 + 32) = a2;
    *(void *)(v14 + 40) = v9 + v7 - 1;
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24)
                                                                - v13
                                                                + *(void *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 40);
    uint64_t v15 = *(void *)(*(void *)(a1 + 104) + 8);
    uint64_t v18 = *(void *)(v15 + 32);
    uint64_t v16 = (_OWORD *)(v15 + 32);
    uint64_t v17 = v18;
    uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL
      || (uint64_t v20 = *(void *)(v19 + 32), v20 < v17)
      || v20 == v17 && *(void *)(v19 + 40) < *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
    {
      *uint64_t v16 = *(_OWORD *)(v19 + 32);
    }
    uint64_t v21 = *(void *)(*(void *)(a1 + 112) + 8);
    uint64_t v24 = *(void *)(v21 + 32);
    uint64_t v22 = (_OWORD *)(v21 + 32);
    uint64_t v23 = v24;
    uint64_t v25 = *(void *)(*(void *)(a1 + 88) + 8);
    if (v24 == 0x7FFFFFFFFFFFFFFFLL
      || (uint64_t v26 = *(void *)(v25 + 32), v26 > v23)
      || v26 == v23 && *(void *)(v25 + 40) > *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40))
    {
      *uint64_t v22 = *(_OWORD *)(v25 + 32);
    }
  }
  uint64_t v27 = *(void *)(*(void *)(a1 + 120) + 8);
  uint64_t v28 = *(void *)(v27 + 24);
  if (v28 == 0x7FFFFFFFFFFFFFFFLL || v28 + 1 == a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = a2;
    *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = v30;
    *(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                             + 24);
    uint64_t v27 = *(void *)(*(void *)(a1 + 120) + 8);
  }
  *(void *)(v27 + 24) = a2;
}

- (void)prepareForTransitionToLayout:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUSectionedGridLayout;
  [(PUSectionedGridLayout *)&v6 prepareForTransitionToLayout:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 nextLayout];

    id v4 = (id)v5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(PUSectionedGridLayout *)self _prepareForTransitionToOrFromGridLayout:v4 isAppearing:0];
  }
}

- (void)prepareForTransitionFromLayout:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUSectionedGridLayout;
  [(PUSectionedGridLayout *)&v6 prepareForTransitionFromLayout:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 currentLayout];

    id v4 = (id)v5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(PUSectionedGridLayout *)self _prepareForTransitionToOrFromGridLayout:v4 isAppearing:1];
  }
}

- (BOOL)_supportsAdvancedTransitionAnimations
{
  return 1;
}

- (void)_updateHasFloatingHeaders
{
  if (self->_sectionHeadersEnabled && self->_floatingSectionHeadersEnabled)
  {
    char v3 = [(PUSectionedGridLayout *)self sectionHeaderElementKind];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  if (self->_hasFloatingHeaders != v4)
  {
    self->_hasFloatingHeaders = v4;
    [(PUSectionedGridLayout *)self invalidateLayoutForMetricsChange];
  }
}

- (void)_invalidateFloatingHeadersLayout
{
  self->_floatingHeadersLayoutIsValid = 0;
  self->_floatingHeaderVisualSectionIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_prepareFloatingHeadersLayoutIfNeeded
{
  if (!self->_floatingHeadersLayoutIsValid)
  {
    if (self->_hasFloatingHeaders)
    {
      [(PUSectionedGridLayout *)self _currentVisibleRectOrigin];
      int64_t v3 = -[PUSectionedGridLayout _floatingHeaderVisualSectionForVisibleOrigin:](self, "_floatingHeaderVisualSectionForVisibleOrigin:");
    }
    else
    {
      int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
    }
    self->_floatingHeaderVisualSectionIndedouble x = v3;
    self->_floatingHeadersLayoutIsValid = 1;
  }
}

- (int64_t)_floatingHeaderVisualSectionForVisibleOrigin:(CGPoint)a3
{
  int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_hasFloatingHeaders)
  {
    double y = a3.y;
    int64_t v6 = [(PUSectionedGridLayout *)self _visualSectionAtPoint:a3.x];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v7 = v6;
      [(PUSectionedGridLayout *)self _startYOfVisualSectionAtIndex:v6];
      double v9 = y - v8;
      int64_t v10 = v7 - 1;
      if (v7 <= 0) {
        int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v9 >= self->_sectionTopPadding) {
        return v7;
      }
      else {
        return v10;
      }
    }
  }
  return v3;
}

- (UIEdgeInsets)_finalContentInset
{
  int64_t v3 = [(PUSectionedGridLayout *)self collectionView];
  [v3 adjustedContentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (self->_delegateSupportsFinalContentInsetForCurrentContentInset)
  {
    uint64_t v12 = [(PUSectionedGridLayout *)self delegate];
    objc_msgSend(v12, "sectionedGridLayout:finalContentInsetForCurrentContentInset:", self, v5, v7, v9, v11);
    double v5 = v13;
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
  }
  double v17 = v5;
  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  result.double right = v20;
  result.double bottom = v19;
  result.double left = v18;
  result.double top = v17;
  return result;
}

- (int64_t)lastPreparedVisualSection
{
  if (!self->_dynamicLayoutEnabled) {
    return self->_totalRealSections - 1;
  }
  int64_t v3 = [(PUSectionedGridLayoutData *)self->_layoutData headerLayoutAttributes];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return self->_totalRealSections - 1;
  }
  double v5 = [(PUSectionedGridLayoutData *)self->_layoutData headerLayoutAttributes];
  double v6 = [v5 lastObject];

  double v7 = [v6 indexPath];
  int64_t v8 = [(PUSectionedGridLayout *)self visualSectionForSupplementaryViewIndexPath:v7];

  return v8;
}

- (int64_t)firstPreparedVisualSection
{
  if (!self->_dynamicLayoutEnabled) {
    return 0;
  }
  int64_t v3 = [(PUSectionedGridLayoutData *)self->_layoutData headerLayoutAttributes];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  double v5 = [(PUSectionedGridLayoutData *)self->_layoutData headerLayoutAttributes];
  double v6 = [v5 firstObject];

  double v7 = [v6 indexPath];
  int64_t v8 = [(PUSectionedGridLayout *)self visualSectionForSupplementaryViewIndexPath:v7];

  return v8;
}

- (BOOL)_hasAccessibilityLargeText
{
  v2 = [(PUSectionedGridLayout *)self collectionView];
  int64_t v3 = [v2 traitCollection];
  BOOL v4 = +[PUInterfaceManager shouldUseAccessibilityLargeTextLayoutWithTraitCollecton:v3];

  return v4;
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 != 1)
  {
    double v14 = 0;
    goto LABEL_12;
  }
  double v10 = [(PUSectionedGridLayout *)self transitioningDelegate];

  if (v10)
  {
    double v11 = [(PUSectionedGridLayout *)self transitioningDelegate];
    int v12 = [v11 collectionViewLayoutShouldProvideCustomAnimations:self];

    if (!v12)
    {
      double v20 = 0;
      goto LABEL_11;
    }
    uint64_t v13 = +[PULayoutAnimationsHelper stackedTransitionAnimationsForReusableView:v8 toLayoutAttributes:v9 shouldUseSpringAnimations:1];
  }
  else
  {
    transitionAnimationsHelper = self->_transitionAnimationsHelper;
    if (!transitionAnimationsHelper)
    {
      double v16 = [[PULayoutAnimationsHelper alloc] initWithSectionedGridLayout:self];
      double v17 = self->_transitionAnimationsHelper;
      self->_transitionAnimationsHelper = v16;

      double v18 = [(PUSectionedGridLayout *)self _gridTransitionLayout];
      BOOL v19 = v18 != 0;

      [(PULayoutAnimationsHelper *)self->_transitionAnimationsHelper setShouldAnimateTemporaryImageView:v19];
      transitionAnimationsHelper = self->_transitionAnimationsHelper;
    }
    uint64_t v13 = [(PULayoutAnimationsHelper *)transitionAnimationsHelper animationsForReusableView:v8 toLayoutAttributes:v9];
  }
  double v20 = (void *)v13;
LABEL_11:
  double v14 = _Block_copy(v20);

LABEL_12:
  return v14;
}

- (void)finalizeViewTransitionToSize
{
  viewSizeTransitionAnchorItem = self->_viewSizeTransitionAnchorItem;
  self->_viewSizeTransitionAnchorItem = 0;
}

- (id)prepareForViewTransitionToSize:(CGSize)a3
{
  double width = a3.width;
  v25[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = [(PUSectionedGridLayout *)self collectionView];
  [WeakRetained bounds];
  double v7 = v6;
  double v9 = v8;

  if (v7 == width) {
    goto LABEL_11;
  }
  BOOL delegateSupportsAnchorItemForContentOffset = self->_delegateSupportsAnchorItemForContentOffset;
  if (self->_delegateSupportsAnchorItemForContentOffset)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v11 = [WeakRetained sectionedGridLayoutAnchorItemForAdjustingContentOffset:self];
  }
  else
  {
    double v11 = 0;
  }
  p_viewSizeTransitionAnchorItem = &self->_viewSizeTransitionAnchorItem;
  objc_storeStrong((id *)&self->_viewSizeTransitionAnchorItem, v11);
  if (delegateSupportsAnchorItemForContentOffset)
  {
  }
  if (!*p_viewSizeTransitionAnchorItem)
  {
LABEL_11:
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v13 = [(PUSectionedGridLayout *)self layoutAttributesForItemAtIndexPath:"layoutAttributesForItemAtIndexPath:"];
    [v13 center];
    double v15 = v14;
    double v16 = [(PUSectionedGridLayout *)self collectionView];
    [v16 contentOffset];
    double v18 = v17;

    double v19 = 0.0;
    if (v9 > 0.0) {
      double v19 = (v15 - v18) / v9;
    }
    self->_double viewSizeTransitionAnchorItemNormalizedYOffset = v19;
    double v20 = *p_viewSizeTransitionAnchorItem;
    v24[0] = @"anchorItem";
    v24[1] = @"normalizedYOffset";
    v25[0] = v20;
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithDouble:");
    v25[1] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  }
  return v22;
}

- (void)finalizeAnimatedBoundsChange
{
  v2.receiver = self;
  v2.super_class = (Class)PUSectionedGridLayout;
  [(PUSectionedGridLayout *)&v2 finalizeAnimatedBoundsChange];
}

- (void)prepareForAnimatedBoundsChange:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUSectionedGridLayout;
  -[PUSectionedGridLayout prepareForAnimatedBoundsChange:](&v3, sel_prepareForAnimatedBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)finalizeCollectionViewUpdates
{
  v5.receiver = self;
  v5.super_class = (Class)PUSectionedGridLayout;
  [(PUSectionedGridLayout *)&v5 finalizeCollectionViewUpdates];
  deletedSections = self->_deletedSections;
  self->_deletedSections = 0;

  deletedItemIndexPaths = self->_deletedItemIndexPaths;
  self->_deletedItemIndexPaths = 0;

  self->_processingCollectionViewUpdates = 0;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PUSectionedGridLayout;
  [(PUSectionedGridLayout *)&v22 prepareForCollectionViewUpdates:v4];
  double v17 = self;
  self->_processingCollectionViewUpdates = 1;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    double v8 = 0;
    double v9 = 0;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v5);
        }
        int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v12 updateAction] == 1)
        {
          uint64_t v13 = [v12 indexPathBeforeUpdate];
          if ([v13 item] == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (!v9)
            {
              double v9 = [MEMORY[0x1E4F28E60] indexSet];
            }
            -[NSIndexSet addIndex:](v9, "addIndex:", [v13 section]);
          }
          else
          {
            if (!v8)
            {
              objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
              double v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
            }
            [(NSSet *)v8 addObject:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    double v8 = 0;
    double v9 = 0;
  }

  deletedSections = v17->_deletedSections;
  v17->_deletedSections = v9;
  double v15 = v9;

  deletedItemIndexPaths = v17->_deletedItemIndexPaths;
  v17->_deletedItemIndexPaths = v8;
}

- (id)_layoutAttributesForSupplementaryViewOfKind:(id)a3 forVisualSection:(int64_t)a4 supplementaryViewIndex:(int64_t)a5
{
  id v9 = a3;
  uint64_t v10 = [(PUSectionedGridLayout *)self supplementaryViewIndexPathForVisualSection:a4 supplementaryViewItemIndex:a5];
  if (!v10) {
    goto LABEL_20;
  }
  double v11 = [(PUSectionedGridLayout *)self renderedStripsElementKind];
  int v12 = [v9 isEqualToString:v11];

  if (v12)
  {
    uint64_t v13 = [(PUSectionedGridLayout *)self gridCoordinatesInSectionForItemAtVisualIndex:[(PUSectionedGridLayout *)self _firstVisualItemIndexForRenderedStripIndex:a5]];
    int64_t v14 = self->_columnsPerRow - 1;
    -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:](self, "frameForItemAtGridCoordinates:inVisualSection:", v13, v15, a4);
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:](self, "frameForItemAtGridCoordinates:inVisualSection:", v13, v14, a4);
    v45.origin.double x = v24;
    v45.origin.double y = v25;
    v45.size.double width = v26;
    v45.size.double height = v27;
    v43.origin.double x = v17;
    v43.origin.double y = v19;
    v43.size.double width = v21;
    v43.size.double height = v23;
    CGRect v44 = CGRectUnion(v43, v45);
    double y = v44.origin.y;
    double height = v44.size.height;
    double width = self->_contentSize.width;
    +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](PUSectionedGridLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v9, v10, v44.origin.x);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    int64_t v32 = +[PUPhotosGridLayoutHelper zIndexForSupplementaryViewOfKind:v9 forVisualSection:a4 supplementaryViewIndex:a5];
    objc_msgSend(v31, "setFrame:", 0.0, y, width, height);
    [v31 setZIndex:v32];
    goto LABEL_21;
  }
  if (![v9 isEqualToString:self->_sectionHeaderElementKind])
  {
    if ([v9 isEqualToString:@"PUGridGlobalHeader"])
    {
      uint64_t v37 = 296;
LABEL_15:
      id v31 = *(id *)((char *)&self->super.super.isa + v37);
      goto LABEL_21;
    }
    if ([v9 isEqualToString:@"PUGridGlobalFooter"])
    {
      uint64_t v37 = 304;
      goto LABEL_15;
    }
    if (!self->_transitionLayout
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ([(UICollectionViewLayout *)self->_transitionLayout sectionHeaderElementKind],
          uint64_t v38 = objc_claimAutoreleasedReturnValue(),
          int v39 = [v9 isEqualToString:v38],
          v38,
          !v39))
    {
      id v31 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:v9 withIndexPath:v10];
      objc_msgSend(v31, "setZIndex:", +[PUPhotosGridLayoutHelper zIndexForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:](PUPhotosGridLayoutHelper, "zIndexForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:", v9, a4, a5));
      [v31 frame];
      objc_msgSend(v31, "setFrame:");
      [v31 setAlpha:0.0];
      [v31 setHidden:1];
      goto LABEL_21;
    }
    uint64_t v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"PUSectionedGridLayout.m", 1008, @"%@ should never be asked for attributes of the transition layout %@", self, self->_transitionLayout object file lineNumber description];

LABEL_20:
    id v31 = 0;
    goto LABEL_21;
  }
  id v31 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v9 withIndexPath:v10];
  [(PUSectionedGridLayout *)self frameForSectionHeaderAtVisualSection:a4];
  objc_msgSend(v31, "setFrame:");
  floatingHeaderVisualSectionIndedouble x = self->_floatingHeaderVisualSectionIndex;
  [v31 setFloating:floatingHeaderVisualSectionIndex == a4];
  if (floatingHeaderVisualSectionIndex == a4)
  {
    int64_t v34 = +[PUPhotosGridLayoutHelper zIndexForFloatingHeaderForVisualSection:a4];
    uint64_t v35 = [MEMORY[0x1E4F90110] sharedInstance];
    int v36 = [v35 dragOutEnabled];

    if (v36) {
      [v31 _setZPosition:1];
    }
  }
  else
  {
    int64_t v34 = +[PUPhotosGridLayoutHelper zIndexForSupplementaryViewOfKind:v9 forVisualSection:a4 supplementaryViewIndex:a5];
  }
  [v31 setZIndex:v34];
  if ([(PUSectionedGridLayout *)self shouldHideVisualSection:a4])
  {
    [v31 setHidden:1];
    [v31 setAlpha:0.0];
  }
LABEL_21:

  return v31;
}

- (BOOL)_isSupportedSupplementaryViewKind:(id)a3
{
  id v4 = a3;
  id v5 = [(PUSectionedGridLayout *)self _supplementaryViewKinds];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)_supplementaryViewKinds
{
  supplementaryViewKinds = self->_supplementaryViewKinds;
  if (!supplementaryViewKinds)
  {
    id v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v5 = v4;
    if (self->_renderedStripsElementKind) {
      -[NSSet addObject:](v4, "addObject:");
    }
    if (self->_sectionHeaderElementKind) {
      -[NSSet addObject:](v5, "addObject:");
    }
    [(NSSet *)v5 addObject:@"PUGridGlobalHeader"];
    [(NSSet *)v5 addObject:@"PUGridGlobalFooter"];
    char v6 = self->_supplementaryViewKinds;
    self->_supplementaryViewKinds = v5;

    supplementaryViewKinds = self->_supplementaryViewKinds;
  }
  return supplementaryViewKinds;
}

- (void)_invalidateSupplementaryViewKinds
{
  supplementaryViewKinds = self->_supplementaryViewKinds;
  self->_supplementaryViewKinds = 0;
}

- (id)_layoutAttributesForItemAtVisualIndexPath:(PUSimpleIndexPath)a3 realIndexPath:(id)a4 isMainRealItem:(BOOL)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v9 = a4;
  uint64_t v10 = [(PUSectionedGridLayout *)self gridCoordinatesInSectionForItemAtVisualIndex:var1];
  -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:indexPath:](self, "frameForItemAtGridCoordinates:inVisualSection:indexPath:", v10, v11, var0, v9);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:v9];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
  objc_msgSend(v20, "setZIndex:", +[PUPhotosGridLayoutHelper zIndexForItemAtIndexPath:](PUPhotosGridLayoutHelper, "zIndexForItemAtIndexPath:", v9));
  if (self->_usesRenderedStrips || !a5)
  {
    [v20 setHidden:1];
    goto LABEL_6;
  }
  if ([(NSSet *)self->_hiddenItemIndexPaths containsObject:v9]) {
LABEL_6:
  }
    [v20 setAlpha:0.0];
  [(PUSectionedGridLayout *)self _adjustItemLayoutAttributesForReordering:v20];

  return v20;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_transitionLayout
    && [(PUSectionedGridLayout *)self _isTransitionForeignSupplementaryViewKind:v6])
  {
    double v8 = [(UICollectionViewLayout *)self->_transitionLayout layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];
    [v8 setAlpha:0.0];
    [v8 setHidden:1];
  }
  else
  {
    [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
    int64_t v9 = [(PUSectionedGridLayout *)self visualSectionForSupplementaryViewIndexPath:v7];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = 0;
      goto LABEL_10;
    }
    double v8 = -[PUSectionedGridLayout _layoutAttributesForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:](self, "_layoutAttributesForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:", v6, v9, [v7 item]);
  }
  uint64_t v11 = [(PUSectionedGridLayout *)self transitioningDelegate];
  if (v11)
  {
    v14[0] = v8;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v11 collectionViewLayout:self willSupplyLayoutAttributes:v12];
  }
  id v10 = v8;

LABEL_10:
  return v10;
}

- (id)supplementaryViewIndexPathForVisualSection:(int64_t)a3 supplementaryViewItemIndex:(int64_t)a4
{
  int64_t v5 = [(PULayoutSampledSectioning *)self->_layoutSectioning mainRealSectionForVisualSection:a3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:a4 inSection:v5];
  }
  return v6;
}

- (int64_t)visualSectionForSupplementaryViewIndexPath:(id)a3
{
  layoutSectioning = self->_layoutSectioning;
  uint64_t v4 = [a3 section];
  return [(PULayoutSampledSectioning *)layoutSectioning visualSectionForRealSection:v4];
}

- (BOOL)_isTransitionForeignSupplementaryViewKind:(id)a3
{
  id v4 = a3;
  if (self->_transitionLayout && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    BOOL v5 = ![(PUSectionedGridLayout *)self _isSupportedSupplementaryViewKind:v4];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  unsigned __int8 v15 = 0;
  layoutSectioning = self->_layoutSectioning;
  id v6 = v4;
  uint64_t v7 = [v6 item];
  uint64_t v8 = [v6 section];

  uint64_t v9 = -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", v8, v7, &v15);
  uint64_t v11 = -[PUSectionedGridLayout _layoutAttributesForItemAtVisualIndexPath:realIndexPath:isMainRealItem:](self, "_layoutAttributesForItemAtVisualIndexPath:realIndexPath:isMainRealItem:", v9, v10, v6, v15);
  double v12 = [(PUSectionedGridLayout *)self transitioningDelegate];
  if (v12)
  {
    v16[0] = v11;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v12 collectionViewLayout:self willSupplyLayoutAttributes:v13];
  }
  return v11;
}

- (id)assetIndexPathsForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  if (height == 0.0 || !self->_totalVisualSections)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C978] array];
  }
  else
  {
    if (self->_transitionLayout && [(PUSectionedGridLayout *)self transitionIsAppearing])
    {
      double x = x + self->_transitionEffectiveContentOrigin.x;
      double y = y + self->_transitionEffectiveContentOrigin.y;
    }
    int64_t v9 = [(PUSectionedGridLayout *)self columnsPerRow];
    uint64_t v10 = [(PUSectionedGridLayout *)self layoutSectioning];
    uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2 * v9 * v9];
    unint64_t v11 = -[PUSectionedGridLayout visualSectionsInRect:](self, "visualSectionsInRect:", x, y, width, height);
    uint64_t v13 = v11 + v12;
    if (v11 < v11 + v12)
    {
      unint64_t v14 = v11;
      do
      {
        uint64_t v15 = -[PUSectionedGridLayout visualRowsInRect:inVisualSection:totalVisualSectionRows:](self, "visualRowsInRect:inVisualSection:totalVisualSectionRows:", v14, 0, x, y, width, height);
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v17 = v16;
          if (v16)
          {
            uint64_t v18 = v15;
            int64_t v19 = [(PUSectionedGridLayout *)self numberOfVisualItemsInVisualSection:v14];
            uint64_t v20 = v18 * v9;
            uint64_t v21 = (v18 + v17) * v9 - 1;
            if (v21 >= v19 - 1) {
              uint64_t v21 = v19 - 1;
            }
            if (v20 <= v21)
            {
              uint64_t v22 = v21 + 1;
              do
              {
                uint64_t v23 = objc_msgSend(v10, "mainRealItemIndexPathForVisualIndexPath:", v14, v20);
                CGFloat v25 = [MEMORY[0x1E4F28D58] indexPathForItem:v24 inSection:v23];
                [v8 addObject:v25];

                ++v20;
              }
              while (v22 != v20);
            }
          }
        }
        ++v14;
      }
      while (v14 != v13);
    }
  }
  return v8;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  if (height == 0.0 || !self->_totalVisualSections)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_70;
  }
  int64x2_t v75 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
  p_cachedLayoutAttributesLastKnownRect = &self->_cachedLayoutAttributesLastKnownRect;
  id v72 = &self->_cachedLayoutAttributesLastKnownRect;
  if (CGRectIsNull(self->_cachedLayoutAttributesLastKnownRect)) {
    goto LABEL_7;
  }
  v87.origin.double x = p_cachedLayoutAttributesLastKnownRect->origin.x;
  v87.origin.double y = self->_cachedLayoutAttributesLastKnownRect.origin.y;
  v87.size.double width = self->_cachedLayoutAttributesLastKnownRect.size.width;
  v87.size.double height = self->_cachedLayoutAttributesLastKnownRect.size.height;
  v80.origin.double x = x;
  v80.origin.double y = y;
  v80.size.double width = width;
  v80.size.double height = height;
  if (!CGRectEqualToRect(v80, v87))
  {
LABEL_7:
    v81.origin.double x = p_cachedLayoutAttributesLastKnownRect->origin.x;
    v81.origin.double y = self->_cachedLayoutAttributesLastKnownRect.origin.y;
    v81.size.double width = self->_cachedLayoutAttributesLastKnownRect.size.width;
    v81.size.double height = self->_cachedLayoutAttributesLastKnownRect.size.height;
    if (CGRectIsNull(v81)) {
      goto LABEL_11;
    }
    v82.origin.double x = p_cachedLayoutAttributesLastKnownRect->origin.x;
    v82.origin.double y = self->_cachedLayoutAttributesLastKnownRect.origin.y;
    v82.size.double width = self->_cachedLayoutAttributesLastKnownRect.size.width;
    v82.size.double height = self->_cachedLayoutAttributesLastKnownRect.size.height;
    v88.origin.double x = x;
    v88.origin.double y = y;
    v88.size.double width = width;
    v88.size.double height = height;
    if (!CGRectContainsRect(v82, v88))
    {
LABEL_11:
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 2 * self->_columnsPerRow * self->_columnsPerRow, v72);
      double v77 = (NSArray *)objc_claimAutoreleasedReturnValue();
      int v74 = 0;
      char v10 = 0;
      goto LABEL_12;
    }
    double v77 = self->_cachedNonHeaderLayoutAttributesInRect;
    int v74 = 1;
  }
  else
  {
    double v77 = self->_cachedNonHeaderLayoutAttributesInRect;
    int v74 = 0;
  }
  char v10 = 1;
LABEL_12:
  unint64_t v11 = -[PUSectionedGridLayout visualSectionsInRect:](self, "visualSectionsInRect:", x, y, width, height, v72);
  uint64_t v13 = v11 + v12;
  char v76 = v10;
  if (v11 < v11 + v12)
  {
    unint64_t v14 = v11;
    while (1)
    {
      [(PUSectionedGridLayout *)self _finalSectionHeaderHeightForSection:v14];
      if (v15 <= 0.0 || !self->_sectionHeaderElementKind) {
        goto LABEL_22;
      }
      if (!self->_dynamicLayoutEnabled) {
        break;
      }
      uint64_t v16 = [(PUSectionedGridLayoutData *)self->_layoutData headerLayoutAttributesByVisualSection];
      uint64_t v17 = [NSNumber numberWithInteger:v14];
      uint64_t v18 = [v16 objectForKey:v17];

      if (v18) {
        goto LABEL_21;
      }
LABEL_22:
      uint64_t v23 = -[PUSectionedGridLayout visualRowsInRect:inVisualSection:totalVisualSectionRows:](self, "visualRowsInRect:inVisualSection:totalVisualSectionRows:", v14, 0, x, y, width, height);
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v25 = v24;
        if (v24)
        {
          uint64_t v26 = v23;
          BOOL usesRenderedStrips = self->_usesRenderedStrips;
          if (self->_usesRenderedStrips) {
            char v28 = v10;
          }
          else {
            char v28 = 1;
          }
          if ((v28 & 1) == 0)
          {
            int64_t v29 = [(PUSectionedGridLayout *)self _renderedStripIndexForSectionRowIndex:v23];
            int64_t v30 = [(PUSectionedGridLayout *)self _renderedStripIndexForSectionRowIndex:v26 + v25 - 1];
            id v31 = [(PUSectionedGridLayout *)self renderedStripsElementKind];
            if (v29 <= v30)
            {
              int64_t v32 = v30 + 1;
              do
              {
                double v33 = [(PUSectionedGridLayout *)self _layoutAttributesForSupplementaryViewOfKind:v31 forVisualSection:v14 supplementaryViewIndex:v29];
                if (v33) {
                  [(NSArray *)v77 addObject:v33];
                }

                ++v29;
              }
              while (v32 != v29);
            }

            BOOL usesRenderedStrips = self->_usesRenderedStrips;
            char v10 = v76;
          }
          if (usesRenderedStrips) {
            char v34 = 1;
          }
          else {
            char v34 = v10;
          }
          if ((v34 & 1) == 0)
          {
            int64_t v35 = [(PUSectionedGridLayout *)self numberOfVisualItemsInVisualSection:v14];
            int64_t columnsPerRow = self->_columnsPerRow;
            uint64_t v37 = columnsPerRow * v26;
            uint64_t v38 = columnsPerRow * (v26 + v25) - 1;
            if (v38 >= v35 - 1) {
              uint64_t v38 = v35 - 1;
            }
            if (v37 <= v38)
            {
              uint64_t v39 = v38 + 1;
              do
              {
                uint64_t v40 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v14, v37);
                id v42 = [MEMORY[0x1E4F28D58] indexPathForItem:v41 inSection:v40];
                CGRect v43 = -[PUSectionedGridLayout _layoutAttributesForItemAtVisualIndexPath:realIndexPath:isMainRealItem:](self, "_layoutAttributesForItemAtVisualIndexPath:realIndexPath:isMainRealItem:", v14, v37, v42, 1);
                CGRect v44 = v43;
                if (v43)
                {
                  [v43 frame];
                  v90.origin.double x = v45;
                  v90.origin.double y = v46;
                  v90.size.double width = v47;
                  v90.size.double height = v48;
                  v84.origin.double x = x;
                  v84.origin.double y = y;
                  v84.size.double width = width;
                  v84.size.double height = height;
                  if (CGRectIntersectsRect(v84, v90) || self->_dynamicLayoutEnabled) {
                    [(NSArray *)v77 addObject:v44];
                  }
                }

                ++v37;
              }
              while (v39 != v37);
            }
          }
        }
      }
      if (++v14 == v13) {
        goto LABEL_48;
      }
    }
    [(PUSectionedGridLayout *)self frameForSectionHeaderAtVisualSection:v14];
    v89.origin.double x = v19;
    v89.origin.double y = v20;
    v89.size.double width = v21;
    v89.size.double height = v22;
    v83.origin.double x = x;
    v83.origin.double y = y;
    v83.size.double width = width;
    v83.size.double height = height;
    if (!CGRectIntersectsRect(v83, v89)) {
      goto LABEL_22;
    }
    uint64_t v18 = [(PUSectionedGridLayout *)self _layoutAttributesForSupplementaryViewOfKind:self->_sectionHeaderElementKind forVisualSection:v14 supplementaryViewIndex:0];
    if (!v18) {
      goto LABEL_22;
    }
LABEL_21:
    [v75 addObject:v18];

    goto LABEL_22;
  }
LABEL_48:
  globalHeaderAttributes = self->_globalHeaderAttributes;
  if (globalHeaderAttributes) {
    char v50 = v10;
  }
  else {
    char v50 = 1;
  }
  if ((v50 & 1) == 0)
  {
    [(UICollectionViewLayoutAttributes *)globalHeaderAttributes frame];
    v91.origin.double x = v51;
    v91.origin.double y = v52;
    v91.size.double width = v53;
    v91.size.double height = v54;
    v85.origin.double x = x;
    v85.origin.double y = y;
    v85.size.double width = width;
    v85.size.double height = height;
    if (CGRectIntersectsRect(v85, v91))
    {
      id v55 = [(PUSectionedGridLayout *)self collectionView];
      uint64_t v56 = [v55 dataSource];

      if (v56) {
        [(NSArray *)v77 addObject:self->_globalHeaderAttributes];
      }
    }
  }
  globalFooterAttributes = self->_globalFooterAttributes;
  if (globalFooterAttributes) {
    char v58 = v76;
  }
  else {
    char v58 = 1;
  }
  if ((v58 & 1) == 0)
  {
    [(UICollectionViewLayoutAttributes *)globalFooterAttributes frame];
    v92.origin.double x = v59;
    v92.origin.double y = v60;
    v92.size.double width = v61;
    v92.size.double height = v62;
    v86.origin.double x = x;
    v86.origin.double y = y;
    v86.size.double width = width;
    v86.size.double height = height;
    if (CGRectIntersectsRect(v86, v92))
    {
      uint64_t v63 = [(PUSectionedGridLayout *)self collectionView];
      double v64 = [v63 dataSource];

      if (v64) {
        [(NSArray *)v77 addObject:self->_globalFooterAttributes];
      }
    }
  }
  if (v74)
  {
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __59__PUSectionedGridLayout_layoutAttributesForElementsInRect___block_invoke;
    v78[3] = &__block_descriptor_64_e49_B32__0__UICollectionViewLayoutAttributes_8Q16_B24l;
    *(double *)&v78[4] = x;
    *(double *)&v78[5] = y;
    *(double *)&v78[6] = width;
    *(double *)&v78[7] = height;
    uint64_t v65 = [(NSArray *)v77 indexesOfObjectsPassingTest:v78];
    uint64_t v66 = [(NSArray *)v77 objectsAtIndexes:v65];
    uint64_t v8 = [v66 arrayByAddingObjectsFromArray:v75];
  }
  else
  {
    uint64_t v8 = [(NSArray *)v77 arrayByAddingObjectsFromArray:v75];
  }
  if ((v76 & 1) == 0)
  {
    uint64_t v67 = (NSArray *)[(NSArray *)v77 copy];
    cachedNonHeaderLayoutAttributesInRect = self->_cachedNonHeaderLayoutAttributesInRect;
    self->_cachedNonHeaderLayoutAttributesInRect = v67;

    *uint64_t v73 = x;
    v73[1] = y;
    v73[2] = width;
    v73[3] = height;
  }
  uint64_t v69 = [(PUSectionedGridLayout *)self transitioningDelegate];
  uint64_t v70 = v69;
  if (v69) {
    [v69 collectionViewLayout:self willSupplyLayoutAttributes:v8];
  }

LABEL_70:
  return v8;
}

BOOL __59__PUSectionedGridLayout_layoutAttributesForElementsInRect___block_invoke(void *a1, void *a2)
{
  [a2 frame];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  uint64_t v10 = a1[7];
  return CGRectIntersectsRect(*(CGRect *)&v3, *(CGRect *)&v7);
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(PUSectionedGridLayout *)self collectionView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  BOOL v15 = v14 == height && v12 == width;
  BOOL v16 = v10 != y && v15;
  uint64_t v17 = [(PUSectionedGridLayout *)self sectionHeaderElementKind];
  uint64_t v18 = (void *)v17;
  if (!v16 || v17 == 0) {
    goto LABEL_35;
  }
  -[PUSectionedGridLayout _visibleRectOriginForScrollOffset:](self, "_visibleRectOriginForScrollOffset:", x, y);
  floatingHeaderVisualSectionIndedouble x = self->_floatingHeaderVisualSectionIndex;
  int64_t v21 = -[PUSectionedGridLayout _floatingHeaderVisualSectionForVisibleOrigin:](self, "_floatingHeaderVisualSectionForVisibleOrigin:");
  int64_t v22 = v21;
  p_cachedFloatingHeaderInvalidationContext = &self->_cachedFloatingHeaderInvalidationContext;
  cachedFloatingHeaderInvalidationContext = self->_cachedFloatingHeaderInvalidationContext;
  if (cachedFloatingHeaderInvalidationContext
    && v21 == self->_cachedFloatingHeaderInvalidationContextNewVisualSection
    && (floatingHeaderVisualSectionIndex == 0x7FFFFFFFFFFFFFFFLL || v21 == floatingHeaderVisualSectionIndex))
  {
    uint64_t v26 = cachedFloatingHeaderInvalidationContext;
LABEL_36:
    CGFloat v27 = v26;
    goto LABEL_37;
  }
  CGFloat v27 = objc_alloc_init(PUSectionedGridLayoutInvalidationContext);
  char v28 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  if (self->_floatingHeaderVisualSectionIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v29 = [(PUSectionedGridLayout *)self supplementaryViewIndexPathForVisualSection:floatingHeaderVisualSectionIndex supplementaryViewItemIndex:0];
    if (v29) {
      [v28 addObject:v29];
    }
  }
  if (v22 != 0x7FFFFFFFFFFFFFFFLL && v22 != floatingHeaderVisualSectionIndex)
  {
    int64_t v30 = [(PUSectionedGridLayout *)self supplementaryViewIndexPathForVisualSection:v22 supplementaryViewItemIndex:0];
    if (v30) {
      [v28 addObject:v30];
    }
  }
  [(UICollectionViewLayoutInvalidationContext *)v27 invalidateSupplementaryElementsOfKind:v18 atIndexPaths:v28];
  if (floatingHeaderVisualSectionIndex == 0x7FFFFFFFFFFFFFFFLL || v22 == floatingHeaderVisualSectionIndex)
  {
    objc_storeStrong((id *)&self->_cachedFloatingHeaderInvalidationContext, v27);
    self->_cachedFloatingHeaderInvalidationContextNewVisualSection = v22;
  }
  else
  {
    int64_t v32 = *p_cachedFloatingHeaderInvalidationContext;
    *p_cachedFloatingHeaderInvalidationContext = 0;
  }
  if (!v27)
  {
LABEL_35:
    uint64_t v26 = objc_alloc_init(PUSectionedGridLayoutInvalidationContext);
    goto LABEL_36;
  }
LABEL_37:
  [(PUSectionedGridLayoutInvalidationContext *)v27 setInvalidateForVerticalScroll:v16];
  [(PUSectionedGridLayoutInvalidationContext *)v27 setSectioningIsPreserved:1];
  [(PUSectionedGridLayoutInvalidationContext *)v27 setSamplingIsPreserved:v12 == width];

  return v27;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)PUSectionedGridLayout;
  unsigned __int8 v7 = -[PUSectionedGridLayout shouldInvalidateLayoutForBoundsChange:](&v15, sel_shouldInvalidateLayoutForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v8 = [(PUSectionedGridLayout *)self collectionView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  if (self->_hasFloatingHeaders && (!self->_transitionLayout || self->_transitionIsAppearing))
  {
    BOOL v13 = x != v10;
    if (y != v12) {
      BOOL v13 = 1;
    }
    v7 |= v13;
  }
  if (width == self->_contentSize.width) {
    return v7;
  }
  else {
    return 1;
  }
}

- (void)invalidateLayoutForMetricsChange
{
  uint64_t v3 = objc_alloc_init(PUSectionedGridLayoutInvalidationContext);
  [(PUSectionedGridLayoutInvalidationContext *)v3 setSectioningIsPreserved:1];
  [(PUSectionedGridLayout *)self invalidateLayoutWithContext:v3];
}

- (void)invalidateLayoutForVerticalScroll
{
  uint64_t v3 = objc_alloc_init(PUSectionedGridLayoutInvalidationContext);
  [(PUSectionedGridLayoutInvalidationContext *)v3 setInvalidateForVerticalScroll:1];
  [(PUSectionedGridLayoutInvalidationContext *)v3 setSamplingIsPreserved:1];
  [(PUSectionedGridLayoutInvalidationContext *)v3 setSectioningIsPreserved:1];
  [(PUSectionedGridLayout *)self invalidateLayoutWithContext:v3];
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  [(PUSectionedGridLayout *)self _invalidateLayoutWithContext:v4];
  v5.receiver = self;
  v5.super_class = (Class)PUSectionedGridLayout;
  [(PUSectionedGridLayout *)&v5 invalidateLayoutWithContext:v4];
}

- (void)_invalidateLayoutWithContext:(id)a3
{
  id v14 = a3;
  if (([v14 invalidateForVerticalScroll] & 1) == 0)
  {
    self->_layoutDataIsValid = 0;
    [(PUSectionedGridLayout *)self _clearLayoutCaches];
    globalHeaderAttributes = self->_globalHeaderAttributes;
    self->_globalHeaderAttributes = 0;

    globalFooterAttributes = self->_globalFooterAttributes;
    self->_globalFooterAttributes = 0;

    cachedNonHeaderLayoutAttributesInRect = self->_cachedNonHeaderLayoutAttributesInRect;
    self->_cachedNonHeaderLayoutAttributesInRect = 0;

    CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_cachedLayoutAttributesLastKnownRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_cachedLayoutAttributesLastKnownRect.size = v7;
    int v8 = [v14 samplingIsPreserved];
    char v9 = [v14 sectioningIsPreserved];
    char v10 = v9;
    if (!v8 || (v9 & 1) == 0)
    {
      self->_samplingDataIsValid = 0;
      [(PUSectionedGridLayout *)self _clearSamplingCaches];
      [(PULayoutSampledSectioning *)self->_layoutSectioning invalidateSampling];
    }
    if ((v10 & 1) == 0)
    {
      self->_sectioningDataIsValid = 0;
      [(PUSectionedGridLayout *)self _clearSectioningCaches];
      [(PULayoutSampledSectioning *)self->_layoutSectioning invalidateSections];
    }
  }
  [(PUSectionedGridLayout *)self _invalidateFloatingHeadersLayout];
  double v11 = v14;
  if (self->_delegateSupportsDidInvalidateWithContext)
  {
    char v12 = [v14 invalidationHasBeenRedispatched];
    double v11 = v14;
    if ((v12 & 1) == 0)
    {
      [v14 setInvalidationHasBeenRedispatched:1];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained sectionedGridLayout:self didInvalidateWithContext:v14];

      double v11 = v14;
    }
  }
}

- (CGSize)transitionActualContentSize
{
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)collectionViewContentSize
{
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
  CGFloat width = self->_contentSize.width;
  double height = self->_contentSize.height;
  if (self->_transitionLayout)
  {
    if ([(PUSectionedGridLayout *)self transitionIsAppearing])
    {
      if (self->_transitionApplyingEffectiveContentOrigin)
      {
        [(UICollectionViewLayout *)self->_transitionLayout collectionViewContentSize];
        if (height < v5) {
          double height = v5;
        }
      }
    }
  }
  if (self->_dynamicLayoutEnabled)
  {
    [(PUSectionedGridLayoutData *)self->_layoutData currentContentBounds];
    double MaxY = CGRectGetMaxY(v11);
    [(UICollectionViewLayoutAttributes *)self->_globalFooterAttributes frame];
    double v7 = MaxY + CGRectGetHeight(v12);
    if (height < v7) {
      double height = v7;
    }
  }
  double v8 = width;
  double v9 = height;
  result.double height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)_prepareLayoutIfNeeded
{
  id v4 = [(PUSectionedGridLayout *)self collectionView];

  if (!v4)
  {
    CGFloat v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2 object:self file:@"PUSectionedGridLayout.m" lineNumber:353 description:@"CollectionView is nil"];
  }
  if (self->_layoutDataIsValid)
  {
    if (!self->_samplingDataIsValid)
    {
      CGFloat v54 = [MEMORY[0x1E4F28B00] currentHandler];
      [v54 handleFailureInMethod:a2 object:self file:@"PUSectionedGridLayout.m" lineNumber:356 description:@"Sampling data should always be valid when layout data is valid"];
    }
    [(PUSectionedGridLayout *)self _prepareFloatingHeadersLayoutIfNeeded];
  }
  else
  {
    if (self->_delegateSupportsWillPrepareLayout)
    {
      double v5 = [(PUSectionedGridLayout *)self delegate];
      [v5 sectionedGridLayoutWillPrepareLayout:self];
    }
    id v57 = [(PUSectionedGridLayout *)self collectionView];
    [(PUSectionedGridLayout *)self _prepareSamplingDataIfNeeded];
    if (!self->_sectioningDataIsValid)
    {
      id v55 = [MEMORY[0x1E4F28B00] currentHandler];
      [v55 handleFailureInMethod:a2 object:self file:@"PUSectionedGridLayout.m" lineNumber:369 description:@"Sectioning data should be correct here"];
    }
    [v57 bounds];
    double v7 = v6;
    [(PUSectionedGridLayout *)self itemSize];
    double v9 = v8;
    [(PUSectionedGridLayout *)self interItemSpacing];
    double v11 = v10;
    [(PUSectionedGridLayout *)self sectionContentInset];
    double v13 = v12;
    double v15 = v14;
    if (self->_globalHeaderHeight <= 0.0 || self->_totalVisualSections < 1 || self->_totalRealSections < 1)
    {
      globalHeaderAttributes = self->_globalHeaderAttributes;
      self->_globalHeaderAttributes = 0;
    }
    else
    {
      BOOL v16 = (void *)MEMORY[0x1E4FB15E0];
      uint64_t v17 = [(PUSectionedGridLayout *)self globalHeaderIndexPath];
      uint64_t v18 = [v16 layoutAttributesForSupplementaryViewOfKind:@"PUGridGlobalHeader" withIndexPath:v17];
      CGFloat v19 = self->_globalHeaderAttributes;
      self->_globalHeaderAttributes = v18;

      -[UICollectionViewLayoutAttributes setFrame:](self->_globalHeaderAttributes, "setFrame:", 0.0, 0.0, v7, self->_globalHeaderHeight);
    }
    if ([(PUSectionedGridLayout *)self _hasAccessibilityLargeText]
      && !self->_axLargeTextSectionHeaderHeightByVisualSection)
    {
      int64_t v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      axLargeTextSectionHeaderHeightByVisualSection = self->_axLargeTextSectionHeaderHeightByVisualSection;
      self->_axLargeTextSectionHeaderHeightByVisualSection = v21;
    }
    self->_visualSectionStartYs = (double *)malloc_type_malloc(8 * self->_totalVisualSections + 8, 0x100004000313F17uLL);
    if (self->_transitionApplyingEffectiveContentOrigin) {
      double y = self->_transitionEffectiveContentOrigin.y;
    }
    else {
      double y = 0.0;
    }
    double globalTopPadding = self->_globalTopPadding;
    [(PUSectionedGridLayout *)self globalHeaderHeight];
    double v26 = y + globalTopPadding + v25;
    int64_t totalVisualSections = self->_totalVisualSections;
    if (totalVisualSections >= 1)
    {
      double v56 = v7;
      int64_t v28 = 0;
      double v29 = v13 + v15;
      do
      {
        [(PUSectionedGridLayout *)self sectionTopPadding];
        double v31 = v30;
        [(PUSectionedGridLayout *)self _finalSectionHeaderHeightForSection:v28];
        double v33 = v32;
        [(PUSectionedGridLayout *)self sectionBottomPadding];
        double v35 = v34;
        if (PUMainScreenScale_onceToken != -1) {
          dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
        }
        double v36 = *(double *)&PUMainScreenScale_screenScale;
        self->_visualSectionStartYs[v28] = v26;
        if (![(PUSectionedGridLayout *)self shouldHideVisualSection:v28])
        {
          double v37 = round(v36 * (v31 + v33 + v35)) / v36;
          uint64_t v38 = [(PULayoutSampledSectioning *)self->_layoutSectioning numberOfVisualItemsInVisualSection:v28];
          int64_t columnsPerRow = self->_columnsPerRow;
          if (columnsPerRow >= 1)
          {
            uint64_t v40 = vcvtpd_s64_f64((double)v38 / (double)columnsPerRow);
            if (v40 >= 1) {
              double v37 = v29 + v37 + v11 * (double)(v40 - 1) + v9 * (double)v40;
            }
          }
          double v26 = v26 + v37;
        }
        ++v28;
        int64_t totalVisualSections = self->_totalVisualSections;
      }
      while (v28 < totalVisualSections);
      double v7 = v56;
    }
    self->_visualSectionStartYs[totalVisualSections] = v26;
    if (!self->_globalFooterAttributes)
    {
      uint64_t v41 = (void *)MEMORY[0x1E4FB15E0];
      id v42 = [(PUSectionedGridLayout *)self globalFooterIndexPath];
      CGRect v43 = [v41 layoutAttributesForSupplementaryViewOfKind:@"PUGridGlobalFooter" withIndexPath:v42];
      globalFooterAttributes = self->_globalFooterAttributes;
      self->_globalFooterAttributes = v43;
    }
    double v45 = 0.0;
    if (self->_globalFooterHeight <= 0.0 || self->_totalVisualSections < 1)
    {
      BOOL v47 = 1;
      double globalFooterHeight = 0.0;
    }
    else
    {
      int64_t totalRealSections = self->_totalRealSections;
      BOOL v47 = totalRealSections < 1;
      if (totalRealSections >= 1) {
        double v45 = 1.0;
      }
      else {
        double v45 = 0.0;
      }
      if (totalRealSections >= 1) {
        double globalFooterHeight = self->_globalFooterHeight;
      }
      else {
        double globalFooterHeight = 0.0;
      }
    }
    -[UICollectionViewLayoutAttributes setFrame:](self->_globalFooterAttributes, "setFrame:", 0.0, v26, v7, globalFooterHeight);
    [(UICollectionViewLayoutAttributes *)self->_globalFooterAttributes setHidden:v47];
    [(UICollectionViewLayoutAttributes *)self->_globalFooterAttributes setAlpha:v45];
    [(PUSectionedGridLayout *)self globalFooterHeight];
    double v50 = v49;
    [(PUSectionedGridLayout *)self globalBottomPadding];
    CGFloat v52 = v26 + v50 + v51 - self->_transitionEffectiveContentOrigin.y;
    self->_contentSize.CGFloat width = v7;
    self->_contentSize.double height = v52;
    self->_layoutDataIsValid = 1;
    [(PUSectionedGridLayout *)self _prepareFloatingHeadersLayoutIfNeeded];
  }
}

- (void)_prepareSamplingDataIfNeeded
{
  if (self->_samplingDataIsValid)
  {
    if (self->_sectioningDataIsValid) {
      return;
    }
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PUSectionedGridLayout.m" lineNumber:313 description:@"Sectioning data should always be valid when sampling data is valid"];
  }
  else
  {
    if (self->_layoutDataIsValid)
    {
      double v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"PUSectionedGridLayout.m" lineNumber:317 description:@"Layout data can't be valid while sampling data is invvalid"];
    }
    [(PUSectionedGridLayout *)self _prepareSectioningDataIfNeeded];
    id v9 = [(PUSectionedGridLayout *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      self->_visualSectionMaxRows = (int64_t *)malloc_type_malloc(8 * self->_totalVisualSections, 0x100004000313F17uLL);
      if (self->_totalVisualSections >= 1)
      {
        int64_t v4 = 0;
        char v5 = 0;
        do
        {
          uint64_t v6 = [v9 sectionedGridLayout:self maximumRowsForVisualSection:v4];
          if (v6 > 0) {
            char v5 = 1;
          }
          self->_visualSectionMaxRows[v4++] = v6;
        }
        while (v4 < self->_totalVisualSections);
        if (v5) {
          goto LABEL_14;
        }
      }
    }
    if (self->_delegateSupportsGroupedSections) {
LABEL_14:
    }
      uint64_t v7 = 1;
    else {
      uint64_t v7 = 0;
    }
    [(PULayoutSampledSectioning *)self->_layoutSectioning setSupportsSamplingAndSectionGrouping:v7];
    [(PUSectionedGridLayout *)self _sectionWidth];
    self->_int64_t columnsPerRow = -[PUSectionedGridLayout numberOfColumnsForWidth:](self, "numberOfColumnsForWidth:");
    self->_samplingDataIsValid = 1;
  }
}

- (void)_prepareSectioningDataIfNeeded
{
  if (!self->_sectioningDataIsValid)
  {
    if (self->_samplingDataIsValid)
    {
      double v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"PUSectionedGridLayout.m" lineNumber:293 description:@"Sampling data can't be valid while sectioning data is valid"];
    }
    id v9 = [(PUSectionedGridLayout *)self delegate];
    uint64_t v3 = [(PUSectionedGridLayout *)self collectionView];
    int64_t v4 = [v3 numberOfSections];
    self->_uint64_t totalRealSections = v4;
    self->_realSectionItemCounts = (int64_t *)malloc_type_malloc(8 * v4, 0x100004000313F17uLL);
    uint64_t totalRealSections = self->_totalRealSections;
    if (totalRealSections >= 1)
    {
      for (uint64_t i = 0; i < totalRealSections; ++i)
      {
        self->_realSectionItemCounts[i] = [v3 numberOfItemsInSection:i];
        uint64_t totalRealSections = self->_totalRealSections;
      }
    }
    if (self->_delegateSupportsGroupedSections) {
      uint64_t totalRealSections = [v9 numberOfVisualSectionsForSectionedGridLayout:self];
    }
    self->_int64_t totalVisualSections = totalRealSections;
    self->_sectioningDataIsValid = 1;
  }
}

- (void)_clearLayoutCaches
{
  visualSectionStartYs = self->_visualSectionStartYs;
  if (visualSectionStartYs)
  {
    free(visualSectionStartYs);
    self->_visualSectionStartYs = 0;
  }
  if ([(PUSectionedGridLayout *)self _hasAccessibilityLargeText])
  {
    axLargeTextSectionHeaderHeightByVisualSection = self->_axLargeTextSectionHeaderHeightByVisualSection;
    if (axLargeTextSectionHeaderHeightByVisualSection) {
      [(NSMutableDictionary *)axLargeTextSectionHeaderHeightByVisualSection removeAllObjects];
    }
  }
  if (self->_dynamicLayoutEnabled)
  {
    layoutData = self->_layoutData;
    [(PUSectionedGridLayoutData *)layoutData invalidate];
  }
}

- (void)_clearSamplingCaches
{
  visualSectionMaxRows = self->_visualSectionMaxRows;
  if (visualSectionMaxRows)
  {
    free(visualSectionMaxRows);
    self->_visualSectionMaxRows = 0;
  }
}

- (void)_clearSectioningCaches
{
  realSectionItemCounts = self->_realSectionItemCounts;
  if (realSectionItemCounts)
  {
    free(realSectionItemCounts);
    self->_realSectionItemCounts = 0;
  }
}

- (void)_clearRetainedCaches
{
  [(PUSectionedGridLayout *)self _clearLayoutCaches];
  [(PUSectionedGridLayout *)self _clearSamplingCaches];
  [(PUSectionedGridLayout *)self _clearSectioningCaches];
}

- (void)prepareLayout
{
  v3.receiver = self;
  v3.super_class = (Class)PUSectionedGridLayout;
  [(PUSectionedGridLayout *)&v3 prepareLayout];
  [(PUSectionedGridLayout *)self _prepareLayoutIfNeeded];
}

- (void)dealloc
{
  [(PUSectionedGridLayout *)self _clearRetainedCaches];
  v3.receiver = self;
  v3.super_class = (Class)PUSectionedGridLayout;
  [(PUSectionedGridLayout *)&v3 dealloc];
}

- (PUSectionedGridLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)PUSectionedGridLayout;
  objc_super v2 = [(PUSectionedGridLayout *)&v8 init];
  if (v2)
  {
    objc_super v3 = objc_alloc_init(PULayoutSampledSectioning);
    layoutSectioning = v2->_layoutSectioning;
    v2->_layoutSectioning = v3;

    [(PULayoutSectioning *)v2->_layoutSectioning setDelegate:v2];
    v2->_sectionHeadersEnabled = 1;
    char v5 = objc_alloc_init(PUSectionedGridLayoutData);
    layoutData = v2->_layoutData;
    v2->_layoutData = v5;
  }
  return v2;
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

@end