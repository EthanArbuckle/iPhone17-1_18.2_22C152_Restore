@interface VKPuckAnimator
- (BOOL)alwaysUseGoodRouteMatch;
- (BOOL)hasElevation;
- (Matrix<double,)lastProjectedPosition;
- (VKPuckAnimator)initWithCallbackQueue:(id)a3;
- (VKPuckAnimatorDelegate)delegate;
- (VKPuckAnimatorTarget)target;
- (double)tracePlaybackSpeedMultiplier;
- (id).cxx_construct;
- (id)detailedDescription;
- (id)initWithCallbackQueue:;
- (optional<std::pair<geo::Mercator3<double>,)currentSnappedSegment;
- (uint64_t)initWithCallbackQueue:;
- (unint64_t)behavior;
- (unint64_t)subscribeToLocationUpdates:(function<void (VKPuckAnimator *);
- (void)_publishLocationUpdate:(id)a3 routeMatch:(id)a4 uuid:(id)a5;
- (void)_queueLocationUpdate:(id)a3 routeMatch:(id)a4 locationUpdateUUID:(id)a5;
- (void)_step;
- (void)_updateLocation:(id)a3 routeMatch:(id)a4 locationUpdateUUID:(id)a5;
- (void)dealloc;
- (void)initWithCallbackQueue:;
- (void)pause;
- (void)processLocationUpdates;
- (void)resetCourse;
- (void)resume;
- (void)setAlwaysUseGoodRouteMatch:(BOOL)a3;
- (void)setBehavior:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLastProjectedPosition:()Matrix<double;
- (void)setRouteOverlayCache:(const RouteOverlayCache *)a3;
- (void)setTarget:(id)a3;
- (void)setTracePlaybackSpeedMultiplier:(double)a3;
- (void)start;
- (void)stop;
- (void)unsubscribeFromLocationUpdates:(unint64_t)a3;
- (void)updateLocation:(id)a3 routeMatch:(id)a4;
- (void)updateVehicleHeading:(double)a3;
- (void)updatedPosition:(const void *)a3;
@end

@implementation VKPuckAnimator

- (void)processLocationUpdates
{
  if (self->_lastLocationUpdate.__engaged_)
  {
    [(VKPuckAnimator *)self _updateLocation:self->_lastLocationUpdate.var0.__val_.location routeMatch:self->_lastLocationUpdate.var0.__val_.routeMatch locationUpdateUUID:self->_lastLocationUpdate.var0.__val_.locationUpdateUUID];
    if (self->_lastLocationUpdate.__engaged_)
    {

      self->_lastLocationUpdate.__engaged_ = 0;
    }
  }
}

- (void)_updateLocation:(id)a3 routeMatch:(id)a4 locationUpdateUUID:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  v11 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    [v8 coordinate];
    uint64_t v13 = v12;
    [v8 coordinate];
    *(_DWORD *)buf = 134283777;
    *(void *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2049;
    *(void *)&buf[14] = v14;
    _os_log_impl(&dword_1A1780000, v11, OS_LOG_TYPE_INFO, "VKPuckAnimator processing location %{private}f, %{private}f", buf, 0x16u);
  }

  CFTimeInterval v46 = CACurrentMediaTime();
  routeOverlayCache = self->_routeOverlayCache;
  if (routeOverlayCache)
  {
    v16 = [v9 route];
    v17 = (*((void (**)(const RouteOverlayCache *, void *))routeOverlayCache->var0 + 7))(routeOverlayCache, v16);

    if (v17)
    {
      v18 = [v17 routeRibbon];
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  -[VKPuckAnimatorLocationProjector projectFromLocation:routeMatch:speedMultiplier:routeLine:](self->_locationProjector, "projectFromLocation:routeMatch:speedMultiplier:routeLine:", v8, v9, v18, self->_tracePlaybackSpeedMultiplier, *(void *)&v46);
  [(VKPuckAnimatorLocationProjector *)self->_locationProjector projectedPosition];
  double v20 = v19;
  double v50 = v21;
  long double v22 = v21 * 6.28318531;
  double v49 = v23;
  long double v24 = exp(v23 * 6.28318531 + -3.14159265);
  double v25 = atan(v24);
  long double v26 = fmod(v22, 6.28318531);
  double v27 = fmod(v26 + 6.28318531, 6.28318531);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "projectCoordinate:toPoint:", &v55, v25 * 114.591559 + -90.0, v27 * 57.2957795 + -180.0);

  id v29 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v29, "projectCoordinate:toPoint:", &v54, self->_lastProjectedCoordinate.latitude, self->_lastProjectedCoordinate.longitude);

  if (fabs(self->_lastProjectedCoordinate.longitude + 180.0) >= 0.00000001
    || fabs(self->_lastProjectedCoordinate.latitude + 180.0) >= 0.00000001)
  {
    float64x2_t v30 = vsubq_f64(v54, v55);
    double v48 = sqrt(vaddvq_f64(vmulq_f64(v30, v30)));
  }
  else
  {
    double v48 = 1.79769313e308;
  }
  GEOCalculateDistance();
  double v32 = v31;
  double value = self->_puckUpdateDistanceDeltaThreshold._value;
  if (v31 <= value && self->_hasElevation) {
    goto LABEL_38;
  }
  self->_lastProjectedPosition._e[0] = v50;
  self->_lastProjectedPosition._e[1] = v49;
  self->_lastProjectedPosition._e[2] = v20;
  self->_lastProjectedCoordinate.latitude = v25 * 114.591559 + -90.0;
  self->_lastProjectedCoordinate.longitude = v27 * 57.2957795 + -180.0;
  double v34 = v25 * 2.0 + -1.57079633;
  double v35 = v49;
  double v36 = v50;
  *(double *)buf = v34;
  *(double *)&buf[8] = v27 + -3.14159265;
  *(double *)&buf[16] = v20;
  *(double *)v52 = v50;
  *(double *)&v52[1] = v49;
  double v53 = v20;
  self->_hasElevation = 0;
  [(VKPuckAnimatorLocationProjector *)self->_locationProjector elevationInProjectedPostion];
  if (v37)
  {
    self->_hasElevation = 1;
    goto LABEL_26;
  }
  id v38 = objc_loadWeakRetained((id *)&self->_delegate);
  double v39 = COERCE_DOUBLE([v38 puckAnimator:self getElevationWithCoordinate:buf]);
  char v41 = v40;

  double v20 = v41 ? v39 : 0.0;
  double v53 = v20;
  self->_hasElevation = v41 != 0;
  BOOL v42 = v41 || v32 > value;
  double v35 = v49;
  double v36 = v50;
  if (!v42)
  {
LABEL_38:
    [(VKPuckAnimator *)self _publishLocationUpdate:v8 routeMatch:v9 uuid:v10];
    goto LABEL_39;
  }
LABEL_26:
  if (v48 <= self->_puckUpdatePointDeltaForAnimation._value)
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    v45 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_1A1780000, v45, OS_LOG_TYPE_INFO, "Move puck without animation", v51, 2u);
    }

    [(VKPuckAnimator *)self updatedPosition:v52];
    [(VKPuckAnimator *)self _publishLocationUpdate:v8 routeMatch:v9 uuid:v10];
  }
  else
  {
    curve = self->_curve;
    BOOL v44 = ![(VKPuckAnimatorLocationProjector *)self->_locationProjector isProjectedPositionBehind]&& !self->_resetCourse&& !self->_suspended;
    [(VKRunningCurve *)curve setCourseValid:v44];
    -[VKRunningCurve appendPosition:coordinate:atTime:](self->_curve, "appendPosition:coordinate:atTime:", [(VKPuckAnimatorLocationProjector *)self->_locationProjector projectedCoordinate], v36, v35, v20, v47);
    [(VKPuckAnimator *)self _publishLocationUpdate:v8 routeMatch:v9 uuid:v10];
    if (self->_suspended)
    {
      self->_suspended = 0;
      [(VKPuckAnimator *)self resume];
    }
    self->_resetCourse = 0;
  }
