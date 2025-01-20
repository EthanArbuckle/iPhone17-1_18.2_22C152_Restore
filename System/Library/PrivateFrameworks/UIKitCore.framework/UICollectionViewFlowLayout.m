@interface UICollectionViewFlowLayout
+ (Class)invalidationContextClass;
- (BOOL)_boundsAndInsetsAreValidForReferenceDimension;
- (BOOL)_estimatesSizes;
- (BOOL)_footerFollowsSectionMargins;
- (BOOL)_headerFollowsSectionMargins;
- (BOOL)_roundsToScreenScale;
- (BOOL)_shouldInvalidateLayoutForOldInsets:(UIEdgeInsets)a3 newInsets:(UIEdgeInsets)a4;
- (BOOL)_shouldInvalidateLayoutForUpdatedLayoutMargins:(UIEdgeInsets)a3 fromOldMargins:(UIEdgeInsets)a4;
- (BOOL)_shouldInvalidateLayoutForUpdatedSafeAreaInsets:(UIEdgeInsets)a3 fromOldInsets:(UIEdgeInsets)a4;
- (BOOL)_shouldScrollToContentBeginningInRightToLeft;
- (BOOL)sectionFootersPinToVisibleBounds;
- (BOOL)sectionHeadersPinToVisibleBounds;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4;
- (CGFloat)minimumInteritemSpacing;
- (CGFloat)minimumLineSpacing;
- (CGRect)_frameForFooterInSection:(int64_t)a3 usingData:(id)a4;
- (CGRect)_frameForHeaderInSection:(int64_t)a3 usingData:(id)a4;
- (CGRect)_frameForItem:(int64_t)a3 inSection:(int64_t)a4 usingData:(id)a5;
- (CGRect)_frameForScrollingToFirstElementInSectionAtIndex:(int64_t)a3;
- (CGSize)_effectiveEstimatedItemSize;
- (CGSize)collectionViewContentSize;
- (CGSize)estimatedItemSize;
- (CGSize)footerReferenceSize;
- (CGSize)headerReferenceSize;
- (CGSize)itemSize;
- (CGSize)synchronizeLayout;
- (UICollectionViewFlowLayout)init;
- (UICollectionViewFlowLayout)initWithCoder:(id)a3;
- (UICollectionViewFlowLayoutSectionInsetReference)sectionInsetReference;
- (UICollectionViewScrollDirection)scrollDirection;
- (UIEdgeInsets)_adjustedSectionInsetForSectionInset:(UIEdgeInsets)a3 forAxis:(unint64_t)a4;
- (UIEdgeInsets)sectionInset;
- (double)_dimensionFromCollectionView;
- (id)_existingLayoutAttributesForItemAtIndexPath:(id)a3;
- (id)_fetchAndCacheNewLayoutAttributesForCellWithIndexPath:(id)a3 frame:(CGRect)a4;
- (id)_invalidationContextForUpdatedLayoutMargins:(UIEdgeInsets)a3;
- (id)_layoutAttributesForItemsInRect:(CGRect)a3;
- (id)_rowAlignmentOptions;
- (id)finalLayoutAttributesForDeletedItemAtIndexPath:(id)a3;
- (id)finalLayoutAttributesForFooterInDeletedSection:(int64_t)a3;
- (id)finalLayoutAttributesForHeaderInDeletedSection:(int64_t)a3;
- (id)indexPathForItemAtPoint:(CGPoint)a3;
- (id)indexesForSectionFootersInRect:(CGRect)a3;
- (id)indexesForSectionFootersInRect:(CGRect)a3 usingData:(id)a4;
- (id)indexesForSectionHeadersInRect:(CGRect)a3;
- (id)indexesForSectionHeadersInRect:(CGRect)a3 usingData:(id)a4;
- (id)initialLayoutAttributesForFooterInInsertedSection:(int64_t)a3;
- (id)initialLayoutAttributesForHeaderInInsertedSection:(int64_t)a3;
- (id)initialLayoutAttributesForInsertedItemAtIndexPath:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForFooterInSection:(int64_t)a3;
- (id)layoutAttributesForFooterInSection:(int64_t)a3 usingData:(id)a4;
- (id)layoutAttributesForHeaderInSection:(int64_t)a3;
- (id)layoutAttributesForHeaderInSection:(int64_t)a3 usingData:(id)a4;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3 usingData:(id)a4;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (int64_t)_sectionArrayIndexForIndexPath:(id)a3;
- (int64_t)developmentLayoutDirection;
- (unint64_t)_layoutAxis;
- (void)_calculateAttributesForRect:(CGRect)a3;
- (void)_didPerformUpdateVisibleCellsPassWithLayoutOffset:(CGPoint)a3;
- (void)_fetchItemsInfoForRect:(CGRect)a3;
- (void)_finalizeCollectionViewUpdate:(id)a3;
- (void)_getSizingInfosWithExistingSizingDictionary:(id)a3;
- (void)_invalidateButKeepAllInfo;
- (void)_invalidateButKeepDelegateInfo;
- (void)_prepareForCollectionViewUpdates:(id)a3 withDataSourceTranslator:(id)a4;
- (void)_resetCachedItems;
- (void)_setCollectionView:(id)a3;
- (void)_setFooterFollowsSectionMargins:(BOOL)a3;
- (void)_setHeaderFollowsSectionMargins:(BOOL)a3;
- (void)_setNeedsLayoutComputationWithoutInvalidation;
- (void)_setRoundsToScreenScale:(BOOL)a3;
- (void)_setRowAlignmentsOptions:(id)a3;
- (void)_updateCollectionViewScrollableAxis;
- (void)_updateContentSizeScrollingDimensionWithDelta:(double)a3;
- (void)_updateDelegateFlags;
- (void)_updateItemsLayoutForRect:(CGRect)a3 allowsPartialUpdate:(BOOL)a4;
- (void)_willPerformUpdateVisibleCellsPass;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setEstimatedItemSize:(CGSize)estimatedItemSize;
- (void)setFooterReferenceSize:(CGSize)footerReferenceSize;
- (void)setHeaderReferenceSize:(CGSize)headerReferenceSize;
- (void)setItemSize:(CGSize)itemSize;
- (void)setMinimumInteritemSpacing:(CGFloat)minimumInteritemSpacing;
- (void)setMinimumLineSpacing:(CGFloat)minimumLineSpacing;
- (void)setScrollDirection:(UICollectionViewScrollDirection)scrollDirection;
- (void)setSectionFootersPinToVisibleBounds:(BOOL)sectionFootersPinToVisibleBounds;
- (void)setSectionHeadersPinToVisibleBounds:(BOOL)sectionHeadersPinToVisibleBounds;
- (void)setSectionInset:(UIEdgeInsets)sectionInset;
- (void)setSectionInsetReference:(UICollectionViewFlowLayoutSectionInsetReference)sectionInsetReference;
@end

@implementation UICollectionViewFlowLayout

- (void)prepareLayout
{
  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewFlowLayout;
  [(UICollectionViewLayout *)&v12 prepareLayout];
  self->_contentSizeAdjustment = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_contentOffsetAdjustment = (CGPoint)*MEMORY[0x1E4F1DAD8];
  v3 = [(UICollectionViewLayout *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v13.origin.x = v5;
  v13.origin.y = v7;
  v13.size.width = v9;
  v13.size.height = v11;
  if (!CGRectIsEmpty(v13)) {
    -[UICollectionViewFlowLayout _fetchItemsInfoForRect:](self, "_fetchItemsInfoForRect:", v5, v7, v9, v11);
  }
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  double v7 = a3;
  double v8 = a4;
  BOOL v9 = [(UICollectionViewFlowLayout *)self _estimatesSizes];
  if (v8) {
    int v10 = v8[144] & 1;
  }
  else {
    int v10 = 0;
  }
  [v7 size];
  double v12 = v11;
  double v14 = v13;
  [v8 size];
  if (!v9)
  {
    dyld_program_sdk_at_least();
    goto LABEL_11;
  }
  BOOL v17 = v12 != v15;
  if (v14 != v16) {
    BOOL v17 = 1;
  }
  int v18 = v10 & v17;
  if (dyld_program_sdk_at_least() && v18)
  {
    if ((*((unsigned char *)&self->_gridLayoutFlags + 6) & 1) == 0)
    {
      LOBYTE(v18) = 1;
      goto LABEL_12;
    }
    if (!self->_updateVisibleCellsContext)
    {
      v20 = objc_alloc_init(_UIUpdateVisibleCellsContext);
      updateVisibleCellsContext = self->_updateVisibleCellsContext;
      self->_updateVisibleCellsContext = v20;
    }
    [v7 size];
    if (v23 == *MEMORY[0x1E4F1DB30] && v22 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      v42 = [MEMORY[0x1E4F28B00] currentHandler];
      v43 = [(UICollectionViewLayout *)self collectionView];
      [v42 handleFailureInMethod:a2, self, @"UICollectionViewFlowLayout.m", 749, @"UICollectionView Flow Layout received layout attributes with an empty size. This happens when a reusable view has incorrectly configured constraints, or an incorrect override of -sizeThatFits:, -systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:, or -preferredLayoutAttributesFittingAttributes:. Ensure that your view generates a valid preferred size.\nOriginal attributes: %@. Preferred attributes: %@.\nCollection View: %@", v8, v7, v43 object file lineNumber description];

      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UICollectionLayout", &_MergedGlobals_129);
      if ((*(unsigned char *)CategoryCachedImpl & 1) == 0) {
        goto LABEL_11;
      }
      v45 = *(NSObject **)(CategoryCachedImpl + 8);
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      v29 = v45;
      v46 = [(UICollectionViewLayout *)self collectionView];
      *(_DWORD *)buf = 134218754;
      v54 = v46;
      __int16 v55 = 2048;
      v56 = self;
      __int16 v57 = 2112;
      v58 = v7;
      __int16 v59 = 2112;
      v60 = v8;
      _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "cv == %p; flow layout == %p; ignoring invalid preferred attributes. Preferred attrs: %@; original attrs: %@.",
        buf,
        0x2Au);
    }
    else
    {
      unint64_t v25 = __UILogGetCategoryCachedImpl("UICollectionLayout", &qword_1EB25A368);
      if (*(unsigned char *)v25)
      {
        v47 = *(NSObject **)(v25 + 8);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = v47;
          v49 = [(UICollectionViewLayout *)self collectionView];
          *(_DWORD *)buf = 134218754;
          v54 = v49;
          __int16 v55 = 2048;
          v56 = self;
          __int16 v57 = 2112;
          v58 = v7;
          __int16 v59 = 2112;
          v60 = v8;
          _os_log_impl(&dword_1853B0000, v48, OS_LOG_TYPE_ERROR, "cv == %p; flow layout == %p; adding preferred attributes to invalidation batch. Preferred attrs: %@; original attrs: %@.",
            buf,
            0x2Au);
        }
      }
      uint64_t v26 = [(UICollectionViewLayout *)self collectionView];
      v27 = (void *)v26;
      if (v26) {
        v28 = *(void **)(v26 + 3232);
      }
      else {
        v28 = 0;
      }
      v29 = v28;

      if (v29)
      {
        v30 = (void *)MEMORY[0x1E4F29238];
        [v8 size];
        v52[0] = v31;
        v52[1] = v32;
        v33 = [v30 valueWithBytes:v52 objCType:"{CGSize=dd}"];
        v34 = (void *)MEMORY[0x1E4F29238];
        [v7 size];
        v51[0] = v35;
        v51[1] = v36;
        v37 = [v34 valueWithBytes:v51 objCType:"{CGSize=dd}"];
        v38 = (void *)MEMORY[0x1E4F29238];
        [v8 size];
        v50[0] = v39;
        v50[1] = v40;
        v41 = [v38 valueWithBytes:v50 objCType:"{CGSize=dd}"];
        [v29 recordPreferredAttributesChangeForElementWithAttributes:v7 reason:@"preferred size changed" changedAttribute:@"preferredSize" fromValue:v33 toValue:v37 layoutGeneratedValue:v41];
      }
      -[_UIUpdateVisibleCellsContext addPreferredAttributes:]((uint64_t)self->_updateVisibleCellsContext, v7);
    }

LABEL_11:
    LOBYTE(v18) = 0;
  }
LABEL_12:

  return v18;
}

- (void)_willPerformUpdateVisibleCellsPass
{
  *((_DWORD *)&self->_gridLayoutFlags + 1) |= 0x10000u;
}

- (void)_didPerformUpdateVisibleCellsPassWithLayoutOffset:(CGPoint)a3
{
  if (dyld_program_sdk_at_least())
  {
    updateVisibleCellsContext = self->_updateVisibleCellsContext;
    if (updateVisibleCellsContext
      && [(NSMutableArray *)updateVisibleCellsContext->_attributes count]
      && !updateVisibleCellsContext->_visibleCellsRefCount)
    {
      data = self->_data;
      double v7 = self->_updateVisibleCellsContext;
      if (v7) {
        double v7 = (_UIUpdateVisibleCellsContext *)v7->_sizes;
      }
      double v8 = v7;
      BOOL v9 = self->_updateVisibleCellsContext;
      if (v9) {
        BOOL v9 = (_UIUpdateVisibleCellsContext *)v9->_indexPaths;
      }
      int v10 = v9;
      -[_UIFlowLayoutInfo setSizes:forItemsAtIndexPaths:]((uint64_t)data, v8, v10);

      id v11 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2, self, @"UICollectionViewFlowLayout.m", 2106, @"The invalidation context (%@) sent to -[UICollectionViewFlowLayout invalidateLayoutWithContext:] is not an instance of type UICollectionViewFlowLayoutInvalidationContext or a subclass. Collection view: %@", v11, self->super._collectionView object file lineNumber description];
      }
      double v12 = self->_updateVisibleCellsContext;
      if (v12) {
        double v12 = (_UIUpdateVisibleCellsContext *)v12->_indexPaths;
      }
      double v13 = v12;
      [v11 invalidateItemsAtIndexPaths:v13];

      [v11 setInvalidateFlowLayoutAttributes:0];
      [v11 _setInvalidateDataSourceCounts:0];
      objc_msgSend(v11, "setContentOffsetAdjustment:", self->_contentOffsetAdjustment.x, self->_contentOffsetAdjustment.y);
      objc_msgSend(v11, "setContentSizeAdjustment:", self->_contentSizeAdjustment.width, self->_contentSizeAdjustment.height);
      if (dyld_program_sdk_at_least()) {
        [v11 _setIntent:5];
      }
      [(UICollectionViewFlowLayout *)self invalidateLayoutWithContext:v11];
      [(UICollectionView *)self->super._collectionView _setNeedsVisibleCellsUpdate:1 withLayoutAttributes:1];
    }
    double v14 = self->_updateVisibleCellsContext;
    self->_updateVisibleCellsContext = 0;
  }
  *((_DWORD *)&self->_gridLayoutFlags + 1) &= ~0x10000u;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  double v8 = [MEMORY[0x1E4F1CA48] array];
  BOOL v9 = -[UICollectionViewFlowLayout _layoutAttributesForItemsInRect:](self, "_layoutAttributesForItemsInRect:", x, y, width, height);
  [v8 addObjectsFromArray:v9];
  int v10 = -[UICollectionViewFlowLayout indexesForSectionHeadersInRect:usingData:](self, "indexesForSectionHeadersInRect:usingData:", self->_data, x, y, width, height);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = -[UICollectionViewFlowLayout layoutAttributesForHeaderInSection:usingData:](self, "layoutAttributesForHeaderInSection:usingData:", [*(id *)(*((void *)&v27 + 1) + 8 * i) indexAtPosition:0], self->_data);
        [v8 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }
  double v16 = -[UICollectionViewFlowLayout indexesForSectionFootersInRect:usingData:](self, "indexesForSectionFootersInRect:usingData:", self->_data, x, y, width, height);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = -[UICollectionViewFlowLayout layoutAttributesForFooterInSection:usingData:](self, "layoutAttributesForFooterInSection:usingData:", [*(id *)(*((void *)&v23 + 1) + 8 * j) indexAtPosition:0], self->_data);
        [v8 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }
  if ((*(unsigned char *)(&self->_gridLayoutFlags + 1) & 0x80) == 0) {
    -[UICollectionViewFlowLayout _fetchItemsInfoForRect:](self, "_fetchItemsInfoForRect:", x, y, width, height);
  }

  return v8;
}

- (id)indexesForSectionHeadersInRect:(CGRect)a3 usingData:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  int v10 = v9;
  if (v9)
  {
    uint64_t v11 = (_UIFlowLayoutInfo *)v9;
LABEL_4:
    sections = v11->_sections;
    goto LABEL_5;
  }
  uint64_t v11 = self->_data;
  if (v11) {
    goto LABEL_4;
  }
  sections = 0;
LABEL_5:
  uint64_t v13 = sections;
  uint64_t v14 = [(NSMutableArray *)v13 count];
  double v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  if (v14 >= 1)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      uint64_t v17 = [(NSMutableArray *)v13 objectAtIndex:i];
      uint64_t v18 = (void *)v17;
      if (v17)
      {
        if (*(double *)(v17 + 128) > 0.0)
        {
          v25.origin.CGFloat x = x;
          v25.origin.CGFloat y = y;
          v25.size.CGFloat width = width;
          v25.size.CGFloat height = height;
          CGRect v22 = CGRectIntersection(*(CGRect *)(v17 + 312), v25);
          if (!CGRectIsNull(v22))
          {
            [(UICollectionViewFlowLayout *)self _frameForHeaderInSection:i usingData:v11];
            v26.origin.CGFloat x = x;
            v26.origin.CGFloat y = y;
            v26.size.CGFloat width = width;
            v26.size.CGFloat height = height;
            CGRect v24 = CGRectIntersection(v23, v26);
            if (!CGRectIsNull(v24))
            {
              uint64_t v19 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:i];
              [v15 addObject:v19];
            }
          }
        }
      }
    }
  }

  return v15;
}

- (id)indexesForSectionFootersInRect:(CGRect)a3 usingData:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  int v10 = v9;
  if (v9)
  {
    uint64_t v11 = (_UIFlowLayoutInfo *)v9;
LABEL_4:
    sections = v11->_sections;
    goto LABEL_5;
  }
  uint64_t v11 = self->_data;
  if (v11) {
    goto LABEL_4;
  }
  sections = 0;
