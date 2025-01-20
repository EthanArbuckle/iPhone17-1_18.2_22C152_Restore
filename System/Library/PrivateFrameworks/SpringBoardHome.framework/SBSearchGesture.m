@interface SBSearchGesture
+ (double)searchHeaderHeight;
- (BOOL)_isShowingSearch;
- (BOOL)isAnimatingResetOrReveal;
- (BOOL)isDragging;
- (BOOL)isTracking;
- (BOOL)searchScrollViewShouldRecognize:(id)a3;
- (CGPoint)locationInView:(id)a3;
- (NSString)description;
- (SBHSearchPresenting)searchPresenter;
- (SBSearchGesture)init;
- (SBSearchGesture)initWithSearchPresenter:(id)a3;
- (SBSearchGestureDelegate)delegate;
- (UIView)targetView;
- (double)_maxGestureOffset;
- (double)_progressThreshold;
- (double)_startingGestureOffset;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_notifyThaWeStartedShowingOrHiding;
- (void)_notifyThatGestureEndedWithShowingIfNeeded:(BOOL)a3;
- (void)_updateForFinalContentOffset;
- (void)_updateForScrollingEnded;
- (void)_updateScrollingEnabled;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)requireGestureRecognizerToFail:(id)a3;
- (void)resetAnimated:(BOOL)a3;
- (void)revealAnimated:(BOOL)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setSearchPresenter:(id)a3;
- (void)setTargetView:(id)a3;
- (void)updateForRotation;
@end

@implementation SBSearchGesture

- (void)updateForRotation
{
  self->_suppressObserverCallbacks = 1;
  [(SBSearchScrollView *)self->_scrollView contentOffset];
  double v4 = v3;
  double v6 = v5;
  v7 = [(SBSearchScrollView *)self->_scrollView superview];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  [(SBSearchGesture *)self _startingGestureOffset];
  double v17 = v15 + v16;
  -[SBSearchScrollView setFrame:](self->_scrollView, "setFrame:", v9, v11, v13, v15);
  -[SBSearchScrollView setContentSize:](self->_scrollView, "setContentSize:", v13, v17);
  -[SBSearchScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v4, v6);
  self->_suppressObserverCallbacks = self->_searchPresenter != 0;
}

- (double)_startingGestureOffset
{
  searchPresenter = self->_searchPresenter;
  if (searchPresenter)
  {
    [(SBHSearchPresenting *)searchPresenter interactivePresentationMetrics];
    return -v4;
  }
  else
  {
    [(SBSearchGesture *)self _maxGestureOffset];
  }
  return result;
}

- (void)setDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    disabledReasons = self->_disabledReasons;
    id v10 = v6;
    if (v4)
    {
      if (!disabledReasons)
      {
        double v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        double v9 = self->_disabledReasons;
        self->_disabledReasons = v8;

        id v6 = v10;
        disabledReasons = self->_disabledReasons;
      }
      [(NSMutableSet *)disabledReasons addObject:v6];
    }
    else
    {
      [(NSMutableSet *)disabledReasons removeObject:v6];
    }
    [(SBSearchGesture *)self _updateScrollingEnabled];
    id v6 = v10;
  }
}

- (void)_updateScrollingEnabled
{
  BOOL v3 = [(NSMutableSet *)self->_disabledReasons count] == 0;
  scrollView = self->_scrollView;
  [(SBSearchScrollView *)scrollView setScrollEnabled:v3];
}

+ (double)searchHeaderHeight
{
  return 94.0;
}

- (SBSearchGesture)init
{
  return [(SBSearchGesture *)self initWithSearchPresenter:0];
}

