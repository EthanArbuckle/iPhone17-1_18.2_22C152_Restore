@interface CarDestinationsCardViewController
- (BOOL)_shouldChangeToSuggestionEntries:(id)a3;
- (BOOL)_shouldUpdateSection:(int64_t)a3;
- (CarDestinationsCardViewController)initWithDelegate:(id)a3;
- (CarDestinationsCardViewControllerDelegate)delegate;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (NSArray)recents;
- (NSArray)sharedTripSummaries;
- (NSArray)suggestions;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_allDataProviders;
- (id)_titleForSection:(int64_t)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)uniqueName;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)recentsCount;
- (unint64_t)siriSuggestionsCount;
- (void)_beginUpdates;
- (void)_buildRecents;
- (void)_endUpdates;
- (void)_prepareQuickRouteETAsIfNeeded;
- (void)_refreshNumberOfRowsInSection;
- (void)_reloadData;
- (void)_reloadRecents;
- (void)_reloadSection:(int64_t)a3;
- (void)_reloadSharedTrips;
- (void)carMapsSuggestionControllerDidRefresh:(id)a3;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRecents:(id)a3;
- (void)setRecentsCount:(unint64_t)a3;
- (void)setSharedTripSummaries:(id)a3;
- (void)setSiriSuggestionsCount:(unint64_t)a3;
- (void)setSuggestions:(id)a3;
- (void)setSuggestions:(id)a3 reload:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CarDestinationsCardViewController