LABEL_5:
  uint64_t v13 = sections;
  uint64_t v14 = [(NSMutableArray *)v13 count];
  double v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  if (v14 >= 1)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      uint64_t v17 = [(NSMutableArray *)v13 objectAtIndex:i];
      uint64_t v18 = (void *)v17;
      if (v17)
      {
        if (*(double *)(v17 + 136) > 0.0)
        {
          v25.origin.CGFloat x = x;
          v25.origin.CGFloat y = y;
          v25.size.CGFloat width = width;
          v25.size.CGFloat height = height;
          CGRect v22 = CGRectIntersection(*(CGRect *)(v17 + 312), v25);
          if (!CGRectIsNull(v22))
          {
            [(UICollectionViewFlowLayout *)self _frameForFooterInSection:i usingData:v11];
            v26.origin.CGFloat x = x;
            v26.origin.CGFloat y = y;
            v26.size.CGFloat width = width;
            v26.size.CGFloat height = height;
            CGRect v24 = CGRectIntersection(v23, v26);
            if (!CGRectIsNull(v24))
            {
              uint64_t v19 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:i];
              [v15 addObject:v19];
            }
          }
        }
      }
    }
  }

  return v15;
}

- (CGRect)_frameForFooterInSection:(int64_t)a3 usingData:(id)a4
{
  double v6 = a4;
  double v7 = v6;
  if (v6) {
    double v8 = (void *)v6[13];
  }
  else {
    double v8 = 0;
  }
  id v9 = v8;
  unint64_t v10 = [v9 count];

  if (v10 <= a3)
  {
    double v25 = *MEMORY[0x1E4F1DB28];
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    goto LABEL_36;
  }
  if (v7) {
    uint64_t v11 = (void *)v7[13];
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;
  uint64_t v13 = [v12 objectAtIndexedSubscript:a3];

  if (v13)
  {
    double v14 = *(double *)(v13 + 312);
    double v15 = *(double *)(v13 + 320);
    double v17 = *(double *)(v13 + 328);
    double v16 = *(double *)(v13 + 336);
    if (![(UICollectionViewFlowLayout *)self _footerFollowsSectionMargins])
    {
      double v18 = *(double *)(v13 + 376);
      double v19 = *(double *)(v13 + 384);
      CGFloat v21 = *(double *)(v13 + 392);
      double v23 = *(double *)(v13 + 400);
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v77 = [(UICollectionViewFlowLayout *)self _footerFollowsSectionMargins];
    double v14 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    double v15 = 0.0;
    double v19 = 0.0;
    CGFloat v21 = 0.0;
    double v23 = 0.0;
    double v18 = 0.0;
    if (!v77) {
      goto LABEL_11;
    }
  }
  double v18 = -[_UIFlowLayoutSection effectiveFooterFrameWithSectionMarginsApplied](v13);
  CGFloat v21 = v20;
  double v23 = v22;
LABEL_11:
  double v25 = v14 + v18;
  double v24 = v15 + v19;
  if ((*((unsigned char *)&self->_gridLayoutFlags + 5) & 0x10) != 0)
  {
    CGFloat v79 = v15;
    CGFloat v80 = v17;
    CGFloat v82 = v23;
    CGFloat v85 = v14;
    CGFloat v81 = v16;
    [(UIView *)self->super._collectionView bounds];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    [(UIScrollView *)self->super._collectionView _effectiveContentInset];
    double v41 = v39 + v40;
    double v43 = v38 + v42;
    data = self->_data;
    CGFloat v45 = v21;
    if (data) {
      LODWORD(data) = data->_horizontal;
    }
    double v46 = v31 + v39;
    double v47 = v33 + v38;
    double v48 = v35 - v41;
    double v49 = v37 - v43;
    CGFloat rect = v24;
    double v50 = v46;
    double v51 = v47;
    double v52 = v48;
    double v53 = v49;
    if (data)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v50);
      v86.origin.CGFloat x = v25;
      v86.origin.CGFloat y = v24;
      v86.size.CGFloat width = v45;
      v86.size.CGFloat height = v82;
      if (MaxX >= CGRectGetMaxX(v86))
      {
        double v56 = v24;
      }
      else
      {
        v87.origin.CGFloat x = v46;
        v87.origin.CGFloat y = v47;
        v87.size.CGFloat width = v48;
        v87.size.CGFloat height = v49;
        double v55 = CGRectGetMaxX(v87);
        v88.origin.CGFloat x = v25;
        v88.origin.CGFloat y = v24;
        double v56 = v24;
        v88.size.CGFloat width = v45;
        v88.size.CGFloat height = v82;
        double v25 = v55 - CGRectGetWidth(v88);
      }
      CGFloat v21 = v45;
      double v23 = v82;
      if (v13)
      {
        uint64_t v65 = *(void *)(v13 + 344);
        uint64_t v66 = *(void *)(v13 + 352);
        uint64_t v67 = *(void *)(v13 + 360);
        uint64_t v68 = *(void *)(v13 + 368);
      }
      else
      {
        uint64_t v66 = 0;
        uint64_t v67 = 0;
        uint64_t v68 = 0;
        uint64_t v65 = 0;
      }
      double v24 = v56;
      double Width = CGRectGetWidth(*(CGRect *)&v65);
      v92.origin.CGFloat x = v25;
      v92.origin.CGFloat y = v24;
      v92.size.CGFloat width = v21;
      v92.size.CGFloat height = v82;
      double v83 = Width;
      CGFloat v70 = CGRectGetMinX(v92) - Width;
      v93.origin.CGFloat x = v85;
      v93.origin.CGFloat y = v79;
      v93.size.CGFloat width = v80;
      v93.size.CGFloat height = v81;
      if (v70 < CGRectGetMinX(v93))
      {
        v94.origin.CGFloat x = v85;
        v94.origin.CGFloat y = v79;
        v94.size.CGFloat width = v80;
        v94.size.CGFloat height = v81;
        double v25 = v83 + CGRectGetMinX(v94);
      }
    }
    else
    {
      double MaxY = CGRectGetMaxY(*(CGRect *)&v50);
      v89.origin.CGFloat x = v25;
      v89.origin.CGFloat y = v24;
      CGFloat v58 = v45;
      v89.size.CGFloat width = v45;
      double v23 = v82;
      v89.size.CGFloat height = v82;
      if (MaxY >= CGRectGetMaxY(v89))
      {
        double v60 = rect;
      }
      else
      {
        v90.origin.CGFloat x = v46;
        v90.origin.CGFloat y = v47;
        v90.size.CGFloat width = v48;
        v90.size.CGFloat height = v49;
        double v59 = CGRectGetMaxY(v90);
        v91.origin.CGFloat x = v25;
        v91.origin.CGFloat y = rect;
        v91.size.CGFloat width = v58;
        v91.size.CGFloat height = v82;
        double v60 = v59 - CGRectGetHeight(v91);
      }
      CGFloat v21 = v58;
      if (v13)
      {
        uint64_t v71 = *(void *)(v13 + 344);
        uint64_t v72 = *(void *)(v13 + 352);
        uint64_t v73 = *(void *)(v13 + 360);
        uint64_t v74 = *(void *)(v13 + 368);
      }
      else
      {
        uint64_t v72 = 0;
        uint64_t v73 = 0;
        uint64_t v74 = 0;
        uint64_t v71 = 0;
      }
      double v24 = v60;
      double Height = CGRectGetHeight(*(CGRect *)&v71);
      v95.origin.CGFloat x = v25;
      v95.origin.CGFloat y = v24;
      v95.size.CGFloat width = v21;
      v95.size.CGFloat height = v82;
      double v84 = Height;
      CGFloat v76 = CGRectGetMinY(v95) - Height;
      v96.origin.CGFloat x = v85;
      v96.origin.CGFloat y = v79;
      v96.size.CGFloat width = v80;
      v96.size.CGFloat height = v81;
      if (v76 < CGRectGetMinY(v96))
      {
        v97.origin.CGFloat x = v85;
        v97.origin.CGFloat y = v79;
        v97.size.CGFloat width = v80;
        v97.size.CGFloat height = v81;
        double v24 = v84 + CGRectGetMinY(v97);
      }
    }
  }
  CGRect v26 = [(UICollectionViewLayout *)self collectionView];
  [v26 _currentScreenScale];
  double v28 = v27;

  if ([(UICollectionViewFlowLayout *)self _roundsToScreenScale])
  {
    double v29 = v28;
    if (v28 == 0.0)
    {
      if (AdjustToScale_onceToken != -1) {
        dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_115);
      }
      double v29 = *(double *)&AdjustToScale___s;
    }
    if (v29 == 1.0) {
      double v25 = round(v25);
    }
    else {
      double v25 = round(v25 * v29) / v29;
    }
  }
  if ([(UICollectionViewFlowLayout *)self _roundsToScreenScale])
  {
    if (v28 == 0.0)
    {
      if (AdjustToScale_onceToken != -1) {
        dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_115);
      }
      double v28 = *(double *)&AdjustToScale___s;
    }
    if (v28 == 1.0) {
      double v24 = round(v24);
    }
    else {
      double v24 = round(v24 * v28) / v28;
    }
  }

LABEL_36:
  double v61 = v25;
  double v62 = v24;
  double v63 = v21;
  double v64 = v23;
  result.size.CGFloat height = v64;
  result.size.CGFloat width = v63;
  result.origin.CGFloat y = v62;
  result.origin.CGFloat x = v61;
  return result;
}

- (BOOL)_footerFollowsSectionMargins
{
  return (*((unsigned __int8 *)&self->_gridLayoutFlags + 5) >> 6) & 1;
}

- (id)layoutAttributesForHeaderInSection:(int64_t)a3 usingData:(id)a4
{
  [(UICollectionViewFlowLayout *)self _frameForHeaderInSection:a3 usingData:a4];
  double x = v15.origin.x;
  double y = v15.origin.y;
  double width = v15.size.width;
  double height = v15.size.height;
  if (CGRectEqualToRect(v15, *MEMORY[0x1E4F1DB28]))
  {
    id v9 = 0;
  }
  else
  {
    unint64_t v10 = (void *)[(id)objc_opt_class() layoutAttributesClass];
    uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a3];
    id v12 = [v10 layoutAttributesForSupplementaryViewOfKind:@"UICollectionElementKindSectionHeader" withIndexPath:v11];

    objc_msgSend(v12, "setFrame:", x, y, width, height);
    if (dyld_program_sdk_at_least())
    {
      [v12 setZIndex:10];
      if (dyld_program_sdk_at_least()) {
        [v12 _setZPosition:1];
      }
    }
    id v9 = v12;
  }
  return v9;
}

- (CGRect)_frameForHeaderInSection:(int64_t)a3 usingData:(id)a4
{
  double v6 = a4;
  double v7 = v6;
  if (v6) {
    double v8 = (void *)v6[13];
  }
  else {
    double v8 = 0;
  }
  id v9 = v8;
  unint64_t v10 = [v9 count];

  if (v10 <= a3)
  {
    double v25 = *MEMORY[0x1E4F1DB28];
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    goto LABEL_36;
  }
  if (v7) {
    uint64_t v11 = (void *)v7[13];
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;
  uint64_t v13 = [v12 objectAtIndexedSubscript:a3];

  if (v13)
  {
    double v14 = *(double *)(v13 + 312);
    double v15 = *(double *)(v13 + 320);
    double v17 = *(double *)(v13 + 328);
    double v16 = *(double *)(v13 + 336);
    if ([(UICollectionViewFlowLayout *)self _headerFollowsSectionMargins])
    {
LABEL_8:
      double v18 = -[_UIFlowLayoutSection effectiveHeaderFrameWithSectionMarginsApplied](v13);
      CGFloat v21 = v20;
      double v23 = v22;
      goto LABEL_11;
    }
    double v18 = *(double *)(v13 + 344);
    double v19 = *(double *)(v13 + 352);
    CGFloat v21 = *(double *)(v13 + 360);
    double v23 = *(double *)(v13 + 368);
  }
  else
  {
    BOOL v72 = [(UICollectionViewFlowLayout *)self _headerFollowsSectionMargins];
    double v14 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    double v15 = 0.0;
    double v19 = 0.0;
    CGFloat v21 = 0.0;
    double v23 = 0.0;
    double v18 = 0.0;
    if (v72) {
      goto LABEL_8;
    }
  }
LABEL_11:
  double v25 = v14 + v18;
  double v24 = v15 + v19;
  if ((*((unsigned char *)&self->_gridLayoutFlags + 5) & 8) != 0)
  {
    CGFloat v90 = v16;
    CGFloat v91 = v23;
    data = self->_data;
    CGFloat v88 = v14;
    CGFloat v89 = v17;
    CGFloat v87 = v15;
    double v31 = v21;
    if (data) {
      BOOL leftToRight = data->_leftToRight;
    }
    else {
      BOOL leftToRight = 0;
    }
    [(UIView *)self->super._collectionView bounds];
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    [(UIScrollView *)self->super._collectionView _effectiveContentInset];
    double v42 = v34 + v41;
    double v44 = v36 + v43;
    double v46 = v38 - (v41 + v45);
    double v48 = v40 - (v43 + v47);
    double v49 = self->_data;
    if (v49)
    {
      CGFloat v21 = v31;
      if (v49->_horizontal)
      {
        double v23 = v91;
        CGFloat rect = v48;
        double v50 = v42;
        double v51 = v44;
        double v52 = v46;
        double v53 = v48;
        CGFloat v54 = v46;
        if (leftToRight)
        {
          double MinX = CGRectGetMinX(*(CGRect *)&v50);
          v92.origin.double x = v25;
          v92.origin.double y = v24;
          v92.size.double width = v21;
          v92.size.double height = v91;
          if (MinX > CGRectGetMinX(v92))
          {
            v93.origin.double x = v42;
            v93.origin.double y = v44;
            v93.size.double width = v54;
            v93.size.double height = rect;
            double v25 = CGRectGetMinX(v93);
          }
        }
        else
        {
          double MaxX = CGRectGetMaxX(*(CGRect *)&v50);
          v94.origin.double x = v25;
          v94.origin.double y = v24;
          v94.size.double width = v21;
          v94.size.double height = v91;
          if (MaxX < CGRectGetMaxX(v94))
          {
            v95.origin.double x = v42;
            v95.origin.double y = v44;
            v95.size.double width = v54;
            v95.size.double height = rect;
            double v61 = CGRectGetMaxX(v95);
            v96.origin.double x = v25;
            v96.origin.double y = v24;
            v96.size.double width = v21;
            v96.size.double height = v91;
            double v25 = v61 - CGRectGetWidth(v96);
          }
        }
        if (v13)
        {
          uint64_t v62 = *(void *)(v13 + 376);
          uint64_t v63 = *(void *)(v13 + 384);
          uint64_t v64 = *(void *)(v13 + 392);
          uint64_t v65 = *(void *)(v13 + 400);
        }
        else
        {
          uint64_t v63 = 0;
          uint64_t v64 = 0;
          uint64_t v65 = 0;
          uint64_t v62 = 0;
        }
        double Width = CGRectGetWidth(*(CGRect *)&v62);
        double v86 = Width;
        double v67 = v25;
        double v68 = v24;
        CGFloat v69 = v21;
        CGFloat v70 = v91;
        if (leftToRight)
        {
          CGFloat rectb = Width + CGRectGetMaxX(*(CGRect *)&v67);
          v97.origin.double x = v88;
          v97.origin.double y = v87;
          v97.size.double width = v89;
          v97.size.double height = v90;
          if (rectb > CGRectGetMaxX(v97))
          {
            v98.origin.double x = v88;
            v98.origin.double y = v87;
            v98.size.double width = v89;
            v98.size.double height = v90;
            double v71 = CGRectGetMaxX(v98);
            v99.origin.double x = v25;
            v99.origin.double y = v24;
            v99.size.double width = v21;
            v99.size.double height = v91;
            double v25 = v71 - (v86 + CGRectGetWidth(v99));
          }
        }
        else
        {
          CGFloat rectc = CGRectGetMinX(*(CGRect *)&v67) - Width;
          v100.origin.double x = v88;
          v100.origin.double y = v87;
          v100.size.double width = v89;
          v100.size.double height = v90;
          if (rectc < CGRectGetMinX(v100))
          {
            v101.origin.double x = v88;
            v101.origin.double y = v87;
            v101.size.double width = v89;
            v101.size.double height = v90;
            double v25 = Width + CGRectGetMinX(v101);
          }
        }
        goto LABEL_12;
      }
    }
    else
    {
      CGFloat v21 = v31;
    }
    v102.origin.double x = v42;
    v102.origin.double y = v44;
    v102.size.double width = v46;
    CGFloat v81 = v46;
    v102.size.double height = v48;
    double MinY = CGRectGetMinY(v102);
    v103.origin.double x = v25;
    v103.origin.double y = v24;
    v103.size.double width = v21;
    double v23 = v91;
    v103.size.double height = v91;
    if (MinY > CGRectGetMinY(v103))
    {
      v104.origin.double x = v42;
      v104.origin.double y = v44;
      v104.size.double width = v81;
      v104.size.double height = v48;
      double v24 = CGRectGetMinY(v104);
    }
    if (v13)
    {
      uint64_t v74 = *(void *)(v13 + 376);
      uint64_t v75 = *(void *)(v13 + 384);
      uint64_t v76 = *(void *)(v13 + 392);
      uint64_t v77 = *(void *)(v13 + 400);
    }
    else
    {
      uint64_t v75 = 0;
      uint64_t v76 = 0;
      uint64_t v77 = 0;
      uint64_t v74 = 0;
    }
    double Height = CGRectGetHeight(*(CGRect *)&v74);
    v105.origin.double x = v25;
    v105.origin.double y = v24;
    v105.size.double width = v21;
    v105.size.double height = v91;
    double recta = Height;
    CGFloat v79 = Height + CGRectGetMaxY(v105);
    v106.origin.double x = v88;
    v106.origin.double y = v87;
    v106.size.double width = v89;
    v106.size.double height = v90;
    if (v79 > CGRectGetMaxY(v106))
    {
      v107.origin.double x = v88;
      v107.origin.double y = v87;
      v107.size.double width = v89;
      v107.size.double height = v90;
      double MaxY = CGRectGetMaxY(v107);
      v108.origin.double x = v25;
      v108.origin.double y = v24;
      v108.size.double width = v21;
      v108.size.double height = v91;
      double v24 = MaxY - (recta + CGRectGetHeight(v108));
    }
  }
LABEL_12:
  CGRect v26 = [(UICollectionViewLayout *)self collectionView];
  [v26 _currentScreenScale];
  double v28 = v27;

  if ([(UICollectionViewFlowLayout *)self _roundsToScreenScale])
  {
    double v29 = v28;
    if (v28 == 0.0)
    {
      if (AdjustToScale_onceToken != -1) {
        dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_115);
      }
      double v29 = *(double *)&AdjustToScale___s;
    }
    if (v29 == 1.0) {
      double v25 = round(v25);
    }
    else {
      double v25 = round(v25 * v29) / v29;
    }
  }
  if ([(UICollectionViewFlowLayout *)self _roundsToScreenScale])
  {
    if (v28 == 0.0)
    {
      if (AdjustToScale_onceToken != -1) {
        dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_115);
      }
      double v28 = *(double *)&AdjustToScale___s;
    }
    if (v28 == 1.0) {
      double v24 = round(v24);
    }
    else {
      double v24 = round(v24 * v28) / v28;
    }
  }

