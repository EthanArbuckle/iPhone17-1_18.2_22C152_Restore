@interface CuratedCollectionSyncManager
+ (id)sharedManager;
- (BOOL)collectionIsSaved:(id)a3;
- (BOOL)collectionIsSavedWithIdentifier:(id)a3;
- (BOOL)isPopulatingCachedCollections;
- (CuratedCollectionSyncManager)init;
- (GEOObserverHashTable)observers;
- (NSArray)cachedCuratedCollections;
- (NSArray)queryContents;
- (NSArray)storeSubscriptionTypes;
- (id)createCantorPair:(unint64_t)a3 y:(int)a4;
- (void)_addCachedCuratedCollections:(id)a3 completion:(id)a4;
- (void)_cacheSyncedCollections:(id)a3;
- (void)_removeSavedCuratedCollectionWithIdentifierMuid:(unint64_t)a3 resultProviderId:(int)a4 completion:(id)a5;
- (void)_updateCachedCuratedCollection:(id)a3 withCollection:(id)a4 completion:(id)a5;
- (void)_updateContent;
- (void)_updateSyncedCollectionResultProviderIdIfNeededWithCollection:(id)a3;
- (void)addObserver:(id)a3;
- (void)addSavedCuratedCollection:(id)a3 completion:(id)a4;
- (void)fetchCachedCollectionsWithCuratedCollections:(id)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)removeSavedCuratedCollection:(id)a3 completion:(id)a4;
- (void)removeSavedMapsSyncCuratedCollection:(id)a3 completion:(id)a4;
- (void)setCachedCuratedCollections:(id)a3;
- (void)setIsPopulatingCachedCollections:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setQueryContents:(id)a3;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
- (void)updateSavedCuratedCollection:(id)a3 completion:(id)a4;
@end

@implementation CuratedCollectionSyncManager

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CuratedCollectionSyncManager *)self observers];
  [v5 registerObserver:v4];
}

- (void)_updateContent
{
  objc_initWeak(&location, self);
  queryContents = self->_queryContents;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100032778;
  v4[3] = &unk_1012E9668;
  objc_copyWeak(&v5, &location);
  [(CuratedCollectionSyncManager *)self fetchCachedCollectionsWithCuratedCollections:queryContents completion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)storeDidChangeWithTypes:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init((Class)MSCuratedCollectionRequest);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100028A2C;
  v6[3] = &unk_1012E6E78;
  objc_copyWeak(&v7, &location);
  [v5 fetchWithCompletionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (CuratedCollectionSyncManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)CuratedCollectionSyncManager;
  v2 = [(CuratedCollectionSyncManager *)&v10 init];
  if (v2)
  {
    v3 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___CuratedCollectionSyncManagerObserver queue:0];
    observers = v2->_observers;
    v2->_observers = v3;

    id v5 = +[MapsSyncStore sharedStore];
    [v5 subscribe:v2];

    uint64_t v11 = objc_opt_class();
    uint64_t v6 = +[NSArray arrayWithObjects:&v11 count:1];
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v6;

    queryContents = v2->_queryContents;
    v2->_queryContents = (NSArray *)&__NSArray0__struct;

    [(CuratedCollectionSyncManager *)v2 storeDidChangeWithTypes:&__NSArray0__struct];
  }
  return v2;
}

- (void)fetchCachedCollectionsWithCuratedCollections:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v24 = a4;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v13 = [-CuratedCollectionSyncManager createCantorPair:y:](self, "createCantorPair:y:", [v12 curatedCollectionIdentifier], [v12 resultProviderIdentifier]);
        [v6 addObject:v13];

        v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v12 curatedCollectionIdentifier]);
        v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 resultProviderIdentifier]);
        v16 = +[NSPredicate predicateWithFormat:@"curatedCollectionIdentifier = %@ && resultProviderIdentifier = %@", v14, v15];
        [v7 addObject:v16];
      }
      id v9 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v9);
  }

  v17 = v7;
  v18 = +[NSCompoundPredicate orPredicateWithSubpredicates:v7];
  id v19 = [objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions) initWithPredicate:v18 sortDescriptors:0 range:0];
  id v20 = objc_alloc_init((Class)MSCachedCuratedCollectionRequest);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10003D6B0;
  v27[3] = &unk_1012ED9A0;
  id v28 = v6;
  v29 = self;
  id v30 = obj;
  id v31 = v24;
  id v21 = v24;
  id v22 = obj;
  id v23 = v6;
  [v20 fetchWithOptions:v19 completionHandler:v27];
}

- (BOOL)collectionIsSaved:(id)a3
{
  id v4 = [a3 collectionIdentifier];
  LOBYTE(self) = [(CuratedCollectionSyncManager *)self collectionIsSavedWithIdentifier:v4];

  return (char)self;
}

