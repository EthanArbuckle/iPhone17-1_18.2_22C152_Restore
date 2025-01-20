@interface PUImportSectionedGridLayout
+ (Class)layoutAttributesClass;
- (NSArray)sectionIndexPathsBeingDeleted;
- (NSMutableDictionary)preUpdateSectionDecorationAttributesBySection;
- (NSMutableDictionary)sectionDecorationAttributesBySection;
- (PUImportSectionedGridLayout)init;
- (UIColor)emphasizedSectionBackgroundColor;
- (UIColor)emphasizedSectionBottomStrokeColor;
- (double)emphasizedSectionBottomStrokeWidth;
- (id)createLayoutAttributesForSectionBackgroundAtSection:(unint64_t)a3;
- (id)indexPathsToDeleteForDecorationViewOfKind:(id)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)finalizeCollectionViewUpdates;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareLayout;
- (void)recreateSectionDecorationAttributes;
- (void)setDelegate:(id)a3;
- (void)setEmphasizedSectionBackgroundColor:(id)a3;
- (void)setEmphasizedSectionBottomStrokeColor:(id)a3;
- (void)setEmphasizedSectionBottomStrokeWidth:(double)a3;
- (void)setPreUpdateSectionDecorationAttributesBySection:(id)a3;
- (void)setSectionDecorationAttributesBySection:(id)a3;
- (void)setSectionIndexPathsBeingDeleted:(id)a3;
@end

@implementation PUImportSectionedGridLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIndexPathsBeingDeleted, 0);
  objc_storeStrong((id *)&self->_emphasizedSectionBottomStrokeColor, 0);
  objc_storeStrong((id *)&self->_emphasizedSectionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_preUpdateSectionDecorationAttributesBySection, 0);
  objc_storeStrong((id *)&self->_sectionDecorationAttributesBySection, 0);
}

- (void)setSectionIndexPathsBeingDeleted:(id)a3
{
}

- (NSArray)sectionIndexPathsBeingDeleted
{
  return self->_sectionIndexPathsBeingDeleted;
}

- (void)setEmphasizedSectionBottomStrokeWidth:(double)a3
{
  self->_emphasizedSectionBottomStrokeWidth = a3;
}

- (double)emphasizedSectionBottomStrokeWidth
{
  return self->_emphasizedSectionBottomStrokeWidth;
}

- (void)setEmphasizedSectionBottomStrokeColor:(id)a3
{
}

- (UIColor)emphasizedSectionBottomStrokeColor
{
  return self->_emphasizedSectionBottomStrokeColor;
}

- (void)setEmphasizedSectionBackgroundColor:(id)a3
{
}

- (UIColor)emphasizedSectionBackgroundColor
{
  return self->_emphasizedSectionBackgroundColor;
}

- (void)setPreUpdateSectionDecorationAttributesBySection:(id)a3
{
}

- (NSMutableDictionary)preUpdateSectionDecorationAttributesBySection
{
  return self->_preUpdateSectionDecorationAttributesBySection;
}

- (void)setSectionDecorationAttributesBySection:(id)a3
{
}

- (NSMutableDictionary)sectionDecorationAttributesBySection
{
  return self->_sectionDecorationAttributesBySection;
}

- (id)indexPathsToDeleteForDecorationViewOfKind:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PUImportSectionedGridLayout;
  v5 = [(PUImportSectionedGridLayout *)&v23 indexPathsToDeleteForDecorationViewOfKind:v4];
  v6 = (void *)[v5 mutableCopy];

  if ([v4 isEqualToString:@"PUImportSectionedGridLayoutDecorationKindSectionBackground"])
  {
    id v18 = v4;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = [(PUImportSectionedGridLayout *)self sectionIndexPathsBeingDeleted];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) section];
          v13 = [(PUImportSectionedGridLayout *)self preUpdateSectionDecorationAttributesBySection];
          v14 = [NSNumber numberWithInteger:v12];
          v15 = [v13 objectForKeyedSubscript:v14];

          if (v15)
          {
            v16 = [v15 indexPath];
            [v6 addObject:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v9);
    }

    id v4 = v18;
  }

  return v6;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  if ([v6 isEqualToString:@"PUImportSectionedGridLayoutDecorationKindSectionBackground"])
  {
    uint64_t v9 = [(PUImportSectionedGridLayout *)self createLayoutAttributesForSectionBackgroundAtSection:v8];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PUImportSectionedGridLayout;
    uint64_t v9 = [(PUImportSectionedGridLayout *)&v12 layoutAttributesForDecorationViewOfKind:v6 atIndexPath:v7];
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PUImportSectionedGridLayout;
  uint64_t v8 = [(PUSectionedGridLayout *)&v21 layoutAttributesForElementsInRect:sel_layoutAttributesForElementsInRect_];
  uint64_t v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = [(PUImportSectionedGridLayout *)self sectionDecorationAttributesBySection];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [v10 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        [v15 frame];
        v26.origin.CGFloat x = x;
        v26.origin.CGFloat y = y;
        v26.size.CGFloat width = width;
        v26.size.CGFloat height = height;
        if (CGRectIntersectsRect(v25, v26)) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v12);
  }

  return v9;
}

