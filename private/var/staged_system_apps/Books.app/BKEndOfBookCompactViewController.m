@interface BKEndOfBookCompactViewController
- (BKEndOfBookCardTransitionAnimationController)transitionAnimationController;
- (BKEndOfBookCompactViewController)initWithOptions:(id)a3;
- (BKEndOfBookCompactViewControllerDelegate)delegate;
- (BOOL)_shouldUseCoverAnimationWhenPresenting:(BOOL)a3;
- (BOOL)isPresented;
- (BOOL)isPresentingCard;
- (BOOL)isToolbarVisible;
- (BOOL)pageProgressionIsRTL;
- (BOOL)wasToolbarVisible;
- (BSUIFeedViewController)feedViewController;
- (CGRect)preferredFrameInViewController:(id)a3 isPresented:(BOOL)a4;
- (CGRect)preferredFrameInViewController:(id)a3 newSize:(CGSize)a4 isPresented:(BOOL)a5;
- (NSDictionary)options;
- (NSMutableArray)presentationCompletionBlocks;
- (UIView)closeButton;
- (UIView)contentView;
- (UIView)dropShadowView;
- (UIViewController)cardViewController;
- (id)_additionalInfoForClickEvent:(id)a3;
- (id)animationControllerForCompactViewController:(id)a3 cardViewController:(id)a4 isPresenting:(BOOL)a5;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)ba_analyticsTracker;
- (void)_anchorGripperView:(id)a3 toView:(id)a4;
- (void)_animateScaleForPressed:(BOOL)a3;
- (void)_closeAllCardsIncludingEOB:(id)a3 cardStackViewController:(id)a4 completion:(id)a5;
- (void)_contentTapBegan;
- (void)_contentTapCancelled;
- (void)_contentTapCompleted;
- (void)_forceOrientationBackToPortraitOrientation:(id)a3;
- (void)_gripperTapped:(id)a3;
- (void)_presentCardWithReason:(id)a3 completion:(id)a4;
- (void)_reportFigaroCloseClickEventWithReason:(id)a3;
- (void)_reportFigaroOpenClickEventWithReason:(id)a3;
- (void)_trackInteractiveDismissal;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_willDismissCardWithReason:(int64_t)a3;
- (void)dismiss;
- (void)endOfBookCardViewControllerDidFinish:(id)a3;
- (void)endOfBookCardViewControllerWantsToCloseAsset:(id)a3 cardStackViewController:(id)a4 completion:(id)a5;
- (void)endOfBookCardViewControllerWantsToCloseToAsset:(id)a3 cardStackViewController:(id)a4 completion:(id)a5;
- (void)preloadContentWithViewController:(id)a3 completion:(id)a4;
- (void)presentCardWithCompletion:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)setCardViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsPresented:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setPageProgressionIsRTL:(BOOL)a3;
- (void)setTransitionAnimationController:(id)a3;
- (void)setWasToolbarVisible:(BOOL)a3;
- (void)toastPresenter:(id)a3 willPresentToastInViewController:(id)a4;
- (void)toastPresenterWillDismissToast:(id)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKEndOfBookCompactViewController

- (BKEndOfBookCompactViewController)initWithOptions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKEndOfBookCompactViewController;
  v5 = [(BKEndOfBookCompactViewController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    [(BKEndOfBookCompactViewController *)v5 setOptions:v4];
    uint64_t v7 = +[NSMutableArray array];
    presentationCompletionBlocks = v6->_presentationCompletionBlocks;
    v6->_presentationCompletionBlocks = (NSMutableArray *)v7;

    v9 = +[UITraitCollection bc_allAPITraits];
    id v10 = [(BKEndOfBookCompactViewController *)v6 registerForTraitChanges:v9 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v6;
}

- (void)viewDidLoad
{
  v32.receiver = self;
  v32.super_class = (Class)BKEndOfBookCompactViewController;
  [(BKEndOfBookCompactViewController *)&v32 viewDidLoad];
  v3 = [(BKEndOfBookCompactViewController *)self view];
  [v3 setAutoresizingMask:0];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  [v3 setFrame:CGRectZero.origin.x, y, width, height];
  [v3 setShouldGroupAccessibilityChildren:1];
  [v3 setAccessibilityContainerType:4];
  uint64_t v7 = [(UIView *)[objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height]];
  [(UIView *)v7 setAutoresizingMask:34];
  v8 = [(UIView *)v7 layer];
  [v8 setCornerCurve:kCACornerCurveContinuous];
  [v8 setCornerRadius:22.0];
  [v8 setShadowOffset:0.0, 8.0];
  [v8 setShadowRadius:18.0];
  id v9 = +[UIColor blackColor];
  [v8 setShadowColor:[v9 CGColor]];

  LODWORD(v10) = 1041865114;
  [v8 setShadowOpacity:v10];
  [v8 setShadowPathIsBounds:1];
  v31 = v3;
  [v3 bounds];
  -[UIView setFrame:](v7, "setFrame:");
  [v3 addSubview:v7];
  dropShadowView = self->_dropShadowView;
  self->_dropShadowView = v7;
  objc_super v12 = v7;

  v13 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(UIView *)v13 setAutoresizingMask:18];
  [(UIView *)v13 setClipsToBounds:1];
  v30 = [(UIView *)v13 layer];
  [v30 setCornerCurve:kCACornerCurveContinuous];
  [v30 setCornerRadius:22.0];
  v29 = v12;
  [(UIView *)v12 bounds];
  -[UIView setFrame:](v13, "setFrame:");
  [(UIView *)v12 addSubview:v13];
  contentView = self->_contentView;
  self->_contentView = v13;
  v15 = v13;

  v16 = objc_alloc_init(_BKEndOfBookToastBlurEffectView);
  [(UIView *)v15 bounds];
  -[_BKEndOfBookToastBlurEffectView setFrame:](v16, "setFrame:");
  [(UIView *)v15 addSubview:v16];
  id v17 = [objc_alloc((Class)UIControl) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v17 setAutoresizingMask:18];
  [(_BKEndOfBookToastBlurEffectView *)v16 bounds];
  [v17 setFrame:];
  [(_BKEndOfBookToastBlurEffectView *)v16 addSubview:v17];
  [v17 addTarget:self action:"_contentTapBegan" forControlEvents:17];
  [v17 addTarget:self action:"_contentTapCancelled" forControlEvents:288];
  [v17 addTarget:self action:"_contentTapCompleted" forControlEvents:64];
  v18 = [(BKEndOfBookCompactViewController *)self options];
  id v19 = [v18 mutableCopy];

  [v19 setObject:&__kCFBooleanTrue forKeyedSubscript:@"end-of-book-compact"];
  v20 = +[BKContextMenuProvider sharedProvider];
  [v19 setObject:v20 forKeyedSubscript:BSUIFeedOptionsKeyContextMenuProvider];

  id v21 = [objc_alloc((Class)BSUIFeedViewController) initWithOptions:v19];
  v22 = [v21 view];
  [v22 setUserInteractionEnabled:0];

  [(BKEndOfBookCompactViewController *)self addChildViewController:v21];
  v23 = [v21 view];
  [v17 bounds];
  [v23 setFrame:];
  [v23 setAutoresizingMask:18];
  [v17 addSubview:v23];
  [v21 didMoveToParentViewController:self];
  feedViewController = self->_feedViewController;
  self->_feedViewController = (BSUIFeedViewController *)v21;
  id v25 = v21;

  v26 = +[BCCardGripperView cardGripperViewWithStyle:1];
  [(UIView *)v26 setAccessibilityDelegate:self];
  [(UIView *)v15 addSubview:v26];
  [(BKEndOfBookCompactViewController *)self _anchorGripperView:v26 toView:v15];
  id v27 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_gripperTapped:"];
  [(UIView *)v26 addGestureRecognizer:v27];
  closeButton = self->_closeButton;
  self->_closeButton = v26;
}

- (void)setCardViewController:(id)a3
{
  id obj = a3;
  id v4 = [(BKEndOfBookCompactViewController *)self traitCollection];
  [obj setOverrideUserInterfaceStyle:[v4 userInterfaceStyle]];

  objc_storeWeak((id *)&self->_cardViewController, obj);
}

- (UIView)dropShadowView
{
  [(BKEndOfBookCompactViewController *)self loadViewIfNeeded];
  dropShadowView = self->_dropShadowView;

  return dropShadowView;
}

- (UIView)contentView
{
  [(BKEndOfBookCompactViewController *)self loadViewIfNeeded];
  contentView = self->_contentView;

  return contentView;
}

- (BSUIFeedViewController)feedViewController
{
  [(BKEndOfBookCompactViewController *)self loadViewIfNeeded];
  feedViewController = self->_feedViewController;

  return feedViewController;
}

- (BOOL)isPresentingCard
{
  objc_opt_class();
  v3 = [(BKEndOfBookCompactViewController *)self presentedViewController];
  id v4 = BUDynamicCast();
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isToolbarVisible
{
  v2 = [(BKEndOfBookCompactViewController *)self parentViewController];
  v3 = [v2 navigationController];

  if (v3) {
    unsigned int v4 = [v3 isToolbarHidden] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v7 = [(BKEndOfBookCompactViewController *)self traitCollection];
  id v5 = [v7 userInterfaceStyle];
  v6 = [(BKEndOfBookCompactViewController *)self cardViewController];
  [v6 setOverrideUserInterfaceStyle:v5];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BKEndOfBookCompactViewController;
  id v7 = a4;
  -[BKEndOfBookCompactViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10019F520;
  v8[3] = &unk_100A44570;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)viewSafeAreaInsetsDidChange
{
  v17.receiver = self;
  v17.super_class = (Class)BKEndOfBookCompactViewController;
  [(BKEndOfBookCompactViewController *)&v17 viewSafeAreaInsetsDidChange];
  BOOL v3 = [(BKEndOfBookCompactViewController *)self isToolbarVisible];
  if (v3 != [(BKEndOfBookCompactViewController *)self wasToolbarVisible])
  {
    [(BKEndOfBookCompactViewController *)self setWasToolbarVisible:v3];
    if ([(BKEndOfBookCompactViewController *)self isPresented])
    {
      id v4 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:200.0 damping:20.0 initialVelocity:0.0];
      id v5 = objc_alloc((Class)UIViewPropertyAnimator);
      [v4 settlingDuration];
      id v6 = [v5 initWithDuration:v4];
      id v7 = [(BKEndOfBookCompactViewController *)self parentViewController];
      [(BKEndOfBookCompactViewController *)self preferredFrameInViewController:v7 isPresented:[(BKEndOfBookCompactViewController *)self isPresented]];
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      uint64_t v13 = v12;
      uint64_t v15 = v14;

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10019F760;
      v16[3] = &unk_100A44D58;
      v16[4] = self;
      v16[5] = v9;
      v16[6] = v11;
      v16[7] = v13;
      v16[8] = v15;
      [v6 addAnimations:v16];
      [v6 startAnimation];
    }
  }
}

- (void)preloadContentWithViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412546;
    v20 = self;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: preloadContentWithViewController %@", (uint8_t *)&v19, 0x16u);
  }

  [(BKEndOfBookCompactViewController *)self preferredFrameInViewController:v6 isPresented:0];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  objc_super v17 = [(BKEndOfBookCompactViewController *)self view];
  [v17 setFrame:v10, v12, v14, v16];

  v18 = [(BKEndOfBookCompactViewController *)self feedViewController];
  [v18 preloadAugmentedExperienceContentWithViewController:v6 numEntries:1 completion:v7];
}

- (void)_forceOrientationBackToPortraitOrientation:(id)a3
{
  id v4 = (void (**)(void))a3;
  objc_opt_class();
  id v5 = [(BKEndOfBookCompactViewController *)self bc_windowForViewController];
  id v6 = [v5 windowScene];
  id v7 = BUDynamicCast();

  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10019FA28;
    v8[3] = &unk_100A45310;
    v8[4] = self;
    double v9 = v4;
    [v7 attemptRotateToPortraitWithCompletion:v8];
  }
  else
  {
    v4[2](v4);
  }
}

