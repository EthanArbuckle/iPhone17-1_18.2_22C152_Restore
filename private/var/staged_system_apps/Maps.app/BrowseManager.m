@interface BrowseManager
+ (BOOL)alreadyHasCategoriesForTraits:(id)a3;
+ (BOOL)traitsIsForCurrentLocationOnly:(id)a3;
+ (id)nearbyCacheKeyForTraits:(id)a3;
+ (id)sharedContentCache:(id)a3;
+ (id)sharedManager;
+ (void)checkIfNearbyIsAvailableForTraits:(id)a3 completion:(id)a4;
+ (void)precacheCategoriesForCacheKey:(id)a3 withTraits:(id)a4 completion:(id)a5;
+ (void)prepareImagesForCacheKey:(id)a3 traits:(id)a4 completion:(id)a5;
+ (void)setCacheKey:(id)a3 writesToDisk:(BOOL)a4;
+ (void)updateMapRegionInTraits:(id)a3 withLocation:(id)a4;
- (BOOL)needToSendDisplayedUsage;
- (BOOL)needsRefresh;
- (BOOL)sharesCacheWithManager:(id)a3;
- (BrowseImageManager)imageManager;
- (BrowseManager)init;
- (BrowseManager)initWithCacheKey:(id)a3;
- (BrowseManagerContentCache)contentCache;
- (GEOMapServiceTraits)traits;
- (MapsUIImageCacheUserInterfaceDelegate)userInterfaceDelegate;
- (NSArray)cachedCategories;
- (NSHashTable)observers;
- (NSString)cacheKey;
- (id)cachedCategoriesForTraits:(id)a3;
- (id)cellImageForCategory:(id)a3;
- (id)searchForCategory:(id)a3 source:(int)a4 completion:(id)a5;
- (id)submitTicketForSearchForCategory:(id)a3 source:(int)a4 completion:(id)a5;
- (id)synchronousImageForCategory:(id)a3 scale:(double)a4 isCarplay:(BOOL)a5;
- (void)getBatchNearby;
- (void)getCategoriesFromSearchHome:(BOOL)a3 completion:(id)a4;
- (void)getCategoriesWithCompletion:(id)a3;
- (void)imageForCategory:(id)a3 scale:(double)a4 isCarplay:(BOOL)a5 resultHandler:(id)a6;
- (void)imageForCategory:(id)a3 scale:(double)a4 resultHandler:(id)a5;
- (void)preCacheWithTraits:(id)a3;
- (void)readCategoriesFromDiskIfNeeded;
- (void)setCacheKey:(id)a3;
- (void)setContentCache:(id)a3;
- (void)setImageManager:(id)a3;
- (void)setNeedToSendDisplayedUsage:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setTraits:(id)a3;
- (void)setUserInterfaceDelegate:(id)a3;
- (void)submitBrowseUsageIfNeeded;
@end

@implementation BrowseManager

- (void)setUserInterfaceDelegate:(id)a3
{
  p_userInterfaceDelegate = &self->_userInterfaceDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_userInterfaceDelegate, v5);
  [(BrowseImageManager *)self->_imageManager setUserInterfaceDelegate:v5];
}

+ (id)sharedContentCache:(id)a3
{
  v3 = (__CFString *)a3;
  if (qword_10160FF70 != -1) {
    dispatch_once(&qword_10160FF70, &stru_101300350);
  }
  v4 = @"BrowseManagerDefaultContentCache";
  if (v3) {
    v4 = v3;
  }
  id v5 = v4;
  v6 = [(id)qword_10160FF68 objectForKeyedSubscript:v5];
  if (!v6)
  {
    v6 = objc_opt_new();
    [v6 setNeedsRefresh:1];
    [v6 setDiskCachingKey:v3];
    [(id)qword_10160FF68 setObject:v6 forKeyedSubscript:v5];
  }

  return v6;
}

