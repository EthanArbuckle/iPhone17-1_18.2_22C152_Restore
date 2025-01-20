@interface VKARCameraController
- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate;
- (BOOL)isFullyPitched;
- (BOOL)isPitched;
- (BOOL)overrideARFieldOfView;
- (CameraFrame<geo::Radians,)cameraFrame;
- (Geocentric<double>)cameraPosition;
- (Matrix<double,)_intersectAndResolveWorldCollision:(const void *)a3;
- (RigidTransform<double,)_transformFromARCamera:(VKARCameraController *)self;
- (RigidTransform<double,)arCameraTransform;
- (RigidTransform<double,)offsetTransform;
- (Unit<geo::DegreeUnitDescription,)fieldOfView;
- (VKARCameraController)initWithTaskContext:(shared_ptr<md:(MapDataAccess *)a4 :(AnimationRunner *)a5 TaskContext>)a3 mapDataAccess:(RunLoopController *)a6 animationRunner:(id)a7 runLoopController:cameraDelegate:;
- (double)_fovAdjustment;
- (double)altitude;
- (double)currentZoomLevel;
- (double)distanceFromCenterCoordinate;
- (double)heading;
- (double)maxPitch;
- (double)maximumZoomLevel;
- (double)minPitch;
- (double)minimumZoomLevel;
- (double)pitch;
- (float)heightScale;
- (id).cxx_construct;
- (id)mapRegion;
- (int64_t)tileSize;
- (void)_setupPounceAnimation:(const void *)a3 duration:(double)a4 completion:(id)a5;
- (void)_updateARContext;
- (void)_updateBaseTransform;
- (void)arSessionWasInterrupted:(unint64_t)a3;
- (void)dealloc;
- (void)globeView;
- (void)mapEngine;
- (void)setCamera:(shared_ptr<gdc::Camera>)a3;
- (void)setCurrentZoomLevel:(double)a3;
- (void)setFieldOfView:()Unit<geo:(double>)a3 :DegreeUnitDescription;
- (void)setGlobeView:(void *)a3;
- (void)setMapEngine:(void *)a3;
- (void)setMaxZoomLevel:(double)a3;
- (void)setOffsetTransform:()RigidTransform<double;
- (void)setOverrideARFieldOfView:(BOOL)a3;
- (void)trasitionToARModeAtCoordinate:(id)a3 withDuration:(double)a4 completion:(id)a5;
- (void)trasitionToARModeFromCameraFrame:(const void *)a3 withDuration:(double)a4 completion:(id)a5;
- (void)updateCameraFrameFromARTransform;
- (void)updateGlobeFromCamera;
- (void)updateWithARSession:(id)a3;
- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4;
@end

@implementation VKARCameraController

- (id).cxx_construct
{
  *((void *)self + 34) = 0;
  *((void *)self + 35) = 0;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *((void *)self + 49) = 0x3FF0000000000000;
  *((int64x2_t *)self + 25) = vdupq_n_s64(0xC00921FB54442D18);
  *((_OWORD *)self + 26) = 0u;
  *((_OWORD *)self + 27) = 0u;
  *((void *)self + 56) = 0;
  *(_OWORD *)((char *)self + 456) = 0u;
  *(_OWORD *)((char *)self + 472) = 0u;
  *(_OWORD *)((char *)self + 488) = 0u;
  *((void *)self + 63) = 0x3FF0000000000000;
  *((_OWORD *)self + 32) = 0u;
  *((_OWORD *)self + 33) = 0u;
  *((_OWORD *)self + 34) = 0u;
  *((void *)self + 70) = 0x3FF0000000000000;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *(_OWORD *)((char *)self + 600) = 0u;
  *((void *)self + 77) = 0x3FF0000000000000;
  *((_OWORD *)self + 39) = 0u;
  *((_OWORD *)self + 40) = 0u;
  *((_OWORD *)self + 41) = 0u;
  *((void *)self + 84) = 0x3FF0000000000000;
  *((void *)self + 85) = 0;
  *((void *)self + 86) = 0;
  *((void *)self + 87) = 0;
  *((void *)self + 88) = 0x3FF0000000000000;
  *((void *)self + 91) = 0;
  *((void *)self + 92) = 0;
  *((void *)self + 93) = 0;
  *((void *)self + 94) = 0x3FF0000000000000;
  *((void *)self + 95) = 0;
  *((void *)self + 96) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionAnimation, 0);
  cntrl = self->_taskContext.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (void)setFieldOfView:()Unit<geo:(double>)a3 :DegreeUnitDescription
{
  self->_fieldOfView._value = *v3;
}

- (Unit<geo::DegreeUnitDescription,)fieldOfView
{
  v3._value = self->_fieldOfView._value;
  void *v2 = *(Unit<geo::DegreeUnitDescription, double> *)&v3._value;
  return v3;
}

- (void)setOffsetTransform:()RigidTransform<double
{
  self->_offsetTransform = *a3;
}

- (RigidTransform<double,)offsetTransform
{
  *retstr = *(RigidTransform<double, double> *)((char *)self + 344);
  return self;
}

- (void)setOverrideARFieldOfView:(BOOL)a3
{
  self->_overrideARFieldOfView = a3;
}

- (BOOL)overrideARFieldOfView
{
  return self->_overrideARFieldOfView;
}

- (void)setMapEngine:(void *)a3
{
  self->_mapEngine = a3;
}

- (void)mapEngine
{
  return self->_mapEngine;
}

- (void)setGlobeView:(void *)a3
{
  self->_globeView = a3;
}

- (void)globeView
{
  return self->_globeView;
}

- (void)arSessionWasInterrupted:(unint64_t)a3
{
  transitionAnimation = self->_transitionAnimation;
  if (transitionAnimation && ![(VKAnimation *)transitionAnimation running])
  {
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->_transitionAnimation->super);
    v5 = +[VKDebugSettings sharedSettings];
    int v6 = [v5 arRenderAtNativeRate];

    uint64_t v7 = v6 ? -1 : 60;
    v8 = [(VKCameraController *)self runLoopController];
    v8->var1 = v7;
    uint64_t var0 = (uint64_t)v8->var0;
    if (var0)
    {
      if (!**(unsigned char **)(var0 + 1056))
      {
        md::MapEngine::setDisplayRate(var0, v7);
      }
    }
  }
}

- (void)updateCameraFrameFromARTransform
{
  transitionAnimation = self->_transitionAnimation;
  if (!transitionAnimation || ![(VKAnimation *)transitionAnimation running])
  {
    v4 = (double *)*((void *)self->_mapEngine + 132);
    double v6 = v4[6];
    double v5 = v4[7];
    double v7 = v4[5];
    double v8 = v4[8];
    double v9 = v4[2] + -((v7 + v7) * v5 - v8 * (v6 * -2.0)) * 10.0;
    double v10 = v4[3] + (v6 * -2.0 * v5 + (v7 + v7) * v8) * 10.0;
    double v11 = v4[4] + -(v6 * -2.0 * v6 + 1.0 - (v7 + v7) * v7) * 10.0;
    double v12 = self->_interfaceOrientationRotation._imaginary._e[2];
    double scalar = self->_interfaceOrientationRotation._scalar;
    float64x2_t v14 = *(float64x2_t *)&self->_arOrientation._imaginary._e[2];
    float64x2_t v15 = (float64x2_t)vextq_s8(*(int8x16_t *)self->_arOrientation._imaginary._e, *(int8x16_t *)self->_arOrientation._imaginary._e, 8uLL);
    float64x2_t v16 = (float64x2_t)vdupq_n_s64(0x3FE6A09E667F3BCDuLL);
    float64x2_t v17 = (float64x2_t)vdupq_n_s64(0x3FE6A09E667F3BCCuLL);
    float64x2_t v18 = vmulq_f64(v15, v16);
    float64x2_t v19 = vmulq_f64(v14, v17);
    *(void *)&v20.f64[0] = *(_OWORD *)&vsubq_f64(v18, v19);
    v20.f64[1] = vaddq_f64(v18, v19).f64[1];
    float64x2_t v21 = vmulq_f64(v14, v16);
    float64x2_t v22 = vmulq_f64(v15, v17);
    *(void *)&v16.f64[0] = *(_OWORD *)&vaddq_f64(v21, v22);
    float64x2_t v23 = vsubq_f64(v21, v22);
    float64x2_t v24 = *(float64x2_t *)self->_interfaceOrientationRotation._imaginary._e;
    int8x16_t v25 = (int8x16_t)vmulq_n_f64(v24, v16.f64[0]);
    v16.f64[1] = v23.f64[1];
    float64x2_t v26 = vmulq_laneq_f64(v24, v23, 1);
    float64x2_t v27 = (float64x2_t)vextq_s8(v25, v25, 8uLL);
    float64x2_t v28 = vsubq_f64(v26, v27);
    float64x2_t v29 = vaddq_f64(v26, v27);
    float64x2_t v30 = vmulq_n_f64(v20, v12);
    *(void *)&v26.f64[0] = *(_OWORD *)&vaddq_f64(v28, v30);
    v26.f64[1] = vsubq_f64(v29, v30).f64[1];
    float64x2_t v31 = (float64x2_t)vextq_s8((int8x16_t)v20, (int8x16_t)v20, 8uLL);
    float64x2_t v32 = vmlaq_n_f64(v26, v31, scalar);
    float64x2_t v33 = vmulq_n_f64(v16, scalar);
    float64x2_t v34 = vmulq_n_f64(v20, v24.f64[0]);
    float64x2_t v35 = vmulq_laneq_f64(v31, v24, 1);
    *(void *)&v31.f64[0] = *(_OWORD *)&vsubq_f64(v35, v34);
    v31.f64[1] = vaddq_f64(v35, v34).f64[1];
    float64x2_t v36 = vmlaq_n_f64(v31, (float64x2_t)vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL), v12);
    *(void *)&v37.f64[0] = *(_OWORD *)&vaddq_f64(v33, v36);
    v37.f64[1] = vsubq_f64(v33, v36).f64[1];
    float64x2_t v38 = (float64x2_t)vzip2q_s64((int64x2_t)v37, (int64x2_t)v32);
    float64x2_t v39 = vmulq_f64(v38, v38);
    float64x2_t v40 = (float64x2_t)vzip1q_s64((int64x2_t)v37, (int64x2_t)v32);
    float64x2_t v41 = vmulq_f64(v40, v40);
    float64x2_t v42 = vaddq_f64(v39, v41);
    double v43 = vsubq_f64(v42, (float64x2_t)vdupq_laneq_s64((int64x2_t)v42, 1)).f64[0];
    if (v43 >= 1.0)
    {
      double v46 = acos(vmlad_n_f64(1.0, -2.0, vaddq_f64(v41, (float64x2_t)vdupq_laneq_s64((int64x2_t)v39, 1)).f64[0]));
      double v44 = 0.0;
      double v45 = 0.0;
    }
    else
    {
      float64x2_t v60 = vmulq_f64((float64x2_t)vextq_s8((int8x16_t)v37, (int8x16_t)v37, 8uLL), v32);
      float64x2_t v61 = vmulq_f64(v32, v37);
      long double __x = v43;
      double v44 = atan2(v61.f64[0] - v61.f64[1], vaddvq_f64(v60));
      double v45 = acos(__x);
      double v46 = atan2(vaddvq_f64(v61), v60.f64[0] - v60.f64[1]);
    }
    double v47 = sqrt(v9 * v9 + v10 * v10);
    double v48 = atan2(v11, v47 * 0.996647189);
    double v49 = atan2(v10, v9);
    __double2 v50 = __sincos_stret(v48);
    long double v51 = atan2(v11 + v50.__sinval * v50.__sinval * 42841.3115 * v50.__sinval, v47 + v50.__cosval * v50.__cosval * -42697.6727 * v50.__cosval);
    __double2 v52 = __sincos_stret(v51);
    double v53 = self->_cameraFrame._heading._value + v44;
    self->_cameraFrame._target.latitude._double value = v51;
    self->_cameraFrame._target.longitude._double value = v49;
    self->_cameraFrame._target.altitude._double value = v47 / v52.__cosval
                                               + -6378137.0 / sqrt(v52.__sinval * v52.__sinval * -0.00669437999 + 1.0);
    self->_cameraFrame._distanceFromTarget._double value = 10.0;
    self->_cameraFrame._pitch._double value = v45;
    self->_cameraFrame._heading._double value = v53;
    self->_cameraFrame._roll._double value = v46;
    globeView = self->_globeView;
    uint64_t v55 = globeView[9];
    double value = self->_cameraFrame._roll._value;
    long long v57 = *(_OWORD *)&self->_cameraFrame._target.latitude._value;
    long long v58 = *(_OWORD *)&self->_cameraFrame._target.altitude._value;
    *(_OWORD *)(v55 + 40) = *(_OWORD *)&self->_cameraFrame._pitch._value;
    *(_OWORD *)(v55 + 24) = v58;
    *(double *)(v55 + 56) = value;
    *(_OWORD *)(v55 + 8) = v57;
    ++*((_DWORD *)globeView + 94);
  }
}

