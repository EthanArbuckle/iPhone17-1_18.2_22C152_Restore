@interface HistoryEntryRecentsItem
+ (id)historyItemForIdentifier:(id)a3;
+ (id)saveCustomRoute:(id)a3 asWaypoint:(id)a4 withOriginalHistoryIdentifier:(id)a5;
+ (id)saveRoute:(id)a3 withOriginalHistoryIdentifier:(id)a4;
+ (id)saveRoute:(id)a3 withOriginalHistoryIdentifier:(id)a4 editBlock:(id)a5;
+ (id)saveRoute:(id)a3 withOriginalHistoryIdentifier:(id)a4 editBlock:(id)a5 completionBlock:(id)a6;
+ (void)fetchHistoryItemMatchingIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)fetchHistoryItemsMatchingMapItem:(id)a3 completion:(id)a4;
+ (void)fetchHistoryItemsMatchingWaypoints:(id)a3 completion:(id)a4;
+ (void)markRouteAsComplete:(id)a3;
+ (void)removeEntries:(id)a3;
+ (void)removeEntries:(id)a3 completion:(id)a4;
+ (void)saveCuratedCollection:(id)a3 completion:(id)a4;
+ (void)saveGeoMapItem:(id)a3;
+ (void)saveLineItem:(id)a3 completion:(id)a4;
+ (void)saveMapItem:(id)a3 superseedUUID:(id)a4;
+ (void)saveMapItem:(id)a3 superseedUUID:(id)a4 tracksRAPReportingOnly:(BOOL)a5;
+ (void)saveSearch:(id)a3 completion:(id)a4;
+ (void)saveWaypoints:(id)a3 transportType:(int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNavigationInterrupted;
- (HistoryEntryRecentsItem)initWithHistoryEntry:(id)a3;
- (HistoryEntryRecentsItem)linkedRecentRoute;
- (MSPHistoryEntry)historyEntry;
- (NSString)_maps_diffableDataSourceIdentifier;
- (NSString)description;
- (double)timestamp;
- (id)entryForHistoryPlace:(id)a3;
- (id)entryForHistoryRoute:(id)a3;
- (id)entryForHistorySearch:(id)a3;
- (id)entryWithTicket:(id)a3;
- (unint64_t)hash;
- (void)setLinkedRecentRoute:(id)a3;
- (void)setNavigationInterrupted:(BOOL)a3 completion:(id)a4;
- (void)setSharedETAData:(id)a3 completion:(id)a4;
- (void)updateModel:(id)a3;
- (void)updateResumeRouteHandle:(id)a3 completion:(id)a4;
@end

@implementation HistoryEntryRecentsItem

- (void)updateModel:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100103DBC;
  v22 = sub_100104768;
  v23 = &stru_101324E70;
  v5 = [(HistoryEntryRecentsItem *)self historyEntry];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1005E1FD0;
  v15[3] = &unk_1012F18C0;
  id v16 = v4;
  v17 = &v18;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1005E20A0;
  v12[3] = &unk_1012F18E8;
  id v13 = v16;
  v14 = &v18;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1005E2210;
  v9[3] = &unk_1012F1910;
  id v6 = v13;
  id v10 = v6;
  v11 = &v18;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005E22A0;
  v8[3] = &unk_1012F1938;
  v8[4] = &v18;
  [v5 ifSearch:v15 ifRoute:v12 ifPlaceDisplay:v9 ifTransitLineItem:v8];

  v7 = +[NSString stringWithFormat:@"[History %@]", v19[5]];
  [v6 setDebugSubtitle:v7];

  _Block_object_dispose(&v18, 8);
}

- (id)entryWithTicket:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_100103F58;
  v15 = sub_100104838;
  id v16 = 0;
  v5 = [(HistoryEntryRecentsItem *)self historyEntry];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1007B1E38;
  v10[3] = &unk_1012EA888;
  v10[4] = self;
  v10[5] = &v11;
  void v8[5] = &v11;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1007B1E88;
  v9[3] = &unk_1012F8A40;
  void v9[4] = self;
  v9[5] = &v11;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007B1ED8;
  v8[3] = &unk_1012F8A68;
  v8[4] = self;
  [v5 ifSearch:v10 ifRoute:v9 ifPlaceDisplay:v8 ifTransitLineItem:0];

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)entryForHistorySearch:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GEORPSuggestionEntry) initWithType:6];
  v5 = [v3 query];
  [v4 safeAddDisplayLine:v5];

  id v6 = [v3 locationDisplayString];

  [v4 safeAddDisplayLine:v6];

  return v4;
}

