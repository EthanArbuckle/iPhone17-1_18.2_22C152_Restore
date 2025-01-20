@interface CarTrafficAlertCardViewController
+ (BOOL)alertVotable:(id)a3;
- (BOOL)_alertRequiresOptIn:(id)a3;
- (BOOL)hasStartedAnimatingProgressBar;
- (BOOL)isDismissing;
- (CarTrafficAlertCardViewController)initWithDelegate:(id)a3 trafficAlert:(id)a4 response:(id)a5;
- (CarTrafficAlertCardViewControllerDelegate)delegate;
- (CarTrafficAlertView)trafficAlertView;
- (MNTrafficIncidentAlert)trafficAlert;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (NSDate)dismissTime;
- (NSDate)displayTime;
- (NSTimer)dismissTimer;
- (NSTimer)timeoutTimer;
- (id)response;
- (int)_feedbackActionTypeFor:(int64_t)a3;
- (int)_voteTypeAlertWithResult:(int64_t)a3;
- (void)_cancelDismissTimer;
- (void)_didReceiveIncidentUpdate:(id)a3;
- (void)_didVoteIncident:(int64_t)a3 onTarget:(int)a4;
- (void)_dismissTrafficAlertWithResult:(int64_t)a3;
- (void)_dismissTrafficAlertWithResult:(int64_t)a3 onTarget:(int)a4;
- (void)_recordEVAnalyticsWithResult:(int64_t)a3;
- (void)_registerForSceneNotifications;
- (void)_sceneDidActivate:(id)a3;
- (void)_sendTrafficFeedbackForAlert:(id)a3 actionType:(int)a4;
- (void)_startProgressAnimationIfNeeded;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setDismissTime:(id)a3;
- (void)setDismissTimer:(id)a3;
- (void)setDisplayTime:(id)a3;
- (void)setIsDismissing:(BOOL)a3;
- (void)setResponse:(id)a3;
- (void)setStartedAnimatingProgressBar:(BOOL)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setTrafficAlert:(id)a3;
- (void)setTrafficAlertView:(id)a3;
- (void)trafficAlertView:(id)a3 didDismissWithResult:(int64_t)a4;
- (void)updateFromTrafficAlert:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CarTrafficAlertCardViewController

- (CarTrafficAlertCardViewController)initWithDelegate:(id)a3 trafficAlert:(id)a4 response:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CarTrafficAlertCardViewController;
  v11 = [(CarTrafficAlertCardViewController *)&v16 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_trafficAlert, a4);
    id v13 = objc_retainBlock(v10);
    id response = v12->_response;
    v12->_id response = v13;
  }
  return v12;
}

