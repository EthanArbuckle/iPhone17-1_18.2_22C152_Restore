@interface RAPDirectionsReportContaineeViewController
- (RAPDirectionsReportContaineeViewController)initWithReport:(id)a3 directionsReportContext:(unint64_t)a4;
- (double)heightForLayout:(unint64_t)a3;
- (id)_routeFeedbackViewControllerForRequest:(id)a3;
- (void)_cancelButtonPressed:(id)a3;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)rapRouteListViewController:(id)a3 didSelectRequest:(id)a4;
- (void)rapRouteListViewControllerDidDismiss:(id)a3;
- (void)routeFeedbackViewControllerDidDismiss:(id)a3;
- (void)viewDidLoad;
@end

@implementation RAPDirectionsReportContaineeViewController

- (RAPDirectionsReportContaineeViewController)initWithReport:(id)a3 directionsReportContext:(unint64_t)a4
{
  id v7 = a3;
  if (a4) {
    goto LABEL_2;
  }
  v22 = [(RAPReport *)self->_report _context];
  v23 = [v22 directionsHistory];
  v24 = [v23 firstObject];
  v25 = [v24 recording];

  if (!v25)
  {
LABEL_2:
    v31.receiver = self;
    v31.super_class = (Class)RAPDirectionsReportContaineeViewController;
    v8 = [(RAPDirectionsReportContaineeViewController *)&v31 init];
    v9 = v8;
    if (!v8)
    {
LABEL_13:
      self = v9;
      v28 = self;
      goto LABEL_14;
    }
    v8->_unint64_t context = a4;
    p_report = (id *)&v8->_report;
    objc_storeStrong((id *)&v8->_report, a3);
    unint64_t context = v9->_context;
    if (context == 1)
    {
      v29 = [[RAPRouteListViewController alloc] initWithReport:*p_report delegate:v9];
      contentViewController = v9->_contentViewController;
      v9->_contentViewController = &v29->super;
    }
    else
    {
      if (context)
      {
LABEL_12:
        [(ContaineeViewController *)v9 setKeepOriginalSafeInsets:1];
        goto LABEL_13;
      }
      v12 = [*p_report _context];
      v13 = [v12 directionsHistory];
      v14 = [v13 firstObject];
      uint64_t v15 = [(RAPDirectionsReportContaineeViewController *)v9 _routeFeedbackViewControllerForRequest:v14];
      v16 = v9->_contentViewController;
      v9->_contentViewController = (UIViewController *)v15;

      id v17 = objc_alloc((Class)UIBarButtonItem);
      contentViewController = +[NSBundle mainBundle];
      v19 = [contentViewController localizedStringForKey:@"[RAP Navigation] Cancel" value:@"localized string not found" table:0];
      id v20 = [v17 initWithTitle:v19 style:0 target:v9 action:"_cancelButtonPressed:"];
      v21 = [(UIViewController *)v9->_contentViewController navigationItem];
      [v21 setLeftBarButtonItem:v20];
    }
    goto LABEL_12;
  }
  v26 = sub_10057670C();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    report = self->_report;
    *(_DWORD *)buf = 138412290;
    v33 = report;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Tried to present RAPDirectionsReportContaineeVC, but didn't have a route in the report: %@", buf, 0xCu);
  }

  v28 = 0;
LABEL_14:

  return v28;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)RAPDirectionsReportContaineeViewController;
  [(ContaineeViewController *)&v3 viewDidLoad];
  [(RAPDirectionsReportContaineeViewController *)self _setupViews];
  [(RAPDirectionsReportContaineeViewController *)self _setupConstraints];
}

- (void)_setupViews
{
  objc_super v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setPresentedModally:1];

  v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setTakesAvailableHeight:1];

  v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 setAllowsSwipeToDismiss:0];

  v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 setDefaultContaineeLayout:5];

  id v7 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self->_contentViewController];
  v8 = [(UINavigationController *)v7 view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(RAPDirectionsReportContaineeViewController *)self addChildViewController:v7];
  v9 = [(RAPDirectionsReportContaineeViewController *)self view];
  v10 = [(UINavigationController *)v7 view];
  [v9 addSubview:v10];

  [(UINavigationController *)v7 didMoveToParentViewController:self];
  navController = self->_navController;
  self->_navController = v7;
}

