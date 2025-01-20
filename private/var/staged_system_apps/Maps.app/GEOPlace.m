@interface GEOPlace
- (CLLocationCoordinate2D)mkCoordinate;
@end

@implementation GEOPlace

- (CLLocationCoordinate2D)mkCoordinate
{
  if ([(GEOPlace *)self hasCenter])
  {
    v3 = [(GEOPlace *)self center];
    [v3 lat];
    double v5 = v4;
    [v3 lng];
LABEL_5:
    double v8 = v6;

    goto LABEL_6;
  }
  if ([(GEOPlace *)self hasMapRegion])
  {
    v3 = [(GEOPlace *)self mapRegion];
    [v3 centerLat];
    double v5 = v7;
    [v3 centerLng];
    goto LABEL_5;
  }
  if ([(GEOPlace *)self entryPointsCount])
  {
    v11 = [(GEOPlace *)self entryPoints];
    v12 = [v11 objectAtIndexedSubscript:0];

    [v12 lat];
    double v5 = v13;
    [v12 lng];
    double v8 = v14;
  }
  else
  {
    double v5 = MKCoordinateInvalid[0];
    double v8 = MKCoordinateInvalid[1];
  }
LABEL_6:
  double v9 = v5;
  double v10 = v8;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

@end