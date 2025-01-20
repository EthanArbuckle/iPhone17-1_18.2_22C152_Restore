@interface RAPDirectionsRecording
+ (Class)auxiliaryControlsType;
+ (Class)directionsRequestsType;
+ (Class)directionsResponsesType;
+ (Class)routeType;
+ (Class)userPathType;
+ (Class)waypointsType;
- (BOOL)hasDirectionsResponseID;
- (BOOL)hasEndWaypoint;
- (BOOL)hasEndWaypointCorrectedSearchTemplate;
- (BOOL)hasNavigationSessionID;
- (BOOL)hasOriginatingAuxiliaryControlIndex;
- (BOOL)hasOverviewScreenshotImageData;
- (BOOL)hasSelectedDirectionsResponseIndex;
- (BOOL)hasSelectedSuggestedRouteIndexInDirectionsResponse;
- (BOOL)hasStartWaypoint;
- (BOOL)hasStartWaypointCorrectedSearchTemplate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPCorrectedSearch)endWaypointCorrectedSearchTemplate;
- (GEORPCorrectedSearch)startWaypointCorrectedSearchTemplate;
- (NSArray)auxiliaryControls;
- (NSData)directionsResponseID;
- (NSData)overviewScreenshotImageData;
- (NSMutableArray)directionsRequests;
- (NSMutableArray)directionsResponses;
- (NSMutableArray)routes;
- (NSMutableArray)userPaths;
- (NSMutableArray)waypoints;
- (NSString)description;
- (RAPNavSessionID)navigationSessionID;
- (RAPUserSearchInput)endWaypoint;
- (RAPUserSearchInput)startWaypoint;
- (id)auxiliaryControlsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)directionsRequestsAtIndex:(unint64_t)a3;
- (id)directionsResponsesAtIndex:(unint64_t)a3;
- (id)routeAtIndex:(unint64_t)a3;
- (id)userPathAtIndex:(unint64_t)a3;
- (id)waypointsAtIndex:(unint64_t)a3;
- (unint64_t)auxiliaryControlsCount;
- (unint64_t)clusteredRouteRideSelectionsCount;
- (unint64_t)directionsRequestsCount;
- (unint64_t)directionsResponsesCount;
- (unint64_t)hash;
- (unint64_t)originatingAuxiliaryControlIndex;
- (unint64_t)routesCount;
- (unint64_t)userPathsCount;
- (unint64_t)waypointsCount;
- (unsigned)clusteredRouteRideSelections;
- (unsigned)clusteredRouteRideSelectionsAtIndex:(unint64_t)a3;
- (unsigned)selectedDirectionsResponseIndex;
- (unsigned)selectedSuggestedRouteIndexInDirectionsResponse;
- (void)addAuxiliaryControls:(id)a3;
- (void)addClusteredRouteRideSelections:(unsigned int)a3;
- (void)addDirectionsRequests:(id)a3;
- (void)addDirectionsResponses:(id)a3;
- (void)addRoute:(id)a3;
- (void)addUserPath:(id)a3;
- (void)addWaypoints:(id)a3;
- (void)clearAuxiliaryControls;
- (void)clearClusteredRouteRideSelections;
- (void)clearDirectionsRequests;
- (void)clearDirectionsResponses;
- (void)clearRoutes;
- (void)clearUserPaths;
- (void)clearWaypoints;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAuxiliaryControls:(id)a3;
- (void)setClusteredRouteRideSelections:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDirectionsRequests:(id)a3;
- (void)setDirectionsResponseID:(id)a3;
- (void)setDirectionsResponses:(id)a3;
- (void)setEndWaypoint:(id)a3;
- (void)setEndWaypointCorrectedSearchTemplate:(id)a3;
- (void)setHasNavigationSessionID:(BOOL)a3;
- (void)setHasOriginatingAuxiliaryControlIndex:(BOOL)a3;
- (void)setHasSelectedDirectionsResponseIndex:(BOOL)a3;
- (void)setHasSelectedSuggestedRouteIndexInDirectionsResponse:(BOOL)a3;
- (void)setNavigationSessionID:(RAPNavSessionID)a3;
- (void)setOriginatingAuxiliaryControlIndex:(unint64_t)a3;
- (void)setOverviewScreenshotImageData:(id)a3;
- (void)setRoutes:(id)a3;
- (void)setSelectedDirectionsResponseIndex:(unsigned int)a3;
- (void)setSelectedSuggestedRouteIndexInDirectionsResponse:(unsigned int)a3;
- (void)setStartWaypoint:(id)a3;
- (void)setStartWaypointCorrectedSearchTemplate:(id)a3;
- (void)setUserPaths:(id)a3;
- (void)setWaypoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RAPDirectionsRecording

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)RAPDirectionsRecording;
  [(RAPDirectionsRecording *)&v3 dealloc];
}

- (void)clearDirectionsRequests
{
}

- (void)addDirectionsRequests:(id)a3
{
  id v4 = a3;
  directionsRequests = self->_directionsRequests;
  id v8 = v4;
  if (!directionsRequests)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_directionsRequests;
    self->_directionsRequests = v6;

    id v4 = v8;
    directionsRequests = self->_directionsRequests;
  }
  [(NSMutableArray *)directionsRequests addObject:v4];
}

- (unint64_t)directionsRequestsCount
{
  return (unint64_t)[(NSMutableArray *)self->_directionsRequests count];
}

- (id)directionsRequestsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_directionsRequests objectAtIndex:a3];
}

+ (Class)directionsRequestsType
{
  return (Class)objc_opt_class();
}

- (void)clearDirectionsResponses
{
}

- (void)addDirectionsResponses:(id)a3
{
  id v4 = a3;
  directionsResponses = self->_directionsResponses;
  id v8 = v4;
  if (!directionsResponses)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_directionsResponses;
    self->_directionsResponses = v6;

    id v4 = v8;
    directionsResponses = self->_directionsResponses;
  }
  [(NSMutableArray *)directionsResponses addObject:v4];
}

- (unint64_t)directionsResponsesCount
{
  return (unint64_t)[(NSMutableArray *)self->_directionsResponses count];
}

- (id)directionsResponsesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_directionsResponses objectAtIndex:a3];
}

