@interface RoutePlanningOptionsViewController
+ (BOOL)useCollectionView;
+ (Class)_dataSourceClass;
- (BOOL)shouldCollapseFirstCollectionViewSectionHeader;
- (CGSize)_calculatePreferredContentSize;
- (ModalCardHeaderView)modalHeaderView;
- (RoutePlanningDataCoordination)dataCoordinator;
- (RoutePlanningOptionsDataSource)routeOptionsDataSource;
- (RoutePlanningOptionsViewController)initWithDataCoordinator:(id)a3 automaticallySaveChanges:(BOOL)a4 completionHandler:(id)a5;
- (UIButton)applyButton;
- (UIButton)cancelButton;
- (UIStackView)stackView;
- (UIView)footerView;
- (double)heightForLayout:(unint64_t)a3;
- (id)_titleForTransportType:(int64_t)a3;
- (id)initialConstraints;
- (int)_analyticsTarget;
- (int)_analyticsTargetForTransportType:(int64_t)a3;
- (int64_t)collectionViewConfigurationSeparatorStyle;
- (int64_t)collectionViewListLayoutAppearanceStyle;
- (unint64_t)preferredPresentationStyle;
- (void)_didTapCancelButton:(id)a3;
- (void)_didTapDoneButton:(id)a3;
- (void)_presentRAP;
- (void)_updateDoneButtonIfNeeded;
- (void)_updatePreferredContentSize;
- (void)dataSourceDidRebuildSections:(id)a3;
- (void)dealloc;
- (void)handleDismissAction:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setApplyButton:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setModalHeaderView:(id)a3;
- (void)setPreferredPresentationStyle:(unint64_t)a3;
- (void)setStackView:(id)a3;
- (void)setupSubviews;
- (void)viewDidLoad;
@end

@implementation RoutePlanningOptionsViewController

+ (BOOL)useCollectionView
{
  return 1;
}

+ (Class)_dataSourceClass
{
  return (Class)objc_opt_class();
}

- (int64_t)collectionViewListLayoutAppearanceStyle
{
  return 2 * (sub_1000BBB44(self) != 5);
}

- (int64_t)collectionViewConfigurationSeparatorStyle
{
  return sub_1000BBB44(self) != 5;
}

- (BOOL)shouldCollapseFirstCollectionViewSectionHeader
{
  return 1;
}

- (void)dealloc
{
  if (self->_didStartObservingUnsavedChanges)
  {
    self->_didStartObservingUnsavedChanges = 0;
    v3 = [(RoutePlanningOptionsViewController *)self routeOptionsDataSource];
    [v3 removeObserver:self forKeyPath:@"hasUnsavedChanges" context:&unk_10160FBA8];
  }
  if (self->_didStartObservingCollectionViewBounds)
  {
    self->_didStartObservingCollectionViewBounds = 0;
    v4 = [(PreferencesValuesContaineeViewController *)self collectionView];
    [v4 removeObserver:self forKeyPath:@"bounds" context:&unk_10160FBB0];
  }
  v5.receiver = self;
  v5.super_class = (Class)RoutePlanningOptionsViewController;
  [(RoutePlanningOptionsViewController *)&v5 dealloc];
}

