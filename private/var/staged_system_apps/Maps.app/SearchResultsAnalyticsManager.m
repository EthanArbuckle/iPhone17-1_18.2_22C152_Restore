@interface SearchResultsAnalyticsManager
+ (id)resultIdsWithDataSource:(id)a3;
+ (void)accessoryEntityTappedWithMuid:(unint64_t)a3 eventValue:(id)a4;
+ (void)addAPlaceTappedWithNumberOfResults:(unint64_t)a3 target:(int)a4;
+ (void)callButtonTappedOnSearchResultWithMuid:(unint64_t)a3;
+ (void)containmentParentUnitTappedWithMuid:(unint64_t)a3;
+ (void)curatedGuidesUnitTapped;
+ (void)didCloseCluster;
+ (void)didScrollPhotoCarouselToEnd;
+ (void)didScrollPhotoCarouselToLeft;
+ (void)didScrollPhotoCarouselToRight;
+ (void)didShowClusterWithDataSource:(id)a3 impressionsSessionIdentifier:(id)a4;
+ (void)didShowSearchResultsWithDataSource:(id)a3 target:(int)a4 query:(id)a5 impressionsSessionIdentifier:(id)a6;
+ (void)didTapOnAddStopForSearchResultWithMapItem:(id)a3 indexPath:(id)a4;
+ (void)didTapPhotoCarouselPhoto:(int64_t)a3;
+ (void)directionsButtonTappedOnSearchResultWithMuid:(unint64_t)a3;
+ (void)flyoverButtonTappedOnSearchResultWithMuid:(unint64_t)a3;
+ (void)logCloseSearchResults;
+ (void)logNoSearchResults:(int)a3;
+ (void)lookAroundButtonTappedOnSearchResultWithMuid:(unint64_t)a3;
+ (void)tappableEntryUnitTappedWithMuid:(unint64_t)a3;
+ (void)userGeneratedGuideUnitTapped;
+ (void)websiteButtonTappedOnSearchResultWithMuid:(unint64_t)a3;
@end

@implementation SearchResultsAnalyticsManager

+ (void)didTapOnAddStopForSearchResultWithMapItem:(id)a3 indexPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 _geoMapItem];
  +[GEOPlaceActionDetails actionDetailsWithMapItem:timestamp:resultIndex:](GEOPlaceActionDetails, "actionDetailsWithMapItem:timestamp:resultIndex:", v7, [v5 row], CFAbsoluteTimeGetCurrent());
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = +[MKMapService sharedService];
  id v9 = [v5 row];

  [v8 captureUserAction:6097 onTarget:58 placeActionDetails:v10 mapItem:v6 resultIndex:v9];
}

+ (void)userGeneratedGuideUnitTapped
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:198 onTarget:101 eventValue:@"PLACE_SUMMARY_LAYOUT_UNIT_TYPE_USER_GENERATED_GUIDES"];
}

+ (void)curatedGuidesUnitTapped
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:198 onTarget:101 eventValue:@"PLACE_SUMMARY_LAYOUT_UNIT_TYPE_CURATED_GUIDES"];
}

+ (void)containmentParentUnitTappedWithMuid:(unint64_t)a3
{
  id v5 = objc_alloc_init((Class)GEOPlaceActionDetails);
  [v5 setBusinessID:a3];
  v4 = +[MKMapService sharedService];
  [v4 captureUserAction:198 onTarget:101 eventValue:@"PLACE_SUMMARY_LAYOUT_UNIT_TYPE_CONTAINMENT" placeActionDetails:v5];
}

+ (void)tappableEntryUnitTappedWithMuid:(unint64_t)a3
{
  id v5 = objc_alloc_init((Class)GEOPlaceActionDetails);
  [v5 setBusinessID:a3];
  v4 = +[MKMapService sharedService];
  [v4 captureUserAction:198 onTarget:101 eventValue:@"PLACE_SUMMARY_LAYOUT_UNIT_TYPE_STRING" placeActionDetails:v5];
}

+ (void)accessoryEntityTappedWithMuid:(unint64_t)a3 eventValue:(id)a4
{
  id v5 = a4;
  id v9 = objc_alloc_init((Class)GEOPlaceActionDetails);
  [v9 setBusinessID:a3];
  id v6 = objc_alloc_init(SearchSessionAnalytics);
  [(SearchSessionAnalytics *)v6 setAction:2031];
  [(SearchSessionAnalytics *)v6 setTarget:101];
  v7 = +[SearchSessionAnalyticsAggregator sharedAggregator];
  [v7 collectSearchSessionAnalytics:v6];

  v8 = +[MKMapService sharedService];
  [v8 captureUserAction:[v6 action] onTarget:[v6 target] eventValue:v5 placeActionDetails:v9];
}