- (void)loadView
{
  v3 = [CarTrafficAlertView alloc];
  v4 = [(CarTrafficAlertCardViewController *)self trafficAlert];
  v6 = [(CarTrafficAlertView *)v3 initWithDelegate:self trafficAlert:v4];

  [(CarTrafficAlertView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CarTrafficAlertCardViewController *)self setView:v6];
  [(CarTrafficAlertCardViewController *)self setTrafficAlertView:v6];
  v5 = [(CarTrafficAlertCardViewController *)self trafficAlert];
  [(CarTrafficAlertCardViewController *)self _sendTrafficFeedbackForAlert:v5 actionType:4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarTrafficAlertCardViewController;
  [(CarTrafficAlertCardViewController *)&v8 viewWillAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_didReceiveIncidentUpdate:" name:@"SiriTrafficIncidentUpdateNotification" object:0];

  v5 = [(MNTrafficIncidentAlert *)self->_trafficAlert analyticsMessage];

  if (v5)
  {
    v6 = +[MKMapService sharedService];
    v7 = [(MNTrafficIncidentAlert *)self->_trafficAlert analyticsMessage];
    [v6 captureUserAction:248 onTarget:1001 eventValue:v7];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CarTrafficAlertCardViewController;
  [(CarTrafficAlertCardViewController *)&v9 viewDidAppear:a3];
  v4 = [(CarTrafficAlertCardViewController *)self view];
  v5 = [v4 window];
  v6 = [v5 windowScene];
  id v7 = [v6 activationState];

  if (v7) {
    [(CarTrafficAlertCardViewController *)self _registerForSceneNotifications];
  }
  else {
    [(CarTrafficAlertCardViewController *)self _startProgressAnimationIfNeeded];
  }
  objc_super v8 = +[NSDate date];
  [(CarTrafficAlertCardViewController *)self setDisplayTime:v8];

  [(CarTrafficAlertCardViewController *)self setDismissTime:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CarTrafficAlertCardViewController;
  [(CarTrafficAlertCardViewController *)&v5 viewWillDisappear:a3];
  [(CarTrafficAlertCardViewController *)self _cancelDismissTimer];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)_registerForSceneNotifications
{
  v3 = [(CarTrafficAlertCardViewController *)self view];
  v4 = [v3 window];
  objc_super v5 = [v4 windowScene];

  if (!v5)
  {
    v6 = sub_100015DB4();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    id v7 = self;
    if (!v7)
    {
      v12 = @"<nil>";
      goto LABEL_12;
    }
    objc_super v8 = (objc_class *)objc_opt_class();
    objc_super v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      id v10 = [(CarTrafficAlertCardViewController *)v7 performSelector:"accessibilityIdentifier"];
      v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_10;
      }
    }
    v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_10:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{public}@] CarTrafficAlert card failed to get scene to register for lifecycle events.", buf, 0xCu);

    goto LABEL_13;
  }
  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_sceneDidActivate:" name:UISceneDidActivateNotification object:v5];
LABEL_13:
}

- (void)_sceneDidActivate:(id)a3
{
  if (![(CarTrafficAlertCardViewController *)self hasStartedAnimatingProgressBar])
  {
    [(CarTrafficAlertCardViewController *)self _startProgressAnimationIfNeeded];
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self];
  }
}

- (void)_startProgressAnimationIfNeeded
{
  if (![(CarTrafficAlertCardViewController *)self hasStartedAnimatingProgressBar])
  {
    if ([(CarTrafficAlertCardViewController *)self isViewLoaded])
    {
      v3 = [(CarTrafficAlertCardViewController *)self view];
      id v4 = [v3 window];

      if (v4)
      {
        objc_super v5 = [(CarTrafficAlertCardViewController *)self trafficAlert];
        uint64_t v6 = [v5 shouldShowTimer] ^ 1;
        id v7 = [(CarTrafficAlertCardViewController *)self trafficAlertView];
        [v7 setProgressBarHidden:v6];

        objc_super v8 = [(CarTrafficAlertCardViewController *)self trafficAlert];
        [v8 alertDisplayDuration];
        double v10 = v9;

        if (v10 > 0.0)
        {
          v11 = [(CarTrafficAlertCardViewController *)self trafficAlert];
          unsigned int v12 = [v11 shouldShowTimer];

          if (v12)
          {
            objc_initWeak(&location, self);
            id v13 = [(CarTrafficAlertCardViewController *)self trafficAlertView];
            [v13 setAcceptProgress:0.0];

            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_1003A7328;
            v17[3] = &unk_1012E6708;
            objc_copyWeak(&v18, &location);
            +[UIView animateWithDuration:v17 animations:0 completion:v10];
            [(CarTrafficAlertCardViewController *)self setStartedAnimatingProgressBar:1];
            [(CarTrafficAlertCardViewController *)self _cancelDismissTimer];
            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472;
            v15[2] = sub_1003A7384;
            v15[3] = &unk_1012E73C8;
            objc_copyWeak(&v16, &location);
            v14 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v15 block:v10];
            [(CarTrafficAlertCardViewController *)self setDismissTimer:v14];

            objc_destroyWeak(&v16);
            objc_destroyWeak(&v18);
            objc_destroyWeak(&location);
          }
        }
      }
    }
  }
}

