@interface POIShapeSearchResult
- (POIShapeSearchResult)initWithMapView:(id)a3 searchResult:(id)a4;
@end

@implementation POIShapeSearchResult

- (POIShapeSearchResult)initWithMapView:(id)a3 searchResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 routeData];

  if (v8)
  {
    id v9 = [v6 composedWaypoint];
  }
  else
  {
    id v10 = objc_alloc((Class)GEOComposedWaypoint);
    v11 = [v6 mapItem];
    v12 = [v11 _geoMapItem];
    id v9 = [v10 initWithMapItem:v12];
  }
  v15.receiver = self;
  v15.super_class = (Class)POIShapeSearchResult;
  v13 = [(POIShapeComposedWaypoint *)&v15 initWithMapView:v7 composedWaypoint:v9];

  return v13;
}

@end