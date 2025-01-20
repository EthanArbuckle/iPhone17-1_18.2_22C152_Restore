@interface _UIAlertControllerAnimatedTransitioning
- (BOOL)isPresentation;
- (UIAlertController)alertController;
- (UIInteractionProgress)interactionProgress;
- (_UIAlertControllerAnimatedTransitioning)initWithInteractionProgress:(id)a3;
- (double)transitionDuration:(id)a3;
- (id)_alertControllerForContext:(id)a3;
- (void)_animateTransition:(id)a3 completionBlock:(id)a4;
- (void)animateTransition:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setInteractionProgress:(id)a3;
- (void)setPresentation:(BOOL)a3;
@end

@implementation _UIAlertControllerAnimatedTransitioning

- (_UIAlertControllerAnimatedTransitioning)initWithInteractionProgress:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIAlertControllerAnimatedTransitioning;
  id v3 = a3;
  v4 = [(_UIAlertControllerAnimatedTransitioning *)&v6 init];
  -[_UIAlertControllerAnimatedTransitioning setInteractionProgress:](v4, "setInteractionProgress:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (id)_alertControllerForContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:@"UITransitionContextFromViewController"];
  objc_super v6 = [v4 viewControllerForKey:@"UITransitionContextToViewController"];

  if ([(_UIAlertControllerAnimatedTransitioning *)self isPresentation]) {
    v7 = v6;
  }
  else {
    v7 = v5;
  }
  v8 = +[UIAlertController _alertControllerContainedInViewController:v7];

  return v8;
}

- (double)transitionDuration:(id)a3
{
  id v4 = [(_UIAlertControllerAnimatedTransitioning *)self _alertControllerForContext:a3];
  v5 = [v4 _visualStyle];
  objc_msgSend(v5, "transitionDurationForPresentation:ofAlertController:", -[_UIAlertControllerAnimatedTransitioning isPresentation](self, "isPresentation"), v4);
  double v7 = v6;

  return v7;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [(_UIAlertControllerAnimatedTransitioning *)self _alertControllerForContext:v4];
  double v6 = [v5 _visualStyle];
  double v7 = [v5 _systemProvidedPresentationDelegate];
  int v8 = [v4 isInteractive];
  BOOL v9 = [(_UIAlertControllerAnimatedTransitioning *)self isPresentation];
  int v10 = [v6 transitionOfType:!v9 shouldBeInteractiveForAlertController:v5];
  if (v8
    && v9
    && ([(_UIAlertControllerAnimatedTransitioning *)self interactionProgress],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11)
    && v10)
  {
    if (+[UIAlertController _shouldUsePresentationController])
    {
      [v5 view];
    }
    else
    {
      [v5 _foregroundView];
    }
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    [(_UIAlertControllerAnimatedTransitioning *)self transitionDuration:v4];
    double v19 = v18;
    v20 = [v4 containerView];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __61___UIAlertControllerAnimatedTransitioning_animateTransition___block_invoke;
    v26[3] = &unk_1E52DAF90;
    id v27 = v4;
    id v28 = v7;
    id v29 = v5;
    v30 = self;
    id v17 = v4;
    id v14 = v5;
    id v15 = v7;
    [v6 animateRevealOfAlertControllerView:v16 alertController:v14 inContainerView:v20 duration:v26 completionBlock:v19];
  }
  else
  {
    if (v10)
    {
      if (objc_opt_respondsToSelector()) {
        [v7 _didBeginSystemProvidedPresentationOfAlertController:v5];
      }
      v12 = +[UIDevice currentDevice];
      v13 = [v12 _tapticEngine];
      [v13 actuateFeedback:1];
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __61___UIAlertControllerAnimatedTransitioning_animateTransition___block_invoke_3;
    v21[3] = &unk_1E52DAFB8;
    char v25 = v10;
    v22 = v7;
    id v23 = v5;
    id v24 = v4;
    id v14 = v4;
    id v15 = v5;
    id v16 = v7;
    [(_UIAlertControllerAnimatedTransitioning *)self _animateTransition:v14 completionBlock:v21];

    id v17 = v22;
  }
}

- (void)_animateTransition:(id)a3 completionBlock:(id)a4
{
  SEL v19 = a2;
  id v23 = a3;
  id v21 = a4;
  double v6 = [v23 viewControllerForKey:@"UITransitionContextFromViewController"];
  double v7 = [v23 viewControllerForKey:@"UITransitionContextToViewController"];
  int v8 = [v23 containerView];
  v22 = v6;
  if (_UIAppUseModernRotationAndPresentationBehaviors() && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v9 = [v23 _toView];
    int v10 = [v23 _fromView];
  }
  else
  {
    int v10 = objc_msgSend(v6, "view", v19);
    BOOL v9 = [v7 view];
    v11 = [v23 containerView];
    [v11 addSubview:v9];
  }
  BOOL v12 = [(_UIAlertControllerAnimatedTransitioning *)self isPresentation];
  v13 = [(_UIAlertControllerAnimatedTransitioning *)self _alertControllerForContext:v23];
  if (+[UIAlertController _shouldUsePresentationController])
  {
    [v13 view];
  }
  else
  {
    [v13 _foregroundView];
  id v14 = };
  [v13 _updateViewFrameForLandscapePresentationInShimIfNecessary];
  [v8 layoutBelowIfNeeded];
  id v15 = [v13 _visualStyle];
  if (!v15)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:v20 object:self file:@"_UIAlertControllerTransitioning.m" lineNumber:140 description:@"UIAlertController is expected to have a visual style during transitioning"];
  }
  if (v12) {
    id v16 = v9;
  }
  else {
    id v16 = v10;
  }
  id v17 = v16;
  [(_UIAlertControllerAnimatedTransitioning *)self transitionDuration:v23];
  objc_msgSend(v15, "animateAlertControllerView:ofAlertController:forPresentation:inContainerView:descendantOfContainerView:duration:completionBlock:", v14, v13, v12, v8, v17, v21);
}

- (BOOL)isPresentation
{
  return self->_presentation;
}

- (void)setPresentation:(BOOL)a3
{
  self->_presentation = a3;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (UIInteractionProgress)interactionProgress
{
  return self->_interactionProgress;
}

- (void)setInteractionProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionProgress, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end