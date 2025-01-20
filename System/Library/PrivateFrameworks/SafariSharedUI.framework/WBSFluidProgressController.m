@interface WBSFluidProgressController
- (WBSFluidProgressController)init;
- (WBSFluidProgressControllerDelegate)delegate;
- (WBSFluidProgressControllerWindowDelegate)windowDelegate;
- (void)_sendUpdateFluidProgressToObservers:(id)a3 progressState:(id)a4 source:(id)a5 updateAnimationPhase:(BOOL)a6;
- (void)_updateFluidProgressWithProgressStateSource:(id)a3;
- (void)animationStepCompleted:(id)a3;
- (void)cancelFluidProgressWithProgressStateSource:(id)a3;
- (void)finishFluidProgressWithProgressStateSource:(id)a3;
- (void)frontmostTabDidChange;
- (void)progressStateSourceDidCommitLoad:(id)a3 loadingSingleResource:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProgressAnimationSuppressed:(BOOL)a3 forProgressStateSource:(id)a4 animated:(BOOL)a5;
- (void)setWindowDelegate:(id)a3;
- (void)startFluidProgressWithProgressStateSource:(id)a3;
- (void)startRocketEffectWithProgressStateSource:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateFluidProgressWithProgressStateSource:(id)a3;
@end

@implementation WBSFluidProgressController

- (void)registerObserver:(id)a3
{
}

- (void)setWindowDelegate:(id)a3
{
}

- (WBSFluidProgressController)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSFluidProgressController;
  v2 = [(WBSFluidProgressController *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)unregisterObserver:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      [(WBSFluidProgressController *)self unregisterObserver:WeakRetained];
    }
    objc_storeWeak((id *)&self->_delegate, obj);
    if (obj) {
      [(WBSFluidProgressController *)self registerObserver:obj];
    }
  }
}

- (void)startFluidProgressWithProgressStateSource:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 progressState];
  v6 = [v4 expectedOrCurrentURL];
  objc_super v7 = objc_msgSend(v6, "safari_originalDataAsString");

  v8 = [v5 loadURL];
  char v9 = [v8 isEqualToString:v7];

  if (v9) {
    goto LABEL_2;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
  id v12 = [WeakRetained currentFluidProgressStateSource];

  if (v5 && v12 == v4) {
    [v4 clearFluidProgressState];
  }
  if ([v4 createFluidProgressState] && v12 == v4)
  {
    v10 = [v4 progressState];

    [v10 setFluidProgressAnimationPhase:0];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v13 = self->_observers;
    uint64_t v14 = [(NSHashTable *)v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "fluidProgressController:startFluidProgressBar:animateFillFade:", self, v10, 1, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSHashTable *)v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }

    [(WBSFluidProgressController *)self _updateFluidProgressWithProgressStateSource:v4];
  }
  else
  {
LABEL_2:
    v10 = v5;
  }
}

- (void)updateFluidProgressWithProgressStateSource:(id)a3
{
  id v7 = a3;
  id v4 = [v7 progressState];
  if (v7)
  {
    if (v4)
    {
      uint64_t v5 = [v4 fluidProgressAnimationPhase];
      if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 4 && ([v4 hasCompletedLoad] & 1) == 0)
      {
        [v7 estimatedProgress];
        if (v6 == 1.0)
        {
          [(WBSFluidProgressController *)self startRocketEffectWithProgressStateSource:v7];
        }
        else
        {
          objc_msgSend(v4, "setWebKitProgressValue:");
          if (v5 == 2) {
            [(WBSFluidProgressController *)self _updateFluidProgressWithProgressStateSource:v7];
          }
        }
      }
    }
  }
}

- (void)finishFluidProgressWithProgressStateSource:(id)a3
{
  id v9 = a3;
  id v4 = [v9 progressState];
  uint64_t v5 = v4;
  if (v4 && ([v4 hasCommittedLoad] & 1) != 0)
  {
    [v5 setHasCompletedLoad:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
    id v7 = [WeakRetained currentFluidProgressStateSource];
    v8 = [v7 progressState];

    if ([v5 fluidProgressAnimationPhase] != 4 || v5 != v8)
    {
      if ([v5 fluidProgressAnimationPhase] == 5
        || v5 != v8
        || ([v9 hasFailedURL] & 1) != 0)
      {
        if ([v5 fluidProgressAnimationPhase] == 4) {
          [v5 setFluidProgressAnimationPhase:5];
        }
        [(WBSFluidProgressController *)self _updateFluidProgressWithProgressStateSource:v9];
      }
      else
      {
        [(WBSFluidProgressController *)self startRocketEffectWithProgressStateSource:v9];
      }
    }
  }
}

- (void)cancelFluidProgressWithProgressStateSource:(id)a3
{
  id v6 = a3;
  id v4 = [v6 progressState];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 setHasCanceledLoad:1];
    [(WBSFluidProgressController *)self _updateFluidProgressWithProgressStateSource:v6];
  }
}

