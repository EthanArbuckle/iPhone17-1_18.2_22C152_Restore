@interface LookAroundFloatingButtonsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hidingLabels;
- (BOOL)isMaximizedButtonEnabled;
- (BOOL)isMinimizedButtonEnabled;
- (BOOL)showsMinimizedButton;
- (LookAroundFloatingButtonsViewController)initWithShowsMinimizeButton:(BOOL)a3 groupButtonsIfNeeded:(BOOL)a4;
- (LookAroundFloatingButtonsViewControllerDelegate)delegate;
- (id)optionsMenu;
- (void)_setAlternateButtonEnabled:(BOOL)a3;
- (void)_setAlternateButtonEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)_setCornerRadii;
- (void)_setCornerRadiiWithTraitCollection:(id)a3;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_updateButtonLayoutAnimated:(BOOL)a3;
- (void)_updateButtonLayoutToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
- (void)_updateButtonLayoutToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4 animated:(BOOL)a5;
- (void)dealloc;
- (void)didTapButton:(id)a3;
- (void)didTapDoneButton:(id)a3;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setHidingLabels:(BOOL)a3;
- (void)setMaximizedButtonEnabled:(BOOL)a3;
- (void)setMaximizedButtonEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setMinimizedButtonEnabled:(BOOL)a3;
- (void)setMinimizedButtonEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsMinimizedButton:(BOOL)a3;
- (void)updateTheme;
- (void)viewDidLoad;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation LookAroundFloatingButtonsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (LookAroundFloatingButtonsViewController)initWithShowsMinimizeButton:(BOOL)a3 groupButtonsIfNeeded:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)LookAroundFloatingButtonsViewController;
  result = [(LookAroundFloatingButtonsViewController *)&v7 initWithNibName:0 bundle:0];
  if (result)
  {
    result->_alternateButtonEnabled = 1;
    result->_showsMinimizedButton = a3;
    result->_groupButtonsIfNeeded = a4;
  }
  return result;
}

- (void)dealloc
{
  [(UIButton *)self->_alternateButton removeObserver:self forKeyPath:@"highlighted"];
  [(UIButton *)self->_doneButton removeObserver:self forKeyPath:@"highlighted"];
  v3.receiver = self;
  v3.super_class = (Class)LookAroundFloatingButtonsViewController;
  [(LookAroundFloatingButtonsViewController *)&v3 dealloc];
}

- (void)loadView
{
  objc_super v3 = -[_LookAroundFloatingButtonsView initWithFrame:]([_LookAroundFloatingButtonsView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(LookAroundFloatingButtonsViewController *)self setView:v3];

  id v4 = [(LookAroundFloatingButtonsViewController *)self view];
  [v4 setAccessibilityIdentifier:@"LookAroundFloatingButtonsView"];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)LookAroundFloatingButtonsViewController;
  [(LookAroundFloatingButtonsViewController *)&v3 viewDidLoad];
  [(LookAroundFloatingButtonsViewController *)self _setupViews];
  [(LookAroundFloatingButtonsViewController *)self _setupConstraints];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)LookAroundFloatingButtonsViewController;
  id v6 = a4;
  id v7 = a3;
  [(LookAroundFloatingButtonsViewController *)&v8 willTransitionToTraitCollection:v7 withTransitionCoordinator:v6];
  -[LookAroundFloatingButtonsViewController _updateButtonLayoutToTraitCollection:withTransitionCoordinator:](self, "_updateButtonLayoutToTraitCollection:withTransitionCoordinator:", v7, v6, v8.receiver, v8.super_class);
}

- (void)setShowsMinimizedButton:(BOOL)a3
{
  if (self->_showsMinimizedButton != a3)
  {
    BOOL v3 = a3;
    self->_showsMinimizedButton = a3;
    if (a3) {
      CFStringRef v5 = @"arrow.down.right.and.arrow.up.left";
    }
    else {
      CFStringRef v5 = @"arrow.up.left.and.arrow.down.right";
    }
    alternateButton = self->_alternateButton;
    id v7 = +[UIImage systemImageNamed:v5];
    [(UIButton *)alternateButton setImage:v7 forState:0];

    if (sub_1000BBB44(self) == 5)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10089100C;
      v8[3] = &unk_1012E6300;
      v8[4] = self;
      BOOL v9 = v3;
      +[UIView animateWithDuration:v8 animations:0.2];
      [(UIButton *)self->_menuButton setUserInteractionEnabled:v3];
      [(NSLayoutConstraint *)self->_menuButtonHiddenConstraint setActive:v3 ^ 1];
      [(NSLayoutConstraint *)self->_menuButtonVisibleConstraint setActive:v3];
    }
    [(LookAroundFloatingButtonsViewController *)self _setCornerRadii];
  }
}

