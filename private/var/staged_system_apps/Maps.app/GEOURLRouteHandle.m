@interface GEOURLRouteHandle
- (GEOURLRouteHandle)initWithRoute:(id)a3 fidelity:(unint64_t)a4;
- (id)initWithRoute:(id)a3;
@end

@implementation GEOURLRouteHandle

- (id)initWithRoute:(id)a3
{
  return [(GEOURLRouteHandle *)self initWithRoute:a3 fidelity:0xFFFFFFFLL];
}

- (GEOURLRouteHandle)initWithRoute:(id)a3 fidelity:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  v7 = 0;
  if (v6 && (v4 & 8) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)GEOURLRouteHandle;
    v8 = [(GEOURLRouteHandle *)&v16 init];
    if (v8)
    {
      v9 = [v6 directionsResponseID];
      [(GEOURLRouteHandle *)v8 setDirectionsResponseID:v9];

      v10 = [v6 serverRouteID];
      [(GEOURLRouteHandle *)v8 setRouteID:v10];

      v11 = [v6 suggestedRoute];
      v12 = [v11 routeHandle];
      [(GEOURLRouteHandle *)v8 setTransitData:v12];

      if ((v4 & 0x20) != 0)
      {
        v13 = [v6 zilchDataArrayToEndOfRouteFromStepIndex:0];
        v14 = [v13 firstObject];
        [(GEOURLRouteHandle *)v8 setZilchPoints:v14];
      }
    }
    self = v8;
    v7 = self;
  }

  return v7;
}

@end