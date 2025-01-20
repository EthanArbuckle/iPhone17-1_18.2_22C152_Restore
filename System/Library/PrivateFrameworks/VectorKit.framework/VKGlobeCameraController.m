@interface VKGlobeCameraController
- ($F24F406B2B787EFB06265DBA3D28CBD5)_centerCoordinateForMapRegion:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate;
- (BOOL)canEnter3DMode;
- (BOOL)isFlyoverTourStarted;
- (BOOL)isFullyPitched;
- (BOOL)isPitched;
- (BOOL)snapMapIfNecessary:(BOOL)a3;
- (BOOL)tourShouldResumeWhenDoneGesturing;
- (Geocentric<double>)cameraPosition;
- (VKGlobeCameraController)initWithTaskContext:(shared_ptr<md:(void *)a4 :(AnimationRunner *)a5 TaskContext>)a3 mapDataAccess:(RunLoopController *)a6 animationRunner:(id)a7 runLoopController:cameraDelegate:;
- (double)_fovAdjustment;
- (double)altitude;
- (double)currentZoomLevel;
- (double)distanceFromCenterCoordinate;
- (double)durationToAnimateToMapRegion:(id)a3;
- (double)earthRadiusAt:(double)a3;
- (double)geocAngleBetween:(id)a3 andCoordinate:(id)a4;
- (double)greatCircleMidPointLatitude:(double)a3 fromLongitude:(double)a4 toLongitude:(double)a5;
- (double)heading;
- (double)maxPitch;
- (double)maximumZoomLevel;
- (double)minPitch;
- (double)minimumZoomLevel;
- (double)pitch;
- (double)widestLatitudeForMapRegion:(id)a3;
- (double)zoomForMapRegion:(id)a3;
- (float)slowDownFactorFromLoadProgress;
- (id).cxx_construct;
- (id)createMoveToZoomOutZoomInFrameFunction:()CameraFrame<geo:(double> *)a3 :()CameraFrame<geo:(double> *)a4 :Radians Radians toLatLon:;
- (id)mapRegion;
- (int64_t)tileSize;
- (void)_updateCanEnter3DMode;
- (void)_updateIsPitched;
- (void)adjustLoadingForAnimation:(float)a3 progressFactor:(float)a4;
- (void)animateRegionWithDuration:(double)a3 timingFunction:(id)a4 cursor:()Matrix<int stepHandler:()2 completionHandler:(1>)a5;
- (void)animateToRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5;
- (void)enter3DMode;
- (void)exit3DMode;
- (void)flyoverTourAnimation:(id)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6;
- (void)globeView;
- (void)interruptFlyoverTourAnimation;
- (void)moveTo:(id)a3 height:(double)a4 useHeight:(BOOL)a5 zoom:(double)a6 rotation:(double)a7 tilt:(double)a8 duration:(double)a9 timingCurve:(id)a10 completion:(id)a11;
- (void)moveTo:(id)a3 zoom:(double)a4 rotation:(double)a5 tilt:(double)a6 duration:(double)a7 timingCurve:(id)a8 completion:(id)a9;
- (void)moveToZoomOutZoomInTransition:(id)a3 height:(double)a4 useHeight:(BOOL)a5 zoom:(double)a6 rotation:(double)a7 tilt:(double)a8 duration:(double)a9 timingCurve:(id)a10 completion:(id)a11;
- (void)panWithOffset:(CGPoint)a3 relativeToScreenPoint:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6 completionHandler:(id)a7;
- (void)pauseFlyoverTourAnimation;
- (void)pitch:(CGPoint)a3 translation:(double)a4;
- (void)resumeFlyoverTourAnimation;
- (void)rotate:(double)a3 atScreenPoint:(CGPoint)a4;
- (void)rotateTo:(double)a3 animated:(BOOL)a4;
- (void)setCamera:(shared_ptr<gdc::Camera>)a3;
- (void)setCenterCoordinate3D:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10;
- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10;
- (void)setCenterCoordinateDistanceRange:(id *)a3 duration:(double)a4 timingFunction:(id)a5;
- (void)setCurrentZoomLevel:(double)a3;
- (void)setGesturing:(BOOL)a3;
- (void)setGlobeView:(void *)a3;
- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 timingCurve:(id)a7 completion:(id)a8;
- (void)setMaxZoomLevel:(double)a3;
- (void)setMinZoomLevel:(double)a3;
- (void)setRegionRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5;
- (void)setTourShouldResumeWhenDoneGesturing:(BOOL)a3;
- (void)setYaw:(double)a3 animated:(BOOL)a4;
- (void)startPinchingWithFocusPoint:(CGPoint)a3;
- (void)startTrackingAnnotation:(id)a3 trackHeading:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7;
- (void)stopFlyoverTourAnimation;
- (void)stopGlobeAnimations;
- (void)stopPinchingWithFocusPoint:(CGPoint)a3;
- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5;
- (void)tiltTo:(double)a3 animated:(BOOL)a4 exaggerate:(BOOL)a5;
- (void)updateCameraManager;
- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5;
- (void)updateState;
- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5;
- (void)zoomToDistance:(CGPoint)a3 distance:(double)a4 time:(double)a5;
- (void)zoomToDistance:(CGPoint)a3 distance:(double)a4 time:(double)a5 completionHandler:(id)a6;
@end

@implementation VKGlobeCameraController

- (id).cxx_construct
{
  *((void *)self + 35) = &unk_1EF568BB0;
  *((_WORD *)self + 144) = 0;
  *((unsigned char *)self + 290) = 0;
  *((void *)self + 41) = 0;
  *((void *)self + 42) = 0;
  *((void *)self + 40) = 0;
  *((void *)self + 46) = 0;
  *((void *)self + 47) = 0;
  *((void *)self + 45) = 0;
  *((void *)self + 52) = 0;
  *((void *)self + 53) = 0;
  *((void *)self + 51) = 0;
  *((void *)self + 59) = 0;
  *((void *)self + 60) = 0;
  *((void *)self + 58) = 0;
  *((_DWORD *)self + 88) = 0;
  *(_DWORD *)((char *)self + 399) = 0;
  *((void *)self + 49) = 0;
  *((void *)self + 56) = 0;
  *(_DWORD *)((char *)self + 455) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)self + 31) = _Q0;
  *((_WORD *)self + 256) = 256;
  *((_DWORD *)self + 129) = 0;
  *((_WORD *)self + 260) = 1;
  *((unsigned char *)self + 522) = 0;
  *((void *)self + 66) = 0;
  *((void *)self + 68) = 0xBFF0000000000000;
  *((void *)self + 73) = 0;
  *((void *)self + 74) = 0;
  *((void *)self + 72) = 0;
  *(_OWORD *)((char *)self + 600) = xmmword_1A28FF3C0;
  *(_OWORD *)((char *)self + 616) = xmmword_1A28FC720;
  *(_OWORD *)((char *)self + 632) = xmmword_1A28FF290;
  *(_OWORD *)((char *)self + 648) = xmmword_1A28FC720;
  *(_OWORD *)((char *)self + 664) = xmmword_1A28FF290;
  *(_OWORD *)((char *)self + 680) = xmmword_1A28FC720;
  *((void *)self + 87) = 0xFFEFFFFFFFFFFFFFLL;
  *((void *)self + 99) = 0;
  *((void *)self + 100) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_taskContext.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (void)setTourShouldResumeWhenDoneGesturing:(BOOL)a3
{
  self->_tourShouldResumeWhenDoneGesturing = a3;
}

- (BOOL)tourShouldResumeWhenDoneGesturing
{
  return self->_tourShouldResumeWhenDoneGesturing;
}

- (void)globeView
{
  return self->_globeView;
}

- (void)animateToRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8 = a5;
  [a3 radianSingleRect:&v37 westOfDatelineRect:&v35 eastOfDatelineRect:&v33];
  [(VKGlobeCameraController *)self centerCoordinate];
  double v10 = v9;
  double v12 = v11;
  v13 = [(VKScreenCameraController *)self regionRestriction];
  objc_msgSend(v13, "clampedCoordinate:", v10, v12);
  uint64_t v15 = v14;
  uint64_t v17 = v16;

  [(VKCameraController *)self centerScreenPoint];
  Matrix<int, 2, 1> v18 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __72__VKGlobeCameraController_animateToRestriction_duration_timingFunction___block_invoke;
  v26[3] = &unk_1E5A94478;
  *(double *)&v26[5] = v10;
  *(double *)&v26[6] = v12;
  v26[7] = v15;
  v26[8] = v17;
  long long v27 = v37;
  long long v28 = v38;
  long long v29 = v35;
  long long v30 = v36;
  long long v32 = v34;
  long long v31 = v33;
  v26[4] = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__VKGlobeCameraController_animateToRestriction_duration_timingFunction___block_invoke_2;
  v19[3] = &unk_1E5A944A0;
  v19[4] = self;
  long long v21 = v38;
  long long v20 = v37;
  long long v23 = v36;
  long long v22 = v35;
  long long v25 = v34;
  long long v24 = v33;
  [(VKGlobeCameraController *)self animateRegionWithDuration:v8 timingFunction:v18 cursor:v26 stepHandler:v19 completionHandler:a4];
}

void __72__VKGlobeCameraController_animateToRestriction_duration_timingFunction___block_invoke(uint64_t a1, float a2)
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
  double v52 = *(double *)(a1 + 112);
  double v53 = *(double *)(a1 + 104);
  double v54 = *(double *)(a1 + 160);
  double v55 = *(double *)(a1 + 152);
  double v58 = *(double *)(a1 + 80);
  double v59 = *(double *)(a1 + 96);
  double v56 = *(double *)(a1 + 136);
  double v57 = *(double *)(a1 + 144);
  double v61 = *(double *)(a1 + 72);
  double v62 = *(double *)(a1 + 88);
  double v28 = v13 + -6.28318531;
  long double v29 = fmod(v15 - (v13 + -6.28318531), 6.28318531);
  double v60 = fabs(fmod(v29 + 6.28318531, 6.28318531) + -3.14159265);
  long double v30 = v62 - v28;
  double v17 = v62;
  long double v31 = fmod(v30, 6.28318531);
  long double v32 = fmod(v31 + 6.28318531, 6.28318531);
  double v15 = v61;
  double v33 = fabs(v32 + -3.14159265);
  if (v60 <= v33 && v61 < v14)
  {
    double v22 = v59;
    double v23 = fmin(v8, v58);
    if (v8 <= v59)
    {
      double v25 = v62;
      double v15 = 1.79769313e308;
      double v24 = -3.14159265;
      double v26 = v59;
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
      double v25 = v62;
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
  BOOL v35 = v60 > v33 && v14 < v62;
  double v24 = v56;
  double v23 = v57;
  double v16 = v58;
  double v18 = v59;
  double v26 = v54;
  double v25 = v55;
  double v20 = v52;
  double v19 = v53;
  if (v35)
  {
    double v23 = fmin(v8, v58);
    double v17 = -1.79769313e308;
    double v16 = 1.79769313e308;
    double v24 = -3.14159265;
    double v25 = v14;
    if (v8 <= v59)
    {
      double v26 = v59;
      double v19 = v61;
      double v20 = v23;
      double v21 = 3.14159265;
      double v22 = v59;
    }
    else
    {
      double v26 = v8;
      double v19 = v61;
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
  v51 = (double *)(*(void *)(a1 + 32) + 280);
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
  altitude::CameraManager::update((altitude::CameraManager *)(*(void *)(a1 + 32) + 280), *(altitude::GlobeView **)(*(void *)(a1 + 32) + 272), 1);
  id v63 = [*(id *)(a1 + 32) cameraDelegate];
  [v63 mapLayerDidChangeVisibleRegion];
}

uint64_t __72__VKGlobeCameraController_animateToRestriction_duration_timingFunction___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) beginRegionChange:0];
    double v3 = (_OWORD *)(*(void *)(v2 + 32) + 608);
    long long v4 = *(_OWORD *)(v2 + 56);
    long double v5 = (_OWORD *)(*(void *)(v2 + 32) + 640);
    long long v6 = *(_OWORD *)(v2 + 72);
    long long v7 = *(_OWORD *)(v2 + 88);
    double v8 = (_OWORD *)(*(void *)(v2 + 32) + 672);
    long long v9 = *(_OWORD *)(v2 + 104);
    long long v10 = *(_OWORD *)(v2 + 120);
    *double v3 = *(_OWORD *)(v2 + 40);
    v3[1] = v4;
    *long double v5 = v6;
    v5[1] = v7;
    *double v8 = v9;
    v8[1] = v10;
    altitude::CameraManager::update((altitude::CameraManager *)(*(void *)(v2 + 32) + 280), *(altitude::GlobeView **)(*(void *)(v2 + 32) + 272), 1);
    long double v11 = [*(id *)(v2 + 32) cameraDelegate];
    [v11 mapLayerDidChangeVisibleRegion];

    long double v12 = *(void **)(v2 + 32);
    return [v12 endRegionChange];
  }
  return result;
}

