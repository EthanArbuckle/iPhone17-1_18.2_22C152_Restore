@interface SearchDataSource
- (BOOL)canShowQueryAccelerator;
- (BOOL)hasResults;
- (BOOL)isRoutePlanning;
- (BOOL)searchAlongRoute;
- (BOOL)shouldReloadOnHeightChange;
- (BOOL)shouldShowLoadingIndicator;
- (BOOL)shouldShowNoResultsCell;
- (BOOL)showAddAccessory;
- (BOOL)showPlaceContext;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)usePlaceSummary;
- (GEORetainedSearchMetadata)retainedSearchMetadata;
- (PersonalizedItemManager)mapPersonalizedItems;
- (SearchDataProvider)searchDataProvider;
- (SearchDataSource)initWithTableView:(id)a3;
- (UserLocationSearchResult)userLocationSearchResult;
- (double)rowHeight;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_contentFilteredIfNeeded;
- (id)analyticsContext;
- (id)autocompleteObjectAtIndexPath:(id)a3;
- (id)flattenedArray;
- (id)flattenedIndexPath:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (id)objectsForAnalytics;
- (id)personalizedItemForQuickActionMenuWithCell:(id)a3;
- (id)placeSummaryTemplateForObject:(id)a3 autocompleteClientSourceType:(int64_t)a4 atIndexPath:(id)a5;
- (id)searchTextForAnalyics;
- (id)sectionAtIndex:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int)targetForDragAnalytics;
- (int64_t)accessoryType;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)resultTypes;
- (unsigned)searchMode;
- (void)_hoverGestureRecognizerStateDidChange:(id)a3;
- (void)_invalidateFilteredContent;
- (void)_sendAnalyticsForDataSelectedAtIndexPath:(id)a3 fromContent:(id)a4;
- (void)_sendAnalyticsForDataSelectedAtIndexPath:(id)a3 fromContent:(id)a4 childPlaceIndexPath:(id)a5 childItem:(id)a6 resultRefinement:(id)a7 containmentParent:(id)a8 tappableEntryIdentifier:(id)a9 tappedAccessoryViewType:(int64_t)a10;
- (void)_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:(id)a3 indexPathInSection:(id)a4 sections:(id)a5 context:(id)a6;
- (void)_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:(id)a3 indexPathInSection:(id)a4 sections:(id)a5 context:(id)a6 selectedChildItemIndexPath:(id)a7 indexOfResultWithSelectedChildItem:(id)a8;
- (void)clearAutocompleteResults;
- (void)configureAutocompleteOriginationTypeFromSource:(int)a3 inTraits:(id)a4;
- (void)didTapItemInChildItems:(id)a3 atIndexPath:(id)a4 forCell:(id)a5;
- (void)didTapOnAccessoryEntityQueryAcceleratorWithCell:(id)a3;
- (void)didTapOnAccessoryView:(id)a3 withType:(int64_t)a4 object:(id)a5;
- (void)didTapOnContainmentParentMapItem:(id)a3 cell:(id)a4;
- (void)didTapOnCuratedGuide:(id)a3 cell:(id)a4;
- (void)didTapOnCuratedGuides:(id)a3 cell:(id)a4;
- (void)didTapOnItemInChildItems:(id)a3 cell:(id)a4 buttonIndex:(int64_t)a5;
- (void)didTapOnPlaceContextWithViewModel:(id)a3 parentView:(id)a4;
- (void)didTapOnReportAnIssue;
- (void)didTapOnResultRefinement:(id)a3 cell:(id)a4;
- (void)didTapOnTappableEntryWithMapItemIdentifier:(id)a3 cell:(id)a4;
- (void)didTapOnUserGeneratedGuide:(id)a3 cell:(id)a4;
- (void)invalidateDataForFilterChange;
- (void)reset;
- (void)searchDataProviderDidUpdate:(id)a3;
- (void)sendMapsSuggestionsInsightsAnalyticsWithEntry:(id)a3;
- (void)setAccessoryType:(int64_t)a3;
- (void)setActive:(BOOL)a3;
- (void)setCanShowQueryAccelerator:(BOOL)a3;
- (void)setInputText:(id)a3 tappedQuerySuggestionCompletion:(id)a4 isRetainQuery:(BOOL)a5 traits:(id)a6 source:(int)a7;
- (void)setInputText:(id)a3 traits:(id)a4 source:(int)a5;
- (void)setMapPersonalizedItems:(id)a3;
- (void)setResultTypes:(unint64_t)a3;
- (void)setRetainedSearchMetadata:(id)a3;
- (void)setRoutePlanning:(BOOL)a3;
- (void)setSearchAlongRoute:(BOOL)a3;
- (void)setSearchCompletionFilterType:(int64_t)a3;
- (void)setSearchMode:(unsigned int)a3;
- (void)setShowAddAccessory:(BOOL)a3;
- (void)setShowPlaceContext:(BOOL)a3;
- (void)setUsePlaceSummary:(BOOL)a3;
- (void)setUserLocationSearchResult:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
@end

@implementation SearchDataSource

- (SearchDataSource)initWithTableView:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SearchDataSource;
  v5 = [(DataSource *)&v23 initWithTableView:v4 updateLocation:1];
  if (v5)
  {
    v6 = objc_alloc_init(AutocompleteAnalyticsManager);
    analyticsManager = v5->_analyticsManager;
    v5->_analyticsManager = v6;

    id v8 = objc_storeWeak((id *)&v5->_contentTableView, v4);
    v5->_originalHeaderAndFooterViewsFloat = [v4 _headerAndFooterViewsFloat];

    v9 = objc_alloc_init(SearchDataProvider);
    searchDataProvider = v5->_searchDataProvider;
    v5->_searchDataProvider = v9;

    [(SearchDataProvider *)v5->_searchDataProvider setDelegate:v5];
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    placeSummaryTemplateViewModels = v5->_placeSummaryTemplateViewModels;
    v5->_placeSummaryTemplateViewModels = v11;

    v13 = objc_alloc_init(_TtC4Maps28PlaceSummaryAsyncDataManager);
    placeSummaryAsyncDataManager = v5->_placeSummaryAsyncDataManager;
    v5->_placeSummaryAsyncDataManager = v13;

    uint64_t v15 = objc_opt_class();
    v16 = +[SearchNoResultsTableViewCell identifier];
    [v4 registerClass:v15 forCellReuseIdentifier:v16];

    uint64_t v17 = objc_opt_class();
    v18 = +[SearchLoadingTableViewCell identifier];
    [v4 registerClass:v17 forCellReuseIdentifier:v18];

    uint64_t v19 = objc_opt_class();
    v20 = +[PlaceSummaryTableViewCell reuseIdentifier];
    [v4 registerClass:v19 forCellReuseIdentifier:v20];

    if (sub_1000BBB44(v4) == 5)
    {
      id v21 = [objc_alloc((Class)UIHoverGestureRecognizer) initWithTarget:v5 action:"_hoverGestureRecognizerStateDidChange:"];
      [v4 addGestureRecognizer:v21];
      [v4 setContentInset:8.5, 0.0, 8.5, 0.0];
    }
  }

  return v5;
}

- (void)_hoverGestureRecognizerStateDidChange:(id)a3
{
  id v26 = a3;
  if ([(SearchDataSource *)self shouldShowNoResultsCell]
    || [(SearchDataSource *)self shouldShowLoadingIndicator])
  {
    goto LABEL_23;
  }
  id v4 = [(DataSource *)self tableView];
  v5 = [v4 dataSource];
  if (v5 == self)
  {
    unsigned int v7 = [v26 _maps_isHovering];

    v6 = v26;
    if (!v7) {
      goto LABEL_11;
    }
    id v8 = [(DataSource *)self tableView];
    [v26 locationInView:v8];
    double v10 = v9;
    double v12 = v11;

    v13 = [(DataSource *)self tableView];
    v14 = [v13 indexPathForRowAtPoint:v10, v12];

    uint64_t v15 = [(DataSource *)self tableView];
    v16 = [v15 cellForRowAtIndexPath:v14];

    if (v16 && ([v16 frame], v28.x = v10, v28.y = v12, CGRectContainsPoint(v29, v28)))
    {
      if (v14)
      {
        if ([v14 isEqual:self->_lastSelectedIndexPath])
        {
          uint64_t v17 = 0;
LABEL_17:
          v22 = [(DataSource *)self tableView];
          [v22 selectRowAtIndexPath:v14 animated:0 scrollPosition:0];

          objc_storeStrong((id *)&self->_lastSelectedIndexPath, v14);
          if (v16)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              [v16 canBecomeFirstResponder];
            }
          }
          [v16 becomeFirstResponder];
LABEL_21:

          if (!v17) {
            goto LABEL_23;
          }
          goto LABEL_22;
        }
        char v20 = 0;
LABEL_16:
        uint64_t v17 = self->_lastSelectedIndexPath;
        lastSelectedIndexPath = self->_lastSelectedIndexPath;
        self->_lastSelectedIndexPath = 0;

        if (v20) {
          goto LABEL_21;
        }
        goto LABEL_17;
      }
    }
    else
    {

      v14 = 0;
    }
    char v20 = 1;
    goto LABEL_16;
  }

  v6 = v26;
LABEL_11:
  if ([v6 state] == (id)3)
  {
    v18 = self->_lastSelectedIndexPath;
    if (v18)
    {
      uint64_t v17 = v18;
      uint64_t v19 = self->_lastSelectedIndexPath;
      self->_lastSelectedIndexPath = 0;

LABEL_22:
      objc_super v23 = [(DataSource *)self tableView];
      v24 = [v23 cellForRowAtIndexPath:v17];

      [v24 resignFirstResponder];
      v25 = [(DataSource *)self tableView];
      [v25 deselectRowAtIndexPath:v17 animated:0];
    }
  }
LABEL_23:
}

- (void)invalidateDataForFilterChange
{
  [(SearchDataSource *)self _invalidateFilteredContent];
  id v3 = [(DataSource *)self delegate];
  [v3 dataSourceUpdated:self];
}

- (BOOL)shouldReloadOnHeightChange
{
  if ([(SearchDataSource *)self shouldShowNoResultsCell]) {
    return 1;
  }

  return [(SearchDataSource *)self shouldShowLoadingIndicator];
}

- (unsigned)searchMode
{
  return [(SearchDataProvider *)self->_searchDataProvider searchMode];
}

- (void)setSearchMode:(unsigned int)a3
{
}

- (UserLocationSearchResult)userLocationSearchResult
{
  return [(SearchDataProvider *)self->_searchDataProvider userLocationSearchResult];
}

- (void)setUserLocationSearchResult:(id)a3
{
}

- (GEORetainedSearchMetadata)retainedSearchMetadata
{
  return [(SearchDataProvider *)self->_searchDataProvider retainedSearchMetadata];
}

- (void)setRetainedSearchMetadata:(id)a3
{
}

- (PersonalizedItemManager)mapPersonalizedItems
{
  return [(SearchDataProvider *)self->_searchDataProvider mapPersonalizedItems];
}

- (void)setSearchCompletionFilterType:(int64_t)a3
{
}

- (void)setMapPersonalizedItems:(id)a3
{
}

