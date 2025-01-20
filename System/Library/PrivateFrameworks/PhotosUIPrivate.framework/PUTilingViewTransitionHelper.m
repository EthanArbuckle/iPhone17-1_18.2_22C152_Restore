@interface PUTilingViewTransitionHelper
+ (id)_transitionEndPointWithViewController:(id)a3;
+ (id)concatenatedProgressBlockForTilingView:(id)a3 transitionOperation:(int64_t)a4;
+ (int64_t)typeOfEndPoint:(id)a3 forTransitionFromViewController:(id)a4 toViewController:(id)a5;
+ (void)registerTransitionEndPoint:(id)a3 forViewController:(id)a4;
+ (void)unregisterTransitionEndPoint:(id)a3 forViewController:(id)a4;
- (BOOL)_endPointUsesTransientTilingView:(id)a3;
- (BOOL)_validateTransitionFromEndPoint:(id)a3 toEndPoint:(id)a4;
- (BOOL)hasStarted;
- (BOOL)isTransitionPaused;
- (NSArray)transitionPausingCall;
- (PUAnimationGroup)_tilingViewAnimationGroup;
- (PUMaximumChangeRateValueFilter)_chromeProgressValueFilter;
- (PUMaximumChangeRateValueFilter)_transitionProgressValueFilter;
- (PUTilingView)_tilingView;
- (PUTilingViewControllerTransition)transition;
- (PUTilingViewControllerTransitionEndPoint)_endPointOwningTilingView;
- (PUTilingViewControllerTransitionEndPoint)_fromEndPoint;
- (PUTilingViewControllerTransitionEndPoint)_toEndPoint;
- (PUTilingViewControllerTransitionEndPoint)endPoint;
- (PUTilingViewTransitionHelper)init;
- (PUTilingViewTransitionHelper)initWithPresentationDuration:(double)a3 dismissalDuration:(double)a4 endPoint:(id)a5;
- (double)_backgroundProgressOffset;
- (double)_progressSpeed;
- (double)_startTime;
- (double)_transitionProgressOffset;
- (double)dismissalDuration;
- (double)presentationDuration;
- (int64_t)_barStyleForEndPoint:(id)a3;
- (int64_t)_currentOperation;
- (unint64_t)_interactionOptions;
- (void)_getTransitionProgress:(double *)a3 backgroundProgress:(double *)a4 chromeProgress:(double *)a5;
- (void)_performWhenToEndPoint:(id)a3 isReadyToAdoptTilingView:(id)a4 fromEndPoint:(id)a5 action:(id)a6;
- (void)_performWhenToEndPoint:(id)a3 isReadyToAdoptTilingView:(id)a4 fromEndPoint:(id)a5 retryCount:(int64_t)a6 startTime:(double)a7 action:(id)a8;
- (void)_setBackgroundProgressOffset:(double)a3;
- (void)_setChromeProgressValueFilter:(id)a3;
- (void)_setCurrentOperation:(int64_t)a3;
- (void)_setEndPointOwningTilingView:(id)a3;
- (void)_setFromEndPoint:(id)a3;
- (void)_setHasStarted:(BOOL)a3;
- (void)_setInteractionOptions:(unint64_t)a3;
- (void)_setProgressSpeed:(double)a3;
- (void)_setStartTime:(double)a3;
- (void)_setTilingView:(id)a3;
- (void)_setTilingViewAnimationGroup:(id)a3;
- (void)_setToEndPoint:(id)a3;
- (void)_setTransitionPaused:(BOOL)a3;
- (void)_setTransitionProgressOffset:(double)a3;
- (void)_setTransitionProgressValueFilter:(id)a3;
- (void)animateTransitionWithOperation:(int64_t)a3 startedInteractively:(BOOL)a4;
- (void)pauseTransition;
- (void)pauseTransitionWithOptions:(unint64_t)a3;
- (void)resumeTransition:(BOOL)a3;
- (void)setTransition:(id)a3;
- (void)setTransitionPausingCall:(id)a3;
- (void)updatePausedTransitionWithProgress:(double)a3 interactionProgress:(double)a4;
@end

@implementation PUTilingViewTransitionHelper

+ (void)unregisterTransitionEndPoint:(id)a3 forViewController:(id)a4
{
}

+ (void)registerTransitionEndPoint:(id)a3 forViewController:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  v6 = (void *)PURegisteredTilingViewTransitionEndPoints;
  if (!PURegisteredTilingViewTransitionEndPoints)
  {
    uint64_t v7 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    v8 = (void *)PURegisteredTilingViewTransitionEndPoints;
    PURegisteredTilingViewTransitionEndPoints = v7;

    v6 = (void *)PURegisteredTilingViewTransitionEndPoints;
  }
  [v6 setObject:v9 forKey:v5];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_endPoint);
  objc_storeStrong((id *)&self->_transitionPausingCall, 0);
  objc_destroyWeak((id *)&self->__endPointOwningTilingView);
  objc_destroyWeak((id *)&self->__toEndPoint);
  objc_destroyWeak((id *)&self->__fromEndPoint);
  objc_destroyWeak((id *)&self->__tilingView);
  objc_storeStrong((id *)&self->__tilingViewAnimationGroup, 0);
  objc_storeStrong((id *)&self->__chromeProgressValueFilter, 0);
  objc_storeStrong((id *)&self->__transitionProgressValueFilter, 0);
  objc_destroyWeak((id *)&self->_transition);
}

- (PUTilingViewControllerTransitionEndPoint)endPoint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_endPoint);
  return (PUTilingViewControllerTransitionEndPoint *)WeakRetained;
}

- (void)setTransitionPausingCall:(id)a3
{
}

- (NSArray)transitionPausingCall
{
  return self->_transitionPausingCall;
}

- (void)_setInteractionOptions:(unint64_t)a3
{
  self->__interactionOptions = a3;
}

- (unint64_t)_interactionOptions
{
  return self->__interactionOptions;
}

- (PUTilingViewControllerTransitionEndPoint)_endPointOwningTilingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__endPointOwningTilingView);
  return (PUTilingViewControllerTransitionEndPoint *)WeakRetained;
}

- (void)_setToEndPoint:(id)a3
{
}

- (PUTilingViewControllerTransitionEndPoint)_toEndPoint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__toEndPoint);
  return (PUTilingViewControllerTransitionEndPoint *)WeakRetained;
}

- (void)_setFromEndPoint:(id)a3
{
}

- (PUTilingViewControllerTransitionEndPoint)_fromEndPoint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__fromEndPoint);
  return (PUTilingViewControllerTransitionEndPoint *)WeakRetained;
}

- (void)_setTilingView:(id)a3
{
}

