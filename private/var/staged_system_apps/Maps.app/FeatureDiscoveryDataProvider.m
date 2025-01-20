@interface FeatureDiscoveryDataProvider
- (BOOL)active;
- (BOOL)hasInitialData;
- (BOOL)showEVOnboardingBanner;
- (BOOL)showNearbyTransitBanner;
- (BOOL)showOfflineDownloadingTip;
- (BOOL)showOfflineMapsBanner;
- (BOOL)showOfflinePairedDeviceDiskSpaceTip;
- (BOOL)showPreferredNetworksBanner;
- (BOOL)showRatingsAndPhotosBanner;
- (BOOL)showTransitPayBanner;
- (FeatureDiscoveryDataProvider)init;
- (GEOObserverHashTable)observers;
- (NSArray)features;
- (OfflineMapsFeatureDiscoveryActionDelegate)offlineMapsDiscoveryActionDelegate;
- (TransitPayActionDelegate)transitPayActionDelegate;
- (UGCPOIEnrichmentActionDelegate)poiEnrichmentActionDelegate;
- (id)_featureDiscoveryModelWithPrecedence;
- (id)_featureTipModelWithPrecedence;
- (id)_modelForEVRouting;
- (id)_modelForNearbyTransit;
- (id)_modelForOfflineMapsTip;
- (id)_modelForPreferredNetworks;
- (id)_modelForRatingAndPhotos;
- (id)_modelForTransitPay;
- (void)_addNearbyTransitToFavorites;
- (void)_updateAndNotifyObservers:(BOOL)a3;
- (void)_updateFeatures;
- (void)dealloc;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setHasInitialData:(BOOL)a3;
- (void)setOfflineMapsDiscoveryActionDelegate:(id)a3;
- (void)setPoiEnrichmentActionDelegate:(id)a3;
- (void)setShowEVOnboardingBanner:(BOOL)a3;
- (void)setShowNearbyTransitBanner:(BOOL)a3;
- (void)setShowOfflineDownloadingTip:(BOOL)a3;
- (void)setShowOfflineMapsBanner:(BOOL)a3;
- (void)setShowOfflinePairedDeviceDiskSpaceTip:(BOOL)a3;
- (void)setShowPreferredNetworksBanner:(BOOL)a3;
- (void)setShowRatingsAndPhotosBanner:(BOOL)a3;
- (void)setShowTransitPayBanner:(BOOL)a3;
- (void)setTransitPayActionDelegate:(id)a3;
- (void)source:(id)a3 didUpdateAvailability:(BOOL)a4;
- (void)updateFeaturesWithSuggestions:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation FeatureDiscoveryDataProvider

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)setTransitPayActionDelegate:(id)a3
{
  id obj = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (obj)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v4->_transitPayActionDelegate);

    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)&v4->_transitPayActionDelegate, obj);
      [(TransitPayFeatureDiscoverySource *)v4->_transitPayDiscoverySource setTransitPayActionDelegate:obj];
    }
  }
  objc_sync_exit(v4);
}

- (void)setOfflineMapsDiscoveryActionDelegate:(id)a3
{
  id obj = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (obj)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v4->_offlineMapsDiscoveryActionDelegate);

    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)&v4->_offlineMapsDiscoveryActionDelegate, obj);
      [(OfflineMapsFeatureDiscoverySource *)v4->_offlineMapsFeatureDiscoverySource setActionDelegate:obj];
    }
  }
  objc_sync_exit(v4);
}

- (void)_updateFeatures
{
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v3 = [(FeatureDiscoveryDataProvider *)self _featureTipModelWithPrecedence];
  v4 = [(FeatureDiscoveryDataProvider *)self _featureDiscoveryModelWithPrecedence];
  if (v3) {
    [v7 addObject:v3];
  }
  if (v4) {
    [v7 addObject:v4];
  }
  v5 = (NSArray *)[v7 copy];
  features = self->_features;
  self->_features = v5;
}

