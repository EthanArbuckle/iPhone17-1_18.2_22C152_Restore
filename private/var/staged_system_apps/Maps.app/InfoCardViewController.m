@interface InfoCardViewController
- (BOOL)isShowingFullHeader;
- (BOOL)supportsSharing;
- (KeyboardProxyingView)keyboardProxyView;
- (MUInfoCardAnalyticsDelegate)analyticsDelegate;
- (MUInfoCardContentProtocol)contentViewController;
- (MULibraryAccessProviding)libraryAccessProvider;
- (MacPopoverPresentationController)macPopoverPresentationController;
- (_TtC4Maps18InfoCardHeaderView)titleHeaderView;
- (double)heightForLayout:(unint64_t)a3;
- (double)macContaineeWidth;
- (double)titleTrailingConstant;
- (id)_createActionMenu;
- (id)_createButtonConfigurations;
- (id)headerActionItems;
- (id)headerMenuSortOrderByActionType;
- (id)headerView;
- (id)headerView:(id)a3 menuForButtonConfiguration:(id)a4;
- (id)menuElementForActionItem:(id)a3;
- (id)preferredFocusEnvironments;
- (id)underlyingHeaderViewForHitTesting:(id)a3;
- (int64_t)floatingControlsOptions;
- (void)_contentSizeDidChange;
- (void)_handleDismissActionWithHeaderView:(id)a3;
- (void)_showHeader:(BOOL)a3 animated:(BOOL)a4;
- (void)applyAlphaToContent:(double)a3;
- (void)applyLayoutToContent:(unint64_t)a3;
- (void)dealloc;
- (void)didScrollPastTransition;
- (void)handleDismissAction:(id)a3;
- (void)headerView:(id)a3 selectedActionButton:(id)a4 withPresentationOptions:(id)a5;
- (void)headerViewDidLayoutSubviews:(id)a3;
- (void)headerViewTapped:(id)a3;
- (void)instrumentDismissAction;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)rebuildHeaderMenu;
- (void)rebuildHeaderViewButtons;
- (void)scrollViewDidScroll:(id)a3;
- (void)setContaineeDelegate:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setKeyboardProxyView:(id)a3;
- (void)shouldDismissForHorizontalSwipe_nonUIKitCardsOnly;
- (void)updateContentHeaderTrailingConstant;
- (void)updateHeaderWithConstraints:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willBecomeCurrent:(BOOL)a3;
- (void)willChangeLayout:(unint64_t)a3;
@end

