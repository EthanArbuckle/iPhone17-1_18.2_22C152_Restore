@interface SBIconAnimator
- (BOOL)_isDelayedForRotation;
- (BOOL)invalidated;
- (BOOL)isAnimating;
- (BOOL)isPastPointOfNoReturn;
- (SBHIconAnimationSettings)settings;
- (SBIconAnimationContaining)animationContainer;
- (SBIconAnimator)initWithAnimationContainer:(id)a3;
- (SBIconAnimatorDelegate)delegate;
- (UIView)backgroundDarkeningView;
- (UIView)referenceView;
- (double)fraction;
- (id)centralAnimationFactory;
- (unint64_t)_numberOfSignificantAnimations;
- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5;
- (void)_animateToFractionFromContext:(id)a3;
- (void)_animateToFractionFromPendingContexts;
- (void)_cleanupAnimation;
- (void)_invalidateCompletions;
- (void)_windowFinishedRotating;
- (void)animateToFraction:(double)a3 afterDelay:(double)a4 withCompletion:(id)a5;
- (void)cleanup;
- (void)dealloc;
- (void)prepare;
- (void)setBackgroundDarkeningView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFraction:(double)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setSettings:(id)a3;
@end

@implementation SBIconAnimator

- (SBIconAnimator)initWithAnimationContainer:(id)a3
{
  id v5 = a3;
  v6 = [(SBIconAnimator *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_animationContainer, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendedAnimationContexts = v7->_pendedAnimationContexts;
    v7->_pendedAnimationContexts = v8;

    v10 = [v5 animationWindow];
    int v11 = [v10 isRotating];
    v7->_windowIsRotating = v11;
    if (v11)
    {
      v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 addObserver:v7 selector:sel__windowFinishedRotating name:*MEMORY[0x1E4FB3100] object:v10];
    }
  }

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(SBIconAnimator *)self _invalidateCompletions];
  v4.receiver = self;
  v4.super_class = (Class)SBIconAnimator;
  [(SBIconAnimator *)&v4 dealloc];
}

- (void)setInvalidated:(BOOL)a3
{
  if (self->_invalidated != a3)
  {
    self->_invalidated = a3;
    if (a3 && !self->_cleanedUp)
    {
      [(SBIconAnimator *)self cleanup];
      [(SBIconAnimator *)self _invalidateCompletions];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained iconAnimatorWasInvalidated:self];
    }
  }
}

- (BOOL)isPastPointOfNoReturn
{
  return 0;
}

- (UIView)referenceView
{
  v2 = [(SBIconAnimator *)self animationContainer];
  v3 = [v2 containerView];

  return (UIView *)v3;
}

- (id)centralAnimationFactory
{
  v2 = (void *)MEMORY[0x1E4F4F898];
  v3 = [(SBHIconAnimationSettings *)self->_settings centralAnimationSettings];
  objc_super v4 = [v3 BSAnimationSettings];
  id v5 = [v2 factoryWithSettings:v4];

  [v5 setAllowsAdditiveAnimations:1];
  return v5;
}

- (void)prepare
{
  if (!self->_invalidated && !self->_windowIsRotating && !self->_startAnimationAfterRotationEnds) {
    [(SBIconAnimator *)self _prepareAnimation];
  }
}

- (double)fraction
{
  return self->_fraction;
}

- (void)setFraction:(double)a3
{
  if (self->_invalidated || self->_windowIsRotating || self->_startAnimationAfterRotationEnds) {
    self->_fraction = a3;
  }
  else {
    [(SBIconAnimator *)self _setAnimationFraction:a3];
  }
}

- (BOOL)isAnimating
{
  return self->_animationCount != 0;
}

- (void)animateToFraction:(double)a3 afterDelay:(double)a4 withCompletion:(id)a5
{
  id v8 = a5;
  if ([(SBIconAnimator *)self invalidated])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SBIconAnimator_animateToFraction_afterDelay_withCompletion___block_invoke;
    block[3] = &unk_1E6AAD4C8;
    id v11 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v9 = objc_alloc_init(SBIconAnimationContext);
    [(SBIconAnimationContext *)v9 setFraction:a3];
    [(SBIconAnimationContext *)v9 setDelay:a4];
    [(SBIconAnimationContext *)v9 setCompletion:v8];
    if (self->_windowIsRotating || self->_startAnimationAfterRotationEnds)
    {
      [(NSMutableArray *)self->_pendedAnimationContexts addObject:v9];
      self->_startAnimationAfterRotationEnds = 1;
    }
    else
    {
      [(SBIconAnimator *)self _animateToFractionFromContext:v9];
    }
  }
}

