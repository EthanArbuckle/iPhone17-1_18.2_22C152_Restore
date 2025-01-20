@interface _MNArrivalUpdaterState_ApproachingWaypoint
- (int64_t)state;
- (void)onEnterState:(id)a3;
- (void)updateForLocation;
@end

@implementation _MNArrivalUpdaterState_ApproachingWaypoint

- (int64_t)state
{
  return 2;
}

- (void)onEnterState:(id)a3
{
  [(_MNArrivalUpdaterState *)self sendArrivalInfo];
  id v7 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  v4 = [v7 safeDelegate];
  v5 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  v6 = [(_MNArrivalUpdaterState *)self targetLeg];
  objc_msgSend(v4, "arrivalUpdater:isApproachingEndOfLeg:", v5, objc_msgSend(v6, "legIndex"));
}

- (void)updateForLocation
{
  if (![(_MNArrivalUpdaterState *)self _updateForArrival]
    && ![(_MNArrivalUpdaterState *)self _updateForPreArrival])
  {
    [(_MNArrivalUpdaterState *)self _updateForEVMonitoring];
    [(_MNArrivalUpdaterState *)self _updateForSearchingForParking];
  }
}

@end