@implementation InfoCardViewController

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)InfoCardViewController;
  [(ContaineeViewController *)&v38 viewDidLoad];
  v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setAlwaysUseDefaultContaineeLayout:1];

  if (sub_1000BBB44(self) == 5)
  {
    [(ContaineeViewController *)self setKeepOriginalSafeInsets:1];
    v4 = (double *)&kMUPlaceHorizontalMarginSpacing;
  }
  else
  {
    v4 = (double *)&qword_100F71C78;
  }
  v5 = [(InfoCardViewController *)self view];
  [v5 setLayoutMargins:0.0, *v4, 0.0, *v4];

  v6 = -[InfoCardHeaderView initWithFrame:]([_TtC4Maps18InfoCardHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v6;

  [(InfoCardHeaderView *)self->_titleHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(InfoCardViewController *)self _createButtonConfigurations];
  [(InfoCardHeaderView *)self->_titleHeaderView setButtonConfigurations:v8];

  [(InfoCardHeaderView *)self->_titleHeaderView setDelegate:self];
  [(InfoCardHeaderView *)self->_titleHeaderView setPreservesSuperviewLayoutMargins:1];
  v9 = [(InfoCardViewController *)self view];
  [v9 addSubview:self->_titleHeaderView];

  v10 = +[NSMutableArray array];
  v32 = [(InfoCardHeaderView *)self->_titleHeaderView trailingAnchor];
  v33 = [(InfoCardViewController *)self view];
  v31 = [v33 safeAreaLayoutGuide];
  v30 = [v31 trailingAnchor];
  v29 = [v32 constraintEqualToAnchor:v30];
  v40[0] = v29;
  v27 = [(InfoCardHeaderView *)self->_titleHeaderView topAnchor];
  v28 = [(InfoCardViewController *)self view];
  v26 = [v28 safeAreaLayoutGuide];
  v11 = [v26 topAnchor];
  v12 = [v27 constraintEqualToAnchor:v11];
  v40[1] = v12;
  v13 = [(InfoCardHeaderView *)self->_titleHeaderView leadingAnchor];
  v14 = [(InfoCardViewController *)self view];
  v15 = [v14 safeAreaLayoutGuide];
  v16 = [v15 leadingAnchor];
  v17 = [v13 constraintEqualToAnchor:v16];
  v40[2] = v17;
  v18 = +[NSArray arrayWithObjects:v40 count:3];
  [v10 addObjectsFromArray:v18];

  objc_storeStrong((id *)&self->_currentHeaderConstraints, v10);
  +[NSLayoutConstraint activateConstraints:v10];
  [(InfoCardViewController *)self _contentSizeDidChange];
  v19 = +[NSNotificationCenter defaultCenter];
  [v19 addObserver:self selector:"_contentSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];

  v20 = +[NSUserDefaults standardUserDefaults];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v21 = &off_1013AE640;
  id v22 = [v21 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v35;
    do
    {
      v25 = 0;
      do
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v21);
        }
        [v20 addObserver:self forKeyPath:*(void *)(*((void *)&v34 + 1) + 8 * (void)v25) options:0 context:off_1015DD788];
        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v23);
  }

  [v20 addObserver:self forKeyPath:@"DefaultDisabledTransitModesKey" options:0 context:off_1015DD788];
  self->_isObservingUserDefaultsKVO = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)InfoCardViewController;
  [(InfoCardViewController *)&v5 viewDidAppear:a3];
  v4 = [(InfoCardViewController *)self keyboardProxyView];
  [v4 becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)InfoCardViewController;
  [(InfoCardViewController *)&v5 viewDidDisappear:a3];
  keyboardProxyView = self->_keyboardProxyView;
  self->_keyboardProxyView = 0;
}

- (id)preferredFocusEnvironments
{
  if (sub_1000BBB44(self) == 5)
  {
    v3 = [(InfoCardViewController *)self keyboardProxyView];
    v8[0] = v3;
    v4 = [(InfoCardViewController *)self contentViewController];
    v8[1] = v4;
    objc_super v5 = +[NSArray arrayWithObjects:v8 count:2];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)InfoCardViewController;
    objc_super v5 = [(InfoCardViewController *)&v7 preferredFocusEnvironments];
  }

  return v5;
}

