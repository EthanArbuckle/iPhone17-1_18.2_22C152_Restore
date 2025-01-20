@interface SKUIStorePageCollectionViewLayout
+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;
- (BOOL)_allowsBackdropDecorationForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4;
- (BOOL)allowsPinningTransitions;
- (BOOL)rendersWithParallax;
- (BOOL)rendersWithPerspective;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGRect)_pinningFrameForStartingFrame:(CGRect)a3 itemPinningConfiguration:(id)a4 atIndexPath:(id)a5;
- (CGRect)_targetFrameForStartingFrame:(CGRect)a3 itemPinningConfiguration:(id)a4 layoutInformation:(id)a5 atIndexPath:(id)a6 returningIsPinning:(BOOL *)a7;
- (CGSize)collectionViewContentSize;
- (NSArray)indexPathsForGradientItems;
- (NSIndexSet)expandChildPageSectionsIndexSet;
- (NSString)backdropGroupName;
- (SKUIStorePageCollectionViewLayout)init;
- (UIEdgeInsets)_pinningContentInsetForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4;
- (double)overrideContentWidth;
- (id)_getCollectionViewUpdateItemForItemFromIndex:(int64_t)a3 initalLayout:(BOOL)a4;
- (id)_indexPathsForBackgroundGradients;
- (id)_indexPathsForPinningItems;
- (id)_itemPinningConfigurationForItemAtIndexPath:(id)a3;
- (id)_itemPinningLayoutInformationForItemAtIndexPath:(id)a3;
- (id)_layoutAttributesForGradientDecorationViewAtIndexPath:(id)a3 currentAttributes:(id)a4;
- (id)_layoutAttributesForPinnedBackdropDecorationViewAtIndexPath:(id)a3 pinningConfiguration:(id)a4 layoutInformation:(id)a5;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForUnpinnedItemAtIndexPath:(id)a3;
- (id)pinnedLayoutAttributesForItemsInRect:(CGRect)a3;
- (int64_t)_pinnedBackdropViewStyle;
- (int64_t)_pinningGroupForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4;
- (int64_t)_pinningStyleForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4;
- (int64_t)_pinningTransitionStyleForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4;
- (void)_alginCellsToTop:(id)a3;
- (void)_appendAdditionalLayoutAttributesForPinningItemsInRect:(CGRect)a3 toArray:(id)a4;
- (void)_calculatePinningLayoutInformation;
- (void)_configureCellLayoutAttributes:(id)a3 forItemWithPinningConfiguration:(id)a4 layoutInformation:(id)a5 atIndexPath:(id)a6 allowPinning:(BOOL)a7 returningIsPinning:(BOOL *)a8;
- (void)_invalidatePinningLayoutInformation;
- (void)_updateItemsLayoutForRect:(CGRect)a3;
- (void)init;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareLayout;
- (void)setAllowsPinningTransitions:(BOOL)a3;
- (void)setBackdropGroupName:(id)a3;
- (void)setExpandChildPageSectionsIndexSet:(id)a3;
- (void)setIndexPathsForGradientItems:(id)a3;
- (void)setOverrideContentWidth:(double)a3;
- (void)setRendersWithParallax:(BOOL)a3;
- (void)setRendersWithPerspective:(BOOL)a3;
@end

@implementation SKUIStorePageCollectionViewLayout

- (SKUIStorePageCollectionViewLayout)init
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIStorePageCollectionViewLayout init]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIStorePageCollectionViewLayout;
  v3 = [(UICollectionViewFlowLayout *)&v8 init];
  v4 = v3;
  if (v3)
  {
    v3->_allowsPinningTransitions = 1;
    [(UICollectionViewFlowLayout *)v3 setMinimumInteritemSpacing:0.0];
    [(UICollectionViewFlowLayout *)v4 setMinimumLineSpacing:0.0];
    uint64_t v5 = *MEMORY[0x1E4FB2860];
    v9[0] = *MEMORY[0x1E4FB2858];
    v9[1] = v5;
    v10[0] = &unk_1F1D61C40;
    v10[1] = &unk_1F1D61C40;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    [(UICollectionViewFlowLayout *)v4 _setRowAlignmentsOptions:v6];

    [(SKUIStorePageCollectionViewLayout *)v4 registerClass:objc_opt_class() forDecorationViewOfKind:0x1F1C95828];
    [(SKUIStorePageCollectionViewLayout *)v4 registerClass:objc_opt_class() forDecorationViewOfKind:0x1F1C90208];
  }
  return v4;
}