LABEL_39:
}

- (void)_queueLocationUpdate:(id)a3 routeMatch:(id)a4 locationUpdateUUID:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  v11 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    [v8 coordinate];
    uint64_t v13 = v12;
    [v8 coordinate];
    int v22 = 134283777;
    uint64_t v23 = v13;
    __int16 v24 = 2049;
    uint64_t v25 = v14;
    _os_log_impl(&dword_1A1780000, v11, OS_LOG_TYPE_INFO, "VKPuckAnimator queued location %{private}f, %{private}f", (uint8_t *)&v22, 0x16u);
  }

  v15 = (CLLocation *)v8;
  v16 = (GEORouteMatch *)v9;
  v17 = (NSUUID *)v10;
  v18 = v17;
  if (self->_lastLocationUpdate.__engaged_)
  {
    location = self->_lastLocationUpdate.var0.__val_.location;
    self->_lastLocationUpdate.var0.__val_.location = v15;

    routeMatch = self->_lastLocationUpdate.var0.__val_.routeMatch;
    self->_lastLocationUpdate.var0.__val_.routeMatch = v16;

    locationUpdateUUID = self->_lastLocationUpdate.var0.__val_.locationUpdateUUID;
    self->_lastLocationUpdate.var0.__val_.locationUpdateUUID = v18;

    if (!v16) {
      goto LABEL_10;
    }
  }
  else
  {
    self->_lastLocationUpdate.var0.__val_.location = v15;
    self->_lastLocationUpdate.var0.__val_.routeMatch = v16;
    self->_lastLocationUpdate.var0.__val_.locationUpdateUUID = v17;
    self->_lastLocationUpdate.__engaged_ = 1;
    if (!v16)
    {
LABEL_10:
      [(VKPuckAnimator *)self processLocationUpdates];
      goto LABEL_11;
    }
  }
  if (([(GEORouteMatch *)v16 shouldProjectLocationAlongRoute] & 1) == 0) {
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_publishLocationUpdate:(id)a3 routeMatch:(id)a4 uuid:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  begin = self->_locationUpdateSubscriptions._backing.__begin_;
  end = self->_locationUpdateSubscriptions._backing.__end_;
  while (begin != end)
  {
    if (begin[4])
    {
      v17 = self;
      id v16 = v13;
      id v15 = v8;
      id v14 = v9;
      uint64_t v12 = begin[4];
      if (!v12)
      {
        std::__throw_bad_function_call[abi:nn180100]();
        __break(1u);
        return;
      }
      (*(void (**)(uint64_t, VKPuckAnimator **, id *, id *, id *))(*(void *)v12 + 48))(v12, &v17, &v16, &v15, &v14);
    }
    begin += 5;
  }
}

