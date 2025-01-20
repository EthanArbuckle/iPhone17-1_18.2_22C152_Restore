@interface _UIViewControllerNullAnimationTransitionCoordinator
- (BOOL)_animateAlongsideTransitionInView:(id)a3 systemAnimation:(BOOL)a4 systemCompletion:(BOOL)a5 animation:(id)a6 completion:(id)a7;
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
- (id)_mainContext;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (int64_t)completionCurve;
- (int64_t)presentationStyle;
- (void)_applyBlocks:(id)a3 releaseBlocks:(id)a4;
- (void)_runAlongsideAnimations;
- (void)_runAlongsideCompletions;
- (void)_runAlongsideCompletionsAfterCommit;
- (void)_runAlongsideCompletionsAndClearAlongsideAnimations;
- (void)setContainerView:(id)a3;
@end

@implementation _UIViewControllerNullAnimationTransitionCoordinator

- (void)_runAlongsideCompletionsAfterCommit
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __90___UIViewControllerNullAnimationTransitionCoordinator__runAlongsideCompletionsAfterCommit__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  [(id)UIApp _performBlockAfterCATransactionCommits:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alongsideCompletions, 0);
  objc_storeStrong((id *)&self->_alongsideAnimations, 0);
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return [(_UIViewControllerNullAnimationTransitionCoordinator *)self _animateAlongsideTransitionInView:0 systemAnimation:0 systemCompletion:0 animation:a3 completion:a4];
}

- (void)_runAlongsideAnimations
{
  char v3 = 0;
  v4 = 0;
  self->_transitionIsInFlight = 1;
  do
  {
    v5 = v4;
    char v6 = v3;
    v4 = [(_UIViewControllerNullAnimationTransitionCoordinator *)self _alongsideAnimations:0];

    if (!v4) {
      break;
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78___UIViewControllerNullAnimationTransitionCoordinator__runAlongsideAnimations__block_invoke;
    v8[3] = &unk_1E52D9F70;
    v8[4] = self;
    [(_UIViewControllerNullAnimationTransitionCoordinator *)self _applyBlocks:v4 releaseBlocks:v8];
    char v3 = 1;
  }
  while ((v6 & 1) == 0);
  alongsideAnimations = self->_alongsideAnimations;
  self->_alongsideAnimations = 0;
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
    char v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_alongsideAnimations;
    self->_alongsideAnimations = v6;

    alongsideAnimations = self->_alongsideAnimations;
  }
  return alongsideAnimations;
}

- (void)setContainerView:(id)a3
{
  self->_containerView = (UIView *)a3;
}

- (CGAffineTransform)targetTransform
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (BOOL)_animateAlongsideTransitionInView:(id)a3 systemAnimation:(BOOL)a4 systemCompletion:(BOOL)a5 animation:(id)a6 completion:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  BOOL transitionIsInFlight = self->_transitionIsInFlight;
  if (v11 && !self->_transitionIsInFlight)
  {
    v14 = [(_UIViewControllerNullAnimationTransitionCoordinator *)self _alongsideAnimations:1];
    v15 = _Block_copy(v11);
    [v14 addObject:v15];
  }
  if (v12)
  {
    v16 = [(_UIViewControllerNullAnimationTransitionCoordinator *)self _alongsideCompletions:1];
    v17 = _Block_copy(v12);
    [v16 addObject:v17];
  }
  if (v11) {
    BOOL v18 = !transitionIsInFlight;
  }
  else {
    BOOL v18 = 1;
  }
  BOOL v19 = v18;

  return v19;
}

- (void)_runAlongsideCompletions
{
  uint64_t v3 = [(_UIViewControllerNullAnimationTransitionCoordinator *)self _alongsideCompletions:0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79___UIViewControllerNullAnimationTransitionCoordinator__runAlongsideCompletions__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [(_UIViewControllerNullAnimationTransitionCoordinator *)self _applyBlocks:v3 releaseBlocks:v4];
}

- (void)_applyBlocks:(id)a3 releaseBlocks:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
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
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        v14 = v11;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v8);
          }
          id v11 = _Block_copy(*(const void **)(*((void *)&v15 + 1) + 8 * v13));

          (*((void (**)(void *, _UIViewControllerNullAnimationTransitionCoordinator *))v11 + 2))(v11, self);
          ++v13;
          v14 = v11;
        }
        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
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
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_alongsideCompletions;
    self->_alongsideCompletions = v6;

    alongsideCompletions = self->_alongsideCompletions;
  }
  return alongsideCompletions;
}

- (BOOL)isAnimated
{
  return 0;
}

- (id)_mainContext
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

- (BOOL)isInterruptible
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

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  return [(_UIViewControllerNullAnimationTransitionCoordinator *)self _animateAlongsideTransitionInView:a3 systemAnimation:0 systemCompletion:0 animation:a4 completion:a5];
}

- (void)_runAlongsideCompletionsAndClearAlongsideAnimations
{
  alongsideAnimations = self->_alongsideAnimations;
  self->_alongsideAnimations = 0;

  [(_UIViewControllerNullAnimationTransitionCoordinator *)self _runAlongsideCompletions];
}

- (UIView)containerView
{
  return self->_containerView;
}

@end