- (void)setExpandChildPageSectionsIndexSet:(id)a3
{
  v4 = (NSIndexSet *)[a3 copy];
  expandChildPageSectionsIndexSet = self->_expandChildPageSectionsIndexSet;
  self->_expandChildPageSectionsIndexSet = v4;

  if (!self->_expandChildPageSectionsIndexSet)
  {
    updateItems = self->_updateItems;
    self->_updateItems = 0;
  }
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (CGSize)collectionViewContentSize
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIStorePageCollectionViewLayout;
  [(UICollectionViewFlowLayout *)&v5 collectionViewContentSize];
  if (self->_overrideContentWidth > 0.00000011920929) {
    double overrideContentWidth = self->_overrideContentWidth;
  }
  result.height = v4;
  result.width = overrideContentWidth;
  return result;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SKUIStorePageCollectionViewLayout;
  objc_super v5 = [(SKUIStorePageCollectionViewLayout *)&v29 initialLayoutAttributesForAppearingItemAtIndexPath:v4];
  expandChildPageSectionsIndexSet = self->_expandChildPageSectionsIndexSet;
  if (expandChildPageSectionsIndexSet
    && -[NSIndexSet containsIndex:](expandChildPageSectionsIndexSet, "containsIndex:", [v4 section])
    && self->_updateItems)
  {
    v7 = -[SKUIStorePageCollectionViewLayout _getCollectionViewUpdateItemForItemFromIndex:initalLayout:](self, "_getCollectionViewUpdateItemForItemFromIndex:initalLayout:", [v4 section], 1);
    uint64_t v8 = [v7 updateAction];
    if (!v7 || v8) {
      goto LABEL_13;
    }
    v9 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
    int64_t v10 = [(NSIndexSet *)self->_expandChildPageSectionsIndexSet firstIndex];
    uint64_t v11 = [v9 numberOfSections];
    uint64_t v12 = v11 - [(NSIndexSet *)self->_expandChildPageSectionsIndexSet count];
    if (v10 >= v12)
    {
      uint64_t v16 = [v9 numberOfItemsInSection:v12 - 1];
      double v17 = 5.0;
      uint64_t v15 = v12 - 1;
      if (v12 < 1) {
        goto LABEL_12;
      }
      uint64_t v13 = v16 - 1;
      if (v16 < 1) {
        goto LABEL_12;
      }
      v14 = (void *)MEMORY[0x1E4F28D58];
    }
    else
    {
      uint64_t v13 = [v9 numberOfItemsInSection:v10 - 1] - 1;
      v14 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v15 = v10 - 1;
    }
    v18 = [v14 indexPathForItem:v13 inSection:v15];
    v19 = [v9 cellForItemAtIndexPath:v18];

    [v19 frame];
    double v21 = v20;
    [v19 frame];
    double v23 = v21 + v22;

    double v17 = v23 + 5.0;
LABEL_12:
    objc_msgSend(v5, "frame", v13, v15);
    double v25 = v24;
    [v5 frame];
    double v27 = v26;
    [v5 frame];
    objc_msgSend(v5, "setFrame:", v25, v17, v27);

LABEL_13:
  }

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SKUIStorePageCollectionViewLayout;
  objc_super v5 = [(SKUIStorePageCollectionViewLayout *)&v28 finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
  expandChildPageSectionsIndexSet = self->_expandChildPageSectionsIndexSet;
  if (expandChildPageSectionsIndexSet
    && -[NSIndexSet containsIndex:](expandChildPageSectionsIndexSet, "containsIndex:", [v4 section])
    && self->_updateItems)
  {
    v7 = -[SKUIStorePageCollectionViewLayout _getCollectionViewUpdateItemForItemFromIndex:initalLayout:](self, "_getCollectionViewUpdateItemForItemFromIndex:initalLayout:", [v4 section], 0);
    uint64_t v8 = [v7 updateAction];
    if (!v7 || v8 != 1) {
      goto LABEL_13;
    }
    v9 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
    int64_t v10 = [(NSIndexSet *)self->_expandChildPageSectionsIndexSet firstIndex];
    uint64_t v11 = [v9 numberOfSections];
    if (v10 >= v11)
    {
      uint64_t v15 = v11;
      uint64_t v16 = [v9 numberOfItemsInSection:v11 - 1];
      double v17 = 0.0;
      uint64_t v14 = v15 - 1;
      if (v15 < 1) {
        goto LABEL_12;
      }
      uint64_t v12 = v16 - 1;
      if (v16 < 1) {
        goto LABEL_12;
      }
      uint64_t v13 = (void *)MEMORY[0x1E4F28D58];
    }
    else
    {
      uint64_t v12 = [v9 numberOfItemsInSection:v10 - 1] - 1;
      uint64_t v13 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v14 = v10 - 1;
    }
    v18 = [v13 indexPathForItem:v12 inSection:v14];
    v19 = [v9 cellForItemAtIndexPath:v18];

    [v19 frame];
    double v21 = v20;
    [v19 frame];
    double v17 = v21 + v22;

LABEL_12:
    objc_msgSend(v5, "frame", v12, v14);
    double v24 = v23;
    [v5 frame];
    double v26 = v25;
    [v5 frame];
    objc_msgSend(v5, "setFrame:", v24, v17, v26);

LABEL_13:
  }

  return v5;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)SKUIStorePageCollectionViewLayout;
  uint64_t v8 = -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v27, sel_invalidationContextForBoundsChange_);
  v9 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  int64_t v18 = [(UICollectionViewFlowLayout *)self scrollDirection];
  BOOL v19 = y != v13;
  if (height == v17)
  {
    unsigned int v20 = 0;
  }
  else
  {
    BOOL v19 = 1;
    unsigned int v20 = 1;
  }
  BOOL v21 = x != v11;
  if (width == v15)
  {
    unsigned int v22 = 0;
  }
  else
  {
    BOOL v21 = 1;
    unsigned int v22 = 1;
  }
  if (v18)
  {
    BOOL v21 = 0;
    unsigned int v22 = 0;
  }
  if (v18 == 1) {
    BOOL v23 = v19;
  }
  else {
    BOOL v23 = v21;
  }
  if (v18 == 1) {
    uint64_t v24 = v20;
  }
  else {
    uint64_t v24 = v22;
  }
  [v8 setInvalidateFlowLayoutAttributes:v23];
  [v8 setInvalidateFlowLayoutDelegateMetrics:v24];
  if (([v8 invalidateEverything] & 1) == 0 && (objc_msgSend(v8, "invalidateDataSourceCounts") & 1) == 0)
  {
    double v25 = [(SKUIStorePageCollectionViewLayout *)self _indexPathsForPinningItems];
    if ([v25 count])
    {
      [v8 invalidateItemsAtIndexPaths:v25];
      [v8 invalidateDecorationElementsOfKind:0x1F1C95828 atIndexPaths:v25];
    }
  }

  return v8;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  if (([v4 invalidateDataSourceCounts] & 1) != 0
    || [v4 invalidateEverything])
  {
    self->_hasValidPinnedBackdropViewStyle = 0;
    indexPathToItemPinningConfiguration = self->_indexPathToItemPinningConfiguration;
    self->_indexPathToItemPinningConfiguration = 0;

    indexPathsForPinningItems = self->_indexPathsForPinningItems;
    self->_indexPathsForPinningItems = 0;

    indexPathsForGradientItems = self->_indexPathsForGradientItems;
    self->_indexPathsForGradientItems = 0;

    self->_hasValidIndexPathsForPinningItems = 0;
    self->_hasValidGradientIndexPaths = 0;
    [(SKUIStorePageCollectionViewLayout *)self _invalidatePinningLayoutInformation];
  }
  if (([v4 invalidateFlowLayoutAttributes] & 1) != 0
    || ([v4 invalidateFlowLayoutDelegateMetrics] & 1) != 0
    || [v4 invalidateItemPinningLayoutInformation])
  {
    [(SKUIStorePageCollectionViewLayout *)self _invalidatePinningLayoutInformation];
  }
  if ([v4 invalidatePinnedBackdropViewStyle]) {
    self->_hasValidPinnedBackdropViewStyle = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIStorePageCollectionViewLayout;
  [(UICollectionViewFlowLayout *)&v8 invalidateLayoutWithContext:v4];
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:0x1F1C95828])
  {
    objc_super v8 = [(SKUIStorePageCollectionViewLayout *)self _itemPinningConfigurationForItemAtIndexPath:v7];
    v9 = [(SKUIStorePageCollectionViewLayout *)self _itemPinningLayoutInformationForItemAtIndexPath:v7];
    double v10 = [(SKUIStorePageCollectionViewLayout *)self _layoutAttributesForPinnedBackdropDecorationViewAtIndexPath:v7 pinningConfiguration:v8 layoutInformation:v9];

    if (v10) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (![v6 isEqualToString:0x1F1C90208]
    || (+[UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:0x1F1C90208 withIndexPath:v7], (double v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_6:
    v12.receiver = self;
    v12.super_class = (Class)SKUIStorePageCollectionViewLayout;
    double v10 = [(SKUIStorePageCollectionViewLayout *)&v12 layoutAttributesForDecorationViewOfKind:v6 atIndexPath:v7];
  }
LABEL_7:

  return v10;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  ++self->_inLayoutAttributesForElementsCount;
  v35.receiver = self;
  v35.super_class = (Class)SKUIStorePageCollectionViewLayout;
  objc_super v8 = [(UICollectionViewFlowLayout *)&v35 layoutAttributesForElementsInRect:sel_layoutAttributesForElementsInRect_];
  v9 = (void *)[v8 mutableCopy];

  -[SKUIStorePageCollectionViewLayout _appendAdditionalLayoutAttributesForPinningItemsInRect:toArray:](self, "_appendAdditionalLayoutAttributesForPinningItemsInRect:toArray:", v9, x, y, width, height);
  --self->_inLayoutAttributesForElementsCount;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    objc_super v29 = 0;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        double v16 = objc_msgSend(v15, "indexPath", v29);
        if (![v15 representedElementCategory])
        {
          double v17 = [(SKUIStorePageCollectionViewLayout *)self _indexPathsForPinningItems];
          uint64_t v18 = [v17 containsObject:v16];

          if (v18)
          {
            BOOL v19 = [(SKUIStorePageCollectionViewLayout *)self _itemPinningLayoutInformationForItemAtIndexPath:v16];
            unsigned int v20 = [(SKUIStorePageCollectionViewLayout *)self _itemPinningConfigurationForItemAtIndexPath:v16];
          }
          else
          {
            unsigned int v20 = 0;
            BOOL v19 = 0;
          }
          char v30 = 0;
          [(SKUIStorePageCollectionViewLayout *)self _configureCellLayoutAttributes:v15 forItemWithPinningConfiguration:v20 layoutInformation:v19 atIndexPath:v16 allowPinning:v18 returningIsPinning:&v30];
          if (v30
            && [(SKUIStorePageCollectionViewLayout *)self _allowsBackdropDecorationForItemPinningConfiguration:v20 atIndexPath:v16])
          {
            BOOL v21 = [(SKUIStorePageCollectionViewLayout *)self _layoutAttributesForPinnedBackdropDecorationViewAtIndexPath:v16 pinningConfiguration:v20 layoutInformation:v19];
            if (v21)
            {
              unsigned int v22 = v29;
              if (!v29) {
                unsigned int v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
              }
              objc_msgSend(v22, "addObject:", v21, v22);
            }
          }
        }
        BOOL v23 = [(SKUIStorePageCollectionViewLayout *)self _indexPathsForBackgroundGradients];
        int v24 = [v23 containsObject:v16];

        if (v24)
        {
          double v25 = [(SKUIStorePageCollectionViewLayout *)self _layoutAttributesForGradientDecorationViewAtIndexPath:v16 currentAttributes:v15];
          if (v25)
          {
            double v26 = v29;
            if (!v29) {
              double v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
            }
            objc_msgSend(v26, "addObject:", v25, v26);
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v12);
  }
  else
  {
    objc_super v29 = 0;
  }

  objc_super v27 = v29;
  if ([v29 count]) {
    [v10 addObjectsFromArray:v29];
  }
  -[SKUIStorePageCollectionViewLayout _alginCellsToTop:](self, "_alginCellsToTop:", v10, v29);

  return v10;
}

- (void)_alginCellsToTop:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [(SKUIStorePageCollectionViewLayout *)self _indexPathsForPinningItems];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v58 count:16];
  id v47 = v5;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v54 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        double v14 = [v13 indexPath];
        char v15 = [v7 containsObject:v14];

        if ((v15 & 1) == 0 && ![v13 representedElementCategory])
        {
          [v13 frame];
          double v17 = v16;
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;
          if ([v6 count])
          {
            unint64_t v24 = 0;
            CGFloat rect = v23;
            while (1)
            {
              double v25 = [v6 objectAtIndex:v24];
              [v25 CGRectValue];
              CGFloat v27 = v26;
              CGFloat v29 = v28;
              CGFloat v31 = v30;
              CGFloat v33 = v32;
              v60.origin.double x = v17;
              v60.origin.double y = v19;
              v60.size.double width = v21;
              v60.size.double height = v23;
              double MidY = CGRectGetMidY(v60);
              v61.origin.double x = v27;
              v61.origin.double y = v29;
              v61.size.double width = v31;
              v61.size.double height = v33;
              if (MidY > CGRectGetMinY(v61))
              {
                v62.origin.double x = v17;
                v62.origin.double y = v19;
                v62.size.double width = v21;
                v62.size.double height = rect;
                double v35 = CGRectGetMidY(v62);
                v63.origin.double x = v27;
                v63.origin.double y = v29;
                v63.size.double width = v31;
                v63.size.double height = v33;
                if (v35 < CGRectGetMaxY(v63)) {
                  break;
                }
              }

              ++v24;
              double v23 = rect;
              if (v24 >= [v6 count]) {
                goto LABEL_13;
              }
            }
            uint64_t v37 = [v5 objectAtIndex:v24];
            [v37 addObject:v13];
            v64.origin.double x = v27;
            v64.origin.double y = v29;
            v64.size.double width = v31;
            v64.size.double height = v33;
            v66.origin.double x = v17;
            v66.origin.double y = v19;
            v66.size.double width = v21;
            v66.size.double height = rect;
            CGRect v65 = CGRectUnion(v64, v66);
            v38 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v65.origin.x, v65.origin.y, v65.size.width, v65.size.height);
            [v6 replaceObjectAtIndex:v24 withObject:v38];

            id v5 = v47;
          }
          else
          {
LABEL_13:
            v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v13, 0);
            [v5 addObject:v36];

            double v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v17, v19, v21, v23);
            [v6 addObject:v25];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v10);
  }

  if ([v6 count])
  {
    unint64_t v39 = 0;
    do
    {
      v40 = [v6 objectAtIndex:v39];
      [v40 CGRectValue];
      v41 = [v5 objectAtIndex:v39];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v43; ++j)
          {
            if (*(void *)v50 != v44) {
              objc_enumerationMutation(v41);
            }
            v46 = *(void **)(*((void *)&v49 + 1) + 8 * j);
            [v46 frame];
            objc_msgSend(v46, "setFrame:");
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v49 objects:v57 count:16];
        }
        while (v43);
      }

      ++v39;
      id v5 = v47;
    }
    while (v39 < [v6 count]);
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SKUIStorePageCollectionViewLayout;
  id v5 = [(UICollectionViewFlowLayout *)&v12 layoutAttributesForItemAtIndexPath:v4];
  id v6 = v5;
  if (!self->_inLayoutAttributesForElementsCount && ![v5 representedElementCategory])
  {
    id v7 = [(SKUIStorePageCollectionViewLayout *)self _indexPathsForPinningItems];
    uint64_t v8 = [v7 containsObject:v4];

    if (v8)
    {
      uint64_t v9 = [(SKUIStorePageCollectionViewLayout *)self _itemPinningLayoutInformationForItemAtIndexPath:v4];
      uint64_t v10 = [(SKUIStorePageCollectionViewLayout *)self _itemPinningConfigurationForItemAtIndexPath:v4];
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v9 = 0;
    }
    [(SKUIStorePageCollectionViewLayout *)self _configureCellLayoutAttributes:v6 forItemWithPinningConfiguration:v10 layoutInformation:v9 atIndexPath:v4 allowPinning:v8 returningIsPinning:0];
  }

  return v6;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (NSArray *)a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [(SKUIStorePageCollectionViewLayout *)self _invalidatePinningLayoutInformation];
        uint64_t v10 = [v9 indexPathBeforeUpdate];
        if (v10)
        {
          uint64_t v11 = [(NSMapTable *)self->_indexPathToItemPinningConfiguration objectForKey:v10];
          if (v11)
          {
            objc_super v12 = [v9 indexPathAfterUpdate];
            [(NSMapTable *)self->_indexPathToItemPinningConfiguration removeObjectForKey:v10];
            if (v12) {
              [(NSMapTable *)self->_indexPathToItemPinningConfiguration setObject:v11 forKey:v12];
            }
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  updateItems = self->_updateItems;
  self->_updateItems = v4;
  double v14 = v4;

  v15.receiver = self;
  v15.super_class = (Class)SKUIStorePageCollectionViewLayout;
  [(SKUIStorePageCollectionViewLayout *)&v15 prepareForCollectionViewUpdates:v14];
}

- (void)prepareLayout
{
  v14.receiver = self;
  v14.super_class = (Class)SKUIStorePageCollectionViewLayout;
  [(UICollectionViewFlowLayout *)&v14 prepareLayout];
  v3 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
  id v4 = [v3 delegate];
  *(unsigned char *)&self->_collectionViewDelegateFlags = *(unsigned char *)&self->_collectionViewDelegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->_collectionViewDelegateFlags = *(unsigned char *)&self->_collectionViewDelegateFlags & 0xFD | v5;
  if (objc_opt_respondsToSelector()) {
    char v6 = 4;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_collectionViewDelegateFlags = *(unsigned char *)&self->_collectionViewDelegateFlags & 0xFB | v6;
  if (objc_opt_respondsToSelector()) {
    char v7 = 8;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)&self->_collectionViewDelegateFlags = *(unsigned char *)&self->_collectionViewDelegateFlags & 0xF7 | v7;
  if (objc_opt_respondsToSelector()) {
    char v8 = 16;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_collectionViewDelegateFlags = *(unsigned char *)&self->_collectionViewDelegateFlags & 0xEF | v8;
  if (objc_opt_respondsToSelector()) {
    char v9 = 32;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)&self->_collectionViewDelegateFlags = *(unsigned char *)&self->_collectionViewDelegateFlags & 0xDF | v9;
  uint64_t v10 = [v3 backgroundColor];
  collectionViewBackgroundColor = self->_collectionViewBackgroundColor;
  self->_collectionViewBackgroundColor = v10;

  id v12 = [(SKUIStorePageCollectionViewLayout *)self _indexPathsForPinningItems];
  id v13 = [(SKUIStorePageCollectionViewLayout *)self _indexPathsForBackgroundGradients];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double y = a3.origin.y;
  v10.receiver = self;
  v10.super_class = (Class)SKUIStorePageCollectionViewLayout;
  if (-[UICollectionViewFlowLayout shouldInvalidateLayoutForBoundsChange:](&v10, sel_shouldInvalidateLayoutForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    return 1;
  }
  char v6 = [(SKUIStorePageCollectionViewLayout *)self _indexPathsForPinningItems];
  if ([v6 count])
  {
    char v7 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
    [v7 bounds];
    BOOL v5 = y != v8;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_updateItemsLayoutForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_overrideContentWidth >= 0.00000011920929)
  {
    double v8 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
    [v8 setOverrideBoundsWidth:self->_overrideContentWidth];
    v9.receiver = self;
    v9.super_class = (Class)SKUIStorePageCollectionViewLayout;
    -[SKUIStorePageCollectionViewLayout _updateItemsLayoutForRect:](&v9, sel__updateItemsLayoutForRect_, x, y, width, height);
    [v8 setOverrideBoundsWidth:0.0];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SKUIStorePageCollectionViewLayout;
    -[SKUIStorePageCollectionViewLayout _updateItemsLayoutForRect:](&v10, sel__updateItemsLayoutForRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
}

- (id)layoutAttributesForUnpinnedItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SKUIStorePageCollectionViewLayout;
  BOOL v5 = [(UICollectionViewFlowLayout *)&v12 layoutAttributesForItemAtIndexPath:v4];
  char v6 = v5;
  if (!self->_inLayoutAttributesForElementsCount && ![v5 representedElementCategory])
  {
    char v7 = [(SKUIStorePageCollectionViewLayout *)self _indexPathsForPinningItems];
    int v8 = [v7 containsObject:v4];

    if (v8)
    {
      objc_super v9 = [(SKUIStorePageCollectionViewLayout *)self _itemPinningLayoutInformationForItemAtIndexPath:v4];
      objc_super v10 = [(SKUIStorePageCollectionViewLayout *)self _itemPinningConfigurationForItemAtIndexPath:v4];
    }
    else
    {
      objc_super v10 = 0;
      objc_super v9 = 0;
    }
    [(SKUIStorePageCollectionViewLayout *)self _configureCellLayoutAttributes:v6 forItemWithPinningConfiguration:v10 layoutInformation:v9 atIndexPath:v4 allowPinning:0 returningIsPinning:0];
  }

  return v6;
}

- (id)pinnedLayoutAttributesForItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  ++self->_inLayoutAttributesForElementsCount;
  v28.receiver = self;
  v28.super_class = (Class)SKUIStorePageCollectionViewLayout;
  int v8 = [(UICollectionViewFlowLayout *)&v28 layoutAttributesForElementsInRect:sel_layoutAttributesForElementsInRect_];
  objc_super v9 = (void *)[v8 mutableCopy];

  -[SKUIStorePageCollectionViewLayout _appendAdditionalLayoutAttributesForPinningItemsInRect:toArray:](self, "_appendAdditionalLayoutAttributesForPinningItemsInRect:toArray:", v9, x, y, width, height);
  --self->_inLayoutAttributesForElementsCount;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    objc_super v12 = 0;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        objc_super v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (![v15 representedElementCategory])
        {
          long long v16 = [v15 indexPath];
          long long v17 = [(SKUIStorePageCollectionViewLayout *)self _indexPathsForPinningItems];
          uint64_t v18 = [v17 containsObject:v16];

          if (v18)
          {
            long long v19 = [(SKUIStorePageCollectionViewLayout *)self _itemPinningLayoutInformationForItemAtIndexPath:v16];
            double v20 = [(SKUIStorePageCollectionViewLayout *)self _itemPinningConfigurationForItemAtIndexPath:v16];
          }
          else
          {
            double v20 = 0;
            long long v19 = 0;
          }
          char v23 = 0;
          [(SKUIStorePageCollectionViewLayout *)self _configureCellLayoutAttributes:v15 forItemWithPinningConfiguration:v20 layoutInformation:v19 atIndexPath:v16 allowPinning:v18 returningIsPinning:&v23];
          if (v23)
          {
            [v15 frame];
            -[SKUIStorePageCollectionViewLayout _pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:](self, "_pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:", v20, v16);
            objc_msgSend(v15, "setFrame:");
            if (!v12) {
              objc_super v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
            }
            [v12 addObject:v15];
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v11);
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

- (void)setAllowsPinningTransitions:(BOOL)a3
{
  if (self->_allowsPinningTransitions != a3)
  {
    self->_allowsPinningTransitions = a3;
    [(SKUIStorePageCollectionViewLayout *)self _invalidatePinningLayoutInformation];
    id v4 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
    [v4 setInvalidateItemPinningLayoutInformation:1];
    [(SKUIStorePageCollectionViewLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (void)setBackdropGroupName:(id)a3
{
  id v4 = (NSString *)a3;
  backdropGroupName = self->_backdropGroupName;
  if (backdropGroupName != v4)
  {
    uint64_t v10 = v4;
    backdropGroupName = (NSString *)[(NSString *)backdropGroupName isEqualToString:v4];
    id v4 = v10;
    if ((backdropGroupName & 1) == 0)
    {
      char v6 = (NSString *)[(NSString *)v10 copy];
      char v7 = self->_backdropGroupName;
      self->_backdropGroupName = v6;

      int v8 = [(SKUIStorePageCollectionViewLayout *)self _indexPathsForPinningItems];
      if ([v8 count])
      {
        id v9 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
        [v9 setInvalidateItemPinningLayoutInformation:0];
        [v9 setInvalidateFlowLayoutDelegateMetrics:0];
        [v9 setInvalidateFlowLayoutAttributes:0];
        [v9 invalidateDecorationElementsOfKind:0x1F1C95828 atIndexPaths:v8];
        [(SKUIStorePageCollectionViewLayout *)self invalidateLayoutWithContext:v9];
      }
      id v4 = v10;
    }
  }

  MEMORY[0x1F41817F8](backdropGroupName, v4);
}

- (BOOL)_allowsBackdropDecorationForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4
{
  int64_t v4 = [(SKUIStorePageCollectionViewLayout *)self _pinningStyleForItemPinningConfiguration:a3 atIndexPath:a4];
  if (v4) {
    BOOL v5 = v4 == 3;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (void)_appendAdditionalLayoutAttributesForPinningItemsInRect:(CGRect)a3 toArray:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v33 = a4;
  [(SKUIStorePageCollectionViewLayout *)self _indexPathsForPinningItems];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v42;
    do
    {
      uint64_t v12 = 0;
      double v32 = sel_layoutAttributesForItemAtIndexPath_;
      uint64_t v34 = v10;
      do
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v41 + 1) + 8 * v12);
        objc_super v14 = -[SKUIStorePageCollectionViewLayout _itemPinningLayoutInformationForItemAtIndexPath:](self, "_itemPinningLayoutInformationForItemAtIndexPath:", v13, v32);
        [v14 availablePinningFrame];
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;

        v48.origin.CGFloat x = v16;
        v48.origin.CGFloat y = v18;
        v48.size.CGFloat width = v20;
        v48.size.CGFloat height = v22;
        v49.origin.CGFloat x = x;
        v49.origin.CGFloat y = y;
        v49.size.CGFloat width = width;
        v49.size.CGFloat height = height;
        if (CGRectIntersectsRect(v48, v49))
        {
          char v23 = self;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v24 = v33;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v38;
            while (2)
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v38 != v27) {
                  objc_enumerationMutation(v24);
                }
                CGFloat v29 = [*(id *)(*((void *)&v37 + 1) + 8 * i) indexPath];
                char v30 = [v29 isEqual:v13];

                if (v30)
                {
                  self = v23;
                  goto LABEL_17;
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
              if (v26) {
                continue;
              }
              break;
            }
          }

          self = v23;
          v36.receiver = v23;
          v36.super_class = (Class)SKUIStorePageCollectionViewLayout;
          uint64_t v31 = objc_msgSendSuper2(&v36, v32, v13);
          [v24 addObject:v31];
          id v24 = (id)v31;
LABEL_17:

          uint64_t v10 = v34;
        }
        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v10);
  }
}

- (void)_calculatePinningLayoutInformation
{
  [(NSMapTable *)self->_indexPathToPinningLayoutInformation removeAllObjects];
  v3 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = [(SKUIStorePageCollectionViewLayout *)self _indexPathsForPinningItems];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x4010000000;
  v34[3] = &unk_1C1D0F257;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  long long v35 = *MEMORY[0x1E4FB2848];
  long long v36 = v13;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x4010000000;
  v31[3] = &unk_1C1D0F257;
  long long v32 = v35;
  long long v33 = v13;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__SKUIStorePageCollectionViewLayout__calculatePinningLayoutInformation__block_invoke;
  v15[3] = &unk_1E6425620;
  v15[4] = self;
  double v17 = v34;
  CGFloat v18 = v30;
  double v19 = v28;
  CGFloat v20 = v31;
  double v21 = v29;
  CGFloat v22 = v27;
  id v14 = v12;
  id v16 = v14;
  uint64_t v23 = v5;
  uint64_t v24 = v7;
  uint64_t v25 = v9;
  uint64_t v26 = v11;
  [v14 enumerateObjectsUsingBlock:v15];

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v34, 8);
}

void __71__SKUIStorePageCollectionViewLayout__calculatePinningLayoutInformation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) _itemPinningConfigurationForItemAtIndexPath:v5];
  uint64_t v7 = [*(id *)(a1 + 32) _pinningStyleForItemPinningConfiguration:v6 atIndexPath:v5];
  if (!v7) {
    goto LABEL_60;
  }
  unint64_t v8 = v7;
  v77.receiver = *(id *)(a1 + 32);
  v77.super_class = (Class)SKUIStorePageCollectionViewLayout;
  uint64_t v9 = objc_msgSendSuper2(&v77, sel_layoutAttributesForItemAtIndexPath_, v5);
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [*(id *)(a1 + 32) _pinningContentInsetForItemPinningConfiguration:v6 atIndexPath:v5];
  if (!a3)
  {
    CGFloat v22 = *(double **)(*(void *)(a1 + 48) + 8);
    v22[4] = v18;
    v22[5] = v19;
    v22[6] = v20;
    v22[7] = v21;
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 32)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
  }
  unint64_t v23 = v8;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != v8)
  {
    uint64_t v24 = *(double **)(*(void *)(a1 + 72) + 8);
    v24[4] = v18;
    v24[5] = v19;
    v24[6] = v20;
    v24[7] = v21;
    unint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  double v25 = -v21 - v19;
  BOOL v27 = v8 != 1 && v23 != 1;
  if (v23 != 5 && !v27) {
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
  }
  double v28 = v11 - v19;
  double v29 = v13 - v18;
  double v30 = v15 - v25;
  double v31 = v17 - (-v20 - v18);
  double v74 = v20;
  double v71 = v13 - v18;
  CGFloat v72 = v28;
  CGFloat v69 = v31;
  CGFloat v70 = v30;
  if (v8 == 3)
  {
    if (a3)
    {
      double v32 = v28;
      double v33 = v30;
      double rect = CGRectGetMinY(*(CGRect *)(&v29 - 1));
    }
    else
    {
      double rect = 2.22507386e-308;
    }
LABEL_21:
    v78.origin.CGFloat x = v11;
    v78.origin.CGFloat y = v13;
    v78.size.CGFloat width = v15;
    v78.size.CGFloat height = v17;
    double MinY = CGRectGetMinY(v78);
    double v37 = *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    if (v37 > 0.0) {
      double MinY = MinY - (v37 - *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
    }
    goto LABEL_23;
  }
  double v34 = v28;
  double v35 = v30;
  double rect = CGRectGetMinY(*(CGRect *)(&v29 - 1));
  if (v8 != 1) {
    goto LABEL_21;
  }
  double MinY = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
LABEL_23:
  double v73 = MinY;
  double v75 = v17;
  [v9 frame];
  double MaxY = CGRectGetMaxY(v79);
  if (v8 != 3 && [*(id *)(a1 + 40) count] - 1 == a3) {
    double MaxY = 1.79769313e308;
  }
  double MinX = CGRectGetMinX(*(CGRect *)(a1 + 96));
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 96));
  if (v8 == 5)
  {
    double MinX = CGRectGetMinX(*(CGRect *)(a1 + 96));
    double v41 = CGRectGetWidth(*(CGRect *)(a1 + 96));
    double rect = 2.22507386e-308;
    double v42 = 1.79769313e308;
  }
  else
  {
    double v41 = Width;
    double v42 = MaxY - rect;
    if (v8 == 3) {
      goto LABEL_47;
    }
  }
  if (a3 >= 1)
  {
    double v64 = v15;
    double v65 = v13;
    double v66 = v11;
    v67 = v9;
    v68 = v6;
    while (1)
    {
      long long v43 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3 - 1, *(void *)&v64, *(void *)&v65, *(void *)&v66, v67, v68);
      long long v44 = [*(id *)(a1 + 32) _itemPinningConfigurationForItemAtIndexPath:v43];
      uint64_t v45 = [*(id *)(a1 + 32) _pinningStyleForItemPinningConfiguration:v44 atIndexPath:v43];
      v46 = [*(id *)(*(void *)(a1 + 32) + 592) objectForKey:v43];
      [v46 availablePinningFrame];
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;
      if (v8 == 1)
      {
        if (v45 == 3)
        {
LABEL_39:
          LODWORD(v45) = 0;
          goto LABEL_44;
        }
        v81.origin.CGFloat x = MinX;
        v81.origin.CGFloat y = rect;
        v81.size.CGFloat width = v41;
        v81.size.CGFloat height = v42;
        double v55 = CGRectGetMinY(v81);
        LODWORD(v45) = 1;
      }
      else
      {
        if (v8 != 4 && v8 != 2)
        {
          LODWORD(v45) = 1;
          goto LABEL_44;
        }
        if (v8 == 4 || v45 == 2)
        {
          v82.origin.CGFloat x = MinX;
          v82.origin.CGFloat y = rect;
          v82.size.CGFloat width = v41;
          v82.size.CGFloat height = v42;
          double v55 = CGRectGetMaxY(v82);
          LODWORD(v45) = 0;
        }
        else
        {
          if (v45 != 1) {
            goto LABEL_39;
          }
          v80.origin.CGFloat x = MinX;
          v80.origin.CGFloat y = rect;
          v80.size.CGFloat width = v41;
          v80.size.CGFloat height = v42;
          double v55 = CGRectGetMinY(v80);
        }
      }
      v83.origin.CGFloat x = v48;
      v83.origin.CGFloat y = v50;
      v83.size.CGFloat width = v52;
      v83.size.CGFloat height = v54;
      double v54 = v55 - CGRectGetMinY(v83);
LABEL_44:
      objc_msgSend(v46, "setAvailablePinningFrame:", v48, v50, v52, v54);

      if ((unint64_t)a3 >= 2)
      {
        --a3;
        if (!v45) {
          continue;
        }
      }
      uint64_t v9 = v67;
      uint64_t v6 = v68;
      double v13 = v65;
      double v11 = v66;
      double v15 = v64;
      break;
    }
  }