- (void)setResultTypes:(unint64_t)a3
{
  if (self->_resultTypes != a3)
  {
    self->_resultTypes = a3;
    -[SearchDataProvider setResultTypes:](self->_searchDataProvider, "setResultTypes:");
  }
}

- (BOOL)hasResults
{
  return [(SearchDataProvider *)self->_searchDataProvider hasResults];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchDataSource;
  -[DataSource setActive:](&v8, "setActive:");
  if (v3)
  {
    self->_isLoadingData = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
    [WeakRetained _setHeaderAndFooterViewsFloat:0];
  }
  else
  {
    BOOL originalHeaderAndFooterViewsFloat = self->_originalHeaderAndFooterViewsFloat;
    id v7 = objc_loadWeakRetained((id *)&self->_contentTableView);
    [v7 _setHeaderAndFooterViewsFloat:originalHeaderAndFooterViewsFloat];

    [(SearchDataSource *)self reset];
  }
  [(SearchDataProvider *)self->_searchDataProvider setActive:v3];
}

- (void)searchDataProviderDidUpdate:(id)a3
{
  if ([(DataSource *)self active])
  {
    self->_isLoadingData = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
    uint64_t v5 = sub_1000BBB44(WeakRetained);

    if (v5 != 5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_contentTableView);
      [v6 setContentOffset:CGPointZero.x, CGPointZero.y];
    }
  }
  [(NSMutableDictionary *)self->_placeSummaryTemplateViewModels removeAllObjects];
  [(SearchDataSource *)self _invalidateFilteredContent];
  id v7 = [(DataSource *)self delegate];
  [v7 dataSourceUpdated:self];
}

- (void)clearAutocompleteResults
{
}

- (void)setInputText:(id)a3 traits:(id)a4 source:(int)a5
{
}

- (void)setInputText:(id)a3 tappedQuerySuggestionCompletion:(id)a4 isRetainQuery:(BOOL)a5 traits:(id)a6 source:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v9 = a5;
  id v19 = a3;
  id v13 = a4;
  id v14 = a6;
  unsigned __int8 v15 = [v19 isEqualToString:self->_searchText];
  if (v13 || (v15 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_searchText, a3);
    v16 = [(NSString *)self->_searchText _maps_stringByTrimmingLeadingWhitespace];
    id v17 = [v16 length];

    if (v17 && [(SearchDataSource *)self shouldShowLoadingIndicator])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
      [WeakRetained reloadData];
    }
    [(SearchDataSource *)self configureAutocompleteOriginationTypeFromSource:v7 inTraits:v14];
    [(SearchDataProvider *)self->_searchDataProvider setInputText:v19 tappedQuerySuggestionCompletion:v13 isRetainQuery:v9 traits:v14 source:v7];
  }
}

- (void)configureAutocompleteOriginationTypeFromSource:(int)a3 inTraits:(id)a4
{
  id v5 = a4;
  id v7 = v5;
  if ((a3 - 13) > 3)
  {
    if (a3 == 21)
    {
      uint64_t v6 = 3;
    }
    else if (a3 == 11)
    {
      if ([v5 navigating]) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else if ([v5 navigating])
  {
    uint64_t v6 = 2;
  }
  else
  {
    uint64_t v6 = 1;
  }
  [v7 setAutocompleteOriginationType:v6];
}

- (void)reset
{
  if ([(SearchDataSource *)self searchAlongRoute]) {
    uint64_t v3 = 14;
  }
  else {
    uint64_t v3 = 11;
  }
  [(SearchDataSource *)self setInputText:0 traits:0 source:v3];
  [(SearchDataSource *)self _invalidateFilteredContent];
  [(SearchDataProvider *)self->_searchDataProvider reset];
  placeSummaryTemplateViewModels = self->_placeSummaryTemplateViewModels;

  [(NSMutableDictionary *)placeSummaryTemplateViewModels removeAllObjects];
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  if (![v4 row]
    && ([(SearchDataSource *)self shouldShowNoResultsCell]
     || [(SearchDataSource *)self shouldShowLoadingIndicator]))
  {
    double v10 = 0;
  }
  else
  {
    id v5 = -[SearchDataSource sectionAtIndex:](self, "sectionAtIndex:", [v4 section]);
    if (((unint64_t)[v4 row] & 0x8000000000000000) != 0
      || (id v6 = [v4 row],
          [v5 items],
          id v7 = objc_claimAutoreleasedReturnValue(),
          id v8 = [v7 count],
          v7,
          v6 >= v8))
    {
      double v10 = 0;
    }
    else
    {
      BOOL v9 = [v5 items];
      double v10 = [v9 objectAtIndexedSubscript:[v4 row]];
    }
  }

  return v10;
}

- (id)autocompleteObjectAtIndexPath:(id)a3
{
  uint64_t v3 = [(SearchDataSource *)self objectAtIndexPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 autocompleteObject];

    uint64_t v3 = (void *)v4;
  }

  return v3;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  if ([(SearchDataSource *)self shouldShowNoResultsCell]
    || [(SearchDataSource *)self shouldShowLoadingIndicator])
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(SearchDataSource *)self _contentFilteredIfNeeded];
    if ((unint64_t)[v6 count] <= a3)
    {
      id v5 = 0;
    }
    else
    {
      id v5 = [v6 objectAtIndex:a3];
    }
  }

  return v5;
}

- (BOOL)shouldShowNoResultsCell
{
  if ([(SearchDataSource *)self hasResults]) {
    return 0;
  }
  uint64_t v4 = [(SearchDataSource *)self searchDataProvider];
  id v5 = [v4 autocompleteContext];
  BOOL v3 = v5 != 0;

  return v3;
}

- (BOOL)shouldShowLoadingIndicator
{
  if ([(SearchDataSource *)self hasResults] || !self->_isLoadingData) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
  BOOL v4 = sub_1000BBB44(WeakRetained) == 5;

  return v4;
}

- (double)rowHeight
{
  if ([(SearchDataSource *)self hasResults]
    || [(SearchDataSource *)self shouldShowNoResultsCell]
    || [(SearchDataSource *)self shouldShowLoadingIndicator])
  {
    v4.receiver = self;
    v4.super_class = (Class)SearchDataSource;
    [(DataSource *)&v4 rowHeight];
  }
  else
  {
    +[TwoLinesTableViewCell cellHeight];
  }
  return result;
}

- (void)didTapOnAccessoryView:(id)a3 withType:(int64_t)a4 object:(id)a5
{
  id v23 = a3;
  id v8 = a5;
  if (a4 != 4)
  {
    if (a4 == 2)
    {
      v16 = [(DataSource *)self tableView];
      double v12 = [v16 indexPathForCell:v23];

      id v17 = [(SearchDataSource *)self flattenedIndexPath:v12];
      v18 = [(SearchDataSource *)self flattenedArray];
      [(SearchDataSource *)self _sendAnalyticsForDataSelectedAtIndexPath:v17 fromContent:v18 childPlaceIndexPath:0 childItem:0 resultRefinement:0 containmentParent:0 tappableEntryIdentifier:0 tappedAccessoryViewType:2];

      id v19 = [(SearchDataProvider *)self->_searchDataProvider sections];
      uint64_t v20 = [(SearchDataProvider *)self->_searchDataProvider autocompleteContext];
      [(SearchDataSource *)self _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:v17 indexPathInSection:v12 sections:v19 context:v20];

      id v21 = [(DataSource *)self delegate];
      LOBYTE(v20) = objc_opt_respondsToSelector();

      if (v20)
      {
        v22 = [(DataSource *)self delegate];
        [v22 searchDataSource:self replaceQueryWithItem:v8];
      }
      goto LABEL_10;
    }
    if (a4 != 1) {
      goto LABEL_11;
    }
  }
  BOOL v9 = [(DataSource *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = [(DataSource *)self delegate];
    [v11 searchDataSource:self addItem:v8];
  }
  double v12 = +[UIButton buttonWithType:0];
  [v12 setBounds:0.0, 0.0, 30.0, 30.0];
  id v13 = +[UIImage systemImageNamed:@"checkmark"];
  [v12 setImage:v13 forState:0];

  id v14 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
  [v12 setPreferredSymbolConfiguration:v14 forImageInState:0];

  unsigned __int8 v15 = +[UIColor secondaryLabelColor];
  [v12 setTintColor:v15];

  [v12 setAccessibilityIdentifier:@"AccessoryCheckmarkButton"];
  [v23 setAccessoryView:v12];
LABEL_10:

LABEL_11:
}

- (void)didTapOnPlaceContextWithViewModel:(id)a3 parentView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
  uint64_t v9 = [WeakRetained indexPathForCell:v7];

  v42 = (void *)v9;
  char v10 = [(SearchDataSource *)self flattenedIndexPath:v9];
  double v11 = [(SearchDataSource *)self flattenedArray];
  double v12 = +[MapsAnalyticsHelper analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:](MapsAnalyticsHelper, "analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:", v11, [v10 row]);

  +[MapsAnalyticStateProvider updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:](MapsAnalyticStateProvider, "updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:", v12, self->_searchText, [v10 row], 1, -[SearchDataProvider searchRequestAnalyticsSequenceNumber](self->_searchDataProvider, "searchRequestAnalyticsSequenceNumber"));
  id v13 = [(DataSource *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    unsigned __int8 v15 = [(DataSource *)self delegate];
    [v15 searchDataSource:self didTapOnPlaceContextWithViewModel:v6];
  }
  if ([v6 type] == (id)1)
  {
    v16 = [v6 placeCollections];
    id v17 = [v16 firstObject];

    v18 = [v17 collectionIdentifier];
    id v19 = [v18 muid];

    uint64_t v20 = +[CuratedCollectionSyncManager sharedManager];
    id v21 = v7;
    id v22 = [v20 collectionIsSaved:v17];

    analyticsManager = self->_analyticsManager;
    id v24 = [v10 row];
    id v25 = v22;
    id v7 = v21;
    [(AutocompleteAnalyticsManager *)analyticsManager placeContextSingleCollectionTappedWithMuid:v19 isCurrentlySaved:v25 verticalIndex:v24];

    id v26 = (void *)v9;
  }
  else if ([v6 type] == (id)2)
  {
    id v40 = v7;
    id v27 = objc_alloc((Class)NSMutableArray);
    CGPoint v28 = [v6 placeCollections];
    id v29 = [v27 initWithCapacity:[v28 count]];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v41 = v6;
    v30 = [v6 placeCollections];
    id v31 = [v30 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v44;
      do
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [*(id *)(*((void *)&v43 + 1) + 8 * i) collectionIdentifier];
          v36 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v35 muid]);
          [v29 addObject:v36];
        }
        id v32 = [v30 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v32);
    }

    -[AutocompleteAnalyticsManager placeContextMultipleCollectionsTappedWithMuids:verticalIndex:](self->_analyticsManager, "placeContextMultipleCollectionsTappedWithMuids:verticalIndex:", v29, [v10 row]);
    id v7 = v40;
    id v6 = v41;
    id v26 = v42;
  }
  else
  {
    id v26 = (void *)v9;
    if ([v6 type] == (id)3)
    {
      v37 = +[MKMapService sharedService];
      [v37 captureUserAction:73 onTarget:11 eventValue:0];

      char v10 = 0;
      id v26 = 0;
    }
  }
  v38 = [(SearchDataProvider *)self->_searchDataProvider sections];
  v39 = [(SearchDataProvider *)self->_searchDataProvider autocompleteContext];
  [(SearchDataSource *)self _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:v10 indexPathInSection:v26 sections:v38 context:v39];
}