LABEL_36:
  double v56 = v25;
  double v57 = v24;
  double v58 = v21;
  double v59 = v23;
  result.size.double height = v59;
  result.size.double width = v58;
  result.origin.double y = v57;
  result.origin.double x = v56;
  return result;
}

- (BOOL)_headerFollowsSectionMargins
{
  return (*((unsigned __int8 *)&self->_gridLayoutFlags + 5) >> 5) & 1;
}

- (id)layoutAttributesForFooterInSection:(int64_t)a3 usingData:(id)a4
{
  [(UICollectionViewFlowLayout *)self _frameForFooterInSection:a3 usingData:a4];
  double x = v15.origin.x;
  double y = v15.origin.y;
  double width = v15.size.width;
  double height = v15.size.height;
  if (CGRectEqualToRect(v15, *MEMORY[0x1E4F1DB28]))
  {
    id v9 = 0;
  }
  else
  {
    unint64_t v10 = (void *)[(id)objc_opt_class() layoutAttributesClass];
    uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a3];
    id v12 = [v10 layoutAttributesForSupplementaryViewOfKind:@"UICollectionElementKindSectionFooter" withIndexPath:v11];

    objc_msgSend(v12, "setFrame:", x, y, width, height);
    if (dyld_program_sdk_at_least()) {
      [v12 setZIndex:10];
    }
    id v9 = v12;
  }
  return v9;
}

- (UICollectionViewFlowLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewFlowLayout;
  v2 = [(UICollectionViewLayout *)&v5 init];
  v3 = v2;
  if (v2) {
    UICollectionViewFlowLayoutCommonInit((uint64_t)v2);
  }
  return v3;
}

- (void)_prepareForCollectionViewUpdates:(id)a3 withDataSourceTranslator:(id)a4
{
}

- (int64_t)developmentLayoutDirection
{
  return 0;
}

- (UIEdgeInsets)sectionInset
{
  double top = self->_sectionInset.top;
  double left = self->_sectionInset.left;
  double bottom = self->_sectionInset.bottom;
  double right = self->_sectionInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 isEqualToString:@"UICollectionElementKindSectionHeader"])
    {
      uint64_t v8 = -[UICollectionViewFlowLayout layoutAttributesForHeaderInSection:usingData:](self, "layoutAttributesForHeaderInSection:usingData:", [v7 indexAtPosition:0], self->_data);
LABEL_6:
      id v9 = (void *)v8;
      goto LABEL_8;
    }
    if ([v6 isEqualToString:@"UICollectionElementKindSectionFooter"])
    {
      uint64_t v8 = -[UICollectionViewFlowLayout layoutAttributesForFooterInSection:usingData:](self, "layoutAttributesForFooterInSection:usingData:", [v7 indexAtPosition:0], self->_data);
      goto LABEL_6;
    }
  }
  id v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(UICollectionViewLayout *)self collectionView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  int v17 = *((_DWORD *)&self->_gridLayoutFlags + 1);
  if ((v17 & 0x800) != 0)
  {
    CGFloat v21 = -[UICollectionViewFlowLayout indexesForSectionHeadersInRect:usingData:](self, "indexesForSectionHeadersInRect:usingData:", self->_data, v10, v12, v14, v16);
    if ([v21 count])
    {
LABEL_14:

      return 1;
    }
    double v22 = -[UICollectionViewFlowLayout indexesForSectionHeadersInRect:usingData:](self, "indexesForSectionHeadersInRect:usingData:", self->_data, x, y, width, height);
    uint64_t v23 = [v22 count];

    if (v23) {
      return 1;
    }
    if ((*(_DWORD *)(&self->_gridLayoutFlags + 1) & 0x1000) == 0) {
      goto LABEL_3;
    }
LABEL_13:
    CGFloat v21 = -[UICollectionViewFlowLayout indexesForSectionFootersInRect:usingData:](self, "indexesForSectionFootersInRect:usingData:", self->_data, v10, v12, v14, v16);
    if ([v21 count]) {
      goto LABEL_14;
    }
    double v24 = -[UICollectionViewFlowLayout indexesForSectionFootersInRect:usingData:](self, "indexesForSectionFootersInRect:usingData:", self->_data, x, y, width, height);
    uint64_t v25 = [v24 count];

    if (!v25) {
      goto LABEL_3;
    }
    return 1;
  }
  if ((v17 & 0x1000) != 0) {
    goto LABEL_13;
  }
LABEL_3:
  BOOL v18 = height != v16;
  if (y != v12) {
    BOOL v18 = 1;
  }
  BOOL v19 = width != v14;
  if (x != v10) {
    BOOL v19 = 1;
  }
  if (self->_scrollDirection) {
    return v18;
  }
  else {
    return v19;
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ((*(unsigned char *)(&self->_gridLayoutFlags + 1) & 0x80) != 0)
    {
      id v6 = [(UICollectionViewFlowLayout *)self _existingLayoutAttributesForItemAtIndexPath:v4];
      id v7 = v6;
      if (v6)
      {
        id v5 = v6;
      }
      else
      {
        uint64_t v8 = (void *)[v4 copy];
        unint64_t v9 = [(UICollectionViewFlowLayout *)self _sectionArrayIndexForIndexPath:v8];
        uint64_t v10 = [v8 item];
        data = self->_data;
        if (data) {
          data = (_UIFlowLayoutInfo *)data->_sections;
        }
        double v12 = data;
        unint64_t v13 = [(_UIFlowLayoutInfo *)v12 count];

        if (v9 >= v13)
        {
          id v5 = 0;
        }
        else
        {
          double v14 = self->_data;
          if (v14) {
            double v14 = (_UIFlowLayoutInfo *)v14->_sections;
          }
          double v15 = v14;
          uint64_t v16 = [(_UIFlowLayoutInfo *)v15 objectAtIndex:v9];

          if (((*(_WORD *)(&self->_gridLayoutFlags + 1) & 0x401) == 0 || v16 && *(unsigned char *)(v16 + 88))
            && ![(UICollectionViewFlowLayout *)self _estimatesSizes])
          {
            BOOL v18 = self->_data;
            if (v18) {
              BOOL horizontal = v18->_horizontal;
            }
            else {
              BOOL horizontal = 0;
            }
            double v20 = [(UICollectionViewLayout *)self collectionView];
            if ([v20 _shouldReverseLayoutDirection]) {
              BOOL v21 = [(UICollectionViewLayout *)self _wantsRightToLeftHorizontalMirroringIfNeeded];
            }
            else {
              BOOL v21 = 1;
            }

            if (v16)
            {
              uint64_t v22 = *(void *)(v16 + 216);
              uint64_t v23 = v10 / v22;
              uint64_t v24 = v10 % v22;
              double v26 = *(double *)(v16 + 248);
              double v25 = *(double *)(v16 + 256);
              if (horizontal) {
                double v27 = *(double *)(v16 + 248);
              }
              else {
                double v27 = *(double *)(v16 + 256);
              }
              if (horizontal) {
                double v28 = *(double *)(v16 + 256);
              }
              else {
                double v28 = *(double *)(v16 + 248);
              }
              if (*(unsigned char *)(v16 + 89) && v23 == *(void *)(v16 + 224) && *(_DWORD *)(v16 + 232) != 3)
              {
                uint64_t v29 = 200;
                uint64_t v30 = 184;
              }
              else
              {
                uint64_t v29 = 176;
                uint64_t v30 = 160;
              }
              double v31 = *(double *)(v16 + 312);
              double v32 = *(double *)(v16 + 320);
              double v33 = *(double *)(v16 + v30) + (v28 + *(double *)(v16 + v29)) * (double)v24;
              double v34 = *(double *)(v16 + 152) + (v27 + *(double *)(v16 + 112)) * (double)v23;
            }
            else
            {
              double v25 = 0.0;
              double v26 = 0.0;
              double v31 = 0.0;
              double v32 = 0.0;
              double v33 = 0.0;
              double v34 = 0.0;
            }
            double v35 = [(UICollectionViewLayout *)self collectionView];
            [v35 _currentScreenScale];
            double v37 = v36;

            if (horizontal) {
              double v38 = v34;
            }
            else {
              double v38 = v33;
            }
            if (!horizontal) {
              double v33 = v34;
            }
            double v39 = v31 + v38;
            if ([(UICollectionViewFlowLayout *)self _roundsToScreenScale])
            {
              double v40 = v37;
              if (v37 == 0.0)
              {
                if (AdjustToScale_onceToken != -1) {
                  dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_115);
                }
                double v40 = *(double *)&AdjustToScale___s;
              }
              if (v40 == 1.0) {
                double v39 = round(v39);
              }
              else {
                double v39 = round(v39 * v40) / v40;
              }
            }
            double v41 = v32 + v33;
            if ([(UICollectionViewFlowLayout *)self _roundsToScreenScale])
            {
              if (v37 == 0.0)
              {
                if (AdjustToScale_onceToken != -1) {
                  dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_115);
                }
                double v37 = *(double *)&AdjustToScale___s;
              }
              if (v37 == 1.0) {
                double v41 = round(v41);
              }
              else {
                double v41 = round(v41 * v37) / v37;
              }
            }
            if (!v21)
            {
              double v42 = 0.0;
              double v43 = v39;
              uint64_t v44 = 0;
              uint64_t v45 = 0;
              uint64_t v46 = 0;
              double v47 = 0.0;
              if (v16)
              {
                double v47 = *(double *)(v16 + 312);
                uint64_t v44 = *(void *)(v16 + 320);
                double v43 = v39 - v47;
                uint64_t v45 = *(void *)(v16 + 328);
                uint64_t v46 = *(void *)(v16 + 336);
              }
              double Width = CGRectGetWidth(*(CGRect *)&v47);
              v52.origin.double x = v39;
              v52.origin.double y = v41;
              v52.size.double width = v26;
              v52.size.double height = v25;
              double v49 = Width - CGRectGetWidth(v52) - v43;
              if (v16) {
                double v42 = *(double *)(v16 + 312);
              }
              double v39 = v49 + v42;
            }
            uint64_t v17 = -[UICollectionViewFlowLayout _fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:](self, "_fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:", v8, v39, v41, v26, v25);
          }
          else
          {
            uint64_t v17 = [(UICollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v8 usingData:self->_data];
          }
          id v5 = (id)v17;
        }
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", v4);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_layoutAttributesForItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  if (CGRectIsEmpty(a3)
    || ([(UICollectionViewLayout *)self collectionView],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 bounds],
        IsEmptdouble y = CGRectIsEmpty(v181),
        v8,
        IsEmpty)
    || ![(UICollectionViewFlowLayout *)self _boundsAndInsetsAreValidForReferenceDimension])
  {
    v163 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_7;
  }
  v163 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [(UICollectionViewLayout *)self collectionView];
  if ([v10 _shouldReverseLayoutDirection]) {
    int v147 = ![(UICollectionViewLayout *)self _wantsRightToLeftHorizontalMirroringIfNeeded];
  }
  else {
    int v147 = 0;
  }

  while (1)
  {
    -[UICollectionViewFlowLayout _fetchItemsInfoForRect:](self, "_fetchItemsInfoForRect:", x, y, width, height);
    data = self->_data;
    if (data) {
      data = (_UIFlowLayoutInfo *)data->_sections;
    }
    unint64_t v13 = data;
    v135 = [(UICollectionViewLayout *)self _sections];
    uint64_t v14 = [v135 firstIndex];
    long long v172 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    obuint64_t j = v13;
    uint64_t v136 = [(_UIFlowLayoutInfo *)obj countByEnumeratingWithState:&v172 objects:v178 count:16];
    if (v136)
    {
      uint64_t v162 = 0;
      uint64_t v134 = *(void *)v173;
      do
      {
        uint64_t v15 = 0;
        unint64_t v16 = 0x1E4F28000uLL;
        do
        {
          if (*(void *)v173 != v134) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v172 + 1) + 8 * v15);
          uint64_t v141 = v15;
          if (v17)
          {
            double v18 = *(double *)(v17 + 312);
            double v19 = *(double *)(v17 + 320);
            uint64_t v20 = *(void *)(v17 + 328);
            uint64_t v21 = *(void *)(v17 + 336);
          }
          else
          {
            double v19 = 0.0;
            uint64_t v20 = 0;
            uint64_t v21 = 0;
            double v18 = 0.0;
          }
          double rect = v19;
          double v161 = v18;
          uint64_t v144 = v21;
          uint64_t v145 = v20;
          v192.origin.double x = x;
          v192.origin.double y = y;
          v192.size.double width = width;
          v192.size.double height = height;
          CGRect v182 = CGRectIntersection(*(CGRect *)&v18, v192);
          double v22 = v182.origin.x;
          double v23 = v182.origin.y;
          CGFloat v24 = v182.size.width;
          CGFloat v25 = v182.size.height;
          if (!CGRectIsNull(v182))
          {
            if (!v17 || !*(void *)(v17 + 208))
            {
              if (v135) {
                uint64_t v14 = [v135 indexGreaterThanIndex:v14];
              }
              else {
                ++v14;
              }
              goto LABEL_67;
            }
            if (*(unsigned char *)(v17 + 88) && ![(UICollectionViewFlowLayout *)self _estimatesSizes])
            {
              uint64_t v63 = self->_data;
              if (v63 && v63->_horizontal)
              {
                int v64 = 1;
                double v65 = 0.0;
                double v66 = v161;
                double v67 = v161;
              }
              else
              {
                int v64 = 0;
                double v67 = 0.0;
                double v65 = rect;
                double v66 = v161;
              }
              double v68 = v22 - v67;
              double v69 = v23 - v65;
              if (v147)
              {
                double v70 = rect;
                uint64_t v72 = v144;
                uint64_t v71 = v145;
                double v156 = CGRectGetWidth(*(CGRect *)&v66);
                v185.origin.double x = v68;
                v185.origin.double y = v69;
                v185.size.double width = v24;
                v185.size.double height = v25;
                double v157 = v156 - CGRectGetWidth(v185);
                v186.origin.double x = v68;
                v186.origin.double y = v69;
                v186.size.double width = v24;
                v186.size.double height = v25;
                double v68 = v157 - CGRectGetMinX(v186);
              }
              v187.origin.double x = v68;
              v187.origin.double y = v69;
              v187.size.double width = v24;
              v187.size.double height = v25;
              double MinX = CGRectGetMinX(v187);
              v188.origin.double x = v68;
              v188.origin.double y = v69;
              v188.size.double width = v24;
              v188.size.double height = v25;
              double MinY = CGRectGetMinY(v188);
              v189.origin.double x = v68;
              v189.origin.double y = v69;
              v189.size.double width = v24;
              v189.size.double height = v25;
              CGFloat MaxX = CGRectGetMaxX(v189);
              v190.origin.double y = v69;
              double v74 = MaxX;
              v190.origin.double x = v68;
              v190.size.double width = v24;
              v190.size.double height = v25;
              double MaxY = CGRectGetMaxY(v190);
              double v76 = MinY;
              if (v64) {
                double v77 = MinY;
              }
              else {
                double v77 = MinX;
              }
              if (v64)
              {
                double v76 = MinX;
                double v78 = MaxY;
              }
              else
              {
                double v78 = v74;
              }
              if (v64) {
                double MaxY = v74;
              }
              double v79 = *(double *)(v17 + 248);
              double v80 = *(double *)(v17 + 256);
              if (v64) {
                double v81 = *(double *)(v17 + 248);
              }
              else {
                double v81 = *(double *)(v17 + 256);
              }
              double v159 = *(double *)(v17 + 248);
              if (v64) {
                double v79 = *(double *)(v17 + 256);
              }
              double v154 = v79;
              double v82 = *(double *)(v17 + 152);
              if (v76 <= v82)
              {
                uint64_t v84 = -1;
              }
              else
              {
                double v83 = v81 + *(double *)(v17 + 112);
                if (fabs(v83) <= 2.22044605e-16) {
                  uint64_t v84 = -1;
                }
                else {
                  uint64_t v84 = vcvtmd_s64_f64((v76 - v82) / v83);
                }
                if (v81 + v82 + v83 * (double)v84 < v76) {
                  ++v84;
                }
              }
              if (MaxY <= v82) {
                goto LABEL_176;
              }
              double v85 = v81 + *(double *)(v17 + 112);
              if (fabs(v85) <= 2.22044605e-16) {
                goto LABEL_176;
              }
              int64_t v86 = vcvtmd_s64_f64((MaxY - v82) / v85);
              if (v86 == -1) {
                goto LABEL_176;
              }
              if (v84 == -1) {
                uint64_t v84 = 0;
              }
              uint64_t v133 = v84;
              double v87 = *(double *)(v17 + 160);
              if (v77 <= v87)
              {
                uint64_t v91 = -1;
              }
              else
              {
                double v88 = v154 + *(double *)(v17 + 176);
                double v89 = (v77 - v87) / v88;
                unint64_t v90 = vcvtmd_s64_f64(v89);
                uint64_t v91 = v154 + v87 + v88 * (double)(uint64_t)floor(v89) >= v77 ? v90 : v90 + 1;
              }
              double v132 = v81;
              if (v78 <= v87)
              {
                unint64_t v100 = -1;
              }
              else
              {
                WeakRetained = (double *)objc_loadWeakRetained((id *)(v17 + 144));
                double v93 = v80;
                if (WeakRetained) {
                  double v94 = WeakRetained[14];
                }
                else {
                  double v94 = 0.0;
                }
                double v95 = v94 - *(double *)(v17 + 168);

                BOOL v96 = v78 <= v95;
                double v80 = v93;
                if (!v96)
                {
                  CGRect v97 = (double *)objc_loadWeakRetained((id *)(v17 + 144));
                  if (v97) {
                    double v98 = v97[14];
                  }
                  else {
                    double v98 = 0.0;
                  }
                  double v78 = v98 - *(double *)(v17 + 168);
                }
                double v99 = *(double *)(v17 + 176);
                unint64_t v100 = vcvtmd_s64_f64((v78 - *(double *)(v17 + 160) + v99) / (v154 + v99))
                     - (*(double *)(v17 + 160)
                      + (v154 + v99) * (double)(uint64_t)floor((v78 - *(double *)(v17 + 160) + v99) / (v154 + v99)) >= v78);
              }
              int64_t v138 = v100;
              if (v91 == -1 && v100 == -1) {
                goto LABEL_176;
              }
              if (v91 == -1) {
                uint64_t v101 = 0;
              }
              else {
                uint64_t v101 = v91;
              }
              uint64_t v142 = v101;
              CGRect v102 = [(UICollectionViewLayout *)self collectionView];
              [v102 _currentScreenScale];
              double v149 = v103;

              int64_t v137 = v86 - v133;
              unint64_t v16 = 0x1E4F28000uLL;
              char v151 = v64;
              if (v86 >= v133)
              {
                uint64_t v104 = 0;
                uint64_t v105 = v133;
                do
                {
                  if (v138 >= v142)
                  {
                    double v107 = *(double *)(v17 + 152) + (v132 + *(double *)(v17 + 112)) * (double)(v104 + v133);
                    double v143 = rect + v107;
                    double v146 = v161 + v107;
                    double v139 = round(v161 + v107);
                    double v140 = round(rect + v107);
                    uint64_t v108 = *(void *)(v17 + 216) * v105;
                    uint64_t v109 = v142;
                    do
                    {
                      if (v108 + v109 >= *(void *)(v17 + 208)) {
                        break;
                      }
                      v110 = objc_msgSend(*(id *)(v16 + 3416), "indexPathForItem:inSection:");
                      v111 = [(UICollectionViewFlowLayout *)self _existingLayoutAttributesForItemAtIndexPath:v110];
                      if (v111) {
                        goto LABEL_169;
                      }
                      double v112 = *(double *)(v17 + 160) + (v154 + *(double *)(v17 + 176)) * (double)v109;
                      if (v151)
                      {
                        double v113 = v146;
                        if ([(UICollectionViewFlowLayout *)self _roundsToScreenScale])
                        {
                          double v114 = v149;
                          if (v149 == 0.0)
                          {
                            if (AdjustToScale_onceToken != -1) {
                              dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_115);
                            }
                            double v114 = *(double *)&AdjustToScale___s;
                          }
                          BOOL v106 = v114 == 1.0;
                          double v115 = round(v146 * v114) / v114;
                          if (v106) {
                            double v113 = v139;
                          }
                          else {
                            double v113 = v115;
                          }
                        }
                        double v116 = v112 + 0.0;
                        if ([(UICollectionViewFlowLayout *)self _roundsToScreenScale])
                        {
                          double v117 = v149;
                          double v118 = v161;
                          double v119 = v113;
                          if (v149 == 0.0)
                          {
                            if (AdjustToScale_onceToken != -1)
                            {
                              dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_115);
                              double v118 = v161;
                            }
                            double v117 = *(double *)&AdjustToScale___s;
                          }
                          double v116 = v117 == 1.0 ? round(v116) : round(v116 * v117) / v117;
                        }
                        else
                        {
                          double v118 = v161;
                          double v119 = v113;
                        }
                      }
                      else
                      {
                        double v119 = v112 + 0.0;
                        if ([(UICollectionViewFlowLayout *)self _roundsToScreenScale])
                        {
                          double v120 = v149;
                          if (v149 == 0.0)
                          {
                            if (AdjustToScale_onceToken != -1) {
                              dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_115);
                            }
                            double v120 = *(double *)&AdjustToScale___s;
                          }
                          if (v120 == 1.0) {
                            double v119 = round(v119);
                          }
                          else {
                            double v119 = round(v119 * v120) / v120;
                          }
                        }
                        if ([(UICollectionViewFlowLayout *)self _roundsToScreenScale])
                        {
                          double v121 = v149;
                          double v118 = v161;
                          if (v149 == 0.0)
                          {
                            if (AdjustToScale_onceToken != -1)
                            {
                              dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_115);
                              double v118 = v161;
                            }
                            double v121 = *(double *)&AdjustToScale___s;
                          }
                          double v122 = round(v143 * v121) / v121;
                          double v116 = v121 == 1.0 ? v140 : v122;
                        }
                        else
                        {
                          double v116 = v143;
                          double v118 = v161;
                        }
                      }
                      double v123 = rect;
                      if (v147)
                      {
                        double v124 = v119 - v118;
                        uint64_t v126 = v144;
                        uint64_t v125 = v145;
                        CGFloat v127 = CGRectGetWidth(*(CGRect *)&v118);
                        CGFloat v128 = v119;
                        double v129 = v127;
                        v191.origin.double x = v128;
                        v191.origin.double y = v116;
                        v191.size.double width = v159;
                        v191.size.double height = v80;
                        double v119 = v161 + v129 - CGRectGetWidth(v191) - v124;
                      }
                      v111 = -[UICollectionViewFlowLayout _fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:](self, "_fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:", v110, v119, v116, v159, v80);
                      if (v111)
                      {
LABEL_169:
                        [v163 addObject:v111];
                      }
                      ++v109;
                      unint64_t v16 = 0x1E4F28000;
                    }
                    while (v138 + 1 != v109);
                  }
                  ++v105;
                  BOOL v106 = v104++ == v137;
                }
                while (!v106);
              }
            }
            else
            {
              uint64_t v26 = *(void *)(v17 + 264);
              long long v168 = 0u;
              long long v169 = 0u;
              long long v170 = 0u;
              long long v171 = 0u;
              id v152 = *(id *)(v17 + 104);
              uint64_t v27 = [v152 countByEnumeratingWithState:&v168 objects:v177 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v169;
                uint64_t v148 = *(void *)v169;
                do
                {
                  uint64_t v30 = 0;
                  uint64_t v150 = v28;
                  do
                  {
                    if (*(void *)v169 != v29) {
                      objc_enumerationMutation(v152);
                    }
                    uint64_t v31 = *(void *)(*((void *)&v168 + 1) + 8 * v30);
                    if (v31)
                    {
                      double v32 = *(double *)(v31 + 72);
                      double v33 = *(double *)(v31 + 80);
                      uint64_t v34 = *(void *)(v31 + 88);
                      uint64_t v35 = *(void *)(v31 + 96);
                    }
                    else
                    {
                      double v33 = 0.0;
                      uint64_t v34 = 0;
                      uint64_t v35 = 0;
                      double v32 = 0.0;
                    }
                    double v36 = v161 + v32;
                    double v37 = rect + v33;
                    v193.origin.double x = x;
                    v193.origin.double y = y;
                    v193.size.double width = width;
                    v193.size.double height = height;
                    if (CGRectIntersectsRect(*(CGRect *)(&v34 - 2), v193))
                    {
                      long long v166 = 0u;
                      long long v167 = 0u;
                      long long v164 = 0u;
                      long long v165 = 0u;
                      uint64_t v155 = v30;
                      if (v31) {
                        double v38 = *(void **)(v31 + 40);
                      }
                      else {
                        double v38 = 0;
                      }
                      id v39 = v38;
                      uint64_t v40 = [v39 countByEnumeratingWithState:&v164 objects:v176 count:16];
                      if (v40)
                      {
                        uint64_t v41 = v40;
                        uint64_t v42 = *(void *)v165;
                        while (1)
                        {
                          if (*(void *)v165 != v42) {
                            objc_enumerationMutation(v39);
                          }
                          double v43 = [*(id *)(v16 + 3416) indexPathForItem:v26 inSection:v14];
                          uint64_t v44 = [(UICollectionViewFlowLayout *)self _existingLayoutAttributesForItemAtIndexPath:v43];
                          uint64_t v45 = v44;
                          if (v44)
                          {
                            [v44 frame];
                            double v47 = v46;
                            double v49 = v48;
                            double v51 = v50;
                            double v53 = v52;
                          }
                          else
                          {
                            CGFloat v54 = self->_data;
                            if (v54) {
                              CGFloat v54 = (_UIFlowLayoutInfo *)v54->_sections;
                            }
                            double v55 = v54;
                            double v56 = [(_UIFlowLayoutInfo *)v55 objectAtIndexedSubscript:v162];
                            [(UICollectionViewFlowLayout *)self _frameForItem:v26 inSection:v14 usingData:v56];
                            double v47 = v57;
                            double v49 = v58;
                            double v51 = v59;
                            double v53 = v60;

                            unint64_t v16 = 0x1E4F28000;
                          }
                          v183.origin.double x = v47;
                          v183.origin.double y = v49;
                          v183.size.double width = v51;
                          v183.size.double height = v53;
                          v194.origin.double x = x;
                          v194.origin.double y = y;
                          v194.size.double width = width;
                          v194.size.double height = height;
                          CGRect v184 = CGRectIntersection(v183, v194);
                          if (!CGRectIsNull(v184))
                          {
                            if (v45
                              || (-[UICollectionViewFlowLayout _fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:](self, "_fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:", v43, v47, v49, v51, v53), (uint64_t v45 = objc_claimAutoreleasedReturnValue()) != 0))
                            {
                              [v163 addObject:v45];
                            }
                          }
                          ++v26;

                          if (!--v41)
                          {
                            uint64_t v41 = [v39 countByEnumeratingWithState:&v164 objects:v176 count:16];
                            if (!v41) {
                              break;
                            }
                          }
                        }
                        uint64_t v29 = v148;
                        uint64_t v28 = v150;
                      }
                      uint64_t v30 = v155;
                    }
                    else
                    {
                      if (v31) {
                        double v61 = *(void **)(v31 + 40);
                      }
                      else {
                        double v61 = 0;
                      }
                      id v39 = v61;
                      v26 += [v39 count];
                    }

                    ++v30;
                  }
                  while (v30 != v28);
                  uint64_t v62 = [v152 countByEnumeratingWithState:&v168 objects:v177 count:16];
                  uint64_t v28 = v62;
                }
                while (v62);
              }
            }
          }
          if (v135) {
            uint64_t v14 = [v135 indexGreaterThanIndex:v14];
          }
          else {
            ++v14;
          }
          uint64_t v15 = v141;
