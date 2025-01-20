@interface THWiOSExpandedMovieAnimationDelegate
- (BOOL)enforceAnimationLayer;
- (BOOL)shouldAnimateTargetLayer:(id)a3;
- (BOOL)shouldAnimateToFit;
- (BOOL)shouldFadeInTargetLayer:(id)a3;
- (BOOL)shouldFadeOutAnimationLayer:(id)a3;
- (CGAffineTransform)freeTransform;
- (THWiOSExpandedMovieAnimationDelegate)initWithMovieViewController:(id)a3;
- (THWiOSExpandedMovieViewController)movieViewController;
- (id)animationLayer;
- (id)shadowAnimationLayer;
- (id)targetLayer;
- (void)dealloc;
- (void)reparentTargetLayerIfBackedByView:(id)a3;
- (void)setMovieViewController:(id)a3;
@end

@implementation THWiOSExpandedMovieAnimationDelegate

- (THWiOSExpandedMovieAnimationDelegate)initWithMovieViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWiOSExpandedMovieAnimationDelegate;
  result = [(THWiOSExpandedMovieAnimationDelegate *)&v5 init];
  if (result) {
    result->_movieViewController = (THWiOSExpandedMovieViewController *)a3;
  }
  return result;
}

- (void)dealloc
{
  self->_movieViewController = 0;
  v2.receiver = self;
  v2.super_class = (Class)THWiOSExpandedMovieAnimationDelegate;
  [(THWiOSExpandedMovieAnimationDelegate *)&v2 dealloc];
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  if (![(THWFreeTransformController *)[(THWiOSExpandedMovieViewController *)[(THWiOSExpandedMovieAnimationDelegate *)self movieViewController] freeTransformController] isFreeTransformInProgress]|| (id result = [(THWFreeTransformController *)[(THWiOSExpandedMovieViewController *)[(THWiOSExpandedMovieAnimationDelegate *)self movieViewController] freeTransformController] freeTransformLayer]) == 0)
  {
    id v4 = [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)[(THWiOSExpandedMovieAnimationDelegate *)self movieViewController] moviePlayerViewController] view];
    return [v4 layer];
  }
  return result;
}

- (id)shadowAnimationLayer
{
  return 0;
}

- (CGAffineTransform)freeTransform
{
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  id result = (CGAffineTransform *)[(THWFreeTransformController *)[(THWiOSExpandedMovieViewController *)[(THWiOSExpandedMovieAnimationDelegate *)self movieViewController] freeTransformController] isFreeTransformInProgress];
  if (result)
  {
    id result = [(THWiOSExpandedMovieViewController *)[(THWiOSExpandedMovieAnimationDelegate *)self movieViewController] freeTransformController];
    if (result)
    {
      id result = (CGAffineTransform *)[(CGAffineTransform *)result currentTransform];
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v8 = 0u;
    }
    long long v7 = v9;
    *(_OWORD *)&retstr->a = v8;
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = v10;
  }
  return result;
}

- (BOOL)enforceAnimationLayer
{
  return 1;
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 0;
}

- (id)targetLayer
{
  id v2 = [(THWiOSExpandedMovieViewController *)[(THWiOSExpandedMovieAnimationDelegate *)self movieViewController] view];

  return [v2 layer];
}

- (BOOL)shouldAnimateToFit
{
  return 1;
}

- (void)reparentTargetLayerIfBackedByView:(id)a3
{
  [-[THWiOSExpandedMovieViewController view](-[THWiOSExpandedMovieAnimationDelegate movieViewController](self, "movieViewController", a3), "view") addSubview:[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](-[THWiOSExpandedMovieAnimationDelegate movieViewController](self, "movieViewController"), "moviePlayerViewController"), "view")];
  id v4 = [(THWExpandedViewControllerDelegate *)[(THWiOSExpandedMovieViewController *)[(THWiOSExpandedMovieAnimationDelegate *)self movieViewController] delegate] rootSuperview];
  id v5 = [(THWiOSExpandedMovieViewController *)[(THWiOSExpandedMovieAnimationDelegate *)self movieViewController] view];

  [v4 addSubview:v5];
}

- (THWiOSExpandedMovieViewController)movieViewController
{
  return self->_movieViewController;
}

- (void)setMovieViewController:(id)a3
{
  self->_movieViewController = (THWiOSExpandedMovieViewController *)a3;
}

@end