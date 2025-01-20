@interface UIQueuingScrollView
@end

@implementation UIQueuingScrollView

uint64_t __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _notifyDelegateDidEndManualScroll:0 toRevealView:*(void *)(a1 + 40) direction:*(void *)(a1 + 56) animated:1 didFinish:a2 didComplete:a3];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = *(void **)(a1 + 32);
  v7 = [*(id *)(a1 + 40) view];
  objc_msgSend(v6, "_notifyDelegateDidEndManualScroll:toRevealView:direction:animated:didFinish:didComplete:", 0, v7, objc_msgSend(*(id *)(a1 + 40), "transitionDirection"), 1, 0, 0);

  [*(id *)(a1 + 40) cleanupWithFinishedState:a2 completedState:a3];
  [*(id *)(a1 + 32) _cleanUpCompletionState:*(void *)(a1 + 40) didFinish:a2 didComplete:a3];
  v8 = *(void **)(a1 + 32);
  v9 = [*(id *)(a1 + 48) view];
  v10 = [*(id *)(a1 + 40) view];
  [v8 _notifyDelegateWillManuallyScroll:0 toRevealView:v9 concealingView:v10 animated:1];

  v11 = *(void **)(a1 + 32);
  v12 = [*(id *)(a1 + 48) view];
  v13 = [*(id *)(a1 + 40) view];
  objc_msgSend(v11, "_notifyDelegateDidCommitManualScroll:toRevealView:concealView:direction:animated:canComplete:", 0, v12, v13, objc_msgSend(*(id *)(a1 + 48), "transitionDirection"), 1, 0);

  v14 = *(void **)(a1 + 32);
  v15 = [*(id *)(a1 + 48) view];
  objc_msgSend(v14, "_notifyDelegateDidEndManualScroll:toRevealView:direction:animated:didFinish:didComplete:", 0, v15, objc_msgSend(*(id *)(a1 + 48), "transitionDirection"), 1, 0, 0);

  [*(id *)(a1 + 48) cleanupWithFinishedState:0 completedState:0];
  v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 56);
  v18 = [*(id *)(a1 + 48) view];
  [v16 _notifyDelegateWillManuallyScroll:0 toRevealView:v17 concealingView:v18 animated:1];

  v19 = *(void **)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 56);
  v21 = [*(id *)(a1 + 48) view];
  [v19 _notifyDelegateDidCommitManualScroll:0 toRevealView:v20 concealView:v21 direction:*(void *)(a1 + 72) animated:1 canComplete:a3];

  [*(id *)(a1 + 32) _notifyDelegateDidEndManualScroll:0 toRevealView:*(void *)(a1 + 56) direction:*(void *)(a1 + 72) animated:1 didFinish:a2 didComplete:a3];
  uint64_t v22 = *(void *)(a1 + 64);
  if (v22) {
    (*(void (**)(uint64_t, void, uint64_t))(v22 + 16))(v22, 0, a3);
  }
  v23 = *(void **)(*(void *)(a1 + 32) + 2088);
  v24 = [*(id *)(a1 + 40) view];
  uint64_t v25 = [v23 indexOfObject:v24];

  if (v25 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v26 = (void *)[*(id *)(*(void *)(a1 + 32) + 2088) mutableCopy];
    if (!*(void *)(a1 + 56))
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 32) file:@"_UIQueuingScrollView.m" lineNumber:609 description:@"view is nil"];
    }
    objc_msgSend(v26, "replaceObjectAtIndex:withObject:", v25);
    [*(id *)(a1 + 32) _replaceViews:v26 updatingContents:1 adjustContentInsets:0 animated:1];
  }
  v27 = *(void **)(*(void *)(a1 + 32) + 2088);
  v28 = [*(id *)(a1 + 48) view];
  LOBYTE(v27) = [v27 containsObject:v28];

  if ((v27 & 1) == 0)
  {
    v29 = *(void **)(a1 + 32);
    id v31 = [*(id *)(a1 + 48) view];
    [v29 _flushView:v31 animated:0];
  }
}

