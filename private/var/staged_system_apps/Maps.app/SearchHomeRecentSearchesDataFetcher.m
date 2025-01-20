@interface SearchHomeRecentSearchesDataFetcher
- (BOOL)isFetchingDataComplete;
- (NSArray)dataProviders;
- (NSArray)recentSearches;
- (SearchHomeDataFetcherDelegate)delegate;
- (SearchHomeRecentSearchesDataFetcher)initWithDelegate:(id)a3 isSearchAlongRoute:(BOOL)a4;
- (void)fetchContent;
- (void)recentsUpdated:(id)a3;
- (void)setDataProviders:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRecentSearches:(id)a3;
- (void)updateContent;
@end

@implementation SearchHomeRecentSearchesDataFetcher

- (SearchHomeRecentSearchesDataFetcher)initWithDelegate:(id)a3 isSearchAlongRoute:(BOOL)a4
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchHomeRecentSearchesDataFetcher;
  v6 = [(SearchHomeRecentSearchesDataFetcher *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, v5);
    v7->_isFetchingDataComplete = 0;
    v8 = +[Recents sharedRecents];
    [v8 addObserver:v7];

    [(SearchHomeRecentSearchesDataFetcher *)v7 updateContent];
  }

  return v7;
}

- (void)fetchContent
{
  id v3 = [(SearchHomeRecentSearchesDataFetcher *)self delegate];
  [v3 didUpdateDataFetcher:self];
}

- (void)updateContent
{
  v2 = sub_100532358();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = sub_100532358();
  id v5 = v4;
  os_signpost_id_t spid = v3;
  unint64_t v41 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "UpdateContent", "", (uint8_t *)buf, 2u);
  }

  v6 = +[Recents sharedRecents];
  v7 = [v6 recents];
  v8 = [v7 reverseObjectEnumerator];
  v9 = [v8 allObjects];

  id v49 = objc_alloc_init((Class)NSMutableArray);
  id v48 = objc_alloc_init((Class)NSMutableDictionary);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v67;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v67 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        objc_initWeak(buf, v13);
        v14 = [v13 historyEntry];
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_1005323AC;
        v62[3] = &unk_1012EDEB0;
        id v15 = v49;
        id v63 = v15;
        objc_copyWeak(&v64, buf);
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_100532400;
        v58[3] = &unk_1012EDED8;
        id v59 = v48;
        objc_copyWeak(&v61, buf);
        id v60 = v15;
        [v14 ifSearch:v62 ifRoute:0 ifPlaceDisplay:v58 ifTransitLineItem:0];

        objc_destroyWeak(&v61);
        objc_destroyWeak(&v64);

        objc_destroyWeak(buf);
      }
      id v10 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v10);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v43 = [v48 allKeys];
  id v45 = [v43 countByEnumeratingWithState:&v54 objects:v72 count:16];
  if (v45)
  {
    uint64_t v44 = *(void *)v55;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v55 != v44)
        {
          uint64_t v17 = v16;
          objc_enumerationMutation(v43);
          uint64_t v16 = v17;
        }
        uint64_t v46 = v16;
        uint64_t v18 = *(void *)(*((void *)&v54 + 1) + 8 * v16);
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v19 = v49;
        id v20 = [v19 countByEnumeratingWithState:&v50 objects:v71 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v51;
          uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            for (j = 0; j != v20; j = (char *)j + 1)
            {
              if (*(void *)v51 != v21) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
              v25 = [v24 historyEntry:spid];
              v26 = [v25 storageIdentifier];
              unsigned int v27 = [v26 isEqual:v18];

              if (v27) {
                uint64_t v22 = (uint64_t)[v19 indexOfObject:v24];
              }
            }
            id v20 = [v19 countByEnumeratingWithState:&v50 objects:v71 count:16];
          }
          while (v20);

          if (v22 != 0x7FFFFFFFFFFFFFFFLL) {
            [v19 removeObjectAtIndex:v22];
          }
        }
        else
        {
        }
        uint64_t v16 = v46 + 1;
      }
      while ((id)(v46 + 1) != v45);
      id v45 = [v43 countByEnumeratingWithState:&v54 objects:v72 count:16];
    }
    while (v45);
  }

  self->_isFetchingDataComplete = 1;
  v28 = [(SearchHomeRecentSearchesDataFetcher *)self recentSearches];
  unsigned __int8 v29 = [v49 isEqualToArray:v28];

  if ((v29 & 1) == 0)
  {
    [(SearchHomeRecentSearchesDataFetcher *)self setRecentSearches:v49];
    v30 = +[NSBundle mainBundle];
    v31 = [v30 localizedStringForKey:@"[Search Home] Recents" value:@"localized string not found" table:0];

    v32 = [SearchHomeRecentSearchesDataProvider alloc];
    v33 = [(SearchHomeRecentSearchesDataFetcher *)self recentSearches];
    v34 = [(SearchHomeRecentSearchesDataProvider *)v32 initWithObjects:v33 type:1 identifier:@"SearchHomeRecents" title:v31];

    v70 = v34;
    v35 = +[NSArray arrayWithObjects:&v70 count:1];
    dataProviders = self->_dataProviders;
    self->_dataProviders = v35;

    v37 = [(SearchHomeRecentSearchesDataFetcher *)self delegate];
    [v37 didUpdateDataFetcher:self];
  }
  v38 = sub_100532358();
  v39 = v38;
  if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, spid, "UpdateContent", "", (uint8_t *)buf, 2u);
  }
}

- (void)recentsUpdated:(id)a3
{
  self->_isFetchingDataComplete = 0;
  [(SearchHomeRecentSearchesDataFetcher *)self updateContent];
}

- (SearchHomeDataFetcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SearchHomeDataFetcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)dataProviders
{
  return self->_dataProviders;
}

- (void)setDataProviders:(id)a3
{
}

- (BOOL)isFetchingDataComplete
{
  return self->_isFetchingDataComplete;
}

- (NSArray)recentSearches
{
  return self->_recentSearches;
}

- (void)setRecentSearches:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentSearches, 0);
  objc_storeStrong((id *)&self->_dataProviders, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end