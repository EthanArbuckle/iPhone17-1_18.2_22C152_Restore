@interface SimpleContaineeViewController
- (BOOL)headerNeeded;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CGSize)_calculatePreferredContentSize;
- (ContainerHeaderView)titleHeaderView;
- (MapsThemeTableView)actionsTableView;
- (NSArray)actions;
- (UIStackView)topActionsContainerView;
- (UIView)metadataContainerView;
- (double)preferredWidth;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_colorConfigurationForAction:(id)a3;
- (id)_primaryColorForAction:(id)a3;
- (id)actionForIndexPath:(id)a3;
- (id)configurationForAction:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_actionsSectionIndex;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableViewStyle;
- (void)_updatePreferredContentSize;
- (void)adjustScrollForKeyboardWithRect:(CGRect)a3;
- (void)dealloc;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerActionsTableViewCellClasses;
- (void)scrollViewDidScroll:(id)a3;
- (void)setActions:(id)a3;
- (void)setupSubviews;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateTheme;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SimpleContaineeViewController

- (void)dealloc
{
  viewsToObserveBoundsChanges = self->_viewsToObserveBoundsChanges;
  if (viewsToObserveBoundsChanges)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v4 = viewsToObserveBoundsChanges;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) removeObserver:self forKeyPath:@"bounds" context:&unk_10160FD40];
        }
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [(MapsThemeTableView *)self->_actionsTableView removeObserver:self forKeyPath:@"contentSize" context:&unk_10160FD48];
  }
  v9.receiver = self;
  v9.super_class = (Class)SimpleContaineeViewController;
  [(SimpleContaineeViewController *)&v9 dealloc];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)SimpleContaineeViewController;
  [(ContaineeViewController *)&v15 viewDidLoad];
  [(SimpleContaineeViewController *)self setupSubviews];
  if (sub_1000BBB44(self) == 5)
  {
    [(UIScrollView *)self->_contentScrollView setScrollEnabled:0];
    [(UIScrollView *)self->_contentScrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)self->_contentScrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)self->_contentScrollView setAlwaysBounceVertical:0];
    actionsTableView = self->_actionsTableView;
    v17[0] = self->_contentScrollView;
    v17[1] = actionsTableView;
    v4 = +[NSArray arrayWithObjects:v17 count:2];
    viewsToObserveBoundsChanges = self->_viewsToObserveBoundsChanges;
    self->_viewsToObserveBoundsChanges = v4;

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_viewsToObserveBoundsChanges;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) addObserver:self forKeyPath:@"bounds" options:1 context:(void)v11];
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }

    [(SimpleContaineeViewController *)self _updatePreferredContentSize];
    [(MapsThemeTableView *)self->_actionsTableView setClipsToBounds:0];
  }
  else
  {
    [(MapsThemeTableView *)self->_actionsTableView addObserver:self forKeyPath:@"contentSize" options:1 context:&unk_10160FD48];
  }
}

