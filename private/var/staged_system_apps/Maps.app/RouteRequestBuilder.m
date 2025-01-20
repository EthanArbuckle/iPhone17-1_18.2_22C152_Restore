@interface RouteRequestBuilder
- (BOOL)isResumingMultipointRoute;
- (GEOComposedGeometryRoutePersistentData)persistentData;
- (GEOLocation)currentUserLocation;
- (GEOMapServiceTraits)traits;
- (GEOResumeRouteHandle)resumeRouteHandle;
- (NSArray)routeAttributesBuilders;
- (RouteRequestBuilder)initWithWaypointSet:(id)a3 maximumRouteCount:(unint64_t)a4 routeAttributesBuilders:(id)a5 currentUserLocation:(id)a6 initiator:(unint64_t)a7 traits:(id)a8 isResumingMultipointRoute:(BOOL)a9 resumeRouteHandle:(id)a10 persistentData:(id)a11;
- (WaypointSet)waypointSet;
- (id)appIdentifierForInitiator;
- (id)buildDirectionsRequestDetails;
- (int)sourceFromInitiator;
- (unint64_t)initiator;
- (unint64_t)maximumRouteCount;
- (void)setPersistentData:(id)a3;
@end

@implementation RouteRequestBuilder

- (RouteRequestBuilder)initWithWaypointSet:(id)a3 maximumRouteCount:(unint64_t)a4 routeAttributesBuilders:(id)a5 currentUserLocation:(id)a6 initiator:(unint64_t)a7 traits:(id)a8 isResumingMultipointRoute:(BOOL)a9 resumeRouteHandle:(id)a10 persistentData:(id)a11
{
  id v16 = a3;
  id v30 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a10;
  id v20 = a11;
  v31.receiver = self;
  v31.super_class = (Class)RouteRequestBuilder;
  v21 = [(RouteRequestBuilder *)&v31 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_waypointSet, a3);
    v22->_maximumRouteCount = a4;
    v23 = (NSArray *)[v30 copy];
    routeAttributesBuilders = v22->_routeAttributesBuilders;
    v22->_routeAttributesBuilders = v23;

    v25 = (GEOLocation *)[v17 copy];
    currentUserLocation = v22->_currentUserLocation;
    v22->_currentUserLocation = v25;

    v22->_initiator = a7;
    objc_storeStrong((id *)&v22->_traits, a8);
    v22->_isResumingMultipointRoute = a9;
    objc_storeStrong((id *)&v22->_resumeRouteHandle, a10);
    objc_storeStrong((id *)&v22->_persistentData, a11);
  }

  return v22;
}

