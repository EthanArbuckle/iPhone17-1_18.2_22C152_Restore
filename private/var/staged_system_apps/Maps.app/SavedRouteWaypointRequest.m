@interface SavedRouteWaypointRequest
- (BOOL)hasCachedResult;
- (BOOL)isCurrentLocation;
- (BOOL)isEquivalentToOtherRequest:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (GEOComposedGeometryRoutePersistentData)routeData;
- (GEOComposedRoute)route;
- (MKMapItem)mapItemForLocationComparison;
- (NSString)waypointName;
- (SavedRouteWaypointRequest)initWithSavedRoute:(id)a3;
- (SavedRouteWaypointRequest)initWithSavedRouteData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6;
- (id)waypointIconWithScale:(double)a3;
@end

@implementation SavedRouteWaypointRequest

- (SavedRouteWaypointRequest)initWithSavedRouteData:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SavedRouteWaypointRequest;
  v6 = [(SavedRouteWaypointRequest *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_routeData, a3);
    id v8 = [objc_alloc((Class)GEORouteBuilder_PersistentData) initWithPersistentData:v5];
    uint64_t v9 = [v8 buildRoute];
    route = v7->_route;
    v7->_route = (GEOComposedRoute *)v9;
  }
  return v7;
}

- (SavedRouteWaypointRequest)initWithSavedRoute:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SavedRouteWaypointRequest;
  v6 = [(SavedRouteWaypointRequest *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v5 persistentData];
    routeData = v6->_routeData;
    v6->_routeData = (GEOComposedGeometryRoutePersistentData *)v7;

    objc_storeStrong((id *)&v6->_route, a3);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(id)objc_opt_class() allocWithZone:a3];
  objc_storeStrong(v4 + 1, self->_routeData);
  objc_storeStrong(v4 + 2, self->_route);
  return v4;
}

- (CLLocationCoordinate2D)coordinate
{
  v2 = [(GEOComposedRoute *)self->_route origin];
  v3 = v2;
  if (v2)
  {
    [v2 coordinate];
    CLLocationDegrees v5 = v4;
    [v3 coordinate];
    CLLocationCoordinate2D v7 = CLLocationCoordinate2DMake(v5, v6);
    CLLocationDegrees latitude = v7.latitude;
    CLLocationDegrees longitude = v7.longitude;
  }
  else
  {
    CLLocationDegrees latitude = kCLLocationCoordinate2DInvalid.latitude;
    CLLocationDegrees longitude = kCLLocationCoordinate2DInvalid.longitude;
  }

  double v10 = latitude;
  double v11 = longitude;
  result.CLLocationDegrees longitude = v11;
  result.CLLocationDegrees latitude = v10;
  return result;
}

- (BOOL)isCurrentLocation
{
  return 0;
}

- (BOOL)hasCachedResult
{
  return 0;
}

- (MKMapItem)mapItemForLocationComparison
{
  return 0;
}

- (id)waypointIconWithScale:(double)a3
{
  double v4 = +[GEOFeatureStyleAttributes customSavedRouteStyleAttributes];
  CLLocationDegrees v5 = +[MKIconManager imageForStyle:v4 size:2 forScale:0 format:a3];

  return v5;
}

- (NSString)waypointName
{
  v3 = [(GEOComposedRoute *)self->_route userProvidedName];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(GEOComposedRoute *)self->_route name];
  }
  CLLocationDegrees v6 = v5;

  return (NSString *)v6;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  double v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [v4[1] isEqual:self->_routeData];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  id v8 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100103ECC;
  v24 = sub_1001047F0;
  id v25 = 0;
  route = self->_route;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100724AC0;
  v18[3] = &unk_1012F68F8;
  id v19 = v8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100724BCC;
  v15[3] = &unk_1012F6920;
  id v16 = v19;
  v17 = &v20;
  id v10 = v19;
  uint64_t v11 = [(GEOComposedRoute *)route _maps_convertToNavigableRouteWithTraits:a3 errorHandler:v18 completionHandler:v15];
  objc_super v12 = (void *)v21[5];
  v21[5] = v11;

  id v13 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v13;
}

- (GEOComposedGeometryRoutePersistentData)routeData
{
  return self->_routeData;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_routeData, 0);
}

@end