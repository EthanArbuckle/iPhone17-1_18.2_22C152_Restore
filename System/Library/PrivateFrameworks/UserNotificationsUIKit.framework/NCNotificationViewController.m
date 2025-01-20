@interface NCNotificationViewController
+ (double)prominentIconDimension;
+ (id)_primaryTextFont;
- (BOOL)_canPan;
- (BOOL)_isPresentingCustomContentProvidingViewController;
- (BOOL)_setDelegate:(id)a3;
- (BOOL)_setNotificationRequest:(id)a3;
- (BOOL)_shouldRestorePresentingShortLookOnDismiss;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)didForwardNotificationRequestToCustomContent:(id)a3;
- (BOOL)disableDimming;
- (BOOL)dismissPresentedViewControllerAnimated:(BOOL)a3;
- (BOOL)hasCommittedToPresentingCustomContentProvidingViewController;
- (BOOL)hasContentProvider;
- (BOOL)hasContentSummary;
- (BOOL)hasShadow;
- (BOOL)hasThreadSummary;
- (BOOL)hideDate;
- (BOOL)isContentExtensionVisible:(id)a3;
- (BOOL)isContentReplacedWithSnapshot;
- (BOOL)isCustomContentHomeAffordanceVisible;
- (BOOL)isHighlighted;
- (BOOL)isInteractionEnabled;
- (BOOL)isLookStyleLongLook;
- (BOOL)isNotPresentingOrHasCommittedToDismissingCustomContentProvidingViewController;
- (BOOL)isNotificationContentViewHidden;
- (BOOL)isShortLook;
- (BOOL)prefersStatusBarHidden;
- (BOOL)restoreInputViews;
- (BOOL)revealAdditionalContentOnPresentation;
- (BOOL)shouldAutorotate;
- (BOOL)shouldCommitToExpandedPlatterPresentationWithFeedback;
- (CGSize)_preferredCustomContentSizeForSize:(CGSize)a3 parentContentContainerBounds:(CGRect)a4;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (NCAuxiliaryOptionsProviding)auxiliaryOptionsContentProvider;
- (NCDimmableView)_notificationViewControllerView;
- (NCNotificationCustomContent)_customContentProvidingViewController;
- (NCNotificationCustomContentProviding)customContentProvider;
- (NCNotificationRequest)notificationRequest;
- (NCNotificationStaticContentProviding)staticContentProvider;
- (NCNotificationViewController)_presentedLongLookViewController;
- (NCNotificationViewController)initWithNotificationRequest:(id)a3;
- (NCNotificationViewController)initWithNotificationRequest:(id)a3 revealingAdditionalContentOnPresentation:(BOOL)a4;
- (NCNotificationViewControllerDelegate)delegate;
- (NSDictionary)notificationUsageTrackingState;
- (NSSet)activeTransitionBlockingAssertions;
- (NSString)debugDescription;
- (NSString)materialGroupNameBase;
- (UIPanGestureRecognizer)customContentHomeAffordanceGestureRecognizer;
- (UIView)associatedView;
- (UIViewControllerTransitionCoordinator)_activeTransitionCoordinator;
- (double)backgroundAlpha;
- (double)contentAlpha;
- (double)dateAlpha;
- (id)_contentSizeManagingView;
- (id)_customContentProvidingViewControllerCreateIfNecessary;
- (id)_initWithNotificationRequest:(id)a3 revealingAdditionalContentOnPresentation:(BOOL)a4;
- (id)_lookView;
- (id)_lookViewIfLoaded;
- (id)_lookViewLoadingIfNecessary:(BOOL)a3;
- (id)_pendingPresentationTransitionDidEndBlock;
- (id)_staticContentProviderLoadingIfNecessary;
- (id)activeTransitionBlockingAssertionForReason:(id)a3;
- (id)containerViewForExpandedContent;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)expandedPlatterPresentationController:(id)a3 keyboardAssertionForGestureWindow:(id)a4;
- (id)hideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:(id)a3;
- (id)presentedExpandedPlatterViewController;
- (id)requestTransitionBlockingAssertionWithReason:(id)a3;
- (id)settleHomeAffordanceAnimationBehaviorDescriptionForExpandedPlatterPresentationController:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)unhideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:(id)a3;
- (int64_t)_dateFormatStyle;
- (int64_t)materialRecipe;
- (int64_t)ncTransitionAnimationState;
- (unint64_t)_maximumNumberOfPrimaryTextLinesForProvidedStaticContent;
- (unint64_t)_maximumNumberOfSecondaryTextLinesForProvidedStaticContent;
- (unint64_t)supportedInterfaceOrientations;
- (void)_askDelegateToExecuteAction:(id)a3 withParameters:(id)a4 animated:(BOOL)a5;
- (void)_executeCancelAction:(BOOL)a3;
- (void)_executeClearAction:(BOOL)a3;
- (void)_executeCloseAction:(BOOL)a3;
- (void)_executeDefaultAction:(BOOL)a3;
- (void)_executeNilAction:(BOOL)a3;
- (void)_notificationViewControllerViewDidLoad;
- (void)_notifyObserversWithBlock:(id)a3;
- (void)_setActiveTransitionCoordinator:(id)a3;
- (void)_setCustomContentProvidingViewController:(id)a3;
- (void)_setPendingPresentationTransitionDidEndBlock:(id)a3;
- (void)_setPreferredCustomContentSize:(CGSize)a3;
- (void)_setShouldRestorePresentingShortLookOnDismiss:(BOOL)a3;
- (void)_setupAuxiliaryOptionsContentProvider;
- (void)_setupCustomContentProvider;
- (void)_setupStaticContentProvider;
- (void)_updatePreferredContentSize;
- (void)_updateScreenCaptureProhibited;
- (void)_updateWithProvidedAuxiliaryOptionsContent;
- (void)_updateWithProvidedStaticContent;
- (void)addObserver:(id)a3;
- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3;
- (void)contentProvider:(id)a3 performAction:(id)a4 animated:(BOOL)a5;
- (void)customContent:(id)a3 forwardAction:(id)a4 forNotification:(id)a5 withUserInfo:(id)a6;
- (void)customContent:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotification:(id)a5 withUserInfo:(id)a6 completionHandler:(id)a7;
- (void)customContentRequestsDefaultAction:(id)a3;
- (void)customContentRequestsDismiss:(id)a3;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)invalidateContentProviders;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentLongLookAnimated:(BOOL)a3 trigger:(int64_t)a4 completion:(id)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)preserveInputViews;
- (void)removeObserver:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAssociatedView:(id)a3;
- (void)setAuxiliaryOptionsContentProvider:(id)a3;
- (void)setBackgroundAlpha:(double)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentReplacedWithSnapshot:(BOOL)a3;
- (void)setCustomContentHomeAffordanceGestureRecognizer:(id)a3;
- (void)setCustomContentHomeAffordanceVisible:(BOOL)a3;
- (void)setCustomContentProvider:(id)a3;
- (void)setDateAlpha:(double)a3;
- (void)setDisableDimming:(BOOL)a3;
- (void)setHasShadow:(BOOL)a3;
- (void)setHasUpdatedContent;
- (void)setHideDate:(BOOL)a3;
- (void)setInteractionEnabled:(BOOL)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setNCTransitionAnimationState:(int64_t)a3;
- (void)setNotificationContentViewHidden:(BOOL)a3;
- (void)setRevealAdditionalContentOnPresentation:(BOOL)a3;
- (void)setStaticContentProvider:(id)a3;
- (void)updateContent;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation NCNotificationViewController

