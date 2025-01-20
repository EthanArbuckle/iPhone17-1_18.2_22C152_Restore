@interface CollectionManager
+ (id)sharedManager;
- (BOOL)hasInitialCollections;
- (CollectionHandler)allPlacesCollection;
- (CollectionHandler)favoriteCollection;
- (CollectionManager)init;
- (NSArray)currentCollections;
- (NSArray)currentCollectionsForCarPlay;
- (NSArray)currentCollectionsForLibrary;
- (NSArray)currentCollectionsForMacHome;
- (NSArray)currentCollectionsForPicker;
- (NSArray)currentCollectionsForToolbarMenu;
- (NSArray)currentCollectionsForWatchHome;
- (NSArray)currentCollectionsForiOSHome;
- (NSArray)queryContents;
- (NSArray)storeSubscriptionTypes;
- (id)_asMapsSyncObjectOrNil:(id)a3;
- (id)collectionForFavoritesType:(int64_t)a3;
- (id)collectionWithIdentifier:(id)a3;
- (id)collectionsContainingMapItem:(id)a3;
- (id)collectionsForAddingMapItems;
- (id)collectionsNotContainingMapItem:(id)a3;
- (id)firstUserGuideContainingMapItem:(id)a3 requiresOrdering:(BOOL)a4;
- (id)lookupMapItem:(id)a3;
- (id)newTraits;
- (id)orderedCollectionsExcludingAllPlacesCollection;
- (id)traitsCreationBlock;
- (unint64_t)displayCountForCollectionsInLibrary;
- (void)_fetchCollectionsWithCompletion:(id)a3;
- (void)_scheduleFetch;
- (void)_updateContent;
- (void)addObserver:(id)a3;
- (void)createCollection:(id)a3 completion:(id)a4;
- (void)curatedCollectionSyncManagerDidUpdateCachedCollections:(id)a3;
- (void)dealloc;
- (void)deleteCollection:(id)a3 completion:(id)a4;
- (void)deleteCollections:(id)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)saveCollection:(id)a3 completion:(id)a4;
- (void)setQueryContents:(id)a3;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)setTraitsCreationBlock:(id)a3;
- (void)touchCollection:(id)a3;
@end

@implementation CollectionManager

- (void)_scheduleFetch
{
  id v4 = [(MapsThrottler *)self->_fetchThrottler value];
  v3 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 BOOLValue] ^ 1);
  [(MapsThrottler *)self->_fetchThrottler setValue:v3];
}

- (unint64_t)displayCountForCollectionsInLibrary
{
  if (![(NSMutableArray *)self->_currentContents count]) {
    return 0;
  }
  id v3 = [(NSMutableArray *)self->_currentContents count];
  currentContents = self->_currentContents;
  v5 = [(CollectionManager *)self allPlacesCollection];
  LODWORD(currentContents) = [(NSMutableArray *)currentContents containsObject:v5];

  unint64_t v6 = (unint64_t)v3 - currentContents;
  v7 = [(CollectionManager *)self favoriteCollection];
  v8 = v7;
  if (v7 && [v7 isEmpty]) {
    v6 -= [(NSMutableArray *)self->_currentContents containsObject:v8];
  }

  return v6;
}

