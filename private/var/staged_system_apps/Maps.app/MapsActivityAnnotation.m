@interface MapsActivityAnnotation
- (CLLocationCoordinate2D)coordinate;
- (MapsActivityAnnotation)initWithCoordinate:(CLLocationCoordinate2D)a3 title:(id)a4 subtitle:(id)a5;
- (MapsActivityAnnotation)initWithSearchResult:(id)a3;
- (NSString)subtitle;
- (NSString)title;
@end

@implementation MapsActivityAnnotation

- (MapsActivityAnnotation)initWithCoordinate:(CLLocationCoordinate2D)a3 title:(id)a4 subtitle:(id)a5
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MapsActivityAnnotation;
  v11 = [(MapsActivityAnnotation *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_coordinate.CLLocationDegrees latitude = latitude;
    v11->_coordinate.CLLocationDegrees longitude = longitude;
    v13 = (NSString *)[v9 copy];
    title = v12->_title;
    v12->_title = v13;

    v15 = (NSString *)[v10 copy];
    subtitle = v12->_subtitle;
    v12->_subtitle = v15;
  }
  return v12;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (MapsActivityAnnotation)initWithSearchResult:(id)a3
{
  id v4 = a3;
  [v4 coordinate];
  double v6 = v5;
  double v8 = v7;
  id v9 = [v4 title];
  id v10 = [v4 subtitle];

  v11 = -[MapsActivityAnnotation initWithCoordinate:title:subtitle:](self, "initWithCoordinate:title:subtitle:", v9, v10, v6, v8);
  return v11;
}

@end