- (RoutePlanningOptionsViewController)initWithDataCoordinator:(id)a3 automaticallySaveChanges:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)RoutePlanningOptionsViewController;
  v10 = [(RoutePlanningOptionsViewController *)&v23 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_dataCoordinator, v8);
    v12 = (PreferenceValuesDataSource *)objc_alloc_init((Class)[(id)objc_opt_class() _dataSourceClass]);
    [(PreferenceValuesDataSource *)v12 setDelegate:v11];
    [(PreferenceValuesDataSource *)v12 setDataCoordinator:v8];
    [(PreferenceValuesDataSource *)v12 setAutomaticallySaveChanges:v6];
    if (([(PreferenceValuesDataSource *)v12 automaticallySaveChanges] & 1) == 0)
    {
      v11->_didStartObservingUnsavedChanges = 1;
      [(PreferenceValuesDataSource *)v12 addObserver:v11 forKeyPath:@"hasUnsavedChanges" options:1 context:&unk_10160FBA8];
    }
    dataSource = v11->super._dataSource;
    v11->super._dataSource = v12;
    v14 = v12;

    v15 = [(ContaineeViewController *)v11 cardPresentationController];
    [v15 setPresentedModally:1];

    v16 = [(ContaineeViewController *)v11 cardPresentationController];
    [v16 setAllowsSwipeToDismiss:0];

    v17 = [(ContaineeViewController *)v11 cardPresentationController];
    [v17 setDefaultContaineeLayout:5];

    v18 = [(ContaineeViewController *)v11 cardPresentationController];
    [v18 setTakesAvailableHeight:1];

    v19 = [(ContaineeViewController *)v11 cardPresentationController];
    [v19 setHideGrabber:1];

    id v20 = [v9 copy];
    id completionHandler = v11->_completionHandler;
    v11->_id completionHandler = v20;
  }
  return v11;
}