- (CGRect)preferredFrameInViewController:(id)a3 isPresented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 viewIfLoaded];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 bounds];
    -[BKEndOfBookCompactViewController preferredFrameInViewController:newSize:isPresented:](self, "preferredFrameInViewController:newSize:isPresented:", v6, v4, v9, v10);
    CGFloat x = v11;
    CGFloat y = v13;
    CGFloat width = v15;
    CGFloat height = v17;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGRect)preferredFrameInViewController:(id)a3 newSize:(CGSize)a4 isPresented:(BOOL)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  double v9 = [v8 viewIfLoaded];
  if (v9)
  {
    double v10 = [v8 traitCollection];
    id v11 = [v10 horizontalSizeClass];

    double v12 = 8.0;
    double v13 = 8.0;
    if (v11 == (id)1 || (double v13 = 16.0, isPhone()))
    {
      int v14 = 1;
    }
    else
    {
      int v14 = 0;
      double v12 = 16.0;
    }
    uint64_t v19 = [v8 navigationController];
    if (v19
      && (double v20 = (void *)v19,
          [v8 navigationController],
          double v21 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v22 = [v21 isToolbarHidden],
          v21,
          v20,
          (v22 & 1) == 0)
      || ([v9 safeAreaInsets], v23 > v12))
    {
      [v9 safeAreaInsets];
    }
    v36.origin.CGFloat x = 0.0;
    v36.origin.CGFloat y = 0.0;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    if (CGRectGetWidth(v36) + v13 * -2.0 < 404.0)
    {
      v37.origin.CGFloat x = 0.0;
      v37.origin.CGFloat y = 0.0;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = height;
      CGRectGetWidth(v37);
    }
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    CGFloat v26 = width;
    CGFloat v27 = height;
    if (v14) {
      CGRectGetWidth(*(CGRect *)&v24);
    }
    else {
      CGRectGetMaxX(*(CGRect *)&v24);
    }
    v38.origin.CGFloat x = 0.0;
    v38.origin.CGFloat y = 0.0;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    CGRectGetMaxY(v38);
    [(BKEndOfBookCompactViewController *)self pageProgressionIsRTL];
    IMRectFlippedForRTL();
    CGFloat x = v28;
    CGFloat y = v29;
    CGFloat v17 = v30;
    CGFloat v18 = v31;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat v17 = CGRectZero.size.width;
    CGFloat v18 = CGRectZero.size.height;
  }

  double v32 = x;
  double v33 = y;
  double v34 = v17;
  double v35 = v18;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (void)_gripperTapped:(id)a3
{
  if ([a3 state] == (id)3)
  {
    [(BKEndOfBookCompactViewController *)self _reportFigaroCloseClickEventWithReason:@"buttonTap"];
    [(BKEndOfBookCompactViewController *)self dismiss];
  }
}

