@interface SBHModalLibraryPresenter
- (BOOL)_dismissLibraryIfNecessaryForTranslation:(double)a3 velocity:(double)a4;
- (BOOL)_isPanGestureQuantityTowardDismissalDirection:(double)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasBackgroundBlur;
- (BOOL)isLibraryContainedInForeground;
- (BOOL)isLibraryPresentationModal;
- (BOOL)isPresentingLibrary;
- (BOOL)isPresentingLibraryInMostForegroundState:(id)a3;
- (BOOL)shouldUseTranslatingAnimationBehavior;
- (MTMaterialView)backgroundView;
- (NSString)description;
- (SBHLibraryIconViewController)libraryIconViewController;
- (SBHLibraryViewController)libraryViewController;
- (SBHModalLibraryPresentationDelegate)presentationDelegate;
- (SBHModalLibraryPresenter)initWithContainerViewController:(id)a3 libraryViewController:(id)a4;
- (SBHModalLibraryPresenterContextProviding)contextProvider;
- (SBHSearchBar)searchBar;
- (SBHViewControllerTransition)transition;
- (SBIconListView)iconListView;
- (SBIconView)libraryPodIconView;
- (UIPanGestureRecognizer)dismissPanGestureRecognizer;
- (UIScrollView)podScrollView;
- (UIView)containerView;
- (UIView)libraryView;
- (UIView)sourceContainerView;
- (UIViewController)containerViewController;
- (UIViewController)overrideContainerViewController;
- (id)acquireOrderPresentationSourceContainerViewBeforeLibraryViewAssertionForReason:(id)a3;
- (id)acquireUseSnapshotAsBackgroundViewAssertionForReason:(id)a3;
- (id)animatorForTransition:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)preferredTransitionStyle;
- (void)_fireDismissCompletionsWithResult:(BOOL)a3;
- (void)_firePresentCompletionWithResult:(BOOL)a3;
- (void)_handlePanGestureRecognizerUpdated:(id)a3;
- (void)_updateBackgroundViewSnapshotted;
- (void)_updateLibraryTranslation:(double)a3 withVelocity:(double)a4 animated:(BOOL)a5;
- (void)addObserver:(id)a3;
- (void)dismissLibraryWithAnimation:(BOOL)a3 completion:(id)a4;
- (void)dismissLibraryWithTransition:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)dismissLibraryWithTransition:(unint64_t)a3 completion:(id)a4;
- (void)noteWillAnimateToEndpoint:(int64_t)a3 withAnimationDuration:(double)a4;
- (void)prepareTransition:(id)a3;
- (void)presentLibraryWithAnimation:(BOOL)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setContextProvider:(id)a3;
- (void)setOverrideContainerViewController:(id)a3;
- (void)setPreferredTransitionStyle:(unint64_t)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setShouldUseTranslatingAnimationBehavior:(BOOL)a3;
- (void)toggleLibraryPresentedInForegroundWithAnimation:(BOOL)a3 completion:(id)a4;
- (void)transitionDidProgressToEndState:(id)a3;
- (void)transitionDidReturnToBeginningState:(id)a3;
- (void)transitionWillProgressToEndState:(id)a3;
- (void)transitionWillReturnToBeginningState:(id)a3;
@end

@implementation SBHModalLibraryPresenter

- (SBHModalLibraryPresenter)initWithContainerViewController:(id)a3 libraryViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBHModalLibraryPresenter;
  v8 = [(SBHModalLibraryPresenter *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_containerViewController, v6);
    objc_storeStrong((id *)&v9->_libraryViewController, a4);
    v10 = objc_alloc_init(SBHViewControllerTransition);
    transition = v9->_transition;
    v9->_transition = v10;

    v9->_preferredTransitionStyle = 0;
    v12 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v13 = [v12 appLibrarySettings];
    librarySettings = v9->_librarySettings;
    v9->_librarySettings = (SBHAppLibrarySettings *)v13;

    v9->_targetingPresentingLibrary = 0x7FFFFFFFFFFFFFFFLL;
    [(SBHViewControllerTransition *)v9->_transition setDelegate:v9];
    v15 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v9 action:sel__handlePanGestureRecognizerUpdated_];
    [(UIPanGestureRecognizer *)v15 setAllowedScrollTypesMask:3];
    [(UIPanGestureRecognizer *)v15 _setCanPanVertically:0];
    [(UIPanGestureRecognizer *)v15 setDelegate:v9];
    v16 = [v7 view];
    [v16 addGestureRecognizer:v15];

    dismissPanGestureRecognizer = v9->_dismissPanGestureRecognizer;
    v9->_dismissPanGestureRecognizer = v15;
  }
  return v9;
}

