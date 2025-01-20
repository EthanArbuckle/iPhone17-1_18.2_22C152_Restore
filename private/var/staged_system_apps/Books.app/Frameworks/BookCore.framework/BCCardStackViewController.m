@interface BCCardStackViewController
+ (BOOL)_alwaysUseSlideAnimation;
+ (id)_pendingCardStackViewControllers;
+ (void)appendCardsWithData:(id)a3 fromViewController:(id)a4 identifier:(id)a5 completion:(id)a6;
+ (void)pushCardsWithDataSource:(id)a3 animated:(BOOL)a4 fromViewController:(id)a5;
+ (void)pushCardsWithDataSource:(id)a3 focusedIndex:(unint64_t)a4 animated:(BOOL)a5 fromViewController:(id)a6 completion:(id)a7;
- (BCCardStackConfiguration)configuration;
- (BCCardStackTransitionAnimatorWrapper)pendingWrapper;
- (BCCardStackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BCStatusBarBackgroundController)statusBarBackgroundController;
- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented;
- (BOOL)bc_analyticsVisibilityOfChild:(id)a3;
- (BOOL)ignoreChildStatusBarStyle;
- (BOOL)isTopCardSetViewController:(id)a3;
- (BOOL)presentingViewControllerIsFullScreen;
- (BOOL)scrollCardForFeedOptionsVisible:(id)a3;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)transitionInProgress;
- (CGRect)initialFrame;
- (CGSize)lastLayoutStackSize;
- (Class)cardNavigationControllerForCardSet:(id)a3;
- (NSMapTable)dataSourceMap;
- (NSMapTable)unhideBlocksByCardSet;
- (NSSet)messagesAlreadyDisplayed;
- (UIEdgeInsets)contentInset;
- (UIScrollView)backgroundView;
- (UIViewController)lockedChildForStatusBarStyle;
- (double)toolbarHeight;
- (id)_navigationControllerForViewController:(id)a3;
- (id)_popCardFrontAnimatorForCardSet:(id)a3 cardSetViewControllerToUnfade:(id)a4 duration:(double)a5;
- (id)_pushCardBackAnimatorForCardSet:(id)a3 cardSetViewControllerToFade:(id)a4 duration:(double)a5;
- (id)_pushCardsWithDataSource:(id)a3 focusedIndex:(unint64_t)a4 animated:(BOOL)a5 presentingViewController:(id)a6;
- (id)animationControllerForDismissedController:(id)a3;
- (id)childViewControllerForStatusBarStyle;
- (id)contentViewControllerForCardSet:(id)a3 index:(unint64_t)a4 cardContentScrollManager:(id)a5;
- (id)effectiveAnalyticsTrackerForTopCard;
- (id)im_visibleChildViewControllers;
- (id)keyCommands;
- (id)topCardSetViewController;
- (int64_t)_animationTypeForDismissingCardSetViewController:(id)a3 distanceToCoverSource:(double *)a4;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)_indexOfChildViewControllerToSuspendOrResume;
- (unint64_t)cardCountForCardSet:(id)a3;
- (unint64_t)cardStackDepth;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addAdornmentViewsToParentView:(id)a3;
- (void)_applyCardSetViewController:(id)a3 withTransform:(unint64_t)a4;
- (void)_dismissCardStack:(id)a3;
- (void)_invalidateConfiguration;
- (void)_layoutAdornmentViews;
- (void)_layoutStackByChangingMode:(BOOL)a3 newViewSize:(CGSize)a4;
- (void)_layoutUnderlyingCardSetViewController:(id)a3 animated:(BOOL)a4;
- (void)_popCardsAnimated:(BOOL)a3 popAll:(BOOL)a4 animationType:(int64_t)a5 prefersCrossfade:(BOOL)a6 velocity:(double)a7 reason:(int64_t)a8 completion:(id)a9;
- (void)_popCardsAnimated:(BOOL)a3 popAll:(BOOL)a4 animationType:(int64_t)a5 velocity:(double)a6 completion:(id)a7;
- (void)_resumeAndRebuildChildViewControllerAsNeeded;
- (void)_scaleBackCardSetViewController:(id)a3 shiftUp:(BOOL)a4 cumulative:(BOOL)a5;
- (void)_suspendAndTeardownChildViewControllerAsNeeded;
- (void)_updateStatusBarBackgroundOpacity;
- (void)_updateStatusBarBackgroundOpacityForCardSetViewController:(id)a3;
- (void)cardSetViewController:(id)a3 animatorForExpanding:(id)a4;
- (void)cardSetViewController:(id)a3 animatorForInteractiveDismiss:(id)a4;
- (void)cardSetViewController:(id)a3 animatorForUnexpanding:(id)a4;
- (void)cardSetViewController:(id)a3 didCommitDismissWithVelocity:(double)a4 interactiveAnimator:(id)a5;
- (void)cardSetViewController:(id)a3 prepareForNavigationTransitionWithContext:(id)a4;
- (void)cardSetViewControllerNavigiationTransitionCompleted:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)lockChildForStatusBarStyle;
- (void)notifyAllCardsAboutMessageDisplayed:(id)a3 from:(id)a4;
- (void)popAllCardsAnimated:(BOOL)a3 completion:(id)a4;
- (void)popAllCardsAnimated:(BOOL)a3 prefersCrossfade:(BOOL)a4 completion:(id)a5;
- (void)popCardsAnimated:(BOOL)a3;
- (void)popCardsAnimated:(BOOL)a3 reason:(int64_t)a4;
- (void)presentingViewControllerSafeAreaInsetsDidChange:(id)a3;
- (void)pushCardsWithDataSource:(id)a3 animated:(BOOL)a4;
- (void)pushCardsWithDataSource:(id)a3 focusedIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDataSourceMap:(id)a3;
- (void)setIgnoreChildStatusBarStyle:(BOOL)a3;
- (void)setInitialFrame:(CGRect)a3;
- (void)setLastLayoutStackSize:(CGSize)a3;
- (void)setLockedChildForStatusBarStyle:(id)a3;
- (void)setMessagesAlreadyDisplayed:(id)a3;
- (void)setPendingWrapper:(id)a3;
- (void)setPresentingViewControllerIsFullScreen:(BOOL)a3;
- (void)setStatusBarBackgroundController:(id)a3;
- (void)setToolbarHeight:(double)a3;
- (void)setTransitionInProgress:(BOOL)a3;
- (void)setUnhideBlocksByCardSet:(id)a3;
- (void)unlockChildForStatusBarStyle;
- (void)viewController:(id)a3 didDisplayMessageWithId:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillAppearFromTabChange;
- (void)viewWillDisappearFromTabChange;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BCCardStackViewController

- (BCCardStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)BCCardStackViewController;
  v4 = [(BCCardStackViewController *)&v18 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_presentingViewControllerIsFullScreen = 1;
    uint64_t v6 = +[NSMapTable strongToStrongObjectsMapTable];
    dataSourceMap = v5->_dataSourceMap;
    v5->_dataSourceMap = (NSMapTable *)v6;

    [(BCCardStackViewController *)v5 setModalPresentationStyle:6];
    [(BCCardStackViewController *)v5 setTransitioningDelegate:v5];
    v8 = [[BCLayoutConfigurationEnvironment alloc] initWithViewController:v5];
    v9 = [[BCCardStackConfiguration alloc] initWithEnvironment:v8];
    configuration = v5->_configuration;
    v5->_configuration = v9;

    uint64_t v11 = +[NSMapTable weakToStrongObjectsMapTable];
    unhideBlocksByCardSet = v5->_unhideBlocksByCardSet;
    v5->_unhideBlocksByCardSet = (NSMapTable *)v11;

    v5->_ignoreChildStatusBarStyle = 0;
    [(BCCardStackViewController *)v5 bc_setNavBarVisible:0];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v15 = dispatch_queue_create("BCCardStackViewController.transitionSetupQueue", v14);
    transitionSetupQueue = v5->_transitionSetupQueue;
    v5->_transitionSetupQueue = (OS_dispatch_queue *)v15;
  }
  return v5;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)BCCardStackViewController;
  [(BCCardStackViewController *)&v20 viewDidLoad];
  v3 = [BCCardStackBarBackgroundContainingView alloc];
  v4 = [(BCCardStackViewController *)self statusBarBackgroundController];
  v5 = [(BCCardStackBarBackgroundContainingView *)v3 initWithStatusBarBackgroundController:v4];

  [(BCCardStackViewController *)self initialFrame];
  -[BCCardStackBarBackgroundContainingView setFrame:](v5, "setFrame:");
  uint64_t v6 = [(BCCardStackViewController *)self view];
  -[BCCardStackBarBackgroundContainingView setAutoresizingMask:](v5, "setAutoresizingMask:", [v6 autoresizingMask]);

  [(BCCardStackViewController *)self setView:v5];
  v7 = +[UIColor clearColor];
  v8 = [(BCCardStackViewController *)self view];
  [v8 setBackgroundColor:v7];

  id v9 = objc_alloc((Class)UIScrollView);
  v10 = [(BCCardStackViewController *)self view];
  [v10 bounds];
  uint64_t v11 = (UIScrollView *)[v9 initWithFrame:];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v11;

  [(UIScrollView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_backgroundView setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)self->_backgroundView setAlpha:0.0];
  v13 = +[UIColor colorWithWhite:0.0 alpha:0.7];
  [(UIScrollView *)self->_backgroundView setBackgroundColor:v13];

  v14 = [(BCCardStackViewController *)self view];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;

  -[UIScrollView setContentSize:](self->_backgroundView, "setContentSize:", v16, v18 + 100.0);
  -[UIScrollView setContentOffset:](self->_backgroundView, "setContentOffset:", 0.0, 100.0);
  [(UIScrollView *)self->_backgroundView setDelegate:self];
  v19 = [(BCCardStackViewController *)self view];
  [(BCCardStackViewController *)self _addAdornmentViewsToParentView:v19];

  [(BCCardStackViewController *)self setModalPresentationCapturesStatusBarAppearance:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BCCardStackViewController;
  [(BCCardStackViewController *)&v4 viewWillAppear:a3];
  [(BCCardStackViewController *)self _updateStatusBarBackgroundOpacity];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BCCardStackViewController;
  [(BCCardStackViewController *)&v8 viewDidAppear:a3];
  UIAccessibilityNotifications v4 = UIAccessibilityLayoutChangedNotification;
  v5 = [(BCCardStackViewController *)self topCardSetViewController];
  uint64_t v6 = [v5 currentCardViewController];
  v7 = [v6 auxiliaryNavigationBarView];
  UIAccessibilityPostNotification(v4, v7);
}

