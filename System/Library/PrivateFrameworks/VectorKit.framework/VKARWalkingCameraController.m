@interface VKARWalkingCameraController
- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate;
- (BOOL)usesVKCamera;
- (VKARWalkingCameraController)initWithTaskContext:(shared_ptr<md:(void *)a4 :(AnimationRunner *)a5 TaskContext>)a3 mapDataAccess:(RunLoopController *)a6 animationRunner:(id)a7 runLoopController:(void *)a8 cameraDelegate:(void *)a9 arLogic:elevationLogic:;
- (double)altitude;
- (double)currentZoomLevel;
- (double)distanceFromCenterCoordinate;
- (double)heading;
- (double)maxPitch;
- (double)maximumZoomLevel;
- (double)minPitch;
- (double)minimumZoomLevel;
- (double)pitch;
- (double)topDownMinimumZoomLevel;
- (id).cxx_construct;
- (id)_buildDebugString:(void *)a3;
- (void)_locationProvider;
- (void)_updateClipPlanes;
- (void)_updateDebugOverlay:(void *)a3;
- (void)pushGesture:(void *)a3;
- (void)setAltitude:(double)a3;
- (void)setCamera:(shared_ptr<gdc::Camera>)a3;
- (void)setCenterCoordinate:(id)a3;
- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10;
- (void)setDistanceFromCenterCoordinate:(double)a3;
- (void)setHeading:(double)a3;
- (void)setPitch:(double)a3;
- (void)setVkCamera:(id)a3;
- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4;
@end

@implementation VKARWalkingCameraController

- (VKARWalkingCameraController)initWithTaskContext:(shared_ptr<md:(void *)a4 :(AnimationRunner *)a5 TaskContext>)a3 mapDataAccess:(RunLoopController *)a6 animationRunner:(id)a7 runLoopController:(void *)a8 cameraDelegate:(void *)a9 arLogic:elevationLogic:
{
  cntrl = a3.__cntrl_;
  ptr = (id **)a3.__ptr_;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)VKARWalkingCameraController;
  v16 = [(VKScreenCameraController *)&v24 initWithMapDataAccess:cntrl animationRunner:a4 runLoopController:a5 cameraDelegate:v15];
  v17 = v16;
  if (v16)
  {
    v16->_arLogic = a7;
    v16->_elevationLogic = a8;
    v16->_rotationCorrectionQuaternion._imaginary._e[0] = 0.707106781;
    v16->_rotationCorrectionQuaternion._imaginary._e[1] = 0.0;
    v16->_rotationCorrectionQuaternion._imaginary._e[2] = 0.0;
    v16->_rotationCorrectionQuaternion._scalar = 0.707106781;
    v16->_heading._value = 0.0;
    v18 = [[VKARWalkingDebugGestureCameraBehavior alloc] initWithCameraController:v16];
    gestureCameraControllerBehavior = v17->super._gestureCameraControllerBehavior;
    v17->super._gestureCameraControllerBehavior = &v18->super;

    v17->_maxClipDistance._key = ($BCDCA1B5D5EA5D1B5DA28C57EC36D08E)VectorKitConfig_ARLabelMaxClipDistance;
    if (*(void *)&v17->_maxClipDistance._key.key.identifier && v17->_maxClipDistance._key.key.metadata)
    {
      GEOConfigGetDouble();
      v17->_maxClipDistance._value = v20;
    }
    id v21 = **ptr;
    v26 = 0;
    md::Monitorable<md::ConfigValue<GEOConfigKeyDouble,double>>::setCallbackQueue(&v17->_maxClipDistance._key.key.identifier, v21, v25);
    if (v26 == v25)
    {
      (*(void (**)(void *))(v25[0] + 32))(v25);
    }
    else if (v26)
    {
      (*(void (**)(void))(*v26 + 40))();
    }

    v22 = v17;
  }

  return v17;
}

