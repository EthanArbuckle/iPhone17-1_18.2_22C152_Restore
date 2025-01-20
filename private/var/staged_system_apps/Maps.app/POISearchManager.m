@interface POISearchManager
- (POISearchManager)init;
- (id)searchResultForIdentifier:(id)a3;
- (void)_cacheAndHandleSearchResult:(id)a3 identifier:(id)a4 completionHandlers:(id)a5;
- (void)_setLoading:(BOOL)a3 forIdentifier:(id)a4;
- (void)_updateActivityIndicatorForIdentifier:(id)a3;
- (void)didReceiveRAPNotification;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
- (void)searchForIdentifier:(id)a3 allowExpired:(BOOL)a4 traits:(id)a5 completionHandler:(id)a6;
- (void)searchForIdentifier:(id)a3 allowExpired:(BOOL)a4 traits:(id)a5 completionHandler:(id)a6 callbackQueue:(id)a7;
- (void)searchForIdentifier:(id)a3 allowExpired:(BOOL)a4 traits:(id)a5 completionHandler:(id)a6 searchResultType:(unsigned int)a7 callbackQueue:(id)a8;
- (void)setCanShowActivityIndicator:(BOOL)a3 forIdentifier:(id)a4;
@end

@implementation POISearchManager

- (POISearchManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)POISearchManager;
  v2 = [(POISearchManager *)&v7 init];
  if (v2)
  {
    v3 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:5];
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;

    v5 = v2;
  }

  return v2;
}

- (void)_updateActivityIndicatorForIdentifier:(id)a3
{
  id v17 = a3;
  v4 = [(NSMutableDictionary *)self->_canShowActivityIndicatorForBusinessIDs objectForKeyedSubscript:v17];
  unsigned int v5 = [v4 BOOLValue];

  v6 = [(NSMutableDictionary *)self->_loadingForBusinessIDs objectForKeyedSubscript:v17];
  unsigned int v7 = [v6 BOOLValue];

  int v8 = v5 & v7;
  uint64_t v9 = [(NSMutableDictionary *)self->_loadingTokensForBusinessIDs objectForKeyedSubscript:v17];
  if (v8 == 1 && v9 == 0)
  {
    v13 = +[LoadingIndicatorController sharedController];
    v11 = [v13 beginShowingLoadingIndicator];

    loadingTokensForBusinessIDs = self->_loadingTokensForBusinessIDs;
    if (!loadingTokensForBusinessIDs)
    {
      v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v16 = self->_loadingTokensForBusinessIDs;
      self->_loadingTokensForBusinessIDs = v15;

      loadingTokensForBusinessIDs = self->_loadingTokensForBusinessIDs;
    }
    [(NSMutableDictionary *)loadingTokensForBusinessIDs setObject:v11 forKeyedSubscript:v17];
  }
  else
  {
    v11 = (void *)v9;
    if (v9) {
      char v12 = v8;
    }
    else {
      char v12 = 1;
    }
    if ((v12 & 1) == 0) {
      [(NSMutableDictionary *)self->_loadingTokensForBusinessIDs removeObjectForKey:v17];
    }
  }
}

- (void)setCanShowActivityIndicator:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = sub_1007AD8C0(a4);
  canShowActivityIndicatorForBusinessIDs = self->_canShowActivityIndicatorForBusinessIDs;
  id v11 = (id)v6;
  if (v4)
  {
    if (!canShowActivityIndicatorForBusinessIDs)
    {
      int v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v9 = self->_canShowActivityIndicatorForBusinessIDs;
      self->_canShowActivityIndicatorForBusinessIDs = v8;
    }
    v10 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)self->_canShowActivityIndicatorForBusinessIDs setObject:v10 forKeyedSubscript:v11];
  }
  else
  {
    [(NSMutableDictionary *)canShowActivityIndicatorForBusinessIDs removeObjectForKey:v6];
  }
  [(POISearchManager *)self _updateActivityIndicatorForIdentifier:v11];
}

