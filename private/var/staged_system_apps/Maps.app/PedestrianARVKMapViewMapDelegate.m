@interface PedestrianARVKMapViewMapDelegate
- ($1AB5FA073B851C12C2339EC22442E995)currentFeaturePosition;
- (BOOL)hasActiveFeatureSet;
- (GEOObserverHashTable)observers;
- (NSArray)currentFeatureMapping;
- (PedestrianARFeatureSetMapEntry)activeFeatureSetMapEntry;
- (PedestrianARFeatureSetMapEntry)latestFeatureSetMapEntry;
- (PedestrianARVKMapViewMapDelegate)initWithMapView:(id)a3;
- (VKARWalkingFeature)currentFeature;
- (VKARWalkingFeatureSet)currentFeatureSet;
- (VKMapView)mapView;
- (id)guidanceInfoForFeature:(id)a3;
- (unint64_t)currentIdentifier;
- (void)dealloc;
- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4;
- (void)mapLayer:(id)a3 arWalkingElevationRequestFailure:(id)a4;
- (void)mapLayer:(id)a3 arWalkingFeatureSetStateDidUpdate:(id)a4;
- (void)registerObserver:(id)a3;
- (void)setActiveFeatureSetMapEntry:(id)a3;
- (void)setLatestFeatureSetMapEntry:(id)a3;
- (void)setObservers:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateFeatureMapping:(id)a3;
- (void)updateGuidanceInfo:(id)a3 forFeature:(id)a4;
@end

@implementation PedestrianARVKMapViewMapDelegate

- (PedestrianARVKMapViewMapDelegate)initWithMapView:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "-[PedestrianARVKMapViewMapDelegate initWithMapView:]";
      __int16 v17 = 2080;
      v18 = "PedestrianARVKMapViewMapDelegate.m";
      __int16 v19 = 1024;
      int v20 = 93;
      __int16 v21 = 2080;
      v22 = "mapView != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)PedestrianARVKMapViewMapDelegate;
  v6 = [(PedestrianARVKMapViewMapDelegate *)&v14 init];
  if (v6)
  {
    v7 = sub_100A601F4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)v6 + 1, a3);
    [*((id *)v6 + 1) setMapDelegate:v6];
    *((void *)v6 + 3) = 0;
    *(_OWORD *)(v6 + 56) = xmmword_100F731A0;
    *((void *)v6 + 9) = 0x7FEFFFFFFFFFFFFFLL;
    id v8 = [objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___PedestrianARVKMapViewObserver queue:0];
    v9 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v8;
  }
  return (PedestrianARVKMapViewMapDelegate *)v6;
}

- (void)dealloc
{
  v3 = sub_100A601F4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocing", buf, 0xCu);
  }

  [(VKMapView *)self->_mapView setMapDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)PedestrianARVKMapViewMapDelegate;
  [(PedestrianARVKMapViewMapDelegate *)&v4 dealloc];
}

- (NSArray)currentFeatureMapping
{
  v3 = [(PedestrianARVKMapViewMapDelegate *)self activeFeatureSetMapEntry];
  objc_super v4 = [v3 featureEntries];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(PedestrianARVKMapViewMapDelegate *)self latestFeatureSetMapEntry];
    id v6 = [v7 featureEntries];
  }

  return (NSArray *)v6;
}

- (VKARWalkingFeatureSet)currentFeatureSet
{
  v3 = [(PedestrianARVKMapViewMapDelegate *)self activeFeatureSetMapEntry];
  objc_super v4 = [v3 featureSet];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(PedestrianARVKMapViewMapDelegate *)self latestFeatureSetMapEntry];
    id v6 = [v7 featureSet];
  }

  return (VKARWalkingFeatureSet *)v6;
}

- (BOOL)hasActiveFeatureSet
{
  v2 = [(PedestrianARVKMapViewMapDelegate *)self activeFeatureSetMapEntry];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)updateFeatureMapping:(id)a3
{
  id v4 = a3;
  id v5 = sub_100A601F4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v14 = 134349314;
    v15 = self;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Updated feature mapping: %@", (uint8_t *)&v14, 0x16u);
  }

  id v6 = sub_100099700(v4, &stru_1013156D0);
  v7 = [(PedestrianARVKMapViewMapDelegate *)self mapView];
  id v8 = [v7 setARWalkingFeatureSet:v6];

  if ([v6 count])
  {
    v9 = [[PedestrianARFeatureSetMapEntry alloc] initWithFeatureSet:v8 featureEntries:v4];
    [(PedestrianARVKMapViewMapDelegate *)self setLatestFeatureSetMapEntry:v9];
  }
  else
  {
    [(PedestrianARVKMapViewMapDelegate *)self setLatestFeatureSetMapEntry:0];
    [(PedestrianARVKMapViewMapDelegate *)self setActiveFeatureSetMapEntry:0];
    currentFeature = self->_currentFeature;
    self->_currentFeature = 0;

    self->_currentIdentifier = 0;
    *(_OWORD *)&self->_currentFeaturePosition.latitude = xmmword_100F731A0;
    self->_currentFeaturePosition.altitude = 1.79769313e308;
  }
  v11 = [(PedestrianARVKMapViewMapDelegate *)self activeFeatureSetMapEntry];

  if (!v11)
  {
    v12 = [(PedestrianARVKMapViewMapDelegate *)self observers];
    v13 = [(PedestrianARVKMapViewMapDelegate *)self mapView];
    [v12 mapLayer:v13 updatedFeatures:v6];
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100A601F4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134349314;
      id v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Adding observer: %@", (uint8_t *)&v7, 0x16u);
    }

    id v6 = [(PedestrianARVKMapViewMapDelegate *)self observers];
    [v6 registerObserver:v4];
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100A601F4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134349314;
      id v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Removing observer: %@", (uint8_t *)&v7, 0x16u);
    }

    id v6 = [(PedestrianARVKMapViewMapDelegate *)self observers];
    [v6 unregisterObserver:v4];
  }
}