- (RigidTransform<double,)_transformFromARCamera:(VKARCameraController *)self
{
  id v6 = a4;
  double v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  double v8 = [v6 currentFrame];
  if (!v8) {
    goto LABEL_7;
  }
  double v9 = [v7 currentFrame];
  double v10 = [v9 camera];

  if (v10)
  {
    memset(&v77, 0, sizeof(v77));
    double v11 = softLinkCMClockGetTime;
    uint64_t HostTimeClock = softLinkCMClockGetHostTimeClock();
    ((void (*)(CMTime *__return_ptr, uint64_t))v11)(&v77, HostTimeClock);
    CMTime v76 = v77;
    softLinkCMTimeGetSeconds(&v76);
    objc_msgSend(v7, "predictedDeviceTransformAtTimestamp:");
    double v21 = v13;
    float v23 = v22;
    double v24 = v22;
    double v25 = v19;
    int64_t v26 = *(void *)(*((void *)self->_mapEngine + 132) + 96);
    if (v26 != self->_interfaceOrientation)
    {
      self->_interfaceOrientation = v26;
      unint64_t v27 = v26 - 1;
      if (v27 > 2)
      {
        double v30 = 1.0;
        double v29 = 0.0;
        double v31 = 0.0;
      }
      else
      {
        uint64_t v28 = 8 * v27;
        double v29 = *(double *)((char *)&unk_1A2900548 + v28);
        double v30 = *(double *)((char *)&unk_1A2900560 + v28);
        double v31 = *(double *)((char *)&unk_1A2900578 + v28);
      }
      self->_interfaceOrientationRotation._imaginary._e[0] = v31;
      self->_interfaceOrientationRotation._imaginary._e[1] = v31;
      self->_interfaceOrientationRotation._imaginary._e[2] = v29;
      self->_interfaceOrientationRotation._double scalar = v30;
    }
    double v32 = v14;
    double v33 = v15;
    double v34 = v16;
    double v35 = v17;
    double v36 = *(float *)&v18;
    double v37 = *((float *)&v18 + 1);
    double v38 = v24 + v21 + v25;
    if (v38 <= 0.0)
    {
      if (v13 <= v23 || v13 <= v19)
      {
        BOOL v47 = v23 <= v19;
        double v48 = sqrt(v25 + 1.0 - (v24 + v21));
        double v49 = 1.0 / (v48 + v48);
        double v50 = (v33 + v36) * v49;
        double v51 = v35 + v37;
        double v52 = v51 * v49;
        double v53 = v48 * 0.5;
        double v54 = (v32 - v34) * v49;
        double v55 = sqrt(v24 + 1.0 - (v25 + v21));
        double v56 = 1.0 / (v55 + v55);
        double v41 = v55 * 0.5;
        double v57 = v51 * v56;
        double v58 = (v36 - v33) * v56;
        if (v47) {
          double v40 = v50;
        }
        else {
          double v40 = (v32 + v34) * v56;
        }
        if (v47)
        {
          double v41 = v52;
          double v42 = v53;
        }
        else
        {
          double v42 = v57;
        }
        if (v47) {
          double v43 = v54;
        }
        else {
          double v43 = v58;
        }
      }
      else
      {
        double v44 = sqrt(v21 + 1.0 - (v25 + v24));
        double v45 = v44 + v44;
        double v40 = v44 * 0.5;
        double v46 = 1.0 / v45;
        double v41 = (v32 + v34) * v46;
        double v42 = (v33 + v36) * v46;
        double v43 = (v35 - v37) * v46;
      }
    }
    else
    {
      double v39 = 0.5 / sqrt(v38 + 1.0);
      double v40 = v39 * (v35 - v37);
      double v41 = v39 * (v36 - v33);
      double v42 = v39 * (v32 - v34);
      double v43 = 0.25 / v39;
    }
    self->_arOrientation._imaginary._e[0] = v40;
    self->_arOrientation._imaginary._e[1] = v41;
    self->_arOrientation._imaginary._e[2] = v42;
    self->_arOrientation._double scalar = v43;
    double v59 = v41 * 0.707106781;
    double v60 = v40 * 0.707106781 + v43 * 0.707106781;
    double v61 = -(v42 * 0.707106781 - v41 * 0.707106781);
    double v62 = v59 + v42 * 0.707106781;
    double v63 = -(v40 * 0.707106781 - v43 * 0.707106781);
    double v64 = self->_interfaceOrientationRotation._imaginary._e[1];
    double v65 = self->_interfaceOrientationRotation._imaginary._e[2];
    double scalar = self->_interfaceOrientationRotation._scalar;
    double v67 = v65 * v61 - (v64 * v62 - self->_interfaceOrientationRotation._imaginary._e[0] * v63) + scalar * v60;
    double v68 = self->_interfaceOrientationRotation._imaginary._e[0] * v62 + v64 * v63 - v65 * v60 + scalar * v61;
    double v69 = v65 * v63 - (self->_interfaceOrientationRotation._imaginary._e[0] * v61 - v64 * v60) + scalar * v62;
    double v70 = self->_interfaceOrientationRotation._imaginary._e[0] * v60 + v64 * v61 + v65 * v62;
    retstr->_translation._e[0] = *(float *)v20.i32;
    float64x2_t v71 = vcvtq_f64_f32((float32x2_t)*(_OWORD *)&vextq_s8(v20, v20, 4uLL));
    float64x2_t v72 = vmulq_f64(v71, (float64x2_t)vdupq_n_s64(0x3CB0000000000000uLL));
    float64x2_t v73 = (float64x2_t)vextq_s8((int8x16_t)v71, (int8x16_t)v71, 8uLL);
    *(void *)&long long v74 = *(_OWORD *)&vsubq_f64(v72, v73);
    *((void *)&v74 + 1) = *(void *)&vaddq_f64(v72, v73).f64[1];
    *(_OWORD *)&retstr->_translation._e[1] = v74;
    retstr->_rotation._imaginary._e[0] = v67;
    retstr->_rotation._imaginary._e[1] = v68;
    retstr->_rotation._imaginary._e[2] = v69;
    retstr->_rotation._double scalar = -(v70 - scalar * v63);
  }
  else
  {
LABEL_7:
    *(_OWORD *)&retstr->_translation._e[2] = 0u;
    *(_OWORD *)&retstr->_rotation._imaginary._e[1] = 0u;
    *(_OWORD *)retstr->_translation._e = 0u;
    retstr->_rotation._double scalar = 1.0;
  }

  return result;
}

- (float)heightScale
{
  return self->_height;
}

- (RigidTransform<double,)arCameraTransform
{
  *retstr = *(RigidTransform<double, double> *)(*(void *)(*(void *)&self[5]._translation._e[2] + 1056) + 16);
  return self;
}

- (void)trasitionToARModeFromCameraFrame:(const void *)a3 withDuration:(double)a4 completion:(id)a5
{
  [(VKAnimation *)self->_transitionAnimation stop];
  transitionAnimation = self->_transitionAnimation;
  self->_transitionAnimation = 0;

  long long v9 = *((_OWORD *)a3 + 1);
  long long v8 = *((_OWORD *)a3 + 2);
  long long v10 = *(_OWORD *)a3;
  self->_cameraFrame._roll._double value = *((double *)a3 + 6);
  *(_OWORD *)&self->_cameraFrame._target.altitude._double value = v9;
  *(_OWORD *)&self->_cameraFrame._pitch._double value = v8;
  *(_OWORD *)&self->_cameraFrame._target.latitude._double value = v10;
  globeView = self->_globeView;
  uint64_t v12 = globeView[9];
  long long v14 = *((_OWORD *)a3 + 1);
  long long v13 = *((_OWORD *)a3 + 2);
  long long v15 = *(_OWORD *)a3;
  *(void *)(v12 + 56) = *((void *)a3 + 6);
  *(_OWORD *)(v12 + 8) = v15;
  *(_OWORD *)(v12 + 40) = v13;
  *(_OWORD *)(v12 + 24) = v14;
  ++*((_DWORD *)globeView + 94);
  double v48 = 0.0;
  float v16 = self->_globeView;
  long long v43 = *(_OWORD *)&self->_cameraFrame._target.latitude._value;
  if (altitude::IntersectorHeight::heightAtLatLon(v16[89], (double *)&v43, &v48, 0xEu))
  {
    double altitudeOffset = self->_altitudeOffset;
  }
  else
  {
    double altitudeOffset = v48;
    self->_double altitudeOffset = v48;
  }
  uint64_t v18 = (float *)*((void *)self->_mapEngine + 132);
  double value = self->_cameraFrame._distanceFromTarget._value;
  float v20 = -(altitudeOffset - cos(self->_cameraFrame._pitch._value) * value);
  v18[1] = v20;
  self->_arTransform._rotation._imaginary._e[1] = 0.0;
  self->_arTransform._rotation._imaginary._e[2] = 0.0;
  self->_arTransform._rotation._double scalar = 1.0;
  self->_arTransform._translation._e[2] = 0.0;
  self->_arTransform._rotation._imaginary._e[0] = 0.0;
  self->_arTransform._translation._e[0] = 0.0;
  self->_arTransform._translation._e[1] = 0.0;
  self->_currentARTransform._rotation._imaginary._e[1] = 0.0;
  self->_currentARTransform._rotation._imaginary._e[2] = 0.0;
  self->_currentARTransform._rotation._double scalar = 1.0;
  self->_currentARTransform._translation._e[2] = 0.0;
  self->_currentARTransform._rotation._imaginary._e[0] = 0.0;
  self->_currentARTransform._translation._e[0] = 0.0;
  self->_currentARTransform._translation._e[1] = 0.0;
  self->_lastARTransform._rotation._imaginary._e[1] = 0.0;
  self->_lastARTransform._rotation._imaginary._e[2] = 0.0;
  self->_lastARTransform._rotation._double scalar = 1.0;
  self->_lastARTransform._translation._e[2] = 0.0;
  self->_lastARTransform._rotation._imaginary._e[0] = 0.0;
  self->_lastARTransform._translation._e[0] = 0.0;
  self->_lastARTransform._translation._e[1] = 0.0;
  self->_arOrientation._imaginary._e[0] = 0.0;
  self->_arOrientation._imaginary._e[1] = 0.0;
  self->_arOrientation._imaginary._e[2] = 0.0;
  self->_arOrientation._double scalar = 1.0;
  self->_offsetTransform._rotation._imaginary._e[1] = 0.0;
  self->_offsetTransform._rotation._imaginary._e[2] = 0.0;
  self->_offsetTransform._rotation._double scalar = 1.0;
  self->_offsetTransform._translation._e[2] = 0.0;
  self->_offsetTransform._rotation._imaginary._e[0] = 0.0;
  self->_offsetTransform._translation._e[0] = 0.0;
  self->_offsetTransform._translation._e[1] = 0.0;
  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric((double *)&v43, &self->_cameraFrame._target.latitude._value);
  double v21 = (double *)*((void *)self->_globeView + 9);
  double v23 = v21[46];
  double v22 = v21[47];
  if (v22 >= v23)
  {
    double v29 = v21[57];
  }
  else
  {
    double v24 = v22 * v23;
    double v25 = v22 / v23;
    if (v24 <= 0.0) {
      double v26 = 1.0;
    }
    else {
      double v26 = v25;
    }
    long double v27 = tan(v21[57] * 0.5);
    long double v28 = atan(v26 * v27);
    double v29 = v28 + v28;
  }
  objc_initWeak(&location, self);
  double v30 = [[VKTimedAnimation alloc] initWithDuration:0.5];
  double v31 = self->_transitionAnimation;
  self->_transitionAnimation = v30;

  [(VKTimedAnimation *)self->_transitionAnimation setTimingFunction:VKAnimationCurveEaseInOut];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3321888768;
  v34[2] = __81__VKARCameraController_trasitionToARModeFromCameraFrame_withDuration_completion___block_invoke;
  v34[3] = &unk_1EF58DBF8;
  objc_copyWeak(v35, &location);
  v35[1] = v18;
  long long v36 = v43;
  uint64_t v37 = v44;
  long long v38 = v45;
  uint64_t v39 = v46;
  uint64_t v40 = v47;
  double v41 = v29;
  [(VKTimedAnimation *)self->_transitionAnimation setStepHandler:v34];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __81__VKARCameraController_trasitionToARModeFromCameraFrame_withDuration_completion___block_invoke_17;
  v32[3] = &unk_1E5A96C78;
  objc_copyWeak(&v33, &location);
  [(VKAnimation *)self->_transitionAnimation setCompletionHandler:v32];
  objc_destroyWeak(&v33);
  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
}

