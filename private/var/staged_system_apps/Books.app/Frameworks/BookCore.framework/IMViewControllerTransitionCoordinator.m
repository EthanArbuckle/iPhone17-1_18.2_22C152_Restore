@interface IMViewControllerTransitionCoordinator
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
- (IMViewControllerTransitionContext)_mainContext;
- (IMViewControllerTransitionCoordinator)initWithMainContext:(id)a3;
- (NSMutableArray)_alongsideAnimationViews;
- (NSMutableArray)_alongsideAnimations;
- (NSMutableArray)_alongsideCompletions;
- (NSMutableArray)_interactiveChangeHandlers;
- (UIView)containerView;
- (double)completionVelocity;
- (double)percentComplete;
- (double)transitionDuration;
- (id)_alongsideAnimations:(BOOL)a3;
- (id)_alongsideCompletions:(BOOL)a3;
- (id)_interactiveChangeHandlers:(BOOL)a3;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (int64_t)completionCurve;
- (int64_t)presentationStyle;
- (void)_applyBlocks:(id)a3 releaseBlocks:(id)a4;
- (void)_setAlongsideAnimationViews:(id)a3;
- (void)_setAlongsideAnimations:(id)a3;
- (void)_setAlongsideCompletions:(id)a3;
- (void)_setInteractiveChangeHandlers:(id)a3;
- (void)_setMainContext:(id)a3;
- (void)handlerToInvokeOnInteractivityChanges:(id)a3;
- (void)notifyWhenInteractionChangesUsingBlock:(id)a3;
- (void)notifyWhenInteractionEndsUsingBlock:(id)a3;
@end

@implementation IMViewControllerTransitionCoordinator

- (IMViewControllerTransitionCoordinator)initWithMainContext:(id)a3
{
  v4 = (IMViewControllerTransitionContext *)a3;
  v9.receiver = self;
  v9.super_class = (Class)IMViewControllerTransitionCoordinator;
  v5 = [(IMViewControllerTransitionCoordinator *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->__mainContext = v4;
    v7 = [(IMViewControllerTransitionContext *)v4 _auxContext];

    if (!v7) {
      [(IMViewControllerTransitionContext *)v4 _setAuxContext:v6];
    }
  }

  return v6;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (BOOL)isAnimated
{
  return [(IMViewControllerTransitionContext *)self->__mainContext isAnimated];
}

- (int64_t)presentationStyle
{
  return [(IMViewControllerTransitionContext *)self->__mainContext presentationStyle];
}

- (BOOL)initiallyInteractive
{
  return [(IMViewControllerTransitionContext *)self->__mainContext initiallyInteractive];
}

- (BOOL)isInteractive
{
  return [(IMViewControllerTransitionContext *)self->__mainContext isCurrentlyInteractive];
}

- (BOOL)isCancelled
{
  return [(IMViewControllerTransitionContext *)self->__mainContext transitionWasCancelled];
}

- (BOOL)isCompleting
{
  return [(IMViewControllerTransitionContext *)self->__mainContext _transitionIsCompleting];
}

- (double)percentComplete
{
  [(IMViewControllerTransitionContext *)self->__mainContext _previousPercentComplete];
  return result;
}

- (double)completionVelocity
{
  [(IMViewControllerTransitionContext *)self->__mainContext _completionVelocity];
  return result;
}

- (int64_t)completionCurve
{
  return [(IMViewControllerTransitionContext *)self->__mainContext _completionCurve];
}

- (double)transitionDuration
{
  [(IMViewControllerTransitionContext *)self->__mainContext duration];
  return result;
}

- (id)viewControllerForKey:(id)a3
{
  return [(IMViewControllerTransitionContext *)self->__mainContext viewControllerForKey:a3];
}

- (id)viewForKey:(id)a3
{
  return [(IMViewControllerTransitionContext *)self->__mainContext viewForKey:a3];
}

- (UIView)containerView
{
  return [(IMViewControllerTransitionContext *)self->__mainContext containerView];
}

- (BOOL)isRotating
{
  return 0;
}

- (CGAffineTransform)affineTransform
{
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
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

- (NSMutableArray)_interactiveChangeHandlers
{
  return self->__interactiveChangeHandlers;
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
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->__interactiveChangeHandlers;
    self->__interactiveChangeHandlers = v6;

    interactiveChangeHandlers = self->__interactiveChangeHandlers;
  }

  return interactiveChangeHandlers;
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
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->__alongsideAnimations;
    self->__alongsideAnimations = v6;

    alongsideAnimations = self->__alongsideAnimations;
  }

  return alongsideAnimations;
}

- (NSMutableArray)_alongsideAnimations
{
  return self->__alongsideAnimations;
}

- (NSMutableArray)_alongsideCompletions
{
  return self->__alongsideCompletions;
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
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->__alongsideCompletions;
    self->__alongsideCompletions = v6;

    alongsideCompletions = self->__alongsideCompletions;
  }

  return alongsideCompletions;
}

