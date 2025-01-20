@interface VKMapCameraController
- ($F24F406B2B787EFB06265DBA3D28CBD5)_mercatorCenterCoordinateForMapRegion:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate;
- (BOOL)canEnter3DMode;
- (BOOL)canRotate;
- (BOOL)isFlyoverTourStarted;
- (BOOL)isFullyPitched;
- (BOOL)isPitched;
- (BOOL)snapMapIfNecessary:(BOOL)a3;
- (BOOL)tourShouldResumeWhenDoneGesturing;
- (Matrix<double,)positionClampedToCameraRestriction:()Matrix<double;
- (VKMapCameraController)initWithMapDataAccess:(void *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6;
- (double)altitude;
- (double)currentZoomLevel;
- (double)distanceFromCenterCoordinate;
- (double)durationToAnimateToMapRegion:(id)a3;
- (double)heading;
- (double)maxPitch;
- (double)maximumZoomLevel;
- (double)minPitch;
- (double)minimumZoomLevel;
- (double)pitch;
- (double)presentationYaw;
- (double)topDownMinimumZoomLevel;
- (double)yaw;
- (double)zoomLevelAdjustmentForTileSize:(int64_t)a3;
- (float)currentDisplayZoomLevel;
- (float)currentMaximumNormalizedZoomLevel;
- (float)currentMinimumNormalizedZoomLevel;
- (float)currentNormalizedZoomLevel;
- (float)currentStyleZoomLevel;
- (float)currentTopDownMinimumNormalizedZoomLevel;
- (float)flyoverTourAnimation:animateToStart:labelChanged:stateChange:;
- (float)idealPitchForNormalizedZoomLevel:(float)a3;
- (float)maxPitchForNormalizedZoomLevel:(float)a3;
- (float)maximumNormalizedZoomLevel;
- (float)minimumNormalizedZoomLevel;
- (float)minimumPitchForNormalizedZoomLevel:(float)a3;
- (float)normalizedZoomLevelAdjustmentForTileSize:(int64_t)a3;
- (id).cxx_construct;
- (id)createFlyoverPreTourAnimation:(id)a3 duration:(double)a4;
- (id)createMoveToZoomOutZoomInFrameFunction:()CameraFrame<geo:(double> *)a3 :()CameraFrame<geo:(double> *)a4 :Radians Radians toLatLon:;
- (id)flyoverTourAnimation:animateToStart:labelChanged:stateChange:;
- (id)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:;
- (int64_t)tileSize;
- (uint64_t)flyoverTourAnimation:animateToStart:labelChanged:stateChange:;
- (uint64_t)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:;
- (void)_animateToPosition:()Matrix<double pitch:()3 yaw:(1>)a3 duration:(double)a4 timingCurve:(double)a5 completion:(double)a6;
- (void)_animateToPosition:()Matrix<double pitch:()3 yaw:(1>)a3 duration:(double)a4 timingCurve:(double)a5 forceDestination:(double)a6 completion:(id)a7;
- (void)_jumpToCenterPoint:()Matrix<double pitchRadians:()3 yawRadians:(1>)a3;
- (void)animateRegionWithDuration:(double)a3 timingFunction:(id)a4 stepHandler:(id)a5 completionHandler:(id)a6;
- (void)animateToTourPosition:(float)a3 timingFunction:(id)a4 animationStyle:(int64_t)a5 completion:(id)a6;
- (void)canvasDidLayout;
- (void)clampPitch:(double *)a3 yaw:(double *)a4 atTargetPositionZ:(double)a5;
- (void)clampZoomLevelIfNecessaryAnimated:(BOOL)a3;
- (void)dealloc;
- (void)enter3DMode;
- (void)exit3DMode;
- (void)flyoverTourAnimation:(id)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6;
- (void)flyoverTourAnimation:animateToStart:labelChanged:stateChange:;
- (void)interruptFlyoverTourAnimation;
- (void)mapEngine;
- (void)panWithOffset:(CGPoint)a3 relativeToScreenPoint:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6 completionHandler:(id)a7;
- (void)pauseFlyoverTourAnimation;
- (void)prepareFlyoverAnimation:(id)a3 completion:(id)a4;
- (void)resumeFlyoverTourAnimation;
- (void)rotateToPitch:(double)a3 withPoint:(const void *)a4 preserveAltitude:(BOOL)a5 animated:(BOOL)a6 exaggerate:(BOOL)a7 maxPitch:(double)a8;
- (void)rotateToYaw:(double)a3 withPoint:(const void *)a4 animated:(BOOL)a5;
- (void)setCamera:(shared_ptr<gdc::Camera>)a3;
- (void)setCenterCoordinate3D:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10;
- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10;
- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 forceDestination:(BOOL)a10 completion:(id)a11;
- (void)setCenterCoordinateDistanceRange:(id *)a3 duration:(double)a4 timingFunction:(id)a5;
- (void)setGesturing:(BOOL)a3;
- (void)setMapEngine:(void *)a3;
- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 timingCurve:(id)a7 completion:(id)a8;
- (void)setRegionRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5;
- (void)setTourShouldResumeWhenDoneGesturing:(BOOL)a3;
- (void)setYaw:(double)a3 animated:(BOOL)a4;
- (void)startFlyoverTourAnimation:(unint64_t)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6;
- (void)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:;
- (void)startTrackingAnnotation:(id)a3 trackHeading:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7;
- (void)stopFlyoverTourAnimation;
- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5;
- (void)updateCameraToPositionOrientationLimits;
- (void)updateCameraZBounds;
- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4;
- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5;
- (void)zoom:(double)a3 withPoint:()Matrix<double completionHandler:()3;
- (void)zoomToLevel:(double)a3 withFocusPoint:(CGPoint)a4;
- (void)zoomToLevel:(double)a3 withPoint:()Matrix<double;
@end

@implementation VKMapCameraController

- (float)maxPitchForNormalizedZoomLevel:(float)a3
{
  v5 = +[VKDebugSettings sharedSettings];
  char v6 = [v5 relaxTiltLimits];

  if (v6) {
    return 1.4835;
  }
  mapEngine = self->_mapEngine;
  float result = 0.0;
  if (mapEngine)
  {
    uint64_t v9 = mapEngine[149];
    if (v9)
    {
      return pitchForZ((void *)(v9 + 408), a3);
    }
  }
  return result;
}

- (BOOL)canRotate
{
  [(VKMapCameraController *)self currentStyleZoomLevel];
  return v2 > 6.0;
}

- (float)currentStyleZoomLevel
{
  [(VKMapCameraController *)self currentNormalizedZoomLevel];
  float v4 = v3;
  uint64_t v5 = [(VKMapCameraController *)self tileSize];
  if (v5)
  {
    if (v5 < 513)
    {
      int v6 = 0;
      uint64_t i = 512;
    }
    else
    {
      int v6 = 0;
      for (uint64_t i = 512; i < v5; i *= 2)
        ++v6;
    }
    while (i > v5)
    {
      --v6;
      v5 *= 2;
    }
  }
  else
  {
    int v6 = 0;
  }
  return v4 + (float)v6;
}

- (double)maximumZoomLevel
{
  [(VKMapCameraController *)self currentMaximumNormalizedZoomLevel];
  return v2;
}

- (float)currentMaximumNormalizedZoomLevel
{
  [(VKCameraController *)self camera];
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v6->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v6);
    if (v5) {
      goto LABEL_4;
    }
    return 25.0;
  }
  if (!v5) {
    return 25.0;
  }
LABEL_4:
  [(VKCameraController *)self camera];
  float v3 = floorf(*(float *)(v5 + 80) * 1000.0);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v6->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v3 * 0.001;
}

- (double)topDownMinimumZoomLevel
{
  [(VKMapCameraController *)self currentTopDownMinimumNormalizedZoomLevel];
  return v2;
}

- (float)currentTopDownMinimumNormalizedZoomLevel
{
  [(VKCameraController *)self camera];
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v6->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v6);
    if (v5) {
      goto LABEL_4;
    }
    return 1.0;
  }
  if (!v5) {
    return 1.0;
  }
LABEL_4:
  [(VKCameraController *)self camera];
  float v3 = ceilf(*(float *)(v5 + 88) * 1000.0);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v6->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v3 * 0.001;
}

- (BOOL)canEnter3DMode
{
  [(VKMapCameraController *)self updateCameraZBounds];
  [(VKMapCameraController *)self currentNormalizedZoomLevel];
  int v4 = v3;
  -[VKMapCameraController minimumPitchForNormalizedZoomLevel:](self, "minimumPitchForNormalizedZoomLevel:");
  float v6 = v5;
  LODWORD(v7) = v4;
  [(VKMapCameraController *)self maxPitchForNormalizedZoomLevel:v7];
  return v8 > v6;
}

- (double)zoomLevelAdjustmentForTileSize:(int64_t)a3
{
  [(VKMapCameraController *)self normalizedZoomLevelAdjustmentForTileSize:a3];
  return v3;
}

- (float)normalizedZoomLevelAdjustmentForTileSize:(int64_t)a3
{
  int64_t v4 = [(VKMapCameraController *)self tileSize];
  int v5 = 0;
  if (a3 && v4)
  {
    if (v4 <= a3)
    {
      int v5 = 0;
    }
    else
    {
      int v5 = 0;
      do
      {
        ++v5;
        a3 *= 2;
      }
      while (a3 < v4);
    }
    while (a3 > v4)
    {
      --v5;
      v4 *= 2;
    }
  }
  return (float)v5;
}

- (double)currentZoomLevel
{
  [(VKMapCameraController *)self currentNormalizedZoomLevel];
  return v2;
}

- (float)currentNormalizedZoomLevel
{
  [(VKMapCameraController *)self currentDisplayZoomLevel];
  float v4 = v3;
  int v5 = self;
  float v6 = [(VKCameraController *)v5 canvas];
  [v6 size];
  double v8 = v7;

  double v9 = 0.0;
  if (v8 > 0.0)
  {
    v10 = [(VKCameraController *)v5 canvas];
    [v10 size];
    double v9 = log2(v11 / (double)[(VKMapCameraController *)v5 tileSize]);
  }
  return v9 + v4;
}

