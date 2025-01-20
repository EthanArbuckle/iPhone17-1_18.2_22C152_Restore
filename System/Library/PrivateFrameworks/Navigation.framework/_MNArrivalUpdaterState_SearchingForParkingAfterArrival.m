@interface _MNArrivalUpdaterState_SearchingForParkingAfterArrival
- (BOOL)_checkForArrival;
- (int64_t)state;
- (void)onEnterState:(id)a3;
@end

@implementation _MNArrivalUpdaterState_SearchingForParkingAfterArrival

- (int64_t)state
{
  return 6;
}

- (void)onEnterState:(id)a3
{
  [(_MNArrivalUpdaterState *)self sendArrivalInfo];
  id v6 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  v4 = [v6 safeDelegate];
  v5 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  [v4 arrivalUpdater:v5 didUpdateVehicleParkingType:2];
}

- (BOOL)_checkForArrival
{
  v3 = [(_MNArrivalUpdaterState *)self details];
  v4 = [v3 navigationSessionState];
  v5 = [v4 targetLeg];
  id v6 = [v5 arrivalParameters];

  v7 = [(_MNArrivalUpdaterState *)self location];
  if ([v6 containsLocation:v7 arrivalRegionType:7]) {
    goto LABEL_4;
  }
  v8 = [(_MNArrivalUpdaterState *)self location];
  if ([v6 containsLocation:v8 arrivalRegionType:5])
  {

LABEL_4:
    goto LABEL_5;
  }
  v11 = [(_MNArrivalUpdaterState *)self location];
  char v12 = [v6 containsLocation:v11 arrivalRegionType:8];

  if ((v12 & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)_MNArrivalUpdaterState_SearchingForParkingAfterArrival;
    BOOL v9 = [(_MNArrivalUpdaterState *)&v13 _checkForArrival];
    goto LABEL_6;
  }
LABEL_5:
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

@end