- (double)titleTrailingConstant
{
  [(InfoCardHeaderView *)self->_titleHeaderView titleToEndTrailingConstant];
  return result;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  if (self->_isObservingUserDefaultsKVO)
  {
    v4 = +[NSUserDefaults standardUserDefaults];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v5 = &off_1013AE640;
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 removeObserver:self forKeyPath:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    [v4 removeObserver:self forKeyPath:@"DefaultDisabledTransitModesKey"];
  }
  v10.receiver = self;
  v10.super_class = (Class)InfoCardViewController;
  [(InfoCardViewController *)&v10 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if (off_1015DD788 == a6)
  {
    if ([&off_1013AE640 containsObject:v10])
    {
      long long v11 = [DrivePreferences alloc];
      long long v12 = +[NSUserDefaults standardUserDefaults];
      long long v13 = [(DrivePreferences *)v11 initWithDefaults:v12];
      long long v14 = [(DrivePreferences *)v13 automobileOptions];

      v15 = [(InfoCardViewController *)self contentViewController];
      [v15 setAutomobileOptions:v14];
    }
    else
    {
      if (![v10 isEqualToString:@"DefaultDisabledTransitModesKey"]) {
        goto LABEL_8;
      }
      v16 = [TransitPreferences alloc];
      v17 = +[NSUserDefaults standardUserDefaults];
      v18 = [(WatchSyncedPreferences *)v16 initWithDefaults:v17];
      long long v14 = [(TransitPreferences *)v18 transitOptions];

      v15 = [(InfoCardViewController *)self contentViewController];
      [v15 setTransitOptions:v14];
    }

    goto LABEL_8;
  }
  v19.receiver = self;
  v19.super_class = (Class)InfoCardViewController;
  [(InfoCardViewController *)&v19 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
LABEL_8:
}

- (void)_contentSizeDidChange
{
  v3 = +[MKFontManager sharedManager];
  id v8 = [v3 largeTitleFont];

  [v8 pointSize];
  double v5 = v4;
  id v6 = [(InfoCardViewController *)self titleHeaderView];
  [v6 titleLabelPointSize];
  self->_useSmoothTransition = v5 == v7;
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 == 3)
  {
    if (sub_1000BBB44(self) == 5)
    {
      double v4 = [(InfoCardViewController *)self contentViewController];
      [v4 currentHeight];
      double v14 = v13 + 10.0;
LABEL_14:

      return v14;
    }
LABEL_8:
    double v4 = [(ContaineeViewController *)self cardPresentationController];
    [v4 availableHeight];
    double v14 = v15;
    goto LABEL_14;
  }
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      double v4 = [(ContaineeViewController *)self cardPresentationController];
      [v4 bottomSafeOffset];
      double v6 = v5;
      double v7 = [(InfoCardViewController *)self contentViewController];
      [(id)objc_opt_class() headerHeightInMinimalMode];
      double v9 = v8;
      id v10 = [(InfoCardViewController *)self titleHeaderView];
      [v10 frame];
      if (v9 > CGRectGetHeight(v19))
      {
        long long v11 = [(InfoCardViewController *)self contentViewController];
        [(id)objc_opt_class() headerHeightInMinimalMode];
      }
      else
      {
        long long v11 = [(InfoCardViewController *)self titleHeaderView];
        [v11 frame];
        double Height = CGRectGetHeight(v20);
      }
      double v17 = Height;

      double v14 = v6 + v17;
      goto LABEL_14;
    }
    goto LABEL_8;
  }

  sub_10002197C();
  return result;
}