- (id)entryForHistoryRoute:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GEORPSuggestionEntry) initWithType:4];
  id v19 = 0;
  id v20 = 0;
  +[SearchResult newStartWaypointSearchResult:&v20 endWaypointSearchResult:&v19 forRouteHistoryEntry:v3];

  id v5 = v20;
  id v6 = v19;
  v7 = [v6 name];
  v8 = [v5 mapItem];
  v9 = [v8 name];

  if ([v5 isDynamicCurrentLocation])
  {
    id v10 = [v5 place];
    uint64_t v11 = [v10 address];
    v12 = [v11 structuredAddress];

    uint64_t v13 = [v12 fullThoroughfare];

    if (![v13 length])
    {
      uint64_t v14 = [v12 thoroughfare];

      uint64_t v13 = (void *)v14;
    }
    if (![v13 length])
    {
      v15 = [v5 mapItem];
      uint64_t v16 = [v15 _addressFormattedAsCity];

      uint64_t v13 = (void *)v16;
    }

    v9 = v13;
  }
  if (![v9 length])
  {
    uint64_t v17 = [v5 title];

    v9 = (void *)v17;
  }
  [v4 safeAddDisplayLine:v7];
  [v4 safeAddDisplayLine:v9];

  return v4;
}

- (id)entryForHistoryPlace:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GEORPSuggestionEntry) initWithType:5];
  id v5 = [v3 geoMapItem];

  id v6 = +[MKMapItem _itemWithGeoMapItem:v5];

  v7 = [[SearchResult alloc] initWithMapItem:v6];
  v8 = [(SearchResult *)v7 title];
  v9 = [v6 _maps_placeTitleWithDefaultTitle:v8];

  if ([v6 _hasMUID])
  {
    uint64_t v10 = [(SearchResult *)v7 singleLineAddress];
  }
  else
  {
    if (objc_msgSend(v6, "_maps_isLargeAreaPlace")) {
      [v6 _maps_placeAreaNameWithDefaultName:v9];
    }
    else {
    uint64_t v10 = [v6 _addressFormattedAsCity];
    }
  }
  uint64_t v11 = (void *)v10;
  [v4 safeAddDisplayLine:v9];
  [v4 safeAddDisplayLine:v11];

  return v4;
}

+ (void)fetchHistoryItemsMatchingMapItem:(id)a3 completion:(id)a4
{
}

+ (void)fetchHistoryItemsMatchingWaypoints:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = objc_alloc_init((Class)MSHistoryItemRequest);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1008ACE58;
  v12[3] = &unk_1012F09D8;
  id v13 = v5;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = v5;
  [v8 fetchWithCompletionHandler:v12];
}

+ (void)fetchHistoryItemMatchingIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)_TtC8MapsSync13MapsSyncRange) initWithOffset:0 limit:1];
  id v15 = v6;
  id v8 = +[NSArray arrayWithObjects:&v15 count:1];
  id v9 = +[MapsSyncQueryPredicate queryPredicateWithFormat:@"identifier == %@" argumentArray:v8];

  id v10 = [objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions) initWithPredicate:v9 sortDescriptors:0 range:v7];
  id v11 = objc_alloc_init((Class)MSHistoryItemRequest);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1008AD748;
  v13[3] = &unk_1012E7710;
  id v14 = v5;
  id v12 = v5;
  [v11 fetchWithOptions:v10 completionHandler:v13];
}