- (void)startRocketEffectWithProgressStateSource:(id)a3
{
  id v9 = a3;
  id v4 = [v9 progressState];
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 hasCommittedLoad])
    {
      if (([v9 hasFailedURL] & 1) == 0)
      {
        uint64_t v6 = [v5 fluidProgressAnimationPhase];
        if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 4)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
          id v8 = [WeakRetained currentFluidProgressStateSource];

          if (v8 == v9)
          {
            [v5 setFluidProgressAnimationPhase:4];
            if (v6 != 2) {
              goto LABEL_9;
            }
          }
          else
          {
            [v5 setFluidProgressAnimationPhase:5];
          }
          [(WBSFluidProgressController *)self _updateFluidProgressWithProgressStateSource:v9];
        }
      }
    }
  }
LABEL_9:
}

- (void)frontmostTabDidChange
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
  id v4 = [WeakRetained currentFluidProgressStateSource];
  uint64_t v5 = [v4 progressState];

  if (v5)
  {
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    long long v21 = 0uLL;
    long long v22 = 0uLL;
    uint64_t v6 = self->_observers;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * i) fluidProgressController:self startFluidProgressBar:v5 animateFillFade:0];
        }
        uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v21 objects:v30 count:16];
      }
      while (v7);
    }

    if (![v5 isFluidProgressStalled])
    {
      [v5 setShouldAnimateUsingInitialPosition:1];
      [(WBSFluidProgressController *)self _updateFluidProgressWithProgressStateSource:0];
      goto LABEL_27;
    }
    [v5 setFluidProgressAnimationPhase:2];
    [v5 updateFluidProgressValue];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v10 = self->_observers;
    uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v17 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "fluidProgressController:setProgressToCurrentPosition:", self, v5, (void)v17);
        }
        uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v17 objects:v29 count:16];
      }
      while (v11);
    }
  }
  else
  {
    long long v27 = 0uLL;
    long long v28 = 0uLL;
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    v10 = self->_observers;
    uint64_t v14 = [(NSHashTable *)v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t k = 0; k != v14; ++k)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * k) fluidProgressControllerFinishProgressBar:self animateFillFade:0];
        }
        uint64_t v14 = [(NSHashTable *)v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v14);
    }
  }

LABEL_27:
}

- (void)animationStepCompleted:(id)a3
{
  id v5 = a3;
  if ([v5 fluidProgressAnimationPhase] == 5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
    [WeakRetained fluidProgressRocketAnimationDidComplete];
  }
  if ([v5 fluidProgressAnimationPhase] == 3) {
    [v5 setFluidProgressAnimationPhase:2];
  }
  [(WBSFluidProgressController *)self _updateFluidProgressWithProgressStateSource:0];
}

- (void)progressStateSourceDidCommitLoad:(id)a3 loadingSingleResource:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a3 progressState];
  if (v5)
  {
    if (v4) {
      [v5 setFluidProgressType:1];
    }
    [v5 setHasCommittedLoad:1];
  }
}

- (void)setProgressAnimationSuppressed:(BOOL)a3 forProgressStateSource:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
    uint64_t v10 = [WeakRetained currentFluidProgressStateSource];

    id v8 = (id)v10;
  }
  long long v17 = v8;
  uint64_t v11 = [v8 progressState];
  if (v11)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v12 = self->_observers;
    uint64_t v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void **)(*((void *)&v18 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector()) {
            [v16 fluidProgressController:self suppressProgressAnimation:v6 duringFluidProgressState:v11 animated:v5];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    if ([v11 fluidProgressAnimationPhase] != 5) {
      [(WBSFluidProgressController *)self _sendUpdateFluidProgressToObservers:0 progressState:v11 source:v17 updateAnimationPhase:0];
    }
  }
}

- (WBSFluidProgressControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSFluidProgressControllerDelegate *)WeakRetained;
}