- (void)setContentViewController:(id)a3
{
  double v5 = (MUInfoCardContentProtocol *)a3;
  p_contentViewController = &self->_contentViewController;
  contentViewController = self->_contentViewController;
  if (contentViewController != v5)
  {
    double v8 = [(MUInfoCardContentProtocol *)contentViewController view];
    [v8 removeFromSuperview];

    [(MUInfoCardContentProtocol *)*p_contentViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_contentViewController, a3);
    double v9 = [DrivePreferences alloc];
    id v10 = +[NSUserDefaults standardUserDefaults];
    long long v11 = [(DrivePreferences *)v9 initWithDefaults:v10];
    long long v12 = [(DrivePreferences *)v11 automobileOptions];
    [(MUInfoCardContentProtocol *)*p_contentViewController setAutomobileOptions:v12];

    double v13 = [TransitPreferences alloc];
    double v14 = +[NSUserDefaults standardUserDefaults];
    double v15 = [(WatchSyncedPreferences *)v13 initWithDefaults:v14];
    v16 = [(TransitPreferences *)v15 transitOptions];
    [(MUInfoCardContentProtocol *)*p_contentViewController setTransitOptions:v16];

    double v17 = [CyclePreferences alloc];
    v18 = +[NSUserDefaults standardUserDefaults];
    CGRect v19 = [(CyclePreferences *)v17 initWithDefaults:v18];
    CGRect v20 = [(CyclePreferences *)v19 cyclingOptions];
    [(MUInfoCardContentProtocol *)*p_contentViewController setCyclingOptions:v20];

    v21 = [WalkPreferences alloc];
    id v22 = +[NSUserDefaults standardUserDefaults];
    id v23 = [(WalkPreferences *)v21 initWithDefaults:v22];
    uint64_t v24 = [(WalkPreferences *)v23 walkingOptions];
    [(MUInfoCardContentProtocol *)*p_contentViewController setWalkingOptions:v24];

    if (v5)
    {
      [(MUInfoCardContentProtocol *)v5 setScrollViewDelegate:self];
      v25 = [(ContaineeViewController *)self cardPresentationController];
      -[InfoCardViewController willChangeLayout:](self, "willChangeLayout:", [v25 containeeLayout]);

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10036D688;
      v26[3] = &unk_1012E5D58;
      v27 = v5;
      v28 = self;
      +[UIView performWithoutAnimation:v26];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)InfoCardViewController;
  [(ContaineeViewController *)&v15 viewDidLayoutSubviews];
  v3 = [(InfoCardViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  [(InfoCardHeaderView *)self->_titleHeaderView bounds];
  double Height = CGRectGetHeight(v16);
  if (Height == 0.0) {
    [(ContaineeViewController *)self headerHeight];
  }
  double v11 = Height;
  double v12 = v9 - Height;
  double v13 = [(MUInfoCardContentProtocol *)self->_contentViewController view];
  [v13 setFrame:v5, v11, v7, v12];

  double v14 = [(MUInfoCardContentProtocol *)self->_contentViewController scrollView];
  [v14 setContentInset:-v11, 0.0, 0.0, 0.0];
}

- (MULibraryAccessProviding)libraryAccessProvider
{
  return 0;
}

- (id)_createButtonConfigurations
{
  v3 = +[NSMutableArray array];
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    double v4 = [(InfoCardViewController *)self libraryAccessProvider];

    if (v4)
    {
      double v5 = [(InfoCardViewController *)self libraryAccessProvider];
      id v6 = [v5 savedStateOfPlace];

      if (v6 == (id)2)
      {
        double v8 = +[MapsOfflineUIHelper sharedHelper];
        unsigned __int8 v9 = [v8 isUsingOfflineMaps];

        if (v9) {
          goto LABEL_10;
        }
        double v7 = [[_TtC4Maps27InfoCardButtonConfiguration alloc] initWithType:5 shouldBlur:0 tintColor:0 visibility:0];
      }
      else
      {
        if (v6 != (id)1) {
          goto LABEL_10;
        }
        double v7 = +[LibraryUIUtilities createPlacedCardSavedButtonConfig];
      }
      id v10 = v7;
      if (v7)
      {
        [v3 addObject:v7];
      }
    }
  }
LABEL_10:
  if (sub_1000BBB44(self) == 5)
  {
    uint64_t v11 = 1;
    [(ContaineeViewController *)self setKeepOriginalSafeInsets:1];
    double v12 = [(InfoCardViewController *)self view];
    -[InfoCardButtonConfiguration setLayoutMargins:](v12, "setLayoutMargins:", 0.0, kMUPlaceHorizontalMarginSpacing, 0.0, kMUPlaceHorizontalMarginSpacing);
LABEL_14:

    goto LABEL_16;
  }
  if ([(InfoCardViewController *)self supportsSharing])
  {
    double v12 = [[_TtC4Maps27InfoCardButtonConfiguration alloc] initWithType:3 shouldBlur:0 tintColor:0 visibility:0];
    [v3 addObject:v12];
    uint64_t v11 = 0;
    goto LABEL_14;
  }
  uint64_t v11 = 0;
LABEL_16:
  double v13 = [[_TtC4Maps27InfoCardButtonConfiguration alloc] initWithType:v11 shouldBlur:0 tintColor:0 visibility:1];
  [v3 addObject:v13];

  return v3;
}

- (void)rebuildHeaderViewButtons
{
  if ([(InfoCardViewController *)self isViewLoaded])
  {
    id v3 = [(InfoCardViewController *)self _createButtonConfigurations];
    [(InfoCardHeaderView *)self->_titleHeaderView setButtonConfigurations:v3];
  }
}

- (void)_showHeader:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(InfoCardViewController *)self contentViewController];
  [v7 hideTitle:v5];

  [(InfoCardHeaderView *)self->_titleHeaderView setHideTitleLabel:v5 ^ 1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10036DBC8;
  v10[3] = &unk_1012E6300;
  v10[4] = self;
  BOOL v11 = v5;
  double v8 = objc_retainBlock(v10);
  unsigned __int8 v9 = v8;
  if (v4) {
    +[UIView animateWithDuration:v8 animations:0.25];
  }
  else {
    ((void (*)(void *))v8[2])(v8);
  }
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  [(InfoCardViewController *)self instrumentDismissAction];
  v5.receiver = self;
  v5.super_class = (Class)InfoCardViewController;
  [(ContaineeViewController *)&v5 handleDismissAction:v4];
}

- (void)instrumentDismissAction
{
  id v2 = [(InfoCardViewController *)self analyticsDelegate];
  [v2 infoCardAnalyticsDidSelectAction:4 target:201 eventValue:0 feedbackDelegateSelector:0 actionRichProviderId:0];
}

- (void)setContaineeDelegate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)InfoCardViewController;
  [(ContaineeViewController *)&v8 setContaineeDelegate:a3];
  id v4 = [(ContaineeViewController *)self containeeDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ContaineeViewController *)self containeeDelegate];
    double v7 = [(InfoCardViewController *)self keyboardProxyView];
    [v6 containeeViewController:self didCreateKeyboardProxy:v7];
  }
}

