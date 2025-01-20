@interface CarIncidentReportModeController
- (BOOL)showsMapView;
- (CarIncidentReportAlertCardViewController)carIncidentReportAlertViewController;
- (CarIncidentReportModeController)init;
- (CarIncidentsListCardViewController)carIncidentsListCardViewController;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (NSArray)preferredCarFocusEnvironments;
- (id)_cardTitle;
- (id)desiredCards;
- (int)currentUsageTarget;
- (int64_t)state;
- (void)_commonInit;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)incidentsListCard:(id)a3 didSelectIncident:(id)a4;
- (void)setCarIncidentReportAlertViewController:(id)a3;
- (void)setCarIncidentsListCardViewController:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setIncidentLayoutItem:(id)a3 report:(id)a4;
- (void)setState:(int64_t)a3;
- (void)trafficAlertCardViewControllerDismiss:(id)a3;
@end

@implementation CarIncidentReportModeController

- (CarIncidentReportModeController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CarIncidentReportModeController;
  v2 = [(CarIncidentReportModeController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CarIncidentReportModeController *)v2 _commonInit];
  }
  return v3;
}

- (void)_commonInit
{
  self->_state = 1;
  v3 = [[CarIncidentsListCardViewController alloc] initWithDelegate:self];
  carIncidentsListCardViewController = self->_carIncidentsListCardViewController;
  self->_carIncidentsListCardViewController = v3;

  id v7 = +[MKLocationManager sharedLocationManager];
  objc_super v5 = [v7 currentLocation];
  incidentLocation = self->_incidentLocation;
  self->_incidentLocation = v5;
}

- (void)setIncidentLayoutItem:(id)a3 report:(id)a4
{
  objc_storeStrong((id *)&self->_selectedIncidentLayoutItem, a3);
  id v7 = a3;
  id v8 = a4;
  v9 = [[CarIncidentReportAlertCardViewController alloc] initWithDelegate:self incidentLayoutItem:self->_selectedIncidentLayoutItem report:v8];

  carIncidentReportAlertViewController = self->_carIncidentReportAlertViewController;
  self->_carIncidentReportAlertViewController = v9;

  [(CarIncidentReportModeController *)self setState:2];
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    objc_super v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v6 = @"Unknown";
      if (a3 == 1) {
        CFStringRef v6 = @"IncidentList";
      }
      if (a3 == 2) {
        CFStringRef v6 = @"IncidentReport";
      }
      int v8 = 138412290;
      CFStringRef v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CarReportIncidentModeController: setState: %@, -> updating cardsOverlay.", (uint8_t *)&v8, 0xCu);
    }

    id v7 = [(CarIncidentReportModeController *)self carChromeViewController];
    [v7 updateCardsForContext:self animated:1];
  }
}

