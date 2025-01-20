@interface SearchStringWaypointRequest
- (BOOL)hasCachedResult;
- (BOOL)isCurrentLocation;
- (BOOL)isEquivalentToOtherRequest:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (MKMapItem)mapItemForLocationComparison;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)waypointName;
- (SearchStringWaypointRequest)init;
- (SearchStringWaypointRequest)initWithSearchString:(id)a3;
- (SearchStringWaypointRequest)initWithSearchString:(id)a3 completionItem:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6;
- (id)waypointIconWithScale:(double)a3;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
- (void)recordRAPInformation:(id)a3;
@end

@implementation SearchStringWaypointRequest

- (SearchStringWaypointRequest)initWithSearchString:(id)a3 completionItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    v17.receiver = self;
    v17.super_class = (Class)SearchStringWaypointRequest;
    v8 = [(SearchStringWaypointRequest *)&v17 init];
    if (v8)
    {
      v9 = (NSString *)[v6 copy];
      searchString = v8->_searchString;
      v8->_searchString = v9;

      objc_storeStrong((id *)&v8->_completionItem, a4);
      if (v8->_completionItem)
      {
        id v11 = objc_alloc((Class)MKMapItem);
        v12 = [(GEOCompletionItem *)v8->_completionItem geoMapItem];
        v13 = (MKMapItem *)[v11 initWithGeoMapItem:v12 isPlaceHolderPlace:0];
        mapItem = v8->_mapItem;
        v8->_mapItem = v13;
      }
    }
    self = v8;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (SearchStringWaypointRequest)initWithSearchString:(id)a3
{
  return [(SearchStringWaypointRequest *)self initWithSearchString:a3 completionItem:0];
}

- (SearchStringWaypointRequest)init
{
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = NSStringFromSelector(a2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"-[%@ %@] not implemented", v5, v6);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  searchString = self->_searchString;
  completionItem = self->_completionItem;

  return [v4 initWithSearchString:searchString completionItem:completionItem];
}

- (NSString)description
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000915B0;
  objc_super v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(SearchStringWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(SearchStringWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
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

  id v11 = [v3 componentsJoinedByString:@", "];
  v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100560D30;
  objc_super v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(SearchStringWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(SearchStringWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
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

  id v11 = [v3 componentsJoinedByString:@"\n"];
  v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return (NSString *)v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  id v4 = (void (**)(id, const __CFString *, GEOCompletionItem *))((char *)a3 + 16);
  v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, @"completionItem", self->_completionItem);
  (*v4)(v6, @"mapItem", (GEOCompletionItem *)self->_mapItem);
}

- (CLLocationCoordinate2D)coordinate
{
  double v5 = 0.0;
  double v6 = 0.0;
  if ([(GEOCompletionItem *)self->_completionItem getCoordinate:&v5]
    && (fabs(v6 + 180.0) >= 0.00000001 || fabs(v5 + 180.0) >= 0.00000001))
  {
    CLLocationCoordinate2D v4 = CLLocationCoordinate2DMake(v5, v6);
    double longitude = v4.longitude;
    double latitude = v4.latitude;
  }
  else
  {
    double latitude = kCLLocationCoordinate2DInvalid.latitude;
    double longitude = kCLLocationCoordinate2DInvalid.longitude;
  }
  result.double longitude = longitude;
  result.double latitude = latitude;
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
  id v3 = [(GEOCompletionItem *)self->_completionItem displayLines];
  CLLocationCoordinate2D v4 = [v3 firstObject];

  if ([v4 length])
  {
    double v5 = v4;
  }
  else
  {
    double v6 = [(MKMapItem *)self->_mapItem name];
    searchString = v6;
    if (!v6) {
      searchString = self->_searchString;
    }
    double v5 = searchString;
  }

  return v5;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = (id *)v4;
    double v6 = [(MKMapItem *)self->_mapItem _geoMapItem];
    uint64_t v7 = [v5[3] _geoMapItem];
    v8 = (void *)v7;
    if (v6 && v7)
    {
      if (![v6 _hasMUID]
        || ![v8 _hasMUID]
        || (id v9 = [v6 _muid], v9 == objc_msgSend(v8, "_muid")))
      {
        unsigned __int8 IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose();
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      id v11 = v5[1];
      unint64_t v12 = self->_searchString;
      unint64_t v13 = (unint64_t)v11;
      if (!(v12 | v13)
        || (v14 = (void *)v13,
            unsigned int v15 = [(id)v12 isEqual:v13],
            v14,
            (id)v12,
            v15))
      {
        completionItem = self->_completionItem;
        unint64_t v17 = (unint64_t)v5[2];
        id v18 = completionItem;
        v19 = v18;
        if ((unint64_t)v18 | v17) {
          unsigned __int8 IsEqualToMapItemForPurpose = [v18 isEqual:v17];
        }
        else {
          unsigned __int8 IsEqualToMapItemForPurpose = 1;
        }

        goto LABEL_16;
      }
    }
    unsigned __int8 IsEqualToMapItemForPurpose = 0;
    goto LABEL_16;
  }
  unsigned __int8 IsEqualToMapItemForPurpose = 0;
LABEL_17:

  return IsEqualToMapItemForPurpose;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  searchString = self->_searchString;
  completionItem = self->_completionItem;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = sub_1009E12F4(a5);
  unsigned int v15 = +[GEOComposedWaypoint composedWaypointForSearchString:searchString completionItem:completionItem traits:v13 clientAttributes:0 clientResolvedCompletionHandler:v12 completionHandler:v14 networkActivityHandler:v11];

  return v15;
}

- (void)recordRAPInformation:(id)a3
{
  id v6 = a3;
  id v4 = [(NSString *)self->_searchString copy];
  [v6 setSearchString:v4];

  if (self->_completionItem)
  {
    double v5 = +[GEOStorageCompletion storageForCompletionItem:](GEOStorageCompletion, "storageForCompletionItem:");
    [v6 setCompletionStorage:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_completionItem, 0);

  objc_storeStrong((id *)&self->_searchString, 0);
}

@end