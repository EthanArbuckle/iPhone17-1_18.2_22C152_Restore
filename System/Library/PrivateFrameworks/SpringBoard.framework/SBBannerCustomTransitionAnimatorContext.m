@interface SBBannerCustomTransitionAnimatorContext
- (BOOL)isPresentationTransition;
- (CGRect)finalContentFrame;
- (CGRect)finalFrame;
- (CGRect)initialContentFrame;
- (CGRect)initialFrame;
- (UIView)transitionView;
- (UIViewControllerContextTransitioning)transitionContext;
- (id)targetViewController;
- (void)setPresentationTransition:(BOOL)a3;
- (void)setTransitionContext:(id)a3;
@end

@implementation SBBannerCustomTransitionAnimatorContext

- (id)targetViewController
{
  v3 = [(SBBannerCustomTransitionAnimatorContext *)self transitionContext];
  v4 = [v3 viewControllerForKey:*MEMORY[0x1E4F43EB0]];

  v5 = [(SBBannerCustomTransitionAnimatorContext *)self transitionContext];
  v6 = [v5 viewControllerForKey:*MEMORY[0x1E4F43EC0]];

  if ([(SBBannerCustomTransitionAnimatorContext *)self isPresentationTransition]) {
    v7 = v6;
  }
  else {
    v7 = v4;
  }
  id v8 = v7;

  return v8;
}

- (UIView)transitionView
{
  v2 = [(SBBannerCustomTransitionAnimatorContext *)self targetViewController];
  v3 = [v2 view];

  return (UIView *)v3;
}

- (CGRect)initialFrame
{
  v3 = [(SBBannerCustomTransitionAnimatorContext *)self transitionContext];
  v4 = [(SBBannerCustomTransitionAnimatorContext *)self targetViewController];
  [v3 initialFrameForViewController:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)initialContentFrame
{
  v3 = [(SBBannerCustomTransitionAnimatorContext *)self targetViewController];
  if (objc_opt_respondsToSelector())
  {
    [v3 bannerContentOutsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F437F8];
    double v7 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  [(SBBannerCustomTransitionAnimatorContext *)self initialFrame];
  double v13 = v7 + v12;
  double v15 = v5 + v14;
  double v17 = v16 - (v11 + v7);
  double v19 = v18 - (v9 + v5);

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)finalFrame
{
  v3 = [(SBBannerCustomTransitionAnimatorContext *)self transitionContext];
  double v4 = [(SBBannerCustomTransitionAnimatorContext *)self targetViewController];
  [v3 finalFrameForViewController:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)finalContentFrame
{
  v3 = [(SBBannerCustomTransitionAnimatorContext *)self targetViewController];
  if (objc_opt_respondsToSelector())
  {
    [v3 bannerContentOutsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F437F8];
    double v7 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  [(SBBannerCustomTransitionAnimatorContext *)self finalFrame];
  double v13 = v7 + v12;
  double v15 = v5 + v14;
  double v17 = v16 - (v11 + v7);
  double v19 = v18 - (v9 + v5);

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
}

- (BOOL)isPresentationTransition
{
  return self->_presentationTransition;
}

- (void)setPresentationTransition:(BOOL)a3
{
  self->_presentationTransition = a3;
}

- (void).cxx_destruct
{
}

@end