LABEL_67:
          ++v162;
          ++v15;
        }
        while (v15 != v136);
        uint64_t v130 = [(_UIFlowLayoutInfo *)obj countByEnumeratingWithState:&v172 objects:v178 count:16];
        uint64_t v136 = v130;
      }
      while (v130);
    }
LABEL_176:

    if ((*(unsigned char *)(&self->_gridLayoutFlags + 1) & 0x80) != 0) {
      break;
    }
    [v163 removeAllObjects];
    -[_UIFlowLayoutInfo invalidate:]((uint64_t)self->_data, 1);
  }
LABEL_7:
  return v163;
}

- (BOOL)_roundsToScreenScale
{
  return (*((unsigned __int8 *)&self->_gridLayoutFlags + 5) >> 1) & 1;
}

- (id)_existingLayoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_cachedItemFrames objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_cachedItemAttributes objectForKeyedSubscript:v4];
    if (v6)
    {
      [v5 CGRectValue];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      [v6 frame];
      v30.origin.double x = v8;
      v30.origin.double y = v10;
      v30.size.double width = v12;
      v30.size.double height = v14;
      if (!CGRectEqualToRect(v29, v30))
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __74__UICollectionViewFlowLayout__existingLayoutAttributesForItemAtIndexPath___block_invoke;
        block[3] = &unk_1E52E6160;
        id v21 = v4;
        id v22 = v6;
        double v24 = v8;
        double v25 = v10;
        double v26 = v12;
        double v27 = v14;
        double v23 = self;
        uint64_t v15 = _existingLayoutAttributesForItemAtIndexPath__onceToken;
        id v16 = v6;
        if (v15 != -1) {
          dispatch_once(&_existingLayoutAttributesForItemAtIndexPath__onceToken, block);
        }
        cachedItemAttributes = self->_cachedItemAttributes;
        self->_cachedItemAttributes = 0;

        cachedItemFrames = self->_cachedItemFrames;
        self->_cachedItemFrames = 0;

        id v6 = (void *)[v16 copy];
        objc_msgSend(v6, "setFrame:", v8, v10, v12, v14);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_fetchAndCacheNewLayoutAttributesForCellWithIndexPath:(id)a3 frame:(CGRect)a4
{
  if (a3)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    double v10 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", a3);
    objc_msgSend(v10, "setFrame:", x, y, width, height);
    if (![(UICollectionViewFlowLayout *)self _estimatesSizes])
    {
      [(NSMutableDictionary *)self->_cachedItemAttributes setObject:v10 forKeyedSubscript:a3];
      double v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
      [(NSMutableDictionary *)self->_cachedItemFrames setObject:v11 forKeyedSubscript:a3];
    }
  }
  else
  {
    double v10 = 0;
  }
  return v10;
}

- (BOOL)_estimatesSizes
{
  return self->_estimatedItemSize.height != *(double *)(MEMORY[0x1E4F1DB30] + 8)
      || self->_estimatedItemSize.width != *MEMORY[0x1E4F1DB30];
}