- (BOOL)hasElevation
{
  return self->_hasElevation;
}

- (optional<std::pair<geo::Mercator3<double>,)currentSnappedSegment
{
  result = (optional<std::pair<geo::Mercator3<double>, geo::Mercator3<double>>> *)self->_locationProjector;
  if (result) {
    return (optional<std::pair<geo::Mercator3<double>, geo::Mercator3<double>>> *)unk_1EF5ED5F8(result, "currentSnappedSegment");
  }
  *(void *)&retstr->__engaged_ = 0;
  *(_OWORD *)&retstr->var0.__val_.first._e[2] = 0u;
  *(_OWORD *)&retstr->var0.__val_.second._e[1] = 0u;
  *(_OWORD *)&retstr->var0.__null_state_ = 0u;
  return result;
}

- (void)updateVehicleHeading:(double)a3
{
  if (vabdd_f64(a3, self->_vehicleHeading) >= 0.000001)
  {
    self->_vehicleHeading = a3;
    if (self->_suspended)
    {
      self->_suspended = 0;
      [(VKPuckAnimator *)self resume];
    }
  }
}

- (void)resetCourse
{
  self->_resetCourse = 1;
}

- (void)setDelegate:(id)a3
{
}

- (VKPuckAnimator)initWithCallbackQueue:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)VKPuckAnimator;
  v5 = [(VKPuckAnimator *)&v27 init];
  uint64_t v6 = (uint64_t)v5;
  if (v5)
  {
    v5->_lastProjectedPosition._e[0] = 0.0;
    v5->_lastProjectedPosition._e[1] = 0.0;
    v5->_lastProjectedPosition._e[2] = 0.0;
    v7 = objc_alloc_init(VKPuckAnimatorLocationProjector);
    id v8 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v7;

    *(void *)(v6 + 72) = 0x3FF0000000000000;
    *(void *)(v6 + 80) = 3;
    objc_initWeak(&location, (id)v6);
    *(_OWORD *)(v6 + 240) = VectorKitConfig_PuckUpdateDistanceDeltaThreshold;
    if (*(void *)(v6 + 240)) {
      BOOL v9 = *(void *)(v6 + 248) == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      GEOConfigGetDouble();
      *(void *)(v6 + 256) = v10;
    }
    objc_copyWeak(&to, &location);
    char v37 = 0;
    double v35 = (void (**)(void **))&unk_1EF56C4C8;
    objc_moveWeak(&v36, &to);
    char v37 = (void **)&v35;
    objc_destroyWeak(&to);
    md::Monitorable<md::ConfigValue<GEOConfigKeyDouble,double>>::setCallbackQueue((void *)(v6 + 240), v4, &v35);
    if (v37 == (void **)&v35)
    {
      v35[4]((void **)&v35);
    }
    else if (v37)
    {
      (*((void (**)(void **))*v37 + 5))(v37);
    }
    *(_OWORD *)(v6 + 160) = VectorKitConfig_PuckUpdatePointDeltaForAnimation;
    if (*(void *)(v6 + 160) && *(void *)(v6 + 168))
    {
      GEOConfigGetDouble();
      *(void *)(v6 + 176) = v11;
    }
    objc_copyWeak(&from, &location);
    double v34 = 0;
    double v32 = (void (**)(void **))&unk_1EF56C510;
    objc_moveWeak(&v33, &from);
    double v34 = (void **)&v32;
    objc_destroyWeak(&from);
    md::Monitorable<md::ConfigValue<GEOConfigKeyDouble,double>>::setCallbackQueue((void *)(v6 + 160), v4, &v32);
    if (v34 == (void **)&v32)
    {
      v32[4]((void **)&v32);
    }
    else if (v34)
    {
      (*((void (**)(void))*v34 + 5))();
    }
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    uint64_t v12 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(v6 + 256);
      uint64_t v14 = *(void *)(v6 + 176);
      *(_DWORD *)buf = 134218240;
      uint64_t v29 = v13;
      __int16 v30 = 2048;
      uint64_t v31 = v14;
      _os_log_impl(&dword_1A1780000, v12, OS_LOG_TYPE_INFO, "PuckUpdateDistanceDeltaThreshold:%f PuckUpdatePointDeltaForAnimation:%f", buf, 0x16u);
    }

    VKLockScreenLog(@"Creating VKPuckAnimator %p", v15, v16, v17, v18, v19, v20, v21, v6);
    id v22 = (id)v6;
    objc_destroyWeak(&location);
  }

  return (VKPuckAnimator *)v6;
}

- (void)initWithCallbackQueue:
{
  objc_destroyWeak((id *)(a1 + 8));
  JUMPOUT(0x1A6239270);
}