LABEL_47:
  long long v56 = objc_alloc_init(SKUIStorePageItemPinningLayoutInformation);
  -[SKUIStorePageItemPinningLayoutInformation setAvailablePinningFrame:](v56, "setAvailablePinningFrame:", MinX, rect, v41, v42);
  -[SKUIStorePageItemPinningLayoutInformation setLayoutAttributesFrame:](v56, "setLayoutAttributesFrame:", v11, v13, v15, v75);
  [(SKUIStorePageItemPinningLayoutInformation *)v56 setAfterPinningLocationYAdditions:v73];
  [(SKUIStorePageItemPinningLayoutInformation *)v56 setBeforePinningLocationYAdditions:*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  v57 = *(void **)(*(void *)(a1 + 32) + 592);
  if (!v57)
  {
    uint64_t v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, objc_msgSend(*(id *)(a1 + 40), "count"));
    uint64_t v59 = *(void *)(a1 + 32);
    CGRect v60 = *(void **)(v59 + 592);
    *(void *)(v59 + 592) = v58;

    v57 = *(void **)(*(void *)(a1 + 32) + 592);
  }
  [v57 setObject:v56 forKey:v5];
  if (v8 <= 5 && ((1 << v8) & 0x34) != 0)
  {
    v84.origin.CGFloat y = v71;
    v84.origin.CGFloat x = v72;
    v84.size.CGFloat height = v69;
    v84.size.CGFloat width = v70;
    *(CGFloat *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = CGRectGetHeight(v84)
                                                                 + *(double *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                             + 24);
  }
  CGRect v61 = [*(id *)(a1 + 32) _itemPinningConfigurationForItemAtIndexPath:v5];
  uint64_t v62 = [*(id *)(a1 + 32) _pinningGroupForItemPinningConfiguration:v61 atIndexPath:v5];
  if (v8 == 3 && (*(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) == 0.0 || v62 == 1))
  {
    v85.origin.CGFloat x = v11;
    v85.origin.CGFloat y = v13;
    v85.size.CGFloat width = v15;
    v85.size.CGFloat height = v75;
    *(CGFloat *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = CGRectGetHeight(v85)
                                                                 + *(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                             + 24);
  }
  v86.origin.CGFloat x = v11;
  v86.origin.CGFloat y = v13;
  v86.size.CGFloat width = v15;
  v86.size.CGFloat height = v75;
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v74
                                                              + CGRectGetHeight(v86)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v8;

LABEL_60:
}

- (void)_configureCellLayoutAttributes:(id)a3 forItemWithPinningConfiguration:(id)a4 layoutInformation:(id)a5 atIndexPath:(id)a6 allowPinning:(BOOL)a7 returningIsPinning:(BOOL *)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  double v18 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
  double v19 = v18;
  if (self->_rendersWithPerspective)
  {
    [v18 bounds];
    CGFloat x = v40.origin.x;
    CGFloat y = v40.origin.y;
    CGFloat width = v40.size.width;
    CGFloat height = v40.size.height;
    CGRectGetMidX(v40);
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    CGRectGetMidY(v41);
    [v14 center];
    UIDistanceBetweenPoints();
    [v14 setZIndex:(uint64_t)-fabs(v24)];
  }
  if ((*(unsigned char *)&self->_collectionViewDelegateFlags & 0x20) != 0)
  {
    double v25 = [v19 delegate];
    [v25 collectionView:v19 layout:self willApplyLayoutAttributes:v14];
  }
  BOOL v39 = 0;
  [v14 frame];
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  double v33 = v29;
  if (v9)
  {
    -[SKUIStorePageCollectionViewLayout _targetFrameForStartingFrame:itemPinningConfiguration:layoutInformation:atIndexPath:returningIsPinning:](self, "_targetFrameForStartingFrame:itemPinningConfiguration:layoutInformation:atIndexPath:returningIsPinning:", v15, v16, v17, &v39, v26, v27, v28, v29);
    double v30 = v34;
    double v31 = v35;
    double v32 = v36;
    double v33 = v37;
    if (v39)
    {
      objc_msgSend(v14, "setZIndex:", objc_msgSend(v17, "section") + 200);
      if ([(SKUIStorePageCollectionViewLayout *)self _allowsBackdropDecorationForItemPinningConfiguration:v15 atIndexPath:v17])
      {
        long long v38 = [MEMORY[0x1E4FB1618] clearColor];
        [v14 setBackgroundColor:v38];
      }
    }
  }
  objc_msgSend(v14, "setFrame:", v30, v31, v32, v33);
  if (a8) {
    *a8 = v39;
  }
}