- (BCStatusBarBackgroundController)statusBarBackgroundController
{
  return self->_statusBarBackgroundController;
}

- (int64_t)preferredStatusBarStyle
{
  if (!_os_feature_enabled_impl()) {
    return 1;
  }
  v3 = [(BCCardStackViewController *)self configuration];
  int64_t v4 = [v3 cardsCanExpand] ^ 1;

  return v4;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (isPad()) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)lockChildForStatusBarStyle
{
  id v3 = [(BCCardStackViewController *)self childViewControllerForStatusBarStyle];
  [(BCCardStackViewController *)self setLockedChildForStatusBarStyle:v3];
}

- (void)unlockChildForStatusBarStyle
{
}

- (id)childViewControllerForStatusBarStyle
{
  if ([(BCCardStackViewController *)self ignoreChildStatusBarStyle])
  {
    id v3 = 0;
  }
  else
  {
    int64_t v4 = [(BCCardStackViewController *)self lockedChildForStatusBarStyle];

    if (v4)
    {
      id v3 = [(BCCardStackViewController *)self lockedChildForStatusBarStyle];
    }
    else
    {
      v5 = [(BCCardStackViewController *)self childViewControllers];
      uint64_t v6 = [v5 lastObject];

      if ([v6 expanded]) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
      id v3 = v7;
    }
  }

  return v3;
}

- (void)_invalidateConfiguration
{
  id v3 = [(BCCardStackViewController *)self configuration];
  unsigned int v4 = [v3 cardsCanExpand];

  v5 = [(BCCardStackViewController *)self configuration];
  [v5 invalidate];

  uint64_t v6 = [(BCCardStackViewController *)self configuration];
  uint64_t v7 = v4 ^ [v6 cardsCanExpand];

  id v10 = [(BCCardStackViewController *)self view];
  [v10 bounds];
  -[BCCardStackViewController _layoutStackByChangingMode:newViewSize:](self, "_layoutStackByChangingMode:newViewSize:", v7, v8, v9);
}

- (void)viewWillAppearFromTabChange
{
  [(BCCardStackViewController *)self _invalidateConfiguration];
  id v3 = [(BCCardStackViewController *)self childViewControllers];
  id v5 = [v3 lastObject];

  [v5 resumeAndRebuildForReason:@"card stack: card set will appear from tab change"];
  [(BCCardStackViewController *)self _updateStatusBarBackgroundOpacity];
  unsigned int v4 = [(BCCardStackViewController *)self statusBarBackgroundController];
  [v4 updateParentViewOfCardStackBackgroundViewWithParentViewController:self];
}

- (void)viewWillDisappearFromTabChange
{
  id v2 = [(BCCardStackViewController *)self statusBarBackgroundController];
  [v2 setOpacity:0.0];
}

- (void)presentingViewControllerSafeAreaInsetsDidChange:(id)a3
{
  unsigned int v4 = [a3 view];
  [v4 safeAreaInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  int v11 = isPad();
  double v12 = 0.0;
  if (v11) {
    double v12 = 22.0;
  }

  -[BCCardStackViewController setContentInset:](self, "setContentInset:", 0.0, v6, v8 + v12, v10);
}

- (void)viewWillLayoutSubviews
{
  id v3 = [(BCCardStackViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if (!self->_transitionInProgress
    && (self->_lastLayoutStackSize.width != v5 || self->_lastLayoutStackSize.height != v7))
  {
    self->_lastLayoutStackSize.width = v5;
    self->_lastLayoutStackSize.height = v7;
    double v9 = [(BCCardStackViewController *)self configuration];
    unsigned int v10 = [v9 cardsCanExpand];

    int v11 = [(BCCardStackViewController *)self configuration];
    [v11 invalidate];

    double v12 = [(BCCardStackViewController *)self configuration];
    uint64_t v13 = v10 ^ [v12 cardsCanExpand];

    -[BCCardStackViewController _layoutStackByChangingMode:newViewSize:](self, "_layoutStackByChangingMode:newViewSize:", v13, v5, v7);
  }
  v14.receiver = self;
  v14.super_class = (Class)BCCardStackViewController;
  [(BCCardStackViewController *)&v14 viewWillLayoutSubviews];
}

- (BOOL)scrollCardForFeedOptionsVisible:(id)a3
{
  id v4 = a3;
  double v5 = [(BCCardStackViewController *)self childViewControllers];
  double v6 = [v5 lastObject];

  if (v6)
  {
    double v7 = [(BCCardStackViewController *)self dataSourceMap];
    double v8 = [v7 objectForKeyedSubscript:v6];

    id v9 = [v8 cardIndexForFeedOptions:v4];
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v10 = 0;
    }
    else
    {
      unint64_t v11 = (unint64_t)v9;
      double v12 = (char *)[v6 focusedIndex];
      uint64_t v13 = [(BCCardStackViewController *)self configuration];
      if ([v13 cardsCanExpand])
      {
        objc_super v14 = [v6 currentCardViewController];
        unsigned int v15 = [v14 itemPushedOnCard];
      }
      else
      {
        unsigned int v15 = 0;
      }

      double v16 = [(BCCardStackViewController *)self configuration];
      unsigned int v17 = 0;
      if ([v16 cardsCanExpand] && (char *)v11 != v12)
      {
        double v18 = [v6 currentCardViewController];
        unsigned int v17 = [v18 expanded];
      }
      unsigned __int8 v19 = [v6 itemPushedOnCardAtIndex:v11];
      BOOL v10 = 0;
      if (((v15 | v17) & 1) == 0
        && (v19 & 1) == 0
        && v11 >= (unint64_t)(v12 - 1)
        && v11 <= (unint64_t)(v12 + 1))
      {
        [v6 clearSavedContentOffsetsForCardAtIndex:v11];
        BOOL v10 = 1;
        [v6 setFocusedIndex:v11 animated:1];
        [v6 scrollToTopCardAtIndex:v11 animated:1];
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v17.receiver = self;
  v17.super_class = (Class)BCCardStackViewController;
  id v7 = a4;
  -[BCCardStackViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  double v8 = BCCardModelLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v22.double width = width;
    v22.double height = height;
    id v9 = NSStringFromCGSize(v22);
    BOOL v10 = [(BCCardStackViewController *)self view];
    [v10 size];
    unint64_t v11 = NSStringFromCGSize(v23);
    *(_DWORD *)buf = 138412546;
    unsigned __int8 v19 = v9;
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_INFO, "BCCardStack viewWillTransitionToSize: %@ from: %@", buf, 0x16u);
  }
  double v12 = [(BCCardStackViewController *)self configuration];
  unsigned __int8 v13 = [v12 cardsCanExpand];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_30BB8;
  v15[3] = &unk_2C4BD8;
  *(double *)&v15[5] = width;
  *(double *)&v15[6] = height;
  v15[4] = self;
  unsigned __int8 v16 = v13;
  [v7 animateAlongsideTransition:v15 completion:&stru_2C4BF8];

  objc_super v14 = [(BCCardStackViewController *)self configuration];
  [v14 invalidate];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    unint64_t v11 = BCCardModelLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      objc_super v14 = self;
      _os_log_impl(&def_7D91C, v11, OS_LOG_TYPE_INFO, "contentInset updated on BCCardStackViewController: %@", (uint8_t *)&v13, 0xCu);
    }

    double v12 = [(BCCardStackViewController *)self topCardSetViewController];
    [v12 setContentInset:top, left, bottom, right];
  }
}

- (void)setToolbarHeight:(double)a3
{
  if (self->_toolbarHeight != a3)
  {
    self->_toolbarHeight = a3;
    double v5 = [(BCCardStackViewController *)self presentedViewController];
    [v5 additionalSafeAreaInsets];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    double v12 = [(BCCardStackViewController *)self presentedViewController];
    [v12 setAdditionalSafeAreaInsets:a3, v7, v9, v11];

    int v13 = [(BCCardStackViewController *)self configuration];
    [v13 setToolbarHeight:a3];

    if (![(BCCardStackViewController *)self transitionInProgress])
    {
      id v16 = [(BCCardStackViewController *)self view];
      [v16 bounds];
      -[BCCardStackViewController _layoutStackByChangingMode:newViewSize:](self, "_layoutStackByChangingMode:newViewSize:", 1, v14, v15);
    }
  }
}

- (unint64_t)cardStackDepth
{
  id v2 = [(BCCardStackViewController *)self dataSourceMap];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

+ (void)pushCardsWithDataSource:(id)a3 animated:(BOOL)a4 fromViewController:(id)a5
{
}

+ (id)_pendingCardStackViewControllers
{
  if (qword_3455A0 != -1) {
    dispatch_once(&qword_3455A0, &stru_2C4C18);
  }
  id v2 = (void *)qword_345598;

  return v2;
}

+ (void)pushCardsWithDataSource:(id)a3 focusedIndex:(unint64_t)a4 animated:(BOOL)a5 fromViewController:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a7;
  int v13 = [a6 bc_effectiveCardPresentingViewController];
  double v14 = [v13 presentingViewController];

  if (v14)
  {
    double v15 = [v13 presentingViewController];
    id v16 = [v15 presentedViewController];
    objc_super v17 = (char *)[v16 modalPresentationStyle];

    BOOL v18 = (unint64_t)(v17 - 3) < 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    BOOL v18 = 1;
  }
  unsigned __int8 v19 = [v13 view];
  __int16 v20 = [v19 window];
  v21 = [v20 firstResponder];
  [v21 resignFirstResponder];

  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = sub_31564;
  v60 = sub_31574;
  id v61 = [v13 cardStackViewController];
  CGSize v22 = (void *)v57[5];
  if (!v22)
  {
    uint64_t v23 = [v13 bc_firstVisibleChildViewControllerOfClass:objc_opt_class() includePresented:1];
    v24 = (void *)v57[5];
    v57[5] = v23;

    CGSize v22 = (void *)v57[5];
  }
  if (v22) {
    v25 = v22;
  }
  else {
    v25 = v13;
  }
  [v25 bc_dismissIfSafeAnimated:0];
  v26 = (void *)v57[5];
  if (v26)
  {
    if ([v26 transitionInProgress])
    {
      v27 = BCCardModelLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&def_7D91C, v27, OS_LOG_TYPE_INFO, "Failed to push cards - the existing BCCardStackViewController has a transition in progress", v44, 2u);
      }

      id v28 = objc_retainBlock(v12);
      v29 = v28;
      if (v28) {
        (*((void (**)(id))v28 + 2))(v28);
      }
      goto LABEL_34;
    }
    if ([v11 numberOfCards:v57[5]] == (char *)&def_7D91C + 1)
    {
      objc_opt_class();
      v35 = [v11 representedObjectForCardAtIndex:0];
      v36 = BUDynamicCast();

      if ([v11 alwaysPresentNewCardSetForFeedOptions:v36])
      {
      }
      else
      {
        unsigned __int8 v42 = [(id)v57[5] scrollCardForFeedOptionsVisible:v36];

        if (v42) {
          goto LABEL_29;
        }
      }
    }
    [(id)v57[5] pushCardsWithDataSource:v11 focusedIndex:a4 animated:v9];
LABEL_29:
    id v43 = objc_retainBlock(v12);
    v29 = v43;
    if (v43) {
      (*((void (**)(id))v43 + 2))(v43);
    }
    goto LABEL_34;
  }
  v29 = +[BCCardStackViewController _pendingCardStackViewControllers];
  uint64_t v30 = [v29 objectForKeyedSubscript:v13];
  v31 = (void *)v57[5];
  v57[5] = v30;

  if (v57[5])
  {
    v32 = BCCardModelLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v44 = 0;
      _os_log_impl(&def_7D91C, v32, OS_LOG_TYPE_INFO, "Failed to push cards - a pending BCCardStackViewController exists", v44, 2u);
    }

    id v33 = objc_retainBlock(v12);
    v34 = v33;
    if (v33) {
      (*((void (**)(id))v33 + 2))(v33);
    }
  }
  else
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_3157C;
    v47[3] = &unk_2C4C90;
    v52 = &v56;
    id v37 = v13;
    id v48 = v37;
    BOOL v54 = v18;
    id v49 = v11;
    unint64_t v53 = a4;
    BOOL v55 = v9;
    id v50 = v29;
    id v51 = v12;
    v38 = objc_retainBlock(v47);
    if (isPhone())
    {
      objc_opt_class();
      v39 = [v37 bc_windowForViewController];
      v40 = [v39 windowScene];
      v41 = BUDynamicCast();

      if (v41)
      {
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_31984;
        v45[3] = &unk_2C4430;
        v46 = v38;
        [v41 attemptRotateToPortraitWithCompletion:v45];
      }
    }
    else
    {
      ((void (*)(void *))v38[2])(v38);
    }

    v34 = v48;
  }

