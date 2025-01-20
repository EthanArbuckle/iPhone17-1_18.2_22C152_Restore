@interface SBSearchPresenter
- (BOOL)_canPresent;
- (BOOL)isPresenting;
- (BOOL)scrollViewBeganScrollingFromTop;
- (BOOL)usesTransitionDistanceAsStartOffset;
- (NSArray)interactionCompletions;
- (NSArray)presentables;
- (NSHashTable)observers;
- (NSString)identifier;
- (SBFFluidBehaviorSettings)searchAnimationSettings;
- (SBHHomePullToSearchSettings)pullToSearchSettings;
- (SBHSearchInteractivePresentationMetrics)interactivePresentationMetrics;
- (SBSearchPresenter)initWithSettings:(id)a3 identifier:(id)a4;
- (SBSearchPresenterDelegate)searchPresenterDelegate;
- (UIScrollView)trackingScrollView;
- (double)_rubberbandingOffsetForContentOffset:(CGPoint)a3;
- (double)_searchPresentationProgressForOffset:(double)a3;
- (double)presentationOffset;
- (double)presentationProgress;
- (double)presentationVelocity;
- (double)topOffset;
- (id)_noteWillBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4;
- (int64_t)presentationState;
- (void)_didDismissSearch;
- (void)_didPresentSearch;
- (void)_sendDidDismissSearchToDelegateAndObservers;
- (void)_sendDidDismissSearchToObserver:(id)a3;
- (void)_sendDidPresentSearchToDelegateAndObservers;
- (void)_sendDidPresentSearchToObserver:(id)a3;
- (void)_sendWillDismissSearch:(BOOL)a3 toObserver:(id)a4;
- (void)_sendWillDismissSearchToDelegateAndObservers:(BOOL)a3;
- (void)_sendWillPresentSearch:(BOOL)a3 toObserver:(id)a4;
- (void)_sendWillPresentSearchToDelegateAndObservers:(BOOL)a3;
- (void)_setUpInteractivePresentationMetrics;
- (void)_setUpSearchAnimationSettings;
- (void)_updatePresentables:(id)a3 withMode:(int64_t)a4;
- (void)_updatePresentables:(id)a3 withMode:(int64_t)a4 withCompletion:(id)a5;
- (void)_updatePresentablesWithMode:(int64_t)a3 withCompletion:(id)a4;
- (void)_willDismissSearchAnimated:(BOOL)a3;
- (void)_willPresentSearchAnimated:(BOOL)a3;
- (void)addSearchPresenterObserver:(id)a3;
- (void)dismissSearchAnimated:(BOOL)a3;
- (void)layout;
- (void)presentSearchAnimated:(BOOL)a3;
- (void)removeSearchPresenterObserver:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4;
- (void)setInteractionCompletions:(id)a3;
- (void)setInteractivePresentationMetrics:(SBHSearchInteractivePresentationMetrics)a3;
- (void)setPresentables:(id)a3;
- (void)setPresentationOffset:(double)a3;
- (void)setPresentationProgress:(double)a3;
- (void)setPresentationState:(int64_t)a3;
- (void)setPresentationVelocity:(double)a3;
- (void)setPullToSearchSettings:(id)a3;
- (void)setScrollViewBeganScrollingFromTop:(BOOL)a3;
- (void)setSearchAnimationSettings:(id)a3;
- (void)setSearchPresenterDelegate:(id)a3;
- (void)setTopOffset:(double)a3;
- (void)setTrackingScrollView:(id)a3;
- (void)setUsesTransitionDistanceAsStartOffset:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation SBSearchPresenter

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (BOOL)isPresenting
{
  return (unint64_t)(self->_presentationState - 1) < 2;
}

uint64_t __65__SBSearchPresenter__updatePresentables_withMode_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePresentables:*(void *)(a1 + 40) withMode:*(void *)(a1 + 48)];
}

