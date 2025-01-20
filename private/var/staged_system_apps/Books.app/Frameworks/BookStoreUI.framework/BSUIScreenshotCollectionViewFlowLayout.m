@interface BSUIScreenshotCollectionViewFlowLayout
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BSUIScreenshotCollectionViewFlowLayout)init;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (void)_panGestureRecognized:(id)a3;
- (void)dealloc;
- (void)prepareForTransitionToLayout:(id)a3;
- (void)prepareLayout;
@end

@implementation BSUIScreenshotCollectionViewFlowLayout

- (BSUIScreenshotCollectionViewFlowLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)BSUIScreenshotCollectionViewFlowLayout;
  v2 = [(BSUIScreenshotCollectionViewFlowLayout *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BSUIScreenshotCollectionViewFlowLayout *)v2 setScrollDirection:1];
  }
  return v3;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)prepareLayout
{
  v7.receiver = self;
  v7.super_class = (Class)BSUIScreenshotCollectionViewFlowLayout;
  [(BSUIScreenshotCollectionViewFlowLayout *)&v7 prepareLayout];
  v3 = [(BSUIScreenshotCollectionViewFlowLayout *)self collectionView];
  v4 = [v3 panGestureRecognizer];
  [v4 removeTarget:self action:0];

  objc_super v5 = [(BSUIScreenshotCollectionViewFlowLayout *)self collectionView];
  v6 = [v5 panGestureRecognizer];
  [v6 addTarget:self action:"_panGestureRecognized:"];
}

- (void)prepareForTransitionToLayout:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BSUIScreenshotCollectionViewFlowLayout;
  [(BSUIScreenshotCollectionViewFlowLayout *)&v6 prepareForTransitionToLayout:a3];
  v4 = [(BSUIScreenshotCollectionViewFlowLayout *)self collectionView];
  objc_super v5 = [v4 panGestureRecognizer];
  [v5 removeTarget:self action:0];
}

- (void)dealloc
{
  v3 = [(BSUIScreenshotCollectionViewFlowLayout *)self collectionView];
  v4 = [v3 panGestureRecognizer];
  [v4 removeTarget:self action:0];

  v5.receiver = self;
  v5.super_class = (Class)BSUIScreenshotCollectionViewFlowLayout;
  [(BSUIScreenshotCollectionViewFlowLayout *)&v5 dealloc];
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  v9 = [(BSUIScreenshotCollectionViewFlowLayout *)self collectionView];
  [v9 bounds];
  v10 = [(BSUIScreenshotCollectionViewFlowLayout *)self layoutAttributesForElementsInRect:"layoutAttributesForElementsInRect:"];

  if ([v10 count])
  {
    v52.receiver = self;
    v52.super_class = (Class)BSUIScreenshotCollectionViewFlowLayout;
    -[BSUIScreenshotCollectionViewFlowLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v52, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", v7, v6, x, y);
    double v12 = v11;
    v13 = [(BSUIScreenshotCollectionViewFlowLayout *)self collectionView];
    [v13 frame];
    double v14 = v7 + CGRectGetWidth(v55);
    [(BSUIScreenshotCollectionViewFlowLayout *)self collectionViewContentSize];
    double v16 = v15;

    if (v14 <= v16)
    {
      v17 = 0;
      if (v7 > 0.0)
      {
        double v18 = 0.0;
        while (1)
        {
          v19 = +[NSIndexPath indexPathForRow:v17 inSection:0];
          v20 = [(BSUIScreenshotCollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v19];

          [v20 bounds];
          double Width = CGRectGetWidth(v56);
          if (v18 + Width * 0.5 >= v7) {
            break;
          }
          [(BSUIScreenshotCollectionViewFlowLayout *)self minimumLineSpacing];
          double v18 = v18 + Width + v22;
          ++v17;

          if (v18 >= v7) {
            goto LABEL_10;
          }
        }
      }
LABEL_10:
      indexPathAtInitialScroll = self->_indexPathAtInitialScroll;
      double v51 = v12;
      if (indexPathAtInitialScroll && (char *)[(NSIndexPath *)indexPathAtInitialScroll item] == v17)
      {
        if (x >= 0.0)
        {
          if (x > 0.0)
          {
            v27 = [(BSUIScreenshotCollectionViewFlowLayout *)self collectionView];
            v28 = (char *)[v27 numberOfItemsInSection:0] - 1;

            if ((uint64_t)v28 >= (uint64_t)(v17 + 1)) {
              ++v17;
            }
            else {
              v17 = v28;
            }
          }
        }
        else
        {
          if ((uint64_t)v17 <= 1) {
            uint64_t v26 = 1;
          }
          else {
            uint64_t v26 = (uint64_t)v17;
          }
          v17 = (char *)(v26 - 1);
        }
      }
      v29 = +[NSIndexPath indexPathForRow:v17 inSection:0];
      v30 = [(BSUIScreenshotCollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v29];

      [v30 frame];
      double v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;
      v39 = [(BSUIScreenshotCollectionViewFlowLayout *)self collectionView];
      [v39 bounds];
      CGFloat v41 = v40;
      CGFloat v43 = v42;
      CGFloat v45 = v44;
      CGFloat v47 = v46;

      v57.origin.double x = v41;
      v57.origin.double y = v43;
      v57.size.width = v45;
      v57.size.height = v47;
      double v48 = CGRectGetWidth(v57);
      v58.origin.double x = v32;
      v58.origin.double y = v34;
      v58.size.width = v36;
      v58.size.height = v38;
      double v7 = v32 + (v48 - CGRectGetWidth(v58)) * -0.5;

      double v12 = v51;
    }
  }
  else
  {
    v53.receiver = self;
    v53.super_class = (Class)BSUIScreenshotCollectionViewFlowLayout;
    -[BSUIScreenshotCollectionViewFlowLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v53, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", v7, v6, x, y);
    double v7 = v23;
    double v12 = v24;
  }

  double v49 = v7;
  double v50 = v12;
  result.double y = v50;
  result.double x = v49;
  return result;
}

- (void)_panGestureRecognized:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 1)
  {
    id v9 = [(BSUIScreenshotCollectionViewFlowLayout *)self collectionView];
    v4 = [(BSUIScreenshotCollectionViewFlowLayout *)self collectionView];
    [v4 bounds];
    double MidX = CGRectGetMidX(v11);
    double v6 = [(BSUIScreenshotCollectionViewFlowLayout *)self collectionView];
    [v6 bounds];
    [v9 indexPathForItemAtPoint:MidX, CGRectGetMidY(v12)];
    double v7 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    indexPathAtInitialScroll = self->_indexPathAtInitialScroll;
    self->_indexPathAtInitialScroll = v7;
  }
}

- (void).cxx_destruct
{
}

@end