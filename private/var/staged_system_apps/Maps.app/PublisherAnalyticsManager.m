@interface PublisherAnalyticsManager
- (PublisherAnalyticsManager)initWithPublisherId:(id)a3 usingAttribution:(id)a4;
- (void)cleanUp;
- (void)logEvent;
- (void)publisherCollectionTapped:(id)a3 atIndex:(unint64_t)a4 isCurrentlySaved:(BOOL)a5;
- (void)publisherCollectionsScrolledDown;
- (void)publisherCollectionsScrolledUp;
- (void)publisherFilterTappedWithValue:(id)a3 atIndex:(unint64_t)a4;
- (void)publisherHeaderAppButtonTapped;
- (void)publisherHeaderCloseButtonTapped;
- (void)publisherHeaderShareButtonTapped;
- (void)publisherHeaderWebsiteButtonTapped;
- (void)publisherTrayRevealed;
- (void)publisherTryAgainTapped;
@end

@implementation PublisherAnalyticsManager

- (PublisherAnalyticsManager)initWithPublisherId:(id)a3 usingAttribution:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PublisherAnalyticsManager;
  v8 = [(PublisherAnalyticsManager *)&v13 init];
  v9 = v8;
  if (v8)
  {
    *(void *)&v8->event.target = 0xE00000105;
    v10 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:[v6 muid]];
    publisherId = v9->event.publisherId;
    v9->event.publisherId = v10;

    objc_storeStrong((id *)&v9->_attribution, a4);
  }

  return v9;
}

- (void)publisherTrayRevealed
{
  [(PublisherAnalyticsManager *)self cleanUp];
  self->event.action = 21;

  [(PublisherAnalyticsManager *)self logEvent];
}

- (void)publisherHeaderAppButtonTapped
{
  [(PublisherAnalyticsManager *)self cleanUp];
  self->event.action = 2103;
  id v6 = +[NSNumber numberWithInt:2170];
  v3 = [(GEOCollectionPublisherAttribution *)self->_attribution websiteURL];
  uint64_t v4 = 72;
  if (!v3) {
    uint64_t v4 = 80;
  }
  [*(id *)((char *)&self->super.isa + v4) addObject:v6];

  v5 = +[NSNumber numberWithInt:2097];
  [(NSMutableArray *)self->event.possibleActions addObject:v5];
  [(PublisherAnalyticsManager *)self logEvent];
}

- (void)publisherHeaderShareButtonTapped
{
  [(PublisherAnalyticsManager *)self cleanUp];
  self->event.action = 2097;
  id v8 = +[NSNumber numberWithInt:2103];
  v3 = [(GEOCollectionPublisherAttribution *)self->_attribution applicationAdamId];
  if (v3) {
    uint64_t v4 = 72;
  }
  else {
    uint64_t v4 = 80;
  }
  [*(id *)((char *)&self->super.isa + v4) addObject:v8];

  v5 = +[NSNumber numberWithInt:2170];
  id v6 = [(GEOCollectionPublisherAttribution *)self->_attribution websiteURL];
  if (v6) {
    uint64_t v7 = 72;
  }
  else {
    uint64_t v7 = 80;
  }
  [*(id *)((char *)&self->super.isa + v7) addObject:v5];

  [(PublisherAnalyticsManager *)self logEvent];
}

- (void)publisherHeaderWebsiteButtonTapped
{
  [(PublisherAnalyticsManager *)self cleanUp];
  self->event.action = 2170;
  id v6 = +[NSNumber numberWithInt:2103];
  v3 = [(GEOCollectionPublisherAttribution *)self->_attribution applicationAdamId];
  uint64_t v4 = 72;
  if (!v3) {
    uint64_t v4 = 80;
  }
  [*(id *)((char *)&self->super.isa + v4) addObject:v6];

  v5 = +[NSNumber numberWithInt:2097];
  [(NSMutableArray *)self->event.possibleActions addObject:v5];
  [(PublisherAnalyticsManager *)self logEvent];
}

- (void)publisherHeaderCloseButtonTapped
{
  [(PublisherAnalyticsManager *)self cleanUp];
  self->event.action = 4;

  [(PublisherAnalyticsManager *)self logEvent];
}

- (void)publisherCollectionsScrolledDown
{
  [(PublisherAnalyticsManager *)self cleanUp];
  self->event.action = 8;

  [(PublisherAnalyticsManager *)self logEvent];
}

- (void)publisherCollectionsScrolledUp
{
  [(PublisherAnalyticsManager *)self cleanUp];
  self->event.action = 7;

  [(PublisherAnalyticsManager *)self logEvent];
}

- (void)publisherFilterTappedWithValue:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = (NSString *)a3;
  [(PublisherAnalyticsManager *)self cleanUp];
  self->event.action = 49;
  value = self->event.value;
  self->event.value = v6;
  id v8 = v6;

  v9 = +[NSNumber numberWithUnsignedInteger:a4];
  horizontalIndex = self->event.horizontalIndex;
  self->event.horizontalIndex = v9;

  [(PublisherAnalyticsManager *)self logEvent];
}

- (void)publisherCollectionTapped:(id)a3 atIndex:(unint64_t)a4 isCurrentlySaved:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(PublisherAnalyticsManager *)self cleanUp];
  self->event.action = 2099;
  id v9 = [v8 muid];

  v10 = +[NSNumber numberWithUnsignedLongLong:v9];
  collectionId = self->event.collectionId;
  self->event.collectionId = v10;

  v12 = +[NSNumber numberWithBool:v5];
  collectionCurrentlySaved = self->event.collectionCurrentlySaved;
  self->event.collectionCurrentlySaved = v12;

  v14 = +[NSNumber numberWithUnsignedInteger:a4];
  verticalIndex = self->event.verticalIndex;
  self->event.verticalIndex = v14;

  [(PublisherAnalyticsManager *)self logEvent];
}

- (void)publisherTryAgainTapped
{
  [(PublisherAnalyticsManager *)self cleanUp];
  self->event.action = 2171;

  [(PublisherAnalyticsManager *)self logEvent];
}

- (void)logEvent
{
  uint64_t action = self->event.action;
  uint64_t target = self->event.target;
  value = self->event.value;
  publisherId = self->event.publisherId;
  id v6 = +[NSArray arrayWithObjects:&publisherId count:1];
  collectionId = self->event.collectionId;
  long long v10 = *(_OWORD *)&self->event.collectionCurrentlySaved;
  horizontalIndex = self->event.horizontalIndex;
  id v9 = +[NSNumber numberWithInt:self->event.cardType];
  +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:", action, target, value, v6, 0, collectionId, 0, v10, horizontalIndex, v9, self->event.possibleActions, self->event.impossibleActions, 0);
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

  long long v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  impossibleActions = self->event.impossibleActions;
  self->event.impossibleActions = v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);

  sub_1003B5EAC((uint64_t)&self->event);
}

@end