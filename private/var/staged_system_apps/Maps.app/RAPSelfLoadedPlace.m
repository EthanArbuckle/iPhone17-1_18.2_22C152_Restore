@interface RAPSelfLoadedPlace
- (CLLocationCoordinate2D)coordinate;
- (GEORPPlaceInfo)placeInfo;
- (MKMapItem)mapItem;
- (NSString)sourceApplication;
- (NSString)sourceURL;
- (NSString)userVisibleTitle;
- (RAPSelfLoadedPlace)initWithMapItem:(id)a3;
- (int64_t)source;
@end

@implementation RAPSelfLoadedPlace

- (RAPSelfLoadedPlace)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPSelfLoadedPlace;
  v6 = [(RAPSelfLoadedPlace *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapItem, a3);
  }

  return v7;
}

- (NSString)userVisibleTitle
{
  return [(MKMapItem *)self->_mapItem name];
}

- (int64_t)source
{
  return 2;
}

- (CLLocationCoordinate2D)coordinate
{
  v2 = [(MKMapItem *)self->_mapItem placemark];
  [v2 coordinate];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.longitude = v8;
  result.latitude = v7;
  return result;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (GEORPPlaceInfo)placeInfo
{
  return 0;
}

- (NSString)sourceURL
{
  return 0;
}

- (NSString)sourceApplication
{
  return 0;
}

- (void).cxx_destruct
{
}

@end