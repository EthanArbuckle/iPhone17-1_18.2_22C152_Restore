@interface MNStartNavigationDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isReconnecting;
- (BOOL)isResumingMultipointRoute;
- (GEODirectionsRequest)directionsRequest;
- (GEODirectionsResponse)directionsResponse;
- (GEOMapServiceTraits)traits;
- (GEORouteAttributes)routeAttributes;
- (MNLocation)initialUserLocation;
- (MNStartNavigationDetails)init;
- (MNStartNavigationDetails)initWithCoder:(id)a3;
- (MNStartNavigationReconnectionDetails)reconnectionDetails;
- (MNTraceRecordingData)traceRecordingData;
- (NSArray)routes;
- (NSDictionary)traffic;
- (NSString)requestingAppIdentifier;
- (NSString)tracePlaybackPath;
- (NSString)traceRecordingNameOverride;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)navigationType;
- (int64_t)simulationType;
- (unint64_t)guidanceLevelOverride;
- (unint64_t)guidanceType;
- (unint64_t)selectedRouteIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setDirectionsRequest:(id)a3;
- (void)setDirectionsResponse:(id)a3;
- (void)setGuidanceLevelOverride:(unint64_t)a3;
- (void)setGuidanceType:(unint64_t)a3;
- (void)setInitialUserLocation:(id)a3;
- (void)setIsReconnecting:(BOOL)a3;
- (void)setIsResumingMultipointRoute:(BOOL)a3;
- (void)setNavigationType:(int64_t)a3;
- (void)setReconnectionDetails:(id)a3;
- (void)setRequestingAppIdentifier:(id)a3;
- (void)setRouteAttributes:(id)a3;
- (void)setRoutes:(id)a3;
- (void)setSelectedRouteIndex:(unint64_t)a3;
- (void)setSimulationType:(int64_t)a3;
- (void)setTracePlaybackPath:(id)a3;
- (void)setTraceRecordingData:(id)a3;
- (void)setTraceRecordingNameOverride:(id)a3;
- (void)setTraffic:(id)a3;
- (void)setTraits:(id)a3;
@end

@implementation MNStartNavigationDetails

- (MNStartNavigationDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)MNStartNavigationDetails;
  v2 = [(MNStartNavigationDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_guidanceType = 0;
    v2->_simulationType = 0;
    v2->_guidanceLevelOverride = -1;
    v4 = v2;
  }

  return v3;
}

- (BOOL)isReconnecting
{
  return [(MNStartNavigationReconnectionDetails *)self->_reconnectionDetails isReconnecting];
}

