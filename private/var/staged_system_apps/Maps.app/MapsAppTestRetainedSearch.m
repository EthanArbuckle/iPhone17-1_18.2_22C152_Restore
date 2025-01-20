@interface MapsAppTestRetainedSearch
- (BOOL)runTest;
- (void)didPresentPlaceCard:(id)a3;
- (void)returnToRetainedAutoComplete;
- (void)returnToSearchResults;
- (void)searchAutoCompleteTestReceiveResponse:(id)a3;
- (void)searchSessionDidChangeSearchResults:(id)a3;
- (void)startAutoCompleteOrSearchTest;
- (void)startAutoCompleteTest;
- (void)startSearchTest;
@end

@implementation MapsAppTestRetainedSearch

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self options];
  v4 = [v3 objectForKeyedSubscript:@"searchQuery"];
  query = self->_query;
  self->_query = v4;

  v6 = [v3 objectForKeyedSubscript:@"autocompleteResultIndex"];
  if ([v6 length]) {
    int64_t v7 = (int64_t)[v6 integerValue];
  }
  else {
    int64_t v7 = -1;
  }

  self->_autocompleteResultIndex = v7;
  v8 = [v3 objectForKeyedSubscript:@"searchResultIndex"];
  if ([v8 length]) {
    int64_t v9 = (int64_t)[v8 integerValue];
  }
  else {
    int64_t v9 = -1;
  }

  self->_int64_t searchResultIndex = v9;
  if (![(NSString *)self->_query length]) {
    goto LABEL_10;
  }
  int64_t searchResultIndex = self->_searchResultIndex;
  if (self->_autocompleteResultIndex == -1)
  {
    if (searchResultIndex == -1) {
      goto LABEL_10;
    }
LABEL_12:
    v12 = +[NSNotificationCenter defaultCenter];
    v13 = [(MapsAppTest *)self testCoordinator];
    [v13 pptTestResetForLaunchURL];

    id v14 = [v3 _mapstest_mapType];
    v15 = [v3 _mapstest_mapRegion];
    [(MapsAppTest *)self switchToMapType:v14];
    v16 = [(MapsAppTest *)self mainVKMapView];
    [v16 setMapRegion:v15 pitch:0.0 yaw:0.0];

    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1005A4C90;
    v19[3] = &unk_1012E6690;
    objc_copyWeak(&v21, &location);
    id v17 = v12;
    id v20 = v17;
    [(MapsAppTest *)self addFullyDrawnCallback:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

    BOOL v11 = 1;
    goto LABEL_13;
  }
  if (searchResultIndex == -1) {
    goto LABEL_12;
  }
LABEL_10:
  BOOL v11 = 0;
LABEL_13:

  return v11;
}

- (void)startAutoCompleteOrSearchTest
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIKeyboardDidShowNotification object:0];

  if (self->_autocompleteResultIndex == -1)
  {
    [(MapsAppTestRetainedSearch *)self startSearchTest];
  }
  else
  {
    [(MapsAppTestRetainedSearch *)self startAutoCompleteTest];
  }
}

- (void)startAutoCompleteTest
{
  v5 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v5 setSearchString:self->_query];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"searchAutoCompleteTestReceiveResponse:" name:@"SearchDataProviderDidChangeDataNotification" object:0];

  v4 = [(MapsAppTest *)self testCoordinator];
  [v4 pptTestAutocompleteSearchForFieldItem:v5];
}

- (void)searchAutoCompleteTestReceiveResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"SearchDataProviderQueryKey"];

  int64_t v7 = [v4 userInfo];
  v8 = [v7 objectForKeyedSubscript:@"SearchDataProviderQueryResultGroupsKey"];

  v37 = self;
  if ([v6 isEqualToString:self->_query])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v9 = v8;
    id v36 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v36)
    {
      v31 = v8;
      v32 = v6;
      id v33 = v4;
      id obj = v9;
      v10 = 0;
      id v11 = 0;
      uint64_t v35 = *(void *)v39;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v39 != v35) {
            objc_enumerationMutation(obj);
          }
          if (!v11)
          {
            uint64_t v13 = 0;
            unint64_t v14 = 0;
            v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            while (1)
            {
              v16 = [v15 items];
              id v17 = [v16 count];

              if (v14 >= (unint64_t)v17) {
                break;
              }
              v18 = [v15 items];
              v19 = [v18 objectAtIndexedSubscript:v14];
              id v20 = [v19 autocompleteObject];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                v22 = [v15 items];
                v23 = [v22 objectAtIndexedSubscript:v14];
                v24 = [v23 autocompleteObject];

                v25 = [v24 mapItem];
                v26 = v25;
                id v11 = 0;
                if (v25)
                {
                  int64_t autocompleteResultIndex = v37->_autocompleteResultIndex;
                  if ((autocompleteResultIndex & 0x8000000000000000) == 0 && v13 == autocompleteResultIndex) {
                    id v11 = v25;
                  }
                  ++v13;
                }

                v10 = v24;
              }
              else
              {
                id v11 = 0;
              }
              ++v14;
              if (v11) {
                goto LABEL_21;
              }
            }
            id v11 = 0;
          }