- (CarDestinationsCardViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CarDestinationsCardViewController;
  v5 = [(CarBaseSearchViewController *)&v27 initWithDisabledETAUpdates:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = +[NSPredicate predicateWithBlock:&stru_10131A2D0];
    v8 = [[RecentsDataFilter alloc] initWithSearchMode:1 filterPredicate:v7];
    recentsDataFilter = v6->_recentsDataFilter;
    v6->_recentsDataFilter = v8;

    v10 = objc_alloc_init(RecentsDataProvider);
    recentsDataProvider = v6->_recentsDataProvider;
    v6->_recentsDataProvider = v10;

    v12 = objc_alloc_init(MarkedLocationDataProvider);
    markedLocationDataProvider = v6->_markedLocationDataProvider;
    v6->_markedLocationDataProvider = v12;

    v14 = [[SharedTripsDataProvider alloc] initWithCombineAllTrips:1];
    sharedTripsDataProvider = v6->_sharedTripsDataProvider;
    v6->_sharedTripsDataProvider = v14;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v16 = [(CarDestinationsCardViewController *)v6 _allDataProviders];
    id v17 = [v16 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        v20 = 0;
        do
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v20) observers];
          [v21 registerObserver:v6];

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v18);
    }

    v6->_focusMovedFromFirstRow = 0;
  }

  return v6;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)CarDestinationsCardViewController;
  [(CarDestinationsCardViewController *)&v31 viewDidLoad];
  v3 = [(CarDestinationsCardViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarDestinationsCard"];

  id v4 = -[CarTableView initWithFrame:]([CarTableView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CarBaseSearchViewController *)self setTableView:v4];

  v5 = [(CarBaseSearchViewController *)self tableView];
  [v5 setAccessibilityIdentifier:@"CarDestinationsCardTableView"];

  v6 = [(CarBaseSearchViewController *)self tableView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(CarBaseSearchViewController *)self tableView];
  LODWORD(v8) = 1148846080;
  [v7 setContentCompressionResistancePriority:0 forAxis:v8];

  v9 = [(CarBaseSearchViewController *)self tableView];
  LODWORD(v10) = 1148846080;
  [v9 setContentCompressionResistancePriority:1 forAxis:v10];

  v11 = [(CarBaseSearchViewController *)self tableView];
  [v11 setDataSource:self];

  v12 = [(CarBaseSearchViewController *)self tableView];
  [v12 setDelegate:self];

  v13 = +[UIColor clearColor];
  v14 = [(CarBaseSearchViewController *)self tableView];
  [v14 setBackgroundColor:v13];

  v15 = [(CarBaseSearchViewController *)self tableView];
  [v15 _setHeaderAndFooterViewsFloat:0];

  v16 = [(CarBaseSearchViewController *)self tableView];
  [v16 setRowHeight:44.0];

  id v17 = [(CarBaseSearchViewController *)self tableView];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = +[CarSearchCategoryCell reuseIdentifier];
  [v17 registerClass:v18 forCellReuseIdentifier:v19];

  v20 = [(CarBaseSearchViewController *)self tableView];
  uint64_t v21 = objc_opt_class();
  v22 = +[CarSearchItemCell reuseIdentifier];
  [v20 registerClass:v21 forCellReuseIdentifier:v22];

  long long v23 = [(CarBaseSearchViewController *)self tableView];
  uint64_t v24 = objc_opt_class();
  long long v25 = +[CarDestinationsTableHeaderView reuseIdentifier];
  [v23 registerClass:v24 forHeaderFooterViewReuseIdentifier:v25];

  long long v26 = [(CarDestinationsCardViewController *)self view];
  objc_super v27 = [(CarBaseSearchViewController *)self tableView];
  [v26 addSubview:v27];

  v28 = [(CarBaseSearchViewController *)self tableView];
  v29 = [(CarDestinationsCardViewController *)self view];
  v30 = [v28 _maps_constraintsForCenteringInView:v29];
  +[NSLayoutConstraint activateConstraints:v30];
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CarDestinationsCardViewController;
  [(CarBaseSearchViewController *)&v15 viewWillAppear:a3];
  id v4 = +[CarDisplayController sharedInstance];
  v5 = [v4 mapsSuggestionsController];
  [v5 registerObserver:self];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(CarDestinationsCardViewController *)self _allDataProviders];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setActive:1];
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }

  [(CarDestinationsCardViewController *)self _reloadData];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarDestinationsCardViewController;
  [(CarBaseSearchViewController *)&v4 viewDidAppear:a3];
  +[PPTNotificationCenter postNotificationIfNeededWithName:@"PPTMyRecentsViewControllerDidAppearNotification" object:self userInfo:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CarDestinationsCardViewController;
  [(CarBaseSearchViewController *)&v15 viewWillDisappear:a3];
  objc_super v4 = +[CarDisplayController sharedInstance];
  v5 = [v4 mapsSuggestionsController];
  [v5 unregisterObserver:self];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(CarDestinationsCardViewController *)self _allDataProviders];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setActive:0];
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_prepareQuickRouteETAsIfNeeded
{
  if (!self->_batchingUpdates && self->_refreshQuickRouteManagers)
  {
    [(CarBaseSearchViewController *)self prepareQuickRouteETAs];
    self->_refreshQuickRouteManagers = 0;
  }
}

- (id)_allDataProviders
{
  recentsDataProvider = self->_recentsDataProvider;
  v5[0] = self->_sharedTripsDataProvider;
  v5[1] = recentsDataProvider;
  v5[2] = self->_markedLocationDataProvider;
  v3 = +[NSArray arrayWithObjects:v5 count:3];

  return v3;
}

- (void)_beginUpdates
{
  if (!self->_batchingUpdates)
  {
    self->_batchingUpdates = 1;
    id v2 = [(CarBaseSearchViewController *)self tableView];
    [v2 beginUpdates];
  }
}

- (void)_endUpdates
{
  self->_batchingUpdates = 0;
  [(CarDestinationsCardViewController *)self _prepareQuickRouteETAsIfNeeded];
  id v3 = [(CarBaseSearchViewController *)self tableView];
  [v3 endUpdates];
}

