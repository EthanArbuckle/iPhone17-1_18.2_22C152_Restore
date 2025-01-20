@interface VKDaVinciCameraController
- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate;
- (BOOL)canEnter3DMode;
- (BOOL)isFullyPitched;
- (BOOL)isPitched;
- (BOOL)snapMapIfNecessary:(BOOL)a3;
- (BOOL)usesVKCamera;
- (Coordinate2D<geo::Radians,)_centerCoordinateForMapRegion:(id)a3;
- (Coordinate2D<geo::Radians,)centerCoordinateRad;
- (Unit<geo::RadianUnitDescription,)greatCircleMidPointLatitude:()Unit<geo:(double>)a3 :()Unit<geo:(double>)a4 :()Unit<geo:(double>)a5 :RadianUnitDescription RadianUnitDescription RadianUnitDescription fromLongitude:toLongitude:;
- (Unit<geo::RadianUnitDescription,)widestLatitudeForMapRegion:(id)a3;
- (VKDaVinciCameraController)initWithMapDataAccess:(void *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6 mapEngine:(void *)a7;
- (double)altitude;
- (double)currentZoomLevel;
- (double)distanceFromCenterCoordinate;
- (double)durationToAnimateToMapRegion:(id)a3;
- (double)earthRadiusAt:()Unit<geo:(double>)a3 :RadianUnitDescription;
- (double)geocAngleBetween:()Coordinate2D<geo:(double>)a3 :()Coordinate2D<geo:(double>)a4 :Radians Radians andCoordinate:;
- (double)heading;
- (double)maxPitch;
- (double)maximumZoomLevel;
- (double)minPitch;
- (double)minimumZoomLevel;
- (double)pitch;
- (double)topDownMinimumZoomLevel;
- (double)zoomForMapRegion:(id)a3;
- (float)idealPitchForNormalizedZoomLevel:(float)a3;
- (float)maxPitchForNormalizedZoomLevel:(float)a3;
- (float)maximumNormalizedZoomLevel;
- (float)minPitchForNormalizedZoomLevel:(float)a3;
- (float)minimumNormalizedZoomLevel;
- (id)createMoveToZoomOutZoomInFrameFunction:()CameraFrame<geo:(double> *)a3 :()CameraFrame<geo:(double> *)a4 :Radians Radians toLatLon:;
- (id)mapRegion;
- (int64_t)tileSize;
- (vector<geo::Coordinate2D<geo::Radians,)_getVisibleArea;
- (void)_updateCanEnter3DMode;
- (void)_updateIsPitched;
- (void)animateRegionWithDuration:(double)a3 timingFunction:(id)a4 stepHandler:(id)a5 completionHandler:(id)a6;
- (void)animateToRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5;
- (void)dealloc;
- (void)enter3DMode;
- (void)exit3DMode;
- (void)moveTo:()Coordinate2D<geo:(double>)a3 :(double)a4 Radians height:(BOOL)a5 useHeight:(double)a6 zoom:(double)a7 rotation:(double)a8 tilt:(double)a9 duration:(id)a10 timingCurve:(id)a11 completion:;
- (void)moveTo:()Coordinate2D<geo:(double>)a3 :(double)a4 Radians zoom:(double)a5 rotation:(double)a6 tilt:(double)a7 duration:(id)a8 timingCurve:(id)a9 completion:;
- (void)moveToZoomOutZoomInTransition:()Coordinate2D<geo:(double>)a3 :(double)a4 Radians height:(BOOL)a5 useHeight:(double)a6 zoom:(double)a7 rotation:(double)a8 tilt:(double)a9 duration:(id)a10 timingCurve:(id)a11 completion:;
- (void)panWithOffset:(CGPoint)a3 relativeToScreenPoint:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6 completionHandler:(id)a7;
- (void)pitch:(CGPoint)a3 translation:(double)a4;
- (void)rotate:(double)a3 atScreenPoint:(CGPoint)a4;
- (void)rotateTo:(double)a3 animated:(BOOL)a4;
- (void)setCamera:(shared_ptr<gdc::Camera>)a3;
- (void)setCenterCoordinate3D:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10;
- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10;
- (void)setCenterCoordinateDistanceRange:(id *)a3 duration:(double)a4 timingFunction:(id)a5;
- (void)setGesturing:(BOOL)a3;
- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 timingCurve:(id)a7 completion:(id)a8;
- (void)setRegionRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5;
- (void)setYaw:(double)a3 animated:(BOOL)a4;
- (void)startPinchingWithFocusPoint:(CGPoint)a3;
- (void)startTrackingAnnotation:(id)a3 trackHeading:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7;
- (void)stopGlobeAnimations;
- (void)stopPinchingWithFocusPoint:(CGPoint)a3;
- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5;
- (void)tiltTo:(double)a3 animated:(BOOL)a4 exaggerate:(BOOL)a5;
- (void)updateCameraLimits;
- (void)updateCameraManager;
- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5;
- (void)updateState;
- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4;
- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5;
- (void)zoomToDistance:(CGPoint)a3 distance:(double)a4 time:(double)a5;
- (void)zoomToDistance:(CGPoint)a3 distance:(double)a4 time:(double)a5 completionHandler:(id)a6;
@end

@implementation VKDaVinciCameraController

- (VKDaVinciCameraController)initWithMapDataAccess:(void *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6 mapEngine:(void *)a7
{
  id v12 = a6;
  v15.receiver = self;
  v15.super_class = (Class)VKDaVinciCameraController;
  v13 = [(VKScreenCameraController *)&v15 initWithMapDataAccess:a3 animationRunner:a4 runLoopController:a5 cameraDelegate:v12];
  if (v13)
  {
    v13->_mapEngine = a7;
    operator new();
  }

  return 0;
}

- (float)maxPitchForNormalizedZoomLevel:(float)a3
{
  v5 = +[VKDebugSettings sharedSettings];
  char v6 = [v5 relaxTiltLimits];

  if (v6) {
    return 1.4835;
  }
  uint64_t v8 = *((void *)self->_mapEngine + 149);
  if (!v8) {
    return 0.0;
  }
  return pitchForZ((void *)(v8 + 408), a3);
}

- (float)idealPitchForNormalizedZoomLevel:(float)a3
{
  uint64_t v3 = *((void *)self->_mapEngine + 149);
  if (v3) {
    return pitchForZ((void *)(v3 + 432), a3);
  }
  else {
    return 0.0;
  }
}

- (float)minPitchForNormalizedZoomLevel:(float)a3
{
  uint64_t v3 = *((void *)self->_mapEngine + 149);
  if (v3) {
    return pitchForZ((void *)(v3 + 384), a3);
  }
  else {
    return 0.0;
  }
}

- (double)topDownMinimumZoomLevel
{
  [(VKCameraController *)self camera];
  uint64_t v3 = [(VKDaVinciCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  double v4 = *(double *)(v14 + 368);
  float v5 = 0.0;
  if (v4 > 0.0)
  {
    float v6 = v4;
    float v7 = (float)v3;
    float v5 = log2f(v6 / v7);
  }
  float v8 = *(float *)(v16 + 88);
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v15->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v15);
  }
  if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v17->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v17);
  }
  float v9 = fmaxf(v8 + v5, 1.0);
  float v10 = v9 * 1000.0;
  BOOL v11 = v9 <= 25.0;
  float v12 = 25000.0;
  if (v11) {
    float v12 = v10;
  }
  return (float)(ceilf(v12) * 0.001);
}

- (double)currentZoomLevel
{
  [(VKCameraController *)self camera];
  float v4 = gdc::DisplayZoomLevel::centerZoomLevel((gdc::DisplayZoomLevel *)v15, v3);
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v16->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v16);
  }
  uint64_t v5 = [(VKDaVinciCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  double v6 = v15[46];
  float v7 = 0.0;
  if (v6 > 0.0)
  {
    float v8 = v6;
    float v9 = (float)v5;
    float v7 = log2f(v8 / v9);
  }
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v16->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v16);
  }
  float v10 = fmaxf(v4 + v7, 1.0);
  float v11 = v10 * 1000.0;
  BOOL v12 = v10 <= 25.0;
  float v13 = 25000.0;
  if (v12) {
    float v13 = v11;
  }
  return (float)(floorf(v13) * 0.001);
}

- (double)maximumZoomLevel
{
  [(VKCameraController *)self camera];
  uint64_t v3 = [(VKDaVinciCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  double v4 = *(double *)(v14 + 368);
  float v5 = 0.0;
  if (v4 > 0.0)
  {
    float v6 = v4;
    float v7 = (float)v3;
    float v5 = log2f(v6 / v7);
  }
  float v8 = *(float *)(v16 + 80);
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v15->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v15);
  }
  if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v17->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v17);
  }
  float v9 = fmaxf(v8 + v5, 1.0);
  float v10 = v9 * 1000.0;
  BOOL v11 = v9 <= 25.0;
  float v12 = 25000.0;
  if (v11) {
    float v12 = v10;
  }
  return (float)(floorf(v12) * 0.001);
}

- (double)minimumZoomLevel
{
  [(VKCameraController *)self camera];
  uint64_t v3 = [(VKDaVinciCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  double v4 = *(double *)(v14 + 368);
  float v5 = 0.0;
  if (v4 > 0.0)
  {
    float v6 = v4;
    float v7 = (float)v3;
    float v5 = log2f(v6 / v7);
  }
  float v8 = *(float *)(v16 + 84);
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v15->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v15);
  }
  if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v17->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v17);
  }
  float v9 = fmaxf(v8 + v5, 1.0);
  float v10 = v9 * 1000.0;
  BOOL v11 = v9 <= 25.0;
  float v12 = 25000.0;
  if (v11) {
    float v12 = v10;
  }
  return (float)(ceilf(v12) * 0.001);
}