- (RoutePlanningOptionsDataSource)routeOptionsDataSource
{
  return (RoutePlanningOptionsDataSource *)self->super._dataSource;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)RoutePlanningOptionsViewController;
  [(PreferencesValuesContaineeViewController *)&v19 viewDidLoad];
  -[RoutePlanningOptionsViewController setPreferredContentSize:](self, "setPreferredContentSize:", 282.0, 282.0);
  objc_initWeak(&location, self);
  objc_copyWeak(&v17, &location);
  v3 = [(RoutePlanningOptionsViewController *)self routeOptionsDataSource];
  [v3 setAnalyticsTargetProvider:&v16];

  v4 = +[UIColor clearColor];
  objc_super v5 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v5 setBackgroundColor:v4];

  BOOL v6 = [(PreferencesValuesContaineeViewController *)self collectionView];
  +[RoutePlanningOptionsDataSource registerCellsInCollectionView:v6];

  self->_didStartObservingCollectionViewBounds = 1;
  v7 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v7 addObserver:self forKeyPath:@"contentSize" options:3 context:&unk_10160FBB0];

  if (sub_1000BBB44(self) == 5)
  {
    id v8 = +[UIColor clearColor];
    id v9 = [(RoutePlanningOptionsViewController *)self view];
    [v9 setBackgroundColor:v8];

    v10 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
    v11 = [v10 bottomHairline];
    [v11 setHidden:1];

    v12 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
    v13 = [v12 trailingButton];
    [v13 setHidden:1];

    [(RoutePlanningOptionsViewController *)self _updatePreferredContentSize];
  }
  else
  {
    v14 = +[UIColor systemBackgroundColor];
    v15 = [(RoutePlanningOptionsViewController *)self view];
    [v15 setBackgroundColor:v14];
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)setupSubviews
{
  v56.receiver = self;
  v56.super_class = (Class)RoutePlanningOptionsViewController;
  [(PreferencesValuesContaineeViewController *)&v56 setupSubviews];
  v3 = [(ContaineeViewController *)self contentView];
  [v3 setAccessibilityIdentifier:@"RoutePlanningOptionsContentView"];

  uint64_t v4 = sub_1000BBB44(self);
  objc_super v5 = [ModalCardHeaderView alloc];
  if (v4 == 5) {
    +[ModalCardHeaderConfiguration popoverCardHeaderConfiguration];
  }
  else {
  BOOL v6 = +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration];
  }
  v7 = [(ModalCardHeaderView *)v5 initWithConfiguration:v6];
  [(RoutePlanningOptionsViewController *)self setModalHeaderView:v7];

  id v8 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
  [v8 setAccessibilityIdentifier:@"RoutePlanningOptionsHeader"];

  id v9 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
  v11 = [v10 leadingButton];
  [v11 setHidden:1];

  v12 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
  v13 = [v12 trailingButton];
  [v13 setHidden:1];

  v14 = [(RoutePlanningOptionsViewController *)self dataCoordinator];
  v15 = -[RoutePlanningOptionsViewController _titleForTransportType:](self, "_titleForTransportType:", [v14 transportType]);
  uint64_t v16 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
  id v17 = [v16 titleLabel];
  [v17 setText:v15];

  v18 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
  objc_super v19 = [v18 bottomHairline];
  [v19 setHidden:v4 != 5];

  id v20 = [(ContaineeViewController *)self headerView];
  v21 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
  [v20 addSubview:v21];

  uint64_t v22 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
  objc_super v23 = [(ContaineeViewController *)self headerView];
  LODWORD(v24) = 1148846080;
  v25 = [v22 _maps_constraintsEqualToEdgesOfView:v23 priority:v24];
  v26 = [v25 allConstraints];
  +[NSLayoutConstraint activateConstraints:v26];

  v27 = [(RoutePlanningOptionsViewController *)self routeOptionsDataSource];
  LOBYTE(v22) = [v27 automaticallySaveChanges];

  if (v22)
  {
    if (v4 != 5)
    {
      v28 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
      v29 = [v28 trailingButton];
      [v29 setHidden:0];

      v30 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
      v31 = [v30 trailingButton];
      v32 = sub_100AEBDC4();
      [v31 setTitle:v32 forState:0];

      v33 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
      v34 = [v33 trailingButton];
      [v34 addTarget:self action:"_didTapDoneButton:" forControlEvents:64];
    }
  }
  else
  {
    if (v4 == 5)
    {
      v37 = +[UIButton buttonWithType:1];
      [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(RoutePlanningOptionsViewController *)self setCancelButton:v37];
      v38 = +[UIButton buttonWithType:1];
      [v38 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(RoutePlanningOptionsViewController *)self setApplyButton:v38];
      id v39 = objc_alloc((Class)UIStackView);
      v57[0] = v37;
      v57[1] = v38;
      v40 = +[NSArray arrayWithObjects:v57 count:2];
      id v41 = [v39 initWithArrangedSubviews:v40];

      [v41 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v41 setAxis:0];
      [v41 setSpacing:1.17549435e-38];
      [v41 setAlignment:0];
      [v41 setDistribution:1];
      [v41 setAccessibilityIdentifier:@"RoutePlanningOptionsStackView"];
      [(RoutePlanningOptionsViewController *)self setStackView:v41];
      id v42 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      [v42 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v42 setAccessibilityIdentifier:@"FooterView"];
      [v42 addSubview:v41];
      v43 = [(ContaineeViewController *)self contentView];
      [v43 addSubview:v42];

      [(RoutePlanningOptionsViewController *)self setFooterView:v42];
    }
    else
    {
      v35 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
      v36 = [v35 leadingButton];
      [(RoutePlanningOptionsViewController *)self setCancelButton:v36];

      v37 = [(RoutePlanningOptionsViewController *)self modalHeaderView];
      v38 = [v37 trailingButton];
      [(RoutePlanningOptionsViewController *)self setApplyButton:v38];
    }

    v44 = [(RoutePlanningOptionsViewController *)self cancelButton];
    v45 = +[NSBundle mainBundle];
    v46 = [v45 localizedStringForKey:@"Cancel [Route Options, Catalyst]", @"localized string not found", 0 value table];
    [v44 setTitle:v46 forState:0];

    v47 = [(RoutePlanningOptionsViewController *)self cancelButton];
    [v47 setAccessibilityIdentifier:@"CancelButton"];

    v48 = [(RoutePlanningOptionsViewController *)self cancelButton];
    [v48 setHidden:0];

    v49 = [(RoutePlanningOptionsViewController *)self cancelButton];
    [v49 addTarget:self action:"_didTapCancelButton:" forControlEvents:64];

    v50 = [(RoutePlanningOptionsViewController *)self applyButton];
    v51 = +[NSBundle mainBundle];
    v52 = [v51 localizedStringForKey:@"Apply [Route Options, Catalyst]", @"localized string not found", 0 value table];
    [v50 setTitle:v52 forState:0];

    v53 = [(RoutePlanningOptionsViewController *)self applyButton];
    [v53 setAccessibilityIdentifier:@"ApplyButton"];

    v54 = [(RoutePlanningOptionsViewController *)self applyButton];
    [v54 setHidden:0];

    v55 = [(RoutePlanningOptionsViewController *)self applyButton];
    [v55 addTarget:self action:"_didTapDoneButton:" forControlEvents:64];

    [(RoutePlanningOptionsViewController *)self _updateDoneButtonIfNeeded];
  }
}

