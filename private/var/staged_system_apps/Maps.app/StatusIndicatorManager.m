@interface StatusIndicatorManager
- (StatusIndicatorDelegate)delegate;
- (StatusIndicatorManager)initWithDelegate:(id)a3;
- (unint64_t)indicatorType;
- (void)dealloc;
- (void)locationManagerApprovalDidChange:(id)a3;
- (void)setIndicatorType:(unint64_t)a3;
- (void)updateIndicatorType;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation StatusIndicatorManager

- (void)setIndicatorType:(unint64_t)a3
{
  if (self->_indicatorType != a3)
  {
    self->_indicatorType = a3;
    v4 = [(StatusIndicatorManager *)self delegate];
    [v4 statusIndicatorTypeChanged:[self indicatorType]];

    +[MapsAnalyticStateProvider updatePreciseLocationInformation];
  }
}

- (void)locationManagerApprovalDidChange:(id)a3
{
  id v4 = a3;
  v5 = +[MKLocationManager sharedLocationManager];
  v6 = [v5 locationProvider];
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000164E4;
  v9[3] = &unk_1012E6690;
  objc_copyWeak(&v11, &location);
  id v7 = v6;
  id v10 = v7;
  v8 = objc_retainBlock(v9);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v8[2])(v8);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (StatusIndicatorManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)StatusIndicatorManager;
  v5 = [(StatusIndicatorManager *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = (RadiosPreferences *)[objc_alloc((Class)RadiosPreferences) initWithQueue:&_dispatch_main_q];
    radioPreferences = v6->_radioPreferences;
    v6->_radioPreferences = v7;

    [(RadiosPreferences *)v6->_radioPreferences setDelegate:v6];
    v9 = +[MKLocationManager sharedLocationManager];
    id v10 = [v9 locationProvider];
    v6->_initialLocationProviderClass = (Class)objc_opt_class();

    id v11 = +[GEONetworkObserver sharedNetworkObserver];
    [v11 addNetworkReachableObserver:v6 selector:"updateIndicatorType"];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v6 selector:"updateIndicatorType" name:@"UsingOfflineMapsStateChangedNotification" object:0];

    _GEOConfigAddDelegateListenerForKey();
    _GEOConfigAddDelegateListenerForKey();

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v6 selector:"locationManagerApprovalDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];

    v6->_indicatorType = 0;
    v14 = +[MKLocationManager sharedLocationManager];
    v6->_waitingForAuthorization = [v14 isAuthorizationNotDetermined];

    [(StatusIndicatorManager *)v6 updateIndicatorType];
  }

  return v6;
}

- (void)updateIndicatorType
{
  if ((GEOConfigGetBOOL() & 1) == 0) {
    goto LABEL_17;
  }
  uint64_t v3 = MKCurrentNetworkConnectionFailureDiagnosis();
  id v4 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v5 = [v4 isUsingForcedOfflineMaps];

  if (v5)
  {
    v6 = self;
    uint64_t v7 = 8;
    goto LABEL_18;
  }
  v8 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v9 = [v8 isUsingOfflineMaps];

  if (v9)
  {
    v6 = self;
    uint64_t v7 = 7;
    goto LABEL_18;
  }
  switch(v3)
  {
    case 1:
      v6 = self;
      uint64_t v7 = 3;
      goto LABEL_18;
    case 2:
      v6 = self;
      uint64_t v7 = 4;
      goto LABEL_18;
    case 3:
      v6 = self;
      uint64_t v7 = 2;
      goto LABEL_18;
  }
  id v10 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v11 = [v10 isLocationServicesPossiblyAvailable];

  if ((v11 & 1) == 0)
  {
    v6 = self;
    uint64_t v7 = 5;
    goto LABEL_18;
  }
  v12 = +[MKLocationManager sharedLocationManager];
  if ([v12 isAuthorizedForPreciseLocation])
  {

LABEL_17:
    v6 = self;
    uint64_t v7 = 1;
    goto LABEL_18;
  }
  BOOL waitingForAuthorization = self->_waitingForAuthorization;

  if (waitingForAuthorization) {
    goto LABEL_17;
  }
  v6 = self;
  uint64_t v7 = 6;
LABEL_18:

  [(StatusIndicatorManager *)v6 setIndicatorType:v7];
}

- (unint64_t)indicatorType
{
  return self->_indicatorType;
}

- (StatusIndicatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (StatusIndicatorDelegate *)WeakRetained;
}

- (void)dealloc
{
  uint64_t v3 = +[GEONetworkObserver sharedNetworkObserver];
  [v3 removeNetworkReachableObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)StatusIndicatorManager;
  [(StatusIndicatorManager *)&v4 dealloc];
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  var1 = a3.var1;
  unsigned int var0 = a3.var0;
  if (a3.var0 == MapsConfig_EnableStatusBarIndicator && a3.var1 == off_1015F0EE8) {
    [(StatusIndicatorManager *)self updateIndicatorType];
  }
  if (var0 == MapsConfig_OfflineOnlyData && var1 == off_1015F0B08)
  {
    [(StatusIndicatorManager *)self updateIndicatorType];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_radioPreferences, 0);
}

@end