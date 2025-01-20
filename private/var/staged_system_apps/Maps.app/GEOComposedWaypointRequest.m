@interface GEOComposedWaypointRequest
- (BOOL)hasCachedResult;
- (BOOL)isCurrentLocation;
- (BOOL)isEquivalentToOtherRequest:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (GEOComposedWaypoint)waypoint;
- (GEOComposedWaypointRequest)init;
- (GEOComposedWaypointRequest)initWithComposedWaypoint:(id)a3;
- (MKMapItem)mapItemForLocationComparison;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)waypointName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6;
- (id)waypointIconWithScale:(double)a3;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
- (void)recordRAPInformation:(id)a3;
@end

@implementation GEOComposedWaypointRequest

- (GEOComposedWaypointRequest)initWithComposedWaypoint:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOComposedWaypointRequest;
  v5 = [(GEOComposedWaypointRequest *)&v9 init];
  if (v5)
  {
    v6 = (GEOComposedWaypoint *)[v4 copy];
    waypoint = v5->_waypoint;
    v5->_waypoint = v6;
  }
  return v5;
}

- (GEOComposedWaypointRequest)init
{
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"-[%@ %@] not implemented", v5, v6);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  waypoint = self->_waypoint;

  return [v4 initWithComposedWaypoint:waypoint];
}

- (NSString)description
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100092250;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(GEOComposedWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(GEOComposedWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
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
  v16 = sub_1009E1558;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(GEOComposedWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(GEOComposedWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
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
  waypoint = self->_waypoint;
  id v5 = a3;
  id v6 = [(GEOComposedWaypoint *)waypoint shortDescription];
  (*((void (**)(id, const __CFString *, id))a3 + 2))(v5, @"waypoint", v6);
}

- (CLLocationCoordinate2D)coordinate
{
  id v3 = [(GEOComposedWaypoint *)self->_waypoint latLng];

  waypoint = self->_waypoint;
  if (v3)
  {
    id v5 = [(GEOComposedWaypoint *)waypoint latLng];
    [v5 lat];
    CLLocationDegrees v7 = v6;
    v8 = [(GEOComposedWaypoint *)self->_waypoint latLng];
    [v8 lng];
    CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v7, v9);
    CLLocationDegrees latitude = v10.latitude;
    CLLocationDegrees longitude = v10.longitude;
  }
  else
  {
    v13 = [(GEOComposedWaypoint *)waypoint geoMapItem];

    if (v13)
    {
      v14 = [(GEOComposedWaypoint *)self->_waypoint geoMapItem];
      [v14 coordinate];
      CLLocationDegrees latitude = v15;
      CLLocationDegrees longitude = v16;
    }
    else
    {
      CLLocationDegrees latitude = kCLLocationCoordinate2DInvalid.latitude;
      CLLocationDegrees longitude = kCLLocationCoordinate2DInvalid.longitude;
    }
  }
  double v17 = latitude;
  double v18 = longitude;
  result.CLLocationDegrees longitude = v18;
  result.CLLocationDegrees latitude = v17;
  return result;
}

- (BOOL)isCurrentLocation
{
  return [(GEOComposedWaypoint *)self->_waypoint isCurrentLocation];
}

- (BOOL)hasCachedResult
{
  return 1;
}

- (MKMapItem)mapItemForLocationComparison
{
  if (!self->_mapItem)
  {
    id v3 = [(GEOComposedWaypoint *)self->_waypoint geoMapItem];

    if (v3)
    {
      id v4 = objc_alloc((Class)MKMapItem);
      id v5 = [(GEOComposedWaypoint *)self->_waypoint geoMapItem];
      double v6 = (MKMapItem *)[v4 initWithGeoMapItem:v5 isPlaceHolderPlace:0];
      mapItem = self->_mapItem;
      self->_mapItem = v6;
    }
  }
  v8 = self->_mapItem;

  return v8;
}

- (id)waypointIconWithScale:(double)a3
{
  id v4 = [(GEOComposedWaypoint *)self->_waypoint mkMapItem];
  id v5 = +[MKMapItem _maps_markerImageForMapItem:v4 scale:2 size:0 useMarkerFallback:a3];

  return v5;
}

- (NSString)waypointName
{
  v2 = [(GEOComposedWaypoint *)self->_waypoint name];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    MKLocalizedStringForUnknownLocation();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;

  return (NSString *)v5;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id *)v4;
    double v6 = [(MKMapItem *)self->_mapItem _geoMapItem];
    uint64_t v7 = [v5[2] _geoMapItem];
    v8 = (void *)v7;
    char IsEqualToMapItemForPurpose = 0;
    if (v6 && v7) {
      char IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose();
    }
  }
  else
  {
    char IsEqualToMapItemForPurpose = 0;
  }

  return IsEqualToMapItemForPurpose;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  if (a5)
  {
    waypoint = self->_waypoint;
    id v8 = a5;
    CLLocationDegrees v9 = +[Result resultWithValue:waypoint];
    (*((void (**)(id, void *))a5 + 2))(v8, v9);
  }
  return 0;
}

- (void)recordRAPInformation:(id)a3
{
  id v7 = a3;
  id v4 = [(GEOComposedWaypoint *)self->_waypoint geoMapItem];
  if (v4)
  {
    id v5 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v4 forUseType:0];
    [v7 setPlaceMapItemStorage:v5];
  }
  if ([(GEOComposedWaypoint *)self->_waypoint isCurrentLocation])
  {
    uint64_t v6 = 2;
  }
  else
  {
    if (![(GEOComposedWaypoint *)self->_waypoint isLocationWaypointType]) {
      goto LABEL_8;
    }
    uint64_t v6 = 3;
  }
  [v7 setOrigin:v6];
LABEL_8:
}

- (GEOComposedWaypoint)waypoint
{
  return self->_waypoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_waypoint, 0);
}

@end