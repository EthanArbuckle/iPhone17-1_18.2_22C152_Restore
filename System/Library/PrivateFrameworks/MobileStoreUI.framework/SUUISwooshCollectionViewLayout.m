@interface SUUISwooshCollectionViewLayout
+ (Class)layoutAttributesClass;
+ (float)snapToBoundariesDecelerationRate;
- (BOOL)snapsToItemBoundaries;
- (BOOL)snapsToItemCenters;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (SUUISwooshCollectionViewLayout)init;
- (UIColor)backgroundColor;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setSnapsToItemBoundaries:(BOOL)a3;
- (void)setSnapsToItemCenters:(BOOL)a3;
@end

@implementation SUUISwooshCollectionViewLayout

- (SUUISwooshCollectionViewLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUUISwooshCollectionViewLayout;
  v2 = [(UICollectionViewFlowLayout *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UICollectionViewFlowLayout *)v2 setMinimumLineSpacing:0.0];
    [(UICollectionViewFlowLayout *)v3 setMinimumInteritemSpacing:0.0];
    [(UICollectionViewFlowLayout *)v3 setScrollDirection:1];
  }
  return v3;
}

+ (float)snapToBoundariesDecelerationRate
{
  return *(float *)"fff?";
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)SUUISwooshCollectionViewLayout;
  v4 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v14, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) setBackgroundColor:self->_backgroundColor];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
  return v4;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double x = a4.x;
  v31.receiver = self;
  v31.super_class = (Class)SUUISwooshCollectionViewLayout;
  -[SUUISwooshCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v31, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, a4.x, a4.y);
  double v7 = v6;
  double v9 = v8;
  if (*(_WORD *)&self->_snapsToItemBoundaries)
  {
    long long v10 = [(SUUISwooshCollectionViewLayout *)self collectionView];
    long long v11 = [v10 dataSource];
    long long v12 = [v10 delegate];
    if (objc_opt_respondsToSelector())
    {
      [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
      double v14 = v13;
      [v10 frame];
      double v16 = v15 + v15;
      if ([v10 numberOfSections] >= 1)
      {
        uint64_t v17 = 0;
        double v18 = 0.0;
        do
        {
          uint64_t v19 = [v11 collectionView:v10 numberOfItemsInSection:v17];
          if (v19 >= 1)
          {
            uint64_t v20 = v19;
            uint64_t v21 = 0;
            while (1)
            {
              v22 = [MEMORY[0x263F088C8] indexPathForItem:v21 inSection:v17];
              [v12 collectionView:v10 layout:self sizeForItemAtIndexPath:v22];
              double v16 = v23;

              double v24 = v18 + v16;
              if (v7 > v18 && v7 < v24) {
                break;
              }
              double v18 = v18 + v14 + v16;
              if (v20 == ++v21) {
                goto LABEL_18;
              }
            }
            if (x > 0.0 || x >= 0.0 && v7 - v18 >= v16 * 0.5) {
              double v7 = v14 + v24;
            }
            else {
              double v7 = v18;
            }
          }
LABEL_18:
          ++v17;
        }
        while (v17 < [v10 numberOfSections]);
      }
      if (self->_snapsToItemCenters)
      {
        [v10 frame];
        double v7 = v7 + (v26 - v16) * -0.5;
        [v10 contentInset];
        if (v7 < -v27)
        {
          [v10 contentInset];
          double v7 = -v28;
        }
      }
    }
  }
  double v29 = v7;
  double v30 = v9;
  result.y = v30;
  result.double x = v29;
  return result;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (BOOL)snapsToItemBoundaries
{
  return self->_snapsToItemBoundaries;
}

- (void)setSnapsToItemBoundaries:(BOOL)a3
{
  self->_snapsToItemBoundaries = a3;
}

- (BOOL)snapsToItemCenters
{
  return self->_snapsToItemCenters;
}

- (void)setSnapsToItemCenters:(BOOL)a3
{
  self->_snapsToItemCenters = a3;
}

- (void).cxx_destruct
{
}

@end