- (void)_cancelDismissTimer
{
  v3 = [(CarTrafficAlertCardViewController *)self dismissTimer];
  [v3 invalidate];

  [(CarTrafficAlertCardViewController *)self setDismissTimer:0];
}

- (void)updateFromTrafficAlert:(id)a3
{
  id v4 = a3;
  [(CarTrafficAlertCardViewController *)self setTrafficAlert:v4];
  objc_super v5 = [(CarTrafficAlertCardViewController *)self trafficAlertView];
  [v5 setTrafficAlert:v4];

  [(CarTrafficAlertCardViewController *)self _startProgressAnimationIfNeeded];
}

- (void)_dismissTrafficAlertWithResult:(int64_t)a3
{
  [(CarTrafficAlertCardViewController *)self setStartedAnimatingProgressBar:0];

  [(CarTrafficAlertCardViewController *)self _dismissTrafficAlertWithResult:a3 onTarget:1001];
}

- (void)_dismissTrafficAlertWithResult:(int64_t)a3 onTarget:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(CarTrafficAlertCardViewController *)self _cancelDismissTimer];
  obj = self;
  objc_sync_enter(obj);
  if (![(CarTrafficAlertCardViewController *)obj isDismissing])
  {
    [(CarTrafficAlertCardViewController *)obj setIsDismissing:1];
    objc_sync_exit(obj);

    id v7 = (id)[(CarTrafficAlertCardViewController *)obj _feedbackActionTypeFor:a3];
    objc_super v8 = sub_100015DB4();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    double v9 = obj;
    if (!v9)
    {
      v14 = @"<nil>";
      goto LABEL_14;
    }
    double v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v12 = [(CarTrafficAlertCardViewController *)v9 performSelector:"accessibilityIdentifier"];
      id v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_12;
      }
    }
    v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_12:

LABEL_14:
    *(_DWORD *)buf = 138543618;
    v45 = v14;
    __int16 v46 = 1024;
    LODWORD(v47) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] CarTrafficAlertCardViewController: Dismissing TrafficAlert with actionType: %d", buf, 0x12u);

LABEL_15:
    if (v7 == 1)
    {
      uint64_t v17 = 1;
    }
    else if (v7 == 3)
    {
      v15 = [(CarTrafficAlertCardViewController *)obj trafficAlert];
      unsigned int v16 = [(CarTrafficAlertCardViewController *)obj _alertRequiresOptIn:v15];

      uint64_t v17 = v16 ^ 1;
    }
    else
    {
      uint64_t v17 = 0;
    }
    id v18 = [(CarTrafficAlertCardViewController *)obj response];
    BOOL v19 = v18 == 0;

    if (!v19)
    {
      v20 = [(CarTrafficAlertCardViewController *)obj response];
      v20[2](v20, v17);

      [(CarTrafficAlertCardViewController *)obj setResponse:0];
    }
    v21 = +[NSDate date];
    [(CarTrafficAlertCardViewController *)obj setDismissTime:v21];

    v22 = [(CarTrafficAlertCardViewController *)obj trafficAlert];
    [(CarTrafficAlertCardViewController *)obj _sendTrafficFeedbackForAlert:v22 actionType:v7];

    v23 = [(MNTrafficIncidentAlert *)obj->_trafficAlert originalRoute];
    LODWORD(v22) = [v23 isEVRoute];

    if (v22)
    {
      [(CarTrafficAlertCardViewController *)obj _recordEVAnalyticsWithResult:a3];
    }
    else
    {
      v24 = [(MNTrafficIncidentAlert *)obj->_trafficAlert analyticsMessage];

      if (v24)
      {
        if (a3 == 2)
        {
          v27 = +[MKMapService sharedService];
          v28 = [(MNTrafficIncidentAlert *)obj->_trafficAlert analyticsMessage];
          [v27 captureUserAction:3061 onTarget:1001 eventValue:v28];
        }
        else if (a3 == 1)
        {
          v25 = +[MKMapService sharedService];
          v26 = [(MNTrafficIncidentAlert *)obj->_trafficAlert analyticsMessage];
          [v25 captureUserAction:3060 onTarget:1001 eventValue:v26];
        }
      }
    }
    v29 = +[IPCServer sharedServer];
    v30 = [(CarTrafficAlertCardViewController *)obj trafficAlert];
    [v29 dismissTrafficIncidentAlert:v30];

    v31 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
    v32 = [(CarTrafficAlertCardViewController *)obj trafficAlert];
    v33 = [v32 alertID];
    [v31 clearTrafficIncidentBulletinWithAlertID:v33];

    v34 = [(CarTrafficAlertCardViewController *)obj trafficAlert];
    LODWORD(v32) = +[CarTrafficAlertCardViewController alertVotable:v34];

    if (!v32) {
      goto LABEL_38;
    }
    v35 = sub_100015DB4();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