- (id)_getCollectionViewUpdateItemForItemFromIndex:(int64_t)a3 initalLayout:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = self->_updateItems;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v4) {
          [v11 indexPathAfterUpdate];
        }
        else {
        double v12 = objc_msgSend(v11, "indexPathBeforeUpdate", (void)v16);
        }
        uint64_t v13 = objc_msgSend(v12, "section", (void)v16);

        if (v13 == a3)
        {
          id v14 = v11;
          goto LABEL_14;
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_14:

  return v14;
}

- (id)_indexPathsForBackgroundGradients
{
  if (!self->_hasValidGradientIndexPaths)
  {
    v3 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
    BOOL v4 = [v3 delegate];
    id v5 = [v4 indexPathsForGradientItemsInCollectionView:v3 layout:self];
    indexPathsForGradientItems = self->_indexPathsForGradientItems;
    if (indexPathsForGradientItems != v5
      && ![(NSArray *)indexPathsForGradientItems isEqualToArray:v5])
    {
      uint64_t v7 = (NSArray *)[(NSArray *)v5 copy];
      uint64_t v8 = self->_indexPathsForGradientItems;
      self->_indexPathsForGradientItems = v7;
    }
    self->_hasValidGradientIndexPaths = 1;
  }
  uint64_t v9 = self->_indexPathsForGradientItems;

  return v9;
}

