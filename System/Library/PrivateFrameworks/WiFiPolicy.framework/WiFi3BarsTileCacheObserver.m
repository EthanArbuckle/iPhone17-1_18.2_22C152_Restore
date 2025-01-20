@interface WiFi3BarsTileCacheObserver
- (TBDataSourceMediator)dataSourceMediator;
- (WiFi3BarsTileCacheObserver)initWithDataSourceMediator:(id)a3;
- (void)_scheduleXPCActivity;
- (void)_submitCacheAvailabilityMetric;
- (void)setDataSourceMediator:(id)a3;
@end

@implementation WiFi3BarsTileCacheObserver

- (WiFi3BarsTileCacheObserver)initWithDataSourceMediator:(id)a3
{
  v4 = (TBDataSourceMediator *)a3;
  v8.receiver = self;
  v8.super_class = (Class)WiFi3BarsTileCacheObserver;
  v5 = [(WiFi3BarsTileCacheObserver *)&v8 init];
  dataSourceMediator = v5->_dataSourceMediator;
  v5->_dataSourceMediator = v4;

  [(WiFi3BarsTileCacheObserver *)v5 _scheduleXPCActivity];
  return v5;
}

- (void)_scheduleXPCActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14358], 0);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141F8]);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141A8], *MEMORY[0x1E4F141D8]);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __50__WiFi3BarsTileCacheObserver__scheduleXPCActivity__block_invoke;
  handler[3] = &unk_1E69BCAD8;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.3BarsCacheObserverActivity", v3, handler);
}

uint64_t __50__WiFi3BarsTileCacheObserver__scheduleXPCActivity__block_invoke(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  NSLog(&cfstr_SStateLd.isa, "-[WiFi3BarsTileCacheObserver _scheduleXPCActivity]_block_invoke", state);
  v4 = *(void **)(a1 + 32);

  return [v4 _submitCacheAvailabilityMetric];
}

- (void)_submitCacheAvailabilityMetric
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = +[WiFiLocationManager sharedWiFiLocationManager];
  v4 = [v3 latestLocation];

  if (v4)
  {
    if (+[WiFiLocationManager isLocationValid:v4 uptoSeconds:900.0 requiredAccuracy:2000.0])
    {
      v5 = [TBGloriaTile alloc];
      [v4 coordinate];
      double v7 = v6;
      [v4 coordinate];
      v9 = [(TBGloriaTile *)v5 initWithLat:+[TBGloriaTile defaultZoomLevel] lng:v7 zoom:v8];
      if ([(TBGloriaTile *)v9 key])
      {
        uint64_t v10 = [(TBGloriaTile *)v9 key];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          v11 = [NSNumber numberWithUnsignedLongLong:v10];
          *(_DWORD *)buf = 136315650;
          v28 = "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]";
          __int16 v29 = 2112;
          v30 = v11;
          __int16 v31 = 1024;
          int v32 = +[TBGloriaTile defaultZoomLevel];
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: Fetching tile key at key: %@ zoom: %hhu", buf, 0x1Cu);
        }
        v12 = [MEMORY[0x1E4F1C9C8] date];
        v23 = [v12 dateByAddingDays:-7];

        v13 = [NSNumber numberWithUnsignedLongLong:v10];
        v14 = +[TBTileItemDescriptor tileItemDescriptorWithKey:v13];

        v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v14, 0);
        v16 = [[TBTileFetchRequestDescriptor alloc] initWithTileItems:v15 maxCacheAge:v23];
        v17 = [[TBTileFetchRequest alloc] initWithDescriptor:v16 sourcePolicy:1 cacheable:0];
        v25[0] = @"trigger";
        v25[1] = @"tileKey";
        v26[0] = &unk_1F2B93D48;
        v18 = [NSNumber numberWithUnsignedLongLong:v10];
        v26[1] = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
        [(TBTileFetchRequest *)v17 setUserInfo:v19];

        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __60__WiFi3BarsTileCacheObserver__submitCacheAvailabilityMetric__block_invoke;
        v24[3] = &__block_descriptor_40_e39_v28__0___TBFetchResponse__8___v___16B24l;
        v24[4] = v10;
        [(TBTileFetchRequest *)v17 setResultsHandler:v24];
        v20 = [(WiFi3BarsTileCacheObserver *)self dataSourceMediator];
        [v20 executeFetchRequest:v17];
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]";
        __int16 v29 = 1024;
        LODWORD(v30) = +[TBGloriaTile defaultZoomLevel];
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: Invalid tileKey at zoom: %hhu", buf, 0x12u);
      }
    }
    else
    {
      v22 = +[TBCacheAnalyticsEvent cacheAvailabilityEventWithStatus:3];
      +[TBAnalytics captureEvent:v22];
    }
  }
  else
  {
    v21 = +[TBCacheAnalyticsEvent cacheAvailabilityEventWithStatus:2];
    +[TBAnalytics captureEvent:v21];

    NSLog(&cfstr_SNoLocationAva.isa, "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]");
  }
}

void __60__WiFi3BarsTileCacheObserver__submitCacheAvailabilityMetric__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v14 = a2;
  id v7 = a3;
  double v8 = v7;
  if (v7) {
    (*((void (**)(id))v7 + 2))(v7);
  }
  if (a4)
  {
    v9 = [v14 error];

    uint64_t v10 = *(void *)(a1 + 32);
    if (v9)
    {
      v11 = [v14 error];
      NSLog(&cfstr_SFetchForLluFa.isa, "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]_block_invoke", v10, v11);

      uint64_t v12 = 0;
    }
    else
    {
      NSLog(&cfstr_SFetchForLluCo.isa, "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]_block_invoke", v10);
      uint64_t v12 = 1;
    }
    v13 = +[TBCacheAnalyticsEvent cacheAvailabilityEventWithStatus:v12];
    +[TBAnalytics captureEvent:v13];
  }
}

- (TBDataSourceMediator)dataSourceMediator
{
  return self->_dataSourceMediator;
}

- (void)setDataSourceMediator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end