- (UIViewController)overrideContainerViewController
{
  v3 = [(SBHModalLibraryPresenter *)self libraryViewController];
  v4 = [v3 parentViewController];

  v5 = [(SBHModalLibraryPresenter *)self containerViewController];
  if (v4 == v5) {
    id v6 = 0;
  }
  else {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

- (void)setOverrideContainerViewController:(id)a3
{
  id v24 = a3;
  id v4 = [(SBHModalLibraryPresenter *)self containerViewController];
  if (v24) {
    v5 = v24;
  }
  else {
    v5 = v4;
  }
  id v6 = v5;
  id v7 = [(SBHModalLibraryPresenter *)self libraryViewController];
  id v8 = [v7 parentViewController];
  v9 = [v7 view];
  v10 = [v6 view];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [v6 containerViewForModalLibraryPresenter:self];

    v10 = (void *)v11;
  }
  v12 = [(SBHModalLibraryPresenter *)self backgroundView];
  if (v6 == v8)
  {
    if (v6 == v4)
    {
      [v10 bringSubviewToFront:v9];
      v21 = [v10 subviews];
      uint64_t v23 = [v21 indexOfObject:v12];
      if (v23 != [v21 indexOfObject:v9] - 1) {
        [v10 insertSubview:v12 belowSubview:v9];
      }
    }
    else
    {
      [v10 sendSubviewToBack:v12];
      v21 = [v10 subviews];
      uint64_t v22 = [v21 indexOfObject:v12];
      if (v22 != [v21 indexOfObject:v9] - 1) {
        [v10 insertSubview:v9 aboveSubview:v12];
      }
    }
  }
  else
  {
    [v6 addChildViewController:v7];
    [v10 addSubview:v9];
    [v10 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    objc_msgSend(v9, "setFrame:");
    [v7 didMoveToParentViewController:v6];
    [v10 insertSubview:v12 belowSubview:v9];
    objc_msgSend(v12, "setFrame:", v14, v16, v18, v20);
    [v9 layoutIfNeeded];
  }
}

- (BOOL)isPresentingLibrary
{
  if (self->_targetingPresentingLibrary == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = [(SBHModalLibraryPresenter *)self transition];
    BOOL v3 = [v2 targetEndpoint] == 1;

    return v3;
  }
  else
  {
    int64_t targetingPresentingLibrary = self->_targetingPresentingLibrary;
    return MEMORY[0x1F410C5F8](targetingPresentingLibrary, a2);
  }
}

- (BOOL)isLibraryContainedInForeground
{
  BOOL v3 = [(SBHModalLibraryPresenter *)self contextProvider];
  id v4 = v3;
  if (v3) {
    int v5 = [v3 isDefaultContainerForegroundForPresenter:self] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }
  id v6 = [(SBHModalLibraryPresenter *)self overrideContainerViewController];

  if (v6) {
    char v7 = 1;
  }
  else {
    char v7 = v5;
  }
  char v8 = v7 ^ 1;
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8;
  }

  return v9;
}

- (void)presentLibraryWithAnimation:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  double v15 = (void (**)(id, uint64_t))a4;
  [(SBHModalLibraryPresenter *)self _fireDismissCompletionsWithResult:0];
  if (v15)
  {
    id v6 = [(SBHModalLibraryPresenter *)self transition];
    if ([v6 isTransitioning])
    {
    }
    else
    {
      BOOL v7 = [(SBHModalLibraryPresenter *)self isPresentingLibrary];

      if (v7)
      {
        v15[2](v15, 1);
        goto LABEL_9;
      }
    }
    didPresentCompletions = self->_didPresentCompletions;
    BOOL v9 = v15;
    if (!didPresentCompletions)
    {
      v10 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v11 = self->_didPresentCompletions;
      self->_didPresentCompletions = v10;

      BOOL v9 = v15;
      didPresentCompletions = self->_didPresentCompletions;
    }
    v12 = (void *)[v9 copy];
    double v13 = _Block_copy(v12);
    [(NSMutableArray *)didPresentCompletions addObject:v13];
  }
LABEL_9:
  [(SBHModalLibraryPresenter *)self setPreferredTransitionStyle:0];
  double v14 = [(SBHModalLibraryPresenter *)self transition];
  [v14 progressToEndStateWithAnimation:v4];
}