- (void)setupSubviews
{
  if ([(SimpleContaineeViewController *)self headerNeeded])
  {
    v3 = objc_alloc_init(ContainerHeaderView);
    titleHeaderView = self->_titleHeaderView;
    self->_titleHeaderView = v3;

    [(ContainerHeaderView *)self->_titleHeaderView setDelegate:self];
    [(ContainerHeaderView *)self->_titleHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ContainerHeaderView *)self->_titleHeaderView setHairLineAlpha:0.0];
    id v5 = [(ContaineeViewController *)self headerView];
    [v5 addSubview:self->_titleHeaderView];

    v118 = [(ContainerHeaderView *)self->_titleHeaderView leadingAnchor];
    v124 = [(ContaineeViewController *)self headerView];
    v112 = [v124 leadingAnchor];
    v107 = [v118 constraintEqualToAnchor:v112];
    v132[0] = v107;
    v97 = [(ContainerHeaderView *)self->_titleHeaderView trailingAnchor];
    v102 = [(ContaineeViewController *)self headerView];
    v94 = [v102 trailingAnchor];
    v90 = [v97 constraintEqualToAnchor:v94];
    v132[1] = v90;
    id v6 = [(ContainerHeaderView *)self->_titleHeaderView topAnchor];
    id v7 = [(ContaineeViewController *)self headerView];
    id v8 = [v7 topAnchor];
    uint64_t v9 = [v6 constraintEqualToAnchor:v8];
    v132[2] = v9;
    long long v10 = [(ContainerHeaderView *)self->_titleHeaderView bottomAnchor];
    long long v11 = [(ContaineeViewController *)self headerView];
    long long v12 = [v11 bottomAnchor];
    long long v13 = [v10 constraintEqualToAnchor:v12];
    v132[3] = v13;
    long long v14 = +[NSArray arrayWithObjects:v132 count:4];
    +[NSLayoutConstraint activateConstraints:v14];
  }
  objc_super v15 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  contentScrollView = self->_contentScrollView;
  self->_contentScrollView = v15;

  [(UIScrollView *)self->_contentScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_contentScrollView setDelegate:self];
  [(UIScrollView *)self->_contentScrollView setAlwaysBounceVertical:1];
  [(UIScrollView *)self->_contentScrollView setPreservesSuperviewLayoutMargins:1];
  v17 = [(ContaineeViewController *)self contentView];
  [v17 addSubview:self->_contentScrollView];

  v119 = [(UIScrollView *)self->_contentScrollView topAnchor];
  v125 = [(ContaineeViewController *)self contentView];
  v113 = [v125 topAnchor];
  v108 = [v119 constraintEqualToAnchor:v113];
  v131[0] = v108;
  v98 = [(UIScrollView *)self->_contentScrollView bottomAnchor];
  v103 = [(ContaineeViewController *)self contentView];
  v95 = [v103 bottomAnchor];
  v91 = [v98 constraintEqualToAnchor:v95];
  v131[1] = v91;
  v89 = [(UIScrollView *)self->_contentScrollView leadingAnchor];
  v18 = [(ContaineeViewController *)self contentView];
  v19 = [v18 leadingAnchor];
  v20 = [v89 constraintEqualToAnchor:v19];
  v131[2] = v20;
  v21 = [(UIScrollView *)self->_contentScrollView trailingAnchor];
  v22 = [(ContaineeViewController *)self contentView];
  v23 = [v22 trailingAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  v131[3] = v24;
  v25 = +[NSArray arrayWithObjects:v131 count:4];
  +[NSLayoutConstraint activateConstraints:v25];

  id v26 = objc_alloc_init((Class)UIView);
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v26 setPreservesSuperviewLayoutMargins:1];
  [(UIScrollView *)self->_contentScrollView addSubview:v26];
  v120 = [v26 topAnchor];
  v114 = [(UIScrollView *)self->_contentScrollView topAnchor];
  v109 = [v120 constraintEqualToAnchor:v114];
  v130[0] = v109;
  v104 = [v26 bottomAnchor];
  v99 = [(UIScrollView *)self->_contentScrollView bottomAnchor];
  v96 = [v104 constraintEqualToAnchor:v99];
  v130[1] = v96;
  v93 = [v26 leadingAnchor];
  v92 = [(UIScrollView *)self->_contentScrollView leadingAnchor];
  v88 = [v93 constraintEqualToAnchor:v92];
  v130[2] = v88;
  v87 = [v26 trailingAnchor];
  v86 = [(UIScrollView *)self->_contentScrollView trailingAnchor];
  v85 = [v87 constraintEqualToAnchor:v86];
  v130[3] = v85;
  v84 = [v26 leadingAnchor];
  v27 = [(ContaineeViewController *)self contentView];
  v28 = [v27 leadingAnchor];
  v29 = [v84 constraintEqualToAnchor:v28];
  v130[4] = v29;
  v30 = [v26 trailingAnchor];
  v31 = [(ContaineeViewController *)self contentView];
  v32 = [v31 trailingAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  v130[5] = v33;
  v34 = +[NSArray arrayWithObjects:v130 count:6];
  +[NSLayoutConstraint activateConstraints:v34];

  v35 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  topActionsContainerView = self->_topActionsContainerView;
  self->_topActionsContainerView = v35;

  [(UIStackView *)self->_topActionsContainerView setDistribution:1];
  [(UIStackView *)self->_topActionsContainerView setAlignment:0];
  [(UIStackView *)self->_topActionsContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v26 addSubview:self->_topActionsContainerView];
  v37 = [(SimpleContaineeViewController *)self traitCollection];
  if ([v37 userInterfaceIdiom] == (id)5) {
    double v38 = 0.0;
  }
  else {
    double v38 = 10.0;
  }

  v121 = [(UIStackView *)self->_topActionsContainerView leadingAnchor];
  v115 = [v26 leadingAnchor];
  v39 = [v121 constraintEqualToAnchor:v115 constant:16.0];
  v129[0] = v39;
  v40 = [(UIStackView *)self->_topActionsContainerView trailingAnchor];
  v126 = v26;
  v41 = [v26 trailingAnchor];
  v42 = [v40 constraintEqualToAnchor:v41 constant:-16.0];
  v129[1] = v42;
  v43 = [(UIStackView *)self->_topActionsContainerView topAnchor];
  v44 = [v26 topAnchor];
  v45 = [v43 constraintEqualToAnchor:v44 constant:v38];
  v129[2] = v45;
  v46 = +[NSArray arrayWithObjects:v129 count:3];
  +[NSLayoutConstraint activateConstraints:v46];

  id v47 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v51 = [v47 initWithFrame:CGRectZero.origin.x, y, width, height];
  metadataContainerView = self->_metadataContainerView;
  self->_metadataContainerView = v51;

  [(UIView *)self->_metadataContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v53) = 1148846080;
  [(UIView *)self->_metadataContainerView setContentHuggingPriority:1 forAxis:v53];
  LODWORD(v54) = 1148846080;
  [(UIView *)self->_metadataContainerView setContentCompressionResistancePriority:1 forAxis:v54];
  [v126 addSubview:self->_metadataContainerView];
  v122 = [(UIView *)self->_metadataContainerView leadingAnchor];
  v116 = [v126 leadingAnchor];
  v110 = [v122 constraintEqualToAnchor:v116];
  v128[0] = v110;
  v105 = [(UIView *)self->_metadataContainerView trailingAnchor];
  v100 = [v126 trailingAnchor];
  v55 = [v105 constraintEqualToAnchor:v100];
  v128[1] = v55;
  v56 = [(UIView *)self->_metadataContainerView topAnchor];
  v57 = [(UIStackView *)self->_topActionsContainerView bottomAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  v128[2] = v58;
  v59 = [(UIView *)self->_metadataContainerView bottomAnchor];
  v60 = [v126 bottomAnchor];
  v61 = [v59 constraintLessThanOrEqualToAnchor:v60];
  v128[3] = v61;
  v62 = +[NSArray arrayWithObjects:v128 count:4];
  +[NSLayoutConstraint activateConstraints:v62];

  v63 = -[MapsThemeTableView initWithFrame:style:]([MapsThemeTableView alloc], "initWithFrame:style:", [(SimpleContaineeViewController *)self tableViewStyle], CGRectZero.origin.x, y, width, height);
  actionsTableView = self->_actionsTableView;
  self->_actionsTableView = v63;

  [(MapsThemeTableView *)self->_actionsTableView setAccessibilityIdentifier:@"ActionsTableView"];
  [(MapsThemeTableView *)self->_actionsTableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SimpleContaineeViewController *)self registerActionsTableViewCellClasses];
  if ([(MapsThemeTableView *)self->_actionsTableView style]) {
    [(MapsThemeTableView *)self->_actionsTableView _setTopPadding:0.0];
  }
  [(MapsThemeTableView *)self->_actionsTableView setDelegate:self];
  [(MapsThemeTableView *)self->_actionsTableView setDataSource:self];
  v65 = +[UIColor clearColor];
  [(MapsThemeTableView *)self->_actionsTableView setBackgroundColor:v65];

  [(MapsThemeTableView *)self->_actionsTableView setScrollEnabled:0];
  [(MapsThemeTableView *)self->_actionsTableView setPreservesSuperviewLayoutMargins:1];
  if (sub_1000BBB44(self) == 5)
  {
    [(MapsThemeTableView *)self->_actionsTableView setSeparatorStyle:0];
    -[MapsThemeTableView setSeparatorInset:](self->_actionsTableView, "setSeparatorInset:", 0.0, 16.0, 0.0, 16.0);
  }
  double v66 = 0.0;
  -[MapsThemeTableView setDirectionalLayoutMargins:](self->_actionsTableView, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
  [(MapsThemeTableView *)self->_actionsTableView setCellLayoutMarginsFollowReadableWidth:0];
  [(MapsThemeTableView *)self->_actionsTableView setPreservesSuperviewLayoutMargins:0];
  [v126 addSubview:self->_actionsTableView];
  double v67 = 0.0;
  if (![(SimpleContaineeViewController *)self tableViewStyle])
  {
    v68 = [(SimpleContaineeViewController *)self traitCollection];
    if ([v68 userInterfaceIdiom] == (id)5) {
      double v67 = 17.0;
    }
    else {
      double v67 = 10.0;
    }
  }
  v69 = [(SimpleContaineeViewController *)self traitCollection];
  if ([v69 userInterfaceIdiom] == (id)5) {
    double v66 = 17.0;
  }

  v123 = [(MapsThemeTableView *)self->_actionsTableView topAnchor];
  v117 = [(UIView *)self->_metadataContainerView bottomAnchor];
  v111 = [v123 constraintEqualToAnchor:v117 constant:v67];
  v127[0] = v111;
  v106 = [(MapsThemeTableView *)self->_actionsTableView leadingAnchor];
  v101 = [v126 leadingAnchor];
  v70 = [v106 constraintEqualToAnchor:v101];
  v127[1] = v70;
  v71 = [(MapsThemeTableView *)self->_actionsTableView trailingAnchor];
  v72 = [v126 trailingAnchor];
  v73 = [v71 constraintLessThanOrEqualToAnchor:v72];
  v127[2] = v73;
  v74 = [(MapsThemeTableView *)self->_actionsTableView bottomAnchor];
  v75 = [v126 bottomAnchor];
  v76 = [v74 constraintLessThanOrEqualToAnchor:v75 constant:-v66];
  v127[3] = v76;
  v77 = +[NSArray arrayWithObjects:v127 count:4];
  +[NSLayoutConstraint activateConstraints:v77];

  v78 = [(MapsThemeTableView *)self->_actionsTableView heightAnchor];
  v79 = [v78 constraintEqualToConstant:0.0];
  actionsTableHeightConstraint = self->_actionsTableHeightConstraint;
  self->_actionsTableHeightConstraint = v79;

  v81 = [(MapsThemeTableView *)self->_actionsTableView widthAnchor];
  [(SimpleContaineeViewController *)self preferredWidth];
  [v81 constraintEqualToConstant:];
  v82 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  actionsTableWidthConstraint = self->_actionsTableWidthConstraint;
  self->_actionsTableWidthConstraint = v82;

  [(NSLayoutConstraint *)self->_actionsTableHeightConstraint setActive:1];
  [(NSLayoutConstraint *)self->_actionsTableWidthConstraint setActive:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SimpleContaineeViewController;
  [(ContaineeViewController *)&v6 viewWillAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIKeyboardWillShowNotification object:0];

  objc_super v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:UIKeyboardWillHideNotification object:0];

  v7.receiver = self;
  v7.super_class = (Class)SimpleContaineeViewController;
  [(ContaineeViewController *)&v7 viewWillDisappear:v3];
}

- (void)registerActionsTableViewCellClasses
{
  actionsTableView = self->_actionsTableView;
  uint64_t v3 = objc_opt_class();

  [(MapsThemeTableView *)actionsTableView registerClass:v3 forCellReuseIdentifier:@"ActionCell"];
}

- (void)_updatePreferredContentSize
{
  if ([(SimpleContaineeViewController *)self isViewLoaded] && sub_1000BBB44(self) == 5)
  {
    [(SimpleContaineeViewController *)self _calculatePreferredContentSize];
    double v4 = v3;
    double v6 = v5;
    double v7 = fabs(v5);
    if (fabs(v3) > 2.22044605e-16 && v7 > 2.22044605e-16)
    {
      [(SimpleContaineeViewController *)self preferredContentSize];
      if (v4 != v10 || v6 != v9)
      {
        -[SimpleContaineeViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6);
      }
    }
  }
}

- (CGSize)_calculatePreferredContentSize
{
  if ([(SimpleContaineeViewController *)self isViewLoaded] && sub_1000BBB44(self) == 5)
  {
    double v3 = [(SimpleContaineeViewController *)self view];
    [v3 layoutIfNeeded];

    double v4 = [(ContaineeViewController *)self headerView];
    [(SimpleContaineeViewController *)self preferredWidth];
    [v4 systemLayoutSizeFittingSize:];
    double v6 = v5;

    [(UIScrollView *)self->_contentScrollView contentSize];
    double v8 = v6 + v7;
    [(SimpleContaineeViewController *)self preferredWidth];
    double v10 = v9;
  }
  else
  {
    [(SimpleContaineeViewController *)self preferredWidth];
    double v10 = v11;
    [(SimpleContaineeViewController *)self preferredWidth];
    double v8 = v12;
  }
  double v13 = v10;
  double v14 = v8;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (double)preferredWidth
{
  if (sub_1000BBB44(self) == 5) {
    return 282.0;
  }
  double v4 = [(ContaineeViewController *)self contentView];
  [v4 bounds];
  double v3 = v5;

  return v3;
}

- (BOOL)headerNeeded
{
  return 1;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &unk_10160FD40)
  {
    [(SimpleContaineeViewController *)self _updatePreferredContentSize];
  }
  else if (a6 == &unk_10160FD48)
  {
    double v13 = [(SimpleContaineeViewController *)self view];
    [v13 setNeedsLayout];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SimpleContaineeViewController;
    [(SimpleContaineeViewController *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)updateTheme
{
  v26.receiver = self;
  v26.super_class = (Class)SimpleContaineeViewController;
  [(ContaineeViewController *)&v26 viewDidLayoutSubviews];
  double v3 = [(SimpleContaineeViewController *)self theme];
  double v4 = [v3 hairlineColor];
  [(MapsThemeTableView *)self->_actionsTableView setSeparatorColor:v4];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(MapsThemeTableView *)self->_actionsTableView indexPathsForVisibleRows];
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      double v8 = 0;
      id v20 = v6;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v8);
        id v10 = [v9 section];
        if (v10 == (id)[(SimpleContaineeViewController *)self _actionsSectionIndex])
        {
          id v11 = [(SimpleContaineeViewController *)self actionForIndexPath:v9];
          id v12 = [(MapsThemeTableView *)self->_actionsTableView cellForRowAtIndexPath:v9];
          [v12 contentConfiguration];
          v14 = uint64_t v13 = v7;
          objc_super v15 = [v14 imageProperties];
          v16 = [v15 preferredSymbolConfiguration];

          v17 = [(SimpleContaineeViewController *)self _colorConfigurationForAction:v11];
          v18 = [v16 configurationByApplyingConfiguration:v17];
          v19 = [v14 imageProperties];
          [v19 setPreferredSymbolConfiguration:v18];

          [v12 setContentConfiguration:v14];
          uint64_t v7 = v13;
          id v6 = v20;
        }
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)SimpleContaineeViewController;
  [(ContaineeViewController *)&v8 viewDidLayoutSubviews];
  [(MapsThemeTableView *)self->_actionsTableView contentSize];
  [(NSLayoutConstraint *)self->_actionsTableHeightConstraint setConstant:v3];
  [(SimpleContaineeViewController *)self preferredWidth];
  -[NSLayoutConstraint setConstant:](self->_actionsTableWidthConstraint, "setConstant:");
  [(MapsThemeTableView *)self->_actionsTableView layoutIfNeeded];
  [(MapsThemeTableView *)self->_actionsTableView contentSize];
  [(NSLayoutConstraint *)self->_actionsTableHeightConstraint setConstant:v4];
  id v5 = [(SimpleContaineeViewController *)self view];
  [v5 bounds];
  BOOL v7 = v6 <= 320.0;

  [(UIStackView *)self->_topActionsContainerView setAxis:v7];
  [(UIStackView *)self->_topActionsContainerView setSpacing:10.0];
}

- (void)setActions:(id)a3
{
  id v5 = (NSArray *)a3;
  if (self->_actions != v5)
  {
    objc_storeStrong((id *)&self->_actions, a3);
    if ([(NSArray *)v5 count])
    {
      id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](v5, "count")];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      BOOL v7 = v5;
      id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            uint64_t v13 = [v12 footer];
            id v14 = [v13 length];

            if (v14)
            {
              objc_super v15 = [v12 footer];
              [v6 addObject:v15];
            }
          }
          id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v9);
      }

      id v16 = [v6 count];
      if (v16)
      {
        v17 = [v6 componentsJoinedByString:@"\n\n"];
      }
      else
      {
        v17 = 0;
      }
      objc_storeStrong((id *)&self->_footerText, v17);
      if (v16) {
    }
      }
    else
    {
      footerText = self->_footerText;
      self->_footerText = 0;
    }
    v19 = [(SimpleContaineeViewController *)self actionsTableView];
    [v19 reloadData];
  }
}