- (void)setRegionRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = [(VKScreenCameraController *)self regionRestriction];
  char v11 = [v10 isEqual:v8];

  if ((v11 & 1) == 0)
  {
    v34.receiver = self;
    v34.super_class = (Class)VKGlobeCameraController;
    [(VKScreenCameraController *)&v34 setRegionRestriction:v8 duration:v9 timingFunction:a4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      annotationTrackingCameraController = self->super._annotationTrackingCameraController;
      double v13 = [(VKScreenCameraController *)self regionRestriction];
      [(VKAnnotationTrackingCameraController *)annotationTrackingCameraController setRegionRestriction:v13];
    }
    if ([v8 isEmpty])
    {
      self->_cameraManager._singleRestriction._minimum._e[0] = 1.79769313e308;
      *(Matrix<double, 2, 1> *)((char *)&self->_cameraManager._singleRestriction._minimum + 8) = (Matrix<double, 2, 1>)xmmword_1A28FC720;
      *(Matrix<double, 2, 1> *)((char *)&self->_cameraManager._singleRestriction._maximum + 8) = (Matrix<double, 2, 1>)xmmword_1A28FF290;
      *(Matrix<double, 2, 1> *)((char *)&self->_cameraManager._westOfDatelineRestriction._minimum + 8) = (Matrix<double, 2, 1>)xmmword_1A28FC720;
      *(Matrix<double, 2, 1> *)((char *)&self->_cameraManager._westOfDatelineRestriction._maximum + 8) = (Matrix<double, 2, 1>)xmmword_1A28FF290;
      *(Matrix<double, 2, 1> *)((char *)&self->_cameraManager._eastOfDatelineRestriction._minimum + 8) = (Matrix<double, 2, 1>)xmmword_1A28FC720;
      self->_cameraManager._eastOfDatelineRestriction._maximum._e[1] = -1.79769313e308;
    }
    else
    {
      [(VKGlobeCameraController *)self centerCoordinate];
      double v15 = v14;
      double v17 = v16;
      double v18 = [(VKScreenCameraController *)self regionRestriction];
      int v19 = objc_msgSend(v18, "containsCoordinate:", v15, v17);

      if (a4 <= 0.0) {
        char v20 = 1;
      }
      else {
        char v20 = v19;
      }
      if (v20)
      {
        [v8 radianSingleRect:&v32 westOfDatelineRect:&v30 eastOfDatelineRect:&v28];
        if (v19)
        {
          Matrix<double, 2, 1> v21 = v33;
          self->_cameraManager._singleRestriction._minimum = v32;
          self->_cameraManager._singleRestriction._maximum = v21;
          Matrix<double, 2, 1> v22 = v31;
          self->_cameraManager._westOfDatelineRestriction._minimum = v30;
          self->_cameraManager._westOfDatelineRestriction._maximum = v22;
          Matrix<double, 2, 1> v23 = v29;
          self->_cameraManager._eastOfDatelineRestriction._minimum = v28;
          self->_cameraManager._eastOfDatelineRestriction._maximum = v23;
        }
        else
        {
          [(VKCameraController *)self beginRegionChange:0];
          Matrix<double, 2, 1> v24 = v33;
          self->_cameraManager._singleRestriction._minimum = v32;
          self->_cameraManager._singleRestriction._maximum = v24;
          Matrix<double, 2, 1> v25 = v31;
          self->_cameraManager._westOfDatelineRestriction._minimum = v30;
          self->_cameraManager._westOfDatelineRestriction._maximum = v25;
          Matrix<double, 2, 1> v26 = v29;
          self->_cameraManager._eastOfDatelineRestriction._minimum = v28;
          self->_cameraManager._eastOfDatelineRestriction._maximum = v26;
          altitude::CameraManager::update((altitude::CameraManager *)&self->_cameraManager, (altitude::GlobeView *)self->_globeView, 1);
          long long v27 = [(VKCameraController *)self cameraDelegate];
          [v27 mapLayerDidChangeVisibleRegion];

          [(VKCameraController *)self endRegionChange];
        }
      }
      else
      {
        [(VKGlobeCameraController *)self animateToRestriction:v8 duration:v9 timingFunction:a4];
      }
    }
  }
}

- (void)animateRegionWithDuration:(double)a3 timingFunction:(id)a4 cursor:()Matrix<int stepHandler:()2 completionHandler:(1>)a5
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  regionAnimation = self->super._regionAnimation;
  if (regionAnimation) {
    [(VKAnimation *)regionAnimation stop];
  }
  double v15 = [[VKTimedAnimation alloc] initWithDuration:a3];
  double v16 = self->super._regionAnimation;
  self->super._regionAnimation = v15;

  if (v11) {
    double v17 = v11;
  }
  else {
    double v17 = VKAnimationCurveEaseInOut;
  }
  [(VKTimedAnimation *)self->super._regionAnimation setTimingFunction:v17];
  [(VKTimedAnimation *)self->super._regionAnimation setStepHandler:v12];
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __105__VKGlobeCameraController_animateRegionWithDuration_timingFunction_cursor_stepHandler_completionHandler___block_invoke;
  v19[3] = &unk_1E5A98E30;
  objc_copyWeak(&v21, &location);
  id v18 = v13;
  id v20 = v18;
  [(VKAnimation *)self->super._regionAnimation setCompletionHandler:v19];
  [(VKCameraController *)self beginRegionChange:1];
  md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._regionAnimation->super);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __105__VKGlobeCameraController_animateRegionWithDuration_timingFunction_cursor_stepHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
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
  double v11 = fmin(a3->var0, 60592301.5);
  BOOL v12 = var1 < 0.0;
  double v13 = fmin(var1, 60592301.5);
  if (!v12) {
    double v9 = v13;
  }
  a3->var0 = v11;
  a3->double var1 = v9;
  uint64_t v43 = 0;
  double v44 = 0.0;
  uint64_t v45 = 0;
  [(VKScreenCameraController *)self centerCoordinateDistanceRange];
  if (a3->var0 != 0.0 || a3->var1 != v44 || a3->var2 != v45)
  {
    long long v41 = *(_OWORD *)&a3->var0;
    uint64_t v42 = *(void *)&a3->var2;
    v40.receiver = self;
    v40.super_class = (Class)VKGlobeCameraController;
    [(VKScreenCameraController *)&v40 setCenterCoordinateDistanceRange:&v41 duration:v8 timingFunction:a4];
    double v14 = fmax(a3->var0, 0.0);
    a3->var0 = v14;
    double v15 = *(double *)(*((void *)self->_globeView + 9) + 32);
    if (v15 >= v14
      && (double v16 = a3->var1,
          [(VKGlobeCameraController *)self distanceFromCenterCoordinate],
          v16 >= v17))
    {
      globeView = (char *)self->_globeView;
      long long v25 = *(_OWORD *)&a3->var0;
      *((void *)globeView + 51) = *(void *)&a3->var2;
      *(_OWORD *)(globeView + 392) = v25;
    }
    else if (a4 <= 0.0)
    {
      Matrix<double, 2, 1> v22 = (char *)self->_globeView;
      long long v23 = *(_OWORD *)&a3->var0;
      *((void *)v22 + 51) = *(void *)&a3->var2;
      *(_OWORD *)(v22 + 392) = v23;
      [(VKGlobeCameraController *)self centerCoordinate];
      -[VKGlobeCameraController moveTo:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:zoom:rotation:tilt:duration:timingCurve:completion:", VKAnimationCurveEaseInOut, &__block_literal_global_33202);
    }
    else
    {
      [(VKCameraController *)self centerScreenPoint];
      Matrix<int, 2, 1> v18 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
      Matrix<int, 2, 1> v39 = v18;
      int v19 = self->_globeView;
      uint64_t v20 = v19[9];
      if (v20)
      {
        long long v21 = *(_OWORD *)(v20 + 8);
        uint64_t v38 = *(void *)(v20 + 24);
        long long v37 = v21;
      }
      else
      {
        long long v37 = 0uLL;
        uint64_t v38 = 0;
      }
      long long v35 = 0uLL;
      uint64_t v36 = 0;
      altitude::GlobeView::getCoordAtScreenPosition((uint64_t)v19, (int *)&v39, (double *)&v37, (uint64_t)&v35, 0);
      self->_cameraManager._tiltLimitPushDownEnabled = 0;
      self->_cameraManager._tiltLimitPushDown = 0;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3321888768;
      v29[2] = __84__VKGlobeCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke;
      v29[3] = &unk_1EF58EB78;
      long long v30 = *(_OWORD *)&a3->var0;
      uint64_t v31 = *(void *)&a3->var2;
      double v32 = v15;
      v29[4] = self;
      long long v33 = v35;
      uint64_t v34 = v36;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __84__VKGlobeCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke_22;
      v26[3] = &unk_1E5A94430;
      v26[4] = self;
      long long v27 = *(_OWORD *)&a3->var0;
      uint64_t v28 = *(void *)&a3->var2;
      [(VKGlobeCameraController *)self animateRegionWithDuration:v8 timingFunction:v18 cursor:v29 stepHandler:v26 completionHandler:a4];
    }
  }
}

void __84__VKGlobeCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke(uint64_t a1, float a2)
{
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = (const double *)(a1 + 64);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 272);
  float64x2_t v6 = vld1q_dup_f64(v4);
  float64x2_t v7 = vmlaq_n_f64(v6, vsubq_f64(*(float64x2_t *)(a1 + 40), v6), a2);
  *(float64x2_t *)(v5 + 392) = v7;
  *(void *)(v5 + 408) = v3;
  double v8 = fmax(*(double *)(a1 + 64), v7.f64[0]);
  double v9 = v7.f64[1];
  float64x2_t v35 = *(float64x2_t *)(a1 + 72);
  uint64_t v36 = *(void *)(a1 + 88);
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 272);
  *(unsigned char *)(v10 + 160) = 0;
  uint64_t v11 = *(void *)(v10 + 72);
  uint64_t v12 = v36;
  *(float64x2_t *)(v11 + 8) = v35;
  *(void *)(v11 + 24) = v12;
  ++*(_DWORD *)(v10 + 376);
  uint64_t v13 = **(void **)(*(void *)(v10 + 856) + 88);
  if (v13)
  {
    LOBYTE(v32.f64[0]) = 7;
    md::MapEngine::setNeedsTick(v13, &v32);
  }
  double v14 = fmin(v8, v9);
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 272);
  if (*(unsigned char *)(v15 + 184))
  {
    double v16 = fmax(altitude::GlobeView::calculateMinZoomDistance(*(altitude::GlobeView **)(*(void *)(a1 + 32) + 272)), v14);
    double v17 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v15);
    int v18 = *(unsigned __int8 *)(v15 + 184);
    uint64_t v19 = *(void *)(v15 + 72);
    *(double *)(v19 + 32) = fmin(v16, fmax(fmin(*(double *)(v15 + 400), 60592301.5), v17));
    if (v18) {
      *(double *)(v19 + 40) = fmax(*(double *)(v19 + 40), 0.0);
    }
  }
  else
  {
    *(double *)(*(void *)(v15 + 72) + 32) = v14;
  }
  ++*(_DWORD *)(v15 + 376);
  uint64_t v20 = *(void **)(a1 + 32);
  [v20 centerScreenPoint];
  uint64_t v21 = objc_msgSend(v20, "cursorFromScreenPoint:");
  uint64_t v33 = 0;
  uint64_t v34 = v21;
  float64x2_t v32 = 0uLL;
  altitude::GlobeView::getCoordAtScreenPosition(*(void *)(*(void *)(a1 + 32) + 272), (int *)&v34, v35.f64, (uint64_t)&v32, 0);
  __asm { FMOV            V2.2D, #-2.0 }
  float64x2_t v35 = vnegq_f64(vmlaq_f64(v32, _Q2, v35));
  uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 272);
  *(unsigned char *)(v27 + 160) = 0;
  uint64_t v28 = *(void *)(v27 + 72);
  float64x2_t v29 = v35;
  *(void *)(v28 + 24) = v36;
  *(float64x2_t *)(v28 + 8) = v29;
  ++*(_DWORD *)(v27 + 376);
  uint64_t v30 = **(void **)(*(void *)(v27 + 856) + 88);
  if (v30)
  {
    char v37 = 7;
    md::MapEngine::setNeedsTick(v30, &v37);
  }
  altitude::CameraManager::update((altitude::CameraManager *)(*(void *)(a1 + 32) + 280), *(altitude::GlobeView **)(*(void *)(a1 + 32) + 272), 1);
  [*(id *)(a1 + 32) _updateIsPitched];
  [*(id *)(a1 + 32) _updateCanEnter3DMode];
  uint64_t v31 = [*(id *)(a1 + 32) cameraDelegate];
  [v31 mapLayerDidChangeVisibleRegion];
}

void __84__VKGlobeCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke_22(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 272);
  long long v3 = *(_OWORD *)(a1 + 40);
  *(void *)(v2 + 408) = *(void *)(a1 + 56);
  *(_OWORD *)(v2 + 392) = v3;
  altitude::CameraManager::update((altitude::CameraManager *)(*(void *)(a1 + 32) + 280), *(altitude::GlobeView **)(*(void *)(a1 + 32) + 272), 1);
  *(unsigned char *)(*(void *)(a1 + 32) + 520) = 1;
}

- (void)setMinZoomLevel:(double)a3
{
  self->_minZoomLevel = fmax(a3, 1.0);
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
  return self->_minZoomLevel;
}

- (double)_fovAdjustment
{
  (*(void (**)(void *, SEL))(*(void *)self->_globeView + 40))(self->_globeView, a2);
  long long v3 = &dword_1E9592000;
  {
    double v6 = v2;
    long long v3 = &dword_1E9592000;
    double v2 = v6;
    if (v5)
    {
      -[VKGlobeCameraController _fovAdjustment]::tanHalfStandardFovY = 0x3FD12612A0540B8FLL;
      long long v3 = &dword_1E9592000;
      double v2 = v6;
    }
  }
  return v2 / *((double *)v3 + 309);
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
  uint64_t v3 = *((void *)self->_globeView + 9);
  float v4 = *(double *)(v3 + 32);
  float v5 = *(double *)(v3 + 40);
  double v6 = (float)(cosf(v5) * v4);
  [(VKGlobeCameraController *)self _fovAdjustment];
  return v7 * v6;
}

