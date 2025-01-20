@interface NavTrafficIncidentReportSubmissionContaineeViewController
- (BOOL)_canShowWhileLocked;
- (NSTimer)dismissTimer;
- (NavTrafficIncidentReportSubmissionContaineeDelegate)reportingDelegate;
- (NavTrafficIncidentReportSubmissionContaineeViewController)initWithItem:(id)a3 report:(id)a4;
- (double)heightForLayout:(unint64_t)a3;
- (id)headerView;
- (void)_cancelDismissTimer;
- (void)_dismiss;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)setDismissTimer:(id)a3;
- (void)setReportingDelegate:(id)a3;
- (void)updateContent;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NavTrafficIncidentReportSubmissionContaineeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavTrafficIncidentReportSubmissionContaineeViewController)initWithItem:(id)a3 report:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NavTrafficIncidentReportSubmissionContaineeViewController;
  v9 = [(NavTrafficIncidentReportSubmissionContaineeViewController *)&v15 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    v11 = [(ContaineeViewController *)v9 cardPresentationController];
    [v11 setBlurInCardView:0];

    v12 = +[UIColor colorNamed:@"NavigationMaterialColor"];
    v13 = [(ContaineeViewController *)v10 cardPresentationController];
    [v13 setCardColor:v12];

    objc_storeStrong((id *)&v10->_layoutItem, a3);
    [v8 submitWithCompletionHandler:0];
  }

  return v10;
}

