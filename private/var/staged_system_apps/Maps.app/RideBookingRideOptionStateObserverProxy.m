@interface RideBookingRideOptionStateObserverProxy
- (RideBookingRideOptionState)rideOptionState;
- (RideBookingRideOptionStateObserverProxy)initWithDelegate:(id)a3;
- (RideBookingRideOptionStateObserverProxyDelegate)delegate;
- (RidesharingAnalyticsBookingSession)analyticsBookingSession;
- (void)_updateAnalyticsWithRideOptionStatus:(id)a3;
- (void)rideOptionStateDidChange:(id)a3;
- (void)setAnalyticsBookingSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRideOptionState:(id)a3;
- (void)startRequestRideForRideOption:(id)a3;
- (void)updateRideOptionStateForOrigin:(id)a3 destination:(id)a4;
@end

@implementation RideBookingRideOptionStateObserverProxy

- (RideBookingRideOptionStateObserverProxy)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RideBookingRideOptionStateObserverProxy;
  v5 = [(RideBookingRideOptionStateObserverProxy *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(RideBookingRideOptionStateObserverProxy *)v5 setDelegate:v4];
    uint64_t v7 = +[RideBookingAccessProxy rideBookingCurrentRideBookingSessionCreateIfNecessary:1];
    analyticsBookingSession = v6->_analyticsBookingSession;
    v6->_analyticsBookingSession = (RidesharingAnalyticsBookingSession *)v7;

    v9 = +[RideBookingAccessProxy coordinator];
    [v9 addRideBookingDataCoordinatorRideOptionStateObserver:v6];
  }
  return v6;
}

- (void)updateRideOptionStateForOrigin:(id)a3 destination:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 placemark];
  v9 = [v8 location];
  v10 = [(RideBookingRideOptionStateObserverProxy *)self analyticsBookingSession];
  [v10 setOrigin:v9];

  objc_super v11 = [v6 placemark];
  v12 = [v11 location];
  v13 = [(RideBookingRideOptionStateObserverProxy *)self analyticsBookingSession];
  [v13 setDestination:v12];

  id v18 = +[RideBookingAccessProxy coordinator];
  v14 = [v7 _geoMapItem];

  v15 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v14];
  v16 = [v6 _geoMapItem];

  v17 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v16];
  [v18 updateRideOptionStateForOrigin:v15 destination:v17];
}

- (void)startRequestRideForRideOption:(id)a3
{
  id v3 = a3;
  id v4 = +[RideBookingAccessProxy coordinator];
  [v4 startRequestRideForRideOption:v3];
}

- (void)rideOptionStateDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100643374;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateAnalyticsWithRideOptionStatus:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_opt_new();
  [v8 setIntent:1];
  [v8 setFailure:0];
  id v5 = (char *)[v4 rideOptionStatusError];

  id v6 = v5 - 1;
  if (unint64_t)(v5 - 1) <= 0xA && ((0x7FDu >> (char)v6)) {
    [v8 setFailure:dword_100F70130[(void)v6]];
  }
  if ([v8 failure])
  {
    id v7 = [(RideBookingRideOptionStateObserverProxy *)self analyticsBookingSession];
    [v7 captureIntent:[v8 intent] withFailure:[v8 failure]];
  }
}

- (RidesharingAnalyticsBookingSession)analyticsBookingSession
{
  return self->_analyticsBookingSession;
}

- (void)setAnalyticsBookingSession:(id)a3
{
}

- (RideBookingRideOptionState)rideOptionState
{
  return self->_rideOptionState;
}

- (void)setRideOptionState:(id)a3
{
}

- (RideBookingRideOptionStateObserverProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RideBookingRideOptionStateObserverProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rideOptionState, 0);

  objc_storeStrong((id *)&self->_analyticsBookingSession, 0);
}

@end