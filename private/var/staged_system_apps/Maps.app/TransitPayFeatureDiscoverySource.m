@interface TransitPayFeatureDiscoverySource
- (BOOL)_hasPaymentAndSuggestionsData:(id)a3 error:(id)a4;
- (BOOL)active;
- (BOOL)hasInitialData;
- (BOOL)showFeature;
- (GEOObserverHashTable)observers;
- (TransitPayActionDelegate)transitPayActionDelegate;
- (TransitPayFeatureDiscoverySource)initWithInsights:(id)a3 paymentPolygonFetcher:(id)a4 locationUpdater:(id)a5 isActive:(BOOL)a6;
- (id)transitPayDiscoveryModel;
- (void)_fetchInsightsWithCompletion:(id)a3;
- (void)_notifyObservers;
- (void)dealloc;
- (void)didUpdateLocation:(id)a3;
- (void)fetchTransitMessageFromPassManagerUsingPolygon:(id)a3;
- (void)paymentSetupViewController:(id)a3 didFinishAddingPaymentPasses:(id)a4 error:(id)a5;
- (void)setActive:(BOOL)a3;
- (void)setShowFeature:(BOOL)a3;
- (void)setTransitPayActionDelegate:(id)a3;
- (void)transitPassManagerDidChange:(id)a3;
- (void)transitPayTipDismissedInRoutePlanning:(id)a3;
- (void)updateFeatureEligibility;
@end

@implementation TransitPayFeatureDiscoverySource

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    v6 = self->_observers;
    self->_observers = v5;

    objc_sync_exit(v4);
    observers = self->_observers;
  }

  return observers;
}

- (void)updateFeatureEligibility
{
  if (self->_active)
  {
    v4 = +[UIDevice currentDevice];
    id v5 = [v4 userInterfaceIdiom];

    if (v5)
    {
      v6 = sub_100021338();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = objc_opt_class();
        id v8 = v7;
        v9 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v14 = v7;
        __int16 v15 = 2112;
        v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@: User is not using an iPhone", buf, 0x16u);
      }
    }
    else
    {
      objc_initWeak((id *)buf, self);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10001B900;
      v11[3] = &unk_1012E9EF0;
      objc_copyWeak(&v12, (id *)buf);
      [(TransitPayFeatureDiscoverySource *)self _fetchInsightsWithCompletion:v11];
      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v10 = sub_100021338();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "The feature is NOT active. Returning. Is the feature flag on?", buf, 2u);
    }
  }
}

- (void)_fetchInsightsWithCompletion:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B164;
  block[3] = &unk_1012E9F90;
  objc_copyWeak(&v15, &location);
  v13 = v19;
  v14 = v17;
  v10 = v5;
  v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

- (TransitPayFeatureDiscoverySource)initWithInsights:(id)a3 paymentPolygonFetcher:(id)a4 locationUpdater:(id)a5 isActive:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)TransitPayFeatureDiscoverySource;
  v14 = [(TransitPayFeatureDiscoverySource *)&v22 init];
  if (v14)
  {
    id v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.Maps.Home.TransitPay", v15);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v14->_msgInsights, a3);
    objc_storeStrong((id *)&v14->_paymentPolygonFetcher, a4);
    objc_storeStrong((id *)&v14->_locationUpdater, a5);
    v14->_active = a6;
    v14->_showFeature = 0;
    char v18 = objc_alloc_init(PaymentPolygonCache);
    polygonCache = v14->_polygonCache;
    v14->_polygonCache = v18;

    char v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v14 selector:"transitPayTipDismissedInRoutePlanning:" name:@"TransitPayTipDismissedInRoutePlanningNotification" object:0];
  }
  return v14;
}

- (void)setTransitPayActionDelegate:(id)a3
{
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(MapsLocationUpdater *)self->_locationUpdater stopLocationUpdates];
  v4.receiver = self;
  v4.super_class = (Class)TransitPayFeatureDiscoverySource;
  [(TransitPayFeatureDiscoverySource *)&v4 dealloc];
}