- (void)start
{
  if (!self->_animation)
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    v3 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "Starting VKPuckAnimator", buf, 2u);
    }

    id v4 = [(VKAnimation *)[VKTimedAnimation alloc] initWithPriority:1];
    animation = self->_animation;
    self->_animation = v4;

    [(VKAnimation *)self->_animation setRunsForever:1];
    [(VKPuckAnimatorTarget *)self->_target setAnimatingToCoordinate:1];
    uint64_t v6 = objc_alloc_init(VKRunningCurve);
    curve = self->_curve;
    self->_curve = v6;

    if (self->_lastLocationUpdate.__engaged_)
    {

      self->_lastLocationUpdate.__engaged_ = 0;
    }
    self->_lastProjectedPosition._e[0] = 0.0;
    self->_lastProjectedPosition._e[1] = 0.0;
    self->_lastProjectedPosition._e[2] = 0.0;
    self->_lastProjectedCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid;
    [(VKPuckAnimatorLocationProjector *)self->_locationProjector reset];
    *(void *)buf = 0;
    uint64_t v13 = buf;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__13504;
    uint64_t v16 = __Block_byref_object_dispose__13505;
    id v8 = self;
    uint64_t v17 = v8;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __23__VKPuckAnimator_start__block_invoke;
    v11[3] = &unk_1E5A8FFA8;
    v11[4] = buf;
    [(VKTimedAnimation *)self->_animation setStepHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __23__VKPuckAnimator_start__block_invoke_2;
    v10[3] = &unk_1E5A8FFD0;
    v10[4] = buf;
    [(VKAnimation *)self->_animation setCompletionHandler:v10];
    BOOL v9 = [(VKPuckAnimator *)v8 delegate];
    [v9 puckAnimator:v8 runAnimation:self->_animation];

    _Block_object_dispose(buf, 8);
  }
}

- (void)setTarget:(id)a3
{
  v5 = (VKPuckAnimatorTarget *)a3;
  target = self->_target;
  v7 = v5;
  if (target != v5)
  {
    [(VKPuckAnimatorTarget *)target setAnimatingToCoordinate:0];
    objc_storeStrong((id *)&self->_target, a3);
    [(VKPuckAnimatorTarget *)self->_target setAnimatingToCoordinate:self->_animation != 0];
  }
}

- (VKPuckAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKPuckAnimatorDelegate *)WeakRetained;
}

- (VKPuckAnimatorTarget)target
{
  return self->_target;
}

- (void)stop
{
  if (self->_animation)
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    v3 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "Stopping VKPuckAnimator", v7, 2u);
    }

    [(VKPuckAnimatorTarget *)self->_target setAnimatingToCoordinate:0];
    [(VKAnimation *)self->_animation stop];
    animation = self->_animation;
    self->_animation = 0;

    curve = self->_curve;
    self->_curve = 0;

    if (self->_lastLocationUpdate.__engaged_)
    {

      self->_lastLocationUpdate.__engaged_ = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained puckAnimatorDidStop:self];
  }
}

uint64_t __23__VKPuckAnimator_start__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _step];
}

- (void)_step
{
  double v3 = CACurrentMediaTime();
  curve = self->_curve;
  if (!curve) {
    return;
  }
  double v5 = v3 + -2.0 / self->_tracePlaybackSpeedMultiplier;
  [(VKRunningCurve *)curve stateAtTime:v5];
  if (!v26) {
    return;
  }
  if ((self->_behavior & 2) != 0)
  {
    [(VKPuckAnimatorLocationProjector *)self->_locationProjector projectedCourse];
    double v7 = v6;
    if (v34
      && [(VKPuckAnimatorLocationProjector *)self->_locationProjector projectedLocationOnRoute])
    {
      BOOL v8 = [(VKRunningCurve *)self->_curve courseValid];
      long double v9 = atan2(v33, v32);
      long double v10 = fmod(1.57079633 - v9, 6.28318531);
      double v11 = fmod(v10 + 6.28318531, 6.28318531);
      if (v8) {
        double vehicleHeading = v11 * 57.2957795;
      }
      else {
        [(VKPuckAnimatorLocationProjector *)self->_locationProjector projectedCourse];
      }
    }
    else
    {
      double vehicleHeading = self->_vehicleHeading;
      if (vehicleHeading == -1.0)
      {
        double vehicleHeading = v7;
        if (v7 < 0.0) {
          goto LABEL_13;
        }
      }
    }
    [(VKPuckAnimatorTarget *)self->_target setPresentationCourse:vehicleHeading];
  }
LABEL_13:
  if (self->_behavior)
  {
    long double v13 = exp(v28 * 6.28318531 + -3.14159265);
    double v14 = atan(v13);
    long double v15 = fmod(v27 * 6.28318531, 6.28318531);
    -[VKPuckAnimatorTarget setPresentationCoordinate:](self->_target, "setPresentationCoordinate:", v14 * 114.591559 + -90.0, (double)(fmod(v15 + 6.28318531, 6.28318531) * 57.2957795 + -180.0));
  }
  long double v16 = exp(v28 * 6.28318531 + -3.14159265);
  long double v17 = atan(v16) * 2.0 + -1.57079633;
  long double v18 = fmod(v27 * 6.28318531, 6.28318531);
  *(long double *)uint64_t v25 = v17;
  *(double *)&v25[1] = fmod(v18 + 6.28318531, 6.28318531) + -3.14159265;
  v25[2] = v29;
  if (v30 != *MEMORY[0x1E4F64198]
    || (uint64_t v19 = *MEMORY[0x1E4F64198],
        vabds_f32(*((float *)&v30 + 1), COERCE_FLOAT(HIDWORD(*MEMORY[0x1E4F64198]))) >= 0.00000011921))
  {
    uint64_t v20 = [(VKPuckAnimatorLocationProjector *)self->_locationProjector projectedRouteMatch];
    uint64_t v21 = [v20 route];
    uint64_t v19 = [v21 routeCoordinateForDistance:v30 beforeRouteCoordinate:v31 * 40075017.0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(VKPuckAnimatorTarget *)self->_target presentationCourse];
  double v24 = v23 * 0.0174532925;
  [WeakRetained puckAnimator:self updatedPosition:v25 course:&v24 polylineCoordinate:v19];

  if (![(VKRunningCurve *)self->_curve hasStateAtTime:v5])
  {
    [(VKPuckAnimator *)self pause];
    self->_suspended = 1;
  }
}

uint64_t __23__VKPuckAnimator_start__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stop];
}