- (void)_reloadData
{
  if (!self->_batchingUpdates)
  {
    id v3 = +[CarDisplayController sharedInstance];
    objc_super v4 = [v3 mapsSuggestionsController];
    v5 = [v4 suggestions];
    [(CarDestinationsCardViewController *)self setSuggestions:v5 reload:0];

    [(CarDestinationsCardViewController *)self _reloadSharedTrips];
    [(CarDestinationsCardViewController *)self _reloadRecents];
    [(CarDestinationsCardViewController *)self _prepareQuickRouteETAsIfNeeded];
    v6 = +[CollectionManager sharedManager];
    id v7 = [v6 currentCollectionsForCarPlay];
    self->_showCollectionsEntry = [v7 count] != 0;

    id v8 = [(CarBaseSearchViewController *)self tableView];
    [v8 reloadData];
  }
}

- (void)_reloadSection:(int64_t)a3
{
  id v5 = +[NSIndexSet indexSetWithIndex:a3];
  if (!self->_batchingUpdates) {
    [(CarDestinationsCardViewController *)self _prepareQuickRouteETAsIfNeeded];
  }
  objc_super v4 = [(CarBaseSearchViewController *)self tableView];
  [v4 reloadSections:v5 withRowAnimation:100];
}

- (void)_reloadSharedTrips
{
  id v3 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
  objc_super v4 = [(SharedTripsDataProvider *)self->_sharedTripsDataProvider sharedTripSummaries];
  unint64_t v5 = v3;
  unint64_t v6 = v4;
  if (v5 | v6)
  {
    id v7 = (void *)v6;
    unsigned __int8 v8 = [(id)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [(SharedTripsDataProvider *)self->_sharedTripsDataProvider sharedTripSummaries];
      [(CarDestinationsCardViewController *)self setSharedTripSummaries:v9];

      [(CarDestinationsCardViewController *)self _reloadSection:0];
    }
  }
}

- (void)_reloadRecents
{
  id v6 = [(CarDestinationsCardViewController *)self recents];
  [(CarDestinationsCardViewController *)self _buildRecents];
  id v3 = [(CarDestinationsCardViewController *)self recents];
  if ([v3 isEqualToArray:v6])
  {
    unsigned __int8 v4 = [(CarDestinationsCardViewController *)self _shouldUpdateSection:1];

    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  self->_refreshQuickRouteManagers = 1;
  if (self->_needReloadSuggestionSection)
  {
    self->_needReloadSuggestionSection = 0;
    [(CarDestinationsCardViewController *)self _prepareQuickRouteETAsIfNeeded];
    unint64_t v5 = [(CarBaseSearchViewController *)self tableView];
    [v5 reloadData];
  }
  else
  {
    [(CarDestinationsCardViewController *)self _reloadSection:1];
  }
LABEL_8:
}

- (void)_buildRecents
{
  id v7 = +[NSMutableArray array];
  id v3 = [(MarkedLocationDataProvider *)self->_markedLocationDataProvider markedLocation];
  if (v3) {
    [v7 addObject:v3];
  }
  unsigned __int8 v4 = [(RecentsDataProvider *)self->_recentsDataProvider recents];
  [v7 addObjectsFromArray:v4];

  unint64_t v5 = [(RecentsDataFilter *)self->_recentsDataFilter filteredRecents:v7 excludingDuplicatesOfEntries:self->_suggestions];
  id v6 = [v5 copy];
  [(CarDestinationsCardViewController *)self setRecents:v6];
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  if (self->_sharedTripsDataProvider == a3) {
    [(CarDestinationsCardViewController *)self _reloadSharedTrips];
  }
  else {
    [(CarDestinationsCardViewController *)self _reloadRecents];
  }
}

- (id)uniqueName
{
  id v2 = objc_opt_class();

  return [v2 description];
}

- (void)setSuggestions:(id)a3 reload:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (NSArray *)a3;
  if (self->_suggestions != v7)
  {
    unsigned __int8 v8 = sub_100015DB4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSUInteger v9 = [(NSArray *)self->_suggestions count];
      NSUInteger v10 = [(NSArray *)v7 count];
      long long v11 = @"NO";
      if (v4) {
        long long v11 = @"YES";
      }
      long long v12 = v11;
      int v13 = 134218498;
      NSUInteger v14 = v9;
      __int16 v15 = 2048;
      NSUInteger v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Destinations: suggestions changed. before: %ld, after: %ld, reload: %@", (uint8_t *)&v13, 0x20u);
    }
    if (v4)
    {
      [(CarDestinationsCardViewController *)self _beginUpdates];
      objc_storeStrong((id *)&self->_suggestions, a3);
      [(CarDestinationsCardViewController *)self _reloadSection:0];
      [(CarDestinationsCardViewController *)self _reloadRecents];
      [(CarDestinationsCardViewController *)self _endUpdates];
      if (!self->_focusMovedFromFirstRow) {
        [(CarDestinationsCardViewController *)self setNeedsFocusUpdate];
      }
    }
    else
    {
      self->_needReloadSuggestionSection = 1;
      objc_storeStrong((id *)&self->_suggestions, a3);
      [(CarDestinationsCardViewController *)self _reloadRecents];
    }
  }
}

