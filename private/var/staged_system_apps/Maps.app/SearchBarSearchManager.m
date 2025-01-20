@interface SearchBarSearchManager
- (NSString)query;
- (SearchBarSearchManager)initWithDelegate:(id)a3;
- (SearchBarSearchManagerDelegate)delegate;
- (_TtC4Maps19SearchFindMySession)findMySession;
- (int64_t)_integerValueForDefaultsKey:(id)a3 networkDefaultsKey:(id)a4;
- (void)_searchUsingSearchRequest:(id)a3 backfill:(int64_t)a4;
- (void)cancelCurrentSearch;
- (void)dealloc;
- (void)historyOperation:(id)a3 didFindMatches:(id)a4;
- (void)searchAddressBookOperation:(id)a3 didMatchResults:(id)a4;
- (void)searchFindMyFriendOperation:(id)a3 didMatchResults:(id)a4;
- (void)searchName:(id)a3 forSearchMode:(unsigned int)a4 backfill:(int64_t)a5 context:(id)a6 originationType:(int)a7;
- (void)searchRecentsOperation:(id)a3 didMatchResults:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFindMySession:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation SearchBarSearchManager

- (SearchBarSearchManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchBarSearchManager;
  v5 = [(SearchBarSearchManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    [(SearchBarSearchManager *)v5 setDelegate:v4];
    v7 = objc_alloc_init(SearchBarSearchResults);
    searchResults = v6->_searchResults;
    v6->_searchResults = v7;

    v9 = objc_alloc_init(_TtC4Maps19SearchFindMySession);
    findMySession = v6->_findMySession;
    v6->_findMySession = v9;
  }
  return v6;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_searchQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)SearchBarSearchManager;
  [(SearchBarSearchManager *)&v3 dealloc];
}

- (void)historyOperation:(id)a3 didFindMatches:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7 && [v7 count])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10049C95C;
    block[3] = &unk_1012E66E0;
    block[4] = self;
    id v10 = v8;
    id v11 = v6;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)searchRecentsOperation:(id)a3 didMatchResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7 && [v7 count])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10049CB34;
    block[3] = &unk_1012E66E0;
    block[4] = self;
    id v10 = v8;
    id v11 = v6;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)searchAddressBookOperation:(id)a3 didMatchResults:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10049CD00;
  block[3] = &unk_1012E66E0;
  id v10 = a4;
  id v11 = self;
  id v12 = v6;
  id v7 = v6;
  id v8 = v10;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)searchFindMyFriendOperation:(id)a3 didMatchResults:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10049CF04;
  block[3] = &unk_1012E66E0;
  id v10 = a4;
  id v11 = self;
  id v12 = v6;
  id v7 = v6;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)searchName:(id)a3 forSearchMode:(unsigned int)a4 backfill:(int64_t)a5 context:(id)a6 originationType:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a4;
  id v12 = a6;
  id v13 = a3;
  v14 = objc_alloc_init(SearchBarSearchManagerRequest);
  [(SearchBarSearchManagerRequest *)v14 setSearchName:v13];

  [(SearchBarSearchManagerRequest *)v14 setSearchMode:v9];
  [(SearchBarSearchManagerRequest *)v14 setContext:v12];

  [(SearchBarSearchManagerRequest *)v14 setOriginationType:v7];
  [(SearchBarSearchManager *)self _searchUsingSearchRequest:v14 backfill:a5];
}

- (void)cancelCurrentSearch
{
}

- (int64_t)_integerValueForDefaultsKey:(id)a3 networkDefaultsKey:(id)a4
{
  id v4 = a3;
  v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    uint64_t v7 = +[NSUserDefaults standardUserDefaults];
    id Integer = [v7 integerForKey:v4];
  }
  else
  {
    id Integer = (id)GEOConfigGetInteger();
  }

  return (int64_t)Integer;
}

