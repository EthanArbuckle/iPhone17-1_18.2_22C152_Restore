@interface CollectionsDataProvider
- (BOOL)active;
- (BOOL)hasInitialData;
- (BOOL)observeContents;
- (BOOL)observeInfo;
- (CollectionsDataProvider)initWithContext:(int64_t)a3 observeInfo:(BOOL)a4 observeContents:(BOOL)a5;
- (GEOObserverHashTable)observers;
- (NSArray)collections;
- (int64_t)context;
- (void)_startObservingCollection:(id)a3;
- (void)_stopObservingCollection:(id)a3;
- (void)_updateCollectionsAndNotifyObservers:(BOOL)a3;
- (void)_updateContentsOfCollection:(id)a3 notifyObservers:(BOOL)a4;
- (void)_updateInfoOfCollection:(id)a3 notifyObservers:(BOOL)a4;
- (void)_updateObservedCollectionsWithCollections:(id)a3;
- (void)collectionHandlerContentUpdated:(id)a3;
- (void)collectionHandlerInfoUpdated:(id)a3;
- (void)collectionManager:(id)a3 contentDidChange:(id)a4;
- (void)setActive:(BOOL)a3;
@end

@implementation CollectionsDataProvider

- (CollectionsDataProvider)initWithContext:(int64_t)a3 observeInfo:(BOOL)a4 observeContents:(BOOL)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CollectionsDataProvider;
  v8 = [(CollectionsDataProvider *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_observeInfo = a4;
    v8->_observeContents = a5;
    collections = v8->_collections;
    v8->_context = a3;
    v8->_collections = (NSArray *)&__NSArray0__struct;
  }
  return v9;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    v5 = +[CollectionManager sharedManager];
    v6 = v5;
    if (v3)
    {
      [v5 addObserver:self];

      [(CollectionsDataProvider *)self _updateObservedCollectionsWithCollections:self->_collectionsByIdentifier];
      [(CollectionsDataProvider *)self _updateCollectionsAndNotifyObservers:1];
    }
    else
    {
      [v5 removeObserver:self];

      [(CollectionsDataProvider *)self _updateObservedCollectionsWithCollections:&__NSDictionary0__struct];
    }
  }
}

- (void)_updateCollectionsAndNotifyObservers:(BOOL)a3
{
  if (!self->_active) {
    return;
  }
  BOOL v3 = a3;
  v6 = +[CollectionManager sharedManager];
  if ([v6 hasInitialCollections])
  {
    BOOL hasInitialData = self->_hasInitialData;

    if (!hasInitialData)
    {
      int v59 = 1;
      self->_BOOL hasInitialData = 1;
      goto LABEL_7;
    }
  }
  else
  {
  }
  int v59 = 0;
LABEL_7:
  BOOL v58 = v3;
  aSelector = a2;
  switch(self->_context)
  {
    case 0:
      v8 = +[CollectionManager sharedManager];
      uint64_t v9 = [v8 currentCollections];
      goto LABEL_15;
    case 1:
      v8 = +[CollectionManager sharedManager];
      uint64_t v9 = [v8 currentCollectionsForMacHome];
      goto LABEL_15;
    case 2:
      v8 = +[CollectionManager sharedManager];
      uint64_t v9 = [v8 currentCollectionsForiOSHome];
      goto LABEL_15;
    case 3:
      v8 = +[CollectionManager sharedManager];
      uint64_t v9 = [v8 currentCollectionsForWatchHome];
      goto LABEL_15;
    case 4:
      v8 = +[CollectionManager sharedManager];
      uint64_t v9 = [v8 currentCollectionsForCarPlay];
      goto LABEL_15;
    case 5:
      v8 = +[CollectionManager sharedManager];
      uint64_t v9 = [v8 currentCollectionsForPicker];
LABEL_15:
      v10 = (void *)v9;

      break;
    default:
      v10 = 0;
      break;
  }
  collections = self->_collections;
  id v12 = v10;
  v13 = collections;
  id v14 = [v12 count];
  if (v14 != (id)[(NSArray *)v13 count])
  {
LABEL_22:

    v22 = +[NSMutableDictionary dictionary];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v23 = v12;
    id v24 = [v23 countByEnumeratingWithState:&v64 objects:v81 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v65;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v65 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          v29 = [v28 identifier:aSelector];
          [v22 setObject:v28 forKeyedSubscript:v29];
        }
        id v25 = [v23 countByEnumeratingWithState:&v64 objects:v81 count:16];
      }
      while (v25);
    }

    v30 = (NSArray *)[v23 copy];
    v31 = self->_collections;
    self->_collections = v30;

    v32 = (NSDictionary *)[v22 copy];
    collectionsByIdentifier = self->_collectionsByIdentifier;
    self->_collectionsByIdentifier = v32;

    [(CollectionsDataProvider *)self _updateObservedCollectionsWithCollections:self->_collectionsByIdentifier];
    int v21 = 1;
    goto LABEL_30;
  }
  if ([v12 count])
  {
    uint64_t v15 = 0;
    do
    {
      v16 = [v12 objectAtIndexedSubscript:v15];
      v17 = [v16 identifier];
      v18 = [(NSArray *)v13 objectAtIndexedSubscript:v15];
      v19 = [v18 identifier];
      unsigned __int8 v20 = [v17 isEqualToString:v19];

      if ((v20 & 1) == 0) {
        goto LABEL_22;
      }
    }
    while (++v15 < (unint64_t)[v12 count]);
  }

  int v21 = 0;