- (void)finalizeCollectionViewUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)PUImportSectionedGridLayout;
  [(PUSectionedGridLayout *)&v3 finalizeCollectionViewUpdates];
  [(PUImportSectionedGridLayout *)self setSectionIndexPathsBeingDeleted:0];
  [(PUImportSectionedGridLayout *)self setPreUpdateSectionDecorationAttributesBySection:0];
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 indexPathBeforeUpdate];
        if ([v12 section] != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v12, "item") == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ([v11 updateAction] == 1) {
            [v5 addObject:v12];
          }
          else {
            [v11 updateAction];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v13 = (void *)[v5 copy];
  [(PUImportSectionedGridLayout *)self setSectionIndexPathsBeingDeleted:v13];

  v14.receiver = self;
  v14.super_class = (Class)PUImportSectionedGridLayout;
  [(PUSectionedGridLayout *)&v14 prepareForCollectionViewUpdates:v6];
}

- (id)createLayoutAttributesForSectionBackgroundAtSection:(unint64_t)a3
{
  [(PUSectionedGridLayout *)self globalTopPadding];
  double v6 = v5;
  [(PUSectionedGridLayout *)self sectionTopPadding];
  double v8 = v7;
  uint64_t v9 = [(PUSectionedGridLayout *)self sectionHeaderElementKind];
  uint64_t v10 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
  uint64_t v11 = [(PUSectionedGridLayout *)self layoutAttributesForSupplementaryViewOfKind:v9 atIndexPath:v10];
  [v11 frame];
  double v16 = v12;
  v48 = (void *)v9;
  if (a3) {
    double v17 = CGRectGetMinY(*(CGRect *)&v12) - v8 - v6;
  }
  else {
    double v17 = 0.0;
  }
  [v11 size];
  double v19 = v18;
  uint64_t v20 = +[UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:@"PUImportSectionedGridLayoutDecorationKindSectionBackground" withIndexPath:v10];
  objc_super v21 = [(PUImportSectionedGridLayout *)self collectionView];
  long long v22 = [v21 dataSource];
  uint64_t v23 = [(PUImportSectionedGridLayout *)self collectionView];
  uint64_t v24 = [v22 collectionView:v23 numberOfItemsInSection:a3];

  if (v24 <= 0)
  {
    double v42 = 0.0;
  }
  else
  {
    CGFloat v47 = v17;
    CGFloat rect = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    CGRect v25 = [MEMORY[0x1E4F28D58] indexPathForItem:v24 - 1 inSection:a3];
    CGRect v26 = [(PUSectionedGridLayout *)self layoutAttributesForItemAtIndexPath:v25];
    [v26 frame];
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    [(PUSectionedGridLayout *)self itemSize];
    double v36 = v35;
    v50.origin.CGFloat x = v28;
    v50.origin.CGFloat y = v30;
    v50.size.CGFloat width = v32;
    v50.size.CGFloat height = v34;
    if (CGRectGetHeight(v50) < v36)
    {
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      CGFloat v28 = v37;
      CGFloat v30 = v38;
      CGFloat v32 = v39;
      CGFloat v34 = v40;
    }
    v51.origin.CGFloat x = v28;
    v51.origin.CGFloat y = v30;
    v51.size.CGFloat width = v32;
    v51.size.CGFloat height = v34;
    double v17 = v47;
    double v41 = v8 + CGRectGetMaxY(v51);
    v52.origin.CGFloat x = v16;
    v52.origin.CGFloat y = v47;
    v52.size.CGFloat width = v19;
    v52.size.CGFloat height = rect;
    double v42 = v41 - CGRectGetMinY(v52);
  }
  objc_msgSend(v20, "setFrame:", v16, v17, v19, v42);
  v43 = [(PUImportSectionedGridLayout *)self emphasizedSectionBackgroundColor];
  [v20 setBackgroundColor:v43];

  [(PUImportSectionedGridLayout *)self emphasizedSectionBottomStrokeWidth];
  objc_msgSend(v20, "setStrokeWidth:");
  v44 = [(PUImportSectionedGridLayout *)self emphasizedSectionBottomStrokeColor];
  [v20 setBottomStrokeColor:v44];

  [v20 setZIndex:-1];
  return v20;
}