- (void)keyboardWillShow:(id)a3
{
  double v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  contentScrollView = self->_contentScrollView;
  objc_super v15 = +[UIScreen mainScreen];
  id v16 = [v15 coordinateSpace];
  -[UIScrollView convertRect:fromCoordinateSpace:](contentScrollView, "convertRect:fromCoordinateSpace:", v16, v7, v9, v11, v13);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  -[SimpleContaineeViewController adjustScrollForKeyboardWithRect:](self, "adjustScrollForKeyboardWithRect:", v18, v20, v22, v24);
}

- (void)keyboardWillHide:(id)a3
{
}

- (void)adjustScrollForKeyboardWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UIScrollView *)self->_contentScrollView bounds];
  double MaxY = CGRectGetMaxY(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v13);
  contentScrollView = self->_contentScrollView;

  -[UIScrollView setContentInset:](contentScrollView, "setContentInset:", 0.0, 0.0, MaxY - MinY + 15.0, 0.0);
}

- (id)actionForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  if (v5 == (id)[(SimpleContaineeViewController *)self _actionsSectionIndex]
    && (id v6 = [v4 row],
        [(SimpleContaineeViewController *)self actions],
        double v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 count],
        v7,
        (uint64_t)v6 < (uint64_t)v8))
  {
    double v9 = [(SimpleContaineeViewController *)self actions];
    double v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(SimpleContaineeViewController *)self actions];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SimpleContaineeViewController *)self actionForIndexPath:v6];
  double v9 = [v7 dequeueReusableCellWithIdentifier:@"ActionCell" forIndexPath:v6];

  if (v8)
  {
    double v10 = [(SimpleContaineeViewController *)self configurationForAction:v8];
    [v9 setContentConfiguration:v10];

    double v11 = [v8 accessibilityIdentifier];
    [v9 setAccessibilityIdentifier:v11];

    CGRect v12 = [v8 labelAccessibilityIdentifier];
    CGRect v13 = [v9 textLabel];
    [v13 setAccessibilityIdentifier:v12];
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  if (![a3 style])
  {
    id v6 = +[UIColor clearColor];
    [v7 setBackgroundColor:v6];
  }
}

