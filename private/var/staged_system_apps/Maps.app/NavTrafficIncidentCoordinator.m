@interface NavTrafficIncidentCoordinator
- (BOOL)_alertRequiresOptIn:(id)a3;
- (BOOL)_alertVotable:(id)a3;
- (BOOL)_hasValidRerouteTimer;
- (BOOL)isDismissing;
- (MNTrafficIncidentAlert)presentedAlert;
- (NSDate)dismissTime;
- (NSDate)displayTime;
- (NSTimer)timeoutTimer;
- (NavTrafficIncidentAlertViewController)alertViewController;
- (NavTrafficIncidentContaineeViewController)trafficIncidentViewController;
- (NavTrafficIncidentCoordinator)init;
- (NavTrafficIncidentPresentation)presentationDelegate;
- (TrafficIncidentOptionalRerouteContaineeViewController)rerouteTrafficIncidentViewController;
- (double)_timeoutTimerProgress;
- (id)responseCallback;
- (int)_GEOTrafficFeedbackTypeForAction:(int64_t)a3;
- (int)_voteTypeAlertWithResult:(int64_t)a3;
- (void)_animateProgressWithDuration:(double)a3 startValue:(double)a4;
- (void)_didBecomeActive:(id)a3;
- (void)_didVoteAlert:(id)a3 type:(int)a4 target:(int)a5;
- (void)_dismissTrafficAlertWithActionType:(int64_t)a3 target:(int)a4;
- (void)_dismissTrafficAlertWithTimer:(id)a3;
- (void)_getTimeoutTimerProgress:(double *)a3 timeRemaining:(double *)a4;
- (void)_sendTrafficFeedbackForAlert:(id)a3 actionType:(int)a4;
- (void)_updateProgressTimerForAlert:(id)a3;
- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4;
- (void)didTapAcceptButtonOnTrafficIncidentAlertViewControllerTarget:(int)a3;
- (void)didTapRejectButtonOnTrafficIncidentAlertViewControllerTarget:(int)a3;
- (void)dismissAlertViewForTrafficIncidentAlert:(id)a3 acceptedNewRoute:(BOOL)a4;
- (void)dismissAlertViewForTrafficIncidentAlert:(id)a3 actionType:(int64_t)a4 target:(int)a5;
- (void)dismissVisibleTrafficAlertView:(BOOL)a3;
- (void)presentAlertViewForTrafficIncidentAlert:(id)a3 responseCallback:(id)a4;
- (void)setDismissTime:(id)a3;
- (void)setDisplayTime:(id)a3;
- (void)setIsDismissing:(BOOL)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setPresentedAlert:(id)a3;
- (void)setResponseCallback:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)updatedAlertViewWithTrafficIncidentAlert:(id)a3;
@end

@implementation NavTrafficIncidentCoordinator

- (NavTrafficIncidentCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)NavTrafficIncidentCoordinator;
  v2 = [(NavTrafficIncidentCoordinator *)&v6 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_didBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    v4 = v2;
  }

  return v2;
}

- (TrafficIncidentOptionalRerouteContaineeViewController)rerouteTrafficIncidentViewController
{
  rerouteTrafficIncidentViewController = self->_rerouteTrafficIncidentViewController;
  if (!rerouteTrafficIncidentViewController)
  {
    v4 = [[TrafficIncidentOptionalRerouteContaineeViewController alloc] initWithNibName:0 bundle:0];
    v5 = self->_rerouteTrafficIncidentViewController;
    self->_rerouteTrafficIncidentViewController = v4;

    [(TrafficIncidentOptionalRerouteContaineeViewController *)self->_rerouteTrafficIncidentViewController setDelegate:self];
    rerouteTrafficIncidentViewController = self->_rerouteTrafficIncidentViewController;
  }

  return rerouteTrafficIncidentViewController;
}

- (NavTrafficIncidentContaineeViewController)trafficIncidentViewController
{
  trafficIncidentViewController = self->_trafficIncidentViewController;
  if (!trafficIncidentViewController)
  {
    v4 = [[NavTrafficIncidentContaineeViewController alloc] initWithNibName:0 bundle:0];
    v5 = self->_trafficIncidentViewController;
    self->_trafficIncidentViewController = v4;

    [(ContaineeViewController *)self->_trafficIncidentViewController setContaineeDelegate:self];
    [(NavTrafficIncidentContaineeViewController *)self->_trafficIncidentViewController setDelegate:self];
    trafficIncidentViewController = self->_trafficIncidentViewController;
  }

  return trafficIncidentViewController;
}