- (BrowseManager)initWithCacheKey:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BrowseManager;
  v6 = [(BrowseManager *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cacheKey, a3);
    uint64_t v8 = [(id)objc_opt_class() sharedContentCache:v5];
    contentCache = v7->_contentCache;
    v7->_contentCache = (BrowseManagerContentCache *)v8;

    uint64_t v10 = [(BrowseManagerContentCache *)v7->_contentCache latestTraits];
    traits = v7->_traits;
    v7->_traits = (GEOMapServiceTraits *)v10;

    uint64_t v12 = +[NSHashTable weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v12;
  }
  return v7;
}

- (BrowseManager)init
{
  return [(BrowseManager *)self initWithCacheKey:0];
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001096B0;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160FF80 != -1) {
    dispatch_once(&qword_10160FF80, block);
  }
  v2 = (void *)qword_10160FF78;

  return v2;
}

- (void)imageForCategory:(id)a3 scale:(double)a4 resultHandler:(id)a5
{
}

- (void)imageForCategory:(id)a3 scale:(double)a4 isCarplay:(BOOL)a5 resultHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  id v13 = [(BrowseManager *)self imageManager];
  uint64_t v12 = [(BrowseManager *)self traits];
  [v13 imageForCategory:v11 scale:v12 traits:v6 isCarplay:v10 resultHandler:a4];
}

- (id)synchronousImageForCategory:(id)a3 scale:(double)a4 isCarplay:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [(BrowseManager *)self imageManager];
  id v10 = [(BrowseManager *)self traits];
  id v11 = [v9 synchronousImageForCategory:v8 scale:v10 traits:v5 isCarplay:a4];

  return v11;
}

- (BOOL)sharesCacheWithManager:(id)a3
{
  v4 = [a3 cacheKey];
  BOOL v5 = [(BrowseManager *)self cacheKey];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  return v6;
}

- (void)setCacheKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = (NSString *)[v4 copy];
  cacheKey = self->_cacheKey;
  self->_cacheKey = v5;

  v7 = [(id)objc_opt_class() sharedContentCache:v4];

  contentCache = self->_contentCache;
  self->_contentCache = v7;

  v9 = [(BrowseManagerContentCache *)self->_contentCache latestTraits];
  traits = self->_traits;
  self->_traits = v9;
}

+ (void)setCacheKey:(id)a3 writesToDisk:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [(id)objc_opt_class() sharedContentCache:v5];

  [v6 setWritesToDisk:v4];
}

- (BrowseImageManager)imageManager
{
  imageManager = self->_imageManager;
  if (!imageManager)
  {
    BOOL v4 = (BrowseImageManager *)objc_opt_new();
    id v5 = self->_imageManager;
    self->_imageManager = v4;

    [(BrowseImageManager *)self->_imageManager setBrowseManager:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
    [(BrowseImageManager *)self->_imageManager setUserInterfaceDelegate:WeakRetained];

    imageManager = self->_imageManager;
  }

  return imageManager;
}

- (void)setImageManager:(id)a3
{
  id v5 = (BrowseImageManager *)a3;
  if (self->_imageManager != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_imageManager, a3);
    [(BrowseImageManager *)self->_imageManager setBrowseManager:self];
    id v5 = v6;
  }
}

+ (BOOL)traitsIsForCurrentLocationOnly:(id)a3
{
  v3 = [a3 mapRegion];
  BOOL v4 = v3 == 0;

  return v4;
}

+ (id)nearbyCacheKeyForTraits:(id)a3
{
  return 0;
}

+ (BOOL)alreadyHasCategoriesForTraits:(id)a3
{
  id v4 = a3;
  id v5 = [BrowseManager alloc];
  id v6 = [a1 nearbyCacheKeyForTraits:v4];
  v7 = [(BrowseManager *)v5 initWithCacheKey:v6];

  id v8 = [(BrowseManager *)v7 cachedCategoriesForTraits:v4];

  LOBYTE(v4) = [v8 count] != 0;
  return (char)v4;
}