+ (Class)directionsResponsesType
{
  return (Class)objc_opt_class();
}

- (void)setSelectedDirectionsResponseIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_selectedDirectionsResponseIndex = a3;
}

- (void)setHasSelectedDirectionsResponseIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSelectedDirectionsResponseIndex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSelectedSuggestedRouteIndexInDirectionsResponse:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_selectedSuggestedRouteIndexInDirectionsResponse = a3;
}

- (void)setHasSelectedSuggestedRouteIndexInDirectionsResponse:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSelectedSuggestedRouteIndexInDirectionsResponse
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasOverviewScreenshotImageData
{
  return self->_overviewScreenshotImageData != 0;
}

- (BOOL)hasDirectionsResponseID
{
  return self->_directionsResponseID != 0;
}

- (BOOL)hasStartWaypoint
{
  return self->_startWaypoint != 0;
}

- (BOOL)hasEndWaypoint
{
  return self->_endWaypoint != 0;
}

- (void)clearAuxiliaryControls
{
}

- (void)addAuxiliaryControls:(id)a3
{
  id v4 = a3;
  auxiliaryControls = self->_auxiliaryControls;
  id v8 = v4;
  if (!auxiliaryControls)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_auxiliaryControls;
    self->_auxiliaryControls = v6;

    id v4 = v8;
    auxiliaryControls = self->_auxiliaryControls;
  }
  [(NSMutableArray *)auxiliaryControls addObject:v4];
}

- (unint64_t)auxiliaryControlsCount
{
  return (unint64_t)[(NSMutableArray *)self->_auxiliaryControls count];
}

- (id)auxiliaryControlsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_auxiliaryControls objectAtIndex:a3];
}

+ (Class)auxiliaryControlsType
{
  return (Class)objc_opt_class();
}

- (void)setOriginatingAuxiliaryControlIndex:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_originatingAuxiliaryControlIndex = a3;
}

- (void)setHasOriginatingAuxiliaryControlIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOriginatingAuxiliaryControlIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasStartWaypointCorrectedSearchTemplate
{
  return self->_startWaypointCorrectedSearchTemplate != 0;
}

- (BOOL)hasEndWaypointCorrectedSearchTemplate
{
  return self->_endWaypointCorrectedSearchTemplate != 0;
}

- (unint64_t)clusteredRouteRideSelectionsCount
{
  return self->_clusteredRouteRideSelections.count;
}

- (unsigned)clusteredRouteRideSelections
{
  return self->_clusteredRouteRideSelections.list;
}

- (void)clearClusteredRouteRideSelections
{
}

- (void)addClusteredRouteRideSelections:(unsigned int)a3
{
}

- (unsigned)clusteredRouteRideSelectionsAtIndex:(unint64_t)a3
{
  p_clusteredRouteRideSelections = &self->_clusteredRouteRideSelections;
  unint64_t count = self->_clusteredRouteRideSelections.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_clusteredRouteRideSelections->list[a3];
}

- (void)setClusteredRouteRideSelections:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setNavigationSessionID:(RAPNavSessionID)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_navigationSessionID = a3;
}

- (void)setHasNavigationSessionID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNavigationSessionID
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearUserPaths
{
}

- (void)addUserPath:(id)a3
{
  id v4 = a3;
  userPaths = self->_userPaths;
  id v8 = v4;
  if (!userPaths)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_userPaths;
    self->_userPaths = v6;

    id v4 = v8;
    userPaths = self->_userPaths;
  }
  [(NSMutableArray *)userPaths addObject:v4];
}

- (unint64_t)userPathsCount
{
  return (unint64_t)[(NSMutableArray *)self->_userPaths count];
}

- (id)userPathAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_userPaths objectAtIndex:a3];
}

+ (Class)userPathType
{
  return (Class)objc_opt_class();
}

- (void)clearWaypoints
{
}

- (void)addWaypoints:(id)a3
{
  id v4 = a3;
  waypoints = self->_waypoints;
  id v8 = v4;
  if (!waypoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_waypoints;
    self->_waypoints = v6;

    id v4 = v8;
    waypoints = self->_waypoints;
  }
  [(NSMutableArray *)waypoints addObject:v4];
}

- (unint64_t)waypointsCount
{
  return (unint64_t)[(NSMutableArray *)self->_waypoints count];
}

- (id)waypointsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_waypoints objectAtIndex:a3];
}

+ (Class)waypointsType
{
  return (Class)objc_opt_class();
}

- (void)clearRoutes
{
}

- (void)addRoute:(id)a3
{
  id v4 = a3;
  routes = self->_routes;
  id v8 = v4;
  if (!routes)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_routes;
    self->_routes = v6;

    id v4 = v8;
    routes = self->_routes;
  }
  [(NSMutableArray *)routes addObject:v4];
}

- (unint64_t)routesCount
{
  return (unint64_t)[(NSMutableArray *)self->_routes count];
}

- (id)routeAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_routes objectAtIndex:a3];
}