- (id).cxx_construct
{
  self->_locationUpdateSubscriptions._backing.__begin_ = 0;
  self->_locationUpdateSubscriptions._backing.__end_ = 0;
  self->_locationUpdateSubscriptions._backing.__end_cap_.__value_ = 0;
  double v3 = ($BCDCA1B5D5EA5D1B5DA28C57EC36D08E *)MEMORY[0x1E4F63E90];
  self->_puckUpdatePointDeltaForAnimation._key = ($BCDCA1B5D5EA5D1B5DA28C57EC36D08E)*MEMORY[0x1E4F63E90];
  self->_puckUpdatePointDeltaForAnimation._listener = 0;
  id v4 = operator new(0x20uLL);
  v4[1] = 0;
  v4[2] = 0;
  *id v4 = &unk_1EF52E530;
  *((unsigned char *)v4 + 24) = 1;
  self->_puckUpdatePointDeltaForAnimation.var0.__ptr_ = v4 + 3;
  self->_puckUpdatePointDeltaForAnimation.var0.__cntrl_ = (__shared_weak_count *)v4;
  self->_puckUpdatePointDeltaForAnimation._delegate.__f_.__f_ = 0;
  self->_puckUpdateDistanceDeltaThreshold._key = *v3;
  self->_puckUpdateDistanceDeltaThreshold._listener = 0;
  double v5 = operator new(0x20uLL);
  v5[1] = 0;
  v5[2] = 0;
  void *v5 = &unk_1EF52E530;
  *((unsigned char *)v5 + 24) = 1;
  self->_puckUpdateDistanceDeltaThreshold.var0.__ptr_ = v5 + 3;
  self->_puckUpdateDistanceDeltaThreshold.var0.__cntrl_ = (__shared_weak_count *)v5;
  self->_puckUpdateDistanceDeltaThreshold._delegate.__f_.__f_ = 0;
  self->_lastLocationUpdate.var0.__null_state_ = 0;
  self->_lastLocationUpdate.__engaged_ = 0;
  return self;
}

- (void)setRouteOverlayCache:(const RouteOverlayCache *)a3
{
  self->_routeOverlayCache = a3;
}

- (void).cxx_destruct
{
  if (self->_lastLocationUpdate.__engaged_)
  {
  }
  md::Monitorable<md::ConfigValue<GEOConfigKeyDouble,double>>::~Monitorable((uint64_t)&self->_puckUpdateDistanceDeltaThreshold);
  md::Monitorable<md::ConfigValue<GEOConfigKeyDouble,double>>::~Monitorable((uint64_t)&self->_puckUpdatePointDeltaForAnimation);
  begin = (char *)self->_locationUpdateSubscriptions._backing.__begin_;
  if (begin)
  {
    end = (char *)self->_locationUpdateSubscriptions._backing.__end_;
    double v5 = self->_locationUpdateSubscriptions._backing.__begin_;
    if (end != begin)
    {
      double v6 = end - 32;
      double v7 = end - 32;
      do
      {
        long double v9 = (char *)*((void *)v7 + 3);
        if (v7 == v9)
        {
          (*(void (**)(char *))(*(void *)v7 + 32))(v7);
        }
        else if (v9)
        {
          (*(void (**)(char *))(*(void *)v9 + 40))(v9);
        }
        BOOL v8 = v7 - 8;
        v7 -= 40;
        v6 -= 40;
      }
      while (v8 != begin);
      double v5 = self->_locationUpdateSubscriptions._backing.__begin_;
    }
    self->_locationUpdateSubscriptions._backing.__end_ = begin;
    operator delete(v5);
  }
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_locationProjector, 0);
  objc_storeStrong((id *)&self->_curve, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

- (void)setBehavior:(unint64_t)a3
{
  self->_behavior = a3;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (void)setTracePlaybackSpeedMultiplier:(double)a3
{
  self->_tracePlaybackSpeedMultiplier = a3;
}

- (double)tracePlaybackSpeedMultiplier
{
  return self->_tracePlaybackSpeedMultiplier;
}

- (void)setLastProjectedPosition:()Matrix<double
{
  self->_lastProjectedPosition = a3;
}

- (Matrix<double,)lastProjectedPosition
{
  double v2 = self->_lastProjectedPosition._e[0];
  double v3 = self->_lastProjectedPosition._e[1];
  double v4 = self->_lastProjectedPosition._e[2];
  result._e[2] = v4;
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (id)detailedDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  double v4 = [(VKPuckAnimator *)self description];
  double v5 = (void *)[v3 initWithFormat:@"%@\n", v4];

  objc_msgSend(v5, "appendFormat:", @"_vehicleHeading: %f\n", *(void *)&self->_vehicleHeading);
  objc_msgSend(v5, "appendFormat:", @"_pausedCount: %ld\n", self->_pausedCount);
  if (self->_suspended) {
    double v6 = @"YES";
  }
  else {
    double v6 = @"NO";
  }
  [v5 appendFormat:@"_suspended: %@\n", v6];
  [v5 appendFormat:@"_lastProjectedPosition: %f, %f, %f\n", *(void *)&self->_lastProjectedPosition._e[0], *(void *)&self->_lastProjectedPosition._e[1], *(void *)&self->_lastProjectedPosition._e[2]];
  objc_msgSend(v5, "appendFormat:", @"_behavior: %lu\n", self->_behavior);
  double v7 = [(VKPuckAnimatorLocationProjector *)self->_locationProjector detailedDescription];
  [v5 appendFormat:@"_locationProjector:\n%@\n", v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v5 appendFormat:@"_delegate: %@\n", WeakRetained];

  [v5 appendFormat:@"_target: %@\n", self->_target];
  return v5;
}

- (void)updateLocation:(id)a3 routeMatch:(id)a4
{
}

- (void)resume
{
  int64_t pausedCount = self->_pausedCount;
  if (pausedCount)
  {
    int64_t v4 = pausedCount - 1;
    self->_int64_t pausedCount = v4;
    if (!v4)
    {
      if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
      }
      double v5 = (id)GEOGetVectorKitVKDefaultLog_log;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v6 = 0;
        _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "Resuming VKPuckAnimator", v6, 2u);
      }

      [(VKTimedAnimation *)self->_animation resume];
    }
  }
}

