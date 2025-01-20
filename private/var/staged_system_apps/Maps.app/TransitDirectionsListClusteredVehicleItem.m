@interface TransitDirectionsListClusteredVehicleItem
- (GEOComposedTransitTripRouteSegment)clusteredSegment;
- (TransitDirectionsListClusteredVehicleItem)initWithClusteredRouteSegment:(id)a3;
@end

@implementation TransitDirectionsListClusteredVehicleItem

- (TransitDirectionsListClusteredVehicleItem)initWithClusteredRouteSegment:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TransitDirectionsListClusteredVehicleItem;
  v6 = [(TransitDirectionsListItem *)&v10 initWithInstructions:0];
  v7 = v6;
  if (v6)
  {
    [(TransitDirectionsListItem *)v6 setType:4];
    objc_storeStrong((id *)&v7->_clusteredSegment, a3);
    v8 = v7;
  }

  return v7;
}

- (GEOComposedTransitTripRouteSegment)clusteredSegment
{
  return self->_clusteredSegment;
}

- (void).cxx_destruct
{
}

@end