- (PUTilingView)_tilingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__tilingView);
  return (PUTilingView *)WeakRetained;
}

- (void)_setTilingViewAnimationGroup:(id)a3
{
}

- (PUAnimationGroup)_tilingViewAnimationGroup
{
  return self->__tilingViewAnimationGroup;
}

- (void)_setChromeProgressValueFilter:(id)a3
{
}

- (PUMaximumChangeRateValueFilter)_chromeProgressValueFilter
{
  return self->__chromeProgressValueFilter;
}

- (void)_setTransitionProgressValueFilter:(id)a3
{
}

- (PUMaximumChangeRateValueFilter)_transitionProgressValueFilter
{
  return self->__transitionProgressValueFilter;
}

- (void)_setBackgroundProgressOffset:(double)a3
{
  self->__backgroundProgressOffset = a3;
}

- (double)_backgroundProgressOffset
{
  return self->__backgroundProgressOffset;
}

- (void)_setTransitionProgressOffset:(double)a3
{
  self->__transitionProgressOffset = a3;
}

- (double)_transitionProgressOffset
{
  return self->__transitionProgressOffset;
}

- (void)_setProgressSpeed:(double)a3
{
  self->__progressSpeed = a3;
}

- (double)_progressSpeed
{
  return self->__progressSpeed;
}

- (void)_setStartTime:(double)a3
{
  self->__startTime = a3;
}

- (double)_startTime
{
  return self->__startTime;
}

- (void)_setCurrentOperation:(int64_t)a3
{
  self->__currentOperation = a3;
}

- (int64_t)_currentOperation
{
  return self->__currentOperation;
}

- (void)_setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)_setTransitionPaused:(BOOL)a3
{
  self->_transitionPaused = a3;
}

- (BOOL)isTransitionPaused
{
  return self->_transitionPaused;
}

- (void)setTransition:(id)a3
{
}

- (PUTilingViewControllerTransition)transition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transition);
  return (PUTilingViewControllerTransition *)WeakRetained;
}

- (double)dismissalDuration
{
  return self->_dismissalDuration;
}

- (double)presentationDuration
{
  return self->_presentationDuration;
}

- (void)_setEndPointOwningTilingView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__endPointOwningTilingView);

  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->__endPointOwningTilingView);
    objc_storeWeak((id *)&self->__endPointOwningTilingView, obj);
    uint64_t v7 = [(PUTilingViewTransitionHelper *)self transition];
    v8 = [v6 tilingViewControllerTransition:v7 tilingViewToTransferToEndPoint:obj];
    id v9 = [(PUTilingViewTransitionHelper *)self _tilingView];

    if (v8 != v9)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      v13 = [(PUTilingViewTransitionHelper *)self _tilingView];
      [v12 handleFailureInMethod:a2, self, @"PUTilingViewControllerTransition.m", 713, @"tiling view %@ to transfer from %@ to %@ isn't the transition's tiling view %@", v8, v6, obj, v13 object file lineNumber description];
    }
    [v6 tilingViewControllerTransition:v7 abandonTilingView:v8 toEndPoint:obj];
    id v10 = [(PUTilingViewTransitionHelper *)self _fromEndPoint];
    BOOL v11 = v10 == obj;

    [obj tilingViewControllerTransition:v7 adoptTilingView:v8 fromEndPoint:v6 isCancelingTransition:v11 animationSetupCompletionHandler:0];
  }
}

- (int64_t)_barStyleForEndPoint:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 tilingViewControllerTransitionPreferredBarStyle:self];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int64_t v6 = 0;
      goto LABEL_7;
    }
    uint64_t v5 = objc_msgSend(v4, "pu_preferredBarStyle");
  }
  int64_t v6 = v5;
LABEL_7:

  return v6;
}

- (BOOL)_endPointUsesTransientTilingView:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 tilingViewControllerTransitionUsesTransientTilingView:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_validateTransitionFromEndPoint:(id)a3 toEndPoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = !v9;
  if (v9)
  {
    BOOL v11 = [(PUTilingViewTransitionHelper *)self transition];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__PUTilingViewTransitionHelper__validateTransitionFromEndPoint_toEndPoint___block_invoke;
    v14[3] = &unk_1E5F2D098;
    id v15 = v11;
    id v16 = v6;
    v17 = self;
    id v18 = v8;
    id v12 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
  return v10;
}

uint64_t __75__PUTilingViewTransitionHelper__validateTransitionFromEndPoint_toEndPoint___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelInteractiveTransition];
  [*(id *)(a1 + 32) completeTransition:0];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 40) tilingViewControllerTransitionWasAborted:*(void *)(a1 + 48)];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    v3 = *(void **)(a1 + 56);
    return [v3 tilingViewControllerTransitionWasAborted:v4];
  }
  return result;
}

- (void)_performWhenToEndPoint:(id)a3 isReadyToAdoptTilingView:(id)a4 fromEndPoint:(id)a5 retryCount:(int64_t)a6 startTime:(double)a7 action:(id)a8
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v14 = (PUTilingViewTransitionHelper *)a3;
  id v15 = a4;
  id v16 = a5;
  v17 = (void (**)(void))a8;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v19 = v18 - a7;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [(PUTilingViewTransitionHelper *)v14 isReadyToAdoptTilingView:v15 fromEndPoint:v16])
  {
    v20 = PLOneUpGetLog();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:

      v17[2](v17);
      goto LABEL_7;
    }
    *(_DWORD *)buf = 134218754;
    v34 = self;
    __int16 v35 = 2112;
    v36 = v14;
    __int16 v37 = 2048;
    int64_t v38 = a6;
    __int16 v39 = 2048;
    double v40 = v19;
    v21 = "[animateTransition] %p end point %@ ready after retries: %ti delay: %0.3f s";
    v22 = v20;
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    uint32_t v24 = 42;
LABEL_5:
    _os_log_impl(&dword_1AE9F8000, v22, v23, v21, buf, v24);
    goto LABEL_6;
  }
  v25 = PLOneUpGetLog();
  v20 = v25;
  if (a6 > 99 || v19 >= 1.0)
  {
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 138412290;
    v34 = v14;
    v21 = "End point not ready to adopt tiling view %@. Failing gracefully, but animation might be glitchy.";
    v22 = v20;
    os_log_type_t v23 = OS_LOG_TYPE_FAULT;
    uint32_t v24 = 12;
    goto LABEL_5;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v34 = self;
    __int16 v35 = 2112;
    v36 = v14;
    _os_log_impl(&dword_1AE9F8000, v20, OS_LOG_TYPE_DEBUG, "[animateTransition] %p end point %@ not ready yet", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__PUTilingViewTransitionHelper__performWhenToEndPoint_isReadyToAdoptTilingView_fromEndPoint_retryCount_startTime_action___block_invoke;
  block[3] = &unk_1E5F2D070;
  block[4] = self;
  v27 = v14;
  id v28 = v15;
  id v29 = v16;
  int64_t v31 = a6;
  double v32 = a7;
  v30 = v17;
  dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_7:
}

uint64_t __121__PUTilingViewTransitionHelper__performWhenToEndPoint_isReadyToAdoptTilingView_fromEndPoint_retryCount_startTime_action___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performWhenToEndPoint:*(void *)(a1 + 40) isReadyToAdoptTilingView:*(void *)(a1 + 48) fromEndPoint:*(void *)(a1 + 56) retryCount:*(void *)(a1 + 72) + 1 startTime:*(void *)(a1 + 64) action:*(double *)(a1 + 80)];
}