- (void)updateCameraZBounds
{
  [(VKCameraController *)self camera];
  if ((void)v190)
  {
    float v3 = [(VKCameraController *)self vkCamera];
    BOOL v4 = v3 == 0;

    int v5 = (std::__shared_weak_count *)*((void *)&v190 + 1);
    if (!*((void *)&v190 + 1)) {
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v4 = 1;
    int v5 = (std::__shared_weak_count *)*((void *)&v190 + 1);
    if (!*((void *)&v190 + 1)) {
      goto LABEL_6;
    }
  }
  if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
    if (v4) {
      return;
    }
    goto LABEL_7;
  }
LABEL_6:
  if (v4) {
    return;
  }
LABEL_7:
  float v6 = [(VKCameraController *)self vkCamera];
  uint64_t v7 = [v6 position];
  double v8 = *(double *)v7;
  double v9 = *(double *)(v7 + 8);
  double v10 = *(double *)(v7 + 16);

  double v11 = [(VKCameraController *)self vkCamera];
  [v11 forwardVector];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  v18 = [(VKCameraController *)self vkCamera];
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "groundPointFromScreenPoint:", 0.5, 0.5);
  }
  else
  {
    long long v190 = 0u;
    long long v191 = 0u;
  }

  if (!(_BYTE)v190) {
    return;
  }
  double v177 = v17;
  double v20 = v15;
  double v21 = v13;
  double v22 = v8;
  double v23 = *((double *)&v191 + 1);
  id v24 = [(VKCameraController *)self vkCamera];
  [v24 widthOfViewAtDepth:(*((double *)&v190 + 1) - v22) * v21 + (*(double *)&v191 - v9) * v20 + (*((double *)&v191 + 1) - v10) * v177];
  double v26 = 0.0;
  if (v25 > 0.0) {
    double v26 = -log2(v25);
  }

  v27 = self;
  v28 = [(VKCameraController *)v27 canvas];
  [v28 size];
  double v30 = v29;

  double v31 = 0.0;
  BOOL v32 = v30 <= 0.0;
  double v33 = 0.0;
  if (!v32)
  {
    v34 = [(VKCameraController *)v27 canvas];
    [v34 size];
    double v33 = log2(v35 / (double)[(VKMapCameraController *)v27 tileSize]);
  }
  float v36 = v26;
  float v37 = v33 + v36;

  mapEngine = v27->_mapEngine;
  if (mapEngine && (uint64_t v40 = mapEngine[149]) != 0 && *(unsigned char *)(v40 + 528))
  {
    [(VKCameraController *)v27 camera];
    float v198 = v37;
    uint64_t v41 = *(void *)(v40 + 520);
    if (!v41)
    {
      std::__throw_bad_function_call[abi:nn180100]();
      __break(1u);
      return;
    }
    (*(void (**)(double *__return_ptr))(*(void *)v41 + 48))(&v201);
    double v31 = v201;
    double v23 = v202;
    int v42 = v203;
    v43 = v205;
    if (v205 && !atomic_fetch_add(&v205->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
  else
  {
    int v42 = 0;
  }
  *(float *)&double v38 = v37;
  [(VKMapCameraController *)v27 maxPitchForNormalizedZoomLevel:v38];
  double v45 = v44;
  double v46 = fmin(v31, v45);
  if (v42) {
    double v47 = v46;
  }
  else {
    double v47 = v45;
  }
  *(float *)&double v45 = v37;
  [(VKMapCameraController *)v27 minimumPitchForNormalizedZoomLevel:v45];
  float v49 = v48;
  v50 = [(VKCameraController *)v27 vkCamera];
  [v50 maxPitch];
  double v52 = v51;

  v53 = [(VKCameraController *)v27 vkCamera];
  [v53 setMaxPitch:v47];
  double v54 = v49;

  if (v47 > v54 == v52 <= v54)
  {
    v55 = [(VKCameraController *)v27 cameraDelegate];
    [v55 mapLayerCanEnter3DModeDidChange:v47 > v54];
  }
  [(VKMapCameraController *)v27 minimumNormalizedZoomLevel];
  float v57 = v56;
  v58 = v27;
  v59 = [(VKCameraController *)v58 canvas];
  float v178 = v57;
  [v59 size];
  double v61 = v60;

  double v62 = 0.0;
  if (v61 > 0.0)
  {
    uint64_t v63 = [(VKMapCameraController *)v58 tileSize];
    v64 = [(VKCameraController *)v58 canvas];
    [v64 size];
    double v62 = log2((double)v63 / v65);
  }
  [(VKMapCameraController *)v58 maximumNormalizedZoomLevel];
  float v67 = v66;
  v68 = v58;
  v69 = [(VKCameraController *)v68 canvas];
  [v69 size];
  double v71 = v70;

  double v72 = 0.0;
  if (v71 > 0.0)
  {
    uint64_t v73 = [(VKMapCameraController *)v68 tileSize];
    v74 = [(VKCameraController *)v68 canvas];
    [v74 size];
    double v72 = log2((double)v73 / v75);
  }
  float v76 = v72 + v67;

  double v77 = v76;
  double v78 = fmin(v23, v76);
  if (v42) {
    double v79 = v78;
  }
  else {
    double v79 = v76;
  }
  v80 = v27->_mapEngine;
  if (v80)
  {
    uint64_t v81 = *((void *)v80 + 112);
    if (v81)
    {
      uint64_t v82 = *(void *)(v81 + 272);
      if (v82)
      {
        if (*(unsigned char *)(v82 + 344))
        {
          v83 = v68;
          v84 = [(VKCameraController *)v83 canvas];
          [v84 size];
          double v86 = v85;

          double v87 = 0.0;
          if (v86 > 0.0)
          {
            uint64_t v88 = [(VKMapCameraController *)v83 tileSize];
            v89 = [(VKCameraController *)v83 canvas];
            [v89 size];
            double v87 = log2((double)v88 / v90);
          }
          float v91 = v87 + 25.0;
          double v79 = v91;
          v80 = v27->_mapEngine;
        }
      }
    }
    v92 = (int8x8_t *)*((void *)v80 + 140);
    int8x8_t v93 = v92[2];
    if (v93)
    {
      uint8x8_t v94 = (uint8x8_t)vcnt_s8(v93);
      v94.i16[0] = vaddlv_u8(v94);
      if (v94.u32[0] > 1uLL)
      {
        unint64_t v95 = 0xEC9B77B4222D22FFLL;
        if (*(void *)&v93 <= 0xEC9B77B4222D22FFLL) {
          unint64_t v95 = 0xEC9B77B4222D22FFLL % *(void *)&v93;
        }
      }
      else
      {
        unint64_t v95 = (*(void *)&v93 - 1) & 0xEC9B77B4222D22FFLL;
      }
      v96 = *(void **)(*(void *)&v92[1] + 8 * v95);
      if (v96)
      {
        v97 = (void *)*v96;
        if (v97)
        {
          if (v94.u32[0] < 2uLL)
          {
            uint64_t v98 = *(void *)&v93 - 1;
            while (1)
            {
              uint64_t v100 = v97[1];
              if (v100 == 0xEC9B77B4222D22FFLL)
              {
                if (v97[2] == 0xEC9B77B4222D22FFLL) {
                  goto LABEL_65;
                }
              }
              else if ((v100 & v98) != v95)
              {
                goto LABEL_71;
              }
              v97 = (void *)*v97;
              if (!v97) {
                goto LABEL_71;
              }
            }
          }
          do
          {
            unint64_t v99 = v97[1];
            if (v99 == 0xEC9B77B4222D22FFLL)
            {
              if (v97[2] == 0xEC9B77B4222D22FFLL)
              {
LABEL_65:
                uint64_t v101 = v97[5];
                if (v101 && *(unsigned char *)(v101 + 56) && *(void *)(v101 + 568))
                {
                  double v102 = *(double *)(v101 + 584);
                  v103 = v68;
                  v104 = [(VKCameraController *)v103 canvas];
                  [v104 size];
                  double v106 = v105;

                  double v107 = 0.0;
                  if (v106 > 0.0)
                  {
                    uint64_t v108 = [(VKMapCameraController *)v103 tileSize];
                    v109 = [(VKCameraController *)v103 canvas];
                    [v109 size];
                    double v107 = log2((double)v108 / v110);
                  }
                  float v111 = fmin(fmax(v102 * 1048576.0 + -0.5, 0.0), 1.0);

                  float v112 = v107 + 23.0;
                  float v113 = 1.0 - cos(v111 * 3.14159265);
                  double v79 = v112 + (v77 - v112) * (float)(v113 * 0.5);
                }
                break;
              }
            }
            else
            {
              if (v99 >= *(void *)&v93) {
                v99 %= *(void *)&v93;
              }
              if (v99 != v95) {
                break;
              }
            }
            v97 = (void *)*v97;
          }
          while (v97);
        }
      }
    }
  }
LABEL_71:
  LOBYTE(v201) = 0;
  unsigned __int8 v203 = 0;
  v114 = [(VKCameraController *)v68 vkCamera];
  v115 = v114;
  if (v114)
  {
    [v114 minDistanceToGroundRestriction];
    LOBYTE(v201) = 1;
    double v202 = *((double *)&v190 + 1);
    LOBYTE(v190) = 0;
    char v116 = 0;
  }
  else
  {
    long long v190 = 0uLL;
    char v116 = 1;
  }

  v117 = [(VKCameraController *)v68 vkCamera];
  v118 = v117;
  if (v117)
  {
    [v117 maxDistanceToGroundRestriction];
    if ((_BYTE)v190)
    {
      unsigned __int8 v203 = 1;
      uint64_t v204 = *((void *)&v190 + 1);
      LOBYTE(v190) = 0;
    }

    if (v116) {
      goto LABEL_83;
    }
    goto LABEL_80;
  }
  long long v190 = 0uLL;

  if ((v116 & 1) == 0)
  {
LABEL_80:
    v119 = v68;
    v120 = [(VKCameraController *)v119 canvas];
    [v120 size];
    double v122 = v121;

    double v123 = 0.0;
    if (v122 > 0.0)
    {
      uint64_t v124 = [(VKMapCameraController *)v119 tileSize];
      v125 = [(VKCameraController *)v119 canvas];
      [v125 size];
      double v123 = log2((double)v124 / v126);
    }
    float v127 = v123 + 25.0;

    double v79 = fmax(v79, v127);
  }
LABEL_83:
  uint64_t v128 = [(VKMapCameraController *)v68 tileSize];
  v129 = [(VKCameraController *)v68 canvas];
  [v129 size];
  float v131 = v62 + v178;
  double v199 = (double)v128;
  double v200 = v130;
  float v132 = 0.0;
  if (v130 > 0.0)
  {
    float v133 = v130;
    float v134 = (float)v128;
    float v132 = log2f(v133 / v134);
  }
  float v135 = fminf(fmaxf(v132 + v131, 1.0), 25.0);
  float v198 = v135;

  uint64_t v136 = [(VKMapCameraController *)v68 tileSize];
  v137 = [(VKCameraController *)v68 canvas];
  [v137 size];
  double v196 = (double)v136;
  double v197 = v138;
  float v140 = 0.0;
  if (v138 > 0.0)
  {
    float v141 = v138;
    float v142 = (float)v136;
    float v140 = log2f(v141 / v142);
  }
  float v139 = v79;
  float v195 = fminf(fmaxf(v140 + v139, 1.0), 25.0);

  [(VKCameraController *)v68 camera];
  uint64_t v143 = v188;
  [(VKCameraController *)v68 camera];
  double v145 = v185[46];
  double v144 = v185[47];
  if (v144 >= v145)
  {
    double v151 = v185[57];
  }
  else
  {
    double v146 = v144 * v145;
    double v147 = v144 / v145;
    if (v146 <= 0.0) {
      double v148 = 1.0;
    }
    else {
      double v148 = v147;
    }
    long double v149 = tan(v185[57] * 0.5);
    long double v150 = atan(v148 * v149);
    double v151 = v150 + v150;
  }
  double v187 = v151;
  [(VKCameraController *)v68 camera];
  double v152 = v182[46];
  double v153 = v182[47];
  if (v152 >= v153)
  {
    double v159 = v182[57];
  }
  else
  {
    double v154 = v153 * v152;
    double v155 = v152 / v153;
    if (v154 <= 0.0) {
      double v156 = 1.0;
    }
    else {
      double v156 = v155;
    }
    long double v157 = tan(v182[57] * 0.5);
    long double v158 = atan(v156 * v157);
    double v159 = v158 + v158;
  }
  double v184 = v159;
  [(VKCameraController *)v68 camera];
  uint64_t v160 = v180[1];
  *(double *)v180 = v47;
  *(float *)&double v161 = v135;
  [(VKMapCameraController *)v68 maxPitchForNormalizedZoomLevel:v161];
  double v179 = v162;
  gdc::CameraLimits::CameraLimits((uint64_t)&v190, (double *)(v143 + 8), &v187, &v184, (long double *)(v160 + 40), v180, &v179, (uint64_t)&v198, v54, (uint64_t)&v195, (uint64_t)&v201);
  v163 = v181;
  if (v181 && !atomic_fetch_add(&v181->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v163->__on_zero_shared)(v163);
    std::__shared_weak_count::__release_weak(v163);
  }
  v164 = v183;
  if (v183 && !atomic_fetch_add(&v183->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v164->__on_zero_shared)(v164);
    std::__shared_weak_count::__release_weak(v164);
  }
  v165 = v186;
  if (v186 && !atomic_fetch_add(&v186->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v165->__on_zero_shared)(v165);
    std::__shared_weak_count::__release_weak(v165);
  }
  v166 = v189;
  if (v189 && !atomic_fetch_add(&v189->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v166->__on_zero_shared)(v166);
    std::__shared_weak_count::__release_weak(v166);
  }
  double v167 = *(double *)&v193;
  v168 = [(VKCameraController *)v68 vkCamera];
  [v168 setMinHeight:v167];

  double v169 = *((double *)&v193 + 1);
  v170 = [(VKCameraController *)v68 vkCamera];
  [v170 setMaxHeight:v169];

  double v171 = v194;
  v172 = [(VKCameraController *)v68 vkCamera];
  [v172 setMaxHeightNoPitch:v171];

  [(VKCameraController *)v68 camera];
  long long v173 = v193;
  uint64_t v174 = v188;
  v175 = v189;
  *(_OWORD *)(v188 + 96) = v192;
  *(_OWORD *)(v174 + 112) = v173;
  *(double *)(v174 + 128) = v194;
  long long v176 = v191;
  *(_OWORD *)(v174 + 64) = v190;
  *(_OWORD *)(v174 + 80) = v176;
  if (v175)
  {
    if (!atomic_fetch_add(&v175->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v175->__on_zero_shared)(v175);
      std::__shared_weak_count::__release_weak(v175);
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

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  [(VKCameraController *)self centerScreenPoint];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  uint64_t v7 = [(VKCameraController *)self vkCamera];
  double v9 = v7;
  if (v7) {
    [v7 cameraState];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  v18.x = v4;
  v18.y = v6;
  VKCameraMakeGroundPoint(&v17, v18, v8, (double *)v16);

  if (LOBYTE(v17.var0._translation._e[0]))
  {
    long double v10 = v17.var0._translation._e[1] * 6.28318531;
    long double v11 = exp(v17.var0._translation._e[2] * 6.28318531 + -3.14159265);
    double v12 = atan(v11);
    long double v13 = fmod(v10, 6.28318531);
    long double v14 = fmod(v13 + 6.28318531, 6.28318531) * 57.2957795 + -180.0;
    double v15 = v12 * 114.591559 + -90.0;
  }
  else
  {
    long double v14 = -180.0;
    double v15 = -180.0;
  }
  result.var1 = v14;
  result.var0 = v15;
  return result;
}

- (double)heading
{
  regionAnimation = self->super._regionAnimation;
  if (regionAnimation && [(VKAnimation *)regionAnimation running]) {
    return self->_finalYaw;
  }
  double v5 = [(VKCameraController *)self vkCamera];
  [v5 yaw];
  double v4 = v6 * 57.2957795;

  return v4;
}

- (double)pitch
{
  regionAnimation = self->super._regionAnimation;
  if (regionAnimation && [(VKAnimation *)regionAnimation running]) {
    return self->_finalPitch;
  }
  double v5 = [(VKCameraController *)self vkCamera];
  [v5 pitch];
  double v4 = v6 * 57.2957795;

  return v4;
}

- (float)currentDisplayZoomLevel
{
  double v3 = [(VKCameraController *)self vkCamera];
  double v4 = [v3 footprint];
  [v4 nearestGroundPoint];
  double v27 = v5;
  double v7 = v6;
  double v9 = v8;

  long double v10 = [(VKCameraController *)self vkCamera];
  long double v11 = (double *)[v10 position];
  double v12 = *v11;
  double v13 = v11[1];
  double v14 = v11[2];

  double v15 = [(VKCameraController *)self vkCamera];
  [v15 forwardVector];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = [(VKCameraController *)self vkCamera];
  [v22 widthOfViewAtDepth:v17 * (v9 - v12) + v19 * (v7 - v13) + v21 * (v27 - v14)];
  float v24 = 0.0;
  if (v23 > 0.0)
  {
    float v25 = log2(v23);
    float v24 = -v25;
  }

  return v24;
}

- (double)altitude
{
  double v3 = [(VKCameraController *)self vkCamera];
  double v4 = *(double *)([v3 position] + 16);

  [(VKMapCameraController *)self centerCoordinate];
  double v6 = v5;
  long double v7 = cos(v5 * 0.034906585) * -559.82 + 111132.92;
  long double v8 = v7 + cos(v6 * 0.0698131701) * 1.175;
  long double v9 = v8 + cos(v6 * 0.104719755) * -0.0023;
  double v10 = v6 * 0.00872664626;
  long double v11 = tan(v6 * 0.00872664626 + 0.78103484);
  double v12 = log(v11);
  long double v13 = tan(v10 + 0.789761487);
  return v9 * v4 / fabs((log(v13) - v12) * 0.159154943);
}

- (float)minimumPitchForNormalizedZoomLevel:(float)a3
{
  mapEngine = self->_mapEngine;
  if (mapEngine && (uint64_t v4 = mapEngine[149]) != 0) {
    return pitchForZ((void *)(v4 + 384), a3);
  }
  else {
    return 0.0;
  }
}

- (float)minimumNormalizedZoomLevel
{
  mapEngine = self->_mapEngine;
  float v3 = 1.0;
  if (!mapEngine) {
    return fmaxf(v3, 1.0);
  }
  if (!mapEngine[149]) {
    return fmaxf(v3, 1.0);
  }
  uint64_t v4 = (int8x8_t *)mapEngine[140];
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
  long double v9 = *(void **)(*(void *)&v4[1] + 8 * v8);
  float v3 = 1.0;
  if (!v9) {
    return fmaxf(v3, 1.0);
  }
  double v10 = (void *)*v9;
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
          goto LABEL_24;
        }
      }
      else if ((v13 & v11) != v8)
      {
        return fmaxf(1.0, 1.0);
      }
      double v10 = (void *)*v10;
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
LABEL_13:
    double v10 = (void *)*v10;
    if (!v10) {
      return fmaxf(1.0, 1.0);
    }
  }
  if (v10[2] != 0xAF46DE79C836B0D8) {
    goto LABEL_13;
  }
LABEL_24:
  uint64_t v15 = v10[5];
  float v3 = 1.0;
  if (v15) {
    float v3 = (float)*(unsigned int *)(v15 + 312);
  }
  return fmaxf(v3, 1.0);
}

- (float)maximumNormalizedZoomLevel
{
  mapEngine = self->_mapEngine;
  if (!mapEngine) {
    return 20.0;
  }
  uint64_t v4 = mapEngine[149];
  if (v4) {
    float v5 = (float)*(unsigned int *)(v4 + 52);
  }
  else {
    float v5 = 20.0;
  }
  uint8x8_t v6 = (uint64_t *)mapEngine[141];
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  if (v7 != v8)
  {
    while (*(unsigned char *)v7 != 20)
    {
      v7 += 16;
      if (v7 == v8) {
        return v5;
      }
    }
  }
  if (v7 != v8)
  {
    int v9 = *(_DWORD *)(v7 + 8);
    if ((v9 - 1) < 4 || v9 == 10)
    {
      uint64_t v11 = [MEMORY[0x1E4F64500] sharedConfiguration];
      unint64_t v12 = [v11 countryCode];
      int v13 = [v12 isEqualToString:@"KR"];

      if (v13)
      {
        {
        }
        if (_southKoreaRect(void)::onceToken != -1) {
          dispatch_once(&_southKoreaRect(void)::onceToken, &__block_literal_global_254);
        }
        double v14 = [(VKCameraController *)self vkCamera];
        uint64_t v15 = [v14 footprint];
        char v16 = [v15 rejectsRect:&v19];

        if ((v16 & 1) == 0)
        {
          uint64_t v17 = (uint64_t)log2f(128.0 / (float)[(VKMapCameraController *)self tileSize]);
          if (v17 <= -14) {
            uint64_t v17 = -14;
          }
          return fminf(v5, (float)(v17 + 15));
        }
      }
    }
  }
  return v5;
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 forceDestination:(BOOL)a10 completion:(id)a11
{
  BOOL v12 = a10;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v40 = a9;
  id v21 = a11;
  if (var0 <= 90.0 && var0 >= -90.0 && var1 <= 180.0 && var1 >= -180.0)
  {
    double v38 = fmax(cos(a6 * 0.0174532925), 0.00001);
    double v39 = a5;
    double v25 = var0 * 0.00872664626;
    long double v26 = tan(var0 * 0.00872664626 + 0.785398163);
    double v37 = var1 * 0.00277777778 + 0.5;
    double v27 = log(v26) * 0.159154943 + 0.5;
    double v28 = a7;
    long double v29 = cos(var0 * 0.034906585) * -559.82 + 111132.92;
    long double v30 = v29 + cos(var0 * 0.0698131701) * 1.175;
    long double v31 = v30 + cos(var0 * 0.104719755) * -0.0023;
    long double v32 = tan(var0 * 0.00872664626 + 0.78103484);
    double v33 = log(v32);
    long double v34 = tan(v25 + 0.789761487);
    double v35 = fabs((log(v34) - v33) * 0.159154943) * a4 / (v31 * v38);
    if (a8 == 2) {
      double v36 = 0.0;
    }
    else {
      double v36 = v28;
    }
    -[VKMapCameraController _animateToPosition:pitch:yaw:duration:timingCurve:forceDestination:completion:](self, "_animateToPosition:pitch:yaw:duration:timingCurve:forceDestination:completion:", v40, v12, v21, v37, v27, v35, a6, v39, v36, *(void *)&v37);
  }
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 timingCurve:(id)a7 completion:(id)a8
{
  id v53 = a3;
  id v14 = a7;
  uint64_t v15 = (void (**)(id, uint64_t))a8;
  char v16 = [(VKCameraController *)self canvas];
  [v16 size];
  double v18 = v17;

  uint64_t v19 = [(VKCameraController *)self canvas];
  [v19 size];
  double v21 = v20;

  if (v18 <= 0.0 || v21 <= 0.0)
  {
    if (v15) {
      v15[2](v15, 1);
    }
  }
  else
  {
    double v50 = v21;
    double v51 = v18;
    double v52 = a4;
    [(VKMapCameraController *)self _mercatorCenterCoordinateForMapRegion:v53];
    double v49 = v22;
    long double v24 = tan(v23 * 0.00872664626 + 0.785398163);
    double v48 = log(v24);
    GEOMapRectForMapRegion();
    double v27 = v26;
    double v28 = v25;
    if (v26 == 0.0 || v25 == 0.0)
    {
      GEOMapPointsPerMeterAtLatitude();
      GEOMapRectInset();
      double v27 = v29;
      double v28 = v30;
    }
    long double v31 = [(VKCameraController *)self vkCamera];
    [v31 tanHalfHorizFOV];
    double v33 = v32;

    long double v34 = [(VKCameraController *)self vkCamera];
    double v45 = v33;
    double v46 = a5;
    double v47 = a6;
    [v34 tanHalfVerticalFOV];
    double v36 = v35;

    double v38 = *MEMORY[0x1E4F63F10];
    double v37 = *(double *)(MEMORY[0x1E4F63F10] + 8);
    [(VKCameraController *)self edgeInsets];
    float v40 = v39;
    [(VKCameraController *)self edgeInsets];
    float v42 = v41;
    [(VKCameraController *)self edgeInsets];
    LODWORD(v33) = v43;
    [(VKCameraController *)self edgeInsets];
    -[VKMapCameraController _animateToPosition:pitch:yaw:duration:timingCurve:completion:](self, "_animateToPosition:pitch:yaw:duration:timingCurve:completion:", v14, v15, v49 * 0.00277777778 + 0.5, v48 * 0.159154943 + 0.5, fmax(v27 / v38 * 0.5 * (v27 / v38 * 0.5) / (v45 * 0.5 * (v27 / v38 - v27 / v38 * (float)(v42 + v40) / v51)), v28/ v37* 0.5* (v28/ v37* 0.5)/ (v36* 0.5* (v28 / v37 - v28 / v37 * (float)(v44 + *(float *)&v33) / v50))), v52, v46,
      v47);
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_mercatorCenterCoordinateForMapRegion:(id)a3
{
  GEOMapRectForMapRegion();
  GEOCoordinate2DForMapPoint();
  result.double var1 = v4;
  result.double var0 = v3;
  return result;
}

- (void)_animateToPosition:()Matrix<double pitch:()3 yaw:(1>)a3 duration:(double)a4 timingCurve:(double)a5 completion:(double)a6
{
}

- (void)_animateToPosition:()Matrix<double pitch:()3 yaw:(1>)a3 duration:(double)a4 timingCurve:(double)a5 forceDestination:(double)a6 completion:(id)a7
{
  double v12 = a3._e[2];
  double v13 = a3._e[1];
  double v14 = a3._e[0];
  double v124 = a5;
  v125[0] = a4;
  id v16 = a7;
  double v17 = (void (**)(id, void))a9;
  [(VKAnimation *)self->super._regionAnimation stop];
  if (self->super._regionAnimation)
  {
    if (v17) {
      v17[2](v17, 0);
    }
    goto LABEL_72;
  }
  -[VKMapCameraController positionClampedToCameraRestriction:](self, "positionClampedToCameraRestriction:", v14, v13, v12);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  long double v24 = [(VKCameraController *)self vkCamera];
  double v25 = v24;
  if (v24)
  {
    [v24 minDistanceToGroundRestriction];
    if (LOBYTE(v119[0]))
    {
      LOBYTE(v119[0]) = 0;

      double v26 = [(VKCameraController *)self vkCamera];
      double v27 = v26;
      if (v26)
      {
        [v26 minDistanceToGroundRestriction];
        double v28 = *((double *)v119 + 1);
      }
      else
      {
        v119[0] = 0uLL;
        double v28 = 0.0;
      }

      goto LABEL_17;
    }
  }
  double v29 = self;
  int v9 = [(VKCameraController *)v29 canvas];
  double v30 = v21;
  [v9 size];
  double v32 = v31;

  double v33 = 0.0;
  if (v32 > 0.0)
  {
    uint64_t v34 = [(VKMapCameraController *)v29 tileSize];
    int v9 = [(VKCameraController *)v29 canvas];
    [v9 size];
    double v33 = log2((double)v34 / v35);
  }
  id v36 = [(VKCameraController *)v29 vkCamera];
  double v37 = v36;
  if (v36)
  {
    [v36 verticalFieldOfView];
    double v38 = *(double *)v119 * 0.5;
  }
  else
  {
    double v38 = 0.0;
  }
  float v39 = v33 + 25.0;
  [v37 depthForViewWidth:(double)exp2(-v39)];
  double v41 = v40;
  [v37 maxPitch];
  double v43 = v42;

  float v44 = v43 - v38;
  double v45 = v41 * cosf(v44);
  float v46 = v38;
  double v28 = v45 / cosf(v46);

  double v21 = v30;
LABEL_17:
  double v47 = [(VKCameraController *)self vkCamera];
  double v48 = v47;
  v97 = v21;
  if (!v47)
  {
    int v50 = 0;
    v119[0] = 0uLL;
LABEL_23:
    double v51 = 1.0;
    goto LABEL_24;
  }
  [v47 maxDistanceToGroundRestriction];
  if (!LOBYTE(v119[0]))
  {
    int v50 = 0;
    goto LABEL_23;
  }
  double v49 = [(VKCameraController *)self vkCamera];
  int v9 = v49;
  if (v49)
  {
    [v49 maxDistanceToGroundRestriction];
    int v50 = 1;
    double v51 = v123;
  }
  else
  {
    uint64_t v122 = 0;
    double v123 = 0.0;
    double v51 = 0.0;
    int v50 = 1;
  }
LABEL_24:
  double v52 = v28;
  if (v51 > v28)
  {
    id v53 = [(VKCameraController *)self vkCamera];
    double v54 = v53;
    if (v53)
    {
      [v53 maxDistanceToGroundRestriction];
      if ((_BYTE)v117)
      {
        v55 = [(VKCameraController *)self vkCamera];
        float v56 = v55;
        if (v55)
        {
          [v55 maxDistanceToGroundRestriction];
          double v52 = v121;
          if ((_BYTE)location) {
            LOBYTE(location) = 0;
          }
        }
        else
        {
          id location = 0;
          double v121 = 0.0;
          double v52 = 0.0;
        }

        LOBYTE(v117) = 0;
        goto LABEL_35;
      }
    }
    else
    {
      long long v117 = 0uLL;
    }
    double v52 = 1.0;
LABEL_35:
  }
  if (v50)
  {
    if ((_BYTE)v122) {
      LOBYTE(v122) = 0;
    }
  }
  if (LOBYTE(v119[0])) {
    LOBYTE(v119[0]) = 0;
  }

  float v57 = [(VKCameraController *)self vkCamera];
  v58 = (double *)[v57 position];
  double v59 = *v58;
  double v95 = v58[1];
  double v96 = v58[2];

  double v60 = [(VKCameraController *)self vkCamera];
  double v61 = *(double *)[v60 position];

  if (v61 - v19 == 0.0)
  {
    double v63 = v19;
  }
  else
  {
    double v62 = [(VKCameraController *)self vkCamera];
    double v63 = (*(double *)[v62 position] - v19) / vabdd_f64(v61, v19) + v19;
  }
  double v64 = fmin(fmax(v23, v28), v52);
  if ((v64 - v96) * (v64 - v96) + (*(double *)&v97 - v95) * (*(double *)&v97 - v95) + (v63 - v59) * (v63 - v59) < (*(double *)&v97 - v95) * (*(double *)&v97 - v95) + (v19 - v59) * (v19 - v59) + (v64 - v96) * (v64 - v96)) {
    double v19 = v63;
  }
  [(VKMapCameraController *)self clampPitch:v125 yaw:&v124 atTargetPositionZ:v64];
  double v65 = v124;
  double v66 = v125[0];
  self->_finalYaw = v124;
  self->_finalPitch = v66;
  self->super._userChangedZoomSinceLastProgrammaticRegionChange = 0;
  [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setHasUserSpecifiedZoomLevel:0];
  [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController pauseAnimation];
  double v67 = v66 * 0.0174532925;
  double v68 = v65 * -0.0174532925;
  if (a6 <= 0.0)
  {
    -[VKMapCameraController _jumpToCenterPoint:pitchRadians:yawRadians:](self, "_jumpToCenterPoint:pitchRadians:yawRadians:", v19, *(double *)&v97, v64, v67, v65 * -0.0174532925);
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController resumeAnimation];
    if (v17) {
      v17[2](v17, 1);
    }
  }
  else
  {
    v69 = [(VKCameraController *)self vkCamera];
    [(VKCameraController *)self centerScreenPoint];
    if (v69) {
      objc_msgSend(v69, "groundPointFromScreenPoint:");
    }
    else {
      memset(v119, 0, sizeof(v119));
    }

    if (LOBYTE(v119[0]))
    {
      double v70 = [(VKCameraController *)self vkCamera];
      double v71 = v70;
      if (v70)
      {
        objc_msgSend(v70, "groundPointFromScreenPoint:", 0.5, 0.5);
      }
      else
      {
        long long v117 = 0u;
        long long v118 = 0u;
      }

      double v92 = *(double *)&v118;
      double v93 = *((double *)&v117 + 1);
      double v94 = *((double *)&v118 + 1);
      double v72 = [(VKCameraController *)self vkCamera];
      [v72 upVector];
      double v74 = v73;
      double v76 = v75;
      double v78 = v77;

      double v79 = -1.0;
      double v80 = sqrt(-(v78 * v78 + -1.0));
      double v81 = -v76 / v80;
      if (v81 > -1.0)
      {
        double v79 = 1.0;
        if (v81 < 1.0) {
          double v79 = -v76 / v80;
        }
      }
      double v82 = acos(v79);
      if (v74 <= 0.0) {
        double v83 = -v82;
      }
      else {
        double v83 = v82;
      }
      v84 = [(VKCameraController *)self vkCamera];
      [v84 pitch];
      uint64_t v86 = v85;

      double v87 = [[VKTimedAnimation alloc] initWithDuration:a6];
      regionAnimation = self->super._regionAnimation;
      self->super._regionAnimation = v87;

      if (v16) {
        v89 = v16;
      }
      else {
        v89 = VKAnimationCurveEaseInOut;
      }
      [(VKTimedAnimation *)self->super._regionAnimation setTimingFunction:v89];
      objc_initWeak(&location, self);
      [(VKCameraController *)self beginRegionChange:1];
      double v90 = sqrt((v59 - v93) * (v59 - v93) + (v95 - v92) * (v95 - v92) + (v96 - v94) * (v96 - v94));
      double v91 = v83 + 3.14159265;
      v103[0] = MEMORY[0x1E4F143A8];
      v103[1] = 3321888768;
      v103[2] = __103__VKMapCameraController__animateToPosition_pitch_yaw_duration_timingCurve_forceDestination_completion___block_invoke;
      v103[3] = &unk_1EF58DE18;
      objc_copyWeak(&v104, &location);
      char v105 = 0;
      if (LOBYTE(v119[0]))
      {
        long long v106 = *(_OWORD *)((char *)v119 + 8);
        uint64_t v107 = *((void *)&v119[1] + 1);
        char v105 = 1;
      }
      double v108 = v19;
      v109 = v97;
      uint64_t v110 = 0;
      double v111 = v91;
      double v112 = v68;
      uint64_t v113 = v86;
      double v114 = v67;
      double v115 = v90;
      double v116 = v64;
      [(VKTimedAnimation *)self->super._regionAnimation setStepHandler:v103];
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = __103__VKMapCameraController__animateToPosition_pitch_yaw_duration_timingCurve_forceDestination_completion___block_invoke_27;
      v99[3] = &unk_1E5A8DED0;
      objc_copyWeak(v101, &location);
      BOOL v102 = a8;
      v101[1] = *(id *)&v19;
      v101[2] = v97;
      v101[3] = *(id *)&v64;
      v101[4] = *(id *)&v67;
      v101[5] = *(id *)&v68;
      uint64_t v100 = v17;
      [(VKAnimation *)self->super._regionAnimation setCompletionHandler:v99];
      md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._regionAnimation->super);

      objc_destroyWeak(v101);
      if (v105) {
        char v105 = 0;
      }
      objc_destroyWeak(&v104);
      objc_destroyWeak(&location);
    }
    else
    {
      [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController resumeAnimation];
    }
  }
LABEL_72:
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  mapEngine = self->_mapEngine;
  if (mapEngine)
  {
    float v5 = (int8x8_t *)mapEngine[140];
    int8x8_t v6 = v5[2];
    if (v6)
    {
      uint8x8_t v7 = (uint8x8_t)vcnt_s8(v6);
      v7.i16[0] = vaddlv_u8(v7);
      if (v7.u32[0] > 1uLL)
      {
        uint64_t v8 = 0x17767EADC5B287BLL;
        if (*(void *)&v6 <= 0x17767EADC5B287BuLL) {
          uint64_t v8 = 0x17767EADC5B287BuLL % *(void *)&v6;
        }
      }
      else
      {
        uint64_t v8 = (*(void *)&v6 - 1) & 0x17767EADC5B287BLL;
      }
      int v9 = *(void **)(*(void *)&v5[1] + 8 * v8);
      if (v9)
      {
        double v10 = (void *)*v9;
        if (v10)
        {
          if (v7.u32[0] < 2uLL)
          {
            uint64_t v11 = *(void *)&v6 - 1;
            while (1)
            {
              uint64_t v13 = v10[1];
              if (v13 == 0x17767EADC5B287BLL)
              {
                if (v10[2] == 0x17767EADC5B287BLL) {
                  goto LABEL_23;
                }
              }
              else if ((v13 & v11) != v8)
              {
                return;
              }
              double v10 = (void *)*v10;
              if (!v10) {
                return;
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
LABEL_23:
                uint64_t v14 = v10[5];
                if (v14) {
                  *(_DWORD *)(v14 + 288) = 3;
                }
                return;
              }
            }
            else
            {
              if (v12 >= *(void *)&v6) {
                v12 %= *(void *)&v6;
              }
              if (v12 != v8) {
                return;
              }
            }
            double v10 = (void *)*v10;
          }
          while (v10);
        }
      }
    }
  }
}

- (Matrix<double,)positionClampedToCameraRestriction:()Matrix<double
{
  double v3 = a3._e[2];
  double v4 = a3._e[1];
  double v5 = a3._e[0];
  int8x8_t v6 = [(VKScreenCameraController *)self regionRestriction];
  objc_msgSend(v6, "clampedPosition:", v5, v4);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  double v13 = v3;
  result._e[2] = v13;
  result._e[1] = v12;
  result._e[0] = v11;
  return result;
}

- (void)clampPitch:(double *)a3 yaw:(double *)a4 atTargetPositionZ:(double)a5
{
  double v9 = 0.0;
  double v10 = 0.0;
  if (a3) {
    double v10 = *a3;
  }
  if (a4) {
    double v9 = *a4;
  }
  double v11 = [(VKCameraController *)self vkCamera];
  [v11 tanHalfHorizFOV];
  *(float *)&double v12 = v12 * a5;
  float v13 = log2f(*(float *)&v12);

  uint64_t v14 = self;
  uint64_t v15 = [(VKCameraController *)v14 canvas];
  [v15 size];
  double v17 = v16;

  double v18 = 0.0;
  if (v17 > 0.0)
  {
    double v19 = [(VKCameraController *)v14 canvas];
    [v19 size];
    double v18 = log2(v20 / (double)[(VKMapCameraController *)v14 tileSize]);
  }
  float v21 = v18 + (float)(-1.0 - v13);

  *(float *)&double v22 = v21;
  [(VKMapCameraController *)v14 maxPitchForNormalizedZoomLevel:v22];
  float v24 = v23;
  double v25 = fabs(v9 * 0.0174532925);
  BOOL v26 = v25 < 2.22507386e-308 || v25 <= v25 * 2.22044605e-14;
  uint64_t v27 = [(VKMapCameraController *)v14 tileSize];
  if (v27)
  {
    if (v27 < 513)
    {
      int v28 = 0;
      uint64_t i = 512;
    }
    else
    {
      int v28 = 0;
      for (uint64_t i = 512; i < v27; i *= 2)
        ++v28;
    }
    while (i > v27)
    {
      --v28;
      v27 *= 2;
    }
  }
  else
  {
    int v28 = 0;
  }
  int v30 = (float)((float)v28 + v21) > 6.0 || v26;
  double v31 = 0.0;
  if (v30) {
    double v31 = v9;
  }
  if (a3) {
    *a3 = fmin(v10, v24 * 57.2957795);
  }
  if (a4) {
    *a4 = v31;
  }
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  ptr = a3.__ptr_;
  double v5 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v13 = *(void *)a3.__ptr_;
  uint64_t v14 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v12.receiver = self;
  v12.super_class = (Class)VKMapCameraController;
  -[VKScreenCameraController setCamera:](&v12, sel_setCamera_, &v13, a3.__cntrl_);
  int8x8_t v6 = v14;
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
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
  [v8 setPosition:v10];

  double v9 = [(VKCameraController *)self vkCamera];
  [v9 setOrientation:&v11];
}

- (void)_jumpToCenterPoint:()Matrix<double pitchRadians:()3 yawRadians:(1>)a3
{
  double v7 = a3._e[2];
  double v8 = a3._e[1];
  double v9 = a3._e[0];
  Matrix<double, 3, 1> v41 = a3;
  [(VKCameraController *)self beginRegionChange:0];
  BOOL v11 = [(VKMapCameraController *)self isPitched];
  __double2 v12 = __sincos_stret(a4 * 0.5);
  __double2 v13 = __sincos_stret(a5 * 0.5);
  double v37 = v13.__cosval * v12.__sinval;
  double v38 = v13.__sinval * v12.__sinval;
  double v39 = v13.__sinval * v12.__cosval;
  double v40 = v13.__cosval * v12.__cosval;
  uint64_t v14 = [(VKCameraController *)self vkCamera];
  [v14 setOrientation:&v37];

  double v15 = v38 * v7 + v38 * v7;
  double v16 = v7 * -2.0 * v37;
  v36[0] = v9 - v16 * v39 + v15 * v40;
  v36[1] = v8 + v16 * v40 + v15 * v39;
  v36[2] = v7 + v16 * v37 - v15 * v38;
  double v17 = [(VKCameraController *)self vkCamera];
  [v17 setPosition:v36];

  double v18 = [(VKCameraController *)self vkCamera];
  [(VKCameraController *)self centerScreenPoint];
  if (v18)
  {
    objc_msgSend(v18, "groundPointFromScreenPoint:");
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }

  int64x2_t v19 = vdupq_n_s64(0x7FF8000000000000uLL);
  v42[0] = v19;
  if (*(void *)&v41._e[0] != v19.i64[0]
    || *(void *)&v41._e[1] != v19.i64[1]
    || *(void *)&v41._e[2] != 0x7FF8000000000000)
  {
    double v22 = *((double *)&v34 + 1);
    long long v23 = v35;
    float v24 = [(VKCameraController *)self vkCamera];
    double v25 = (double *)[v24 position];
    double v26 = v25[1];
    double v27 = v25[2] - *((double *)&v23 + 1);
    v33[0] = v9 - v22 + *v25;
    v33[1] = v8 - *(double *)&v23 + v26;
    v33[2] = v27;
    int v28 = [(VKCameraController *)self vkCamera];
    [v28 setPosition:v33];
  }
  [(VKMapCameraController *)self updateCameraZBounds];
  [(VKScreenCameraController *)self clampZoomLevelIfNecessary];
  double v29 = [(VKCameraController *)self cameraDelegate];
  [v29 mapLayerDidChangeVisibleRegion];

  uint64_t v30 = *(void *)[(VKCameraController *)self runLoopController];
  if (v30)
  {
    v42[0].i8[0] = 4;
    md::MapEngine::setNeedsTick(v30, v42);
  }
  BOOL v31 = [(VKMapCameraController *)self isPitched];
  if (v11 != v31)
  {
    double v32 = [(VKCameraController *)self cameraDelegate];
    [v32 mapLayerDidBecomePitched:v31];
  }
  [(VKCameraController *)self endRegionChange];
}

- (BOOL)isPitched
{
  float v2 = [(VKCameraController *)self vkCamera];
  [v2 pitch];
  BOOL v4 = v3 > 0.0001;

  return v4;
}

- (void)clampZoomLevelIfNecessaryAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (![(VKGestureCameraBehavior *)self->super._gestureCameraControllerBehavior isPinching]
    || ![(VKGestureCameraBehavior *)self->super._gestureCameraControllerBehavior allowsZoomRubberbanding])
  {
    [(VKMapCameraController *)self updateCameraZBounds];
    double v5 = [(VKCameraController *)self vkCamera];
    if (v5)
    {
      int8x8_t v6 = [(VKCameraController *)self vkCamera];
      double v7 = *(double *)([v6 position] + 16);
      double v8 = [(VKCameraController *)self vkCamera];
      [v8 minHeight];
      if (v7 >= v9)
      {
        double v10 = [(VKCameraController *)self vkCamera];
        double v11 = *(double *)([v10 position] + 16);
        __double2 v12 = [(VKCameraController *)self vkCamera];
        [v12 maxHeight];
        double v14 = v13;

        if (v11 <= v14) {
          return;
        }
      }
      else
      {
      }
      double v15 = [(VKCameraController *)self vkCamera];
      [(VKCameraController *)self centerScreenPoint];
      if (v15) {
        objc_msgSend(v15, "groundPointFromScreenPoint:");
      }
      else {
        memset(v53, 0, sizeof(v53));
      }

      if (LOBYTE(v53[0]))
      {
        double v16 = [(VKCameraController *)self vkCamera];
        uint64_t v17 = [v16 position];
        long long v41 = *(_OWORD *)v17;
        double v18 = *(double *)(v17 + 16);

        int64x2_t v19 = [(VKCameraController *)self vkCamera];
        [v19 minHeight];
        if (v18 >= v20)
        {
          float v21 = [(VKCameraController *)self vkCamera];
          [v21 maxHeight];
        }
        else
        {
          float v21 = [(VKCameraController *)self vkCamera];
          [v21 minHeight];
        }
        double v38 = v22;

        double v39 = (v18 - v38) / v18;
        float64x2_t v51 = vmlaq_n_f64(v42, vsubq_f64(*(float64x2_t *)&v53[1], v42), v39);
        double v52 = v18 + (*(double *)&v53[3] - v18) * v39;
        if (!v3) {
          goto LABEL_17;
        }
      }
      else
      {
        long long v23 = [(VKCameraController *)self vkCamera];
        float64x2_t v51 = *(float64x2_t *)[v23 position];

        float v24 = [(VKCameraController *)self vkCamera];
        [v24 minHeight];
        double v52 = v25;

        if (!v3)
        {
LABEL_17:
          double v40 = [(VKCameraController *)self vkCamera];
          [v40 setPosition:&v51];

          goto LABEL_18;
        }
      }
      [(VKAnimation *)self->super._zoomAnimation stop];
      zoomAnimation = self->super._zoomAnimation;
      self->super._zoomAnimation = 0;

      [(VKCameraController *)self beginRegionChange:1];
      double v27 = [(VKCameraController *)self cameraDelegate];
      [v27 mapLayerWillPerformZoomBounceAnimation];

      int v28 = [(VKCameraController *)self vkCamera];
      uint64_t v29 = [v28 position];
      long long v54 = *(_OWORD *)v29;
      uint64_t v55 = *(void *)(v29 + 16);

      uint64_t v30 = [VKSpringAnimation alloc];
      GEOConfigGetDouble();
      double v32 = v31;
      GEOConfigGetDouble();
      float v33 = v32;
      *(float *)&double v35 = v34;
      *(float *)&double v34 = v33;
      id v36 = [(VKSpringAnimation *)v30 initWithTension:@"rubberband" friction:v34 name:v35];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __59__VKMapCameraController_clampZoomLevelIfNecessaryAnimated___block_invoke;
      v46[3] = &unk_1E5A8DE58;
      v46[4] = self;
      long long v47 = v54;
      uint64_t v48 = v55;
      float64x2_t v49 = v51;
      double v50 = v52;
      [(VKSpringAnimation *)v36 setStepHandler:v46];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __59__VKMapCameraController_clampZoomLevelIfNecessaryAnimated___block_invoke_2;
      v43[3] = &unk_1E5A8DEA8;
      double v37 = v36;
      float v44 = v37;
      double v45 = self;
      [(VKAnimation *)v37 setCompletionHandler:v43];
      objc_storeStrong((id *)&self->super._zoomAnimation, v36);
      self->super._zoomAnimationCanBeInterrupted = 1;
      md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], self->super._zoomAnimation);

LABEL_18:
      [(VKMapCameraController *)self updateCameraZBounds];
    }
  }
}

- (void)canvasDidLayout
{
  BOOL v3 = [(VKCameraController *)self canvas];
  [v3 size];
  double v5 = v4;
  int8x8_t v6 = [(VKCameraController *)self canvas];
  [v6 size];
  double v8 = v7 * v5;

  if (v8 > 0.0)
  {
    [(VKMapCameraController *)self updateCameraZBounds];
  }
}

- (void)setMapEngine:(void *)a3
{
  self->_mapEngine = a3;
}

- (VKMapCameraController)initWithMapDataAccess:(void *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6
{
  id v10 = a6;
  v17.receiver = self;
  v17.super_class = (Class)VKMapCameraController;
  double v11 = [(VKScreenCameraController *)&v17 initWithMapDataAccess:a3 animationRunner:a4 runLoopController:a5 cameraDelegate:v10];
  __double2 v12 = (VKMapCameraController *)v11;
  if (v11)
  {
    *((void *)v11 + 27) = 1;
    *(_OWORD *)(v11 + 200) = VKAnnotationTrackingBehaviorDefault;
    [v11 setIsPitchEnabled:1];
    double v13 = [(VKGestureCameraBehavior *)[VKMapGestureCameraController alloc] initWithCameraController:v12];
    gestureCameraControllerBehavior = v12->super._gestureCameraControllerBehavior;
    v12->super._gestureCameraControllerBehavior = &v13->super;

    v12->_tourShouldResumeWhenDoneGesturing = 1;
    double v15 = v12;
  }

  return v12;
}

- (id).cxx_construct
{
  *((void *)self + 35) = 0;
  *((void *)self + 36) = 0;
  *((int64x2_t *)self + 21) = vdupq_n_s64(0xC00921FB54442D18);
  *((_OWORD *)self + 22) = 0u;
  *((_OWORD *)self + 23) = 0u;
  *((void *)self + 48) = 0;
  return self;
}

- (BOOL)snapMapIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(VKCameraController *)self vkCamera];

  if (v5)
  {
    [(VKMapCameraController *)self updateCameraZBounds];
    int8x8_t v6 = [(VKCameraController *)self vkCamera];
    [v6 pitch];
    double v8 = v7;

    double v9 = [(VKCameraController *)self vkCamera];
    [v9 yaw];
    double v11 = v10;

    [(VKMapCameraController *)self currentNormalizedZoomLevel];
    -[VKMapCameraController minimumPitchForNormalizedZoomLevel:](self, "minimumPitchForNormalizedZoomLevel:");
    double v13 = v12;
    if ((v8 >= v12 || v8 <= 0.0001)
      && ([(VKCameraController *)self vkCamera],
          double v14 = objc_claimAutoreleasedReturnValue(),
          [v14 maxPitch],
          double v16 = v15,
          v14,
          v8 <= v16))
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      objc_super v17 = [(VKCameraController *)self vkCamera];
      [v17 maxPitch];
      double v19 = v18;

      if (v8 <= v19)
      {
        if ([(VKGestureCameraBehavior *)self->super._gestureCameraControllerBehavior isPitchIncreasing])double v22 = v13; {
        else
        }
          double v22 = 0.0;
      }
      else
      {
        double v20 = [(VKCameraController *)self vkCamera];
        [v20 maxPitch];
        double v22 = v21;
      }
      double v5 = [(VKCameraController *)self vkCamera];
      [v5 maxPitch];
      [(VKMapCameraController *)self rotateToPitch:0 withPoint:0 preserveAltitude:v3 animated:0 exaggerate:v22 maxPitch:v23];

      LOBYTE(v5) = 1;
    }
    double v24 = fabs(v11);
    [(VKMapCameraController *)self currentStyleZoomLevel];
    if (v24 > v24 * 2.22044605e-14 && v24 >= 2.22507386e-308 && v25 <= 6.0)
    {
      [(VKMapCameraController *)self rotateToYaw:0 withPoint:v3 animated:0.0];
      LOBYTE(v5) = 1;
    }
  }
  return (char)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalOffsetAnimation, 0);
  cntrl = self->_flyoverTour.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
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