- (void)dismissLibraryWithAnimation:(BOOL)a3 completion:(id)a4
{
}

- (void)dismissLibraryWithTransition:(unint64_t)a3 completion:(id)a4
{
}

- (void)dismissLibraryWithTransition:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  double v17 = (void (**)(id, uint64_t))a5;
  [(SBHModalLibraryPresenter *)self _firePresentCompletionWithResult:0];
  if (v17)
  {
    char v8 = [(SBHModalLibraryPresenter *)self transition];
    if ([v8 isTransitioning])
    {
    }
    else
    {
      BOOL v9 = [(SBHModalLibraryPresenter *)self isPresentingLibrary];

      if (!v9)
      {
        v17[2](v17, 1);
        goto LABEL_9;
      }
    }
    didDismissCompletions = self->_didDismissCompletions;
    uint64_t v11 = v17;
    if (!didDismissCompletions)
    {
      v12 = [MEMORY[0x1E4F1CA48] array];
      double v13 = self->_didDismissCompletions;
      self->_didDismissCompletions = v12;

      uint64_t v11 = v17;
      didDismissCompletions = self->_didDismissCompletions;
    }
    double v14 = (void *)[v11 copy];
    double v15 = _Block_copy(v14);
    [(NSMutableArray *)didDismissCompletions addObject:v15];
  }
LABEL_9:
  [(SBHModalLibraryPresenter *)self setPreferredTransitionStyle:a3];
  double v16 = [(SBHModalLibraryPresenter *)self transition];
  [v16 returnToBeginningStateWithAnimation:v5];
}

- (void)toggleLibraryPresentedInForegroundWithAnimation:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(SBHModalLibraryPresenter *)self isPresentingLibrary])
  {
    if ([(SBHModalLibraryPresenter *)self isLibraryContainedInForeground])
    {
      [(SBHModalLibraryPresenter *)self dismissLibraryWithAnimation:v4 completion:v6];
      goto LABEL_6;
    }
    [(SBHModalLibraryPresenter *)self dismissLibraryWithAnimation:0 completion:0];
  }
  [(SBHModalLibraryPresenter *)self presentLibraryWithAnimation:v4 completion:v6];
LABEL_6:
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    BOOL v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)isLibraryPresentationModal
{
  return 1;
}

- (BOOL)hasBackgroundBlur
{
  return 1;
}

- (BOOL)isPresentingLibraryInMostForegroundState:(id)a3
{
  BOOL v4 = [(SBHModalLibraryPresenter *)self isPresentingLibrary];
  if (v4)
  {
    LOBYTE(v4) = [(SBHModalLibraryPresenter *)self isLibraryContainedInForeground];
  }
  return v4;
}

- (id)acquireUseSnapshotAsBackgroundViewAssertionForReason:(id)a3
{
  id v4 = a3;
  reasonsToSnapshotBackgroundView = self->_reasonsToSnapshotBackgroundView;
  if (!reasonsToSnapshotBackgroundView)
  {
    id v6 = [MEMORY[0x1E4F28BD0] set];
    BOOL v7 = self->_reasonsToSnapshotBackgroundView;
    self->_reasonsToSnapshotBackgroundView = v6;

    reasonsToSnapshotBackgroundView = self->_reasonsToSnapshotBackgroundView;
  }
  id v8 = reasonsToSnapshotBackgroundView;
  [(NSCountedSet *)v8 addObject:v4];
  objc_initWeak(&location, self);
  id v9 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  double v16 = __81__SBHModalLibraryPresenter_acquireUseSnapshotAsBackgroundViewAssertionForReason___block_invoke;
  double v17 = &unk_1E6AAFD00;
  v10 = v8;
  double v18 = v10;
  id v11 = v4;
  id v19 = v11;
  objc_copyWeak(&v20, &location);
  v12 = (void *)[v9 initWithIdentifier:@"SBHModalLibraryPresenter" forReason:v11 invalidationBlock:&v14];
  [(SBHModalLibraryPresenter *)self _updateBackgroundViewSnapshotted];
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
  return v12;
}

void __81__SBHModalLibraryPresenter_acquireUseSnapshotAsBackgroundViewAssertionForReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateBackgroundViewSnapshotted];
}