- (void)_animateScaleForPressed:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(BKEndOfBookCompactViewController *)self dropShadowView];
  memset(&v16, 0, sizeof(v16));
  if (v3)
  {
    CGAffineTransformMakeScale(&v16, 0.96, 0.96);
  }
  else
  {
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v16.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v16.c = v8;
    long long v7 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v16.tCGFloat x = v7;
  }
  LODWORD(v7) = 1051260355;
  LODWORD(v5) = 1059816735;
  LODWORD(v6) = 1.0;
  double v9 = +[CAMediaTimingFunction functionWithControlPoints:*(double *)&v7 :0.0 :v5 :v6];
  id v10 = [objc_alloc((Class)UICubicTimingParameters) initWithCustomCurve:v9];
  id v11 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v10 timingParameters:0.18];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  CGAffineTransform v15 = v16;
  v13[2] = sub_10019FF58;
  v13[3] = &unk_100A49B88;
  id v14 = v4;
  id v12 = v4;
  [v11 addAnimations:v13];
  [v11 startAnimation];
}

- (void)_contentTapBegan
{
}

- (void)_contentTapCancelled
{
}

- (void)_contentTapCompleted
{
  [(BKEndOfBookCompactViewController *)self _presentCardWithReason:@"buttonTap" completion:0];

  [(BKEndOfBookCompactViewController *)self _animateScaleForPressed:0];
}

