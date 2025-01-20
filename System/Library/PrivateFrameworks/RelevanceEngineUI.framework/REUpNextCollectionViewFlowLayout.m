@interface REUpNextCollectionViewFlowLayout
+ (Class)layoutAttributesClass;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
@end

@implementation REUpNextCollectionViewFlowLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v34 = *MEMORY[0x263EF8340];
  v8 = [(REUpNextCollectionViewFlowLayout *)self collectionView];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v32.receiver = self;
  v32.super_class = (Class)REUpNextCollectionViewFlowLayout;
  v17 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v32, sel_layoutAttributesForElementsInRect_, x, y, width, height);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v22 frame];
        objc_msgSend(v22, "setUnitFrameOnScreen:", REUpNextUnitRectForFrameInBounds(v23, v24, v25, v26, v10, v12, v14, v16));
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v19);
  }

  return v17;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(REUpNextCollectionViewFlowLayout *)self collectionView];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v20.receiver = self;
  v20.super_class = (Class)REUpNextCollectionViewFlowLayout;
  CGFloat v14 = [(UICollectionViewFlowLayout *)&v20 layoutAttributesForItemAtIndexPath:v4];

  [v14 frame];
  objc_msgSend(v14, "setUnitFrameOnScreen:", REUpNextUnitRectForFrameInBounds(v15, v16, v17, v18, v7, v9, v11, v13));

  return v14;
}

@end