LABEL_30:
  if (self->_observeContents)
  {
    v34 = +[NSMutableDictionary dictionary];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v35 = v12;
    id v36 = [v35 countByEnumeratingWithState:&v60 objects:v80 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v61;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(void *)v61 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
          v41 = [v40 content:aSelector];
          v42 = [v40 identifier];
          [v34 setObject:v41 forKeyedSubscript:v42];
        }
        id v37 = [v35 countByEnumeratingWithState:&v60 objects:v80 count:16];
      }
      while (v37);
    }

    unsigned int v43 = [v34 isEqualToDictionary:self->_contentsByIdentifier];
    int v44 = v43 ^ 1;
    if ((v43 & 1) == 0)
    {
      v45 = (NSDictionary *)[v34 copy];
      contentsByIdentifier = self->_contentsByIdentifier;
      self->_contentsByIdentifier = v45;
    }
  }
  else
  {
    int v44 = 0;
  }
  v47 = sub_1000AA148();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = (objc_class *)objc_opt_class();
    v49 = NSStringFromClass(v48);
    v50 = NSStringFromSelector(aSelector);
    unsigned int v51 = [(NSArray *)self->_collections count];
    sub_100097E28(v59);
    v53 = int v52 = v21;
    v54 = sub_100097E28(v52);
    sub_100097E28(v44);
    v55 = int aSelectora = v44;
    *(_DWORD *)buf = 138413570;
    v69 = v49;
    __int16 v70 = 2112;
    v71 = v50;
    __int16 v72 = 1024;
    unsigned int v73 = v51;
    __int16 v74 = 2112;
    v75 = v53;
    __int16 v76 = 2112;
    v77 = v54;
    __int16 v78 = 2112;
    v79 = v55;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%@ %@, # collections = %d, hasInitialDataChanged = %@, collectionsChanged = %@, contentsChanged = %@", buf, 0x3Au);

    int v44 = aSelectora;
    int v21 = v52;
  }
  if ((v59 | v21 | v44) == 1 && v58) {
    [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
  }
}

- (void)_updateInfoOfCollection:(id)a3 notifyObservers:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (self->_active && self->_observeInfo)
  {
    v8 = sub_1000AA148();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = NSStringFromSelector(a2);
      id v12 = sub_100097E28(v4);
      int v13 = 138413058;
      id v14 = v10;
      __int16 v15 = 2112;
      v16 = v11;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      unsigned __int8 v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@, collection = %@, notifyObservers = %@", (uint8_t *)&v13, 0x2Au);
    }
    if (v4) {
      [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
    }
  }
}