+ (Class)routeType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)RAPDirectionsRecording;
  char v3 = [(RAPDirectionsRecording *)&v7 description];
  id v4 = [(RAPDirectionsRecording *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return (NSString *)v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_directionsRequests count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_directionsRequests, "count")];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v5 = self->_directionsRequests;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v83 objects:v92 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v84;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v84 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v83 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v83 objects:v92 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"directionsRequests"];
  }
  if ([(NSMutableArray *)self->_directionsResponses count])
  {
    id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_directionsResponses, "count")];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v12 = self->_directionsResponses;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v79 objects:v91 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v80;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v80 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v79 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v79 objects:v91 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"directionsResponses"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v19 = +[NSNumber numberWithUnsignedInt:self->_selectedDirectionsResponseIndex];
    [v3 setObject:v19 forKey:@"selectedDirectionsResponseIndex"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v20 = +[NSNumber numberWithUnsignedInt:self->_selectedSuggestedRouteIndexInDirectionsResponse];
    [v3 setObject:v20 forKey:@"selectedSuggestedRouteIndexInDirectionsResponse"];
  }
  overviewScreenshotImageData = self->_overviewScreenshotImageData;
  if (overviewScreenshotImageData) {
    [v3 setObject:overviewScreenshotImageData forKey:@"overviewScreenshotImageData"];
  }
  directionsResponseID = self->_directionsResponseID;
  if (directionsResponseID) {
    [v3 setObject:directionsResponseID forKey:@"directionsResponseID"];
  }
  startWaypoint = self->_startWaypoint;
  if (startWaypoint)
  {
    v24 = [(RAPUserSearchInput *)startWaypoint dictionaryRepresentation];
    [v3 setObject:v24 forKey:@"startWaypoint"];
  }
  endWaypoint = self->_endWaypoint;
  if (endWaypoint)
  {
    v26 = [(RAPUserSearchInput *)endWaypoint dictionaryRepresentation];
    [v3 setObject:v26 forKey:@"endWaypoint"];
  }
  if ([(NSMutableArray *)self->_auxiliaryControls count])
  {
    id v27 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_auxiliaryControls, "count")];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v28 = self->_auxiliaryControls;
    id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v75 objects:v90 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v76;
      do
      {
        for (k = 0; k != v30; k = (char *)k + 1)
        {
          if (*(void *)v76 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v75 + 1) + 8 * (void)k) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v75 objects:v90 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKey:@"auxiliaryControls"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v34 = +[NSNumber numberWithUnsignedLongLong:self->_originatingAuxiliaryControlIndex];
    [v3 setObject:v34 forKey:@"originatingAuxiliaryControlIndex"];
  }
  startWaypointCorrectedSearchTemplate = self->_startWaypointCorrectedSearchTemplate;
  if (startWaypointCorrectedSearchTemplate)
  {
    v36 = [(GEORPCorrectedSearch *)startWaypointCorrectedSearchTemplate dictionaryRepresentation];
    [v3 setObject:v36 forKey:@"startWaypointCorrectedSearchTemplate"];
  }
  endWaypointCorrectedSearchTemplate = self->_endWaypointCorrectedSearchTemplate;
  if (endWaypointCorrectedSearchTemplate)
  {
    v38 = [(GEORPCorrectedSearch *)endWaypointCorrectedSearchTemplate dictionaryRepresentation];
    [v3 setObject:v38 forKey:@"endWaypointCorrectedSearchTemplate"];
  }
  v39 = PBRepeatedUInt32NSArray();
  [v3 setObject:v39 forKey:@"clusteredRouteRideSelections"];

  if (*(unsigned char *)&self->_has)
  {
    v40 = sub_100594F44(&self->_navigationSessionID._high);
    [v3 setObject:v40 forKey:@"navigationSessionID"];
  }
  if ([(NSMutableArray *)self->_userPaths count])
  {
    id v41 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_userPaths, "count")];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v42 = self->_userPaths;
    id v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v71 objects:v89 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v72;
      do
      {
        for (m = 0; m != v44; m = (char *)m + 1)
        {
          if (*(void *)v72 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = [*(id *)(*((void *)&v71 + 1) + 8 * (void)m) dictionaryRepresentation];
          [v41 addObject:v47];
        }
        id v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v71 objects:v89 count:16];
      }
      while (v44);
    }

    [v3 setObject:v41 forKey:@"userPath"];
  }
  if ([(NSMutableArray *)self->_waypoints count])
  {
    id v48 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_waypoints, "count")];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v49 = self->_waypoints;
    id v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v67 objects:v88 count:16];
    if (v50)
    {
      id v51 = v50;
      uint64_t v52 = *(void *)v68;
      do
      {
        for (n = 0; n != v51; n = (char *)n + 1)
        {
          if (*(void *)v68 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = [*(id *)(*((void *)&v67 + 1) + 8 * (void)n) dictionaryRepresentation];
          [v48 addObject:v54];
        }
        id v51 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v67 objects:v88 count:16];
      }
      while (v51);
    }

    [v3 setObject:v48 forKey:@"waypoints"];
  }
  if ([(NSMutableArray *)self->_routes count])
  {
    id v55 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_routes, "count")];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v56 = self->_routes;
    id v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v63 objects:v87 count:16];
    if (v57)
    {
      id v58 = v57;
      uint64_t v59 = *(void *)v64;
      do
      {
        for (ii = 0; ii != v58; ii = (char *)ii + 1)
        {
          if (*(void *)v64 != v59) {
            objc_enumerationMutation(v56);
          }
          v61 = [*(id *)(*((void *)&v63 + 1) + 8 * (void)ii) dictionaryRepresentation];
          [v55 addObject:v61];
        }
        id v58 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v63 objects:v87 count:16];
      }
      while (v58);
    }

    [v3 setObject:v55 forKey:@"route"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                            + OBJC_IVAR___PBDataReader__length))
  {
LABEL_104:
    LOBYTE(v34) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    return v34;
  }
  while (2)
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      goto LABEL_104;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      BOOL v10 = v6++ >= 9;
      if (v10)
      {
        unint64_t v7 = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    int v12 = v7 & 7;
    if (v11 || v12 == 4) {
      goto LABEL_104;
    }
    switch((v7 >> 3))
    {
      case 1u:
        id v14 = (RAPUserSearchInput *)objc_alloc_init((Class)GEODirectionsRequest);
        [(RAPDirectionsRecording *)self addDirectionsRequests:v14];
        goto LABEL_77;
      case 2u:
        id v14 = (RAPUserSearchInput *)objc_alloc_init((Class)GEODirectionsResponse);
        [(RAPDirectionsRecording *)self addDirectionsResponses:v14];
        goto LABEL_77;
      case 3u:
        char v15 = 0;
        unsigned int v16 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)&self->_has |= 4u;
        while (2)
        {
          unint64_t v18 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v18 == -1 || v18 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v19 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
            v17 |= (unint64_t)(v19 & 0x7F) << v15;
            if (v19 < 0)
            {
              v15 += 7;
              BOOL v10 = v16++ >= 9;
              if (v10)
              {
                LODWORD(v17) = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v17) = 0;
        }
LABEL_85:
        uint64_t v40 = 120;
        goto LABEL_90;
      case 4u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)&self->_has |= 8u;
        while (2)
        {
          unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1 || v22 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v23 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v17 |= (unint64_t)(v23 & 0x7F) << v20;
            if (v23 < 0)
            {
              v20 += 7;
              BOOL v10 = v21++ >= 9;
              if (v10)
              {
                LODWORD(v17) = 0;
                goto LABEL_89;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v17) = 0;
        }
LABEL_89:
        uint64_t v40 = 124;
LABEL_90:
        *(_DWORD *)&self->PBCodable_opaque[v40] = v17;
        goto LABEL_80;
      case 5u:
        uint64_t v24 = PBReaderReadData();
        uint64_t v25 = 104;
        goto LABEL_38;
      case 6u:
        uint64_t v24 = PBReaderReadData();
        uint64_t v25 = 72;
LABEL_38:
        v26 = *(void **)&self->PBCodable_opaque[v25];
        *(void *)&self->PBCodable_opaque[v25] = v24;

        goto LABEL_80;
      case 7u:
        id v14 = objc_alloc_init(RAPUserSearchInput);
        uint64_t v27 = 128;
        goto LABEL_41;
      case 8u:
        id v14 = objc_alloc_init(RAPUserSearchInput);
        uint64_t v27 = 88;
LABEL_41:
        objc_storeStrong((id *)&self->PBCodable_opaque[v27], v14);
        goto LABEL_73;
      case 9u:
        id v14 = (RAPUserSearchInput *)objc_alloc_init((Class)GEORPAuxiliaryControl);
        [(RAPDirectionsRecording *)self addAuxiliaryControls:v14];
        goto LABEL_77;
      case 0xAu:
        char v28 = 0;
        unsigned int v29 = 0;
        unint64_t v30 = 0;
        *(unsigned char *)&self->_has |= 2u;
        while (2)
        {
          unint64_t v31 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v31 == -1 || v31 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v31);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v31 + 1;
            v30 |= (unint64_t)(v32 & 0x7F) << v28;
            if (v32 < 0)
            {
              v28 += 7;
              BOOL v10 = v29++ >= 9;
              if (v10)
              {
                unint64_t v30 = 0;
                goto LABEL_94;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          unint64_t v30 = 0;
        }
LABEL_94:
        self->_originatingAuxiliaryControlIndex = v30;
        goto LABEL_80;
      case 0xBu:
        id v14 = (RAPUserSearchInput *)objc_alloc_init((Class)GEORPCorrectedSearch);
        uint64_t v33 = 136;
        goto LABEL_52;
      case 0xCu:
        id v14 = (RAPUserSearchInput *)objc_alloc_init((Class)GEORPCorrectedSearch);
        uint64_t v33 = 96;
LABEL_52:
        objc_storeStrong((id *)&self->PBCodable_opaque[v33], v14);
        goto LABEL_77;
      case 0xDu:
        if (v12 == 2)
        {
          int v34 = PBReaderPlaceMark();
          if (!v34) {
            return v34;
          }
          while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                                      + OBJC_IVAR___PBDataReader__length)
               && !*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error))
          {
            char v35 = 0;
            unsigned int v36 = 0;
            uint64_t v37 = 0;
            while (1)
            {
              unint64_t v38 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
              if (v38 == -1 || v38 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
                break;
              }
              char v39 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v38);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v38 + 1;
              v37 |= (unint64_t)(v39 & 0x7F) << v35;
              if (v39 < 0)
              {
                v35 += 7;
                BOOL v10 = v36++ >= 9;
                if (!v10) {
                  continue;
                }
              }
              goto LABEL_65;
            }
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_65:
            PBRepeatedUInt32Add();
          }
