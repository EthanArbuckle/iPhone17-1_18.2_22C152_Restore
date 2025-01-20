@interface SAUILayoutSpecifyingElementViewController
+ (void)initialize;
- (BOOL)_axCollapseIfExpandedByUserInteraction;
- (BOOL)_canShowWhileLocked;
- (BOOL)_expandToCustomLayoutModeFromUserActionIfPossible;
- (BOOL)_isNotInCustomLayoutOrTransitionFromCustomLayout;
- (BOOL)_isObstructedBySensorRegion;
- (BOOL)handleLongPress:(id)a3;
- (BOOL)handleTap:(id)a3;
- (BOOL)isInteractiveDismissalEnabled;
- (BOOL)isInteractiveDismissalEnabledForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (BOOL)isMinimalPresentationPossible;
- (BOOL)isMinimalPresentationPossibleForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (BOOL)isRequestingMenuPresentation;
- (BOOL)isTrackingTransition;
- (BOOL)isTrackingTransitionWithReason:(id)a3;
- (CGSize)_obstructedRegionSize;
- (NSArray)temporallyOrderedAlertingActivityAssertions;
- (NSDirectionalEdgeInsets)edgeOutsetsForSize:(CGSize)a3;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7;
- (NSString)description;
- (SAAutomaticallyInvalidatable)alertAssertion;
- (SAAutomaticallyInvalidatable)alertingActivityAssertion;
- (SAElementViewProviding)elementViewProvider;
- (SAUILayoutHosting)layoutHost;
- (SAUILayoutModePreferring)layoutModePreference;
- (SAUILayoutSpecifyingElementViewController)initWithElementViewProvider:(id)a3;
- (SAUIPreferredLayoutModeAssertion)preferredLayoutModeAssertion;
- (UIView)_containerView;
- (UIView)_contentView;
- (double)_defaultAlertingDuration;
- (double)concentricPaddingForProvidedView:(id)a3 fromViewProvider:(id)a4;
- (double)sensorObscuringShadowProgress;
- (id)_alertingActivityAssertionWithReason:(id)a3 implicitlyDismissable:(BOOL)a4 withPreferredLayoutMode:(int64_t)a5;
- (id)_elementHost;
- (id)_overrideWithPreference:(id)a3;
- (id)_updatePreferredLayoutModeAssertionWithPreference:(id)a3;
- (id)alertWithReason:(id)a3 implicitlyDismissable:(BOOL)a4;
- (id)layoutModePreferenceForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (id)preferredLayoutModeAssertionForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (id)systemManagedAlertingActivityAssertionWithReason:(id)a3;
- (id)systemManagedAlertingActivityAssertionWithReason:(id)a3 preferredLayoutMode:(int64_t)a4;
- (int64_t)_previousLayoutMode;
- (int64_t)behaviorOverridingRole;
- (int64_t)handleElementLongPress:(id)a3;
- (int64_t)handleElementTap:(id)a3;
- (int64_t)layoutMode;
- (int64_t)layoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (int64_t)maximumSupportedLayoutMode;
- (int64_t)maximumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (int64_t)minimumSupportedLayoutMode;
- (int64_t)minimumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (int64_t)preferredLayoutMode;
- (void)_axRequestDiminishment;
- (void)_configureAlertAssertionIfNecessary;
- (void)_configureTransitionShadowViewIfNecessary;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)_insertSnapshotView:(id)a3;
- (void)_invalidateElementPromotionPreferences;
- (void)_invalidatePreferredLayoutModeAssertionWithReason:(int64_t)a3;
- (void)_layoutTransitionShadowView;
- (void)_setBlurProgress:(double)a3 forView:(id)a4;
- (void)_setPreviousLayoutMode:(int64_t)a3;
- (void)addElementViewControllingObserver:(id)a3;
- (void)beginTrackingTransitionWithUniqueIdentifier:(id)a3 reason:(id)a4;
- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5;
- (void)elementRequestsNegativeResponse:(id)a3;
- (void)elementRequestsSignificantUpdateTransition:(id)a3;
- (void)endTrackingTransitionWithUniqueIdentifier:(id)a3;
- (void)menuPresentationRequestDidChangeForLayoutSpecifier:(id)a3;
- (void)preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:(id)a3;
- (void)preferredLayoutModeDidInvalidateForLayoutSpecifier:(id)a3;
- (void)preferredPromotionDidInvalidateForLayoutSpecifier:(id)a3;
- (void)removeElementViewControllingObserver:(id)a3;
- (void)setLayoutHost:(id)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5;
- (void)setPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4;
- (void)setPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5;
- (void)setSensorObscuringShadowProgress:(double)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SAUILayoutSpecifyingElementViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    SAUIRegisterSystemApertureLogging();
  }
}

- (NSString)description
{
  v14 = NSString;
  uint64_t v3 = objc_opt_class();
  int v4 = [(SAUILayoutSpecifyingElementViewController *)self isViewLoaded];
  if (v4)
  {
    v5 = [(SAUILayoutSpecifyingElementViewController *)self view];
  }
  else
  {
    v5 = @"[view not loaded]";
  }
  v6 = SAUIStringFromElementViewLayoutMode([(SAUILayoutSpecifyingElementViewController *)self layoutMode]);
  v7 = SAUIStringFromElementViewLayoutMode([(SAUILayoutSpecifyingElementViewController *)self preferredLayoutMode]);
  v8 = [(SAUILayoutSpecifyingElementViewController *)self elementViewProvider];
  v9 = [(SAUILayoutSpecifyingElementViewController *)self elementViewProvider];
  v10 = [v9 element];
  v11 = MEMORY[0x2611E1490]();
  objc_msgSend(v14, "stringWithFormat:", @"<%@: %p; view: %@; layoutMode: %@; preferredLayoutMode: %@; elementViewProvider: %@; element: %@>",
    v3,
    self,
    v5,
    v6,
    v7,
    v8,
  v12 = v11);

  if (v4) {
  return (NSString *)v12;
  }
}

- (SAUILayoutSpecifyingElementViewController)initWithElementViewProvider:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SAUILayoutSpecifyingElementViewController.m", 75, @"Invalid parameter not satisfying: %@", @"elementViewProvider" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  v7 = [(SAUILayoutSpecifyingElementViewController *)&v16 initWithNibName:0 bundle:0];
  v8 = v7;
  if (v7)
  {
    p_elementViewProvider = (id *)&v7->_elementViewProvider;
    objc_storeStrong((id *)&v7->_elementViewProvider, a3);
    if (objc_opt_respondsToSelector()) {
      [*p_elementViewProvider setLayoutHost:v8];
    }
    v10 = [*p_elementViewProvider element];
    if (objc_opt_respondsToSelector()) {
      [v10 setElementHost:v8];
    }
    v11 = [*p_elementViewProvider systemApertureLayoutSpecifyingOverrider];
    [v11 addBehaviorOverridingParticipant:v8];

    uint64_t v12 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v12;
  }
  return v8;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  [(SAUILayoutSpecifyingElementViewController *)&v6 viewDidLoad];
  [(SAUILayoutSpecifyingElementViewController *)self setOverrideUserInterfaceStyle:2];
  uint64_t v3 = [(SAUILayoutSpecifyingElementViewController *)self view];
  int v4 = [v3 layer];
  [v4 setHitTestsAsOpaque:1];

  v5 = [(SAUILayoutSpecifyingElementViewController *)self _containerView];
  if (v5) {
    [v3 addSubview:v5];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  [(SAUILayoutSpecifyingElementViewController *)&v5 viewWillAppear:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__SAUILayoutSpecifyingElementViewController_viewWillAppear___block_invoke;
  v4[3] = &unk_26552BBA0;
  v4[4] = self;
  [(SAUILayoutSpecifyingElementViewController *)self _enumerateObserversRespondingToSelector:sel_elementViewControllingWillAppear_ usingBlock:v4];
}

uint64_t __60__SAUILayoutSpecifyingElementViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 elementViewControllingWillAppear:*(void *)(a1 + 32)];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  [(SAUILayoutSpecifyingElementViewController *)&v5 viewDidAppear:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__SAUILayoutSpecifyingElementViewController_viewDidAppear___block_invoke;
  v4[3] = &unk_26552BBA0;
  v4[4] = self;
  [(SAUILayoutSpecifyingElementViewController *)self _enumerateObserversRespondingToSelector:sel_elementViewControllingDidAppear_ usingBlock:v4];
}