- (id)_indexPathsForPinningItems
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!self->_hasValidIndexPathsForPinningItems)
  {
    v3 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
    BOOL v4 = [v3 delegate];
    id v5 = v4;
    if (*(unsigned char *)&self->_collectionViewDelegateFlags)
    {
      uint64_t v6 = [v4 indexPathsForPinningItemsInCollectionView:v3 layout:self];
    }
    else
    {
      uint64_t v6 = 0;
    }
    indexPathsForPinningItems = self->_indexPathsForPinningItems;
    if (indexPathsForPinningItems != v6
      && ![(NSArray *)indexPathsForPinningItems isEqualToArray:v6])
    {
      long long v19 = v5;
      double v20 = v3;
      uint64_t v8 = self->_indexPathsForPinningItems;
      uint64_t v9 = (NSArray *)[(NSArray *)v6 copy];
      double v10 = self->_indexPathsForPinningItems;
      self->_indexPathsForPinningItems = v9;

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      double v11 = v8;
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
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
            uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            if (!-[NSArray containsObject:](self->_indexPathsForPinningItems, "containsObject:", v16, v19, v20, (void)v21))[(NSMapTable *)self->_indexPathToItemPinningConfiguration removeObjectForKey:v16]; {
          }
            }
          uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v13);
      }

      id v5 = v19;
      v3 = v20;
    }
    self->_hasValidIndexPathsForPinningItems = 1;
  }
  long long v17 = self->_indexPathsForPinningItems;

  return v17;
}