- (void)_setAlternateButtonEnabled:(BOOL)a3
{
}

- (void)_setAlternateButtonEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(LookAroundFloatingButtonsViewController *)self loadViewIfNeeded];
  if (self->_alternateButtonEnabled != v5)
  {
    self->_alternateButtonEnabled = v5;
    double v7 = 0.300000012;
    uint64_t v11 = 3221225472;
    v10 = _NSConcreteStackBlock;
    v12 = sub_10089112C;
    v13 = &unk_1012E69C0;
    if (v5) {
      double v7 = 1.0;
    }
    v14 = self;
    double v15 = v7;
    objc_super v8 = objc_retainBlock(&v10);
    BOOL v9 = v8;
    if (v4) {
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, 0.25, v10, v11, v12, v13);
    }
    else {
      ((void (*)(void ***))v8[2])(v8);
    }
  }
}

- (BOOL)isMaximizedButtonEnabled
{
  return self->_alternateButtonEnabled;
}

- (void)setMaximizedButtonEnabled:(BOOL)a3
{
}

- (void)setMaximizedButtonEnabled:(BOOL)a3 animated:(BOOL)a4
{
}

- (BOOL)isMinimizedButtonEnabled
{
  return self->_alternateButtonEnabled;
}

- (void)setMinimizedButtonEnabled:(BOOL)a3
{
}

- (void)setMinimizedButtonEnabled:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setHidingLabels:(BOOL)a3
{
  self->_hidingLabels = a3;
  id v4 = [(LookAroundFloatingButtonsViewController *)self optionsMenu];
  [(UIButton *)self->_menuButton setMenu:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  uint64_t v11 = (UIButton *)a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"highlighted"]
    && (self->_alternateButton == v11 || self->_doneButton == v11 || self->_menuButton == v11))
  {
    [(LookAroundFloatingButtonsViewController *)self updateTheme];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)LookAroundFloatingButtonsViewController;
    [(LookAroundFloatingButtonsViewController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)updateTheme
{
  if (sub_1000BBB44(self) != 5)
  {
    if ([(UIButton *)self->_alternateButton isHighlighted]) {
      highlightedButtonBackgroundViewColor = self->_highlightedButtonBackgroundViewColor;
    }
    else {
      highlightedButtonBackgroundViewColor = 0;
    }
    id v4 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView contentView];
    [v4 setBackgroundColor:highlightedButtonBackgroundViewColor];

    if ([(UIButton *)self->_doneButton isHighlighted]) {
      BOOL v5 = self->_highlightedButtonBackgroundViewColor;
    }
    else {
      BOOL v5 = 0;
    }
    id v6 = [(UIVisualEffectView *)self->_doneButtonBackgroundView contentView];
    [v6 setBackgroundColor:v5];
  }
}