+ (double)prominentIconDimension
{
  return 38.0;
}

- (id)_initWithNotificationRequest:(id)a3 revealingAdditionalContentOnPresentation:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationViewController;
  v8 = [(NCNotificationViewController *)&v12 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    p_notificationRequest = &v8->_notificationRequest;
    objc_storeStrong((id *)&v8->_notificationRequest, a3);
    v9->_didQueryCanPan = 0;
    v9->_interactionEnabled = 1;
    v9->_revealAdditionalContentOnPresentation = a4;
    v9->_backgroundAlpha = 1.0;
    v9->_disableDimming = 0;
    v9->_dateAlpha = 1.0;
    v9->_contentAlpha = 1.0;
    if (*p_notificationRequest) {
      [(NCNotificationViewController *)v9 _setupStaticContentProvider];
    }
  }

  return v9;
}

- (NCNotificationViewController)initWithNotificationRequest:(id)a3 revealingAdditionalContentOnPresentation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(NCNotificationViewController *)self isMemberOfClass:objc_opt_class()])
  {
    if (v4)
    {
      id v7 = [NCNotificationLongLookViewController alloc];
      id v8 = v6;
      uint64_t v9 = 1;
    }
    else
    {
      id v7 = [NCNotificationShortLookViewController alloc];
      id v8 = v6;
      uint64_t v9 = 0;
    }
    v10 = [(NCNotificationLongLookViewController *)v7 _initWithNotificationRequest:v8 revealingAdditionalContentOnPresentation:v9];
  }
  else
  {
    v10 = [(NCNotificationViewController *)self _initWithNotificationRequest:v6 revealingAdditionalContentOnPresentation:v4];
  }

  return v10;
}

- (NCNotificationViewController)initWithNotificationRequest:(id)a3
{
  return [(NCNotificationViewController *)self initWithNotificationRequest:a3 revealingAdditionalContentOnPresentation:0];
}

- (BOOL)_setDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    [(NCNotificationViewController *)self setStaticContentProvider:0];
    [(NCNotificationViewController *)self setAuxiliaryOptionsContentProvider:0];
    id v6 = [(NCNotificationViewController *)self view];
    [v6 setNeedsLayout];
  }
  return WeakRetained != v4;
}

- (void)setBackgroundAlpha:(double)a3
{
  if (self->_backgroundAlpha != a3)
  {
    self->_backgroundAlpha = a3;
    -[NCNotificationLookView setBackgroundAlpha:](self->_lookView, "setBackgroundAlpha:");
  }
}

- (void)setContentAlpha:(double)a3
{
  if (self->_contentAlpha != a3)
  {
    self->_contentAlpha = a3;
    -[NCNotificationLookView setContentAlpha:](self->_lookView, "setContentAlpha:");
  }
}

- (void)setDisableDimming:(BOOL)a3
{
  if (self->_disableDimming != a3)
  {
    self->_disableDimming = a3;
    -[NCNotificationLookView setDisableDimming:](self->_lookView, "setDisableDimming:");
  }
}

- (void)setHideDate:(BOOL)a3
{
  if (self->_hideDate != a3)
  {
    self->_hideDate = a3;
    -[NCNotificationLookView setHideDate:](self->_lookView, "setHideDate:");
  }
}

- (void)setDateAlpha:(double)a3
{
  if (self->_dateAlpha != a3)
  {
    self->_dateAlpha = a3;
    -[NCNotificationLookView setDateAlpha:](self->_lookView, "setDateAlpha:");
  }
}

- (BOOL)_setNotificationRequest:(id)a3
{
  v5 = (NCNotificationRequest *)a3;
  id v6 = v5;
  notificationRequest = self->_notificationRequest;
  if (notificationRequest != v5)
  {
    int v8 = [(NCNotificationRequest *)v5 matchesRequest:self->_notificationRequest];
    objc_storeStrong((id *)&self->_notificationRequest, a3);
    if (!v8
      || ![(NCNotificationViewController *)self _isPresentingCustomContentProvidingViewController])
    {
      uint64_t v9 = [(NCNotificationViewController *)self _lookViewIfLoaded];
      [v9 setHidden:0];
    }
    [(NCNotificationViewController *)self setStaticContentProvider:0];
    [(NCNotificationViewController *)self setAuxiliaryOptionsContentProvider:0];
    [(NCNotificationViewController *)self _updateScreenCaptureProhibited];
    v10 = [(NCNotificationViewController *)self view];
    [v10 setNeedsLayout];
  }
  return notificationRequest != v6;
}

- (BOOL)isShortLook
{
  return 0;
}

- (BOOL)_isPresentingCustomContentProvidingViewController
{
  return 0;
}

- (BOOL)hasCommittedToPresentingCustomContentProvidingViewController
{
  return 0;
}

- (BOOL)isNotPresentingOrHasCommittedToDismissingCustomContentProvidingViewController
{
  return 0;
}

- (void)invalidateContentProviders
{
  [(NCNotificationViewController *)self setStaticContentProvider:0];
  [(NCNotificationViewController *)self setAuxiliaryOptionsContentProvider:0];
  id v3 = [(NCNotificationViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)setStaticContentProvider:(id)a3
{
  p_staticContentProvider = &self->_staticContentProvider;
  id v6 = (NCNotificationStaticContentProviding *)a3;
  if (*p_staticContentProvider != v6)
  {
    objc_storeStrong((id *)&self->_staticContentProvider, a3);
    if (*p_staticContentProvider)
    {
      [(NCNotificationViewController *)self _updateWithProvidedStaticContent];
      [(NCNotificationViewController *)self _updateWithProvidedAuxiliaryOptionsContent];
      [(NCNotificationViewController *)self _updatePreferredContentSize];
    }
  }
}

- (void)_setupStaticContentProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([(NCNotificationViewController *)self notificationRequest],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [WeakRetained notificationRequestPresenter:self staticContentProviderForNotificationRequest:v4], id v7 = (NCNotificationRequestContentProvider *)objc_claimAutoreleasedReturnValue(), v4, !v7))
  {
    v5 = [NCNotificationRequestContentProvider alloc];
    id v6 = [(NCNotificationViewController *)self notificationRequest];
    id v7 = [(NCNotificationRequestContentProvider *)v5 initWithNotificationRequest:v6];

    [(NCNotificationRequestContentProvider *)v7 setDelegate:self];
  }
  [(NCNotificationViewController *)self setStaticContentProvider:v7];
}