- (void)updateGuidanceInfo:(id)a3 forFeature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v33 = sub_1005762E4();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = (PedestrianARVKMapViewMapDelegate *)"-[PedestrianARVKMapViewMapDelegate updateGuidanceInfo:forFeature:]";
      __int16 v43 = 2080;
      v44 = "PedestrianARVKMapViewMapDelegate.m";
      __int16 v45 = 1024;
      LODWORD(v46[0]) = 184;
      WORD2(v46[0]) = 2080;
      *(void *)((char *)v46 + 6) = "guidanceInfo != nil";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v34 = sub_1005762E4();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v42 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v7)
  {
    v36 = sub_1005762E4();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = (PedestrianARVKMapViewMapDelegate *)"-[PedestrianARVKMapViewMapDelegate updateGuidanceInfo:forFeature:]";
      __int16 v43 = 2080;
      v44 = "PedestrianARVKMapViewMapDelegate.m";
      __int16 v45 = 1024;
      LODWORD(v46[0]) = 185;
      WORD2(v46[0]) = 2080;
      *(void *)((char *)v46 + 6) = "feature != nil";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v37 = sub_1005762E4();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v42 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v8 = sub_100A601F4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = [v6 mapsShortDescription];
    *(_DWORD *)buf = 134349570;
    v42 = self;
    __int16 v43 = 2112;
    v44 = v9;
    __int16 v45 = 2112;
    v46[0] = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Updating guidance info: %@ for feature: %@", buf, 0x20u);
  }
  id v10 = [(PedestrianARVKMapViewMapDelegate *)self latestFeatureSetMapEntry];
  v11 = [v10 featureEntries];
  id v12 = [v11 mutableCopy];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100A60EF8;
  v39[3] = &unk_1013156F8;
  id v13 = v7;
  id v40 = v13;
  sub_1000990A8(v12, v39);
  int v14 = (char *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = sub_100A601F4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v42 = self;
      __int16 v43 = 2112;
      v44 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Found current entry: %@", buf, 0x16u);
    }

    [v12 removeObject:v14];
    __int16 v16 = [[PedestrianARVKFeatureMapEntry alloc] initWithFeature:v13 guidanceInfo:v6];
    [v12 addObject:v16];
    id v17 = [PedestrianARFeatureSetMapEntry alloc];
    v18 = [(PedestrianARVKMapViewMapDelegate *)self latestFeatureSetMapEntry];
    __int16 v19 = [v18 featureSet];
    id v20 = [v12 copy];
    __int16 v21 = [(PedestrianARFeatureSetMapEntry *)v17 initWithFeatureSet:v19 featureEntries:v20];
    [(PedestrianARVKMapViewMapDelegate *)self setLatestFeatureSetMapEntry:v21];

    v22 = [(PedestrianARVKMapViewMapDelegate *)self latestFeatureSetMapEntry];
    v23 = [v22 featureSet];
    v24 = (char *)[v23 state] - 3;

    if ((unint64_t)v24 <= 1)
    {
      v25 = sub_100A601F4();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = [(PedestrianARVKMapViewMapDelegate *)self latestFeatureSetMapEntry];
        *(_DWORD *)buf = 134349314;
        v42 = self;
        __int16 v43 = 2112;
        v44 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%{public}p] Latest feature set is already active; switching it to the active set: %@",
          buf,
          0x16u);
      }
      v27 = [(PedestrianARVKMapViewMapDelegate *)self latestFeatureSetMapEntry];
      [(PedestrianARVKMapViewMapDelegate *)self setActiveFeatureSetMapEntry:v27];
    }
    v28 = [(PedestrianARVKMapViewMapDelegate *)self observers];
    v29 = [(PedestrianARVKMapViewMapDelegate *)self mapView];
    [v28 mapLayer:v29 guidanceInfoDidUpdate:v6 forFeature:v13];
  }
  else
  {
    v30 = sub_1005762E4();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v42 = (PedestrianARVKMapViewMapDelegate *)"-[PedestrianARVKMapViewMapDelegate updateGuidanceInfo:forFeature:]";
      __int16 v43 = 2080;
      v44 = "PedestrianARVKMapViewMapDelegate.m";
      __int16 v45 = 1024;
      LODWORD(v46[0]) = 196;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v31 = sub_1005762E4();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v42 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    sub_100A601F4();
    __int16 v16 = (PedestrianARVKFeatureMapEntry *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v42 = self;
      _os_log_impl((void *)&_mh_execute_header, &v16->super, OS_LOG_TYPE_ERROR, "[%{public}p] Cannot update guidance info for feature which does not exist in the mapping", buf, 0xCu);
    }
  }
}