- (void)_fetchCollectionsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_updateContentQueue);
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init((Class)MSCollectionRequest);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100028020;
  v7[3] = &unk_1012EB628;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 fetchWithCompletionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (CollectionManager)init
{
  v32.receiver = self;
  v32.super_class = (Class)CollectionManager;
  v2 = [(CollectionManager *)&v32 init];
  if (v2)
  {
    id v3 = sub_1000B944C();
    os_signpost_id_t v4 = os_signpost_id_generate(v3);

    id v5 = sub_1000B944C();
    id v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Initialization", "", (uint8_t *)buf, 2u);
    }

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("CollectionManager.updateContent", v7);
    updateContentQueue = v2->_updateContentQueue;
    v2->_updateContentQueue = (OS_dispatch_queue *)v8;

    v10 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___CollectionManagerObserver queue:0];
    observers = v2->_observers;
    v2->_observers = v10;

    uint64_t v12 = +[NSMutableArray array];
    currentContents = v2->_currentContents;
    v2->_currentContents = (NSMutableArray *)v12;

    v14 = objc_alloc_init(CollectionOrderStorage);
    orderStorage = v2->_orderStorage;
    v2->_orderStorage = v14;

    v16 = objc_alloc_init(CollectionOrderStorage);
    v17 = v2->_orderStorage;
    v2->_orderStorage = v16;

    v18 = +[MapsSyncStore sharedStore];
    [v18 subscribe:v2];

    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    v33[4] = objc_opt_class();
    uint64_t v19 = +[NSArray arrayWithObjects:v33 count:5];
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v19;

    objc_initWeak(buf, v2);
    v21 = [MapsThrottler alloc];
    v22 = v2->_updateContentQueue;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000142F0;
    v29[3] = &unk_1012ED3A8;
    objc_copyWeak(&v30, buf);
    v23 = [(MapsThrottler *)v21 initWithInitialValue:&__kCFBooleanTrue throttlingInterval:v22 queue:v29 updateHandler:0.0];
    fetchThrottler = v2->_fetchThrottler;
    v2->_fetchThrottler = v23;

    [(CollectionManager *)v2 _scheduleFetch];
    v25 = sub_1000B944C();
    v26 = v25;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)v28 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v4, "Initialization", "", v28, 2u);
    }

    objc_destroyWeak(&v30);
    objc_destroyWeak(buf);
  }
  return v2;
}

- (void)_updateContent
{
  id v3 = sub_1000B944C();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  id v5 = sub_1000B944C();
  id v6 = v5;
  os_signpost_id_t spid = v4;
  unint64_t v53 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "UpdateContent", "", buf, 2u);
  }

  v7 = sub_1000B944C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_t v8 = [(CollectionManager *)self queryContents];
    *(_DWORD *)buf = 138412290;
    v87 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[MCM] _updateContent %@", buf, 0xCu);
  }
  id v59 = [(NSMutableArray *)self->_currentContents mutableCopy];
  id v56 = [&__NSArray0__struct mutableCopy];
  uint64_t v9 = [(CollectionManager *)self favoriteCollection];
  v54 = [(CollectionManager *)self allPlacesCollection];
  if (v9) {
    [(NSMutableArray *)self->_currentContents removeObject:v9];
  }
  if (v54) {
    -[NSMutableArray removeObject:](self->_currentContents, "removeObject:");
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = [(CollectionManager *)self queryContents];
  id v10 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
  v62 = self;
  v52 = (void *)v9;
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v78;
    uint64_t v55 = *(void *)v78;
    while (2)
    {
      v14 = 0;
      id v57 = v11;
      do
      {
        if (*(void *)v78 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v77 + 1) + 8 * (void)v14);
        v16 = [v15 identifier];
        v17 = [v16 UUIDString];

        unsigned int v18 = [v15 placesCount];
        if ([v15 isLegacyFavoritesCollection]) {
          BOOL v19 = v18 == 0;
        }
        else {
          BOOL v19 = 0;
        }
        if (!v19)
        {
          if (!v17)
          {
            v28 = +[MapsSyncStore sharedStore];
            v84 = v15;
            v29 = +[NSArray arrayWithObjects:&v84 count:1];
            [v28 deleteWithObjects:v29 error:0];

            goto LABEL_36;
          }
          int v63 = v12;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          v20 = self->_currentContents;
          id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v73 objects:v83 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v74;
            while (2)
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v74 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = *(void **)(*((void *)&v73 + 1) + 8 * i);
                v26 = [v25 identifier];
                unsigned int v27 = [v17 isEqualToString:v26];

                if (v27)
                {
                  [v59 removeObject:v25];
                  [v25 updateWithMapsSyncCollection:v15];
                  self = v62;
                  goto LABEL_30;
                }
              }
              id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v73 objects:v83 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }

          v20 = +[CollectionHandler collectionWithMapsSyncCollection:v15];
          self = v62;
          [(NSMutableArray *)v20 setCollectionOperation:v62];
          [v56 addObject:v20];
LABEL_30:
          uint64_t v12 = (v63 + 1);

          uint64_t v13 = v55;
          id v11 = v57;
        }

        v14 = (char *)v14 + 1;
      }
      while (v14 != v11);
      id v11 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
