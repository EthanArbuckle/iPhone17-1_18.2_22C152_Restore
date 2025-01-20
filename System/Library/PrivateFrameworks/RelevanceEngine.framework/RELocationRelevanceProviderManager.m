@interface RELocationRelevanceProviderManager
+ (Class)_relevanceProviderClass;
+ (id)_dependencyClasses;
+ (id)_features;
- (id)_locationOfProvider:(id)a3;
- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5;
- (id)_valueForProvider:(id)a3 feature:(id)a4;
- (int)_queryRevokableStatusForProvider:(id)a3;
- (void)pause;
- (void)predictorDidUpdate:(id)a3;
- (void)resume;
@end

@implementation RELocationRelevanceProviderManager

+ (id)_features
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = +[REFeature locationFeature];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)_locationOfProvider:(id)a3
{
  id v4 = a3;
  if ([v4 type])
  {
    unint64_t v5 = [v4 type];

    if (v5 >= 5) {
      unint64_t v6 = 0;
    }
    else {
      unint64_t v6 = v5 - 1;
    }
    v7 = [(RERelevanceProviderManager *)self environment];
    id v4 = [v7 relevanceEngine];

    v8 = +[RESingleton sharedInstance];
    v9 = [v8 locationForEngine:v4 userLocation:v6];
  }
  else
  {
    v9 = [v4 location];
  }

  return v9;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)_dependencyClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  return [(RELocationRelevanceProviderManager *)self _valueForProvider:a3 context:0 feature:a4];
}

- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = [a4 attributeForKey:@"RETrainingContextLocationKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v8) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v8 = [(RESharedLocationRelevanceProviderManager *)self currentLocation];
LABEL_6:
  v9 = RELogForDomain(5);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 138412290;
    double v37 = *(double *)&v8;
    _os_log_impl(&dword_21E6E6000, v9, OS_LOG_TYPE_DEFAULT, "in _valueForProvider, deviceLocation is %@", (uint8_t *)&v36, 0xCu);
  }

  if (!v8)
  {
    v22 = RELogForDomain(5);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      _os_log_impl(&dword_21E6E6000, v22, OS_LOG_TYPE_DEFAULT, "Device location is unknown", (uint8_t *)&v36, 2u);
    }
    goto LABEL_29;
  }
  v10 = [v7 bundleIdentifier];

  if (v10)
  {
    int v11 = [(RELocationRelevanceProviderManager *)self _queryRevokableStatusForProvider:v7];
    uint64_t v12 = [v7 type];
    BOOL v13 = (v11 - 3) < 2;
    if (v12) {
      BOOL v13 = v11 == 3;
    }
    if (!v13)
    {
      v22 = RELogForDomain(5);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = [v7 bundleIdentifier];
        uint64_t v24 = [v23 UTF8String];
        int v36 = 136315138;
        double v37 = *(double *)&v24;
        _os_log_impl(&dword_21E6E6000, v22, OS_LOG_TYPE_INFO, "Bundle identifier (%s) lacks location permission. Skipping relevance.", (uint8_t *)&v36, 0xCu);
      }
LABEL_29:

      v25 = +[REFeatureValue featureValueWithDouble:0.0];
      goto LABEL_35;
    }
  }
  v14 = [(RELocationRelevanceProviderManager *)self _locationOfProvider:v7];
  v15 = RELogForDomain(5);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 138412290;
    double v37 = *(double *)&v14;
    _os_log_impl(&dword_21E6E6000, v15, OS_LOG_TYPE_DEFAULT, "location is %@", (uint8_t *)&v36, 0xCu);
  }

  if (v14)
  {
    [v14 distanceFromLocation:v8];
    double v17 = v16;
    v18 = RELogForDomain(5);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 134218242;
      double v37 = v17;
      __int16 v38 = 2112;
      id v39 = v7;
      _os_log_impl(&dword_21E6E6000, v18, OS_LOG_TYPE_DEFAULT, "%f distance to %@", (uint8_t *)&v36, 0x16u);
    }

    [v14 coordinate];
    if (CLLocationCoordinate2DIsValid(v42) && ([v8 coordinate], CLLocationCoordinate2DIsValid(v43)))
    {
      if (v17 >= 0.0)
      {
        [v7 accuracy];
        if (v17 >= v29)
        {
          [v7 accuracy];
          double v32 = v17 - v31;
          [v7 radius];
          double v34 = v33;
          [v7 accuracy];
          double v20 = 1.0 - REPercentThroughRange(v32, 0.0, v34 - v35);
          v19 = RELogForDomain(5);
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_34;
          }
          int v36 = 134217984;
          double v37 = v20;
          v21 = "location was not nil, returning the feature value: %f";
          v26 = v19;
          uint32_t v27 = 12;
        }
        else
        {
          v19 = RELogForDomain(5);
          double v20 = 1.0;
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_34;
          }
          [v7 accuracy];
          int v36 = 134218240;
          double v37 = v17;
          __int16 v38 = 2048;
          id v39 = v30;
          v21 = "within the buffer since the distance is %f, returning 1.0 for feature value. provider accuracy is: %f.";
          v26 = v19;
          uint32_t v27 = 22;
        }
        goto LABEL_33;
      }
      v19 = RELogForDomain(5);
      double v20 = 0.0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        v21 = "Distance is negative, returning 0.0. for feature value.";