- (CGSize)collectionViewContentSize
{
  -[UICollectionViewFlowLayout _fetchItemsInfoForRect:](self, "_fetchItemsInfoForRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double width = self->_currentLayoutSize.width;
  double height = self->_currentLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_fetchItemsInfoForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (((*(unsigned char *)(&self->_gridLayoutFlags + 1) & 0x80) == 0
     || [(UICollectionViewFlowLayout *)self _estimatesSizes])
    && [(UICollectionViewFlowLayout *)self _boundsAndInsetsAreValidForReferenceDimension])
  {
    int v8 = dyld_program_sdk_at_least();
    int v9 = *((_DWORD *)&self->_gridLayoutFlags + 1);
    if (v8 && (v9 & 0x8000) != 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__UICollectionViewFlowLayout__fetchItemsInfoForRect___block_invoke;
      block[3] = &unk_1E52D9F70;
      void block[4] = self;
      if (_fetchItemsInfoForRect__once != -1) {
        dispatch_once(&_fetchItemsInfoForRect__once, block);
      }
      int v9 = *((_DWORD *)&self->_gridLayoutFlags + 1);
    }
    *((_DWORD *)&self->_gridLayoutFlags + 1) = v9 | 0x8000;
    [(UICollectionViewFlowLayout *)self _updateDelegateFlags];
    unsigned int v10 = *((_DWORD *)&self->_gridLayoutFlags + 1);
    if ((v10 & 0x100) == 0)
    {
      [(UICollectionViewFlowLayout *)self _getSizingInfosWithExistingSizingDictionary:0];
      *((_DWORD *)&self->_gridLayoutFlags + 1) |= 0x100u;
    }
    -[UICollectionViewFlowLayout _updateItemsLayoutForRect:allowsPartialUpdate:](self, "_updateItemsLayoutForRect:allowsPartialUpdate:", (v10 >> 8) & 1, x, y, width, height);
    *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFF7F7F | 0x80;
  }
}

- (BOOL)_boundsAndInsetsAreValidForReferenceDimension
{
  v3 = [(UICollectionViewLayout *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  int64_t scrollDirection = self->_scrollDirection;
  int v9 = [(UICollectionViewLayout *)self collectionView];
  [v9 _effectiveContentInset];
  double v11 = v10;
  double v13 = v12;
  double v14 = [(UICollectionViewLayout *)self collectionView];
  [v14 _effectiveContentInset];
  double v16 = v15;
  double v18 = v17;

  double v19 = v5 - v13 - v18;
  if (scrollDirection) {
    double v19 = v7 - v11 - v16;
  }
  if (v19 < 0.0) {
    double v19 = 0.0;
  }
  return v19 > 0.0;
}

- (void)_updateDelegateFlags
{
  v3 = [(UICollectionViewLayout *)self collectionView];
  id v11 = [v3 _delegateActual];

  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    int v4 = 2;
  }
  else {
    int v4 = 0;
  }
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFFFD | v4;
  if (objc_opt_respondsToSelector()) {
    int v5 = 4;
  }
  else {
    int v5 = 0;
  }
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFFFB | v5;
  if (objc_opt_respondsToSelector()) {
    int v6 = 8;
  }
  else {
    int v6 = 0;
  }
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFFF7 | v6;
  if (objc_opt_respondsToSelector()) {
    int v7 = 16;
  }
  else {
    int v7 = 0;
  }
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFFEF | v7;
  if (objc_opt_respondsToSelector()) {
    int v8 = 32;
  }
  else {
    int v8 = 0;
  }
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFFDF | v8;
  if (objc_opt_respondsToSelector()) {
    int v9 = 64;
  }
  else {
    int v9 = 0;
  }
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFFBF | v9;
  if (objc_opt_respondsToSelector()) {
    int v10 = 1024;
  }
  else {
    int v10 = 0;
  }
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFBFF | v10;
}

- (void)_getSizingInfosWithExistingSizingDictionary:(id)a3
{
  SEL v163 = a2;
  uint64_t v210 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(UICollectionViewLayout *)self collectionView];
  id v181 = [v5 _delegateProxy];
  data = self->_data;
  uint64_t v170 = 392;
  if (data)
  {
    p_int64_t scrollDirection = &self->_scrollDirection;
    goto LABEL_10;
  }
  int v8 = objc_alloc_init(_UIFlowLayoutInfo);
  int v9 = self->_data;
  self->_data = v8;

  int v10 = self->_data;
  if (v10) {
    objc_storeWeak((id *)&v10->_layout, self);
  }
  if ([v5 _shouldReverseLayoutDirection]) {
    BOOL v11 = [(UICollectionViewLayout *)self _wantsRightToLeftHorizontalMirroringIfNeeded];
  }
  else {
    BOOL v11 = 1;
  }
  uint64_t v12 = v170;
  uint64_t v13 = *(uint64_t *)((char *)&self->super.super.isa + v170);
  if (v13)
  {
    *(unsigned char *)(v13 + 98) = v11;
    data = *(_UIFlowLayoutInfo **)((char *)&self->super.super.isa + v12);
    p_int64_t scrollDirection = &self->_scrollDirection;
    if (!data)
    {
LABEL_189:
      BOOL v167 = 0;
      goto LABEL_12;
    }
LABEL_10:
    data->_BOOL horizontal = *p_scrollDirection == 1;
    uint64_t v14 = *(uint64_t *)((char *)&self->super.super.isa + v170);
    if (v14)
    {
      BOOL v167 = *(unsigned __int8 *)(v14 + 97) != 0;
      goto LABEL_12;
    }
    goto LABEL_189;
  }
  BOOL v167 = 0;
  p_int64_t scrollDirection = &self->_scrollDirection;
LABEL_12:
  [(UICollectionViewFlowLayout *)self _dimensionFromCollectionView];
  double v166 = v15;
  uint64_t v182 = 276;
  if ((*(_WORD *)(&self->_gridLayoutFlags + 1) & 0x401) != 0) {
    int v179 = 0;
  }
  else {
    int v179 = ![(UICollectionViewFlowLayout *)self _estimatesSizes];
  }
  double v16 = *(Class *)((char *)&self->super.super.isa + v170);
  v178 = p_scrollDirection;
  if (v16) {
    double v16 = (void *)v16[13];
  }
  long long v172 = v16;
  uint64_t v175 = [v172 count];
  BOOL v162 = v175 != 0;
  id v176 = [(UICollectionViewLayout *)self _sections];
  uint64_t v183 = [v176 firstIndex];
  uint64_t v173 = [v5 numberOfSections];
  if (v183 < v173)
  {
    long long v169 = &v199;
    double v161 = v185;
    double v18 = *MEMORY[0x1E4F1DB30];
    double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v20 = 1;
    if (v167) {
      uint64_t v20 = 2;
    }
    uint64_t v171 = v20;
    *(void *)&long long v17 = 138412290;
    long long v154 = v17;
    id v156 = v4;
    v158 = v5;
    while (1)
    {
      if (v175) {
        [v172 objectAtIndexedSubscript:0];
      }
      else {
      uint64_t v21 = -[_UIFlowLayoutInfo addSection](*(id **)((char *)&self->super.super.isa + v170));
      }
      uint64_t v22 = objc_msgSend(v5, "numberOfItemsInSection:", v183, (void)v154, *((void *)&v154 + 1));
      uint64_t v23 = v22;
      if (v21) {
        *(void *)(v21 + 208) = v22;
      }
      if ((v179 & 1) == 0) {
        break;
      }
LABEL_134:
      if ((*((unsigned char *)&self->super.super.isa + v182) & 8) != 0)
      {
        double v115 = [(UICollectionViewLayout *)self collectionView];
        [v181 collectionView:v115 layout:self insetForSectionAtIndex:v183];
        if (!v21)
        {

LABEL_181:
          double left = 0.0;
          double bottom = 0.0;
          double right = 0.0;
          double top = 0.0;
          if (!self->_sectionInsetReference) {
            goto LABEL_143;
          }
          goto LABEL_141;
        }
        *(void *)(v21 + 280) = v116;
        *(void *)(v21 + 288) = v117;
        *(void *)(v21 + 296) = v118;
        *(void *)(v21 + 304) = v119;

        if (!self->_sectionInsetReference) {
          goto LABEL_143;
        }
        double top = *(double *)(v21 + 280);
        double left = *(double *)(v21 + 288);
        double bottom = *(double *)(v21 + 296);
        double right = *(double *)(v21 + 304);
      }
      else
      {
        if (!v21) {
          goto LABEL_181;
        }
        double bottom = self->_sectionInset.bottom;
        double right = self->_sectionInset.right;
        double top = self->_sectionInset.top;
        double left = self->_sectionInset.left;
        *(double *)(v21 + 280) = top;
        *(double *)(v21 + 288) = left;
        *(double *)(v21 + 296) = bottom;
        *(double *)(v21 + 304) = right;
        if (!self->_sectionInsetReference) {
          goto LABEL_143;
        }
      }
LABEL_141:
      -[UICollectionViewFlowLayout _adjustedSectionInsetForSectionInset:forAxis:](self, "_adjustedSectionInsetForSectionInset:forAxis:", v171, top, left, bottom, right);
      if (v21)
      {
        *(void *)(v21 + 280) = v120;
        *(void *)(v21 + 288) = v121;
        *(void *)(v21 + 296) = v122;
        *(void *)(v21 + 304) = v123;
      }
LABEL_143:
      if ((*((unsigned char *)&self->super.super.isa + v182) & 0x10) != 0)
      {
        uint64_t v125 = [(UICollectionViewLayout *)self collectionView];
        [v181 collectionView:v125 layout:self minimumInteritemSpacingForSectionAtIndex:v183];
        if (v21) {
          *(void *)(v21 + 120) = v126;
        }
      }
      else
      {
        [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
        if (v21) {
          *(void *)(v21 + 120) = v124;
        }
      }
      if ((*((unsigned char *)&self->super.super.isa + v182) & 0x20) != 0)
      {
        CGFloat v128 = [(UICollectionViewLayout *)self collectionView];
        [v181 collectionView:v128 layout:self minimumLineSpacingForSectionAtIndex:v183];
        if (v21)
        {
          *(void *)(v21 + 112) = v129;

LABEL_154:
          if (v179)
          {
            *(unsigned char *)(v21 + 88) = 1;
            [(UICollectionViewFlowLayout *)self itemSize];
            *(void *)(v21 + 248) = v130;
            *(void *)(v21 + 256) = v131;
          }
          goto LABEL_156;
        }
      }
      else
      {
        [(UICollectionViewFlowLayout *)self minimumLineSpacing];
        if (v21)
        {
          *(void *)(v21 + 112) = v127;
          goto LABEL_154;
        }
      }
      if (v179) {
        [(UICollectionViewFlowLayout *)self itemSize];
      }
LABEL_156:
      if ((*((unsigned char *)&self->super.super.isa + v182) & 0x40) == 0
        || ([(UICollectionViewLayout *)self collectionView],
            double v132 = objc_claimAutoreleasedReturnValue(),
            [v181 _collectionView:v132 layout:self flowLayoutRowAlignmentOptionsForSection:v183],
            uint64_t v133 = (NSDictionary *)objc_claimAutoreleasedReturnValue(),
            v132,
            !v133))
      {
        uint64_t v133 = self->_rowAlignmentsOptionsDictionary;
        if (!v133)
        {
          unsigned int v135 = 0;
          uint64_t v137 = 0;
          int v139 = 0;
          if (!v21) {
            goto LABEL_161;
          }
LABEL_160:
          *(void *)(v21 + 232) = v135 | (unint64_t)(v137 << 32);
          *(_DWORD *)(v21 + 240) = v139;
          goto LABEL_161;
        }
      }
      uint64_t v134 = [(NSDictionary *)v133 objectForKeyedSubscript:@"UIFlowLayoutCommonRowHorizontalAlignmentKey"];
      unsigned int v135 = [v134 intValue];

      uint64_t v136 = [(NSDictionary *)v133 objectForKeyedSubscript:@"UIFlowLayoutLastRowHorizontalAlignmentKey"];
      uint64_t v137 = [v136 intValue];

      int64_t v138 = [(NSDictionary *)v133 objectForKeyedSubscript:@"UIFlowLayoutRowVerticalAlignmentKey"];
      int v139 = [v138 intValue];

      if (v21) {
        goto LABEL_160;
      }
LABEL_161:
      if ((*((unsigned char *)&self->super.super.isa + v182) & 2) != 0)
      {
        uint64_t v142 = [(UICollectionViewLayout *)self collectionView];
        [v181 collectionView:v142 layout:self referenceSizeForHeaderInSection:v183];
        double width = v143;
        double height = v144;
      }
      else
      {
        double width = self->_headerReferenceSize.width;
        double height = self->_headerReferenceSize.height;
      }
      if (*v178) {
        double v145 = width;
      }
      else {
        double v145 = height;
      }
      -[_UIFlowLayoutSection setHeaderDimension:forSection:](v21, v183, v145);
      if ((*((unsigned char *)&self->super.super.isa + v182) & 4) != 0)
      {
        uint64_t v148 = [(UICollectionViewLayout *)self collectionView];
        [v181 collectionView:v148 layout:self referenceSizeForFooterInSection:v183];
        double v146 = v149;
        double v147 = v150;
      }
      else
      {
        double v146 = self->_footerReferenceSize.width;
        double v147 = self->_footerReferenceSize.height;
      }
      BOOL v151 = v176 == 0;
      if (*v178) {
        double v152 = v146;
      }
      else {
        double v152 = v147;
      }
      -[_UIFlowLayoutSection setFooterDimension:forSection:](v21, v183, v152);
      if (v151) {
        ++v183;
      }
      else {
        uint64_t v183 = [v176 indexGreaterThanIndex:v183];
      }

      if (v183 >= v173) {
        goto LABEL_188;
      }
    }
    uint64_t v195 = 0;
    v196 = (double *)&v195;
    uint64_t v197 = 0x3010000000;
    v198 = &unk_186D7DBA7;
    *(_OWORD *)long long v169 = *MEMORY[0x1E4F1DB30];
    uint64_t v191 = 0;
    CGRect v192 = &v191;
    uint64_t v193 = 0x2020000000;
    char v194 = 0;
    char v194 = ![(UICollectionViewFlowLayout *)self _estimatesSizes];
    if (v175)
    {
      if (v23 >= 1)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (v21) {
            double v25 = *(void **)(v21 + 96);
          }
          else {
            double v25 = 0;
          }
          id v26 = v25;
          uint64_t v27 = [v26 objectAtIndexedSubscript:i];

          if (v27)
          {
            double v28 = *(double *)(v27 + 48);
            double v29 = *(double *)(v27 + 56);
          }
          else
          {
            double v28 = 0.0;
            double v29 = 0.0;
          }
          int v30 = dyld_program_sdk_at_least();
          BOOL v31 = v28 < 0.0;
          if (v29 < 0.0) {
            BOOL v31 = 1;
          }
          if (v30)
          {
            if (v31)
            {
              double v32 = [MEMORY[0x1E4F28B00] currentHandler];
              [v32 handleFailureInMethod:v163, self, @"UICollectionViewFlowLayout.m", 1461, @"Negative sizes are not supported by flow layout. Collection view: %@", self->super._collectionView object file lineNumber description];
            }
          }
          else if (v31)
          {
            double v38 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25A370) + 8);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              collectionView = self->super._collectionView;
              *(_DWORD *)buf = v154;
              v201 = collectionView;
              _os_log_impl(&dword_1853B0000, v38, OS_LOG_TYPE_ERROR, "Negative sizes are not supported by flow layout. Collection view: %@", buf, 0xCu);
            }
          }
          if (*((unsigned char *)v192 + 24))
          {
            double v33 = v196;
            double v34 = v196[4];
            double v35 = v196[5];
            if (v18 == v34 && v19 == v35)
            {
              v196[4] = v28;
              v33[5] = v29;
            }
            else if (v28 != v34 || v29 != v35)
            {
              *((unsigned char *)v192 + 24) = 0;
            }
          }
          if (v27)
          {
            *(void *)(v27 + 32) = 0;
            *(void *)(v27 + 40) = 0;
            *(double *)(v27 + 48) = v28;
            *(double *)(v27 + 56) = v29;
          }
        }
      }
      goto LABEL_128;
    }
    if ((*((unsigned char *)&self->super.super.isa + v182 + 1) & 4) != 0)
    {
      double v76 = [v181 _collectionView:v5 layout:self sizesForItemsInSection:v183];
      v184[0] = MEMORY[0x1E4F143A8];
      v184[1] = 3221225472;
      v185[0] = __74__UICollectionViewFlowLayout__getSizingInfosWithExistingSizingDictionary___block_invoke;
      v185[1] = &unk_1E52E6188;
      SEL v189 = v163;
      v185[2] = self;
      BOOL v190 = v162;
      id v186 = (id)v21;
      CGRect v187 = &v191;
      CGRect v188 = &v195;
      id v77 = v76;
      long long v165 = v184;
      uint64_t v78 = [v77 count];
      long long v164 = &v154;
      size_t v79 = 8 * v78;
      MEMORY[0x1F4188790](v78);
      double v80 = (char *)&v154 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v180 = v81;
      bzero(v80, v79);
      MEMORY[0x1F4188790](v82);
      bzero(v80, v79);
      uint64_t v83 = [v77 getObjects:v80 andKeys:v80 count:v180];
      id v168 = v77;
      MEMORY[0x1F4188790](v83);
      MEMORY[0x1F4188790](v84);
      v177 = v80;
      MEMORY[0x1F4188790](v85);
      double v89 = MEMORY[0x1F4188790](v86);
      if (v88)
      {
        uint64_t v90 = 0;
        uint64_t v91 = (uint64_t *)&v154 - 2 * v88 + 1;
        CGRect v92 = (void *)(v87 + 8);
        double v159 = (double *)(v87 + 8);
        v160 = v91;
        do
        {
          objc_msgSend(*(id *)&v80[8 * v90], "CGSizeValue", v89);
          *(v92 - 1) = v93;
          *CGRect v92 = v94;
          *(void *)&v177[8 * v90] = 1;
          uint64_t v95 = [*(id *)&v80[8 * v90] rangeCount];
          *(void *)&v80[8 * v90] = v95;
          if (v95)
          {
            *(v91 - 1) = [*(id *)&v80[8 * v90] rangeAtIndex:0];
            *uint64_t v91 = v96;
          }
          ++v90;
          v91 += 2;
          v92 += 2;
          uint64_t v97 = v180;
        }
        while (v180 != v90);
        double v157 = &v154;
        uint64_t v174 = 0;
LABEL_115:
        double v98 = v80;
        double v99 = v177;
        unint64_t v100 = v160;
        uint64_t v101 = v159;
        CGRect v102 = (id *)v80;
        do
        {
          unint64_t v103 = *(void *)v99;
          unint64_t v105 = *(void *)v98;
          v98 += 8;
          unint64_t v104 = v105;
          if (*(void *)v99 <= v105 && *(v100 - 1) == v174)
          {
            double v106 = *(v101 - 1);
            double v107 = *v101;
            uint64_t v155 = *v100;
            ((void (*)(void *, uint64_t, double, double))v185[0])(v165, v174, v106, v107);
            if (v103 < v104)
            {
              *(v100 - 1) = [*v102 rangeAtIndex:v103];
              *unint64_t v100 = v108;
            }
            v174 += v155;
            *(void *)double v99 = v103 + 1;
            uint64_t v97 = v180;
            goto LABEL_115;
          }
          ++v102;
          v101 += 2;
          v100 += 2;
          v99 += 8;
          --v97;
        }
        while (v97);
        id v4 = v156;
      }
      else
      {
        uint64_t v174 = 0;
      }

      int v5 = v158;
      if (v174 != v23)
      {
        v153 = [MEMORY[0x1E4F28B00] currentHandler];
        [v153 handleFailureInMethod:v163 object:self file:@"UICollectionViewFlowLayout.m" lineNumber:1496 description:@"not all items covered by _collectionView:layout:sizesForItemsInSection:"];

        int v5 = v158;
      }
    }
    else
    {
      if (v21) {
        uint64_t v40 = *(void **)(v21 + 96);
      }
      else {
        uint64_t v40 = 0;
      }
      id v168 = v40;
      [(UICollectionViewFlowLayout *)self itemSize];
      if (v23 >= 1)
      {
        double v43 = v41;
        double v44 = v42;
        for (uint64_t j = 0; v23 != j; ++j)
        {
          uint64_t v46 = -[_UIFlowLayoutSection addItem]((id *)v21);

          BOOL v47 = (*(_DWORD *)((unsigned char *)&self->super.super.isa + v182) & 1) == 0;
          if (*(_DWORD *)((unsigned char *)&self->super.super.isa + v182))
          {
            double v55 = [MEMORY[0x1E4F28D58] indexPathForRow:j inSection:v183];
            [v181 collectionView:v5 layout:self sizeForItemAtIndexPath:v55];
            double v52 = v56;
            double v53 = v57;

            int v58 = dyld_program_sdk_at_least();
            BOOL v59 = v52 < 0.0;
            if (v53 < 0.0) {
              BOOL v59 = 1;
            }
            if (v58)
            {
              if (v59)
              {
                double v49 = [MEMORY[0x1E4F28B00] currentHandler];
                v211.double width = v52;
                v211.double height = v53;
                double v60 = NSStringFromCGSize(v211);
                -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v49, "handleFailureInMethod:object:file:lineNumber:description:", v163, self, @"UICollectionViewFlowLayout.m", 1511, @"Collection view delegate returned a negative size %@ from -collectionView:layout:sizeForItemAtIndexPath: for item %ld in section %ld, which is not supported by flow layout. Delegate: %@; collection view: %@",
                  v60,
                  j,
                  v183,
                  v181,
                  self->super._collectionView);

                goto LABEL_70;
              }
            }
            else if (v59)
            {
              double v49 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25A378) + 8);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                v212.double width = v52;
                v212.double height = v53;
                NSStringFromCGSize(v212);
                double v74 = (UICollectionView *)objc_claimAutoreleasedReturnValue();
                uint64_t v75 = self->super._collectionView;
                *(_DWORD *)buf = 138413314;
                v201 = v74;
                __int16 v202 = 2048;
                uint64_t v203 = j;
                __int16 v204 = 2048;
                uint64_t v205 = v183;
                __int16 v206 = 2112;
                id v207 = v181;
                __int16 v208 = 2112;
                v209 = v75;
                _os_log_impl(&dword_1853B0000, v49, OS_LOG_TYPE_ERROR, "Collection view delegate returned a negative size %@ from -collectionView:layout:sizeForItemAtIndexPath: for item %ld in section %ld, which is not supported by flow layout. Delegate: %@; collection view: %@",
                  buf,
                  0x34u);
              }
LABEL_70:
              int v54 = 1;
LABEL_80:

              goto LABEL_81;
            }
            BOOL v47 = 0;
            int v54 = 1;
          }
          else
          {
            if ([(UICollectionViewFlowLayout *)self _estimatesSizes])
            {
              double v48 = [MEMORY[0x1E4F28D58] indexPathForRow:j inSection:v183];
              double v49 = [v4 objectForKeyedSubscript:v48];

              if (v49)
              {
                [v49 CGSizeValue];
                double v52 = v50;
                double v53 = v51;
                if (v167) {
                  double v50 = v51;
                }
                if (v50 < v166) {
                  goto LABEL_70;
                }
              }
              [(UICollectionViewFlowLayout *)self _effectiveEstimatedItemSize];
              double v52 = v61;
              double v53 = v62;
              int v54 = 0;
              goto LABEL_80;
            }
            BOOL v47 = 0;
            int v54 = 1;
            double v53 = v44;
            double v52 = v43;
          }
