@interface _UIPanelCoordinatingAnimator
- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4;
- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5;
- (BOOL)initiallyInteractive;
- (BOOL)isAnimated;
- (BOOL)isCancelled;
- (BOOL)isInteractive;
- (CGAffineTransform)targetTransform;
- (UIView)containerView;
- (double)completionVelocity;
- (double)percentComplete;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (int64_t)completionCurve;
- (int64_t)presentationStyle;
- (void)_runCompletions:(int64_t)a3 finished:(BOOL)a4;
- (void)_sendPanelCoordinationCompletions;
- (void)setContainerView:(id)a3;
- (void)startAnimation;
- (void)stopAnimation:(BOOL)a3;
@end

@implementation _UIPanelCoordinatingAnimator

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return [(_UIPanelCoordinatingAnimator *)self animateAlongsideTransitionInView:0 animation:a3 completion:a4];
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9) {
    goto LABEL_6;
  }
  if (self->_isInStartAnimation)
  {
    lateAnimations = self->_lateAnimations;
    if (!lateAnimations)
    {
      v12 = (NSMutableArray *)objc_opt_new();
      v13 = self->_lateAnimations;
      self->_lateAnimations = v12;

      lateAnimations = self->_lateAnimations;
    }
    v14 = _Block_copy(v9);
    [(NSMutableArray *)lateAnimations addObject:v14];

LABEL_6:
    if (!v10) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86___UIPanelCoordinatingAnimator_animateAlongsideTransitionInView_animation_completion___block_invoke;
  v20[3] = &unk_1E52E95A0;
  objc_copyWeak(&v22, &location);
  id v21 = v9;
  [(UIViewPropertyAnimator *)self addAnimations:v20];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  if (!v10) {
    goto LABEL_10;
  }
LABEL_7:
  clientCompletions = self->_clientCompletions;
  if (!clientCompletions)
  {
    v16 = (NSMutableArray *)objc_opt_new();
    v17 = self->_clientCompletions;
    self->_clientCompletions = v16;

    clientCompletions = self->_clientCompletions;
  }
  v18 = _Block_copy(v10);
  [(NSMutableArray *)clientCompletions addObject:v18];

LABEL_10:
  return 1;
}

- (void)startAnimation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  self->_isInStartAnimation = 1;
  v19.receiver = self;
  v19.super_class = (Class)_UIPanelCoordinatingAnimator;
  [(UIViewPropertyAnimator *)&v19 startAnimation];
  if ([(NSMutableArray *)self->_lateAnimations count])
  {
    objc_initWeak(&location, self);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v3 = self->_lateAnimations;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v15 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __46___UIPanelCoordinatingAnimator_startAnimation__block_invoke;
          v12[3] = &unk_1E52E95A0;
          objc_copyWeak(&v13, &location);
          v12[4] = v7;
          [(UIViewPropertyAnimator *)self addAnimations:v12];
          objc_destroyWeak(&v13);
        }
        uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v4);
    }

    [(NSMutableArray *)self->_lateAnimations removeAllObjects];
    v11.receiver = self;
    v11.super_class = (Class)_UIPanelCoordinatingAnimator;
    [(UIViewPropertyAnimator *)&v11 startAnimation];
    if ([(NSMutableArray *)self->_lateAnimations count])
    {
      if (os_variant_has_internal_diagnostics())
      {
        id v9 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Unexpected animations requested within second group of alongside animations. Abandoning.", buf, 2u);
        }
      }
      else
      {
        id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &startAnimation___s_category) + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Unexpected animations requested within second group of alongside animations. Abandoning.", buf, 2u);
        }
      }
    }
    [(NSMutableArray *)self->_lateAnimations removeAllObjects];
    objc_destroyWeak(&location);
  }
  self->_isInStartAnimation = 0;
}

- (BOOL)isAnimated
{
  return 1;
}

- (int64_t)presentationStyle
{
  return -1;
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

- (BOOL)initiallyInteractive
{
  return 0;
}

- (BOOL)isInteractive
{
  return 0;
}

- (BOOL)isCancelled
{
  return self->_wasCancelled;
}

- (double)percentComplete
{
  double result = 0.0;
  if (!self->_wasCancelled) {
    return 1.0;
  }
  return result;
}

- (double)completionVelocity
{
  double result = 0.0;
  if (!self->_wasCancelled) {
    return 1.0;
  }
  return result;
}

- (int64_t)completionCurve
{
  return 0;
}

- (void)_sendPanelCoordinationCompletions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = (void *)[(NSMutableArray *)self->_clientCompletions copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      id v9 = v6;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 = _Block_copy(*(const void **)(*((void *)&v10 + 1) + 8 * v8));

        (*((void (**)(void *, _UIPanelCoordinatingAnimator *))v6 + 2))(v6, self);
        ++v8;
        id v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)stopAnimation:(BOOL)a3
{
  self->_wasCancelled = 1;
  v3.receiver = self;
  v3.super_class = (Class)_UIPanelCoordinatingAnimator;
  [(UIViewPropertyAnimator *)&v3 stopAnimation:a3];
}

- (void)_runCompletions:(int64_t)a3 finished:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPanelCoordinatingAnimator;
  -[UIViewPropertyAnimator _runCompletions:finished:](&v7, sel__runCompletions_finished_, a3);
  BOOL v6 = !a4;
  if (self->_wasCancelled) {
    BOOL v6 = 1;
  }
  self->_wasCancelled = v6;
  [(_UIPanelCoordinatingAnimator *)self _sendPanelCoordinationCompletions];
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
  objc_storeStrong((id *)&self->_lateAnimations, 0);
  objc_storeStrong((id *)&self->_clientCompletions, 0);
}

@end