- (double)distanceFromCenterCoordinate
{
  return *(double *)(*((void *)self->_globeView + 9) + 32);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  uint64_t v3 = *((void *)self->_globeView + 9);
  if (v3)
  {
    long long v4 = *(_OWORD *)(v3 + 8);
    uint64_t v12 = *(void *)(v3 + 24);
    long long v11 = v4;
  }
  else
  {
    long long v11 = 0uLL;
    uint64_t v12 = 0;
  }
  [(VKCameraController *)self centerScreenPoint];
  uint64_t v9 = 0;
  Matrix<int, 2, 1> v10 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
  double v7 = 0.0;
  double v8 = 0.0;
  altitude::GlobeView::getCoordAtScreenPosition((uint64_t)self->_globeView, (int *)&v10, (double *)&v11, (uint64_t)&v7, 0);
  double v5 = v7 * 57.2957795;
  double v6 = v8 * 57.2957795;
  result.double var1 = v6;
  result.var0 = v5;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_centerCoordinateForMapRegion:(id)a3
{
  GEOMapRectForMapRegion();
  GEOCoordinate2DForMapPoint();
  result.double var1 = v4;
  result.var0 = v3;
  return result;
}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 timingCurve:(id)a7 completion:(id)a8
{
  id v25 = a3;
  id v14 = a7;
  id v15 = a8;
  [(VKGlobeCameraController *)self _centerCoordinateForMapRegion:v25];
  double v17 = v16;
  double v19 = v18;
  [v25 eastLng];
  double v21 = v20;
  [v25 westLng];
  if (v21 < v22)
  {
    [v25 eastLng];
    [v25 setEastLng:v23 + 360.0];
  }
  [(VKGlobeCameraController *)self zoomForMapRegion:v25];
  -[VKGlobeCameraController moveTo:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:zoom:rotation:tilt:duration:timingCurve:completion:", v14, v15, v17, v19, v24, a5 * -0.0174532925, a4 * 0.0174532925, a6);
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
  [(VKGlobeCameraController *)self _centerCoordinateForMapRegion:v4];
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [(VKCameraController *)self canvas];
  [v13 size];
  double v15 = v14;
  double v16 = [(VKCameraController *)self canvas];
  [v16 size];
  double v18 = v17;

  double v19 = (*(double (**)(void *))(*(void *)self->_globeView + 40))(self->_globeView);
  [(VKGlobeCameraController *)self earthRadiusAt:v10];
  double v69 = v20;
  [v4 northLat];
  -[VKGlobeCameraController geocAngleBetween:andCoordinate:](self, "geocAngleBetween:andCoordinate:");
  double v68 = v21;
  [v4 northLat];
  -[VKGlobeCameraController earthRadiusAt:](self, "earthRadiusAt:");
  double v67 = v22;
  [v4 southLat];
  -[VKGlobeCameraController geocAngleBetween:andCoordinate:](self, "geocAngleBetween:andCoordinate:", v10, v12, v23, v12);
  double v66 = v24;
  [v4 southLat];
  -[VKGlobeCameraController earthRadiusAt:](self, "earthRadiusAt:");
  double v65 = v25;
  [(VKGlobeCameraController *)self widestLatitudeForMapRegion:v4];
  double v27 = v26;
  [v4 westLng];
  double v29 = v28;
  [v4 eastLng];
  [(VKGlobeCameraController *)self greatCircleMidPointLatitude:v27 fromLongitude:v29 toLongitude:v30];
  -[VKGlobeCameraController earthRadiusAt:](self, "earthRadiusAt:");
  double v64 = v31;
  [(VKGlobeCameraController *)self earthRadiusAt:v27];
  double v63 = v32;
  [v4 westLng];
  double v34 = v33;
  [v4 eastLng];
  -[VKGlobeCameraController geocAngleBetween:andCoordinate:](self, "geocAngleBetween:andCoordinate:", v27, v34, v27, v35);
  double v37 = v36;
  uint64_t v38 = [(VKCameraController *)self canvas];
  [v38 size];
  double v40 = v39;
  [(VKCameraController *)self edgeInsets];
  float v62 = v41;
  [(VKCameraController *)self edgeInsets];
  float v61 = v42;

  uint64_t v43 = [(VKCameraController *)self canvas];
  [v43 size];
  double v60 = v44;
  [(VKCameraController *)self edgeInsets];
  float v59 = v45;
  [(VKCameraController *)self edgeInsets];
  float v58 = v46;

  double v47 = [(VKCameraController *)self canvas];
  [v47 size];
  double v49 = v48;

  double v50 = [(VKCameraController *)self canvas];
  double v57 = v15;
  [v50 size];
  double v52 = v51;
  __double2 v53 = __sincos_stret(v68);
  __double2 v54 = __sincos_stret(v66);
  __double2 v55 = __sincos_stret(v37 * 0.5);

  return fmax(v49* fmax(v67 * v53.__sinval / v19 + (v53.__cosval + -1.0) * v69, v65 * v54.__sinval / v19 + (v54.__cosval + -1.0) * v69)/ (v40 - (v62 + v61)), v52 * (v63 * v18 * v55.__sinval / (v19 * v57) + (v55.__cosval + -1.0) * v64) / (v60 - (v59 + v58)));
}

- (double)widestLatitudeForMapRegion:(id)a3
{
  id v3 = a3;
  [v3 southLat];
  if (v4 >= 0.0)
  {
    [v3 southLat];
    goto LABEL_5;
  }
  [v3 northLat];
  double v5 = 0.0;
  if (v6 <= 0.0)
  {
    [v3 northLat];
LABEL_5:
    double v5 = v7;
  }

  return v5;
}

- (double)greatCircleMidPointLatitude:(double)a3 fromLongitude:(double)a4 toLongitude:(double)a5
{
  double v5 = (a5 - a4) * 0.0174532925;
  __double2 v6 = __sincos_stret(a3 * 0.0174532925);
  __double2 v7 = __sincos_stret(v5);
  return atan2(v6.__sinval + v6.__sinval, sqrt(v7.__sinval * v6.__cosval * (v7.__sinval * v6.__cosval)+ (v6.__cosval + v7.__cosval * v6.__cosval) * (v6.__cosval + v7.__cosval * v6.__cosval)))* 57.2957795;
}

- (double)earthRadiusAt:(double)a3
{
  __double2 v3 = __sincos_stret(a3 * 0.0174532925);
  float64x2_t v4 = vmulq_n_f64((float64x2_t)xmmword_1A28FF2A0, v3.__cosval);
  float64x2_t v5 = vmulq_n_f64((float64x2_t)xmmword_1A28FF2B0, v3.__sinval);
  float64x2_t v6 = vmlaq_f64(vmulq_f64(v5, v5), v4, v4);
  return sqrt(vdivq_f64(v6, (float64x2_t)vdupq_laneq_s64((int64x2_t)v6, 1)).f64[0]);
}

- (double)geocAngleBetween:(id)a3 andCoordinate:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  double v5 = a3.var1 * 0.0174532925;
  __double2 v6 = __sincos_stret(a3.var0 * 0.0174532925);
  double v7 = 6378137.0 / sqrt(-(v6.__sinval * v6.__sinval * 0.00669437999 + -1.0));
  __double2 v8 = __sincos_stret(v5);
  double v15 = v7 * v6.__cosval * v8.__sinval;
  double v16 = v7 * v6.__cosval * v8.__cosval;
  __double2 v9 = __sincos_stret(var0 * 0.0174532925);
  double v10 = 6378137.0 / sqrt(-(v9.__sinval * v9.__sinval * 0.00669437999 + -1.0));
  double v11 = v10 * v9.__cosval;
  __double2 v12 = __sincos_stret(var1 * 0.0174532925);
  double v13 = fmax(fmin((v9.__sinval * 0.99330562 * v10 * (v6.__sinval * 0.99330562 * v7)+ v11 * v12.__cosval * v16+ v11 * v12.__sinval * v15)/ sqrt((v11 * v12.__cosval * (v11 * v12.__cosval)+ v11 * v12.__sinval * (v11 * v12.__sinval)+ v9.__sinval * 0.99330562 * v10 * (v9.__sinval * 0.99330562 * v10))* (v16 * v16 + v15 * v15 + v6.__sinval * 0.99330562 * v7 * (v6.__sinval * 0.99330562 * v7))), 1.0), -1.0);
  return acos(v13);
}

- (id)mapRegion
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F64700]);
  __p = 0;
  float v46 = 0;
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
  __double2 v6 = (double *)__p;
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
              uint64_t v38 = v34 - 4;
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
            __double2 v6 = (double *)((char *)__p + v31);
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

- (void)setYaw:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (!self->_globeView || ([(VKGlobeCameraController *)self heading], vabdd_f64(a3, v7) >= 0.000001))
  {
    [(VKGlobeCameraController *)self rotateTo:v4 animated:a3 * -0.0174532925];
  }
}

- (void)updateCameraManager
{
}

- (void)startTrackingAnnotation:(id)a3 trackHeading:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7
{
  BOOL v26 = a5;
  BOOL v9 = a4;
  id v11 = a3;
  id v12 = a7;
  if ([(VKGlobeCameraController *)self isFlyoverTourStarted]) {
    [(VKGlobeCameraController *)self interruptFlyoverTourAnimation];
  }
  annotationTrackingCameraController = self->super._annotationTrackingCameraController;
  if (!annotationTrackingCameraController)
  {
    double v14 = [VKGlobeAnnotationTrackingCameraController alloc];
    double v15 = [(VKCameraController *)self mapDataAccess];
    float64x2_t v16 = [(VKCameraController *)self animationRunner];
    double v17 = [(VKCameraController *)self runLoopController];
    uint64_t v18 = [(VKCameraController *)self cameraDelegate];
    float64x2_t v19 = [(VKAnnotationTrackingCameraController *)v14 initWithMapDataAccess:v15 animationRunner:v16 runLoopController:v17 cameraDelegate:v18];
    float64x2_t v20 = self->super._annotationTrackingCameraController;
    self->super._annotationTrackingCameraController = v19;

    float64x2_t v21 = self->super._annotationTrackingCameraController;
    [(VKCameraController *)self camera];
    [(VKCameraController *)v21 setCamera:v29];
    float64x2_t v22 = v30;
    if (v30 && !atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
    float64x2_t v23 = [(VKCameraController *)self canvas];
    [(VKCameraController *)self->super._annotationTrackingCameraController setCanvas:v23];

    long long v27 = *(_OWORD *)&self->super._annotationTrackingBehavior.shouldZoomToFit;
    uint64_t v28 = *(void *)&self->super._annotationTrackingBehavior.shouldPreserveUserSpecifiedZoomLevel;
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setBehavior:&v27];
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setHasUserSpecifiedZoomLevel:self->super._userChangedZoomSinceLastProgrammaticRegionChange];
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setHeadingAnimationDisplayRate:self->super._annotationTrackingHeadingAnimationDisplayRate];
    [(VKCameraController *)self edgeInsets];
    -[VKCameraController setEdgeInsets:](self->super._annotationTrackingCameraController, "setEdgeInsets:");
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setGlobeView:[(VKGlobeCameraController *)self globeView]];
    float64x2_t v24 = self->super._annotationTrackingCameraController;
    float64x2_t v25 = [(VKScreenCameraController *)self regionRestriction];
    [(VKAnnotationTrackingCameraController *)v24 setRegionRestriction:v25];

    annotationTrackingCameraController = self->super._annotationTrackingCameraController;
  }
  [(VKAnnotationTrackingCameraController *)annotationTrackingCameraController startTrackingAnnotation:v11 trackHeading:v9 animated:v26 duration:v12 timingFunction:a6];
}

- (void)setGesturing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VKGlobeCameraController;
  -[VKCameraController setGesturing:](&v5, sel_setGesturing_);
  [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setGesturing:v3];
  if (v3)
  {
    [(VKGlobeCameraController *)self stopGlobeAnimations];
    if ([(VKGlobeCameraController *)self isFlyoverTourStarted]) {
      [(VKGlobeCameraController *)self pauseFlyoverTourAnimation];
    }
  }
  else if ([(VKGlobeCameraController *)self isFlyoverTourStarted] {
         && self->_tourShouldResumeWhenDoneGesturing)
  }
  {
    [(VKGlobeCameraController *)self resumeFlyoverTourAnimation];
  }
}

- (void)updateState
{
  [(VKGlobeCameraController *)self _updateIsPitched];
  [(VKGlobeCameraController *)self _updateCanEnter3DMode];
}

- (void)_updateCanEnter3DMode
{
  BOOL v3 = [(VKGlobeCameraController *)self canEnter3DMode];
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
  if (self->_globeView)
  {
    BOOL v3 = [(VKGlobeCameraController *)self isPitched];
    if (self->_wasPitched != v3)
    {
      BOOL v4 = v3;
      objc_super v5 = [(VKCameraController *)self cameraDelegate];
      [v5 mapLayerDidBecomePitched:v4];

      self->_wasPitched = v4;
    }
  }
}

