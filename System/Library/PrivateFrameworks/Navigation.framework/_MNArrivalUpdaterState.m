@interface _MNArrivalUpdaterState
- (BOOL)_checkForApproachingWaypoint;
- (BOOL)_checkForArrival;
- (BOOL)_checkForEndOfDrivingSegment;
- (BOOL)_checkForPreArrival;
- (BOOL)_updateForApproachingWaypoint;
- (BOOL)_updateForArrival;
- (BOOL)_updateForEndOfDrivingSegment;
- (BOOL)_updateForPreArrival;
- (BOOL)_updateForSearchingForParking;
- (GEOComposedRoute)route;
- (GEOComposedRouteLeg)targetLeg;
- (MNArrivalUpdater)arrivalUpdater;
- (MNLocation)location;
- (_MNArrivalUpdaterDetails)details;
- (double)_distanceToEndOfLeg;
- (double)parkingDetectionExcludeRadius;
- (int64_t)state;
- (void)_updateForEVMonitoring;
- (void)forceDepartureWithReason:(unint64_t)a3;
- (void)sendArrivalInfo;
- (void)setArrivalUpdater:(id)a3;
- (void)setDetails:(id)a3;
- (void)updateForEVChargingState:(BOOL)a3;
@end

@implementation _MNArrivalUpdaterState

- (int64_t)state
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Must be implemented by subclasses.", v3, 2u);
  }
  return -1;
}

- (MNLocation)location
{
  v2 = [(_MNArrivalUpdaterState *)self details];
  v3 = [v2 navigationSessionState];
  v4 = [v3 location];

  return (MNLocation *)v4;
}

- (GEOComposedRoute)route
{
  v2 = [(_MNArrivalUpdaterState *)self details];
  v3 = [v2 navigationSessionState];
  v4 = [v3 currentRouteInfo];
  v5 = [v4 route];

  return (GEOComposedRoute *)v5;
}

- (GEOComposedRouteLeg)targetLeg
{
  v2 = [(_MNArrivalUpdaterState *)self details];
  v3 = [v2 navigationSessionState];
  v4 = [v3 targetLeg];

  return (GEOComposedRouteLeg *)v4;
}

- (void)forceDepartureWithReason:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arrivalUpdater);
  v4 = [[_MNArrivalUpdaterState_None alloc] initWithDepartureReason:a3];
  [WeakRetained changeState:v4];
}

- (void)updateForEVChargingState:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
    v3 = objc_alloc_init(_MNArrivalUpdaterState_Arrived);
    [v4 changeState:v3];
  }
}

- (double)parkingDetectionExcludeRadius
{
  return 0.0;
}

- (void)sendArrivalInfo
{
  id v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setArrivalState:", -[_MNArrivalUpdaterState state](self, "state"));
  v3 = [(_MNArrivalUpdaterState *)self targetLeg];
  objc_msgSend(v8, "setLegIndex:", objc_msgSend(v3, "legIndex"));
  id v4 = [v3 destination];
  [v8 setDestination:v4];

  v5 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  v6 = [v5 safeDelegate];
  v7 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
  [v6 arrivalUpdater:v7 didUpdateArrivalInfo:v8];
}

- (BOOL)_updateForArrival
{
  BOOL v3 = [(_MNArrivalUpdaterState *)self _checkForArrival];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_arrivalUpdater);
    v5 = objc_alloc_init(_MNArrivalUpdaterState_Arrived);
    [WeakRetained changeState:v5];
  }
  return v3;
}

- (BOOL)_updateForPreArrival
{
  BOOL v3 = [(_MNArrivalUpdaterState *)self _checkForPreArrival];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_arrivalUpdater);
    v5 = objc_alloc_init(_MNArrivalUpdaterState_PreArrival);
    [WeakRetained changeState:v5];
  }
  return v3;
}

- (BOOL)_updateForApproachingWaypoint
{
  BOOL v3 = [(_MNArrivalUpdaterState *)self _checkForApproachingWaypoint];
  if ([(_MNArrivalUpdaterState *)self state] != 2 && v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_arrivalUpdater);
    v5 = objc_alloc_init(_MNArrivalUpdaterState_ApproachingWaypoint);
    [WeakRetained changeState:v5];
  }
  return v3;
}

