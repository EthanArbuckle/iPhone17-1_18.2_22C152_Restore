@interface MKLocalSearchCompletion
- (BOOL)wi_getCoordinate:(CLLocationCoordinate2D *)a3;
- (MKMapItem)wi_mapItem;
- (NSString)wi_calloutTitle;
@end

@implementation MKLocalSearchCompletion

- (MKMapItem)wi_mapItem
{
  return (MKMapItem *)[(MKLocalSearchCompletion *)self mapItem];
}

- (NSString)wi_calloutTitle
{
  return (NSString *)[(MKLocalSearchCompletion *)self calloutTitle];
}

- (BOOL)wi_getCoordinate:(CLLocationCoordinate2D *)a3
{
  return [(MKLocalSearchCompletion *)self getCoordinate:a3];
}

@end