- (void)_invalidatePinningLayoutInformation
{
  indexPathToPinningLayoutInformation = self->_indexPathToPinningLayoutInformation;
  self->_indexPathToPinningLayoutInformation = 0;

  self->_hasValidPinningLayoutInformation = 0;
}

- (id)_itemPinningConfigurationForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMapTable *)self->_indexPathToItemPinningConfiguration objectForKey:v4];
    if (!v5)
    {
      id v5 = objc_alloc_init(SKUIStorePageItemPinningConfiguration);
      indexPathToItemPinningConfiguration = self->_indexPathToItemPinningConfiguration;
      if (!indexPathToItemPinningConfiguration)
      {
        uint64_t v7 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:1];
        uint64_t v8 = self->_indexPathToItemPinningConfiguration;
        self->_indexPathToItemPinningConfiguration = v7;

        indexPathToItemPinningConfiguration = self->_indexPathToItemPinningConfiguration;
      }
      [(NSMapTable *)indexPathToItemPinningConfiguration setObject:v5 forKey:v4];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_itemPinningLayoutInformationForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!self->_hasValidPinningLayoutInformation)
    {
      [(SKUIStorePageCollectionViewLayout *)self _calculatePinningLayoutInformation];
      self->_hasValidPinningLayoutInformation = 1;
    }
    id v5 = [(NSMapTable *)self->_indexPathToPinningLayoutInformation objectForKey:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_layoutAttributesForPinnedBackdropDecorationViewAtIndexPath:(id)a3 pinningConfiguration:(id)a4 layoutInformation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
  uint64_t v12 = +[UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:0x1F1C95828 withIndexPath:v8];
  [v12 setBackdropGroupName:self->_backdropGroupName];
  if (![(SKUIStorePageCollectionViewLayout *)self _allowsBackdropDecorationForItemPinningConfiguration:v9 atIndexPath:v8])
  {
    BOOL v13 = 1;
    double v14 = 0.0;
    goto LABEL_9;
  }
  char v40 = 0;
  [v10 layoutAttributesFrame];
  -[SKUIStorePageCollectionViewLayout _targetFrameForStartingFrame:itemPinningConfiguration:layoutInformation:atIndexPath:returningIsPinning:](self, "_targetFrameForStartingFrame:itemPinningConfiguration:layoutInformation:atIndexPath:returningIsPinning:", v9, v10, v8, &v40);
  BOOL v13 = v40 == 0;
  double v14 = 0.0;
  if (v40)
  {
    -[SKUIStorePageCollectionViewLayout _pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:](self, "_pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:", v9, v8);
    objc_msgSend(v12, "setFrame:");
    [v12 setZIndex:150];
    int64_t v15 = [(SKUIStorePageCollectionViewLayout *)self _pinningTransitionStyleForItemPinningConfiguration:v9 atIndexPath:v8];
    if (v15)
    {
      int64_t v16 = v15;
      int64_t v17 = [(SKUIStorePageCollectionViewLayout *)self _pinnedBackdropViewStyle];
      int64_t v18 = v17;
      if (v17)
      {
        if (v17 == 2)
        {
          uint64_t v19 = 2030;
        }
        else
        {
          if (v17 != 1) {
            goto LABEL_16;
          }
          uint64_t v19 = 2010;
        }
        [v12 setBackdropStyle:v19];
        uint64_t v21 = 0;
      }
      else
      {
        uint64_t v21 = 1;
      }
      [v12 setHidesBackdropView:v21];
LABEL_16:
      if (v16 == 2)
      {
        double v14 = 1.0;
      }
      else if (v16 == 1)
      {
        double v14 = 1.0;
        if (!v18)
        {
          [v11 _effectiveContentInset];
          double v23 = v22;
          [v11 contentOffset];
          double v25 = v23 + v24;
          v39.receiver = self;
          v39.super_class = (Class)SKUIStorePageCollectionViewLayout;
          uint64_t v26 = [(UICollectionViewFlowLayout *)&v39 layoutAttributesForItemAtIndexPath:v8];
          [v26 frame];
          -[SKUIStorePageCollectionViewLayout _pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:](self, "_pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:", v9, v8);
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          CGFloat v32 = v31;
          CGFloat v34 = v33;
          [v10 afterPinningLocationYAdditions];
          double v36 = v25 + v35;
          v42.origin.CGFloat x = v28;
          v42.origin.CGFloat y = v30;
          v42.size.CGFloat width = v32;
          v42.size.CGFloat height = v34;
          double v37 = v36 - CGRectGetMinY(v42);
          v43.origin.CGFloat x = v28;
          v43.origin.CGFloat y = v30;
          v43.size.CGFloat width = v32;
          v43.size.CGFloat height = v34;
          double v38 = v37 / fmin(CGRectGetHeight(v43), 6.0);
          if (v38 > 1.0) {
            double v38 = 1.0;
          }
          double v14 = fmax(v38, 0.0);
        }
      }
    }
  }
LABEL_9:
  [v12 setBackdropColor:self->_collectionViewBackgroundColor];
  [v12 setTransitionProgress:v14];
  [v12 setHidden:v13];

  return v12;
}