- (void)_searchUsingSearchRequest:(id)a3 backfill:(int64_t)a4
{
  id v59 = a3;
  id v4 = sub_100109E50();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [v59 searchName];
    *(_DWORD *)buf = 138412290;
    v70 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SearchBarSearchManager - collecting results for query: %@", buf, 0xCu);
  }
  id v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  searchQueue = self->_searchQueue;
  self->_searchQueue = v6;

  [(NSOperationQueue *)self->_searchQueue setName:@"com.apple.Maps.SearchBarSearchManager"];
  [(NSOperationQueue *)self->_searchQueue setMaxConcurrentOperationCount:1];
  [(NSOperationQueue *)self->_searchQueue setQualityOfService:25];
  self->os_signpost_id_t signpostID = 0xEEEEB0B5B2B2EEEELL;
  id v8 = objc_alloc_init(SearchBarSearchResults);
  searchResults = self->_searchResults;
  self->_searchResults = v8;

  id v10 = [v59 searchName];
  [(SearchBarSearchManager *)self setQuery:v10];

  v58 = [v59 context];
  int64_t v11 = [(SearchBarSearchManager *)self _integerValueForDefaultsKey:@"HistorySearchOrderKey", MapsConfig_HistorySearchOrder, off_1015EF268 networkDefaultsKey];
  int64_t v12 = [(SearchBarSearchManager *)self _integerValueForDefaultsKey:@"RecentsSeachOrderKey", MapsConfig_RecentsSearchOrder, off_1015EF248 networkDefaultsKey];
  int64_t v60 = [(SearchBarSearchManager *)self _integerValueForDefaultsKey:@"AddressBookSearchOrderKey", MapsConfig_AddressBookSearchOrder, off_1015EF228 networkDefaultsKey];
  int64_t v13 = [(SearchBarSearchManager *)self _integerValueForDefaultsKey:@"AutocompleteSearchFindMyKey", MapsConfig_SearchACPeopleSuggestionOrder, off_1015F0D68 networkDefaultsKey];
  v14 = +[NSMutableDictionary dictionary];
  v15 = +[Recents sharedRecents];
  v16 = [v15 recents];
  id v17 = [v16 copy];

  v18 = [SearchHistoryOperation alloc];
  v19 = [v59 searchName];
  v20 = -[SearchHistoryOperation initWithSearchQuery:searchMode:history:context:](v18, "initWithSearchQuery:searchMode:history:context:", v19, [v59 searchMode], v17, v58);

  v21 = [v59 searchName];
  v22 = +[NSString stringWithFormat:@"%@-%@", @"HistoryOperation", v21];
  [(SearchHistoryOperation *)v20 setName:v22];

  [(SearchHistoryOperation *)v20 setDelegate:self];
  v23 = +[NSNumber numberWithInteger:v11];
  [v14 setObject:v20 forKeyedSubscript:v23];

  if (+[MapsSuggestionsSiri isEnabled])
  {
    v24 = [[SearchRecentsOperation alloc] initWithSearchQuery:self->_query context:v58];
    [(SearchRecentsOperation *)v24 setDelegate:self];
    v25 = [v59 searchName];
    v26 = +[NSString stringWithFormat:@"%@-%@", @"RecentsOperation", v25];
    [(SearchRecentsOperation *)v24 setName:v26];

    v27 = +[NSNumber numberWithInteger:v12];
    [v14 setObject:v24 forKeyedSubscript:v27];
  }
  if ((MapsFeature_IsEnabled_MapsWally() & 1) == 0)
  {
    v28 = [[SearchAddressBookOperation alloc] initWithSearchQuery:self->_query context:v58];
    [(SearchAddressBookOperation *)v28 setDelegate:self];
    v29 = [v59 searchName];
    v30 = +[NSString stringWithFormat:@"%@-%@", @"AddressBookOperation", v29];
    [(SearchAddressBookOperation *)v28 setName:v30];

    v31 = +[NSNumber numberWithInteger:v60];
    [v14 setObject:v28 forKeyedSubscript:v31];
  }
  if (MapsFeature_IsEnabled_MapsWally())
  {
    if ([v59 searchMode] == 3)
    {
      v32 = [[SearchAddressBookOperation alloc] initWithSearchQuery:self->_query context:v58];
      [(SearchAddressBookOperation *)v32 setDelegate:self];
      v33 = [v59 searchName];
      v34 = +[NSString stringWithFormat:@"%@-%@", @"CarPlay-AddressBookOperation", v33];
      [(SearchAddressBookOperation *)v32 setName:v34];

      +[NSNumber numberWithInteger:v60];
    }
    else
    {
      v36 = +[MapsOfflineUIHelper sharedHelper];
      id v37 = [v36 isUsingOfflineMaps];

      v32 = -[SearchFindMyFriendOperation initWithSearchQuery:context:isOffline:singularResults:searchFindMySession:]([_TtC4Maps27SearchFindMyFriendOperation alloc], "initWithSearchQuery:context:isOffline:singularResults:searchFindMySession:", self->_query, v58, v37, [v59 originationType] - 1 < 2, self->_findMySession);
      [(SearchAddressBookOperation *)v32 setDelegate:self];
      v38 = [v59 searchName];
      v39 = +[NSString stringWithFormat:@"%@-%@", @"SearchFMOperation", v38];
      [(SearchAddressBookOperation *)v32 setName:v39];

      +[NSNumber numberWithInteger:v13];
    v35 = };
    [v14 setObject:v32 forKeyedSubscript:v35];
  }
  v40 = sub_10049DAB4();
  v41 = v40;
  os_signpost_id_t signpostID = self->signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "CollectingClientResults", "", buf, 2u);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v43 = [v14 allKeys];
  v44 = [v43 sortedArrayUsingSelector:"compare:"];

  id v45 = [v44 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v66;
    do
    {
      for (i = 0; i != v45; i = (char *)i + 1)
      {
        if (*(void *)v66 != v46) {
          objc_enumerationMutation(v44);
        }
        v48 = [v14 objectForKeyedSubscript:*(void *)(*((void *)&v65 + 1) + 8 * i)];
        v49 = sub_100109E50();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = [v48 name];
          *(_DWORD *)buf = 138412290;
          v70 = v50;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "SearchBarSearchManager - Adding operation: %@", buf, 0xCu);
        }
        [(NSOperationQueue *)self->_searchQueue addOperation:v48];
      }
      id v45 = [v44 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v45);
  }

  v51 = sub_100109E50();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    v52 = self->_searchQueue;
    v53 = [(NSOperationQueue *)v52 operations];
    query = self->_query;
    *(_DWORD *)buf = 138412802;
    v70 = v52;
    __int16 v71 = 2112;
    v72 = v53;
    __int16 v73 = 2112;
    v74 = query;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "SearchBarSearchManager - searchQueue:%@ \n operations: %@ \n searchQuery: %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v55 = self->_searchQueue;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10049DB08;
  v62[3] = &unk_1012E7C40;
  objc_copyWeak(v64, (id *)buf);
  v64[1] = (id)a4;
  v62[4] = self;
  id v56 = v58;
  id v63 = v56;
  [(NSOperationQueue *)v55 addOperationWithBlock:v62];

  objc_destroyWeak(v64);
  objc_destroyWeak((id *)buf);
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (SearchBarSearchManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SearchBarSearchManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC4Maps19SearchFindMySession)findMySession
{
  return self->_findMySession;
}

- (void)setFindMySession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findMySession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_searchQueue, 0);
}

@end