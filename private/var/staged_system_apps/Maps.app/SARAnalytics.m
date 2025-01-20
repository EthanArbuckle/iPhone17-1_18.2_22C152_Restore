@interface SARAnalytics
+ (void)captureAddStopAnalyticsForTransportType:(int)a3;
+ (void)captureCancelSearchResults;
+ (void)captureListScrollDown;
+ (void)captureListScrollUp;
+ (void)captureListStartDetourToMapItem:(id)a3 index:(int64_t)a4;
+ (void)captureListTapToHideTray;
+ (void)captureListTapToShowTray;
+ (void)captureMapSelectMapItem:(id)a3;
+ (void)captureMapTapToHideTray;
+ (void)captureResumePreviousNavigation;
+ (void)captureSelectCategory:(id)a3 fromDisplayedCategories:(id)a4 isAddStopTray:(BOOL)a5;
+ (void)captureShowSearchResults:(id)a3;
@end

@implementation SARAnalytics

+ (void)captureAddStopAnalyticsForTransportType:(int)a3
{
  if (a3 == 3)
  {
    v3 = +[MKMapService sharedService];
    id v5 = v3;
    uint64_t v4 = 404;
  }
  else
  {
    if (a3) {
      return;
    }
    v3 = +[MKMapService sharedService];
    id v5 = v3;
    uint64_t v4 = 401;
  }
  [v3 captureUserAction:6097 onTarget:v4 eventValue:0];
}

+ (void)captureSelectCategory:(id)a3 fromDisplayedCategories:(id)a4 isAddStopTray:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v11 = +[MKMapService sharedService];
  if (v5) {
    uint64_t v9 = 742;
  }
  else {
    uint64_t v9 = 401;
  }
  v10 = [v8 displayString];
  [v11 captureUserAction:3005 onTarget:v9 eventValue:v10 categoriesDisplayed:v7 categorySelected:v8];
}

+ (void)captureShowSearchResults:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[MKMapService sharedService];
  id v5 = v3;
  if ([v5 count])
  {
    v6 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [NSNumber numberWithUnsignedLongLong:[*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) _muid]];
          [v6 addObject:v12];

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    v13 = [v6 componentsJoinedByString:@", "];
  }
  else
  {
    v13 = 0;
  }

  [v4 captureUserAction:2015 onTarget:104 eventValue:v13];
}

+ (void)captureCancelSearchResults
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:18 onTarget:104 eventValue:0];
}

+ (void)captureListScrollUp
{
  uint64_t v4 = objc_alloc_init(SearchSessionAnalytics);
  [(SearchSessionAnalytics *)v4 setAction:7];
  [(SearchSessionAnalytics *)v4 setTarget:104];
  id v2 = +[SearchSessionAnalyticsAggregator sharedAggregator];
  [v2 collectSearchSessionAnalytics:v4];

  id v3 = +[MKMapService sharedService];
  [v3 captureUserAction:[v4 action] onTarget:[v4 target] eventValue:0];
}

+ (void)captureListScrollDown
{
  uint64_t v4 = objc_alloc_init(SearchSessionAnalytics);
  [(SearchSessionAnalytics *)v4 setAction:8];
  [(SearchSessionAnalytics *)v4 setTarget:104];
  id v2 = +[SearchSessionAnalyticsAggregator sharedAggregator];
  [v2 collectSearchSessionAnalytics:v4];

  id v3 = +[MKMapService sharedService];
  [v3 captureUserAction:[self action] onTarget:[self target] eventValue:0];
}

+ (void)captureListTapToShowTray
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:1039 onTarget:104 eventValue:0];
}

+ (void)captureListTapToHideTray
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:1038 onTarget:104 eventValue:0];
}

+ (void)captureMapSelectMapItem:(id)a3
{
  id v3 = [a3 _geoMapItem];
  id v7 = +[GEOPlaceActionDetails actionDetailsWithMapItem:v3 timestamp:0xFFFFFFFFLL resultIndex:0.0];

  uint64_t v4 = objc_alloc_init(SearchSessionAnalytics);
  [(SearchSessionAnalytics *)v4 setAction:1017];
  [(SearchSessionAnalytics *)v4 setTarget:506];
  id v5 = +[SearchSessionAnalyticsAggregator sharedAggregator];
  [v5 collectSearchSessionAnalytics:v4];

  v6 = +[MKMapService sharedService];
  [v6 captureUserAction:[self action] onTarget:[self target] eventValue:0 placeActionDetails:v7];
}

+ (void)captureMapTapToHideTray
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:1038 onTarget:506 eventValue:0];
}

+ (void)captureListStartDetourToMapItem:(id)a3 index:(int64_t)a4
{
  id v5 = a3;
  v6 = [v5 _geoMapItem];
  id v13 = +[GEOPlaceActionDetails actionDetailsWithMapItem:v6 timestamp:a4 resultIndex:0.0];

  id v7 = +[MNNavigationService sharedService];
  switch([v7 navigationTransportType])
  {
    case 1u:
    case 6u:

      goto LABEL_8;
    case 2u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      goto LABEL_5;
    case 3u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
LABEL_5:
      char v9 = IsEnabled_Maps182;

      if (v9) {
        goto LABEL_6;
      }
      goto LABEL_8;
    default:
      int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();

      if (IsEnabled_DrivingMultiWaypointRoutes) {
LABEL_6:
      }
        uint64_t v10 = 6097;
      else {
LABEL_8:
      }
        uint64_t v10 = 3001;
      v12 = +[MKMapService sharedService];
      [v12 captureUserAction:v10 onTarget:104 placeActionDetails:v13 mapItem:v5 resultIndex:a4];

      return;
  }
}

+ (void)captureResumePreviousNavigation
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:3058 onTarget:616 eventValue:0];
}

@end