+ (id)historyItemForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1001040A4;
  uint64_t v16 = sub_1001048D0;
  id v17 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008AD90C;
  v9[3] = &unk_1012FF2E8;
  id v11 = &v12;
  id v5 = dispatch_semaphore_create(0);
  id v10 = v5;
  [a1 fetchHistoryItemMatchingIdentifier:v4 completionHandler:v9];
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  id v7 = 0;
  if (!dispatch_semaphore_wait(v5, v6)) {
    id v7 = (id)v13[5];
  }

  _Block_object_dispose(&v12, 8);

  return v7;
}

+ (id)saveRoute:(id)a3 withOriginalHistoryIdentifier:(id)a4
{
  return [a1 saveRoute:a3 withOriginalHistoryIdentifier:a4 editBlock:0];
}

+ (id)saveRoute:(id)a3 withOriginalHistoryIdentifier:(id)a4 editBlock:(id)a5
{
  return [a1 saveRoute:a3 withOriginalHistoryIdentifier:a4 editBlock:a5 completionBlock:0];
}

+ (id)saveRoute:(id)a3 withOriginalHistoryIdentifier:(id)a4 editBlock:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    uint64_t v14 = [v10 origin];
    if (v14)
    {
      id v15 = [v10 destination];

      if (v15)
      {
        uint64_t v16 = [v10 userRequestedWaypoints];
        BOOL v49 = (unint64_t)[v16 count] > 2;
        id v17 = +[VGVirtualGarageService sharedService];
        v52 = [v17 activeVehicleIdentifier];

        uint64_t v18 = [v10 chargingStationInfos];
        v51 = [v18 firstObject];

        unsigned __int8 v19 = [v10 isEVRoute];
        if (v51) {
          unsigned __int8 v20 = v19;
        }
        else {
          unsigned __int8 v20 = 0;
        }
        if (!v52) {
          unsigned __int8 v20 = 0;
        }
        unsigned __int8 v50 = v20;
        v21 = sub_10000AF10();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = [v10 description];
          v23 = [v11 UUIDString];
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v22;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v23;
          *(_WORD *)&buf[22] = 2048;
          v71 = (uint64_t (*)(uint64_t, uint64_t))[v16 count];
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Will try to save a route: %@,\noriginalHistoryIdentifier: %@, \nuserRequestedWaypoints: %lu", buf, 0x20u);
        }
        v24 = (objc_class *)objc_opt_class();
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v71 = sub_1001040A4;
        v72 = sub_1001048D0;
        id v73 = 0;
        if (!v11) {
          goto LABEL_26;
        }
        v25 = sub_10000AF10();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v66 = 138412290;
          id v67 = v11;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Finding historyItem for identifier: %@", v66, 0xCu);
        }

        id v26 = [(id)objc_opt_class() historyItemForIdentifier:v11];
        if (!v26) {
          goto LABEL_26;
        }
        v27 = sub_10000AF10();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v66 = 138412290;
          id v67 = v11;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Found historyItem matching identifier: %@", v66, 0xCu);
        }

        if ([(id)objc_opt_class() isEqual:v24]) {
          goto LABEL_38;
        }
        v28 = sub_10000AF10();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
LABEL_25:

          v35 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v26;

LABEL_26:
          id v26 = objc_alloc_init(v24);
          if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
          {
            v36 = [*(id *)(*(void *)&buf[8] + 40) sharedETAData];
            if (v36 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              v37 = sub_10000AF10();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v66 = 0;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Migrating sharedETAData from original item to new item", v66, 2u);
              }

              [v26 setSharedETAData:v36];
            }
          }
          else
          {
            v36 = 0;
          }