- (id)_primaryColorForAction:(id)a3
{
  if ([a3 glyphStyle])
  {
    id v5 = +[UIColor systemRedColor];
  }
  else
  {
    id v4 = [(SimpleContaineeViewController *)self theme];
    id v5 = [v4 keyColor];
  }

  return v5;
}

- (id)_colorConfigurationForAction:(id)a3
{
  id v4 = a3;
  id v5 = [(SimpleContaineeViewController *)self _primaryColorForAction:v4];
  unsigned __int8 v6 = [v4 glyphStyle];

  if ((v6 & 2) != 0)
  {
    v11[0] = v5;
    id v8 = +[UIColor secondarySystemFillColor];
    v11[1] = v8;
    double v9 = +[NSArray arrayWithObjects:v11 count:2];
    id v7 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v9];
  }
  else
  {
    id v7 = +[UIImageSymbolConfiguration configurationPreferringMonochrome];
  }

  return v7;
}

- (id)configurationForAction:(id)a3
{
  id v4 = a3;
  id v5 = [(SimpleContaineeViewController *)self _primaryColorForAction:v4];
  unsigned __int8 v6 = +[UIListContentConfiguration cellConfiguration];
  id v7 = [v4 title];
  [v6 setText:v7];

  id v8 = [v6 textProperties];
  [v8 setColor:v5];

  double v9 = [v4 symbol];
  if (v9)
  {
    [v6 setImage:v9];
  }
  else
  {
    double v10 = [v4 glyph];
    double v11 = +[UIImage systemImageNamed:v10];
    [v6 setImage:v11];
  }
  uint64_t v12 = sub_1000BBB44(self);
  double v13 = 21.0;
  if (v12 == 5) {
    double v13 = 17.0;
  }
  id v14 = +[UIImageSymbolConfiguration configurationWithPointSize:v13];
  objc_super v15 = [(SimpleContaineeViewController *)self _colorConfigurationForAction:v4];
  id v16 = [v14 configurationByApplyingConfiguration:v15];
  double v17 = [v6 imageProperties];
  [v17 setTintColor:v5];

  double v18 = [v6 imageProperties];
  [v18 setPreferredSymbolConfiguration:v16];

  return v6;
}