uint64_t __59__SAUILayoutSpecifyingElementViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 elementViewControllingDidAppear:*(void *)(a1 + 32)];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  [(SAUILayoutSpecifyingElementViewController *)&v5 viewWillDisappear:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__SAUILayoutSpecifyingElementViewController_viewWillDisappear___block_invoke;
  v4[3] = &unk_26552BBA0;
  v4[4] = self;
  [(SAUILayoutSpecifyingElementViewController *)self _enumerateObserversRespondingToSelector:sel_elementViewControllingWillDisappear_ usingBlock:v4];
}

uint64_t __63__SAUILayoutSpecifyingElementViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 elementViewControllingWillDisappear:*(void *)(a1 + 32)];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  [(SAUILayoutSpecifyingElementViewController *)&v5 viewDidDisappear:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__SAUILayoutSpecifyingElementViewController_viewDidDisappear___block_invoke;
  v4[3] = &unk_26552BBA0;
  v4[4] = self;
  [(SAUILayoutSpecifyingElementViewController *)self _enumerateObserversRespondingToSelector:sel_elementViewControllingDidDisappear_ usingBlock:v4];
}

uint64_t __62__SAUILayoutSpecifyingElementViewController_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 elementViewControllingDidDisappear:*(void *)(a1 + 32)];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  [(SAUILayoutSpecifyingElementViewController *)&v5 viewWillLayoutSubviews];
  if (objc_opt_respondsToSelector())
  {
    elementViewProvider = self->_elementViewProvider;
    int v4 = [(SAUILayoutSpecifyingElementViewController *)self _contentView];
    [(SAElementViewProviding *)elementViewProvider layoutHostContainerViewWillLayoutSubviews:v4];
  }
  [(SAUILayoutSpecifyingElementViewController *)self _configureTransitionShadowViewIfNecessary];
  [(SAUILayoutSpecifyingElementViewController *)self _layoutTransitionShadowView];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  [(SAUILayoutSpecifyingElementViewController *)&v5 viewDidLayoutSubviews];
  if (objc_opt_respondsToSelector())
  {
    elementViewProvider = self->_elementViewProvider;
    int v4 = [(SAUILayoutSpecifyingElementViewController *)self _contentView];
    [(SAElementViewProviding *)elementViewProvider layoutHostContainerViewDidLayoutSubviews:v4];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (objc_opt_respondsToSelector())
  {
    elementViewProvider = self->_elementViewProvider;
    v9 = [(SAUILayoutSpecifyingElementViewController *)self _contentView];
    -[SAElementViewProviding contentProviderWillTransitionToSize:inContainerView:transitionCoordinator:](elementViewProvider, "contentProviderWillTransitionToSize:inContainerView:transitionCoordinator:", v9, v7, width, height);
  }
  previousLayoutMode = (void *)self->_previousLayoutMode;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __96__SAUILayoutSpecifyingElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_26552BBC8;
  objc_copyWeak(v12, &location);
  v12[1] = previousLayoutMode;
  [v7 animateAlongsideTransition:0 completion:v11];
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __96__SAUILayoutSpecifyingElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = WeakRetained;
  if (v3 == [WeakRetained _previousLayoutMode]) {
    objc_msgSend(v4, "_setPreviousLayoutMode:", objc_msgSend(v4, "layoutMode"));
  }
}

- (BOOL)_canShowWhileLocked
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  elementViewProvider = self->_elementViewProvider;
  return [(SAElementViewProviding *)elementViewProvider _canShowWhileLocked];
}

- (id)alertWithReason:(id)a3 implicitlyDismissable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SAElementViewProviding *)self->_elementViewProvider element];
  int v8 = SAHasActivityBehavior();

  if (v8)
  {
    v9 = self;
    objc_sync_enter(v9);
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_alertingActivityAssertion);
    uint64_t v11 = objc_opt_class();
    id v12 = WeakRetained;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
    id v14 = v13;

    if (!v14)
    {
      id v14 = [(SAUILayoutSpecifyingElementViewController *)v9 _alertingActivityAssertionWithReason:v6 implicitlyDismissable:v4 withPreferredLayoutMode:[(SAUILayoutSpecifyingElementViewController *)v9 maximumSupportedLayoutMode]];
      objc_initWeak(&location, v9);
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      v18 = __83__SAUILayoutSpecifyingElementViewController_alertWithReason_implicitlyDismissable___block_invoke;
      v19 = &unk_26552BBF0;
      objc_copyWeak(&v20, &location);
      [v14 addInvalidationBlock:&v16];
      objc_storeWeak((id *)&v9->_alertingActivityAssertion, v14);
      -[SAUILayoutSpecifyingElementViewController _invalidatePreferredLayoutModeAssertionWithReason:](v9, "_invalidatePreferredLayoutModeAssertionWithReason:", 2, v16, v17, v18, v19);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v9);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __83__SAUILayoutSpecifyingElementViewController_alertWithReason_implicitlyDismissable___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 132);

    if (v5 == v6)
    {
      objc_storeWeak(v4 + 132, 0);
      [v4 _invalidateElementPromotionPreferences];
    }
  }
}

- (int64_t)handleElementTap:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(SAElementViewProviding *)self->_elementViewProvider handleElementViewEvent:0] & 1) != 0)
  {
    return 2;
  }
  else
  {
    return [(SAUILayoutSpecifyingElementViewController *)self _expandToCustomLayoutModeFromUserActionIfPossible];
  }
}

- (int64_t)handleElementLongPress:(id)a3
{
  if ([(SAUILayoutSpecifyingElementViewController *)self layoutMode] != 3
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    return [(SAUILayoutSpecifyingElementViewController *)self _expandToCustomLayoutModeFromUserActionIfPossible];
  }
  if ([(SAElementViewProviding *)self->_elementViewProvider handleElementViewEvent:4])return 2; {
  return 0;
  }
}

- (BOOL)handleTap:(id)a3
{
  return [(SAUILayoutSpecifyingElementViewController *)self handleElementTap:a3] != 0;
}