- (void)mapEngine
{
  return self->_mapEngine;
}

- (BOOL)isFlyoverTourStarted
{
  if (!self->super._flyoverAnimation) {
    return 0;
  }
  ptr = self->_flyoverTour.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((void *)ptr + 1);
  if (!v3) {
    return 0;
  }
  if (*(void *)v3) {
    float v4 = *(double *)(*(void *)v3 + 144);
  }
  else {
    float v4 = 0.0;
  }
  return vabds_f32(*((float *)ptr + 35), v4) > 0.01;
}

- (void)interruptFlyoverTourAnimation
{
  moveToTourPositionAnimation = self->super._moveToTourPositionAnimation;
  if (moveToTourPositionAnimation) {
    [(VKAnimation *)moveToTourPositionAnimation stop];
  }
  flyoverAnimation = self->super._flyoverAnimation;
  if (flyoverAnimation)
  {
    ptr = self->_flyoverTour.__ptr_;
    if (ptr)
    {
      uint64_t v6 = *((void *)ptr + 27);
      if (v6)
      {
        int v9 = 4;
        (*(void (**)(uint64_t, int *))(*(void *)v6 + 48))(v6, &v9);
        double v7 = (VKFlyoverTour *)*((void *)ptr + 27);
        *((void *)ptr + 27) = 0;
        if (v7 == (VKFlyoverTour *)((char *)ptr + 192))
        {
          (*(void (**)(uint64_t))(*((void *)ptr + 24) + 32))((uint64_t)ptr + 192);
        }
        else if (v7)
        {
          (*(void (**)(VKFlyoverTour *))(*(void *)v7 + 40))(v7);
        }
        double v8 = (VKFlyoverTour *)*((void *)ptr + 31);
        *((void *)ptr + 31) = 0;
        if (v8 == (VKFlyoverTour *)((char *)ptr + 224))
        {
          (*(void (**)(uint64_t))(*((void *)ptr + 28) + 32))((uint64_t)ptr + 224);
        }
        else if (v8)
        {
          (*(void (**)(VKFlyoverTour *))(*(void *)v8 + 40))(v8);
        }
      }
      flyoverAnimation = self->super._flyoverAnimation;
    }
    [(VKTimedAnimation *)flyoverAnimation stopAnimation:0];
    [(VKCameraController *)self endRegionChange];
  }
}

- (void)stopFlyoverTourAnimation
{
  moveToTourPositionAnimation = self->super._moveToTourPositionAnimation;
  if (moveToTourPositionAnimation) {
    [(VKAnimation *)moveToTourPositionAnimation stop];
  }
  flyoverAnimation = self->super._flyoverAnimation;
  if (flyoverAnimation)
  {
    if (self->_flyoverTour.__ptr_)
    {
      md::VKFlyoverTour::stopTour((md::VKFlyoverTour *)self->_flyoverTour.__ptr_);
      flyoverAnimation = self->super._flyoverAnimation;
    }
    [(VKTimedAnimation *)flyoverAnimation stopAnimation:0];
    [(VKCameraController *)self endRegionChange];
  }
}

- (void)resumeFlyoverTourAnimation
{
  if (!self->super._flyoverAnimation) {
    return;
  }
  p_flyoverTour = &self->_flyoverTour;
  ptr = self->_flyoverTour.__ptr_;
  if (!ptr) {
    return;
  }
  mapEngine = self->_mapEngine;
  if (!mapEngine) {
    goto LABEL_30;
  }
  uint64_t v6 = (int8x8_t *)mapEngine[140];
  if (!v6) {
    goto LABEL_30;
  }
  int8x8_t v7 = v6[2];
  if (!*(void *)&v7) {
    goto LABEL_30;
  }
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
  double v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
  if (!v10) {
    goto LABEL_30;
  }
  double v11 = (void *)*v10;
  if (!v11) {
    goto LABEL_30;
  }
  if (v8.u32[0] < 2uLL)
  {
    uint64_t v12 = *(void *)&v7 - 1;
    while (1)
    {
      uint64_t v15 = v11[1];
      if (v15 == 0x17767EADC5B287BLL)
      {
        if (v11[2] == 0x17767EADC5B287BLL) {
          goto LABEL_26;
        }
      }
      else if ((v15 & v12) != v9)
      {
        goto LABEL_30;
      }
      double v13 = 0.0;
      double v11 = (void *)*v11;
      if (!v11) {
        goto LABEL_31;
      }
    }
  }
  while (1)
  {
    unint64_t v14 = v11[1];
    if (v14 == 0x17767EADC5B287BLL) {
      break;
    }
    if (v14 >= *(void *)&v7) {
      v14 %= *(void *)&v7;
    }
    if (v14 != v9) {
      goto LABEL_30;
    }
LABEL_15:
    double v13 = 0.0;
    double v11 = (void *)*v11;
    if (!v11) {
      goto LABEL_31;
    }
  }
  if (v11[2] != 0x17767EADC5B287BLL) {
    goto LABEL_15;
  }
LABEL_26:
  uint64_t v16 = v11[5];
  if (!v16)
  {
LABEL_30:
    double v13 = 0.0;
    goto LABEL_31;
  }
  cntrl = self->_flyoverTour.__cntrl_;
  if (cntrl)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    md::ElevationLogic::setFlyoverTour(v16, (uint64_t)ptr, (uint64_t)cntrl);
    if (!atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  else
  {
    md::ElevationLogic::setFlyoverTour(v11[5], (uint64_t)ptr, 0);
  }
  double v13 = *(double *)(v16 + 176);
LABEL_31:
  double v18 = [(VKCameraController *)self vkCamera];
  [(VKCameraController *)self camera];
  if (v18)
  {
    [v18 cameraFrame:*v21 == 0];
  }
  else
  {
    double v26 = 0.0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
  }
  long long v19 = v24;
  *(_OWORD *)&self->_resumeTourPosition._target.latitude._value = v23;
  *(_OWORD *)&self->_resumeTourPosition._target.altitude._value = v19;
  *(_OWORD *)&self->_resumeTourPosition._pitch._value = v25;
  self->_resumeTourPosition._roll._value = v26;
  if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v22->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v22);
  }

  self->_resumeTourPosition._target.altitude._value = v13;
  self->_resumeTourFraction = 1.0;
  uint64_t v20 = *((void *)p_flyoverTour->__ptr_ + 27);
  if (v20)
  {
    LODWORD(v23) = 2;
    (*(void (**)(uint64_t, long long *))(*(void *)v20 + 48))(v20, &v23);
  }
  [(VKTimedAnimation *)self->super._flyoverAnimation resume];
}

- (void)pauseFlyoverTourAnimation
{
  moveToTourPositionAnimation = self->super._moveToTourPositionAnimation;
  if (moveToTourPositionAnimation) {
    [(VKAnimation *)moveToTourPositionAnimation stop];
  }
  flyoverAnimation = self->super._flyoverAnimation;
  if (flyoverAnimation)
  {
    ptr = self->_flyoverTour.__ptr_;
    if (ptr)
    {
      uint64_t v6 = *((void *)ptr + 27);
      if (v6)
      {
        int v20 = 1;
        (*(void (**)(uint64_t, int *))(*(void *)v6 + 48))(v6, &v20);
        flyoverAnimation = self->super._flyoverAnimation;
      }
    }
    [(VKTimedAnimation *)flyoverAnimation pause];
    [(VKCameraController *)self endRegionChange];
  }
  mapEngine = self->_mapEngine;
  if (mapEngine)
  {
    uint8x8_t v8 = (int8x8_t *)mapEngine[140];
    if (v8)
    {
      int8x8_t v9 = v8[2];
      if (v9)
      {
        uint8x8_t v10 = (uint8x8_t)vcnt_s8(v9);
        v10.i16[0] = vaddlv_u8(v10);
        if (v10.u32[0] > 1uLL)
        {
          uint64_t v11 = 0x17767EADC5B287BLL;
          if (*(void *)&v9 <= 0x17767EADC5B287BuLL) {
            uint64_t v11 = 0x17767EADC5B287BuLL % *(void *)&v9;
          }
        }
        else
        {
          uint64_t v11 = (*(void *)&v9 - 1) & 0x17767EADC5B287BLL;
        }
        uint64_t v12 = *(void **)(*(void *)&v8[1] + 8 * v11);
        if (v12)
        {
          double v13 = (void *)*v12;
          if (v13)
          {
            if (v10.u32[0] < 2uLL)
            {
              uint64_t v14 = *(void *)&v9 - 1;
              while (1)
              {
                uint64_t v16 = v13[1];
                if (v16 == 0x17767EADC5B287BLL)
                {
                  if (v13[2] == 0x17767EADC5B287BLL) {
                    goto LABEL_31;
                  }
                }
                else if ((v16 & v14) != v11)
                {
                  return;
                }
                double v13 = (void *)*v13;
                if (!v13) {
                  return;
                }
              }
            }
            do
            {
              unint64_t v15 = v13[1];
              if (v15 == 0x17767EADC5B287BLL)
              {
                if (v13[2] == 0x17767EADC5B287BLL)
                {
LABEL_31:
                  uint64_t v17 = v13[5];
                  if (v17)
                  {
                    md::ElevationLogic::setFlyoverTour(v17, 0, 0);
                    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
                      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
                    }
                    double v18 = (id)GEOGetVectorKitVKDefaultLog_log;
                    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)long long v19 = 0;
                      _os_log_impl(&dword_1A1780000, v18, OS_LOG_TYPE_INFO, "Flyover Tour: _flyoverTour detached from Elevation logic for pause", v19, 2u);
                    }
                  }
                  return;
                }
              }
              else
              {
                if (v15 >= *(void *)&v9) {
                  v15 %= *(void *)&v9;
                }
                if (v15 != v11) {
                  return;
                }
              }
              double v13 = (void *)*v13;
            }
            while (v13);
          }
        }
      }
    }
  }
}

- (void)animateToTourPosition:(float)a3 timingFunction:(id)a4 animationStyle:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void))a6;
  moveToTourPositionAnimation = self->super._moveToTourPositionAnimation;
  if (moveToTourPositionAnimation)
  {
    [(VKAnimation *)moveToTourPositionAnimation stop];
    if (self->super._moveToTourPositionAnimation) {
      goto LABEL_12;
    }
  }
  [(VKCameraController *)self camera];
  if (v49 && !atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
    std::__shared_weak_count::__release_weak(v49);
    if (*(void *)buf) {
      goto LABEL_6;
    }
LABEL_12:
    if (v11) {
      v11[2](v11, 0);
    }
    goto LABEL_55;
  }
  if (!*(void *)buf) {
    goto LABEL_12;
  }
LABEL_6:
  mapEngine = self->_mapEngine;
  uint64_t v14 = 0;
  if (mapEngine)
  {
    unint64_t v15 = (int8x8_t *)mapEngine[140];
    if (v15)
    {
      int8x8_t v16 = v15[2];
      if (v16)
      {
        uint8x8_t v17 = (uint8x8_t)vcnt_s8(v16);
        v17.i16[0] = vaddlv_u8(v17);
        if (v17.u32[0] > 1uLL)
        {
          uint64_t v18 = 0x17767EADC5B287BLL;
          if (*(void *)&v16 <= 0x17767EADC5B287BuLL) {
            uint64_t v18 = 0x17767EADC5B287BuLL % *(void *)&v16;
          }
        }
        else
        {
          uint64_t v18 = (*(void *)&v16 - 1) & 0x17767EADC5B287BLL;
        }
        long long v19 = *(void **)(*(void *)&v15[1] + 8 * v18);
        if (v19)
        {
          int v20 = (void *)*v19;
          if (v20)
          {
            if (v17.u32[0] < 2uLL)
            {
              uint64_t v21 = *(void *)&v16 - 1;
              while (1)
              {
                uint64_t v23 = v20[1];
                if (v23 == 0x17767EADC5B287BLL)
                {
                  if (v20[2] == 0x17767EADC5B287BLL) {
                    goto LABEL_32;
                  }
                }
                else if ((v23 & v21) != v18)
                {
                  goto LABEL_42;
                }
                int v20 = (void *)*v20;
                if (!v20) {
                  goto LABEL_42;
                }
              }
            }
            do
            {
              unint64_t v22 = v20[1];
              if (v22 == 0x17767EADC5B287BLL)
              {
                if (v20[2] == 0x17767EADC5B287BLL)
                {
LABEL_32:
                  uint64_t v24 = v20[5];
                  if (v24)
                  {
                    ptr = self->_flyoverTour.__ptr_;
                    cntrl = self->_flyoverTour.__cntrl_;
                    if (cntrl)
                    {
                      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
                      md::ElevationLogic::setFlyoverTour(v24, (uint64_t)ptr, (uint64_t)cntrl);
                      if (!atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
                      {
                        (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
                        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
                      }
                    }
                    else
                    {
                      md::ElevationLogic::setFlyoverTour(v20[5], (uint64_t)ptr, 0);
                    }
                    uint64_t v14 = *(void *)(v24 + 176);
                    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
                      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
                    }
                    double v27 = (id)GEOGetVectorKitVKDefaultLog_log;
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1A1780000, v27, OS_LOG_TYPE_INFO, "Flyover Tour: _flyoverTour attached to Elevation logic upon resuming", buf, 2u);
                    }
                  }
                  break;
                }
              }
              else
              {
                if (v22 >= *(void *)&v16) {
                  v22 %= *(void *)&v16;
                }
                if (v22 != v18) {
                  break;
                }
              }
              int v20 = (void *)*v20;
            }
            while (v20);
          }
        }
      }
    }
  }
