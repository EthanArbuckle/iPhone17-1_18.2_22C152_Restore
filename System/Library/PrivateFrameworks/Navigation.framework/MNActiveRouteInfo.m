@interface MNActiveRouteInfo
+ (BOOL)supportsSecureCoding;
- (GEOComposedETARoute)etaRoute;
- (GEOComposedRoute)route;
- (GEOComposedRouteTraffic)traffic;
- (GEOETATrafficUpdateResponse)etaResponse;
- (GEOTransitRouteUpdateRequest)transitRouteUpdateRequest;
- (MNActiveRouteInfo)initWithCoder:(id)a3;
- (MNActiveRouteInfo)initWithRoute:(id)a3;
- (MNActiveRouteInfo)initWithRoute:(id)a3 trafficRoute:(id)a4 routeInitalizerData:(id)a5;
- (MNBatteryChargeInfo)batteryChargeInfo;
- (MNDisplayETAInfo)displayETAInfo;
- (MNRouteDistanceInfo)remainingDistanceInfo;
- (NSUUID)routeID;
- (id)description;
- (unint64_t)alternateRouteIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateRouteIndex:(unint64_t)a3;
- (void)setBatteryChargeInfo:(id)a3;
- (void)setDisplayETAInfo:(id)a3;
- (void)setEtaResponse:(id)a3;
- (void)setEtaRoute:(id)a3;
- (void)setRemainingDistanceInfo:(id)a3;
- (void)setRoute:(id)a3;
@end

@implementation MNActiveRouteInfo

- (MNActiveRouteInfo)initWithRoute:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNActiveRouteInfo;
  v6 = [(MNActiveRouteInfo *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_route, a3);
    v7->_alternateRouteIndex = 0x7FFFFFFFFFFFFFFFLL;
    v8 = v7;
  }

  return v7;
}

- (MNActiveRouteInfo)initWithRoute:(id)a3 trafficRoute:(id)a4 routeInitalizerData:(id)a5
{
  id v5 = -[MNActiveRouteInfo initWithRoute:](self, "initWithRoute:", a3, a4, a5);
  v6 = v5;
  if (v5) {
    v7 = v5;
  }

  return v6;
}

- (NSUUID)routeID
{
  v2 = [(MNActiveRouteInfo *)self route];
  v3 = [v2 uniqueRouteID];

  return (NSUUID *)v3;
}

- (void)setEtaRoute:(id)a3
{
  v6 = (GEOComposedETARoute *)a3;
  if (self->_etaRoute != v6)
  {
    id v5 = [(GEOComposedRoute *)self->_route mutableData];
    [v5 updateForRoute:self->_route etaRoute:v6];

    objc_storeStrong((id *)&self->_etaRoute, a3);
  }
}

- (GEOComposedRouteTraffic)traffic
{
  v2 = [(MNActiveRouteInfo *)self route];
  v3 = [v2 traffic];

  return (GEOComposedRouteTraffic *)v3;
}