- (id)_staticContentProviderLoadingIfNecessary
{
  staticContentProvider = self->_staticContentProvider;
  if (!staticContentProvider)
  {
    [(NCNotificationViewController *)self _setupStaticContentProvider];
    staticContentProvider = self->_staticContentProvider;
  }

  return staticContentProvider;
}

- (void)_setupCustomContentProvider
{
  id v3 = objc_alloc_init(NCNotificationRequestCustomContentProvider);
  [(NCNotificationViewController *)self setCustomContentProvider:v3];
}

- (void)setAuxiliaryOptionsContentProvider:(id)a3
{
  id v6 = a3;
  id v5 = [(NCNotificationViewController *)self auxiliaryOptionsContentProvider];

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_auxiliaryOptionsContentProvider, a3);
    if (self->_auxiliaryOptionsContentProvider) {
      [(NCNotificationViewController *)self _updateWithProvidedAuxiliaryOptionsContent];
    }
  }
}

- (void)_setupAuxiliaryOptionsContentProvider
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7C04000, a2, OS_LOG_TYPE_ERROR, "Ignoring delegate's auxiliary options provider %{public}@, because inline actions provider takes precedence.", (uint8_t *)&v2, 0xCu);
}

- (id)_customContentProvidingViewControllerCreateIfNecessary
{
  uint64_t v3 = [(NCNotificationViewController *)self _customContentProvidingViewController];
  if (!v3)
  {
    uint64_t v4 = [(NCNotificationViewController *)self customContentProvider];
    id v5 = [(NCNotificationViewController *)self notificationRequest];
    uint64_t v3 = [v4 customContentViewControllerForNotificationRequest:v5];

    [(NCNotificationViewController *)self _setCustomContentProvidingViewController:v3];
  }

  return v3;
}

- (void)_setCustomContentProvidingViewController:(id)a3
{
  id v5 = (NCNotificationCustomContent *)a3;
  p_customContentProvidingViewController = &self->_customContentProvidingViewController;
  customContentProvidingViewController = self->_customContentProvidingViewController;
  int v8 = v5;
  if (customContentProvidingViewController != v5)
  {
    [(NCNotificationCustomContent *)customContentProvidingViewController willMoveToParentViewController:0];
    [(NCNotificationCustomContent *)*p_customContentProvidingViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_customContentProvidingViewController, a3);
    if (*p_customContentProvidingViewController)
    {
      [(NCNotificationCustomContent *)*p_customContentProvidingViewController setDelegate:self];
      [(NCNotificationViewController *)self addChildViewController:*p_customContentProvidingViewController];
      [(NCNotificationCustomContent *)*p_customContentProvidingViewController didMoveToParentViewController:self];
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      id v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      id v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    observers = self->_observers;
    if (observers) {
      -[NSHashTable removeObject:](observers, "removeObject:");
    }
  }
}

- (void)_notifyObserversWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, NCNotificationViewController *, void))a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v6 = (id)[(NSHashTable *)observers copy];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
            id v11 = objc_initWeak(&location, self);
            v4[2](v4, self, v10);

            objc_destroyWeak(&location);
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
    }
  }
}

- (BOOL)didForwardNotificationRequestToCustomContent:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationViewController *)self _customContentProvidingViewController];
  if (v5)
  {
    id v6 = [(NCNotificationViewController *)self _customContentProvidingViewController];
    char v7 = [v6 didReceiveNotificationRequest:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setHasUpdatedContent
{
  [(NCNotificationViewController *)self _updateWithProvidedStaticContent];
  [(NCNotificationViewController *)self _updateWithProvidedCustomContent];
  [(NCNotificationViewController *)self _updateWithProvidedAuxiliaryOptionsContent];

  [(NCNotificationViewController *)self _updatePreferredContentSize];
}

- (void)updateContent
{
  id v2 = [(NCNotificationViewController *)self view];
  [v2 layoutIfNeeded];
}

- (BOOL)dismissPresentedViewControllerAnimated:(BOOL)a3
{
  return 0;
}

- (BOOL)isContentExtensionVisible:(id)a3
{
  return 0;
}

- (void)preserveInputViews
{
  id v2 = [(NCNotificationViewController *)self _presentedLongLookViewController];
  [v2 preserveInputViews];
}

- (BOOL)restoreInputViews
{
  id v2 = [(NCNotificationViewController *)self _presentedLongLookViewController];
  char v3 = [v2 restoreInputViews];

  return v3;
}

- (BOOL)_canPan
{
  if (!self->_didQueryCanPan)
  {
    self->_didQueryCanPan = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      char v4 = [WeakRetained notificationViewControllerShouldPan:self];
    }
    else {
      char v4 = 0;
    }
    self->_canPan = v4;
  }
  return self->_canPan;
}

- (void)setInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEBUG)) {
    [(NCNotificationViewController *)v3 setInteractionEnabled:v5];
  }
  self->_interactionEnabled = v3;
  id v6 = [(NCNotificationViewController *)self view];
  [v6 setUserInteractionEnabled:v3];
}

- (id)containerViewForExpandedContent
{
  id v2 = [(UIViewController *)self nc_presentationContextDefiningViewController];
  BOOL v3 = [v2 view];
  char v4 = [v3 superview];

  return v4;
}

- (id)presentedExpandedPlatterViewController
{
  return 0;
}

- (BOOL)shouldCommitToExpandedPlatterPresentationWithFeedback
{
  return 0;
}

- (id)_lookViewLoadingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(NCNotificationViewController *)self isViewLoaded] & 1) != 0 || v3)
  {
    [(NCNotificationViewController *)self loadViewIfNeeded];
    id v5 = self->_lookView;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_lookViewIfLoaded
{
  return [(NCNotificationViewController *)self _lookViewLoadingIfNecessary:0];
}

- (id)_lookView
{
  return [(NCNotificationViewController *)self _lookViewLoadingIfNecessary:1];
}

+ (id)_primaryTextFont
{
  if (_primaryTextFont_onceToken[0] != -1) {
    dispatch_once(_primaryTextFont_onceToken, &__block_literal_global);
  }
  id v2 = (void *)_primaryTextFont__primaryTextFont;

  return v2;
}

void __48__NCNotificationViewController__primaryTextFont__block_invoke()
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950]];
  uint64_t v9 = *MEMORY[0x1E4FB0950];
  uint64_t v7 = *MEMORY[0x1E4FB09F0];
  v1 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09E0]];
  uint64_t v8 = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v10[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  char v4 = [v0 fontDescriptorByAddingAttributes:v3];

  uint64_t v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];
  id v6 = (void *)_primaryTextFont__primaryTextFont;
  _primaryTextFont__primaryTextFont = v5;
}