- (id)placeSummaryTemplateForObject:(id)a3 autocompleteClientSourceType:(int64_t)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  char v10 = [(NSMutableDictionary *)self->_placeSummaryTemplateViewModels objectForKeyedSubscript:v9];

  if (v10)
  {
    id v11 = [(NSMutableDictionary *)self->_placeSummaryTemplateViewModels objectForKeyedSubscript:v9];
  }
  else
  {
    double v12 = [(DataSource *)self tableView];
    [v12 frame];
    double Width = CGRectGetWidth(v90);

    char v14 = [_TtC4Maps29PlaceSummaryTextHighlightType alloc];
    unsigned __int8 v15 = [(SearchDataSource *)self searchDataProvider];
    v73 = -[PlaceSummaryTextHighlightType initWithHighlightType:](v14, "initWithHighlightType:", [v15 highlightType]);

    uint64_t v83 = 0;
    v84 = &v83;
    uint64_t v85 = 0x3032000000;
    v86 = sub_100103CAC;
    v87 = sub_1001046E0;
    id v88 = 0;
    id v71 = v8;
    id v16 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;

    v72 = v18;
    if (v18)
    {
      id v19 = [(SearchDataSource *)self searchDataProvider];
      uint64_t v20 = [v19 placeSummaryMetadata];
      id v21 = [(DataSource *)self currentLocation];
      id v22 = [(SearchDataSource *)self userLocationSearchResult];
      if ([(SearchDataSource *)self searchAlongRoute]) {
        char v23 = 0;
      }
      else {
        char v23 = ![(SearchDataSource *)self isRoutePlanning];
      }
      BYTE1(v69) = [(SearchDataSource *)self searchAlongRoute];
      LOBYTE(v69) = v23;
      uint64_t v24 = +[PlaceSummaryViewModelTemplateFactory viewModelWithCompletion:metadata:currentLocation:userLocationSearchResult:highlightType:availableWidth:clientSourceType:allowsTappableUnits:searchAlongRoute:](_TtC4Maps36PlaceSummaryViewModelTemplateFactory, "viewModelWithCompletion:metadata:currentLocation:userLocationSearchResult:highlightType:availableWidth:clientSourceType:allowsTappableUnits:searchAlongRoute:", v72, v20, v21, v22, v73, a4, Width, v69);
      id v25 = (void *)v84[5];
      v84[5] = v24;
    }
    id v26 = [_TtC4Maps38PlaceSummaryTextHighlightConfiguration alloc];
    id v27 = [(SearchDataSource *)self searchDataProvider];
    CGPoint v28 = [v27 autocompleteContext];
    id v29 = [v28 queryString];
    v30 = [(PlaceSummaryTextHighlightConfiguration *)v26 initWithTypedAutocompleteQuery:v29 type:v73];

    id v31 = v16;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v32 = v31;
    }
    else {
      id v32 = 0;
    }
    id v33 = v32;

    if (v33)
    {
      v34 = (void *)v84[5];
      v84[5] = 0;

      v35 = [v33 historyEntry];
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472;
      v79[2] = sub_10051D220;
      v79[3] = &unk_1012EDC38;
      v82 = &v83;
      v80 = v30;
      v81 = self;
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_10051D2AC;
      v74[3] = &unk_1012EDC60;
      v77 = &v83;
      double v78 = Width;
      v75 = v80;
      v76 = self;
      [v35 ifSearch:v79 ifRoute:0 ifPlaceDisplay:v74 ifTransitLineItem:0];
    }
    id v36 = v31;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v37 = v36;
    }
    else {
      v37 = 0;
    }
    id v38 = v37;

    if (v38)
    {
      uint64_t v39 = +[PlaceSummaryViewModelTemplateFactory viewModelWithAddressBookAddress:v38 highlightConfiguration:v30 searchAlongRoute:[(SearchDataSource *)self searchAlongRoute]];
      id v40 = (void *)v84[5];
      v84[5] = v39;
    }
    id v41 = v36;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v42 = v41;
    }
    else {
      v42 = 0;
    }
    id v43 = v42;

    if (v43)
    {
      uint64_t v44 = +[PlaceSummaryViewModelTemplateFactory viewModelWithAutocompletePerson:v43 highlightConfiguration:v30 searchAlongRoute:[(SearchDataSource *)self searchAlongRoute]];
      long long v45 = (void *)v84[5];
      v84[5] = v44;
    }
    id v46 = v41;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v47 = v46;
    }
    else {
      v47 = 0;
    }
    id v48 = v47;

    if (v48)
    {
      uint64_t v49 = +[PlaceSummaryViewModelTemplateFactory viewModelWithCoreRecentContact:v48 highlightConfiguration:v30 searchAlongRoute:[(SearchDataSource *)self searchAlongRoute]];
      v50 = (void *)v84[5];
      v84[5] = v49;
    }
    v70 = v33;
    id v51 = v46;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v52 = v51;
    }
    else {
      v52 = 0;
    }
    id v53 = v52;

    if (v53)
    {
      v54 = [(DataSource *)self currentLocation];
      uint64_t v55 = +[PlaceSummaryViewModelTemplateFactory viewModelWithSearchResult:v53 highlightConfiguration:v30 currentLocation:v54 availableWidth:[(SearchDataSource *)self searchAlongRoute] searchAlongRoute:Width];
      v56 = (void *)v84[5];
      v84[5] = v55;
    }
    id v57 = v51;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v58 = v57;
    }
    else {
      v58 = 0;
    }
    id v59 = v58;

    if (v59)
    {
      [(DataSource *)self addEKAnalyticsForEntry:v59 tapped:0];
      uint64_t v60 = +[PlaceSummaryViewModelTemplateFactory viewModelWithMapsSuggestionsEntry:v59 highlightConfiguration:v30 searchAlongRoute:[(SearchDataSource *)self searchAlongRoute]];
      v61 = (void *)v84[5];
      v84[5] = v60;
    }
    id v62 = v57;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v63 = v62;
    }
    else {
      v63 = 0;
    }
    id v64 = v63;

    if (v64)
    {
      uint64_t v65 = +[PlaceSummaryViewModelTemplateFactory addAPlaceAutocompleteViewModel];
      v66 = (void *)v84[5];
      v84[5] = v65;
    }
    uint64_t v67 = v84[5];
    if (v67)
    {
      [(NSMutableDictionary *)self->_placeSummaryTemplateViewModels setObject:v67 forKeyedSubscript:v9];
      id v11 = (id)v84[5];
    }
    else
    {
      id v11 = 0;
    }

    _Block_object_dispose(&v83, 8);
    id v8 = v71;
  }

  return v11;
}

- (void)didTapOnCuratedGuide:(id)a3 cell:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
  id v8 = [WeakRetained indexPathForCell:v6];

  id v9 = [(SearchDataSource *)self flattenedIndexPath:v8];
  char v10 = [(SearchDataSource *)self flattenedArray];
  id v11 = +[MapsAnalyticsHelper analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:](MapsAnalyticsHelper, "analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:", v10, [v9 row]);

  +[MapsAnalyticStateProvider updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:](MapsAnalyticStateProvider, "updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:", v11, self->_searchText, [v9 row], 1, -[SearchDataProvider searchRequestAnalyticsSequenceNumber](self->_searchDataProvider, "searchRequestAnalyticsSequenceNumber"));
  double v12 = [(DataSource *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    char v14 = [(DataSource *)self delegate];
    [v14 didTapOnCuratedGuide:v21];
  }
  unsigned __int8 v15 = [v21 collectionIdentifier];
  id v16 = [v15 muid];

  id v17 = +[CuratedCollectionSyncManager sharedManager];
  id v18 = [v17 collectionIsSaved:v21];

  -[AutocompleteAnalyticsManager placeContextSingleCollectionTappedWithMuid:isCurrentlySaved:verticalIndex:](self->_analyticsManager, "placeContextSingleCollectionTappedWithMuid:isCurrentlySaved:verticalIndex:", v16, v18, [v9 row]);
  id v19 = [(SearchDataProvider *)self->_searchDataProvider sections];
  uint64_t v20 = [(SearchDataProvider *)self->_searchDataProvider autocompleteContext];
  [(SearchDataSource *)self _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:v9 indexPathInSection:v8 sections:v19 context:v20];
}

- (void)didTapOnCuratedGuides:(id)a3 cell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
  id v27 = v7;
  uint64_t v9 = [WeakRetained indexPathForCell:v7];

  id v26 = (void *)v9;
  char v10 = [(SearchDataSource *)self flattenedIndexPath:v9];
  id v11 = [(SearchDataSource *)self flattenedArray];
  double v12 = +[MapsAnalyticsHelper analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:](MapsAnalyticsHelper, "analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:", v11, [v10 row]);

  +[MapsAnalyticStateProvider updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:](MapsAnalyticStateProvider, "updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:", v12, self->_searchText, [v10 row], 1, -[SearchDataProvider searchRequestAnalyticsSequenceNumber](self->_searchDataProvider, "searchRequestAnalyticsSequenceNumber"));
  char v13 = [(DataSource *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    unsigned __int8 v15 = [(DataSource *)self delegate];
    [v15 didTapOnCuratedGuides:v6];
  }
  id v16 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v6 count]];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v6;
  id v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [*(id *)(*((void *)&v28 + 1) + 8 * i) collectionIdentifier];
        char v23 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 muid]);
        [v16 addObject:v23];
      }
      id v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v19);
  }

  -[AutocompleteAnalyticsManager placeContextMultipleCollectionsTappedWithMuids:verticalIndex:](self->_analyticsManager, "placeContextMultipleCollectionsTappedWithMuids:verticalIndex:", v16, [v10 row]);
  uint64_t v24 = [(SearchDataProvider *)self->_searchDataProvider sections];
  id v25 = [(SearchDataProvider *)self->_searchDataProvider autocompleteContext];
  [(SearchDataSource *)self _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:v10 indexPathInSection:v26 sections:v24 context:v25];
}

- (void)didTapOnUserGeneratedGuide:(id)a3 cell:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
  id v8 = [WeakRetained indexPathForCell:v6];

  uint64_t v9 = [(SearchDataSource *)self flattenedIndexPath:v8];
  char v10 = [(SearchDataSource *)self flattenedArray];
  id v11 = +[MapsAnalyticsHelper analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:](MapsAnalyticsHelper, "analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:", v10, [v9 row]);

  +[MapsAnalyticStateProvider updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:](MapsAnalyticStateProvider, "updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:", v11, self->_searchText, [v9 row], 1, -[SearchDataProvider searchRequestAnalyticsSequenceNumber](self->_searchDataProvider, "searchRequestAnalyticsSequenceNumber"));
  double v12 = [(DataSource *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    char v14 = [(DataSource *)self delegate];
    [v14 didTapOnUserGeneratedGuide:v17];

    [(AutocompleteAnalyticsManager *)self->_analyticsManager userGeneratedGuideUnitTapped];
  }
  unsigned __int8 v15 = [(SearchDataProvider *)self->_searchDataProvider sections];
  id v16 = [(SearchDataProvider *)self->_searchDataProvider autocompleteContext];
  [(SearchDataSource *)self _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:0 indexPathInSection:0 sections:v15 context:v16];
}