- (BOOL)handleLongPress:(id)a3
{
  return [(SAUILayoutSpecifyingElementViewController *)self handleElementLongPress:a3] != 0;
}

- (void)addElementViewControllingObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self->_observers;
    objc_sync_enter(v5);
    [(NSHashTable *)self->_observers addObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)removeElementViewControllingObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self->_observers;
    objc_sync_enter(v5);
    [(NSHashTable *)self->_observers removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)setLayoutHost:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if (WeakRetained != obj)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v7 = [MEMORY[0x263F08690] currentHandler];
    }
    objc_storeWeak((id *)&self->_layoutHost, obj);
    [(SAUILayoutSpecifyingElementViewController *)self _configureAlertAssertionIfNecessary];
    id v6 = [(SAElementViewProviding *)self->_elementViewProvider element];
    if (SAHasAlertBehavior())
    {
      if (objc_opt_respondsToSelector()) {
        [v6 setAlertHost:self];
      }
    }
    else if SAHasActivityBehavior() && (objc_opt_respondsToSelector())
    {
      [v6 setActivityHost:self];
    }
  }
}

- (int64_t)layoutMode
{
  v2 = [(SAElementViewProviding *)self->_elementViewProvider systemApertureLayoutSpecifyingOverrider];
  int64_t v3 = [v2 layoutMode];

  return v3;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  id v6 = [(SAElementViewProviding *)self->_elementViewProvider systemApertureLayoutSpecifyingOverrider];
  [v6 setLayoutMode:a3 reason:a4];
}

- (int64_t)minimumSupportedLayoutMode
{
  v2 = [(SAElementViewProviding *)self->_elementViewProvider systemApertureLayoutSpecifyingOverrider];
  int64_t v3 = [v2 minimumSupportedLayoutMode];

  return v3;
}

- (int64_t)maximumSupportedLayoutMode
{
  v2 = [(SAElementViewProviding *)self->_elementViewProvider systemApertureLayoutSpecifyingOverrider];
  int64_t v3 = [v2 maximumSupportedLayoutMode];

  return v3;
}

- (int64_t)preferredLayoutMode
{
  v2 = [(SAElementViewProviding *)self->_elementViewProvider systemApertureLayoutSpecifyingOverrider];
  int64_t v3 = [v2 preferredLayoutMode];

  return v3;
}

- (BOOL)isInteractiveDismissalEnabled
{
  v2 = [(SAElementViewProviding *)self->_elementViewProvider systemApertureLayoutSpecifyingOverrider];
  char v3 = [v2 isInteractiveDismissalEnabled];

  return v3;
}

- (BOOL)isMinimalPresentationPossible
{
  v2 = [(SAElementViewProviding *)self->_elementViewProvider systemApertureLayoutSpecifyingOverrider];
  char v3 = [v2 isMinimalPresentationPossible];

  return v3;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  double trailing = a5.trailing;
  double bottom = a5.bottom;
  double leading = a5.leading;
  double top = a5.top;
  double v9 = a4.trailing;
  double v10 = a4.bottom;
  double v11 = a4.leading;
  double v12 = a4.top;
  id v14 = [(SAElementViewProviding *)self->_elementViewProvider systemApertureLayoutSpecifyingOverrider];
  objc_msgSend(v14, "preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:", a3, v12, v11, v10, v9, top, leading, bottom, trailing);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.double trailing = v26;
  result.double bottom = v25;
  result.double leading = v24;
  result.double top = v23;
  return result;
}

- (BOOL)isRequestingMenuPresentation
{
  v2 = [(SAElementViewProviding *)self->_elementViewProvider systemApertureLayoutSpecifyingOverrider];
  char v3 = [v2 isRequestingMenuPresentation];

  return v3;
}

- (int64_t)behaviorOverridingRole
{
  return 1;
}

- (int64_t)layoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5
{
  int64_t layoutMode = self->_layoutMode;
  if (layoutMode != a3)
  {
    id v9 = a5;
    [(SAUILayoutSpecifyingElementViewController *)self _setPreviousLayoutMode:layoutMode];
    self->_int64_t layoutMode = a3;
    if (a4 == 3)
    {
      if ([(SAUIPreferredLayoutModeAssertion *)self->_preferredLayoutModeAssertion preferredLayoutMode] != a3|| [(SAUIPreferredLayoutModeAssertion *)self->_preferredLayoutModeAssertion layoutModeChangeReason] != 3)
      {
        double v10 = [[SAUILayoutModePreference alloc] initWithPreferredLayoutMode:a3 reason:3];
        id v11 = [(SAUILayoutSpecifyingElementViewController *)self _updatePreferredLayoutModeAssertionWithPreference:v10];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_alertingActivityAssertion);
      [WeakRetained invalidateWithReason:@"layout mode changed by user interaction"];
    }
    else if (a3 <= 0)
    {
      [(SAAssertion *)self->_preferredLayoutModeAssertion invalidateWithReason:@"no longer in visible layout mode"];
    }
    v13 = [v9 layoutSpecifyingOverridingParticipantSubordinateToParticipant:self thatRespondsToSelector:sel_setLayoutMode_reason_forTargetWithOverrider_];
    [v13 setLayoutMode:self->_layoutMode reason:a4 forTargetWithOverrider:v9];

    id v14 = [(SAUILayoutSpecifyingElementViewController *)self viewIfLoaded];
    [v14 setNeedsLayout];
  }
}

- (int64_t)minimumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [v6 layoutSpecifyingOverridingParticipantSubordinateToParticipant:self thatRespondsToSelector:sel_minimumSupportedLayoutModeForTargetWithOverrider_isDefaultValue_];
  int64_t v8 = [v7 minimumSupportedLayoutModeForTargetWithOverrider:v6 isDefaultValue:a4];

  if (a4 && *a4 || v8 == -1)
  {
    id v9 = SATargetElementFromBehaviorOverrider();
    if (SAHasActivityBehavior())
    {
      int64_t v8 = 1;
    }
    else if (SAHasAlertBehavior())
    {
      if (v8 == -1)
      {
        double v10 = [v6 behaviorOverridingTarget];
        if (objc_opt_respondsToSelector()) {
          int64_t v8 = [v10 preferredLayoutMode];
        }
        else {
          int64_t v8 = -1;
        }
      }
      else
      {
        int64_t v8 = 2;
      }
    }
  }
  return v8;
}

- (int64_t)maximumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [v6 layoutSpecifyingOverridingParticipantSubordinateToParticipant:self thatRespondsToSelector:sel_maximumSupportedLayoutModeForTargetWithOverrider_isDefaultValue_];
  int64_t v8 = [v7 maximumSupportedLayoutModeForTargetWithOverrider:v6 isDefaultValue:a4];

  return v8;
}

- (BOOL)isInteractiveDismissalEnabledForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [v6 layoutSpecifyingOverridingParticipantSubordinateToParticipant:self thatRespondsToSelector:sel_isInteractiveDismissalEnabledForTargetWithOverrider_isDefaultValue_];
  int v8 = [v7 isInteractiveDismissalEnabledForTargetWithOverrider:v6 isDefaultValue:a4];

  if (a4 && *a4)
  {
    id v9 = [v6 behaviorOverridingTarget];
    if (SAHasActivityBehavior()) {
      LOBYTE(v8) = 0;
    }
    else {
      v8 |= SAHasAlertBehavior();
    }
  }
  return v8;
}

- (BOOL)isMinimalPresentationPossibleForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [v6 layoutSpecifyingOverridingParticipantSubordinateToParticipant:self thatRespondsToSelector:sel_isMinimalPresentationPossibleForTargetWithOverrider_isDefaultValue_];
  char v8 = [v7 isMinimalPresentationPossibleForTargetWithOverrider:v6 isDefaultValue:a4];

  if (a4 && *a4)
  {
    id v9 = [v6 behaviorOverridingTarget];
    if (SAHasActivityBehavior())
    {
      char v8 = 0;
    }
    else if (SAHasAlertBehavior())
    {
      char v12 = 1;
      double v10 = [(SAUILayoutSpecifyingElementViewController *)self layoutModePreferenceForTargetWithOverrider:v6 isDefaultValue:&v12];
      char v8 = [v10 preferredLayoutMode] == 2;
    }
  }

  return v8;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7
{
  if (a3 < 1)
  {
    double v28 = *MEMORY[0x263F1C228];
    double v29 = *(double *)(MEMORY[0x263F1C228] + 8);
    double v30 = *(double *)(MEMORY[0x263F1C228] + 16);
    double v31 = *(double *)(MEMORY[0x263F1C228] + 24);
  }
  else
  {
    double trailing = a5.trailing;
    double bottom = a5.bottom;
    double leading = a5.leading;
    double top = a5.top;
    double v12 = a4.trailing;
    double v13 = a4.bottom;
    double v14 = a4.leading;
    double v15 = a4.top;
    id v18 = a6;
    double v19 = [v18 layoutSpecifyingOverridingParticipantSubordinateToParticipant:self thatRespondsToSelector:sel_preferredEdgeOutsetsForLayoutMode_suggestedOutsets_maximumOutsets_forTargetWithOverrider_isDefaultValue_];
    objc_msgSend(v19, "preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:forTargetWithOverrider:isDefaultValue:", a3, v18, a7, v15, v14, v13, v12, top, leading, bottom, trailing);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    double v28 = SAUIDirectionEdgeInsetsComponentWiseMaximum(v21, v23, v25, v27, top);
  }
  result.double trailing = v31;
  result.double bottom = v30;
  result.double leading = v29;
  result.double top = v28;
  return result;
}

- (id)layoutModePreferenceForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [(NSPointerArray *)self->_preferredLayoutModeAssertions sa_lastPointer];
  if (!v7)
  {
    char v8 = [v6 layoutSpecifyingOverridingParticipantSubordinateToParticipant:self thatRespondsToSelector:sel_layoutModePreferenceForTargetWithOverrider_isDefaultValue_];
    id v9 = [v8 layoutModePreferenceForTargetWithOverrider:v6 isDefaultValue:a4];

    if (a4 && *a4)
    {
      double v10 = [[SAUILayoutModePreference alloc] initWithPreferredLayoutMode:2 reason:0];

      id v9 = v10;
    }
    id v11 = [(SAUILayoutSpecifyingElementViewController *)self _updatePreferredLayoutModeAssertionWithPreference:v9];
    id v7 = [(NSPointerArray *)self->_preferredLayoutModeAssertions sa_lastPointer];
  }
  return v7;
}

- (id)preferredLayoutModeAssertionForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(NSPointerArray *)v6->_preferredLayoutModeAssertions sa_lastPointer];
  objc_sync_exit(v6);

  return v7;
}

- (void)setPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5
{
  id v6 = [[SAUILayoutModePreference alloc] initWithPreferredLayoutMode:a3 reason:a4];
  uint64_t v8 = [(SAUILayoutSpecifyingElementViewController *)self _updatePreferredLayoutModeAssertionWithPreference:v6];

  id v7 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
    id v7 = (void *)v8;
  }
}

- (double)concentricPaddingForProvidedView:(id)a3 fromViewProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  double v9 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained concentricPaddingForProvidedView:v6 fromViewProvider:v7];
    double v9 = v10;
  }

  return v9;
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a5;
  if (objc_opt_respondsToSelector())
  {
    elementViewProvider = self->_elementViewProvider;
    double v9 = [(SAUILayoutSpecifyingElementViewController *)self _contentView];
    -[SAElementViewProviding contentProviderWillTransitionToSize:inContainerView:transitionCoordinator:](elementViewProvider, "contentProviderWillTransitionToSize:inContainerView:transitionCoordinator:", v9, v10, width, height);
  }
}

- (BOOL)isTrackingTransition
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSMutableDictionary *)v2->_transitionIDsToReasons count] != 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isTrackingTransitionWithReason:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5->_transitionIDsToReasons;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[NSMutableDictionary objectForKey:](v5->_transitionIDsToReasons, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        unsigned int v12 = [v11 isEqualToString:v4];

        v8 += v12;
      }
      uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
    LOBYTE(v7) = v8 != 0;
  }

  objc_sync_exit(v5);
  return v7;
}

- (void)beginTrackingTransitionWithUniqueIdentifier:(id)a3 reason:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    long long v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SAUILayoutSpecifyingElementViewController.m", 463, @"Invalid parameter not satisfying: %@", @"transitionID" object file lineNumber description];
  }
  if (![v8 length])
  {
    id v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SAUILayoutSpecifyingElementViewController.m", 464, @"Invalid parameter not satisfying: %@", @"[reason length] > 0" object file lineNumber description];
  }
  uint64_t v9 = [(SAElementViewProviding *)self->_elementViewProvider element];
  id v10 = (void *)SAUILogElementViewControlling;
  if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    unsigned int v12 = MEMORY[0x2611E1490](v9);
    *(_DWORD *)buf = 138543874;
    double v20 = v12;
    __int16 v21 = 2114;
    id v22 = v7;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl(&dword_25E6E1000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Begin tracking transition with identifier '%{public}@' with reason: %{public}@", buf, 0x20u);
  }
  double v13 = self;
  objc_sync_enter(v13);
  transitionIDsToReasons = v13->_transitionIDsToReasons;
  if (!transitionIDsToReasons)
  {
    long long v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v16 = v13->_transitionIDsToReasons;
    v13->_transitionIDsToReasons = v15;

    transitionIDsToReasons = v13->_transitionIDsToReasons;
  }
  [(NSMutableDictionary *)transitionIDsToReasons setObject:v8 forKey:v7];
  objc_sync_exit(v13);
}

- (void)endTrackingTransitionWithUniqueIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = [(NSMutableDictionary *)v5->_transitionIDsToReasons objectForKey:v4];
    if (v6)
    {
      id v7 = [(SAElementViewProviding *)v5->_elementViewProvider element];
      id v8 = (id)SAUILogElementViewControlling;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = MEMORY[0x2611E1490](v7);
        int v11 = 138543874;
        unsigned int v12 = v9;
        __int16 v13 = 2114;
        id v14 = v4;
        __int16 v15 = 2114;
        long long v16 = v6;
        _os_log_impl(&dword_25E6E1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: End tracking transition with identifier '%{public}@' with reason: %{public}@", (uint8_t *)&v11, 0x20u);
      }
      [(NSMutableDictionary *)v5->_transitionIDsToReasons removeObjectForKey:v4];
      if (![(NSMutableDictionary *)v5->_transitionIDsToReasons count])
      {
        transitionIDsToReasons = v5->_transitionIDsToReasons;
        v5->_transitionIDsToReasons = 0;
      }
    }

    objc_sync_exit(v5);
  }
}

