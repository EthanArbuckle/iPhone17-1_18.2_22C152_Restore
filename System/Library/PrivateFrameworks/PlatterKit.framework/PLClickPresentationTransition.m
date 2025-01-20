@interface PLClickPresentationTransition
- (BOOL)propagatesPresentingViewTransform;
- (MTMaterialView)backgroundView;
- (PLClickPresentationTransition)initWithTransitionDelegate:(id)a3 presentingViewController:(id)a4 presentedViewController:(id)a5 completion:(id)a6;
- (UIViewPropertyAnimator)customAnimator;
- (id)_animator;
- (id)_newAnimator;
- (void)_configureTransitionContextWithFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)setBackgroundView:(id)a3;
- (void)setPropagatesPresentingViewTransform:(BOOL)a3;
- (void)transitionDidEnd:(BOOL)a3;
- (void)updateBackgroundViewForTransition;
@end

@implementation PLClickPresentationTransition

- (PLClickPresentationTransition)initWithTransitionDelegate:(id)a3 presentingViewController:(id)a4 presentedViewController:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PLClickPresentationTransition;
  v11 = [(PLClickPresentationTransition *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_transitionDelegate, a3);
    v13 = objc_alloc_init(_PLViewControllerOneToOneTransitionContext);
    transitionContext = v12->_transitionContext;
    v12->_transitionContext = v13;

    uint64_t v15 = [v10 copy];
    id completion = v12->_completion;
    v12->_id completion = (id)v15;
  }
  return v12;
}

- (void)updateBackgroundViewForTransition
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PLClickPresentationInteractionManager.m" lineNumber:420 description:@"Abstract"];
}

- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_transitionContext)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PLClickPresentationInteractionManager.m" lineNumber:426 description:@"Must have a transition context at this point."];
  }
  [(PLClickPresentationTransition *)self _configureTransitionContextWithFromView:v13 toView:v9 containerView:v10];
  v11 = [(PLClickPresentationTransition *)self _animator];
  [v11 prepareForTransitionWithContext:self->_transitionContext];
}

- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_animator)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PLClickPresentationInteractionManager.m" lineNumber:432 description:@"Must have an animator at this point."];
  }
  if (!self->_transitionContext)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PLClickPresentationInteractionManager.m" lineNumber:433 description:@"Must have a transition context at this point."];
  }
  animator = self->_animator;
  v12 = [(PLClickPresentationTransition *)self _animator];
  -[PLViewControllerAnimator setRunAlongsideAnimationsManually:](animator, "setRunAlongsideAnimationsManually:", [(id)objc_opt_class() drivesAnimation]);

  [(PLViewControllerAnimator *)self->_animator performTransitionWithContext:self->_transitionContext];
  [(PLClickPresentationTransition *)self updateBackgroundViewForTransition];
}

- (void)transitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = MEMORY[0x1D948D440](self->_completion, a2);
  id completion = self->_completion;
  self->_id completion = 0;

  v6 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v3);
    v6 = (void *)v7;
  }
}

- (UIViewPropertyAnimator)customAnimator
{
  BOOL v3 = [(PLClickPresentationTransition *)self _animator];
  if ([(id)objc_opt_class() drivesAnimation])
  {
    id v4 = [(PLClickPresentationTransition *)self _animator];
    v5 = [v4 propertyAnimator];
  }
  else
  {
    v5 = 0;
  }

  return (UIViewPropertyAnimator *)v5;
}

- (id)_newAnimator
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PLClickPresentationInteractionManager.m" lineNumber:454 description:@"Abstract"];

  return 0;
}

- (id)_animator
{
  animator = self->_animator;
  if (!animator)
  {
    id v4 = [(PLClickPresentationTransition *)self _newAnimator];
    v5 = self->_animator;
    self->_animator = v4;

    animator = self->_animator;
  }
  return animator;
}

- (void)_configureTransitionContextWithFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PLClickPresentationTransition *)self _animator];
  [(_UIViewControllerTransitionContext *)self->_transitionContext _setAnimator:v11];
  [(_UIViewControllerTransitionContext *)self->_transitionContext _setIsAnimated:1];
  [(_UIViewControllerOneToOneTransitionContext *)self->_transitionContext _setFromView:v10];

  [(_UIViewControllerOneToOneTransitionContext *)self->_transitionContext _setToView:v9];
  [(_UIViewControllerTransitionContext *)self->_transitionContext _setContainerView:v8];

  transitionContext = self->_transitionContext;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v14[0] = *MEMORY[0x1E4F1DAB8];
  v14[1] = v13;
  v14[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(_PLViewControllerOneToOneTransitionContext *)transitionContext setTargetTransform:v14];
}

- (MTMaterialView)backgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundView);
  return (MTMaterialView *)WeakRetained;
}

- (void)setBackgroundView:(id)a3
{
}

- (BOOL)propagatesPresentingViewTransform
{
  return self->_propagatesPresentingViewTransform;
}

- (void)setPropagatesPresentingViewTransform:(BOOL)a3
{
  self->_propagatesPresentingViewTransform = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_transitionDelegate, 0);
}

@end