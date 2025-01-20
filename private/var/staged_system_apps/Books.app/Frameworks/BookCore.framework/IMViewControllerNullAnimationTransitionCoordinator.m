@interface IMViewControllerNullAnimationTransitionCoordinator
- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4;
- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5;
- (BOOL)initiallyInteractive;
- (BOOL)isAnimated;
- (BOOL)isCancelled;
- (BOOL)isInteractive;
- (BOOL)isInterruptible;
- (BOOL)isRotating;
- (CGAffineTransform)targetTransform;
- (UIView)containerView;
- (double)completionVelocity;
- (double)percentComplete;
- (double)transitionDuration;
- (id)_alongsideAnimations:(BOOL)a3;
- (id)_alongsideCompletions:(BOOL)a3;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (int64_t)completionCurve;
- (int64_t)presentationStyle;
- (void)_applyBlocks:(id)a3 releaseBlocks:(id)a4;
- (void)_runAlongsideAnimations;
- (void)_runAlongsideCompletionsAfterCommit;
- (void)setContainerView:(id)a3;
@end

@implementation IMViewControllerNullAnimationTransitionCoordinator

- (BOOL)isAnimated
{
  return 0;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (int64_t)presentationStyle
{
  return -1;
}

- (BOOL)initiallyInteractive
{
  return 1;
}

- (BOOL)isInteractive
{
  return 0;
}

- (BOOL)isCancelled
{
  return 0;
}

- (double)transitionDuration
{
  return 0.0;
}

- (double)percentComplete
{
  return 0.0;
}

- (double)completionVelocity
{
  return 1.0;
}

- (int64_t)completionCurve
{
  return 0;
}

- (id)viewControllerForKey:(id)a3
{
  return 0;
}

- (id)viewForKey:(id)a3
{
  return 0;
}

- (BOOL)isRotating
{
  return 0;
}

- (CGAffineTransform)targetTransform
{
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return [(IMViewControllerNullAnimationTransitionCoordinator *)self animateAlongsideTransitionInView:0 animation:a3 completion:a4];
}

- (id)_alongsideAnimations:(BOOL)a3
{
  alongsideAnimations = self->_alongsideAnimations;
  if (alongsideAnimations) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_alongsideAnimations;
    self->_alongsideAnimations = v6;

    alongsideAnimations = self->_alongsideAnimations;
  }

  return alongsideAnimations;
}

- (id)_alongsideCompletions:(BOOL)a3
{
  alongsideCompletions = self->_alongsideCompletions;
  if (alongsideCompletions) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_alongsideCompletions;
    self->_alongsideCompletions = v6;

    alongsideCompletions = self->_alongsideCompletions;
  }

  return alongsideCompletions;
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL transitionIsInFlight = self->_transitionIsInFlight;
  if (v9 && !self->_transitionIsInFlight)
  {
    id v12 = [v9 copy];
    v13 = [(IMViewControllerNullAnimationTransitionCoordinator *)self _alongsideAnimations:1];
    id v14 = objc_retainBlock(v12);
    [v13 addObject:v14];
  }
  if (v10)
  {
    id v15 = [v10 copy];
    v16 = [(IMViewControllerNullAnimationTransitionCoordinator *)self _alongsideCompletions:1];
    id v17 = objc_retainBlock(v15);
    [v16 addObject:v17];
  }
  if (v9) {
    BOOL v18 = !transitionIsInFlight;
  }
  else {
    BOOL v18 = 1;
  }
  BOOL v19 = v18;

  return v19;
}

- (void)_runAlongsideAnimations
{
  long long v3 = 0;
  self->_BOOL transitionIsInFlight = 1;
  uint64_t v4 = -2;
  do
  {
    BOOL v5 = v3;
    long long v3 = [(IMViewControllerNullAnimationTransitionCoordinator *)self _alongsideAnimations:0];

    if (!v3) {
      break;
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_13DFEC;
    v8[3] = &unk_2C3C50;
    v8[4] = self;
    [(IMViewControllerNullAnimationTransitionCoordinator *)self _applyBlocks:v3 releaseBlocks:v8];
  }
  while (!__CFADD__(v4++, 1));
  alongsideAnimations = self->_alongsideAnimations;
  self->_alongsideAnimations = 0;
}

- (void)_runAlongsideCompletionsAfterCommit
{
  long long v3 = [(IMViewControllerNullAnimationTransitionCoordinator *)self _alongsideCompletions:0];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_13E090;
  v4[3] = &unk_2C3C50;
  v4[4] = self;
  [(IMViewControllerNullAnimationTransitionCoordinator *)self _applyBlocks:v3 releaseBlocks:v4];
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
        id v14 = v11;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v8);
          }
          id v11 = objc_retainBlock(*(id *)(*((void *)&v15 + 1) + 8 * (void)v13));

          (*((void (**)(id, IMViewControllerNullAnimationTransitionCoordinator *))v11 + 2))(v11, self);
          v13 = (char *)v13 + 1;
          id v14 = v11;
        }
        while (v10 != v13);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  self->_containerView = (UIView *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alongsideCompletions, 0);

  objc_storeStrong((id *)&self->_alongsideAnimations, 0);
}

@end