void __81__VKARCameraController_trasitionToARModeFromCameraFrame_withDuration_completion___block_invoke(uint64_t a1, float a2)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = *(id *)(*(void *)(a1 + 40) + 104);
    [WeakRetained _transformFromARCamera:v5];
    *((double *)WeakRetained + 74) = v62;
    *((double *)WeakRetained + 75) = v63;
    *((double *)WeakRetained + 76) = v64;
    *((double *)WeakRetained + 77) = v65;
    *(float64x2_t *)(WeakRetained + 568) = v60;
    *((double *)WeakRetained + 73) = v61;

    [WeakRetained _updateBaseTransform];
    [WeakRetained altitude];
    double v7 = -v6 / md::ARContext::planeHeight(*(md::ARContext **)(a1 + 40));
    *((void *)WeakRetained + 67) = *((void *)WeakRetained + 74);
    *((void *)WeakRetained + 68) = *((void *)WeakRetained + 75);
    *((void *)WeakRetained + 69) = *((void *)WeakRetained + 76);
    *((void *)WeakRetained + 70) = *((void *)WeakRetained + 77);
    double v8 = *((double *)WeakRetained + 67);
    double v9 = *((double *)WeakRetained + 66) + (*((double *)WeakRetained + 73) - *((double *)WeakRetained + 80)) * v7;
    *((float64x2_t *)WeakRetained + 32) = vmlaq_n_f64(*((float64x2_t *)WeakRetained + 32), vsubq_f64(*(float64x2_t *)(WeakRetained + 568), *((float64x2_t *)WeakRetained + 39)), v7);
    *((double *)WeakRetained + 66) = v9;
    double v11 = *((double *)WeakRetained + 48);
    double v10 = *((double *)WeakRetained + 49);
    double v13 = *((double *)WeakRetained + 59);
    double v12 = *((double *)WeakRetained + 60);
    double v14 = *((double *)WeakRetained + 61);
    double v15 = *((double *)WeakRetained + 62);
    double v16 = *((double *)WeakRetained + 63);
    double v18 = *((double *)WeakRetained + 46);
    double v17 = *((double *)WeakRetained + 47);
    double v19 = v12 * v10 + v18 * v16 + v17 * v15 - v11 * v14;
    double v20 = v17 * v16 - (v18 * v15 - v14 * v10) + v11 * v12;
    double v21 = v15 * v10 + v18 * v14 - v17 * v12 + v11 * v16;
    double v22 = -(v18 * v12 + v17 * v14 + v11 * v15 - v16 * v10);
    double v24 = *((double *)WeakRetained + 57);
    double v23 = *((double *)WeakRetained + 58);
    double v25 = -(v23 * v11 - v13 * v17) - (v23 * v11 - v13 * v17);
    double v26 = -(v13 * v18 - v24 * v11) - (v13 * v18 - v24 * v11);
    double v27 = -(v24 * v17 - v23 * v18) - (v24 * v17 - v23 * v18);
    double v28 = *((double *)WeakRetained + 68);
    double v29 = *((double *)WeakRetained + 69);
    double v30 = *((double *)WeakRetained + 70);
    double v31 = v29 * v20 - (v28 * v21 - v8 * v22) + v30 * v19;
    double v32 = v8 * v21 + v28 * v22 - v29 * v19 + v30 * v20;
    double v33 = v29 * v22 - (v8 * v20 - v28 * v19) + v30 * v21;
    double v34 = -(v8 * v19 + v28 * v20 + v29 * v21 - v30 * v22);
    double v36 = *((double *)WeakRetained + 65);
    double v35 = *((double *)WeakRetained + 66);
    double v37 = *((double *)WeakRetained + 64);
    double v38 = -(v36 * v21 - v35 * v20) - (v36 * v21 - v35 * v20);
    double v39 = -(v35 * v19 - v37 * v21) - (v35 * v19 - v37 * v21);
    double v40 = -(v37 * v20 - v36 * v19) - (v37 * v20 - v36 * v19);
    double v41 = *((double *)WeakRetained + 44)
        + v23
        + v25 * v11
        + v26 * v10
        + v36
        + v38 * v21
        + v39 * v22
        - (v27 * v18
         + v40 * v19);
    double v42 = *((double *)WeakRetained + 45) + v13 + v26 * v18;
    v60.f64[0] = *((double *)WeakRetained + 43)
               + v24
               + v25 * v10
               + v27 * v17
               + v37
               + v38 * v22
               + v40 * v20
               - (v26 * v11
                + v39 * v21);
    v60.f64[1] = v41;
    double v43 = v42 + v27 * v10 + v35 + v39 * v19 + v40 * v22 - (v25 * v17 + v38 * v20);
    double v61 = v43;
    double v62 = v31;
    double v63 = v32;
    double v64 = v33;
    double v65 = v34;
    long long v58 = *(_OWORD *)(a1 + 72);
    long long v59 = *(_OWORD *)(a1 + 88);
    gm::Quaternion<double>::slerp((double *)&v58, &v62, a2);
    double v44 = *(double *)(a1 + 64) + (v43 - *(double *)(a1 + 64)) * a2;
    float64x2_t v45 = vmlaq_n_f64(*(float64x2_t *)(a1 + 48), vsubq_f64(v60, *(float64x2_t *)(a1 + 48)), a2);
    long long v46 = v59;
    uint64_t v47 = *(void *)(a1 + 40);
    *(_OWORD *)(v47 + 40) = v58;
    *(_OWORD *)(v47 + 56) = v46;
    *(float64x2_t *)(v47 + 16) = v45;
    *(double *)(v47 + 32) = v44;
    double v48 = *(double *)(a1 + 104) + (*((double *)WeakRetained + 42) - *(double *)(a1 + 104)) * a2;
    uint64_t v49 = *((void *)WeakRetained + 36);
    *(double *)(v49 + 280) = v48;
    double v50 = tan(v48 * 0.5);
    *(double *)(v49 + 288) = v50;
    double v51 = *(double **)(v49 + 72);
    double v53 = v51[46];
    double v52 = v51[47];
    if (v52 < v53)
    {
      double v54 = v52 * v53;
      double v55 = v53 / v52;
      if (v54 <= 0.0) {
        double v55 = 1.0;
      }
      long double v56 = atan(v55 * v50);
      double v48 = v56 + v56;
    }
    v51[57] = v48;
    uint64_t v57 = **(void **)(*(void *)(v49 + 856) + 88);
    if (v57)
    {
      LOBYTE(v58) = 7;
      md::MapEngine::setNeedsTick(v57, &v58);
    }
    *((void *)WeakRetained + 81) = *((void *)WeakRetained + 74);
    *((void *)WeakRetained + 82) = *((void *)WeakRetained + 75);
    *((void *)WeakRetained + 83) = *((void *)WeakRetained + 76);
    *((void *)WeakRetained + 84) = *((void *)WeakRetained + 77);
    *((void *)WeakRetained + 78) = *((void *)WeakRetained + 71);
    *((void *)WeakRetained + 79) = *((void *)WeakRetained + 72);
    *((void *)WeakRetained + 80) = *((void *)WeakRetained + 73);
  }
}

void __81__VKARCameraController_trasitionToARModeFromCameraFrame_withDuration_completion___block_invoke_17(uint64_t a1, int a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _updateBaseTransform];
    [v5 _updateARContext];
    WeakRetained = v5;
    if (a2)
    {
      v4 = (void *)v5[89];
      v5[89] = 0;

      WeakRetained = v5;
    }
  }
}

- (CameraFrame<geo::Radians,)cameraFrame
{
  long long v3 = *(_OWORD *)&self[7]._distanceFromTarget._value;
  *(_OWORD *)&retstr->_target.latitude._double value = *(_OWORD *)&self[7]._target.longitude._value;
  *(_OWORD *)&retstr->_target.altitude._double value = v3;
  *(_OWORD *)&retstr->_pitch._double value = *(_OWORD *)&self[7]._heading._value;
  retstr->_roll._double value = self[8]._target.latitude._value;
  return self;
}

- (void)trasitionToARModeAtCoordinate:(id)a3 withDuration:(double)a4 completion:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  double v9 = (void (**)(id, void))a5;
  transitionAnimation = self->_transitionAnimation;
  if (transitionAnimation && [(VKAnimation *)transitionAnimation running])
  {
    if (v9) {
      v9[2](v9, 0);
    }
  }
  else
  {
    v11[0] = var0 * 0.0174532925;
    v11[1] = var1 * 0.0174532925;
    v11[2] = 0.0;
    [(VKARCameraController *)self _setupPounceAnimation:v11 duration:v9 completion:a4];
  }
}