- (id)headerView
{
  return self->_titleHeaderView;
}

- (KeyboardProxyingView)keyboardProxyView
{
  if (!self->_keyboardProxyView && sub_1000BBB44(self) == 5)
  {
    id v3 = -[KeyboardProxyingView initWithFrame:]([KeyboardProxyingView alloc], "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
    keyboardProxyView = self->_keyboardProxyView;
    self->_keyboardProxyView = v3;

    char v5 = [(InfoCardViewController *)self view];
    [v5 addSubview:self->_keyboardProxyView];
  }
  id v6 = self->_keyboardProxyView;

  return v6;
}

- (void)updateHeaderWithConstraints:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    p_currentHeaderConstraints = &self->_currentHeaderConstraints;
    if ([(NSArray *)*p_currentHeaderConstraints count]) {
      +[NSLayoutConstraint deactivateConstraints:*p_currentHeaderConstraints];
    }
    objc_storeStrong((id *)p_currentHeaderConstraints, a3);
    +[NSLayoutConstraint activateConstraints:v6];
  }
}

- (void)rebuildHeaderMenu
{
  id v3 = [(InfoCardViewController *)self traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5)
  {
    titleHeaderView = self->_titleHeaderView;
    [(InfoCardHeaderView *)titleHeaderView invalidateButtonMenus];
  }
}

