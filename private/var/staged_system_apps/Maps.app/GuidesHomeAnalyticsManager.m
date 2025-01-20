@interface GuidesHomeAnalyticsManager
- (GuidesHomeAnalyticsManager)initWithGuideLocationId:(id)a3 isCuratedGuidesHome:(BOOL)a4;
- (void)cleanUp;
- (void)guideHomeTappedFilter:(id)a3 atIndex:(unint64_t)a4 carouselIndex:(unint64_t)a5;
- (void)guidesHomeCityGuidesMoreButtonTapped;
- (void)guidesHomeCitySelectorTapped;
- (void)guidesHomeClosed;
- (void)guidesHomeDisplayFilteredGuideList:(id)a3;
- (void)guidesHomeRevealed;
- (void)guidesHomeScrolledDown;
- (void)guidesHomeScrolledUp;
- (void)guidesHomeTappedCityGuide:(id)a3 atIndex:(unint64_t)a4 carouselIndex:(unint64_t)a5;
- (void)guidesHomeTappedEditorPickedGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5 atIndex:(unint64_t)a6 carouselIndex:(unint64_t)a7;
- (void)guidesHomeTappedFeaturedGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5;
- (void)guidesHomeTappedFilteredGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5 atIndex:(unint64_t)a6 carouselIndex:(unint64_t)a7 filterValue:(id)a8;
- (void)guidesHomeTappedLatestGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5 atIndex:(unint64_t)a6 carouselIndex:(unint64_t)a7;
- (void)guidesHomeTappedPublisher:(id)a3 atIndex:(unint64_t)a4 carouselIndex:(unint64_t)a5;
- (void)guidesHomeTappedTemporalGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5 atIndex:(unint64_t)a6 carouselIndex:(unint64_t)a7;
- (void)logEvent;
- (void)updateAnalyticsManagerWithGuideLocationId:(id)a3 isCuratedGuidesHome:(BOOL)a4;
@end

@implementation GuidesHomeAnalyticsManager

- (GuidesHomeAnalyticsManager)initWithGuideLocationId:(id)a3 isCuratedGuidesHome:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GuidesHomeAnalyticsManager;
  v7 = [(GuidesHomeAnalyticsManager *)&v11 init];
  if (v7)
  {
    uint64_t v8 = geo_dispatch_queue_create_with_qos();
    utilityQueue = v7->_utilityQueue;
    v7->_utilityQueue = (OS_dispatch_queue *)v8;

    v7->event.cardType = 14;
    [(GuidesHomeAnalyticsManager *)v7 updateAnalyticsManagerWithGuideLocationId:v6 isCuratedGuidesHome:v4];
  }

  return v7;
}

- (void)updateAnalyticsManagerWithGuideLocationId:(id)a3 isCuratedGuidesHome:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (GEOMapItemIdentifier *)a3;
  guideLocationId = self->_guideLocationId;
  if (guideLocationId == v7) {
    goto LABEL_12;
  }
  v9 = sub_10057611C();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (guideLocationId)
  {
    if (v10)
    {
      int v13 = 138412290;
      v14 = v7;
      objc_super v11 = "GuidesHomeAnalyticsManager *refreshed* to report analytics for : %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v13, 0xCu);
    }
  }
  else if (v10)
  {
    int v13 = 138412290;
    v14 = v7;
    objc_super v11 = "GuidesHomeAnalyticsManager initialized to report analytics for : %@";
    goto LABEL_7;
  }

  objc_storeStrong((id *)&self->_guideLocationId, a3);
  self->_isCuratedGuidesHome = v4;
  if (v4) {
    int v12 = 19;
  }
  else {
    int v12 = 28;
  }
  self->event.target = v12;
LABEL_12:
}

- (void)guidesHomeTappedFeaturedGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1009B4768;
  v13[3] = &unk_1012E7B88;
  objc_copyWeak(&v16, &location);
  v13[4] = self;
  id v14 = v8;
  BOOL v17 = a5;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(utilityQueue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)guidesHomeCitySelectorTapped
{
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009B4950;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)guidesHomeCityGuidesMoreButtonTapped
{
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009B4AB8;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)guidesHomeRevealed
{
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009B4C18;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)guidesHomeTappedCityGuide:(id)a3 atIndex:(unint64_t)a4 carouselIndex:(unint64_t)a5
{
  id v8 = a3;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009B4E18;
  v11[3] = &unk_101313038;
  objc_copyWeak(v13, &location);
  v11[4] = self;
  id v12 = v8;
  v13[1] = (id)a4;
  v13[2] = (id)a5;
  id v10 = v8;
  dispatch_async(utilityQueue, v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)guidesHomeTappedPublisher:(id)a3 atIndex:(unint64_t)a4 carouselIndex:(unint64_t)a5
{
  id v8 = a3;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009B5050;
  v11[3] = &unk_101313038;
  objc_copyWeak(v13, &location);
  v11[4] = self;
  id v12 = v8;
  v13[1] = (id)a4;
  v13[2] = (id)a5;
  id v10 = v8;
  dispatch_async(utilityQueue, v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)guidesHomeTappedLatestGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5 atIndex:(unint64_t)a6 carouselIndex:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1009B52B0;
  v17[3] = &unk_101313060;
  objc_copyWeak(v20, &location);
  v17[4] = self;
  id v18 = v12;
  BOOL v21 = a5;
  id v19 = v13;
  v20[1] = (id)a6;
  v20[2] = (id)a7;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(utilityQueue, v17);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

- (void)guidesHomeTappedTemporalGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5 atIndex:(unint64_t)a6 carouselIndex:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1009B5530;
  v17[3] = &unk_101313060;
  objc_copyWeak(v20, &location);
  v17[4] = self;
  id v18 = v12;
  BOOL v21 = a5;
  id v19 = v13;
  v20[1] = (id)a6;
  v20[2] = (id)a7;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(utilityQueue, v17);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

- (void)guidesHomeTappedEditorPickedGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5 atIndex:(unint64_t)a6 carouselIndex:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1009B57B0;
  v17[3] = &unk_101313060;
  objc_copyWeak(v20, &location);
  v17[4] = self;
  id v18 = v12;
  BOOL v21 = a5;
  id v19 = v13;
  v20[1] = (id)a6;
  v20[2] = (id)a7;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(utilityQueue, v17);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

- (void)guideHomeTappedFilter:(id)a3 atIndex:(unint64_t)a4 carouselIndex:(unint64_t)a5
{
  id v8 = a3;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009B59FC;
  v11[3] = &unk_101313038;
  objc_copyWeak(v13, &location);
  v11[4] = self;
  id v12 = v8;
  v13[1] = (id)a4;
  v13[2] = (id)a5;
  id v10 = v8;
  dispatch_async(utilityQueue, v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)guidesHomeDisplayFilteredGuideList:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009B5BC8;
  v7[3] = &unk_1012E9340;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(utilityQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)guidesHomeTappedFilteredGuide:(id)a3 publisherId:(id)a4 isCurrentlySaved:(BOOL)a5 atIndex:(unint64_t)a6 carouselIndex:(unint64_t)a7 filterValue:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009B5F18;
  block[3] = &unk_1013130B0;
  objc_copyWeak(v25, &location);
  block[4] = self;
  id v22 = v14;
  BOOL v26 = a5;
  v25[1] = (id)a6;
  v25[2] = (id)a7;
  id v23 = v15;
  id v24 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(utilityQueue, block);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

- (void)guidesHomeScrolledUp
{
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009B6144;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)guidesHomeScrolledDown
{
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009B62A4;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)guidesHomeClosed
{
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009B6404;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)logEvent
{
  uint64_t action = self->event.action;
  uint64_t target = self->event.target;
  value = self->event.value;
  publisherId = self->event.publisherId;
  if (publisherId)
  {
    id v12 = self->event.publisherId;
    v7 = +[NSArray arrayWithObjects:&v12 count:1];
  }
  else
  {
    v7 = 0;
  }
  collectionId = self->event.collectionId;
  long long v11 = *(_OWORD *)&self->event.collectionCurrentlySaved;
  horizontalIndex = self->event.horizontalIndex;
  id v10 = +[NSNumber numberWithInt:self->event.cardType];
  +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:providerId:repeatableSectionIndex:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:providerId:repeatableSectionIndex:modules:", action, target, value, v7, 0, collectionId, 0, v11, horizontalIndex, v10, self->event.possibleActions, self->event.impossibleActions, self->event.providerId, self->event.repeatableIndex, 0);

  if (publisherId) {
}
  }

- (void)cleanUp
{
  self->event.uint64_t action = 0;
  value = self->event.value;
  self->event.value = 0;

  collectionId = self->event.collectionId;
  self->event.collectionId = 0;

  collectionCurrentlySaved = self->event.collectionCurrentlySaved;
  self->event.collectionCurrentlySaved = 0;

  verticalIndex = self->event.verticalIndex;
  self->event.verticalIndex = 0;

  horizontalIndex = self->event.horizontalIndex;
  self->event.horizontalIndex = 0;

  id v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  possibleActions = self->event.possibleActions;
  self->event.possibleActions = v8;

  id v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  impossibleActions = self->event.impossibleActions;
  self->event.impossibleActions = v10;

  repeatableIndex = self->event.repeatableIndex;
  self->event.repeatableIndex = 0;

  providerId = self->event.providerId;
  self->event.providerId = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilityQueue, 0);
  objc_storeStrong((id *)&self->_guideLocationId, 0);

  impossibleActions = self->event.impossibleActions;
}

@end