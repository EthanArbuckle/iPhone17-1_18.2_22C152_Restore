@interface HomeAnalyticsManager
+ (void)_captureCuratedCollectionCarouselScrollAction:(int)a3;
+ (void)captureCuratedCollectionAction:(int)a3 withCollectionHandler:(id)a4 verticalIndex:(unint64_t)a5;
+ (void)captureCuratedCollectionCarouselScrollBackward;
+ (void)captureCuratedCollectionCarouselScrollForward;
+ (void)captureCuratedCollectionCarouselTapCollectionWithIdentifier:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5;
+ (void)captureDisplayActionWithEntry:(id)a3;
+ (void)captureDisplayActionWithFavorite:(id)a3;
+ (void)captureExploreGuidesTapAction;
+ (void)captureFeatureDiscoveryBannerDidAppear;
+ (void)captureMarkMyLocationAction;
+ (void)captureRAPAction;
+ (void)captureRatingRequestDiscoveryAction:(int)a3;
+ (void)captureRatingSuggestionTapAction;
+ (void)captureShareMyLocationAction;
+ (void)captureStateWithShortcuts:(id)a3;
+ (void)captureTapActionWithEntry:(id)a3;
+ (void)captureTapActionWithFavorite:(id)a3;
@end

@implementation HomeAnalyticsManager

+ (void)captureStateWithShortcuts:(id)a3
{
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (([v9 isShortcutForSetup] & 1) == 0)
        {
          if ([v9 type] == (id)1)
          {
            v10 = +[GEOAPSharedStateData sharedData];
            [v10 setMapFeatureIsHomeFavoriteSet:1];
          }
          if ([v9 type] == (id)2)
          {
            v11 = +[GEOAPSharedStateData sharedData];
            [v11 setMapFeatureIsWorkFavoriteSet:1];
          }
          if ([v9 type] == (id)19)
          {
            v12 = +[GEOAPSharedStateData sharedData];
            [v12 setMapFeatureIsSchoolFavoriteSet:1];
          }
          uint64_t v6 = (v6 + 1);
          if ([v9 type] == (id)22)
          {
            v13 = [v9 uniqueIdentifier];
            unsigned int v14 = [v13 isEqualToString:@"NearbyTransit"];

            if (v14)
            {
              v15 = +[GEOAPSharedStateData sharedData];
              [v15 setMapFeatureIsTransitFavoriteSet:1];
            }
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  v16 = +[GEOAPSharedStateData sharedData];
  [v16 setMapFeatureFavoritesCount:v6];
}

+ (void)captureDisplayActionWithFavorite:(id)a3
{
  id v3 = [a3 analyticsGrouping];
  +[GEOAPPortal captureUserAction:359 target:8 value:v3];
}

+ (void)captureCuratedCollectionAction:(int)a3 withCollectionHandler:(id)a4 verticalIndex:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 curatedCollectionIdentifier];
    v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 muid]);
    v10 = +[NSNumber numberWithUnsignedInteger:a5];
    +[GEOAPPortal captureCuratedCollectionUserAction:v6 target:8 value:0 publisherId:0 following:0 collectionId:v9 collectionCategory:0 collectionCurrentlySaved:&__kCFBooleanTrue verticalIndex:v10 horizontalIndex:0 placeCardType:0 possibleActions:0 impossibleActions:0 modules:0];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: [collectionHandler isKindOfClass:CuratedCollectionHandler.class]", buf, 2u);
  }
}

+ (void)captureCuratedCollectionCarouselTapCollectionWithIdentifier:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5
{
  BOOL v5 = a5;
  v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [a3 muid]);
  id v7 = +[NSNumber numberWithBool:v5];
  v8 = +[NSNumber numberWithInteger:a4];
  +[GEOAPPortal captureCuratedCollectionUserAction:2198 target:8 value:0 publisherId:0 following:0 collectionId:v9 collectionCategory:0 collectionCurrentlySaved:v7 verticalIndex:0 horizontalIndex:v8 placeCardType:0 possibleActions:0 impossibleActions:0 modules:0];
}