LABEL_34:
  _Block_object_dispose(&v56, 8);
}

- (void)pushCardsWithDataSource:(id)a3 animated:(BOOL)a4
{
}

- (void)pushCardsWithDataSource:(id)a3 focusedIndex:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  BOOL v9 = [(BCCardStackViewController *)self presentingViewController];
  id v10 = [(BCCardStackViewController *)self _pushCardsWithDataSource:v8 focusedIndex:a4 animated:v5 presentingViewController:v9];

  [v10 waitUntilReadyThenAnimate];
}

+ (void)appendCardsWithData:(id)a3 fromViewController:(id)a4 identifier:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [a4 bc_effectiveCardPresentingViewController];
  int v13 = [v12 cardStackViewController];
  if (!v13)
  {
    int v13 = [v12 bc_firstVisibleChildViewControllerOfClass:objc_opt_class() includePresented:1];
  }
  double v14 = [v13 childViewControllers];
  double v15 = [v14 objectAtIndexedSubscript:0];

  id v16 = [v13 dataSourceMap];
  objc_super v17 = [v16 objectForKeyedSubscript:v15];

  BOOL v18 = [v17 identifier];
  if (([v10 length] || objc_msgSend(v18, "length"))
    && ([v18 isEqualToString:v10] & 1) == 0)
  {
  }
  else if (v13)
  {
    [v17 appendNewDataToExistingDataSource:v9 cardStackViewController:v13];
    [v15 updateWithAppendedCards];
    id v19 = objc_retainBlock(v11);
    __int16 v20 = v19;
    if (v19) {
      (*((void (**)(id))v19 + 2))(v19);
    }

    goto LABEL_15;
  }
  v21 = BCCardModelLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_1EA83C();
  }

  id v22 = objc_retainBlock(v11);
  int v13 = v22;
  if (v22) {
    (*((void (**)(id))v22 + 2))(v22);
  }
LABEL_15:
}

- (void)popCardsAnimated:(BOOL)a3
{
}

- (void)popCardsAnimated:(BOOL)a3 reason:(int64_t)a4
{
  BOOL v5 = a3;
  double v7 = [(BCCardStackViewController *)self childViewControllers];
  id v8 = [v7 lastObject];
  int64_t v9 = [(BCCardStackViewController *)self _animationTypeForDismissingCardSetViewController:v8 distanceToCoverSource:0];

  [(BCCardStackViewController *)self _popCardsAnimated:v5 popAll:0 animationType:v9 prefersCrossfade:0 velocity:a4 reason:0 completion:0.0];
}

- (void)popAllCardsAnimated:(BOOL)a3 prefersCrossfade:(BOOL)a4 completion:(id)a5
{
}

- (void)popAllCardsAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)_popCardsAnimated:(BOOL)a3 popAll:(BOOL)a4 animationType:(int64_t)a5 velocity:(double)a6 completion:(id)a7
{
}