uint64_t __62__SBIconAnimator_animateToFraction_afterDelay_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)cleanup
{
  [(SBIconAnimator *)self _setAnimationFraction:0.0];
  [(SBIconAnimator *)self _cleanupAnimation];
  [(UIView *)self->_backgroundDarkeningView removeFromSuperview];
  backgroundDarkeningView = self->_backgroundDarkeningView;
  self->_backgroundDarkeningView = 0;
}

- (void)_animateToFractionFromPendingContexts
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(NSMutableArray *)self->_pendedAnimationContexts lastObject];
  objc_super v4 = objc_alloc_init(SBIconAnimationContext);
  [v3 fraction];
  -[SBIconAnimationContext setFraction:](v4, "setFraction:");
  v16 = v3;
  [v3 delay];
  -[SBIconAnimationContext setDelay:](v4, "setDelay:");
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_pendedAnimationContexts, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = self->_pendedAnimationContexts;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v12 = [v11 completion];
        v13 = v12;
        if (v12)
        {
          v14 = _Block_copy(v12);
          [v5 addObject:v14];

          [v11 setCompletion:0];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__SBIconAnimator__animateToFractionFromPendingContexts__block_invoke;
  v17[3] = &unk_1E6AACAB8;
  id v18 = v5;
  id v15 = v5;
  [(SBIconAnimationContext *)v4 setCompletion:v17];
  [(NSMutableArray *)self->_pendedAnimationContexts removeAllObjects];
  [(SBIconAnimator *)self _animateToFractionFromContext:v4];
}

void __55__SBIconAnimator__animateToFractionFromPendingContexts__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_animateToFractionFromContext:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  unint64_t v22 = 0;
  unint64_t v22 = [(SBIconAnimator *)self _numberOfSignificantAnimations];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 1;
  if (v20[3])
  {
    [v4 fraction];
    double v6 = v5;
    [v4 delay];
    double v8 = v7;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__SBIconAnimator__animateToFractionFromContext___block_invoke_2;
    v10[3] = &unk_1E6AB49E8;
    v12 = v17;
    v13 = &v19;
    v10[4] = self;
    id v11 = v4;
    [(SBIconAnimator *)self _animateToFraction:v10 afterDelay:v6 withSharedCompletion:v8];
    long long v9 = v11;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__SBIconAnimator__animateToFractionFromContext___block_invoke;
    block[3] = &unk_1E6AB49C0;
    id v15 = v4;
    v16 = v17;
    dispatch_async(MEMORY[0x1E4F14428], block);
    long long v9 = v15;
  }

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);
}

void __48__SBIconAnimator__animateToFractionFromContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completion];
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    uint64_t v2 = (void (**)(void, void))v3;
  }
}

void __48__SBIconAnimator__animateToFractionFromContext___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  if (!--*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 24);
    if (v4) {
      *(void *)(v3 + 24) = v4 - 1;
    }
    double v5 = [*(id *)(a1 + 40) completion];
    if (v5)
    {
      id v6 = v5;
      v5[2](v5, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
      double v5 = (void (**)(void, void))v6;
    }
  }
}

- (BOOL)_isDelayedForRotation
{
  return self->_windowIsRotating;
}

- (void)_cleanupAnimation
{
  self->_cleanedUp = 1;
  self->_animationCount = 0;
}

- (unint64_t)_numberOfSignificantAnimations
{
  return 0;
}

- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5
{
}

- (void)_invalidateCompletions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = self->_pendedAnimationContexts;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "completion", (void)v10);
        long long v9 = (void *)v8;
        if (v8) {
          (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_pendedAnimationContexts removeAllObjects];
}

- (void)_windowFinishedRotating
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4FB3100];
  uint64_t v5 = [(SBIconAnimator *)self animationContainer];
  uint64_t v6 = [v5 animationWindow];
  [v3 removeObserver:self name:v4 object:v6];

  self->_windowIsRotating = 0;
  if (self->_startAnimationAfterRotationEnds)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__SBIconAnimator__windowFinishedRotating__block_invoke;
    block[3] = &unk_1E6AAC810;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __41__SBIconAnimator__windowFinishedRotating__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  [*(id *)(a1 + 32) prepare];
  [*(id *)(a1 + 32) setFraction:*(double *)(*(void *)(a1 + 32) + 8)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _animateToFractionFromPendingContexts];
}

- (SBIconAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBIconAnimatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBHIconAnimationSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (UIView)backgroundDarkeningView
{
  return self->_backgroundDarkeningView;
}

- (void)setBackgroundDarkeningView:(id)a3
{
}

- (SBIconAnimationContaining)animationContainer
{
  return self->_animationContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationContainer, 0);
  objc_storeStrong((id *)&self->_backgroundDarkeningView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationContext, 0);
  objc_storeStrong((id *)&self->_pendedAnimationContexts, 0);
}

@end