- (void)_setupPounceAnimation:(const void *)a3 duration:(double)a4 completion:(id)a5
{
  id v8 = a5;
  [(VKAnimation *)self->_transitionAnimation stop];
  transitionAnimation = self->_transitionAnimation;
  self->_transitionAnimation = 0;

  [(VKARCameraController *)self _updateBaseTransform];
  double v10 = [[VKTimedAnimation alloc] initWithDuration:a4];
  double v11 = self->_transitionAnimation;
  self->_transitionAnimation = v10;

  [(VKTimedAnimation *)self->_transitionAnimation setTimingFunction:VKAnimationCurveEaseInOut];
  double value = self->_cameraFrame._target.latitude._value;
  double v13 = self->_cameraFrame._target.longitude._value;
  double v14 = self->_cameraFrame._target.altitude._value;
  double v15 = self->_cameraFrame._distanceFromTarget._value;
  double v16 = self->_cameraFrame._pitch._value;
  double v17 = self->_cameraFrame._heading._value;
  double v18 = self->_cameraFrame._roll._value;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x6812000000;
  v50[3] = __Block_byref_object_copy__5555;
  v50[4] = __Block_byref_object_dispose__5556;
  v50[5] = "";
  double v55 = v17;
  uint64_t v54 = 0x3FE921FB54442D18;
  uint64_t v56 = 0;
  double v53 = self->_height * 1.41421356;
  long long v51 = *(_OWORD *)a3;
  uint64_t v52 = *((void *)a3 + 2);
  id location = 0;
  globeView = self->_globeView;
  long long v46 = v51;
  if (!altitude::IntersectorHeight::heightAtLatLon(globeView[89], (double *)&v46, (double *)&location, 0xEu))*(void *)&self->_double altitudeOffset = location; {
  double v20 = (void *)*((void *)self->_mapEngine + 132);
  }
  objc_initWeak(&location, self);
  double v21 = (double *)*((void *)self->_globeView + 9);
  double v23 = v21[46];
  double v22 = v21[47];
  if (v22 >= v23)
  {
    double v29 = v21[57];
  }
  else
  {
    double v24 = v22 * v23;
    double v25 = v22 / v23;
    if (v24 <= 0.0) {
      double v26 = 1.0;
    }
    else {
      double v26 = v25;
    }
    long double v27 = tan(v21[57] * 0.5);
    long double v28 = atan(v26 * v27);
    double v29 = v28 + v28;
  }
  *(void *)&long long v46 = 0;
  *((void *)&v46 + 1) = &v46;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3321888768;
  id v35[2] = __66__VKARCameraController__setupPounceAnimation_duration_completion___block_invoke;
  v35[3] = &unk_1EF58DDE0;
  objc_copyWeak(v36, &location);
  v36[1] = v20;
  v35[4] = &v46;
  v35[5] = v50;
  long long v37 = xmmword_1A28FD4D0;
  double v38 = value;
  double v39 = v13;
  double v40 = v14;
  double v41 = v15;
  double v42 = v16;
  double v43 = v17;
  double v44 = v18;
  double v45 = v29;
  [(VKTimedAnimation *)self->_transitionAnimation setStepHandler:v35];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __66__VKARCameraController__setupPounceAnimation_duration_completion___block_invoke_15;
  v31[3] = &unk_1E5A943E0;
  objc_copyWeak(&v34, &location);
  double v33 = v50;
  id v30 = v8;
  id v32 = v30;
  [(VKAnimation *)self->_transitionAnimation setCompletionHandler:v31];

  objc_destroyWeak(&v34);
  objc_destroyWeak(v36);
  _Block_object_dispose(&v46, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(v50, 8);
}

void __66__VKARCameraController__setupPounceAnimation_duration_completion___block_invoke(uint64_t a1, float a2)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v5 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (vabdd_f64(1.0, v5) > 0.00001)
    {
      id v6 = *(id *)(*(void *)(a1 + 56) + 104);
      double v7 = [v6 currentFrame];
      double v106 = a2;
      double v8 = (a2 - v5) / (1.0 - v5);

      if (v7)
      {
        double v9 = [v7 camera];
        [v9 eulerAngles];
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 80) = fmin(fmax(v10 + 1.57079633, *(double *)(a1 + 64)), *(double *)(a1 + 72));

        double v11 = *(double *)(a1 + 120);
        double v12 = [v7 camera];
        [v12 eulerAngles];
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 88) = v11 + v13;

        double v14 = [v7 camera];
        [v14 eulerAngles];
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 96) = v15;

        double v16 = *((double *)WeakRetained + 40);
        uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
        *(long double *)(v17 + 72) = v16 / cos(*(long double *)(v17 + 80));
        uint64_t v18 = *((void *)WeakRetained + 36);
        uint64_t v114 = 0;
        float64x2_t v112 = *(float64x2_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
        if (!altitude::IntersectorHeight::heightAtLatLon(*(void *)(v18 + 712), v112.f64, (double *)&v114, 0xEu))*((void *)WeakRetained + 41) = v114; {
        double v19 = *(float64x2_t **)(*(void *)(a1 + 40) + 8);
        }
        float v20 = v8;
        double v21 = *((double *)WeakRetained + 54);
        double v22 = *((double *)WeakRetained + 55);
        double v104 = v20;
        long double v23 = fmod(3.14159265 - v22 + v19[5].f64[1], 6.28318531);
        long double v24 = fmod(v23 + 6.28318531, 6.28318531);
        long double v25 = fmod(v22 + (v24 + -3.14159265) * v104, 6.28318531);
        long double v26 = fmod(v25 + 6.28318531, 6.28318531);
        double v27 = v21 + (v19[5].f64[0] - v21) * v104;
        float64x2_t v28 = vmlaq_n_f64(*((float64x2_t *)WeakRetained + 26), vsubq_f64(v19[4], *((float64x2_t *)WeakRetained + 26)), v104);
        *((float64x2_t *)WeakRetained + 25) = vmlaq_n_f64(*((float64x2_t *)WeakRetained + 25), vsubq_f64(v19[3], *((float64x2_t *)WeakRetained + 25)), v104);
        *((float64x2_t *)WeakRetained + 26) = v28;
        *((double *)WeakRetained + 54) = v27;
        *((long double *)WeakRetained + 55) = v26;
        id v29 = *(id *)(*(void *)(a1 + 56) + 104);
        [WeakRetained _transformFromARCamera:v29];
        *((void *)WeakRetained + 74) = *(void *)&v113[8];
        *((void *)WeakRetained + 75) = *(void *)&v113[16];
        *((_OWORD *)WeakRetained + 38) = *(_OWORD *)&v113[24];
        *(float64x2_t *)(WeakRetained + 568) = v112;
        *((void *)WeakRetained + 73) = *(void *)v113;

        [WeakRetained _updateBaseTransform];
        objc_msgSend(WeakRetained, "altitude", gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v112.f64, (double *)WeakRetained + 50));
        double v31 = -v30 / md::ARContext::planeHeight(*(md::ARContext **)(a1 + 56));
        *((void *)WeakRetained + 67) = *((void *)WeakRetained + 74);
        *((void *)WeakRetained + 68) = *((void *)WeakRetained + 75);
        *((void *)WeakRetained + 69) = *((void *)WeakRetained + 76);
        *((void *)WeakRetained + 70) = *((void *)WeakRetained + 77);
        double v32 = *((double *)WeakRetained + 67);
        double v33 = *((double *)WeakRetained + 66) + (*((double *)WeakRetained + 73) - *((double *)WeakRetained + 80)) * v31;
        *((float64x2_t *)WeakRetained + 32) = vmlaq_n_f64(*((float64x2_t *)WeakRetained + 32), vsubq_f64(*(float64x2_t *)(WeakRetained + 568), *((float64x2_t *)WeakRetained + 39)), v31);
        *((double *)WeakRetained + 66) = v33;
        double v35 = *((double *)WeakRetained + 48);
        double v34 = *((double *)WeakRetained + 49);
        double v37 = *((double *)WeakRetained + 59);
        double v36 = *((double *)WeakRetained + 60);
        double v38 = *((double *)WeakRetained + 61);
        double v39 = *((double *)WeakRetained + 62);
        double v40 = *((double *)WeakRetained + 63);
        double v42 = *((double *)WeakRetained + 46);
        double v41 = *((double *)WeakRetained + 47);
        double v43 = v36 * v34 + v42 * v40 + v41 * v39 - v35 * v38;
        double v44 = v41 * v40 - (v42 * v39 - v38 * v34) + v35 * v36;
        double v45 = v39 * v34 + v42 * v38 - v41 * v36 + v35 * v40;
        double v46 = -(v42 * v36 + v41 * v38 + v35 * v39 - v40 * v34);
        double v48 = *((double *)WeakRetained + 57);
        double v47 = *((double *)WeakRetained + 58);
        double v49 = -(v47 * v35 - v37 * v41) - (v47 * v35 - v37 * v41);
        double v50 = -(v37 * v42 - v48 * v35) - (v37 * v42 - v48 * v35);
        double v51 = -(v48 * v41 - v47 * v42) - (v48 * v41 - v47 * v42);
        double v52 = *((double *)WeakRetained + 68);
        double v53 = *((double *)WeakRetained + 69);
        double v54 = *((double *)WeakRetained + 70);
        double v55 = v53 * v44 - (v52 * v45 - v32 * v46) + v54 * v43;
        double v56 = v32 * v45 + v52 * v46 - v53 * v43 + v54 * v44;
        double v57 = v53 * v46 - (v32 * v44 - v52 * v43) + v54 * v45;
        double v58 = -(v32 * v43 + v52 * v44 + v53 * v45 - v54 * v46);
        double v60 = *((double *)WeakRetained + 65);
        double v59 = *((double *)WeakRetained + 66);
        double v61 = *((double *)WeakRetained + 64);
        double v62 = -(v60 * v45 - v59 * v44) - (v60 * v45 - v59 * v44);
        double v63 = -(v59 * v43 - v61 * v45) - (v59 * v43 - v61 * v45);
        double v64 = -(v61 * v44 - v60 * v43) - (v61 * v44 - v60 * v43);
        double v65 = *((double *)WeakRetained + 44)
            + v47
            + v49 * v35
            + v50 * v34
            + v60
            + v62 * v45
            + v63 * v46
            - (v51 * v42
             + v64 * v43);
        double v66 = *((double *)WeakRetained + 45) + v37 + v50 * v42;
        v109.f64[0] = *((double *)WeakRetained + 43)
                    + v48
                    + v49 * v34
                    + v51 * v41
                    + v61
                    + v62 * v46
                    + v64 * v44
                    - (v50 * v35
                     + v63 * v45);
        v109.f64[1] = v65;
        double v67 = v66 + v51 * v34 + v59 + v63 * v43 + v64 * v46 - (v49 * v41 + v62 * v44);
        double v110 = v67;
        v111[0] = v55;
        v111[1] = v56;
        v111[2] = v57;
        v111[3] = v58;
        long long v107 = *(_OWORD *)&v113[8];
        long long v108 = *(_OWORD *)&v113[24];
        gm::Quaternion<double>::slerp((double *)&v107, v111, v106);
        double v68 = *(double *)v113 + (v67 - *(double *)v113) * v106;
        float64x2_t v69 = vmlaq_n_f64(v112, vsubq_f64(v109, v112), v106);
        long long v70 = v108;
        uint64_t v71 = *(void *)(a1 + 56);
        *(_OWORD *)(v71 + 40) = v107;
        *(_OWORD *)(v71 + 56) = v70;
        *(float64x2_t *)(v71 + 16) = v69;
        *(double *)(v71 + 32) = v68;
        double v72 = *(double *)(a1 + 136) + (*((double *)WeakRetained + 42) - *(double *)(a1 + 136)) * v106;
        uint64_t v73 = *((void *)WeakRetained + 36);
        *(double *)(v73 + 280) = v72;
        double v74 = tan(v72 * 0.5);
        *(double *)(v73 + 288) = v74;
        v75 = *(double **)(v73 + 72);
        double v77 = v75[46];
        double v76 = v75[47];
        if (v76 < v77)
        {
          double v78 = v76 * v77;
          double v79 = v77 / v76;
          if (v78 <= 0.0) {
            double v79 = 1.0;
          }
          long double v80 = atan(v79 * v74);
          double v72 = v80 + v80;
        }
        v75[57] = v72;
        uint64_t v81 = **(void **)(*(void *)(v73 + 856) + 88);
        if (v81)
        {
          LOBYTE(v107) = 7;
          md::MapEngine::setNeedsTick(v81, &v107);
        }
        uint64_t v82 = *((void *)WeakRetained + 36);
        uint64_t v83 = *(void *)(v82 + 72);
        long long v84 = *((_OWORD *)WeakRetained + 25);
        long long v85 = *((_OWORD *)WeakRetained + 26);
        long long v86 = *((_OWORD *)WeakRetained + 27);
        *(void *)(v83 + 56) = *((void *)WeakRetained + 56);
        *(_OWORD *)(v83 + 40) = v86;
        *(_OWORD *)(v83 + 24) = v85;
        *(_OWORD *)(v83 + 8) = v84;
        ++*(_DWORD *)(v82 + 376);
        *((void *)WeakRetained + 81) = *((void *)WeakRetained + 74);
        *((void *)WeakRetained + 82) = *((void *)WeakRetained + 75);
        *((void *)WeakRetained + 83) = *((void *)WeakRetained + 76);
        *((void *)WeakRetained + 84) = *((void *)WeakRetained + 77);
        *((void *)WeakRetained + 78) = *((void *)WeakRetained + 71);
        *((void *)WeakRetained + 79) = *((void *)WeakRetained + 72);
        *((void *)WeakRetained + 80) = *((void *)WeakRetained + 73);
      }
      else
      {
        v87 = *(float64x2_t **)(*(void *)(a1 + 40) + 8);
        float v88 = v8;
        double v89 = *((double *)WeakRetained + 54);
        double v90 = *((double *)WeakRetained + 55);
        double v105 = v88;
        long double v91 = fmod(3.14159265 - v90 + v87[5].f64[1], 6.28318531);
        long double v92 = fmod(v91 + 6.28318531, 6.28318531);
        long double v93 = fmod(v90 + (v92 + -3.14159265) * v105, 6.28318531);
        long double v94 = fmod(v93 + 6.28318531, 6.28318531);
        double v95 = v89 + (v87[5].f64[0] - v89) * v105;
        float64x2_t v96 = vmlaq_n_f64(*((float64x2_t *)WeakRetained + 26), vsubq_f64(v87[4], *((float64x2_t *)WeakRetained + 26)), v105);
        *((float64x2_t *)WeakRetained + 25) = vmlaq_n_f64(*((float64x2_t *)WeakRetained + 25), vsubq_f64(v87[3], *((float64x2_t *)WeakRetained + 25)), v105);
        *((float64x2_t *)WeakRetained + 26) = v96;
        *((double *)WeakRetained + 54) = v95;
        *((long double *)WeakRetained + 55) = v94;
        uint64_t v97 = *(void *)(a1 + 56);
        gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v112.f64, (double *)WeakRetained + 50);
        float64x2_t v98 = v112;
        *(_OWORD *)(v97 + 48) = *(_OWORD *)&v113[16];
        *(void *)(v97 + 64) = *(void *)&v113[32];
        *(float64x2_t *)(v97 + 16) = v98;
        *(_OWORD *)(v97 + 32) = *(_OWORD *)v113;
        uint64_t v99 = *((void *)WeakRetained + 36);
        uint64_t v100 = *(void *)(v99 + 72);
        long long v102 = *((_OWORD *)WeakRetained + 26);
        long long v101 = *((_OWORD *)WeakRetained + 27);
        uint64_t v103 = *((void *)WeakRetained + 56);
        *(_OWORD *)(v100 + 8) = *((_OWORD *)WeakRetained + 25);
        *(void *)(v100 + 56) = v103;
        *(_OWORD *)(v100 + 40) = v101;
        *(_OWORD *)(v100 + 24) = v102;
        ++*(_DWORD *)(v99 + 376);
      }
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v106;
    }
  }
}

