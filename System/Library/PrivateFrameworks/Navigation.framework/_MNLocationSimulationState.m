@interface _MNLocationSimulationState
- ($1AB5FA073B851C12C2339EC22442E995)_projectedCoordinateOffRouteFrom:(id)a3 toCoordinate:(id)a4 overTimeDelta:(double)a5 outCourse:(double *)a6 outSpeed:(double *)a7;
- (_MNLocationSimulationData)data;
- (_MNLocationSimulationStateDelegate)delegate;
- (double)_courseFromCoordinate:(id)a3 toCoordinate:(id)a4;
- (id)_followRouteStateWithStartRouteCoordinate:(id)a3;
- (id)_locationWithCoordinate:(id)a3 course:(double)a4 speed:(double)a5;
- (id)nextSimulatedLocationWithElapsedTime:(double)a3;
- (int64_t)type;
- (void)setData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4;
@end

@implementation _MNLocationSimulationState

- (int64_t)type
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Must be implemented by subclasses.", v3, 2u);
  }
  return 0;
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Must be implemented by subclasses.", v4, 2u);
  }
  return 0;
}

- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(_MNLocationSimulationState *)self data];
  if ([v6 simulationType] == 2)
  {
  }
  else
  {
    v7 = [(_MNLocationSimulationState *)self data];
    uint64_t v8 = [v7 simulationType];

    if (v8 != 4) {
      goto LABEL_16;
    }
  }
  v9 = [(_MNLocationSimulationData *)self->_data lastLocation];
  [v9 coordinate];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v10 = objc_msgSend(v5, "route", 0);
  v11 = [v10 legs];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    double v15 = 1.79769313e308;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v28 + 1) + 8 * v16);
        v18 = [v5 route];
        objc_msgSend(v18, "pointAtRouteCoordinate:", objc_msgSend(v17, "startRouteCoordinate"));

        GEOCalculateDistance();
        if (v19 < v15)
        {
          double v20 = v19;
          uint64_t v21 = [v17 legIndex];
          v22 = [(_MNLocationSimulationState *)self data];
          [v22 setCurrentLegIndex:v21];

          double v15 = v20;
        }
        ++v16;
      }
      while (v13 != v16);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v13);
  }

  v23 = MNGetMNNavigationSimulationLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = [(_MNLocationSimulationState *)self data];
    int v25 = [v24 currentLegIndex];
    *(_DWORD *)buf = 67109120;
    int v33 = v25;
    _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_DEFAULT, "Proceeding to start of leg %d of new route.", buf, 8u);
  }
  v26 = [(_MNLocationSimulationState *)self delegate];
  v27 = objc_alloc_init(_MNLocationSimulationState_ProceedingToStartOfLeg);
  [v26 changeState:v27];

LABEL_16:
}

- (id)_locationWithCoordinate:(id)a3 course:(double)a4 speed:(double)a5
{
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v10 = [(_MNLocationSimulationState *)self data];
  if ([v10 isChinaShifted]) {
    int v11 = 2;
  }
  else {
    int v11 = 1;
  }

  int v14 = 1;
  double v15 = var0;
  double v16 = var1;
  uint64_t v17 = 0x4014000000000000;
  double v18 = var2;
  uint64_t v19 = 0x3FF0000000000000;
  double v20 = a5;
  uint64_t v21 = 0;
  double v22 = a4;
  uint64_t v23 = 0x4024000000000000;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v25 = 0;
  uint64_t v26 = 0x100000000;
  double v27 = var0;
  double v28 = var1;
  double v29 = a4;
  uint64_t v30 = 0;
  int v31 = v11;
  int v32 = v11;
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  uint64_t v12 = [[MNLocation alloc] initWithClientLocation:&v14];
  return v12;
}

- (id)_followRouteStateWithStartRouteCoordinate:(id)a3
{
  v4 = [(_MNLocationSimulationState *)self data];
  uint64_t v5 = [v4 simulationType];

  v6 = &off_1E60F5D20;
  if (v5 != 4) {
    v6 = off_1E60F5D18;
  }
  v7 = (void *)[objc_alloc(*v6) initWithStartRouteCoordinate:a3];
  return v7;
}

- ($1AB5FA073B851C12C2339EC22442E995)_projectedCoordinateOffRouteFrom:(id)a3 toCoordinate:(id)a4 overTimeDelta:(double)a5 outCourse:(double *)a6 outSpeed:(double *)a7
{
  double var0 = a4.var0;
  double var2 = a3.var2;
  double v9 = -180.0;
  double v10 = 1.79769313e308;
  if (a3.var1 < -180.0 || (var1 = a3.var1, double v12 = a3.var0, a3.var1 > 180.0) || a3.var0 < -90.0)
  {
    double v13 = -180.0;
    goto LABEL_16;
  }
  double v36 = var2;
  double v13 = -180.0;
  if (a3.var0 <= 90.0)
  {
    double v17 = a4.var2;
    double v18 = a4.var1;
    double v20 = [(_MNLocationSimulationState *)self data];
    [v20 speedOverride];
    double v22 = v21;

    double v23 = 5.0;
    if (v22 >= 0.0)
    {
      v24 = [(_MNLocationSimulationState *)self data];
      [v24 speedOverride];
      double v23 = v25;
    }
    if (a7) {
      *a7 = v23;
    }
    double v26 = v23 * a5;
    GEOCalculateDistance();
    if (v26 <= v27)
    {
      double v28 = v26 / v27;
      double v13 = v12 + (var0 - v12) * v28;
      double v9 = var1 + (v18 - var1) * v28;
      if (a6)
      {
        GEOCalculateDistance();
        if (v29 >= 0.000001)
        {
          -[_MNLocationSimulationState _courseFromCoordinate:toCoordinate:](self, "_courseFromCoordinate:toCoordinate:", v12, var1, v36, var0, v18, v17);
          *(void *)a6 = v33;
          double v10 = v36;
          goto LABEL_16;
        }
        uint64_t v30 = [(_MNLocationSimulationState *)self data];
        int v31 = [v30 lastLocation];
        [v31 course];
        *(void *)a6 = v32;
      }
      double v10 = v36;
    }
    else
    {
      double v10 = v17;
      double v9 = v18;
      double v13 = var0;
    }
  }
LABEL_16:
  double v34 = v13;
  double v35 = v9;
  result.double var2 = v10;
  result.double var1 = v35;
  result.double var0 = v34;
  return result;
}

- (double)_courseFromCoordinate:(id)a3 toCoordinate:(id)a4
{
  GEOBearingFromCoordinateToCoordinate();
  for (; result < 0.0; double result = result + 360.0)
    ;
  for (; result >= 360.0; double result = result + -360.0)
    ;
  return result;
}

- (_MNLocationSimulationStateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_MNLocationSimulationStateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_MNLocationSimulationData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end