- (void)didTapOnItemInChildItems:(id)a3 cell:(id)a4 buttonIndex:(int64_t)a5
{
  p_contentTableView = &self->_contentTableView;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_contentTableView);
  id v22 = [WeakRetained indexPathForCell:v9];

  double v12 = [(SearchDataSource *)self flattenedIndexPath:v22];
  char v13 = +[NSIndexPath indexPathForRow:a5 inSection:0];
  char v14 = [v10 childItems];

  unsigned __int8 v15 = [v14 objectAtIndexedSubscript:a5];

  id v16 = [(SearchDataSource *)self flattenedArray];
  [(SearchDataSource *)self _sendAnalyticsForDataSelectedAtIndexPath:v12 fromContent:v16 childPlaceIndexPath:v13 childItem:v15 resultRefinement:0 containmentParent:0 tappableEntryIdentifier:0 tappedAccessoryViewType:0];

  id v17 = [(SearchDataProvider *)self->_searchDataProvider sections];
  uint64_t v18 = [(SearchDataProvider *)self->_searchDataProvider autocompleteContext];
  [(SearchDataSource *)self _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:v12 indexPathInSection:v22 sections:v17 context:v18 selectedChildItemIndexPath:v13 indexOfResultWithSelectedChildItem:v22];

  id v19 = [(DataSource *)self delegate];
  LOBYTE(v18) = objc_opt_respondsToSelector();

  if (v18)
  {
    uint64_t v20 = [(DataSource *)self delegate];
    id v21 = [(SearchDataSource *)self autocompleteObjectAtIndexPath:v22];
    [v20 dataSource:self itemTapped:v15 childItemParent:v21];
  }
}

- (void)didTapOnAccessoryEntityQueryAcceleratorWithCell:(id)a3
{
  id v4 = a3;
  id v5 = [(DataSource *)self tableView];
  id v13 = [v5 indexPathForCell:v4];

  id v6 = [(SearchDataSource *)self flattenedIndexPath:v13];
  id v7 = [(SearchDataSource *)self autocompleteObjectAtIndexPath:v13];
  id v8 = [(SearchDataSource *)self flattenedArray];
  [(SearchDataSource *)self _sendAnalyticsForDataSelectedAtIndexPath:v6 fromContent:v8 childPlaceIndexPath:0 childItem:0 resultRefinement:0 containmentParent:0 tappableEntryIdentifier:0 tappedAccessoryViewType:2];

  id v9 = [(SearchDataProvider *)self->_searchDataProvider sections];
  uint64_t v10 = [(SearchDataProvider *)self->_searchDataProvider autocompleteContext];
  [(SearchDataSource *)self _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:v6 indexPathInSection:v13 sections:v9 context:v10];

  id v11 = [(DataSource *)self delegate];
  LOBYTE(v10) = objc_opt_respondsToSelector();

  if (v10)
  {
    double v12 = [(DataSource *)self delegate];
    [v12 searchDataSource:self replaceQueryWithItem:v7];
  }
}

- (void)didTapOnContainmentParentMapItem:(id)a3 cell:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(DataSource *)self tableView];
  id v8 = [v7 indexPathForCell:v6];

  id v9 = [(SearchDataSource *)self flattenedIndexPath:v8];
  uint64_t v10 = [(SearchDataSource *)self flattenedArray];
  [(SearchDataSource *)self _sendAnalyticsForDataSelectedAtIndexPath:v9 fromContent:v10 childPlaceIndexPath:0 childItem:0 resultRefinement:0 containmentParent:v15 tappableEntryIdentifier:0 tappedAccessoryViewType:0];

  id v11 = [(SearchDataProvider *)self->_searchDataProvider sections];
  uint64_t v12 = [(SearchDataProvider *)self->_searchDataProvider autocompleteContext];
  [(SearchDataSource *)self _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:v9 indexPathInSection:v8 sections:v11 context:v12];

  id v13 = [(DataSource *)self delegate];
  LOBYTE(v12) = objc_opt_respondsToSelector();

  if (v12)
  {
    char v14 = [(DataSource *)self delegate];
    [v14 dataSource:self itemTapped:v15 childItemParent:0];
  }
}

- (void)didTapOnResultRefinement:(id)a3 cell:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [(DataSource *)self tableView];
  id v8 = [v7 indexPathForCell:v6];

  id v9 = [(SearchDataSource *)self flattenedIndexPath:v8];
  uint64_t v10 = [(SearchDataSource *)self flattenedArray];
  [(SearchDataSource *)self _sendAnalyticsForDataSelectedAtIndexPath:v9 fromContent:v10 childPlaceIndexPath:0 childItem:0 resultRefinement:v16 containmentParent:0 tappableEntryIdentifier:0 tappedAccessoryViewType:0];

  id v11 = [(SearchDataProvider *)self->_searchDataProvider sections];
  uint64_t v12 = [(SearchDataProvider *)self->_searchDataProvider autocompleteContext];
  [(SearchDataSource *)self _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:v9 indexPathInSection:v8 sections:v11 context:v12];

  id v13 = [(DataSource *)self delegate];
  LOBYTE(v12) = objc_opt_respondsToSelector();

  if (v12)
  {
    char v14 = [(DataSource *)self delegate];
    id v15 = [(SearchDataSource *)self autocompleteObjectAtIndexPath:v8];
    [v14 dataSource:self itemTapped:v16 childItemParent:v15];
  }
}

- (void)didTapOnTappableEntryWithMapItemIdentifier:(id)a3 cell:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [(DataSource *)self tableView];
  id v8 = [v7 indexPathForCell:v6];

  id v9 = [(SearchDataSource *)self flattenedIndexPath:v8];
  uint64_t v10 = [(SearchDataSource *)self flattenedArray];
  [(SearchDataSource *)self _sendAnalyticsForDataSelectedAtIndexPath:v9 fromContent:v10 childPlaceIndexPath:0 childItem:0 resultRefinement:0 containmentParent:0 tappableEntryIdentifier:v16 tappedAccessoryViewType:0];

  id v11 = [(SearchDataProvider *)self->_searchDataProvider sections];
  uint64_t v12 = [(SearchDataProvider *)self->_searchDataProvider autocompleteContext];
  [(SearchDataSource *)self _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:v9 indexPathInSection:v8 sections:v11 context:v12];

  id v13 = [(DataSource *)self delegate];
  LOBYTE(v12) = objc_opt_respondsToSelector();

  if (v12)
  {
    char v14 = [(DataSource *)self delegate];
    id v15 = [(SearchDataSource *)self autocompleteObjectAtIndexPath:v8];
    [v14 dataSource:self itemTapped:v16 childItemParent:v15];
  }
}

- (id)personalizedItemForQuickActionMenuWithCell:(id)a3
{
  id v4 = a3;
  id v5 = [(DataSource *)self tableView];
  id v6 = [v5 indexPathForCell:v4];

  id v7 = [(SearchDataSource *)self autocompleteObjectAtIndexPath:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (v9)
  {
    uint64_t v10 = [(SearchResultMapItemBase *)[SearchResultMapItem alloc] initWithSearchResult:v9];
    id v11 = v7;
    goto LABEL_47;
  }
  uint64_t v12 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  char v14 = v13;

  if (!v14
    || ([(SearchResult *)v14 mapItem],
        id v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        !v15))
  {
    uint64_t v18 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }
    uint64_t v20 = v19;

    if (v20)
    {
      id v21 = [(SearchResult *)v20 historyEntry];
      id v22 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
      objc_opt_class();
      id v23 = v21;
      if (objc_opt_isKindOfClass()) {
        uint64_t v24 = v23;
      }
      else {
        uint64_t v24 = 0;
      }
      id v25 = v24;

      if (v25)
      {
        id v26 = [v25 historyEntry];
        unsigned int v27 = [v26 conformsToProtocol:v22];

        if (v27) {
          id v28 = v23;
        }
        else {
          id v28 = 0;
        }
      }
      else
      {
        id v28 = 0;
      }

      if (!v28)
      {
        id v11 = 0;
        uint64_t v10 = 0;
        goto LABEL_45;
      }
      id v38 = v18;
      uint64_t v39 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
      objc_opt_class();
      id v40 = v38;
      if (objc_opt_isKindOfClass()) {
        id v41 = v40;
      }
      else {
        id v41 = 0;
      }
      v42 = v41;

      if (v42
        && ([(SearchResult *)v42 historyEntry],
            id v43 = objc_claimAutoreleasedReturnValue(),
            unsigned int v44 = [v43 conformsToProtocol:v39],
            v43,
            v44))
      {
        long long v29 = v40;
      }
      else
      {
        long long v29 = 0;
      }

      long long v45 = [(SearchResult *)v29 historyEntry];
      id v33 = [v45 geoMapItem];

      v37 = [[SearchResult alloc] initWithGEOMapItem:v33];
    }
    else
    {
      long long v29 = v18;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v30 = v29;
      }
      else {
        long long v30 = 0;
      }
      long long v31 = v30;

      if (!v31)
      {
        id v33 = v29;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v47 = v33;
        }
        else {
          v47 = 0;
        }
        long long v29 = v47;

        if (v29)
        {
          if (([(SearchResult *)v29 BOOLeanForKey:@"MapsSuggestionsIsNotADestinationKey" is:1] & 1) == 0)
          {
            uint64_t v10 = [[SuggestionsItem alloc] initWithSuggestion:v29 order:0 sourceType:9 sourceSubtype:0 hasPriorityOverride:0 priorityOverride:0];
            long long v29 = 0;
            id v11 = 0;
            goto LABEL_42;
          }
          long long v29 = 0;
        }
        else
        {
          id v33 = 0;
        }
        id v11 = 0;
        uint64_t v10 = 0;
LABEL_42:

LABEL_43:
LABEL_45:

        goto LABEL_46;
      }
      id v32 = [(SearchResult *)v31 geocodedMapItem];
      id v33 = v32;
      if (!v32
        || ([(SearchResult *)v32 _geoMapItem],
            v34 = objc_claimAutoreleasedReturnValue(),
            v34,
            !v34))
      {
        id v35 = objc_alloc((Class)MKMapItem);
        id v36 = [(SearchResult *)v31 addressDictionary];
        uint64_t v10 = (SearchResultMapItem *)[v35 initWithAddressDictionary:v36];

        id v33 = (SearchResult *)v10;
        if (!v10)
        {
          id v11 = 0;
          goto LABEL_43;
        }
      }
      v37 = [[SearchResult alloc] initWithMapItem:v33 searchResultType:0 addressBookAddress:v31 retainedSearchMetadata:0 resultIndex:0];
    }
    id v11 = v37;
    uint64_t v10 = [(SearchResultMapItemBase *)[SearchResultMapItem alloc] initWithSearchResult:v37];
    goto LABEL_42;
  }
  id v16 = [SearchResult alloc];
  id v17 = [(SearchResult *)v14 mapItem];
  id v11 = [(SearchResult *)v16 initWithMapItem:v17];

  uint64_t v10 = [(SearchResultMapItemBase *)[SearchResultMapItem alloc] initWithSearchResult:v11];
