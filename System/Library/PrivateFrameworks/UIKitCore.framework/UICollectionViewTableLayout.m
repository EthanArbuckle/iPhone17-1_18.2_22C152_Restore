@interface UICollectionViewTableLayout
+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;
- (BOOL)_canReorderRowAtIndexPath:(id)a3;
- (BOOL)_estimatesHeights;
- (BOOL)_estimatesRowHeights;
- (BOOL)_estimatesSectionFooterHeights;
- (BOOL)_estimatesSectionHeaderHeights;
- (BOOL)_estimatesSizes;
- (BOOL)_hasHeaderFooterBelowRowAtIndexPath:(id)a3;
- (BOOL)_isShowingIndex;
- (BOOL)_isTableHeaderAutohiding;
- (BOOL)_needsRecomputeOfPreferredAttributesForVisibleEstimatedItemsDuringUpdate;
- (BOOL)_providesRowHeights;
- (BOOL)_sectionContentInsetFollowsLayoutMargins;
- (BOOL)_sectionHeadersHugContent;
- (BOOL)_shouldApplyReadableWidthInsets;
- (BOOL)_shouldDisplayExtraSeparatorsAtOffset:(double *)a3;
- (BOOL)_shouldDrawSeparatorAtTop:(BOOL)a3 ofSection:(int64_t)a4;
- (BOOL)_shouldDrawThickSeparators;
- (BOOL)_shouldDrawTopSeparatorDueToMergedBarForSectionAtIndex:(int64_t)a3;
- (BOOL)_shouldHaveFooterViewForSection:(int64_t)a3;
- (BOOL)_shouldHaveGlobalViewForElementOfKind:(id)a3;
- (BOOL)_shouldHaveHeaderViewForSection:(int64_t)a3;
- (BOOL)_shouldHaveViewForElementOfKind:(id)a3 atSection:(int64_t)a4 useRowData:(BOOL)a5;
- (BOOL)_shouldIndentWhileEditingForRowAtIndexPath:(id)a3;
- (BOOL)_shouldStripHeaderTopPaddingForSection:(int64_t)a3;
- (BOOL)_shouldUseNewHeaderFooterBehavior;
- (BOOL)_shouldUseSearchBarHeaderBehavior;
- (BOOL)_showsAdditionalSeparators;
- (BOOL)_supplementariesFollowSectionContentInsets;
- (BOOL)_supplementarySectionHeadersHugContent;
- (BOOL)_wantsBandSelectionVisualsInSection:(int64_t)a3;
- (BOOL)_wantsSwipes;
- (BOOL)allowsMultipleSelection;
- (BOOL)allowsMultipleSelectionDuringEditing;
- (BOOL)canBeEdited;
- (BOOL)cellLayoutMarginsFollowReadableWidth;
- (BOOL)insetsContentViewsToSafeArea;
- (BOOL)isEditing;
- (BOOL)overlapsSectionHeaderViews;
- (BOOL)separatorInsetIsRelativeToCellEdges;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4;
- (BOOL)swipeActionController:(id)a3 mayBeginSwipeForItemAtIndexPath:(id)a4;
- (BOOL)usesVariableMargins;
- (CGPoint)_contentOffsetFromProposedContentOffset:(CGPoint)a3 forScrollingToItemAtIndexPath:(id)a4 atScrollPosition:(unint64_t)a5;
- (CGRect)_extraSeparatorFrameForIndexPath:(id)a3 offset:(double)a4;
- (CGRect)_frameForSectionElementKind:(id)a3 atSection:(int64_t)a4 visibleRect:(CGRect)a5 floating:(BOOL *)a6 canGuess:(BOOL)a7;
- (CGRect)_indexFrame;
- (CGRect)_visibleRect;
- (CGSize)_sizeForHeaderInSection:(int64_t)a3;
- (CGSize)collectionViewContentSize;
- (NSIndexPath)deletedIndexPath;
- (NSMutableArray)deleteIndexPaths;
- (NSMutableArray)insertIndexPaths;
- (UICollectionViewDataSourceTableLayout)_dataSourceActual;
- (UICollectionViewDelegateTableLayout)_delegateActual;
- (UICollectionViewDelegateTableLayout)_delegateProxy;
- (UICollectionViewTableLayout)init;
- (UIColor)_accessoryBaseColor;
- (UIColor)_multiselectCheckmarkColor;
- (UIColor)backgroundColor;
- (UIColor)separatorColor;
- (UIEdgeInsets)_cellSafeAreaInsets;
- (UIEdgeInsets)_contentInset;
- (UIEdgeInsets)_preferredLayoutMargins;
- (UIEdgeInsets)_rawSectionContentInset;
- (UIEdgeInsets)_rawSeparatorInset;
- (UIEdgeInsets)_sectionContentInset;
- (UIEdgeInsets)_tableContentInset;
- (UIEdgeInsets)separatorInset;
- (UISwipeActionController)_swipeActionController;
- (UITableConstants)_constants;
- (UITableViewRowData)rowData;
- (UIView)_tableFooterView;
- (UIView)_tableHeaderView;
- (UIVisualEffect)separatorEffect;
- (_NSRange)_sectionRangeForBounds:(CGRect)a3;
- (double)_backgroundInset;
- (double)_bottomPadding;
- (double)_dataSourceHeightForFooterInSection:(int64_t)a3;
- (double)_dataSourceHeightForHeaderInSection:(int64_t)a3;
- (double)_dataSourceHeightForRowAtIndexPath:(id)a3;
- (double)_defaultCellHeight;
- (double)_defaultSectionFooterHeight;
- (double)_defaultSectionHeaderHeight;
- (double)_estimatedHeightForFooterInSection:(int64_t)a3;
- (double)_estimatedHeightForHeaderInSection:(int64_t)a3;
- (double)_estimatedHeightForRowAtIndexPath:(id)a3;
- (double)_headerFooterLeadingMarginWidthIsHeader:(BOOL)a3 isFirstSection:(BOOL)a4;
- (double)_headerFooterTrailingMarginWidth;
- (double)_heightForFooterInSection:(int64_t)a3;
- (double)_heightForFooterInSection:(int64_t)a3 useRowData:(BOOL)a4;
- (double)_heightForHeaderInSection:(int64_t)a3;
- (double)_heightForHeaderInSection:(int64_t)a3 useRowData:(BOOL)a4;
- (double)_heightForRowAtIndexPath:(id)a3;
- (double)_heightForTableFooter;
- (double)_heightForTableHeader;
- (double)_indexBarExtentFromEdge;
- (double)_maxTitleWidthForFooterInSection:(int64_t)a3;
- (double)_maxTitleWidthForHeaderInSection:(int64_t)a3;
- (double)_paddingAboveFirstSectionHeader;
- (double)_paddingAboveSectionHeaders;
- (double)_rowSpacing;
- (double)_sectionCornerRadius;
- (double)_sectionFooterToLastRowPadding;
- (double)_sectionHeaderToFirstRowPadding;
- (double)_sidePadding;
- (double)_topPadding;
- (double)estimatedRowHeight;
- (double)estimatedSectionFooterHeight;
- (double)estimatedSectionHeaderHeight;
- (double)rowHeight;
- (double)sectionFooterHeight;
- (double)sectionHeaderHeight;
- (id)_detailTextForHeaderInSection:(int64_t)a3;
- (id)_floatingElementKinds;
- (id)_indexPathsBelowIndexPath:(id)a3;
- (id)_invalidationContextForUpdatedLayoutMargins:(UIEdgeInsets)a3;
- (id)_layoutAttributesForCellWithIndexPath:(id)a3;
- (id)_layoutAttributesForSectionElementKind:(id)a3 atSection:(int64_t)a4;
- (id)_layoutAttributesForSeparatorWithIndexPath:(id)a3;
- (id)_layoutAttributesForViewElementKind:(id)a3;
- (id)_titleForFooterInSection:(int64_t)a3;
- (id)_titleForHeaderInSection:(int64_t)a3;
- (id)contextualActionForDeletingRowAtIndexPath:(id)a3;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)invalidationContextForInteractivelyMovingItems:(id)a3 withTargetPosition:(CGPoint)a4 previousIndexPaths:(id)a5 previousPosition:(CGPoint)a6;
- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)swipeActionController:(id)a3 indexPathForTouchLocation:(CGPoint)a4;
- (id)swipeActionController:(id)a3 leadingSwipeConfigurationForItemAtIndexPath:(id)a4;
- (id)swipeActionController:(id)a3 trailingSwipeConfigurationForItemAtIndexPath:(id)a4;
- (id)swipeActionController:(id)a3 viewForItemAtIndexPath:(id)a4;
- (id)swipeActionForDeletingRowAtIndexPath:(id)a3;
- (int64_t)_accessoryTypeForCell:(id)a3 forRowAtIndexPath:(id)a4;
- (int64_t)_editingStyleForRowAtIndexPath:(id)a3;
- (int64_t)_headerFooterPinningBehavior;
- (int64_t)_indentationLevelForRowAtIndexPath:(id)a3;
- (int64_t)_numberOfRowsInSection:(int64_t)a3;
- (int64_t)_numberOfSections;
- (int64_t)_tableStyle;
- (int64_t)_titleAlignmentForFooterInSection:(int64_t)a3;
- (int64_t)_titleAlignmentForHeaderInSection:(int64_t)a3;
- (int64_t)layoutDirectionForSwipeActionController:(id)a3;
- (int64_t)separatorStyle;
- (void)_cellAccessoryButtonTappedAtIndexPath:(id)a3;
- (void)_invalidateIndexPathsBelowIndexPath:(id)a3 withInvalidationContext:(id)a4;
- (void)_setCollectionView:(id)a3;
- (void)_setFloatingElementKinds:(id)a3;
- (void)_setHeight:(double)a3 forRowAtIndexPath:(id)a4 usingPresentationValues:(BOOL)a5;
- (void)_setShowsAdditionalSeparators:(BOOL)a3;
- (void)_setSwipeActionController:(id)a3;
- (void)_swipeToDeleteCell:(id)a3;
- (void)dealloc;
- (void)finalizeCollectionViewUpdates;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareForTransitionFromLayout:(id)a3;
- (void)prepareForTransitionToLayout:(id)a3;
- (void)prepareLayout;
- (void)resetSwipedRowWithCompletion:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCellLayoutMarginsFollowReadableWidth:(BOOL)a3;
- (void)setConstants:(id)a3;
- (void)setDeleteIndexPaths:(id)a3;
- (void)setDeletedIndexPath:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEstimatedRowHeight:(double)a3;
- (void)setEstimatedSectionFooterHeight:(double)a3;
- (void)setEstimatedSectionHeaderHeight:(double)a3;
- (void)setInsertIndexPaths:(id)a3;
- (void)setInsetsContentViewsToSafeArea:(BOOL)a3;
- (void)setRowData:(id)a3;
- (void)setRowHeight:(double)a3;
- (void)setSectionFooterHeight:(double)a3;
- (void)setSectionHeaderHeight:(double)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setSeparatorEffect:(id)a3;
- (void)setSeparatorInset:(UIEdgeInsets)a3;
- (void)setSeparatorInsetIsRelativeToCellEdges:(BOOL)a3;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)swipeActionController:(id)a3 animateView:(id)a4 actionsView:(id)a5 forDestructiveAction:(id)a6 atIndexPath:(id)a7 withSwipeInfo:(id *)a8 completion:(id)a9;
- (void)swipeActionController:(id)a3 didCompleteAction:(id)a4 cancelled:(BOOL)a5 atIndexPath:(id)a6;
- (void)swipeActionController:(id)a3 didEndSwipeForItemAtIndexPath:(id)a4;
- (void)swipeActionController:(id)a3 willBeginSwipeForItemAtIndexPath:(id)a4;
- (void)swipeActionController:(id)a3 willPerformAction:(id)a4 atIndexPath:(id)a5;
@end

@implementation UICollectionViewTableLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (UICollectionViewTableLayout)init
{
  v16.receiver = self;
  v16.super_class = (Class)UICollectionViewTableLayout;
  v2 = [(UICollectionViewLayout *)&v16 init];
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v2 + 600) = _Q0;
  *(_OWORD *)(v2 + 616) = _Q0;
  *(_OWORD *)(v2 + 296) = _Q0;
  *(_OWORD *)(v2 + 312) = _Q0;
  *((void *)v2 + 64) = -1;
  *((void *)v2 + 51) = 0x7FEFFFFFFFFFFFFFLL;
  *((void *)v2 + 52) = 0x7FEFFFFFFFFFFFFFLL;
  *((void *)v2 + 53) = 0x7FEFFFFFFFFFFFFFLL;
  [v2 _setFloatingElementKinds:0];
  [v2 setSeparatorInsetIsRelativeToCellEdges:dyld_program_sdk_at_least()];
  v2[404] = 1;
  v2[406] = 1;
  uint64_t v8 = objc_opt_new();
  v9 = (void *)*((void *)v2 + 46);
  *((void *)v2 + 46) = v8;

  uint64_t v10 = objc_opt_new();
  v11 = (void *)*((void *)v2 + 47);
  *((void *)v2 + 47) = v10;

  uint64_t v12 = objc_opt_new();
  v13 = (void *)*((void *)v2 + 48);
  *((void *)v2 + 48) = v12;

  [v2 registerClass:objc_opt_class() forDecorationViewOfKind:@"UICollectionElementKindSeparator"];
  v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 addObserver:v2 selector:sel__darkenedColorsChanged_ name:@"UIAccessibilityDarkerSystemColorsStatusDidChangeNotification" object:0];

  return (UICollectionViewTableLayout *)v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityDarkerSystemColorsStatusDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewTableLayout;
  [(UICollectionViewTableLayout *)&v4 dealloc];
}

- (id)_floatingElementKinds
{
  return [(NSSet *)self->_floatingElementKinds allObjects];
}

- (void)_setFloatingElementKinds:(id)a3
{
  if (a3) {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
  }
  else {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"UICollectionElementKindSectionHeader", @"UICollectionElementKindSectionFooter", 0);
  }
  objc_super v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  floatingElementKinds = self->_floatingElementKinds;
  self->_floatingElementKinds = v4;
}

