@interface GEOComposedTransitTripRouteSegment
- (NSArray)alternateRouteItemsForTransitInfoLabel;
- (NSArray)clusteredRouteVehicleInfoItems;
- (id)clusteredRouteVehicleInfoItemsIgnoringSelectedVehicle:(BOOL)a3;
@end

@implementation GEOComposedTransitTripRouteSegment

- (NSArray)alternateRouteItemsForTransitInfoLabel
{
  v2 = [(GEOComposedTransitTripRouteSegment *)self clusteredRouteVehicleInfoItemsIgnoringSelectedVehicle:1];
  v3 = sub_100099700(v2, &stru_1012F83E8);
  id v4 = [v3 mutableCopy];

  if ([v4 count])
  {
    v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"Stepping_Transit_Other_Options" value:@"localized string not found" table:0];
    [v4 insertObject:v6 atIndex:0];
  }
  id v7 = [v4 copy];

  return (NSArray *)v7;
}

- (NSArray)clusteredRouteVehicleInfoItems
{
  return (NSArray *)[(GEOComposedTransitTripRouteSegment *)self clusteredRouteVehicleInfoItemsIgnoringSelectedVehicle:0];
}

- (id)clusteredRouteVehicleInfoItemsIgnoringSelectedVehicle:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[GEOComposedTransitTripRouteSegment rideOptionsCount](self, "rideOptionsCount")];
  if ([(GEOComposedTransitTripRouteSegment *)self rideOptionsCount])
  {
    v6 = 0;
    do
    {
      if (!v3 || v6 != [(GEOComposedTransitTripRouteSegment *)self selectedRideOptionIndex])
      {
        id v7 = [[TransitClusteredVehicleInfoItem alloc] initWithSegment:self rideOptionIndex:v6];
        [v5 addObject:v7];
      }
      ++v6;
    }
    while (v6 < [(GEOComposedTransitTripRouteSegment *)self rideOptionsCount]);
  }
  id v8 = [v5 copy];

  return v8;
}

@end