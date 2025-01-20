@interface _UICollectionViewControllerLayoutToLayoutTransition
+ (id)transitionForOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5;
- (BOOL)_shouldCrossFadeBottomBars;
- (BOOL)_shouldCrossFadeNavigationBar;
- (BOOL)crossFadeBottomBars;
- (BOOL)crossFadeNavigationBar;
- (UICollectionViewLayout)toLayout;
- (UIPercentDrivenInteractiveTransition)interactionController;
- (double)transitionDuration:(id)a3;
- (int64_t)operation;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)setCrossFadeBottomBars:(BOOL)a3;
- (void)setCrossFadeNavigationBar:(BOOL)a3;
- (void)setInteractionController:(id)a3;
- (void)setOperation:(int64_t)a3;
- (void)setToLayout:(id)a3;
@end

@implementation _UICollectionViewControllerLayoutToLayoutTransition

+ (id)transitionForOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init((Class)objc_opt_class());
  v10 = v9;
  if (v9)
  {
    if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
    {
      [v9 setOperation:a3];
      [v8 loadViewIfRequired];
      v12 = [v8 collectionViewLayout];
      [v10 setToLayout:v12];

      if (a3 == 1) {
        v13 = v8;
      }
      else {
        v13 = v7;
      }
      objc_msgSend(v10, "setCrossFadeNavigationBar:", objc_msgSend(v13, "shouldCrossFadeNavigationBar"));
      objc_msgSend(v10, "setCrossFadeBottomBars:", objc_msgSend(v13, "shouldCrossFadeBottomBars"));
      id v11 = v10;
      goto LABEL_9;
    }
    NSLog(&cfstr_AttemptToUseAS_1.isa, v9);
  }
  id v11 = 0;
LABEL_9:

  return v11;
}

- (void)animationEnded:(BOOL)a3
{
  id v3 = [(_UICollectionViewControllerLayoutToLayoutTransition *)self interactionController];
  [v3 _resetInteractionController];
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:@"UITransitionContextToViewController"];
  v6 = [v4 viewControllerForKey:@"UITransitionContextFromViewController"];
  id v7 = [v5 view];
  id v8 = [v5 collectionView];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __73___UICollectionViewControllerLayoutToLayoutTransition_animateTransition___block_invoke;
  v30[3] = &unk_1E52DA6B0;
  id v9 = v4;
  id v31 = v9;
  [v8 _setNavigationCompletion:v30];

  [v6 _navigationControllerContentInsetAdjustment];
  objc_msgSend(v5, "_primitiveSetNavigationControllerContentInsetAdjustment:");
  [v6 _navigationControllerContentOffsetAdjustment];
  objc_msgSend(v5, "_primitiveSetNavigationControllerContentOffsetAdjustment:");
  [v6 _contentOverlayInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [v6 _leftContentMargin];
  double v19 = v18;
  [v6 _rightContentMargin];
  objc_msgSend(v5, "_setContentOverlayInsets:andLeftMargin:rightMargin:", v11, v13, v15, v17, v19, v20);
  [v9 finalFrameForViewController:v5];
  objc_msgSend(v7, "setFrame:");
  v21 = [v9 containerView];
  [v21 addSubview:v7];

  [(_UICollectionViewControllerLayoutToLayoutTransition *)self transitionDuration:v9];
  double v23 = v22;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __73___UICollectionViewControllerLayoutToLayoutTransition_animateTransition___block_invoke_2;
  v26[3] = &unk_1E52DCB30;
  id v27 = v5;
  v28 = self;
  id v29 = v9;
  id v24 = v9;
  id v25 = v5;
  +[UIView animateWithDuration:v26 animations:v23];
}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (BOOL)_shouldCrossFadeNavigationBar
{
  return self->_crossFadeNavigationBar;
}

- (BOOL)_shouldCrossFadeBottomBars
{
  return self->_crossFadeBottomBars;
}

- (UICollectionViewLayout)toLayout
{
  return self->_toLayout;
}

- (void)setToLayout:(id)a3
{
}

- (BOOL)crossFadeNavigationBar
{
  return self->_crossFadeNavigationBar;
}

- (void)setCrossFadeNavigationBar:(BOOL)a3
{
  self->_crossFadeNavigationBar = a3;
}

- (BOOL)crossFadeBottomBars
{
  return self->_crossFadeBottomBars;
}

- (void)setCrossFadeBottomBars:(BOOL)a3
{
  self->_crossFadeBottomBars = a3;
}

- (UIPercentDrivenInteractiveTransition)interactionController
{
  return self->_interactionController;
}

- (void)setInteractionController:(id)a3
{
  self->_interactionController = (UIPercentDrivenInteractiveTransition *)a3;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (void).cxx_destruct
{
}

@end