LABEL_37:

      [(CarTrafficAlertCardViewController *)obj _didVoteIncident:a3 onTarget:v4];
LABEL_38:
      v42 = [(CarTrafficAlertCardViewController *)obj delegate];
      [v42 trafficAlertCardViewControllerDismiss:obj];

      [(CarTrafficAlertCardViewController *)obj setIsDismissing:0];
      return;
    }
    v36 = obj;
    v37 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v37);
    if (objc_opt_respondsToSelector())
    {
      v39 = [(CarTrafficAlertCardViewController *)v36 performSelector:"accessibilityIdentifier"];
      v40 = v39;
      if (v39 && ![v39 isEqualToString:v38])
      {
        v41 = +[NSString stringWithFormat:@"%@<%p, %@>", v38, v36, v40];

        goto LABEL_36;
      }
    }
    v41 = +[NSString stringWithFormat:@"%@<%p>", v38, v36];
LABEL_36:

    *(_DWORD *)buf = 138543618;
    v45 = v41;
    __int16 v46 = 2048;
    int64_t v47 = a3;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "[%{public}@] CarTrafficAlertCardViewController: did vote on TrafficAlert: %ld", buf, 0x16u);

    goto LABEL_37;
  }
  objc_sync_exit(obj);
}

- (void)_recordEVAnalyticsWithResult:(int64_t)a3
{
  objc_super v5 = [(MNTrafficIncidentAlert *)self->_trafficAlert originalRoute];
  uint64_t v6 = [v5 waypoints];
  id v7 = [v6 count];
  objc_super v8 = [(MNTrafficIncidentAlert *)self->_trafficAlert alternateRoute];
  double v9 = [v8 waypoints];
  id v10 = [v9 count];

  if (v7 != v10)
  {
    v11 = +[NavigationFeedbackCollector sharedFeedbackCollector];
    unsigned int v12 = [(MNTrafficIncidentAlert *)self->_trafficAlert alternateRoute];
    [v11 offeredEVRerouteWithAlternateRoute:v12 wasAccepted:0];
  }
  id v13 = [(MNTrafficIncidentAlert *)self->_trafficAlert originalRoute];
  if ([v13 isEVRoute])
  {
    v14 = [(MNTrafficIncidentAlert *)self->_trafficAlert alternateRoute];

    if (v14)
    {
      v15 = +[MKMapService sharedService];
      id v29 = v15;
      uint64_t v16 = 6097;
LABEL_11:
      uint64_t v21 = 1001;
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v17 = [(MNTrafficIncidentAlert *)self->_trafficAlert originalRoute];
  if (([v17 isEVRoute] & 1) == 0)
  {

LABEL_16:
    v22 = sub_100015DB4();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
LABEL_23:

      return;
    }
    v23 = self;
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    if (objc_opt_respondsToSelector())
    {
      v26 = [(CarTrafficAlertCardViewController *)v23 performSelector:"accessibilityIdentifier"];
      v27 = v26;
      if (v26 && ![v26 isEqualToString:v25])
      {
        v28 = +[NSString stringWithFormat:@"%@<%p, %@>", v25, v23, v27];

        goto LABEL_22;
      }
    }
    v28 = +[NSString stringWithFormat:@"%@<%p>", v25, v23];
LABEL_22:

    *(_DWORD *)buf = 138543362;
    v31 = v28;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[%{public}@] CarTrafficAlertCardViewController: tried to record EV CarPlay dodgeball, but received an unsupported state.", buf, 0xCu);

    goto LABEL_23;
  }
  id v18 = [(MNTrafficIncidentAlert *)self->_trafficAlert originalRouteNavigability];
  unsigned __int8 v19 = [v18 isEvFeasible];

  if (v19) {
    goto LABEL_16;
  }
  unsigned int v20 = [(MNTrafficIncidentAlert *)self->_trafficAlert isReroute];
  v15 = +[MKMapService sharedService];
  id v29 = v15;
  if (v20)
  {
    uint64_t v16 = 6095;
    goto LABEL_11;
  }
  [v15 captureUserAction:75 onTarget:1001 eventValue:0];

  if (a3 != 1) {
    return;
  }
  v15 = +[MKMapService sharedService];
  id v29 = v15;
  uint64_t v16 = 6099;
  uint64_t v21 = 615;
LABEL_12:
  [v15 captureUserAction:v16 onTarget:v21 eventValue:0];
}

- (void)_sendTrafficFeedbackForAlert:(id)a3 actionType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v29 = a3;
  id v6 = objc_alloc_init((Class)GEOTrafficRerouteFeedback);
  id v7 = [v29 etaResponseID];
  [v6 setResponseId:v7];

  objc_super v8 = [v29 alternateRoute];
  double v9 = [v8 serverRouteID];
  [v6 setReroutedRouteID:v9];

  [v29 newEstimatedTime];
  [v6 setReroutedRouteTravelTime:v10];
  v11 = [v29 alternateRoute];
  [v6 setReroutedRouteHistoricTravelTime:[v11 historicTravelTime]];

  unsigned int v12 = [v29 originalRoute];
  id v13 = [v12 serverRouteID];
  [v6 setOldRouteID:v13];

  [v29 oldEstimatedTime];
  [v6 setOldRouteTravelTime:v14];
  [v29 oldHistoricTime];
  [v6 setOldRouteHistoricTravelTime:v15];
  uint64_t v16 = [v29 oldRouteIncidents];
  [v6 setOldRouteIncidents:v16];

  [v6 setActionType:v4];
  [v6 setBackgrounded:[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground] ^ 1];
  uint64_t v17 = [v29 bannerID];
  [v6 setDisplayedBannerId:v17];

  [v29 distanceToDestination];
  [v6 setDistanceToDestination:];
  uint64_t v18 = [(CarTrafficAlertCardViewController *)self displayTime];
  if (v18)
  {
    unsigned __int8 v19 = (void *)v18;
    unsigned int v20 = [(CarTrafficAlertCardViewController *)self dismissTime];

    if (v20)
    {
      uint64_t v21 = [(CarTrafficAlertCardViewController *)self dismissTime];
      v22 = [(CarTrafficAlertCardViewController *)self displayTime];
      [v21 timeIntervalSinceDate:v22];
      double v24 = v23;

      [v6 setBannerDurationSeconds:v24];
    }
  }
  id v25 = [v29 alertType];
  uint64_t v26 = 1;
  switch((unint64_t)v25)
  {
    case 0uLL:
    case 5uLL:
    case 7uLL:
      uint64_t v26 = 0;
      goto LABEL_10;
    case 1uLL:
      goto LABEL_10;
    case 2uLL:
    case 6uLL:
      v27 = [v29 incident:1];

      if (v27) {
        uint64_t v26 = 5;
      }
      else {
        uint64_t v26 = 3;
      }
      goto LABEL_10;
    case 3uLL:
    case 4uLL:
      uint64_t v26 = 2;
LABEL_10:
      [v6 setAlertType:v26];
      break;
    default:
      break;
  }
  v28 = +[NavigationFeedbackCollector sharedFeedbackCollector];
  [v28 addTrafficRerouteFeedback:v6];
}