- (id)_layoutAttributesForGradientDecorationViewAtIndexPath:(id)a3 currentAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
  uint64_t v9 = objc_msgSend(v8, "numberOfItemsInSection:", objc_msgSend(v6, "section"));
  id v10 = [(SKUIStorePageCollectionViewLayout *)self layoutAttributesForDecorationViewOfKind:0x1F1C90208 atIndexPath:v6];
  [v8 bounds];
  [v7 size];
  double v12 = v11;
  [v7 frame];
  if (v9 >= 2)
  {
    CGFloat v17 = v13;
    CGFloat v18 = v14;
    CGFloat v19 = v15;
    CGFloat v20 = v16;
    for (uint64_t i = 1; i != v9; ++i)
    {
      double v22 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", i, objc_msgSend(v6, "section"));
      double v23 = [(SKUIStorePageCollectionViewLayout *)self layoutAttributesForItemAtIndexPath:v22];

      [v23 frame];
      double MaxY = CGRectGetMaxY(v37);
      v38.origin.CGFloat x = v17;
      v38.origin.CGFloat y = v18;
      v38.size.CGFloat width = v19;
      v38.size.CGFloat height = v20;
      if (MaxY > CGRectGetMaxY(v38))
      {
        [v23 frame];
        double v25 = CGRectGetMaxY(v39);
        v40.origin.CGFloat x = v17;
        v40.origin.CGFloat y = v18;
        v40.size.CGFloat width = v19;
        v40.size.CGFloat height = v20;
        double v12 = v12 + v25 - CGRectGetMaxY(v40);
        [v23 frame];
        CGFloat v17 = v26;
        CGFloat v18 = v27;
        CGFloat v19 = v28;
        CGFloat v20 = v29;
      }
    }
  }
  [v10 frame];
  [v7 frame];
  double v31 = v30;
  [v7 frame];
  [v10 setFrame:v31];
  [v10 setZIndex:-1];
  CGFloat v32 = [v8 delegate];
  double v33 = objc_msgSend(v32, "backgroundColorForSection:", objc_msgSend(v6, "section"));
  CGFloat v34 = (void *)[v33 copy];

  [v10 setGradientColor:v34];
  [v10 setHidden:0];

  return v10;
}

- (int64_t)_pinnedBackdropViewStyle
{
  if (!self->_hasValidPinnedBackdropViewStyle)
  {
    self->_pinnedBackdropViewStyle = 0;
    double v8 = 0.0;
    v3 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
    id v4 = [v3 backgroundColor];
    int v5 = [v4 getWhite:&v8 alpha:0];

    if (v5)
    {
      if (v8 > 0.999999881)
      {
        int64_t v6 = 1;
LABEL_7:
        self->_pinnedBackdropViewStyle = v6;
        goto LABEL_8;
      }
      if (v8 <= 0.215686275)
      {
        int64_t v6 = 2;
        goto LABEL_7;
      }
    }
LABEL_8:
    self->_hasValidPinnedBackdropViewStyle = 1;
  }
  return self->_pinnedBackdropViewStyle;
}

- (UIEdgeInsets)_pinningContentInsetForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 hasValidPinningContentInset] & 1) == 0)
  {
    if ((*(unsigned char *)&self->_collectionViewDelegateFlags & 2) != 0)
    {
      double v12 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
      double v13 = [v12 delegate];
      [v13 collectionView:v12 layout:self pinningContentInsetForItemAtIndexPath:v7];
      double v8 = v14;
      double v9 = v15;
      double v10 = v16;
      double v11 = v17;
    }
    else
    {
      double v8 = *MEMORY[0x1E4FB2848];
      double v9 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v10 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v11 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    }
    objc_msgSend(v6, "setPinningContentInset:", v8, v9, v10, v11);
  }
  [v6 pinningContentInset];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.right = v29;
  result.bottom = v28;
  result.left = v27;
  result.top = v26;
  return result;
}