- (id)_cardTitle
{
  if ((id)[(CarIncidentReportModeController *)self state] == (id)1)
  {
    v2 = +[NSBundle mainBundle];
    v3 = [v2 localizedStringForKey:@"Report Incident [Nav, Tray]", @"localized string not found", 0 value table];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)showsMapView
{
  return 1;
}

- (id)desiredCards
{
  CFStringRef v4 = @"primary";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  CFStringRef v6 = [(CarIncidentReportModeController *)self _cardTitle];
  [v5 setTitle:v6];

  HIDWORD(v26) = 0;
  *(_DWORD *)((char *)&v26 + 1) = 0;
  long long v15 = xmmword_100F6F1C0;
  uint64_t v16 = 1;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 1065353216;
  uint64_t v20 = 2;
  LODWORD(v21) = 1148846080;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  __asm { FMOV            V0.2D, #8.0 }
  long long v24 = _Q0;
  long long v25 = _Q0;
  LOBYTE(v26) = 1;
  uint64_t v27 = 8;
  LOBYTE(v28) = 0;
  if (v5) {
    [v5 setLayout:&v15];
  }
  int64_t v12 = [(CarIncidentReportModeController *)self state];
  int64_t v13 = v12;
  if (v12 == 1)
  {
    uint64_t v14 = 40;
    goto LABEL_7;
  }
  if (v12 == 2)
  {
    int64_t v13 = 0;
    uint64_t v14 = 48;
LABEL_7:
    [v5 setContent:*(Class *)((char *)&self->super.isa + v14)];
    [v5 setAccessory:v13];
  }
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5 = [(CarIncidentReportModeController *)self carChromeViewController];
  [v5 setHardwareBackButtonBehavior:0 forContext:self];
}

- (void)incidentsListCard:(id)a3 didSelectIncident:(id)a4
{
  id v9 = a4;
  objc_storeStrong((id *)&self->_selectedIncidentLayoutItem, a4);
  CFStringRef v6 = [[TrafficIncidentReport alloc] initWithUserLocation:self->_incidentLocation type:[(TrafficIncidentLayoutItem *)self->_selectedIncidentLayoutItem incidentType] userPath:5];
  [(TrafficIncidentReport *)v6 setReportedFromCarplay:1];
  if (self->_carIncidentReportAlertViewController)
  {
    carIncidentReportAlertViewController = [(CarIncidentReportModeController *)self carIncidentReportAlertViewController];
    [carIncidentReportAlertViewController updateIncidentLayoutItem:self->_selectedIncidentLayoutItem report:v6];
  }
  else
  {
    int v8 = [[CarIncidentReportAlertCardViewController alloc] initWithDelegate:self incidentLayoutItem:self->_selectedIncidentLayoutItem report:v6];
    carIncidentReportAlertViewController = self->_carIncidentReportAlertViewController;
    self->_carIncidentReportAlertViewController = v8;
  }

  [(CarIncidentReportModeController *)self setState:2];
}

- (void)trafficAlertCardViewControllerDismiss:(id)a3
{
  id v4 = +[CarChromeModeCoordinator sharedInstance];
  [v4 popFromContext:self];
}

- (NSArray)preferredCarFocusEnvironments
{
  int64_t v3 = [(CarIncidentReportModeController *)self state];
  if (v3 == 2)
  {
    id v4 = [(CarIncidentReportModeController *)self carIncidentReportAlertViewController];
    id v5 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v4];
    id v9 = v5;
    CFStringRef v6 = &v9;
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    id v4 = [(CarIncidentReportModeController *)self carIncidentsListCardViewController];
    id v5 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v4];
    v10 = v5;
    CFStringRef v6 = &v10;
LABEL_5:
    id v7 = +[NSArray arrayWithObjects:v6 count:1];

    goto LABEL_7;
  }
  id v7 = &__NSArray0__struct;
LABEL_7:

  return (NSArray *)v7;
}

- (NSArray)carFocusOrderSequences
{
  v2 = [(CarIncidentReportModeController *)self chromeViewController];
  int64_t v3 = [v2 itemRepresentingOverlays];
  int v8 = v3;
  id v4 = +[NSArray arrayWithObjects:&v8 count:1];
  id v5 = +[CarFocusOrderSequence sequenceWithItems:v4 options:5];
  id v9 = v5;
  CFStringRef v6 = +[NSArray arrayWithObjects:&v9 count:1];

  return (NSArray *)v6;
}

- (int)currentUsageTarget
{
  return 0;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (CarIncidentsListCardViewController)carIncidentsListCardViewController
{
  return self->_carIncidentsListCardViewController;
}

- (void)setCarIncidentsListCardViewController:(id)a3
{
}

- (CarIncidentReportAlertCardViewController)carIncidentReportAlertViewController
{
  return self->_carIncidentReportAlertViewController;
}

- (void)setCarIncidentReportAlertViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carIncidentReportAlertViewController, 0);
  objc_storeStrong((id *)&self->_carIncidentsListCardViewController, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_incidentLocation, 0);

  objc_storeStrong((id *)&self->_selectedIncidentLayoutItem, 0);
}

@end