LABEL_32:
        v26 = v19;
        uint32_t v27 = 2;
LABEL_33:
        _os_log_impl(&dword_21E6E6000, v26, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v36, v27);
      }
    }
    else
    {
      v19 = RELogForDomain(5);
      double v20 = 0.0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        v21 = "Invalid location coordinate.";
        goto LABEL_32;
      }
    }
  }
  else
  {
    v19 = RELogForDomain(5);
    double v20 = 0.0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      v21 = "location was nil, returning 0.0 for feature value";
      goto LABEL_32;
    }
  }
LABEL_34:

  v25 = +[REFeatureValue featureValueWithDouble:v20];

LABEL_35:
  return v25;
}

- (int)_queryRevokableStatusForProvider:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unint64_t v5 = [v4 bundleIdentifier];
  uint64_t v6 = REWatchKitExtensionForApplicationIdentifier(v5);
  id v7 = (void *)v6;
  if (v6) {
    v8 = (void *)v6;
  }
  else {
    v8 = v5;
  }
  id v9 = v8;

  v10 = +[RESingleton sharedInstance];
  int v11 = [(RERelevanceProviderManager *)self _manager_queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__RELocationRelevanceProviderManager__queryRevokableStatusForProvider___block_invoke;
  v15[3] = &unk_2644BDA40;
  objc_copyWeak(&v17, &location);
  id v12 = v4;
  id v16 = v12;
  int v13 = [v10 cachedAuthorizationStatusForBundleIdentifier:v9 invalidationUpdateQueue:v11 withCallback:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __71__RELocationRelevanceProviderManager__queryRevokableStatusForProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = +[RERelevanceProviderManagerUpdate immediateUpdateForProvider:*(void *)(a1 + 32)];
  [WeakRetained _scheduleUpdate:v2];
}

- (void)resume
{
  v4.receiver = self;
  v4.super_class = (Class)RELocationRelevanceProviderManager;
  [(RESharedLocationRelevanceProviderManager *)&v4 resume];
  uint64_t v3 = +[RESingleton sharedInstance];
  [v3 addObserver:self];
}

- (void)pause
{
  v4.receiver = self;
  v4.super_class = (Class)RELocationRelevanceProviderManager;
  [(RESharedLocationRelevanceProviderManager *)&v4 pause];
  uint64_t v3 = +[RESingleton sharedInstance];
  [v3 removeObserver:self];
}

- (void)predictorDidUpdate:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__RELocationRelevanceProviderManager_predictorDidUpdate___block_invoke;
  v3[3] = &unk_2644BC7D8;
  v3[4] = self;
  [(RERelevanceProviderManager *)self _enumerateProviders:v3];
}

void __57__RELocationRelevanceProviderManager_predictorDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 type])
  {
    uint64_t v3 = *(void **)(a1 + 32);
    objc_super v4 = +[RERelevanceProviderManagerUpdate immediateUpdateForProvider:v5];
    [v3 _scheduleUpdate:v4];
  }
}

@end