- (void)updateCameraLimits
{
  [(VKCameraController *)self camera];
  if (v105[1] && !atomic_fetch_add((atomic_ullong *volatile)v105[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v105[1] + 16))(v105[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v105[1]);
    if (!v105[0]) {
      return;
    }
  }
  else if (!v105[0])
  {
    return;
  }
  [(VKCameraController *)self camera];
  double v120 = *((double *)v105[0] + 9);
  if (v105[1] && !atomic_fetch_add((atomic_ullong *volatile)v105[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v105[1] + 16))(v105[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v105[1]);
  }
  [(VKCameraController *)self camera];
  float v4 = gdc::DisplayZoomLevel::centerZoomLevel(v105[0], v3);
  if (v105[1] && !atomic_fetch_add((atomic_ullong *volatile)v105[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v105[1] + 16))(v105[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v105[1]);
  }
  uint64_t v5 = [(VKDaVinciCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  double v6 = *((double *)v105[0] + 46);
  float v7 = 0.0;
  if (v6 > 0.0)
  {
    float v8 = v6;
    float v9 = (float)v5;
    float v7 = log2f(v8 / v9);
  }
  float v10 = fminf(fmaxf(v4 + v7, 1.0), 25.0);
  if (v105[1] && !atomic_fetch_add((atomic_ullong *volatile)v105[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v105[1] + 16))(v105[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v105[1]);
  }
  uint64_t v11 = *((void *)self->_mapEngine + 149);
  double v12 = v10;
  float v13 = pitchForZ((void *)(v11 + 384), v10);
  float v14 = pitchForZ((void *)(v11 + 408), v12);
  [(VKCameraController *)self camera];
  double v15 = *((double *)v105[0] + 9);
  if (v105[1] && !atomic_fetch_add((atomic_ullong *volatile)v105[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v105[1] + 16))(v105[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v105[1]);
  }
  double v120 = v14;
  if (v15 > v13 != v14 > v13)
  {
    uint64_t v16 = [(VKCameraController *)self cameraDelegate];
    [v16 mapLayerCanEnter3DModeDidChange:v14 > v13];
  }
  [(VKDaVinciCameraController *)self minimumNormalizedZoomLevel];
  float v18 = v17;
  uint64_t v19 = [(VKDaVinciCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  double v20 = *((double *)v105[0] + 46);
  float v21 = 0.0;
  if (v20 > 0.0) {
    float v21 = log2((double)v19 / v20);
  }
  if (v105[1] && !atomic_fetch_add((atomic_ullong *volatile)v105[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v105[1] + 16))(v105[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v105[1]);
  }
  [(VKDaVinciCameraController *)self maximumNormalizedZoomLevel];
  float v23 = v22;
  uint64_t v24 = [(VKDaVinciCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  double v25 = *((double *)v105[0] + 46);
  float v26 = fminf(fmaxf(v23, 1.0), 25.0);
  float v27 = 0.0;
  if (v25 > 0.0) {
    float v27 = log2((double)v24 / v25);
  }
  float v28 = fmaxf(v26 + v27, 1.0);
  if (v105[1] && !atomic_fetch_add((atomic_ullong *volatile)v105[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v105[1] + 16))(v105[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v105[1]);
  }
  float v29 = fminf(v28, 25.0);
  mapEngine = self->_mapEngine;
  if (!mapEngine)
  {
    float v33 = v29;
    goto LABEL_75;
  }
  uint64_t v31 = mapEngine[112];
  if (!v31 || (uint64_t v32 = *(void *)(v31 + 272)) == 0)
  {
    float v33 = v29;
    goto LABEL_42;
  }
  float v33 = v29;
  if (!*(unsigned char *)(v32 + 344)) {
    goto LABEL_42;
  }
  uint64_t v34 = [(VKDaVinciCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  double v35 = *((double *)v105[0] + 46);
  float v36 = 0.0;
  if (v35 > 0.0) {
    float v36 = log2((double)v34 / v35);
  }
  float v37 = fmaxf(v36 + 25.0, 1.0);
  if (v105[1] && !atomic_fetch_add((atomic_ullong *volatile)v105[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v105[1] + 16))(v105[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v105[1]);
  }
  float v33 = fminf(v37, 25.0);
  mapEngine = self->_mapEngine;
  if (mapEngine)
  {
LABEL_42:
    v38 = (int8x8_t *)mapEngine[140];
    int8x8_t v39 = v38[2];
    if (v39)
    {
      uint8x8_t v40 = (uint8x8_t)vcnt_s8(v39);
      v40.i16[0] = vaddlv_u8(v40);
      if (v40.u32[0] > 1uLL)
      {
        unint64_t v41 = 0xEC9B77B4222D22FFLL;
        if (*(void *)&v39 <= 0xEC9B77B4222D22FFLL) {
          unint64_t v41 = 0xEC9B77B4222D22FFLL % *(void *)&v39;
        }
      }
      else
      {
        unint64_t v41 = (*(void *)&v39 - 1) & 0xEC9B77B4222D22FFLL;
      }
      v42 = *(void **)(*(void *)&v38[1] + 8 * v41);
      if (v42)
      {
        v43 = (void *)*v42;
        if (v43)
        {
          if (v40.u32[0] < 2uLL)
          {
            uint64_t v44 = *(void *)&v39 - 1;
            while (1)
            {
              uint64_t v46 = v43[1];
              if (v46 == 0xEC9B77B4222D22FFLL)
              {
                if (v43[2] == 0xEC9B77B4222D22FFLL) {
                  goto LABEL_66;
                }
              }
              else if ((v46 & v44) != v41)
              {
                goto LABEL_75;
              }
              v43 = (void *)*v43;
              if (!v43) {
                goto LABEL_75;
              }
            }
          }
          do
          {
            unint64_t v45 = v43[1];
            if (v45 == 0xEC9B77B4222D22FFLL)
            {
              if (v43[2] == 0xEC9B77B4222D22FFLL)
              {
LABEL_66:
                uint64_t v47 = v43[5];
                if (v47 && *(unsigned char *)(v47 + 56) && *(void *)(v47 + 568))
                {
                  double v48 = fmin(fmax(*(double *)(v47 + 584) * 1048576.0 + -0.5, 0.0), 1.0);
                  uint64_t v49 = [(VKDaVinciCameraController *)self tileSize];
                  [(VKCameraController *)self camera];
                  double v50 = *((double *)v105[0] + 46);
                  float v51 = 0.0;
                  if (v50 > 0.0) {
                    float v51 = log2((double)v49 / v50);
                  }
                  float v52 = v48;
                  float v53 = fminf(fmaxf(v51 + 20.0, 1.0), 25.0);
                  if (v105[1] && !atomic_fetch_add((atomic_ullong *volatile)v105[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
                  {
                    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v105[1] + 16))(v105[1]);
                    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v105[1]);
                  }
                  float v54 = 1.0 - cos(v52 * 3.14159265);
                  float v33 = v53 + (float)((float)(v54 * 0.5) * (float)(v29 - v53));
                }
                break;
              }
            }
            else
            {
              if (v45 >= *(void *)&v39) {
                v45 %= *(void *)&v39;
              }
              if (v45 != v41) {
                break;
              }
            }
            v43 = (void *)*v43;
          }
          while (v43);
        }
      }
    }
  }
LABEL_75:
  v116[0] = 0;
  char v118 = 0;
  v55 = [(VKCameraController *)self vkCamera];
  v56 = v55;
  if (v55)
  {
    [v55 minDistanceToGroundRestriction];
    if (LOBYTE(v105[0]))
    {
      v116[0] = 1;
      v117 = v105[1];
      LOBYTE(v105[0]) = 0;
    }
  }
  else
  {
    v105[0] = 0;
    v105[1] = 0;
  }

  v57 = [(VKCameraController *)self vkCamera];
  v58 = v57;
  if (v57)
  {
    [v57 maxDistanceToGroundRestriction];
    if (LOBYTE(v105[0]))
    {
      char v118 = 1;
      v119 = v105[1];
      LOBYTE(v105[0]) = 0;
    }
  }
  else
  {
    v105[0] = 0;
    v105[1] = 0;
  }

  uint64_t v59 = [(VKDaVinciCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  float v60 = fminf(fmaxf(fminf(fmaxf(v18, 1.0), 25.0) + v21, 1.0), 25.0);
  double v61 = *((double *)v105[0] + 46);
  double v114 = (double)v59;
  double v115 = v61;
  float v62 = 0.0;
  if (v61 > 0.0)
  {
    float v63 = v61;
    float v64 = (float)v59;
    float v62 = log2f(v63 / v64);
  }
  float v113 = fminf(fmaxf(v60 + v62, 1.0), 25.0);
  if (v105[1] && !atomic_fetch_add((atomic_ullong *volatile)v105[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v105[1] + 16))(v105[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v105[1]);
  }
  uint64_t v65 = [(VKDaVinciCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  double v66 = *((double *)v105[0] + 46);
  double v111 = (double)v65;
  double v112 = v66;
  float v67 = 0.0;
  if (v66 > 0.0)
  {
    float v68 = v66;
    float v69 = (float)v65;
    float v67 = log2f(v68 / v69);
  }
  float v110 = fminf(fmaxf(v33 + v67, 1.0), 25.0);
  if (v105[1] && !atomic_fetch_add((atomic_ullong *volatile)v105[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v105[1] + 16))(v105[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v105[1]);
  }
  [(VKCameraController *)self camera];
  uint64_t v70 = v103;
  [(VKCameraController *)self camera];
  double v72 = v100[46];
  double v71 = v100[47];
  if (v71 >= v72)
  {
    double v78 = v100[57];
  }
  else
  {
    double v73 = v71 * v72;
    double v74 = v71 / v72;
    if (v73 <= 0.0) {
      double v75 = 1.0;
    }
    else {
      double v75 = v74;
    }
    long double v76 = tan(v100[57] * 0.5);
    long double v77 = atan(v75 * v76);
    double v78 = v77 + v77;
  }
  double v102 = v78;
  [(VKCameraController *)self camera];
  double v79 = v97[46];
  double v80 = v97[47];
  if (v79 >= v80)
  {
    double v86 = v97[57];
  }
  else
  {
    double v81 = v80 * v79;
    double v82 = v79 / v80;
    if (v81 <= 0.0) {
      double v83 = 1.0;
    }
    else {
      double v83 = v82;
    }
    long double v84 = tan(v97[57] * 0.5);
    long double v85 = atan(v83 * v84);
    double v86 = v85 + v85;
  }
  double v99 = v86;
  [(VKCameraController *)self camera];
  v95[0] = 0.0;
  gdc::CameraLimits::CameraLimits((uint64_t)v105, (double *)(v70 + 8), &v102, &v99, (long double *)(*(void *)&v95[1] + 40), &v120, v95, (uint64_t)&v113, v120, (uint64_t)&v110, (uint64_t)v116);
  v87 = v96;
  if (v96 && !atomic_fetch_add(&v96->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v87->__on_zero_shared)(v87);
    std::__shared_weak_count::__release_weak(v87);
  }
  v88 = v98;
  if (v98 && !atomic_fetch_add(&v98->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
    std::__shared_weak_count::__release_weak(v88);
  }
  v89 = v101;
  if (v101 && !atomic_fetch_add(&v101->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
    std::__shared_weak_count::__release_weak(v89);
  }
  v90 = v104;
  if (v104 && !atomic_fetch_add(&v104->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
    std::__shared_weak_count::__release_weak(v90);
  }
  [(VKCameraController *)self camera];
  long long v91 = v108;
  uint64_t v92 = v103;
  v93 = v104;
  *(_OWORD *)(v103 + 96) = v107;
  *(_OWORD *)(v92 + 112) = v91;
  *(void *)(v92 + 128) = v109;
  long long v94 = v106;
  *(_OWORD *)(v92 + 64) = *(_OWORD *)v105;
  *(_OWORD *)(v92 + 80) = v94;
  if (v93)
  {
    if (!atomic_fetch_add(&v93->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v93->__on_zero_shared)(v93);
      std::__shared_weak_count::__release_weak(v93);
    }
  }
}

- (int64_t)tileSize
{
  mapEngine = self->_mapEngine;
  if (mapEngine && (uint64_t v3 = mapEngine[112]) != 0) {
    return *(void *)(v3 + 312);
  }
  else {
    return 256;
  }
}

- (float)minimumNormalizedZoomLevel
{
  mapEngine = self->_mapEngine;
  float v3 = 1.0;
  if (!mapEngine[149]) {
    return fmaxf(v3, 1.0);
  }
  float v4 = (int8x8_t *)mapEngine[140];
  int8x8_t v5 = v4[2];
  if (!*(void *)&v5) {
    return fmaxf(v3, 1.0);
  }
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v5);
  v6.i16[0] = vaddlv_u8(v6);
  unint64_t v7 = v6.u32[0];
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v8 = 0xAF46DE79C836B0D8;
    if (*(void *)&v5 <= 0xAF46DE79C836B0D8) {
      unint64_t v8 = 0xAF46DE79C836B0D8 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v8 = (*(void *)&v5 - 1) & 0xAF46DE79C836B0D8;
  }
  float v9 = *(void **)(*(void *)&v4[1] + 8 * v8);
  float v3 = 1.0;
  if (!v9) {
    return fmaxf(v3, 1.0);
  }
  float v10 = (void *)*v9;
  if (!v10) {
    return fmaxf(v3, 1.0);
  }
  if (v7 < 2)
  {
    uint64_t v11 = *(void *)&v5 - 1;
    while (1)
    {
      uint64_t v13 = v10[1];
      if (v13 == 0xAF46DE79C836B0D8)
      {
        if (v10[2] == 0xAF46DE79C836B0D8) {
          goto LABEL_23;
        }
      }
      else if ((v13 & v11) != v8)
      {
        return fmaxf(1.0, 1.0);
      }
      float v10 = (void *)*v10;
      if (!v10) {
        return fmaxf(1.0, 1.0);
      }
    }
  }
  while (1)
  {
    unint64_t v12 = v10[1];
    if (v12 == 0xAF46DE79C836B0D8) {
      break;
    }
    if (v12 >= *(void *)&v5) {
      v12 %= *(void *)&v5;
    }
    if (v12 != v8) {
      return fmaxf(1.0, 1.0);
    }
LABEL_12:
    float v10 = (void *)*v10;
    if (!v10) {
      return fmaxf(1.0, 1.0);
    }
  }
  if (v10[2] != 0xAF46DE79C836B0D8) {
    goto LABEL_12;
  }
LABEL_23:
  uint64_t v15 = v10[5];
  float v3 = 1.0;
  if (v15) {
    float v3 = (float)*(unsigned int *)(v15 + 312);
  }
  return fmaxf(v3, 1.0);
}

- (float)maximumNormalizedZoomLevel
{
  uint64_t v2 = *((void *)self->_mapEngine + 149);
  if (v2) {
    return (float)*(unsigned int *)(v2 + 52);
  }
  else {
    return 20.0;
  }
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  mapEngine = self->_mapEngine;
  if (mapEngine)
  {
    uint8x8_t v6 = (int8x8_t *)mapEngine[140];
    int8x8_t v7 = v6[2];
    if (v7)
    {
      uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        uint64_t v9 = 0x17767EADC5B287BLL;
        if (*(void *)&v7 <= 0x17767EADC5B287BuLL) {
          uint64_t v9 = 0x17767EADC5B287BuLL % *(void *)&v7;
        }
      }
      else
      {
        uint64_t v9 = (*(void *)&v7 - 1) & 0x17767EADC5B287BLL;
      }
      float v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
      if (v10)
      {
        uint64_t v11 = (void *)*v10;
        if (v11)
        {
          if (v8.u32[0] < 2uLL)
          {
            uint64_t v12 = *(void *)&v7 - 1;
            while (1)
            {
              uint64_t v14 = v11[1];
              if (v14 == 0x17767EADC5B287BLL)
              {
                if (v11[2] == 0x17767EADC5B287BLL) {
                  goto LABEL_23;
                }
              }
              else if ((v14 & v12) != v9)
              {
                goto LABEL_28;
              }
              uint64_t v11 = (void *)*v11;
              if (!v11) {
                goto LABEL_28;
              }
            }
          }
          do
          {
            unint64_t v13 = v11[1];
            if (v13 == 0x17767EADC5B287BLL)
            {
              if (v11[2] == 0x17767EADC5B287BLL)
              {
LABEL_23:
                uint64_t v15 = v11[5];
                if (v15)
                {
                  if (self->_updateHeight) {
                    int v16 = 1;
                  }
                  else {
                    int v16 = 2;
                  }
                  *(_DWORD *)(v15 + 288) = v16;
                  self->_updateHeight = 0;
                }
                break;
              }
            }
            else
            {
              if (v13 >= *(void *)&v7) {
                v13 %= *(void *)&v7;
              }
              if (v13 != v9) {
                break;
              }
            }
            uint64_t v11 = (void *)*v11;
          }
          while (v11);
        }
      }
    }
  }
LABEL_28:
  v34.receiver = self;
  v34.super_class = (Class)VKDaVinciCameraController;
  [(VKScreenCameraController *)&v34 updateWithTimestamp:a4 withContext:a3];
  [(VKDaVinciCameraController *)self updateCameraLimits];
  [(VKCameraController *)self camera];
  [(VKCameraController *)self camera];
  float64_t v26 = *(double *)(v32 + 32);
  [(VKCameraController *)self camera];
  float v17 = v31;
  v18.f64[0] = v26;
  v18.f64[1] = *(float64_t *)(v30 + 32);
  v27[29] = vmaxnmq_f64(vmulq_f64(v18, (float64x2_t)xmmword_1A28FF270), (float64x2_t)xmmword_1A28FF280);
  if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  if (v33 && !atomic_fetch_add(&v33->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
    std::__shared_weak_count::__release_weak(v33);
  }
  if (v28 && !atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
  }
  [(VKCameraController *)self camera];
  double v19 = fabs(v27->f64[1]);
  if (v28 && !atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
  }
  if (v19 < 1.48352986)
  {
    [(VKCameraController *)self camera];
    uint64_t v20 = v32;
    [(VKCameraController *)self camera];
    v21.n128_f64[0] = gdc::CameraFrame<geo::Radians,double>::toRigidTransformMercator((double *)&v27, (double *)(v20 + 8), *(unsigned char *)v30 == 0);
    float v22 = v31;
    if (v31 && !atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *, double))v22->__on_zero_shared)(v22, v21.n128_f64[0]);
      std::__shared_weak_count::__release_weak(v22);
    }
    float v23 = v33;
    if (v33)
    {
      if (!atomic_fetch_add(&v33->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *, __n128))v23->__on_zero_shared)(v23, v21);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    uint64_t v24 = [(VKCameraController *)self vkCamera];
    [v24 setPosition:&v27];

    double v25 = [(VKCameraController *)self vkCamera];
    [v25 setOrientation:&v29];
  }
}

- (BOOL)usesVKCamera
{
  return 0;
}

- (void)animateToRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8 = a5;
  [a3 radianSingleRect:&v36 westOfDatelineRect:&v34 eastOfDatelineRect:&v32];
  [(VKDaVinciCameraController *)self centerCoordinate];
  double v10 = v9;
  double v12 = v11;
  unint64_t v13 = [(VKScreenCameraController *)self regionRestriction];
  objc_msgSend(v13, "clampedCoordinate:", v10, v12);
  uint64_t v15 = v14;
  uint64_t v17 = v16;

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __74__VKDaVinciCameraController_animateToRestriction_duration_timingFunction___block_invoke;
  v25[3] = &unk_1E5A94478;
  *(double *)&v25[5] = v10;
  *(double *)&v25[6] = v12;
  v25[7] = v15;
  v25[8] = v17;
  long long v26 = v36;
  long long v27 = v37;
  long long v28 = v34;
  long long v29 = v35;
  long long v31 = v33;
  long long v30 = v32;
  v25[4] = self;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__VKDaVinciCameraController_animateToRestriction_duration_timingFunction___block_invoke_2;
  v18[3] = &unk_1E5A944A0;
  v18[4] = self;
  long long v20 = v37;
  long long v19 = v36;
  long long v22 = v35;
  long long v21 = v34;
  long long v24 = v33;
  long long v23 = v32;
  [(VKDaVinciCameraController *)self animateRegionWithDuration:v8 timingFunction:v25 stepHandler:v18 completionHandler:a4];
}

void __74__VKDaVinciCameraController_animateToRestriction_duration_timingFunction___block_invoke(uint64_t a1, float a2)
{
  double v3 = *(double *)(a1 + 40) * 0.0174532925;
  double v4 = a2;
  long double v5 = fmod(3.14159265 - v3 + *(double *)(a1 + 56) * 0.0174532925, 6.28318531);
  long double v6 = fmod(v5 + 6.28318531, 6.28318531);
  long double v7 = fmod(v3 + 3.14159265 + (v6 + -3.14159265) * v4, 6.28318531);
  double v8 = fmod(v7 + 6.28318531, 6.28318531) + -3.14159265;
  double v9 = *(double *)(a1 + 48) * 0.0174532925;
  long double v10 = fmod(3.14159265 - v9 + *(double *)(a1 + 64) * 0.0174532925, 6.28318531);
  long double v11 = fmod(v10 + 6.28318531, 6.28318531);
  long double v12 = fmod(v9 + 3.14159265 + (v11 + -3.14159265) * v4, 6.28318531);
  double v13 = fmod(v12 + 6.28318531, 6.28318531);
  double v14 = v13 + -3.14159265;
  double v15 = *(double *)(a1 + 72);
  double v16 = *(double *)(a1 + 80);
  double v17 = *(double *)(a1 + 88);
  double v18 = *(double *)(a1 + 96);
  double v19 = *(double *)(a1 + 104);
  double v20 = *(double *)(a1 + 112);
  double v21 = *(double *)(a1 + 120);
  double v22 = *(double *)(a1 + 128);
  double v24 = *(double *)(a1 + 136);
  double v23 = *(double *)(a1 + 144);
  double v25 = *(double *)(a1 + 152);
  double v26 = *(double *)(a1 + 160);
  if (v17 < v15 || v18 < v16)
  {
    double v36 = 0.0;
    double v37 = (v19 - v14) * (v19 - v14);
    if (v14 >= v19) {
      double v37 = 0.0;
    }
    if (v14 > v21) {
      double v37 = (v14 - v21) * (v14 - v21);
    }
    double v38 = v37 + (v8 - v22) * (v8 - v22);
    if (v8 < v20) {
      double v37 = v37 + (v20 - v8) * (v20 - v8);
    }
    if (v8 > v22) {
      double v37 = v38;
    }
    if (v14 <= v25)
    {
      if (v14 >= v24) {
        goto LABEL_29;
      }
      double v39 = v24 - v14;
    }
    else
    {
      double v39 = v14 - v25;
    }
    double v36 = v39 * v39;
LABEL_29:
    double v40 = sqrt(v37);
    if (v8 <= v26)
    {
      if (v8 >= v23)
      {
LABEL_34:
        BOOL v42 = v40 < sqrt(v36);
        double v43 = fmin(v14, v24);
        double v44 = fmax(v14, v25);
        double v45 = fmin(v8, v23);
        double v46 = fmax(v8, v26);
        double v47 = fmin(v14, v19);
        double v48 = fmax(v14, v21);
        double v49 = fmin(v8, v20);
        double v50 = fmax(v8, v22);
        if (v42)
        {
          double v19 = v47;
        }
        else
        {
          double v24 = v43;
          double v23 = v45;
          double v25 = v44;
          double v26 = v46;
        }
        if (v42) {
          double v20 = v49;
        }
        if (v42) {
          double v21 = v48;
        }
        if (v42) {
          double v22 = v50;
        }
        goto LABEL_46;
      }
      double v41 = v23 - v8;
    }
    else
    {
      double v41 = v8 - v26;
    }
    double v36 = v36 + v41 * v41;
    goto LABEL_34;
  }
  if (v15 <= v14 && v14 <= v17) {
    goto LABEL_15;
  }
  double v56 = *(double *)(a1 + 112);
  double v57 = *(double *)(a1 + 104);
  double v58 = *(double *)(a1 + 160);
  double v59 = *(double *)(a1 + 152);
  double v62 = *(double *)(a1 + 80);
  double v63 = *(double *)(a1 + 96);
  double v60 = *(double *)(a1 + 136);
  double v61 = *(double *)(a1 + 144);
  double v65 = *(double *)(a1 + 72);
  double v66 = *(double *)(a1 + 88);
  double v28 = v13 + -6.28318531;
  long double v29 = fmod(v15 - (v13 + -6.28318531), 6.28318531);
  double v64 = fabs(fmod(v29 + 6.28318531, 6.28318531) + -3.14159265);
  long double v30 = v66 - v28;
  double v17 = v66;
  long double v31 = fmod(v30, 6.28318531);
  long double v32 = fmod(v31 + 6.28318531, 6.28318531);
  double v15 = v65;
  double v33 = fabs(v32 + -3.14159265);
  if (v64 <= v33 && v65 < v14)
  {
    double v22 = v63;
    double v23 = fmin(v8, v62);
    if (v8 <= v63)
    {
      double v25 = v66;
      double v15 = 1.79769313e308;
      double v24 = -3.14159265;
      double v26 = v63;
      double v19 = v14;
      double v20 = v23;
      double v21 = 3.14159265;
      double v16 = 1.79769313e308;
      double v18 = -1.79769313e308;
    }
    else
    {
      double v18 = -1.79769313e308;
      double v15 = 1.79769313e308;
      double v24 = -3.14159265;
      double v25 = v66;
      double v26 = v8;
      double v19 = v14;
      double v20 = v23;
      double v21 = 3.14159265;
      double v22 = v8;
      double v16 = 1.79769313e308;
    }
    double v17 = -1.79769313e308;
    goto LABEL_46;
  }
  BOOL v35 = v64 > v33 && v14 < v66;
  double v24 = v60;
  double v23 = v61;
  double v16 = v62;
  double v18 = v63;
  double v26 = v58;
  double v25 = v59;
  double v20 = v56;
  double v19 = v57;
  if (v35)
  {
    double v23 = fmin(v8, v62);
    double v17 = -1.79769313e308;
    double v16 = 1.79769313e308;
    double v24 = -3.14159265;
    double v25 = v14;
    if (v8 <= v63)
    {
      double v26 = v63;
      double v19 = v65;
      double v20 = v23;
      double v21 = 3.14159265;
      double v22 = v63;
    }
    else
    {
      double v26 = v8;
      double v19 = v65;
      double v20 = v23;
      double v21 = 3.14159265;
      double v22 = v8;
    }
    double v15 = 1.79769313e308;
    double v18 = -1.79769313e308;
  }
  else
  {
LABEL_15:
    double v15 = fmin(v14, v15);
    double v17 = fmax(v17, v14);
    double v16 = fmin(v8, v16);
    double v18 = fmax(v18, v8);
  }
LABEL_46:
  float v51 = *(double **)(*(void *)(a1 + 32) + 280);
  v51[41] = v15;
  v51[42] = v16;
  v51[43] = v17;
  v51[44] = v18;
  v51[45] = v19;
  v51[46] = v20;
  v51[47] = v21;
  v51[48] = v22;
  v51[49] = v24;
  v51[50] = v23;
  v51[51] = v25;
  v51[52] = v26;
  float v52 = *(void **)(a1 + 32);
  uint64_t v53 = v52[35];
  [v52 camera];
  md::CameraManager::update(v53, &v67, 1);
  float v54 = v68;
  if (v68 && !atomic_fetch_add(&v68->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
    std::__shared_weak_count::__release_weak(v54);
  }
  v55 = [*(id *)(a1 + 32) cameraDelegate];
  [v55 mapLayerDidChangeVisibleRegion];
}

uint64_t __74__VKDaVinciCameraController_animateToRestriction_duration_timingFunction___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) beginRegionChange:0];
    double v3 = (_OWORD *)(*(void *)(*(void *)(v2 + 32) + 280) + 328);
    long long v4 = *(_OWORD *)(v2 + 56);
    long long v5 = *(_OWORD *)(v2 + 72);
    long long v6 = *(_OWORD *)(v2 + 88);
    long long v7 = *(_OWORD *)(v2 + 104);
    long long v8 = *(_OWORD *)(v2 + 120);
    *double v3 = *(_OWORD *)(v2 + 40);
    v3[1] = v4;
    v3[2] = v5;
    v3[3] = v6;
    v3[4] = v7;
    v3[5] = v8;
    double v9 = *(void **)(v2 + 32);
    uint64_t v10 = v9[35];
    [v9 camera];
    md::CameraManager::update(v10, &v13, 1);
    long double v11 = v14;
    if (v14)
    {
      if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    long double v12 = [*(id *)(v2 + 32) cameraDelegate];
    [v12 mapLayerDidChangeVisibleRegion];

    return [*(id *)(v2 + 32) endRegionChange];
  }
  return result;
}

- (void)setRegionRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(VKScreenCameraController *)self regionRestriction];
  char v11 = [v10 isEqual:v8];

  if ((v11 & 1) == 0)
  {
    v34.receiver = self;
    v34.super_class = (Class)VKDaVinciCameraController;
    [(VKScreenCameraController *)&v34 setRegionRestriction:v8 duration:v9 timingFunction:a4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      annotationTrackingCameraController = self->super._annotationTrackingCameraController;
      uint64_t v13 = [(VKScreenCameraController *)self regionRestriction];
      [(VKAnnotationTrackingCameraController *)annotationTrackingCameraController setRegionRestriction:v13];
    }
    if ([v8 isEmpty])
    {
      cameraManager = self->_cameraManager;
      cameraManager[41] = 0x7FEFFFFFFFFFFFFFLL;
      *((_OWORD *)cameraManager + 21) = xmmword_1A28FC720;
      *((_OWORD *)cameraManager + 22) = xmmword_1A28FF290;
      *((_OWORD *)cameraManager + 23) = xmmword_1A28FC720;
      *((_OWORD *)cameraManager + 24) = xmmword_1A28FF290;
      *((_OWORD *)cameraManager + 25) = xmmword_1A28FC720;
      cameraManager[52] = 0xFFEFFFFFFFFFFFFFLL;
    }
    else
    {
      [(VKDaVinciCameraController *)self centerCoordinate];
      double v16 = v15;
      double v18 = v17;
      double v19 = [(VKScreenCameraController *)self regionRestriction];
      int v20 = objc_msgSend(v19, "containsCoordinate:", v16, v18);

      if (a4 <= 0.0) {
        char v21 = 1;
      }
      else {
        char v21 = v20;
      }
      if (v21)
      {
        [v8 radianSingleRect:&v32 westOfDatelineRect:&v30 eastOfDatelineRect:&v28];
        if (v20)
        {
          double v22 = (char *)self->_cameraManager + 328;
          *double v22 = v32;
          v22[1] = v33;
          v22[2] = v30;
          v22[3] = v31;
          v22[4] = v28;
          v22[5] = v29;
        }
        else
        {
          [(VKCameraController *)self beginRegionChange:0];
          double v23 = (char *)self->_cameraManager;
          *(_OWORD *)(v23 + 328) = v32;
          *(_OWORD *)(v23 + 344) = v33;
          *(_OWORD *)(v23 + 360) = v30;
          *(_OWORD *)(v23 + 376) = v31;
          *(_OWORD *)(v23 + 392) = v28;
          *(_OWORD *)(v23 + 408) = v29;
          [(VKCameraController *)self camera];
          md::CameraManager::update((uint64_t)v23, &v26, 1);
          double v24 = v27;
          if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
            std::__shared_weak_count::__release_weak(v24);
          }
          double v25 = [(VKCameraController *)self cameraDelegate];
          [v25 mapLayerDidChangeVisibleRegion];

          [(VKCameraController *)self endRegionChange];
        }
      }
      else
      {
        [(VKDaVinciCameraController *)self animateToRestriction:v8 duration:v9 timingFunction:a4];
      }
    }
  }
}

- (void)animateRegionWithDuration:(double)a3 timingFunction:(id)a4 stepHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  regionAnimation = self->super._regionAnimation;
  if (regionAnimation) {
    [(VKAnimation *)regionAnimation stop];
  }
  double v14 = [[VKTimedAnimation alloc] initWithDuration:a3];
  double v15 = self->super._regionAnimation;
  self->super._regionAnimation = v14;

  if (v10) {
    double v16 = v10;
  }
  else {
    double v16 = VKAnimationCurveEaseInOut;
  }
  [(VKTimedAnimation *)self->super._regionAnimation setTimingFunction:v16];
  [(VKTimedAnimation *)self->super._regionAnimation setStepHandler:v11];
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __100__VKDaVinciCameraController_animateRegionWithDuration_timingFunction_stepHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E5A98E30;
  objc_copyWeak(&v20, &location);
  id v17 = v12;
  id v19 = v17;
  [(VKAnimation *)self->super._regionAnimation setCompletionHandler:v18];
  [(VKCameraController *)self beginRegionChange:1];
  md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._regionAnimation->super);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __100__VKDaVinciCameraController_animateRegionWithDuration_timingFunction_stepHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [WeakRetained[20] stop];
    id v4 = WeakRetained[20];
    WeakRetained[20] = 0;

    [WeakRetained endRegionChange];
    [WeakRetained snapMapIfNecessary:1];
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    }
  }
}

- (void)setCenterCoordinateDistanceRange:(id *)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8 = a5;
  double v9 = 60592301.5;
  double var1 = a3->var1;
  BOOL v11 = var1 > 60592301.5 || var1 < 0.0;
  double v12 = fmin(a3->var0, 60592301.5);
  if (!v11) {
    double v9 = a3->var1;
  }
  a3->double var0 = v12;
  a3->double var1 = v9;
  uint64_t v40 = 0;
  double v41 = 0.0;
  uint64_t v42 = 0;
  [(VKScreenCameraController *)self centerCoordinateDistanceRange];
  if (a3->var0 != 0.0 || a3->var1 != v41 || a3->var2 != v42)
  {
    long long v38 = *(_OWORD *)&a3->var0;
    uint64_t v39 = *(void *)&a3->var2;
    v37.receiver = self;
    v37.super_class = (Class)VKDaVinciCameraController;
    [(VKScreenCameraController *)&v37 setCenterCoordinateDistanceRange:&v38 duration:v8 timingFunction:a4];
    a3->double var0 = fmax(a3->var0, 0.0);
    [(VKCameraController *)self camera];
    double v13 = *(double *)(v35 + 32);
    if (*((void *)&v35 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v35 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(void))(**((void **)&v35 + 1) + 16))(*((void *)&v35 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v35 + 1));
    }
    double var0 = a3->var0;
    if (v13 >= a3->var0)
    {
      double v15 = a3->var1;
      [(VKDaVinciCameraController *)self distanceFromCenterCoordinate];
      if (v15 >= v16) {
        goto LABEL_29;
      }
      double var0 = a3->var0;
    }
    if (a4 <= 0.0)
    {
      double v20 = a3->var1;
      [(VKDaVinciCameraController *)self centerCoordinateRad];
      long long v25 = v35;
      [(VKCameraController *)self camera];
      double v21 = *(double *)(v33 + 48);
      [(VKCameraController *)self camera];
      [(VKDaVinciCameraController *)self moveTo:&v25 zoom:VKAnimationCurveEaseInOut rotation:&__block_literal_global_28106 tilt:fmin(fmax(v13, var0), v20) duration:v21 timingCurve:*(double *)(v23 + 40) completion:0.0];
      if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)())v24->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v24);
      }
      double v22 = v34;
      if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    else
    {
      [(VKCameraController *)self camera];
      if (*((void *)&v35 + 1)
        && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v35 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        (*(void (**)(void))(**((void **)&v35 + 1) + 16))(*((void *)&v35 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v35 + 1));
      }
      id v17 = [(VKCameraController *)self mapDataAccess];
      [(VKCameraController *)self centerScreenPoint];
      Matrix<int, 2, 1> v18 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
      [(VKCameraController *)self camera];
      md::MapDataAccess::groundCoordinateForScreenCursor((uint64_t)&v35, (uint64_t)v17, v33 + 8, (int32x2_t)v18);
      if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
      cameraManager = self->_cameraManager;
      cameraManager[242] = 0;
      cameraManager[244] = 0;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3321888768;
      v27[2] = __86__VKDaVinciCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke;
      v27[3] = &unk_1EF58EB78;
      long long v28 = *(_OWORD *)&a3->var0;
      uint64_t v29 = *(void *)&a3->var2;
      double v30 = v13;
      long long v31 = v35;
      uint64_t v32 = v36;
      v27[4] = self;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __86__VKDaVinciCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke_24;
      v26[3] = &unk_1E5A93728;
      v26[4] = self;
      [(VKDaVinciCameraController *)self animateRegionWithDuration:v8 timingFunction:v27 stepHandler:v26 completionHandler:a4];
    }
  }
LABEL_29:
}

void __86__VKDaVinciCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke(uint64_t a1, float a2)
{
  double v3 = fmin(fmax(*(double *)(a1 + 64), *(double *)(a1 + 64) + (*(double *)(a1 + 40) - *(double *)(a1 + 64)) * a2), *(double *)(a1 + 64) + (*(double *)(a1 + 48) - *(double *)(a1 + 64)) * a2);
  float64x2_t v22 = *(float64x2_t *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 88);
  [*(id *)(a1 + 32) camera];
  float64_t v5 = v26.f64[0];
  *(float64x2_t *)(*(void *)&v26.f64[0] + 8) = v22;
  *(void *)(*(void *)&v5 + 24) = v4;
  if (*(void *)&v26.f64[1]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v26.f64[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**(void **)&v26.f64[1] + 16))(*(void *)&v26.f64[1]);
    std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v26.f64[1]);
  }
  [*(id *)(a1 + 32) camera];
  long long v6 = *(std::__shared_weak_count **)&v26.f64[1];
  *(double *)(*(void *)&v26.f64[0] + 32) = v3;
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  uint64_t v7 = [*(id *)(a1 + 32) mapDataAccess];
  id v8 = *(void **)(a1 + 32);
  [v8 centerScreenPoint];
  int32x2_t v9 = (int32x2_t)objc_msgSend(v8, "cursorFromScreenPoint:");
  id v10 = *(void **)(a1 + 32);
  if (v10)
  {
    [v10 camera];
    uint64_t v11 = v24;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v24 = 0;
    long long v25 = 0;
  }
  md::MapDataAccess::groundCoordinateForScreenCursor((uint64_t)&v26, v7, v11 + 8, v9);
  if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
    std::__shared_weak_count::__release_weak(v25);
  }
  __asm { FMOV            V1.2D, #-2.0 }
  objc_msgSend(*(id *)(a1 + 32), "camera", vnegq_f64(vmlaq_f64(v26, _Q1, v22)));
  uint64_t v17 = v24;
  *(_OWORD *)(v24 + 8) = v23;
  *(void *)(v17 + 24) = v4;
  if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
    std::__shared_weak_count::__release_weak(v25);
  }
  Matrix<int, 2, 1> v18 = *(void **)(a1 + 32);
  uint64_t v19 = v18[35];
  [v18 camera];
  md::CameraManager::update(v19, &v24, 1);
  double v20 = v25;
  if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
  [*(id *)(a1 + 32) _updateIsPitched];
  [*(id *)(a1 + 32) _updateCanEnter3DMode];
  double v21 = [*(id *)(a1 + 32) cameraDelegate];
  [v21 mapLayerDidChangeVisibleRegion];
}

void __86__VKDaVinciCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke_24(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[35];
  [v2 camera];
  md::CameraManager::update(v3, &v5, 1);
  uint64_t v4 = v6;
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 280) + 242) = 1;
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

- (double)heading
{
  [(VKCameraController *)self camera];
  double v2 = *(double *)(v6 + 48);
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v7->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v7);
  }
  float v3 = v2;
  if (v3 > 3.14159265)
  {
    float v4 = v3 + -6.28318531;
    float v3 = v4;
  }
  return v3 * -57.2957795;
}

