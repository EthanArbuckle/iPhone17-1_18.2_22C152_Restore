@interface _TVStackViewFlowLayout
+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)contentSize;
- (NSArray)sectionCellLayoutAttributes;
- (NSArray)supplementaryCellLayoutAttributes;
- (_TVStackViewFlowLayout)init;
- (double)_computeShowcaseFactorForContentOffset:(CGPoint)a3;
- (double)showcaseFactor;
- (double)showcaseHeight;
- (id)_oldLayoutAttributesForItemAtIndexPath:(id)a3;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)onPrepareLayout;
- (int64_t)supplementaryCellSection;
- (void)_prepareSectionMetrics;
- (void)finalizeCollectionViewUpdates;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareLayout;
- (void)setContentSize:(CGSize)a3;
- (void)setOnPrepareLayout:(id)a3;
- (void)setSectionCellLayoutAttributes:(id)a3;
- (void)setShowcaseHeight:(double)a3;
- (void)setSupplementaryCellLayoutAttributes:(id)a3;
- (void)setSupplementaryCellSection:(int64_t)a3;
@end

@implementation _TVStackViewFlowLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (_TVStackViewFlowLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)_TVStackViewFlowLayout;
  result = [(_TVStackViewFlowLayout *)&v3 init];
  if (result)
  {
    result->_supplementaryCellSection = 0x7FFFFFFFFFFFFFFFLL;
    result->_showcaseFactor = NAN;
  }
  return result;
}