LABEL_36:

  id v30 = +[GEOAPSharedStateData sharedData];
  [v30 setMapFeaturePersonalCollectionsCount:v12];

  v31 = +[CuratedCollectionSyncManager sharedManager];
  objc_super v32 = [v31 cachedCuratedCollections];

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v58 = v32;
  id v64 = [v58 countByEnumeratingWithState:&v69 objects:v82 count:16];
  if (v64)
  {
    id obja = *(id *)v70;
    do
    {
      for (j = 0; j != v64; j = (char *)j + 1)
      {
        if (*(id *)v70 != obja) {
          objc_enumerationMutation(v58);
        }
        v34 = *(void **)(*((void *)&v69 + 1) + 8 * (void)j);
        v35 = [v34 identifier];
        v36 = [v35 UUIDString];

        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        v37 = self->_currentContents;
        id v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v65 objects:v81 count:16];
        if (v38)
        {
          id v39 = v38;
          uint64_t v40 = *(void *)v66;
          while (2)
          {
            for (k = 0; k != v39; k = (char *)k + 1)
            {
              if (*(void *)v66 != v40) {
                objc_enumerationMutation(v37);
              }
              v42 = *(void **)(*((void *)&v65 + 1) + 8 * (void)k);
              v43 = [v42 identifier];
              unsigned int v44 = [v36 isEqualToString:v43];

              if (v44)
              {
                [v59 removeObject:v42];
                [v42 updateWithMapsSyncCachedCuratedCollection:v34];
                self = v62;
                goto LABEL_51;
              }
            }
            id v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v65 objects:v81 count:16];
            if (v39) {
              continue;
            }
            break;
          }
        }

        v37 = +[CollectionHandler collectionWithMapsSyncCachedCuratedCollection:v34];
        self = v62;
        [(NSMutableArray *)v37 setCollectionOperation:v62];
        [v56 addObject:v37];
LABEL_51:
      }
      id v64 = [v58 countByEnumeratingWithState:&v69 objects:v82 count:16];
    }
    while (v64);
  }

  [(NSMutableArray *)self->_currentContents removeObjectsInArray:v59];
  [(NSMutableArray *)self->_currentContents addObjectsFromArray:v56];
  v45 = sub_1000B944C();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    currentContents = self->_currentContents;
    *(_DWORD *)buf = 138412290;
    v87 = currentContents;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "[MCM] _updateContent (updated) %@", buf, 0xCu);
  }

  if (v52) {
    [(NSMutableArray *)self->_currentContents insertObject:v52 atIndex:0];
  }
  if (v54) {
    -[NSMutableArray addObject:](self->_currentContents, "addObject:");
  }
  if (self->_needToSendUpdate || [v59 count] || objc_msgSend(v56, "count"))
  {
    v47 = [(CollectionManager *)self currentCollections];
    [(GEOObserverHashTable *)self->_observers collectionManager:self contentDidChange:v47];
  }
  self->_needToSendUpdate = 0;
  if (!self->_didRegisterForCollectionsSyncManager)
  {
    v48 = +[CuratedCollectionSyncManager sharedManager];
    [v48 addObserver:self];

    self->_didRegisterForCollectionsSyncManager = 1;
  }
  v49 = sub_1000B944C();
  v50 = v49;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_INTERVAL_END, spid, "UpdateContent", "", buf, 2u);
  }
}

+ (id)sharedManager
{
  if (qword_101610390 != -1) {
    dispatch_once(&qword_101610390, &stru_1013135B0);
  }
  v2 = (void *)qword_101610388;

  return v2;
}

- (NSArray)queryContents
{
  return self->_queryContents;
}