uint64_t __65__SBSearchPresenter__updatePresentables_withMode_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (SBHSearchInteractivePresentationMetrics)interactivePresentationMetrics
{
  double interactiveTransitionStartOffset = self->_interactivePresentationMetrics.interactiveTransitionStartOffset;
  double interactiveTransitionDistance = self->_interactivePresentationMetrics.interactiveTransitionDistance;
  double interactiveTransitionBeganFromTopLeeway = self->_interactivePresentationMetrics.interactiveTransitionBeganFromTopLeeway;
  double interactiveActivationThreshold = self->_interactivePresentationMetrics.interactiveActivationThreshold;
  result.double interactiveActivationThreshold = interactiveActivationThreshold;
  result.double interactiveTransitionBeganFromTopLeeway = interactiveTransitionBeganFromTopLeeway;
  result.double interactiveTransitionDistance = interactiveTransitionDistance;
  result.double interactiveTransitionStartOffset = interactiveTransitionStartOffset;
  return result;
}

- (void)layout
{
}

- (void)_updatePresentablesWithMode:(int64_t)a3 withCompletion:(id)a4
{
}

- (void)_updatePresentables:(id)a3 withMode:(int64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F42FF0];
  searchAnimationSettings = self->_searchAnimationSettings;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__SBSearchPresenter__updatePresentables_withMode_withCompletion___block_invoke;
  v16[3] = &unk_1E6AF6FC0;
  v16[4] = self;
  id v17 = v8;
  int64_t v18 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__SBSearchPresenter__updatePresentables_withMode_withCompletion___block_invoke_2;
  v14[3] = &unk_1E6AFA3D8;
  id v15 = v9;
  id v12 = v9;
  id v13 = v8;
  objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", searchAnimationSettings, a4, v16, v14);
}

- (void)_updatePresentables:(id)a3 withMode:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t presentationState = self->_presentationState;
  if (presentationState)
  {
    if (presentationState == 2)
    {
      *(_OWORD *)&self->_double presentationProgress = xmmword_1D8FD11A0;
    }
    else if (presentationState == 1)
    {
      [(UIScrollView *)self->_trackingScrollView contentOffset];
      -[SBSearchPresenter _rubberbandingOffsetForContentOffset:](self, "_rubberbandingOffsetForContentOffset:");
      self->_double presentationOffset = v8;
      -[SBSearchPresenter _searchPresentationProgressForOffset:](self, "_searchPresentationProgressForOffset:");
      self->_double presentationProgress = v9;
    }
  }
  else
  {
    self->_double presentationProgress = 0.0;
    self->_double presentationOffset = 0.0;
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __50__SBSearchPresenter__updatePresentables_withMode___block_invoke;
  v26[3] = &__block_descriptor_40_e43_v24__0__SBFFluidBehaviorSettings_8___v___16l;
  v26[4] = a4;
  v10 = (void *)MEMORY[0x1D948C7A0](v26);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        char v17 = objc_opt_respondsToSelector();
        double presentationProgress = self->_presentationProgress;
        double presentationOffset = self->_presentationOffset;
        double presentationVelocity = self->_presentationVelocity;
        int64_t v21 = self->_presentationState;
        if (v17) {
          [v16 updatePresentationProgress:v21 withOffset:v10 velocity:presentationProgress presentationState:presentationOffset applyBlock:presentationVelocity];
        }
        else {
          objc_msgSend(v16, "updatePresentationProgress:withOffset:velocity:presentationState:", v21, presentationProgress, presentationOffset, presentationVelocity, (void)v22);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v13);
  }
}

- (SBSearchPresenter)initWithSettings:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBSearchPresenter;
  double v9 = [(SBSearchPresenter *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v12;

    objc_storeStrong((id *)&v9->_pullToSearchSettings, a3);
    [(SBHHomePullToSearchSettings *)v9->_pullToSearchSettings addKeyObserver:v9];
    [(SBSearchPresenter *)v9 _setUpSearchAnimationSettings];
    [(SBSearchPresenter *)v9 _setUpInteractivePresentationMetrics];
  }

  return v9;
}

