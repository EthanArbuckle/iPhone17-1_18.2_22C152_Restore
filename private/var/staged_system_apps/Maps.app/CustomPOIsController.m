@interface CustomPOIsController
- (BOOL)allowSingleSearchResult;
- (CustomPOIsController)init;
- (MKMapView)mapView;
- (id)activeInjectedAnnotation;
- (id)injectSearchResultIfNeeded:(id)a3;
- (int64_t)_preferredDisplayedSearchResultTypeWithItems:(id)a3;
- (void)_addAfterUpdateBlock:(id)a3;
- (void)_createPOIsForItems:(id)a3;
- (void)clearInjectSearchResult;
- (void)clearSearchResultStyle;
- (void)customFeatureForKey:(id)a3 completion:(id)a4;
- (void)customFeatureForKeys:(id)a3 completion:(id)a4;
- (void)customFeatureStore:(id)a3 annotationTextForClusterFeatureCount:(unint64_t)a4 text:(id *)a5 locale:(id *)a6;
- (void)dealloc;
- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5;
- (void)personalizedItemManagerWillChangeItems:(id)a3;
- (void)setActiveInjectedAnnotation:(id)a3;
- (void)setAllowSingleSearchResult:(BOOL)a3;
- (void)setMapView:(id)a3;
- (void)userDefaultsDidChange:(id)a3;
@end

@implementation CustomPOIsController

- (void)setMapView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  if (WeakRetained != v4)
  {
    v6 = sub_1000F03EC();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      id v13 = objc_loadWeakRetained((id *)&self->_mapView);
      [v13 _removeCustomFeatureDataSource:self->_customFeaturesStore];

      id v14 = objc_loadWeakRetained((id *)&self->_mapView);
      [v14 _removeCustomFeatureDataSource:self->_clusteringFeaturesStore];

      id v15 = objc_storeWeak((id *)&self->_mapView, v4);
      [v4 _addCustomFeatureDataSource:self->_customFeaturesStore];

      id v16 = objc_loadWeakRetained((id *)&self->_mapView);
      [v16 _addCustomFeatureDataSource:self->_clusteringFeaturesStore];

      goto LABEL_13;
    }
    v7 = self;
    if (!v7)
    {
      v12 = @"<nil>";
      goto LABEL_11;
    }
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      v10 = [(CustomPOIsController *)v7 performSelector:"accessibilityIdentifier"];
      v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_9;
      }
    }
    v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Got a new map view: %@", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:
}

