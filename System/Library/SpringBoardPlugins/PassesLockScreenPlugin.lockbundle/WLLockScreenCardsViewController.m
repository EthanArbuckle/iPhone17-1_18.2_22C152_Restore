@interface WLLockScreenCardsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)pluginAnimatesAppearanceTransition:(BOOL)a3;
- (BOOL)pluginHandleEvent:(int64_t)a3;
- (SBLockScreenPluginAgent)pluginAgent;
- (SBLockScreenPluginAppearance)pluginAppearance;
- (WLLockScreenCardsViewController)init;
- (double)_animateViewBackgroundColor:(id)a3 from:(id)a4 to:(id)a5 delay:(double)a6 completion:(id)a7;
- (double)dismissAnimated:(BOOL)a3 withCompletion:(id)a4;
- (id)cardAtIndex:(unint64_t)a3;
- (id)diffForCardAtIndex:(unint64_t)a3;
- (id)pluginAnimateAppearanceTransition:(BOOL)a3 withCompletion:(id)a4;
- (int64_t)_overlayStyle;
- (int64_t)pluginPriority;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)cardCount;
- (unint64_t)startIndex;
- (void)_createCoverSheetViewController;
- (void)_createPassesView;
- (void)_insertViewControllerIfNeeded:(id)a3;
- (void)_passViewNotificationTimerFired;
- (void)_presentPassesAnimated:(BOOL)a3 completion:(id)a4;
- (void)_updateViewState;
- (void)authorizationCoverSheetViewControllerDidCompleteWithSuccess:(BOOL)a3;
- (void)dealloc;
- (void)disableIdleTimer;
- (void)dismissAnimated:(BOOL)a3;
- (void)enableIdleTimer;
- (void)loadView;
- (void)openApplication:(id)a3;
- (void)passLibrary:(id)a3 receivedUpdatedCatalog:(id)a4 passes:(id)a5 states:(id)a6;
- (void)pluginDidDeactivateWithContext:(id)a3;
- (void)pluginWillActivateWithContext:(id)a3;
- (void)setPluginAgent:(id)a3;
- (void)updateBacklightWithProgress:(double)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation WLLockScreenCardsViewController

- (WLLockScreenCardsViewController)init
{
  v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4)
  {
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_A59C(v5);
    }

    v6 = 0;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)WLLockScreenCardsViewController;
    v7 = [(WLLockScreenCardsViewController *)&v24 init];
    if (v7)
    {
      uint64_t v8 = +[PKPassLibrary sharedInstance];
      passLibrary = v7->_passLibrary;
      v7->_passLibrary = (PKPassLibrary *)v8;

      [(PKPassLibrary *)v7->_passLibrary addDelegate:v7];
      v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      cardsByUniqueID = v7->_cardsByUniqueID;
      v7->_cardsByUniqueID = v10;

      v7->_lockscreenActive = 0;
      v7->_coverSheetViewState = 0;
      v7->_passViewState = 0;
      v7->_parentState = 0;
      uint64_t v12 = +[PKGlyphView sharedStaticResources];
      id staticGlyphResources = v7->_staticGlyphResources;
      v7->_id staticGlyphResources = (id)v12;

      v14 = +[NSNotificationCenter defaultCenter];
      [v14 addObserver:v7 selector:"openApplication:" name:PKOpenApplicationNotification object:0];

      v15 = +[PKBacklightController sharedInstance];
      [v15 beginAllowingBacklightRamping:v7];

      v16 = +[MCProfileConnection sharedConnection];
      unsigned int v17 = [v16 effectiveBoolValueForSetting:MCFeatureCardsWhileLockedAllowed];

      char v18 = 0;
      if (v17 != 1) {
        char v18 = PKDeviceLocked();
      }
      v7->_showCoverSheet = v18;
      v19 = (PKUISpringAnimationFactory *)[objc_alloc((Class)PKUISpringAnimationFactory) initWithMass:1.0 stiffness:120.0 damping:18.0];
      springAnimationFactory = v7->_springAnimationFactory;
      v7->_springAnimationFactory = v19;

      v21 = v7->_springAnimationFactory;
      v22 = PKMagicCurve();
      [(PKUISpringAnimationFactory *)v21 setTiming:v22];
    }
    self = v7;
    v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:PKOpenApplicationNotification object:0];

  id v4 = +[PKBacklightController sharedInstance];
  [v4 endAllowingBacklightRamping:self];

  [(PKAssertion *)self->_contactlessInterfaceAssertion invalidate];
  [(PKPassLibrary *)self->_passLibrary removeDelegate:self];
  [(NSTimer *)self->_resetIdleTimerTimer invalidate];
  [(NSTimer *)self->_notifyPassViewedTimer invalidate];
  [(PKAuthenticator *)self->_coverSheetAuthenticator invalidate];
  v5.receiver = self;
  v5.super_class = (Class)WLLockScreenCardsViewController;
  [(WLLockScreenCardsViewController *)&v5 dealloc];
}