- (BOOL)isHighlighted
{
  int v3 = _NCIsNotificationHighlightsAllowed();
  if (v3)
  {
    staticContentProvider = self->_staticContentProvider;
    LOBYTE(v3) = [(NCNotificationStaticContentProviding *)staticContentProvider isHighlighted];
  }
  return v3;
}

- (BOOL)hasThreadSummary
{
  return [(NCNotificationStaticContentProviding *)self->_staticContentProvider isThreadSummary];
}

- (BOOL)hasContentSummary
{
  id v2 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider contentSummaryText];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasContentProvider
{
  return self->_staticContentProvider != 0;
}

- (void)_updateWithProvidedStaticContent
{
  BOOL v3 = [(NCNotificationViewController *)self _lookViewIfLoaded];
  if (!v3) {
    goto LABEL_38;
  }
  char v4 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider title];
  [(NCNotificationViewController *)self _updateLookView:v3 withTitleFromProvidedStaticContent:v4];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider badgedIconView];
    [v3 setBadgedIconView:v5];
  }
  _NCIsNotificationHighlightsAllowed();
  id v6 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider date];
  [v3 setDate:v6];

  objc_msgSend(v3, "setDateAllDay:", -[NCNotificationStaticContentProviding isDateAllDay](self->_staticContentProvider, "isDateAllDay"));
  uint64_t v7 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider timeZone];
  [v3 setTimeZone:v7];

  objc_msgSend(v3, "setDateFormatStyle:", -[NCNotificationViewController _dateFormatStyle](self, "_dateFormatStyle"));
  uint64_t v8 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider contentSummaryText];
  uint64_t v9 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider primaryText];
  int v10 = [(NCNotificationViewController *)self isHighlighted];
  id v11 = [(id)objc_opt_class() _primaryTextFont];
  objc_super v12 = _NCContentSummaryText(v8, v9, v11, 0, v10);

  if (objc_opt_respondsToSelector())
  {
    if ([v12 length]) {
      long long v13 = v12;
    }
    else {
      long long v13 = 0;
    }
    [v3 setContentSummaryText:v13];
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    [v3 setPrimaryText:v9];
LABEL_16:
    v17 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider primarySubtitleText];
    [v3 setPrimarySubtitleText:v17];

    uint64_t v18 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider secondaryText];
    [v3 setSecondaryText:v18];

    goto LABEL_17;
  }
  long long v14 = [v3 contentSummaryText];
  uint64_t v15 = [v14 length];

  if (((v15 != 0) & v10) != 0) {
    long long v16 = 0;
  }
  else {
    long long v16 = v9;
  }
  [v3 setPrimaryText:v16];
  if (!v15) {
    goto LABEL_16;
  }
  [v3 setPrimarySubtitleText:0];
  [v3 setSecondaryText:0];
LABEL_17:
  v19 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider inlineAction];
  v20 = [v19 title];

  objc_initWeak(&location, self);
  if (objc_opt_respondsToSelector())
  {
    if ([v20 length])
    {
      v21 = (void *)MEMORY[0x1E4FB13F0];
      v22 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider inlineAction];
      v23 = [v22 identifier];
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = __64__NCNotificationViewController__updateWithProvidedStaticContent__block_invoke;
      v39 = &unk_1E6A91930;
      objc_copyWeak(&v40, &location);
      v24 = [v21 actionWithTitle:v20 image:0 identifier:v23 handler:&v36];

      objc_destroyWeak(&v40);
    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v3, "setInlineAction:", v24, v36, v37, v38, v39);
  }
  if (objc_opt_respondsToSelector())
  {
    v25 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider footerText];
    [v3 setFooterText:v25];
  }
  v26 = [(NCNotificationViewController *)self delegate];
  if (v26 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v27 = [v26 importantAdornmentEligibleOptionsForNotificationViewController:self];
  }
  else {
    uint64_t v27 = -1;
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    staticContentProvider = self->_staticContentProvider;
    v29 = [v3 importantTextImageConfiguration];
    v30 = [(NCNotificationStaticContentProviding *)staticContentProvider importantAttributedTextWithImageConfiguration:v29 importantAdornmentEligibleOptions:v27];

    [v3 setImportantAttributedText:v30];
    v31 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider importantTextVisualStylingProvider];
    [v3 setImportantTextVisualStylingProvider:v31];
  }
  else
  {
    v30 = 0;
  }
  if (![v30 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v32 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider importantText];
    [v3 setImportantText:v32];

    v33 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider importantTextVisualStylingProvider];
    [v3 setImportantTextVisualStylingProvider:v33];
  }
  if (objc_opt_respondsToSelector())
  {
    v34 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider thumbnail];
    [v3 setThumbnail:v34];
  }
  objc_msgSend(v3, "setMaximumNumberOfPrimaryTextLines:", -[NCNotificationViewController _maximumNumberOfPrimaryTextLinesForProvidedStaticContent](self, "_maximumNumberOfPrimaryTextLinesForProvidedStaticContent"));
  objc_msgSend(v3, "setMaximumNumberOfSecondaryTextLines:", -[NCNotificationViewController _maximumNumberOfSecondaryTextLinesForProvidedStaticContent](self, "_maximumNumberOfSecondaryTextLinesForProvidedStaticContent"));
  v35 = [(NCNotificationViewController *)self view];
  [v35 setNeedsLayout];

  objc_destroyWeak(&location);
LABEL_38:
}

void __64__NCNotificationViewController__updateWithProvidedStaticContent__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v3 = WeakRetained;
    id v2 = [WeakRetained[137] inlineAction];
    [v3 _askDelegateToExecuteAction:v2 withParameters:MEMORY[0x1E4F1CC08] animated:1];

    id WeakRetained = v3;
  }
}

- (unint64_t)_maximumNumberOfPrimaryTextLinesForProvidedStaticContent
{
  id v2 = [(NCNotificationViewController *)self traitCollection];
  BOOL v3 = [v2 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v3)) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

- (unint64_t)_maximumNumberOfSecondaryTextLinesForProvidedStaticContent
{
  id v2 = [(NCNotificationViewController *)self traitCollection];
  BOOL v3 = [v2 preferredContentSizeCategory];
  UIContentSizeCategoryIsAccessibilityCategory(v3);

  return 2;
}

- (int64_t)_dateFormatStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [WeakRetained notificationViewControllerDateFormatStyle:self];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (void)_updateWithProvidedAuxiliaryOptionsContent
{
  [(NCNotificationViewController *)self _setupAuxiliaryOptionsContentProvider];
  auxiliaryOptionsContentProvider = self->_auxiliaryOptionsContentProvider;
  uint64_t v4 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider isHidingContent] ^ 1;

  [(NCAuxiliaryOptionsProviding *)auxiliaryOptionsContentProvider setAuxiliaryOptionsVisible:v4];
}