void __66__VKARCameraController__setupPounceAnimation_duration_completion___block_invoke_15(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v6 = *(_OWORD *)(v4 + 64);
    long long v5 = *(_OWORD *)(v4 + 80);
    long long v7 = *(_OWORD *)(v4 + 48);
    *((void *)WeakRetained + 56) = *(void *)(v4 + 96);
    *((_OWORD *)WeakRetained + 26) = v6;
    *((_OWORD *)WeakRetained + 27) = v5;
    *((_OWORD *)WeakRetained + 25) = v7;
    uint64_t v8 = *((void *)WeakRetained + 36);
    uint64_t v9 = *(void *)(v8 + 72);
    long long v11 = *(_OWORD *)(v4 + 64);
    long long v10 = *(_OWORD *)(v4 + 80);
    uint64_t v12 = *(void *)(v4 + 96);
    *(_OWORD *)(v9 + 8) = *(_OWORD *)(v4 + 48);
    *(void *)(v9 + 56) = v12;
    *(_OWORD *)(v9 + 40) = v10;
    *(_OWORD *)(v9 + 24) = v11;
    ++*(_DWORD *)(v8 + 376);
    altitude::GlobeView::setPerspective(*((void *)WeakRetained + 36), (double *)WeakRetained + 42);
    [WeakRetained _updateBaseTransform];
    [WeakRetained _updateARContext];
    if (a2)
    {
      float v13 = (void *)*((void *)WeakRetained + 89);
      *((void *)WeakRetained + 89) = 0;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, a2);
    }
  }
}

- (void)_updateBaseTransform
{
  uint64_t v3 = *((void *)self->_mapEngine + 132);
  long double v4 = *(double *)(v3 + 16);
  long double v5 = *(double *)(v3 + 24);
  long double v6 = *(double *)(v3 + 32);
  double v7 = sqrt(v4 * v4 + v5 * v5);
  double v8 = atan2(v6, v7 * 0.996647189);
  double v9 = atan2(v5, v4);
  __double2 v10 = __sincos_stret(v8);
  v36.latitude._double value = atan2(v6 + v10.__sinval * v10.__sinval * 42841.3115 * v10.__sinval, v7 + v10.__cosval * v10.__cosval * -42697.6727 * v10.__cosval);
  v36.longitude._double value = v9;
  if (v36.latitude._value != self->_currentCoordinate.latitude._value
    || v9 != self->_currentCoordinate.longitude._value)
  {
    v35[0] = 0.0;
    if (!altitude::IntersectorHeight::heightAtLatLon(*((void *)self->_globeView + 89), &v36.latitude._value, v35, 0xEu)&& v35[0] > self->_altitudeOffset)
    {
      self->_double altitudeOffset = v35[0];
    }
    self->_currentCoordinate = v36;
  }
  p_cameraFrame = &self->_cameraFrame;
  uint64_t v12 = +[VKDebugSettings sharedSettings];
  int v13 = [v12 arOverrideDefaults];

  if (v13)
  {
    uint64_t v14 = +[VKDebugSettings sharedSettings];
    [v14 arDefaultHeight];
    float v16 = v15;
  }
  else
  {
    float v16 = *(float *)(v3 + 4);
  }
  float v17 = self->_altitudeOffset + v16;
  double height = self->_height;
  double v19 = v17;
  if (height != v19)
  {
    self->_double height = v19;
    double height = v19;
  }
  double v20 = v35[0];
  double v21 = v35[1];
  double v22 = v35[2];
  double v23 = sqrt(v20 * v20 + v21 * v21 + v22 * v22);
  double value = self->_cameraFrame._distanceFromTarget._value;
  long double v25 = (v23 - cos(self->_cameraFrame._pitch._value) * value + height) / v23;
  p_baseTransform = &self->_baseTransform;
  p_baseTransform->_translation._e[0] = v25 * v20;
  p_baseTransform->_translation._e[1] = v25 * v21;
  p_baseTransform->_translation._e[2] = v25 * v22;
  long long v27 = *(_OWORD *)&p_cameraFrame->_target.altitude._value;
  v31[0] = *(_OWORD *)&p_cameraFrame->_target.latitude._value;
  v31[1] = v27;
  double v33 = p_cameraFrame->_heading._value;
  uint64_t v32 = 0;
  uint64_t v34 = 0;
  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v28, (double *)v31);
  *(_OWORD *)p_baseTransform->_rotation._imaginary._e = v29;
  *(_OWORD *)&p_baseTransform->_rotation._imaginary._e[2] = v30;
}