LABEL_42:
  int v28 = [VKTimedAnimation alloc];
  double v29 = a3;
  if (a5 == 2) {
    double v29 = 0.0;
  }
  uint64_t v30 = [(VKTimedAnimation *)v28 initWithDuration:v29];
  double v31 = self->super._moveToTourPositionAnimation;
  self->super._moveToTourPositionAnimation = v30;

  if (v10) {
    double v32 = v10;
  }
  else {
    double v32 = VKAnimationCurveEaseInOut;
  }
  [(VKTimedAnimation *)self->super._moveToTourPositionAnimation setTimingFunction:v32];
  [(VKCameraController *)self camera];
  float v33 = v49;
  long long v35 = *(_OWORD *)(*(void *)buf + 8);
  long long v36 = *(_OWORD *)(*(void *)buf + 32);
  long long v37 = *(_OWORD *)(*(void *)buf + 48);
  if (v49 && !atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
    std::__shared_weak_count::__release_weak(v33);
  }
  objc_initWeak((id *)buf, self);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3321888768;
  int64x2_t v42[2] = __88__VKMapCameraController_animateToTourPosition_timingFunction_animationStyle_completion___block_invoke;
  v42[3] = &unk_1EF52E9B0;
  objc_copyWeak(&v43, (id *)buf);
  long long v44 = v35;
  uint64_t v45 = v14;
  long long v46 = v36;
  long long v47 = v37;
  [(VKTimedAnimation *)self->super._moveToTourPositionAnimation setStepHandler:v42];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __88__VKMapCameraController_animateToTourPosition_timingFunction_animationStyle_completion___block_invoke_38;
  v39[3] = &unk_1E5A98E30;
  objc_copyWeak(&v41, (id *)buf);
  double v40 = v11;
  [(VKAnimation *)self->super._moveToTourPositionAnimation setCompletionHandler:v39];
  md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._moveToTourPositionAnimation->super);
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  double v34 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v38 = 0;
    _os_log_impl(&dword_1A1780000, v34, OS_LOG_TYPE_INFO, "Flyover Tour: Moving to tour position", v38, 2u);
  }

  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)buf);
LABEL_55:
}

void __88__VKMapCameraController_animateToTourPosition_timingFunction_animationStyle_completion___block_invoke(uint64_t a1, float a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained[35];
  long long v22 = *(_OWORD *)(v5 + 72);
  float64x2_t v23 = *(float64x2_t *)(v5 + 88);
  double v6 = *(double *)(v5 + 120);
  double v7 = *(double *)(a1 + 40);
  long long v24 = *(_OWORD *)(v5 + 104);
  long double v8 = fmod(3.14159265 - v7 + *(double *)&v22, 6.28318531);
  long double v9 = fmod(v8 + 6.28318531, 6.28318531);
  long double v10 = fmod(v7 + 3.14159265 + (v9 + -3.14159265) * a2, 6.28318531);
  v28[0] = fmod(v10 + 6.28318531, 6.28318531) + -3.14159265;
  double v11 = *(double *)(a1 + 48);
  long double v12 = fmod(3.14159265 - v11 + *((double *)&v22 + 1), 6.28318531);
  long double v13 = fmod(v12 + 6.28318531, 6.28318531);
  long double v14 = fmod(v11 + 3.14159265 + (v13 + -3.14159265) * a2, 6.28318531);
  v28[1] = fmod(v14 + 6.28318531, 6.28318531) + -3.14159265;
  float64x2_t v29 = vmlaq_n_f64(*(float64x2_t *)(a1 + 56), vsubq_f64(v23, *(float64x2_t *)(a1 + 56)), a2);
  double v15 = *(double *)(a1 + 80);
  long double v16 = fmod(3.14159265 - v15 + *((double *)&v24 + 1), 6.28318531);
  long double v17 = fmod(v16 + 6.28318531, 6.28318531);
  long double v18 = fmod(v15 + 3.14159265 + (v17 + -3.14159265) * a2, 6.28318531);
  long double v19 = fmod(v18 + 6.28318531, 6.28318531);
  double v30 = *(double *)(a1 + 72) + (*(double *)&v24 - *(double *)(a1 + 72)) * a2;
  double v31 = v19 + -3.14159265;
  double v32 = *(double *)(a1 + 88) + (v6 - *(double *)(a1 + 88)) * a2;
  *(float64_t *)(v5 + 152) = v29.f64[0];
  v29.f64[0] = 0.0;
  [WeakRetained camera];
  double v20 = gdc::CameraFrame<geo::Radians,double>::toRigidTransformMercator(v27, v28, *v25 == 0);
  if (v26 && !atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *, double))v26->__on_zero_shared)(v26, v20);
    std::__shared_weak_count::__release_weak(v26);
  }
  uint64_t v21 = objc_msgSend(WeakRetained, "vkCamera", v20, (void)v22);
  [v21 setTransform:v27];
}

void __88__VKMapCameraController_animateToTourPosition_timingFunction_animationStyle_completion___block_invoke_38(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    float v4 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v3 = (void *)v4[22];
    v4[22] = 0;

    WeakRetained = v4;
  }
}

- (void)flyoverTourAnimation:(id)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v12 = a5;
  long double v14 = (void (**)(id, uint64_t))a6;
  moveToTourPositionAnimation = self->super._moveToTourPositionAnimation;
  if (moveToTourPositionAnimation) {
    [(VKAnimation *)moveToTourPositionAnimation stop];
  }
  *(int64x2_t *)&self->_resumeTourPosition._target.latitude._value = vdupq_n_s64(0xC00921FB54442D18);
  *(_OWORD *)&self->_resumeTourPosition._target.altitude._value = 0u;
  *(_OWORD *)&self->_resumeTourPosition._pitch._value = 0u;
  self->_resumeTourPosition._roll._value = 0.0;
  self->_resumeTourFraction = 0.0;
  [(VKMapCameraController *)self stopFlyoverTourAnimation];
  if (v13 && !self->super._flyoverAnimation)
  {
    long double v10 = operator new(0x118uLL);
    v10[1] = 0;
    v10[2] = 0;
    void *v10 = &unk_1EF52E178;
    md::VKFlyoverTour::VKFlyoverTour((md::VKFlyoverTour *)(v10 + 3));
  }
  if (v14) {
    v14[2](v14, 6);
  }
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  double v11 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1780000, v11, OS_LOG_TYPE_ERROR, "Flyover Tour: failed to start", buf, 2u);
  }
}

void __86__VKMapCameraController_flyoverTourAnimation_animateToStart_labelChanged_stateChange___block_invoke(uint64_t a1, float a2)
{
  WeakRetained = (float64x2_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_91;
  }
  float64_t v6 = WeakRetained[17].f64[1];
  float v7 = *(float *)(*(void *)&v6 + 128);
  if (v7 > a2)
  {
    float v7 = v7 + -1.0;
    *(float *)(*(void *)&v6 + 128) = v7;
  }
  long double v8 = +[VKDebugSettings sharedSettings];
  [v8 toursAnimationSpeed];
  *(float *)(*(void *)&v6 + 148) = v9 * (float)(a2 - v7);

  long double v10 = *(double **)(*(void *)&v6 + 8);
  if (!v10)
  {
    *(float *)(*(void *)&v6 + 128) = a2;
LABEL_90:
    [(float64x2_t *)v5 stopFlyoverTourAnimation];
    goto LABEL_91;
  }
  if (*(void *)v10) {
    float v11 = *(double *)(*(void *)v10 + 144);
  }
  else {
    float v11 = 0.0;
  }
  if (vabds_f32(*(float *)(*(void *)&v6 + 140), v11) <= 0.01) {
    goto LABEL_75;
  }
  id v12 = +[VKDebugSettings sharedSettings];
  [v12 toursInterestingViewSpeed];
  float v14 = v13;

  double v15 = +[VKDebugSettings sharedSettings];
  [v15 toursViewRecoverySpeed];
  float v17 = v16;

  long double v18 = +[VKDebugSettings sharedSettings];
  int v19 = [v18 toursForceCompleteTileLoading];

  uint64_t v20 = **(void **)(*(void *)&v6 + 8);
  if (v20)
  {
    double v21 = *(double *)(v20 + 144);
    uint64_t v22 = *(void *)(*(void *)&v6 + 184);
    if (v22) {
      goto LABEL_12;
    }
LABEL_16:
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
LABEL_17:
    if (*(void *)(v24 + 16)) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  double v21 = 0.0;
  uint64_t v22 = *(void *)(*(void *)&v6 + 184);
  if (!v22) {
    goto LABEL_16;
  }
LABEL_12:
  float v2 = (*(float (**)(uint64_t))(*(void *)v22 + 48))(v22);
  float64x2_t v23 = *(_DWORD **)(*(void *)&v6 + 8);
  uint64_t v24 = *(void *)(*(void *)v23 + 120) + 32 * v23[4];
  if (*(char *)(v24 + 31) < 0) {
    goto LABEL_17;
  }
  if (*(unsigned char *)(v24 + 31)) {
    goto LABEL_21;
  }
LABEL_18:
  if (*(float *)(*(void *)&v6 + 140) < *(float *)(*(void *)&v6 + 136) && v23[2]) {
    float v14 = v17;
  }
LABEL_21:
  long long v25 = +[VKDebugSettings sharedSettings];
  if ([v25 toursModulateSpeed]) {
    float v26 = v14;
  }
  else {
    float v26 = 1.0;
  }

  if (v2 < 1.0)
  {
    float v27 = expf(v2) + -1.36787944;
    float v17 = fmaxf(v27, 0.0);
    if (v19) {
      *(_DWORD *)(*(void *)&v6 + 148) = 0;
    }
  }
  int v28 = +[VKDebugSettings sharedSettings];
  [v28 toursPreloadHeadTime];
  float v30 = v29;

  double v31 = +[VKDebugSettings sharedSettings];
  float v32 = v21;
  float v33 = v17 * v30;
  if (([v31 toursPreloadSlowsSpeed] & (v17 < v26)) == 0) {
    float v17 = v26;
  }

  float v34 = *(float *)(*(void *)&v6 + 148);
  float v35 = *(float *)(*(void *)&v6 + 132) + (float)((float)(v17 - *(float *)(*(void *)&v6 + 132)) * v34);
  float v36 = fminf(fmaxf(*(float *)(*(void *)&v6 + 136) + v34, 0.0), v32);
  float v37 = fminf(fmaxf(*(float *)(*(void *)&v6 + 140) + (float)(v35 * v34), 0.0), v32);
  float v38 = fminf(fmaxf(v37 + v33, v37), v32);
  if (v19) {
    float v38 = v37;
  }
  *(float *)(*(void *)&v6 + 140) = v37;
  *(float *)(*(void *)&v6 + 144) = v38;
  *(float *)(*(void *)&v6 + 132) = v35;
  *(float *)(*(void *)&v6 + 136) = v36;
  long double v10 = *(double **)(*(void *)&v6 + 8);
  double v39 = v37;
  double v10[3] = v39;
  uint64_t v40 = *(void *)v10;
  if (*(void *)v10)
  {
    unint64_t v41 = *((unsigned int *)v10 + 4);
    double v42 = v39 / *(double *)(v40 + 144);
    uint64_t v43 = *(void *)(v40 + 120);
    if (v42 >= *(float *)(v43 + 32 * v41 + 4))
    {
      unint64_t v47 = ((*(void *)(v40 + 128) - v43) >> 5) - 1;
      if (v47 > v41)
      {
        uint64_t v44 = *((unsigned int *)v10 + 4);
        unsigned int v48 = *((_DWORD *)v10 + 4);
        while (v42 >= *(float *)(v43 + 32 * v44 + 4))
        {
          uint64_t v44 = ++v48;
          if (v47 <= v48) {
            goto LABEL_48;
          }
        }
        LODWORD(v44) = v48;
        goto LABEL_48;
      }
    }
    else if (v41)
    {
      LODWORD(v44) = *((_DWORD *)v10 + 4);
      if (v42 < *(float *)(v43 + 32 * v41))
      {
        uint64_t v45 = (float *)(v43 + 32 * v41);
        int v46 = *((_DWORD *)v10 + 4);
        while (v42 < *v45)
        {
          v45 -= 8;
          if (!--v46)
          {
            LODWORD(v44) = 0;
            goto LABEL_48;
          }
        }
        LODWORD(v44) = v46;
      }
      goto LABEL_48;
    }
    LODWORD(v44) = *((_DWORD *)v10 + 4);
LABEL_48:
    *((_DWORD *)v10 + 4) = v44;
    uint64_t v49 = *((unsigned int *)v10 + 2);
    uint64_t v50 = *(void *)(v40 + 72);
    if (v42 >= *(double *)(v50 + 8 * v49))
    {
      do
      {
        unsigned int v51 = v49;
        if (((*(void *)(v40 + 80) - v50) >> 3) - 1 <= (unint64_t)v49) {
          break;
        }
        LODWORD(v49) = v49 + 1;
      }
      while (v42 > *(double *)(v50 + 8 * v49));
    }
    else if (v49)
    {
      while (v42 < *(double *)(v50 + 8 * v49))
      {
        if (!--v49) {
          goto LABEL_52;
        }
      }
      unsigned int v51 = v49;
    }
    else
    {
LABEL_52:
      unsigned int v51 = 0;
    }
    *((_DWORD *)v10 + 2) = v51;
    *((unsigned char *)v10 + 32) = v41 != v44;
    md::AnimationData::interpolateFrames((md::AnimationData *)&v107, v39, v40, v51);
    long double v10 = *(double **)(*(void *)&v6 + 8);
    float v38 = *(float *)(*(void *)&v6 + 144);
    goto LABEL_58;
  }
  int64x2_t v107 = vdupq_n_s64(0xC00921FB54442D18);
  float64x2_t v108 = 0u;
  long long v109 = 0u;
  double v110 = 0.0;
LABEL_58:
  float64x2_t v52 = v108;
  *(int64x2_t *)(*(void *)&v6 + 72) = v107;
  *(float64x2_t *)(*(void *)&v6 + 88) = v52;
  *(_OWORD *)(*(void *)&v6 + 104) = v109;
  *(double *)(*(void *)&v6 + 120) = v110;
  uint64_t v53 = *(void *)v10;
  if (*(void *)v10)
  {
    double v54 = v38;
    double v55 = v38 / *(double *)(v53 + 144);
    uint64_t v56 = *((unsigned int *)v10 + 3);
    uint64_t v57 = *(void *)(v53 + 72);
    if (v55 >= *(double *)(v57 + 8 * v56))
    {
      do
      {
        unsigned int v58 = v56;
        if (((*(void *)(v53 + 80) - v57) >> 3) - 1 <= (unint64_t)v56) {
          break;
        }
        LODWORD(v56) = v56 + 1;
      }
      while (v55 > *(double *)(v57 + 8 * v56));
    }
    else if (v56)
    {
      while (v55 < *(double *)(v57 + 8 * v56))
      {
        if (!--v56) {
          goto LABEL_63;
        }
      }
      unsigned int v58 = v56;
    }
    else
    {
LABEL_63:
      unsigned int v58 = 0;
    }
    *((_DWORD *)v10 + 3) = v58;
    md::AnimationData::interpolateFrames((md::AnimationData *)&v107, v54, v53, v58);
    long double v10 = *(double **)(*(void *)&v6 + 8);
  }
  else
  {
    int64x2_t v107 = vdupq_n_s64(0xC00921FB54442D18);
    float64x2_t v108 = 0u;
    long long v109 = 0u;
    double v110 = 0.0;
  }
  float64x2_t v59 = v108;
  *(int64x2_t *)(*(void *)&v6 + 16) = v107;
  *(float64x2_t *)(*(void *)&v6 + 32) = v59;
  *(_OWORD *)(*(void *)&v6 + 48) = v109;
  *(double *)(*(void *)&v6 + 64) = v110;
  uint64_t v60 = *(void *)(*(void *)&v6 + 248);
  if (!v60)
  {
LABEL_73:
    *(float *)(*(void *)&v6 + 128) = a2;
    if (!v10) {
      goto LABEL_90;
    }
    goto LABEL_76;
  }
  if (*((unsigned char *)v10 + 32))
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)v60 + 48))(v60, *(void *)(*(void *)v10 + 120) + 32 * *((unsigned int *)v10 + 4) + 8);
    long double v10 = *(double **)(*(void *)&v6 + 8);
    goto LABEL_73;
  }
LABEL_75:
  *(float *)(*(void *)&v6 + 128) = a2;
LABEL_76:
  uint64_t v61 = *(void *)v10;
  if (v61) {
    float v62 = *(double *)(v61 + 144);
  }
  else {
    float v62 = 0.0;
  }
  if (vabds_f32(*(float *)(*(void *)&v6 + 140), v62) <= 0.01) {
    goto LABEL_90;
  }
  double v63 = +[VKDebugSettings sharedSettings];
  int v64 = [v63 tourUsePreloadPosition];
  float64_t v65 = v5[17].f64[1];
  double v66 = (int64x2_t *)(*(void *)&v65 + 72);
  double v67 = (float64x2_t *)(*(void *)&v65 + 88);
  double v68 = (long long *)(*(void *)&v65 + 104);
  v69 = (double *)(*(void *)&v65 + 120);
  double v70 = (int64x2_t *)(*(void *)&v65 + 16);
  double v71 = (float64x2_t *)(*(void *)&v65 + 32);
  double v72 = (long long *)(*(void *)&v65 + 48);
  double v73 = (double *)(*(void *)&v65 + 64);
  if (v64)
  {
    double v66 = v70;
    double v68 = v72;
    double v67 = v71;
  }
  else
  {
    double v73 = v69;
  }
  float64x2_t v74 = *v67;
  long long v75 = *v68;
  double v76 = *v73;
  int64x2_t v100 = *v66;
  int64x2_t v107 = *v66;
  float64x2_t v108 = v74;
  long long v102 = v75;
  float64x2_t v103 = v74;
  long long v109 = v75;
  double v110 = v76;

  if (*(float *)&v5[24].f64[1] > 0.0)
  {
    double v77 = +[VKDebugSettings sharedSettings];
    char v78 = [v77 tourUsePreloadPosition];

    if ((v78 & 1) == 0)
    {
      *(float *)&double v79 = 1.0 - *(float *)&v5[24].f64[1];
      (*((void (**)(double))VKAnimationCurveEaseOut + 2))(v79);
      double v80 = v5[21].f64[0];
      double v101 = v81;
      long double v82 = fmod(3.14159265 - v80 + *(double *)v100.i64, 6.28318531);
      long double v83 = fmod(v82 + 6.28318531, 6.28318531);
      long double v84 = fmod(v80 + 3.14159265 + (v83 + -3.14159265) * v101, 6.28318531);
      long double v85 = fmod(v84 + 6.28318531, 6.28318531) + -3.14159265;
      double v86 = v5[21].f64[1];
      long double v87 = fmod(3.14159265 - v86 + *(double *)&v100.i64[1], 6.28318531);
      long double v88 = fmod(v87 + 6.28318531, 6.28318531);
      long double v89 = fmod(v86 + 3.14159265 + (v88 + -3.14159265) * v101, 6.28318531);
      long double v90 = fmod(v89 + 6.28318531, 6.28318531) + -3.14159265;
      float64x2_t v103 = vmlaq_n_f64(v5[22], vsubq_f64(v103, v5[22]), v101);
      double v91 = v5[23].f64[1];
      long double v92 = fmod(3.14159265 - v91 + *((double *)&v102 + 1), 6.28318531);
      long double v93 = fmod(v92 + 6.28318531, 6.28318531);
      long double v94 = fmod(v91 + 3.14159265 + (v93 + -3.14159265) * v101, 6.28318531);
      long double v95 = fmod(v94 + 6.28318531, 6.28318531);
      float64_t v96 = v5[23].f64[0] + (*(double *)&v102 - v5[23].f64[0]) * v101;
      double v97 = v5[24].f64[0] + (v76 - v5[24].f64[0]) * v101;
      *(long double *)v107.i64 = v85;
      *(long double *)&v107.i64[1] = v90;
      float64x2_t v108 = v103;
      *(float64_t *)&long long v109 = v96;
      *((double *)&v109 + 1) = v95 + -3.14159265;
      double v110 = v97;
      *(float *)&long double v95 = *(float *)&v5[24].f64[1] + *(float *)(*(void *)&v5[17].f64[1] + 148) * -0.666666667;
      LODWORD(v5[24].f64[1]) = LODWORD(v95);
    }
  }
  *(float64_t *)(*(void *)&v5[17].f64[1] + 152) = v103.f64[0];
  v108.f64[0] = 0.0;
  [(float64x2_t *)v5 camera];
  double v98 = gdc::CameraFrame<geo::Radians,double>::toRigidTransformMercator(v106, (double *)v107.i64, *v104 == 0);
  if (v105 && !atomic_fetch_add(&v105->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *, double))v105->__on_zero_shared)(v105, v98);
    std::__shared_weak_count::__release_weak(v105);
  }
  unint64_t v99 = [(float64x2_t *)v5 vkCamera];
  [v99 setTransform:v106];

LABEL_91:
}

void __86__VKMapCameraController_flyoverTourAnimation_animateToStart_labelChanged_stateChange___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_115;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    float64_t v6 = *(void (**)(void))(v5 + 16);
    if (a2)
    {
      v6();
    }
    else
    {
      v6();
      if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
      }
      float v7 = (id)GEOGetVectorKitVKDefaultLog_log;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unint64_t v41 = 0;
        _os_log_impl(&dword_1A1780000, v7, OS_LOG_TYPE_INFO, "Flyover Tour: prematurely stopped", v41, 2u);
      }
    }
  }
  uint64_t v8 = WeakRetained[34];
  if (!v8) {
    goto LABEL_105;
  }
  float v9 = *(int8x8_t **)(v8 + 1120);
  if (!v9) {
    goto LABEL_105;
  }
  int8x8_t v10 = v9[2];
  if (!*(void *)&v10) {
    goto LABEL_105;
  }
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(v10);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    uint64_t v13 = 0x4BD0C73E70A08DDBLL;
    if (*(void *)&v10 <= 0x4BD0C73E70A08DDBuLL) {
      uint64_t v13 = 0x4BD0C73E70A08DDBuLL % *(void *)&v10;
    }
  }
  else
  {
    uint64_t v13 = (*(void *)&v10 - 1) & 0x4BD0C73E70A08DDBLL;
  }
  float v14 = *(void **)(*(void *)&v9[1] + 8 * v13);
  if (!v14) {
    goto LABEL_46;
  }
  double v15 = (void *)*v14;
  if (!v15) {
    goto LABEL_46;
  }
  if (v11.u32[0] < 2uLL)
  {
    while (1)
    {
      uint64_t v17 = v15[1];
      if (v17 == 0x4BD0C73E70A08DDBLL)
      {
        if (v15[2] == 0x4BD0C73E70A08DDBLL) {
          goto LABEL_33;
        }
      }
      else if ((v17 & (*(void *)&v10 - 1)) != v13)
      {
        goto LABEL_44;
      }
      double v15 = (void *)*v15;
      if (!v15) {
        goto LABEL_44;
      }
    }
  }
  while (1)
  {
    unint64_t v16 = v15[1];
    if (v16 == 0x4BD0C73E70A08DDBLL) {
      break;
    }
    if (v16 >= *(void *)&v10) {
      v16 %= *(void *)&v10;
    }
    if (v16 != v13) {
      goto LABEL_44;
    }
LABEL_22:
    double v15 = (void *)*v15;
    if (!v15) {
      goto LABEL_44;
    }
  }
  if (v15[2] != 0x4BD0C73E70A08DDBLL) {
    goto LABEL_22;
  }