- (void)presentSearchAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(SBSearchPresenter *)self _canPresent])
  {
    [(SBSearchPresenter *)self _willPresentSearchAnimated:v3];
    v5 = [(SBSearchPresenter *)self _noteWillBeginModifyingPresentationProgressForState:2 animated:v3];
    self->_int64_t presentationState = 2;
    self->_double presentationVelocity = 0.0;
    trackingScrollView = self->_trackingScrollView;
    if (trackingScrollView) {
      [(UIScrollView *)trackingScrollView _forcePanGestureToEndImmediately];
    }
    if (v3)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __43__SBSearchPresenter_presentSearchAnimated___block_invoke;
      v16[3] = &unk_1E6AF4A98;
      id v17 = v5;
      int64_t v18 = self;
      [(SBSearchPresenter *)self _updatePresentablesWithMode:3 withCompletion:v16];
    }
    else
    {
      [(SBSearchPresenter *)self _updatePresentablesWithMode:4 withCompletion:0];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
        }
        while (v9);
      }

      [(SBSearchPresenter *)self _didPresentSearch];
    }
  }
}

void *__43__SBSearchPresenter_presentSearchAnimated___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  SBHSearchInteractivePresentationMetrics result = *(void **)(a1 + 40);
  if (result[8] == 2) {
    return objc_msgSend(result, "_didPresentSearch", (void)v8);
  }
  return result;
}

- (void)dismissSearchAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int64_t presentationState = self->_presentationState;
  -[SBSearchPresenter _willDismissSearchAnimated:](self, "_willDismissSearchAnimated:");
  self->_double presentationVelocity = 0.0;
  self->_int64_t presentationState = presentationState;
  uint64_t v6 = [(SBSearchPresenter *)self _noteWillBeginModifyingPresentationProgressForState:0 animated:v3];
  self->_int64_t presentationState = 0;
  trackingScrollView = self->_trackingScrollView;
  if (trackingScrollView) {
    [(UIScrollView *)trackingScrollView _forcePanGestureToEndImmediately];
  }
  if (v3)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __43__SBSearchPresenter_dismissSearchAnimated___block_invoke;
    v17[3] = &unk_1E6AF4A98;
    id v18 = v6;
    v19 = self;
    [(SBSearchPresenter *)self _updatePresentablesWithMode:3 withCompletion:v17];
  }
  else
  {
    [(SBSearchPresenter *)self _updatePresentablesWithMode:4 withCompletion:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
      }
      while (v10);
    }

    [(SBSearchPresenter *)self _didDismissSearch];
  }
}

void *__43__SBSearchPresenter_dismissSearchAnimated___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  SBHSearchInteractivePresentationMetrics result = *(void **)(a1 + 40);
  if (!result[8]) {
    return objc_msgSend(result, "_didDismissSearch", (void)v8);
  }
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = SBLogSpotlight();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = _SBFLoggingMethodProem();
    identifier = self->_identifier;
    int v23 = 138412546;
    long long v24 = v7;
    __int16 v25 = 2112;
    v26 = identifier;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%@ identifier: %@", (uint8_t *)&v23, 0x16u);
  }
  int v9 = [(SBSearchPresenter *)self _canPresent];
  if (v9)
  {
    objc_storeStrong((id *)&self->_trackingScrollView, a3);
    long long v10 = [v5 window];
    if ((unint64_t)([v10 interfaceOrientation] - 1) > 1)
    {
    }
    else
    {
      long long v11 = +[SBReachabilityDomain rootSettings];
      [v11 homeGestureSwipeDownHeight];
      double v13 = v12;

      long long v14 = [v5 panGestureRecognizer];
      [v14 locationInView:v5];
      double v16 = v15;
      double v18 = v17;

      objc_msgSend(v5, "convertPoint:toView:", 0, v16, v18);
      double v20 = v19;
      [v10 size];
      double v22 = v21 - v13;

      if (v20 > v22)
      {
        LOBYTE(v9) = 0;
        goto LABEL_9;
      }
    }
    [v5 contentOffset];
    LOBYTE(v9) = BSFloatLessThanOrEqualToFloat();
  }