- (void)_updateContentsOfCollection:(id)a3 notifyObservers:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = v7;
  if (self->_active && self->_observeContents)
  {
    contentsByIdentifier = self->_contentsByIdentifier;
    v10 = [v7 identifier];
    uint64_t v11 = [(NSDictionary *)contentsByIdentifier objectForKeyedSubscript:v10];
    id v12 = (void *)v11;
    if (v11) {
      int v13 = (void *)v11;
    }
    else {
      int v13 = &__NSArray0__struct;
    }
    id v14 = v13;

    uint64_t v15 = [v8 content];
    v16 = (void *)v15;
    if (v15) {
      __int16 v17 = (void *)v15;
    }
    else {
      __int16 v17 = &__NSArray0__struct;
    }
    id v18 = v17;

    unsigned int v19 = [v14 isEqualToArray:v18];
    if ((v19 & 1) == 0)
    {
      unsigned __int8 v20 = +[NSMutableDictionary dictionaryWithDictionary:self->_contentsByIdentifier];
      int v21 = [v8 identifier];
      [v20 setObject:v18 forKeyedSubscript:v21];

      v22 = (NSDictionary *)[v20 copy];
      id v23 = self->_contentsByIdentifier;
      self->_contentsByIdentifier = v22;
    }
    id v24 = sub_1000AA148();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v30 = v14;
      id v25 = (objc_class *)objc_opt_class();
      uint64_t v26 = NSStringFromClass(v25);
      v27 = NSStringFromSelector(a2);
      v28 = sub_100097E28(v19 ^ 1);
      v29 = sub_100097E28(v4);
      *(_DWORD *)buf = 138413314;
      v32 = v26;
      __int16 v33 = 2112;
      v34 = v27;
      __int16 v35 = 2112;
      id v36 = v8;
      __int16 v37 = 2112;
      uint64_t v38 = v28;
      __int16 v39 = 2112;
      v40 = v29;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@ %@, collection = %@, contentsChanged = %@, notifyObservers = %@", buf, 0x34u);

      id v14 = v30;
    }

    if (((v19 | !v4) & 1) == 0) {
      [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
    }
  }
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    BOOL v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
  id v6 = a4;
  id v7 = sub_1000AA148();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(a2);
    int v11 = 138412802;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v11, 0x20u);
  }
  [(CollectionsDataProvider *)self _updateCollectionsAndNotifyObservers:1];
}

- (void)collectionHandlerInfoUpdated:(id)a3
{
  id v5 = a3;
  id v6 = sub_1000AA148();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(a2);
    int v10 = 138412802;
    int v11 = v8;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@: %@", (uint8_t *)&v10, 0x20u);
  }
  [(CollectionsDataProvider *)self _updateInfoOfCollection:v5 notifyObservers:1];
}

- (void)collectionHandlerContentUpdated:(id)a3
{
  id v5 = a3;
  id v6 = sub_1000AA148();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(a2);
    int v10 = 138412802;
    int v11 = v8;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@: %@", (uint8_t *)&v10, 0x20u);
  }
  [(CollectionsDataProvider *)self _updateContentsOfCollection:v5 notifyObservers:1];
}

- (void)_updateObservedCollectionsWithCollections:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(_WORD *)&self->_observeInfo)
  {
    id v6 = [v4 allKeys];
    id v7 = +[NSSet setWithArray:v6];

    v8 = [(NSDictionary *)self->_observedCollectionsByIdentifier allKeys];
    uint64_t v9 = +[NSSet setWithArray:v8];

    int v10 = +[NSMutableSet setWithSet:v7];
    [v10 minusSet:v9];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          [(CollectionsDataProvider *)self _startObservingCollection:v16];
        }
        id v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v13);
    }

    __int16 v17 = +[NSMutableSet setWithSet:v9];
    [v17 minusSet:v7];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v18 = v17;
    id v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = -[NSDictionary objectForKeyedSubscript:](self->_observedCollectionsByIdentifier, "objectForKeyedSubscript:", *(void *)(*((void *)&v26 + 1) + 8 * (void)j), (void)v26);
          [(CollectionsDataProvider *)self _stopObservingCollection:v23];
        }
        id v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v20);
    }

    id v24 = (NSDictionary *)[v5 copy];
    observedCollectionsByIdentifier = self->_observedCollectionsByIdentifier;
    self->_observedCollectionsByIdentifier = v24;
  }
}

- (void)_startObservingCollection:(id)a3
{
  id v5 = a3;
  id v6 = sub_1000AA148();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(a2);
    int v10 = 138412802;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@: %@", (uint8_t *)&v10, 0x20u);
  }
  [v5 addObserver:self];
}

- (void)_stopObservingCollection:(id)a3
{
  id v5 = a3;
  id v6 = sub_1000AA148();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(a2);
    int v10 = 138412802;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@: %@", (uint8_t *)&v10, 0x20u);
  }
  [v5 removeObserver:self];
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (int64_t)context
{
  return self->_context;
}

- (BOOL)observeInfo
{
  return self->_observeInfo;
}

- (BOOL)observeContents
{
  return self->_observeContents;
}

- (NSArray)collections
{
  return self->_collections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_observedCollectionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_contentsByIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionsByIdentifier, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end