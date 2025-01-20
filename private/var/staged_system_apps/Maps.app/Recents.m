@interface Recents
+ (id)sharedRecents;
+ (void)beginPrecachingRecentsIfNeeded;
- (NSArray)historyQueryContents;
- (NSArray)historyRecents;
- (NSArray)orderedRecents;
- (NSArray)recents;
- (NSArray)resolvedHistoryRecents;
- (NSArray)resolvedOrderedRecents;
- (NSArray)storeSubscriptionTypes;
- (NSArray)systemRecents;
- (Recents)init;
- (id)_recentByUnmappingCuratedCollectionsForRecents:(id)a3;
- (id)_recentPlaceDisplayWithSupersededStorageIdentifier:(id)a3;
- (id)_recentWithIdentifier:(id)a3;
- (id)_recentsByMappingCuratedCollectionsForRecents:(id)a3;
- (id)_recentsFromHistoryQuery;
- (id)cachedMapItemForContactID:(int64_t)a3;
- (void)_combineRecents;
- (void)_processRecents;
- (void)addObserver:(id)a3;
- (void)deleteAllRecentsWithCompletion:(id)a3;
- (void)deleteCoreRecentContact:(id)a3;
- (void)deleteRecents:(id)a3 completion:(id)a4;
- (void)loadCoreRecentsOnQueue:(id)a3 withCompletion:(id)a4;
- (void)recordCoreRecentContact:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setHistoryQueryContents:(id)a3;
- (void)setHistoryRecents:(id)a3;
- (void)setNeedsCoreRecentsReload;
- (void)setResolvedHistoryRecents:(id)a3;
- (void)setResolvedOrderedRecents:(id)a3;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)setSystemRecents:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
@end

@implementation Recents

- (void)setNeedsCoreRecentsReload
{
  if (!self->_needsReload)
  {
    self->_needsReload = 1;
    objc_initWeak(&location, self);
    Current = CFRunLoopGetCurrent();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000FEE0;
    block[3] = &unk_1012E7ED0;
    block[4] = self;
    objc_copyWeak(&v5, &location);
    CFRunLoopPerformBlock(Current, kCFRunLoopCommonModes, block);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)storeDidChangeWithTypes:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init((Class)MSHistoryItemRequest);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001EDB0;
  v6[3] = &unk_1012E7418;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v5 fetchWithCompletionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (Recents)init
{
  v19.receiver = self;
  v19.super_class = (Class)Recents;
  v2 = [(Recents *)&v19 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_applicationActivating" name:UIApplicationWillEnterForegroundNotification object:0];

    historyQueryContents = v2->_historyQueryContents;
    v2->_historyQueryContents = (NSArray *)&__NSArray0__struct;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.Maps.Recents.DataLoading", v5);
    dataLoadingQueue = v2->_dataLoadingQueue;
    v2->_dataLoadingQueue = (OS_dispatch_queue *)v6;

    v8 = +[MapsSyncStore sharedStore];
    [v8 subscribe:v2];

    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    v20[3] = objc_opt_class();
    v20[4] = objc_opt_class();
    v20[5] = objc_opt_class();
    v20[6] = objc_opt_class();
    uint64_t v9 = +[NSArray arrayWithObjects:v20 count:7];
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v9;

    uint64_t v11 = geo_isolater_create();
    coreRecentsMapItemCacheIsolator = v2->_coreRecentsMapItemCacheIsolator;
    v2->_coreRecentsMapItemCacheIsolator = (geo_isolater *)v11;

    uint64_t v13 = +[NSMutableDictionary dictionary];
    coreRecentsMapItemCache = v2->_coreRecentsMapItemCache;
    v2->_coreRecentsMapItemCache = (NSMutableDictionary *)v13;

    [(Recents *)v2 setNeedsCoreRecentsReload];
    v15 = objc_alloc_init(RecentCuratedCollectionResolver);
    curatedCollectionResolver = v2->_curatedCollectionResolver;
    v2->_curatedCollectionResolver = v15;

    v17 = [(RecentCuratedCollectionResolver *)v2->_curatedCollectionResolver observers];
    [v17 registerObserver:v2];

    [(Recents *)v2 storeDidChangeWithTypes:&__NSArray0__struct];
  }
  return v2;
}

- (void)loadCoreRecentsOnQueue:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  dispatch_group_t v7 = dispatch_group_create();
  objc_super v19 = +[CRRecentContactsLibrary defaultInstance];
  char BOOL = GEOConfigGetBOOL();
  uint64_t v9 = +[CRRecentContactsLibrary messageSourcesBundleIdentifiers];
  id v10 = objc_alloc_init((Class)CRSearchQuery);
  uint64_t v27 = CRAddressKindMapLocation;
  uint64_t v11 = +[NSArray arrayWithObjects:&v27 count:1];
  v12 = +[CRSearchPredicate predicateForKey:@"kind" inCollection:v11];

  [v10 setSearchPredicate:v12];
  uint64_t v26 = CRRecentsDomainMaps;
  uint64_t v13 = +[NSArray arrayWithObjects:&v26 count:1];
  [v10 setDomains:v13];

  v14 = +[CRSearchQuery frecencyComparator];
  [v10 setComparator:v14];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100041E04;
  v20[3] = &unk_1012ECFE8;
  id v21 = v9;
  v22 = self;
  char v25 = BOOL;
  dispatch_group_t v23 = v7;
  id v24 = v5;
  id v15 = v5;
  v16 = v7;
  id v17 = v9;
  [v19 performRecentsSearch:v10 queue:v6 completion:v20];
}