- (CustomPOIsController)init
{
  v44.receiver = self;
  v44.super_class = (Class)CustomPOIsController;
  v2 = [(CustomPOIsController *)&v44 init];
  if (!v2) {
    return v2;
  }
  v3 = sub_1000F03EC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(CustomPOIsController *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v46 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] Initializing", buf, 0xCu);
  }
  if (qword_101610F50 != -1) {
    dispatch_once(&qword_101610F50, &stru_101321828);
  }
  v10 = (_MKCustomFeatureStore *)[objc_alloc((Class)_MKCustomFeatureStore) initWithClustering:0];
  customFeaturesStore = v2->_customFeaturesStore;
  v2->_customFeaturesStore = v10;

  v12 = (_MKCustomFeatureStore *)[objc_alloc((Class)_MKCustomFeatureStore) initWithClustering:1];
  clusteringFeaturesStore = v2->_clusteringFeaturesStore;
  v2->_clusteringFeaturesStore = v12;

  id v14 = +[NSLocale currentLocale];
  id v15 = [v14 localeIdentifier];
  id v16 = [v15 componentsSeparatedByString:@"_"];
  v17 = [v16 firstObject];
  uint64_t v18 = [v17 lowercaseString];
  annotationLocale = v2->_annotationLocale;
  v2->_annotationLocale = (NSString *)v18;

  if (![(NSString *)v2->_annotationLocale length])
  {
    id v20 = v2->_annotationLocale;
    v2->_annotationLocale = (NSString *)@"und";
  }
  v21 = v2->_clusteringFeaturesStore;
  v22 = +[NSBundle mainBundle];
  v23 = [v22 localizedStringForKey:@"Search result cluster subtitle, generic", @"localized string not found", 0 value table];
  [(_MKCustomFeatureStore *)v21 setClusterAnnotationText:v23 locale:v2->_annotationLocale];

  v24 = +[GEOFeatureStyleAttributes searchResultStyleAttributes];
  [(_MKCustomFeatureStore *)v2->_clusteringFeaturesStore setClusterStyleAttributes:v24];

  [(_MKCustomFeatureStore *)v2->_clusteringFeaturesStore setSceneID:1];
  [(_MKCustomFeatureStore *)v2->_clusteringFeaturesStore setDelegate:v2];
  uint64_t v25 = +[NSHashTable hashTableWithOptions:512];
  clusteringFeaturesPendingRemoval = v2->_clusteringFeaturesPendingRemoval;
  v2->_clusteringFeaturesPendingRemoval = (NSHashTable *)v25;

  uint64_t v27 = +[NSMutableArray array];
  afterUpdateBlocks = v2->_afterUpdateBlocks;
  v2->_afterUpdateBlocks = (NSMutableArray *)v27;

  v29 = +[NSUserDefaults standardUserDefaults];
  byte_101610F40 = [v29 BOOLForKey:@"__personalizedMapsInjectedPOIsLookLikeAirports"];

  v30 = +[NSUserDefaults standardUserDefaults];
  uint64_t v31 = [v30 stringForKey:@"__personalizedMapsOverrideLocale"];
  v32 = (void *)qword_101610F48;
  qword_101610F48 = v31;

  v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v34 = dispatch_queue_create("CustomPOIsController.lock", v33);
  lock = v2->_lock;
  v2->_lock = (OS_dispatch_queue *)v34;

  v36 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v37 = dispatch_queue_create("CustomPOIsController.calculate", v36);
  calculationQueue = v2->_calculationQueue;
  v2->_calculationQueue = (OS_dispatch_queue *)v37;

  customPOIs = v2->_customPOIs;
  v2->_customPOIs = (NSDictionary *)&__NSDictionary0__struct;

  uint64_t v40 = geo_isolater_create();
  activeInjectedAnnotationLock = v2->_activeInjectedAnnotationLock;
  v2->_activeInjectedAnnotationLock = (geo_isolater *)v40;

  v42 = +[NSNotificationCenter defaultCenter];
  [v42 addObserver:v2 selector:"userDefaultsDidChange:" name:NSUserDefaultsDidChangeNotification object:0];

  return v2;
}

- (void)userDefaultsDidChange:(id)a3
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"__personalizedMapsInjectedPOIsLookLikeAirports"];

  v6 = +[NSUserDefaults standardUserDefaults];
  uint64_t v7 = [v6 stringForKey:@"__personalizedMapsOverrideLocale"];

  if (byte_101610F40 != v5
    || qword_101610F48 | v7 && ([(id)qword_101610F48 isEqualToString:v7] & 1) == 0)
  {
    byte_101610F40 = v5;
    objc_storeStrong((id *)&qword_101610F48, (id)v7);
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_100104520;
    v11[4] = sub_100104B00;
    id v12 = 0;
    lock = self->_lock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100CF17B0;
    block[3] = &unk_1012E73F0;
    block[4] = self;
    block[5] = v11;
    dispatch_sync(lock, block);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100CF17FC;
    v9[3] = &unk_1012E67C0;
    v9[4] = self;
    v9[5] = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
    _Block_object_dispose(v11, 8);
  }
}

- (void)_createPOIsForItems:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  if (!WeakRetained)
  {
    v23 = sub_1000F03EC();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
LABEL_23:

      goto LABEL_24;
    }
    v24 = self;
    if (!v24)
    {
      v29 = @"<nil>";
      goto LABEL_22;
    }
    uint64_t v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v27 = [(CustomPOIsController *)v24 performSelector:"accessibilityIdentifier"];
      v28 = v27;
      if (v27 && ![v27 isEqualToString:v26])
      {
        v29 = +[NSString stringWithFormat:@"%@<%p, %@>", v26, v24, v28];

        goto LABEL_20;
      }
    }
    v29 = +[NSString stringWithFormat:@"%@<%p>", v26, v24];
