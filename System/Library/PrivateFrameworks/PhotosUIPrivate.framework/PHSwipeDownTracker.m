@interface PHSwipeDownTracker
- (BOOL)shouldFinishDismissal;
- (CGAffineTransform)trackedTransform;
- (CGPoint)trackedCenter;
- (CGRect)trackedBounds;
- (PHDisplayVelocity)trackedVelocity;
- (PHSwipeDownTracker)init;
- (PXSwipeDownTracker)impl;
- (double)dismissalProgress;
- (double)finalAnimationDuration;
- (double)finalAnimationSpringDamping;
- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6;
- (void)trackGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4;
@end

@implementation PHSwipeDownTracker

- (void).cxx_destruct
{
}

- (PXSwipeDownTracker)impl
{
  return self->_impl;
}

- (double)finalAnimationSpringDamping
{
  v2 = [(PHSwipeDownTracker *)self impl];
  [v2 finalAnimationSpringDamping];
  double v4 = v3;

  return v4;
}

- (double)finalAnimationDuration
{
  v2 = [(PHSwipeDownTracker *)self impl];
  [v2 finalAnimationDuration];
  double v4 = v3;

  return v4;
}

- (PHDisplayVelocity)trackedVelocity
{
  v2 = [(PHSwipeDownTracker *)self impl];
  [v2 trackedVelocity];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (CGAffineTransform)trackedTransform
{
  double v4 = [(PHSwipeDownTracker *)self impl];
  if (v4)
  {
    double v6 = v4;
    [v4 trackedTransform];
    double v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (CGRect)trackedBounds
{
  v2 = [(PHSwipeDownTracker *)self impl];
  [v2 trackedBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGPoint)trackedCenter
{
  v2 = [(PHSwipeDownTracker *)self impl];
  [v2 trackedCenter];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (BOOL)shouldFinishDismissal
{
  v2 = [(PHSwipeDownTracker *)self impl];
  char v3 = [v2 shouldFinishDismissal];

  return v3;
}

- (double)dismissalProgress
{
  v2 = [(PHSwipeDownTracker *)self impl];
  [v2 dismissalProgress];
  double v4 = v3;

  return v4;
}

- (void)trackGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  id v8 = [(PHSwipeDownTracker *)self impl];
  objc_msgSend(v8, "trackGestureTranslation:velocity:", v7, v6, x, y);
}

- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  double v13 = a3.y;
  double v14 = a3.x;
  v15 = [(PHSwipeDownTracker *)self impl];
  long long v16 = *(_OWORD *)&a5->c;
  v17[0] = *(_OWORD *)&a5->a;
  v17[1] = v16;
  v17[2] = *(_OWORD *)&a5->tx;
  objc_msgSend(v15, "startTrackingCenter:bounds:transform:withInitialGestureLocation:velocity:", v17, v14, v13, v12, v11, width, height, x, y, *MEMORY[0x1E4F91338], *(void *)(MEMORY[0x1E4F91338] + 8));
}

- (PHSwipeDownTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHSwipeDownTracker;
  v2 = [(PHSwipeDownTracker *)&v6 init];
  if (v2)
  {
    double v3 = (PXSwipeDownTracker *)objc_alloc_init(MEMORY[0x1E4F907C8]);
    impl = v2->_impl;
    v2->_impl = v3;
  }
  return v2;
}

@end