- (void)_anchorGripperView:(id)a3 toView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v7 = [v6 topAnchor];
  long long v8 = [v5 topAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8 constant:15.0];
  v14[0] = v9;
  id v10 = [v6 trailingAnchor];

  id v11 = [v5 trailingAnchor];

  id v12 = [v10 constraintEqualToAnchor:v11 constant:-14.5];
  v14[1] = v12;
  double v13 = +[NSArray arrayWithObjects:v14 count:2];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (void)_willDismissCardWithReason:(int64_t)a3
{
  objc_opt_class();
  id v5 = [(BKEndOfBookCompactViewController *)self cardViewController];
  BUDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [v8 cardNavigationController];
  long long v7 = [v6 currentFeedViewController];
  [v7 cardStackViewController:0 parentCardWillDismissWithReason:a3 targetViewController:self];
}

- (void)presentCardWithCompletion:(id)a3
{
}

- (void)_presentCardWithReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKEndOfBookCompactViewController *)self cardViewController];
  if (v8 && ![(BKEndOfBookCompactViewController *)self isPresentingCard])
  {
    id v11 = [(BKEndOfBookCompactViewController *)self presentedViewController];

    if (v11)
    {
      id v12 = [(BKEndOfBookCompactViewController *)self presentedViewController];
      [v12 dismissViewControllerAnimated:1 completion:0];
    }
    [(BKEndOfBookCompactViewController *)self _reportFigaroOpenClickEventWithReason:v6];
    if (v7)
    {
      double v13 = [(BKEndOfBookCompactViewController *)self presentationCompletionBlocks];
      id v14 = objc_retainBlock(v7);
      [v13 addObject:v14];
    }
    CGAffineTransform v15 = [(BKEndOfBookCompactViewController *)self transitionAnimationController];

    if (!v15)
    {
      [v8 setTransitioningDelegate:self];
      CGAffineTransform v16 = [v8 presentationController];
      [v16 setDelegate:self];

      objc_opt_class();
      CGFloat v17 = BUDynamicCast();
      [v17 setDelegate:self];
      objc_initWeak(location, self);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1001A05F4;
      v32[3] = &unk_100A43F68;
      objc_copyWeak(&v33, location);
      CGFloat v18 = objc_retainBlock(v32);
      objc_opt_class();
      uint64_t v19 = [v8 presentationController];
      double v20 = BUDynamicCast();

      double v21 = [(BKEndOfBookCompactViewController *)self dropShadowView];
      unsigned __int8 v22 = [v21 layer];
      [v22 cornerRadius];
      [v20 _setCornerRadiusForPresentationAndDismissal];

      [v20 _setShouldDismissWhenTappedOutside:1];
      double v23 = [[BKEndOfBookCardTransitionAnimationController alloc] initWithCompactViewController:self cardViewController:v17];
      [(BKEndOfBookCompactViewController *)self setTransitionAnimationController:v23];

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1001A0734;
      v28[3] = &unk_100A47E40;
      objc_copyWeak(&v31, location);
      id v29 = v8;
      uint64_t v24 = v18;
      id v30 = v24;
      uint64_t v25 = objc_retainBlock(v28);
      if (isPhone() && isLandscape())
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_1001A0928;
        v26[3] = &unk_100A44120;
        v26[4] = self;
        CGFloat v27 = v25;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v26);
      }
      else
      {
        ((void (*)(void *))v25[2])(v25);
      }

      objc_destroyWeak(&v31);
      objc_destroyWeak(&v33);
      objc_destroyWeak(location);
    }
  }
  else
  {
    id v9 = objc_retainBlock(v7);
    id v10 = v9;
    if (v9) {
      (*((void (**)(id))v9 + 2))(v9);
    }
  }
}

