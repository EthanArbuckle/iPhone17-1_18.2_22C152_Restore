@interface BCCardViewController
- (BCCardAuxiliaryNavigationBarViewController)auxiliaryNavigationBarViewController;
- (BCCardContent)topContentViewController;
- (BCCardGripperView)gripperView;
- (BCCardSetData)cardSetData;
- (BCCardSetNavigationSource)cardSetViewController;
- (BCCardSetState)currentState;
- (BCCardStackConfiguration)configuration;
- (BCCardStackTransitioningCardContent)transitioningCardContent;
- (BCCardViewController)initWithNavigationControllerClass:(Class)a3 cardSetData:(id)a4 distanceToExpand:(double)a5;
- (BCCardViewControllerDelegate)delegate;
- (BCCardViewControllerViewState)viewState;
- (BOOL)_navigationControllerShouldCrossFadeNavigationBar:(id)a3;
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)auxiliaryNavigationBarViewControllerCanCloseAsset;
- (BOOL)bc_isPresentedInCardViewController;
- (BOOL)bottomCardWasExpanded;
- (BOOL)dismissing;
- (BOOL)expanded;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isCurrentCard;
- (BOOL)itemPushedOnCard;
- (BOOL)prefersStatusBarBackgroundHidden;
- (BOOL)roundedCorners;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)scrollingToTop;
- (BOOL)settingContentOffset;
- (BOOL)uppEnabled;
- (CGPoint)oldContentOffset;
- (CGRect)cardStackTransitioningCardFinalFrame;
- (CGRect)viewFrameBeforeAnimation;
- (Class)navigationControllerClass;
- (NSLayoutConstraint)auxiliaryNavigationBarTopConstraint;
- (NSLayoutConstraint)gripperHeightConstraint;
- (NSLayoutConstraint)gripperWidthConstraint;
- (NSString)stringForReturnToRootBarItem;
- (UIEdgeInsets)_scrollIndicatorInsetsForContentInset:(UIEdgeInsets)a3 unalteredContentInset:(UIEdgeInsets)a4;
- (UIEdgeInsets)accessibilityVisibleContentInsetForCardViewControllerScrollView:(id)a3;
- (UIEdgeInsets)cardContentViewController:(id)a3 contentInsetsForScrollingToRectWithContentInsets:(UIEdgeInsets)a4;
- (UIEdgeInsets)contentInset;
- (UIEdgeInsets)contentInsetForContent;
- (UINavigationController)cardNavigationController;
- (UIPanGestureRecognizer)auxiliaryNavigationBarDismissPanGestureRecognizer;
- (UIPanGestureRecognizer)dismissPanGestureRecognizer;
- (UIScrollView)contentScrollView;
- (UIScrollView)scrollView;
- (UITapGestureRecognizer)cardTapGestureRecognizer;
- (UIView)auxiliaryNavigationBarView;
- (UIView)auxiliaryNavigationBarViewForAnimation;
- (UIView)blackScrimView;
- (UIView)cardView;
- (UIView)contentContainerView;
- (UIView)glassView;
- (UIView)whiteScrimView;
- (UIViewPropertyAnimator)animator;
- (double)auxiliaryNavigationBarHeight;
- (double)cardStackTransitioningCardContentAlpha;
- (double)cardStackTransitioningCardExtraXOffset;
- (double)cornerRadius;
- (double)distanceToExpand;
- (double)extraXOffsetForAnimation;
- (double)rawCurrentCardOffset;
- (double)scrollViewVerticalVelocityWhenDraggingEnded;
- (id)_preferredTargetState;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4;
- (int64_t)sideCardAnimationCount;
- (void)_adjustContentInsetForViewController:(id)a3;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_applicationWillEnterForegroundNotification:(id)a3;
- (void)_applyContentInsetToContentViewController:(id)a3;
- (void)_configureAsExpanded;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_setAuxiliaryNavigationBarViewAlpha:(double)a3;
- (void)_setCurrentState:(id)a3 updateStatusBarIfNeeded:(BOOL)a4;
- (void)_setupGripperMenu;
- (void)_updateCardFrames;
- (void)_updateContentWithContentInset;
- (void)_updateFromMetrics;
- (void)_updateScrollViewContentInset;
- (void)_updateViewController:(double)a3 scrollView:(double)a4 withContentInset:(double)a5 unalteredContentInset:(double)a6 contentInsetForScrollIndicatorInsets:(double)a7;
- (void)_updateViewController:(id)a3 withContentInset:(UIEdgeInsets)a4 unalteredContentInset:(UIEdgeInsets)a5;
- (void)accessibilityDidActivateGripperView:(id)a3;
- (void)anchorAuxiliaryNavigationBarView:(id)a3 toView:(id)a4;
- (void)anchorGripperView:(id)a3 toView:(id)a4;
- (void)animationCompletedAtPosition:(int64_t)a3;
- (void)attachAuxiliaryNavigationBarViewAnimated:(BOOL)a3;
- (void)auxiliaryNavigationBarViewControllerDidTapCloseAllCards;
- (void)auxiliaryNavigationBarViewControllerDidTapCloseAsset;
- (void)bcSafeAreaInsetsObservableViewController:(id)a3 safeAreaInsetsDidChange:(UIEdgeInsets)a4;
- (void)bc_analyticsVisibilityDidAppear;
- (void)bc_analyticsVisibilityDidDisappear;
- (void)cardContentViewController:(id)a3 initializeManagerWithScrollView:(id)a4;
- (void)cardSetPresentationTransitionDidComplete;
- (void)cardStackTransitioningCardFinalize:(BOOL)a3;
- (void)cardStackTransitioningCardPrepare:(BOOL)a3 extraXOffsetForAnimation:(double)a4;
- (void)cardTapped:(id)a3;
- (void)cardViewControllerScrollView:(id)a3 accessibilityWantsToScrollToOffset:(CGPoint)a4;
- (void)clearSavedContentOffsets;
- (void)configureChromeForContracted;
- (void)configureChromeForExpanded;
- (void)dealloc;
- (void)dismissPan:(id)a3;
- (void)goContracted;
- (void)goExpanded;
- (void)gripperTapped:(id)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForDismiss;
- (void)resumeAndRebuildForReason:(id)a3;
- (void)scrollToTop:(BOOL)a3;
- (void)scrollViewDidChange;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewTapped:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAnimator:(id)a3;
- (void)setAuxiliaryNavigationBarDismissPanGestureRecognizer:(id)a3;
- (void)setAuxiliaryNavigationBarTopConstraint:(id)a3;
- (void)setAuxiliaryNavigationBarViewController:(id)a3;
- (void)setBlackScrimView:(id)a3;
- (void)setBottomCardWasExpanded:(BOOL)a3;
- (void)setCardNavigationController:(id)a3;
- (void)setCardSetData:(id)a3;
- (void)setCardSetViewController:(id)a3;
- (void)setCardStackTransitioningCardContentAlpha:(double)a3;
- (void)setCardTapGestureRecognizer:(id)a3;
- (void)setCardView:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentContainerView:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentInsetForContent:(UIEdgeInsets)a3;
- (void)setContentScrollView:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCurrentState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissPanGestureRecognizer:(id)a3;
- (void)setDismissing:(BOOL)a3;
- (void)setDistanceToExpand:(double)a3;
- (void)setExtraXOffsetForAnimation:(double)a3;
- (void)setGlassView:(id)a3;
- (void)setGripperHeightConstraint:(id)a3;
- (void)setGripperView:(id)a3;
- (void)setGripperWidthConstraint:(id)a3;
- (void)setIsBubbleTipPresented:(BOOL)a3;
- (void)setIsCurrentCard:(BOOL)a3;
- (void)setNavigationControllerClass:(Class)a3;
- (void)setOldContentOffset:(CGPoint)a3;
- (void)setRawCurrentCardOffset:(double)a3;
- (void)setRoundedCorners:(BOOL)a3;
- (void)setScrimAlpha:(double)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)setScrollViewVerticalVelocityWhenDraggingEnded:(double)a3;
- (void)setScrollingToTop:(BOOL)a3;
- (void)setSettingContentOffset:(BOOL)a3;
- (void)setSideCardAnimationCount:(int64_t)a3;
- (void)setUppEnabled:(BOOL)a3;
- (void)setViewFrameBeforeAnimation:(CGRect)a3;
- (void)setViewState:(id)a3;
- (void)setWhiteScrimView:(id)a3;
- (void)setupRootContentScrollView:(id)a3;
- (void)suspendAndTeardownForReason:(id)a3;
- (void)updateContentSize:(CGSize)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BCCardViewController

- (BCCardViewController)initWithNavigationControllerClass:(Class)a3 cardSetData:(id)a4 distanceToExpand:(double)a5
{
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BCCardViewController;
  v9 = [(BCCardViewController *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_navigationControllerClass, a3);
    objc_storeWeak((id *)&v10->_cardSetData, v8);
    v10->_distanceToExpand = a5;
    ++qword_345520;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1E9660();
    }
    v11 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v10 action:"cardTapped:"];
    cardTapGestureRecognizer = v10->_cardTapGestureRecognizer;
    v10->_cardTapGestureRecognizer = v11;

    v10->_uppEnabled = _os_feature_enabled_impl();
    v13 = +[UITraitCollection bc_allAPITraits];
    id v14 = [(BCCardViewController *)v10 registerForTraitChanges:v13 withAction:"_traitCollectionDidChange:previousTraitCollection:"];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v10 selector:"_applicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
    [v15 addObserver:v10 selector:"_applicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];
  }
  return v10;
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  v4 = [(BCCardViewController *)self viewState];

  if (v4)
  {
    v5 = [(BCCardViewController *)self view];
    [v5 size];
    double v7 = v6;
    double v9 = v8;
    v10 = [(BCCardViewController *)self viewState];
    [v10 viewSize];
    double v12 = v11;
    double v14 = v13;

    if (v7 == v12 && v9 == v14)
    {
      v15 = [(BCCardViewController *)self viewState];
      [v15 cardScrollViewContentOffset];
      double v17 = v16;
      double v19 = v18;
      v20 = [(BCCardViewController *)self scrollView];
      [v20 setContentOffset:v17, v19];

      v21 = [(BCCardViewController *)self viewState];
      [v21 contentScrollViewContentOffset];
      double v23 = v22;
      double v25 = v24;
      v26 = [(BCCardViewController *)self contentScrollView];
      [v26 setContentOffset:v23, v25];
    }
    [(BCCardViewController *)self setViewState:0];
  }
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  id v22 = [(BCCardViewController *)self scrollView];
  [v22 contentOffset];
  if (v5 != CGPointZero.x || v4 != CGPointZero.y)
  {
    double v7 = [(BCCardViewController *)self viewState];

    if (v7) {
      return;
    }
    double v8 = [BCCardViewControllerViewState alloc];
    id v22 = [(BCCardViewController *)self scrollView];
    [v22 contentOffset];
    double v10 = v9;
    double v12 = v11;
    double v13 = [(BCCardViewController *)self contentScrollView];
    [v13 contentOffset];
    double v15 = v14;
    double v17 = v16;
    double v18 = [(BCCardViewController *)self view];
    [v18 size];
    v21 = -[BCCardViewControllerViewState initWithContentOffset:contentScrollViewContentOffset:viewSize:](v8, "initWithContentOffset:contentScrollViewContentOffset:viewSize:", v10, v12, v15, v17, v19, v20);
    [(BCCardViewController *)self setViewState:v21];
  }
}

