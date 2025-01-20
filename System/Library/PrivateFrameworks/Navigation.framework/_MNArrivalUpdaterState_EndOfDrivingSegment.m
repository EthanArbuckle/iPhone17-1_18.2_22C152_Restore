@interface _MNArrivalUpdaterState_EndOfDrivingSegment
- (int64_t)state;
- (void)onEnterState:(id)a3;
@end

@implementation _MNArrivalUpdaterState_EndOfDrivingSegment

- (int64_t)state
{
  return 5;
}

- (void)onEnterState:(id)a3
{
  [(_MNArrivalUpdaterState *)self sendArrivalInfo];
  id v6 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  v4 = [v6 safeDelegate];
  v5 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  [v4 arrivalUpdater:v5 didUpdateVehicleParkingType:2];
}

@end