- (void)_popCardsAnimated:(BOOL)a3 popAll:(BOOL)a4 animationType:(int64_t)a5 prefersCrossfade:(BOOL)a6 velocity:(double)a7 reason:(int64_t)a8 completion:(id)a9
{
  BOOL v11 = a6;
  BOOL v13 = a4;
  BOOL v14 = a3;
  id v16 = a9;
  if (self->_transitionInProgress)
  {
    objc_super v17 = BCCardModelLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1EA8B0();
    }
  }
  else
  {
    BOOL v18 = [(BCCardStackViewController *)self dataSourceMap];
    id v19 = [v18 count];

    if (v19)
    {
      int64_t v105 = a8;
      v113 = v16;
      [(BCCardStackViewController *)self _resumeAndRebuildChildViewControllerAsNeeded];
      self->_transitionInProgress = 1;
      __int16 v20 = [(BCCardStackViewController *)self childViewControllers];
      int v21 = [v20 count] == (char *)&def_7D91C + 1 || v13;
      unsigned int v115 = v21;

      if (v13) {
        int64_t v22 = 2;
      }
      else {
        int64_t v22 = a5;
      }
      uint64_t v23 = [(BCCardStackViewController *)self childViewControllers];
      v24 = [v23 lastObject];

      v25 = [(BCCardStackViewController *)self childViewControllers];
      BOOL v108 = v13;
      BOOL v109 = v14;
      if ((unint64_t)[v25 count] < 2)
      {
        uint64_t v28 = 0;
      }
      else
      {
        v26 = [(BCCardStackViewController *)self childViewControllers];
        v27 = [(BCCardStackViewController *)self childViewControllers];
        uint64_t v28 = [v26 objectAtIndexedSubscript:[v27 count] - 2];
      }
      v114 = (void *)v28;
      if (v115) {
        v29 = 0;
      }
      else {
        v29 = (void *)v28;
      }
      id v30 = v29;
      [v30 setLastNavigationType:0];
      v31 = [(BCCardStackViewController *)self presentingViewController];
      v32 = +[BCCardStackCoverSourceController coverHostFromPresentingViewController:v31 previousCardSetViewController:v30];

      objc_opt_class();
      id v33 = [(BCCardStackViewController *)self presentingViewController];
      v106 = BUDynamicCast();

      if (v115)
      {
        v34 = [(BCCardStackViewController *)self childViewControllers];
        id v35 = [v34 objectAtIndexedSubscript:0];
      }
      else
      {
        id v35 = v24;
      }
      v36 = [(BCCardStackViewController *)self dataSourceMap];
      id v37 = [v36 objectForKeyedSubscript:v35];

      v104 = v35;
      id v38 = [v35 focusedIndex];
      [v24 prepareForDismiss];
      [v24 willMoveToParentViewController:0];
      v39 = [[BCCardStackCoverSourceController alloc] initWithCardStackViewController:self isDismiss:1 cardSetViewController:v24 focusedIndex:v38 coverHost:v32 dataSource:v37];
      [(BCCardStackCoverSourceController *)v39 setIsDismissingCardStack:v115];
      [(BCCardStackCoverSourceController *)v39 setPreferSlideForDismiss:v22 == 2];
      if (v30) {
        uint64_t v40 = [v30 expanded] ^ 1;
      }
      else {
        uint64_t v40 = 0;
      }
      [(BCCardStackCoverSourceController *)v39 setCoversNeedClipping:v40];
      if (v115) {
        v41 = v114;
      }
      else {
        v41 = 0;
      }
      [(BCCardStackCoverSourceController *)v39 setUnderlyingCardSetViewController:v41];
      v152[0] = _NSConcreteStackBlock;
      v152[1] = 3221225472;
      v152[2] = sub_32AC4;
      v152[3] = &unk_2C4CB8;
      id v155 = v38;
      id v103 = v37;
      id v153 = v103;
      id v112 = v32;
      id v154 = v112;
      v150[0] = _NSConcreteStackBlock;
      v150[1] = 3221225472;
      v150[2] = sub_32ADC;
      v150[3] = &unk_2C3C50;
      unsigned __int8 v42 = v39;
      v151 = v42;
      long long v43 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)location = *(_OWORD *)&CGAffineTransformIdentity.a;
      long long v148 = v43;
      long long v149 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [(BCCardStackCoverSourceController *)v42 prepareForCoverSourceCapturingWithToViewController:v30 toViewTransform:location revealCoverBlock:v152 captureCoverFrameBlock:v150];
      if ([(BCCardStackCoverSourceController *)v42 canUseCoverTransition]) {
        uint64_t v44 = v22;
      }
      else {
        uint64_t v44 = 2;
      }
      v45 = [BCCardStackTransitionAnimator alloc];
      v46 = [(BCCardStackViewController *)self configuration];
      v47 = -[BCCardStackTransitionAnimator initWithType:allowsCardExpansion:](v45, "initWithType:allowsCardExpansion:", v44, [v46 cardsCanExpand]);

      [(BCCardStackTransitionAnimator *)v47 setPrefersCrossfade:v11];
      [(BCCardStackTransitionAnimator *)v47 setVelocityForPop:a7];
      if (v44 == 3)
      {
        id v48 = [(BCCardStackCoverSourceController *)v42 rangeRequiringCards];
        [v24 beginTransitionUpdateModeForCardsAtRange:v48, v49];
        [(BCCardStackCoverSourceController *)v42 performSecondHalfOfProcessing];
        id v50 = [(BCCardStackCoverSourceController *)v42 coverMoveItems];
        [(BCCardStackTransitionAnimator *)v47 setCoverMoveItems:v50];

        id v51 = [(BCCardStackCoverSourceController *)v42 cardMoveItems];
        [(BCCardStackTransitionAnimator *)v47 setCardMoveItems:v51];
      }
      else
      {
        [(BCCardStackCoverSourceController *)v42 performSecondHalfOfProcessing];
        id v51 = [(BCCardStackCoverSourceController *)v42 cardSlideItems];
        [(BCCardStackTransitionAnimator *)v47 setCardSlideItems:v51];
      }

      v52 = [(BCCardStackCoverSourceController *)v42 coverFadeItems];
      [(BCCardStackTransitionAnimator *)v47 setCoverFadeItems:v52];

      unint64_t v53 = (char *)[v24 visibleCardRange];
      uint64_t v55 = v54;
      uint64_t v56 = +[NSMutableArray arrayWithCapacity:v54];
      if (v53 < &v53[v55])
      {
        do
        {
          v57 = [v24 cardViewControllerAtIndex:v53];
          uint64_t v58 = [v57 transitioningCardContent];

          if (v58) {
            [v56 addObject:v58];
          }

          ++v53;
          --v55;
        }
        while (v55);
      }
      v144[0] = _NSConcreteStackBlock;
      v144[1] = 3221225472;
      v144[2] = sub_32AE4;
      v144[3] = &unk_2C4CE0;
      id v59 = v56;
      id v145 = v59;
      v60 = v42;
      v146 = v60;
      v111 = objc_retainBlock(v144);
      v142[0] = _NSConcreteStackBlock;
      v142[1] = 3221225472;
      v142[2] = sub_32C18;
      v142[3] = &unk_2C3C50;
      id v61 = v60;
      v143 = v61;
      v110 = objc_retainBlock(v142);
      v62 = [[BCCardStackTransitionContext alloc] initWithFromViewController:v24 toViewController:v30 push:0];
      [(BCCardStackTransitionContext *)v62 setAnimated:v109];
      [(BCCardStackTransitionContext *)v62 setInteractive:0];
      v63 = [(BCCardStackViewController *)self backgroundView];
      [(BCCardStackTransitionContext *)v62 setBackgroundView:v63];

      v64 = [v112 containerViewForHostingCoversDuringAnimation];
      [(BCCardStackTransitionContext *)v62 setInnerContainerView:v64];

      objc_initWeak(location, self);
      v131[0] = _NSConcreteStackBlock;
      v131[1] = 3221225472;
      v131[2] = sub_32C20;
      v131[3] = &unk_2C4D08;
      objc_copyWeak(&v140, location);
      id v101 = v59;
      id v132 = v101;
      v102 = v61;
      v133 = v102;
      objc_super v17 = v24;
      v134 = v17;
      id v65 = v30;
      id v135 = v65;
      v136 = self;
      id v66 = v106;
      id v137 = v66;
      v67 = v47;
      v138 = v67;
      BOOL v141 = v108;
      id v100 = v113;
      id v139 = v100;
      [(BCCardStackTransitionContext *)v62 setCompletionBlock:v131];
      v128[0] = _NSConcreteStackBlock;
      v128[1] = 3221225472;
      v128[2] = sub_32E90;
      v128[3] = &unk_2C4D30;
      objc_copyWeak(&v130, location);
      id v68 = v65;
      id v129 = v68;
      [(BCCardStackTransitionAnimator *)v67 addAnimations:v128];
      v107 = v66;
      v69 = [(BCCardStackViewController *)self configuration];
      LOBYTE(v66) = [v69 cardsCanExpand] | v115;

      if ((v66 & 1) == 0)
      {
        v70 = [(BCCardStackViewController *)self childViewControllers];
        id v71 = [v70 count];

        if ((unint64_t)v71 < 3)
        {
          v74 = 0;
        }
        else
        {
          v72 = [(BCCardStackViewController *)self childViewControllers];
          v73 = [(BCCardStackViewController *)self childViewControllers];
          v74 = [v72 objectAtIndexedSubscript:[v73 count] - 3];

          v75 = [v68 view];
          v76 = [v75 superview];
          v77 = [v74 view];
          v78 = [v68 view];
          [v76 insertSubview:v77 belowSubview:v78];

          v79 = [v74 view];
          [v79 setHidden:0];

          v80 = [v68 view];
          v81 = v80;
          if (v80)
          {
            [v80 transform];
          }
          else
          {
            long long v126 = 0u;
            long long v127 = 0u;
            long long v125 = 0u;
          }
          v82 = [v74 view];
          v124[0] = v125;
          v124[1] = v126;
          v124[2] = v127;
          [v82 setTransform:v124];

          v83 = [v68 view];
          [v83 center];
          double v85 = v84;
          double v87 = v86;
          v88 = [v74 view];
          [v88 setCenter:v85, v87];

          [(BCCardStackViewController *)self _applyCardSetViewController:v74 withTransform:1];
        }
        v121[0] = _NSConcreteStackBlock;
        v121[1] = 3221225472;
        v121[2] = sub_32F00;
        v121[3] = &unk_2C4D58;
        v121[4] = self;
        id v122 = v68;
        id v89 = v74;
        id v123 = v89;
        [(BCCardStackTransitionAnimator *)v67 addAnimations:v121];
      }
      [v17 currentCardViewController];
      v119[0] = _NSConcreteStackBlock;
      v119[1] = 3221225472;
      v119[2] = sub_32F4C;
      v119[3] = &unk_2C4D80;
      id v90 = (id)objc_claimAutoreleasedReturnValue();
      id v120 = v90;
      [(BCCardStackTransitionAnimator *)v67 addAnimations:v119];
      v91 = [(BCCardStackViewController *)self dataSourceMap];
      [v91 setObject:0 forKeyedSubscript:v17];

      [v17 setDataSource:0];
      [v17 setDelegate:0];
      v92 = [v17 currentCardViewController];
      v93 = [v92 topContentViewController];
      v94 = BUProtocolCast();

      if (v114)
      {
        v95 = [v114 currentCardViewController];
        v96 = [v95 topContentViewController];
      }
      else
      {
        v96 = [(BCCardStackViewController *)self presentingViewController];
      }
      [v94 cardStackViewController:self parentCardWillDismissWithReason:v105 targetViewController:v96];
      v97 = [[BCCardStackTransitionAnimatorWrapper alloc] initWithAnimator:v67 context:v62 waitUntilReadyBlock:v111 setupBeforeAnimationBlock:v110];
      v98 = v97;
      if (v115)
      {
        [(BCCardStackViewController *)self setPendingWrapper:v97];
        v99 = [(BCCardStackViewController *)self pendingWrapper];
        v116[0] = _NSConcreteStackBlock;
        v116[1] = 3221225472;
        v116[2] = sub_33050;
        v116[3] = &unk_2C4000;
        objc_copyWeak(&v118, location);
        id v117 = v100;
        [v99 waitUntilReady:v116];

        objc_destroyWeak(&v118);
      }
      else
      {
        [(BCCardStackTransitionAnimatorWrapper *)v97 waitUntilReadyThenAnimate];
      }

      objc_destroyWeak(&v130);
      objc_destroyWeak(&v140);
      objc_destroyWeak(location);

      id v16 = v113;
    }
    else
    {
      objc_super v17 = BCCardModelLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_1EA87C();
      }
    }
  }
}