- (void)_performWhenToEndPoint:(id)a3 isReadyToAdoptTilingView:(id)a4 fromEndPoint:(id)a5 action:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__PUTilingViewTransitionHelper__performWhenToEndPoint_isReadyToAdoptTilingView_fromEndPoint_action___block_invoke;
  v19[3] = &unk_1E5F2D048;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  uint64_t v24 = v14;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v19);
}

uint64_t __100__PUTilingViewTransitionHelper__performWhenToEndPoint_isReadyToAdoptTilingView_fromEndPoint_action___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performWhenToEndPoint:*(void *)(a1 + 40) isReadyToAdoptTilingView:*(void *)(a1 + 48) fromEndPoint:*(void *)(a1 + 56) retryCount:0 startTime:*(void *)(a1 + 64) action:*(double *)(a1 + 72)];
}

- (void)animateTransitionWithOperation:(int64_t)a3 startedInteractively:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v186 = *MEMORY[0x1E4F143B8];
  v8 = PLOneUpGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v177 = self;
    __int16 v178 = 2048;
    int64_t v179 = a3;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "[animateTransition] %p animate transition with operation %li", buf, 0x16u);
  }

  int64_t v108 = a3;
  [(PUTilingViewTransitionHelper *)self _setCurrentOperation:a3];
  BOOL v9 = [(PUTilingViewTransitionHelper *)self transition];
  id v10 = [v9 fromViewController];
  id v11 = [v9 toViewController];
  id v12 = [(PUTilingViewTransitionHelper *)self endPoint];
  uint64_t v13 = [(id)objc_opt_class() typeOfEndPoint:v12 forTransitionFromViewController:v10 toViewController:v11];
  SEL v105 = a2;
  if (!v13)
  {
    id v15 = PLOneUpGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v177 = v12;
      __int16 v178 = 2112;
      int64_t v179 = (int64_t)v10;
      __int16 v180 = 2112;
      v181 = v11;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "[animateTransition] Couldn't find type of end point %@ for transition from %@ to %@", buf, 0x20u);
    }

    goto LABEL_11;
  }
  if (v13 != 2)
  {
    if (v13 == 1)
    {
      uint64_t v14 = v12;
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v14 = 0;
LABEL_12:
    id v16 = [(id)objc_opt_class() _transitionEndPointWithViewController:v11];
    if (v14) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  id v16 = v12;
  if (!v16) {
    goto LABEL_11;
  }
LABEL_13:
  uint64_t v14 = [(id)objc_opt_class() _transitionEndPointWithViewController:v10];
LABEL_14:
  if ([(PUTilingViewTransitionHelper *)self _validateTransitionFromEndPoint:v14 toEndPoint:v16])
  {
    [(PUTilingViewTransitionHelper *)self _setFromEndPoint:v14];
    [(PUTilingViewTransitionHelper *)self _setToEndPoint:v16];
    id v17 = PLOneUpGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      v177 = self;
      __int16 v178 = 2112;
      int64_t v179 = (int64_t)v10;
      __int16 v180 = 2112;
      v181 = v14;
      __int16 v182 = 2112;
      v183 = v11;
      __int16 v184 = 2112;
      v185 = v16;
      _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_DEFAULT, "[animateTransition] %p fromVC: %@, fromEndPoint: %@, toVC: %@, toEndPoint: %@", buf, 0x34u);
    }

    id v18 = [v10 navigationController];
    if (!v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (id v18 = v10) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v18 = v11;
        }
        else {
          id v18 = 0;
        }
      }
    }
    BOOL v96 = v4;
    v111 = [v10 tabBarController];
    char v94 = [(PUTilingViewTransitionHelper *)v18 _useStandardStatusBarHeight];
    int v19 = [v10 prefersStatusBarHidden];
    if (v19 != [(PUTilingViewTransitionHelper *)v11 prefersStatusBarHidden]) {
      [(PUTilingViewTransitionHelper *)v18 _setUseStandardStatusBarHeight:1];
    }
    id v20 = [v9 containerView];
    v102 = [v20 subviews];
    id v21 = [v9 transitionContext];
    v101 = [v21 viewForKey:*MEMORY[0x1E4FB30C0]];

    v116 = v9;
    id v22 = [v9 transitionContext];
    id v23 = [v22 viewForKey:*MEMORY[0x1E4FB30D0]];

    uint64_t v24 = [(PUTilingViewTransitionHelper *)v11 presentedViewController];
    v117 = v16;
    v109 = v20;
    v98 = v24;
    if (v24)
    {
      v25 = [v24 presentationController];
      v26 = [v25 containerView];

      if ([v26 isDescendantOfView:v20])
      {
        id v16 = v117;
        id v27 = v23;
      }
      else
      {
        id v27 = v26;

        id v16 = v117;
      }
    }
    else
    {
      id v27 = v23;
    }
    v113 = v18;
    v99 = v12;
    v100 = v10;
    [v116 finalToViewFrame];
    objc_msgSend(v27, "setFrame:");
    if (v27) {
      [v109 addSubview:v27];
    }
    id v29 = [v109 superview];
    if (v29 != v109)
    {
      long long v173 = 0u;
      long long v174 = 0u;
      long long v171 = 0u;
      long long v172 = 0u;
      id v30 = v102;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v171 objects:v175 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v172;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v172 != v33) {
              objc_enumerationMutation(v30);
            }
            objc_msgSend(*(id *)(*((void *)&v171 + 1) + 8 * i), "px_transferToSuperview:", v29);
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v171 objects:v175 count:16];
        }
        while (v32);
      }

      objc_msgSend(v27, "px_transferToSuperview:", v29);
      id v16 = v117;
    }
    v115 = v11;
    __int16 v35 = [(PUTilingViewTransitionHelper *)v14 tilingViewControllerTransition:v116 tilingViewToTransferToEndPoint:v16];
    v36 = PLOneUpGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v177 = self;
      __int16 v178 = 2112;
      int64_t v179 = (int64_t)v35;
      _os_log_impl(&dword_1AE9F8000, v36, OS_LOG_TYPE_DEFAULT, "[animateTransition] %p tilingView: %@", buf, 0x16u);
    }

    [(PUTilingViewTransitionHelper *)self _setTilingView:v35];
    uint64_t v37 = [v35 tileAnimator];
    objc_msgSend(v35, "px_transferToSuperview:", v29);
    v91 = (void *)v37;
    if (v108 == 2)
    {
      if (!v101)
      {
        v82 = [MEMORY[0x1E4F28B00] currentHandler];
        [v82 handleFailureInMethod:v105, self, @"PUTilingViewControllerTransition.m", 326, @"Invalid parameter not satisfying: %@", @"fromView != nil" object file lineNumber description];
      }
      [v29 bringSubviewToFront:v101];
      v165[0] = MEMORY[0x1E4F143A8];
      v165[1] = 3221225472;
      v165[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_2;
      v165[3] = &unk_1E5F2CE98;
      v166 = v14;
      v167 = self;
      id v168 = v101;
      v106 = _Block_copy(v165);
      [(PUTilingViewTransitionHelper *)self dismissalDuration];
      double v39 = v41;
      v83 = [(id)objc_opt_class() concatenatedProgressBlockForTilingView:v35 transitionOperation:2];

      v104 = 0;
      double v40 = v166;
    }
    else if (v108 == 1)
    {
      if (!v27)
      {
        v81 = [MEMORY[0x1E4F28B00] currentHandler];
        [v81 handleFailureInMethod:v105, self, @"PUTilingViewControllerTransition.m", 314, @"Invalid parameter not satisfying: %@", @"toView != nil" object file lineNumber description];
      }
      [v29 bringSubviewToFront:v27];
      [v27 setAlpha:0.0];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke;
      aBlock[3] = &unk_1E5F2D8C0;
      id v170 = v27;
      v106 = _Block_copy(aBlock);
      [(PUTilingViewTransitionHelper *)self presentationDuration];
      double v39 = v38;
      v104 = [(id)objc_opt_class() concatenatedProgressBlockForTilingView:v35 transitionOperation:1];
      v83 = 0;
      double v40 = v170;
    }
    else
    {
      double v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:v105 object:self file:@"PUTilingViewControllerTransition.m" lineNumber:341 description:@"unexpected operation"];
      v104 = 0;
      v106 = 0;
      v83 = 0;
      double v39 = 0.0;
    }
    v90 = v27;

    BOOL v42 = [(PUTilingViewTransitionHelper *)self _endPointUsesTransientTilingView:v14];
    v43 = v14;
    if (v42
      || (BOOL v44 = [(PUTilingViewTransitionHelper *)self _endPointUsesTransientTilingView:v16], v43 = v16, v44))
    {
      v45 = v43;
      BOOL v46 = 0;
      if (!v45 || !v96) {
        goto LABEL_63;
      }
      if (([(PUTilingViewTransitionHelper *)self _interactionOptions] & 0x10) == 0)
      {
        v47 = +[PUTilingViewSettings sharedInstance];
        uint64_t v48 = [v47 transitionProgressBehavior];

        BOOL v46 = (unint64_t)(v48 - 1) < 2;
LABEL_63:
        v49 = PLOneUpGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v177) = v46;
          _os_log_impl(&dword_1AE9F8000, v49, OS_LOG_TYPE_DEFAULT, "[animateTransition] shouldAnimateTilingViewBackground: %d", buf, 8u);
        }

        v93 = v45;
        if (v46)
        {
          if ([(PUTilingViewTransitionHelper *)self _barStyleForEndPoint:v45] == 1) {
            double v50 = 0.0;
          }
          else {
            double v50 = 1.0;
          }
          v51 = +[PUTilingViewSettings sharedInstance];
          [v51 interactiveTransitionBackgroundDimming];
          double v53 = v52;

          if (v45 == v14) {
            double v54 = 0.0;
          }
          else {
            double v54 = v53;
          }
          if (v45 == v14) {
            double v55 = v53;
          }
          else {
            double v55 = 0.0;
          }
          v160[0] = MEMORY[0x1E4F143A8];
          v160[1] = 3221225472;
          v160[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_31;
          v160[3] = &unk_1E5F2CEC0;
          double v162 = v54;
          double v163 = v55;
          id v56 = v35;
          id v161 = v56;
          double v164 = v50;
          v57 = _Block_copy(v160);
          v58 = [v56 backgroundColor];
          v59 = (void *)[v58 copy];

          v157[0] = MEMORY[0x1E4F143A8];
          v157[1] = 3221225472;
          v157[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_2_33;
          v157[3] = &unk_1E5F2ECC8;
          id v158 = v56;
          id v159 = v59;
          id v60 = v59;
          v88 = _Block_copy(v157);
        }
        else
        {
          v57 = 0;
          v88 = 0;
        }
        double v61 = 0.0;
        v62 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", -1.79769313e308, -1.79769313e308, 0.0, 0.0);
        [v29 addSubview:v62];
        UIAnimationDragCoefficient();
        v64 = (void *)MEMORY[0x1E4FB1EB0];
        v152[0] = MEMORY[0x1E4F143A8];
        double v65 = v39 / v63;
        v152[1] = 3221225472;
        v152[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_3;
        v152[3] = &unk_1E5F2E058;
        id v153 = v62;
        int64x2_t v154 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
        uint64_t v156 = 0;
        uint64_t v155 = 0;
        v150[0] = MEMORY[0x1E4F143A8];
        v150[1] = 3221225472;
        v150[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_4;
        v150[3] = &unk_1E5F2CEE8;
        id v151 = v153;
        id v66 = v153;
        [v64 animateWithDuration:v152 animations:v150 completion:v65];

        v67 = [(PUTilingViewTransitionHelper *)v113 navigationBar];
        [v67 setUserInteractionEnabled:0];

        v68 = [v111 tabBar];
        [v68 setUserInteractionEnabled:0];

        [(PUTilingViewTransitionHelper *)self _setTransitionProgressOffset:0.0];
        [(PUTilingViewTransitionHelper *)self _setBackgroundProgressOffset:0.0];
        if (![(PUTilingViewTransitionHelper *)self isTransitionPaused])
        {
          UIAnimationDragCoefficient();
          double v65 = v65 * v69;
          double v61 = 1.0 / v65;
        }
        [(PUTilingViewTransitionHelper *)self _setProgressSpeed:v61];
        v85 = [PUDisplayLink alloc];
        v140[0] = MEMORY[0x1E4F143A8];
        v140[1] = 3221225472;
        v140[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_5;
        v140[3] = &unk_1E5F2CF38;
        v140[4] = self;
        id v141 = v35;
        double v149 = v65;
        v142 = v117;
        v97 = v14;
        v143 = v14;
        v84 = v57;
        id v145 = v57;
        id v146 = v106;
        id v147 = v104;
        id v148 = v83;
        id v144 = v116;
        v125[0] = MEMORY[0x1E4F143A8];
        v125[1] = 3221225472;
        v125[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_7;
        v125[3] = &unk_1E5F2CF60;
        v126 = v113;
        v127 = self;
        id v87 = v144;
        id v128 = v87;
        id v129 = v102;
        id v130 = v109;
        id v131 = v90;
        v132 = v115;
        id v86 = v91;
        id v133 = v86;
        id v138 = v88;
        v70 = v142;
        v134 = v70;
        v71 = v143;
        v135 = v71;
        id v72 = v141;
        id v136 = v72;
        id v137 = v111;
        char v139 = v94;
        id v112 = v111;
        id v89 = v88;
        id v73 = v90;
        id v110 = v109;
        id v103 = v102;
        v95 = v113;
        id v92 = v83;
        id v74 = v104;
        v75 = v127;
        id v114 = v106;
        id v107 = v84;
        v76 = [(PUDisplayLink *)v85 initWithUpdateHandler:v140 completionHandler:v125];
        v77 = PLOneUpGetLog();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v177 = v75;
          __int16 v178 = 2112;
          int64_t v179 = (int64_t)v70;
          _os_log_impl(&dword_1AE9F8000, v77, OS_LOG_TYPE_DEFAULT, "[animateTransition] %p waiting to start transition to end point %@", buf, 0x16u);
        }

        v118[0] = MEMORY[0x1E4F143A8];
        v118[1] = 3221225472;
        v118[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_41;
        v118[3] = &unk_1E5F2CFB0;
        v118[4] = v75;
        v119 = v70;
        v120 = v71;
        id v121 = v87;
        id v122 = v72;
        id v123 = v86;
        v124 = v76;
        v78 = v76;
        id v79 = v86;
        id v80 = v72;
        [(PUTilingViewTransitionHelper *)v75 _performWhenToEndPoint:v119 isReadyToAdoptTilingView:v80 fromEndPoint:v120 action:v118];

        id v11 = v115;
        BOOL v9 = v116;
        id v12 = v99;
        id v10 = v100;
        id v16 = v117;
        uint64_t v14 = v97;
        goto LABEL_82;
      }
    }
    else
    {
      v45 = 0;
    }
    BOOL v46 = 0;
    goto LABEL_63;
  }
  id v28 = PLOneUpGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v177 = v14;
    __int16 v178 = 2112;
    int64_t v179 = (int64_t)v16;
    _os_log_impl(&dword_1AE9F8000, v28, OS_LOG_TYPE_ERROR, "[animateTransition] Failed to validate fromEndPoint: %@ toEndPoint: %@", buf, 0x16u);
  }

  [v9 finishInteractiveTransition];
  [v9 completeTransition:1];
LABEL_82:
}

uint64_t __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:");
}

