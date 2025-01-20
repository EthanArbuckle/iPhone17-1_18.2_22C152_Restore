@interface RouteNoQueryDataSource
- (NSPredicate)filterPredicate;
- (RouteNoQueryDataSource)initWithTableView:(id)a3 filterPredicate:(id)a4;
- (UserLocationSearchResult)userLocationSearchResult;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_allDataProviders;
- (id)analyticsContext;
- (id)newTraits;
- (id)objectAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int)targetForDragAnalytics;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addAnalyticsInfo;
- (void)_buildContents;
- (void)_createDataProviders;
- (void)_hoverGestureRecognizerStateDidChange:(id)a3;
- (void)_sendNoTypingACAnalyticsForSelectedAtIndexPath:(id)a3;
- (void)_updateContents;
- (void)setActive:(BOOL)a3;
- (void)setUserLocationSearchResult:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)updateTableViewHeader:(BOOL)a3;
@end

@implementation RouteNoQueryDataSource

- (RouteNoQueryDataSource)initWithTableView:(id)a3 filterPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)RouteNoQueryDataSource;
  v8 = [(DataSource *)&v26 initWithTableView:v6 updateLocation:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_filterPredicate, a4);
    v10 = [[RecentsDataFilter alloc] initWithSearchMode:2 filterPredicate:v7];
    recentsDataFilter = v9->_recentsDataFilter;
    v9->_recentsDataFilter = v10;

    [(RouteNoQueryDataSource *)v9 _createDataProviders];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v12 = [(RouteNoQueryDataSource *)v9 _allDataProviders];
    id v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v16) observers];
          [v17 registerObserver:v9];

          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v14);
    }

    uint64_t v18 = objc_opt_class();
    v19 = +[TwoLinesTableViewCell identifier];
    [v6 registerClass:v18 forCellReuseIdentifier:v19];

    if (sub_1000BBB44(v6) == 5)
    {
      id v20 = [objc_alloc((Class)UIHoverGestureRecognizer) initWithTarget:v9 action:"_hoverGestureRecognizerStateDidChange:"];
      [v6 addGestureRecognizer:v20];
    }
  }

  return v9;
}

- (void)updateTableViewHeader:(BOOL)a3
{
  if (a3)
  {
    v4 = +[NSBundle mainBundle];
    id v14 = [v4 localizedStringForKey:@"[Offline Route Planning] Recents" value:@"localized string not found" table:0];

    v5 = [[SectionHeaderTableViewHeaderFooterView alloc] initWithTitle:v14 isFirstNonEmptySection:1];
    id v6 = [(DataSource *)self tableView];
    [v6 frame];
    double Width = CGRectGetWidth(v16);
    v8 = [(DataSource *)self tableView];
    v9 = [v8 traitCollection];
    +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:1 title:v14 actionTitle:0 availableWidth:v9 traitCollection:Width];
    double v11 = v10;

    v12 = [(DataSource *)self tableView];
    [v12 frame];
    -[SectionHeaderTableViewHeaderFooterView setBounds:](v5, "setBounds:", 0.0, 0.0, CGRectGetWidth(v17), v11);

    [(SectionHeaderTableViewHeaderFooterView *)v5 layoutIfNeeded];
    id v13 = [(DataSource *)self tableView];
    [v13 setTableHeaderView:v5];
  }
  else
  {
    id v14 = [(DataSource *)self tableView];
    [v14 setTableHeaderView:0];
  }
}

- (void)_hoverGestureRecognizerStateDidChange:(id)a3
{
  id v25 = a3;
  v4 = [(DataSource *)self tableView];
  v5 = [v4 dataSource];
  if (v5 == self)
  {
    unsigned int v6 = [v25 _maps_isHovering];

    if (!v6) {
      goto LABEL_9;
    }
    id v7 = [(DataSource *)self tableView];
    [v25 locationInView:v7];
    double v9 = v8;
    double v11 = v10;

    v12 = [(DataSource *)self tableView];
    id v13 = [v12 indexPathForRowAtPoint:v9, v11];

    id v14 = [(DataSource *)self tableView];
    uint64_t v15 = [v14 cellForRowAtIndexPath:v13];

    if (v15 && ([v15 frame], v27.x = v9, v27.y = v11, CGRectContainsPoint(v28, v27)))
    {
      if (v13)
      {
        if ([v13 isEqual:self->_lastSelectedIndexPath])
        {
          CGRect v16 = 0;
LABEL_15:
          v21 = [(DataSource *)self tableView];
          [v21 selectRowAtIndexPath:v13 animated:0 scrollPosition:0];

          objc_storeStrong((id *)&self->_lastSelectedIndexPath, v13);
          if (v15)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              [v15 canBecomeFirstResponder];
            }
          }
          [v15 becomeFirstResponder];
LABEL_19:

          if (!v16) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
        char v19 = 0;
LABEL_14:
        CGRect v16 = self->_lastSelectedIndexPath;
        lastSelectedIndexPath = self->_lastSelectedIndexPath;
        self->_lastSelectedIndexPath = 0;

        if (v19) {
          goto LABEL_19;
        }
        goto LABEL_15;
      }
    }
    else
    {

      id v13 = 0;
    }
    char v19 = 1;
    goto LABEL_14;
  }