- (void)prepareLayout
{
  id v22 = [(UICollectionViewLayout *)self collectionView];
  v3 = [v22 traitCollection];
  _UITableConstantsForTraitCollection(v3);
  objc_super v4 = (UITableConstants *)objc_claimAutoreleasedReturnValue();
  constants = self->_constants;
  self->_constants = v4;

  if (!self->_swipeActionController)
  {
    v6 = [v22 traitCollection];
    v7 = +[UISwipeActionVisualStyleProvider visualStyleForIdiom:](UISwipeActionVisualStyleProvider, "visualStyleForIdiom:", [v6 userInterfaceIdiom]);

    uint64_t v8 = -[UISwipeActionController initWithSwipeActionHost:style:]([UISwipeActionController alloc], "initWithSwipeActionHost:style:", self, objc_msgSend(v7, "defaultSwipeActionUIStyleForUITableViewStyle:", -[UICollectionViewTableLayout _tableStyle](self, "_tableStyle")));
    swipeActionController = self->_swipeActionController;
    self->_swipeActionController = v8;
  }
  if (self->_separatorStyle == -1) {
    self->_separatorStyle = [(UITableConstants *)self->_constants defaultSeparatorStyleForTableViewStyle:[(UICollectionViewTableLayout *)self _tableStyle]];
  }
  if (!self->_separatorColor)
  {
    uint64_t v10 = [(UITableConstants *)self->_constants defaultSeparatorColorForTableViewStyle:[(UICollectionViewTableLayout *)self _tableStyle]];
    separatorColor = self->_separatorColor;
    self->_separatorColor = v10;

    uint64_t v12 = [(UICollectionViewLayout *)self collectionView];
    v13 = [v12 _accessibilityHigherContrastTintColorForColor:self->_separatorColor];
    darkenedSeparatorColor = self->_darkenedSeparatorColor;
    self->_darkenedSeparatorColor = v13;
  }
  if (self->_rowHeight == 1.79769313e308)
  {
    [(UITableConstants *)self->_constants defaultRowHeightForTableView:self];
    self->_rowHeight = v15;
  }
  if (self->_sectionHeaderHeight == 1.79769313e308)
  {
    [(UICollectionViewTableLayout *)self _defaultSectionHeaderHeight];
    self->_sectionHeaderHeight = v16;
  }
  if (self->_sectionFooterHeight == 1.79769313e308)
  {
    [(UICollectionViewTableLayout *)self _defaultSectionFooterHeight];
    self->_sectionFooterHeight = v17;
  }
  rowData = self->_rowData;
  if (!rowData)
  {
    v19 = (UITableViewRowData *)-[UITableViewRowData initWithTableView:]([UITableViewRowData alloc], self);
    v20 = self->_rowData;
    self->_rowData = v19;

    rowData = self->_rowData;
  }
  [v22 bounds];
  double Width = CGRectGetWidth(v24);
  if (rowData) {
    rowData->_tableViewdouble Width = Width;
  }
  -[UITableViewRowData ensureAllSectionsAreValid](self->_rowData);
}

- (void)prepareForTransitionFromLayout:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewTableLayout;
  [(UICollectionViewLayout *)&v4 prepareForTransitionFromLayout:a3];
  [(UISwipeActionController *)self->_swipeActionController setSwipeEnabled:1];
}

- (void)prepareForTransitionToLayout:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewTableLayout;
  [(UICollectionViewLayout *)&v4 prepareForTransitionToLayout:a3];
  [(UISwipeActionController *)self->_swipeActionController setSwipeEnabled:0];
}

- (void)_setCollectionView:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewTableLayout;
  id v4 = a3;
  [(UICollectionViewLayout *)&v11 _setCollectionView:v4];
  -[UIScrollView _setContentScrollsAlongXAxis:](self->super._collectionView, "_setContentScrollsAlongXAxis:", 0, v11.receiver, v11.super_class);
  [(UIScrollView *)self->super._collectionView _setContentScrollsAlongYAxis:1];
  [v4 layoutMargins];
  self->_previousLayoutMargins.top = v5;
  self->_previousLayoutMargins.left = v6;
  self->_previousLayoutMargins.bottom = v7;
  self->_previousLayoutMargins.right = v8;
  [v4 _currentScreenScale];
  double v10 = v9;

  self->_memoizedScale = v10;
}

- (CGPoint)_contentOffsetFromProposedContentOffset:(CGPoint)a3 forScrollingToItemAtIndexPath:(id)a4 atScrollPosition:(unint64_t)a5
{
  double y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  if (a5 == 4)
  {
    v20 = [(UICollectionViewTableLayout *)self _floatingElementKinds];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      [(UICollectionViewTableLayout *)self _visibleRect];
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      -[UITableViewRowData floatingRectForFooterInSection:visibleRect:heightCanBeGuessed:outIsFloating:]((uint64_t)self->_rowData, [v9 section], 0, 0, v22, v24, v26, v28);
      double v31 = v30;
      double v33 = v32;
      v38.origin.CGFloat x = v23;
      v38.origin.double y = v25;
      v38.size.width = v27;
      v38.size.height = v29;
      if (y + CGRectGetHeight(v38) > v31) {
        double y = y + v33;
      }
    }
    else
    {
      uint64_t v34 = [v9 item];
      if (v34 == -[UITableViewRowData numberOfRowsInSection:]((uint64_t)self->_rowData, [v9 section]) - 1) {
        double y = y
      }
          + -[UITableViewRowData heightForFooterInSection:canGuess:]((uint64_t)self->_rowData, [v9 section], 0);
    }
  }
  else if (a5 == 1)
  {
    double v10 = [(UICollectionViewTableLayout *)self _floatingElementKinds];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      rowData = self->_rowData;
      uint64_t v13 = [v9 section];
      [(UICollectionViewTableLayout *)self _visibleRect];
      -[UITableViewRowData floatingRectForHeaderInSection:visibleRect:heightCanBeGuessed:outIsFloating:]((uint64_t)rowData, v13, 0, 0, v14, v15, v16, v17);
      if (y < v19 + v18) {
        double y = y - v18;
      }
    }
    else if (![v9 item])
    {
      double y = y
        - -[UITableViewRowData heightForHeaderInSection:canGuess:]((uint64_t)self->_rowData, [v9 section], 0);
    }
  }

  double v35 = x;
  double v36 = y;
  result.double y = v36;
  result.CGFloat x = v35;
  return result;
}

- (BOOL)_estimatesSizes
{
  if ([(UICollectionViewTableLayout *)self _estimatesRowHeights]
    || [(UICollectionViewTableLayout *)self _estimatesSectionHeaderHeights])
  {
    return 1;
  }
  return [(UICollectionViewTableLayout *)self _estimatesSectionFooterHeights];
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(UICollectionViewTableLayout *)self _estimatesSizes];
  [v6 representedElementCategory];
  [v7 size];
  double v10 = v9;
  double v12 = v11;

  [v6 size];
  double v14 = v13;
  double v16 = v15;

  BOOL v17 = v10 != v14;
  if (v12 != v16) {
    BOOL v17 = 1;
  }
  return v8 && v17;
}

- (id)_indexPathsBelowIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_indexPathCache count];
  uint64_t v6 = v5;
  if (self->_indexPathCache)
  {
    if (v5) {
      goto LABEL_11;
    }
  }
  else
  {
    rowData = self->_rowData;
    BOOL v8 = [MEMORY[0x1E4F28D58] indexPathForRow:0x7FFFFFFFFFFFFFFFLL inSection:0];
    double v9 = -[UITableViewRowData _indexPathsBelowIndexPath:]((uint64_t)rowData, v8);
    double v10 = (NSMutableArray *)[v9 mutableCopy];
    indexPathCache = self->_indexPathCache;
    self->_indexPathCache = v10;

    if (v6) {
      goto LABEL_11;
    }
  }
  if ([(NSMutableArray *)self->_indexPathCache count])
  {
    unint64_t v12 = 0;
    do
    {
      double v13 = [(NSMutableArray *)self->_indexPathCache objectAtIndexedSubscript:v12];
      if ([v13 length] == 2 && objc_msgSend(v13, "row") == 0x7FFFFFFFFFFFFFFFLL)
      {
        double v14 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathWithIndex:", objc_msgSend(v13, "section"));
        [(NSMutableArray *)self->_indexPathCache setObject:v14 atIndexedSubscript:v12];
      }
      ++v12;
    }
    while (v12 < [(NSMutableArray *)self->_indexPathCache count]);
  }
LABEL_11:
  unint64_t v15 = [(NSMutableArray *)self->_indexPathCache indexOfObject:v4];
  if ((double)v15 == 9.22337204e18) {
    double v16 = 0.0;
  }
  else {
    double v16 = (double)v15;
  }
  double v17 = (double)(unint64_t)[(NSMutableArray *)self->_indexPathCache count] - v16;
  if (v17 < 0.0) {
    double v17 = (double)(unint64_t)[(NSMutableArray *)self->_indexPathCache count];
  }
  double v18 = -[NSMutableArray subarrayWithRange:](self->_indexPathCache, "subarrayWithRange:", (unint64_t)v16, (unint64_t)v17);

  return v18;
}

- (void)_invalidateIndexPathsBelowIndexPath:(id)a3 withInvalidationContext:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [MEMORY[0x1E4F1CA48] array];
  double v9 = [MEMORY[0x1E4F1CA48] array];
  double v10 = [MEMORY[0x1E4F1CA48] array];
  v20 = v6;
  double v11 = [(UICollectionViewTableLayout *)self _indexPathsBelowIndexPath:v6];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v17 = [v16 length];
        double v18 = v8;
        if (v17 == 2) {
          goto LABEL_7;
        }
        if ([v16 length] == 1)
        {
          if (-[UICollectionViewTableLayout _shouldHaveHeaderViewForSection:](self, "_shouldHaveHeaderViewForSection:", [v16 section]))
          {
            [v9 addObject:v16];
          }
          BOOL v19 = -[UICollectionViewTableLayout _shouldHaveFooterViewForSection:](self, "_shouldHaveFooterViewForSection:", [v16 section]);
          double v18 = v10;
          if (v19) {
LABEL_7:
          }
            [v18 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }
  [v7 invalidateItemsAtIndexPaths:v8];
  [v7 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionHeader" atIndexPaths:v9];
  [v7 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionFooter" atIndexPaths:v10];
}

- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = objc_alloc_init(UICollectionViewTableLayoutInvalidationContext);
  double v9 = [v6 indexPath];
  [v7 size];
  double v11 = v10;

  [v6 size];
  double v13 = v12;
  if (![v6 representedElementCategory])
  {
    double v16 = &OBJC_IVAR___UICollectionViewTableLayout__preferredAttributesCache;
    if (vabdd_f64(v11, v13) > 2.22044605e-16) {
      -[UITableViewRowData setHeight:forRowAtIndexPath:]((uint64_t)self->_rowData, v9, v11);
    }
    goto LABEL_8;
  }
  if ([v6 representedElementCategory] != 1) {
    goto LABEL_9;
  }
  uint64_t v14 = [v6 representedElementKind];
  int v15 = [v14 isEqualToString:@"UICollectionElementKindSectionHeader"];

  if (v15)
  {
    double v16 = &OBJC_IVAR___UICollectionViewTableLayout__headerPreferredAttributesCache;
    if (vabdd_f64(v11, v13) > 2.22044605e-16) {
      -[UITableViewRowData setHeight:forHeaderInSection:]((uint64_t)self->_rowData, [v9 section], v11);
    }
LABEL_8:
    [*(id *)((char *)&self->super.super.isa + *v16) addObject:v9];
    goto LABEL_9;
  }
  double v18 = [v6 representedElementKind];
  int v19 = [v18 isEqualToString:@"UICollectionElementKindSectionFooter"];

  if (v19)
  {
    double v16 = &OBJC_IVAR___UICollectionViewTableLayout__footerPreferredAttributesCache;
    if (vabdd_f64(v11, v13) > 2.22044605e-16) {
      -[UITableViewRowData setHeight:forFooterInSection:]((uint64_t)self->_rowData, [v9 section], v11);
    }
    goto LABEL_8;
  }
LABEL_9:
  [(UICollectionViewTableLayout *)self _invalidateIndexPathsBelowIndexPath:v9 withInvalidationContext:v8];
  [(UICollectionViewTableLayoutInvalidationContext *)v8 setSkipSectionInvalidation:1];

  return v8;
}

- (BOOL)_wantsBandSelectionVisualsInSection:(int64_t)a3
{
  return 0;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v8 = [(UICollectionViewLayout *)self collectionView];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double v17 = CGRectGetWidth(v35);
  v36.origin.CGFloat x = v10;
  v36.origin.CGFloat y = v12;
  v36.size.CGFloat width = v14;
  v36.size.CGFloat height = v16;
  if (v17 != CGRectGetWidth(v36)) {
    return 1;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v32[0] = @"UICollectionElementKindSectionHeader";
  v32[1] = @"UICollectionElementKindSectionFooter";
  int v19 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v32, 2, 0);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        if ([(NSSet *)self->_floatingElementKinds containsObject:v24])
        {
          CGFloat v25 = [(UICollectionViewLayout *)self collectionView];
          char v26 = [v25 _hasRegisteredClassOrNibForSupplementaryViewOfKind:v24];

          if (v26)
          {
            BOOL v18 = 1;
            goto LABEL_14;
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)UICollectionViewTableLayout;
  CGFloat x = a3.origin.x;
  CGFloat v38 = a3.origin.x;
  CGFloat y = a3.origin.y;
  CGFloat v5 = a3.origin.y;
  CGFloat width = a3.size.width;
  CGFloat v42 = a3.size.width;
  CGFloat obja = a3.size.height;
  CGFloat height = a3.size.height;
  BOOL v8 = -[UICollectionViewLayout invalidationContextForBoundsChange:](&v50, sel_invalidationContextForBoundsChange_);
  double v9 = [(UICollectionViewLayout *)self collectionView];
  [v9 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v55.origin.CGFloat x = v11;
  v55.origin.CGFloat y = v13;
  v55.size.CGFloat width = v15;
  v55.size.CGFloat height = v17;
  v59.origin.CGFloat x = x;
  v59.origin.CGFloat y = v5;
  v59.size.CGFloat width = width;
  v59.size.CGFloat height = height;
  CGRect v56 = CGRectUnion(v55, v59);
  double v18 = v56.origin.x;
  double v19 = v56.origin.y;
  double v20 = v56.size.width;
  double v21 = v56.size.height;
  [(UICollectionViewTableLayout *)self _contentInset];
  unint64_t v40 = -[UICollectionViewTableLayout _sectionRangeForBounds:](self, "_sectionRangeForBounds:", v18 + v25, v19 + v22, v20 - (v25 + v23), v21 - (v22 + v24));
  uint64_t v41 = v26;
  v57.origin.CGFloat x = v11;
  v57.origin.CGFloat y = v13;
  v57.size.CGFloat width = v15;
  v57.size.CGFloat height = v17;
  double v27 = CGRectGetWidth(v57);
  v58.origin.CGFloat x = v38;
  v58.origin.CGFloat y = y;
  v58.size.CGFloat width = v42;
  v58.size.CGFloat height = obja;
  if (v27 != CGRectGetWidth(v58)) {
    [v8 _setInvalidateEverything:1];
  }
  if (v41)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v51[0] = @"UICollectionElementKindSectionHeader";
    v51[1] = @"UICollectionElementKindSectionFooter";
    id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    uint64_t v28 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v47;
      do
      {
        uint64_t v31 = 0;
        uint64_t v43 = v29;
        do
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v46 + 1) + 8 * v31);
          if ([(NSSet *)self->_floatingElementKinds containsObject:v32])
          {
            double v33 = [MEMORY[0x1E4F1CA48] array];
            uint64_t v34 = v41;
            unint64_t v35 = v40;
            if (v40 < v40 + v41)
            {
              do
              {
                if ([(UICollectionViewTableLayout *)self _shouldHaveViewForElementOfKind:v32 atSection:v35 useRowData:1])
                {
                  CGRect v36 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v35];
                  [v33 addObject:v36];
                }
                ++v35;
                --v34;
              }
              while (v34);
            }
            if ([v33 count]) {
              [v8 invalidateSupplementaryElementsOfKind:v32 atIndexPaths:v33];
            }

            uint64_t v29 = v43;
          }
          ++v31;
        }
        while (v31 != v29);
        uint64_t v29 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v29);
    }
  }
  return v8;
}