LABEL_46:

LABEL_47:

  return v10;
}

- (id)objectsForAnalytics
{
  v2 = [(SearchDataSource *)self _contentFilteredIfNeeded];
  id v3 = [v2 copy];

  return v3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(SearchDataSource *)self numberOfRowsInSection:a4];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(SearchDataSource *)self shouldShowNoResultsCell]
    || ![(DataSource *)self active]
    || [(SearchDataSource *)self shouldShowLoadingIndicator])
  {
    id v7 = 0;
  }
  else
  {
    id v9 = [(SearchDataSource *)self sectionAtIndex:a4];
    if (([v9 isQuerySuggestionsSection] & 1) != 0
      || ([v9 title],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          id v11 = [v10 length],
          v10,
          !v11))
    {
      id v7 = 0;
    }
    else
    {
      uint64_t v12 = [v9 title];
      if ([v12 length])
      {
        id v13 = [SectionHeaderTableViewHeaderFooterView alloc];
        char v14 = [v9 title];
        id v7 = -[SectionHeaderTableViewHeaderFooterView initWithTitle:isFirstNonEmptySection:](v13, "initWithTitle:isFirstNonEmptySection:", v14, objc_msgSend(v6, "_maps_indexOfFirstNonEmptySection") == (id)a4);

        [(SectionHeaderTableViewHeaderFooterView *)v7 setAccessibilityIdentifiersWithBaseString:@"Autocomplete"];
        [(SectionHeaderTableViewHeaderFooterView *)v7 setShowsBottomHairline:0];
      }
      else
      {
        id v7 = 0;
      }
    }
  }

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  double v7 = 0.0;
  if (![(SearchDataSource *)self shouldShowNoResultsCell]
    && [(DataSource *)self active]
    && ![(SearchDataSource *)self shouldShowLoadingIndicator])
  {
    id v8 = [(SearchDataSource *)self sectionAtIndex:a4];
    if (([v8 isQuerySuggestionsSection] & 1) == 0)
    {
      id v9 = [v8 title];
      if ([v9 length])
      {
        BOOL v10 = [v6 _maps_indexOfFirstNonEmptySection] == a4;
        [v6 bounds];
        double Width = CGRectGetWidth(v15);
        uint64_t v12 = [v6 traitCollection];
        +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:v10 title:v9 actionTitle:0 availableWidth:v12 traitCollection:Width];
        double v7 = v13;
      }
    }
  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator") && ![v7 row])
  {
    uint64_t v12 = +[SearchLoadingTableViewCell identifier];
    double v13 = [v6 dequeueReusableCellWithIdentifier:v12 forIndexPath:v7];

    goto LABEL_38;
  }
  if (-[SearchDataSource shouldShowNoResultsCell](self, "shouldShowNoResultsCell") && ![v7 row])
  {
    id v40 = +[SearchNoResultsTableViewCell identifier];
    double v13 = [v6 dequeueReusableCellWithIdentifier:v40 forIndexPath:v7];

    [(AcSearchResultTableViewCell *)v13 setDelegate:self];
    [(AcSearchResultTableViewCell *)v13 setEnableStructuredRAPAffordance:[(SearchDataProvider *)self->_searchDataProvider shouldEnableRAPForNoResults]];
    if (sub_1000BBB44(v6) != 5)
    {
      [v6 frame];
      double v41 = v42;
      goto LABEL_42;
    }
LABEL_38:
    double v41 = 40.0;
LABEL_42:
    LODWORD(v14) = 1144750080;
    [(AcSearchResultTableViewCell *)v13 setHeightConstraint:v41 withPriority:v14];
    goto LABEL_151;
  }
  id v8 = [(SearchDataSource *)self objectAtIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [(SearchDataSource *)self searchDataProvider];
    unsigned int v10 = [v9 showAutocompleteClientSource];

    if (v10) {
      int64_t v11 = +[AutocompleteClientSource autocompleteClientSourceTypeWithItem:v8];
    }
    else {
      int64_t v11 = 0;
    }
    uint64_t v15 = [v8 autocompleteObject];

    id v8 = (void *)v15;
  }
  else
  {
    int64_t v11 = 0;
  }
  if (self->_showAddAccessory)
  {
    int64_t accessoryType = self->_accessoryType;
LABEL_14:
    int64_t v162 = accessoryType;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 hasQueryAcceleratorAffordanceEnabled])
  {
    unsigned int v17 = [(SearchDataSource *)self canShowQueryAccelerator];
    int64_t accessoryType = 2;
    if (!v17) {
      int64_t accessoryType = 0;
    }
    goto LABEL_14;
  }
  int64_t v162 = 0;