- (void)recreateSectionDecorationAttributes
{
  objc_super v3 = [(PUImportSectionedGridLayout *)self sectionDecorationAttributesBySection];
  [v3 removeAllObjects];

  id v4 = [(PUImportSectionedGridLayout *)self collectionView];
  double v5 = [v4 dataSource];
  double v6 = [(PUImportSectionedGridLayout *)self collectionView];
  uint64_t v7 = [v5 numberOfSectionsInCollectionView:v6];

  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (self->_delegateSupportsPerSectionHighlight)
      {
        uint64_t v9 = [(PUSectionedGridLayout *)self delegate];
        int v10 = [v9 importSectionedGridLayout:self shouldEmphasizeSection:i];
      }
      else
      {
        int v10 = 0;
      }
      uint64_t v11 = [(PUImportSectionedGridLayout *)self collectionView];
      double v12 = [v11 dataSource];
      uint64_t v13 = [(PUImportSectionedGridLayout *)self collectionView];
      uint64_t v14 = [v12 collectionView:v13 numberOfItemsInSection:i];

      if (v10)
      {
        if (v14 >= 1)
        {
          long long v15 = [(PUImportSectionedGridLayout *)self createLayoutAttributesForSectionBackgroundAtSection:i];
          double v16 = [(PUImportSectionedGridLayout *)self sectionDecorationAttributesBySection];
          double v17 = [NSNumber numberWithInteger:i];
          [v16 setObject:v15 forKeyedSubscript:v17];
        }
      }
    }
  }
}

- (void)prepareLayout
{
  v5.receiver = self;
  v5.super_class = (Class)PUImportSectionedGridLayout;
  [(PUSectionedGridLayout *)&v5 prepareLayout];
  objc_super v3 = [(PUImportSectionedGridLayout *)self sectionDecorationAttributesBySection];
  id v4 = (void *)[v3 mutableCopy];
  [(PUImportSectionedGridLayout *)self setPreUpdateSectionDecorationAttributesBySection:v4];

  [(PUImportSectionedGridLayout *)self recreateSectionDecorationAttributes];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(PUSectionedGridLayout *)self delegate];

  if (v5 != v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PUImportSectionedGridLayout;
    [(PUSectionedGridLayout *)&v9 setDelegate:v4];
    double v6 = [MEMORY[0x1E4F1CA60] dictionary];
    sectionDecorationAttributesBySection = self->_sectionDecorationAttributesBySection;
    self->_sectionDecorationAttributesBySection = v6;

    double v8 = [(PUSectionedGridLayout *)self delegate];
    self->_delegateSupportsPerSectionHighlight = objc_opt_respondsToSelector() & 1;

    [(PUImportSectionedGridLayout *)self invalidateLayout];
  }
}

- (PUImportSectionedGridLayout)init
{
  v10.receiver = self;
  v10.super_class = (Class)PUImportSectionedGridLayout;
  v2 = [(PUSectionedGridLayout *)&v10 init];
  if (v2)
  {
    [(PUImportSectionedGridLayout *)v2 registerClass:objc_opt_class() forDecorationViewOfKind:@"PUImportSectionedGridLayoutDecorationKindSectionBackground"];
    uint64_t v3 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    emphasizedSectionBackgroundColor = v2->_emphasizedSectionBackgroundColor;
    v2->_emphasizedSectionBackgroundColor = (UIColor *)v3;

    uint64_t v5 = [MEMORY[0x1E4FB1618] separatorColor];
    emphasizedSectionBottomStrokeColor = v2->_emphasizedSectionBottomStrokeColor;
    v2->_emphasizedSectionBottomStrokeColor = (UIColor *)v5;

    uint64_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
    v2->_emphasizedSectionBottomStrokeWidth = 1.0 / v8;
  }
  return v2;
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

@end