- (GEOTransitRouteUpdateRequest)transitRouteUpdateRequest
{
  v2 = [(MNActiveRouteInfo *)self route];
  v3 = [v2 transitRouteUpdateRequest];

  return (GEOTransitRouteUpdateRequest *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNActiveRouteInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MNActiveRouteInfo;
  id v5 = [(MNActiveRouteInfo *)&v30 init];
  if (v5)
  {
    v6 = MNGetMNRouteStorageLog();
    os_signpost_id_t v7 = os_signpost_id_generate(v6);

    v8 = MNGetMNRouteStorageLog();
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ActiveRouteInfoDecoding", "", v29, 2u);
    }

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_etaRoute"];
    etaRoute = v5->_etaRoute;
    v5->_etaRoute = (GEOComposedETARoute *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_etaResponse"];
    etaResponse = v5->_etaResponse;
    v5->_etaResponse = (GEOETATrafficUpdateResponse *)v12;

    v5->_alternateRouteIndex = [v4 decodeIntegerForKey:@"_alternateRouteIndex"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayETAInfo"];
    displayETAInfo = v5->_displayETAInfo;
    v5->_displayETAInfo = (MNDisplayETAInfo *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_remainingDistanceInfo"];
    remainingDistanceInfo = v5->_remainingDistanceInfo;
    v5->_remainingDistanceInfo = (MNRouteDistanceInfo *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_batteryChargeInfo"];
    batteryChargeInfo = v5->_batteryChargeInfo;
    v5->_batteryChargeInfo = (MNBatteryChargeInfo *)v18;

    if (GEOConfigGetBOOL())
    {
      v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routeID"];
      uint64_t v21 = MNGetRouteFromSubpathWithID(v20, 0, 0);
      route = v5->_route;
      v5->_route = (GEOComposedRoute *)v21;
    }
    else
    {
      uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_route"];
      v20 = v5->_route;
      v5->_route = (GEOComposedRoute *)v23;
    }

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_route.mutableData"];
    [(GEOComposedRoute *)v5->_route setMutableData:v24];
    [(GEOComposedRoute *)v5->_route setMutableData:v24];

    v25 = MNGetMNRouteStorageLog();
    v26 = v25;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v26, OS_SIGNPOST_INTERVAL_END, v7, "ActiveRouteInfoDecoding", "", v29, 2u);
    }

    v27 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = MNGetMNRouteStorageLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  os_signpost_id_t v7 = MNGetMNRouteStorageLog();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ActiveRouteInfoEncoding", "", buf, 2u);
  }

  if (GEOConfigGetBOOL())
  {
    v9 = [(MNActiveRouteInfo *)self routeID];
    [v4 encodeObject:v9 forKey:@"routeID"];
    MNSaveRouteWithSubpath(self->_route, 0, 0, 0);
  }
  else
  {
    [v4 encodeObject:self->_route forKey:@"_route"];
  }
  [v4 encodeObject:self->_etaRoute forKey:@"_etaRoute"];
  [v4 encodeObject:self->_etaResponse forKey:@"_etaResponse"];
  [v4 encodeInteger:self->_alternateRouteIndex forKey:@"_alternateRouteIndex"];
  [v4 encodeObject:self->_displayETAInfo forKey:@"_displayETAInfo"];
  [v4 encodeObject:self->_remainingDistanceInfo forKey:@"_remainingDistanceInfo"];
  [v4 encodeObject:self->_batteryChargeInfo forKey:@"_batteryChargeInfo"];
  uint64_t v10 = [(GEOComposedRoute *)self->_route mutableData];
  [v4 encodeObject:v10 forKey:@"_route.mutableData"];

  v11 = MNGetMNRouteStorageLog();
  uint64_t v12 = v11;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v12, OS_SIGNPOST_INTERVAL_END, v6, "ActiveRouteInfoEncoding", "", v13, 2u);
  }
}

- (id)description
{
  v3 = NSString;
  route = self->_route;
  id v5 = [(GEOComposedRoute *)route name];
  os_signpost_id_t v6 = [v3 stringWithFormat:@"MNActiveRouteInfo: %p (GEOComposedRoute: %p) - %@", self, route, v5];

  return v6;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (GEOComposedETARoute)etaRoute
{
  return self->_etaRoute;
}

- (GEOETATrafficUpdateResponse)etaResponse
{
  return self->_etaResponse;
}

- (void)setEtaResponse:(id)a3
{
}

- (MNDisplayETAInfo)displayETAInfo
{
  return self->_displayETAInfo;
}

- (void)setDisplayETAInfo:(id)a3
{
}

- (MNRouteDistanceInfo)remainingDistanceInfo
{
  return self->_remainingDistanceInfo;
}

- (void)setRemainingDistanceInfo:(id)a3
{
}

- (MNBatteryChargeInfo)batteryChargeInfo
{
  return self->_batteryChargeInfo;
}

- (void)setBatteryChargeInfo:(id)a3
{
}

- (unint64_t)alternateRouteIndex
{
  return self->_alternateRouteIndex;
}

- (void)setAlternateRouteIndex:(unint64_t)a3
{
  self->_alternateRouteIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryChargeInfo, 0);
  objc_storeStrong((id *)&self->_remainingDistanceInfo, 0);
  objc_storeStrong((id *)&self->_displayETAInfo, 0);
  objc_storeStrong((id *)&self->_etaResponse, 0);
  objc_storeStrong((id *)&self->_etaRoute, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end