- (id)_featureTipModelWithPrecedence
{
  if ([(FeatureDiscoveryDataProvider *)self showOfflineDownloadingTip])
  {
    v3 = [(OfflineMapsDownloadFeatureTipSource *)self->_offlineMapsDownloadFeatureTipSource offlineMapsDownloadTipModel];
  }
  else if ([(FeatureDiscoveryDataProvider *)self showOfflinePairedDeviceDiskSpaceTip])
  {
    v3 = [(OfflineMapsPairedDeviceDiskSpaceTipSource *)self->_offlineMapsPairedDeviceDiskSpaceTipSource offlineMapsPairedDeviceDiskSpaceTipModel];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)showOfflinePairedDeviceDiskSpaceTip
{
  return self->_showOfflinePairedDeviceDiskSpaceTip;
}

- (BOOL)showOfflineDownloadingTip
{
  return self->_showOfflineDownloadingTip;
}

- (id)_featureDiscoveryModelWithPrecedence
{
  if ([(FeatureDiscoveryDataProvider *)self showEVOnboardingBanner])
  {
    v3 = [(FeatureDiscoveryDataProvider *)self _modelForEVRouting];
  }
  else if ([(FeatureDiscoveryDataProvider *)self showPreferredNetworksBanner])
  {
    v3 = [(FeatureDiscoveryDataProvider *)self _modelForPreferredNetworks];
  }
  else if ([(FeatureDiscoveryDataProvider *)self showOfflineMapsBanner])
  {
    v3 = [(FeatureDiscoveryDataProvider *)self _modelForOfflineMapsTip];
  }
  else if ([(FeatureDiscoveryDataProvider *)self showTransitPayBanner])
  {
    v3 = [(FeatureDiscoveryDataProvider *)self _modelForTransitPay];
  }
  else if ([(FeatureDiscoveryDataProvider *)self showNearbyTransitBanner])
  {
    v3 = [(FeatureDiscoveryDataProvider *)self _modelForNearbyTransit];
  }
  else if ([(FeatureDiscoveryDataProvider *)self showRatingsAndPhotosBanner])
  {
    v3 = [(FeatureDiscoveryDataProvider *)self _modelForRatingAndPhotos];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)showTransitPayBanner
{
  return self->_showTransitPayBanner;
}

- (BOOL)showRatingsAndPhotosBanner
{
  return self->_showRatingsAndPhotosBanner;
}

- (BOOL)showPreferredNetworksBanner
{
  return self->_showPreferredNetworksBanner;
}

- (BOOL)showOfflineMapsBanner
{
  return self->_showOfflineMapsBanner;
}

- (BOOL)showNearbyTransitBanner
{
  return self->_showNearbyTransitBanner;
}

- (BOOL)showEVOnboardingBanner
{
  return self->_showEVOnboardingBanner;
}

- (FeatureDiscoveryDataProvider)init
{
  v31.receiver = self;
  v31.super_class = (Class)FeatureDiscoveryDataProvider;
  v2 = [(FeatureDiscoveryDataProvider *)&v31 init];
  if (v2)
  {
    _GEOConfigAddDelegateListenerForKey();
    v3 = objc_alloc_init(NearbyTransitFeatureDiscoverySource);
    nearbyTransitDiscoverySource = v2->_nearbyTransitDiscoverySource;
    v2->_nearbyTransitDiscoverySource = v3;

    v5 = [(NearbyTransitFeatureDiscoverySource *)v2->_nearbyTransitDiscoverySource observers];
    [v5 registerObserver:v2];

    [(NearbyTransitFeatureDiscoverySource *)v2->_nearbyTransitDiscoverySource updateFeatureAvailabilityIfNecessary];
    v6 = sub_100018584();
    id v7 = objc_alloc_init(RealPaymentPolygonFetcher);
    v8 = objc_alloc_init(MapsRealLocationUpdater);
    v9 = [TransitPayFeatureDiscoverySource alloc];
    v10 = [v6 oneInsights];
    v11 = [(TransitPayFeatureDiscoverySource *)v9 initWithInsights:v10 paymentPolygonFetcher:v7 locationUpdater:v8 isActive:MapsFeature_IsEnabled_TransitPay()];
    transitPayDiscoverySource = v2->_transitPayDiscoverySource;
    v2->_transitPayDiscoverySource = v11;

    v13 = [(TransitPayFeatureDiscoverySource *)v2->_transitPayDiscoverySource observers];
    [v13 registerObserver:v2];

    [(TransitPayFeatureDiscoverySource *)v2->_transitPayDiscoverySource updateFeatureEligibility];
    v14 = [OfflineMapsFeatureDiscoverySource alloc];
    v15 = [v6 oneInsights];
    v16 = [(OfflineMapsFeatureDiscoverySource *)v14 initWithInsights:v15 locationUpdater:v8 isActive:GEOSupportsOfflineMaps()];
    offlineMapsFeatureDiscoverySource = v2->_offlineMapsFeatureDiscoverySource;
    v2->_offlineMapsFeatureDiscoverySource = v16;

    v18 = [(OfflineMapsFeatureDiscoverySource *)v2->_offlineMapsFeatureDiscoverySource observers];
    [v18 registerObserver:v2];

    [(OfflineMapsFeatureDiscoverySource *)v2->_offlineMapsFeatureDiscoverySource updateFeatureEligibility];
    v19 = [[OfflineMapsDownloadFeatureTipSource alloc] initWithIsActive:GEOSupportsOfflineMaps()];
    offlineMapsDownloadFeatureTipSource = v2->_offlineMapsDownloadFeatureTipSource;
    v2->_offlineMapsDownloadFeatureTipSource = v19;

    v21 = [(OfflineMapsDownloadFeatureTipSource *)v2->_offlineMapsDownloadFeatureTipSource observers];
    [v21 registerObserver:v2];

    v22 = [[OfflineMapsPairedDeviceDiskSpaceTipSource alloc] initWithIsActive:GEOSupportsOfflineMaps()];
    offlineMapsPairedDeviceDiskSpaceTipSource = v2->_offlineMapsPairedDeviceDiskSpaceTipSource;
    v2->_offlineMapsPairedDeviceDiskSpaceTipSource = v22;

    v24 = [(OfflineMapsPairedDeviceDiskSpaceTipSource *)v2->_offlineMapsPairedDeviceDiskSpaceTipSource observers];
    [v24 registerObserver:v2];

    v25 = [[EVRoutingFeatureDiscoverySource alloc] initWithPriority:1 delegate:v2];
    evRoutingFeatureDiscoverySource = v2->_evRoutingFeatureDiscoverySource;
    v2->_evRoutingFeatureDiscoverySource = v25;

    v27 = objc_alloc_init(PreferredNetworksFeatureDiscoverySource);
    preferredNetworkFeatureDiscoverySource = v2->_preferredNetworkFeatureDiscoverySource;
    v2->_preferredNetworkFeatureDiscoverySource = v27;

    v29 = [(PreferredNetworksFeatureDiscoverySource *)v2->_preferredNetworkFeatureDiscoverySource observers];
    [v29 registerObserver:v2];

    v2->_showNearbyTransitBanner = [(NearbyTransitFeatureDiscoverySource *)v2->_nearbyTransitDiscoverySource shouldShowFeature];
    v2->_hasInitialData = [(NearbyTransitFeatureDiscoverySource *)v2->_nearbyTransitDiscoverySource hasInitialData];
    [(FeatureDiscoveryDataProvider *)v2 _updateAndNotifyObservers:0];
  }
  return v2;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (void)setShowNearbyTransitBanner:(BOOL)a3
{
  if (self->_showNearbyTransitBanner != a3)
  {
    self->_showNearbyTransitBanner = a3;
    [(FeatureDiscoveryDataProvider *)self _updateAndNotifyObservers:1];
  }
}

- (void)setHasInitialData:(BOOL)a3
{
  self->_hasInitialData = a3;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    -[NearbyTransitFeatureDiscoverySource setActive:](self->_nearbyTransitDiscoverySource, "setActive:");
    if (v3)
    {
      [(FeatureDiscoveryDataProvider *)self _updateFeatures];
      [(FeatureDiscoveryDataProvider *)self _updateAndNotifyObservers:0];
    }
  }
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  v4 = (NearbyTransitFeatureDiscoverySource *)a3;
  v5 = v4;
  if (self->_nearbyTransitDiscoverySource == v4)
  {
    [(FeatureDiscoveryDataProvider *)self setShowNearbyTransitBanner:[(NearbyTransitFeatureDiscoverySource *)v4 shouldShowFeature]];
    [(FeatureDiscoveryDataProvider *)self setHasInitialData:[(NearbyTransitFeatureDiscoverySource *)self->_nearbyTransitDiscoverySource hasInitialData]];
    v4 = v5;
  }
  if ((NearbyTransitFeatureDiscoverySource *)self->_transitPayDiscoverySource == v4)
  {
    [(FeatureDiscoveryDataProvider *)self setShowTransitPayBanner:[(NearbyTransitFeatureDiscoverySource *)v5 showFeature]];
    v4 = v5;
  }
  if ((NearbyTransitFeatureDiscoverySource *)self->_offlineMapsFeatureDiscoverySource == v4)
  {
    [(FeatureDiscoveryDataProvider *)self setShowOfflineMapsBanner:[(NearbyTransitFeatureDiscoverySource *)v5 showFeature]];
    v4 = v5;
  }
  if ((NearbyTransitFeatureDiscoverySource *)self->_preferredNetworkFeatureDiscoverySource == v4)
  {
    [(FeatureDiscoveryDataProvider *)self setShowPreferredNetworksBanner:[(NearbyTransitFeatureDiscoverySource *)v5 showFeature]];
    v4 = v5;
  }
  if ((NearbyTransitFeatureDiscoverySource *)self->_offlineMapsDownloadFeatureTipSource == v4)
  {
    [(FeatureDiscoveryDataProvider *)self setShowOfflineDownloadingTip:[(NearbyTransitFeatureDiscoverySource *)v5 showFeature]];
    v4 = v5;
  }
  if ((NearbyTransitFeatureDiscoverySource *)self->_offlineMapsPairedDeviceDiskSpaceTipSource == v4)
  {
    [(FeatureDiscoveryDataProvider *)self setShowOfflinePairedDeviceDiskSpaceTip:[(NearbyTransitFeatureDiscoverySource *)v5 showFeature]];
    v4 = v5;
  }
}

- (NSArray)features
{
  return self->_features;
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  if (self->_active)
  {
    BOOL v3 = a3;
    [(FeatureDiscoveryDataProvider *)self _updateFeatures];
    if (v3)
    {
      observers = self->_observers;
      [(GEOObserverHashTable *)observers homeDataProvidingObjectDidUpdate:self];
    }
  }
}

- (void)source:(id)a3 didUpdateAvailability:(BOOL)a4
{
  v6 = (EVRoutingFeatureDiscoverySource *)a3;
  if (self->_evRoutingFeatureDiscoverySource == v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100574348;
    v10[3] = &unk_1012E6300;
    v10[4] = self;
    BOOL v11 = a4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
  else
  {
    id v7 = sub_1005762E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "-[FeatureDiscoveryDataProvider source:didUpdateAvailability:]";
      __int16 v14 = 2080;
      v15 = "FeatureDiscoveryDataProvider.m";
      __int16 v16 = 1024;
      int v17 = 167;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v8 = sub_1005762E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)FeatureDiscoveryDataProvider;
  [(FeatureDiscoveryDataProvider *)&v3 dealloc];
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
}

- (void)updateFeaturesWithSuggestions:(id)a3
{
  id v4 = a3;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (+[RatingRequestHomeAvailability shouldShowRatingRequestDiscoveryBanner])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100574494;
    v5[3] = &unk_1012EF530;
    v5[4] = &v6;
    [v4 enumerateObjectsUsingBlock:v5];
  }
  [(FeatureDiscoveryDataProvider *)self setShowRatingsAndPhotosBanner:*((unsigned __int8 *)v7 + 24)];
  [(NearbyTransitFeatureDiscoverySource *)self->_nearbyTransitDiscoverySource updateFeatureAvailabilityIfNecessary];
  _Block_object_dispose(&v6, 8);
}

- (void)setShowTransitPayBanner:(BOOL)a3
{
  if (self->_showTransitPayBanner != a3)
  {
    self->_showTransitPayBanner = a3;
    [(FeatureDiscoveryDataProvider *)self _updateAndNotifyObservers:1];
  }
}

- (void)setShowOfflineMapsBanner:(BOOL)a3
{
  if (self->_showOfflineMapsBanner != a3)
  {
    self->_showOfflineMapsBanner = a3;
    [(FeatureDiscoveryDataProvider *)self _updateAndNotifyObservers:1];
  }
}

- (void)setShowRatingsAndPhotosBanner:(BOOL)a3
{
  if (self->_showRatingsAndPhotosBanner != a3)
  {
    self->_showRatingsAndPhotosBanner = a3;
    [(FeatureDiscoveryDataProvider *)self _updateAndNotifyObservers:1];
  }
}

- (void)setShowEVOnboardingBanner:(BOOL)a3
{
  if (self->_showEVOnboardingBanner != a3)
  {
    self->_showEVOnboardingBanner = a3;
    [(FeatureDiscoveryDataProvider *)self _updateAndNotifyObservers:1];
  }
}

- (void)setShowPreferredNetworksBanner:(BOOL)a3
{
  if (self->_showPreferredNetworksBanner != a3)
  {
    self->_showPreferredNetworksBanner = a3;
    [(FeatureDiscoveryDataProvider *)self _updateAndNotifyObservers:1];
  }
}

- (void)setShowOfflineDownloadingTip:(BOOL)a3
{
  if (self->_showOfflineDownloadingTip != a3)
  {
    self->_showOfflineDownloadingTip = a3;
    [(FeatureDiscoveryDataProvider *)self _updateAndNotifyObservers:1];
  }
}

- (void)setShowOfflinePairedDeviceDiskSpaceTip:(BOOL)a3
{
  if (self->_showOfflinePairedDeviceDiskSpaceTip != a3)
  {
    self->_showOfflinePairedDeviceDiskSpaceTip = a3;
    [(FeatureDiscoveryDataProvider *)self _updateAndNotifyObservers:1];
  }
}

- (void)_addNearbyTransitToFavorites
{
  v2 = sub_10005C134();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Will add Nearby Transit to Favorites via Feature Discovery", v5, 2u);
  }

  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    objc_super v3 = objc_alloc_init(_TtC4Maps16MapsFavoriteItem);
    [(MapsFavoriteItem *)v3 setType:6];
    [(MapsFavoriteItem *)v3 setIdentifier:@"NearbyTransit"];
    [(MapsFavoriteItem *)v3 setCustomName:@"NearbyTransit"];
  }
  else
  {
    objc_super v3 = (_TtC4Maps16MapsFavoriteItem *)[objc_alloc((Class)MapsSuggestionsShortcut) initWithType:6 identifier:@"NearbyTransit" geoMapItem:0 customName:@"NearbyTransit"];
  }
  id v4 = +[ShortcutEditSession addSessionWithShortcut:v3];

  [v4 setMoveToPreferredIndexInFavorites:1];
  [v4 saveWithCompletion:&stru_1012EF550];
}