- (id)invalidationContextForInteractivelyMovingItems:(id)a3 withTargetPosition:(CGPoint)a4 previousIndexPaths:(id)a5 previousPosition:(CGPoint)a6
{
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewTableLayout;
  id v6 = -[UICollectionViewLayout invalidationContextForInteractivelyMovingItems:withTargetPosition:previousIndexPaths:previousPosition:](&v8, sel_invalidationContextForInteractivelyMovingItems_withTargetPosition_previousIndexPaths_previousPosition_, a3, a5, a4.x, a4.y, a6.x, a6.y);
  [v6 _setInvalidateDataSourceCounts:1];
  return v6;
}

- (id)_invalidationContextForUpdatedLayoutMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  CGFloat bottom = a3.bottom;
  double left = a3.left;
  CGFloat top = a3.top;
  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewTableLayout;
  objc_super v8 = [(UICollectionViewLayout *)&v12 _invalidationContextForUpdatedLayoutMargins:sel__invalidationContextForUpdatedLayoutMargins_];
  double v9 = v8;
  p_previousLayoutMargins = &self->_previousLayoutMargins;
  if (vabdd_f64(p_previousLayoutMargins->left, left) > 2.22044605e-16
    || vabdd_f64(p_previousLayoutMargins->right, right) > 2.22044605e-16)
  {
    [v8 _setInvalidateEverything:1];
  }
  p_previousLayoutMargins->CGFloat top = top;
  p_previousLayoutMargins->double left = left;
  p_previousLayoutMargins->CGFloat bottom = bottom;
  p_previousLayoutMargins->double right = right;
  return v9;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 invalidateEverything] & 1) == 0
    && ([v4 invalidateDataSourceCounts] & 1) == 0
    && ![v4 invalidateTableLayoutDelegateMetrics])
  {
    if (([v4 skipSectionInvalidation] & 1) == 0)
    {
      CGFloat v13 = [MEMORY[0x1E4F28E60] indexSet];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      double v14 = [v4 invalidatedItemIndexPaths];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v14);
            }
            objc_msgSend(v13, "addIndex:", objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "section"));
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v16);
      }

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __59__UICollectionViewTableLayout_invalidateLayoutWithContext___block_invoke;
      v23[3] = &unk_1E52DA548;
      v23[4] = self;
      [v13 enumerateIndexesUsingBlock:v23];
    }
    double v19 = [v4 invalidatedSupplementaryIndexPaths];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__UICollectionViewTableLayout_invalidateLayoutWithContext___block_invoke_2;
    v21[3] = &unk_1E52E4CF0;
    v21[4] = self;
    id v22 = v4;
    [v19 enumerateKeysAndObjectsUsingBlock:v21];

    goto LABEL_19;
  }
  -[UITableViewRowData invalidateAllSections]((uint64_t)self->_rowData);
  if (self->_deletedIndexPath)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    CGFloat v5 = [v4 _updateItems];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v29;
LABEL_7:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
        if ([v10 updateAction] == 1)
        {
          CGFloat v11 = [v10 indexPathBeforeUpdate];
          char v12 = [v11 isEqual:self->_deletedIndexPath];

          if (v12) {
            break;
          }
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v7) {
            goto LABEL_7;
          }
          goto LABEL_14;
        }
      }

      if (![v4 invalidateEverything]) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_14:
  }
  [v4 invalidateEverything];
LABEL_17:
  [(UISwipeActionController *)self->_swipeActionController resetSwipedItemAnimated:0 completion:0];
LABEL_18:
  [(NSMutableArray *)self->_indexPathCache removeAllObjects];
  [(NSMutableSet *)self->_preferredAttributesCache removeAllObjects];
  [(NSMutableSet *)self->_headerPreferredAttributesCache removeAllObjects];
  [(NSMutableSet *)self->_footerPreferredAttributesCache removeAllObjects];
LABEL_19:
  v20.receiver = self;
  v20.super_class = (Class)UICollectionViewTableLayout;
  [(UICollectionViewLayout *)&v20 invalidateLayoutWithContext:v4];
}

uint64_t __59__UICollectionViewTableLayout_invalidateLayoutWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[UITableViewRowData invalidateSection:](*(void *)(*(void *)(a1 + 32) + 528), a2);
}

void __59__UICollectionViewTableLayout_invalidateLayoutWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isEqualToString:@"UICollectionElementKindGlobalHeader"])
  {
    id v27 = v3;
    [*(id *)(a1 + 32) _heightForTableHeader];
    double v5 = v4;
    double v6 = -[UITableViewRowData heightForTableHeaderView](*(void *)(*(void *)(a1 + 32) + 528));
    -[UITableViewRowData tableHeaderHeightDidChangeToHeight:](*(void *)(*(void *)(a1 + 32) + 528), v5);
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(double **)(*(void *)(a1 + 32) + 528);
    double v9 = -[UITableViewRowData rectForTable]((uint64_t)v8);
    CGFloat v13 = -[UITableViewRowData indexPathsForRowsInRect:](v8, v9, v10, v11, v12);
    [v7 invalidateItemsAtIndexPaths:v13];

    uint64_t v14 = [*(id *)(a1 + 32) _numberOfSections];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v34[0] = @"UICollectionElementKindSectionHeader";
    v34[1] = @"UICollectionElementKindSectionFooter";
    id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        uint64_t v18 = 0;
        uint64_t v28 = v16;
        do
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * v18);
          if ([*(id *)(*(void *)(a1 + 32) + 272) containsObject:v19])
          {
            objc_super v20 = [MEMORY[0x1E4F1CA48] array];
            if (v14)
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if ([*(id *)(a1 + 32) _shouldHaveViewForElementOfKind:v19 atSection:i useRowData:1])
                {
                  id v22 = [MEMORY[0x1E4F28D58] indexPathWithIndex:i];
                  [v20 addObject:v22];
                }
              }
            }
            if ([v20 count]) {
              [*(id *)(a1 + 40) invalidateSupplementaryElementsOfKind:v19 atIndexPaths:v20];
            }

            uint64_t v16 = v28;
          }
          ++v18;
        }
        while (v18 != v16);
        uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v16);
    }
    double v23 = v5 - v6;

    id v3 = v27;
  }
  else
  {
    if (![v3 isEqualToString:@"UICollectionElementKindGlobalFooter"]) {
      goto LABEL_24;
    }
    [*(id *)(a1 + 32) _heightForTableFooter];
    double v25 = v24;
    double v23 = v24 - -[UITableViewRowData heightForTableFooterView](*(void *)(*(void *)(a1 + 32) + 528));
    uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 528);
    if (v26) {
      *(double *)(v26 + 104) = v25;
    }
  }
  if (v23 != 0.0) {
    objc_msgSend(*(id *)(a1 + 40), "setContentSizeAdjustment:", *MEMORY[0x1E4F1DB30], v23);
  }
LABEL_24:
}

- (id)_layoutAttributesForCellWithIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", v4);
  [(id)objc_opt_class() applyValuesFromAttributes:self toAttributes:v5 valueOptions:3];
  int64_t v6 = [(UICollectionViewTableLayout *)self _editingStyleForRowAtIndexPath:v4];
  BOOL v7 = [(UICollectionViewTableLayout *)self _shouldIndentWhileEditingForRowAtIndexPath:v4];
  BOOL v8 = [(UICollectionViewTableLayout *)self _canReorderRowAtIndexPath:v4];
  [v5 setAccessoryType:0];
  objc_msgSend(v5, "setSectionLocation:", -[UITableViewRowData sectionLocationForRow:inSection:]((uint64_t)self->_rowData, objc_msgSend(v4, "row"), objc_msgSend(v4, "section")));
  [v5 setEditingStyle:v6];
  [v5 setShouldIndentWhileEditing:v7];
  [v5 setShowsReorderControl:v8];
  objc_msgSend(v5, "setLayoutMarginsFollowReadableWidth:", -[UICollectionViewTableLayout cellLayoutMarginsFollowReadableWidth](self, "cellLayoutMarginsFollowReadableWidth"));
  objc_msgSend(v5, "setInsetsContentViewsToSafeArea:", -[UICollectionViewTableLayout insetsContentViewsToSafeArea](self, "insetsContentViewsToSafeArea"));
  objc_msgSend(v5, "setSeparatorInsetIsRelativeToCellEdges:", -[UICollectionViewTableLayout separatorInsetIsRelativeToCellEdges](self, "separatorInsetIsRelativeToCellEdges"));
  double v9 = [(UICollectionViewTableLayout *)self _constants];
  [v9 defaultLeadingCellMarginWidthForTableView:self];
  objc_msgSend(v5, "setDefaultLeadingCellMarginWidth:");

  CGFloat v10 = [(UICollectionViewTableLayout *)self _constants];
  [v10 defaultTrailingCellMarginWidthForTableView:self];
  objc_msgSend(v5, "setDefaultTrailingCellMarginWidth:");

  [(UICollectionViewTableLayout *)self _indexBarExtentFromEdge];
  objc_msgSend(v5, "setIndexBarExtentFromEdge:");
  [(UICollectionViewTableLayout *)self _sectionContentInset];
  objc_msgSend(v5, "setBackgroundInset:");
  objc_msgSend(v5, "setIndentationLevel:", -[UICollectionViewTableLayout _indentationLevelForRowAtIndexPath:](self, "_indentationLevelForRowAtIndexPath:", v4));
  objc_msgSend(v5, "setDrawsSeparatorAtTopOfSection:", -[UICollectionViewTableLayout _shouldDrawSeparatorAtTop:ofSection:](self, "_shouldDrawSeparatorAtTop:ofSection:", 1, objc_msgSend(v4, "section")));
  objc_msgSend(v5, "setDrawsSeparatorAtBottomOfSection:", -[UICollectionViewTableLayout _shouldDrawSeparatorAtTop:ofSection:](self, "_shouldDrawSeparatorAtTop:ofSection:", 0, objc_msgSend(v4, "section")));
  uint64_t v11 = [(NSMutableSet *)self->_preferredAttributesCache containsObject:v4];

  [v5 setPreferredAttributesCached:v11];
  return v5;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewTableLayout;
  double v5 = -[UICollectionViewLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](&v9, sel_layoutAttributesForInteractivelyMovingItemAtIndexPath_withTargetPosition_, a3, a4.x, a4.y);
  [v5 setSeparatorStyle:0];
  int64_t v6 = +[UIColor clearColor];
  [v5 setBackgroundColor:v6];

  BOOL v7 = [(UICollectionViewTableLayout *)self _constants];
  [v7 defaultAlphaForReorderingCell];
  objc_msgSend(v5, "setAlpha:");

  return v5;
}