- (void)pluginWillActivateWithContext:(id)a3
{
  id v4 = a3;
  self->_startIndex = 0;
  objc_super v5 = [v4 userInfo];
  v6 = [v5 objectForKey:@"seedIndex"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    self->_startIndex = (unint64_t)[v6 unsignedIntegerValue];
  }
  v7 = [v5 PKArrayContaining:objc_opt_class() forKey:@"uniqueIDs"];
  if (v7)
  {
    objc_storeStrong((id *)&self->_cardUniqueIDs, v7);
    uint64_t v8 = [(WLLockScreenCardsViewController *)self cardAtIndex:self->_startIndex];
    [v8 loadImageSetSync:0 preheat:1];

    v9 = [(WLLockScreenCardsViewController *)self cardAtIndex:self->_startIndex];
    [v9 loadContentSync];
  }
  v10 = [v5 objectForKey:@"recordID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [(PKPassLibrary *)self->_passLibrary diffForPassUpdateUserNotificationWithIdentifier:v10];
    diff = self->_diff;
    self->_diff = v11;
  }
  v13 = SBUIGetUserAgent();
  LODWORD(v14) = 1127299088;
  [v13 setMinimumBacklightLevel:1 animated:v14];

  [(WLLockScreenCardsViewController *)self disableIdleTimer];
  [(WLLockScreenView *)self->_lockScreenView setDataSource:self];
  objc_initWeak(&location, self);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  char v18 = sub_509C;
  v19 = &unk_10418;
  objc_copyWeak(&v20, &location);
  +[PKAssertion acquireAssertionOfType:0 withReason:@"Lockscreen Plugin" completion:&v16];
  self->_lockscreenActive = 1;
  coverSheetViewController = self->_coverSheetViewController;
  if (coverSheetViewController) {
    [(PKAuthorizationCoverSheetViewController *)coverSheetViewController startEvaluation];
  }
  [(WLLockScreenCardsViewController *)self _updateViewState];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)pluginDidDeactivateWithContext:(id)a3
{
  self->_lockscreenActive = 0;
  [(WLLockScreenCardsViewController *)self _updateViewState];
  [(WLLockScreenCardsViewController *)self enableIdleTimer];
  [(PKAssertion *)self->_contactlessInterfaceAssertion invalidate];
  contactlessInterfaceAssertion = self->_contactlessInterfaceAssertion;
  self->_contactlessInterfaceAssertion = 0;

  [(WLLockScreenView *)self->_lockScreenView setOffscreen:1];
  objc_super v5 = SBUIGetUserAgent();
  [v5 setMinimumBacklightLevel:1 animated:0.0];

  [(NSTimer *)self->_notifyPassViewedTimer invalidate];
  notifyPassViewedTimer = self->_notifyPassViewedTimer;
  self->_notifyPassViewedTimer = 0;
}

- (void)loadView
{
  id v3 = objc_alloc_init((Class)UIView);
  -[WLLockScreenCardsViewController setView:](self, "setView:");
  if (self->_showCoverSheet) {
    [(WLLockScreenCardsViewController *)self _createCoverSheetViewController];
  }
  else {
    [(WLLockScreenCardsViewController *)self _createPassesView];
  }
}