- (CollectionHandler)favoriteCollection
{
  if (!self->_favoriteCollection
    && +[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v3 = +[CollectionHandler favoriteCollection];
    favoriteCollection = self->_favoriteCollection;
    self->_favoriteCollection = v3;

    [(CollectionHandler *)self->_favoriteCollection setCollectionOperation:self];
  }
  id v5 = self->_favoriteCollection;

  return v5;
}

- (NSArray)currentCollections
{
  return (NSArray *)[(CollectionOrderStorage *)self->_orderStorage orderCollections:self->_currentContents];
}

- (CollectionHandler)allPlacesCollection
{
  allPlacesCollection = self->_allPlacesCollection;
  if (!allPlacesCollection)
  {
    os_signpost_id_t v4 = sub_1000B944C();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    id v6 = sub_1000B944C();
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AllPlacesCollection", "", buf, 2u);
    }

    dispatch_queue_t v8 = +[CollectionHandler collectionAllSavedPlaces];
    uint64_t v9 = self->_allPlacesCollection;
    self->_allPlacesCollection = v8;

    [(CollectionHandler *)self->_allPlacesCollection setCollectionOperation:self];
    id v10 = sub_1000B944C();
    id v11 = v10;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v5, "AllPlacesCollection", "", v13, 2u);
    }

    allPlacesCollection = self->_allPlacesCollection;
  }

  return allPlacesCollection;
}

- (void)setTraitsCreationBlock:(id)a3
{
}

- (void)curatedCollectionSyncManagerDidUpdateCachedCollections:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100107B70;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)addObserver:(id)a3
{
}

- (void)dealloc
{
  if (self->_didRegisterForCollectionsSyncManager)
  {
    id v3 = +[CuratedCollectionSyncManager sharedManager];
    [v3 removeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)CollectionManager;
  [(CollectionManager *)&v4 dealloc];
}

- (id)newTraits
{
  id v3 = [(CollectionManager *)self traitsCreationBlock];

  if (!v3
    || ([(CollectionManager *)self traitsCreationBlock],
        objc_super v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(),
        v4[2](),
        os_signpost_id_t v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    id v6 = +[MKMapService sharedService];
    os_signpost_id_t v5 = [v6 mapsDefaultTraits];
  }
  return v5;
}

- (void)touchCollection:(id)a3
{
  [(CollectionOrderStorage *)self->_orderStorage editCollection:a3];
  self->_needToSendUpdate = 1;

  [(CollectionManager *)self _updateContent];
}

- (void)createCollection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = sub_1000B944C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 title];
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[MCM] createCollection %@", buf, 0xCu);
  }
  id v10 = [(CollectionManager *)self _asMapsSyncObjectOrNil:v6];
  if (v6)
  {
    id v11 = +[MapsSyncStore sharedStore];
    unsigned int v18 = v10;
    uint64_t v12 = +[NSArray arrayWithObjects:&v18 count:1];
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_1009D2944;
    v16 = &unk_1012E76C0;
    id v17 = v7;
    [v11 saveWithObjects:v12 completionHandler:&v13];

    -[CollectionOrderStorage editCollection:](self->_orderStorage, "editCollection:", v6, v13, v14, v15, v16);
  }
}

- (void)saveCollection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = sub_1000B944C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 title];
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[MCM] saveCollection %@", buf, 0xCu);
  }
  id v10 = [(CollectionManager *)self _asMapsSyncObjectOrNil:v6];
  if (v6)
  {
    id v11 = +[MapsSyncStore sharedStore];
    unsigned int v18 = v10;
    uint64_t v12 = +[NSArray arrayWithObjects:&v18 count:1];
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_1009D2C40;
    v16 = &unk_1012E76C0;
    id v17 = v7;
    [v11 saveWithObjects:v12 completionHandler:&v13];

    -[CollectionOrderStorage editCollection:](self->_orderStorage, "editCollection:", v6, v13, v14, v15, v16);
  }
}