- (id).cxx_construct
{
  self->_rotationCorrectionQuaternion._imaginary._e[0] = 0.0;
  self->_rotationCorrectionQuaternion._imaginary._e[1] = 0.0;
  self->_rotationCorrectionQuaternion._imaginary._e[2] = 0.0;
  self->_rotationCorrectionQuaternion._scalar = 1.0;
  self->_coordinate.longitude._value = 0.0;
  self->_coordinate.altitude._value = 0.0;
  self->_coordinate.latitude._value = 0.0;
  self->_eulerAngles.yaw._value = 0.0;
  self->_eulerAngles.roll._value = 0.0;
  self->_eulerAngles.pitch._value = 0.0;
  self->_gestures.__end_ = 0;
  self->_gestures.__end_cap_.__value_ = 0;
  self->_gestures.__begin_ = 0;
  p_maxClipDistance = &self->_maxClipDistance;
  self->_maxClipDistance._key = ($BCDCA1B5D5EA5D1B5DA28C57EC36D08E)*MEMORY[0x1E4F63E90];
  self->_maxClipDistance._listener = 0;
  v4 = operator new(0x20uLL);
  v4[1] = 0;
  v4[2] = 0;
  void *v4 = &unk_1EF52E530;
  p_maxClipDistance->var0.__cntrl_ = (__shared_weak_count *)v4;
  *((unsigned char *)v4 + 24) = 1;
  p_maxClipDistance->var0.__ptr_ = v4 + 3;
  p_maxClipDistance->_delegate.__f_.__f_ = 0;
  return self;
}

- (void).cxx_destruct
{
  md::Monitorable<md::ConfigValue<GEOConfigKeyDouble,double>>::~Monitorable((uint64_t)&self->_maxClipDistance);
  begin = self->_gestures.__begin_;
  if (begin)
  {
    self->_gestures.__end_ = begin;
    operator delete(begin);
  }
}

- (double)maxPitch
{
  return 0.0;
}

- (double)minPitch
{
  return 0.0;
}

- (double)topDownMinimumZoomLevel
{
  return 21.0;
}

- (double)currentZoomLevel
{
  return 21.0;
}

- (double)maximumZoomLevel
{
  return 21.0;
}

- (double)minimumZoomLevel
{
  return 1.0;
}

- (BOOL)usesVKCamera
{
  return 0;
}

- (double)pitch
{
  [(VKCameraController *)self camera];
  double v2 = *(double *)(v4 + 40);
  if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v5->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v5);
  }
  return v2 * 57.2957795;
}

- (void)setPitch:(double)a3
{
  [(VKCameraController *)self camera];
  *(double *)(v4 + 40) = a3 * 0.0174532925;
  if (v5)
  {
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v5->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

- (double)heading
{
  [(VKCameraController *)self camera];
  double v2 = *(double *)(v4 + 48);
  if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v5->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v5);
  }
  return v2 * 57.2957795;
}

- (void)setHeading:(double)a3
{
  [(VKCameraController *)self camera];
  *(double *)(v4 + 48) = a3 * 0.0174532925;
  if (v5)
  {
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v5->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

- (void)setAltitude:(double)a3
{
  [(VKCameraController *)self camera];
  [(VKCameraController *)self camera];
  *(long double *)(v7 + 32) = cos(*(long double *)(v5 + 40)) * a3;
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v6->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v6);
  }
  if (v8)
  {
    if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

- (double)altitude
{
  return 0.0;
}

- (double)distanceFromCenterCoordinate
{
  [(VKCameraController *)self camera];
  double v2 = *(double *)(v4 + 32);
  if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v5->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v5);
  }
  return v2;
}

