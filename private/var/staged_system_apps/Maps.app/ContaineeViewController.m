@interface ContaineeViewController
+ (BOOL)wantsDefaultHeaderContentViews;
+ (float)contentViewBottomConstraintPriority;
+ (float)contentViewTopConstraintPriority;
- (BOOL)forceCurrentWidthForHeaderHeightCalculations;
- (BOOL)keepOriginalSafeInsets;
- (BOOL)shouldCollapseOnMapGesture;
- (CardPresentationController)cardPresentationController;
- (ContaineeViewControllerDelegate)containeeDelegate;
- (MacMenuPresentationController)macMenuPresentationController;
- (MacPopoverPresentationController)macPopoverPresentationController;
- (UIColor)cardColor;
- (double)headerHeight;
- (double)heightForLayout:(unint64_t)a3;
- (double)macContaineeWidth;
- (id)contentView;
- (id)headerView;
- (id)keyCommands;
- (int64_t)preferredUserInterfaceStyle;
- (unint64_t)preferredPresentationStyle;
- (unint64_t)retainedLayout;
- (void)_updateBlurCornerRadius;
- (void)applyAlphaToContent:(double)a3;
- (void)didChangeContainerStyle:(unint64_t)a3;
- (void)didChangeLayout:(unint64_t)a3;
- (void)handleDismissAction:(id)a3;
- (void)setCardColor:(id)a3;
- (void)setContaineeDelegate:(id)a3;
- (void)setKeepOriginalSafeInsets:(BOOL)a3;
- (void)setPreferredPresentationStyle:(unint64_t)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ContaineeViewController

- (void)_updateBlurCornerRadius
{
  v3 = [(ContaineeViewController *)self cardPresentationController];
  id v4 = [v3 containerStyle];

  effectView = self->_effectView;
  if (v4 == (id)6) {
    uint64_t v6 = 15;
  }
  else {
    uint64_t v6 = 3;
  }
  double v7 = _UISheetCornerRadius;

  [(UIVisualEffectView *)effectView _setCornerRadius:1 continuous:v6 maskedCorners:v7];
}

- (void)viewWillAppear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)ContaineeViewController;
  [(ContaineeViewController *)&v18 viewWillAppear:a3];
  id v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 grabberSafeAreaHeight];
  -[NSLayoutConstraint setConstant:](self->_homeIndicatorSafeAreaHeightConstraint, "setConstant:");

  v5 = [(ContaineeViewController *)self cardPresentationController];
  unsigned int v6 = [v5 usingSheetPresentation];

  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    double v7 = [(ContaineeViewController *)self cardPresentationController];
    unsigned int v8 = [v7 wantsFullscreen];
  }
  else
  {
    unsigned int v8 = 0;
  }
  if (self->_effectView) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = (v6 | v8) == 0;
  }
  if (!v9)
  {
    v10 = [(ContaineeViewController *)self cardPresentationController];
    +[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", [v10 blurInCardView]);
    v11 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = v11;
      v13 = [(ContaineeViewController *)self cardPresentationController];
      v14 = [v13 cardColor];
      [(UIVisualEffectView *)v12 setCustomBackgroundColor:v14];
    }
    v15 = [(ContaineeViewController *)self view];
    [v15 addSubview:v11];

    v16 = [(ContaineeViewController *)self view];
    [v16 sendSubviewToBack:v11];

    effectView = self->_effectView;
    self->_effectView = v11;

    [(ContaineeViewController *)self _updateBlurCornerRadius];
  }
}

- (int64_t)preferredUserInterfaceStyle
{
  v2 = [(ContaineeViewController *)self cardPresentationController];
  v3 = [v2 containerViewController];
  id v4 = [v3 preferredUserInterfaceStyle];

  return (int64_t)v4;
}

