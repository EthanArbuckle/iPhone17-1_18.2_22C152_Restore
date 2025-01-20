@interface _UITabSidebarTransitionAnimator
- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4;
- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5;
- (BOOL)initiallyInteractive;
- (BOOL)isAnimated;
- (BOOL)isCancelled;
- (BOOL)isInteractive;
- (BOOL)isInterruptible;
- (CGAffineTransform)targetTransform;
- (UIView)containerView;
- (_UITabSidebarTransitionAnimator)initWithContainerView:(id)a3 duration:(double)a4;
- (double)completionVelocity;
- (double)percentComplete;
- (double)transitionDuration;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (int64_t)completionCurve;
- (int64_t)presentationStyle;
- (void)runAnimations;
- (void)runCompletions;
@end

@implementation _UITabSidebarTransitionAnimator

- (_UITabSidebarTransitionAnimator)initWithContainerView:(id)a3 duration:(double)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UITabSidebarTransitionAnimator;
  v7 = [(_UITabSidebarTransitionAnimator *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_containerView, v6);
    v8->_transitionDuration = a4;
  }

  return v8;
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return [(_UITabSidebarTransitionAnimator *)self animateAlongsideTransitionInView:0 animation:a3 completion:a4];
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    if (!self->_animationBlocks)
    {
      v11 = (NSMutableArray *)objc_opt_new();
      animationBlocks = self->_animationBlocks;
      self->_animationBlocks = v11;
    }
    objc_initWeak(&location, self);
    v13 = self->_animationBlocks;
    v14 = _Block_copy(v9);
    [(NSMutableArray *)v13 addObject:v14];

    objc_destroyWeak(&location);
  }
  if (v10)
  {
    if (!self->_completionBlocks)
    {
      v15 = (NSMutableArray *)objc_opt_new();
      completionBlocks = self->_completionBlocks;
      self->_completionBlocks = v15;
    }
    objc_initWeak(&location, self);
    v17 = self->_completionBlocks;
    v18 = _Block_copy(v10);
    [(NSMutableArray *)v17 addObject:v18];

    objc_destroyWeak(&location);
  }

  return 1;
}

- (void)runAnimations
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableArray *)self->_animationBlocks copy];
  animationBlocks = self->_animationBlocks;
  self->_animationBlocks = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)runCompletions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_completed = 1;
  v3 = (void *)[(NSMutableArray *)self->_completionBlocks copy];
  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)isAnimated
{
  return 1;
}

- (int64_t)presentationStyle
{
  return -1;
}

- (BOOL)initiallyInteractive
{
  return 0;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (BOOL)isInteractive
{
  return 0;
}

- (BOOL)isCancelled
{
  return 0;
}

- (double)percentComplete
{
  double result = 1.0;
  if (!self->_completed) {
    return 0.0;
  }
  return result;
}

- (double)completionVelocity
{
  return 0.0;
}

- (int64_t)completionCurve
{
  return 3;
}

- (id)viewControllerForKey:(id)a3
{
  return 0;
}

- (id)viewForKey:(id)a3
{
  return 0;
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

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_animationBlocks, 0);
}

@end