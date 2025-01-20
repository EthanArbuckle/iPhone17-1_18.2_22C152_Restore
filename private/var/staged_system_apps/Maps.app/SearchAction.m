@interface SearchAction
- (BOOL)isCompatibleWithNavigation;
- (BOOL)isCompatibleWithRestorationTask;
- (BOOL)isMPREnabled;
- (BOOL)searchAlongRoute;
- (SearchAction)initWithSearchItem:(id)a3 alongRoute:(BOOL)isMPREnabled;
- (SearchFieldItem)searchItem;
- (int)analyticsLaunchActionType;
- (void)setIsMPREnabled:(BOOL)a3;
- (void)setSearchAlongRoute:(BOOL)a3;
- (void)setSearchItem:(id)a3;
@end

@implementation SearchAction

- (SearchAction)initWithSearchItem:(id)a3 alongRoute:(BOOL)isMPREnabled
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SearchAction;
  v8 = [(SearchAction *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_searchItem, a3);
    v10 = +[MNNavigationService sharedService];
    [v10 state];
    int IsNavigating = MNNavigationServiceStateIsNavigating();

    v12 = +[MNNavigationService sharedService];
    unsigned int v13 = [v12 navigationTransportType] - 1;
    char IsEnabled_Maps182 = 0;
    switch(v13)
    {
      case 0u:
      case 5u:
        break;
      case 1u:
        char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
        break;
      case 2u:
        char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
        break;
      default:
        char IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
        break;
    }
    v9->_isMPREnabled = IsEnabled_Maps182;

    if (IsNavigating) {
      isMPREnabled = v9->_isMPREnabled;
    }
    v9->_searchAlongRoute = isMPREnabled;
  }

  return v9;
}

- (BOOL)isCompatibleWithNavigation
{
  return self->_isMPREnabled;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 28;
}

- (SearchFieldItem)searchItem
{
  return self->_searchItem;
}

- (void)setSearchItem:(id)a3
{
}

- (BOOL)searchAlongRoute
{
  return self->_searchAlongRoute;
}

- (void)setSearchAlongRoute:(BOOL)a3
{
  self->_searchAlongRoute = a3;
}

- (BOOL)isMPREnabled
{
  return self->_isMPREnabled;
}

- (void)setIsMPREnabled:(BOOL)a3
{
  self->_isMPREnabled = a3;
}

- (void).cxx_destruct
{
}

@end