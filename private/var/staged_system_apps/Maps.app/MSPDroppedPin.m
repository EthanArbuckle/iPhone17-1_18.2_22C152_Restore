@interface MSPDroppedPin
- (CLLocationCoordinate2D)coordinate;
- (MSPDroppedPin)initWithSearchResult:(id)a3;
@end

@implementation MSPDroppedPin

- (MSPDroppedPin)initWithSearchResult:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSPDroppedPin;
  v5 = [(MSPDroppedPin *)&v10 init];
  if (v5)
  {
    if ([v4 type] == 3)
    {
      [v4 coordinate];
      id v8 = [objc_alloc((Class)GEOLatLng) initWithLatitude:v6 longitude:v7];
      [(MSPDroppedPin *)v5 setLatLng:v8];

      [v4 timestamp];
      -[MSPDroppedPin setTimestamp:](v5, "setTimestamp:");
      if ([v4 hasFloorOrdinal]) {
        -[MSPDroppedPin setFloorOrdinal:](v5, "setFloorOrdinal:", [v4 floorOrdinal]);
      }
    }
  }

  return v5;
}

- (CLLocationCoordinate2D)coordinate
{
  v3 = [(MSPDroppedPin *)self latLng];
  [v3 lat];
  CLLocationDegrees v5 = v4;
  double v6 = [(MSPDroppedPin *)self latLng];
  [v6 lng];
  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v5, v7);

  double latitude = v8.latitude;
  double longitude = v8.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

@end