- (void)_createPassesView
{
  id v3 = -[WLLockScreenView initWithFrame:]([WLLockScreenView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  lockScreenView = self->_lockScreenView;
  self->_lockScreenView = v3;

  [(WLLockScreenView *)self->_lockScreenView setDelegate:self];
  [(WLLockScreenView *)self->_lockScreenView setAnimatingPresentation:1];
  objc_super v5 = [(WLLockScreenCardsViewController *)self view];
  [v5 addSubview:self->_lockScreenView];

  if (self->_showCoverSheet)
  {
    [(WLLockScreenView *)self->_lockScreenView setDataSource:self];
    id v6 = [(WLLockScreenCardsViewController *)self viewIfLoaded];
    [v6 setNeedsLayout];
    [v6 layoutIfNeeded];
  }
}

- (void)_createCoverSheetViewController
{
  if (!self->_coverSheetViewController)
  {
    if (!self->_coverSheetAuthenticator)
    {
      id v3 = (PKAuthenticator *)[objc_alloc((Class)PKAuthenticator) initWithDelegate:0];
      coverSheetAuthenticator = self->_coverSheetAuthenticator;
      self->_coverSheetAuthenticator = v3;
    }
    self->_coverSheetViewController = (PKAuthorizationCoverSheetViewController *)[objc_alloc((Class)PKAuthorizationCoverSheetViewController) initWithDelegate:self authenticator:self->_coverSheetAuthenticator source:3];
    _objc_release_x1();
  }
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)WLLockScreenCardsViewController;
  [(WLLockScreenCardsViewController *)&v15 viewWillLayoutSubviews];
  id v3 = [(WLLockScreenCardsViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  lockScreenView = self->_lockScreenView;
  if (lockScreenView)
  {
    -[WLLockScreenView setFrame:](lockScreenView, "setFrame:", v5, v7, v9, v11);
    [(WLLockScreenView *)self->_lockScreenView layoutIfNeeded];
  }
  coverSheetViewController = self->_coverSheetViewController;
  if (coverSheetViewController)
  {
    double v14 = [(PKAuthorizationCoverSheetViewController *)coverSheetViewController view];
    objc_msgSend(v14, "setFrame:", v5, v7, v9, v11);
    [v14 layoutIfNeeded];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WLLockScreenCardsViewController;
  [(WLLockScreenCardsViewController *)&v4 viewWillAppear:a3];
  self->_parentState = 1;
  [(WLLockScreenCardsViewController *)self _updateViewState];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_parentState = 2;
  [(WLLockScreenCardsViewController *)self _updateViewState];
  v5.receiver = self;
  v5.super_class = (Class)WLLockScreenCardsViewController;
  [(WLLockScreenCardsViewController *)&v5 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WLLockScreenCardsViewController;
  [(WLLockScreenCardsViewController *)&v4 viewWillDisappear:a3];
  self->_parentState = 3;
  [(WLLockScreenCardsViewController *)self _updateViewState];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WLLockScreenCardsViewController;
  [(WLLockScreenCardsViewController *)&v4 viewDidDisappear:a3];
  self->_parentState = 0;
}

- (void)_updateViewState
{
  v2 = &OBJC_IVAR___WLLockScreenCardsViewController__passViewState;
  if (self->_showCoverSheet && !self->_lockScreenView) {
    v2 = &OBJC_IVAR___WLLockScreenCardsViewController__coverSheetViewState;
  }
  uint64_t v3 = *v2;
  if (self->_lockscreenActive) {
    int parentState = self->_parentState;
  }
  else {
    int parentState = 0;
  }
  if (*((unsigned __int8 *)&self->super.super.super.isa + v3) != parentState)
  {
    *((unsigned char *)&self->super.super.super.isa + v3) = parentState;
    PKViewVisibilityStateAdvanceState();
  }
}

- (void)_passViewNotificationTimerFired
{
  id v6 = [(WLLockScreenCardsViewController *)self cardAtIndex:[(WLLockScreenView *)self->_lockScreenView currentIndex]];
  if (v6)
  {
    passLibrary = self->_passLibrary;
    objc_super v4 = [v6 uniqueID];
    [(PKPassLibrary *)passLibrary notifyPassUsedWithIdentifier:v4 fromSource:2];
  }
  notifyPassViewedTimer = self->_notifyPassViewedTimer;
  self->_notifyPassViewedTimer = 0;
}

- (void)authorizationCoverSheetViewControllerDidCompleteWithSuccess:(BOOL)a3
{
  if (a3)
  {
    [(WLLockScreenCardsViewController *)self _createPassesView];
    objc_initWeak(&location, self);
    coverSheetAuthenticator = self->_coverSheetAuthenticator;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_5ACC;
    v6[3] = &unk_10490;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    [(PKAuthenticator *)coverSheetAuthenticator accessExternalizedContextWithCompletion:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    id v5 = [(WLLockScreenCardsViewController *)self pluginAgent];
    [v5 deactivatePluginController:self];
  }
}

- (void)passLibrary:(id)a3 receivedUpdatedCatalog:(id)a4 passes:(id)a5 states:(id)a6
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_5D30;
  v8[3] = &unk_104F8;
  id v9 = a5;
  double v10 = self;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)_presentPassesAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  NSUInteger v7 = [(NSArray *)self->_cardUniqueIDs count];
  if (v7)
  {
    NSUInteger v8 = v7;
    uint64_t v9 = 0;
    while (1)
    {
      double v10 = [(WLLockScreenCardsViewController *)self cardAtIndex:v9];
      if (PKRelevancyLocationServicesEnabled())
      {
        if ([v10 hasLocationRelevancyInfo]) {
          break;
        }
      }

      if (v8 == ++v9) {
        goto LABEL_6;
      }
    }
    id v21 = objc_alloc((Class)CLLocationManager);
    v22 = PKPassKitCoreBundle();
    v23 = [v22 bundlePath];
    id v24 = [v21 initWithEffectiveBundlePath:v23 delegate:self onQueue:&_dispatch_main_q];

    [v24 markAsHavingReceivedLocation];
    if (!v4) {
      goto LABEL_9;
    }
LABEL_7:
    double v11 = [(PKUISpringAnimationFactory *)self->_springAnimationFactory highFrameRateSpringAnimationWithKeyPath:@"transform.translation.y" reason:1];
    [v11 setRemovedOnCompletion:1];
    [v11 setAdditive:0];
    [v11 setFillMode:kCAFillModeBackwards];
    [v11 setBeginTime:0.150000006];
    uint64_t v12 = self->_lockScreenView;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_6324;
    v33[3] = &unk_10520;
    v13 = v12;
    v34 = v13;
    objc_msgSend(v11, "pkui_setCompletionHandler:", v33);
    double v14 = [(WLLockScreenView *)self->_lockScreenView translatedView];
    objc_super v15 = [v14 layer];
    v16 = [v15 valueForKeyPath:@"transform.translation.y"];
    [v11 setFromValue:v16];

    uint64_t v17 = [v14 layer];
    char v18 = +[NSNumber numberWithFloat:0.0];
    [v17 setValue:v18 forKeyPath:@"transform.translation.y"];

    v19 = [v14 layer];
    [v19 addAnimation:v11 forKey:@"transform.translation.y"];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_6330;
    v31[3] = &unk_10548;
    v32 = v13;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_633C;
    v27[3] = &unk_10570;
    v29 = v6;
    uint64_t v30 = 0x3FD99999A0000000;
    v28 = v32;
    id v20 = v32;
    +[UIView animateWithDuration:0 delay:v31 options:v27 animations:0.400000006 completion:0.150000006];

    goto LABEL_11;
  }
LABEL_6:
  if (v4) {
    goto LABEL_7;
  }
LABEL_9:
  [(WLLockScreenView *)self->_lockScreenView setOffscreen:0];
  if (v6) {
    v6[2](v6);
  }
LABEL_11:
  [(NSTimer *)self->_notifyPassViewedTimer invalidate];
  v25 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_passViewNotificationTimerFired" selector:0 userInfo:0 repeats:5.0];
  notifyPassViewedTimer = self->_notifyPassViewedTimer;
  self->_notifyPassViewedTimer = v25;
}

- (unint64_t)cardCount
{
  return [(NSArray *)self->_cardUniqueIDs count];
}

- (unint64_t)startIndex
{
  return self->_startIndex;
}

- (id)cardAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_cardUniqueIDs count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->_cardUniqueIDs objectAtIndex:a3];
    id v6 = [(NSMutableDictionary *)self->_cardsByUniqueID objectForKey:v5];
    if (!v6)
    {
      id v6 = [(PKPassLibrary *)self->_passLibrary passWithUniqueID:v5];
      if (v6) {
        [(NSMutableDictionary *)self->_cardsByUniqueID setObject:v6 forKey:v5];
      }
    }
  }

  return v6;
}

- (id)diffForCardAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_cardUniqueIDs count] <= a3)
  {
    NSUInteger v8 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->_cardUniqueIDs objectAtIndex:a3];
    id v6 = [(PKDiff *)self->_diff passUniqueID];
    unsigned int v7 = [v6 isEqualToString:v5];

    if (v7) {
      NSUInteger v8 = self->_diff;
    }
    else {
      NSUInteger v8 = 0;
    }
  }

  return v8;
}