uint64_t __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_2(uint64_t a1, double a2)
{
  [*(id *)(a1 + 32) tilingViewControllerTransitionProgressAtWhichChromeIsFullyFadedOut:*(void *)(a1 + 40)];
  if (v4 == 0.0) {
    double v4 = 1.0;
  }
  double v5 = 1.0 - a2 / v4;
  id v6 = *(void **)(a1 + 48);
  return [v6 setAlpha:v5];
}

void __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_31(uint64_t a1, double a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4FB1618] colorWithWhite:*(double *)(a1 + 56) alpha:*(double *)(a1 + 48) * a2 + (1.0 - a2) * *(double *)(a1 + 40)];
  [v2 setBackgroundColor:v3];
}

uint64_t __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_2_33(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

uint64_t __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGRect v4 = CGRectOffset(*(CGRect *)(a1 + 40), 1.0, 1.0);
  return objc_msgSend(v1, "setFrame:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height);
}

uint64_t __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_5(uint64_t a1, char *a2)
{
  double v24 = 0.0;
  double v25 = 0.0;
  double v23 = 0.0;
  [*(id *)(a1 + 32) _getTransitionProgress:&v25 backgroundProgress:&v24 chromeProgress:&v23];
  [*(id *)(a1 + 32) _progressSpeed];
  double v5 = v25;
  BOOL v8 = v4 <= 0.0 || v25 < 1.0 || v24 < 1.0 || v23 < 1.0;
  if (!v8 || v25 <= 0.0 && v24 <= 0.0 && v4 < 0.0)
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v9 = 1;
    char v22 = 1;
    if (v4 < 0.0)
    {
      id v10 = *(void **)(a1 + 40);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_6;
      v18[3] = &unk_1E5F2CF10;
      v18[4] = &v19;
      [v10 enumerateAllTileControllersUsingBlock:v18];
      char v9 = *((unsigned char *)v20 + 24);
    }
    *a2 = v9;
    _Block_object_dispose(&v19, 8);
    double v5 = v25;
  }
  double v11 = v5 * *(double *)(a1 + 104);
  id v12 = [*(id *)(a1 + 32) _tilingViewAnimationGroup];
  [v12 setElapsedTime:v11];

  if (([*(id *)(a1 + 32) _interactionOptions] & 8) != 0)
  {
    uint64_t v13 = 56;
    if (v25 > 0.0) {
      uint64_t v13 = 48;
    }
    objc_msgSend(*(id *)(a1 + 32), "_setEndPointOwningTilingView:", *(void *)(a1 + v13), v25);
  }
  uint64_t v14 = *(void *)(a1 + 72);
  if (v14)
  {
    double v15 = v24;
    (*(void (**)(double))(v14 + 16))(v24);
  }
  else
  {
    double v15 = v23;
  }
  uint64_t v16 = *(void *)(a1 + 80);
  if (v16) {
    (*(void (**)(double))(v16 + 16))(v23);
  }
  if (*(void *)(a1 + 88))
  {
    PXClamp();
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
  if (*(void *)(a1 + 96))
  {
    PXClamp();
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
  return [*(id *)(a1 + 64) updateInteractiveTransitionProgress:v23 visibleTransitionProgress:v15];
}

void __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_7(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "ppt_notifyTransitionAnimationDidComplete");
  [*(id *)(a1 + 40) _progressSpeed];
  double v3 = v2;
  double v4 = PLOneUpGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v42) = v3 >= 0.0;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "[animateTransition] didFinishTransition: %d", buf, 8u);
  }

  if (v3 < 0.0)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = *(id *)(a1 + 56);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "px_transferToSuperview:", *(void *)(a1 + 64), (void)v33);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v43 count:16];
      }
      while (v17);
    }

    [*(id *)(a1 + 72) removeFromSuperview];
  }
  else
  {
    double v5 = [*(id *)(a1 + 48) transitionContext];
    id v6 = [v5 viewForKey:*MEMORY[0x1E4FB30C0]];
    id v7 = [v5 viewForKey:*MEMORY[0x1E4FB30D0]];
    [v6 removeFromSuperview];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v8 = *(id *)(a1 + 56);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          if (([v13 isDescendantOfView:v6] & 1) == 0) {
            objc_msgSend(v13, "px_transferToSuperview:", *(void *)(a1 + 64));
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v44 count:16];
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 72), "px_transferToSuperview:", *(void *)(a1 + 64));
    uint64_t v14 = *(void **)(a1 + 72);
    if (v14 && ([v14 isDescendantOfView:v7] & 1) == 0) {
      [*(id *)(a1 + 64) insertSubview:v7 belowSubview:*(void *)(a1 + 72)];
    }
  }
  id v20 = objc_msgSend(*(id *)(a1 + 40), "_tilingViewAnimationGroup", (void)v33);
  [v20 setPaused:0];

  [*(id *)(a1 + 40) _setTilingViewAnimationGroup:0];
  uint64_t v21 = *(void **)(a1 + 48);
  if (v3 < 0.0) {
    [v21 cancelInteractiveTransition];
  }
  else {
    [v21 finishInteractiveTransition];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v22 = [*(id *)(a1 + 80) collectionViewLayout];
    [v22 invalidateLayout];
  }
  [*(id *)(a1 + 48) completeTransition:v3 >= 0.0];
  [*(id *)(a1 + 88) transition:*(void *)(a1 + 48) didComplete:v3 >= 0.0];
  uint64_t v23 = *(void *)(a1 + 128);
  if (v23) {
    (*(void (**)(void))(v23 + 16))();
  }
  [*(id *)(a1 + 40) _setHasStarted:0];
  uint64_t v24 = 104;
  if (v3 >= 0.0) {
    uint64_t v24 = 96;
  }
  double v25 = [*(id *)(a1 + v24) tilingViewControllerTransitionTilingViewHostView:*(void *)(a1 + 40)];
  [*(id *)(a1 + 112) setAutoresizingMask:18];
  [*(id *)(a1 + 112) setTranslatesAutoresizingMaskIntoConstraints:1];
  v26 = [*(id *)(a1 + 112) superview];

  if (v26) {
    objc_msgSend(*(id *)(a1 + 112), "px_transferToSuperview:", v25);
  }
  id v27 = *(void **)(a1 + 40);
  if (v3 < 0.0) {
    [v27 _fromEndPoint];
  }
  else {
  id v28 = [v27 _toEndPoint];
  }
  [v27 _setEndPointOwningTilingView:v28];

  id v29 = [*(id *)(a1 + 32) navigationBar];
  [v29 setUserInteractionEnabled:1];

  id v30 = [*(id *)(a1 + 120) tabBar];
  [v30 setUserInteractionEnabled:1];

  [*(id *)(a1 + 32) _setUseStandardStatusBarHeight:*(unsigned __int8 *)(a1 + 136)];
  [*(id *)(a1 + 40) _setProgressSpeed:0.0];
  [*(id *)(a1 + 40) _setTransitionProgressOffset:0.0];
  [*(id *)(a1 + 40) _setBackgroundProgressOffset:0.0];
  [*(id *)(a1 + 40) _setTransitionProgressValueFilter:0];
  [*(id *)(a1 + 40) _setChromeProgressValueFilter:0];
  [*(id *)(a1 + 40) _setInteractionOptions:0];
  [*(id *)(a1 + 40) _setFromEndPoint:0];
  [*(id *)(a1 + 40) _setToEndPoint:0];
  [*(id *)(a1 + 40) _setTilingView:0];
  objc_storeWeak((id *)(*(void *)(a1 + 40) + 128), 0);
  uint64_t v31 = PLOneUpGetLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    uint64_t v42 = v32;
    _os_log_impl(&dword_1AE9F8000, v31, OS_LOG_TYPE_DEFAULT, "[animateTransition] %p completed", buf, 0xCu);
  }
}