LABEL_38:
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_1008AE0F0;
          v54[3] = &unk_1012FF358;
          id v42 = v26;
          id v55 = v42;
          id v56 = v10;
          v62 = buf;
          v38 = v16;
          v57 = v38;
          char v63 = v50 & !v49;
          id v43 = v51;
          id v58 = v43;
          id v53 = v52;
          id v59 = v53;
          BOOL v64 = v49;
          unsigned __int8 v65 = v50;
          id v60 = v12;
          id v61 = v13;
          [a1 fetchHistoryItemsMatchingWaypoints:v38 completion:v54];
          v41 = [[HistoryEntryRecentsItem alloc] initWithHistoryEntry:v42];

          _Block_object_dispose(buf, 8);
          goto LABEL_39;
        }
        id v48 = v26;
        v29 = (objc_class *)objc_opt_class();
        v47 = NSStringFromClass(v29);
        if (objc_opt_respondsToSelector())
        {
          v30 = [v48 performSelector:"accessibilityIdentifier"];
          v31 = v30;
          if (v30)
          {
            v32 = v30;
            unsigned __int8 v33 = [v30 isEqualToString:v47];
            v31 = v32;
            if ((v33 & 1) == 0)
            {
              uint64_t v45 = +[NSString stringWithFormat:@"%@<%p, %@>", v47, v48, v32];
              v46 = v32;
              v34 = (void *)v45;

              goto LABEL_24;
            }
          }
        }
        v34 = +[NSString stringWithFormat:@"%@<%p>", v47, v48];
LABEL_24:

        *(_DWORD *)v66 = 138412546;
        id v67 = v34;
        __int16 v68 = 2112;
        v69 = v24;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Existing directionItem %@ is not of correct type for saving %@, will create a new one", v66, 0x16u);

        goto LABEL_25;
      }
    }
  }
  v38 = sub_10000AF10();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
  {
    v39 = [v10 origin];
    v40 = [v10 destination];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v39;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v40;
    *(_WORD *)&buf[22] = 2112;
    v71 = (uint64_t (*)(uint64_t, uint64_t))v10;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_FAULT, "Will not save route as required properties are missing (origin: %@, destination: %@, route: %@)", buf, 0x20u);
  }
  v41 = 0;
LABEL_39:

  return v41;
}

+ (id)saveCustomRoute:(id)a3 asWaypoint:(id)a4 withOriginalHistoryIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (__CFString *)a5;
  id v11 = sub_10000AF10();
  id v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v9 shortDescription];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Will try to save a waypoint-to-route: %@, originalHistoryIdentifier: %@", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v43 = sub_1001040A4;
    v44 = sub_1001048D0;
    id v45 = 0;
    if (v10)
    {
      uint64_t v14 = sub_10000AF10();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v40 = 138412290;
        v41 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Finding historyItem for identifier: %@", v40, 0xCu);
      }

      id v15 = [a1 historyItemForIdentifier:v10];
      if (v15)
      {
        uint64_t v16 = sub_10000AF10();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v40 = 138412290;
          v41 = v10;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Found historyItem matching identifier: %@", v40, 0xCu);
        }
      }
    }
    else
    {
      id v15 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v15)
      {
LABEL_30:
        id v25 = objc_alloc((Class)GEOComposedWaypoint);
        id v26 = +[MKMapItem mapItemForCurrentLocation];
        v27 = [v26 _geoMapItem];
        id v28 = [v25 initWithMapItem:v27];

        v39[0] = v28;
        v39[1] = v9;
        v29 = +[NSArray arrayWithObjects:v39 count:2];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1008AF344;
        v33[3] = &unk_1012FF3C0;
        id v12 = v15;
        v34 = v12;
        v38 = buf;
        id v30 = v28;
        id v35 = v30;
        id v36 = v9;
        id v37 = v8;
        [a1 fetchHistoryItemsMatchingWaypoints:v29 completion:v33];

        id v17 = [[HistoryEntryRecentsItem alloc] initWithHistoryEntry:v12];
        _Block_object_dispose(buf, 8);

        goto LABEL_31;
      }
LABEL_29:
      id v15 = objc_opt_new();
      goto LABEL_30;
    }
    uint64_t v18 = sub_10000AF10();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
LABEL_28:

      v24 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v15;

      goto LABEL_29;
    }
    id v19 = v15;
    if (!v19)
    {
      v23 = @"<nil>";
      goto LABEL_27;
    }
    unsigned __int8 v20 = (objc_class *)objc_opt_class();
    v32 = NSStringFromClass(v20);
    if (objc_opt_respondsToSelector())
    {
      v21 = [v19 performSelector:"accessibilityIdentifier"];
      v22 = v21;
      if (v21 && ([v21 isEqualToString:v32] & 1) == 0)
      {
        v23 = +[NSString stringWithFormat:@"%@<%p, %@>", v32, v19, v22];

        goto LABEL_25;
      }
    }
    v23 = +[NSString stringWithFormat:@"%@<%p>", v32, v19];