- (double)maxPitch
{
  p_cameraManager = &self->_cameraManager;
  if (self->_cameraManager._useTiltLimit)
  {
    double v3 = *(double *)(*((void *)self->_globeView + 9) + 32);
    double v4 = 0.0;
    if (v3 <= 1500000.0)
    {
      double v5 = 1.0;
      double v6 = fmax(v3, 1.0);
      double v4 = 0.680678408 - cos(sqrt(v6 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
      if (p_cameraManager->_tiltLimitMode == 1)
      {
        if (v6 < 20000.0) {
          double v5 = p_cameraManager->_fullZoomTiltLimitFactor
        }
             + v6 * 0.00005 * (1.0 - p_cameraManager->_fullZoomTiltLimitFactor);
        double v4 = v5 * v4;
      }
      if (p_cameraManager->_tiltLimitTransferInProgress) {
        double v4 = p_cameraManager->_startTiltLimitTilt
      }
           + fmin(fmax(p_cameraManager->_tiltLimitTransferFraction, 0.0), 1.0)
           * (v4 - p_cameraManager->_startTiltLimitTilt);
    }
  }
  else
  {
    double v4 = 1.57079633;
  }
  return v4 * 57.2957795;
}

- (double)minPitch
{
  return 15.0;
}

- (BOOL)isFullyPitched
{
  uint64_t v2 = *((void *)self->_globeView + 9);
  double v3 = *(double *)(v2 + 40);
  p_cameraManager = &self->_cameraManager;
  if (self->_cameraManager._useTiltLimit)
  {
    double v5 = *(double *)(v2 + 32);
    double v6 = 0.0;
    if (v5 <= 1500000.0)
    {
      double v7 = 1.0;
      double v8 = fmax(v5, 1.0);
      double v6 = 0.680678408 - cos(sqrt(v8 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
      if (p_cameraManager->_tiltLimitMode == 1)
      {
        if (v8 < 20000.0) {
          double v7 = p_cameraManager->_fullZoomTiltLimitFactor
        }
             + v8 * 0.00005 * (1.0 - p_cameraManager->_fullZoomTiltLimitFactor);
        double v6 = v7 * v6;
      }
      if (p_cameraManager->_tiltLimitTransferInProgress) {
        double v6 = p_cameraManager->_startTiltLimitTilt
      }
           + fmin(fmax(p_cameraManager->_tiltLimitTransferFraction, 0.0), 1.0)
           * (v6 - p_cameraManager->_startTiltLimitTilt);
    }
  }
  else
  {
    double v6 = 1.57079633;
  }
  return v3 > v6;
}

- (BOOL)isPitched
{
  return *(double *)(*((void *)self->_globeView + 9) + 40) > 0.0001;
}

- (BOOL)canEnter3DMode
{
  p_cameraManager = &self->_cameraManager;
  if (self->_cameraManager._useTiltLimit)
  {
    double v3 = *(double *)(*((void *)self->_globeView + 9) + 32);
    double v4 = 0.0;
    if (v3 <= 1500000.0)
    {
      double v5 = 1.0;
      double v6 = fmax(v3, 1.0);
      double v4 = 0.680678408 - cos(sqrt(v6 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
      if (p_cameraManager->_tiltLimitMode == 1)
      {
        if (v6 < 20000.0) {
          double v5 = p_cameraManager->_fullZoomTiltLimitFactor
        }
             + v6 * 0.00005 * (1.0 - p_cameraManager->_fullZoomTiltLimitFactor);
        double v4 = v5 * v4;
      }
      if (p_cameraManager->_tiltLimitTransferInProgress) {
        double v4 = p_cameraManager->_startTiltLimitTilt
      }
           + fmin(fmax(p_cameraManager->_tiltLimitTransferFraction, 0.0), 1.0)
           * (v4 - p_cameraManager->_startTiltLimitTilt);
    }
  }
  else
  {
    double v4 = 1.57079633;
  }
  return v4 > 0.261799388;
}

- (void)exit3DMode
{
}

- (void)enter3DMode
{
  p_cameraManager = &self->_cameraManager;
  if (self->_cameraManager._useTiltLimit)
  {
    double v4 = *(double *)(*((void *)self->_globeView + 9) + 32);
    double v5 = 0.0;
    if (v4 <= 1500000.0)
    {
      double v6 = 1.0;
      double v7 = fmax(v4, 1.0);
      double v5 = 0.680678408 - cos(sqrt(v7 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
      if (p_cameraManager->_tiltLimitMode == 1)
      {
        if (v7 < 20000.0) {
          double v6 = p_cameraManager->_fullZoomTiltLimitFactor
        }
             + v7 * 0.00005 * (1.0 - p_cameraManager->_fullZoomTiltLimitFactor);
        double v5 = v6 * v5;
      }
      if (p_cameraManager->_tiltLimitTransferInProgress) {
        double v5 = p_cameraManager->_startTiltLimitTilt
      }
           + fmin(fmax(p_cameraManager->_tiltLimitTransferFraction, 0.0), 1.0)
           * (v5 - p_cameraManager->_startTiltLimitTilt);
    }
  }
  else
  {
    double v5 = 1.57079633;
  }
  double v8 = fmin(v5, 0.785398163);
  [(VKGlobeCameraController *)self tiltTo:1 animated:1 exaggerate:v8];
}

- (void)stopGlobeAnimations
{
  regionAnimation = self->super._regionAnimation;
  if (regionAnimation)
  {
    [(VKAnimation *)regionAnimation stop];
    double v4 = self->super._regionAnimation;
    self->super._regionAnimation = 0;
  }
  rotationAnimation = self->super._rotationAnimation;
  if (rotationAnimation)
  {
    [(VKAnimation *)rotationAnimation stop];
    double v6 = self->super._rotationAnimation;
    self->super._rotationAnimation = 0;
  }
  pitchAnimation = self->super._pitchAnimation;
  if (pitchAnimation)
  {
    [(VKAnimation *)pitchAnimation stop];
    double v8 = self->super._pitchAnimation;
    self->super._pitchAnimation = 0;
  }
  zoomAnimation = self->super._zoomAnimation;
  if (zoomAnimation)
  {
    [(VKAnimation *)zoomAnimation stop];
    double v10 = self->super._zoomAnimation;
    self->super._zoomAnimation = 0;
  }
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

- (void)adjustLoadingForAnimation:(float)a3 progressFactor:(float)a4
{
  globeView = (altitude::GlobeView *)self->_globeView;
  float v5 = a3 * 7.0;
  float v6 = 95.0 - (float)(a4 * 95.0);
  *(float *)(*((void *)globeView + 98) + 1312) = a3 * 7.0;
  uint64_t v7 = *((void *)globeView + 65);
  if (v7 && (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)v7 + 24))(v7, 0, 0xFFFFFFFFLL)) {
    *(float *)((*(uint64_t (**)(void, void, uint64_t))(**((void **)globeView + 65) + 24))(*((void *)globeView + 65), 0, 0xFFFFFFFFLL)+ 1312) = v5;
  }
  float v8 = (float)(v6 * 0.01) + 1.0;
  altitude::GlobeView::setCoarseLoading(globeView);
  *(float *)(*((void *)globeView + 98) + 1304) = v6;
  uint64_t v9 = *((void *)globeView + 65);
  if (!v9)
  {
    uint64_t v12 = *((void *)globeView + 98);
    goto LABEL_11;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)v9 + 24))(v9, 0, 0xFFFFFFFFLL);
  uint64_t v11 = *((void *)globeView + 65);
  if (v10)
  {
    *(float *)((*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)v11 + 24))(v11, 0, 0xFFFFFFFFLL)
             + 1304) = v6;
    uint64_t v11 = *((void *)globeView + 65);
  }
  *(float *)(*((void *)globeView + 98) + 1308) = v8;
  if (v11 && (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)v11 + 24))(v11, 0, 0xFFFFFFFFLL))
  {
    uint64_t v12 = (*(uint64_t (**)(void, void, uint64_t))(**((void **)globeView + 65) + 24))(*((void *)globeView + 65), 0, 0xFFFFFFFFLL);
LABEL_11:
    *(float *)(v12 + 1308) = v8;
  }
}

- (float)slowDownFactorFromLoadProgress
{
  MainTileLoaderStatistics = altitude::GlobeView::getMainTileLoaderStatistics(*((altitude::GlobeView **)self->_globeView + 58), *((void *)self->_globeView + 66));
  unsigned int v3 = *((_DWORD *)MainTileLoaderStatistics + 1);
  if (v3) {
    return fminf((float)*((unsigned int *)MainTileLoaderStatistics + 2) / (float)v3, cbrtf(1.0 - (float)((float)*((unsigned int *)MainTileLoaderStatistics + 4) / (float)v3)));
  }
  else {
    return 1.0;
  }
}

- (BOOL)isFlyoverTourStarted
{
  uint64_t v2 = *((void *)self->_globeView + 78);
  return v2 && *(_DWORD *)(v2 + 116) != 2;
}

- (void)interruptFlyoverTourAnimation
{
  uint64_t v2 = *((void *)self->_globeView + 78);
  if (v2 && *(_DWORD *)(v2 + 116) != 2)
  {
    *(_DWORD *)(v2 + 116) = 2;
    uint64_t v3 = *(void *)(v2 + 184);
    if (v3) {
      *(void *)(v3 + 264) = 0;
    }
    uint64_t v4 = *(void *)(v2 + 144);
    if (v4)
    {
      int v7 = 4;
      (*(void (**)(uint64_t, int *))(*(void *)v4 + 48))(v4, &v7);
      uint64_t v5 = *(void *)(v2 + 144);
      *(void *)(v2 + 144) = 0;
      if (v5 == v2 + 120)
      {
        (*(void (**)(uint64_t))(*(void *)(v2 + 120) + 32))(v2 + 120);
      }
      else if (v5)
      {
        (*(void (**)(uint64_t))(*(void *)v5 + 40))(v5);
      }
      uint64_t v6 = *(void *)(v2 + 176);
      *(void *)(v2 + 176) = 0;
      if (v6 == v2 + 152)
      {
        (*(void (**)(uint64_t))(*(void *)(v2 + 152) + 32))(v2 + 152);
      }
      else if (v6)
      {
        (*(void (**)(uint64_t))(*(void *)v6 + 40))(v6);
      }
    }
  }
}

- (void)stopFlyoverTourAnimation
{
  uint64_t v2 = (_DWORD *)*((void *)self->_globeView + 78);
  if (v2) {
    altitude::FlyoverTour::stopTour(v2);
  }
}

- (void)resumeFlyoverTourAnimation
{
  uint64_t v2 = *((void *)self->_globeView + 78);
  if (v2 && !*(_DWORD *)(v2 + 116))
  {
    *(_DWORD *)(v2 + 116) = 1;
    uint64_t v3 = *(void *)(*(void *)(v2 + 184) + 72);
    long long v4 = *(_OWORD *)(v3 + 24);
    long long v5 = *(_OWORD *)(v3 + 40);
    long long v6 = *(_OWORD *)(v3 + 8);
    *(void *)(v2 + 240) = *(void *)(v3 + 56);
    *(_OWORD *)(v2 + 208) = v4;
    *(_OWORD *)(v2 + 224) = v5;
    *(_OWORD *)(v2 + 192) = v6;
    *(_DWORD *)(v2 + 248) = 1065353216;
    uint64_t v7 = *(void *)(v2 + 144);
    if (v7)
    {
      int v8 = 2;
      (*(void (**)(uint64_t, int *))(*(void *)v7 + 48))(v7, &v8);
    }
  }
}

- (void)pauseFlyoverTourAnimation
{
  uint64_t v2 = *((void *)self->_globeView + 78);
  if (v2 && *(_DWORD *)(v2 + 116) == 1)
  {
    *(_DWORD *)(v2 + 116) = 0;
    uint64_t v3 = *(void *)(v2 + 144);
    if (v3)
    {
      int v4 = 1;
      (*(void (**)(uint64_t, int *))(*(void *)v3 + 48))(v3, &v4);
    }
  }
}

- (void)flyoverTourAnimation:(id)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = *((void *)self->_globeView + 78);
  uint64_t v48 = 0;
  long long v46 = 0u;
  int8x16_t v47 = 0u;
  memset(v45, 0, sizeof(v45));
  long long v44 = 0u;
  if (v10)
  {
    [v10 cameraPathAtIndex:0];
    double v14 = *(double *)v45;
    double v16 = *(double *)&v47.i64[1];
    double v15 = *(double *)v47.i64;
    double v17 = *(double *)&v46;
    double v18 = *((double *)v45 + 1) * 57.2957795;
    double v19 = *(double *)&v45[1] * 57.2957795;
  }
  else
  {
    double v17 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    double v14 = 0.0;
    double v19 = 0.0;
    double v18 = 0.0;
  }
  uint64_t v20 = [v10 cameraPathsCount];
  if (v10)
  {
    [v10 cameraPathAtIndex:v20 - 1];
  }
  else
  {
    uint64_t v43 = 0;
    long long v41 = 0u;
    int8x16_t v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v38 = 0u;
  }
  v45[1] = v40;
  long long v46 = v41;
  int8x16_t v47 = v42;
  uint64_t v48 = v43;
  long long v44 = v38;
  v45[0] = v39;
  uint64_t v21 = v39;
  uint64_t v22 = v41;
  self->_cameraManager._useTiltLimit = 0;
  float64x2_t v23 = VKAnimationCurveEaseInOut;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3321888768;
  v28[2] = __88__VKGlobeCameraController_flyoverTourAnimation_animateToStart_labelChanged_stateChange___block_invoke;
  v28[3] = &unk_1EF58DD78;
  id v24 = v12;
  id v30 = v24;
  id v25 = v11;
  id v31 = v25;
  uint64_t v32 = v13;
  v28[4] = self;
  id v26 = v10;
  id v29 = v26;
  long long v33 = *(_OWORD *)((char *)v45 + 8);
  uint64_t v34 = v21;
  int8x16_t v35 = vextq_s8(v47, v47, 8uLL);
  uint64_t v36 = v22;
  uint64_t v37 = 0;
  if (v8) {
    double v27 = 1.0;
  }
  else {
    double v27 = 0.0;
  }
  -[VKGlobeCameraController moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", 1, v23, v28, v18, v19, v14, v16, v17, v15, v27);
}

void __88__VKGlobeCameraController_flyoverTourAnimation_animateToStart_labelChanged_stateChange___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = a1;
  v46[11] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void (***)(void, void))(a1 + 48);
  if (!a2)
  {
    if (v3) {
      v3[2](v3, 3);
    }
    goto LABEL_32;
  }
  uint64_t v27 = v2;
  long long v40 = &unk_1EF55A058;
  float64x2_t v23 = (void *)[v3 copy];
  uint64_t v41 = MEMORY[0x1A6239EB0]();

  uint64_t v4 = [*(id *)(v2 + 56) copy];
  long long v38 = &unk_1EF55A078;
  id v24 = (void *)v4;
  uint64_t v39 = MEMORY[0x1A6239EB0]();

  uint64_t v5 = v2;
  [*(id *)(v2 + 32) beginRegionChange:1];
  id v25 = *(altitude::FlyoverTour **)(v2 + 64);
  long long v6 = *(void **)(v2 + 40);
  id v35 = *(id *)(v5 + 32);
  geo::_retain_ptr<void({block_pointer} {__strong})(NSString *),geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr(&v36, (uint64_t)&v38);
  float v45 = 0;
  uint64_t v7 = operator new(0x28uLL);
  *uint64_t v7 = &unk_1EF57E010;
  id v8 = v35;
  v7[3] = 0;
  v7[1] = v8;
  v7[2] = &unk_1EF55A078;
  uint64_t v9 = MEMORY[0x1A6239EB0](v37);
  id v10 = (void *)v7[3];
  v7[3] = v9;

  id v11 = v37;
  uint64_t v37 = 0;

  float v45 = v7;
  id v28 = *(id *)(v27 + 32);
  long long v29 = *(_OWORD *)(v27 + 72);
  long long v30 = *(_OWORD *)(v27 + 88);
  long long v31 = *(_OWORD *)(v27 + 104);
  uint64_t v32 = *(void *)(v27 + 120);
  geo::_retain_ptr<void({block_pointer} {__strong})(VKFlyoverTourState),geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr(&v33, (uint64_t)&v40);
  uint64_t v43 = 0;
  id v12 = operator new(0x60uLL);
  *id v12 = &unk_1EF57E058;
  id v13 = v28;
  v12[10] = 0;
  v12[1] = v13;
  *((_OWORD *)v12 + 1) = v29;
  *((_OWORD *)v12 + 2) = v30;
  *((_OWORD *)v12 + 3) = v31;
  v12[8] = v32;
  v12[9] = &unk_1EF55A058;
  uint64_t v14 = MEMORY[0x1A6239EB0](v34);
  double v15 = (void *)v12[10];
  v12[10] = v14;

  double v16 = v34;
  uint64_t v34 = 0;

  uint64_t v43 = v12;
  id v26 = v6;
  altitude::FlyoverTour::stopTour(v25);
  uint64_t v17 = *((void *)v25 + 10);
  if (v17)
  {
    double v18 = *(md::AnimationData **)(v17 + 8);
    if (v18)
    {
      md::AnimationData::~AnimationData(v18);
      MEMORY[0x1A6239270]();
    }

    MEMORY[0x1A6239270](v17, 0x10E0C402FD04164);
    *((void *)v25 + 10) = 0;
  }
  if (v26) {
    operator new();
  }
  LODWORD(v46[0]) = 6;
  if (v43)
  {
    (*(void (**)(void *, void *))(*v43 + 48))(v43, v46);

    if (v43 == v42)
    {
      (*(void (**)(void *))(v42[0] + 32))(v42);
    }
    else if (v43)
    {
      (*(void (**)(void))(*v43 + 40))();
    }
    long long v33 = &unk_1EF55A058;
    if (v34)
    {

      double v19 = v34;
    }
    else
    {
      double v19 = 0;
    }

    if (v45 == v44)
    {
      (*(void (**)(void *))(v44[0] + 32))(v44);
    }
    else if (v45)
    {
      (*(void (**)(void))(*v45 + 40))();
    }
    uint64_t v36 = &unk_1EF55A078;
    if (v37)
    {

      uint64_t v20 = v37;
    }
    else
    {
      uint64_t v20 = 0;
    }

    long long v38 = &unk_1EF55A078;
    if (v39)
    {

      uint64_t v21 = (void *)v39;
    }
    else
    {
      uint64_t v21 = 0;
    }

    long long v40 = &unk_1EF55A058;
    if (v41)
    {

      uint64_t v22 = (void *)v41;
    }
    else
    {
      uint64_t v22 = 0;
    }

    uint64_t v2 = v27;
LABEL_32:
    *(unsigned char *)(*(void *)(v2 + 32) + 513) = 1;
    return;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (void)moveToZoomOutZoomInTransition:(id)a3 height:(double)a4 useHeight:(BOOL)a5 zoom:(double)a6 rotation:(double)a7 tilt:(double)a8 duration:(double)a9 timingCurve:(id)a10 completion:(id)a11
{
  BOOL v16 = a5;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v21 = a10;
  uint64_t v22 = (void (**)(id, uint64_t))a11;
  [(VKGlobeCameraController *)self stopGlobeAnimations];
  if ([(VKGlobeCameraController *)self isFlyoverTourStarted]) {
    [(VKGlobeCameraController *)self stopFlyoverTourAnimation];
  }
  [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController pauseAnimation];
  double v74 = a6;
  globeView = (double *)self->_globeView;
  uint64_t v24 = *((void *)globeView + 9);
  double v71 = a8;
  if (v24)
  {
    double v25 = *(double *)(v24 + 8);
    v79 = *(void **)(v24 + 16);
    double v26 = *(double *)(v24 + 24);
  }
  else
  {
    double v26 = 0.0;
    v79 = 0;
    double v25 = 0.0;
  }
  double v76 = a9;
  double v27 = globeView[49];
  double v28 = globeView[50];
  double v29 = var0 * 0.0174532925;
  double v30 = var1 * 0.0174532925;
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x2020000000;
  uint64_t v96 = 0;
  double v77 = v26;
  double v78 = a7;
  double v80 = v30;
  if (v16)
  {
    double v68 = *(void **)(v24 + 48);
    double v69 = *(void **)(v24 + 56);
    double v72 = *(double *)(v24 + 32);
    double v73 = a4;
    double v67 = *(void **)(v24 + 40);
  }
  else
  {
    double v31 = v25;
    location[0] = *(id *)&v29;
    location[1] = *(id *)&v30;
    Anchor = altitude::GlobeView::createAnchor((uint64_t)globeView, (double *)location);
    v94[3] = (uint64_t)Anchor;
    uint64_t v33 = *((void *)self->_globeView + 9);
    double v68 = *(void **)(v33 + 48);
    double v69 = *(void **)(v33 + 56);
    double v67 = *(void **)(v33 + 40);
    double v25 = v31;
    double v72 = *(double *)(v33 + 32);
    if (Anchor) {
      double v73 = *((double *)Anchor + 7);
    }
    else {
      double v73 = a4;
    }
  }
  double v75 = fmin(fmax(v27, v74), v28);
  double v70 = v25;
  __double2 v34 = __sincos_stret(v25);
  double v35 = 6378137.0 / sqrt(-(v34.__sinval * v34.__sinval * 0.00669437999 + -1.0));
  __double2 v36 = __sincos_stret(*(double *)&v79);
  double v37 = v35 * v34.__cosval * v36.__cosval;
  double v38 = v35 * v34.__cosval * v36.__sinval;
  __double2 v39 = __sincos_stret(v29);
  double v40 = 6378137.0 / sqrt(-(v39.__sinval * v39.__sinval * 0.00669437999 + -1.0));
  double v41 = v40 * v39.__cosval;
  __double2 v42 = __sincos_stret(v80);
  double v43 = acos(fmax(fmin((v34.__sinval * 0.99330562 * v35 * (v39.__sinval * 0.99330562 * v40)+ v37 * (v41 * v42.__cosval)+ v38 * (v41 * v42.__sinval))/ sqrt((v37 * v37 + v38 * v38 + v34.__sinval * 0.99330562 * v35 * (v34.__sinval * 0.99330562 * v35))* (v41 * v42.__cosval * (v41 * v42.__cosval)+ v41 * v42.__sinval * (v41 * v42.__sinval)+ v39.__sinval * 0.99330562 * v40 * (v39.__sinval * 0.99330562 * v40))), 1.0), -1.0));
  double v44 = ((vabdd_f64(v77 + v72, v75 + v73) * 0.0000000499064047 + v43 * 0.318309886) * 0.8 + 0.2) * v76;
  if (v44 <= 0.0)
  {
    [(VKCameraController *)self beginRegionChange:0];
    self->_cameraManager._tiltLimitPushDownEnabled = 0;
    self->_cameraManager._tiltLimitPushDown = 0;
    __double2 v53 = (unsigned __int8 *)self->_globeView;
    v53[160] = !v16;
    __double2 v54 = (double *)*((void *)v53 + 9);
    v54[1] = v29;
    v54[2] = v80;
    v54[3] = a4;
    ++*((_DWORD *)v53 + 94);
    uint64_t v55 = **(void **)(*((void *)v53 + 107) + 88);
    if (v55)
    {
      LOBYTE(location[0]) = 7;
      md::MapEngine::setNeedsTick(v55, location);
      __double2 v53 = (unsigned __int8 *)self->_globeView;
      __double2 v54 = (double *)*((void *)v53 + 9);
    }
    int v56 = v53[184];
    double v57 = fmax(v71, 0.0);
    if (!v53[184]) {
      double v57 = v71;
    }
    v54[5] = v57;
    ++*((_DWORD *)v53 + 94);
    if (v56)
    {
      double v58 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v53);
      double v59 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v53);
      uint64_t v60 = *((void *)v53 + 9);
      int v61 = v53[184];
      *(double *)(v60 + 32) = fmin(fmax(v58, v75), fmax(fmin(*((double *)v53 + 50), 60592301.5), v59));
      if (v61) {
        *(double *)(v60 + 40) = fmax(*(double *)(v60 + 40), 0.0);
      }
    }
    else
    {
      v54[4] = v75;
    }
    ++*((_DWORD *)v53 + 94);
    float v62 = self->_globeView;
    uint64_t v63 = v62[9];
    long double v64 = fmod(v78 + 3.14159265, 6.28318531);
    *(long double *)(v63 + 48) = fmod(v64 + 6.28318531, 6.28318531) + -3.14159265;
    ++*((_DWORD *)v62 + 94);
    altitude::CameraManager::update((altitude::CameraManager *)&self->_cameraManager, (altitude::GlobeView *)v62, 1);
    [(VKGlobeCameraController *)self _updateIsPitched];
    [(VKGlobeCameraController *)self _updateCanEnter3DMode];
    double v65 = [(VKCameraController *)self cameraDelegate];
    [v65 mapLayerDidChangeVisibleRegion];

    uint64_t v66 = *(void *)[(VKCameraController *)self runLoopController];
    if (v66)
    {
      LOBYTE(location[0]) = 4;
      md::MapEngine::setNeedsTick(v66, location);
    }
    [(VKCameraController *)self endRegionChange];
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController resumeAnimation];
    self->_cameraManager._tiltLimitPushDownEnabled = 1;
    if (v22) {
      v22[2](v22, 1);
    }
  }
  else
  {
    float v45 = [[VKTimedAnimation alloc] initWithDuration:v44];
    regionAnimation = self->super._regionAnimation;
    self->super._regionAnimation = v45;

    if (v21) {
      uint64_t v47 = (uint64_t)v21;
    }
    else {
      uint64_t v47 = VKAnimationCurveExponentialEaseInOut;
    }
    uint64_t v48 = (void *)MEMORY[0x1A6239EB0](v47);
    [(VKTimedAnimation *)self->super._regionAnimation setTimingFunction:v48];
    objc_initWeak(location, self);
    if (fabs(v43 * 57.2957795) <= 0.05)
    {
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3321888768;
      v90[2] = __125__VKGlobeCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke;
      v90[3] = &unk_1EF58DF28;
      float64x2x2_t v50 = v91;
      objc_copyWeak(v91, location);
      v91[1] = *(id *)&v70;
      v91[2] = v79;
      v91[3] = *(id *)&v77;
      v91[4] = *(id *)&v72;
      v91[5] = v67;
      v91[6] = v68;
      v91[7] = v69;
      v91[8] = *(id *)&v29;
      v91[9] = *(id *)&v80;
      v91[10] = *(id *)&v73;
      v91[11] = *(id *)&v75;
      v91[12] = *(id *)&v71;
      v91[13] = *(id *)&v78;
      v91[14] = v69;
      [(VKTimedAnimation *)self->super._regionAnimation setStepHandler:v90];
    }
    else
    {
      *(double *)v89 = v70;
      v89[1] = v79;
      *(double *)&v89[2] = v77;
      *(double *)&v89[3] = v72;
      v89[4] = v67;
      v89[5] = v68;
      v89[6] = v69;
      *(double *)v88 = v29;
      *(double *)&v88[1] = v80;
      *(double *)&v88[2] = v73;
      *(double *)&v88[3] = v75;
      *(double *)&v88[4] = v71;
      *(double *)&v88[5] = v78;
      v88[6] = v69;
      float64x2x2_t v49 = [(VKGlobeCameraController *)self createMoveToZoomOutZoomInFrameFunction:v89 toLatLon:v88];
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __125__VKGlobeCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_14;
      v85[3] = &unk_1E5A94408;
      float64x2x2_t v50 = &v87;
      objc_copyWeak(&v87, location);
      id v86 = v49;
      double v51 = self->super._regionAnimation;
      id v52 = v49;
      [(VKTimedAnimation *)v51 setStepHandler:v85];
    }
    objc_destroyWeak(v50);
    [(VKCameraController *)self beginRegionChange:1];
    self->_cameraManager._tiltLimitPushDownEnabled = 0;
    self->_cameraManager._tiltLimitPushDown = 0;
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __125__VKGlobeCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_2;
    v81[3] = &unk_1E5A943E0;
    objc_copyWeak(&v84, location);
    v82 = v22;
    v83 = &v93;
    [(VKAnimation *)self->super._regionAnimation setCompletionHandler:v81];
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._regionAnimation->super);

    objc_destroyWeak(&v84);
    objc_destroyWeak(location);
  }
  _Block_object_dispose(&v93, 8);
}

