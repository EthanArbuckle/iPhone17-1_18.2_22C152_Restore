@interface MSHistorySearchItem
- (GEOMapRegion)mapRegion;
- (NSString)locationDisplayString;
- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6;
@end

@implementation MSHistorySearchItem

- (NSString)locationDisplayString
{
  return (NSString *)[(MSHistorySearchItem *)self locationDisplay];
}

- (GEOMapRegion)mapRegion
{
  id v3 = objc_alloc((Class)GEOMapRegion);
  v4 = [(MSHistorySearchItem *)self geoMapRegion];
  id v5 = [v3 initWithData:v4];

  return (GEOMapRegion *)v5;
}

- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6
{
  if (a3) {
    (*((void (**)(id, MSHistorySearchItem *))a3 + 2))(a3, self);
  }
}

@end