@interface _MNArrivalUpdaterState_PreArrival
- (double)parkingDetectionExcludeRadius;
- (int64_t)state;
- (void)onEnterState:(id)a3;
- (void)updateForLocation;
@end

@implementation _MNArrivalUpdaterState_PreArrival

- (int64_t)state
{
  return 3;
}

- (void)onEnterState:(id)a3
{
  [(_MNArrivalUpdaterState *)self sendArrivalInfo];
  id v7 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  v4 = [v7 safeDelegate];
  v5 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  v6 = [(_MNArrivalUpdaterState *)self targetLeg];
  objc_msgSend(v4, "arrivalUpdater:didEnterPreArrivalStateForLegIndex:", v5, objc_msgSend(v6, "legIndex"));
}

- (void)updateForLocation
{
  if (![(_MNArrivalUpdaterState *)self _updateForArrival])
  {
    [(_MNArrivalUpdaterState *)self _updateForEVMonitoring];
    [(_MNArrivalUpdaterState *)self _updateForSearchingForParking];
  }
}

- (double)parkingDetectionExcludeRadius
{
  v2 = [(_MNArrivalUpdaterState *)self location];
  [v2 horizontalAccuracy];
  double v4 = v3 + 10.0;

  return v4;
}

@end