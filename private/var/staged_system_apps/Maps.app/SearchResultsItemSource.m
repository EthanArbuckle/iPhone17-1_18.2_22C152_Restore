@interface SearchResultsItemSource
- (BOOL)shouldHideSearchResults;
- (NSArray)searchResults;
- (SearchResultsItemSource)init;
- (id)allItems;
- (id)description;
- (id)keysForSearchResult:(id)a3;
- (int64_t)preferredDisplayedSearchResultType;
- (unint64_t)mode;
- (void)_updateSearchResults:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setMode:(unint64_t)a3;
- (void)setPreferredDisplayedSearchResultType:(int64_t)a3;
- (void)setSearchResults:(id)a3;
- (void)setShouldHideSearchResults:(BOOL)a3;
@end

@implementation SearchResultsItemSource

- (void)setPreferredDisplayedSearchResultType:(int64_t)a3
{
  if (self->_preferredDisplayedSearchResultType != a3)
  {
    self->_preferredDisplayedSearchResultType = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = [(SearchResultsItemSource *)self allItems];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) setPreferredDisplayedSearchResultType:a3];
        }
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(PersonalizedItemSource *)self _notifyObserversItemsDidChange];
  }
}

- (id)description
{
  if (self->_shouldHideSearchResults) {
    CFStringRef v2 = @"TRUE";
  }
  else {
    CFStringRef v2 = @"FALSE";
  }
  return +[NSString stringWithFormat:@"SearchResultsItemSource: _shouldHideSearchResults: %@, SearchResults count: %lu, itemCount: %lu", v2, [(NSArray *)self->_searchResults count], [(NSArray *)self->_allItems count]];
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (SearchResultsItemSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)SearchResultsItemSource;
  CFStringRef v2 = [(SearchResultsItemSource *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("SearchResultsItemSource.lock", v3);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)allItems
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100104370;
  long long v10 = sub_100104A28;
  id v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100059100;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_searchResults;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      objc_super v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) removeObserver:self forKeyPath:@"reverseGeocoded"];
        objc_super v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SearchResultsItemSource;
  [(SearchResultsItemSource *)&v8 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1015F42A0 == a6)
  {
    id v13 = a4;
    id v11 = a4;
    id v10 = +[NSArray arrayWithObjects:&v13 count:1];

    [(SearchResultsItemSource *)self _updateSearchResults:v10];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SearchResultsItemSource;
    id v10 = a4;
    [(SearchResultsItemSource *)&v12 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (void)setSearchResults:(id)a3
{
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = self->_searchResults;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * (void)v9) removeObserver:self forKeyPath:@"reverseGeocoded"];
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  id v10 = (NSArray *)[v4 copy];
  searchResults = self->_searchResults;
  self->_searchResults = v10;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  objc_super v12 = self->_searchResults;
  id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v16) addObserver:self forKeyPath:@"reverseGeocoded" options:0 context:off_1015F42A0];
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  v17 = +[NSMapTable strongToStrongObjectsMapTable];
  allSearchResults = self->_allSearchResults;
  self->_allSearchResults = v17;

  lockQueue = self->_lockQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B0ED80;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_sync(lockQueue, block);
  [(SearchResultsItemSource *)self _updateSearchResults:self->_searchResults];
}

- (void)_updateSearchResults:(id)a3
{
  id v4 = a3;
  if (self->_mode > 1) {
    id v5 = 0;
  }
  else {
    id v5 = (objc_class *)objc_opt_class();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v10);
        id v12 = [[v5 alloc] initWithSearchResult:v11];
        id v13 = v12;
        if (v12)
        {
          [v12 setSource:self];
          [(NSMapTable *)self->_allSearchResults setObject:v13 forKey:v11];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v8);
  }
  long long v25 = v6;

  id v14 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_searchResults count]];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v15 = self->_searchResults;
  id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v29;
    do
    {
      v20 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v15);
        }
        long long v21 = [(NSMapTable *)self->_allSearchResults objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * (void)v20)];
        long long v22 = v21;
        if (v21)
        {
          [v21 setSortOrder:(char *)v20 + v18 + 1];
          [v22 setShouldBeHiddenFromMap:self->_shouldHideSearchResults];
          [v22 setPreferredDisplayedSearchResultType:self->_preferredDisplayedSearchResultType];
          [v14 addObject:v22];
        }

        v20 = (char *)v20 + 1;
      }
      while (v17 != v20);
      id v17 = [(NSArray *)v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
      v18 += (uint64_t)v20;
    }
    while (v17);
  }

  lockQueue = self->_lockQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B0F0BC;
  block[3] = &unk_1012E5D58;
  block[4] = self;
  id v27 = v14;
  id v24 = v14;
  dispatch_sync(lockQueue, block);
  [(PersonalizedItemSource *)self _notifyObserversItemsDidChange];
}

- (id)keysForSearchResult:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[NSMutableSet set];
    id v5 = [v3 personalizedItemKey];
    [v4 addObject:v5];

    if ([v3 type] == 3)
    {
      id v6 = [DroppedPinMapItemKey alloc];
      [v3 coordinate];
      id v7 = -[DroppedPinMapItemKey initWithCoordinate:](v6, "initWithCoordinate:");
      [v4 addObject:v7];
    }
  }
  else
  {
    id v4 = +[NSSet set];
  }

  return v4;
}

- (void)setShouldHideSearchResults:(BOOL)a3
{
  if (self->_shouldHideSearchResults == a3) {
    return;
  }
  BOOL v3 = a3;
  id v5 = sub_1000F03EC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = self;
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [(SearchResultsItemSource *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        uint64_t v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    uint64_t v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    id v12 = @"NO";
    if (v3) {
      id v12 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    long long v25 = v11;
    __int16 v26 = 2112;
    id v27 = v12;
    id v13 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set shouldHideSearchResults: %@", buf, 0x16u);
  }
  self->_shouldHideSearchResults = v3;
  id v14 = [(SearchResultsItemSource *)self allItems];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v18) setShouldBeHiddenFromMap:v3];
        uint64_t v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
  [(PersonalizedItemSource *)self _notifyObserversItemsDidChange];
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)shouldHideSearchResults
{
  return self->_shouldHideSearchResults;
}

- (int64_t)preferredDisplayedSearchResultType
{
  return self->_preferredDisplayedSearchResultType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_allSearchResults, 0);

  objc_storeStrong((id *)&self->_allItems, 0);
}

@end