@interface CarResumeRouteWaypointsController
- (CarResumeRouteWaypointsController)initWithEntry:(id)a3;
- (id)destinationSearchResultIfAvailable;
- (id)searchFieldItems;
- (void)configureDirectionItemForLoad:(id)a3;
- (void)configureUserInfoForLoad:(id)a3;
@end

@implementation CarResumeRouteWaypointsController

- (CarResumeRouteWaypointsController)initWithEntry:(id)a3
{
  id v5 = a3;
  if ([v5 type] == (id)11)
  {
    v10.receiver = self;
    v10.super_class = (Class)CarResumeRouteWaypointsController;
    v6 = [(CarResumeRouteWaypointsController *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_entry, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)destinationSearchResultIfAvailable
{
  v2 = [(CarResumeRouteWaypointsController *)self searchFieldItems];
  v3 = [v2 lastObject];
  v4 = [v3 waypoint];
  id v5 = [v4 pin];

  return v5;
}

- (id)searchFieldItems
{
  searchFieldItems = self->super._searchFieldItems;
  if (!searchFieldItems)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = objc_alloc_init(SearchFieldItem);
    v6 = +[SearchResult currentLocationSearchResult];
    [(SearchFieldItem *)v5 setSearchResult:v6];

    [v4 addObject:v5];
    v7 = +[SearchFieldItem searchFieldItemsForRouteInSuggestionsEntry:self->_entry];
    [v4 addObjectsFromArray:v7];
    v8 = (NSArray *)[v4 copy];
    v9 = self->super._searchFieldItems;
    self->super._searchFieldItems = v8;

    searchFieldItems = self->super._searchFieldItems;
  }

  return searchFieldItems;
}

- (void)configureDirectionItemForLoad:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarResumeRouteWaypointsController;
  [(CarWaypointsController *)&v10 configureDirectionItemForLoad:v4];
  if ([(MapsSuggestionsEntry *)self->_entry containsKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"])
  {
    id v5 = [(MapsSuggestionsEntry *)self->_entry routeRequestStorageForKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"];
    v6 = [DrivePreferences alloc];
    v7 = [v5 automobileOptions];
    v8 = +[NSUserDefaults standardUserDefaults];
    v9 = [(DrivePreferences *)v6 initWithAutomobileOptions:v7 defaults:v8];
    [v4 setDrivePreferences:v9];
  }
}

- (void)configureUserInfoForLoad:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarResumeRouteWaypointsController;
  id v4 = a3;
  [(CarWaypointsController *)&v6 configureUserInfoForLoad:v4];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"DirectionsIsResumedNavigationSessionKey" v6.receiver, v6.super_class];
  id v5 = [(MapsSuggestionsEntry *)self->_entry sharingContacts];
  [v4 setObject:v5 forKeyedSubscript:@"DirectionsPreviousContactsForTripSharing"];
}

- (void).cxx_destruct
{
}

@end