- (void)_layoutStackByChangingMode:(BOOL)a3 newViewSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  BOOL v6 = a3;
  id v8 = [(BCCardStackViewController *)self childViewControllers];
  int64_t v9 = (char *)[v8 count];

  id v10 = [(BCCardStackViewController *)self childViewControllers];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_33678;
  v45[3] = &unk_2C4DC8;
  *(CGFloat *)&void v45[4] = width;
  *(CGFloat *)&v45[5] = height;
  BOOL v46 = v6;
  [v10 enumerateObjectsWithOptions:2 usingBlock:v45];

  BOOL v11 = [(BCCardStackViewController *)self childViewControllers];
  id v12 = [v11 count];

  if ((unint64_t)v12 >= 2)
  {
    BOOL v13 = [(BCCardStackViewController *)self configuration];
    unsigned __int8 v14 = [v13 cardsCanExpand];

    if (v14)
    {
      if (!v6) {
        goto LABEL_14;
      }
      double v15 = [(BCCardStackViewController *)self childViewControllers];
      id v16 = v9 - 2;
      objc_super v17 = [v15 objectAtIndexedSubscript:v9 - 2];

      [v17 setCovered:0 animated:0 duration:0.0];
      BOOL v18 = [v17 view];
      id v19 = [v18 superview];

      if (v16)
      {
        for (i = 0; i != v16; ++i)
        {
          int v21 = [(BCCardStackViewController *)self childViewControllers];
          int64_t v22 = [v21 objectAtIndexedSubscript:i];

          [v22 setCovered:0 animated:0 duration:0.0];
          uint64_t v23 = [v22 view];
          [v23 setAlpha:1.0];

          v24 = [v22 view];
          [v24 setHidden:0];

          v25 = [v22 view];
          v26 = [v17 view];
          [v19 insertSubview:v25 belowSubview:v26];
        }
      }
    }
    else
    {
      v27 = [(BCCardStackViewController *)self childViewControllers];
      uint64_t v28 = v9 - 2;
      objc_super v17 = [v27 objectAtIndexedSubscript:v9 - 2];

      [(BCCardStackViewController *)self _applyCardSetViewController:v17 withTransform:1];
      [v17 setCovered:1 animated:0 duration:0.0];
      if (v6)
      {
        v29 = [(BCCardStackViewController *)self childViewControllers];
        id v30 = [v29 count];

        if ((unint64_t)v30 >= 3)
        {
          if (v28)
          {
            for (j = 0; j != v28; ++j)
            {
              v32 = [(BCCardStackViewController *)self childViewControllers];
              id v33 = [v32 objectAtIndexedSubscript:j];

              [v33 setCovered:1 animated:0 duration:0.0];
              v34 = [v33 view];
              [v34 setAlpha:0.0];

              id v35 = [v33 view];
              [v35 removeFromSuperview];
            }
          }
        }
      }
    }
  }
LABEL_14:
  objc_opt_class();
  v36 = [(BCCardStackViewController *)self childViewControllers];
  id v37 = [v36 lastObject];
  id v38 = BUDynamicCast();

  if (v6)
  {
    v39 = [(BCCardStackViewController *)self configuration];
    double v40 = 0.0;
    if ([v39 cardsCanExpand])
    {
      unsigned int v41 = [v38 expanded];

      if (!v41)
      {
LABEL_19:
        uint64_t v44 = [(BCCardStackViewController *)self statusBarBackgroundController];
        [v44 setOpacity:v40];

        [(BCCardStackViewController *)self setNeedsStatusBarAppearanceUpdate];
        [(BCCardStackViewController *)self _layoutAdornmentViews];
        goto LABEL_20;
      }
      v39 = [v38 currentCardViewController];
      unsigned __int8 v42 = [v39 currentState];
      [v42 cardViewControllerStatusBarBackgroundOpacity:v39];
      double v40 = v43;
    }
    goto LABEL_19;
  }
LABEL_20:
}

- (void)_layoutAdornmentViews
{
  id v3 = [(BCCardStackViewController *)self backgroundView];
  [v3 removeFromSuperview];

  id v4 = [(BCCardStackViewController *)self configuration];
  unsigned __int8 v5 = [v4 cardsCanExpand];

  if ((v5 & 1) == 0)
  {
    v25 = [(BCCardStackViewController *)self view];
    v26 = [(BCCardStackViewController *)self backgroundView];
    [v25 insertSubview:v26 atIndex:0];

    id v8 = [(BCCardStackViewController *)self backgroundView];
    v24 = [v8 leftAnchor];
    double v40 = [(BCCardStackViewController *)self view];
    v39 = [v40 leftAnchor];
    id v38 = [v24 constraintEqualToAnchor:];
    v42[0] = v38;
    id v37 = [(BCCardStackViewController *)self backgroundView];
    v27 = [v37 rightAnchor];
    id v35 = [(BCCardStackViewController *)self view];
    [v35 rightAnchor];
    v34 = v36 = v27;
    id v33 = [v27 constraintEqualToAnchor:];
    v42[1] = v33;
    v32 = [(BCCardStackViewController *)self backgroundView];
    uint64_t v28 = [v32 topAnchor];
    id v30 = [(BCCardStackViewController *)self view];
    unsigned __int8 v14 = [v30 topAnchor];
    v31 = v28;
    double v15 = [v28 constraintEqualToAnchor:v14];
    v42[2] = v15;
    id v16 = [(BCCardStackViewController *)self backgroundView];
    objc_super v17 = [v16 bottomAnchor];
    BOOL v18 = [(BCCardStackViewController *)self view];
    id v19 = [v18 bottomAnchor];
    __int16 v20 = [v17 constraintEqualToAnchor:v19];
    v42[3] = v20;
    int v21 = +[NSArray arrayWithObjects:v42 count:4];
    +[NSLayoutConstraint activateConstraints:v21];
    goto LABEL_5;
  }
  BOOL v6 = [(BCCardStackViewController *)self childViewControllers];
  double v7 = [v6 lastObject];
  id v8 = [v7 view];

  if (v8)
  {
    int64_t v9 = [(BCCardStackViewController *)self view];
    id v10 = [(BCCardStackViewController *)self backgroundView];
    [v9 insertSubview:v10 belowSubview:v8];

    v29 = [(BCCardStackViewController *)self backgroundView];
    BOOL v11 = [v29 leftAnchor];
    v39 = [(BCCardStackViewController *)self view];
    [v39 leftAnchor];
    id v38 = v40 = v11;
    id v37 = [v11 constraintEqualToAnchor:];
    v41[0] = v37;
    v36 = [(BCCardStackViewController *)self backgroundView];
    id v12 = [v36 rightAnchor];
    v34 = [(BCCardStackViewController *)self view];
    [v34 rightAnchor];
    id v33 = v35 = v12;
    v32 = [v12 constraintEqualToAnchor:];
    v41[1] = v32;
    v31 = [(BCCardStackViewController *)self backgroundView];
    BOOL v13 = [v31 topAnchor];
    unsigned __int8 v14 = [(BCCardStackViewController *)self view];
    double v15 = [v14 topAnchor];
    id v30 = v13;
    id v16 = [v13 constraintEqualToAnchor:v15];
    v41[2] = v16;
    objc_super v17 = [(BCCardStackViewController *)self backgroundView];
    BOOL v18 = [v17 bottomAnchor];
    id v19 = [(BCCardStackViewController *)self view];
    __int16 v20 = [v19 bottomAnchor];
    int v21 = [v18 constraintEqualToAnchor:v20];
    v41[3] = v21;
    +[NSArray arrayWithObjects:v41 count:4];
    v23 = int64_t v22 = v8;
    +[NSLayoutConstraint activateConstraints:v23];

    id v8 = v22;
    v24 = v29;
LABEL_5:
  }
}

- (void)_addAdornmentViewsToParentView:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BCCardStackViewController *)self backgroundView];
  [v5 removeFromSuperview];

  BOOL v6 = [(BCCardStackViewController *)self backgroundView];
  [v4 insertSubview:v6 atIndex:0];

  uint64_t v23 = [(BCCardStackViewController *)self backgroundView];
  int64_t v22 = [v23 leftAnchor];
  int v21 = [v4 leftAnchor];
  __int16 v20 = [v22 constraintEqualToAnchor:v21];
  v24[0] = v20;
  id v19 = [(BCCardStackViewController *)self backgroundView];
  BOOL v18 = [v19 rightAnchor];
  objc_super v17 = [v4 rightAnchor];
  double v7 = [v18 constraintEqualToAnchor:v17];
  v24[1] = v7;
  id v8 = [(BCCardStackViewController *)self backgroundView];
  int64_t v9 = [v8 topAnchor];
  id v10 = [v4 topAnchor];
  BOOL v11 = [v9 constraintEqualToAnchor:v10];
  v24[2] = v11;
  id v12 = [(BCCardStackViewController *)self backgroundView];
  BOOL v13 = [v12 bottomAnchor];
  unsigned __int8 v14 = [v4 bottomAnchor];

  double v15 = [v13 constraintEqualToAnchor:v14];
  v24[3] = v15;
  id v16 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v16];
}

+ (BOOL)_alwaysUseSlideAnimation
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"BCCardStackTransitionForceSlideAnimation"];

  return v3;
}

- (void)_scaleBackCardSetViewController:(id)a3 shiftUp:(BOOL)a4 cumulative:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = [v7 view];
  [v8 center];
  double v10 = v9;

  long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v21.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v21.c = v11;
  *(_OWORD *)&v21.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if (v5)
  {
    id v12 = [v7 view];
    BOOL v13 = v12;
    if (v12) {
      [v12 transform];
    }
    else {
      memset(&v20, 0, sizeof(v20));
    }
    CGAffineTransformTranslate(&v21, &v20, 0.0, -v10);
  }
  else
  {
    CGAffineTransformMakeTranslation(&v21, 0.0, -v10);
  }
  CGAffineTransform v18 = v21;
  CGAffineTransformScale(&v19, &v18, 0.95, 0.95);
  CGAffineTransform v21 = v19;
  double v14 = -9.0;
  if (v6) {
    double v14 = 9.0;
  }
  CGAffineTransform v18 = v19;
  CGAffineTransformTranslate(&v19, &v18, 0.0, v14 + v10);
  CGAffineTransform v21 = v19;
  CGAffineTransform v17 = v19;
  double v15 = [v7 view];
  CGAffineTransform v16 = v17;
  [v15 setTransform:&v16];
}

