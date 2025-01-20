@interface DetailsViewAnalytics
- (DetailsViewAnalytics)initWithCurrentTime:(double)a3;
- (void)resetAnalytics;
- (void)setEnteredFromActiveFindingUI:(BOOL)a3;
- (void)submitAnalytics;
- (void)updateDistanceAnalytics:(int)a3;
- (void)updateTimeAnalytics:(int)a3 currentTime:(double)a4;
- (void)updateWithMostRecentDistance:(double)a3;
- (void)updateWithMostRecentRawDistance:(double)a3;
@end

@implementation DetailsViewAnalytics

- (DetailsViewAnalytics)initWithCurrentTime:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DetailsViewAnalytics;
  v4 = [(DetailsViewAnalytics *)&v6 init];
  [(DetailsViewAnalytics *)v4 resetAnalytics];
  v4->_timeAtContainerCreation = a3;
  return v4;
}

- (void)updateDistanceAnalytics:(int)a3
{
  switch(a3)
  {
    case 3:
      double distanceAtEndFinding = self->_distanceAtEndFinding;
      if (distanceAtEndFinding == -1.0) {
        double distanceAtEndFinding = self->_mostRecentDistance;
      }
      self->_double distanceAtEndFinding = distanceAtEndFinding;
      break;
    case 2:
      double distanceAtFindButtonPressed = self->_distanceAtFindButtonPressed;
      if (distanceAtFindButtonPressed == -1.0) {
        double distanceAtFindButtonPressed = self->_mostRecentDistance;
      }
      self->_double distanceAtFindButtonPressed = distanceAtFindButtonPressed;
      break;
    case 1:
      double distanceAtFindButtonAvailable = self->_distanceAtFindButtonAvailable;
      if (distanceAtFindButtonAvailable == -1.0) {
        double distanceAtFindButtonAvailable = self->_mostRecentDistance;
      }
      self->_double distanceAtFindButtonAvailable = distanceAtFindButtonAvailable;
      break;
  }
}

- (void)updateTimeAnalytics:(int)a3 currentTime:(double)a4
{
  if (a3 <= 3)
  {
    v4 = (double *)(&self->super.isa + a3);
    if (v4[2] != -1.0) {
      a4 = v4[2];
    }
    v4[2] = a4;
  }
}

- (void)updateWithMostRecentDistance:(double)a3
{
  self->_mostRecentDistance = a3;
}

- (void)updateWithMostRecentRawDistance:(double)a3
{
  if (self->_distanceAtDiscovery == -1.0) {
    self->_distanceAtDiscovery = a3;
  }
}

- (void)setEnteredFromActiveFindingUI:(BOOL)a3
{
  self->_enteredFromActiveFindingUI = a3;
}

- (void)resetAnalytics
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ni-ca,CoreAnalytics: resetting analytics", v9, 2u);
  }
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_distanceAtDiscovery = _Q0;
  *(_OWORD *)&self->_double distanceAtFindButtonPressed = _Q0;
  *(_OWORD *)&self->_timeAtDiscovery = _Q0;
  *(_OWORD *)&self->_timeAtFindButtonPressed = _Q0;
  self->_mostRecentDistance = -1.0;
  self->_enteredFromActiveFindingUI = 0;
}

- (void)submitAnalytics
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = +[NSNumber numberWithBool:self->_enteredFromActiveFindingUI];
  [v3 setObject:v4 forKey:@"EnteredFromActiveFindingUI"];

  double timeAtDiscovery = self->_timeAtDiscovery;
  double v6 = -1.0;
  if (timeAtDiscovery != -1.0) {
    double v6 = timeAtDiscovery - self->_timeAtContainerCreation;
  }
  v7 = +[NSNumber numberWithDouble:v6];
  [v3 setObject:v7 forKey:@"DeltaTimeFromContainerCreationToDiscovery"];

  double timeAtFindButtonAvailable = self->_timeAtFindButtonAvailable;
  double v9 = -1.0;
  if (timeAtFindButtonAvailable != -1.0) {
    double v9 = timeAtFindButtonAvailable - self->_timeAtContainerCreation;
  }
  v10 = +[NSNumber numberWithDouble:v9];
  [v3 setObject:v10 forKey:@"DeltaTimeFromContainerCreationToFindButtonAvailable"];

  double timeAtFindButtonPressed = self->_timeAtFindButtonPressed;
  double v12 = -1.0;
  if (timeAtFindButtonPressed != -1.0) {
    double v12 = timeAtFindButtonPressed - self->_timeAtContainerCreation;
  }
  v13 = +[NSNumber numberWithDouble:v12];
  [v3 setObject:v13 forKey:@"DeltaTimeFromContainerCreationToFindButtonPressed"];

  double v14 = self->_timeAtFindButtonAvailable;
  double v15 = -1.0;
  if (v14 != -1.0) {
    double v15 = v14 - self->_timeAtDiscovery;
  }
  v16 = +[NSNumber numberWithDouble:v15];
  [v3 setObject:v16 forKey:@"DeltaTimeFromDiscoveryToFindButtonAvailable"];

  double v17 = self->_timeAtFindButtonPressed;
  double v18 = -1.0;
  if (v17 != -1.0) {
    double v18 = v17 - self->_timeAtFindButtonAvailable;
  }
  v19 = +[NSNumber numberWithDouble:v18];
  [v3 setObject:v19 forKey:@"DeltaTimeFromFindButtonAvailableToFindButtonPressed"];

  v20 = +[NSNumber numberWithDouble:self->_distanceAtDiscovery];
  [v3 setObject:v20 forKey:@"DistanceAtDiscovery"];

  v21 = +[NSNumber numberWithDouble:self->_distanceAtFindButtonAvailable];
  [v3 setObject:v21 forKey:@"DistanceAtFindButtonAvailable"];

  v22 = +[NSNumber numberWithDouble:self->_distanceAtFindButtonPressed];
  [v3 setObject:v22 forKey:@"DistanceAtPressFind"];

  double distanceAtEndFinding = self->_distanceAtEndFinding;
  double v24 = -1.0;
  if (distanceAtEndFinding != -1.0) {
    double v24 = vabdd_f64(distanceAtEndFinding, self->_distanceAtFindButtonPressed);
  }
  v25 = +[NSNumber numberWithDouble:v24];
  [v3 setObject:v25 forKey:@"DistanceBetweenStartAndEndFinding"];

  double timeAtFindingSessionEnd = self->_timeAtFindingSessionEnd;
  double v27 = -1.0;
  if (timeAtFindingSessionEnd != -1.0) {
    double v27 = timeAtFindingSessionEnd - self->_timeAtFindButtonPressed;
  }
  v28 = +[NSNumber numberWithDouble:v27];
  [v3 setObject:v28 forKey:@"FindingTime"];

  id v29 = [v3 mutableCopy];
  v30 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = [v29 description];
    *(_DWORD *)buf = 138412290;
    v34 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "#ni-ca,send find button availability analytics event:\n%@\n", buf, 0xCu);
  }
  id v32 = v29;
  AnalyticsSendEventLazy();
  [(DetailsViewAnalytics *)self resetAnalytics];
}

@end