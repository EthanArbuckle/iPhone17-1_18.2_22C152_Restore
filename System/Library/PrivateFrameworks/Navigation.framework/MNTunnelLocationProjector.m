@interface MNTunnelLocationProjector
- ($212C09783140BCCD23384160D545CE0D)_projectedRouteCoordinateFrom:(id)a3 timeInterval:(double)a4 tunnelRange:(GEOPolylineCoordinateRange)a5;
- (BOOL)isProjecting;
- (GEOPolylineCoordinateRange)_tunnelRangeForRouteCoordinate:(id)a3;
- (MNTunnelLocationProjector)init;
- (MNTunnelLocationProjectorDelegate)delegate;
- (id)_projectedLocationFrom:(id)a3 timeInterval:(double)a4 tunnelRange:(GEOPolylineCoordinateRange)a5;
- (id)_tunnelRanges;
- (void)_locationUpdateOverdueTimerFired:(id)a3;
- (void)_resetTimerWithTimeout:(double)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)stop;
- (void)updateForRouteInfo:(id)a3;
- (void)updateLocation:(id)a3;
@end

@implementation MNTunnelLocationProjector

- (MNTunnelLocationProjector)init
{
  v5.receiver = self;
  v5.super_class = (Class)MNTunnelLocationProjector;
  v2 = [(MNTunnelLocationProjector *)&v5 init];
  if (v2)
  {
    GEOConfigGetDouble();
    v2->_locationOverdueTimeoutForTunnel = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(MNTunnelLocationProjector *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)MNTunnelLocationProjector;
  [(MNTunnelLocationProjector *)&v3 dealloc];
}

- (void)updateLocation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 isProjected] & 1) == 0)
  {
    if (self->_isProjecting)
    {
      v6 = MNGetMNTunnelProjectorLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "Stopping projection because of new location: %@", (uint8_t *)&v11, 0xCu);
      }
    }
    self->_isProjecting = 0;
    [(MNTunnelLocationProjector *)self _resetTimerWithTimeout:self->_locationOverdueTimeoutForTunnel];
    if ([v5 state] == 1)
    {
      objc_storeStrong((id *)&self->_lastUnprojectedLocation, a3);
      v7 = +[MNTimeManager currentDate];
      lastUnprojectedLocationDate = self->_lastUnprojectedLocationDate;
      self->_lastUnprojectedLocationDate = v7;
    }
    else
    {
      lastUnprojectedLocation = self->_lastUnprojectedLocation;
      self->_lastUnprojectedLocation = 0;

      v10 = self->_lastUnprojectedLocationDate;
      self->_lastUnprojectedLocationDate = 0;

      [(NSTimer *)self->_locationUpdateOverdueTimer invalidate];
      lastUnprojectedLocationDate = self->_locationUpdateOverdueTimer;
      self->_locationUpdateOverdueTimer = 0;
    }
  }
}

- (void)updateForRouteInfo:(id)a3
{
  id v10 = a3;
  currentRouteInfo = self->_currentRouteInfo;
  if (!currentRouteInfo
    || ([(MNActiveRouteInfo *)currentRouteInfo routeID],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v10 routeID],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v6 isEqual:v7],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    [(MNTunnelLocationProjector *)self stop];
    objc_storeStrong((id *)&self->_currentRouteInfo, a3);
    tunnelRanges = self->_tunnelRanges;
    self->_tunnelRanges = 0;
  }
}

- (void)stop
{
  currentRouteInfo = self->_currentRouteInfo;
  self->_currentRouteInfo = 0;

  tunnelRanges = self->_tunnelRanges;
  self->_tunnelRanges = 0;

  lastUnprojectedLocation = self->_lastUnprojectedLocation;
  self->_lastUnprojectedLocation = 0;

  lastUnprojectedLocationDate = self->_lastUnprojectedLocationDate;
  self->_lastUnprojectedLocationDate = 0;

  [(NSTimer *)self->_locationUpdateOverdueTimer invalidate];
  locationUpdateOverdueTimer = self->_locationUpdateOverdueTimer;
  self->_locationUpdateOverdueTimer = 0;

  self->_isProjecting = 0;
}

- (GEOPolylineCoordinateRange)_tunnelRangeForRouteCoordinate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!GEOPolylineCoordinateIsInvalid())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(MNTunnelLocationProjector *)self _tunnelRanges];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
          long long v16 = 0uLL;
          [v9 getValue:&v16];
          if GEOPolylineCoordinateRangeIsValid() && (GEOPolylineCoordinateInRange())
          {

            goto LABEL_14;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  long long v16 = *MEMORY[0x1E4F641A0];
LABEL_14:
  PolylineCoordinate v11 = (PolylineCoordinate)*((void *)&v16 + 1);
  PolylineCoordinate v10 = (PolylineCoordinate)v16;
  result.end = v11;
  result.start = v10;
  return result;
}