LABEL_9:
  self->_scrollViewBeganScrollingFromTop = v9;
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [a3 contentOffset];
  -[SBSearchPresenter _rubberbandingOffsetForContentOffset:](self, "_rubberbandingOffsetForContentOffset:");
  if (self->_scrollViewBeganScrollingFromTop && BSFloatGreaterThanFloat() && !self->_presentationState)
  {
    uint64_t v4 = SBLogSpotlight();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = _SBFLoggingMethodProem();
      identifier = self->_identifier;
      int v13 = 138412546;
      long long v14 = v5;
      __int16 v15 = 2112;
      double v16 = identifier;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%@ identifier: %@ starting new interactive transition", (uint8_t *)&v13, 0x16u);
    }
    self->_double presentationVelocity = 0.0;
    [(SBSearchPresenter *)self _willPresentSearchAnimated:1];
    id v7 = [(SBSearchPresenter *)self _noteWillBeginModifyingPresentationProgressForState:1 animated:1];
    long long v8 = [(SBSearchPresenter *)self interactionCompletions];
    if ([v8 count])
    {
      int v9 = SBLogSpotlight();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        long long v10 = _SBFLoggingMethodProem();
        long long v11 = self->_identifier;
        int v13 = 138412546;
        long long v14 = v10;
        __int16 v15 = 2112;
        double v16 = v11;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%@ identifier: %@ had previous interactive transition completions", (uint8_t *)&v13, 0x16u);
      }
      uint64_t v12 = [v7 arrayByAddingObjectsFromArray:v8];

      id v7 = (void *)v12;
    }
    [(SBSearchPresenter *)self setInteractionCompletions:v7];
    self->_int64_t presentationState = 1;
  }
  if (self->_presentationState == 1)
  {
    self->_double presentationVelocity = 0.0;
    [(SBSearchPresenter *)self _updatePresentablesWithMode:5 withCompletion:0];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4
{
  double y = a4.y;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  self->_scrollViewBeganScrollingFromTop = 0;
  int64_t presentationState = self->_presentationState;
  long long v8 = SBLogSpotlight();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = _SBFLoggingMethodProem();
    identifier = self->_identifier;
    *(_DWORD *)buf = 138412802;
    v40 = v9;
    __int16 v41 = 1024;
    BOOL v42 = presentationState == 1;
    __int16 v43 = 2112;
    v44 = identifier;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%@ interactive: %{BOOL}u identifier: %@", buf, 0x1Cu);
  }
  long long v11 = [(SBSearchPresenter *)self interactionCompletions];
  [(SBSearchPresenter *)self setInteractionCompletions:0];
  if (presentationState == 1)
  {
    double v12 = *MEMORY[0x1E4F43CD8];
    [v6 contentOffset];
    double v14 = v13;
    double v16 = v15;
    uint64_t v17 = [v6 panGestureRecognizer];
    [v17 velocityInView:v6];
    double v19 = v18;
    double v21 = v20;

    -[SBSearchPresenter _rubberbandingOffsetForContentOffset:](self, "_rubberbandingOffsetForContentOffset:", v14 - v12 * (v19 / 1000.0) / (1.0 - v12), v16 - v12 * (v21 / 1000.0) / (1.0 - v12));
    int v22 = BSFloatGreaterThanFloat();
    char v23 = v22;
    if (v22) {
      self->_int64_t presentationState = 2;
    }
    else {
      [(SBSearchPresenter *)self _willDismissSearchAnimated:1];
    }
    self->_double presentationVelocity = y * -1000.0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __60__SBSearchPresenter_scrollViewWillEndDragging_withVelocity___block_invoke_2;
    v34[3] = &unk_1E6AFD0F0;
    char v37 = v23;
    id v35 = v11;
    v36 = self;
    [(SBSearchPresenter *)self _updatePresentablesWithMode:3 withCompletion:v34];
    id v24 = v35;
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v24 = v11;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v31 != v27) {
            objc_enumerationMutation(v24);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v30 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v30 + 1) + 8 * i));
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v26);
    }
  }

  trackingScrollView = self->_trackingScrollView;
  self->_trackingScrollView = 0;
}