- (void)_setLoading:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  loadingForBusinessIDs = self->_loadingForBusinessIDs;
  id v11 = v6;
  if (v4)
  {
    if (!loadingForBusinessIDs)
    {
      int v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v9 = self->_loadingForBusinessIDs;
      self->_loadingForBusinessIDs = v8;
    }
    v10 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)self->_loadingForBusinessIDs setObject:v10 forKeyedSubscript:v11];
  }
  else
  {
    [(NSMutableDictionary *)loadingForBusinessIDs removeObjectForKey:v6];
  }
  [(POISearchManager *)self _updateActivityIndicatorForIdentifier:v11];
}

- (id)searchResultForIdentifier:(id)a3
{
  BOOL v4 = sub_1007AD8C0(a3);
  unsigned int v5 = [(NSCache *)self->_poiCache objectForKey:v4];

  return v5;
}

- (void)_cacheAndHandleSearchResult:(id)a3 identifier:(id)a4 completionHandlers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  poiCache = self->_poiCache;
  if (!poiCache)
  {
    char v12 = (NSCache *)objc_alloc_init((Class)NSCache);
    v13 = self->_poiCache;
    self->_poiCache = v12;

    v14 = +[GEOResourceManifestManager modernManager];
    [v14 addTileGroupObserver:self queue:&_dispatch_main_q];

    poiCache = self->_poiCache;
  }
  [(NSCache *)poiCache setObject:v8 forKey:v9];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v10;
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * (void)v19) + 16))(*(void *)(*((void *)&v20 + 1) + 8 * (void)v19));
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }

  -[NSMapTable removeObjectForKey:](self->_completionHandlers, "removeObjectForKey:", v9, (void)v20);
  [(POISearchManager *)self setCanShowActivityIndicator:0 forIdentifier:v9];
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
}

- (void)searchForIdentifier:(id)a3 allowExpired:(BOOL)a4 traits:(id)a5 completionHandler:(id)a6 searchResultType:(unsigned int)a7 callbackQueue:(id)a8
{
  BOOL v11 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = sub_1007AD8C0(a3);
  uint64_t v18 = [(NSMapTable *)self->_completionHandlers objectForKey:v17];
  id v19 = (id)v18;
  if (!v18)
  {
    id v19 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    [(NSMapTable *)self->_completionHandlers setObject:v19 forKey:v17];
  }
  if (v15)
  {
    id v20 = [v15 copy];
    [v19 addObject:v20];
  }
  if (!v18)
  {
    [v14 setSource:2];
    long long v21 = +[MKMapService sharedService];
    long long v22 = v21;
    if (v11)
    {
      v32 = v17;
      long long v23 = +[NSArray arrayWithObjects:&v32 count:1];
      v24 = [v22 ticketForIdentifiers:v23 resultProviderID:0 contentProvider:0 traits:v14];
    }
    else
    {
      v24 = [v21 ticketForNonExpiredIdentifier:v17 resultProviderID:0 contentProvider:0 traits:v14];
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1007ADF04;
    v27[3] = &unk_1012F8990;
    id v28 = v19;
    id v29 = v17;
    v30 = self;
    unsigned int v31 = a7;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1007AE09C;
    v25[3] = &unk_1012E6160;
    v25[4] = self;
    id v26 = v29;
    [v24 submitWithHandler:v27 queue:v16 networkActivity:v25];
  }
}

- (void)searchForIdentifier:(id)a3 allowExpired:(BOOL)a4 traits:(id)a5 completionHandler:(id)a6
{
}

- (void)searchForIdentifier:(id)a3 allowExpired:(BOOL)a4 traits:(id)a5 completionHandler:(id)a6 callbackQueue:(id)a7
{
}

- (void)didReceiveRAPNotification
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingTokensForBusinessIDs, 0);
  objc_storeStrong((id *)&self->_loadingForBusinessIDs, 0);
  objc_storeStrong((id *)&self->_canShowActivityIndicatorForBusinessIDs, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);

  objc_storeStrong((id *)&self->_poiCache, 0);
}

@end