void __125__VKGlobeCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke(uint64_t a1, float a2)
{
  WeakRetained = (altitude::GlobeView **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v4 = *(double *)(a1 + 80);
    double v5 = *(double *)(a1 + 72) + (*(double *)(a1 + 128) - *(double *)(a1 + 72)) * a2;
    long double v6 = fmod(3.14159265 - v4 + *(double *)(a1 + 136), 6.28318531);
    long double v7 = fmod(v6 + 6.28318531, 6.28318531);
    long double v8 = fmod(v4 + 3.14159265 + (v7 + -3.14159265) * a2, 6.28318531);
    long double v9 = fmod(v8 + 6.28318531, 6.28318531) + -3.14159265;
    double v10 = *(double *)(a1 + 40);
    long double v11 = fmod(3.14159265 - v10 + *(double *)(a1 + 96), 6.28318531);
    long double v12 = fmod(v11 + 6.28318531, 6.28318531);
    long double v13 = fmod(v10 + 3.14159265 + (v12 + -3.14159265) * a2, 6.28318531);
    long double v14 = fmod(v13 + 6.28318531, 6.28318531) + -3.14159265;
    double v15 = *(double *)(a1 + 48);
    long double v16 = fmod(3.14159265 - v15 + *(double *)(a1 + 104), 6.28318531);
    long double v17 = fmod(v16 + 6.28318531, 6.28318531);
    long double v18 = fmod(v15 + 3.14159265 + (v17 + -3.14159265) * a2, 6.28318531);
    long double v19 = fmod(v18 + 6.28318531, 6.28318531);
    float64x2_t v20 = vmlaq_n_f64(*(float64x2_t *)(a1 + 56), vsubq_f64(*(float64x2_t *)(a1 + 112), *(float64x2_t *)(a1 + 56)), a2);
    id v21 = WeakRetained[34];
    uint64_t v22 = *((void *)v21 + 9);
    *(long double *)(v22 + 8) = v14;
    *(long double *)(v22 + 16) = v19 + -3.14159265;
    *(float64x2_t *)(v22 + 24) = v20;
    *(double *)(v22 + 40) = v5;
    *(long double *)(v22 + 48) = v9;
    *(void *)(v22 + 56) = 0;
    ++*((_DWORD *)v21 + 94);
    altitude::CameraManager::update((altitude::CameraManager *)(WeakRetained + 35), WeakRetained[34], 0);
    [WeakRetained _updateIsPitched];
    [WeakRetained _updateCanEnter3DMode];
    float64x2_t v23 = [WeakRetained cameraDelegate];
    [v23 mapLayerDidChangeVisibleRegion];

    uint64_t v24 = *(void *)[WeakRetained runLoopController];
    if (v24)
    {
      char v26 = 4;
      md::MapEngine::setNeedsTick(v24, &v26);
    }
  }
}

void __125__VKGlobeCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_14(uint64_t a1, float a2)
{
  WeakRetained = (altitude::GlobeView **)objc_loadWeakRetained((id *)(a1 + 40));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    long double v6 = WeakRetained[34];
    (*(void (**)(_OWORD *__return_ptr, float))(*(void *)(a1 + 32) + 16))(v12, a2);
    uint64_t v7 = *((void *)v6 + 9);
    long long v8 = v12[0];
    long long v9 = v12[1];
    long long v10 = v12[2];
    *(void *)(v7 + 56) = v13;
    *(_OWORD *)(v7 + 40) = v10;
    *(_OWORD *)(v7 + 24) = v9;
    *(_OWORD *)(v7 + 8) = v8;
    ++*((_DWORD *)v6 + 94);
    altitude::CameraManager::update((altitude::CameraManager *)(v5 + 35), v5[34], 0);
    [v5 _updateIsPitched];
    [v5 _updateCanEnter3DMode];
    long double v11 = [v5 cameraDelegate];
    [v11 mapLayerDidChangeVisibleRegion];
  }
}