- (BOOL)collectionIsSavedWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CuratedCollectionSyncManager *)self queryContents];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 curatedCollectionIdentifier];
        if (v10 == [v4 muid])
        {
          if (![v9 resultProviderIdentifier]
            || (unsigned int v11 = [v9 resultProviderIdentifier],
                v11 == [v4 resultProviderID]))
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v6;
}

- (NSArray)queryContents
{
  return self->_queryContents;
}

- (NSArray)cachedCuratedCollections
{
  return self->_cachedCuratedCollections;
}

+ (id)sharedManager
{
  if (qword_10160EF90 != -1) {
    dispatch_once(&qword_10160EF90, &stru_1012ED978);
  }
  v2 = (void *)qword_10160EF88;

  return v2;
}

- (void)setCachedCuratedCollections:(id)a3
{
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)addSavedCuratedCollection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(CuratedCollectionSyncManager *)self collectionIsSaved:v6])
  {
    id v16 = v6;
    id v8 = +[NSArray arrayWithObjects:&v16 count:1];
    [(CuratedCollectionSyncManager *)self _addCachedCuratedCollections:v8 completion:0];

    id v9 = objc_alloc_init((Class)MSCuratedCollection);
    id v10 = [v6 collectionIdentifier];
    [v9 setCuratedCollectionIdentifier:[v10 muid]];

    unsigned int v11 = [v6 collectionIdentifier];
    [v9 setResultProviderIdentifier:[v11 resultProviderID]];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1005149C8;
    v13[3] = &unk_1012E76E8;
    id v14 = v9;
    id v15 = v7;
    id v12 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
  }
}

- (id)createCantorPair:(unint64_t)a3 y:(int)a4
{
  return +[NSNumber numberWithUnsignedLongLong:((a3 + a4 + (a3 + a4) * (a3 + a4)) >> 1) + a4];
}

- (void)updateSavedCuratedCollection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [v6 collectionIdentifier];
  id v9 = [v8 muid];

  id v10 = [v6 collectionIdentifier];
  id v11 = [v10 resultProviderID];

  id v12 = objc_alloc_init((Class)MSCuratedCollection);
  [v12 setCuratedCollectionIdentifier:v9];
  [v12 setResultProviderIdentifier:v11];
  id v13 = objc_alloc_init((Class)MSCuratedCollection);
  [v13 setCuratedCollectionIdentifier:v9];
  [v13 setResultProviderIdentifier:0];
  v22[0] = v12;
  v22[1] = v13;
  id v14 = +[NSArray arrayWithObjects:v22 count:2];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100514CB4;
  v17[3] = &unk_1012ED9C8;
  objc_copyWeak(&v20, &location);
  id v15 = v6;
  id v18 = v15;
  id v16 = v7;
  id v19 = v16;
  [(CuratedCollectionSyncManager *)self fetchCachedCollectionsWithCuratedCollections:v14 completion:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)removeSavedCuratedCollection:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [v7 collectionIdentifier];
  id v8 = [v10 muid];
  id v9 = [v7 collectionIdentifier];

  -[CuratedCollectionSyncManager _removeSavedCuratedCollectionWithIdentifierMuid:resultProviderId:completion:](self, "_removeSavedCuratedCollectionWithIdentifierMuid:resultProviderId:completion:", v8, [v9 resultProviderID], v6);
}

- (void)removeSavedMapsSyncCuratedCollection:(id)a3 completion:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [v6 curatedCollectionIdentifier];
  id v8 = [v6 resultProviderIdentifier];

  [(CuratedCollectionSyncManager *)self _removeSavedCuratedCollectionWithIdentifierMuid:v7 resultProviderId:v8 completion:v9];
}

- (void)_removeSavedCuratedCollectionWithIdentifierMuid:(unint64_t)a3 resultProviderId:(int)a4 completion:(id)a5
{
  id v8 = (void (**)(void))a5;
  queryContents = self->_queryContents;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100515010;
  v19[3] = &unk_1012ED9E8;
  v19[4] = a3;
  int v20 = a4;
  id v10 = +[NSPredicate predicateWithBlock:v19];
  id v11 = [(NSArray *)queryContents filteredArrayUsingPredicate:v10];

  cachedCuratedCollections = self->_cachedCuratedCollections;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100515084;
  v17[3] = &unk_1012ED9E8;
  void v17[4] = a3;
  int v18 = a4;
  id v13 = +[NSPredicate predicateWithBlock:v17];
  id v14 = [(NSArray *)cachedCuratedCollections filteredArrayUsingPredicate:v13];

  id v15 = +[MapsSyncStore sharedStore];
  id v16 = [v11 arrayByAddingObjectsFromArray:v14];
  [v15 deleteWithObjects:v16 error:0];

  if (v8) {
    v8[2](v8);
  }
}

