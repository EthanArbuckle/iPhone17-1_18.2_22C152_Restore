@interface TrafficIncidentContaineeViewController
- (CGSize)_calculatePreferredContentSize;
- (ContainerHeaderView)headerView;
- (TrafficFeatureTitleView)macTitleView;
- (TrafficIncidentContaineeViewController)init;
- (TrafficIncidentReport)incidentReport;
- (TrafficIncidentTitleView)titleView;
- (TrafficIncidentsViewController)incidentsViewController;
- (VKTrafficIncidentFeature)incident;
- (double)heightForLayout:(unint64_t)a3;
- (id)contentView;
- (id)dismissHandler;
- (void)_logAdvisoryShown;
- (void)_updateHeaderView;
- (void)_updateMacTableViewHeader;
- (void)_updatePreferredContentSize;
- (void)applyAlphaToContent:(double)a3;
- (void)dealloc;
- (void)dismiss;
- (void)handleDismissAction:(id)a3;
- (void)headerViewTapped:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDismissHandler:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setIncident:(id)a3;
- (void)setIncidentReport:(id)a3;
- (void)setMacTitleView:(id)a3;
- (void)setTitleView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TrafficIncidentContaineeViewController

- (TrafficIncidentContaineeViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)TrafficIncidentContaineeViewController;
  v2 = [(TrafficIncidentContaineeViewController *)&v7 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = objc_alloc_init(TrafficIncidentsViewController);
    incidentsViewController = v2->_incidentsViewController;
    v2->_incidentsViewController = v3;

    [(TrafficIncidentsViewController *)v2->_incidentsViewController setScrollViewDelegate:v2];
    [(TrafficIncidentsViewController *)v2->_incidentsViewController setDelegate:v2];
    v5 = [(TrafficIncidentContaineeViewController *)v2 incidentsViewController];
    [(TrafficIncidentContaineeViewController *)v2 addChildViewController:v5];
  }
  return v2;
}

- (VKTrafficIncidentFeature)incident
{
  v2 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  v3 = [v2 incident];

  return (VKTrafficIncidentFeature *)v3;
}

- (void)setIncident:(id)a3
{
  id v4 = a3;
  v5 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  [v5 setIncident:v4];

  [(TrafficIncidentContaineeViewController *)self _updateHeaderView];
  [(TrafficIncidentContaineeViewController *)self _updatePreferredContentSize];

  [(TrafficIncidentContaineeViewController *)self _logAdvisoryShown];
}

- (TrafficIncidentReport)incidentReport
{
  v2 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  v3 = [v2 incidentReport];

  return (TrafficIncidentReport *)v3;
}

- (void)setIncidentReport:(id)a3
{
  id v4 = a3;
  v5 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  [v5 setIncidentReport:v4];

  [(TrafficIncidentContaineeViewController *)self _updateHeaderView];
  [(TrafficIncidentContaineeViewController *)self _updatePreferredContentSize];

  [(TrafficIncidentContaineeViewController *)self _logAdvisoryShown];
}