void __125__VKGlobeCameraController_moveToZoomOutZoomInTransition_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 520) = 1;
    long long v8 = WeakRetained;
    [WeakRetained endRegionChange];
    [v8[23] resumeAnimation];
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(altitude::Anchor **)(v6 + 24);
    if (v7)
    {
      altitude::Anchor::destroy(v7);
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    WeakRetained = v8;
    *(void *)(v6 + 24) = 0;
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
  v65[2] = __75__VKGlobeCameraController_createMoveToZoomOutZoomInFrameFunction_toLatLon___block_invoke;
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

long double __75__VKGlobeCameraController_createMoveToZoomOutZoomInFrameFunction_toLatLon___block_invoke@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
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

- (void)moveTo:(id)a3 height:(double)a4 useHeight:(BOOL)a5 zoom:(double)a6 rotation:(double)a7 tilt:(double)a8 duration:(double)a9 timingCurve:(id)a10 completion:(id)a11
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v21 = a10;
  long double v22 = (void (**)(id, uint64_t))a11;
  [(VKGlobeCameraController *)self stopGlobeAnimations];
  if ([(VKGlobeCameraController *)self isFlyoverTourStarted]) {
    [(VKGlobeCameraController *)self stopFlyoverTourAnimation];
  }
  [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController pauseAnimation];
  double v23 = var0 * 0.0174532925;
  double v24 = var1 * 0.0174532925;
  double v25 = fmin(fmax(*((double *)self->_globeView + 49), a6), *((double *)self->_globeView + 50));
  if (a9 <= 0.0)
  {
    [(VKCameraController *)self beginRegionChange:0];
    self->_cameraManager._tiltLimitPushDownEnabled = 0;
    self->_cameraManager._tiltLimitPushDown = 0;
    v79.f64[0] = v23;
    v79.f64[1] = v24;
    uint64_t v80 = *(void *)&a4;
    globeView = self->_globeView;
    BOOL v32 = !a5;
    globeView[160] = !a5;
    uint64_t v33 = *((void *)globeView + 9);
    uint64_t v34 = v80;
    *(float64x2_t *)(v33 + 8) = v79;
    *(void *)(v33 + 24) = v34;
    ++*((_DWORD *)globeView + 94);
    uint64_t v35 = **(void **)(*((void *)globeView + 107) + 88);
    if (v35)
    {
      LOBYTE(v86.f64[0]) = 7;
      md::MapEngine::setNeedsTick(v35, &v86);
    }
    double v36 = (unsigned __int8 *)self->_globeView;
    int v37 = v36[184];
    uint64_t v38 = *((void *)v36 + 9);
    double v39 = fmax(a8, 0.0);
    if (!v36[184]) {
      double v39 = a8;
    }
    *(double *)(v38 + 40) = v39;
    ++*((_DWORD *)v36 + 94);
    if (v37)
    {
      double v40 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v36);
      double v41 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v36);
      uint64_t v42 = *((void *)v36 + 9);
      int v43 = v36[184];
      *(double *)(v42 + 32) = fmin(fmax(v40, v25), fmax(fmin(*((double *)v36 + 50), 60592301.5), v41));
      if (v43) {
        *(double *)(v42 + 40) = fmax(*(double *)(v42 + 40), 0.0);
      }
    }
    else
    {
      *(double *)(v38 + 32) = v25;
    }
    ++*((_DWORD *)v36 + 94);
    double v44 = self->_globeView;
    uint64_t v45 = v44[9];
    long double v46 = fmod(a7 + 3.14159265, 6.28318531);
    *(long double *)(v45 + 48) = fmod(v46 + 6.28318531, 6.28318531) + -3.14159265;
    ++*((_DWORD *)v44 + 94);
    [(VKCameraController *)self centerScreenPoint];
    Matrix<int, 2, 1> v82 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    float64x2_t v86 = 0uLL;
    uint64_t v87 = 0;
    altitude::GlobeView::getCoordAtScreenPosition((uint64_t)self->_globeView, (int *)&v82, v79.f64, (uint64_t)&v86, 0);
    __asm { FMOV            V2.2D, #-2.0 }
    float64x2_t v79 = vnegq_f64(vmlaq_f64(v86, _Q2, v79));
    double v52 = self->_globeView;
    v52[160] = v32;
    uint64_t v53 = *((void *)v52 + 9);
    float64x2_t v54 = v79;
    *(void *)(v53 + 24) = v80;
    *(float64x2_t *)(v53 + 8) = v54;
    ++*((_DWORD *)v52 + 94);
    uint64_t v55 = **(void **)(*((void *)v52 + 107) + 88);
    if (v55)
    {
      LOBYTE(location[0]) = 7;
      md::MapEngine::setNeedsTick(v55, location);
    }
    altitude::CameraManager::update((altitude::CameraManager *)&self->_cameraManager, (altitude::GlobeView *)self->_globeView, 1);
    [(VKGlobeCameraController *)self _updateIsPitched];
    [(VKGlobeCameraController *)self _updateCanEnter3DMode];
    long double v56 = [(VKCameraController *)self cameraDelegate];
    [v56 mapLayerDidChangeVisibleRegion];

    uint64_t v57 = *(void *)[(VKCameraController *)self runLoopController];
    if (v57)
    {
      LOBYTE(location[0]) = 4;
      md::MapEngine::setNeedsTick(v57, location);
    }
    [(VKCameraController *)self endRegionChange];
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController resumeAnimation];
    self->_cameraManager._tiltLimitPushDownEnabled = 1;
    if (v22) {
      v22[2](v22, 1);
    }
  }
  else
  {
    double v26 = [[VKTimedAnimation alloc] initWithDuration:a9];
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
    uint64_t v29 = *((void *)self->_globeView + 9);
    if (v29)
    {
      float64x2_t v30 = *(float64x2_t *)(v29 + 8);
      uint64_t v87 = *(void *)(v29 + 24);
      float64x2_t v86 = v30;
    }
    else
    {
      float64x2_t v86 = 0uLL;
      uint64_t v87 = 0;
    }
    [(VKCameraController *)self centerScreenPoint];
    double v70 = a7;
    double v71 = v24;
    double v68 = a4;
    double v69 = a8;
    id v84 = 0;
    Matrix<int, 2, 1> v85 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    Matrix<int, 2, 1> v82 = 0;
    v83 = 0;
    altitude::GlobeView::getCoordAtScreenPosition((uint64_t)self->_globeView, (int *)&v85, v86.f64, (uint64_t)&v82, 0);
    double v58 = v25;
    double v59 = (void *)v82;
    double v60 = v83;
    double v67 = v84;
    double v61 = self->_globeView;
    double v62 = (void *)v61[9];
    double v63 = (void *)v62[4];
    double v64 = (void *)v62[5];
    double v65 = (void *)v62[6];
    self->_cameraManager._tiltLimitPushDownEnabled = 0;
    self->_cameraManager._tiltLimitPushDown = 0;
    v79.f64[0] = 0.0;
    *(void *)&v79.f64[1] = &v79;
    uint64_t v80 = 0x2020000000;
    uint64_t v81 = 0;
    if (!a5)
    {
      location[0] = *(id *)&v23;
      location[1] = *(id *)&v71;
      Anchor = altitude::GlobeView::createAnchor((uint64_t)v61, (double *)location);
      *(void *)(*(void *)&v79.f64[1] + 24) = Anchor;
    }
    objc_initWeak(location, self);
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __102__VKGlobeCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke;
    v76[3] = &unk_1E5A943B8;
    objc_copyWeak(v77, location);
    v77[1] = v63;
    v77[2] = *(id *)&v58;
    v77[3] = v64;
    v77[4] = *(id *)&v69;
    v77[5] = v59;
    v77[6] = *(id *)&v23;
    v77[7] = v60;
    v77[8] = *(id *)&v71;
    v76[4] = &v79;
    v77[9] = v67;
    v77[10] = *(id *)&v68;
    v77[11] = v65;
    v77[12] = *(id *)&v70;
    [(VKTimedAnimation *)self->super._regionAnimation setStepHandler:v76];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __102__VKGlobeCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_2;
    v72[3] = &unk_1E5A943E0;
    objc_copyWeak(&v75, location);
    double v73 = v22;
    double v74 = &v79;
    [(VKAnimation *)self->super._regionAnimation setCompletionHandler:v72];
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._regionAnimation->super);

    objc_destroyWeak(&v75);
    objc_destroyWeak(v77);
    objc_destroyWeak(location);
    _Block_object_dispose(&v79, 8);
  }
}

void __102__VKGlobeCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke(uint64_t a1, float a2)
{
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v5 = *(double *)(a1 + 48);
    double v6 = a2;
    double v7 = *(double *)(a1 + 64);
    double v55 = *(double *)(a1 + 72);
    double v56 = *(double *)(a1 + 56) - v5;
    double v8 = *(double *)(a1 + 80);
    long double v9 = fmod(3.14159265 - v8 + *(double *)(a1 + 88), 6.28318531);
    long double v10 = fmod(v9 + 6.28318531, 6.28318531);
    long double v11 = fmod(v8 + 3.14159265 + (v10 + -3.14159265) * a2, 6.28318531);
    double v12 = fmod(v11 + 6.28318531, 6.28318531) + -3.14159265;
    double v13 = *(double *)(a1 + 96);
    long double v14 = fmod(3.14159265 - v13 + *(double *)(a1 + 104), 6.28318531);
    long double v15 = fmod(v14 + 6.28318531, 6.28318531);
    long double v16 = fmod(v13 + 3.14159265 + (v15 + -3.14159265) * a2, 6.28318531);
    double v17 = fmod(v16 + 6.28318531, 6.28318531) + -3.14159265;
    double v18 = *(double *)(a1 + 112);
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (v19) {
      long double v20 = (double *)(v19 + 56);
    }
    else {
      long double v20 = (double *)(a1 + 120);
    }
    double v21 = *v20 - v18;
    v60.f64[0] = v12;
    v60.f64[1] = v17;
    double v61 = v18 + v21 * v6;
    double v22 = *(double *)(a1 + 128);
    long double v23 = fmod(3.14159265 - v22 + *(double *)(a1 + 136), 6.28318531);
    long double v24 = fmod(v23 + 6.28318531, 6.28318531);
    long double v25 = fmod(v22 + 3.14159265 + (v24 + -3.14159265) * v6, 6.28318531);
    long double v26 = fmod(v25 + 6.28318531, 6.28318531);
    uint64_t v27 = WeakRetained[34];
    *(unsigned char *)(v27 + 160) = 0;
    uint64_t v28 = *(void *)(v27 + 72);
    float64x2_t v29 = v60;
    *(double *)(v28 + 24) = v61;
    *(float64x2_t *)(v28 + 8) = v29;
    ++*(_DWORD *)(v27 + 376);
    uint64_t v30 = **(void **)(*(void *)(v27 + 856) + 88);
    if (v30)
    {
      LOBYTE(v57.f64[0]) = 7;
      md::MapEngine::setNeedsTick(v30, &v57);
    }
    double v31 = v5 + v56 * v6;
    double v32 = v7 + (v55 - v7) * v6;
    uint64_t v33 = WeakRetained[34];
    int v34 = *(unsigned __int8 *)(v33 + 184);
    uint64_t v35 = *(void *)(v33 + 72);
    double v36 = fmax(v32, 0.0);
    if (*(unsigned char *)(v33 + 184)) {
      double v32 = v36;
    }
    *(double *)(v35 + 40) = v32;
    ++*(_DWORD *)(v33 + 376);
    if (v34)
    {
      double v37 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v33);
      double v38 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v33);
      uint64_t v39 = *(void *)(v33 + 72);
      int v40 = *(unsigned __int8 *)(v33 + 184);
      *(double *)(v39 + 32) = fmin(fmax(v37, v31), fmax(fmin(*(double *)(v33 + 400), 60592301.5), v38));
      if (v40) {
        *(double *)(v39 + 40) = fmax(*(double *)(v39 + 40), 0.0);
      }
    }
    else
    {
      *(double *)(v35 + 32) = v31;
    }
    ++*(_DWORD *)(v33 + 376);
    uint64_t v41 = WeakRetained[34];
    uint64_t v42 = *(void *)(v41 + 72);
    long double v43 = fmod(v26, 6.28318531);
    *(long double *)(v42 + 48) = fmod(v43 + 6.28318531, 6.28318531) + -3.14159265;
    ++*(_DWORD *)(v41 + 376);
    [WeakRetained centerScreenPoint];
    uint64_t v44 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:");
    uint64_t v58 = 0;
    uint64_t v59 = v44;
    float64x2_t v57 = 0uLL;
    altitude::GlobeView::getCoordAtScreenPosition(WeakRetained[34], (int *)&v59, v60.f64, (uint64_t)&v57, 0);
    __asm { FMOV            V2.2D, #-2.0 }
    float64x2_t v60 = vnegq_f64(vmlaq_f64(v57, _Q2, v60));
    uint64_t v50 = WeakRetained[34];
    *(unsigned char *)(v50 + 160) = 0;
    uint64_t v51 = *(void *)(v50 + 72);
    float64x2_t v52 = v60;
    *(double *)(v51 + 24) = v61;
    *(float64x2_t *)(v51 + 8) = v52;
    ++*(_DWORD *)(v50 + 376);
    uint64_t v53 = **(void **)(*(void *)(v50 + 856) + 88);
    if (v53)
    {
      char v62 = 7;
      md::MapEngine::setNeedsTick(v53, &v62);
    }
    altitude::CameraManager::update((altitude::CameraManager *)(WeakRetained + 35), (altitude::GlobeView *)WeakRetained[34], 1);
    [WeakRetained _updateIsPitched];
    [WeakRetained _updateCanEnter3DMode];
    float64x2_t v54 = [WeakRetained cameraDelegate];
    [v54 mapLayerDidChangeVisibleRegion];
  }
}

void __102__VKGlobeCameraController_moveTo_height_useHeight_zoom_rotation_tilt_duration_timingCurve_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 520) = 1;
    double v8 = WeakRetained;
    [WeakRetained endRegionChange];
    [v8[23] resumeAnimation];
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    double v7 = *(altitude::Anchor **)(v6 + 24);
    if (v7)
    {
      altitude::Anchor::destroy(v7);
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    WeakRetained = v8;
    *(void *)(v6 + 24) = 0;
  }
}