- (void)_updateForEVMonitoring
{
  BOOL v3 = [(_MNArrivalUpdaterState *)self details];
  id v4 = [v3 evChargingStateMonitor];

  if (!v4)
  {
    v5 = [(_MNArrivalUpdaterState *)self route];
    int v6 = [v5 isEVRoute];

    if (v6)
    {
      v7 = [(_MNArrivalUpdaterState *)self location];
      uint64_t v8 = [v7 state];

      if (v8 == 1)
      {
        [(_MNArrivalUpdaterState *)self _distanceToEndOfLeg];
        double v10 = v9;
        GEOConfigGetDouble();
        if (v10 <= v11)
        {
          id v12 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
          [v12 startMonitoringForEV];
        }
      }
    }
  }
}

- (BOOL)_updateForEndOfDrivingSegment
{
  BOOL v3 = [(_MNArrivalUpdaterState *)self _checkForEndOfDrivingSegment];
  if (v3)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "Reached end of driving segment with upcoming walking segment. Triggering parked vehicle state.", v8, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_arrivalUpdater);
    int v6 = objc_alloc_init(_MNArrivalUpdaterState_EndOfDrivingSegment);
    [WeakRetained changeState:v6];
  }
  return v3;
}

- (BOOL)_updateForSearchingForParking
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_MNArrivalUpdaterState *)self route];
  int v4 = [v3 transportType];

  if (v4) {
    return 0;
  }
  v5 = [(_MNArrivalUpdaterState *)self details];
  int v6 = [v5 navigationSessionState];
  int v7 = [v6 isOnLastLeg];

  if (!v7) {
    return 0;
  }
  uint64_t v8 = [(_MNArrivalUpdaterState *)self details];
  char v9 = [v8 isInParkingDetectionRegion];

  if (v9)
  {
LABEL_20:
    v28 = [(_MNArrivalUpdaterState *)self arrivalUpdater];
    v29 = objc_alloc_init(_MNArrivalUpdaterState_SearchingForParkingAfterArrival);
    [v28 changeState:v29];

    return 1;
  }
  double v10 = [(_MNArrivalUpdaterState *)self location];
  if ([v10 state] != 1)
  {
LABEL_23:

    return 0;
  }
  double v11 = [(_MNArrivalUpdaterState *)self targetLeg];
  id v12 = [v10 routeMatch];
  uint64_t v13 = [v12 legIndex];
  uint64_t v14 = [v11 legIndex];

  if (v13 != v14)
  {

    goto LABEL_23;
  }
  v15 = [(_MNArrivalUpdaterState *)self details];
  v16 = [v15 navigationSessionState];
  v17 = [v16 targetLeg];
  v18 = [v17 arrivalParameters];

  v19 = objc_opt_new();
  [(_MNArrivalUpdaterState *)self parkingDetectionExcludeRadius];
  objc_msgSend(v19, "setIncludeDistancePadding:");
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v20 = [&unk_1F0E357F0 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    char v22 = 0;
    uint64_t v23 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(&unk_1F0E357F0);
        }
        uint64_t v25 = objc_msgSend(v18, "regionContainmentTypeForLocation:arrivalRegionType:parameters:", v10, objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "integerValue"), v19);
        v22 |= v25 != 2;
        if (!v25)
        {
          int v26 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v21 = [&unk_1F0E357F0 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v22 = 0;
  }
  int v26 = 1;
LABEL_18:

  BOOL result = 0;
  if ((v22 & 1) != 0 && v26) {
    goto LABEL_20;
  }
  return result;
}

- (BOOL)_checkForArrival
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_MNArrivalUpdaterState *)self location];
  if (!v3)
  {
    BOOL v15 = 0;
    goto LABEL_70;
  }
  int v4 = [(_MNArrivalUpdaterState *)self targetLeg];
  v5 = v4;
  if (!v4)
  {
    int v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "Target leg is nil.", buf, 2u);
    }
LABEL_17:
    BOOL v15 = 0;
    goto LABEL_69;
  }
  int v6 = [v4 arrivalParameters];
  if (!v6)
  {
    char v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "No arrival parameters on leg.", buf, 2u);
    }
    BOOL v15 = 0;
    goto LABEL_68;
  }
  [(_MNArrivalUpdaterState *)self _distanceToEndOfLeg];
  if (v7 < 0.0) {
    goto LABEL_17;
  }
  double v8 = v7;
  if ([v6 hasArrivalParametersEndOfRouteDistanceThreshold])
  {
    if (v8 > (double)[v6 arrivalParametersEndOfRouteDistanceThreshold])goto LABEL_17; {
  }
    }
  char v9 = [v3 routeMatch];
  uint64_t v10 = [v3 state];
  if (v10 == 1 && [v6 endOfRouteDistanceThreshold])
  {
    double v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v79 = [v5 legIndex];
      *(_WORD *)&v79[4] = 2048;
      *(double *)&v79[6] = v8;
      __int16 v80 = 1024;
      int v81 = [v6 endOfRouteDistanceThreshold];
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_INFO, "Checking arrival via distance to end of leg[%d] (%0.1fm). Threshold: %um", buf, 0x18u);
    }

    if (v8 < (double)[v6 endOfRouteDistanceThreshold])
    {
      id v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = [v5 legIndex];
        int v14 = [v6 endOfRouteDistanceThreshold];
        *(_DWORD *)buf = 134218496;
        *(double *)v79 = v8;
        *(_WORD *)&v79[8] = 1024;
        *(_DWORD *)&v79[10] = v13;
        __int16 v80 = 1024;
        int v81 = v14;
        _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_DEFAULT, "Arrival triggered by distance (%0.1fm) to end of leg[%d]. Threshold: %um", buf, 0x18u);
      }