- (double)altitude
{
  [(VKCameraController *)self camera];
  double v3 = *(double *)(v8 + 32);
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v9->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v9);
  }
  [(VKCameraController *)self camera];
  double v4 = *(double *)(v8 + 40);
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v9->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v9);
  }
  float v5 = v4;
  float v6 = v3;
  return (float)(cosf(v5) * v6);
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

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  [(VKDaVinciCameraController *)self centerCoordinateRad];
  double v2 = v4 * 57.2957795;
  double v3 = v5 * 57.2957795;
  result.double var1 = v3;
  result.double var0 = v2;
  return result;
}

- (Coordinate2D<geo::Radians,)centerCoordinateRad
{
  double v4 = v2;
  [(VKCameraController *)self camera];
  if (*((void *)&v11 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v11 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**((void **)&v11 + 1) + 16))(*((void *)&v11 + 1));
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v11 + 1));
  }
  double v5 = [(VKCameraController *)self mapDataAccess];
  [(VKCameraController *)self centerScreenPoint];
  Matrix<int, 2, 1> v6 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
  [(VKCameraController *)self camera];
  md::MapDataAccess::groundCoordinateForScreenCursor((uint64_t)&v11, (uint64_t)v5, v9 + 8, (int32x2_t)v6);
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v10->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v10);
  }
  double v8 = *(double *)&v11;
  *double v4 = v11;
  result.longitude = *(Unit<geo::RadianUnitDescription, double> *)&v7;
  result.latitude = *(Unit<geo::RadianUnitDescription, double> *)&v8;
  return result;
}

- (Coordinate2D<geo::Radians,)_centerCoordinateForMapRegion:(id)a3
{
  double v4 = v3;
  GEOMapRectForMapRegion();
  GEOCoordinate2DForMapPoint();
  double v6 = v5 * 0.0174532925;
  double v8 = v7 * 0.0174532925;
  *double v4 = v6;
  v4[1] = v8;
  result.longitude = *(Unit<geo::RadianUnitDescription, double> *)&v8;
  result.latitude = *(Unit<geo::RadianUnitDescription, double> *)&v6;
  return result;
}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 timingCurve:(id)a7 completion:(id)a8
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a8;
  [(VKDaVinciCameraController *)self _centerCoordinateForMapRegion:v11];
  [v11 eastLng];
  double v15 = v14;
  [v11 westLng];
  if (v15 < v16)
  {
    [v11 eastLng];
    [v11 setEastLng:v17 + 360.0];
  }
  [(VKDaVinciCameraController *)self zoomForMapRegion:v11];
  v18[0] = v18[1];
  -[VKDaVinciCameraController moveTo:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:zoom:rotation:tilt:duration:timingCurve:completion:", v18, v12, v13);
  self->super._userChangedZoomSinceLastProgrammaticRegionChange = 0;
  [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setHasUserSpecifiedZoomLevel:0];
}

- (double)durationToAnimateToMapRegion:(id)a3
{
  return 1.0;
}

- (double)zoomForMapRegion:(id)a3
{
  id v4 = a3;
  [v4 eastLng];
  double v6 = v5;
  [v4 westLng];
  if (v6 < v7)
  {
    [v4 eastLng];
    [v4 setEastLng:v8 + 360.0];
  }
  [(VKDaVinciCameraController *)self _centerCoordinateForMapRegion:v4];
  [(VKCameraController *)self camera];
  double v9 = v84[46];
  [(VKCameraController *)self camera];
  double v10 = *(double *)(v82 + 376);
  if (v83 && !atomic_fetch_add(&v83->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
    std::__shared_weak_count::__release_weak(v83);
  }
  if (v85 && !atomic_fetch_add(&v85->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
    std::__shared_weak_count::__release_weak(v85);
  }
  [(VKCameraController *)self camera];
  double v12 = v84[46];
  double v11 = v84[47];
  if (v11 >= v12)
  {
    double v18 = v84[57];
    uint64_t v19 = v85;
    if (!v85) {
      goto LABEL_18;
    }
  }
  else
  {
    double v13 = v11 * v12;
    double v14 = v11 / v12;
    if (v13 <= 0.0) {
      double v15 = 1.0;
    }
    else {
      double v15 = v14;
    }
    long double v16 = tan(v84[57] * 0.5);
    long double v17 = atan(v15 * v16);
    double v18 = v17 + v17;
    uint64_t v19 = v85;
    if (!v85) {
      goto LABEL_18;
    }
  }
  if (!atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
LABEL_18:
  uint64_t v81 = v86;
  [(VKDaVinciCameraController *)self earthRadiusAt:&v81];
  double v21 = v20;
  [v4 northLat];
  v80[0] = v22 * 0.0174532925;
  v80[1] = *((double *)&v86 + 1);
  long long v79 = v86;
  [(VKDaVinciCameraController *)self geocAngleBetween:v80 andCoordinate:&v79];
  double v24 = v23;
  [v4 northLat];
  uint64_t v78 = v25;
  [(VKDaVinciCameraController *)self earthRadiusAt:&v78];
  double v27 = v26;
  long long v77 = v86;
  [v4 southLat];
  v76[0] = v28 * 0.0174532925;
  v76[1] = *((double *)&v86 + 1);
  [(VKDaVinciCameraController *)self geocAngleBetween:&v77 andCoordinate:v76];
  double v67 = v29;
  [v4 southLat];
  uint64_t v75 = v30;
  [(VKDaVinciCameraController *)self earthRadiusAt:&v75];
  double v66 = v31;
  [(VKDaVinciCameraController *)self widestLatitudeForMapRegion:v4];
  v74[0] = v82;
  [v4 westLng];
  uint64_t v73 = v32;
  [v4 eastLng];
  uint64_t v72 = v33;
  [(VKDaVinciCameraController *)self greatCircleMidPointLatitude:v74 fromLongitude:&v73 toLongitude:&v72];
  uint64_t v71 = v74[1];
  [(VKDaVinciCameraController *)self earthRadiusAt:&v71];
  double v65 = v34;
  uint64_t v70 = v82;
  [(VKDaVinciCameraController *)self earthRadiusAt:&v70];
  double v64 = v35;
  [v4 westLng];
  v69[0] = v82;
  *(double *)&v69[1] = v36 * 0.0174532925;
  [v4 eastLng];
  v68[0] = v82;
  *(double *)&v68[1] = v37 * 0.0174532925;
  [(VKDaVinciCameraController *)self geocAngleBetween:v69 andCoordinate:v68];
  double v39 = v38;
  [(VKCameraController *)self camera];
  double v40 = v84[47];
  [(VKCameraController *)self edgeInsets];
  float v63 = v41;
  [(VKCameraController *)self edgeInsets];
  float v62 = v42;
  double v43 = v85;
  if (v85 && !atomic_fetch_add(&v85->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
    std::__shared_weak_count::__release_weak(v43);
  }
  [(VKCameraController *)self camera];
  double v61 = v84[46];
  [(VKCameraController *)self edgeInsets];
  float v60 = v44;
  [(VKCameraController *)self edgeInsets];
  float v59 = v45;
  double v46 = v85;
  if (v85 && !atomic_fetch_add(&v85->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
    std::__shared_weak_count::__release_weak(v46);
  }
  [(VKCameraController *)self camera];
  double v47 = v85;
  double v56 = v84[47];
  if (v85 && !atomic_fetch_add(&v85->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
    std::__shared_weak_count::__release_weak(v47);
  }
  double v57 = v40;
  double v58 = v27;
  [(VKCameraController *)self camera];
  double v48 = v24;
  double v49 = v85;
  double v50 = v84[46];
  if (v85 && !atomic_fetch_add(&v85->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
    std::__shared_weak_count::__release_weak(v49);
  }
  __double2 v51 = __sincos_stret(v39 * 0.5);
  double v52 = tan(v18 * 0.5);
  __double2 v53 = __sincos_stret(v48);
  __double2 v54 = __sincos_stret(v67);

  return fmax(fmax(v58 * v53.__sinval / v52 + (v53.__cosval + -1.0) * v21, v66 * v54.__sinval / v52 + (v54.__cosval + -1.0) * v21)* v56/ (v57 - (v63 + v62)), (v64 * v10 * v51.__sinval / (v52 * v9) + (v51.__cosval + -1.0) * v65) * v50 / (v61 - (v60 + v59)));
}

- (Unit<geo::RadianUnitDescription,)widestLatitudeForMapRegion:(id)a3
{
  id v4 = v3;
  id v10 = a3;
  [v10 southLat];
  if (v5 >= 0.0)
  {
    [v10 southLat];
  }
  else
  {
    [v10 northLat];
    double v6 = 0.0;
    if (v7 > 0.0) {
      goto LABEL_6;
    }
    [v10 northLat];
  }
  double v6 = v8 * 0.0174532925;
LABEL_6:
  *id v4 = v6;

  return v9;
}

- (Unit<geo::RadianUnitDescription,)greatCircleMidPointLatitude:()Unit<geo:(double>)a3 :()Unit<geo:(double>)a4 :()Unit<geo:(double>)a5 :RadianUnitDescription RadianUnitDescription RadianUnitDescription fromLongitude:toLongitude:
{
  Unit<geo::RadianUnitDescription, double> v9 = v8;
  double v10 = *v7 - *v6;
  __double2 v11 = __sincos_stret(*v5);
  __double2 v12 = __sincos_stret(v10);
  v13._value = atan2(v11.__sinval + v11.__sinval, sqrt(v12.__sinval * v11.__cosval * (v12.__sinval * v11.__cosval)+ (v11.__cosval + v12.__cosval * v11.__cosval) * (v11.__cosval + v12.__cosval * v11.__cosval)));
  *Unit<geo::RadianUnitDescription, double> v9 = v13._value;
  return v13;
}

- (double)earthRadiusAt:()Unit<geo:(double>)a3 :RadianUnitDescription
{
  __double2 v4 = __sincos_stret(*v3);
  float64x2_t v5 = vmulq_n_f64((float64x2_t)xmmword_1A28FF2A0, v4.__cosval);
  float64x2_t v6 = vmulq_n_f64((float64x2_t)xmmword_1A28FF2B0, v4.__sinval);
  float64x2_t v7 = vmlaq_f64(vmulq_f64(v6, v6), v5, v5);
  return sqrt(vdivq_f64(v7, (float64x2_t)vdupq_laneq_s64((int64x2_t)v7, 1)).f64[0]);
}

- (double)geocAngleBetween:()Coordinate2D<geo:(double>)a3 :()Coordinate2D<geo:(double>)a4 :Radians Radians andCoordinate:
{
  double v6 = v4[1];
  double v18 = *v5;
  double v19 = v5[1];
  __double2 v7 = __sincos_stret(*v4);
  double v8 = 6378137.0 / sqrt(-(v7.__sinval * v7.__sinval * 0.00669437999 + -1.0));
  __double2 v9 = __sincos_stret(v6);
  double v10 = v8 * v7.__cosval * v9.__cosval;
  double v11 = v8 * v7.__cosval * v9.__sinval;
  __double2 v12 = __sincos_stret(v18);
  double v13 = 6378137.0 / sqrt(-(v12.__sinval * v12.__sinval * 0.00669437999 + -1.0));
  double v14 = v13 * v12.__cosval;
  __double2 v15 = __sincos_stret(v19);
  double v16 = fmax(fmin((v12.__sinval * 0.99330562 * v13 * (v7.__sinval * 0.99330562 * v8)+ v14 * v15.__cosval * v10+ v14 * v15.__sinval * v11)/ sqrt((v14 * v15.__cosval * (v14 * v15.__cosval)+ v14 * v15.__sinval * (v14 * v15.__sinval)+ v12.__sinval * 0.99330562 * v13 * (v12.__sinval * 0.99330562 * v13))* (v10 * v10 + v11 * v11 + v7.__sinval * 0.99330562 * v8 * (v7.__sinval * 0.99330562 * v8))), 1.0), -1.0);
  return acos(v16);
}

- (id)mapRegion
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F64700]);
  [(VKCameraController *)self camera];
  if (!v47 || atomic_fetch_add(&v47->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (__p) {
      goto LABEL_4;
    }
LABEL_8:
    [v3 setEastLng:-180.0];
    [v3 setWestLng:-180.0];
    [v3 setNorthLat:-180.0];
    [v3 setSouthLat:-180.0];
    id v13 = v3;
    goto LABEL_29;
  }
  ((void (*)())v47->__on_zero_shared)();
  std::__shared_weak_count::__release_weak(v47);
  if (!__p) {
    goto LABEL_8;
  }
LABEL_4:
  [(VKDaVinciCameraController *)self _getVisibleArea];
  float64x2_t v5 = __p;
  if (__p != v47)
  {
    unint64_t v6 = (char *)v47 - (char *)__p - 16;
    uint64_t v7 = (v6 >> 4) + 1;
    if (v6 > 0x2F)
    {
      float64x2_t v16 = (float64x2_t)vdupq_n_s64(0x47EFFFFFE0000000uLL);
      p_shared_owners = (const double *)&__p[1].__shared_owners_;
      uint64_t v18 = v7 & 0x1FFFFFFFFFFFFFFCLL;
      float64x2_t v19 = v16;
      float64x2_t v20 = v16;
      float64x2_t v21 = (float64x2_t)vdupq_n_s64(0xC7EFFFFFE0000000);
      float64x2_t v22 = v16;
      float64x2_t v23 = v21;
      float64x2_t v24 = v21;
      float64x2_t v25 = v21;
      do
      {
        double v26 = p_shared_owners - 4;
        float64x2x2_t v49 = vld2q_f64(v26);
        float64x2x2_t v50 = vld2q_f64(p_shared_owners);
        float64x2_t v20 = vminnmq_f64(v20, v49.val[1]);
        float64x2_t v22 = vminnmq_f64(v22, v50.val[1]);
        float64x2_t v16 = vminnmq_f64(v16, v49.val[0]);
        float64x2_t v19 = vminnmq_f64(v19, v50.val[0]);
        float64x2_t v24 = vmaxnmq_f64(v24, v49.val[1]);
        float64x2_t v25 = vmaxnmq_f64(v25, v50.val[1]);
        float64x2_t v21 = vmaxnmq_f64(v21, v49.val[0]);
        float64x2_t v23 = vmaxnmq_f64(v23, v50.val[0]);
        p_shared_owners += 8;
        v18 -= 4;
      }
      while (v18);
      double v11 = vmaxnmvq_f64(vmaxnmq_f64(v24, v25));
      double v8 = vmaxnmvq_f64(vmaxnmq_f64(v21, v23));
      double v10 = vminnmvq_f64(vminnmq_f64(v20, v22));
      double v9 = vminnmvq_f64(vminnmq_f64(v16, v19));
      if (v7 == (v7 & 0x1FFFFFFFFFFFFFFCLL))
      {
LABEL_15:
        double v14 = v8 * 57.2957795;
        double v15 = v9 * 57.2957795;
        double v4 = v11 - v10;
        if (v11 - v10 > 3.14159265)
        {
          if (v6 > 0x3F)
          {
            uint64_t v29 = v7 & 3;
            if ((v7 & 3) == 0) {
              uint64_t v29 = 4;
            }
            uint64_t v30 = v7 - v29;
            uint64_t v31 = 16 * v30;
            float64x2_t v32 = (float64x2_t)vdupq_n_s64(0xC7EFFFFFE0000000);
            float64x2_t v33 = (float64x2_t)vdupq_n_s64(0x47EFFFFFE0000000uLL);
            p_shared_weak_owners = (const double *)&__p[1].__shared_weak_owners_;
            float64x2_t v35 = (float64x2_t)vdupq_n_s64(0xC01921FB54442D18);
            float64x2_t v36 = v33;
            float64x2_t v37 = v32;
            do
            {
              double v38 = p_shared_weak_owners - 4;
              unsigned long long v39 = (unsigned __int128)vld2q_f64(v38);
              unsigned long long v40 = (unsigned __int128)vld2q_f64(p_shared_weak_owners);
              float64x2_t v41 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64((float64x2_t)v39), (int8x16_t)vaddq_f64((float64x2_t)v39, v35), (int8x16_t)v39);
              float64x2_t v42 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64((float64x2_t)v40), (int8x16_t)vaddq_f64((float64x2_t)v40, v35), (int8x16_t)v40);
              float64x2_t v33 = vminnmq_f64(v33, v41);
              float64x2_t v36 = vminnmq_f64(v36, v42);
              float64x2_t v32 = vmaxnmq_f64(v32, v41);
              float64x2_t v37 = vmaxnmq_f64(v37, v42);
              p_shared_weak_owners += 8;
              v30 -= 4;
            }
            while (v30);
            float64x2_t v5 = (std::__shared_weak_count *)((char *)__p + v31);
            double v11 = vmaxnmvq_f64(vmaxnmq_f64(v32, v37));
            double v4 = vminnmvq_f64(vminnmq_f64(v33, v36));
          }
          else
          {
            double v11 = -3.40282347e38;
            double v4 = 3.40282347e38;
          }
          do
          {
            double v43 = *(double *)&v5->__shared_owners_;
            if (v43 > 0.0) {
              double v43 = v43 + -6.28318531;
            }
            double v4 = fmin(v4, v43);
            double v11 = fmax(v11, v43);
            float64x2_t v5 = (std::__shared_weak_count *)((char *)v5 + 16);
          }
          while (v5 != v47);
          double v10 = v4 + 6.28318531;
        }
        goto LABEL_27;
      }
      __double2 v12 = (double *)(&__p->std::__shared_count + (v7 & 0x1FFFFFFFFFFFFFFCLL));
    }
    else
    {
      double v8 = -3.40282347e38;
      double v9 = 3.40282347e38;
      double v10 = 3.40282347e38;
      double v11 = -3.40282347e38;
      __double2 v12 = (double *)__p;
    }
    do
    {
      double v28 = *v12;
      double v27 = v12[1];
      v12 += 2;
      double v10 = fmin(v10, v27);
      double v9 = fmin(v9, v28);
      double v11 = fmax(v11, v27);
      double v8 = fmax(v8, v28);
    }
    while (v12 != (double *)v47);
    goto LABEL_15;
  }
  double v10 = 3.40282347e38;
  double v11 = -3.40282347e38;
  double v14 = -1.94967423e40;
  double v15 = 1.94967423e40;
LABEL_27:
  objc_msgSend(v3, "setEastLng:", v11 * 57.2957795, v4);
  [v3 setWestLng:v10 * 57.2957795];
  [v3 setNorthLat:v14];
  [v3 setSouthLat:v15];
  id v44 = v3;
  operator delete(__p);
LABEL_29:

  return v3;
}

- (vector<geo::Coordinate2D<geo::Radians,)_getVisibleArea
{
  float64x2_t v5 = (long long *)operator new(0x10uLL);
  long long *v5 = xmmword_1A28FE540;
  unint64_t v6 = (long long *)operator new(0x20uLL);
  v6[1] = xmmword_1A28FF2C0;
  *unint64_t v6 = *v5;
  operator delete(v5);
  uint64_t v7 = (long long *)operator new(0x40uLL);
  v7[2] = xmmword_1A28FF2D0;
  long long v8 = v6[1];
  *uint64_t v7 = *v6;
  v7[1] = v8;
  operator delete(v6);
  v7[3] = xmmword_1A28FF2E0;
  double v9 = (long long *)operator new(0x80uLL);
  v9[4] = xmmword_1A28FF2F0;
  long long v10 = v7[3];
  v9[2] = v7[2];
  v9[3] = v10;
  long long v11 = v7[1];
  *double v9 = *v7;
  v9[1] = v11;
  operator delete(v7);
  v9[7] = xmmword_1A28FF300;
  v9[5] = xmmword_1A28FCCC0;
  v9[6] = xmmword_1A28FB030;
  __double2 v12 = operator new(0x100uLL);
  long long v13 = v9[6];
  v12[7] = v9[7];
  v12[8] = xmmword_1A28FF310;
  long long v14 = v9[4];
  v12[5] = v9[5];
  v12[6] = v13;
  long long v15 = v9[2];
  v12[3] = v9[3];
  v12[4] = v14;
  long long v16 = *v9;
  v12[1] = v9[1];
  v12[2] = v15;
  *__double2 v12 = v16;
  operator delete(v9);
  unint64_t v17 = (unint64_t)(v12 + 16);
  v12[9] = xmmword_1A28FF320;
  uint64_t v18 = v12 + 10;
  if (v12 + 10 >= v12 + 16)
  {
    float64x2_t v21 = operator new(0x200uLL);
    float64x2_t v20 = v21 + 10;
    unint64_t v17 = (unint64_t)(v21 + 32);
    v21[10] = xmmword_1A28FF330;
    float64x2_t v19 = (char *)(v21 + 10);
    if (v18 != v12)
    {
      for (uint64_t i = 0; i != -10; --i)
        v20[i - 1] = v12[i + 9];
      float64x2_t v19 = (char *)v21;
    }
    operator delete(v12);
  }
  else
  {
    *uint64_t v18 = xmmword_1A28FF330;
    float64x2_t v19 = (char *)v12;
    float64x2_t v20 = v12 + 10;
  }
  float64x2_t v23 = (char *)(v20 + 1);
  if ((unint64_t)(v20 + 1) >= v17)
  {
    uint64_t v43 = (v23 - v19) >> 4;
    unint64_t v44 = v43 + 1;
    if ((unint64_t)(v43 + 1) >> 60) {
      abort();
    }
    if ((uint64_t)(v17 - (void)v19) >> 3 > v44) {
      unint64_t v44 = (uint64_t)(v17 - (void)v19) >> 3;
    }
    if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v45 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v45 = v44;
    }
    if (v45)
    {
      if (v45 >> 60) {
        goto LABEL_276;
      }
      double v46 = (char *)operator new(16 * v45);
    }
    else
    {
      double v46 = 0;
    }
    double v47 = &v46[16 * v43];
    unint64_t v17 = (unint64_t)&v46[16 * v45];
    *(_OWORD *)double v47 = xmmword_1A28FCBD0;
    float64x2_t v24 = v47 + 16;
    if (v23 == v19)
    {
      double v48 = &v46[16 * v43];
    }
    else
    {
      do
      {
        double v48 = v47 - 16;
        *((_OWORD *)v47 - 1) = *((_OWORD *)v23 - 1);
        v23 -= 16;
        v47 -= 16;
      }
      while (v23 != v19);
    }
    operator delete(v19);
    float64x2_t v19 = v48;
    if ((unint64_t)v24 < v17)
    {
LABEL_10:
      *(_OWORD *)float64x2_t v24 = xmmword_1A28FCBC0;
      float64x2_t v25 = v24 + 16;
      if ((unint64_t)(v24 + 16) < v17) {
        goto LABEL_11;
      }
      goto LABEL_52;
    }
  }
  else
  {
    v20[1] = xmmword_1A28FCBD0;
    float64x2_t v24 = (char *)(v20 + 2);
    if ((unint64_t)(v20 + 2) < v17) {
      goto LABEL_10;
    }
  }
  uint64_t v49 = (v24 - v19) >> 4;
  unint64_t v50 = v49 + 1;
  if ((unint64_t)(v49 + 1) >> 60) {
    goto LABEL_279;
  }
  if ((uint64_t)(v17 - (void)v19) >> 3 > v50) {
    unint64_t v50 = (uint64_t)(v17 - (void)v19) >> 3;
  }
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v51 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v51 = v50;
  }
  if (v51)
  {
    if (v51 >> 60) {
      goto LABEL_276;
    }
    double v52 = (char *)operator new(16 * v51);
  }
  else
  {
    double v52 = 0;
  }
  __double2 v53 = &v52[16 * v49];
  unint64_t v17 = (unint64_t)&v52[16 * v51];
  *(_OWORD *)__double2 v53 = xmmword_1A28FCBC0;
  float64x2_t v25 = v53 + 16;
  if (v24 == v19)
  {
    __double2 v54 = &v52[16 * v49];
  }
  else
  {
    do
    {
      __double2 v54 = v53 - 16;
      *((_OWORD *)v53 - 1) = *((_OWORD *)v24 - 1);
      v24 -= 16;
      v53 -= 16;
    }
    while (v24 != v19);
  }
  operator delete(v19);
  float64x2_t v19 = v54;
  if ((unint64_t)v25 < v17)
  {
LABEL_11:
    *(_OWORD *)float64x2_t v25 = xmmword_1A28FF340;
    double v26 = v25 + 16;
    if ((unint64_t)(v25 + 16) < v17) {
      goto LABEL_12;
    }
    goto LABEL_67;
  }
LABEL_52:
  uint64_t v55 = (v25 - v19) >> 4;
  unint64_t v56 = v55 + 1;
  if ((unint64_t)(v55 + 1) >> 60) {
    goto LABEL_279;
  }
  if ((uint64_t)(v17 - (void)v19) >> 3 > v56) {
    unint64_t v56 = (uint64_t)(v17 - (void)v19) >> 3;
  }
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v57 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v57 = v56;
  }
  if (v57)
  {
    if (v57 >> 60) {
      goto LABEL_276;
    }
    double v58 = (char *)operator new(16 * v57);
  }
  else
  {
    double v58 = 0;
  }
  float v59 = &v58[16 * v55];
  unint64_t v17 = (unint64_t)&v58[16 * v57];
  *(_OWORD *)float v59 = xmmword_1A28FF340;
  double v26 = v59 + 16;
  if (v25 == v19)
  {
    float v60 = &v58[16 * v55];
  }
  else
  {
    do
    {
      float v60 = v59 - 16;
      *((_OWORD *)v59 - 1) = *((_OWORD *)v25 - 1);
      v25 -= 16;
      v59 -= 16;
    }
    while (v25 != v19);
  }
  operator delete(v19);
  float64x2_t v19 = v60;
  if ((unint64_t)v26 < v17)
  {
LABEL_12:
    *(_OWORD *)double v26 = xmmword_1A28FF350;
    double v27 = v26 + 16;
    if ((unint64_t)(v26 + 16) < v17) {
      goto LABEL_13;
    }
LABEL_82:
    uint64_t v66 = (v27 - v19) >> 4;
    unint64_t v67 = v66 + 1;
    if ((unint64_t)(v66 + 1) >> 60) {
      goto LABEL_279;
    }
    if ((uint64_t)(v17 - (void)v19) >> 3 > v67) {
      unint64_t v67 = (uint64_t)(v17 - (void)v19) >> 3;
    }
    if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v68 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v68 = v67;
    }
    if (v68)
    {
      if (v68 >> 60) {
        goto LABEL_276;
      }
      float v69 = (char *)operator new(16 * v68);
    }
    else
    {
      float v69 = 0;
    }
    uint64_t v70 = &v69[16 * v66];
    unint64_t v17 = (unint64_t)&v69[16 * v68];
    *(_OWORD *)uint64_t v70 = xmmword_1A28FF360;
    double v28 = v70 + 16;
    if (v27 == v19) {
      goto LABEL_95;
    }
    do
    {
      *((_OWORD *)v70 - 1) = *((_OWORD *)v27 - 1);
      v70 -= 16;
      v27 -= 16;
    }
    while (v27 != v19);
    if (v19) {
LABEL_95:
    }
      operator delete(v19);
    float64x2_t v19 = v70;
    if ((unint64_t)v28 < v17) {
      goto LABEL_14;
    }
    goto LABEL_97;
  }
