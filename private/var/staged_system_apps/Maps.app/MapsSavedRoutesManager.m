@interface MapsSavedRoutesManager
+ (BOOL)didThisDeviceCreateRouteData:(id)a3;
+ (id)routeDataForMapsSyncUserRoute:(id)a3;
+ (unint64_t)savedRoutesCount;
+ (void)_deleteIDFromLocalListWithRoute:(id)a3;
+ (void)_fetchSavedRoutesWithStorageID:(id)a3 handler:(id)a4;
+ (void)_saveToLocalListWithRoute:(id)a3;
+ (void)_updateLocalListWithKnownRoutes:(id)a3;
+ (void)_updateUserRoute:(id)a3 withRouteData:(id)a4;
+ (void)deleteRoute:(id)a3 completion:(id)a4;
+ (void)deleteRouteStorageID:(id)a3 completion:(id)a4;
+ (void)fetchSavedRoutesWithTourMuid:(unint64_t)a3 completion:(id)a4;
+ (void)fetchSavedRoutesWithType:(int64_t)a3 completion:(id)a4;
+ (void)saveRouteData:(id)a3 completion:(id)a4;
@end

@implementation MapsSavedRoutesManager

+ (unint64_t)savedRoutesCount
{
  id v2 = [objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions) initWithPredicate:0 sortDescriptors:0 range:0];
  v3 = objc_opt_new();
  id v9 = 0;
  v4 = [v3 fetchSyncWithOptions:v2 error:&v9];
  id v5 = v9;
  id v6 = [v4 count];

  if (v5)
  {
    v7 = sub_1009FDCBC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to get route count, error: %{public}@", buf, 0xCu);
    }
  }
  return (unint64_t)v6;
}

+ (void)fetchSavedRoutesWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = sub_1009FDCBC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "+[MapsSavedRoutesManager fetchSavedRoutesWithType:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    v8 = +[NSSortDescriptor sortDescriptorWithKey:@"createTime" ascending:0];
    id v9 = objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions);
    v17 = v8;
    v10 = +[NSArray arrayWithObjects:&v17 count:1];
    id v11 = [v9 initWithPredicate:0 sortDescriptors:v10 range:0];

    v12 = objc_opt_new();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1009FDD10;
    v13[3] = &unk_101313F20;
    id v14 = v6;
    id v15 = a1;
    int64_t v16 = a3;
    [v12 fetchWithOptions:v11 completionHandler:v13];
  }
}

+ (void)fetchSavedRoutesWithTourMuid:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    if (a3)
    {
      id v6 = objc_opt_new();
      v7 = +[NSNumber numberWithUnsignedLongLong:a3];
      v19 = v7;
      v8 = +[NSArray arrayWithObjects:&v19 count:1];
      id v9 = +[MapsSyncQueryPredicate queryPredicateWithFormat:@"tourIdentifier == %@" argumentArray:v8];

      id v10 = [objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions) initWithPredicate:v9 sortDescriptors:0 range:0];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1009FE944;
      v16[3] = &unk_101313F88;
      unint64_t v18 = a3;
      id v17 = v5;
      [v6 fetchWithOptions:v10 completionHandler:v16];
    }
    else
    {
      id v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = +[NSString stringWithFormat:@"tourMuid of 0 is not valid."];
        *(_DWORD *)buf = 136316162;
        v21 = "+[MapsSavedRoutesManager fetchSavedRoutesWithTourMuid:completion:]";
        __int16 v22 = 2080;
        v23 = "MapsSavedRoutesManager.m";
        __int16 v24 = 1024;
        int v25 = 253;
        __int16 v26 = 2080;
        v27 = "tourMuid != 0";
        __int16 v28 = 2112;
        v29 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
      }
      if (sub_100BB36BC())
      {
        v13 = sub_1005762E4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v21 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      id v15 = sub_1009FDCBC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "tourMuid of 0 is not valid.", buf, 2u);
      }

      (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
    }
  }
}

