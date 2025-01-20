@interface VKRouteInfo
- (BOOL)_isHikingRoute;
- (BOOL)_isReRoute;
- (BOOL)hasFocus;
- (BOOL)hasRouteEta;
- (BOOL)hasRouteLegEtas;
- (GEOComposedRoute)route;
- (NSArray)anchorpoints;
- (NSArray)debugAnnotations;
- (NSArray)exitSignAnnotations;
- (NSArray)routeLegEtaAnnotations;
- (NSArray)routeNameAnnotations;
- (NSArray)trafficAnnotations;
- (NSArray)travelDirectionAnnotations;
- (NSArray)waypoints;
- (VKRouteEtaDescription)etaDescription;
- (VKRouteInfo)initWithAnchorPoint:(id)a3;
- (VKRouteInfo)initWithComposedRoute:(id)a3 etaDescription:(id)a4;
- (VKRouteInfo)initWithComposedRoute:(id)a3 etaText:(id)a4;
- (id)waypointForWaypoint:(id)a3;
- (id)waypointInfoForWaypoint:(id)a3;
- (void)_assignIndexPositions;
- (void)_decodeVisualInfos:(id)a3 withRouteEtaType:(int64_t)a4 into:(id)a5 needsDescription:(BOOL)a6;
- (void)_processAnchorpoints:(id)a3;
- (void)_processWaypoints:(id)a3;
- (void)setDebugAnnotations:(id)a3;
- (void)setEtaDescription:(id)a3;
- (void)setHasFocus:(BOOL)a3;
- (void)setRouteLegEtaAnnotations:(id)a3;
- (void)setRouteNameAnnotations:(id)a3;
- (void)setTravelDirectionAnnotations:(id)a3;
- (void)visitAnnotations:(id)a3;
@end

@implementation VKRouteInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorpoints, 0);
  objc_storeStrong((id *)&self->_routeEtaAnnotation, 0);
  objc_storeStrong((id *)&self->_debugAnnotations, 0);
  objc_storeStrong((id *)&self->_travelDirectionAnnotations, 0);
  objc_storeStrong((id *)&self->_routeNameAnnotations, 0);
  objc_storeStrong((id *)&self->_routeLegEtaAnnotations, 0);
  objc_storeStrong((id *)&self->_exitSignAnnotations, 0);
  objc_storeStrong((id *)&self->_trafficAnnotations, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_etaDescription, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

- (void)setDebugAnnotations:(id)a3
{
}

- (NSArray)debugAnnotations
{
  return self->_debugAnnotations;
}

- (void)setRouteNameAnnotations:(id)a3
{
}

- (NSArray)routeNameAnnotations
{
  return self->_routeNameAnnotations;
}

- (void)setTravelDirectionAnnotations:(id)a3
{
}

- (NSArray)travelDirectionAnnotations
{
  return self->_travelDirectionAnnotations;
}

- (void)setRouteLegEtaAnnotations:(id)a3
{
}

- (NSArray)routeLegEtaAnnotations
{
  return self->_routeLegEtaAnnotations;
}

- (NSArray)exitSignAnnotations
{
  return self->_exitSignAnnotations;
}

- (NSArray)trafficAnnotations
{
  return self->_trafficAnnotations;
}

- (NSArray)anchorpoints
{
  return self->_anchorpoints;
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setHasFocus:(BOOL)a3
{
  self->_hasFocus = a3;
}

- (BOOL)hasFocus
{
  return self->_hasFocus;
}

- (VKRouteEtaDescription)etaDescription
{
  return self->_etaDescription;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)_assignIndexPositions
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v6 addObjectsFromArray:self->_waypoints];
  [v6 addObjectsFromArray:self->_anchorpoints];
  [v6 sortUsingComparator:&__block_literal_global_20202];
  v3 = v6;
  for (unint64_t i = 0; i < [v3 count]; ++i)
  {
    v5 = [v6 objectAtIndexedSubscript:i];
    [v5 setWaypointIndex:i];

    v3 = v6;
  }
}

