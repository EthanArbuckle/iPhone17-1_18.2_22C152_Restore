@interface RAPAnnotation
- (CLLocationCoordinate2D)coordinate;
- (GEOFeatureStyleAttributes)styleAttributes;
- (NSString)title;
- (RAPAnnotation)init;
- (RAPAnnotation)initWithMapItem:(id)a3;
@end

@implementation RAPAnnotation

- (RAPAnnotation)init
{
  result = (RAPAnnotation *)+[NSException raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (RAPAnnotation)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPAnnotation;
  v6 = [(RAPAnnotation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

- (CLLocationCoordinate2D)coordinate
{
  v2 = [(MKMapItem *)self->_item placemark];
  [v2 coordinate];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.longitude = v8;
  result.latitude = v7;
  return result;
}

- (NSString)title
{
  return [(MKMapItem *)self->_item name];
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  return (GEOFeatureStyleAttributes *)[(MKMapItem *)self->_item _maps_styleAttributesForMapItem];
}

- (void).cxx_destruct
{
}

@end