- (void)dismissAnimated:(BOOL)a3
{
}

- (double)dismissAnimated:(BOOL)a3 withCompletion:(id)a4
{
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_6988;
  v28[3] = &unk_10598;
  v28[4] = self;
  id v6 = a4;
  id v29 = v6;
  unsigned int v7 = objc_retainBlock(v28);
  id staticGlyphResources = self->_staticGlyphResources;
  self->_id staticGlyphResources = 0;

  +[PKAuthenticator resetSharedRootContextWithCompletion:0];
  if (!self->_showCoverSheet)
  {
    if (a3) {
      goto LABEL_6;
    }
LABEL_8:
    ((void (*)(void *))v7[2])(v7);
    double v13 = 0.0;
    goto LABEL_9;
  }
  if (!a3) {
    goto LABEL_8;
  }
  if (self->_lockScreenView)
  {
LABEL_6:
    uint64_t v9 = [(PKUISpringAnimationFactory *)self->_springAnimationFactory highFrameRateSpringAnimationWithKeyPath:@"transform.translation.y" reason:1];
    [v9 setRemovedOnCompletion:1];
    [v9 setFillMode:kCAFillModeBackwards];
    [v9 setAdditive:0];
    double v10 = [(WLLockScreenView *)self->_lockScreenView translatedView];
    double v14 = [v10 layer];
    objc_super v15 = [v14 valueForKeyPath:@"transform.translation.y"];
    [v9 setFromValue:v15];

    v16 = +[UIScreen mainScreen];
    [v16 bounds];
    double v18 = v17;

    v19 = [v10 layer];
    *(float *)&double v20 = v18;
    id v21 = +[NSNumber numberWithFloat:v20];
    [v19 setValue:v21 forKeyPath:@"transform.translation.y"];

    v22 = [v10 layer];
    [v22 addAnimation:v9 forKey:@"transform.translation.y"];

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_6A04;
    v27[3] = &unk_10548;
    void v27[4] = self;
    +[UIView animateWithDuration:v27 animations:0.120000002];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_6A1C;
    v26[3] = &unk_10548;
    v26[4] = self;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_6A34;
    v24[3] = &unk_105C0;
    v25 = v7;
    double v13 = 0.400000006;
    +[UIView animateWithDuration:v26 animations:v24 completion:0.400000006];

    goto LABEL_7;
  }
  [(PKAuthorizationCoverSheetViewController *)self->_coverSheetViewController fadeOutUIWithCompletion:0];
  [(PKAuthorizationCoverSheetViewController *)self->_coverSheetViewController invalidate];
  [(PKAuthenticator *)self->_coverSheetAuthenticator invalidate];
  uint64_t v9 = [(PKAuthorizationCoverSheetViewController *)self->_coverSheetViewController view];
  double v10 = +[UIColor systemGroupedBackgroundColor];
  double v11 = +[UIColor clearColor];
  [(WLLockScreenCardsViewController *)self _animateViewBackgroundColor:v9 from:v10 to:v11 delay:v7 completion:0.0];
  double v13 = v12;

LABEL_7:
LABEL_9:

  return v13;
}

