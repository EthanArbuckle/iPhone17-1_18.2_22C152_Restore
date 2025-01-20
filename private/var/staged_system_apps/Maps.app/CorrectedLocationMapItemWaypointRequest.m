@interface CorrectedLocationMapItemWaypointRequest
- (CLLocationCoordinate2D)coordinate;
- (CorrectedLocationMapItemWaypointRequest)initWithCorrectedCoordinate:(CLLocationCoordinate2D)a3 mapItem:(id)a4;
- (CorrectedLocationMapItemWaypointRequest)initWithMapItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6;
- (id)mapItemForLocationComparison;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
- (void)recordRAPInformation:(id)a3;
@end

@implementation CorrectedLocationMapItemWaypointRequest

- (CorrectedLocationMapItemWaypointRequest)initWithCorrectedCoordinate:(CLLocationCoordinate2D)a3 mapItem:(id)a4
{
  CLLocationDegrees latitude = a3.latitude;
  v5 = 0;
  if (a3.longitude >= -180.0)
  {
    CLLocationDegrees longitude = a3.longitude;
    if (a3.longitude <= 180.0 && a3.latitude >= -90.0 && a3.latitude <= 90.0)
    {
      v9.receiver = self;
      v9.super_class = (Class)CorrectedLocationMapItemWaypointRequest;
      v7 = [(MapItemWaypointRequest *)&v9 initWithMapItem:a4];
      if (v7)
      {
        v7->_coordinate.CLLocationDegrees latitude = latitude;
        v7->_coordinate.CLLocationDegrees longitude = longitude;
      }
      self = v7;
      v5 = self;
    }
  }

  return v5;
}

- (CorrectedLocationMapItemWaypointRequest)initWithMapItem:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"-[%@ %@] not implemented", v6, v7);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  mapItem = self->super._mapItem;
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;

  return [v4 initWithCorrectedCoordinate:mapItem:latitude, longitude];
}

- (id)description
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100092A34;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(CorrectedLocationMapItemWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(CorrectedLocationMapItemWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
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

  return v12;
}

- (id)debugDescription
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100CE2560;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(CorrectedLocationMapItemWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(CorrectedLocationMapItemWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
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

  return v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CorrectedLocationMapItemWaypointRequest;
  id v4 = (void (**)(id, const __CFString *, void *))a3;
  [(MapItemWaypointRequest *)&v6 _maps_buildDescriptionWithBlock:v4];
  v5 = +[NSString stringWithFormat:@"(%lf, %lf)", *(void *)&self->_coordinate.latitude, *(void *)&self->_coordinate.longitude, v6.receiver, v6.super_class];
  v4[2](v4, @"coordinate", v5);
}

- (id)mapItemForLocationComparison
{
  return 0;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc((Class)GEOLocation);
  [(CorrectedLocationMapItemWaypointRequest *)self coordinate];
  id v13 = [v12 initWithGEOCoordinate:];
  v14 = [(MKMapItem *)self->super._mapItem _geoMapItem];
  uint64_t v15 = sub_1009E12F4(v10);

  v16 = +[GEOComposedWaypoint composedWaypointForLocation:v13 mapItem:v14 traits:v11 completionHandler:v15 networkActivityHandler:v9];

  return v16;
}

- (void)recordRAPInformation:(id)a3
{
  id v3 = (double *)self;
  v6.receiver = self;
  v6.super_class = (Class)CorrectedLocationMapItemWaypointRequest;
  id v4 = a3;
  [(MapItemWaypointRequest *)&v6 recordRAPInformation:v4];
  id v5 = objc_alloc_init((Class)GEOLatLng);
  v3 += 2;
  [v5 setLat:*v3];
  [v5 setLng:v3[1]];
  [v4 setCoordinate:v5];
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

@end