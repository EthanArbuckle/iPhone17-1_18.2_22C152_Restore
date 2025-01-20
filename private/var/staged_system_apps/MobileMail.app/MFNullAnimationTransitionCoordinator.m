@interface MFNullAnimationTransitionCoordinator
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
- (id)_alongsideAnimations;
- (id)_alongsideCompletions;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (int64_t)completionCurve;
- (int64_t)presentationStyle;
- (void)_addAlongsideAnimation:(id)a3;
- (void)_addAlongsideCompletion:(id)a3;
- (void)_applyBlocks:(id)a3;
- (void)_runAlongsideAnimations;
- (void)_runAlongsideCompletionsAfterCommit;
- (void)setContainerView:(id)a3;
@end

@implementation MFNullAnimationTransitionCoordinator

- (BOOL)isAnimated
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

- (BOOL)isInterruptible
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
  return [(MFNullAnimationTransitionCoordinator *)self animateAlongsideTransitionInView:0 animation:a3 completion:a4];
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL transitionIsInFlight = self->_transitionIsInFlight;
  if (v9 && !self->_transitionIsInFlight) {
    [(MFNullAnimationTransitionCoordinator *)self _addAlongsideAnimation:v9];
  }
  if (v10) {
    [(MFNullAnimationTransitionCoordinator *)self _addAlongsideCompletion:v10];
  }
  if (v9) {
    BOOL v12 = !transitionIsInFlight;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = v12;

  return v13;
}

- (void)_addAlongsideAnimation:(id)a3
{
  id v4 = a3;
  alongsideAnimations = self->_alongsideAnimations;
  id v10 = v4;
  if (alongsideAnimations)
  {
    id v6 = objc_retainBlock(v4);
    [(NSMutableArray *)alongsideAnimations addObject:v6];
  }
  else
  {
    id v7 = objc_alloc((Class)NSMutableArray);
    id v6 = objc_retainBlock(v10);
    id v8 = [v7 initWithObjects:v6, 0];
    id v9 = self->_alongsideAnimations;
    self->_alongsideAnimations = v8;
  }
}

- (void)_addAlongsideCompletion:(id)a3
{
  id v4 = a3;
  alongsideCompletions = self->_alongsideCompletions;
  id v10 = v4;
  if (alongsideCompletions)
  {
    id v6 = objc_retainBlock(v4);
    [(NSMutableArray *)alongsideCompletions addObject:v6];
  }
  else
  {
    id v7 = objc_alloc((Class)NSMutableArray);
    id v6 = objc_retainBlock(v10);
    id v8 = [v7 initWithObjects:v6, 0];
    id v9 = self->_alongsideCompletions;
    self->_alongsideCompletions = v8;
  }
}

- (id)_alongsideAnimations
{
  long long v3 = self->_alongsideAnimations;
  alongsideAnimations = self->_alongsideAnimations;
  self->_alongsideAnimations = 0;

  return v3;
}

- (id)_alongsideCompletions
{
  long long v3 = self->_alongsideCompletions;
  alongsideCompletions = self->_alongsideCompletions;
  self->_alongsideCompletions = 0;

  return v3;
}

- (void)_runAlongsideAnimations
{
  long long v3 = 0;
  self->_BOOL transitionIsInFlight = 1;
  uint64_t v4 = -2;
  do
  {
    id v7 = [(MFNullAnimationTransitionCoordinator *)self _alongsideAnimations];

    if (!v7) {
      break;
    }
    -[MFNullAnimationTransitionCoordinator _applyBlocks:](self, "_applyBlocks:");
    long long v3 = v7;
  }
  while (!__CFADD__(v4++, 1));
  alongsideAnimations = self->_alongsideAnimations;
  self->_alongsideAnimations = 0;

  self->_BOOL transitionIsInFlight = 0;
}

- (void)_runAlongsideCompletionsAfterCommit
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001D3DBC;
  v2[3] = &unk_1006047A0;
  v2[4] = self;
  [UIApp _performBlockAfterCATransactionCommits:v2];
}

- (void)_applyBlocks:(id)a3
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * (void)v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * (void)v6));
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

  return (UIView *)WeakRetained;
}

- (void)setContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong((id *)&self->_alongsideCompletions, 0);

  objc_storeStrong((id *)&self->_alongsideAnimations, 0);
}

@end