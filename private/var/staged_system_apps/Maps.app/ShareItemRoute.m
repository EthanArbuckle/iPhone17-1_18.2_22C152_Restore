@interface ShareItemRoute
- (BOOL)includeRoutingApps;
- (GEOComposedRoute)route;
- (MKMapItem)destination;
- (MKMapItem)origin;
- (NSArray)activityProviders;
- (NSArray)applicationActivities;
- (NSArray)excludedActivityTypes;
- (NSArray)includedActivityTypes;
- (NSData)pushSubmissionData;
- (SearchResult)searchResult;
- (ShareItemRoute)initWithRoute:(id)a3 includeRoutingApps:(BOOL)a4;
- (VKPolylineOverlay)polyline;
- (void)_selectCustomFeature:(id)a3;
- (void)_setupCustomFeatureForMapItem;
- (void)_setupCustomFeatureStore;
- (void)setActivityProviderDelegate:(id)a3;
@end

@implementation ShareItemRoute

- (ShareItemRoute)initWithRoute:(id)a3 includeRoutingApps:(BOOL)a4
{
  id v7 = a3;
  v33.receiver = self;
  v33.super_class = (Class)ShareItemRoute;
  v8 = [(ShareItemRoute *)&v33 init];
  if (v8 && ([v7 isMultipointRoute] & 1) == 0)
  {
    objc_storeStrong((id *)&v8->_route, a3);
    v8->_includeRoutingApps = a4;
    v10 = [v7 origin];
    unsigned int v11 = [v10 isCurrentLocation];

    if (v11)
    {
      id v12 = objc_alloc((Class)MKMapItem);
      v13 = [(ShareItemRoute *)v8 route];
      v14 = [v13 origin];
      v15 = [v14 geoMapItem];
      v16 = (MKMapItem *)[v12 initWithGeoMapItemAsCurrentLocation:v15];
    }
    else
    {
      v13 = [(ShareItemRoute *)v8 route];
      v14 = [v13 origin];
      v15 = [v14 geoMapItem];
      v16 = +[MKMapItem _itemWithGeoMapItem:v15];
    }
    origin = v8->_origin;
    v8->_origin = v16;

    v18 = [v7 destination];
    unsigned int v19 = [v18 isCurrentLocation];

    if (v19)
    {
      id v20 = objc_alloc((Class)MKMapItem);
      v21 = [(ShareItemRoute *)v8 route];
      v22 = [v21 destination];
      v23 = [v22 geoMapItem];
      v24 = (MKMapItem *)[v20 initWithGeoMapItemAsCurrentLocation:v23];
    }
    else
    {
      v21 = [(ShareItemRoute *)v8 route];
      v22 = [v21 destination];
      v23 = [v22 geoMapItem];
      v24 = +[MKMapItem _itemWithGeoMapItem:v23];
    }
    destination = v8->_destination;
    v8->_destination = v24;

    id v26 = objc_alloc((Class)VKPolylineOverlay);
    v27 = [(ShareItemRoute *)v8 route];
    v28 = [(ShareItemRoute *)v8 route];
    v29 = [v28 traffic];
    v30 = (VKPolylineOverlay *)[v26 initWithComposedRoute:v27 traffic:v29];
    polyline = v8->_polyline;
    v8->_polyline = v30;

    [(VKPolylineOverlay *)v8->_polyline setSelected:1];
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSArray)activityProviders
{
  activityProviders = self->_activityProviders;
  if (!activityProviders)
  {
    v4 = [(ShareItemRoute *)self route];
    unsigned int v5 = [v4 transportType];
    if (v5 > 5) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = qword_100F73428[v5];
    }

    id v7 = objc_alloc((Class)MURouteTextActivityProvider);
    v8 = [(ShareItemRoute *)self origin];
    v9 = [(ShareItemRoute *)self destination];
    id v10 = [v7 initWithSource:v8 destination:v9];

    [v10 setTransportType:v6];
    id v11 = objc_alloc((Class)MURouteURLActivityProvider);
    id v12 = [(ShareItemRoute *)self origin];
    v13 = [(ShareItemRoute *)self destination];
    id v14 = [v11 initWithSource:v12 destination:v13];

    [v14 setTransportType:v6];
    id v15 = objc_alloc((Class)MURouteLinkPresentationActivityProvider);
    v16 = [(ShareItemRoute *)self origin];
    v17 = [(ShareItemRoute *)self destination];
    id v18 = [v15 initWithSource:v16 destination:v17 composedRoute:self->_route];

    v22[0] = v10;
    v22[1] = v14;
    v22[2] = v18;
    unsigned int v19 = +[NSArray arrayWithObjects:v22 count:3];
    id v20 = self->_activityProviders;
    self->_activityProviders = v19;

    activityProviders = self->_activityProviders;
  }

  return activityProviders;
}