- (void)setIsReconnecting:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && !self->_reconnectionDetails)
  {
    v5 = objc_alloc_init(MNStartNavigationReconnectionDetails);
    reconnectionDetails = self->_reconnectionDetails;
    self->_reconnectionDetails = v5;
  }
  v7 = self->_reconnectionDetails;
  [(MNStartNavigationReconnectionDetails *)v7 setIsReconnecting:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[MNStartNavigationDetails allocWithZone:a3] init];
  v5 = v4;
  if (v4)
  {
    v4->_navigationType = self->_navigationType;
    v4->_guidanceType = self->_guidanceType;
    objc_storeStrong((id *)&v4->_tracePlaybackPath, self->_tracePlaybackPath);
    objc_storeStrong((id *)&v5->_traceRecordingData, self->_traceRecordingData);
    v5->_simulationType = self->_simulationType;
    objc_storeStrong((id *)&v5->_traceRecordingNameOverride, self->_traceRecordingNameOverride);
    objc_storeStrong((id *)&v5->_routeAttributes, self->_routeAttributes);
    objc_storeStrong((id *)&v5->_directionsRequest, self->_directionsRequest);
    objc_storeStrong((id *)&v5->_directionsResponse, self->_directionsResponse);
    objc_storeStrong((id *)&v5->_requestingAppIdentifier, self->_requestingAppIdentifier);
    objc_storeStrong((id *)&v5->_routes, self->_routes);
    v5->_selectedRouteIndex = self->_selectedRouteIndex;
    objc_storeStrong((id *)&v5->_traffic, self->_traffic);
    uint64_t v6 = [(MNLocation *)self->_initialUserLocation copy];
    initialUserLocation = v5->_initialUserLocation;
    v5->_initialUserLocation = (MNLocation *)v6;

    v5->_guidanceLevelOverride = self->_guidanceLevelOverride;
    v5->_isResumingMultipointRoute = self->_isResumingMultipointRoute;
    uint64_t v8 = [(GEOMapServiceTraits *)self->_traits copy];
    traits = v5->_traits;
    v5->_traits = (GEOMapServiceTraits *)v8;

    uint64_t v10 = [(MNStartNavigationReconnectionDetails *)self->_reconnectionDetails copy];
    reconnectionDetails = v5->_reconnectionDetails;
    v5->_reconnectionDetails = (MNStartNavigationReconnectionDetails *)v10;

    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNStartNavigationDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)MNStartNavigationDetails;
  v5 = [(MNStartNavigationDetails *)&v46 init];
  if (v5)
  {
    uint64_t v6 = MNGetMNNavigationDetailsLog();
    os_signpost_id_t v7 = os_signpost_id_generate(v6);
    uint64_t v8 = v6;
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "StartNavigationDetailsDecoding", "", buf, 2u);
    }

    v5->_navigationType = [v4 decodeIntegerForKey:@"_navigationType"];
    v5->_guidanceType = [v4 decodeIntegerForKey:@"_guidanceType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeAttributes"];
    routeAttributes = v5->_routeAttributes;
    v5->_routeAttributes = (GEORouteAttributes *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_directionsRequest"];
    directionsRequest = v5->_directionsRequest;
    v5->_directionsRequest = (GEODirectionsRequest *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_directionsResponse"];
    directionsResponse = v5->_directionsResponse;
    v5->_directionsResponse = (GEODirectionsResponse *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requestingAppIdentifier"];
    requestingAppIdentifier = v5->_requestingAppIdentifier;
    v5->_requestingAppIdentifier = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"_routes"];
    routes = v5->_routes;
    v5->_routes = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"_traffic"];
    traffic = v5->_traffic;
    v5->_traffic = (NSDictionary *)v27;

    v5->_selectedRouteIndex = [v4 decodeIntegerForKey:@"_selectedRouteIndex"];
    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_initialUserLocation"];
    initialUserLocation = v5->_initialUserLocation;
    v5->_initialUserLocation = (MNLocation *)v29;

    v5->_guidanceLevelOverride = [v4 decodeIntegerForKey:@"_guidanceLevelOverride"];
    v5->_isResumingMultipointRoute = [v4 decodeBoolForKey:@"_isResumingMultipointRoute"];
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_traits"];
    traits = v5->_traits;
    v5->_traits = (GEOMapServiceTraits *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tracePlaybackPath"];
    tracePlaybackPath = v5->_tracePlaybackPath;
    v5->_tracePlaybackPath = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_traceRecordingData"];
    traceRecordingData = v5->_traceRecordingData;
    v5->_traceRecordingData = (MNTraceRecordingData *)v35;

    v5->_simulationType = [v4 decodeIntegerForKey:@"_simulationType"];
    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_traceRecordingNameOverride"];
    traceRecordingNameOverride = v5->_traceRecordingNameOverride;
    v5->_traceRecordingNameOverride = (NSString *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_reconnectionDetails"];
    reconnectionDetails = v5->_reconnectionDetails;
    v5->_reconnectionDetails = (MNStartNavigationReconnectionDetails *)v39;

    v41 = v9;
    v42 = v41;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v42, OS_SIGNPOST_INTERVAL_END, v7, "StartNavigationDetailsDecoding", "", buf, 2u);
    }

    v43 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = MNGetMNNavigationDetailsLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  os_signpost_id_t v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "StartNavigationDetailsEncoding", "", buf, 2u);
  }

  [v4 encodeInteger:self->_navigationType forKey:@"_navigationType"];
  [v4 encodeInteger:self->_guidanceType forKey:@"_guidanceType"];
  [v4 encodeObject:self->_routeAttributes forKey:@"_routeAttributes"];
  [v4 encodeObject:self->_directionsRequest forKey:@"_directionsRequest"];
  [v4 encodeObject:self->_directionsResponse forKey:@"_directionsResponse"];
  [v4 encodeObject:self->_requestingAppIdentifier forKey:@"_requestingAppIdentifier"];
  if ([(NSArray *)self->_routes count])
  {
    [v4 encodeObject:self->_routes forKey:@"_routes"];
    [v4 encodeObject:self->_traffic forKey:@"_traffic"];
  }
  [v4 encodeInteger:self->_selectedRouteIndex forKey:@"_selectedRouteIndex"];
  [v4 encodeObject:self->_initialUserLocation forKey:@"_initialUserLocation"];
  [v4 encodeInteger:self->_guidanceLevelOverride forKey:@"_guidanceLevelOverride"];
  [v4 encodeBool:self->_isResumingMultipointRoute forKey:@"_isResumingMultipointRoute"];
  [v4 encodeObject:self->_traits forKey:@"_traits"];
  [v4 encodeObject:self->_tracePlaybackPath forKey:@"_tracePlaybackPath"];
  [v4 encodeObject:self->_traceRecordingData forKey:@"_traceRecordingData"];
  [v4 encodeInteger:self->_simulationType forKey:@"_simulationType"];
  [v4 encodeObject:self->_traceRecordingNameOverride forKey:@"_traceRecordingNameOverride"];
  [v4 encodeObject:self->_reconnectionDetails forKey:@"_reconnectionDetails"];
  v9 = v8;
  uint64_t v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v10, OS_SIGNPOST_INTERVAL_END, v6, "StartNavigationDetailsEncoding", "", v11, 2u);
  }
}