- (void)_updateBackgroundViewSnapshotted
{
  BOOL v3 = [(SBHModalLibraryPresenter *)self transition];
  BOOL v4 = ([v3 isTransitioning] & 1) == 0
    && [(SBHModalLibraryPresenter *)self isPresentingLibrary]
    && [(NSCountedSet *)self->_reasonsToSnapshotBackgroundView count] != 0;

  int v5 = [(MTMaterialView *)self->_backgroundView isContentReplacedWithSnapshot];
  if (!v4 || (v5 & 1) != 0)
  {
    if (((v4 | v5 ^ 1) & 1) == 0)
    {
      BOOL v7 = SBLogLibrary();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_INFO, "[SBHModalLibraryPresenter] Returning background to live blur", v8, 2u);
      }

      [(MTMaterialView *)self->_backgroundView setContentReplacedWithSnapshot:0];
      [(MTMaterialView *)self->_backgroundView layoutIfNeeded];
    }
  }
  else
  {
    id v6 = SBLogLibrary();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, "[SBHModalLibraryPresenter] Replacing background with snapshot", buf, 2u);
    }

    [(MTMaterialView *)self->_backgroundView setContentReplacedWithSnapshot:1];
  }
}

- (UIView)containerView
{
  v2 = [(SBHModalLibraryPresenter *)self iconListView];
  BOOL v3 = [v2 superview];

  return (UIView *)v3;
}

- (UIView)libraryView
{
  v2 = [(SBHModalLibraryPresenter *)self libraryViewController];
  BOOL v3 = [v2 view];

  return (UIView *)v3;
}

- (SBHSearchBar)searchBar
{
  v2 = [(SBHModalLibraryPresenter *)self libraryViewController];
  BOOL v3 = [v2 containerViewController];
  BOOL v4 = [v3 searchBar];

  return (SBHSearchBar *)v4;
}

- (UIScrollView)podScrollView
{
  v2 = [(SBHModalLibraryPresenter *)self libraryViewController];
  BOOL v3 = [v2 folderController];
  BOOL v4 = [v3 contentScrollView];

  return (UIScrollView *)v4;
}

- (SBIconListView)iconListView
{
  v2 = [(SBHModalLibraryPresenter *)self libraryViewController];
  BOOL v3 = [v2 folderController];
  BOOL v4 = [v3 iconListViews];
  int v5 = [v4 firstObject];

  return (SBIconListView *)v5;
}

- (UIView)sourceContainerView
{
  BOOL v3 = [(SBHModalLibraryPresenter *)self contextProvider];
  BOOL v4 = [v3 sourceContainerViewForPresenter:self];

  return (UIView *)v4;
}

- (SBIconView)libraryPodIconView
{
  BOOL v3 = [(SBHModalLibraryPresenter *)self contextProvider];
  BOOL v4 = [v3 libraryIconViewForPresenter:self];

  return (SBIconView *)v4;
}

- (SBHLibraryIconViewController)libraryIconViewController
{
  BOOL v3 = [(SBHModalLibraryPresenter *)self contextProvider];
  BOOL v4 = [v3 libraryIconViewControllerForPresenter:self];

  return (SBHLibraryIconViewController *)v4;
}

- (id)acquireOrderPresentationSourceContainerViewBeforeLibraryViewAssertionForReason:(id)a3
{
  id v4 = a3;
  int v5 = [(SBHModalLibraryPresenter *)self contextProvider];
  id v6 = [v5 acquireOrderSourceContainerViewBeforeLibraryViewAssertionForReason:v4];

  return v6;
}

- (void)noteWillAnimateToEndpoint:(int64_t)a3 withAnimationDuration:(double)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(NSTimer *)self->_criticalDismissalNotifyTimer invalidate];
    criticalDismissalNotifyTimer = self->_criticalDismissalNotifyTimer;
    self->_criticalDismissalNotifyTimer = 0;
  }
  else
  {
    [(SBHAppLibrarySettings *)self->_librarySettings criticalDismissalThresholdDurationFactor];
    double v8 = v7 * a4;
    if (BSFloatIsZero())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v9 = [(NSHashTable *)self->_observers allObjects];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v26;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v9);
            }
            double v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
            uint64_t v14 = [(SBHModalLibraryPresenter *)self libraryViewController];
            [v13 modalLibraryPresenter:self didPassCriticalDismissalPoint:v14];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v10);
      }
    }
    else
    {
      objc_initWeak(&location, self);
      uint64_t v15 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __76__SBHModalLibraryPresenter_noteWillAnimateToEndpoint_withAnimationDuration___block_invoke;
      uint64_t v22 = &unk_1E6AAFD28;
      objc_copyWeak(&v23, &location);
      double v16 = [v15 timerWithTimeInterval:0 repeats:&v19 block:v8];
      double v17 = self->_criticalDismissalNotifyTimer;
      self->_criticalDismissalNotifyTimer = v16;

      -[NSTimer setTolerance:](self->_criticalDismissalNotifyTimer, "setTolerance:", v8 * 0.15, v19, v20, v21, v22);
      double v18 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [v18 addTimer:self->_criticalDismissalNotifyTimer forMode:*MEMORY[0x1E4F1C4B0]];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
}

