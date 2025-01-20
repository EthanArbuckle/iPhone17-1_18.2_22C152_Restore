@interface MapRegionShareItemSource
- ($04D47FADD0355EF96E203C25856C2375)region;
- (GEOComposedRoute)route;
- (MapRegionShareItemSource)initWithMapView:(id)a3 title:(id)a4;
- (MapRegionTextActivityItemSource)textSource;
- (MapRegionURLActivityItemSource)urlSource;
- (NSArray)activityProviders;
- (NSArray)applicationActivities;
- (NSArray)excludedActivityTypes;
- (NSArray)includedActivityTypes;
- (NSData)pushSubmissionData;
- (NSString)title;
- (SearchResult)searchResult;
- (void)setRegion:(id *)a3;
- (void)setTextSource:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrlSource:(id)a3;
@end

@implementation MapRegionShareItemSource

- (MapRegionShareItemSource)initWithMapView:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MapRegionShareItemSource;
  v8 = [(MapRegionShareItemSource *)&v16 init];
  if (v8)
  {
    [v6 visibleMapRect];
    *(MKCoordinateRegion *)(v8 + 48) = MKCoordinateRegionForMapRect(v17);
    objc_storeStrong((id *)v8 + 3, a4);
    id v9 = [objc_alloc((Class)_MKURLBuilder) initWithCoordinate:v7 label:*((double *)v8 + 6), *((double *)v8 + 7)];
    [v9 setDisplayRegion:*((double *)v8 + 6), *((double *)v8 + 7), *((double *)v8 + 8), *((double *)v8 + 9)];
    [v9 setMapType:[v6 mapType]];
    v10 = [v9 buildForWeb];
    v11 = objc_alloc_init(MapRegionURLActivityItemSource);
    v12 = (void *)*((void *)v8 + 4);
    *((void *)v8 + 4) = v11;

    [*((id *)v8 + 4) setUrl:v10];
    v13 = objc_alloc_init(MapRegionTextActivityItemSource);
    v14 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v13;

    [*((id *)v8 + 5) setText:v7];
  }

  return (MapRegionShareItemSource *)v8;
}

- (NSData)pushSubmissionData
{
  v3 = objc_alloc_init(SyncedBookmarkRepr);
  [(SyncedBookmarkRepr *)v3 setType:3];
  v4 = [(MapRegionShareItemSource *)self title];
  [(SyncedBookmarkRepr *)v3 setTitle:v4];

  [(MapRegionShareItemSource *)self region];
  -[SyncedBookmarkRepr setRegionLatitude:](v3, "setRegionLatitude:");
  [(MapRegionShareItemSource *)self region];
  [(SyncedBookmarkRepr *)v3 setRegionLongitude:v5];
  [(MapRegionShareItemSource *)self region];
  [(SyncedBookmarkRepr *)v3 setRegionLatitudeDelta:v6];
  [(MapRegionShareItemSource *)self region];
  [(SyncedBookmarkRepr *)v3 setRegionLongitudeDelta:v7];
  [(MapRegionShareItemSource *)self region];
  -[SyncedBookmarkRepr setLatitude:](v3, "setLatitude:");
  [(MapRegionShareItemSource *)self region];
  [(SyncedBookmarkRepr *)v3 setLongitude:v8];
  id v9 = [(SyncedBookmarkRepr *)v3 data];

  return (NSData *)v9;
}

- (NSArray)activityProviders
{
  v3 = [(MapRegionShareItemSource *)self textSource];
  v7[0] = v3;
  v4 = [(MapRegionShareItemSource *)self urlSource];
  v7[1] = v4;
  double v5 = +[NSArray arrayWithObjects:v7 count:2];

  return (NSArray *)v5;
}

- (NSArray)applicationActivities
{
  v3 = +[NSMutableArray array];
  v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)5)
  {
    double v6 = [(MapRegionShareItemSource *)self pushSubmissionData];
    if (v6)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      double v7 = +[MapsPushManager defaultManager];
      double v8 = [v7 devices];

      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = [[PushToDeviceActivity alloc] initWithDevice:*(void *)(*((void *)&v15 + 1) + 8 * i) place:self];
            [v3 addObject:v13];
          }
          id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }
    }
  }

  return (NSArray *)v3;
}

- (NSArray)excludedActivityTypes
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)includedActivityTypes
{
  return 0;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- ($04D47FADD0355EF96E203C25856C2375)region
{
  return self;
}

- (void)setRegion:(id *)a3
{
  self->_region.center.latitude = v3;
  self->_region.center.longitude = v4;
  self->_region.span.latitudeDelta = v5;
  self->_region.span.longitudeDelta = v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (MapRegionURLActivityItemSource)urlSource
{
  return self->_urlSource;
}

- (void)setUrlSource:(id)a3
{
}

- (MapRegionTextActivityItemSource)textSource
{
  return self->_textSource;
}

- (void)setTextSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSource, 0);
  objc_storeStrong((id *)&self->_urlSource, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

@end