void __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_41(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v2 = PLOneUpGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "[animateTransition] %p start transition to end point %@", buf, 0x16u);
  }

  objc_storeWeak((id *)(*(void *)(a1 + 32) + 128), *(id *)(a1 + 40));
  [*(id *)(a1 + 48) tilingViewControllerTransition:*(void *)(a1 + 56) abandonTilingView:*(void *)(a1 + 64) toEndPoint:*(void *)(a1 + 40)];
  [*(id *)(a1 + 72) transitionWillBeginAnimation:*(void *)(a1 + 56)];
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_42;
  v11[3] = &unk_1E5F2CF88;
  id v12 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 32);
  id v13 = v9;
  uint64_t v14 = v10;
  id v15 = *(id *)(a1 + 80);
  [v7 tilingViewControllerTransition:v5 adoptTilingView:v6 fromEndPoint:v8 isCancelingTransition:0 animationSetupCompletionHandler:v11];
}

void __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) transitionDidBeginAnimation:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) isTransitionPaused]
    && ([*(id *)(a1 + 48) _interactionOptions] & 8) == 0)
  {
    [v3 setPaused:1];
    [*(id *)(a1 + 48) _setTilingViewAnimationGroup:v3];
  }
  uint64_t v4 = *(void **)(a1 + 48);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "_setStartTime:");
  [*(id *)(a1 + 48) _setHasStarted:1];
  uint64_t v5 = PLOneUpGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "[animateTransition] %p started", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 56) start];
}