LABEL_67:
  uint64_t v61 = (v26 - v19) >> 4;
  unint64_t v62 = v61 + 1;
  if ((unint64_t)(v61 + 1) >> 60) {
    goto LABEL_279;
  }
  if ((uint64_t)(v17 - (void)v19) >> 3 > v62) {
    unint64_t v62 = (uint64_t)(v17 - (void)v19) >> 3;
  }
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v63 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v63 = v62;
  }
  if (v63)
  {
    if (v63 >> 60) {
      goto LABEL_276;
    }
    double v64 = (char *)operator new(16 * v63);
  }
  else
  {
    double v64 = 0;
  }
  double v65 = &v64[16 * v61];
  unint64_t v17 = (unint64_t)&v64[16 * v63];
  *(_OWORD *)double v65 = xmmword_1A28FF350;
  double v27 = v65 + 16;
  if (v26 == v19) {
    goto LABEL_80;
  }
  do
  {
    *((_OWORD *)v65 - 1) = *((_OWORD *)v26 - 1);
    v65 -= 16;
    v26 -= 16;
  }
  while (v26 != v19);
  if (v19) {
LABEL_80:
  }
    operator delete(v19);
  float64x2_t v19 = v65;
  if ((unint64_t)v27 >= v17) {
    goto LABEL_82;
  }
LABEL_13:
  *(_OWORD *)double v27 = xmmword_1A28FF360;
  double v28 = v27 + 16;
  if ((unint64_t)(v27 + 16) < v17)
  {
LABEL_14:
    *(_OWORD *)double v28 = xmmword_1A28FF370;
    uint64_t v29 = v28 + 16;
    if ((unint64_t)(v28 + 16) < v17) {
      goto LABEL_15;
    }
    goto LABEL_112;
  }
LABEL_97:
  uint64_t v71 = (v28 - v19) >> 4;
  unint64_t v72 = v71 + 1;
  if ((unint64_t)(v71 + 1) >> 60) {
    goto LABEL_279;
  }
  if ((uint64_t)(v17 - (void)v19) >> 3 > v72) {
    unint64_t v72 = (uint64_t)(v17 - (void)v19) >> 3;
  }
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v73 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v73 = v72;
  }
  if (v73)
  {
    if (v73 >> 60) {
      goto LABEL_276;
    }
    double v74 = (char *)operator new(16 * v73);
  }
  else
  {
    double v74 = 0;
  }
  uint64_t v75 = &v74[16 * v71];
  unint64_t v17 = (unint64_t)&v74[16 * v73];
  *(_OWORD *)uint64_t v75 = xmmword_1A28FF370;
  uint64_t v29 = v75 + 16;
  if (v28 == v19) {
    goto LABEL_110;
  }
  do
  {
    *((_OWORD *)v75 - 1) = *((_OWORD *)v28 - 1);
    v75 -= 16;
    v28 -= 16;
  }
  while (v28 != v19);
  if (v19) {
LABEL_110:
  }
    operator delete(v19);
  float64x2_t v19 = v75;
  if ((unint64_t)v29 < v17)
  {
LABEL_15:
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)uint64_t v29 = _Q0;
    float64x2_t v35 = v29 + 16;
    if ((unint64_t)(v29 + 16) < v17) {
      goto LABEL_16;
    }
    goto LABEL_127;
  }
LABEL_112:
  uint64_t v76 = (v29 - v19) >> 4;
  unint64_t v77 = v76 + 1;
  if ((unint64_t)(v76 + 1) >> 60) {
LABEL_279:
  }
    abort();
  if ((uint64_t)(v17 - (void)v19) >> 3 > v77) {
    unint64_t v77 = (uint64_t)(v17 - (void)v19) >> 3;
  }
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v78 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v78 = v77;
  }
  if (v78)
  {
    if (v78 >> 60) {
      goto LABEL_276;
    }
    long long v79 = (char *)operator new(16 * v78);
  }
  else
  {
    long long v79 = 0;
  }
  double v80 = &v79[16 * v76];
  unint64_t v17 = (unint64_t)&v79[16 * v78];
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)double v80 = _Q0;
  float64x2_t v35 = v80 + 16;
  if (v29 == v19) {
    goto LABEL_125;
  }
  do
  {
    *((_OWORD *)v80 - 1) = *((_OWORD *)v29 - 1);
    v80 -= 16;
    v29 -= 16;
  }
  while (v29 != v19);
  if (v19) {
LABEL_125:
  }
    operator delete(v19);
  float64x2_t v19 = v80;
  if ((unint64_t)v35 < v17)
  {
LABEL_16:
    *(_OWORD *)float64x2_t v35 = xmmword_1A28FCC30;
    float64x2_t v36 = v35 + 16;
    if ((unint64_t)(v35 + 16) < v17) {
      goto LABEL_17;
    }
    goto LABEL_142;
  }
LABEL_127:
  uint64_t v82 = (v35 - v19) >> 4;
  unint64_t v83 = v82 + 1;
  if ((unint64_t)(v82 + 1) >> 60) {
    goto LABEL_280;
  }
  if ((uint64_t)(v17 - (void)v19) >> 3 > v83) {
    unint64_t v83 = (uint64_t)(v17 - (void)v19) >> 3;
  }
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v84 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v84 = v83;
  }
  if (v84)
  {
    if (v84 >> 60) {
      goto LABEL_276;
    }
    long double v85 = (char *)operator new(16 * v84);
  }
  else
  {
    long double v85 = 0;
  }
  long long v86 = &v85[16 * v82];
  unint64_t v17 = (unint64_t)&v85[16 * v84];
  *(_OWORD *)long long v86 = xmmword_1A28FCC30;
  float64x2_t v36 = v86 + 16;
  if (v35 == v19) {
    goto LABEL_140;
  }
  do
  {
    *((_OWORD *)v86 - 1) = *((_OWORD *)v35 - 1);
    v86 -= 16;
    v35 -= 16;
  }
  while (v35 != v19);
  if (v19) {
LABEL_140:
  }
    operator delete(v19);
  float64x2_t v19 = v86;
  if ((unint64_t)v36 < v17)
  {
LABEL_17:
    *(_OWORD *)float64x2_t v36 = xmmword_1A28FF380;
    float64x2_t v37 = v36 + 16;
    if ((unint64_t)(v36 + 16) < v17) {
      goto LABEL_18;
    }
    goto LABEL_157;
  }
LABEL_142:
  uint64_t v87 = (v36 - v19) >> 4;
  unint64_t v88 = v87 + 1;
  if ((unint64_t)(v87 + 1) >> 60) {
    goto LABEL_280;
  }
  if ((uint64_t)(v17 - (void)v19) >> 3 > v88) {
    unint64_t v88 = (uint64_t)(v17 - (void)v19) >> 3;
  }
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v89 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v89 = v88;
  }
  if (v89)
  {
    if (v89 >> 60) {
      goto LABEL_276;
    }
    v90 = (char *)operator new(16 * v89);
  }
  else
  {
    v90 = 0;
  }
  long long v91 = &v90[16 * v87];
  unint64_t v17 = (unint64_t)&v90[16 * v89];
  *(_OWORD *)long long v91 = xmmword_1A28FF380;
  float64x2_t v37 = v91 + 16;
  if (v36 == v19) {
    goto LABEL_155;
  }
  do
  {
    *((_OWORD *)v91 - 1) = *((_OWORD *)v36 - 1);
    v91 -= 16;
    v36 -= 16;
  }
  while (v36 != v19);
  if (v19) {
LABEL_155:
  }
    operator delete(v19);
  float64x2_t v19 = v91;
  if ((unint64_t)v37 < v17)
  {
LABEL_18:
    *(_OWORD *)float64x2_t v37 = xmmword_1A28FF390;
    double v38 = v37 + 16;
    if ((unint64_t)(v37 + 16) < v17) {
      goto LABEL_19;
    }
    goto LABEL_172;
  }
LABEL_157:
  uint64_t v92 = (v37 - v19) >> 4;
  unint64_t v93 = v92 + 1;
  if ((unint64_t)(v92 + 1) >> 60) {
    goto LABEL_280;
  }
  if ((uint64_t)(v17 - (void)v19) >> 3 > v93) {
    unint64_t v93 = (uint64_t)(v17 - (void)v19) >> 3;
  }
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v94 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v94 = v93;
  }
  if (v94)
  {
    if (v94 >> 60) {
      goto LABEL_276;
    }
    v95 = (char *)operator new(16 * v94);
  }
  else
  {
    v95 = 0;
  }
  v96 = &v95[16 * v92];
  unint64_t v17 = (unint64_t)&v95[16 * v94];
  *(_OWORD *)v96 = xmmword_1A28FF390;
  double v38 = v96 + 16;
  if (v37 == v19) {
    goto LABEL_170;
  }
  do
  {
    *((_OWORD *)v96 - 1) = *((_OWORD *)v37 - 1);
    v96 -= 16;
    v37 -= 16;
  }
  while (v37 != v19);
  if (v19) {
LABEL_170:
  }
    operator delete(v19);
  float64x2_t v19 = v96;
  if ((unint64_t)v38 < v17)
  {
LABEL_19:
    *(_OWORD *)double v38 = xmmword_1A28FF3A0;
    unsigned long long v39 = v38 + 16;
    if ((unint64_t)(v38 + 16) < v17) {
      goto LABEL_20;
    }
LABEL_187:
    uint64_t v102 = (v39 - v19) >> 4;
    unint64_t v103 = v102 + 1;
    if ((unint64_t)(v102 + 1) >> 60) {
      goto LABEL_280;
    }
    if ((uint64_t)(v17 - (void)v19) >> 3 > v103) {
      unint64_t v103 = (uint64_t)(v17 - (void)v19) >> 3;
    }
    if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v104 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v104 = v103;
    }
    if (v104)
    {
      if (v104 >> 60) {
        goto LABEL_276;
      }
      v105 = (char *)operator new(16 * v104);
    }
    else
    {
      v105 = 0;
    }
    long long v106 = &v105[16 * v102];
    unint64_t v17 = (unint64_t)&v105[16 * v104];
    *(_OWORD *)long long v106 = xmmword_1A28FF3B0;
    unsigned long long v40 = v106 + 16;
    if (v39 == v19) {
      goto LABEL_200;
    }
    do
    {
      *((_OWORD *)v106 - 1) = *((_OWORD *)v39 - 1);
      v106 -= 16;
      v39 -= 16;
    }
    while (v39 != v19);
    if (v19) {
LABEL_200:
    }
      operator delete(v19);
    float64x2_t v19 = v106;
    if ((unint64_t)v40 < v17) {
      goto LABEL_21;
    }