- (NCDimmableView)_notificationViewControllerView
{
  objc_opt_class();
  BOOL v3 = [(NCNotificationViewController *)self view];
  uint64_t v4 = UNSafeCast();

  return (NCDimmableView *)v4;
}

- (id)_contentSizeManagingView
{
  p_contentSizeManagingView = &self->_contentSizeManagingView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentSizeManagingView);
  if (!WeakRetained)
  {
    uint64_t v5 = [(NCNotificationViewController *)self viewIfLoaded];
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      id WeakRetained = v5;
      objc_storeWeak((id *)p_contentSizeManagingView, WeakRetained);
    }
    else
    {
      id WeakRetained = 0;
    }
  }

  return WeakRetained;
}

- (void)_notificationViewControllerViewDidLoad
{
  id v4 = [(NCNotificationViewController *)self view];
  [v4 setAutoresizesSubviews:1];
  [(NCNotificationViewController *)self _loadLookView];
  [(NCNotificationLookView *)self->_lookView setAdjustsFontForContentSizeCategory:1];
  BOOL v3 = [(NCNotificationViewController *)self _notificationViewControllerView];
  [v3 setContentView:self->_lookView];
}

- (CGSize)_preferredCustomContentSizeForSize:(CGSize)a3 parentContentContainerBounds:(CGRect)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(NCNotificationViewController *)self _lookViewIfLoaded];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "contentSizeForSize:", width, height);
    double width = v8;
    double height = v9;
  }

  double v10 = width;
  double v11 = height;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)_setPreferredCustomContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(NCNotificationViewController *)self _contentSizeManagingView];
  objc_msgSend(v6, "sizeThatFitsContentWithSize:", width, height);
  double v8 = v7;
  double v10 = v9;

  -[NCNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8, v10);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "notificationViewController:didUpdatePreferredContentSize:", self, v8, v10);
  }
}

- (void)_updatePreferredContentSize
{
  if ([(NCNotificationViewController *)self isViewLoaded])
  {
    BOOL v3 = [(UIViewController *)self nc_presentationControllerIfPresented];
    id v24 = [v3 containerView];

    if (v24)
    {
      [v24 bounds];
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
    }
    else
    {
      objc_super v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
      objc_msgSend(v12, "nc_bounds");
      double v5 = v13;
      double v7 = v14;
      double v9 = v15;
      double v11 = v16;
    }
    v17 = [(NCNotificationViewController *)self view];
    [v17 bounds];
    -[NCNotificationViewController _preferredCustomContentSizeForSize:parentContentContainerBounds:](self, "_preferredCustomContentSizeForSize:parentContentContainerBounds:", v18, v19, v5, v7, v9, v11);
    double v21 = v20;
    double v23 = v22;

    -[NCNotificationViewController _setPreferredCustomContentSize:](self, "_setPreferredCustomContentSize:", v21, v23);
  }
}

- (void)_updateScreenCaptureProhibited
{
  lookView = self->_lookView;
  id v4 = [(NCNotificationViewController *)self notificationRequest];
  BOOL v3 = [v4 options];
  -[NCNotificationLookView setScreenCaptureProhibited:](lookView, "setScreenCaptureProhibited:", [v3 screenCaptureProhibited]);
}

- (NSDictionary)notificationUsageTrackingState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v4 = [WeakRetained notificationRequestPresenterNotificationUsageTrackingState:self];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSSet)activeTransitionBlockingAssertions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v2->_reasonsToTransitionBlockingAssertions;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = -[NSMapTable objectForKey:](v2->_reasonsToTransitionBlockingAssertions, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        if ([v8 isValid]) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (id)requestTransitionBlockingAssertionWithReason:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(NCNotificationViewController *)v5 activeTransitionBlockingAssertionForReason:v4];
    if (!v6)
    {
      double v7 = (id)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        double v8 = [(NCNotificationRequest *)v5->_notificationRequest notificationIdentifier];
        double v9 = objc_msgSend(v8, "un_logDigest");
        *(_DWORD *)buf = 138543618;
        v17 = v9;
        __int16 v18 = 2114;
        id v19 = v4;
        _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "New transition blocking assertion requested for notification view controller for request '%{public}@' with reason '%{public}@'", buf, 0x16u);
      }
      if (!v5->_reasonsToTransitionBlockingAssertions)
      {
        uint64_t v10 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
        reasonsToTransitionBlockingAssertions = v5->_reasonsToTransitionBlockingAssertions;
        v5->_reasonsToTransitionBlockingAssertions = (NSMapTable *)v10;
      }
      uint64_t v6 = [[NCAssertion alloc] initWithInstantiationReason:v4];
      objc_initWeak((id *)buf, v5);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __77__NCNotificationViewController_requestTransitionBlockingAssertionWithReason___block_invoke;
      v14[3] = &unk_1E6A91958;
      objc_copyWeak(&v15, (id *)buf);
      [(NCAssertion *)v6 addInvalidationBlock:v14];
      [(NSMapTable *)v5->_reasonsToTransitionBlockingAssertions setObject:v6 forKey:v4];
      id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained notificationRequestPresenter:v5 didVendTransitionBlockingAssertion:v6];
      }

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __77__NCNotificationViewController_requestTransitionBlockingAssertionWithReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    double v7 = v6;
    double v8 = [WeakRetained notificationRequest];
    double v9 = [v8 notificationIdentifier];
    uint64_t v10 = objc_msgSend(v9, "un_logDigest");
    int v11 = 138543618;
    long long v12 = v10;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "Transition blocking assertion for notification view controller for request '%{public}@' invalidated with reason '%{public}@'", (uint8_t *)&v11, 0x16u);
  }
}

- (id)activeTransitionBlockingAssertionForReason:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(NSMapTable *)v5->_reasonsToTransitionBlockingAssertions objectForKey:v4];
    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)loadView
{
  id v3 = objc_alloc_init(NCDimmableView);
  [(NCNotificationViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationViewController;
  [(NCNotificationViewController *)&v3 viewDidLoad];
  [(NCNotificationViewController *)self _notificationViewControllerViewDidLoad];
  [(NCNotificationViewController *)self setHasUpdatedContent];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationViewController;
  [(NCNotificationViewController *)&v7 viewWillAppear:a3];
  if ([(NCNotificationViewController *)self isBeingPresented])
  {
    [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_67];
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __47__NCNotificationViewController_viewWillAppear___block_invoke_2;
    v4[3] = &unk_1E6A919A0;
    objc_copyWeak(&v5, &location);
    [(NCNotificationViewController *)self _setPendingPresentationTransitionDidEndBlock:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __47__NCNotificationViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 notificationViewControllerWillPresent:v5];
  }
}

void __47__NCNotificationViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyObserversWithBlock:&__block_literal_global_71];
}