- (id)headerMenuSortOrderByActionType
{
  uint64_t v2 = MKMenuSeperatorIdentifier;
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    objc_super v38 = &off_1013A6A30;
    v39 = &off_1013A6A48;
    v40 = &off_1013A6A60;
    v41 = &off_1013A6A78;
    v42 = &off_1013A6A90;
    uint64_t v43 = v2;
    v44 = &off_1013A6AA8;
    v45 = &off_1013A6AC0;
    v46 = &off_1013A6AD8;
    uint64_t v47 = v2;
    v48 = &off_1013A6AF0;
    v49 = &off_1013A6B08;
    v50 = &off_1013A6B20;
    v51 = &off_1013A6B38;
    v52 = &off_1013A6B50;
    uint64_t v53 = v2;
    v54 = &off_1013A6B68;
    uint64_t v55 = v2;
    v56 = &off_1013A6B80;
    v57 = &off_1013A6B98;
    v58 = &off_1013A6BB0;
    v59 = &off_1013A6BC8;
    uint64_t v60 = v2;
    v61 = &off_1013A6BE0;
    v62 = &off_1013A6BF8;
    uint64_t v63 = v2;
    v64 = &off_1013A6C10;
    uint64_t v65 = v2;
    v66 = &off_1013A6C28;
    v67 = &off_1013A6C40;
    v68 = &off_1013A6C58;
    uint64_t v69 = v2;
    v70 = &off_1013A6C70;
    v71 = &off_1013A6C88;
    id v3 = &v38;
    uint64_t v4 = 34;
  }
  else
  {
    double v7 = &off_1013A6AA8;
    objc_super v8 = &off_1013A6AC0;
    unsigned __int8 v9 = &off_1013A6AD8;
    uint64_t v10 = v2;
    BOOL v11 = &off_1013A6AF0;
    double v12 = &off_1013A6B08;
    double v13 = &off_1013A6B20;
    double v14 = &off_1013A6B38;
    objc_super v15 = &off_1013A6B50;
    uint64_t v16 = v2;
    double v17 = &off_1013A6B68;
    uint64_t v18 = v2;
    CGRect v19 = &off_1013A6CA0;
    CGRect v20 = &off_1013A6CB8;
    v21 = &off_1013A6B80;
    id v22 = &off_1013A6B98;
    id v23 = &off_1013A6A60;
    uint64_t v24 = &off_1013A6BB0;
    v27 = &off_1013A6BE0;
    v28 = &off_1013A6BF8;
    uint64_t v29 = v2;
    v30 = &off_1013A6C10;
    uint64_t v31 = v2;
    v32 = &off_1013A6C28;
    v25 = &off_1013A6BC8;
    uint64_t v26 = v2;
    v33 = &off_1013A6C40;
    long long v34 = &off_1013A6C58;
    uint64_t v35 = v2;
    long long v36 = &off_1013A6C70;
    long long v37 = &off_1013A6C88;
    id v3 = &v7;
    uint64_t v4 = 31;
  }
  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, v4, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21,
    v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    v53,
    v54,
    v55,
    v56,
    v57,
    v58,
    v59,
    v60,
    v61,
    v62,
    v63,
    v64,
  char v5 = v65);

  return v5;
}

- (id)_createActionMenu
{
  id v3 = objc_alloc((Class)MKPlaceCardMenuBuildingOptions);
  uint64_t v4 = [(InfoCardViewController *)self headerMenuSortOrderByActionType];
  id v5 = [v3 initWithRequestedActionTypes:v4];

  [v5 setAddMismatchedItems:0];
  objc_initWeak(&location, self);
  id v6 = [(InfoCardViewController *)self headerActionItems];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10036E3AC;
  v9[3] = &unk_1012E6270;
  objc_copyWeak(&v10, &location);
  double v7 = +[MKPlaceCardActionItem buildActionMenuForItems:v6 buildingOptions:v5 menuElementCreationBlock:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);

  return v7;
}

- (id)headerActionItems
{
  return &__NSArray0__struct;
}

- (id)menuElementForActionItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 resolvedActionItem];
  id v6 = [v5 titleForDisplayStyle:0];

  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10036E58C;
  v10[3] = &unk_1012E62D8;
  id v7 = v4;
  id v11 = v7;
  objc_copyWeak(&v12, &location);
  objc_super v8 = +[UIAction actionWithTitle:v6 image:0 identifier:0 handler:v10];
  [v8 setAttributes:[v7 enabled] ^ 1];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);

  return v8;
}

- (void)headerViewTapped:(id)a3
{
  id v4 = [(InfoCardViewController *)self analyticsDelegate];
  [v4 infoCardAnalyticsDidSelectAction:6042 eventValue:0 feedbackDelegateSelector:0];

  id v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 wantsExpandLayout];
}

- (void)headerView:(id)a3 selectedActionButton:(id)a4 withPresentationOptions:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 type] == (id)3)
  {
    [(InfoCardViewController *)self handleShareWithPresentationOptions:v9];
  }
  else if ([v8 type] == (id)5 || objc_msgSend(v8, "type") == (id)6)
  {
    -[InfoCardViewController handleAddOrRemoveFromLibraryHeaderAction:](self, "handleAddOrRemoveFromLibraryHeaderAction:", [v8 type] == (id)5);
  }
  else
  {
    [(InfoCardViewController *)self _handleDismissActionWithHeaderView:v10];
  }
}