- (void)_combineRecents
{
  v3 = [(Recents *)self _recentsFromHistoryQuery];
  id v4 = [(Recents *)self systemRecents];
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v3, "count") + (void)objc_msgSend(v4, "count"));
  [v5 addObjectsFromArray:v3];
  [v5 addObjectsFromArray:v4];
  [v5 sortWithOptions:16 usingComparator:&stru_1012ED028];
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100098A7C;
  v8[3] = &unk_1012E9340;
  objc_copyWeak(&v11, &location);
  id v9 = v3;
  id v10 = v5;
  id v6 = v5;
  id v7 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (NSArray)systemRecents
{
  return self->_systemRecents;
}

- (id)_recentsFromHistoryQuery
{
  v2 = [(Recents *)self historyQueryContents];
  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v2 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v10 = [HistoryEntryRecentsItem alloc];
          id v11 = -[HistoryEntryRecentsItem initWithHistoryEntry:](v10, "initWithHistoryEntry:", v9, (void)v14);
          if (v11) {
            [v3 addObject:v11];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = [v3 copy];

  return v12;
}

- (NSArray)historyQueryContents
{
  return self->_historyQueryContents;
}

- (NSArray)orderedRecents
{
  return self->_resolvedOrderedRecents;
}

+ (id)sharedRecents
{
  if (qword_10160EEC0 != -1) {
    dispatch_once(&qword_10160EEC0, &stru_1012ECF70);
  }
  v2 = (void *)qword_10160EEC8;

  return v2;
}

- (void)setHistoryRecents:(id)a3
{
}

- (void)_processRecents
{
  v3 = sub_100099700(self->_historyRecents, &stru_1012ED068);
  [(RecentCuratedCollectionResolver *)self->_curatedCollectionResolver setRecentCuratedCollections:v3];

  id v4 = [(Recents *)self _recentsByMappingCuratedCollectionsForRecents:self->_historyRecents];
  resolvedHistoryRecents = self->_resolvedHistoryRecents;
  self->_resolvedHistoryRecents = v4;

  id v6 = [(Recents *)self _recentsByMappingCuratedCollectionsForRecents:self->_orderedRecents];
  resolvedOrderedRecents = self->_resolvedOrderedRecents;
  self->_resolvedOrderedRecents = v6;

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 postNotificationName:@"RecentsDidChangeNotification" object:self];
}

- (id)_recentsByMappingCuratedCollectionsForRecents:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004E6A88;
  v5[3] = &unk_1012EA030;
  v5[4] = self;
  v3 = sub_100099700(a3, v5);

  return v3;
}

- (void)setSystemRecents:(id)a3
{
}

- (void)setHistoryQueryContents:(id)a3
{
}

+ (void)beginPrecachingRecentsIfNeeded
{
  id v2 = [a1 sharedRecents];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___RecentsObserver queue:&_dispatch_main_q];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(GEOObserverHashTable *)observers registerObserver:v4];
}

- (void)removeObserver:(id)a3
{
}

- (id)cachedMapItemForContactID:(int64_t)a3
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100103C7C;
  uint64_t v9 = sub_1001046C8;
  id v10 = 0;
  geo_isolate_sync();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

- (NSArray)recents
{
  return self->_resolvedHistoryRecents;
}

- (void)deleteCoreRecentContact:(id)a3
{
  id v4 = a3;
  coreRecentsNoResultCacheIDs = self->_coreRecentsNoResultCacheIDs;
  id v6 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v4 contactID]);
  [(NSMutableArray *)coreRecentsNoResultCacheIDs addObject:v6];

  uint64_t v7 = +[NSUserDefaults standardUserDefaults];
  [v7 setObject:self->_coreRecentsNoResultCacheIDs forKey:@"RecentsNoResultCacheIdsKey"];

  id v8 = +[NSUserDefaults standardUserDefaults];
  [v8 synchronize];

  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  long long v15 = sub_1004E5BE8;
  long long v16 = &unk_1012E5D58;
  long long v17 = self;
  id v18 = v4;
  geo_isolate_sync();
  dataLoadingQueue = self->_dataLoadingQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1004E5C58;
  v11[3] = &unk_1012E5D58;
  v11[4] = self;
  id v12 = v18;
  id v10 = v18;
  dispatch_sync(dataLoadingQueue, v11);
}

