@interface RidesharingPartySizeSelectionAlertController
+ (id)ridesharingPartySizeSelectionAlertControllerWithRequestRideStatus:(id)a3;
- (RideBookingRequestRideStatus)requestRideStatus;
- (id)didFinishSelectingPartySize;
- (void)setDidFinishSelectingPartySize:(id)a3;
- (void)setRequestRideStatus:(id)a3;
@end

@implementation RidesharingPartySizeSelectionAlertController

+ (id)ridesharingPartySizeSelectionAlertControllerWithRequestRideStatus:(id)a3
{
  id v5 = a3;
  v6 = [v5 rideOption];
  v7 = [v6 partySizeSelectionPrompt];
  v8 = [a1 alertControllerWithTitle:0 message:v7 preferredStyle:0];

  objc_storeStrong(v8 + 2, a3);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009CC514;
  v12[3] = &unk_1013134B8;
  id v13 = v5;
  id v9 = v5;
  v10 = objc_retainBlock(v12);
  ((void (*)(void *, id *))v10[2])(v10, v8);

  return v8;
}

- (id)didFinishSelectingPartySize
{
  return self->_didFinishSelectingPartySize;
}

- (void)setDidFinishSelectingPartySize:(id)a3
{
}

- (RideBookingRequestRideStatus)requestRideStatus
{
  return self->_requestRideStatus;
}

- (void)setRequestRideStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestRideStatus, 0);

  objc_storeStrong(&self->_didFinishSelectingPartySize, 0);
}

@end