LABEL_9:
  if ([v25 state] == (id)3)
  {
    CGRect v17 = self->_lastSelectedIndexPath;
    if (v17)
    {
      CGRect v16 = v17;
      uint64_t v18 = self->_lastSelectedIndexPath;
      self->_lastSelectedIndexPath = 0;

LABEL_20:
      long long v22 = [(DataSource *)self tableView];
      long long v23 = [v22 cellForRowAtIndexPath:v16];

      [v23 resignFirstResponder];
      long long v24 = [(DataSource *)self tableView];
      [v24 deselectRowAtIndexPath:v16 animated:0];
    }
  }
LABEL_21:
}

- (void)_createDataProviders
{
  v3 = objc_alloc_init(MarkedLocationDataProvider);
  markedLocationDataProvider = self->_markedLocationDataProvider;
  self->_markedLocationDataProvider = v3;

  v5 = objc_alloc_init(RecentsDataProvider);
  recentsDataProvider = self->_recentsDataProvider;
  self->_recentsDataProvider = v5;
}

- (id)_allDataProviders
{
  recentsDataProvider = self->_recentsDataProvider;
  v5[0] = self->_markedLocationDataProvider;
  v5[1] = recentsDataProvider;
  v3 = +[NSArray arrayWithObjects:v5 count:2];

  return v3;
}

- (void)_buildContents
{
  if ([(DataSource *)self active])
  {
    double v8 = +[NSMutableArray array];
    if (self->_userLocationSearchResult) {
      -[NSArray addObject:](v8, "addObject:");
    }
    v3 = [(MarkedLocationDataProvider *)self->_markedLocationDataProvider markedLocation];
    if (v3) {
      [(NSArray *)v8 addObject:v3];
    }
    v4 = [(RecentsDataProvider *)self->_recentsDataProvider recents];
    [(NSArray *)v8 addObjectsFromArray:v4];

    v5 = [(RecentsDataFilter *)self->_recentsDataFilter filteredRecents:v8 excludingDuplicatesOfEntries:&__NSArray0__struct];
    contents = self->_contents;
    self->_contents = v5;

    id v7 = v8;
  }
  else
  {
    id v7 = self->_contents;
    self->_contents = (NSArray *)&__NSArray0__struct;
  }
}

- (void)_updateContents
{
  [(RouteNoQueryDataSource *)self _buildContents];
  [(RouteNoQueryDataSource *)self _addAnalyticsInfo];
  id v3 = [(DataSource *)self delegate];
  [v3 dataSourceUpdated:self];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(DataSource *)self active] != a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)RouteNoQueryDataSource;
    [(DataSource *)&v15 setActive:v3];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = [(RouteNoQueryDataSource *)self _allDataProviders];
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        double v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) setActive:v3];
          double v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }

    [(RouteNoQueryDataSource *)self _updateContents];
    if (!v3)
    {
      LOBYTE(v10) = 0;
      [(DataSource *)self sendAnalyticsForDataAtIndexPath:0 object:0 childPlaceIndexPath:0 childPlaceObject:0 action:0 eventValue:0 populateSearchTapEvent:v10];
    }
  }
}

- (void)setUserLocationSearchResult:(id)a3
{
  v5 = (UserLocationSearchResult *)a3;
  if (self->_userLocationSearchResult != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_userLocationSearchResult, a3);
    [(RouteNoQueryDataSource *)self _updateContents];
    v5 = v6;
  }
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = [a3 row];
  if (v4 >= (id)[(NSArray *)self->_contents count])
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->_contents objectAtIndexedSubscript:v4];
  }

  return v5;
}

- (id)analyticsContext
{
  return self->_analyticsContext;
}