void __76__SBHModalLibraryPresenter_noteWillAnimateToEndpoint_withAnimationDuration___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v3 = objc_msgSend(*((id *)WeakRetained + 1), "allObjects", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          double v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
          id v9 = [v2 libraryViewController];
          [v8 modalLibraryPresenter:v2 didPassCriticalDismissalPoint:v9];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    uint64_t v10 = (void *)v2[8];
    v2[8] = 0;
  }
}

- (void)prepareTransition:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F39CF8];
  id v5 = a3;
  [v4 setFrameStallSkipRequest:1];
  [v5 setUserInfo:self];

  id v18 = [(SBHModalLibraryPresenter *)self libraryViewController];
  uint64_t v6 = [(SBHModalLibraryPresenter *)self backgroundView];
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      id v9 = @"homeScreenOverlayLibrary-iPad";
    }
    else {
      id v9 = @"homeScreenOverlay";
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F743C8];
    long long v11 = v9;
    long long v12 = SBHBundle();
    uint64_t v6 = [v10 materialViewWithRecipeNamed:v11 inBundle:v12 options:0 initialWeighting:0 scaleAdjustment:0.0];

    [v6 setAutoresizingMask:18];
    long long v13 = SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice();
    [v6 setBackdropScaleAdjustment:v13];

    [v6 setGroupNameBase:@"Modal-App-Library"];
    long long v14 = [v6 layer];
    [v14 setContentsOpaque:1];

    [(SBHModalLibraryPresenter *)self setBackgroundView:v6];
    [v18 setExternalBackgroundView:v6];
  }
  uint64_t v15 = [v18 view];
  [v15 setAutoresizingMask:18];
  uint64_t v16 = [(SBHModalLibraryPresenter *)self contextProvider];
  if ([v16 isDefaultContainerForegroundForPresenter:self])
  {
    double v17 = 0;
  }
  else
  {
    double v17 = [v16 containerViewControllerForPresentingInForeground:self];
  }
  [(SBHModalLibraryPresenter *)self setOverrideContainerViewController:v17];
  [v15 setHidden:0];
  [v6 setHidden:0];
  [v15 layoutIfNeeded];
  [v18 setContentVisibility:0];
}

- (id)animatorForTransition:(id)a3
{
  unint64_t v6 = [(SBHModalLibraryPresenter *)self preferredTransitionStyle];
  if (v6 == 2)
  {
    uint64_t v8 = SBHLibraryFadeAnimator;
LABEL_9:
    uint64_t v4 = (SBHLibraryFadeAnimator *)objc_alloc_init(v8);
    goto LABEL_12;
  }
  if (v6 == 1)
  {
    uint64_t v8 = SBHLibraryZoomAnimator;
    goto LABEL_9;
  }
  if (v6) {
    goto LABEL_12;
  }
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  if (IsReduceMotionEnabled
    || ([(SBHModalLibraryPresenter *)self libraryViewController],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        !+[SBHLibraryZoomAnimator validateWithLibrary:v3 context:self]))
  {
    uint64_t v4 = objc_alloc_init(SBHLibraryFadeAnimator);
    if (IsReduceMotionEnabled) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v4 = objc_alloc_init(SBHLibraryZoomAnimator);
  }

LABEL_12:
  return v4;
}