LABEL_33:
  uint64_t v18 = v15[5];
  if (v18)
  {
    LOBYTE(v45[0]) = 0;
    char v47 = 0;
    std::__optional_storage_base<std::function<gdc::CameraFrame<geo::Radians,double> ()(void)>,false>::__assign_from[abi:nn180100]<std::__optional_copy_assign_base<std::function<gdc::CameraFrame<geo::Radians,double> ()(void)>,false> const&>((unsigned char *)(v18 + 288), v45);
    if (v47)
    {
      if (v46 == v45)
      {
        (*(void (**)(void *))(v45[0] + 32))(v45);
      }
      else if (v46)
      {
        (*(void (**)(void))(*v46 + 40))();
      }
    }
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    int v19 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v41 = 0;
      _os_log_impl(&dword_1A1780000, v19, OS_LOG_TYPE_INFO, "Flyover Tour: NeighborCameraPositionProvider set to std::nullopt in FlyoverTileDataLogic", v41, 2u);
    }

    float v9 = *(int8x8_t **)(WeakRetained[34] + 1120);
    int8x8_t v10 = v9[2];
  }
LABEL_44:
  if (!*(void *)&v10) {
    goto LABEL_105;
  }
  uint8x8_t v20 = (uint8x8_t)vcnt_s8(v10);
  v20.i16[0] = vaddlv_u8(v20);
  unint64_t v12 = v20.u32[0];
LABEL_46:
  if (v12 > 1)
  {
    unint64_t v21 = 0xAF46DE79C836B0D8;
    if (*(void *)&v10 <= 0xAF46DE79C836B0D8) {
      unint64_t v21 = 0xAF46DE79C836B0D8 % *(void *)&v10;
    }
  }
  else
  {
    unint64_t v21 = (*(void *)&v10 - 1) & 0xAF46DE79C836B0D8;
  }
  uint64_t v22 = *(void **)(*(void *)&v9[1] + 8 * v21);
  if (!v22) {
    goto LABEL_79;
  }
  float64x2_t v23 = (void *)*v22;
  if (!v23) {
    goto LABEL_79;
  }
  if (v12 < 2)
  {
    while (1)
    {
      uint64_t v25 = v23[1];
      if (v25 == 0xAF46DE79C836B0D8)
      {
        if (v23[2] == 0xAF46DE79C836B0D8) {
          goto LABEL_66;
        }
      }
      else if ((v25 & (*(void *)&v10 - 1)) != v21)
      {
        goto LABEL_77;
      }
      float64x2_t v23 = (void *)*v23;
      if (!v23) {
        goto LABEL_77;
      }
    }
  }
  while (2)
  {
    unint64_t v24 = v23[1];
    if (v24 != 0xAF46DE79C836B0D8)
    {
      if (v24 >= *(void *)&v10) {
        v24 %= *(void *)&v10;
      }
      if (v24 != v21) {
        goto LABEL_77;
      }
      goto LABEL_55;
    }
    if (v23[2] != 0xAF46DE79C836B0D8)
    {
LABEL_55:
      float64x2_t v23 = (void *)*v23;
      if (!v23) {
        goto LABEL_77;
      }
      continue;
    }
    break;
  }
LABEL_66:
  uint64_t v26 = v23[5];
  if (v26)
  {
    LOBYTE(v42[0]) = 0;
    char v44 = 0;
    std::__optional_storage_base<std::function<gdc::CameraFrame<geo::Radians,double> ()(void)>,false>::__assign_from[abi:nn180100]<std::__optional_copy_assign_base<std::function<gdc::CameraFrame<geo::Radians,double> ()(void)>,false> const&>((unsigned char *)(v26 + 376), v42);
    if (v44)
    {
      if (v43 == v42)
      {
        (*(void (**)(void *))(v42[0] + 32))(v42);
      }
      else if (v43)
      {
        (*(void (**)(void))(*v43 + 40))();
      }
    }
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    float v27 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v41 = 0;
      _os_log_impl(&dword_1A1780000, v27, OS_LOG_TYPE_INFO, "Flyover Tour: NeighborCameraPositionProvider set to std::nullopt in TileSelectionLogic", v41, 2u);
    }

    float v9 = *(int8x8_t **)(WeakRetained[34] + 1120);
    int8x8_t v10 = v9[2];
  }
LABEL_77:
  if (!*(void *)&v10) {
    goto LABEL_105;
  }
  uint8x8_t v28 = (uint8x8_t)vcnt_s8(v10);
  v28.i16[0] = vaddlv_u8(v28);
  unint64_t v12 = v28.u32[0];
LABEL_79:
  if (v12 > 1)
  {
    uint64_t v29 = 0x17767EADC5B287BLL;
    if (*(void *)&v10 <= 0x17767EADC5B287BuLL) {
      uint64_t v29 = 0x17767EADC5B287BuLL % *(void *)&v10;
    }
  }
  else
  {
    uint64_t v29 = (*(void *)&v10 - 1) & 0x17767EADC5B287BLL;
  }
  float v30 = *(void **)(*(void *)&v9[1] + 8 * v29);
  if (v30)
  {
    double v31 = (void *)*v30;
    if (v31)
    {
      if (v12 < 2)
      {
        uint64_t v32 = *(void *)&v10 - 1;
        while (1)
        {
          uint64_t v34 = v31[1];
          if (v34 == 0x17767EADC5B287BLL)
          {
            if (v31[2] == 0x17767EADC5B287BLL) {
              goto LABEL_99;
            }
          }
          else if ((v34 & v32) != v29)
          {
            goto LABEL_105;
          }
          double v31 = (void *)*v31;
          if (!v31) {
            goto LABEL_105;
          }
        }
      }
      do
      {
        unint64_t v33 = v31[1];
        if (v33 == 0x17767EADC5B287BLL)
        {
          if (v31[2] == 0x17767EADC5B287BLL)
          {
LABEL_99:
            uint64_t v35 = v31[5];
            if (v35)
            {
              md::ElevationLogic::setFlyoverTour(v35, 0, 0);
              if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
                dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
              }
              float v36 = (id)GEOGetVectorKitVKDefaultLog_log;
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)unint64_t v41 = 0;
                _os_log_impl(&dword_1A1780000, v36, OS_LOG_TYPE_INFO, "Flyover Tour: _flyoverTour detached from Elevation logic upon completion", v41, 2u);
              }
            }
            break;
          }
        }
        else
        {
          if (v33 >= *(void *)&v10) {
            v33 %= *(void *)&v10;
          }
          if (v33 != v29) {
            break;
          }
        }
        double v31 = (void *)*v31;
      }
      while (v31);
    }
  }
LABEL_105:
  float v37 = (void *)WeakRetained[21];
  WeakRetained[21] = 0;

  float v38 = (std::__shared_weak_count *)WeakRetained[36];
  WeakRetained[35] = 0;
  WeakRetained[36] = 0;
  if (v38 && !atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
    std::__shared_weak_count::__release_weak(v38);
  }
  double v39 = (void *)WeakRetained[22];
  if (v39) {
    [v39 stop];
  }
  [WeakRetained endRegionChange];
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  uint64_t v40 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v41 = 0;
    _os_log_impl(&dword_1A1780000, v40, OS_LOG_TYPE_INFO, "Flyover Tour: completed", v41, 2u);
  }

LABEL_115:
}

void __86__VKMapCameraController_flyoverTourAnimation_animateToStart_labelChanged_stateChange___block_invoke_37(uint64_t a1, int a2)
{
  WeakRetained = (VKAnimation **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (!WeakRetained || (WeakRetained[21] ? (BOOL v6 = a2 == 0) : (BOOL v6 = 1), v6))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 6);
    }
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    uint64_t v8 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)float v9 = 0;
      _os_log_impl(&dword_1A1780000, v8, OS_LOG_TYPE_ERROR, "Flyover Tour: could not move to tour start position", v9, 2u);
    }
  }
  else
  {
    md::AnimationRunner::runAnimation((md::MapEngine **)[WeakRetained animationRunner], WeakRetained[21]);
  }
}

- (void)flyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  v1 = (id *)(a1 + 8);

  objc_destroyWeak(v1);
  JUMPOUT(0x1A6239270);
}

- (id)flyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  float v2 = (id *)(a1 + 8);
  uint64_t v3 = (id *)operator new(0x18uLL);
  *uint64_t v3 = &unk_1EF58F670;
  objc_copyWeak(v3 + 1, v2);
  v3[2] = (id)MEMORY[0x1A6239EB0](*(void *)(a1 + 16));
  return v3;
}

- (uint64_t)flyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  float v2 = (id *)(a1 + 8);

  objc_destroyWeak(v2);
  return a1;
}

- (float)flyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  float v2 = 1.0;
  if (!WeakRetained) {
    goto LABEL_212;
  }
  uint64_t v3 = WeakRetained[34];
  if (!v3) {
    goto LABEL_212;
  }
  uint64_t v4 = *(void *)(v3 + 1120);
  unint64_t v5 = *(void *)(v4 + 16);
  if ((v5 & (v5 - 1)) != 0)
  {
    unint64_t v7 = 0x87BA2765F9E38E05;
    if (v5 <= 0x87BA2765F9E38E05) {
      unint64_t v7 = 0x87BA2765F9E38E05 % v5;
    }
    BOOL v6 = *(void **)(*(void *)(v4 + 8) + 8 * v7);
    do
    {
      do
        BOOL v6 = (void *)*v6;
      while (v6[1] != 0x87BA2765F9E38E05);
    }
    while (v6[2] != 0x87BA2765F9E38E05);
  }
  else
  {
    BOOL v6 = *(void **)(*(void *)(v4 + 8) + 8 * ((v5 - 1) & 0x87BA2765F9E38E05));
    do
    {
      do
        BOOL v6 = (void *)*v6;
      while (v6[1] != 0x87BA2765F9E38E05);
    }
    while (v6[2] != 0x87BA2765F9E38E05);
  }
  uint64_t v8 = *(void *)(v6[5] + 392);
  int8x8_t v9 = *(int8x8_t *)(v8 + 400);
  if (!*(void *)&v9) {
    goto LABEL_33;
  }
  int8x8_t v10 = **(uint64_t ***)(v8 + 392);
  if (v10)
  {
    int8x8_t v10 = (uint64_t *)*v10;
    if (v10)
    {
      uint8x8_t v11 = (uint8x8_t)vcnt_s8(v9);
      v11.i16[0] = vaddlv_u8(v11);
      if (v11.u32[0] < 2uLL)
      {
        while (1)
        {
          uint64_t v12 = v10[1];
          if (v12)
          {
            if ((v12 & (*(void *)&v9 - 1)) != 0) {
              goto LABEL_33;
            }
          }
          else if (!*((_DWORD *)v10 + 4))
          {
            goto LABEL_29;
          }
          int8x8_t v10 = (uint64_t *)*v10;
          if (!v10) {
            goto LABEL_34;
          }
        }
      }
      do
      {
        unint64_t v13 = v10[1];
        if (v13)
        {
          if (v13 < *(void *)&v9 || v13 % *(void *)&v9) {
            goto LABEL_33;
          }
        }
        else if (!*((_DWORD *)v10 + 4))
        {
LABEL_29:
          float v14 = (uint64_t *)v10[5];
          if (v14)
          {
            LODWORD(v10) = 0;
            do
            {
              LODWORD(v10) = v10 + *((_DWORD *)v14 + 6);
              float v14 = (uint64_t *)*v14;
            }
            while (v14);
            break;
          }
LABEL_33:
          LODWORD(v10) = 0;
          break;
        }
        int8x8_t v10 = (uint64_t *)*v10;
      }
      while (v10);
    }
  }
LABEL_34:
  int8x8_t v15 = *(int8x8_t *)(v8 + 360);
  if (!*(void *)&v15) {
    goto LABEL_54;
  }
  unint64_t v16 = **(uint64_t ***)(v8 + 352);
  if (v16)
  {
    unint64_t v16 = (uint64_t *)*v16;
    if (v16)
    {
      uint8x8_t v17 = (uint8x8_t)vcnt_s8(v15);
      v17.i16[0] = vaddlv_u8(v17);
      if (v17.u32[0] < 2uLL)
      {
        while (1)
        {
          uint64_t v18 = v16[1];
          if (v18)
          {
            if ((v18 & (*(void *)&v15 - 1)) != 0) {
              goto LABEL_54;
            }
          }
          else if (!*((_DWORD *)v16 + 4))
          {
            goto LABEL_50;
          }
          unint64_t v16 = (uint64_t *)*v16;
          if (!v16) {
            goto LABEL_55;
          }
        }
      }
      do
      {
        unint64_t v19 = v16[1];
        if (v19)
        {
          if (v19 < *(void *)&v15 || v19 % *(void *)&v15) {
            goto LABEL_54;
          }
        }
        else if (!*((_DWORD *)v16 + 4))
        {
LABEL_50:
          uint8x8_t v20 = (uint64_t *)v16[5];
          if (v20)
          {
            LODWORD(v16) = 0;
            do
            {
              LODWORD(v16) = v16 + *((_DWORD *)v20 + 6);
              uint8x8_t v20 = (uint64_t *)*v20;
            }
            while (v20);
            break;
          }
LABEL_54:
          LODWORD(v16) = 0;
          break;
        }
        unint64_t v16 = (uint64_t *)*v16;
      }
      while (v16);
    }
  }
LABEL_55:
  if (!*(void *)&v9) {
    goto LABEL_78;
  }
  uint8x8_t v21 = (uint8x8_t)vcnt_s8(v9);
  v21.i16[0] = vaddlv_u8(v21);
  uint64_t v22 = *(void *)&v9 != 1;
  if (v21.u32[0] < 2uLL) {
    uint64_t v22 = (v9.i8[0] & 1) == 0;
  }
  float64x2_t v23 = *(uint64_t **)(*(void *)(v8 + 392) + 8 * v22);
  if (v23)
  {
    float64x2_t v23 = (uint64_t *)*v23;
    if (v23)
    {
      if (v21.u32[0] < 2uLL)
      {
        while (1)
        {
          uint64_t v24 = v23[1];
          if (v24 == 1)
          {
            if (*((_DWORD *)v23 + 4) == 1) {
              goto LABEL_74;
            }
          }
          else if ((v24 & (*(void *)&v9 - 1)) != v22)
          {
            goto LABEL_78;
          }
          float64x2_t v23 = (uint64_t *)*v23;
          if (!v23) {
            goto LABEL_79;
          }
        }
      }
      do
      {
        unint64_t v25 = v23[1];
        if (v25 == 1)
        {
          if (*((_DWORD *)v23 + 4) == 1)
          {
LABEL_74:
            uint64_t v26 = (uint64_t *)v23[5];
            if (v26)
            {
              LODWORD(v23) = 0;
              do
              {
                LODWORD(v23) = v23 + *((_DWORD *)v26 + 6);
                uint64_t v26 = (uint64_t *)*v26;
              }
              while (v26);
              break;
            }
LABEL_78:
            LODWORD(v23) = 0;
            break;
          }
        }
        else
        {
          if (v25 >= *(void *)&v9) {
            v25 %= *(void *)&v9;
          }
          if (v25 != v22) {
            goto LABEL_78;
          }
        }
        float64x2_t v23 = (uint64_t *)*v23;
      }
      while (v23);
    }
  }
LABEL_79:
  if (!*(void *)&v15) {
    goto LABEL_102;
  }
  uint8x8_t v27 = (uint8x8_t)vcnt_s8(v15);
  v27.i16[0] = vaddlv_u8(v27);
  uint64_t v28 = *(void *)&v15 != 1;
  if (v27.u32[0] < 2uLL) {
    uint64_t v28 = (v15.i8[0] & 1) == 0;
  }
  uint64_t v29 = *(uint64_t **)(*(void *)(v8 + 352) + 8 * v28);
  if (!v29) {
    goto LABEL_103;
  }
  uint64_t v29 = (uint64_t *)*v29;
  if (!v29) {
    goto LABEL_103;
  }
  if (v27.u32[0] < 2uLL)
  {
    while (1)
    {
      uint64_t v30 = v29[1];
      if (v30 == 1)
      {
        if (*((_DWORD *)v29 + 4) == 1) {
          goto LABEL_98;
        }
      }
      else if ((v30 & (*(void *)&v15 - 1)) != v28)
      {
        goto LABEL_102;
      }
      uint64_t v29 = (uint64_t *)*v29;
      if (!v29) {
        goto LABEL_103;
      }
    }
  }
  while (1)
  {
    unint64_t v31 = v29[1];
    if (v31 == 1) {
      break;
    }
    if (v31 >= *(void *)&v15) {
      v31 %= *(void *)&v15;
    }
    if (v31 != v28) {
      goto LABEL_102;
    }
LABEL_92:
    uint64_t v29 = (uint64_t *)*v29;
    if (!v29) {
      goto LABEL_103;
    }
  }
  if (*((_DWORD *)v29 + 4) != 1) {
    goto LABEL_92;
  }
LABEL_98:
  uint64_t v32 = (uint64_t *)v29[5];
  if (!v32)
  {
LABEL_102:
    LODWORD(v29) = 0;
    goto LABEL_103;
  }
  LODWORD(v29) = 0;
  do
  {
    LODWORD(v29) = v29 + *((_DWORD *)v32 + 6);
    uint64_t v32 = (uint64_t *)*v32;
  }
  while (v32);
LABEL_103:
  if (!*(void *)&v9) {
    goto LABEL_128;
  }
  uint8x8_t v33 = (uint8x8_t)vcnt_s8(v9);
  v33.i16[0] = vaddlv_u8(v33);
  if (v33.u32[0] > 1uLL)
  {
    uint64_t v34 = 2;
    if (*(void *)&v9 <= 2uLL) {
      uint64_t v34 = 2uLL % *(void *)&v9;
    }
  }
  else
  {
    uint64_t v34 = (v9.i8[0] - 1) & 2;
  }
  uint64_t v35 = *(uint64_t ***)(*(void *)(v8 + 392) + 8 * v34);
  if (!v35) {
    goto LABEL_128;
  }
  float v36 = *v35;
  if (!v36) {
    goto LABEL_128;
  }
  if (v33.u32[0] < 2uLL)
  {
    do
    {
      uint64_t v38 = v36[1];
      if (v38 == 2)
      {
        if (*((_DWORD *)v36 + 4) == 2) {
          goto LABEL_124;
        }
      }
      else if ((v38 & (*(void *)&v9 - 1)) != v34)
      {
        goto LABEL_128;
      }
      float v36 = (uint64_t *)*v36;
    }
    while (v36);
    int v40 = 0;
LABEL_133:
    if (!*(void *)&v15) {
      goto LABEL_129;
    }
    goto LABEL_134;
  }
  while (2)
  {
    unint64_t v37 = v36[1];
    if (v37 != 2)
    {
      if (v37 >= *(void *)&v9) {
        v37 %= *(void *)&v9;
      }
      if (v37 != v34) {
        goto LABEL_128;
      }
      goto LABEL_113;
    }
    if (*((_DWORD *)v36 + 4) != 2)
    {
LABEL_113:
      float v36 = (uint64_t *)*v36;
      if (!v36) {
        goto LABEL_128;
      }
      continue;
    }
    break;
  }
LABEL_124:
  double v39 = (uint64_t *)v36[5];
  if (v39)
  {
    int v40 = 0;
    do
    {
      v40 += *((_DWORD *)v39 + 6);
      double v39 = (uint64_t *)*v39;
    }
    while (v39);
    goto LABEL_133;
  }
LABEL_128:
  int v40 = 0;
  if (!*(void *)&v15)
  {
LABEL_129:
    int v41 = 0;
LABEL_130:
    if (!*(void *)&v9) {
      goto LABEL_184;
    }
    goto LABEL_159;
  }
LABEL_134:
  uint8x8_t v42 = (uint8x8_t)vcnt_s8(v15);
  v42.i16[0] = vaddlv_u8(v42);
  if (v42.u32[0] > 1uLL)
  {
    uint64_t v43 = 2;
    if (*(void *)&v15 <= 2uLL) {
      uint64_t v43 = 2uLL % *(void *)&v15;
    }
  }
  else
  {
    uint64_t v43 = (v15.i8[0] - 1) & 2;
  }
  char v44 = *(uint64_t ***)(*(void *)(v8 + 352) + 8 * v43);
  if (!v44) {
    goto LABEL_158;
  }
  uint64_t v45 = *v44;
  if (!v45) {
    goto LABEL_158;
  }
  if (v42.u32[0] < 2uLL)
  {
    while (1)
    {
      uint64_t v47 = v45[1];
      if (v47 == 2)
      {
        if (*((_DWORD *)v45 + 4) == 2) {
          goto LABEL_154;
        }
      }
      else if ((v47 & (*(void *)&v15 - 1)) != v43)
      {
        goto LABEL_158;
      }
      uint64_t v45 = (uint64_t *)*v45;
      if (!v45) {
        goto LABEL_158;
      }
    }
  }
  while (2)
  {
    unint64_t v46 = v45[1];
    if (v46 != 2)
    {
      if (v46 >= *(void *)&v15) {
        v46 %= *(void *)&v15;
      }
      if (v46 != v43) {
        goto LABEL_158;
      }
      goto LABEL_143;
    }
    if (*((_DWORD *)v45 + 4) != 2)
    {
LABEL_143:
      uint64_t v45 = (uint64_t *)*v45;
      if (!v45) {
        goto LABEL_158;
      }
      continue;
    }
    break;
  }
LABEL_154:
  uint64_t v48 = (uint64_t *)v45[5];
  if (v48)
  {
    int v41 = 0;
    do
    {
      v41 += *((_DWORD *)v48 + 6);
      uint64_t v48 = (uint64_t *)*v48;
    }
    while (v48);
    goto LABEL_130;
  }
LABEL_158:
  int v41 = 0;
  if (!*(void *)&v9) {
    goto LABEL_184;
  }
LABEL_159:
  uint8x8_t v49 = (uint8x8_t)vcnt_s8(v9);
  v49.i16[0] = vaddlv_u8(v49);
  if (v49.u32[0] > 1uLL)
  {
    uint64_t v50 = 3;
    if (*(void *)&v9 <= 3uLL) {
      uint64_t v50 = 3uLL % *(void *)&v9;
    }
  }
  else
  {
    uint64_t v50 = (v9.i8[0] - 1) & 3;
  }
  unsigned int v51 = *(uint64_t ***)(*(void *)(v8 + 392) + 8 * v50);
  if (!v51) {
    goto LABEL_183;
  }
  float64x2_t v52 = *v51;
  if (!v52) {
    goto LABEL_183;
  }
  if (v49.u32[0] < 2uLL)
  {
    uint64_t v53 = *(void *)&v9 - 1;
    while (1)
    {
      uint64_t v55 = v52[1];
      if (v55 == 3)
      {
        if (*((_DWORD *)v52 + 4) == 3) {
          goto LABEL_179;
        }
      }
      else if ((v55 & v53) != v50)
      {
        goto LABEL_183;
      }
      float64x2_t v52 = (uint64_t *)*v52;
      if (!v52) {
        goto LABEL_183;
      }
    }
  }
  while (1)
  {
    unint64_t v54 = v52[1];
    if (v54 == 3) {
      break;
    }
    if (v54 >= *(void *)&v9) {
      v54 %= *(void *)&v9;
    }
    if (v54 != v50) {
      goto LABEL_183;
    }
LABEL_168:
    float64x2_t v52 = (uint64_t *)*v52;
    if (!v52) {
      goto LABEL_183;
    }
  }
  if (*((_DWORD *)v52 + 4) != 3) {
    goto LABEL_168;
  }
LABEL_179:
  uint64_t v56 = (uint64_t *)v52[5];
  if (!v56)
  {
LABEL_183:
    v9.i32[0] = 0;
    goto LABEL_184;
  }
  v9.i32[0] = 0;
  do
  {
    v9.i32[0] += *((_DWORD *)v56 + 6);
    uint64_t v56 = (uint64_t *)*v56;
  }
  while (v56);