uint64_t __36__VKRouteInfo__assignIndexPositions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 polylineCoordinate];
  uint64_t v6 = [v4 polylineCoordinate];
  if (v5 < v6 || v5 == v6 && *((float *)&v5 + 1) < *((float *)&v6 + 1)) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)_processAnchorpoints:(id)a3
{
  id v22 = a3;
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v5 = [(GEOComposedRoute *)self->_route anchorPoints];
    unint64_t v6 = [v5 count];

    if (i >= v6) {
      break;
    }
    uint64_t v7 = [(GEOComposedRoute *)self->_route anchorPoints];
    v8 = [v7 objectAtIndexedSubscript:i];

    if (v8 && [v8 anchorPointType] != 1 && objc_msgSend(v8, "anchorPointType") != 2)
    {
      -[GEOComposedRoute pointWithAltitudeCorrectionAtRouteCoordinate:](self->_route, "pointWithAltitudeCorrectionAtRouteCoordinate:", [v8 routeCoordinate]);
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      if (([v8 routeCoordinate] & 0xFFFFFFFELL) != 0)
      {
        -[GEOComposedRoute pointWithAltitudeCorrectionAtRouteCoordinate:](self->_route, "pointWithAltitudeCorrectionAtRouteCoordinate:", [v8 routeCoordinate] - 1);
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
      }
      else
      {
        double v20 = 1.79769313e308;
        double v16 = -180.0;
        double v18 = -180.0;
      }
      id v21 = +[VKRouteWaypointInfo newRouteWaypointForAnchorpoint:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:](VKRouteWaypointInfo, "newRouteWaypointForAnchorpoint:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:", v8, 0, [v8 routeCoordinate], v10, v12, v14, v16, v18, v20);
      [v22 addObject:v21];
    }
  }
}

- (void)_processWaypoints:(id)a3
{
  id v47 = a3;
  id v4 = [(GEOComposedRoute *)self->_route legs];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = [(GEOComposedRoute *)self->_route legs];
    uint64_t v7 = [v6 objectAtIndexedSubscript:0];

    v8 = [v7 origin];
    double v9 = v8;
    if (v8
      && (![v8 isCurrentLocation]
       || [(VKRouteInfo *)self _isHikingRoute] && ![(VKRouteInfo *)self _isReRoute]))
    {
      -[GEOComposedRoute pointWithAltitudeCorrectionAtRouteCoordinate:](self->_route, "pointWithAltitudeCorrectionAtRouteCoordinate:", [v7 startRouteCoordinate]);
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      if ((unint64_t)[v7 pointCount] < 2)
      {
        double v21 = 1.79769313e308;
        double v17 = -180.0;
        double v19 = -180.0;
      }
      else
      {
        -[GEOComposedRoute pointWithAltitudeCorrectionAtRouteCoordinate:](self->_route, "pointWithAltitudeCorrectionAtRouteCoordinate:", [v7 startPointIndex] + 1);
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
      }
      id v22 = [(GEOComposedRoute *)self->_route waypointDisplayInfoForWaypoint:v9];
      id v23 = +[VKRouteWaypointInfo newRouteWaypointForWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:](VKRouteWaypointInfo, "newRouteWaypointForWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:", v9, v22, 0, [v7 startRouteCoordinate], v11, v13, v15, v17, v19, v21);
      [v23 setIsAtStart:1];
      [v47 addObject:v23];
    }
  }
  for (unint64_t i = 0; ; ++i)
  {
    v25 = [(GEOComposedRoute *)self->_route legs];
    unint64_t v26 = [v25 count];

    if (i >= v26) {
      break;
    }
    v27 = [(GEOComposedRoute *)self->_route legs];
    v28 = [v27 objectAtIndexedSubscript:i];

    v29 = [v28 destination];
    v30 = v29;
    if (v29
      && (![v29 isCurrentLocation] || -[VKRouteInfo _isHikingRoute](self, "_isHikingRoute")))
    {
      -[GEOComposedRoute pointWithAltitudeCorrectionAtRouteCoordinate:](self->_route, "pointWithAltitudeCorrectionAtRouteCoordinate:", [v28 endRouteCoordinate]);
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      if ((unint64_t)[v28 pointCount] < 2)
      {
        double v40 = -180.0;
        double v42 = 1.79769313e308;
        double v38 = -180.0;
      }
      else
      {
        -[GEOComposedRoute pointWithAltitudeCorrectionAtRouteCoordinate:](self->_route, "pointWithAltitudeCorrectionAtRouteCoordinate:", [v28 endPointIndex] - 1);
        double v38 = v37;
        double v40 = v39;
        double v42 = v41;
      }
      v43 = [(GEOComposedRoute *)self->_route waypointDisplayInfoForWaypoint:v30];
      id v44 = +[VKRouteWaypointInfo newRouteWaypointForWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:](VKRouteWaypointInfo, "newRouteWaypointForWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:", v30, v43, i, [v28 endRouteCoordinate], v32, v34, v36, v38, v40, v42);
      v45 = [(GEOComposedRoute *)self->_route legs];
      uint64_t v46 = [v45 count] - 1;

      if (i == v46) {
        [v44 setIsAtEnd:1];
      }
      [v47 addObject:v44];
    }
  }
}