- (void)pause
{
  int64_t pausedCount = self->_pausedCount;
  if (!pausedCount)
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    int64_t v4 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_1A1780000, v4, OS_LOG_TYPE_INFO, "Pausing VKPuckAnimator", v5, 2u);
    }

    [(VKTimedAnimation *)self->_animation pause];
    int64_t pausedCount = self->_pausedCount;
  }
  self->_int64_t pausedCount = pausedCount + 1;
}

- (void)updatedPosition:(const void *)a3
{
  if (self->_behavior)
  {
    long double v5 = *(double *)a3 * 6.28318531;
    long double v6 = exp(*((double *)a3 + 1) * 6.28318531 + -3.14159265);
    double v7 = atan(v6);
    long double v8 = fmod(v5, 6.28318531);
    -[VKPuckAnimatorTarget setPresentationCoordinate:](self->_target, "setPresentationCoordinate:", v7 * 114.591559 + -90.0, (double)(fmod(v8 + 6.28318531, 6.28318531) * 57.2957795 + -180.0));
  }
  [(VKPuckAnimatorLocationProjector *)self->_locationProjector projectedCourse];
  -[VKPuckAnimatorTarget setPresentationCourse:](self->_target, "setPresentationCourse:");
  double v9 = *(double *)a3;
  double v10 = *((double *)a3 + 1);
  uint64_t v11 = *((void *)a3 + 2);
  long double v12 = v9 * 6.28318531;
  long double v13 = exp(v10 * 6.28318531 + -3.14159265);
  long double v14 = atan(v13) * 2.0 + -1.57079633;
  long double v15 = fmod(v12, 6.28318531);
  long double v19 = v14;
  double v20 = fmod(v15 + 6.28318531, 6.28318531) + -3.14159265;
  uint64_t v21 = v11;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(VKPuckAnimatorLocationProjector *)self->_locationProjector projectedCourse];
  objc_msgSend(WeakRetained, "puckAnimator:updatedPosition:course:polylineCoordinate:", self, &v19, &v18, -[VKPuckAnimatorLocationProjector projectedCoordinate](self->_locationProjector, "projectedCoordinate", v17 * 0.0174532925, *(void *)&v14, *(void *)&v20, v21));
}

