@interface MKLocalSearchCompletion
- (BOOL)w_getCoordinate:(CLLocationCoordinate2D *)a3;
- (MKMapItem)w_mapItem;
- (NSString)w_calloutTitle;
@end

@implementation MKLocalSearchCompletion

- (MKMapItem)w_mapItem
{
  return (MKMapItem *)[(MKLocalSearchCompletion *)self mapItem];
}

- (NSString)w_calloutTitle
{
  return (NSString *)[(MKLocalSearchCompletion *)self calloutTitle];
}

- (BOOL)w_getCoordinate:(CLLocationCoordinate2D *)a3
{
  return [(MKLocalSearchCompletion *)self getCoordinate:a3];
}

@end