- (WBSFluidProgressControllerWindowDelegate)windowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
  return (WBSFluidProgressControllerWindowDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_updateFluidProgressWithProgressStateSource:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
  BOOL v6 = WeakRetained;
  if (!v4)
  {
    id v4 = [WeakRetained currentFluidProgressStateSource];
  }
  uint64_t v7 = [v4 progressState];
  if (v7)
  {
    id v8 = [v6 currentFluidProgressStateSource];
    id v9 = [v8 progressState];

    if ([v7 hasCompletedLoad] && objc_msgSend(v7, "fluidProgressAnimationPhase") != 4
      || [v7 hasCanceledLoad])
    {
      if (v9 == v7)
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        uint64_t v10 = self->_observers;
        uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v16;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v16 != v12) {
                objc_enumerationMutation(v10);
              }
              objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13++), "fluidProgressControllerFinishProgressBar:animateFillFade:", self, 1, (void)v15);
            }
            while (v11 != v13);
            uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v11);
        }
      }
      objc_msgSend(v4, "clearFluidProgressState", (void)v15);
    }
    else if (v9 == v7)
    {
      uint64_t v14 = [v7 fluidProgressAnimationPhase];
      if (v14 != 2 && v14 != 5) {
        [(WBSFluidProgressController *)self _sendUpdateFluidProgressToObservers:0 progressState:v7 source:v4 updateAnimationPhase:1];
      }
    }
  }
}

- (void)_sendUpdateFluidProgressToObservers:(id)a3 progressState:(id)a4 source:(id)a5 updateAnimationPhase:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = (NSHashTable *)a3;
  id v10 = a4;
  id v22 = a5;
  if (v6) {
    [v10 updateNextFluidProgressAnimation];
  }
  uint64_t v11 = [v10 fluidProgressAnimationPhase];
  uint64_t v12 = dispatch_group_create();
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  observers = v9;
  if (!v9) {
    observers = self->_observers;
  }
  BOOL v21 = v6;
  id obj = observers;
  uint64_t v14 = [(NSHashTable *)obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        dispatch_group_enter(v12);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __118__WBSFluidProgressController_Internal___sendUpdateFluidProgressToObservers_progressState_source_updateAnimationPhase___block_invoke;
        v33[3] = &unk_1E5E42550;
        v35 = v40;
        v34 = v12;
        [v17 fluidProgressController:self updateFluidProgressBar:v10 completion:v33];
      }
      uint64_t v14 = [(NSHashTable *)obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v14);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __118__WBSFluidProgressController_Internal___sendUpdateFluidProgressToObservers_progressState_source_updateAnimationPhase___block_invoke_2;
  block[3] = &unk_1E5E42578;
  id v26 = v10;
  id v27 = v22;
  BOOL v31 = v11 == 4;
  BOOL v32 = v21;
  v30 = v40;
  long long v28 = self;
  v29 = v9;
  long long v18 = v9;
  id v19 = v22;
  id v20 = v10;
  dispatch_group_notify(v12, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v40, 8);
}

void __118__WBSFluidProgressController_Internal___sendUpdateFluidProgressToObservers_progressState_source_updateAnimationPhase___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    a2 = 1;
  }
  *(unsigned char *)(v2 + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __118__WBSFluidProgressController_Internal___sendUpdateFluidProgressToObservers_progressState_source_updateAnimationPhase___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) progressState];

  if (v2 == v3)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      if (*(unsigned char *)(a1 + 73))
      {
        [*(id *)(a1 + 32) setFluidProgressAnimationPhase:5];
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
        {
          long long v10 = 0u;
          long long v11 = 0u;
          long long v8 = 0u;
          long long v9 = 0u;
          id v4 = *(id *)(*(void *)(a1 + 48) + 8);
          uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
          if (v5)
          {
            uint64_t v6 = *(void *)v9;
            do
            {
              for (uint64_t i = 0; i != v5; ++i)
              {
                if (*(void *)v9 != v6) {
                  objc_enumerationMutation(v4);
                }
                objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "fluidProgressControllerFinishProgressBar:animateFillFade:", *(void *)(a1 + 48), 1, (void)v8);
              }
              uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
            }
            while (v5);
          }
        }
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      [*(id *)(a1 + 48) animationStepCompleted:*(void *)(a1 + 32)];
    }
    if (!*(unsigned char *)(a1 + 72) && [*(id *)(a1 + 32) hasCompletedLoad] && *(unsigned char *)(a1 + 73))
    {
      [*(id *)(a1 + 32) setFluidProgressAnimationPhase:4];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        [*(id *)(a1 + 48) _sendUpdateFluidProgressToObservers:*(void *)(a1 + 56) progressState:*(void *)(a1 + 32) source:*(void *)(a1 + 40) updateAnimationPhase:*(unsigned __int8 *)(a1 + 73)];
      }
    }
  }
}

@end