- (BOOL)_alertRequiresOptIn:(id)a3
{
  id v3 = a3;
  if ([v3 alertType] == (id)2) {
    unsigned int v4 = [v3 isAutomaticReroute] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (BOOL)alertVotable:(id)a3
{
  id v3 = a3;
  if ([v3 alertType] == (id)1 || objc_msgSend(v3, "alertType") == (id)2)
  {
    unsigned int v4 = [v3 acceptButtonTitle];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_didVoteIncident:(int64_t)a3 onTarget:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = -[CarTrafficAlertCardViewController _voteTypeAlertWithResult:](self, "_voteTypeAlertWithResult:");
  if (v7 == 1)
  {
    if (a3 != 5) {
      return;
    }
    id v29 = +[MKMapService sharedService];
    objc_super v8 = [(CarTrafficAlertCardViewController *)self trafficAlert];
    id v9 = [v8 incident];
    id v10 = [v9 type];
    v11 = @"ACCIDENT";
    switch((int)v10)
    {
      case 0:
        break;
      case 1:
        v11 = @"CONSTRUCTION";
        break;
      case 2:
        v11 = @"ROAD_CLOSURE";
        break;
      case 3:
        v11 = @"EVENT";
        break;
      case 4:
        v11 = @"HAZARD";
        break;
      case 5:
        v11 = @"LANE_CLOSURE";
        break;
      case 6:
        v11 = @"RAMP_CLOSURE";
        break;
      case 7:
        v11 = @"TRAFFIC";
        break;
      case 8:
        v11 = @"WALKING_CLOSURE";
        break;
      case 9:
        v11 = @"CONGESTION_ZONE_RESTRICTION";
        break;
      case 10:
        v11 = @"LICENSE_PLATE_RESTRICTION";
        break;
      case 11:
      case 12:
        goto LABEL_31;
      case 13:
        v11 = @"SPEED_TRAP";
        break;
      case 14:
        v11 = @"AREA_INCIDENT";
        break;
      default:
        if (v10 == 100)
        {
          v11 = @"TIME_BASED_RESTRICTION";
        }
        else
        {
LABEL_31:
          v11 = +[NSString stringWithFormat:@"(unknown: %i)", v10];
        }
        break;
    }
    [v29 captureUserAction:108 onTarget:v4 eventValue:v11];
  }
  else
  {
    uint64_t v12 = v7;
    id v13 = [(CarTrafficAlertCardViewController *)self trafficAlert];
    id v29 = [v13 incident];

    objc_super v8 = [v29 incidentId];
    uint64_t v14 = +[TrafficIncidentLayoutItem geoTrafficIncidentTypeForRouteIncidentType:](TrafficIncidentLayoutItem, "geoTrafficIncidentTypeForRouteIncidentType:", [v29 type]);
    if ([v29 hasPosition])
    {
      id v15 = objc_alloc((Class)GEOLocation);
      uint64_t v16 = [v29 position];
      [v16 lat];
      double v18 = v17;
      unsigned __int8 v19 = [v29 position];
      [v19 lng];
      id v9 = [v15 initWithLatitude:v18 longitude:v20];
    }
    else
    {
      uint64_t v16 = +[MKLocationManager sharedLocationManager];
      id v9 = [v16 currentLocation];
    }

    v11 = [[TrafficIncidentReport alloc] initWithIncidentLocation:v9 type:v14 userPath:3];
    [(__CFString *)v11 setReportedFromCarplay:1];
    if (v12 == 3 && v29)
    {
      id v21 = [objc_alloc((Class)VKTrafficIncidentFeature) initWithRouteIncident:v29 routeOffsetInMeters:0 routeRelevance:0 onRoute:0];
      v22 = +[TrafficIncidentsStorageManager sharedInstance];
      [v22 removeTrafficIncidentFeature:v21];
    }
    [(__CFString *)v11 submitFeedbackForType:v12 incidentId:v8 completionHandler:0];
    double v23 = +[MKMapService sharedService];
    uint64_t v24 = +[TrafficIncidentReport actionForVoteType:v12];
    id v25 = [(CarTrafficAlertCardViewController *)self trafficAlert];
    uint64_t v26 = [v25 incident];
    id v27 = [v26 type];
    v28 = @"ACCIDENT";
    switch((int)v27)
    {
      case 0:
        break;
      case 1:
        v28 = @"CONSTRUCTION";
        break;
      case 2:
        v28 = @"ROAD_CLOSURE";
        break;
      case 3:
        v28 = @"EVENT";
        break;
      case 4:
        v28 = @"HAZARD";
        break;
      case 5:
        v28 = @"LANE_CLOSURE";
        break;
      case 6:
        v28 = @"RAMP_CLOSURE";
        break;
      case 7:
        v28 = @"TRAFFIC";
        break;
      case 8:
        v28 = @"WALKING_CLOSURE";
        break;
      case 9:
        v28 = @"CONGESTION_ZONE_RESTRICTION";
        break;
      case 10:
        v28 = @"LICENSE_PLATE_RESTRICTION";
        break;
      case 11:
      case 12:
        goto LABEL_16;
      case 13:
        v28 = @"SPEED_TRAP";
        break;
      case 14:
        v28 = @"AREA_INCIDENT";
        break;
      default:
        if (v27 == 100)
        {
          v28 = @"TIME_BASED_RESTRICTION";
        }
        else
        {
LABEL_16:
          v28 = +[NSString stringWithFormat:@"(unknown: %i)", v27];
        }
        break;
    }
    [v23 captureUserAction:v24 onTarget:v4 eventValue:v28];
  }
}

- (int)_voteTypeAlertWithResult:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 3) {
    return 1;
  }
  else {
    return dword_100F6F120[a3 - 3];
  }
}

- (NSArray)focusOrderSubItems
{
  v2 = [(CarTrafficAlertCardViewController *)self trafficAlertView];
  id v3 = [v2 focusOrderSubItems];

  return (NSArray *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = [(CarTrafficAlertCardViewController *)self trafficAlertView];
  id v3 = [v2 preferredFocusEnvironments];

  return (NSArray *)v3;
}

- (void)trafficAlertView:(id)a3 didDismissWithResult:(int64_t)a4
{
}

- (int)_feedbackActionTypeFor:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 1;
  }
  else {
    return dword_100F6F130[a3];
  }
}

