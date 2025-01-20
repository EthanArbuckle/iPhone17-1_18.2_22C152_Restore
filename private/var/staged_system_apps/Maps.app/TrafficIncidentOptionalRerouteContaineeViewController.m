@interface TrafficIncidentOptionalRerouteContaineeViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)progressBarHidden;
- (MNTrafficIncidentAlert)incidentAlert;
- (NavTrafficIncidentAlertViewControllerDelegate)delegate;
- (NavUserDecisionConfirmationView)rerouteIncidentView;
- (TrafficIncidentOptionalRerouteContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)heightForLayout:(unint64_t)a3;
- (double)rerouteTimerProgress;
- (void)_setupConstraints;
- (void)setDelegate:(id)a3;
- (void)setIncidentAlert:(id)a3;
- (void)setProgressBarHidden:(BOOL)a3;
- (void)setRerouteIncidentView:(id)a3;
- (void)setRerouteTimerProgress:(double)a3;
- (void)userDecisionConfirmationViewDidCancel:(id)a3;
- (void)userDecisionConfirmationViewDidConfirm:(id)a3;
- (void)viewDidLoad;
@end

@implementation TrafficIncidentOptionalRerouteContaineeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (TrafficIncidentOptionalRerouteContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentOptionalRerouteContaineeViewController;
  return [(TrafficIncidentOptionalRerouteContaineeViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)TrafficIncidentOptionalRerouteContaineeViewController;
  [(ContaineeViewController *)&v6 viewDidLoad];
  v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setPresentedModally:1];

  v4 = [(TrafficIncidentOptionalRerouteContaineeViewController *)self view];
  objc_super v5 = [(TrafficIncidentOptionalRerouteContaineeViewController *)self rerouteIncidentView];
  [v4 addSubview:v5];

  [(TrafficIncidentOptionalRerouteContaineeViewController *)self _setupConstraints];
}