- (void)_axRequestDiminishment
{
  if ([(SAUILayoutSpecifyingElementViewController *)self layoutMode] >= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained _axLayoutSpecifierRequestsDiminishment:self];
    }
  }
}

- (BOOL)_axCollapseIfExpandedByUserInteraction
{
  if ([(SAUILayoutSpecifyingElementViewController *)self layoutMode] < 1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained _axLayoutSpecifierRequestsCollapseIfExpandedByUserInteraction:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)_elementHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  return WeakRetained;
}

- (BOOL)_expandToCustomLayoutModeFromUserActionIfPossible
{
  if ((unint64_t)([(SAUILayoutSpecifyingElementViewController *)self layoutMode] - 1) > 1
    || [(SAUILayoutSpecifyingElementViewController *)self maximumSupportedLayoutMode] < 3)
  {
    return 0;
  }
  BOOL v3 = [[SAUILayoutModePreference alloc] initWithPreferredLayoutMode:3 reason:3];
  char v4 = [(SAUILayoutSpecifyingElementViewController *)self _updatePreferredLayoutModeAssertionWithPreference:v3];

  if (v4) {
    char v5 = v4[2](v4);
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v5 = (void (**)(id, void))a4;
  if (v5)
  {
    id v6 = self->_observers;
    objc_sync_enter(v6);
    id v7 = (void *)[(NSHashTable *)self->_observers copy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v12);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    objc_sync_exit(v6);
  }
}

- (void)_layoutTransitionShadowView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(SAUILayoutSpecifyingElementViewController *)self view];
    char v4 = [(SAUILayoutSpecifyingElementViewController *)self elementViewProvider];
    [WeakRetained sensorRegionInContentView:v3 fromViewProvider:v4];
  }
  char v5 = [(UIImageView *)self->_contentsTransitionShadowView image];
  [v5 size];
  BSRectWithSize();
  id v6 = [(SAUILayoutSpecifyingElementViewController *)self traitCollection];
  [v6 displayScale];
  uint64_t v16 = v7;
  UIRectCenteredIntegralRectScale();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  -[UIImageView setFrame:](self->_contentsTransitionShadowView, "setFrame:", v9, v11, v13, v15, v16);
}

- (void)_configureTransitionShadowViewIfNecessary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if (objc_opt_respondsToSelector())
  {
    char v4 = [(SAUILayoutSpecifyingElementViewController *)self elementViewProvider];
    int v5 = [WeakRetained viewProviderShouldMakeSensorShadowVisible:v4];
  }
  else
  {
    int v5 = 0;
  }
  id v6 = [MEMORY[0x263F1C550] systemOrangeColor];
  uint64_t v7 = [(UIImageView *)self->_contentsTransitionShadowView tintColor];
  int v8 = BSEqualObjects();

  if (v5 != v8)
  {
    [(UIImageView *)self->_contentsTransitionShadowView removeFromSuperview];
    contentsTransitionShadowView = self->_contentsTransitionShadowView;
    self->_contentsTransitionShadowView = 0;
  }
  if (!self->_contentsTransitionShadowView)
  {
    double v10 = (void *)MEMORY[0x263F1CB60];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __86__SAUILayoutSpecifyingElementViewController__configureTransitionShadowViewIfNecessary__block_invoke;
    v11[3] = &unk_26552BC18;
    void v11[4] = self;
    char v13 = v5;
    id v12 = v6;
    [v10 performWithoutAnimation:v11];
  }
}

void __86__SAUILayoutSpecifyingElementViewController__configureTransitionShadowViewIfNecessary__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F1C6B0];
  BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v2 imageNamed:@"elementContentTransitionShadow" inBundle:v3];

  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = [v10 imageWithRenderingMode:2];

    id v10 = (id)v4;
  }
  uint64_t v5 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v10];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 976);
  *(void *)(v6 + 976) = v5;

  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v8 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v8 = 0;
  }
  [*(id *)(*(void *)(a1 + 32) + 976) setTintColor:v8];
  [*(id *)(*(void *)(a1 + 32) + 976) setContentMode:4];
  [*(id *)(*(void *)(a1 + 32) + 976) setAlpha:*(double *)(*(void *)(a1 + 32) + 1048)];
  [*(id *)(*(void *)(a1 + 32) + 976) setUserInteractionEnabled:0];
  double v9 = [*(id *)(a1 + 32) view];
  [v9 addSubview:*(void *)(*(void *)(a1 + 32) + 976)];
  [*(id *)(a1 + 32) _layoutTransitionShadowView];
}

- (void)_setPreviousLayoutMode:(int64_t)a3
{
  self->_previousLayoutMode = a3;
}

- (id)_overrideWithPreference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [SAUIPreferredLayoutModeAssertion alloc];
  uint64_t v7 = [(SAElementViewProviding *)v5->_elementViewProvider element];
  uint64_t v8 = [(SAUIPreferredLayoutModeAssertion *)v6 initWithRepresentedElement:v7 layoutModePreference:v4];

  objc_initWeak(&location, v5);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  double v20 = __69__SAUILayoutSpecifyingElementViewController__overrideWithPreference___block_invoke;
  __int16 v21 = &unk_26552BBF0;
  objc_copyWeak(&v22, &location);
  [(SAAssertion *)v8 addInvalidationBlock:&v18];
  preferredLayoutModeAssertions = v5->_preferredLayoutModeAssertions;
  if (!preferredLayoutModeAssertions)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263F08A88], "weakObjectsPointerArray", v18, v19, v20, v21);
    double v11 = v5->_preferredLayoutModeAssertions;
    v5->_preferredLayoutModeAssertions = (NSPointerArray *)v10;

    preferredLayoutModeAssertions = v5->_preferredLayoutModeAssertions;
  }
  [(NSPointerArray *)preferredLayoutModeAssertions sa_compact];
  unint64_t v12 = 0;
  do
  {
    unint64_t v13 = v12;
    if (v12 >= [(NSPointerArray *)v5->_preferredLayoutModeAssertions count]) {
      break;
    }
    double v14 = [(NSPointerArray *)v5->_preferredLayoutModeAssertions pointerAtIndex:v12];
    uint64_t v15 = [v14 layoutModeChangeReason];
    uint64_t v16 = [(SAUIPreferredLayoutModeAssertion *)v8 layoutModeChangeReason];
    ++v12;
  }
  while (v15 <= v16);
  [(NSPointerArray *)v5->_preferredLayoutModeAssertions insertPointer:v8 atIndex:v13];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  objc_sync_exit(v5);

  return v8;
}

void __69__SAUILayoutSpecifyingElementViewController__overrideWithPreference___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained[124] count])
    {
      uint64_t v5 = 0;
      while ((id)[v4[124] pointerAtIndex:v5] != v8)
      {
        if (++v5 >= (unint64_t)[v4[124] count]) {
          goto LABEL_9;
        }
      }
      if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
        [v4[124] removePointerAtIndex:v5];
      }
    }
