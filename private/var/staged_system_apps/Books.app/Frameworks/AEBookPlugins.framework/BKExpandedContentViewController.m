@interface BKExpandedContentViewController
+ (BOOL)canPreviewResource:(id)a3;
+ (Class)classForResource:(id)a3;
+ (id)expandedContentControllerForResource:(id)a3;
- (BCNavigationBar)toolbar;
- (BEDragDismissGestureManager)dragDismissManager;
- (BEExpandedContentDelegate)delegate;
- (BEExpandedContentPresenter)presenter;
- (BKActivityIndicatorOverlayView)activityIndicator;
- (BKExpandedContentResource)resource;
- (BKExpandedContentViewController)initWithResource:(id)a3;
- (BOOL)allowsDismissGesture;
- (BOOL)canBecomeFirstResponder;
- (BOOL)enablePullToDismiss;
- (BOOL)enableSwipeToDismiss;
- (BOOL)isCurrentlyZoomed;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)presentingFromTOC;
- (BOOL)toolbarHidden;
- (BOOL)wantsDoubleTapGestureRecognizer;
- (BOOL)wantsTapToHideToolbarGestureRecognizer;
- (CGRect)animationRect;
- (CGRect)getAnimationRect;
- (NSLayoutConstraint)contentToViewTopAnchorConstraint;
- (UIColor)contentBackgroundColor;
- (UIColor)contentColor;
- (UIImageView)animationImageView;
- (UIScrollView)scrollView;
- (UITapGestureRecognizer)doubleTapRecognizer;
- (UITapGestureRecognizer)singleTapRecognizer;
- (UIView)contentContainer;
- (UIView)contentObscuringView;
- (UIView)innerView;
- (double)initialZoomScale;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)contentView;
- (id)keyCommands;
- (id)leftToolbarItems;
- (id)rightToolbarItems;
- (int64_t)positionForBar:(id)a3;
- (int64_t)preferredStatusBarUpdateAnimation;
- (unint64_t)supportedInterfaceOrientations;
- (void)close:(BOOL)a3;
- (void)dealloc;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)done:(id)a3;
- (void)dragDismissGestureDidPanToDismiss:(id)a3;
- (void)dragDismissGestureDidSwipeToDismiss:(id)a3;
- (void)handleDoubleTap:(id)a3;
- (void)handleEscapeKey:(id)a3;
- (void)handleSingleTap:(id)a3;
- (void)releaseViews;
- (void)setActivityIndicator:(id)a3;
- (void)setActivityIndicatorVisible:(BOOL)a3 animated:(BOOL)a4 afterDelay:(double)a5;
- (void)setAnimationImageView:(id)a3;
- (void)setAnimationRect:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContentBackgroundColor:(id)a3;
- (void)setContentColor:(id)a3;
- (void)setContentContainer:(id)a3;
- (void)setContentObscuringView:(id)a3;
- (void)setContentToViewTopAnchorConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoubleTapRecognizer:(id)a3;
- (void)setDragDismissManager:(id)a3;
- (void)setInitialZoomScale:(double)a3;
- (void)setInnerView:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setPresentingFromTOC:(BOOL)a3;
- (void)setPreviewTitle:(id)a3;
- (void)setSingleTapRecognizer:(id)a3;
- (void)setToolBarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setToolbar:(id)a3;
- (void)setToolbarHidden:(BOOL)a3;
- (void)startActivityIndicatorAfterDelay:(double)a3;
- (void)stopActivityIndicator:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BKExpandedContentViewController

+ (Class)classForResource:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() supportsResource:v3];

  v4 = objc_opt_class();

  return (Class)v4;
}

+ (BOOL)canPreviewResource:(id)a3
{
  return [a1 classForResource:a3] != 0;
}

+ (id)expandedContentControllerForResource:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "classForResource:", v4)), "initWithResource:", v4);

  return v5;
}

