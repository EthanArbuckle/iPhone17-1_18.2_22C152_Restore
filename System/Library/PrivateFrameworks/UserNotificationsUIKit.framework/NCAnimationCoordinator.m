@interface NCAnimationCoordinator
+ (id)animationCoordinatorWithDuration:(double)a3;
- (BOOL)isDurationInherited;
- (NCAnimationCoordinator)initWithAnimationFactory:(id)a3;
- (UIViewControllerTransitionCoordinator)transitionCoordinator;
- (double)transitionDuration:(id)a3;
- (id)animations;
- (id)completion;
- (unint64_t)animationOptions;
- (void)animate:(id)a3 completion:(id)a4;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)setAnimationOptions:(unint64_t)a3;
- (void)setAnimations:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDurationInherited:(BOOL)a3;
- (void)viewOfChildContainer:(id)a3 willChangeToSize:(CGSize)a4;
@end

@implementation NCAnimationCoordinator

+ (id)animationCoordinatorWithDuration:(double)a3
{
  id v4 = objc_alloc((Class)a1);
  v5 = [MEMORY[0x1E4F4F898] factoryWithDuration:a3];
  v6 = (void *)[v4 initWithAnimationFactory:v5];

  return v6;
}

- (NCAnimationCoordinator)initWithAnimationFactory:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NCAnimationCoordinator;
  v6 = [(NCAnimationCoordinator *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_factory, a3);
    v8 = (_UIViewControllerTransitionContext *)objc_alloc_init(MEMORY[0x1E4FB23E8]);
    transitionContext = v7->_transitionContext;
    v7->_transitionContext = v8;

    v10 = v7->_transitionContext;
    [(BSUIAnimationFactory *)v7->_factory duration];
    -[_UIViewControllerTransitionContext _setDuration:](v10, "_setDuration:");
    v11 = v7->_transitionContext;
    [(BSUIAnimationFactory *)v7->_factory duration];
    [(_UIViewControllerTransitionContext *)v11 _setIsAnimated:v12 > 0.0];
  }

  return v7;
}

- (void)setDurationInherited:(BOOL)a3
{
  self->_durationInherited = a3;
  transitionContext = self->_transitionContext;
  double v5 = 0.0;
  if (!a3) {
    [(BSUIAnimationFactory *)self->_factory duration];
  }
  [(_UIViewControllerTransitionContext *)transitionContext _setDuration:v5];
  v6 = self->_transitionContext;
  if (self->_durationInherited)
  {
    BOOL v7 = 1;
  }
  else
  {
    [(BSUIAnimationFactory *)self->_factory duration];
    BOOL v7 = v8 > 0.0;
  }

  [(_UIViewControllerTransitionContext *)v6 _setIsAnimated:v7];
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  return (UIViewControllerTransitionCoordinator *)[(_UIViewControllerTransitionContext *)self->_transitionContext _transitionCoordinator];
}

- (void)viewOfChildContainer:(id)a3 willChangeToSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = [(NCAnimationCoordinator *)self transitionCoordinator];
  objc_msgSend(v7, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);
}

- (void)animate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [(NCAnimationCoordinator *)self setAnimations:a3];
  [(NCAnimationCoordinator *)self setCompletion:v6];

  transitionContext = self->_transitionContext;

  [(NCAnimationCoordinator *)self animateTransition:transitionContext];
}

- (double)transitionDuration:(id)a3
{
  if (self->_durationInherited) {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "_currentAnimationDuration", a3);
  }
  else {
    [(_UIViewControllerTransitionContext *)self->_transitionContext _duration];
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  [(_UIViewControllerTransitionContext *)self->_transitionContext _setAnimator:self];
  [(NCAnimationCoordinator *)self transitionDuration:self->_transitionContext];
  double v5 = v4;
  [(_UIViewControllerTransitionContext *)self->_transitionContext _setIsAnimated:v4 > 0.0];
  if (v5 > 0.0
    && (self->_animations
     || [(_UIViewControllerTransitionContext *)self->_transitionContext _alongsideAnimationsCount] >= 1))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__NCAnimationCoordinator_animateTransition___block_invoke;
    aBlock[3] = &unk_1E6A91BB0;
    aBlock[4] = self;
    id v6 = _Block_copy(aBlock);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__NCAnimationCoordinator_animateTransition___block_invoke_2;
    v12[3] = &unk_1E6A93220;
    v12[4] = self;
    id v7 = _Block_copy(v12);
    id v8 = (void *)MEMORY[0x1E4FB1EB0];
    [(BSUIAnimationFactory *)self->_factory delay];
    [v8 _animateWithDuration:self->_animationOptions delay:self->_factory options:v6 factory:v7 animations:v5 completion:v9];
  }
  else
  {
    animations = (void (**)(id, NCAnimationCoordinator *))self->_animations;
    if (animations) {
      animations[2](animations, self);
    }
    [(_UIViewControllerTransitionContext *)self->_transitionContext __runAlongsideAnimations];
    [(_UIViewControllerTransitionContext *)self->_transitionContext completeTransition:1];
    transitionContext = self->_transitionContext;
    [(_UIViewControllerTransitionContext *)transitionContext _setAnimator:0];
  }
}

uint64_t __44__NCAnimationCoordinator_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 40);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v2 = *(void *)(a1 + 32);
  }
  double v4 = *(void **)(v2 + 16);

  return objc_msgSend(v4, "__runAlongsideAnimations");
}

uint64_t __44__NCAnimationCoordinator_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((a2 & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 16) cancelInteractiveTransition];
  }
  [*(id *)(*(void *)(a1 + 32) + 16) completeTransition:a2];
  double v4 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v4 _setAnimator:0];
}

- (void)animationEnded:(BOOL)a3
{
  completion = (void (**)(id, NCAnimationCoordinator *, BOOL))self->_completion;
  if (completion) {
    completion[2](completion, self, a3);
  }
  id animations = self->_animations;
  self->_id animations = 0;

  id v6 = self->_completion;
  self->_completion = 0;
}

- (unint64_t)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(unint64_t)a3
{
  self->_animationOptions = a3;
}

- (BOOL)isDurationInherited
{
  return self->_durationInherited;
}

- (id)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_animations, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);

  objc_storeStrong((id *)&self->_factory, 0);
}

@end