LABEL_184:
  if (!*(void *)&v15) {
    goto LABEL_209;
  }
  uint8x8_t v57 = (uint8x8_t)vcnt_s8(v15);
  v57.i16[0] = vaddlv_u8(v57);
  if (v57.u32[0] > 1uLL)
  {
    uint64_t v58 = 3;
    if (*(void *)&v15 <= 3uLL) {
      uint64_t v58 = 3uLL % *(void *)&v15;
    }
  }
  else
  {
    uint64_t v58 = (v15.i8[0] - 1) & 3;
  }
  float64x2_t v59 = *(uint64_t **)(*(void *)(v8 + 352) + 8 * v58);
  if (v59)
  {
    float64x2_t v59 = (uint64_t *)*v59;
    if (v59)
    {
      if (v57.u32[0] < 2uLL)
      {
        uint64_t v60 = *(void *)&v15 - 1;
        while (1)
        {
          uint64_t v62 = v59[1];
          if (v62 == 3)
          {
            if (*((_DWORD *)v59 + 4) == 3) {
              goto LABEL_205;
            }
          }
          else if ((v62 & v60) != v58)
          {
            goto LABEL_209;
          }
          float64x2_t v59 = (uint64_t *)*v59;
          if (!v59) {
            goto LABEL_210;
          }
        }
      }
      do
      {
        unint64_t v61 = v59[1];
        if (v61 == 3)
        {
          if (*((_DWORD *)v59 + 4) == 3)
          {
LABEL_205:
            double v63 = (uint64_t *)v59[5];
            if (v63)
            {
              LODWORD(v59) = 0;
              do
              {
                LODWORD(v59) = v59 + *((_DWORD *)v63 + 6);
                double v63 = (uint64_t *)*v63;
              }
              while (v63);
              break;
            }
LABEL_209:
            LODWORD(v59) = 0;
            break;
          }
        }
        else
        {
          if (v61 >= *(void *)&v15) {
            v61 %= *(void *)&v15;
          }
          if (v61 != v58) {
            goto LABEL_209;
          }
        }
        float64x2_t v59 = (uint64_t *)*v59;
      }
      while (v59);
    }
  }
LABEL_210:
  unsigned int v64 = v59 + v9.i32[0];
  unsigned int v65 = v16 + v10 + v23 + v29 + v40 + v41 + v64;
  if (v65) {
    float v2 = (float)v64 / (float)v65;
  }
LABEL_212:

  return v2;
}

- (void)startFlyoverTourAnimation:(unint64_t)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (!self->_flyoverTour.__ptr_)
  {
    uint8x8_t v20 = operator new(0x118uLL);
    v20[1] = 0;
    v20[2] = 0;
    *uint8x8_t v20 = &unk_1EF52E178;
    md::VKFlyoverTour::VKFlyoverTour((md::VKFlyoverTour *)(v20 + 3));
  }
  objc_initWeak(&location, self);
  ptr = self->_flyoverTour.__ptr_;
  uint64_t v22 = self;
  objc_copyWeak(&v23, &location);
  uint64_t v24 = MEMORY[0x1A6239EB0](v11);
  BOOL v25 = a4;
  uint64_t v26 = MEMORY[0x1A6239EB0](v10);
  uint64_t v30 = 0;
  unint64_t v13 = operator new(0x30uLL);
  *(void *)unint64_t v13 = &unk_1EF58F628;
  *((void *)v13 + 1) = v22;
  objc_moveWeak((id *)v13 + 2, &v23);
  *((void *)v13 + 3) = v24;
  *((unsigned char *)v13 + 32) = v25;
  uint64_t v14 = v26;
  uint64_t v24 = 0;
  uint64_t v26 = 0;
  *((void *)v13 + 5) = v14;
  uint64_t v30 = v13;
  objc_destroyWeak(&v23);

  int8x8_t v15 = *(void **)(*(void *)ptr + 8);
  if (!v15) {
    goto LABEL_13;
  }
  uint64_t v16 = *(void *)ptr + 8;
  do
  {
    unint64_t v17 = v15[4];
    BOOL v18 = v17 >= a3;
    if (v17 >= a3) {
      unint64_t v19 = v15;
    }
    else {
      unint64_t v19 = v15 + 1;
    }
    if (v18) {
      uint64_t v16 = (uint64_t)v15;
    }
    int8x8_t v15 = (void *)*v19;
  }
  while (*v19);
  if (v16 != *(void *)ptr + 8 && *(void *)(v16 + 32) <= a3)
  {
    uint8x8_t v21 = *(void **)(v16 + 40);
    if (v21)
    {
      id v28 = v21;
      if (!v30)
      {
        std::__throw_bad_function_call[abi:nn180100]();
        __break(1u);
        return;
      }
      (*(void (**)(void *, id *))(*v30 + 48))(v30, &v28);
    }
  }
  else
  {
LABEL_13:
    id v28 = 0;
    (*(void (**)(void *, id *))(*(void *)v13 + 48))(v13, &v28);
  }
  if (v30 == v29)
  {
    (*(void (**)(void *))(v29[0] + 32))(v29);
  }
  else if (v30)
  {
    (*(void (**)(void))(*v30 + 40))();
  }
  objc_destroyWeak(&location);
}

- (void)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  objc_destroyWeak(a1 + 2);
  JUMPOUT(0x1A6239270);
}

- (uint64_t)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  *(void *)a2 = &unk_1EF58F628;
  *(void *)(a2 + 8) = *(id *)(a1 + 8);
  objc_copyWeak((id *)(a2 + 16), (id *)(a1 + 16));
  *(void *)(a2 + 24) = MEMORY[0x1A6239EB0](*(void *)(a1 + 24));
  *(unsigned char *)(a2 + 32) = *(unsigned char *)(a1 + 32);
  uint64_t result = MEMORY[0x1A6239EB0](*(void *)(a1 + 40));
  *(void *)(a2 + 40) = result;
  return result;
}

- (id)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  objc_destroyWeak(a1 + 2);
  return a1;
}

- (void)prepareFlyoverAnimation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  memset(v12, 0, 24);
  if (v6) {
    [v6 cameraPathAtIndex:0];
  }
  [(VKCameraController *)self beginRegionChange:1];
  [(VKCameraController *)self camera];
  *(_OWORD *)(v10 + 8) = *(_OWORD *)((char *)v12 + 8);
  *(void *)(v10 + 24) = *(void *)&v12[0];
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v11->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v11);
  }
  [(VKCameraController *)self camera];
  *(void *)(v10 + 32) = 0;
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v11->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v11);
  }
  [(VKCameraController *)self camera];
  *(void *)(v10 + 40) = 0;
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v11->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v11);
  }
  [(VKCameraController *)self camera];
  long double v8 = fmod(0.0 + 3.14159265, 6.28318531);
  *(long double *)(v10 + 48) = fmod(v8 + 6.28318531, 6.28318531) + -3.14159265;
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v11->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v11);
  }
  [(VKCameraController *)self camera];
  *(void *)(v10 + 56) = 0;
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v11->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v11);
  }
  int8x8_t v9 = [(VKCameraController *)self cameraDelegate];
  [v9 mapLayerDidChangeVisibleRegion];

  [(VKCameraController *)self endRegionChange];
}

- (id)createFlyoverPreTourAnimation:(id)a3 duration:(double)a4
{
  void (**v15)(void *__return_ptr, void, float);
  double v16;
  void *v17;
  double v18;
  uint64_t v19;
  float v20;
  float v21;
  BOOL v22;
  double v23;
  double v24;
  float v25;
  int8x16_t v26;
  id v27;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  uint64_t v33;
  int8x16_t v34;
  int8x16_t v35;
  long long v36;
  uint64_t v37;
  int8x16_t v38;
  int8x16_t v39;
  _OWORD v40[3];
  uint64_t v41;
  long long v42;
  _OWORD v43[3];
  int8x16_t v44;
  uint64_t v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  void v48[11007];
  uint64_t vars8;

  uint64_t v4 = MEMORY[0x1F4188790](self);
  double v6 = v5;
  id v7 = (void *)v4;
  v48[11006] = *MEMORY[0x1E4F143B8];
  id v9 = v8;
  uint64_t v10 = v9;
  uint64_t v45 = 0;
  char v44 = 0u;
  memset(v43, 0, sizeof(v43));
  uint8x8_t v42 = 0u;
  if (v9) {
    [v9 cameraPathAtIndex:0];
  }
  [v7 camera];
  long long v11 = *(_OWORD *)(v46 + 8);
  long long v12 = *(_OWORD *)(v46 + 24);
  long long v13 = *(_OWORD *)(v46 + 40);
  uint64_t v14 = *(void *)(v46 + 56);
  if (v47 && !atomic_fetch_add(&v47->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v30 = v12;
    uint64_t v31 = v13;
    uint64_t v29 = v11;
    ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
    std::__shared_weak_count::__release_weak(v47);
    long long v11 = v29;
    long long v12 = v30;
    long long v13 = v31;
  }
  v40[0] = v11;
  v40[1] = v12;
  v40[2] = v13;
  int v41 = v14;
  float v36 = *(_OWORD *)((char *)v43 + 8);
  unint64_t v37 = *(void *)&v43[0];
  uint64_t v38 = vextq_s8(v44, v44, 8uLL);
  double v39 = vextq_s8(*(int8x16_t *)((char *)&v43[1] + 8), *(int8x16_t *)((char *)&v43[1] + 8), 8uLL);
  int8x8_t v15 = [v7 createMoveToZoomOutZoomInFrameFunction:v40 toLatLon:&v36];
  uint64_t v16 = v6 * 0.001;
  unint64_t v17 = v48;
  BOOL v18 = 0.0;
  unint64_t v19 = 1001;
  do
  {
    uint8x8_t v20 = v18;
    uint8x8_t v21 = v20 + v20;
    uint64_t v22 = v21 < 1.0;
    id v23 = (float)((float)((float)(v21 + -2.0) * (float)(v21 + -2.0)) * (float)(v21 + -2.0)) * 0.5 + 1.0;
    uint64_t v24 = v21 * v21 * (0.5 * v21);
    if (!v22) {
      uint64_t v24 = v23;
    }
    BOOL v25 = v24;
    ((void (**)(long long *__return_ptr, void, float))v15)[2](&v32, v15, v25);
    *(v17 - 3) = v33;
    uint64_t v26 = vextq_s8(v35, v35, 8uLL);
    *((_OWORD *)v17 - 1) = v32;
    *(int8x16_t *)unint64_t v17 = v26;
    *(int8x16_t *)(v17 + 3) = vextq_s8(v34, v34, 8uLL);
    *((double *)v17 + 2) = v16;
    *(v17 - 5) = 0x3F80000000000000;
    BOOL v18 = v18 + 0.001;
    v17 += 11;
    --v19;
  }
  while (v19);
  uint8x8_t v27 = objc_alloc_init(MEMORY[0x1E4F647D0]);
  [v27 setCameraPaths:&v46 count:1001];

  return v27;
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
  v65[2] = __73__VKMapCameraController_createMoveToZoomOutZoomInFrameFunction_toLatLon___block_invoke;
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
  uint64_t v38 = (void *)[v65 copy];
  return v38;
}

long double __73__VKMapCameraController_createMoveToZoomOutZoomInFrameFunction_toLatLon___block_invoke@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
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

- (double)minimumZoomLevel
{
  [(VKMapCameraController *)self currentMinimumNormalizedZoomLevel];
  return v2;
}

- (void)setRegionRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [(VKScreenCameraController *)self regionRestriction];
  char v11 = [v10 isEqual:v8];

  if ((v11 & 1) == 0)
  {
    v28.receiver = self;
    v28.super_class = (Class)VKMapCameraController;
    [(VKScreenCameraController *)&v28 setRegionRestriction:v8 duration:v9 timingFunction:a4];
    [(VKMapCameraController *)self centerCoordinate];
    double v13 = v12;
    double v15 = v14;
    long double v16 = [(VKScreenCameraController *)self regionRestriction];
    char v17 = objc_msgSend(v16, "containsCoordinate:", v13, v15);

    if ((v17 & 1) == 0)
    {
      double v18 = [(VKScreenCameraController *)self regionRestriction];
      objc_msgSend(v18, "clampedCoordinate:", v13, v15);
      double v20 = v19;
      double v22 = v21;

      [(VKMapCameraController *)self altitude];
      double v24 = v23;
      [(VKMapCameraController *)self yaw];
      double v26 = v25;
      [(VKMapCameraController *)self pitch];
      -[VKMapCameraController setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:forceDestination:completion:](self, "setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:forceDestination:completion:", 1, VKAnimationCurveEaseInOut, 1, 0, v20, v22, v24, v26, v27, a4);
    }
  }
}

- (void)animateRegionWithDuration:(double)a3 timingFunction:(id)a4 stepHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  double v12 = (void (**)(id, void))a6;
  [(VKAnimation *)self->super._regionAnimation stop];
  if (self->super._regionAnimation)
  {
    if (v12) {
      v12[2](v12, 0);
    }
  }
  else
  {
    double v13 = [[VKTimedAnimation alloc] initWithDuration:a3];
    regionAnimation = self->super._regionAnimation;
    self->super._regionAnimation = v13;

    if (v10) {
      double v15 = v10;
    }
    else {
      double v15 = VKAnimationCurveEaseInOut;
    }
    [(VKTimedAnimation *)self->super._regionAnimation setTimingFunction:v15];
    [(VKTimedAnimation *)self->super._regionAnimation setStepHandler:v11];
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __96__VKMapCameraController_animateRegionWithDuration_timingFunction_stepHandler_completionHandler___block_invoke;
    v16[3] = &unk_1E5A98E30;
    objc_copyWeak(&v18, &location);
    char v17 = v12;
    [(VKAnimation *)self->super._regionAnimation setCompletionHandler:v16];
    [(VKCameraController *)self beginRegionChange:1];
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._regionAnimation->super);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __96__VKMapCameraController_animateRegionWithDuration_timingFunction_stepHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = (void *)WeakRetained[20];
    WeakRetained[20] = 0;

    if ([WeakRetained mapEngine])
    {
      [WeakRetained endRegionChange];
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5) {
        (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
      }
    }
  }
}

- (void)setCenterCoordinateDistanceRange:(id *)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8 = a5;
  uint64_t v52 = 0;
  double v53 = 0.0;
  uint64_t v54 = 0;
  [(VKScreenCameraController *)self centerCoordinateDistanceRange];
  double var0 = a3->var0;
  if (a3->var0 != 0.0 || (double var0 = a3->var1, var0 != v53) || a3->var2 != v54)
  {
    [(VKMapCameraController *)self distanceFromCenterCoordinate];
    double v11 = v10;
    double v12 = a3->var0;
    if (a3->var0 < 0.0)
    {
      double v13 = self;
      double v14 = [(VKCameraController *)v13 canvas];
      [v14 size];
      double v16 = v15;

      float v17 = 20.0;
      if (v16 > 0.0)
      {
        uint64_t v18 = [(VKMapCameraController *)v13 tileSize];
        double v19 = [(VKCameraController *)v13 canvas];
        [v19 size];
        double v21 = log2((double)v18 / v20);

        float v17 = v21 + 20.0;
      }

      double v22 = [(VKCameraController *)v13 vkCamera];
      double v23 = VKCameraDistanceForDisplayZoomLevel(v17, v22);

      [(VKMapCameraController *)v13 centerCoordinate];
      double v25 = v24;
      long double v26 = cos(v24 * 0.034906585) * -559.82 + 111132.92;
      long double v27 = v26 + cos(v25 * 0.0698131701) * 1.175;
      long double v28 = v27 + cos(v25 * 0.104719755) * -0.0023;
      double v29 = v25 * 0.00872664626;
      long double v30 = tan(v25 * 0.00872664626 + 0.78103484);
      double v31 = log(v30);
      long double v32 = tan(v29 + 0.789761487);
      double v12 = v28 * v23 / fabs((log(v32) - v31) * 0.159154943);
    }
    if (v11 < v12
      || (double var1 = a3->var1, var1 >= 0.0)
      && ([(VKMapCameraController *)self distanceFromCenterCoordinate], var1 < v34))
    {
      if (a4 <= 0.0)
      {
        long long v40 = *(_OWORD *)&a3->var0;
        uint64_t v41 = *(void *)&a3->var2;
        v39.receiver = self;
        v39.super_class = (Class)VKMapCameraController;
        [(VKScreenCameraController *)&v39 setCenterCoordinateDistanceRange:&v40 duration:0 timingFunction:0.0];
        [(VKCameraController *)self beginRegionChange:0];
        [(VKScreenCameraController *)self clampZoomLevelIfNecessary];
        [(VKMapCameraController *)self snapMapIfNecessary:0];
        double v35 = [(VKCameraController *)self cameraDelegate];
        [v35 mapLayerDidChangeVisibleRegion];

        [(VKCameraController *)self endRegionChange];
      }
      else
      {
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __82__VKMapCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke;
        v46[3] = &unk_1E5A8DEF8;
        long long v48 = *(_OWORD *)&a3->var0;
        uint64_t v49 = *(void *)&a3->var2;
        double v50 = v11;
        double v51 = v12;
        v46[4] = self;
        id v47 = v8;
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        int64x2_t v42[2] = __82__VKMapCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke_2;
        void v42[3] = &unk_1E5A8DF20;
        long long v44 = *(_OWORD *)&a3->var0;
        uint64_t v45 = *(void *)&a3->var2;
        void v42[4] = self;
        id v43 = v47;
        [(VKMapCameraController *)self animateRegionWithDuration:v43 timingFunction:v46 stepHandler:v42 completionHandler:a4];
      }
    }
    else
    {
      long long v37 = *(_OWORD *)&a3->var0;
      uint64_t v38 = *(void *)&a3->var2;
      v36.receiver = self;
      v36.super_class = (Class)VKMapCameraController;
      [(VKScreenCameraController *)&v36 setCenterCoordinateDistanceRange:&v37 duration:0 timingFunction:0.0];
      [(VKMapCameraController *)self updateCameraZBounds];
    }
  }
}

void __82__VKMapCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke(uint64_t a1, float a2)
{
  double v3 = *(double *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  double v5 = *(double *)(a1 + 72);
  double v6 = a2;
  double v7 = v5 + (*(double *)(a1 + 80) - v5) * v6;
  double v8 = v5 + (v3 - v5) * v6;
  if (v3 < 0.0) {
    double v8 = *(double *)(a1 + 56);
  }
  *(double *)double v12 = v7;
  *(double *)&v12[1] = v8;
  _OWORD v12[2] = v4;
  uint64_t v9 = *(void *)(a1 + 40);
  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)VKMapCameraController;
  objc_msgSendSuper2(&v11, sel_setCenterCoordinateDistanceRange_duration_timingFunction_, v12, v9, 0.0);
  [*(id *)(a1 + 32) clampZoomLevelIfNecessary];
  [*(id *)(a1 + 32) snapMapIfNecessary:0];
  double v10 = [*(id *)(a1 + 32) cameraDelegate];
  [v10 mapLayerDidChangeVisibleRegion];
}

id __82__VKMapCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke_2(uint64_t a1)
{
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)VKMapCameraController;
  return objc_msgSendSuper2(&v3, sel_setCenterCoordinateDistanceRange_duration_timingFunction_, &v4, v1, 0.0);
}

- (double)distanceFromCenterCoordinate
{
  [(VKMapCameraController *)self altitude];
  double v4 = v3;
  uint64_t v5 = [(VKCameraController *)self vkCamera];
  [v5 pitch];
  double v7 = v4 / cos(v6);

  return v7;
}

- (void)setCenterCoordinate3D:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  double var2 = a3.var2;
  double var1 = a3.var1;
  long double v19 = tan(a3.var0 * 0.00872664626 + 0.785398163);
  double v20 = log(v19) * 0.159154943 + 0.5;
  if (a8 == 2) {
    double v21 = 0.0;
  }
  else {
    double v21 = a7;
  }
  -[VKMapCameraController _animateToPosition:pitch:yaw:duration:timingCurve:completion:](self, "_animateToPosition:pitch:yaw:duration:timingCurve:completion:", a9, a10, var1 * 0.00277777778 + 0.5, v20, var2, a6, a5, v21);
}

void __103__VKMapCameraController__animateToPosition_pitch_yaw_duration_timingCurve_forceDestination_completion___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = [WeakRetained isPitched];
    double v7 = a2;
    double v9 = *(double *)(a1 + 48);
    double v8 = *(double *)(a1 + 56);
    double v10 = *(double *)(a1 + 64);
    double v37 = *(double *)(a1 + 72);
    double v38 = *(double *)(a1 + 80);
    double v11 = *(double *)(a1 + 96);
    double v39 = *(double *)(a1 + 88);
    long double v12 = fmod(3.14159265 - v11 + *(double *)(a1 + 104), 6.28318531);
    long double v13 = fmod(v12 + 6.28318531, 6.28318531);
    long double v14 = fmod(v11 + 3.14159265 + (v13 + -3.14159265) * a2, 6.28318531);
    double v15 = fmod(v14 + 6.28318531, 6.28318531);
    __double2 v16 = __sincos_stret((*(double *)(a1 + 112) + (*(double *)(a1 + 120) - *(double *)(a1 + 112)) * v7) * 0.5);
    __double2 v17 = __sincos_stret(v15 * 0.5 + -1.57079633);
    double v44 = v17.__cosval * v16.__sinval;
    double v45 = v17.__sinval * v16.__sinval;
    double v46 = v17.__sinval * v16.__cosval;
    double v47 = v17.__cosval * v16.__cosval;
    uint64_t v18 = [v5 vkCamera];
    [v18 setOrientation:&v44];
    double v19 = v9 + (v37 - v9) * v7;
    double v20 = v8 + (v38 - v8) * v7;
    double v21 = v10 + (v39 - v10) * v7;

    double v22 = *(double *)(a1 + 128) + (*(double *)(a1 + 136) - *(double *)(a1 + 128)) * v7;
    double v23 = (v22 - v21) * (v45 + v45);
    double v24 = v44 * -2.0 * (v22 - v21);
    v43[0] = v19 + v23 * v47 - v24 * v46;
    v43[1] = v20 + v23 * v46 + v24 * v47;
    v43[2] = v22 + v24 * v44 - v23 * v45;
    double v25 = [v5 vkCamera];
    [v25 setPosition:v43];

    [v5 clampZoomLevelIfNecessary];
    long double v26 = [v5 vkCamera];
    [v5 centerScreenPoint];
    if (v26)
    {
      objc_msgSend(v26, "groundPointFromScreenPoint:");
    }
    else
    {
      long long v41 = 0u;
      long long v42 = 0u;
    }

    if ((_BYTE)v41)
    {
      double v27 = *((double *)&v41 + 1);
      long long v28 = v42;
      double v29 = [v5 vkCamera];
      long double v30 = (double *)[v29 position];
      double v31 = v30[1];
      double v32 = v30[2];
      v40[0] = v19 - v27 + *v30;
      v40[1] = v20 - *(double *)&v28 + v31;
      v40[2] = v21 - *((double *)&v28 + 1) + v32;
      __double2 v33 = [v5 vkCamera];
      [v33 setPosition:v40];
    }
    objc_msgSend(v5, "clampZoomLevelIfNecessary", *(void *)&v37, *(void *)&v38, *(void *)&v39);
    double v34 = [v5 cameraDelegate];
    [v34 mapLayerDidChangeVisibleRegion];

    uint64_t v35 = [v5 isPitched];
    if (v6 != v35)
    {
      objc_super v36 = [v5 cameraDelegate];
      [v36 mapLayerDidBecomePitched:v35];
    }
  }
}

void __103__VKMapCameraController__animateToPosition_pitch_yaw_duration_timingCurve_forceDestination_completion___block_invoke_27(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v4 = (void *)*((void *)WeakRetained + 20);
    *((void *)WeakRetained + 20) = 0;

    if ([WeakRetained mapEngine])
    {
      if ((a2 & 1) == 0 && *(unsigned char *)(a1 + 88)) {
        objc_msgSend(WeakRetained, "_jumpToCenterPoint:pitchRadians:yawRadians:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
      }
      [WeakRetained endRegionChange];
      [*((id *)WeakRetained + 23) resumeAnimation];
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5) {
        (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
      }
    }
  }
}

- (double)durationToAnimateToMapRegion:(id)a3
{
  double v4 = [(VKCameraController *)self vkCamera];
  [(VKCameraController *)self centerScreenPoint];
  if (v4)
  {
    objc_msgSend(v4, "groundPointFromScreenPoint:");
  }
  else
  {
    long long v12 = 0u;
    float64x2_t v13 = 0u;
  }

  if (!(_BYTE)v12) {
    return 0.0;
  }
  uint64_t v5 = [(VKCameraController *)self vkCamera];
  uint64_t v6 = [v5 position];
  double v7 = *(double *)v6;
  float64x2_t v11 = *(float64x2_t *)(v6 + 8);

  float64x2_t v8 = vsubq_f64(v11, v13);
  float64x2_t v9 = vmulq_f64(v8, v8);
  return fmax(fmin(sqrt(v9.f64[0] + (v7 - *((double *)&v12 + 1)) * (v7 - *((double *)&v12 + 1)) + v9.f64[1]) * 1300.0, 1.0), 0.200000003);
}