- (SBSearchGesture)initWithSearchPresenter:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSearchGesture;
  id v6 = [(SBSearchGesture *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchPresenter, a3);
    v7->_suppressObserverCallbacks = v5 != 0;
    double v8 = [SBSearchScrollView alloc];
    uint64_t v9 = -[SBSearchScrollView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    scrollView = v7->_scrollView;
    v7->_scrollView = (SBSearchScrollView *)v9;

    [(SBSearchScrollView *)v7->_scrollView setBounces:1];
    [(SBSearchScrollView *)v7->_scrollView setAlwaysBounceVertical:v5 != 0];
    [(SBSearchScrollView *)v7->_scrollView setDelegate:v7];
    [(SBSearchScrollView *)v7->_scrollView setShowsVerticalScrollIndicator:0];
    [(SBSearchScrollView *)v7->_scrollView setHidden:1];
    [(SBSearchScrollView *)v7->_scrollView setScrollsToTop:0];
    double v11 = v7->_scrollView;
    [(SBSearchGesture *)v7 _startingGestureOffset];
    -[SBSearchScrollView setContentOffset:](v11, "setContentOffset:", 0.0, v12);
    [(SBSearchScrollView *)v7->_scrollView setContentInsetAdjustmentBehavior:2];
    double v13 = [(SBSearchScrollView *)v7->_scrollView panGestureRecognizer];
    [v13 _setHysteresis:18.5];

    [(SBSearchScrollView *)v7->_scrollView setSearchDelegate:v7];
    uint64_t v14 = [(SBSearchScrollView *)v7->_scrollView panGestureRecognizer];
    panGestureRecognizer = v7->_panGestureRecognizer;
    v7->_panGestureRecognizer = (UIPanGestureRecognizer *)v14;

    v7->_lastOffset = 0.0;
  }

  return v7;
}

- (void)setTargetView:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_targetView != v5)
  {
    self->_suppressObserverCallbacks = 1;
    double v13 = v5;
    id v6 = [(SBSearchScrollView *)self->_scrollView panGestureRecognizer];
    panGestureRecognizer = self->_panGestureRecognizer;
    self->_panGestureRecognizer = v6;
    double v8 = v6;

    [(UIView *)self->_targetView removeGestureRecognizer:v8];
    objc_storeStrong((id *)&self->_targetView, a3);
    [(SBSearchScrollView *)self->_scrollView contentOffset];
    double v10 = v9;
    double v12 = v11;
    [(SBSearchScrollView *)self->_scrollView removeFromSuperview];
    [(UIView *)self->_targetView addSubview:self->_scrollView];
    -[SBSearchScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v10, v12);
    [(SBSearchGesture *)self updateForRotation];
    [(UIView *)self->_targetView addGestureRecognizer:v8];

    id v5 = v13;
    self->_suppressObserverCallbacks = self->_searchPresenter != 0;
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)revealAnimated:(BOOL)a3
{
  if (!self->_searchPresenter)
  {
    BOOL v3 = a3;
    if (!self->_animatingResetOrReveal || !a3)
    {
      [(SBSearchScrollView *)self->_scrollView contentOffset];
      if (v6 != 0.0 || v5 != 0.0)
      {
        [(SBSearchGesture *)self setDisabled:1 forReason:@"revealAnimated"];
        self->_animatingResetOrReveal = v3;
        [(SBSearchGesture *)self _notifyThaWeStartedShowingOrHiding];
        -[SBSearchScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", v3, 0.0, 0.0);
        if (!v3)
        {
          [(SBSearchGesture *)self _updateForFinalContentOffset];
        }
      }
    }
  }
}

- (void)resetAnimated:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_searchPresenter)
  {
    BOOL v3 = a3;
    self->_isDismissing = 1;
    if (!self->_suppressObserverCallbacks)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      double v5 = (void *)[(NSHashTable *)self->_observers copy];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(v5);
            }
            double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v10 searchGesture:self resetAnimated:v3];
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v7);
      }
    }
    if (!self->_animatingResetOrReveal || !v3)
    {
      [(SBSearchGesture *)self _maxGestureOffset];
      double v12 = v11;
      [(SBSearchScrollView *)self->_scrollView contentOffset];
      if (v14 == 0.0 && v12 == v13)
      {
        self->_isDismissing = 0;
      }
      else
      {
        self->_animatingResetOrReveal = v3;
        -[SBSearchScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", v3, 0.0, v12);
        if (!v3) {
          [(SBSearchGesture *)self _updateForScrollingEnded];
        }
      }
    }
  }
}

