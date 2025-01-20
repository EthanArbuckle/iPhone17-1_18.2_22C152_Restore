@interface _TVPlaybackFadeAnimator
- (BOOL)shouldAnimateHalfwayThenPopIn;
- (BOOL)usesCustomEasing;
- (_TVPlaybackFadeAnimator)init;
- (double)transitionDuration;
- (double)transitionDuration:(id)a3;
- (void)_beginFadeAnimationFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 completion:(id)a6;
- (void)animateTransition:(id)a3;
- (void)setShouldAnimateHalfwayThenPopIn:(BOOL)a3;
- (void)setTransitionDuration:(double)a3;
- (void)setUsesCustomEasing:(BOOL)a3;
@end

@implementation _TVPlaybackFadeAnimator

- (_TVPlaybackFadeAnimator)init
{
  v3.receiver = self;
  v3.super_class = (Class)_TVPlaybackFadeAnimator;
  result = [(_TVPlaybackFadeAnimator *)&v3 init];
  if (result)
  {
    result->_transitionDuration = 0.2;
    result->_usesCustomEasing = 1;
  }
  return result;
}

- (double)transitionDuration:(id)a3
{
  return self->_transitionDuration;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  v6 = [v4 viewControllerForKey:*MEMORY[0x263F1D7B0]];
  v7 = [v4 viewControllerForKey:*MEMORY[0x263F1D7A0]];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45___TVPlaybackFadeAnimator_animateTransition___block_invoke;
  v9[3] = &unk_264BA69A0;
  id v10 = v4;
  id v8 = v4;
  [(_TVPlaybackFadeAnimator *)self _beginFadeAnimationFromViewController:v7 toViewController:v6 containerView:v5 completion:v9];
}

- (void)_beginFadeAnimationFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  v13 = [a4 view];
  [v12 bounds];
  objc_msgSend(v13, "setFrame:");
  [v13 setHidden:1];
  [v12 addSubview:v13];
  id v14 = objc_alloc(MEMORY[0x263F1CB60]);
  [v12 bounds];
  v15 = objc_msgSend(v14, "initWithFrame:");
  [v15 setAutoresizingMask:18];
  v16 = [MEMORY[0x263F1C550] blackColor];
  [v15 setBackgroundColor:v16];

  [v15 setAlpha:0.0];
  [v12 addSubview:v15];

  BOOL shouldAnimateHalfwayThenPopIn = self->_shouldAnimateHalfwayThenPopIn;
  if (shouldAnimateHalfwayThenPopIn) {
    double transitionDuration = self->_transitionDuration;
  }
  else {
    double transitionDuration = self->_transitionDuration * 0.5;
  }
  uint64_t usesCustomEasing = self->_usesCustomEasing;
  v20 = (void *)MEMORY[0x263F1CB60];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke;
  v33[3] = &unk_264BA69A0;
  id v34 = v15;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke_2;
  v25[3] = &unk_264BA7830;
  id v26 = v10;
  id v27 = v13;
  BOOL v31 = shouldAnimateHalfwayThenPopIn;
  id v28 = v34;
  id v29 = v11;
  double v30 = transitionDuration;
  char v32 = usesCustomEasing;
  id v21 = v11;
  id v22 = v34;
  id v23 = v13;
  id v24 = v10;
  [v20 animateWithDuration:usesCustomEasing << 16 delay:v33 options:v25 animations:transitionDuration completion:0.0];
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(double)a3
{
  self->_double transitionDuration = a3;
}

- (BOOL)usesCustomEasing
{
  return self->_usesCustomEasing;
}

- (void)setUsesCustomEasing:(BOOL)a3
{
  self->_uint64_t usesCustomEasing = a3;
}

- (BOOL)shouldAnimateHalfwayThenPopIn
{
  return self->_shouldAnimateHalfwayThenPopIn;
}

- (void)setShouldAnimateHalfwayThenPopIn:(BOOL)a3
{
  self->_BOOL shouldAnimateHalfwayThenPopIn = a3;
}

@end