LABEL_20:

LABEL_22:
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v29;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot create POIs, no map view", (uint8_t *)&buf, 0xCu);

    goto LABEL_23;
  }
  [@"com.apple.Maps" UTF8String];
  GEOFindOrCreateLog();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, v8, "CreatePOIsForItems", "", (uint8_t *)&buf, 2u);
    }
  }

  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  int v42 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v50 = 0x3032000000;
  v51 = sub_100104520;
  v52 = sub_100104B00;
  id v53 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D0F0;
  block[3] = &unk_1013037D8;
  block[4] = self;
  block[5] = &v39;
  void block[6] = &buf;
  dispatch_sync(lock, block);
  v10 = sub_1000F03EC();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    goto LABEL_12;
  }
  v11 = self;
  id v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  if (objc_opt_respondsToSelector())
  {
    id v14 = [(CustomPOIsController *)v11 performSelector:"accessibilityIdentifier"];
    id v15 = v14;
    if (v14 && ([v14 isEqualToString:v13] & 1) == 0)
    {
      id v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

      goto LABEL_11;
    }
  }
  id v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_11:

  int v17 = *((_DWORD *)v40 + 6);
  *(_DWORD *)v43 = 138543874;
  objc_super v44 = v16;
  __int16 v45 = 2112;
  id v46 = v4;
  __int16 v47 = 1024;
  int v48 = v17;
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Creating POIs for items: %@ with counter: %d", v43, 0x1Cu);

LABEL_12:
  id v18 = objc_loadWeakRetained((id *)&self->_mapView);
  __int16 v19 = [v18 _calloutShowAnimationGroup];

  objc_initWeak((id *)v43, self);
  calculationQueue = self->_calculationQueue;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000CA21C;
  v30[3] = &unk_1013218A0;
  uint64_t v31 = v6;
  v21 = v6;
  objc_copyWeak(&v37, (id *)v43);
  p_long long buf = &buf;
  id v32 = v4;
  v33 = self;
  v36 = &v39;
  id v34 = v19;
  id v22 = v19;
  dispatch_async(calculationQueue, v30);

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)v43);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v39, 8);
LABEL_24:
}

- (void)personalizedItemManagerWillChangeItems:(id)a3
{
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100105658;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_sync(lock, block);
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (int64_t)_preferredDisplayedSearchResultTypeWithItems:(id)a3
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        os_signpost_id_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v9 = [v8 items];
        id v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v18;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v18 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v17 + 1) + 8 * (void)j);
              if ((objc_opt_respondsToSelector() & 1) != 0 && [v14 preferredDisplayedSearchResultType])
              {
                id v15 = [v14 preferredDisplayedSearchResultType];

                goto LABEL_20;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
      id v15 = 0;
    }
    while (v5);
  }
  else
  {
    id v15 = 0;
  }
LABEL_20:

  return (int64_t)v15;
}

- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100090828;
  v6[3] = &unk_1012E5D58;
  v6[4] = self;
  id v7 = a4;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setAllowSingleSearchResult:(BOOL)a3
{
  self->_allowSingleSearchResult = a3;
}

- (void)dealloc
{
  id v3 = sub_1000F03EC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(CustomPOIsController *)v4 performSelector:"accessibilityIdentifier"];
      os_signpost_id_t v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)long long buf = 138543362;
    uint64_t v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] Deallocing", buf, 0xCu);
  }
  v10.receiver = self;
  v10.super_class = (Class)CustomPOIsController;
  [(CustomPOIsController *)&v10 dealloc];
}

- (void)customFeatureForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = +[NSSet setWithObject:a3];
  os_signpost_id_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = +[NSSet set];
  }
  id v10 = v9;

  [(CustomPOIsController *)self customFeatureForKeys:v10 completion:v6];
}