- (void)moveTo:(id)a3 zoom:(double)a4 rotation:(double)a5 tilt:(double)a6 duration:(double)a7 timingCurve:(id)a8 completion:(id)a9
{
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
    Matrix<int, 2, 1> v18 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    double v19 = x + v12;
    *(_WORD *)&self->_cameraManager._panBegin = 1;
    self->_cameraManager._panEnd = 0;
    double v20 = y - v11;
    self->_cameraManager._panAtStartPosition = 0;
    self->_cameraManager._panStartCursor = v18;
    self->_cameraManager._panCurrentCursor = v18;
    self->_cameraManager._panPreviousCursor = v18;
    if (v8)
    {
      double v21 = [[VKTimedAnimation alloc] initWithDuration:a6];
      [(VKTimedAnimation *)v21 setTimingFunction:VKAnimationCurveLinear];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __99__VKGlobeCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke;
      v26[3] = &unk_1E5A94368;
      *(double *)&void v26[5] = v12;
      *(double *)&v26[6] = v11;
      v26[4] = self;
      [(VKTimedAnimation *)v21 setStepHandler:v26];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __99__VKGlobeCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke_2;
      v22[3] = &unk_1E5A94390;
      v22[4] = self;
      double v24 = v19;
      double v25 = v20;
      long double v23 = v14;
      [(VKAnimation *)v21 setCompletionHandler:v22];
      md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &v21->super);
    }
    else
    {
      -[VKScreenCameraController updatePanWithTranslation:](self, "updatePanWithTranslation:", v12, v11);
      -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", v19, v20);
      self->_cameraManager._panEnd = 1;
      [(VKCameraController *)self endRegionChange];
      if (v14) {
LABEL_11:
      }
        v14[2](v14);
    }
  }
}

void __99__VKGlobeCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke(uint64_t a1, float a2)
{
  objc_msgSend(*(id *)(a1 + 32), "updatePanWithTranslation:", vcvtq_f64_f32(vcvt_f32_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 40), a2))));
  id v3 = [*(id *)(a1 + 32) cameraDelegate];
  [v3 mapLayerDidChangeVisibleRegion];
}

uint64_t __99__VKGlobeCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(char **)(a1 + 32);
  id v3 = v2 + 280;
  objc_msgSend(v2, "cursorFromScreenPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3[10] = 1;
  [*(id *)(a1 + 32) endRegionChange];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
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
  double v13 = *(double *)(*((void *)self->_globeView + 9) + 32);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0x3FF0000000000000;
  p_zoomAnimation = &self->super._zoomAnimation;
  zoomAnimation = self->super._zoomAnimation;
  if (zoomAnimation)
  {
    [(VKAnimation *)zoomAnimation stop];
    CGFloat v16 = *p_zoomAnimation;
    *p_zoomAnimation = 0;
  }
  CGFloat v17 = [[VKTimedAnimation alloc] initWithDuration:a5];
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __74__VKGlobeCameraController_zoomToDistance_distance_time_completionHandler___block_invoke;
  v25[3] = &unk_1E5A94340;
  objc_copyWeak(v26, &location);
  *(double *)&v26[1] = a4 / v13;
  v25[4] = v28;
  v26[2] = v12;
  [(VKTimedAnimation *)v17 setStepHandler:v25];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  double v21 = __74__VKGlobeCameraController_zoomToDistance_distance_time_completionHandler___block_invoke_2;
  double v22 = &unk_1E5A99078;
  objc_copyWeak(v24, &location);
  v24[1] = v12;
  id v18 = v11;
  id v23 = v18;
  [(VKAnimation *)v17 setCompletionHandler:&v19];
  objc_storeStrong((id *)&self->super._zoomAnimation, v17);
  *(_WORD *)&self->_cameraManager._zoomBegin = 1;
  self->_cameraManager._zoomEnd = 0;
  self->_cameraManager._zoomCurrentCursor = (Matrix<int, 2, 1>)v12;
  self->_cameraManager._zoomFactor = 1.0;
  self->_cameraManager._zoomRotateToNorth = 1;
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v19, v20, v21, v22);
  md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], *p_zoomAnimation);

  objc_destroyWeak(v24);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

  _Block_object_dispose(v28, 8);
}

void __74__VKGlobeCameraController_zoomToDistance_distance_time_completionHandler___block_invoke(uint64_t a1, float a2)
{
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v5 = (*(double *)(a1 + 48) + -1.0) * a2 + 1.0;
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    double v7 = *(double *)(v6 + 24);
    *(double *)(v6 + 24) = v5;
    WeakRetained[62] = WeakRetained[62] * v5 / v7;
    *((_DWORD *)WeakRetained + 122) = *(_DWORD *)(a1 + 56);
    *((_DWORD *)WeakRetained + 123) = *(_DWORD *)(a1 + 60);
    long double v9 = WeakRetained;
    uint64_t v8 = [WeakRetained cameraDelegate];
    [v8 mapLayerDidChangeVisibleRegion];

    WeakRetained = v9;
  }
}

void __74__VKGlobeCameraController_zoomToDistance_distance_time_completionHandler___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[458] = 1;
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
  v24[0] = 0;
  v24[1] = v24;
  id v24[2] = 0x2020000000;
  v24[3] = 0x3FF0000000000000;
  id v11 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
  zoomAnimation = self->super._zoomAnimation;
  if (zoomAnimation) {
    [(VKAnimation *)zoomAnimation stop];
  }
  double v13 = [[VKTimedAnimation alloc] initWithDuration:0.25];
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__VKGlobeCameraController_tapZoom_levels_completionHandler___block_invoke;
  v21[3] = &unk_1E5A94340;
  objc_copyWeak(v22, &location);
  v22[1] = *(id *)&v10;
  v21[4] = v24;
  v22[2] = v11;
  [(VKTimedAnimation *)v13 setStepHandler:v21];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  CGFloat v17 = __60__VKGlobeCameraController_tapZoom_levels_completionHandler___block_invoke_2;
  id v18 = &unk_1E5A99078;
  objc_copyWeak(v20, &location);
  v20[1] = v11;
  id v14 = v9;
  id v19 = v14;
  [(VKAnimation *)v13 setCompletionHandler:&v15];
  objc_storeStrong((id *)&self->super._zoomAnimation, v13);
  *(_WORD *)&self->_cameraManager._zoomBegin = 1;
  self->_cameraManager._zoomEnd = 0;
  self->_cameraManager._zoomCurrentCursor = (Matrix<int, 2, 1>)v11;
  self->_cameraManager._zoomFactor = 1.0;
  self->_cameraManager._zoomRotateToNorth = 1;
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v15, v16, v17, v18);
  md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], self->super._zoomAnimation);

  objc_destroyWeak(v20);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Block_object_dispose(v24, 8);
}

void __60__VKGlobeCameraController_tapZoom_levels_completionHandler___block_invoke(uint64_t a1, float a2)
{
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v5 = (*(double *)(a1 + 48) + -1.0) * a2 + 1.0;
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    double v7 = *(double *)(v6 + 24);
    *(double *)(v6 + 24) = v5;
    WeakRetained[62] = WeakRetained[62] * v5 / v7;
    *((_DWORD *)WeakRetained + 122) = *(_DWORD *)(a1 + 56);
    *((_DWORD *)WeakRetained + 123) = *(_DWORD *)(a1 + 60);
    id v9 = WeakRetained;
    [WeakRetained _updateIsPitched];
    [v9 _updateCanEnter3DMode];
    uint64_t v8 = [v9 cameraDelegate];
    [v8 mapLayerDidChangeVisibleRegion];

    WeakRetained = v9;
  }
}

void __60__VKGlobeCameraController_tapZoom_levels_completionHandler___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[458] = 1;
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
  long double v10 = *(void **)(*((void *)self->_globeView + 9) + 40);
  if (v6)
  {
    pitchAnimation = self->super._pitchAnimation;
    if (pitchAnimation) {
      [(VKAnimation *)pitchAnimation stop];
    }
    double v12 = [VKTimedAnimation alloc];
    double v13 = 0.3;
    if (v5) {
      double v13 = 0.5;
    }
    id v14 = [(VKTimedAnimation *)v12 initWithDuration:v13];
    uint64_t v15 = self->super._pitchAnimation;
    self->super._pitchAnimation = v14;

    objc_initWeak(&location, self);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    id v20[2] = __54__VKGlobeCameraController_tiltTo_animated_exaggerate___block_invoke;
    v20[3] = &unk_1E5A94318;
    objc_copyWeak(v21, &location);
    v21[1] = v10;
    v21[2] = *(id *)&a3;
    v21[3] = v9;
    [(VKTimedAnimation *)self->super._pitchAnimation setStepHandler:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__VKGlobeCameraController_tiltTo_animated_exaggerate___block_invoke_2;
    v18[3] = &unk_1E5A942F0;
    objc_copyWeak(v19, &location);
    v19[1] = v9;
    [(VKAnimation *)self->super._pitchAnimation setCompletionHandler:v18];
    [(VKTimedAnimation *)self->super._pitchAnimation setTimingFunction:VKAnimationCurveEaseOut];
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController pauseAnimation];
    [(VKCameraController *)self beginRegionChange:1];
    *(_WORD *)&self->_cameraManager._tiltBegin = 1;
    self->_cameraManager._tiltEnd = 0;
    self->_cameraManager._tiltAngle = 0.0;
    self->_cameraManager._tiltCurrentCursor = (Matrix<int, 2, 1>)v9;
    self->_cameraManager._tiltPreviousCursor = (Matrix<int, 2, 1>)v9;
    self->_isPitching = 1;
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._pitchAnimation->super);
    objc_destroyWeak(v19);
    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
  else
  {
    [(VKCameraController *)self beginRegionChange:0];
    *(_WORD *)&self->_cameraManager._tiltBegin = 1;
    self->_cameraManager._tiltEnd = 0;
    self->_cameraManager._tiltAngle = 0.0;
    self->_cameraManager._tiltCurrentCursor = (Matrix<int, 2, 1>)v9;
    self->_cameraManager._tiltPreviousCursor = (Matrix<int, 2, 1>)v9;
    [(VKCameraController *)self centerScreenPoint];
    -[VKGlobeCameraController pitch:translation:](self, "pitch:translation:");
    self->_cameraManager._tiltEnd = 1;
    [(VKGlobeCameraController *)self _updateIsPitched];
    [(VKGlobeCameraController *)self _updateCanEnter3DMode];
    uint64_t v16 = [(VKCameraController *)self cameraDelegate];
    [v16 mapLayerDidChangeVisibleRegion];

    uint64_t v17 = *(void *)[(VKCameraController *)self runLoopController];
    if (v17)
    {
      LOBYTE(location) = 4;
      md::MapEngine::setNeedsTick(v17, &location);
    }
    [(VKCameraController *)self endRegionChange];
  }
}

void __54__VKGlobeCameraController_tiltTo_animated_exaggerate___block_invoke(uint64_t a1, float a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v5 = *(double *)(a1 + 40)
       + (*(double *)(a1 + 48) - *(double *)(a1 + 40)) * a2
       - *(double *)(*(void *)(WeakRetained[34] + 72) + 40);
    *((_DWORD *)WeakRetained + 108) = *(_DWORD *)(a1 + 56);
    *((_DWORD *)WeakRetained + 109) = *(_DWORD *)(a1 + 60);
    *((double *)WeakRetained + 56) = v5 + *((double *)WeakRetained + 56);
    id v7 = WeakRetained;
    [WeakRetained _updateIsPitched];
    BOOL v6 = [v7 cameraDelegate];
    [v6 mapLayerDidChangeVisibleRegion];

    WeakRetained = v7;
  }
}

void __54__VKGlobeCameraController_tiltTo_animated_exaggerate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 402) = 1;
    *((unsigned char *)WeakRetained + 712) = 0;
    [WeakRetained endRegionChange];
    [*((id *)WeakRetained + 23) resumeAnimation];
    [WeakRetained _updateIsPitched];
    [WeakRetained _updateCanEnter3DMode];
  }
}

- (void)rotateTo:(double)a3 animated:(BOOL)a4
{
  if (self->_globeView)
  {
    BOOL v4 = a4;
    id v7 = [(VKCameraController *)self canvas];

    if (v7)
    {
      [(VKCameraController *)self centerScreenPoint];
      uint64_t v8 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
      double v9 = *(double *)(*((void *)self->_globeView + 9) + 48);
      if (v4)
      {
        rotationAnimation = self->super._rotationAnimation;
        if (rotationAnimation)
        {
          [(VKAnimation *)rotationAnimation stop];
          id v11 = self->super._rotationAnimation;
          self->super._rotationAnimation = 0;
        }
        double v12 = [[VKTimedAnimation alloc] initWithDuration:0.3];
        double v13 = self->super._rotationAnimation;
        self->super._rotationAnimation = v12;

        [(VKTimedAnimation *)self->super._rotationAnimation setTimingFunction:VKAnimationCurveEaseInOut];
        objc_initWeak(&location, self);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __45__VKGlobeCameraController_rotateTo_animated___block_invoke;
        v23[3] = &unk_1E5A98570;
        objc_copyWeak(v24, &location);
        v24[1] = *(id *)&v9;
        id v24[2] = *(id *)&a3;
        [(VKTimedAnimation *)self->super._rotationAnimation setStepHandler:v23];
        uint64_t v18 = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        uint64_t v20 = __45__VKGlobeCameraController_rotateTo_animated___block_invoke_2;
        double v21 = &unk_1E5A942F0;
        objc_copyWeak(v22, &location);
        v22[1] = v8;
        [(VKAnimation *)self->super._rotationAnimation setCompletionHandler:&v18];
        -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v18, v19, v20, v21);
        *(_WORD *)&self->_cameraManager._rotateBegin = 1;
        self->_cameraManager._rotateEnd = 0;
        self->_cameraManager._rotateCurrentCursor = (Matrix<int, 2, 1>)v8;
        self->_cameraManager._rotateAngle = 0.0;
        self->_isRotating = 1;
        md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._rotationAnimation->super);
        objc_destroyWeak(v22);
        objc_destroyWeak(v24);
        objc_destroyWeak(&location);
      }
      else
      {
        [(VKCameraController *)self beginRegionChange:0];
        *(_WORD *)&self->_cameraManager._rotateBegin = 1;
        self->_cameraManager._rotateEnd = 0;
        self->_cameraManager._rotateCurrentCursor = (Matrix<int, 2, 1>)v8;
        self->_cameraManager._rotateAngle = 0.0;
        [(VKCameraController *)self centerScreenPoint];
        -[VKGlobeCameraController rotate:atScreenPoint:](self, "rotate:atScreenPoint:", a3 - v9, v14, v15);
        self->_cameraManager._rotateEnd = 1;
        uint64_t v16 = [(VKCameraController *)self cameraDelegate];
        [v16 mapLayerDidChangeVisibleRegion];

        uint64_t v17 = *(void *)[(VKCameraController *)self runLoopController];
        if (v17)
        {
          LOBYTE(location) = 4;
          md::MapEngine::setNeedsTick(v17, &location);
        }
        [(VKCameraController *)self endRegionChange];
      }
    }
  }
}