- (void)deleteCollection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = sub_1000B944C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 title];
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[MCM] deleteCollection %@", buf, 0xCu);
  }
  id v10 = [(CollectionManager *)self _asMapsSyncObjectOrNil:v6];
  if (v6)
  {
    id v11 = +[MapsSyncStore sharedStore];
    unsigned int v18 = v10;
    uint64_t v12 = +[NSArray arrayWithObjects:&v18 count:1];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1009D2F68;
    v15[3] = &unk_1012E76C0;
    id v16 = v7;
    [v11 deleteWithObjects:v12 completionHandler:v15];

    orderStorage = self->_orderStorage;
    id v17 = v6;
    uint64_t v14 = +[NSArray arrayWithObjects:&v17 count:1];
    [(CollectionOrderStorage *)orderStorage removeCollections:v14];
  }
}

- (void)deleteCollections:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = sub_1000B944C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[MCM] deleteCollections %@", buf, 0xCu);
  }

  uint64_t v9 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [(CollectionManager *)self _asMapsSyncObjectOrNil:*(void *)(*((void *)&v19 + 1) + 8 * (void)v14)];
        if (v15) {
          [v9 addObject:v15];
        }

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    id v16 = +[MapsSyncStore sharedStore];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1009D32EC;
    v17[3] = &unk_1012E76C0;
    id v18 = v7;
    [v16 deleteWithObjects:v9 completionHandler:v17];

    [(CollectionOrderStorage *)self->_orderStorage removeCollections:v10];
  }
}

- (NSArray)currentCollectionsForLibrary
{
  return (NSArray *)[(CollectionManager *)self orderedCollectionsExcludingAllPlacesCollection];
}

- (NSArray)currentCollectionsForMacHome
{
  return (NSArray *)[(CollectionManager *)self orderedCollectionsExcludingAllPlacesCollection];
}

- (NSArray)currentCollectionsForiOSHome
{
  return (NSArray *)[(CollectionManager *)self orderedCollectionsExcludingAllPlacesCollection];
}

- (id)orderedCollectionsExcludingAllPlacesCollection
{
  id v3 = [(NSMutableArray *)self->_currentContents mutableCopy];
  objc_super v4 = [(CollectionManager *)self allPlacesCollection];
  [v3 removeObject:v4];

  os_signpost_id_t v5 = [(CollectionOrderStorage *)self->_orderStorage orderCollections:v3];

  return v5;
}

- (NSArray)currentCollectionsForWatchHome
{
  id v3 = [(CollectionManager *)self currentCollections];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009D3514;
  v7[3] = &unk_1012EA0F8;
  void v7[4] = self;
  objc_super v4 = +[NSPredicate predicateWithBlock:v7];
  os_signpost_id_t v5 = [v3 filteredArrayUsingPredicate:v4];

  return (NSArray *)v5;
}