- (void)unsubscribeFromLocationUpdates:(unint64_t)a3
{
  begin = (char *)self->_locationUpdateSubscriptions._backing.__begin_;
  end = (char *)self->_locationUpdateSubscriptions._backing.__end_;
  long double v6 = begin;
  if (begin != end)
  {
    long double v6 = (char *)self->_locationUpdateSubscriptions._backing.__begin_;
    while (*(void *)v6 != a3)
    {
      v6 += 40;
      if (v6 == end) {
        return;
      }
    }
  }
  if (v6 != end)
  {
    if (v6 + 40 != end)
    {
      uint64_t v7 = 8 * ((v6 - begin) >> 3);
      long double v8 = (char *)self->_locationUpdateSubscriptions._backing.__begin_;
      do
      {
        double v9 = &begin[v7];
        uint64_t v10 = *(void *)&begin[v7 + 32];
        *(void *)double v9 = *(void *)&begin[v7 + 40];
        uint64_t v11 = (uint64_t)&begin[v7 + 8];
        *((void *)v9 + 4) = 0;
        if (v11 == v10)
        {
          (*(void (**)(char *, SEL, unint64_t))(*(void *)v11 + 32))(&begin[v7 + 8], a2, a3);
        }
        else if (v10)
        {
          (*(void (**)(uint64_t, SEL, unint64_t))(*(void *)v10 + 40))(v10, a2, a3);
        }
        long double v12 = *(char **)&begin[v7 + 72];
        if (v12)
        {
          if (v9 + 48 == v12)
          {
            *((void *)v9 + 4) = v11;
            (*(void (**)(void *, char *, unint64_t))(*((void *)v9 + 6) + 24))((void *)v9 + 6, &begin[v7 + 8], a3);
          }
          else
          {
            *((void *)v9 + 4) = v12;
            *(void *)&begin[v7 + 72] = 0;
          }
        }
        else
        {
          *((void *)v9 + 4) = 0;
        }
        begin += 40;
        v8 += 40;
        long double v6 = &begin[v7];
      }
      while (&begin[v7 + 40] != end);
      end = (char *)self->_locationUpdateSubscriptions._backing.__end_;
    }
    if (end != v6)
    {
      long double v13 = end - 32;
      long double v14 = v13;
      do
      {
        long double v16 = (char *)*((void *)v14 + 3);
        if (v14 == v16)
        {
          (*(void (**)(char *))(*(void *)v14 + 32))(v14);
        }
        else if (v16)
        {
          (*(void (**)(char *, SEL, unint64_t))(*(void *)v16 + 40))(v16, a2, a3);
        }
        long double v15 = v14 - 8;
        v14 -= 40;
        v13 -= 40;
      }
      while (v15 != v6);
    }
    self->_locationUpdateSubscriptions._backing.__end_ = v6;
  }
}