- (CardPresentationController)cardPresentationController
{
  cardPresentationController = self->_cardPresentationController;
  if (!cardPresentationController)
  {
    id v4 = [[CardPresentationController alloc] initWithViewController:self];
    v5 = self->_cardPresentationController;
    self->_cardPresentationController = v4;

    cardPresentationController = self->_cardPresentationController;
  }

  return cardPresentationController;
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)ContaineeViewController;
  [(ContaineeViewController *)&v8 viewDidLayoutSubviews];
  v3 = [(ContaineeViewController *)self view];
  [v3 bounds];
  -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:");

  id v4 = [(ContaineeViewController *)self cardPresentationController];
  unsigned int v5 = [v4 usingSheetPresentation];

  if (v5)
  {
    unsigned int v6 = [(ContaineeViewController *)self cardPresentationController];
    [v6 sheetContentSize];
    -[ContaineeViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
  double v7 = [(ContaineeViewController *)self cardPresentationController];
  [v7 contentAlpha];
  -[ContaineeViewController applyAlphaToContent:](self, "applyAlphaToContent:");
}

- (void)applyAlphaToContent:(double)a3
{
  id v4 = [(ContaineeViewController *)self contentView];
  [v4 setAlpha:a3];
}

- (id)contentView
{
  return self->_defaultContentView;
}

- (double)headerHeight
{
  v3 = [(ContaineeViewController *)self headerView];

  if (v3)
  {
    unsigned int v4 = [(ContaineeViewController *)self forceCurrentWidthForHeaderHeightCalculations];
    unsigned int v5 = [(ContaineeViewController *)self headerView];
    unsigned int v6 = v5;
    if (v4)
    {
      double v7 = [(ContaineeViewController *)self view];
      [v7 bounds];
      [v6 _maps_compressedSizeForWidth:0 withBlock:CGRectGetWidth(v14)];
      double v9 = v8;
    }
    else
    {
      [v5 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
      double v9 = v10;
    }

    if (v9 == 0.0)
    {
      v11 = [(ContaineeViewController *)self headerView];
      [v11 intrinsicContentSize];
      double v9 = v12;
    }
  }
  else
  {
    double v9 = 0.0;
  }
  return fmax(v9, 60.0);
}

- (id)headerView
{
  return self->_defaultHeaderView;
}

- (BOOL)forceCurrentWidthForHeaderHeightCalculations
{
  return 0;
}

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)ContaineeViewController;
  [(ContaineeViewController *)&v41 viewDidLoad];
  v3 = [(ContaineeViewController *)self view];
  [v3 setLayoutMargins:0.0, 16.0, 0.0, 16.0];

  unsigned int v4 = [(ContaineeViewController *)self view];
  [v4 setPreservesSuperviewLayoutMargins:0];

  [(ContaineeViewController *)self setViewRespectsSystemMinimumLayoutMargins:0];
  if ([(id)objc_opt_class() wantsDefaultHeaderContentViews])
  {
    unsigned int v5 = +[UIColor clearColor];
    unsigned int v6 = [(ContaineeViewController *)self view];
    [v6 setBackgroundColor:v5];

    id v7 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v11 = [v7 initWithFrame:CGRectZero.origin.x, y, width, height];
    defaultContentView = self->_defaultContentView;
    self->_defaultContentView = v11;

    [(UIView *)self->_defaultContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [(UIView *)self->_defaultContentView layer];
    [v13 setAllowsGroupOpacity:0];

    CGRect v14 = +[UIColor clearColor];
    [(UIView *)self->_defaultContentView setBackgroundColor:v14];

    [(UIView *)self->_defaultContentView setPreservesSuperviewLayoutMargins:1];
    v15 = [(ContaineeViewController *)self view];
    [v15 addSubview:self->_defaultContentView];

    v16 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    defaultHeaderView = self->_defaultHeaderView;
    self->_defaultHeaderView = v16;

    [(UIView *)self->_defaultHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v18 = +[UIColor clearColor];
    [(UIView *)self->_defaultHeaderView setBackgroundColor:v18];

    [(UIView *)self->_defaultHeaderView setPreservesSuperviewLayoutMargins:1];
    v19 = [(ContaineeViewController *)self view];
    [v19 addSubview:self->_defaultHeaderView];

    v20 = [objc_alloc((Class)MKViewWithHairline) initWithFrame:CGRectZero.origin.x, y, width, height];
    homeIndicatorSafeAreaView = self->_homeIndicatorSafeAreaView;
    self->_homeIndicatorSafeAreaView = v20;

    [(MKViewWithHairline *)self->_homeIndicatorSafeAreaView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKViewWithHairline *)self->_homeIndicatorSafeAreaView setBottomHairlineHidden:1];
    [(MKViewWithHairline *)self->_homeIndicatorSafeAreaView setTopHairlineHidden:0];
    v22 = +[UIColor clearColor];
    [(MKViewWithHairline *)self->_homeIndicatorSafeAreaView setBackgroundColor:v22];

    [(MKViewWithHairline *)self->_homeIndicatorSafeAreaView setPreservesSuperviewLayoutMargins:1];
    v23 = [(ContaineeViewController *)self view];
    [v23 addSubview:self->_homeIndicatorSafeAreaView];

    v24 = _NSDictionaryOfVariableBindings(@"_defaultHeaderView, _defaultContentView, _homeIndicatorSafeAreaView", self->_defaultHeaderView, self->_defaultContentView, self->_homeIndicatorSafeAreaView, 0);
    id v25 = objc_alloc_init((Class)NSMutableArray);
    v26 = [(MKViewWithHairline *)self->_homeIndicatorSafeAreaView heightAnchor];
    v27 = [v26 constraintEqualToConstant:0.0];
    homeIndicatorSafeAreaHeightConstraint = self->_homeIndicatorSafeAreaHeightConstraint;
    self->_homeIndicatorSafeAreaHeightConstraint = v27;

    [v25 addObject:self->_homeIndicatorSafeAreaHeightConstraint];
    v29 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-0-[_defaultHeaderView]-0-|", 0, 0, v24);
    [v25 addObjectsFromArray:v29];

    v30 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-0-[_defaultContentView]-0-|", 0, 0, v24);
    [v25 addObjectsFromArray:v30];

    v31 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-0-[_homeIndicatorSafeAreaView]-0-|", 0, 0, v24);
    [v25 addObjectsFromArray:v31];

    [(id)objc_opt_class() contentViewBottomConstraintPriority];
    int v33 = v32;
    [(id)objc_opt_class() contentViewTopConstraintPriority];
    LODWORD(y) = v34;
    v42[0] = @"bp";
    LODWORD(v35) = v33;
    v36 = +[NSNumber numberWithFloat:v35];
    v42[1] = @"tp";
    v43[0] = v36;
    LODWORD(v37) = LODWORD(y);
    v38 = +[NSNumber numberWithFloat:v37];
    v43[1] = v38;
    v39 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    v40 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-0-[_defaultHeaderView]-0@tp-[_defaultContentView]-0-[_homeIndicatorSafeAreaView]-0@bp-|", 0, v39, v24);
    [v25 addObjectsFromArray:v40];

    +[NSLayoutConstraint activateConstraints:v25];
  }
}

+ (float)contentViewTopConstraintPriority
{
  return 1000.0;
}

+ (float)contentViewBottomConstraintPriority
{
  return 1000.0;
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ContaineeViewController;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  double v8 = [(ContaineeViewController *)self cardPresentationController];
  unsigned int v9 = [v8 usingSheetPresentation];

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100AA413C;
    v10[3] = &unk_1012E81F8;
    v10[4] = self;
    [v7 animateAlongsideTransition:v10 completion:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ContaineeViewController;
  [(ContaineeViewController *)&v5 viewWillDisappear:a3];
  unsigned int v4 = [(ContaineeViewController *)self cardPresentationController];
  self->_retainedLayout = (unint64_t)[v4 containeeLayout];
}

- (double)macContaineeWidth
{
  return 282.0;
}

- (void)setCardColor:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_cardColor, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIVisualEffectView *)self->_effectView setCustomBackgroundColor:v5];
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  id v5 = [(ContaineeViewController *)self cardPresentationController];
  if ([v5 takesAvailableHeight])
  {

    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  if (a3 - 3 < 3)
  {
LABEL_6:
    unsigned int v6 = [(ContaineeViewController *)self cardPresentationController];
    [v6 availableHeight];
    double v8 = v7;

    return v8;
  }
  if (a3 != 2)
  {
    double v8 = -1.0;
    if (a3 == 1)
    {
      double v10 = [(ContaineeViewController *)self cardPresentationController];
      [v10 bottomSafeOffset];
      double v12 = v11;
      [(ContaineeViewController *)self headerHeight];
      double v8 = v12 + v13;
    }
    return v8;
  }

  sub_10002197C();
  return result;
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ContaineeViewController *)self containeeDelegate];
  [v5 containeeViewControllerGoToPreviousState:self withSender:v4];
}