- (id)transitPayDiscoveryModel
{
  if (self->_modelData)
  {
    objc_initWeak(location, self);
    id v13 = [FeatureDiscoveryModel alloc];
    v3 = [(TransitPayModelData *)self->_modelData image];
    objc_super v4 = [(TransitPayModelData *)self->_modelData title];
    id v5 = [(TransitPayModelData *)self->_modelData subtitle];
    v6 = [(TransitPayModelData *)self->_modelData actionTitle];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100425638;
    v18[3] = &unk_1012E6690;
    objc_copyWeak(&v19, location);
    v18[4] = self;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1004258CC;
    v16[3] = &unk_1012E7ED0;
    v16[4] = self;
    objc_copyWeak(&v17, location);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100425A14;
    v14[3] = &unk_1012E7ED0;
    v14[4] = self;
    objc_copyWeak(&v15, location);
    LOBYTE(v12) = 1;
    id v7 = [(FeatureDiscoveryModel *)v13 initWithImage:v3 title:v4 subtitle:v5 actionTitle:v6 actionHandler:v18 bodyTapHandler:0 displayedHandler:v16 dismissHandler:v14 disableAffordanceAfterAction:v12];
    model = self->_model;
    self->_model = v7;

    v9 = self->_model;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    v10 = sub_100021338();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_modelData is not populated. Returning.", (uint8_t *)location, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (void)transitPassManagerDidChange:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100425BA8;
  v3[3] = &unk_1012E6708;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_notifyObservers
{
  if (self->_active) {
    [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
  }
}

- (BOOL)_hasPaymentAndSuggestionsData:(id)a3 error:(id)a4
{
  id v5 = a3;
  v6 = a4;
  if (!v6 && [v5 count])
  {
    id v7 = [v5 firstObject];
    v9 = [v7 supportedTransitPaymentMethods];
    v10 = v9;
    if (v9 && [v9 count])
    {
      id v11 = [v7 transitPaymentMethodSuggestions];
      uint64_t v12 = v11;
      if (v11 && [v11 count])
      {
        BOOL v8 = 1;
LABEL_17:

        goto LABEL_18;
      }
      id v13 = sub_100021338();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        dispatch_queue_t v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GEOMapItem %@ does not contain any transit payment method suggestions", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      uint64_t v12 = sub_100021338();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "The map item does not support any transit payment methods", (uint8_t *)&v15, 2u);
      }
    }
    BOOL v8 = 0;
    goto LABEL_17;
  }
  id v7 = sub_100021338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    dispatch_queue_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Unable to get GEOMapItems (either error or 0 were returned). Error: %@", (uint8_t *)&v15, 0xCu);
  }
  BOOL v8 = 0;
LABEL_18:

  return v8;
}

- (void)didUpdateLocation:(id)a3
{
  id v4 = a3;
  id v5 = sub_100021338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 latLng];
    [v6 lat];
    uint64_t v8 = v7;
    v9 = [v4 latLng];
    [v9 lng];
    *(_DWORD *)buf = 134283777;
    uint64_t v17 = v8;
    __int16 v18 = 2049;
    uint64_t v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Maps Home - Received Location Update at %{private}f, %{private}f", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100425FEC;
  v13[3] = &unk_1012E6690;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = v4;
  id v12 = v4;
  dispatch_async(queue, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)transitPayTipDismissedInRoutePlanning:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"TransitPayTipDismissedInRoutePlanningNotificationMarketMUIDKey"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 unsignedLongLongValue];
    unint64_t currentMarketMUID = self->_currentMarketMUID;
    v9 = sub_100021338();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if ((id)currentMarketMUID == v7)
    {
      if (v10)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Hiding tip in Maps Home as it was dismissed in route planning.", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100426850;
      block[3] = &unk_1012E6708;
      objc_copyWeak(&v13, buf);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);
    }
    else
    {
      if (v10)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "NOT hiding tip in Maps Home as it had different MUID than the one dismissed in route planning.", (uint8_t *)buf, 2u);
      }
    }
  }
  else
  {
    id v11 = sub_100021338();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "No market MUID was passed with the route planning tip dismissal", (uint8_t *)buf, 2u);
    }
  }
}

- (void)fetchTransitMessageFromPassManagerUsingPolygon:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transitPaymentMethodSuggestions];
  v6 = [v5 firstObject];
  self->_unint64_t currentMarketMUID = (unint64_t)[v6 marketMUID];

  passManager = self->_passManager;
  uint64_t v8 = [v4 supportedTransitPaymentMethods];
  v9 = [v4 transitPaymentMethodSuggestions];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100426998;
  v10[3] = &unk_1012EA008;
  v10[4] = self;
  [(TransitPassManager *)passManager fetchTransitMessageForRoute:0 paymentMethods:v8 suggestions:v9 completion:v10];
}

- (void)paymentSetupViewController:(id)a3 didFinishAddingPaymentPasses:(id)a4 error:(id)a5
{
  id v6 = a5;
  if (v6)
  {
    id v7 = sub_100021338();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Maps Home - Failed to provision transit card: %@", buf, 0xCu);
    }
    [(FeatureDiscoveryModel *)self->_model markActionExecuted:0];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100426D34;
    block[3] = &unk_1012E6708;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)hasInitialData
{
  return self->hasInitialData;
}

- (BOOL)showFeature
{
  return self->_showFeature;
}

- (void)setShowFeature:(BOOL)a3
{
  self->_showFeature = a3;
}

- (TransitPayActionDelegate)transitPayActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitPayActionDelegate);

  return (TransitPayActionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitPayActionDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_polygonCache, 0);
  objc_storeStrong((id *)&self->_modelData, 0);
  objc_storeStrong((id *)&self->_passManager, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_locationUpdater, 0);
  objc_storeStrong((id *)&self->_paymentPolygonFetcher, 0);

  objc_storeStrong((id *)&self->_msgInsights, 0);
}

@end