- (id)_pushCardsWithDataSource:(id)a3 focusedIndex:(unint64_t)a4 animated:(BOOL)a5 presentingViewController:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  if (self->_transitionInProgress)
  {
    id v12 = BCCardModelLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1EA8E4();
    }
    BOOL v13 = 0;
    goto LABEL_49;
  }
  [(BCCardStackViewController *)self lockChildForStatusBarStyle];
  self->_transitionInProgress = 1;
  double v14 = +[BCStatusBarBackgroundController backgroundControllerForViewController:v11];
  [(BCCardStackViewController *)self setStatusBarBackgroundController:v14];

  BOOL v90 = v7;
  if ([(BCCardStackViewController *)self presentingViewControllerIsFullScreen]) {
    [v11 view];
  }
  else {
  double v15 = [v11 bc_windowForViewController];
  }
  [v15 bounds];
  -[BCCardStackViewController setInitialFrame:](self, "setInitialFrame:");

  [v11 additionalSafeAreaInsets];
  -[BCCardStackViewController setToolbarHeight:](self, "setToolbarHeight:");
  CGAffineTransform v16 = [(BCCardStackViewController *)self childViewControllers];
  CGAffineTransform v17 = [v16 lastObject];

  if (v17)
  {
    CGAffineTransform v18 = [(BCCardStackViewController *)self view];
    CGAffineTransform v19 = [v18 window];
    [v19 setUserInteractionEnabled:0];
  }
  CGAffineTransform v20 = [v17 configuration];
  unint64_t v98 = a4;
  if ([v20 cardsCanExpand])
  {
    CGAffineTransform v21 = [v17 currentCardViewController];
    int64_t v22 = [v21 currentState];
    uint64_t v23 = +[BCCardSetState expandedState];

    BOOL v24 = v22 == v23;
    a4 = v98;
    if (v24) {
      goto LABEL_14;
    }
    CGAffineTransform v20 = [v17 currentCardViewController];
    [v20 goExpanded];
  }

LABEL_14:
  [v17 bc_analyticsVisibilitySubtreeWillDisappear];
  v25 = objc_alloc_init(BCCardSetViewController);
  v26 = [(BCCardStackViewController *)self view];
  [v26 bounds];
  -[BCCardSetViewController setInitialFrame:](v25, "setInitialFrame:");

  v27 = [(BCCardStackViewController *)self configuration];
  [(BCCardSetViewController *)v25 setConfiguration:v27];

  [(BCCardStackViewController *)self contentInset];
  -[BCCardSetViewController setContentInset:](v25, "setContentInset:");
  uint64_t v28 = [(BCCardStackViewController *)self configuration];
  if ([v28 cardsCanExpand])
  {
    uint64_t v29 = 0;
  }
  else
  {
    id v30 = [(BCCardStackViewController *)self childViewControllers];
    id v31 = [v30 count];

    if ((unint64_t)v31 < 2)
    {
      uint64_t v29 = 0;
      goto LABEL_20;
    }
    uint64_t v28 = [(BCCardStackViewController *)self childViewControllers];
    v32 = [(BCCardStackViewController *)self childViewControllers];
    uint64_t v29 = [v28 objectAtIndexedSubscript:((char *)[v32 count]) - 2];
  }
LABEL_20:
  BOOL v86 = v17 == 0;
  [(BCCardStackViewController *)self addChildViewController:v25];
  [(BCCardSetViewController *)v25 setDataSource:self];
  [(BCCardSetViewController *)v25 setDelegate:self];
  id v33 = [(BCCardStackViewController *)self dataSourceMap];
  [v33 setObject:v10 forKeyedSubscript:v25];

  v34 = [(BCCardStackViewController *)self statusBarBackgroundController];
  [(BCCardSetViewController *)v25 setStatusBarBackgroundController:v34];

  id v35 = [(BCCardStackViewController *)self view];
  [v35 bounds];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  uint64_t v44 = [(BCCardSetViewController *)v25 view];
  [v44 setFrame:v37, v39, v41, v43];

  [(BCCardSetViewController *)v25 setFocusedIndex:a4];
  if ((v17
     || [(BCCardStackViewController *)self presentingViewControllerIsFullScreen]
     || objc_msgSend(v11, "bc_alwaysUseCoverTransitionForCardPresenting"))
    && ([(id)objc_opt_class() _alwaysUseSlideAnimation] & 1) == 0)
  {
    BOOL v46 = +[BCCardStackCoverSourceController coverHostFromPresentingViewController:v11 previousCardSetViewController:v17];
    if (v46)
    {
      v137[0] = _NSConcreteStackBlock;
      v137[1] = 3221225472;
      v137[2] = sub_34D98;
      v137[3] = &unk_2C3C50;
      v47 = v25;
      v138 = v47;
      +[UIView performWithoutAnimation:v137];
      [(BCCardSetViewController *)v47 setLastNavigationType:1];
      id v48 = [[BCCardStackCoverSourceController alloc] initWithCardStackViewController:self isDismiss:0 cardSetViewController:v47 focusedIndex:v98 coverHost:v46 dataSource:v10];
      [(BCCardStackCoverSourceController *)v48 performFirstHalfOfProcessing];
      v93 = v48;
      unsigned int v45 = [(BCCardStackCoverSourceController *)v48 canUseCoverTransition];
      v95 = [v46 containerViewForHostingCoversDuringAnimation];
    }
    else
    {
      v93 = 0;
      v95 = 0;
      unsigned int v45 = 0;
    }
  }
  else
  {
    v93 = 0;
    v95 = 0;
    unsigned int v45 = 0;
  }
  id v87 = v10;
  uint64_t v49 = [BCCardStackTransitionAnimator alloc];
  id v50 = [(BCCardStackViewController *)self configuration];
  v88 = -[BCCardStackTransitionAnimator initWithType:allowsCardExpansion:](v49, "initWithType:allowsCardExpansion:", v45, [v50 cardsCanExpand]);

  id v100 = objc_opt_new();
  char v89 = v45;
  v91 = (void *)v29;
  v92 = v11;
  if (v45)
  {
    double v85 = v17;
    id v51 = objc_opt_new();
    v96 = objc_opt_new();
    v52 = dispatch_group_create();
    id v53 = [(BCCardStackCoverSourceController *)v93 rangeRequiringCards];
    -[BCCardSetViewController beginTransitionUpdateModeForCardsAtRange:](v25, "beginTransitionUpdateModeForCardsAtRange:", v53, v54);
    [(BCCardSetViewController *)v25 didBecomeTopCardSet];
    uint64_t v55 = (char *)[(BCCardSetViewController *)v25 visibleCardRange];
    uint64_t v57 = v56;
    uint64_t v58 = +[NSMutableArray arrayWithCapacity:v56];
    if (v55 < &v55[v57])
    {
      do
      {
        id v59 = [(BCCardSetViewController *)v25 cardViewControllerAtIndex:v55];
        v60 = [v59 transitioningCardContent];

        if (v60)
        {
          [v58 addObject:v60];
          dispatch_group_enter(v52);
          v135[0] = _NSConcreteStackBlock;
          v135[1] = 3221225472;
          v135[2] = sub_34DDC;
          v135[3] = &unk_2C3C50;
          v136 = v52;
          id v61 = [v60 cardStackTransitionSuspendUpdatesAssertionUntilContentExceedsHeightWithCompletion:v135];
          [v51 addObject:v61];

          v62 = [v60 cardStackTransitionSuspendLayoutAssertion];
          [v100 addObject:v62];

          if ((char *)v98 != v55)
          {
            [v96 addObject:v60];
            v63 = [v60 cardStackTransitionSuspendUpdatesAssertion];
            [v51 addObject:v63];
          }
        }

        ++v55;
        --v57;
      }
      while (v57);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_34DE4;
    block[3] = &unk_2C3AF8;
    id v133 = v96;
    id v134 = v51;
    id v64 = v51;
    id v65 = v96;
    dispatch_group_notify(v52, (dispatch_queue_t)&_dispatch_main_q, block);
    id v66 = BCCardStackSignpost();
    if (os_signpost_enabled(v66))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&def_7D91C, v66, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Display product cards", "", (uint8_t *)buf, 2u);
    }

    v67 = BCCardStackSignpost();
    os_signpost_id_t v68 = os_signpost_id_generate(v67);

    v69 = BCCardStackSignpost();
    v70 = v69;
    id v71 = v88;
    if (v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&def_7D91C, v70, OS_SIGNPOST_INTERVAL_BEGIN, v68, "Timeout: Display product cards", "", (uint8_t *)buf, 2u);
    }

    kdebug_trace();
    v123[0] = _NSConcreteStackBlock;
    v123[1] = 3221225472;
    v123[2] = sub_34FC4;
    v123[3] = &unk_2C4E40;
    id v72 = v58;
    id v124 = v72;
    BOOL v131 = v86;
    id v125 = v92;
    long long v126 = self;
    long long v127 = v25;
    os_signpost_id_t v130 = v68;
    v73 = v93;
    v74 = v93;
    v128 = v74;
    id v129 = v88;
    v99 = objc_retainBlock(v123);
    v121[0] = _NSConcreteStackBlock;
    v121[1] = 3221225472;
    v121[2] = sub_35844;
    v121[3] = &unk_2C3C50;
    id v122 = v74;
    v97 = objc_retainBlock(v121);

    CGAffineTransform v17 = v85;
  }
  else
  {
    id v72 = 0;
    v97 = 0;
    v99 = 0;
    v73 = v93;
    id v71 = v88;
  }
  v75 = [[BCCardStackTransitionContext alloc] initWithFromViewController:v17 toViewController:v25 push:1];
  [(BCCardStackTransitionContext *)v75 setAnimated:v90];
  [(BCCardStackTransitionContext *)v75 setInteractive:0];
  v76 = [(BCCardStackViewController *)self backgroundView];
  [(BCCardStackTransitionContext *)v75 setBackgroundView:v76];

  [(BCCardStackTransitionContext *)v75 setInnerContainerView:v95];
  objc_initWeak(buf, self);
  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472;
  v110[2] = sub_35850;
  v110[3] = &unk_2C4E68;
  id v94 = v100;
  id v111 = v94;
  objc_copyWeak(&v118, buf);
  char v119 = v89;
  id v101 = v72;
  id v112 = v101;
  v77 = v73;
  v113 = v77;
  v78 = v25;
  v114 = v78;
  v79 = v71;
  unsigned int v115 = v79;
  v116 = self;
  id v12 = v17;
  id v117 = v12;
  [(BCCardStackTransitionContext *)v75 setCompletionBlock:v110];
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_35A10;
  v108[3] = &unk_2C4E90;
  objc_copyWeak(&v109, buf);
  [(BCCardStackTransitionAnimator *)v79 addAnimations:v108];
  v80 = [(BCCardStackViewController *)self configuration];
  unsigned __int8 v81 = [v80 cardsCanExpand];
  if (v17) {
    char v82 = v81;
  }
  else {
    char v82 = 1;
  }

  if ((v82 & 1) == 0)
  {
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = sub_35A7C;
    v104[3] = &unk_2C4EB8;
    objc_copyWeak(&v107, buf);
    int64_t v105 = v12;
    id v106 = v91;
    [(BCCardStackTransitionAnimator *)v79 addAnimations:v104];

    objc_destroyWeak(&v107);
  }
  [(BCCardSetViewController *)v78 currentCardViewController];
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_35AEC;
  v102[3] = &unk_2C4D80;
  id v83 = (id)objc_claimAutoreleasedReturnValue();
  id v103 = v83;
  [(BCCardStackTransitionAnimator *)v79 addAnimations:v102];
  BOOL v13 = [[BCCardStackTransitionAnimatorWrapper alloc] initWithAnimator:v79 context:v75 waitUntilReadyBlock:v99 setupBeforeAnimationBlock:v97];

  objc_destroyWeak(&v109);
  objc_destroyWeak(&v118);

  objc_destroyWeak(buf);
  id v10 = v87;
  id v11 = v92;