void __47__NCNotificationViewController_viewWillAppear___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 notificationViewControllerDidPresent:v5];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationViewController;
  [(NCNotificationViewController *)&v6 viewDidAppear:a3];
  id pendingPresentationTransitionDidEndBlock = self->_pendingPresentationTransitionDidEndBlock;
  if (pendingPresentationTransitionDidEndBlock)
  {
    id v5 = (void (**)(void))_Block_copy(pendingPresentationTransitionDidEndBlock);
    [(NCNotificationViewController *)self _setPendingPresentationTransitionDidEndBlock:0];
    v5[2](v5);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationViewController;
  [(NCNotificationViewController *)&v7 viewWillDisappear:a3];
  if ([(NCNotificationViewController *)self isBeingDismissed])
  {
    [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_79];
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __50__NCNotificationViewController_viewWillDisappear___block_invoke_2;
    v4[3] = &unk_1E6A919A0;
    objc_copyWeak(&v5, &location);
    [(NCNotificationViewController *)self _setPendingPresentationTransitionDidEndBlock:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __50__NCNotificationViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 notificationViewControllerWillDismiss:v5];
  }
}

void __50__NCNotificationViewController_viewWillDisappear___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyObserversWithBlock:&__block_literal_global_83];
}

void __50__NCNotificationViewController_viewWillDisappear___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 notificationViewControllerDidDismiss:v5];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationViewController;
  [(NCNotificationViewController *)&v15 viewDidDisappear:a3];
  id v4 = self;
  objc_sync_enter(v4);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NCNotificationViewController *)v4 activeTransitionBlockingAssertions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v8++) invalidateWithReason:@"notificationViewController.invalidationReason.dismissed"];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  id pendingPresentationTransitionDidEndBlock = v4->_pendingPresentationTransitionDidEndBlock;
  if (pendingPresentationTransitionDidEndBlock)
  {
    uint64_t v10 = (void (**)(void))_Block_copy(pendingPresentationTransitionDidEndBlock);
    [(NCNotificationViewController *)v4 _setPendingPresentationTransitionDidEndBlock:0];
    v10[2](v10);
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationViewController;
  [(NCNotificationViewController *)&v3 viewWillLayoutSubviews];
  if (self->_notificationRequest)
  {
    if (!self->_staticContentProvider) {
      [(NCNotificationViewController *)self _setupStaticContentProvider];
    }
    if (!self->_auxiliaryOptionsContentProvider) {
      [(NCNotificationViewController *)self _setupAuxiliaryOptionsContentProvider];
    }
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationViewController;
  [(NCNotificationViewController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_93];
}

void __76__NCNotificationViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 notificationViewControllerViewDidMoveToWindow:v5];
  }
}

- (BOOL)shouldAutorotate
{
  objc_super v3 = [(NCNotificationViewController *)self presentingViewController];
  if (v3)
  {
    id v4 = [(NCNotificationViewController *)self presentingViewController];
    char v5 = [v4 shouldAutorotate];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = 1;
  if (!v6) {
    int64_t v10 = 2;
  }
  self->_ncTransitionAnimationState = v10;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__NCNotificationViewController_presentViewController_animated_completion___block_invoke;
  v13[3] = &unk_1E6A919C8;
  objc_copyWeak(&v15, &location);
  id v11 = v9;
  id v14 = v11;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationViewController;
  [(NCNotificationViewController *)&v12 presentViewController:v8 animated:1 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __74__NCNotificationViewController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setNCTransitionAnimationState:0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  id v6 = a4;
  int64_t v7 = 1;
  if (!a3) {
    int64_t v7 = 2;
  }
  self->_ncTransitionAnimationState = v7;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __79__NCNotificationViewController_dismissViewControllerWithTransition_completion___block_invoke;
  v10[3] = &unk_1E6A919C8;
  objc_copyWeak(&v12, &location);
  id v8 = v6;
  id v11 = v8;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationViewController;
  [(NCNotificationViewController *)&v9 dismissViewControllerWithTransition:9 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __79__NCNotificationViewController_dismissViewControllerWithTransition_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setNCTransitionAnimationState:0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (int64_t)ncTransitionAnimationState
{
  return self->_ncTransitionAnimationState;
}

- (void)setNCTransitionAnimationState:(int64_t)a3
{
  self->_ncTransitionAnimationState = a3;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  double height = a3.height;
  double width = a3.width;
  BSRectWithSize();
  -[NCNotificationViewController _preferredCustomContentSizeForSize:parentContentContainerBounds:](self, "_preferredCustomContentSizeForSize:parentContentContainerBounds:", width, height, v7, v8, v9, v10);
  double v12 = v11;
  double v14 = v13;
  id v15 = [(NCNotificationViewController *)self _contentSizeManagingView];
  objc_msgSend(v15, "sizeThatFitsContentWithSize:", v12, v14);
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationViewController;
  [(NCNotificationViewController *)&v12 preferredContentSizeDidChangeForChildContentContainer:v4];
  id v5 = [(NCNotificationViewController *)self _customContentProvidingViewController];

  if (v5 == v4)
  {
    id v6 = [v4 transitionCoordinator];
    double v7 = v6;
    if (v6)
    {
      if ([v6 presentationStyle] == -1)
      {
LABEL_7:

        goto LABEL_8;
      }
      [(NCNotificationViewController *)self _updatePreferredContentSize];
      double v8 = objc_alloc_init(NCAnimationCoordinator);
      [(NCAnimationCoordinator *)v8 setDurationInherited:1];
    }
    else
    {
      [(NCNotificationViewController *)self _updatePreferredContentSize];
      double v8 = +[NCAnimationCoordinator animationCoordinatorWithDuration:0.25];
    }
    [(NCAnimationCoordinator *)v8 setAnimationOptions:4];
    [(NCNotificationViewController *)self preferredContentSize];
    -[NCNotificationViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v4);
    -[NCAnimationCoordinator viewOfChildContainer:willChangeToSize:](v8, "viewOfChildContainer:willChangeToSize:", v4);
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__NCNotificationViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
    v9[3] = &unk_1E6A919F0;
    objc_copyWeak(&v10, &location);
    [(NCAnimationCoordinator *)v8 animate:v9 completion:0];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

    goto LABEL_7;
  }
LABEL_8:
}

void __86__NCNotificationViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained view];
  [v1 setNeedsLayout];

  uint64_t v2 = [WeakRetained view];
  [v2 layoutIfNeeded];
}

- (int64_t)materialRecipe
{
  return 1;
}

- (void)_executeDefaultAction:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationViewController *)self _staticContentProviderLoadingIfNecessary];
  uint64_t v6 = [v4 defaultAction];

  id v5 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3);
    id v5 = (void *)v6;
  }
}