- (BOOL)shouldCollapseOnMapGesture
{
  return 1;
}

- (void)didChangeLayout:(unint64_t)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"ContaineeViewControllerLayoutDidChangeNotification" object:self];
}

- (void)didChangeContainerStyle:(unint64_t)a3
{
  id v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 updateGrabber];

  [(ContaineeViewController *)self _updateBlurCornerRadius];
  id v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 updateDimmingBehavior];

  id v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 grabberSafeAreaHeight];
  -[NSLayoutConstraint setConstant:](self->_homeIndicatorSafeAreaHeightConstraint, "setConstant:");
}

- (id)keyCommands
{
  v2 = +[UIKeyCommand keyCommandWithInput:UIKeyInputEscape modifierFlags:0 action:"handleDismissAction:"];
  id v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (MacMenuPresentationController)macMenuPresentationController
{
  menuPresentationController = self->_menuPresentationController;
  if (!menuPresentationController)
  {
    id v4 = [[MacMenuPresentationController alloc] initWithContaineeViewController:self];
    id v5 = self->_menuPresentationController;
    self->_menuPresentationController = v4;

    menuPresentationController = self->_menuPresentationController;
  }

  return menuPresentationController;
}

- (MacPopoverPresentationController)macPopoverPresentationController
{
  popoverPresentationController = self->_popoverPresentationController;
  if (!popoverPresentationController)
  {
    id v4 = [[MacPopoverPresentationController alloc] initWithContaineeViewController:self];
    id v5 = self->_popoverPresentationController;
    self->_popoverPresentationController = v4;

    popoverPresentationController = self->_popoverPresentationController;
  }

  return popoverPresentationController;
}

- (unint64_t)preferredPresentationStyle
{
  return self->_preferredPresentationStyle;
}

- (void)setPreferredPresentationStyle:(unint64_t)a3
{
  self->_preferredPresentationStyle = a3;
}

- (unint64_t)retainedLayout
{
  return self->_retainedLayout;
}

- (BOOL)keepOriginalSafeInsets
{
  return self->_keepOriginalSafeInsets;
}

- (void)setKeepOriginalSafeInsets:(BOOL)a3
{
  self->_keepOriginalSafeInsets = a3;
}

- (ContaineeViewControllerDelegate)containeeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containeeDelegate);

  return (ContaineeViewControllerDelegate *)WeakRetained;
}

- (void)setContaineeDelegate:(id)a3
{
}

- (UIColor)cardColor
{
  return self->_cardColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardColor, 0);
  objc_destroyWeak((id *)&self->_containeeDelegate);
  objc_storeStrong((id *)&self->_homeIndicatorSafeAreaHeightConstraint, 0);
  objc_storeStrong((id *)&self->_homeIndicatorSafeAreaView, 0);
  objc_storeStrong((id *)&self->_defaultContentView, 0);
  objc_storeStrong((id *)&self->_defaultHeaderView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_popoverPresentationController, 0);
  objc_storeStrong((id *)&self->_menuPresentationController, 0);

  objc_storeStrong((id *)&self->_cardPresentationController, 0);
}

@end