- (void)_setupConstraints
{
  v18 = [(TrafficIncidentOptionalRerouteContaineeViewController *)self rerouteIncidentView];
  v16 = [v18 leadingAnchor];
  v17 = [(TrafficIncidentOptionalRerouteContaineeViewController *)self view];
  v15 = [v17 leadingAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v19[0] = v14;
  v13 = [(TrafficIncidentOptionalRerouteContaineeViewController *)self rerouteIncidentView];
  v3 = [v13 trailingAnchor];
  v4 = [(TrafficIncidentOptionalRerouteContaineeViewController *)self view];
  objc_super v5 = [v4 trailingAnchor];
  objc_super v6 = [v3 constraintEqualToAnchor:v5];
  v19[1] = v6;
  v7 = [(TrafficIncidentOptionalRerouteContaineeViewController *)self rerouteIncidentView];
  v8 = [v7 topAnchor];
  v9 = [(TrafficIncidentOptionalRerouteContaineeViewController *)self view];
  v10 = [v9 topAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v19[2] = v11;
  v12 = +[NSArray arrayWithObjects:v19 count:3];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (NavUserDecisionConfirmationView)rerouteIncidentView
{
  rerouteIncidentView = self->_rerouteIncidentView;
  if (!rerouteIncidentView)
  {
    v4 = -[NavUserDecisionConfirmationView initWithFrame:]([NavUserDecisionConfirmationView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_super v5 = self->_rerouteIncidentView;
    self->_rerouteIncidentView = v4;

    [(NavUserDecisionConfirmationView *)self->_rerouteIncidentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(NavUserDecisionConfirmationView *)self->_rerouteIncidentView setDelegate:self];
    rerouteIncidentView = self->_rerouteIncidentView;
  }

  return rerouteIncidentView;
}

- (void)setIncidentAlert:(id)a3
{
  objc_super v6 = (MNTrafficIncidentAlert *)a3;
  if (self->_incidentAlert != v6)
  {
    objc_storeStrong((id *)&self->_incidentAlert, a3);
    objc_super v5 = [(TrafficIncidentOptionalRerouteContaineeViewController *)self rerouteIncidentView];
    +[NavTrafficIncidentViewComposer configureRerouteView:v5 withTrafficIncidentAlert:v6];
  }
}

- (void)setRerouteTimerProgress:(double)a3
{
}

- (double)rerouteTimerProgress
{
  [(NavUserDecisionConfirmationView *)self->_rerouteIncidentView completionProgress];
  return result;
}

- (void)setProgressBarHidden:(BOOL)a3
{
}

- (BOOL)progressBarHidden
{
  return [(NavUserDecisionConfirmationView *)self->_rerouteIncidentView progressBarHidden];
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3 = -1.0;
  if (a3 == 5)
  {
    objc_super v5 = [(TrafficIncidentOptionalRerouteContaineeViewController *)self rerouteIncidentView];
    [v5 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
    double v7 = v6;
    v8 = [(ContaineeViewController *)self cardPresentationController];
    [v8 bottomSafeOffset];
    double v3 = v7 + v9;
  }
  return v3;
}

- (void)userDecisionConfirmationViewDidCancel:(id)a3
{
  v4 = [(TrafficIncidentOptionalRerouteContaineeViewController *)self delegate];
  [v4 didTapRejectButtonOnTrafficIncidentAlertViewControllerTarget:739];

  objc_super v5 = [(MNTrafficIncidentAlert *)self->_incidentAlert originalRoute];
  if ([v5 isEVRoute])
  {
    double v6 = [(MNTrafficIncidentAlert *)self->_incidentAlert originalRouteNavigability];
    unsigned int v7 = [v6 isEvFeasible];

    if (!v7)
    {
      v8 = [(MNTrafficIncidentAlert *)self->_incidentAlert alternateRoute];

      if (!v8) {
        return;
      }
      id v11 = +[NavigationFeedbackCollector sharedFeedbackCollector];
      double v9 = [(MNTrafficIncidentAlert *)self->_incidentAlert alternateRoute];
      [v11 offeredEVRerouteWithAlternateRoute:v9 wasAccepted:0];
      goto LABEL_8;
    }
  }
  else
  {
  }
  v10 = [(MNTrafficIncidentAlert *)self->_incidentAlert analyticsMessage];

  id v11 = +[MKMapService sharedService];
  if (!v10)
  {
    [v11 captureUserAction:3061 onTarget:615 eventValue:0];
    goto LABEL_10;
  }
  double v9 = [(MNTrafficIncidentAlert *)self->_incidentAlert analyticsMessage];
  [v11 captureUserAction:3061 onTarget:401 eventValue:v9];
LABEL_8:

LABEL_10:
}

- (void)userDecisionConfirmationViewDidConfirm:(id)a3
{
  v4 = [(TrafficIncidentOptionalRerouteContaineeViewController *)self delegate];
  [v4 didTapAcceptButtonOnTrafficIncidentAlertViewControllerTarget:739];

  objc_super v5 = [(MNTrafficIncidentAlert *)self->_incidentAlert originalRoute];
  if (([v5 isEVRoute] & 1) == 0)
  {

    goto LABEL_6;
  }
  double v6 = [(MNTrafficIncidentAlert *)self->_incidentAlert alternateRoute];

  if (!v6)
  {
LABEL_6:
    id v10 = +[MKMapService sharedService];
    double v9 = [(MNTrafficIncidentAlert *)self->_incidentAlert analyticsMessage];
    [v10 captureUserAction:3060 onTarget:401 eventValue:v9];
    goto LABEL_7;
  }
  unsigned int v7 = +[MKMapService sharedService];
  [v7 captureUserAction:6097 onTarget:615 eventValue:0];

  v8 = [(MNTrafficIncidentAlert *)self->_incidentAlert alternateRoute];

  if (!v8) {
    return;
  }
  id v10 = +[NavigationFeedbackCollector sharedFeedbackCollector];
  double v9 = [(MNTrafficIncidentAlert *)self->_incidentAlert alternateRoute];
  [v10 offeredEVRerouteWithAlternateRoute:v9 wasAccepted:0];
LABEL_7:
}

- (MNTrafficIncidentAlert)incidentAlert
{
  return self->_incidentAlert;
}

- (NavTrafficIncidentAlertViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavTrafficIncidentAlertViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setRerouteIncidentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rerouteIncidentView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_incidentAlert, 0);
}

@end