- (id)_layoutAttributesForViewElementKind:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"UICollectionElementKindGlobalHeader"] & 1) != 0
    || [v4 isEqualToString:@"UICollectionElementKindGlobalFooter"])
  {
    double v5 = (void *)[(id)objc_opt_class() layoutAttributesClass];
    int64_t v6 = [MEMORY[0x1E4F28D58] indexPathWithIndex:0];
    BOOL v7 = [v5 layoutAttributesForSupplementaryViewOfKind:v4 withIndexPath:v6];

    int v8 = [v4 isEqualToString:@"UICollectionElementKindGlobalHeader"];
    rowData = self->_rowData;
    if (v8) {
      double v10 = -[UITableViewRowData rectForTableHeaderView]((uint64_t)rowData);
    }
    else {
      double v10 = -[UITableViewRowData rectForTableFooterView]((uint64_t)rowData);
    }
    [v7 setFrame:v10];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_layoutAttributesForSectionElementKind:(id)a3 atSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 isEqualToString:@"UICollectionElementKindSectionHeader"];
  if (((v7 & 1) != 0
     || [v6 isEqualToString:@"UICollectionElementKindSectionFooter"])
    && [(UICollectionViewTableLayout *)self _numberOfSections] > a4)
  {
    int v8 = (void *)[(id)objc_opt_class() layoutAttributesClass];
    objc_super v9 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a4];
    double v10 = [v8 layoutAttributesForSupplementaryViewOfKind:v6 withIndexPath:v9];

    [v10 setIsHeader:v7];
    [(UICollectionViewTableLayout *)self _headerFooterLeadingMarginWidthIsHeader:v7 isFirstSection:a4 == 0];
    objc_msgSend(v10, "setMargins:", 0.0, v11, 0.0, v11);
    CGFloat v12 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a4];
    int v13 = [v10 isHeader];
    rowData = self->_rowData;
    if (v13)
    {
      objc_msgSend(v10, "setMaxTitleWidth:", -[UITableViewRowData maxHeaderTitleWidthForSection:]((uint64_t)rowData, a4));
      uint64_t v15 = -[UITableViewRowData headerAlignmentForSection:]((uint64_t)self->_rowData, a4);
      uint64_t v16 = &OBJC_IVAR___UICollectionViewTableLayout__headerPreferredAttributesCache;
    }
    else
    {
      objc_msgSend(v10, "setMaxTitleWidth:", -[UITableViewRowData maxFooterTitleWidthForSection:]((uint64_t)rowData, a4));
      uint64_t v15 = -[UITableViewRowData footerAlignmentForSection:]((uint64_t)self->_rowData, a4);
      uint64_t v16 = &OBJC_IVAR___UICollectionViewTableLayout__footerPreferredAttributesCache;
    }
    [v10 setTextAlignment:v15];
    objc_msgSend(v10, "setPreferredAttributesCached:", objc_msgSend(*(id *)((char *)&self->super.super.isa + *v16), "containsObject:", v12));
    [v10 setZIndex:1];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)_layoutAttributesForSeparatorWithIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForDecorationViewOfKind:withIndexPath:", @"UICollectionElementKindSeparator", v4);

  id v6 = [(UICollectionViewTableLayout *)self separatorColor];
  [v5 setSeparatorColor:v6];

  objc_msgSend(v5, "setSeparatorStyle:", -[UICollectionViewTableLayout separatorStyle](self, "separatorStyle"));
  uint64_t v7 = [(UICollectionViewTableLayout *)self separatorEffect];
  [v5 setSeparatorEffect:v7];

  return v5;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [(UICollectionViewTableLayout *)self _numberOfSections];
  id v6 = [(UICollectionViewLayout *)self collectionView];
  [v6 bounds];
  CGFloat v77 = v8;
  CGFloat v78 = v7;
  CGFloat rect = v9;
  double v79 = v10;

  if (v5 >= 1)
  {
    unint64_t v11 = -[UITableViewRowData globalRowsInRect:canGuess:](&self->_rowData->super.isa, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    if (v11 < v11 + v12)
    {
      uint64_t v13 = v11;
      uint64_t v14 = v12;
      do
      {
        uint64_t v15 = -[UITableViewRowData indexPathForRowAtGlobalRow:](&self->_rowData->super.isa, v13);
        uint64_t v16 = [(UICollectionViewTableLayout *)self _layoutAttributesForCellWithIndexPath:v15];
        double v20 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](&self->_rowData->super.isa, v13, 1);
        CGFloat v21 = v17;
        CGFloat v22 = v18;
        CGFloat v23 = v19;
        if (fabs(self->_memoizedScale) >= 2.22044605e-16) {
          double memoizedScale = self->_memoizedScale;
        }
        else {
          double memoizedScale = 1.0;
        }
        double v25 = v20;
        double v26 = round(CGRectGetMinX(*(CGRect *)(&v17 - 1)) * memoizedScale) / memoizedScale;
        v93.origin.double x = v20;
        v93.origin.double y = v21;
        v93.size.double width = v22;
        v93.size.double height = v23;
        double v27 = round(CGRectGetMinY(v93) * memoizedScale) / memoizedScale;
        v94.origin.double x = v20;
        v94.origin.double y = v21;
        v94.size.double width = v22;
        v94.size.double height = v23;
        double v28 = round(memoizedScale * CGRectGetWidth(v94)) / memoizedScale;
        v95.origin.double x = v20;
        v95.origin.double y = v21;
        v95.size.double width = v22;
        v95.size.double height = v23;
        objc_msgSend(v16, "setFrame:", v26, v27, v28, round(memoizedScale * CGRectGetHeight(v95)) / memoizedScale);
        [v4 addObject:v16];

        ++v13;
        --v14;
      }
      while (v14);
    }
    unint64_t v29 = -[UICollectionViewTableLayout _sectionRangeForBounds:](self, "_sectionRangeForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    uint64_t v80 = v30;
    [(UICollectionViewTableLayout *)self _visibleRect];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    v89[0] = @"UICollectionElementKindSectionHeader";
    v89[1] = @"UICollectionElementKindSectionFooter";
    id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];
    uint64_t v39 = [obj countByEnumeratingWithState:&v85 objects:v90 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v82 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v86 != v82) {
            objc_enumerationMutation(obj);
          }
          if (v29 < v29 + v80)
          {
            uint64_t v42 = *(void *)(*((void *)&v85 + 1) + 8 * i);
            uint64_t v43 = v80;
            unint64_t v44 = v29;
            do
            {
              if ([(UICollectionViewTableLayout *)self _shouldHaveViewForElementOfKind:v42 atSection:v44 useRowData:1])
              {
                LOBYTE(v84) = 0;
                -[UICollectionViewTableLayout _frameForSectionElementKind:atSection:visibleRect:floating:canGuess:](self, "_frameForSectionElementKind:atSection:visibleRect:floating:canGuess:", v42, v44, &v84, 1, v32, v34, v36, v38);
                double x = v96.origin.x;
                double y = v96.origin.y;
                double width = v96.size.width;
                double height = v96.size.height;
                if (CGRectIntersectsRect(v96, a3))
                {
                  long long v49 = [(UICollectionViewTableLayout *)self _layoutAttributesForSectionElementKind:v42 atSection:v44];
                  objc_msgSend(v49, "setFrame:", x, y, width, height);
                  [v49 setFloating:LOBYTE(v84)];
                  [v4 addObject:v49];
                }
              }
              ++v44;
              --v43;
            }
            while (v43);
          }
        }
        uint64_t v40 = [obj countByEnumeratingWithState:&v85 objects:v90 count:16];
      }
      while (v40);
    }
  }
  v97.origin.double x = -[UITableViewRowData rectForTableHeaderView]((uint64_t)self->_rowData);
  CGFloat v50 = v97.origin.x;
  CGFloat v51 = v97.origin.y;
  CGFloat v52 = v97.size.width;
  CGFloat v53 = v97.size.height;
  if (!CGRectIsEmpty(v97))
  {
    v101.origin.double x = v50;
    v101.origin.double y = v51;
    v101.size.double width = v52;
    v101.size.double height = v53;
    if (CGRectIntersectsRect(a3, v101))
    {
      if ([(UICollectionViewTableLayout *)self _shouldHaveGlobalViewForElementOfKind:@"UICollectionElementKindGlobalHeader"])
      {
        v54 = [(UICollectionViewTableLayout *)self _layoutAttributesForViewElementKind:@"UICollectionElementKindGlobalHeader"];
        if (v54) {
          [v4 addObject:v54];
        }
      }
    }
  }
  v98.origin.double x = -[UITableViewRowData rectForTableFooterView]((uint64_t)self->_rowData);
  CGFloat v55 = v98.origin.x;
  CGFloat v56 = v98.origin.y;
  CGFloat v57 = v98.size.width;
  CGFloat v58 = v98.size.height;
  if (!CGRectIsEmpty(v98))
  {
    v102.origin.double x = v55;
    v102.origin.double y = v56;
    v102.size.double width = v57;
    v102.size.double height = v58;
    if (CGRectIntersectsRect(a3, v102))
    {
      if ([(UICollectionViewTableLayout *)self _shouldHaveGlobalViewForElementOfKind:@"UICollectionElementKindGlobalFooter"])
      {
        CGRect v59 = [(UICollectionViewTableLayout *)self _layoutAttributesForViewElementKind:@"UICollectionElementKindGlobalFooter"];
        if (v59) {
          [v4 addObject:v59];
        }
      }
    }
  }
  double v60 = -[UITableViewRowData heightForTable]((uint64_t)self->_rowData);
  v99.origin.double y = v77;
  v99.origin.double x = v78;
  v99.size.double width = rect;
  v99.size.double height = v79;
  if (v60 < CGRectGetHeight(v99))
  {
    if (self->_separatorStyle)
    {
      double v84 = 0.0;
      if ([(UICollectionViewTableLayout *)self _shouldDisplayExtraSeparatorsAtOffset:&v84])
      {
        double v61 = floor(v79 * 1.5);
        if (CGRectGetMaxY(*MEMORY[0x1E4F1DB28]) < v61)
        {
          uint64_t v62 = 0;
          do
          {
            uint64_t v63 = v62 + 1;
            v64 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathWithIndex:");
            [(UICollectionViewTableLayout *)self _extraSeparatorFrameForIndexPath:v64 offset:v84];
            double v66 = v65;
            double v68 = v67;
            double v70 = v69;
            double v72 = v71;
            v73 = [(UICollectionViewTableLayout *)self _layoutAttributesForSeparatorWithIndexPath:v64];
            objc_msgSend(v73, "setFrame:", v66, v68, v70, v72);
            [v4 addObject:v73];

            v100.origin.double x = v66;
            v100.origin.double y = v68;
            v100.size.double width = v70;
            v100.size.double height = v72;
            CGFloat MaxY = CGRectGetMaxY(v100);
            uint64_t v62 = v63;
          }
          while (MaxY < v61);
        }
      }
    }
  }
  return v4;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UICollectionViewTableLayout *)self _layoutAttributesForCellWithIndexPath:v4];
  rowData = self->_rowData;
  uint64_t v7 = [v4 row];
  uint64_t v8 = [v4 section];

  double v12 = -[UITableViewRowData rectForRow:inSection:heightCanBeGuessed:]((uint64_t)rowData, v7, v8, 0);
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  if (fabs(self->_memoizedScale) >= 2.22044605e-16) {
    double memoizedScale = self->_memoizedScale;
  }
  else {
    double memoizedScale = 1.0;
  }
  double v17 = v12;
  double v18 = round(CGRectGetMinX(*(CGRect *)(&v9 - 1)) * memoizedScale) / memoizedScale;
  v23.origin.double x = v12;
  v23.origin.double y = v13;
  v23.size.double width = v14;
  v23.size.double height = v15;
  double v19 = round(CGRectGetMinY(v23) * memoizedScale) / memoizedScale;
  v24.origin.double x = v12;
  v24.origin.double y = v13;
  v24.size.double width = v14;
  v24.size.double height = v15;
  double v20 = round(memoizedScale * CGRectGetWidth(v24)) / memoizedScale;
  v25.origin.double x = v12;
  v25.origin.double y = v13;
  v25.size.double width = v14;
  v25.size.double height = v15;
  objc_msgSend(v5, "setFrame:", v18, v19, v20, round(memoizedScale * CGRectGetHeight(v25)) / memoizedScale);
  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToString:@"UICollectionElementKindSectionHeader"] & 1) != 0
    || [v6 isEqualToString:@"UICollectionElementKindSectionFooter"])
  {
    uint64_t v8 = -[UICollectionViewTableLayout _layoutAttributesForSectionElementKind:atSection:](self, "_layoutAttributesForSectionElementKind:atSection:", v6, [v7 section]);
    if (v8)
    {
      unsigned __int8 v11 = 0;
      uint64_t v9 = [v7 section];
      [(UICollectionViewTableLayout *)self _visibleRect];
      -[UICollectionViewTableLayout _frameForSectionElementKind:atSection:visibleRect:floating:canGuess:](self, "_frameForSectionElementKind:atSection:visibleRect:floating:canGuess:", v6, v9, &v11, 0);
      objc_msgSend(v8, "setFrame:");
      [v8 setFloating:v11];
    }
  }
  else if (([v6 isEqualToString:@"UICollectionElementKindGlobalHeader"] & 1) != 0 {
         || [v6 isEqualToString:@"UICollectionElementKindGlobalFooter"])
  }
  {
    uint64_t v8 = [(UICollectionViewTableLayout *)self _layoutAttributesForViewElementKind:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  if ([a3 isEqualToString:@"UICollectionElementKindSeparator"])
  {
    id v7 = [(UICollectionViewTableLayout *)self _layoutAttributesForSeparatorWithIndexPath:v6];
    double v9 = 0.0;
    if ([(UICollectionViewTableLayout *)self _shouldDisplayExtraSeparatorsAtOffset:&v9])
    {
      [(UICollectionViewTableLayout *)self _extraSeparatorFrameForIndexPath:v6 offset:v9];
      objc_msgSend(v7, "setFrame:");
    }
    else
    {
      [v7 setAlpha:0.0];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_setShowsAdditionalSeparators:(BOOL)a3
{
  self->_showsAdditionalSeparators = a3;
  [(UICollectionViewLayout *)self invalidateLayout];
}

- (BOOL)_shouldDrawThickSeparators
{
  int v2 = dyld_program_sdk_at_least();
  if (v2)
  {
    id v3 = [(id)UIApp preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);

    LOBYTE(v2) = IsAccessibilityCategory;
  }
  return v2;
}

- (BOOL)_shouldApplyReadableWidthInsets
{
  BOOL v3 = [(UICollectionViewTableLayout *)self cellLayoutMarginsFollowReadableWidth];
  if (v3)
  {
    id v4 = [(UICollectionViewLayout *)self collectionView];
    char v5 = [v4 _safeAreaWidthExceedsReadableWidth];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (CGRect)_extraSeparatorFrameForIndexPath:(id)a3 offset:(double)a4
{
  rowData = self->_rowData;
  id v6 = a3;
  double v7 = _UITableRowHeightForExtraSeparators(self, rowData, 0.0);
  unint64_t v8 = [v6 indexAtPosition:0];

  double v9 = [(UICollectionViewLayout *)self collectionView];
  [v9 bounds];
  CGFloat v48 = v11;
  CGFloat v49 = v10;
  CGFloat v46 = v13;
  CGFloat v47 = v12;

  CGFloat v14 = [(UICollectionViewLayout *)self collectionView];
  int v15 = [v14 _shouldReverseLayoutDirection];

  [(UICollectionViewTableLayout *)self _indexBarExtentFromEdge];
  double v17 = v16;
  double v18 = [(UICollectionViewLayout *)self collectionView];
  [v18 directionalLayoutMargins];
  uint64_t v44 = v19;
  double v21 = v20;

  double v22 = 1.0;
  if (![(UICollectionViewTableLayout *)self _shouldDrawThickSeparators])
  {
    CGRect v23 = [(UICollectionViewLayout *)self collectionView];
    [v23 _currentScreenScale];
    double v22 = 1.0 / v24;
  }
  double left = self->_separatorInset.left;
  double right = self->_separatorInset.right;
  double v27 = [(UICollectionViewTableLayout *)self _constants];
  [v27 defaultMarginWidthForTableView:self];
  double v29 = v28;

  BOOL v30 = [(UICollectionViewTableLayout *)self _shouldApplyReadableWidthInsets];
  BOOL v31 = [(UICollectionViewTableLayout *)self separatorInsetIsRelativeToCellEdges];
  BOOL v32 = v31;
  if (left != -1.0)
  {
    double v29 = left;
    if (!v31)
    {
      int v33 = dyld_program_sdk_at_least();
      double v34 = -0.0;
      if (v30 | v33) {
        double v34 = v45;
      }
      double v29 = left + v34;
    }
  }
  double v35 = v17 + right;
  double v36 = fmax(v21, v17) + right;
  if (v30) {
    double v35 = v36;
  }
  if (v32) {
    double v35 = right;
  }
  double v37 = fmax(v17, v21);
  if (!v30) {
    double v37 = v17;
  }
  if (right == -1.0) {
    double v38 = v37;
  }
  else {
    double v38 = v35;
  }
  v51.origin.double y = v48;
  v51.origin.double x = v49;
  v51.size.double height = v46;
  v51.size.double width = v47;
  CGFloat Width = CGRectGetWidth(v51);
  double v40 = v7 + v7 * (double)v8 + a4 - v22;
  double v41 = Width - (v29 + v38);
  if (v15) {
    double v42 = v38;
  }
  else {
    double v42 = v29;
  }
  double v43 = v22;
  result.size.double height = v43;
  result.size.double width = v41;
  result.origin.double y = v40;
  result.origin.double x = v42;
  return result;
}

- (BOOL)_shouldDisplayExtraSeparatorsAtOffset:(double *)a3
{
  if (self->_showsAdditionalSeparators)
  {
    uint64_t v5 = (uint64_t)-[UITableViewRowData numberOfRows]((uint64_t)self->_rowData);
    if (v5 < 1)
    {
      uint64_t v7 = 0;
    }
    else
    {
      id v6 = -[UITableViewRowData indexPathForRowAtGlobalRow:](&self->_rowData->super.isa, v5 - 1);
      uint64_t v7 = [v6 section];
    }
    rowData = self->_rowData;
    if (rowData) {
      int64_t numSections = rowData->_numSections;
    }
    else {
      int64_t numSections = 0;
    }
    if (v7 >= numSections)
    {
LABEL_11:
      v12.origin.double x = -[UITableViewRowData rectForTableFooterView]((uint64_t)rowData);
      *a3 = CGRectGetMaxY(v12);
      return 1;
    }
    while (1)
    {
      v11.origin.double x = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:]((uint64_t)self->_rowData, v7, 1);
      if (CGRectGetHeight(v11) > 0.0) {
        break;
      }
      if (numSections == ++v7)
      {
        rowData = self->_rowData;
        goto LABEL_11;
      }
    }
  }
  return 0;
}

- (void)setSeparatorInsetIsRelativeToCellEdges:(BOOL)a3
{
  if (self->_separatorInsetIsRelativeToCellEdges != a3)
  {
    self->_separatorInsetIsRelativeToCellEdges = a3;
    [(UICollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setInsetsContentViewsToSafeArea:(BOOL)a3
{
  if (self->_insetsContentViewsToSafeArea != a3)
  {
    self->_insetsContentViewsToSafeArea = a3;
    [(UICollectionViewLayout *)self invalidateLayout];
  }
}

- (CGRect)_visibleRect
{
  BOOL v3 = [(UICollectionViewLayout *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(UICollectionViewTableLayout *)self _contentInset];
  double v13 = v5 + v12;
  double v15 = v7 + v14;
  double v17 = v9 - (v12 + v16);
  double v19 = v11 - (v14 + v18);

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UICollectionViewTableLayout;
  [(UICollectionViewLayout *)&v20 prepareForCollectionViewUpdates:v4];
  double v5 = [MEMORY[0x1E4F1CA48] array];
  [(UICollectionViewTableLayout *)self setDeleteIndexPaths:v5];

  double v6 = [MEMORY[0x1E4F1CA48] array];
  [(UICollectionViewTableLayout *)self setInsertIndexPaths:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "updateAction", (void)v16) == 1)
        {
          double v13 = [(UICollectionViewTableLayout *)self deleteIndexPaths];
          uint64_t v14 = [v12 indexPathBeforeUpdate];
        }
        else
        {
          if ([v12 updateAction]) {
            continue;
          }
          double v13 = [(UICollectionViewTableLayout *)self insertIndexPaths];
          uint64_t v14 = [v12 indexPathAfterUpdate];
        }
        double v15 = (void *)v14;
        [v13 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v9);
  }

  if ([v7 count]) {
    [(NSMutableArray *)self->_indexPathCache removeAllObjects];
  }
}

- (void)finalizeCollectionViewUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewTableLayout;
  [(UICollectionViewLayout *)&v3 finalizeCollectionViewUpdates];
  [(UICollectionViewTableLayout *)self setDeleteIndexPaths:0];
  [(UICollectionViewTableLayout *)self setInsertIndexPaths:0];
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  objc_super v3 = self;
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewTableLayout;
  id v4 = a3;
  double v5 = [(UICollectionViewLayout *)&v8 finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
  double v6 = objc_msgSend(v5, "copy", v8.receiver, v8.super_class);

  LODWORD(v3) = [(NSIndexPath *)v3->_deletedIndexPath isEqual:v4];
  if (v3) {
    [v6 setAlpha:1.0];
  }
  return v6;
}

- (CGSize)collectionViewContentSize
{
  objc_super v3 = [(UICollectionViewLayout *)self collectionView];
  [v3 bounds];
  double v5 = v4;

  double v6 = -[UITableViewRowData heightForTable]((uint64_t)self->_rowData);
  double v7 = v5;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (UIEdgeInsets)_preferredLayoutMargins
{
  objc_super v3 = [(UICollectionViewTableLayout *)self _constants];
  [v3 defaultLayoutMarginsForTableView:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.double right = v15;
  result.CGFloat bottom = v14;
  result.double left = v13;
  result.CGFloat top = v12;
  return result;
}

- (void)setSeparatorInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_separatorInset.left
    || a3.top != self->_separatorInset.top
    || a3.right != self->_separatorInset.right
    || a3.bottom != self->_separatorInset.bottom)
  {
    self->_separatorInset = a3;
    [(UICollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setSeparatorColor:(id)a3
{
  double v6 = (UIColor *)a3;
  p_separatorColor = &self->_separatorColor;
  if (self->_separatorColor != v6)
  {
    double v10 = v6;
    objc_storeStrong((id *)&self->_separatorColor, a3);
    double v8 = [(UICollectionViewLayout *)self collectionView];
    if (v8)
    {
      objc_super v3 = [(UICollectionViewLayout *)self collectionView];
      double v9 = [v3 _accessibilityHigherContrastTintColorForColor:*p_separatorColor];
    }
    else
    {
      double v9 = *p_separatorColor;
    }
    objc_storeStrong((id *)&self->_darkenedSeparatorColor, v9);
    if (v8)
    {
    }
    [(UICollectionViewTableLayout *)self _separatorColorChanged];
    double v6 = v10;
  }
}

- (UIColor)separatorColor
{
  int v3 = _AXDarkenSystemColors();
  uint64_t v4 = 15;
  if (!v3) {
    uint64_t v4 = 14;
  }
  double v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___UICollectionViewTableLayout__separatorInset[v4]);
  return (UIColor *)v5;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  if (self->_separatorStyle != a3)
  {
    self->_separatorStyle = a3;
    [(UICollectionViewLayout *)self invalidateLayout];
  }
}

- (UICollectionViewDelegateTableLayout)_delegateActual
{
  int v2 = [(UICollectionViewLayout *)self collectionView];
  int v3 = [v2 _delegateActual];

  return (UICollectionViewDelegateTableLayout *)v3;
}

- (UICollectionViewDelegateTableLayout)_delegateProxy
{
  int v2 = [(UICollectionViewLayout *)self collectionView];
  int v3 = [v2 _delegateProxy];

  return (UICollectionViewDelegateTableLayout *)v3;
}

- (UICollectionViewDataSourceTableLayout)_dataSourceActual
{
  int v2 = [(UICollectionViewLayout *)self collectionView];
  int v3 = [v2 _dataSourceActual];

  return (UICollectionViewDataSourceTableLayout *)v3;
}

- (int64_t)_accessoryTypeForCell:(id)a3 forRowAtIndexPath:(id)a4
{
  if (a4) {
    return [a3 accessoryType];
  }
  else {
    return 0;
  }
}

- (BOOL)_canReorderRowAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(UICollectionViewLayout *)self collectionView];
  char v6 = [v5 _canReorderItemAtIndexPath:v4];

  return v6;
}

- (BOOL)_shouldIndentWhileEditingForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(UICollectionViewTableLayout *)self _delegateActual];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      double v7 = [(UICollectionViewTableLayout *)self _delegateProxy];
      double v8 = [(UICollectionViewLayout *)self collectionView];
      char v9 = [v7 collectionView:v8 tableLayout:self shouldIndentWhileEditingRowAtIndexPath:v4];
    }
    else
    {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (int64_t)_indentationLevelForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(UICollectionViewTableLayout *)self _delegateProxy];
    double v8 = [(UICollectionViewLayout *)self collectionView];
    int64_t v9 = [v7 collectionView:v8 tableLayout:self indentationLevelForRowAtIndexPath:v4];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (int64_t)_editingStyleForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(UICollectionViewTableLayout *)self _delegateActual];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      double v7 = [(UICollectionViewTableLayout *)self _delegateProxy];
      double v8 = [(UICollectionViewLayout *)self collectionView];
      int64_t v9 = [v7 collectionView:v8 tableLayout:self editingStyleForRowAtIndexPath:v4];
    }
    else
    {
      int64_t v9 = 1;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_shouldDrawTopSeparatorDueToMergedBarForSectionAtIndex:(int64_t)a3
{
  if ([(UICollectionViewTableLayout *)self _tableStyle]) {
    return 0;
  }
  double v5 = [(UICollectionViewLayout *)self collectionView];
  int v6 = [v5 _shouldAdjustLayoutToDrawTopSeparator];

  if (!v6) {
    return 0;
  }
  double v7 = [(UICollectionViewTableLayout *)self _tableHeaderView];

  if (v7 || !-[UITableViewRowData numberOfRows]((uint64_t)self->_rowData)) {
    return 0;
  }
  double v10 = -[UITableViewRowData indexPathForRowAtGlobalRow:](&self->_rowData->super.isa, 0);
  double v11 = v10;
  if (v10 && [v10 section] == a3)
  {
    if (a3 < 0)
    {
      char v8 = 1;
    }
    else
    {
      uint64_t v12 = 0;
      do
      {
        BOOL v13 = [(UICollectionViewTableLayout *)self _shouldHaveHeaderViewForSection:v12];
        if (v13) {
          break;
        }
      }
      while (a3 != v12++);
      char v8 = !v13;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldDrawSeparatorAtTop:(BOOL)a3 ofSection:(int64_t)a4
{
  if (a3)
  {
    return [(UICollectionViewTableLayout *)self _shouldDrawTopSeparatorDueToMergedBarForSectionAtIndex:a4];
  }
  else
  {
    int v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", -[UICollectionViewTableLayout _numberOfRowsInSection:](self, "_numberOfRowsInSection:", a4) - 1, a4);
    BOOL v7 = ![(UICollectionViewTableLayout *)self _hasHeaderFooterBelowRowAtIndexPath:v6];

    return v7;
  }
}

- (BOOL)_hasHeaderFooterBelowRowAtIndexPath:(id)a3
{
  uint64_t v5 = [a3 section];
  int64_t v6 = [(UICollectionViewTableLayout *)self _numberOfSections];
  if (v5 >= v6) {
    return 0;
  }
  int64_t v7 = v6;
  uint64_t v8 = [a3 row];
  if (v8 != [(UICollectionViewTableLayout *)self _numberOfRowsInSection:v5] - 1) {
    return 0;
  }
  BOOL v9 = 1;
  v13.origin.double x = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:]((uint64_t)self->_rowData, v5, 1);
  if (CGRectGetHeight(v13) <= 0.0)
  {
    uint64_t v10 = v5 + 1;
    do
    {
      if (v7 == v10) {
        break;
      }
      v14.origin.double x = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:]((uint64_t)self->_rowData, v5, 1);
      if (CGRectGetHeight(v14) > 0.0) {
        return v9;
      }
      uint64_t v11 = [(UICollectionViewTableLayout *)self _numberOfRowsInSection:v10++];
    }
    while (v11 < 1);
    return 0;
  }
  return v9;
}

- (CGRect)_frameForSectionElementKind:(id)a3 atSection:(int64_t)a4 visibleRect:(CGRect)a5 floating:(BOOL *)a6 canGuess:(BOOL)a7
{
  double height = a5.size.height;
  CGFloat width = a5.size.width;
  double y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v15 = a3;
  int v16 = [v15 isEqualToString:@"UICollectionElementKindSectionHeader"];
  rowData = self->_rowData;
  if (v16)
  {
    double v18 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:]((uint64_t)rowData, a4, a7);
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    BOOL v25 = [(NSSet *)self->_floatingElementKinds containsObject:v15];

    if (!v25) {
      goto LABEL_10;
    }
    double v26 = -[UITableViewRowData floatingRectForHeaderInSection:visibleRect:heightCanBeGuessed:outIsFloating:]((uint64_t)self->_rowData, a4, a7, 0, x, y, width, height);
  }
  else
  {
    double v18 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:]((uint64_t)rowData, a4, a7);
    CGFloat v20 = v30;
    CGFloat v22 = v31;
    CGFloat v24 = v32;
    BOOL v33 = [(NSSet *)self->_floatingElementKinds containsObject:v15];

    if (!v33) {
      goto LABEL_10;
    }
    double v26 = -[UITableViewRowData floatingRectForFooterInSection:visibleRect:heightCanBeGuessed:outIsFloating:]((uint64_t)self->_rowData, a4, a7, 0, x, y, width, height);
  }
  double v34 = v26;
  double v35 = v27;
  double v36 = v28;
  double v37 = v29;
  v43.origin.CGFloat x = v18;
  v43.origin.double y = v20;
  v43.size.CGFloat width = v22;
  v43.size.double height = v24;
  if (!CGRectEqualToRect(*(CGRect *)&v26, v43))
  {
    if (a6) {
      *a6 = 1;
    }
    CGFloat v24 = v37;
    CGFloat v22 = v36;
    CGFloat v20 = v35;
    double v18 = v34;
  }
LABEL_10:
  double v38 = v18;
  double v39 = v20;
  double v40 = v22;
  double v41 = v24;
  result.size.double height = v41;
  result.size.CGFloat width = v40;
  result.origin.double y = v39;
  result.origin.CGFloat x = v38;
  return result;
}

- (_NSRange)_sectionRangeForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = [(UICollectionViewTableLayout *)self _numberOfSections];
  if (v8 < 1)
  {
    uint64_t v18 = 0;
    uint64_t v15 = 0;
  }
  else
  {
    unint64_t v9 = v8;
    uint64_t v10 = -[UITableViewRowData globalRowsInRect:canGuess:](&self->_rowData->super.isa, 1, x, y, width, height);
    uint64_t v12 = v11;
    CGRect v13 = -[UITableViewRowData indexPathForRowAtGlobalRow:](&self->_rowData->super.isa, v10);
    CGRect v14 = -[UITableViewRowData indexPathForRowAtGlobalRow:](&self->_rowData->super.isa, v12 + v10 - 1);
    uint64_t v15 = [v13 section];
    uint64_t v16 = [v14 section];
    uint64_t v17 = [v13 section];
    if (v16 - v17 + 1 + v15 >= v9) {
      uint64_t v18 = v16 - v17 + 1;
    }
    else {
      uint64_t v18 = v16 - v17 + 2;
    }
  }
  NSUInteger v19 = v15;
  NSUInteger v20 = v18;
  result.length = v20;
  result.location = v19;
  return result;
}

- (double)_defaultCellHeight
{
  [(UITableConstants *)self->_constants defaultRowHeightForTableView:self];
  return result;
}

- (BOOL)_needsRecomputeOfPreferredAttributesForVisibleEstimatedItemsDuringUpdate
{
  return 0;
}

- (BOOL)_wantsSwipes
{
  return ![(UICollectionViewTableLayout *)self isEditing];
}

- (id)swipeActionController:(id)a3 leadingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(UICollectionViewTableLayout *)self _delegateProxy];
    unint64_t v9 = [(UICollectionViewLayout *)self collectionView];
    uint64_t v10 = [v8 collectionView:v9 tableLayout:self leadingSwipeActionsConfigurationForRowAtIndexPath:v5];
    goto LABEL_6;
  }
  uint64_t v11 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    CGRect v13 = [(UICollectionViewTableLayout *)self _delegateProxy];
    CGRect v14 = [(UICollectionViewLayout *)self collectionView];
    uint64_t v8 = [v13 collectionView:v14 tableLayout:self leadingSwipeActionsForRowAtIndexPath:v5];

    if (!v8)
    {
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    uint64_t v10 = +[UISwipeActionsConfiguration configurationWithActions:v8];
    unint64_t v9 = [v8 firstObject];
    objc_msgSend(v10, "setPerformsFirstActionWithFullSwipe:", objc_msgSend(v9, "canBeTriggeredBySwipe"));
LABEL_6:

LABEL_7:
    goto LABEL_9;
  }
  uint64_t v10 = 0;
LABEL_9:

  return v10;
}

- (id)swipeActionController:(id)a3 trailingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int64_t v6 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(UICollectionViewTableLayout *)self _delegateProxy];
    unint64_t v9 = [(UICollectionViewLayout *)self collectionView];
    uint64_t v10 = [v8 collectionView:v9 tableLayout:self trailingSwipeActionsConfigurationForRowAtIndexPath:v5];
    goto LABEL_6;
  }
  uint64_t v11 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    CGRect v13 = [(UICollectionViewTableLayout *)self _delegateProxy];
    CGRect v14 = [(UICollectionViewLayout *)self collectionView];
    uint64_t v8 = [v13 collectionView:v14 tableLayout:self trailingSwipeActionsForRowAtIndexPath:v5];

    if (v8)
    {
      uint64_t v10 = +[UISwipeActionsConfiguration configurationWithActions:v8];
      unint64_t v9 = [v8 firstObject];
      objc_msgSend(v10, "setPerformsFirstActionWithFullSwipe:", objc_msgSend(v9, "canBeTriggeredBySwipe"));
LABEL_6:

      if (v10) {
        goto LABEL_10;
      }
    }
  }
  if ([(UICollectionViewTableLayout *)self _editingStyleForRowAtIndexPath:v5] == 1)
  {
    uint64_t v15 = [(UICollectionViewTableLayout *)self contextualActionForDeletingRowAtIndexPath:v5];
    v18[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    uint64_t v10 = +[UISwipeActionsConfiguration configurationWithActions:v16];
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_10:

  return v10;
}

- (int64_t)layoutDirectionForSwipeActionController:(id)a3
{
  int v4 = dyld_program_sdk_at_least();
  id v5 = [(UICollectionViewLayout *)self collectionView];
  int64_t v6 = v5;
  if (v4)
  {
    int64_t v7 = [v5 effectiveUserInterfaceLayoutDirection];
  }
  else
  {
    uint64_t v8 = [v5 traitCollection];
    int64_t v7 = [v8 layoutDirection];
  }
  return v7;
}

- (id)swipeActionController:(id)a3 indexPathForTouchLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  int64_t v6 = [(UICollectionViewLayout *)self collectionView];
  int64_t v7 = objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);

  return v7;
}

