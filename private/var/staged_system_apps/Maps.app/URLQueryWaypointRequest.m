@interface URLQueryWaypointRequest
- (BOOL)hasCachedResult;
- (BOOL)isCurrentLocation;
- (BOOL)isEquivalentToOtherRequest:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (MKMapItem)mapItemForLocationComparison;
- (NSString)waypointName;
- (URLQueryWaypointRequest)initWithURLQuery:(id)a3 title:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6;
- (id)waypointIconWithScale:(double)a3;
@end

@implementation URLQueryWaypointRequest

- (URLQueryWaypointRequest)initWithURLQuery:(id)a3 title:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 muid]
    || ([v7 query],
        v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v9 length],
        v9,
        v10))
  {
    v17.receiver = self;
    v17.super_class = (Class)URLQueryWaypointRequest;
    v11 = [(URLQueryWaypointRequest *)&v17 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_query, a3);
      v13 = (NSString *)[v8 copy];
      title = v12->_title;
      v12->_title = v13;
    }
    self = v12;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  query = self->_query;
  title = self->_title;

  return [v4 initWithURLQuery:query title:title];
}

- (CLLocationCoordinate2D)coordinate
{
  query = self->_query;
  if (query)
  {
    [(ExternalURLQuery *)query coordinate];
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
  return +[MKMapItem _maps_markerImageForMapItem:0 scale:2 size:1 useMarkerFallback:a3];
}

- (NSString)waypointName
{
  title = self->_title;
  if (title)
  {
    v3 = title;
  }
  else
  {
    MKLocalizedStringForUnknownLocation();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(ExternalURLQuery *)self->_query isEqual:v4[1]];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  query = self->_query;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  unint64_t v13 = [(ExternalURLQuery *)query muid];
  v14 = self->_query;
  if (v13)
  {
    id v15 = [(ExternalURLQuery *)v14 muid];
    uint64_t v16 = [(ExternalURLQuery *)self->_query resultProviderId];
    objc_super v17 = [(ExternalURLQuery *)self->_query contentProvider];
    v18 = sub_1009E12F4(v11);

    +[GEOComposedWaypoint composedWaypointForID:v15 resultsProviderID:v16 contentProvider:v17 traits:v12 clientAttributes:0 completionHandler:v18 networkActivityHandler:v10];
  }
  else
  {
    objc_super v17 = [(ExternalURLQuery *)v14 query];
    v18 = sub_1009E12F4(v11);

    +[GEOComposedWaypoint composedWaypointForSearchString:v17 completionItem:0 traits:v12 clientAttributes:0 completionHandler:v18 networkActivityHandler:v10];
  v19 = };

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end