- (void)setSupplementaryCellLayoutAttributes:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (NSArray *)[a3 copy];
  supplementaryCellLayoutAttributes = self->_supplementaryCellLayoutAttributes;
  self->_supplementaryCellLayoutAttributes = v4;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_supplementaryCellLayoutAttributes;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v11, "setZIndex:", 0, (void)v12);
        [(_TVStackViewFlowLayout *)self showcaseFactor];
        objc_msgSend(v11, "setShowcaseFactor:");
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)prepareLayout
{
  objc_super v3 = [(_TVStackViewFlowLayout *)self collectionView];
  id obj = [v3 delegate];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackViewDelegateFlowLayout);
  if (WeakRetained != obj)
  {
    if ([obj conformsToProtocol:&unk_26E5F53F0])
    {
      id v5 = objc_storeWeak((id *)&self->_stackViewDelegateFlowLayout, obj);
      self->_stackViewDelegateFlowLayoutFlags.hasShowcaseFactorDidChange = objc_opt_respondsToSelector() & 1;
    }
    else
    {
      objc_storeWeak((id *)&self->_stackViewDelegateFlowLayout, 0);
      self->_stackViewDelegateFlowLayoutFlags.hasShowcaseFactorDidChange = 0;
    }
  }
  double showcaseFactor = self->_showcaseFactor;
  uint64_t v7 = [(_TVStackViewFlowLayout *)self collectionView];
  [v7 contentOffset];
  -[_TVStackViewFlowLayout _computeShowcaseFactorForContentOffset:](self, "_computeShowcaseFactorForContentOffset:");
  self->_double showcaseFactor = v8;

  if (showcaseFactor != self->_showcaseFactor && self->_stackViewDelegateFlowLayoutFlags.hasShowcaseFactorDidChange)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_stackViewDelegateFlowLayout);
    v10 = [(_TVStackViewFlowLayout *)self collectionView];
    [v9 collectionView:v10 showcaseFactorDidChangeForLayout:self];
  }
  v11 = [(_TVStackViewFlowLayout *)self collectionView];
  [v11 bounds];
  CGFloat Width = CGRectGetWidth(v19);

  if (self->_lastLayoutWidth != Width)
  {
    self->_lastLayoutCGFloat Width = Width;
    sectionCellLayoutAttributes = self->_sectionCellLayoutAttributes;
    self->_sectionCellLayoutAttributes = 0;
  }
  long long v14 = [(_TVStackViewFlowLayout *)self sectionCellLayoutAttributes];

  if (!v14)
  {
    long long v15 = [(_TVStackViewFlowLayout *)self onPrepareLayout];

    if (v15)
    {
      v16 = [(_TVStackViewFlowLayout *)self onPrepareLayout];
      ((void (**)(void, _TVStackViewFlowLayout *))v16)[2](v16, self);
    }
    [(_TVStackViewFlowLayout *)self _prepareSectionMetrics];
  }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  -[_TVStackViewFlowLayout _computeShowcaseFactorForContentOffset:](self, "_computeShowcaseFactorForContentOffset:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  [(_TVStackViewFlowLayout *)self showcaseFactor];
  return v5 != v6;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v6 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
  -[_TVStackViewFlowLayout _computeShowcaseFactorForContentOffset:](self, "_computeShowcaseFactorForContentOffset:", x, y);
  double v8 = v7;
  [(_TVStackViewFlowLayout *)self showcaseFactor];
  if (v8 != v9) {
    [v6 setInvalidateSectionMetrics:1];
  }
  return v6;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  if (([v4 invalidateEverything] & 1) != 0
    || [v4 invalidateDataSourceCounts])
  {
    if ([v4 invalidateDataSourceCounts])
    {
      double v5 = [(_TVStackViewFlowLayout *)self sectionCellLayoutAttributes];
      oldSectionCellLayoutAttributes = self->_oldSectionCellLayoutAttributes;
      self->_oldSectionCellLayoutAttributes = v5;
    }
    [(_TVStackViewFlowLayout *)self setSectionCellLayoutAttributes:0];
    -[_TVStackViewFlowLayout setContentSize:](self, "setContentSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    [(_TVStackViewFlowLayout *)self setSupplementaryCellSection:0x7FFFFFFFFFFFFFFFLL];
    [(_TVStackViewFlowLayout *)self setSupplementaryCellLayoutAttributes:0];
  }
  else if ([v4 invalidateSectionMetrics])
  {
    [(_TVStackViewFlowLayout *)self setSectionCellLayoutAttributes:0];
    -[_TVStackViewFlowLayout setContentSize:](self, "setContentSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  }
  v7.receiver = self;
  v7.super_class = (Class)_TVStackViewFlowLayout;
  [(_TVStackViewFlowLayout *)&v7 invalidateLayoutWithContext:v4];
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (CGRectGetMinY(a3) == 0.0)
  {
    double v8 = [(_TVStackViewFlowLayout *)self collectionView];
    [v8 contentInset];
    double v10 = v9;

    double y = -v10;
    double height = height + v10;
  }
  v11 = [MEMORY[0x263EFF980] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v12 = [(_TVStackViewFlowLayout *)self supplementaryCellLayoutAttributes];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v17 frame];
        v47.origin.CGFloat x = v18;
        v47.origin.double y = v19;
        v47.size.CGFloat width = v20;
        v47.size.double height = v21;
        v45.origin.CGFloat x = x;
        v45.origin.double y = y;
        v45.size.CGFloat width = width;
        v45.size.double height = height;
        if (CGRectIntersectsRect(v45, v47)) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v14);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v22 = [(_TVStackViewFlowLayout *)self sectionCellLayoutAttributes];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        [v27 frame];
        v48.origin.CGFloat x = v28;
        v48.origin.double y = v29;
        v48.size.CGFloat width = v30;
        v48.size.double height = v31;
        v46.origin.CGFloat x = x;
        v46.origin.double y = y;
        v46.size.CGFloat width = width;
        v46.size.double height = height;
        if (CGRectIntersectsRect(v46, v48)) {
          [v11 addObject:v27];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v24);
  }

  return v11;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 section];
  if (v5 == [(_TVStackViewFlowLayout *)self supplementaryCellSection]) {
    [(_TVStackViewFlowLayout *)self supplementaryCellLayoutAttributes];
  }
  else {
    [(_TVStackViewFlowLayout *)self sectionCellLayoutAttributes];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "indexPath", (void)v14);
        int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_14;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v7;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v39 = self;
  v45.receiver = self;
  v45.super_class = (Class)_TVStackViewFlowLayout;
  [(_TVStackViewFlowLayout *)&v45 prepareForCollectionViewUpdates:v4];
  uint64_t v5 = [MEMORY[0x263F089C8] indexSet];
  id v6 = [MEMORY[0x263F089C8] indexSet];
  long long v40 = [MEMORY[0x263EFF9A0] dictionary];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v42;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
        if (![v12 updateAction])
        {
          uint64_t v13 = [v12 indexPathAfterUpdate];
          uint64_t v14 = [v13 section];
          long long v15 = v5;
          goto LABEL_10;
        }
        if ([v12 updateAction] == 1)
        {
          uint64_t v13 = [v12 indexPathBeforeUpdate];
          uint64_t v14 = [v13 section];
          long long v15 = v6;
LABEL_10:
          [v15 addIndex:v14];
LABEL_11:

          goto LABEL_12;
        }
        if ([v12 updateAction] == 3)
        {
          long long v16 = NSNumber;
          uint64_t v13 = [v12 indexPathBeforeUpdate];
          long long v17 = objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v13, "section"));
          CGFloat v18 = NSNumber;
          uint64_t v19 = [v12 indexPathAfterUpdate];
          CGFloat v20 = objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "section"));
          [v40 setObject:v17 forKeyedSubscript:v20];

          goto LABEL_11;
        }