- (id)swipeActionController:(id)a3 viewForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(UICollectionViewLayout *)self collectionView];
  int64_t v7 = [v6 cellForItemAtIndexPath:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (void)swipeActionController:(id)a3 willPerformAction:(id)a4 atIndexPath:(id)a5
{
  id v9 = a5;
  if ([a4 style] == 1)
  {
    int64_t v7 = (NSIndexPath *)[v9 copy];
    deletedIndexPath = self->_deletedIndexPath;
    self->_deletedIndexPath = v7;
  }
}

- (void)swipeActionController:(id)a3 didCompleteAction:(id)a4 cancelled:(BOOL)a5 atIndexPath:(id)a6
{
  deletedIndexPath = self->_deletedIndexPath;
  self->_deletedIndexPath = 0;
}

- (void)swipeActionController:(id)a3 animateView:(id)a4 actionsView:(id)a5 forDestructiveAction:(id)a6 atIndexPath:(id)a7 withSwipeInfo:(id *)a8 completion:(id)a9
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  if ([v17 row] >= 1)
  {
    NSUInteger v19 = [(UICollectionViewLayout *)self collectionView];
    NSUInteger v20 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v17, "item") - 1, objc_msgSend(v17, "section"));
    double v21 = [v19 cellForItemAtIndexPath:v20];

    CGFloat v22 = [(UICollectionViewLayout *)self collectionView];
    [v22 bringSubviewToFront:v21];
  }
  double v23 = [v14 tableViewCell];
  CGFloat v24 = [v34 currentSwipeOccurrence];
  BOOL v25 = [v16 backgroundColor];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __135__UICollectionViewTableLayout_swipeActionController_animateView_actionsView_forDestructiveAction_atIndexPath_withSwipeInfo_completion___block_invoke;
  v39[3] = &unk_1E52D9FE8;
  id v26 = v18;
  id v40 = v26;
  double v27 = _UITableAnimateSwipeDeletion(self, v17, v23, v15, v24, v25, v39, 0);

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v28 = v27;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        [v14 _trackAnimator:*(void *)(*((void *)&v35 + 1) + 8 * v32++)];
      }
      while (v30 != v32);
      uint64_t v30 = [v28 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v30);
  }

  BOOL v33 = [(UICollectionViewLayout *)self collectionView];
  [v33 sendSubviewToBack:v14];
}