- (CGRect)_pinningFrameForStartingFrame:(CGRect)a3 itemPinningConfiguration:(id)a4 atIndexPath:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SKUIStorePageCollectionViewLayout *)self _pinningContentInsetForItemPinningConfiguration:a4 atIndexPath:a5];
  double v10 = -v9;
  double v13 = y - v12;
  double v15 = width - (-v11 - v14);
  double v16 = height - (v10 - v12);
  double v17 = x - v14;
  double v18 = v13;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (int64_t)_pinningStyleForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 hasValidPinningStyle] & 1) == 0)
  {
    if ((*(unsigned char *)&self->_collectionViewDelegateFlags & 4) != 0)
    {
      double v9 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
      double v10 = [v9 delegate];
      uint64_t v8 = [v10 collectionView:v9 layout:self pinningStyleForItemAtIndexPath:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
    [v6 setPinningStyle:v8];
  }
  int64_t v11 = [v6 pinningStyle];

  return v11;
}

- (int64_t)_pinningGroupForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 hasValidPinningGroup] & 1) == 0)
  {
    if ((*(unsigned char *)&self->_collectionViewDelegateFlags & 8) != 0)
    {
      double v9 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
      double v10 = [v9 delegate];
      uint64_t v8 = [v10 collectionView:v9 layout:self pinningGroupForItemAtIndexPath:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
    [v6 setPinningGroup:v8];
  }
  int64_t v11 = [v6 pinningGroup];

  return v11;
}

- (int64_t)_pinningTransitionStyleForItemPinningConfiguration:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_allowsPinningTransitions)
  {
    if (([v6 hasValidPinningTransitionStyle] & 1) == 0)
    {
      if ((*(unsigned char *)&self->_collectionViewDelegateFlags & 0x10) != 0)
      {
        double v10 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
        int64_t v11 = [v10 delegate];
        uint64_t v8 = [v11 collectionView:v10 layout:self pinningTransitionStyleForItemAtIndexPath:v7];
      }
      else
      {
        uint64_t v8 = 0;
      }
      [v6 setPinningTransitionStyle:v8];
    }
    int64_t v9 = [v6 pinningTransitionStyle];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (CGRect)_targetFrameForStartingFrame:(CGRect)a3 itemPinningConfiguration:(id)a4 layoutInformation:(id)a5 atIndexPath:(id)a6 returningIsPinning:(BOOL *)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  [(SKUIStorePageCollectionViewLayout *)self _pinningContentInsetForItemPinningConfiguration:v13 atIndexPath:v15];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v24 = [(SKUIStorePageCollectionViewLayout *)self collectionView];
  [v24 contentOffset];
  double v26 = v25;
  [v24 _effectiveContentInset];
  double v28 = v27;
  int64_t v29 = [(SKUIStorePageCollectionViewLayout *)self _pinningStyleForItemPinningConfiguration:v13 atIndexPath:v15];
  CGFloat v88 = x;
  double v30 = -v21;
  double v31 = -v23;
  double v32 = x - v19;
  double v33 = y - v17;
  double v34 = width - (v31 - v19);
  double v35 = height - (v30 - v17);
  double v36 = v26;
  double v37 = v26 + v28;
  double v38 = y;
  switch(v29)
  {
    case 1:
      [v14 afterPinningLocationYAdditions];
      double v40 = v37 + v39;
      v90.origin.double x = v32;
      v90.origin.double y = v33;
      v90.size.double width = v34;
      v90.size.double height = v35;
      double v41 = v40 - CGRectGetMinY(v90);
      if (v41 > 0.00000011920929)
      {
        double v42 = y + v41;
        goto LABEL_7;
      }
      v68 = [(SKUIStorePageCollectionViewLayout *)self _indexPathsForPinningItems];
      CGFloat v69 = v68;
      if (!v68
        || (uint64_t v70 = [v68 indexOfObject:v15], v70 == 0x7FFFFFFFFFFFFFFFLL)
        || (unint64_t v71 = v70 - 1, v70 < 1))
      {
        BOOL v43 = 0;
        double v44 = height;
      }
      else
      {
        double v44 = height;
        if (v71 >= [v69 count])
        {
          BOOL v43 = 0;
        }
        else
        {
          CGFloat v72 = [v69 objectAtIndex:v71];
          CGRect v86 = [(SKUIStorePageCollectionViewLayout *)self _itemPinningLayoutInformationForItemAtIndexPath:v72];
          double v73 = [(SKUIStorePageCollectionViewLayout *)self _itemPinningConfigurationForItemAtIndexPath:v72];
          int64_t v74 = [(SKUIStorePageCollectionViewLayout *)self _pinningStyleForItemPinningConfiguration:v73 atIndexPath:v72];
          BOOL v43 = 0;
          if (v74 && v74 != 3)
          {
            [v86 layoutAttributesFrame];
            -[SKUIStorePageCollectionViewLayout _pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:](self, "_pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:", v73, v72);
            BOOL v43 = v41 + CGRectGetHeight(v100) > 0.00000011920929;
          }
        }
      }

      goto LABEL_32;
    case 2:
      [v14 afterPinningLocationYAdditions];
      double v46 = v37 + v45;
      v91.origin.double x = v32;
      v91.origin.double y = v33;
      v91.size.double width = v34;
      v91.size.double height = v35;
      double v47 = v46 - CGRectGetMinY(v91);
      if (v47 <= 0.00000011920929)
      {
        BOOL v43 = 0;
        goto LABEL_31;
      }
      double v42 = y + v47;
LABEL_7:
      [v14 availablePinningFrame];
      CGFloat v49 = v48;
      CGFloat v51 = v50;
      CGFloat v53 = v52;
      CGFloat v55 = v54;
      long long v56 = self;
      double v57 = v88;
      double v44 = height;
      double v58 = v42;
      goto LABEL_8;
    case 3:
      [v14 beforePinningLocationYAdditions];
      double v62 = v37 + v61;
      v94.origin.double x = v32;
      v94.origin.double y = v33;
      v94.size.double width = v34;
      v94.size.double height = v35;
      double v63 = v62 - CGRectGetMinY(v94);
      BOOL v43 = v63 < -0.00000011920929;
      if (v63 >= -0.00000011920929) {
        double v63 = -0.0;
      }
      double v38 = y + v63;
      goto LABEL_31;
    case 4:
      [v14 beforePinningLocationYAdditions];
      double v65 = v37 + v64;
      double v44 = height;
      v95.origin.double x = v88;
      v95.origin.double y = y;
      v95.size.double width = width;
      v95.size.double height = height;
      double v66 = v65 - CGRectGetMinY(v95);
      if (v66 < -0.00000011920929)
      {
        BOOL v43 = 0;
        double v38 = y + v66;
        goto LABEL_32;
      }
      [v14 afterPinningLocationYAdditions];
      double v76 = v37 + v75;
      v101.origin.double x = v88;
      v101.origin.double y = y;
      v101.size.double width = width;
      v101.size.double height = height;
      double v77 = v76 - CGRectGetMinY(v101);
      if (v77 <= 0.00000011920929) {
        goto LABEL_35;
      }
      double v42 = y + v77;
      [v14 availablePinningFrame];
      CGFloat v49 = v78;
      CGFloat v51 = v79;
      CGFloat v53 = v80;
      CGFloat v55 = v81;
      long long v56 = self;
      double v57 = v88;
      double v58 = v42;
LABEL_8:
      -[SKUIStorePageCollectionViewLayout _pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:](v56, "_pinningFrameForStartingFrame:itemPinningConfiguration:atIndexPath:", v13, v15, v57, v58, width, v44);
      double MaxY = CGRectGetMaxY(v92);
      v93.origin.double x = v49;
      v93.origin.double y = v51;
      v93.size.double width = v53;
      v93.size.double height = v55;
      double v60 = MaxY - CGRectGetMaxY(v93);
      if (v60 <= 0.00000011920929) {
        double v60 = 0.0;
      }
      goto LABEL_10;
    case 5:
      if (y <= v36)
      {
        BOOL v43 = 1;
        double v38 = v36;
LABEL_31:
        double v44 = height;
      }
      else
      {
        [v24 bounds];
        double v67 = v36 + CGRectGetHeight(v96);
        double v44 = height;
        v97.origin.double x = v88;
        v97.origin.double y = y;
        v97.size.double width = width;
        v97.size.double height = height;
        if (y <= v67 - CGRectGetHeight(v97))
        {
LABEL_35:
          BOOL v43 = 0;
        }
        else
        {
          [v24 bounds];
          double v42 = v36 + CGRectGetHeight(v98);
          v99.origin.double x = v88;
          v99.origin.double y = y;
          v99.size.double width = width;
          v99.size.double height = height;
          double v60 = CGRectGetHeight(v99);
LABEL_10:
          double v38 = v42 - v60;
          BOOL v43 = 1;
        }
      }
LABEL_32:
      if (a7) {
        *a7 = v43;
      }

      double v82 = v88;
      double v83 = v38;
      double v84 = width;
      double v85 = v44;
      result.size.double height = v85;
      result.size.double width = v84;
      result.origin.double y = v83;
      result.origin.double x = v82;
      return result;
    default:
      BOOL v43 = 0;
      double v44 = height;
      double v38 = y;
      goto LABEL_32;
  }
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (NSArray)indexPathsForGradientItems
{
  return self->_indexPathsForGradientItems;
}

- (void)setIndexPathsForGradientItems:(id)a3
{
}

- (double)overrideContentWidth
{
  return self->_overrideContentWidth;
}

- (void)setOverrideContentWidth:(double)a3
{
  self->_double overrideContentWidth = a3;
}

- (BOOL)rendersWithPerspective
{
  return self->_rendersWithPerspective;
}

- (void)setRendersWithPerspective:(BOOL)a3
{
  self->_rendersWithPerspective = a3;
}

- (BOOL)rendersWithParallax
{
  return self->_rendersWithParallax;
}

- (void)setRendersWithParallax:(BOOL)a3
{
  self->_rendersWithParalladouble x = a3;
}

- (BOOL)allowsPinningTransitions
{
  return self->_allowsPinningTransitions;
}

- (NSIndexSet)expandChildPageSectionsIndexSet
{
  return self->_expandChildPageSectionsIndexSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandChildPageSectionsIndexSet, 0);
  objc_storeStrong((id *)&self->_updateItems, 0);
  objc_storeStrong((id *)&self->_indexPathsForPinningItems, 0);
  objc_storeStrong((id *)&self->_indexPathsForGradientItems, 0);
  objc_storeStrong((id *)&self->_indexPathToPinningLayoutInformation, 0);
  objc_storeStrong((id *)&self->_indexPathToItemPinningConfiguration, 0);
  objc_storeStrong((id *)&self->_collectionViewBackgroundColor, 0);

  objc_storeStrong((id *)&self->_backdropGroupName, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStorePageCollectionViewLayout init]";
}

@end