uint64_t __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _notifyDelegateDidEndManualScroll:0 toRevealView:*(void *)(a1 + 40) direction:*(void *)(a1 + 56) animated:1 didFinish:a2 didComplete:a3];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _notifyDelegateDidEndManualScroll:0 toRevealView:*(void *)(a1 + 40) direction:*(void *)(a1 + 56) animated:1 didFinish:a2 didComplete:a3];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __103___UIQueuingScrollView__commitGestureDrivenScrollRevealingView_concealingView_inDirection_canComplete___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _notifyDelegateDidEndManualScroll:1 toRevealView:*(void *)(a1 + 40) direction:*(void *)(a1 + 48) animated:1 didFinish:a2 didComplete:a3];
}

BOOL __54___UIQueuingScrollView__didScrollWithAnimation_force___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (a2 == 2) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
  }
  else
  {
    uint64_t v4 = -1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  v5 = [*(id *)(a1 + 32) _viewAtIndex:a2 loadingIfNecessary:1 updatingContents:0 animated:*(unsigned __int8 *)(a1 + 112)];
  if (!v5) {
    goto LABEL_54;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6 == -1)
  {
    v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("ScrollView", &_MergedGlobals_5_4) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = *(unsigned __int8 *)(a1 + 113);
      LODWORD(v50) = 67109120;
      DWORD1(v50) = v8;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "isScrollInProgress: %d", (uint8_t *)&v50, 8u);
    }
    v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25C888) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = *(unsigned __int8 *)(a1 + 112);
      LODWORD(v50) = 67109120;
      DWORD1(v50) = v10;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "animated: %d", (uint8_t *)&v50, 8u);
    }
    v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25C890) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 2080);
      LODWORD(v50) = 134217984;
      *(void *)((char *)&v50 + 4) = v12;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "orientation: %ld", (uint8_t *)&v50, 0xCu);
    }
    if (*(unsigned char *)(a1 + 112))
    {
      v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25C898) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = *(void **)(a1 + 32);
        v15 = v13;
        [v14 _animatedTargetOffset];
        v16 = NSStringFromCGPoint(v52);
        LODWORD(v50) = 138412290;
        *(void *)((char *)&v50 + 4) = v16;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "animatedTargetOffset: %@", (uint8_t *)&v50, 0xCu);
      }
      uint64_t v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25C8A0) + 8);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      v18 = *(void **)(a1 + 32);
      v19 = v17;
      [v18 _animatedOriginalOffset];
      uint64_t v20 = NSStringFromCGPoint(v53);
      LODWORD(v50) = 138412290;
      *(void *)((char *)&v50 + 4) = v20;
      v21 = "animatedOriginalOffset: %@";
    }
    else
    {
      if (![*(id *)(a1 + 32) _isBouncing]) {
        goto LABEL_25;
      }
      uint64_t v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25C8A8) + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = *(void **)(a1 + 32);
        v24 = v22;
        [v23 _pageDecelerationTarget];
        uint64_t v25 = NSStringFromCGPoint(v54);
        LODWORD(v50) = 138412290;
        *(void *)((char *)&v50 + 4) = v25;
        _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "pageDecelerationTarget: %@", (uint8_t *)&v50, 0xCu);
      }
      v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("ScrollView", &qword_1EB25C8B0) + 8);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      v27 = *(void **)(a1 + 32);
      v19 = v26;
      [v27 contentOffset];
      uint64_t v20 = NSStringFromCGPoint(v55);
      LODWORD(v50) = 138412290;
      *(void *)((char *)&v50 + 4) = v20;
      v21 = "contentOffset: %@";
    }
    _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v50, 0xCu);