- (void)recordCoreRecentContact:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [v3 address];
    uint64_t v5 = [v3 displayName];
    uint64_t v6 = CRAddressKindMapLocation;
    uint64_t v7 = +[NSDate date];
    id v8 = +[CRRecentContactsLibrary recentEventForAddress:v4 displayName:v5 kind:v6 date:v7 weight:0 metadata:0 options:1];

    uint64_t v9 = +[CRRecentContactsLibrary defaultInstance];
    uint64_t v13 = v8;
    id v10 = +[NSArray arrayWithObjects:&v13 count:1];
    uint64_t v11 = CRRecentsDomainMaps;
    id v12 = [v3 lastSendingAddress];

    [v9 recordContactEvents:v10 recentsDomain:v11 sendingAddress:v12 completion:0];
  }
}

- (void)deleteRecents:(id)a3 completion:(id)a4
{
  v30 = (void (**)(id, id))a4;
  id v6 = a3;
  v32 = +[NSMutableArray array];
  v31 = +[NSMutableArray array];
  uint64_t v7 = [(Recents *)self _recentByUnmappingCuratedCollectionsForRecents:v6];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v45;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          uint64_t v14 = [v13 linkedRecentRoute];
          long long v15 = v14;
          if (v14)
          {
            long long v16 = [v14 historyEntry];
            [v32 addObject:v16];
          }
          long long v17 = [v13 historyEntry:v30];
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_1004E6278;
          v41[3] = &unk_1012ED090;
          v41[4] = self;
          id v42 = v13;
          id v43 = v32;
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_1004E6320;
          v39[3] = &unk_1012ED0B8;
          v39[4] = self;
          id v18 = v43;
          id v40 = v18;
          id v19 = v13;
          [v17 ifSearch:v41 ifRoute:0 ifPlaceDisplay:v39 ifTransitLineItem:0];

          v20 = [v19 historyEntry];
          [v18 addObject:v20];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v31 addObject:v12];
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v9);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = v31;
  id v22 = [v21 countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * (void)j);
        uint64_t v27 = +[Recents sharedRecents];
        [v27 deleteCoreRecentContact:v26];
      }
      id v23 = [v21 countByEnumeratingWithState:&v35 objects:v48 count:16];
    }
    while (v23);
  }

  v28 = +[MapsSyncStore sharedStore];
  id v34 = 0;
  [v28 deleteWithObjects:v32 error:&v34];
  id v29 = v34;

  v30[2](v30, v29);
}

- (void)deleteAllRecentsWithCompletion:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = self->_orderedRecents;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(Recents *)self deleteCoreRecentContact:v10];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  uint64_t v11 = +[MapsSyncStore sharedStore];
  historyQueryContents = self->_historyQueryContents;
  id v19 = 0;
  [v11 deleteWithObjects:historyQueryContents error:&v19];
  id v13 = v19;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004E65B8;
  block[3] = &unk_1012E5F78;
  id v17 = v13;
  id v18 = v4;
  id v14 = v13;
  id v15 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_recentWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100103C7C;
  long long v16 = sub_1001046C8;
  id v17 = 0;
  uint64_t v5 = [(Recents *)self recents];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004E6718;
  v9[3] = &unk_1012ED0E0;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_recentPlaceDisplayWithSupersededStorageIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100103C7C;
  long long v16 = sub_1001046C8;
  id v17 = 0;
  uint64_t v5 = [(Recents *)self recents];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004E6920;
  v9[3] = &unk_1012ED0E0;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_recentByUnmappingCuratedCollectionsForRecents:(id)a3
{
  return sub_100099700(a3, &stru_1012ED148);
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
}

- (NSArray)historyRecents
{
  return self->_historyRecents;
}

- (NSArray)resolvedHistoryRecents
{
  return self->_resolvedHistoryRecents;
}

- (void)setResolvedHistoryRecents:(id)a3
{
}

- (NSArray)resolvedOrderedRecents
{
  return self->_resolvedOrderedRecents;
}

- (void)setResolvedOrderedRecents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedOrderedRecents, 0);
  objc_storeStrong((id *)&self->_resolvedHistoryRecents, 0);
  objc_storeStrong((id *)&self->_historyRecents, 0);
  objc_storeStrong((id *)&self->_systemRecents, 0);
  objc_storeStrong((id *)&self->_historyQueryContents, 0);
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_storeStrong((id *)&self->_orderedRecents, 0);
  objc_storeStrong((id *)&self->_curatedCollectionResolver, 0);
  objc_storeStrong((id *)&self->_dataLoadingQueue, 0);
  objc_storeStrong((id *)&self->_coreRecentsNoResultCacheIDs, 0);
  objc_storeStrong((id *)&self->_coreRecentsMapItemCacheIsolator, 0);
  objc_storeStrong((id *)&self->_coreRecentsMapItemCache, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end