- (id)description
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  unint64_t selectedRouteIndex = self->_selectedRouteIndex;
  if (selectedRouteIndex >= [(NSArray *)self->_routes count])
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->_routes objectAtIndexedSubscript:self->_selectedRouteIndex];
  }
  v55 = v5;
  os_signpost_id_t v6 = [v5 destination];
  os_signpost_id_t v7 = NSString;
  v54 = v6;
  uint64_t v8 = [v6 humanDescriptionWithAddressAndLatLng];
  v9 = [v7 stringWithFormat:@"destination: %@", v8];
  [v3 addObject:v9];

  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v11 = self->_routes;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v57 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v56 + 1) + 8 * i) name];
        v17 = (void *)v16;
        if (v16) {
          v18 = (__CFString *)v16;
        }
        else {
          v18 = @"(no name)";
        }
        uint64_t v19 = v18;

        [v10 addObject:v19];
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v13);
  }

  v20 = NSString;
  uint64_t v21 = [v10 componentsJoinedByString:@", "];
  v22 = [v20 stringWithFormat:@"routes: %@", v21];
  [v3 addObject:v22];

  v23 = objc_msgSend(NSString, "stringWithFormat:", @"selectedRouteIndex: %d", self->_selectedRouteIndex);
  [v3 addObject:v23];

  unint64_t v24 = self->_navigationType - 1;
  if (v24 > 3) {
    uint64_t v25 = @"None";
  }
  else {
    uint64_t v25 = off_1E60F6AE8[v24];
  }
  v26 = [NSString stringWithFormat:@"navigationType: %@", v25];
  [v3 addObject:v26];

  unint64_t guidanceType = self->_guidanceType;
  v28 = @"Full";
  if (guidanceType == 1) {
    v28 = @"Low";
  }
  if (guidanceType == 2) {
    uint64_t v29 = @"RoutePreview";
  }
  else {
    uint64_t v29 = v28;
  }
  v30 = [NSString stringWithFormat:@"guidanceType: %@", v29];
  [v3 addObject:v30];

  uint64_t v31 = NSString;
  uint64_t v32 = [v55 transportType];
  if (v32 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v32);
    uint64_t v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v33 = off_1E60F6B08[(int)v32];
  }
  v34 = [v31 stringWithFormat:@"transportType: %@", v33];
  [v3 addObject:v34];

  initialUserLocation = self->_initialUserLocation;
  if (initialUserLocation)
  {
    v36 = NSString;
    [(MNLocation *)initialUserLocation coordinate];
    uint64_t v38 = v37;
    [(MNLocation *)self->_initialUserLocation coordinate];
    v40 = [v36 stringWithFormat:@"initialUserLocation: %f, %f", v38, v39];
    [v3 addObject:v40];
  }
  else
  {
    [v3 addObject:@"initialUserLocation: (none)"];
  }
  v41 = NSString;
  unint64_t v42 = self->_guidanceLevelOverride + 1;
  if (v42 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN: %lu", self->_guidanceLevelOverride);
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = off_1E60F6B40[v42];
  }
  v44 = [v41 stringWithFormat:@"guidanceLevelOverride: %@", v43];
  [v3 addObject:v44];

  v45 = objc_msgSend(NSString, "stringWithFormat:", @"isResumingMultipointRoute: %d", self->_isResumingMultipointRoute);
  [v3 addObject:v45];

  objc_super v46 = [NSString stringWithFormat:@"tracePlaybackPath: %@", self->_tracePlaybackPath];
  [v3 addObject:v46];

  v47 = objc_msgSend(NSString, "stringWithFormat:", @"traceRecordingData: %p", self->_traceRecordingData);
  [v3 addObject:v47];

  v48 = [NSString stringWithFormat:@"traceRecordingNameOverride: %@", self->_traceRecordingNameOverride];
  [v3 addObject:v48];

  unint64_t v49 = self->_simulationType + 1;
  if (v49 > 5) {
    v50 = @"None";
  }
  else {
    v50 = off_1E60F6B60[v49];
  }
  v51 = [NSString stringWithFormat:@"simulationType: %@", v50];
  [v3 addObject:v51];

  v52 = [v3 componentsJoinedByString:@"\n\t"];

  return v52;
}