- (id)waypointInfoForWaypoint:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = self->_waypoints;
    id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          double v10 = objc_msgSend(v9, "waypoint", (void)v13);
          char v11 = [v10 isEqual:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)waypointForWaypoint:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v5 = self->_waypoints;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v10 = [v9 waypoint];
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          uint64_t v18 = [v9 waypoint];
LABEL_20:
          double v12 = (void *)v18;
          goto LABEL_21;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = self->_anchorpoints;
  double v12 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v5);
        }
        long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
        long long v16 = objc_msgSend(v15, "waypoint", (void)v20);
        int v17 = [v16 isEqual:v4];

        if (v17)
        {
          uint64_t v18 = [v15 waypoint];
          goto LABEL_20;
        }
      }
      double v12 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  return v12;
}

- (void)visitAnnotations:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__VKRouteInfo_visitAnnotations___block_invoke;
  v7[3] = &unk_1E5A92718;
  uint64_t v5 = (void (**)(void))v4;
  id v8 = v5;
  uint64_t v6 = (void *)MEMORY[0x1A6239EB0](v7);
  if (self->_routeEtaAnnotation) {
    v5[2](v5);
  }
  [(NSArray *)self->_debugAnnotations enumerateObjectsUsingBlock:v6];
  [(NSArray *)self->_routeLegEtaAnnotations enumerateObjectsUsingBlock:v6];
  [(NSArray *)self->_trafficAnnotations enumerateObjectsUsingBlock:v6];
  [(NSArray *)self->_exitSignAnnotations enumerateObjectsUsingBlock:v6];
  [(NSArray *)self->_routeNameAnnotations enumerateObjectsUsingBlock:v6];
}

uint64_t __32__VKRouteInfo_visitAnnotations___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasRouteLegEtas
{
  routeLegEtaAnnotations = self->_routeLegEtaAnnotations;
  if (routeLegEtaAnnotations) {
    LOBYTE(routeLegEtaAnnotations) = [(NSArray *)routeLegEtaAnnotations count] != 0;
  }
  return (char)routeLegEtaAnnotations;
}

- (BOOL)hasRouteEta
{
  etaDescription = self->_etaDescription;
  if (!etaDescription) {
    return 0;
  }
  id v4 = [(VKRouteEtaDescription *)etaDescription etaText];
  if (v4)
  {
    uint64_t v5 = [(VKRouteEtaDescription *)self->_etaDescription etaText];
    BOOL v6 = [v5 length] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setEtaDescription:(id)a3
{
  uint64_t v5 = (VKRouteEtaDescription *)a3;
  if (self->_etaDescription != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_etaDescription, a3);
    if (self->_etaDescription && self->_route)
    {
      BOOL v6 = [[VKRouteRangeAnnotationInfo alloc] initWithEtaDescription:self->_etaDescription start:0 end:[(GEOComposedRoute *)self->_route endRouteCoordinate]];
      routeEtaAnnotation = self->_routeEtaAnnotation;
      self->_routeEtaAnnotation = v6;
    }
    else
    {
      routeEtaAnnotation = self->_routeEtaAnnotation;
      self->_routeEtaAnnotation = 0;
    }

    uint64_t v5 = v8;
  }
}

- (VKRouteInfo)initWithAnchorPoint:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VKRouteInfo;
  uint64_t v5 = [(VKRouteInfo *)&v14 init];
  if (v5)
  {
    BOOL v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v4 locationCoordinate];
    id v10 = +[VKRouteWaypointInfo newRouteWaypointForAnchorpoint:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:](VKRouteWaypointInfo, "newRouteWaypointForAnchorpoint:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:", v4, 0, [v4 routeCoordinate], v7, v8, v9, -180.0, -180.0, 1.79769313e308);
    [v10 setIsAtStart:1];
    [(NSArray *)v6 addObject:v10];
    waypoints = v5->_waypoints;
    v5->_waypoints = v6;

    double v12 = v5;
  }

  return v5;
}

