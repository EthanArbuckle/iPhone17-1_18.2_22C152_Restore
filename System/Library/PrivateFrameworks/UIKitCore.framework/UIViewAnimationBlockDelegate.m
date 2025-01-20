@interface UIViewAnimationBlockDelegate
+ (id)animationBlockDelegateWithDuration:(double)a3 options:(unint64_t)a4 start:(id)a5 completion:(id)a6;
+ (void)setAnimationBlockDelegateWithDuration:(double)a3 options:(unint64_t)a4 start:(id)a5 completion:(id)a6;
- (BOOL)_allowsHitTesting;
- (BOOL)_allowsUserInteraction;
- (BOOL)_allowsUserInteractionToCutOffEndOfAnimation;
- (BOOL)_forcingImmediateCompletion;
- (UIViewAnimationState)_animationState;
- (void)_didEndBlockAnimation:(id)a3 finished:(id)a4 context:(void *)a5;
- (void)_sendDeferredCompletion:(id)a3;
- (void)_setForcingImmediateCompletion:(BOOL)a3;
- (void)_willBeginBlockAnimation:(id)a3 context:(id)a4;
- (void)set_animationState:(id)a3;
@end

@implementation UIViewAnimationBlockDelegate

- (void)set_animationState:(id)a3
{
}

+ (id)animationBlockDelegateWithDuration:(double)a3 options:(unint64_t)a4 start:(id)a5 completion:(id)a6
{
  __int16 v7 = a4;
  id v9 = a6;
  id v10 = a5;
  v11 = objc_alloc_init(UIViewAnimationBlockDelegate);
  v11->_allowUserInteraction = (v7 & 2) != 0;
  v11->_allowsUserInteractionToCutOffEndOfAnimation = (v7 & 0x400) != 0;
  v11->_allowsHitTesting = (v7 & 0x1000) != 0;
  uint64_t v12 = [v10 copy];

  id start = v11->_start;
  v11->_id start = (id)v12;

  uint64_t v14 = [v9 copy];
  id completion = v11->_completion;
  v11->_id completion = (id)v14;

  v11->_isZeroDuration = a3 <= 0.0;
  return v11;
}

- (void)_setForcingImmediateCompletion:(BOOL)a3
{
  self->__forcingImmediateCompletion = a3;
}

uint64_t __71__UIViewAnimationBlockDelegate__didEndBlockAnimation_finished_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDeferredCompletion:*(void *)(a1 + 40)];
}

- (void)_sendDeferredCompletion:(id)a3
{
  if (!self->_animationDidStopSent)
  {
    self->_animationDidStopSent = 1;
    id completion = self->_completion;
    id v4 = a3;
    id v6 = _Block_copy(completion);
    uint64_t v5 = [v4 BOOLValue];

    __UIVIEW_IS_EXECUTING_ANIMATION_COMPLETION_BLOCK__(v5, (uint64_t)v6);
  }
}

- (void)_didEndBlockAnimation:(id)a3 finished:(id)a4 context:(void *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  __int16 v7 = self->_systemPostAnimationActions;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * i) + 16))();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  [(NSMutableArray *)self->_systemPostAnimationActions removeAllObjects];
  if (self->_completion)
  {
    if (self->_didBeginBlockAnimation && !self->_isZeroDuration
      || [(UIViewAnimationBlockDelegate *)self _forcingImmediateCompletion])
    {
      if (!self->_animationDidStopSent)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_animationState);

        if (WeakRetained)
        {
          v13 = (id *)objc_loadWeakRetained((id *)&self->_animationState);
          id v14 = objc_loadWeakRetained(v13 + 34);
          if (v14)
          {
            v15 = (id *)objc_loadWeakRetained((id *)&self->_animationState);
            id v16 = objc_loadWeakRetained(v15 + 34);
            self->_animationDidStopSent = [v16 _pausesOnCompletion] ^ 1;
          }
          else
          {
            self->_animationDidStopSent = 1;
          }
        }
        else
        {
          self->_animationDidStopSent = 1;
        }
        v18 = _Block_copy(self->_completion);
        __UIVIEW_IS_EXECUTING_ANIMATION_COMPLETION_BLOCK__([v6 BOOLValue], (uint64_t)v18);
      }
    }
    else if (dyld_program_sdk_at_least())
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __71__UIViewAnimationBlockDelegate__didEndBlockAnimation_finished_context___block_invoke;
      v19[3] = &unk_1E52D9F98;
      v19[4] = self;
      id v20 = v6;
      dispatch_async(MEMORY[0x1E4F14428], v19);
    }
    else
    {
      uint64_t v25 = *MEMORY[0x1E4F1C4B0];
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      [(UIViewAnimationBlockDelegate *)self performSelector:sel__sendDeferredCompletion_ withObject:v6 afterDelay:v17 inModes:0.0];
    }
  }
}

- (BOOL)_forcingImmediateCompletion
{
  return self->__forcingImmediateCompletion;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animationState);
  objc_storeStrong((id *)&self->_systemPostAnimationActions, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_start, 0);
}

- (void)_willBeginBlockAnimation:(id)a3 context:(id)a4
{
  self->_didBeginBlockAnimation = 1;
  id start = (void (**)(void))self->_start;
  if (start) {
    start[2]();
  }
}

+ (void)setAnimationBlockDelegateWithDuration:(double)a3 options:(unint64_t)a4 start:(id)a5 completion:(id)a6
{
  __int16 v7 = a4;
  id v9 = a6;
  id v10 = a5;
  v11 = objc_alloc_init(UIViewAnimationBlockDelegate);
  v11->_allowUserInteraction = (v7 & 2) != 0;
  v11->_allowsUserInteractionToCutOffEndOfAnimation = (v7 & 0x400) != 0;
  v11->_allowsHitTesting = (v7 & 0x1000) != 0;
  uint64_t v12 = [v10 copy];

  id start = v11->_start;
  v11->_id start = (id)v12;

  uint64_t v14 = [v9 copy];
  id completion = v11->_completion;
  v11->_id completion = (id)v14;

  v11->_isZeroDuration = a3 <= 0.0;
  id v16 = *(void **)(__currentViewAnimationState + 32);
  *(void *)(__currentViewAnimationState + 32) = v11;
  v18 = v11;

  uint64_t v17 = __currentViewAnimationState;
  *(void *)(__currentViewAnimationState + 152) = sel__willBeginBlockAnimation_context_;
  *(void *)(v17 + 160) = sel__didEndBlockAnimation_finished_context_;
}

- (BOOL)_allowsUserInteractionToCutOffEndOfAnimation
{
  return self->_allowsUserInteractionToCutOffEndOfAnimation;
}

- (BOOL)_allowsHitTesting
{
  return self->_allowsHitTesting;
}

- (BOOL)_allowsUserInteraction
{
  return self->_allowUserInteraction;
}

- (UIViewAnimationState)_animationState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationState);
  return (UIViewAnimationState *)WeakRetained;
}

@end