@interface _UIViewControllerTransitionCoordinator
- (BOOL)_animateAlongsideTransitionInView:(id)a3 systemAnimation:(BOOL)a4 systemCompletion:(BOOL)a5 animation:(id)a6 completion:(id)a7;
- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4;
- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5;
- (BOOL)initiallyInteractive;
- (BOOL)isAnimated;
- (BOOL)isCancelled;
- (BOOL)isCompleting;
- (BOOL)isInteractive;
- (BOOL)isInterruptible;
- (BOOL)isRotating;
- (CGAffineTransform)affineTransform;
- (CGAffineTransform)targetTransform;
- (NSMutableArray)_alongsideAnimationViews;
- (NSMutableArray)_alongsideAnimations;
- (NSMutableArray)_alongsideCompletions;
- (NSMutableArray)_interactiveChangeHandlers;
- (NSMutableArray)_invalidationHandlers;
- (NSMutableArray)_systemAlongsideAnimations;
- (UIView)containerView;
- (_UIViewControllerTransitionContext)_mainContext;
- (_UIViewControllerTransitionCoordinator)initWithMainContext:(id)a3;
- (double)completionVelocity;
- (double)percentComplete;
- (double)transitionDuration;
- (id)_alongsideAnimations:(BOOL)a3;
- (id)_alongsideCompletions:(BOOL)a3;
- (id)_interactiveChangeHandlers:(BOOL)a3;
- (id)_invalidationHandlers:(BOOL)a3;
- (id)_systemAlongsideAnimations:(BOOL)a3;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (int64_t)completionCurve;
- (int64_t)presentationStyle;
- (void)_addInvalidationHandler:(id)a3;
- (void)_applyBlocks:(id)a3 releaseBlocks:(id)a4;
- (void)_applyVoidBlocks:(id)a3 releaseBlocks:(id)a4;
- (void)_setAlongsideAnimationViews:(id)a3;
- (void)_setAlongsideAnimations:(id)a3;
- (void)_setAlongsideCompletions:(id)a3;
- (void)_setInteractiveChangeHandlers:(id)a3;
- (void)_setInvalidationHandlers:(id)a3;
- (void)_setMainContext:(id)a3;
- (void)_setSystemAlongsideAnimations:(id)a3;
- (void)notifyWhenInteractionChangesUsingBlock:(id)a3;
@end

@implementation _UIViewControllerTransitionCoordinator

- (NSMutableArray)_invalidationHandlers
{
  return self->__invalidationHandlers;
}

- (void)_applyVoidBlocks:(id)a3 releaseBlocks:(id)a4
{
  id v8 = a3;
  v5 = (void (**)(void))a4;
  if ([v8 count])
  {
    v5[2](v5);
    if ([v8 count])
    {
      unint64_t v6 = 0;
      do
      {
        v7 = [v8 objectAtIndexedSubscript:v6];
        v7[2]();

        ++v6;
      }
      while (v6 < [v8 count]);
    }
  }
}

- (void)_setInteractiveChangeHandlers:(id)a3
{
}

- (NSMutableArray)_alongsideCompletions
{
  return self->__alongsideCompletions;
}

- (void)_applyBlocks:(id)a3 releaseBlocks:(id)a4
{
  id v9 = a3;
  unint64_t v6 = (void (**)(void))a4;
  if ([v9 count])
  {
    v6[2](v6);
    if ([v9 count])
    {
      unint64_t v7 = 0;
      do
      {
        id v8 = [v9 objectAtIndexedSubscript:v7];
        __UIVIEWCONTROLLERTRANSITIONCOORDINATOR_IS_EXECUTING_ALONGSIDE_ANIMATION_BLOCK__((uint64_t)self, (uint64_t)v8);

        ++v7;
      }
      while (v7 < [v9 count]);
    }
  }
}

- (NSMutableArray)_alongsideAnimations
{
  return self->__alongsideAnimations;
}

- (void)_setAlongsideAnimations:(id)a3
{
}

- (NSMutableArray)_systemAlongsideAnimations
{
  return self->__systemAlongsideAnimations;
}

- (void)_setAlongsideCompletions:(id)a3
{
}