+ (void)checkIfNearbyIsAvailableForTraits:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1008FA7AC;
  v20[3] = &unk_1012EB5B8;
  id v23 = a1;
  id v8 = v6;
  id v21 = v8;
  id v9 = v7;
  id v22 = v9;
  id v10 = objc_retainBlock(v20);
  id v11 = [v8 mapRegion];
  if (v11)
  {
  }
  else
  {
    uint64_t v12 = [v8 deviceLocation];

    if (!v12)
    {
      id v13 = +[MKLocationManager sharedLocationManager];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1008FA9D0;
      v15[3] = &unk_101300378;
      id v17 = v9;
      id v19 = a1;
      id v16 = v8;
      v18 = v10;
      v14 = [v13 singleLocationUpdateWithDesiredAccuracy:v15 handler:kCLLocationAccuracyThreeKilometers timeout:30.0];

      [v14 start];
      goto LABEL_5;
    }
  }
  ((void (*)(void *))v10[2])(v10);
LABEL_5:
}

+ (void)updateMapRegionInTraits:(id)a3 withLocation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 coordinate];
  MKMapPoint v7 = MKMapPointForCoordinate(v17);
  double v8 = v7.y + -75.0;
  double v9 = v7.y + 75.0;
  if (v7.y + -75.0 >= 0.0)
  {
    double height = MKMapSizeWorld.height;
    if (v9 > height) {
      double v8 = v8 + height - v9;
    }
  }
  else
  {
    double v9 = v9 - v8;
    double height = MKMapSizeWorld.height;
  }
  double v12 = fmax(v8, 0.0);
  if (v9 >= height) {
    double v13 = height;
  }
  else {
    double v13 = v9;
  }
  double v11 = v7.x + 75.0;
  id v15 = [objc_alloc((Class)GEOMapRegion) initWithMapRect:v7.x + -75.0, v12, v11 - (v7.x + -75.0), v13 - v12];
  [v6 setMapRegion:v15];
  id v14 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v5];

  [v6 setDeviceLocation:v14];
}

- (id)searchForCategory:(id)a3 source:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (a5)
  {
    id v9 = a5;
    id v10 = [(BrowseManager *)self traits];
    [v10 setSource:v6];

    double v11 = [(BrowseManager *)self contentCache];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1008FAD28;
    v18[3] = &unk_1013003A0;
    id v12 = v8;
    id v19 = v12;
    [v11 updateCacheWithBlock:v18];

    double v13 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
    id v14 = [(BrowseManager *)self traits];
    id v15 = [v13 updatedTraitsForCurrentGarageState:v14];
    [(BrowseManager *)self setTraits:v15];

    id v16 = [(BrowseManager *)self submitTicketForSearchForCategory:v12 source:v6 completion:v9];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)submitTicketForSearchForCategory:(id)a3 source:(int)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(BrowseManager *)self traits];
  unsigned int v10 = [v9 navigating];

  if (v10)
  {
    double v11 = [NavigationRouteHistoryInfoProvider alloc];
    id v12 = +[MNNavigationService sharedService];
    double v13 = [(NavigationRouteHistoryInfoProvider *)v11 initWithNavigationService:v12];

    id v31 = v8;
    id v14 = +[MKMapService sharedService];
    [(NavigationRouteHistoryInfoProvider *)v13 originalWaypointRouteRepresentation];
    id v15 = v32 = self;
    id v16 = [(NavigationRouteHistoryInfoProvider *)v13 legacyRouteRepresentation];
    CLLocationCoordinate2D v17 = [(NavigationRouteHistoryInfoProvider *)v13 sessionState];
    v18 = [(NavigationRouteHistoryInfoProvider *)v13 routeId];
    id v19 = [(NavigationRouteHistoryInfoProvider *)v13 routeAttributes];
    unsigned int v20 = +[MKMapService searchMaxResults];
    id v21 = [(BrowseManager *)v32 traits];
    LODWORD(v30) = v20;
    id v22 = [v14 ticketForSearchAlongRouteWithCategory:v7 searchQuery:0 completionItem:0 originalWaypointRouteData:v15 zilchData:v16 sessionState:v17 routeId:v18 routeAttributes:v19 maxResults:v30 traits:v21 searchSessionData:0];

    id v8 = v31;
    self = v32;
  }
  else
  {
    double v13 = +[MKMapService sharedService];
    uint64_t v23 = +[MKMapService searchMaxResults];
    id v14 = [(BrowseManager *)self traits];
    id v22 = [(NavigationRouteHistoryInfoProvider *)v13 ticketForCategory:v7 maxResults:v23 traits:v14 searchSessionData:0];
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1008FB014;
  v33[3] = &unk_1013003C8;
  id v37 = v8;
  id v24 = v22;
  id v34 = v24;
  v35 = self;
  id v36 = v7;
  id v25 = v7;
  id v26 = v8;
  [v24 submitWithRefinedHandler:v33 networkActivity:0];
  v27 = v36;
  id v28 = v24;

  return v28;
}

