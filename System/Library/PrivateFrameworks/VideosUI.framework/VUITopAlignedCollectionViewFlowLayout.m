@interface VUITopAlignedCollectionViewFlowLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
@end

@implementation VUITopAlignedCollectionViewFlowLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v5 = [(VUITopAlignedCollectionViewFlowLayout *)self collectionView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  return v9 != height || v7 != width;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)VUITopAlignedCollectionViewFlowLayout;
  v3 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v33, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [v3 firstObject];
  [v4 frame];
  double MidY = CGRectGetMidY(v37);

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    CGFloat v10 = *MEMORY[0x1E4F1DB28];
    CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat rect = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = *(void *)v30;
    double v12 = 1.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (![v14 representedElementCategory])
        {
          [v14 frame];
          CGFloat x = v38.origin.x;
          CGFloat y = v38.origin.y;
          CGFloat width = v38.size.width;
          CGFloat height = v38.size.height;
          double v19 = CGRectGetMidY(v38);
          double v20 = v19 - MidY;
          if (v19 - MidY < 0.0) {
            double v20 = -v20;
          }
          if (v20 >= v12) {
            goto LABEL_13;
          }
          double v21 = MidY;
          [v6 addObject:v14];
          v39.origin.CGFloat x = x;
          v39.origin.CGFloat y = y;
          v39.size.CGFloat width = width;
          v39.size.CGFloat height = height;
          double v22 = CGRectGetHeight(v39);
          v40.origin.CGFloat x = v10;
          v40.origin.CGFloat y = v25;
          v40.size.CGFloat width = v26;
          v40.size.CGFloat height = rect;
          if (v22 > CGRectGetHeight(v40))
          {
            CGFloat v26 = width;
            CGFloat rect = height;
            CGFloat v25 = y;
            CGFloat v10 = x;
          }
          v23 = [v7 lastObject];

          double MidY = v21;
          double v12 = 1.0;
          if (v14 == v23)
          {
LABEL_13:
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __75__VUITopAlignedCollectionViewFlowLayout_layoutAttributesForElementsInRect___block_invoke;
            v28[3] = &__block_descriptor_64_e49_v32__0__UICollectionViewLayoutAttributes_8Q16_B24l;
            *(CGFloat *)&v28[4] = v10;
            *(CGFloat *)&v28[5] = v25;
            *(CGFloat *)&v28[6] = v26;
            *(CGFloat *)&v28[7] = rect;
            [v6 enumerateObjectsUsingBlock:v28];
            [v6 removeAllObjects];
            [v6 addObject:v14];
            CGFloat v26 = width;
            CGFloat rect = height;
            CGFloat v25 = y;
            CGFloat v10 = x;
            double MidY = v19;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  return v7;
}

void __75__VUITopAlignedCollectionViewFlowLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  [v14 frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = *(double *)(a1 + 40);
  [v14 frame];
  CGFloat v13 = v11 - v12;
  v16.origin.CGFloat x = v4;
  v16.origin.CGFloat y = v6;
  v16.size.CGFloat width = v8;
  v16.size.CGFloat height = v10;
  CGRect v17 = CGRectOffset(v16, 0.0, v13);
  objc_msgSend(v14, "setFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
}

@end