void *__60__SBSearchPresenter_scrollViewWillEndDragging_withVelocity___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  if (!*(unsigned char *)(a1 + 48)
    || (SBHSearchInteractivePresentationMetrics result = *(void **)(a1 + 40), result[8] == 2)
    && (SBHSearchInteractivePresentationMetrics result = objc_msgSend(result, "_didPresentSearch", (void)v8), !*(unsigned char *)(a1 + 48)))
  {
    SBHSearchInteractivePresentationMetrics result = *(void **)(a1 + 40);
    if (!result[8]) {
      return (void *)[result _didDismissSearch];
    }
  }
  return result;
}

- (void)addSearchPresenterObserver:(id)a3
{
}

- (void)removeSearchPresenterObserver:(id)a3
{
}

- (BOOL)usesTransitionDistanceAsStartOffset
{
  return self->_usesTransitionDistanceAsStartOffset;
}

- (void)setUsesTransitionDistanceAsStartOffset:(BOOL)a3
{
  if (self->_usesTransitionDistanceAsStartOffset != a3)
  {
    self->_usesTransitionDistanceAsStartOffset = a3;
    [(SBSearchPresenter *)self _setUpInteractivePresentationMetrics];
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  [(SBSearchPresenter *)self _setUpSearchAnimationSettings];
  [(SBSearchPresenter *)self _setUpInteractivePresentationMetrics];
}

- (BOOL)_canPresent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchPresenterDelegate);
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector()) {
      char v4 = [WeakRetained searchPresenterCanPresent:self];
    }
    else {
      char v4 = 1;
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)_setUpSearchAnimationSettings
{
  uint64_t v3 = [(SBHHomePullToSearchSettings *)self->_pullToSearchSettings pullTransitionAnimationSettings];
  searchAnimationSettings = self->_searchAnimationSettings;
  self->_searchAnimationSettings = v3;
}

- (void)_setUpInteractivePresentationMetrics
{
  [(SBHHomePullToSearchSettings *)self->_pullToSearchSettings pullTransitionDistance];
  self->_interactivePresentationMetrics.double interactiveTransitionDistance = v3;
  [(SBHHomePullToSearchSettings *)self->_pullToSearchSettings pullTransitionActivationThreshold];
  self->_interactivePresentationMetrics.double interactiveActivationThreshold = v4;
  [(SBHHomePullToSearchSettings *)self->_pullToSearchSettings pullGestureBeganFromTopLeeway];
  self->_interactivePresentationMetrics.double interactiveTransitionBeganFromTopLeeway = v5;
  if (self->_usesTransitionDistanceAsStartOffset)
  {
    [(SBHHomePullToSearchSettings *)self->_pullToSearchSettings pullTransitionRubberbandThreshold];
    self->_interactivePresentationMetrics.double interactiveTransitionStartOffset = -v6;
  }
}