- (void)_executeClearAction:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationViewController *)self _staticContentProviderLoadingIfNecessary];
  uint64_t v6 = [v4 clearAction];

  id v5 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3);
    id v5 = (void *)v6;
  }
}

- (void)_executeCloseAction:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NCNotificationViewController *)self _staticContentProviderLoadingIfNecessary];
  uint64_t v6 = [v5 closeAction];

  if (v6)
  {
    [(NCNotificationViewController *)self _setShouldRestorePresentingShortLookOnDismiss:1];
    v6[2](v6, v3);
  }
}

- (void)_executeCancelAction:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NCNotificationViewController *)self _staticContentProviderLoadingIfNecessary];
  uint64_t v6 = [v5 cancelAction];

  if (v6)
  {
    [(NCNotificationViewController *)self _setShouldRestorePresentingShortLookOnDismiss:1];
    v6[2](v6, v3);
  }
}

- (void)_executeNilAction:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NCNotificationViewController *)self _staticContentProviderLoadingIfNecessary];
  uint64_t v6 = [v5 nilAction];

  if (v6)
  {
    [(NCNotificationViewController *)self _setShouldRestorePresentingShortLookOnDismiss:1];
    v6[2](v6, v3);
  }
}

- (void)_askDelegateToExecuteAction:(id)a3 withParameters:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__NCNotificationViewController__askDelegateToExecuteAction_withParameters_animated___block_invoke;
  aBlock[3] = &unk_1E6A91A18;
  objc_copyWeak(&v30, &location);
  id v10 = _Block_copy(aBlock);
  if (v8)
  {
    double v11 = [(NCNotificationRequest *)self->_notificationRequest userNotification];
    if (v11)
    {
      objc_super v12 = (void *)[v9 mutableCopy];
      double v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      id v15 = v14;

      double v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];
      [v15 setValue:v16 forKey:*MEMORY[0x1E4F44768]];
      uint64_t v17 = [v15 copy];

      id v9 = (id)v17;
    }
    -[NCNotificationViewController _setShouldRestorePresentingShortLookOnDismiss:](self, "_setShouldRestorePresentingShortLookOnDismiss:", [v8 shouldDismissNotification] ^ 1);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    double v23 = __84__NCNotificationViewController__askDelegateToExecuteAction_withParameters_animated___block_invoke_2;
    id v24 = &unk_1E6A91A40;
    objc_copyWeak(&v27, &location);
    id v18 = v8;
    id v25 = v18;
    id v26 = v10;
    BOOL v28 = v5;
    double v19 = _Block_copy(&v21);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(WeakRetained, "notificationRequestPresenter:executeAction:withParameters:completion:", self, v18, v9, v19, v21, v22, v23, v24, v25);
    }

    objc_destroyWeak(&v27);
  }
  else
  {
    [(NCNotificationViewController *)self _setShouldRestorePresentingShortLookOnDismiss:1];
    double v11 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [v11 notificationViewControllerWillDismissForCancelAction:self];
    }
    (*((void (**)(void *, BOOL))v10 + 2))(v10, v5);
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __84__NCNotificationViewController__askDelegateToExecuteAction_withParameters_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissPresentedViewControllerAnimated:a2];
}

void __84__NCNotificationViewController__askDelegateToExecuteAction_withParameters_animated___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (a2)
  {
    id v10 = WeakRetained;
    if (([*(id *)(a1 + 32) isSystemAction] & 1) == 0 && (objc_msgSend(v10, "isShortLook") & 1) == 0)
    {
      BOOL v5 = +[NCNotificationEventTracker sharedInstance];
      uint64_t v6 = *(void *)(a1 + 32);
      double v7 = [v10 notificationRequest];
      id v8 = [v10 notificationUsageTrackingState];
      [v5 longLookCustomAction:v6 forNotificationRequest:v7 withState:v8];
    }
    BOOL v9 = [*(id *)(a1 + 32) activationMode] == 1;
    id WeakRetained = v10;
    if (!v9)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id WeakRetained = v10;
    }
  }
}

- (void)contentProvider:(id)a3 performAction:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v8 = a4;
  if (v8)
  {
    BOOL v9 = [(NCNotificationViewController *)self _customContentProvidingViewController];
    id v10 = [(NCNotificationViewController *)self notificationRequest];
    char v11 = [v9 performAction:v8 forNotification:v10];

    char v12 = v11 ^ 1;
  }
  else
  {
    char v12 = 1;
  }
  double v13 = [v8 identifier];
  int v14 = [v13 isEqual:*MEMORY[0x1E4F446E0]];

  if ((v12 & 1) != 0 || v14) {
    [(NCNotificationViewController *)self _askDelegateToExecuteAction:v8 withParameters:MEMORY[0x1E4F1CC08] animated:v5];
  }
}

- (void)customContent:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotification:(id)a5 withUserInfo:(id)a6 completionHandler:(id)a7
{
  id v10 = a7;
  id v11 = a6;
  id v12 = a4;
  id v13 = [(NCNotificationViewController *)self delegate];
  [v13 notificationViewController:self requestPermissionToExecuteAction:v12 withParameters:v11 completion:v10];
}

- (void)customContent:(id)a3 forwardAction:(id)a4 forNotification:(id)a5 withUserInfo:(id)a6
{
}

- (void)customContentRequestsDefaultAction:(id)a3
{
}

- (void)customContentRequestsDismiss:(id)a3
{
}

- (id)expandedPlatterPresentationController:(id)a3 keyboardAssertionForGestureWindow:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v7 = [v6 notificationViewController:self keyboardAssertionForGestureWindow:v5];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)hideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:(id)a3
{
  id v4 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 hideHomeAffordanceAnimationSettingsForNotificationViewController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)unhideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:(id)a3
{
  id v4 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 unhideHomeAffordanceAnimationSettingsForNotificationViewController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)settleHomeAffordanceAnimationBehaviorDescriptionForExpandedPlatterPresentationController:(id)a3
{
  id v4 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 settleHomeAffordanceAnimationBehaviorDescriptionForNotificationViewController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return [(NCNotificationLookView *)self->_lookView adjustsFontForContentSizeCategory];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(NCNotificationViewController *)self _lookViewIfLoaded];
  id v4 = v3;
  if (v3)
  {
    [v3 adjustForContentSizeCategoryChange];
    [(NCNotificationViewController *)self setHasUpdatedContent];
    id v5 = [(NCNotificationViewController *)self view];
    [v5 setNeedsLayout];
  }
  return 1;
}

- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3
{
  id v4 = [(NCNotificationViewController *)self _notificationViewControllerView];
  long long v5 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->tx;
  [v4 configureStackDimmingForTransform:v6];
}