LABEL_12:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v21 = [v7 countByEnumeratingWithState:&v41 objects:v46 count:16];
      uint64_t v9 = v21;
    }
    while (v21);
  }

  uint64_t v22 = [objc_alloc(MEMORY[0x263F4B408]) initWithAddedIndexes:v5 removedIndexes:v6 movedIndexesByNewIndex:v40 updatedIndexesByNewIndex:0];
  changeSet = v39->_changeSet;
  v39->_changeSet = (IKChangeSet *)v22;

  uint64_t v24 = [(_TVStackViewFlowLayout *)v39 collectionView];
  [v24 contentOffset];
  v39->_initialContentOffset.CGFloat x = v25;
  v39->_initialContentOffset.double y = v26;

  v27 = [(_TVStackViewFlowLayout *)v39 collectionView];
  CGFloat v28 = [v27 dataSource];
  CGFloat v29 = [(_TVStackViewFlowLayout *)v39 collectionView];
  uint64_t v30 = [v28 numberOfSectionsInCollectionView:v29];

  uint64_t v31 = [v5 count];
  v39->_isFullReplace = v31 == v30 - 1;
  if (v31 != v30 - 1)
  {
    v32 = [MEMORY[0x263F089C8] indexSet];
    uint64_t v33 = [v5 lastIndex];
    if (v33 != 0x7FFFFFFFFFFFFFFFLL && v33 == v30 - 2)
    {
      uint64_t v34 = v30 - 3;
      do
      {
        [v32 addIndex:v34 + 1];
        uint64_t v35 = [v5 indexLessThanIndex:v34 + 1];
      }
      while (v35 != 0x7FFFFFFFFFFFFFFFLL && v34-- == v35);
    }
    uint64_t v37 = [v32 copy];
    indexesAddedAtEnd = v39->_indexesAddedAtEnd;
    v39->_indexesAddedAtEnd = (NSIndexSet *)v37;
  }
}