- (int64_t)_actionsSectionIndex
{
  double v3 = [(SimpleContaineeViewController *)self actions];
  id v4 = [v3 count];

  if (v4) {
    return (int64_t)[(MapsThemeTableView *)self->_actionsTableView numberOfSections] - 1;
  }
  else {
    return -1;
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SimpleContaineeViewController *)self actionForIndexPath:v6];
  uint64_t v8 = [v7 action];
  double v9 = (void *)v8;
  if (v8) {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
  [v10 deselectRowAtIndexPath:v6 animated:1];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SimpleContaineeViewController;
  [(ContaineeViewController *)&v10 scrollViewDidScroll:v4];
  [v4 contentOffset];
  double v5 = 0.0;
  if (v6 > 0.0)
  {
    [v4 contentOffset:0.0];
    BOOL v8 = v7 < 10.0;
    double v9 = 10.0;
    if (v8) {
      [v4 contentOffset];
    }
    double v5 = v9 / 10.0;
  }
  [(ContainerHeaderView *)self->_titleHeaderView setHairLineAlpha:v5];
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5 = [(ControlContaineeViewController *)self delegate];
  [v5 viewControllerClosed:self animated:1];
}

- (NSArray)actions
{
  return self->_actions;
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (UIView)metadataContainerView
{
  return self->_metadataContainerView;
}

- (UIStackView)topActionsContainerView
{
  return self->_topActionsContainerView;
}

- (MapsThemeTableView)actionsTableView
{
  return self->_actionsTableView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsTableView, 0);
  objc_storeStrong((id *)&self->_topActionsContainerView, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_largeWidthConstraints, 0);
  objc_storeStrong((id *)&self->_smallWidthConstraints, 0);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_actionsTableWidthConstraint, 0);
  objc_storeStrong((id *)&self->_actionsTableHeightConstraint, 0);
  objc_storeStrong((id *)&self->_metadataContainerView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);

  objc_storeStrong((id *)&self->_viewsToObserveBoundsChanges, 0);
}

@end