- (void)setYaw:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  [(VKAnimation *)self->super._regionAnimation stop];
  if (!self->super._regionAnimation)
  {
    [(VKMapCameraController *)self yaw];
    if (vabdd_f64(a3, v7) >= 0.000001)
    {
      [(VKMapCameraController *)self yaw];
      double v9 = v8;
      self->_finalYaw = a3;
      [(VKMapCameraController *)self pitch];
      self->_finalPitch = v10;
      long double v11 = fmod((v9 - a3) * 0.0174532925 + 3.14159265, 6.28318531);
      double v12 = fmod(v11 + 6.28318531, 6.28318531);
      float64x2_t v13 = [(VKCameraController *)self vkCamera];
      uint64_t v14 = [v13 position];
      long long v42 = *(_OWORD *)v14;
      uint64_t v43 = *(void *)(v14 + 16);

      double v15 = [(VKCameraController *)self vkCamera];
      uint64_t v16 = [v15 orientation];
      long long v40 = *(_OWORD *)v16;
      uint64_t v41 = *(void *)(v16 + 16);
      uint64_t v17 = *(void *)(v16 + 24);

      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3321888768;
      v34[2] = __41__VKMapCameraController_setYaw_animated___block_invoke;
      v34[3] = &unk_1EF58EB40;
      v34[4] = self;
      long long v35 = v42;
      uint64_t v36 = v43;
      long long v37 = v40;
      uint64_t v38 = v41;
      uint64_t v39 = v17;
      uint64_t v18 = (void (**)(void, double))MEMORY[0x1A6239EB0](v34);
      double v19 = v12 + -3.14159265;
      if (v4)
      {
        double v20 = [[VKTimedAnimation alloc] initWithDuration:0.200000003];
        regionAnimation = self->super._regionAnimation;
        self->super._regionAnimation = v20;

        [(VKTimedAnimation *)self->super._regionAnimation setTimingFunction:VKAnimationCurveEaseInOut];
        [(VKCameraController *)self beginRegionChange:1];
        objc_initWeak(&location, self);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __41__VKMapCameraController_setYaw_animated___block_invoke_26;
        v30[3] = &unk_1E5A8DE08;
        double v32 = v19;
        double v22 = v18;
        id v31 = v22;
        [(VKTimedAnimation *)self->super._regionAnimation setStepHandler:v30];
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        long double v26 = __41__VKMapCameraController_setYaw_animated___block_invoke_2;
        double v27 = &unk_1E5A99078;
        objc_copyWeak(v29, &location);
        long long v28 = v22;
        v29[1] = *(id *)&v19;
        [(VKAnimation *)self->super._regionAnimation setCompletionHandler:&v24];
        md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._regionAnimation->super);

        objc_destroyWeak(v29);
        objc_destroyWeak(&location);
      }
      else
      {
        [(VKCameraController *)self beginRegionChange:0];
        v18[2](v18, v19);
        uint64_t v23 = *(void *)[(VKCameraController *)self runLoopController];
        if (v23)
        {
          LOBYTE(location) = 4;
          md::MapEngine::setNeedsTick(v23, &location);
        }
        [(VKCameraController *)self endRegionChange];
      }
    }
  }
}

void __41__VKMapCameraController_setYaw_animated___block_invoke(uint64_t a1, double a2)
{
  BOOL v4 = [*(id *)(a1 + 32) vkCamera];
  [*(id *)(a1 + 32) centerScreenPoint];
  if (v4)
  {
    objc_msgSend(v4, "groundPointFromScreenPoint:");
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
  }

  if ((_BYTE)v25)
  {
    __double2 v5 = __sincos_stret(a2 * 0.5);
    double v6 = *(double *)(a1 + 40);
    double v7 = *(double *)(a1 + 48);
    double v8 = *(double *)(a1 + 56);
    double v9 = v5.__sinval * -2.0 * (v7 - *(double *)&v26);
    double v10 = v5.__sinval * (v6 - *((double *)&v25 + 1) + v6 - *((double *)&v25 + 1));
    v24[0] = v6 - v10 * v5.__sinval + v9 * v5.__cosval;
    v24[1] = v7 + v10 * v5.__cosval + v9 * v5.__sinval;
    v24[2] = v8;
    long double v11 = [*(id *)(a1 + 32) vkCamera];
    [v11 setPosition:v24];

    float64x2_t v12 = *(float64x2_t *)(a1 + 64);
    float64x2_t v13 = *(float64x2_t *)(a1 + 80);
    float64x2_t v14 = vmulq_n_f64(v12, v5.__cosval);
    int8x16_t v15 = (int8x16_t)vmulq_n_f64(v12, v5.__sinval);
    float64x2_t v16 = (float64x2_t)vextq_s8(v15, v15, 8uLL);
    *(void *)&long long v17 = *(_OWORD *)&vsubq_f64(v14, v16);
    *((void *)&v17 + 1) = *(void *)&vaddq_f64(v14, v16).f64[1];
    float64x2_t v18 = vmulq_n_f64(v13, v5.__cosval);
    int8x16_t v19 = (int8x16_t)vmulq_n_f64(v13, v5.__sinval);
    float64x2_t v20 = (float64x2_t)vextq_s8(v19, v19, 8uLL);
    *(void *)&v14.f64[0] = *(_OWORD *)&vaddq_f64(v18, v20);
    v14.f64[1] = vsubq_f64(v18, v20).f64[1];
    v23[0] = v17;
    v23[1] = v14;
    double v21 = [*(id *)(a1 + 32) vkCamera];
    [v21 setOrientation:v23];

    double v22 = [*(id *)(a1 + 32) cameraDelegate];
    [v22 mapLayerDidChangeVisibleRegion];
  }
}

uint64_t __41__VKMapCameraController_setYaw_animated___block_invoke_26(uint64_t a1, float a2)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 40) * a2);
}

void __41__VKMapCameraController_setYaw_animated___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v4 = (void *)WeakRetained[20];
    WeakRetained[20] = 0;

    if ([WeakRetained mapEngine])
    {
      if (a2) {
        (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 48));
      }
      [WeakRetained endRegionChange];
    }
  }
}

- (double)yaw
{
  regionAnimation = self->super._regionAnimation;
  if (regionAnimation && [(VKAnimation *)regionAnimation running]) {
    return self->_finalYaw;
  }
  __double2 v5 = [(VKCameraController *)self vkCamera];
  [v5 yaw];
  double v4 = v6 * 57.2957795;

  return v4;
}

- (double)presentationYaw
{
  float v2 = [(VKCameraController *)self vkCamera];
  [v2 yaw];
  double v4 = v3 * 57.2957795;

  return v4;
}

- (void)updateCameraToPositionOrientationLimits
{
  [(VKScreenCameraController *)self clampZoomLevelIfNecessary];
  [(VKMapCameraController *)self snapMapIfNecessary:0];
}

void __59__VKMapCameraController_clampZoomLevelIfNecessaryAnimated___block_invoke(uint64_t a1, float a2)
{
  double v3 = objc_msgSend(*(id *)(a1 + 32), "vkCamera", vmlaq_n_f64(*(float64x2_t *)(a1 + 40), vsubq_f64(*(float64x2_t *)(a1 + 64), *(float64x2_t *)(a1 + 40)), a2), *(double *)(a1 + 56) + (*(double *)(a1 + 80) - *(double *)(a1 + 56)) * a2);
  [v3 setPosition:&v5];

  double v4 = [*(id *)(a1 + 32) cameraDelegate];
  [v4 mapLayerDidChangeVisibleRegion];
}

uint64_t __59__VKMapCameraController_clampZoomLevelIfNecessaryAnimated___block_invoke_2(uint64_t a1)
{
  double v3 = *(void **)(a1 + 32);
  float v2 = *(void **)(a1 + 40);
  if (v3 == (void *)v2[17])
  {
    v2[17] = 0;

    float v2 = *(void **)(a1 + 40);
  }
  [v2 clampZoomLevelIfNecessaryAnimated:0];
  double v4 = *(void **)(a1 + 40);
  return [v4 endRegionChange];
}

- (void)setGesturing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VKMapCameraController;
  -[VKCameraController setGesturing:](&v5, sel_setGesturing_);
  [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setGesturing:v3];
  if (self->_tourShouldResumeWhenDoneGesturing)
  {
    if (v3) {
      [(VKMapCameraController *)self pauseFlyoverTourAnimation];
    }
    else {
      [(VKMapCameraController *)self resumeFlyoverTourAnimation];
    }
  }
}

- (void)panWithOffset:(CGPoint)a3 relativeToScreenPoint:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  double y = a4.y;
  double x = a4.x;
  double v11 = a3.y;
  double v12 = a3.x;
  float64x2_t v14 = (void (**)(void))a7;
  double v47 = a6;
  BOOL v15 = a6 > 0.0 && v8;
  float64x2_t v16 = [(VKCameraController *)self canvas];
  [v16 size];
  double v18 = v17;
  int8x16_t v19 = [(VKCameraController *)self canvas];
  [v19 size];
  double v21 = v20;

  double v22 = [(VKCameraController *)self canvas];
  [v22 size];
  double v24 = v23;
  long long v25 = [(VKCameraController *)self canvas];
  [v25 size];
  double v27 = v26;

  long long v28 = [(VKCameraController *)self vkCamera];
  double v29 = v28;
  double v30 = x / v18;
  double v31 = 1.0 - y / v21;
  if (v28)
  {
    objc_msgSend(v28, "groundPointFromScreenPoint:", v12 / v24 + v30, v31 - v11 / v27);
  }
  else
  {
    long long v59 = 0u;
    *(_OWORD *)double v60 = 0u;
  }

  double v32 = [(VKCameraController *)self vkCamera];
  __double2 v33 = v32;
  if (v32)
  {
    objc_msgSend(v32, "groundPointFromScreenPoint:", v30, v31);
  }
  else
  {
    long long v57 = 0u;
    long long v58 = 0u;
  }

  if ((_BYTE)v59 && (_BYTE)v57)
  {
    double v34 = [(VKCameraController *)self vkCamera];
    long long v35 = (double *)[v34 position];
    double v36 = *v35;
    double v37 = v35[1];
    double v38 = v35[2];

    uint64_t v39 = [(VKCameraController *)self vkCamera];
    [(VKCameraController *)self centerScreenPoint];
    if (v39)
    {
      objc_msgSend(v39, "groundPointFromScreenPoint:");
    }
    else
    {
      long long v55 = 0u;
      long long v56 = 0u;
    }

    -[VKMapCameraController positionClampedToCameraRestriction:](self, "positionClampedToCameraRestriction:", *((double *)&v57 + 1) - *((double *)&v59 + 1) + *((double *)&v55 + 1), *(double *)&v58 - v60[0] + *(double *)&v56, *((double *)&v56 + 1));
    *(double *)&long long v53 = v40 + v36 - *((double *)&v55 + 1);
    *((double *)&v53 + 1) = v41 + v37 - *(double *)&v56;
    double v54 = v42 + v38 - *((double *)&v56 + 1);
    if (v15)
    {
      uint64_t v43 = [[VKTimedAnimation alloc] initWithDuration:v47];
      [(VKTimedAnimation *)v43 setTimingFunction:VKAnimationCurveLinear];
      [(VKCameraController *)self beginRegionChange:1];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __97__VKMapCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke;
      v50[3] = &unk_1E5A8DE58;
      v50[4] = self;
      *(double *)&v50[5] = v36;
      *(double *)&v50[6] = v37;
      *(double *)&v50[7] = v38;
      long long v51 = v53;
      double v52 = v54;
      [(VKTimedAnimation *)v43 setStepHandler:v50];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __97__VKMapCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke_2;
      v48[3] = &unk_1E5A8DE80;
      v48[4] = self;
      uint64_t v49 = v14;
      [(VKAnimation *)v43 setCompletionHandler:v48];
      md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &v43->super);
    }
    else
    {
      [(VKCameraController *)self beginRegionChange:0];
      uint64_t v44 = [(VKCameraController *)self vkCamera];
      [v44 setPosition:&v53];

      double v45 = [(VKCameraController *)self cameraDelegate];
      [v45 mapLayerDidChangeVisibleRegion];

      uint64_t v46 = *(void *)[(VKCameraController *)self runLoopController];
      if (v46)
      {
        char v61 = 4;
        md::MapEngine::setNeedsTick(v46, &v61);
      }
      [(VKCameraController *)self endRegionChange];
      if (v14) {
        v14[2](v14);
      }
    }
  }
  else if (v14)
  {
    v14[2](v14);
  }
}

void __97__VKMapCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke(uint64_t a1, float a2)
{
  BOOL v3 = objc_msgSend(*(id *)(a1 + 32), "vkCamera", vmlaq_n_f64(*(float64x2_t *)(a1 + 40), vsubq_f64(*(float64x2_t *)(a1 + 64), *(float64x2_t *)(a1 + 40)), a2), *(double *)(a1 + 56) + (*(double *)(a1 + 80) - *(double *)(a1 + 56)) * a2);
  [v3 setPosition:&v5];

  double v4 = [*(id *)(a1 + 32) cameraDelegate];
  [v4 mapLayerDidChangeVisibleRegion];
}

uint64_t __97__VKMapCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) mapEngine];
  if (result)
  {
    [*(id *)(a1 + 32) endRegionChange];
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      BOOL v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  return result;
}

- (double)maxPitch
{
  [(VKMapCameraController *)self currentNormalizedZoomLevel];
  -[VKMapCameraController maxPitchForNormalizedZoomLevel:](self, "maxPitchForNormalizedZoomLevel:");
  return v3 * 57.2957795;
}

- (double)minPitch
{
  [(VKMapCameraController *)self currentNormalizedZoomLevel];
  -[VKMapCameraController minimumPitchForNormalizedZoomLevel:](self, "minimumPitchForNormalizedZoomLevel:");
  return v3 * 57.2957795;
}

- (BOOL)isFullyPitched
{
  float v3 = [(VKCameraController *)self vkCamera];
  [v3 pitch];
  double v5 = v4;
  double v6 = [(VKCameraController *)self vkCamera];
  [v6 maxPitch];
  BOOL v8 = v5 >= v7;

  return v8;
}

- (void)exit3DMode
{
  id v4 = [(VKCameraController *)self vkCamera];
  [v4 maxPitch];
  [(VKMapCameraController *)self rotateToPitch:0 withPoint:0 preserveAltitude:1 animated:1 exaggerate:0.0 maxPitch:v3];
}

- (void)enter3DMode
{
  double v3 = [(VKCameraController *)self vkCamera];
  id v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "groundPointFromScreenPoint:", 0.5, 0.5);
  }
  else
  {
    long long v41 = 0u;
    long long v42 = 0u;
  }

  if ((_BYTE)v41)
  {
    double v5 = [(VKCameraController *)self vkCamera];
    double v6 = (double *)[v5 position];
    double v7 = v6[1];
    double v40 = *v6;
    double v8 = v6[2];

    double v9 = [(VKCameraController *)self vkCamera];
    [v9 forwardVector];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    float64x2_t v16 = [(VKCameraController *)self vkCamera];
    [v16 widthOfViewAtDepth:(*((double *)&v41 + 1) - v40) * v11 + (*(double *)&v42 - v7) * v13 + (*((double *)&v42 + 1) - v8) * v15];
    double v18 = 0.0;
    if (v17 > 0.0)
    {
      float v19 = log2(v17);
      double v18 = (float)-v19;
    }

    double v20 = self;
    double v21 = [(VKCameraController *)v20 canvas];
    [v21 size];
    double v23 = v22;

    double v24 = 0.0;
    if (v23 > 0.0)
    {
      double v21 = [(VKCameraController *)v20 canvas];
      [v21 size];
      double v24 = log2(v25 / (double)[(VKMapCameraController *)v20 tileSize]);
    }
    float v26 = v24 + v18;

    mapEngine = v20->_mapEngine;
    if (!mapEngine[1241]) {
      goto LABEL_16;
    }
    double v29 = (uint64_t *)*((void *)mapEngine + 141);
    uint64_t v30 = *v29;
    uint64_t v31 = v29[1];
    if (v30 != v31)
    {
      while (*(unsigned char *)v30 != 20)
      {
        v30 += 16;
        if (v30 == v31) {
          goto LABEL_17;
        }
      }
    }
    if (v30 == v31)
    {
LABEL_17:
      LOBYTE(v32) = 0;
    }
    else
    {
      unsigned int v32 = *(_DWORD *)(v30 + 8);
      if (v32 >= 0xB)
      {
LABEL_16:
        *(float *)&double v27 = v26;
        [(VKMapCameraController *)v20 idealPitchForNormalizedZoomLevel:v27];
        double v34 = v33;
        goto LABEL_19;
      }
    }
    unsigned int v35 = 0x418u >> v32;
    *(float *)&double v27 = v26;
    [(VKMapCameraController *)v20 idealPitchForNormalizedZoomLevel:v27];
    double v34 = v36;
    if (v35)
    {
      char v39 = 1;
      double v38 = v36;
LABEL_21:
      [(VKMapCameraController *)v20 rotateToPitch:0 withPoint:0 preserveAltitude:1 animated:1 exaggerate:v34 maxPitch:v38];
      if ((v39 & 1) == 0) {

      }
      return;
    }
LABEL_19:
    double v21 = [(VKCameraController *)v20 vkCamera];
    [v21 maxPitch];
    double v38 = v37;
    char v39 = 0;
    goto LABEL_21;
  }
}

- (void)zoomToLevel:(double)a3 withFocusPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v8 = [(VKCameraController *)self vkCamera];
  -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
  if (v8)
  {
    objc_msgSend(v8, "groundPointFromScreenPoint:");
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }

  if ((_BYTE)v9) {
    -[VKMapCameraController zoomToLevel:withPoint:](self, "zoomToLevel:withPoint:", a3, *((double *)&v9 + 1), v10);
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
    unsigned int v36 = v9;
    double v15 = [VKMapAnnotationTrackingCameraController alloc];
    float64x2_t v16 = [(VKCameraController *)self mapDataAccess];
    long double v17 = [(VKCameraController *)self animationRunner];
    double v18 = [(VKCameraController *)self runLoopController];
    float v19 = [(VKCameraController *)self cameraDelegate];
    double v20 = [(VKAnnotationTrackingCameraController *)v15 initWithMapDataAccess:v16 animationRunner:v17 runLoopController:v18 cameraDelegate:v19];
    double v21 = self->super._annotationTrackingCameraController;
    self->super._annotationTrackingCameraController = v20;

    double v22 = [(VKCameraController *)self vkCamera];
    [(VKCameraController *)self->super._annotationTrackingCameraController setVkCamera:v22];

    double v23 = (int8x8_t *)*((void *)self->_mapEngine + 140);
    int8x8_t v24 = v23[2];
    if (v24)
    {
      uint8x8_t v25 = (uint8x8_t)vcnt_s8(v24);
      v25.i16[0] = vaddlv_u8(v25);
      if (v25.u32[0] > 1uLL)
      {
        uint64_t v26 = 0x17767EADC5B287BLL;
        if (*(void *)&v24 <= 0x17767EADC5B287BuLL) {
          uint64_t v26 = 0x17767EADC5B287BuLL % *(void *)&v24;
        }
      }
      else
      {
        uint64_t v26 = (*(void *)&v24 - 1) & 0x17767EADC5B287BLL;
      }
      double v27 = *(void **)(*(void *)&v23[1] + 8 * v26);
      if (v27)
      {
        long long v28 = (void *)*v27;
        if (v28)
        {
          if (v25.u32[0] < 2uLL)
          {
            uint64_t v29 = *(void *)&v24 - 1;
            while (1)
            {
              uint64_t v31 = v28[1];
              if (v31 == 0x17767EADC5B287BLL)
              {
                if (v28[2] == 0x17767EADC5B287BLL) {
                  goto LABEL_28;
                }
              }
              else if ((v31 & v29) != v26)
              {
                goto LABEL_22;
              }
              long long v28 = (void *)*v28;
              if (!v28) {
                goto LABEL_22;
              }
            }
          }
          do
          {
            unint64_t v30 = v28[1];
            if (v30 == 0x17767EADC5B287BLL)
            {
              if (v28[2] == 0x17767EADC5B287BLL)
              {
LABEL_28:
                uint64_t v32 = v28[5];
                goto LABEL_23;
              }
            }
            else
            {
              if (v30 >= *(void *)&v24) {
                v30 %= *(void *)&v24;
              }
              if (v30 != v26) {
                break;
              }
            }
            long long v28 = (void *)*v28;
          }
          while (v28);
        }
      }
    }
LABEL_22:
    uint64_t v32 = 0;
LABEL_23:
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setElevationLogic:v32];
    float v33 = self->super._annotationTrackingCameraController;
    [(VKCameraController *)self camera];
    [(VKCameraController *)v33 setCamera:v39];
    double v34 = v40;
    if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
    unsigned int v35 = [(VKCameraController *)self canvas];
    [(VKCameraController *)self->super._annotationTrackingCameraController setCanvas:v35];

    long long v37 = *(_OWORD *)&self->super._annotationTrackingBehavior.shouldZoomToFit;
    uint64_t v38 = *(void *)&self->super._annotationTrackingBehavior.shouldPreserveUserSpecifiedZoomLevel;
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setBehavior:&v37];
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setHasUserSpecifiedZoomLevel:self->super._userChangedZoomSinceLastProgrammaticRegionChange];
    [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController setHeadingAnimationDisplayRate:self->super._annotationTrackingHeadingAnimationDisplayRate];
    [(VKCameraController *)self edgeInsets];
    -[VKCameraController setEdgeInsets:](self->super._annotationTrackingCameraController, "setEdgeInsets:");
    annotationTrackingCameraController = self->super._annotationTrackingCameraController;
    uint64_t v9 = v36;
  }
  [(VKAnnotationTrackingCameraController *)annotationTrackingCameraController startTrackingAnnotation:v12 trackHeading:v10 animated:v9 duration:v13 timingFunction:a6];
}

- (void)zoomToLevel:(double)a3 withPoint:()Matrix<double
{
  double v4 = a4._e[2];
  double v5 = a4._e[1];
  double v6 = a4._e[0];
  [(VKMapCameraController *)self currentMinimumNormalizedZoomLevel];
  double v10 = v9;
  [(VKMapCameraController *)self currentMaximumNormalizedZoomLevel];
  double v12 = fmax(v10, a3);
  if (v12 <= v11)
  {
    float v13 = v12;
    float v14 = v13;
  }
  else
  {
    float v14 = v11;
  }
  double v15 = self;
  float64x2_t v16 = [(VKCameraController *)v15 canvas];
  [v16 size];
  double v18 = v17;

  double v19 = 0.0;
  if (v18 > 0.0)
  {
    uint64_t v20 = [(VKMapCameraController *)v15 tileSize];
    double v21 = [(VKCameraController *)v15 canvas];
    [v21 size];
    double v19 = log2((double)v20 / v22);
  }
  float v23 = v19 + v14;
  double v24 = exp2(-v23);
  uint8x8_t v25 = [(VKCameraController *)v15 vkCamera];
  [v25 depthForViewWidth:v24];
  double v27 = v26;

  long long v28 = [(VKCameraController *)v15 vkCamera];
  uint64_t v29 = [v28 footprint];
  [v29 maxDepth];
  double v31 = v30;

  uint64_t v32 = [(VKCameraController *)v15 vkCamera];
  double v33 = *(double *)[v32 position];

  *(double *)v34.i64 = v33 - v6;
  v35.f64[0] = NAN;
  v35.f64[1] = NAN;
  v36.i64[0] = 1.0;
  double v37 = *(double *)vbslq_s8((int8x16_t)vnegq_f64(v35), v36, v34).i64 + v6;
  if (vabdd_f64(v33, v37) >= vabdd_f64(v33, v6)) {
    double v37 = v6;
  }
  -[VKMapCameraController positionClampedToCameraRestriction:](v15, "positionClampedToCameraRestriction:", v37, v5, v4);
  double v39 = v38;
  float64_t v77 = v41;
  float64_t v78 = v40;
  *(double *)float v81 = v40;
  *(double *)&v81[1] = v41;
  *(double *)&v81[2] = v38;
  long long v42 = [(VKCameraController *)v15 vkCamera];
  uint64_t v43 = (float64x2_t *)[v42 position];
  double v44 = 1.0 - v27 / v31;
  double v45 = v43[1].f64[0] + (v39 - v43[1].f64[0]) * v44;
  v46.f64[0] = v78;
  v46.f64[1] = v77;
  float64x2_t v79 = vmlaq_n_f64(*v43, vsubq_f64(v46, *v43), v44);
  double v80 = v45;

  double v47 = [(VKCameraController *)v15 vkCamera];
  double v48 = *(double *)([v47 position] + 16);

  uint64_t v49 = [(VKCameraController *)v15 vkCamera];
  [v49 minHeight];
  double v51 = v50;

  double v52 = [(VKCameraController *)v15 vkCamera];
  [v52 maxHeight];
  double v54 = v53;

  BOOL v55 = v48 < v45 || v45 >= v51;
  BOOL v56 = v48 < v45 && v45 > v54;
  if (!v55 || v56)
  {
    long long v58 = [(VKCameraController *)v15 vkCamera];
    [v58 minHeight];
    double v60 = v59;
    char v61 = [(VKCameraController *)v15 vkCamera];
    [v61 maxHeight];
    double v80 = fmin(fmax(v45, v60), v62);
  }
  double v63 = [(VKCameraController *)v15 vkCamera];
  [v63 setPosition:&v79];

  v15->super._userChangedZoomSinceLastProgrammaticRegionChange = 1;
  [(VKAnnotationTrackingCameraController *)v15->super._annotationTrackingCameraController setHasUserSpecifiedZoomLevel:1];
  [(VKMapCameraController *)v15 updateCameraZBounds];
  double v64 = [(VKCameraController *)v15 vkCamera];
  [v64 pitch];
  double v66 = v65;
  double v67 = [(VKCameraController *)v15 vkCamera];
  [v67 maxPitch];
  double v69 = v68;

  if (v66 > v69)
  {
    double v70 = [(VKCameraController *)v15 vkCamera];
    [v70 maxPitch];
    double v72 = v71;
    double v73 = [(VKCameraController *)v15 vkCamera];
    [v73 maxPitch];
    [(VKMapCameraController *)v15 rotateToPitch:v81 withPoint:1 preserveAltitude:0 animated:0 exaggerate:v72 maxPitch:v74];
  }
  long long v75 = [(VKCameraController *)v15 cameraDelegate];
  [v75 mapLayerDidChangeVisibleRegion];

  uint64_t v76 = *(void *)[(VKCameraController *)v15 runLoopController];
  if (v76)
  {
    char v82 = 4;
    md::MapEngine::setNeedsTick(v76, &v82);
  }
}