- (void)_updateARContext
{
  uint64_t v2 = *((void *)self->_mapEngine + 132);
  if (v2 && !self->_transitionAnimation)
  {
    [(VKARCameraController *)self _updateBaseTransform];
    [(VKARCameraController *)self altitude];
    double v5 = -v4 / md::ARContext::planeHeight((md::ARContext *)v2);
    double v6 = self->_currentARTransform._rotation._imaginary._e[0];
    self->_arTransform._rotation._imaginary._e[0] = v6;
    self->_arTransform._rotation._imaginary._e[1] = self->_currentARTransform._rotation._imaginary._e[1];
    self->_arTransform._rotation._imaginary._e[2] = self->_currentARTransform._rotation._imaginary._e[2];
    self->_arTransform._rotation._double scalar = self->_currentARTransform._rotation._scalar;
    double v7 = self->_arTransform._translation._e[2]
       + (self->_currentARTransform._translation._e[2] - self->_lastARTransform._translation._e[2]) * v5;
    _Q3 = vmlaq_n_f64(*(float64x2_t *)self->_arTransform._translation._e, vsubq_f64(*(float64x2_t *)self->_currentARTransform._translation._e, *(float64x2_t *)self->_lastARTransform._translation._e), v5);
    *(float64x2_t *)self->_arTransform._translation._e = _Q3;
    self->_arTransform._translation._e[2] = v7;
    p_offsetTransform = &self->_offsetTransform;
    double v11 = self->_offsetTransform._rotation._imaginary._e[2];
    double scalar = self->_offsetTransform._rotation._scalar;
    double v12 = self->_baseTransform._translation._e[2];
    double v13 = self->_baseTransform._rotation._imaginary._e[0];
    double v14 = self->_baseTransform._rotation._imaginary._e[1];
    double v15 = self->_baseTransform._rotation._imaginary._e[2];
    double v16 = self->_baseTransform._rotation._scalar;
    double v17 = self->_offsetTransform._rotation._imaginary._e[0];
    double v18 = self->_offsetTransform._rotation._imaginary._e[1];
    _D7 = v13 * scalar + v17 * v16 + v18 * v15 - v11 * v14;
    double v20 = v18 * v16 - (v17 * v15 - v14 * scalar) + v11 * v13;
    double v21 = v15 * scalar + v17 * v14 - v18 * v13 + v11 * v16;
    double v22 = -(v17 * v13 + v18 * v14 + v11 * v15 - v16 * scalar);
    double v24 = self->_baseTransform._translation._e[0];
    double v23 = self->_baseTransform._translation._e[1];
    double v25 = -(v23 * v11 - v12 * v18) - (v23 * v11 - v12 * v18);
    double v26 = -(v12 * v17 - v24 * v11) - (v12 * v17 - v24 * v11);
    double v27 = -(v24 * v18 - v23 * v17) - (v24 * v18 - v23 * v17);
    double v28 = self->_arTransform._rotation._imaginary._e[1];
    double v29 = self->_arTransform._rotation._imaginary._e[2];
    double v30 = self->_arTransform._rotation._scalar;
    double v31 = v29 * v20 - (v28 * v21 - v22 * v6) + v30 * _D7;
    double v32 = v21 * v6 + v28 * v22 - v29 * _D7 + v30 * v20;
    double v33 = v29 * v22 - (v20 * v6 - v28 * _D7) + v30 * v21;
    double v34 = _D7 * v6 + v28 * v20 + v29 * v21;
    double v35 = vmuld_lane_f64(v21, _Q3, 1);
    double v36 = vmlad_n_f64(-(_D7 * v7), v21, _Q3.f64[0]);
    __asm { FMLA            D12, D7, V3.D[1] }
    double v42 = -(v35 - v20 * v7) - (v35 - v20 * v7);
    double v43 = v36 + v36;
    double v44 = _D12 + _D12;
    double v45 = v23
        + self->_offsetTransform._translation._e[1]
        + _Q3.f64[1]
        + v25 * v11
        + v42 * v21
        + v43 * v22
        + v26 * scalar
        - (v44 * _D7
         + v27 * v17);
    double v46 = v12 + self->_offsetTransform._translation._e[2];
    double v66 = v24
        + self->_offsetTransform._translation._e[0]
        + _Q3.f64[0]
        + v25 * scalar
        + v42 * v22
        + v44 * v20
        + v27 * v18
        - (v43 * v21
         + v26 * v11);
    double v67 = v45;
    double v68 = v46 + v7 + v43 * _D7 + v44 * v22 + v26 * v17 + v27 * scalar - (v25 * v18 + v42 * v20);
    *(double *)&long long v69 = v31;
    *((double *)&v69 + 1) = v32;
    *(double *)&long long v70 = v33;
    *((double *)&v70 + 1) = -(v34 - v30 * v22);
    [(VKARCameraController *)self _intersectAndResolveWorldCollision:&v66];
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    double v53 = 1.0 / sqrt(v66 * v66 + v67 * v67 + v68 * v68);
    double v54 = v53 * v66;
    double v55 = v53 * v67;
    double v56 = v53 * v68;
    [(VKARCameraController *)self altitude];
    if (v57 >= 50.0)
    {
      if (v57 > 3000.0)
      {
        double v59 = v57 + -3000.0;
        double v48 = v48 - v54 * v59;
        double v50 = v50 - v55 * v59;
        double v52 = v52 - v56 * v59;
      }
    }
    else
    {
      double v58 = 50.0 - v57;
      double v48 = v48 + v54 * v58;
      double v50 = v50 + v55 * v58;
      double v52 = v52 + v56 * v58;
    }
    double v66 = v66 + v48;
    double v60 = v66;
    double v67 = v67 + v50;
    double v61 = v67;
    double v62 = self->_offsetTransform._translation._e[1];
    double v63 = p_offsetTransform->_translation._e[0] + v48;
    double v68 = v68 + v52;
    double v64 = v68;
    p_offsetTransform->_translation._e[0] = v63;
    self->_offsetTransform._translation._e[1] = v62 + v50;
    self->_offsetTransform._translation._e[2] = self->_offsetTransform._translation._e[2] + v52;
    long double v65 = sqrt(v60 * v60 + v61 * v61 + v64 * v64)
        - cos(self->_cameraFrame._pitch._value) * self->_cameraFrame._distanceFromTarget._value;
    *(long double *)(v2 + 72) = v65 * v54;
    *(long double *)(v2 + 80) = v65 * v55;
    *(long double *)(v2 + 88) = v65 * v56;
    *(_OWORD *)(v2 + 40) = v69;
    *(_OWORD *)(v2 + 56) = v70;
    *(double *)(v2 + 16) = v60;
    *(double *)(v2 + 24) = v61;
    *(double *)(v2 + 32) = v64;
    altitude::GlobeView::setPerspective((uint64_t)self->_globeView, &self->_fovy._value);
    self->_lastARTransform._rotation._imaginary._e[0] = self->_currentARTransform._rotation._imaginary._e[0];
    self->_lastARTransform._rotation._imaginary._e[1] = self->_currentARTransform._rotation._imaginary._e[1];
    self->_lastARTransform._rotation._imaginary._e[2] = self->_currentARTransform._rotation._imaginary._e[2];
    self->_lastARTransform._rotation._double scalar = self->_currentARTransform._rotation._scalar;
    self->_lastARTransform._translation._e[0] = self->_currentARTransform._translation._e[0];
    self->_lastARTransform._translation._e[1] = self->_currentARTransform._translation._e[1];
    self->_lastARTransform._translation._e[2] = self->_currentARTransform._translation._e[2];
  }
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  mapEngine = self->_mapEngine;
  double v6 = (int8x8_t *)mapEngine[140];
  int8x8_t v7 = v6[2];
  if (v7)
  {
    a3 = COERCE_DOUBLE(vcnt_s8(v7));
    LOWORD(a3) = vaddlv_u8(*(uint8x8_t *)&a3);
    if (LODWORD(a3) > 1uLL)
    {
      uint64_t v8 = 0x17767EADC5B287BLL;
      if (*(void *)&v7 <= 0x17767EADC5B287BuLL) {
        uint64_t v8 = 0x17767EADC5B287BuLL % *(void *)&v7;
      }
    }
    else
    {
      uint64_t v8 = (*(void *)&v7 - 1) & 0x17767EADC5B287BLL;
    }
    double v9 = *(void **)(*(void *)&v6[1] + 8 * v8);
    if (v9)
    {
      __double2 v10 = (void *)*v9;
      if (v10)
      {
        if (LODWORD(a3) < 2uLL)
        {
          uint64_t v11 = *(void *)&v7 - 1;
          while (1)
          {
            uint64_t v13 = v10[1];
            if (v13 == 0x17767EADC5B287BLL)
            {
              if (v10[2] == 0x17767EADC5B287BLL) {
                goto LABEL_22;
              }
            }
            else if ((v13 & v11) != v8)
            {
              goto LABEL_24;
            }
            __double2 v10 = (void *)*v10;
            if (!v10) {
              goto LABEL_24;
            }
          }
        }
        do
        {
          unint64_t v12 = v10[1];
          if (v12 == 0x17767EADC5B287BLL)
          {
            if (v10[2] == 0x17767EADC5B287BLL)
            {
LABEL_22:
              uint64_t v14 = v10[5];
              if (v14) {
                *(_DWORD *)(v14 + 288) = 0;
              }
              break;
            }
          }
          else
          {
            if (v12 >= *(void *)&v7) {
              v12 %= *(void *)&v7;
            }
            if (v12 != v8) {
              break;
            }
          }
          __double2 v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
LABEL_24:
  uint64_t v15 = mapEngine[132];
  -[VKARCameraController updateWithARSession:](self, "updateWithARSession:", *(void *)(v15 + 104), a3);
  transitionAnimation = self->_transitionAnimation;
  if (transitionAnimation)
  {
    if (![(VKAnimation *)transitionAnimation running])
    {
      id v17 = *(id *)(v15 + 104);
      if (v17)
      {
        double v18 = v17;
        double v19 = [*(id *)(v15 + 104) currentFrame];

        if (v19)
        {
          md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->_transitionAnimation->super);
          double v20 = +[VKDebugSettings sharedSettings];
          int v21 = [v20 arRenderAtNativeRate];

          uint64_t v22 = v21 ? -1 : 60;
          double v23 = [(VKCameraController *)self runLoopController];
          v23->double var1 = v22;
          uint64_t var0 = (uint64_t)v23->var0;
          if (var0)
          {
            if (!**(unsigned char **)(var0 + 1056)) {
              md::MapEngine::setDisplayRate(var0, v22);
            }
          }
        }
      }
    }
  }
  uint64_t v25 = *(void *)[(VKCameraController *)self runLoopController];
  if (v25)
  {
    char v26 = 4;
    md::MapEngine::setNeedsTick(v25, &v26);
  }
}

- (void)updateWithARSession:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    double v6 = [v4 currentFrame];
    if (v6)
    {
      [(VKARCameraController *)self _transformFromARCamera:v5];
      *(_OWORD *)&self->_currentARTransform._translation._e[2] = v15;
      *(_OWORD *)&self->_currentARTransform._rotation._imaginary._e[1] = v16;
      self->_currentARTransform._rotation._double scalar = v17;
      *(_OWORD *)self->_currentARTransform._translation._e = v14;
      int8x8_t v7 = [v5 configuration];
      uint64_t v8 = [v7 videoFormat];
      double v9 = [v8 deviceFormat];

      uint64_t v10 = softLinkCMVideoFormatDescriptionGetDimensions[0]((const opaqueCMFormatDescription *)[v9 formatDescription]);
      [v9 videoFieldOfView];
      long double v12 = tan(v11 * 0.00872664626);
      *(float *)&long double v12 = (double)(int)v10 / (v12 + v12);
      long double v13 = atan((double)SHIDWORD(v10) / (*(float *)&v12 + *(float *)&v12));
      self->_fovy._double value = v13 + v13;
      [(VKARCameraController *)self _updateARContext];
    }
  }
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  id v4 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v7 = *(void *)a3.__ptr_;
  uint64_t v8 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v6.receiver = self;
  v6.super_class = (Class)VKARCameraController;
  -[VKScreenCameraController setCamera:](&v6, sel_setCamera_, &v7, a3.__cntrl_);
  double v5 = v8;
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  [(VKARCameraController *)self updateGlobeFromCamera];
}

- (void)setMaxZoomLevel:(double)a3
{
  self->_maxZoomLevel = a3;
}

- (void)setCurrentZoomLevel:(double)a3
{
  self->_currentZoomLevel = a3;
}

- (double)currentZoomLevel
{
  return self->_currentZoomLevel;
}

- (double)maximumZoomLevel
{
  return self->_maxZoomLevel;
}

- (double)minimumZoomLevel
{
  return 1.0;
}

- (double)_fovAdjustment
{
  double value = self->_fovy._value;
  {
    double v5 = value;
    double value = v5;
    if (v4)
    {
      -[VKARCameraController _fovAdjustment]::tanHalfStandardFovY = 0x3FD12612A0540B8FLL;
      double value = v5;
    }
  }
  return tan(value * 0.5) / *(double *)&-[VKARCameraController _fovAdjustment]::tanHalfStandardFovY;
}

- (double)pitch
{
  return *(double *)(*((void *)self->_globeView + 9) + 40) * 57.2957795;
}

- (double)heading
{
  float v2 = *(double *)(*((void *)self->_globeView + 9) + 48);
  if (v2 > 3.14159265)
  {
    float v3 = v2 + -6.28318531;
    float v2 = v3;
  }
  return v2 * -57.2957795;
}

- (double)altitude
{
  double v4 = self->_offsetTransform._rotation._imaginary._e[2];
  double scalar = self->_offsetTransform._rotation._scalar;
  double v6 = self->_baseTransform._translation._e[2];
  double v5 = self->_baseTransform._rotation._imaginary._e[0];
  double v7 = self->_baseTransform._rotation._imaginary._e[1];
  double v8 = self->_baseTransform._rotation._imaginary._e[2];
  double v9 = self->_baseTransform._rotation._scalar;
  double v11 = self->_offsetTransform._rotation._imaginary._e[0];
  double v10 = self->_offsetTransform._rotation._imaginary._e[1];
  double v12 = v5 * scalar + v11 * v9 + v10 * v8 - v4 * v7;
  double v13 = v10 * v9 - (v11 * v8 - v7 * scalar) + v4 * v5;
  double v14 = v8 * scalar + v11 * v7 - v10 * v5 + v4 * v9;
  double v15 = -(v11 * v5 + v10 * v7 + v4 * v8 - v9 * scalar);
  double v17 = self->_baseTransform._translation._e[0];
  double v16 = self->_baseTransform._translation._e[1];
  double v18 = -(v16 * v4 - v6 * v10) - (v16 * v4 - v6 * v10);
  double v19 = -(v6 * v11 - v17 * v4) - (v6 * v11 - v17 * v4);
  double v20 = -(v17 * v10 - v16 * v11) - (v17 * v10 - v16 * v11);
  double v22 = self->_arTransform._translation._e[1];
  double v21 = self->_arTransform._translation._e[2];
  double v23 = self->_arTransform._translation._e[0];
  double v24 = -(v22 * v14 - v21 * v13) - (v22 * v14 - v21 * v13);
  double v25 = -(v21 * v12 - v23 * v14) - (v21 * v12 - v23 * v14);
  double v26 = -(v23 * v13 - v22 * v12) - (v23 * v13 - v22 * v12);
  long double v27 = self->_offsetTransform._translation._e[0]
      + v17
      + v18 * scalar
      + v20 * v10
      + v23
      + v24 * v15
      + v26 * v13
      - (v19 * v4
       + v25 * v14);
  long double v28 = self->_offsetTransform._translation._e[1]
      + v16
      + v18 * v4
      + v19 * scalar
      + v22
      + v24 * v14
      + v25 * v15
      - (v20 * v11
       + v26 * v12);
  long double v29 = self->_offsetTransform._translation._e[2]
      + v6
      + v19 * v11
      + v20 * scalar
      + v21
      + v25 * v12
      + v26 * v15
      - (v18 * v10
       + v24 * v13);
  double v30 = sqrt(v27 * v27 + v28 * v28);
  double v31 = atan2(v29, v30 * 0.996647189);
  long double v32 = atan2(v28, v27);
  __double2 v33 = __sincos_stret(v31);
  double v34 = atan2(v29 + v33.__sinval * v33.__sinval * 42841.3115 * v33.__sinval, v30 + v33.__cosval * v33.__cosval * -42697.6727 * v33.__cosval);
  __double2 v35 = __sincos_stret(v34);
  v38[0] = v34;
  v38[1] = v32;
  double v37 = 0.0;
  altitude::IntersectorHeight::heightAtLatLon(*((void *)self->_globeView + 89), v38, &v37, 0xEu);
  return v30 / v35.__cosval + -6378137.0 / sqrt(v35.__sinval * v35.__sinval * -0.00669437999 + 1.0) - v37;
}

- (double)distanceFromCenterCoordinate
{
  return *(double *)(*((void *)self->_globeView + 9) + 32);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double v2 = self->_currentCoordinate.latitude._value * 57.2957795;
  double v3 = self->_currentCoordinate.longitude._value * 57.2957795;
  result.double var1 = v3;
  result.uint64_t var0 = v2;
  return result;
}

- (id)mapRegion
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F64700]);
  __p = 0;
  double v46 = 0;
  uint64_t v47 = 0;
  globeView = self->_globeView;
  if (!globeView || (altitude::GlobeView::getVisibleArea((uint64_t)globeView, (long double **)&__p) & 1) == 0)
  {
    [v3 setEastLng:-180.0];
    [v3 setWestLng:-180.0];
    double v14 = -180.0;
    [v3 setNorthLat:-180.0];
    goto LABEL_26;
  }
  double v6 = (double *)__p;
  if (__p != v46)
  {
    unint64_t v7 = v46 - (unsigned char *)__p - 16;
    uint64_t v8 = (v7 >> 4) + 1;
    if (v7 > 0x2F)
    {
      float64x2_t v16 = (float64x2_t)vdupq_n_s64(0x47EFFFFFE0000000uLL);
      double v17 = (const double *)((char *)__p + 32);
      uint64_t v18 = v8 & 0x1FFFFFFFFFFFFFFCLL;
      float64x2_t v19 = v16;
      float64x2_t v20 = v16;
      float64x2_t v21 = (float64x2_t)vdupq_n_s64(0xC7EFFFFFE0000000);
      float64x2_t v22 = v16;
      float64x2_t v23 = v21;
      float64x2_t v24 = v21;
      float64x2_t v25 = v21;
      do
      {
        double v26 = v17 - 4;
        float64x2x2_t v49 = vld2q_f64(v26);
        float64x2x2_t v50 = vld2q_f64(v17);
        float64x2_t v20 = vminnmq_f64(v20, v49.val[1]);
        float64x2_t v22 = vminnmq_f64(v22, v50.val[1]);
        float64x2_t v16 = vminnmq_f64(v16, v49.val[0]);
        float64x2_t v19 = vminnmq_f64(v19, v50.val[0]);
        float64x2_t v24 = vmaxnmq_f64(v24, v49.val[1]);
        float64x2_t v25 = vmaxnmq_f64(v25, v50.val[1]);
        float64x2_t v21 = vmaxnmq_f64(v21, v49.val[0]);
        float64x2_t v23 = vmaxnmq_f64(v23, v50.val[0]);
        v17 += 8;
        v18 -= 4;
      }
      while (v18);
      double v12 = vmaxnmvq_f64(vmaxnmq_f64(v24, v25));
      double v9 = vmaxnmvq_f64(vmaxnmq_f64(v21, v23));
      double v11 = vminnmvq_f64(vminnmq_f64(v20, v22));
      double v10 = vminnmvq_f64(vminnmq_f64(v16, v19));
      if (v8 == (v8 & 0x1FFFFFFFFFFFFFFCLL))
      {
LABEL_13:
        double v15 = v9 * 57.2957795;
        double v14 = v10 * 57.2957795;
        double v5 = v12 - v11;
        if (v12 - v11 > 3.14159265)
        {
          if (v7 > 0x3F)
          {
            uint64_t v29 = v8 & 3;
            if ((v8 & 3) == 0) {
              uint64_t v29 = 4;
            }
            uint64_t v30 = v8 - v29;
            uint64_t v31 = 16 * v30;
            float64x2_t v32 = (float64x2_t)vdupq_n_s64(0xC7EFFFFFE0000000);
            float64x2_t v33 = (float64x2_t)vdupq_n_s64(0x47EFFFFFE0000000uLL);
            double v34 = (const double *)((char *)__p + 40);
            float64x2_t v35 = (float64x2_t)vdupq_n_s64(0xC01921FB54442D18);
            float64x2_t v36 = v33;
            float64x2_t v37 = v32;
            do
            {
              double v38 = v34 - 4;
              unsigned long long v39 = (unsigned __int128)vld2q_f64(v38);
              unsigned long long v40 = (unsigned __int128)vld2q_f64(v34);
              float64x2_t v41 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64((float64x2_t)v39), (int8x16_t)vaddq_f64((float64x2_t)v39, v35), (int8x16_t)v39);
              float64x2_t v42 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64((float64x2_t)v40), (int8x16_t)vaddq_f64((float64x2_t)v40, v35), (int8x16_t)v40);
              float64x2_t v33 = vminnmq_f64(v33, v41);
              float64x2_t v36 = vminnmq_f64(v36, v42);
              float64x2_t v32 = vmaxnmq_f64(v32, v41);
              float64x2_t v37 = vmaxnmq_f64(v37, v42);
              v34 += 8;
              v30 -= 4;
            }
            while (v30);
            double v6 = (double *)((char *)__p + v31);
            double v12 = vmaxnmvq_f64(vmaxnmq_f64(v32, v37));
            double v5 = vminnmvq_f64(vminnmq_f64(v33, v36));
          }
          else
          {
            double v12 = -3.40282347e38;
            double v5 = 3.40282347e38;
          }
          do
          {
            double v43 = v6[1];
            if (v43 > 0.0) {
              double v43 = v43 + -6.28318531;
            }
            double v5 = fmin(v5, v43);
            double v12 = fmax(v12, v43);
            v6 += 2;
          }
          while (v6 != (double *)v46);
          double v11 = v5 + 6.28318531;
        }
        goto LABEL_25;
      }
      double v13 = (double *)((char *)__p + 16 * (v8 & 0x1FFFFFFFFFFFFFFCLL));
    }
    else
    {
      double v9 = -3.40282347e38;
      double v10 = 3.40282347e38;
      double v11 = 3.40282347e38;
      double v12 = -3.40282347e38;
      double v13 = (double *)__p;
    }
    do
    {
      double v28 = *v13;
      double v27 = v13[1];
      v13 += 2;
      double v11 = fmin(v11, v27);
      double v10 = fmin(v10, v28);
      double v12 = fmax(v12, v27);
      double v9 = fmax(v9, v28);
    }
    while (v13 != (double *)v46);
    goto LABEL_13;
  }
  double v11 = 3.40282347e38;
  double v12 = -3.40282347e38;
  double v15 = -1.94967423e40;
  double v14 = 1.94967423e40;