LABEL_81:
          int v63 = dyld_program_sdk_at_least();
          BOOL v64 = v52 < 0.0;
          if (v53 < 0.0) {
            BOOL v64 = 1;
          }
          if (v63)
          {
            if (v64)
            {
              double v65 = [MEMORY[0x1E4F28B00] currentHandler];
              [v65 handleFailureInMethod:v163, self, @"UICollectionViewFlowLayout.m", 1548, @"Negative sizes are not supported by flow layout. Collection view: %@", self->super._collectionView object file lineNumber description];
            }
          }
          else if (v64)
          {
            uint64_t v72 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25A380) + 8);
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              uint64_t v73 = self->super._collectionView;
              *(_DWORD *)buf = v154;
              v201 = v73;
              _os_log_impl(&dword_1853B0000, v72, OS_LOG_TYPE_ERROR, "Negative sizes are not supported by flow layout. Collection view: %@", buf, 0xCu);
            }
          }
          if (*((unsigned char *)v192 + 24))
          {
            double v66 = v196;
            double v67 = v196[4];
            double v68 = v196[5];
            if (v18 == v67 && v19 == v68)
            {
              v196[4] = v52;
              v66[5] = v53;
            }
            else if (v52 != v67 || v53 != v68)
            {
              *((unsigned char *)v192 + 24) = 0;
            }
          }
          if (v46)
          {
            if (v54) {
              char v71 = 4;
            }
            else {
              char v71 = 0;
            }
            *(unsigned char *)(v46 + 8) = v71 | v47 | *(unsigned char *)(v46 + 8) & 0xFA;
            *(void *)(v46 + 32) = 0;
            *(void *)(v46 + 40) = 0;
            *(double *)(v46 + 48) = v52;
            *(double *)(v46 + 56) = v53;
          }
        }
      }
    }

LABEL_128:
    if (*((unsigned char *)v192 + 24))
    {
      uint64_t v109 = v21 ? *(void **)(v21 + 96) : 0;
      id v110 = v109;
      [v110 removeAllObjects];

      if (v21)
      {
        *(_OWORD *)(v21 + 248) = *((_OWORD *)v196 + 2);
        *(unsigned char *)(v21 + 88) = 1;
      }
    }
    _Block_object_dispose(&v191, 8);
    _Block_object_dispose(&v195, 8);
    goto LABEL_134;
  }
LABEL_188:
}

- (CGSize)itemSize
{
  double width = self->_itemSize.width;
  double height = self->_itemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_updateContentSizeScrollingDimensionWithDelta:(double)a3
{
  if (a3 != 0.0)
  {
    if (self->_scrollDirection == 1)
    {
      self->_currentLayoutSize.double width = self->_currentLayoutSize.width + a3;
      p_contentSizeAdjustment = &self->_contentSizeAdjustment;
    }
    else
    {
      self->_currentLayoutSize.double height = self->_currentLayoutSize.height + a3;
      p_contentSizeAdjustment = (CGSize *)&self->_contentSizeAdjustment.height;
    }
    p_contentSizeAdjustment->double width = a3;
  }
}

- (CGFloat)minimumLineSpacing
{
  return self->_lineSpacing;
}

- (CGFloat)minimumInteritemSpacing
{
  return self->_interitemSpacing;
}

- (void)_updateItemsLayoutForRect:(CGRect)a3 allowsPartialUpdate:(BOOL)a4
{
  if (self->_data)
  {
    CGFloat height = a3.size.height;
    CGFloat width = a3.size.width;
    CGFloat y = a3.origin.y;
    CGFloat x = a3.origin.x;
    [(UICollectionViewFlowLayout *)self _dimensionFromCollectionView];
    if (v10 != 0.0)
    {
      data = self->_data;
      if (data)
      {
        BOOL horizontal = data->_horizontal;
        BOOL v13 = !data->_horizontal;
        data->_double dimension = v10;
      }
      else
      {
        BOOL horizontal = 0;
        BOOL v13 = 1;
      }
      p_currentLayoutSize = &self->_currentLayoutSize;
      self->_currentLayoutSize.CGFloat width = 0.0;
      self->_currentLayoutSize.CGFloat height = 0.0;
      uint64_t v38 = 0;
      id v39 = (double *)&v38;
      uint64_t v40 = 0x2020000000;
      uint64_t v41 = 0;
      int64_t sectionInsetReference = self->_sectionInsetReference;
      if (sectionInsetReference)
      {
        if (horizontal) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = 2;
        }
        -[UICollectionViewFlowLayout _adjustedSectionInsetForSectionInset:forAxis:](self, "_adjustedSectionInsetForSectionInset:forAxis:", v16, 0.0, 0.0, 0.0, 0.0);
        double v20 = v19;
        double v22 = v21;
        if (horizontal) {
          double v17 = v18;
        }
        v39[3] = v17 + v39[3];
      }
      else
      {
        double v22 = 0.0;
        double v20 = 0.0;
      }
      uint64_t v23 = self->_data;
      if (v23) {
        uint64_t v23 = (_UIFlowLayoutInfo *)v23->_sections;
      }
      double v24 = v23;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __76__UICollectionViewFlowLayout__updateItemsLayoutForRect_allowsPartialUpdate___block_invoke;
      v35[3] = &unk_1E52E61B0;
      *(CGFloat *)&v35[6] = x;
      *(CGFloat *)&v35[7] = y;
      *(CGFloat *)&v35[8] = width;
      *(CGFloat *)&v35[9] = height;
      BOOL v36 = a4;
      BOOL v37 = v13;
      v35[4] = self;
      v35[5] = &v38;
      [(_UIFlowLayoutInfo *)v24 enumerateObjectsUsingBlock:v35];

      if (sectionInsetReference)
      {
        if (horizontal) {
          double v25 = v22;
        }
        else {
          double v25 = v20;
        }
        v39[3] = v25 + v39[3];
      }
      if (horizontal)
      {
        double dimension = v39[3];
        uint64_t v27 = self->_data;
        if (!v27)
        {
          CGFloat v30 = 0.0;
LABEL_27:
          p_currentLayoutSize->CGFloat width = dimension;
          self->_currentLayoutSize.CGFloat height = v30;
          BOOL v31 = [(UICollectionViewFlowLayout *)self _estimatesSizes];
          double v32 = self->_data;
          if (v31)
          {
            if (!v32) {
              goto LABEL_35;
            }
          }
          else
          {
            if (!v32) {
              goto LABEL_35;
            }
            if (!v32->_leftToRight && v32->_horizontal)
            {
              double v33 = v32->_sections;
              v34[0] = MEMORY[0x1E4F143A8];
              v34[1] = 3221225472;
              v34[2] = __76__UICollectionViewFlowLayout__updateItemsLayoutForRect_allowsPartialUpdate___block_invoke_2;
              v34[3] = &unk_1E52E61D8;
              v34[4] = self;
              [(NSMutableArray *)v33 enumerateObjectsUsingBlock:v34];

              double v32 = self->_data;
              if (!v32) {
                goto LABEL_35;
              }
            }
          }
          v32->_contentSize = *p_currentLayoutSize;
LABEL_35:
          _Block_object_dispose(&v38, 8);
          return;
        }
        p_double dimension = &v27->_dimension;
      }
      else
      {
        double v29 = self->_data;
        if (v29) {
          double dimension = v29->_dimension;
        }
        else {
          double dimension = 0.0;
        }
        p_double dimension = v39 + 3;
      }
      CGFloat v30 = *p_dimension;
      goto LABEL_27;
    }
  }
}

- (double)_dimensionFromCollectionView
{
  id v3 = [(UICollectionViewLayout *)self collectionView];
  id v4 = v3;
  data = self->_data;
  if (data) {
    BOOL horizontal = data->_horizontal;
  }
  else {
    BOOL horizontal = 0;
  }
  [v3 bounds];
  double v8 = v7;
  double v10 = v9;
  [v4 _effectiveContentInset];
  double v13 = v8 - v11 - v12;
  double result = v10 - v14 - v15;
  if (!horizontal) {
    double result = v13;
  }
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (int64_t)_sectionArrayIndexForIndexPath:(id)a3
{
  uint64_t v4 = [a3 section];
  int v5 = [(UICollectionViewLayout *)self _sections];
  int64_t v6 = v4 - [v5 firstIndex];

  return v6;
}

- (BOOL)_shouldInvalidateLayoutForUpdatedSafeAreaInsets:(UIEdgeInsets)a3 fromOldInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v8 = a3.right;
  double v9 = a3.bottom;
  double v10 = a3.left;
  double v11 = a3.top;
  if (!_UISupportsShouldInvalidateForInsets()) {
    return 1;
  }
  return -[UICollectionViewFlowLayout _shouldInvalidateLayoutForOldInsets:newInsets:](self, "_shouldInvalidateLayoutForOldInsets:newInsets:", top, left, bottom, right, v11, v10, v9, v8);
}

- (BOOL)_shouldInvalidateLayoutForUpdatedLayoutMargins:(UIEdgeInsets)a3 fromOldMargins:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v8 = a3.right;
  double v9 = a3.bottom;
  double v10 = a3.left;
  double v11 = a3.top;
  if (!_UISupportsShouldInvalidateForInsets()) {
    return 1;
  }
  return -[UICollectionViewFlowLayout _shouldInvalidateLayoutForOldInsets:newInsets:](self, "_shouldInvalidateLayoutForOldInsets:newInsets:", top, left, bottom, right, v11, v10, v9, v8);
}

- (BOOL)_shouldInvalidateLayoutForOldInsets:(UIEdgeInsets)a3 newInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v8 = a3.right;
  double v9 = a3.bottom;
  double v10 = a3.left;
  double v11 = a3.top;
  unint64_t v12 = [(UICollectionViewFlowLayout *)self _layoutAxis];
  if (v12 == 1) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v12 == 2;
  }
  return !_UIEdgeInsetsEqualToInsetsAlongAxis(v13, v11, v10, v9, v8, top, left, bottom, right);
}

- (unint64_t)_layoutAxis
{
  UICollectionViewScrollDirection v2 = [(UICollectionViewFlowLayout *)self scrollDirection];
  if (v2) {
    return v2 == UICollectionViewScrollDirectionHorizontal;
  }
  else {
    return 2;
  }
}

- (UICollectionViewScrollDirection)scrollDirection
{
  return self->_scrollDirection;
}

- (void)setEstimatedItemSize:(CGSize)estimatedItemSize
{
  if (estimatedItemSize.width != self->_estimatedItemSize.width
    || estimatedItemSize.height != self->_estimatedItemSize.height)
  {
    self->_estimatedItemSize = estimatedItemSize;
    if (dyld_program_sdk_at_least())
    {
      if ([(UICollectionViewFlowLayout *)self _estimatesSizes]) {
        [(UICollectionViewFlowLayout *)self _resetCachedItems];
      }
      [(id)objc_opt_class() invalidationContextClass];
      id v5 = (id)objc_opt_new();
      [v5 _setInvalidateEverything:1];
      [(UICollectionViewFlowLayout *)self invalidateLayoutWithContext:v5];
    }
  }
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The invalidation context (%@) sent to -[UICollectionViewFlowLayout invalidateLayoutWithContext:] is not an instance of type UICollectionViewFlowLayoutInvalidationContext or a subclass. Collection view: %@", v4, self->super._collectionView format];
  }
  if (dyld_program_sdk_at_least()
    && [(UICollectionViewFlowLayout *)self _estimatesSizes]
    && (([v4 _retainExistingSizingInfoForEstimates] & 1) != 0
     || [v4 _intent] == 3
     && [(UICollectionView *)self->super._collectionView _dataSourceMatchesCurrentCounts]))
  {
    [(UICollectionViewFlowLayout *)self collectionViewContentSize];
    double v6 = v5;
    double v8 = v7;
    if (fabs(v5 * v7) >= 2.22044605e-16)
    {
      uint64_t v23 = 0;
      double v24 = &v23;
      uint64_t v25 = 0x3032000000;
      id v26 = __Block_byref_object_copy__43;
      uint64_t v27 = __Block_byref_object_dispose__43;
      -[_UIFlowLayoutInfo specifiedItemSizes]((uint64_t)self->_data);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      double v11 = [v4 _updateItems];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        double v14 = (void *)v24[5];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __58__UICollectionViewFlowLayout_invalidateLayoutWithContext___block_invoke;
        v19[3] = &unk_1E52E6138;
        v19[4] = self;
        id v20 = v4;
        double v22 = &v23;
        id v15 = v13;
        id v21 = v15;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        uint64_t v16 = (void *)v24[5];
        v24[5] = (uint64_t)v15;
        id v17 = v15;
      }
      -[_UIFlowLayoutInfo invalidate:]((uint64_t)self->_data, 0);
      [(UICollectionViewFlowLayout *)self _getSizingInfosWithExistingSizingDictionary:v24[5]];
      -[UICollectionViewFlowLayout _updateItemsLayoutForRect:allowsPartialUpdate:](self, "_updateItemsLayoutForRect:allowsPartialUpdate:", 0, 0.0, 0.0, v6, v8);
      [(UICollectionViewFlowLayout *)self _resetCachedItems];
      *((_DWORD *)&self->_gridLayoutFlags + 1) |= 0x180u;
      _Block_object_dispose(&v23, 8);
    }
    else
    {
      -[_UIFlowLayoutInfo invalidate:]((uint64_t)self->_data, 0);
      [(UICollectionViewFlowLayout *)self _resetCachedItems];
      *((_DWORD *)&self->_gridLayoutFlags + 1) &= 0xFFFFFE7F;
    }
  }
  else
  {
    if ((([v4 invalidateFlowLayoutAttributes] & 1) != 0
       || [v4 invalidateDataSourceCounts])
      && (*(unsigned char *)(&self->_gridLayoutFlags + 1) & 0x80) != 0)
    {
      -[_UIFlowLayoutInfo invalidate:]((uint64_t)self->_data, [v4 invalidateFlowLayoutDelegateMetrics] ^ 1);
      [(UICollectionViewFlowLayout *)self _resetCachedItems];
      if ([v4 invalidateFlowLayoutDelegateMetrics])
      {
        int v9 = 0;
      }
      else if ([(UICollectionViewFlowLayout *)self _estimatesSizes])
      {
        int v9 = 0;
      }
      else
      {
        int v9 = 256;
      }
      *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFE7F | v9;
    }
    double v10 = [v4 invalidatedItemIndexPaths];
    if ([v10 count])
    {
      [(NSMutableDictionary *)self->_cachedItemAttributes removeObjectsForKeys:v10];
      [(NSMutableDictionary *)self->_cachedItemFrames removeObjectsForKeys:v10];
    }
  }
  self->_contentSizeAdjustment = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_contentOffsetAdjustment = (CGPoint)*MEMORY[0x1E4F1DAD8];
  v18.receiver = self;
  v18.super_class = (Class)UICollectionViewFlowLayout;
  [(UICollectionViewLayout *)&v18 invalidateLayoutWithContext:v4];
}

- (void)_resetCachedItems
{
  [(NSMutableDictionary *)self->_cachedItemAttributes removeAllObjects];
  cachedItemFrames = self->_cachedItemFrames;
  [(NSMutableDictionary *)cachedItemFrames removeAllObjects];
}

- (id)_invalidationContextForUpdatedLayoutMargins:(UIEdgeInsets)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewFlowLayout;
  id v3 = -[UICollectionViewLayout _invalidationContextForUpdatedLayoutMargins:](&v5, sel__invalidationContextForUpdatedLayoutMargins_, a3.top, a3.left, a3.bottom, a3.right);
  if (dyld_program_sdk_at_least()) {
    [v3 _setIntent:7];
  }
  return v3;
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (void)_setCollectionView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewFlowLayout;
  [(UICollectionViewLayout *)&v4 _setCollectionView:a3];
  [(UICollectionViewFlowLayout *)self _updateCollectionViewScrollableAxis];
}

- (void)_updateCollectionViewScrollableAxis
{
  [(UIScrollView *)self->super._collectionView _setContentScrollsAlongXAxis:self->_scrollDirection == 1];
  collectionView = self->super._collectionView;
  BOOL v4 = self->_scrollDirection == 0;
  [(UIScrollView *)collectionView _setContentScrollsAlongYAxis:v4];
}

- (void)setMinimumLineSpacing:(CGFloat)minimumLineSpacing
{
  if (self->_lineSpacing != minimumLineSpacing && (*(unsigned char *)(&self->_gridLayoutFlags + 1) & 0x80) != 0)
  {
    self->_lineSpacing = minimumLineSpacing;
    [(UICollectionViewLayout *)self invalidateLayout];
  }
  else
  {
    self->_lineSpacing = minimumLineSpacing;
  }
}

- (void)setMinimumInteritemSpacing:(CGFloat)minimumInteritemSpacing
{
  if (self->_interitemSpacing != minimumInteritemSpacing && (*(unsigned char *)(&self->_gridLayoutFlags + 1) & 0x80) != 0)
  {
    self->_interitemSpacing = minimumInteritemSpacing;
    [(UICollectionViewLayout *)self invalidateLayout];
  }
  else
  {
    self->_interitemSpacing = minimumInteritemSpacing;
  }
}

- (void)setSectionInset:(UIEdgeInsets)sectionInset
{
  int v3 = *((_DWORD *)&self->_gridLayoutFlags + 1);
  p_sectionInset = &self->_sectionInset;
  if ((v3 & 8) != 0)
  {
    p_sectionInset->double top = sectionInset.top;
    self->_sectionInset.double left = sectionInset.left;
    self->_sectionInset.double bottom = sectionInset.bottom;
    self->_sectionInset.double right = sectionInset.right;
  }
  else
  {
    double bottom = self->_sectionInset.bottom;
    BOOL v6 = sectionInset.left == self->_sectionInset.left;
    if (sectionInset.top != p_sectionInset->top) {
      BOOL v6 = 0;
    }
    if (sectionInset.right != self->_sectionInset.right) {
      BOOL v6 = 0;
    }
    p_sectionInset->double top = sectionInset.top;
    self->_sectionInset.double left = sectionInset.left;
    if (sectionInset.bottom != bottom) {
      BOOL v6 = 0;
    }
    self->_sectionInset.double bottom = sectionInset.bottom;
    self->_sectionInset.double right = sectionInset.right;
    if ((v3 & 0x80) != 0 && !v6) {
      [(UICollectionViewLayout *)self invalidateLayout];
    }
  }
}