- (void)_applyBlocks:(id)a3 releaseBlocks:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if ([v6 count])
  {
    v7[2](v7);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v16;
      do
      {
        v13 = 0;
        v14 = v11;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v8);
          }
          id v11 = objc_retainBlock(*(id *)(*((void *)&v15 + 1) + 8 * (void)v13));

          (*((void (**)(id, IMViewControllerTransitionCoordinator *))v11 + 2))(v11, self);
          v13 = (char *)v13 + 1;
          v14 = v11;
        }
        while (v10 != v13);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IMViewControllerTransitionCoordinator *)self _mainContext];
  unsigned __int8 v12 = [v11 _transitionIsInFlight];

  if (v9 && (v12 & 1) == 0)
  {
    id v13 = [v9 copy];
    v14 = [(IMViewControllerTransitionCoordinator *)self _alongsideAnimations:1];
    id v15 = objc_retainBlock(v13);
    [v14 addObject:v15];

    if (v8)
    {
      long long v16 = [(IMViewControllerTransitionCoordinator *)self _mainContext];
      long long v17 = [v16 containerView];
      unsigned __int8 v18 = [v8 isDescendantOfView:v17];

      if ((v18 & 1) == 0)
      {
        v19 = [(IMViewControllerTransitionCoordinator *)self _alongsideAnimationViews];
        if (!v19)
        {
          v19 = objc_opt_new();
          [(IMViewControllerTransitionCoordinator *)self _setAlongsideAnimationViews:v19];
        }
        [v19 addObject:v8];
      }
    }
  }
  if (v10)
  {
    id v20 = [v10 copy];
    v21 = [(IMViewControllerTransitionCoordinator *)self _alongsideCompletions:1];
    id v22 = objc_retainBlock(v20);
    [v21 addObject:v22];
  }
  if (v9) {
    char v23 = v12 ^ 1;
  }
  else {
    char v23 = 1;
  }

  return v23;
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return [(IMViewControllerTransitionCoordinator *)self animateAlongsideTransitionInView:0 animation:a3 completion:a4];
}

- (void)notifyWhenInteractionChangesUsingBlock:(id)a3
{
  if (a3)
  {
    id v6 = [a3 copy];
    v4 = [(IMViewControllerTransitionCoordinator *)self _interactiveChangeHandlers:1];
    id v5 = objc_retainBlock(v6);
    [v4 addObject:v5];
  }
}

- (void)notifyWhenInteractionEndsUsingBlock:(id)a3
{
}

- (void)handlerToInvokeOnInteractivityChanges:(id)a3
{
}

- (IMViewControllerTransitionContext)_mainContext
{
  return self->__mainContext;
}

- (void)_setMainContext:(id)a3
{
  self->__mainContext = (IMViewControllerTransitionContext *)a3;
}

- (void)_setAlongsideAnimations:(id)a3
{
}

- (NSMutableArray)_alongsideAnimationViews
{
  return self->__alongsideAnimationViews;
}

- (void)_setAlongsideAnimationViews:(id)a3
{
}

- (void)_setAlongsideCompletions:(id)a3
{
}

- (void)_setInteractiveChangeHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__interactiveChangeHandlers, 0);
  objc_storeStrong((id *)&self->__alongsideCompletions, 0);
  objc_storeStrong((id *)&self->__alongsideAnimationViews, 0);

  objc_storeStrong((id *)&self->__alongsideAnimations, 0);
}

@end