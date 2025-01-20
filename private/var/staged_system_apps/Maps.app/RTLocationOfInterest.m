@interface RTLocationOfInterest
- (void)_maps_hydrateGeoMapItem:(id)a3;
@end

@implementation RTLocationOfInterest

- (void)_maps_hydrateGeoMapItem:(id)a3
{
  id v4 = a3;
  v5 = [(RTLocationOfInterest *)self mapItem];
  v6 = [v5 geoMapItemHandle];

  if (v6)
  {
    BOOL v7 = ![(RTLocationOfInterest *)self type]
      || [(RTLocationOfInterest *)self type] == (id)1
      || [(RTLocationOfInterest *)self type] == (id)2;
    id v9 = +[HydrateGeoMapItemCache sharedCache];
    uint64_t v8 = [(RTLocationOfInterest *)self mapItem];
    [v9 resolveRTMapItem:v8 shouldUpdateAttributes:v7 completionHandler:v4];

    id v4 = (id)v8;
  }
  else
  {
    id v9 = objc_alloc_init((Class)NSError);
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

@end