- (VKRouteInfo)initWithComposedRoute:(id)a3 etaDescription:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v33 = a4;
  v39.receiver = self;
  v39.super_class = (Class)VKRouteInfo;
  double v7 = [(VKRouteInfo *)&v39 init];
  double v8 = v7;
  if (v7)
  {
    [(VKRouteInfo *)v7 setEtaDescription:v33];
    objc_storeStrong((id *)&v8->_route, a3);
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(VKRouteInfo *)v8 _processWaypoints:v9];
    id obj = v9;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(VKRouteInfo *)v8 _processAnchorpoints:v10];
    id v32 = v10;
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v13 = [v34 visualInfos];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v13);
          }
          int v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v17, "type", obj, v32);
          double v19 = v11;
          if (v18 != 131073)
          {
            uint64_t v20 = [v17 type];
            double v19 = v12;
            if (v20 != 191) {
              continue;
            }
          }
          [v19 addObject:v17];
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v14);
    }

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(VKRouteInfo *)v8 _decodeVisualInfos:v11 withRouteEtaType:1 into:v21 needsDescription:1];
    objc_storeStrong((id *)&v8->_exitSignAnnotations, v21);
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(VKRouteInfo *)v8 _decodeVisualInfos:v12 withRouteEtaType:5 into:v22 needsDescription:0];
    objc_storeStrong((id *)&v8->_travelDirectionAnnotations, v22);
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = [v34 mutableData];
    if (v24)
    {
      long long v25 = [v34 mutableData];
      long long v26 = [v25 trafficDelayInfos];
    }
    else
    {
      long long v26 = 0;
    }

    [(VKRouteInfo *)v8 _decodeVisualInfos:v26 withRouteEtaType:2 into:v23 needsDescription:1];
    objc_storeStrong((id *)&v8->_trafficAnnotations, v23);
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v28 = [v34 visualInfosForRouteNameLabels];
    [(VKRouteInfo *)v8 _decodeVisualInfos:v28 withRouteEtaType:4 into:v27 needsDescription:1];
    objc_storeStrong((id *)&v8->_routeNameAnnotations, v27);
    objc_storeStrong((id *)&v8->_waypoints, obj);
    objc_storeStrong((id *)&v8->_anchorpoints, v32);
    [(VKRouteInfo *)v8 _assignIndexPositions];
    v29 = v8;
  }
  return v8;
}

- (VKRouteInfo)initWithComposedRoute:(id)a3 etaText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    double v8 = [[VKRouteEtaDescription alloc] initWithEtaText:v7];
  }
  else {
    double v8 = 0;
  }
  id v9 = [(VKRouteInfo *)self initWithComposedRoute:v6 etaDescription:v8];

  return v9;
}

- (BOOL)_isReRoute
{
  v2 = [(GEOComposedRoute *)self->_route anchorPoints];
  v3 = [v2 firstObject];
  uint64_t v4 = [v3 routeCoordinate];
  BOOL v6 = vabds_f32(*((float *)&v4 + 1), *(float *)(MEMORY[0x1E4F641A8] + 4)) >= 0.00000011921
    || *MEMORY[0x1E4F641A8] != v4;

  return v6;
}