- (void)transitionWillProgressToEndState:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_int64_t targetingPresentingLibrary = 1;
  id v5 = [(SBHModalLibraryPresenter *)self libraryViewController];
  [(SBHModalLibraryPresenter *)self _updateLibraryTranslation:1 withVelocity:0.0 animated:0.0];
  objc_msgSend(v5, "bs_beginAppearanceTransition:animated:", 1, objc_msgSend(v4, "wantsAnimation"));
  unint64_t v6 = [(SBHModalLibraryPresenter *)self libraryView];
  objc_msgSend(v6, "bs_setHitTestingDisabled:", 0);

  uint64_t v7 = [(SBHModalLibraryPresenter *)self backgroundView];
  objc_msgSend(v7, "bs_setHitTestingDisabled:", 0);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) modalLibraryPresenter:self willPresentLibrary:v5];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  [(SBHModalLibraryPresenter *)self _updateBackgroundViewSnapshotted];
  self->_int64_t targetingPresentingLibrary = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)transitionDidProgressToEndState:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBHModalLibraryPresenter *)self libraryViewController];
  objc_msgSend(v4, "bs_endAppearanceTransition");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v9++) modalLibraryPresenter:self didPresentLibrary:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if (!self->_librarySearchPrewarmAssertion)
  {
    uint64_t v10 = [v4 acquireLibrarySearchPrewarmAssertionForReason:@"SBHModalLibraryPresenter"];
    librarySearchPrewarmAssertion = self->_librarySearchPrewarmAssertion;
    self->_librarySearchPrewarmAssertion = v10;
  }
  [(SBHModalLibraryPresenter *)self _firePresentCompletionWithResult:1];
  [(SBHModalLibraryPresenter *)self _updateBackgroundViewSnapshotted];
}

- (void)transitionWillReturnToBeginningState:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_int64_t targetingPresentingLibrary = 0;
  id v5 = [(SBHModalLibraryPresenter *)self libraryViewController];
  objc_msgSend(v5, "bs_beginAppearanceTransition:animated:", 0, objc_msgSend(v4, "wantsAnimation"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v10++) modalLibraryPresenter:self willDismissLibrary:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [(SBHModalLibraryPresenter *)self libraryView];
  [v11 endEditing:0];
  objc_msgSend(v11, "bs_setHitTestingDisabled:", 1);
  long long v12 = [(SBHModalLibraryPresenter *)self backgroundView];
  objc_msgSend(v12, "bs_setHitTestingDisabled:", 1);

  [(SBHModalLibraryPresenter *)self _updateBackgroundViewSnapshotted];
  self->_int64_t targetingPresentingLibrary = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)transitionDidReturnToBeginningState:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHModalLibraryPresenter *)self libraryViewController];
  [v4 setUserInfo:0];
  [(SBHModalLibraryPresenter *)self _updateLibraryTranslation:0 withVelocity:0.0 animated:0.0];
  uint64_t v6 = [v5 view];
  [v6 setHidden:1];

  [v5 _dismissExpandedPods:0 completion:0];
  uint64_t v7 = [(SBHModalLibraryPresenter *)self backgroundView];
  [v7 setHidden:1];

  objc_msgSend(v5, "bs_endAppearanceTransition");
  [v5 setContentVisibility:2];
  [(BSInvalidatable *)self->_librarySearchPrewarmAssertion invalidate];
  librarySearchPrewarmAssertion = self->_librarySearchPrewarmAssertion;
  self->_librarySearchPrewarmAssertion = 0;

  uint64_t v9 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:v5];
  [v9 setNeedsFocusUpdate];

  [(SBHModalLibraryPresenter *)self _updateBackgroundViewSnapshotted];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) modalLibraryPresenter:self didDismissLibrary:v5];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  [(SBHModalLibraryPresenter *)self _fireDismissCompletionsWithResult:1];
}

- (void)_fireDismissCompletionsWithResult:(BOOL)a3
{
  didDismissCompletions = self->_didDismissCompletions;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SBHModalLibraryPresenter__fireDismissCompletionsWithResult___block_invoke;
  v6[3] = &__block_descriptor_33_e22_v32__0___v__B_8Q16_B24l;
  BOOL v7 = a3;
  [(NSMutableArray *)didDismissCompletions enumerateObjectsUsingBlock:v6];
  id v5 = self->_didDismissCompletions;
  self->_didDismissCompletions = 0;
}

uint64_t __62__SBHModalLibraryPresenter__fireDismissCompletionsWithResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(unsigned __int8 *)(a1 + 32));
}

- (void)_firePresentCompletionWithResult:(BOOL)a3
{
  didPresentCompletions = self->_didPresentCompletions;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBHModalLibraryPresenter__firePresentCompletionWithResult___block_invoke;
  v6[3] = &__block_descriptor_33_e22_v32__0___v__B_8Q16_B24l;
  BOOL v7 = a3;
  [(NSMutableArray *)didPresentCompletions enumerateObjectsUsingBlock:v6];
  id v5 = self->_didPresentCompletions;
  self->_didPresentCompletions = 0;
}

