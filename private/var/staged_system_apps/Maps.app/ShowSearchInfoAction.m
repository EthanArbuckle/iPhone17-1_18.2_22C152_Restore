@interface ShowSearchInfoAction
- (BOOL)isCompatibleWithNavigation;
- (BOOL)isCompatibleWithRestorationTask;
- (SearchInfo)searchInfo;
- (ShowSearchInfoAction)initWithSearchInfo:(id)a3;
- (int)analyticsLaunchActionType;
- (void)setSearchInfo:(id)a3;
@end

@implementation ShowSearchInfoAction

- (ShowSearchInfoAction)initWithSearchInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ShowSearchInfoAction;
  v6 = [(ShowSearchInfoAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_searchInfo, a3);
  }

  return v7;
}

- (BOOL)isCompatibleWithNavigation
{
  v2 = +[MNNavigationService sharedService];
  BOOL v3 = 0;
  switch([v2 navigationTransportType])
  {
    case 1u:
    case 6u:
      goto LABEL_6;
    case 2u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      goto LABEL_5;
    case 3u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
      goto LABEL_5;
    default:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
LABEL_5:
      BOOL v3 = IsEnabled_Maps182;
LABEL_6:

      return v3;
  }
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 32;
}

- (SearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (void)setSearchInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end