- (void)setScrollDirection:(UICollectionViewScrollDirection)scrollDirection
{
  if (self->_scrollDirection != scrollDirection && (*(unsigned char *)(&self->_gridLayoutFlags + 1) & 0x80) != 0)
  {
    self->_int64_t scrollDirection = scrollDirection;
    [(UICollectionViewLayout *)self invalidateLayout];
  }
  else
  {
    self->_int64_t scrollDirection = scrollDirection;
  }
  [(UICollectionViewFlowLayout *)self _updateCollectionViewScrollableAxis];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUpdateTranslator, 0);
  objc_storeStrong((id *)&self->_updateVisibleCellsContext, 0);
  objc_storeStrong((id *)&self->_cachedItemFrames, 0);
  objc_storeStrong((id *)&self->_cachedItemAttributes, 0);
  objc_storeStrong((id *)&self->_rowAlignmentsOptionsDictionary, 0);
  objc_storeStrong((id *)&self->_deletedSectionFootersAttributesDict, 0);
  objc_storeStrong((id *)&self->_deletedSectionHeadersAttributesDict, 0);
  objc_storeStrong((id *)&self->_deletedItemsAttributesDict, 0);
  objc_storeStrong((id *)&self->_insertedSectionFootersAttributesDict, 0);
  objc_storeStrong((id *)&self->_insertedSectionHeadersAttributesDict, 0);
  objc_storeStrong((id *)&self->_insertedItemsAttributesDict, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setItemSize:(CGSize)itemSize
{
  double height = itemSize.height;
  double width = itemSize.width;
  if (itemSize.width <= 0.0) {
    UICollectionViewFlowLayoutAlertForInvalidItemSize(self->super._collectionView, itemSize.width, itemSize.height);
  }
  p_itemSize = &self->_itemSize;
  if ((*(_WORD *)(&self->_gridLayoutFlags + 1) & 0x401) != 0)
  {
    p_itemSize->double width = width;
    self->_itemSize.double height = height;
  }
  else
  {
    double v7 = p_itemSize->width;
    double v8 = self->_itemSize.height;
    p_itemSize->double width = width;
    self->_itemSize.double height = height;
    if (width != v7 || height != v8)
    {
      int v10 = dyld_program_sdk_at_least();
      int v11 = *((_DWORD *)&self->_gridLayoutFlags + 1);
      if (v10)
      {
        v11 |= 0x80u;
        *((_DWORD *)&self->_gridLayoutFlags + 1) = v11;
      }
      if ((v11 & 0x80) != 0)
      {
        [(UICollectionViewLayout *)self invalidateLayout];
      }
    }
  }
}

void __76__UICollectionViewFlowLayout__updateItemsLayoutForRect_allowsPartialUpdate___block_invoke(uint64_t a1, double *a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) _estimatesSizes])
  {
    -[_UIFlowLayoutSection updateEstimatedSizeForSection:]((uint64_t)a2, a3);
    if (a2)
    {
      CGFloat v7 = a2[39];
      CGFloat v6 = a2[40];
      CGFloat v8 = a2[41];
      CGFloat v9 = a2[42];
    }
    else
    {
      CGFloat v6 = 0.0;
      CGFloat v8 = 0.0;
      CGFloat v9 = 0.0;
      CGFloat v7 = 0.0;
    }
    v28.origin.CGFloat x = v7;
    v28.origin.CGFloat y = v6;
    v28.size.double width = v8;
    v28.size.double height = v9;
    if (CGRectIntersectsRect(v28, *(CGRect *)(a1 + 48)))
    {
      CGFloat v10 = v7;
      CGFloat v11 = v6;
      CGFloat v12 = v8;
      double v13 = v9;
      if (*(unsigned char *)(a1 + 80))
      {
        v33.origin.CGFloat x = v7;
        v33.origin.CGFloat y = v6;
        v33.size.double width = v8;
        v33.size.double height = v9;
        *(CGRect *)(&v13 - 3) = CGRectIntersection(*(CGRect *)(a1 + 48), v33);
        CGFloat v10 = v14;
        CGFloat v11 = v15;
        CGFloat v12 = v16;
      }
      CGFloat rect = v13;
      v29.origin.CGFloat x = v7;
      v29.origin.CGFloat y = v6;
      v29.size.double width = v8;
      v29.size.double height = v9;
      CGFloat v17 = -CGRectGetMinX(v29);
      v30.origin.CGFloat x = v7;
      v30.origin.CGFloat y = v6;
      v30.size.double width = v8;
      v30.size.double height = v9;
      CGFloat v18 = -CGRectGetMinY(v30);
      v31.origin.CGFloat x = v10;
      v31.origin.CGFloat y = v11;
      v31.size.double width = v12;
      v31.size.double height = rect;
      CGRect v32 = CGRectOffset(v31, v17, v18);
      -[_UIFlowLayoutSection computeLayoutInRect:forSection:invalidating:invalidationContext:]((uint64_t)a2, a3, 0, 0, v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
    }
  }
  else
  {
    -[_UIFlowLayoutSection computeLayout]((uint64_t)a2);
  }
  if (a2)
  {
    double v20 = a2[39];
    double v19 = a2[40];
    double v21 = a2[41];
    double v22 = a2[42];
  }
  else
  {
    double v19 = 0.0;
    double v21 = 0.0;
    double v22 = 0.0;
    double v20 = 0.0;
  }
  int v23 = *(unsigned __int8 *)(a1 + 81);
  uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
  double v25 = *(double *)(v24 + 24);
  if (*(unsigned char *)(a1 + 81)) {
    double v26 = v22;
  }
  else {
    double v26 = v21;
  }
  *(double *)(v24 + 24) = v26 + v25;
  if (a2)
  {
    if (v23) {
      double v19 = v25;
    }
    else {
      double v20 = v25;
    }
    a2[39] = v20;
    a2[40] = v19;
    a2[41] = v21;
    a2[42] = v22;
  }
}

- (void)_finalizeCollectionViewUpdate:(id)a3
{
  insertedItemsAttributesDict = self->_insertedItemsAttributesDict;
  self->_insertedItemsAttributesDict = 0;
  id v5 = a3;

  insertedSectionHeadersAttributesDict = self->_insertedSectionHeadersAttributesDict;
  self->_insertedSectionHeadersAttributesDict = 0;

  insertedSectionFootersAttributesDict = self->_insertedSectionFootersAttributesDict;
  self->_insertedSectionFootersAttributesDict = 0;

  deletedItemsAttributesDict = self->_deletedItemsAttributesDict;
  self->_deletedItemsAttributesDict = 0;

  deletedSectionHeadersAttributesDict = self->_deletedSectionHeadersAttributesDict;
  self->_deletedSectionHeadersAttributesDict = 0;

  deletedSectionFootersAttributesDict = self->_deletedSectionFootersAttributesDict;
  self->_deletedSectionFootersAttributesDict = 0;

  currentUpdateTranslator = self->_currentUpdateTranslator;
  self->_currentUpdateTranslator = 0;

  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewFlowLayout;
  [(UICollectionViewLayout *)&v12 _finalizeCollectionViewUpdate:v5];
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)UICollectionViewFlowLayout;
  CGFloat v8 = -[UICollectionViewLayout invalidationContextForBoundsChange:](&v27, sel_invalidationContextForBoundsChange_);
  [v8 setInvalidateFlowLayoutDelegateMetrics:0];
  [v8 setInvalidateFlowLayoutAttributes:0];
  [(UICollectionViewLayout *)self bounds];
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  int64_t scrollDirection = self->_scrollDirection;
  if (scrollDirection == 1)
  {
    if (height == v12 && y == v10) {
      goto LABEL_5;
    }
LABEL_17:
    [v8 setInvalidateFlowLayoutAttributes:1];
    goto LABEL_18;
  }
  if (!scrollDirection && (width != v11 || x != v9)) {
    goto LABEL_17;
  }
LABEL_5:
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  CGRect v30 = CGRectUnion(v29, *(CGRect *)&v13);
  double v18 = v30.origin.x;
  double v19 = v30.origin.y;
  double v20 = v30.size.width;
  double v21 = v30.size.height;
  int v22 = *((_DWORD *)&self->_gridLayoutFlags + 1);
  if ((v22 & 0x800) != 0)
  {
    int v23 = -[UICollectionViewFlowLayout indexesForSectionHeadersInRect:usingData:](self, "indexesForSectionHeadersInRect:usingData:", self->_data, v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
    if ([v23 count]) {
      [v8 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionHeader" atIndexPaths:v23];
    }

    int v22 = *((_DWORD *)&self->_gridLayoutFlags + 1);
  }
  if ((v22 & 0x1000) != 0)
  {
    uint64_t v24 = -[UICollectionViewFlowLayout indexesForSectionFootersInRect:usingData:](self, "indexesForSectionFootersInRect:usingData:", self->_data, v18, v19, v20, v21);
    if ([v24 count]) {
      [v8 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionFooter" atIndexPaths:v24];
    }
  }
LABEL_18:
  if (dyld_program_sdk_at_least()
    && [(UICollectionViewFlowLayout *)self _estimatesSizes])
  {
    [v8 setInvalidateFlowLayoutDelegateMetrics:0];
    [v8 setInvalidateFlowLayoutAttributes:0];
    [v8 _setRetainExistingSizingInfoForEstimates:1];
  }
  return v8;
}

- (UICollectionViewFlowLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UICollectionViewFlowLayout;
  id v5 = [(UICollectionViewLayout *)&v20 init];
  CGFloat v6 = v5;
  if (v5)
  {
    UICollectionViewFlowLayoutCommonInit((uint64_t)v5);
    if ([v4 containsValueForKey:@"UIInteritemSpacing"])
    {
      [v4 decodeFloatForKey:@"UIInteritemSpacing"];
      v6->_interitemSpacing = v7;
    }
    if ([v4 containsValueForKey:@"UILineSpacing"])
    {
      [v4 decodeFloatForKey:@"UILineSpacing"];
      v6->_lineSpacing = v8;
    }
    if ([v4 containsValueForKey:@"UIItemSize"])
    {
      [v4 decodeCGSizeForKey:@"UIItemSize"];
      v6->_itemSize.double width = v9;
      v6->_itemSize.double height = v10;
    }
    if ([v4 containsValueForKey:@"UIHeaderReferenceSize"])
    {
      [v4 decodeCGSizeForKey:@"UIHeaderReferenceSize"];
      v6->_headerReferenceSize.double width = v11;
      v6->_headerReferenceSize.double height = v12;
    }
    if ([v4 containsValueForKey:@"UIFooterReferenceSize"])
    {
      [v4 decodeCGSizeForKey:@"UIFooterReferenceSize"];
      v6->_footerReferenceSize.double width = v13;
      v6->_footerReferenceSize.double height = v14;
    }
    if ([v4 containsValueForKey:@"UISectionInset"])
    {
      [v4 decodeUIEdgeInsetsForKey:@"UISectionInset"];
      v6->_sectionInset.double top = v15;
      v6->_sectionInset.double left = v16;
      v6->_sectionInset.double bottom = v17;
      v6->_sectionInset.double right = v18;
    }
    if ([v4 containsValueForKey:@"UISectionInsetReference"]) {
      v6->_int64_t sectionInsetReference = [v4 decodeIntegerForKey:@"UISectionInsetReference"];
    }
    if ([v4 containsValueForKey:@"UIScrollDirection"]) {
      v6->_int64_t scrollDirection = [v4 decodeIntegerForKey:@"UIScrollDirection"];
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double interitemSpacing = self->_interitemSpacing;
  id v15 = v4;
  if (interitemSpacing != 10.0)
  {
    *(float *)&double interitemSpacing = interitemSpacing;
    [v4 encodeFloat:@"UIInteritemSpacing" forKey:interitemSpacing];
    id v4 = v15;
  }
  double lineSpacing = self->_lineSpacing;
  if (lineSpacing != 10.0)
  {
    *(float *)&double lineSpacing = lineSpacing;
    [v15 encodeFloat:@"UILineSpacing" forKey:lineSpacing];
    id v4 = v15;
  }
  if (self->_itemSize.width != 50.0 || self->_itemSize.height != 50.0)
  {
    objc_msgSend(v15, "encodeCGSize:forKey:", @"UIItemSize");
    id v4 = v15;
  }
  double v8 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (self->_headerReferenceSize.width != *MEMORY[0x1E4F1DB30] || self->_headerReferenceSize.height != v9)
  {
    objc_msgSend(v15, "encodeCGSize:forKey:", @"UIHeaderReferenceSize");
    id v4 = v15;
  }
  if (self->_footerReferenceSize.width != v8 || self->_footerReferenceSize.height != v9)
  {
    objc_msgSend(v15, "encodeCGSize:forKey:", @"UIFooterReferenceSize");
    id v4 = v15;
  }
  double top = self->_sectionInset.top;
  if (self->_sectionInset.left != 0.0
    || top != 0.0
    || self->_sectionInset.right != 0.0
    || self->_sectionInset.bottom != 0.0)
  {
    [v15 encodeUIEdgeInsets:@"UISectionInset" forKey:top];
    id v4 = v15;
  }
  int64_t sectionInsetReference = self->_sectionInsetReference;
  if (sectionInsetReference)
  {
    [v15 encodeInteger:sectionInsetReference forKey:@"UISectionInsetReference"];
    id v4 = v15;
  }
  int64_t scrollDirection = self->_scrollDirection;
  if (scrollDirection)
  {
    [v15 encodeInteger:scrollDirection forKey:@"UIScrollDirection"];
    id v4 = v15;
  }
}

void __58__UICollectionViewFlowLayout_invalidateLayoutWithContext___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a2 item];
  uint64_t v8 = [a2 section];
  if (dyld_program_sdk_at_least() && (double v9 = *(void **)(*(void *)(a1 + 32) + 536)) != 0)
  {
    CGFloat v10 = [v9 finalIndexPathForInitialIndexPath:a2];
    if (v10)
    {
      CGFloat v11 = v10;
      uint64_t v7 = [v10 item];
      uint64_t v8 = [v11 section];

LABEL_26:
      int v23 = [MEMORY[0x1E4F28D58] indexPathForItem:v7 inSection:v8];
      [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:v23];
    }
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    CGFloat v12 = [*(id *)(a1 + 40) _updateItems];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (!v13)
    {

      goto LABEL_26;
    }
    uint64_t v14 = v13;
    uint64_t v15 = a1;
    id v24 = v6;
    uint64_t v16 = *(void *)v28;
    char v25 = 1;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v12);
        }
        CGFloat v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        double v19 = [v18 indexPathBeforeUpdate];
        objc_super v20 = [v18 indexPathAfterUpdate];
        if ([v18 updateAction] == 1)
        {
          if ([v19 section] == v8)
          {
            if ([v19 item] == v7) {
              char v25 = 0;
            }
            else {
              v7 -= [v19 item] < v7;
            }
          }
        }
        else if ([v18 updateAction])
        {
          uint64_t v21 = *(void *)(*(void *)(v15 + 56) + 8);
          int v22 = *(void **)(v21 + 40);
          *(void *)(v21 + 40) = 0;

          *a4 = 1;
        }
        else if ([v20 section] == v8 && objc_msgSend(v20, "item") <= v7)
        {
          ++v7;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);

    id v6 = v24;
    a1 = v15;
    if (v25) {
      goto LABEL_26;
    }
  }
}

- (id)indexesForSectionHeadersInRect:(CGRect)a3
{
  return 0;
}

- (id)indexesForSectionFootersInRect:(CGRect)a3
{
  return 0;
}

- (id)indexPathForItemAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3 usingData:(id)a4
{
  id v7 = a3;
  uint64_t v8 = a4;
  double v9 = [(UICollectionViewFlowLayout *)self _existingLayoutAttributesForItemAtIndexPath:v7];
  CGFloat v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    CGFloat v12 = [(UICollectionViewLayout *)self _sections];
    uint64_t v13 = [v7 section];
    uint64_t v14 = v13;
    if (v12)
    {
      if (([v12 containsIndex:v13] & 1) == 0)
      {
        objc_super v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, self, @"UICollectionViewFlowLayout.m", 615, @"request for layout attributes at index path (%@) when this flow layout only lays out sections in the set (%@)", v7, v12 object file lineNumber description];
      }
      uint64_t v14 = objc_msgSend(v12, "countOfIndexesInRange:", 0, v13);
    }
    uint64_t v15 = [v7 item];
    if (v8) {
      uint64_t v16 = (void *)v8[13];
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = v16;
    CGFloat v18 = [v17 objectAtIndexedSubscript:v14];
    [(UICollectionViewFlowLayout *)self _frameForItem:v15 inSection:v13 usingData:v18];
    -[UICollectionViewFlowLayout _fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:](self, "_fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:", v7);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (id)layoutAttributesForHeaderInSection:(int64_t)a3
{
  return [(UICollectionViewFlowLayout *)self layoutAttributesForHeaderInSection:a3 usingData:self->_data];
}

- (id)layoutAttributesForFooterInSection:(int64_t)a3
{
  return [(UICollectionViewFlowLayout *)self layoutAttributesForFooterInSection:a3 usingData:self->_data];
}

- (void)_calculateAttributesForRect:(CGRect)a3
{
  if ((*(unsigned char *)(&self->_gridLayoutFlags + 1) & 0x80) == 0) {
    -[UICollectionViewFlowLayout _fetchItemsInfoForRect:](self, "_fetchItemsInfoForRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
}

- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 size];
  double v9 = v8;
  double v11 = v10;
  [v7 size];
  if (v13 == v9 && v12 == v11)
  {
    v40.receiver = self;
    v40.super_class = (Class)UICollectionViewFlowLayout;
    id v17 = [(UICollectionViewLayout *)&v40 invalidationContextForPreferredLayoutAttributes:v6 withOriginalAttributes:v7];
    [v17 setInvalidateFlowLayoutAttributes:0];
    [v17 setInvalidateFlowLayoutDelegateMetrics:0];
  }
  else
  {
    data = self->_data;
    uint64_t v16 = [v7 indexPath];
    id v17 = [(_UIFlowLayoutInfo *)(uint64_t)data setSize:v9 forItemAtIndexPath:v11];

    if (dyld_program_sdk_at_least()
      && [(UICollectionViewFlowLayout *)self _estimatesSizes])
    {
      id v39 = v6;
      CGFloat v18 = [v7 indexPath];
      uint64_t v19 = [v18 section];

      uint64_t v38 = self;
      objc_super v20 = [(UICollectionView *)self->super._collectionView _collectionViewData];
      uint64_t v21 = -[UICollectionViewData existingSupplementaryLayoutAttributesInSection:]((uint64_t)v20, v19);

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v42 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            if (v27)
            {
              if ((*(_WORD *)(v27 + 288) & 3) == 0)
              {
                long long v28 = [*(id *)(*((void *)&v41 + 1) + 8 * i) indexPath];
                long long v29 = [v7 indexPath];
                int v30 = [v28 isEqual:v29];

                if (!v30
                  || (-[UIBarButtonItemGroup _items]((id *)v27),
                      CGRect v31 = objc_claimAutoreleasedReturnValue(),
                      -[UIBarButtonItemGroup _items]((id *)v7),
                      uint64_t v32 = objc_claimAutoreleasedReturnValue(),
                      char v33 = [v31 isEqualToString:v32],
                      v32,
                      v31,
                      (v33 & 1) == 0))
                {
                  double v34 = -[UIBarButtonItemGroup _items]((id *)v27);
                  double v35 = [(id)v27 indexPath];
                  uint64_t v45 = v35;
                  BOOL v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
                  [v17 invalidateSupplementaryElementsOfKind:v34 atIndexPaths:v36];
                }
              }
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v24);
      }

      self = v38;
      id v6 = v39;
    }
  }
  objc_msgSend(v17, "setContentOffsetAdjustment:", self->_contentOffsetAdjustment.x, self->_contentOffsetAdjustment.y);
  objc_msgSend(v17, "setContentSizeAdjustment:", self->_contentSizeAdjustment.width, self->_contentSizeAdjustment.height);

  return v17;
}