- (void)_didReceiveIncidentUpdate:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKey:@"SiriTrafficIncidentIsClearKey"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 3;
  }

  [(CarTrafficAlertCardViewController *)self _dismissTrafficAlertWithResult:v7 onTarget:0];
}

- (CarTrafficAlertCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarTrafficAlertCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MNTrafficIncidentAlert)trafficAlert
{
  return self->_trafficAlert;
}

- (void)setTrafficAlert:(id)a3
{
}

- (CarTrafficAlertView)trafficAlertView
{
  return self->_trafficAlertView;
}

- (void)setTrafficAlertView:(id)a3
{
}

- (id)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (NSTimer)dismissTimer
{
  return self->_dismissTimer;
}

- (void)setDismissTimer:(id)a3
{
}

- (NSDate)displayTime
{
  return self->_displayTime;
}

- (void)setDisplayTime:(id)a3
{
}

- (NSDate)dismissTime
{
  return self->_dismissTime;
}

- (void)setDismissTime:(id)a3
{
}

- (BOOL)hasStartedAnimatingProgressBar
{
  return self->_startedAnimatingProgressBar;
}

- (void)setStartedAnimatingProgressBar:(BOOL)a3
{
  self->_startedAnimatingProgressBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissTime, 0);
  objc_storeStrong((id *)&self->_displayTime, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_response, 0);
  objc_storeStrong((id *)&self->_trafficAlertView, 0);
  objc_storeStrong((id *)&self->_trafficAlert, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end