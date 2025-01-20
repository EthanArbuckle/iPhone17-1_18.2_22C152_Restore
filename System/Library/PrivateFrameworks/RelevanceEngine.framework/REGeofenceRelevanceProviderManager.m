@interface REGeofenceRelevanceProviderManager
+ (Class)_relevanceProviderClass;
+ (id)_dependencyClasses;
+ (id)_features;
- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5;
- (id)_valueForProvider:(id)a3 feature:(id)a4;
- (int)_queryRevokableStatusForProvider:(id)a3;
@end

@implementation REGeofenceRelevanceProviderManager

+ (id)_features
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = +[REFeature geofenceFeature];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
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

- (int)_queryRevokableStatusForProvider:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = +[RESingleton sharedInstance];
  v6 = [v4 bundleIdentifier];
  v7 = [(RERelevanceProviderManager *)self _manager_queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__REGeofenceRelevanceProviderManager__queryRevokableStatusForProvider___block_invoke;
  v11[3] = &unk_2644BDA40;
  objc_copyWeak(&v13, &location);
  id v8 = v4;
  id v12 = v8;
  int v9 = [v5 cachedAuthorizationStatusForBundleIdentifier:v6 invalidationUpdateQueue:v7 withCallback:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __71__REGeofenceRelevanceProviderManager__queryRevokableStatusForProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = +[RERelevanceProviderManagerUpdate immediateUpdateForProvider:*(void *)(a1 + 32)];
  [WeakRetained _scheduleUpdate:v2];
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  return [(REGeofenceRelevanceProviderManager *)self _valueForProvider:a3 context:0 feature:a4];
}

- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [a4 attributeForKey:@"RETrainingContextLocationKey"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    id v8 = [(RESharedLocationRelevanceProviderManager *)self currentLocation];
    goto LABEL_6;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_6:
  int v9 = [v7 bundleIdentifier];

  if (!v9
    || [(REGeofenceRelevanceProviderManager *)self _queryRevokableStatusForProvider:v7]- 3 < 2)
  {
    v10 = [v7 region];
    [v10 radius];
    double v12 = v11;
    id v13 = objc_alloc(MEMORY[0x263F00A50]);
    [v10 center];
    double v15 = v14;
    [v10 center];
    v16 = objc_msgSend(v13, "initWithLatitude:longitude:", v15);
    [v8 distanceFromLocation:v16];
    double v18 = v17;
    if (v17 < v12 + v12)
    {
      if ([v10 notifyOnEntry])
      {
        if (v18 > v12)
        {
LABEL_11:
          double v19 = 0.300000012;
LABEL_22:
          v22 = +[REFeatureValue featureValueWithDouble:v19];

          goto LABEL_23;
        }
LABEL_17:
        double v19 = 1.0;
        goto LABEL_22;
      }
      if ([v10 notifyOnExit])
      {
        if (v18 < v12) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
      v23 = RELogForDomain(5);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_21E6E6000, v23, OS_LOG_TYPE_DEFAULT, "Invalid region in REGeofenceRelevanceProvider. Region must be either notifyOnExit or notifyOnEntry.", (uint8_t *)&v25, 2u);
      }
    }
    double v19 = 0.0;
    goto LABEL_22;
  }
  v20 = RELogForDomain(5);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = [v7 bundleIdentifier];
    int v25 = 136315138;
    uint64_t v26 = [v21 UTF8String];
    _os_log_impl(&dword_21E6E6000, v20, OS_LOG_TYPE_INFO, "Bundle identifier (%s) lacks geofence permission. Skipping relevance.", (uint8_t *)&v25, 0xCu);
  }
  v22 = +[REFeatureValue featureValueWithDouble:0.0];
LABEL_23:

  return v22;
}

@end