- (id)animationControllerForCompactViewController:(id)a3 cardViewController:(id)a4 isPresenting:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  id v10 = BUDynamicCast();
  id v11 = objc_alloc_init((Class)_UISheetAnimationController);
  [v11 setIsReversed:!v5];
  id v12 = [v10 dropShadowView];
  double v13 = [v10 dropShadowView];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  unsigned __int8 v22 = [v10 view];
  double v23 = [v22 superview];
  [v12 convertRect:v23 toView:v15];
  [v11 setSourceFrame:];

  objc_initWeak(&location, self);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001A0B8C;
  v28[3] = &unk_100A44548;
  objc_copyWeak(&v29, &location);
  BOOL v30 = v5;
  [v11 addNoninteractiveAnimations:v28];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001A0BFC;
  v25[3] = &unk_100A46D38;
  objc_copyWeak(&v26, &location);
  BOOL v27 = v5;
  [v11 addNoninteractiveCompletion:v25];
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v11;
}

- (void)dismiss
{
  id v3 = [(BKEndOfBookCompactViewController *)self delegate];
  [v3 endOfBookCompactViewControllerWantsToDismiss:self];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([(BKEndOfBookCompactViewController *)self _shouldUseCoverAnimationWhenPresenting:1])
  {
    id v9 = [(BKEndOfBookCompactViewController *)self animationControllerForCompactViewController:v8 cardViewController:v7 isPresenting:1];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  if ([(BKEndOfBookCompactViewController *)self _shouldUseCoverAnimationWhenPresenting:0])
  {
    BOOL v5 = [(BKEndOfBookCompactViewController *)self animationControllerForCompactViewController:self cardViewController:v4 isPresenting:0];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldUseCoverAnimationWhenPresenting:(BOOL)a3
{
  unsigned int v5 = [(BKEndOfBookCompactViewController *)self isPresented];
  BOOL result = a3 & v5;
  if (!a3)
  {
    if (v5) {
      return !self->_closingBook;
    }
  }
  return result;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v8 = [(BKEndOfBookCompactViewController *)self transitionCoordinator];
  if (([v8 isInteractive] & 1) == 0
    && ([v8 isCancelled] & 1) == 0)
  {
    [(BKEndOfBookCompactViewController *)self _willDismissCardWithReason:2];
    if ([(BKEndOfBookCompactViewController *)self _shouldUseCoverAnimationWhenPresenting:0])
    {
      objc_opt_class();
      id v4 = [(BKEndOfBookCompactViewController *)self cardViewController];
      unsigned int v5 = BUDynamicCast();

      id v6 = [[BKEndOfBookCardTransitionAnimationController alloc] initWithCompactViewController:self cardViewController:v5];
      [(BKEndOfBookCompactViewController *)self setTransitionAnimationController:v6];

      id v7 = [(BKEndOfBookCompactViewController *)self transitionAnimationController];
      [v7 prepareForDismissal];
    }
  }
  [(BKEndOfBookCompactViewController *)self _trackInteractiveDismissal];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  if (isPhone())
  {
    +[UIViewController attemptRotationToDeviceOrientation];
  }
}

- (void)_trackInteractiveDismissal
{
  unsigned __int8 v3 = [(BKEndOfBookCompactViewController *)self _shouldUseCoverAnimationWhenPresenting:0];
  if ([(BKEndOfBookCompactViewController *)self isPresentingCard])
  {
    id v4 = [(BKEndOfBookCompactViewController *)self transitionCoordinator];
  }
  else
  {
    unsigned int v5 = [(BKEndOfBookCompactViewController *)self cardViewController];
    id v4 = [v5 transitionCoordinator];
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001A1040;
  v6[3] = &unk_100A478E8;
  v6[4] = self;
  unsigned __int8 v7 = v3;
  [v4 notifyWhenInteractionChangesUsingBlock:v6];
}

- (void)toastPresenter:(id)a3 willPresentToastInViewController:(id)a4
{
}

- (void)toastPresenterWillDismissToast:(id)a3
{
}

- (void)endOfBookCardViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(BKEndOfBookCompactViewController *)self cardViewController];

  if (v5 == v4)
  {
    [(BKEndOfBookCompactViewController *)self _willDismissCardWithReason:1];
    if ([(BKEndOfBookCompactViewController *)self _shouldUseCoverAnimationWhenPresenting:0])
    {
      objc_opt_class();
      id v6 = [(BKEndOfBookCompactViewController *)self cardViewController];
      unsigned __int8 v7 = BUDynamicCast();

      id v8 = [[BKEndOfBookCardTransitionAnimationController alloc] initWithCompactViewController:self cardViewController:v7];
      [(BKEndOfBookCompactViewController *)self setTransitionAnimationController:v8];

      id v9 = [(BKEndOfBookCompactViewController *)self transitionAnimationController];
      [v9 prepareForDismissal];
    }
    id v10 = [(BKEndOfBookCompactViewController *)self cardViewController];
    id v11 = [v10 presentingViewController];
    [v11 dismissViewControllerAnimated:1 completion:0];

    [(BKEndOfBookCompactViewController *)self _trackInteractiveDismissal];
  }
}

- (void)_closeAllCardsIncludingEOB:(id)a3 cardStackViewController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Dismissing card stack and EndOfBook card simultaneously", buf, 2u);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001A1464;
  v19[3] = &unk_100A44120;
  id v12 = v8;
  id v20 = v12;
  id v21 = v9;
  id v13 = v9;
  [v10 popAllCardsAnimated:1 completion:v19];
  [(BKEndOfBookCompactViewController *)self _willDismissCardWithReason:1];
  double v14 = [v10 transitionCoordinator];

  double v15 = [v12 view];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001A1474;
  v17[3] = &unk_100A44DA8;
  id v18 = v12;
  id v16 = v12;
  [v14 animateAlongsideTransitionInView:v15 animation:v17 completion:0];
}

- (void)endOfBookCardViewControllerWantsToCloseToAsset:(id)a3 cardStackViewController:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001A158C;
  v8[3] = &unk_100A44120;
  id v9 = self;
  id v10 = a5;
  id v7 = v10;
  [(BKEndOfBookCompactViewController *)v9 _closeAllCardsIncludingEOB:a3 cardStackViewController:a4 completion:v8];
}