LABEL_202:
    uint64_t v107 = (v40 - v19) >> 4;
    unint64_t v108 = v107 + 1;
    if (!((unint64_t)(v107 + 1) >> 60))
    {
      if ((uint64_t)(v17 - (void)v19) >> 3 > v108) {
        unint64_t v108 = (uint64_t)(v17 - (void)v19) >> 3;
      }
      if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v108 = 0xFFFFFFFFFFFFFFFLL;
      }
      if (!v108)
      {
        uint64_t v109 = 0;
LABEL_211:
        float v110 = &v109[16 * v107];
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)float v110 = _Q0;
        float64x2_t v42 = (double *)(v110 + 16);
        if (v40 == v19) {
          goto LABEL_214;
        }
        do
        {
          *((_OWORD *)v110 - 1) = *((_OWORD *)v40 - 1);
          v110 -= 16;
          v40 -= 16;
        }
        while (v40 != v19);
        if (v19) {
LABEL_214:
        }
          operator delete(v19);
        float64x2_t v19 = v110;
        goto LABEL_216;
      }
      if (!(v108 >> 60))
      {
        uint64_t v109 = (char *)operator new(16 * v108);
        goto LABEL_211;
      }
LABEL_276:
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
LABEL_280:
    abort();
  }
LABEL_172:
  uint64_t v97 = (v38 - v19) >> 4;
  unint64_t v98 = v97 + 1;
  if ((unint64_t)(v97 + 1) >> 60) {
    goto LABEL_280;
  }
  if ((uint64_t)(v17 - (void)v19) >> 3 > v98) {
    unint64_t v98 = (uint64_t)(v17 - (void)v19) >> 3;
  }
  if (v17 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v99 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v99 = v98;
  }
  if (v99)
  {
    if (v99 >> 60) {
      goto LABEL_276;
    }
    v100 = (char *)operator new(16 * v99);
  }
  else
  {
    v100 = 0;
  }
  v101 = &v100[16 * v97];
  unint64_t v17 = (unint64_t)&v100[16 * v99];
  *(_OWORD *)v101 = xmmword_1A28FF3A0;
  unsigned long long v39 = v101 + 16;
  if (v38 == v19) {
    goto LABEL_185;
  }
  do
  {
    *((_OWORD *)v101 - 1) = *((_OWORD *)v38 - 1);
    v101 -= 16;
    v38 -= 16;
  }
  while (v38 != v19);
  if (v19) {
LABEL_185:
  }
    operator delete(v19);
  float64x2_t v19 = v101;
  if ((unint64_t)v39 >= v17) {
    goto LABEL_187;
  }
LABEL_20:
  *(_OWORD *)unsigned long long v39 = xmmword_1A28FF3B0;
  unsigned long long v40 = v39 + 16;
  if ((unint64_t)(v39 + 16) >= v17) {
    goto LABEL_202;
  }
LABEL_21:
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)unsigned long long v40 = _Q0;
  float64x2_t v42 = (double *)(v40 + 16);
LABEL_216:
  [(VKCameraController *)self camera];
  double v112 = v210;
  float v113 = (double *)(*(void *)&v210 + 8);
  if (*(double *)&v211 != 0.0 && !atomic_fetch_add(&v211->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v211->__on_zero_shared)(v211);
    std::__shared_weak_count::__release_weak(v211);
  }
  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(&v210, v113);
  double v114 = *(double *)(*(void *)&v112 + 32);
  double v115 = cos(3.14159265 - *(double *)(*(void *)&v112 + 40));
  double v116 = v210;
  v117 = v211;
  double v118 = v212;
  retstr->double var1 = 0;
  retstr->var2.double var0 = 0;
  retstr->double var0 = 0;
  if (v19 == (char *)v42)
  {
LABEL_274:
    operator delete(v19);
    return result;
  }
  double v119 = sqrt((v114 + v115 * -12756274.0) * v114 + 4.06806316e13);
  double v120 = v119 + -6378137.0;
  double v121 = sqrt((v119 + 6378137.0) * (v119 + -6378137.0));
  double v122 = sqrt(v116 * v116 + *(double *)&v117 * *(double *)&v117 + v118 * v118);
  double v198 = v121 + v121;
  double v200 = (v122 - v120) * (v122 - v120);
  double v199 = v121;
  v123 = (double *)v19;
  v196 = self;
  do
  {
    [(VKCameraController *)self camera];
    double v126 = gdc::ViewDataAccess::worldRayFromScreenNormalizedPoint((uint64_t)&v204, *(uint64_t *)&v202, v113, *v123, v123[1]);
    v127 = v203;
    if (v203 && !atomic_fetch_add(&v203->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *, double))v127->__on_zero_shared)(v127, v126);
      std::__shared_weak_count::__release_weak(v127);
    }
    double v202 = 0.0;
    double v128 = v204;
    double v129 = v205;
    double v130 = v206;
    double v131 = v207;
    double v133 = v208;
    double v132 = v209;
    double v134 = v131 * v131 + v133 * v133 + v132 * v132;
    double v135 = v207 * v204 + v208 * v205 + v209 * v206;
    double v136 = v135 + v135;
    double v137 = (v200 - (v128 * v128 + v129 * v129 + v130 * v130)) * (4.0 * v134) + v136 * v136;
    long double v138 = 0.0;
    if (v137 < 0.0)
    {
      long double v139 = 0.0;
      double v140 = v198;
      goto LABEL_233;
    }
    double v141 = sqrt(v137);
    double v142 = (v141 + v136) * -0.5 / v134;
    double v143 = (v141 - v136) * 0.5 / v134;
    if (v142 >= 0.0)
    {
      double v202 = v142;
      v144 = (double *)&v201;
    }
    else
    {
      long double v139 = 0.0;
      double v140 = v198;
      if (v143 < 0.0) {
        goto LABEL_233;
      }
      v144 = &v202;
    }
    double *v144 = v143;
    long double v145 = v128 + v131 * v202;
    long double v146 = v129 + v133 * v202;
    long double v147 = v130 + v132 * v202;
    double v148 = sqrt(v145 * v145 + v146 * v146);
    double v149 = atan2(v147, v148 * 0.996647189);
    long double v197 = atan2(v146, v145);
    __double2 v150 = __sincos_stret(v149);
    long double v151 = v148 + v150.__cosval * v150.__cosval * -42697.6727 * v150.__cosval;
    long double v138 = v197;
    long double v139 = atan2(v147 + v150.__sinval * v150.__sinval * 42841.3115 * v150.__sinval, v151);
    double v140 = sqrt((v210 - v145) * (v210 - v145)+ (*(double *)&v211 - v146) * (*(double *)&v211 - v146)+ (v212 - v147) * (v212 - v147));
    double v121 = v199;
LABEL_233:
    if (v140 >= v121)
    {
      long double v154 = v210 + v131 * v121;
      long double v155 = *(double *)&v211 + v133 * v121;
      long double v156 = v212 + v132 * v121;
      double v157 = sqrt(v154 * v154 + v155 * v155);
      double v158 = atan2(v156, v157 * 0.996647189);
      long double v159 = atan2(v155, v154);
      __double2 v160 = __sincos_stret(v158);
      double v161 = atan2(v156 + v160.__sinval * v160.__sinval * 42841.3115 * v160.__sinval, v157 + v160.__cosval * v160.__cosval * -42697.6727 * v160.__cosval);
      double v162 = v161;
      double var1 = (long double *)retstr->var1;
      double var0 = (long double *)retstr->var2.var0;
      if (var1 < var0)
      {
        *double var1 = v161;
        var1[1] = v159;
        v124 = var1 + 2;
        double v121 = v199;
        goto LABEL_222;
      }
      v165 = (long double *)retstr->var0;
      uint64_t v166 = (char *)var1 - (char *)retstr->var0;
      unint64_t v167 = (v166 >> 4) + 1;
      if (v167 >> 60) {
        abort();
      }
      uint64_t v168 = (char *)var0 - (char *)v165;
      if (v168 >> 3 > v167) {
        unint64_t v167 = v168 >> 3;
      }
      if ((unint64_t)v168 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v169 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v169 = v167;
      }
      double v121 = v199;
      if (v169 >> 60) {
        goto LABEL_276;
      }
      Coordinate2D<geo::Radians, double> result = (vector<geo::Coordinate2D<geo::Radians, double>, std::allocator<geo::Coordinate2D<geo::Radians, double>>> *)operator new(16 * v169);
      v170 = &result->var0 + 2 * (v166 >> 4);
      *(double *)v170 = v162;
      *((long double *)v170 + 1) = v159;
      int64_t v171 = (char *)var1 - (char *)v165;
      if (var1 == v165) {
        goto LABEL_257;
      }
      unint64_t v172 = v171 - 16;
      self = v196;
      if ((unint64_t)(v171 - 16) >= 0xB0)
      {
        unint64_t v179 = v172 >> 4;
        if ((char *)result + v166 - (v172 & 0xFFFFFFFFFFFFFFF0) - 16 >= (char *)var1
          || (v173 = &result->var0 + 2 * (v166 >> 4), &var1[-2 * v179 - 2] >= (long double *)v170))
        {
          unint64_t v180 = v179 + 1;
          v181 = var1 - 4;
          v182 = (double *)(v170 - 4);
          uint64_t v183 = v180 & 0x1FFFFFFFFFFFFFFCLL;
          do
          {
            float64x2x2_t v213 = vld2q_f64(v181);
            v184 = v181 - 4;
            float64x2x2_t v215 = vld2q_f64(v184);
            vst2q_f64(v182, v213);
            v185 = v182 - 4;
            vst2q_f64(v185, v215);
            v182 -= 8;
            v181 -= 8;
            v183 -= 4;
          }
          while (v183);
          v173 = &v170[-2 * (v180 & 0x1FFFFFFFFFFFFFFCLL)];
          var1 -= 2 * (v180 & 0x1FFFFFFFFFFFFFFCLL);
          if (v180 == (v180 & 0x1FFFFFFFFFFFFFFCLL)) {
            goto LABEL_271;
          }
        }
      }
      else
      {
        v173 = &result->var0 + 2 * (v166 >> 4);
      }
      do
      {
        v186 = (void *)*((void *)var1 - 2);
        var1 -= 2;
        *(v173 - 2) = v186;
        v173 -= 2;
        v173[1] = (void *)*((void *)var1 + 1);
      }
      while (var1 != v165);
    }
    else
    {
      v153 = (char *)retstr->var1;
      v152 = (char *)retstr->var2.var0;
      if (v153 < v152)
      {
        *(long double *)v153 = v139;
        *((long double *)v153 + 1) = v138;
        v124 = v153 + 16;
        goto LABEL_222;
      }
      v165 = (long double *)retstr->var0;
      uint64_t v174 = v153 - (char *)retstr->var0;
      unint64_t v175 = (v174 >> 4) + 1;
      if (v175 >> 60) {
        abort();
      }
      uint64_t v176 = v152 - (char *)v165;
      if (v176 >> 3 > v175) {
        unint64_t v175 = v176 >> 3;
      }
      if ((unint64_t)v176 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v169 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v169 = v175;
      }
      if (v169 >> 60) {
        goto LABEL_276;
      }
      Coordinate2D<geo::Radians, double> result = (vector<geo::Coordinate2D<geo::Radians, double>, std::allocator<geo::Coordinate2D<geo::Radians, double>>> *)operator new(16 * v169);
      v170 = &result->var0 + 2 * (v174 >> 4);
      *(long double *)v170 = v139;
      *((long double *)v170 + 1) = v138;
      int64_t v177 = v153 - (char *)v165;
      if (v153 == (char *)v165)
      {
LABEL_257:
        v173 = v170;
        self = v196;
        goto LABEL_271;
      }
      unint64_t v178 = v177 - 16;
      self = v196;
      if ((unint64_t)(v177 - 16) >= 0xB0)
      {
        unint64_t v187 = v178 >> 4;
        if ((char *)result + v174 - (v178 & 0xFFFFFFFFFFFFFFF0) - 16 >= v153
          || (v173 = &result->var0 + 2 * (v174 >> 4), &v153[-16 * v187 - 16] >= (char *)v170))
        {
          unint64_t v188 = v187 + 1;
          v189 = (const double *)(v153 - 32);
          v190 = (double *)(v170 - 4);
          uint64_t v191 = v188 & 0x1FFFFFFFFFFFFFFCLL;
          do
          {
            float64x2x2_t v214 = vld2q_f64(v189);
            v192 = v189 - 4;
            float64x2x2_t v216 = vld2q_f64(v192);
            vst2q_f64(v190, v214);
            v193 = v190 - 4;
            vst2q_f64(v193, v216);
            v190 -= 8;
            v189 -= 8;
            v191 -= 4;
          }
          while (v191);
          v173 = &v170[-2 * (v188 & 0x1FFFFFFFFFFFFFFCLL)];
          v153 -= 16 * (v188 & 0x1FFFFFFFFFFFFFFCLL);
          if (v188 == (v188 & 0x1FFFFFFFFFFFFFFCLL)) {
            goto LABEL_271;
          }
        }
      }
      else
      {
        v173 = &result->var0 + 2 * (v174 >> 4);
      }
      do
      {
        v194 = (void *)*((void *)v153 - 2);
        v153 -= 16;
        *(v173 - 2) = v194;
        v173 -= 2;
        v173[1] = (void *)*((void *)v153 + 1);
      }
      while (v153 != (char *)v165);
    }
LABEL_271:
    v195 = (char *)result + 16 * v169;
    v124 = v170 + 2;
    retstr->double var0 = v173;
    retstr->double var1 = v170 + 2;
    retstr->var2.double var0 = v195;
    if (v165) {
      operator delete(v165);
    }
LABEL_222:
    retstr->double var1 = v124;
    v123 += 2;
  }
  while (v123 != v42);
  if (v19) {
    goto LABEL_274;
  }
  return result;
}

- (void)setYaw:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(VKDaVinciCameraController *)self heading];
  if (vabdd_f64(a3, v7) >= 0.000001)
  {
    [(VKDaVinciCameraController *)self rotateTo:v4 animated:a3 * -0.0174532925];
  }
}

- (void)updateCameraManager
{
  cameraManager = self->_cameraManager;
  [(VKCameraController *)self camera];
  md::CameraManager::update((uint64_t)cameraManager, &v4, 0);
  id v3 = v5;
  if (v5)
  {
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

- (void)startTrackingAnnotation:(id)a3 trackHeading:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7
{
  uint64_t v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  annotationTrackingCameraController = self->super._annotationTrackingCameraController;
  if (!annotationTrackingCameraController)
  {
    unsigned int v26 = v9;
    long long v15 = [VKDaVinciAnnotationTrackingCameraController alloc];
    long long v16 = [(VKCameraController *)self mapDataAccess];
    unint64_t v17 = [(VKCameraController *)self animationRunner];
    uint64_t v18 = [(VKCameraController *)self runLoopController];
    float64x2_t v19 = [(VKCameraController *)self cameraDelegate];
    float64x2_t v20 = [(VKAnnotationTrackingCameraController *)v15 initWithMapDataAccess:v16 animationRunner:v17 runLoopController:v18 cameraDelegate:v19];
    float64x2_t v21 = self->super._annotationTrackingCameraController;
    self->super._annotationTrackingCameraController = v20;

    float64x2_t v22 = [(VKCameraController *)self vkCamera];
    [(VKCameraController *)self->super._annotationTrackingCameraController setVkCamera:v22];

    float64x2_t v23 = self->super._annotationTrackingCameraController;
    [(VKCameraController *)self camera];
    [(VKCameraController *)v23 setCamera:v29];
    float64x2_t v24 = v30;
    if (v30 && !atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
    float64x2_t v25 = [(VKCameraController *)self canvas];
    [(VKCameraController *)self->super._annotationTrackingCameraController setCanvas:v25];

    long long v27 = *(_OWORD *)&self->super._annotationTrackingBehavior.shouldZoomToFit;
    uint64_t v28 = *(void *)&self->super._annotationTrackingBehavior.shouldPreserveUserSpecifiedZoomLevel;
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setBehavior:&v27];
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setHasUserSpecifiedZoomLevel:self->super._userChangedZoomSinceLastProgrammaticRegionChange];
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setHeadingAnimationDisplayRate:self->super._annotationTrackingHeadingAnimationDisplayRate];
    [(VKCameraController *)self edgeInsets];
    -[VKCameraController setEdgeInsets:](self->super._annotationTrackingCameraController, "setEdgeInsets:");
    annotationTrackingCameraController = self->super._annotationTrackingCameraController;
    uint64_t v9 = v26;
  }
  [(VKAnnotationTrackingCameraController *)annotationTrackingCameraController startTrackingAnnotation:v12 trackHeading:v10 animated:v9 duration:v13 timingFunction:a6];
}

- (void)setGesturing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VKDaVinciCameraController;
  -[VKCameraController setGesturing:](&v5, sel_setGesturing_);
  [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setGesturing:v3];
}

- (void)updateState
{
  [(VKDaVinciCameraController *)self _updateIsPitched];
  [(VKDaVinciCameraController *)self _updateCanEnter3DMode];
}

- (void)_updateCanEnter3DMode
{
  BOOL v3 = [(VKDaVinciCameraController *)self canEnter3DMode];
  if (self->_couldEnter3DMode != v3)
  {
    BOOL v4 = v3;
    objc_super v5 = [(VKCameraController *)self cameraDelegate];
    [v5 mapLayerCanEnter3DModeDidChange:v4];

    self->_couldEnter3DMode = v4;
  }
}

- (void)_updateIsPitched
{
  BOOL v3 = [(VKDaVinciCameraController *)self isPitched];
  if (self->_wasPitched != v3)
  {
    BOOL v4 = v3;
    objc_super v5 = [(VKCameraController *)self cameraDelegate];
    [v5 mapLayerDidBecomePitched:v4];

    self->_wasPitched = v4;
  }
}

- (double)maxPitch
{
  [(VKDaVinciCameraController *)self currentZoomLevel];
  *(float *)&double v3 = v3;
  [(VKDaVinciCameraController *)self maxPitchForNormalizedZoomLevel:v3];
  return v4 * 57.2957795;
}

- (double)minPitch
{
  [(VKDaVinciCameraController *)self currentZoomLevel];
  *(float *)&double v3 = v3;
  [(VKDaVinciCameraController *)self minPitchForNormalizedZoomLevel:v3];
  return v4 * 57.2957795;
}

- (BOOL)isFullyPitched
{
  [(VKCameraController *)self camera];
  double v3 = *(double *)(v6 + 40);
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v7->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v7);
  }
  [(VKCameraController *)self camera];
  double v4 = *(double *)(v6 + 72);
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v7->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v7);
  }
  return v3 > v4;
}

- (BOOL)isPitched
{
  [(VKCameraController *)self camera];
  double v2 = *(double *)(v4 + 40);
  if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v5->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v5);
  }
  return v2 > 0.0001;
}

- (BOOL)canEnter3DMode
{
  [(VKDaVinciCameraController *)self currentZoomLevel];
  float v4 = v3;
  *(float *)&double v3 = v4;
  [(VKDaVinciCameraController *)self minPitchForNormalizedZoomLevel:v3];
  float v6 = v5;
  *(float *)&double v7 = v4;
  [(VKDaVinciCameraController *)self maxPitchForNormalizedZoomLevel:v7];
  return v8 > v6;
}

- (void)exit3DMode
{
}

- (void)enter3DMode
{
  [(VKDaVinciCameraController *)self currentZoomLevel];
  *(float *)&double v3 = v3;
  [(VKDaVinciCameraController *)self idealPitchForNormalizedZoomLevel:v3];
  double v5 = v4;
  [(VKDaVinciCameraController *)self tiltTo:1 animated:1 exaggerate:v5];
}

- (void)stopGlobeAnimations
{
  regionAnimation = self->super._regionAnimation;
  if (regionAnimation)
  {
    [(VKAnimation *)regionAnimation stop];
    float v4 = self->super._regionAnimation;
    self->super._regionAnimation = 0;
  }
  rotationAnimation = self->super._rotationAnimation;
  if (rotationAnimation)
  {
    [(VKAnimation *)rotationAnimation stop];
    float v6 = self->super._rotationAnimation;
    self->super._rotationAnimation = 0;
  }
  pitchAnimation = self->super._pitchAnimation;
  if (pitchAnimation)
  {
    [(VKAnimation *)pitchAnimation stop];
    float v8 = self->super._pitchAnimation;
    self->super._pitchAnimation = 0;
  }
  zoomAnimation = self->super._zoomAnimation;
  if (zoomAnimation)
  {
    [(VKAnimation *)zoomAnimation stop];
    BOOL v10 = self->super._zoomAnimation;
    self->super._zoomAnimation = 0;
  }
}