- (_UIViewControllerTransitionCoordinator)initWithMainContext:(id)a3
{
  v4 = (_UIViewControllerTransitionContext *)a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewControllerTransitionCoordinator;
  v5 = [(_UIViewControllerTransitionCoordinator *)&v9 init];
  unint64_t v6 = v5;
  if (v5)
  {
    v5->__mainContext = v4;
    unint64_t v7 = [(_UIViewControllerTransitionContext *)v4 _auxContext];

    if (!v7) {
      [(_UIViewControllerTransitionContext *)v4 _setAuxContext:v6];
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__invalidationHandlers, 0);
  objc_storeStrong((id *)&self->__interactiveChangeHandlers, 0);
  objc_storeStrong((id *)&self->__alongsideCompletions, 0);
  objc_storeStrong((id *)&self->__alongsideAnimationViews, 0);
  objc_storeStrong((id *)&self->__alongsideAnimations, 0);
  objc_storeStrong((id *)&self->__systemAlongsideAnimations, 0);
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return [(_UIViewControllerTransitionCoordinator *)self _animateAlongsideTransitionInView:0 systemAnimation:0 systemCompletion:0 animation:a3 completion:a4];
}

- (BOOL)isInteractive
{
  return [(_UIViewControllerTransitionContext *)self->__mainContext isCurrentlyInteractive];
}

- (id)viewControllerForKey:(id)a3
{
  return [(_UIViewControllerTransitionContext *)self->__mainContext viewControllerForKey:a3];
}

- (BOOL)_animateAlongsideTransitionInView:(id)a3 systemAnimation:(BOOL)a4 systemCompletion:(BOOL)a5 animation:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v15 = [(_UIViewControllerTransitionCoordinator *)self _mainContext];
  if (([v15 isInterruptible] & 1) == 0)
  {
    int v16 = [v15 _transitionIsInFlight] ^ 1;
    if (!v13) {
      goto LABEL_30;
    }
LABEL_5:
    if (!v16) {
      goto LABEL_30;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __130___UIViewControllerTransitionCoordinator__animateAlongsideTransitionInView_systemAnimation_systemCompletion_animation_completion___block_invoke;
    aBlock[3] = &unk_1E52E3538;
    BOOL v50 = a4;
    aBlock[4] = self;
    id v17 = v13;
    id v49 = v17;
    v18 = (void (**)(void))_Block_copy(aBlock);
    if (![v15 _ranAlongsideAnimations]
      || [v15 _transitionHasCompleted])
    {
      v18[2](v18);
      if (!v12) {
        goto LABEL_29;
      }
      goto LABEL_25;
    }
    v19 = [v15 _animator];
    v37 = v19;
    BOOL v36 = v9;
    if (objc_opt_respondsToSelector())
    {
      v20 = [v19 interruptibleAnimatorForTransition:v15];
    }
    else
    {
      v20 = 0;
    }
    uint64_t v21 = [v20 state];
    v38 = v20;
    if ((objc_opt_respondsToSelector() & 1) == 0 || v21 == 2 || v21 == 5)
    {
      if (+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled])
      {
        [v15 _duration];
        double v23 = v22;
        v24 = v37;
        BOOL v9 = v36;
        if ([v15 isInteractive]) {
          uint64_t v25 = 196608;
        }
        else {
          uint64_t v25 = [v15 _completionCurve] << 16;
        }
        uint64_t v35 = v25;
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __130___UIViewControllerTransitionCoordinator__animateAlongsideTransitionInView_systemAnimation_systemCompletion_animation_completion___block_invoke_3;
        v44[3] = &unk_1E52DB330;
        v44[4] = self;
        id v45 = v17;
        +[UIView animateWithDuration:v35 delay:v44 options:0 animations:v23 completion:0.0];

LABEL_24:
        if (!v12)
        {
LABEL_29:

          goto LABEL_30;
        }
LABEL_25:
        v26 = [v15 containerView];
        char v27 = [v12 isDescendantOfView:v26];

        if ((v27 & 1) == 0)
        {
          v28 = [(_UIViewControllerTransitionCoordinator *)self _alongsideAnimationViews];
          if (!v28)
          {
            v28 = objc_opt_new();
            [(_UIViewControllerTransitionCoordinator *)self _setAlongsideAnimationViews:v28];
          }
          [v28 addObject:v12];
        }
        goto LABEL_29;
      }
      v18[2](v18);
    }
    else
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __130___UIViewControllerTransitionCoordinator__animateAlongsideTransitionInView_systemAnimation_systemCompletion_animation_completion___block_invoke_2;
      v46[3] = &unk_1E52DB330;
      v46[4] = self;
      id v47 = v17;
      [v20 addAnimations:v46];
    }
    v24 = v37;
    BOOL v9 = v36;
    goto LABEL_24;
  }
  int v16 = 1;
  if (v13) {
    goto LABEL_5;
  }
LABEL_30:
  if (v14)
  {
    if (v9)
    {
      objc_initWeak(&location, self);
      v29 = [v15 _willCompleteHandler];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __130___UIViewControllerTransitionCoordinator__animateAlongsideTransitionInView_systemAnimation_systemCompletion_animation_completion___block_invoke_4;
      v39[3] = &unk_1E52EA560;
      id v30 = v29;
      id v40 = v30;
      id v41 = v14;
      objc_copyWeak(&v42, &location);
      [v15 _setWillCompleteHandler:v39];
      objc_destroyWeak(&v42);

      objc_destroyWeak(&location);
    }
    else
    {
      v31 = [(_UIViewControllerTransitionCoordinator *)self _alongsideCompletions:1];
      v32 = _Block_copy(v14);
      [v31 addObject:v32];
    }
  }
  if (v13) {
    BOOL v33 = v16;
  }
  else {
    BOOL v33 = 1;
  }

  return v33;
}

- (_UIViewControllerTransitionContext)_mainContext
{
  return self->__mainContext;
}