- (id)underlyingHeaderViewForHitTesting:(id)a3
{
  if ([(InfoCardHeaderView *)self->_titleHeaderView hideTitleLabel])
  {
    id v4 = [(MUInfoCardContentProtocol *)self->_contentViewController viewForHeaderContainmentString];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)headerView:(id)a3 menuForButtonConfiguration:(id)a4
{
  if (objc_msgSend(a4, "type", a3) == (id)1)
  {
    id v5 = [(InfoCardViewController *)self _createActionMenu];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)headerViewDidLayoutSubviews:(id)a3
{
}

- (void)updateContentHeaderTrailingConstant
{
}

- (void)_handleDismissActionWithHeaderView:(id)a3
{
  id v4 = a3;
  if (sub_1000BBB44(self) != 5) {
    [(InfoCardViewController *)self handleDismissAction:v4];
  }
}

- (BOOL)supportsSharing
{
  return 1;
}

- (MUInfoCardAnalyticsDelegate)analyticsDelegate
{
  id v3 = [(InfoCardViewController *)self contentViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___MUInfoCardAnalyticsDelegate];

  if (v4)
  {
    id v5 = [(InfoCardViewController *)self contentViewController];
  }
  else
  {
    id v5 = 0;
  }

  return (MUInfoCardAnalyticsDelegate *)v5;
}

- (void)willChangeLayout:(unint64_t)a3
{
  id v5 = [(ContaineeViewController *)self cardPresentationController];
  id v6 = [v5 containeeLayout];

  v10.receiver = self;
  v10.super_class = (Class)InfoCardViewController;
  [(ContaineeViewController *)&v10 willChangeLayout:a3];
  if (a3 == 2)
  {
    id v8 = [(InfoCardViewController *)self titleHeaderView];
    [v8 setHairLineAlpha:0.0];

    id v9 = [(InfoCardViewController *)self contentViewController];
    [v9 scrollToTopAnimated:1];

    if (v6 != (id)1) {
      return;
    }
  }
  else
  {
    if (a3 != 1) {
      return;
    }
    id v7 = [(InfoCardViewController *)self contentViewController];
    [v7 scrollToTopAnimated:1];
  }
  [(InfoCardViewController *)self _showHeader:0 animated:1];
}

- (void)willBecomeCurrent:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)InfoCardViewController;
  [(ContaineeViewController *)&v4 willBecomeCurrent:a3];
  id v3 = +[DeviceRecentLocations sharedInstance];
  [v3 updateLocationsWithCompletionHandler:0];
}

- (void)applyAlphaToContent:(double)a3
{
  id v5 = [(InfoCardViewController *)self contentViewController];
  [v5 setContentAlpha:a3];

  id v6 = [(ContaineeViewController *)self cardPresentationController];
  -[InfoCardViewController applyLayoutToContent:](self, "applyLayoutToContent:", [v6 containeeLayout]);
}

- (void)applyLayoutToContent:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_100F6EEB0[a3 - 1];
  }
  id v4 = [(InfoCardViewController *)self contentViewController];
  [v4 setContentVisibility:v3];
}

- (void)shouldDismissForHorizontalSwipe_nonUIKitCardsOnly
{
}

- (int64_t)floatingControlsOptions
{
  return 251;
}

- (BOOL)isShowingFullHeader
{
  uint64_t v2 = [(InfoCardViewController *)self titleHeaderView];
  [v2 hairLineAlpha];
  BOOL v4 = v3 == 0.0;

  return v4;
}

