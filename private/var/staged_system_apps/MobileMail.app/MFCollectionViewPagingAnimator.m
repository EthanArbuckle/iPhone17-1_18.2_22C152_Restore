@interface MFCollectionViewPagingAnimator
- (BOOL)isAnimatingScroll;
- (MFCollectionViewPagingAnimator)initWithCollectionView:(id)a3;
- (UICollectionView)collectionView;
- (double)autoScrollOffsetAdjustment;
- (double)autoScrollOffsetAdjustmentWithoutPreviousMessage;
- (void)bounceAlongEdge:(unint64_t)a3;
- (void)cancelAllAnimations;
- (void)scrollToItemAtIndexPath:(id)a3 dynamicOffset:(id)a4 shouldAdjustToShowPreviousMessage:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)setAnimatingScroll:(BOOL)a3;
- (void)setAutoScrollOffsetAdjustment:(double)a3;
- (void)setAutoScrollOffsetAdjustmentWithoutPreviousMessage:(double)a3;
- (void)setCollectionView:(id)a3;
@end

@implementation MFCollectionViewPagingAnimator

- (MFCollectionViewPagingAnimator)initWithCollectionView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFCollectionViewPagingAnimator;
  v5 = [(MFCollectionViewPagingAnimator *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MFCollectionViewPagingAnimator *)v5 setCollectionView:v4];
  }

  return v6;
}

- (void)scrollToItemAtIndexPath:(id)a3 dynamicOffset:(id)a4 shouldAdjustToShowPreviousMessage:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  v14 = (void (**)(void))a7;
  [(MFCollectionViewPagingAnimator *)self cancelAllAnimations];
  v15 = [(MFCollectionViewPagingAnimator *)self collectionView];
  [v15 _systemContentInset];
  double v17 = v16;
  [v15 contentInset];
  if (v13)
  {
    [v15 mf_contentOffsetApplyingDynamicOffset:v13 indexPath:v12];
    double v20 = v19;
  }
  else
  {
    double v21 = v17 + v18;
    if ([v12 item])
    {
      v22 = [(MFCollectionViewPagingAnimator *)self collectionView];
      v23 = [v22 layoutAttributesForItemAtIndexPath:v12];

      if (v23)
      {
        [v23 frame];
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;
        if (v9) {
          [(MFCollectionViewPagingAnimator *)self autoScrollOffsetAdjustment];
        }
        else {
          [(MFCollectionViewPagingAnimator *)self autoScrollOffsetAdjustmentWithoutPreviousMessage];
        }
        double v33 = v32;
        v43.origin.x = v25;
        v43.origin.y = v27;
        v43.size.width = v29;
        v43.size.height = v31;
        double v20 = CGRectGetMinY(v43) - (v21 + v33);
      }
      else
      {
        double v20 = 0.0;
      }
    }
    else
    {
      double v20 = -v21;
    }
  }
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1001826A0;
  v39[3] = &unk_100606D98;
  id v34 = v15;
  id v40 = v34;
  double v41 = v20;
  BOOL v42 = v8;
  v35 = objc_retainBlock(v39);
  v36 = v35;
  if (v8)
  {
    [(MFCollectionViewPagingAnimator *)self setAnimatingScroll:1];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100182818;
    v37[3] = &unk_100607840;
    v37[4] = self;
    v38 = v14;
    +[UIView animateWithDuration:0 delay:v36 usingSpringWithDamping:v37 initialSpringVelocity:0.45 options:0.0 animations:1.0 completion:0.0];
  }
  else
  {
    ((void (*)(void *))v35[2])(v35);
    if (v14) {
      v14[2](v14);
    }
  }
}

- (void)bounceAlongEdge:(unint64_t)a3
{
  if (a3 != 1 && a3 != 4)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MFCollectionViewPagingAnimator.m" lineNumber:98 description:@"bounceOnEdge currently only supports UIRectEdgeTop and UIRectEdgeBottom"];
  }
  [(MFCollectionViewPagingAnimator *)self cancelAllAnimations];
  v7 = [(MFCollectionViewPagingAnimator *)self collectionView];
  BOOL v8 = v7;
  if (a3 == 1)
  {
    [v7 contentInset];
    double v10 = -v9;
    double v11 = -70.0 - v9;
  }
  else
  {
    [v7 contentSize];
    double v13 = v12;
    [v8 frame];
    double Height = CGRectGetHeight(v26);
    [v8 contentInset];
    double v16 = v15;
    [v8 contentOffset];
    if (v13 - (Height - v16) >= v17) {
      double v10 = v13 - (Height - v16);
    }
    else {
      double v10 = v17;
    }
    double v11 = v10 + 70.0;
  }
  [(MFCollectionViewPagingAnimator *)self setAnimatingScroll:1];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100182A9C;
  v23[3] = &unk_1006048E0;
  id v24 = v8;
  double v25 = v11;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100182AAC;
  v19[3] = &unk_10060AFB8;
  id v18 = v24;
  double v22 = v10;
  id v20 = v18;
  double v21 = self;
  +[UIView animateWithDuration:0x10000 delay:v23 options:v19 animations:0.2 completion:0.0];
}

- (void)cancelAllAnimations
{
  id v4 = [(MFCollectionViewPagingAnimator *)self collectionView];
  v3 = [v4 layer];
  [v3 removeAllAnimations];

  id v5 = [(MFCollectionViewPagingAnimator *)self collectionView];
  [v5 _stopScrollingAndZoomingAnimations];
}

- (double)autoScrollOffsetAdjustment
{
  return self->_autoScrollOffsetAdjustment;
}

- (void)setAutoScrollOffsetAdjustment:(double)a3
{
  self->_autoScrollOffsetAdjustment = a3;
}

- (double)autoScrollOffsetAdjustmentWithoutPreviousMessage
{
  return self->_autoScrollOffsetAdjustmentWithoutPreviousMessage;
}

- (void)setAutoScrollOffsetAdjustmentWithoutPreviousMessage:(double)a3
{
  self->_autoScrollOffsetAdjustmentWithoutPreviousMessage = a3;
}

- (BOOL)isAnimatingScroll
{
  return self->_animatingScroll;
}

- (void)setAnimatingScroll:(BOOL)a3
{
  self->_animatingScroll = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end