- (void)endOfBookCardViewControllerWantsToCloseAsset:(id)a3 cardStackViewController:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(BKEndOfBookCompactViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKPrimaryScenePresenting];
  id v12 = +[BKRootBarItemsProvider HomeIdentifier];
  [v11 presenterSelectTabWithIdentifier:v12];

  self->_closingBook = 1;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_1001A1710;
  v14[3] = &unk_100A44120;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [(BKEndOfBookCompactViewController *)self _closeAllCardsIncludingEOB:v10 cardStackViewController:v9 completion:v14];
}

- (id)ba_analyticsTracker
{
  v8.receiver = self;
  v8.super_class = (Class)BKEndOfBookCompactViewController;
  unsigned __int8 v3 = [(BKEndOfBookCompactViewController *)&v8 ba_analyticsTracker];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(BKEndOfBookCompactViewController *)self feedViewController];
    [v6 ba_analyticsTracker];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)_reportFigaroOpenClickEventWithReason:(id)a3
{
  id v4 = a3;
  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  [v15 setObject:JSARecordEventTypeClick forKeyedSubscript:JSARecordKeyEventType];
  [v15 setObject:JSARecordActionTypeNavigate forKeyedSubscript:JSARecordKeyActionType];
  id v5 = [(BKEndOfBookCompactViewController *)self contentView];
  id v6 = [v5 superview];
  id v7 = [(BKEndOfBookCompactViewController *)self contentView];
  [v7 center];
  [v6 convertPoint:0 toView:];
  double v9 = v8;
  double v11 = v10;

  id v12 = +[NSNumber numberWithDouble:v9];
  [v15 setObject:v12 forKeyedSubscript:JSARecordKeyPositionX];

  id v13 = +[NSNumber numberWithDouble:v11];
  [v15 setObject:v13 forKeyedSubscript:JSARecordKeyPositionY];

  double v14 = [(BKEndOfBookCompactViewController *)self _additionalInfoForClickEvent:v4];

  +[JSAApplication recordNativeEvent:v15 additionalInfo:v14];
}