+ (void)saveRouteData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: routeData != nil", buf, 2u);
    }
    __break(1u);
  }
  v8 = v7;
  id v9 = sub_1009FDCBC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 routeName];
    id v11 = [v6 anchorPoints];
    *(_DWORD *)buf = 138478083;
    __int16 v26 = v10;
    __int16 v27 = 1024;
    unsigned int v28 = [v11 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Saving route. Name: %{private}@, Anchors: %d", buf, 0x12u);
  }
  [v6 prepareForSaving];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1009FEE64;
  v21[3] = &unk_101313FD8;
  id v12 = v6;
  id v22 = v12;
  id v24 = a1;
  id v13 = v8;
  id v23 = v13;
  id v14 = objc_retainBlock(v21);
  id v15 = [v12 storageID];

  if (v15)
  {
    int64_t v16 = [v12 storageID];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1009FF144;
    v18[3] = &unk_1012E6EF8;
    id v19 = v12;
    v20 = v14;
    +[MapsSavedRoutesManager _fetchSavedRoutesWithStorageID:v16 handler:v18];

    id v17 = v19;
  }
  else
  {
    id v17 = objc_opt_new();
    ((void (*)(void *, void *))v14[2])(v14, v17);
  }
}

+ (void)deleteRoute:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 storageID];
  [a1 deleteRouteStorageID:v7 completion:v6];
}

+ (void)deleteRouteStorageID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void))v7;
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1009FF3FC;
    v10[3] = &unk_101314028;
    id v12 = v7;
    id v13 = a1;
    id v11 = v6;
    +[MapsSavedRoutesManager _fetchSavedRoutesWithStorageID:v11 handler:v10];
  }
  else if (v7)
  {
    id v9 = sub_1009FDCBC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Can't delete a routeData that is nil or has no storageID.", buf, 2u);
    }

    v8[2](v8, 0);
  }
}

+ (void)_fetchSavedRoutesWithStorageID:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v5)
    {
      id v7 = objc_opt_new();
      id v18 = v5;
      v8 = +[NSArray arrayWithObjects:&v18 count:1];
      +[MapsSyncQueryPredicate queryPredicateWithFormat:@"identifier == %@" argumentArray:v8];
      id v9 = (char *)objc_claimAutoreleasedReturnValue();

      id v10 = [objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions) initWithPredicate:v9 sortDescriptors:0 range:0];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1009FFC0C;
      v15[3] = &unk_1012E6EF8;
      id v16 = v5;
      id v17 = v6;
      [v7 fetchWithOptions:v10 completionHandler:v15];

      goto LABEL_4;
    }
    id v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "+[MapsSavedRoutesManager _fetchSavedRoutesWithStorageID:handler:]";
      __int16 v21 = 2080;
      id v22 = "MapsSavedRoutesManager.m";
      __int16 v23 = 1024;
      int v24 = 376;
      __int16 v25 = 2080;
      __int16 v26 = "storageID != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    id v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "+[MapsSavedRoutesManager _fetchSavedRoutesWithStorageID:handler:]";
      __int16 v21 = 2080;
      id v22 = "MapsSavedRoutesManager.m";
      __int16 v23 = 1024;
      int v24 = 371;
      __int16 v25 = 2080;
      __int16 v26 = "handler != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v7 = sub_1005762E4();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      id v9 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_4:

LABEL_5:
    }
  }
}

+ (void)_updateUserRoute:(id)a3 withRouteData:(id)a4
{
  id v31 = a3;
  id v5 = a4;
  id v6 = [v5 userProvidedName];
  [v31 setCustomName:v6];

  id v7 = [v5 userProvidedNotes];
  [v31 setCustomNote:v7];

  [v31 setTourIdentifier:[v5 tourMuid]];
  v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 transportType]);
  [v31 setTransportType:v8];

  [v5 distance];
  id v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v31 setLength:v9];

  id v10 = [v5 address];
  id v11 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];
  [v31 setAddressObject:v11];

  id v12 = [v5 anchorPoints];
  id v13 = [v12 count];

  if (v13)
  {
    id v14 = [v5 anchorPoints];
    id v15 = [v14 firstObject];

    [v15 coordinate];
    id v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v31 setOriginLatitude:v16];

    [v15 coordinate];
    id v18 = +[NSNumber numberWithDouble:v17];
    [v31 setOriginLongitude:v18];
  }
  id v19 = [v5 elevationProfile];

  if (v19)
  {
    v20 = [v5 elevationProfile];
    __int16 v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (float)[v20 sumElevationGainCm] * 0.01);
    [v31 setTotalAscent:v21];

    id v22 = [v5 elevationProfile];
    __int16 v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (float)[v22 sumElevationLossCm] * 0.01);
    [v31 setTotalDescent:v23];
  }
  int v24 = [v5 boundingMapRegion];
  __int16 v25 = v24;
  if (v24)
  {
    [v24 northLat];
    __int16 v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v31 setNorthLatitude:v26];

    [v25 southLat];
    __int16 v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v31 setSouthLatitude:v27];

    [v25 eastLng];
    unsigned int v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v31 setEastLongitude:v28];

    [v25 westLng];
    v29 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v31 setWestLongitude:v29];
  }
  v30 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  [v31 setRouteGeometry:v30];
}