- (id)_modelForRatingAndPhotos
{
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1005748A0;
  v6[3] = &unk_1012E6708;
  objc_copyWeak(&v7, &location);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100574910;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  v2 = +[FeatureDiscoveryModel ratingsAndPhotosDiscoveryModelWithActionHandler:v6 cancelHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v2;
}

- (id)_modelForNearbyTransit
{
  objc_initWeak(&location, self);
  nearbyTransitDiscoverySource = self->_nearbyTransitDiscoverySource;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100574AC0;
  v8[3] = &unk_1012E6708;
  objc_copyWeak(&v9, &location);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100574B3C;
  v6[3] = &unk_1012E6708;
  objc_copyWeak(&v7, &location);
  id v4 = [(NearbyTransitFeatureDiscoverySource *)nearbyTransitDiscoverySource discoveryModelWithActionHandler:v8 displayHandler:&stru_1012EF570 cancelHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v4;
}

- (id)_modelForOfflineMapsTip
{
  return [(OfflineMapsFeatureDiscoverySource *)self->_offlineMapsFeatureDiscoverySource offlineMapsDiscoveryModel];
}

- (id)_modelForTransitPay
{
  return [(TransitPayFeatureDiscoverySource *)self->_transitPayDiscoverySource transitPayDiscoveryModel];
}

- (id)_modelForEVRouting
{
  return [(EVRoutingFeatureDiscoverySource *)self->_evRoutingFeatureDiscoverySource model];
}

- (id)_modelForPreferredNetworks
{
  return [(PreferredNetworksFeatureDiscoverySource *)self->_preferredNetworkFeatureDiscoverySource model];
}

- (BOOL)active
{
  return self->_active;
}

- (UGCPOIEnrichmentActionDelegate)poiEnrichmentActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_poiEnrichmentActionDelegate);

  return (UGCPOIEnrichmentActionDelegate *)WeakRetained;
}