- (SBLockScreenPluginAppearance)pluginAppearance
{
  id v3 = objc_alloc_init((Class)SBLockScreenPluginMutableAppearanceContext);
  [v3 setPresentationStyle:1];
  objc_msgSend(v3, "setBackgroundStyle:", -[WLLockScreenCardsViewController _overlayStyle](self, "_overlayStyle"));
  [v3 setRestrictedCapabilities:36];

  return (SBLockScreenPluginAppearance *)v3;
}

- (int64_t)pluginPriority
{
  return 10000;
}

- (int64_t)_overlayStyle
{
  if (PKIsLowEndDevice()) {
    return 0;
  }
  BOOL v4 = [(WLLockScreenCardsViewController *)self traitCollection];
  if ([v4 userInterfaceStyle] == (char *)&dword_0 + 2) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = 3;
  }

  return v3;
}

- (BOOL)pluginHandleEvent:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  BOOL v3 = (((_BYTE)a3 - 1) & 1) == 0;
  [(WLLockScreenCardsViewController *)self dismissAnimated:1];
  return v3;
}

- (BOOL)pluginAnimatesAppearanceTransition:(BOOL)a3
{
  return 1;
}

- (id)pluginAnimateAppearanceTransition:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_6D84;
  v16[3] = &unk_105E8;
  id v6 = a4;
  id v17 = v6;
  unsigned int v7 = objc_retainBlock(v16);
  if (!v4)
  {
    [(WLLockScreenCardsViewController *)self dismissAnimated:1 withCompletion:v7];
    uint64_t v8 = +[BSAnimationSettings settingsWithDuration:](BSAnimationSettings, "settingsWithDuration:");
    goto LABEL_6;
  }
  if (!self->_showCoverSheet || self->_lockScreenView)
  {
    [(WLLockScreenCardsViewController *)self _presentPassesAnimated:1 completion:v7];
    uint64_t v8 = +[BSAnimationSettings settingsWithDuration:0.400000006 delay:0.150000006];
LABEL_6:
    uint64_t v9 = (void *)v8;
    goto LABEL_7;
  }
  id v11 = objc_initWeak(&v15, self);
  double v12 = [(PKAuthorizationCoverSheetViewController *)self->_coverSheetViewController view];
  double v13 = +[UIColor clearColor];
  double v14 = +[UIColor systemGroupedBackgroundColor];
  [(WLLockScreenCardsViewController *)self _animateViewBackgroundColor:v12 from:v13 to:v14 delay:v7 completion:0.150000006];

  [(PKAuthorizationCoverSheetViewController *)self->_coverSheetViewController fadeInUIAnimated:1 performSynchronizedAnimation:0];
  +[PKSpringAnimationFactory defaultDuration];
  uint64_t v9 = +[BSAnimationSettings settingsWithDuration:delay:](BSAnimationSettings, "settingsWithDuration:delay:");
  objc_destroyWeak(&v15);
