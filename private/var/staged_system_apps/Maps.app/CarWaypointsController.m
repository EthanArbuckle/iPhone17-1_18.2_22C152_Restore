@interface CarWaypointsController
- (BOOL)allowLooping;
- (BOOL)canGoNext;
- (BOOL)canGoPrevious;
- (BOOL)shouldStartLoadWhenBecomingCurrent;
- (NSArray)searchFieldItems;
- (NSDictionary)userInfo;
- (NSString)subtitleForCurrentDestination;
- (NSString)titleForCurrentDestination;
- (SearchResult)destinationSearchResultIfAvailable;
- (SearchResult)originSearchResult;
- (unint64_t)indexOfCurrentDestination;
- (unint64_t)totalDestinations;
- (void)configureUserInfoForLoad:(id)a3;
- (void)setAllowLooping:(BOOL)a3;
- (void)setUserInfo:(id)a3;
- (void)startLoadWithTraits:(id)a3;
@end

@implementation CarWaypointsController

- (BOOL)canGoNext
{
  unint64_t v3 = [(CarWaypointsController *)self indexOfCurrentDestination];
  unint64_t v4 = [(CarWaypointsController *)self totalDestinations];
  return v3 < v4 - 1 && v4 != 0;
}

- (BOOL)canGoPrevious
{
  unint64_t v3 = [(CarWaypointsController *)self indexOfCurrentDestination];
  unint64_t v4 = [(CarWaypointsController *)self totalDestinations];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (NSDictionary)userInfo
{
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    unint64_t v4 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    BOOL v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }

  return userInfo;
}

- (NSString)titleForCurrentDestination
{
  v2 = [(CarWaypointsController *)self searchFieldItems];
  unint64_t v3 = [v2 lastObject];
  unint64_t v4 = [v3 waypointName];

  return (NSString *)v4;
}

- (unint64_t)indexOfCurrentDestination
{
  return 0;
}

- (unint64_t)totalDestinations
{
  return 1;
}

- (BOOL)shouldStartLoadWhenBecomingCurrent
{
  return 1;
}

- (NSArray)searchFieldItems
{
  searchFieldItems = self->_searchFieldItems;
  if (!searchFieldItems)
  {
    unint64_t v4 = [(CarWaypointsController *)self originSearchResult];
    BOOL v5 = +[SearchFieldItem searchFieldItemWithObject:v4];

    v6 = [(CarWaypointsController *)self destinationSearchResultIfAvailable];
    v7 = +[SearchFieldItem searchFieldItemWithObject:v6];

    v11[0] = v5;
    v11[1] = v7;
    v8 = +[NSArray arrayWithObjects:v11 count:2];
    v9 = self->_searchFieldItems;
    self->_searchFieldItems = v8;

    searchFieldItems = self->_searchFieldItems;
  }

  return searchFieldItems;
}

- (SearchResult)originSearchResult
{
  originSearchResult = self->_originSearchResult;
  if (!originSearchResult)
  {
    unint64_t v4 = +[SearchResult currentLocationSearchResult];
    BOOL v5 = self->_originSearchResult;
    self->_originSearchResult = v4;

    originSearchResult = self->_originSearchResult;
  }

  return originSearchResult;
}

- (void)startLoadWithTraits:(id)a3
{
  id v4 = a3;
  BOOL v5 = [DirectionItem alloc];
  v6 = [(CarWaypointsController *)self searchFieldItems];
  v17 = [(DirectionItem *)v5 initWithItems:v6 transportType:1];

  [(CarWaypointsController *)self configureDirectionItemForLoad:v17];
  v7 = [(CarWaypointsController *)self userInfo];
  id v8 = [v7 mutableCopy];

  [(CarWaypointsController *)self configureUserInfoForLoad:v8];
  v9 = sub_100B0671C(v17, v4, 0, v8);

  v10 = +[CarDisplayController sharedInstance];
  v11 = [v10 platformController];
  v12 = [v11 currentSession];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v14 = +[CarDisplayController sharedInstance];
  v15 = [v14 platformController];
  v16 = v15;
  if (isKindOfClass) {
    [v15 replaceCurrentSessionWithSession:v9];
  }
  else {
    [v15 pushSession:v9];
  }
}

- (void)configureUserInfoForLoad:(id)a3
{
}

- (BOOL)allowLooping
{
  return self->_allowLooping;
}

- (void)setAllowLooping:(BOOL)a3
{
  self->_allowLooping = a3;
}

- (SearchResult)destinationSearchResultIfAvailable
{
  return self->_destinationSearchResultIfAvailable;
}

- (NSString)subtitleForCurrentDestination
{
  return self->_subtitleForCurrentDestination;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_subtitleForCurrentDestination, 0);
  objc_storeStrong((id *)&self->_destinationSearchResultIfAvailable, 0);
  objc_storeStrong((id *)&self->_originSearchResult, 0);

  objc_storeStrong((id *)&self->_searchFieldItems, 0);
}

@end