- (id)buildDirectionsRequestDetails
{
  v3 = +[GEORouteAttributes defaultRouteAttributes];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v4 = [(RouteRequestBuilder *)self routeAttributesBuilders];
  id v5 = [v4 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v46;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v45 + 1) + 8 * i) fillRouteAttributes:v3];
      }
      id v6 = [v4 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v6);
  }

  v9 = [(RouteRequestBuilder *)self waypointSet];
  unsigned __int8 v10 = [v9 areAllValidWaypoints];

  if ((v10 & 1) == 0)
  {
    v11 = sub_10000AF10();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [(RouteRequestBuilder *)self waypointSet];
      *(_DWORD *)buf = 138412290;
      v50 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "making a directions request with waypoints: %@", buf, 0xCu);
    }
  }
  v13 = [(RouteRequestBuilder *)self waypointSet];
  unint64_t v14 = (unint64_t)[v13 count];

  if (v14 <= 1)
  {
    v15 = sub_10000AF10();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [(RouteRequestBuilder *)self waypointSet];
      *(_DWORD *)buf = 134218242;
      v50 = (RouteRequestBuilder *)v14;
      __int16 v51 = 2112;
      v52 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Invalid number of waypoints: %lu, waypointSet: %@", buf, 0x16u);
    }
  }
  switch([v3 mainTransportType])
  {
    case 1u:
    case 6u:
      if (v14 >= 2) {
        unint64_t v14 = 2;
      }
      goto LABEL_26;
    case 2u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      goto LABEL_22;
    case 3u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
LABEL_22:
      uint64_t v18 = 2;
      if (v14 < 2) {
        uint64_t v18 = v14;
      }
      if ((IsEnabled_Maps182 & 1) == 0) {
        goto LABEL_25;
      }
      goto LABEL_26;
    default:
      int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
      uint64_t v18 = 2;
      if (v14 < 2) {
        uint64_t v18 = v14;
      }
      if (IsEnabled_DrivingMultiWaypointRoutes) {
        goto LABEL_26;
      }
LABEL_25:
      unint64_t v14 = v18;
LABEL_26:
      v44 = objc_opt_new();
      if (v14)
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          id v20 = [(RouteRequestBuilder *)self waypointSet];
          v21 = [v20 waypointAtIndex:j];

          if (v21)
          {
            id v22 = objc_alloc((Class)GEOMapRegion);
            v23 = [v21 latLng];
            [v23 lat];
            double v25 = v24;
            v26 = [v21 latLng];
            [v26 lng];
            id v28 = [v22 initWithLatitude:v25 longitude:v27];

            v29 = +[MapsOfflineUIHelper sharedHelper];
            [v21 setIsOutsideOfflineDownloadedRegion:[v29 isRegionDownloaded:v28 requireFullyDownloaded:1] ^ 1];

            id v30 = [v21 copy];
            [v44 addObject:v30];
          }
        }
      }
      id v31 = [objc_alloc((Class)MNDirectionsRequestDetails) initWithWaypoints:v44 routeAttributes:v3];
      v32 = [(RouteRequestBuilder *)self traits];
      [v31 setTraits:v32];

      [v31 setMaxRouteCount:[self maximumRouteCount]];
      v33 = [(RouteRequestBuilder *)self currentUserLocation];
      [v31 setCurrentUserLocation:v33];

      [v31 setIsResumingMultipointRoute:[self isResumingMultipointRoute]];
      v34 = [(RouteRequestBuilder *)self resumeRouteHandle];
      [v31 setResumeRouteHandle:v34];

      v35 = [(RouteRequestBuilder *)self persistentData];
      [v31 setPersistentData:v35];

      id v36 = objc_alloc_init((Class)GEODirectionsRequestFeedback);
      [v36 setPurpose:4];
      [v36 setSource:[self sourceFromInitiator]];
      v37 = +[NSBundle mainBundle];
      v38 = [v37 bundleIdentifier];
      [v36 setRequestingAppId:v38];

      v39 = [(RouteRequestBuilder *)self appIdentifierForInitiator];
      [v36 setAppIdentifier:v39];

      [v31 setDirectionsRequestFeedback:v36];
      if (+[PedestrianARSessionTask isPedestrianARModeSupported])
      {
        v40 = objc_opt_new();
        [v40 setSupportsArMode:1];
        [v31 setCommonOptions:v40];
        v41 = sub_10000AF10();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          v50 = self;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "[%{public}p] Marking route request with supportsArMode", buf, 0xCu);
        }
      }
      else
      {
        v40 = sub_10000AF10();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          v50 = self;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "[%{public}p] NOT marking route request with supportsArMode", buf, 0xCu);
        }
      }

      return v31;
  }
}

- (int)sourceFromInitiator
{
  unint64_t v2 = [(RouteRequestBuilder *)self initiator];
  if (v2 > 8) {
    return 2;
  }
  else {
    return dword_100F7005C[v2];
  }
}

- (id)appIdentifierForInitiator
{
  if ((id)[(RouteRequestBuilder *)self initiator] == (id)4) {
    return @"com.apple.AssistantServices";
  }
  else {
    return 0;
  }
}

- (WaypointSet)waypointSet
{
  return self->_waypointSet;
}

- (unint64_t)maximumRouteCount
{
  return self->_maximumRouteCount;
}

- (NSArray)routeAttributesBuilders
{
  return self->_routeAttributesBuilders;
}

- (GEOLocation)currentUserLocation
{
  return self->_currentUserLocation;
}

- (unint64_t)initiator
{
  return self->_initiator;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  return self->_resumeRouteHandle;
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  return self->_persistentData;
}

- (void)setPersistentData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentData, 0);
  objc_storeStrong((id *)&self->_resumeRouteHandle, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_currentUserLocation, 0);
  objc_storeStrong((id *)&self->_routeAttributesBuilders, 0);

  objc_storeStrong((id *)&self->_waypointSet, 0);
}

@end