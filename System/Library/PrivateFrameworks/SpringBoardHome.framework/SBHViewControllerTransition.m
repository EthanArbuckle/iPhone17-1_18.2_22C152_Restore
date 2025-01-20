@interface SBHViewControllerTransition
- (BOOL)isTransitioning;
- (BOOL)wantsAnimation;
- (NSString)description;
- (SBHViewControllerTransitionDelegate)delegate;
- (SBViewControllerTransitionContext)transitionContext;
- (id)_newTransitionAnimator;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)userInfo;
- (int64_t)targetEndpoint;
- (int64_t)transitionEndpoint;
- (void)_handleDidProgressToEndState;
- (void)_handleDidReturnToBeginningState;
- (void)progressToEndStateWithAnimation:(BOOL)a3;
- (void)returnToBeginningStateWithAnimation:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setTransitionContext:(id)a3;
- (void)setTransitionEndpoint:(int64_t)a3;
- (void)setUserInfo:(id)a3;
- (void)transitionDidFinish:(id)a3;
- (void)transitionToEndpoint:(int64_t)a3 withAnimation:(BOOL)a4;
@end

@implementation SBHViewControllerTransition

- (BOOL)isTransitioning
{
  v2 = [(SBHViewControllerTransition *)self transitionContext];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)targetEndpoint
{
  BOOL v3 = [(SBHViewControllerTransition *)self transitionEndpoint] == 1;
  v4 = [(SBHViewControllerTransition *)self transitionContext];
  unsigned int v5 = [v4 isCancelled];

  return v3 ^ v5;
}

- (void)transitionToEndpoint:(int64_t)a3 withAnimation:(BOOL)a4
{
  if (a3 == 1) {
    [(SBHViewControllerTransition *)self progressToEndStateWithAnimation:a4];
  }
  else {
    [(SBHViewControllerTransition *)self returnToBeginningStateWithAnimation:a4];
  }
}

- (void)progressToEndStateWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v6 = [(SBHViewControllerTransition *)self transitionContext];
  [(SBViewControllerTransitionContext *)v6 setWantsAnimation:v3];
  int64_t v7 = [(SBHViewControllerTransition *)self transitionEndpoint];
  if ([(SBHViewControllerTransition *)self targetEndpoint] == 1)
  {
    v8 = SBLogIcon();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v6 || v3)
    {
      if (v9)
      {
        v20 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543618;
        v33 = self;
        __int16 v34 = 2114;
        v35 = v20;
        _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Ignoring %{public}@ because we are already transitioning to the end state", buf, 0x16u);
      }
    }
    else
    {
      if (v9)
      {
        v10 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543618;
        v33 = self;
        __int16 v34 = 2114;
        v35 = v10;
        _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is immediately ending a transition to the end state in progress", buf, 0x16u);
      }
      v11 = self;
      v12 = [(SBViewControllerTransitionContext *)v6 animator];
      v8 = SBFSafeCast();

      v13 = [v8 animator];
      [v13 finalizeAnimationAtEndpoint:1 withContext:self];

      [(SBHViewControllerTransition *)self _handleDidProgressToEndState];
    }
  }
  else
  {
    v14 = [(SBHViewControllerTransition *)self delegate];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __63__SBHViewControllerTransition_progressToEndStateWithAnimation___block_invoke;
    v29 = &unk_1E6AACA90;
    v8 = v14;
    v30 = v8;
    v31 = self;
    v15 = (void (**)(void))_Block_copy(&v26);
    v16 = v15;
    if (v6)
    {
      v15[2](v15);
      v17 = SBLogIcon();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v7 == 1)
      {
        if (v18)
        {
          v19 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543618;
          v33 = self;
          __int16 v34 = 2114;
          v35 = v19;
          _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is restarting a cancelled transition to the end state", buf, 0x16u);
        }
        [(SBViewControllerTransitionContext *)v6 restartTransition];
      }
      else
      {
        if (v18)
        {
          v25 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543618;
          v33 = self;
          __int16 v34 = 2114;
          v35 = v25;
          _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is cancelling a transition to the beginning state", buf, 0x16u);
        }
        [(SBViewControllerTransitionContext *)v6 cancelTransition];
      }
    }
    else
    {
      v21 = SBLogIcon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543618;
        v33 = self;
        __int16 v34 = 2114;
        v35 = v22;
        _os_log_impl(&dword_1D7F0A000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is starting a new transition to the end state", buf, 0x16u);
      }
      -[SBHViewControllerTransition setTransitionEndpoint:](self, "setTransitionEndpoint:", 1, v26, v27, v28, v29);
      v6 = objc_alloc_init(SBViewControllerTransitionContext);
      [(SBViewControllerTransitionContext *)v6 setAnimationContext:self];
      [(SBViewControllerTransitionContext *)v6 setDelegate:self];
      [(SBHViewControllerTransition *)self setTransitionContext:v6];
      if (objc_opt_respondsToSelector()) {
        [v8 prepareTransition:self];
      }
      v23 = [(SBHViewControllerTransition *)self transitionContext];

      if (v23 == v6)
      {
        id v24 = [(SBHViewControllerTransition *)self _newTransitionAnimator];
        [(SBViewControllerTransitionContext *)v6 setAnimator:v24];
        [(SBViewControllerTransitionContext *)v6 setWantsAnimation:v3];
        v16[2](v16);
        [(SBViewControllerTransitionContext *)v6 startTransition];
      }
    }
  }
}