- (BKExpandedContentViewController)initWithResource:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKExpandedContentViewController;
  v6 = [(BKExpandedContentViewController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resource, a3);
    uint64_t v8 = +[UIColor clearColor];
    contentBackgroundColor = v7->_contentBackgroundColor;
    v7->_contentBackgroundColor = (UIColor *)v8;

    v10 = +[IMTheme themeWithIdentifier:kIMThemeIdentifierDynamicTheme];
    [(BKExpandedContentViewController *)v7 setTheme:v10];

    [(BKExpandedContentViewController *)v7 setModalPresentationStyle:5];
    [(BKExpandedContentViewController *)v7 setToolbarHidden:0];
  }

  return v7;
}

- (void)releaseViews
{
  v9.receiver = self;
  v9.super_class = (Class)BKExpandedContentViewController;
  [(BKViewController *)&v9 releaseViews];
  toolbar = self->_toolbar;
  self->_toolbar = 0;

  contentContainer = self->_contentContainer;
  self->_contentContainer = 0;

  [(UITapGestureRecognizer *)self->_doubleTapRecognizer setDelegate:0];
  [(UITapGestureRecognizer *)self->_doubleTapRecognizer removeTarget:0 action:0];
  doubleTapRecognizer = self->_doubleTapRecognizer;
  self->_doubleTapRecognizer = 0;

  animationImageView = self->_animationImageView;
  self->_animationImageView = 0;

  contentObscuringView = self->_contentObscuringView;
  self->_contentObscuringView = 0;

  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = 0;
}