- (void)finalizeCollectionViewUpdates
{
  v6.receiver = self;
  v6.super_class = (Class)_TVStackViewFlowLayout;
  [(_TVStackViewFlowLayout *)&v6 finalizeCollectionViewUpdates];
  oldSectionCellLayoutAttributes = self->_oldSectionCellLayoutAttributes;
  self->_oldSectionCellLayoutAttributes = 0;

  changeSet = self->_changeSet;
  self->_changeSet = 0;

  self->_initialContentOffset = (CGPoint)*MEMORY[0x263F00148];
  indexesAddedAtEnd = self->_indexesAddedAtEnd;
  self->_indexesAddedAtEnd = 0;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = -[IKChangeSet oldIndexForNewIndex:](self->_changeSet, "oldIndexForNewIndex:", [v4 section]);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v6 = [(_TVStackViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v4];
    id v7 = (void *)[v6 copy];

    [v7 setAlpha:0.0];
    if (!self->_isFullReplace
      && !-[NSIndexSet containsIndex:](self->_indexesAddedAtEnd, "containsIndex:", [v4 section]))
    {
      [v7 frame];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      long long v16 = [(_TVStackViewFlowLayout *)self collectionView];
      uint64_t v17 = [v16 effectiveUserInterfaceLayoutDirection];

      if (v17) {
        double v18 = -1.0;
      }
      else {
        double v18 = 1.0;
      }
      uint64_t v19 = [(_TVStackViewFlowLayout *)self collectionView];
      [v19 bounds];
      double v21 = v9 + v18 * v20;

      uint64_t v22 = [(_TVStackViewFlowLayout *)self collectionView];
      [v22 contentOffset];
      double v24 = v23;

      double v25 = v11 - (v24 - self->_initialContentOffset.y);
      [v7 setAlpha:1.0];
      objc_msgSend(v7, "setFrame:", v21, v25, v13, v15);
    }
  }
  else
  {
    CGFloat v26 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v5];
    id v7 = [(_TVStackViewFlowLayout *)self _oldLayoutAttributesForItemAtIndexPath:v26];
  }
  v27 = (id)TVMLKitLogObject;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      CGFloat v29 = @"NA";
    }
    else
    {
      CGFloat v29 = [NSNumber numberWithInteger:v5];
    }
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "section"));
    [v7 frame];
    uint64_t v32 = v31;
    [v7 frame];
    int v34 = 138413058;
    uint64_t v35 = v29;
    __int16 v36 = 2112;
    uint64_t v37 = v30;
    __int16 v38 = 2048;
    uint64_t v39 = v32;
    __int16 v40 = 2048;
    uint64_t v41 = v33;
    _os_log_debug_impl(&dword_230B4C000, v27, OS_LOG_TYPE_DEBUG, "stackUpdate: appearing %@ - %@ initial {%lf, %lf}", (uint8_t *)&v34, 0x2Au);

    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
  }
    }

  return v7;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = -[IKChangeSet newIndexForOldIndex:](self->_changeSet, "newIndexForOldIndex:", [v4 section]);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v6 = [(_TVStackViewFlowLayout *)self _oldLayoutAttributesForItemAtIndexPath:v4];
    id v7 = (void *)[v6 copy];

    [v7 setAlpha:0.0];
    if (!self->_isFullReplace)
    {
      CGAffineTransformMakeScale(&v21, 1.0, 0.1);
      [v7 setTransform:&v21];
      if (-[IKChangeSet oldIndexForNewIndex:](self->_changeSet, "oldIndexForNewIndex:", [v4 section]) != 0x7FFFFFFFFFFFFFFFLL)
      {
        [v7 center];
        double v9 = v8;
        double v11 = v10;
        [v7 bounds];
        objc_msgSend(v7, "setCenter:", v9, v11 + v12 * -0.9 * 0.5);
      }
    }
  }
  else
  {
    double v13 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v5];
    id v7 = [(_TVStackViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v13];
  }
  double v14 = (id)TVMLKitLogObject;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    long long v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "section"));
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v17 = @"NA";
    }
    else
    {
      uint64_t v17 = [NSNumber numberWithInteger:v5];
    }
    [v7 frame];
    uint64_t v19 = v18;
    [v7 frame];
    *(_DWORD *)buf = 138413058;
    double v23 = v16;
    __int16 v24 = 2112;
    double v25 = v17;
    __int16 v26 = 2048;
    uint64_t v27 = v19;
    __int16 v28 = 2048;
    uint64_t v29 = v20;
    _os_log_debug_impl(&dword_230B4C000, v14, OS_LOG_TYPE_DEBUG, "stackUpdate: disappearing %@ - %@ final {%lf, %lf}", buf, 0x2Au);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
  }
    }
  return v7;
}