uint64_t __63__SBHViewControllerTransition_progressToEndStateWithAnimation___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 transitionWillProgressToEndState:v4];
  }
  return result;
}

- (void)returnToBeginningStateWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v6 = [(SBHViewControllerTransition *)self transitionContext];
  [(SBViewControllerTransitionContext *)v6 setWantsAnimation:v3];
  int64_t v7 = [(SBHViewControllerTransition *)self transitionEndpoint];
  if ([(SBHViewControllerTransition *)self targetEndpoint])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__SBHViewControllerTransition_returnToBeginningStateWithAnimation___block_invoke;
    aBlock[3] = &unk_1E6AAC810;
    aBlock[4] = self;
    v8 = (void (**)(void *))_Block_copy(aBlock);
    uint64_t v9 = (uint64_t)v8;
    if (v6)
    {
      v8[2](v8);
      if (v7)
      {
        BOOL v10 = [(SBViewControllerTransitionContext *)v6 isTransitioning];
        v11 = SBLogIcon();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (v10)
        {
          if (v12)
          {
            v13 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138543618;
            v29 = self;
            __int16 v30 = 2114;
            v31 = v13;
            _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is cancelling a transition to the end state", buf, 0x16u);
          }
          [(SBViewControllerTransitionContext *)v6 cancelTransition];
        }
        else
        {
          if (v12)
          {
            uint64_t v26 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138543618;
            v29 = self;
            __int16 v30 = 2114;
            v31 = v26;
            _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is cancelling a transition to the end state before it started", buf, 0x16u);
          }
          [(SBHViewControllerTransition *)self _handleDidReturnToBeginningState];
        }
      }
      else
      {
        id v24 = SBLogIcon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543618;
          v29 = self;
          __int16 v30 = 2114;
          v31 = v25;
          _os_log_impl(&dword_1D7F0A000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is restarting a cancelled transition to the beginning state", buf, 0x16u);
        }
        [(SBViewControllerTransitionContext *)v6 restartTransition];
      }
    }
    else
    {
      v20 = SBLogIcon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543618;
        v29 = self;
        __int16 v30 = 2114;
        v31 = v21;
        _os_log_impl(&dword_1D7F0A000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is starting a new transition to the beginning state", buf, 0x16u);
      }
      [(SBHViewControllerTransition *)self setTransitionEndpoint:0];
      v6 = objc_alloc_init(SBViewControllerTransitionContext);
      [(SBViewControllerTransitionContext *)v6 setAnimationContext:self];
      [(SBViewControllerTransitionContext *)v6 setDelegate:self];
      [(SBHViewControllerTransition *)self setTransitionContext:v6];
      id v22 = [(SBHViewControllerTransition *)self _newTransitionAnimator];
      [(SBViewControllerTransitionContext *)v6 setAnimator:v22];
      [(SBViewControllerTransitionContext *)v6 setWantsAnimation:v3];
      (*(void (**)(uint64_t))(v9 + 16))(v9);
      [(SBViewControllerTransitionContext *)v6 startTransition];
    }
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v9 = SBLogIcon();
  BOOL v14 = os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT);
  if (!v6 || v3)
  {
    if (v14)
    {
      v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v29 = self;
      __int16 v30 = 2114;
      v31 = v23;
      _os_log_impl(&dword_1D7F0A000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Ignoring %{public}@ because we are already transitioning to the beginning state", buf, 0x16u);
    }
    goto LABEL_24;
  }
  if (v14)
  {
    v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v29 = self;
    __int16 v30 = 2114;
    v31 = v15;
    _os_log_impl(&dword_1D7F0A000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is immediately ending a transition to the beginning state in progress", buf, 0x16u);
  }
  v16 = self;
  v17 = [(SBViewControllerTransitionContext *)v6 animator];
  BOOL v18 = SBFSafeCast();

  [(SBViewControllerTransitionContext *)v6 setWantsAnimation:0];
  v19 = [v18 animator];
  [v19 finalizeAnimationAtEndpoint:0 withContext:self];

  [(SBHViewControllerTransition *)self _handleDidReturnToBeginningState];
LABEL_25:
}

void __67__SBHViewControllerTransition_returnToBeginningStateWithAnimation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 transitionWillReturnToBeginningState:*(void *)(a1 + 32)];
  }
}