- (CGPoint)locationInView:(id)a3
{
  scrollView = self->_scrollView;
  id v4 = a3;
  double v5 = [(SBSearchScrollView *)scrollView panGestureRecognizer];
  [v5 locationInView:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)_notifyThaWeStartedShowingOrHiding
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_suppressObserverCallbacks)
  {
    BOOL v3 = [(SBSearchGesture *)self _isShowingSearch];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      BOOL v7 = !v3;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v4);
          }
          double v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v10 searchGesture:self startedShowing:v7];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)_notifyThatGestureEndedWithShowingIfNeeded:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_isDraggingAccordingToScrollView)
  {
    self->_isDraggingAccordingToScrollView = 0;
    if (!self->_suppressObserverCallbacks)
    {
      BOOL v4 = a3;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      uint64_t v5 = (void *)[(NSHashTable *)self->_observers copy];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            double v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v10 searchGesture:self endedGesture:v4];
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)_updateForScrollingEnded
{
  if (!self->_ignoreScrollingEnded)
  {
    self->_ignoreScrollingEnded = 1;
    if (self->_searchPresenter)
    {
      scrollView = self->_scrollView;
      [(SBSearchGesture *)self _startingGestureOffset];
      -[SBSearchScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 0, 0.0, v4);
      self->_ignoreScrollingEnded = 0;
    }
    else
    {
      if (self->_isDismissing)
      {
        uint64_t v5 = [(SBSearchScrollView *)self->_scrollView panGestureRecognizer];
        [v5 setEnabled:0];

        uint64_t v6 = [(SBSearchScrollView *)self->_scrollView panGestureRecognizer];
        [v6 setEnabled:1];

        uint64_t v7 = self->_scrollView;
        [(SBSearchGesture *)self _maxGestureOffset];
        -[SBSearchScrollView setContentOffset:animated:](v7, "setContentOffset:animated:", 0, 0.0, v8);
      }
      [(SBSearchScrollView *)self->_scrollView contentOffset];
      double v10 = v9;
      [(SBSearchGesture *)self _maxGestureOffset];
      if (v10 != 0.0 && v10 != v11)
      {
        double v13 = v11;
        long long v14 = self->_scrollView;
        [(SBSearchGesture *)self _progressThreshold];
        if (v10 / v13 >= v15) {
          double v16 = v13;
        }
        else {
          double v16 = 0.0;
        }
        -[SBSearchScrollView setContentOffset:animated:](v14, "setContentOffset:animated:", 1, 0.0, v16);
      }
      *(_WORD *)&self->_isDismissing = 0;
      if (v10 == 0.0 || ([(SBSearchGesture *)self _maxGestureOffset], v10 == v17)) {
        [(SBSearchGesture *)self _updateForFinalContentOffset];
      }
      BOOL v18 = [(SBSearchGesture *)self isShowingSearch];
      [(SBSearchGesture *)self _notifyThatGestureEndedWithShowingIfNeeded:v18];
    }
  }
}

- (void)_updateForFinalContentOffset
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(SBSearchGesture *)self setDisabled:0 forReason:@"revealAnimated"];
  self->_animatingResetOrReveal = 0;
  BOOL v3 = [(SBSearchGesture *)self _isShowingSearch];
  if (!self->_suppressObserverCallbacks)
  {
    BOOL v4 = v3;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v10 searchGesture:self completedShowing:v4];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)_isShowingSearch
{
  if (self->_isDismissing) {
    return 0;
  }
  [(SBSearchScrollView *)self->_scrollView contentOffset];
  return fabs(v3) < 2.22044605e-16;
}

- (BOOL)isTracking
{
  return [(SBSearchScrollView *)self->_scrollView isTracking];
}

- (BOOL)isDragging
{
  BOOL v3 = [(SBSearchGesture *)self isTracking];
  if (v3) {
    LOBYTE(v3) = self->_isDraggingAccordingToScrollView;
  }
  return v3;
}