- (void)_setupViews
{
  uint64_t v3 = sub_1000BBB44(self);
  id v4 = [(LookAroundFloatingButtonsViewController *)self view];
  [v4 _setTouchInsets:-10.0, -10.0, -10.0, -10.0];

  id v5 = objc_alloc((Class)UIVisualEffectView);
  id v6 = +[UIBlurEffect effectWithStyle:7];
  double v7 = (UIVisualEffectView *)[v5 initWithEffect:v6];
  alternateButtonBackgroundView = self->_alternateButtonBackgroundView;
  self->_alternateButtonBackgroundView = v7;

  BOOL v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  [(UIVisualEffectView *)self->_alternateButtonBackgroundView _setGroupName:v10];

  [(UIVisualEffectView *)self->_alternateButtonBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v11 = [(LookAroundFloatingButtonsViewController *)self view];
  [v11 addSubview:self->_alternateButtonBackgroundView];

  id v12 = +[UIButton buttonWithType:0];
  alternateButton = self->_alternateButton;
  self->_alternateButton = v12;

  if (v3 == 5) {
    double v14 = 10.0;
  }
  else {
    double v14 = 8.0;
  }
  if (v3 == 5) {
    double v15 = 7.0;
  }
  else {
    double v15 = 8.0;
  }
  if (v3 == 5) {
    double v16 = 0.0;
  }
  else {
    double v16 = 8.0;
  }
  if (v3 == 5) {
    double v17 = 16.0;
  }
  else {
    double v17 = 20.0;
  }
  [(UIButton *)self->_alternateButton setAdjustsImageWhenHighlighted:v3 == 5];
  v18 = +[UIColor labelColor];
  [(UIButton *)self->_alternateButton setTintColor:v18];

  [(UIButton *)self->_alternateButton setTranslatesAutoresizingMaskIntoConstraints:0];
  -[UIButton setContentEdgeInsets:](self->_alternateButton, "setContentEdgeInsets:", v16, v15, v16, v14);
  [(UIButton *)self->_alternateButton addTarget:self action:"didTapButton:" forControlEvents:64];
  if (self->_showsMinimizedButton) {
    v19 = @"arrow.down.right.and.arrow.up.left";
  }
  else {
    v19 = @"arrow.up.left.and.arrow.down.right";
  }
  v20 = self->_alternateButton;
  v21 = v19;
  LODWORD(v22) = 1148846080;
  [(UIButton *)v20 setContentCompressionResistancePriority:1 forAxis:v22];
  v23 = self->_alternateButton;
  v24 = +[UIImage systemImageNamed:v21];

  [(UIButton *)v23 setImage:v24 forState:0];
  v25 = self->_alternateButton;
  v26 = +[UIImageSymbolConfiguration configurationWithPointSize:v17];
  [(UIButton *)v25 setPreferredSymbolConfiguration:v26 forImageInState:0];

  [(UIButton *)self->_alternateButton addObserver:self forKeyPath:@"highlighted" options:1 context:0];
  [(UIButton *)self->_alternateButton setAccessibilityIdentifier:@"LookAroundFloatingButtonsAlternateButton"];
  v27 = [(LookAroundFloatingButtonsViewController *)self view];
  [v27 addSubview:self->_alternateButton];

  v28 = (HairlineView *)objc_opt_new();
  separator = self->_separator;
  self->_separator = v28;

  [(HairlineView *)self->_separator setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HairlineView *)self->_separator setVertical:1];
  [(HairlineView *)self->_separator setHidden:v3 == 5];
  v30 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView contentView];
  [v30 addSubview:self->_separator];

  id v31 = objc_alloc((Class)UIVisualEffectView);
  v32 = +[UIBlurEffect effectWithStyle:7];
  v33 = (UIVisualEffectView *)[v31 initWithEffect:v32];
  doneButtonBackgroundView = self->_doneButtonBackgroundView;
  self->_doneButtonBackgroundView = v33;

  v35 = (objc_class *)objc_opt_class();
  v36 = NSStringFromClass(v35);
  [(UIVisualEffectView *)self->_doneButtonBackgroundView _setGroupName:v36];

  [(UIVisualEffectView *)self->_doneButtonBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  v37 = [(LookAroundFloatingButtonsViewController *)self view];
  [v37 addSubview:self->_doneButtonBackgroundView];

  v38 = +[UIButton buttonWithType:0];
  doneButton = self->_doneButton;
  self->_doneButton = v38;

  [(UIButton *)self->_doneButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_doneButton addTarget:self action:"didTapDoneButton:" forControlEvents:64];
  v40 = [(UIButton *)self->_doneButton titleLabel];
  +[DynamicTypeWizard autorefreshLabel:v40 withFontProvider:&stru_1012FEC10];

  v41 = self->_doneButton;
  v42 = objc_opt_new();
  [(UIButton *)v41 setBackgroundImage:v42 forState:0];

  if (v3 == 5)
  {
    v43 = +[UIColor labelColor];
    [(UIButton *)self->_doneButton setTintColor:v43];

    [(UIButton *)self->_doneButton setAdjustsImageWhenHighlighted:1];
    -[UIButton setContentEdgeInsets:](self->_doneButton, "setContentEdgeInsets:", 0.0, 11.0, 0.0, 7.0);
    v44 = self->_doneButton;
    v45 = +[UIImage systemImageNamed:@"xmark.circle.fill"];
    [(UIButton *)v44 setImage:v45 forState:0];

    v46 = self->_doneButton;
    v47 = +[UIImageSymbolConfiguration configurationWithPointSize:14.0];
    [(UIButton *)v46 setPreferredSymbolConfiguration:v47 forImageInState:0];
  }
  else
  {
    -[UIButton setContentEdgeInsets:](self->_doneButton, "setContentEdgeInsets:", 0.0, 12.0, 0.0, 12.0);
    v48 = self->_doneButton;
    v47 = +[NSBundle mainBundle];
    v49 = [v47 localizedStringForKey:@"Done [Exit LookAround Button]" value:@"localized string not found" table:0];
    [(UIButton *)v48 setTitle:v49 forState:0];
  }
  [(UIButton *)self->_doneButton addObserver:self forKeyPath:@"highlighted" options:1 context:0];
  [(UIButton *)self->_doneButton setAccessibilityIdentifier:@"LookAroundFloatingButtonsDoneButton"];
  v50 = [(LookAroundFloatingButtonsViewController *)self view];
  [v50 addSubview:self->_doneButton];

  if (v3 == 5)
  {
    v51 = +[UIButton buttonWithType:0];
    menuButton = self->_menuButton;
    self->_menuButton = v51;

    [(UIButton *)self->_menuButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v53 = +[UIColor labelColor];
    [(UIButton *)self->_menuButton setTintColor:v53];

    [(UIButton *)self->_menuButton setAdjustsImageWhenHighlighted:1];
    -[UIButton setContentEdgeInsets:](self->_menuButton, "setContentEdgeInsets:", 0.0, 4.0, 0.0, 10.0);
    v54 = self->_menuButton;
    v55 = +[UIImage systemImageNamed:@"ellipsis"];
    [(UIButton *)v54 setImage:v55 forState:0];

    v56 = self->_menuButton;
    v57 = +[UIImageSymbolConfiguration configurationWithPointSize:15.0];
    [(UIButton *)v56 setPreferredSymbolConfiguration:v57 forImageInState:0];

    [(UIButton *)self->_menuButton addObserver:self forKeyPath:@"highlighted" options:1 context:0];
    [(UIButton *)self->_menuButton setContextMenuInteractionEnabled:1];
    [(UIButton *)self->_menuButton setShowsMenuAsPrimaryAction:1];
    v58 = [(LookAroundFloatingButtonsViewController *)self optionsMenu];
    [(UIButton *)self->_menuButton setMenu:v58];

    [(UIButton *)self->_menuButton setUserInteractionEnabled:self->_showsMinimizedButton];
    double v59 = 1.0;
    if (!self->_showsMinimizedButton) {
      double v59 = 0.0;
    }
    [(UIButton *)self->_menuButton setAlpha:v59];
    [(UIButton *)self->_menuButton setAccessibilityIdentifier:@"LookAroundFloatingButtonsMenuButton"];
    v60 = [(LookAroundFloatingButtonsViewController *)self view];
    [v60 addSubview:self->_menuButton];
  }
  v61 = +[UIColor colorWithWhite:1.0 alpha:0.150000006];
  highlightedButtonBackgroundViewColor = self->_highlightedButtonBackgroundViewColor;
  self->_highlightedButtonBackgroundViewColor = v61;

  [(LookAroundFloatingButtonsViewController *)self updateTheme];

  [(LookAroundFloatingButtonsViewController *)self _setCornerRadii];
}

- (id)optionsMenu
{
  objc_initWeak(&location, self);
  uint64_t v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"Hide Labels [LookAround Options]" value:@"localized string not found" table:0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100891F84;
  v22[3] = &unk_1012E8CD0;
  objc_copyWeak(&v23, &location);
  id v5 = +[UIAction actionWithTitle:v4 image:0 identifier:0 handler:v22];

  [v5 setState:[self hidingLabels]];
  id v6 = +[NSBundle mainBundle];
  double v7 = [v6 localizedStringForKey:@"Imagery Info [LookAround Options]" value:@"localized string not found" table:0];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100891FFC;
  v20[3] = &unk_1012E8CD0;
  objc_copyWeak(&v21, &location);
  objc_super v8 = +[UIAction actionWithTitle:v7 image:0 identifier:0 handler:v20];

  v26 = v8;
  BOOL v9 = +[NSArray arrayWithObjects:&v26 count:1];
  id v10 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v9];

  uint64_t v11 = +[NSBundle mainBundle];
  id v12 = [v11 localizedStringForKey:@"Report an Issue" value:@"localized string not found" table:0];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100892074;
  v18[3] = &unk_1012E8CD0;
  objc_copyWeak(&v19, &location);
  objc_super v13 = +[UIAction actionWithTitle:v12 image:0 identifier:0 handler:v18];

  v25[0] = v5;
  double v14 = +[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:0];
  v25[1] = v14;
  v25[2] = v10;
  v25[3] = v13;
  double v15 = +[NSArray arrayWithObjects:v25 count:4];
  double v16 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:0 children:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v16;
}