LABEL_25:
  objc_msgSend(v3, "setEastLng:", v12 * 57.2957795, v5);
  [v3 setWestLng:v11 * 57.2957795];
  [v3 setNorthLat:v15];
LABEL_26:
  [v3 setSouthLat:v14];
  if (__p) {
    operator delete(__p);
  }
  return v3;
}

- (Matrix<double,)_intersectAndResolveWorldCollision:(const void *)a3
{
  v100[2] = *(double *)MEMORY[0x1E4F143B8];
  globeView = (void *)self->_globeView;
  uint64_t v6 = globeView[9];
  double v7 = *(double *)(v6 + 32);
  double v8 = 0.0;
  if (cos(*(long double *)(v6 + 40)) * v7 >= 500.0) {
    goto LABEL_41;
  }
  long double v9 = *((double *)a3 + 2);
  double v94 = *(double *)a3;
  double v93 = *((double *)a3 + 1);
  double v10 = sqrt(v94 * v94 + v93 * v93);
  double v11 = atan2(v9, v10 * 0.996647189);
  __double2 v12 = __sincos_stret(v11);
  double v92 = v9;
  double v13 = atan2(v9 + v12.__sinval * v12.__sinval * 42841.3115 * v12.__sinval, v10 + v12.__cosval * v12.__cosval * -42697.6727 * v12.__cosval);
  __double2 v14 = __sincos_stret(v13);
  double sinval = v14.__sinval;
  double cosval = v14.__cosval;
  uint64_t v17 = globeView[89];
  if (!v17)
  {
    double v95 = *(double *)&globeView;
    if (!altitude::Intersector::intersectAtPosition((uint64_t)&v95, (float64x2_t *)a3, &v96))
    {
LABEL_41:
      double v80 = 0.0;
      double v81 = 0.0;
      goto LABEL_42;
    }
    double v56 = -1.79769313e308;
    goto LABEL_33;
  }
  double v88 = v10;
  double v18 = *((double *)a3 + 3);
  double v19 = *((double *)a3 + 4);
  double v20 = *((double *)a3 + 5);
  double v21 = *((double *)a3 + 6);
  double v22 = (v19 + v19) * v19;
  double v23 = v20 * (v18 + v18);
  double v89 = -(v21 * (v18 + v18) - (v19 + v19) * v20);
  double v90 = v21 * (v19 + v19) + v23;
  double v91 = 1.0 - (v22 + (v18 + v18) * v18);
  double v95 = -1.79769313e308;
  double v84 = v94 + v90 * 5.0;
  double v85 = v93 + v89 * 5.0;
  double v83 = 5.0 - (v22 + (v20 + v20) * v20) * 5.0;
  double v24 = ((v18 + v18) * v19 + (v20 + v20) * v21) * 5.0;
  double v86 = v92 + v91 * 5.0;
  double v87 = (v23 - v21 * (v19 + v19)) * 5.0;
  double v25 = sqrt((v83 + v84) * (v83 + v84) + (v85 + v24) * (v85 + v24));
  double v26 = atan2(v87 + v86, v25 * 0.996647189);
  long double v27 = atan2(v85 + v24, v83 + v84);
  __double2 v28 = __sincos_stret(v26);
  v96.f64[0] = atan2(v87 + v86 + v28.__sinval * v28.__sinval * 42841.3115 * v28.__sinval, v25 - v28.__cosval * v28.__cosval * 42697.6727 * v28.__cosval);
  v96.f64[1] = v27;
  long double v29 = v85 - v24;
  double v30 = sqrt((v84 - v83) * (v84 - v83) + v29 * v29);
  double v31 = atan2(v86 - v87, v30 * 0.996647189);
  long double v32 = atan2(v29, v84 - v83);
  __double2 v33 = __sincos_stret(v31);
  v97[0] = atan2(v86 - v87 + v33.__sinval * v33.__sinval * 42841.3115 * v33.__sinval, v30 - v33.__cosval * v33.__cosval * 42697.6727 * v33.__cosval);
  v97[1] = v32;
  long double v34 = v94 - v90 * 2.5;
  long double v35 = v93 - v89 * 2.5;
  double v36 = sqrt(v34 * v34 + v35 * v35);
  double v37 = atan2(v92 - v91 * 2.5, v36 * 0.996647189);
  long double v38 = atan2(v35, v34);
  __double2 v39 = __sincos_stret(v37);
  v98[0] = atan2(v92 - v91 * 2.5 + v39.__sinval * v39.__sinval * 42841.3115 * v39.__sinval, v36 - v39.__cosval * v39.__cosval * 42697.6727 * v39.__cosval);
  v98[1] = v38;
  long double v40 = v94 + v90 * 15.0;
  long double v41 = v93 + v89 * 15.0;
  double v42 = sqrt(v40 * v40 + v41 * v41);
  double v43 = atan2(v92 + v91 * 15.0, v42 * 0.996647189);
  long double v44 = atan2(v41, v40);
  __double2 v45 = __sincos_stret(v43);
  v99[0] = atan2(v92 + v91 * 15.0 + v45.__sinval * v45.__sinval * 42841.3115 * v45.__sinval, v42 - v45.__cosval * v45.__cosval * 42697.6727 * v45.__cosval);
  v99[1] = v44;
  long double v46 = v94 + v90 * 30.0;
  long double v47 = v93 + v89 * 30.0;
  long double v48 = v92 + v91 * 30.0;
  double v49 = sqrt(v46 * v46 + v47 * v47);
  double v50 = atan2(v48, v49 * 0.996647189);
  long double v51 = atan2(v47, v46);
  __double2 v52 = __sincos_stret(v50);
  v100[0] = atan2(v48 + v52.__sinval * v52.__sinval * 42841.3115 * v52.__sinval, v49 - v52.__cosval * v52.__cosval * 42697.6727 * v52.__cosval);
  v100[1] = v51;
  int v53 = altitude::IntersectorHeight::heightAtLatLon(v17, v96.f64, &v95, 0xEu);
  int v54 = v53;
  if (v95 > -1.79769313e308 && v53 == 0) {
    double v56 = v95;
  }
  else {
    double v56 = -1.79769313e308;
  }
  int v57 = altitude::IntersectorHeight::heightAtLatLon(v17, v97, &v95, 0xEu);
  int v58 = v57;
  if (v56 < v95 && v57 == 0) {
    double v56 = v95;
  }
  int v60 = altitude::IntersectorHeight::heightAtLatLon(v17, v98, &v95, 0xEu);
  int v61 = v60;
  if (v56 < v95 && v60 == 0) {
    double v56 = v95;
  }
  int v63 = altitude::IntersectorHeight::heightAtLatLon(v17, v99, &v95, 0xEu);
  int v64 = v63;
  if (v56 < v95 && v63 == 0) {
    double v56 = v95;
  }
  int v66 = altitude::IntersectorHeight::heightAtLatLon(v17, v100, &v95, 0xEu);
  int v67 = v66;
  if (v56 < v95 && v66 == 0) {
    double v56 = v95;
  }
  double v95 = *(double *)&self->_globeView;
  double v8 = 0.0;
  if (altitude::Intersector::intersectAtPosition((uint64_t)&v95, (float64x2_t *)a3, &v96))
  {
    double cosval = v14.__cosval;
    double v10 = v88;
    double sinval = v14.__sinval;
LABEL_33:
    double v69 = v97[0];
    double v70 = sqrt(v96.f64[0] * v96.f64[0] + v96.f64[1] * v96.f64[1]);
    double v71 = atan2(v97[0], v70 * 0.996647189);
    __double2 v72 = __sincos_stret(v71);
    double v73 = atan2(v69 + v72.__sinval * v72.__sinval * 42841.3115 * v72.__sinval, v70 + v72.__cosval * v72.__cosval * -42697.6727 * v72.__cosval);
    __double2 v74 = __sincos_stret(v73);
    double v56 = fmax(v56, v70 / v74.__cosval + -6378137.0 / sqrt(v74.__sinval * v74.__sinval * -0.00669437999 + 1.0));
    double v75 = 1.0;
    goto LABEL_34;
  }
  double cosval = v14.__cosval;
  double v10 = v88;
  double sinval = v14.__sinval;
  double v75 = 1.0;
  if (v67 || v64 || v61 || v58 || v54) {
    goto LABEL_41;
  }
LABEL_34:
  double v76 = v10 / cosval + -6378137.0 / sqrt(v75 + sinval * sinval * -0.00669437999);
  if (v76 >= v56 + 35.0) {
    goto LABEL_41;
  }
  double v77 = *((double *)a3 + 1);
  double v78 = *((double *)a3 + 2);
  double v79 = (v56 + 35.0 - v76) / sqrt(*(double *)a3 * *(double *)a3 + v77 * v77 + v78 * v78);
  double v8 = v79 * *(double *)a3;
  double v80 = v79 * v77;
  double v81 = v79 * v78;
LABEL_42:
  double v82 = v8;
  result._e[2] = v81;
  result._e[1] = v80;
  result._e[0] = v82;
  return result;
}