- (void)setTracePlaybackPath:(id)a3
{
}

- (void)setTraceRecordingData:(id)a3
{
}

- (void)setSimulationType:(int64_t)a3
{
  self->_simulationType = a3;
}

- (void)setTraceRecordingNameOverride:(id)a3
{
}

- (int64_t)navigationType
{
  return self->_navigationType;
}

- (void)setNavigationType:(int64_t)a3
{
  self->_navigationType = a3;
}

- (unint64_t)guidanceType
{
  return self->_guidanceType;
}

- (void)setGuidanceType:(unint64_t)a3
{
  self->_unint64_t guidanceType = a3;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (void)setDirectionsRequest:(id)a3
{
}

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (void)setDirectionsResponse:(id)a3
{
}

- (NSArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
}

- (NSDictionary)traffic
{
  return self->_traffic;
}

- (void)setTraffic:(id)a3
{
}

- (unint64_t)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (void)setSelectedRouteIndex:(unint64_t)a3
{
  self->_unint64_t selectedRouteIndex = a3;
}

- (MNLocation)initialUserLocation
{
  return self->_initialUserLocation;
}

- (void)setInitialUserLocation:(id)a3
{
}

- (unint64_t)guidanceLevelOverride
{
  return self->_guidanceLevelOverride;
}

- (void)setGuidanceLevelOverride:(unint64_t)a3
{
  self->_guidanceLevelOverride = a3;
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  self->_isResumingMultipointRoute = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (NSString)requestingAppIdentifier
{
  return self->_requestingAppIdentifier;
}

- (void)setRequestingAppIdentifier:(id)a3
{
}

- (NSString)tracePlaybackPath
{
  return self->_tracePlaybackPath;
}

- (MNTraceRecordingData)traceRecordingData
{
  return self->_traceRecordingData;
}

- (int64_t)simulationType
{
  return self->_simulationType;
}

- (NSString)traceRecordingNameOverride
{
  return self->_traceRecordingNameOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_reconnectionDetails, 0);
  objc_storeStrong((id *)&self->_initialUserLocation, 0);
  objc_storeStrong((id *)&self->_traffic, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_traceRecordingNameOverride, 0);
  objc_storeStrong((id *)&self->_traceRecordingData, 0);
  objc_storeStrong((id *)&self->_tracePlaybackPath, 0);
}

- (MNStartNavigationReconnectionDetails)reconnectionDetails
{
  return self->_reconnectionDetails;
}

- (void)setReconnectionDetails:(id)a3
{
}

@end