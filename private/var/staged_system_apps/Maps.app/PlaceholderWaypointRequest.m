@interface PlaceholderWaypointRequest
- (BOOL)hasCachedResult;
- (BOOL)isCurrentLocation;
- (BOOL)isEquivalentToOtherRequest:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (MKMapItem)mapItemForLocationComparison;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)waypointName;
- (PlaceholderWaypointRequest)initWithCLPlacemark:(id)a3;
- (PlaceholderWaypointRequest)initWithName:(id)a3 icon:(id)a4;
- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6;
- (id)waypointIconWithScale:(double)a3;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
@end

@implementation PlaceholderWaypointRequest

- (PlaceholderWaypointRequest)initWithName:(id)a3 icon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PlaceholderWaypointRequest;
  v8 = [(PlaceholderWaypointRequest *)&v12 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    name = v8->_name;
    v8->_name = v9;

    objc_storeStrong((id *)&v8->_icon, a4);
  }

  return v8;
}

- (PlaceholderWaypointRequest)initWithCLPlacemark:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PlaceholderWaypointRequest;
  v5 = [(PlaceholderWaypointRequest *)&v13 init];
  if (v5)
  {
    id v6 = [v4 name];
    id v7 = (NSString *)[v6 copy];
    name = v5->_name;
    v5->_name = v7;

    id v9 = [objc_alloc((Class)MKPlacemark) initWithPlacemark:v4];
    v10 = (MKMapItem *)[objc_alloc((Class)MKMapItem) initWithPlacemark:v9];
    mapItem = v5->_mapItem;
    v5->_mapItem = v10;
  }
  return v5;
}

- (NSString)description
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100091288;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(PlaceholderWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(PlaceholderWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
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
  objc_super v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100409934;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(PlaceholderWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(PlaceholderWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
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
  objc_super v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return (NSString *)v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  id v4 = (void (**)(id, const __CFString *, UIImage *))((char *)a3 + 16);
  v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, @"icon", self->_icon);
  (*v4)(v6, @"mapItem", (UIImage *)self->_mapItem);
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = kCLLocationCoordinate2DInvalid.latitude;
  double longitude = kCLLocationCoordinate2DInvalid.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (id)waypointIconWithScale:(double)a3
{
  mapItem = self->_mapItem;
  if (mapItem)
  {
    id v4 = +[MKMapItem _maps_markerImageForMapItem:mapItem scale:2 size:0 useMarkerFallback:a3];
  }
  else
  {
    id v4 = self->_icon;
  }

  return v4;
}

- (NSString)waypointName
{
  return self->_name;
}

- (BOOL)isCurrentLocation
{
  mapItem = self->_mapItem;
  if (!mapItem) {
    return 0;
  }
  id v3 = +[MKMapItem mapItemForCurrentLocation];
  unsigned __int8 v4 = [(MKMapItem *)mapItem isEqual:v3];

  return v4;
}

- (BOOL)hasCachedResult
{
  return 1;
}

- (MKMapItem)mapItemForLocationComparison
{
  return self->_mapItem;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    mapItem = self->_mapItem;
    if (mapItem && v5[2])
    {
      unsigned __int8 v7 = -[MKMapItem isEqual:](mapItem, "isEqual:");
    }
    else
    {
      v8 = [(PlaceholderWaypointRequest *)self waypointName];
      id v9 = [v5 waypointName];
      unsigned __int8 v7 = [v8 isEqualToString:v9];
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end