- (double)_maxGestureOffset
{
  searchPresenter = self->_searchPresenter;
  if (!searchPresenter) {
    return 94.0;
  }
  [(SBHSearchPresenting *)searchPresenter interactivePresentationMetrics];
  return v3;
}

- (double)_progressThreshold
{
  searchPresenter = self->_searchPresenter;
  if (!searchPresenter) {
    return 0.5;
  }
  [(SBHSearchPresenting *)searchPresenter interactivePresentationMetrics];
  return v3;
}

- (NSString)description
{
  return (NSString *)[(SBSearchGesture *)self descriptionWithMultilinePrefix:@"\t"];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_isDraggingAccordingToScrollView = 1;
  scrollView = self->_scrollView;
  id v5 = a3;
  [(SBSearchScrollView *)scrollView setBounces:1];
  [(SBSearchGesture *)self _notifyThaWeStartedShowingOrHiding];
  [(SBHSearchPresenting *)self->_searchPresenter scrollViewWillBeginDragging:v5];
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SBSearchScrollView *)self->_scrollView contentOffset];
  double v6 = v5;
  if ((SBFFloatEqualsFloat() & 1) == 0)
  {
    [(SBHSearchPresenting *)self->_searchPresenter scrollViewDidScroll:v4];
    [(SBSearchGesture *)self _startingGestureOffset];
    double v8 = v7;
    [(SBSearchGesture *)self _maxGestureOffset];
    if (!self->_suppressObserverCallbacks)
    {
      double v10 = v9;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v11 = (void *)[(NSHashTable *)self->_observers copy];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v18;
        double v15 = (v8 - v6) / v10;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(*((void *)&v17 + 1) + 8 * i) searchGesture:self changedPercentComplete:v15];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v13);
      }
    }
    self->_lastOffset = v6;
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v19 = v9;
  if (self->_searchPresenter)
  {
    [v9 contentOffset];
    a5->double x = v10;
    a5->double y = v11;
    -[SBHSearchPresenting scrollViewWillEndDragging:withVelocity:](self->_searchPresenter, "scrollViewWillEndDragging:withVelocity:", v19, x, y);
  }
  else
  {
    double v12 = a5->y;
    [(SBSearchGesture *)self _maxGestureOffset];
    double v14 = v13;
    [(SBSearchGesture *)self _progressThreshold];
    BOOL v16 = v12 / v14 < v15;
    double v17 = 0.0;
    if (!v16) {
      double v17 = v14;
    }
    a5->double y = v17;
    BOOL v18 = fabs(v17) < 2.22044605e-16;
    [(SBSearchScrollView *)self->_scrollView setBounces:v18];
    [(SBSearchGesture *)self _notifyThatGestureEndedWithShowingIfNeeded:v18];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(SBSearchGesture *)self _updateForScrollingEnded];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (([(SBSearchScrollView *)self->_scrollView isTracking] & 1) == 0
    && !self->_animatingResetOrReveal)
  {
    [(SBSearchGesture *)self _updateForScrollingEnded];
  }
}

- (void)requireGestureRecognizerToFail:(id)a3
{
}

- (BOOL)searchScrollViewShouldRecognize:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v5 = WeakRetained;
  if (WeakRetained) {
    char v6 = [WeakRetained searchGestureShouldRecognize:self];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(SBSearchGesture *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendBool:self->_isDismissing withName:@"isDismissing"];
  id v6 = (id)[v4 appendBool:self->_animatingResetOrReveal withName:@"animatingResetOrReveal"];
  id v7 = (id)[v4 appendFloat:@"lastOffset" withName:self->_lastOffset];
  id v8 = (id)[v4 appendObject:self->_disabledReasons withName:@"disabledReasons" skipIfNil:1];
  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBSearchGesture *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (SBHSearchPresenting)searchPresenter
{
  return self->_searchPresenter;
}

- (void)setSearchPresenter:(id)a3
{
}

- (SBSearchGestureDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSearchGestureDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)targetView
{
  return self->_targetView;
}

- (BOOL)isAnimatingResetOrReveal
{
  return self->_animatingResetOrReveal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_storeStrong((id *)&self->_disabledReasons, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end