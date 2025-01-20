@interface RecentCuratedCollectionResolver
- (GEOObserverHashTable)observers;
- (NSArray)recentCuratedCollections;
- (NSDictionary)resolvedCuratedCollections;
- (id)_collectionsNeedingResolution;
- (id)resolvedGEOPlaceCollectionForMapsSyncHistoryCuratedCollection:(id)a3;
- (void)_cancelTicket;
- (void)_mergeCollections:(id)a3 error:(id)a4;
- (void)_notifyObservers;
- (void)_startTicket;
- (void)dealloc;
- (void)setRecentCuratedCollections:(id)a3;
@end

@implementation RecentCuratedCollectionResolver

- (id)_collectionsNeedingResolution
{
  recentCuratedCollections = self->_recentCuratedCollections;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10083E400;
  v5[3] = &unk_1012FA478;
  v5[4] = self;
  v3 = sub_1000AC254(recentCuratedCollections, v5);

  return v3;
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___RecentCuratedCollectionResolverObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)_startTicket
{
  [(RecentCuratedCollectionResolver *)self _cancelTicket];
  v3 = [(RecentCuratedCollectionResolver *)self _collectionsNeedingResolution];
  v4 = sub_100099700(v3, &stru_1012FA4B8);
  if ([v4 count])
  {
    v5 = sub_1005767A4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Resolving curated collections for identifiers: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v6 = +[MKMapService sharedService];
    v7 = MKMapItemIdentifiersArrayFromGEOMapItemIdentifiersArray();
    uint64_t v8 = [v6 ticketForCuratedCollections:v7 isBatchLookup:1 traits:0];
    ticket = self->_ticket;
    p_ticket = &self->_ticket;
    *p_ticket = (MKMapServiceCuratedCollectionTicket *)v8;

    v11 = *p_ticket;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10083E444;
    v12[3] = &unk_1012E6E78;
    objc_copyWeak(&v13, (id *)buf);
    [(MKMapServiceCuratedCollectionTicket *)v11 submitWithHandler:v12 networkActivity:0];
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

- (void)setRecentCuratedCollections:(id)a3
{
  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_recentCuratedCollections != v4)
  {
    v16 = v4;
    unsigned __int8 v6 = -[NSArray isEqual:](v4, "isEqual:");
    v5 = v16;
    if ((v6 & 1) == 0)
    {
      v7 = +[NSArray arrayWithArray:v16];
      recentCuratedCollections = self->_recentCuratedCollections;
      self->_recentCuratedCollections = v7;

      v9 = +[NSSet setWithArray:self->_recentCuratedCollections];
      v10 = [(NSDictionary *)self->_resolvedCuratedCollections allKeys];
      v11 = +[NSMutableSet setWithArray:v10];

      [v11 minusSet:v9];
      v12 = +[NSMutableDictionary dictionaryWithDictionary:self->_resolvedCuratedCollections];
      id v13 = [v11 allObjects];
      [v12 removeObjectsForKeys:v13];

      v14 = (NSDictionary *)[v12 copy];
      resolvedCuratedCollections = self->_resolvedCuratedCollections;
      self->_resolvedCuratedCollections = v14;

      [(RecentCuratedCollectionResolver *)self _startTicket];
      v5 = v16;
    }
  }
}

- (void)_cancelTicket
{
  [(MKMapServiceCuratedCollectionTicket *)self->_ticket cancel];
  ticket = self->_ticket;
  self->_ticket = 0;
}

- (void)dealloc
{
  [(RecentCuratedCollectionResolver *)self _cancelTicket];
  v3.receiver = self;
  v3.super_class = (Class)RecentCuratedCollectionResolver;
  [(RecentCuratedCollectionResolver *)&v3 dealloc];
}

- (id)resolvedGEOPlaceCollectionForMapsSyncHistoryCuratedCollection:(id)a3
{
  id v4 = a3;
  resolvedCuratedCollections = self->_resolvedCuratedCollections;
  unsigned __int8 v6 = [v4 mapItemIdentifier];
  v7 = [(NSDictionary *)resolvedCuratedCollections objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = sub_100104044;
    v15 = sub_1001048A0;
    id v16 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10083E3EC;
    v10[3] = &unk_1012F1768;
    v10[4] = &v11;
    [v7 withValue:v10 orError:&stru_1012FA450];
    id v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_mergeCollections:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v33 = a4;
  unsigned __int8 v6 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v5 count]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v13 = [v12 collectionIdentifier];
        [v6 setObject:v12 forKeyedSubscript:v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v9);
  }
  v30 = v7;

  v14 = sub_1005767A4();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = [v6 allKeys];
    *(_DWORD *)buf = 138412546;
    v45 = v15;
    __int16 v46 = 2112;
    id v47 = v33;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Received resolved curated collections: %@, error = %@", buf, 0x16u);
  }
  id v16 = +[NSMutableDictionary dictionaryWithCapacity:[(NSArray *)self->_recentCuratedCollections count]];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v17 = self->_recentCuratedCollections;
  id v18 = [(NSArray *)v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      v21 = 0;
      do
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)v21) mapItemIdentifier:v30];
        v23 = [(NSDictionary *)self->_resolvedCuratedCollections objectForKeyedSubscript:v22];
        v24 = [v6 objectForKeyedSubscript:v22];
        if (v24)
        {
          id v25 = +[Result resultWithValue:v24];
LABEL_21:
          v26 = v25;
          goto LABEL_22;
        }
        if ([v23 isSuccess]) {
          goto LABEL_18;
        }
        if (v33)
        {
          +[Result resultWithError:](Result, "resultWithError:");
          id v25 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
        if (v23)
        {
LABEL_18:
          id v25 = v23;
          goto LABEL_21;
        }
        v32 = GEOErrorDomain();
        v31 = +[NSError errorWithDomain:v32 code:-6 userInfo:0];
        v26 = +[Result resultWithError:v31];

LABEL_22:
        [v16 setObject:v26 forKeyedSubscript:v22];

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v27 = [(NSArray *)v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
      id v19 = v27;
    }
    while (v27);
  }

  v28 = (NSDictionary *)[v16 copy];
  resolvedCuratedCollections = self->_resolvedCuratedCollections;
  self->_resolvedCuratedCollections = v28;

  [(RecentCuratedCollectionResolver *)self _notifyObservers];
}

- (void)_notifyObservers
{
}

- (NSArray)recentCuratedCollections
{
  return self->_recentCuratedCollections;
}

- (NSDictionary)resolvedCuratedCollections
{
  return self->_resolvedCuratedCollections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedCuratedCollections, 0);
  objc_storeStrong((id *)&self->_recentCuratedCollections, 0);
  objc_storeStrong((id *)&self->_ticket, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end