- (void)_setupConstraints
{
  id v134 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v3 = sub_1000BBB44(self);
  alternateButtonBackgroundView = self->_alternateButtonBackgroundView;
  if (v3 == 5)
  {
    id v5 = [(UIVisualEffectView *)alternateButtonBackgroundView trailingAnchor];
    id v6 = [(UIButton *)self->_menuButton trailingAnchor];
    double v7 = [v5 constraintEqualToAnchor:v6];
    menuButtonVisibleConstraint = self->_menuButtonVisibleConstraint;
    self->_menuButtonVisibleConstraint = v7;

    BOOL v9 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView trailingAnchor];
    id v10 = [(UIButton *)self->_alternateButton trailingAnchor];
    uint64_t v11 = [v9 constraintEqualToAnchor:v10];
    menuButtonHiddenConstraint = self->_menuButtonHiddenConstraint;
    self->_menuButtonHiddenConstraint = v11;

    objc_super v13 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView leadingAnchor];
    v121 = [(LookAroundFloatingButtonsViewController *)self view];
    uint64_t v112 = [v121 leadingAnchor];
    v133 = v13;
    uint64_t v114 = [v13 constraintEqualToAnchor:v112];
    v138[0] = v114;
    v110 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView topAnchor];
    v102 = [(LookAroundFloatingButtonsViewController *)self view];
    uint64_t v99 = [v102 topAnchor];
    uint64_t v108 = [v110 constraintEqualToAnchor:v99];
    v138[1] = v108;
    v95 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView bottomAnchor];
    v131 = [(LookAroundFloatingButtonsViewController *)self view];
    v129 = [v131 bottomAnchor];
    uint64_t v87 = [v95 constraintEqualToAnchor:];
    v138[2] = v87;
    v127 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView heightAnchor];
    v125 = [v127 constraintEqualToConstant:30.0];
    v138[3] = v125;
    double v14 = [(UIButton *)self->_doneButton leadingAnchor];
    v119 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView leadingAnchor];
    v123 = v14;
    v117 = [v14 constraintEqualToAnchor:v119];
    v138[4] = v117;
    v104 = [(UIButton *)self->_doneButton centerYAnchor];
    v106 = [(LookAroundFloatingButtonsViewController *)self view];
    v100 = [v106 centerYAnchor];
    v97 = [v104 constraintEqualToAnchor:v100];
    v138[5] = v97;
    v93 = [(UIButton *)self->_doneButton heightAnchor];
    v91 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView heightAnchor];
    v89 = [v93 constraintEqualToAnchor:v91];
    v138[6] = v89;
    v85 = [(UIButton *)self->_alternateButton leadingAnchor];
    v83 = [(UIButton *)self->_doneButton trailingAnchor];
    v82 = [v85 constraintEqualToAnchor:v83];
    v138[7] = v82;
    v80 = [(UIButton *)self->_alternateButton centerYAnchor];
    v81 = [(LookAroundFloatingButtonsViewController *)self view];
    v79 = [v81 centerYAnchor];
    v78 = [v80 constraintEqualToAnchor:v79];
    v138[8] = v78;
    v77 = [(UIButton *)self->_alternateButton heightAnchor];
    v76 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView heightAnchor];
    v75 = [v77 constraintEqualToAnchor:v76];
    v138[9] = v75;
    v74 = [(UIButton *)self->_menuButton leadingAnchor];
    v73 = [(UIButton *)self->_alternateButton trailingAnchor];
    double v15 = [v74 constraintEqualToAnchor:v73];
    v138[10] = v15;
    double v16 = [(UIButton *)self->_menuButton centerYAnchor];
    double v17 = [(LookAroundFloatingButtonsViewController *)self view];
    v18 = [v17 centerYAnchor];
    id v19 = [v16 constraintEqualToAnchor:v18];
    v138[11] = v19;
    v20 = [(UIButton *)self->_menuButton heightAnchor];
    id v21 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView heightAnchor];
    double v22 = [v20 constraintEqualToAnchor:v21];
    id v23 = self->_menuButtonHiddenConstraint;
    v138[12] = v22;
    v138[13] = v23;
    v24 = +[NSArray arrayWithObjects:v138 count:14];
    [v134 addObjectsFromArray:v24];

    v25 = (void *)v87;
    v26 = (void *)v99;

    v27 = (void *)v112;
    v28 = v102;

    v29 = (void *)v114;
    v30 = v121;

    id v31 = v95;
    v32 = (void *)v108;

    v33 = v110;
  }
  else
  {
    v34 = [(UIVisualEffectView *)alternateButtonBackgroundView topAnchor];
    v35 = [(LookAroundFloatingButtonsViewController *)self view];
    v36 = [v35 topAnchor];
    v37 = [v34 constraintEqualToAnchor:v36];
    v137[0] = v37;
    v38 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView bottomAnchor];
    v39 = [(LookAroundFloatingButtonsViewController *)self view];
    v40 = [v39 bottomAnchor];
    v41 = [v38 constraintEqualToAnchor:v40];
    v137[1] = v41;
    v42 = +[NSArray arrayWithObjects:v137 count:2];
    [v134 addObjectsFromArray:v42];

    v43 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView leadingAnchor];
    v44 = [(LookAroundFloatingButtonsViewController *)self view];
    v45 = [v44 leadingAnchor];
    v46 = [v43 constraintGreaterThanOrEqualToAnchor:v45];
    alternateButtonLeadingConstraintGrouped = self->_alternateButtonLeadingConstraintGrouped;
    self->_alternateButtonLeadingConstraintGrouped = v46;

    LODWORD(v48) = 1144750080;
    [(NSLayoutConstraint *)self->_alternateButtonLeadingConstraintGrouped setPriority:v48];
    v49 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView leadingAnchor];
    v50 = [(LookAroundFloatingButtonsViewController *)self view];
    v51 = [v50 leadingAnchor];
    v52 = [v49 constraintEqualToAnchor:v51];
    alternateButtonLeadingConstraintSeparated = self->_alternateButtonLeadingConstraintSeparated;
    self->_alternateButtonLeadingConstraintSeparated = v52;

    v54 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView contentView];
    v132 = [(UIButton *)self->_alternateButton topAnchor];
    v130 = [v54 topAnchor];
    v128 = [v132 constraintEqualToAnchor:v130];
    v136[0] = v128;
    v126 = [(UIButton *)self->_alternateButton bottomAnchor];
    v124 = [v54 bottomAnchor];
    v122 = [v126 constraintEqualToAnchor:v124];
    v136[1] = v122;
    v120 = [(UIButton *)self->_alternateButton leadingAnchor];
    v118 = [v54 leadingAnchor];
    v116 = [v120 constraintEqualToAnchor:v118];
    v136[2] = v116;
    v115 = [(UIButton *)self->_alternateButton trailingAnchor];
    v113 = [(HairlineView *)self->_separator leadingAnchor];
    v111 = [v115 constraintEqualToAnchor:v113];
    v136[3] = v111;
    v109 = [(HairlineView *)self->_separator topAnchor];
    v107 = [v54 topAnchor];
    v105 = [v109 constraintEqualToAnchor:v107];
    v136[4] = v105;
    v103 = [(HairlineView *)self->_separator bottomAnchor];
    v101 = [v54 bottomAnchor];
    v98 = [v103 constraintEqualToAnchor:v101];
    v136[5] = v98;
    v96 = [(HairlineView *)self->_separator trailingAnchor];
    v133 = v54;
    v94 = [v54 trailingAnchor];
    v92 = [v96 constraintEqualToAnchor:v94];
    v136[6] = v92;
    v88 = [(UIVisualEffectView *)self->_doneButtonBackgroundView topAnchor];
    v90 = [(LookAroundFloatingButtonsViewController *)self view];
    v86 = [v90 topAnchor];
    v84 = [v88 constraintEqualToAnchor:v86];
    v136[7] = v84;
    v55 = [(UIVisualEffectView *)self->_doneButtonBackgroundView bottomAnchor];
    v56 = [(LookAroundFloatingButtonsViewController *)self view];
    v57 = [v56 bottomAnchor];
    v58 = [v55 constraintEqualToAnchor:v57];
    v136[8] = v58;
    double v59 = [(UIVisualEffectView *)self->_doneButtonBackgroundView trailingAnchor];
    v60 = [(LookAroundFloatingButtonsViewController *)self view];
    v61 = [v60 trailingAnchor];
    v62 = [v59 constraintEqualToAnchor:v61];
    v136[9] = v62;
    v63 = +[NSArray arrayWithObjects:v136 count:10];
    [v134 addObjectsFromArray:v63];

    v64 = [(UIVisualEffectView *)self->_doneButtonBackgroundView leadingAnchor];
    v65 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView trailingAnchor];
    v66 = [v64 constraintEqualToAnchor:v65];
    doneButtonLeadingContraintGrouped = self->_doneButtonLeadingContraintGrouped;
    self->_doneButtonLeadingContraintGrouped = v66;

    v68 = [(UIVisualEffectView *)self->_doneButtonBackgroundView leadingAnchor];
    v69 = [(UIVisualEffectView *)self->_alternateButtonBackgroundView trailingAnchor];
    v70 = [v68 constraintGreaterThanOrEqualToAnchor:v69];
    doneButtonLeadingContraintSeparated = self->_doneButtonLeadingContraintSeparated;
    self->_doneButtonLeadingContraintSeparated = v70;

    LODWORD(v72) = 1144750080;
    [(NSLayoutConstraint *)self->_doneButtonLeadingContraintSeparated setPriority:v72];
    v30 = [(UIVisualEffectView *)self->_doneButtonBackgroundView contentView];
    v27 = [(UIButton *)self->_doneButton topAnchor];
    v29 = [v30 topAnchor];
    v33 = [v27 constraintEqualToAnchor:v29];
    v135[0] = v33;
    v28 = [(UIButton *)self->_doneButton bottomAnchor];
    v26 = [v30 bottomAnchor];
    v32 = [v28 constraintEqualToAnchor:v26];
    v135[1] = v32;
    id v31 = [(UIButton *)self->_doneButton leadingAnchor];
    v131 = [v30 leadingAnchor];
    v129 = [v31 constraintEqualToAnchor:];
    v135[2] = v129;
    v25 = [(UIButton *)self->_doneButton trailingAnchor];
    v127 = [v30 trailingAnchor];
    v125 = [v25 constraintEqualToAnchor:];
    v135[3] = v125;
    v123 = +[NSArray arrayWithObjects:v135 count:4];
    [v134 addObjectsFromArray:];
  }

  +[NSLayoutConstraint activateConstraints:v134];
  [(LookAroundFloatingButtonsViewController *)self _updateButtonLayoutAnimated:0];
}