uint64_t __135__UICollectionViewTableLayout_swipeActionController_animateView_actionsView_forDestructiveAction_atIndexPath_withSwipeInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)swipeActionController:(id)a3 mayBeginSwipeForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if (![(UICollectionViewTableLayout *)self _wantsSwipes]) {
    goto LABEL_4;
  }
  int64_t v6 = [(UICollectionViewLayout *)self collectionView];
  int v7 = [v6 _canEditItemAtIndexPath:v5];

  if (!v7) {
    goto LABEL_4;
  }
  id v8 = [(UICollectionViewLayout *)self collectionView];
  id v9 = [v8 _reorderedItems];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
    CGRect v13 = [(UICollectionViewTableLayout *)self _delegateActual];
    if (objc_opt_respondsToSelector())
    {
      char v11 = 1;
    }
    else
    {
      id v14 = [(UICollectionViewTableLayout *)self _delegateActual];
      if (objc_opt_respondsToSelector())
      {
        char v11 = 1;
      }
      else
      {
        id v15 = [(UICollectionViewTableLayout *)self _delegateActual];
        if (objc_opt_respondsToSelector())
        {
          char v11 = 1;
        }
        else
        {
          id v16 = [(UICollectionViewTableLayout *)self _delegateActual];
          if (objc_opt_respondsToSelector())
          {
            char v11 = 1;
          }
          else
          {
            id v17 = [(UICollectionViewTableLayout *)self _delegateActual];
            char v11 = objc_opt_respondsToSelector();
          }
        }
      }
    }
  }
  else
  {
LABEL_4:
    char v11 = 0;
  }

  return v11 & 1;
}

- (void)swipeActionController:(id)a3 willBeginSwipeForItemAtIndexPath:(id)a4
{
  id v9 = a4;
  id v5 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int v7 = [(UICollectionViewTableLayout *)self _delegateProxy];
    id v8 = [(UICollectionViewLayout *)self collectionView];
    [v7 collectionView:v8 tableLayout:self willBeginEditingRowAtIndexPath:v9];
  }
}

- (void)swipeActionController:(id)a3 didEndSwipeForItemAtIndexPath:(id)a4
{
  id v9 = a4;
  id v5 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int v7 = [(UICollectionViewTableLayout *)self _delegateProxy];
    id v8 = [(UICollectionViewLayout *)self collectionView];
    [v7 collectionView:v8 tableLayout:self didEndEditingRowAtIndexPath:v9];
  }
}

- (void)resetSwipedRowWithCompletion:(id)a3
{
}

- (id)swipeActionForDeletingRowAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = _UINSLocalizedStringWithDefaultValue(@"Delete", @"Delete");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__UICollectionViewTableLayout_swipeActionForDeletingRowAtIndexPath___block_invoke;
  v9[3] = &unk_1E52E4D18;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  int v7 = +[UISwipeAction swipeActionWithStyle:1 title:v5 handler:v9];

  return v7;
}

void __68__UICollectionViewTableLayout_swipeActionForDeletingRowAtIndexPath___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _delegateActual];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) _delegateProxy];
    id v4 = [*(id *)(a1 + 32) collectionView];
    [v5 collectionView:v4 tableLayout:*(void *)(a1 + 32) commitEditingStyle:1 forRowAtIndexPath:*(void *)(a1 + 40)];
  }
}

- (id)contextualActionForDeletingRowAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = _UINSLocalizedStringWithDefaultValue(@"Delete", @"Delete");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__UICollectionViewTableLayout_contextualActionForDeletingRowAtIndexPath___block_invoke;
  v9[3] = &unk_1E52E4D40;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  int v7 = +[UIContextualAction contextualActionWithStyle:1 title:v5 handler:v9];

  return v7;
}

void __73__UICollectionViewTableLayout_contextualActionForDeletingRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  id v5 = [*(id *)(a1 + 32) _delegateActual];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int v7 = [*(id *)(a1 + 32) _delegateProxy];
    id v8 = [*(id *)(a1 + 32) collectionView];
    [v7 collectionView:v8 tableLayout:*(void *)(a1 + 32) commitEditingStyle:1 forRowAtIndexPath:*(void *)(a1 + 40)];
  }
  v9[2](v9, v6 & 1);
}

- (BOOL)canBeEdited
{
  return 1;
}

- (BOOL)isEditing
{
  int v2 = [(UICollectionViewLayout *)self collectionView];
  char v3 = [v2 isEditing];

  return v3;
}

- (void)setEditing:(BOOL)a3
{
  [(UICollectionViewTableLayout *)self resetSwipedRowWithCompletion:0];
  [(UICollectionViewLayout *)self invalidateLayout];
}

- (BOOL)allowsMultipleSelection
{
  int v2 = [(UICollectionViewLayout *)self collectionView];
  char v3 = [v2 allowsMultipleSelection];

  return v3;
}

- (BOOL)allowsMultipleSelectionDuringEditing
{
  int v2 = [(UICollectionViewLayout *)self collectionView];
  char v3 = [v2 allowsMultipleSelectionDuringEditing];

  return v3;
}

- (UIEdgeInsets)_rawSeparatorInset
{
  double top = self->_separatorInset.top;
  double left = self->_separatorInset.left;
  double bottom = self->_separatorInset.bottom;
  double right = self->_separatorInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)_sectionContentInset
{
  char v3 = [(UICollectionViewLayout *)self collectionView];
  double top = self->_sectionContentInset.top;
  double left = self->_sectionContentInset.left;
  double bottom = self->_sectionContentInset.bottom;
  double right = self->_sectionContentInset.right;
  [v3 safeAreaInsets];
  if (top == -1.0) {
    double top = 0.0;
  }
  double v10 = left + v8;
  if (left == -1.0) {
    double v11 = 0.0;
  }
  else {
    double v11 = v10;
  }
  if (bottom == -1.0) {
    double bottom = 0.0;
  }
  if (right == -1.0) {
    double v12 = 0.0;
  }
  else {
    double v12 = right + v9;
  }
  [(UICollectionViewTableLayout *)self _tableContentInset];
  double v14 = top + v13;
  double v16 = v15 + v11;
  double v18 = bottom + v17;
  double v20 = v19 + v12;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.double right = v24;
  result.double bottom = v23;
  result.double left = v22;
  result.double top = v21;
  return result;
}

- (UIEdgeInsets)_rawSectionContentInset
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

- (BOOL)_sectionContentInsetFollowsLayoutMargins
{
  return 0;
}

- (BOOL)_supplementarySectionHeadersHugContent
{
  return 0;
}

- (BOOL)_supplementariesFollowSectionContentInsets
{
  return 0;
}

- (double)_sectionCornerRadius
{
  return 0.0;
}

- (double)_indexBarExtentFromEdge
{
  char v3 = [(UICollectionViewLayout *)self collectionView];
  int v4 = [v3 _shouldReverseLayoutDirection];

  id v5 = [(UICollectionViewLayout *)self collectionView];
  [v5 accessoryInsets];
  double v7 = v6;
  double v9 = v8;

  if (v4) {
    return v7;
  }
  else {
    return v9;
  }
}

- (UIColor)backgroundColor
{
  int v2 = [(UICollectionViewLayout *)self collectionView];
  char v3 = [v2 backgroundColor];

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(UICollectionViewLayout *)self collectionView];
  [v5 setBackgroundColor:v4];
}

- (int64_t)_tableStyle
{
  return 0;
}

- (int64_t)_numberOfSections
{
  int v2 = [(UICollectionViewLayout *)self collectionView];
  int64_t v3 = [v2 numberOfSections];

  return v3;
}

- (int64_t)_numberOfRowsInSection:(int64_t)a3
{
  id v4 = [(UICollectionViewLayout *)self collectionView];
  int64_t v5 = [v4 numberOfItemsInSection:a3];

  return v5;
}

- (double)_headerFooterLeadingMarginWidthIsHeader:(BOOL)a3 isFirstSection:(BOOL)a4
{
  if (dyld_program_sdk_at_least())
  {
    int64_t v5 = [(UICollectionViewLayout *)self collectionView];
    int v6 = [v5 _shouldReverseLayoutDirection];

    uint64_t v7 = 8;
    if (v6) {
      uint64_t v7 = 24;
    }
    double v8 = *(double *)((char *)&self->_sectionContentInset.top + v7);
    CGFloat left = self->_separatorInset.left;
    BOOL v10 = [(UICollectionViewTableLayout *)self separatorInsetIsRelativeToCellEdges];
    double v11 = [(UICollectionViewTableLayout *)self _constants];
    [v11 defaultMarginWidthForTableView:self];
    double v13 = v12;

    double v14 = [(UICollectionViewLayout *)self collectionView];
    [v14 directionalLayoutMargins];
    double v16 = v15;

    BOOL v17 = [(UICollectionViewTableLayout *)self _shouldApplyReadableWidthInsets];
    if (v8 <= 0.0)
    {
      char v23 = left == -1.0 || v10;
      if (left == -1.0) {
        double result = v13;
      }
      else {
        double result = left;
      }
      if ((v23 & 1) == 0)
      {
        BOOL v24 = v17;
        int v25 = dyld_program_sdk_at_least();
        double v26 = -0.0;
        if (v24 | v25) {
          double v26 = v16;
        }
        return left + v26;
      }
    }
    else
    {
      return v8 + v13;
    }
  }
  else
  {
    double v19 = self->_sectionContentInset.left;
    if (v19 == -1.0)
    {
      double v20 = [(UICollectionViewTableLayout *)self _constants];
      [v20 defaultMarginWidthForTableView:self];
      double v22 = v21;

      return v22;
    }
    else
    {
      [(UICollectionViewTableLayout *)self separatorInset];
      return v19 + v27;
    }
  }
  return result;
}

- (double)_headerFooterTrailingMarginWidth
{
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    return self->_sectionContentInset.right;
  }
  int64_t v3 = [(UICollectionViewLayout *)self collectionView];
  int v4 = [v3 _shouldReverseLayoutDirection];

  uint64_t v5 = 24;
  if (v4) {
    uint64_t v5 = 8;
  }
  double v6 = *(double *)((char *)&self->_sectionContentInset.top + v5);
  double right = self->_separatorInset.right;
  BOOL v8 = [(UICollectionViewTableLayout *)self separatorInsetIsRelativeToCellEdges];
  double v9 = [(UICollectionViewTableLayout *)self _constants];
  [v9 defaultTrailingCellMarginWidthForTableView:self];
  double v11 = v10;

  [(UICollectionViewTableLayout *)self _indexBarExtentFromEdge];
  double v13 = v12;
  double v14 = [(UICollectionViewLayout *)self collectionView];
  [v14 directionalLayoutMargins];
  double v16 = v15;

  BOOL v17 = [(UICollectionViewTableLayout *)self _shouldApplyReadableWidthInsets];
  if (v6 <= 0.0)
  {
    if (right == -1.0)
    {
      double v18 = fmax(v13, v16);
      if (v17) {
        double right = v18;
      }
      else {
        double right = v13;
      }
    }
    else if (!v8)
    {
      double v19 = right + fmax(v16, v13);
      if (v17) {
        double right = v19;
      }
      else {
        double right = right + v13;
      }
    }
    double v20 = -0.0;
    if (!v17) {
      double v20 = v11;
    }
    return v20 + right;
  }
  return v11;
}

- (double)_defaultSectionHeaderHeight
{
  [(UITableConstants *)self->_constants defaultSectionHeaderHeightForTableView:self];
  double v4 = v3;
  uint64_t v5 = [(UICollectionViewLayout *)self collectionView];
  [v5 _currentScreenScale];
  double v7 = UIPixelBoundaryOffset(1, v4, v6);

  return v7;
}

- (double)_defaultSectionFooterHeight
{
  [(UITableConstants *)self->_constants defaultSectionFooterHeightForTableView:self];
  double v4 = v3;
  uint64_t v5 = [(UICollectionViewLayout *)self collectionView];
  [v5 _currentScreenScale];
  double v7 = UIPixelBoundaryOffset(0, v4, v6);

  return v7;
}

- (BOOL)_sectionHeadersHugContent
{
  return 0;
}

- (double)_sidePadding
{
  return 0.0;
}