- (BOOL)isCurrentCard
{
  v2 = [(BCCardViewController *)self glassView];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)setIsCurrentCard:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(BCCardViewController *)self glassView];

  if (v3)
  {
    if (v5)
    {
      double v6 = [(BCCardViewController *)self glassView];
      [v6 removeFromSuperview];

      [(BCCardViewController *)self setGlassView:0];
    }
  }
  else if (!v5)
  {
    id v7 = objc_alloc((Class)UIView);
    double v8 = [(BCCardViewController *)self cardView];
    [v8 bounds];
    id v9 = [v7 initWithFrame:];

    [v9 setAutoresizingMask:18];
    double v10 = [(BCCardViewController *)self cardView];
    [v10 addSubview:v9];

    double v11 = [(BCCardViewController *)self cardView];
    [v11 bringSubviewToFront:v9];

    double v12 = [(BCCardViewController *)self cardTapGestureRecognizer];
    [v9 addGestureRecognizer:v12];

    [(BCCardViewController *)self setGlassView:v9];
  }
  id v13 = [(BCCardViewController *)self cardNavigationController];
  [v13 setIsCurrentCard:v3];
}

- (void)dealloc
{
  p_contentScrollView = &self->_contentScrollView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentScrollView);
  [WeakRetained removeObserver:self forKeyPath:@"contentSize" context:off_33EA60];

  id v5 = objc_loadWeakRetained((id *)p_contentScrollView);
  [v5 _removeScrollViewScrollObserver:self];

  double v6 = [(BCCardViewController *)self scrollView];
  [v6 _removeScrollViewScrollObserver:self];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];
  [v7 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];
  --qword_345520;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1E96E4();
  }

  v8.receiver = self;
  v8.super_class = (Class)BCCardViewController;
  [(BCCardViewController *)&v8 dealloc];
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  id v5 = [(BCCardViewController *)self configuration];
  [v5 cardContractedScale];
  double v7 = a3 / v6;

  objc_super v8 = [(BCCardViewController *)self blackScrimView];
  [v8 _setContinuousCornerRadius:v7];

  id v9 = [(BCCardViewController *)self whiteScrimView];
  [v9 _setContinuousCornerRadius:v7];

  double v10 = [(BCCardViewController *)self cardView];
  [v10 _setContinuousCornerRadius:v7];

  double v11 = [(BCCardViewController *)self contentContainerView];
  [v11 _setContinuousCornerRadius:v7];

  [(BCCardViewController *)self _updateShadowPath];
}

- (void)setRoundedCorners:(BOOL)a3
{
  self->_roundedCorners = a3;
  [(BCCardViewController *)self setCornerRadius:self->_cornerRadius];
}

- (void)setAnimator:(id)a3
{
  double v4 = (UIViewPropertyAnimator *)a3;
  animator = self->_animator;
  if (animator && [(UIViewPropertyAnimator *)animator state] == (char *)&def_7D91C + 1)
  {
    double v6 = BCCardModelLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1E9768(v6);
    }

    [(UIViewPropertyAnimator *)self->_animator stopAnimation:0];
    [(UIViewPropertyAnimator *)self->_animator finishAnimationAtPosition:2];
  }
  double v7 = self->_animator;
  self->_animator = v4;
}

- (BOOL)itemPushedOnCard
{
  v2 = [(BCCardViewController *)self cardNavigationController];
  BOOL v3 = [v2 childViewControllers];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (void)_updateFromMetrics
{
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_rootScrollView;
}

- (void)viewDidLoad
{
  v58.receiver = self;
  v58.super_class = (Class)BCCardViewController;
  [(BCCardViewController *)&v58 viewDidLoad];
  BOOL v3 = [BCCardViewControllerScrollView alloc];
  BOOL v4 = [(BCCardViewController *)self view];
  [v4 bounds];
  id v5 = -[BCCardViewControllerScrollView initWithFrame:](v3, "initWithFrame:");

  [(BCCardViewControllerScrollView *)v5 setAutoresizingMask:18];
  [(BCCardViewControllerScrollView *)v5 setAccessibilityDelegate:self];
  [(BCCardViewControllerScrollView *)v5 setContentInsetAdjustmentBehavior:2];
  [(BCCardViewControllerScrollView *)v5 setClipsToBounds:0];
  [(BCCardViewControllerScrollView *)v5 setDelegate:self];
  [(BCCardViewControllerScrollView *)v5 setShowsVerticalScrollIndicator:1];
  [(BCCardViewControllerScrollView *)v5 setAlwaysBounceVertical:1];
  objc_storeStrong((id *)&self->_rootScrollView, v5);
  double v6 = [(BCCardViewController *)self view];
  [v6 addSubview:v5];

  id v7 = objc_alloc_init((Class)UIView);
  [(BCCardViewController *)self setCardView:v7];

  objc_super v8 = [(BCCardViewController *)self cardView];
  [v8 setAutoresizingMask:18];

  id v9 = +[UIColor clearColor];
  double v10 = [(BCCardViewController *)self cardView];
  [v10 setBackgroundColor:v9];

  id v11 = +[UIColor colorWithWhite:1.0 alpha:0.1];
  id v12 = [v11 CGColor];
  id v13 = [(BCCardViewController *)self cardView];
  double v14 = [v13 layer];
  [v14 setBorderColor:v12];

  double v15 = +[UIScreen mainScreen];
  [v15 scale];
  double v17 = 1.0 / v16;
  double v18 = [(BCCardViewController *)self cardView];
  double v19 = [v18 layer];
  [v19 setBorderWidth:v17];

  double v20 = [(BCCardViewController *)self view];
  v21 = [(BCCardViewController *)self cardView];
  [v20 addSubview:v21];

  id v22 = objc_alloc_init((Class)UIView);
  [(BCCardViewController *)self setContentContainerView:v22];

  double v23 = [(BCCardViewController *)self contentContainerView];
  [v23 setAutoresizingMask:18];

  double v24 = [(BCCardViewController *)self cardView];
  double v25 = [(BCCardViewController *)self contentContainerView];
  [v24 addSubview:v25];

  navigationControllerClass = self->_navigationControllerClass;
  if (!navigationControllerClass) {
    navigationControllerClass = (objc_class *)UINavigationController;
  }
  id v27 = objc_alloc_init(navigationControllerClass);
  [(BCCardViewController *)self setCardNavigationController:v27];

  v28 = [(BCCardViewController *)self cardNavigationController];
  [v28 setDelegate:self];

  v29 = [(BCCardViewController *)self cardNavigationController];
  [(BCCardViewController *)self addChildViewController:v29];

  v30 = [(BCCardViewController *)self cardNavigationController];
  v31 = [v30 view];
  [v31 setAutoresizingMask:2];

  v32 = [(BCCardViewController *)self contentContainerView];
  v33 = [(BCCardViewController *)self cardNavigationController];
  v34 = [v33 view];
  [v32 addSubview:v34];

  v35 = [(BCCardViewController *)self cardNavigationController];
  [v35 didMoveToParentViewController:self];

  [(BCCardViewController *)self _updateCardFrames];
  v36 = [(BCCardViewController *)self view];
  [v36 bounds];
  -[BCCardViewController updateContentSize:](self, "updateContentSize:", v37, v38);

  v39 = [(BCCardViewController *)self contentContainerView];
  [v39 setClipsToBounds:1];

  [(BCCardViewController *)self setRoundedCorners:1];
  id v40 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"dismissPan:"];
  [v40 setDelegate:self];
  [(BCCardViewController *)self setDismissPanGestureRecognizer:v40];
  v41 = [(BCCardViewController *)self cardNavigationController];
  v42 = [v41 navigationBar];
  [v42 addGestureRecognizer:v40];

  if (!self->_uppEnabled)
  {
    v43 = +[BCCardGripperView cardGripperViewWithStyle:0];
    gripperView = self->_gripperView;
    self->_gripperView = v43;

    [(BCCardGripperView *)self->_gripperView setAlpha:0.0];
    v45 = [(BCCardGripperView *)self->_gripperView layer];
    [v45 setZPosition:1000.0];

    [(BCCardGripperView *)self->_gripperView _accessibilitySetSortPriority:999];
    v46 = [(BCCardViewController *)self gripperView];
    [v46 setAccessibilityDelegate:self];

    v47 = [(BCCardViewController *)self cardView];
    v48 = [(BCCardViewController *)self gripperView];
    [v47 addSubview:v48];

    v49 = [(BCCardViewController *)self gripperView];
    v50 = [(BCCardViewController *)self cardNavigationController];
    v51 = [v50 view];
    [(BCCardViewController *)self anchorGripperView:v49 toView:v51];

    id v52 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"gripperTapped:"];
    v53 = [(BCCardViewController *)self gripperView];
    [v53 addGestureRecognizer:v52];

    [(BCCardViewController *)self _setupGripperMenu];
  }
  id v54 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"scrollViewTapped:"];
  [v54 setDelegate:self];
  v55 = [(BCCardViewController *)self scrollView];
  [v55 addGestureRecognizer:v54];

  v56 = +[BCCardSetState contractedState];
  [(BCCardViewController *)self _setCurrentState:v56 updateStatusBarIfNeeded:0];

  v57 = [(BCCardViewController *)self scrollView];
  [v57 _addScrollViewScrollObserver:self];

  [(BCCardViewController *)self _updateFromMetrics];
}