- (void)_updateButtonLayoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(LookAroundFloatingButtonsViewController *)self traitCollection];
  [(LookAroundFloatingButtonsViewController *)self _updateButtonLayoutToTraitCollection:v5 withTransitionCoordinator:0 animated:v3];
}

- (void)_updateButtonLayoutToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
}

- (void)_setCornerRadii
{
  id v3 = [(LookAroundFloatingButtonsViewController *)self traitCollection];
  [(LookAroundFloatingButtonsViewController *)self _setCornerRadiiWithTraitCollection:v3];
}

- (void)_setCornerRadiiWithTraitCollection:(id)a3
{
  id v20 = a3;
  if (sub_1000BBB44(self) != 5)
  {
    id v7 = v20;
    objc_super v8 = v7;
    if (v7)
    {
      if ([v7 userInterfaceIdiom] == (id)5)
      {
        int v9 = 0;
        char v10 = 6;
LABEL_17:

        if (self->_groupButtonsIfNeeded) {
          char v11 = 0;
        }
        else {
          char v11 = -1;
        }
        if (!self->_groupButtonsIfNeeded || v9 == 0) {
          char v13 = v11;
        }
        else {
          char v13 = (0x23u >> v10) & 1;
        }
        double v14 = +[UIApplication sharedApplication];
        id v15 = [v14 userInterfaceLayoutDirection];

        uint64_t v16 = 10;
        uint64_t v17 = 15;
        if (v13) {
          uint64_t v16 = 15;
        }
        else {
          uint64_t v17 = 5;
        }
        if (v15 == (id)1) {
          uint64_t v18 = v16;
        }
        else {
          uint64_t v18 = v17;
        }
        if (v15 == (id)1) {
          uint64_t v19 = v17;
        }
        else {
          uint64_t v19 = v16;
        }
        [(UIVisualEffectView *)self->_alternateButtonBackgroundView _setCornerRadius:1 continuous:v18 maskedCorners:6.0];
        doneButtonBackgroundView = self->_doneButtonBackgroundView;
        double v5 = 6.0;
        uint64_t v6 = v19;
        goto LABEL_36;
      }
      if ([v8 horizontalSizeClass] == (id)1 && objc_msgSend(v8, "verticalSizeClass") == (id)2)
      {
        int v9 = 1;
        char v10 = 1;
        goto LABEL_17;
      }
      if ([v8 horizontalSizeClass] == (id)1 && objc_msgSend(v8, "verticalSizeClass") == (id)1
        || [v8 horizontalSizeClass] == (id)2 && objc_msgSend(v8, "verticalSizeClass") == (id)1
        || [v8 horizontalSizeClass] == (id)2 && objc_msgSend(v8, "verticalSizeClass") == (id)2)
      {
        int v9 = 1;
        char v10 = 4;
        goto LABEL_17;
      }
    }
    char v10 = 0;
    int v9 = 1;
    goto LABEL_17;
  }
  doneButtonBackgroundView = self->_alternateButtonBackgroundView;
  double v5 = 9.0;
  uint64_t v6 = 15;
LABEL_36:
  [(UIVisualEffectView *)doneButtonBackgroundView _setCornerRadius:1 continuous:v6 maskedCorners:v5];
}