LABEL_49:

  return v13;
}

- (id)_pushCardBackAnimatorForCardSet:(id)a3 cardSetViewControllerToFade:(id)a4 duration:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [objc_alloc((Class)UICubicTimingParameters) initWithControlPoint1:0.33 controlPoint2:0.0, 0.2, 1.0];
  id v10 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v9 timingParameters:0.28];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_35DC4;
  v16[3] = &unk_2C48E0;
  v16[4] = self;
  id v11 = v7;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  [v10 addAnimations:v16];
  if (v12)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_35E4C;
    v14[3] = &unk_2C4EE0;
    id v15 = v12;
    [v10 addCompletion:v14];
  }

  return v10;
}

- (void)_applyCardSetViewController:(id)a3 withTransform:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 view];
  [v6 center];
  double v8 = v7;

  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v25.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v25.c = v9;
  *(_OWORD *)&v25.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if (a4 == 1)
  {
    id v12 = [v5 view];
    BOOL v13 = v12;
    if (v12) {
      [v12 transform];
    }
    else {
      memset(&v21, 0, sizeof(v21));
    }
    CGAffineTransformTranslate(&v25, &v21, 0.0, -v8);

    goto LABEL_12;
  }
  if (a4 != 2)
  {
    CGAffineTransformMakeTranslation(&v25, 0.0, -v8);
LABEL_12:
    CGAffineTransform v22 = v25;
    CGAffineTransformScale(&v23, &v22, 0.95, 0.95);
    long long v15 = *(_OWORD *)&v23.c;
    long long v14 = *(_OWORD *)&v23.tx;
    CGAffineTransform v25 = v23;
    long long v16 = *(_OWORD *)&v23.a;
    double v17 = -9.0;
    goto LABEL_13;
  }
  id v10 = [v5 view];
  id v11 = v10;
  if (v10) {
    [v10 transform];
  }
  else {
    memset(&v24, 0, sizeof(v24));
  }
  CGAffineTransformTranslate(&v25, &v24, 0.0, -v8);

  CGAffineTransform v22 = v25;
  CGAffineTransformScale(&v23, &v22, 1.05263158, 1.05263158);
  long long v15 = *(_OWORD *)&v23.c;
  long long v14 = *(_OWORD *)&v23.tx;
  CGAffineTransform v25 = v23;
  long long v16 = *(_OWORD *)&v23.a;
  double v17 = 9.0;
LABEL_13:
  *(_OWORD *)&v22.a = v16;
  *(_OWORD *)&v22.c = v15;
  *(_OWORD *)&v22.tx = v14;
  CGAffineTransformTranslate(&v23, &v22, 0.0, v8 + v17);
  CGAffineTransform v25 = v23;
  CGAffineTransform v20 = v23;
  id v18 = [v5 view];
  CGAffineTransform v19 = v20;
  [v18 setTransform:&v19];
}

- (void)_layoutUnderlyingCardSetViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(BCCardStackViewController *)self _applyCardSetViewController:v6 withTransform:0];
  [v6 setCovered:1 animated:v4 duration:0.28];
}

- (id)_popCardFrontAnimatorForCardSet:(id)a3 cardSetViewControllerToUnfade:(id)a4 duration:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [objc_alloc((Class)UICubicTimingParameters) initWithControlPoint1:0.33 controlPoint2:0.0, 0.2, 1.0];
  id v10 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v9 timingParameters:0.28];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_36240;
  v14[3] = &unk_2C48E0;
  id v15 = v7;
  id v16 = v8;
  double v17 = self;
  id v11 = v8;
  id v12 = v7;
  [v10 addAnimations:v14];

  return v10;
}

- (id)_navigationControllerForViewController:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v9 = [(BCCardStackViewController *)self presentingViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v11 = [(BCCardStackViewController *)self presentingViewController];
    id v6 = v11;
    if (isKindOfClass) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  objc_opt_class();
  id v5 = BUDynamicCast();
  id v6 = v5;
  if (!v5)
  {
    id v11 = v4;
LABEL_7:
    uint64_t v8 = [v11 navigationController];
    goto LABEL_8;
  }
  id v7 = [v5 expandedCardViewController];
  uint64_t v8 = [v7 cardNavigationController];

LABEL_8:
  id v6 = (void *)v8;
LABEL_9:

  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = [(BCCardStackViewController *)self pendingWrapper];

  if (!v4)
  {
    id v5 = BCCardModelLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1EA994();
    }
  }
  id v6 = [(BCCardStackViewController *)self pendingWrapper];

  return v6;
}

- (unint64_t)cardCountForCardSet:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCardStackViewController *)self dataSourceMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 numberOfCards:self];
  return (unint64_t)v7;
}

- (BOOL)isTopCardSetViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCardStackViewController *)self childViewControllers];
  id v6 = [v5 lastObject];

  return v6 == v4;
}

- (id)contentViewControllerForCardSet:(id)a3 index:(unint64_t)a4 cardContentScrollManager:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(BCCardStackViewController *)self dataSourceMap];
  id v11 = [v10 objectForKeyedSubscript:v9];

  id v12 = [v11 contentViewControllerForCardAtIndex:a4 cardContentScrollManager:v8];

  objc_opt_class();
  BOOL v13 = BUClassAndProtocolCast();

  return v13;
}

- (Class)cardNavigationControllerForCardSet:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCardStackViewController *)self dataSourceMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 cardNavigationControllerClass:self];

  return (Class)v7;
}

- (void)cardSetViewController:(id)a3 prepareForNavigationTransitionWithContext:(id)a4
{
  id v5 = [a4 containerView];
  [(BCCardStackViewController *)self _addAdornmentViewsToParentView:v5];

  self->_transitionInProgress = 1;
}

- (void)cardSetViewControllerNavigiationTransitionCompleted:(id)a3
{
  self->_transitionInProgress = 0;
  [(BCCardStackViewController *)self _layoutAdornmentViews];
}