LABEL_7:

  return v9;
}

- (void)disableIdleTimer
{
  BOOL v3 = SBUIGetUserAgent();
  [v3 setIdleTimerDisabled:1 forReason:@"PassBookPluginShowPass"];

  [(NSTimer *)self->_resetIdleTimerTimer invalidate];
  self->_resetIdleTimerTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"enableIdleTimer" selector:0 userInfo:0 repeats:120.0];

  _objc_release_x1();
}

- (void)enableIdleTimer
{
  [(NSTimer *)self->_resetIdleTimerTimer invalidate];
  resetIdleTimerTimer = self->_resetIdleTimerTimer;
  self->_resetIdleTimerTimer = 0;

  SBUIGetUserAgent();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setIdleTimerDisabled:0 forReason:@"PassBookPluginShowPass"];
}

- (void)updateBacklightWithProgress:(double)a3
{
  float v4 = (1.0 - a3) * 177.219;
  id v5 = SBUIGetUserAgent();
  *(float *)&double v6 = v4;
  [v5 setMinimumBacklightLevel:0 animated:v6];

  [(WLLockScreenCardsViewController *)self enableIdleTimer];
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)openApplication:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  double v6 = self;
  if (v6)
  {
    unsigned int v7 = v6;
    uint64_t v8 = v6;
    while (1)
    {
      uint64_t v9 = [(WLLockScreenCardsViewController *)v8 viewIfLoaded];
      double v10 = [v9 window];

      if (v10) {
        break;
      }
      double v10 = [(WLLockScreenCardsViewController *)v7 presentedViewController];
      if (v8 == v10)
      {

        double v10 = 0;
      }

      uint64_t v8 = v10;
      if (!v10) {
        goto LABEL_11;
      }
    }
    if (v10 == v5)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_7060;
      v11[3] = &unk_10548;
      id v12 = v4;
      [(WLLockScreenCardsViewController *)v7 dismissAnimated:1 withCompletion:v11];

      double v10 = v5;
    }
  }
  else
  {
    uint64_t v8 = 0;
    double v10 = 0;
  }