- (void)_willPresentSearchAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  double v5 = SBLogSpotlight();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = _SBFLoggingMethodProem();
    identifier = self->_identifier;
    *(_DWORD *)buf = 138412802;
    __int16 v41 = v6;
    __int16 v42 = 1024;
    int v43 = v3;
    __int16 v44 = 2112;
    uint64_t v45 = identifier;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%@ animated: %{BOOL}u identifier: %@", buf, 0x1Cu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchPresenterDelegate);
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  p_presentables = &self->_presentables;
  if (self->_presentables)
  {
    long long v10 = 0;
  }
  else
  {
    long long v11 = [WeakRetained searchPresentablesForPresenter:self];
    long long v10 = (void *)[v11 copy];

    objc_storeStrong((id *)&self->_presentables, v10);
  }
  if (objc_opt_respondsToSelector())
  {
    double v12 = [WeakRetained displayConfigurationForPresenter:self];
    if (v12 && v10)
    {
      unsigned int v28 = v3;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v13 = v10;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v13);
            }
            double v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v18 setTargetDisplayConfiguration:v12];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v15);
      }

      uint64_t v3 = v28;
      p_presentables = &self->_presentables;
    }
  }
  else
  {
    double v12 = 0;
  }
  [(SBSearchPresenter *)self _sendWillPresentSearchToDelegateAndObservers:v3];
  if (![v10 count])
  {
    double v19 = [WeakRetained searchPresentablesForPresenter:self];
    double v20 = (void *)[v19 copy];

    objc_storeStrong((id *)p_presentables, v20);
    long long v10 = v20;
  }
  if (v10)
  {
    self->_topOffset = 0.0;
    if (objc_opt_respondsToSelector())
    {
      [WeakRetained searchTopOffsetForSearchPresenter:self];
      self->_topOffset = v21;
    }
    id v29 = WeakRetained;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v22 = v10;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          [v27 setTopOffset:self->_topOffset];
          [v27 setMaxPresentationOffset:self->_interactivePresentationMetrics.interactiveTransitionDistance];
          if (objc_opt_respondsToSelector()) {
            [v27 setSearchTransitionSettings:self->_pullToSearchSettings];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v24);
    }

    id WeakRetained = v29;
  }
}

- (void)_sendWillPresentSearchToDelegateAndObservers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchPresenterDelegate);
  [(SBSearchPresenter *)self _sendWillPresentSearch:v3 toObserver:WeakRetained];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(SBSearchPresenter *)self _sendWillPresentSearch:v3 toObserver:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_sendWillPresentSearch:(BOOL)a3 toObserver:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [v6 searchPresenterWillPresentSearch:self animated:v4];
  }
}

- (void)_didPresentSearch
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  long long v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  uint64_t v15 = @"SBSearchPresenter.m";
  __int16 v16 = 1024;
  int v17 = 340;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)_sendDidPresentSearchToDelegateAndObservers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchPresenterDelegate);
  [(SBSearchPresenter *)self _sendDidPresentSearchToObserver:WeakRetained];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v4 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBSearchPresenter *)self _sendDidPresentSearchToObserver:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_sendDidPresentSearchToObserver:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 searchPresenterDidPresentSearch:self];
  }
}

- (void)_willDismissSearchAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogSpotlight();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = _SBFLoggingMethodProem();
    identifier = self->_identifier;
    int v8 = 138412802;
    long long v9 = v6;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = identifier;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%@ animated: %{BOOL}u identifier: %@", (uint8_t *)&v8, 0x1Cu);
  }
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  [(SBSearchPresenter *)self _sendWillDismissSearchToDelegateAndObservers:v3];
  self->_int64_t presentationState = 0;
}

- (void)_sendWillDismissSearchToDelegateAndObservers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchPresenterDelegate);
  [(SBSearchPresenter *)self _sendWillDismissSearch:v3 toObserver:WeakRetained];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(SBSearchPresenter *)self _sendWillDismissSearch:v3 toObserver:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_sendWillDismissSearch:(BOOL)a3 toObserver:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [v6 searchPresenterWillDismissSearch:self animated:v4];
  }
}

- (void)_didDismissSearch
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogSpotlight();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = _SBFLoggingMethodProem();
    identifier = self->_identifier;
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = identifier;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%@ identifier %@", (uint8_t *)&v7, 0x16u);
  }
  presentables = self->_presentables;
  self->_presentables = 0;

  [(SBSearchPresenter *)self _sendDidDismissSearchToDelegateAndObservers];
}

- (void)_sendDidDismissSearchToDelegateAndObservers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchPresenterDelegate);
  [(SBSearchPresenter *)self _sendDidDismissSearchToObserver:WeakRetained];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v4 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBSearchPresenter *)self _sendDidDismissSearchToObserver:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_sendDidDismissSearchToObserver:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 searchPresenterDidDismissSearch:self];
  }
}