- (void)cardSetViewController:(id)a3 animatorForExpanding:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 duration];
  id v9 = v8;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_367E4;
  v10[3] = &unk_2C4F58;
  v11[1] = v9;
  objc_copyWeak(v11, &location);
  [v7 addAnimations:v10];
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)cardSetViewController:(id)a3 animatorForUnexpanding:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 duration];
  id v9 = v8;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_36BF0;
  v12[3] = &unk_2C4F58;
  v13[1] = v9;
  objc_copyWeak(v13, &location);
  [v7 addAnimations:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_36DB8;
  v10[3] = &unk_2C4FC0;
  objc_copyWeak(&v11, &location);
  void v10[4] = self;
  [v7 addCompletion:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)cardSetViewController:(id)a3 animatorForInteractiveDismiss:(id)a4
{
  double v11 = NAN;
  id v6 = a4;
  [v6 setFinalAnimationType:[self _animationTypeForDismissingCardSetViewController:distanceToCoverSource:a3, &v11]];
  [v6 setDistanceToCoverSource:v11];
  id v7 = [(BCCardStackViewController *)self backgroundView];
  [v6 setBackgroundView:v7];

  id v8 = [(BCCardStackViewController *)self childViewControllers];
  BOOL v9 = (unint64_t)[v8 count] > 1;

  id v10 = [(BCCardStackViewController *)self configuration];
  [v6 setShouldRetainBackgroundAndTitleState:v9 & ~[v10 cardsCanExpand]];
}

- (int64_t)_animationTypeForDismissingCardSetViewController:(id)a3 distanceToCoverSource:(double *)a4
{
  id v6 = a3;
  id v7 = [(BCCardStackViewController *)self childViewControllers];
  if ((unint64_t)[v7 count] <= 1)
  {
  }
  else
  {
    id v8 = [(BCCardStackViewController *)self childViewControllers];
    BOOL v9 = [(BCCardStackViewController *)self childViewControllers];
    id v10 = [v8 objectAtIndexedSubscript:[v9 count] - 2];

    if (v10) {
      goto LABEL_8;
    }
  }
  if (![(BCCardStackViewController *)self presentingViewControllerIsFullScreen])
  {
    double v11 = [(BCCardStackViewController *)self presentingViewController];
    unsigned int v12 = [v11 bc_alwaysUseCoverTransitionForCardPresenting];

    if (!v12)
    {
      int64_t v21 = 2;
      goto LABEL_12;
    }
  }
  id v10 = 0;
LABEL_8:
  BOOL v13 = [(BCCardStackViewController *)self presentingViewController];
  long long v14 = +[BCCardStackCoverSourceController coverHostFromPresentingViewController:v13 previousCardSetViewController:v10];

  id v15 = [v6 currentCardViewController];
  id v16 = [v15 view];
  double v17 = [v16 superview];

  id v18 = [(BCCardStackViewController *)self dataSourceMap];
  CGAffineTransform v19 = [v18 objectForKeyedSubscript:v6];
  unsigned int v20 = +[BCCardStackCoverSourceController canUseCoverTransitionForDismissingCardSetViewController:v6 dataSource:v19 coverHost:v14 coverYOffset:a4 inCoordinatesOfView:v17];

  if ([(id)objc_opt_class() _alwaysUseSlideAnimation] | v20 ^ 1) {
    int64_t v21 = 2;
  }
  else {
    int64_t v21 = 3;
  }

LABEL_12:
  return v21;
}

- (void)cardSetViewController:(id)a3 didCommitDismissWithVelocity:(double)a4 interactiveAnimator:(id)a5
{
  id v7 = [a5 finalAnimationType:a3];

  [(BCCardStackViewController *)self _popCardsAnimated:1 popAll:0 animationType:v7 prefersCrossfade:0 velocity:2 reason:0 completion:a4];
}

- (id)topCardSetViewController
{
  id v2 = [(BCCardStackViewController *)self childViewControllers];
  unsigned __int8 v3 = [v2 lastObject];

  return v3;
}

- (id)effectiveAnalyticsTrackerForTopCard
{
  id v2 = [(BCCardStackViewController *)self topCardSetViewController];
  unsigned __int8 v3 = [v2 currentCardViewController];
  id v4 = [v3 topContentViewController];
  id v5 = [v4 ba_effectiveAnalyticsTracker];

  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (void)scrollViewDidScrollToTop:(id)a3
{
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  return 0;
}

- (id)im_visibleChildViewControllers
{
  id v2 = [(BCCardStackViewController *)self childViewControllers];
  unsigned __int8 v3 = [v2 lastObject];

  if (v3)
  {
    id v6 = v3;
    id v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return v4;
}

- (BOOL)bc_analyticsVisibilityOfChild:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCardStackViewController *)self childViewControllers];
  id v6 = [v5 lastObject];

  return v6 == v4;
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

- (void)_updateStatusBarBackgroundOpacity
{
  id v3 = [(BCCardStackViewController *)self topCardSetViewController];
  [(BCCardStackViewController *)self _updateStatusBarBackgroundOpacityForCardSetViewController:v3];
}

- (void)_updateStatusBarBackgroundOpacityForCardSetViewController:(id)a3
{
  id v14 = a3;
  char v4 = _os_feature_enabled_impl();
  if (v14 && (v4 & 1) == 0)
  {
    id v5 = [v14 currentCardViewController];
    id v6 = [v5 cardNavigationController];
    unsigned int v7 = [v6 isNavigationBarHidden];

    id v8 = [v14 currentCardViewController];
    BOOL v9 = [v8 currentState];
    id v10 = +[BCCardSetState expandedState];

    if (v9 == v10) {
      unsigned int v11 = v7;
    }
    else {
      unsigned int v11 = 0;
    }
    double v12 = (double)v11;
    BOOL v13 = [(BCCardStackViewController *)self statusBarBackgroundController];
    [v13 setOpacity:v12];
  }
}

- (unint64_t)_indexOfChildViewControllerToSuspendOrResume
{
  id v2 = [(BCCardStackViewController *)self childViewControllers];
  id v3 = [v2 count];
  if ((unint64_t)v3 <= 2) {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v4 = (unint64_t)v3 - 3;
  }

  return v4;
}

- (void)_suspendAndTeardownChildViewControllerAsNeeded
{
  unint64_t v3 = [(BCCardStackViewController *)self _indexOfChildViewControllerToSuspendOrResume];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = v3;
    objc_opt_class();
    id v5 = [(BCCardStackViewController *)self childViewControllers];
    id v6 = [v5 objectAtIndexedSubscript:v4];
    BUDynamicCast();
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    [v7 suspendAndTeardownForReason:@"card stack: card set not displayed"];
  }
}

- (void)_resumeAndRebuildChildViewControllerAsNeeded
{
  unint64_t v3 = [(BCCardStackViewController *)self _indexOfChildViewControllerToSuspendOrResume];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = v3;
    objc_opt_class();
    id v5 = [(BCCardStackViewController *)self childViewControllers];
    id v6 = [v5 objectAtIndexedSubscript:v4];
    BUDynamicCast();
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    [v7 resumeAndRebuildForReason:@"card stack: card set will display"];
  }
}

- (void)didReceiveMemoryWarning
{
  v3.receiver = self;
  v3.super_class = (Class)BCCardStackViewController;
  [(BCCardStackViewController *)&v3 didReceiveMemoryWarning];
  [(BCCardStackViewController *)self _suspendAndTeardownChildViewControllerAsNeeded];
}

- (id)keyCommands
{
  id v2 = +[UIKeyCommand keyCommandWithInput:UIKeyInputEscape modifierFlags:0 action:"_dismissCardStack:"];
  id v5 = v2;
  objc_super v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (void)_dismissCardStack:(id)a3
{
}

- (double)toolbarHeight
{
  return self->_toolbarHeight;
}

- (BOOL)presentingViewControllerIsFullScreen
{
  return self->_presentingViewControllerIsFullScreen;
}

- (void)setPresentingViewControllerIsFullScreen:(BOOL)a3
{
  self->_presentingViewControllerIsFullScreen = a3;
}

- (NSMapTable)dataSourceMap
{
  return self->_dataSourceMap;
}

- (void)setDataSourceMap:(id)a3
{
}

- (BOOL)transitionInProgress
{
  return self->_transitionInProgress;
}

- (void)setTransitionInProgress:(BOOL)a3
{
  self->_transitionInProgress = a3;
}

- (UIScrollView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (BCCardStackTransitionAnimatorWrapper)pendingWrapper
{
  return self->_pendingWrapper;
}

- (void)setPendingWrapper:(id)a3
{
}

- (UIViewController)lockedChildForStatusBarStyle
{
  return self->_lockedChildForStatusBarStyle;
}

- (void)setLockedChildForStatusBarStyle:(id)a3
{
}

- (BOOL)ignoreChildStatusBarStyle
{
  return self->_ignoreChildStatusBarStyle;
}

- (void)setIgnoreChildStatusBarStyle:(BOOL)a3
{
  self->_ignoreChildStatusBarStyle = a3;
}

- (BCCardStackConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGRect)initialFrame
{
  double x = self->_initialFrame.origin.x;
  double y = self->_initialFrame.origin.y;
  double width = self->_initialFrame.size.width;
  double height = self->_initialFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInitialFrame:(CGRect)a3
{
  self->_initialFrame = a3;
}

- (CGSize)lastLayoutStackSize
{
  double width = self->_lastLayoutStackSize.width;
  double height = self->_lastLayoutStackSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastLayoutStackSize:(CGSize)a3
{
  self->_lastLayoutStackSize = a3;
}

- (NSMapTable)unhideBlocksByCardSet
{
  return self->_unhideBlocksByCardSet;
}

- (void)setUnhideBlocksByCardSet:(id)a3
{
}

- (void)setStatusBarBackgroundController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarBackgroundController, 0);
  objc_storeStrong((id *)&self->_unhideBlocksByCardSet, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_lockedChildForStatusBarStyle, 0);
  objc_storeStrong((id *)&self->_pendingWrapper, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_dataSourceMap, 0);

  objc_storeStrong((id *)&self->_transitionSetupQueue, 0);
}

- (NSSet)messagesAlreadyDisplayed
{
  objc_opt_class();
  objc_super v3 = objc_getAssociatedObject(self, off_3402A8);
  unint64_t v4 = BUDynamicCast();

  return (NSSet *)v4;
}

- (void)setMessagesAlreadyDisplayed:(id)a3
{
}

- (void)viewController:(id)a3 didDisplayMessageWithId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BCCardStackViewController *)self messagesAlreadyDisplayed];
  if (!v8) {
    id v8 = objc_alloc_init((Class)NSSet);
  }
  id v9 = [v8 setByAddingObject:v6];

  [(BCCardStackViewController *)self setMessagesAlreadyDisplayed:v9];
  [(BCCardStackViewController *)self notifyAllCardsAboutMessageDisplayed:v6 from:v7];
}

- (void)notifyAllCardsAboutMessageDisplayed:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(BCCardStackViewController *)self childViewControllers];
  id v8 = (char *)[obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      unsigned int v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(obj);
        }
        objc_opt_class();
        double v12 = BUDynamicCast();
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_42B18;
        v14[3] = &unk_2C5558;
        id v15 = v7;
        id v16 = v6;
        [v12 enumerateAllCardsUsingBlock:v14];

        ++v11;
      }
      while (v9 != v11);
      id v9 = (char *)[obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

@end