- (NavTrafficIncidentAlertViewController)alertViewController
{
  v3 = [(NavTrafficIncidentCoordinator *)self presentedAlert];

  if (v3)
  {
    v4 = [(NavTrafficIncidentCoordinator *)self presentedAlert];
    unint64_t v5 = (unint64_t)[v4 alertType];

    objc_super v6 = 0;
    if (v5 <= 6)
    {
      if (((1 << v5) & 0x66) != 0)
      {
        objc_super v6 = [(NavTrafficIncidentCoordinator *)self trafficIncidentViewController];
      }
      else if (((1 << v5) & 0x18) != 0)
      {
        objc_super v6 = [(NavTrafficIncidentCoordinator *)self rerouteTrafficIncidentViewController];
      }
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return (NavTrafficIncidentAlertViewController *)v6;
}

- (void)presentAlertViewForTrafficIncidentAlert:(id)a3 responseCallback:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = a4;
    [(NavTrafficIncidentCoordinator *)self setPresentedAlert:v6];
    [(NavTrafficIncidentCoordinator *)self setResponseCallback:v7];

    v8 = +[NSDate date];
    [(NavTrafficIncidentCoordinator *)self setDisplayTime:v8];

    [(NavTrafficIncidentCoordinator *)self setDismissTime:0];
    unsigned int v9 = [v6 isReroute];
    [v6 alertDisplayDuration];
    double v11 = v10;
    BOOL v12 = 1;
    if ([v6 shouldShowTimer] && v11 > 0.0) {
      BOOL v12 = [(NavTrafficIncidentCoordinator *)self _alertRequiresOptIn:v6];
    }
    if (v9)
    {
      v13 = [(NavTrafficIncidentCoordinator *)self rerouteTrafficIncidentViewController];
      v14 = [v13 cardPresentationController];
      [v14 setPresentedModally:1];
    }
    v15 = [(NavTrafficIncidentCoordinator *)self alertViewController];
    [v15 setIncidentAlert:v6];

    v16 = [(NavTrafficIncidentCoordinator *)self alertViewController];
    [v16 setProgressBarHidden:v12];

    v17 = [(NavTrafficIncidentCoordinator *)self presentationDelegate];
    v18 = [(NavTrafficIncidentCoordinator *)self alertViewController];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1004F1318;
    v27[3] = &unk_1012ED4B8;
    v27[4] = self;
    id v19 = v6;
    id v28 = v19;
    char v29 = v9;
    [v17 presentTrafficIncidentViewController:v18 completion:v27];

    v20 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
    v21 = [v19 alertID];
    id v22 = [v19 isReroute];
    v23 = [v19 alertTitles];
    v24 = [v23 firstObject];
    v25 = [v19 alertDescriptions];
    v26 = [v25 firstObject];
    [v20 showTrafficIncidentAlertWithID:v21 withReroute:v22 title:v24 description:v26];

    [(NavTrafficIncidentCoordinator *)self _sendTrafficFeedbackForAlert:v19 actionType:4];
  }
}

- (void)_updateProgressTimerForAlert:(id)a3
{
  id v14 = a3;
  [v14 alertDisplayDuration];
  double v5 = v4;
  if (![v14 shouldShowTimer] || v5 <= 0.0)
  {
    BOOL v12 = [(NavTrafficIncidentCoordinator *)self alertViewController];
    [v12 setProgressBarHidden:1];

    v13 = [(NavTrafficIncidentCoordinator *)self timeoutTimer];
    [v13 invalidate];

    goto LABEL_7;
  }
  BOOL v6 = [(NavTrafficIncidentCoordinator *)self _alertRequiresOptIn:v14];
  id v7 = [(NavTrafficIncidentCoordinator *)self alertViewController];
  [v7 setProgressBarHidden:v6];

  v8 = [(NavTrafficIncidentCoordinator *)self timeoutTimer];
  [v8 invalidate];

  if (v6)
  {
LABEL_7:
    [(NavTrafficIncidentCoordinator *)self setTimeoutTimer:0];
    goto LABEL_8;
  }
  unsigned int v9 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_dismissTrafficAlertWithTimer:" selector:v14 userInfo:0 repeats:v5];
  [(NavTrafficIncidentCoordinator *)self setTimeoutTimer:v9];

  double v10 = [(NavTrafficIncidentCoordinator *)self alertViewController];
  unsigned __int8 v11 = [v10 progressBarHidden];

  if ((v11 & 1) == 0) {
    [(NavTrafficIncidentCoordinator *)self _animateProgressWithDuration:v5 startValue:0.0];
  }
LABEL_8:
}