uint64_t __61__SBHModalLibraryPresenter__firePresentCompletionWithResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = [(SBHModalLibraryPresenter *)self presentationDelegate];
  id v5 = v4;
  if (v4 && [v4 modalLibraryPresenterShouldAllowSwipeToDismissGesture:self])
  {
    uint64_t v6 = [(SBHModalLibraryPresenter *)self libraryViewController];
    char v7 = [v6 isPresentingFolder];

    char v8 = v7 ^ 1;
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)_handlePanGestureRecognizerUpdated:(id)a3
{
  id v24 = a3;
  uint64_t v4 = [v24 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
    id v5 = [v24 view];
    [v24 velocityInView:v5];
    double v7 = v6;

    char v8 = [v24 view];
    [v24 translationInView:v8];
    double v10 = v9;

    double v11 = 0.0;
    if (v4 == 3
      && [(SBHModalLibraryPresenter *)self _dismissLibraryIfNecessaryForTranslation:v10 velocity:v7])
    {
      uint64_t v12 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
      uint64_t v13 = [(SBHModalLibraryPresenter *)self libraryView];
      [v13 frame];
      if (v12 == 1) {
        double v11 = -v14;
      }
      else {
        double v11 = v14;
      }
    }
    long long v15 = self;
    double v16 = v11;
    double v17 = v7 * 0.0625;
    uint64_t v18 = 1;
LABEL_19:
    [(SBHModalLibraryPresenter *)v15 _updateLibraryTranslation:v18 withVelocity:v16 animated:v17];
    goto LABEL_20;
  }
  if (v4 == 2)
  {
    uint64_t v20 = [v24 view];
    [v24 translationInView:v20];
    double v22 = v21;

    if (![(SBHModalLibraryPresenter *)self _isPanGestureQuantityTowardDismissalDirection:v22])
    {
      BSUIConstrainValueWithRubberBand();
      if (v22 >= 0.0) {
        double v22 = v23;
      }
      else {
        double v22 = -v23;
      }
    }
    double v17 = 0.0;
    long long v15 = self;
    double v16 = v22;
    uint64_t v18 = 0;
    goto LABEL_19;
  }
  if (v4 == 1)
  {
    uint64_t v19 = [(SBHModalLibraryPresenter *)self libraryViewController];
    if ([v19 isPresentingSearch]) {
      [v19 dismissSearch];
    }
  }
LABEL_20:
}

- (BOOL)_isPanGestureQuantityTowardDismissalDirection:(double)a3
{
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
    return a3 < 0.0;
  }
  else {
    return a3 > 0.0;
  }
}

- (void)_updateLibraryTranslation:(double)a3 withVelocity:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  char v8 = [(SBHModalLibraryPresenter *)self libraryView];
  [v8 frame];
  if (v10 != a3 || v9 != 0.0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__SBHModalLibraryPresenter__updateLibraryTranslation_withVelocity_animated___block_invoke;
    aBlock[3] = &unk_1E6AAFD70;
    id v11 = v8;
    id v18 = v11;
    double v19 = a3;
    uint64_t v20 = 0;
    uint64_t v12 = _Block_copy(aBlock);
    uint64_t v13 = v12;
    if (v5)
    {
      [v11 frame];
      double v15 = a3 - v14;
      if (BSFloatIsZero()) {
        double v16 = 0.0;
      }
      else {
        double v16 = a4 / v15;
      }
      [MEMORY[0x1E4FB1EB0] animateWithDuration:6 delay:v13 usingSpringWithDamping:0 initialSpringVelocity:0.67 options:0.0 animations:1.0 completion:v16];
    }
    else
    {
      (*((void (**)(void *))v12 + 2))(v12);
    }
  }
}

uint64_t __76__SBHModalLibraryPresenter__updateLibraryTranslation_withVelocity_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "setFrame:", v2, v3);
}

