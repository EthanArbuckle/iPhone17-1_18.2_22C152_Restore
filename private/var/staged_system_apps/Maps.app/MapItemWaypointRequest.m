@interface MapItemWaypointRequest
- (BOOL)hasCachedResult;
- (BOOL)isCurrentLocation;
- (BOOL)isEquivalentToOtherRequest:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (MKMapItem)mapItem;
- (MKMapItem)mapItemForLocationComparison;
- (MapItemWaypointRequest)init;
- (MapItemWaypointRequest)initWithMapItem:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)waypointName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6;
- (id)waypointIconWithScale:(double)a3;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
- (void)recordRAPInformation:(id)a3;
@end

@implementation MapItemWaypointRequest

- (MapItemWaypointRequest)initWithMapItem:(id)a3
{
  id v5 = a3;
  if ([(MapItemWaypointRequest *)self isMemberOfClass:objc_opt_class()]
    && [v5 _hasCorrectedHomeWorkCoordinate])
  {
    v6 = sub_100576F5C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "This map item has corrected coordinates. Should \"%@\" have been used instead?", buf, 0xCu);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)MapItemWaypointRequest;
  v9 = [(MapItemWaypointRequest *)&v12 init];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_mapItem, a3);
  }

  return v10;
}

- (MapItemWaypointRequest)init
{
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"-[%@ %@] not implemented", v5, v6);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  mapItem = self->_mapItem;

  return [v4 initWithMapItem:mapItem];
}

- (NSString)description
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000928A0;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(MapItemWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  id v5 = v2;
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(MapItemWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
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
  v16 = sub_100B02CFC;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(MapItemWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  id v5 = v2;
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(MapItemWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
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
  id v4 = (void (**)(id, const __CFString *, id))((char *)a3 + 16);
  id v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  id v7 = +[NSNumber numberWithBool:[(MKMapItem *)self->_mapItem needsAdditionalNavData]];
  (*v4)(v6, @"needsAdditionalNavData", v7);
}

- (CLLocationCoordinate2D)coordinate
{
  [(MKMapItem *)self->_mapItem _coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (BOOL)isCurrentLocation
{
  return [(MKMapItem *)self->_mapItem isCurrentLocation];
}

- (BOOL)hasCachedResult
{
  return 0;
}

- (MKMapItem)mapItemForLocationComparison
{
  return self->_mapItem;
}

- (id)waypointIconWithScale:(double)a3
{
  return +[MKMapItem _maps_markerImageForMapItem:self->_mapItem scale:2 size:0 useMarkerFallback:a3];
}

- (NSString)waypointName
{
  double v2 = [(MKMapItem *)self->_mapItem name];
  double v3 = v2;
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
    id v6 = [(MKMapItem *)self->_mapItem _geoMapItem];
    uint64_t v7 = [v5[1] _geoMapItem];
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
  mapItem = self->_mapItem;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = [(MKMapItem *)mapItem _geoMapItem];
  v14 = [v13 _clientAttributes];

  unsigned int v15 = [(MKMapItem *)self->_mapItem needsAdditionalNavData];
  v16 = sub_100576F5C();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Map item needs additional information.", buf, 2u);
    }

    id v18 = [(MKMapItem *)self->_mapItem _geoMapItem];
    v19 = sub_1009E12F4(v11);

    uint64_t v20 = +[GEOComposedWaypoint composedWaypointForIncompleteMapItem:v18 traits:v12 clientAttributes:v14 completionHandler:v19 networkActivityHandler:v10];
  }
  else
  {
    if (v17)
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Map item has all the necessary information.", v23, 2u);
    }

    id v18 = [(MKMapItem *)self->_mapItem _geoMapItem];
    v19 = sub_1009E12F4(v11);

    uint64_t v20 = +[GEOComposedWaypoint composedWaypointForMapItem:v18 traits:v12 clientAttributes:v14 completionHandler:v19 networkActivityHandler:v10];
  }
  v21 = (void *)v20;

  return v21;
}

- (void)recordRAPInformation:(id)a3
{
  id v5 = a3;
  if ([(MKMapItem *)self->_mapItem isCurrentLocation]) {
    [v5 setOrigin:2];
  }
  id v4 = [(MKMapItem *)self->_mapItem _geoMapItemStorageForPersistence];
  [v5 setPlaceMapItemStorage:v4];
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
}

@end