- (NSString)debugDescription
{
  return (NSString *)[(NCNotificationViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(NCNotificationViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  uint64_t v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __70__NCNotificationViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6A91A68;
  id v7 = v6;
  id v11 = v7;
  id v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

void __70__NCNotificationViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if ([*(id *)(a1 + 40) isViewLoaded])
  {
    BOOL v3 = [*(id *)(a1 + 40) view];
    id v4 = (id)[v2 appendObject:v3 withName:@"view"];
  }
  else
  {
    id v5 = (id)[v2 appendObject:@"(view not loaded)" withName:@"view"];
  }
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) delegate];
  id v8 = (id)[v6 appendObject:v7 withName:@"delegate" skipIfNil:1];

  BOOL v9 = [*(id *)(a1 + 40) notificationRequest];

  id v11 = *(void **)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  if (v9)
  {
    id v12 = [v10 notificationRequest];
    id v13 = [v12 description];
    [v11 appendString:v13 withName:@"notificationRequest"];
  }
  else
  {
    id v12 = [v10 staticContentProvider];
    id v14 = (id)[v11 appendObject:v12 withName:@"staticContentProvider" skipIfNil:1];
  }

  id v15 = *(void **)(a1 + 32);
  double v16 = [*(id *)(a1 + 40) customContentProvider];
  id v17 = (id)[v15 appendObject:v16 withName:@"customContentProvider" skipIfNil:1];

  if ([*(id *)(a1 + 40) _isPresentingCustomContentProvidingViewController])
  {
    id v18 = *(void **)(a1 + 32);
    id v20 = [*(id *)(a1 + 40) _presentedLongLookViewController];
    id v19 = (id)[v18 appendObject:v20 withName:@"presentedLongLookViewController"];
  }
}

- (id)succinctDescription
{
  uint64_t v2 = [(NCNotificationViewController *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(NCNotificationViewController *)self notificationRequest];
  id v5 = [v4 notificationIdentifier];
  uint64_t v6 = objc_msgSend(v5, "un_logDigest");
  [v3 appendString:v6 withName:@"notificationID" skipIfEmpty:1];

  if ([(NCNotificationViewController *)self isViewLoaded])
  {
    id v7 = [(NCNotificationViewController *)self view];
    id v8 = (id)[v3 appendObject:v7 withName:@"view"];
  }
  else
  {
    id v9 = (id)[v3 appendObject:@"(view not loaded)" withName:@"view"];
  }

  return v3;
}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (void)setMaterialGroupNameBase:(id)a3
{
}

- (NCNotificationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationViewControllerDelegate *)WeakRetained;
}

- (BOOL)revealAdditionalContentOnPresentation
{
  return self->_revealAdditionalContentOnPresentation;
}

- (void)setRevealAdditionalContentOnPresentation:(BOOL)a3
{
  self->_revealAdditionalContentOnPresentation = a3;
}

- (BOOL)isCustomContentHomeAffordanceVisible
{
  return self->_customContentHomeAffordanceVisible;
}

- (void)setCustomContentHomeAffordanceVisible:(BOOL)a3
{
  self->_customContentHomeAffordanceVisible = a3;
}

- (UIPanGestureRecognizer)customContentHomeAffordanceGestureRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customContentHomeAffordanceGestureRecognizer);

  return (UIPanGestureRecognizer *)WeakRetained;
}

- (void)setCustomContentHomeAffordanceGestureRecognizer:(id)a3
{
}

- (BOOL)isNotificationContentViewHidden
{
  return self->_notificationContentViewHidden;
}

- (void)setNotificationContentViewHidden:(BOOL)a3
{
  self->_notificationContentViewHidden = a3;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (BOOL)isContentReplacedWithSnapshot
{
  return self->_contentReplacedWithSnapshot;
}

- (void)setContentReplacedWithSnapshot:(BOOL)a3
{
  self->_contentReplacedWithSnapshot = a3;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (BOOL)disableDimming
{
  return self->_disableDimming;
}

- (BOOL)hideDate
{
  return self->_hideDate;
}

- (double)dateAlpha
{
  return self->_dateAlpha;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (NCNotificationStaticContentProviding)staticContentProvider
{
  return self->_staticContentProvider;
}

- (NCNotificationCustomContentProviding)customContentProvider
{
  return self->_customContentProvider;
}

- (void)setCustomContentProvider:(id)a3
{
}

- (NCAuxiliaryOptionsProviding)auxiliaryOptionsContentProvider
{
  return self->_auxiliaryOptionsContentProvider;
}

- (UIViewControllerTransitionCoordinator)_activeTransitionCoordinator
{
  return self->_activeTransitionCoordinator;
}

- (void)_setActiveTransitionCoordinator:(id)a3
{
}

- (BOOL)isInteractionEnabled
{
  return self->_interactionEnabled;
}

- (UIView)associatedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedView);

  return (UIView *)WeakRetained;
}

- (void)setAssociatedView:(id)a3
{
}

- (id)_pendingPresentationTransitionDidEndBlock
{
  return self->_pendingPresentationTransitionDidEndBlock;
}

- (void)_setPendingPresentationTransitionDidEndBlock:(id)a3
{
}

- (NCNotificationCustomContent)_customContentProvidingViewController
{
  return self->_customContentProvidingViewController;
}

- (BOOL)_shouldRestorePresentingShortLookOnDismiss
{
  return self->_shouldRestorePresentingShortLookOnDismiss;
}

- (void)_setShouldRestorePresentingShortLookOnDismiss:(BOOL)a3
{
  self->_shouldRestorePresentingShortLookOnDismiss = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customContentProvidingViewController, 0);
  objc_storeStrong(&self->_pendingPresentationTransitionDidEndBlock, 0);
  objc_destroyWeak((id *)&self->_associatedView);
  objc_storeStrong((id *)&self->_activeTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsContentProvider, 0);
  objc_storeStrong((id *)&self->_customContentProvider, 0);
  objc_storeStrong((id *)&self->_staticContentProvider, 0);
  objc_destroyWeak((id *)&self->_customContentHomeAffordanceGestureRecognizer);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_notificationRequest, 0);
  objc_storeStrong((id *)&self->_lookView, 0);
  objc_destroyWeak((id *)&self->_contentSizeManagingView);
  objc_storeStrong((id *)&self->_reasonsToTransitionBlockingAssertions, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (NCNotificationViewController)_presentedLongLookViewController
{
  return 0;
}

- (void)presentLongLookAnimated:(BOOL)a3 trigger:(int64_t)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (BOOL)isLookStyleLongLook
{
  return 0;
}

- (void)setInteractionEnabled:(os_log_t)log .cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2114;
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_1D7C04000, log, OS_LOG_TYPE_DEBUG, "Setting interactionEnabled=%d for view controller %{public}@", (uint8_t *)v3, 0x12u);
}

@end