- (void)anchorGripperView:(id)a3 toView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v8 = [(BCCardViewController *)self configuration];
  [v8 auxiliaryNavigationBarHorizontalInset];
  double v10 = v9;

  id v11 = [(BCCardViewController *)self configuration];
  [v11 auxiliaryNavigationBarVerticalInset];
  double v13 = v12;

  double v14 = [v7 topAnchor];
  double v15 = [v6 topAnchor];
  double v16 = [v14 constraintEqualToAnchor:v15 constant:v13];

  double v17 = [v7 trailingAnchor];
  double v18 = [v6 trailingAnchor];

  double v19 = [v17 constraintEqualToAnchor:v18 constant:-v10];

  id v20 = [(BCCardViewController *)self gripperView];

  if (v20 == v7) {
    [(BCCardViewController *)self setAuxiliaryNavigationBarTopConstraint:v16];
  }
  v22[0] = v16;
  v22[1] = v19;
  v21 = +[NSArray arrayWithObjects:v22 count:2];
  +[NSLayoutConstraint activateConstraints:v21];
}

- (UIView)auxiliaryNavigationBarView
{
  if (self->_uppEnabled)
  {
    v2 = [(BCCardViewController *)self auxiliaryNavigationBarViewController];
    BOOL v3 = [v2 view];
  }
  else
  {
    BOOL v3 = [(BCCardViewController *)self gripperView];
  }

  return (UIView *)v3;
}

- (UIView)auxiliaryNavigationBarViewForAnimation
{
  v2 = [(BCCardViewController *)self auxiliaryNavigationBarViewController];
  BOOL v3 = [v2 animatableCopyView];

  return (UIView *)v3;
}

- (void)attachAuxiliaryNavigationBarViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BCCardViewController *)self auxiliaryNavigationBarViewController];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 parentViewController];

    if (!v7)
    {
      [(BCCardViewController *)self addChildViewController:v6];
      objc_super v8 = [(BCCardViewController *)self contentContainerView];
      double v9 = [v6 view];
      [v8 addSubview:v9];

      [v6 didMoveToParentViewController:self];
      double v10 = [v6 view];
      id v11 = [(BCCardViewController *)self cardNavigationController];
      double v12 = [v11 view];
      [(BCCardViewController *)self anchorAuxiliaryNavigationBarView:v10 toView:v12];

      if (v3)
      {
        double v13 = [v6 view];
        [v13 alpha];
        double v15 = v14;

        if (v15 != 0.0)
        {
          double v16 = [v6 view];
          [v16 alpha];
          uint64_t v18 = v17;

          double v19 = +[UISpringTimingParameters bc_swiftUIDefault];
          id v20 = objc_alloc((Class)UIViewPropertyAnimator);
          [v19 settlingDuration];
          id v21 = [v20 initWithDuration:v19];
          id v22 = [v6 view];
          [v22 setAlpha:0.0];

          double v23 = _NSConcreteStackBlock;
          uint64_t v24 = 3221225472;
          double v25 = sub_B508;
          v26 = &unk_2C3C28;
          id v27 = v6;
          uint64_t v28 = v18;
          [v21 addAnimations:&v23];
          [v21 startAnimation:v23, v24, v25, v26];
        }
      }
    }
  }
}

- (double)auxiliaryNavigationBarHeight
{
  v2 = [(BCCardViewController *)self cardNavigationController];
  BOOL v3 = [v2 navigationBar];
  [v3 defaultHeightForMetrics:0];
  double v5 = v4;

  return v5;
}

- (void)anchorAuxiliaryNavigationBarView:(id)a3 toView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v8 = [v7 topAnchor];
  double v9 = [v6 topAnchor];
  double v10 = [v8 constraintEqualToAnchor:v9];

  id v11 = [v7 leadingAnchor];
  double v12 = [v6 leadingAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12];

  double v14 = [v7 trailingAnchor];
  double v15 = [v6 trailingAnchor];

  double v16 = [v14 constraintEqualToAnchor:v15];

  id v17 = [(BCCardViewController *)self auxiliaryNavigationBarView];

  if (v17 == v7) {
    [(BCCardViewController *)self setAuxiliaryNavigationBarTopConstraint:v10];
  }
  v19[0] = v10;
  v19[1] = v13;
  v19[2] = v16;
  uint64_t v18 = +[NSArray arrayWithObjects:v19 count:3];
  +[NSLayoutConstraint activateConstraints:v18];
}

- (void)_setAuxiliaryNavigationBarViewAlpha:(double)a3
{
  if (self->_uppEnabled) {
    [(BCCardViewController *)self auxiliaryNavigationBarView];
  }
  else {
  id v4 = [(BCCardViewController *)self gripperView];
  }
  [v4 setAlpha:a3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BCCardViewController;
  [(BCCardViewController *)&v8 viewWillAppear:a3];
  id v4 = [(BCCardViewController *)self cardSetData];
  if ([v4 covered])
  {

LABEL_5:
    id v7 = [(BCCardViewController *)self auxiliaryNavigationBarViewController];
    [v7 setIsParentCardOccluded:1];
    goto LABEL_6;
  }
  unsigned int v5 = [(BCCardViewController *)self isCurrentCard];

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = [(BCCardViewController *)self auxiliaryNavigationBarViewController];
  [v6 setIsParentCardOccluded:0];

  id v7 = [(BCCardViewController *)self topContentViewController];
  [v7 didBecomeVisibleContentScrollView];
LABEL_6:
}

- (void)bc_analyticsVisibilityDidAppear
{
  v7.receiver = self;
  v7.super_class = (Class)BCCardViewController;
  [(BCCardViewController *)&v7 bc_analyticsVisibilityDidAppear];
  BOOL v3 = [(BCCardViewController *)self cardSetData];
  if ([v3 covered])
  {
  }
  else
  {
    unsigned int v4 = [(BCCardViewController *)self isCurrentCard];

    if (v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_B99C;
      block[3] = &unk_2C3C50;
      block[4] = self;
      dispatch_after(0, (dispatch_queue_t)&_dispatch_main_q, block);
      return;
    }
  }
  unsigned int v5 = [(BCCardViewController *)self auxiliaryNavigationBarViewController];
  [v5 setIsParentCardOccluded:1];
}

- (void)bc_analyticsVisibilityDidDisappear
{
  v4.receiver = self;
  v4.super_class = (Class)BCCardViewController;
  [(BCCardViewController *)&v4 bc_analyticsVisibilityDidDisappear];
  BOOL v3 = [(BCCardViewController *)self auxiliaryNavigationBarViewController];
  [v3 setIsParentCardOccluded:1];
}

- (void)scrollViewTapped:(id)a3
{
  if ([a3 state] == (char *)&def_7D91C + 3)
  {
    id v4 = [(BCCardViewController *)self delegate];
    [v4 cardViewControllerDidTapScrollView:self];
  }
}

- (void)cardTapped:(id)a3
{
  if ([a3 state] == (char *)&def_7D91C + 3)
  {
    id v4 = [(BCCardViewController *)self delegate];
    [v4 cardViewControllerDidTapCard:self];
  }
}

- (void)dismissPan:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCardViewController *)self currentState];
  [v5 cardViewController:self dismissPan:v4 cardData:self];
}