void __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_6(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  if ([v10 isActive])
  {
    uint64_t v5 = [v10 layoutInfo];
    uint64_t v6 = [v5 tileKind];
    int v7 = [v6 isEqual:PUTileKindBackground];

    if (v7)
    {
      uint64_t v8 = [v10 presentationLayoutInfo];
      [v8 alpha];
      if (v9 != 0.0 && v9 != 1.0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
        *a3 = 1;
      }
    }
  }
}

- (void)_getTransitionProgress:(double *)a3 backgroundProgress:(double *)a4 chromeProgress:(double *)a5
{
  double v9 = 0.0;
  if ([(PUTilingViewTransitionHelper *)self hasStarted])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v11 = v10;
    [(PUTilingViewTransitionHelper *)self _startTime];
    double v9 = v11 - v12;
    if (v9 < 0.0)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      -[PUTilingViewTransitionHelper _setStartTime:](self, "_setStartTime:");
      double v9 = 0.0;
    }
  }
  [(PUTilingViewTransitionHelper *)self _progressSpeed];
  double v14 = v13;
  double v15 = v9 * v13;
  [(PUTilingViewTransitionHelper *)self _transitionProgressOffset];
  double v17 = v15 + v16;
  [(PUTilingViewTransitionHelper *)self _backgroundProgressOffset];
  double v19 = v18;
  uint64_t v20 = [(PUTilingViewTransitionHelper *)self _transitionProgressValueFilter];
  id v33 = v20;
  if (v20)
  {
    [v20 setInputValue:v17];
    [v33 outputValue];
    double v17 = v21;
  }
  if (([(PUTilingViewTransitionHelper *)self _interactionOptions] & 4) != 0)
  {
    BOOL v27 = [(PUTilingViewTransitionHelper *)self isTransitionPaused];
    if (v14 < 0.0 || v27) {
      double v29 = 0.0;
    }
    else {
      double v29 = 1.0;
    }
  }
  else
  {
    char v22 = +[PUTilingViewSettings sharedInstance];
    [v22 transitionChromeDelay];
    double v24 = v23;

    int64_t v25 = [(PUTilingViewTransitionHelper *)self _currentOperation];
    if (v25 == 2)
    {
      double v26 = v17 / (1.0 - v24);
    }
    else
    {
      double v26 = v17;
      if (v25 == 1) {
        double v26 = (v17 + -1.0) / (1.0 - v24) + 1.0;
      }
    }
    if (v26 < 0.0) {
      double v26 = 0.0;
    }
    double v29 = fmin(v26, 1.0);
  }
  id v30 = [(PUTilingViewTransitionHelper *)self _chromeProgressValueFilter];
  uint64_t v31 = v30;
  if (v30)
  {
    [v30 setInputValue:v29];
    [v31 outputValue];
    double v29 = v32;
  }
  if (a3) {
    *a3 = v17;
  }
  if (a4) {
    *a4 = v15 + v19;
  }
  if (a5) {
    *a5 = v29;
  }
}