LABEL_11:
}

- (void)_insertViewControllerIfNeeded:(id)a3
{
  id v7 = a3;
  id v4 = [(WLLockScreenCardsViewController *)self viewIfLoaded];
  if (v4)
  {
    id v5 = [v7 parentViewController];

    if (!v5)
    {
      double v6 = [v7 view];
      [(WLLockScreenCardsViewController *)self addChildViewController:v7];
      [v4 addSubview:v6];
      [v7 didMoveToParentViewController:self];
      [(WLLockScreenCardsViewController *)self setNeedsStatusBarAppearanceUpdate];
      [v4 setNeedsLayout];
      [v4 layoutIfNeeded];
    }
  }
}

- (double)_animateViewBackgroundColor:(id)a3 from:(id)a4 to:(id)a5 delay:(double)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = [v11 layer];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  v16 = [v11 traitCollection];
  v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  v28 = sub_739C;
  id v29 = &unk_10610;
  v31 = &v32;
  id v17 = v13;
  id v30 = v17;
  PKUIPerformWithEffectiveTraitCollection();

  double v18 = +[PKSpringAnimationFactory springAnimationWithKeyPath:@"backgroundColor"];
  [v18 setAdditive:0];
  id v19 = v12;
  objc_msgSend(v18, "setFromValue:", objc_msgSend(v19, "CGColor"));
  [v18 setToValue:v33[3]];
  [v18 setBeginTimeMode:kCAAnimationRelative];
  if (a6 != 0.0) {
    [v18 setBeginTime:a6];
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_73D8;
  v24[3] = &unk_105C0;
  id v20 = v14;
  id v25 = v20;
  objc_msgSend(v18, "pkui_setCompletionHandler:", v24);
  [v15 addAnimation:v18 forKey:@"backgroundColor"];
  CGColorRelease((CGColorRef)v33[3]);
  [v11 setBackgroundColor:v17];
  [v18 duration];
  double v22 = v21;

  _Block_object_dispose(&v32, 8);
  return v22;
}

- (SBLockScreenPluginAgent)pluginAgent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->pluginAgent);

  return (SBLockScreenPluginAgent *)WeakRetained;
}

- (void)setPluginAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->pluginAgent);
  objc_storeStrong((id *)&self->_springAnimationFactory, 0);
  objc_storeStrong((id *)&self->_coverSheetAuthenticator, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
  objc_storeStrong((id *)&self->_lockScreenView, 0);
  objc_storeStrong(&self->_staticGlyphResources, 0);
  objc_storeStrong((id *)&self->_contactlessInterfaceAssertion, 0);
  objc_storeStrong((id *)&self->_notifyPassViewedTimer, 0);
  objc_storeStrong((id *)&self->_resetIdleTimerTimer, 0);
  objc_storeStrong((id *)&self->_diff, 0);
  objc_storeStrong((id *)&self->_cardsByUniqueID, 0);
  objc_storeStrong((id *)&self->_cardUniqueIDs, 0);

  objc_storeStrong((id *)&self->_passLibrary, 0);
}

@end