- (BOOL)_dismissLibraryIfNecessaryForTranslation:(double)a3 velocity:(double)a4
{
  double v7 = [(SBHModalLibraryPresenter *)self libraryView];
  if (![(SBHModalLibraryPresenter *)self _isPanGestureQuantityTowardDismissalDirection:a3])
  {
    if (![(SBHModalLibraryPresenter *)self _isPanGestureQuantityTowardDismissalDirection:a4])goto LABEL_13; {
    [(SBHAppLibrarySettings *)self->_librarySettings minimumVelocityForSwipeToDismiss];
    }
LABEL_7:
    if (fabs(a4) > v13) {
      goto LABEL_11;
    }
LABEL_13:
    BOOL v18 = 0;
    goto LABEL_16;
  }
  double v8 = fabs(a3);
  [v7 frame];
  double v10 = v9;
  [(SBHAppLibrarySettings *)self->_librarySettings minimumTranslationFractionForSwipeToDismiss];
  double v12 = v10 * v11;
  if ([(SBHModalLibraryPresenter *)self _isPanGestureQuantityTowardDismissalDirection:a4])
  {
    [(SBHAppLibrarySettings *)self->_librarySettings minimumVelocityForSwipeToDismiss];
    if (v8 > v12)
    {
      BSFloatIsZero();
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if (v8 <= v12 || (BSFloatIsZero() & 1) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  double v14 = [v7 layer];
  double v15 = [v14 presentationLayer];
  double v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [v7 layer];
  }
  double v19 = v17;

  [v7 frame];
  [v19 frame];
  objc_msgSend(v7, "setFrame:");
  BOOL v18 = 1;
  [(SBHModalLibraryPresenter *)self setShouldUseTranslatingAnimationBehavior:1];
  [(SBHModalLibraryPresenter *)self dismissLibraryWithAnimation:1 completion:0];
  [(SBHModalLibraryPresenter *)self setShouldUseTranslatingAnimationBehavior:0];

LABEL_16:
  return v18;
}

- (NSString)description
{
  return (NSString *)[(SBHModalLibraryPresenter *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  double v2 = [(SBHModalLibraryPresenter *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(SBHModalLibraryPresenter *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBHModalLibraryPresenter *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__SBHModalLibraryPresenter_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AACA90;
  id v6 = v5;
  id v10 = v6;
  double v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __66__SBHModalLibraryPresenter_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isPresentingLibrary"), @"isPresentingLibrary");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isLibraryContainedInForeground"), @"isLibraryContainedInForeground");
  id v4 = *(void **)(a1 + 32);
  BOOL v5 = [*(id *)(a1 + 40) overrideContainerViewController];
  id v6 = (id)[v4 appendObject:v5 withName:@"overrideContainerViewController" skipIfNil:1];

  id v7 = *(void **)(a1 + 32);
  double v8 = [*(id *)(*(void *)(a1 + 40) + 32) allObjects];
  [v7 appendArraySection:v8 withName:@"reasonsToSnapshotBackgroundView" skipIfEmpty:1];

  double v9 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) transition];
  id v10 = (id)[v9 appendObject:v11 withName:@"transition"];
}

- (SBHModalLibraryPresenterContextProviding)contextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextProvider);
  return (SBHModalLibraryPresenterContextProviding *)WeakRetained;
}

- (void)setContextProvider:(id)a3
{
}

- (SBHModalLibraryPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (SBHModalLibraryPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (UIViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  return (UIViewController *)WeakRetained;
}

- (SBHLibraryViewController)libraryViewController
{
  return self->_libraryViewController;
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (SBHViewControllerTransition)transition
{
  return self->_transition;
}

- (unint64_t)preferredTransitionStyle
{
  return self->_preferredTransitionStyle;
}

- (void)setPreferredTransitionStyle:(unint64_t)a3
{
  self->_preferredTransitionStyle = a3;
}

- (UIPanGestureRecognizer)dismissPanGestureRecognizer
{
  return self->_dismissPanGestureRecognizer;
}

- (BOOL)shouldUseTranslatingAnimationBehavior
{
  return self->_shouldUseTranslatingAnimationBehavior;
}

- (void)setShouldUseTranslatingAnimationBehavior:(BOOL)a3
{
  self->_shouldUseTranslatingAnimationBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_libraryViewController, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_destroyWeak((id *)&self->_contextProvider);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_criticalDismissalNotifyTimer, 0);
  objc_storeStrong((id *)&self->_librarySettings, 0);
  objc_storeStrong((id *)&self->_librarySearchPrewarmAssertion, 0);
  objc_storeStrong((id *)&self->_reasonsToSnapshotBackgroundView, 0);
  objc_storeStrong((id *)&self->_didDismissCompletions, 0);
  objc_storeStrong((id *)&self->_didPresentCompletions, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end