LABEL_25:
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6 == -1)
    {
      v49 = [MEMORY[0x1E4F28B00] currentHandler];
      [v49 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"_UIQueuingScrollView.m" lineNumber:818 description:@"Failed to determine navigation direction for scroll"];

      uint64_t v6 = *(void *)(a1 + 48);
    }
  }
  if (v6 == 1)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != -1) {
      goto LABEL_45;
    }
  }
  else if (v6 || *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 1)
  {
    goto LABEL_45;
  }
  uint64_t v28 = *(void *)(a1 + 32);
  v29 = *(void **)(v28 + 2104);
  if (v29 == v5)
  {
    v30 = [*(id *)(v28 + 2128) lastObject];
    id v31 = [v30 view];

    if (v31 == v5) {
      goto LABEL_45;
    }
    uint64_t v28 = *(void *)(a1 + 32);
    v29 = *(void **)(v28 + 2104);
  }
  if (v29 != v5)
  {
    objc_storeStrong((id *)(v28 + 2104), v5);
    uint64_t v32 = *(void *)(a1 + 32);
    uint64_t v33 = *(unsigned __int8 *)(v32 + 2136);
    uint64_t v34 = *(void *)(v32 + 2104);
    v35 = [(id)v32 _visibleView];
    [(id)v32 _notifyDelegateWillManuallyScroll:v33 toRevealView:v34 concealingView:v35 animated:1];

    uint64_t v28 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v28 + 2136))
    {
      uint64_t v36 = *(void *)(v28 + 2104);
      v37 = [*(id *)(a1 + 32) _visibleView];
      [(id)v28 _notifyDelegateDidCommitManualScroll:0 toRevealView:v36 concealView:v37 direction:*(void *)(a1 + 48) animated:1 canComplete:1];

      uint64_t v28 = *(void *)(a1 + 32);
    }
  }
  if (*(unsigned char *)(v28 + 2136) && ([(id)v28 isTracking] & 1) == 0)
  {
    v38 = [*(id *)(*(void *)(a1 + 32) + 2128) lastObject];
    uint64_t v39 = [v38 view];
    if ((void *)v39 == v5)
    {
    }
    else
    {
      v40 = (void *)v39;
      char v41 = [*(id *)(a1 + 32) _isDeceleratingInOppositionToNavigationDirection:*(void *)(a1 + 48)];

      if (v41) {
        goto LABEL_45;
      }
      v42 = *(void **)(a1 + 32);
      uint64_t v43 = v42[263];
      v38 = [v42 _visibleView];
      [v42 _commitGestureDrivenScrollRevealingView:v43 concealingView:v38 inDirection:*(void *)(a1 + 48) canComplete:1];
    }
  }
LABEL_45:
  id v44 = (id)objc_msgSend(*(id *)(a1 + 32), "_viewAtIndex:loadingIfNecessary:updatingContents:animated:", a2, 0, 1, *(unsigned __int8 *)(a1 + 112), v50);
  if (a2)
  {
    if (a2 == 2)
    {
      uint64_t v45 = *(void *)(*(void *)(a1 + 32) + 2080);
      if (v45 == 1)
      {
        BOOL v47 = *(double *)(a1 + 72) >= *(double *)(a1 + 104) + *(double *)(a1 + 104);
        goto LABEL_55;
      }
      if (!v45 && *(double *)(a1 + 64) >= *(double *)(a1 + 96) + *(double *)(a1 + 96)) {
        goto LABEL_57;
      }
    }
  }
  else
  {
    uint64_t v46 = *(void *)(*(void *)(a1 + 32) + 2080);
    if (v46 == 1)
    {
      BOOL v47 = *(double *)(a1 + 72) <= 0.0;
      goto LABEL_55;
    }
    if (!v46 && *(double *)(a1 + 64) <= 0.0)
    {
LABEL_57:
      BOOL v47 = 1;
      goto LABEL_55;
    }
  }
LABEL_54:
  BOOL v47 = 0;
LABEL_55:

  return v47;
}

@end