- (double)maxPitch
{
  return 0.0;
}

- (double)minPitch
{
  return 0.0;
}

- (BOOL)isFullyPitched
{
  return 0;
}

- (BOOL)isPitched
{
  return 0;
}

- (Geocentric<double>)cameraPosition
{
  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v5, (double *)(*((void *)self->_globeView + 9) + 8));
  double v2 = v5[0];
  double v3 = v5[1];
  double v4 = v5[2];
  result._e[2] = v4;
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (void)updateGlobeFromCamera
{
  uint64_t v3 = *((void *)self->_mapEngine + 132);
  uint64_t v4 = *((void *)self->_globeView + 9);
  p_cameraFrame = &self->_cameraFrame;
  long long v6 = *(_OWORD *)(v4 + 24);
  long long v7 = *(_OWORD *)(v4 + 40);
  long long v8 = *(_OWORD *)(v4 + 8);
  self->_cameraFrame._roll._double value = *(double *)(v4 + 56);
  *(_OWORD *)&self->_cameraFrame._target.altitude._double value = v6;
  *(_OWORD *)&self->_cameraFrame._pitch._double value = v7;
  *(_OWORD *)&self->_cameraFrame._target.latitude._double value = v8;
  long double v9 = (double *)*((void *)self->_globeView + 9);
  double v11 = v9[46];
  double v10 = v9[47];
  if (v10 >= v11)
  {
    double v17 = v9[57];
  }
  else
  {
    double v12 = v10 * v11;
    double v13 = v10 / v11;
    if (v12 <= 0.0) {
      double v14 = 1.0;
    }
    else {
      double v14 = v13;
    }
    long double v15 = tan(v9[57] * 0.5);
    long double v16 = atan(v14 * v15);
    double v17 = v16 + v16;
  }
  self->_fovy._double value = v17;
  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric((double *)v19, &p_cameraFrame->_target.latitude._value);
  long long v18 = v19[2];
  *(_OWORD *)(v3 + 32) = v19[1];
  *(_OWORD *)(v3 + 48) = v18;
  *(void *)(v3 + 64) = v20;
  *(_OWORD *)(v3 + 16) = v19[0];
  [(VKARCameraController *)self _updateBaseTransform];
}

- (int64_t)tileSize
{
  return 256;
}

- (void)dealloc
{
  gestureCameraControllerBehavior = self->super._gestureCameraControllerBehavior;
  self->super._gestureCameraControllerBehavior = 0;

  [(VKAnimation *)self->_transitionAnimation stop];
  transitionAnimation = self->_transitionAnimation;
  self->_transitionAnimation = 0;

  v5.receiver = self;
  v5.super_class = (Class)VKARCameraController;
  [(VKScreenCameraController *)&v5 dealloc];
}

- (VKARCameraController)initWithTaskContext:(shared_ptr<md:(MapDataAccess *)a4 :(AnimationRunner *)a5 TaskContext>)a3 mapDataAccess:(RunLoopController *)a6 animationRunner:(id)a7 runLoopController:cameraDelegate:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  double v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)VKARCameraController;
  double v13 = [(VKScreenCameraController *)&v22 initWithMapDataAccess:cntrl animationRunner:a4 runLoopController:a5 cameraDelegate:v12];
  double v14 = v13;
  long double v15 = v13;
  if (v13)
  {
    double v17 = *(TaskContext **)ptr;
    uint64_t v16 = *((void *)ptr + 1);
    if (v16) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 8), 1uLL, memory_order_relaxed);
    }
    long long v18 = (std::__shared_weak_count *)v13->_taskContext.__cntrl_;
    v13->_taskContext.__ptr_ = v17;
    v13->_taskContext.__cntrl_ = (__shared_weak_count *)v16;
    if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
    v15->_globeView = 0;
    [(VKCameraController *)v15 setIsPitchEnabled:0];
    v15->_double height = 0.0;
    v15->_currentZoomLevel = 15.0;
    v15->_maxZoomLevel = 21.0;
    v15->_double altitudeOffset = 0.0;
    double v19 = [[VKARGestureCameraBehavior alloc] initWithARCameraController:v15];
    gestureCameraControllerBehavior = v15->super._gestureCameraControllerBehavior;
    v15->super._gestureCameraControllerBehavior = &v19->super;

    v15->_overrideARFieldOfView = 0;
    v15->_interfaceOrientation = 0;
    v14->_interfaceOrientationRotation._imaginary._e[0] = 0.0;
    v14->_interfaceOrientationRotation._imaginary._e[1] = 0.0;
    v14->_interfaceOrientationRotation._imaginary._e[2] = 0.0;
    v14->_interfaceOrientationRotation._double scalar = 1.0;
  }

  return v15;
}

@end