- (void)didScrollPastTransition
{
  if (!self->_useSmoothTransition)
  {
    [(InfoCardHeaderView *)self->_titleHeaderView setHideTitleLabel:0];
    id v3 = [(InfoCardViewController *)self titleHeaderView];
    [v3 setBlurButtons:0];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)InfoCardViewController;
  [(ContaineeViewController *)&v29 scrollViewDidScroll:v4];
  id v5 = [(ContaineeViewController *)self cardPresentationController];
  id v6 = [v5 containeeLayout];

  id v7 = [(MUInfoCardContentProtocol *)self->_contentViewController scrollView];
  id v8 = v7;
  if (v6 == (id)1)
  {
    [v7 setClipsToBounds:0];

    id v9 = [(InfoCardViewController *)self titleHeaderView];
    objc_super v10 = v9;
    double v11 = 0.0;
LABEL_17:
    [v9 setHairLineAlpha:v11];

    goto LABEL_18;
  }
  [v7 contentInset];
  double v13 = v12;

  double v14 = [(InfoCardViewController *)self contentViewController];
  [v14 heightForContentAboveTitle];
  double v16 = v15;

  [v4 contentOffset];
  double v18 = v13 - v16 + v17;
  CGRect v19 = [(InfoCardViewController *)self titleHeaderView];
  [v19 frame];
  double Height = CGRectGetHeight(v30);

  if (v18 <= 0.0)
  {
    if (v16 > 0.0)
    {
      uint64_t v24 = [(InfoCardViewController *)self contentViewController];
      [v24 contentAboveTitleScrollPositionChanged:fabs(v18 / v16)];
    }
    v25 = [(InfoCardViewController *)self contentViewController];
    [v25 hideTitle:0];

    [(InfoCardHeaderView *)self->_titleHeaderView setHideTitleLabel:1];
    uint64_t v26 = [(InfoCardViewController *)self titleHeaderView];
    [v26 setBlurButtons:0];

    double v23 = 0.0;
  }
  else
  {
    if (self->_useSmoothTransition)
    {
      v21 = [(InfoCardViewController *)self contentViewController];
      [v21 hideTitle:1];

      [(InfoCardHeaderView *)self->_titleHeaderView setHideTitleLabel:0];
      id v22 = [(InfoCardViewController *)self titleHeaderView];
      [v22 setBlurButtons:0];
    }
    if (v18 <= 10.0)
    {
      double v23 = v18 / 10.0;
      if (!self->_useSmoothTransition) {
        [(InfoCardHeaderView *)self->_titleHeaderView setHideTitleLabel:1];
      }
    }
    else
    {
      [(InfoCardViewController *)self didScrollPastTransition];
      double v23 = 1.0;
    }
  }
  [v4 verticalScrollIndicatorInsets];
  if (Height != v27)
  {
    [v4 verticalScrollIndicatorInsets];
    [v4 setScrollIndicatorInsets:v13 + Height];
  }
  v28 = [(MUInfoCardContentProtocol *)self->_contentViewController scrollView];
  [v28 setClipsToBounds:v23 == 1.0];

  if (sub_1000BBB44(self) != 5)
  {
    id v9 = [(InfoCardViewController *)self titleHeaderView];
    objc_super v10 = v9;
    double v11 = v23;
    goto LABEL_17;
  }
LABEL_18:
}

- (MacPopoverPresentationController)macPopoverPresentationController
{
  expandablePopoverPresentationController = self->_expandablePopoverPresentationController;
  if (!expandablePopoverPresentationController)
  {
    id v4 = [[ExpandableMacPopoverPresentationController alloc] initWithContaineeViewController:self];
    id v5 = self->_expandablePopoverPresentationController;
    self->_expandablePopoverPresentationController = v4;

    expandablePopoverPresentationController = self->_expandablePopoverPresentationController;
  }

  return (MacPopoverPresentationController *)expandablePopoverPresentationController;
}

- (double)macContaineeWidth
{
  return 326.0;
}

- (MUInfoCardContentProtocol)contentViewController
{
  return self->_contentViewController;
}

- (_TtC4Maps18InfoCardHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setKeyboardProxyView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardProxyView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_currentHeaderConstraints, 0);

  objc_storeStrong((id *)&self->_expandablePopoverPresentationController, 0);
}

@end