- (void)setSuggestions:(id)a3
{
}

- (BOOL)_shouldChangeToSuggestionEntries:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CarDestinationsCardViewController *)self suggestions];
  id v6 = [v5 count];
  id v7 = [v4 count];

  if (v6 == v7)
  {
    unsigned __int8 v8 = [(CarDestinationsCardViewController *)self suggestions];
    id v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0;
      do
      {
        long long v11 = [(CarDestinationsCardViewController *)self suggestions];
        long long v12 = [v11 objectAtIndexedSubscript:v10];

        int v13 = [v4 objectAtIndexedSubscript:v10];
        NSUInteger v14 = [v12 uniqueIdentifier];
        __int16 v15 = [v13 uniqueIdentifier];
        unsigned __int8 v16 = [v14 isEqualToString:v15];

        if ((v16 & 1) == 0) {
          break;
        }
        ++v10;
        __int16 v17 = [(CarDestinationsCardViewController *)self suggestions];
        id v18 = [v17 count];
      }
      while (v10 < (unint64_t)v18);
      char v19 = v16 ^ 1;
    }
    else
    {
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 1;
  }

  return v19;
}

- (void)carMapsSuggestionControllerDidRefresh:(id)a3
{
  id v7 = a3;
  id v4 = [v7 suggestions];
  unsigned int v5 = [(CarDestinationsCardViewController *)self _shouldChangeToSuggestionEntries:v4];

  if (v5)
  {
    self->_refreshQuickRouteManagers = 1;
    id v6 = [v7 suggestions];
    [(CarDestinationsCardViewController *)self setSuggestions:v6];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  [(CarDestinationsCardViewController *)self _refreshNumberOfRowsInSection];
  if (a4 == 2) {
    return self->_showCollectionsEntry;
  }
  if (a4 == 1) {
    return self->_recentsCount;
  }
  if (a4) {
    return 0;
  }
  unint64_t siriSuggestionsCount = self->_siriSuggestionsCount;
  id v7 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
  unsigned __int8 v8 = (char *)[v7 count] + siriSuggestionsCount;

  return (int64_t)v8;
}

- (BOOL)_shouldUpdateSection:(int64_t)a3
{
  p_unint64_t recentsCount = &self->_recentsCount;
  unint64_t recentsCount = self->_recentsCount;
  p_unint64_t siriSuggestionsCount = &self->_siriSuggestionsCount;
  unint64_t siriSuggestionsCount = self->_siriSuggestionsCount;
  [(CarDestinationsCardViewController *)self _refreshNumberOfRowsInSection];
  if (!a3) {
    return *p_siriSuggestionsCount != siriSuggestionsCount;
  }
  if (a3 == 1)
  {
    p_unint64_t siriSuggestionsCount = p_recentsCount;
    unint64_t siriSuggestionsCount = recentsCount;
    return *p_siriSuggestionsCount != siriSuggestionsCount;
  }
  return 1;
}

- (void)_refreshNumberOfRowsInSection
{
  unint64_t v3 = +[CarDisplayController maximumListLength];
  id v4 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
  unint64_t v5 = v3 - (void)[v4 count];

  id v6 = [(CarDestinationsCardViewController *)self recents];
  if (v5 - (unint64_t)[v6 count] < 4)
  {
    unint64_t v8 = 3;
  }
  else
  {
    id v7 = [(CarDestinationsCardViewController *)self recents];
    unint64_t v8 = v5 - (void)[v7 count];
  }
  id v9 = [(CarDestinationsCardViewController *)self suggestions];
  if ((unint64_t)[v9 count] >= v8)
  {
    p_unint64_t siriSuggestionsCount = &self->_siriSuggestionsCount;
    self->_unint64_t siriSuggestionsCount = v8;
  }
  else
  {
    unint64_t v10 = [(CarDestinationsCardViewController *)self suggestions];
    p_unint64_t siriSuggestionsCount = &self->_siriSuggestionsCount;
    self->_unint64_t siriSuggestionsCount = (unint64_t)[v10 count];
  }
  id v15 = [(CarDestinationsCardViewController *)self recents];
  id v12 = [v15 count];
  unint64_t v13 = v5 - *p_siriSuggestionsCount;
  if ((unint64_t)v12 >= v13)
  {
    self->_unint64_t recentsCount = v13;
  }
  else
  {
    NSUInteger v14 = [(CarDestinationsCardViewController *)self recents];
    self->_unint64_t recentsCount = (unint64_t)[v14 count];
  }
}

- (id)_titleForSection:(int64_t)a3
{
  if (a3 == 2)
  {
    unint64_t v8 = &stru_101324E70;
    goto LABEL_13;
  }
  if (a3 == 1)
  {
    id v4 = [(CarDestinationsCardViewController *)self recents];
    if ([v4 count])
    {
      unint64_t v5 = +[NSBundle mainBundle];
      id v6 = v5;
      CFStringRef v7 = @"CarDestinations_DestinationsHeader_Recents";
      goto LABEL_9;
    }
LABEL_11:
    unint64_t v8 = 0;
    goto LABEL_12;
  }
  if (a3)
  {
    unint64_t v8 = 0;
    goto LABEL_13;
  }
  id v4 = [(CarBaseSearchViewController *)self tableView];
  if ([(CarDestinationsCardViewController *)self tableView:v4 numberOfRowsInSection:0] < 1)goto LABEL_11; {
  unint64_t v5 = +[NSBundle mainBundle];
  }
  id v6 = v5;
  CFStringRef v7 = @"CarDestinations_DestinationsHeader_Suggestions";
LABEL_9:
  unint64_t v8 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

LABEL_12:
LABEL_13:

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v4 = 0.0;
  if ((unint64_t)a4 <= 1)
  {
    CFStringRef v7 = [(CarBaseSearchViewController *)self tableView];
    if ([(CarDestinationsCardViewController *)self tableView:v7 numberOfRowsInSection:a4] <= 0)double v4 = 0.0; {
    else
    }
      double v4 = 17.0;
  }
  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = [(CarBaseSearchViewController *)self tableView];
  int64_t v7 = [(CarDestinationsCardViewController *)self tableView:v6 numberOfRowsInSection:a4];

  double v8 = 0.0;
  if ((unint64_t)a4 <= 1 && v7)
  {
    id v9 = [(CarBaseSearchViewController *)self tableView];
    int64_t v10 = [(CarDestinationsCardViewController *)self numberOfSectionsInTableView:v9];

    do
    {
      uint64_t v11 = a4++;
      if (a4 >= v10) {
        break;
      }
      id v12 = [(CarBaseSearchViewController *)self tableView];
      uint64_t v13 = [(CarDestinationsCardViewController *)self tableView:v12 numberOfRowsInSection:a4];
    }
    while (v13 < 1);
    if (v11 <= 1)
    {
      NSUInteger v14 = [(CarDestinationsCardViewController *)self _titleForSection:a4];
      if ([v14 length]) {
        double v8 = 3.0;
      }
      else {
        double v8 = 10.0;
      }

      id v15 = [(CarBaseSearchViewController *)self tableView];
      uint64_t v16 = [(CarDestinationsCardViewController *)self tableView:v15 numberOfRowsInSection:a4];

      if (v16 <= 0) {
        return 0.0;
      }
    }
  }
  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(CarDestinationsCardViewController *)self _titleForSection:a4];
  if (v7)
  {
    double v8 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"TableHeaderViewReuseIdentifier"];
    [v8 setAccessibilityIdentifier:@"CarDestinationsTableHeader"];
    id v9 = [v8 titleLabel];
    [v9 setText:v7];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4 = objc_alloc_init((Class)UITableViewHeaderFooterView);
  id v5 = objc_alloc_init((Class)UIView);
  [v4 setBackgroundView:v5];

  return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 section] > 1)
  {
    double v9 = 44.0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CarDestinationsCardViewController;
    [(CarBaseSearchViewController *)&v11 tableView:v6 heightForRowAtIndexPath:v7];
    double v9 = v8;
  }

  return v9;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  if (v5 == (id)1)
  {
    objc_super v11 = [(CarDestinationsCardViewController *)self recents];
    id v12 = [v4 row];
    int64_t v10 = v11;
LABEL_11:
    uint64_t v16 = [v10 objectAtIndexedSubscript:v12];

    goto LABEL_13;
  }
  if (!v5)
  {
    id v6 = [v4 row];
    id v7 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
    if ([v7 count])
    {
      double v8 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
      id v9 = [v8 count];

      if (v6 < v9)
      {
        int64_t v10 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
LABEL_10:
        objc_super v11 = v10;
        id v12 = v6;
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v13 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
    id v6 = (id)((unsigned char *)v6 - (unsigned char *)[v13 count]);

    NSUInteger v14 = [(CarDestinationsCardViewController *)self suggestions];
    id v15 = [v14 count];

    if (v15 > v6)
    {
      int64_t v10 = [(CarDestinationsCardViewController *)self suggestions];
      goto LABEL_10;
    }
  }
  uint64_t v16 = 0;
LABEL_13:

  return v16;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if ((unint64_t)v8 >= 2)
  {
    if (v8 == (id)2)
    {
      int64_t v10 = +[CarSearchCategoryCell reuseIdentifier];
      objc_super v11 = [v6 dequeueReusableCellWithIdentifier:v10 forIndexPath:v7];

      [v11 setupWithSavedPlaces];
      goto LABEL_18;
    }
    id v12 = sub_100015DB4();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    NSUInteger v14 = self;
    if (!v14)
    {
      char v19 = @"<nil>";
      goto LABEL_15;
    }
    id v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      __int16 v17 = [(CarDestinationsCardViewController *)v14 performSelector:"accessibilityIdentifier"];
      id v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        char v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

        goto LABEL_13;
      }
    }
    char v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_13:

LABEL_15:
    *(_DWORD *)buf = 138543362;
    long long v23 = v19;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%{public}@] CarDestinationsCardVC tried to dequeue a cell for invalid section.", buf, 0xCu);