- (void)_reportFigaroCloseClickEventWithReason:(id)a3
{
  id v4 = a3;
  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  [v15 setObject:JSARecordEventTypeClick forKeyedSubscript:JSARecordKeyEventType];
  [v15 setObject:JSARecordActionTypeDismiss forKeyedSubscript:JSARecordKeyActionType];
  id v5 = [(BKEndOfBookCompactViewController *)self closeButton];
  id v6 = [v5 superview];
  id v7 = [(BKEndOfBookCompactViewController *)self closeButton];
  [v7 center];
  [v6 convertPoint:0 toView:];
  double v9 = v8;
  double v11 = v10;

  id v12 = +[NSNumber numberWithDouble:v9];
  [v15 setObject:v12 forKeyedSubscript:JSARecordKeyPositionX];

  id v13 = +[NSNumber numberWithDouble:v11];
  [v15 setObject:v13 forKeyedSubscript:JSARecordKeyPositionY];

  double v14 = [(BKEndOfBookCompactViewController *)self _additionalInfoForClickEvent:v4];

  +[JSAApplication recordNativeEvent:v15 additionalInfo:v14];
}

- (id)_additionalInfoForClickEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(BKEndOfBookCompactViewController *)self ba_effectiveAnalyticsTracker];
  v12[0] = @"tracker";
  id v6 = v5;
  if (!v5)
  {
    id v6 = +[NSNull null];
  }
  v13[0] = v6;
  v12[1] = @"feed";
  id v7 = [(BKEndOfBookCompactViewController *)self feedViewController];
  double v8 = [v7 feed];
  double v9 = v8;
  if (!v8)
  {
    double v9 = +[NSNull null];
  }
  v12[2] = @"reason";
  v13[1] = v9;
  v13[2] = v4;
  double v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (!v8) {

  }
  if (!v5) {

  }
  return v10;
}

- (UIViewController)cardViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardViewController);

  return (UIViewController *)WeakRetained;
}

- (BOOL)pageProgressionIsRTL
{
  return self->_pageProgressionIsRTL;
}

- (void)setPageProgressionIsRTL:(BOOL)a3
{
  self->_pageProgressionIsRTL = a3;
}

- (BKEndOfBookCompactViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKEndOfBookCompactViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (void)setIsPresented:(BOOL)a3
{
  self->_isPresented = a3;
}

- (BOOL)wasToolbarVisible
{
  return self->_wasToolbarVisible;
}

- (void)setWasToolbarVisible:(BOOL)a3
{
  self->_wasToolbarVisible = a3;
}

- (UIView)closeButton
{
  return self->_closeButton;
}

- (BKEndOfBookCardTransitionAnimationController)transitionAnimationController
{
  return self->_transitionAnimationController;
}

- (void)setTransitionAnimationController:(id)a3
{
}

- (NSMutableArray)presentationCompletionBlocks
{
  return self->_presentationCompletionBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_transitionAnimationController, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedViewController, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_dropShadowView, 0);

  objc_destroyWeak((id *)&self->_cardViewController);
}

@end