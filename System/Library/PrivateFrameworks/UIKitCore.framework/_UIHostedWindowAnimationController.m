@interface _UIHostedWindowAnimationController
- (double)duration;
- (double)transitionDuration:(id)a3;
- (id)transitionActions;
- (void)animateTransition:(id)a3;
- (void)setDuration:(double)a3;
- (void)setTransitionActions:(id)a3;
@end

@implementation _UIHostedWindowAnimationController

- (double)transitionDuration:(id)a3
{
  return self->_duration;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  v6 = [v4 viewControllerForKey:@"UITransitionContextToViewController"];
  [v4 finalFrameForViewController:v6];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  [(_UIHostedWindowAnimationController *)self transitionDuration:v4];
  double v16 = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___UIHostedWindowAnimationController_animateTransition___block_invoke;
  aBlock[3] = &unk_1E52E6160;
  id v17 = v5;
  uint64_t v34 = v8;
  uint64_t v35 = v10;
  uint64_t v36 = v12;
  uint64_t v37 = v14;
  id v31 = v17;
  v32 = self;
  id v18 = v4;
  id v33 = v18;
  v19 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __56___UIHostedWindowAnimationController_animateTransition___block_invoke_2;
  v26 = &unk_1E52DAF68;
  v27 = self;
  id v20 = v18;
  id v28 = v20;
  id v21 = v17;
  id v29 = v21;
  v22 = (void (**)(void *, uint64_t))_Block_copy(&v23);
  if (objc_msgSend(v20, "isAnimated", v23, v24, v25, v26, v27))
  {
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", [v20 _completionCurve] << 16, v19, v22, v16, 0.0);
    [v20 _setTransitionIsInFlight:1];
  }
  else
  {
    v19[2](v19);
    v22[2](v22, 1);
  }
}

- (id)transitionActions
{
  return self->_transitionActions;
}

- (void)setTransitionActions:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
}

@end