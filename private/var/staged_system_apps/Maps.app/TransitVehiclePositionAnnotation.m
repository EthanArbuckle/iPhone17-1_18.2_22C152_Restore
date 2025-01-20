@interface TransitVehiclePositionAnnotation
- (BOOL)allowsAccuracyRing;
- (BOOL)allowsTimestampLabel;
- (CLLocationCoordinate2D)coordinate;
- (GEOTransitVehiclePosition)vehiclePosition;
- (TransitVehiclePositionAnnotation)initWithVehiclePosition:(id)a3;
- (UIColor)color;
- (id)imageWithScale:(double)a3 nightMode:(BOOL)a4;
- (void)updateVehiclePosition:(id)a3;
@end

@implementation TransitVehiclePositionAnnotation

- (TransitVehiclePositionAnnotation)initWithVehiclePosition:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitVehiclePositionAnnotation;
  v6 = [(TransitVehiclePositionAnnotation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_vehiclePosition, a3);
  }

  return v7;
}

- (void)updateVehiclePosition:(id)a3
{
  v4 = (GEOTransitVehiclePosition *)a3;
  [(TransitVehiclePositionAnnotation *)self willChangeValueForKey:@"vehiclePosition"];
  [(TransitVehiclePositionAnnotation *)self willChangeValueForKey:@"coordinate"];
  [(TransitVehiclePositionAnnotation *)self willChangeValueForKey:@"heading"];
  [(TransitVehiclePositionAnnotation *)self willChangeValueForKey:@"title"];
  vehiclePosition = self->_vehiclePosition;
  self->_vehiclePosition = v4;

  [(TransitVehiclePositionAnnotation *)self didChangeValueForKey:@"vehiclePosition"];
  [(TransitVehiclePositionAnnotation *)self didChangeValueForKey:@"coordinate"];
  [(TransitVehiclePositionAnnotation *)self didChangeValueForKey:@"heading"];

  [(TransitVehiclePositionAnnotation *)self didChangeValueForKey:@"title"];
}

- (CLLocationCoordinate2D)coordinate
{
  [(GEOTransitVehiclePosition *)self->_vehiclePosition coordinate];
  CLLocationDegrees v4 = v3;
  [(GEOTransitVehiclePosition *)self->_vehiclePosition coordinate];

  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v4, v5);
  double longitude = v8.longitude;
  double latitude = v8.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (UIColor)color
{
  v2 = [(TransitVehiclePositionAnnotation *)self vehiclePosition];
  double v3 = [v2 colorHexString];

  CLLocationDegrees v4 = +[UIColor _maps_colorFromHexString:v3];

  return (UIColor *)v4;
}

- (id)imageWithScale:(double)a3 nightMode:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(TransitVehiclePositionAnnotation *)self vehiclePosition];
  v7 = [v6 artworkDataSource];
  CLLocationCoordinate2D v8 = +[MKTransitArtworkManager sharedInstance];
  objc_super v9 = [v8 transitArtworkImageWithDataSource:v7 size:6 featureType:2 scale:v4 nightMode:a3];

  return v9;
}

- (BOOL)allowsAccuracyRing
{
  return 1;
}

- (BOOL)allowsTimestampLabel
{
  return 1;
}

- (GEOTransitVehiclePosition)vehiclePosition
{
  return self->_vehiclePosition;
}

- (void).cxx_destruct
{
}

@end