- (void)_updateHeaderView
{
  if ([(TrafficIncidentContaineeViewController *)self isViewLoaded])
  {
    if (sub_1000BBB44(self) == 5)
    {
      v3 = [(TrafficIncidentContaineeViewController *)self incident];
      id v4 = [v3 title];
      v5 = [(TrafficIncidentContaineeViewController *)self macTitleView];
      [v5 setTitle:v4];

      v6 = [(TrafficIncidentContaineeViewController *)self incident];

      if (v6)
      {
        objc_super v7 = [(TrafficIncidentContaineeViewController *)self incident];
        v8 = [(TrafficIncidentContaineeViewController *)self macTitleView];
        v9 = [v8 window];
        v10 = [v9 screen];
        if (v10)
        {
          v11 = [v8 window];
          v12 = [v11 screen];
          [v12 nativeScale];
          double v14 = v13;
        }
        else
        {
          v11 = +[UIScreen mainScreen];
          [v11 nativeScale];
          double v14 = v19;
        }

        v20 = sub_100723FDC(v7, 4, v14);
        v21 = [(TrafficIncidentContaineeViewController *)self macTitleView];
        [v21 setImage:v20];
      }
      else
      {
        objc_super v7 = [(TrafficIncidentContaineeViewController *)self macTitleView];
        [v7 setImage:0];
      }

      [(TrafficIncidentContaineeViewController *)self _updateMacTableViewHeader];
    }
    else if ([(TrafficIncidentsViewController *)self->_incidentsViewController numberOfItems])
    {
      v15 = +[NSBundle mainBundle];
      v16 = [v15 localizedStringForKey:@"Advisories_Maps_Incidents" value:@"localized string not found" table:0];

      uint64_t v23 = 0;
      v17 = +[NSString localizedStringWithValidatedFormat:v16, @"%lu", &v23, [(TrafficIncidentsViewController *)self->_incidentsViewController numberOfItems] validFormatSpecifiers error];
      v18 = [(TrafficIncidentContaineeViewController *)self titleView];
      [v18 setTitle:v17];
    }
    else
    {
      id v22 = [(TrafficIncidentContaineeViewController *)self titleView];
      [v22 setTitle:0];
    }
  }
}

- (void)_updateMacTableViewHeader
{
  v3 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  id v4 = [v3 tableView];
  v5 = [v4 tableHeaderView];

  v6 = [(TrafficIncidentContaineeViewController *)self macTitleView];
  objc_super v7 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  v8 = [v7 tableView];
  [v8 setTableHeaderView:v6];

  v9 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  v10 = [v9 tableView];
  v11 = [v10 tableHeaderView];
  [v11 setNeedsLayout];

  v12 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  double v13 = [v12 tableView];
  double v14 = [v13 tableHeaderView];
  [v14 layoutIfNeeded];

  v15 = [(TrafficIncidentContaineeViewController *)self macTitleView];
  [v15 frame];
  double v17 = v16;
  double v19 = v18;

  v20 = [(TrafficIncidentContaineeViewController *)self macTitleView];
  [v20 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  double v22 = v21;
  double v24 = v23;

  v25 = [(TrafficIncidentContaineeViewController *)self macTitleView];
  [v25 setFrame:v17, v19, v22, v24];

  v26 = [(TrafficIncidentContaineeViewController *)self macTitleView];
  v27 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  v28 = [v27 tableView];
  [v28 setTableHeaderView:v26];

  if (!v5)
  {
    v29 = [(TrafficIncidentContaineeViewController *)self macTitleView];
    v30 = [v29 widthAnchor];
    v31 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
    v32 = [v31 tableView];
    v33 = [v32 widthAnchor];
    v34 = [v30 constraintEqualToAnchor:v33];
    v36 = v34;
    v35 = +[NSArray arrayWithObjects:&v36 count:1];
    +[NSLayoutConstraint activateConstraints:v35];
  }
}

- (void)_logAdvisoryShown
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:111 onTarget:743 eventValue:0];
}