+ (void)_captureCuratedCollectionCarouselScrollAction:(int)a3
{
}

+ (void)captureCuratedCollectionCarouselScrollForward
{
}

+ (void)captureCuratedCollectionCarouselScrollBackward
{
}

+ (void)captureTapActionWithFavorite:(id)a3
{
  id v7 = a3;
  id v3 = [v7 analyticsGrouping];
  +[GEOAPPortal captureUserAction:2039 target:8 value:v3];

  switch((unint64_t)[v7 type])
  {
    case 1uLL:
    case 6uLL:
      id v4 = [v7 geoMapItem];
      BOOL v5 = [v4 _mapsCategoryId];

      +[GEOAPPortal captureUserAction:2049 target:8 value:v5];
      break;
    case 2uLL:
      if ([v7 isShortcutForSetup]) {
        uint64_t v6 = 2042;
      }
      else {
        uint64_t v6 = 2046;
      }
      goto LABEL_12;
    case 3uLL:
      if ([v7 isShortcutForSetup]) {
        uint64_t v6 = 2043;
      }
      else {
        uint64_t v6 = 2047;
      }
      goto LABEL_12;
    case 5uLL:
      if ([v7 isShortcutForSetup]) {
        uint64_t v6 = 2169;
      }
      else {
        uint64_t v6 = 84;
      }
LABEL_12:
      +[GEOAPPortal captureUserAction:v6 target:8 value:0];
      break;
    default:
      break;
  }
}

+ (void)captureTapActionWithEntry:(id)a3
{
  id v10 = a3;
  id v3 = [v10 analyticsGrouping];
  +[GEOAPPortal captureUserAction:2039 target:8 value:v3];

  id v4 = [v10 type];
  switch((unint64_t)v4)
  {
    case 0x12uLL:
      BOOL v5 = [v10 geoMapItem];
      uint64_t v6 = [v5 _mapsCategoryId];

      +[GEOAPPortal captureUserAction:2049 target:8 value:v6];
      goto LABEL_17;
    case 0x13uLL:
      if ([v10 isShortcutForSetup]) {
        uint64_t v7 = 2169;
      }
      else {
        uint64_t v7 = 84;
      }
      goto LABEL_16;
    case 0x14uLL:
      goto LABEL_17;
    case 0x15uLL:
      goto LABEL_10;
    case 0x16uLL:
      v8 = [v10 uniqueIdentifier];
      unsigned __int8 v9 = [v8 isEqualToString:@"NearbyTransit"];

      if (v9) {
        goto LABEL_17;
      }
LABEL_10:
      uint64_t v7 = 118;
      goto LABEL_16;
    default:
      if (v4 == (id)2)
      {
        if ([v10 isShortcutForSetup]) {
          uint64_t v7 = 2043;
        }
        else {
          uint64_t v7 = 2047;
        }
      }
      else
      {
        if (v4 != (id)1) {
          goto LABEL_17;
        }
        if ([v10 isShortcutForSetup]) {
          uint64_t v7 = 2042;
        }
        else {
          uint64_t v7 = 2046;
        }
      }
LABEL_16:
      +[GEOAPPortal captureUserAction:v7 target:8 value:0];
LABEL_17:

      return;
  }
}

+ (void)captureDisplayActionWithEntry:(id)a3
{
  id v3 = [a3 analyticsGrouping];
  +[GEOAPPortal captureUserAction:359 target:8 value:v3];
}

+ (void)captureRatingRequestDiscoveryAction:(int)a3
{
}

+ (void)captureRatingSuggestionTapAction
{
}

+ (void)captureFeatureDiscoveryBannerDidAppear
{
}

+ (void)captureExploreGuidesTapAction
{
}

+ (void)captureShareMyLocationAction
{
}

+ (void)captureMarkMyLocationAction
{
}

+ (void)captureRAPAction
{
}

@end