- (BOOL)needsRefresh
{
  v2 = [(BrowseManager *)self contentCache];
  unsigned __int8 v3 = [v2 needsRefresh];

  return v3;
}

- (id)cellImageForCategory:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(BrowseManager *)self imageManager];
    uint64_t v6 = [v5 transparentImageForCategory:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)setTraits:(id)a3
{
  id v4 = a3;
  id v5 = [(BrowseManager *)self contentCache];
  [v5 setLatestTraits:v4];

  id v9 = [(BrowseManager *)self contentCache];
  uint64_t v6 = [v9 latestTraits];
  id v7 = (GEOMapServiceTraits *)[v6 copy];
  traits = self->_traits;
  self->_traits = v7;
}

- (void)readCategoriesFromDiskIfNeeded
{
  id v2 = [(BrowseManager *)self contentCache];
  [v2 readCategoriesFromDiskIfNeeded];
}

+ (void)prepareImagesForCacheKey:(id)a3 traits:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v30 = v9;
  id v11 = [v9 hasCarHeadunitInteractionModel];
  double v12 = 0.0;
  if (v11)
  {
    double v13 = +[CarDisplayController sharedInstance];
    id v14 = [v13 screenTraitCollection];
    [v14 displayScale];
    double v12 = v15;
  }
  id v16 = [a1 sharedContentCache:v8];
  [v16 readCategoriesFromDiskIfNeeded];
  CLLocationCoordinate2D v17 = [v16 categories];
  if ([v17 count])
  {
    v27 = v10;
    id v28 = v8;
    v18 = dispatch_group_create();
    id v19 = objc_alloc_init(BrowseImageManager);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v26 = v17;
    id obj = v17;
    id v20 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v37;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          dispatch_group_enter(v18);
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_1008FB6BC;
          v34[3] = &unk_1012F3FB8;
          v35 = v18;
          [(BrowseImageManager *)v19 imageForCategory:v24 scale:v30 traits:v11 isCarplay:v34 resultHandler:v12];
        }
        id v21 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v21);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1008FB6C4;
    block[3] = &unk_1012E76E8;
    v32 = v19;
    id v10 = v27;
    id v33 = v27;
    id v25 = v19;
    dispatch_group_notify(v18, (dispatch_queue_t)&_dispatch_main_q, block);

    id v8 = v28;
    CLLocationCoordinate2D v17 = v26;
  }
}

+ (void)precacheCategoriesForCacheKey:(id)a3 withTraits:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  id v11 = [a1 sharedContentCache:v8];
  [v11 readCategoriesFromDiskIfNeeded];
  double v12 = [v11 categories];
  id v13 = [v12 count];

  if (v13)
  {
    if (v10) {
      v10[2](v10, 1);
    }
  }
  else
  {
    id v14 = [[BrowseManager alloc] initWithCacheKey:v8];
    [(BrowseManager *)v14 setTraits:v9];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1008FB81C;
    v15[3] = &unk_1012E7710;
    id v16 = v10;
    [(BrowseManager *)v14 getCategoriesWithCompletion:v15];
  }
}

