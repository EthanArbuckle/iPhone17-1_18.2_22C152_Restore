@interface PXAnnotatedLocation
- (CLLocation)location;
- (CLLocationCoordinate2D)coordinate;
- (NSNumber)locationType;
- (PXAnnotatedLocation)initWithCoordinate:(CLLocationCoordinate2D)a3 placeAnnotation:(id)a4;
- (PXAnnotatedLocation)initWithLatitude:(double)a3 longitude:(double)a4 placeAnnotation:(id)a5;
- (PXAnnotatedLocation)initWithLocation:(id)a3 placeAnnotation:(id)a4;
- (PXPlaceAnnotation)placeAnnotation;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setLocation:(id)a3;
- (void)setLocationType:(id)a3;
@end

@implementation PXAnnotatedLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationType, 0);
  objc_storeStrong((id *)&self->_placeAnnotation, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (void)setLocationType:(id)a3
{
}

- (NSNumber)locationType
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (PXPlaceAnnotation)placeAnnotation
{
  return self->_placeAnnotation;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (PXAnnotatedLocation)initWithLocation:(id)a3 placeAnnotation:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXAnnotatedLocation.m", 40, @"Invalid parameter not satisfying: %@", @"location" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)PXAnnotatedLocation;
  v10 = [(PXAnnotatedLocation *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_location, a3);
    objc_storeStrong((id *)&v11->_placeAnnotation, a4);
    [v8 coordinate];
    v11->_coordinate.double latitude = v12;
    v11->_coordinate.double longitude = v13;
  }

  return v11;
}

- (PXAnnotatedLocation)initWithCoordinate:(CLLocationCoordinate2D)a3 placeAnnotation:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  v7 = (objc_class *)MEMORY[0x1E4F1E5F0];
  id v8 = a4;
  id v9 = (void *)[[v7 alloc] initWithLatitude:latitude longitude:longitude];
  v10 = [(PXAnnotatedLocation *)self initWithLocation:v9 placeAnnotation:v8];

  return v10;
}

- (PXAnnotatedLocation)initWithLatitude:(double)a3 longitude:(double)a4 placeAnnotation:(id)a5
{
  id v8 = a5;
  CLLocationCoordinate2D v9 = CLLocationCoordinate2DMake(a3, a4);
  v10 = -[PXAnnotatedLocation initWithCoordinate:placeAnnotation:](self, "initWithCoordinate:placeAnnotation:", v8, v9.latitude, v9.longitude);

  return v10;
}

@end