- (void)_setupGripperMenu
{
  [(BCCardGripperView *)self->_gripperView setContextMenuInteractionEnabled:1];
  [(BCCardGripperView *)self->_gripperView setMenuViewController:self];
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_BCA4;
  v3[3] = &unk_2C3CA0;
  objc_copyWeak(&v4, &location);
  [(BCCardGripperView *)self->_gripperView setActionProvider:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)gripperTapped:(id)a3
{
  if ([a3 state] == (char *)&def_7D91C + 3)
  {
    id v4 = [(BCCardViewController *)self cardStackViewController];
    [v4 popCardsAnimated:1 reason:1];
  }
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [(BCCardViewController *)self cardStackViewController];
  [v2 popCardsAnimated:1 reason:0];

  return 1;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BCCardViewController;
  [(BCCardViewController *)&v3 viewWillLayoutSubviews];
  [(BCCardViewController *)self _updateCardFrames];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)BCCardViewController;
  id v7 = a4;
  -[BCCardViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_C2A4;
  v9[3] = &unk_2C3BE0;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_C494;
  v8[3] = &unk_2C3BE0;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

- (void)_updateCardFrames
{
  objc_super v3 = [(BCCardViewController *)self currentState];

  if (v3)
  {
    if ([(BCCardViewController *)self dismissing]) {
      goto LABEL_6;
    }
    id v4 = [(BCCardViewController *)self currentState];
  }
  else
  {
    id v4 = +[BCCardSetState contractedState];
  }
  id v5 = v4;
  [v4 cardViewControllerUpdateCardSize:self];

LABEL_6:
  id v6 = [(BCCardViewController *)self cardView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(BCCardViewController *)self contentContainerView];
  [v15 setFrame:v8, v10, v12, v14];

  [(BCCardViewController *)self _updateShadowPath];
}

- (void)updateContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(BCCardViewController *)self currentState];
  [v6 cardViewController:self updateContentSize:width, height];
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v34 = a3;
  id v4 = [(BCCardViewController *)self scrollView];
  if (v4 == v34)
  {
  }
  else
  {
    id v5 = [(BCCardViewController *)self contentScrollView];

    if (v5 != v34) {
      goto LABEL_14;
    }
  }
  if (self->_uppEnabled) {
    [(BCCardViewController *)self auxiliaryNavigationBarView];
  }
  else {
  id v6 = [(BCCardViewController *)self gripperView];
  }
  double v7 = [(BCCardViewController *)self currentState];
  [v7 cardViewController:self positionAuxiliaryNavigationBarView:v6 cardDate:self];

  if (self->_uppEnabled)
  {
    double v8 = [(BCCardViewController *)self auxiliaryNavigationBarView];
    [v8 alpha];
    if (v9 != 1.0)
    {
LABEL_12:

      goto LABEL_13;
    }
    double v10 = [(BCCardViewController *)self cardNavigationController];
    double v11 = [v10 viewControllers];
    double v12 = (char *)[v11 count];

    if (v12 == (unsigned char *)&def_7D91C + 1)
    {
      double v8 = [(BCCardViewController *)self auxiliaryNavigationBarViewController];
      [v8 cardViewController:self positionAuxiliaryNavigationBarBackgroundWithData:self];
      goto LABEL_12;
    }
  }
LABEL_13:

LABEL_14:
  double v13 = [(BCCardViewController *)self currentState];
  unsigned __int8 v14 = [v13 ignoreContentOffsetForCardViewController:self];

  if (v14) {
    goto LABEL_26;
  }
  id v15 = [(BCCardViewController *)self contentScrollView];

  if (v15 == v34)
  {
    double v19 = [(BCCardViewController *)self currentState];
    id v20 = [(BCCardViewController *)self contentScrollView];
    [v19 cardViewController:self cardScrollViewOffsetForContentScrollView:v20 cardData:self];
    double v22 = v21;

    double v23 = [(BCCardViewController *)self scrollView];
    [v23 contentOffset];
    double v25 = v24;
    double v27 = v26;

    uint64_t v28 = +[UIScreen mainScreen];
    [v28 scale];
    double v30 = 1.0 / v29;

    if (vabdd_f64(v22, v27) < v30) {
      goto LABEL_26;
    }
    v31 = [(BCCardViewController *)self scrollView];
    [v31 setContentOffset:v25, v22];

    goto LABEL_23;
  }
  id v16 = [(BCCardViewController *)self scrollView];
  if (v16 != v34)
  {
LABEL_25:

    goto LABEL_26;
  }
  id v17 = [(BCCardViewController *)self scrollView];
  if ([v17 isDecelerating]) {
    goto LABEL_20;
  }
  uint64_t v18 = [(BCCardViewController *)self scrollView];
  if ([v18 isDragging])
  {

LABEL_20:
    id v16 = v34;
LABEL_24:

    goto LABEL_25;
  }
  v32 = [(BCCardViewController *)self cardSetData];
  unsigned __int8 v33 = [v32 isInTransitionUpdateMode];

  if ((v33 & 1) == 0)
  {
LABEL_23:
    id v16 = [(BCCardViewController *)self currentState];
    id v17 = [(BCCardViewController *)self contentScrollView];
    [v16 cardViewController:self repositionOffsetsWithContentScrollView:v17 cardData:self];
    goto LABEL_24;
  }
LABEL_26:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (off_33EA60 == a6)
  {
    if ([a3 isEqualToString:@"contentSize"])
    {
      id v12 = [(BCCardViewController *)self contentScrollView];

      if (v12 == v10)
      {
        objc_opt_class();
        double v13 = [v11 objectForKeyedSubscript:NSKeyValueChangeNewKey];
        unsigned __int8 v14 = BUDynamicCast();

        [v14 CGSizeValue];
        double v16 = v15;
        double v18 = v17;
        objc_opt_class();
        double v19 = [v11 objectForKeyedSubscript:NSKeyValueChangeOldKey];
        id v20 = BUDynamicCast();

        [v20 CGSizeValue];
        if (v22 != v16 || v21 != v18)
        {
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_CBAC;
          v24[3] = &unk_2C3CC8;
          v24[4] = self;
          *(double *)&v24[5] = v16;
          *(double *)&v24[6] = v18;
          +[UIView performWithoutAnimation:v24];
        }
      }
    }
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)BCCardViewController;
    [(BCCardViewController *)&v25 observeValueForKeyPath:a3 ofObject:v10 change:v11 context:a6];
  }
}

- (BCCardContent)topContentViewController
{
  v2 = [(BCCardViewController *)self cardNavigationController];
  objc_super v3 = [v2 topViewController];
  objc_opt_class();
  id v4 = BUClassAndProtocolCast();

  return (BCCardContent *)v4;
}

- (void)_applyContentInsetToContentViewController:(id)a3
{
  id v15 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(BCCardViewController *)self cardNavigationController];
    id v5 = [v4 viewControllers];
    id v6 = [v5 firstObject];
    if (v6 == v15) {
      [(BCCardViewController *)self contentInset];
    }
    else {
      [(BCCardViewController *)self contentInsetForContent];
    }
    double v11 = v7;
    double v12 = v8;
    double v13 = v9;
    double v14 = v10;

    -[BCCardViewController _updateViewController:withContentInset:unalteredContentInset:](self, "_updateViewController:withContentInset:unalteredContentInset:", v15, v11, v12, v13, v14, self->_unalteredContentInset.top, self->_unalteredContentInset.left, self->_unalteredContentInset.bottom, self->_unalteredContentInset.right);
  }
}

- (void)_updateContentWithContentInset
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = [(BCCardViewController *)self cardNavigationController];
  id v4 = [v3 viewControllers];

  id v5 = (char *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        double v9 = BUClassAndProtocolCast();
        -[BCCardViewController _applyContentInsetToContentViewController:](self, "_applyContentInsetToContentViewController:", v9, &OBJC_PROTOCOL___BCCardContent);

        ++v8;
      }
      while (v6 != v8);
      id v6 = (char *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  self->_unalteredContentInset = a3;
  double v8 = [(BCCardViewController *)self configuration];
  unsigned __int8 v9 = [v8 cardsCanExpand];

  if ((v9 & 1) == 0)
  {
    long long v10 = [(BCCardViewController *)self cardSetViewController];
    long long v11 = [v10 view];
    long long v12 = [(BCCardViewController *)self cardSetViewController];
    long long v13 = [v12 view];
    [v13 bounds];
    [v11 convertRect:0 toView:];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v31.origin.x = v15;
    v31.origin.y = v17;
    v31.size.double width = v19;
    v31.size.double height = v21;
    double MaxY = CGRectGetMaxY(v31);
    double v23 = [(BCCardViewController *)self cardView];
    [v23 frame];
    double v24 = CGRectGetMaxY(v32);

    double v25 = v24 - MaxY;
    if (v24 - MaxY <= 0.0) {
      double v25 = -0.0;
    }
    double bottom = bottom + v25;
  }
  double v26 = self->_contentInset.top;
  if (self->_contentInset.left != left
    || v26 != top
    || self->_contentInset.right != right
    || self->_contentInset.bottom != bottom)
  {
    self->_contentInset.double top = top;
    self->_contentInset.double left = left;
    self->_contentInset.double bottom = bottom;
    self->_contentInset.double right = right;
    [(BCCardViewController *)self contentInsetForContent];
    UIEdgeInsetsReplace();
    -[BCCardViewController setContentInsetForContent:](self, "setContentInsetForContent:");
    [(BCCardViewController *)self _updateScrollViewContentInset];
    [(BCCardViewController *)self _updateContentWithContentInset];
  }
}

- (UIEdgeInsets)_scrollIndicatorInsetsForContentInset:(UIEdgeInsets)a3 unalteredContentInset:(UIEdgeInsets)a4
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  double top = a3.top;
  unsigned __int8 v9 = [(BCCardViewController *)self configuration];
  unsigned __int8 v10 = [v9 cardsCanExpand];

  if ((v10 & 1) == 0)
  {
    long long v11 = [(BCCardViewController *)self cardSetViewController];
    [v11 scaledContractedOffset];

    if (top == 0.0)
    {
      long long v12 = [(BCCardViewController *)self configuration];
      [v12 cardCornerRadius];
    }
    UIEdgeInsetsReplace();
    double top = v13;
    CGFloat left = v14;
    CGFloat bottom = v15;
    CGFloat right = v16;
  }
  double v17 = top;
  double v18 = left;
  double v19 = bottom;
  double v20 = right;
  result.CGFloat right = v20;
  result.CGFloat bottom = v19;
  result.CGFloat left = v18;
  result.double top = v17;
  return result;
}

- (void)_updateViewController:(id)a3 withContentInset:(UIEdgeInsets)a4 unalteredContentInset:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double v9 = a4.right;
  double v10 = a4.bottom;
  double v11 = a4.left;
  double v12 = a4.top;
  id v14 = a3;
  id v15 = [v14 scrollView];
  -[BCCardViewController _updateViewController:scrollView:withContentInset:unalteredContentInset:contentInsetForScrollIndicatorInsets:](self, "_updateViewController:scrollView:withContentInset:unalteredContentInset:contentInsetForScrollIndicatorInsets:", v14, v15, v12, v11, v10, v9, top, left, bottom, right, *(void *)&v12, *(void *)&v11, *(void *)&v10, *(void *)&v9);
}

- (void)_updateViewController:(double)a3 scrollView:(double)a4 withContentInset:(double)a5 unalteredContentInset:(double)a6 contentInsetForScrollIndicatorInsets:(double)a7
{
  id v45 = a11;
  id v26 = a12;
  if ([v45 prefersAdditionalSafeAreaInsetsForInsetting])
  {
    double v27 = a4 - BCCardAdditionalBottomInset();
    uint64_t v28 = [v45 viewIfLoaded];
    [v28 safeAreaInsets];
    double v30 = v29;
    [v45 additionalSafeAreaInsets];
    double v32 = v30 - v31;

    [v45 setAdditionalSafeAreaInsets:0.0, 0.0, v27 - v32, 0.0];
  }
  else
  {
    uint64_t v33 = [a1 scrollView];
    if ((id)v33 == v26)
    {

      double v36 = a5;
      double v37 = a15;
      double v39 = a4;
      double v38 = a14;
      double v40 = a3;
    }
    else
    {
      id v34 = (void *)v33;
      v35 = (char *)[v26 contentInsetAdjustmentBehavior];

      double v36 = a5;
      double v37 = a15;
      double v39 = a4;
      double v38 = a14;
      double v40 = a3;
      if (v35 != (unsigned char *)&def_7D91C + 2) {
        [v26 setContentInsetAdjustmentBehavior:2];
      }
    }
    [v26 setContentInset:a2, v40, v39, v36];
    [a1 _scrollIndicatorInsetsForContentInset:a13 unalteredContentInset:v38 contentInset:v37 scrollIndicatorInsets:a16];
    [v26 setScrollIndicatorInsets:];
  }
}

