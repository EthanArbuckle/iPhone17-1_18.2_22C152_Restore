@interface SKUICarouselCollectionViewLayout
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

@implementation SKUICarouselCollectionViewLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUICarouselCollectionViewLayout layoutAttributesForElementsInRect:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)SKUICarouselCollectionViewLayout;
  v16 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v29, sel_layoutAttributesForElementsInRect_, x, y, width, height);
  v17 = [(SKUICarouselCollectionViewLayout *)self collectionView];
  v18 = [v17 delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = v16;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(v18, "collectionView:carouselLayout:willApplyLayoutAttributes:", v17, self, *(void *)(*((void *)&v25 + 1) + 8 * i), (void)v25);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v21);
    }
  }

  return v16;
}

- (void)prepareLayout
{
}

- (void)prepareForTransitionToLayout:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICarouselCollectionViewLayout prepareForTransitionToLayout:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUICarouselCollectionViewLayout;
  [(SKUICarouselCollectionViewLayout *)&v15 prepareForTransitionToLayout:v4];
  uint64_t v13 = [(SKUICarouselCollectionViewLayout *)self collectionView];
  uint64_t v14 = [v13 panGestureRecognizer];
  [v14 removeTarget:self action:0];
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUICarouselCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  v53.receiver = self;
  v53.super_class = (Class)SKUICarouselCollectionViewLayout;
  -[SKUICarouselCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v53, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, v7, v6, x, y);
  double v18 = v17;
  id v19 = [(SKUICarouselCollectionViewLayout *)self collectionView];
  [v19 bounds];
  double v21 = v20;
  [(UICollectionViewFlowLayout *)self itemSize];
  double v23 = v22;
  [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
  double v25 = v23 + v24;
  long long v26 = [(SKUICarouselCollectionViewLayout *)self startScrollingIndexPath];
  [(SKUICarouselCollectionViewLayout *)self _collectionViewBoundsCenter];
  double v28 = v27;
  double v30 = v29;
  uint64_t v31 = [(SKUICarouselCollectionViewLayout *)self collectionView];
  v32 = objc_msgSend(v31, "indexPathForItemAtPoint:", v28, v30);

  float v33 = (v21 - v25) * 0.5;
  double v34 = floorf(v33);
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  int v36 = ShouldReverseLayoutDirection;
  if (ShouldReverseLayoutDirection) {
    BOOL v37 = x > 0.0;
  }
  else {
    BOOL v37 = x < 0.0;
  }
  if (v37)
  {
    uint64_t v38 = [v26 item] - 1;
  }
  else
  {
    if (ShouldReverseLayoutDirection) {
      BOOL v39 = x < 0.0;
    }
    else {
      BOOL v39 = x > 0.0;
    }
    if (v39)
    {
      uint64_t v38 = [v26 item] + 1;
    }
    else
    {
      uint64_t v40 = [v32 item];
      if (v40 == [v26 item]) {
        v41 = v26;
      }
      else {
        v41 = v32;
      }
      uint64_t v38 = [v41 item];
    }
  }
  double v42 = -(v34 - (double)v38 * v25);
  if (v36)
  {
    [v19 contentSize];
    double v44 = v43;
    [v19 bounds];
    double v42 = v44 - CGRectGetWidth(v55) - v42;
  }
  [v19 contentSize];
  double v46 = v45;
  [v19 contentInset];
  double v48 = v46 + v47;
  [v19 bounds];
  if (v42 >= v48 - v49) {
    double v50 = v48 - v49;
  }
  else {
    double v50 = v42;
  }

  double v51 = v50;
  double v52 = v18;
  result.double y = v52;
  result.double x = v51;
  return result;
}

- (CGPoint)_collectionViewBoundsCenter
{
  v2 = [(SKUICarouselCollectionViewLayout *)self collectionView];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v15.origin.double x = v4;
  v15.origin.double y = v6;
  v15.size.double width = v8;
  v15.size.double height = v10;
  CGFloat MidX = CGRectGetMidX(v15);
  v16.origin.double x = v4;
  v16.origin.double y = v6;
  v16.size.double width = v8;
  v16.size.double height = v10;
  double MidY = CGRectGetMidY(v16);
  double v13 = MidX;
  result.double y = MidY;
  result.double x = v13;
  return result;
}

- (void)_panGestureRecognized:(id)a3
{
  if ([a3 state] == 1)
  {
    [(SKUICarouselCollectionViewLayout *)self _collectionViewBoundsCenter];
    double v5 = v4;
    double v7 = v6;
    CGFloat v8 = [(SKUICarouselCollectionViewLayout *)self collectionView];
    objc_msgSend(v8, "indexPathForItemAtPoint:", v5, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    [(SKUICarouselCollectionViewLayout *)self setStartScrollingIndexPath:v9];
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

- (void)layoutAttributesForElementsInRect:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)prepareForTransitionToLayout:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)targetContentOffsetForProposedContentOffset:(uint64_t)a3 withScrollingVelocity:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end