- (void)setPoiEnrichmentActionDelegate:(id)a3
{
}

- (TransitPayActionDelegate)transitPayActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitPayActionDelegate);

  return (TransitPayActionDelegate *)WeakRetained;
}

- (OfflineMapsFeatureDiscoveryActionDelegate)offlineMapsDiscoveryActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_offlineMapsDiscoveryActionDelegate);

  return (OfflineMapsFeatureDiscoveryActionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_offlineMapsDiscoveryActionDelegate);
  objc_destroyWeak((id *)&self->_transitPayActionDelegate);
  objc_destroyWeak((id *)&self->_poiEnrichmentActionDelegate);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_offlineMapsPairedDeviceDiskSpaceTipSource, 0);
  objc_storeStrong((id *)&self->_offlineMapsDownloadFeatureTipSource, 0);
  objc_storeStrong((id *)&self->_preferredNetworkFeatureDiscoverySource, 0);
  objc_storeStrong((id *)&self->_evRoutingFeatureDiscoverySource, 0);
  objc_storeStrong((id *)&self->_offlineMapsFeatureDiscoverySource, 0);
  objc_storeStrong((id *)&self->_transitPayDiscoverySource, 0);
  objc_storeStrong((id *)&self->_nearbyTransitDiscoverySource, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end