LABEL_66:
      BOOL v15 = 1;
      goto LABEL_67;
    }
  }
  v65 = v9;
  v66 = v5;
  [v3 coordinate];
  double v17 = v16;
  double v19 = v18;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v64 = v6;
  id v12 = [v6 arrivalMapRegions];
  uint64_t v20 = [v12 countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (!v20)
  {
    char v22 = 0;
    goto LABEL_40;
  }
  uint64_t v21 = v20;
  char v22 = 0;
  uint64_t v23 = *(void *)v73;
  v67 = v3;
  while (2)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v73 != v23) {
        objc_enumerationMutation(v12);
      }
      uint64_t v25 = *(void **)(*((void *)&v72 + 1) + 8 * i);
      int v26 = [v25 arrivalRegionAction];
      if (v10 != 1)
      {
        if (v26 != 3) {
          continue;
        }
LABEL_30:
        v27 = [v25 arrivalRegion];
        int v28 = objc_msgSend(v27, "containsCoordinate:", v17, v19);

        if (v28)
        {
          v29 = [v3 roadMatch];

          long long v30 = [v25 arrivalRegion];
          if (v29)
          {
            long long v31 = v3;
            long long v32 = v12;
            long long v33 = [v31 roadMatch];
            [v33 coordinateOnRoad];
            double v35 = v34;
            double v37 = v36;
            v38 = [v31 roadMatch];
            [v38 roadWidth];
            LODWORD(v31) = objc_msgSend(v30, "containsCoordinate:radius:", v35, v37, v39);

            if (!v31)
            {
              char v22 = 1;
              id v12 = v32;
              BOOL v3 = v67;
              continue;
            }
            v47 = GEOFindOrCreateLog();
            id v12 = v32;
            v5 = v66;
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              int v48 = [v66 legIndex];
              *(_DWORD *)buf = 67109379;
              *(_DWORD *)v79 = v48;
              *(_WORD *)&v79[4] = 2113;
              *(void *)&v79[6] = v25;
              _os_log_impl(&dword_1B542B000, v47, OS_LOG_TYPE_DEFAULT, "Arrival triggered by user's current road entering arrival region of leg[%d]: %{private}@", buf, 0x12u);
            }
            int v6 = v64;
            char v9 = v65;
            BOOL v3 = v67;
LABEL_65:

            goto LABEL_66;
          }
          v40 = [v3 rawLocation];
          [v40 coordinate];
          double v42 = v41;
          double v44 = v43;
          [v3 horizontalAccuracy];
          int v46 = objc_msgSend(v30, "containsCoordinate:radius:", v42, v44, v45);

          if (v46)
          {
            v47 = GEOFindOrCreateLog();
            v5 = v66;
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              int v60 = [v66 legIndex];
              *(_DWORD *)buf = 67109379;
              *(_DWORD *)v79 = v60;
              *(_WORD *)&v79[4] = 2113;
              *(void *)&v79[6] = v25;
              _os_log_impl(&dword_1B542B000, v47, OS_LOG_TYPE_DEFAULT, "Arrival triggered by user location entering arrival region of leg[%d]: %{private}@", buf, 0x12u);
            }
            int v6 = v64;
            char v9 = v65;
            goto LABEL_65;
          }
        }
        char v22 = 1;
        continue;
      }
      if (v26 == 2) {
        goto LABEL_30;
      }
    }
    uint64_t v21 = [v12 countByEnumeratingWithState:&v72 objects:v77 count:16];
    if (v21) {
      continue;
    }
    break;
  }
