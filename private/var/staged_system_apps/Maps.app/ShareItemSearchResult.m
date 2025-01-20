@interface ShareItemSearchResult
- (BOOL)includePrintActivity;
- (CNContact)contact;
- (GEOComposedRoute)route;
- (NSArray)activityProviders;
- (NSArray)applicationActivities;
- (NSArray)excludedActivityTypes;
- (NSArray)includedActivityTypes;
- (NSData)pushSubmissionData;
- (SearchResult)searchResult;
- (ShareItemSearchResult)initWithSearchResult:(id)a3 contact:(id)a4 includePrintActivity:(BOOL)a5 applicationActivities:(id)a6;
- (id)mapItem;
- (void)_setupCustomFeatureForMapItem;
- (void)_setupCustomFeatureStore;
- (void)setActivityProviderDelegate:(id)a3;
@end

@implementation ShareItemSearchResult

- (ShareItemSearchResult)initWithSearchResult:(id)a3 contact:(id)a4 includePrintActivity:(BOOL)a5 applicationActivities:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ShareItemSearchResult;
  v13 = [(ShareItemSearchResult *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_extraAppActivities, a6);
    v15 = (SearchResult *)[v10 copy];
    searchResult = v14->_searchResult;
    v14->_searchResult = v15;

    objc_storeStrong((id *)&v14->_contact, a4);
    v14->_includePrintActivity = a5;
    objc_storeStrong((id *)&v14->_extraAppActivities, a6);
    v17 = v14;
  }

  return v14;
}

- (NSArray)activityProviders
{
  activityProviders = self->_activityProviders;
  if (!activityProviders)
  {
    v4 = [(ShareItemSearchResult *)self mapItem];
    id v5 = [objc_alloc((Class)MUPlaceTextActivityProvider) initWithMapItem:v4];
    id v6 = [objc_alloc((Class)MUPlaceURLActivityProvider) initWithMapItem:v4];
    id v7 = [objc_alloc((Class)MUPlaceMapItemActivityProvider) initWithMapItem:v4];
    id v8 = [objc_alloc((Class)MUPlaceLinkPresentationActivityProvider) initWithMapItem:v4];
    v12[0] = v5;
    v12[1] = v6;
    v12[2] = v7;
    v12[3] = v8;
    v9 = +[NSArray arrayWithObjects:v12 count:4];
    id v10 = self->_activityProviders;
    self->_activityProviders = v9;

    activityProviders = self->_activityProviders;
  }

  return activityProviders;
}

- (void)setActivityProviderDelegate:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(ShareItemSearchResult *)self activityProviders];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setDelegate:v4];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSArray)applicationActivities
{
  v3 = +[NSMutableArray array];
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)5)
  {
    id v6 = [(ShareItemSearchResult *)self pushSubmissionData];
    if (v6)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = +[MapsPushManager defaultManager];
      uint64_t v8 = [v7 devices];

      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = [[PushToDeviceActivity alloc] initWithDevice:*(void *)(*((void *)&v17 + 1) + 8 * i) place:self];
            [v3 addObject:v13];
          }
          id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }
    }
  }
  if ([(ShareItemSearchResult *)self includePrintActivity])
  {
    v14 = objc_alloc_init(MapsPrintActivity);
    [v3 addObject:v14];
  }
  if ([(NSArray *)self->_extraAppActivities count]) {
    [v3 addObjectsFromArray:self->_extraAppActivities];
  }
  id v15 = [v3 copy];

  return (NSArray *)v15;
}

- (NSArray)excludedActivityTypes
{
  UIActivityType v4 = UIActivityTypeAddToReadingList;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (NSArray)includedActivityTypes
{
  return 0;
}

- (id)mapItem
{
  v2 = [(ShareItemSearchResult *)self searchResult];
  v3 = [v2 mapItem];

  return v3;
}

- (void)_setupCustomFeatureStore
{
  v3 = (_MKCustomFeatureStore *)[objc_alloc((Class)_MKCustomFeatureStore) initWithClustering:0];
  customFeatureStore = self->_customFeatureStore;
  self->_customFeatureStore = v3;
}

- (void)_setupCustomFeatureForMapItem
{
  v3 = [(ShareItemSearchResult *)self mapItem];
  UIActivityType v4 = +[_ShareCustomFeature customFeatureForMapItem:v3];
  shareCustomFeature = self->_shareCustomFeature;
  self->_shareCustomFeature = v4;

  customFeatureStore = self->_customFeatureStore;
  uint64_t v8 = self->_shareCustomFeature;
  id v7 = +[NSArray arrayWithObjects:&v8 count:1];
  [(_MKCustomFeatureStore *)customFeatureStore addAnnotations:v7];
}

- (GEOComposedRoute)route
{
  return 0;
}

- (NSData)pushSubmissionData
{
  v2 = [(SearchResult *)self->_searchResult bookmarkRepresentation];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (CNContact)contact
{
  return self->_contact;
}

- (BOOL)includePrintActivity
{
  return self->_includePrintActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_activityProviders, 0);
  objc_storeStrong((id *)&self->_extraAppActivities, 0);
  objc_storeStrong((id *)&self->_shareCustomFeature, 0);

  objc_storeStrong((id *)&self->_customFeatureStore, 0);
}

@end