- (UIEdgeInsets)_contentInset
{
  int v2 = [(UICollectionViewLayout *)self collectionView];
  [v2 adjustedContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.double right = v14;
  result.double bottom = v13;
  result.CGFloat left = v12;
  result.double top = v11;
  return result;
}

- (UIEdgeInsets)_tableContentInset
{
  int v2 = [(UICollectionViewLayout *)self collectionView];
  [v2 accessoryInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.double right = v14;
  result.double bottom = v13;
  result.CGFloat left = v12;
  result.double top = v11;
  return result;
}

- (double)_paddingAboveFirstSectionHeader
{
  double v3 = [(UICollectionViewTableLayout *)self _constants];
  objc_msgSend(v3, "defaultPaddingAboveFirstSectionHeaderForTableStyle:", -[UICollectionViewTableLayout _tableStyle](self, "_tableStyle"));
  double v5 = v4;

  return v5;
}

- (double)_paddingAboveSectionHeaders
{
  double v3 = [(UICollectionViewTableLayout *)self _constants];
  objc_msgSend(v3, "defaultPaddingAboveSectionHeadersForTableStyle:", -[UICollectionViewTableLayout _tableStyle](self, "_tableStyle"));
  double v5 = v4;

  return v5;
}

- (double)_sectionHeaderToFirstRowPadding
{
  int v2 = [(UICollectionViewTableLayout *)self _constants];
  [v2 defaultPaddingBetweenHeaderAndRows];
  double v4 = v3;

  return v4;
}

- (double)_sectionFooterToLastRowPadding
{
  return 0.0;
}

- (int64_t)_headerFooterPinningBehavior
{
  double v3 = [(UICollectionViewTableLayout *)self _constants];
  int64_t v4 = objc_msgSend(v3, "defaultHeaderFooterPinningBehaviorForTableStyle:", -[UICollectionViewTableLayout _tableStyle](self, "_tableStyle"));

  return v4;
}

- (UIEdgeInsets)_cellSafeAreaInsets
{
  int v2 = [(UICollectionViewLayout *)self collectionView];
  [v2 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.double right = v14;
  result.double bottom = v13;
  result.CGFloat left = v12;
  result.double top = v11;
  return result;
}

- (BOOL)_isTableHeaderAutohiding
{
  return 0;
}

- (double)_heightForTableHeader
{
  double v3 = [(UICollectionViewTableLayout *)self _delegateActual];
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(UICollectionViewTableLayout *)self _delegateProxy];
    double v6 = [(UICollectionViewLayout *)self collectionView];
    [v5 collectionView:v6 heightForHeaderViewInTableLayout:self];
    double v4 = v7;
  }
  return v4;
}

- (double)_heightForTableFooter
{
  double v3 = [(UICollectionViewTableLayout *)self _delegateActual];
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(UICollectionViewTableLayout *)self _delegateProxy];
    double v6 = [(UICollectionViewLayout *)self collectionView];
    [v5 collectionView:v6 heightForFooterViewInTableLayout:self];
    double v4 = v7;
  }
  return v4;
}

- (BOOL)_providesRowHeights
{
  int v2 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_estimatesHeights
{
  if ([(UICollectionViewTableLayout *)self _estimatesRowHeights]
    || [(UICollectionViewTableLayout *)self _estimatesSectionHeaderHeights])
  {
    return 1;
  }
  return [(UICollectionViewTableLayout *)self _estimatesSectionFooterHeights];
}

- (BOOL)_estimatesRowHeights
{
  double estimatedRowHeight = self->_estimatedRowHeight;
  return estimatedRowHeight == -1.0 || estimatedRowHeight > 0.0;
}

- (BOOL)_estimatesSectionHeaderHeights
{
  double estimatedSectionHeaderHeight = self->_estimatedSectionHeaderHeight;
  return estimatedSectionHeaderHeight == -1.0 || estimatedSectionHeaderHeight > 0.0;
}

- (BOOL)_estimatesSectionFooterHeights
{
  double estimatedSectionFooterHeight = self->_estimatedSectionFooterHeight;
  return estimatedSectionFooterHeight == -1.0 || estimatedSectionFooterHeight > 0.0;
}

- (double)_heightForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  [(UICollectionViewTableLayout *)self _dataSourceHeightForRowAtIndexPath:v4];
  double Height = v5;
  if (v5 == -1.0)
  {
    if ([(UICollectionViewTableLayout *)self _estimatesRowHeights])
    {
      uint64_t v7 = [(UICollectionView *)self->super._collectionView cellForItemAtIndexPath:v4];
      double v8 = (void *)v7;
      if (!v7)
      {
        double v8 = [(UICollectionView *)self->super._collectionView _reusableViewWithoutAttributesForElementCategory:0 kind:0 indexPath:v4];
        objc_msgSend(v8, "setFrame:", -[UITableViewRowData rectForRow:inSection:heightCanBeGuessed:]((uint64_t)self->_rowData, objc_msgSend(v4, "row"), objc_msgSend(v4, "section"), 1));
      }
      double v9 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:v4];
      [(UIView *)self->super._collectionView bounds];
      objc_msgSend(v9, "setSize:", CGRectGetWidth(v13), 0.0);
      double v10 = [v8 preferredLayoutAttributesFittingAttributes:v9];
      [v10 frame];
      double Height = CGRectGetHeight(v14);

      if (!v7) {
        [(UICollectionView *)self->super._collectionView _reuseCell:v8];
      }
    }
    else
    {
      double Height = self->_rowHeight;
    }
    if (Height == -1.0)
    {
      [(UICollectionViewTableLayout *)self _defaultCellHeight];
      double Height = v11;
    }
  }

  return Height;
}

- (double)_heightForHeaderInSection:(int64_t)a3 useRowData:(BOOL)a4
{
  BOOL v4 = a4;
  -[UICollectionViewTableLayout _dataSourceHeightForHeaderInSection:](self, "_dataSourceHeightForHeaderInSection:");
  double Height = v8;
  double v10 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
  if (Height == -1.0)
  {
    if ([(UICollectionViewTableLayout *)self _estimatesSectionHeaderHeights] && v4)
    {
      uint64_t v11 = [(UICollectionView *)self->super._collectionView supplementaryViewForElementKind:@"UICollectionElementKindSectionHeader" atIndexPath:v10];
      double v12 = (void *)v11;
      if (!v11)
      {
        if ([(NSMutableSet *)self->_headerPreferredAttributesCache containsObject:v10])
        {
          BOOL v17 = [MEMORY[0x1E4F28B00] currentHandler];
          [v17 handleFailureInMethod:a2, self, @"UICollectionViewTableLayout.m", 1760, @"Asked for view at index path %@ but already have size cached!", v10 object file lineNumber description];
        }
        double v12 = [(UICollectionView *)self->super._collectionView _reusableViewWithoutAttributesForElementCategory:1 kind:@"UICollectionElementKindSectionHeader" indexPath:v10];
        objc_msgSend(v12, "setFrame:", -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:]((uint64_t)self->_rowData, a3, 1));
      }
      CGRect v13 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:@"UICollectionElementKindSectionHeader" withIndexPath:v10];
      [(UIView *)self->super._collectionView bounds];
      objc_msgSend(v13, "setSize:", CGRectGetWidth(v18), 0.0);
      CGRect v14 = [v12 preferredLayoutAttributesFittingAttributes:v13];
      [v14 frame];
      double Height = CGRectGetHeight(v19);

      if (!v11) {
        [(UICollectionView *)self->super._collectionView _reuseSupplementaryView:v12];
      }
    }
    else
    {
      double Height = self->_sectionHeaderHeight;
    }
    if (Height == -1.0)
    {
      [(UICollectionViewTableLayout *)self _defaultSectionHeaderHeight];
      double Height = v15;
    }
  }

  return Height;
}

- (double)_heightForHeaderInSection:(int64_t)a3
{
  [(UICollectionViewTableLayout *)self _heightForHeaderInSection:a3 useRowData:1];
  return result;
}

- (CGSize)_sizeForHeaderInSection:(int64_t)a3
{
  [(UICollectionViewTableLayout *)self _heightForHeaderInSection:a3];
  double v5 = v4;
  [(UIView *)self->super._collectionView bounds];
  double v7 = v6;
  double v8 = v5;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (double)_heightForFooterInSection:(int64_t)a3 useRowData:(BOOL)a4
{
  BOOL v4 = a4;
  -[UICollectionViewTableLayout _dataSourceHeightForFooterInSection:](self, "_dataSourceHeightForFooterInSection:");
  double Height = v8;
  double v10 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
  if (Height == -1.0)
  {
    if ([(UICollectionViewTableLayout *)self _estimatesSectionFooterHeights] && v4)
    {
      uint64_t v11 = [(UICollectionView *)self->super._collectionView supplementaryViewForElementKind:@"UICollectionElementKindSectionFooter" atIndexPath:v10];
      double v12 = (void *)v11;
      if (!v11)
      {
        if ([(NSMutableSet *)self->_footerPreferredAttributesCache containsObject:v10])
        {
          BOOL v17 = [MEMORY[0x1E4F28B00] currentHandler];
          [v17 handleFailureInMethod:a2, self, @"UICollectionViewTableLayout.m", 1809, @"Asked for view at index path %@ but already have size cached!", v10 object file lineNumber description];
        }
        double v12 = [(UICollectionView *)self->super._collectionView _reusableViewWithoutAttributesForElementCategory:1 kind:@"UICollectionElementKindSectionFooter" indexPath:v10];
        objc_msgSend(v12, "setFrame:", -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:]((uint64_t)self->_rowData, a3, 1));
      }
      CGRect v13 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:@"UICollectionElementKindSectionFooter" withIndexPath:v10];
      [(UIView *)self->super._collectionView bounds];
      objc_msgSend(v13, "setSize:", CGRectGetWidth(v18), 0.0);
      CGRect v14 = [v12 preferredLayoutAttributesFittingAttributes:v13];
      [v14 frame];
      double Height = CGRectGetHeight(v19);

      if (!v11) {
        [(UICollectionView *)self->super._collectionView _reuseSupplementaryView:v12];
      }
    }
    else
    {
      double Height = self->_sectionFooterHeight;
    }
    if (Height == -1.0)
    {
      [(UICollectionViewTableLayout *)self _defaultSectionFooterHeight];
      double Height = v15;
    }
  }

  return Height;
}

- (double)_heightForFooterInSection:(int64_t)a3
{
  [(UICollectionViewTableLayout *)self _heightForFooterInSection:a3 useRowData:1];
  return result;
}

- (double)_estimatedHeightForRowAtIndexPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double estimatedRowHeight = self->_estimatedRowHeight;
  double v7 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(UICollectionViewTableLayout *)self _delegateProxy];
    [v9 collectionView:self->super._collectionView tableLayout:self estimatedHeightForRowAtIndexPath:v5];
    double estimatedRowHeight = v10;

    int v11 = dyld_program_sdk_at_least();
    BOOL v12 = estimatedRowHeight < 0.0;
    if (estimatedRowHeight == -1.0) {
      BOOL v12 = 0;
    }
    if (v11)
    {
      if (v12)
      {
        CGRect v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2, self, @"UICollectionViewTableLayout.m", 1844, @"Invalid estimated row height (%g) provided by table delegate. Value must be at least 0.0, or UITableViewAutomaticDimension.", *(void *)&estimatedRowHeight object file lineNumber description];
      }
    }
    else if (v12)
    {
      BOOL v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_estimatedHeightForRowAtIndexPath____s_category) + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        double v19 = estimatedRowHeight;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Invalid estimated row height (%g) provided by table delegate. Value must be at least 0.0, or UITableViewAutomaticDimension.", buf, 0xCu);
      }
    }
  }
  else if (estimatedRowHeight == -1.0)
  {
    [(UICollectionViewTableLayout *)self _defaultCellHeight];
    double estimatedRowHeight = v14;
  }
  if (estimatedRowHeight <= 1.0 && estimatedRowHeight > 0.0) {
    double estimatedRowHeight = 2.0;
  }

  return estimatedRowHeight;
}

- (double)_estimatedHeightForHeaderInSection:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double estimatedSectionHeaderHeight = self->_estimatedSectionHeaderHeight;
  double v7 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(UICollectionViewTableLayout *)self _delegateProxy];
    [v9 collectionView:self->super._collectionView tableLayout:self estimatedHeightForHeaderInSection:a3];
    double estimatedSectionHeaderHeight = v10;

    int v11 = dyld_program_sdk_at_least();
    BOOL v12 = estimatedSectionHeaderHeight < 0.0;
    if (estimatedSectionHeaderHeight == -1.0) {
      BOOL v12 = 0;
    }
    if (v11)
    {
      if (v12)
      {
        CGRect v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2, self, @"UICollectionViewTableLayout.m", 1857, @"Invalid estimated header height (%g) provided by table delegate. Value must be at least 0.0, or UITableViewAutomaticDimension.", *(void *)&estimatedSectionHeaderHeight object file lineNumber description];
      }
    }
    else if (v12)
    {
      BOOL v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_estimatedHeightForHeaderInSection____s_category) + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        double v19 = estimatedSectionHeaderHeight;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Invalid estimated header height (%g) provided by table delegate. Value must be at least 0.0, or UITableViewAutomaticDimension.", buf, 0xCu);
      }
    }
  }
  else if (estimatedSectionHeaderHeight == -1.0)
  {
    [(UICollectionViewTableLayout *)self _defaultSectionHeaderHeight];
    double estimatedSectionHeaderHeight = v14;
  }
  BOOL v15 = estimatedSectionHeaderHeight > 1.0 || estimatedSectionHeaderHeight <= 0.0;
  double result = 2.0;
  if (v15) {
    return estimatedSectionHeaderHeight;
  }
  return result;
}

- (double)_estimatedHeightForFooterInSection:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double estimatedSectionFooterHeight = self->_estimatedSectionFooterHeight;
  double v7 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(UICollectionViewTableLayout *)self _delegateProxy];
    [v9 collectionView:self->super._collectionView tableLayout:self estimatedHeightForFooterInSection:a3];
    double estimatedSectionFooterHeight = v10;

    int v11 = dyld_program_sdk_at_least();
    BOOL v12 = estimatedSectionFooterHeight < 0.0;
    if (estimatedSectionFooterHeight == -1.0) {
      BOOL v12 = 0;
    }
    if (v11)
    {
      if (v12)
      {
        CGRect v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2, self, @"UICollectionViewTableLayout.m", 1870, @"Invalid estimated footer height (%g) provided by table delegate. Value must be at least 0.0, or UITableViewAutomaticDimension.", *(void *)&estimatedSectionFooterHeight object file lineNumber description];
      }
    }
    else if (v12)
    {
      BOOL v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_estimatedHeightForFooterInSection____s_category) + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        double v19 = estimatedSectionFooterHeight;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Invalid estimated footer height (%g) provided by table delegate. Value must be at least 0.0, or UITableViewAutomaticDimension.", buf, 0xCu);
      }
    }
  }
  else if (estimatedSectionFooterHeight == -1.0)
  {
    [(UICollectionViewTableLayout *)self _defaultSectionFooterHeight];
    double estimatedSectionFooterHeight = v14;
  }
  BOOL v15 = estimatedSectionFooterHeight > 1.0 || estimatedSectionFooterHeight <= 0.0;
  double result = 2.0;
  if (v15) {
    return estimatedSectionFooterHeight;
  }
  return result;
}