- (BOOL)wantsAnimation
{
  id v2 = [(SBHViewControllerTransition *)self transitionContext];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 isAnimated];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)transitionDidFinish:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(SBHViewControllerTransition *)self transitionContext];

  if (v6 == v5)
  {
    if ([(SBHViewControllerTransition *)self targetEndpoint] == 1) {
      [(SBHViewControllerTransition *)self _handleDidProgressToEndState];
    }
    else {
      [(SBHViewControllerTransition *)self _handleDidReturnToBeginningState];
    }
  }
  else
  {
    int64_t v7 = SBLogIcon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = NSStringFromSelector(a2);
      uint64_t v9 = [(SBHViewControllerTransition *)self transitionContext];
      int v10 = 138544130;
      v11 = self;
      __int16 v12 = 2114;
      v13 = v8;
      __int16 v14 = 2114;
      id v15 = v5;
      __int16 v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: ignoring %{public}@ for unexpected transition: %{public}@ -- expected transition: %{public}@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (void)_handleDidProgressToEndState
{
  [(SBHViewControllerTransition *)self setTransitionContext:0];
  [(SBHViewControllerTransition *)self setTransitionEndpoint:1];
  id v3 = [(SBHViewControllerTransition *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 transitionDidProgressToEndState:self];
  }
}

- (void)_handleDidReturnToBeginningState
{
  [(SBHViewControllerTransition *)self setTransitionContext:0];
  [(SBHViewControllerTransition *)self setTransitionEndpoint:0];
  id v3 = [(SBHViewControllerTransition *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 transitionDidReturnToBeginningState:self];
  }
}

- (id)_newTransitionAnimator
{
  id v3 = [(SBHViewControllerTransition *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v3 animatorForTransition:self], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = (void *)v4;
    id v6 = [[SBHViewControllerTransitionAnimatorAdapter alloc] initWithAnimator:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[(SBHViewControllerTransition *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(SBHViewControllerTransition *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBHViewControllerTransition *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHViewControllerTransition *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SBHViewControllerTransition_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AACA90;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __69__SBHViewControllerTransition_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isTransitioning"), @"isTransitioning");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "wantsAnimation"), @"wantsAnimation");
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "targetEndpoint"), @"targetEndpoint");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "transitionEndpoint"), @"transitionEndpoint");
}

- (SBHViewControllerTransitionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHViewControllerTransitionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (SBViewControllerTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
}

- (int64_t)transitionEndpoint
{
  return self->_transitionEndpoint;
}

- (void)setTransitionEndpoint:(int64_t)a3
{
  self->_transitionEndpoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end