- (id)_tunnelRanges
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_tunnelRanges = &self->_tunnelRanges;
  tunnelRanges = self->_tunnelRanges;
  if (tunnelRanges)
  {
    v19 = tunnelRanges;
  }
  else
  {
    currentRouteInfo = self->_currentRouteInfo;
    if (currentRouteInfo)
    {
      uint64_t v18 = (id *)p_tunnelRanges;
      uint64_t v5 = [(MNActiveRouteInfo *)currentRouteInfo route];
      v19 = [MEMORY[0x1E4F1CA48] array];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v6 = [v5 cameraInfos];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v23 != v9) {
              objc_enumerationMutation(v6);
            }
            PolylineCoordinate v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            long long v12 = [v11 styleAttributes];
            long long v13 = [v12 attributes];
            long long v14 = [v13 firstObject];

            if ([v14 key] == 65639)
            {
              uint64_t v20 = 0;
              uint64_t v21 = 0;
              uint64_t v20 = [v11 routeCoordinateRange];
              uint64_t v21 = v15;
              uint64_t v20 = [v5 routeCoordinateForDistance:v20 beforeRouteCoordinate:100.0];
              long long v16 = [MEMORY[0x1E4F29238] value:&v20 withObjCType:"{GEOPolylineCoordinateRange={?=If}{?=If}}"];
              [(NSArray *)v19 addObject:v16];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v8);
      }

      objc_storeStrong(v18, v19);
    }
    else
    {
      v19 = 0;
    }
  }
  return v19;
}

- (void)_resetTimerWithTimeout:(double)a3
{
  uint64_t v5 = +[MNLocationManager sharedLocationManager];
  [v5 timeScale];
  double v7 = a3 / v6;

  [(NSTimer *)self->_locationUpdateOverdueTimer invalidate];
  uint64_t v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__locationUpdateOverdueTimerFired_ selector:0 userInfo:0 repeats:v7];
  locationUpdateOverdueTimer = self->_locationUpdateOverdueTimer;
  self->_locationUpdateOverdueTimer = v8;
  MEMORY[0x1F41817F8](v8, locationUpdateOverdueTimer);
}

- (void)_locationUpdateOverdueTimerFired:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  lastUnprojectedLocation = self->_lastUnprojectedLocation;
  if (lastUnprojectedLocation
    && self->_lastUnprojectedLocationDate
    && self->_currentRouteInfo
    && [(MNLocation *)lastUnprojectedLocation state] == 1
    && ([(MNLocation *)self->_lastUnprojectedLocation routeMatch],
        double v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = -[MNTunnelLocationProjector _tunnelRangeForRouteCoordinate:](self, "_tunnelRangeForRouteCoordinate:", [v6 routeCoordinate]), v9 = v8, v6, !GEOPolylineCoordinateRangeIsInvalid()))
  {
    PolylineCoordinate v10 = +[MNTimeManager currentDate];
    [v10 timeIntervalSinceDate:self->_lastUnprojectedLocationDate];
    double v12 = v11;

    if (v12 < 0.0)
    {
      v43 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v47 = "-[MNTunnelLocationProjector _locationUpdateOverdueTimerFired:]";
        __int16 v48 = 2080;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTunnelLocationProjector.m";
        __int16 v50 = 1024;
        *(_DWORD *)v51 = 186;
        *(_WORD *)&v51[4] = 2080;
        *(void *)&v51[6] = "timeInterval >= 0";
        _os_log_impl(&dword_1B542B000, v43, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
      }
    }
    if (v12 >= 0.0)
    {
      long long v13 = +[MNLocationManager sharedLocationManager];
      [v13 timeScale];
      double v15 = v12 / v14;

      if (!self->_isProjecting)
      {
        long long v16 = [(MNActiveRouteInfo *)self->_currentRouteInfo route];
        [v16 pointAtRouteCoordinate:v7];
        uint64_t v18 = v17;
        uint64_t v20 = v19;
        [v16 pointAtRouteCoordinate:v9];
        uint64_t v22 = v21;
        uint64_t v24 = v23;
        long long v25 = MNGetMNTunnelProjectorLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          GEOPolylineCoordinateRangeAsString();
          v26 = (char *)objc_claimAutoreleasedReturnValue();
          [v16 distanceBetweenRouteCoordinate:v7 andRouteCoordinate:v9];
          *(_DWORD *)buf = 138413570;
          v47 = v26;
          __int16 v48 = 2048;
          v49 = v18;
          __int16 v50 = 2048;
          *(void *)v51 = v20;
          *(_WORD *)&v51[8] = 2048;
          *(void *)&v51[10] = v22;
          __int16 v52 = 2048;
          uint64_t v53 = v24;
          __int16 v54 = 2048;
          uint64_t v55 = v27;
          _os_log_impl(&dword_1B542B000, v25, OS_LOG_TYPE_INFO, "Starting location projection through tunnel [%@] (%f, %f) to (%f, %f), tunnel length: %0.1f meters", buf, 0x3Eu);
        }
      }
      v28 = -[MNTunnelLocationProjector _projectedLocationFrom:timeInterval:tunnelRange:](self, "_projectedLocationFrom:timeInterval:tunnelRange:", self->_lastUnprojectedLocation, v7, v9, v15);
      if (v28)
      {
        v29 = MNGetMNTunnelProjectorLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v45 = [v28 routeMatch];
          [v45 routeCoordinate];
          GEOPolylineCoordinateAsString();
          v44 = (char *)objc_claimAutoreleasedReturnValue();
          v30 = [v28 routeMatch];
          [v30 locationCoordinate];
          uint64_t v32 = v31;
          v33 = [v28 routeMatch];
          [v33 locationCoordinate];
          uint64_t v35 = v34;
          v36 = [(MNActiveRouteInfo *)self->_currentRouteInfo route];
          v37 = [(MNLocation *)self->_lastUnprojectedLocation routeMatch];
          uint64_t v38 = [v37 routeCoordinate];
          v39 = [v28 routeMatch];
          objc_msgSend(v36, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v38, objc_msgSend(v39, "routeCoordinate"));
          *(_DWORD *)buf = 134219010;
          v47 = *(const char **)&v15;
          __int16 v48 = 2112;
          v49 = v44;
          __int16 v50 = 2048;
          *(void *)v51 = v32;
          *(_WORD *)&v51[8] = 2048;
          *(void *)&v51[10] = v35;
          __int16 v52 = 2048;
          uint64_t v53 = v40;
          _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_INFO, "Time: %0.1fs, projected location: [%@] (%f, %f), distance: %0.1f meters", buf, 0x34u);
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained tunnelLocationProjector:self didUpdateLocation:v28];
      }
      v42 = +[MNLocationManager sharedLocationManager];
      [v42 expectedGpsUpdateInterval];
      [(MNTunnelLocationProjector *)self _resetTimerWithTimeout:"_resetTimerWithTimeout:"];

      self->_isProjecting = v28 != 0;
    }
  }
  else
  {
    self->_isProjecting = 0;
  }
}

