@interface TransitVehicleLineAnnotation
- (BOOL)allowsAccuracyRing;
- (BOOL)allowsTimestampLabel;
- (CLLocationCoordinate2D)coordinate;
- (GEOTransitLine)transitLine;
- (TransitVehicleLineAnnotation)initWithTransitLine:(id)a3;
- (UIColor)color;
- (id)imageWithScale:(double)a3 nightMode:(BOOL)a4;
@end

@implementation TransitVehicleLineAnnotation

- (TransitVehicleLineAnnotation)initWithTransitLine:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitVehicleLineAnnotation;
  v6 = [(TransitVehicleLineAnnotation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transitLine, a3);
  }

  return v7;
}

- (CLLocationCoordinate2D)coordinate
{
  double v2 = MKCoordinateInvalid[0];
  double v3 = MKCoordinateInvalid[1];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (UIColor)color
{
  double v2 = [(TransitVehicleLineAnnotation *)self transitLine];
  double v3 = [v2 lineColorString];

  v4 = +[UIColor _maps_colorFromHexString:v3];

  return (UIColor *)v4;
}

- (id)imageWithScale:(double)a3 nightMode:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(TransitVehicleLineAnnotation *)self transitLine];
  v7 = [v6 modeArtwork];

  v8 = +[MKTransitArtworkManager sharedInstance];
  objc_super v9 = [v8 transitArtworkImageWithDataSource:v7 size:6 featureType:2 scale:v4 nightMode:a3];

  return v9;
}

- (BOOL)allowsAccuracyRing
{
  return 0;
}

- (BOOL)allowsTimestampLabel
{
  return 0;
}

- (GEOTransitLine)transitLine
{
  return self->_transitLine;
}

- (void).cxx_destruct
{
}

@end