@interface PreferredNetworksFeatureDiscoverySource
- (BOOL)_shouldShowForVehicle:(id)a3;
- (BOOL)active;
- (BOOL)hasInitialData;
- (BOOL)showFeature;
- (FeatureDiscoveryModel)model;
- (GEOObserverHashTable)observers;
- (PreferredNetworksFeatureDiscoverySource)init;
- (id)_candidateVehicle;
- (void)_consumeUpdatedGarage:(id)a3;
- (void)_didSelectModelWithVehicle:(id)a3;
- (void)_didViewModelWithVehicle:(id)a3;
- (void)_dismiss;
- (void)_markVehicleAsViewed:(id)a3;
- (void)_reloadAvailability;
- (void)setActive:(BOOL)a3;
- (void)setShowFeature:(BOOL)a3;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation PreferredNetworksFeatureDiscoverySource

- (void)_consumeUpdatedGarage:(id)a3
{
  v4 = [a3 vehicles];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100644A78;
  v13[3] = &unk_1012F1C18;
  v13[4] = self;
  v5 = sub_1000990A8(v4, v13);

  unint64_t v6 = self->_candidateVehicle;
  unint64_t v7 = v5;
  if (v7 | v6
    && (unsigned int v8 = [(id)v6 isEqual:v7], (id)v7, (id)v6, !v8))
  {
    v10 = sub_100109F4C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(VGVehicle *)self->_candidateVehicle displayName];
      v12 = [(id)v7 displayName];
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "vehicle candidate changed from: %@ to: %@.", buf, 0x16u);
    }
    objc_storeStrong((id *)&self->_candidateVehicle, v5);
    [(PreferredNetworksFeatureDiscoverySource *)self _reloadAvailability];
  }
  else
  {
    v9 = sub_100109F4C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "vehicles without networks have not changed.", buf, 2u);
    }
  }
}

- (void)_reloadAvailability
{
  if (MapsFeature_IsEnabled_EVRouting()) {
    int IsEnabled_EVRoutingEnhancements = MapsFeature_IsEnabled_EVRoutingEnhancements();
  }
  else {
    int IsEnabled_EVRoutingEnhancements = 0;
  }
  int v4 = IsEVRoutingSupported();
  BOOL dismissed = self->_dismissed;
  candidateVehicle = self->_candidateVehicle;
  if (candidateVehicle) {
    unsigned int v7 = [(PreferredNetworksFeatureDiscoverySource *)self _shouldShowForVehicle:self->_candidateVehicle];
  }
  else {
    unsigned int v7 = 0;
  }
  int v8 = IsEnabled_EVRoutingEnhancements & v4;
  if (dismissed) {
    int v8 = 0;
  }
  int v9 = v8 & v7;
  [(PreferredNetworksFeatureDiscoverySource *)self setShowFeature:v8 & v7];
  v10 = sub_10000A540();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v9) {
      v11 = @"YES";
    }
    else {
      v11 = @"NO";
    }
    v12 = v11;
    if (IsEnabled_EVRoutingEnhancements) {
      v13 = @"YES";
    }
    else {
      v13 = @"NO";
    }
    v14 = v13;
    if (v4) {
      v15 = @"YES";
    }
    else {
      v15 = @"NO";
    }
    __int16 v16 = v15;
    if (dismissed) {
      v17 = @"YES";
    }
    else {
      v17 = @"NO";
    }
    v18 = v17;
    if (candidateVehicle) {
      v19 = @"YES";
    }
    else {
      v19 = @"NO";
    }
    v20 = v19;
    if (v7) {
      v21 = @"YES";
    }
    else {
      v21 = @"NO";
    }
    v22 = v21;
    int v23 = 138413570;
    v24 = v12;
    __int16 v25 = 2112;
    v26 = v14;
    __int16 v27 = 2112;
    v28 = v16;
    __int16 v29 = 2112;
    v30 = v18;
    __int16 v31 = 2112;
    v32 = v20;
    __int16 v33 = 2112;
    v34 = v22;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_reloadAvailability EVRoutingFeatureDiscoverySource isAvailable: %@\n, featureEnabled: %@, currentCountrySupportsEVRouting: %@, wasDismissed: %@, hasCandidateVehicle: %@, belowMaximumViewCount: %@", (uint8_t *)&v23, 0x3Eu);
  }
}