- (unint64_t)subscribeToLocationUpdates:(function<void (VKPuckAnimator *)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = -[VKPuckAnimator subscribeToLocationUpdates:]::subscriptionKey++;
  begin = (char *)self->_locationUpdateSubscriptions._backing.__begin_;
  end = (char *)self->_locationUpdateSubscriptions._backing.__end_;
  long double v8 = begin;
  if (begin != end)
  {
    long double v8 = (char *)self->_locationUpdateSubscriptions._backing.__begin_;
    while (v5 != *(void *)v8)
    {
      v8 += 40;
      if (v8 == end) {
        goto LABEL_7;
      }
    }
  }
  if (v8 != end)
  {
LABEL_47:
    var1 = (function<void (VKPuckAnimator *, CLLocation *, GEORouteMatch *, NSUUID *)> *)a3->var0.var1;
    if (var1) {
      goto LABEL_48;
    }
LABEL_52:
    double v35 = 0;
    goto LABEL_53;
  }
LABEL_7:
  long double v32 = 0;
  unint64_t v33 = v5;
  long double v8 = begin;
  id v36 = 0;
  if (begin != end)
  {
    long double v8 = begin;
    while (v5 != *(void *)v8)
    {
      v8 += 40;
      if (v8 == end) {
        goto LABEL_13;
      }
    }
  }
  if (v8 == end)
  {
LABEL_13:
    double value = (char *)self->_locationUpdateSubscriptions._backing.__end_cap_.__value_;
    if (end >= value)
    {
      unint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * ((end - begin) >> 3) + 1;
      if (v10 > 0x666666666666666) {
        abort();
      }
      unint64_t v11 = 0xCCCCCCCCCCCCCCCDLL * ((value - begin) >> 3);
      if (2 * v11 > v10) {
        unint64_t v10 = 2 * v11;
      }
      if (v11 >= 0x333333333333333) {
        unint64_t v12 = 0x666666666666666;
      }
      else {
        unint64_t v12 = v10;
      }
      if (v12 > 0x666666666666666) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      long double v13 = (char *)operator new(40 * v12);
      long double v8 = &v13[8 * ((end - begin) >> 3)];
      long double v14 = &v13[40 * v12];
      *(void *)long double v8 = v5;
      *((void *)v8 + 4) = 0;
      long double v15 = v8 + 40;
      if (begin == end)
      {
        self->_locationUpdateSubscriptions._backing.__begin_ = v8;
        self->_locationUpdateSubscriptions._backing.__end_ = v15;
        self->_locationUpdateSubscriptions._backing.__end_cap_.__value_ = v14;
      }
      else
      {
        uint64_t v16 = 0;
        do
        {
          double v17 = &v8[v16];
          uint64_t v18 = &end[v16];
          *(void *)&v8[v16 - 40] = *(void *)&end[v16 - 40];
          long double v19 = *(char **)&end[v16 - 8];
          if (v19)
          {
            if (v18 - 32 == v19)
            {
              *((void *)v17 - 1) = v17 - 32;
              (*(void (**)(char *))(*(void *)v19 + 24))(v19);
            }
            else
            {
              *((void *)v17 - 1) = v19;
              *((void *)v18 - 1) = 0;
            }
          }
          else
          {
            *((void *)v17 - 1) = 0;
          }
          v16 -= 40;
        }
        while (&end[v16] != begin);
        begin = (char *)self->_locationUpdateSubscriptions._backing.__begin_;
        double v20 = (char *)self->_locationUpdateSubscriptions._backing.__end_;
        self->_locationUpdateSubscriptions._backing.__begin_ = &v8[v16];
        self->_locationUpdateSubscriptions._backing.__end_ = v15;
        self->_locationUpdateSubscriptions._backing.__end_cap_.__value_ = v14;
        if (v20 != begin)
        {
          uint64_t v21 = v20 - 32;
          id v22 = v20 - 32;
          do
          {
            double v24 = (char *)*((void *)v22 + 3);
            if (v22 == v24)
            {
              (*(void (**)(char *))(*(void *)v22 + 32))(v22);
            }
            else if (v24)
            {
              (*(void (**)(char *))(*(void *)v24 + 40))(v24);
            }
            double v23 = v22 - 8;
            v22 -= 40;
            v21 -= 40;
          }
          while (v23 != begin);
        }
      }
      if (begin) {
        operator delete(begin);
      }
      uint64_t v25 = v36;
      self->_locationUpdateSubscriptions._backing.__end_ = v15;
      if (v25 == v34)
      {
        (*(void (**)(void *))(v34[0] + 32))(v34);
      }
      else if (v25)
      {
        (*(void (**)(void *))(*v25 + 40))(v25);
      }
    }
    else
    {
      *(void *)end = v5;
      *((void *)end + 4) = 0;
      self->_locationUpdateSubscriptions._backing.__end_ = end + 40;
      long double v8 = end;
    }
  }
  if (v32 != v31)
  {
    if (v32) {
      (*(void (**)(void))(*v32 + 40))();
    }
    goto LABEL_47;
  }
  (*(void (**)(void *, SEL))(v31[0] + 32))(v31, a2);
  var1 = (function<void (VKPuckAnimator *, CLLocation *, GEORouteMatch *, NSUUID *)> *)a3->var0.var1;
  if (!var1) {
    goto LABEL_52;
  }
LABEL_48:
  if (var1 == a3)
  {
    double v35 = &v33;
    (*(void (**)(function<void (VKPuckAnimator *, CLLocation *, GEORouteMatch *, NSUUID *)> *, unint64_t *))(*(void *)a3->var0.var0.__lx + 24))(a3, &v33);
  }
  else
  {
    double v35 = (unint64_t *)(*(uint64_t (**)(function<void (VKPuckAnimator *, CLLocation *, GEORouteMatch *, NSUUID *)> *, SEL))(*(void *)var1->var0.var0.__lx + 16))(var1, a2);
  }
LABEL_53:
  double v27 = v8 + 8;
  if (v8 + 8 != (char *)&v33)
  {
    double v28 = v35;
    uint64_t v29 = (void *)*((void *)v8 + 4);
    if (v35 == &v33)
    {
      if (v29 == v27)
      {
        (*(void (**)(unint64_t *, void *))(v33 + 24))(&v33, v31);
        (*(void (**)(unint64_t *))(*v35 + 32))(v35);
        double v35 = 0;
        (*(void (**)(void, unint64_t *))(**((void **)v8 + 4) + 24))(*((void *)v8 + 4), &v33);
        (*(void (**)(void))(**((void **)v8 + 4) + 32))(*((void *)v8 + 4));
        *((void *)v8 + 4) = 0;
        double v35 = &v33;
        (*(void (**)(void *, void *))(v31[0] + 24))(v31, (void *)v8 + 1);
        (*(void (**)(void *))(v31[0] + 32))(v31);
      }
      else
      {
        (*(void (**)(unint64_t *, void *))(v33 + 24))(&v33, (void *)v8 + 1);
        (*(void (**)(unint64_t *))(*v35 + 32))(v35);
        double v35 = (unint64_t *)*((void *)v8 + 4);
      }
      *((void *)v8 + 4) = v27;
    }
    else if (v29 == v27)
    {
      (*(void (**)(void *, unint64_t *))(*((void *)v8 + 1) + 24))((void *)v8 + 1, &v33);
      (*(void (**)(void))(**((void **)v8 + 4) + 32))(*((void *)v8 + 4));
      *((void *)v8 + 4) = v35;
      double v35 = &v33;
    }
    else
    {
      double v35 = (unint64_t *)*((void *)v8 + 4);
      *((void *)v8 + 4) = v28;
    }
  }
  if (v35 == &v33)
  {
    (*(void (**)(unint64_t *))(v33 + 32))(&v33);
  }
  else if (v35)
  {
    (*(void (**)(void))(*v35 + 40))();
  }
  return v5;
}

- (BOOL)alwaysUseGoodRouteMatch
{
  return [(VKPuckAnimatorLocationProjector *)self->_locationProjector alwaysUseGoodRouteMatch];
}

- (void)setAlwaysUseGoodRouteMatch:(BOOL)a3
{
}

- (void)dealloc
{
  VKLockScreenLog(@"Destroying VKPuckAnimator %p", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self);
  [(VKPuckAnimator *)self stop];
  v9.receiver = self;
  v9.super_class = (Class)VKPuckAnimator;
  [(VKPuckAnimator *)&v9 dealloc];
}

- (id)initWithCallbackQueue:
{
  v1 = (id *)(a1 + 8);
  uint64_t v2 = (id *)operator new(0x10uLL);
  *uint64_t v2 = &unk_1EF56C4C8;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (uint64_t)initWithCallbackQueue:
{
  return a1;
}

@end