- (void)dismissAlertViewForTrafficIncidentAlert:(id)a3 acceptedNewRoute:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  [(NavTrafficIncidentCoordinator *)self dismissAlertViewForTrafficIncidentAlert:a3 actionType:v4 target:739];
}

- (void)dismissAlertViewForTrafficIncidentAlert:(id)a3 actionType:(int64_t)a4 target:(int)a5
{
  id v7 = a3;
  id v8 = [(NavTrafficIncidentCoordinator *)self presentedAlert];

  if (v8 == v7)
  {
    [(NavTrafficIncidentCoordinator *)self _dismissTrafficAlertWithActionType:a4 target:739];
  }
}

- (void)dismissVisibleTrafficAlertView:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 6;
  }
  [(NavTrafficIncidentCoordinator *)self _dismissTrafficAlertWithActionType:v3 target:739];
}

- (void)updatedAlertViewWithTrafficIncidentAlert:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 bannerID];
  double v5 = [(NavTrafficIncidentCoordinator *)self presentedAlert];
  BOOL v6 = [v5 bannerID];
  unsigned int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    id v8 = [(NavTrafficIncidentCoordinator *)self presentedAlert];
    unsigned int v9 = [v8 shouldShowTimer];
    unsigned int v10 = [v12 shouldShowTimer];

    if (v9 != v10) {
      [(NavTrafficIncidentCoordinator *)self _updateProgressTimerForAlert:v12];
    }
    [(NavTrafficIncidentCoordinator *)self setPresentedAlert:v12];
    unsigned __int8 v11 = [(NavTrafficIncidentCoordinator *)self alertViewController];
    [v11 setIncidentAlert:v12];
  }
}

- (void)didTapRejectButtonOnTrafficIncidentAlertViewControllerTarget:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = [(NavTrafficIncidentCoordinator *)self alertViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 4;
  }

  id v7 = [(NavTrafficIncidentCoordinator *)self presentedAlert];
  [(NavTrafficIncidentCoordinator *)self dismissAlertViewForTrafficIncidentAlert:v7 actionType:v6 target:v3];
}

- (void)didTapAcceptButtonOnTrafficIncidentAlertViewControllerTarget:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = [(NavTrafficIncidentCoordinator *)self alertViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 3;
  }

  id v7 = [(NavTrafficIncidentCoordinator *)self presentedAlert];
  [(NavTrafficIncidentCoordinator *)self dismissAlertViewForTrafficIncidentAlert:v7 actionType:v6 target:v3];
}

