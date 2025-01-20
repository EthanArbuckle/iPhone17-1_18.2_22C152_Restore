@interface TransitClusteredVehicleInfoItem
- (GEOComposedTransitTripRouteSegment)segment;
- (NSArray)actionSheetArtworks;
- (NSArray)routeDetailArtworks;
- (NSString)actionSheetTitle;
- (TransitClusteredVehicleInfoItem)initWithSegment:(id)a3 rideOptionIndex:(unint64_t)a4;
- (unint64_t)rideOptionIndex;
@end

@implementation TransitClusteredVehicleInfoItem

- (TransitClusteredVehicleInfoItem)initWithSegment:(id)a3 rideOptionIndex:(unint64_t)a4
{
  v6 = (GEOComposedTransitTripRouteSegment *)a3;
  v10.receiver = self;
  v10.super_class = (Class)TransitClusteredVehicleInfoItem;
  v7 = [(TransitClusteredVehicleInfoItem *)&v10 init];
  segment = v7->_segment;
  v7->_segment = v6;
  v7->_rideOption = a4;

  return v7;
}

- (NSArray)actionSheetArtworks
{
  return (NSArray *)[(GEOComposedTransitTripRouteSegment *)self->_segment actionSheetArtworkForRideOption:self->_rideOption];
}

- (NSArray)routeDetailArtworks
{
  return (NSArray *)[(GEOComposedTransitTripRouteSegment *)self->_segment routeDetailsPrimaryArtworkForRideOption:self->_rideOption];
}

- (NSString)actionSheetTitle
{
  v3 = [(GEOComposedTransitTripRouteSegment *)self->_segment composedRoute];
  unsigned int v4 = [v3 supportsRideClusters];

  segment = self->_segment;
  if (v4)
  {
    v6 = [(GEOComposedTransitTripRouteSegment *)segment actionSheetDescriptionForRideOption:self->_rideOption];
  }
  else
  {
    v7 = [(GEOComposedTransitTripRouteSegment *)segment boardStep];
    v8 = [v7 transitLine];
    v6 = [v8 name];
  }

  return (NSString *)v6;
}

- (GEOComposedTransitTripRouteSegment)segment
{
  return self->_segment;
}

- (unint64_t)rideOptionIndex
{
  return self->_rideOption;
}

- (void).cxx_destruct
{
}

@end