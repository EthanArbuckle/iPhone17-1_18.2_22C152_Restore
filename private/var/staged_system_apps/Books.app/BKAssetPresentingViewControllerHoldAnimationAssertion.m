@interface BKAssetPresentingViewControllerHoldAnimationAssertion
- (BCMutableFutureValue)future;
- (BKAssetPresentingViewControllerHoldAnimationAssertion)init;
- (void)dealloc;
- (void)invalidate;
- (void)setFuture:(id)a3;
@end

@implementation BKAssetPresentingViewControllerHoldAnimationAssertion

- (BKAssetPresentingViewControllerHoldAnimationAssertion)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKAssetPresentingViewControllerHoldAnimationAssertion;
  v2 = [(BKAssetPresentingViewControllerHoldAnimationAssertion *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(BKAssetPresentingViewControllerHoldAnimationAssertion *)v2 setFuture:v3];
  }
  return v2;
}

- (void)dealloc
{
  [(BKAssetPresentingViewControllerHoldAnimationAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKAssetPresentingViewControllerHoldAnimationAssertion;
  [(BKAssetPresentingViewControllerHoldAnimationAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  id v2 = [(BKAssetPresentingViewControllerHoldAnimationAssertion *)self future];
  [v2 set:&__kCFBooleanTrue error:0];
}

- (BCMutableFutureValue)future
{
  return self->_future;
}

- (void)setFuture:(id)a3
{
}

- (void).cxx_destruct
{
}

@end