- (void)dealloc
{
  [(BKExpandedContentViewController *)self releaseViews];
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)BKExpandedContentViewController;
  [(BKViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v57.receiver = self;
  v57.super_class = (Class)BKExpandedContentViewController;
  [(BKExpandedContentViewController *)&v57 viewDidLoad];
  objc_super v3 = [(BKExpandedContentViewController *)self themePage];
  id v4 = [(BKExpandedContentViewController *)self view];
  id v5 = objc_alloc((Class)BCNavigationBar);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  objc_super v9 = (BCNavigationBar *)[v5 initWithFrame:CGRectZero.origin.x, y, width, height];
  toolbar = self->_toolbar;
  self->_toolbar = v9;

  v11 = self->_toolbar;
  v55 = v3;
  objc_super v12 = [v3 headerTextColor];
  v13 = +[NSDictionary dictionaryWithObject:v12 forKey:NSForegroundColorAttributeName];
  [(BCNavigationBar *)v11 setTitleTextAttributes:v13];

  [(BCNavigationBar *)self->_toolbar setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BCNavigationBar *)self->_toolbar setDelegate:self];
  [(BCNavigationBar *)self->_toolbar setAlpha:0.0];
  v14 = [(BKExpandedContentViewController *)self theme];
  [v14 stylizeBCNavigationBar:self->_toolbar];

  v15 = v4;
  [v4 addSubview:self->_toolbar];
  v53 = [(BCNavigationBar *)self->_toolbar leadingAnchor];
  v51 = [v4 leadingAnchor];
  v49 = [v53 constraintEqualToAnchor:v51];
  v59[0] = v49;
  v16 = [(BCNavigationBar *)self->_toolbar trailingAnchor];
  v17 = v15;
  v56 = v15;
  v18 = [v15 trailingAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v59[1] = v19;
  v20 = [(BCNavigationBar *)self->_toolbar topAnchor];
  v21 = [v17 safeAreaLayoutGuide];
  v22 = [v21 topAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  v59[2] = v23;
  v24 = +[NSArray arrayWithObjects:v59 count:3];
  +[NSLayoutConstraint activateConstraints:v24];

  v25 = self->_toolbar;
  v26 = [(BKExpandedContentViewController *)self leftToolbarItems];
  v27 = [(BKExpandedContentViewController *)self rightToolbarItems];
  [(BCNavigationBar *)v25 setLeftItems:v26 rightItems:v27 title:0 animated:0];

  v28 = self->_toolbar;
  v29 = [(BKExpandedContentResource *)self->_resource title];
  [(BCNavigationBar *)v28 setTitle:v29];

  v30 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  contentContainer = self->_contentContainer;
  self->_contentContainer = v30;

  [(UIView *)self->_contentContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_contentContainer setClipsToBounds:1];
  [v56 addSubview:self->_contentContainer];
  v52 = [(UIView *)self->_contentContainer leadingAnchor];
  v54 = [v56 safeAreaLayoutGuide];
  v50 = [v54 leadingAnchor];
  v48 = [v52 constraintEqualToAnchor:v50];
  v58[0] = v48;
  v32 = [(UIView *)self->_contentContainer trailingAnchor];
  v33 = [v56 safeAreaLayoutGuide];
  v34 = [v33 trailingAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  v58[1] = v35;
  v36 = [(UIView *)self->_contentContainer bottomAnchor];
  v37 = [v56 bottomAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  v58[2] = v38;
  v39 = +[NSArray arrayWithObjects:v58 count:3];
  +[NSLayoutConstraint activateConstraints:v39];

  v40 = [(BKExpandedContentViewController *)self contentView];
  if (v40) {
    [(BKExpandedContentViewController *)self setInnerView:v40];
  }
  v41 = [BKActivityIndicatorOverlayView alloc];
  v42 = [v55 contentTextColor];
  v43 = [v42 colorWithAlphaComponent:0.7];
  v44 = [v55 backgroundColorForTraitEnvironment:self];
  v45 = [(BKActivityIndicatorOverlayView *)v41 initWithBackgroundColor:v43 foregroundColor:v44];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v45;

  v47 = [v55 backgroundColorForTraitEnvironment:self];
  [(BKExpandedContentViewController *)self setBackgroundColor:v47];

  [v56 bringSubviewToFront:self->_toolbar];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKExpandedContentViewController;
  [(BKExpandedContentViewController *)&v6 viewDidAppear:a3];
  [(BKExpandedContentViewController *)self setToolBarHidden:[(BKExpandedContentViewController *)self toolbarHidden] animated:1];
  id v4 = [(BKExpandedContentViewController *)self scrollView];
  id v5 = v4;
  if (v4)
  {
    [v4 zoomScale];
    -[BKExpandedContentViewController setInitialZoomScale:](self, "setInitialZoomScale:");
  }
}

- (void)viewDidLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)BKExpandedContentViewController;
  [(BKExpandedContentViewController *)&v21 viewDidLayoutSubviews];
  objc_super v3 = [(BKExpandedContentViewController *)self contentToViewTopAnchorConstraint];

  if (!v3)
  {
    if ([(BKExpandedContentViewController *)self wantsTapToHideToolbarGestureRecognizer])
    {
      id v4 = [(UIView *)self->_contentContainer topAnchor];
      id v5 = [(BKExpandedContentViewController *)self view];
      objc_super v6 = [v5 topAnchor];
      v7 = [v4 constraintEqualToAnchor:v6];
      [(BKExpandedContentViewController *)self setContentToViewTopAnchorConstraint:v7];

      uint64_t v8 = [(BKExpandedContentViewController *)self contentToViewTopAnchorConstraint];
      v22 = v8;
      objc_super v9 = &v22;
    }
    else
    {
      v10 = [(BKExpandedContentViewController *)self contentToViewTopAnchorConstraint];
      unsigned int v11 = [v10 isActive];

      if (v11)
      {
        objc_super v12 = [(BKExpandedContentViewController *)self contentToViewTopAnchorConstraint];
        v24 = v12;
        v13 = +[NSArray arrayWithObjects:&v24 count:1];
        +[NSLayoutConstraint deactivateConstraints:v13];
      }
      v14 = [(UIView *)self->_contentContainer topAnchor];
      v15 = [(BKExpandedContentViewController *)self view];
      v16 = [v15 safeAreaLayoutGuide];
      v17 = [v16 topAnchor];
      [(BCNavigationBar *)self->_toolbar bounds];
      v19 = [v14 constraintEqualToAnchor:v17 constant:v18];
      [(BKExpandedContentViewController *)self setContentToViewTopAnchorConstraint:v19];

      uint64_t v8 = [(BKExpandedContentViewController *)self contentToViewTopAnchorConstraint];
      v23 = v8;
      objc_super v9 = &v23;
    }
    v20 = +[NSArray arrayWithObjects:v9 count:1];
    +[NSLayoutConstraint activateConstraints:v20];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKExpandedContentViewController *)self setActivityIndicatorVisible:0 animated:a3 afterDelay:0.0];
  v5.receiver = self;
  v5.super_class = (Class)BKExpandedContentViewController;
  [(BKExpandedContentViewController *)&v5 viewWillDisappear:v3];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  v9.receiver = self;
  v9.super_class = (Class)BKExpandedContentViewController;
  v2 = [(BKExpandedContentViewController *)&v9 keyCommands];
  id v3 = [v2 mutableCopy];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSMutableArray array];
  }
  objc_super v6 = v5;

  v7 = +[UIKeyCommand keyCommandWithInput:UIKeyInputEscape modifierFlags:0 action:"handleEscapeKey:"];
  [v6 addObject:v7];

  return v6;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (BOOL)wantsDoubleTapGestureRecognizer
{
  return 1;
}

