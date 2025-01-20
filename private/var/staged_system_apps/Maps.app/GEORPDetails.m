@interface GEORPDetails
- (id)directionsRequest;
@end

@implementation GEORPDetails

- (id)directionsRequest
{
  v3 = +[MKMapService sharedService];
  v4 = [v3 mapItemsForPlacesInDetails:self];

  if ((unint64_t)[v4 count] >= 2)
  {
    id v5 = objc_alloc_init((Class)MKDirectionsRequest);
    v6 = [v4 firstObject];
    [v5 setSource:v6];

    v7 = [v4 lastObject];
    [v5 setDestination:v7];

    unsigned int v8 = [(GEORPDetails *)self directionsType];
    uint64_t v9 = 1;
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    if (v8 == 1) {
      uint64_t v10 = 4;
    }
    else {
      uint64_t v10 = v9;
    }
    [v5 setTransportType:v10];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end