LABEL_21:
  v163 = -[SearchDataSource sectionAtIndex:](self, "sectionAtIndex:", [v7 section]);
  if ([v163 isQuerySuggestionsSection])
  {
    uint64_t v18 = +[QuerySuggestionTableViewCell identifier];
    double v13 = [v6 dequeueReusableCellWithIdentifier:v18];

    if (!v13)
    {
      id v19 = [QuerySuggestionTableViewCell alloc];
      uint64_t v20 = +[QuerySuggestionTableViewCell identifier];
      double v13 = [(QuerySuggestionTableViewCell *)v19 initWithStyle:0 reuseIdentifier:v20];
    }
    id v21 = v6;
    id v22 = v8;
    id v23 = [v22 directionIntent];

    if (v23)
    {
      uint64_t v24 = [[DirectionIntentCellViewModel alloc] initWithLocalSearchCompletion:v22];
      id v25 = [(DirectionIntentCellViewModel *)v24 titleCellString];
      id v26 = [(DirectionIntentCellViewModel *)v24 subtitleCellString];
      if ([v26 length])
      {
        uint64_t v27 = +[NSString stringWithFormat:@"%@ %@", v25, v26];

        id v25 = (void *)v27;
      }
      id v28 = [v22 titleHighlightRanges];
      [(AcSearchResultTableViewCell *)v13 setTitle:v25 highlightTitleRanges:v28 detailText:0 style:0];
    }
    else
    {
      uint64_t v24 = [v22 title];
      id v25 = [v22 titleHighlightRanges];
      [(AcSearchResultTableViewCell *)v13 setTitle:v24 highlightTitleRanges:v25 detailText:0 style:0];
    }

    [(_SearchResultTableViewCell *)v13 setAccessoryViewDelegate:self];
    [(_SearchResultTableViewCell *)v13 setAccessoryViewObject:v22];
    [(AcSearchResultTableViewCell *)v13 setAccessoryViewType:v162];
    id v6 = v21;
    goto LABEL_149;
  }
  if (![(SearchDataSource *)self usePlaceSummary])
  {
LABEL_44:
    id v43 = +[NSUserDefaults standardUserDefaults];
    unsigned int v44 = [v43 BOOLForKey:@"EnableSearchDebug"];

    id v22 = 0;
    if (!v44 || !v8) {
      goto LABEL_59;
    }
    long long v45 = [(SearchDataSource *)self searchDataProvider];
    id v46 = [v45 autocompleteContext];
    v47 = [v46 matchInfoForObject:v8];

    if (v47)
    {
      if ([v47 hasClientRankingDebug])
      {
        [v47 clientRankingDebug];
        +[NSString stringWithFormat:@"Client ranking: %f", v48];
LABEL_51:
        id v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v49 = v8;
          if (v22)
          {
            v50 = [v22 stringByAppendingString:@"; "];
          }
          else
          {
            v50 = &stru_101324E70;
          }
          -[v50 stringByAppendingFormat:@"Server index = %lu:%lu" serverSectionIndex:[v49 serverSectionIndex] serverItemIndexInSection:[v49 serverItemIndexInSection]];
          id v22 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_59:
        objc_opt_class();
        id v160 = v22;
        v161 = v6;
        if (objc_opt_isKindOfClass())
        {
          int64_t v156 = v11;
          id v51 = +[TwoLinesContentViewModelComposer cellModelForHistoryEntryRecentsItem:v8 showAutocompleteClientSource:(unint64_t)(v11 - 1) < 2 showPlaceContext:[(SearchDataSource *)self showPlaceContext]];
          id v52 = v8;
          id v53 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
          objc_opt_class();
          id v54 = v52;
          if (objc_opt_isKindOfClass()) {
            uint64_t v55 = v54;
          }
          else {
            uint64_t v55 = 0;
          }
          id v56 = v55;

          if (v56
            && ([v56 historyEntry],
                id v57 = objc_claimAutoreleasedReturnValue(),
                unsigned int v58 = [v57 conformsToProtocol:v53],
                v57,
                v58))
          {
            id v59 = v54;
          }
          else
          {
            id v59 = 0;
          }

          if (!v59)
          {
            id v74 = 0;
            int64_t v11 = v156;
            goto LABEL_91;
          }
          id v63 = v54;
          id v64 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
          objc_opt_class();
          id v65 = v63;
          if (objc_opt_isKindOfClass()) {
            v66 = v65;
          }
          else {
            v66 = 0;
          }
          id v67 = v66;

          if (v67
            && ([v67 historyEntry],
                v68 = objc_claimAutoreleasedReturnValue(),
                unsigned int v69 = [v68 conformsToProtocol:v64],
                v68,
                v69))
          {
            id v60 = v65;
          }
          else
          {
            id v60 = 0;
          }

          id v71 = [v60 historyEntry];
          v72 = [v71 geoMapItem];
          v73 = +[MKMapItem _itemWithGeoMapItem:v72];

          if ([v73 _isMapItemTypeBusiness])
          {
            id v74 = v65;

            id v51 = 0;
          }
          else
          {
            id v74 = 0;
          }
          int64_t v11 = v156;
          id v22 = v160;

          goto LABEL_90;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v70 = +[TwoLinesContentViewModelComposer cellModelForAddressBookAddress:v8];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [(DataSource *)self addEKAnalyticsForEntry:v8 tapped:0];
                  v141 = +[TwoLinesTableViewCell identifier];
                  double v13 = [v6 dequeueReusableCellWithIdentifier:v141];

                  if (!v13)
                  {
                    v142 = [TwoLinesTableViewCell alloc];
                    v143 = +[TwoLinesTableViewCell identifier];
                    double v13 = [(TwoLinesTableViewCell *)v142 initWithStyle:0 reuseIdentifier:v143 contentViewType:0];
                  }
                  v144 = +[TwoLinesContentViewModelComposer cellModelForMapsSuggestionEntry:v8];
                  [v144 setDebugString:v22];
                  v145 = [v144 titleText];
                  v146 = [(SearchDataSource *)self searchDataProvider];
                  v147 = [v146 autocompleteContext];
                  v148 = [v147 queryString];
                  v149 = [v145 _maps_prefixMatchesForSearchString:v148];
                  [v144 setTitleHighlightRanges:v149];

                  id v22 = v160;
                  [v144 setShouldEnableGrayscaleHighlighting:[self->_searchDataProvider shouldEnableGrayscaleHighlighting]];
                  [(AcSearchResultTableViewCell *)v13 setViewModel:v144];

                  goto LABEL_148;
                }
LABEL_147:
                double v13 = (AcSearchResultTableViewCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
LABEL_148:
                id v6 = v161;
                goto LABEL_149;
              }
              int64_t v109 = v11;
              id v110 = v8;
              if ([v110 type] == 3
                || ([v110 isDynamicCurrentLocation] & 1) != 0
                || ([v110 mapItem],
                    v111 = objc_claimAutoreleasedReturnValue(),
                    unsigned __int8 v112 = [v111 _hasMUID],
                    v111,
                    (v112 & 1) == 0))
              {
                v151 = [(SearchDataSource *)self searchDataProvider];
                v152 = [v151 autocompleteInputContext];
                v153 = [v152 queryString];
                id v51 = +[TwoLinesContentViewModelComposer cellModelForSearchResult:v110 typedACQuery:v153 showAutocompleteClientSource:v109 == 5];

                id v22 = v160;
                id v74 = 0;
              }
              else
              {
                id v74 = v110;
                id v51 = 0;
              }

              int64_t v11 = v109;
LABEL_91:
              if (v51)
              {
                [v51 setDebugString:v22];
                [v51 setShouldEnableGrayscaleHighlighting:[self->_searchDataProvider shouldEnableGrayscaleHighlighting]];
                v76 = +[TwoLinesTableViewCell identifier];
                double v13 = [v161 dequeueReusableCellWithIdentifier:v76];

                if (!v13)
                {
                  BOOL v77 = sub_1000BBB44(v161) == 5;
                  double v78 = [TwoLinesTableViewCell alloc];
                  v79 = +[TwoLinesTableViewCell identifier];
                  double v13 = [(TwoLinesTableViewCell *)v78 initWithStyle:0 reuseIdentifier:v79 contentViewType:v77];
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v157 = [v51 titleText];
                  v80 = [(SearchDataSource *)self searchDataProvider];
                  v81 = [v80 autocompleteContext];
                  [v81 queryString];
                  id v82 = v7;
                  v84 = id v83 = v74;
                  uint64_t v85 = [v157 _maps_prefixMatchesForSearchString:v84];
                  [v51 setTitleHighlightRanges:v85];

                  id v74 = v83;
                  id v7 = v82;
                }
                [(AcSearchResultTableViewCell *)v13 setViewModel:v51];
                [(_SearchResultTableViewCell *)v13 setAccessoryViewDelegate:self];
                [(_SearchResultTableViewCell *)v13 setAccessoryViewObject:v8];
                [(AcSearchResultTableViewCell *)v13 setAccessoryViewType:v162];
                [(_SearchResultTableViewCell *)v13 setPlaceContextViewModelDelegate:self];

                id v22 = v160;
                id v6 = v161;
                goto LABEL_149;
              }
              if (v74)
              {
                int64_t v158 = v11;
                id v86 = v74;
                v87 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
                objc_opt_class();
                id v88 = v86;
                if (objc_opt_isKindOfClass()) {
                  v89 = v88;
                }
                else {
                  v89 = 0;
                }
                id v90 = v89;

                if (v90)
                {
                  v91 = [v90 historyEntry];
                  unsigned int v92 = [v91 conformsToProtocol:v87];

                  if (v92) {
                    id v93 = v88;
                  }
                  else {
                    id v93 = 0;
                  }
                }
                else
                {
                  id v93 = 0;
                }

                if (v93)
                {
                  id v94 = v88;
                  v95 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
                  objc_opt_class();
                  id v96 = v94;
                  if (objc_opt_isKindOfClass()) {
                    v97 = v96;
                  }
                  else {
                    v97 = 0;
                  }
                  id v98 = v97;

                  if (v98
                    && ([v98 historyEntry],
                        v99 = objc_claimAutoreleasedReturnValue(),
                        unsigned int v100 = [v99 conformsToProtocol:v95],
                        v99,
                        v100))
                  {
                    id v101 = v96;
                  }
                  else
                  {
                    id v101 = 0;
                  }

                  v102 = [v101 historyEntry];
                  v103 = [v102 geoMapItem];
                  v104 = [v103 _childItems];

                  id v105 = objc_alloc((Class)MKMapItem);
                  v106 = [v101 historyEntry];
                  v107 = [v106 geoMapItem];
                  id v154 = [v105 initWithGeoMapItem:v107 isPlaceHolderPlace:0];

                  id v108 = v160;
                }
                else
                {
                  objc_opt_class();
                  id v108 = v160;
                  if (objc_opt_isKindOfClass())
                  {
                    id v101 = v88;
                    v104 = [v101 childItems];
                    id v154 = [v101 mapItem];
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v104 = 0;
                      id v154 = 0;
                      goto LABEL_125;
                    }
                    id v154 = [v88 mapItem];
                    id v101 = [v154 _geoMapItem];
                    v104 = [v101 _childItems];
                  }
                }

LABEL_125:
                uint64_t v113 = +[AcSearchResultTableViewCell identifierWithChildItemsCount:](AcSearchResultTableViewCell, "identifierWithChildItemsCount:", [v104 count]);
                double v13 = [v161 dequeueReusableCellWithIdentifier:v113];
                if (!v13) {
                  double v13 = [[AcSearchResultTableViewCell alloc] initWithStyle:0 reuseIdentifier:v113];
                }
                v155 = (void *)v113;
                [(AcSearchResultTableViewCell *)v13 setDelegate:self];
                v114 = [(DataSource *)self currentLocation];
                [(_SearchResultTableViewCell *)v13 setCurrentLocation:v114];

                [(_SearchResultTableViewCell *)v13 setDebugString:v108];
                [(_SearchResultTableViewCell *)v13 setAccessoryViewDelegate:self];
                [(_SearchResultTableViewCell *)v13 setAccessoryViewObject:v88];
                [(AcSearchResultTableViewCell *)v13 setAccessoryViewType:v162];
                [(AcSearchResultTableViewCell *)v13 setShouldEnableGrayscaleHighlighting:[(SearchDataProvider *)self->_searchDataProvider shouldEnableGrayscaleHighlighting]];
                v115 = [(SearchDataSource *)self searchDataProvider];
                v116 = [v115 autocompleteContext];
                v117 = [v116 queryString];
                [(AcSearchResultTableViewCell *)v13 setSearchQuery:v117];

                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v118 = (uint64_t)[v88 autocompleteCellType];
                }
                else {
                  uint64_t v118 = 3;
                }
                [(AcSearchResultTableViewCell *)v13 setAutocompleteCellType:v118];
                [(AcSearchResultTableViewCell *)v13 setAutocompleteClientSourceType:v158];
                if ([v104 count])
                {
                  v119 = [(DataSource *)self tableView];
                  [v119 frame];
                  [(AcSearchResultTableViewCell *)v13 estimatedChildItemsStackViewWidthWithContentViewWidth:CGRectGetWidth(v165)];
                  double v121 = v120;

                  sub_1000BBB44(v161);
                  v122 = objc_opt_class();
                  v123 = [ChildItemsViewModel alloc];
                  +[AcSearchResultTableViewCell childItemRowSpacing];
                  double v125 = v124;
                  v126 = [v122 buttonTitleFont];
                  [v122 contentEdgeInsets];
                  v131 = -[ChildItemsViewModel initWithChildItems:childItemsSpacing:font:maxWidth:buttonContentEdgeInsets:](v123, "initWithChildItems:childItemsSpacing:font:maxWidth:buttonContentEdgeInsets:", v104, v126, v125, v121, v127, v128, v129, v130);
                }
                else
                {
                  v131 = 0;
                }
                id v22 = v160;
                [(AcSearchResultTableViewCell *)v13 setChildItems:v104 viewModel:v131];
                [(_SearchResultTableViewCell *)v13 setPlaceContextViewModelDelegate:self];
                if ([(SearchDataSource *)self showPlaceContext] && v154)
                {
                  v132 = [[PlaceContextViewModel alloc] initWithMapItem:v154 context:1];
                  [(_SearchResultTableViewCell *)v13 setPlaceContextViewModel:v132];
                }
                else
                {
                  [(_SearchResultTableViewCell *)v13 setPlaceContextViewModel:0];
                }
                v133 = v163;
                [(AcSearchResultTableViewCell *)v13 setObject:v88];

                id v6 = v161;
                goto LABEL_150;
              }
              goto LABEL_147;
            }
            uint64_t v70 = +[TwoLinesContentViewModelComposer cellModelForRecentContact:v8 showAutocompleteClientSource:(unint64_t)(v11 - 3) < 2 autocompleteClientSourceType:v11];
          }
          id v51 = (void *)v70;
          id v74 = 0;
          goto LABEL_91;
        }
        id v60 = v8;
        v61 = [v60 mapItem];
        int64_t v62 = v11;
        if (v61)
        {
        }
        else
        {
          v75 = [v60 publisherResult];

          if (!v75)
          {
            v134 = [(SearchDataSource *)self userLocationSearchResult];
            int64_t v11 = v62;
            id v51 = +[TwoLinesContentViewModelComposer cellModelForLocalSearchCompletion:v60 userLocationSearchResult:v134 autocompleteClientSourceType:v62];

            uint64_t v135 = [v60 clientResolved];
            if (v135)
            {
              v136 = (void *)v135;
              v159 = [v60 clientResolved];
              if ([v159 itemType] == 4)
              {
                v137 = [v60 subtitle];
                id v138 = [v137 length];

                if (!v138)
                {
                  v139 = +[CustomLocationManager sharedManager];
                  v140 = [(SearchDataSource *)self userLocationSearchResult];
                  [v139 processSearchResult:v140 traits:0];
                }
                id v22 = v160;
                int64_t v11 = v62;
              }
              else
              {
              }
            }
            id v74 = 0;
            goto LABEL_90;
          }
        }
        id v51 = 0;
        int64_t v11 = v62;
        id v74 = v60;
LABEL_90:

        goto LABEL_91;
      }
      if ([v47 hasSortPriorityDebug])
      {
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Priority: %ld", [v47 sortPriorityDebug]);
        goto LABEL_51;
      }
    }
    id v22 = 0;
    goto LABEL_53;
  }
  id v29 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v30 = v29;
  }
  else {
    long long v30 = 0;
  }
  id v22 = v30;

  uint64_t v31 = [v22 clientResolved];
  if (v31)
  {
    id v32 = (void *)v31;
    id v33 = [v22 clientResolved];
    unsigned int v34 = [v33 itemType];

    if (v34 == 4)
    {
      id v35 = +[CustomLocationManager sharedManager];
      id v36 = [(SearchDataSource *)self userLocationSearchResult];
      [v35 processSearchResult:v36 traits:0];
    }
  }
  uint64_t v37 = [(SearchDataSource *)self placeSummaryTemplateForObject:v29 autocompleteClientSourceType:v11 atIndexPath:v7];
  if (!v37)
  {

    goto LABEL_44;
  }
  id v38 = (void *)v37;
  uint64_t v39 = +[PlaceSummaryTableViewCell reuseIdentifier];
  double v13 = [v6 dequeueReusableCellWithIdentifier:v39];

  [(AcSearchResultTableViewCell *)v13 setViewModel:v38 delegate:self asyncDataManager:self->_placeSummaryAsyncDataManager];
