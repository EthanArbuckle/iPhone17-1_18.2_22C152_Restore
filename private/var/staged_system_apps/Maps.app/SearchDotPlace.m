@interface SearchDotPlace
- (BOOL)isEqual:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (GEOMapItemIdentifier)identifier;
- (GEOStyleAttributes)styleAttributes;
- (MKMapItem)mapItem;
- (NSString)name;
- (SearchDotPlace)init;
- (SearchDotPlace)initWithGEODotPlace:(id)a3;
- (unint64_t)hash;
@end

@implementation SearchDotPlace

- (SearchDotPlace)init
{
  result = (SearchDotPlace *)+[NSException raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (SearchDotPlace)initWithGEODotPlace:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SearchDotPlace;
  v5 = [(SearchDotPlace *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (GEOMapItemIdentifier *)v6;

    v8 = [v4 latLng];
    [v8 lat];
    CLLocationDegrees v10 = v9;
    v11 = [v4 latLng];
    [v11 lng];
    v5->_coordinate = CLLocationCoordinate2DMake(v10, v12);

    uint64_t v13 = [v4 styleAttributes];
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOStyleAttributes *)v13;

    uint64_t v15 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v15;

    id v17 = [objc_alloc((Class)GEODotPlaceMapItem) initWithDotPlace:v4];
    v18 = (MKMapItem *)[objc_alloc((Class)MKMapItem) initWithGeoMapItem:v17 isPlaceHolderPlace:0];
    mapItem = v5->_mapItem;
    v5->_mapItem = v18;
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(SearchDotPlace *)self identifier];
  id v3 = [v2 muid];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SearchDotPlace *)a3;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(SearchDotPlace *)self identifier];
      v7 = [(SearchDotPlace *)v5 identifier];

      unsigned __int8 v8 = [v6 isEqualToGEOMapItemIdentifier:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (GEOMapItemIdentifier)identifier
{
  return self->_identifier;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (NSString)name
{
  return self->_name;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end