LABEL_9:
    uint64_t v6 = [v4 layoutMode];
    if (v6 != [v4 preferredLayoutMode])
    {
      id v7 = objc_loadWeakRetained(v4 + 135);
      [v7 preferredLayoutModeDidInvalidateForLayoutSpecifier:v4];
    }
  }
}

- (id)_updatePreferredLayoutModeAssertionWithPreference:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = (SAAutomaticallyInvalidatingAssertion *)a3;
  uint64_t v5 = SAUILogElementViewControlling;
  if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v4;
    _os_log_impl(&dword_25E6E1000, v5, OS_LOG_TYPE_DEFAULT, "Update preferred layout mode assertion with layout mode preference: %{public}@", buf, 0xCu);
  }
  uint64_t v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(SAAutomaticallyInvalidatingAssertion *)v4 preferredLayoutMode];
  if ([(SAUILayoutSpecifyingElementViewController *)v6 minimumSupportedLayoutMode] > v7)
  {
    if (!v7) {
      goto LABEL_9;
    }
LABEL_8:
    double v9 = 0;
    goto LABEL_25;
  }
  uint64_t v8 = [(SAUILayoutSpecifyingElementViewController *)v6 maximumSupportedLayoutMode];
  if (v7 && v7 > v8) {
    goto LABEL_8;
  }
LABEL_9:
  unint64_t v10 = [(SAAutomaticallyInvalidatingAssertion *)v4 layoutModeChangeReason];
  if (v10 <= 4 && ((1 << v10) & 0x1A) != 0 || !v6->_cooldownAssertion)
  {
    uint64_t v11 = [(SAUILayoutSpecifyingElementViewController *)v6 _overrideWithPreference:v4];
    preferredLayoutModeAssertion = v6->_preferredLayoutModeAssertion;
    v6->_preferredLayoutModeAssertion = (SAUIPreferredLayoutModeAssertion *)v11;

    objc_initWeak(&location, v6);
    unint64_t v13 = v6->_preferredLayoutModeAssertion;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke_2;
    v30[3] = &unk_26552BBF0;
    objc_copyWeak(&v31, &location);
    [(SAAssertion *)v13 addInvalidationBlock:v30];
    if ([(SAUIPreferredLayoutModeAssertion *)v6->_preferredLayoutModeAssertion layoutModeChangeReason] == 3)
    {
      if (v6->_cooldownAssertion)
      {
        double v14 = SAUILogElementViewControlling;
        if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
        {
          cooldownAssertion = v6->_cooldownAssertion;
          *(_DWORD *)buf = 138543362;
          v37 = cooldownAssertion;
          _os_log_impl(&dword_25E6E1000, v14, OS_LOG_TYPE_DEFAULT, "Resetting automatic invalidation timer of existing cooldown assertion: %{public}@", buf, 0xCu);
        }
        [(SAAutomaticallyInvalidatingAssertion *)v6->_cooldownAssertion resetAutomaticInvalidationTimer];
      }
      else
      {
        uint64_t v19 = [objc_alloc(MEMORY[0x263F7C290]) initWithInvalidationInterval:3.0];
        double v20 = v6->_cooldownAssertion;
        v6->_cooldownAssertion = (SAAutomaticallyInvalidatingAssertion *)v19;

        __int16 v21 = v6->_cooldownAssertion;
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke_119;
        v28[3] = &unk_26552BBF0;
        objc_copyWeak(&v29, &location);
        [(SAAutomaticallyInvalidatingAssertion *)v21 addInvalidationBlock:v28];
        [(SAAutomaticallyInvalidatingAssertion *)v6->_cooldownAssertion setAutomaticallyInvalidatable:1];
        id v22 = SAUILogElementViewControlling;
        if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v23 = v6->_cooldownAssertion;
          *(_DWORD *)buf = 138543618;
          v37 = v23;
          __int16 v38 = 2114;
          v39 = v4;
          _os_log_impl(&dword_25E6E1000, v22, OS_LOG_TYPE_DEFAULT, "Created cooldown assertion (%{public}@) for layout mode preference: %{public}@", buf, 0x16u);
        }
        objc_destroyWeak(&v29);
      }
    }
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v16 = SAUILogElementViewControlling;
    if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v6->_cooldownAssertion;
      *(_DWORD *)buf = 138543362;
      v37 = v17;
      _os_log_impl(&dword_25E6E1000, v16, OS_LOG_TYPE_DEFAULT, "Deferring preferred layout mode assertion update due to existing cooldown assertion: %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v6);
    uint64_t v18 = v6->_cooldownAssertion;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke;
    v33[3] = &unk_26552BC40;
    objc_copyWeak(&v35, (id *)buf);
    v34 = v4;
    [(SAAutomaticallyInvalidatingAssertion *)v18 addInvalidationBlock:v33];

    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
  objc_initWeak((id *)buf, v6);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke_120;
  v26[3] = &unk_26552BC68;
  objc_copyWeak(&v27, (id *)buf);
  v26[4] = v6;
  double v9 = (void *)MEMORY[0x2611E1790](v26);
  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
LABEL_25:
  id v24 = (void *)MEMORY[0x2611E1790](v9);

  objc_sync_exit(v6);
  return v24;
}

void __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = (id)[WeakRetained _updatePreferredLayoutModeAssertionWithPreference:*(void *)(a1 + 32)];
}

void __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 125) == v5)
  {
    *((void *)WeakRetained + 125) = 0;
  }
}

void __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke_119(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 127) == v5)
  {
    *((void *)WeakRetained + 127) = 0;
  }
}

uint64_t __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke_120(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained && (uint64_t v4 = [WeakRetained layoutMode], v4 != objc_msgSend(v3, "preferredLayoutMode")))
  {
    id v6 = objc_loadWeakRetained(v3 + 135);
    [v6 preferredLayoutModeDidInvalidateForLayoutSpecifier:*(void *)(a1 + 32)];

    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (double)_defaultAlertingDuration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
  }
  [WeakRetained alertingDurationForHost:self];
  double v6 = v5;

  return v6;
}