- (id)initialConstraints
{
  if (sub_1000BBB44(self) == 5 && (GEOConfigGetBOOL() & 1) == 0)
  {
    v59 = [(PreferencesValuesContaineeViewController *)self collectionView];
    v57 = [v59 leadingAnchor];
    v58 = [(ContaineeViewController *)self contentView];
    objc_super v56 = [v58 leadingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v61[0] = v55;
    v54 = [(ContaineeViewController *)self contentView];
    v52 = [v54 trailingAnchor];
    v53 = [(PreferencesValuesContaineeViewController *)self collectionView];
    v51 = [v53 trailingAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v61[1] = v50;
    v49 = [(RoutePlanningOptionsViewController *)self footerView];
    v47 = [v49 leadingAnchor];
    v48 = [(ContaineeViewController *)self contentView];
    v46 = [v48 leadingAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v61[2] = v45;
    v44 = [(ContaineeViewController *)self contentView];
    id v42 = [v44 trailingAnchor];
    v43 = [(RoutePlanningOptionsViewController *)self footerView];
    id v41 = [v43 trailingAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v61[3] = v40;
    id v39 = [(PreferencesValuesContaineeViewController *)self collectionView];
    v37 = [v39 topAnchor];
    v38 = [(ContaineeViewController *)self contentView];
    v36 = [v38 topAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v61[4] = v35;
    v34 = [(RoutePlanningOptionsViewController *)self footerView];
    v32 = [v34 topAnchor];
    v33 = [(PreferencesValuesContaineeViewController *)self collectionView];
    v31 = [v33 bottomAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v61[5] = v30;
    v29 = [(ContaineeViewController *)self contentView];
    v27 = [v29 bottomAnchor];
    v28 = [(RoutePlanningOptionsViewController *)self footerView];
    v26 = [v28 bottomAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v61[6] = v25;
    double v24 = [(RoutePlanningOptionsViewController *)self stackView];
    uint64_t v22 = [v24 leadingAnchor];
    objc_super v23 = [(RoutePlanningOptionsViewController *)self footerView];
    v21 = [v23 leadingAnchor];
    id v20 = [v22 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v21 multiplier:1.0];
    v61[7] = v20;
    objc_super v19 = [(RoutePlanningOptionsViewController *)self footerView];
    id v17 = [v19 trailingAnchor];
    v18 = [(RoutePlanningOptionsViewController *)self stackView];
    uint64_t v16 = [v18 trailingAnchor];
    v15 = [v17 constraintEqualToSystemSpacingAfterAnchor:v16 multiplier:1.0];
    v61[8] = v15;
    v14 = [(RoutePlanningOptionsViewController *)self stackView];
    uint64_t v4 = [v14 topAnchor];
    objc_super v5 = [(RoutePlanningOptionsViewController *)self footerView];
    BOOL v6 = [v5 topAnchor];
    v7 = [v4 constraintEqualToSystemSpacingBelowAnchor:v6 multiplier:1.0];
    v61[9] = v7;
    id v8 = [(RoutePlanningOptionsViewController *)self footerView];
    id v9 = [v8 bottomAnchor];
    v10 = [(RoutePlanningOptionsViewController *)self stackView];
    v11 = [v10 bottomAnchor];
    v12 = [v9 constraintEqualToSystemSpacingBelowAnchor:v11 multiplier:1.0];
    v61[10] = v12;
    v3 = +[NSArray arrayWithObjects:v61 count:11];
  }
  else
  {
    v60.receiver = self;
    v60.super_class = (Class)RoutePlanningOptionsViewController;
    v3 = [(PreferencesValuesContaineeViewController *)&v60 initialConstraints];
  }

  return v3;
}

- (double)heightForLayout:(unint64_t)a3
{
  if (sub_1000BBB44(self) == 5)
  {
    -[ContaineeViewController heightForLayout:](&v12, "heightForLayout:", a3, v11.receiver, v11.super_class, self, RoutePlanningOptionsViewController);
  }
  else
  {
    BOOL v6 = [(ContaineeViewController *)self cardPresentationController];
    unint64_t v7 = (unint64_t)[v6 containerStyle];
    if (v7 <= 7 && ((1 << v7) & 0xE3) != 0)
    {

      double result = -1.0;
      if (a3 == 5) {
        -[ContaineeViewController heightForLayout:](&v11, "heightForLayout:", 2, self, RoutePlanningOptionsViewController, v12.receiver, v12.super_class);
      }
    }
    else
    {

      id v8 = [(ContaineeViewController *)self cardPresentationController];
      [v8 availableHeight];
      double v10 = v9;

      return v10;
    }
  }
  return result;
}

- (void)_updatePreferredContentSize
{
  if ([(RoutePlanningOptionsViewController *)self isViewLoaded]
    && sub_1000BBB44(self) == 5)
  {
    self->_inUpdatePreferredContentSize = 1;
    [(RoutePlanningOptionsViewController *)self _calculatePreferredContentSize];
    double v4 = v3;
    double v6 = v5;
    [(RoutePlanningOptionsViewController *)self preferredContentSize];
    if (v4 != v8 || v6 != v7) {
      -[RoutePlanningOptionsViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6);
    }
    self->_inUpdatePreferredContentSize = 0;
  }
}

- (CGSize)_calculatePreferredContentSize
{
  unsigned int v3 = [(RoutePlanningOptionsViewController *)self isViewLoaded];
  double v4 = 282.0;
  if (v3)
  {
    uint64_t v5 = sub_1000BBB44(self);
    double v4 = 282.0;
    if (v5 == 5)
    {
      double v6 = [(RoutePlanningOptionsViewController *)self view];
      [v6 layoutIfNeeded];

      double v7 = [(ContaineeViewController *)self headerView];
      double height = UILayoutFittingCompressedSize.height;
      [v7 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width height];
      double v10 = v9;

      objc_super v11 = [(PreferencesValuesContaineeViewController *)self collectionView];
      objc_super v12 = [v11 collectionViewLayout];
      [v12 collectionViewContentSize];
      double v14 = v13;

      v15 = [(RoutePlanningOptionsViewController *)self footerView];
      if (v15)
      {
        uint64_t v16 = [(RoutePlanningOptionsViewController *)self footerView];
        [v16 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width height];
        double v18 = v17;
      }
      else
      {
        double v18 = 0.0;
      }

      double v4 = v10 + v14 + v18;
    }
  }
  double v19 = 282.0;
  result.double height = v4;
  result.width = v19;
  return result;
}

- (id)_titleForTransportType:(int64_t)a3
{
  if (sub_1000BBB44(self) == 5)
  {
    double v4 = +[NSBundle mainBundle];
    uint64_t v5 = v4;
    CFStringRef v6 = @"Route Options [Card Header Title]";
LABEL_8:
    double v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

    goto LABEL_9;
  }
  if ((unint64_t)(a3 - 1) < 2) {
    goto LABEL_6;
  }
  if (a3 == 3)
  {
    double v4 = +[NSBundle mainBundle];
    uint64_t v5 = v4;
    CFStringRef v6 = @"Prefer [Card Header Title]";
    goto LABEL_8;
  }
  if (a3 == 5)
  {
LABEL_6:
    double v4 = +[NSBundle mainBundle];
    uint64_t v5 = v4;
    CFStringRef v6 = @"Avoid Options [Card Header Title]";
    goto LABEL_8;
  }
  double v9 = sub_1005762E4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315650;
    double v13 = "-[RoutePlanningOptionsViewController _titleForTransportType:]";
    __int16 v14 = 2080;
    v15 = "RoutePlanningOptionsViewController.m";
    __int16 v16 = 1024;
    int v17 = 372;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v12, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    double v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_super v11 = +[NSThread callStackSymbols];
      int v12 = 138412290;
      double v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
    }
  }
  double v7 = 0;
LABEL_9:

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = v12;
  if (a6 == &unk_10160FBA8)
  {
    [(RoutePlanningOptionsViewController *)self _updateDoneButtonIfNeeded];
  }
  else if (a6 == &unk_10160FBB0)
  {
    __int16 v14 = [v12 objectForKeyedSubscript:NSKeyValueChangeOldKey];
    v15 = [v13 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    unsigned __int8 v16 = [v14 isEqual:v15];

    if ((v16 & 1) == 0)
    {
      BOOL inUpdatePreferredContentSize = self->_inUpdatePreferredContentSize;
      double v18 = sub_1005768D4();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
      if (inUpdatePreferredContentSize)
      {
        if (v19)
        {
          id v20 = [v13 objectForKeyedSubscript:NSKeyValueChangeOldKey];
          v21 = [v13 objectForKeyedSubscript:NSKeyValueChangeNewKey];
          *(_DWORD *)buf = 138412546;
          v26 = v20;
          __int16 v27 = 2112;
          v28 = v21;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[Options] Ignoring collection size change from %@ to %@", buf, 0x16u);
        }
      }
      else
      {
        if (v19)
        {
          uint64_t v22 = [v13 objectForKeyedSubscript:NSKeyValueChangeOldKey];
          objc_super v23 = [v13 objectForKeyedSubscript:NSKeyValueChangeNewKey];
          *(_DWORD *)buf = 138412546;
          v26 = v22;
          __int16 v27 = 2112;
          v28 = v23;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[Options] collection size did change from %@ to %@", buf, 0x16u);
        }
        [(RoutePlanningOptionsViewController *)self _updatePreferredContentSize];
      }
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)RoutePlanningOptionsViewController;
    [(RoutePlanningOptionsViewController *)&v24 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_updateDoneButtonIfNeeded
{
  unsigned int v3 = [(RoutePlanningOptionsViewController *)self applyButton];

  if (v3)
  {
    uint64_t v4 = sub_1000BBB44(self);
    id v7 = [(RoutePlanningOptionsViewController *)self routeOptionsDataSource];
    id v5 = [v7 hasUnsavedChanges];
    CFStringRef v6 = [(RoutePlanningOptionsViewController *)self applyButton];
    if (v4 == 5) {
      [v6 setHidden:v5 ^ 1];
    }
    else {
      [v6 setEnabled:v5];
    }
  }
}

- (void)handleDismissAction:(id)a3
{
}

- (void)_didTapCancelButton:(id)a3
{
  id v9 = a3;
  uint64_t v4 = +[MKMapService sharedService];
  id v5 = [(RoutePlanningOptionsViewController *)self routeOptionsDataSource];
  [v4 captureUserAction:18 onTarget:[self _analyticsTargetForTransportType:[v5 transportType]] eventValue:0];

  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    id v7 = (void (**)(id, RoutePlanningOptionsViewController *, id))objc_retainBlock(completionHandler);
    id v8 = self->_completionHandler;
    self->_id completionHandler = 0;

    v7[2](v7, self, v9);
  }
}

- (void)_didTapDoneButton:(id)a3
{
  id v10 = a3;
  uint64_t v4 = +[MKMapService sharedService];
  id v5 = [(RoutePlanningOptionsViewController *)self routeOptionsDataSource];
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 17, -[RoutePlanningOptionsViewController _analyticsTargetForTransportType:](self, "_analyticsTargetForTransportType:", objc_msgSend(v5, "transportType")), 0);

  CFStringRef v6 = [(RoutePlanningOptionsViewController *)self routeOptionsDataSource];
  [v6 _updateCoordinatorWithPreferences];

  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    id v8 = (void (**)(id, RoutePlanningOptionsViewController *, id))objc_retainBlock(completionHandler);
    id v9 = self->_completionHandler;
    self->_id completionHandler = 0;

    v8[2](v8, self, v10);
  }
}

- (void)dataSourceDidRebuildSections:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningOptionsViewController;
  [(PreferencesValuesContaineeViewController *)&v4 dataSourceDidRebuildSections:a3];
  [(RoutePlanningOptionsViewController *)self _updatePreferredContentSize];
}

- (void)_presentRAP
{
  unsigned int v3 = [(RoutePlanningOptionsViewController *)self routeOptionsDataSource];
  unint64_t v4 = (unint64_t)[v3 transportType];

  if (v4 <= 5)
  {
    if (((1 << v4) & 0x2E) != 0)
    {
      id v5 = +[MKMapService sharedService];
      [v5 captureUserAction:5013 onTarget:[self _analyticsTarget] eventValue:0];

      CFStringRef v6 = [(RoutePlanningOptionsViewController *)self _maps_mapsSceneDelegate];
      id v7 = [v6 rapPresenter];

      if (sub_1000BBB44(self) == 5)
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_1008373C0;
        v10[3] = &unk_1012E5D58;
        id v7 = v7;
        id v11 = v7;
        id v12 = self;
        [(RoutePlanningOptionsViewController *)self dismissViewControllerAnimated:1 completion:v10];
      }
      else
      {
        [v7 presentReportAProblemForRouteFromEntryPoint:[(RoutePlanningOptionsViewController *)self _analyticsTarget]];
      }
LABEL_11:

      return;
    }
    id v8 = sub_1005762E4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v14 = "-[RoutePlanningOptionsViewController _presentRAP]";
      __int16 v15 = 2080;
      unsigned __int8 v16 = "RoutePlanningOptionsViewController.m";
      __int16 v17 = 1024;
      int v18 = 467;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      id v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v9 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      goto LABEL_11;
    }
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningOptionsViewController;
  [(ContaineeViewController *)&v9 scrollViewWillEndDragging:a3 withVelocity:a5 targetContentOffset:a4.x];
  if (y <= 0.0) {
    uint64_t v7 = 7;
  }
  else {
    uint64_t v7 = 8;
  }
  id v8 = +[MKMapService sharedService];
  [v8 captureUserAction:v7 onTarget:[self _analyticsTarget] eventValue:0];
}

- (int)_analyticsTargetForTransportType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 0;
  }
  else {
    return dword_100F72590[a3 - 1];
  }
}

- (int)_analyticsTarget
{
  v2 = self;
  unsigned int v3 = [(RoutePlanningOptionsViewController *)self routeOptionsDataSource];
  LODWORD(v2) = -[RoutePlanningOptionsViewController _analyticsTargetForTransportType:](v2, "_analyticsTargetForTransportType:", [v3 transportType]);

  return (int)v2;
}

- (unint64_t)preferredPresentationStyle
{
  return self->_preferredPresentationStyle;
}

- (void)setPreferredPresentationStyle:(unint64_t)a3
{
  self->_preferredPresentationStyle = a3;
}

- (RoutePlanningDataCoordination)dataCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCoordinator);

  return (RoutePlanningDataCoordination *)WeakRetained;
}

- (ModalCardHeaderView)modalHeaderView
{
  return self->_modalHeaderView;
}

- (void)setModalHeaderView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (UIButton)cancelButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cancelButton);

  return (UIButton *)WeakRetained;
}

- (void)setCancelButton:(id)a3
{
}

- (UIButton)applyButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applyButton);

  return (UIButton *)WeakRetained;
}

- (void)setApplyButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applyButton);
  objc_destroyWeak((id *)&self->_cancelButton);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);
  objc_destroyWeak((id *)&self->_dataCoordinator);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end