- (id)guidanceInfoForFeature:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v16 = "-[PedestrianARVKMapViewMapDelegate guidanceInfoForFeature:]";
      __int16 v17 = 2080;
      v18 = "PedestrianARVKMapViewMapDelegate.m";
      __int16 v19 = 1024;
      int v20 = 218;
      __int16 v21 = 2080;
      v22 = "feature != nil";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v5 = [(PedestrianARVKMapViewMapDelegate *)self currentFeatureMapping];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100A61164;
  v13[3] = &unk_1013156F8;
  id v14 = v4;
  id v6 = v4;
  id v7 = sub_1000990A8(v5, v13);

  id v8 = [v7 guidanceInfo];

  return v8;
}

- (void)mapLayer:(id)a3 arWalkingFeatureSetStateDidUpdate:(id)a4
{
  id v5 = a4;
  id v6 = sub_100A601F4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v18 = 134349314;
    __int16 v19 = self;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] VK updated AR walking feature set: %@", (uint8_t *)&v18, 0x16u);
  }

  id v7 = [(PedestrianARVKMapViewMapDelegate *)self latestFeatureSetMapEntry];
  id v8 = [v7 featureSet];
  __int16 v9 = (char *)[v8 state] - 3;

  if ((unint64_t)v9 <= 1)
  {
    id v10 = sub_100A601F4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [(PedestrianARVKMapViewMapDelegate *)self latestFeatureSetMapEntry];
      int v18 = 134349314;
      __int16 v19 = self;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Latest feature set is now active; switching it to the active set: %@",
        (uint8_t *)&v18,
        0x16u);
    }
    id v12 = [(PedestrianARVKMapViewMapDelegate *)self latestFeatureSetMapEntry];
    [(PedestrianARVKMapViewMapDelegate *)self setActiveFeatureSetMapEntry:v12];

    id v13 = [(PedestrianARVKMapViewMapDelegate *)self activeFeatureSetMapEntry];
    id v14 = [v13 featureEntries];
    v15 = sub_100099700(v14, &stru_101315718);

    __int16 v16 = [(PedestrianARVKMapViewMapDelegate *)self observers];
    __int16 v17 = [(PedestrianARVKMapViewMapDelegate *)self mapView];
    [v16 mapLayer:v17 updatedFeatures:v15];
  }
}

- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_100A601F4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v15 = 134349314;
    __int16 v16 = self;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] VK updated active AR walking feature: %@", (uint8_t *)&v15, 0x16u);
  }

  __int16 v9 = [v6 feature];
  currentFeature = self->_currentFeature;
  self->_currentFeature = v9;

  self->_currentIdentifier = (unint64_t)[v6 featureLabelIdentifier];
  [v6 labelPosition];
  self->_currentFeaturePosition.latitude = v11;
  self->_currentFeaturePosition.longitude = v12;
  self->_currentFeaturePosition.altitude = v13;
  id v14 = [(PedestrianARVKMapViewMapDelegate *)self observers];
  [v14 mapLayer:v7 activeARWalkingFeatureDidUpdate:v6];
}

- (void)mapLayer:(id)a3 arWalkingElevationRequestFailure:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_100A601F4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v10 = 134349312;
    double v11 = self;
    __int16 v12 = 2048;
    id v13 = [v6 reason];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{public}p] Detected elevation request failure: %ld", (uint8_t *)&v10, 0x16u);
  }

  __int16 v9 = [(PedestrianARVKMapViewMapDelegate *)self observers];
  [v9 mapLayer:v7 failedElevationRequestWithReason:[v6 reason]];
}

- (VKMapView)mapView
{
  return self->_mapView;
}

- (VKARWalkingFeature)currentFeature
{
  return self->_currentFeature;
}

- (unint64_t)currentIdentifier
{
  return self->_currentIdentifier;
}

- ($1AB5FA073B851C12C2339EC22442E995)currentFeaturePosition
{
  double latitude = self->_currentFeaturePosition.latitude;
  double longitude = self->_currentFeaturePosition.longitude;
  double altitude = self->_currentFeaturePosition.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (PedestrianARFeatureSetMapEntry)latestFeatureSetMapEntry
{
  return self->_latestFeatureSetMapEntry;
}

- (void)setLatestFeatureSetMapEntry:(id)a3
{
}

- (PedestrianARFeatureSetMapEntry)activeFeatureSetMapEntry
{
  return self->_activeFeatureSetMapEntry;
}

- (void)setActiveFeatureSetMapEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeFeatureSetMapEntry, 0);
  objc_storeStrong((id *)&self->_latestFeatureSetMapEntry, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentFeature, 0);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end