- (void)_setupConstraints
{
  v23 = [(UINavigationController *)self->_navController view];
  v21 = [v23 topAnchor];
  v22 = [(RAPDirectionsReportContaineeViewController *)self view];
  id v20 = [v22 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v24[0] = v19;
  v18 = [(UINavigationController *)self->_navController view];
  v16 = [v18 leadingAnchor];
  id v17 = [(RAPDirectionsReportContaineeViewController *)self view];
  uint64_t v15 = [v17 leadingAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v24[1] = v14;
  v13 = [(UINavigationController *)self->_navController view];
  objc_super v3 = [v13 trailingAnchor];
  v4 = [(RAPDirectionsReportContaineeViewController *)self view];
  v5 = [v4 trailingAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  v24[2] = v6;
  id v7 = [(UINavigationController *)self->_navController view];
  v8 = [v7 bottomAnchor];
  v9 = [(RAPDirectionsReportContaineeViewController *)self view];
  v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v24[3] = v11;
  v12 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (id)_routeFeedbackViewControllerForRequest:(id)a3
{
  v4 = [a3 recording];
  v5 = [(RAPReport *)self->_report initialQuestion];

  if (!v5)
  {
    v6 = [[RAPWebBundleQuestion alloc] initWithReport:self->_report directionsRecording:v4];
    [(RAPReport *)self->_report setInitialQuestion:v6];
  }
  id v7 = [(RAPReport *)self->_report initialQuestion];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  [v9 setDirectionsRecording:v4];
  v10 = [[RAPRouteFeedbackViewController alloc] initWithReport:self->_report recording:v4 delegate:self];
  [(RAPRouteFeedbackViewController *)v10 setAllowsScrolling:1];
  v11 = +[UIColor systemGroupedBackgroundColor];
  v12 = [(RAPRouteFeedbackViewController *)v10 view];
  [v12 setBackgroundColor:v11];

  return v10;
}

- (void)_cancelButtonPressed:(id)a3
{
  id v4 = a3;
  v5 = sub_10057670C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_cancelButtonPressed: will dismiss directionsReportContaineeVC", v9, 2u);
  }

  +[GEOAPPortal captureUserAction:10109 target:31 value:0];
  v6 = [(ContaineeViewController *)self cardPresentationController];
  unsigned int v7 = [v6 usingSheetPresentation];

  if (v7)
  {
    v8 = [(ContaineeViewController *)self containeeDelegate];
    [v8 containeeViewControllerGoToPreviousState:self withSender:v4];
  }
  else
  {
    [(RAPDirectionsReportContaineeViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)routeFeedbackViewControllerDidDismiss:(id)a3
{
  id v4 = sub_10057670C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "routeFeedbackViewControllerDidDismiss: will dismiss the card", v8, 2u);
  }

  v5 = [(ContaineeViewController *)self cardPresentationController];
  unsigned int v6 = [v5 usingSheetPresentation];

  if (v6)
  {
    unsigned int v7 = [(ContaineeViewController *)self containeeDelegate];
    [v7 containeeViewControllerGoToPreviousState:self withSender:0];
  }
  else
  {
    [(RAPDirectionsReportContaineeViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  objc_super v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 availableHeight];
  double v5 = v4;

  return v5;
}

- (void)rapRouteListViewControllerDidDismiss:(id)a3
{
  double v4 = sub_10057670C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "rapRouteListViewControllerDidDismiss: will dismiss directionsReportContaineeVC", v8, 2u);
  }

  double v5 = [(ContaineeViewController *)self cardPresentationController];
  unsigned int v6 = [v5 usingSheetPresentation];

  if (v6)
  {
    unsigned int v7 = [(ContaineeViewController *)self containeeDelegate];
    [v7 containeeViewControllerGoToPreviousState:self withSender:0];
  }
  else
  {
    [(RAPDirectionsReportContaineeViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)rapRouteListViewController:(id)a3 didSelectRequest:(id)a4
{
  id v5 = [(RAPDirectionsReportContaineeViewController *)self _routeFeedbackViewControllerForRequest:a4];
  [(UINavigationController *)self->_navController pushViewController:v5 animated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end