- (id)_noteWillBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  id v20 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  __int16 v18 = self;
  obuint64_t j = self->_presentables;
  uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        char v21 = 0;
        long long v13 = objc_msgSend(v12, "willBeginModifyingPresentationProgressForState:animated:needsInitialLayout:", a3, v4, &v21, v18);
        uint64_t v14 = v13;
        if (v13)
        {
          uint64_t v15 = (void *)[v13 copy];
          uint64_t v16 = (void *)MEMORY[0x1D948C7A0]();
          [v20 addObject:v16];
        }
        if (v21) {
          [v7 addObject:v12];
        }
      }
      uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  if ([v7 count]) {
    [(SBSearchPresenter *)v18 _updatePresentables:v7 withMode:2 withCompletion:0];
  }

  return v20;
}

- (double)_rubberbandingOffsetForContentOffset:(CGPoint)a3
{
  double interactiveTransitionStartOffset = self->_interactivePresentationMetrics.interactiveTransitionStartOffset;
  CGFloat v4 = -interactiveTransitionStartOffset;
  double result = -(a3.y + interactiveTransitionStartOffset);
  if (a3.y >= v4) {
    return 0.0;
  }
  return result;
}

- (double)_searchPresentationProgressForOffset:(double)a3
{
  return fmin(fmax(a3 / self->_interactivePresentationMetrics.interactiveTransitionDistance + 0.0, 0.0), 1.0);
}

uint64_t __50__SBSearchPresenter__updatePresentables_withMode___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", a2, *(void *)(a1 + 32), a3, 0);
}

- (SBSearchPresenterDelegate)searchPresenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchPresenterDelegate);
  return (SBSearchPresenterDelegate *)WeakRetained;
}

- (void)setSearchPresenterDelegate:(id)a3
{
}

- (void)setInteractivePresentationMetrics:(SBHSearchInteractivePresentationMetrics)a3
{
  self->_interactivePresentationMetrics = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (UIScrollView)trackingScrollView
{
  return self->_trackingScrollView;
}

- (void)setTrackingScrollView:(id)a3
{
}

- (SBHHomePullToSearchSettings)pullToSearchSettings
{
  return self->_pullToSearchSettings;
}

- (void)setPullToSearchSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)searchAnimationSettings
{
  return self->_searchAnimationSettings;
}

- (void)setSearchAnimationSettings:(id)a3
{
}

- (void)setPresentationState:(int64_t)a3
{
  self->_int64_t presentationState = a3;
}

- (double)presentationProgress
{
  return self->_presentationProgress;
}

- (void)setPresentationProgress:(double)a3
{
  self->_double presentationProgress = a3;
}

- (double)presentationOffset
{
  return self->_presentationOffset;
}

- (void)setPresentationOffset:(double)a3
{
  self->_double presentationOffset = a3;
}

- (double)presentationVelocity
{
  return self->_presentationVelocity;
}

- (void)setPresentationVelocity:(double)a3
{
  self->_double presentationVelocity = a3;
}

- (BOOL)scrollViewBeganScrollingFromTop
{
  return self->_scrollViewBeganScrollingFromTop;
}

- (void)setScrollViewBeganScrollingFromTop:(BOOL)a3
{
  self->_scrollViewBeganScrollingFromTop = a3;
}

- (double)topOffset
{
  return self->_topOffset;
}

- (void)setTopOffset:(double)a3
{
  self->_topOffset = a3;
}

- (NSArray)presentables
{
  return self->_presentables;
}

- (void)setPresentables:(id)a3
{
}

- (NSArray)interactionCompletions
{
  return self->_interactionCompletions;
}

- (void)setInteractionCompletions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionCompletions, 0);
  objc_storeStrong((id *)&self->_presentables, 0);
  objc_storeStrong((id *)&self->_searchAnimationSettings, 0);
  objc_storeStrong((id *)&self->_pullToSearchSettings, 0);
  objc_storeStrong((id *)&self->_trackingScrollView, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_searchPresenterDelegate);
}

@end