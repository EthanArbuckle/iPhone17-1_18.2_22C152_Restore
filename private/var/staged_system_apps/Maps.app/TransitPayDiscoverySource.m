@interface TransitPayDiscoverySource
- (BOOL)isAvailable;
- (BOOL)wantsAllRouteCollectionChanges;
- (FeatureDiscoveryModel)model;
- (FeatureDiscoverySourceDelegate)delegate;
- (RouteCollection)routeCollection;
- (TransitPayActionDelegate)actionDelegate;
- (TransitPayActionDelegate)transitPayActionDelegate;
- (TransitPayDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4;
- (id)_modelFromData:(id)a3;
- (id)_suggestionsFromPBSuggestions:(id)a3;
- (int64_t)priority;
- (int64_t)transportType;
- (void)_fetchInsightsWithCompletion:(id)a3;
- (void)_tearDown;
- (void)_updateAvailability;
- (void)paymentSetupViewController:(id)a3 didFinishAddingPaymentPasses:(id)a4 error:(id)a5;
- (void)performActionSetupViewControllerDidCancel:(id)a3;
- (void)setActionDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setModel:(id)a3;
- (void)setRouteCollection:(id)a3;
- (void)setTransitPayActionDelegate:(id)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setTransportType:(int64_t)a3 routeCollection:(id)a4;
- (void)updateFeatureEligibilityWithCompletion:(id)a3;
@end

@implementation TransitPayDiscoverySource

- (TransitPayDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TransitPayDiscoverySource;
  v7 = [(TransitPayDiscoverySource *)&v16 init];
  v8 = v7;
  if (v7)
  {
    v7->_priority = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.Maps.RoutePlanning.TransitPay", v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    v12 = sub_100018584();
    uint64_t v13 = [v12 oneInsights];
    msgInsights = v8->_msgInsights;
    v8->_msgInsights = (MapsSuggestionsInsights *)v13;
  }
  return v8;
}

- (BOOL)isAvailable
{
  v2 = [(TransitPayDiscoverySource *)self model];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setModel:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D8E168;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)setTransportType:(int64_t)a3 routeCollection:(id)a4
{
  id v7 = a4;
  if (self->_transportType != a3
    || (unint64_t v8 = self->_routeCollection, v9 = (unint64_t)v7, v9 | v8)
    && (dispatch_queue_t v10 = (void *)v9,
        unsigned __int8 v11 = [(id)v8 isEqual:v9],
        v10,
        (id)v8,
        (v11 & 1) == 0))
  {
    self->_transportType = a3;
    objc_storeStrong((id *)&self->_routeCollection, a4);
    v12 = sub_100021338();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (a3 == 3)
    {
      if (v13)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Transport type is Transit. Checking to surface Transit + Pay Tips.", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100D8E3C4;
      v14[3] = &unk_1012FADD0;
      v14[4] = self;
      objc_copyWeak(&v15, buf);
      [(TransitPayDiscoverySource *)self updateFeatureEligibilityWithCompletion:v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak(buf);
    }
    else
    {
      if (v13)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "The transport type is not transit, no point in checking Transit + Pay eligibility.", (uint8_t *)buf, 2u);
      }

      [(TransitPayDiscoverySource *)self _tearDown];
    }
  }
}