LABEL_68:
          PBReaderRecallMark();
        }
        else
        {
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v43 = 0;
          while (1)
          {
            unint64_t v44 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v44 == -1 || v44 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v45 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v44);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v44 + 1;
            v43 |= (unint64_t)(v45 & 0x7F) << v41;
            if (v45 < 0)
            {
              v41 += 7;
              BOOL v10 = v42++ >= 9;
              if (!v10) {
                continue;
              }
            }
            goto LABEL_103;
          }
          *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_103:
          PBRepeatedUInt32Add();
        }
        goto LABEL_80;
      case 0xEu:
        *(unsigned char *)&self->_has |= 1u;
        if (PBReaderPlaceMark()
          && (sub_100594FF0(&self->_navigationSessionID._high, (uint64_t)a3) & 1) != 0)
        {
          goto LABEL_68;
        }
        goto LABEL_107;
      case 0xFu:
        id v14 = objc_alloc_init(RAPUserPathEntry);
        [(RAPDirectionsRecording *)self addUserPath:v14];
        if (!PBReaderPlaceMark() || (sub_100B96908((uint64_t)v14, (uint64_t)a3) & 1) == 0) {
          goto LABEL_106;
        }
        goto LABEL_79;
      case 0x10u:
        id v14 = objc_alloc_init(RAPUserSearchInput);
        [(RAPDirectionsRecording *)self addWaypoints:v14];
LABEL_73:
        if (!PBReaderPlaceMark() || (sub_10083ED40((uint64_t)v14, (uint64_t)a3) & 1) == 0) {
          goto LABEL_106;
        }
        goto LABEL_79;
      case 0x11u:
        id v14 = (RAPUserSearchInput *)objc_alloc_init((Class)GEOWaypointRoute);
        [(RAPDirectionsRecording *)self addRoute:v14];
LABEL_77:
        if (PBReaderPlaceMark() && -[RAPUserSearchInput readFrom:](v14, "readFrom:", a3, 0, 0))
        {
LABEL_79:
          PBReaderRecallMark();

LABEL_80:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_104;
          continue;
        }
LABEL_106:

LABEL_107:
        LOBYTE(v34) = 0;
        return v34;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          goto LABEL_107;
        }
        goto LABEL_80;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  char v5 = self->_directionsRequests;
  unsigned int v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v59;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v59 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      unint64_t v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v7);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  BOOL v10 = self->_directionsResponses;
  int v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v11)
  {
    int v12 = v11;
    uint64_t v13 = *(void *)v55;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(void *)v55 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      int v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v12);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_overviewScreenshotImageData) {
    PBDataWriterWriteDataField();
  }
  if (self->_directionsResponseID) {
    PBDataWriterWriteDataField();
  }
  if (self->_startWaypoint) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_endWaypoint) {
    PBDataWriterWriteSubmessage();
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  unsigned int v16 = self->_auxiliaryControls;
  uint64_t v17 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v50 objects:v65 count:16];
  if (v17)
  {
    unint64_t v18 = v17;
    uint64_t v19 = *(void *)v51;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(void *)v51 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      unint64_t v18 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v50 objects:v65 count:16];
    }
    while (v18);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_startWaypointCorrectedSearchTemplate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_endWaypointCorrectedSearchTemplate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_clusteredRouteRideSelections.count)
  {
    unint64_t v21 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v21;
    }
    while (v21 < self->_clusteredRouteRideSelections.count);
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v49 = 0;
    PBDataWriterPlaceMark();
    sub_100595270((uint64_t)&self->_navigationSessionID, v4);
    PBDataWriterRecallMark();
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  unint64_t v22 = self->_userPaths;
  char v23 = (char *)[(NSMutableArray *)v22 countByEnumeratingWithState:&v45 objects:v64 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v46;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(void *)v46 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v24 = (char *)[(NSMutableArray *)v22 countByEnumeratingWithState:&v45 objects:v64 count:16];
    }
    while (v24);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v27 = self->_waypoints;
  char v28 = (char *)[(NSMutableArray *)v27 countByEnumeratingWithState:&v41 objects:v63 count:16];
  if (v28)
  {
    unsigned int v29 = v28;
    uint64_t v30 = *(void *)v42;
    do
    {
      for (n = 0; n != v29; ++n)
      {
        if (*(void *)v42 != v30) {
          objc_enumerationMutation(v27);
        }
        PBDataWriterWriteSubmessage();
      }
      unsigned int v29 = (char *)[(NSMutableArray *)v27 countByEnumeratingWithState:&v41 objects:v63 count:16];
    }
    while (v29);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  char v32 = self->_routes;
  uint64_t v33 = (char *)[(NSMutableArray *)v32 countByEnumeratingWithState:&v37 objects:v62 count:16];
  if (v33)
  {
    int v34 = v33;
    uint64_t v35 = *(void *)v38;
    do
    {
      for (ii = 0; ii != v34; ++ii)
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(v32);
        }
        PBDataWriterWriteSubmessage();
      }
      int v34 = (char *)[(NSMutableArray *)v32 countByEnumeratingWithState:&v37 objects:v62 count:16];
    }
    while (v34);
  }
}