void __45__VKGlobeCameraController_rotateTo_animated___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v5 = *(double *)(a1 + 40);
    double v6 = *(double *)(a1 + 48);
    double v7 = *(double *)(*(void *)(WeakRetained[34] + 72) + 48);
    id v18 = WeakRetained;
    [WeakRetained centerScreenPoint];
    double v9 = v8;
    double v11 = v10;
    long double v12 = fmod(3.14159265 - v5 + v6, 6.28318531);
    long double v13 = fmod(v12 + 6.28318531, 6.28318531);
    long double v14 = fmod(v5 + 3.14159265 + (v13 + -3.14159265) * a2, 6.28318531);
    long double v15 = fmod(v14 + 6.28318531, 6.28318531);
    long double v16 = fmod(v15 - v7, 6.28318531);
    objc_msgSend(v18, "rotate:atScreenPoint:", (double)(fmod(v16 + 6.28318531, 6.28318531) + -3.14159265), v9, v11);
    uint64_t v17 = [v18 cameraDelegate];
    [v17 mapLayerDidChangeVisibleRegion];

    id WeakRetained = v18;
  }
}

void __45__VKGlobeCameraController_rotateTo_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[355] = 1;
    WeakRetained[713] = 0;
    [WeakRetained endRegionChange];
  }
}

- (BOOL)snapMapIfNecessary:(BOOL)a3
{
  if (self->_globeView)
  {
    BOOL v3 = a3;
    double v5 = [(VKCameraController *)self canvas];

    if (v5)
    {
      uint64_t v6 = *((void *)self->_globeView + 9);
      double v7 = *(double *)(v6 + 40);
      if (v7 < 0.261799388 && v7 > 0.0001) {
        goto LABEL_15;
      }
      if (self->_cameraManager._useTiltLimit)
      {
        double v8 = *(double *)(v6 + 32);
        double v9 = 0.0;
        if (v8 <= 1500000.0)
        {
          double v10 = 1.0;
          double v11 = fmax(v8, 1.0);
          double v9 = 0.680678408 - cos(sqrt(v11 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
          if (self->_cameraManager._tiltLimitMode == 1)
          {
            if (v11 < 20000.0) {
              double v10 = self->_cameraManager._fullZoomTiltLimitFactor
            }
                  + v11 * 0.00005 * (1.0 - self->_cameraManager._fullZoomTiltLimitFactor);
            double v9 = v10 * v9;
          }
          if (self->_cameraManager._tiltLimitTransferInProgress) {
            double v9 = self->_cameraManager._startTiltLimitTilt
          }
               + fmin(fmax(self->_cameraManager._tiltLimitTransferFraction, 0.0), 1.0)
               * (v9 - self->_cameraManager._startTiltLimitTilt);
        }
      }
      else
      {
        double v9 = 1.57079633;
      }
      if (v7 > v9) {
LABEL_15:
      }
        -[VKGlobeCameraController tiltTo:animated:exaggerate:](self, "tiltTo:animated:exaggerate:", v3, 0);
    }
  }
  return 0;
}

- (void)setCenterCoordinate3D:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v27 = a9;
  id v20 = a10;
  [(VKGlobeCameraController *)self _fovAdjustment];
  double v21 = a6 * 0.0174532925;
  double v23 = a4 / (v22 * fmax(cos(v21), 0.00001));
  double v24 = a5 * -0.0174532925;
  if (a8)
  {
    double v25 = 0.0;
    id v26 = v27;
    if (a8 != 2)
    {
      -[VKGlobeCameraController moveToZoomOutZoomInTransition:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveToZoomOutZoomInTransition:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", 1, v27, v20, var0, var1, var2, v23, v24, v21, a7);
      goto LABEL_6;
    }
  }
  else
  {
    double v25 = a7;
    id v26 = v27;
  }
  -[VKGlobeCameraController moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", 1, v26, v20, var0, var1, var2, v23, v24, v21, v25);
LABEL_6:
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v23 = a9;
  id v19 = a10;
  [(VKGlobeCameraController *)self _fovAdjustment];
  double v20 = a6 * 0.0174532925;
  double v22 = a4 / (v21 * fmax(cos(v20), 0.00001));
  if (!a8) {
    goto LABEL_4;
  }
  if (a8 == 2)
  {
    a7 = 0.0;
LABEL_4:
    -[VKGlobeCameraController moveTo:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveTo:zoom:rotation:tilt:duration:timingCurve:completion:", v23, v19, var0, var1, v22, a5 * -0.0174532925, v20, a7);
    goto LABEL_6;
  }
  -[VKGlobeCameraController moveToZoomOutZoomInTransition:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:](self, "moveToZoomOutZoomInTransition:height:useHeight:zoom:rotation:tilt:duration:timingCurve:completion:", 0, v23, v19, var0, var1, 0.0, v22, a5 * -0.0174532925, v20, a7);
LABEL_6:
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
    -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
    self->_cameraManager._zoomEnd = 1;
    [(VKCameraController *)self endRegionChange];
    [(VKGlobeCameraController *)self snapMapIfNecessary:1];
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
      Matrix<int, 2, 1> v11 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:");
      self->_cameraManager._zoomFactor = self->_cameraManager._zoomFactor * (a4 * 0.7 / a5 + 0.3);
      self->_cameraManager._zoomCurrentCursor = v11;
      self->super._userChangedZoomSinceLastProgrammaticRegionChange = 1;
      [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setHasUserSpecifiedZoomLevel:1];
      long double v12 = [(VKCameraController *)self cameraDelegate];
      [v12 mapLayerDidChangeVisibleRegion];

      uint64_t v13 = *(void *)[(VKCameraController *)self runLoopController];
      if (v13)
      {
        char v14 = 4;
        md::MapEngine::setNeedsTick(v13, &v14);
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
  Matrix<int, 2, 1> v10 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", v8, v9);
  *(_WORD *)&self->_cameraManager._zoomBegin = 1;
  self->_cameraManager._zoomEnd = 0;
  self->_cameraManager._zoomCurrentCursor = v10;
  self->_cameraManager._zoomFactor = 1.0;
  self->_cameraManager._zoomRotateToNorth = 0;
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
  v15[2] = __65__VKGlobeCameraController_zoom_withFocusPoint_completionHandler___block_invoke;
  v15[3] = &unk_1E5A942C8;
  id v14 = v9;
  id v16 = v14;
  -[VKGlobeCameraController tapZoom:levels:completionHandler:](self, "tapZoom:levels:completionHandler:", v15, v12, v13, a3);
}

uint64_t __65__VKGlobeCameraController_zoom_withFocusPoint_completionHandler___block_invoke(uint64_t a1)
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
  if (![(VKCameraController *)self isPitchEnabled]) {
    return;
  }
  self->_isRotating = 0;
  self->super._isPitchIncreasing = a4 < 0.0;
  if (!self->_isPitching)
  {
    Matrix<int, 2, 1> v8 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
    *(_WORD *)&self->_cameraManager._tiltBegin = 1;
    self->_cameraManager._tiltEnd = 0;
    self->_cameraManager._tiltAngle = 0.0;
    self->_cameraManager._tiltCurrentCursor = v8;
    self->_cameraManager._tiltPreviousCursor = v8;
    self->_isPitching = 1;
  }
  if (self->_cameraManager._useTiltLimit)
  {
    double v9 = *(double *)(*((void *)self->_globeView + 9) + 32);
    double v10 = 0.0;
    if (v9 <= 1500000.0)
    {
      double v11 = 1.0;
      double v12 = fmax(v9, 1.0);
      double v10 = 0.680678408 - cos(sqrt(v12 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
      if (self->_cameraManager._tiltLimitMode == 1)
      {
        if (v12 < 20000.0) {
          double v11 = self->_cameraManager._fullZoomTiltLimitFactor
        }
              + v12 * 0.00005 * (1.0 - self->_cameraManager._fullZoomTiltLimitFactor);
        double v10 = v11 * v10;
      }
      if (self->_cameraManager._tiltLimitTransferInProgress) {
        double v10 = self->_cameraManager._startTiltLimitTilt
      }
            + fmin(fmax(self->_cameraManager._tiltLimitTransferFraction, 0.0), 1.0)
            * (v10 - self->_cameraManager._startTiltLimitTilt);
    }
  }
  else
  {
    double v10 = 1.57079633;
  }
  double v13 = self->_beganDoublePanPitch - a4;
  double v14 = fmax(v10, 0.0);
  if (v14 < v13)
  {
    double v15 = 0.0698131701 / ((v14 - v13) * 7.87816968 + -1.0);
    double v16 = v14 + 0.0698131701;
LABEL_18:
    double v13 = v15 + v16;
    goto LABEL_19;
  }
  if (v13 < 0.0)
  {
    double v15 = 0.0698131701 / (v13 * -7.87816968 + 1.0);
    double v16 = -0.0698131701;
    goto LABEL_18;
  }
LABEL_19:
  double v17 = fmin(fmax(v13, 0.0), v10 + 0.0698131701);
  Matrix<int, 2, 1> v18 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
  double v19 = v17 - self->_currentDoublePanPitch;
  self->_cameraManager._tiltCurrentCursor = v18;
  self->_cameraManager._tiltAngle = v19 + self->_cameraManager._tiltAngle;
  self->_currentDoublePanPitch = v17;
  [(VKGlobeCameraController *)self _updateIsPitched];
  [(VKGlobeCameraController *)self _updateCanEnter3DMode];
}

- (void)rotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  self->_isPitching = 0;
  if (!self->_isRotating)
  {
    p_cameraManager = &self->_cameraManager;
    Matrix<int, 2, 1> v9 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", a4.x, a4.y);
    *(_WORD *)&p_cameraManager->_rotateBegin = 1;
    p_cameraManager->_rotateEnd = 0;
    p_cameraManager->_rotateCurrentCursor = v9;
    p_cameraManager->_rotateAngle = 0.0;
    self->_isRotating = 1;
  }
  Matrix<int, 2, 1> v10 = -[VKCameraController cursorFromScreenPoint:](self, "cursorFromScreenPoint:", x, y);
  self->_cameraManager._rotateAngle = self->_cameraManager._rotateAngle + a3;
  self->_cameraManager._rotateCurrentCursor = v10;
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  ptr = a3.__ptr_;
  double v5 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v14 = *(void *)a3.__ptr_;
  double v15 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v13.receiver = self;
  v13.super_class = (Class)VKGlobeCameraController;
  -[VKScreenCameraController setCamera:](&v13, sel_setCamera_, &v14, a3.__cntrl_);
  double v6 = v15;
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  uint64_t v7 = *(void *)ptr;
  if (*(void *)ptr)
  {
    globeView = self->_globeView;
    uint64_t v9 = globeView[9];
    long long v10 = *(_OWORD *)(v7 + 24);
    long long v11 = *(_OWORD *)(v7 + 40);
    uint64_t v12 = *(void *)(v7 + 56);
    *(_OWORD *)(v9 + 8) = *(_OWORD *)(v7 + 8);
    *(void *)(v9 + 56) = v12;
    *(_OWORD *)(v9 + 40) = v11;
    *(_OWORD *)(v9 + 24) = v10;
    ++*((_DWORD *)globeView + 94);
  }
}

- (int64_t)tileSize
{
  return 256;
}

- (void)setGlobeView:(void *)a3
{
  self->_globeView = a3;
  -[VKAnnotationTrackingCameraController setGlobeView:](self->super._annotationTrackingCameraController, "setGlobeView:");
  [(VKGestureCameraBehavior *)self->super._gestureCameraControllerBehavior setGlobeView:a3];
  if (self->_globeView)
  {
    self->_wasPitched = [(VKGlobeCameraController *)self isPitched];
    self->_couldEnter3DMode = [(VKGlobeCameraController *)self canEnter3DMode];
  }
}

- (VKGlobeCameraController)initWithTaskContext:(shared_ptr<md:(void *)a4 :(AnimationRunner *)a5 TaskContext>)a3 mapDataAccess:(RunLoopController *)a6 animationRunner:(id)a7 runLoopController:cameraDelegate:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  uint64_t v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)VKGlobeCameraController;
  objc_super v13 = [(VKScreenCameraController *)&v22 initWithMapDataAccess:cntrl animationRunner:a4 runLoopController:a5 cameraDelegate:v12];
  uint64_t v14 = v13;
  double v15 = v13;
  if (v13)
  {
    double v17 = *(TaskContext **)ptr;
    uint64_t v16 = *((void *)ptr + 1);
    if (v16) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 8), 1uLL, memory_order_relaxed);
    }
    Matrix<int, 2, 1> v18 = (std::__shared_weak_count *)v13->_taskContext.__cntrl_;
    v13->_taskContext.__ptr_ = v17;
    v13->_taskContext.__cntrl_ = (__shared_weak_count *)v16;
    if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
    v15->_currentDoublePanPitch = 0.0;
    v15->_globeView = 0;
    v15->_isPitching = 0;
    v15->_isRotating = 0;
    [(VKCameraController *)v15 setIsPitchEnabled:1];
    double v19 = [(VKGestureCameraBehavior *)[VKGlobeGestureCameraController alloc] initWithCameraController:v15];
    gestureCameraControllerBehavior = v15->super._gestureCameraControllerBehavior;
    v15->super._gestureCameraControllerBehavior = &v19->super;

    [(VKGestureCameraBehavior *)v15->super._gestureCameraControllerBehavior setCameraManager:&v14->_cameraManager];
    v15->_minZoomLevel = 1.0;
    v15->_maxZoomLevel = 21.0;
    v15->_tourShouldResumeWhenDoneGesturing = 1;
  }

  return v15;
}

@end