- (void)resumeTransition:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = PLOneUpGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134218240;
    double v14 = self;
    __int16 v15 = 1024;
    BOOL v16 = v3;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "%p resuming transition %i", (uint8_t *)&v13, 0x12u);
  }

  if ([(PUTilingViewTransitionHelper *)self isTransitionPaused])
  {
    [(PUTilingViewTransitionHelper *)self _setTransitionPaused:0];
    [(PUTilingViewTransitionHelper *)self setTransitionPausingCall:0];
    if (([(PUTilingViewTransitionHelper *)self _currentOperation] != 1) == v3) {
      [(PUTilingViewTransitionHelper *)self dismissalDuration];
    }
    else {
      [(PUTilingViewTransitionHelper *)self presentationDuration];
    }
    double v7 = v6;
    UIAnimationDragCoefficient();
    double v9 = v7 * v8;
    double v10 = -1.0;
    if (v3) {
      double v10 = 1.0;
    }
    double v11 = v10 / v9;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[PUTilingViewTransitionHelper _setStartTime:](self, "_setStartTime:");
    [(PUTilingViewTransitionHelper *)self _setProgressSpeed:v11];
    if ([(PUTilingViewTransitionHelper *)self hasStarted])
    {
      if (v3) {
        [(PUTilingViewTransitionHelper *)self _toEndPoint];
      }
      else {
      double v12 = [(PUTilingViewTransitionHelper *)self _fromEndPoint];
      }
      [(PUTilingViewTransitionHelper *)self _setEndPointOwningTilingView:v12];
    }
  }
}

- (void)updatePausedTransitionWithProgress:(double)a3 interactionProgress:(double)a4
{
  if (![(PUTilingViewTransitionHelper *)self isTransitionPaused])
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUTilingViewControllerTransition.m", 125, @"Invalid parameter not satisfying: %@", @"[self isTransitionPaused]" object file lineNumber description];
  }
  [(PUTilingViewTransitionHelper *)self _progressSpeed];
  if (v8 != 0.0)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUTilingViewControllerTransition.m", 127, @"Invalid parameter not satisfying: %@", @"[self _progressSpeed] == 0.0" object file lineNumber description];
  }
  [(PUTilingViewTransitionHelper *)self _setTransitionProgressOffset:a3];
  [(PUTilingViewTransitionHelper *)self _setBackgroundProgressOffset:a4];
}

- (void)pauseTransitionWithOptions:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(PUTilingViewTransitionHelper *)self isTransitionPaused])
  {
    [(PUTilingViewTransitionHelper *)self _setTransitionPaused:1];
    [(PUTilingViewTransitionHelper *)self _setInteractionOptions:a3];
    double v7 = [MEMORY[0x1E4F29060] callStackSymbols];
    [(PUTilingViewTransitionHelper *)self setTransitionPausingCall:v7];

    double v13 = 0.0;
    *(void *)buf = 0;
    double v12 = 0.0;
    [(PUTilingViewTransitionHelper *)self _getTransitionProgress:buf backgroundProgress:&v13 chromeProgress:&v12];
    uint64_t v5 = 0;
    if (a3)
    {
      uint64_t v5 = objc_alloc_init(PUMaximumChangeRateValueFilter);
      double v8 = +[PUTilingViewSettings sharedInstance];
      [v8 transitionDuration];
      [(PUMaximumChangeRateValueFilter *)v5 setMaximumChangeRate:1.0 / v9];

      [(PUDynamicValueFilter *)v5 setInputValue:*(double *)buf];
    }
    if ((a3 & 2) != 0)
    {
      double v6 = objc_alloc_init(PUMaximumChangeRateValueFilter);
      double v10 = +[PUTilingViewSettings sharedInstance];
      [v10 transitionDuration];
      [(PUMaximumChangeRateValueFilter *)v6 setMaximumChangeRate:1.0 / v11];

      [(PUDynamicValueFilter *)v6 setInputValue:v12];
    }
    else
    {
      double v6 = 0;
    }
    [(PUTilingViewTransitionHelper *)self _setProgressSpeed:0.0];
    [(PUTilingViewTransitionHelper *)self _setTransitionProgressOffset:*(double *)buf];
    [(PUTilingViewTransitionHelper *)self _setBackgroundProgressOffset:v13];
    [(PUTilingViewTransitionHelper *)self _setTransitionProgressValueFilter:v5];
    [(PUTilingViewTransitionHelper *)self _setChromeProgressValueFilter:v6];
    goto LABEL_10;
  }
  PXAssertGetLog();
  uint64_t v5 = (PUMaximumChangeRateValueFilter *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v5->super.super.super, OS_LOG_TYPE_FAULT))
  {
    double v6 = [(PUTilingViewTransitionHelper *)self transitionPausingCall];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = self;
    __int16 v15 = 2112;
    BOOL v16 = v6;
    _os_log_fault_impl(&dword_1AE9F8000, &v5->super.super.super, OS_LOG_TYPE_FAULT, "tiling view transition %p already paused from %@", buf, 0x16u);
LABEL_10:
  }
}