- (void)_updateScrollViewContentInset
{
  objc_super v3 = [(BCCardViewController *)self currentState];
  if ([v3 useContentInsetForContentForScrollIndicatorInsets]) {
    [(BCCardViewController *)self contentInsetForContent];
  }
  else {
    [(BCCardViewController *)self contentInset];
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  uint64_t v10 = v6;
  uint64_t v11 = v7;

  id v12 = [(BCCardViewController *)self scrollView];
  [(BCCardViewController *)self contentInset];
  -[BCCardViewController _updateViewController:scrollView:withContentInset:unalteredContentInset:contentInsetForScrollIndicatorInsets:](self, "_updateViewController:scrollView:withContentInset:unalteredContentInset:contentInsetForScrollIndicatorInsets:", 0, v12, v8, v9, v10, v11);
}

- (void)setupRootContentScrollView:(id)a3
{
  id v4 = a3;
  [v4 setAlwaysBounceVertical:1];
  [(BCCardViewController *)self setContentScrollView:v4];
}

- (void)setContentViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v14 = v4;
    uint64_t v6 = +[NSArray arrayWithObjects:&v14 count:1];
  }
  else
  {
    uint64_t v6 = &__NSArray0__struct;
  }
  uint64_t v7 = [(BCCardViewController *)self cardNavigationController];
  [v7 setViewControllers:v6];

  if (v5) {
  [(BCCardViewController *)self _applyContentInsetToContentViewController:v5];
  }
  uint64_t v8 = [v5 scrollView];
  [(BCCardViewController *)self setupRootContentScrollView:v8];
  uint64_t v9 = [(BCCardViewController *)self cardNavigationController];
  [v9 bc_updateNavBarVisibleWithTransitionCoordinator:0 duration:0.0];

  uint64_t v10 = BUProtocolCast();
  [v10 setBcSafeAreaInsetsObserver:self];
  if (self->_uppEnabled && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_D734;
    v11[3] = &unk_2C3CF0;
    objc_copyWeak(&v12, &location);
    [v5 auxiliaryNavigationBarViewControllerWithCompletionHandler:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)setContentScrollView:(id)a3
{
}

- (BCCardStackTransitioningCardContent)transitioningCardContent
{
  v2 = [(BCCardViewController *)self cardNavigationController];
  objc_super v3 = [v2 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCCardStackTransitioningCardContent];

  return (BCCardStackTransitioningCardContent *)v3;
}

- (void)setScrimAlpha:(double)a3 animated:(BOOL)a4 duration:(double)a5
{
  BOOL v6 = a4;
  uint64_t v9 = [(BCCardViewController *)self blackScrimView];

  if (v9)
  {
    if (v6)
    {
LABEL_3:
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_DEDC;
      v26[3] = &unk_2C3C28;
      v26[4] = self;
      *(double *)&v26[5] = a3;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_DF30;
      v25[3] = &unk_2C3D18;
      *(double *)&v25[5] = a3;
      v25[4] = self;
      +[UIView animateWithDuration:v26 animations:v25 completion:a5];
      return;
    }
  }
  else
  {
    if (a3 == 0.0) {
      return;
    }
    id v10 = objc_alloc((Class)UIView);
    uint64_t v11 = [(BCCardViewController *)self cardView];
    [v11 bounds];
    id v12 = [v10 initWithFrame:];
    [(BCCardViewController *)self setBlackScrimView:v12];

    double v13 = [(BCCardViewController *)self blackScrimView];
    [v13 setAutoresizingMask:18];

    id v14 = [(BCCardViewController *)self cardView];
    id v15 = [(BCCardViewController *)self blackScrimView];
    [v14 addSubview:v15];

    double v16 = +[UIColor blackColor];
    double v17 = [(BCCardViewController *)self blackScrimView];
    [v17 setBackgroundColor:v16];

    double v18 = [(BCCardViewController *)self blackScrimView];
    [v18 setAlpha:0.0];

    double v19 = [(BCCardViewController *)self contentContainerView];
    [v19 _continuousCornerRadius];
    double v21 = v20;
    double v22 = [(BCCardViewController *)self blackScrimView];
    [v22 _setContinuousCornerRadius:v21];

    if (v6) {
      goto LABEL_3;
    }
  }
  double v23 = [(BCCardViewController *)self blackScrimView];
  [v23 setAlpha:a3];

  if (a3 == 0.0)
  {
    double v24 = [(BCCardViewController *)self blackScrimView];
    [v24 removeFromSuperview];

    [(BCCardViewController *)self setBlackScrimView:0];
  }
}

- (void)_configureAsExpanded
{
  [(BCCardViewController *)self setRoundedCorners:0];
  objc_super v3 = [(BCCardViewController *)self scrollView];
  [v3 contentOffset];
  double v5 = v4;
  [(BCCardViewController *)self distanceToExpand];
  double v7 = v6;
  uint64_t v8 = [(BCCardViewController *)self scrollView];
  [v8 adjustedContentInset];
  double v10 = v7 - v9;
  uint64_t v11 = [(BCCardViewController *)self scrollView];
  [v11 setContentOffset:v5, v10];

  id v12 = +[BCCardSetState expandedState];
  [(BCCardViewController *)self setCurrentState:v12];

  double v13 = [(BCCardViewController *)self currentState];
  [v13 cardViewControllerAuxiliaryNavigationBarAlpha:self cardData:self];
  double v15 = v14;

  [(BCCardViewController *)self _setAuxiliaryNavigationBarViewAlpha:v15];
}

- (void)configureChromeForExpanded
{
  [(BCCardViewController *)self setRoundedCorners:0];
  objc_super v3 = +[BCCardSetState cardViewControllerExpandedState:self];
  [v3 cardViewControllerAuxiliaryNavigationBarAlpha:self cardData:self];
  double v5 = v4;

  [(BCCardViewController *)self _setAuxiliaryNavigationBarViewAlpha:v5];
}

- (void)configureChromeForContracted
{
  [(BCCardViewController *)self setRoundedCorners:1];
  objc_super v3 = +[BCCardSetState cardViewControllerExpandedState:self];
  [v3 cardViewControllerAuxiliaryNavigationBarAlpha:self cardData:self];
  double v5 = v4;

  [(BCCardViewController *)self _setAuxiliaryNavigationBarViewAlpha:v5];
}

- (void)goExpanded
{
  id v29 = [(BCCardViewController *)self currentState];
  id v3 = +[BCCardSetState expandedState];
  if (v29 == v3)
  {
  }
  else
  {
    double v4 = [(BCCardViewController *)self currentState];
    double v5 = +[BCCardSetState pushedState];

    if (v4 == v5) {
      return;
    }
    double v6 = [(BCCardViewController *)self cardSetViewController];
    double v7 = [v6 currentCardViewController];

    if (v7 != self)
    {
      [(BCCardViewController *)self _configureAsExpanded];
      return;
    }
    uint64_t v8 = +[BCCardSetState expandingState];
    [(BCCardViewController *)self setCurrentState:v8];

    double v9 = [(BCCardViewController *)self animator];
    [v9 setFractionComplete:1.0];

    double v10 = [(BCCardViewController *)self cardNavigationController];
    uint64_t v11 = [v10 viewControllers];
    id v12 = (char *)[v11 count];

    if (v12 == (unsigned char *)&def_7D91C + 1)
    {
      double v13 = [(BCCardViewController *)self scrollView];
      [v13 contentOffset];
      double v15 = v14;
      double v16 = [(BCCardViewController *)self cardSetViewController];
      [v16 scaledContractedOffset];
      double v18 = v17;
      double v19 = [(BCCardViewController *)self configuration];
      [v19 cardExpandedTopOffset];
      double v21 = v18 - v20;
      double v22 = [(BCCardViewController *)self scrollView];
      [v22 adjustedContentInset];
      double v24 = v21 - v23;
      double v25 = [(BCCardViewController *)self scrollView];
      [v25 setContentOffset:v15, v24];
    }
    id v26 = [(BCCardViewController *)self animator];
    [v26 stopAnimation:0];

    double v27 = [(BCCardViewController *)self animator];
    [v27 finishAnimationAtPosition:0];

    id v29 = [(BCCardViewController *)self currentState];
    uint64_t v28 = [(BCCardViewController *)self contentScrollView];
    [v29 cardViewController:self repositionOffsetsWithContentScrollView:v28 cardData:self];
  }
}

- (void)goContracted
{
  id v3 = [(BCCardViewController *)self currentState];
  uint64_t v4 = +[BCCardSetState contractedState];
  if (v3 == (void *)v4)
  {

LABEL_6:
    double v16 = [(BCCardViewController *)self configuration];
    unsigned int v17 = [v16 cardsCanExpand];

    if (!v17) {
      return;
    }
    goto LABEL_7;
  }
  double v5 = (void *)v4;
  double v6 = [(BCCardViewController *)self currentState];
  double v7 = +[BCCardSetState pushedContractedState];

  if (v6 == v7) {
    goto LABEL_6;
  }
  double y = CGPointZero.y;
  double v9 = [(BCCardViewController *)self scrollView];
  [v9 setContentOffset:CGPointZero.x, y];

  double v10 = +[BCCardSetState contractingState];
  [(BCCardViewController *)self setCurrentState:v10];

  uint64_t v11 = [(BCCardViewController *)self animator];
  [v11 setFractionComplete:1.0];

  id v12 = [(BCCardViewController *)self animator];
  [v12 stopAnimation:0];

  double v13 = [(BCCardViewController *)self animator];
  [v13 finishAnimationAtPosition:0];

  double v14 = [(BCCardViewController *)self configuration];
  unsigned __int8 v15 = [v14 cardsCanExpand];

  if ((v15 & 1) == 0) {
    return;
  }
LABEL_7:
  [(BCCardViewController *)self clearSavedContentOffsets];
  id v24 = [(BCCardViewController *)self scrollView];
  [v24 contentOffset];
  double v19 = v18;
  double v20 = [(BCCardViewController *)self scrollView];
  [v20 adjustedContentInset];
  double v22 = -v21;
  double v23 = [(BCCardViewController *)self scrollView];
  [v23 setContentOffset:v19, v22];
}

- (void)cardSetPresentationTransitionDidComplete
{
  if (self->_uppEnabled)
  {
    BOOL v3 = [(BCCardViewController *)self isCurrentCard];
    [(BCCardViewController *)self attachAuxiliaryNavigationBarViewAnimated:v3];
  }
}

- (void)suspendAndTeardownForReason:(id)a3
{
  id v4 = a3;
  [(BCCardViewController *)self setContentScrollView:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  double v5 = [(BCCardViewController *)self cardNavigationController];
  double v6 = [v5 viewControllers];

  double v7 = (char *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = BUProtocolCast();
        id v12 = v11;
        if (v11) {
          [v11 suspendAndTeardownForReason:v4];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = (char *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)clearSavedContentOffsets
{
  double y = CGPointZero.y;
  id v4 = [(BCCardViewController *)self scrollView];
  [v4 setContentOffset:CGPointZero.x, y];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  double v5 = [(BCCardViewController *)self cardNavigationController];
  double v6 = [v5 viewControllers];

  double v7 = (char *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = BUProtocolCast();
        [v11 clearSuspendedViewState];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = (char *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)resumeAndRebuildForReason:(id)a3
{
  id v4 = a3;
  double v5 = [(BCCardViewController *)self scrollView];
  [v5 contentOffset];
  double v7 = v6;
  uint64_t v8 = [(BCCardViewController *)self scrollView];
  [v8 adjustedContentInset];
  double v10 = v7 + v9;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v11 = [(BCCardViewController *)self cardNavigationController];
  long long v12 = [v11 viewControllers];

  long long v13 = (char *)[v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v13)
  {
    long long v14 = v13;
    uint64_t v15 = *(void *)v42;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v12);
        }
        unsigned int v17 = BUProtocolCast();
        id v18 = [v17 resumeAndRebuildForReason:v4];
      }
      long long v14 = (char *)[v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v14);
  }

  double v19 = [(BCCardViewController *)self scrollView];
  [v19 contentOffset];
  double v21 = v20;

  double v22 = [(BCCardViewController *)self scrollView];
  [v22 adjustedContentInset];
  double v24 = v10 - v23;

  double v25 = [(BCCardViewController *)self scrollView];
  [v25 setContentOffset:v21, v24];

  id v26 = [(BCCardViewController *)self cardNavigationController];
  double v27 = [v26 viewControllers];
  uint64_t v28 = [v27 firstObject];
  objc_opt_class();
  double v38 = &OBJC_PROTOCOL___BCCardContent;
  id v29 = BUClassAndProtocolCast();

  if (v29)
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_ECC8;
    v39[3] = &unk_2C3AF8;
    v39[4] = self;
    id v40 = v29;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v39, &OBJC_PROTOCOL___BCCardContent);
  }
  double v30 = [(BCCardViewController *)self cardNavigationController];
  double v31 = [v30 viewControllers];
  id v32 = [v31 count];

  if ((unint64_t)v32 >= 2)
  {
    uint64_t v33 = [(BCCardViewController *)self cardNavigationController];
    id v34 = [v33 viewControllers];
    v35 = [v34 lastObject];
    objc_opt_class();
    double v36 = BUClassAndProtocolCast();

    if (v36)
    {
      double v37 = [v36 scrollView];
      [(BCCardViewController *)self setContentScrollView:v37];

      [(BCCardViewController *)self _adjustContentInsetForViewController:v36];
      id v29 = v36;
    }
    else
    {
      id v29 = 0;
    }
  }
}

- (void)scrollToTop:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(BCCardViewController *)self topContentViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(BCCardViewController *)self topContentViewController];
    [v7 scrollToTopAnimated:v3];
  }
  else
  {
    id v7 = [(BCCardViewController *)self currentState];
    [v7 cardViewController:self scrollToTopAnimated:v3 cardData:self];
  }
}

