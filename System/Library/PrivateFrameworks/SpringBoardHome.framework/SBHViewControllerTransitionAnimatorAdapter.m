@interface SBHViewControllerTransitionAnimatorAdapter
- (BOOL)supportsRestarting;
- (SBHViewControllerTransitionAnimating)animator;
- (SBHViewControllerTransitionAnimatorAdapter)initWithAnimator:(id)a3;
- (double)transitionDuration:(id)a3;
- (unint64_t)transitionToken;
- (void)animateTransition:(id)a3;
- (void)cancelTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5;
- (void)setTransitionToken:(unint64_t)a3;
@end

@implementation SBHViewControllerTransitionAnimatorAdapter

- (SBHViewControllerTransitionAnimatorAdapter)initWithAnimator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHViewControllerTransitionAnimatorAdapter;
  v6 = [(SBHViewControllerTransitionAnimatorAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_animator, a3);
  }

  return v7;
}

- (BOOL)supportsRestarting
{
  return 1;
}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  objc_super v9 = [v8 animationContext];
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 transitionEndpoint];
    v12 = [(SBHViewControllerTransitionAnimatorAdapter *)self animator];
    if (([v8 transitionWasRestarted] & 1) == 0) {
      [v12 prepareToAnimateFromEndpoint:v11 != 1 withContext:v10];
    }
    unint64_t v13 = [(SBHViewControllerTransitionAnimatorAdapter *)self transitionToken] + 1;
    [(SBHViewControllerTransitionAnimatorAdapter *)self setTransitionToken:v13];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__SBHViewControllerTransitionAnimatorAdapter_animateTransition___block_invoke;
    v15[3] = &unk_1E6AB29B0;
    v15[4] = self;
    id v16 = v12;
    unint64_t v19 = v13;
    uint64_t v20 = v11;
    id v17 = v10;
    id v18 = v6;
    id v14 = v12;
    [v14 animateToEndpoint:v11 withContext:v17 completion:v15];
  }
  else
  {
    [v6 cancelTransition];
  }
}

uint64_t __64__SBHViewControllerTransitionAnimatorAdapter_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t result = [*(id *)(a1 + 32) transitionToken];
  if (v2 == result)
  {
    [*(id *)(a1 + 40) finalizeAnimationAtEndpoint:*(void *)(a1 + 72) withContext:*(void *)(a1 + 48)];
    id v4 = *(void **)(a1 + 56);
    return [v4 completeTransition:1];
  }
  return result;
}

- (void)cancelTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v9 = v8;
    }
    else {
      objc_super v9 = 0;
    }
  }
  else
  {
    objc_super v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = [v10 animationContext];
  if (v11)
  {
    v12 = [(SBHViewControllerTransitionAnimatorAdapter *)self animator];
    BOOL v13 = [v11 transitionEndpoint] != 1;
    unint64_t v14 = [(SBHViewControllerTransitionAnimatorAdapter *)self transitionToken] + 1;
    [(SBHViewControllerTransitionAnimatorAdapter *)self setTransitionToken:v14];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __99__SBHViewControllerTransitionAnimatorAdapter_cancelTransition_withCompletionSpeed_completionCurve___block_invoke;
    v16[3] = &unk_1E6AB29B0;
    v16[4] = self;
    id v17 = v12;
    unint64_t v20 = v14;
    BOOL v21 = v13;
    id v18 = v11;
    id v19 = v8;
    id v15 = v12;
    [v15 animateToEndpoint:v13 withContext:v18 completion:v16];
  }
  else
  {
    [v8 completeTransition:0];
  }
}

uint64_t __99__SBHViewControllerTransitionAnimatorAdapter_cancelTransition_withCompletionSpeed_completionCurve___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t result = [*(id *)(a1 + 32) transitionToken];
  if (v2 == result)
  {
    [*(id *)(a1 + 40) finalizeAnimationAtEndpoint:*(void *)(a1 + 72) withContext:*(void *)(a1 + 48)];
    id v4 = *(void **)(a1 + 56);
    return [v4 completeTransition:0];
  }
  return result;
}

- (SBHViewControllerTransitionAnimating)animator
{
  return self->_animator;
}

- (unint64_t)transitionToken
{
  return self->_transitionToken;
}

- (void)setTransitionToken:(unint64_t)a3
{
  self->_transitionToken = a3;
}

- (void).cxx_destruct
{
}

@end