- (void)pauseTransition
{
}

- (PUTilingViewTransitionHelper)initWithPresentationDuration:(double)a3 dismissalDuration:(double)a4 endPoint:(id)a5
{
  id v9 = a5;
  if (a3 <= 0.0)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PUTilingViewControllerTransition.m", 76, @"Invalid parameter not satisfying: %@", @"presentationDuration > 0.0" object file lineNumber description];
  }
  if (a4 <= 0.0)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUTilingViewControllerTransition.m", 77, @"Invalid parameter not satisfying: %@", @"dismissalDuration > 0.0" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PUTilingViewTransitionHelper;
  double v10 = [(PUTilingViewTransitionHelper *)&v15 init];
  double v11 = v10;
  if (v10)
  {
    v10->_presentationDuration = a3;
    v10->_dismissalDuration = a4;
    objc_storeWeak((id *)&v10->_endPoint, v9);
  }

  return v11;
}

- (PUTilingViewTransitionHelper)init
{
  return [(PUTilingViewTransitionHelper *)self initWithPresentationDuration:0 dismissalDuration:0.0 endPoint:0.0];
}

+ (id)_transitionEndPointWithViewController:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 presentedViewController];
  id v6 = [v5 presentingViewController];
  if (v6 == v4)
  {
    double v7 = [v4 presentedViewController];
    uint64_t v8 = [v7 modalPresentationStyle];

    if (v8 == 3)
    {
      uint64_t v9 = [v4 presentedViewController];
LABEL_9:
      id v10 = (id)v9;
      uint64_t v11 = [a1 _transitionEndPointWithViewController:v9];
LABEL_10:
      id v12 = (id)v11;
LABEL_11:

      goto LABEL_12;
    }
  }
  else
  {
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v4 topViewController];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v4 selectedViewController];
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 style])
  {
    id v10 = v4;
    if (![v10 isCollapsed]
      || [v10 style] != 2
      || ([v10 viewControllerForColumn:1], (double v14 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      double v14 = [v10 viewControllerForColumn:2];
      if (!v14)
      {
        double v14 = [v10 viewControllerForColumn:3];
      }
    }
    id v12 = [a1 _transitionEndPointWithViewController:v14];

    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector())
  {
    id v12 = v4;
  }
  else
  {
    id v12 = [(id)PURegisteredTilingViewTransitionEndPoints objectForKey:v4];
    if (!v12)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      objc_msgSend(v4, "childViewControllers", 0);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v21;
LABEL_28:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v10);
          }
          uint64_t v11 = [a1 _transitionEndPointWithViewController:*(void *)(*((void *)&v20 + 1) + 8 * v18)];
          if (v11) {
            goto LABEL_10;
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
            if (v16) {
              goto LABEL_28;
            }
            break;
          }
        }
      }

      double v19 = PLUIGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v4;
        _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "couldn't find tiling view controller transition end point for %@", buf, 0xCu);
      }

      id v12 = 0;
    }
  }
LABEL_12:

  return v12;
}

+ (int64_t)typeOfEndPoint:(id)a3 forTransitionFromViewController:(id)a4 toViewController:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 tilingViewControllerTransitionEndPointHostViewController];
  if ((objc_msgSend(v9, "px_isDescendantOfOrPresentedByViewController:", v8) & 1) == 0)
  {
    if ((objc_msgSend(v9, "px_isDescendantOfOrPresentedByViewController:", v7) & 1) != 0
      || objc_msgSend(v7, "px_isDescendantOfOrPresentedByViewController:", v9)
      && (objc_msgSend(v8, "px_isDescendantOfOrPresentedByViewController:", v7) & 1) != 0)
    {
      int64_t v10 = 1;
      goto LABEL_10;
    }
    if (!objc_msgSend(v8, "px_isDescendantOfOrPresentedByViewController:", v9)
      || (objc_msgSend(v7, "px_isDescendantOfOrPresentedByViewController:", v8) & 1) == 0)
    {
      int64_t v10 = 0;
      goto LABEL_10;
    }
  }
  int64_t v10 = 2;
LABEL_10:

  return v10;
}

+ (id)concatenatedProgressBlockForTilingView:(id)a3 transitionOperation:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    double v13 = __Block_byref_object_copy__93283;
    double v14 = __Block_byref_object_dispose__93284;
    id v15 = &__block_literal_global_93285;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __91__PUTilingViewTransitionHelper_concatenatedProgressBlockForTilingView_transitionOperation___block_invoke_2;
    v9[3] = &unk_1E5F2D020;
    v9[5] = &v16;
    v9[6] = a4;
    v9[4] = &v10;
    [v5 enumerateAllTileControllersUsingBlock:v9];
    if (*((unsigned char *)v17 + 24)) {
      id v7 = (const void *)v11[5];
    }
    else {
      id v7 = 0;
    }
    a4 = (int64_t)_Block_copy(v7);
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v16, 8);
  }

  return (id)a4;
}

void __91__PUTilingViewTransitionHelper_concatenatedProgressBlockForTilingView_transitionOperation___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 isActive])
  {
    if (a1[6] == 1) {
      [v3 presentationProgressBlock];
    }
    else {
    id v4 = [v3 dismissalProgressBlock];
    }
    id v5 = _Block_copy(v4);

    if (v5)
    {
      id v6 = _Block_copy(*(const void **)(*(void *)(a1[4] + 8) + 40));
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __91__PUTilingViewTransitionHelper_concatenatedProgressBlockForTilingView_transitionOperation___block_invoke_3;
      v11[3] = &unk_1E5F2CFF8;
      id v12 = v6;
      id v13 = v5;
      id v7 = v6;
      id v8 = _Block_copy(v11);
      uint64_t v9 = *(void *)(a1[4] + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    }
  }
}

uint64_t __91__PUTilingViewTransitionHelper_concatenatedProgressBlockForTilingView_transitionOperation___block_invoke_3(uint64_t a1, double a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v4 = *(uint64_t (**)(__n128))(*(void *)(a1 + 40) + 16);
  v5.n128_f64[0] = a2;
  return v4(v5);
}

@end