@interface RideBookingRequestRideOptionProxy
- (RideBookingRequestRideOptionProxy)initWithDelegate:(id)a3;
- (RideBookingRequestRideOptionProxyDelegate)delegate;
- (RidesharingAnalyticsBookingSession)analyticsBookingSession;
- (void)_updateAnalyticsWithRequestRideStatus:(id)a3;
- (void)_updateAnalyticsWithRideStatus:(id)a3;
- (void)requestRideStatusDidChange:(id)a3;
- (void)requestRideWithCompletion:(id)a3;
- (void)setAnalyticsBookingSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateRequestRidePassengers:(id)a3;
- (void)updateRequestRidePaymentMethod:(id)a3;
- (void)updateStartingWaypointCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation RideBookingRequestRideOptionProxy

- (RideBookingRequestRideOptionProxy)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RideBookingRequestRideOptionProxy;
  v5 = [(RideBookingRequestRideOptionProxy *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = +[RideBookingAccessProxy rideBookingCurrentRideBookingSessionCreateIfNecessary:0];
    analyticsBookingSession = v6->_analyticsBookingSession;
    v6->_analyticsBookingSession = (RidesharingAnalyticsBookingSession *)v7;

    v9 = +[RideBookingAccessProxy coordinator];
    [v9 addRideBookingDataCoordinatorRequestRideObserver:v6];
  }
  return v6;
}

- (void)updateStartingWaypointCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v5 = +[RideBookingAccessProxy coordinator];
  [v5 updateRequestRideStartingWaypointCoordinate:latitude, longitude];
}

- (void)updateRequestRidePaymentMethod:(id)a3
{
  id v4 = a3;
  id v5 = [v4 intentsPaymentMethod];
  BOOL v6 = [v5 type] == (id)8;

  uint64_t v7 = [(RideBookingRequestRideOptionProxy *)self analyticsBookingSession];
  [v7 setPaymentIsApplePay:v6];

  id v8 = +[RideBookingAccessProxy coordinator];
  [v8 updateRequestRidePaymentMethod:v4];
}

- (void)updateRequestRidePassengers:(id)a3
{
  id v3 = a3;
  id v4 = +[RideBookingAccessProxy coordinator];
  [v4 updateRequestRidePassengers:v3];
}

- (void)requestRideWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    id v5 = +[RideBookingAccessProxy coordinator];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1008ED2BC;
    v7[3] = &unk_1012FFF60;
    objc_copyWeak(&v9, (id *)location);
    id v8 = v4;
    [v5 requestRideWithCompletion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)location);
  }
  else
  {
    BOOL v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingRequestRideOptionProxy.m";
      __int16 v11 = 1024;
      int v12 = 66;
      __int16 v13 = 2082;
      v14 = "-[RideBookingRequestRideOptionProxy requestRideWithCompletion:]";
      __int16 v15 = 2082;
      v16 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", location, 0x26u);
    }
  }
}

- (void)requestRideStatusDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008ED574;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateAnalyticsWithRequestRideStatus:(id)a3
{
  id v14 = a3;
  id v4 = [v14 origin];
  id v5 = [v4 location];
  BOOL v6 = [(RideBookingRequestRideOptionProxy *)self analyticsBookingSession];
  [v6 setOrigin:v5];

  id v7 = [v14 destination];
  id v8 = [v7 location];
  id v9 = [(RideBookingRequestRideOptionProxy *)self analyticsBookingSession];
  [v9 setDestination:v8];

  v10 = objc_opt_new();
  [v10 setIntent:2];
  [v10 setFailure:0];
  unint64_t v11 = (unint64_t)[v14 requestRideStatusError] - 1;
  if (v11 <= 7) {
    [v10 setFailure:dword_100F72960[v11]];
  }
  if ([v10 failure])
  {
    int v12 = [(RideBookingRequestRideOptionProxy *)self analyticsBookingSession];
    [v12 captureIntent:[v10 intent] withFailure:[v10 failure]];
  }
  if ([v14 requestRideStatusError])
  {
    __int16 v13 = [(RideBookingRequestRideOptionProxy *)self analyticsBookingSession];
    [v13 endSessionOnView:2 state:5];
  }
}

- (void)_updateAnalyticsWithRideStatus:(id)a3
{
  id v4 = a3;
  id v5 = [v4 application];
  BOOL v6 = [v5 identifier];
  id v7 = [v4 identifier];
  id v8 = +[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:v6 rideIdentifier:v7];

  id v9 = [v4 application];
  v10 = [v9 version];
  [v8 setAppVersion:v10];

  [v8 setNumberOfEnabledExtensions:[self->_analyticsBookingSession numberOfEnabledExtensions]];
  [v8 setNumberOfInstalledExtensions:[self->_analyticsBookingSession numberOfInstalledExtensions]];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v11 = [v4 intentResponseFailures];
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      __int16 v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        [v8 captureIntent:3 withFailure:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v15) failure]];
        __int16 v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  if ([v4 isValidRide])
  {
    [v8 setBookedUsingMaps:1];
    v16 = [(RideBookingRequestRideOptionProxy *)self analyticsBookingSession];
    v17 = v16;
    uint64_t v18 = 4;
    uint64_t v19 = 1;
  }
  else
  {
    [v8 endSession];
    v16 = [(RideBookingRequestRideOptionProxy *)self analyticsBookingSession];
    v17 = v16;
    uint64_t v18 = 3;
    uint64_t v19 = 5;
  }
  [v16 endSessionOnView:v18 state:v19];
}

- (RidesharingAnalyticsBookingSession)analyticsBookingSession
{
  return self->_analyticsBookingSession;
}

- (void)setAnalyticsBookingSession:(id)a3
{
}

- (RideBookingRequestRideOptionProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RideBookingRequestRideOptionProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_analyticsBookingSession, 0);
}

@end