- (void)_addAnalyticsInfo
{
  BOOL v3 = [[AutocompleteContext alloc] initWithQueryString:&stru_101324E70];
  analyticsContext = self->_analyticsContext;
  self->_analyticsContext = v3;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_contents;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v9);
        long long v11 = +[AutocompleteMatchInfo matchInfoWithType:](AutocompleteMatchInfo, "matchInfoWithType:", 0, (void)v13);
        long long v12 = [(RouteNoQueryDataSource *)self analyticsContext];
        [v12 setMatchInfo:v11 forObject:v10];

        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_sendNoTypingACAnalyticsForSelectedAtIndexPath:(id)a3
{
  id v10 = a3;
  id v4 = [(DataSource *)self objectsForAnalytics];
  if (v4)
  {
    contents = self->_contents;
    id v6 = [(RouteNoQueryDataSource *)self analyticsContext];
    id v7 = [(RouteNoQueryDataSource *)self newTraits];
    uint64_t v8 = +[MapsAnalyticsHelper acSuggestionEntriesFromAutoCompleteObjects:contents context:v6 mapsSuggestionsInsights:0 skipReportASearchItems:1 traits:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v10)
  {
    double v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 row]);
    +[GEOAPPortal captureClientACSuggestionWithQuery:&stru_101324E70 queryTokens:0 entries:v8 selectedIndex:v9 selectedSectionIndex:0 withinSectionSelectedIndex:0 isRetainedQuery:0 isRerankerTriggered:0 shouldDifferentiateClientAndServerResults:0];
  }
  else
  {
    +[GEOAPPortal captureClientACSuggestionWithQuery:&stru_101324E70 queryTokens:0 entries:v8 selectedIndex:0 selectedSectionIndex:0 withinSectionSelectedIndex:0 isRetainedQuery:0 isRerankerTriggered:0 shouldDifferentiateClientAndServerResults:0];
  }
}

- (int)targetForDragAnalytics
{
  return 8;
}

- (id)newTraits
{
  v2 = [(DataSource *)self delegate];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___RouteNoQueryDataSourceDelegate]) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 newTraits];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = objc_alloc_init((Class)GEOMapServiceTraits);
  }
  id v7 = v6;

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_contents count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RouteNoQueryDataSource *)self objectAtIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v9 = +[TwoLinesTableViewCell identifier];
    id v10 = [v6 dequeueReusableCellWithIdentifier:v9 forIndexPath:v7];

    uint64_t v11 = +[TwoLinesContentViewModelComposer cellModelForHistoryEntryRecentsItem:v8 showAutocompleteClientSource:0 showPlaceContext:0];
LABEL_5:
    long long v13 = (void *)v11;
    [v10 setViewModel:v11];

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v12 = +[TwoLinesTableViewCell identifier];
    id v10 = [v6 dequeueReusableCellWithIdentifier:v12 forIndexPath:v7];

    uint64_t v11 = +[TwoLinesContentViewModelComposer cellModelForRecentContact:v8];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v8;
    long long v16 = +[TwoLinesTableViewCell identifier];
    id v10 = [v6 dequeueReusableCellWithIdentifier:v16 forIndexPath:v7];

    CGRect v17 = +[TwoLinesContentViewModelComposer cellModelForSearchResult:v15];

    [v10 setViewModel:v17];
  }
  else
  {
    id v10 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
  }
LABEL_6:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(RouteNoQueryDataSource *)self objectAtIndexPath:v6];
  [(DataSource *)self sendAnalyticsForDataAtIndexPath:v6 object:v9 action:2007];
  [(RouteNoQueryDataSource *)self _sendNoTypingACAnalyticsForSelectedAtIndexPath:v6];
  uint64_t v8 = [(DataSource *)self delegate];
  [v8 dataSource:self itemTapped:v9];

  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  +[TwoLinesTableViewCell cellHeight];
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  +[TwoLinesTableViewCell estimatedCellHeight];
  return result;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  lastSelectedIndexPath = self->_lastSelectedIndexPath;
  id v8 = a4;
  id v9 = a3;
  [v9 deselectRowAtIndexPath:lastSelectedIndexPath animated:0];
  id v10 = [v8 nextFocusedIndexPath];
  [v9 selectRowAtIndexPath:v10 animated:0 scrollPosition:0];

  uint64_t v11 = [v8 nextFocusedIndexPath];

  long long v12 = self->_lastSelectedIndexPath;
  self->_lastSelectedIndexPath = v11;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (UserLocationSearchResult)userLocationSearchResult
{
  return self->_userLocationSearchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocationSearchResult, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_analyticsContext, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_recentsDataFilter, 0);
  objc_storeStrong((id *)&self->_recentsDataProvider, 0);

  objc_storeStrong((id *)&self->_markedLocationDataProvider, 0);
}

@end