- (id)_projectedLocationFrom:(id)a3 timeInterval:(double)a4 tunnelRange:(GEOPolylineCoordinateRange)a5
{
  PolylineCoordinate end = a5.end;
  PolylineCoordinate start = a5.start;
  id v9 = a3;
  if ([v9 state] == 1)
  {
    PolylineCoordinate v10 = [v9 routeMatch];
    $212C09783140BCCD23384160D545CE0D v11 = -[MNTunnelLocationProjector _projectedRouteCoordinateFrom:timeInterval:tunnelRange:](self, "_projectedRouteCoordinateFrom:timeInterval:tunnelRange:", [v10 routeCoordinate], start, end, a4);
    if (GEOPolylineCoordinateIsInvalid())
    {
      double v12 = 0;
    }
    else
    {
      long long v13 = [(MNActiveRouteInfo *)self->_currentRouteInfo route];
      id v14 = objc_alloc(MEMORY[0x1E4F649D8]);
      double v15 = [(MNActiveRouteInfo *)self->_currentRouteInfo route];
      [v13 pointAtRouteCoordinate:v11];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      uint64_t v22 = [v13 stepIndexForRouteCoordinate:v11];
      [v13 courseAtRouteCoordinateIndex:v11];
      double v24 = v23;
      long long v25 = +[MNTimeManager currentDate];
      v26 = objc_msgSend(v14, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v15, v11, v22, v25, v17, v19, v21, v24);

      [v26 setModifiedHorizontalAccuracy:10.0];
      [v26 setIsTunnelProjection:1];
      [v26 setIsGoodMatch:1];
      [v26 setShouldProjectLocationAlongRoute:1];
      memset(&v37[2], 0, 156);
      if (v9) {
        [v9 clientLocation];
      }
      [v26 locationCoordinate];
      *(void *)((char *)&v37[2] + 4) = v27;
      [v26 locationCoordinate];
      *(void *)((char *)&v37[2] + 12) = v28;
      *(_OWORD *)((char *)&v37[8] + 4) = *(_OWORD *)((char *)&v37[2] + 4);
      [v26 matchedCourse];
      *(void *)((char *)&v37[5] + 12) = v29;
      objc_msgSend(v13, "distanceBetweenRouteCoordinate:andRouteCoordinate:", objc_msgSend(v10, "routeCoordinate"), v11);
      *(double *)((char *)&v37[4] + 12) = v30 / a4;
      uint64_t v31 = [v26 timestamp];
      [v31 timeIntervalSinceReferenceDate];
      *(void *)((char *)&v37[6] + 12) = v32;

      id v33 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      v36[6] = v37[8];
      v36[7] = v37[9];
      v37[0] = v37[10];
      *(_OWORD *)((char *)v37 + 12) = *(_OWORD *)((char *)&v37[10] + 12);
      v36[2] = v37[4];
      v36[3] = v37[5];
      v36[4] = v37[6];
      v36[5] = v37[7];
      v36[0] = v37[2];
      v36[1] = v37[3];
      uint64_t v34 = (void *)[v33 initWithClientLocation:v36];
      double v12 = [[MNLocation alloc] initWithRouteMatch:v26 rawLocation:v34 locationMatchType:2];
      [(MNLocation *)v12 setLocationUnreliable:1];
    }
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- ($212C09783140BCCD23384160D545CE0D)_projectedRouteCoordinateFrom:(id)a3 timeInterval:(double)a4 tunnelRange:(GEOPolylineCoordinateRange)a5
{
  PolylineCoordinate end = a5.end;
  PolylineCoordinate start = a5.start;
  if (GEOPolylineCoordinateIsInvalid())
  {
    return ($212C09783140BCCD23384160D545CE0D)*MEMORY[0x1E4F64198];
  }
  else
  {
    $212C09783140BCCD23384160D545CE0D v11 = [(MNActiveRouteInfo *)self->_currentRouteInfo route];
    double v12 = [(MNActiveRouteInfo *)self->_currentRouteInfo etaRoute];
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    *(double *)&v31[3] = a4;
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2810000000;
    uint64_t v13 = *MEMORY[0x1E4F64198];
    uint64_t v29 = &unk_1B5572251;
    uint64_t v30 = v13;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __84__MNTunnelLocationProjector__projectedRouteCoordinateFrom_timeInterval_tunnelRange___block_invoke;
    v20[3] = &unk_1E60FB9F0;
    PolylineCoordinate v24 = start;
    PolylineCoordinate v25 = end;
    uint64_t v22 = v31;
    double v23 = &v26;
    id v14 = v11;
    id v21 = v14;
    [v14 iterateTravelTimeRangesFromRouteCoordinate:a3 etaRoute:v12 handler:v20];
    int IsValid = GEOPolylineCoordinateIsValid();
    $212C09783140BCCD23384160D545CE0D v10 = ($212C09783140BCCD23384160D545CE0D)v27[4];
    if (IsValid)
    {
      int IsABeforeB = GEOPolylineCoordinateIsABeforeB();
      if (IsABeforeB) {
        PolylineCoordinate v17 = end;
      }
      else {
        PolylineCoordinate v17 = start;
      }
      if (IsABeforeB) {
        PolylineCoordinate end = start;
      }
      if (GEOPolylineCoordinateIsABeforeB()) {
        $212C09783140BCCD23384160D545CE0D v18 = v10;
      }
      else {
        $212C09783140BCCD23384160D545CE0D v18 = ($212C09783140BCCD23384160D545CE0D)v17;
      }
      if (GEOPolylineCoordinateIsABeforeB()) {
        $212C09783140BCCD23384160D545CE0D v10 = v18;
      }
      else {
        $212C09783140BCCD23384160D545CE0D v10 = ($212C09783140BCCD23384160D545CE0D)end;
      }
      v27[4] = (uint64_t)v10;
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(v31, 8);
  }
  return v10;
}

uint64_t __84__MNTunnelLocationProjector__projectedRouteCoordinateFrom_timeInterval_tunnelRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, double a5, double a6)
{
  uint64_t result = GEOPolylineCoordinateIsABeforeB();
  if ((result & 1) == 0)
  {
    uint64_t result = GEOPolylineCoordinateIsABeforeB();
    if (result)
    {
LABEL_5:
      *a4 = 1;
      return result;
    }
    double v13 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v13 < a6)
    {
      uint64_t result = [*(id *)(a1 + 32) routeCoordinateForDistance:a2 afterRouteCoordinate:v13 * a5 / a6];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = result;
      goto LABEL_5;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = a3;
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24)
                                                                - a6;
  }
  return result;
}

- (MNTunnelLocationProjectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNTunnelLocationProjectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isProjecting
{
  return self->_isProjecting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationUpdateOverdueTimer, 0);
  objc_storeStrong((id *)&self->_lastUnprojectedLocationDate, 0);
  objc_storeStrong((id *)&self->_lastUnprojectedLocation, 0);
  objc_storeStrong((id *)&self->_tunnelRanges, 0);
  objc_storeStrong((id *)&self->_currentRouteInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end