- (PreferredNetworksFeatureDiscoverySource)init
{
  v22.receiver = self;
  v22.super_class = (Class)PreferredNetworksFeatureDiscoverySource;
  v2 = [(PreferredNetworksFeatureDiscoverySource *)&v22 init];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"com.apple.maps.featurediscovery.evrouting.isolation.%p", v2];
    int v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v6;

    int v8 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:&_dispatch_main_q];
    observers = v2->_observers;
    v2->_observers = v8;

    candidateVehicle = v2->_candidateVehicle;
    v2->_candidateVehicle = 0;

    v11 = +[VGVirtualGarageService sharedService];
    [v11 registerObserver:v2];

    objc_initWeak(&location, v2);
    v12 = +[VGVirtualGarageService sharedService];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100033D04;
    v18[3] = &unk_1012F2D20;
    v13 = v2;
    v19 = v13;
    objc_copyWeak(&v20, &location);
    [v12 virtualGarageGetGarageWithReply:v18];

    v14 = v2->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100108A04;
    block[3] = &unk_1012E5D08;
    v17 = v13;
    dispatch_async(v14, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setShowFeature:(BOOL)a3
{
  if (self->_showFeature != a3)
  {
    self->_showFeature = a3;
    int v4 = sub_100109F4C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (self->_showFeature) {
        v5 = @"YES";
      }
      else {
        v5 = @"NO";
      }
      dispatch_queue_t v6 = v5;
      int v7 = 138412290;
      int v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Did update availability of preferredNetworks source to %@.", (uint8_t *)&v7, 0xCu);
    }
    [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
  }
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (BOOL)showFeature
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100643890;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (FeatureDiscoveryModel)model
{
  unsigned __int8 v3 = [(PreferredNetworksFeatureDiscoverySource *)self showFeature];
  int v4 = sub_100109F4C();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Will suggest preferred networks onboarding.", buf, 2u);
    }

    int v4 = [(PreferredNetworksFeatureDiscoverySource *)self _candidateVehicle];
    if (v4)
    {
      uint64_t v6 = +[NSBundle mainBundle];
      uint64_t v21 = [v6 localizedStringForKey:@"[Title, Feature Discovery, EV preferred networks]", @"localized string not found", 0 value table];

      int v7 = +[NSBundle mainBundle];
      uint64_t v8 = [v7 localizedStringForKey:@"[Subtitle, Feature Discovery, EV preferred networks]", @"localized string not found", 0 value table];

      objc_initWeak((id *)buf, self);
      char v9 = [FeatureDiscoveryModel alloc];
      v10 = sub_100CDBC88();
      v11 = +[NSBundle mainBundle];
      v12 = [v11 localizedStringForKey:@"[Action button, Feature Discovery, EV preferred networks]", @"localized string not found", 0 value table];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100643D88;
      v27[3] = &unk_1012E6690;
      objc_copyWeak(&v29, (id *)buf);
      v13 = v4;
      v28 = v13;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100643DD8;
      v24[3] = &unk_1012E6690;
      objc_copyWeak(&v26, (id *)buf);
      __int16 v25 = v13;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100643E28;
      v22[3] = &unk_1012E6708;
      objc_copyWeak(&v23, (id *)buf);
      LOBYTE(v20) = 0;
      v14 = [(FeatureDiscoveryModel *)v9 initWithImage:v10 title:v21 subtitle:v8 actionTitle:v12 actionHandler:v27 bodyTapHandler:0 displayedHandler:v24 dismissHandler:v22 disableAffordanceAfterAction:v20];
      objc_destroyWeak(&v23);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v29);

      objc_destroyWeak((id *)buf);
      v15 = v21;
    }
    else
    {
      v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        __int16 v31 = "-[PreferredNetworksFeatureDiscoverySource model]";
        __int16 v32 = 2080;
        __int16 v33 = "PreferredNetworksFeatureDiscoverySource.m";
        __int16 v34 = 1024;
        int v35 = 123;
        __int16 v36 = 2080;
        v37 = "vehicle";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        v18 = sub_1005762E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          __int16 v31 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      v15 = sub_100109F4C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Tried to suggest preferred networks but did not have a candidate vehicle.", buf, 2u);
      }
      v14 = 0;
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Will not suggest preferred networks: it is not available.", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (id)_candidateVehicle
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_100103E3C;
  v10 = sub_1001047A8;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100643F58;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_dismiss
{
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10064404C;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_didViewModelWithVehicle:(id)a3
{
  id v4 = a3;
  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:449 onTarget:8 eventValue:0];

  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006441D8;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_didSelectModelWithVehicle:(id)a3
{
  id v4 = a3;
  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:451 onTarget:8 eventValue:0];

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006445A0;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldShowForVehicle:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableString stringWithString:@"_preferredNetworksOnboarding_"];
  uint64_t v5 = [v3 pairedAppIdentifier];
  id v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = &stru_101324E70;
  }
  [v4 appendString:v7];

  uint64_t v8 = [v3 year];
  id v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = &stru_101324E70;
  }
  [v4 appendString:v10];

  uint64_t v11 = [v3 model];
  v12 = (void *)v11;
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  else {
    CFStringRef v13 = &stru_101324E70;
  }
  [v4 appendString:v13];

  v14 = [v3 manufacturer];

  if (v14) {
    CFStringRef v15 = v14;
  }
  else {
    CFStringRef v15 = &stru_101324E70;
  }
  [v4 appendString:v15];

  id v16 = [v4 copy];
  BOOL v17 = sub_100CDBC9C(v16);

  return v17;
}

- (void)_markVehicleAsViewed:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableString stringWithString:@"_preferredNetworksOnboarding_"];
  uint64_t v5 = [v3 pairedAppIdentifier];
  id v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = &stru_101324E70;
  }
  [v4 appendString:v7];

  uint64_t v8 = [v3 year];
  id v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = &stru_101324E70;
  }
  [v4 appendString:v10];

  uint64_t v11 = [v3 model];
  v12 = (void *)v11;
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  else {
    CFStringRef v13 = &stru_101324E70;
  }
  [v4 appendString:v13];

  v14 = [v3 manufacturer];

  if (v14) {
    CFStringRef v15 = v14;
  }
  else {
    CFStringRef v15 = &stru_101324E70;
  }
  [v4 appendString:v15];

  id v16 = [v4 copy];
  sub_100CDBF90(v16);
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100644A6C;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, v7);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_candidateVehicle, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end