- (void)viewDidLoad
{
  v52.receiver = self;
  v52.super_class = (Class)NavTrafficIncidentReportSubmissionContaineeViewController;
  [(ContaineeViewController *)&v52 viewDidLoad];
  v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setPresentedModally:1];

  v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setShouldHidePreviousCards:1];

  v5 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  headerView = self->_headerView;
  self->_headerView = v5;

  [(ContainerHeaderView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)self->_headerView setHairLineAlpha:0.0];
  [(ContainerHeaderView *)self->_headerView setDelegate:self];
  id v7 = [(NavTrafficIncidentReportSubmissionContaineeViewController *)self view];
  [v7 addSubview:self->_headerView];

  id v8 = (UILabel *)objc_alloc_init((Class)UILabel);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v8;

  [(UILabel *)self->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Report [Nav Tray, Incident Report now]", @"localized string not found", 0 value table];
  [(UILabel *)self->_primaryLabel setText:v11];

  v12 = +[UIFont _maps_systemFontWithFixedSize:20.0];
  [(UILabel *)self->_primaryLabel setFont:v12];

  v13 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_primaryLabel setTextColor:v13];

  v14 = [(NavTrafficIncidentReportSubmissionContaineeViewController *)self view];
  [v14 addSubview:self->_primaryLabel];

  objc_super v15 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  imageView = self->_imageView;
  self->_imageView = v15;

  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = [(NavTrafficIncidentReportSubmissionContaineeViewController *)self view];
  [v17 addSubview:self->_imageView];

  v50 = [(UIImageView *)self->_imageView leadingAnchor];
  v51 = [(NavTrafficIncidentReportSubmissionContaineeViewController *)self view];
  v49 = [v51 leadingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49 constant:18.0];
  v53[0] = v48;
  v46 = [(UIImageView *)self->_imageView topAnchor];
  v47 = [(NavTrafficIncidentReportSubmissionContaineeViewController *)self view];
  v45 = [v47 topAnchor];
  v44 = [v46 constraintEqualToAnchor:v45 constant:20.0];
  v53[1] = v44;
  v43 = [(UIImageView *)self->_imageView widthAnchor];
  v42 = [v43 constraintEqualToConstant:42.0];
  v53[2] = v42;
  v41 = [(UIImageView *)self->_imageView heightAnchor];
  v40 = [v41 constraintEqualToConstant:42.0];
  v53[3] = v40;
  v39 = [(ContainerHeaderView *)self->_headerView leadingAnchor];
  v38 = [(UIImageView *)self->_imageView trailingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v53[4] = v37;
  v35 = [(ContainerHeaderView *)self->_headerView trailingAnchor];
  v36 = [(NavTrafficIncidentReportSubmissionContaineeViewController *)self view];
  v34 = [v36 trailingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v53[5] = v33;
  v31 = [(ContainerHeaderView *)self->_headerView topAnchor];
  v32 = [(NavTrafficIncidentReportSubmissionContaineeViewController *)self view];
  v30 = [v32 topAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v53[6] = v29;
  v28 = [(UILabel *)self->_primaryLabel leadingAnchor];
  v27 = [(ContainerHeaderView *)self->_headerView leadingAnchor];
  v18 = [v28 constraintEqualToAnchor:v27 constant:16.0];
  v53[7] = v18;
  v19 = [(UILabel *)self->_primaryLabel trailingAnchor];
  v20 = [(NavTrafficIncidentReportSubmissionContaineeViewController *)self view];
  v21 = [v20 trailingAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  v53[8] = v22;
  v23 = [(UILabel *)self->_primaryLabel topAnchor];
  v24 = [(ContainerHeaderView *)self->_headerView bottomAnchor];
  v25 = [v23 constraintEqualToAnchor:v24 constant:-14.0];
  v53[9] = v25;
  v26 = +[NSArray arrayWithObjects:v53 count:10];
  +[NSLayoutConstraint activateConstraints:v26];

  [(NavTrafficIncidentReportSubmissionContaineeViewController *)self updateContent];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NavTrafficIncidentReportSubmissionContaineeViewController;
  [(ContaineeViewController *)&v4 viewWillAppear:a3];
  [(NavTrafficIncidentReportSubmissionContaineeViewController *)self updateContent];
}

- (void)viewDidAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)NavTrafficIncidentReportSubmissionContaineeViewController;
  [(NavTrafficIncidentReportSubmissionContaineeViewController *)&v15 viewDidAppear:a3];
  objc_initWeak(&location, self);
  GEOConfigGetDouble();
  double v5 = v4;
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_1004E8694;
  v12 = &unk_1012E73C8;
  objc_copyWeak(&v13, &location);
  v6 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v9 block:v5];
  -[NavTrafficIncidentReportSubmissionContaineeViewController setDismissTimer:](self, "setDismissTimer:", v6, v9, v10, v11, v12);

  id v7 = +[MKMapService sharedService];
  id v8 = [(TrafficIncidentLayoutItem *)self->_layoutItem incidentTypeAsString];
  [v7 captureUserAction:112 onTarget:0 eventValue:v8];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)updateContent
{
  v3 = [(TrafficIncidentLayoutItem *)self->_layoutItem preferredConfirmationTitle];
  [(ContainerHeaderView *)self->_headerView setTitle:v3];

  id v4 = [(TrafficIncidentLayoutItem *)self->_layoutItem displayImage];
  [(UIImageView *)self->_imageView setImage:v4];
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  [(NavTrafficIncidentReportSubmissionContaineeViewController *)self _dismiss];
  id v6 = +[MKMapService sharedService];
  double v5 = [(TrafficIncidentLayoutItem *)self->_layoutItem incidentTypeAsString];
  [v6 captureUserAction:4 onTarget:740 eventValue:v5];
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3 = -1.0;
  if (a3 == 5)
  {
    [(ContaineeViewController *)self headerHeight];
    double v6 = v5 + 16.0;
    id v7 = [(ContaineeViewController *)self cardPresentationController];
    [v7 bottomSafeOffset];
    double v3 = v6 + v8;
  }
  return v3;
}

- (id)headerView
{
  return self->_headerView;
}

- (void)_cancelDismissTimer
{
  double v3 = [(NavTrafficIncidentReportSubmissionContaineeViewController *)self dismissTimer];
  [v3 invalidate];

  [(NavTrafficIncidentReportSubmissionContaineeViewController *)self setDismissTimer:0];
}

- (void)_dismiss
{
  double v3 = [(NavTrafficIncidentReportSubmissionContaineeViewController *)self dismissTimer];
  [v3 invalidate];

  id v4 = [(NavTrafficIncidentReportSubmissionContaineeViewController *)self reportingDelegate];
  [v4 incidentReportSubmissionContaineeDidFinish:self];
}

- (NavTrafficIncidentReportSubmissionContaineeDelegate)reportingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reportingDelegate);

  return (NavTrafficIncidentReportSubmissionContaineeDelegate *)WeakRetained;
}

- (void)setReportingDelegate:(id)a3
{
}

- (NSTimer)dismissTimer
{
  return self->_dismissTimer;
}

- (void)setDismissTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_destroyWeak((id *)&self->_reportingDelegate);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_layoutItem, 0);
}

@end