- (void)moveToZoomOutZoomInTransition:()Coordinate2D<geo:(double>)a3 :(double)a4 Radians height:(BOOL)a5 useHeight:(double)a6 zoom:(double)a7 rotation:(double)a8 tilt:(double)a9 duration:(id)a10 timingCurve:(id)a11 completion:
{
  id v12 = v11;
  double value = a3.longitude._value;
  double v17 = a3.latitude._value;
  uint64_t v18 = (double *)a5;
  id v20 = a11;
  float64x2_t v21 = v12;
  [(VKDaVinciCameraController *)self stopGlobeAnimations];
  [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController pauseAnimation];
  [(VKCameraController *)self camera];
  double v23 = *((double *)location + 12);
  double v22 = *((double *)location + 13);
  if (v80 && !atomic_fetch_add(&v80->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
    std::__shared_weak_count::__release_weak(v80);
  }
  [(VKCameraController *)self camera];
  double v24 = *((double *)location + 3);
  uint64_t v66 = (void *)*((void *)location + 1);
  unint64_t v67 = (void *)*((void *)location + 2);
  if (v80 && !atomic_fetch_add(&v80->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
    std::__shared_weak_count::__release_weak(v80);
  }
  [(VKCameraController *)self camera];
  double v65 = *((double *)location + 4);
  if (v80 && !atomic_fetch_add(&v80->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
    std::__shared_weak_count::__release_weak(v80);
  }
  [(VKCameraController *)self camera];
  float v60 = (void *)*((void *)location + 7);
  if (v80 && !atomic_fetch_add(&v80->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
    std::__shared_weak_count::__release_weak(v80);
  }
  [(VKCameraController *)self camera];
  float v59 = (void *)*((void *)location + 6);
  if (v80 && !atomic_fetch_add(&v80->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
    std::__shared_weak_count::__release_weak(v80);
  }
  [(VKCameraController *)self camera];
  double v58 = (void *)*((void *)location + 5);
  if (v80 && !atomic_fetch_add(&v80->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
    std::__shared_weak_count::__release_weak(v80);
  }
  unint64_t v56 = *(void **)v18;
  unint64_t v57 = (void *)*((void *)v18 + 1);
  [(VKCameraController *)self camera];
  double v61 = a7;
  double v62 = v24;
  double v63 = v17;
  double v64 = a6;
  double v68 = fmin(v22, fmax(v23, value));
  uint64_t v55 = (void *)*((void *)location + 7);
  if (v80 && !atomic_fetch_add(&v80->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
    std::__shared_weak_count::__release_weak(v80);
  }
  __double2 v25 = __sincos_stret(*(double *)&v66);
  double v26 = 6378137.0 / sqrt(-(v25.__sinval * v25.__sinval * 0.00669437999 + -1.0));
  __double2 v27 = __sincos_stret(*(double *)&v67);
  double v28 = v26 * v25.__cosval * v27.__cosval;
  double v29 = v26 * v25.__cosval * v27.__sinval;
  double v30 = v18[1];
  __double2 v31 = __sincos_stret(*v18);
  double v32 = 6378137.0 / sqrt(-(v31.__sinval * v31.__sinval * 0.00669437999 + -1.0));
  double v33 = v32 * v31.__cosval;
  __double2 v34 = __sincos_stret(v30);
  double v35 = acos(fmax(fmin((v31.__sinval * 0.99330562 * v32 * (v25.__sinval * 0.99330562 * v26)+ v33 * v34.__cosval * v28+ v33 * v34.__sinval * v29)/ sqrt((v33 * v34.__cosval * (v33 * v34.__cosval)+ v33 * v34.__sinval * (v33 * v34.__sinval)+ v31.__sinval * 0.99330562 * v32 * (v31.__sinval * 0.99330562 * v32))* (v28 * v28 + v29 * v29 + v25.__sinval * 0.99330562 * v26 * (v25.__sinval * 0.99330562 * v26))), 1.0), -1.0));
  double v36 = ((fabs(v62 - (v68 + v63) + v65) * 0.0000000499064047 + v35 * 0.318309886) * 0.8 + 0.2) * v61;
  if (v36 <= 0.0)
  {
    [(VKCameraController *)self beginRegionChange:0];
    cameraManager = self->_cameraManager;
    cameraManager[242] = 0;
    cameraManager[244] = 0;
    [(VKCameraController *)self camera];
    double v46 = (double *)location;
    *(_OWORD *)((char *)location + 8) = *(_OWORD *)v18;
    v46[3] = v63;
    if (v80 && !atomic_fetch_add(&v80->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
      std::__shared_weak_count::__release_weak(v80);
    }
    [(VKCameraController *)self camera];
    double v47 = v80;
    *((double *)location + 5) = v64;
    if (v47 && !atomic_fetch_add(&v47->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
    [(VKCameraController *)self camera];
    double v48 = v80;
    *((double *)location + 4) = v68;
    if (v48 && !atomic_fetch_add(&v48->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
    [(VKCameraController *)self camera];
    uint64_t v49 = v80;
    *((double *)location + 6) = a4;
    if (v49 && !atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
    unint64_t v50 = self->_cameraManager;
    [(VKCameraController *)self camera];
    md::CameraManager::update((uint64_t)v50, (uint64_t *)&location, 1);
    unint64_t v51 = v80;
    if (v80 && !atomic_fetch_add(&v80->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
    [(VKDaVinciCameraController *)self _updateIsPitched];
    [(VKDaVinciCameraController *)self _updateCanEnter3DMode];
    double v52 = [(VKCameraController *)self cameraDelegate];
    [v52 mapLayerDidChangeVisibleRegion];

    uint64_t v53 = *(void *)[(VKCameraController *)self runLoopController];
    if (v53)
    {
      LOBYTE(location) = 4;
      md::MapEngine::setNeedsTick(v53, &location);
    }
    [(VKCameraController *)self endRegionChange];
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController resumeAnimation];
    *((unsigned char *)self->_cameraManager + 242) = 1;
    if (v21) {
      v21[2](v21, 1);
    }
  }
  else
  {
    float64x2_t v37 = [[VKTimedAnimation alloc] initWithDuration:v36];
    regionAnimation = self->super._regionAnimation;
    self->super._regionAnimation = v37;

    if (v20) {
      uint64_t v39 = (uint64_t)v20;
    }
    else {
      uint64_t v39 = VKAnimationCurveExponentialEaseInOut;
    }
    unsigned long long v40 = (void *)MEMORY[0x1A6239EB0](v39);
    [(VKTimedAnimation *)self->super._regionAnimation setTimingFunction:v40];
    objc_initWeak(&location, self);
    if (fabs(v35 * 57.2957795) <= 0.05)
    {
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3321888768;
      v77[2] = __127__VKDaVinciCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke;
      v77[3] = &unk_1EF58DF28;
      float64x2_t v42 = v78;
      objc_copyWeak(v78, &location);
      v78[1] = v66;
      v78[2] = v67;
      v78[3] = *(id *)&v62;
      v78[4] = *(id *)&v65;
      v78[5] = v58;
      v78[6] = v59;
      v78[7] = v60;
      v78[8] = v56;
      v78[9] = v57;
      v78[10] = *(id *)&v63;
      v78[11] = *(id *)&v68;
      v78[12] = *(id *)&v64;
      v78[13] = *(id *)&a4;
      v78[14] = v55;
      [(VKTimedAnimation *)self->super._regionAnimation setStepHandler:v77];
    }
    else
    {
      v76[0] = v66;
      v76[1] = v67;
      *(double *)&double v76[2] = v62;
      *(double *)&v76[3] = v65;
      v76[4] = v58;
      v76[5] = v59;
      v76[6] = v60;
      v75[0] = v56;
      v75[1] = v57;
      *(double *)&v75[2] = v63;
      *(double *)&v75[3] = v68;
      *(double *)&v75[4] = v64;
      *(double *)&v75[5] = a4;
      v75[6] = v55;
      float64x2_t v41 = [(VKDaVinciCameraController *)self createMoveToZoomOutZoomInFrameFunction:v76 toLatLon:v75];
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __127__VKDaVinciCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_17;
      v72[3] = &unk_1E5A94408;
      float64x2_t v42 = &v74;
      objc_copyWeak(&v74, &location);
      id v73 = v41;
      uint64_t v43 = self->super._regionAnimation;
      id v44 = v41;
      [(VKTimedAnimation *)v43 setStepHandler:v72];
    }
    objc_destroyWeak(v42);
    [(VKCameraController *)self beginRegionChange:1];
    __double2 v54 = self->_cameraManager;
    v54[242] = 0;
    v54[244] = 0;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    void v69[2] = __127__VKDaVinciCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_2;
    v69[3] = &unk_1E5A98E30;
    objc_copyWeak(&v71, &location);
    uint64_t v70 = v21;
    [(VKAnimation *)self->super._regionAnimation setCompletionHandler:v69];
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._regionAnimation->super);

    objc_destroyWeak(&v71);
    objc_destroyWeak(&location);
  }
}

void __127__VKDaVinciCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke(uint64_t a1, float a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    double v6 = *(double *)(a1 + 80);
    double v29 = *(double *)(a1 + 128);
    double v30 = *(double *)(a1 + 72);
    double v28 = *(double *)(a1 + 136);
    double v7 = *(double *)(a1 + 40);
    double v8 = *(double *)(a1 + 48);
    double v9 = *(double *)(a1 + 96);
    double v10 = *(double *)(a1 + 104);
    float64x2_t v31 = *(float64x2_t *)(a1 + 56);
    float64x2_t v32 = *(float64x2_t *)(a1 + 112);
    [WeakRetained camera];
    long double v11 = fmod(3.14159265 - v8 + v10, 6.28318531);
    long double v12 = fmod(v11 + 6.28318531, 6.28318531);
    long double v13 = fmod(v8 + 3.14159265 + (v12 + -3.14159265) * a2, 6.28318531);
    long double v14 = fmod(v13 + 6.28318531, 6.28318531) + -3.14159265;
    long double v15 = fmod(3.14159265 - v7 + v9, 6.28318531);
    long double v16 = fmod(v15 + 6.28318531, 6.28318531);
    long double v17 = fmod(v7 + 3.14159265 + (v16 + -3.14159265) * a2, 6.28318531);
    long double v18 = fmod(v17 + 6.28318531, 6.28318531) + -3.14159265;
    long double v19 = fmod(3.14159265 - v6 + v28, 6.28318531);
    long double v20 = fmod(v19 + 6.28318531, 6.28318531);
    long double v21 = fmod(v6 + 3.14159265 + (v20 + -3.14159265) * a2, 6.28318531);
    long double v22 = fmod(v21 + 6.28318531, 6.28318531);
    uint64_t v23 = v33;
    *(long double *)(v33 + 8) = v18;
    *(long double *)(v23 + 16) = v14;
    *(float64x2_t *)(v23 + 24) = vmlaq_n_f64(v31, vsubq_f64(v32, v31), a2);
    *(double *)(v23 + 40) = v30 + (v29 - v30) * a2;
    *(long double *)(v23 + 48) = v22 + -3.14159265;
    *(void *)(v23 + 56) = 0;
    if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
    uint64_t v24 = v5[35];
    [v5 camera];
    md::CameraManager::update(v24, &v33, 0);
    __double2 v25 = v34;
    if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
    [v5 _updateIsPitched];
    [v5 _updateCanEnter3DMode];
    double v26 = [v5 cameraDelegate];
    [v26 mapLayerDidChangeVisibleRegion];

    uint64_t v27 = *(void *)[v5 runLoopController];
    if (v27)
    {
      LOBYTE(v33) = 4;
      md::MapEngine::setNeedsTick(v27, &v33);
    }
  }
}

void __127__VKDaVinciCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_17(uint64_t a1, float a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained camera];
    uint64_t v6 = v16;
    (*(void (**)(_OWORD *__return_ptr, float))(*(void *)(a1 + 32) + 16))(v14, a2);
    long long v7 = v14[0];
    long long v8 = v14[1];
    long long v9 = v14[2];
    *(void *)(v6 + 56) = v15;
    *(_OWORD *)(v6 + 40) = v9;
    *(_OWORD *)(v6 + 24) = v8;
    *(_OWORD *)(v6 + 8) = v7;
    double v10 = v17;
    if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    uint64_t v11 = v5[35];
    [v5 camera];
    md::CameraManager::update(v11, (uint64_t *)v14, 0);
    long double v12 = (std::__shared_weak_count *)*((void *)&v14[0] + 1);
    if (*((void *)&v14[0] + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v14[0] + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    [v5 _updateIsPitched];
    [v5 _updateCanEnter3DMode];
    long double v13 = [v5 cameraDelegate];
    [v13 mapLayerDidChangeVisibleRegion];
  }
}

void __127__VKDaVinciCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(unsigned char *)(*((void *)WeakRetained + 35) + 242) = 1;
    [WeakRetained endRegionChange];
    [*((id *)WeakRetained + 23) resumeAnimation];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
    }
  }
}

- (id)createMoveToZoomOutZoomInFrameFunction:()CameraFrame<geo:(double> *)a3 :()CameraFrame<geo:(double> *)a4 :Radians Radians toLatLon:
{
  double value = a3->_target.latitude._value;
  double v7 = a4->_target.longitude._value;
  double v8 = a4->_target.altitude._value;
  double v63 = a4->_distanceFromTarget._value;
  double v64 = a3->_target.longitude._value;
  double v60 = a3->_target.altitude._value;
  double v61 = a3->_distanceFromTarget._value;
  double v9 = a3->_heading._value;
  double v10 = a4->_heading._value;
  double v49 = v10;
  double v62 = v9;
  double v55 = v10 - v9;
  if ((v9 > 0.0) - (v9 < 0.0) == (v10 > 0.0) - (v10 < 0.0))
  {
    double v42 = 0.95;
    double v52 = 0.05;
  }
  else
  {
    double v52 = -v9 / (v10 - v9);
    double v42 = v52;
  }
  double v59 = a4->_target.latitude._value;
  __double2 v11 = __sincos_stret(a4->_target.latitude._value);
  double v12 = 6378137.0 / sqrt(-(v11.__sinval * v11.__sinval * 0.00669437999 + -1.0));
  double v13 = (v12 + v8) * v11.__cosval;
  __double2 v14 = __sincos_stret(v7);
  double v57 = v13 * v14.__cosval;
  double v54 = value;
  __double2 v15 = __sincos_stret(value);
  double v58 = v7;
  double v16 = 6378137.0 / sqrt(-(v15.__sinval * v15.__sinval * 0.00669437999 + -1.0));
  double v17 = (v16 + v60) * v15.__cosval;
  __double2 v18 = __sincos_stret(v64);
  double v45 = v17 * v18.__cosval;
  double v47 = v13 * v14.__sinval;
  double v48 = (v8 + v12 * 0.99330562) * v11.__sinval;
  double v44 = v17 * v18.__sinval;
  double v46 = fmax(fmax(acos(fmax(fmin((v48 * ((v60 + v16 * 0.99330562) * v15.__sinval)+ v57 * (v17 * v18.__cosval)+ v47 * (v17 * v18.__sinval))/ sqrt((v57 * v57 + v47 * v47 + v48 * v48)* (v45 * v45+ v44 * v44+ (v60 + v16 * 0.99330562) * v15.__sinval * ((v60 + v16 * 0.99330562) * v15.__sinval))), 1.0), -1.0))* 6378137.0, v63 + v8), v61 + v60);
  long double v19 = fmod(v62 + 3.14159265 + v52 * v55, 6.28318531);
  long double v43 = fmod(v19 + 6.28318531, 6.28318531) + -3.14159265;
  long double v20 = fmod(3.14159265 - value + v59, 6.28318531);
  long double v40 = fmod(v20 + 6.28318531, 6.28318531) + -3.14159265;
  long double v21 = fmod(value + 3.14159265 + v40 * 0.0500000007, 6.28318531);
  double v53 = fmod(v21 + 6.28318531, 6.28318531) + -3.14159265;
  long double v22 = fmod(3.14159265 - v64 + v7, 6.28318531);
  long double v23 = fmod(v22 + 6.28318531, 6.28318531) + -3.14159265;
  long double v24 = fmod(v64 + 3.14159265 + v23 * 0.0500000007, 6.28318531);
  double v51 = fmod(v24 + 6.28318531, 6.28318531) + -3.14159265;
  double v50 = v60 + (v8 - v60) * 0.05;
  long double v25 = fmod(v62 + 3.14159265 + v42 * v55, 6.28318531);
  long double v56 = fmod(v25 + 6.28318531, 6.28318531) + -3.14159265;
  long double v26 = fmod(value + 3.14159265 + v40 * 0.949999988, 6.28318531);
  double v27 = fmod(v26 + 6.28318531, 6.28318531) + -3.14159265;
  long double v28 = fmod(v64 + 3.14159265 + v23 * 0.949999988, 6.28318531);
  double v41 = fmod(v28 + 6.28318531, 6.28318531) + -3.14159265;
  double v29 = v60 + (v8 - v60) * 0.95;
  __double2 v30 = __sincos_stret(v53);
  double v31 = 6378137.0 / sqrt(-(v30.__sinval * v30.__sinval * 0.00669437999 + -1.0));
  double v32 = (v31 + v50) * v30.__cosval;
  __double2 v33 = __sincos_stret(v51);
  __double2 v34 = __sincos_stret(v27);
  double v35 = 6378137.0 / sqrt(-(v34.__sinval * v34.__sinval * 0.00669437999 + -1.0));
  double v36 = (v35 + v29) * v34.__cosval;
  __double2 v37 = __sincos_stret(v41);
  v65[1] = 3321888768;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[2] = __77__VKDaVinciCameraController_createMoveToZoomOutZoomInFrameFunction_toLatLon___block_invoke;
  v65[3] = &__block_descriptor_352_ea8_128c40_ZTSN3gdc11CameraFrameIN3geo7RadiansEdEE184c40_ZTSN3gdc11CameraFrameIN3geo7RadiansEdEE240c40_ZTSN3gdc11CameraFrameIN3geo7RadiansEdEE296c40_ZTSN3gdc11CameraFrameIN3geo7RadiansEdEE_e386__CameraFrame_geo::Radians__double___Coordinate3D_geo::Radians__double___Unit_geo::RadianUnitDescription__double__d__Unit_geo::RadianUnitDescription__double__d__Unit_geo::MeterUnitDescription__double__d___Unit_geo::MeterUnitDescription__double__d__Unit_geo::RadianUnitDescription__double__d__Unit_geo::RadianUnitDescription__double__d__Unit_geo::RadianUnitDescription__double__d__12__0f8l;
  *(double *)&v65[4] = v45;
  *(double *)&v65[5] = v44;
  *(double *)&v65[6] = (v60 + v16 * 0.99330562) * v15.__sinval;
  *(double *)&v65[7] = v32 * v33.__cosval;
  *(double *)&v65[8] = v32 * v33.__sinval;
  *(double *)&v65[9] = (v50 + v31 * 0.99330562) * v30.__sinval;
  *(double *)&v65[10] = v36 * v37.__cosval;
  *(double *)&v65[11] = v36 * v37.__sinval;
  *(double *)&v65[12] = (v29 + v35 * 0.99330562) * v34.__sinval;
  *(double *)&v65[13] = v57;
  *(double *)&v65[14] = v47;
  *(double *)&v65[15] = v48;
  *(double *)&v65[16] = v54;
  *(double *)&v65[17] = v64;
  *(double *)&v65[18] = v60;
  *(double *)&v65[19] = v61;
  v65[20] = *(void *)&a3->_pitch._value;
  *(double *)&v65[21] = v62;
  v65[22] = *(void *)&a3->_roll._value;
  *(double *)&v65[23] = v53;
  *(double *)&v65[24] = v51;
  *(double *)&v65[25] = v50;
  *(double *)&v65[26] = v46;
  v65[27] = 0;
  *(long double *)&v65[28] = v43;
  v65[29] = 0;
  *(double *)&v65[30] = v27;
  *(double *)&v65[31] = v41;
  *(double *)&v65[32] = v29;
  *(double *)&v65[33] = v46;
  v65[34] = 0;
  *(long double *)&v65[35] = v56;
  v65[36] = 0;
  *(double *)&v65[37] = v59;
  *(double *)&v65[38] = v58;
  *(double *)&v65[39] = v8;
  *(double *)&v65[40] = v63;
  v65[41] = *(void *)&a4->_pitch._value;
  *(double *)&v65[42] = v49;
  v65[43] = *(void *)&a4->_roll._value;
  double v38 = (void *)[v65 copy];
  return v38;
}

long double __77__VKDaVinciCameraController_createMoveToZoomOutZoomInFrameFunction_toLatLon___block_invoke@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
  double v25 = (float)((float)((float)(1.0 - a3) * (float)(1.0 - a3)) * (float)(1.0 - a3));
  float v5 = (float)(1.0 - a3) * 3.0;
  double v26 = (float)((float)((float)(1.0 - a3) * a3) * v5);
  double v27 = (float)((float)(a3 * a3) * a3);
  double v28 = (float)(v5 * (float)(a3 * a3));
  long double v6 = *(double *)(a1 + 32) * v25
     + *(double *)(a1 + 56) * v26
     + *(double *)(a1 + 80) * v28
     + *(double *)(a1 + 104) * v27;
  long double v7 = *(double *)(a1 + 40) * v25
     + *(double *)(a1 + 64) * v26
     + *(double *)(a1 + 88) * v28
     + *(double *)(a1 + 112) * v27;
  long double v8 = *(double *)(a1 + 48) * v25
     + *(double *)(a1 + 72) * v26
     + *(double *)(a1 + 96) * v28
     + *(double *)(a1 + 120) * v27;
  double v9 = sqrt(v6 * v6 + v7 * v7);
  double v10 = atan2(v8, v9 * 0.996647189);
  long double v11 = atan2(v7, v6);
  __double2 v12 = __sincos_stret(v10);
  long double v13 = atan2(v8 + v12.__sinval * v12.__sinval * 42841.3115 * v12.__sinval, v9 + v12.__cosval * v12.__cosval * -42697.6727 * v12.__cosval);
  *(void *)(a2 + 48) = 0;
  *(long double *)a2 = v13;
  *(long double *)(a2 + 8) = v11;
  double v14 = *(double *)(a1 + 168);
  double v15 = *(double *)(a1 + 224);
  *(double *)(a2 + 32) = *(double *)(a1 + 160) * v25
                       + *(double *)(a1 + 216) * v26
                       + *(double *)(a1 + 272) * v28
                       + *(double *)(a1 + 328) * v27;
  *(float64x2_t *)(a2 + 16) = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 144), v25), *(float64x2_t *)(a1 + 200), v26), *(float64x2_t *)(a1 + 256), v28), *(float64x2_t *)(a1 + 312), v27);
  long double v16 = fmod(3.14159265 - v14 + v15, 6.28318531);
  long double v17 = fmod(v16 + 6.28318531, 6.28318531) + -3.14159265;
  double v18 = *(double *)(a1 + 280);
  long double v19 = fmod(3.14159265 - v15 + v18, 6.28318531);
  long double v20 = fmod(v19 + 6.28318531, 6.28318531) + -3.14159265;
  long double v21 = fmod(3.14159265 - v18 + *(double *)(a1 + 336), 6.28318531);
  long double v22 = fmod(v21 + 6.28318531, 6.28318531);
  long double v23 = fmod(v14 + 3.14159265 + v17 * v26 + (v20 + v17) * v28 + (v22 + -3.14159265 + v20 + v17) * v27, 6.28318531);
  long double result = fmod(v23 + 6.28318531, 6.28318531) + -3.14159265;
  *(long double *)(a2 + 40) = result;
  return result;
}

- (void)moveTo:()Coordinate2D<geo:(double>)a3 :(double)a4 Radians height:(BOOL)a5 useHeight:(double)a6 zoom:(double)a7 rotation:(double)a8 tilt:(double)a9 duration:(id)a10 timingCurve:(id)a11 completion:
{
  __double2 v12 = v11;
  double value = a3.longitude._value;
  char v17 = (char)a10;
  double v18 = a3.latitude._value;
  long double v19 = (float64x2_t *)a5;
  id v21 = a11;
  long double v22 = v12;
  [(VKDaVinciCameraController *)self stopGlobeAnimations];
  [(VKCameraController *)self camera];
  if (v75 && !atomic_fetch_add(&v75->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
    std::__shared_weak_count::__release_weak(v75);
    if (!v74) {
      goto LABEL_55;
    }
  }
  else if (!v74)
  {
    goto LABEL_55;
  }
  [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController pauseAnimation];
  [(VKCameraController *)self camera];
  double v23 = *(double *)(v74 + 104);
  double v24 = fmax(*(double *)(v74 + 96), value);
  if (v75 && !atomic_fetch_add(&v75->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
    std::__shared_weak_count::__release_weak(v75);
  }
  double v25 = fmin(v23, v24);
  if (a7 <= 0.0)
  {
    [(VKCameraController *)self beginRegionChange:0];
    cameraManager = self->_cameraManager;
    cameraManager[242] = 0;
    cameraManager[244] = 0;
    float64x2_t v59 = *v19;
    [(VKCameraController *)self camera];
    uint64_t v39 = v74;
    *(float64x2_t *)(v74 + 8) = v59;
    *(double *)(v39 + 24) = v18;
    if (v75 && !atomic_fetch_add(&v75->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
      std::__shared_weak_count::__release_weak(v75);
    }
    [(VKCameraController *)self camera];
    long double v40 = v75;
    *(double *)(v74 + 40) = a6;
    if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
    [(VKCameraController *)self camera];
    double v41 = v75;
    *(double *)(v74 + 32) = v25;
    if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
    [(VKCameraController *)self camera];
    double v42 = v75;
    *(double *)(v74 + 48) = a4;
    if (v42 && !atomic_fetch_add(&v42->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
    long double v43 = [(VKCameraController *)self mapDataAccess];
    [(VKCameraController *)self centerScreenPoint];
    Matrix<int, 2, 1> v44 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    [(VKCameraController *)self camera];
    md::MapDataAccess::groundCoordinateForScreenCursor((uint64_t)&v74, (uint64_t)v43, (uint64_t)location + 8, (int32x2_t)v44);
    if (v73 && !atomic_fetch_add(&v73->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
      std::__shared_weak_count::__release_weak(v73);
    }
    *(void *)&v57.f64[1] = v75;
    [(VKCameraController *)self camera];
    __asm { FMOV            V0.2D, #-2.0 }
    double v50 = (double *)location;
    *(float64x2_t *)((char *)location + 8) = vnegq_f64(vmlaq_f64(v57, _Q0, v59));
    v50[3] = v18;
    if (v73 && !atomic_fetch_add(&v73->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
      std::__shared_weak_count::__release_weak(v73);
    }
    double v51 = self->_cameraManager;
    [(VKCameraController *)self camera];
    md::CameraManager::update((uint64_t)v51, (uint64_t *)&location, 1);
    double v52 = v73;
    if (v73 && !atomic_fetch_add(&v73->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
    [(VKDaVinciCameraController *)self _updateIsPitched];
    [(VKDaVinciCameraController *)self _updateCanEnter3DMode];
    double v53 = [(VKCameraController *)self cameraDelegate];
    [v53 mapLayerDidChangeVisibleRegion];

    uint64_t v54 = *(void *)[(VKCameraController *)self runLoopController];
    if (v54)
    {
      LOBYTE(location) = 4;
      md::MapEngine::setNeedsTick(v54, &location);
    }
    if ((v17 & 1) == 0) {
      self->_updateHeight = 1;
    }
    [(VKCameraController *)self endRegionChange];
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController resumeAnimation];
    *((unsigned char *)self->_cameraManager + 242) = 1;
    if (v22) {
      v22[2](v22, 1);
    }
  }
  else
  {
    double v26 = [[VKTimedAnimation alloc] initWithDuration:a7];
    regionAnimation = self->super._regionAnimation;
    self->super._regionAnimation = v26;

    if (v21) {
      uint64_t v28 = (uint64_t)v21;
    }
    else {
      uint64_t v28 = VKAnimationCurveLinear;
    }
    [(VKTimedAnimation *)self->super._regionAnimation setTimingFunction:v28];
    [(VKCameraController *)self beginRegionChange:1];
    [(VKCameraController *)self camera];
    if (v75 && !atomic_fetch_add(&v75->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
      std::__shared_weak_count::__release_weak(v75);
    }
    double v29 = [(VKCameraController *)self mapDataAccess];
    [(VKCameraController *)self centerScreenPoint];
    Matrix<int, 2, 1> v30 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    [(VKCameraController *)self camera];
    md::MapDataAccess::groundCoordinateForScreenCursor((uint64_t)&v74, (uint64_t)v29, (uint64_t)location + 8, (int32x2_t)v30);
    double v58 = a4;
    double v55 = v18;
    if (v73 && !atomic_fetch_add(&v73->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
      std::__shared_weak_count::__release_weak(v73);
    }
    double v31 = (void *)v74;
    double v32 = v75;
    uint64_t v33 = v76;
    [(VKCameraController *)self camera];
    __double2 v34 = (void *)*((void *)location + 4);
    if (v73 && !atomic_fetch_add(&v73->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
      std::__shared_weak_count::__release_weak(v73);
    }
    [(VKCameraController *)self camera];
    double v35 = (void *)*((void *)location + 5);
    if (v73 && !atomic_fetch_add(&v73->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
      std::__shared_weak_count::__release_weak(v73);
    }
    [(VKCameraController *)self camera];
    uint64_t v36 = *((void *)location + 6);
    if (v73 && !atomic_fetch_add(&v73->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
      std::__shared_weak_count::__release_weak(v73);
    }
    __double2 v37 = self->_cameraManager;
    v37[242] = 0;
    v37[244] = 0;
    objc_initWeak(&location, self);
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3321888768;
    v63[2] = __104__VKDaVinciCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke;
    v63[3] = &unk_1EF58DE80;
    objc_copyWeak(v64, &location);
    v64[1] = v34;
    v64[2] = *(id *)&v25;
    v64[3] = v35;
    v64[4] = *(id *)&a6;
    float64x2_t v65 = *v19;
    v64[5] = v31;
    char v71 = v17;
    v63[4] = self;
    uint64_t v66 = v32;
    uint64_t v67 = v56;
    uint64_t v68 = v33;
    uint64_t v69 = v36;
    double v70 = v58;
    [(VKTimedAnimation *)self->super._regionAnimation setStepHandler:v63];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __104__VKDaVinciCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_15;
    v60[3] = &unk_1E5A98E30;
    objc_copyWeak(&v62, &location);
    double v61 = v22;
    [(VKAnimation *)self->super._regionAnimation setCompletionHandler:v60];
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._regionAnimation->super);

    objc_destroyWeak(&v62);
    objc_destroyWeak(v64);
    objc_destroyWeak(&location);
  }
LABEL_55:
}

void __104__VKDaVinciCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  float v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained camera];
    if (*(void *)&v54.f64[1]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v54.f64[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(void))(**(void **)&v54.f64[1] + 16))(*(void *)&v54.f64[1]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v54.f64[1]);
      if (!*(void *)&v54.f64[0]) {
        goto LABEL_34;
      }
    }
    else if (!*(void *)&v54.f64[0])
    {
      goto LABEL_34;
    }
    double v45 = *(double *)(a1 + 56);
    double v46 = *(double *)(a1 + 48);
    double v6 = a2;
    double v7 = *(double *)(a1 + 80);
    double v47 = *(double *)(a1 + 72);
    double v48 = *(double *)(a1 + 64);
    long double v8 = fmod(3.14159265 - v7 + *(double *)(a1 + 88), 6.28318531);
    long double v9 = fmod(v8 + 6.28318531, 6.28318531);
    long double v10 = fmod(v7 + 3.14159265 + (v9 + -3.14159265) * a2, 6.28318531);
    long double v11 = fmod(v10 + 6.28318531, 6.28318531);
    double v12 = *(double *)(a1 + 104);
    long double v13 = fmod(3.14159265 - v12 + *(double *)(a1 + 96), 6.28318531);
    long double v14 = fmod(v13 + 6.28318531, 6.28318531);
    long double v15 = fmod(v12 + 3.14159265 + (v14 + -3.14159265) * a2, 6.28318531);
    double v50 = fmod(v15 + 6.28318531, 6.28318531);
    if (*(unsigned char *)(a1 + 144))
    {
      double v16 = v11;
      double v17 = *(double *)(a1 + 112);
    }
    else
    {
      double v18 = (unsigned __int8 *)[*(id *)(a1 + 32) mapDataAccess];
      float64x2_t v54 = *(float64x2_t *)(a1 + 88);
      uint64_t v55 = 0;
      md::MapDataAccess::heightAtCoordinate(v18, &v54);
      double v16 = v11;
      if (v20) {
        double v17 = v19;
      }
      else {
        double v17 = 0.0;
      }
    }
    double v22 = *(double *)(a1 + 120);
    double v21 = *(double *)(a1 + 128);
    long double v23 = fmod(3.14159265 - v21 + *(double *)(a1 + 136), 6.28318531);
    long double v24 = fmod(v23 + 6.28318531, 6.28318531);
    long double v25 = fmod(v21 + 3.14159265 + (v24 + -3.14159265) * v6, 6.28318531);
    double v26 = fmod(v25 + 6.28318531, 6.28318531);
    [v5 camera];
    v27.f64[0] = v16 + -3.14159265;
    double v28 = v22 + (v17 - v22) * v6;
    v27.f64[1] = v50 + -3.14159265;
    float64_t v29 = v54.f64[0];
    float64x2_t v51 = v27;
    *(float64x2_t *)(*(void *)&v54.f64[0] + 8) = v27;
    *(double *)(*(void *)&v29 + 24) = v28;
    Matrix<int, 2, 1> v30 = *(std::__shared_weak_count **)&v54.f64[1];
    if (*(void *)&v54.f64[1]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v54.f64[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
    [v5 camera];
    double v31 = *(std::__shared_weak_count **)&v54.f64[1];
    *(double *)(*(void *)&v54.f64[0] + 40) = v48 + (v47 - v48) * v6;
    if (v31 && !atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
    [v5 camera];
    double v32 = *(std::__shared_weak_count **)&v54.f64[1];
    *(double *)(*(void *)&v54.f64[0] + 32) = v46 + (v45 - v46) * v6;
    if (v32 && !atomic_fetch_add(&v32->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
    [v5 camera];
    uint64_t v33 = *(std::__shared_weak_count **)&v54.f64[1];
    *(double *)(*(void *)&v54.f64[0] + 48) = v26 + -3.14159265;
    if (v33 && !atomic_fetch_add(&v33->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
    uint64_t v34 = [v5 mapDataAccess];
    [v5 centerScreenPoint];
    int32x2_t v35 = (int32x2_t)objc_msgSend(v5, "cursorFromScreenPoint:");
    [v5 camera];
    md::MapDataAccess::groundCoordinateForScreenCursor((uint64_t)&v54, v34, v52 + 8, v35);
    if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
    float64x2_t v49 = v54;
    [v5 camera];
    __asm { FMOV            V0.2D, #-2.0 }
    uint64_t v41 = v52;
    *(float64x2_t *)(v52 + 8) = vnegq_f64(vmlaq_f64(v49, _Q0, v51));
    *(double *)(v41 + 24) = v28;
    if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
    uint64_t v42 = v5[35];
    [v5 camera];
    md::CameraManager::update(v42, &v52, 1);
    long double v43 = v53;
    if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
    [v5 _updateIsPitched];
    [v5 _updateCanEnter3DMode];
    Matrix<int, 2, 1> v44 = [v5 cameraDelegate];
    [v44 mapLayerDidChangeVisibleRegion];
  }
LABEL_34:
}

void __104__VKDaVinciCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_15(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(unsigned char *)(*((void *)WeakRetained + 35) + 242) = 1;
    [WeakRetained endRegionChange];
    [*((id *)WeakRetained + 23) resumeAnimation];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
    }
  }
}

- (void)moveTo:()Coordinate2D<geo:(double>)a3 :(double)a4 Radians zoom:(double)a5 rotation:(double)a6 tilt:(double)a7 duration:(id)a8 timingCurve:(id)a9 completion:
{
  long long v10 = *(_OWORD *)a8;
  -[VKDaVinciCameraController moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", &v10, 0, a9, v9, 0.0, a3.latitude._value, a3.longitude._value, a4, a5, a7);
}

- (void)panWithOffset:(CGPoint)a3 relativeToScreenPoint:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6 completionHandler:(id)a7
{
  LODWORD(v8) = a5;
  double y = a4.y;
  double x = a4.x;
  double v11 = a3.y;
  double v12 = a3.x;
  long double v14 = (void (**)(void))a7;
  regionAnimation = self->super._regionAnimation;
  if (regionAnimation && [(VKAnimation *)regionAnimation running])
  {
    if (v14) {
      goto LABEL_11;
    }
  }
  else
  {
    if (a6 > 0.0) {
      uint64_t v8 = v8;
    }
    else {
      uint64_t v8 = 0;
    }
    [(VKCameraController *)self beginRegionChange:v8];
    -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
    self->_panStartScreenPoint.double x = v16;
    self->_panStartScreenPoint.double y = v17;
    cameraManager = (char *)self->_cameraManager;
    Matrix<int, 2, 1> v19 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    double v20 = x + v12;
    *((_WORD *)cameraManager + 8) = 1;
    double v21 = y - v11;
    cameraManager[18] = 0;
    cameraManager[80] = 0;
    *(Matrix<int, 2, 1> *)(cameraManager + 36) = v19;
    *(Matrix<int, 2, 1> *)(cameraManager + 20) = v19;
    *(Matrix<int, 2, 1> *)(cameraManager + 28) = v19;
    if (v8)
    {
      double v22 = [[VKTimedAnimation alloc] initWithDuration:a6];
      [(VKTimedAnimation *)v22 setTimingFunction:VKAnimationCurveLinear];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __101__VKDaVinciCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke;
      v28[3] = &unk_1E5A94368;
      *(double *)&v28[5] = v12;
      *(double *)&v28[6] = v11;
      v28[4] = self;
      [(VKTimedAnimation *)v22 setStepHandler:v28];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __101__VKDaVinciCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke_2;
      v24[3] = &unk_1E5A94390;
      v24[4] = self;
      double v26 = v20;
      double v27 = v21;
      long double v25 = v14;
      [(VKAnimation *)v22 setCompletionHandler:v24];
      md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &v22->super);
    }
    else
    {
      -[VKScreenCameraController updatePanWithTranslation:](self, "updatePanWithTranslation:", v12, v11);
      long double v23 = self->_cameraManager;
      -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", v20, v21);
      v23[18] = 1;
      [(VKCameraController *)self endRegionChange];
      if (v14) {
LABEL_11:
      }
        v14[2](v14);
    }
  }
}

void __101__VKDaVinciCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke(uint64_t a1, float a2)
{
  objc_msgSend(*(id *)(a1 + 32), "updatePanWithTranslation:", vcvtq_f64_f32(vcvt_f32_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 40), a2))));
  id v3 = [*(id *)(a1 + 32) cameraDelegate];
  [v3 mapLayerDidChangeVisibleRegion];
}

uint64_t __101__VKDaVinciCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke_2(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[35];
  objc_msgSend(v2, "cursorFromScreenPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(unsigned char *)(v3 + 18) = 1;
  [*(id *)(a1 + 32) endRegionChange];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    float v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)zoomToDistance:(CGPoint)a3 distance:(double)a4 time:(double)a5
{
}

- (void)zoomToDistance:(CGPoint)a3 distance:(double)a4 time:(double)a5 completionHandler:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v11 = a6;
  double v12 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
  [(VKCameraController *)self camera];
  double v13 = *(double *)(v27 + 32);
  if (v28 && !atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
  }
  uint64_t v27 = 0;
  double v28 = (std::__shared_weak_count *)&v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0x3FF0000000000000;
  zoomAnimation = self->super._zoomAnimation;
  if (zoomAnimation) {
    [(VKAnimation *)zoomAnimation stop];
  }
  long double v15 = [[VKTimedAnimation alloc] initWithDuration:a5];
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __76__VKDaVinciCameraController_zoomToDistance_distance_time_completionHandler___block_invoke;
  v24[3] = &unk_1E5A94340;
  objc_copyWeak(v25, &location);
  *(double *)&v25[1] = a4 / v13;
  v24[4] = &v27;
  v25[2] = v12;
  [(VKTimedAnimation *)v15 setStepHandler:v24];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  double v20 = __76__VKDaVinciCameraController_zoomToDistance_distance_time_completionHandler___block_invoke_2;
  double v21 = &unk_1E5A99078;
  objc_copyWeak(v23, &location);
  v23[1] = v12;
  id v16 = v11;
  id v22 = v16;
  [(VKAnimation *)v15 setCompletionHandler:&v18];
  objc_storeStrong((id *)&self->super._zoomAnimation, v15);
  cameraManager = self->_cameraManager;
  cameraManager[92] = 1;
  *((unsigned char *)cameraManager + 186) = 0;
  *((void *)cameraManager + 27) = v12;
  *((void *)cameraManager + 28) = 0x3FF0000000000000;
  *((unsigned char *)cameraManager + 240) = 1;
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v18, v19, v20, v21);
  md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], self->super._zoomAnimation);

  objc_destroyWeak(v23);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v27, 8);
}

void __76__VKDaVinciCameraController_zoomToDistance_distance_time_completionHandler___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v5 = (*(double *)(a1 + 48) + -1.0) * a2 + 1.0;
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    double v7 = *(double *)(v6 + 24);
    *(double *)(v6 + 24) = v5;
    uint64_t v8 = WeakRetained[35];
    *(double *)(v8 + 224) = *(double *)(v8 + 224) * v5 / v7;
    *(_DWORD *)(v8 + 216) = *(_DWORD *)(a1 + 56);
    *(_DWORD *)(v8 + 220) = *(_DWORD *)(a1 + 60);
    long long v10 = WeakRetained;
    uint64_t v9 = [WeakRetained cameraDelegate];
    [v9 mapLayerDidChangeVisibleRegion];

    id WeakRetained = v10;
  }
}

void __76__VKDaVinciCameraController_zoomToDistance_distance_time_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(unsigned char *)(WeakRetained[35] + 186) = 1;
    [WeakRetained endRegionChange];
    [WeakRetained snapMapIfNecessary:1];
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2) {
      (*(void (**)(void))(v2 + 16))();
    }
  }
}

- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  self->super._userChangedZoomSinceLastProgrammaticRegionChange = 1;
  [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setHasUserSpecifiedZoomLevel:1];
  long double v10 = exp2(-a4);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0x3FF0000000000000;
  id v11 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
  p_zoomAnimation = &self->super._zoomAnimation;
  zoomAnimation = self->super._zoomAnimation;
  if (zoomAnimation)
  {
    [(VKAnimation *)zoomAnimation stop];
    long double v14 = *p_zoomAnimation;
    *p_zoomAnimation = 0;
  }
  long double v15 = [[VKTimedAnimation alloc] initWithDuration:0.25];
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __62__VKDaVinciCameraController_tapZoom_levels_completionHandler___block_invoke;
  v24[3] = &unk_1E5A94340;
  objc_copyWeak(v25, &location);
  v25[1] = *(id *)&v10;
  v24[4] = v27;
  v25[2] = v11;
  [(VKTimedAnimation *)v15 setStepHandler:v24];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  double v20 = __62__VKDaVinciCameraController_tapZoom_levels_completionHandler___block_invoke_2;
  double v21 = &unk_1E5A99078;
  objc_copyWeak(v23, &location);
  v23[1] = v11;
  id v16 = v9;
  id v22 = v16;
  [(VKAnimation *)v15 setCompletionHandler:&v18];
  objc_storeStrong((id *)&self->super._zoomAnimation, v15);
  cameraManager = self->_cameraManager;
  cameraManager[92] = 1;
  *((unsigned char *)cameraManager + 186) = 0;
  *((void *)cameraManager + 27) = v11;
  *((void *)cameraManager + 28) = 0x3FF0000000000000;
  *((unsigned char *)cameraManager + 240) = 1;
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v18, v19, v20, v21);
  md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], *p_zoomAnimation);

  objc_destroyWeak(v23);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);

  _Block_object_dispose(v27, 8);
}

void __62__VKDaVinciCameraController_tapZoom_levels_completionHandler___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v5 = (*(double *)(a1 + 48) + -1.0) * a2 + 1.0;
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    double v7 = *(double *)(v6 + 24);
    *(double *)(v6 + 24) = v5;
    uint64_t v8 = WeakRetained[35];
    *(double *)(v8 + 224) = *(double *)(v8 + 224) * v5 / v7;
    *(_DWORD *)(v8 + 216) = *(_DWORD *)(a1 + 56);
    *(_DWORD *)(v8 + 220) = *(_DWORD *)(a1 + 60);
    id v10 = WeakRetained;
    [WeakRetained _updateIsPitched];
    [v10 _updateCanEnter3DMode];
    id v9 = [v10 cameraDelegate];
    [v9 mapLayerDidChangeVisibleRegion];

    id WeakRetained = v10;
  }
}