- (void)_didVoteAlert:(id)a3 type:(int)a4 target:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v36 = v8;
  if (v6 != 4 || (BOOL v9 = [v8 acceptButtonDisplay] == 1, v8 = v36, v9))
  {
    unsigned int v10 = [v8 incident];
    unsigned __int8 v11 = [v10 incidentId];

    id v12 = [v36 incident];
    if ([v12 hasPosition])
    {
      id v13 = objc_alloc((Class)GEOLocation);
      id v14 = [v36 incident];
      v15 = [v14 position];
      [v15 lat];
      double v17 = v16;
      v18 = [v36 incident];
      id v19 = [v18 position];
      [v19 lng];
      id v21 = [v13 initWithLatitude:v17 longitude:v20];
    }
    else
    {
      id v14 = +[MKLocationManager sharedLocationManager];
      id v21 = [v14 currentLocation];
    }

    id v22 = [v36 incident];
    uint64_t v23 = +[TrafficIncidentLayoutItem geoTrafficIncidentTypeForRouteIncidentType:](TrafficIncidentLayoutItem, "geoTrafficIncidentTypeForRouteIncidentType:", [v22 type]);

    v24 = [[TrafficIncidentReport alloc] initWithIncidentLocation:v21 type:v23 userPath:3];
    v25 = [v36 incident];

    if (v6 == 3 && v25)
    {
      id v26 = objc_alloc((Class)VKTrafficIncidentFeature);
      v27 = [v36 incident];
      id v28 = [v26 initWithRouteIncident:v27 routeOffsetInMeters:0 routeRelevance:0 onRoute:0];

      char v29 = +[TrafficIncidentsStorageManager sharedInstance];
      [v29 removeTrafficIncidentFeature:v28];
    }
    [(TrafficIncidentReport *)v24 submitFeedbackForType:v6 incidentId:v11 completionHandler:0];
    v30 = +[MKMapService sharedService];
    uint64_t v31 = +[TrafficIncidentReport actionForVoteType:v6];
    v32 = [(NavTrafficIncidentCoordinator *)self presentedAlert];
    v33 = [v32 incident];
    id v34 = [v33 type];
    v35 = @"ACCIDENT";
    switch((int)v34)
    {
      case 0:
        break;
      case 1:
        v35 = @"CONSTRUCTION";
        break;
      case 2:
        v35 = @"ROAD_CLOSURE";
        break;
      case 3:
        v35 = @"EVENT";
        break;
      case 4:
        v35 = @"HAZARD";
        break;
      case 5:
        v35 = @"LANE_CLOSURE";
        break;
      case 6:
        v35 = @"RAMP_CLOSURE";
        break;
      case 7:
        v35 = @"TRAFFIC";
        break;
      case 8:
        v35 = @"WALKING_CLOSURE";
        break;
      case 9:
        v35 = @"CONGESTION_ZONE_RESTRICTION";
        break;
      case 10:
        v35 = @"LICENSE_PLATE_RESTRICTION";
        break;
      case 11:
      case 12:
        goto LABEL_14;
      case 13:
        v35 = @"SPEED_TRAP";
        break;
      case 14:
        v35 = @"AREA_INCIDENT";
        break;
      default:
        if (v34 == 100)
        {
          v35 = @"TIME_BASED_RESTRICTION";
        }
        else
        {
LABEL_14:
          v35 = +[NSString stringWithFormat:@"(unknown: %i)", v34];
        }
        break;
    }
    [v30 captureUserAction:v31 onTarget:v5 eventValue:v35];

    id v8 = v36;
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

- (int)_GEOTrafficFeedbackTypeForAction:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return dword_100F6F9E8[a3 - 1];
  }
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  id v11 = [(NavTrafficIncidentCoordinator *)self presentedAlert];
  uint64_t v5 = [v11 originalRoute];
  if ([v5 isEVRoute])
  {
    uint64_t v6 = [v11 originalRouteNavigability];
    unsigned __int8 v7 = [v6 isEvFeasible];

    if ((v7 & 1) == 0)
    {
      id v8 = +[MKMapService sharedService];
      BOOL v9 = v8;
      uint64_t v10 = 6099;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v8 = +[MKMapService sharedService];
  BOOL v9 = v8;
  uint64_t v10 = 3059;
LABEL_6:
  [v8 captureUserAction:v10 onTarget:615 eventValue:0];

  [(NavTrafficIncidentCoordinator *)self dismissAlertViewForTrafficIncidentAlert:v11 actionType:5 target:739];
}

- (void)_dismissTrafficAlertWithTimer:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 userInfo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [v11 userInfo];
  }
  else {
  uint64_t v6 = [(NavTrafficIncidentCoordinator *)self presentedAlert];
  }
  unsigned __int8 v7 = [(NavTrafficIncidentCoordinator *)self presentedAlert];
  id v8 = [v7 bannerID];
  BOOL v9 = [v6 bannerID];
  unsigned int v10 = [v8 isEqualToString:v9];

  if (v10) {
    [(NavTrafficIncidentCoordinator *)self _dismissTrafficAlertWithActionType:6 target:739];
  }
}