- (void)_updateButtonLayoutToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (sub_1000BBB44(self) == 5) {
    goto LABEL_30;
  }
  id v10 = v8;
  char v11 = v10;
  if (!v10) {
    goto LABEL_15;
  }
  if ([v10 userInterfaceIdiom] != (id)5)
  {
    if ([v11 horizontalSizeClass] == (id)1 && objc_msgSend(v11, "verticalSizeClass") == (id)2)
    {
      int v12 = 1;
      char v13 = 1;
      goto LABEL_16;
    }
    if ([v11 horizontalSizeClass] == (id)1 && objc_msgSend(v11, "verticalSizeClass") == (id)1
      || [v11 horizontalSizeClass] == (id)2 && objc_msgSend(v11, "verticalSizeClass") == (id)1
      || [v11 horizontalSizeClass] == (id)2 && objc_msgSend(v11, "verticalSizeClass") == (id)2)
    {
      int v12 = 1;
      char v13 = 4;
      goto LABEL_16;
    }
LABEL_15:
    char v13 = 0;
    int v12 = 1;
    goto LABEL_16;
  }
  int v12 = 0;
  char v13 = 6;
LABEL_16:

  if (self->_groupButtonsIfNeeded) {
    LOBYTE(v14) = -1;
  }
  else {
    LOBYTE(v14) = 0;
  }
  if (self->_groupButtonsIfNeeded && v12 != 0) {
    unsigned int v14 = (0x1Cu >> v13) & 1;
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1008933F4;
  v25[3] = &unk_1012E5CE0;
  char v16 = v14 & 1;
  void v25[4] = self;
  char v27 = v14 & 1;
  id v26 = v11;
  uint64_t v17 = objc_retainBlock(v25);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10089354C;
  v23[3] = &unk_1012E8908;
  v23[4] = self;
  char v24 = v16;
  uint64_t v18 = objc_retainBlock(v23);
  if (v9)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10089356C;
    v21[3] = &unk_1012FEC60;
    double v22 = v17;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10089357C;
    v19[3] = &unk_1012FEC60;
    id v20 = v18;
    [v9 animateAlongsideTransition:v21 completion:v19];
  }
  else if (v5)
  {
    +[UIView animateWithDuration:v17 animations:v18 completion:0.25];
  }
  else
  {
    ((void (*)(void *))v17[2])(v17);
    ((void (*)(void *, uint64_t))v18[2])(v18, 1);
  }