void __62__VKDaVinciCameraController_tapZoom_levels_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(unsigned char *)(WeakRetained[35] + 186) = 1;
    [WeakRetained endRegionChange];
    [WeakRetained snapMapIfNecessary:1];
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2) {
      (*(void (**)(void))(v2 + 16))();
    }
  }
}

- (void)tiltTo:(double)a3 animated:(BOOL)a4 exaggerate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [(VKCameraController *)self centerScreenPoint];
  id v9 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
  [(VKCameraController *)self camera];
  id v10 = (void *)*((void *)location + 5);
  if (v29 && !atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
    if (v6) {
      goto LABEL_4;
    }
  }
  else if (v6)
  {
LABEL_4:
    pitchAnimation = self->super._pitchAnimation;
    if (pitchAnimation)
    {
      [(VKAnimation *)pitchAnimation stop];
      double v12 = self->super._pitchAnimation;
      self->super._pitchAnimation = 0;
    }
    double v13 = [VKTimedAnimation alloc];
    double v14 = 0.3;
    if (v5) {
      double v14 = 0.5;
    }
    long double v15 = [(VKTimedAnimation *)v13 initWithDuration:v14];
    id v16 = self->super._pitchAnimation;
    self->super._pitchAnimation = v15;

    objc_initWeak(&location, self);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __56__VKDaVinciCameraController_tiltTo_animated_exaggerate___block_invoke;
    v26[3] = &unk_1E5A94318;
    objc_copyWeak(v27, &location);
    v27[1] = v10;
    v27[2] = *(id *)&a3;
    v27[3] = v9;
    [(VKTimedAnimation *)self->super._pitchAnimation setStepHandler:v26];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    long double v23 = __56__VKDaVinciCameraController_tiltTo_animated_exaggerate___block_invoke_2;
    long double v24 = &unk_1E5A942F0;
    objc_copyWeak(v25, &location);
    v25[1] = v9;
    [(VKAnimation *)self->super._pitchAnimation setCompletionHandler:&v21];
    -[VKTimedAnimation setTimingFunction:](self->super._pitchAnimation, "setTimingFunction:", VKAnimationCurveEaseOut, v21, v22, v23, v24);
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController pauseAnimation];
    [(VKCameraController *)self beginRegionChange:1];
    cameraManager = self->_cameraManager;
    cameraManager[64] = 1;
    *((unsigned char *)cameraManager + 130) = 0;
    *((void *)cameraManager + 22) = 0;
    *((void *)cameraManager + 20) = v9;
    *((void *)cameraManager + 21) = v9;
    self->_isPitching = 1;
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._pitchAnimation->super);
    objc_destroyWeak(v25);
    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
    return;
  }
  [(VKCameraController *)self beginRegionChange:0];
  uint64_t v18 = self->_cameraManager;
  v18[64] = 1;
  *((unsigned char *)v18 + 130) = 0;
  *((void *)v18 + 22) = 0;
  *((void *)v18 + 20) = v9;
  *((void *)v18 + 21) = v9;
  [(VKCameraController *)self centerScreenPoint];
  -[VKDaVinciCameraController pitch:translation:](self, "pitch:translation:");
  *((unsigned char *)self->_cameraManager + 130) = 1;
  [(VKDaVinciCameraController *)self _updateIsPitched];
  [(VKDaVinciCameraController *)self _updateCanEnter3DMode];
  uint64_t v19 = [(VKCameraController *)self cameraDelegate];
  [v19 mapLayerDidChangeVisibleRegion];

  uint64_t v20 = *(void *)[(VKCameraController *)self runLoopController];
  if (v20)
  {
    LOBYTE(location) = 4;
    md::MapEngine::setNeedsTick(v20, &location);
  }
  [(VKCameraController *)self endRegionChange];
}

