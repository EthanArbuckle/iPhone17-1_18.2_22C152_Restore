@interface RideBookingRideStatusObserverProxy
- (RideBookingRideStatusObserverProxy)initWithDelegate:(id)a3;
- (RideBookingRideStatusObserverProxyDelegate)delegate;
- (void)_updateAnalyticsWithRideStatus:(id)a3;
- (void)_updateAnalyticsWithRideStatus:(id)a3 cancelError:(id)a4 handling:(BOOL)a5;
- (void)_updateAnalyticsWithRideStatus:(id)a3 feedbackError:(id)a4;
- (void)cancelRideWithRideStatus:(id)a3 completion:(id)a4;
- (void)checkIfCanCancelRideWithRideStatus:(id)a3 completion:(id)a4;
- (void)rideStatusMapDidChange:(id)a3;
- (void)sendFeedbackForRideStatus:(id)a3 feedbackRating:(id)a4 feedbackTip:(id)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
- (void)updateRideStatusMap;
@end

@implementation RideBookingRideStatusObserverProxy

- (RideBookingRideStatusObserverProxy)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RideBookingRideStatusObserverProxy;
  v5 = [(RideBookingRideStatusObserverProxy *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = +[RideBookingAccessProxy coordinator];
    [v7 addRideBookingDataCoordinatorRideStatusObserver:v6];
  }
  return v6;
}

- (void)updateRideStatusMap
{
}

- (void)rideStatusMapDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000936B8;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)sendFeedbackForRideStatus:(id)a3 feedbackRating:(id)a4 feedbackTip:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    objc_initWeak((id *)location, self);
    v14 = +[RideBookingAccessProxy coordinator];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100693AFC;
    v16[3] = &unk_1012F4230;
    objc_copyWeak(&v19, (id *)location);
    id v17 = v10;
    id v18 = v13;
    [v14 sendFeedbackForRideStatus:v17 feedbackRating:v11 feedbackTip:v12 completion:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingRideStatusObserverProxy.m";
      __int16 v21 = 1024;
      int v22 = 49;
      __int16 v23 = 2082;
      v24 = "-[RideBookingRideStatusObserverProxy sendFeedbackForRideStatus:feedbackRating:feedbackTip:completion:]";
      __int16 v25 = 2082;
      v26 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", location, 0x26u);
    }
  }
}

- (void)checkIfCanCancelRideWithRideStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_initWeak((id *)location, self);
    id v8 = +[RideBookingAccessProxy coordinator];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100693F0C;
    v10[3] = &unk_1012F4280;
    objc_copyWeak(&v13, (id *)location);
    id v11 = v6;
    id v12 = v7;
    [v8 checkIfCanCancelRideWithRideStatus:v11 completion:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }
  else
  {
    objc_super v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingRideStatusObserverProxy.m";
      __int16 v15 = 1024;
      int v16 = 63;
      __int16 v17 = 2082;
      id v18 = "-[RideBookingRideStatusObserverProxy checkIfCanCancelRideWithRideStatus:completion:]";
      __int16 v19 = 2082;
      v20 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", location, 0x26u);
    }
  }
}

- (void)cancelRideWithRideStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_initWeak((id *)location, self);
    id v8 = +[RideBookingAccessProxy coordinator];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100694370;
    v10[3] = &unk_1012F4230;
    objc_copyWeak(&v13, (id *)location);
    id v11 = v6;
    id v12 = v7;
    [v8 cancelRideWithRideStatus:v11 completion:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }
  else
  {
    objc_super v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingRideStatusObserverProxy.m";
      __int16 v15 = 1024;
      int v16 = 77;
      __int16 v17 = 2082;
      id v18 = "-[RideBookingRideStatusObserverProxy cancelRideWithRideStatus:completion:]";
      __int16 v19 = 2082;
      v20 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", location, 0x26u);
    }
  }
}

- (void)_updateAnalyticsWithRideStatus:(id)a3
{
  id v3 = a3;
  id v4 = [v3 application];
  id v5 = [v4 identifier];
  id v6 = [v3 identifier];
  id v7 = +[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:v5 rideIdentifier:v6];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = [v3 intentResponseFailures];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 captureIntent:[*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) intent] withFailure:[*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) failure]];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if (([v3 isValidRide] & 1) == 0) {
    [v7 endSession];
  }
}

- (void)_updateAnalyticsWithRideStatus:(id)a3 cancelError:(id)a4 handling:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  if (v7)
  {
    id v16 = v7;
    id v8 = a3;
    id v9 = [v8 application];
    id v10 = [v9 identifier];
    uint64_t v11 = [v8 identifier];

    id v12 = +[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:v10 rideIdentifier:v11];

    long long v13 = objc_opt_new();
    long long v14 = v13;
    if (v5) {
      uint64_t v15 = 6;
    }
    else {
      uint64_t v15 = 5;
    }
    [v13 setIntent:v15];
    [v14 setFailure:1];
    if ([v16 code] == (id)-11) {
      [v14 setFailure:4];
    }
    if ([v16 code] == (id)-13) {
      [v14 setFailure:3];
    }
    [v12 captureIntent:[v14 intent] withFailure:[v14 failure]];
    [v12 endSession];

    id v7 = v16;
  }
}

- (void)_updateAnalyticsWithRideStatus:(id)a3 feedbackError:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = [v6 application];
    id v8 = [v7 identifier];
    id v9 = [v6 identifier];

    id v12 = +[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:v8 rideIdentifier:v9];

    id v10 = objc_opt_new();
    [v10 setIntent:7];
    [v10 setFailure:1];
    id v11 = [v5 code];

    if (v11 == (id)-11) {
      [v10 setFailure:4];
    }
    [v12 captureIntent:[v10 intent] withFailure:[v10 failure]];
    [v12 endSession];
  }
}

- (RideBookingRideStatusObserverProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RideBookingRideStatusObserverProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end