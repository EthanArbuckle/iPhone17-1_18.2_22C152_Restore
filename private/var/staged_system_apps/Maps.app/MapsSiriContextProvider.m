@interface MapsSiriContextProvider
+ (id)sharedContextProvider;
- (BOOL)allowContextProvider:(id)a3;
- (id)_contextFromProvider:(id)a3;
- (id)_siriMapItemFromConvertibleObject:(id)a3;
- (id)_siriMapViewportWithRegion:(id)a3;
- (id)_siriSearchContextWithResults:(id)a3 selectedIndex:(unint64_t)a4;
- (id)getCurrentContext;
@end

@implementation MapsSiriContextProvider

+ (id)sharedContextProvider
{
  if (qword_101610830 != -1) {
    dispatch_once(&qword_101610830, &stru_101318040);
  }
  v2 = (void *)qword_101610828;

  return v2;
}

- (BOOL)allowContextProvider:(id)a3
{
  return 1;
}

- (id)getCurrentContext
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136316418;
        v15 = "-[MapsSiriContextProvider getCurrentContext]";
        __int16 v16 = 2080;
        v17 = "MapsSiriContextProvider.m";
        __int16 v18 = 1024;
        int v19 = 55;
        __int16 v20 = 2080;
        v21 = "dispatch_get_main_queue()";
        __int16 v22 = 2080;
        v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v24 = 2080;
        v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v12 = sub_1005762E4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = +[NSThread callStackSymbols];
          int v14 = 138412290;
          v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
  }
  v6 = +[CarDisplayController sharedInstance];
  if ([v6 isChromeAvailable]
    && ([v6 isCurrentlyConnectedToCarAppScene] & 1) != 0)
  {
    v7 = off_1012D26D8;
  }
  else
  {
    v7 = &off_1012D33A8;
  }
  id v8 = objc_alloc_init(*v7);
  v9 = [(MapsSiriContextProvider *)self _contextFromProvider:v8];

  return v9;
}

- (id)_contextFromProvider:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSMutableArray array];
  v6 = [v4 mapView];
  v7 = [v6 mapRegion];
  id v8 = [(MapsSiriContextProvider *)self _siriMapViewportWithRegion:v7];

  if (v8) {
    [v5 addObject:v8];
  }
  v9 = [v4 searchResults];
  v10 = +[NSMutableArray arrayWithArray:v9];

  v11 = [v4 selectedResult];
  v12 = [v4 selectedPOI];
  if (v11) {
    uint64_t v13 = (uint64_t)[v10 indexOfObject:v11];
  }
  else {
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v12) {
    int v14 = v12;
  }
  else {
    int v14 = v11;
  }
  id v15 = v14;
  if (v15 && v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v10 addObject:v15];
    uint64_t v13 = (uint64_t)[v10 count] - 1;
  }
  __int16 v16 = [(MapsSiriContextProvider *)self _siriSearchContextWithResults:v10 selectedIndex:v13];
  if (v16) {
    [v5 addObject:v16];
  }
  id v17 = [v5 copy];

  return v17;
}

- (id)_siriMapViewportWithRegion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)SALocalSearchMapViewport);
  [v3 eastLng];
  [v4 setEastLongitude:];
  [v3 westLng];
  [v4 setWestLongitude:];
  [v3 northLat];
  [v4 setNorthLatitude:];
  [v3 southLat];
  double v6 = v5;

  [v4 setSouthLatitude:v6];

  return v4;
}

- (id)_siriSearchContextWithResults:(id)a3 selectedIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = objc_alloc_init((Class)SALocalSearchMapItemList);
    id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = -[MapsSiriContextProvider _siriMapItemFromConvertibleObject:](self, "_siriMapItemFromConvertibleObject:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
          [v8 addObject:v14];
        }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v15 = [v8 copy];
    [v7 setDomainObjects:v15];

    if (a4 != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)[v9 count] > a4)
    {
      __int16 v16 = +[NSNumber numberWithUnsignedInteger:a4];
      [v7 setSelectedIndex:v16];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_siriMapItemFromConvertibleObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)SALocalSearchMapItem);
  [v3 coordinate];
  double v6 = v5;
  double v8 = v7;
  id v9 = objc_alloc_init((Class)SALocation);
  id v10 = +[NSNumber numberWithDouble:v6];
  [v9 setLatitude:v10];

  id v11 = +[NSNumber numberWithDouble:v8];
  [v9 setLongitude:v11];

  [v4 setLocation:v9];
  uint64_t v12 = [v3 title];
  [v4 setLabel:v12];

  uint64_t v13 = [v3 mapItem];
  int v14 = [v13 _placeDataAsData];
  if (v14) {
    [v4 setPlaceData2:v14];
  }
  id v15 = [v13 _detourInfo];
  __int16 v16 = [v15 detourInfoAsData];

  if (v16) {
    [v4 setResultDetourInfoData:v16];
  }
  if ([v3 isDynamicCurrentLocation]) {
    [v4 setDetailType:SALocalSearchMapItemMapItemTypeCURRENT_LOCATIONValue];
  }
  if ([v3 businessID])
  {
    id v17 = objc_alloc_init((Class)SALocalSearchBusiness2);
    long long v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"urn:places:%lld", [v3 businessID]);
    long long v19 = +[NSURL URLWithString:v18];

    [v17 setIdentifier:v19];
    long long v20 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 localSearchProviderID]);
    [v4 setLocalSearchProviderId:v20];

    [v4 setDetailType:SALocalSearchMapItemMapItemTypeBUSINESS_ITEMValue];
    [v4 setDetail:v17];
  }

  return v4;
}

@end