- (BOOL)wantsTapToHideToolbarGestureRecognizer
{
  return 1;
}

- (void)close:(BOOL)a3
{
}

- (id)leftToolbarItems
{
  return 0;
}

- (id)rightToolbarItems
{
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"done:"];
  id v4 = [(BKExpandedContentViewController *)self themePage];
  id v5 = [v4 tintColorForNavbarButtons];
  [v3 setTintColor:v5];

  id v8 = v3;
  objc_super v6 = +[NSArray arrayWithObjects:&v8 count:1];

  return v6;
}

- (void)done:(id)a3
{
  if ([(BKExpandedContentViewController *)self isViewLoaded])
  {
    [(BKExpandedContentViewController *)self close:1];
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = self;
  [(BKExpandedContentViewController *)v7 delegate];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_73AEC;
  v12[3] = &unk_1DAF30;
  v14 = v7;
  id v15 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v11.receiver = v7;
  v11.super_class = (Class)BKExpandedContentViewController;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [(BKExpandedContentViewController *)&v11 dismissViewControllerAnimated:v4 completion:v12];
}

- (void)setInnerView:(id)a3
{
  id v31 = a3;
  p_innerView = &self->_innerView;
  innerView = self->_innerView;
  v7 = [(UIView *)innerView constraints];
  [(UIView *)innerView removeConstraints:v7];

  [(UIView *)self->_innerView removeFromSuperview];
  if ([(BKExpandedContentViewController *)self wantsDoubleTapGestureRecognizer]) {
    [(UIView *)*p_innerView removeGestureRecognizer:self->_doubleTapRecognizer];
  }
  objc_storeStrong((id *)&self->_innerView, a3);
  [(UIView *)*p_innerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_contentContainer addSubview:*p_innerView];
  v30 = [(UIView *)*p_innerView leadingAnchor];
  v29 = [(UIView *)self->_contentContainer leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v32[0] = v28;
  v27 = [(UIView *)*p_innerView trailingAnchor];
  v26 = [(UIView *)self->_contentContainer trailingAnchor];
  id v8 = [v27 constraintEqualToAnchor:v26];
  v32[1] = v8;
  id v9 = [(UIView *)*p_innerView topAnchor];
  id v10 = [(UIView *)self->_contentContainer topAnchor];
  objc_super v11 = [v9 constraintEqualToAnchor:v10];
  v32[2] = v11;
  objc_super v12 = [(UIView *)*p_innerView bottomAnchor];
  id v13 = [(UIView *)self->_contentContainer bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v32[3] = v14;
  id v15 = +[NSArray arrayWithObjects:v32 count:4];
  +[NSLayoutConstraint activateConstraints:v15];

  if ([(BKExpandedContentViewController *)self wantsDoubleTapGestureRecognizer])
  {
    v16 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleDoubleTap:"];
    doubleTapRecognizer = self->_doubleTapRecognizer;
    self->_doubleTapRecognizer = v16;

    [(UITapGestureRecognizer *)self->_doubleTapRecognizer setDelegate:self];
    [(UITapGestureRecognizer *)self->_doubleTapRecognizer setNumberOfTapsRequired:2];
    [(UIView *)*p_innerView addGestureRecognizer:self->_doubleTapRecognizer];
  }
  if ([(BKExpandedContentViewController *)self wantsTapToHideToolbarGestureRecognizer])
  {
    double v18 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleSingleTap:"];
    singleTapRecognizer = self->_singleTapRecognizer;
    self->_singleTapRecognizer = v18;

    [(UITapGestureRecognizer *)self->_singleTapRecognizer setDelegate:self];
    [(UIView *)*p_innerView addGestureRecognizer:self->_singleTapRecognizer];
  }
  if ([(BKExpandedContentViewController *)self enableSwipeToDismiss])
  {
    v20 = *p_innerView;
    objc_super v21 = [(BKExpandedContentViewController *)self dragDismissManager];
    v22 = [v21 swipeGesture];
    [(UIView *)v20 addGestureRecognizer:v22];
  }
  if ([(BKExpandedContentViewController *)self enablePullToDismiss])
  {
    v23 = *p_innerView;
    v24 = [(BKExpandedContentViewController *)self dragDismissManager];
    v25 = [v24 panGesture];
    [(UIView *)v23 addGestureRecognizer:v25];
  }
}

- (void)startActivityIndicatorAfterDelay:(double)a3
{
}

- (void)stopActivityIndicator:(BOOL)a3
{
}

- (void)setPreviewTitle:(id)a3
{
}

- (BEDragDismissGestureManager)dragDismissManager
{
  dragDismissManager = self->_dragDismissManager;
  if (!dragDismissManager)
  {
    BOOL v4 = (BEDragDismissGestureManager *)objc_opt_new();
    id v5 = self->_dragDismissManager;
    self->_dragDismissManager = v4;

    [(BEDragDismissGestureManager *)self->_dragDismissManager setDelegate:self];
    dragDismissManager = self->_dragDismissManager;
  }

  return dragDismissManager;
}

- (id)contentView
{
  return 0;
}

- (CGRect)getAnimationRect
{
  v2 = [(BKExpandedContentViewController *)self presentingViewController];
  id v3 = [v2 view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v19.origin.x = v5;
  v19.origin.double y = v7;
  v19.size.double width = v9;
  v19.size.double height = v11;
  double v12 = CGRectGetWidth(v19) * 0.25;
  v20.origin.x = v5;
  v20.origin.double y = v7;
  v20.size.double width = v9;
  v20.size.double height = v11;
  double v13 = CGRectGetHeight(v20) * 0.25;
  CGFloat v14 = v5;
  CGFloat v15 = v7;
  CGFloat v16 = v9;
  CGFloat v17 = v11;

  return CGRectInset(*(CGRect *)&v14, v12, v13);
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(BKExpandedContentViewController *)self view];
  [v5 setBackgroundColor:v4];

  id v6 = [(BKExpandedContentViewController *)self contentContainer];
  [v6 setBackgroundColor:v4];
}

- (BOOL)isCurrentlyZoomed
{
  id v3 = [(BKExpandedContentViewController *)self scrollView];
  id v4 = v3;
  if (v3)
  {
    [v3 zoomScale];
    double v6 = v5;
    [(BKExpandedContentViewController *)self initialZoomScale];
    BOOL v8 = v6 != v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (UIScrollView)scrollView
{
  objc_opt_class();
  id v3 = [(BKExpandedContentViewController *)self innerView];
  id v4 = BUDynamicCast();

  return (UIScrollView *)v4;
}

- (void)setActivityIndicatorVisible:(BOOL)a3 animated:(BOOL)a4 afterDelay:(double)a5
{
  BOOL v6 = a4;
  activityIndicator = self->_activityIndicator;
  if (a3)
  {
    id v9 = [(BKExpandedContentViewController *)self view];
    [(BKActivityIndicatorOverlayView *)activityIndicator showIndicatorCenteredInView:v9 animated:v6 animationDelay:a5];
  }
  else
  {
    BOOL v8 = self->_activityIndicator;
    -[BKActivityIndicatorOverlayView hideIndicatorAnimated:animationDelay:](v8, "hideIndicatorAnimated:animationDelay:", a4);
  }
}

- (void)handleDoubleTap:(id)a3
{
}

- (void)handleSingleTap:(id)a3
{
  uint64_t v4 = [(BKExpandedContentViewController *)self toolbarHidden] ^ 1;

  [(BKExpandedContentViewController *)self setToolBarHidden:v4 animated:1];
}

- (void)handleEscapeKey:(id)a3
{
}

- (void)setToolBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  -[BKExpandedContentViewController setToolbarHidden:](self, "setToolbarHidden:");
  if (!a3) {
    [(BKExpandedContentViewController *)self setNeedsStatusBarAppearanceUpdate];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_743E4;
  v10[3] = &unk_1DBE90;
  BOOL v11 = a3;
  v10[4] = self;
  double v7 = objc_retainBlock(v10);
  BOOL v8 = v7;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_744B4;
    v9[3] = &unk_1DABD8;
    v9[4] = self;
    +[UIView animateWithDuration:v7 animations:v9 completion:0.2];
  }
  else
  {
    ((void (*)(void *))v7[2])(v7);
  }
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  [(BKExpandedContentViewController *)self getAnimationRect];
  double x = v12.origin.x;
  double y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  if (CGRectIsEmpty(v12))
  {
    id v9 = 0;
  }
  else
  {
    id v9 = objc_alloc_init(_BKExpandedContentViewControllerAnimator);
    -[_BKExpandedContentViewControllerAnimator setSourceRect:](v9, "setSourceRect:", x, y, width, height);
  }

  return v9;
}

- (BOOL)allowsDismissGesture
{
  id v3 = [(BKExpandedContentViewController *)self scrollView];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 contentOffset];
    if (v5 <= 0.0) {
      unsigned int v6 = ![(BKExpandedContentViewController *)self isCurrentlyZoomed];
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)enablePullToDismiss
{
  return 1;
}

- (BOOL)enableSwipeToDismiss
{
  return 1;
}

- (void)dragDismissGestureDidPanToDismiss:(id)a3
{
}

- (void)dragDismissGestureDidSwipeToDismiss:(id)a3
{
}

- (BEExpandedContentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BEExpandedContentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BEExpandedContentPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (BKExpandedContentResource)resource
{
  return self->_resource;
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (void)setContentColor:(id)a3
{
}

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

- (void)setContentBackgroundColor:(id)a3
{
}

- (UIView)innerView
{
  return self->_innerView;
}

- (BOOL)presentingFromTOC
{
  return self->_presentingFromTOC;
}

- (void)setPresentingFromTOC:(BOOL)a3
{
  self->_presentingFromTOC = a3;
}

- (BCNavigationBar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
}

- (UIView)contentContainer
{
  return self->_contentContainer;
}

- (void)setContentContainer:(id)a3
{
}

- (UITapGestureRecognizer)singleTapRecognizer
{
  return self->_singleTapRecognizer;
}

- (void)setSingleTapRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapRecognizer
{
  return self->_doubleTapRecognizer;
}

- (void)setDoubleTapRecognizer:(id)a3
{
}

- (BKActivityIndicatorOverlayView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UIImageView)animationImageView
{
  return self->_animationImageView;
}

- (void)setAnimationImageView:(id)a3
{
}

- (UIView)contentObscuringView
{
  return self->_contentObscuringView;
}

- (void)setContentObscuringView:(id)a3
{
}

- (CGRect)animationRect
{
  double x = self->_animationRect.origin.x;
  double y = self->_animationRect.origin.y;
  double width = self->_animationRect.size.width;
  double height = self->_animationRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAnimationRect:(CGRect)a3
{
  self->_animationRect = a3;
}

- (NSLayoutConstraint)contentToViewTopAnchorConstraint
{
  return self->_contentToViewTopAnchorConstraint;
}

- (void)setContentToViewTopAnchorConstraint:(id)a3
{
}

- (void)setDragDismissManager:(id)a3
{
}

- (double)initialZoomScale
{
  return self->_initialZoomScale;
}

- (void)setInitialZoomScale:(double)a3
{
  self->_initialZoomScale = a3;
}

- (BOOL)toolbarHidden
{
  return self->_toolbarHidden;
}

- (void)setToolbarHidden:(BOOL)a3
{
  self->_toolbarHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragDismissManager, 0);
  objc_storeStrong((id *)&self->_contentToViewTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_contentObscuringView, 0);
  objc_storeStrong((id *)&self->_animationImageView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_doubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_singleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_contentContainer, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_innerView, 0);
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_contentColor, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_presenter, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end