+ (void)directionsButtonTappedOnSearchResultWithMuid:(unint64_t)a3
{
}

+ (void)lookAroundButtonTappedOnSearchResultWithMuid:(unint64_t)a3
{
}

+ (void)callButtonTappedOnSearchResultWithMuid:(unint64_t)a3
{
}

+ (void)websiteButtonTappedOnSearchResultWithMuid:(unint64_t)a3
{
}

+ (void)flyoverButtonTappedOnSearchResultWithMuid:(unint64_t)a3
{
}

+ (void)didScrollPhotoCarouselToLeft
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:6048 onTarget:101 eventValue:0];
}

+ (void)didScrollPhotoCarouselToRight
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:6049 onTarget:101 eventValue:0];
}

+ (void)didTapPhotoCarouselPhoto:(int64_t)a3
{
  id v5 = +[MKMapService sharedService];
  v4 = +[NSString stringWithFormat:@"%ld", a3];
  [v5 captureUserAction:6006 onTarget:101 eventValue:v4];
}

+ (void)didScrollPhotoCarouselToEnd
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:459 onTarget:101 eventValue:0];
}

+ (void)didShowSearchResultsWithDataSource:(id)a3 target:(int)a4 query:(id)a5 impressionsSessionIdentifier:(id)a6
{
  id v9 = a3;
  id v25 = a5;
  id v10 = a6;
  v11 = [v9 content];
  v12 = [a1 resultIdsWithDataSource:v9];
  id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v11, "count"));
  if ((uint64_t)[v11 numberOfSections] >= 1)
  {
    uint64_t v14 = 0;
    do
    {
      if ((uint64_t)[v11 numberOfRowsInSection:v14] >= 1)
      {
        uint64_t v15 = 0;
        do
        {
          v16 = +[NSIndexPath indexPathForRow:v15 inSection:v14];
          v17 = [v9 placeSummaryTemplateAtIndexPath:v16];

          if (v17) {
            [v13 addObject:v17];
          }

          ++v15;
        }
        while (v15 < (uint64_t)[v11 numberOfRowsInSection:v14]);
      }
      ++v14;
    }
    while (v14 < (uint64_t)[v11 numberOfSections]);
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  v18 = +[GEOAPSharedStateData sharedData];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10069E34C;
  v30[3] = &unk_1012F46F0;
  v32 = &v33;
  id v19 = v11;
  id v31 = v19;
  [v18 populateSearchResultsForQuery:v25 searchResultSpecifierBlock:v30];

  v20 = +[GEOAPSharedStateData sharedData];
  [v20 populateImpressionObjectId:v10];

  v34[3] = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10069E478;
  v26[3] = &unk_1012F4718;
  v29 = &v33;
  id v21 = v19;
  id v27 = v21;
  id v22 = v13;
  id v28 = v22;
  +[GEOAPPortal capturePlaceSummaryUserAction:2015 target:a4 value:v12 placeSummarySpecifierBlock:v26];
  v23 = +[GEOAPSharedStateData sharedData];
  [v23 populateImpressionObjectId:0];

  _Block_object_dispose(&v33, 8);
}

+ (void)logNoSearchResults:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:418 onTarget:v3 eventValue:0];
}

+ (void)logCloseSearchResults
{
  id v2 = +[MKMapService sharedService];
  [v2 captureUserAction:2002 onTarget:101 eventValue:0];
}

+ (void)addAPlaceTappedWithNumberOfResults:(unint64_t)a3 target:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = +[NSString stringWithFormat:@"%lu", a3];
  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:222 onTarget:v4 eventValue:v6];
}

+ (void)didShowClusterWithDataSource:(id)a3 impressionsSessionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[GEOAPSharedStateData sharedData];
  [v8 populateImpressionObjectId:v6];

  id v9 = [a1 resultIdsWithDataSource:v7];

  +[GEOAPPortal captureUserAction:2015 target:105 value:v9];
  id v10 = +[GEOAPSharedStateData sharedData];
  [v10 populateImpressionObjectId:0];
}

+ (void)didCloseCluster
{
}

+ (id)resultIdsWithDataSource:(id)a3
{
  uint64_t v3 = [a3 content];
  uint64_t v4 = [v3 objects];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = objc_alloc((Class)NSMutableArray);
    id v7 = [v3 objects];
    id v8 = [v6 initWithCapacity:[v7 count]];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [v3 objects];
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) mapItem];
          uint64_t v15 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v14 _muid]);
          [v8 addObject:v15];
        }
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    id v5 = [v8 componentsJoinedByString:@", "];
  }

  return v5;
}

@end