- (void)preCacheWithTraits:(id)a3
{
  id v4 = a3;
  [(BrowseManager *)self cacheKey];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1008FB9B8;
  v13[3] = &unk_1012E66E0;
  v13[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v5;
  id v6 = v4;
  id v15 = v6;
  id v7 = objc_retainBlock(v13);
  id v8 = [(BrowseManager *)self cachedCategories];
  id v9 = [v8 count];

  if (v9)
  {
    ((void (*)(void *))v7[2])(v7);
  }
  else
  {
    id v10 = objc_opt_class();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1008FB9F8;
    v11[3] = &unk_1012EAFC0;
    double v12 = v7;
    [v10 precacheCategoriesForCacheKey:v5 withTraits:v6 completion:v11];
  }
}

- (void)getCategoriesWithCompletion:(id)a3
{
}

- (void)getCategoriesFromSearchHome:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  self->_needToSendDisplayedUsage = 1;
  id v7 = [(BrowseManager *)self contentCache];
  if ([v7 needsRefresh])
  {
  }
  else
  {
    id v8 = [(BrowseManager *)self cachedCategories];
    id v9 = [v8 count];

    if (v9)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1008FBD14;
      block[3] = &unk_1012E5F78;
      void block[4] = self;
      id v24 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_8;
    }
  }
  unint64_t v10 = self->_requestCount + 1;
  self->_requestCount = v10;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = v10;
  id v11 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager];
  double v12 = [(BrowseManager *)self traits];
  id v13 = [v11 updatedTraitsForCurrentGarageState:v12];
  [(BrowseManager *)self setTraits:v13];

  id v14 = +[MKMapService sharedService];
  id v15 = [(BrowseManager *)self traits];
  id v16 = [v14 ticketForCategoryListWithTraits:v15 isFromNoQueryState:v4];

  CLLocationCoordinate2D v17 = sub_1008F8168();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = [(BrowseManager *)self traits];
    *(_DWORD *)buf = 138412546;
    id v26 = v18;
    __int16 v27 = 2112;
    id v28 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "The category request is made with the traits: %@ and ticket: %@", buf, 0x16u);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1008FBD74;
  v19[3] = &unk_1013003F0;
  id v21 = v22;
  v19[4] = self;
  id v20 = v6;
  [v16 submitWithHandler:v19 networkActivity:0];

  _Block_object_dispose(v22, 8);
LABEL_8:
}

- (id)cachedCategoriesForTraits:(id)a3
{
  [(BrowseManager *)self setTraits:a3];
  BOOL v4 = [(BrowseManager *)self contentCache];
  unsigned __int8 v5 = [v4 needsRefresh];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(BrowseManager *)self cachedCategories];
  }

  return v6;
}

- (void)getBatchNearby
{
  unsigned __int8 v3 = [(BrowseManager *)self contentCache];
  unsigned int v4 = [v3 needsRefresh];

  if (v4)
  {
    unsigned __int8 v5 = [(BrowseManager *)self contentCache];
    [v5 setNeedsRefresh:0];

    id v6 = [(BrowseManager *)self contentCache];
    [v6 updateCacheWithBlock:&stru_101300430];
  }
}

- (NSArray)cachedCategories
{
  id v2 = [(BrowseManager *)self contentCache];
  unsigned __int8 v3 = [v2 categories];

  return (NSArray *)v3;
}

- (void)submitBrowseUsageIfNeeded
{
  id v4 = [(BrowseManager *)self cachedCategories];
  if ([v4 count])
  {
    unsigned int v3 = [(BrowseManager *)self needToSendDisplayedUsage];

    if (v3)
    {
      +[GEOAPPortal captureUserAction:17010 target:0 value:0];
      [(BrowseManager *)self setNeedToSendDisplayedUsage:0];
    }
  }
  else
  {
  }
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)needToSendDisplayedUsage
{
  return self->_needToSendDisplayedUsage;
}

- (void)setNeedToSendDisplayedUsage:(BOOL)a3
{
  self->_needToSendDisplayedUsage = a3;
}

- (MapsUIImageCacheUserInterfaceDelegate)userInterfaceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);

  return (MapsUIImageCacheUserInterfaceDelegate *)WeakRetained;
}

- (BrowseManagerContentCache)contentCache
{
  return self->_contentCache;
}

- (void)setContentCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentCache, 0);
  objc_destroyWeak((id *)&self->_userInterfaceDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);

  objc_storeStrong((id *)&self->_imageManager, 0);
}

@end