LABEL_25:

LABEL_27:
    *(_DWORD *)v40 = 138412290;
    v41 = v23;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Existing directionItem %@ is not of correct type MSHistoryDirectionsItem, will create a new one", v40, 0xCu);

    goto LABEL_28;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Will not save route as required property is missing (waypoint: %@)", buf, 0xCu);
  }
  id v17 = 0;
LABEL_31:

  return v17;
}

+ (void)markRouteAsComplete:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userRequestedWaypoints];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008AFC4C;
  v7[3] = &unk_1012F0F88;
  id v8 = v4;
  id v6 = v4;
  [a1 fetchHistoryItemsMatchingWaypoints:v5 completion:v7];
}

+ (void)saveWaypoints:(id)a3 transportType:(int)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008B0048;
  v7[3] = &unk_1012FF408;
  id v8 = a3;
  int v9 = a4;
  id v6 = v8;
  [a1 fetchHistoryItemsMatchingWaypoints:v6 completion:v7];
}

+ (void)saveGeoMapItem:(id)a3
{
}

+ (void)saveMapItem:(id)a3 superseedUUID:(id)a4
{
}

+ (void)saveMapItem:(id)a3 superseedUUID:(id)a4 tracksRAPReportingOnly:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [v7 _geoMapItem];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1008B02F0;
  v12[3] = &unk_1012ED600;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [a1 fetchHistoryItemsMatchingMapItem:v9 completion:v12];
}

+ (void)saveLineItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)MSHistoryItemRequest);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008B0500;
  v10[3] = &unk_1012E6EF8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 fetchWithCompletionHandler:v10];
}

+ (void)saveSearch:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)MSHistoryItemRequest);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008B091C;
  v10[3] = &unk_1012E6EF8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 fetchWithCompletionHandler:v10];
}

+ (void)saveCuratedCollection:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)MSHistoryItemRequest);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008B0EC4;
  v10[3] = &unk_1012E6EF8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 fetchWithCompletionHandler:v10];
}

+ (void)removeEntries:(id)a3
{
}

+ (void)removeEntries:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v12) historyEntry];
        [v7 addObject:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v14 = +[MapsSyncStore sharedStore];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1008B14AC;
  v16[3] = &unk_1012E76C0;
  id v17 = v6;
  id v15 = v6;
  [v14 deleteWithObjects:v7 completionHandler:v16];
}

- (void)updateResumeRouteHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HistoryEntryRecentsItem *)self historyEntry];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [(HistoryEntryRecentsItem *)self historyEntry];
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      uint64_t v11 = [v10 routeRequestStorage];
      [v11 setResumeRouteHandleStorage:v6];
      [v10 setRouteRequestStorage:v11];
    }
    id v12 = +[MapsSyncStore sharedStore];
    uint64_t v16 = v10;
    id v13 = +[NSArray arrayWithObjects:&v16 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1008B172C;
    v14[3] = &unk_1012E76C0;
    id v15 = v7;
    [v12 saveWithObjects:v13 completionHandler:v14];
  }
}

- (void)setNavigationInterrupted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(HistoryEntryRecentsItem *)self historyEntry];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v9 = [(HistoryEntryRecentsItem *)self historyEntry];
  id v10 = v9;
  if (isKindOfClass)
  {
    [v9 setNavigationInterrupted:v4];
    uint64_t v11 = +[MapsSyncStore sharedStore];
    long long v21 = v10;
    id v12 = +[NSArray arrayWithObjects:&v21 count:1];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1008B1978;
    v18[3] = &unk_1012E76C0;
    id v13 = &v19;
    id v19 = v6;
    id v14 = v18;
LABEL_5:
    [v11 saveWithObjects:v12 completionHandler:v14];

    goto LABEL_6;
  }
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if (v15)
  {
    id v10 = [(HistoryEntryRecentsItem *)self historyEntry];
    [v10 setNavigationInterrupted:v4];
    uint64_t v11 = +[MapsSyncStore sharedStore];
    long long v20 = v10;
    id v12 = +[NSArray arrayWithObjects:&v20 count:1];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1008B1990;
    v16[3] = &unk_1012E76C0;
    id v13 = &v17;
    id v17 = v6;
    id v14 = v16;
    goto LABEL_5;
  }