- (void)copyTo:(id)a3
{
  char v32 = (char *)a3;
  if ([(RAPDirectionsRecording *)self directionsRequestsCount])
  {
    [v32 clearDirectionsRequests];
    unint64_t v4 = [(RAPDirectionsRecording *)self directionsRequestsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(RAPDirectionsRecording *)self directionsRequestsAtIndex:i];
        [v32 addDirectionsRequests:v7];
      }
    }
  }
  if ([(RAPDirectionsRecording *)self directionsResponsesCount])
  {
    [v32 clearDirectionsResponses];
    unint64_t v8 = [(RAPDirectionsRecording *)self directionsResponsesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        int v11 = [(RAPDirectionsRecording *)self directionsResponsesAtIndex:j];
        [v32 addDirectionsResponses:v11];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v32 + 30) = self->_selectedDirectionsResponseIndex;
    v32[160] |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v32 + 31) = self->_selectedSuggestedRouteIndexInDirectionsResponse;
    v32[160] |= 8u;
  }
  if (self->_overviewScreenshotImageData) {
    [v32 setOverviewScreenshotImageData:];
  }
  if (self->_directionsResponseID) {
    [v32 setDirectionsResponseID:];
  }
  if (self->_startWaypoint) {
    [v32 setStartWaypoint:];
  }
  if (self->_endWaypoint) {
    [v32 setEndWaypoint:];
  }
  if ([(RAPDirectionsRecording *)self auxiliaryControlsCount])
  {
    [v32 clearAuxiliaryControls];
    unint64_t v13 = [(RAPDirectionsRecording *)self auxiliaryControlsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        unsigned int v16 = [(RAPDirectionsRecording *)self auxiliaryControlsAtIndex:k];
        [v32 addAuxiliaryControls:v16];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v32 + 6) = self->_originatingAuxiliaryControlIndex;
    v32[160] |= 2u;
  }
  if (self->_startWaypointCorrectedSearchTemplate) {
    [v32 setStartWaypointCorrectedSearchTemplate:];
  }
  if (self->_endWaypointCorrectedSearchTemplate) {
    [v32 setEndWaypointCorrectedSearchTemplate];
  }
  if ([(RAPDirectionsRecording *)self clusteredRouteRideSelectionsCount])
  {
    [v32 clearClusteredRouteRideSelections];
    unint64_t v17 = [(RAPDirectionsRecording *)self clusteredRouteRideSelectionsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
        [v32 addClusteredRouteRideSelections:[self clusteredRouteRideSelectionsAtIndex:m]];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *(RAPNavSessionID *)(v32 + 8) = self->_navigationSessionID;
    v32[160] |= 1u;
  }
  if ([(RAPDirectionsRecording *)self userPathsCount])
  {
    [v32 clearUserPaths];
    unint64_t v20 = [(RAPDirectionsRecording *)self userPathsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        char v23 = [(RAPDirectionsRecording *)self userPathAtIndex:n];
        [v32 addUserPath:v23];
      }
    }
  }
  if ([(RAPDirectionsRecording *)self waypointsCount])
  {
    [v32 clearWaypoints];
    unint64_t v24 = [(RAPDirectionsRecording *)self waypointsCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (iuint64_t i = 0; ii != v25; ++ii)
      {
        uint64_t v27 = [(RAPDirectionsRecording *)self waypointsAtIndex:ii];
        [v32 addWaypoints:v27];
      }
    }
  }
  if ([(RAPDirectionsRecording *)self routesCount])
  {
    [v32 clearRoutes];
    unint64_t v28 = [(RAPDirectionsRecording *)self routesCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (juint64_t j = 0; jj != v29; ++jj)
      {
        unint64_t v31 = [(RAPDirectionsRecording *)self routeAtIndex:jj];
        [v32 addRoute:v31];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  unsigned int v6 = self->_directionsRequests;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v76 objects:v85 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v77 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v76 + 1) + 8 * i) copyWithZone:a3];
        [v5 addDirectionsRequests:v11];
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v76 objects:v85 count:16];
    }
    while (v8);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  int v12 = self->_directionsResponses;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v72 objects:v84 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v73;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v73 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v72 + 1) + 8 * (void)j) copyWithZone:a3];
        [v5 addDirectionsResponses:v17];
      }
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v72 objects:v84 count:16];
    }
    while (v14);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 30) = self->_selectedDirectionsResponseIndex;
    v5[160] |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 31) = self->_selectedSuggestedRouteIndexInDirectionsResponse;
    v5[160] |= 8u;
  }
  id v19 = [(NSData *)self->_overviewScreenshotImageData copyWithZone:a3];
  unint64_t v20 = (void *)*((void *)v5 + 13);
  *((void *)v5 + 13) = v19;

  id v21 = [(NSData *)self->_directionsResponseID copyWithZone:a3];
  unint64_t v22 = (void *)*((void *)v5 + 9);
  *((void *)v5 + 9) = v21;

  id v23 = [(RAPUserSearchInput *)self->_startWaypoint copyWithZone:a3];
  unint64_t v24 = (void *)*((void *)v5 + 16);
  *((void *)v5 + 16) = v23;

  id v25 = [(RAPUserSearchInput *)self->_endWaypoint copyWithZone:a3];
  v26 = (void *)*((void *)v5 + 11);
  *((void *)v5 + 11) = v25;

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v27 = self->_auxiliaryControls;
  id v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v68 objects:v83 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v69;
    do
    {
      for (uint64_t k = 0; k != v29; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v69 != v30) {
          objc_enumerationMutation(v27);
        }
        id v32 = [*(id *)(*((void *)&v68 + 1) + 8 * (void)k) copyWithZone:a3];
        [v5 addAuxiliaryControls:v32];
      }
      id v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v68 objects:v83 count:16];
    }
    while (v29);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v5 + 6) = self->_originatingAuxiliaryControlIndex;
    v5[160] |= 2u;
  }
  id v33 = [(GEORPCorrectedSearch *)self->_startWaypointCorrectedSearchTemplate copyWithZone:a3];
  int v34 = (void *)*((void *)v5 + 17);
  *((void *)v5 + 17) = v33;

  id v35 = [(GEORPCorrectedSearch *)self->_endWaypointCorrectedSearchTemplate copyWithZone:a3];
  unsigned int v36 = (void *)*((void *)v5 + 12);
  *((void *)v5 + 12) = v35;

  PBRepeatedUInt32Copy();
  if (*(unsigned char *)&self->_has)
  {
    *(RAPNavSessionID *)(v5 + 8) = self->_navigationSessionID;
    v5[160] |= 1u;
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v37 = self->_userPaths;
  id v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v64 objects:v82 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v65;
    do
    {
      for (uint64_t m = 0; m != v39; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v65 != v40) {
          objc_enumerationMutation(v37);
        }
        id v42 = [*(id *)(*((void *)&v64 + 1) + 8 * (void)m) copyWithZone:a3];
        [v5 addUserPath:v42];
      }
      id v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v64 objects:v82 count:16];
    }
    while (v39);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v43 = self->_waypoints;
  id v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v60 objects:v81 count:16];
  if (v44)
  {
    id v45 = v44;
    uint64_t v46 = *(void *)v61;
    do
    {
      for (uint64_t n = 0; n != v45; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v61 != v46) {
          objc_enumerationMutation(v43);
        }
        id v48 = [*(id *)(*((void *)&v60 + 1) + 8 * (void)n) copyWithZone:a3];
        [v5 addWaypoints:v48];
      }
      id v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v60 objects:v81 count:16];
    }
    while (v45);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v49 = self->_routes;
  id v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v56 objects:v80 count:16];
  if (v50)
  {
    id v51 = v50;
    uint64_t v52 = *(void *)v57;
    do
    {
      for (iuint64_t i = 0; ii != v51; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v57 != v52) {
          objc_enumerationMutation(v49);
        }
        id v54 = [*(id *)(*((void *)&v56 + 1) + 8 * (void)ii) copyWithZone:a3 v56];
        [v5 addRoute:v54];
      }
      id v51 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v56 objects:v80 count:16];
    }
    while (v51);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_51;
  }
  directionsRequests = self->_directionsRequests;
  if ((unint64_t)directionsRequests | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](directionsRequests, "isEqual:")) {
      goto LABEL_51;
    }
  }
  directionsResponses = self->_directionsResponses;
  if ((unint64_t)directionsResponses | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](directionsResponses, "isEqual:")) {
      goto LABEL_51;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 160) & 4) == 0 || self->_selectedDirectionsResponseIndex != *((_DWORD *)v4 + 30)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 4) != 0)
  {
LABEL_51:
    unsigned __int8 v18 = 0;
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 160) & 8) == 0
      || self->_selectedSuggestedRouteIndexInDirectionsResponse != *((_DWORD *)v4 + 31))
    {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 8) != 0)
  {
    goto LABEL_51;
  }
  overviewScreenshotImageData = self->_overviewScreenshotImageData;
  if ((unint64_t)overviewScreenshotImageData | *((void *)v4 + 13)
    && !-[NSData isEqual:](overviewScreenshotImageData, "isEqual:"))
  {
    goto LABEL_51;
  }
  directionsResponseID = self->_directionsResponseID;
  if ((unint64_t)directionsResponseID | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](directionsResponseID, "isEqual:")) {
      goto LABEL_51;
    }
  }
  startWaypoint = self->_startWaypoint;
  if ((unint64_t)startWaypoint | *((void *)v4 + 16))
  {
    if (!-[RAPUserSearchInput isEqual:](startWaypoint, "isEqual:")) {
      goto LABEL_51;
    }
  }
  endWaypoint = self->_endWaypoint;
  if ((unint64_t)endWaypoint | *((void *)v4 + 11))
  {
    if (!-[RAPUserSearchInput isEqual:](endWaypoint, "isEqual:")) {
      goto LABEL_51;
    }
  }
  auxiliaryControls = self->_auxiliaryControls;
  if ((unint64_t)auxiliaryControls | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](auxiliaryControls, "isEqual:")) {
      goto LABEL_51;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 160) & 2) == 0 || self->_originatingAuxiliaryControlIndex != *((void *)v4 + 6)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 2) != 0)
  {
    goto LABEL_51;
  }
  startWaypointCorrectedSearchTemplate = self->_startWaypointCorrectedSearchTemplate;
  if ((unint64_t)startWaypointCorrectedSearchTemplate | *((void *)v4 + 17)
    && !-[GEORPCorrectedSearch isEqual:](startWaypointCorrectedSearchTemplate, "isEqual:"))
  {
    goto LABEL_51;
  }
  endWaypointCorrectedSearchTemplate = self->_endWaypointCorrectedSearchTemplate;
  if ((unint64_t)endWaypointCorrectedSearchTemplate | *((void *)v4 + 12))
  {
    if (!-[GEORPCorrectedSearch isEqual:](endWaypointCorrectedSearchTemplate, "isEqual:")) {
      goto LABEL_51;
    }
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_51;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 160) & 1) == 0) {
      goto LABEL_51;
    }
    if (self->_navigationSessionID._high != *((void *)v4 + 1)
      || self->_navigationSessionID._low != *((void *)v4 + 2))
    {
      goto LABEL_51;
    }
  }
  else if (*((unsigned char *)v4 + 160))
  {
    goto LABEL_51;
  }
  userPaths = self->_userPaths;
  if ((unint64_t)userPaths | *((void *)v4 + 18)
    && !-[NSMutableArray isEqual:](userPaths, "isEqual:"))
  {
    goto LABEL_51;
  }
  waypoints = self->_waypoints;
  if ((unint64_t)waypoints | *((void *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](waypoints, "isEqual:")) {
      goto LABEL_51;
    }
  }
  routes = self->_routes;
  if ((unint64_t)routes | *((void *)v4 + 14)) {
    unsigned __int8 v18 = -[NSMutableArray isEqual:](routes, "isEqual:");
  }
  else {
    unsigned __int8 v18 = 1;
  }