- (id)_alertingActivityAssertionWithReason:(id)a3 implicitlyDismissable:(BOOL)a4 withPreferredLayoutMode:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  double v9 = [(SAElementViewProviding *)self->_elementViewProvider element];
  if (SAHasActivityBehavior())
  {
    unint64_t v10 = self;
    objc_sync_enter(v10);
    uint64_t v11 = [(NSMapTable *)v10->_reasonsToAlertingActivityAssertions objectForKey:v8];
    if (!v11)
    {
      unint64_t v12 = [SAUILayoutModePreference alloc];
      if (v6) {
        uint64_t v13 = 5;
      }
      else {
        uint64_t v13 = 2;
      }
      double v14 = [(SAUILayoutModePreference *)v12 initWithPreferredLayoutMode:a5 reason:v13];
      uint64_t v15 = [(SAUILayoutSpecifyingElementViewController *)v10 _overrideWithPreference:v14];

      uint64_t v16 = [SAUIAlertingAssertion alloc];
      [(SAUILayoutSpecifyingElementViewController *)v10 _defaultAlertingDuration];
      uint64_t v11 = -[SAUIAlertingAssertion initWithPreferredLayoutModeAssertion:invalidationInterval:](v16, "initWithPreferredLayoutModeAssertion:invalidationInterval:", v15);
      uint64_t v17 = (id)SAUILogElementViewControlling;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = MEMORY[0x2611E1490](v9);
        *(_DWORD *)buf = 138543874;
        id v31 = v11;
        __int16 v32 = 2114;
        id v33 = v8;
        __int16 v34 = 2114;
        id v35 = v18;
        _os_log_impl(&dword_25E6E1000, v17, OS_LOG_TYPE_DEFAULT, "Created alerting activity assertion (%{public}@) with reason '%{public}@' for element: %{public}@", buf, 0x20u);
      }
      objc_initWeak((id *)buf, v10);
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      double v26 = __128__SAUILayoutSpecifyingElementViewController__alertingActivityAssertionWithReason_implicitlyDismissable_withPreferredLayoutMode___block_invoke;
      id v27 = &unk_26552BC40;
      objc_copyWeak(&v29, (id *)buf);
      id v19 = v8;
      id v28 = v19;
      [(SAAssertion *)v11 addInvalidationBlock:&v24];
      reasonsToAlertingActivityAssertions = v10->_reasonsToAlertingActivityAssertions;
      if (!reasonsToAlertingActivityAssertions)
      {
        uint64_t v21 = objc_msgSend(MEMORY[0x263F08968], "strongToWeakObjectsMapTable", v24, v25, v26, v27);
        id v22 = v10->_reasonsToAlertingActivityAssertions;
        v10->_reasonsToAlertingActivityAssertions = (NSMapTable *)v21;

        reasonsToAlertingActivityAssertions = v10->_reasonsToAlertingActivityAssertions;
      }
      -[NSMapTable setObject:forKey:](reasonsToAlertingActivityAssertions, "setObject:forKey:", v11, v19, v24, v25, v26, v27);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
    objc_sync_exit(v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __128__SAUILayoutSpecifyingElementViewController__alertingActivityAssertionWithReason_implicitlyDismissable_withPreferredLayoutMode___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v3 = WeakRetained;
    [WeakRetained[126] removeObjectForKey:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_configureAlertAssertionIfNecessary
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SAElementViewProviding *)self->_elementViewProvider element];
  if (SAHasAlertBehavior())
  {
    if (!self->_alertAssertion)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);

      if (WeakRetained)
      {
        double v5 = self;
        objc_sync_enter(v5);
        id v6 = objc_alloc(MEMORY[0x263F7C290]);
        [(SAUILayoutSpecifyingElementViewController *)v5 _defaultAlertingDuration];
        uint64_t v7 = objc_msgSend(v6, "initWithInvalidationInterval:");
        id v8 = (id)SAUILogElementViewControlling;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          double v9 = MEMORY[0x2611E1490](v3);
          *(_DWORD *)buf = 138543618;
          double v14 = v7;
          __int16 v15 = 2114;
          uint64_t v16 = v9;
          _os_log_impl(&dword_25E6E1000, v8, OS_LOG_TYPE_DEFAULT, "Created alert assertion (%{public}@) for element: %{public}@", buf, 0x16u);
        }
        objc_initWeak((id *)buf, v5);
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __80__SAUILayoutSpecifyingElementViewController__configureAlertAssertionIfNecessary__block_invoke;
        v11[3] = &unk_26552BBF0;
        objc_copyWeak(&v12, (id *)buf);
        [v7 addInvalidationBlock:v11];
        alertAssertion = self->_alertAssertion;
        self->_alertAssertion = (SAAutomaticallyInvalidatable *)v7;

        objc_destroyWeak(&v12);
        objc_destroyWeak((id *)buf);
        objc_sync_exit(v5);
      }
    }
  }
}

void __80__SAUILayoutSpecifyingElementViewController__configureAlertAssertionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 133) == v5)
  {
    *((void *)WeakRetained + 133) = 0;
  }
}

- (void)_invalidatePreferredLayoutModeAssertionWithReason:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = (void *)SAUILogElementViewControlling;
  if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    SAUIStringFromLayoutModeChangeReason(a3);
    uint64_t v7 = (SAAutomaticallyInvalidatingAssertion *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v7;
    _os_log_impl(&dword_25E6E1000, v6, OS_LOG_TYPE_DEFAULT, "Invalidate preferred layout mode assertion with reason: %{public}@", buf, 0xCu);
  }
  id v8 = self;
  objc_sync_enter(v8);
  if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x1A) != 0 || !v8->_cooldownAssertion)
  {
    preferredLayoutModeAssertion = v8->_preferredLayoutModeAssertion;
    unint64_t v10 = SAUIStringFromLayoutModeChangeReason(a3);
    [(SAAssertion *)preferredLayoutModeAssertion invalidateWithReason:v10];

    id WeakRetained = objc_loadWeakRetained((id *)&v8->_layoutHost);
    [WeakRetained preferredLayoutModeDidInvalidateForLayoutSpecifier:v8];
  }
  else
  {
    id v12 = SAUILogElementViewControlling;
    if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
    {
      cooldownAssertion = v8->_cooldownAssertion;
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = cooldownAssertion;
      _os_log_impl(&dword_25E6E1000, v12, OS_LOG_TYPE_DEFAULT, "Deferring preferred layout mode assertion invalidation due to existing cooldown assertion: %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v8);
    double v14 = v8->_cooldownAssertion;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __95__SAUILayoutSpecifyingElementViewController__invalidatePreferredLayoutModeAssertionWithReason___block_invoke;
    v15[3] = &unk_26552BC90;
    objc_copyWeak(v16, (id *)buf);
    v16[1] = (id)a3;
    [(SAAutomaticallyInvalidatingAssertion *)v14 addInvalidationBlock:v15];
    objc_destroyWeak(v16);
    objc_destroyWeak((id *)buf);
  }
  objc_sync_exit(v8);
}

void __95__SAUILayoutSpecifyingElementViewController__invalidatePreferredLayoutModeAssertionWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidatePreferredLayoutModeAssertionWithReason:*(void *)(a1 + 40)];
}

- (void)_invalidateElementPromotionPreferences
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained preferredPromotionDidInvalidateForLayoutSpecifier:self];
  }
}

- (SAAutomaticallyInvalidatable)alertingActivityAssertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertingActivityAssertion);
  return (SAAutomaticallyInvalidatable *)WeakRetained;
}

- (SAAutomaticallyInvalidatable)alertAssertion
{
  return self->_alertAssertion;
}

- (SAElementViewProviding)elementViewProvider
{
  return self->_elementViewProvider;
}

- (SAUILayoutHosting)layoutHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  return (SAUILayoutHosting *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_elementViewProvider, 0);
  objc_storeStrong((id *)&self->_alertAssertion, 0);
  objc_destroyWeak((id *)&self->_alertingActivityAssertion);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cooldownAssertion, 0);
  objc_storeStrong((id *)&self->_reasonsToAlertingActivityAssertions, 0);
  objc_storeStrong((id *)&self->_preferredLayoutModeAssertion, 0);
  objc_storeStrong((id *)&self->_preferredLayoutModeAssertions, 0);
  objc_storeStrong((id *)&self->_transitionIDsToReasons, 0);
  objc_storeStrong((id *)&self->_contentsTransitionShadowView, 0);
}

- (UIView)_containerView
{
  return 0;
}