LABEL_40:

  char v9 = v65;
  if (v10 == 1 && v22 & 1 | (([v65 isOnParkingLotRoad] & 1) == 0))
  {
    BOOL v15 = 0;
    v5 = v66;
    int v6 = v64;
    goto LABEL_68;
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  int v6 = v64;
  id v12 = [v64 arrivalPoints];
  uint64_t v49 = [v12 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v69;
    while (2)
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v69 != v51) {
          objc_enumerationMutation(v12);
        }
        v53 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        v54 = [v53 point];
        [v54 coordinate];

        GEOCalculateDistance();
        double v56 = v55;
        v57 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          int v58 = [v66 legIndex];
          int v59 = [v53 radius];
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v79 = v58;
          *(_WORD *)&v79[4] = 2048;
          *(double *)&v79[6] = v56;
          __int16 v80 = 1024;
          int v81 = v59;
          _os_log_impl(&dword_1B542B000, v57, OS_LOG_TYPE_INFO, "Checking arrival via arrival point of leg[%d]. Distance: %0.1fm, Radius: %um", buf, 0x18u);
        }

        if (v56 <= (double)[v53 radius])
        {
          v61 = GEOFindOrCreateLog();
          v5 = v66;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            int v62 = [v66 legIndex];
            *(_DWORD *)buf = 67109379;
            *(_DWORD *)v79 = v62;
            *(_WORD *)&v79[4] = 2113;
            *(void *)&v79[6] = v53;
            _os_log_impl(&dword_1B542B000, v61, OS_LOG_TYPE_DEFAULT, "Arrival triggered by user location within arrival point of leg[%d]: %{private}@", buf, 0x12u);
          }

          BOOL v15 = 1;
          goto LABEL_61;
        }
      }
      uint64_t v50 = [v12 countByEnumeratingWithState:&v68 objects:v76 count:16];
      if (v50) {
        continue;
      }
      break;
    }
    BOOL v15 = 0;
    v5 = v66;
LABEL_61:
    int v6 = v64;
    char v9 = v65;
  }
  else
  {
    BOOL v15 = 0;
    v5 = v66;
  }
LABEL_67:

LABEL_68:
LABEL_69:

LABEL_70:
  return v15;
}

- (BOOL)_checkForPreArrival
{
  BOOL v3 = [(_MNArrivalUpdaterState *)self details];
  int v4 = [v3 navigationSessionState];
  v5 = [v4 targetLeg];
  int v6 = [v5 arrivalParameters];

  double v7 = [(_MNArrivalUpdaterState *)self location];
  LOBYTE(v3) = [v6 containsLocation:v7 arrivalRegionType:5];

  return (char)v3;
}

- (BOOL)_checkForApproachingWaypoint
{
  BOOL v3 = [(_MNArrivalUpdaterState *)self details];
  int v4 = [v3 navigationSessionState];
  v5 = [v4 targetLeg];
  int v6 = [v5 arrivalParameters];

  double v7 = [(_MNArrivalUpdaterState *)self location];
  LOBYTE(v3) = [v6 containsLocation:v7 arrivalRegionType:7];

  return (char)v3;
}

- (BOOL)_checkForEndOfDrivingSegment
{
  BOOL v3 = [(_MNArrivalUpdaterState *)self route];
  int v4 = [v3 transportType];

  if (v4) {
    return 0;
  }
  v5 = [(_MNArrivalUpdaterState *)self details];
  int v6 = [v5 navigationSessionState];
  double v7 = [v6 targetLeg];
  double v8 = [v7 arrivalParameters];

  char v9 = [(_MNArrivalUpdaterState *)self location];
  LOBYTE(v5) = [v8 containsLocation:v9 arrivalRegionType:8];

  return (char)v5;
}

- (double)_distanceToEndOfLeg
{
  BOOL v3 = [(_MNArrivalUpdaterState *)self location];
  int v4 = [(_MNArrivalUpdaterState *)self targetLeg];
  unsigned int v5 = [v4 endPointIndex];
  int v6 = [v3 routeMatch];
  [v6 routeCoordinate];
  uint64_t v7 = GEOPolylineCoordinateCompare();

  if (v7 == -1)
  {
    double v12 = -1.0;
  }
  else
  {
    double v8 = [(_MNArrivalUpdaterState *)self route];
    char v9 = [v3 routeMatch];
    objc_msgSend(v8, "distanceBetweenRouteCoordinate:andRouteCoordinate:", objc_msgSend(v9, "routeCoordinate"), v5);
    double v11 = v10;

    double v12 = fabs(v11);
  }

  return v12;
}

- (MNArrivalUpdater)arrivalUpdater
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arrivalUpdater);
  return (MNArrivalUpdater *)WeakRetained;
}

- (void)setArrivalUpdater:(id)a3
{
}

- (_MNArrivalUpdaterDetails)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_destroyWeak((id *)&self->_arrivalUpdater);
}

@end