- (id)_alongsideCompletions:(BOOL)a3
{
  alongsideCompletions = self->__alongsideCompletions;
  if (alongsideCompletions) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v7 = self->__alongsideCompletions;
    self->__alongsideCompletions = v6;

    alongsideCompletions = self->__alongsideCompletions;
  }
  return alongsideCompletions;
}

- (id)_alongsideAnimations:(BOOL)a3
{
  alongsideAnimations = self->__alongsideAnimations;
  if (alongsideAnimations) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v7 = self->__alongsideAnimations;
    self->__alongsideAnimations = v6;

    alongsideAnimations = self->__alongsideAnimations;
  }
  return alongsideAnimations;
}

- (BOOL)isCancelled
{
  return [(_UIViewControllerTransitionContext *)self->__mainContext transitionWasCancelled];
}

- (BOOL)isAnimated
{
  return [(_UIViewControllerTransitionContext *)self->__mainContext isAnimated];
}

- (void)notifyWhenInteractionChangesUsingBlock:(id)a3
{
  if (a3)
  {
    aBlock = (void *)[a3 copy];
    v4 = [(_UIViewControllerTransitionCoordinator *)self _interactiveChangeHandlers:1];
    BOOL v5 = _Block_copy(aBlock);
    [v4 addObject:v5];
  }
}

- (id)_interactiveChangeHandlers:(BOOL)a3
{
  interactiveChangeHandlers = self->__interactiveChangeHandlers;
  if (interactiveChangeHandlers) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v7 = self->__interactiveChangeHandlers;
    self->__interactiveChangeHandlers = v6;

    interactiveChangeHandlers = self->__interactiveChangeHandlers;
  }
  return interactiveChangeHandlers;
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  return [(_UIViewControllerTransitionCoordinator *)self _animateAlongsideTransitionInView:a3 systemAnimation:0 systemCompletion:0 animation:a4 completion:a5];
}

- (void)_setAlongsideAnimationViews:(id)a3
{
}

- (NSMutableArray)_alongsideAnimationViews
{
  return self->__alongsideAnimationViews;
}

- (int64_t)presentationStyle
{
  return [(_UIViewControllerTransitionContext *)self->__mainContext presentationStyle];
}

- (BOOL)initiallyInteractive
{
  return [(_UIViewControllerTransitionContext *)self->__mainContext _initiallyInteractive];
}

- (BOOL)isInterruptible
{
  return [(_UIViewControllerTransitionContext *)self->__mainContext isInterruptible];
}

- (BOOL)isCompleting
{
  return [(_UIViewControllerTransitionContext *)self->__mainContext _transitionIsCompleting];
}

- (double)percentComplete
{
  [(_UIViewControllerTransitionContext *)self->__mainContext _previousPercentComplete];
  return result;
}

- (double)completionVelocity
{
  [(_UIViewControllerTransitionContext *)self->__mainContext _completionVelocity];
  return result;
}

- (int64_t)completionCurve
{
  return [(_UIViewControllerTransitionContext *)self->__mainContext _completionCurve];
}

- (double)transitionDuration
{
  [(_UIViewControllerTransitionContext *)self->__mainContext _duration];
  return result;
}

- (id)viewForKey:(id)a3
{
  return [(_UIViewControllerTransitionContext *)self->__mainContext viewForKey:a3];
}

- (UIView)containerView
{
  return [(_UIViewControllerTransitionContext *)self->__mainContext containerView];
}

- (BOOL)isRotating
{
  return [(_UIViewControllerTransitionContext *)self->__mainContext _isRotating];
}

- (CGAffineTransform)affineTransform
{
  double result = (CGAffineTransform *)self->__mainContext;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result _affineTransform];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (CGAffineTransform)targetTransform
{
  double result = (CGAffineTransform *)self->__mainContext;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result targetTransform];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (id)_systemAlongsideAnimations:(BOOL)a3
{
  systemAlongsideAnimations = self->__systemAlongsideAnimations;
  if (systemAlongsideAnimations) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v7 = self->__systemAlongsideAnimations;
    self->__systemAlongsideAnimations = v6;

    systemAlongsideAnimations = self->__systemAlongsideAnimations;
  }
  return systemAlongsideAnimations;
}

- (id)_invalidationHandlers:(BOOL)a3
{
  invalidationHandlers = self->__invalidationHandlers;
  if (invalidationHandlers) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v7 = self->__invalidationHandlers;
    self->__invalidationHandlers = v6;

    invalidationHandlers = self->__invalidationHandlers;
  }
  return invalidationHandlers;
}

- (void)_addInvalidationHandler:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(_UIViewControllerTransitionCoordinator *)self _invalidationHandlers:1];
    BOOL v5 = _Block_copy(v4);

    [v6 addObject:v5];
  }
}

- (void)_setMainContext:(id)a3
{
  self->__mainContext = (_UIViewControllerTransitionContext *)a3;
}

- (void)_setSystemAlongsideAnimations:(id)a3
{
}

- (NSMutableArray)_interactiveChangeHandlers
{
  return self->__interactiveChangeHandlers;
}

- (void)_setInvalidationHandlers:(id)a3
{
}

@end