LABEL_149:
  v133 = v163;
LABEL_150:

LABEL_151:

  return v13;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 row]
    && ([(SearchDataSource *)self shouldShowNoResultsCell]
     || [(SearchDataSource *)self shouldShowLoadingIndicator]))
  {
    BOOL v9 = 0;
  }
  else
  {
    id v8 = [v6 cellForRowAtIndexPath:v7];
    BOOL v9 = ![v8 conformsToProtocol:&OBJC_PROTOCOL___AutocompleteCellAccessoryView]
      || [v8 accessoryViewType] != (id)3;
  }
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if ([v6 row]
    || ![(SearchDataSource *)self shouldShowNoResultsCell]
    && ![(SearchDataSource *)self shouldShowLoadingIndicator])
  {
    id v7 = [(SearchDataSource *)self autocompleteObjectAtIndexPath:v6];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(DataSource *)self addEKAnalyticsForEntry:v7 tapped:1];
      }
      [(SearchDataSource *)self sendMapsSuggestionsInsightsAnalyticsWithEntry:v7];
      id v8 = [(SearchDataSource *)self flattenedArray];
      BOOL v9 = [(SearchDataSource *)self flattenedIndexPath:v6];
      [(SearchDataSource *)self _sendAnalyticsForDataSelectedAtIndexPath:v9 fromContent:v8];
      unsigned int v10 = [(SearchDataProvider *)self->_searchDataProvider sections];
      int64_t v11 = [(SearchDataProvider *)self->_searchDataProvider autocompleteContext];
      [(SearchDataSource *)self _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:v9 indexPathInSection:v6 sections:v10 context:v11];

      uint64_t v12 = [(DataSource *)self delegate];
      [v12 dataSource:self itemTapped:v7];
    }
    [v15 deselectRowAtIndexPath:v6 animated:1];
    double v13 = [v15 cellForRowAtIndexPath:v6];
    if ([v13 conformsToProtocol:&OBJC_PROTOCOL___AutocompleteCellAccessoryView])
    {
      id v14 = v13;
      if ([v14 accessoryViewType] == (id)1) {
        [v14 setAccessoryViewType:3];
      }
    }
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 row]
    && ([(SearchDataSource *)self shouldShowNoResultsCell]
     || [(SearchDataSource *)self shouldShowLoadingIndicator]))
  {
    [v6 frame];
    double v11 = v10;
  }
  else
  {
    id v8 = -[SearchDataSource sectionAtIndex:](self, "sectionAtIndex:", [v7 section]);
    if ([v8 isQuerySuggestionsSection])
    {
      +[QuerySuggestionTableViewCell estimatedCellHeight];
    }
    else if ([(SearchDataSource *)self usePlaceSummary])
    {
      +[PlaceSummaryTableViewCell autocompleteResultEstimatedHeight];
    }
    else
    {
      +[TwoLinesTableViewCell cellHeight];
    }
    double v11 = v9;
  }
  return v11;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  if (sub_1000BBB44(v11) == 5)
  {
    [v11 deselectRowAtIndexPath:self->_lastSelectedIndexPath animated:0];
    id v8 = [v7 nextFocusedIndexPath];
    [v11 selectRowAtIndexPath:v8 animated:0 scrollPosition:0];
  }
  double v9 = [v7 nextFocusedIndexPath];
  lastSelectedIndexPath = self->_lastSelectedIndexPath;
  self->_lastSelectedIndexPath = v9;
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return sub_1000BBB44(a3) == 5;
}

- (id)analyticsContext
{
  return [(SearchDataProvider *)self->_searchDataProvider autocompleteContext];
}

- (id)_contentFilteredIfNeeded
{
  p_filteredContent = (id *)&self->_filteredContent;
  filteredContent = self->_filteredContent;
  if (filteredContent)
  {
    id v4 = filteredContent;
  }
  else
  {
    id v6 = [(SearchDataProvider *)self->_searchDataProvider sections];
    id v7 = [(DataSource *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v24 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v22 = v6;
      id obj = v6;
      id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v27;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(obj);
            }
            double v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            id v14 = [v13 items];
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_10052052C;
            v25[3] = &unk_1012EA0F8;
            v25[4] = self;
            id v15 = +[NSPredicate predicateWithBlock:v25];
            id v16 = [v14 filteredArrayUsingPredicate:v15];

            if ([v16 count])
            {
              unsigned int v17 = [v13 title];
              uint64_t v18 = +[AutocompleteSection sectionWithTitle:items:isQuerySuggestionsSection:](AutocompleteSection, "sectionWithTitle:items:isQuerySuggestionsSection:", v17, v16, [v13 isQuerySuggestionsSection]);
              [v24 addObject:v18];
            }
          }
          id v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v10);
      }

      id v19 = [v24 copy];
      id v20 = *p_filteredContent;
      id *p_filteredContent = v19;

      id v6 = v22;
    }
    else
    {
      objc_storeStrong(p_filteredContent, v6);
    }
    id v4 = (NSArray *)*p_filteredContent;
  }

  return v4;
}

- (void)_invalidateFilteredContent
{
  filteredContent = self->_filteredContent;
  self->_filteredContent = 0;
}

- (int64_t)numberOfSections
{
  if ([(SearchDataSource *)self shouldShowNoResultsCell]
    || [(SearchDataSource *)self shouldShowLoadingIndicator])
  {
    return 1;
  }
  id v4 = [(SearchDataSource *)self _contentFilteredIfNeeded];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  if ([(SearchDataSource *)self shouldShowNoResultsCell]
    || [(SearchDataSource *)self shouldShowLoadingIndicator])
  {
    return 1;
  }
  id v6 = [(SearchDataSource *)self sectionAtIndex:a3];
  id v7 = [v6 items];
  id v8 = [v7 count];

  return (int64_t)v8;
}

- (void)didTapItemInChildItems:(id)a3 atIndexPath:(id)a4 forCell:(id)a5
{
  p_contentTableView = &self->_contentTableView;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_contentTableView);
  id v21 = [WeakRetained indexPathForCell:v9];

  double v13 = [(SearchDataSource *)self flattenedIndexPath:v21];
  id v14 = [v11 objectAtIndexedSubscript:[v10 row]];

  id v15 = [(SearchDataSource *)self flattenedArray];
  [(SearchDataSource *)self _sendAnalyticsForDataSelectedAtIndexPath:v13 fromContent:v15 childPlaceIndexPath:v10 childItem:v14 resultRefinement:0 containmentParent:0 tappableEntryIdentifier:0 tappedAccessoryViewType:0];

  uint64_t v16 = [(SearchDataProvider *)self->_searchDataProvider sections];
  unsigned int v17 = [(SearchDataProvider *)self->_searchDataProvider autocompleteContext];
  [(SearchDataSource *)self _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:v13 indexPathInSection:v21 sections:v16 context:v17 selectedChildItemIndexPath:v10 indexOfResultWithSelectedChildItem:v21];

  uint64_t v18 = [(DataSource *)self delegate];
  LOBYTE(v16) = objc_opt_respondsToSelector();

  if (v16)
  {
    id v19 = [(DataSource *)self delegate];
    id v20 = [(SearchDataSource *)self autocompleteObjectAtIndexPath:v21];
    [v19 dataSource:self itemTapped:v14 childItemParent:v20];
  }
}

- (void)didTapOnReportAnIssue
{
  [(AutocompleteAnalyticsManager *)self->_analyticsManager addAPlaceTappedWithNumberOfResults:0];
  id v3 = [ReportASearchAutocompleteResult alloc];
  id v4 = [(SearchDataProvider *)self->_searchDataProvider autocompleteContext];
  id v5 = [v4 queryString];
  id v7 = [(ReportASearchAutocompleteResult *)v3 initWithTitle:v5];

  id v6 = [(DataSource *)self delegate];
  [v6 dataSource:self itemTapped:v7];
}

- (id)flattenedIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[v4 row];
  if ((uint64_t)[v4 section] >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      id v7 = [(DataSource *)self tableView];
      id v5 = &v5[[(SearchDataSource *)self tableView:v7 numberOfRowsInSection:v6]];

      ++v6;
    }
    while ((uint64_t)[v4 section] > v6);
  }
  id v8 = +[NSIndexPath indexPathForRow:v5 inSection:0];

  return v8;
}

- (id)flattenedArray
{
  id v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(SearchDataProvider *)self->_searchDataProvider sections];
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
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) items];
        [v3 addObjectsFromArray:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return v10;
}

- (void)_sendAnalyticsForDataSelectedAtIndexPath:(id)a3 fromContent:(id)a4
{
}