LABEL_6:
}

- (void)setSharedETAData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HistoryEntryRecentsItem *)self historyEntry];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v10 = [(HistoryEntryRecentsItem *)self historyEntry];
  uint64_t v11 = v10;
  if (isKindOfClass)
  {
    id v12 = [v10 sharedETAData];
    unint64_t v13 = (unint64_t)v6;
    unint64_t v14 = v12;
    if (v13 | v14)
    {
      char v15 = (void *)v14;
      unsigned int v16 = [(id)v13 isEqual:v14];

      if (!v16)
      {
        [v11 setSharedETAData:v13];
        id v17 = +[MapsSyncStore sharedStore];
        unsigned __int8 v33 = v11;
        long long v18 = +[NSArray arrayWithObjects:&v33 count:1];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1008B1CA4;
        v30[3] = &unk_1012E76C0;
        id v31 = v7;
        [v17 saveWithObjects:v18 completionHandler:v30];

        id v19 = v31;
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
    }
    goto LABEL_8;
  }
  objc_opt_class();
  char v20 = objc_opt_isKindOfClass();

  if (v20)
  {
    uint64_t v11 = [(HistoryEntryRecentsItem *)self historyEntry];
    long long v21 = [v11 sharedETAData];
    unint64_t v22 = (unint64_t)v6;
    unint64_t v23 = v21;
    if (v22 | v23)
    {
      v24 = (void *)v23;
      unsigned int v25 = [(id)v22 isEqual:v23];

      if (!v25)
      {
        [v11 setSharedETAData:v22];
        id v26 = +[MapsSyncStore sharedStore];
        v32 = v11;
        v27 = +[NSArray arrayWithObjects:&v32 count:1];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1008B1CBC;
        v28[3] = &unk_1012E76C0;
        id v29 = v7;
        [v26 saveWithObjects:v27 completionHandler:v28];

        id v19 = v29;
        goto LABEL_11;
      }
    }
LABEL_8:
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (HistoryEntryRecentsItem)initWithHistoryEntry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HistoryEntryRecentsItem;
  id v6 = [(HistoryEntryRecentsItem *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_historyEntry, a3);
  }

  return v7;
}

- (double)timestamp
{
  v2 = [(HistoryEntryRecentsItem *)self historyEntry];
  id v3 = [v2 usageDate];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  return v5;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"HistoryEntryRecentsItem <%p %@", self, self->_historyEntry];
}

- (unint64_t)hash
{
  v2 = [(HistoryEntryRecentsItem *)self historyEntry];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (HistoryEntryRecentsItem *)a3;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      id v6 = [(HistoryEntryRecentsItem *)self historyEntry];
      id v7 = [(HistoryEntryRecentsItem *)v5 historyEntry];

      unsigned __int8 v8 = [v6 isEqual:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (MSPHistoryEntry)historyEntry
{
  return self->_historyEntry;
}

- (HistoryEntryRecentsItem)linkedRecentRoute
{
  return self->_linkedRecentRoute;
}

- (void)setLinkedRecentRoute:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedRecentRoute, 0);

  objc_storeStrong((id *)&self->_historyEntry, 0);
}

- (BOOL)isNavigationInterrupted
{
  id v3 = [(HistoryEntryRecentsItem *)self historyEntry];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v5 = [(HistoryEntryRecentsItem *)self historyEntry];
  if (isKindOfClass) {
    goto LABEL_4;
  }
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();

  if (v6)
  {
    double v5 = [(HistoryEntryRecentsItem *)self historyEntry];
LABEL_4:
    unsigned __int8 v7 = [v5 navigationInterrupted];

    return v7;
  }
  return 0;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  v2 = [(HistoryEntryRecentsItem *)self historyEntry];
  id v3 = [v2 storageIdentifier];
  double v4 = [v3 UUIDString];

  return (NSString *)v4;
}

@end