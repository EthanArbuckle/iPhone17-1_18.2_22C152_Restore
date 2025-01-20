@interface StepPagingCollectionViewFlowLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (void)prepareLayout;
@end

@implementation StepPagingCollectionViewFlowLayout

- (void)prepareLayout
{
  v3 = [(StepPagingCollectionViewFlowLayout *)self collectionView];
  [v3 bounds];
  -[StepPagingCollectionViewFlowLayout _updateAttributesForSize:](self, "_updateAttributesForSize:", v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)StepPagingCollectionViewFlowLayout;
  [(StepPagingCollectionViewFlowLayout *)&v6 prepareLayout];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  objc_super v6 = [(StepPagingCollectionViewFlowLayout *)self collectionView];
  [v6 bounds];
  BOOL v9 = height != v8 || width != v7;

  if (v9) {
    -[StepPagingCollectionViewFlowLayout _updateAttributesForSize:](self, "_updateAttributesForSize:", width, height);
  }
  return v9;
}

@end