LABEL_21:
          ;
        }
        id v36 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v36);

      if (!v11)
      {
        v6 = v32;
        id v4 = v33;
        v8 = v31;
        goto LABEL_28;
      }
      v28 = [(MapsAppTest *)v37 testCoordinator];
      [v28 pptTestSearchRetainQueryForSelectedSearchCompletion:v10];

      v29 = +[NSNotificationCenter defaultCenter];
      [v29 removeObserver:v37 name:@"SearchDataProviderDidChangeDataNotification" object:0];

      v30 = +[NSNotificationCenter defaultCenter];
      [v30 addObserver:v37 selector:"didPresentPlaceCard:" name:MKPlaceViewControllerDidShowNotification object:0];

      id v9 = [(MapsAppTest *)v37 testCoordinator];
      [v9 pptTestPresentPlacecardWithMapItem:v11];
      v6 = v32;
      id v4 = v33;
      v8 = v31;
    }
    else
    {
      id v11 = 0;
      v10 = 0;
    }

LABEL_28:
  }
}

- (void)startSearchTest
{
  v5 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v5 setSearchString:self->_query];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"searchSessionDidChangeSearchResults:" name:@"SearchSessionDidChangeSearchResultsNotification" object:0];

  id v4 = [(MapsAppTest *)self testCoordinator];
  [v4 pptTestSearchForFieldItem:v5];
}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  id v4 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"SearchSessionDidChangeSearchResultsNotification" object:0];

  id v16 = [v4 object];

  v6 = v16;
  if (v16)
  {
    unint64_t searchResultIndex = self->_searchResultIndex;
    if ((searchResultIndex & 0x8000000000000000) == 0)
    {
      v8 = [v16 searchInfo];
      id v9 = [v8 results];
      id v10 = [v9 count];

      v6 = v16;
      if (searchResultIndex < (unint64_t)v10)
      {
        id v11 = [v16 searchInfo];
        v12 = [v11 results];
        uint64_t v13 = [v12 objectAtIndexedSubscript:self->_searchResultIndex];

        unint64_t v14 = +[NSNotificationCenter defaultCenter];
        [v14 addObserver:self selector:"didPresentPlaceCard:" name:MKPlaceViewControllerDidShowNotification object:0];

        v15 = [(MapsAppTest *)self testCoordinator];
        [v15 pptTestPresentPlaceCardForSearchResult:v13 animated:1];

        v6 = v16;
      }
    }
  }
}

- (void)didPresentPlaceCard:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:MKPlaceViewControllerDidShowNotification object:0];

  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005A5598;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)returnToRetainedAutoComplete
{
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1005A5794;
  v10[3] = &unk_1012EF008;
  v10[4] = self;
  id v4 = v3;
  id v11 = v4;
  +[PPTNotificationCenter addOnceObserverForName:@"SearchDataProviderDidChangeDataNotification" object:0 usingBlock:v10];
  dispatch_group_enter(v4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005A57D8;
  v8[3] = &unk_1012E6668;
  id v9 = v4;
  dispatch_time_t v5 = v4;
  +[PPTNotificationCenter addOnceObserverForName:@"PPTTestTrayDidDismissNotification" object:0 usingBlock:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1005A57E0;
  v7[3] = &unk_1012E5D08;
  v7[4] = self;
  dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
  [(MapsAppTest *)self startedSubTest:@"returnToAutoComplete - suggestions received"];
  [(MapsAppTest *)self startedSubTest:@"returnToAutoComplete"];
  v6 = [(MapsAppTest *)self testCoordinator];
  [v6 pptTestDismissTrayAnimated:1 assertTrayType:1];
}

- (void)returnToSearchResults
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1005A58E0;
  v4[3] = &unk_1012E6668;
  v4[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"PPTTestTrayDidDismissNotification" object:0 usingBlock:v4];
  [(MapsAppTest *)self startedSubTest:@"returnToSearchResults"];
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestDismissTrayAnimated:1 assertTrayType:1];
}

- (void).cxx_destruct
{
}

@end