LABEL_16:
    id v9 = objc_alloc_init((Class)UITableViewCell);
    goto LABEL_17;
  }
  v21.receiver = self;
  v21.super_class = (Class)CarDestinationsCardViewController;
  id v9 = [(CarBaseSearchViewController *)&v21 tableView:v6 cellForRowAtIndexPath:v7];
LABEL_17:
  objc_super v11 = v9;
LABEL_18:

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 == (id)2)
  {
    NSUInteger v14 = [(CarDestinationsCardViewController *)self delegate];
    [v14 destinationsCardDidSelectSavedPlaces:self];
LABEL_12:

    goto LABEL_13;
  }
  if (v8 == (id)1)
  {
    NSUInteger v14 = [(CarDestinationsCardViewController *)self delegate];
    char v19 = [(CarDestinationsCardViewController *)self recents];
    v20 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    [v14 destinationsCard:self didSelectRecent:v20];

    goto LABEL_12;
  }
  if (!v8)
  {
    id v9 = [v7 row];
    int64_t v10 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
    if ([v10 count])
    {
      objc_super v11 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
      id v12 = [v11 count];

      if (v9 < v12)
      {
        uint64_t v13 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
        NSUInteger v14 = [v13 objectAtIndexedSubscript:v9];

        id v15 = [v14 _transportTypeStringForAnalytics];
        +[GEOAPPortal captureUserAction:9003 target:738 value:v15];

        uint64_t v16 = [(CarDestinationsCardViewController *)self delegate];
        __int16 v17 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
        id v18 = [v17 objectAtIndexedSubscript:v9];
        [v16 destinationsCard:self didSelectRecent:v18];

LABEL_11:
        goto LABEL_12;
      }
    }
    else
    {
    }
    objc_super v21 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
    int64_t v22 = v9 - (unsigned char *)[v21 count];

    NSUInteger v14 = [(CarDestinationsCardViewController *)self delegate];
    uint64_t v16 = [(CarDestinationsCardViewController *)self suggestions];
    long long v23 = [v16 objectAtIndexedSubscript:v22];
    [v14 destinationsCard:self didSelectSuggestion:v23];

    goto LABEL_11;
  }