- (void)prepareForDismiss
{
  id v3 = [(BCCardViewController *)self currentState];
  [v3 cardViewController:self willDismissWithCardData:self];
}

- (void)cardViewControllerScrollView:(id)a3 accessibilityWantsToScrollToOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(BCCardViewController *)self currentState];
  [v7 cardViewController:self accessibilityWantsToScrollToOffset:self cardData:x y:y];
}

- (UIEdgeInsets)accessibilityVisibleContentInsetForCardViewControllerScrollView:(id)a3
{
  [(BCCardViewController *)self contentInsetForContent];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  long long v12 = [(BCCardViewController *)self configuration];
  unsigned __int8 v13 = [v12 cardsCanExpand];

  if ((v13 & 1) == 0)
  {
    if (self->_uppEnabled) {
      [(BCCardViewController *)self auxiliaryNavigationBarView];
    }
    else {
    long long v14 = [(BCCardViewController *)self gripperView];
    }
    uint64_t v15 = [(BCCardViewController *)self scrollView];
    long long v16 = [v15 superview];
    [v14 frame];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v25 = [v14 superview];
    [v16 convertRect:v25 fromView:v18];
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;

    v38.origin.double x = v27;
    v38.origin.double y = v29;
    v38.size.double width = v31;
    v38.size.double height = v33;
    double v5 = v5 + CGRectGetMaxY(v38) + 4.0;
  }
  double v34 = v5;
  double v35 = v7;
  double v36 = v9;
  double v37 = v11;
  result.double right = v37;
  result.double bottom = v36;
  result.double left = v35;
  result.double top = v34;
  return result;
}

- (void)accessibilityDidActivateGripperView:(id)a3
{
  id v4 = [(BCCardViewController *)self delegate];
  [v4 cardViewControllerDidTapScrollView:self];
}

- (void)cardContentViewController:(id)a3 initializeManagerWithScrollView:(id)a4
{
  id v5 = a4;
  [(BCCardViewController *)self contentInset];
  [v5 safeAreaInsets];
  UIEdgeInsetsReplace();
  -[BCCardViewController setContentInsetForContent:](self, "setContentInsetForContent:");
  [(BCCardViewController *)self setupRootContentScrollView:v5];
}

- (UIEdgeInsets)cardContentViewController:(id)a3 contentInsetsForScrollingToRectWithContentInsets:(UIEdgeInsets)a4
{
  [(BCCardViewController *)self contentInsetForContent];
  id v5 = [(BCCardViewController *)self auxiliaryNavigationBarViewController];
  [v5 backgroundSafeAreaInsets];
  UIEdgeInsetsReplace();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.double right = v17;
  result.double bottom = v16;
  result.double left = v15;
  result.double top = v14;
  return result;
}

- (void)bcSafeAreaInsetsObservableViewController:(id)a3 safeAreaInsetsDidChange:(UIEdgeInsets)a4
{
  [(BCCardViewController *)self contentInset];
  UIEdgeInsetsReplace();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  -[BCCardViewController setContentInsetForContent:](self, "setContentInsetForContent:");
  double v13 = [(BCCardViewController *)self cardNavigationController];
  double v14 = [v13 viewControllers];
  id v15 = [v14 count];

  if ((unint64_t)v15 >= 2)
  {
    id v16 = [(BCCardViewController *)self topContentViewController];
    -[BCCardViewController _updateViewController:withContentInset:unalteredContentInset:](self, "_updateViewController:withContentInset:unalteredContentInset:", v16, v6, v8, v10, v12, self->_unalteredContentInset.top, self->_unalteredContentInset.left, self->_unalteredContentInset.bottom, self->_unalteredContentInset.right);
  }
}