- (BOOL)_isHikingRoute
{
  return [(GEOComposedRoute *)self->_route source] == 2
      || [(GEOComposedRoute *)self->_route source] == 3;
}

- (void)_decodeVisualInfos:(id)a3 withRouteEtaType:(int64_t)a4 into:(id)a5 needsDescription:(BOOL)a6
{
  BOOL v7 = a6;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v59 = a5;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v77 objects:v82 count:16];
  if (v11)
  {
    uint64_t v60 = *(void *)v78;
    BOOL v57 = v7;
    int64_t v56 = a4;
    do
    {
      uint64_t v65 = 0;
      do
      {
        if (*(void *)v78 != v60) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v77 + 1) + 8 * v65);
        v67 = [MEMORY[0x1E4F28E78] string];
        uint64_t v13 = [v12 title];
        uint64_t v14 = [v13 basicString];
        v68 = v12;
        LOBYTE(v12) = v14 == 0;

        if ((v12 & 1) == 0)
        {
          uint64_t v15 = [v68 title];
          long long v16 = [v15 basicString];
          [v67 appendString:v16];
        }
        int v17 = [v68 detail];
        v66 = [v17 stringWithDefaultValues];

        if (v66) {
          [v67 appendFormat:@"\n%@", v66];
        }
        if (v7 && ![v67 length]) {
          goto LABEL_71;
        }
        uint64_t v18 = [VKRouteEtaDescription alloc];
        double v19 = [v68 icon];
        if (v19)
        {
          v62 = [v68 icon];
          v61 = [v62 iconDataSource];
          BOOL v6 = [v61 styleAttributes];
          uint64_t v20 = v6;
        }
        else
        {
          uint64_t v20 = 0;
        }
        v64 = [(VKRouteEtaDescription *)v18 initWithEtaText:v67 etaAdvisoryStyleAttributes:v20 routeEtaType:a4];
        if (v19)
        {
        }
        if (a4 == 5 || a4 == 2)
        {
          v63 = [v68 styleAttributes];
          BOOL v21 = v63 != 0;
          if (a4 == 5) {
            goto LABEL_23;
          }
        }
        else
        {
          BOOL v21 = 0;
        }
        if (a4 == 2) {
LABEL_23:
        }

        if (v21)
        {
          id v22 = [v68 styleAttributes];
          unsigned __int8 v23 = [v22 attributesCount];

          {
            operator new();
          }
          uint64_t v24 = v23;
          uint64_t v70 = mdm::Allocator::instance(void)::alloc;
          if (v23)
          {
            long long v25 = (char *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc
                                                                               + 16))(mdm::Allocator::instance(void)::alloc, 8 * v23, 4);
            v72 = &v25[8 * v24];
          }
          else
          {
            v72 = 0;
            long long v25 = 0;
          }
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v26 = [v68 styleAttributes];
          id v69 = [v26 attributes];

          uint64_t v27 = [v69 countByEnumeratingWithState:&v73 objects:v81 count:16];
          if (v27)
          {
            uint64_t v71 = *(void *)v74;
            v28 = v25;
            while (1)
            {
              for (uint64_t i = 0; i != v27; ++i)
              {
                if (*(void *)v74 != v71) {
                  objc_enumerationMutation(v69);
                }
                uint64_t v30 = v6;
                uint64_t v31 = v11;
                id v32 = *(void **)(*((void *)&v73 + 1) + 8 * i);
                unsigned int v33 = [v32 key];
                uint64_t v34 = [v32 value];
                uint64_t v35 = v34;
                if (v25 < v72)
                {
                  if (v25) {
                    *(void *)long long v25 = v33 | (unint64_t)(v34 << 32);
                  }
                  v25 += 8;
                  uint64_t v11 = v31;
                  BOOL v6 = v30;
                  continue;
                }
                uint64_t v36 = (v25 - v28) >> 3;
                unint64_t v37 = v36 + 1;
                if ((unint64_t)(v36 + 1) >> 61) {
                  abort();
                }
                if ((v72 - v28) >> 2 > v37) {
                  unint64_t v37 = (v72 - v28) >> 2;
                }
                if ((unint64_t)(v72 - v28) >= 0x7FFFFFFFFFFFFFF8) {
                  uint64_t v38 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  uint64_t v38 = v37;
                }
                if (v38)
                {
                  uint64_t v39 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v70 + 16))(v70, 8 * v38, 4);
                  double v40 = (unint64_t *)(v39 + 8 * v36);
                  uint64_t v38 = v39 + 8 * v38;
                  if (v39) {
                    *double v40 = v33 | (unint64_t)(v35 << 32);
                  }
                }
                else
                {
                  double v40 = (unint64_t *)(8 * v36);
                }
                uint64_t v11 = v31;
                if (v25 == v28)
                {
                  v43 = (char *)v40;
                  v28 = v25;
                  BOOL v6 = v30;
                }
                else
                {
                  unint64_t v41 = v25 - v28 - 8;
                  if (v41 >= 0x138)
                  {
                    BOOL v6 = v30;
                    if ((unint64_t *)((char *)v40 - (v41 & 0xFFFFFFFFFFFFFFF8) - 8) > v40 - 1
                      || &v25[-(v41 & 0xFFFFFFFFFFFFFFF8) - 8] > v25 - 8
                      || (unint64_t)(v25 - (char *)v40) < 0x20)
                    {
                      double v42 = v25;
                      v43 = (char *)v40;
                    }
                    else
                    {
                      uint64_t v44 = (v41 >> 3) + 1;
                      double v42 = &v25[-8 * (v44 & 0x3FFFFFFFFFFFFFFCLL)];
                      v45 = v40 - 2;
                      uint64_t v46 = v25 - 16;
                      uint64_t v47 = v44 & 0x3FFFFFFFFFFFFFFCLL;
                      do
                      {
                        long long v48 = *(_OWORD *)v46;
                        *((_OWORD *)v45 - 1) = *((_OWORD *)v46 - 1);
                        *(_OWORD *)v45 = v48;
                        v45 -= 4;
                        v46 -= 32;
                        v47 -= 4;
                      }
                      while (v47);
                      v43 = (char *)&v40[-(v44 & 0x3FFFFFFFFFFFFFFCLL)];
                      if (v44 == (v44 & 0x3FFFFFFFFFFFFFFCLL)) {
                        goto LABEL_62;
                      }
                    }
                  }
                  else
                  {
                    double v42 = v25;
                    v43 = (char *)v40;
                    BOOL v6 = v30;
                  }
                  do
                  {
                    uint64_t v49 = *((void *)v42 - 1);
                    v42 -= 8;
                    *((void *)v43 - 1) = v49;
                    v43 -= 8;
                  }
                  while (v42 != v28);
                }
LABEL_62:
                long long v25 = (char *)(v40 + 1);
                if (v28) {
                  (*(void (**)(uint64_t, char *, int64_t))(*(void *)v70 + 40))(v70, v28, v72 - v28);
                }
                v72 = (char *)v38;
                v28 = v43;
              }
              uint64_t v27 = [v69 countByEnumeratingWithState:&v73 objects:v81 count:16];
              if (!v27) {
                goto LABEL_68;
              }
            }
          }
          v28 = v25;
LABEL_68:

          BOOL v7 = v57;
          a4 = v56;
          v50 = [(VKRouteEtaDescription *)v64 styleAttributes];
          [v50 replaceAttributes:v28 count:(unint64_t)(v25 - v28) >> 3];

          if (v28) {
            (*(void (**)(uint64_t, char *, int64_t))(*(void *)v70 + 40))(v70, v28, v72 - v28);
          }
        }
        v51 = [VKRouteRangeAnnotationInfo alloc];
        uint64_t v52 = [v68 routeCoordinateRange];
        [v68 routeCoordinateRange];
        v54 = [(VKRouteRangeAnnotationInfo *)v51 initWithEtaDescription:v64 start:v52 end:v53];
        [v59 addObject:v54];

LABEL_71:
        ++v65;
      }
      while (v65 != v11);
      uint64_t v55 = [obj countByEnumeratingWithState:&v77 objects:v82 count:16];
      uint64_t v11 = v55;
    }
    while (v55);
  }
}

@end