- (double)_dataSourceHeightForRowAtIndexPath:(id)a3
{
  id v5 = a3;
  double v6 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v7 = objc_opt_respondsToSelector();

  double v8 = -1.0;
  if (v7)
  {
    double v9 = [(UICollectionViewTableLayout *)self _delegateProxy];
    double v10 = [(UICollectionViewLayout *)self collectionView];
    [v9 collectionView:v10 tableLayout:self heightForRowAtIndexPath:v5];
    double v8 = v11;

    int v12 = dyld_program_sdk_at_least();
    BOOL v13 = v8 < 0.0;
    if (v8 == -1.0) {
      BOOL v13 = 0;
    }
    if (v12)
    {
      if (v13)
      {
        double v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2 object:self file:@"UICollectionViewTableLayout.m" lineNumber:1883 description:@"Invalid row height provided by table delegate. Value must be greater than zero or UITableViewAutomaticDimension."];
      }
    }
    else if (v13)
    {
      double v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_55) + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v17 = 0;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Invalid row height provided by table delegate. Value must be greater than zero or UITableViewAutomaticDimension.", v17, 2u);
      }
    }
    if (floor(v8) != v8 && qword_1EB25E540 != -1) {
      dispatch_once(&qword_1EB25E540, &__block_literal_global_109);
    }
  }

  return v8;
}

void __66__UICollectionViewTableLayout__dataSourceHeightForRowAtIndexPath___block_invoke()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICollectionViewTableLayout", &UICollectionElementKindSeparator_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "Returning a fractional height for UICollectionViewTableLayout rows will result in layout issues in the collection view. Please ensure that row heights are integral values. This message will only be logged once.", v1, 2u);
  }
}

- (double)_dataSourceHeightForHeaderInSection:(int64_t)a3
{
  double v6 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v7 = objc_opt_respondsToSelector();

  double v8 = -1.0;
  if (v7)
  {
    double v9 = [(UICollectionViewTableLayout *)self _delegateProxy];
    double v10 = [(UICollectionViewLayout *)self collectionView];
    [v9 collectionView:v10 tableLayout:self heightForHeaderInSection:a3];
    double v8 = v11;

    int v12 = dyld_program_sdk_at_least();
    BOOL v13 = v8 < 0.0;
    if (v8 == -1.0) {
      BOOL v13 = 0;
    }
    if (v12)
    {
      if (v13)
      {
        double v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2 object:self file:@"UICollectionViewTableLayout.m" lineNumber:1899 description:@"Invalid header height provided by table delegate. Value must be greater than zero or UITableViewAutomaticDimension."];
      }
    }
    else if (v13)
    {
      double v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25E548) + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v17 = 0;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Invalid header height provided by table delegate. Value must be greater than zero or UITableViewAutomaticDimension.", v17, 2u);
      }
    }
    if (floor(v8) != v8 && qword_1EB25E550 != -1) {
      dispatch_once(&qword_1EB25E550, &__block_literal_global_130);
    }
  }
  return v8;
}

void __67__UICollectionViewTableLayout__dataSourceHeightForHeaderInSection___block_invoke()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICollectionViewTableLayout", &UICollectionElementKindSeparator_block_invoke_2___s_category)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "Returning a fractional height for UICollectionViewTableLayout headers will result in layout issues in the collection view. Please ensure that header heights are integral values. This message will only be logged once.", v1, 2u);
  }
}

- (double)_dataSourceHeightForFooterInSection:(int64_t)a3
{
  double v6 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v7 = objc_opt_respondsToSelector();

  double v8 = -1.0;
  if (v7)
  {
    double v9 = [(UICollectionViewTableLayout *)self _delegateProxy];
    double v10 = [(UICollectionViewLayout *)self collectionView];
    [v9 collectionView:v10 tableLayout:self heightForFooterInSection:a3];
    double v8 = v11;

    int v12 = dyld_program_sdk_at_least();
    BOOL v13 = v8 < 0.0;
    if (v8 == -1.0) {
      BOOL v13 = 0;
    }
    if (v12)
    {
      if (v13)
      {
        double v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2 object:self file:@"UICollectionViewTableLayout.m" lineNumber:1915 description:@"Invalid footer height provided by table delegate. Value must be greater than zero or UITableViewAutomaticDimension."];
      }
    }
    else if (v13)
    {
      double v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25E558) + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v17 = 0;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Invalid footer height provided by table delegate. Value must be greater than zero or UITableViewAutomaticDimension.", v17, 2u);
      }
    }
    if (floor(v8) != v8 && qword_1EB25E560 != -1) {
      dispatch_once(&qword_1EB25E560, &__block_literal_global_137_0);
    }
  }
  return v8;
}

void __67__UICollectionViewTableLayout__dataSourceHeightForFooterInSection___block_invoke()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICollectionViewTableLayout", &UICollectionElementKindSeparator_block_invoke_3___s_category)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "Returning a fractional height for UICollectionViewTableLayout footers will result in layout issues in the collection view. Please ensure that your footer heights are integral values. This message will only be logged once.", v1, 2u);
  }
}

- (BOOL)_shouldHaveViewForElementOfKind:(id)a3 atSection:(int64_t)a4 useRowData:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = [(UICollectionViewTableLayout *)self _dataSourceActual];
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0
    && ([(UICollectionViewLayout *)self collectionView],
        double v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 _hasRegisteredClassOrNibForSupplementaryViewOfKind:v8],
        v11,
        v12))
  {
    if ([v8 isEqualToString:@"UICollectionElementKindGlobalHeader"])
    {
      if (v5) {
        double v13 = -[UITableViewRowData heightForTableHeaderView]((uint64_t)self->_rowData);
      }
      else {
        [(UICollectionViewTableLayout *)self _heightForTableHeader];
      }
    }
    else if ([v8 isEqualToString:@"UICollectionElementKindGlobalFooter"])
    {
      if (v5) {
        double v13 = -[UITableViewRowData heightForTableFooterView]((uint64_t)self->_rowData);
      }
      else {
        [(UICollectionViewTableLayout *)self _heightForTableFooter];
      }
    }
    else if ([v8 isEqualToString:@"UICollectionElementKindSectionHeader"])
    {
      [(UICollectionViewTableLayout *)self _heightForHeaderInSection:a4 useRowData:0];
    }
    else
    {
      int v15 = [v8 isEqualToString:@"UICollectionElementKindSectionFooter"];
      double v13 = 0.0;
      if (v15) {
        -[UICollectionViewTableLayout _heightForFooterInSection:useRowData:](self, "_heightForFooterInSection:useRowData:", a4, 0, 0.0);
      }
    }
    BOOL v14 = v13 > 0.0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_shouldHaveHeaderViewForSection:(int64_t)a3
{
  return [(UICollectionViewTableLayout *)self _shouldHaveViewForElementOfKind:@"UICollectionElementKindSectionHeader" atSection:a3 useRowData:0];
}

- (BOOL)_shouldHaveFooterViewForSection:(int64_t)a3
{
  return [(UICollectionViewTableLayout *)self _shouldHaveViewForElementOfKind:@"UICollectionElementKindSectionFooter" atSection:a3 useRowData:0];
}

- (BOOL)_shouldHaveGlobalViewForElementOfKind:(id)a3
{
  return [(UICollectionViewTableLayout *)self _shouldHaveViewForElementOfKind:a3 atSection:0x7FFFFFFFFFFFFFFFLL useRowData:0];
}

- (UIView)_tableHeaderView
{
  return 0;
}

- (UIView)_tableFooterView
{
  return 0;
}

- (id)_titleForHeaderInSection:(int64_t)a3
{
  return 0;
}

- (id)_titleForFooterInSection:(int64_t)a3
{
  return 0;
}

- (id)_detailTextForHeaderInSection:(int64_t)a3
{
  return 0;
}

- (int64_t)_titleAlignmentForHeaderInSection:(int64_t)a3
{
  return 4;
}

- (int64_t)_titleAlignmentForFooterInSection:(int64_t)a3
{
  return 4;
}

- (double)_maxTitleWidthForHeaderInSection:(int64_t)a3
{
  return 1.79769313e308;
}

- (double)_maxTitleWidthForFooterInSection:(int64_t)a3
{
  return 1.79769313e308;
}

- (BOOL)_shouldStripHeaderTopPaddingForSection:(int64_t)a3
{
  return 0;
}

- (BOOL)_shouldUseSearchBarHeaderBehavior
{
  return 0;
}

- (BOOL)_shouldUseNewHeaderFooterBehavior
{
  return 1;
}

- (void)_setHeight:(double)a3 forRowAtIndexPath:(id)a4 usingPresentationValues:(BOOL)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    if (!a5)
    {
      double v11 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
LABEL_13:

        goto LABEL_3;
      }
      int v12 = NSStringFromSelector(a2);
      int v14 = 138412290;
      int v15 = v12;
      _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Table layout does not yet support translating the index path (usingPresentationValues=NO) for a call to %@", (uint8_t *)&v14, 0xCu);
LABEL_12:

      goto LABEL_13;
    }
  }
  else if (!a5)
  {
    double v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setHeight_forRowAtIndexPath_usingPresentationValues____s_category)+ 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      double v11 = v13;
      int v12 = NSStringFromSelector(a2);
      int v14 = 138412290;
      int v15 = v12;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Table layout does not yet support translating the index path (usingPresentationValues=NO) for a call to %@", (uint8_t *)&v14, 0xCu);
      goto LABEL_12;
    }
  }
LABEL_3:
  if (!self->_deletedIndexPath || (objc_msgSend(v9, "isEqual:") & 1) == 0)
  {
    -[UITableViewRowData setHeight:forRowAtIndexPath:]((uint64_t)self->_rowData, v9, a3);
    [(UICollectionViewLayout *)self invalidateLayout];
    char v10 = [(UICollectionViewLayout *)self collectionView];
    [v10 layoutIfNeeded];
  }
}

- (void)_cellAccessoryButtonTappedAtIndexPath:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(UICollectionViewTableLayout *)self _delegateActual];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(UICollectionViewTableLayout *)self _delegateProxy];
    char v7 = [(UICollectionViewLayout *)self collectionView];
    [v6 collectionView:v7 tableLayout:self accessoryButtonTappedForRowWithIndexPath:v8];
  }
}

- (void)_swipeToDeleteCell:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(UICollectionViewLayout *)self collectionView];
  double v6 = [v5 indexPathForCell:v4];

  char v7 = [(UICollectionViewTableLayout *)self _swipeActionController];
  id v8 = [(UICollectionViewTableLayout *)self contextualActionForDeletingRowAtIndexPath:v6];
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  char v10 = +[UISwipeActionsConfiguration configurationWithActions:v9];
  double v11 = [(UICollectionViewTableLayout *)self _swipeActionController];
  objc_msgSend(v7, "swipeItemAtIndexPath:configuration:direction:animated:completion:", v6, v10, objc_msgSend(v11, "_swipeDirectionForLeadingEdge:", 0), 1, 0);
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowdouble Height = a3;
}

- (double)sectionHeaderHeight
{
  return self->_sectionHeaderHeight;
}

- (void)setSectionHeaderHeight:(double)a3
{
  self->_sectionHeaderdouble Height = a3;
}

- (double)sectionFooterHeight
{
  return self->_sectionFooterHeight;
}

- (void)setSectionFooterHeight:(double)a3
{
  self->_sectionFooterdouble Height = a3;
}

- (double)estimatedRowHeight
{
  return self->_estimatedRowHeight;
}

- (void)setEstimatedRowHeight:(double)a3
{
  self->_double estimatedRowHeight = a3;
}

- (double)estimatedSectionHeaderHeight
{
  return self->_estimatedSectionHeaderHeight;
}

- (void)setEstimatedSectionHeaderHeight:(double)a3
{
  self->_double estimatedSectionHeaderHeight = a3;
}

- (double)estimatedSectionFooterHeight
{
  return self->_estimatedSectionFooterHeight;
}

- (void)setEstimatedSectionFooterHeight:(double)a3
{
  self->_double estimatedSectionFooterHeight = a3;
}

- (BOOL)usesVariableMargins
{
  return self->_usesVariableMargins;
}

- (BOOL)overlapsSectionHeaderViews
{
  return self->_overlapsSectionHeaderViews;
}

- (double)_backgroundInset
{
  return self->_backgroundInset;
}

- (double)_topPadding
{
  return self->_topPadding;
}

- (double)_bottomPadding
{
  return self->_bottomPadding;
}

- (BOOL)_isShowingIndex
{
  return self->_showingIndex;
}

- (CGRect)_indexFrame
{
  double x = self->_indexFrame.origin.x;
  double y = self->_indexFrame.origin.y;
  double width = self->_indexFrame.size.width;
  double height = self->_indexFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIColor)_accessoryBaseColor
{
  return self->_accessoryBaseColor;
}

- (UIColor)_multiselectCheckmarkColor
{
  return self->_multiselectCheckmarkColor;
}

- (UITableConstants)_constants
{
  return self->_constants;
}

- (void)setConstants:(id)a3
{
}

- (double)_rowSpacing
{
  return self->_rowSpacing;
}

- (UIEdgeInsets)separatorInset
{
  double top = self->_separatorInset.top;
  double left = self->_separatorInset.left;
  double bottom = self->_separatorInset.bottom;
  double right = self->_separatorInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (UIVisualEffect)separatorEffect
{
  return self->_separatorEffect;
}

- (void)setSeparatorEffect:(id)a3
{
}

- (BOOL)cellLayoutMarginsFollowReadableWidth
{
  return self->_cellLayoutMarginsFollowReadableWidth;
}

- (void)setCellLayoutMarginsFollowReadableWidth:(BOOL)a3
{
  self->_cellLayoutMarginsFollowReadableCGFloat Width = a3;
}

- (BOOL)insetsContentViewsToSafeArea
{
  return self->_insetsContentViewsToSafeArea;
}

- (BOOL)separatorInsetIsRelativeToCellEdges
{
  return self->_separatorInsetIsRelativeToCellEdges;
}

- (UITableViewRowData)rowData
{
  return self->_rowData;
}

- (void)setRowData:(id)a3
{
}

- (NSMutableArray)deleteIndexPaths
{
  return self->_deleteIndexPaths;
}

- (void)setDeleteIndexPaths:(id)a3
{
}

- (NSMutableArray)insertIndexPaths
{
  return self->_insertIndexPaths;
}

- (void)setInsertIndexPaths:(id)a3
{
}

- (UISwipeActionController)_swipeActionController
{
  return self->_swipeActionController;
}

- (void)_setSwipeActionController:(id)a3
{
}

- (NSIndexPath)deletedIndexPath
{
  return self->_deletedIndexPath;
}

- (void)setDeletedIndexPath:(id)a3
{
}

- (BOOL)_showsAdditionalSeparators
{
  return self->_showsAdditionalSeparators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedIndexPath, 0);
  objc_storeStrong((id *)&self->_swipeActionController, 0);
  objc_storeStrong((id *)&self->_insertIndexPaths, 0);
  objc_storeStrong((id *)&self->_deleteIndexPaths, 0);
  objc_storeStrong((id *)&self->_rowData, 0);
  objc_storeStrong((id *)&self->_separatorEffect, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_multiselectCheckmarkColor, 0);
  objc_storeStrong((id *)&self->_accessoryBaseColor, 0);
  objc_storeStrong((id *)&self->_footerPreferredAttributesCache, 0);
  objc_storeStrong((id *)&self->_headerPreferredAttributesCache, 0);
  objc_storeStrong((id *)&self->_preferredAttributesCache, 0);
  objc_storeStrong((id *)&self->_indexPathCache, 0);
  objc_storeStrong((id *)&self->_darkenedSeparatorColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_floatingElementKinds, 0);
}

@end