- (void)zoom:(double)a3 withPoint:()Matrix<double completionHandler:()3
{
  double v5 = a4._e[2];
  double v6 = a4._e[1];
  double v7 = a4._e[0];
  id v10 = a5;
  float v11 = [(VKCameraController *)self vkCamera];
  double v12 = [(VKCameraController *)self vkCamera];
  float v13 = [v12 footprint];
  [v13 maxDepth];
  objc_msgSend(v11, "widthOfViewAtDepth:");
  double v15 = log2(v14);

  float64x2_t v16 = self;
  double v17 = [(VKCameraController *)v16 canvas];
  [v17 size];
  double v19 = v18;

  double v20 = 0.0;
  if (v19 > 0.0)
  {
    double v21 = [(VKCameraController *)v16 canvas];
    [v21 size];
    double v20 = log2(v22 / (double)[(VKMapCameraController *)v16 tileSize]);
  }
  [(VKAnimation *)v16->super._zoomAnimation stop];
  float v23 = [[VKTimedAnimation alloc] initWithDuration:0.25];
  float v24 = v15;
  float v25 = v20 + (float)-v24;
  double v26 = v25;
  double v27 = a3 + 0.00001 + round(v25);
  objc_initWeak(&location, v16);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __58__VKMapCameraController_zoom_withPoint_completionHandler___block_invoke;
  v32[3] = &unk_1E5A8DE30;
  objc_copyWeak(v33, &location);
  v33[1] = *(id *)&v26;
  v33[2] = *(id *)&v27;
  double v33[3] = *(id *)&v7;
  v33[4] = *(id *)&v6;
  v33[5] = *(id *)&v5;
  [(VKTimedAnimation *)v23 setStepHandler:v32];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  id v29[2] = __58__VKMapCameraController_zoom_withPoint_completionHandler___block_invoke_2;
  void v29[3] = &unk_1E5A98E30;
  objc_copyWeak(&v31, &location);
  id v28 = v10;
  id v30 = v28;
  [(VKAnimation *)v23 setCompletionHandler:v29];
  objc_storeStrong((id *)&v16->super._zoomAnimation, v23);
  v16->super._zoomAnimationCanBeInterrupted = 0;
  [(VKCameraController *)v16 beginRegionChange:1];
  md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)v16 animationRunner], v16->super._zoomAnimation);

  objc_destroyWeak(&v31);
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
}

void __58__VKMapCameraController_zoom_withPoint_completionHandler___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "zoomToLevel:withPoint:", *(double *)(a1 + 40) + (*(double *)(a1 + 48) - *(double *)(a1 + 40)) * a2, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
}

void __58__VKMapCameraController_zoom_withPoint_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
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
  float v9 = (void (**)(void))a5;
  id v10 = [(VKCameraController *)self vkCamera];
  float v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "groundPointFromScreenPoint:", x, y);
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
  }

  if (!(_BYTE)v54)
  {
    if (!v9) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  double v12 = [(VKCameraController *)self vkCamera];
  float v13 = [(VKCameraController *)self vkCamera];
  long double v14 = [v13 footprint];
  [v14 maxDepth];
  objc_msgSend(v12, "widthOfViewAtDepth:");
  double v16 = log2(v15);

  double v17 = self;
  double v18 = [(VKCameraController *)v17 canvas];
  [v18 size];
  double v20 = v19;

  double v21 = 0.0;
  if (v20 > 0.0)
  {
    double v22 = [(VKCameraController *)v17 canvas];
    [v22 size];
    double v21 = log2(v23 / (double)[(VKMapCameraController *)v17 tileSize]);
  }
  float v24 = v17;
  float v25 = [(VKCameraController *)v24 canvas];
  [v25 size];
  double v27 = v26;

  double v28 = 0.0;
  if (v27 > 0.0)
  {
    uint64_t v29 = [(VKMapCameraController *)v24 tileSize];
    id v30 = [(VKCameraController *)v24 canvas];
    [v30 size];
    double v28 = log2((double)v29 / v31);
  }
  uint64_t v32 = [(VKCameraController *)v24 vkCamera];
  float v33 = v16;
  float v34 = v21 + (float)-v33;
  float v35 = a4 + 0.8 + v34;
  float v36 = v28 + v35;
  [v32 depthForViewWidth:(double)exp2(-v36)];
  double v38 = v37;

  double v39 = [(VKCameraController *)v24 vkCamera];
  double v40 = [v39 footprint];
  [v40 maxDepth];
  double v42 = v41;

  -[VKMapCameraController positionClampedToCameraRestriction:](v24, "positionClampedToCameraRestriction:", *((double *)&v54 + 1), v55);
  double v44 = v43;
  double v45 = [(VKCameraController *)v24 vkCamera];
  double v46 = *(double *)([v45 position] + 16);

  double v47 = [(VKCameraController *)v24 vkCamera];
  [v47 minHeight];
  double v49 = v46 + (v44 - v46) * (1.0 - v38 / v42);
  BOOL v50 = a4 > 0.0 && v49 < v48;

  double v51 = [(VKCameraController *)v24 vkCamera];
  [v51 maxHeight];
  double v53 = v52;

  if (!v50 && (v49 <= v53 || a4 >= 0.0))
  {
    -[VKMapCameraController zoom:withPoint:completionHandler:](v24, "zoom:withPoint:completionHandler:", v9, a4, *((double *)&v54 + 1), v55, (void)v54);
    goto LABEL_20;
  }
  if (v9) {
LABEL_16:
  }
    v9[2](v9);
LABEL_20:
}

- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  if ([(VKCameraController *)self staysCenteredDuringPinch]) {
    [(VKCameraController *)self centerScreenPoint];
  }
  else {
    -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
  }
  -[VKMapCameraController tapZoom:levels:completionHandler:](self, "tapZoom:levels:completionHandler:", v8);
}

- (void)rotateToYaw:(double)a3 withPoint:(const void *)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  float v9 = [(VKCameraController *)self vkCamera];
  [v9 yaw];
  long double v11 = fmod(3.14159265 - a3 + v10, 6.28318531);
  double v12 = fmod(v11 + 6.28318531, 6.28318531);

  float v13 = [(VKCameraController *)self vkCamera];
  uint64_t v14 = [v13 position];
  long long v48 = *(_OWORD *)v14;
  uint64_t v49 = *(void *)(v14 + 16);

  long double v15 = [(VKCameraController *)self vkCamera];
  uint64_t v16 = [v15 orientation];
  long long v46 = *(_OWORD *)v16;
  uint64_t v47 = *(void *)(v16 + 16);
  uint64_t v17 = *(void *)(v16 + 24);

  if (a4)
  {
    BOOL v18 = 0;
    *(_OWORD *)((char *)v45 + 8) = *(_OWORD *)a4;
    *((void *)&v45[1] + 1) = *((void *)a4 + 2);
    LOBYTE(v45[0]) = 1;
  }
  else
  {
    double v19 = [(VKCameraController *)self vkCamera];
    [(VKCameraController *)self centerScreenPoint];
    if (v19) {
      objc_msgSend(v19, "groundPointFromScreenPoint:");
    }
    else {
      memset(v45, 0, sizeof(v45));
    }

    BOOL v18 = LOBYTE(v45[0]) == 0;
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3321888768;
  v36[2] = __56__VKMapCameraController_rotateToYaw_withPoint_animated___block_invoke;
  double v36[3] = &unk_1EF58DD40;
  char v37 = 0;
  if (!v18)
  {
    long long v38 = *(_OWORD *)((char *)v45 + 8);
    uint64_t v39 = *((void *)&v45[1] + 1);
    char v37 = 1;
  }
  long long v40 = v48;
  long long v42 = v46;
  uint64_t v43 = v47;
  uint64_t v44 = v17;
  uint64_t v41 = v49;
  v36[4] = self;
  double v20 = (void (**)(void, double))MEMORY[0x1A6239EB0](v36);
  double v21 = v12 + -3.14159265;
  if (v5)
  {
    [(VKAnimation *)self->super._rotationAnimation stop];
    double v22 = [[VKTimedAnimation alloc] initWithDuration:0.3];
    rotationAnimation = self->super._rotationAnimation;
    self->super._rotationAnimation = v22;

    [(VKTimedAnimation *)self->super._rotationAnimation setTimingFunction:VKAnimationCurveEaseOut];
    objc_initWeak(&location, self);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __56__VKMapCameraController_rotateToYaw_withPoint_animated___block_invoke_18;
    v32[3] = &unk_1E5A8DE08;
    double v34 = v21;
    float v24 = v20;
    id v33 = v24;
    [(VKTimedAnimation *)self->super._rotationAnimation setStepHandler:v32];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    double v28 = __56__VKMapCameraController_rotateToYaw_withPoint_animated___block_invoke_2;
    uint64_t v29 = &unk_1E5A99078;
    objc_copyWeak(v31, &location);
    id v30 = v24;
    v31[1] = *(id *)&v21;
    [(VKAnimation *)self->super._rotationAnimation setCompletionHandler:&v26];
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v26, v27, v28, v29);
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._rotationAnimation->super);

    objc_destroyWeak(v31);
    objc_destroyWeak(&location);
  }
  else
  {
    [(VKCameraController *)self beginRegionChange:0];
    v20[2](v20, v21);
    uint64_t v25 = *(void *)[(VKCameraController *)self runLoopController];
    if (v25)
    {
      LOBYTE(location) = 4;
      md::MapEngine::setNeedsTick(v25, &location);
    }
    [(VKCameraController *)self endRegionChange];
  }
}

void __56__VKMapCameraController_rotateToYaw_withPoint_animated___block_invoke(uint64_t a1, double a2)
{
  if (*(unsigned char *)(a1 + 40))
  {
    __double2 v3 = __sincos_stret(a2 * 0.5);
    double v4 = *(double *)(a1 + 72);
    double v5 = *(double *)(a1 + 80);
    double v6 = *(double *)(a1 + 88);
    double v7 = v3.__sinval * -2.0 * (v5 - *(double *)(a1 + 56));
    double v8 = v3.__sinval * (v4 - *(double *)(a1 + 48) + v4 - *(double *)(a1 + 48));
    v21[0] = v4 - v8 * v3.__sinval + v7 * v3.__cosval;
    v21[1] = v5 + v8 * v3.__cosval + v7 * v3.__sinval;
    v21[2] = v6;
    float64x2_t v9 = *(float64x2_t *)(a1 + 96);
    float64x2_t v10 = *(float64x2_t *)(a1 + 112);
    float64x2_t v11 = vmulq_n_f64(v9, v3.__cosval);
    int8x16_t v12 = (int8x16_t)vmulq_n_f64(v9, v3.__sinval);
    float64x2_t v13 = (float64x2_t)vextq_s8(v12, v12, 8uLL);
    float64x2_t v14 = vmulq_n_f64(v10, v3.__cosval);
    int8x16_t v15 = (int8x16_t)vmulq_n_f64(v10, v3.__sinval);
    float64x2_t v16 = (float64x2_t)vextq_s8(v15, v15, 8uLL);
    uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "vkCamera", (unint64_t)*(_OWORD *)&vsubq_f64(v11, v13), *(void *)&vaddq_f64(v11, v13).f64[1], (unint64_t)*(_OWORD *)&vaddq_f64(v14, v16), *(void *)&vsubq_f64(v14, v16).f64[1]);
    [v17 setPosition:v21];

    BOOL v18 = [*(id *)(a1 + 32) vkCamera];
    [v18 setOrientation:&v20];

    double v19 = [*(id *)(a1 + 32) cameraDelegate];
    [v19 mapLayerDidChangeVisibleRegion];
  }
}

uint64_t __56__VKMapCameraController_rotateToYaw_withPoint_animated___block_invoke_18(uint64_t a1, float a2)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 40) * a2);
}

void __56__VKMapCameraController_rotateToYaw_withPoint_animated___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v6 = WeakRetained;
    if ([WeakRetained mapEngine])
    {
      if (a2) {
        (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 48));
      }
      [v6 endRegionChange];
    }
    double v5 = (void *)v6[19];
    v6[19] = 0;

    id WeakRetained = v6;
  }
}

- (void)rotateToPitch:(double)a3 withPoint:(const void *)a4 preserveAltitude:(BOOL)a5 animated:(BOOL)a6 exaggerate:(BOOL)a7 maxPitch:(double)a8
{
  BOOL v9 = a5;
  double v11 = fmin(fmax(a3, 0.0), a8 + 0.0698131701);
  if (!a6)
  {
    BOOL v21 = [(VKMapCameraController *)self isPitched];
    double v22 = [(VKCameraController *)self vkCamera];
    [v22 pitch];
    double v24 = v23;

    uint64_t v25 = [(VKCameraController *)self vkCamera];
    [v25 rightVector];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    __double2 v32 = __sincos_stret((v11 - v24) * 0.5);

    id v33 = [(VKCameraController *)self vkCamera];
    double v34 = (double *)[v33 orientation];
    double v35 = v32.__sinval / sqrt(v27 * v27 + v29 * v29 + v31 * v31);
    double v36 = v35 * v27;
    double v37 = v35 * v29;
    double v38 = v35 * v31;
    double v39 = v34[1];
    double v40 = v34[2];
    double v41 = v34[3];
    double v42 = *v34 * v38 + v39 * v32.__cosval - v40 * v36 + v41 * v37;
    double v43 = v40 * v32.__cosval - (*v34 * v37 - v39 * v36) + v41 * v38;
    double v44 = *v34 * v36 + v39 * v37 + v40 * v38;
    *(double *)id location = v40 * v37 - (v39 * v38 - *v34 * v32.__cosval) + v41 * v36;
    location[1] = *(id *)&v42;
    location[2] = *(id *)&v43;
    *(double *)&location[3] = -(v44 - v41 * v32.__cosval);

    if (a4)
    {
      *(float64x2_t *)((char *)v82 + 8) = *(float64x2_t *)a4;
      v82[1].f64[1] = *((float64_t *)a4 + 2);
      LOBYTE(v82[0].f64[0]) = 1;
    }
    else
    {
      double v45 = [(VKCameraController *)self vkCamera];
      [(VKCameraController *)self centerScreenPoint];
      if (v45) {
        objc_msgSend(v45, "groundPointFromScreenPoint:");
      }
      else {
        memset(v82, 0, sizeof(v82));
      }
    }
    [(VKCameraController *)self beginRegionChange:0];
    if (LOBYTE(v82[0].f64[0]))
    {
      long long v46 = [(VKCameraController *)self vkCamera];
      uint64_t v47 = (double *)[v46 position];
      double v48 = v47[1];
      double v49 = *v47 - v82[0].f64[1];
      double v50 = v47[2];
      double v51 = -((v48 - v82[1].f64[0]) * v38 - (v50 - v82[1].f64[1]) * v37);
      double v52 = -((v50 - v82[1].f64[1]) * v36 - v49 * v38);
      double v53 = -(v49 * v37 - (v48 - v82[1].f64[0]) * v36);
      double v54 = v52 + v52;
      double v55 = v53 + v53;
      v80.f64[0] = *v47 + v55 * v37 + (v51 + v51) * v32.__cosval - v54 * v38;
      v80.f64[1] = v48 - v55 * v36 + (v51 + v51) * v38 + v54 * v32.__cosval;
      *(double *)&long long v81 = v50 + v55 * v32.__cosval + v54 * v36 - (v51 + v51) * v37;

      if (v9)
      {
        BOOL v56 = [(VKCameraController *)self vkCamera];
        *(double *)&long long v57 = *(double *)([v56 position] + 16) / (v82[1].f64[1] - *(double *)&v81) + 1.0;
        long long v78 = v57;

        float64x2_t v80 = vmlaq_n_f64(v80, vsubq_f64(*(float64x2_t *)((char *)v82 + 8), v80), *(double *)&v78);
        *(double *)&long long v81 = *(double *)&v81 + (v82[1].f64[1] - *(double *)&v81) * *(double *)&v78;
      }
      long long v58 = [(VKCameraController *)self vkCamera];
      [v58 setPosition:&v80];

      double v59 = [(VKCameraController *)self vkCamera];
      [v59 setOrientation:location];
    }
    else
    {
      double v60 = [(VKCameraController *)self vkCamera];
      [v60 setOrientation:location];

      char v61 = [(VKCameraController *)self vkCamera];
      [(VKCameraController *)self centerScreenPoint];
      if (v61)
      {
        objc_msgSend(v61, "groundPointFromScreenPoint:");
      }
      else
      {
        float64x2_t v80 = 0u;
        long long v81 = 0u;
      }

      double v62 = [(VKCameraController *)self vkCamera];
      double v63 = (double *)[v62 position];
      double v64 = v80.f64[1];
      double v65 = *(double *)&v81;
      double v67 = *v63;
      double v66 = v63[1];

      double v59 = [(VKCameraController *)self vkCamera];
      double v68 = *(double *)[v59 position];
      double v69 = [(VKCameraController *)self vkCamera];
      double v70 = *(double *)([v69 position] + 8);
      double v71 = [(VKCameraController *)self vkCamera];
      double v72 = *(double *)([v71 position] + 16);
      v79[0] = v67 - v64 + v68;
      v79[1] = v66 - v65 + v70;
      v79[2] = v72;
      double v73 = [(VKCameraController *)self vkCamera];
      [v73 setPosition:v79];
    }
    double v74 = [(VKCameraController *)self cameraDelegate];
    [v74 mapLayerDidChangeVisibleRegion];

    uint64_t v75 = *(void *)[(VKCameraController *)self runLoopController];
    if (v75)
    {
      LOBYTE(v80.f64[0]) = 4;
      md::MapEngine::setNeedsTick(v75, &v80);
    }
    BOOL v76 = [(VKMapCameraController *)self isPitched];
    if (v21 || !v76)
    {
      if (!v21 || v76)
      {
LABEL_26:
        [(VKCameraController *)self endRegionChange];
        return;
      }
      float64_t v77 = [(VKCameraController *)self cameraDelegate];
      [v77 mapLayerDidBecomePitched:0];
    }
    else
    {
      float64_t v77 = [(VKCameraController *)self cameraDelegate];
      [v77 mapLayerDidBecomePitched:1];
    }

    goto LABEL_26;
  }
  BOOL v12 = a7;
  float64x2_t v13 = [(VKCameraController *)self vkCamera];
  [v13 pitch];
  int8x16_t v15 = v14;

  [(VKAnimation *)self->super._pitchAnimation stop];
  float64x2_t v16 = [VKTimedAnimation alloc];
  double v17 = 0.3;
  if (v12) {
    double v17 = 0.5;
  }
  BOOL v18 = [(VKTimedAnimation *)v16 initWithDuration:v17];
  pitchAnimation = self->super._pitchAnimation;
  self->super._pitchAnimation = v18;

  [(VKTimedAnimation *)self->super._pitchAnimation setTimingFunction:VKAnimationCurveEaseOut];
  objc_initWeak(location, self);
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __95__VKMapCameraController_rotateToPitch_withPoint_preserveAltitude_animated_exaggerate_maxPitch___block_invoke;
  v87[3] = &unk_1E5A8DDB8;
  objc_copyWeak(v88, location);
  v88[1] = v15;
  v88[2] = *(id *)&v11;
  BOOL v89 = v9;
  v88[3] = *(id *)&a8;
  [(VKTimedAnimation *)self->super._pitchAnimation setStepHandler:v87];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __95__VKMapCameraController_rotateToPitch_withPoint_preserveAltitude_animated_exaggerate_maxPitch___block_invoke_2;
  v84[3] = &unk_1E5A8DDE0;
  objc_copyWeak(v85, location);
  v84[4] = self;
  v85[1] = *(id *)&a8;
  BOOL v86 = v9;
  [(VKAnimation *)self->super._pitchAnimation setCompletionHandler:v84];
  [(VKAnnotationTrackingCameraController *)self->super._annotationTrackingCameraController pauseAnimation];
  [(VKCameraController *)self beginRegionChange:1];
  md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._pitchAnimation->super);
  objc_destroyWeak(v85);
  objc_destroyWeak(v88);
  objc_destroyWeak(location);
}

void __95__VKMapCameraController_rotateToPitch_withPoint_preserveAltitude_animated_exaggerate_maxPitch___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained rotateToPitch:0 withPoint:*(unsigned __int8 *)(a1 + 64) preserveAltitude:0 animated:0 exaggerate:*(double *)(a1 + 40) + (*(double *)(a1 + 48) - *(double *)(a1 + 40)) * a2 maxPitch:*(double *)(a1 + 56)];
  }
}

void __95__VKMapCameraController_rotateToPitch_withPoint_preserveAltitude_animated_exaggerate_maxPitch___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    float64x2_t v10 = WeakRetained;
    if ([WeakRetained mapEngine])
    {
      __double2 v3 = [*(id *)(a1 + 32) vkCamera];
      [v3 pitch];
      double v5 = v4;
      double v6 = *(double *)(a1 + 48);

      if (v5 > v6)
      {
        double v7 = [v10 vkCamera];
        [v7 maxPitch];
        objc_msgSend(v10, "rotateToPitch:withPoint:preserveAltitude:animated:exaggerate:maxPitch:", 0, *(unsigned __int8 *)(a1 + 56), 0, 0);
      }
      [v10 updateCameraZBounds];
      [v10 endRegionChange];
      [v10[23] resumeAnimation];
    }
    uint64_t v8 = *(void *)(a1 + 32);
    BOOL v9 = *(void **)(v8 + 144);
    *(void *)(v8 + 144) = 0;

    id WeakRetained = v10;
  }
}

- (float)idealPitchForNormalizedZoomLevel:(float)a3
{
  mapEngine = self->_mapEngine;
  if (mapEngine && (uint64_t v4 = mapEngine[149]) != 0) {
    return pitchForZ((void *)(v4 + 432), a3);
  }
  else {
    return 0.0;
  }
}

- (float)currentMinimumNormalizedZoomLevel
{
  [(VKCameraController *)self camera];
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
    if (v6) {
      goto LABEL_4;
    }
  }
  else if (v6)
  {
LABEL_4:
    [(VKCameraController *)self camera];
    float v3 = ceilf(*(float *)(v6 + 84) * 1000.0);
    if (v7)
    {
      if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    return v3 * 0.001;
  }
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  double v5 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_ERROR, "no self.camera in VKMapCameraController for tap zoom", (uint8_t *)&v6, 2u);
  }

  return 1.0;
}

- (void)dealloc
{
  [(VKAnimation *)self->_horizontalOffsetAnimation stop];
  v3.receiver = self;
  v3.super_class = (Class)VKMapCameraController;
  [(VKScreenCameraController *)&v3 dealloc];
}

@end