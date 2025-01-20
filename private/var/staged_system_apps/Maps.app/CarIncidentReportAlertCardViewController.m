@interface CarIncidentReportAlertCardViewController
- (CarIncidentReportAlertCardViewController)initWithDelegate:(id)a3 incidentLayoutItem:(id)a4 report:(id)a5;
- (CarIncidentReportAlertViewControllerDelegate)delegate;
- (CarTrafficAlertView)trafficAlertView;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (NSTimer)dismissTimer;
- (NSTimer)timeoutTimer;
- (TrafficIncidentLayoutItem)incidentLayoutItem;
- (void)_cancelDismissTimer;
- (void)_dismissTrafficAlert;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setDismissTimer:(id)a3;
- (void)setIncidentLayoutItem:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setTrafficAlertView:(id)a3;
- (void)updateIncidentLayoutItem:(id)a3 report:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CarIncidentReportAlertCardViewController

- (CarIncidentReportAlertCardViewController)initWithDelegate:(id)a3 incidentLayoutItem:(id)a4 report:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CarIncidentReportAlertCardViewController;
  v11 = [(CarIncidentReportAlertCardViewController *)&v14 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_incidentLayoutItem, a4);
    objc_storeStrong((id *)&v12->_report, a5);
  }

  return v12;
}

- (void)loadView
{
  v3 = [[CarTrafficAlertView alloc] initWithDelegate:self incidentLayoutItem:self->_incidentLayoutItem];
  [(CarTrafficAlertView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CarIncidentReportAlertCardViewController *)self setView:v3];
  [(CarIncidentReportAlertCardViewController *)self setTrafficAlertView:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CarIncidentReportAlertCardViewController;
  [(CarIncidentReportAlertCardViewController *)&v15 viewDidAppear:a3];
  v4 = [(CarIncidentReportAlertCardViewController *)self trafficAlertView];
  [v4 setAcceptProgress:0.0];

  GEOConfigGetDouble();
  if (v5 > 0.0)
  {
    double v6 = v5;
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100A3F1DC;
    v12[3] = &unk_1012E6708;
    objc_copyWeak(&v13, &location);
    +[UIView animateWithDuration:v12 animations:0 completion:v6];
    [(CarIncidentReportAlertCardViewController *)self _cancelDismissTimer];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100A3F238;
    v10[3] = &unk_1012E73C8;
    objc_copyWeak(&v11, &location);
    v7 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v10 block:v6];
    [(CarIncidentReportAlertCardViewController *)self setDismissTimer:v7];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  if (![(TrafficIncidentReport *)self->_report isSiriContext])
  {
    id v8 = +[MKMapService sharedService];
    id v9 = [(TrafficIncidentLayoutItem *)self->_incidentLayoutItem incidentTypeAsString];
    [v8 captureUserAction:2152 onTarget:1001 eventValue:v9];
  }
  [(TrafficIncidentReport *)self->_report submitWithCompletionHandler:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarIncidentReportAlertCardViewController;
  [(CarIncidentReportAlertCardViewController *)&v4 viewWillDisappear:a3];
  [(CarIncidentReportAlertCardViewController *)self _cancelDismissTimer];
}

- (void)updateIncidentLayoutItem:(id)a3 report:(id)a4
{
  double v6 = (TrafficIncidentLayoutItem *)a3;
  objc_storeStrong((id *)&self->_report, a4);
  id v7 = a4;
  incidentLayoutItem = self->_incidentLayoutItem;
  self->_incidentLayoutItem = v6;
  id v9 = v6;

  id v10 = self->_incidentLayoutItem;
  id v11 = [(CarIncidentReportAlertCardViewController *)self trafficAlertView];
  [v11 setIncidentLayoutItem:v10];
}

- (void)_cancelDismissTimer
{
  v3 = [(CarIncidentReportAlertCardViewController *)self dismissTimer];
  [v3 invalidate];

  [(CarIncidentReportAlertCardViewController *)self setDismissTimer:0];
}

- (void)_dismissTrafficAlert
{
  [(CarIncidentReportAlertCardViewController *)self _cancelDismissTimer];
  id v3 = [(CarIncidentReportAlertCardViewController *)self delegate];
  [v3 trafficAlertCardViewControllerDismiss:self];
}

- (NSArray)focusOrderSubItems
{
  v2 = [(CarIncidentReportAlertCardViewController *)self trafficAlertView];
  id v3 = [v2 focusOrderSubItems];

  return (NSArray *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = [(CarIncidentReportAlertCardViewController *)self trafficAlertView];
  id v3 = [v2 preferredFocusEnvironments];

  return (NSArray *)v3;
}

- (CarIncidentReportAlertViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarIncidentReportAlertViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TrafficIncidentLayoutItem)incidentLayoutItem
{
  return self->_incidentLayoutItem;
}

- (void)setIncidentLayoutItem:(id)a3
{
}

- (CarTrafficAlertView)trafficAlertView
{
  return self->_trafficAlertView;
}

- (void)setTrafficAlertView:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
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
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_trafficAlertView, 0);
  objc_storeStrong((id *)&self->_incidentLayoutItem, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_report, 0);
}

@end