LABEL_30:
}

- (void)didTapButton:(id)a3
{
  id v5 = a3;
  if (self->_showsMinimizedButton)
  {
    if ([(LookAroundFloatingButtonsViewController *)self isMinimizedButtonEnabled])
    {
      id v4 = [(LookAroundFloatingButtonsViewController *)self delegate];
      [v4 lookAroundFloatingButtonsViewController:self didTapMinimizeButton:v5];
      goto LABEL_7;
    }
    if (self->_showsMinimizedButton) {
      goto LABEL_8;
    }
  }
  if (![(LookAroundFloatingButtonsViewController *)self isMaximizedButtonEnabled]) {
    goto LABEL_8;
  }
  id v4 = [(LookAroundFloatingButtonsViewController *)self delegate];
  [v4 lookAroundFloatingButtonsViewController:self didTapMaximizeButton:v5];
LABEL_7:

LABEL_8:
}

- (void)didTapDoneButton:(id)a3
{
  id v4 = a3;
  id v5 = [(LookAroundFloatingButtonsViewController *)self delegate];
  [v5 lookAroundFloatingButtonsViewController:self didTapDoneButton:v4];
}

- (LookAroundFloatingButtonsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LookAroundFloatingButtonsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showsMinimizedButton
{
  return self->_showsMinimizedButton;
}

- (BOOL)hidingLabels
{
  return self->_hidingLabels;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_menuButtonHiddenConstraint, 0);
  objc_storeStrong((id *)&self->_menuButtonVisibleConstraint, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_highlightedButtonBackgroundViewColor, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_doneButtonLeadingContraintSeparated, 0);
  objc_storeStrong((id *)&self->_doneButtonLeadingContraintGrouped, 0);
  objc_storeStrong((id *)&self->_doneButtonBackgroundView, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_alternateButton, 0);
  objc_storeStrong((id *)&self->_alternateButtonLeadingConstraintSeparated, 0);
  objc_storeStrong((id *)&self->_alternateButtonLeadingConstraintGrouped, 0);

  objc_storeStrong((id *)&self->_alternateButtonBackgroundView, 0);
}

@end