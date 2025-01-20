@interface MapsAppTestETAPin
- (unint64_t)defaultMapType;
- (void)doAfterStartedTestAtLocation:(CLLocationCoordinate2D)a3;
@end

@implementation MapsAppTestETAPin

- (unint64_t)defaultMapType
{
  return 0;
}

- (void)doAfterStartedTestAtLocation:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v5 = [(MapsAppTest *)self testCoordinator];
  [v5 pptTestCreateCustomSearchResultForDroppedPinAtPoint:1 animated:latitude, longitude];
}

@end