LABEL_52:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v19 = (unint64_t)[(NSMutableArray *)self->_directionsRequests hash];
  unint64_t v18 = (unint64_t)[(NSMutableArray *)self->_directionsResponses hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v17 = 2654435761 * self->_selectedDirectionsResponseIndex;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v16 = 2654435761 * self->_selectedSuggestedRouteIndexInDirectionsResponse;
      goto LABEL_6;
    }
  }
  uint64_t v16 = 0;
LABEL_6:
  unint64_t v15 = (unint64_t)[(NSData *)self->_overviewScreenshotImageData hash];
  unint64_t v3 = (unint64_t)[(NSData *)self->_directionsResponseID hash];
  unint64_t v4 = [(RAPUserSearchInput *)self->_startWaypoint hash];
  unint64_t v5 = [(RAPUserSearchInput *)self->_endWaypoint hash];
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_auxiliaryControls hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v7 = 2654435761u * self->_originatingAuxiliaryControlIndex;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v8 = (unint64_t)[(GEORPCorrectedSearch *)self->_startWaypointCorrectedSearchTemplate hash];
  unint64_t v9 = (unint64_t)[(GEORPCorrectedSearch *)self->_endWaypointCorrectedSearchTemplate hash];
  uint64_t v10 = PBRepeatedUInt32Hash();
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = PBHashBytes();
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v10 ^ v11 ^ (unint64_t)[(NSMutableArray *)self->_userPaths hash];
  unint64_t v13 = v12 ^ (unint64_t)[(NSMutableArray *)self->_waypoints hash];
  return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v13 ^ (unint64_t)[(NSMutableArray *)self->_routes hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (char *)a3;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v5 = *((id *)v4 + 8);
  id v6 = [v5 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v68 != v8) {
          objc_enumerationMutation(v5);
        }
        [(RAPDirectionsRecording *)self addDirectionsRequests:*(void *)(*((void *)&v67 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v7);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v10 = *((id *)v4 + 10);
  id v11 = [v10 countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v64 != v13) {
          objc_enumerationMutation(v10);
        }
        [(RAPDirectionsRecording *)self addDirectionsResponses:*(void *)(*((void *)&v63 + 1) + 8 * (void)j)];
      }
      id v12 = [v10 countByEnumeratingWithState:&v63 objects:v75 count:16];
    }
    while (v12);
  }

  char v15 = v4[160];
  if ((v15 & 4) != 0)
  {
    self->_selectedDirectionsResponseIndex = *((_DWORD *)v4 + 30);
    *(unsigned char *)&self->_has |= 4u;
    char v15 = v4[160];
  }
  if ((v15 & 8) != 0)
  {
    self->_selectedSuggestedRouteIndexInDirectionsResponse = *((_DWORD *)v4 + 31);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 13)) {
    -[RAPDirectionsRecording setOverviewScreenshotImageData:](self, "setOverviewScreenshotImageData:");
  }
  if (*((void *)v4 + 9)) {
    -[RAPDirectionsRecording setDirectionsResponseID:](self, "setDirectionsResponseID:");
  }
  startWaypoint = self->_startWaypoint;
  uint64_t v17 = *((void *)v4 + 16);
  if (startWaypoint)
  {
    if (v17) {
      -[RAPUserSearchInput mergeFrom:](startWaypoint, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[RAPDirectionsRecording setStartWaypoint:](self, "setStartWaypoint:");
  }
  endWaypoint = self->_endWaypoint;
  uint64_t v19 = *((void *)v4 + 11);
  if (endWaypoint)
  {
    if (v19) {
      -[RAPUserSearchInput mergeFrom:](endWaypoint, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[RAPDirectionsRecording setEndWaypoint:](self, "setEndWaypoint:");
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v20 = *((id *)v4 + 7);
  id v21 = [v20 countByEnumeratingWithState:&v59 objects:v74 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v60;
    do
    {
      for (uint64_t k = 0; k != v22; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v60 != v23) {
          objc_enumerationMutation(v20);
        }
        [(RAPDirectionsRecording *)self addAuxiliaryControls:*(void *)(*((void *)&v59 + 1) + 8 * (void)k)];
      }
      id v22 = [v20 countByEnumeratingWithState:&v59 objects:v74 count:16];
    }
    while (v22);
  }

  if ((v4[160] & 2) != 0)
  {
    self->_originatingAuxiliaryControlIndex = *((void *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  startWaypointCorrectedSearchTemplate = self->_startWaypointCorrectedSearchTemplate;
  uint64_t v26 = *((void *)v4 + 17);
  if (startWaypointCorrectedSearchTemplate)
  {
    if (v26) {
      -[GEORPCorrectedSearch mergeFrom:](startWaypointCorrectedSearchTemplate, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[RAPDirectionsRecording setStartWaypointCorrectedSearchTemplate:](self, "setStartWaypointCorrectedSearchTemplate:");
  }
  endWaypointCorrectedSearchTemplate = self->_endWaypointCorrectedSearchTemplate;
  uint64_t v28 = *((void *)v4 + 12);
  if (endWaypointCorrectedSearchTemplate)
  {
    if (v28) {
      -[GEORPCorrectedSearch mergeFrom:](endWaypointCorrectedSearchTemplate, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[RAPDirectionsRecording setEndWaypointCorrectedSearchTemplate:](self, "setEndWaypointCorrectedSearchTemplate:");
  }
  id v29 = (char *)[v4 clusteredRouteRideSelectionsCount];
  if (v29)
  {
    uint64_t v30 = v29;
    for (uint64_t m = 0; m != v30; ++m)
      -[RAPDirectionsRecording addClusteredRouteRideSelections:](self, "addClusteredRouteRideSelections:", [v4 clusteredRouteRideSelectionsAtIndex:m]);
  }
  if (v4[160])
  {
    self->_navigationSessionID = *(RAPNavSessionID *)(v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v32 = *((id *)v4 + 18);
  id v33 = [v32 countByEnumeratingWithState:&v55 objects:v73 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v56;
    do
    {
      for (uint64_t n = 0; n != v34; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v56 != v35) {
          objc_enumerationMutation(v32);
        }
        [(RAPDirectionsRecording *)self addUserPath:*(void *)(*((void *)&v55 + 1) + 8 * (void)n)];
      }
      id v34 = [v32 countByEnumeratingWithState:&v55 objects:v73 count:16];
    }
    while (v34);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v37 = *((id *)v4 + 19);
  id v38 = [v37 countByEnumeratingWithState:&v51 objects:v72 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v52;
    do
    {
      for (iuint64_t i = 0; ii != v39; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v52 != v40) {
          objc_enumerationMutation(v37);
        }
        [(RAPDirectionsRecording *)self addWaypoints:*(void *)(*((void *)&v51 + 1) + 8 * (void)ii)];
      }
      id v39 = [v37 countByEnumeratingWithState:&v51 objects:v72 count:16];
    }
    while (v39);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v42 = *((id *)v4 + 14);
  id v43 = [v42 countByEnumeratingWithState:&v47 objects:v71 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v48;
    do
    {
      for (juint64_t j = 0; jj != v44; juint64_t j = (char *)jj + 1)
      {
        if (*(void *)v48 != v45) {
          objc_enumerationMutation(v42);
        }
        -[RAPDirectionsRecording addRoute:](self, "addRoute:", *(void *)(*((void *)&v47 + 1) + 8 * (void)jj), (void)v47);
      }
      id v44 = [v42 countByEnumeratingWithState:&v47 objects:v71 count:16];
    }
    while (v44);
  }
}

- (NSMutableArray)directionsRequests
{
  return self->_directionsRequests;
}

- (void)setDirectionsRequests:(id)a3
{
}

- (NSMutableArray)directionsResponses
{
  return self->_directionsResponses;
}

- (void)setDirectionsResponses:(id)a3
{
}

- (unsigned)selectedDirectionsResponseIndex
{
  return self->_selectedDirectionsResponseIndex;
}

- (unsigned)selectedSuggestedRouteIndexInDirectionsResponse
{
  return self->_selectedSuggestedRouteIndexInDirectionsResponse;
}

- (NSData)overviewScreenshotImageData
{
  return self->_overviewScreenshotImageData;
}

- (void)setOverviewScreenshotImageData:(id)a3
{
}

- (NSData)directionsResponseID
{
  return self->_directionsResponseID;
}

- (void)setDirectionsResponseID:(id)a3
{
}

- (RAPUserSearchInput)startWaypoint
{
  return self->_startWaypoint;
}

- (void)setStartWaypoint:(id)a3
{
}

- (RAPUserSearchInput)endWaypoint
{
  return self->_endWaypoint;
}

- (void)setEndWaypoint:(id)a3
{
}

- (NSArray)auxiliaryControls
{
  return &self->_auxiliaryControls->super;
}

- (void)setAuxiliaryControls:(id)a3
{
}

- (unint64_t)originatingAuxiliaryControlIndex
{
  return self->_originatingAuxiliaryControlIndex;
}

- (GEORPCorrectedSearch)startWaypointCorrectedSearchTemplate
{
  return self->_startWaypointCorrectedSearchTemplate;
}

- (void)setStartWaypointCorrectedSearchTemplate:(id)a3
{
}

- (GEORPCorrectedSearch)endWaypointCorrectedSearchTemplate
{
  return self->_endWaypointCorrectedSearchTemplate;
}

- (void)setEndWaypointCorrectedSearchTemplate:(id)a3
{
}

- (RAPNavSessionID)navigationSessionID
{
  p_navigationSessionID = &self->_navigationSessionID;
  unint64_t high = self->_navigationSessionID._high;
  unint64_t low = p_navigationSessionID->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (NSMutableArray)userPaths
{
  return self->_userPaths;
}

- (void)setUserPaths:(id)a3
{
}

- (NSMutableArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
}

- (NSMutableArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_userPaths, 0);
  objc_storeStrong((id *)&self->_startWaypointCorrectedSearchTemplate, 0);
  objc_storeStrong((id *)&self->_startWaypoint, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_overviewScreenshotImageData, 0);
  objc_storeStrong((id *)&self->_endWaypointCorrectedSearchTemplate, 0);
  objc_storeStrong((id *)&self->_endWaypoint, 0);
  objc_storeStrong((id *)&self->_directionsResponses, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
  objc_storeStrong((id *)&self->_directionsRequests, 0);

  objc_storeStrong((id *)&self->_auxiliaryControls, 0);
}

@end