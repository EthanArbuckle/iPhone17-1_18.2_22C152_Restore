@interface SUUICarouselCollectionViewLayout
+ (Class)layoutAttributesClass;
- (CGPoint)_collectionViewBoundsCenter;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (NSIndexPath)startScrollingIndexPath;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)_panGestureRecognized:(id)a3;
- (void)prepareForTransitionToLayout:(id)a3;
- (void)prepareLayout;
- (void)setStartScrollingIndexPath:(id)a3;
@end

@implementation SUUICarouselCollectionViewLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)SUUICarouselCollectionViewLayout;
  v4 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v17, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = [(SUUICarouselCollectionViewLayout *)self collectionView];
  v6 = [v5 delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
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
          objc_msgSend(v6, "collectionView:carouselLayout:willApplyLayoutAttributes:", v5, self, *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v4;
}

- (void)prepareLayout
{
  v7.receiver = self;
  v7.super_class = (Class)SUUICarouselCollectionViewLayout;
  [(UICollectionViewFlowLayout *)&v7 prepareLayout];
  v3 = [(SUUICarouselCollectionViewLayout *)self collectionView];
  v4 = [v3 panGestureRecognizer];
  [v4 removeTarget:self action:0];

  v5 = [(SUUICarouselCollectionViewLayout *)self collectionView];
  v6 = [v5 panGestureRecognizer];
  [v6 addTarget:self action:sel__panGestureRecognized_];
}

- (void)prepareForTransitionToLayout:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUICarouselCollectionViewLayout;
  [(SUUICarouselCollectionViewLayout *)&v6 prepareForTransitionToLayout:a3];
  v4 = [(SUUICarouselCollectionViewLayout *)self collectionView];
  v5 = [v4 panGestureRecognizer];
  [v5 removeTarget:self action:0];
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double x = a4.x;
  v42.receiver = self;
  v42.super_class = (Class)SUUICarouselCollectionViewLayout;
  -[SUUICarouselCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v42, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, a4.x, a4.y);
  double v7 = v6;
  uint64_t v8 = [(SUUICarouselCollectionViewLayout *)self collectionView];
  [v8 bounds];
  double v10 = v9;
  [(UICollectionViewFlowLayout *)self itemSize];
  double v12 = v11;
  [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
  double v14 = v12 + v13;
  long long v15 = [(SUUICarouselCollectionViewLayout *)self startScrollingIndexPath];
  [(SUUICarouselCollectionViewLayout *)self _collectionViewBoundsCenter];
  double v17 = v16;
  double v19 = v18;
  v20 = [(SUUICarouselCollectionViewLayout *)self collectionView];
  v21 = objc_msgSend(v20, "indexPathForItemAtPoint:", v17, v19);

  float v22 = (v10 - v14) * 0.5;
  double v23 = floorf(v22);
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  int v25 = ShouldReverseLayoutDirection;
  if (ShouldReverseLayoutDirection) {
    BOOL v26 = x > 0.0;
  }
  else {
    BOOL v26 = x < 0.0;
  }
  if (v26)
  {
    uint64_t v27 = [v15 item] - 1;
  }
  else
  {
    if (ShouldReverseLayoutDirection) {
      BOOL v28 = x < 0.0;
    }
    else {
      BOOL v28 = x > 0.0;
    }
    if (v28)
    {
      uint64_t v27 = [v15 item] + 1;
    }
    else
    {
      uint64_t v29 = [v21 item];
      if (v29 == [v15 item]) {
        v30 = v15;
      }
      else {
        v30 = v21;
      }
      uint64_t v27 = [v30 item];
    }
  }
  double v31 = -(v23 - (double)v27 * v14);
  if (v25)
  {
    [v8 contentSize];
    double v33 = v32;
    [v8 bounds];
    double v31 = v33 - CGRectGetWidth(v44) - v31;
  }
  [v8 contentSize];
  double v35 = v34;
  [v8 contentInset];
  double v37 = v35 + v36;
  [v8 bounds];
  if (v31 >= v37 - v38) {
    double v39 = v37 - v38;
  }
  else {
    double v39 = v31;
  }

  double v40 = v39;
  double v41 = v7;
  result.y = v41;
  result.double x = v40;
  return result;
}

- (CGPoint)_collectionViewBoundsCenter
{
  v2 = [(SUUICarouselCollectionViewLayout *)self collectionView];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v15.origin.double x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  CGFloat MidX = CGRectGetMidX(v15);
  v16.origin.double x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  double MidY = CGRectGetMidY(v16);
  double v13 = MidX;
  result.y = MidY;
  result.double x = v13;
  return result;
}

- (void)_panGestureRecognized:(id)a3
{
  if ([a3 state] == 1)
  {
    [(SUUICarouselCollectionViewLayout *)self _collectionViewBoundsCenter];
    double v5 = v4;
    double v7 = v6;
    CGFloat v8 = [(SUUICarouselCollectionViewLayout *)self collectionView];
    objc_msgSend(v8, "indexPathForItemAtPoint:", v5, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    [(SUUICarouselCollectionViewLayout *)self setStartScrollingIndexPath:v9];
  }
}

- (NSIndexPath)startScrollingIndexPath
{
  return self->_startScrollingIndexPath;
}

- (void)setStartScrollingIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end