- (void)viewDidLoad
{
  v57.receiver = self;
  v57.super_class = (Class)TrafficIncidentContaineeViewController;
  [(ContaineeViewController *)&v57 viewDidLoad];
  v3 = [(TrafficIncidentContaineeViewController *)self view];
  if (sub_1000BBB44(self) == 5)
  {
    id v4 = -[TrafficFeatureTitleView initWithFrame:]([TrafficFeatureTitleView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(TrafficIncidentContaineeViewController *)self setMacTitleView:v4];

    v5 = [(TrafficIncidentContaineeViewController *)self macTitleView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  else
  {
    v6 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(TrafficIncidentContaineeViewController *)self setHeaderView:v6];

    objc_super v7 = [(TrafficIncidentContaineeViewController *)self headerView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [(TrafficIncidentContaineeViewController *)self headerView];
    [v8 setHairLineAlpha:0.0];

    v9 = [(TrafficIncidentContaineeViewController *)self headerView];
    [v9 setDelegate:self];

    v10 = [(TrafficIncidentContaineeViewController *)self headerView];
    [v3 addSubview:v10];

    v11 = objc_alloc_init(TrafficIncidentTitleView);
    [(TrafficIncidentContaineeViewController *)self setTitleView:v11];

    v12 = [(TrafficIncidentContaineeViewController *)self titleView];
    double v13 = [(TrafficIncidentContaineeViewController *)self headerView];
    [v13 setTitleView:v12];

    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    v5 = [(TrafficIncidentContaineeViewController *)self headerView];
    [v5 setTitleViewInsets:UIEdgeInsetsZero.top, left, bottom, right];
  }

  double v17 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  double v18 = [v17 view];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v19 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  v20 = [v19 view];
  [v3 addSubview:v20];

  if (sub_1000BBB44(self) == 5) {
    [(TrafficIncidentContaineeViewController *)self view];
  }
  else {
  double v21 = [(TrafficIncidentContaineeViewController *)self headerView];
  }
  v55 = v21;
  if (sub_1000BBB44(self) == 5) {
    [v21 topAnchor];
  }
  else {
  uint64_t v22 = [v21 bottomAnchor];
  }
  v52 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  v51 = [v52 tableView];
  v49 = [v51 leadingAnchor];
  v48 = [v3 leadingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v59[0] = v47;
  v46 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  v45 = [v46 tableView];
  v44 = [v45 trailingAnchor];
  v43 = [v3 trailingAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v59[1] = v42;
  v41 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  double v23 = [v41 tableView];
  double v24 = [v23 topAnchor];
  v54 = (void *)v22;
  v25 = [v24 constraintEqualToAnchor:v22 constant:0.0];
  v59[2] = v25;
  v26 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  v27 = [v26 tableView];
  v28 = [v27 bottomAnchor];
  v29 = [v3 bottomAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:-0.0];
  v59[3] = v30;
  +[NSArray arrayWithObjects:v59 count:4];
  v31 = v56 = v3;
  +[NSLayoutConstraint activateConstraints:v31];

  if (sub_1000BBB44(self) == 5)
  {
    v32 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
    v33 = [v32 tableView];
    [v33 addObserver:self forKeyPath:@"contentSize" options:1 context:&unk_10160F378];
    v34 = v55;
  }
  else
  {
    v34 = v55;
    v32 = [v55 leadingAnchor];
    v33 = [v56 leadingAnchor];
    v53 = [v32 constraintEqualToAnchor:v33];
    v58[0] = v53;
    v50 = [v55 trailingAnchor];
    v35 = [v56 trailingAnchor];
    v36 = [v50 constraintEqualToAnchor:v35];
    v58[1] = v36;
    v37 = [v55 topAnchor];
    v38 = [v56 topAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v58[2] = v39;
    v40 = +[NSArray arrayWithObjects:v58 count:3];
    +[NSLayoutConstraint activateConstraints:v40];
  }
  [(TrafficIncidentContaineeViewController *)self _updateHeaderView];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &unk_10160F378) {
    [(TrafficIncidentContaineeViewController *)self _updatePreferredContentSize];
  }
}

- (void)_updatePreferredContentSize
{
  if (sub_1000BBB44(self) == 5)
  {
    [(TrafficIncidentContaineeViewController *)self preferredContentSize];
    double v4 = v3;
    double v6 = v5;
    [(TrafficIncidentContaineeViewController *)self _calculatePreferredContentSize];
    if (v4 != v8 || v6 != v7)
    {
      -[TrafficIncidentContaineeViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)TrafficIncidentContaineeViewController;
  [(ContaineeViewController *)&v13 viewDidLayoutSubviews];
  if (sub_1000BBB44(self) == 5)
  {
    double v3 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
    double v4 = [v3 tableView];
    [v4 contentSize];
    double v6 = v5;
    double v7 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
    double v8 = [v7 tableView];
    [v8 frame];
    BOOL v10 = v6 > v9;

    v11 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
    v12 = [v11 tableView];
    [v12 setScrollEnabled:v10];
  }
}

- (CGSize)_calculatePreferredContentSize
{
  unsigned int v3 = [(TrafficIncidentContaineeViewController *)self isViewLoaded];
  double v4 = 282.0;
  if (v3)
  {
    uint64_t v5 = sub_1000BBB44(self);
    double v4 = 282.0;
    if (v5 == 5)
    {
      double v6 = [(TrafficIncidentContaineeViewController *)self view];
      [v6 layoutIfNeeded];

      double v7 = 0.0;
      if (sub_1000BBB44(self) != 5)
      {
        double v8 = [(TrafficIncidentContaineeViewController *)self titleView];
        [v8 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
        double v7 = v9;
      }
      BOOL v10 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
      v11 = [v10 tableView];
      [v11 contentSize];
      double v13 = v12;

      double v4 = v7 + v13 + 17.0 + 13.0;
    }
  }
  double v14 = 282.0;
  result.height = v4;
  result.width = v14;
  return result;
}

- (void)dealloc
{
  if (sub_1000BBB44(self) == 5)
  {
    unsigned int v3 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
    double v4 = [v3 tableView];
    [v4 removeObserver:self forKeyPath:@"contentSize" context:&unk_10160F378];
  }
  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentContaineeViewController;
  [(TrafficIncidentContaineeViewController *)&v5 dealloc];
}

- (void)applyAlphaToContent:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TrafficIncidentContaineeViewController;
  -[ContaineeViewController applyAlphaToContent:](&v6, "applyAlphaToContent:");
  if (sub_1000BBB44(self) != 5)
  {
    objc_super v5 = [(TrafficIncidentContaineeViewController *)self headerView];
    [v5 setHairLineAlpha:a3];
  }
}

- (id)contentView
{
  id v2 = [(TrafficIncidentContaineeViewController *)self incidentsViewController];
  unsigned int v3 = [v2 view];

  return v3;
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[MKMapService sharedService];
  [v5 captureUserAction:108 onTarget:741 eventValue:0];

  v8.receiver = self;
  v8.super_class = (Class)TrafficIncidentContaineeViewController;
  [(ContaineeViewController *)&v8 handleDismissAction:v4];

  objc_super v6 = [(TrafficIncidentContaineeViewController *)self dismissHandler];

  if (v6)
  {
    double v7 = [(TrafficIncidentContaineeViewController *)self dismissHandler];
    v7[2]();
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 == 2)
  {
    if (sub_1000BBB44(self) == 5)
    {
      [(TrafficIncidentContaineeViewController *)self preferredContentSize];
      return v9;
    }
    else
    {
      return 325.0;
    }
  }
  else if (a3 == 1)
  {
    id v4 = [(ContaineeViewController *)self cardPresentationController];
    [v4 bottomSafeOffset];
    double v6 = v5;
    double v7 = [(TrafficIncidentContaineeViewController *)self headerView];
    [v7 frame];
    double v8 = v6 + CGRectGetHeight(v13);
  }
  else
  {
    BOOL v10 = [(ContaineeViewController *)self cardPresentationController];
    [v10 availableHeight];
    double v8 = v11;
  }
  return v8;
}

- (void)headerViewTapped:(id)a3
{
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 wantsExpandLayout];
}

- (void)dismiss
{
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (TrafficIncidentsViewController)incidentsViewController
{
  return self->_incidentsViewController;
}

- (ContainerHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (TrafficFeatureTitleView)macTitleView
{
  return self->_macTitleView;
}

- (void)setMacTitleView:(id)a3
{
}

- (TrafficIncidentTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_macTitleView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_incidentsViewController, 0);

  objc_storeStrong(&self->_dismissHandler, 0);
}

@end