void __56__VKDaVinciCameraController_tiltTo_animated_exaggerate___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    double v6 = *(double *)(a1 + 40);
    double v7 = *(double *)(a1 + 48);
    uint64_t v8 = WeakRetained[35];
    [WeakRetained camera];
    double v9 = v6 + (v7 - v6) * a2 - *(double *)(v11 + 40);
    *(_DWORD *)(v8 + 160) = *(_DWORD *)(a1 + 56);
    *(_DWORD *)(v8 + 164) = *(_DWORD *)(a1 + 60);
    *(double *)(v8 + 176) = v9 + *(double *)(v8 + 176);
    if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
    [v5 _updateIsPitched];
    id v10 = [v5 cameraDelegate];
    [v10 mapLayerDidChangeVisibleRegion];
  }
}

void __56__VKDaVinciCameraController_tiltTo_animated_exaggerate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *(unsigned char *)(*((void *)WeakRetained + 35) + 130) = 1;
    *((unsigned char *)WeakRetained + 296) = 0;
    [WeakRetained endRegionChange];
    [*((id *)WeakRetained + 23) resumeAnimation];
    [WeakRetained _updateIsPitched];
    [WeakRetained _updateCanEnter3DMode];
  }
}

- (void)rotateTo:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(VKCameraController *)self centerScreenPoint];
  double v7 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
  [(VKCameraController *)self camera];
  double v8 = *((double *)location + 6);
  if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
    if (v4) {
      goto LABEL_4;
    }
  }
  else if (v4)
  {
LABEL_4:
    rotationAnimation = self->super._rotationAnimation;
    if (rotationAnimation)
    {
      [(VKAnimation *)rotationAnimation stop];
      id v10 = self->super._rotationAnimation;
      self->super._rotationAnimation = 0;
    }
    uint64_t v11 = [[VKTimedAnimation alloc] initWithDuration:0.3];
    double v12 = self->super._rotationAnimation;
    self->super._rotationAnimation = v11;

    [(VKTimedAnimation *)self->super._rotationAnimation setTimingFunction:VKAnimationCurveEaseInOut];
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __47__VKDaVinciCameraController_rotateTo_animated___block_invoke;
    v21[3] = &unk_1E5A98570;
    objc_copyWeak(v22, &location);
    v22[1] = *(id *)&v8;
    v22[2] = *(id *)&a3;
    [(VKTimedAnimation *)self->super._rotationAnimation setStepHandler:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __47__VKDaVinciCameraController_rotateTo_animated___block_invoke_2;
    v19[3] = &unk_1E5A942F0;
    objc_copyWeak(v20, &location);
    v20[1] = v7;
    [(VKAnimation *)self->super._rotationAnimation setCompletionHandler:v19];
    [(VKCameraController *)self beginRegionChange:1];
    cameraManager = (char *)self->_cameraManager;
    *(_WORD *)(cameraManager + 81) = 1;
    cameraManager[83] = 0;
    *((void *)cameraManager + 14) = v7;
    *((void *)cameraManager + 15) = 0;
    self->_isRotating = 1;
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._rotationAnimation->super);
    objc_destroyWeak(v20);
    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
    return;
  }
  [(VKCameraController *)self beginRegionChange:0];
  double v14 = (char *)self->_cameraManager;
  *(_WORD *)(v14 + 81) = 1;
  v14[83] = 0;
  *((void *)v14 + 14) = v7;
  *((void *)v14 + 15) = 0;
  [(VKCameraController *)self centerScreenPoint];
  -[VKDaVinciCameraController rotate:atScreenPoint:](self, "rotate:atScreenPoint:", a3 - v8, v15, v16);
  *((unsigned char *)self->_cameraManager + 83) = 1;
  CGFloat v17 = [(VKCameraController *)self cameraDelegate];
  [v17 mapLayerDidChangeVisibleRegion];

  uint64_t v18 = *(void *)[(VKCameraController *)self runLoopController];
  if (v18)
  {
    LOBYTE(location) = 4;
    md::MapEngine::setNeedsTick(v18, &location);
  }
  [(VKCameraController *)self endRegionChange];
}

void __47__VKDaVinciCameraController_rotateTo_animated___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v5 = *(double *)(a1 + 40);
    long double v6 = fmod(3.14159265 - v5 + *(double *)(a1 + 48), 6.28318531);
    long double v7 = fmod(v6 + 6.28318531, 6.28318531);
    long double v8 = fmod(v5 + 3.14159265 + (v7 + -3.14159265) * a2, 6.28318531);
    double v9 = fmod(v8 + 6.28318531, 6.28318531);
    [WeakRetained camera];
    double v10 = *(double *)(v17 + 48);
    if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v18->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v18);
    }
    [WeakRetained centerScreenPoint];
    double v12 = v11;
    double v14 = v13;
    long double v15 = fmod(v9 - v10, 6.28318531);
    objc_msgSend(WeakRetained, "rotate:atScreenPoint:", (double)(fmod(v15 + 6.28318531, 6.28318531) + -3.14159265), v12, v14);
    double v16 = [WeakRetained cameraDelegate];
    [v16 mapLayerDidChangeVisibleRegion];
  }
}

void __47__VKDaVinciCameraController_rotateTo_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *(unsigned char *)(WeakRetained[35] + 83) = 1;
    *((unsigned char *)WeakRetained + 297) = 0;
    [WeakRetained endRegionChange];
  }
}

- (BOOL)snapMapIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  [(VKCameraController *)self camera];
  double v5 = v19[5];
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v20->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v20);
  }
  [(VKDaVinciCameraController *)self currentZoomLevel];
  float v7 = v6;
  *(float *)&double v6 = v7;
  [(VKDaVinciCameraController *)self maxPitchForNormalizedZoomLevel:v6];
  float v9 = v8;
  *(float *)&double v10 = v7;
  [(VKDaVinciCameraController *)self minPitchForNormalizedZoomLevel:v10];
  double v12 = v11;
  if (v5 < v12 && v5 > 0.0001)
  {
    if (!self->super._isPitchIncreasing) {
      double v12 = 0.0;
    }
    goto LABEL_10;
  }
  double v12 = v9;
  if (v5 > v9) {
LABEL_10:
  }
    [(VKDaVinciCameraController *)self tiltTo:v3 animated:0 exaggerate:v12];
  [(VKCameraController *)self camera];
  double v13 = fabs(v19[1]);
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v20->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v20);
  }
  if (v13 < 1.30899694)
  {
    [(VKCameraController *)self camera];
    double v14 = fabs(v19[6]);
    BOOL v15 = v14 < 2.22507386e-308 || v14 <= v14 * 2.22044605e-14;
    if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v20->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v20);
    }
    [(VKDaVinciCameraController *)self currentZoomLevel];
    char v17 = v16 > 6.0 || v15;
    if ((v17 & 1) == 0) {
      [(VKDaVinciCameraController *)self rotateTo:v3 animated:0.0];
    }
  }
  return 0;
}

- (void)setCenterCoordinate3D:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v20 = a9;
  id v21 = a10;
  double v22 = a6 * 0.0174532925;
  double v23 = a4 / fmax(cos(v22), 0.00001);
  double v24 = a5 * -0.0174532925;
  if (a8)
  {
    if (a8 != 2)
    {
      v26[0] = var0 * 0.0174532925;
      v26[1] = var1 * 0.0174532925;
      [(VKDaVinciCameraController *)self moveToZoomOutZoomInTransition:v26 height:1 useHeight:v20 zoom:v21 rotation:var2 tilt:v23 duration:v24 timingCurve:v22 completion:a7];
      goto LABEL_7;
    }
    double v28 = var0 * 0.0174532925;
    a7 = 0.0;
    long double v25 = &v28;
  }
  else
  {
    double v27 = var0 * 0.0174532925;
    long double v25 = &v27;
  }
  v25[1] = var1 * 0.0174532925;
  -[VKDaVinciCameraController moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", var2, v23, v24, v22, a7);
LABEL_7:
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v19 = a9;
  id v20 = a10;
  double v21 = var0 * 0.0174532925;
  double v22 = var1 * 0.0174532925;
  double v23 = a6 * 0.0174532925;
  double v24 = a4 / fmax(cos(v23), 0.00001);
  if (a8)
  {
    if (a8 != 2)
    {
      *(double *)double v26 = v21;
      *(double *)&v26[1] = v22;
      [(VKDaVinciCameraController *)self moveToZoomOutZoomInTransition:v26 height:0 useHeight:v19 zoom:v20 rotation:0.0 tilt:v24 duration:a5 * -0.0174532925 timingCurve:v23 completion:a7];
      goto LABEL_7;
    }
    double v28 = v21;
    a7 = 0.0;
    long double v25 = &v28;
  }
  else
  {
    double v27 = v21;
    long double v25 = &v27;
  }
  v25[1] = v22;
  -[VKDaVinciCameraController moveTo:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:zoom:rotation:tilt:duration:timingCurve:completion:", v24, a5 * -0.0174532925, v23, a7);
LABEL_7:
}

- (void)stopPinchingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  zoomAnimation = self->super._zoomAnimation;
  if (!zoomAnimation || ![(VKAnimation *)zoomAnimation running])
  {
    if ([(VKCameraController *)self staysCenteredDuringPinch]) {
      [(VKCameraController *)self centerScreenPoint];
    }
    else {
      -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
    }
    cameraManager = self->_cameraManager;
    -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    cameraManager[186] = 1;
    [(VKCameraController *)self endRegionChange];
    [(VKDaVinciCameraController *)self snapMapIfNecessary:1];
  }
}

- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double x = a3.x;
  if (a5 >= 0.01)
  {
    double y = a3.y;
    zoomAnimation = self->super._zoomAnimation;
    if (!zoomAnimation || ![(VKAnimation *)zoomAnimation running])
    {
      if ([(VKCameraController *)self staysCenteredDuringPinch]) {
        [(VKCameraController *)self centerScreenPoint];
      }
      else {
        -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
      }
      cameraManager = (double *)self->_cameraManager;
      Matrix<int, 2, 1> v12 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
      cameraManager[28] = cameraManager[28] * (a4 * 0.7 / a5 + 0.3);
      *((Matrix<int, 2, 1> *)cameraManager + 27) = v12;
      self->super._userChangedZoomSinceLastProgrammaticRegionChange = 1;
      [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setHasUserSpecifiedZoomLevel:1];
      double v13 = [(VKCameraController *)self cameraDelegate];
      [v13 mapLayerDidChangeVisibleRegion];

      uint64_t v14 = *(void *)[(VKCameraController *)self runLoopController];
      if (v14)
      {
        char v15 = 4;
        md::MapEngine::setNeedsTick(v14, &v15);
      }
    }
  }
}

- (void)startPinchingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(VKCameraController *)self staysCenteredDuringPinch]) {
    [(VKCameraController *)self centerScreenPoint];
  }
  else {
    -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
  }
  double v8 = v6;
  double v9 = v7;
  [(VKCameraController *)self beginRegionChange:0];
  cameraManager = self->_cameraManager;
  Matrix<int, 2, 1> v11 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", v8, v9);
  cameraManager[92] = 1;
  *((unsigned char *)cameraManager + 186) = 0;
  *((Matrix<int, 2, 1> *)cameraManager + 27) = v11;
  *((void *)cameraManager + 28) = 0x3FF0000000000000;
  *((unsigned char *)cameraManager + 240) = 0;
}

- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  if ([(VKCameraController *)self staysCenteredDuringPinch]) {
    [(VKCameraController *)self centerScreenPoint];
  }
  else {
    -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
  }
  double v12 = v10;
  double v13 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__VKDaVinciCameraController_zoom_withFocusPoint_completionHandler___block_invoke;
  v15[3] = &unk_1E5A942C8;
  id v14 = v9;
  id v16 = v14;
  -[VKDaVinciCameraController tapZoom:levels:completionHandler:](self, "tapZoom:levels:completionHandler:", v15, v12, v13, a3);
}

uint64_t __67__VKDaVinciCameraController_zoom_withFocusPoint_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)pitch:(CGPoint)a3 translation:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  if ([(VKCameraController *)self isPitchEnabled])
  {
    self->_isRotating = 0;
    self->super._isPitchIncreasing = a4 < 0.0;
    if (!self->_isPitching)
    {
      cameraManager = self->_cameraManager;
      Matrix<int, 2, 1> v9 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
      cameraManager[64] = 1;
      *((unsigned char *)cameraManager + 130) = 0;
      *((void *)cameraManager + 22) = 0;
      *((Matrix<int, 2, 1> *)cameraManager + 20) = v9;
      *((Matrix<int, 2, 1> *)cameraManager + 21) = v9;
      self->_isPitching = 1;
    }
    [(VKCameraController *)self camera];
    double v10 = *(double *)(v19 + 72);
    if (v20)
    {
      if (!atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)())v20->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    double v11 = self->_beganDoublePanPitch - a4;
    double v12 = fmax(v10, 0.0);
    if (v12 >= v11)
    {
      if (v11 >= 0.0)
      {
LABEL_12:
        double v15 = fmin(fmax(v11, 0.0), v10 + 0.0698131701);
        id v16 = (Matrix<int, 2, 1> *)self->_cameraManager;
        Matrix<int, 2, 1> v17 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
        double v18 = v15 - self->_currentDoublePanPitch;
        v16[20] = v17;
        *(double *)&v16[22] = v18 + *(double *)&v16[22];
        self->_currentDoublePanPitch = v15;
        [(VKDaVinciCameraController *)self _updateIsPitched];
        [(VKDaVinciCameraController *)self _updateCanEnter3DMode];
        return;
      }
      double v13 = 0.0698131701 / (v11 * -7.87816968 + 1.0);
      double v14 = -0.0698131701;
    }
    else
    {
      double v13 = 0.0698131701 / ((v12 - v11) * 7.87816968 + -1.0);
      double v14 = v12 + 0.0698131701;
    }
    double v11 = v13 + v14;
    goto LABEL_12;
  }
}

- (void)rotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  self->_isPitching = 0;
  if (!self->_isRotating)
  {
    cameraManager = (char *)self->_cameraManager;
    Matrix<int, 2, 1> v9 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", a4.x, a4.y);
    *(_WORD *)(cameraManager + 81) = 1;
    cameraManager[83] = 0;
    *((Matrix<int, 2, 1> *)cameraManager + 14) = v9;
    *((void *)cameraManager + 15) = 0;
    self->_isRotating = 1;
  }
  double v10 = (double *)self->_cameraManager;
  Matrix<int, 2, 1> v11 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
  v10[15] = v10[15] + a3;
  *((Matrix<int, 2, 1> *)v10 + 14) = v11;
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  ptr = a3.__ptr_;
  double v5 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v18 = *(void *)a3.__ptr_;
  uint64_t v19 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v17.receiver = self;
  v17.super_class = (Class)VKDaVinciCameraController;
  -[VKScreenCameraController setCamera:](&v17, sel_setCamera_, &v18, a3.__cntrl_);
  double v6 = v19;
  if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
    double v7 = *(double **)ptr;
    if (!*(void *)ptr) {
      return;
    }
  }
  else
  {
    double v7 = *(double **)ptr;
    if (!*(void *)ptr) {
      return;
    }
  }
  double v8 = [(VKCameraController *)self vkCamera];
  [v8 setPosition:v15];

  Matrix<int, 2, 1> v9 = [(VKCameraController *)self vkCamera];
  [v9 setOrientation:&v16];

  [(VKCameraController *)self camera];
  long long v10 = *(_OWORD *)(*(void *)ptr + 24);
  long long v11 = *(_OWORD *)(*(void *)ptr + 40);
  uint64_t v12 = *(void *)(*(void *)ptr + 56);
  *(_OWORD *)(v13 + 8) = *(_OWORD *)(*(void *)ptr + 8);
  *(void *)(v13 + 56) = v12;
  *(_OWORD *)(v13 + 40) = v11;
  *(_OWORD *)(v13 + 24) = v10;
  if (v14)
  {
    if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  [(VKDaVinciCameraController *)self updateCameraLimits];
}

- (void)dealloc
{
  gestureCameraControllerBehavior = self->super._gestureCameraControllerBehavior;
  self->super._gestureCameraControllerBehavior = 0;

  cameraManager = self->_cameraManager;
  if (cameraManager) {
    (*(void (**)(void *))(*(void *)cameraManager + 8))(cameraManager);
  }
  v5.receiver = self;
  v5.super_class = (Class)VKDaVinciCameraController;
  [(VKScreenCameraController *)&v5 dealloc];
}

@end