- (UIView)_contentView
{
  return 0;
}

- (BOOL)_isObstructedBySensorRegion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [(SAUILayoutSpecifyingElementViewController *)self elementViewProvider];
    id v5 = [(SAUILayoutSpecifyingElementViewController *)self view];
    [WeakRetained sensorRegionObstructingViewProvider:v4 inContentView:v5];
    BOOL v6 = !CGRectIsEmpty(v8);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (CGSize)_obstructedRegionSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [(SAUILayoutSpecifyingElementViewController *)self view];
    id v5 = [(SAUILayoutSpecifyingElementViewController *)self elementViewProvider];
    [WeakRetained sensorRegionInContentView:v4 fromViewProvider:v5];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = *MEMORY[0x263F001B0];
    double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (int64_t)_previousLayoutMode
{
  return self->_previousLayoutMode;
}

- (BOOL)_isNotInCustomLayoutOrTransitionFromCustomLayout
{
  return self->_previousLayoutMode <= 2
      && [(SAUILayoutSpecifyingElementViewController *)self layoutMode] < 3;
}

- (void)_setBlurProgress:(double)a3 forView:(id)a4
{
}

- (void)_insertSnapshotView:(id)a3
{
  id v4 = a3;
  id v5 = [(SAUILayoutSpecifyingElementViewController *)self view];
  [v5 insertSubview:v4 belowSubview:self->_contentsTransitionShadowView];
}

- (void)elementRequestsNegativeResponse:(id)a3
{
  id v5 = a3;
  id v4 = [(SAUILayoutSpecifyingElementViewController *)self _elementHost];
  if (objc_opt_respondsToSelector()) {
    [v4 elementRequestsNegativeResponse:v5];
  }
}

- (void)elementRequestsSignificantUpdateTransition:(id)a3
{
  id v5 = a3;
  id v4 = [(SAUILayoutSpecifyingElementViewController *)self _elementHost];
  if (objc_opt_respondsToSelector()) {
    [v4 elementRequestsSignificantUpdateTransition:v5];
  }
}

- (NSArray)temporallyOrderedAlertingActivityAssertions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = self;
  objc_sync_enter(v4);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4->_reasonsToAlertingActivityAssertions;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = -[NSMapTable objectForKey:](v4->_reasonsToAlertingActivityAssertions, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v3 sortUsingComparator:&__block_literal_global_0];
  objc_sync_exit(v4);

  return (NSArray *)v3;
}

uint64_t __105__SAUILayoutSpecifyingElementViewController_SubclassSupport__temporallyOrderedAlertingActivityAssertions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 creationDate];
  uint64_t v6 = [v4 creationDate];

  [v5 timeIntervalSinceDate:v6];
  if (v7 > 0.0) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }

  return v8;
}

- (id)systemManagedAlertingActivityAssertionWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(SAUILayoutSpecifyingElementViewController *)self systemManagedAlertingActivityAssertionWithReason:v4 preferredLayoutMode:[(SAUILayoutSpecifyingElementViewController *)self maximumSupportedLayoutMode]];

  return v5;
}

- (id)systemManagedAlertingActivityAssertionWithReason:(id)a3 preferredLayoutMode:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(SAUILayoutSpecifyingElementViewController *)self _alertingActivityAssertionWithReason:v6 implicitlyDismissable:0 withPreferredLayoutMode:a4];
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  long long v11 = __131__SAUILayoutSpecifyingElementViewController_SubclassSupport__systemManagedAlertingActivityAssertionWithReason_preferredLayoutMode___block_invoke;
  long long v12 = &unk_26552BBF0;
  objc_copyWeak(&v13, &location);
  [v7 addInvalidationBlock:&v9];
  -[SAUILayoutSpecifyingElementViewController _invalidatePreferredLayoutModeAssertionWithReason:](self, "_invalidatePreferredLayoutModeAssertionWithReason:", 4, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

void __131__SAUILayoutSpecifyingElementViewController_SubclassSupport__systemManagedAlertingActivityAssertionWithReason_preferredLayoutMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _invalidateElementPromotionPreferences];
    id WeakRetained = v2;
  }
}

- (SAUILayoutModePreferring)layoutModePreference
{
  id v2 = [(SAElementViewProviding *)self->_elementViewProvider systemApertureLayoutSpecifyingOverrider];
  id v3 = [v2 layoutModePreference];

  return (SAUILayoutModePreferring *)v3;
}

- (SAUIPreferredLayoutModeAssertion)preferredLayoutModeAssertion
{
  id v2 = [(SAElementViewProviding *)self->_elementViewProvider systemApertureLayoutSpecifyingOverrider];
  id v3 = [v2 preferredLayoutModeAssertion];

  return (SAUIPreferredLayoutModeAssertion *)v3;
}

- (void)setPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  id v6 = [(SAElementViewProviding *)self->_elementViewProvider systemApertureLayoutSpecifyingOverrider];
  [v6 setPreferredLayoutMode:a3 reason:a4];
}

- (void)preferredLayoutModeDidInvalidateForLayoutSpecifier:(id)a3
{
  [(SAUILayoutSpecifyingElementViewController *)self _invalidatePreferredLayoutModeAssertionWithReason:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  [WeakRetained preferredLayoutModeDidInvalidateForLayoutSpecifier:self];
}

- (void)preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:(id)a3
{
  if ([(SAUILayoutSpecifyingElementViewController *)self layoutMode] >= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
  }
}

- (void)menuPresentationRequestDidChangeForLayoutSpecifier:(id)a3
{
  if ([(SAUILayoutSpecifyingElementViewController *)self layoutMode] >= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    [WeakRetained menuPresentationRequestDidChangeForLayoutSpecifier:self];
  }
}

- (NSDirectionalEdgeInsets)edgeOutsetsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  objc_msgSend(WeakRetained, "edgeOutsetsForSize:", width, height);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.double trailing = v17;
  result.double bottom = v16;
  result.double leading = v15;
  result.double top = v14;
  return result;
}

- (void)preferredPromotionDidInvalidateForLayoutSpecifier:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained preferredPromotionDidInvalidateForLayoutSpecifier:v5];
  }
}

- (double)sensorObscuringShadowProgress
{
  return self->_sensorObscuringShadowProgress;
}

- (void)setSensorObscuringShadowProgress:(double)a3
{
  if (self->_sensorObscuringShadowProgress != a3)
  {
    self->_sensorObscuringShadowProgress = a3;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __95__SAUILayoutSpecifyingElementViewController_SubclassSupport__setSensorObscuringShadowProgress___block_invoke;
    v4[3] = &unk_26552BCD8;
    v4[4] = self;
    *(double *)&void v4[5] = a3;
    LODWORD(a3) = *MEMORY[0x263F15738];
    LODWORD(v3) = *(_DWORD *)(MEMORY[0x263F15738] + 8);
    objc_msgSend(MEMORY[0x263F1CB60], "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 0, v4, a3, COERCE_DOUBLE((unint64_t)*(_DWORD *)(MEMORY[0x263F15738] + 4)), v3);
  }
}

uint64_t __95__SAUILayoutSpecifyingElementViewController_SubclassSupport__setSensorObscuringShadowProgress___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) setAlpha:*(double *)(a1 + 40)];
}

@end