- (void)customFeatureForKeys:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = sub_100CF1BBC;
  long long v21 = sub_100CF1BE8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100CF1BF0;
  v13[3] = &unk_1012E96B8;
  objc_copyWeak(&v16, &location);
  id v8 = v6;
  id v14 = v8;
  id v9 = v7;
  id v15 = v9;
  long long v22 = objc_retainBlock(v13);
  lock = self->_lock;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100CF1E44;
  v12[3] = &unk_1012E67C0;
  v12[4] = self;
  v12[5] = &v17;
  dispatch_sync(lock, v12);
  uint64_t v11 = v18[5];
  if (v11) {
    (*(void (**)(void))(v11 + 16))();
  }
  _Block_object_dispose(&v17, 8);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_addAfterUpdateBlock:(id)a3
{
  afterUpdateBlocks = self->_afterUpdateBlocks;
  id v4 = [a3 copy];
  [(NSMutableArray *)afterUpdateBlocks addObject:v4];
}

- (void)customFeatureStore:(id)a3 annotationTextForClusterFeatureCount:(unint64_t)a4 text:(id *)a5 locale:(id *)a6
{
  if (self->_clusteringFeaturesStore == a3)
  {
    id v10 = +[NSUserDefaults standardUserDefaults];
    unsigned int v11 = [v10 BOOLForKey:@"__personalizedMapsShowClusterCountInSubtitle"];

    if (a5 && v11)
    {
      if (a4) {
        uint64_t v12 = (a4 - 1);
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = +[NSBundle mainBundle];
      id v14 = [v13 localizedStringForKey:@"Search result cluster subtitle" value:@"localized string not found" table:0];

      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v12);
      id v15 = objc_claimAutoreleasedReturnValue();
      *a5 = v15;
    }
    if (a6) {
      *a6 = self->_annotationLocale;
    }
  }
}

- (id)injectSearchResultIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchResultMapItemBase *)[SearchResultMapItem alloc] initWithSearchResult:v4];
  id v6 = v5;
  if (!v5)
  {
    id v7 = sub_1000F03EC();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_36:
      id v15 = 0;
      goto LABEL_37;
    }
    uint64_t v31 = self;
    if (!v31)
    {
      v36 = @"<nil>";
      goto LABEL_35;
    }
    id v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    if (objc_opt_respondsToSelector())
    {
      id v34 = [(CustomPOIsController *)v31 performSelector:"accessibilityIdentifier"];
      v35 = v34;
      if (v34 && ![v34 isEqualToString:v33])
      {
        v36 = +[NSString stringWithFormat:@"%@<%p, %@>", v33, v31, v35];

        goto LABEL_33;
      }
    }
    v36 = +[NSString stringWithFormat:@"%@<%p>", v33, v31];
LABEL_33:

LABEL_35:
    *(_DWORD *)long long buf = 138543618;
    id v46 = v36;
    __int16 v47 = 2080;
    int v48 = "-[CustomPOIsController injectSearchResultIfNeeded:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%{public}@] %s: Failed to create PersonalizedItem item", buf, 0x16u);

    goto LABEL_36;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v7 = [(SearchResultMapItemBase *)v5 keys];
  id v8 = [v7 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (!v8) {
    goto LABEL_10;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v39;
  while (2)
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v39 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = [(NSDictionary *)self->_customPOIs objectForKeyedSubscript:*(void *)(*((void *)&v38 + 1) + 8 * i)];
      if (v12)
      {
        id v15 = (POIAnnotation *)v12;
        long long v24 = sub_1000F03EC();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
          goto LABEL_25;
        }
        uint64_t v25 = self;
        v26 = (objc_class *)objc_opt_class();
        uint64_t v27 = NSStringFromClass(v26);
        if (objc_opt_respondsToSelector())
        {
          v28 = [(CustomPOIsController *)v25 performSelector:"accessibilityIdentifier"];
          v29 = v28;
          if (v28 && ![v28 isEqualToString:v27])
          {
            v30 = +[NSString stringWithFormat:@"%@<%p, %@>", v27, v25, v29];

            goto LABEL_24;
          }
        }
        v30 = +[NSString stringWithFormat:@"%@<%p>", v27, v25];
LABEL_24:

        *(_DWORD *)long long buf = 138543618;
        id v46 = v30;
        __int16 v47 = 2080;
        int v48 = "-[CustomPOIsController injectSearchResultIfNeeded:]";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}@] %s: Using cached annotation", buf, 0x16u);

        goto LABEL_25;
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_10:

  id v13 = [PersonalizedCompoundItem alloc];
  v43 = v6;
  id v14 = +[NSArray arrayWithObjects:&v43 count:1];
  id v7 = [(PersonalizedCompoundItem *)v13 initWithItems:v14];

  id v15 = [[POIAnnotation alloc] initWithItem:v7 defaultLocale:self->_annotationLocale];
  [(CustomPOIsController *)self setActiveInjectedAnnotation:v15];
  id v16 = sub_1000F03EC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = self;
    long long v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_15;
    }
    long long v20 = [(CustomPOIsController *)v17 performSelector:"accessibilityIdentifier"];
    long long v21 = v20;
    if (v20 && ![v20 isEqualToString:v19])
    {
      long long v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];
    }
    else
    {

LABEL_15:
      long long v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
    }

    *(_DWORD *)long long buf = 138543618;
    id v46 = v22;
    __int16 v47 = 2080;
    int v48 = "-[CustomPOIsController injectSearchResultIfNeeded:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] %s: Adding new annotation", buf, 0x16u);
  }
  customFeaturesStore = self->_customFeaturesStore;
  int v42 = v15;
  long long v24 = +[NSArray arrayWithObjects:&v42 count:1];
  [(_MKCustomFeatureStore *)customFeaturesStore addAnnotations:v24];
LABEL_25:

LABEL_37:

  return v15;
}

- (void)clearInjectSearchResult
{
}

- (id)activeInjectedAnnotation
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = sub_100104520;
  id v8 = sub_100104B00;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)setActiveInjectedAnnotation:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

- (void)clearSearchResultStyle
{
  id v3 = [(_MKCustomFeatureStore *)self->_clusteringFeaturesStore allAnnotations];
  id v4 = [v3 count];
  id v5 = sub_1000F03EC();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4 != (id)1)
  {
    if (!v6) {
      goto LABEL_18;
    }
    id v14 = self;
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v17 = [(CustomPOIsController *)v14 performSelector:"accessibilityIdentifier"];
      long long v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        uint64_t v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

        goto LABEL_17;
      }
    }
    uint64_t v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_17:

    *(_DWORD *)long long buf = 138543362;
    long long v21 = v19;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Not clearing search result style, no clustered annotations", buf, 0xCu);

    goto LABEL_18;
  }
  if (!v6) {
    goto LABEL_9;
  }
  id v7 = self;
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [(CustomPOIsController *)v7 performSelector:"accessibilityIdentifier"];
    unsigned int v11 = v10;
    if (v10 && ![v10 isEqualToString:v9])
    {
      uint64_t v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

      goto LABEL_8;
    }
  }
  uint64_t v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

  *(_DWORD *)long long buf = 138543362;
  long long v21 = v12;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Clearing search result style", buf, 0xCu);

LABEL_9:
  id v5 = [v3 firstObject];
  if ([v5 isLabelPOI])
  {
    self->_regionSearchResultCleared = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    [WeakRetained _setDisplayedSearchResultsType:0];
  }
LABEL_18:
}

- (BOOL)allowSingleSearchResult
{
  return self->_allowSingleSearchResult;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_activeInjectedAnnotationLock, 0);
  objc_storeStrong((id *)&self->_activeInjectedAnnotation, 0);
  objc_storeStrong((id *)&self->_afterUpdateBlocks, 0);
  objc_storeStrong((id *)&self->_customPOIs, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_clusteringFeaturesPendingRemoval, 0);
  objc_storeStrong((id *)&self->_clusteringFeaturesStore, 0);
  objc_storeStrong((id *)&self->_customFeaturesStore, 0);
  objc_storeStrong((id *)&self->_annotationLocale, 0);
  objc_storeStrong((id *)&self->_calculationQueue, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end