- (void)_dismissTrafficAlertWithActionType:(int64_t)a3 target:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  obj = self;
  objc_sync_enter(obj);
  if ([(NavTrafficIncidentCoordinator *)obj isDismissing]
    || ([(NavTrafficIncidentCoordinator *)obj presentedAlert],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    objc_sync_exit(obj);
  }
  else
  {
    [(NavTrafficIncidentCoordinator *)obj setIsDismissing:1];
    objc_sync_exit(obj);

    unsigned __int8 v7 = +[NSDate date];
    [(NavTrafficIncidentCoordinator *)obj setDismissTime:v7];

    id v8 = [(NavTrafficIncidentCoordinator *)obj timeoutTimer];
    [v8 invalidate];

    if (qword_10160EF30 != -1) {
      dispatch_once(&qword_10160EF30, &stru_1012ED4D8);
    }
    BOOL v9 = qword_10160EF28;
    if (os_log_type_enabled((os_log_t)qword_10160EF28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v24 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Dismissing TrafficAlert with actionType: %ld", buf, 0xCu);
    }
    unsigned int v10 = [(NavTrafficIncidentCoordinator *)obj alertViewController];
    id v11 = [(NavTrafficIncidentCoordinator *)obj presentedAlert];
    [(NavTrafficIncidentCoordinator *)obj setPresentedAlert:0];
    id v12 = [(NavTrafficIncidentCoordinator *)obj responseCallback];
    BOOL v13 = v12 == 0;

    if (!v13)
    {
      id v14 = obj;
      if (a3 == 1)
      {
        uint64_t v15 = 1;
      }
      else if (a3 == 6)
      {
        uint64_t v15 = [(NavTrafficIncidentCoordinator *)obj _alertRequiresOptIn:v11] ^ 1;
        id v14 = obj;
      }
      else
      {
        uint64_t v15 = 0;
      }
      double v16 = [(NavTrafficIncidentCoordinator *)v14 responseCallback];
      v16[2](v16, v15);

      [(NavTrafficIncidentCoordinator *)obj setResponseCallback:0];
    }
    double v17 = [(NavTrafficIncidentCoordinator *)obj presentationDelegate];
    [v17 dismissTrafficIncidentViewController:v10];

    [(NavTrafficIncidentCoordinator *)obj _sendTrafficFeedbackForAlert:v11 actionType:[(NavTrafficIncidentCoordinator *)obj _GEOTrafficFeedbackTypeForAction:a3]];
    v18 = +[IPCServer sharedServer];
    [v18 dismissTrafficIncidentAlert:v11];

    id v19 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
    double v20 = [v11 alertID];
    [v19 clearTrafficIncidentBulletinWithAlertID:v20];

    unsigned int v21 = ![(NavTrafficIncidentCoordinator *)obj _alertVotable:v11];
    if (a3 == 5) {
      LOBYTE(v21) = 1;
    }
    if ((v21 & 1) == 0) {
      [(NavTrafficIncidentCoordinator *)obj _didVoteAlert:v11 type:[(NavTrafficIncidentCoordinator *)obj _voteTypeAlertWithResult:a3] target:v4];
    }
    [(NavTrafficIncidentCoordinator *)obj setIsDismissing:0];
  }
}

- (void)_animateProgressWithDuration:(double)a3 startValue:(double)a4
{
  unsigned __int8 v7 = [(NavTrafficIncidentCoordinator *)self alertViewController];
  id v8 = [v7 view];
  BOOL v9 = [v8 layer];
  [v9 removeAllAnimations];

  unsigned int v10 = [(NavTrafficIncidentCoordinator *)self alertViewController];
  [v10 setRerouteTimerProgress:a4];

  id v11 = [(NavTrafficIncidentCoordinator *)self alertViewController];
  id v12 = [v11 view];
  [v12 layoutIfNeeded];

  v13[4] = self;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1004F2348;
  v14[3] = &unk_1012E5D08;
  v14[4] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1004F23C4;
  v13[3] = &unk_1012E7D28;
  +[UIView animateWithDuration:v14 animations:v13 completion:a3];
}

- (void)_didBecomeActive:(id)a3
{
  if ([(NavTrafficIncidentCoordinator *)self _hasValidRerouteTimer]
    || ([(NavTrafficIncidentCoordinator *)self presentedAlert],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [(NavTrafficIncidentCoordinator *)self _alertVotable:v4],
        v4,
        v5))
  {
    double v6 = 0.0;
    double v7 = 0.0;
    [(NavTrafficIncidentCoordinator *)self _getTimeoutTimerProgress:&v7 timeRemaining:&v6];
    if (v6 > 0.0) {
      [(NavTrafficIncidentCoordinator *)self _animateProgressWithDuration:v6 startValue:v7];
    }
  }
}

- (void)_getTimeoutTimerProgress:(double *)a3 timeRemaining:(double *)a4
{
  double v7 = [(NavTrafficIncidentCoordinator *)self presentedAlert];
  [v7 alertDisplayDuration];
  double v9 = v8;

  unsigned int v10 = [(NavTrafficIncidentCoordinator *)self timeoutTimer];
  id v11 = [v10 fireDate];
  [v11 timeIntervalSinceNow];
  double v12 = 0.0;
  if (v13 > 0.0)
  {
    id v14 = [(NavTrafficIncidentCoordinator *)self timeoutTimer];
    uint64_t v15 = [v14 fireDate];
    [v15 timeIntervalSinceNow];
    double v12 = v16;
  }
  if (v12 >= v9) {
    double v17 = v9;
  }
  else {
    double v17 = v12;
  }
  if (a4) {
    *a4 = v17;
  }
  if (a3)
  {
    if (v9 == 0.0) {
      double v18 = 0.0;
    }
    else {
      double v18 = fmin(fmax((v9 - v17) / v9, 0.0), 1.0);
    }
    *a3 = v18;
  }
}

- (double)_timeoutTimerProgress
{
  double v3 = 0.0;
  [(NavTrafficIncidentCoordinator *)self _getTimeoutTimerProgress:&v3 timeRemaining:0];
  return v3;
}

- (BOOL)_hasValidRerouteTimer
{
  double v3 = [(NavTrafficIncidentCoordinator *)self timeoutTimer];
  if ([v3 isValid])
  {
    uint64_t v4 = [(NavTrafficIncidentCoordinator *)self presentedAlert];
    if ([v4 isReroute])
    {
      unsigned int v5 = [(NavTrafficIncidentCoordinator *)self presentedAlert];
      unsigned __int8 v6 = [v5 isAutomaticReroute];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_sendTrafficFeedbackForAlert:(id)a3 actionType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v29 = a3;
  id v6 = objc_alloc_init((Class)GEOTrafficRerouteFeedback);
  double v7 = [v29 etaResponseID];
  [v6 setResponseId:v7];

  double v8 = [v29 alternateRoute];
  double v9 = [v8 serverRouteID];
  [v6 setReroutedRouteID:v9];

  [v29 newEstimatedTime];
  [v6 setReroutedRouteTravelTime:v10];
  id v11 = [v29 alternateRoute];
  [v6 setReroutedRouteHistoricTravelTime:[v11 historicTravelTime]];

  double v12 = [v29 originalRoute];
  double v13 = [v12 serverRouteID];
  [v6 setOldRouteID:v13];

  [v29 oldEstimatedTime];
  [v6 setOldRouteTravelTime:v14];
  [v29 oldHistoricTime];
  [v6 setOldRouteHistoricTravelTime:v15];
  double v16 = [v29 oldRouteIncidents];
  [v6 setOldRouteIncidents:v16];

  [v6 setActionType:v4];
  [v6 setBackgrounded:[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground] ^ 1];
  double v17 = [v29 bannerID];
  [v6 setDisplayedBannerId:v17];

  [v29 distanceToDestination];
  [v6 setDistanceToDestination:];
  uint64_t v18 = [(NavTrafficIncidentCoordinator *)self displayTime];
  if (v18)
  {
    id v19 = (void *)v18;
    double v20 = [(NavTrafficIncidentCoordinator *)self dismissTime];

    if (v20)
    {
      unsigned int v21 = [(NavTrafficIncidentCoordinator *)self dismissTime];
      id v22 = [(NavTrafficIncidentCoordinator *)self displayTime];
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
  id v28 = +[NavigationFeedbackCollector sharedFeedbackCollector];
  [v28 addTrafficRerouteFeedback:v6];
}

- (BOOL)_alertRequiresOptIn:(id)a3
{
  id v3 = a3;
  if ([v3 isReroute]) {
    unsigned int v4 = [v3 isAutomaticReroute] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)_alertVotable:(id)a3
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

- (NavTrafficIncidentPresentation)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (NavTrafficIncidentPresentation *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (MNTrafficIncidentAlert)presentedAlert
{
  return self->_presentedAlert;
}

- (void)setPresentedAlert:(id)a3
{
}

- (id)responseCallback
{
  return self->_responseCallback;
}

- (void)setResponseCallback:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
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

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissTime, 0);
  objc_storeStrong((id *)&self->_displayTime, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_responseCallback, 0);
  objc_storeStrong((id *)&self->_presentedAlert, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_trafficIncidentViewController, 0);

  objc_storeStrong((id *)&self->_rerouteTrafficIncidentViewController, 0);
}

@end