- (NSArray)currentCollectionsForCarPlay
{
  v2 = [(CollectionManager *)self currentCollections];
  id v3 = +[NSPredicate predicateWithBlock:&stru_1013135D0];
  objc_super v4 = [v2 filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

- (NSArray)currentCollectionsForPicker
{
  id v3 = [(NSMutableArray *)self->_currentContents mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_super v4 = self->_currentContents;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [(CollectionManager *)self allPlacesCollection];
        if (v9 == (void *)v10)
        {

LABEL_10:
          [v3 removeObject:v9];
          continue;
        }
        id v11 = (void *)v10;
        id v12 = [v9 handlerType];

        if (v12 == (id)4) {
          goto LABEL_10;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }

  uint64_t v13 = +[CollectionHandler addToCollection];
  long long v22 = v13;
  uint64_t v14 = +[NSArray arrayWithObjects:&v22 count:1];
  v15 = [(CollectionOrderStorage *)self->_orderStorage orderCollections:v3];
  id v16 = [v14 arrayByAddingObjectsFromArray:v15];

  return (NSArray *)v16;
}

- (NSArray)currentCollectionsForToolbarMenu
{
  id v3 = [(NSMutableArray *)self->_currentContents mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v4 = self->_currentContents;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [(CollectionManager *)self allPlacesCollection];
        if (v9 == (void *)v10)
        {

LABEL_10:
          [v3 removeObject:v9];
          continue;
        }
        id v11 = (void *)v10;
        id v12 = [v9 handlerType];

        if (v12 == (id)4) {
          goto LABEL_10;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  uint64_t v13 = [(CollectionOrderStorage *)self->_orderStorage orderCollections:v3];

  return (NSArray *)v13;
}

- (id)collectionForFavoritesType:(int64_t)a3
{
  if (a3 == 1)
  {
    id v5 = [(CollectionManager *)self allPlacesCollection];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)collectionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self->_currentContents;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 identifier:v14];
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)removeObserver:(id)a3
{
}

- (id)collectionsContainingMapItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[NSMutableArray array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = [(CollectionManager *)self currentCollections];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (![v11 handlerType] && objc_msgSend(v11, "containsItem:", v4)) {
            [v5 addObject:v11];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    id v12 = [v5 copy];
  }
  else
  {
    id v12 = &__NSArray0__struct;
  }

  return v12;
}

- (id)firstUserGuideContainingMapItem:(id)a3 requiresOrdering:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    if (a4)
    {
      id v7 = [(CollectionManager *)self currentCollections];
    }
    else
    {
      id v7 = self->_currentContents;
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v7;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (!objc_msgSend(v12, "handlerType", (void)v14)
            && ([v12 containsItem:v6] & 1) != 0)
          {
            id v9 = v12;
            goto LABEL_16;
          }
        }
        id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)collectionsNotContainingMapItem:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(CollectionManager *)self currentCollections];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (![v11 handlerType] && (objc_msgSend(v11, "containsItem:", v4) & 1) == 0) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (id)collectionsForAddingMapItems
{
  uint64_t v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CollectionManager *)self currentCollections];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (![v9 handlerType]) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return v10;
}

- (id)lookupMapItem:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_currentContents;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (!objc_msgSend(v10, "handlerType", (void)v16))
        {
          uint64_t v11 = [v10 placeItemMatchingMapItem:v4];
          if (v11)
          {
            long long v14 = (void *)v11;
            long long v13 = [[LibraryMapItemLookupResult alloc] initWithPlaceItem:v11 collectionHandler:v10];

            goto LABEL_14;
          }
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v12 = [(CollectionManager *)self allPlacesCollection];
  id v5 = [v12 placeItemMatchingMapItem:v4];

  if (v5) {
    long long v13 = [[LibraryMapItemLookupResult alloc] initWithPlaceItem:v5 collectionHandler:0];
  }
  else {
    long long v13 = 0;
  }
LABEL_14:

  return v13;
}

- (id)_asMapsSyncObjectOrNil:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = +[NSString stringWithFormat:@"collection is nil or is not a MapsSync Collection"];
      int v10 = 136315906;
      uint64_t v11 = "-[CollectionManager _asMapsSyncObjectOrNil:]";
      __int16 v12 = 2080;
      long long v13 = "CollectionManager.m";
      __int16 v14 = 1024;
      int v15 = 560;
      __int16 v16 = 2112;
      long long v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", (uint8_t *)&v10, 0x26u);
    }
    if (sub_100BB36BC())
    {
      id v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = +[NSThread callStackSymbols];
        int v10 = 138412290;
        uint64_t v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
      }
    }
    id v4 = 0;
  }

  return v4;
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
}

- (BOOL)hasInitialCollections
{
  return self->_hasInitialCollections;
}

- (id)traitsCreationBlock
{
  return self->_traitsCreationBlock;
}

- (void)setQueryContents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContents, 0);
  objc_storeStrong(&self->_traitsCreationBlock, 0);
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_storeStrong((id *)&self->_favoriteCollection, 0);
  objc_storeStrong((id *)&self->_allPlacesCollection, 0);
  objc_storeStrong((id *)&self->_fetchThrottler, 0);
  objc_storeStrong((id *)&self->_updateContentQueue, 0);
  objc_storeStrong((id *)&self->_orderStorage, 0);
  objc_storeStrong((id *)&self->_currentContents, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end