- (NSArray)applicationActivities
{
  v3 = +[NSMutableArray array];
  v4 = +[UIDevice currentDevice];
  if ([v4 userInterfaceIdiom] == (id)5)
  {
    unsigned int v5 = [(ShareItemRoute *)self route];
    uint64_t v6 = [v5 waypoints];
    id v7 = [v6 count];

    if ((unint64_t)v7 > 2) {
      goto LABEL_13;
    }
    v4 = [(ShareItemRoute *)self pushSubmissionData];
    if (v4)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v8 = +[MapsPushManager defaultManager];
      v9 = [v8 devices];

      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = [[PushToDeviceActivity alloc] initWithDevice:*(void *)(*((void *)&v19 + 1) + 8 * i) place:self];
            [v3 addObject:v14];
          }
          id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }
    }
  }

LABEL_13:
  id v15 = objc_alloc_init(MapsPrintActivity);
  [v3 addObject:v15];

  if ([(ShareItemRoute *)self includeRoutingApps])
  {
    v16 = objc_alloc_init(SendToRoutingAppActivity);
    [v3 addObject:v16];
  }
  id v17 = [v3 copy];

  return (NSArray *)v17;
}

- (NSArray)includedActivityTypes
{
  v7[0] = UIActivityTypePrint;
  v7[1] = UIActivityTypeAirDrop;
  v7[2] = UIActivityTypeOpenInIBooks;
  v7[3] = UIActivityTypeAssignToContact;
  v7[4] = UIActivityTypeSaveToCameraRoll;
  v3 = +[NSArray arrayWithObjects:v7 count:5];
  if ([(ShareItemRoute *)self includeRoutingApps])
  {
    id v4 = [v3 arrayByAddingObject:@"com.apple.Maps.RoutingAppsActivity"];
  }
  else
  {
    id v4 = v3;
  }
  unsigned int v5 = v4;

  return (NSArray *)v5;
}

- (void)setActivityProviderDelegate:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v5 = [(ShareItemRoute *)self activityProviders];
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

- (NSArray)excludedActivityTypes
{
  return 0;
}

- (void)_selectCustomFeature:(id)a3
{
  id v4 = a3;
  if (self->_customFeatureStore && self->_endCustomFeature)
  {
    id v6 = v4;
    unsigned int v5 = [v4 _labelMarkerForCustomFeatureAnnotation:];
    if (v5) {
      [v6 _selectLabelMarker:v5 animated:0];
    }

    id v4 = v6;
  }
}

- (void)_setupCustomFeatureStore
{
  v3 = (_MKCustomFeatureStore *)[objc_alloc((Class)_MKCustomFeatureStore) initWithClustering:0];
  customFeatureStore = self->_customFeatureStore;
  self->_customFeatureStore = v3;
}

- (void)_setupCustomFeatureForMapItem
{
  id v23 = +[NSMutableArray array];
  v3 = [(ShareItemRoute *)self route];
  id v4 = [v3 origin];
  unsigned int v5 = [v4 geoMapItem];

  if (v5)
  {
    id v6 = objc_alloc((Class)MKMapItem);
    id v7 = [(ShareItemRoute *)self route];
    uint64_t v8 = [v7 origin];
    v9 = [v8 geoMapItem];
    id v10 = [v6 initWithGeoMapItem:v9 isPlaceHolderPlace:0];

    long long v11 = +[_ShareCustomFeature customFeatureForMapItem:v10];
    startCustomFeature = self->_startCustomFeature;
    self->_startCustomFeature = v11;

    [v23 addObject:self->_startCustomFeature];
  }
  long long v13 = [(ShareItemRoute *)self route];
  id v14 = [v13 destination];
  id v15 = [v14 geoMapItem];

  if (v15)
  {
    id v16 = objc_alloc((Class)MKMapItem);
    id v17 = [(ShareItemRoute *)self route];
    id v18 = [v17 destination];
    long long v19 = [v18 geoMapItem];
    id v20 = [v16 initWithGeoMapItem:v19 isPlaceHolderPlace:0];

    long long v21 = +[_ShareCustomFeature customFeatureForMapItem:v20];
    endCustomFeature = self->_endCustomFeature;
    self->_endCustomFeature = v21;

    [v23 addObject:self->_endCustomFeature];
  }
  [(_MKCustomFeatureStore *)self->_customFeatureStore addAnnotations:v23];
}

- (SearchResult)searchResult
{
  return 0;
}

- (NSData)pushSubmissionData
{
  v2 = [(GEOComposedRoute *)self->_route bookmarkRepresentation];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)includeRoutingApps
{
  return self->_includeRoutingApps;
}

- (MKMapItem)origin
{
  return self->_origin;
}

- (MKMapItem)destination
{
  return self->_destination;
}

- (VKPolylineOverlay)polyline
{
  return self->_polyline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polyline, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_activityProviders, 0);
  objc_storeStrong((id *)&self->_endCustomFeature, 0);
  objc_storeStrong((id *)&self->_startCustomFeature, 0);

  objc_storeStrong((id *)&self->_customFeatureStore, 0);
}

@end