- (id)_oldLayoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_oldSectionCellLayoutAttributes;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v10 = objc_msgSend(v9, "indexPath", (void)v13);
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_prepareSectionMetrics
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  objc_super v3 = [(_TVStackViewFlowLayout *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];
  [v3 bounds];
  double v32 = v5;
  id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:v4];
  if (v4 < 1)
  {
    double v9 = 0.0;
    double v8 = 0.0;
  }
  else
  {
    uint64_t v7 = 0;
    double v8 = 0.0;
    double v9 = 0.0;
    do
    {
      if (v7 == [(_TVStackViewFlowLayout *)self supplementaryCellSection])
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        double v10 = [(_TVStackViewFlowLayout *)self supplementaryCellLayoutAttributes];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v34 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v33 + 1) + 8 * i) frame];
              double Width = CGRectGetWidth(v39);
              if (v8 < Width) {
                double v8 = Width;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v12);
        }
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_stackViewDelegateFlowLayout);
        [WeakRetained collectionView:v3 layout:self insetForSectionAtIndex:v7];
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;

        id v25 = objc_loadWeakRetained((id *)&self->_stackViewDelegateFlowLayout);
        [v25 collectionView:v3 layout:self sizeForSectionAtIndex:v7];
        double v27 = v26;
        double v29 = v28;

        double v30 = v24 + v20 + v27;
        double v10 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v7];
        uint64_t v31 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:v10];
        [v31 setZIndex:1];
        objc_msgSend(v31, "setFrame:", floor((v32 - v30) * 0.5), v9 + v18, v27, v29);
        [(_TVStackViewFlowLayout *)self showcaseFactor];
        objc_msgSend(v31, "setShowcaseFactor:");
        [v6 addObject:v31];
        if (v8 < v30) {
          double v8 = v30;
        }
        double v9 = v9 + v22 + v18 + v29;
      }
      ++v7;
    }
    while (v7 != v4);
  }
  -[_TVStackViewFlowLayout setContentSize:](self, "setContentSize:", v8, v9);
  [(_TVStackViewFlowLayout *)self setSectionCellLayoutAttributes:v6];
}

- (double)_computeShowcaseFactorForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  [(_TVStackViewFlowLayout *)self showcaseHeight];
  double v6 = v5;
  uint64_t v7 = [(_TVStackViewFlowLayout *)self collectionView];
  [v7 contentInset];
  double v9 = v8;

  double result = 0.0;
  double v11 = 0.0;
  if (v6 > 0.0)
  {
    double v12 = y + v9;
    double v11 = 1.0;
    if (y + v9 > 0.0)
    {
      double v11 = 0.0;
      if (v12 < v6) {
        double v11 = (v6 - v12) / v6;
      }
    }
  }
  double v13 = fmin(v11 * 1.005 + -0.0025, 1.0);
  if (v13 >= 0.0) {
    return v13;
  }
  return result;
}

- (int64_t)supplementaryCellSection
{
  return self->_supplementaryCellSection;
}

- (void)setSupplementaryCellSection:(int64_t)a3
{
  self->_supplementaryCellSection = a3;
}

- (NSArray)supplementaryCellLayoutAttributes
{
  return self->_supplementaryCellLayoutAttributes;
}

- (id)onPrepareLayout
{
  return self->_onPrepareLayout;
}

- (void)setOnPrepareLayout:(id)a3
{
}

- (double)showcaseHeight
{
  return self->_showcaseHeight;
}

- (void)setShowcaseHeight:(double)a3
{
  self->_showcaseHeight = a3;
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (NSArray)sectionCellLayoutAttributes
{
  return self->_sectionCellLayoutAttributes;
}

- (void)setSectionCellLayoutAttributes:(id)a3
{
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionCellLayoutAttributes, 0);
  objc_storeStrong(&self->_onPrepareLayout, 0);
  objc_storeStrong((id *)&self->_supplementaryCellLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_indexesAddedAtEnd, 0);
  objc_storeStrong((id *)&self->_changeSet, 0);
  objc_storeStrong((id *)&self->_oldSectionCellLayoutAttributes, 0);
  objc_destroyWeak((id *)&self->_stackViewDelegateFlowLayout);
}

@end