- (void)_sendAnalyticsForDataSelectedAtIndexPath:(id)a3 fromContent:(id)a4 childPlaceIndexPath:(id)a5 childItem:(id)a6 resultRefinement:(id)a7 containmentParent:(id)a8 tappableEntryIdentifier:(id)a9 tappedAccessoryViewType:(int64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v86 = a8;
  id v21 = a9;
  id v22 = [v16 row];
  if (v22 < [v17 count])
  {
    v81 = v19;
    id v82 = v21;
    uint64_t v85 = v20;
    if ([(SearchDataProvider *)self->_searchDataProvider searchMode] == 1)
    {
      uint64_t v23 = 1;
    }
    else if ([(SearchDataProvider *)self->_searchDataProvider searchMode] == 2)
    {
      id v33 = [(DataSource *)self delegate];
      unsigned int v34 = [v33 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

      if (v34)
      {
        id v35 = [(DataSource *)self delegate];
        if (objc_opt_respondsToSelector()) {
          uint64_t v23 = (uint64_t)[v35 searchFieldTypeForAnalytics];
        }
        else {
          uint64_t v23 = 2;
        }
      }
      else
      {
        uint64_t v23 = 2;
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
    uint64_t v36 = +[MapsAnalyticsHelper analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:](MapsAnalyticsHelper, "analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:", v17, [v16 row]);
    uint64_t v37 = (void *)v36;
    +[MapsAnalyticStateProvider updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:](MapsAnalyticStateProvider, "updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:", v36, self->_searchText, [v16 row], v23, -[SearchDataProvider searchRequestAnalyticsSequenceNumber](self->_searchDataProvider, "searchRequestAnalyticsSequenceNumber"));
    id v38 = [v17 objectAtIndexedSubscript:[v16 row]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v39 = [v38 autocompleteObject];

      id v38 = (void *)v39;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[AutocompleteAnalyticsManager addAPlaceTappedWithNumberOfResults:](self->_analyticsManager, "addAPlaceTappedWithNumberOfResults:", [v17 count]);
LABEL_21:
      id v32 = v19;
      id v21 = v82;
LABEL_22:
      id v40 = +[GEOAPSharedStateData sharedData];
      [v40 clearSuggestionsData];

      id v20 = v85;
      goto LABEL_23;
    }
    if (v86)
    {
      -[AutocompleteAnalyticsManager containmentParentUnitTappedWithMuid:](self->_analyticsManager, "containmentParentUnitTappedWithMuid:", [v86 _muid]);
      goto LABEL_21;
    }
    v79 = (void *)v36;
    if (v85)
    {
      analyticsManager = self->_analyticsManager;
      double v42 = [v85 toggle];
      id v43 = [v42 refinementKey];
      [(AutocompleteAnalyticsManager *)analyticsManager resultRefinementTappedWithKey:v43];

      id v32 = v19;
      id v21 = v82;
LABEL_28:
      uint64_t v37 = v79;
      goto LABEL_22;
    }
    id v21 = v82;
    if (v82)
    {
      -[AutocompleteAnalyticsManager tappableEntryUnitTappedWithMuid:](self->_analyticsManager, "tappableEntryUnitTappedWithMuid:", [v82 muid]);
      id v32 = v19;
      goto LABEL_28;
    }
    id v32 = v19;
    if (v19)
    {
      unsigned int v44 = [v19 childItemAction];

      if (v44)
      {
        long long v45 = [v19 childItemAction];
        id v46 = [v19 childItemAction];
        v47 = [v45 childActionTypeAsString:[v46 childActionType]];
      }
      else
      {
        v47 = 0;
      }
      id v21 = 0;
      uint64_t v37 = v79;
      id v54 = [v81 childItemPlace];
      LOBYTE(v75) = 0;
      [(DataSource *)self sendAnalyticsForDataAtIndexPath:v16 object:v38 childPlaceIndexPath:v18 childPlaceObject:v54 action:2031 eventValue:v47 populateSearchTapEvent:v75];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v55 = [v38 publisherResult];
        v84 = [v55 publisher];

        id v56 = [v81 childItemAction];
        uint64_t v80 = [v56 guideLocation];

        if (v84)
        {
          id v57 = self->_analyticsManager;
          unsigned int v58 = [v84 identifier];
          id v59 = [v58 muid];
          id v60 = [v16 row];
          id v61 = v59;
          id v32 = v81;
          [(AutocompleteAnalyticsManager *)v57 publisherChildItemButtonTappedWithPublisherMuid:v61 verticalIndex:v60];

          uint64_t v37 = v79;
          int64_t v62 = (void *)v80;
        }
        else
        {
          int64_t v62 = (void *)v80;
          if (v80)
          {
            -[AutocompleteAnalyticsManager guidesHomeChildItemButtonTappedWithVerticalIndex:](self->_analyticsManager, "guidesHomeChildItemButtonTappedWithVerticalIndex:", [v16 row]);
            int64_t v62 = (void *)v80;
          }
        }
      }
      goto LABEL_22;
    }
    objc_opt_class();
    unsigned int v48 = 2007;
    if (objc_opt_isKindOfClass())
    {
      if ([v38 entryTapBehavior] == (id)1) {
        unsigned int v48 = 2087;
      }
      else {
        unsigned int v48 = 2007;
      }
    }
    if (a10 == 2) {
      uint64_t v49 = 2032;
    }
    else {
      uint64_t v49 = v48;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v50 = v38;
      id v51 = [v50 mapItem];
      unsigned int v52 = [v51 _hasHikeInfo];

      if (v52)
      {
        id v53 = [v50 mapItem];
        double v78 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v53 _muid]);
      }
      else
      {
        double v78 = 0;
      }
      uint64_t v37 = v79;

      [(DataSource *)self sendAnalyticsForDataAtIndexPath:v16 object:v38 action:v49 eventValue:v78];
    }
    else
    {
      double v78 = 0;
      uint64_t v37 = v79;
      [(DataSource *)self sendAnalyticsForDataAtIndexPath:v16 object:v38 action:v49 eventValue:0];
    }
    objc_opt_class();
    id v32 = 0;
    id v21 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_60:

      goto LABEL_22;
    }
    id v63 = [v38 collectionResult];
    id v64 = [v63 collection];

    id v65 = [v38 publisherResult];
    BOOL v77 = [v65 publisher];

    if (v64)
    {
      v66 = +[CuratedCollectionSyncManager sharedManager];
      id v67 = [v66 collectionIsSaved:v64];

      v68 = self->_analyticsManager;
      v76 = v64;
      unsigned int v69 = [v64 collectionIdentifier];
      id v70 = [v69 muid];
      id v71 = [v16 row];
      id v72 = v70;
      id v32 = v81;
      [(AutocompleteAnalyticsManager *)v68 curatedCollectionTappedWithMUID:v72 isCurrentlySaved:v67 verticalIndex:v71];
    }
    else
    {
      v73 = v77;
      if (!v77)
      {
LABEL_59:

        goto LABEL_60;
      }
      v76 = 0;
      id v74 = self->_analyticsManager;
      unsigned int v69 = [v77 identifier];
      -[AutocompleteAnalyticsManager publisherTappedWithMuid:[v69 muid] verticalIndex:[v16 row]];
    }

    uint64_t v37 = v79;
    id v64 = v76;
    v73 = v77;
    goto LABEL_59;
  }
  uint64_t v24 = sub_100109E50();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    id v25 = [v16 row];
    id v83 = v16;
    id v26 = v20;
    id v27 = v25;
    id v28 = [v17 count];
    long long v29 = v18;
    searchText = self->_searchText;
    uint64_t v31 = +[ChildItemButton buttonTitleWithChildItem:v19];
    *(_DWORD *)buf = 134219010;
    id v88 = v27;
    id v20 = v26;
    id v16 = v83;
    __int16 v89 = 2048;
    id v90 = v28;
    __int16 v91 = 2112;
    unsigned int v92 = searchText;
    id v18 = v29;
    __int16 v93 = 2112;
    id v94 = v31;
    __int16 v95 = 2048;
    id v96 = [v29 row];
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Logging out of bounds tap. IndexPath %ld. Content count: %lu. Query: %@. ChildItem title: %@. ChildPlaceIndexPath: %ld", buf, 0x34u);
  }
  id v32 = v19;
LABEL_23:
}

- (void)_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:(id)a3 indexPathInSection:(id)a4 sections:(id)a5 context:(id)a6
{
}

- (void)_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:(id)a3 indexPathInSection:(id)a4 sections:(id)a5 context:(id)a6 selectedChildItemIndexPath:(id)a7 indexOfResultWithSelectedChildItem:(id)a8
{
  id v32 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v15)
  {
    long long v29 = [(SearchDataProvider *)self->_searchDataProvider autocompleteAnalyticsSuggestionsFromSections:v15 context:v16 selectedChildItemIndexPath:v17 indexOfResultWithSelectedChildItem:v18];
  }
  else
  {
    long long v29 = 0;
  }
  long long v30 = v18;
  if ([(SearchDataProvider *)self->_searchDataProvider hasShowAutocompleteClientSource])
  {
    id v26 = +[NSNumber numberWithBool:[(SearchDataProvider *)self->_searchDataProvider showAutocompleteClientSource]];
  }
  else
  {
    id v26 = 0;
  }
  if (v32)
  {
    id v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v32 row]);
  }
  else
  {
    id v19 = 0;
  }
  uint64_t v31 = v17;
  id v28 = v14;
  if (v14)
  {
    id v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 section]);
    id v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 row]);
  }
  else
  {
    id v21 = 0;
    id v20 = 0;
  }
  id v22 = [v16 queryString];
  [v16 query];
  uint64_t v23 = v27 = v16;
  uint64_t v24 = [v23 queryTerms];
  id v25 = +[NSNumber numberWithBool:[(SearchDataProvider *)self->_searchDataProvider lastRequestIsRetainQuery]];
  +[GEOAPPortal captureClientACSuggestionWithQuery:v22 queryTokens:v24 entries:v29 selectedIndex:v19 selectedSectionIndex:v20 withinSectionSelectedIndex:v21 isRetainedQuery:v25 isRerankerTriggered:0 shouldDifferentiateClientAndServerResults:v26];
}

- (id)searchTextForAnalyics
{
  return self->_searchText;
}

- (int)targetForDragAnalytics
{
  return 11;
}

- (void)sendMapsSuggestionsInsightsAnalyticsWithEntry:(id)a3
{
  id v25 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v25 contact];
    if (!v3) {
      goto LABEL_29;
    }
    id v4 = sub_100018584();
    [v4 feedbackForContact:v3 action:1];
  }
  else
  {
    id v5 = v25;
    id v6 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
    objc_opt_class();
    id v7 = v5;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (v9
      && ([v9 historyEntry],
          id v10 = objc_claimAutoreleasedReturnValue(),
          unsigned int v11 = [v10 conformsToProtocol:v6],
          v10,
          v11))
    {
      id v12 = v7;
    }
    else
    {
      id v12 = 0;
    }

    if (v12)
    {
      id v13 = v7;
      id v14 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
      objc_opt_class();
      id v15 = v13;
      if (objc_opt_isKindOfClass()) {
        id v16 = v15;
      }
      else {
        id v16 = 0;
      }
      id v17 = v16;

      if (v17
        && ([v17 historyEntry],
            id v18 = objc_claimAutoreleasedReturnValue(),
            unsigned int v19 = [v18 conformsToProtocol:v14],
            v18,
            v19))
      {
        id v20 = v15;
      }
      else
      {
        id v20 = 0;
      }

      id v21 = [v20 historyEntry];
      id v22 = [v21 geoMapItem];
      id v3 = +[MKMapItem _itemWithGeoMapItem:v22];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v3 = [v7 mapItem];
      }
      else
      {
        id v3 = 0;
      }
    }
    id v4 = [v3 _geoMapItem];
    if (v4)
    {
      uint64_t v23 = MapsSuggestionsMapItemConvertIfNeeded();
      if (v23)
      {
        uint64_t v24 = sub_100018584();
        [v24 feedbackForMapItem:v23 action:1];
      }
    }
  }

LABEL_29:
}

- (SearchDataProvider)searchDataProvider
{
  return self->_searchDataProvider;
}

- (BOOL)showAddAccessory
{
  return self->_showAddAccessory;
}

- (void)setShowAddAccessory:(BOOL)a3
{
  self->_showAddAccessory = a3;
}

- (int64_t)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(int64_t)a3
{
  self->_int64_t accessoryType = a3;
}

- (BOOL)canShowQueryAccelerator
{
  return self->_canShowQueryAccelerator;
}

- (void)setCanShowQueryAccelerator:(BOOL)a3
{
  self->_canShowQueryAccelerator = a3;
}

- (BOOL)showPlaceContext
{
  return self->_showPlaceContext;
}

- (void)setShowPlaceContext:(BOOL)a3
{
  self->_showPlaceContext = a3;
}

- (BOOL)usePlaceSummary
{
  return self->_usePlaceSummary;
}

- (void)setUsePlaceSummary:(BOOL)a3
{
  self->_usePlaceSummary = a3;
}

- (BOOL)searchAlongRoute
{
  return self->_searchAlongRoute;
}

- (void)setSearchAlongRoute:(BOOL)a3
{
  self->_searchAlongRoute = a3;
}

- (BOOL)isRoutePlanning
{
  return self->_routePlanning;
}

- (void)setRoutePlanning:(BOOL)a3
{
  self->_routePlanning = a3;
}

- (unint64_t)resultTypes
{
  return self->_resultTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchDataProvider, 0);
  objc_storeStrong((id *)&self->_placeSummaryAsyncDataManager, 0);
  objc_storeStrong((id *)&self->_placeSummaryTemplateViewModels, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_filteredContent, 0);

  objc_destroyWeak((id *)&self->_contentTableView);
}

@end