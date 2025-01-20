@interface TraceWaypointRequest
- (BOOL)hasCachedResult;
- (BOOL)isCurrentLocation;
- (BOOL)isEquivalentToOtherRequest:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (GEOComposedWaypoint)waypoint;
- (MKMapItem)mapItemForLocationComparison;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)tracePath;
- (NSString)waypointName;
- (Result)routesResult;
- (Result)waypointResult;
- (TraceWaypointRequest)initWithWaypoint:(id)a3;
- (id)completionHandler;
- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6;
- (id)waypointIconWithScale:(double)a3;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setRoutesResult:(id)a3;
- (void)setTracePath:(id)a3;
- (void)setWaypointResult:(id)a3;
@end

@implementation TraceWaypointRequest

- (TraceWaypointRequest)initWithWaypoint:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TraceWaypointRequest;
  v5 = [(TraceWaypointRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[Result resultWithValue:v4];
    waypointResult = v5->_waypointResult;
    v5->_waypointResult = (Result *)v6;
  }
  return v5;
}

- (NSString)description
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100091D94;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(TraceWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(TraceWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
      objc_super v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  v10 = @"<nil>";
LABEL_9:

  v11 = [v3 componentsJoinedByString:@", "];
  v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1007F407C;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(TraceWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(TraceWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
      objc_super v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  v10 = @"<nil>";
LABEL_9:

  v11 = [v3 componentsJoinedByString:@"\n"];
  v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return (NSString *)v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  id v5 = a3;
  id v6 = [(TraceWaypointRequest *)self waypoint];
  (*((void (**)(id, const __CFString *, id))a3 + 2))(v5, @"waypointResult", v6);
}

- (CLLocationCoordinate2D)coordinate
{
  id v3 = [(TraceWaypointRequest *)self waypoint];

  if (v3)
  {
    id v4 = [(TraceWaypointRequest *)self waypoint];
    id v5 = [v4 latLng];
    [v5 lat];
    CLLocationDegrees v7 = v6;

    v8 = [(TraceWaypointRequest *)self waypoint];
    objc_super v9 = [v8 latLng];
    [v9 lng];
    CLLocationDegrees v11 = v10;
  }
  else
  {
    CLLocationDegrees v7 = 0.0;
    CLLocationDegrees v11 = 0.0;
  }

  CLLocationCoordinate2D v14 = CLLocationCoordinate2DMake(v7, v11);
  double longitude = v14.longitude;
  double latitude = v14.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (BOOL)isCurrentLocation
{
  return 0;
}

- (BOOL)hasCachedResult
{
  v2 = [(TraceWaypointRequest *)self waypointResult];
  BOOL v3 = v2 != 0;

  return v3;
}

- (MKMapItem)mapItemForLocationComparison
{
  return 0;
}

- (id)waypointIconWithScale:(double)a3
{
  id v5 = [(TraceWaypointRequest *)self waypoint];
  double v6 = [v5 styleAttributes];
  CLLocationDegrees v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    objc_super v9 = [(TraceWaypointRequest *)self waypoint];
    double v10 = [v9 geoMapItem];
    id v8 = [v10 _styleAttributes];
  }
  CLLocationDegrees v11 = +[MKIconManager imageForStyle:v8 size:2 forScale:0 format:a3];

  return v11;
}

- (NSString)waypointName
{
  v2 = [(TraceWaypointRequest *)self waypoint];
  BOOL v3 = [v2 name];

  return (NSString *)v3;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  return 0;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  -[TraceWaypointRequest setCompletionHandler:](self, "setCompletionHandler:", a5, a4);
  CLLocationDegrees v7 = [(TraceWaypointRequest *)self waypointResult];

  if (v7)
  {
    id v8 = [(TraceWaypointRequest *)self completionHandler];
    objc_super v9 = [(TraceWaypointRequest *)self waypointResult];
    ((void (**)(void, void *))v8)[2](v8, v9);
  }
  return 0;
}

- (GEOComposedWaypoint)waypoint
{
  uint64_t v6 = 0;
  CLLocationDegrees v7 = &v6;
  uint64_t v8 = 0x3032000000;
  objc_super v9 = sub_100103FC8;
  double v10 = sub_100104870;
  id v11 = 0;
  v2 = [(TraceWaypointRequest *)self waypointResult];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007F3F40;
  v5[3] = &unk_1012F9840;
  v5[4] = &v6;
  [v2 withValue:v5 orError:&stru_1012F9860];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (GEOComposedWaypoint *)v3;
}

- (void)setWaypointResult:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_waypointResult, a3);
  id v5 = [(TraceWaypointRequest *)self completionHandler];

  if (v5)
  {
    uint64_t v6 = [(TraceWaypointRequest *)self completionHandler];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (Result)waypointResult
{
  return self->_waypointResult;
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (void)setTracePath:(id)a3
{
}

- (Result)routesResult
{
  return self->_routesResult;
}

- (void)setRoutesResult:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_routesResult, 0);
  objc_storeStrong((id *)&self->_tracePath, 0);

  objc_storeStrong((id *)&self->_waypointResult, 0);
}

@end