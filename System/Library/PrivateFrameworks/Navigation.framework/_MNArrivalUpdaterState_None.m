@interface _MNArrivalUpdaterState_None
- (_MNArrivalUpdaterState_None)init;
- (_MNArrivalUpdaterState_None)initWithDepartureReason:(unint64_t)a3;
- (int64_t)state;
- (void)onEnterState:(id)a3;
- (void)updateForLocation;
@end

@implementation _MNArrivalUpdaterState_None

- (_MNArrivalUpdaterState_None)init
{
  return [(_MNArrivalUpdaterState_None *)self initWithDepartureReason:0];
}

- (_MNArrivalUpdaterState_None)initWithDepartureReason:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_MNArrivalUpdaterState_None;
  v4 = [(_MNArrivalUpdaterState_None *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_departureReason = a3;
    v6 = v4;
  }

  return v5;
}

- (int64_t)state
{
  return 0;
}

- (void)onEnterState:(id)a3
{
  [(_MNArrivalUpdaterState *)self sendArrivalInfo];
  unint64_t departureReason = self->_departureReason;
  if (departureReason) {
    BOOL v5 = departureReason == 6;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    v6 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
    v7 = [v6 safeDelegate];
    objc_super v8 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
    v9 = [(_MNArrivalUpdaterState *)self targetLeg];
    objc_msgSend(v7, "arrivalUpdater:didDepartFromLegIndex:withReason:", v8, objc_msgSend(v9, "legIndex"), self->_departureReason);
  }
  id v10 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  [v10 stopMonitoringForEV];
}

- (void)updateForLocation
{
  if (![(_MNArrivalUpdaterState *)self _updateForArrival]
    && ![(_MNArrivalUpdaterState *)self _updateForPreArrival]
    && ![(_MNArrivalUpdaterState *)self _updateForEndOfDrivingSegment]
    && ![(_MNArrivalUpdaterState *)self _updateForApproachingWaypoint])
  {
    [(_MNArrivalUpdaterState *)self _updateForEVMonitoring];
  }
}

@end