- (void)updateFeatureEligibilityWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  id v6 = +[UIDevice currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (v7)
  {
    unint64_t v8 = sub_100021338();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = objc_opt_class();
      id v10 = v9;
      unsigned __int8 v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@: User is not using an iPhone", buf, 0x16u);
    }
LABEL_9:

    v5[2](v5, 0);
    goto LABEL_10;
  }
  if ((MapsFeature_IsEnabled_TransitPay() & 1) == 0)
  {
    unint64_t v8 = sub_100021338();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = objc_opt_class();
      id v13 = v12;
      v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v19 = v12;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@: TransitPay is not active, did you enable it in the debug panel?", buf, 0x16u);
    }
    goto LABEL_9;
  }
  objc_initWeak((id *)buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100D8E7D4;
  v15[3] = &unk_101323BD8;
  v15[4] = self;
  objc_copyWeak(&v17, (id *)buf);
  objc_super v16 = v5;
  [(TransitPayDiscoverySource *)self _fetchInsightsWithCompletion:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
LABEL_10:
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
  block[2] = sub_100D8EBA0;
  block[3] = &unk_1012E9F90;
  objc_copyWeak(&v15, &location);
  id v13 = v19;
  v14 = v17;
  id v10 = v5;
  unsigned __int8 v11 = self;
  id v12 = v4;
  id v7 = v4;
  unint64_t v8 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

- (id)_modelFromData:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  id v5 = [FeatureDiscoveryModel alloc];
  id v6 = [v4 image];
  id v7 = [v4 title];
  unint64_t v8 = [v4 subtitle];
  unint64_t v9 = [v4 actionTitle];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100D8F20C;
  void v19[3] = &unk_1012E9340;
  objc_copyWeak(&v22, location);
  id v10 = v4;
  id v20 = v10;
  v21 = self;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100D8F630;
  v15[3] = &unk_1012E9340;
  objc_copyWeak(&v18, location);
  id v11 = v10;
  id v16 = v11;
  id v17 = self;
  LOBYTE(v14) = 1;
  id v12 = [(FeatureDiscoveryModel *)v5 initWithImage:v6 title:v7 subtitle:v8 actionTitle:v9 actionHandler:v19 bodyTapHandler:0 displayedHandler:&stru_101323BF8 dismissHandler:v15 disableAffordanceAfterAction:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  objc_destroyWeak(location);

  return v12;
}

- (id)_suggestionsFromPBSuggestions:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v7 = 138412290;
    long long v16 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(NSObject **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 hasPaymentMethodSuggestionDetails])
        {
          id v12 = [v11 paymentMethodSuggestionDetails];
          if ([v12 hasSuggestionTitle]
            && ([v12 hasSuggestionBody] & 1) != 0)
          {
            id v13 = [objc_alloc((Class)GEOTransitPaymentMethodSuggestion) initWithSuggestionData:v11];
            [v4 addObject:v13];
          }
          else
          {
            id v13 = sub_100021338();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v16;
              id v22 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Suggestion details are incomplete - either title or body does not exist: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          id v12 = sub_100021338();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v16;
            id v22 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Suggestion does not have payment method suggestion details (needed for title/subtitle): %@", buf, 0xCu);
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  id v14 = [v4 copy];

  return v14;
}

- (void)_updateAvailability
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D8FB50;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v5, &location);
  void block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_tearDown
{
  [(TransitPayDiscoverySource *)self setModel:0];
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100D90514;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)wantsAllRouteCollectionChanges
{
  return 1;
}

- (void)performActionSetupViewControllerDidCancel:(id)a3
{
  id v4 = sub_100021338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Top up flow cancelled. Marking action as \"not executed\"", v5, 2u);
  }

  [(FeatureDiscoveryModel *)self->_model markActionExecuted:0];
}

- (void)paymentSetupViewController:(id)a3 didFinishAddingPaymentPasses:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = sub_100021338();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [v10 localizedDescription];
      *(_DWORD *)buf = 138412290;
      long long v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Maps Home - Failed to provision transit card: %@", buf, 0xCu);
    }
    [(FeatureDiscoveryModel *)self->_model markActionExecuted:0];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_100D90784;
    long long v16 = &unk_1012E6690;
    objc_copyWeak(&v18, (id *)buf);
    long long v17 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v13);
    [(TransitPayDiscoverySource *)self _tearDown];
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
}

- (FeatureDiscoverySourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FeatureDiscoverySourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (TransitPayActionDelegate)transitPayActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitPayActionDelegate);

  return (TransitPayActionDelegate *)WeakRetained;
}

- (void)setTransitPayActionDelegate:(id)a3
{
}

- (TransitPayActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (TransitPayActionDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (FeatureDiscoveryModel)model
{
  return self->_model;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (RouteCollection)routeCollection
{
  return self->_routeCollection;
}

- (void)setRouteCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeCollection, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_destroyWeak((id *)&self->_transitPayActionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passManager, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_msgInsights, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end