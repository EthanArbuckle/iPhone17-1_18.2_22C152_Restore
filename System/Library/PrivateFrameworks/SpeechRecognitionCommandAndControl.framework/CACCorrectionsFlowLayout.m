@interface CACCorrectionsFlowLayout
+ (Class)layoutAttributesClass;
- (double)_availableWidth;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
@end

@implementation CACCorrectionsFlowLayout

- (void)prepareLayout
{
  v2.receiver = self;
  v2.super_class = (Class)CACCorrectionsFlowLayout;
  [(UICollectionViewFlowLayout *)&v2 prepareLayout];
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (double)_availableWidth
{
  v3 = [(CACCorrectionsFlowLayout *)self collectionView];
  [v3 bounds];
  double Width = CGRectGetWidth(v16);
  v5 = [(CACCorrectionsFlowLayout *)self collectionView];
  [v5 contentInset];
  double v7 = Width - v6;
  v8 = [(CACCorrectionsFlowLayout *)self collectionView];
  [v8 contentInset];
  double v10 = v7 - v9;
  [(UICollectionViewFlowLayout *)self sectionInset];
  double v12 = v10 - v11;
  [(UICollectionViewFlowLayout *)self sectionInset];
  double v14 = v12 - v13;

  return v14;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CACCorrectionsFlowLayout;
  v4 = [(UICollectionViewFlowLayout *)&v6 layoutAttributesForItemAtIndexPath:a3];
  [(CACCorrectionsFlowLayout *)self _availableWidth];
  objc_msgSend(v4, "setAvailableWidth:");
  return v4;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)CACCorrectionsFlowLayout;
  v4 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v17, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CACCorrectionsFlowLayout *)self _availableWidth];
  double v6 = v5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "setAvailableWidth:", v6, (void)v13);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);
  }

  return v7;
}

@end