- (CGSize)_effectiveEstimatedItemSize
{
  double width = self->_estimatedItemSize.width;
  double height = self->_estimatedItemSize.height;
  if (width == 1.79769313e308 && height == 1.79769313e308)
  {
    data = self->_data;
    if (data)
    {
      uint64_t computedEstimatedCount = data->_computedEstimatedCount;
      double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v8 = *MEMORY[0x1E4F1DB30];
      if (computedEstimatedCount >= 1)
      {
        double v8 = data->_computedEstimatedSum.width / (double)computedEstimatedCount;
        double v7 = data->_computedEstimatedSum.height / (double)computedEstimatedCount;
      }
    }
    else
    {
      double v7 = 0.0;
      double v8 = 0.0;
    }
    BOOL v9 = v8 == *MEMORY[0x1E4F1DB30];
    BOOL v10 = v7 == *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double width = 50.0;
    if (v9 && v10) {
      double height = 50.0;
    }
    else {
      double height = v7;
    }
    if (!v9 || !v10) {
      double width = v8;
    }
  }
  result.double height = height;
  result.double width = width;
  return result;
}

void __74__UICollectionViewFlowLayout__existingLayoutAttributesForItemAtIndexPath___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_LoggingOnlyOnc.isa);
  UICollectionViewScrollDirection v2 = NSString;
  uint64_t v3 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) frame];
  id v4 = NSStringFromCGRect(v10);
  id v5 = NSStringFromCGRect(*(CGRect *)(a1 + 56));
  objc_msgSend(v2, "stringWithFormat:", @"UICollectionViewFlowLayout has cached frame mismatch for index path %@ - cached value: %@; expected value: %@",
    v3,
    v4,
    v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  NSLog(&stru_1ED0F89C0.isa, v8);
  if ([*(id *)(a1 + 48) isMemberOfClass:objc_opt_class()])
  {
    NSLog(&cfstr_ThisIsLikelyAB.isa);
  }
  else
  {
    id v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    NSLog(&cfstr_ThisIsLikelyOc.isa, v7);
  }
}

- (void)setHeaderReferenceSize:(CGSize)headerReferenceSize
{
  double height = headerReferenceSize.height;
  double width = headerReferenceSize.width;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (headerReferenceSize.width < 0.0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v7 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_6;
      }
      v20.double width = width;
      v20.double height = height;
      id v8 = NSStringFromCGSize(v20);
      collectionView = self->super._collectionView;
      int v14 = 138412546;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      id v17 = collectionView;
      _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Negative sizes of headers are not supported by flow layout. Invalid size: %@; collection view: %@",
        (uint8_t *)&v14,
        0x16u);
    }
    else
    {
      id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setHeaderReferenceSize____s_category) + 8);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      double v7 = v6;
      v19.double width = width;
      v19.double height = height;
      id v8 = NSStringFromCGSize(v19);
      BOOL v9 = self->super._collectionView;
      int v14 = 138412546;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Negative sizes of headers are not supported by flow layout. Invalid size: %@; collection view: %@",
        (uint8_t *)&v14,
        0x16u);
    }

LABEL_6:
  }
LABEL_7:
  int v10 = *((_DWORD *)&self->_gridLayoutFlags + 1);
  p_headerReferenceSize = &self->_headerReferenceSize;
  if ((v10 & 2) != 0)
  {
    p_headerReferenceSize->double width = width;
    self->_headerReferenceSize.double height = height;
  }
  else
  {
    BOOL v12 = width == p_headerReferenceSize->width;
    if (height != self->_headerReferenceSize.height) {
      BOOL v12 = 0;
    }
    p_headerReferenceSize->double width = width;
    self->_headerReferenceSize.double height = height;
    if ((v10 & 0x80) != 0 && !v12) {
      [(UICollectionViewLayout *)self invalidateLayout];
    }
  }
}

- (void)setFooterReferenceSize:(CGSize)footerReferenceSize
{
  double height = footerReferenceSize.height;
  double width = footerReferenceSize.width;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (footerReferenceSize.width < 0.0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v7 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_6;
      }
      v20.double width = width;
      v20.double height = height;
      id v8 = NSStringFromCGSize(v20);
      collectionView = self->super._collectionView;
      int v14 = 138412546;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      id v17 = collectionView;
      _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Negative sizes of footers are not supported by flow layout. Invalid size: %@; collection view: %@",
        (uint8_t *)&v14,
        0x16u);
    }
    else
    {
      id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setFooterReferenceSize____s_category) + 8);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      double v7 = v6;
      v19.double width = width;
      v19.double height = height;
      id v8 = NSStringFromCGSize(v19);
      BOOL v9 = self->super._collectionView;
      int v14 = 138412546;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Negative sizes of footers are not supported by flow layout. Invalid size: %@; collection view: %@",
        (uint8_t *)&v14,
        0x16u);
    }

LABEL_6:
  }
LABEL_7:
  int v10 = *((_DWORD *)&self->_gridLayoutFlags + 1);
  p_footerReferenceSize = &self->_footerReferenceSize;
  if ((v10 & 4) != 0)
  {
    p_footerReferenceSize->double width = width;
    self->_footerReferenceSize.double height = height;
  }
  else
  {
    BOOL v12 = width == p_footerReferenceSize->width;
    if (height != self->_footerReferenceSize.height) {
      BOOL v12 = 0;
    }
    p_footerReferenceSize->double width = width;
    self->_footerReferenceSize.double height = height;
    if ((v10 & 0x80) != 0 && !v12) {
      [(UICollectionViewLayout *)self invalidateLayout];
    }
  }
}

void __74__UICollectionViewFlowLayout__getSizingInfosWithExistingSizingDictionary___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, double a4, double a5)
{
  if (a4 < 0.0 || a5 < 0.0)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 64), *(void *)(*(void *)(a1 + 32) + 8));
  }
  if (a2 < a2 + a3)
  {
    double v10 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    do
    {
      uint64_t v12 = *(void *)(a1 + 40);
      if (*(unsigned char *)(a1 + 72))
      {
        if (v12) {
          double v13 = *(void **)(v12 + 96);
        }
        else {
          double v13 = 0;
        }
        id v14 = v13;
        uint64_t v15 = [v14 objectAtIndexedSubscript:a2];
      }
      else
      {
        uint64_t v15 = -[_UIFlowLayoutSection addItem]((id *)v12);
      }
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      if (*(unsigned char *)(v16 + 24))
      {
        uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
        double v18 = *(double *)(v17 + 32);
        double v19 = *(double *)(v17 + 40);
        if (v10 == v18 && v11 == v19)
        {
          *(double *)(v17 + 32) = a4;
          *(double *)(v17 + 40) = a5;
        }
        else if (a4 != v18 || a5 != v19)
        {
          *(unsigned char *)(v16 + 24) = 0;
        }
      }
      if (v15)
      {
        *(void *)(v15 + 32) = 0;
        *(void *)(v15 + 40) = 0;
        *(double *)(v15 + 48) = a4;
        *(double *)(v15 + 56) = a5;
      }

      ++a2;
      --a3;
    }
    while (a3);
  }
}

void __76__UICollectionViewFlowLayout__updateItemsLayoutForRect_allowsPartialUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  double v11 = v3;
  if (v3)
  {
    CGFloat v5 = v3[39];
    CGFloat v4 = v3[40];
    CGFloat v6 = v3[41];
    CGFloat v7 = v3[42];
  }
  else
  {
    CGFloat v4 = 0.0;
    CGFloat v6 = 0.0;
    CGFloat v7 = 0.0;
    CGFloat v5 = 0.0;
  }
  double v8 = *(double *)(*(void *)(a1 + 32) + 400);
  v13.origin.double x = v5;
  v13.origin.double y = v4;
  v13.size.double width = v6;
  v13.size.double height = v7;
  double Width = CGRectGetWidth(v13);
  v14.origin.double x = v5;
  v14.origin.double y = v4;
  v14.size.double width = v6;
  v14.size.double height = v7;
  double MinX = CGRectGetMinX(v14);
  if (v11)
  {
    v11[39] = v8 - Width - MinX;
    v11[40] = v4;
    v11[41] = v6;
    v11[42] = v7;
  }
}

void __53__UICollectionViewFlowLayout__fetchItemsInfoForRect___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  UICollectionViewScrollDirection v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("CollectionView", &UICollectionViewFlowLayoutSectionHeaderZPosition_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "An attempt to update layout information was detected while already in the process of computing the layout (i.e. reentrant call). This will result in unexpected behaviour or a crash. This may happen if a layout pass is triggered while calling out to a delegate. UICollectionViewFlowLayout instance is (%@)", (uint8_t *)&v4, 0xCu);
  }
}

- (CGRect)_frameForItem:(int64_t)a3 inSection:(int64_t)a4 usingData:(id)a5
{
  id v8 = a5;
  BOOL v9 = v8;
  if (v8)
  {
    double v11 = *((double *)v8 + 39);
    double v10 = *((double *)v8 + 40);
  }
  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
  }
  uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:a4];
  double v13 = -[_UIFlowLayoutSection frameForItemAtIndexPath:]((uint64_t)v9, v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  if (v9) {
    CGSize v20 = (void *)v9[12];
  }
  else {
    CGSize v20 = 0;
  }
  id v21 = v20;

  id v22 = [v21 objectAtIndex:a3];

  double v23 = 0.0;
  if (v22)
  {
    WeakRetained = (double *)objc_loadWeakRetained(v22 + 3);
    uint64_t v25 = WeakRetained;
    if (WeakRetained)
    {
      double v26 = WeakRetained[9];
      double v23 = WeakRetained[10];
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }
  double v26 = 0.0;
LABEL_8:
  double v27 = v13 + v11 + v26;
  double v28 = v10 + v23;
  long long v29 = [(UICollectionViewLayout *)self collectionView];
  [v29 _currentScreenScale];
  double v31 = v30;

  if ([(UICollectionViewFlowLayout *)self _roundsToScreenScale])
  {
    double v32 = v31;
    if (v31 == 0.0)
    {
      if (AdjustToScale_onceToken != -1) {
        dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_115);
      }
      double v32 = *(double *)&AdjustToScale___s;
    }
    if (v32 == 1.0) {
      double v27 = round(v27);
    }
    else {
      double v27 = round(v27 * v32) / v32;
    }
  }
  double v33 = v15 + v28;
  if ([(UICollectionViewFlowLayout *)self _roundsToScreenScale])
  {
    if (v31 == 0.0)
    {
      if (AdjustToScale_onceToken != -1) {
        dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_115);
      }
      double v31 = *(double *)&AdjustToScale___s;
    }
    if (v31 == 1.0) {
      double v33 = round(v33);
    }
    else {
      double v33 = round(v33 * v31) / v31;
    }
  }

  double v34 = v27;
  double v35 = v33;
  double v36 = v17;
  double v37 = v19;
  result.size.double height = v37;
  result.size.double width = v36;
  result.origin.double y = v35;
  result.origin.double x = v34;
  return result;
}

- (void)_setNeedsLayoutComputationWithoutInvalidation
{
  *((_DWORD *)&self->_gridLayoutFlags + 1) &= 0xFFFFFE7F;
}

- (id)initialLayoutAttributesForInsertedItemAtIndexPath:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_insertedItemsAttributesDict objectForKey:a3];
}

- (id)initialLayoutAttributesForHeaderInInsertedSection:(int64_t)a3
{
  insertedSectionHeadersAttributesDict = self->_insertedSectionHeadersAttributesDict;
  int v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:a3];
  uint64_t v5 = [(NSMutableDictionary *)insertedSectionHeadersAttributesDict objectForKey:v4];

  return v5;
}

- (id)initialLayoutAttributesForFooterInInsertedSection:(int64_t)a3
{
  insertedSectionFootersAttributesDict = self->_insertedSectionFootersAttributesDict;
  int v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:a3];
  uint64_t v5 = [(NSMutableDictionary *)insertedSectionFootersAttributesDict objectForKey:v4];

  return v5;
}

- (id)finalLayoutAttributesForDeletedItemAtIndexPath:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_deletedItemsAttributesDict objectForKey:a3];
}

- (id)finalLayoutAttributesForHeaderInDeletedSection:(int64_t)a3
{
  deletedSectionHeadersAttributesDict = self->_deletedSectionHeadersAttributesDict;
  int v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:a3];
  uint64_t v5 = [(NSMutableDictionary *)deletedSectionHeadersAttributesDict objectForKey:v4];

  return v5;
}

- (id)finalLayoutAttributesForFooterInDeletedSection:(int64_t)a3
{
  deletedSectionFootersAttributesDict = self->_deletedSectionFootersAttributesDict;
  int v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:a3];
  uint64_t v5 = [(NSMutableDictionary *)deletedSectionFootersAttributesDict objectForKey:v4];

  return v5;
}

- (CGSize)synchronizeLayout
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)_invalidateButKeepDelegateInfo
{
  id v3 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
  [v3 setInvalidateFlowLayoutDelegateMetrics:0];
  [(UICollectionViewLayout *)self _invalidateLayoutUsingContext:v3];
}

- (void)_invalidateButKeepAllInfo
{
  id v3 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
  [v3 setInvalidateFlowLayoutDelegateMetrics:0];
  [v3 setInvalidateFlowLayoutAttributes:0];
  [(UICollectionViewLayout *)self _invalidateLayoutUsingContext:v3];
}

- (void)_setRowAlignmentsOptions:(id)a3
{
}

- (id)_rowAlignmentOptions
{
  return self->_rowAlignmentsOptionsDictionary;
}

- (void)_setRoundsToScreenScale:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFDFF | v3;
}

- (void)_setHeaderFollowsSectionMargins:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFDFFF | v3;
}

- (void)_setFooterFollowsSectionMargins:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFBFFF | v3;
}

- (void)setSectionHeadersPinToVisibleBounds:(BOOL)sectionHeadersPinToVisibleBounds
{
  if (sectionHeadersPinToVisibleBounds) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFF7FF | v3;
}

- (BOOL)sectionHeadersPinToVisibleBounds
{
  return (*((unsigned __int8 *)&self->_gridLayoutFlags + 5) >> 3) & 1;
}

- (void)setSectionFootersPinToVisibleBounds:(BOOL)sectionFootersPinToVisibleBounds
{
  if (sectionFootersPinToVisibleBounds) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFEFFF | v3;
}

- (BOOL)sectionFootersPinToVisibleBounds
{
  return (*((unsigned __int8 *)&self->_gridLayoutFlags + 5) >> 4) & 1;
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  return (*(unsigned char *)&self->super._layoutFlags & 8) == 0 && self->_scrollDirection == 1;
}

- (CGRect)_frameForScrollingToFirstElementInSectionAtIndex:(int64_t)a3
{
  uint64_t v5 = [(UICollectionViewFlowLayout *)self layoutAttributesForHeaderInSection:"layoutAttributesForHeaderInSection:"];
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a3];
    uint64_t v5 = [(UICollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v6];
  }
  [v5 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (UIEdgeInsets)_adjustedSectionInsetForSectionInset:(UIEdgeInsets)a3 forAxis:(unint64_t)a4
{
  char v4 = a4;
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v10 = [(UICollectionViewLayout *)self collectionView];
  [v10 adjustedContentInset];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  int64_t sectionInsetReference = self->_sectionInsetReference;
  if (sectionInsetReference == 2)
  {
    double v33 = v12;
    double v34 = v14;
    double v35 = v16;
    double v36 = v18;
    uint64_t v24 = [(UICollectionViewLayout *)self collectionView];
    [v24 layoutMargins];
  }
  else
  {
    double v20 = 0.0;
    double v21 = 0.0;
    double v22 = 0.0;
    double v23 = 0.0;
    if (sectionInsetReference != 1) {
      goto LABEL_13;
    }
    double v33 = v12;
    double v34 = v14;
    double v35 = v16;
    double v36 = v18;
    uint64_t v24 = [(UICollectionViewLayout *)self collectionView];
    [v24 safeAreaInsets];
  }
  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;

  double v23 = fmax(top + v29 - v33, 0.0);
  if ((v4 & 2) == 0) {
    double v23 = top;
  }
  double v22 = fmax(left + v30 - v34, 0.0);
  double v21 = fmax(bottom + v31 - v35, 0.0);
  if ((v4 & 2) == 0) {
    double v21 = bottom;
  }
  if ((v4 & 1) == 0) {
    double v22 = left;
  }
  double v20 = fmax(right + v32 - v36, 0.0);
  if ((v4 & 1) == 0) {
    double v20 = right;
  }
LABEL_13:
  result.double right = v20;
  result.double bottom = v21;
  result.double left = v22;
  result.double top = v23;
  return result;
}

- (CGSize)headerReferenceSize
{
  double width = self->_headerReferenceSize.width;
  double height = self->_headerReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)footerReferenceSize
{
  double width = self->_footerReferenceSize.width;
  double height = self->_footerReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)estimatedItemSize
{
  double width = self->_estimatedItemSize.width;
  double height = self->_estimatedItemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UICollectionViewFlowLayoutSectionInsetReference)sectionInsetReference
{
  return self->_sectionInsetReference;
}

- (void)setSectionInsetReference:(UICollectionViewFlowLayoutSectionInsetReference)sectionInsetReference
{
  self->_int64_t sectionInsetReference = sectionInsetReference;
}

@end