- (void)_addCachedCuratedCollections:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v17 = a4;
  id v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v11);
        dispatch_group_enter(v7);
        id v13 = objc_alloc_init((Class)MSCachedCuratedCollection);
        id v14 = [v12 collectionIdentifier];
        [v13 setCuratedCollectionIdentifier:[v14 muid]];

        id v15 = [v12 collectionIdentifier];
        [v13 setResultProviderIdentifier:[v15 resultProviderID]];

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100515370;
        v21[3] = &unk_1012E5D08;
        id v22 = v7;
        [(CuratedCollectionSyncManager *)self _updateCachedCuratedCollection:v13 withCollection:v12 completion:v21];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  dispatch_group_leave(v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100515378;
  block[3] = &unk_1012E6EA8;
  id v20 = v17;
  id v16 = v17;
  dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateCachedCuratedCollection:(id)a3 withCollection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  id v11 = +[MKSystemController sharedInstance];
  [v11 screenScale];
  double v13 = v12;

  double v14 = v13 * 70.0;
  if (![v8 resultProviderIdentifier])
  {
    id v15 = [v9 collectionIdentifier];
    unsigned int v16 = [v15 resultProviderID];

    if (v16)
    {
      id v17 = [v9 collectionIdentifier];
      [v8 setResultProviderIdentifier:[v17 resultProviderID]];
    }
  }
  int v18 = [v9 collectionTitle];
  [v8 setTitle:v18];

  [v8 setPlacesCount:[v9 numberOfItems]];
  id v19 = [v9 publisherAttributionIdentifierString];
  [v8 setPublisherAttribution:v19];

  id v20 = [v9 photos];
  id v21 = [v20 _geo_firstPhotoOfAtLeastSize:v14, v14];

  if (v21)
  {
    id v22 = [v21 url];
    long long v23 = [v22 absoluteString];
    [v8 setImageUrl:v23];
  }
  long long v24 = +[MapsSyncStore sharedStore];
  id v26 = v8;
  long long v25 = +[NSArray arrayWithObjects:&v26 count:1];
  [v24 saveWithObjects:v25 error:0];

  [(CuratedCollectionSyncManager *)self _updateSyncedCollectionResultProviderIdIfNeededWithCollection:v9];
  if (v10) {
    v10[2](v10);
  }
}

- (void)_updateSyncedCollectionResultProviderIdIfNeededWithCollection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 collectionIdentifier];
  id v6 = [v5 resultProviderID];

  if (v6)
  {
    queryContents = self->_queryContents;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10051584C;
    v25[3] = &unk_1012EA0F8;
    id v26 = v4;
    id v8 = +[NSPredicate predicateWithBlock:v25];
    id v9 = [(NSArray *)queryContents filteredArrayUsingPredicate:v8];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          [v15 setResultProviderIdentifier:v6];
          unsigned int v16 = +[MapsSyncStore sharedStore];
          v29 = v15;
          id v17 = +[NSArray arrayWithObjects:&v29 count:1];
          id v20 = 0;
          [v16 saveWithObjects:v17 error:&v20];
          id v18 = v20;

          if (v18)
          {
            id v19 = sub_1000B944C();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v28 = v18;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error updating synced curated collection with lsp: %@", buf, 0xCu);
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v30 count:16];
      }
      while (v12);
    }
  }
}

- (void)_cacheSyncedCollections:(id)a3
{
  id v4 = a3;
  if (![(CuratedCollectionSyncManager *)self isPopulatingCachedCollections])
  {
    [(CuratedCollectionSyncManager *)self setIsPopulatingCachedCollections:1];
    id v5 = sub_100099700(v4, &stru_1012EDA28);
    id v6 = +[MKMapService sharedService];
    id v7 = [v6 ticketForCuratedCollections:v5 isBatchLookup:0 traits:0];

    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100515A94;
    v8[3] = &unk_1012E6E78;
    objc_copyWeak(&v9, &location);
    [v7 submitWithHandler:v8 networkActivity:0];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CuratedCollectionSyncManager *)self observers];
  [v5 unregisterObserver:v4];
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (void)setQueryContents:(id)a3
{
}

- (BOOL)isPopulatingCachedCollections
{
  return self->_isPopulatingCachedCollections;
}

- (void)setIsPopulatingCachedCollections:(BOOL)a3
{
  self->_isPopulatingCachedCollections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContents, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cachedCuratedCollections, 0);

  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
}

@end