+ (id)routeDataForMapsSyncUserRoute:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    id v5 = [v3 routeGeometry];
    id v21 = 0;
    id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v4 fromData:v5 error:&v21];
    id v7 = v21;

    if (v7 || !v6)
    {
      id v19 = sub_1009FDCBC();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v7;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error converting MSUserRoute to GEOComposedGeometryRoutePersistentData: %@", buf, 0xCu);
      }

      id v18 = 0;
    }
    else
    {
      id v8 = [v6 version];
      if (v8 != [v6 originalVersion])
      {
        id v9 = sub_1009FDCBC();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = [v6 originalVersion];
          id v11 = [v6 version];
          *(_DWORD *)buf = 134218240;
          id v23 = v10;
          __int16 v24 = 2048;
          id v25 = v11;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Updated route data from version %llu to %llu.", buf, 0x16u);
        }
      }
      id v12 = [v3 identifier];
      [v6 setStorageID:v12];

      id v13 = [v6 storageID];

      if (!v13)
      {
        id v14 = sub_1009FDCBC();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v3;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "didn't get an identifier from %@", buf, 0xCu);
        }

        id v15 = objc_opt_new();
        [v6 setStorageID:v15];
      }
      if (![v6 source])
      {
        id v16 = [v6 tourIdentifier];

        if (v16) {
          uint64_t v17 = 2;
        }
        else {
          uint64_t v17 = 3;
        }
        [v6 setSource:v17];
      }
      id v18 = v6;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

+ (BOOL)didThisDeviceCreateRouteData:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v4 = GEOConfigGetArray();
  id v5 = (void *)v4;
  id v6 = &__NSArray0__struct;
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v3 storageID];
        id v14 = [v13 UUIDString];
        LOBYTE(v12) = [v14 isEqualToString:v12];

        if (v12)
        {
          LOBYTE(v9) = 1;
          goto LABEL_13;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v9;
}

+ (void)_updateLocalListWithKnownRoutes:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v4 = GEOConfigGetArray();
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = &__NSArray0__struct;
  }
  id v7 = +[NSMutableSet setWithArray:v6];

  id v8 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v3;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
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
        id v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) storageID:(void)v18];
        id v15 = [v14 UUIDString];

        if (v15 && [v7 containsObject:v15])
        {
          [v7 removeObject:v15];
          [v8 addObject:v15];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v11);
  }

  if ([v7 count])
  {
    long long v16 = sub_1009FDCBC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "These routes were deleted: %{public}@", buf, 0xCu);
    }
  }
  long long v17 = [v8 allObjects];
  GEOConfigSetArray();
}

+ (void)_saveToLocalListWithRoute:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v4 = GEOConfigGetArray();
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = &__NSArray0__struct;
  }
  id v7 = +[NSMutableSet setWithArray:v6];

  id v8 = [v3 storageID];

  id v9 = [v8 UUIDString];

  if (v9)
  {
    [v7 addObject:v9];
  }
  else
  {
    id v10 = sub_1009FDCBC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Route data didn't have a storageID at creation", v11, 2u);
    }
  }
}

+ (void)_deleteIDFromLocalListWithRoute:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v4 = GEOConfigGetArray();
  id v5 = v4;
  if (!v4) {
    uint64_t v4 = &__NSArray0__struct;
  }
  id v6 = [v4 mutableCopy];

  id v7 = [v3 UUIDString];

  if (v7)
  {
    [v6 removeObject:v7];
  }
  else
  {
    id v8 = sub_1009FDCBC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Route data didn't have a storageID at deletion", v9, 2u);
    }
  }
  GEOConfigSetArray();
}

@end