- (CGRect)cardStackTransitioningCardFinalFrame
{
  [(BCCardViewController *)self viewFrameBeforeAnimation];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (double)cardStackTransitioningCardExtraXOffset
{
  [(BCCardViewController *)self extraXOffsetForAnimation];
  return result;
}

- (double)cardStackTransitioningCardContentAlpha
{
  double v2 = [(BCCardViewController *)self whiteScrimView];
  [v2 alpha];
  double v4 = v3;

  return v4;
}

- (void)setCardStackTransitioningCardContentAlpha:(double)a3
{
  id v4 = [(BCCardViewController *)self whiteScrimView];
  [v4 setAlpha:a3];
}

- (void)cardStackTransitioningCardPrepare:(BOOL)a3 extraXOffsetForAnimation:(double)a4
{
  double v6 = [(BCCardViewController *)self cardView];
  [v6 frame];
  -[BCCardViewController setViewFrameBeforeAnimation:](self, "setViewFrameBeforeAnimation:");

  [(BCCardViewController *)self setExtraXOffsetForAnimation:a4];
  id v7 = objc_alloc((Class)UIView);
  double v8 = [(BCCardViewController *)self cardView];
  [v8 bounds];
  id v9 = [v7 initWithFrame:];
  [(BCCardViewController *)self setWhiteScrimView:v9];

  double v10 = [(BCCardViewController *)self cardView];
  double v11 = [(BCCardViewController *)self whiteScrimView];
  [v10 addSubview:v11];

  double v12 = [(BCCardViewController *)self whiteScrimView];
  [v12 setAlpha:0.0];

  double v13 = +[UIColor bc_booksBackground];
  double v14 = [(BCCardViewController *)self whiteScrimView];
  [v14 setBackgroundColor:v13];

  id v18 = [(BCCardViewController *)self contentContainerView];
  [v18 _continuousCornerRadius];
  double v16 = v15;
  double v17 = [(BCCardViewController *)self whiteScrimView];
  [v17 _setContinuousCornerRadius:v16];
}

- (void)cardStackTransitioningCardFinalize:(BOOL)a3
{
  -[BCCardViewController setViewFrameBeforeAnimation:](self, "setViewFrameBeforeAnimation:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  id v4 = [(BCCardViewController *)self whiteScrimView];
  [v4 removeFromSuperview];

  [(BCCardViewController *)self setWhiteScrimView:0];
}

- (BOOL)expanded
{
  double v3 = [(BCCardViewController *)self currentState];
  id v4 = +[BCCardSetState expandedState];
  if (v3 == v4)
  {
    char v8 = 1;
  }
  else
  {
    double v5 = [(BCCardViewController *)self configuration];
    if ([v5 cardsCanExpand])
    {
      double v6 = [(BCCardViewController *)self currentState];
      id v7 = +[BCCardSetState pushedState];
      char v8 = v6 == v7;
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

- (void)setCurrentState:(id)a3
{
}

- (void)_setCurrentState:(id)a3 updateStatusBarIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (BCCardSetState *)a3;
  p_currentState = &self->_currentState;
  currentState = self->_currentState;
  if (currentState != v7)
  {
    double v15 = v7;
    [(BCCardSetState *)currentState willStopBeingCurrentStateCardViewController:self newState:v7 cardDate:self];
    double v10 = *p_currentState;
    objc_storeStrong((id *)&self->_currentState, a3);
    [(BCCardSetState *)*p_currentState didBecomeCurrentStateCardViewController:self previousState:v10 cardData:self];
    if (v4 && ![(BCCardSetState *)*p_currentState transitioning])
    {
      [(BCCardViewController *)self setNeedsStatusBarAppearanceUpdate];
      [(BCCardSetState *)*p_currentState cardViewControllerStatusBarBackgroundOpacity:self];
      double v12 = v11;
      double v13 = +[BCStatusBarBackgroundController backgroundControllerForViewController:self];
      [v13 setOpacity:v12];
    }
    double v14 = [(BCCardViewController *)self topContentViewController];
    [v14 didSetCurrentCardState:v15];
  }

  _objc_release_x1();
}

- (void)animationCompletedAtPosition:(int64_t)a3
{
  [(BCCardViewController *)self setAnimator:0];
  id v5 = [(BCCardViewController *)self currentState];
  [v5 cardViewController:self animationCompletedAtPosition:a3 cardData:self];
}

- (void)_adjustContentInsetForViewController:(id)a3
{
  id v13 = a3;
  [(BCCardViewController *)self contentInsetForContent];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = [(BCCardViewController *)self cardNavigationController];
  double v11 = [v10 navigationBar];
  [v11 frame];
  double MaxY = CGRectGetMaxY(v15);

  -[BCCardViewController setContentInsetForContent:](self, "setContentInsetForContent:", MaxY, v5, v7, v9);
  -[BCCardViewController _updateViewController:withContentInset:unalteredContentInset:](self, "_updateViewController:withContentInset:unalteredContentInset:", v13, MaxY, v5, v7, v9, self->_unalteredContentInset.top, self->_unalteredContentInset.left, self->_unalteredContentInset.bottom, self->_unalteredContentInset.right);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BCCardViewController *)self dismissPanGestureRecognizer];
  if ((id)v5 == v4)
  {

    goto LABEL_5;
  }
  double v6 = (void *)v5;
  id v7 = [(BCCardViewController *)self auxiliaryNavigationBarDismissPanGestureRecognizer];

  if (v7 == v4)
  {
LABEL_5:
    double v9 = [(BCCardViewController *)self currentState];
    unsigned __int8 v8 = [v9 cardViewController:self dismissPanShouldBegin:v4 cardData:self];

    goto LABEL_6;
  }
  unsigned __int8 v8 = 1;
LABEL_6:

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BCCardViewController *)self dismissPanGestureRecognizer];
  if ((id)v8 == v6)
  {
    char v13 = 1;
    double v11 = v6;
  }
  else
  {
    double v9 = (void *)v8;
    id v10 = [(BCCardViewController *)self auxiliaryNavigationBarDismissPanGestureRecognizer];

    if (v10 == v6)
    {
      char v13 = 1;
      goto LABEL_7;
    }
    double v11 = [v7 view];
    double v12 = [(BCCardViewController *)self scrollView];
    char v13 = v11 == v12;
  }
LABEL_7:

  return v13;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v6 = [(BCCardViewController *)self currentState];
  uint64_t v5 = [(BCCardViewController *)self contentScrollView];
  [v6 cardViewController:self cardData:self scrollViewWillBeginDragging:v4 contentScrollView:v5];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v10 = a3;
  if ([(BCCardViewController *)self settingContentOffset])
  {
    unsigned int v4 = 1;
  }
  else
  {
    uint64_t v5 = [(BCCardViewController *)self cardSetData];
    if ([v5 isInTransitionUpdateMode])
    {
      unsigned int v4 = 1;
    }
    else
    {
      id v6 = [(BCCardViewController *)self cardSetData];
      unsigned int v4 = [v6 covered];
    }
  }
  if (([v10 isDragging] & 1) != 0
    || ([v10 isDecelerating] & 1) != 0)
  {
    unsigned int v7 = 0;
  }
  else
  {
    unsigned int v7 = ![(BCCardViewController *)self scrollingToTop];
  }
  if (((v4 | v7) & 1) == 0)
  {
    uint64_t v8 = [(BCCardViewController *)self currentState];
    double v9 = [(BCCardViewController *)self contentScrollView];
    [v8 cardViewController:self cardData:self scrollViewDidScroll:v10 contentScrollView:v9];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(BCCardViewController *)self currentState];
  unsigned int v7 = [(BCCardViewController *)self contentScrollView];
  [v8 cardViewController:self cardData:self scrollViewDidEndDragging:v6 willDecelerate:v4 contentScrollView:v7];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v6 = [(BCCardViewController *)self currentState];
  uint64_t v5 = [(BCCardViewController *)self contentScrollView];
  [v6 cardViewController:self cardData:self scrollViewDidEndDecelerating:v4 contentScrollView:v5];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v11 = [(BCCardViewController *)self currentState];
  id v10 = [(BCCardViewController *)self contentScrollView];
  [v11 cardViewController:self cardData:self scrollViewWillEndDragging:v9 scrollViewWillEndDragging:v9 targetContentOffset:x contentScrollView:y];
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4 = [(BCCardViewController *)self cardStackViewController];
  uint64_t v5 = [v4 topCardSetViewController];
  id v6 = [(BCCardViewController *)self cardSetViewController];

  if (v5 == v6) {
    [(BCCardViewController *)self setScrollingToTop:1];
  }

  return v5 == v6;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
}

- (BOOL)bc_isPresentedInCardViewController
{
  return 1;
}

- (BOOL)prefersStatusBarBackgroundHidden
{
  double v2 = [(BCCardViewController *)self _preferredTargetState];
  double v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 prefersStatusBarBackgroundHidden];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (id)_preferredTargetState
{
  double v3 = [(BCCardViewController *)self cardNavigationController];
  unsigned __int8 v4 = [v3 viewControllers];
  uint64_t v5 = (char *)[v4 count];

  id v6 = [(BCCardViewController *)self cardNavigationController];
  unsigned int v7 = [v6 transitionCoordinator];
  id v8 = [v7 viewControllerForKey:UITransitionContextFromViewControllerKey];

  id v9 = [(BCCardViewController *)self cardNavigationController];
  id v10 = [v9 viewControllers];
  unsigned int v11 = [v10 containsObject:v8];

  if (v11) {
    BOOL v12 = v5 == (unsigned char *)&def_7D91C + 2;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    double v17 = [(BCCardViewController *)self configuration];
    if ([v17 cardsCanExpand])
    {
      unsigned int v18 = [(BCCardViewController *)self expanded];

      if (!v18) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    double v20 = [(BCCardViewController *)self configuration];
    if ([v20 cardsCanExpand]) {
      +[BCCardSetState pushedState];
    }
    else {
    double v19 = +[BCCardSetState pushedContractedState];
    }

    goto LABEL_22;
  }
  if (v5 == (unsigned char *)&def_7D91C + 1) {
    char v13 = v11;
  }
  else {
    char v13 = 1;
  }
  if (v13) {
    goto LABEL_14;
  }
  double v14 = [(BCCardViewController *)self configuration];
  unsigned __int8 v15 = [v14 cardsCanExpand];

  if ((v15 & 1) == 0)
  {
    uint64_t v16 = +[BCCardSetState contractedState];
    goto LABEL_21;
  }
  if (![(BCCardViewController *)self bottomCardWasExpanded])
  {
LABEL_14:
    double v19 = 0;
    goto LABEL_22;
  }
  uint64_t v16 = +[BCCardSetState expandedState];
LABEL_21:
  double v19 = (void *)v16;
LABEL_22:

  return v19;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v24 = a3;
  id v6 = [v24 transitionCoordinator];
  if (v6) {
    goto LABEL_10;
  }
  unsigned int v7 = [(BCCardViewController *)self configuration];
  if (![v7 cardsCanExpand])
  {

    goto LABEL_6;
  }
  unsigned int v8 = [(BCCardViewController *)self expanded];

  if (!v8)
  {
LABEL_6:
    uint64_t v9 = +[BCCardSetState cardViewControllerContractedState:self];
    goto LABEL_7;
  }
  uint64_t v9 = +[BCCardSetState cardViewControllerExpandedState:self];
LABEL_7:
  id v10 = (void *)v9;
  [(BCCardViewController *)self setCurrentState:v9];

  if (!self->_hasNotifiedScrollViewChangeForCurrentContentSV)
  {
    unsigned int v11 = [(BCCardViewController *)self currentState];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentScrollView);
    [v11 cardViewController:self contentScrollViewDidChange:WeakRetained cardData:self];
  }
  char v13 = [(BCCardViewController *)self currentState];
  [v13 cardViewControllerAuxiliaryNavigationBarAlpha:self cardData:self];
  double v15 = v14;

  [(BCCardViewController *)self _setAuxiliaryNavigationBarViewAlpha:v15];
LABEL_10:
  uint64_t v16 = [(BCCardViewController *)self cardSetViewController];
  double v17 = [v16 edgePanGestureRecognizer];
  if (v17)
  {
    unsigned int v18 = [v24 viewControllers];
    BOOL v19 = (unint64_t)[v18 count] < 3;
  }
  else
  {
    BOOL v19 = 0;
  }

  double v20 = [(BCCardViewController *)self cardSetViewController];
  double v21 = [v20 edgePanGestureRecognizer];
  [v21 setEnabled:v19];

  uint64_t v22 = v19 ^ 1;
  double v23 = [v24 interactivePopGestureRecognizer];
  [v23 setEnabled:v22];
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  char v13 = [(BCCardViewController *)self cardSetViewController];
  double v14 = [v13 currentCardViewController];

  if (v14 != self) {
    goto LABEL_7;
  }
  if (a4 != 2
    && ([v10 viewControllers],
        double v15 = objc_claimAutoreleasedReturnValue(),
        [v15 objectAtIndexedSubscript:0],
        id v16 = (id)objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v16 == v11))
  {
    [(BCCardViewController *)self setBottomCardWasExpanded:[(BCCardViewController *)self expanded]];
    char v17 = 1;
  }
  else
  {
    char v17 = 0;
  }
  unsigned int v18 = [(BCCardViewController *)self configuration];
  unsigned int v19 = [v18 cardsCanExpand];

  if (!v19 || [(BCCardViewController *)self bottomCardWasExpanded])
  {
LABEL_7:
    id v20 = 0;
    goto LABEL_8;
  }
  if (v17)
  {
    uint64_t v22 = &off_2C2800;
LABEL_13:
    id v20 = objc_alloc_init(*v22);
    goto LABEL_19;
  }
  if (a4 != 2)
  {
    id v20 = 0;
    goto LABEL_19;
  }
  double v23 = [v10 viewControllers];
  id v24 = [v23 objectAtIndexedSubscript:0];

  id v20 = 0;
  if (v24 == v12)
  {
    uint64_t v22 = off_2C27F8;
    goto LABEL_13;
  }
LABEL_19:
  double v25 = [(BCCardViewController *)self cardSetViewController];
  [v20 setCardSetViewController:v25];

LABEL_8:

  return v20;
}

- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  unsigned __int8 v4 = [(BCCardViewController *)self cardSetViewController];
  uint64_t v5 = [v4 percentDrivenInteractiveTransition];

  return v5;
}

- (BOOL)_navigationControllerShouldCrossFadeNavigationBar:(id)a3
{
  return 0;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 viewControllers];
  if ((unint64_t)[v5 count] > 2)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v6 = [v4 viewControllers];
    if ((unint64_t)[v6 count] < 2) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = [(BCCardViewController *)self bottomCardWasExpanded];
    }
  }
  return v7;
}

- (void)scrollViewDidChange
{
  double v3 = [(BCCardViewController *)self topContentViewController];
  id v4 = [v3 scrollView];
  [(BCCardViewController *)self setContentScrollView:v4];

  [(BCCardViewController *)self _updateCardFrames];
}

- (NSString)stringForReturnToRootBarItem
{
  double v2 = [(BCCardViewController *)self presentingViewController];
  double v3 = [v2 im_ancestorViewControllerConformingToProtocol:&OBJC_PROTOCOL___BCRootBarStringForReturnToRootBarItemProviding];

  id v4 = [v3 bc_stringForReturnToRootBarItem];

  return (NSString *)v4;
}

- (BOOL)auxiliaryNavigationBarViewControllerCanCloseAsset
{
  double v2 = self;
  double v3 = [(BCCardViewController *)self delegate];
  LOBYTE(v2) = [v3 cardViewControllerCanCloseAsset:v2];

  return (char)v2;
}

- (void)auxiliaryNavigationBarViewControllerDidTapCloseAllCards
{
  id v3 = [(BCCardViewController *)self delegate];
  [v3 cardViewControllerDidTapCloseAllCards:self];
}

- (void)auxiliaryNavigationBarViewControllerDidTapCloseAsset
{
  id v3 = [(BCCardViewController *)self delegate];
  [v3 cardViewControllerDidTapCloseAsset:self];
}

- (void)setIsBubbleTipPresented:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(BCCardViewController *)self scrollView];
  [v4 setScrollEnabled:v3];
}

- (double)rawCurrentCardOffset
{
  return self->_rawCurrentCardOffset;
}

- (void)setRawCurrentCardOffset:(double)a3
{
  self->_rawCurrentCardOffset = a3;
}

- (BOOL)settingContentOffset
{
  return self->_settingContentOffset;
}

- (void)setSettingContentOffset:(BOOL)a3
{
  self->_settingContentOffset = a3;
}

- (BOOL)dismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (UIViewPropertyAnimator)animator
{
  return self->_animator;
}

- (double)scrollViewVerticalVelocityWhenDraggingEnded
{
  return self->_scrollViewVerticalVelocityWhenDraggingEnded;
}

- (void)setScrollViewVerticalVelocityWhenDraggingEnded:(double)a3
{
  self->_scrollViewVerticalVelocityWhenDraggingEnded = a3;
}

- (CGPoint)oldContentOffset
{
  double x = self->_oldContentOffset.x;
  double y = self->_oldContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOldContentOffset:(CGPoint)a3
{
  self->_oldContentOffset = a3;
}

- (BCCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UINavigationController)cardNavigationController
{
  return self->_cardNavigationController;
}

- (void)setCardNavigationController:(id)a3
{
}

- (BOOL)roundedCorners
{
  return self->_roundedCorners;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BCCardStackConfiguration)configuration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);

  return (BCCardStackConfiguration *)WeakRetained;
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

- (UIEdgeInsets)contentInsetForContent
{
  double top = self->_contentInsetForContent.top;
  double left = self->_contentInsetForContent.left;
  double bottom = self->_contentInsetForContent.bottom;
  double right = self->_contentInsetForContent.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsetForContent:(UIEdgeInsets)a3
{
  self->_contentInsetForContent = a3;
}

- (UIView)cardView
{
  return self->_cardView;
}

- (void)setCardView:(id)a3
{
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
}

- (double)distanceToExpand
{
  return self->_distanceToExpand;
}

- (void)setDistanceToExpand:(double)a3
{
  self->_distanceToExpand = a3;
}

- (BCCardSetState)currentState
{
  return self->_currentState;
}

- (BCCardSetData)cardSetData
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardSetData);

  return (BCCardSetData *)WeakRetained;
}

- (void)setCardSetData:(id)a3
{
}

- (int64_t)sideCardAnimationCount
{
  return self->_sideCardAnimationCount;
}

- (void)setSideCardAnimationCount:(int64_t)a3
{
  self->_sideCardAnimationCount = a3;
}

- (BCCardSetNavigationSource)cardSetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardSetViewController);

  return (BCCardSetNavigationSource *)WeakRetained;
}

- (void)setCardSetViewController:(id)a3
{
}

- (UIScrollView)contentScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentScrollView);

  return (UIScrollView *)WeakRetained;
}

- (Class)navigationControllerClass
{
  return self->_navigationControllerClass;
}

- (void)setNavigationControllerClass:(Class)a3
{
}

- (UIView)blackScrimView
{
  return self->_blackScrimView;
}

- (void)setBlackScrimView:(id)a3
{
}

- (UIView)whiteScrimView
{
  return self->_whiteScrimView;
}

- (void)setWhiteScrimView:(id)a3
{
}

- (BCCardGripperView)gripperView
{
  return self->_gripperView;
}

- (void)setGripperView:(id)a3
{
}

- (CGRect)viewFrameBeforeAnimation
{
  double x = self->_viewFrameBeforeAnimation.origin.x;
  double y = self->_viewFrameBeforeAnimation.origin.y;
  double width = self->_viewFrameBeforeAnimation.size.width;
  double height = self->_viewFrameBeforeAnimation.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setViewFrameBeforeAnimation:(CGRect)a3
{
  self->_viewFrameBeforeAnimation = a3;
}

- (double)extraXOffsetForAnimation
{
  return self->_extraXOffsetForAnimation;
}

- (void)setExtraXOffsetForAnimation:(double)a3
{
  self->_extraXOffsetForAnimation = a3;
}

- (UITapGestureRecognizer)cardTapGestureRecognizer
{
  return self->_cardTapGestureRecognizer;
}

- (void)setCardTapGestureRecognizer:(id)a3
{
}

- (UIView)glassView
{
  return self->_glassView;
}

- (void)setGlassView:(id)a3
{
}

- (BOOL)bottomCardWasExpanded
{
  return self->_bottomCardWasExpanded;
}

- (void)setBottomCardWasExpanded:(BOOL)a3
{
  self->_bottomCardWasExpanded = a3;
}

- (BOOL)scrollingToTop
{
  return self->_scrollingToTop;
}

- (void)setScrollingToTop:(BOOL)a3
{
  self->_scrollingToTop = a3;
}

- (UIPanGestureRecognizer)dismissPanGestureRecognizer
{
  return self->_dismissPanGestureRecognizer;
}

- (void)setDismissPanGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)auxiliaryNavigationBarDismissPanGestureRecognizer
{
  return self->_auxiliaryNavigationBarDismissPanGestureRecognizer;
}

- (void)setAuxiliaryNavigationBarDismissPanGestureRecognizer:(id)a3
{
}

- (NSLayoutConstraint)gripperWidthConstraint
{
  return self->_gripperWidthConstraint;
}

- (void)setGripperWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)gripperHeightConstraint
{
  return self->_gripperHeightConstraint;
}

- (void)setGripperHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)auxiliaryNavigationBarTopConstraint
{
  return self->_auxiliaryNavigationBarTopConstraint;
}

- (void)setAuxiliaryNavigationBarTopConstraint:(id)a3
{
}

- (BCCardAuxiliaryNavigationBarViewController)auxiliaryNavigationBarViewController
{
  return self->_auxiliaryNavigationBarViewController;
}

- (void)setAuxiliaryNavigationBarViewController:(id)a3
{
}

- (BOOL)uppEnabled
{
  return self->_uppEnabled;
}

- (void)setUppEnabled:(BOOL)a3
{
  self->_uppEnabled = a3;
}

- (BCCardViewControllerViewState)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_auxiliaryNavigationBarViewController, 0);
  objc_storeStrong((id *)&self->_auxiliaryNavigationBarTopConstraint, 0);
  objc_storeStrong((id *)&self->_gripperHeightConstraint, 0);
  objc_storeStrong((id *)&self->_gripperWidthConstraint, 0);
  objc_storeStrong((id *)&self->_auxiliaryNavigationBarDismissPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_glassView, 0);
  objc_storeStrong((id *)&self->_cardTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_gripperView, 0);
  objc_storeStrong((id *)&self->_whiteScrimView, 0);
  objc_storeStrong((id *)&self->_blackScrimView, 0);
  objc_storeStrong((id *)&self->_navigationControllerClass, 0);
  objc_destroyWeak((id *)&self->_contentScrollView);
  objc_destroyWeak((id *)&self->_cardSetViewController);
  objc_destroyWeak((id *)&self->_cardSetData);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_destroyWeak((id *)&self->_configuration);
  objc_storeStrong((id *)&self->_cardNavigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animator, 0);

  objc_storeStrong((id *)&self->_rootScrollView, 0);
}

@end