- (void)setDistanceFromCenterCoordinate:(double)a3
{
  [(VKCameraController *)self camera];
  *(double *)(v4 + 32) = a3;
  if (v5)
  {
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v5->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  [(VKCameraController *)self camera];
  double v3 = *(double *)(v9 + 8);
  [(VKCameraController *)self camera];
  double v4 = *(double *)(v7 + 16);
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v8->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v8);
  }
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v10->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v10);
  }
  double v5 = v3 * 57.2957795;
  double v6 = v4 * 57.2957795;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (void)setCenterCoordinate:(id)a3
{
  double v3 = a3.var0 * 0.0174532925;
  double v4 = a3.var1 * 0.0174532925;
  [(VKCameraController *)self camera];
  *(double *)(v5 + 8) = v3;
  *(double *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = 0;
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v6->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  double v3 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v6 = *(void *)a3.__ptr_;
  uint64_t v7 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v5.receiver = self;
  v5.super_class = (Class)VKARWalkingCameraController;
  -[VKScreenCameraController setCamera:](&v5, sel_setCamera_, &v6, a3.__cntrl_);
  double v4 = v7;
  if (v7)
  {
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

- (void)setVkCamera:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VKARWalkingCameraController;
  [(VKScreenCameraController *)&v3 setVkCamera:a3];
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  -[VKARWalkingCameraController setCenterCoordinate:](self, "setCenterCoordinate:", a8, a9, a10, a3.var0, a3.var1, a4, a5, a6, a7);
  [(VKARWalkingCameraController *)self setAltitude:a4];
  [(VKARWalkingCameraController *)self setHeading:a5];
  [(VKARWalkingCameraController *)self setPitch:a6];
}

- (void)_updateDebugOverlay:(void *)a3
{
  if (*(void *)a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v4 = (ggl::DebugConsole *)[*(id *)a3 debugConsoleForId:7];
    if (v4) {
      ggl::DebugConsole::begin(v4);
    }
  }
}

- (id)_buildDebugString:(void *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v5 = *((id *)self->_arLogic + 20);
  uint64_t v6 = v5;
  uint64_t v7 = "N3geo11_retain_ptrIP9CGContextNS_10_retain_cfIS2_EENS_11_release_cfENS_8_hash_cfENS_9_equal_cfEEE" + 62;
  if (v5)
  {
    v8 = [v5 currentFrame];
    v39 = self;
    [v8 camera];
    v43 = &unk_1EF559ED8;
    id v44 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v9 = [v6 currentFrame];
    v10 = [v9 camera];
    v11 = +[MDARSession stringWithARTrackingState:](MDARSession, "stringWithARTrackingState:", [v10 trackingState]);
    v12 = [v6 currentFrame];
    v13 = [v12 camera];
    v14 = +[MDARSession stringWithARTrackingStateReason:](MDARSession, "stringWithARTrackingStateReason:", [v13 trackingStateReason]);
    [v4 appendFormat:@"tracking_state:\n\tstate:%@\n\treason:%@\n", v11, v14];

    v40 = [v6 currentFrame];
    v15 = [v40 geoTrackingStatus];
    v16 = +[MDARSession stringWithARGeoTrackingState:](MDARSession, "stringWithARGeoTrackingState:", [v15 state]);
    v17 = [v6 currentFrame];
    v18 = [v17 geoTrackingStatus];
    v19 = +[MDARSession stringWithARGeoTrackingStateReason:](MDARSession, "stringWithARGeoTrackingStateReason:", [v18 stateReason]);
    double v20 = [v6 currentFrame];
    id v21 = [v20 geoTrackingStatus];
    v22 = +[MDARSession stringWithARGeoTrackingAccuracy:](MDARSession, "stringWithARGeoTrackingAccuracy:", [v21 accuracy]);
    [v4 appendFormat:@"geo_tracking_status:\n\tstate:%@\n\treason:%@\n\taccuracy:%@\n", v16, v19, v22];

    v23 = [v6 currentFrame];
    [v23 heading];
    [v4 appendFormat:@"heading: %.2f\n", v24];

    v25 = [v6 currentFrame];
    [v25 rawHeading];
    [v4 appendFormat:@"raw_heading: %.2f\n", v26];

    uint64_t v27 = [v6 currentFrame];
    v28 = [v27 location];
    v29 = [v6 currentFrame];
    if (v28) {
      [v29 location];
    }
    else {
    v30 = [v29 rawLocation];
    }

    [v30 altitude];
    [v4 appendFormat:@"cl_altitude: %.2f\n", v31];
    [v44 eulerAngles];
    float v41 = v32;
    [v44 eulerAngles];
    float v38 = v33;
    [v44 eulerAngles];
    [v4 appendFormat:@"arCamera:\n\tpitch(x):%.2f\n\troll(y):%.f\n\tyaw(z):%.2f\n", v41 * 57.2957795, v38 * 57.2957795, v34 * 57.2957795];
    md::MDARCamera::widestFieldOfView((md::MDARCamera *)&v42, (uint64_t)&v43);
    objc_msgSend(v4, "appendFormat:", @"widestFieldOfView:%f\n", v42);

    v43 = &unk_1EF559ED8;
    self = v39;
    uint64_t v7 = "se_cfENS_8_hash_cfENS_9_equal_cfEEE";
  }
  objc_msgSend(v4, "appendFormat:", @"ar_coordinate: %.8f,%.8f,%.8f\n", *(void *)&self->_coordinate.latitude._value, *(void *)&self->_coordinate.longitude._value, *(void *)&self->_coordinate.altitude._value);
  v35 = +[VKDebugSettings sharedSettings];
  [v35 arCameraElevationOffset];
  objc_msgSend(v4, "appendFormat:", @"debug_altitude_offset: %.8f\n", v36);

  [v4 appendFormat:@"pitch:%.2f\nroll:%.f\nyaw:%.2f\n", self->_eulerAngles.pitch._value * *((double *)v7 + 190), self->_eulerAngles.roll._value * *((double *)v7 + 190), self->_eulerAngles.yaw._value * *((double *)v7 + 190)];
  return v4;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  elevationLogic = self->_elevationLogic;
  if (elevationLogic) {
    elevationLogic[72] = 0;
  }
  id v7 = *((id *)self->_arLogic + 20);
  v8 = v7;
  if (v7) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = *((unsigned char *)self->_arLogic + 257) == 0;
  }
  if (v9) {
    goto LABEL_28;
  }
  if (v7)
  {
    v10 = [v7 currentFrame];
    v11 = v10;
    if (v10)
    {
      v12 = [v10 camera];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  v13 = [(VKARWalkingCameraController *)self _locationProvider];
  v14 = v13;
  if (v13)
  {
    (*(void (**)(void *, void *, void *, Quaternion<double> *, vector<std::variant<md::ARCameraPanEvent, md::ARCameraRotateEvent>, std::allocator<std::variant<md::ARCameraPanEvent, md::ARCameraRotateEvent>>> *))(*(void *)v13 + 16))(v13, a4, v11, &self->_rotationCorrectionQuaternion, &self->_gestures);
    uint64_t v15 = (*(uint64_t (**)(void *))(*(void *)v14 + 24))(v14);
    double v16 = *(double *)(v15 + 16);
    *(_OWORD *)&self->_coordinate.latitude._double value = *(_OWORD *)v15;
    self->_coordinate.altitude._double value = v16;
    if (v12)
    {
LABEL_14:
      [v11 camera];
      v54 = &unk_1EF559ED8;
      v55 = (atomic_ullong *)(id)objc_claimAutoreleasedReturnValue();

      unint64_t v17 = *((void *)self->_arLogic + 22) - 1;
      double v18 = 0.0;
      if (v17 <= 2) {
        double v18 = dbl_1A29C65C8[v17];
      }
      [(atomic_ullong *)v55 eulerAngles];
      self->_eulerAngles.roll._double value = v18 + v19;
      [(atomic_ullong *)v55 eulerAngles];
      self->_eulerAngles.pitch._double value = v20 + 1.57079633;
      [(atomic_ullong *)v55 eulerAngles];
      self->_eulerAngles.yaw._double value = v21;
      [(VKCameraController *)self camera];
      double v22 = v52[1];
      md::MDARCamera::widestFieldOfView((md::MDARCamera *)v52, (uint64_t)&v54);
      *(double *)(*(void *)&v22 + 456) = v52[0] * 0.0174532925;
      v23 = v53;
      if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
      v54 = &unk_1EF559ED8;

      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v48 = md::LayoutContext::frameState((md::LayoutContext *)a4);
    double v49 = *(double *)(v48 + 72);
    *(float64x2_t *)&self->_coordinate.latitude._double value = vmulq_f64(*(float64x2_t *)(v48 + 56), (float64x2_t)vdupq_n_s64(0x404CA5DC1A63C1F8uLL));
    self->_coordinate.altitude._double value = v49;
    if (v12) {
      goto LABEL_14;
    }
  }
  self->_eulerAngles.yaw._double value = 0.0;
  self->_eulerAngles.roll._double value = 0.0;
  self->_eulerAngles.pitch._double value = 0.0;
  [(VKCameraController *)self camera];
  v50 = (std::__shared_weak_count *)v55;
  v54[57] = 0x3FF0C152382D7365;
  if (v50 && !atomic_fetch_add(&v50->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
    std::__shared_weak_count::__release_weak(v50);
  }
LABEL_20:
  if (!v14 || !*(unsigned char *)((*(uint64_t (**)(void *))(*(void *)v14 + 32))(v14) + 8)) {
    goto LABEL_24;
  }
  uint64_t v24 = (*(uint64_t (**)(void *))(*(void *)v14 + 32))(v14);
  if (*(unsigned char *)(v24 + 8))
  {
    self->_eulerAngles.yaw._double value = *(double *)v24 * 0.0174532925;
LABEL_24:
    double value = self->_coordinate.latitude._value;
    double v25 = self->_coordinate.longitude._value;
    double v27 = self->_coordinate.altitude._value;
    v28 = +[VKDebugSettings sharedSettings];
    [v28 arCameraElevationOffset];
    float v30 = v29;

    double v31 = self->_eulerAngles.roll._value;
    long long v51 = *(_OWORD *)&self->_eulerAngles.pitch._value;
    [(VKCameraController *)self camera];
    double v32 = v27 + v30;
    __double2 v33 = __sincos_stret(value * 0.0174532925);
    double v34 = 6378137.0 / sqrt(1.0 - v33.__sinval * v33.__sinval * 0.00669437999);
    double v35 = (v32 + v34) * v33.__cosval;
    __double2 v36 = __sincos_stret(v25 * 0.0174532925);
    long double v37 = v35 * v36.__sinval;
    long double v38 = v35 * v36.__cosval;
    double v39 = sqrt(v38 * v38 + v37 * v37);
    long double v40 = (v32 + v34 * 0.99330562) * v33.__sinval;
    double v41 = atan2(v40, v39 * 0.996647189);
    __double2 v42 = __sincos_stret(v41);
    double v43 = atan2(v40 + v42.__sinval * v42.__sinval * 42841.3115 * v42.__sinval, v39 + v42.__cosval * v42.__cosval * -42697.6727 * v42.__cosval);
    __double2 v44 = __sincos_stret(v43);
    long double v45 = atan2(v37, v38);
    v46 = v54;
    *((double *)v54 + 1) = v43;
    *((long double *)v46 + 2) = v45;
    *((double *)v46 + 3) = v39 / v44.__cosval - 6378137.0 / sqrt(1.0 - v44.__sinval * v44.__sinval * 0.00669437999);
    v46[4] = 0;
    *(_OWORD *)(v46 + 5) = v51;
    *((double *)v46 + 7) = v31;
    v47 = (std::__shared_weak_count *)v55;
    if (v55)
    {
      if (!atomic_fetch_add(v55 + 1, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
        std::__shared_weak_count::__release_weak(v47);
      }
    }
    [(VKARWalkingCameraController *)self _updateClipPlanes];
    [(VKARWalkingCameraController *)self _updateDebugOverlay:a4];
    self->_gestures.__end_ = self->_gestures.__begin_;

LABEL_28:
    return;
  }
  std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
}

- (void)_updateClipPlanes
{
  [(VKCameraController *)self camera];
  double v3 = self->_maxClipDistance._value + 10.0;
  *(void *)(v4 + 464) = 0x3FB999999999999ALL;
  *(double *)(v4 + 472) = v3;
  if (v5)
  {
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v5->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

- (void)_locationProvider
{
  return (void *)*((void *)self->_arLogic + 33);
}

- (void)pushGesture:(void *)a3
{
  p_gestures = &self->_gestures;
  end = (char *)self->_gestures.__end_;
  double value = (char *)self->_gestures.__end_cap_.__value_;
  if (end >= value)
  {
    begin = (char *)p_gestures->__begin_;
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)p_gestures->__begin_) >> 3);
    unint64_t v11 = v10 + 1;
    if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x555555555555555) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      if (v13 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      v14 = (char *)operator new(24 * v13);
    }
    else
    {
      v14 = 0;
    }
    uint64_t v15 = &v14[24 * v10];
    char *v15 = 0;
    *((_DWORD *)v15 + 4) = -1;
    uint64_t v16 = *((unsigned int *)a3 + 4);
    if (v16 != -1)
    {
      ((void (*)(char *, char *, void *))off_1EF591168[v16])(&v21, v15, a3);
      *((_DWORD *)v15 + 4) = v16;
      begin = (char *)p_gestures->__begin_;
      end = (char *)p_gestures->__end_;
    }
    if (end == begin)
    {
      float v19 = v15;
    }
    else
    {
      uint64_t v17 = 0;
      do
      {
        v15[v17 - 24] = 0;
        *(_DWORD *)&v15[v17 - 8] = -1;
        uint64_t v18 = *(unsigned int *)&end[v17 - 8];
        if (v18 != -1)
        {
          ((void (*)(char *, char *, char *))off_1EF591168[v18])(&v22, &v15[v17 - 24], &end[v17 - 24]);
          *(_DWORD *)&v15[v17 - 8] = v18;
        }
        v17 -= 24;
      }
      while (&end[v17] != begin);
      float v19 = &v15[v17];
      begin = (char *)p_gestures->__begin_;
    }
    v8 = v15 + 24;
    p_gestures->__begin_ = v19;
    p_gestures->__end_ = v15 + 24;
    p_gestures->__end_cap_.__value_ = &v14[24 * v13];
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    char *end = 0;
    *((_DWORD *)end + 4) = -1;
    uint64_t v7 = *((unsigned int *)a3 + 4);
    if (v7 != -1)
    {
      ((void (*)(char *, char *, void *))off_1EF591168[v7])(&v20, end, a3);
      *((_DWORD *)end + 4) = v7;
    }
    v8 = end + 24;
    p_gestures->__end_ = v8;
  }
  p_gestures->__end_ = v8;
}

@end