LABEL_13:
  v24.receiver = self;
  v24.super_class = (Class)CarDestinationsCardViewController;
  [(CarBaseSearchViewController *)&v24 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 section] != (id)2)
  {
    if (![v10 section])
    {
      id v11 = [v10 row];
      id v12 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
      if (![v12 count])
      {
LABEL_6:

        goto LABEL_7;
      }
      uint64_t v13 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
      id v14 = [v13 count];

      if (v11 < v14)
      {
        id v15 = [(CarDestinationsCardViewController *)self sharedTripSummaries];
        id v12 = [v15 objectAtIndexedSubscript:v11];

        uint64_t v16 = [v12 _transportTypeStringForAnalytics];
        +[GEOAPPortal captureUserAction:9002 target:738 value:v16];

        goto LABEL_6;
      }
    }
LABEL_7:
    v17.receiver = self;
    v17.super_class = (Class)CarDestinationsCardViewController;
    [(CarBaseSearchViewController *)&v17 tableView:v8 willDisplayCell:v9 forRowAtIndexPath:v10];
  }
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  [a4 nextFocusedIndexPath:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  self->_focusMovedFromFirstRow |= [v6 row] != 0;
}

- (NSArray)focusOrderSubItems
{
  if ([(CarDestinationsCardViewController *)self isViewLoaded])
  {
    unint64_t v3 = [(CarBaseSearchViewController *)self tableView];
    id v4 = [v3 _car_visibleCells];
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (NSArray)preferredFocusEnvironments
{
  if ([(CarDestinationsCardViewController *)self isViewLoaded])
  {
    unint64_t v3 = [(CarBaseSearchViewController *)self tableView];
    id v6 = v3;
    id v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (CarDestinationsCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarDestinationsCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)recents
{
  return self->_recents;
}

- (void)setRecents:(id)a3
{
}

- (NSArray)sharedTripSummaries
{
  return self->_sharedTripSummaries;
}

- (void)setSharedTripSummaries:(id)a3
{
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (unint64_t)siriSuggestionsCount
{
  return self->_siriSuggestionsCount;
}

- (void)setSiriSuggestionsCount:(unint64_t)a3
{
  self->_unint64_t siriSuggestionsCount = a3;
}

- (unint64_t)recentsCount
{
  return self->_recentsCount;
}

- (void)setRecentsCount:(unint64_t)a3
{
  self->_unint64_t recentsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_sharedTripSummaries, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_markedLocationDataProvider, 0);
  objc_storeStrong((id *)&self->_sharedTripsDataProvider, 0);
  objc_storeStrong((id *)&self->_recentsDataProvider, 0);

  objc_storeStrong((id *)&self->_recentsDataFilter, 0);
}

@end