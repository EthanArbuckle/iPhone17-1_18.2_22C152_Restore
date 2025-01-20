@interface VKNavCameraController
- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate;
- (BOOL)_addStepToFraming:(unint64_t)a3 forRoute:(id)a4;
- (BOOL)_canZoomIn;
- (BOOL)_canZoomOut;
- (BOOL)_hasRunningAnimation;
- (BOOL)_springsNeedUpdate;
- (BOOL)canEnter3DMode;
- (BOOL)isGesturing;
- (BOOL)isPitchEnabled;
- (BOOL)isRotateEnabled;
- (BOOL)snapMapIfNecessary:(BOOL)a3;
- (BOOL)tapAtPoint:(CGPoint)a3;
- (BOOL)usesVKCamera;
- (BOOL)wantsTimerTick;
- (Box<double,)calculateViewableScreenRect;
- (Box<double,)calculateViewableScreenRectForEdgeInsets:(VKEdgeInsets)a3;
- (CameraFrame<geo::Radians,)cameraFrame;
- (CameraFrame<geo::Radians,)currentCameraFrame;
- (CameraFrame<geo::Radians,)restingCameraFrame;
- (Coordinate3D<geo::Radians,)_coordinateForGeoLocation:()Coordinate3D<geo:(double>)result :Radians;
- (Coordinate3D<geo::Radians,)puckCoordinate;
- (Coordinate3D<geo::Radians,)routeCoordinateAtDistance:(double)a3;
- (Coordinate3D<geo::Radians,)routeLocationAtDistance:(double)a3 fromManeuver:(unint64_t)a4;
- (Matrix<double,)puckScreenPoint;
- (Unit<geo::RadianUnitDescription,)calculateHeading;
- (Unit<geo::RadianUnitDescription,)maxCameraPitch;
- (Unit<geo::RadianUnitDescription,)minCameraPitch;
- (VKEdgeInsets)clientFramingInsets;
- (VKInteractiveMap)screenCanvas;
- (VKNavCameraController)init;
- (VKNavCameraController)initWithTaskContext:(shared_ptr<md:(void *)a4 :(void *)a5 TaskContext>)a3 device:(AnimationRunner *)a6 mapDataAccess:(RunLoopController *)a7 animationRunner:(id)a8 runLoopController:cameraDelegate:;
- (VKSceneConfiguration)sceneConfiguration;
- (__n128)_addWaypointToFraming:forRoute:;
- (double)_calculateMaxPixelChangeAndUpdateCorners;
- (double)_normalizedZoomLevelForDisplayZoomLevel:(double)a3;
- (double)altitude;
- (double)currentZoomLevel;
- (double)distanceFromCenterCoordinate;
- (double)distanceToManeuver:(unint64_t)a3;
- (double)heading;
- (double)maxZoomHeight;
- (double)maxZoomScale;
- (double)maximumZoomLevel;
- (double)minZoomHeight;
- (double)minZoomScale;
- (double)minimumZoomLevel;
- (double)pitch;
- (double)topDownMinimumZoomLevel;
- (double)zoomScale;
- (float)_currentRoadSignOffset;
- (float)idealPitchForNormalizedZoomLevel:(float)a3;
- (float)maxPitchForNormalizedZoomLevel:(float)a3;
- (float)maximumNormalizedZoomLevel;
- (float)minPitchForNormalizedZoomLevel:(float)a3;
- (float)minimumNormalizedZoomLevel;
- (id).cxx_construct;
- (id)_debugText:(BOOL)a3 showNavCameraDebugConsoleAttributes:(BOOL)a4 includeSensitiveAttributes:(BOOL)a5;
- (id)_detachedGestureController;
- (id)detailedDescription;
- (int64_t)defaultDisplayRate;
- (int64_t)displayRate;
- (int64_t)tileSize;
- (optional<double>)puckAnimator:(id)a3 getElevationWithCoordinate:(const void *)a4;
- (shared_ptr<gss::StylesheetManager<gss::ScenePropertyID>>)_getActiveSceneManager;
- (unsigned)cameraHeadingType;
- (void)_addAdditionalRoutePointsToFrameToList:(void *)a3;
- (void)_addWaypointToFraming:(id)a3 forRoute:(id)a4;
- (void)_addWaypointToFraming:forRoute:;
- (void)_setDetached:(BOOL)a3;
- (void)_setNavCameraIsDetached:(BOOL)a3;
- (void)_setNavCameraTransitionComplete:(BOOL)a3;
- (void)_setNeedsUpdate;
- (void)_snapHeading;
- (void)_snapPitch;
- (void)_updateCameraLimits;
- (void)_updateClipPlanes;
- (void)_updateDebugOverlay;
- (void)_updateDebugText;
- (void)_updateDidNavCameraTransition;
- (void)_updateForAnimatedEdgeInsets;
- (void)_updateLabelMetrics;
- (void)_updateObserverCouldZoomIn:(BOOL)a3 couldZoomOut:(BOOL)a4;
- (void)_updateRouteSinuosity;
- (void)_updateSceneQuery;
- (void)_updateSceneStyles:(BOOL)a3 updatePitchLimitOnly:(BOOL)a4;
- (void)_updateSprings:(double)a3;
- (void)_updateStyles;
- (void)_updateZoomScaleLimts;
- (void)animateCameraWithDuration:(float)a3 fromFrame:(const void *)a4 completionHandler:(id)a5;
- (void)canvasDidLayout;
- (void)dealloc;
- (void)navContextCameraHeadingOverrideDidChange:(id)a3;
- (void)pitchTo:(double)a3 animated:(BOOL)a4;
- (void)projectCoordinate:(id)a3 toPoint:(CGPoint *)a4;
- (void)puckAnimator:(id)a3 runAnimation:(id)a4;
- (void)puckAnimator:(id)a3 updatedPosition:(const void *)a4 course:(const void *)a5 polylineCoordinate:(PolylineCoordinate)a6;
- (void)resetSpringsToResting;
- (void)returnToPuck;
- (void)returnToTrackingWithDelay:(double)a3 resetZoom:(BOOL)a4;
- (void)rotateTo:(double)a3 animated:(BOOL)a4;
- (void)setCamera:(shared_ptr<gdc::Camera>)a3;
- (void)setCameraFrame:()CameraFrame<geo:(double> *)a3 :Radians;
- (void)setClientFramingInsets:(VKEdgeInsets)a3;
- (void)setEdgeInsets:(VKEdgeInsets)a3;
- (void)setEdgeInsetsAnimating:(BOOL)a3;
- (void)setNavContext:(id)a3;
- (void)setSceneConfiguration:(id)a3;
- (void)setScreenCanvas:(id)a3;
- (void)setVkCamera:(id)a3;
- (void)setZoomScale:(double)a3;
- (void)startIgnoreStyleChangeTimer;
- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4;
- (void)startPinchingWithFocusPoint:(CGPoint)a3;
- (void)startPitchingWithFocusPoint:(CGPoint)a3;
- (void)startRotatingWithFocusPoint:(CGPoint)a3;
- (void)startWithPounce:(BOOL)a3 startLocation:(id)a4 startCourse:(double)a5 pounceCompletionHandler:(id)a6;
- (void)stop;
- (void)stopAnimations;
- (void)stopIgnoreStyleChange;
- (void)stopPanningAtPoint:(CGPoint)a3;
- (void)stopPinchingWithFocusPoint:(CGPoint)a3;
- (void)stopPitchingWithFocusPoint:(CGPoint)a3;
- (void)stopRotatingWithFocusPoint:(CGPoint)a3;
- (void)stylesheetDidReload;
- (void)updateCameraState;
- (void)updateLocation:(const void *)a3 andCourse:(const void *)a4;
- (void)updateManeuversToFrame;
- (void)updatePanWithTranslation:(CGPoint)a3;
- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5;
- (void)updatePitchWithFocusPoint:(CGPoint)a3 degrees:(double)a4;
- (void)updatePitchWithFocusPoint:(CGPoint)a3 translation:(double)a4;
- (void)updatePointsToFrame;
- (void)updatePuckOffset:(BOOL)a3;
- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4;
- (void)updateSpringsForFramingCamera;
- (void)updateSpringsForTrackingCamera;
- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4;
- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5;
@end

@implementation VKNavCameraController

- (void)_updateLabelMetrics
{
  v3 = [(VKNavCameraController *)self screenCanvas];
  uint64_t v4 = [v3 mapEngine];

  if (!v4) {
    return;
  }
  v5 = *(int8x8_t **)(v4 + 1120);
  if (!v5) {
    return;
  }
  int8x8_t v6 = v5[2];
  if (!*(void *)&v6) {
    return;
  }
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] > 1uLL)
  {
    uint64_t v8 = 0x2FED70A4459DFCA1;
    if (*(void *)&v6 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v8 = 0x2FED70A4459DFCA1uLL % *(void *)&v6;
    }
  }
  else
  {
    uint64_t v8 = (*(void *)&v6 - 1) & 0x2FED70A4459DFCA1;
  }
  int8x8_t v9 = v5[1];
  v10 = *(void **)(*(void *)&v9 + 8 * v8);
  if (!v10) {
    return;
  }
  v11 = (void *)*v10;
  if (!*v10) {
    return;
  }
  uint64_t v12 = *(void *)&v6 - 1;
  if (v7.u32[0] < 2uLL)
  {
    while (1)
    {
      uint64_t v13 = v11[1];
      if (v13 == 0x2FED70A4459DFCA1)
      {
        if (v11[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_24;
        }
      }
      else if ((v13 & v12) != v8)
      {
        return;
      }
      v11 = (void *)*v11;
      if (!v11) {
        return;
      }
    }
  }
  while (1)
  {
    unint64_t v14 = v11[1];
    if (v14 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v14 >= *(void *)&v6) {
      v14 %= *(void *)&v6;
    }
    if (v14 != v8) {
      return;
    }
LABEL_18:
    v11 = (void *)*v11;
    if (!v11) {
      return;
    }
  }
  if (v11[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_18;
  }
LABEL_24:
  uint64_t v15 = v11[5];
  if (v15)
  {
    if (v7.u32[0] > 1uLL)
    {
      uint64_t v16 = 0x20A1ED17D78F322BLL;
      if (*(void *)&v6 <= 0x20A1ED17D78F322BuLL) {
        uint64_t v16 = 0x20A1ED17D78F322BuLL % *(void *)&v6;
      }
    }
    else
    {
      uint64_t v16 = v12 & 0x20A1ED17D78F322BLL;
    }
    v17 = *(void **)(*(void *)&v9 + 8 * v16);
    if (v17)
    {
      v18 = (void *)*v17;
      if (v18)
      {
        if (v7.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v19 = v18[1];
            if (v19 == 0x20A1ED17D78F322BLL)
            {
              if (v18[2] == 0x20A1ED17D78F322BLL) {
                goto LABEL_45;
              }
            }
            else if ((v19 & v12) != v16)
            {
              return;
            }
            v18 = (void *)*v18;
            if (!v18) {
              return;
            }
          }
        }
        do
        {
          unint64_t v20 = v18[1];
          if (v20 == 0x20A1ED17D78F322BLL)
          {
            if (v18[2] == 0x20A1ED17D78F322BLL)
            {
LABEL_45:
              uint64_t v21 = v18[5];
              if (v21)
              {
                int v22 = *(unsigned __int8 *)(v15 + 163);
                uint64_t v23 = *(void *)(**(void **)(v21 + 144) + 40);
                int v24 = *(unsigned __int8 *)(v23 + 1);
                int v25 = *(unsigned __int8 *)(v23 + 48);
                v26 = *(unsigned char **)&self->_isElevatedRoute;
                if (!v26) {
                  operator new();
                }
                if ((v22 != 0) != (v26[24] != 0) || v24 != v26[25] || v25 != v26[26])
                {
                  v26[24] = v22 != 0;
                  v26[25] = v24;
                  v26[26] = v25;
                  if (!*(void *)(v15 + 256)) {
                    md::StyleLogic::updateConfiguration((md::StyleLogic *)v15, *(_DWORD *)(v15 + 1096));
                  }
                  md::LabelMetrics::initialize((uint64_t)v26);
                }
              }
              return;
            }
          }
          else
          {
            if (v20 >= *(void *)&v6) {
              v20 %= *(void *)&v6;
            }
            if (v20 != v16) {
              return;
            }
          }
          v18 = (void *)*v18;
        }
        while (v18);
      }
    }
  }
}

- (void)_updateStyles
{
  uint64_t v3 = gss::Allocator::instance((gss::Allocator *)self);
  uint64_t v35 = v3;
  uint64_t v4 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v3 + 16))(v3, 8, 4);
  v5 = v4;
  *(void *)&long long v33 = v4;
  v34 = v4 + 1;
  if (v4) {
    *uint64_t v4 = 0xE00000005;
  }
  *((void *)&v33 + 1) = v4 + 1;
  gss::FeatureAttributeSet::FeatureAttributeSet((gss::FeatureAttributeSet *)v41, (uint64_t)&v33);
  if (v5) {
    (*(void (**)(uint64_t, void *, uint64_t))(*(void *)v3 + 40))(v3, v5, 8);
  }
  int8x8_t v6 = [(VKNavCameraController *)self sceneConfiguration];
  uint8x8_t v7 = v6;
  if (v6)
  {
    [v6 styleManager];
  }
  else
  {
    uint64_t v39 = 0;
    v40 = 0;
  }

  uint64_t v8 = v39;
  if (v39)
  {
    *(void *)((char *)&v33 + 7) = 0;
    *(void *)&long long v33 = 0;
    HIBYTE(v33) = 1;
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)&v33, 0x10000u) = 3;
    gss::StylesheetManager<gss::PropertyID>::styleQueryForFeatureAttributes(&v37, v8, (gss::FeatureAttributeSet *)v41, (gss::QueryOverrides *)&v33);
    if (!BYTE14(v33))
    {
      uint64_t v10 = v33;
      if ((void)v33)
      {
        uint64_t v11 = gss::Allocator::instance(v9);
        (*(void (**)(uint64_t, uint64_t, void))(*(void *)v11 + 40))(v11, v10, WORD6(v33));
      }
    }
    uint64_t v12 = v37;
    uint64_t v13 = v38;
    v31 = v37;
    v32 = v38;
    if (v38) {
      atomic_fetch_add_explicit(&v38->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    gss::QueryableLocker<gss::PropertyID>::QueryableLocker((uint64_t *)&v33, (uint64_t)v12, (uint64_t)v13);
    if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    unint64_t v14 = [(VKCameraController *)self vkCamera];
    [v14 displayZoomLevel];
    double v16 = v15;

    if (!v36) {
      goto LABEL_43;
    }
    uint64_t v17 = *(void *)(v33 + 24);
    if ((int)v16 >= 0x17) {
      unsigned int v18 = 23;
    }
    else {
      unsigned int v18 = (int)v16;
    }
    uint64_t v19 = *(float **)v17;
    if (*(void *)v17)
    {
      float v20 = *v19;
      BOOL v21 = *v19 == 1.0;
      if (*(unsigned char *)(v17 + 10) && v20 != 0.0 && v20 != 1.0)
      {
LABEL_28:
        if (gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(*(void *)(v33 + 24), 0xFAu, v18, 0)) {
          goto LABEL_31;
        }
        unsigned int v22 = 1;
LABEL_30:
        if (!gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(v17, 0xFAu, v18, v22))
        {
LABEL_43:
          gss::QueryableLocker<gss::PropertyID>::~QueryableLocker((uint64_t)&v33);
          v29 = v38;
          if (v38 && !atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
            std::__shared_weak_count::__release_weak(v29);
          }
          goto LABEL_46;
        }
LABEL_31:
        if (v19)
        {
          float v23 = *v19;
          BOOL v24 = *v19 == 1.0;
          if (*(unsigned char *)(v17 + 10) && v23 != 0.0 && v23 != 1.0) {
            goto LABEL_39;
          }
        }
        else
        {
          BOOL v24 = 0;
        }
        unsigned int v25 = *(unsigned __int8 *)(v17 + v24 + 11);
        float v23 = 0.0;
        if (v25 != 2)
        {
          float v27 = *(float *)gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<float>(v17, 0xFAu, v18, v25, 0);
LABEL_41:
          double v28 = v27 * 0.5;
          if (v28 != self->_minHeightDeltaChangeVertical)
          {
            self->_minHeightDeltaChangeVertical = v28;
            [(VKNavCameraController *)self _setNeedsUpdate];
          }
          goto LABEL_43;
        }
LABEL_39:
        LOBYTE(v31) = 1;
        char v43 = 1;
        float v26 = *(float *)gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<float>(v17, 0xFAu, v18, 0, &v31);
        float v27 = v26
            + (float)((float)(*(float *)gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<float>(v17, 0xFAu, v18, 1u, &v43)- v26)* v23);
        goto LABEL_41;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
    unsigned int v22 = *(unsigned __int8 *)(v17 + v21 + 11);
    if (v22 != 2) {
      goto LABEL_30;
    }
    goto LABEL_28;
  }
LABEL_46:
  v30 = v40;
  if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }
  if (v41[0])
  {
    v41[1] = v41[0];
    (*(void (**)(uint64_t, void, void))(*(void *)v42 + 40))(v42, v41[0], v41[2] - v41[0]);
  }
}

- (void)_updateSceneStyles:(BOOL)a3 updatePitchLimitOnly:(BOOL)a4
{
  uint64_t v457 = *MEMORY[0x1E4F143B8];
  [(VKNavCameraController *)self _getActiveSceneManager];
  uint64_t v7 = *(void *)&self->_lastProjectedPosition._e[2];
  if (v7)
  {
    uint64_t v8 = *(std::__shared_weak_count **)&self->_farClipPlaneFactor;
    *(double *)&long long buf = self->_lastProjectedPosition._e[2];
    *((void *)&buf + 1) = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    gss::QueryableLocker<gss::ScenePropertyID>::QueryableLocker(v452, v7, (uint64_t)v8);
    if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
      if (v453) {
        goto LABEL_7;
      }
    }
    else if (v453)
    {
LABEL_7:
      [(VKCameraController *)self camera];
      float v10 = gdc::DisplayZoomLevel::centerZoomLevel((gdc::DisplayZoomLevel *)buf, v9);
      uint64_t v11 = (std::__shared_weak_count *)*((void *)&buf + 1);
      if (*((void *)&buf + 1)
        && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&buf + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
      uint64_t v12 = *(void *)(v452[0] + 24);
      if ((int)v10 >= 0x17) {
        unsigned int v13 = 23;
      }
      else {
        unsigned int v13 = (int)v10;
      }
      unint64_t v14 = *(float **)v12;
      if (*(void *)v12)
      {
        float v15 = *v14;
        BOOL v16 = *v14 == 1.0;
        if (*(unsigned char *)(v12 + 10))
        {
          if (v15 != 0.0 && v15 != 1.0)
          {
LABEL_30:
            if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(*(void *)(v452[0] + 24), 0x28u, v13, 0))goto LABEL_33; {
            unsigned int v20 = 1;
            }
LABEL_32:
            if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(v12, 0x28u, v13, v20)) {
              goto LABEL_46;
            }
LABEL_33:
            if (v14)
            {
              float v21 = *v14;
              BOOL v22 = *v14 == 1.0;
              if (*(unsigned char *)(v12 + 10))
              {
                if (v21 != 0.0 && v21 != 1.0) {
                  goto LABEL_43;
                }
              }
            }
            else
            {
              BOOL v22 = 0;
            }
            unsigned int v24 = *(unsigned __int8 *)(v12 + v22 + 11);
            float v21 = 0.0;
            if (v24 != 2)
            {
              float v26 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v12, 0x28u, v13, v24, 0);
              goto LABEL_45;
            }
LABEL_43:
            LOBYTE(buf) = 1;
            char v455 = 1;
            float v25 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v12, 0x28u, v13, 0, &buf);
            float v26 = v25
                + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v12, 0x28u, v13, 1u, &v455)- v25)* v21);
LABEL_45:
            self->_maxCameraHeight = v26 * 0.0174532925;
            uint64_t v12 = *(void *)(v452[0] + 24);
            unint64_t v14 = *(float **)v12;
LABEL_46:
            if (v14)
            {
              float v27 = *v14;
              BOOL v28 = *v14 == 1.0;
              if (*(unsigned char *)(v12 + 10))
              {
                if (v27 != 0.0 && v27 != 1.0)
                {
LABEL_56:
                  if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(v12, 0x29u, v13, 0)) {
                    goto LABEL_59;
                  }
                  unsigned int v30 = 1;
LABEL_58:
                  if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(v12, 0x29u, v13, v30))goto LABEL_72; {
LABEL_59:
                  }
                  if (v14)
                  {
                    float v31 = *v14;
                    BOOL v32 = *v14 == 1.0;
                    if (*(unsigned char *)(v12 + 10))
                    {
                      if (v31 != 0.0 && v31 != 1.0) {
                        goto LABEL_69;
                      }
                    }
                  }
                  else
                  {
                    BOOL v32 = 0;
                  }
                  unsigned int v34 = *(unsigned __int8 *)(v12 + v32 + 11);
                  float v31 = 0.0;
                  if (v34 != 2)
                  {
                    float v36 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v12, 0x29u, v13, v34, 0);
                    goto LABEL_71;
                  }
LABEL_69:
                  LOBYTE(buf) = 1;
                  char v455 = 1;
                  float v35 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v12, 0x29u, v13, 0, &buf);
                  float v36 = v35
                      + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v12, 0x29u, v13, 1u, &v455)- v35)* v31);
LABEL_71:
                  self->_minCameraHeight = v36 * 0.0174532925;
LABEL_72:
                  if (a4) {
                    goto LABEL_935;
                  }
                  uint64_t v37 = *(void *)(v452[0] + 24);
                  uint64_t v39 = *(void *)(v37 + 16);
                  v38 = *(std::__shared_weak_count **)(v37 + 24);
                  if (v38)
                  {
                    atomic_fetch_add_explicit(&v38->__shared_owners_, 1uLL, memory_order_relaxed);
                    if (!atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                    {
                      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
                      std::__shared_weak_count::__release_weak(v38);
                    }
                  }
                  if (v39)
                  {
                    uint64_t v40 = *(void *)(v452[0] + 24);
                    double v42 = *(double *)(v40 + 16);
                    v41 = *(std::__shared_weak_count **)(v40 + 24);
                    if (v41)
                    {
                      atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
                      if (!atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                      {
                        ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
                        std::__shared_weak_count::__release_weak(v41);
                      }
                    }
                    uint64_t v43 = *(void *)(v452[0] + 24);
                    uint64_t v44 = *(void *)(v43 + 16);
                    v45 = *(std::__shared_weak_count **)(v43 + 24);
                    *(void *)&long long buf = v44;
                    *((void *)&buf + 1) = v45;
                    if (v45) {
                      atomic_fetch_add_explicit(&v45->__shared_owners_, 1uLL, memory_order_relaxed);
                    }
                    v46 = *(const std::string::value_type **)(v44 + 104);
                    if (v46) {
                      v47 = v46;
                    }
                    else {
                      v47 = "";
                    }
                    std::string::__assign_external((std::string *)&self->_currentStyleName, v47);
                    if (v45 && !atomic_fetch_add(&v45->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                    {
                      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
                      std::__shared_weak_count::__release_weak(v45);
                    }
                  }
                  else
                  {
                    p_currentStyleName = &self->_currentStyleName;
                    if (*((char *)&self->_currentStyleName.__r_.__value_.var0.__l + 23) < 0)
                    {
                      self->_currentStyleName.__r_.__value_.var0.__l.__size_ = 7;
                      p_currentStyleName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_currentStyleName->__r_.__value_.var0.__l.__data_;
                    }
                    else
                    {
                      *((unsigned char *)&self->_currentStyleName.__r_.__value_.var0.__l + 23) = 7;
                    }
                    double v42 = 0.0;
                    strcpy(p_currentStyleName->__r_.__value_.var0.__s.__data_, "Unknown");
                  }
                  uint64_t v49 = *(void *)(v452[0] + 24);
                  v50 = *(float **)v49;
                  if (*(void *)v49)
                  {
                    float v51 = *v50;
                    BOOL v52 = *v50 == 1.0;
                    if (*(unsigned char *)(v49 + 10) && v51 != 0.0 && v51 != 1.0)
                    {
LABEL_99:
                      if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(*(void *)(v452[0] + 24), 0x14u, v13, 0))goto LABEL_102; {
                      unsigned int v53 = 1;
                      }
LABEL_101:
                      if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(v49, 0x14u, v13, v53))goto LABEL_112; {
LABEL_102:
                      }
                      if (v50)
                      {
                        float v54 = *v50;
                        BOOL v55 = *v50 == 1.0;
                        if (*(unsigned char *)(v49 + 10) && v54 != 0.0 && v54 != 1.0) {
                          goto LABEL_109;
                        }
                      }
                      else
                      {
                        BOOL v55 = 0;
                      }
                      unsigned int v56 = *(unsigned __int8 *)(v49 + v55 + 11);
                      float v54 = 0.0;
                      if (v56 != 2)
                      {
                        float v58 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v49, 0x14u, v13, v56, 0);
                        goto LABEL_111;
                      }
LABEL_109:
                      LOBYTE(buf) = 1;
                      char v455 = 1;
                      float v57 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v49, 0x14u, v13, 0, &buf);
                      float v58 = v57
                          + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v49, 0x14u, v13, 1u, &v455)- v57)* v54);
LABEL_111:
                      self->_cameraPitch._value = v58 * 0.0174532925;
                      uint64_t v49 = *(void *)(v452[0] + 24);
                      v50 = *(float **)v49;
LABEL_112:
                      if (v50)
                      {
                        float v59 = *v50;
                        BOOL v60 = *v50 == 1.0;
                        if (*(unsigned char *)(v49 + 10) && v59 != 0.0 && v59 != 1.0)
                        {
LABEL_119:
                          if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(v49, 0x15u, v13, 0)) {
                            goto LABEL_122;
                          }
                          unsigned int v61 = 1;
LABEL_121:
                          if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(v49, 0x15u, v13, v61))goto LABEL_134; {
LABEL_122:
                          }
                          if (v50)
                          {
                            float v62 = *v50;
                            BOOL v63 = *v50 == 1.0;
                            if (*(unsigned char *)(v49 + 10) && v62 != 0.0 && v62 != 1.0) {
                              goto LABEL_129;
                            }
                          }
                          else
                          {
                            BOOL v63 = 0;
                          }
                          unsigned int v64 = *(unsigned __int8 *)(v49 + v63 + 11);
                          float v62 = 0.0;
                          if (v64 != 2)
                          {
                            int v66 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<unsigned int>(v49, v13, v64, 0);
LABEL_133:
                            self->_headingType = v66;
LABEL_134:
                            [(VKNavCameraController *)self currentZoomLevel];
                            if (v67 <= 6.0) {
                              self->_headingType = 0;
                            }
                            v68 = *(unsigned __int8 **)(v452[0] + 24);
                            v69 = *(float **)v68;
                            if (*(void *)v68)
                            {
                              float v70 = *v69;
                              BOOL v71 = *v69 == 1.0;
                              if (v68[10] && v70 != 0.0 && v70 != 1.0)
                              {
LABEL_143:
                                if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(*(void *)(v452[0] + 24), 0x1Bu, v13, 0))goto LABEL_146; {
                                unsigned int v72 = 1;
                                }
LABEL_145:
                                if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v68, 0x1Bu, v13, v72))goto LABEL_156; {
LABEL_146:
                                }
                                if (v69)
                                {
                                  float v73 = *v69;
                                  BOOL v74 = *v69 == 1.0;
                                  if (v68[10] && v73 != 0.0 && v73 != 1.0) {
                                    goto LABEL_153;
                                  }
                                }
                                else
                                {
                                  BOOL v74 = 0;
                                }
                                unsigned int v75 = v68[v74 + 11];
                                float v73 = 0.0;
                                if (v75 != 2)
                                {
                                  float v77 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x1Bu, v13, v75, 0);
                                  goto LABEL_155;
                                }
LABEL_153:
                                LOBYTE(buf) = 1;
                                char v455 = 1;
                                float v76 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x1Bu, v13, 0, &buf);
                                float v77 = v76
                                    + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x1Bu, v13, 1u, &v455)- v76)* v73);
LABEL_155:
                                self->_headingDelta._value = v77 * 0.0174532925;
                                v68 = *(unsigned __int8 **)(v452[0] + 24);
                                v69 = *(float **)v68;
LABEL_156:
                                if (v69)
                                {
                                  float v78 = *v69;
                                  BOOL v79 = *v69 == 1.0;
                                  if (v68[10] && v78 != 0.0 && v78 != 1.0)
                                  {
LABEL_163:
                                    if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v68, 0x37u, v13, 0))goto LABEL_166; {
                                    unsigned int v80 = 1;
                                    }
LABEL_165:
                                    if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v68, 0x37u, v13, v80))goto LABEL_176; {
LABEL_166:
                                    }
                                    if (v69)
                                    {
                                      float v81 = *v69;
                                      BOOL v82 = *v69 == 1.0;
                                      if (v68[10] && v81 != 0.0 && v81 != 1.0) {
                                        goto LABEL_173;
                                      }
                                    }
                                    else
                                    {
                                      BOOL v82 = 0;
                                    }
                                    unsigned int v83 = v68[v82 + 11];
                                    float v81 = 0.0;
                                    if (v83 != 2)
                                    {
                                      float v85 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x37u, v13, v83, 0);
                                      goto LABEL_175;
                                    }
LABEL_173:
                                    LOBYTE(buf) = 1;
                                    char v455 = 1;
                                    float v84 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x37u, v13, 0, &buf);
                                    float v85 = v84
                                        + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x37u, v13, 1u, &v455)- v84)* v81);
LABEL_175:
                                    self->_headingMinDelta._value = v85 * 0.0174532925;
                                    v68 = *(unsigned __int8 **)(v452[0] + 24);
                                    v69 = *(float **)v68;
LABEL_176:
                                    if (v69)
                                    {
                                      float v86 = *v69;
                                      BOOL v87 = *v69 == 1.0;
                                      if (v68[10] && v86 != 0.0 && v86 != 1.0)
                                      {
LABEL_183:
                                        if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v68, 0x1Eu, v13, 0))goto LABEL_186; {
                                        unsigned int v88 = 1;
                                        }
LABEL_185:
                                        if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v68, 0x1Eu, v13, v88))goto LABEL_196; {
LABEL_186:
                                        }
                                        if (v69)
                                        {
                                          float v89 = *v69;
                                          BOOL v90 = *v69 == 1.0;
                                          if (v68[10] && v89 != 0.0 && v89 != 1.0) {
                                            goto LABEL_193;
                                          }
                                        }
                                        else
                                        {
                                          BOOL v90 = 0;
                                        }
                                        unsigned int v91 = v68[v90 + 11];
                                        float v89 = 0.0;
                                        if (v91 != 2)
                                        {
                                          float v93 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x1Eu, v13, v91, 0);
                                          goto LABEL_195;
                                        }
LABEL_193:
                                        LOBYTE(buf) = 1;
                                        char v455 = 1;
                                        float v92 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x1Eu, v13, 0, &buf);
                                        float v93 = v92
                                            + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x1Eu, v13, 1u, &v455)- v92)* v89);
LABEL_195:
                                        double v94 = v93;
                                        self->_headingSpring._kSpring = v94 * v94;
                                        self->_headingSpring._kDamper = v94 + v94;
                                        v68 = *(unsigned __int8 **)(v452[0] + 24);
                                        v69 = *(float **)v68;
LABEL_196:
                                        if (v69)
                                        {
                                          float v95 = *v69;
                                          BOOL v96 = *v69 == 1.0;
                                          if (v68[10] && v95 != 0.0 && v95 != 1.0)
                                          {
LABEL_203:
                                            if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v68, 0x1Du, v13, 0))goto LABEL_206; {
                                            unsigned int v97 = 1;
                                            }
LABEL_205:
                                            if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v68, 0x1Du, v13, v97))goto LABEL_216; {
LABEL_206:
                                            }
                                            if (v69)
                                            {
                                              float v98 = *v69;
                                              BOOL v99 = *v69 == 1.0;
                                              if (v68[10] && v98 != 0.0 && v98 != 1.0) {
                                                goto LABEL_213;
                                              }
                                            }
                                            else
                                            {
                                              BOOL v99 = 0;
                                            }
                                            unsigned int v100 = v68[v99 + 11];
                                            float v98 = 0.0;
                                            if (v100 != 2)
                                            {
                                              float v102 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x1Du, v13, v100, 0);
                                              goto LABEL_215;
                                            }
LABEL_213:
                                            LOBYTE(buf) = 1;
                                            char v455 = 1;
                                            float v101 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x1Du, v13, 0, &buf);
                                            float v102 = v101
                                                 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x1Du, v13, 1u, &v455)- v101)* v98);
LABEL_215:
                                            double v103 = v102;
                                            self->_pitchSpring._kSpring = v103 * v103;
                                            self->_pitchSpring._kDamper = v103 + v103;
                                            v68 = *(unsigned __int8 **)(v452[0] + 24);
                                            v69 = *(float **)v68;
LABEL_216:
                                            if (v69)
                                            {
                                              float v104 = *v69;
                                              BOOL v105 = *v69 == 1.0;
                                              if (v68[10] && v104 != 0.0 && v104 != 1.0)
                                              {
LABEL_223:
                                                if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v68, 0x1Fu, v13, 0))goto LABEL_226; {
                                                unsigned int v106 = 1;
                                                }
LABEL_225:
                                                if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v68, 0x1Fu, v13, v106))goto LABEL_236; {
LABEL_226:
                                                }
                                                if (v69)
                                                {
                                                  float v107 = *v69;
                                                  BOOL v108 = *v69 == 1.0;
                                                  if (v68[10] && v107 != 0.0 && v107 != 1.0) {
                                                    goto LABEL_233;
                                                  }
                                                }
                                                else
                                                {
                                                  BOOL v108 = 0;
                                                }
                                                unsigned int v109 = v68[v108 + 11];
                                                float v107 = 0.0;
                                                if (v109 != 2)
                                                {
                                                  float v111 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x1Fu, v13, v109, 0);
                                                  goto LABEL_235;
                                                }
LABEL_233:
                                                LOBYTE(buf) = 1;
                                                char v455 = 1;
                                                float v110 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x1Fu, v13, 0, &buf);
                                                float v111 = v110
                                                     + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v68, 0x1Fu, v13, 1u, &v455)- v110)* v107);
LABEL_235:
                                                double v112 = v111;
                                                self->_screenPositionSpring._kSpring = v112 * v112;
                                                self->_screenPositionSpring._kDamper = v112 + v112;
                                                v68 = *(unsigned __int8 **)(v452[0] + 24);
                                                v69 = *(float **)v68;
LABEL_236:
                                                if (v69)
                                                {
                                                  float v113 = *v69;
                                                  BOOL v114 = *v69 == 1.0;
                                                  if (v68[10] && v113 != 0.0 && v113 != 1.0)
                                                  {
LABEL_243:
                                                    if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v68, 0x20u, v13, 0))goto LABEL_246; {
                                                    unsigned int v115 = 1;
                                                    }
LABEL_245:
                                                    if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v68, 0x20u, v13, v115))goto LABEL_256; {
LABEL_246:
                                                    }
                                                    if (v69)
                                                    {
                                                      *(float *)&long long v116 = *v69;
                                                      BOOL v117 = *v69 == 1.0;
                                                      if (v68[10] && *(float *)&v116 != 0.0 && *(float *)&v116 != 1.0) {
                                                        goto LABEL_253;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      BOOL v117 = 0;
                                                    }
                                                    int v118 = v68[v117 + 11];
                                                    *(void *)&long long v116 = 0;
                                                    if (v118 != 2)
                                                    {
                                                      Matrix<float, 2, 1> v120 = *(Matrix<float, 2, 1> *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<gm::Matrix<float,2,1>>(v68, v13, v118, 0);
                                                      goto LABEL_255;
                                                    }
LABEL_253:
                                                    long long v451 = v116;
                                                    LOBYTE(buf) = 1;
                                                    char v455 = 1;
                                                    float32x2_t v119 = *(float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<gm::Matrix<float,2,1>>(v68, v13, 0, &buf);
                                                    Matrix<float, 2, 1> v120 = (Matrix<float, 2, 1>)vmla_n_f32(v119, vsub_f32(*(float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<gm::Matrix<float,2,1>>(v68, v13, 1, &v455), v119), *(float *)&v451);
LABEL_255:
                                                    self->_puckMovementBoundsMin = v120;
LABEL_256:
                                                    if (*(void *)&v42 == *(void *)&self->_routeFocusCoordinate.longitude._value) {
                                                      goto LABEL_935;
                                                    }
                                                    unint64_t v121 = *(void *)(v452[0] + 24);
                                                    v122 = *(float **)v121;
                                                    if (*(void *)v121)
                                                    {
                                                      float v123 = *v122;
                                                      BOOL v124 = *v122 == 1.0;
                                                      if (*(unsigned char *)(v121 + 10) && v123 != 0.0 && v123 != 1.0)
                                                      {
LABEL_264:
                                                        if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(*(void *)(v452[0] + 24), 0x16u, 0))goto LABEL_267; {
                                                        unsigned int v125 = 1;
                                                        }
LABEL_266:
                                                        if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v121, 0x16u, v125))goto LABEL_277; {
LABEL_267:
                                                        }
                                                        if (v122)
                                                        {
                                                          float v126 = *v122;
                                                          BOOL v127 = *v122 == 1.0;
                                                          if (*(unsigned char *)(v121 + 10) && v126 != 0.0 && v126 != 1.0) {
                                                            goto LABEL_274;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          BOOL v127 = 0;
                                                        }
                                                        unsigned int v128 = *(unsigned __int8 *)(v121 + v127 + 11);
                                                        float v126 = 0.0;
                                                        if (v128 != 2)
                                                        {
                                                          float v130 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v121, 0x16u, v128, 0);
                                                          goto LABEL_276;
                                                        }
LABEL_274:
                                                        LOBYTE(buf) = 1;
                                                        char v455 = 1;
                                                        v129 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v121, 0x16u, 0, &buf);
                                                        float v130 = *v129
                                                             + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v121, 0x16u, 1u, &v455)- *v129)* v126);
LABEL_276:
                                                        self->_cameraDistanceFromTarget._value = v130;
                                                        unint64_t v121 = *(void *)(v452[0] + 24);
                                                        v122 = *(float **)v121;
LABEL_277:
                                                        if (v122)
                                                        {
                                                          float v131 = *v122;
                                                          BOOL v132 = *v122 == 1.0;
                                                          if (*(unsigned char *)(v121 + 10) && v131 != 0.0 && v131 != 1.0)
                                                          {
LABEL_284:
                                                            if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v121, 0x17u, 0))goto LABEL_287; {
                                                            unsigned int v133 = 1;
                                                            }
LABEL_286:
                                                            if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v121, 0x17u, v133))goto LABEL_300; {
LABEL_287:
                                                            }
                                                            if (v122)
                                                            {
                                                              float v134 = *v122;
                                                              BOOL v135 = *v122 == 1.0;
                                                              if (*(unsigned char *)(v121 + 10) && v134 != 0.0 && v134 != 1.0) {
                                                                goto LABEL_294;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              BOOL v135 = 0;
                                                            }
                                                            unsigned int v136 = *(unsigned __int8 *)(v121 + v135 + 11);
                                                            float v134 = 0.0;
                                                            if (v136 != 2)
                                                            {
                                                              int v140 = *(_DWORD *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v121, 0x17u, v136, 0);
LABEL_299:
                                                              self->_cameraType = v140;
                                                              unint64_t v121 = *(void *)(v452[0] + 24);
                                                              v122 = *(float **)v121;
LABEL_300:
                                                              if (v122)
                                                              {
                                                                float v141 = *v122;
                                                                BOOL v142 = *v122 == 1.0;
                                                                if (*(unsigned char *)(v121 + 10) && v141 != 0.0 && v141 != 1.0)
                                                                {
LABEL_307:
                                                                  if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v121, 0x18u, 0))goto LABEL_310; {
                                                                  unsigned int v143 = 1;
                                                                  }
LABEL_309:
                                                                  if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v121, 0x18u, v143))goto LABEL_320; {
LABEL_310:
                                                                  }
                                                                  if (v122)
                                                                  {
                                                                    float v144 = *v122;
                                                                    BOOL v145 = *v122 == 1.0;
                                                                    if (*(unsigned char *)(v121 + 10)
                                                                      && v144 != 0.0
                                                                      && v144 != 1.0)
                                                                    {
                                                                      goto LABEL_317;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    BOOL v145 = 0;
                                                                  }
                                                                  unsigned int v146 = *(unsigned __int8 *)(v121 + v145 + 11);
                                                                  float v144 = 0.0;
                                                                  if (v146 != 2)
                                                                  {
                                                                    float v148 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v121, 0x18u, v146, 0);
                                                                    goto LABEL_319;
                                                                  }
LABEL_317:
                                                                  LOBYTE(buf) = 1;
                                                                  char v455 = 1;
                                                                  v147 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v121, 0x18u, 0, &buf);
                                                                  float v148 = *v147
                                                                       + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v121, 0x18u, 1u, &v455)- *v147)* v144);
LABEL_319:
                                                                  *(double *)&self->_styleManeuversToFrame = v148;
                                                                  unint64_t v121 = *(void *)(v452[0] + 24);
                                                                  v122 = *(float **)v121;
LABEL_320:
                                                                  if (v122)
                                                                  {
                                                                    float v149 = *v122;
                                                                    BOOL v150 = *v122 == 1.0;
                                                                    if (*(unsigned char *)(v121 + 10)
                                                                      && v149 != 0.0
                                                                      && v149 != 1.0)
                                                                    {
LABEL_327:
                                                                      if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v121, 0x19u, 0))goto LABEL_330; {
                                                                      unsigned int v151 = 1;
                                                                      }
LABEL_329:
                                                                      if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v121, 0x19u, v151))goto LABEL_340; {
LABEL_330:
                                                                      }
                                                                      if (v122)
                                                                      {
                                                                        float v152 = *v122;
                                                                        BOOL v153 = *v122 == 1.0;
                                                                        if (*(unsigned char *)(v121 + 10)
                                                                          && v152 != 0.0
                                                                          && v152 != 1.0)
                                                                        {
                                                                          goto LABEL_337;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        BOOL v153 = 0;
                                                                      }
                                                                      unsigned int v154 = *(unsigned __int8 *)(v121 + v153 + 11);
                                                                      float v152 = 0.0;
                                                                      if (v154 != 2)
                                                                      {
                                                                        float v156 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v121, 0x19u, v154, 0);
                                                                        goto LABEL_339;
                                                                      }
LABEL_337:
                                                                      LOBYTE(buf) = 1;
                                                                      char v455 = 1;
                                                                      v155 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v121, 0x19u, 0, &buf);
                                                                      float v156 = *v155
                                                                           + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v121, 0x19u, 1u, &v455)
                                                                                           - *v155)
                                                                                   * v152);
LABEL_339:
                                                                      *(double *)&self->_coordinatesToFrame.__end_cap_.__value_ = v156;
                                                                      unint64_t v121 = *(void *)(v452[0] + 24);
                                                                      v122 = *(float **)v121;
LABEL_340:
                                                                      if (v122)
                                                                      {
                                                                        float v157 = *v122;
                                                                        BOOL v158 = *v122 == 1.0;
                                                                        if (*(unsigned char *)(v121 + 10)
                                                                          && v157 != 0.0
                                                                          && v157 != 1.0)
                                                                        {
LABEL_347:
                                                                          if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v121, 0x1Au, 0))goto LABEL_350; {
                                                                          unsigned int v159 = 1;
                                                                          }
LABEL_349:
                                                                          if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v121, 0x1Au, v159))
                                                                          {
                                                                            char v162 = 1;
                                                                            goto LABEL_363;
                                                                          }
LABEL_350:
                                                                          if (v122)
                                                                          {
                                                                            float v160 = *v122;
                                                                            BOOL v161 = *v122 == 1.0;
                                                                            if (*(unsigned char *)(v121 + 10)
                                                                              && v160 != 0.0
                                                                              && v160 != 1.0)
                                                                            {
                                                                              goto LABEL_358;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            BOOL v161 = 0;
                                                                          }
                                                                          unsigned int v163 = *(unsigned __int8 *)(v121 + v161 + 11);
                                                                          float v160 = 0.0;
                                                                          if (v163 != 2)
                                                                          {
                                                                            char v162 = *(unsigned char *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v121, 0x1Au, v163, 0);
                                                                            goto LABEL_363;
                                                                          }
LABEL_358:
                                                                          LOBYTE(buf) = 1;
                                                                          char v455 = 1;
                                                                          unint64_t v164 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v121, 0x1Au, 0, &buf);
                                                                          unint64_t v165 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v121, 0x1Au, 1u, &v455);
                                                                          if (v160 >= 1.0) {
                                                                            v166 = (char *)v165;
                                                                          }
                                                                          else {
                                                                            v166 = (char *)v164;
                                                                          }
                                                                          char v162 = *v166;
LABEL_363:
                                                                          LOBYTE(self->_coordinatesToFrame.__end_) = v162;
                                                                          unint64_t v167 = *(void *)(v452[0] + 24);
                                                                          v168 = *(float **)v167;
                                                                          if (*(void *)v167)
                                                                          {
                                                                            float v169 = *v168;
                                                                            BOOL v170 = *v168 == 1.0;
                                                                            if (*(unsigned char *)(v167 + 10)
                                                                              && v169 != 0.0
                                                                              && v169 != 1.0)
                                                                            {
LABEL_370:
                                                                              if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(*(void *)(v452[0] + 24), 0x4Fu, 0))goto LABEL_373; {
                                                                              unsigned int v171 = 1;
                                                                              }
LABEL_372:
                                                                              if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v167, 0x4Fu, v171))
                                                                              {
                                                                                char v174 = 0;
                                                                                goto LABEL_386;
                                                                              }
LABEL_373:
                                                                              if (v168)
                                                                              {
                                                                                float v172 = *v168;
                                                                                BOOL v173 = *v168 == 1.0;
                                                                                if (*(unsigned char *)(v167 + 10)
                                                                                  && v172 != 0.0
                                                                                  && v172 != 1.0)
                                                                                {
                                                                                  goto LABEL_381;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                BOOL v173 = 0;
                                                                              }
                                                                              unsigned int v175 = *(unsigned __int8 *)(v167 + v173 + 11);
                                                                              float v172 = 0.0;
                                                                              if (v175 != 2)
                                                                              {
                                                                                char v174 = *(unsigned char *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v167, 0x4Fu, v175, 0);
                                                                                goto LABEL_386;
                                                                              }
LABEL_381:
                                                                              LOBYTE(buf) = 1;
                                                                              char v455 = 1;
                                                                              unint64_t v176 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v167, 0x4Fu, 0, &buf);
                                                                              unint64_t v177 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v167, 0x4Fu, 1u, &v455);
                                                                              if (v172 >= 1.0) {
                                                                                v178 = (char *)v177;
                                                                              }
                                                                              else {
                                                                                v178 = (char *)v176;
                                                                              }
                                                                              char v174 = *v178;
LABEL_386:
                                                                              BYTE2(self->_coordinatesToFrame.__end_) = v174;
                                                                              unint64_t v179 = *(void *)(v452[0] + 24);
                                                                              v180 = *(float **)v179;
                                                                              if (*(void *)v179)
                                                                              {
                                                                                float v181 = *v180;
                                                                                BOOL v182 = *v180 == 1.0;
                                                                                if (*(unsigned char *)(v179 + 10)
                                                                                  && v181 != 0.0
                                                                                  && v181 != 1.0)
                                                                                {
LABEL_393:
                                                                                  if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(*(void *)(v452[0] + 24), 0x56u, 0))goto LABEL_396; {
                                                                                  unsigned int v183 = 1;
                                                                                  }
LABEL_395:
                                                                                  if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v179, 0x56u, v183))
                                                                                  {
                                                                                    char v186 = 0;
                                                                                    goto LABEL_409;
                                                                                  }
LABEL_396:
                                                                                  if (v180)
                                                                                  {
                                                                                    float v184 = *v180;
                                                                                    BOOL v185 = *v180 == 1.0;
                                                                                    if (*(unsigned char *)(v179 + 10)
                                                                                      && v184 != 0.0
                                                                                      && v184 != 1.0)
                                                                                    {
                                                                                      goto LABEL_404;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    BOOL v185 = 0;
                                                                                  }
                                                                                  unsigned int v187 = *(unsigned __int8 *)(v179 + v185 + 11);
                                                                                  float v184 = 0.0;
                                                                                  if (v187 != 2)
                                                                                  {
                                                                                    char v186 = *(unsigned char *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v179, 0x56u, v187, 0);
                                                                                    goto LABEL_409;
                                                                                  }
LABEL_404:
                                                                                  LOBYTE(buf) = 1;
                                                                                  char v455 = 1;
                                                                                  unint64_t v188 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v179, 0x56u, 0, &buf);
                                                                                  unint64_t v189 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v179, 0x56u, 1u, &v455);
                                                                                  if (v184 >= 1.0) {
                                                                                    v190 = (char *)v189;
                                                                                  }
                                                                                  else {
                                                                                    v190 = (char *)v188;
                                                                                  }
                                                                                  char v186 = *v190;
LABEL_409:
                                                                                  BYTE3(self->_coordinatesToFrame.__end_) = v186;
                                                                                  uint64_t v191 = *(void *)(v452[0] + 24);
                                                                                  v192 = *(float **)v191;
                                                                                  if (*(void *)v191
                                                                                    && (float v193 = *v192,
                                                                                        LODWORD(v192) = *v192 == 1.0,
                                                                                        *(unsigned char *)(v191 + 10))
                                                                                    && v193 != 0.0
                                                                                    && v193 != 1.0
                                                                                    || (unsigned int v194 = *(unsigned __int8 *)(v191 + v192 + 11),
                                                                                        v194 == 2))
                                                                                  {
                                                                                    if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(*(void *)(v452[0] + 24), 0x57u, 0))goto LABEL_417; {
                                                                                    unsigned int v194 = 1;
                                                                                    }
                                                                                  }
                                                                                  if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v191, 0x57u, v194))
                                                                                  {
                                                                                    GEOConfigGetDouble();
                                                                                    goto LABEL_426;
                                                                                  }
LABEL_417:
                                                                                  GEOConfigGetDouble();
                                                                                  double v196 = v195;
                                                                                  uint64_t v197 = *(void *)(v452[0] + 24);
                                                                                  v198 = *(float **)v197;
                                                                                  if (*(void *)v197
                                                                                    && (float v199 = *v198,
                                                                                        LODWORD(v198) = *v198 == 1.0,
                                                                                        *(unsigned char *)(v197 + 10))
                                                                                    && v199 != 0.0
                                                                                    && v199 != 1.0
                                                                                    || (unsigned int v200 = *(unsigned __int8 *)(v197 + v198 + 11),
                                                                                        float v199 = 0.0,
                                                                                        v200 == 2))
                                                                                  {
                                                                                    LOBYTE(buf) = 1;
                                                                                    char v455 = 1;
                                                                                    v201 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v197, 0x57u, 0, &buf);
                                                                                    float v202 = *v201
                                                                                         + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v197, 0x57u, 1u, &v455) - *v201)
                                                                                                 * v199);
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    float v202 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(*(void *)(v452[0] + 24), 0x57u, v200, 0);
                                                                                  }
                                                                                  double v203 = fmin(v196, v202);
LABEL_426:
                                                                                  self->_lastProjectedPosition._e[1] = v203;
                                                                                  uint64_t v204 = *(void *)(v452[0] + 24);
                                                                                  v205 = *(float **)v204;
                                                                                  if (*(void *)v204)
                                                                                  {
                                                                                    float v206 = *v205;
                                                                                    BOOL v207 = *v205 == 1.0;
                                                                                    if (*(unsigned char *)(v204 + 10)
                                                                                      && v206 != 0.0
                                                                                      && v206 != 1.0)
                                                                                    {
LABEL_433:
                                                                                      if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(*(void *)(v452[0] + 24), 0x1Cu, 0))goto LABEL_436; {
                                                                                      unsigned int v208 = 1;
                                                                                      }
LABEL_435:
                                                                                      if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v204, 0x1Cu, v208)) {
                                                                                        goto LABEL_446;
                                                                                      }
LABEL_436:
                                                                                      if (v205)
                                                                                      {
                                                                                        float v209 = *v205;
                                                                                        BOOL v210 = *v205 == 1.0;
                                                                                        if (*(unsigned char *)(v204 + 10)
                                                                                          && v209 != 0.0
                                                                                          && v209 != 1.0)
                                                                                        {
                                                                                          goto LABEL_443;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        BOOL v210 = 0;
                                                                                      }
                                                                                      unsigned int v211 = *(unsigned __int8 *)(v204 + v210 + 11);
                                                                                      float v209 = 0.0;
                                                                                      if (v211 != 2)
                                                                                      {
                                                                                        float v213 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v204, 0x1Cu, v211, 0);
                                                                                        goto LABEL_445;
                                                                                      }
LABEL_443:
                                                                                      LOBYTE(buf) = 1;
                                                                                      char v455 = 1;
                                                                                      v212 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v204, 0x1Cu, 0, &buf);
                                                                                      float v213 = *v212
                                                                                           + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v204, 0x1Cu, 1u, &v455) - *v212) * v209);
LABEL_445:
                                                                                      double v214 = v213;
                                                                                      self->_distanceFromTargetSpring._kSpring = v214 * v214;
                                                                                      self->_distanceFromTargetSpring._kDamper = v214 + v214;
                                                                                      uint64_t v204 = *(void *)(v452[0] + 24);
                                                                                      v205 = *(float **)v204;
LABEL_446:
                                                                                      if (v205)
                                                                                      {
                                                                                        float v215 = *v205;
                                                                                        BOOL v216 = *v205 == 1.0;
                                                                                        if (*(unsigned char *)(v204 + 10)
                                                                                          && v215 != 0.0
                                                                                          && v215 != 1.0)
                                                                                        {
LABEL_453:
                                                                                          if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v204, 0x21u, 0))goto LABEL_456; {
                                                                                          unsigned int v217 = 1;
                                                                                          }
LABEL_455:
                                                                                          if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v204, 0x21u, v217)) {
                                                                                            goto LABEL_466;
                                                                                          }
LABEL_456:
                                                                                          if (v205)
                                                                                          {
                                                                                            *(float *)&long long v218 = *v205;
                                                                                            BOOL v219 = *v205 == 1.0;
                                                                                            if (*(unsigned char *)(v204 + 10)
                                                                                              && *(float *)&v218 != 0.0
                                                                                              && *(float *)&v218 != 1.0)
                                                                                            {
                                                                                              goto LABEL_463;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            BOOL v219 = 0;
                                                                                          }
                                                                                          unsigned int v220 = *(unsigned __int8 *)(v204 + v219 + 11);
                                                                                          *(void *)&long long v218 = 0;
                                                                                          if (v220 != 2)
                                                                                          {
                                                                                            float32x2_t v222 = *(float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<gm::Matrix<float,2,1>>(v204, 0x21u, v220, 0);
                                                                                            goto LABEL_465;
                                                                                          }
LABEL_463:
                                                                                          long long v451 = v218;
                                                                                          LOBYTE(buf) = 1;
                                                                                          char v455 = 1;
                                                                                          v221 = (float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<gm::Matrix<float,2,1>>(v204, 0x21u, 0, &buf);
                                                                                          float32x2_t v222 = vmla_n_f32(*v221, vsub_f32(*(float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<gm::Matrix<float,2,1>>(v204, 0x21u, 1u, &v455), *v221), *(float *)&v451);
LABEL_465:
                                                                                          *(float32x2_t *)&self->_clientFramingInsets.top = v222;
                                                                                          uint64_t v204 = *(void *)(v452[0] + 24);
                                                                                          v205 = *(float **)v204;
LABEL_466:
                                                                                          if (v205)
                                                                                          {
                                                                                            float v223 = *v205;
                                                                                            BOOL v224 = *v205 == 1.0;
                                                                                            if (*(unsigned char *)(v204 + 10)
                                                                                              && v223 != 0.0
                                                                                              && v223 != 1.0)
                                                                                            {
LABEL_473:
                                                                                              if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v204, 0x3Fu, 0)) {
                                                                                                goto LABEL_476;
                                                                                              }
                                                                                              unsigned int v225 = 1;
LABEL_475:
                                                                                              if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v204, 0x3Fu, v225))
                                                                                              {
                                                                                                v227.i32[0] = LODWORD(self->_clientFramingInsets.top);
                                                                                                goto LABEL_487;
                                                                                              }
LABEL_476:
                                                                                              if (v205)
                                                                                              {
                                                                                                *(float *)&long long v226 = *v205;
                                                                                                BOOL v228 = *v205 == 1.0;
                                                                                                if (*(unsigned char *)(v204 + 10) && *(float *)&v226 != 0.0 && *(float *)&v226 != 1.0) {
                                                                                                  goto LABEL_484;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                BOOL v228 = 0;
                                                                                              }
                                                                                              unsigned int v229 = *(unsigned __int8 *)(v204 + v228 + 11);
                                                                                              *(void *)&long long v226 = 0;
                                                                                              if (v229 != 2)
                                                                                              {
                                                                                                float32x2_t v227 = *(float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<gm::Matrix<float,2,1>>(v204, 0x3Fu, v229, 0);
                                                                                                goto LABEL_486;
                                                                                              }
LABEL_484:
                                                                                              long long v451 = v226;
                                                                                              LOBYTE(buf) = 1;
                                                                                              char v455 = 1;
                                                                                              v230 = (float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<gm::Matrix<float,2,1>>(v204, 0x3Fu, 0, &buf);
                                                                                              float32x2_t v227 = vmla_n_f32(*v230, vsub_f32(*(float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<gm::Matrix<float,2,1>>(v204, 0x3Fu, 1u, &v455), *v230), *(float *)&v451);
LABEL_486:
                                                                                              uint64_t v204 = *(void *)(v452[0] + 24);
                                                                                              v205 = *(float **)v204;
LABEL_487:
                                                                                              *(float32x2_t *)&self->_clientFramingInsets.bottom = v227;
                                                                                              if (v205)
                                                                                              {
                                                                                                float v231 = *v205;
                                                                                                BOOL v232 = *v205 == 1.0;
                                                                                                if (*(unsigned char *)(v204 + 10) && v231 != 0.0 && v231 != 1.0) {
                                                                                                  goto LABEL_494;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                BOOL v232 = 0;
                                                                                              }
                                                                                              unsigned int v233 = *(unsigned __int8 *)(v204 + v232 + 11);
                                                                                              float v231 = 0.0;
                                                                                              if (v233 != 2)
                                                                                              {
                                                                                                int v237 = *(_DWORD *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v204, 0x22u, v233, 0);
                                                                                                goto LABEL_499;
                                                                                              }
LABEL_494:
                                                                                              LOBYTE(buf) = 1;
                                                                                              char v455 = 1;
                                                                                              uint64_t v234 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v204, 0x22u, 0, &buf);
                                                                                              uint64_t v235 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v204, 0x22u, 1u, &v455);
                                                                                              if (v231 >= 1.0) {
                                                                                                v236 = (int *)v235;
                                                                                              }
                                                                                              else {
                                                                                                v236 = (int *)v234;
                                                                                              }
                                                                                              int v237 = *v236;
LABEL_499:
                                                                                              self->_previousMapEdgeInsets.left = (float)v237;
                                                                                              uint64_t v238 = *(void *)(v452[0] + 24);
                                                                                              v239 = *(float **)v238;
                                                                                              if (*(void *)v238
                                                                                                && (float v240 = *v239,
                                                                                                    LODWORD(v239) = *v239 == 1.0,
                                                                                                    *(unsigned char *)(v238 + 10))
                                                                                                && v240 != 0.0
                                                                                                && v240 != 1.0
                                                                                                || (unsigned int v241 = *(unsigned __int8 *)(v238 + v239 + 11),
                                                                                                    float v240 = 0.0,
                                                                                                    v241 == 2))
                                                                                              {
                                                                                                LOBYTE(buf) = 1;
                                                                                                char v455 = 1;
                                                                                                uint64_t v242 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v238, 0x23u, 0, &buf);
                                                                                                uint64_t v243 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v238, 0x23u, 1u, &v455);
                                                                                                if (v240 >= 1.0) {
                                                                                                  v244 = (int *)v243;
                                                                                                }
                                                                                                else {
                                                                                                  v244 = (int *)v242;
                                                                                                }
                                                                                                int v245 = *v244;
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                int v245 = *(_DWORD *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(*(void *)(v452[0] + 24), 0x23u, v241, 0);
                                                                                              }
                                                                                              self->_previousMapEdgeInsets.right = (float)(__int16)v245;
                                                                                              uint64_t v246 = *(void *)(v452[0] + 24);
                                                                                              v247 = *(float **)v246;
                                                                                              if (*(void *)v246
                                                                                                && (float v248 = *v247,
                                                                                                    LODWORD(v247) = *v247 == 1.0,
                                                                                                    *(unsigned char *)(v246 + 10))
                                                                                                && v248 != 0.0
                                                                                                && v248 != 1.0
                                                                                                || (unsigned int v249 = *(unsigned __int8 *)(v246 + v247 + 11),
                                                                                                    float v248 = 0.0,
                                                                                                    v249 == 2))
                                                                                              {
                                                                                                LOBYTE(buf) = 1;
                                                                                                char v455 = 1;
                                                                                                uint64_t v250 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v246, 0x24u, 0, &buf);
                                                                                                uint64_t v251 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v246, 0x24u, 1u, &v455);
                                                                                                if (v248 >= 1.0) {
                                                                                                  v252 = (int *)v251;
                                                                                                }
                                                                                                else {
                                                                                                  v252 = (int *)v250;
                                                                                                }
                                                                                                int v253 = *v252;
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                int v253 = *(_DWORD *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(*(void *)(v452[0] + 24), 0x24u, v249, 0);
                                                                                              }
                                                                                              self->_previousMapEdgeInsets.top = (float)v253;
                                                                                              uint64_t v254 = *(void *)(v452[0] + 24);
                                                                                              v255 = *(float **)v254;
                                                                                              if (*(void *)v254
                                                                                                && (float v256 = *v255,
                                                                                                    LODWORD(v255) = *v255 == 1.0,
                                                                                                    *(unsigned char *)(v254 + 10))
                                                                                                && v256 != 0.0
                                                                                                && v256 != 1.0
                                                                                                || (unsigned int v257 = *(unsigned __int8 *)(v254 + v255 + 11),
                                                                                                    float v256 = 0.0,
                                                                                                    v257 == 2))
                                                                                              {
                                                                                                LOBYTE(buf) = 1;
                                                                                                char v455 = 1;
                                                                                                uint64_t v258 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v254, 0x25u, 0, &buf);
                                                                                                uint64_t v259 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v254, 0x25u, 1u, &v455);
                                                                                                if (v256 >= 1.0) {
                                                                                                  v260 = (int *)v259;
                                                                                                }
                                                                                                else {
                                                                                                  v260 = (int *)v258;
                                                                                                }
                                                                                                int v261 = *v260;
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                int v261 = *(_DWORD *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(*(void *)(v452[0] + 24), 0x25u, v257, 0);
                                                                                              }
                                                                                              self->_previousMapEdgeInsets.bottom = (float)v261;
                                                                                              uint64_t v262 = *(void *)(v452[0] + 24);
                                                                                              v263 = *(float **)v262;
                                                                                              if (*(void *)v262
                                                                                                && (float v264 = *v263,
                                                                                                    LODWORD(v263) = *v263 == 1.0,
                                                                                                    *(unsigned char *)(v262 + 10))
                                                                                                && v264 != 0.0
                                                                                                && v264 != 1.0
                                                                                                || (unsigned int v265 = *(unsigned __int8 *)(v262 + v263 + 11),
                                                                                                    float v264 = 0.0,
                                                                                                    v265 == 2))
                                                                                              {
                                                                                                LOBYTE(buf) = 1;
                                                                                                char v455 = 1;
                                                                                                v266 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v262, 0x44u, 0, &buf);
                                                                                                float v267 = *v266 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v262, 0x44u, 1u, &v455) - *v266) * v264);
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                float v267 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(*(void *)(v452[0] + 24), 0x44u, v265, 0);
                                                                                              }
                                                                                              self->_framingEdgeInset.left = v267;
                                                                                              uint64_t v268 = *(void *)(v452[0] + 24);
                                                                                              v269 = *(float **)v268;
                                                                                              if (*(void *)v268
                                                                                                && (float v270 = *v269,
                                                                                                    LODWORD(v269) = *v269 == 1.0,
                                                                                                    *(unsigned char *)(v268 + 10))
                                                                                                && v270 != 0.0
                                                                                                && v270 != 1.0
                                                                                                || (unsigned int v271 = *(unsigned __int8 *)(v268 + v269 + 11),
                                                                                                    float v270 = 0.0,
                                                                                                    v271 == 2))
                                                                                              {
                                                                                                LOBYTE(buf) = 1;
                                                                                                char v455 = 1;
                                                                                                v272 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v268, 0x45u, 0, &buf);
                                                                                                float v273 = *v272 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v268, 0x45u, 1u, &v455) - *v272) * v270);
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                float v273 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(*(void *)(v452[0] + 24), 0x45u, v271, 0);
                                                                                              }
                                                                                              self->_framingEdgeInset.right = v273;
                                                                                              uint64_t v274 = *(void *)(v452[0] + 24);
                                                                                              v275 = *(float **)v274;
                                                                                              if (*(void *)v274
                                                                                                && (float v276 = *v275,
                                                                                                    LODWORD(v275) = *v275 == 1.0,
                                                                                                    *(unsigned char *)(v274 + 10))
                                                                                                && v276 != 0.0
                                                                                                && v276 != 1.0
                                                                                                || (unsigned int v277 = *(unsigned __int8 *)(v274 + v275 + 11),
                                                                                                    float v276 = 0.0,
                                                                                                    v277 == 2))
                                                                                              {
                                                                                                LOBYTE(buf) = 1;
                                                                                                char v455 = 1;
                                                                                                v278 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v274, 0x46u, 0, &buf);
                                                                                                float v279 = *v278 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v274, 0x46u, 1u, &v455) - *v278) * v276);
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                float v279 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(*(void *)(v452[0] + 24), 0x46u, v277, 0);
                                                                                              }
                                                                                              self->_framingEdgeInset.top = v279;
                                                                                              uint64_t v280 = *(void *)(v452[0] + 24);
                                                                                              v281 = *(float **)v280;
                                                                                              if (*(void *)v280
                                                                                                && (float v282 = *v281,
                                                                                                    LODWORD(v281) = *v281 == 1.0,
                                                                                                    *(unsigned char *)(v280 + 10))
                                                                                                && v282 != 0.0
                                                                                                && v282 != 1.0
                                                                                                || (unsigned int v283 = *(unsigned __int8 *)(v280 + v281 + 11),
                                                                                                    float v282 = 0.0,
                                                                                                    v283 == 2))
                                                                                              {
                                                                                                LOBYTE(buf) = 1;
                                                                                                char v455 = 1;
                                                                                                v284 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v280, 0x47u, 0, &buf);
                                                                                                float v285 = *v284 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v280, 0x47u, 1u, &v455) - *v284) * v282);
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                float v285 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(*(void *)(v452[0] + 24), 0x47u, v283, 0);
                                                                                              }
                                                                                              self->_framingEdgeInset.bottom = v285;
                                                                                              unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                              v287 = *(float **)v286;
                                                                                              if (*(void *)v286)
                                                                                              {
                                                                                                float v288 = *v287;
                                                                                                BOOL v289 = *v287 == 1.0;
                                                                                                if (*(unsigned char *)(v286 + 10) && v288 != 0.0 && v288 != 1.0)
                                                                                                {
LABEL_564:
                                                                                                  if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(*(void *)(v452[0] + 24), 0x26u, 0)) {
                                                                                                    goto LABEL_567;
                                                                                                  }
                                                                                                  unsigned int v290 = 1;
LABEL_566:
                                                                                                  if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x26u, v290)) {
                                                                                                    goto LABEL_577;
                                                                                                  }
LABEL_567:
                                                                                                  if (v287)
                                                                                                  {
                                                                                                    float v291 = *v287;
                                                                                                    BOOL v292 = *v287 == 1.0;
                                                                                                    if (*(unsigned char *)(v286 + 10) && v291 != 0.0 && v291 != 1.0) {
                                                                                                      goto LABEL_574;
                                                                                                    }
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    BOOL v292 = 0;
                                                                                                  }
                                                                                                  unsigned int v293 = *(unsigned __int8 *)(v286 + v292 + 11);
                                                                                                  float v291 = 0.0;
                                                                                                  if (v293 != 2)
                                                                                                  {
                                                                                                    float v295 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x26u, v293, 0);
                                                                                                    goto LABEL_576;
                                                                                                  }
LABEL_574:
                                                                                                  LOBYTE(buf) = 1;
                                                                                                  char v455 = 1;
                                                                                                  v294 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x26u, 0, &buf);
                                                                                                  float v295 = *v294 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x26u, 1u, &v455) - *v294) * v291);
LABEL_576:
                                                                                                  *(double *)&self->_puckMovementBoundsMax = v295;
                                                                                                  unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                  v287 = *(float **)v286;
LABEL_577:
                                                                                                  if (v287)
                                                                                                  {
                                                                                                    float v296 = *v287;
                                                                                                    BOOL v297 = *v287 == 1.0;
                                                                                                    if (*(unsigned char *)(v286 + 10) && v296 != 0.0 && v296 != 1.0)
                                                                                                    {
LABEL_584:
                                                                                                      if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x27u, 0)) {
                                                                                                        goto LABEL_587;
                                                                                                      }
                                                                                                      unsigned int v298 = 1;
LABEL_586:
                                                                                                      if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x27u, v298)) {
                                                                                                        goto LABEL_597;
                                                                                                      }
LABEL_587:
                                                                                                      if (v287)
                                                                                                      {
                                                                                                        float v299 = *v287;
                                                                                                        BOOL v300 = *v287 == 1.0;
                                                                                                        if (*(unsigned char *)(v286 + 10) && v299 != 0.0 && v299 != 1.0) {
                                                                                                          goto LABEL_594;
                                                                                                        }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        BOOL v300 = 0;
                                                                                                      }
                                                                                                      unsigned int v301 = *(unsigned __int8 *)(v286 + v300 + 11);
                                                                                                      float v299 = 0.0;
                                                                                                      if (v301 != 2)
                                                                                                      {
                                                                                                        float v303 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x27u, v301, 0);
                                                                                                        goto LABEL_596;
                                                                                                      }
LABEL_594:
                                                                                                      LOBYTE(buf) = 1;
                                                                                                      char v455 = 1;
                                                                                                      v302 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x27u, 0, &buf);
                                                                                                      float v303 = *v302 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x27u, 1u, &v455) - *v302) * v299);
LABEL_596:
                                                                                                      *(double *)&self->_idealPuckScreenPosition = v303;
                                                                                                      unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                      v287 = *(float **)v286;
LABEL_597:
                                                                                                      if (v287)
                                                                                                      {
                                                                                                        float v304 = *v287;
                                                                                                        BOOL v305 = *v287 == 1.0;
                                                                                                        if (*(unsigned char *)(v286 + 10) && v304 != 0.0 && v304 != 1.0)
                                                                                                        {
LABEL_604:
                                                                                                          if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x35u, 0)) {
                                                                                                            goto LABEL_607;
                                                                                                          }
                                                                                                          unsigned int v306 = 1;
LABEL_606:
                                                                                                          if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x35u, v306)) {
                                                                                                            goto LABEL_617;
                                                                                                          }
LABEL_607:
                                                                                                          if (v287)
                                                                                                          {
                                                                                                            float v307 = *v287;
                                                                                                            BOOL v308 = *v287 == 1.0;
                                                                                                            if (*(unsigned char *)(v286 + 10) && v307 != 0.0 && v307 != 1.0) {
                                                                                                              goto LABEL_614;
                                                                                                            }
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            BOOL v308 = 0;
                                                                                                          }
                                                                                                          unsigned int v309 = *(unsigned __int8 *)(v286 + v308 + 11);
                                                                                                          float v307 = 0.0;
                                                                                                          if (v309 != 2)
                                                                                                          {
                                                                                                            float v311 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x35u, v309, 0);
                                                                                                            goto LABEL_616;
                                                                                                          }
LABEL_614:
                                                                                                          LOBYTE(buf) = 1;
                                                                                                          char v455 = 1;
                                                                                                          v310 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x35u, 0, &buf);
                                                                                                          float v311 = *v310 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x35u, 1u, &v455) - *v310) * v307);
LABEL_616:
                                                                                                          self->_minHeightDeltaChangeHorizontal = v311;
                                                                                                          unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                          v287 = *(float **)v286;
LABEL_617:
                                                                                                          if (v287)
                                                                                                          {
                                                                                                            float v312 = *v287;
                                                                                                            BOOL v313 = *v287 == 1.0;
                                                                                                            if (*(unsigned char *)(v286 + 10) && v312 != 0.0 && v312 != 1.0)
                                                                                                            {
LABEL_624:
                                                                                                              if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x36u, 0)) {
                                                                                                                goto LABEL_627;
                                                                                                              }
                                                                                                              unsigned int v314 = 1;
LABEL_626:
                                                                                                              if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x36u, v314)) {
                                                                                                                goto LABEL_637;
                                                                                                              }
LABEL_627:
                                                                                                              if (v287)
                                                                                                              {
                                                                                                                float v315 = *v287;
                                                                                                                BOOL v316 = *v287 == 1.0;
                                                                                                                if (*(unsigned char *)(v286 + 10) && v315 != 0.0 && v315 != 1.0) {
                                                                                                                  goto LABEL_634;
                                                                                                                }
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                BOOL v316 = 0;
                                                                                                              }
                                                                                                              unsigned int v317 = *(unsigned __int8 *)(v286 + v316 + 11);
                                                                                                              float v315 = 0.0;
                                                                                                              if (v317 != 2)
                                                                                                              {
                                                                                                                float v319 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x36u, v317, 0);
                                                                                                                goto LABEL_636;
                                                                                                              }
LABEL_634:
                                                                                                              LOBYTE(buf) = 1;
                                                                                                              char v455 = 1;
                                                                                                              v318 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x36u, 0, &buf);
                                                                                                              float v319 = *v318 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x36u, 1u, &v455) - *v318) * v315);
LABEL_636:
                                                                                                              self->_maxHeightDeltaChangeHorizontal = v319;
                                                                                                              unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                              v287 = *(float **)v286;
LABEL_637:
                                                                                                              if (v287)
                                                                                                              {
                                                                                                                float v320 = *v287;
                                                                                                                BOOL v321 = *v287 == 1.0;
                                                                                                                if (*(unsigned char *)(v286 + 10) && v320 != 0.0 && v320 != 1.0)
                                                                                                                {
LABEL_644:
                                                                                                                  if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x2Fu, 0)) {
                                                                                                                    goto LABEL_647;
                                                                                                                  }
                                                                                                                  unsigned int v322 = 1;
LABEL_646:
                                                                                                                  if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x2Fu, v322)) {
                                                                                                                    goto LABEL_660;
                                                                                                                  }
LABEL_647:
                                                                                                                  if (v287)
                                                                                                                  {
                                                                                                                    float v323 = *v287;
                                                                                                                    BOOL v324 = *v287 == 1.0;
                                                                                                                    if (*(unsigned char *)(v286 + 10) && v323 != 0.0 && v323 != 1.0) {
                                                                                                                      goto LABEL_654;
                                                                                                                    }
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    BOOL v324 = 0;
                                                                                                                  }
                                                                                                                  unsigned int v325 = *(unsigned __int8 *)(v286 + v324 + 11);
                                                                                                                  float v323 = 0.0;
                                                                                                                  if (v325 != 2)
                                                                                                                  {
                                                                                                                    char v329 = *(unsigned char *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x2Fu, v325, 0);
LABEL_659:
                                                                                                                    LOBYTE(self->_framingScreenRect._maximum._e[0]) = v329 != 0;
                                                                                                                    unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                                    v287 = *(float **)v286;
LABEL_660:
                                                                                                                    if (v287)
                                                                                                                    {
                                                                                                                      float v330 = *v287;
                                                                                                                      BOOL v331 = *v287 == 1.0;
                                                                                                                      if (*(unsigned char *)(v286 + 10) && v330 != 0.0 && v330 != 1.0)
                                                                                                                      {
LABEL_667:
                                                                                                                        if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x30u, 0)) {
                                                                                                                          goto LABEL_670;
                                                                                                                        }
                                                                                                                        unsigned int v332 = 1;
LABEL_669:
                                                                                                                        if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x30u, v332)) {
                                                                                                                          goto LABEL_683;
                                                                                                                        }
LABEL_670:
                                                                                                                        if (v287)
                                                                                                                        {
                                                                                                                          float v333 = *v287;
                                                                                                                          BOOL v334 = *v287 == 1.0;
                                                                                                                          if (*(unsigned char *)(v286 + 10) && v333 != 0.0 && v333 != 1.0) {
                                                                                                                            goto LABEL_677;
                                                                                                                          }
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          BOOL v334 = 0;
                                                                                                                        }
                                                                                                                        unsigned int v335 = *(unsigned __int8 *)(v286 + v334 + 11);
                                                                                                                        float v333 = 0.0;
                                                                                                                        if (v335 != 2)
                                                                                                                        {
                                                                                                                          char v339 = *(unsigned char *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x30u, v335, 0);
LABEL_682:
                                                                                                                          BYTE1(self->_framingScreenRect._maximum._e[0]) = v339 != 0;
                                                                                                                          unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                                          v287 = *(float **)v286;
LABEL_683:
                                                                                                                          if (v287)
                                                                                                                          {
                                                                                                                            float v340 = *v287;
                                                                                                                            BOOL v341 = *v287 == 1.0;
                                                                                                                            if (*(unsigned char *)(v286 + 10) && v340 != 0.0 && v340 != 1.0)
                                                                                                                            {
LABEL_690:
                                                                                                                              if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x32u, 0)) {
                                                                                                                                goto LABEL_693;
                                                                                                                              }
                                                                                                                              unsigned int v342 = 1;
LABEL_692:
                                                                                                                              if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x32u, v342)) {
                                                                                                                                goto LABEL_706;
                                                                                                                              }
LABEL_693:
                                                                                                                              if (v287)
                                                                                                                              {
                                                                                                                                float v343 = *v287;
                                                                                                                                BOOL v344 = *v287 == 1.0;
                                                                                                                                if (*(unsigned char *)(v286 + 10) && v343 != 0.0 && v343 != 1.0) {
                                                                                                                                  goto LABEL_700;
                                                                                                                                }
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                BOOL v344 = 0;
                                                                                                                              }
                                                                                                                              unsigned int v345 = *(unsigned __int8 *)(v286 + v344 + 11);
                                                                                                                              float v343 = 0.0;
                                                                                                                              if (v345 != 2)
                                                                                                                              {
                                                                                                                                char v349 = *(unsigned char *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x32u, v345, 0);
LABEL_705:
                                                                                                                                BYTE3(self->_framingScreenRect._maximum._e[0]) = v349 != 0;
                                                                                                                                unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                                                v287 = *(float **)v286;
LABEL_706:
                                                                                                                                if (v287)
                                                                                                                                {
                                                                                                                                  float v350 = *v287;
                                                                                                                                  BOOL v351 = *v287 == 1.0;
                                                                                                                                  if (*(unsigned char *)(v286 + 10) && v350 != 0.0 && v350 != 1.0)
                                                                                                                                  {
LABEL_713:
                                                                                                                                    if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x31u, 0)) {
                                                                                                                                      goto LABEL_716;
                                                                                                                                    }
                                                                                                                                    unsigned int v352 = 1;
LABEL_715:
                                                                                                                                    if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x31u, v352)) {
                                                                                                                                      goto LABEL_729;
                                                                                                                                    }
LABEL_716:
                                                                                                                                    if (v287)
                                                                                                                                    {
                                                                                                                                      float v353 = *v287;
                                                                                                                                      BOOL v354 = *v287 == 1.0;
                                                                                                                                      if (*(unsigned char *)(v286 + 10) && v353 != 0.0 && v353 != 1.0) {
                                                                                                                                        goto LABEL_723;
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                      BOOL v354 = 0;
                                                                                                                                    }
                                                                                                                                    unsigned int v355 = *(unsigned __int8 *)(v286 + v354 + 11);
                                                                                                                                    float v353 = 0.0;
                                                                                                                                    if (v355 != 2)
                                                                                                                                    {
                                                                                                                                      char v359 = *(unsigned char *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x31u, v355, 0);
LABEL_728:
                                                                                                                                      BYTE2(self->_framingScreenRect._maximum._e[0]) = v359 != 0;
                                                                                                                                      unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                                                      v287 = *(float **)v286;
LABEL_729:
                                                                                                                                      if (v287)
                                                                                                                                      {
                                                                                                                                        float v360 = *v287;
                                                                                                                                        BOOL v361 = *v287 == 1.0;
                                                                                                                                        if (*(unsigned char *)(v286 + 10) && v360 != 0.0 && v360 != 1.0)
                                                                                                                                        {
LABEL_736:
                                                                                                                                          if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x2Au, 0)) {
                                                                                                                                            goto LABEL_739;
                                                                                                                                          }
                                                                                                                                          unsigned int v362 = 1;
LABEL_738:
                                                                                                                                          if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x2Au, v362)) {
                                                                                                                                            goto LABEL_749;
                                                                                                                                          }
LABEL_739:
                                                                                                                                          if (v287)
                                                                                                                                          {
                                                                                                                                            float v363 = *v287;
                                                                                                                                            BOOL v364 = *v287 == 1.0;
                                                                                                                                            if (*(unsigned char *)(v286 + 10) && v363 != 0.0 && v363 != 1.0) {
                                                                                                                                              goto LABEL_746;
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                          else
                                                                                                                                          {
                                                                                                                                            BOOL v364 = 0;
                                                                                                                                          }
                                                                                                                                          unsigned int v365 = *(unsigned __int8 *)(v286 + v364 + 11);
                                                                                                                                          float v363 = 0.0;
                                                                                                                                          if (v365 != 2)
                                                                                                                                          {
                                                                                                                                            float v367 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x2Au, v365, 0);
                                                                                                                                            goto LABEL_748;
                                                                                                                                          }
LABEL_746:
                                                                                                                                          LOBYTE(buf) = 1;
                                                                                                                                          char v455 = 1;
                                                                                                                                          v366 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x2Au, 0, &buf);
                                                                                                                                          float v367 = *v366 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x2Au, 1u, &v455) - *v366) * v363);
LABEL_748:
                                                                                                                                          *((float *)self->_framingScreenRect._maximum._e + 1) = v367;
                                                                                                                                          unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                                                          v287 = *(float **)v286;
LABEL_749:
                                                                                                                                          if (v287)
                                                                                                                                          {
                                                                                                                                            float v368 = *v287;
                                                                                                                                            BOOL v369 = *v287 == 1.0;
                                                                                                                                            if (*(unsigned char *)(v286 + 10) && v368 != 0.0 && v368 != 1.0)
                                                                                                                                            {
LABEL_756:
                                                                                                                                              if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x2Eu, 0)) {
                                                                                                                                                goto LABEL_759;
                                                                                                                                              }
                                                                                                                                              unsigned int v370 = 1;
LABEL_758:
                                                                                                                                              if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x2Eu, v370)) {
                                                                                                                                                goto LABEL_772;
                                                                                                                                              }
LABEL_759:
                                                                                                                                              if (v287)
                                                                                                                                              {
                                                                                                                                                float v371 = *v287;
                                                                                                                                                BOOL v372 = *v287 == 1.0;
                                                                                                                                                if (*(unsigned char *)(v286 + 10) && v371 != 0.0 && v371 != 1.0) {
                                                                                                                                                  goto LABEL_766;
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                              else
                                                                                                                                              {
                                                                                                                                                BOOL v372 = 0;
                                                                                                                                              }
                                                                                                                                              unsigned int v373 = *(unsigned __int8 *)(v286 + v372 + 11);
                                                                                                                                              float v371 = 0.0;
                                                                                                                                              if (v373 != 2)
                                                                                                                                              {
                                                                                                                                                int v377 = *(_DWORD *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v286, 0x2Eu, v373, 0);
LABEL_771:
                                                                                                                                                LOBYTE(self->_framingScreenRect._maximum._e[1]) = v377;
                                                                                                                                                unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                                                                v287 = *(float **)v286;
LABEL_772:
                                                                                                                                                if (v287)
                                                                                                                                                {
                                                                                                                                                  float v378 = *v287;
                                                                                                                                                  BOOL v379 = *v287 == 1.0;
                                                                                                                                                  if (*(unsigned char *)(v286 + 10) && v378 != 0.0 && v378 != 1.0)
                                                                                                                                                  {
LABEL_779:
                                                                                                                                                    if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x55u, 0)) {
                                                                                                                                                      goto LABEL_782;
                                                                                                                                                    }
                                                                                                                                                    unsigned int v380 = 1;
LABEL_781:
                                                                                                                                                    if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x55u, v380)) {
                                                                                                                                                      goto LABEL_795;
                                                                                                                                                    }
LABEL_782:
                                                                                                                                                    if (v287)
                                                                                                                                                    {
                                                                                                                                                      float v381 = *v287;
                                                                                                                                                      BOOL v382 = *v287 == 1.0;
                                                                                                                                                      if (*(unsigned char *)(v286 + 10) && v381 != 0.0 && v381 != 1.0) {
                                                                                                                                                        goto LABEL_789;
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                    else
                                                                                                                                                    {
                                                                                                                                                      BOOL v382 = 0;
                                                                                                                                                    }
                                                                                                                                                    unsigned int v383 = *(unsigned __int8 *)(v286 + v382 + 11);
                                                                                                                                                    float v381 = 0.0;
                                                                                                                                                    if (v383 != 2)
                                                                                                                                                    {
                                                                                                                                                      int v387 = *(_DWORD *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v286, 0x55u, v383, 0);
LABEL_794:
                                                                                                                                                      BYTE1(self->_framingScreenRect._maximum._e[1]) = v387;
                                                                                                                                                      unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                                                                      v287 = *(float **)v286;
LABEL_795:
                                                                                                                                                      if (v287)
                                                                                                                                                      {
                                                                                                                                                        float v388 = *v287;
                                                                                                                                                        BOOL v389 = *v287 == 1.0;
                                                                                                                                                        if (*(unsigned char *)(v286 + 10) && v388 != 0.0 && v388 != 1.0)
                                                                                                                                                        {
LABEL_802:
                                                                                                                                                          if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x2Bu, 0)) {
                                                                                                                                                            goto LABEL_805;
                                                                                                                                                          }
                                                                                                                                                          unsigned int v390 = 1;
LABEL_804:
                                                                                                                                                          if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x2Bu, v390)) {
                                                                                                                                                            goto LABEL_818;
                                                                                                                                                          }
LABEL_805:
                                                                                                                                                          if (v287)
                                                                                                                                                          {
                                                                                                                                                            float v391 = *v287;
                                                                                                                                                            BOOL v392 = *v287 == 1.0;
                                                                                                                                                            if (*(unsigned char *)(v286 + 10) && v391 != 0.0 && v391 != 1.0) {
                                                                                                                                                              goto LABEL_812;
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                          else
                                                                                                                                                          {
                                                                                                                                                            BOOL v392 = 0;
                                                                                                                                                          }
                                                                                                                                                          unsigned int v393 = *(unsigned __int8 *)(v286 + v392 + 11);
                                                                                                                                                          float v391 = 0.0;
                                                                                                                                                          if (v393 != 2)
                                                                                                                                                          {
                                                                                                                                                            char v397 = *(unsigned char *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x2Bu, v393, 0);
LABEL_817:
                                                                                                                                                            LOBYTE(self->_locationCoordinate.longitude) = v397 != 0;
                                                                                                                                                            unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                                                                            v287 = *(float **)v286;
LABEL_818:
                                                                                                                                                            if (v287)
                                                                                                                                                            {
                                                                                                                                                              float v398 = *v287;
                                                                                                                                                              BOOL v399 = *v287 == 1.0;
                                                                                                                                                              if (*(unsigned char *)(v286 + 10) && v398 != 0.0 && v398 != 1.0)
                                                                                                                                                              {
LABEL_825:
                                                                                                                                                                if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x2Cu, 0)) {
                                                                                                                                                                  goto LABEL_828;
                                                                                                                                                                }
                                                                                                                                                                unsigned int v400 = 1;
LABEL_827:
                                                                                                                                                                if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x2Cu, v400)) {
                                                                                                                                                                  goto LABEL_841;
                                                                                                                                                                }
LABEL_828:
                                                                                                                                                                if (v287)
                                                                                                                                                                {
                                                                                                                                                                  float v401 = *v287;
                                                                                                                                                                  BOOL v402 = *v287 == 1.0;
                                                                                                                                                                  if (*(unsigned char *)(v286 + 10) && v401 != 0.0 && v401 != 1.0) {
                                                                                                                                                                    goto LABEL_835;
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                                else
                                                                                                                                                                {
                                                                                                                                                                  BOOL v402 = 0;
                                                                                                                                                                }
                                                                                                                                                                unsigned int v403 = *(unsigned __int8 *)(v286 + v402 + 11);
                                                                                                                                                                float v401 = 0.0;
                                                                                                                                                                if (v403 != 2)
                                                                                                                                                                {
                                                                                                                                                                  char v407 = *(unsigned char *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v286, 0x2Cu, v403, 0);
LABEL_840:
                                                                                                                                                                  BYTE1(self->_locationCoordinate.longitude) = v407;
                                                                                                                                                                  unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                                                                                  v287 = *(float **)v286;
LABEL_841:
                                                                                                                                                                  if (v287)
                                                                                                                                                                  {
                                                                                                                                                                    float v408 = *v287;
                                                                                                                                                                    BOOL v409 = *v287 == 1.0;
                                                                                                                                                                    if (*(unsigned char *)(v286 + 10) && v408 != 0.0 && v408 != 1.0)
                                                                                                                                                                    {
LABEL_848:
                                                                                                                                                                      if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x34u, 0)) {
                                                                                                                                                                        goto LABEL_851;
                                                                                                                                                                      }
                                                                                                                                                                      unsigned int v410 = 1;
LABEL_850:
                                                                                                                                                                      if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x34u, v410)) {
                                                                                                                                                                        goto LABEL_864;
                                                                                                                                                                      }
LABEL_851:
                                                                                                                                                                      if (v287)
                                                                                                                                                                      {
                                                                                                                                                                        float v411 = *v287;
                                                                                                                                                                        BOOL v412 = *v287 == 1.0;
                                                                                                                                                                        if (*(unsigned char *)(v286 + 10) && v411 != 0.0 && v411 != 1.0) {
                                                                                                                                                                          goto LABEL_858;
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                      else
                                                                                                                                                                      {
                                                                                                                                                                        BOOL v412 = 0;
                                                                                                                                                                      }
                                                                                                                                                                      unsigned int v413 = *(unsigned __int8 *)(v286 + v412 + 11);
                                                                                                                                                                      float v411 = 0.0;
                                                                                                                                                                      if (v413 != 2)
                                                                                                                                                                      {
                                                                                                                                                                        char v417 = *(unsigned char *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x34u, v413, 0);
LABEL_863:
                                                                                                                                                                        BYTE2(self->_locationCoordinate.longitude) = v417 != 0;
                                                                                                                                                                        unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                                                                                        v287 = *(float **)v286;
LABEL_864:
                                                                                                                                                                        if (v287)
                                                                                                                                                                        {
                                                                                                                                                                          float v418 = *v287;
                                                                                                                                                                          BOOL v419 = *v287 == 1.0;
                                                                                                                                                                          if (*(unsigned char *)(v286 + 10) && v418 != 0.0 && v418 != 1.0)
                                                                                                                                                                          {
LABEL_871:
                                                                                                                                                                            if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x2Du, 0)) {
                                                                                                                                                                              goto LABEL_874;
                                                                                                                                                                            }
                                                                                                                                                                            unsigned int v420 = 1;
LABEL_873:
                                                                                                                                                                            int hasValueForKeyAtEnd = gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x2Du, v420);
                                                                                                                                                                            double v422 = -1.0;
                                                                                                                                                                            if (!hasValueForKeyAtEnd) {
                                                                                                                                                                              goto LABEL_884;
                                                                                                                                                                            }
LABEL_874:
                                                                                                                                                                            if (v287)
                                                                                                                                                                            {
                                                                                                                                                                              float v423 = *v287;
                                                                                                                                                                              BOOL v424 = *v287 == 1.0;
                                                                                                                                                                              if (*(unsigned char *)(v286 + 10) && v423 != 0.0 && v423 != 1.0) {
                                                                                                                                                                                goto LABEL_881;
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                            else
                                                                                                                                                                            {
                                                                                                                                                                              BOOL v424 = 0;
                                                                                                                                                                            }
                                                                                                                                                                            unsigned int v425 = *(unsigned __int8 *)(v286 + v424 + 11);
                                                                                                                                                                            float v423 = 0.0;
                                                                                                                                                                            if (v425 != 2)
                                                                                                                                                                            {
                                                                                                                                                                              float v427 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x2Du, v425, 0);
                                                                                                                                                                              goto LABEL_883;
                                                                                                                                                                            }
LABEL_881:
                                                                                                                                                                            LOBYTE(buf) = 1;
                                                                                                                                                                            char v455 = 1;
                                                                                                                                                                            v426 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x2Du, 0, &buf);
                                                                                                                                                                            float v427 = *v426 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x2Du, 1u, &v455) - *v426) * v423);
LABEL_883:
                                                                                                                                                                            double v422 = v427;
                                                                                                                                                                            unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                                                                                            v287 = *(float **)v286;
LABEL_884:
                                                                                                                                                                            *(double *)&self->_enablePan = v422;
                                                                                                                                                                            if (v287)
                                                                                                                                                                            {
                                                                                                                                                                              float v428 = *v287;
                                                                                                                                                                              BOOL v429 = *v287 == 1.0;
                                                                                                                                                                              if (*(unsigned char *)(v286 + 10) && v428 != 0.0 && v428 != 1.0)
                                                                                                                                                                              {
LABEL_891:
                                                                                                                                                                                if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x38u, 0)) {
                                                                                                                                                                                  goto LABEL_894;
                                                                                                                                                                                }
                                                                                                                                                                                unsigned int v430 = 1;
LABEL_893:
                                                                                                                                                                                int v431 = gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x38u, v430);
                                                                                                                                                                                double v432 = 0.0;
                                                                                                                                                                                if (!v431) {
                                                                                                                                                                                  goto LABEL_904;
                                                                                                                                                                                }
LABEL_894:
                                                                                                                                                                                if (v287)
                                                                                                                                                                                {
                                                                                                                                                                                  float v433 = *v287;
                                                                                                                                                                                  BOOL v434 = *v287 == 1.0;
                                                                                                                                                                                  if (*(unsigned char *)(v286 + 10) && v433 != 0.0 && v433 != 1.0) {
                                                                                                                                                                                    goto LABEL_901;
                                                                                                                                                                                  }
                                                                                                                                                                                }
                                                                                                                                                                                else
                                                                                                                                                                                {
                                                                                                                                                                                  BOOL v434 = 0;
                                                                                                                                                                                }
                                                                                                                                                                                unsigned int v435 = *(unsigned __int8 *)(v286 + v434 + 11);
                                                                                                                                                                                float v433 = 0.0;
                                                                                                                                                                                if (v435 != 2)
                                                                                                                                                                                {
                                                                                                                                                                                  float v437 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x38u, v435, 0);
                                                                                                                                                                                  goto LABEL_903;
                                                                                                                                                                                }
LABEL_901:
                                                                                                                                                                                LOBYTE(buf) = 1;
                                                                                                                                                                                char v455 = 1;
                                                                                                                                                                                v436 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x38u, 0, &buf);
                                                                                                                                                                                float v437 = *v436 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x38u, 1u, &v455) - *v436) * v433);
LABEL_903:
                                                                                                                                                                                double v432 = v437;
                                                                                                                                                                                unint64_t v286 = *(void *)(v452[0] + 24);
                                                                                                                                                                                v287 = *(float **)v286;
LABEL_904:
                                                                                                                                                                                *(double *)&self->_alternateFramingSource = v432;
                                                                                                                                                                                if (v287)
                                                                                                                                                                                {
                                                                                                                                                                                  float v438 = *v287;
                                                                                                                                                                                  BOOL v439 = *v287 == 1.0;
                                                                                                                                                                                  if (*(unsigned char *)(v286 + 10) && v438 != 0.0 && v438 != 1.0)
                                                                                                                                                                                  {
LABEL_911:
                                                                                                                                                                                    if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x43u, 0)) {
                                                                                                                                                                                      goto LABEL_914;
                                                                                                                                                                                    }
                                                                                                                                                                                    unsigned int v440 = 1;
LABEL_913:
                                                                                                                                                                                    if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v286, 0x43u, v440))
                                                                                                                                                                                    {
                                                                                                                                                                                      double v443 = -1.0;
                                                                                                                                                                                      if (!a3) {
                                                                                                                                                                                        goto LABEL_930;
                                                                                                                                                                                      }
                                                                                                                                                                                      goto LABEL_927;
                                                                                                                                                                                    }
LABEL_914:
                                                                                                                                                                                    if (v287)
                                                                                                                                                                                    {
                                                                                                                                                                                      float v441 = *v287;
                                                                                                                                                                                      BOOL v442 = *v287 == 1.0;
                                                                                                                                                                                      if (*(unsigned char *)(v286 + 10) && v441 != 0.0 && v441 != 1.0) {
                                                                                                                                                                                        goto LABEL_923;
                                                                                                                                                                                      }
                                                                                                                                                                                    }
                                                                                                                                                                                    else
                                                                                                                                                                                    {
                                                                                                                                                                                      BOOL v442 = 0;
                                                                                                                                                                                    }
                                                                                                                                                                                    unsigned int v444 = *(unsigned __int8 *)(v286 + v442 + 11);
                                                                                                                                                                                    float v441 = 0.0;
                                                                                                                                                                                    if (v444 != 2)
                                                                                                                                                                                    {
                                                                                                                                                                                      float v446 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x43u, v444, 0);
                                                                                                                                                                                      double v443 = v446;
                                                                                                                                                                                      if (!a3)
                                                                                                                                                                                      {
LABEL_930:
                                                                                                                                                                                        self->_routeFocusCoordinate.longitude._value = v42;
                                                                                                                                                                                        float v447 = v443;
                                                                                                                                                                                        *(float *)&self->_previousSearchItemCount = v447;
                                                                                                                                                                                        [(VKNavCameraController *)self _updateLabelMetrics];
                                                                                                                                                                                        [(VKNavCameraController *)self _setNeedsUpdate];
                                                                                                                                                                                        if (GEOGetVectorKitVKNavCameraLog_onceToken != -1) {
                                                                                                                                                                                          dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_41);
                                                                                                                                                                                        }
                                                                                                                                                                                        v448 = (id)GEOGetVectorKitVKNavCameraLog_log;
                                                                                                                                                                                        if (os_log_type_enabled(v448, OS_LOG_TYPE_INFO))
                                                                                                                                                                                        {
                                                                                                                                                                                          id v449 = [(VKNavCameraController *)self detailedDescription];
                                                                                                                                                                                          uint64_t v450 = [v449 UTF8String];
                                                                                                                                                                                          LODWORD(buf) = 136315138;
                                                                                                                                                                                          *(void *)((char *)&buf + 4) = v450;
                                                                                                                                                                                          _os_log_impl(&dword_1A1780000, v448, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
                                                                                                                                                                                        }
LABEL_935:
                                                                                                                                                                                        gss::QueryableLocker<gss::ScenePropertyID>::~QueryableLocker((uint64_t)v452);
                                                                                                                                                                                        uint64_t v19 = v454;
                                                                                                                                                                                        if (!v454) {
                                                                                                                                                                                          return;
                                                                                                                                                                                        }
                                                                                                                                                                                        goto LABEL_936;
                                                                                                                                                                                      }
LABEL_926:
                                                                                                                                                                                      if (v446 > 0.0)
                                                                                                                                                                                      {
LABEL_928:
                                                                                                                                                                                        [(VKNavCameraController *)self animateCameraWithDuration:&self->_cameraFrame fromFrame:0 completionHandler:v451];
                                                                                                                                                                                        goto LABEL_930;
                                                                                                                                                                                      }
LABEL_927:
                                                                                                                                                                                      if (*(float *)&self->_previousSearchItemCount <= 0.0)
                                                                                                                                                                                      {
                                                                                                                                                                                        [(VKNavCameraController *)self returnToTrackingWithDelay:1 resetZoom:0.0];
                                                                                                                                                                                        goto LABEL_930;
                                                                                                                                                                                      }
                                                                                                                                                                                      goto LABEL_928;
                                                                                                                                                                                    }
LABEL_923:
                                                                                                                                                                                    LOBYTE(buf) = 1;
                                                                                                                                                                                    char v455 = 1;
                                                                                                                                                                                    v445 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x43u, 0, &buf);
                                                                                                                                                                                    float v446 = *v445 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v286, 0x43u, 1u, &v455) - *v445) * v441);
                                                                                                                                                                                    double v443 = v446;
                                                                                                                                                                                    if (!a3) {
                                                                                                                                                                                      goto LABEL_930;
                                                                                                                                                                                    }
                                                                                                                                                                                    goto LABEL_926;
                                                                                                                                                                                  }
                                                                                                                                                                                }
                                                                                                                                                                                else
                                                                                                                                                                                {
                                                                                                                                                                                  BOOL v439 = 0;
                                                                                                                                                                                }
                                                                                                                                                                                unsigned int v440 = *(unsigned __int8 *)(v286 + v439 + 11);
                                                                                                                                                                                if (v440 != 2) {
                                                                                                                                                                                  goto LABEL_913;
                                                                                                                                                                                }
                                                                                                                                                                                goto LABEL_911;
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                            else
                                                                                                                                                                            {
                                                                                                                                                                              BOOL v429 = 0;
                                                                                                                                                                            }
                                                                                                                                                                            unsigned int v430 = *(unsigned __int8 *)(v286 + v429 + 11);
                                                                                                                                                                            if (v430 != 2) {
                                                                                                                                                                              goto LABEL_893;
                                                                                                                                                                            }
                                                                                                                                                                            goto LABEL_891;
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                        else
                                                                                                                                                                        {
                                                                                                                                                                          BOOL v419 = 0;
                                                                                                                                                                        }
                                                                                                                                                                        unsigned int v420 = *(unsigned __int8 *)(v286 + v419 + 11);
                                                                                                                                                                        if (v420 != 2) {
                                                                                                                                                                          goto LABEL_873;
                                                                                                                                                                        }
                                                                                                                                                                        goto LABEL_871;
                                                                                                                                                                      }
LABEL_858:
                                                                                                                                                                      LOBYTE(buf) = 1;
                                                                                                                                                                      char v455 = 1;
                                                                                                                                                                      unint64_t v414 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x34u, 0, &buf);
                                                                                                                                                                      unint64_t v415 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x34u, 1u, &v455);
                                                                                                                                                                      if (v411 >= 1.0) {
                                                                                                                                                                        v416 = (char *)v415;
                                                                                                                                                                      }
                                                                                                                                                                      else {
                                                                                                                                                                        v416 = (char *)v414;
                                                                                                                                                                      }
                                                                                                                                                                      char v417 = *v416;
                                                                                                                                                                      goto LABEL_863;
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                  else
                                                                                                                                                                  {
                                                                                                                                                                    BOOL v409 = 0;
                                                                                                                                                                  }
                                                                                                                                                                  unsigned int v410 = *(unsigned __int8 *)(v286 + v409 + 11);
                                                                                                                                                                  if (v410 != 2) {
                                                                                                                                                                    goto LABEL_850;
                                                                                                                                                                  }
                                                                                                                                                                  goto LABEL_848;
                                                                                                                                                                }
LABEL_835:
                                                                                                                                                                LOBYTE(buf) = 1;
                                                                                                                                                                char v455 = 1;
                                                                                                                                                                unint64_t v404 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v286, 0x2Cu, 0, &buf);
                                                                                                                                                                unint64_t v405 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v286, 0x2Cu, 1u, &v455);
                                                                                                                                                                if (v401 >= 1.0) {
                                                                                                                                                                  v406 = (char *)v405;
                                                                                                                                                                }
                                                                                                                                                                else {
                                                                                                                                                                  v406 = (char *)v404;
                                                                                                                                                                }
                                                                                                                                                                char v407 = *v406;
                                                                                                                                                                goto LABEL_840;
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                            else
                                                                                                                                                            {
                                                                                                                                                              BOOL v399 = 0;
                                                                                                                                                            }
                                                                                                                                                            unsigned int v400 = *(unsigned __int8 *)(v286 + v399 + 11);
                                                                                                                                                            if (v400 != 2) {
                                                                                                                                                              goto LABEL_827;
                                                                                                                                                            }
                                                                                                                                                            goto LABEL_825;
                                                                                                                                                          }
LABEL_812:
                                                                                                                                                          LOBYTE(buf) = 1;
                                                                                                                                                          char v455 = 1;
                                                                                                                                                          unint64_t v394 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x2Bu, 0, &buf);
                                                                                                                                                          unint64_t v395 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x2Bu, 1u, &v455);
                                                                                                                                                          if (v391 >= 1.0) {
                                                                                                                                                            v396 = (char *)v395;
                                                                                                                                                          }
                                                                                                                                                          else {
                                                                                                                                                            v396 = (char *)v394;
                                                                                                                                                          }
                                                                                                                                                          char v397 = *v396;
                                                                                                                                                          goto LABEL_817;
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                      else
                                                                                                                                                      {
                                                                                                                                                        BOOL v389 = 0;
                                                                                                                                                      }
                                                                                                                                                      unsigned int v390 = *(unsigned __int8 *)(v286 + v389 + 11);
                                                                                                                                                      if (v390 != 2) {
                                                                                                                                                        goto LABEL_804;
                                                                                                                                                      }
                                                                                                                                                      goto LABEL_802;
                                                                                                                                                    }
LABEL_789:
                                                                                                                                                    LOBYTE(buf) = 1;
                                                                                                                                                    char v455 = 1;
                                                                                                                                                    uint64_t v384 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v286, 0x55u, 0, &buf);
                                                                                                                                                    uint64_t v385 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v286, 0x55u, 1u, &v455);
                                                                                                                                                    if (v381 >= 1.0) {
                                                                                                                                                      v386 = (int *)v385;
                                                                                                                                                    }
                                                                                                                                                    else {
                                                                                                                                                      v386 = (int *)v384;
                                                                                                                                                    }
                                                                                                                                                    int v387 = *v386;
                                                                                                                                                    goto LABEL_794;
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                  BOOL v379 = 0;
                                                                                                                                                }
                                                                                                                                                unsigned int v380 = *(unsigned __int8 *)(v286 + v379 + 11);
                                                                                                                                                if (v380 != 2) {
                                                                                                                                                  goto LABEL_781;
                                                                                                                                                }
                                                                                                                                                goto LABEL_779;
                                                                                                                                              }
LABEL_766:
                                                                                                                                              LOBYTE(buf) = 1;
                                                                                                                                              char v455 = 1;
                                                                                                                                              uint64_t v374 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v286, 0x2Eu, 0, &buf);
                                                                                                                                              uint64_t v375 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v286, 0x2Eu, 1u, &v455);
                                                                                                                                              if (v371 >= 1.0) {
                                                                                                                                                v376 = (int *)v375;
                                                                                                                                              }
                                                                                                                                              else {
                                                                                                                                                v376 = (int *)v374;
                                                                                                                                              }
                                                                                                                                              int v377 = *v376;
                                                                                                                                              goto LABEL_771;
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                          else
                                                                                                                                          {
                                                                                                                                            BOOL v369 = 0;
                                                                                                                                          }
                                                                                                                                          unsigned int v370 = *(unsigned __int8 *)(v286 + v369 + 11);
                                                                                                                                          if (v370 != 2) {
                                                                                                                                            goto LABEL_758;
                                                                                                                                          }
                                                                                                                                          goto LABEL_756;
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                      else
                                                                                                                                      {
                                                                                                                                        BOOL v361 = 0;
                                                                                                                                      }
                                                                                                                                      unsigned int v362 = *(unsigned __int8 *)(v286 + v361 + 11);
                                                                                                                                      if (v362 != 2) {
                                                                                                                                        goto LABEL_738;
                                                                                                                                      }
                                                                                                                                      goto LABEL_736;
                                                                                                                                    }
LABEL_723:
                                                                                                                                    LOBYTE(buf) = 1;
                                                                                                                                    char v455 = 1;
                                                                                                                                    unint64_t v356 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x31u, 0, &buf);
                                                                                                                                    unint64_t v357 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x31u, 1u, &v455);
                                                                                                                                    if (v353 >= 1.0) {
                                                                                                                                      v358 = (char *)v357;
                                                                                                                                    }
                                                                                                                                    else {
                                                                                                                                      v358 = (char *)v356;
                                                                                                                                    }
                                                                                                                                    char v359 = *v358;
                                                                                                                                    goto LABEL_728;
                                                                                                                                  }
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                  BOOL v351 = 0;
                                                                                                                                }
                                                                                                                                unsigned int v352 = *(unsigned __int8 *)(v286 + v351 + 11);
                                                                                                                                if (v352 != 2) {
                                                                                                                                  goto LABEL_715;
                                                                                                                                }
                                                                                                                                goto LABEL_713;
                                                                                                                              }
LABEL_700:
                                                                                                                              LOBYTE(buf) = 1;
                                                                                                                              char v455 = 1;
                                                                                                                              unint64_t v346 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x32u, 0, &buf);
                                                                                                                              unint64_t v347 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x32u, 1u, &v455);
                                                                                                                              if (v343 >= 1.0) {
                                                                                                                                v348 = (char *)v347;
                                                                                                                              }
                                                                                                                              else {
                                                                                                                                v348 = (char *)v346;
                                                                                                                              }
                                                                                                                              char v349 = *v348;
                                                                                                                              goto LABEL_705;
                                                                                                                            }
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            BOOL v341 = 0;
                                                                                                                          }
                                                                                                                          unsigned int v342 = *(unsigned __int8 *)(v286 + v341 + 11);
                                                                                                                          if (v342 != 2) {
                                                                                                                            goto LABEL_692;
                                                                                                                          }
                                                                                                                          goto LABEL_690;
                                                                                                                        }
LABEL_677:
                                                                                                                        LOBYTE(buf) = 1;
                                                                                                                        char v455 = 1;
                                                                                                                        unint64_t v336 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x30u, 0, &buf);
                                                                                                                        unint64_t v337 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x30u, 1u, &v455);
                                                                                                                        if (v333 >= 1.0) {
                                                                                                                          v338 = (char *)v337;
                                                                                                                        }
                                                                                                                        else {
                                                                                                                          v338 = (char *)v336;
                                                                                                                        }
                                                                                                                        char v339 = *v338;
                                                                                                                        goto LABEL_682;
                                                                                                                      }
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      BOOL v331 = 0;
                                                                                                                    }
                                                                                                                    unsigned int v332 = *(unsigned __int8 *)(v286 + v331 + 11);
                                                                                                                    if (v332 != 2) {
                                                                                                                      goto LABEL_669;
                                                                                                                    }
                                                                                                                    goto LABEL_667;
                                                                                                                  }
LABEL_654:
                                                                                                                  LOBYTE(buf) = 1;
                                                                                                                  char v455 = 1;
                                                                                                                  unint64_t v326 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x2Fu, 0, &buf);
                                                                                                                  unint64_t v327 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v286, 0x2Fu, 1u, &v455);
                                                                                                                  if (v323 >= 1.0) {
                                                                                                                    v328 = (char *)v327;
                                                                                                                  }
                                                                                                                  else {
                                                                                                                    v328 = (char *)v326;
                                                                                                                  }
                                                                                                                  char v329 = *v328;
                                                                                                                  goto LABEL_659;
                                                                                                                }
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                BOOL v321 = 0;
                                                                                                              }
                                                                                                              unsigned int v322 = *(unsigned __int8 *)(v286 + v321 + 11);
                                                                                                              if (v322 != 2) {
                                                                                                                goto LABEL_646;
                                                                                                              }
                                                                                                              goto LABEL_644;
                                                                                                            }
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            BOOL v313 = 0;
                                                                                                          }
                                                                                                          unsigned int v314 = *(unsigned __int8 *)(v286 + v313 + 11);
                                                                                                          if (v314 != 2) {
                                                                                                            goto LABEL_626;
                                                                                                          }
                                                                                                          goto LABEL_624;
                                                                                                        }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        BOOL v305 = 0;
                                                                                                      }
                                                                                                      unsigned int v306 = *(unsigned __int8 *)(v286 + v305 + 11);
                                                                                                      if (v306 != 2) {
                                                                                                        goto LABEL_606;
                                                                                                      }
                                                                                                      goto LABEL_604;
                                                                                                    }
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    BOOL v297 = 0;
                                                                                                  }
                                                                                                  unsigned int v298 = *(unsigned __int8 *)(v286 + v297 + 11);
                                                                                                  if (v298 != 2) {
                                                                                                    goto LABEL_586;
                                                                                                  }
                                                                                                  goto LABEL_584;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                BOOL v289 = 0;
                                                                                              }
                                                                                              unsigned int v290 = *(unsigned __int8 *)(v286 + v289 + 11);
                                                                                              if (v290 != 2) {
                                                                                                goto LABEL_566;
                                                                                              }
                                                                                              goto LABEL_564;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            BOOL v224 = 0;
                                                                                          }
                                                                                          unsigned int v225 = *(unsigned __int8 *)(v204 + v224 + 11);
                                                                                          if (v225 != 2) {
                                                                                            goto LABEL_475;
                                                                                          }
                                                                                          goto LABEL_473;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        BOOL v216 = 0;
                                                                                      }
                                                                                      unsigned int v217 = *(unsigned __int8 *)(v204 + v216 + 11);
                                                                                      if (v217 != 2) {
                                                                                        goto LABEL_455;
                                                                                      }
                                                                                      goto LABEL_453;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    BOOL v207 = 0;
                                                                                  }
                                                                                  unsigned int v208 = *(unsigned __int8 *)(v204 + v207 + 11);
                                                                                  if (v208 != 2) {
                                                                                    goto LABEL_435;
                                                                                  }
                                                                                  goto LABEL_433;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                BOOL v182 = 0;
                                                                              }
                                                                              unsigned int v183 = *(unsigned __int8 *)(v179 + v182 + 11);
                                                                              if (v183 != 2) {
                                                                                goto LABEL_395;
                                                                              }
                                                                              goto LABEL_393;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            BOOL v170 = 0;
                                                                          }
                                                                          unsigned int v171 = *(unsigned __int8 *)(v167 + v170 + 11);
                                                                          if (v171 != 2) {
                                                                            goto LABEL_372;
                                                                          }
                                                                          goto LABEL_370;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        BOOL v158 = 0;
                                                                      }
                                                                      unsigned int v159 = *(unsigned __int8 *)(v121 + v158 + 11);
                                                                      if (v159 != 2) {
                                                                        goto LABEL_349;
                                                                      }
                                                                      goto LABEL_347;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    BOOL v150 = 0;
                                                                  }
                                                                  unsigned int v151 = *(unsigned __int8 *)(v121 + v150 + 11);
                                                                  if (v151 != 2) {
                                                                    goto LABEL_329;
                                                                  }
                                                                  goto LABEL_327;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                BOOL v142 = 0;
                                                              }
                                                              unsigned int v143 = *(unsigned __int8 *)(v121 + v142 + 11);
                                                              if (v143 != 2) {
                                                                goto LABEL_309;
                                                              }
                                                              goto LABEL_307;
                                                            }
LABEL_294:
                                                            LOBYTE(buf) = 1;
                                                            char v455 = 1;
                                                            uint64_t v137 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v121, 0x17u, 0, &buf);
                                                            uint64_t v138 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v121, 0x17u, 1u, &v455);
                                                            if (v134 >= 1.0) {
                                                              v139 = (int *)v138;
                                                            }
                                                            else {
                                                              v139 = (int *)v137;
                                                            }
                                                            int v140 = *v139;
                                                            goto LABEL_299;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          BOOL v132 = 0;
                                                        }
                                                        unsigned int v133 = *(unsigned __int8 *)(v121 + v132 + 11);
                                                        if (v133 != 2) {
                                                          goto LABEL_286;
                                                        }
                                                        goto LABEL_284;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      BOOL v124 = 0;
                                                    }
                                                    unsigned int v125 = *(unsigned __int8 *)(v121 + v124 + 11);
                                                    if (v125 != 2) {
                                                      goto LABEL_266;
                                                    }
                                                    goto LABEL_264;
                                                  }
                                                }
                                                else
                                                {
                                                  BOOL v114 = 0;
                                                }
                                                unsigned int v115 = v68[v114 + 11];
                                                if (v115 != 2) {
                                                  goto LABEL_245;
                                                }
                                                goto LABEL_243;
                                              }
                                            }
                                            else
                                            {
                                              BOOL v105 = 0;
                                            }
                                            unsigned int v106 = v68[v105 + 11];
                                            if (v106 != 2) {
                                              goto LABEL_225;
                                            }
                                            goto LABEL_223;
                                          }
                                        }
                                        else
                                        {
                                          BOOL v96 = 0;
                                        }
                                        unsigned int v97 = v68[v96 + 11];
                                        if (v97 != 2) {
                                          goto LABEL_205;
                                        }
                                        goto LABEL_203;
                                      }
                                    }
                                    else
                                    {
                                      BOOL v87 = 0;
                                    }
                                    unsigned int v88 = v68[v87 + 11];
                                    if (v88 != 2) {
                                      goto LABEL_185;
                                    }
                                    goto LABEL_183;
                                  }
                                }
                                else
                                {
                                  BOOL v79 = 0;
                                }
                                unsigned int v80 = v68[v79 + 11];
                                if (v80 != 2) {
                                  goto LABEL_165;
                                }
                                goto LABEL_163;
                              }
                            }
                            else
                            {
                              BOOL v71 = 0;
                            }
                            unsigned int v72 = v68[v71 + 11];
                            if (v72 != 2) {
                              goto LABEL_145;
                            }
                            goto LABEL_143;
                          }
LABEL_129:
                          LOBYTE(buf) = 1;
                          char v455 = 1;
                          int v65 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<unsigned int>(v49, v13, 0, &buf);
                          int v66 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<unsigned int>(v49, v13, 1u, &v455);
                          if (v62 < 1.0) {
                            LOBYTE(v66) = v65;
                          }
                          goto LABEL_133;
                        }
                      }
                      else
                      {
                        BOOL v60 = 0;
                      }
                      unsigned int v61 = *(unsigned __int8 *)(v49 + v60 + 11);
                      if (v61 != 2) {
                        goto LABEL_121;
                      }
                      goto LABEL_119;
                    }
                  }
                  else
                  {
                    BOOL v52 = 0;
                  }
                  unsigned int v53 = *(unsigned __int8 *)(v49 + v52 + 11);
                  if (v53 != 2) {
                    goto LABEL_101;
                  }
                  goto LABEL_99;
                }
              }
            }
            else
            {
              BOOL v28 = 0;
            }
            unsigned int v30 = *(unsigned __int8 *)(v12 + v28 + 11);
            if (v30 != 2) {
              goto LABEL_58;
            }
            goto LABEL_56;
          }
        }
      }
      else
      {
        BOOL v16 = 0;
      }
      unsigned int v20 = *(unsigned __int8 *)(v12 + v16 + 11);
      if (v20 != 2) {
        goto LABEL_32;
      }
      goto LABEL_30;
    }
    gss::QueryableLocker<gss::ScenePropertyID>::~QueryableLocker((uint64_t)v452);
  }
  data = &self->_currentStyleName;
  if (*((char *)&self->_currentStyleName.__r_.__value_.var0.__l + 23) < 0)
  {
    self->_currentStyleName.__r_.__value_.var0.__l.__size_ = 4;
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.__l.__data_;
  }
  else
  {
    *((unsigned char *)&self->_currentStyleName.__r_.__value_.var0.__l + 23) = 4;
  }
  strcpy(data->__r_.__value_.var0.__s.__data_, "None");
  self->_routeFocusCoordinate.longitude._value = 0.0;
  LODWORD(self->_previousSearchItemCount) = -1082130432;
  uint64_t v19 = v454;
  if (v454)
  {
LABEL_936:
    if (!atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
}

- (void)_updateSceneQuery
{
  [(VKNavCameraController *)self _getActiveSceneManager];
  uint64_t v3 = &self->_lastProjectedPosition._e[2];
  uint64_t v4 = *(std::__shared_weak_count **)&self->_farClipPlaneFactor;
  self->_lastProjectedPosition._e[2] = 0.0;
  self->_double farClipPlaneFactor = 0.0;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    if (!v48) {
      goto LABEL_76;
    }
  }
  else if (!v48)
  {
    goto LABEL_76;
  }
  memset(v46, 0, sizeof(v46));
  char v47 = 1;
  v5 = +[VKDebugSettings sharedSettings];
  int v6 = [v5 navCameraForceComplexIntersection];

  if (v6) {
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v46, 0x10055u) = 1;
  }
  uint64_t v7 = +[VKDebugSettings sharedSettings];
  int v8 = [v7 shouldForceWindshieldMode];

  if (v8)
  {
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v46, 0x10064u) = 1;
    int8x8_t v9 = (gss::Allocator *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v46, 0x1006Bu);
    *(_WORD *)int8x8_t v9 = 1;
  }
  uint64_t v10 = v48;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = gss::Allocator::instance(v9);
  gss::StylesheetManager<gss::ScenePropertyID>::styleQueryForFeatureAttributes((uint64_t *)v45, v10, (gss::FeatureAttributeSet *)&v40, (gss::QueryOverrides *)v46);
  long long v11 = *(_OWORD *)v45;
  *(_OWORD *)v45 = 0uLL;
  uint64_t v12 = *(std::__shared_weak_count **)&self->_farClipPlaneFactor;
  *(_OWORD *)uint64_t v3 = v11;
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  unsigned int v13 = *(std::__shared_weak_count **)&v45[1];
  if (*(void *)&v45[1]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v45[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  if (v40)
  {
    uint64_t v41 = v40;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v43 + 40))(v43, v40, v42 - v40);
  }
  uint64_t v14 = *(void *)v3;
  double farClipPlaneFactor = self->_farClipPlaneFactor;
  v45[0] = *v3;
  v45[1] = farClipPlaneFactor;
  if (farClipPlaneFactor != 0.0) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&farClipPlaneFactor + 8), 1uLL, memory_order_relaxed);
  }
  gss::QueryableLocker<gss::ScenePropertyID>::QueryableLocker(&v40, v14, *(uint64_t *)&farClipPlaneFactor);
  if (farClipPlaneFactor == 0.0
    || atomic_fetch_add((atomic_ullong *volatile)(*(void *)&farClipPlaneFactor + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    if (!v44) {
      goto LABEL_73;
    }
  }
  else
  {
    (*(void (**)(std::__shared_weak_count *))(**(void **)&farClipPlaneFactor + 16))(*(std::__shared_weak_count **)&farClipPlaneFactor);
    std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&farClipPlaneFactor);
    if (!v44) {
      goto LABEL_73;
    }
  }
  uint64_t v16 = *(void *)(v40 + 24);
  uint64_t v17 = *(float **)v16;
  if (!*(void *)v16)
  {
    BOOL v19 = 0;
    goto LABEL_31;
  }
  float v18 = *v17;
  BOOL v19 = *v17 == 1.0;
  if (!*(unsigned char *)(v16 + 10) || v18 == 0.0 || v18 == 1.0)
  {
LABEL_31:
    unsigned int v20 = *(unsigned __int8 *)(v16 + v19 + 11);
    if (v20 != 2) {
      goto LABEL_34;
    }
  }
  if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(*(void *)(v40 + 24), 0x2Eu, 0)) {
    goto LABEL_35;
  }
  unsigned int v20 = 1;
LABEL_34:
  if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v16, 0x2Eu, v20)) {
    goto LABEL_49;
  }
LABEL_35:
  if (v17)
  {
    float v21 = *v17;
    BOOL v22 = *v17 == 1.0;
    if (*(unsigned char *)(v16 + 10) && v21 != 0.0 && v21 != 1.0) {
      goto LABEL_42;
    }
  }
  else
  {
    BOOL v22 = 0;
  }
  unsigned int v23 = *(unsigned __int8 *)(v16 + v22 + 11);
  float v21 = 0.0;
  if (v23 != 2)
  {
    if (*(unsigned char *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v16, 0x2Eu, v23, 0)) {
      goto LABEL_72;
    }
    goto LABEL_48;
  }
LABEL_42:
  LOBYTE(v45[0]) = 1;
  char v50 = 1;
  uint64_t v24 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v16, 0x2Eu, 0, v45);
  uint64_t v25 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v16, 0x2Eu, 1u, &v50);
  if (v21 >= 1.0) {
    float v26 = (_DWORD *)v25;
  }
  else {
    float v26 = (_DWORD *)v24;
  }
  if (*v26) {
    goto LABEL_72;
  }
LABEL_48:
  uint64_t v16 = *(void *)(v40 + 24);
  uint64_t v17 = *(float **)v16;
LABEL_49:
  if (!v17)
  {
    BOOL v28 = 0;
    goto LABEL_55;
  }
  float v27 = *v17;
  BOOL v28 = *v17 == 1.0;
  if (!*(unsigned char *)(v16 + 10) || v27 == 0.0 || v27 == 1.0)
  {
LABEL_55:
    unsigned int v29 = *(unsigned __int8 *)(v16 + v28 + 11);
    if (v29 != 2) {
      goto LABEL_58;
    }
  }
  if (gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v16, 0x55u, 0)) {
    goto LABEL_59;
  }
  unsigned int v29 = 1;
LABEL_58:
  if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v16, 0x55u, v29)) {
    goto LABEL_73;
  }
LABEL_59:
  if (v17)
  {
    float v30 = *v17;
    BOOL v31 = *v17 == 1.0;
    if (*(unsigned char *)(v16 + 10) && v30 != 0.0 && v30 != 1.0) {
      goto LABEL_66;
    }
  }
  else
  {
    BOOL v31 = 0;
  }
  unsigned int v32 = *(unsigned __int8 *)(v16 + v31 + 11);
  float v30 = 0.0;
  if (v32 != 2)
  {
    if (!*(unsigned char *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v16, 0x55u, v32, 0)) {
      goto LABEL_73;
    }
LABEL_72:
    [(VKNavCameraController *)self stopIgnoreStyleChange];
    goto LABEL_73;
  }
LABEL_66:
  LOBYTE(v45[0]) = 1;
  char v50 = 1;
  uint64_t v33 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v16, 0x55u, 0, v45);
  uint64_t v34 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v16, 0x55u, 1u, &v50);
  if (v30 >= 1.0) {
    float v35 = (_DWORD *)v34;
  }
  else {
    float v35 = (_DWORD *)v33;
  }
  if (*v35) {
    goto LABEL_72;
  }
LABEL_73:
  float v36 = (gss::Allocator *)gss::QueryableLocker<gss::ScenePropertyID>::~QueryableLocker((uint64_t)&v40);
  if (!v46[14])
  {
    uint64_t v37 = *(void *)v46;
    if (*(void *)v46)
    {
      uint64_t v38 = gss::Allocator::instance(v36);
      (*(void (**)(uint64_t, uint64_t, void))(*(void *)v38 + 40))(v38, v37, *(unsigned __int16 *)&v46[12]);
    }
  }
LABEL_76:
  uint64_t v39 = v49;
  if (v49)
  {
    if (!atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
}

- (void)stylesheetDidReload
{
  self->_routeFocusCoordinate.longitude._value = 0.0;
  [(VKNavCameraController *)self _setNeedsUpdate];
}

- (shared_ptr<gss::StylesheetManager<gss::ScenePropertyID>>)_getActiveSceneManager
{
  uint64_t v3 = v2;
  uint64_t v4 = [(VKNavCameraController *)self screenCanvas];
  uint64_t v5 = [v4 mapEngine];

  if (!v5) {
    goto LABEL_29;
  }
  int v8 = *(int8x8_t **)(v5 + 1120);
  if (!v8) {
    goto LABEL_29;
  }
  int8x8_t v9 = v8[2];
  if (!*(void *)&v9) {
    goto LABEL_29;
  }
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v9);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    uint64_t v11 = 0x2FED70A4459DFCA1;
    if (*(void *)&v9 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v11 = 0x2FED70A4459DFCA1uLL % *(void *)&v9;
    }
  }
  else
  {
    uint64_t v11 = (*(void *)&v9 - 1) & 0x2FED70A4459DFCA1;
  }
  uint64_t v12 = *(uint64_t ****)(*(void *)&v8[1] + 8 * v11);
  if (!v12) {
    goto LABEL_29;
  }
  unsigned int v13 = *v12;
  if (!v13) {
    goto LABEL_29;
  }
  if (v10.u32[0] < 2uLL)
  {
    uint64_t v14 = *(void *)&v9 - 1;
    while (1)
    {
      uint64_t v16 = v13[1];
      if (v16 == (uint64_t *)0x2FED70A4459DFCA1)
      {
        if (v13[2] == (uint64_t *)0x2FED70A4459DFCA1) {
          goto LABEL_24;
        }
      }
      else if (((unint64_t)v16 & v14) != v11)
      {
        goto LABEL_29;
      }
      unsigned int v13 = (uint64_t **)*v13;
      if (!v13) {
        goto LABEL_29;
      }
    }
  }
  while (1)
  {
    unint64_t v15 = (unint64_t)v13[1];
    if (v15 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v15 >= *(void *)&v9) {
      v15 %= *(void *)&v9;
    }
    if (v15 != v11) {
      goto LABEL_29;
    }
LABEL_13:
    unsigned int v13 = (uint64_t **)*v13;
    if (!v13) {
      goto LABEL_29;
    }
  }
  if (v13[2] != (uint64_t *)0x2FED70A4459DFCA1) {
    goto LABEL_13;
  }
LABEL_24:
  uint64_t v17 = v13[5];
  if (!v17)
  {
LABEL_29:
    void *v3 = 0;
    v3[1] = 0;
    goto LABEL_30;
  }
  uint64_t v18 = v17[34];
  if (!v18)
  {
    md::StyleLogic::updateConfiguration((md::StyleLogic *)v13[5], *((_DWORD *)v17 + 274));
    uint64_t v18 = v17[34];
  }
  uint64_t v19 = v17[35];
  void *v3 = v18;
  v3[1] = v19;
  if (v19) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v19 + 8), 1uLL, memory_order_relaxed);
  }
LABEL_30:
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (void)_updateDebugOverlay
{
  uint64_t v3 = [(VKCameraController *)self canvas];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [(VKCameraController *)self canvas];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      if (LOBYTE(self->_showConsole._key.key.identifier))
      {
        uint64_t v7 = [(VKCameraController *)self canvas];
        int v8 = (ggl::DebugConsole *)[v7 debugConsoleForId:8];

        if (v8) {
          ggl::DebugConsole::begin(v8);
        }
      }
    }
  }
}

void __51__VKNavCameraController_Debug___updateDebugOverlay__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if ((*MEMORY[0x1E4F64198] != a3
     || vabds_f32(*((float *)&a3 + 1), *(float *)(MEMORY[0x1E4F64198] + 4)) >= 0.00000011921)
    && (*MEMORY[0x1E4F64198] != a4
     || vabds_f32(*((float *)&a4 + 1), *(float *)(MEMORY[0x1E4F64198] + 4)) >= 0.00000011921))
  {
    unint64_t v8 = (a3 + 1);
    if (v8 < (int)a4 - 1)
    {
      int v9 = a4 - a3 - 2;
      do
      {
        if (v8 >= [v7 pointCount]) {
          break;
        }
        [v7 pointAt:v8];
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        uint64_t v22 = [*(id *)(a1 + 32) mapDataAccess];
        unsigned int v23 = *(void **)(a1 + 32);
        if (v23)
        {
          objc_msgSend(v23, "_coordinateForGeoLocation:", v17, v19, v21);
          uint64_t v10 = *(void *)(a1 + 32);
        }
        else
        {
          uint64_t v10 = 0;
          uint64_t v24 = 0;
          v25[0] = 0;
          v25[1] = 0;
        }
        gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(v22 + 16), (double *)&v24, (uint64_t *)(v10 + 248));
        *(float *)&double v11 = v11;
        *(float *)&double v12 = v12;
        unsigned int v13 = *(unsigned char **)(a1 + 40);
        v13[96] = *(unsigned char *)(a1 + 48);
        v13[97] = *(unsigned char *)(a1 + 49);
        v13[98] = *(unsigned char *)(a1 + 50);
        v13[99] = *(unsigned char *)(a1 + 51);
        uint64_t v14 = *(float32x2_t **)(a1 + 40);
        float v15 = *(float *)&v11 + -4.0;
        *(float *)&double v11 = *(float *)&v11 + 4.0;
        *(float *)&uint64_t v24 = v15;
        *((float *)&v24 + 1) = *(float *)&v12 + -4.0;
        v25[0].i32[0] = LODWORD(v11);
        v25[0].f32[1] = *(float *)&v12 + 4.0;
        v14[1].f32[0] = v15;
        v14[1].f32[1] = *(float *)&v12 + -4.0;
        ggl::DebugConsole::drawRectangleWithFill(v14, v25, *(float32_t *)&v11);
        ++v8;
        --v9;
      }
      while (v9);
    }
  }
}

uint64_t __51__VKNavCameraController_Debug___updateDebugOverlay__block_invoke_206(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v8 = [*(id *)(a1 + 32) mapDataAccess];
  int v9 = *(void **)(a1 + 32);
  if (v9) {
    objc_msgSend(v9, "_coordinateForGeoLocation:", a2, a3, a4);
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(v8 + 16), v15, (uint64_t *)(a1 + 40));
  *(float *)&double v10 = v10;
  *(float *)&double v11 = v11;
  double v12 = *(unsigned char **)(a1 + 96);
  v12[96] = *(unsigned char *)(a1 + 104);
  v12[97] = *(unsigned char *)(a1 + 105);
  v12[98] = *(unsigned char *)(a1 + 106);
  v12[99] = *(unsigned char *)(a1 + 107);
  uint64_t v13 = *(void *)(a1 + 96);
  *(_DWORD *)(v13 + 8) = LODWORD(v10);
  *(_DWORD *)(v13 + 12) = LODWORD(v11);
  LODWORD(v10) = 6.0;
  return ggl::DebugConsole::drawCircleWithFill(v13, v10);
}

- (void)_updateDebugText
{
  uint64_t v3 = [(VKCameraController *)self canvas];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [(VKCameraController *)self canvas];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      if (LOBYTE(self->_showConsole._key.key.identifier))
      {
        id v7 = [(VKCameraController *)self canvas];
        uint64_t v8 = (ggl::DebugConsole *)[v7 debugConsoleForId:7];

        if (v8) {
          ggl::DebugConsole::begin(v8);
        }
      }
    }
  }
}

- (id)_debugText:(BOOL)a3 showNavCameraDebugConsoleAttributes:(BOOL)a4 includeSensitiveAttributes:(BOOL)a5
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  double v11 = v10;
  p_currentStyleName = &self->_currentStyleName;
  data = &self->_currentStyleName;
  if (*((char *)&self->_currentStyleName.__r_.__value_.var0.__l + 23) < 0) {
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_currentStyleName->__r_.__value_.var0.__l.__data_;
  }
  objc_msgSend(v10, "appendFormat:", @"Style Name: %s\n", data);
  double v14 = gdc::ViewDataAccess::rigidTransformForFrame(v73, **(unsigned char **)([(VKCameraController *)self mapDataAccess] + 16), &self->_cameraFrame._target.latitude._value);
  if (v8)
  {
    objc_msgSend(v11, "appendFormat:", @"Camera\n", v14);
    if (v6)
    {
      [v11 appendFormat:@"\tLat: %f, Long: %f, Altitude: %f\n", *(void *)&self->_cameraFrame._target.latitude._value, *(void *)&self->_cameraFrame._target.longitude._value, *(void *)&self->_cameraFrame._target.altitude._value];
      [v11 appendFormat:@"\tHeight off Puck (Lat): %.2f\n", self->_cameraFrame._distanceFromTarget._value * cos(self->_pitchSpring._position)];
    }
    [v11 appendFormat:@"\tPitch: %.2f\n", self->_cameraFrame._pitch._value * 57.2957795];
    [v11 appendFormat:@"\tHeading: %.2f\n", self->_cameraFrame._heading._value * 57.2957795];
    objc_msgSend(v11, "appendFormat:", @"\tCoordinates to frame: %lu\n", 0xAAAAAAAAAAAAAAABLL * ((self->_currentStyleName.var0 - *(void *)&self->_currentStyleName.__r_.var0) >> 3));
    objc_msgSend(v11, "appendFormat:", @"\tComputed Maneuvers To Frame: %d\n", BYTE1(self->_coordinatesToFrame.__end_));
    objc_msgSend(v11, "appendFormat:", @"\tSegments To Frame: %d\n", BYTE3(self->_coordinatesToFrame.__end_));
    float v15 = [(VKCameraController *)self vkCamera];
    [v15 displayZoomLevel];
    objc_msgSend(v11, "appendFormat:", @"\tZoom Level: %f\n", v16);

    unint64_t lastTargetStyleIdentifier = self->_lastTargetStyleIdentifier;
    [(VKNavCameraController *)self zoomScale];
    [v11 appendFormat:@"\tZoom Scale: (%f, %f), Min: %f, Max: %f\n", lastTargetStyleIdentifier, v18, *(void *)&self->_minZoomScale, *(void *)&self->_maxZoomScale];
    objc_msgSend(v11, "appendFormat:", @"\tPuck Course: %f\n", self->_puckCourse._value * 57.2957795);
    [v11 appendFormat:@"\tDisplay Rate: (requested: %ld, avg:%.f) - Pixel Change: %f\n", *(void *)&self->_requesteDisplayRateSampler._sum, *(void *)&self->_requesteDisplayRateSampler._min, *(void *)&self->_pixelSamples._min];
    [v11 appendFormat:@"\tViewable Screen Rect: "];
    double maxHeightDeltaChangeVertical = self->_maxHeightDeltaChangeVertical;
    if (self->_viewableScreenRect._minimum._e[0] >= maxHeightDeltaChangeVertical
      && (double v20 = self->_viewableScreenRect._minimum._e[1], halfPuckSize = self->_halfPuckSize, v20 >= halfPuckSize))
    {
      [v11 appendFormat:@"(Min: %f, %f), (Max: %f, %f)\n", *(void *)&maxHeightDeltaChangeVertical, *(void *)&halfPuckSize, *(void *)&self->_viewableScreenRect._minimum._e[0], *(void *)&v20];
    }
    else
    {
      [v11 appendFormat:@"Empty\n"];
    }
    [v11 appendFormat:@"\tFraming Screen Rect: "];
    double v22 = self->_viewableScreenRect._maximum._e[0];
    if (self->_framingScreenRect._minimum._e[0] >= v22
      && (double v23 = self->_framingScreenRect._minimum._e[1], v24 = self->_viewableScreenRect._maximum._e[1], v23 >= v24))
    {
      [v11 appendFormat:@"(Min: %f, %f), (Max: %f, %f)\n", *(void *)&v22, *(void *)&v24, *(void *)&self->_framingScreenRect._minimum._e[0], *(void *)&v23];
    }
    else
    {
      [v11 appendFormat:@"Empty\n"];
    }
    uint64_t v5 = (__int16 *)"Y";
    if (self->_isDetached) {
      uint64_t v25 = "Y";
    }
    else {
      uint64_t v25 = "N";
    }
    objc_msgSend(v11, "appendFormat:", @"\tDetached: %s", v25);
    if ([(VKAnimation *)self->_transitionAnimation running]) {
      float v26 = "Y";
    }
    else {
      float v26 = "N";
    }
    objc_msgSend(v11, "appendFormat:", @" Transitioning: %s\n", v26);
    double value = self->_puckCoordinate.latitude._value;
    double v28 = self->_puckCoordinate.longitude._value;
    double v29 = self->_puckCoordinate.altitude._value;
    [v11 appendFormat:@"Springs:\n"];
    if (v6) {
      [v11 appendFormat:@"\tPuck Lat: %f, Long: %f, Alt: %f\n", value * 57.2957795, v28 * 57.2957795, *(void *)&v29];
    }
    [v11 appendFormat:@"\tPitch: %.2f => %.2f\n", self->_pitchSpring._position * 57.2957795, self->_pitchSpring._restingPosition * 57.2957795];
    [v11 appendFormat:@"\tHeading: %.2f => %.2f\n", self->_headingSpring._position * 57.2957795, self->_headingSpring._restingPosition * 57.2957795];
    [v11 appendFormat:@"\tDistance From Target: %.2fm => %.2fm\n", *(void *)&self->_distanceFromTargetSpring._position, *(void *)&self->_distanceFromTargetSpring._restingPosition];
    [v11 appendFormat:@"\tScreen Pos: %.2f, %.2f  => %.2f, %.2f\n", *(void *)&self->_screenPositionSpring._position._e[0], *(void *)&self->_screenPositionSpring._position._e[1], *(void *)&self->_screenPositionSpring._restingPosition._e[0], *(void *)&self->_screenPositionSpring._restingPosition._e[1]];
    float v30 = [*(id *)&self->_maxFramingDistance route];
    if (v30) {
      BOOL v31 = "Y";
    }
    else {
      BOOL v31 = "N";
    }
    objc_msgSend(v11, "appendFormat:", @"Route: %s\n", v31);
    if (v30)
    {
      objc_msgSend(v11, "appendFormat:", @"\tSteps: %lu\n", objc_msgSend(v30, "stepsCount"));
      objc_msgSend(v11, "appendFormat:", @"\tCurrent Step: %ld\n", objc_msgSend(*(id *)&self->_maxFramingDistance, "currentStepIndex"));
      objc_msgSend(v11, "appendFormat:", @"\tGrouped Maneuvers: %lu\n", objc_msgSend(*(id *)&self->_maxFramingDistance, "groupedManeuverCount"));
    }
    unsigned int v32 = [*(id *)&self->_maxFramingDistance routeMatch];
    if (v32) {
      uint64_t v33 = "Y";
    }
    else {
      uint64_t v33 = "N";
    }
    objc_msgSend(v11, "appendFormat:", @"RouteMatch: %s\n", v33);
    if (v30)
    {
      uint64_t v34 = [v32 isGoodMatch] ? "Y" : "N";
      objc_msgSend(v11, "appendFormat:", @"\tisGoodMatch: %s\n", v34);
      objc_msgSend(v11, "appendFormat:", @"\tStep: %lu\n", objc_msgSend(v32, "stepIndex"));
      if (v6) {
        [v11 appendFormat:@"\tLocation Lat: %f, Long: %f\n", *(void *)&self->_framingDistanceAfterManeuver, self->_navContext];
      }
    }
    uint64_t v69 = 0;
    float v70 = (std::__shared_weak_count *)&v69;
    uint64_t v71 = 0x2020000000;
    char v72 = 0;
    double maxFramingDistance = self->_maxFramingDistance;
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __106__VKNavCameraController_Debug___debugText_showNavCameraDebugConsoleAttributes_includeSensitiveAttributes___block_invoke;
    v68[3] = &unk_1E5A8FEF0;
    v68[4] = &v69;
    [*(id *)&maxFramingDistance enumerateAdditionalRoutesToFrameUsingBlock:v68];
    objc_msgSend(v11, "appendFormat:", @"Alternate Routes: %d\n", LOBYTE(v70[1].__vftable));
    [v11 appendFormat:@"Style:\n"];
    if (*((char *)&self->_currentStyleName.__r_.__value_.var0.__l + 23) < 0) {
      p_currentStyleName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_currentStyleName->__r_.__value_.var0.__l.__data_;
    }
    objc_msgSend(v11, "appendFormat:", @"\tName: %s\n", p_currentStyleName);
    if (self->_cameraType == 1)
    {
      char v67 = 7;
      strcpy((char *)__p, "Framing");
    }
    else if (self->_cameraType)
    {
      char v67 = 0;
      LOBYTE(__p[0]) = 0;
    }
    else
    {
      char v67 = 8;
      strcpy((char *)__p, "Tracking");
    }
    objc_msgSend(v11, "appendFormat:", @"\tCamera Type: %s\n", __p);
    if (v67 < 0) {
      operator delete(__p[0]);
    }
    if ([*(id *)&self->_maxFramingDistance navigationCameraHeadingOverride]) {
      float v36 = "YES";
    }
    else {
      float v36 = "NO";
    }
    switch([(VKNavCameraController *)self cameraHeadingType])
    {
      case 0u:
        char v67 = 5;
        strcpy((char *)__p, "North");
        break;
      case 1u:
        char v67 = 6;
        strcpy((char *)__p, "Course");
        break;
      case 2u:
        char v67 = 5;
        strcpy((char *)__p, "Route");
        break;
      case 3u:
        char v67 = 11;
        strcpy((char *)__p, "Destination");
        break;
      default:
        char v67 = 0;
        LOBYTE(__p[0]) = 0;
        break;
    }
    objc_msgSend(v11, "appendFormat:", @"\tHeading Type(Overriden: %s): %s\n", v36, __p);
    if (v67 < 0) {
      operator delete(__p[0]);
    }
    [v11 appendFormat:@"\tHeading Delta : %.2f\n", self->_headingDelta._value * 57.2957795];
    [v11 appendFormat:@"\tHeading Delta Min: %.2f\n", self->_headingMinDelta._value * 57.2957795];
    [v11 appendFormat:@"\tPuckScreenPosition: %f, %f\n", self->_puckMovementBoundsMin._e[0], self->_puckMovementBoundsMin._e[1]];
    [v11 appendFormat:@"\tPuck Movement Bounds: %.2f, %.2f - %.2f, %.2f\n", self->_clientFramingInsets.top, self->_clientFramingInsets.left, self->_clientFramingInsets.bottom, self->_clientFramingInsets.right];
    [v11 appendFormat:@"\tPitch: %.2f\n", self->_cameraPitch._value * 57.2957795];
    [v11 appendFormat:@"\tMin/Max Pitch: %.2f, %.2f\n", self->_minCameraHeight * 57.2957795, self->_maxCameraHeight * 57.2957795];
    [v11 appendFormat:@"\tDistanceFromTarget: %.2fm\n", *(void *)&self->_cameraDistanceFromTarget._value];
    [v11 appendFormat:@"\tMin Camera Height: %.2fm\n", self->_coordinatesToFrame.__end_cap_.__value_];
    [v11 appendFormat:@"\tMax Camera Height: %.2fm\n", *(void *)&self->_styleManeuversToFrame];
    [v11 appendFormat:@"\tHeight Delta: H(%.2f, %.2f), V(%.2f, %.2f)\n", *(void *)&self->_puckMovementBoundsMax, *(void *)&self->_idealPuckScreenPosition, *(void *)&self->_minHeightDeltaChangeHorizontal, *(void *)&self->_maxHeightDeltaChangeHorizontal];
    [v11 appendFormat:@"\tFraming Insets: (%.2f + %.2f), (%.2f + %.2f) - (%.2f + %.2f), (%.2f + %.2f)\n", self->_framingEdgeInset.left, self->_previousMapEdgeInsets.left, self->_framingEdgeInset.right, self->_previousMapEdgeInsets.right, self->_framingEdgeInset.top, self->_previousMapEdgeInsets.top, self->_framingEdgeInset.bottom, self->_previousMapEdgeInsets.bottom];
    if (LOBYTE(self->_framingScreenRect._maximum._e[0])) {
      uint64_t v37 = "Y";
    }
    else {
      uint64_t v37 = "N";
    }
    if (BYTE1(self->_framingScreenRect._maximum._e[0])) {
      uint64_t v38 = "Y";
    }
    else {
      uint64_t v38 = "N";
    }
    if (BYTE3(self->_framingScreenRect._maximum._e[0])) {
      uint64_t v39 = "Y";
    }
    else {
      uint64_t v39 = "N";
    }
    if (BYTE2(self->_framingScreenRect._maximum._e[0])) {
      uint64_t v40 = "Y";
    }
    else {
      uint64_t v40 = "N";
    }
    objc_msgSend(v11, "appendFormat:", @"\tGesture Enable pan:%s zoom:%s rotate:%s pitch:%s\n", v37, v38, v39, v40);
    [v11 appendFormat:@"\tPan Return Delay: %.2fs\n", *((float *)self->_framingScreenRect._maximum._e + 1)];
    switch(LOBYTE(self->_framingScreenRect._maximum._e[1]))
    {
      case 0:
        char v67 = 4;
        strcpy((char *)__p, "None");
        break;
      case 1:
        char v67 = 9;
        strcpy((char *)__p, "Incidents");
        break;
      case 2:
        char v67 = 13;
        strcpy((char *)__p, "SearchResults");
        break;
      case 3:
        char v67 = 16;
        uint64_t v41 = "AdditionalRoutes";
        goto LABEL_76;
      case 4:
        char v67 = 14;
        strcpy((char *)__p, "NextTrafficEnd");
        break;
      case 5:
        char v67 = 16;
        uint64_t v41 = "VehiclePositions";
LABEL_76:
        *(_OWORD *)__p = *(_OWORD *)v41;
        char v66 = 0;
        break;
      default:
        char v67 = 0;
        LOBYTE(__p[0]) = 0;
        break;
    }
    switch(BYTE1(self->_framingScreenRect._maximum._e[1]))
    {
      case 0:
        char v64 = 4;
        strcpy((char *)v62, "None");
        break;
      case 1:
        char v64 = 9;
        strcpy((char *)v62, "Incidents");
        break;
      case 2:
        char v64 = 13;
        strcpy((char *)v62, "SearchResults");
        break;
      case 3:
        char v64 = 16;
        uint64_t v42 = "AdditionalRoutes";
        goto LABEL_85;
      case 4:
        char v64 = 14;
        strcpy((char *)v62, "NextTrafficEnd");
        break;
      case 5:
        char v64 = 16;
        uint64_t v42 = "VehiclePositions";
LABEL_85:
        *(_OWORD *)float v62 = *(_OWORD *)v42;
        char v63 = 0;
        break;
      default:
        char v64 = 0;
        LOBYTE(v62[0]) = 0;
        break;
    }
    objc_msgSend(v11, "appendFormat:", @"\tFraming Source: primary=%s secondary=%s\n", __p, v62);
    if (v64 < 0)
    {
      operator delete(v62[0]);
      if ((v67 & 0x80000000) == 0) {
        goto LABEL_88;
      }
    }
    else if ((v67 & 0x80000000) == 0)
    {
LABEL_88:
      objc_msgSend(v11, "appendFormat:", @"\tMax Framing Distance: %f\n", *(void *)&self->_enablePan);
      objc_msgSend(v11, "appendFormat:", @"\tManeuvers To Frame: %d\n", LOBYTE(self->_coordinatesToFrame.__end_));
      objc_msgSend(v11, "appendFormat:", @"\tFraming Distance After Maneuver: %f\n", *(void *)&self->_alternateFramingSource);
      objc_msgSend(v11, "appendFormat:", @"\tMax Maneuver: %d\n", BYTE1(self->_locationCoordinate.longitude));
      if (LOBYTE(self->_locationCoordinate.longitude)) {
        uint64_t v43 = "Y";
      }
      else {
        uint64_t v43 = "N";
      }
      objc_msgSend(v11, "appendFormat:", @"\tFrame Grouped Maneuvers: %s\n", v43);
      if (BYTE2(self->_locationCoordinate.longitude)) {
        char v44 = "Y";
      }
      else {
        char v44 = "N";
      }
      objc_msgSend(v11, "appendFormat:", @"\tIgnore Points Behind: %s\n", v44);
      [v11 appendFormat:@"\tFar Clip Plane Factor: %.2f\n", *(void *)&self->_lastProjectedPosition._e[1]];
      _Block_object_dispose(&v69, 8);

      goto LABEL_95;
    }
    operator delete(__p[0]);
    goto LABEL_88;
  }
LABEL_95:
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraMode);
    v46 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained sceneClientStyleState];
    }
    else
    {
      uint64_t v69 = 0;
      float v70 = 0;
    }

    [(VKNavCameraController *)self _getActiveSceneManager];
    if (v69)
    {
      [v11 appendFormat:@"Client Attributes:\n"];
      uint64_t v47 = v69;
      uint64_t v48 = (pthread_rwlock_t *)(v69 + 16);
      *(void *)&v73[7] = v69 + 16;
      uint64_t v49 = (geo::read_write_lock *)pthread_rwlock_rdlock((pthread_rwlock_t *)(v69 + 16));
      if (v49) {
        geo::read_write_lock::logFailure(v49, (uint64_t)"read lock", v50);
      }
      geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::intern_linear_map((uint64_t *)v62, (uint64_t *)(v47 + 216));
      float v51 = (geo::read_write_lock *)pthread_rwlock_unlock(v48);
      if (v51) {
        geo::read_write_lock::logFailure(v51, (uint64_t)"unlock", v52);
      }
      int v53 = WORD1(v62[1]);
      if (WORD1(v62[1]))
      {
        float v54 = 0;
        unsigned int v55 = 0;
        unsigned int v56 = WORD1(v62[1]);
        do
        {
          if (v55 < v56)
          {
            float v54 = (int *)((char *)v62[0] + 4 * v55);
            uint64_t v5 = (__int16 *)((char *)v62[0] + 2 * v55 + LOWORD(v62[1]));
          }
          float v57 = gss::to_string(*v54);
          float v51 = (geo::read_write_lock *)objc_msgSend(v11, "appendFormat:", @"\t%s: %s\n", v57, gss::to_string(*v54, *v5));
          unsigned int v56 = WORD1(v62[1]);
          if (v55 + 1 < WORD1(v62[1])) {
            ++v55;
          }
          else {
            unsigned int v55 = WORD1(v62[1]);
          }
        }
        while (v55 != v53);
      }
      if (!BYTE6(v62[1]) && v62[0])
      {
        uint64_t v58 = gss::Allocator::instance(v51);
        (*(void (**)(uint64_t, void *, void))(*(void *)v58 + 40))(v58, v62[0], WORD2(v62[1]));
      }
    }
    float v59 = (std::__shared_weak_count *)__p[1];
    if (__p[1] && !atomic_fetch_add((atomic_ullong *volatile)__p[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
      std::__shared_weak_count::__release_weak(v59);
    }
    BOOL v60 = v70;
    if (v70 && !atomic_fetch_add(&v70->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
    }
  }
  return v11;
}

uint64_t __106__VKNavCameraController_Debug___debugText_showNavCameraDebugConsoleAttributes_includeSensitiveAttributes___block_invoke(uint64_t result)
{
  return result;
}

- (id)detailedDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"Nav Camera Controller\n"];
  v7.receiver = self;
  v7.super_class = (Class)VKNavCameraController;
  uint64_t v4 = [(VKCameraController *)&v7 detailedDescription];
  [v3 appendFormat:@"%@\n", v4];

  uint64_t v5 = [(VKNavCameraController *)self _debugText:1 showNavCameraDebugConsoleAttributes:1 includeSensitiveAttributes:0];
  [v3 appendFormat:@"%@\n", v5];

  return v3;
}

- (id).cxx_construct
{
  self->_puckCoordinate.longitude._double value = 0.0;
  self->_puckCoordinate.altitude._double value = 0.0;
  self->_puckCoordinate.latitude._double value = 0.0;
  int64x2_t v3 = vdupq_n_s64(0xC00921FB54442D18);
  *(int64x2_t *)&self->_lastCalculatedCameraFrame._target.latitude._double value = v3;
  *(_OWORD *)&self->_lastCalculatedCameraFrame._target.altitude._double value = 0u;
  *(_OWORD *)&self->_lastCalculatedCameraFrame._pitch._double value = 0u;
  self->_lastCalculatedCameraFrame._roll._double value = 0.0;
  *(int64x2_t *)&self->_cameraFrame._target.latitude._double value = v3;
  *(_OWORD *)&self->_cameraFrame._target.altitude._double value = 0u;
  *(_OWORD *)&self->_cameraFrame._pitch._double value = 0u;
  self->_cameraFrame._roll._double value = 0.0;
  self->_pitchSpring._velocity = 0.0;
  self->_pitchSpring._restingPosition = 0.0;
  self->_pitchSpring._position = 0.0;
  *(_OWORD *)&self->_pitchSpring._kSpring = xmmword_1A28FE7F0;
  self->_headingSpring._velocity = 0.0;
  self->_headingSpring._restingPosition = 0.0;
  self->_headingSpring._position = 0.0;
  *(_OWORD *)&self->_headingSpring._kSpring = xmmword_1A28FE7F0;
  self->_distanceFromTargetSpring._velocity = 0.0;
  self->_distanceFromTargetSpring._restingPosition = 0.0;
  self->_distanceFromTargetSpring._position = 0.0;
  *(_OWORD *)&self->_distanceFromTargetSpring._kSpring = xmmword_1A28FE7F0;
  self->_screenPositionSpring._position = 0u;
  self->_screenPositionSpring._velocity = 0u;
  self->_screenPositionSpring._restingPosition = 0u;
  *(_OWORD *)&self->_screenPositionSpring._kSpring = xmmword_1A28FE7F0;
  *(int64x2_t *)&self->_transitionFrame._target.latitude._double value = v3;
  *(_OWORD *)&self->_transitionFrame._target.altitude._double value = 0u;
  *(_OWORD *)&self->_transitionFrame._pitch._double value = 0u;
  self->_transitionFrame._roll._double value = 0.0;
  *(_OWORD *)&self->_currentStyleName.__r_.__value_.var0.__l.__size_ = 0uLL;
  self->_currentStyleName.__r_.__value_.var0.__l.__data_ = 0;
  self->_currentStyleName.var0 = 0;
  self->_coordinatesToFrame.__begin_ = 0;
  *(void *)&self->_currentStyleName.__r_.var0 = 0;
  self->_locationCoordinate.latitude = -0.0078125;
  *(void *)&self->_frameAllGroupedManeuvers = 0;
  self->_routeFocusCoordinate.latitude._double value = 0.0;
  self->_routeCoordinate = 0;
  self->_desiredZoomScale = 0.0;
  *(void *)&self->_animationTime = 0;
  *(_OWORD *)&self->_depthNear = 0u;
  *(_OWORD *)&self->_cornerCoordinates[0].latitude._double value = 0u;
  *(_OWORD *)&self->_cornerCoordinates[0].altitude._double value = 0u;
  *(_OWORD *)&self->_cornerCoordinates[1].longitude._double value = 0u;
  *(_OWORD *)&self->_cornerCoordinates[2].latitude._double value = 0u;
  *(_OWORD *)&self->_cornerCoordinates[2].altitude._double value = 0u;
  *(_OWORD *)&self->_cornerCoordinates[3].longitude._double value = 0u;
  *(_OWORD *)&self->_pixelSamples._min = 0u;
  LOBYTE(self->_pixelSamples._avg) = 0;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[58] = 0u;
  *(_OWORD *)&self->_requesteDisplayRateSampler._min = 0u;
  self->_requesteDisplayRateSampler._avg = 0.0;
  *(void *)&self->_isElevatedRoute = 0;
  self->_labelMetrics.__ptr_.__value_ = 0;
  self->_pixelChangeFrameRate.__begin_ = 0;
  self->_cameraManager = 0;
  self->_lastProjectedPosition._e[2] = 0.0;
  self->_double farClipPlaneFactor = 0.0;
  p_didNavCameraTransition = &self->_didNavCameraTransition;
  uint64_t v5 = (_OWORD *)MEMORY[0x1E4F63E90];
  *(_OWORD *)&self->_didNavCameraTransition = *MEMORY[0x1E4F63E90];
  self->_showConsole._key.key.metadata = 0;
  BOOL v6 = operator new(0x20uLL);
  v6[1] = 0;
  v6[2] = 0;
  *BOOL v6 = &unk_1EF52E530;
  *((void *)p_didNavCameraTransition + 5) = v6;
  *((unsigned char *)v6 + ++*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *((void *)p_didNavCameraTransition + 4) = v6 + 3;
  *((void *)p_didNavCameraTransition + 9) = 0;
  *(_OWORD *)&self->_showConsole._delegate.__f_.__buf_.__lx[16] = *v5;
  self->_showOverlay._key.key.metadata = 0;
  objc_super v7 = (_valid *)operator new(0x20uLL);
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = 0;
  *(void *)objc_super v7 = &unk_1EF52E530;
  self->_showOverlay._listener = v7;
  *((unsigned char *)v7 + ++*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(void *)&self->_showOverlay._double value = (char *)v7 + 24;
  *(void *)&self->_showOverlay._delegate.__f_.__buf_.__lx[8] = 0;
  *(_OWORD *)&self->_showOverlay._delegate.__f_.__buf_.__lx[16] = *v5;
  self->_showAttributes._key.key.metadata = 0;
  BOOL v8 = (_valid *)operator new(0x20uLL);
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = 0;
  *(void *)BOOL v8 = &unk_1EF52E530;
  self->_showAttributes._listener = v8;
  *((unsigned char *)v8 + ++*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(void *)&self->_showAttributes._double value = (char *)v8 + 24;
  *(void *)&self->_showAttributes._delegate.__f_.__buf_.__lx[8] = 0;
  *(_OWORD *)&self->_showAttributes._delegate.__f_.__buf_.__lx[16] = *v5;
  self->_showProperties._key.key.metadata = 0;
  int v9 = (_valid *)operator new(0x20uLL);
  *((void *)v9 + 1) = 0;
  *((void *)v9 + 2) = 0;
  *(void *)int v9 = &unk_1EF52E530;
  self->_showProperties._listener = v9;
  *((unsigned char *)v9 + ++*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(void *)&self->_showProperties._double value = (char *)v9 + 24;
  *(void *)&self->_showProperties._delegate.__f_.__buf_.__lx[8] = 0;
  *(_OWORD *)&self->_showProperties._delegate.__f_.__buf_.__lx[16] = *v5;
  self->_showLegend._key.key.metadata = 0;
  id v10 = (_valid *)operator new(0x20uLL);
  *((void *)v10 + 1) = 0;
  *((void *)v10 + 2) = 0;
  *(void *)id v10 = &unk_1EF52E530;
  self->_showLegend._listener = v10;
  *((unsigned char *)v10 + ++*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(void *)&self->_showLegend._double value = (char *)v10 + 24;
  *(void *)&self->_showLegend._delegate.__f_.__buf_.__lx[8] = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)&self->_showProperties._delegate.__f_.__buf_.__lx[16]);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)&self->_showAttributes._delegate.__f_.__buf_.__lx[16]);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)&self->_showOverlay._delegate.__f_.__buf_.__lx[16]);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)&self->_showConsole._delegate.__f_.__buf_.__lx[16]);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)&self->_didNavCameraTransition);
  objc_destroyWeak((id *)&self->_cameraMode);
  int64x2_t v3 = *(std::__shared_weak_count **)&self->_farClipPlaneFactor;
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  cameraManager = (LabelMetrics *)self->_cameraManager;
  if (cameraManager)
  {
    self->_labelMetrics.__ptr_.__value_ = cameraManager;
    operator delete(cameraManager);
  }
  uint64_t v5 = *(void *)&self->_isElevatedRoute;
  *(void *)&self->_isElevatedRoute = 0;
  if (v5)
  {
    BOOL v6 = *(void **)v5;
    if (*(void *)v5)
    {
      *(void *)(v5 + 8) = v6;
      operator delete(v6);
    }
    MEMORY[0x1A6239270](v5, 0x1020C4040A25C38);
  }
  if (LOBYTE(self->_pixelSamples._avg)) {
    LOBYTE(self->_pixelSamples._avg) = 0;
  }
  objc_super v7 = *(std::__shared_weak_count **)&self->_animationTime;
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  objc_storeStrong((id *)&self->_maxFramingDistance, 0);
  BOOL v8 = *(void **)&self->_currentStyleName.__r_.var0;
  if (v8)
  {
    self->_currentStyleName.var0 = (int64_t)v8;
    operator delete(v8);
  }
  if (*((char *)&self->_currentStyleName.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_currentStyleName.__r_.__value_.var0.__l.__data_);
  }
  objc_storeStrong((id *)&self->_snapHeadingAnimation, 0);
  objc_storeStrong((id *)&self->_snapPitchAnimation, 0);
  objc_storeStrong((id *)&self->_transitionAnimation, 0);
  objc_storeStrong((id *)&self->_davinciGestureCameraController, 0);
  objc_storeStrong((id *)&self->_detachedGestureBehavior, 0);
  objc_storeStrong((id *)&self->_attachedGestureBehavior, 0);
  objc_destroyWeak((id *)&self->_gestureBehavior);
}

- (Coordinate3D<geo::Radians,)puckCoordinate
{
  *(_OWORD *)uint64_t v2 = *(_OWORD *)&self->_puckCoordinate.latitude._value;
  double value = self->_puckCoordinate.altitude._value;
  *(double *)(v2 + 16) = value;
  result.latitude = *(Unit<geo::RadianUnitDescription, double> *)&value;
  return result;
}

- (void)setClientFramingInsets:(VKEdgeInsets)a3
{
  self->_framingEdgeInsetProportional = a3;
}

- (VKEdgeInsets)clientFramingInsets
{
  float top = self->_framingEdgeInsetProportional.top;
  float left = self->_framingEdgeInsetProportional.left;
  float bottom = self->_framingEdgeInsetProportional.bottom;
  float right = self->_framingEdgeInsetProportional.right;
  result.float right = right;
  result.float bottom = bottom;
  result.float left = left;
  result.float top = top;
  return result;
}

- (void)setSceneConfiguration:(id)a3
{
}

- (VKSceneConfiguration)sceneConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraMode);
  return (VKSceneConfiguration *)WeakRetained;
}

- (void)setScreenCanvas:(id)a3
{
}

- (VKInteractiveMap)screenCanvas
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  return (VKInteractiveMap *)WeakRetained;
}

- (float)maxPitchForNormalizedZoomLevel:(float)a3
{
  uint64_t v5 = +[VKDebugSettings sharedSettings];
  char v6 = [v5 relaxTiltLimits];

  if (v6) {
    return 1.4835;
  }
  BOOL v8 = (id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16];
  id WeakRetained = objc_loadWeakRetained(v8);
  uint64_t v10 = *(void *)([WeakRetained mapEngine] + 1192);

  if (!v10) {
    return 0.0;
  }
  id v11 = objc_loadWeakRetained(v8);
  float v12 = pitchForZ((void *)(*(void *)([v11 mapEngine] + 1192) + 408), a3);

  return v12;
}

- (float)idealPitchForNormalizedZoomLevel:(float)a3
{
  uint64_t v4 = (id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  uint64_t v6 = *(void *)([WeakRetained mapEngine] + 1192);

  if (!v6) {
    return 0.0;
  }
  id v7 = objc_loadWeakRetained(v4);
  float v8 = pitchForZ((void *)(*(void *)([v7 mapEngine] + 1192) + 432), a3);

  return v8;
}

- (float)minPitchForNormalizedZoomLevel:(float)a3
{
  uint64_t v4 = (id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  uint64_t v6 = *(void *)([WeakRetained mapEngine] + 1192);

  if (!v6) {
    return 0.0;
  }
  id v7 = objc_loadWeakRetained(v4);
  float v8 = pitchForZ((void *)(*(void *)([v7 mapEngine] + 1192) + 384), a3);

  return v8;
}

- (float)minimumNormalizedZoomLevel
{
  uint64_t v2 = (id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  uint64_t v4 = *(void *)([WeakRetained mapEngine] + 1192);

  float v5 = 1.0;
  if (!v4) {
    return fmaxf(v5, 1.0);
  }
  id v6 = objc_loadWeakRetained(v2);
  id v7 = *(int8x8_t **)([v6 mapEngine] + 1120);
  int8x8_t v8 = v7[2];
  if (!*(void *)&v8) {
    goto LABEL_22;
  }
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v10 = 0xAF46DE79C836B0D8;
    if (*(void *)&v8 <= 0xAF46DE79C836B0D8) {
      unint64_t v10 = 0xAF46DE79C836B0D8 % *(void *)&v8;
    }
  }
  else
  {
    unint64_t v10 = (*(void *)&v8 - 1) & 0xAF46DE79C836B0D8;
  }
  id v11 = *(void **)(*(void *)&v7[1] + 8 * v10);
  if (!v11 || (float v12 = (void *)*v11) == 0)
  {
LABEL_22:

    float v5 = 1.0;
    return fmaxf(v5, 1.0);
  }
  if (v9.u32[0] < 2uLL)
  {
    uint64_t v13 = *(void *)&v8 - 1;
    while (1)
    {
      uint64_t v15 = v12[1];
      if (v15 == 0xAF46DE79C836B0D8)
      {
        if (v12[2] == 0xAF46DE79C836B0D8) {
          goto LABEL_24;
        }
      }
      else if ((v15 & v13) != v10)
      {
        goto LABEL_22;
      }
      float v12 = (void *)*v12;
      if (!v12) {
        goto LABEL_22;
      }
    }
  }
  while (1)
  {
    unint64_t v14 = v12[1];
    if (v14 == 0xAF46DE79C836B0D8) {
      break;
    }
    if (v14 >= *(void *)&v8) {
      v14 %= *(void *)&v8;
    }
    if (v14 != v10) {
      goto LABEL_22;
    }
LABEL_12:
    float v12 = (void *)*v12;
    if (!v12) {
      goto LABEL_22;
    }
  }
  if (v12[2] != 0xAF46DE79C836B0D8) {
    goto LABEL_12;
  }
LABEL_24:
  uint64_t v17 = v12[5];

  float v5 = 1.0;
  if (v17) {
    float v5 = (float)*(unsigned int *)(v17 + 312);
  }
  return fmaxf(v5, 1.0);
}

- (float)maximumNormalizedZoomLevel
{
  uint64_t v2 = (id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  uint64_t v4 = *(void *)([WeakRetained mapEngine] + 1192);

  if (!v4) {
    return 20.0;
  }
  id v5 = objc_loadWeakRetained(v2);
  float v6 = (float)*(unsigned int *)(*(void *)([v5 mapEngine] + 1192) + 52);

  return v6;
}

- (int64_t)tileSize
{
  uint64_t v2 = (id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(v2);
    if (![v5 mapEngine])
    {

      int64_t v8 = 256;
      goto LABEL_7;
    }
    id v6 = objc_loadWeakRetained(v2);
    uint64_t v7 = *(void *)([v6 mapEngine] + 896);

    if (v7)
    {
      id v4 = objc_loadWeakRetained(v2);
      int64_t v8 = *(void *)(*(void *)([v4 mapEngine] + 896) + 312);
LABEL_7:

      return v8;
    }
  }
  return 256;
}

- (void)_updateCameraLimits
{
  [(VKCameraController *)self camera];
  if (v78[1] && !atomic_fetch_add((atomic_ullong *volatile)v78[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v78[1] + 16))(v78[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v78[1]);
    if (!v78[0]) {
      return;
    }
  }
  else if (!v78[0])
  {
    return;
  }
  [(VKCameraController *)self camera];
  double v93 = *((double *)v78[0] + 9);
  if (v78[1] && !atomic_fetch_add((atomic_ullong *volatile)v78[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v78[1] + 16))(v78[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v78[1]);
  }
  [(VKCameraController *)self camera];
  float v4 = gdc::DisplayZoomLevel::centerZoomLevel(v78[0], v3);
  if (v78[1] && !atomic_fetch_add((atomic_ullong *volatile)v78[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v78[1] + 16))(v78[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v78[1]);
  }
  uint64_t v5 = [(VKNavCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  double v6 = *((double *)v78[0] + 46);
  float v7 = 0.0;
  if (v6 > 0.0)
  {
    float v8 = v6;
    float v9 = (float)v5;
    float v7 = log2f(v8 / v9);
  }
  if (v78[1] && !atomic_fetch_add((atomic_ullong *volatile)v78[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v78[1] + 16))(v78[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v78[1]);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  double v11 = fminf(fmaxf(v4 + v7, 1.0), 25.0);
  float v12 = pitchForZ((void *)(*(void *)([WeakRetained mapEngine] + 1192) + 384), v11);

  id v13 = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  float v14 = pitchForZ((void *)(*(void *)([v13 mapEngine] + 1192) + 408), v11);

  [(VKCameraController *)self camera];
  double v15 = *((double *)v78[0] + 9);
  if (v78[1] && !atomic_fetch_add((atomic_ullong *volatile)v78[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v78[1] + 16))(v78[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v78[1]);
  }
  double v93 = v14;
  if (v15 > v12 != v14 > v12)
  {
    uint64_t v16 = [(VKCameraController *)self cameraDelegate];
    [v16 mapLayerCanEnter3DModeDidChange:v14 > v12];
  }
  [(VKNavCameraController *)self minimumNormalizedZoomLevel];
  float v18 = v17;
  uint64_t v19 = [(VKNavCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  double v20 = *((double *)v78[0] + 46);
  float v21 = 0.0;
  if (v20 > 0.0) {
    float v21 = log2((double)v19 / v20);
  }
  if (v78[1] && !atomic_fetch_add((atomic_ullong *volatile)v78[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v78[1] + 16))(v78[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v78[1]);
  }
  [(VKNavCameraController *)self maximumNormalizedZoomLevel];
  float v23 = v22;
  uint64_t v24 = [(VKNavCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  double v25 = *((double *)v78[0] + 46);
  float v26 = 0.0;
  if (v25 > 0.0) {
    float v26 = log2((double)v24 / v25);
  }
  if (v78[1] && !atomic_fetch_add((atomic_ullong *volatile)v78[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v78[1] + 16))(v78[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v78[1]);
  }
  v89[0] = 0;
  char v91 = 0;
  float v27 = [(VKCameraController *)self vkCamera];
  double v28 = v27;
  if (v27)
  {
    [v27 minDistanceToGroundRestriction];
    if (LOBYTE(v78[0]))
    {
      v89[0] = 1;
      BOOL v90 = v78[1];
      LOBYTE(v78[0]) = 0;
    }
  }
  else
  {
    v78[0] = 0;
    v78[1] = 0;
  }

  double v29 = [(VKCameraController *)self vkCamera];
  float v30 = v29;
  if (v29)
  {
    [v29 maxDistanceToGroundRestriction];
    if (LOBYTE(v78[0]))
    {
      char v91 = 1;
      float v92 = v78[1];
      LOBYTE(v78[0]) = 0;
    }
  }
  else
  {
    v78[0] = 0;
    v78[1] = 0;
  }

  uint64_t v31 = [(VKNavCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  float v32 = fminf(fmaxf(fminf(fmaxf(v18, 1.0), 25.0) + v21, 1.0), 25.0);
  double v33 = *((double *)v78[0] + 46);
  double v87 = (double)v31;
  double v88 = v33;
  float v34 = 0.0;
  if (v33 > 0.0)
  {
    float v35 = v33;
    float v36 = (float)v31;
    float v34 = log2f(v35 / v36);
  }
  float v86 = fminf(fmaxf(v32 + v34, 1.0), 25.0);
  if (v78[1] && !atomic_fetch_add((atomic_ullong *volatile)v78[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v78[1] + 16))(v78[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v78[1]);
  }
  uint64_t v37 = [(VKNavCameraController *)self tileSize];
  [(VKCameraController *)self camera];
  float v38 = fminf(fmaxf(fminf(fmaxf(v23, 1.0), 25.0) + v26, 1.0), 25.0);
  double v39 = *((double *)v78[0] + 46);
  double v84 = (double)v37;
  double v85 = v39;
  float v40 = 0.0;
  if (v39 > 0.0)
  {
    float v41 = v39;
    float v42 = (float)v37;
    float v40 = log2f(v41 / v42);
  }
  float v83 = fminf(fmaxf(v38 + v40, 1.0), 25.0);
  if (v78[1] && !atomic_fetch_add((atomic_ullong *volatile)v78[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(void *)v78[1] + 16))(v78[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v78[1]);
  }
  [(VKCameraController *)self camera];
  uint64_t v43 = v76;
  [(VKCameraController *)self camera];
  double v45 = v73[46];
  double v44 = v73[47];
  if (v44 >= v45)
  {
    double v51 = v73[57];
  }
  else
  {
    double v46 = v44 * v45;
    double v47 = v44 / v45;
    if (v46 <= 0.0) {
      double v48 = 1.0;
    }
    else {
      double v48 = v47;
    }
    long double v49 = tan(v73[57] * 0.5);
    long double v50 = atan(v48 * v49);
    double v51 = v50 + v50;
  }
  double v75 = v51;
  [(VKCameraController *)self camera];
  double v52 = v70[46];
  double v53 = v70[47];
  if (v52 >= v53)
  {
    double v59 = v70[57];
  }
  else
  {
    double v54 = v53 * v52;
    double v55 = v52 / v53;
    if (v54 <= 0.0) {
      double v56 = 1.0;
    }
    else {
      double v56 = v55;
    }
    long double v57 = tan(v70[57] * 0.5);
    long double v58 = atan(v56 * v57);
    double v59 = v58 + v58;
  }
  double v72 = v59;
  [(VKCameraController *)self camera];
  v68[0] = 0.0;
  gdc::CameraLimits::CameraLimits((uint64_t)v78, (double *)(v43 + 8), &v75, &v72, (long double *)(*(void *)&v68[1] + 40), &v93, v68, (uint64_t)&v86, v93, (uint64_t)&v83, (uint64_t)v89);
  BOOL v60 = v69;
  if (v69 && !atomic_fetch_add(&v69->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
    std::__shared_weak_count::__release_weak(v60);
  }
  unsigned int v61 = v71;
  if (v71 && !atomic_fetch_add(&v71->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
    std::__shared_weak_count::__release_weak(v61);
  }
  float v62 = v74;
  if (v74 && !atomic_fetch_add(&v74->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
    std::__shared_weak_count::__release_weak(v62);
  }
  char v63 = v77;
  if (v77 && !atomic_fetch_add(&v77->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
    std::__shared_weak_count::__release_weak(v63);
  }
  [(VKCameraController *)self camera];
  long long v64 = v81;
  uint64_t v65 = v76;
  char v66 = v77;
  *(_OWORD *)(v76 + 96) = v80;
  *(_OWORD *)(v65 + 112) = v64;
  *(void *)(v65 + 128) = v82;
  long long v67 = v79;
  *(_OWORD *)(v65 + 64) = *(_OWORD *)v78;
  *(_OWORD *)(v65 + 80) = v67;
  if (v66)
  {
    if (!atomic_fetch_add(&v66->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
      std::__shared_weak_count::__release_weak(v66);
    }
  }
}

- (void)pitchTo:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(VKAnimation *)self->_snapPitchAnimation stop];
  snapPitchAnimation = self->_snapPitchAnimation;
  self->_snapPitchAnimation = 0;

  if (v4)
  {
    float v8 = [[VKTimedAnimation alloc] initWithDuration:0.3];
    float v9 = self->_snapPitchAnimation;
    self->_snapPitchAnimation = v8;

    [(VKTimedAnimation *)self->_snapPitchAnimation setTimingFunction:VKAnimationCurveEaseInOut];
    objc_initWeak(&location, self);
    [(VKCameraController *)self camera];
    unint64_t v10 = *(void **)(v16 + 40);
    if (v17)
    {
      if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__VKNavCameraController_pitchTo_animated___block_invoke;
    v14[3] = &unk_1E5A98570;
    objc_copyWeak(v15, &location);
    v15[1] = v10;
    v15[2] = *(id *)&a3;
    [(VKTimedAnimation *)self->_snapPitchAnimation setStepHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __42__VKNavCameraController_pitchTo_animated___block_invoke_2;
    v12[3] = &unk_1E5A96C78;
    objc_copyWeak(&v13, &location);
    [(VKAnimation *)self->_snapPitchAnimation setCompletionHandler:v12];
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->_snapPitchAnimation->super);
    objc_destroyWeak(&v13);
    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
  else
  {
    [(VKCameraController *)self camera];
    double v11 = v17;
    *(double *)(v16 + 40) = a3;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

void __42__VKNavCameraController_pitchTo_animated___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    double v6 = *(double *)(a1 + 40);
    double v7 = *(double *)(a1 + 48);
    [WeakRetained camera];
    *(double *)(v8 + 40) = v6 + (v7 - v6) * a2;
    if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v9->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v9);
    }
    [v5 _setNeedsUpdate];
  }
}

void __42__VKNavCameraController_pitchTo_animated___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    BOOL v4 = (void *)WeakRetained[75];
    WeakRetained[75] = 0;
    uint64_t v5 = WeakRetained;

    id WeakRetained = v5;
  }
}

- (void)rotateTo:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(VKAnimation *)self->_snapHeadingAnimation stop];
  snapHeadingAnimation = self->_snapHeadingAnimation;
  self->_snapHeadingAnimation = 0;

  if (v4)
  {
    uint64_t v8 = [[VKTimedAnimation alloc] initWithDuration:0.3];
    float v9 = self->_snapHeadingAnimation;
    self->_snapHeadingAnimation = v8;

    [(VKTimedAnimation *)self->_snapHeadingAnimation setTimingFunction:VKAnimationCurveEaseInOut];
    double value = self->_cameraFrame._heading._value;
    objc_initWeak(v12, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __43__VKNavCameraController_rotateTo_animated___block_invoke;
    id v15[3] = &unk_1E5A98570;
    objc_copyWeak(v16, v12);
    v16[1] = *(id *)&value;
    v16[2] = *(id *)&a3;
    [(VKTimedAnimation *)self->_snapHeadingAnimation setStepHandler:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__VKNavCameraController_rotateTo_animated___block_invoke_2;
    v13[3] = &unk_1E5A96C78;
    objc_copyWeak(&v14, v12);
    [(VKAnimation *)self->_snapHeadingAnimation setCompletionHandler:v13];
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->_snapHeadingAnimation->super);
    objc_destroyWeak(&v14);
    objc_destroyWeak(v16);
    objc_destroyWeak(v12);
  }
  else
  {
    [(VKCameraController *)self camera];
    double v11 = (std::__shared_weak_count *)v12[1];
    *((double *)v12[0] + 6) = a3;
    if (v11)
    {
      if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
}

void __43__VKNavCameraController_rotateTo_animated___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    double v7 = *(double *)(a1 + 40);
    double v6 = *(double *)(a1 + 48);
    [WeakRetained camera];
    long double v8 = fmod(3.14159265 - v7 + v6, 6.28318531);
    long double v9 = fmod(v8 + 6.28318531, 6.28318531);
    long double v10 = fmod(v7 + (v9 + -3.14159265) * a2, 6.28318531);
    *(long double *)(v11 + 48) = fmod(v10 + 6.28318531, 6.28318531);
    if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
    [v5 _setNeedsUpdate];
  }
}

void __43__VKNavCameraController_rotateTo_animated___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    BOOL v4 = (void *)WeakRetained[76];
    WeakRetained[76] = 0;
    uint64_t v5 = WeakRetained;

    id WeakRetained = v5;
  }
}

- (BOOL)snapMapIfNecessary:(BOOL)a3
{
  if (self->_isDetached)
  {
    BOOL v3 = a3;
    [(VKCameraController *)self camera];
    if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
    if (*(double *)&v13 != 0.0)
    {
      [(VKCameraController *)self camera];
      double v5 = v13[5];
      if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)())v14->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v14);
      }
      [(VKNavCameraController *)self maxCameraPitch];
      [(VKNavCameraController *)self minCameraPitch];
      if (v5 < *(double *)&v13 && v5 > 0.0001 || (double v6 = *(double *)&v13, v5 > *(double *)&v13)) {
        -[VKNavCameraController pitchTo:animated:](self, "pitchTo:animated:", v3);
      }
      [(VKCameraController *)self camera];
      double v7 = fabs(v13[1]);
      if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)())v14->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v14);
      }
      if (v7 < 1.30899694)
      {
        [(VKCameraController *)self camera];
        double v8 = fabs(v13[6]);
        BOOL v9 = v8 < 2.22507386e-308 || v8 <= v8 * 2.22044605e-14;
        if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)())v14->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v14);
        }
        [(VKNavCameraController *)self currentZoomLevel];
        char v11 = v10 > 6.0 || v9;
        if ((v11 & 1) == 0) {
          [(VKNavCameraController *)self rotateTo:v3 animated:0.0];
        }
      }
    }
  }
  return 0;
}

- (BOOL)usesVKCamera
{
  return 0;
}

- (float)_currentRoadSignOffset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  uint64_t v3 = [WeakRetained mapEngine];

  if (!v3) {
    return 0.0;
  }
  BOOL v4 = *(int8x8_t **)(v3 + 1120);
  if (!v4) {
    return 0.0;
  }
  int8x8_t v5 = v4[2];
  if (!*(void *)&v5) {
    return 0.0;
  }
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v5);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    uint64_t v7 = 0x20A1ED17D78F322BLL;
    if (*(void *)&v5 <= 0x20A1ED17D78F322BuLL) {
      uint64_t v7 = 0x20A1ED17D78F322BuLL % *(void *)&v5;
    }
  }
  else
  {
    uint64_t v7 = (*(void *)&v5 - 1) & 0x20A1ED17D78F322BLL;
  }
  double v8 = *(void **)(*(void *)&v4[1] + 8 * v7);
  if (!v8) {
    return 0.0;
  }
  BOOL v9 = (void *)*v8;
  if (!v9) {
    return 0.0;
  }
  if (v6.u32[0] < 2uLL)
  {
    uint64_t v10 = *(void *)&v5 - 1;
    while (1)
    {
      uint64_t v12 = v9[1];
      if (v12 == 0x20A1ED17D78F322BLL)
      {
        if (v9[2] == 0x20A1ED17D78F322BLL) {
          goto LABEL_24;
        }
      }
      else if ((v12 & v10) != v7)
      {
        return 0.0;
      }
      BOOL v9 = (void *)*v9;
      if (!v9) {
        return 0.0;
      }
    }
  }
  while (1)
  {
    unint64_t v11 = v9[1];
    if (v11 == 0x20A1ED17D78F322BLL) {
      break;
    }
    if (v11 >= *(void *)&v5) {
      v11 %= *(void *)&v5;
    }
    if (v11 != v7) {
      return 0.0;
    }
LABEL_13:
    BOOL v9 = (void *)*v9;
    if (!v9) {
      return 0.0;
    }
  }
  if (v9[2] != 0x20A1ED17D78F322BLL) {
    goto LABEL_13;
  }
LABEL_24:
  uint64_t v13 = v9[5];
  if (!v13) {
    return 0.0;
  }
  id v14 = *(void (**)(void))(**(void **)(*(void *)(*(void *)(*(void *)(*(void *)(v13 + 144) + 8) + 24)
                                                   + 168)
                                       + 32)
                         + 40);
  v14();
  return result;
}

- (void)_setNavCameraTransitionComplete:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  uint64_t v5 = [WeakRetained mapEngine];

  if (v5)
  {
    uint8x8_t v6 = *(int8x8_t **)(v5 + 1120);
    if (v6)
    {
      int8x8_t v7 = v6[2];
      if (v7)
      {
        uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
        v8.i16[0] = vaddlv_u8(v8);
        if (v8.u32[0] > 1uLL)
        {
          uint64_t v9 = 0x2FED70A4459DFCA1;
          if (*(void *)&v7 <= 0x2FED70A4459DFCA1uLL) {
            uint64_t v9 = 0x2FED70A4459DFCA1uLL % *(void *)&v7;
          }
        }
        else
        {
          uint64_t v9 = (*(void *)&v7 - 1) & 0x2FED70A4459DFCA1;
        }
        uint64_t v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
        if (v10)
        {
          unint64_t v11 = (void *)*v10;
          if (v11)
          {
            if (v8.u32[0] < 2uLL)
            {
              uint64_t v12 = *(void *)&v7 - 1;
              while (1)
              {
                uint64_t v14 = v11[1];
                if (v14 == 0x2FED70A4459DFCA1)
                {
                  if (v11[2] == 0x2FED70A4459DFCA1) {
                    goto LABEL_24;
                  }
                }
                else if ((v14 & v12) != v9)
                {
                  return;
                }
                unint64_t v11 = (void *)*v11;
                if (!v11) {
                  return;
                }
              }
            }
            do
            {
              unint64_t v13 = v11[1];
              if (v13 == 0x2FED70A4459DFCA1)
              {
                if (v11[2] == 0x2FED70A4459DFCA1)
                {
LABEL_24:
                  uint64_t v15 = v11[5];
                  if (v15) {
                    *(unsigned char *)(v15 + 1113) = a3;
                  }
                  return;
                }
              }
              else
              {
                if (v13 >= *(void *)&v7) {
                  v13 %= *(void *)&v7;
                }
                if (v13 != v9) {
                  return;
                }
              }
              unint64_t v11 = (void *)*v11;
            }
            while (v11);
          }
        }
      }
    }
  }
}

- (void)_setNavCameraIsDetached:(BOOL)a3
{
  unsigned int v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  uint64_t v5 = [WeakRetained mapEngine];

  if (!v5) {
    return;
  }
  uint8x8_t v6 = *(int8x8_t **)(v5 + 1120);
  if (!v6) {
    return;
  }
  int8x8_t v7 = v6[2];
  if (!*(void *)&v7) {
    return;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  unint64_t v9 = v8.u32[0];
  if (v8.u32[0] > 1uLL)
  {
    unint64_t v10 = 0xBEC1A12372CEEC00;
    if (*(void *)&v7 <= 0xBEC1A12372CEEC00) {
      unint64_t v10 = 0xBEC1A12372CEEC00 % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v10 = (*(void *)&v7 - 1) & 0xBEC1A12372CEEC00;
  }
  unint64_t v11 = *(void **)(*(void *)&v6[1] + 8 * v10);
  if (!v11) {
    goto LABEL_30;
  }
  uint64_t v12 = (void *)*v11;
  if (!v12) {
    goto LABEL_30;
  }
  if (v8.u32[0] < 2uLL)
  {
    while (1)
    {
      uint64_t v14 = v12[1];
      if (v14 == 0xBEC1A12372CEEC00)
      {
        if (v12[2] == 0xBEC1A12372CEEC00) {
          goto LABEL_24;
        }
      }
      else if ((v14 & (*(void *)&v7 - 1)) != v10)
      {
        goto LABEL_28;
      }
      uint64_t v12 = (void *)*v12;
      if (!v12) {
        goto LABEL_28;
      }
    }
  }
  while (1)
  {
    unint64_t v13 = v12[1];
    if (v13 == 0xBEC1A12372CEEC00) {
      break;
    }
    if (v13 >= *(void *)&v7) {
      v13 %= *(void *)&v7;
    }
    if (v13 != v10) {
      goto LABEL_28;
    }
LABEL_13:
    uint64_t v12 = (void *)*v12;
    if (!v12) {
      goto LABEL_28;
    }
  }
  if (v12[2] != 0xBEC1A12372CEEC00) {
    goto LABEL_13;
  }
LABEL_24:
  uint64_t v15 = v12[5];
  if (v15)
  {
    if (*(unsigned __int8 *)(v15 + 240) != (v3 ^ 1))
    {
      std::__hash_table<md::NavigationLogicEvent,std::hash<md::NavigationLogicEvent>,std::equal_to<md::NavigationLogicEvent>,std::allocator<md::NavigationLogicEvent>>::__emplace_unique_key_args<md::NavigationLogicEvent,md::NavigationLogicEvent const&>(v15 + 248, 0, 0);
      int8x8_t v7 = v6[2];
    }
    *(unsigned char *)(v15 + 240) = v3 ^ 1;
  }
LABEL_28:
  if (!*(void *)&v7) {
    return;
  }
  uint8x8_t v16 = (uint8x8_t)vcnt_s8(v7);
  v16.i16[0] = vaddlv_u8(v16);
  unint64_t v9 = v16.u32[0];
LABEL_30:
  if (v9 > 1)
  {
    uint64_t v17 = 0x2FED70A4459DFCA1;
    if (*(void *)&v7 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v17 = 0x2FED70A4459DFCA1uLL % *(void *)&v7;
    }
  }
  else
  {
    uint64_t v17 = (*(void *)&v7 - 1) & 0x2FED70A4459DFCA1;
  }
  int8x8_t v18 = v6[1];
  uint64_t v19 = *(void **)(*(void *)&v18 + 8 * v17);
  if (!v19) {
    return;
  }
  double v20 = (void *)*v19;
  if (!*v19) {
    return;
  }
  uint64_t v21 = *(void *)&v7 - 1;
  if (v9 < 2)
  {
    while (1)
    {
      uint64_t v22 = v20[1];
      if (v22 == 0x2FED70A4459DFCA1)
      {
        if (v20[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_50;
        }
      }
      else if ((v22 & v21) != v17)
      {
        return;
      }
      double v20 = (void *)*v20;
      if (!v20) {
        return;
      }
    }
  }
  while (2)
  {
    unint64_t v23 = v20[1];
    if (v23 != 0x2FED70A4459DFCA1)
    {
      if (v23 >= *(void *)&v7) {
        v23 %= *(void *)&v7;
      }
      if (v23 != v17) {
        return;
      }
      goto LABEL_44;
    }
    if (v20[2] != 0x2FED70A4459DFCA1)
    {
LABEL_44:
      double v20 = (void *)*v20;
      if (!v20) {
        return;
      }
      continue;
    }
    break;
  }
LABEL_50:
  uint64_t v24 = v20[5];
  if (v24)
  {
    if (v9 > 1)
    {
      uint64_t v25 = 0x20A1ED17D78F322BLL;
      if (*(void *)&v7 <= 0x20A1ED17D78F322BuLL) {
        uint64_t v25 = 0x20A1ED17D78F322BuLL % *(void *)&v7;
      }
    }
    else
    {
      uint64_t v25 = v21 & 0x20A1ED17D78F322BLL;
    }
    float v26 = *(void **)(*(void *)&v18 + 8 * v25);
    if (v26)
    {
      float v27 = (void *)*v26;
      if (v27)
      {
        if (v9 < 2)
        {
          while (1)
          {
            uint64_t v28 = v27[1];
            if (v28 == 0x20A1ED17D78F322BLL)
            {
              if (v27[2] == 0x20A1ED17D78F322BLL) {
                goto LABEL_71;
              }
            }
            else if ((v28 & v21) != v25)
            {
              return;
            }
            float v27 = (void *)*v27;
            if (!v27) {
              return;
            }
          }
        }
        do
        {
          unint64_t v29 = v27[1];
          if (v29 == 0x20A1ED17D78F322BLL)
          {
            if (v27[2] == 0x20A1ED17D78F322BLL)
            {
LABEL_71:
              uint64_t v30 = v27[5];
              if (v30)
              {
                *(unsigned char *)(v24 + 1112) = v3;
                md::LabelSettings_Navigation::setDetachedCamera(*(md::LabelSettings_Navigation **)(*(void *)(*(void *)(v30 + 144) + 8) + 24), v3);
                uint64_t v31 = *(void *)(v5 + 1128);
                char v32 = 38;
                md::MapEngineSettings::set(v31, &v32, (void *)v3);
              }
              return;
            }
          }
          else
          {
            if (v29 >= *(void *)&v7) {
              v29 %= *(void *)&v7;
            }
            if (v29 != v25) {
              return;
            }
          }
          float v27 = (void *)*v27;
        }
        while (v27);
      }
    }
  }
}

- (unsigned)cameraHeadingType
{
  return self->_headingType;
}

- (void)canvasDidLayout
{
  [(VKNavCameraController *)self updateCameraState];
  [(VKNavCameraController *)self resetSpringsToResting];
  [(VKNavCameraController *)self _setNeedsUpdate];
  if (!self->_isDetached)
  {
    LODWORD(v3) = 2.0;
    [(VKNavCameraController *)self animateCameraWithDuration:&self->_cameraFrame fromFrame:0 completionHandler:v3];
  }
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  ptr = a3.__ptr_;
  uint64_t v5 = *(void *)a3.__ptr_;
  if (!*(void *)a3.__ptr_)
  {
    [(VKNavCameraController *)self stopAnimations];
    uint64_t v5 = *(void *)ptr;
  }
  uint8x8_t v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
  uint64_t v9 = v5;
  unint64_t v10 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v8.receiver = self;
  v8.super_class = (Class)VKNavCameraController;
  -[VKCameraController setCamera:](&v8, sel_setCamera_, &v9, a3.__cntrl_);
  int8x8_t v7 = v10;
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  [(VKNavCameraController *)self _setNeedsUpdate];
}

- (void)setVkCamera:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [(VKNavCameraController *)self stopAnimations];
  }
  v5.receiver = self;
  v5.super_class = (Class)VKNavCameraController;
  [(VKCameraController *)&v5 setVkCamera:v4];
  if (v4) {
    [(VKNavCameraController *)self _setNeedsUpdate];
  }
}

- (void)stopAnimations
{
  [(VKAnimation *)self->_snapPitchAnimation stop];
  snapPitchAnimation = self->_snapPitchAnimation;
  self->_snapPitchAnimation = 0;

  [(VKAnimation *)self->_transitionAnimation stop];
  transitionAnimation = self->_transitionAnimation;
  self->_transitionAnimation = 0;

  [(VKAnimation *)self->_snapHeadingAnimation stop];
  snapHeadingAnimation = self->_snapHeadingAnimation;
  self->_snapHeadingAnimation = 0;
}

- (void)setCameraFrame:()CameraFrame<geo:(double> *)a3 :Radians
{
  long long v4 = *(_OWORD *)&a3->_target.altitude._value;
  long long v3 = *(_OWORD *)&a3->_pitch._value;
  long long v5 = *(_OWORD *)&a3->_target.latitude._value;
  self->_cameraFrame._roll._double value = a3->_roll._value;
  *(_OWORD *)&self->_cameraFrame._target.altitude._double value = v4;
  *(_OWORD *)&self->_cameraFrame._pitch._double value = v3;
  *(_OWORD *)&self->_cameraFrame._target.latitude._double value = v5;
  [(VKNavCameraController *)self _setNeedsUpdate];
}

- (CameraFrame<geo::Radians,)cameraFrame
{
  long long v3 = *(_OWORD *)&self[4]._heading._value;
  *(_OWORD *)&retstr->_target.latitude._double value = *(_OWORD *)&self[4]._distanceFromTarget._value;
  *(_OWORD *)&retstr->_target.altitude._double value = v3;
  *(_OWORD *)&retstr->_pitch._double value = *(_OWORD *)&self[5]._target.latitude._value;
  retstr->_roll._double value = self[5]._target.altitude._value;
  return self;
}

- (void)_snapHeading
{
  if (!self->_snapHeadingAnimation
    && ![(VKAnimation *)self->_transitionAnimation running]
    && !self->_isDetached
    && ![(VKNavCameraController *)self cameraHeadingType])
  {
    double v3 = fabs(self->_cameraFrame._heading._value);
    if (v3 > v3 * 2.22044605e-14 && v3 >= 2.22507386e-308)
    {
      [(VKAnimation *)self->_snapHeadingAnimation stop];
      snapHeadingAnimation = self->_snapHeadingAnimation;
      self->_snapHeadingAnimation = 0;

      uint8x8_t v6 = [[VKTimedAnimation alloc] initWithDuration:0.3];
      int8x8_t v7 = self->_snapHeadingAnimation;
      self->_snapHeadingAnimation = v6;

      [(VKTimedAnimation *)self->_snapHeadingAnimation setTimingFunction:VKAnimationCurveEaseInOut];
      objc_initWeak(&location, self);
      double value = self->_cameraFrame._heading._value;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __37__VKNavCameraController__snapHeading__block_invoke;
      v14[3] = &unk_1E5A96CA0;
      objc_copyWeak(v15, &location);
      v15[1] = *(id *)&value;
      [(VKTimedAnimation *)self->_snapHeadingAnimation setStepHandler:v14];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      unint64_t v11 = __37__VKNavCameraController__snapHeading__block_invoke_2;
      uint64_t v12 = &unk_1E5A96C78;
      objc_copyWeak(&v13, &location);
      [(VKAnimation *)self->_snapHeadingAnimation setCompletionHandler:&v9];
      md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->_snapHeadingAnimation->super);
      objc_destroyWeak(&v13);
      objc_destroyWeak(v15);
      objc_destroyWeak(&location);
    }
  }
}

void __37__VKNavCameraController__snapHeading__block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = (long double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v4 = *(double *)(a1 + 40);
    long double v5 = fmod(3.14159265 - v4, 6.28318531);
    long double v6 = fmod(v5 + 6.28318531, 6.28318531);
    long double v7 = fmod(v4 + (v6 + -3.14159265) * a2, 6.28318531);
    long double v8 = fmod(v7 + 6.28318531, 6.28318531);
    WeakRetained[46] = v8;
    WeakRetained[44] = v8;
    WeakRetained[45] = 0.0;
    WeakRetained[36] = v8;
    [WeakRetained _setNeedsUpdate];
  }
}

void __37__VKNavCameraController__snapHeading__block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    double v4 = (void *)WeakRetained[76];
    WeakRetained[76] = 0;
    long double v5 = WeakRetained;

    id WeakRetained = v5;
  }
}

- (void)_snapPitch
{
  if (!self->_snapPitchAnimation && ![(VKAnimation *)self->_transitionAnimation running])
  {
    double minCameraHeight = self->_minCameraHeight;
    double value = self->_cameraFrame._pitch._value;
    double maxCameraHeight = self->_maxCameraHeight;
    if (value < minCameraHeight || (double minCameraHeight = self->_cameraFrame._pitch._value, value > maxCameraHeight))
    {
      double v6 = fmin(minCameraHeight, maxCameraHeight);
      [(VKAnimation *)self->_snapPitchAnimation stop];
      snapPitchAnimation = self->_snapPitchAnimation;
      self->_snapPitchAnimation = 0;

      long double v8 = [[VKTimedAnimation alloc] initWithDuration:0.3];
      uint64_t v9 = self->_snapPitchAnimation;
      self->_snapPitchAnimation = v8;

      [(VKTimedAnimation *)self->_snapPitchAnimation setTimingFunction:VKAnimationCurveEaseInOut];
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      id v12[2] = __35__VKNavCameraController__snapPitch__block_invoke;
      v12[3] = &unk_1E5A98570;
      objc_copyWeak(v13, &location);
      v13[1] = *(id *)&value;
      v13[2] = *(id *)&v6;
      [(VKTimedAnimation *)self->_snapPitchAnimation setStepHandler:v12];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __35__VKNavCameraController__snapPitch__block_invoke_2;
      v10[3] = &unk_1E5A96C78;
      objc_copyWeak(&v11, &location);
      [(VKAnimation *)self->_snapPitchAnimation setCompletionHandler:v10];
      md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->_snapPitchAnimation->super);
      objc_destroyWeak(&v11);
      objc_destroyWeak(v13);
      objc_destroyWeak(&location);
    }
  }
}

void __35__VKNavCameraController__snapPitch__block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v4 = *(double *)(a1 + 40) + (*(double *)(a1 + 48) - *(double *)(a1 + 40)) * a2;
    WeakRetained[41] = v4;
    WeakRetained[39] = v4;
    WeakRetained[40] = 0.0;
    WeakRetained[35] = v4;
    [WeakRetained _setNeedsUpdate];
  }
}

void __35__VKNavCameraController__snapPitch__block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    double v4 = (void *)WeakRetained[75];
    WeakRetained[75] = 0;
    long double v5 = WeakRetained;

    id WeakRetained = v5;
  }
}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  float right = a3.right;
  float bottom = a3.bottom;
  float left = a3.left;
  float top = a3.top;
  VKEdgeInsets v14 = a3;
  [(VKCameraController *)self edgeInsets];
  LODWORD(self->_minCameraPitch._value) = LODWORD(v8);
  HIDWORD(self->_minCameraPitch._value) = LODWORD(v9);
  LODWORD(self->_maxCameraPitch._value) = LODWORD(v10);
  HIDWORD(self->_maxCameraPitch._value) = LODWORD(v11);
  if (*(void *)&self->_minCameraPitch._value != *(void *)&v14.top
    || *(void *)&self->_maxCameraPitch._value != *(void *)&v14.bottom)
  {
    v13.receiver = self;
    v13.super_class = (Class)VKNavCameraController;
    *(float *)&double v8 = top;
    *(float *)&double v9 = left;
    *(float *)&double v10 = bottom;
    *(float *)&double v11 = right;
    -[VKCameraController setEdgeInsets:](&v13, sel_setEdgeInsets_, v8, v9, v10, v11);
    [(VKNavCameraController *)self _setNeedsUpdate];
  }
}

- (void)setEdgeInsetsAnimating:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    long double v5 = [(VKCameraController *)self runLoopController];
    uint64_t v6 = [(VKCameraController *)self maxDisplayRate];
    v5->var1 = v6;
    uint64_t var0 = (uint64_t)v5->var0;
    if (v5->var0 && !**(unsigned char **)(var0 + 1056)) {
      md::MapEngine::setDisplayRate(var0, v6);
    }
    [(VKNavCameraController *)self _setNeedsUpdate];
  }
  [(VKCameraController *)self edgeInsets];
  LODWORD(self->_minCameraPitch._value) = v8;
  HIDWORD(self->_minCameraPitch._value) = v9;
  LODWORD(self->_maxCameraPitch._value) = v10;
  HIDWORD(self->_maxCameraPitch._value) = v11;
  v12.receiver = self;
  v12.super_class = (Class)VKNavCameraController;
  [(VKCameraController *)&v12 setEdgeInsetsAnimating:v3];
}

- (Unit<geo::RadianUnitDescription,)maxCameraPitch
{
  v3._double value = self->_maxCameraHeight;
  void *v2 = *(Unit<geo::RadianUnitDescription, double> *)&v3._value;
  return v3;
}

- (Unit<geo::RadianUnitDescription,)minCameraPitch
{
  v3._double value = self->_minCameraHeight;
  void *v2 = *(Unit<geo::RadianUnitDescription, double> *)&v3._value;
  return v3;
}

- (double)maxZoomHeight
{
  [(VKCameraController *)self camera];
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v6->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v6);
    if (v5) {
      goto LABEL_4;
    }
    return *(double *)&self->_styleManeuversToFrame;
  }
  if (!v5) {
    return *(double *)&self->_styleManeuversToFrame;
  }
LABEL_4:
  [(VKCameraController *)self camera];
  double v3 = *(double *)(v5 + 104);
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v6->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v6);
  }
  return v3;
}

- (double)minZoomHeight
{
  [(VKCameraController *)self camera];
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v6->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v6);
    if (v5) {
      goto LABEL_4;
    }
LABEL_8:
    double value = self->_coordinatesToFrame.__end_cap_.__value_;
    return *(double *)&value;
  }
  if (!v5) {
    goto LABEL_8;
  }
LABEL_4:
  [(VKCameraController *)self camera];
  double value = *(void **)(v5 + 96);
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v6->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v6);
  }
  return *(double *)&value;
}

- (double)maxZoomScale
{
  return self->_maxZoomScale;
}

- (double)minZoomScale
{
  return self->_minZoomScale;
}

- (double)zoomScale
{
  return fmin(fmax(*(double *)&self->_lastTargetStyleIdentifier, self->_minZoomScale), self->_maxZoomScale);
}

- (void)_updateDidNavCameraTransition
{
  if (![(VKAnimation *)self->_transitionAnimation running])
  {
    LOBYTE(self->_sceneQuery.__cntrl_) = 0;
    ptr = self->_sceneQuery.__ptr_;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraMode);
    uint64_t v4 = [WeakRetained navCameraMode];

    if (ptr != (void *)v4)
    {
      LOBYTE(self->_sceneQuery.__cntrl_) = 1;
      id v6 = objc_loadWeakRetained((id *)&self->_cameraMode);
      self->_sceneQuery.__ptr_ = (void *)[v6 navCameraMode];
    }
  }
}

- (void)_updateZoomScaleLimts
{
  BOOL v3 = [(VKNavCameraController *)self _canZoomIn];
  BOOL v4 = [(VKNavCameraController *)self _canZoomOut];
  double restingPosition = self->_distanceFromTargetSpring._restingPosition;
  long double v6 = cos(self->_pitchSpring._restingPosition) * restingPosition;
  [(VKNavCameraController *)self minZoomHeight];
  self->_minZoomScale = fmin(v7 / v6, 1.0);
  [(VKNavCameraController *)self maxZoomHeight];
  self->_maxZoomScale = fmax(v8 / v6, 1.0);
  BOOL v9 = [(VKNavCameraController *)self _canZoomIn];
  BOOL v10 = [(VKNavCameraController *)self _canZoomOut];
  if (v3 != v9)
  {
    id v11 = [(VKCameraController *)self cameraDelegate];
    [v11 mapLayerCanZoomInDidChange:v9];
  }
  if (v4 != v10)
  {
    id v12 = [(VKCameraController *)self cameraDelegate];
    [v12 mapLayerCanZoomOutDidChange:v10];
  }
}

- (void)_setNeedsUpdate
{
  self->_needsUpdate = 1;
  uint64_t v2 = *(void *)[(VKCameraController *)self runLoopController];
  if (v2)
  {
    char v3 = 4;
    md::MapEngine::setNeedsTick(v2, &v3);
  }
}

- (void)navContextCameraHeadingOverrideDidChange:(id)a3
{
  if (![(VKAnimation *)self->_transitionAnimation running])
  {
    [(VKNavCameraController *)self _updateDidNavCameraTransition];
    LODWORD(v4) = 1050253722;
    [(VKNavCameraController *)self animateCameraWithDuration:&self->_cameraFrame fromFrame:0 completionHandler:v4];
  }
}

- (void)_updateForAnimatedEdgeInsets
{
  if ([(VKCameraController *)self edgeInsetsAnimating])
  {
    LODWORD(v3) = LODWORD(self->_minCameraPitch._value);
    LODWORD(v4) = HIDWORD(self->_minCameraPitch._value);
    LODWORD(v5) = LODWORD(self->_maxCameraPitch._value);
    LODWORD(v6) = HIDWORD(self->_maxCameraPitch._value);
    -[VKNavCameraController calculateViewableScreenRectForEdgeInsets:](self, "calculateViewableScreenRectForEdgeInsets:", v3, v4, v5, v6);
    p_minHeightDeltaChangeVertical = &self->_minHeightDeltaChangeVertical;
    v8.f64[0] = self->_puckMovementBoundsMin._e[0];
    v10.f64[1] = v9;
    v12.f64[1] = v11;
    v8.f64[1] = 1.0 - self->_puckMovementBoundsMin._e[1];
    float64x2_t v13 = vld1q_dup_f64(p_minHeightDeltaChangeVertical);
    self->_screenPositionSpring._position = (Matrix<double, 2, 1>)vsubq_f64(vaddq_f64((float64x2_t)self->_screenPositionSpring._position, (float64x2_t)self->_screenPositionSpring._restingPosition), vminnmq_f64(vmaxnmq_f64(vmlaq_f64(v12, v8, vsubq_f64(v10, v12)), vaddq_f64(v13, v12)), vsubq_f64(v10, v13)));
  }
}

- (void)updateSpringsForFramingCamera
{
  [(VKNavCameraController *)self updateManeuversToFrame];
  [(VKNavCameraController *)self updatePointsToFrame];
  [(VKNavCameraController *)self _updateRouteSinuosity];
  if (self->_cameraDistanceFromTarget._value == 0.0)
  {
    [(VKNavCameraController *)self cameraFrame];
    self->_cameraDistanceFromTarget._double value = v130;
  }
  self->_pitchSpring._double restingPosition = self->_cameraPitch._value;
  [(VKNavCameraController *)self calculateHeading];
  *(void *)&self->_headingSpring._double restingPosition = v129;
  p_uint64_t var0 = &self->_currentStyleName.__r_.var0;
  if (*(void *)&self->_currentStyleName.__r_.var0 == self->_currentStyleName.var0)
  {
    self->_viewableScreenRect._maximum = (Matrix<double, 2, 1>)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    self->_framingScreenRect._minimum = (Matrix<double, 2, 1>)vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    [(VKNavCameraController *)self puckScreenPoint];
    self->_screenPositionSpring._restingPosition._e[0] = v39;
    self->_screenPositionSpring._restingPosition._e[1] = v40;
    self->_distanceFromTargetSpring._double restingPosition = self->_cameraDistanceFromTarget._value;
LABEL_35:
    [(VKNavCameraController *)self _updateForAnimatedEdgeInsets];
    return;
  }
  [(VKNavCameraController *)self restingCameraFrame];
  gdc::ViewDataAccess::screenPointForCoordinate(*(double **)([(VKCameraController *)self mapDataAccess] + 16), &self->_puckCoordinate.latitude._value, v128);
  double v5 = v4;
  double v127 = v6;
  double v7 = [(VKCameraController *)self mapDataAccess];
  float64x2_t v8 = [(VKCameraController *)self canvas];
  [v8 size];
  int v9 = BYTE2(self->_locationCoordinate.longitude);
  float64x2_t v10 = (float64x2_t *)v7[2];
  gdc::ViewDataAccess::worldViewProjectionMatrix((uint64_t)&v129, v10->f64, v128);
  uint64_t v12 = *(void *)p_var0;
  int64_t v13 = self->_currentStyleName.var0 - *(void *)p_var0;
  double v101 = v5;
  if (v13)
  {
    double v14 = v10[23].f64[1] * v10[23].f64[0];
    double v123 = v132;
    double v125 = v130;
    double v119 = v136;
    double v121 = v134;
    float64x2_t v115 = v131;
    float64x2_t v117 = (float64x2_t)v129;
    double v15 = v133.f64[0];
    float64x2_t v111 = v135;
    float64x2_t v113 = v133;
    unint64_t v16 = v13 / 24;
    if (v16 <= 1) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = v16;
    }
    double v106 = v10[23].f64[1] * v10[23].f64[0];
    if (v9)
    {
      int8x8_t v18 = (double *)(v12 + 16);
      uint64_t v100 = 0x3FC45F306DC9C883;
      __asm { FMOV            V0.2D, #0.5 }
      float64x2_t v103 = _Q0;
      double v24 = v127;
      double v25 = v127;
      double v26 = v5;
      do
      {
        float64x2_t v32 = 0uLL;
        if (v14 != 0.0)
        {
          if (LOBYTE(v10->f64[0]) - 1 < 3)
          {
            double v108 = *(v18 - 1);
            double v27 = *v18;
            __double2 v28 = __sincos_stret(*(v18 - 2));
            double v29 = 6378137.0 / sqrt(v28.__sinval * v28.__sinval * -0.00669437999 + 1.0);
            double v30 = (v29 + v27) * v28.__cosval;
            __double2 v31 = __sincos_stret(v108);
            double v15 = v30 * v31.__cosval;
            v32.f64[0] = v30 * v31.__sinval;
            double v33 = v27 + v29 * 0.99330562;
            double v14 = v106;
            double v11 = v33 * v28.__sinval;
          }
          else if (!LOBYTE(v10->f64[0]))
          {
            double v36 = *(v18 - 1);
            double v37 = *v18;
            long double v38 = tan(*(v18 - 2) * 0.5 + 0.785398163);
            v32.f64[0] = log(v38);
            double v15 = v36 * 0.159154943 + 0.5;
            v32.f64[0] = v32.f64[0] * 0.159154943 + 0.5;
            double v11 = v37 * 0.0000000249532021;
          }
          float64x2_t v34 = vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v111, v117, v15), v115, v32.f64[0]), v113, v11), 0.5 / (v119 + v125 * v15 + v123 * v32.f64[0] + v121 * v11));
          *(void *)&v35.f64[0] = *(_OWORD *)&vaddq_f64(v34, v103);
          v35.f64[1] = vsubq_f64(v103, v34).f64[1];
          float64x2_t v32 = vmulq_f64(v35, v10[23]);
        }
        double v11 = v127;
        double v15 = fmin(v32.f64[1], v127);
        double v26 = fmin(v32.f64[0], v26);
        double v5 = fmax(v5, v32.f64[0]);
        double v24 = fmin(v15, v24);
        double v25 = fmax(v25, v15);
        v18 += 3;
        --v17;
      }
      while (v17);
    }
    else
    {
      double v85 = (double *)(v12 + 16);
      double v86 = 0.5;
      uint64_t v100 = 0x3FC45F306DC9C883;
      __asm { FMOV            V0.2D, #0.5 }
      float64x2_t v105 = _Q0;
      double v24 = v127;
      double v25 = v127;
      double v26 = v5;
      do
      {
        float64x2_t v93 = 0uLL;
        if (v14 != 0.0)
        {
          if (LOBYTE(v10->f64[0]) - 1 < 3)
          {
            double v110 = *(v85 - 1);
            double v88 = *v85;
            __double2 v89 = __sincos_stret(*(v85 - 2));
            double v90 = 6378137.0 / sqrt(v89.__sinval * v89.__sinval * -0.00669437999 + 1.0);
            double v91 = (v90 + v88) * v89.__cosval;
            __double2 v92 = __sincos_stret(v110);
            double v15 = v91 * v92.__cosval;
            v93.f64[0] = v91 * v92.__sinval;
            double v94 = v88 + v90 * 0.99330562;
            double v86 = 0.5;
            double v14 = v106;
            double v11 = v94 * v89.__sinval;
          }
          else if (!LOBYTE(v10->f64[0]))
          {
            double v97 = *(v85 - 1);
            double v98 = *v85;
            long double v99 = tan(*(v85 - 2) * v86 + 0.785398163);
            v93.f64[0] = log(v99);
            double v15 = v86 + v97 * 0.159154943;
            v93.f64[0] = v86 + v93.f64[0] * 0.159154943;
            double v11 = v98 * 0.0000000249532021;
          }
          float64x2_t v95 = vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v111, v117, v15), v115, v93.f64[0]), v113, v11), v86 / (v119 + v125 * v15 + v123 * v93.f64[0] + v121 * v11));
          double v11 = v105.f64[0];
          *(void *)&v96.f64[0] = *(_OWORD *)&vaddq_f64(v95, v105);
          v96.f64[1] = vsubq_f64(v105, v95).f64[1];
          float64x2_t v93 = vmulq_f64(v96, v10[23]);
        }
        double v15 = v93.f64[1];
        double v26 = fmin(v93.f64[0], v26);
        double v5 = fmax(v5, v93.f64[0]);
        double v24 = fmin(v93.f64[1], v24);
        double v25 = fmax(v25, v93.f64[1]);
        v85 += 3;
        --v17;
      }
      while (v17);
    }
  }
  else
  {
    double v26 = v5;
    double v25 = v127;
    double v24 = v127;
  }
  self->_viewableScreenRect._maximum._e[0] = v26;
  self->_viewableScreenRect._maximum._e[1] = v24;
  self->_framingScreenRect._minimum._e[0] = v5;
  self->_framingScreenRect._minimum._e[1] = v25;

  double minHeightDeltaChangeVertical = self->_minHeightDeltaChangeVertical;
  double v42 = self->_viewableScreenRect._minimum._e[0];
  double v43 = self->_viewableScreenRect._minimum._e[1];
  double maxHeightDeltaChangeVertical = self->_maxHeightDeltaChangeVertical;
  double halfPuckSize = self->_halfPuckSize;
  float v102 = self->_puckMovementBoundsMin._e[0];
  float v104 = self->_puckMovementBoundsMin._e[1];
  double v46 = self->_viewableScreenRect._maximum._e[0];
  double v47 = self->_viewableScreenRect._maximum._e[1];
  double v107 = self->_framingScreenRect._minimum._e[0];
  double v114 = self->_framingScreenRect._minimum._e[1];
  float top = self->_clientFramingInsets.top;
  float left = self->_clientFramingInsets.left;
  float bottom = self->_clientFramingInsets.bottom;
  float right = self->_clientFramingInsets.right;
  double v48 = cos(self->_pitchSpring._restingPosition);
  double value = self->_coordinatesToFrame.__end_cap_.__value_;
  double restingPosition = self->_distanceFromTargetSpring._restingPosition;
  [(VKNavCameraController *)self minZoomHeight];
  double v122 = v49;
  double v120 = *(double *)&self->_styleManeuversToFrame;
  [(VKNavCameraController *)self maxZoomHeight];
  double v51 = fabs(v48);
  if (v51 <= v51 * 2.22044605e-14 || v51 < 2.22507386e-308)
  {
    [(VKNavCameraController *)self puckScreenPoint];
    self->_screenPositionSpring._restingPosition._e[0] = v83;
    self->_screenPositionSpring._restingPosition._e[1] = v84;
    self->_distanceFromTargetSpring._double restingPosition = self->_cameraDistanceFromTarget._value;
    goto LABEL_35;
  }
  double v52 = 1.0 - v104;
  double v53 = fmin(fmax(maxHeightDeltaChangeVertical + (v42 - maxHeightDeltaChangeVertical) * v102, maxHeightDeltaChangeVertical + minHeightDeltaChangeVertical), v42 - minHeightDeltaChangeVertical);
  double v54 = fmin(fmax(halfPuckSize + v52 * (v43 - halfPuckSize), halfPuckSize + minHeightDeltaChangeVertical), v43 - minHeightDeltaChangeVertical);
  double v55 = fmin(fmax(fmin(fmax(v101 - v46 + v53 + (v46 - v107) * v102, v53 - top), v53 + bottom), fmin(v42, maxHeightDeltaChangeVertical + minHeightDeltaChangeVertical)), fmax(v42 - minHeightDeltaChangeVertical, maxHeightDeltaChangeVertical));
  double v56 = fmin(fmax(fmin(fmax(v127 - v47 + v54 + (v47 - v114) * v52, v54 - left), v54 + right), fmin(v43, halfPuckSize + minHeightDeltaChangeVertical)), fmax(v43 - minHeightDeltaChangeVertical, halfPuckSize));
  double v57 = fmax(*(double *)&value, v122);
  double v58 = fmin(v120, v50);
  double v59 = fmin(fmax(fmax((v55 - self->_viewableScreenRect._maximum._e[0]) / (v55 - self->_maxHeightDeltaChangeVertical), (self->_framingScreenRect._minimum._e[0] - v55) / (self->_viewableScreenRect._minimum._e[0] - v55))* (restingPosition* v48), v57), v58);
  double v60 = fmin(fmax(fmax((self->_framingScreenRect._minimum._e[1] - v56) / (self->_viewableScreenRect._minimum._e[1] - v56), (v56 - self->_viewableScreenRect._maximum._e[1]) / (v56 - self->_halfPuckSize))* (restingPosition* v48), v57), v58);
  if (v60 < self->_maxHeightDeltaChangeHorizontal + restingPosition * v48
    && v60 > restingPosition * v48 - self->_minHeightDeltaChangeHorizontal)
  {
    double v60 = restingPosition * v48;
  }
  BOOL v62 = v59 >= *(double *)&self->_idealPuckScreenPosition + restingPosition * v48
     || v59 <= restingPosition * v48 - *(double *)&self->_puckMovementBoundsMax;
  double v63 = fmax(v60, v59);
  if (v62) {
    double v60 = v63;
  }
  self->_screenPositionSpring._restingPosition._e[0] = v55;
  self->_screenPositionSpring._restingPosition._e[1] = v56;
  self->_distanceFromTargetSpring._double restingPosition = v60 / v48;
  if ([(VKCameraController *)self edgeInsetsAnimating])
  {
    LODWORD(v64) = LODWORD(self->_minCameraPitch._value);
    LODWORD(v65) = HIDWORD(self->_minCameraPitch._value);
    LODWORD(v66) = LODWORD(self->_maxCameraPitch._value);
    LODWORD(v67) = HIDWORD(self->_maxCameraPitch._value);
    -[VKNavCameraController calculateViewableScreenRectForEdgeInsets:](self, "calculateViewableScreenRectForEdgeInsets:", v64, v65, v66, v67);
    double v68 = self->_minHeightDeltaChangeVertical;
    double v69 = self->_puckMovementBoundsMin._e[0];
    double v70 = 1.0 - self->_puckMovementBoundsMin._e[1];
    double v72 = v71 + v68;
    double v74 = v73 - v68;
    double v75 = fmin(fmax(v71 + (v73 - v71) * v69, v71 + v68), v73 - v68);
    double v76 = fmin(fmax(v101- self->_viewableScreenRect._maximum._e[0]+ (self->_viewableScreenRect._maximum._e[0] - self->_framingScreenRect._minimum._e[0]) * v69+ v75, v75 - self->_clientFramingInsets.top), v75 + self->_clientFramingInsets.bottom);
    double v78 = v77 + v68;
    double v80 = v79 - v68;
    double v81 = fmin(fmax(v77 + v70 * (v79 - v77), v78), v80);
    double v82 = self->_screenPositionSpring._position._e[1]
        + v56
        - fmin(fmax(fmin(fmax(v127- self->_viewableScreenRect._maximum._e[1]+ v81+ (self->_viewableScreenRect._maximum._e[1] - self->_framingScreenRect._minimum._e[1]) * v70, v81 - self->_clientFramingInsets.left), v81 + self->_clientFramingInsets.right), fmin(v79, v78)), fmax(v80, v77));
    self->_screenPositionSpring._position._e[0] = self->_screenPositionSpring._position._e[0]
                                                + v55
                                                - fmin(fmax(v76, fmin(v73, v72)), fmax(v74, v71));
    self->_screenPositionSpring._position._e[1] = v82;
  }
}

- (void)_updateRouteSinuosity
{
  p_routeCoordinate = (double *)&self->_routeCoordinate;
  if (*(double *)&self->_routeCoordinate != -3.14159265
    || *(double *)&self->_frameAllGroupedManeuvers != -3.14159265
    || self->_routeFocusCoordinate.latitude._value != 0.0)
  {
    id v22 = [*(id *)&self->_maxFramingDistance route];
    uint64_t v4 = objc_msgSend(v22, "closestPointOnRoute:", *p_routeCoordinate * 57.2957795, p_routeCoordinate[1] * 57.2957795);

    id v23 = [*(id *)&self->_maxFramingDistance route];
    [v23 distanceBetweenRouteCoordinate:*(void *)&self->_locationCoordinate.latitude andRouteCoordinate:v4];
    double v20 = v5;

    double v6 = p_routeCoordinate[1];
    double v7 = p_routeCoordinate[2];
    __double2 v8 = __sincos_stret(*p_routeCoordinate);
    double v9 = 6378137.0 / sqrt(1.0 - v8.__sinval * v8.__sinval * 0.00669437999);
    double v10 = (v9 + v7) * v8.__cosval;
    __double2 v11 = __sincos_stret(v6);
    double v21 = v7 + v9 * 0.99330562;
    double value = self->_puckCoordinate.longitude._value;
    double v13 = self->_puckCoordinate.altitude._value;
    __double2 v14 = __sincos_stret(self->_puckCoordinate.latitude._value);
    double v15 = 6378137.0 / sqrt(1.0 - v14.__sinval * v14.__sinval * 0.00669437999);
    __double2 v16 = __sincos_stret(value);
    double v17 = -((v13 + v15 * 0.99330562) * v14.__sinval - v21 * v8.__sinval);
    double v18 = sqrt(-((v15 + v13) * v14.__cosval * v16.__cosval - v10 * v11.__cosval)* -((v15 + v13) * v14.__cosval * v16.__cosval - v10 * v11.__cosval)+ -((v15 + v13) * v14.__cosval * v16.__sinval - v10 * v11.__sinval)* -((v15 + v13) * v14.__cosval * v16.__sinval - v10 * v11.__sinval)+ v17 * v17);
    if (v18 != 0.0)
    {
      double v19 = v20 / v18;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraMode);
      [WeakRetained setSinuosity:v19];
    }
  }
}

- (void)_addAdditionalRoutePointsToFrameToList:(void *)a3
{
  double maxFramingDistance = self->_maxFramingDistance;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__VKNavCameraController__addAdditionalRoutePointsToFrameToList___block_invoke;
  v4[3] = &unk_1E5A96C50;
  v4[4] = self;
  v4[5] = a3;
  [*(id *)&maxFramingDistance enumerateAdditionalRoutesToFrameUsingBlock:v4];
}

void __64__VKNavCameraController__addAdditionalRoutePointsToFrameToList___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v6 = a2;
  if ([v6 pointCount])
  {
    int v7 = [v6 pointCount];
    if (*MEMORY[0x1E4F64198] == a3
      && fabsf(*((float *)&a3 + 1) - *(float *)(MEMORY[0x1E4F64198] + 4)) < 0.00000011921)
    {
      LODWORD(a3) = 0;
    }
    if (*MEMORY[0x1E4F64198] == a4
      && fabsf(*((float *)&a4 + 1) - *(float *)(MEMORY[0x1E4F64198] + 4)) < 0.00000011921)
    {
      LODWORD(a4) = v7 - 1;
    }
    if (a3 <= a4)
    {
      a3 = a3;
      while (1)
      {
        if (a3 >= [v6 pointCount]) {
          goto LABEL_9;
        }
        [v6 pointWithAltitudeCorrectionAtIndex:a3];
        double v9 = *(void **)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 40);
        if (v9) {
          objc_msgSend(v9, "_coordinateForGeoLocation:");
        }
        else {
          memset(v36, 0, 24);
        }
        unint64_t v12 = *(void *)(v10 + 8);
        unint64_t v11 = *(void *)(v10 + 16);
        if (v12 >= v11) {
          break;
        }
        *(void *)unint64_t v12 = *(void *)&v36[0];
        *(_OWORD *)(v12 + 8) = *(_OWORD *)((char *)v36 + 8);
        unint64_t v8 = v12 + 24;
LABEL_12:
        *(void *)(v10 + 8) = v8;
        if (a4 < ++a3) {
          goto LABEL_9;
        }
      }
      double v13 = *(void **)v10;
      uint64_t v14 = v12 - *(void *)v10;
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (v14 >> 3) + 1;
      if (v15 > 0xAAAAAAAAAAAAAAALL) {
        abort();
      }
      unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - (void)v13) >> 3);
      if (2 * v16 > v15) {
        unint64_t v15 = 2 * v16;
      }
      if (v16 >= 0x555555555555555) {
        unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v17 = v15;
      }
      if (v17 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      double v18 = (char *)operator new(24 * v17);
      double v19 = &v18[8 * (v14 >> 3)];
      *(_OWORD *)double v19 = v36[0];
      *((void *)v19 + 2) = *(void *)&v36[1];
      if ((void *)v12 == v13)
      {
        double v21 = &v18[8 * (v14 >> 3)];
      }
      else
      {
        unint64_t v20 = v12 - (void)v13 - 24;
        if (v20 >= 0x168)
        {
          unint64_t v23 = v20 / 0x18;
          unint64_t v24 = -24 * (v20 / 0x18) + v14;
          unint64_t v25 = (unint64_t)&v18[v24 - 24];
          unint64_t v26 = v12 - 24 * (v20 / 0x18) - 24;
          unint64_t v27 = v12 - 8 - 24 * (v20 / 0x18);
          BOOL v29 = (unint64_t)&v18[v24 - 8] < v12 && v27 < (unint64_t)v19;
          double v21 = &v18[8 * (v14 >> 3)];
          if ((v26 >= (unint64_t)&v18[v14 - 8] || v25 >= v12 - 8) && !v29)
          {
            unint64_t v31 = v23 + 1;
            float64x2_t v32 = (const double *)(v12 - 48);
            double v33 = (double *)(v19 - 48);
            uint64_t v34 = v31 & 0x1FFFFFFFFFFFFFFELL;
            do
            {
              float64x2x3_t v37 = vld3q_f64(v32);
              vst3q_f64(v33, v37);
              v33 -= 6;
              v32 -= 6;
              v34 -= 2;
            }
            while (v34);
            double v21 = &v19[-24 * (v31 & 0x1FFFFFFFFFFFFFFELL)];
            v12 -= 24 * (v31 & 0x1FFFFFFFFFFFFFFELL);
            if (v31 == (v31 & 0x1FFFFFFFFFFFFFFELL)) {
              goto LABEL_31;
            }
          }
        }
        else
        {
          double v21 = &v18[8 * (v14 >> 3)];
        }
        do
        {
          uint64_t v22 = *(void *)(v12 - 24);
          v12 -= 24;
          *((void *)v21 - 3) = v22;
          v21 -= 24;
          *(_OWORD *)(v21 + 8) = *(_OWORD *)(v12 + 8);
        }
        while ((void *)v12 != v13);
      }
LABEL_31:
      unint64_t v8 = (unint64_t)(v19 + 24);
      *(void *)uint64_t v10 = v21;
      *(void *)(v10 + 8) = v19 + 24;
      *(void *)(v10 + 16) = &v18[24 * v17];
      if (v13) {
        operator delete(v13);
      }
      goto LABEL_12;
    }
  }
LABEL_9:
}

- (Coordinate3D<geo::Radians,)_coordinateForGeoLocation:()Coordinate3D<geo:(double>)result :Radians
{
  if (!LOBYTE(self->_requesteDisplayRateSampler._count)) {
    result.altitude._double value = 0.0;
  }
  double v4 = result.latitude._value * 0.0174532925;
  double v5 = result.longitude._value * 0.0174532925;
  double *v3 = v4;
  v3[1] = v5;
  v3[2] = result.altitude._value;
  result.longitude = *(Unit<geo::RadianUnitDescription, double> *)&v5;
  result.latitude = *(Unit<geo::RadianUnitDescription, double> *)&v4;
  return result;
}

- (void)updatePointsToFrame
{
  p_uint64_t var0 = &self->_currentStyleName.__r_.var0;
  self->_currentStyleName.uint64_t var0 = *(void *)&self->_currentStyleName.__r_.var0;
  unint64_t v4 = [*(id *)&self->_maxFramingDistance currentStepIndex];
  double maxFramingDistance = self->_maxFramingDistance;
  if (maxFramingDistance != 0.0)
  {
    id v6 = [*(id *)&maxFramingDistance route];

    if (v6)
    {
      int v7 = [*(id *)&self->_maxFramingDistance route];
      unint64_t v8 = v7;
      if (BYTE3(self->_coordinatesToFrame.__end_))
      {
        uint64_t v9 = [v7 segmentIndexForStepIndex:v4];
        for (unint64_t i = v9; ; ++i)
        {
          unint64_t v11 = [v8 segments];
          if (i >= [v11 count]) {
            break;
          }
          unint64_t v12 = v9 + BYTE3(self->_coordinatesToFrame.__end_);

          if (i >= v12) {
            goto LABEL_16;
          }
          double v13 = [v8 segments];
          uint64_t v14 = [v13 objectAtIndex:i];

          if (v14)
          {
            unint64_t v15 = v4;
            if ([v14 startStepIndex] > v4) {
              unint64_t v15 = [v14 startStepIndex];
            }
            do
            {
              if (v15 > [v14 endStepIndex]) {
                break;
              }
            }
            while (![(VKNavCameraController *)self _addStepToFraming:v15++ forRoute:v8]);
          }
        }
      }
LABEL_16:
      if (BYTE2(self->_coordinatesToFrame.__end_))
      {
        uint64_t v17 = [v8 legIndexForStepIndex:v4];
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          double v18 = [v8 legs];
          for (unint64_t j = v17;
                j < [v18 count] && j < v17 + (unint64_t)BYTE2(self->_coordinatesToFrame.__end_);
                ++j)
          {
            unint64_t v20 = [v18 objectAtIndex:j];
            double v21 = v20;
            if (v20)
            {
              unint64_t v22 = v4;
              if ([v20 startStepIndex] > v4) {
                unint64_t v22 = [v21 startStepIndex];
              }
              do
              {
                if (v22 > [v21 endStepIndex]) {
                  break;
                }
              }
              while (![(VKNavCameraController *)self _addStepToFraming:v22++ forRoute:v8]);
            }
          }
        }
      }
      if (!BYTE1(self->_coordinatesToFrame.__end_))
      {
LABEL_152:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraMode);
        uint64_t v111 = [WeakRetained navCameraMode];

        if (v111 == 1)
        {
          double v114 = [v8 destination];
          [(VKNavCameraController *)self _addWaypointToFraming:v114 forRoute:v8];
        }
        else
        {
          if (v111 != 3) {
            goto LABEL_158;
          }
          uint64_t v112 = [v8 legIndexForStepIndex:v4];
          if (v112 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_158;
          }
          float64x2_t v113 = [v8 legs];
          double v114 = [v113 objectAtIndex:v112];

          float64x2_t v115 = [v114 destination];
          [(VKNavCameraController *)self _addWaypointToFraming:v115 forRoute:v8];
        }
LABEL_158:

        goto LABEL_159;
      }
      id v24 = objc_loadWeakRetained((id *)&self->_cameraMode);
      int v25 = [v24 navigationState];

      if (v25 != 6 && v25 != 1) {
        goto LABEL_74;
      }
      unint64_t v27 = [*(id *)&self->_maxFramingDistance routeMatch];
      BOOL v216 = v27;
      if (v27)
      {
        [v27 locationCoordinate3D];
        -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:");
        unint64_t v29 = *((void *)p_var0 + 1);
        unint64_t v28 = *((void *)p_var0 + 2);
        if (v29 >= v28)
        {
          unint64_t v31 = *(void **)p_var0;
          unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v29 - *(void *)p_var0) >> 3);
          unint64_t v33 = v32 + 1;
          if (v32 + 1 > 0xAAAAAAAAAAAAAAALL) {
            abort();
          }
          unint64_t v213 = v29 - *(void *)p_var0;
          unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - (void)v31) >> 3);
          if (2 * v34 > v33) {
            unint64_t v33 = 2 * v34;
          }
          if (v34 >= 0x555555555555555) {
            unint64_t v35 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v35 = v33;
          }
          if (v35 > 0xAAAAAAAAAAAAAAALL) {
            goto LABEL_281;
          }
          double v36 = (char *)operator new(24 * v35);
          unint64_t v37 = (unint64_t)&v36[24 * v32];
          *(_OWORD *)unint64_t v37 = *(_OWORD *)v222;
          *(void *)(v37 + 16) = *(void *)&v222[16];
          unint64_t v30 = v37 + 24;
          if ((void *)v29 != v31)
          {
            unint64_t v38 = v29 - (void)v31 - 24;
            if (v38 < 0x1C8) {
              goto LABEL_289;
            }
            unint64_t v95 = v38 / 0x18;
            BOOL v96 = (unint64_t)&v36[v213 - 8 - 24 * v95] >= v29 || v29 - 24 * v95 - 8 >= v37;
            BOOL v97 = !v96;
            if (v29 - 24 * v95 - 24 < (unint64_t)&v36[v213 - 8]
              && (unint64_t)&v36[v213 - 24 * v95 - 24] < v29 - 8)
            {
              goto LABEL_289;
            }
            if (v97) {
              goto LABEL_289;
            }
            unint64_t v99 = v95 + 1;
            uint64_t v100 = (const double *)(v29 - 48);
            double v101 = (double *)(v37 - 48);
            uint64_t v102 = v99 & 0x1FFFFFFFFFFFFFFELL;
            do
            {
              float64x2x3_t v224 = vld3q_f64(v100);
              vst3q_f64(v101, v224);
              v101 -= 6;
              v100 -= 6;
              v102 -= 2;
            }
            while (v102);
            v37 -= 24 * (v99 & 0x1FFFFFFFFFFFFFFELL);
            v29 -= 24 * (v99 & 0x1FFFFFFFFFFFFFFELL);
            if (v99 != (v99 & 0x1FFFFFFFFFFFFFFELL))
            {
LABEL_289:
              do
              {
                uint64_t v39 = *(void *)(v29 - 24);
                v29 -= 24;
                *(void *)(v37 - ++*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v39;
                v37 -= 24;
                *(_OWORD *)(v37 + 8) = *(_OWORD *)(v29 + 8);
              }
              while ((void *)v29 != v31);
            }
          }
          *(void *)p_uint64_t var0 = v37;
          *((void *)p_var0 + 1) = v30;
          *((void *)p_var0 + 2) = &v36[24 * v35];
          if (v31) {
            operator delete(v31);
          }
        }
        else
        {
          *(void *)unint64_t v29 = *(void *)v222;
          *(_OWORD *)(v29 + 8) = *(_OWORD *)&v222[8];
          unint64_t v30 = v29 + 24;
        }
        *((void *)p_var0 + 1) = v30;
      }
      if (v25 == 1)
      {
        uint64_t v40 = 0;
        unint64_t v4 = 0;
      }
      else if ([v8 pointCount])
      {
        uint64_t v40 = [v8 pointCount] - 1;
      }
      else
      {
        uint64_t v40 = 0;
      }
      int v214 = v25;
      [v8 pointWithAltitudeCorrectionAtIndex:v40];
      -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:");
      unint64_t v42 = *((void *)p_var0 + 1);
      unint64_t v41 = *((void *)p_var0 + 2);
      if (v42 < v41)
      {
        *(void *)unint64_t v42 = *(void *)v222;
        *(_OWORD *)(v42 + 8) = *(_OWORD *)&v222[8];
        unint64_t v43 = v42 + 24;
        double v44 = v216;
LABEL_73:
        *((void *)p_var0 + 1) = v43;

LABEL_74:
        unint64_t v55 = v4;
        while (v55 < [v8 stepsCount] && v55 < v4 + BYTE1(self->_coordinatesToFrame.__end_))
        {
          if ([(VKNavCameraController *)self _addStepToFraming:v55++ forRoute:v8])
          {
            char v217 = 1;
            goto LABEL_80;
          }
        }
        char v217 = 0;
LABEL_80:
        uint64_t v57 = *((void *)p_var0 + 1);
        if (v57 == *(void *)p_var0)
        {
          *(int64x2_t *)&self->_routeCoordinate.index = vdupq_n_s64(0xC00921FB54442D18);
          self->_routeFocusCoordinate.latitude._double value = 0.0;
        }
        else
        {
          double v58 = *(double *)(v57 - 8);
          *(_OWORD *)&self->_routeCoordinate.index = *(_OWORD *)(v57 - 24);
          self->_routeFocusCoordinate.latitude._double value = v58;
        }
        uint64_t v59 = [v8 stepsCount];
        if (v25 != 6)
        {
          if (v4 != v59 - 1) {
            goto LABEL_140;
          }
          [(VKNavCameraController *)self distanceToManeuver:v4];
          double v71 = v70;
          if (v70 >= *(double *)&self->_enablePan) {
            goto LABEL_140;
          }
          double v60 = [v8 destination];
          if (![v60 hasLatLng]) {
            goto LABEL_139;
          }
          float v209 = [v8 stepAtIndex:v4];
          objc_msgSend(v8, "pointAtRouteCoordinate:", objc_msgSend(v209, "endRouteCoordinate"));
          double v72 = [v60 latLng];
          [v72 lat];
          double v73 = [v60 latLng];
          [v73 lng];
          GEOCalculateDistance();
          double v75 = v74;

          double v76 = v75 + v71;
          double v77 = *(double *)&self->_enablePan;

          if (v76 >= v77)
          {
LABEL_140:
            if (v217) {
              goto LABEL_152;
            }
            if (*(double *)&self->_alternateFramingSource <= 0.0) {
              goto LABEL_152;
            }
            uint64_t v103 = BYTE1(self->_coordinatesToFrame.__end_);
            uint64_t v104 = v4 + v103;
            if (v4 + v103 >= [v8 stepsCount]) {
              goto LABEL_152;
            }
            float64x2_t v105 = [v8 stepAtIndex:v4 + v103];
            BOOL v207 = v105;
            unsigned int v106 = [v105 startRouteCoordinate];
            uint64_t v204 = v104;
            int latitude_low = LODWORD(self->_locationCoordinate.latitude);
            if (latitude_low + 1 > v106) {
              uint64_t v108 = (latitude_low + 1);
            }
            else {
              uint64_t v108 = v106;
            }
            uint64_t v109 = [v105 endRouteCoordinate];
            if (v108 > v109)
            {
LABEL_147:
              [(VKNavCameraController *)self routeLocationAtDistance:v204 - 1 fromManeuver:*(double *)&self->_alternateFramingSource];
              if (*(double *)v222 != -3.14159265 || *(double *)&v222[8] != -3.14159265 || *(double *)&v222[16] != 0.0) {
                std::vector<geo::Coordinate3D<geo::Radians,double>>::push_back[abi:nn180100]((uint64_t)p_var0, (uint64_t)v222);
              }

              goto LABEL_152;
            }
            uint64_t v167 = v108;
            unint64_t v215 = v4;
            while (1)
            {
              float v169 = [*(id *)&self->_maxFramingDistance route];
              [v169 distanceBetweenRoutePointIndex:v108 toPointIndex:v167];
              double v171 = v170;

              if (v171 > *(double *)&self->_alternateFramingSource) {
                goto LABEL_147;
              }
              uint64_t v172 = v109;
              uint64_t v173 = v108;
              [v8 pointWithAltitudeCorrectionAtIndex:v167];
              -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:");
              unint64_t v175 = *((void *)p_var0 + 1);
              unint64_t v174 = *((void *)p_var0 + 2);
              if (v175 >= v174) {
                break;
              }
              *(void *)unint64_t v175 = *(void *)v222;
              *(_OWORD *)(v175 + 8) = *(_OWORD *)&v222[8];
              unint64_t v168 = v175 + 24;
              uint64_t v109 = v172;
              unint64_t v4 = v215;
LABEL_231:
              *((void *)p_var0 + 1) = v168;
              uint64_t v167 = (v167 + 1);
              if (v167 > v109) {
                goto LABEL_147;
              }
            }
            unint64_t v176 = *(void **)p_var0;
            uint64_t v177 = v175 - *(void *)p_var0;
            unint64_t v178 = 0xAAAAAAAAAAAAAAABLL * (v177 >> 3) + 1;
            if (v178 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            unint64_t v179 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v174 - (void)v176) >> 3);
            if (2 * v179 > v178) {
              unint64_t v178 = 2 * v179;
            }
            if (v179 >= 0x555555555555555) {
              unint64_t v180 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v180 = v178;
            }
            if (v180 > 0xAAAAAAAAAAAAAAALL) {
              goto LABEL_281;
            }
            unint64_t v212 = v180;
            float v181 = (char *)operator new(24 * v180);
            unint64_t v182 = (unint64_t)&v181[8 * (v177 >> 3)];
            *(_OWORD *)unint64_t v182 = *(_OWORD *)v222;
            *(void *)(v182 + 16) = *(void *)&v222[16];
            if ((void *)v175 == v176)
            {
              float v184 = &v181[8 * (v177 >> 3)];
              uint64_t v108 = v173;
              uint64_t v109 = v172;
              unint64_t v185 = v212;
              unint64_t v4 = v215;
              goto LABEL_247;
            }
            unint64_t v183 = v175 - (void)v176 - 24;
            if (v183 >= 0x168
              && ((unint64_t v187 = v183 / 0x18, v188 = -24 * (v183 / 0x18), (unint64_t)&v181[v188 - 8 + v177] < v175)
                ? (BOOL v189 = v175 - 8 - 24 * v187 >= v182)
                : (BOOL v189 = 1),
                  v189 ? (char v190 = 0) : (char v190 = 1),
                  v175 - 24 * v187 - 24 < (unint64_t)&v181[v177 - 8]
                ? (BOOL v191 = (unint64_t)&v181[v188 - 24 + v177] >= v175 - 8)
                : (BOOL v191 = 1),
                  v191))
            {
              float v184 = &v181[8 * (v177 >> 3)];
              uint64_t v108 = v173;
              uint64_t v109 = v172;
              unint64_t v185 = v212;
              unint64_t v4 = v215;
              if ((v190 & 1) == 0)
              {
                unint64_t v192 = v187 + 1;
                float v193 = (const double *)(v175 - 48);
                unsigned int v194 = (double *)(v182 - 48);
                uint64_t v195 = v192 & 0x1FFFFFFFFFFFFFFELL;
                do
                {
                  float64x2x3_t v226 = vld3q_f64(v193);
                  vst3q_f64(v194, v226);
                  v194 -= 6;
                  v193 -= 6;
                  v195 -= 2;
                }
                while (v195);
                float v184 = (char *)(v182 - 24 * (v192 & 0x1FFFFFFFFFFFFFFELL));
                v175 -= 24 * (v192 & 0x1FFFFFFFFFFFFFFELL);
                if (v192 == (v192 & 0x1FFFFFFFFFFFFFFELL))
                {
LABEL_247:
                  unint64_t v168 = v182 + 24;
                  *(void *)p_uint64_t var0 = v184;
                  *((void *)p_var0 + 1) = v182 + 24;
                  *((void *)p_var0 + 2) = &v181[24 * v185];
                  if (v176) {
                    operator delete(v176);
                  }
                  goto LABEL_231;
                }
              }
            }
            else
            {
              float v184 = &v181[8 * (v177 >> 3)];
              uint64_t v108 = v173;
              uint64_t v109 = v172;
              unint64_t v185 = v212;
              unint64_t v4 = v215;
            }
            do
            {
              uint64_t v186 = *(void *)(v175 - 24);
              v175 -= 24;
              *((void *)v184 - 3) = v186;
              v184 -= 24;
              *(_OWORD *)(v184 + 8) = *(_OWORD *)(v175 + 8);
            }
            while ((void *)v175 != v176);
            goto LABEL_247;
          }
        }
        double v60 = [v8 destination];
        if (![v60 hasLatLng])
        {
LABEL_139:

          goto LABEL_140;
        }
        unsigned int v61 = [v60 latLng];
        [v61 lat];
        double v63 = v62;
        [v61 lng];
        double v64 = v63 * 0.0174532925;
        double v66 = v65 * 0.0174532925;
        unint64_t v68 = *((void *)p_var0 + 1);
        unint64_t v67 = *((void *)p_var0 + 2);
        if (v68 < v67)
        {
          *(double *)unint64_t v68 = v64;
          *(double *)(v68 + 8) = v66;
          unint64_t v69 = v68 + 24;
          *(void *)(v68 + 16) = 0;
LABEL_138:
          *((void *)p_var0 + 1) = v69;

          goto LABEL_139;
        }
        BOOL v210 = v61;
        double v78 = *(void **)p_var0;
        unint64_t v79 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v68 - *(void *)p_var0) >> 3);
        unint64_t v80 = v79 + 1;
        if (v79 + 1 > 0xAAAAAAAAAAAAAAALL) {
          abort();
        }
        unint64_t v206 = v68 - *(void *)p_var0;
        unint64_t v81 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v67 - (void)v78) >> 3);
        if (2 * v81 > v80) {
          unint64_t v80 = 2 * v81;
        }
        if (v81 >= 0x555555555555555) {
          unint64_t v82 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v82 = v80;
        }
        if (v82 <= 0xAAAAAAAAAAAAAAALL)
        {
          double v83 = (char *)operator new(24 * v82);
          unint64_t v84 = (unint64_t)&v83[24 * v79];
          *(double *)unint64_t v84 = v64;
          *(double *)(v84 + 8) = v66;
          *(void *)(v84 + 16) = 0;
          unint64_t v69 = v84 + 24;
          if ((void *)v68 != v78)
          {
            unint64_t v85 = v68 - (void)v78 - 24;
            if (v85 < 0x1C8) {
              goto LABEL_290;
            }
            unint64_t v196 = v85 / 0x18;
            BOOL v197 = (unint64_t)&v83[v206 - 8 - 24 * v196] >= v68 || v68 - 24 * v196 - 8 >= v84;
            BOOL v198 = !v197;
            if (v68 - 24 * v196 - 24 < (unint64_t)&v83[v206 - 8]
              && (unint64_t)&v83[v206 - 24 * v196 - 24] < v68 - 8)
            {
              goto LABEL_290;
            }
            if (v198) {
              goto LABEL_290;
            }
            unint64_t v200 = v196 + 1;
            v201 = (const double *)(v68 - 48);
            float v202 = (double *)(v84 - 48);
            uint64_t v203 = v200 & 0x1FFFFFFFFFFFFFFELL;
            do
            {
              float64x2x3_t v227 = vld3q_f64(v201);
              vst3q_f64(v202, v227);
              v202 -= 6;
              v201 -= 6;
              v203 -= 2;
            }
            while (v203);
            v84 -= 24 * (v200 & 0x1FFFFFFFFFFFFFFELL);
            v68 -= 24 * (v200 & 0x1FFFFFFFFFFFFFFELL);
            if (v200 != (v200 & 0x1FFFFFFFFFFFFFFELL))
            {
LABEL_290:
              do
              {
                uint64_t v86 = *(void *)(v68 - 24);
                v68 -= 24;
                *(void *)(v84 - ++*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v86;
                v84 -= 24;
                *(_OWORD *)(v84 + 8) = *(_OWORD *)(v68 + 8);
              }
              while ((void *)v68 != v78);
            }
          }
          *(void *)p_uint64_t var0 = v84;
          *((void *)p_var0 + 1) = v69;
          *((void *)p_var0 + 2) = &v83[24 * v82];
          if (v78) {
            operator delete(v78);
          }
          unsigned int v61 = v210;
          goto LABEL_138;
        }
LABEL_281:
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      double v45 = *(void **)p_var0;
      uint64_t v46 = v42 - *(void *)p_var0;
      unint64_t v47 = 0xAAAAAAAAAAAAAAABLL * (v46 >> 3) + 1;
      if (v47 > 0xAAAAAAAAAAAAAAALL) {
        abort();
      }
      unint64_t v48 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v41 - (void)v45) >> 3);
      if (2 * v48 > v47) {
        unint64_t v47 = 2 * v48;
      }
      if (v48 >= 0x555555555555555) {
        unint64_t v49 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v49 = v47;
      }
      if (v49 > 0xAAAAAAAAAAAAAAALL) {
        goto LABEL_281;
      }
      double v50 = (char *)operator new(24 * v49);
      unint64_t v51 = (unint64_t)&v50[8 * (v46 >> 3)];
      double v52 = &v50[24 * v49];
      *(_OWORD *)unint64_t v51 = *(_OWORD *)v222;
      *(void *)(v51 + 16) = *(void *)&v222[16];
      unint64_t v43 = v51 + 24;
      if ((void *)v42 == v45)
      {
        int v25 = v214;
        double v44 = v216;
        goto LABEL_71;
      }
      unint64_t v53 = v42 - (void)v45 - 24;
      if (v53 >= 0x1C8)
      {
        unint64_t v87 = v53 / 0x18;
        BOOL v89 = (unint64_t)&v50[v46 - 8 - 24 * v87] < v42 && v42 - 24 * v87 - 8 < v51;
        BOOL v90 = v42 - 24 * v87 - 24 >= (unint64_t)&v50[v46 - 8]
           || (unint64_t)&v50[v46 - 24 * v87 - 24] >= v42 - 8;
        int v25 = v214;
        if (v90)
        {
          double v44 = v216;
          if (!v89)
          {
            unint64_t v91 = v87 + 1;
            __double2 v92 = (const double *)(v42 - 48);
            float64x2_t v93 = (double *)(v51 - 48);
            uint64_t v94 = v91 & 0x1FFFFFFFFFFFFFFELL;
            do
            {
              float64x2x3_t v223 = vld3q_f64(v92);
              vst3q_f64(v93, v223);
              v93 -= 6;
              v92 -= 6;
              v94 -= 2;
            }
            while (v94);
            v51 -= 24 * (v91 & 0x1FFFFFFFFFFFFFFELL);
            v42 -= 24 * (v91 & 0x1FFFFFFFFFFFFFFELL);
            if (v91 == (v91 & 0x1FFFFFFFFFFFFFFELL))
            {
LABEL_71:
              *(void *)p_uint64_t var0 = v51;
              *((void *)p_var0 + 1) = v43;
              *((void *)p_var0 + 2) = v52;
              if (v45) {
                operator delete(v45);
              }
              goto LABEL_73;
            }
          }
        }
        else
        {
          double v44 = v216;
        }
      }
      else
      {
        int v25 = v214;
        double v44 = v216;
      }
      do
      {
        uint64_t v54 = *(void *)(v42 - 24);
        v42 -= 24;
        *(void *)(v51 - ++*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v54;
        v51 -= 24;
        *(_OWORD *)(v51 + 8) = *(_OWORD *)(v42 + 8);
      }
      while ((void *)v42 != v45);
      goto LABEL_71;
    }
  }
  *(int64x2_t *)&self->_routeCoordinate.index = vdupq_n_s64(0xC00921FB54442D18);
  self->_routeFocusCoordinate.latitude._double value = 0.0;
LABEL_159:
  char v116 = 0;
  uint64_t v117 = 0;
  double v118 = 0.0;
  char v119 = 0;
  char v120 = BYTE1(self->_framingScreenRect._maximum._e[1]);
  v221[0] = LOBYTE(self->_framingScreenRect._maximum._e[1]);
  v221[1] = v120;
  do
  {
    char v122 = v116;
    switch(v221[v117])
    {
      case 1:
        if ((v119 & 1) == 0) {
          [(VKNavCameraController *)self _addAdditionalRoutePointsToFrameToList:p_var0];
        }
        double v123 = self->_maxFramingDistance;
        v220[0] = MEMORY[0x1E4F143A8];
        v220[1] = 3221225472;
        v220[2] = __44__VKNavCameraController_updatePointsToFrame__block_invoke;
        v220[3] = &unk_1E5A96C28;
        v220[4] = self;
        [*(id *)&v123 enumeratePointsToFrameOfType:1 usingBlock:v220];
        goto LABEL_161;
      case 2:
        double v130 = *(void **)p_var0;
        uint64_t v129 = *((void *)p_var0 + 1);
        double v131 = self->_maxFramingDistance;
        v219[0] = MEMORY[0x1E4F143A8];
        v219[1] = 3221225472;
        v219[2] = __44__VKNavCameraController_updatePointsToFrame__block_invoke_2;
        v219[3] = &unk_1E5A96C28;
        v219[4] = self;
        [*(id *)&v131 enumeratePointsToFrameOfType:2 usingBlock:v219];
        *(void *)&double v118 = 0x5555555555555555 * ((v129 - (uint64_t)v130) >> 3)
                         - 0x5555555555555555 * ((uint64_t)(*((void *)p_var0 + 1) - *(void *)p_var0) >> 3);
        goto LABEL_161;
      case 3:
        if ((v119 & 1) == 0) {
          [(VKNavCameraController *)self _addAdditionalRoutePointsToFrameToList:p_var0];
        }
        char v119 = 1;
        goto LABEL_161;
      case 4:
        id v124 = objc_loadWeakRetained((id *)&self->_cameraMode);
        double v125 = (void *)[v124 styleAttributeCoordinateRanges];

        int8x8_t v126 = (int8x8_t)v125[1];
        if (!*(void *)&v126) {
          goto LABEL_161;
        }
        uint8x8_t v127 = (uint8x8_t)vcnt_s8(v126);
        v127.i16[0] = vaddlv_u8(v127);
        if (v127.u32[0] > 1uLL)
        {
          uint64_t v128 = 65644;
          if (*(void *)&v126 <= 0x1006CuLL) {
            uint64_t v128 = 0x1006Cu % v126.i32[0];
          }
        }
        else
        {
          uint64_t v128 = (v126.i32[0] - 1) & 0x1006CLL;
        }
        double v132 = *(uint64_t ***)(*v125 + 8 * v128);
        if (!v132) {
          goto LABEL_161;
        }
        float64x2_t v133 = *v132;
        if (!*v132) {
          goto LABEL_161;
        }
        if (v127.u32[0] < 2uLL)
        {
          uint64_t v134 = *(void *)&v126 - 1;
          while (1)
          {
            uint64_t v136 = v133[1];
            if (v136 == 65644)
            {
              if (*((_DWORD *)v133 + 4) == 65644) {
                goto LABEL_191;
              }
            }
            else if ((v136 & v134) != v128)
            {
              goto LABEL_161;
            }
            float64x2_t v133 = (uint64_t *)*v133;
            if (!v133) {
              goto LABEL_161;
            }
          }
        }
        break;
      case 5:
        double v121 = self->_maxFramingDistance;
        v218[0] = MEMORY[0x1E4F143A8];
        v218[1] = 3221225472;
        v218[2] = __44__VKNavCameraController_updatePointsToFrame__block_invoke_3;
        v218[3] = &unk_1E5A96C28;
        v218[4] = self;
        [*(id *)&v121 enumeratePointsToFrameOfType:3 usingBlock:v218];
        goto LABEL_161;
      default:
        goto LABEL_161;
    }
    while (1)
    {
      unint64_t v135 = v133[1];
      if (v135 == 65644) {
        break;
      }
      if (v135 >= *(void *)&v126) {
        v135 %= *(void *)&v126;
      }
      if (v135 != v128) {
        goto LABEL_161;
      }
LABEL_180:
      float64x2_t v133 = (uint64_t *)*v133;
      if (!v133) {
        goto LABEL_161;
      }
    }
    if (*((_DWORD *)v133 + 4) != 65644) {
      goto LABEL_180;
    }
LABEL_191:
    if (!GEOPolylineCoordinateIsValid()) {
      goto LABEL_161;
    }
    uint64_t v137 = [*(id *)&self->_maxFramingDistance route];
    [v137 pointAtRouteCoordinate:*(uint64_t *)((char *)v133 + 28)];
    double v139 = v138;
    double v141 = v140;
    double v143 = v142;

    -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:", v139, v141, v143);
    unint64_t v145 = *((void *)p_var0 + 1);
    unint64_t v144 = *((void *)p_var0 + 2);
    if (v145 < v144)
    {
      *(void *)unint64_t v145 = *(void *)v222;
      *(_OWORD *)(v145 + 8) = *(_OWORD *)&v222[8];
      unint64_t v146 = v145 + 24;
      goto LABEL_209;
    }
    v147 = *(void **)p_var0;
    uint64_t v148 = v145 - *(void *)p_var0;
    unint64_t v149 = 0xAAAAAAAAAAAAAAABLL * (v148 >> 3) + 1;
    if (v149 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v211 = 0xAAAAAAAAAAAAAAABLL * (v148 >> 3);
    unint64_t v205 = v145 - *(void *)p_var0;
    unint64_t v150 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v144 - (void)v147) >> 3);
    if (2 * v150 > v149) {
      unint64_t v149 = 2 * v150;
    }
    if (v150 >= 0x555555555555555) {
      unint64_t v151 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v151 = v149;
    }
    if (v151 > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_281;
    }
    uint64_t v208 = 24 * v151;
    float v152 = (char *)operator new(24 * v151);
    unint64_t v153 = (unint64_t)&v152[24 * v211];
    *(_OWORD *)unint64_t v153 = *(_OWORD *)v222;
    *(void *)(v153 + 16) = *(void *)&v222[16];
    if ((void *)v145 == v147)
    {
      v155 = &v152[24 * v211];
    }
    else
    {
      unint64_t v154 = v145 - (void)v147 - 24;
      if (v154 < 0x168)
      {
        v155 = &v152[24 * v211];
        goto LABEL_204;
      }
      unint64_t v157 = v154 / 0x18;
      unint64_t v158 = -24 * (v154 / 0x18);
      unint64_t v159 = (unint64_t)&v152[v158 - 24 + v205];
      BOOL v161 = (unint64_t)&v152[v158 - 8 + v205] < v145 && v145 - 8 - 24 * v157 < v153;
      v155 = &v152[24 * v211];
      if (v145 - 24 * v157 - 24 < (unint64_t)&v152[v205 - 8] && v159 < v145 - 8) {
        goto LABEL_291;
      }
      if (v161) {
        goto LABEL_291;
      }
      unint64_t v163 = v157 + 1;
      unint64_t v164 = (const double *)(v145 - 48);
      unint64_t v165 = (double *)(v153 - 48);
      uint64_t v166 = v163 & 0x1FFFFFFFFFFFFFFELL;
      do
      {
        float64x2x3_t v225 = vld3q_f64(v164);
        vst3q_f64(v165, v225);
        v165 -= 6;
        v164 -= 6;
        v166 -= 2;
      }
      while (v166);
      v155 = (char *)(v153 - 24 * (v163 & 0x1FFFFFFFFFFFFFFELL));
      v145 -= 24 * (v163 & 0x1FFFFFFFFFFFFFFELL);
      if (v163 != (v163 & 0x1FFFFFFFFFFFFFFELL))
      {
LABEL_291:
        do
        {
LABEL_204:
          uint64_t v156 = *(void *)(v145 - 24);
          v145 -= 24;
          *((void *)v155 - 3) = v156;
          v155 -= 24;
          *(_OWORD *)(v155 + 8) = *(_OWORD *)(v145 + 8);
        }
        while ((void *)v145 != v147);
      }
    }
    unint64_t v146 = v153 + 24;
    *(void *)p_uint64_t var0 = v155;
    *((void *)p_var0 + 1) = v153 + 24;
    *((void *)p_var0 + 2) = &v152[v208];
    if (v147) {
      operator delete(v147);
    }
LABEL_209:
    *((void *)p_var0 + 1) = v146;
LABEL_161:
    char v116 = 1;
    uint64_t v117 = 1;
  }
  while ((v122 & 1) == 0);
  if (*(void *)&v118 != *(void *)&self->_routeFocusCoordinate.altitude._value)
  {
    self->_lastSARUpdateTime = self->_previousUpdateTime;
    self->_routeFocusCoordinate.altitude._double value = v118;
  }
}

void __44__VKNavCameraController_updatePointsToFrame__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    objc_msgSend(*(id *)(a1 + 32), "_coordinateForGeoLocation:");
  }
  else {
    memset(v25, 0, 24);
  }
  uint64_t v2 = v1 + 696;
  unint64_t v4 = *(void *)(v1 + 704);
  unint64_t v3 = *(void *)(v1 + 712);
  if (v4 >= v3)
  {
    id v6 = *(void **)v2;
    uint64_t v7 = v4 - *(void *)v2;
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (v7 >> 3) + 1;
    if (v8 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v3 - (void)v6) >> 3);
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    uint64_t v11 = 24 * v10;
    unint64_t v12 = (char *)operator new(24 * v10);
    unint64_t v13 = (unint64_t)&v12[8 * (v7 >> 3)];
    uint64_t v14 = &v12[v11];
    *(_OWORD *)unint64_t v13 = v25[0];
    *(void *)(v13 + 16) = *(void *)&v25[1];
    unint64_t v5 = v13 + 24;
    if ((void *)v4 != v6)
    {
      unint64_t v15 = v4 - (void)v6 - 24;
      if (v15 < 0x1C8) {
        goto LABEL_38;
      }
      unint64_t v16 = v15 / 0x18;
      BOOL v17 = (unint64_t)&v12[v7 - 8 - 24 * v16] >= v4 || v4 - 24 * v16 - 8 >= v13;
      BOOL v18 = !v17;
      if (v4 - 24 * v16 - 24 < (unint64_t)&v12[v7 - 8] && (unint64_t)&v12[v7 - 24 * v16 - 24] < v4 - 8) {
        goto LABEL_38;
      }
      if (v18) {
        goto LABEL_38;
      }
      unint64_t v20 = v16 + 1;
      double v21 = (const double *)(v4 - 48);
      unint64_t v22 = (double *)(v13 - 48);
      uint64_t v23 = v20 & 0x1FFFFFFFFFFFFFFELL;
      do
      {
        float64x2x3_t v26 = vld3q_f64(v21);
        vst3q_f64(v22, v26);
        v22 -= 6;
        v21 -= 6;
        v23 -= 2;
      }
      while (v23);
      v13 -= 24 * (v20 & 0x1FFFFFFFFFFFFFFELL);
      v4 -= 24 * (v20 & 0x1FFFFFFFFFFFFFFELL);
      if (v20 != (v20 & 0x1FFFFFFFFFFFFFFELL))
      {
LABEL_38:
        do
        {
          uint64_t v24 = *(void *)(v4 - 24);
          v4 -= 24;
          *(void *)(v13 - ++*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v24;
          v13 -= 24;
          *(_OWORD *)(v13 + 8) = *(_OWORD *)(v4 + 8);
        }
        while ((void *)v4 != v6);
      }
    }
    *(void *)uint64_t v2 = v13;
    *(void *)(v2 + 8) = v5;
    *(void *)(v2 + 16) = v14;
    if (v6) {
      operator delete(v6);
    }
  }
  else
  {
    *(void *)unint64_t v4 = *(void *)&v25[0];
    *(_OWORD *)(v4 + 8) = *(_OWORD *)((char *)v25 + 8);
    unint64_t v5 = v4 + 24;
  }
  *(void *)(v2 + 8) = v5;
}

void __44__VKNavCameraController_updatePointsToFrame__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    objc_msgSend(*(id *)(a1 + 32), "_coordinateForGeoLocation:");
  }
  else {
    memset(v25, 0, 24);
  }
  uint64_t v2 = v1 + 696;
  unint64_t v4 = *(void *)(v1 + 704);
  unint64_t v3 = *(void *)(v1 + 712);
  if (v4 >= v3)
  {
    id v6 = *(void **)v2;
    uint64_t v7 = v4 - *(void *)v2;
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (v7 >> 3) + 1;
    if (v8 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v3 - (void)v6) >> 3);
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    uint64_t v11 = 24 * v10;
    unint64_t v12 = (char *)operator new(24 * v10);
    unint64_t v13 = (unint64_t)&v12[8 * (v7 >> 3)];
    uint64_t v14 = &v12[v11];
    *(_OWORD *)unint64_t v13 = v25[0];
    *(void *)(v13 + 16) = *(void *)&v25[1];
    unint64_t v5 = v13 + 24;
    if ((void *)v4 != v6)
    {
      unint64_t v15 = v4 - (void)v6 - 24;
      if (v15 < 0x1C8) {
        goto LABEL_38;
      }
      unint64_t v16 = v15 / 0x18;
      BOOL v17 = (unint64_t)&v12[v7 - 8 - 24 * v16] >= v4 || v4 - 24 * v16 - 8 >= v13;
      BOOL v18 = !v17;
      if (v4 - 24 * v16 - 24 < (unint64_t)&v12[v7 - 8] && (unint64_t)&v12[v7 - 24 * v16 - 24] < v4 - 8) {
        goto LABEL_38;
      }
      if (v18) {
        goto LABEL_38;
      }
      unint64_t v20 = v16 + 1;
      double v21 = (const double *)(v4 - 48);
      unint64_t v22 = (double *)(v13 - 48);
      uint64_t v23 = v20 & 0x1FFFFFFFFFFFFFFELL;
      do
      {
        float64x2x3_t v26 = vld3q_f64(v21);
        vst3q_f64(v22, v26);
        v22 -= 6;
        v21 -= 6;
        v23 -= 2;
      }
      while (v23);
      v13 -= 24 * (v20 & 0x1FFFFFFFFFFFFFFELL);
      v4 -= 24 * (v20 & 0x1FFFFFFFFFFFFFFELL);
      if (v20 != (v20 & 0x1FFFFFFFFFFFFFFELL))
      {
LABEL_38:
        do
        {
          uint64_t v24 = *(void *)(v4 - 24);
          v4 -= 24;
          *(void *)(v13 - ++*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v24;
          v13 -= 24;
          *(_OWORD *)(v13 + 8) = *(_OWORD *)(v4 + 8);
        }
        while ((void *)v4 != v6);
      }
    }
    *(void *)uint64_t v2 = v13;
    *(void *)(v2 + 8) = v5;
    *(void *)(v2 + 16) = v14;
    if (v6) {
      operator delete(v6);
    }
  }
  else
  {
    *(void *)unint64_t v4 = *(void *)&v25[0];
    *(_OWORD *)(v4 + 8) = *(_OWORD *)((char *)v25 + 8);
    unint64_t v5 = v4 + 24;
  }
  *(void *)(v2 + 8) = v5;
}

void __44__VKNavCameraController_updatePointsToFrame__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    objc_msgSend(*(id *)(a1 + 32), "_coordinateForGeoLocation:");
  }
  else {
    memset(v25, 0, 24);
  }
  uint64_t v2 = v1 + 696;
  unint64_t v4 = *(void *)(v1 + 704);
  unint64_t v3 = *(void *)(v1 + 712);
  if (v4 >= v3)
  {
    id v6 = *(void **)v2;
    uint64_t v7 = v4 - *(void *)v2;
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (v7 >> 3) + 1;
    if (v8 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v3 - (void)v6) >> 3);
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    uint64_t v11 = 24 * v10;
    unint64_t v12 = (char *)operator new(24 * v10);
    unint64_t v13 = (unint64_t)&v12[8 * (v7 >> 3)];
    uint64_t v14 = &v12[v11];
    *(_OWORD *)unint64_t v13 = v25[0];
    *(void *)(v13 + 16) = *(void *)&v25[1];
    unint64_t v5 = v13 + 24;
    if ((void *)v4 != v6)
    {
      unint64_t v15 = v4 - (void)v6 - 24;
      if (v15 < 0x1C8) {
        goto LABEL_38;
      }
      unint64_t v16 = v15 / 0x18;
      BOOL v17 = (unint64_t)&v12[v7 - 8 - 24 * v16] >= v4 || v4 - 24 * v16 - 8 >= v13;
      BOOL v18 = !v17;
      if (v4 - 24 * v16 - 24 < (unint64_t)&v12[v7 - 8] && (unint64_t)&v12[v7 - 24 * v16 - 24] < v4 - 8) {
        goto LABEL_38;
      }
      if (v18) {
        goto LABEL_38;
      }
      unint64_t v20 = v16 + 1;
      double v21 = (const double *)(v4 - 48);
      unint64_t v22 = (double *)(v13 - 48);
      uint64_t v23 = v20 & 0x1FFFFFFFFFFFFFFELL;
      do
      {
        float64x2x3_t v26 = vld3q_f64(v21);
        vst3q_f64(v22, v26);
        v22 -= 6;
        v21 -= 6;
        v23 -= 2;
      }
      while (v23);
      v13 -= 24 * (v20 & 0x1FFFFFFFFFFFFFFELL);
      v4 -= 24 * (v20 & 0x1FFFFFFFFFFFFFFELL);
      if (v20 != (v20 & 0x1FFFFFFFFFFFFFFELL))
      {
LABEL_38:
        do
        {
          uint64_t v24 = *(void *)(v4 - 24);
          v4 -= 24;
          *(void *)(v13 - ++*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v24;
          v13 -= 24;
          *(_OWORD *)(v13 + 8) = *(_OWORD *)(v4 + 8);
        }
        while ((void *)v4 != v6);
      }
    }
    *(void *)uint64_t v2 = v13;
    *(void *)(v2 + 8) = v5;
    *(void *)(v2 + 16) = v14;
    if (v6) {
      operator delete(v6);
    }
  }
  else
  {
    *(void *)unint64_t v4 = *(void *)&v25[0];
    *(_OWORD *)(v4 + 8) = *(_OWORD *)((char *)v25 + 8);
    unint64_t v5 = v4 + 24;
  }
  *(void *)(v2 + 8) = v5;
}

- (void)_addWaypointToFraming:(id)a3 forRoute:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  double v66 = self;
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = v7;
  if (*(void *)&self->_isElevatedRoute)
  {
    unint64_t v9 = [v7 waypointDisplayInfoForWaypoint:v6];
    unint64_t v10 = [v9 waypointCaption];
    id v11 = [v10 stringWithDefaultOptions];
    unint64_t v12 = (const char *)[v11 UTF8String];
    unint64_t v13 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v14 = [v13 localeIdentifier];
    md::StringWithLocaleImp<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>::StringWithLocaleImp((uint64_t)v60, v12, (const char *)[v14 UTF8String]);

    md::LabelMetrics::boundingRectForItem((uint64_t)&v58, *(unsigned __int8 ***)&self->_isElevatedRoute, 1, (uint64_t)v60);
    if (v59)
    {
      [(VKNavCameraController *)self restingCameraFrame];
      unint64_t v15 = [v6 location];
      [v15 coordinate];
      double v17 = v16;
      BOOL v18 = [v6 location];
      [v18 coordinate];
      double v20 = v19;
      double v21 = [v6 location];
      double v22 = 0.0;
      if ([v21 hasAltitude])
      {
        uint64_t v23 = [v6 location];
        int v24 = [v23 altitude];

        double v22 = (double)v24;
      }

      [(VKCameraController *)self camera];
      [(VKCameraController *)self camera];
      gdc::ViewDataAccess::worldViewProjectionMatrix((uint64_t)&v46, v44, v57);
      float64x2x3_t v26 = v54;
      double v27 = v54[23].f64[1] * v54[23].f64[0];
      float64x2_t v28 = 0uLL;
      if (v27 != 0.0)
      {
        if (LOBYTE(v54->f64[0]) - 1 >= 3)
        {
          if (!LOBYTE(v54->f64[0]))
          {
            long double v33 = tan(v17 * 0.00872664626 + 0.785398163);
            v28.f64[0] = log(v33);
            double v27 = v20 * 0.00277777778 + 0.5;
            v28.f64[0] = v28.f64[0] * 0.159154943 + 0.5;
            double v25 = v22 * 0.0000000249532021;
          }
        }
        else
        {
          __double2 v29 = __sincos_stret(v17 * 0.0174532925);
          double v30 = 6378137.0 / sqrt(v29.__sinval * v29.__sinval * -0.00669437999 + 1.0);
          double v31 = (v30 + v22) * v29.__cosval;
          __double2 v32 = __sincos_stret(v20 * 0.0174532925);
          double v27 = v31 * v32.__cosval;
          v28.f64[0] = v31 * v32.__sinval;
          double v25 = (v22 + v30 * 0.99330562) * v29.__sinval;
        }
        float64x2_t v34 = vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v52, v46, v27), v48, v28.f64[0]), v50, v25), 0.5 / (v53 + v47 * v27 + v49 * v28.f64[0] + v51 * v25));
        __asm { FMOV            V1.2D, #0.5 }
        *(void *)&v40.f64[0] = *(_OWORD *)&vaddq_f64(v34, _Q1);
        v40.f64[1] = vsubq_f64(_Q1, v34).f64[1];
        float64x2_t v28 = vmulq_f64(v40, v26[23]);
      }
      float64x2_t v56 = v28;
      if (v45 && !atomic_fetch_add(&v45->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)())v45->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v45);
      }
      unint64_t v41 = v55;
      if (v55 && !atomic_fetch_add(&v55->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
        std::__shared_weak_count::__release_weak(v41);
      }
      unint64_t v68 = 0;
      unint64_t v42 = operator new(0x20uLL);
      *unint64_t v42 = &unk_1EF56C8B8;
      v42[1] = &v66;
      v42[2] = &v56;
      v42[3] = v57;
      unint64_t v68 = v42;
      unsigned int v43 = HIDWORD(v58);
      v46.f64[0] = *((float64_t *)&v58 + 1);
      std::__function::__func<-[VKNavCameraController _addWaypointToFraming:forRoute:]::$_0,std::allocator<-[VKNavCameraController _addWaypointToFraming:forRoute:]::$_0>,void ()(gm::Matrix<float,2,1> &)>::operator()((uint64_t)v42, (float32x2_t *)&v46);
      *(void *)&v46.f64[0] = __PAIR64__(v43, v58);
      if (!v68
        || ((*(void (**)(void *, float64x2_t *))(*v68 + 48))(v68, &v46),
            *(int32x2_t *)&v46.f64[0] = vrev64_s32(*(int32x2_t *)((char *)&v58 + 4)),
            !v68)
        || ((*(void (**)(void *, float64x2_t *))(*v68 + 48))(v68, &v46),
            *(void *)&v46.f64[0] = v58,
            !v68))
      {
        std::__throw_bad_function_call[abi:nn180100]();
        __break(1u);
      }
      (*(void (**)(void *, float64x2_t *))(*v68 + 48))(v68, &v46);
      if (v68 == v67)
      {
        (*(void (**)(void *))(v67[0] + 32))(v67);
        if ((SHIBYTE(v64) & 0x80000000) == 0)
        {
LABEL_24:
          if ((SHIBYTE(v61) & 0x80000000) == 0) {
            goto LABEL_25;
          }
LABEL_28:
          (*(void (**)(uint64_t, void, uint64_t))(*(void *)v62 + 40))(v62, v60[0], v61 & 0x7FFFFFFFFFFFFFFFLL);
          goto LABEL_25;
        }
LABEL_27:
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v65 + 40))(v65, v63, v64 & 0x7FFFFFFFFFFFFFFFLL);
        if ((SHIBYTE(v61) & 0x80000000) == 0) {
          goto LABEL_25;
        }
        goto LABEL_28;
      }
      if (v68) {
        (*(void (**)(void *))(*v68 + 40))(v68);
      }
    }
    if ((SHIBYTE(v64) & 0x80000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_27;
  }
LABEL_25:
}

- (void)_addWaypointToFraming:forRoute:
{
}

- (__n128)_addWaypointToFraming:forRoute:
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_1EF56C8B8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

- (BOOL)_addStepToFraming:(unint64_t)a3 forRoute:(id)a4
{
  id v95 = a4;
  id v6 = [v95 stepAtIndex:a3];
  float64x2_t v93 = v6;
  unsigned int v7 = [v6 startRouteCoordinate];
  int latitude_low = LODWORD(self->_locationCoordinate.latitude);
  if (latitude_low + 1 > v7) {
    unsigned int v9 = latitude_low + 1;
  }
  else {
    unsigned int v9 = v7;
  }
  unsigned int v94 = [v6 endRouteCoordinate];
  if (*(double *)&self->_enablePan > 0.0)
  {
    [(VKNavCameraController *)self distanceToManeuver:a3];
    double v11 = v10;
    double v12 = *(double *)&self->_enablePan;
    if (v11 > v12)
    {
      if (v9 <= v94)
      {
        while (1)
        {
          unsigned int v43 = v9;
          [v95 stepDistanceFromPoint:*(void *)&self->_locationCoordinate.latitude toPoint:v9];
          double v45 = v44;
          double v12 = *(double *)&self->_enablePan;
          if (v45 > v12) {
            goto LABEL_81;
          }
          [v95 pointWithAltitudeCorrectionAtIndex:v9];
          -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:");
          p_unint64_t var0 = &self->_currentStyleName.__r_.var0;
          unint64_t var0 = self->_currentStyleName.var0;
          begin = self->_coordinatesToFrame.__begin_;
          if (var0 >= (unint64_t)begin) {
            break;
          }
          *(void *)unint64_t var0 = *(void *)v96;
          *(_OWORD *)(var0 + 8) = *(_OWORD *)&v96[8];
          int64_t v42 = var0 + 24;
LABEL_46:
          self->_currentStyleName.unint64_t var0 = v42;
          unsigned int v9 = v43 + 1;
          if (v43 + 1 > v94)
          {
            double v12 = *(double *)&self->_enablePan;
            goto LABEL_81;
          }
        }
        double v49 = *(unsigned char **)p_var0;
        uint64_t v50 = var0 - *(void *)p_var0;
        unint64_t v51 = 0xAAAAAAAAAAAAAAABLL * (v50 >> 3) + 1;
        if (v51 > 0xAAAAAAAAAAAAAAALL) {
          abort();
        }
        unint64_t v52 = 0xAAAAAAAAAAAAAAABLL * ((begin - v49) >> 3);
        if (2 * v52 > v51) {
          unint64_t v51 = 2 * v52;
        }
        if (v52 >= 0x555555555555555) {
          unint64_t v53 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v53 = v51;
        }
        if (v53 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_120;
        }
        uint64_t v54 = (char *)operator new(24 * v53);
        unint64_t v55 = &v54[8 * (v50 >> 3)];
        *(_OWORD *)unint64_t v55 = *(_OWORD *)v96;
        *((void *)v55 + 2) = *(void *)&v96[16];
        if ((unsigned char *)var0 == v49)
        {
          uint64_t v57 = &v54[8 * (v50 >> 3)];
          goto LABEL_62;
        }
        unint64_t v56 = var0 - (void)v49 - 24;
        if (v56 >= 0x168)
        {
          unint64_t v59 = v56 / 0x18;
          unint64_t v60 = -24 * (v56 / 0x18) + v50;
          unint64_t v61 = (unint64_t)&v54[v60 - 24];
          unint64_t v62 = var0 - 24 * (v56 / 0x18) - 24;
          unint64_t v63 = var0 - 8 - 24 * (v56 / 0x18);
          BOOL v65 = (unint64_t)&v54[v60 - 8] < var0 && v63 < (unint64_t)v55;
          uint64_t v57 = &v54[8 * (v50 >> 3)];
          if ((v62 >= (unint64_t)&v54[v50 - 8] || v61 >= var0 - 8) && !v65)
          {
            unint64_t v67 = v59 + 1;
            unint64_t v68 = (const double *)(var0 - 48);
            uint64_t v69 = (double *)(v55 - 48);
            uint64_t v70 = v67 & 0x1FFFFFFFFFFFFFFELL;
            do
            {
              float64x2x3_t v98 = vld3q_f64(v68);
              vst3q_f64(v69, v98);
              v69 -= 6;
              v68 -= 6;
              v70 -= 2;
            }
            while (v70);
            uint64_t v57 = &v55[-24 * (v67 & 0x1FFFFFFFFFFFFFFELL)];
            var0 -= 24 * (v67 & 0x1FFFFFFFFFFFFFFELL);
            if (v67 == (v67 & 0x1FFFFFFFFFFFFFFELL))
            {
LABEL_62:
              int64_t v42 = (int64_t)(v55 + 24);
              *(void *)p_unint64_t var0 = v57;
              self->_currentStyleName.unint64_t var0 = (int64_t)(v55 + 24);
              self->_coordinatesToFrame.__begin_ = &v54[24 * v53];
              if (v49) {
                operator delete(v49);
              }
              goto LABEL_46;
            }
          }
        }
        else
        {
          uint64_t v57 = &v54[8 * (v50 >> 3)];
        }
        do
        {
          uint64_t v58 = *(void *)(var0 - 24);
          var0 -= 24;
          *((void *)v57 - 3) = v58;
          v57 -= 24;
          *(_OWORD *)(v57 + 8) = *(_OWORD *)(var0 + 8);
        }
        while ((unsigned char *)var0 != v49);
        goto LABEL_62;
      }
LABEL_81:
      [(VKNavCameraController *)self routeCoordinateAtDistance:v12];
      id v14 = v93;
      if (*(double *)v96 == -3.14159265 && *(double *)&v96[8] == -3.14159265 && *(double *)&v96[16] == 0.0)
      {
LABEL_102:
        BOOL v13 = 1;
        goto LABEL_103;
      }
      double v71 = &self->_currentStyleName.__r_.var0;
      unint64_t v73 = self->_currentStyleName.var0;
      double v72 = self->_coordinatesToFrame.__begin_;
      if (v73 < (unint64_t)v72)
      {
        *(_OWORD *)unint64_t v73 = *(_OWORD *)v96;
        *(void *)(v73 + 16) = *(void *)&v96[16];
        double v74 = (void *)(v73 + 24);
LABEL_101:
        *((void *)v71 + 1) = v74;
        goto LABEL_102;
      }
      double v75 = *(unsigned char **)v71;
      uint64_t v76 = v73 - *(void *)v71;
      unint64_t v77 = 0xAAAAAAAAAAAAAAABLL * (v76 >> 3) + 1;
      if (v77 > 0xAAAAAAAAAAAAAAALL) {
        abort();
      }
      unint64_t v78 = 0xAAAAAAAAAAAAAAABLL * ((v72 - v75) >> 3);
      if (2 * v78 > v77) {
        unint64_t v77 = 2 * v78;
      }
      if (v78 >= 0x555555555555555) {
        unint64_t v79 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v79 = v77;
      }
      if (v79 > 0xAAAAAAAAAAAAAAALL) {
LABEL_120:
      }
        std::__throw_bad_array_new_length[abi:nn180100]();
      unint64_t v80 = (char *)operator new(24 * v79);
      unint64_t v81 = &v80[8 * (v76 >> 3)];
      *(void *)unint64_t v81 = *(void *)v96;
      *((void *)v81 + 1) = *(void *)&v96[8];
      *((void *)v81 + 2) = *(void *)&v96[16];
      double v74 = v81 + 24;
      if ((unsigned char *)v73 == v75)
      {
        id v14 = v93;
        goto LABEL_99;
      }
      unint64_t v82 = v73 - (void)v75 - 24;
      if (v82 >= 0x1C8)
      {
        unint64_t v85 = v82 / 0x18;
        BOOL v87 = (unint64_t)&v80[v76 - 8 - 24 * v85] < v73 && v73 - 24 * v85 - 8 < (unint64_t)v81;
        BOOL v88 = v73 - 24 * v85 - 24 >= (unint64_t)&v80[v76 - 8]
           || (unint64_t)&v80[v76 - 24 * v85 - 24] >= v73 - 8;
        id v14 = v93;
        if (v88 && !v87)
        {
          unint64_t v89 = v85 + 1;
          BOOL v90 = (const double *)(v73 - 48);
          unint64_t v91 = (double *)(v81 - 48);
          uint64_t v92 = v89 & 0x1FFFFFFFFFFFFFFELL;
          do
          {
            float64x2x3_t v99 = vld3q_f64(v90);
            vst3q_f64(v91, v99);
            v91 -= 6;
            v90 -= 6;
            v92 -= 2;
          }
          while (v92);
          v81 -= 24 * (v89 & 0x1FFFFFFFFFFFFFFELL);
          v73 -= 24 * (v89 & 0x1FFFFFFFFFFFFFFELL);
          if (v89 == (v89 & 0x1FFFFFFFFFFFFFFELL))
          {
LABEL_99:
            *(void *)double v71 = v81;
            *((void *)v71 + 1) = v74;
            *((void *)v71 + 2) = &v80[24 * v79];
            if (v75) {
              operator delete(v75);
            }
            goto LABEL_101;
          }
        }
      }
      else
      {
        id v14 = v93;
      }
      do
      {
        uint64_t v83 = *(void *)(v73 - 24);
        v73 -= 24;
        *((void *)v81 - 3) = v83;
        v81 -= 24;
        *(_OWORD *)(v81 + 8) = *(_OWORD *)(v73 + 8);
      }
      while ((unsigned char *)v73 != v75);
      goto LABEL_99;
    }
  }
  if (v9 <= v94)
  {
    while (1)
    {
      [v95 pointWithAltitudeCorrectionAtIndex:v9];
      -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:");
      double v16 = &self->_currentStyleName.__r_.var0;
      unint64_t v18 = self->_currentStyleName.var0;
      double v17 = self->_coordinatesToFrame.__begin_;
      if (v18 >= (unint64_t)v17) {
        break;
      }
      *(void *)unint64_t v18 = *(void *)v96;
      *(_OWORD *)(v18 + 8) = *(_OWORD *)&v96[8];
      int64_t v15 = v18 + 24;
LABEL_10:
      self->_currentStyleName.unint64_t var0 = v15;
      if (++v9 > v94) {
        goto LABEL_7;
      }
    }
    double v19 = *(unsigned char **)v16;
    uint64_t v20 = v18 - *(void *)v16;
    unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (v20 >> 3) + 1;
    if (v21 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((v17 - v19) >> 3);
    if (2 * v22 > v21) {
      unint64_t v21 = 2 * v22;
    }
    if (v22 >= 0x555555555555555) {
      unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v23 = v21;
    }
    if (v23 > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_120;
    }
    int v24 = (char *)operator new(24 * v23);
    double v25 = &v24[8 * (v20 >> 3)];
    *(_OWORD *)double v25 = *(_OWORD *)v96;
    *((void *)v25 + 2) = *(void *)&v96[16];
    if ((unsigned char *)v18 == v19)
    {
      double v27 = &v24[8 * (v20 >> 3)];
    }
    else
    {
      unint64_t v26 = v18 - (void)v19 - 24;
      if (v26 >= 0x168)
      {
        unint64_t v30 = v26 / 0x18;
        unint64_t v31 = -24 * (v26 / 0x18) + v20;
        unint64_t v32 = (unint64_t)&v24[v31 - 24];
        unint64_t v33 = v18 - 24 * (v26 / 0x18) - 24;
        unint64_t v34 = v18 - 8 - 24 * (v26 / 0x18);
        BOOL v36 = (unint64_t)&v24[v31 - 8] < v18 && v34 < (unint64_t)v25;
        double v27 = &v24[8 * (v20 >> 3)];
        if ((v33 >= (unint64_t)&v24[v20 - 8] || v32 >= v18 - 8) && !v36)
        {
          unint64_t v38 = v30 + 1;
          uint64_t v39 = (const double *)(v18 - 48);
          float64x2_t v40 = (double *)(v25 - 48);
          uint64_t v41 = v38 & 0x1FFFFFFFFFFFFFFELL;
          do
          {
            float64x2x3_t v97 = vld3q_f64(v39);
            vst3q_f64(v40, v97);
            v40 -= 6;
            v39 -= 6;
            v41 -= 2;
          }
          while (v41);
          double v27 = &v25[-24 * (v38 & 0x1FFFFFFFFFFFFFFELL)];
          v18 -= 24 * (v38 & 0x1FFFFFFFFFFFFFFELL);
          if (v38 == (v38 & 0x1FFFFFFFFFFFFFFELL)) {
            goto LABEL_25;
          }
        }
      }
      else
      {
        double v27 = &v24[8 * (v20 >> 3)];
      }
      do
      {
        uint64_t v28 = *(void *)(v18 - 24);
        v18 -= 24;
        *((void *)v27 - 3) = v28;
        v27 -= 24;
        *(_OWORD *)(v27 + 8) = *(_OWORD *)(v18 + 8);
      }
      while ((unsigned char *)v18 != v19);
    }
LABEL_25:
    __double2 v29 = &v24[24 * v23];
    int64_t v15 = (int64_t)(v25 + 24);
    *(void *)double v16 = v27;
    self->_currentStyleName.unint64_t var0 = (int64_t)(v25 + 24);
    self->_coordinatesToFrame.__begin_ = v29;
    if (v19) {
      operator delete(v19);
    }
    goto LABEL_10;
  }
LABEL_7:
  BOOL v13 = 0;
  id v14 = v93;
LABEL_103:

  return v13;
}

- (void)updateManeuversToFrame
{
  unsigned int end_low = LOBYTE(self->_coordinatesToFrame.__end_);
  BYTE1(self->_coordinatesToFrame.__end_) = end_low;
  if (LOBYTE(self->_locationCoordinate.longitude))
  {
    unsigned __int8 v4 = [*(id *)&self->_maxFramingDistance groupedManeuverCount];
    unsigned int end_low = v4;
    if ((v4 & 0xFE) == 0) {
      unsigned int end_low = 1;
    }
    BYTE1(self->_coordinatesToFrame.__end_) = end_low;
  }
  if (BYTE1(self->_locationCoordinate.longitude) < end_low) {
    LOBYTE(end_low) = BYTE1(self->_locationCoordinate.longitude);
  }
  BYTE1(self->_coordinatesToFrame.__end_) = end_low;
}

- (Coordinate3D<geo::Radians,)routeCoordinateAtDistance:(double)a3
{
  id v6 = v3;
  p_locationCoordinate = &self->_locationCoordinate;
  float v8 = *((float *)&self->_locationCoordinate.latitude + 1);
  unsigned int v9 = [*(id *)&self->_maxFramingDistance route];
  double v10 = v9;
  if (v8 >= 0.0) {
    uint64_t v11 = [v9 coordinateAtOffset:*(void *)&p_locationCoordinate->latitude fromRouteCoordinate:a3];
  }
  else {
    uint64_t v11 = [v9 coordinateAtOffset:a3];
  }
  uint64_t v12 = v11;

  BOOL v13 = [*(id *)&self->_maxFramingDistance route];
  [v13 pointAtRouteCoordinate:v12];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  if (v17 >= -180.0 && v17 <= 180.0 && v15 >= -90.0 && v15 <= 90.0)
  {
    -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:", v15, v17, v19);
  }
  else
  {
    int64x2_t v25 = vdupq_n_s64(0xC00921FB54442D18);
    *id v6 = v25;
    v6[1].i64[0] = 0;
  }
  result.latitude = *(Unit<geo::RadianUnitDescription, double> *)v25.i8;
  result.altitude = *(Unit<geo::MeterUnitDescription, double> *)&v21;
  result.longitude = *(Unit<geo::RadianUnitDescription, double> *)&v20;
  return result;
}

- (Coordinate3D<geo::Radians,)routeLocationAtDistance:(double)a3 fromManeuver:(unint64_t)a4
{
  float v8 = v4;
  id v36 = [*(id *)&self->_maxFramingDistance route];
  unint64_t v9 = [v36 stepsCount];

  if (v9 <= a4)
  {
    id v37 = [*(id *)&self->_maxFramingDistance route];
    a4 = [v37 stepsCount] - 1;
  }
  double v10 = [*(id *)&self->_maxFramingDistance route];
  id v38 = [v10 stepAtIndex:a4];

  uint64_t v11 = [v38 endRouteCoordinate];
  uint64_t v12 = [*(id *)&self->_maxFramingDistance route];
  [v12 pointAtRouteCoordinate:v11];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  id v19 = objc_alloc(MEMORY[0x1E4F649D8]);
  double v20 = [*(id *)&self->_maxFramingDistance route];
  double v21 = [*(id *)&self->_maxFramingDistance route];
  [v21 courseAtRouteCoordinateIndex:v11];
  double v23 = v22;
  int v24 = [MEMORY[0x1E4F1C9C8] date];
  int64x2_t v25 = objc_msgSend(v19, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v20, v11, a4, v24, v14, v16, v18, v23);

  [v25 setIsGoodMatch:0];
  unint64_t v26 = [*(id *)&self->_maxFramingDistance route];
  [v26 locationAtDistance:v25 from:a3];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  if (v30 < -180.0 || v30 > 180.0 || v28 < -90.0 || v28 > 90.0)
  {
    *float v8 = vdupq_n_s64(0xC00921FB54442D18);
    v8[1].i64[0] = 0;
  }
  else
  {
    -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:", v28, v30, v32);
  }

  result.altitude = *(Unit<geo::MeterUnitDescription, double> *)&v35;
  result.longitude = *(Unit<geo::RadianUnitDescription, double> *)&v34;
  result.latitude = *(Unit<geo::RadianUnitDescription, double> *)&v33;
  return result;
}

- (double)distanceToManeuver:(unint64_t)a3
{
  unint64_t v5 = [*(id *)&self->_maxFramingDistance route];
  unint64_t v6 = [v5 stepsCount];

  if (v6 <= a3)
  {
    unsigned int v7 = [*(id *)&self->_maxFramingDistance route];
    a3 = [v7 stepsCount] - 1;
  }
  float v8 = [*(id *)&self->_maxFramingDistance route];
  unint64_t v9 = [v8 stepAtIndex:a3];

  uint64_t v10 = [v9 endRouteCoordinate];
  uint64_t v11 = [*(id *)&self->_maxFramingDistance route];
  [v11 stepDistanceFromPoint:*(void *)&self->_locationCoordinate.latitude toPoint:v10];
  double v13 = v12;

  return v13;
}

- (void)updateSpringsForTrackingCamera
{
  *(int64x2_t *)&self->_routeCoordinate.index = vdupq_n_s64(0xC00921FB54442D18);
  self->_routeFocusCoordinate.latitude._double value = 0.0;
  self->_pitchSpring._double restingPosition = self->_cameraPitch._value;
  p_headingSpring = &self->_headingSpring;
  [(VKNavCameraController *)self calculateHeading];
  p_headingSpring->_double restingPosition = v6;
  self->_distanceFromTargetSpring._double restingPosition = self->_cameraDistanceFromTarget._value;
  [(VKNavCameraController *)self puckScreenPoint];
  self->_screenPositionSpring._restingPosition._e[0] = v4;
  self->_screenPositionSpring._restingPosition._e[1] = v5;
  [(VKNavCameraController *)self _updateForAnimatedEdgeInsets];
}

- (Box<double,)calculateViewableScreenRect
{
  [(VKCameraController *)self edgeInsets];
  -[VKNavCameraController calculateViewableScreenRectForEdgeInsets:](self, "calculateViewableScreenRectForEdgeInsets:");
  result._maximum._e[1] = v6;
  result._maximum._e[0] = v5;
  result._minimum._e[1] = v4;
  result._minimum._e[0] = v3;
  return result;
}

- (Box<double,)calculateViewableScreenRectForEdgeInsets:(VKEdgeInsets)a3
{
  float right = a3.right;
  float bottom = a3.bottom;
  float left = a3.left;
  float top = a3.top;
  float v8 = [(VKCameraController *)self canvas];
  [v8 size];
  double v10 = v9;
  double v12 = v11;

  if (v10 * v12 <= 0.0)
  {
    double v17 = -1.79769313e308;
    double v15 = 1.79769313e308;
    double v16 = 1.79769313e308;
    double v19 = -1.79769313e308;
  }
  else
  {
    [(VKNavCameraController *)self _currentRoadSignOffset];
    float v14 = v13 + bottom;
    double v15 = left;
    double v16 = top;
    double v17 = v10 - right;
    double v18 = v14;
    double v19 = v12 - v14;
    if (v17 < left || v19 < v16)
    {
      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = v10;
      double v19 = v12;
    }
    else
    {
      double v21 = self->_previousMapEdgeInsets.left
          + (v17 - v15) * self->_framingEdgeInset.left
          + self->_framingEdgeInsetProportional.left;
      double v22 = self->_previousMapEdgeInsets.right
          + (v17 - v15) * self->_framingEdgeInset.right
          + self->_framingEdgeInsetProportional.right;
      double v23 = v19 - v16;
      double v24 = self->_previousMapEdgeInsets.top
          + (v19 - v16) * self->_framingEdgeInset.top
          + self->_framingEdgeInsetProportional.top;
      double v25 = self->_previousMapEdgeInsets.bottom
          + (v19 - v16) * self->_framingEdgeInset.bottom
          + self->_framingEdgeInsetProportional.bottom;
      if (v21 + 25.0 > v17 - v15 - v22)
      {
        double v26 = (v21 + 25.0 - (v17 - v15) + v22) * 0.5 + 12.5;
        double v21 = v21 - v26;
        double v22 = v22 - v26;
      }
      if (v25 + 25.0 > v23 - v24)
      {
        double v27 = (v24 - v23 + v25 + 25.0) * 0.5 + 12.5;
        double v25 = v25 - v27;
        double v24 = v24 - v27;
      }
      double v28 = fmax(v22, -right);
      double v29 = fmax(v21, -v15) + v15;
      double v30 = fmax(v24, -v18) + v16;
      double v31 = v19 - fmax(v25, -v16);
      if (v17 - v28 >= v29 && v31 >= v30)
      {
        double v15 = v29;
        double v16 = v30;
        double v17 = v17 - v28;
        double v19 = v31;
      }
    }
  }
  result._maximum._e[1] = v19;
  result._maximum._e[0] = v17;
  result._minimum._e[1] = v16;
  result._minimum._e[0] = v15;
  return result;
}

- (Unit<geo::RadianUnitDescription,)calculateHeading
{
  double v4 = v2;
  int v5 = [(VKNavCameraController *)self cameraHeadingType];
  if (v5 == 3)
  {
    float v8 = [*(id *)&self->_maxFramingDistance route];
    if (v8)
    {
      double v9 = objc_msgSend(v8, "stepAtIndex:", objc_msgSend(*(id *)&self->_maxFramingDistance, "currentStepIndex"));
      objc_msgSend(v8, "pointAtRouteCoordinate:", objc_msgSend(v9, "startRouteCoordinate"));
      objc_msgSend(v8, "pointAt:", objc_msgSend(v8, "pointCount") - 1);
      GEOBearingFromCoordinateToCoordinate();
      long double v11 = fmod(v10, 360.0);
      long double v6 = fmod(v11 + 360.0, 360.0) * -0.0174532925;
    }
    else
    {
      long double v6 = 0.0;
    }
LABEL_27:

    goto LABEL_28;
  }
  if (v5 == 2)
  {
    if (*(double *)&self->_routeCoordinate != -3.14159265
      || *(double *)&self->_frameAllGroupedManeuvers != -3.14159265
      || self->_routeFocusCoordinate.latitude._value != 0.0)
    {
      GEOBearingFromCoordinateToCoordinate();
      long double v13 = fmod(v12, 360.0);
      double restingPosition = fmod(v13 + 360.0, 360.0) * -0.0174532925;
LABEL_11:
      long double v14 = fmod(self->_puckCourse._value, 6.28318531);
      long double v6 = fmod(v14 + 6.28318531, 6.28318531);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraMode);
      int v16 = [WeakRetained navigationState];

      double v17 = [*(id *)&self->_maxFramingDistance routeMatch];
      float v8 = v17;
      if (v16 == 2)
      {
        if (v17)
        {
          if ([v17 isGoodMatch])
          {
            p_locationCoordinate = &self->_locationCoordinate;
            if (*((float *)&self->_locationCoordinate.latitude + 1) >= 0.0)
            {
              unsigned int latitude_low = LODWORD(p_locationCoordinate->latitude);
              double v20 = [*(id *)&self->_maxFramingDistance route];
              unsigned int v21 = [v20 pointCount];

              if (latitude_low < v21)
              {
                double v22 = [*(id *)&self->_maxFramingDistance route];
                uint64_t v23 = [v22 coordinateAtOffset:*(void *)&p_locationCoordinate->latitude fromRouteCoordinate:5.0];

                double v24 = [*(id *)&self->_maxFramingDistance route];
                [v24 pointAtRouteCoordinate:v23];
                double v26 = v25;
                double v28 = v27;

                if (v28 >= -180.0 && v28 <= 180.0 && v26 >= -90.0 && v26 <= 90.0)
                {
                  GEOBearingFromCoordinateToCoordinate();
                  long double v30 = fmod(-v29, 360.0);
                  long double v6 = fmod(v30 + 360.0, 360.0) * 0.0174532925;
                }
              }
            }
          }
        }
      }
      long double v31 = fmod(restingPosition + 3.14159265 - v6, 6.28318531);
      double v32 = fmod(v31 + 6.28318531, 6.28318531) + -3.14159265;
      double value = self->_headingMinDelta._value;
      if (v32 <= -value || v32 >= value)
      {
        long double v35 = fmod(fmin(fmax(v32, -self->_headingDelta._value), self->_headingDelta._value) + v6, 6.28318531);
        long double v6 = fmod(v35 + 6.28318531, 6.28318531);
      }
      goto LABEL_27;
    }
LABEL_4:
    double restingPosition = self->_headingSpring._restingPosition;
    goto LABEL_11;
  }
  long double v6 = 0.0;
  if (v5 == 1) {
    goto LABEL_4;
  }
LABEL_28:
  long double v36 = fmod(v6, 6.28318531);
  v37._double value = fmod(v36 + 6.28318531, 6.28318531);
  *double v4 = v37._value;
  return v37;
}

- (void)stop
{
  double v3 = [(VKCameraController *)self runLoopController];
  v3->var1 = -1;
  uint64_t var0 = (uint64_t)v3->var0;
  if (var0 && !**(unsigned char **)(var0 + 1056)) {
    md::MapEngine::setDisplayRate(var0, -1);
  }
  [*(id *)&self->_maxFramingDistance removeObserver:self];
  BYTE4(self->_previousSearchItemCount) = 0;
  [(VKNavCameraController *)self _setDetached:1];
  [(VKNavCameraController *)self updatePuckOffset:1];
  [(VKCameraController *)self endRegionChange];
  if (LOBYTE(self->_showConsole._key.key.identifier))
  {
    uint64_t v5 = [(VKCameraController *)self canvas];
    if (v5)
    {
      long double v6 = (void *)v5;
      unsigned int v7 = [(VKCameraController *)self canvas];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        double v9 = [(VKCameraController *)self canvas];
        long double v10 = (ggl::DebugConsole *)[v9 debugConsoleForId:7];

        if (v10) {
          ggl::DebugConsole::begin(v10);
        }
        long double v11 = [(VKCameraController *)self canvas];
        long double v12 = (ggl::DebugConsole *)[v11 debugConsoleForId:8];

        if (v12) {
          ggl::DebugConsole::begin(v12);
        }
      }
    }
  }
  if (LOBYTE(self->_pixelSamples._avg)) {
    LOBYTE(self->_pixelSamples._avg) = 0;
  }
  *(_OWORD *)&self->_cornerCoordinates[3].longitude._double value = 0u;
  *(_OWORD *)&self->_pixelSamples._min = 0u;
  self->_pixelSamples._idx = 0u;
  *(_OWORD *)self->_pixelSamples._samples.__elems_ = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[2] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[4] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[6] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[8] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[10] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[12] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[14] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[16] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[18] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[20] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[22] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[24] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[26] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[28] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[30] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[32] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[34] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[36] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[38] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[40] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[42] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[44] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[46] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[48] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[50] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[52] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[54] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[56] = 0u;
  int64x2_t v13 = vdupq_n_s64(0xC00921FB54442D18);
  *(int64x2_t *)&self->_depthNear = v13;
  *(_OWORD *)&self->_cornerCoordinates[0].latitude._double value = xmmword_1A28FF780;
  *(_OWORD *)&self->_cornerCoordinates[0].altitude._double value = xmmword_1A28FEA70;
  *(int64x2_t *)&self->_cornerCoordinates[1].longitude._double value = v13;
  *(_OWORD *)&self->_cornerCoordinates[2].latitude._double value = xmmword_1A28FF780;
  *(_OWORD *)&self->_cornerCoordinates[2].altitude._double value = xmmword_1A28FEA70;
  self->_requesteDisplayRateSampler._avg = 0.0;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[58] = 0u;
  *(_OWORD *)&self->_requesteDisplayRateSampler._min = 0u;
}

- (BOOL)isRotateEnabled
{
  return 1;
}

- (BOOL)isPitchEnabled
{
  return 1;
}

- (BOOL)_canZoomOut
{
  [(VKNavCameraController *)self zoomScale];
  return v3 < self->_maxZoomScale + -0.001;
}

- (BOOL)_canZoomIn
{
  [(VKNavCameraController *)self zoomScale];
  return v3 > self->_minZoomScale + 0.001;
}

- (double)topDownMinimumZoomLevel
{
  double v3 = [(VKCameraController *)self vkCamera];
  [v3 maxHeightNoPitch];
  double v5 = v4;

  long double v6 = [(VKCameraController *)self vkCamera];
  [v6 widthOfViewAtDepth:v5];
  long double v8 = v7;

  double result = 0.0;
  if (v8 > 0.0)
  {
    [(VKNavCameraController *)self _normalizedZoomLevelForDisplayZoomLevel:(double)-log2(v8)];
    return ceil(v10 * 1000.0) * 0.001;
  }
  return result;
}

- (double)currentZoomLevel
{
  double v3 = [(VKCameraController *)self vkCamera];
  double v4 = [v3 footprint];
  [v4 nearestGroundPoint];
  double v27 = v5;
  double v7 = v6;
  double v9 = v8;

  double v10 = [(VKCameraController *)self vkCamera];
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
  long double v24 = v23;

  if (v24 <= 0.0) {
    return 0.0;
  }
  double v25 = -log2(v24);
  [(VKNavCameraController *)self _normalizedZoomLevelForDisplayZoomLevel:v25];
  return result;
}

- (double)maximumZoomLevel
{
  double v3 = [(VKCameraController *)self vkCamera];
  [v3 minHeight];
  double v5 = v4;

  double v6 = [(VKCameraController *)self vkCamera];
  [v6 widthOfViewAtDepth:v5];
  long double v8 = v7;

  double result = 0.0;
  if (v8 > 0.0)
  {
    [(VKNavCameraController *)self _normalizedZoomLevelForDisplayZoomLevel:(double)-log2(v8)];
    return floor(v10 * 1000.0) * 0.001;
  }
  return result;
}

- (double)minimumZoomLevel
{
  double v3 = [(VKCameraController *)self vkCamera];
  [v3 maxHeight];
  double v5 = v4;

  double v6 = [(VKCameraController *)self vkCamera];
  [v6 widthOfViewAtDepth:v5];
  long double v8 = v7;

  double result = 0.0;
  if (v8 > 0.0)
  {
    [(VKNavCameraController *)self _normalizedZoomLevelForDisplayZoomLevel:(double)-log2(v8)];
    return ceil(v10 * 1000.0) * 0.001;
  }
  return result;
}

- (double)_normalizedZoomLevelForDisplayZoomLevel:(double)a3
{
  double v5 = [(VKCameraController *)self canvas];
  [v5 size];
  double v7 = v6;

  double v8 = 0.0;
  if (v7 > 0.0)
  {
    double v9 = [(VKCameraController *)self canvas];
    [v9 size];
    double v11 = v10;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
    double v8 = log2(v11 / (float)[WeakRetained tileSize]);
  }
  return v8 + a3;
}

- (BOOL)canEnter3DMode
{
  return 1;
}

- (void)setNavContext:(id)a3
{
  id v5 = a3;
  double maxFramingDistance = self->_maxFramingDistance;
  id v7 = v5;
  if (*(id *)&maxFramingDistance != v5)
  {
    [*(id *)&maxFramingDistance removeObserver:self];
    objc_storeStrong((id *)&self->_maxFramingDistance, a3);
    [*(id *)&self->_maxFramingDistance addObserver:self];
    [(VKNavCameraController *)self navContextStateDidChange:v7];
  }
}

- (void)returnToPuck
{
  [(VKNavCameraController *)self returnToTrackingWithDelay:1 resetZoom:0.0];
}

- (void)returnToTrackingWithDelay:(double)a3 resetZoom:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(VKAnimation *)self->_transitionAnimation running])
  {
    if (self->_isDetached
      || v4
      && (([(VKNavCameraController *)self zoomScale],
           double v26 = fabs(v25 + -1.0),
           v26 > fabs(v25 + 1.0) * 2.22044605e-14)
        ? (BOOL v27 = v26 < 2.22507386e-308)
        : (BOOL v27 = 1),
          !v27))
    {
      double v32 = a3;
      [(VKNavCameraController *)self stopSnappingAnimations];
      [(VKAnimation *)self->_transitionAnimation stop];
      transitionAnimation = self->_transitionAnimation;
      self->_transitionAnimation = 0;

      double v8 = [[VKTimedAnimation alloc] initWithDuration:1.0];
      double v9 = self->_transitionAnimation;
      self->_transitionAnimation = v8;

      [(VKTimedAnimation *)self->_transitionAnimation setTimingFunction:VKAnimationCurveEaseInOut];
      double value = self->_cameraFrame._target.latitude._value;
      double v11 = self->_cameraFrame._target.longitude._value;
      double v12 = self->_cameraFrame._target.altitude._value;
      double v13 = self->_cameraFrame._distanceFromTarget._value;
      double v15 = self->_cameraFrame._pitch._value;
      double v14 = self->_cameraFrame._heading._value;
      double v16 = self->_cameraFrame._roll._value;
      self->_transitionFrame._target.latitude._double value = value;
      self->_transitionFrame._target.longitude._double value = v11;
      self->_transitionFrame._target.altitude._double value = v12;
      self->_transitionFrame._distanceFromTarget._double value = v13;
      self->_transitionFrame._pitch._double value = v15;
      self->_transitionFrame._heading._double value = v14;
      self->_transitionFrame._roll._double value = v16;
      BOOL v17 = [(VKNavCameraController *)self _canZoomIn];
      BOOL v18 = [(VKNavCameraController *)self _canZoomOut];
      objc_initWeak(&location, self);
      [(VKNavCameraController *)self zoomScale];
      double v20 = v19;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3321888768;
      v41[2] = __61__VKNavCameraController_returnToTrackingWithDelay_resetZoom___block_invoke;
      void v41[3] = &unk_1EF58DB50;
      objc_copyWeak(v42, &location);
      v42[1] = *(id *)&value;
      v42[2] = *(id *)&v11;
      v42[3] = *(id *)&v12;
      v42[4] = *(id *)&v13;
      v42[5] = *(id *)&v15;
      v42[6] = *(id *)&v14;
      BOOL v43 = v4;
      v42[7] = *(id *)&v16;
      v42[8] = v20;
      [(VKTimedAnimation *)self->_transitionAnimation setStepHandler:v41];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __61__VKNavCameraController_returnToTrackingWithDelay_resetZoom___block_invoke_29;
      v37[3] = &unk_1E5A96C00;
      objc_copyWeak(&v38, &location);
      BOOL v39 = v17;
      BOOL v40 = v18;
      [(VKAnimation *)self->_transitionAnimation setCompletionHandler:v37];
      if (v32 <= 0.0)
      {
        if (GEOGetVectorKitVKNavCameraLog_onceToken != -1) {
          dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_41);
        }
        double v28 = (id)GEOGetVectorKitVKNavCameraLog_log;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1A1780000, v28, OS_LOG_TYPE_INFO, "Returning to tracking", buf, 2u);
        }

        [(VKNavCameraController *)self _setDetached:0];
        [(VKNavCameraController *)self _setNavCameraTransitionComplete:0];
        [(VKCameraController *)self beginRegionChange:1];
        md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->_transitionAnimation->super);
        [(VKCameraController *)self endRegionChange];
        double v29 = [(VKCameraController *)self runLoopController];
        uint64_t v30 = [(VKCameraController *)self maxDisplayRate];
        v29->var1 = v30;
        uint64_t var0 = (uint64_t)v29->var0;
        if (v29->var0)
        {
          if (!**(unsigned char **)(var0 + 1056)) {
            md::MapEngine::setDisplayRate(var0, v30);
          }
        }
        [(VKNavCameraController *)self stopIgnoreStyleChange];
      }
      else
      {
        double v21 = self->_transitionAnimation;
        dispatch_time_t v22 = dispatch_time(0, (uint64_t)(v32 * 1000000000.0));
        double v23 = **(NSObject ***)&self->_desiredZoomScale;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __61__VKNavCameraController_returnToTrackingWithDelay_resetZoom___block_invoke_30;
        block[3] = &unk_1E5A99EC0;
        long double v35 = v21;
        long double v36 = self;
        long double v24 = v21;
        dispatch_after(v22, v23, block);
      }
      objc_destroyWeak(&v38);
      objc_destroyWeak(v42);
      objc_destroyWeak(&location);
    }
  }
}

void __61__VKNavCameraController_returnToTrackingWithDelay_resetZoom___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v5 = *(double *)(a1 + 72);
    double v6 = *(double *)(a1 + 80);
    uint64_t v7 = *(void *)(a1 + 88);
    *(double *)&long long v4 = a2;
    long long v14 = v4;
    long double v8 = fmod(3.14159265 - v6 + *((double *)WeakRetained + 29), 6.28318531);
    long double v9 = fmod(v8 + 6.28318531, 6.28318531);
    long double v10 = fmod(v6 + (v9 + -3.14159265) * *(double *)&v14, 6.28318531);
    long double v11 = fmod(v10 + 6.28318531, 6.28318531);
    double v12 = v5 + (*((double *)WeakRetained + 28) - v5) * *(double *)&v14;
    float64x2_t v13 = vmlaq_n_f64(*(float64x2_t *)(a1 + 56), vsubq_f64(*((float64x2_t *)WeakRetained + 13), *(float64x2_t *)(a1 + 56)), *(double *)&v14);
    *(float64x2_t *)(WeakRetained + 616) = vmlaq_n_f64(*(float64x2_t *)(a1 + 40), vsubq_f64(*((float64x2_t *)WeakRetained + 12), *(float64x2_t *)(a1 + 40)), *(double *)&v14);
    *(float64x2_t *)(WeakRetained + 632) = v13;
    *((double *)WeakRetained + 81) = v12;
    *((long double *)WeakRetained + 82) = v11;
    *((void *)WeakRetained + 83) = v7;
    if (*(unsigned char *)(a1 + 104)) {
      [WeakRetained setZoomScale:*(double *)(a1 + 96) + (1.0 - *(double *)(a1 + 96)) * *(double *)&v14];
    }
    objc_msgSend(WeakRetained, "_setNeedsUpdate", v14);
  }
}

void __61__VKNavCameraController_returnToTrackingWithDelay_resetZoom___block_invoke_29(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateObserverCouldZoomIn:*(unsigned __int8 *)(a1 + 40) couldZoomOut:*(unsigned __int8 *)(a1 + 41)];
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_41);
    }
    double v6 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = "N";
      if (a2) {
        uint64_t v7 = "Y";
      }
      int v9 = 136315138;
      long double v10 = v7;
      _os_log_impl(&dword_1A1780000, v6, OS_LOG_TYPE_INFO, "transition animation completed: %s", (uint8_t *)&v9, 0xCu);
    }

    if (a2)
    {
      [v5 _setDetached:0];
      [v5 _setNavCameraTransitionComplete:1];
      long double v8 = (void *)v5[74];
      v5[74] = 0;

      [v5 _snapPitch];
      [v5 _snapHeading];
    }
  }
}

uint64_t __61__VKNavCameraController_returnToTrackingWithDelay_resetZoom___block_invoke_30(uint64_t result)
{
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 592))
  {
    uint64_t v1 = result;
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_41);
    }
    uint64_t v2 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_1A1780000, v2, OS_LOG_TYPE_INFO, "Returning to tracking", v6, 2u);
    }

    [*(id *)(v1 + 40) _setDetached:0];
    [*(id *)(v1 + 40) _setNavCameraTransitionComplete:0];
    [*(id *)(v1 + 40) beginRegionChange:1];
    md::AnimationRunner::runAnimation((md::MapEngine **)[*(id *)(v1 + 40) animationRunner], *(VKAnimation **)(*(void *)(v1 + 40) + 592));
    [*(id *)(v1 + 40) endRegionChange];
    double v3 = (uint64_t *)[*(id *)(v1 + 40) runLoopController];
    uint64_t v4 = [*(id *)(v1 + 40) maxDisplayRate];
    v3[1] = v4;
    uint64_t v5 = *v3;
    if (*v3)
    {
      if (!**(unsigned char **)(v5 + 1056)) {
        md::MapEngine::setDisplayRate(v5, v4);
      }
    }
    return [*(id *)(v1 + 40) stopIgnoreStyleChange];
  }
  return result;
}

- (void)animateCameraWithDuration:(float)a3 fromFrame:(const void *)a4 completionHandler:(id)a5
{
  id v8 = a5;
  [(VKNavCameraController *)self stopSnappingAnimations];
  [(VKAnimation *)self->_transitionAnimation stop];
  transitionAnimation = self->_transitionAnimation;
  self->_transitionAnimation = 0;

  long double v10 = [[VKTimedAnimation alloc] initWithDuration:a3];
  uint64_t v11 = self->_transitionAnimation;
  self->_transitionAnimation = v10;

  [(VKTimedAnimation *)self->_transitionAnimation setTimingFunction:VKAnimationCurveEaseInOut];
  long long v13 = *((_OWORD *)a4 + 1);
  long long v12 = *((_OWORD *)a4 + 2);
  long long v14 = *(_OWORD *)a4;
  self->_transitionFrame._roll._double value = *((double *)a4 + 6);
  *(_OWORD *)&self->_transitionFrame._target.altitude._double value = v13;
  *(_OWORD *)&self->_transitionFrame._pitch._double value = v12;
  *(_OWORD *)&self->_transitionFrame._target.latitude._double value = v14;
  [(VKNavCameraController *)self setZoomScale:1.0];
  *(int64x2_t *)&self->_routeCoordinate.index = vdupq_n_s64(0xC00921FB54442D18);
  self->_routeFocusCoordinate.latitude._double value = 0.0;
  double value = self->_puckCourse._value;
  self->_headingSpring._double restingPosition = value;
  self->_headingSpring._position = value;
  self->_headingSpring._velocity = 0.0;
  [(VKNavCameraController *)self updateCameraState];
  [(VKNavCameraController *)self resetSpringsToResting];
  objc_initWeak(&location, self);
  [(VKNavCameraController *)self stopIgnoreStyleChange];
  v25[0] = 0;
  v25[1] = v25;
  _OWORD v25[2] = 0x2020000000;
  v25[3] = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __79__VKNavCameraController_animateCameraWithDuration_fromFrame_completionHandler___block_invoke;
  v23[3] = &unk_1E5A96BD8;
  objc_copyWeak(&v24, &location);
  v23[4] = v25;
  [(VKTimedAnimation *)self->_transitionAnimation setStepHandler:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__VKNavCameraController_animateCameraWithDuration_fromFrame_completionHandler___block_invoke_2;
  v20[3] = &unk_1E5A98E30;
  objc_copyWeak(&v22, &location);
  id v16 = v8;
  id v21 = v16;
  [(VKAnimation *)self->_transitionAnimation setCompletionHandler:v20];
  [(VKNavCameraController *)self _setDetached:0];
  [(VKNavCameraController *)self _setNavCameraTransitionComplete:LOBYTE(self->_sceneQuery.__cntrl_) == 0];
  [(VKCameraController *)self beginRegionChange:1];
  md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->_transitionAnimation->super);
  [(VKCameraController *)self endRegionChange];
  BOOL v17 = [(VKCameraController *)self runLoopController];
  uint64_t v18 = [(VKCameraController *)self maxDisplayRate];
  v17->var1 = v18;
  uint64_t var0 = (uint64_t)v17->var0;
  if (v17->var0 && !**(unsigned char **)(var0 + 1056)) {
    md::MapEngine::setDisplayRate(var0, v18);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  _Block_object_dispose(v25, 8);
  objc_destroyWeak(&location);
}

void __79__VKNavCameraController_animateCameraWithDuration_fromFrame_completionHandler___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    double v6 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (vabdd_f64(1.0, v6) > 0.00001)
    {
      [WeakRetained restingCameraFrame];
      double v7 = (a2 - v6) / (1.0 - v6);
      double v8 = v5[78];
      v5[77] = v5[77] + (v16 - v5[77]) * v7;
      v5[78] = v8 + (v17 - v8) * v7;
      double v9 = v5[80];
      v5[79] = v5[79] + (v18 - v5[79]) * v7;
      v5[80] = v9 + (v19 - v9) * v7;
      double v10 = v5[82];
      float v11 = v7;
      double v12 = v11;
      long double v13 = fmod(3.14159265 - v10 + v21, 6.28318531);
      long double v14 = fmod(v13 + 6.28318531, 6.28318531);
      long double v15 = fmod(v10 + (v14 + -3.14159265) * v12, 6.28318531);
      v5[82] = fmod(v15 + 6.28318531, 6.28318531);
      v5[81] = v5[81] + (v20 - v5[81]) * v7;
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
      [v5 resetSpringsToResting];
      [v5 _setNeedsUpdate];
    }
  }
}

void __79__VKNavCameraController_animateCameraWithDuration_fromFrame_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[80];
    WeakRetained[51] = v6;
    WeakRetained[49] = v6;
    WeakRetained[50] = 0;
    uint64_t v7 = WeakRetained[81];
    WeakRetained[41] = v7;
    WeakRetained[39] = v7;
    WeakRetained[40] = 0;
    uint64_t v8 = WeakRetained[82];
    WeakRetained[46] = v8;
    WeakRetained[44] = v8;
    WeakRetained[45] = 0;
    [WeakRetained _setNeedsUpdate];
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_41);
    }
    double v9 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      double v10 = "N";
      if (a2) {
        double v10 = "Y";
      }
      int v13 = 136315138;
      long double v14 = v10;
      _os_log_impl(&dword_1A1780000, v9, OS_LOG_TYPE_INFO, "transition animation completed: %s", (uint8_t *)&v13, 0xCu);
    }

    if (a2)
    {
      float v11 = (void *)v5[74];
      v5[74] = 0;

      [v5 _setNavCameraTransitionComplete:1];
      [v5 _snapPitch];
      [v5 _snapHeading];
    }
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, a2);
    }
  }
}

- (CameraFrame<geo::Radians,)restingCameraFrame
{
  retstr->_roll._double value = 0.0;
  p_puckCoordinate = &self->_puckCoordinate;
  *(_OWORD *)&retstr->_target.latitude._double value = *(_OWORD *)&self->_puckCoordinate.latitude._value;
  double value = self->_puckCoordinate.altitude._value;
  double restingPosition = self->_headingSpring._restingPosition;
  double v8 = self->_pitchSpring._restingPosition;
  retstr->_pitch._double value = v8;
  retstr->_heading._double value = restingPosition;
  double v9 = self->_distanceFromTargetSpring._restingPosition;
  retstr->_target.altitude._double value = value;
  retstr->_distanceFromTarget._double value = v9;
  double minHeightDeltaChangeVertical = self->_minHeightDeltaChangeVertical;
  Matrix<double, 2, 1> v21 = self->_screenPositionSpring._restingPosition;
  double v11 = v8;
  float v12 = v8;
  float v13 = expf((float)(v12 * -10.0) + 7.5);
  v14.f64[0] = v21._e[0];
  v14.f64[1] = v21._e[1] + minHeightDeltaChangeVertical * 0.636619772 * (v11 + (float)(-0.5 / (float)(v13 + 1.0)));
  float64x2_t v22 = v14;
  BOOL v25 = **(unsigned __int8 **)([(VKCameraController *)self mapDataAccess] + 16) - 4 < 0xFFFFFFFD;
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v23, (uint64_t)[(VKCameraController *)self mapDataAccess], (uint64_t)retstr, &v25, v22);
  if (v25 && (v23.f64[0] != -3.14159265 || v23.f64[1] != -3.14159265 || v24 != 0.0))
  {
    __asm { FMOV            V2.2D, #-2.0 }
    *(float64x2_t *)&retstr->_target.latitude._double value = vnegq_f64(vmlaq_f64(v23, _Q2, *(float64x2_t *)&p_puckCoordinate->latitude._value));
  }
  return result;
}

- (CameraFrame<geo::Radians,)currentCameraFrame
{
  retstr->_roll._double value = 0.0;
  p_puckCoordinate = &self->_puckCoordinate;
  *(_OWORD *)&retstr->_target.latitude._double value = *(_OWORD *)&self->_puckCoordinate.latitude._value;
  double position = self->_headingSpring._position;
  retstr->_target.altitude._double value = self->_puckCoordinate.altitude._value;
  double v7 = self->_pitchSpring._position;
  retstr->_pitch._double value = v7;
  retstr->_heading._double value = position;
  double v8 = self->_distanceFromTargetSpring._position;
  retstr->_distanceFromTarget._double value = v8;
  [(VKNavCameraController *)self zoomScale];
  double v10 = v9 * v8;
  Matrix<double, 2, 1> v20 = self->_screenPositionSpring._position;
  double minHeightDeltaChangeVertical = self->_minHeightDeltaChangeVertical;
  retstr->_distanceFromTarget._double value = v10;
  *(float *)&double v10 = v7;
  float v12 = expf((float)(*(float *)&v10 * -10.0) + 7.5);
  v13.f64[0] = v20._e[0];
  v13.f64[1] = v20._e[1] + minHeightDeltaChangeVertical * 0.636619772 * (v7 + (float)(-0.5 / (float)(v12 + 1.0)));
  float64x2_t v21 = v13;
  BOOL v24 = **(unsigned __int8 **)([(VKCameraController *)self mapDataAccess] + 16) - 4 < 0xFFFFFFFD;
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v22, (uint64_t)[(VKCameraController *)self mapDataAccess], (uint64_t)retstr, &v24, v21);
  if (v24 && (v22.f64[0] != -3.14159265 || v22.f64[1] != -3.14159265 || v23 != 0.0))
  {
    __asm { FMOV            V2.2D, #-2.0 }
    *(float64x2_t *)&retstr->_target.latitude._double value = vnegq_f64(vmlaq_f64(v22, _Q2, *(float64x2_t *)&p_puckCoordinate->latitude._value));
  }
  return result;
}

- (double)pitch
{
  return self->_cameraFrame._pitch._value * 57.2957795;
}

- (double)heading
{
  return self->_cameraFrame._heading._value * -57.2957795;
}

- (double)altitude
{
  double value = self->_cameraFrame._distanceFromTarget._value;
  return cos(self->_cameraFrame._pitch._value) * value;
}

- (double)distanceFromCenterCoordinate
{
  return self->_cameraFrame._distanceFromTarget._value;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double v2 = self->_cameraFrame._target.latitude._value * 57.2957795;
  double v3 = self->_cameraFrame._target.longitude._value * 57.2957795;
  result.var1 = v3;
  result.uint64_t var0 = v2;
  return result;
}

- (BOOL)_springsNeedUpdate
{
  BOOL result = vabdd_f64(self->_pitchSpring._position, self->_pitchSpring._restingPosition) > 0.00001
        || (long double v3 = fmod(3.14159265 - self->_headingSpring._restingPosition + self->_headingSpring._position, 6.28318531),
            fabs(fmod(v3 + 6.28318531, 6.28318531) + -3.14159265) >= 0.001)
        || vabdd_f64(self->_distanceFromTargetSpring._position, self->_distanceFromTargetSpring._restingPosition) > 1.0;
  return result;
}

- (void)_updateSprings:(double)a3
{
  double previousUpdateTime = self->_previousUpdateTime;
  double v6 = fmax(previousUpdateTime, a3) - previousUpdateTime;
  if (previousUpdateTime >= 0.0 && v6 <= 1.0)
  {
    double restingPosition = self->_pitchSpring._restingPosition;
    double kSpring = self->_pitchSpring._kSpring;
    double position = self->_pitchSpring._position;
    double velocity = self->_pitchSpring._velocity;
    double kDamper = self->_pitchSpring._kDamper;
    double v13 = velocity + -(velocity * kDamper - (restingPosition - position) * kSpring) * (v6 * 0.5);
    double v14 = v6;
    double v48 = v6 * -0.5;
    double v49 = v6 * 0.5;
    double v15 = -(v13 * kDamper - (restingPosition - position + velocity * (v6 * -0.5)) * kSpring);
    double v16 = velocity + v15 * v49;
    double v17 = velocity + -(v16 * kDamper - (restingPosition - position + v13 * v48) * kSpring) * v14;
    double v46 = v14;
    double v47 = v14 * 0.166666667;
    self->_pitchSpring._double position = position + (velocity + (v16 + v13) * 2.0 + v17) * (v14 * 0.166666667);
    self->_pitchSpring._double velocity = velocity
                                 - -((restingPosition - (position + v16 * v14)) * kSpring
                                   - (velocity * kDamper
                                    - (restingPosition - position) * kSpring)
                                   + (v15 - (v16 * kDamper - (restingPosition - position + v13 * v48) * kSpring)) * 2.0
                                   - v17 * kDamper)
                                 * (v14
                                  * 0.166666667);
    gdc::Spring<double,1,(gdc::SpringType)1>::update(&self->_headingSpring._position, v14);
    double v19 = self->_distanceFromTargetSpring._restingPosition;
    double v18 = self->_distanceFromTargetSpring._kSpring;
    double v20 = self->_distanceFromTargetSpring._position;
    double v21 = self->_distanceFromTargetSpring._velocity;
    double v22 = self->_distanceFromTargetSpring._kDamper;
    double v23 = v21 + -(v21 * v22 - (v19 - v20) * v18) * v49;
    double v24 = -(v23 * v22 - (v19 - v20 + v21 * v48) * v18);
    double v25 = v21 + v24 * v49;
    double v26 = v21 + -(v25 * v22 - (v19 - v20 + v23 * v48) * v18) * v46;
    self->_distanceFromTargetSpring._double position = v20 + (v21 + (v25 + v23) * 2.0 + v26) * v47;
    self->_distanceFromTargetSpring._double velocity = v21
                                              - -((v19 - (v20 + v25 * v46)) * v18
                                                - (v21 * v22
                                                 - (v19 - v20) * v18)
                                                + (v24 - (v25 * v22 - (v19 - v20 + v23 * v48) * v18)) * 2.0
                                                - v26 * v22)
                                              * v47;
    double v27 = self->_screenPositionSpring._kSpring;
    double v28 = self->_screenPositionSpring._kDamper;
    Matrix<double, 2, 1> v30 = self->_screenPositionSpring._velocity;
    Matrix<double, 2, 1> v29 = self->_screenPositionSpring._restingPosition;
    Matrix<double, 2, 1> v31 = self->_screenPositionSpring._position;
    float64x2_t v32 = vsubq_f64((float64x2_t)v29, (float64x2_t)v31);
    float64x2_t v33 = vmlaq_n_f64(vnegq_f64(vmulq_n_f64((float64x2_t)v30, v28)), v32, v27);
    float64x2_t v34 = vmlaq_n_f64((float64x2_t)v30, v33, v49);
    float64x2_t v35 = vmlaq_n_f64(vnegq_f64(vmulq_n_f64(v34, v28)), vmlaq_n_f64(v32, (float64x2_t)v30, v48), v27);
    float64x2_t v36 = vmlaq_n_f64((float64x2_t)v30, v35, v49);
    float64x2_t v37 = vmlaq_n_f64(vnegq_f64(vmulq_n_f64(v36, v28)), vmlaq_n_f64(v32, v34, v48), v27);
    float64x2_t v38 = vmlaq_n_f64((float64x2_t)v30, v37, v46);
    float64x2_t v39 = vsubq_f64((float64x2_t)v29, vmlaq_n_f64((float64x2_t)v31, v36, v46));
    float64x2_t v40 = vaddq_f64(v36, v34);
    __asm { FMOV            V16.2D, #2.0 }
    self->_screenPositionSpring._double position = (Matrix<double, 2, 1>)vmlaq_n_f64((float64x2_t)v31, vaddq_f64(vmlaq_f64((float64x2_t)v30, _Q16, v40), v38), v47);
    self->_screenPositionSpring._double velocity = (Matrix<double, 2, 1>)vmlsq_lane_f64((float64x2_t)v30, vmlaq_n_f64(vnegq_f64(vmlaq_f64(vmlaq_n_f64(v33, v39, v27), _Q16, vaddq_f64(v35, v37))), v38, v28), v47, 0);
  }
  else
  {
    [(VKNavCameraController *)self resetSpringsToResting];
  }
  self->_double previousUpdateTime = a3;
}

- (Matrix<double,)puckScreenPoint
{
  p_double minHeightDeltaChangeVertical = &self->_minHeightDeltaChangeVertical;
  v3.f64[0] = self->_puckMovementBoundsMin._e[0];
  v3.f64[1] = 1.0 - self->_puckMovementBoundsMin._e[1];
  float64x2_t v4 = vld1q_dup_f64(p_minHeightDeltaChangeVertical);
  float64x2_t v5 = vminnmq_f64(vmaxnmq_f64(vmlaq_f64(*(float64x2_t *)&self->_maxHeightDeltaChangeVertical, v3, vsubq_f64((float64x2_t)self->_viewableScreenRect._minimum, *(float64x2_t *)&self->_maxHeightDeltaChangeVertical)), vaddq_f64(*(float64x2_t *)&self->_maxHeightDeltaChangeVertical, v4)), vsubq_f64((float64x2_t)self->_viewableScreenRect._minimum, v4));
  double v6 = v5.f64[1];
  result._e[0] = v5.f64[0];
  result._e[1] = v6;
  return result;
}

- (BOOL)_hasRunningAnimation
{
  if ([(VKAnimation *)self->_transitionAnimation running]
    || [(VKAnimation *)self->_snapHeadingAnimation running])
  {
    return 1;
  }
  snapPitchAnimation = self->_snapPitchAnimation;
  return [(VKAnimation *)snapPitchAnimation running];
}

- (double)_calculateMaxPixelChangeAndUpdateCorners
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  Matrix<double, 2, 1> minimum = self->_viewableScreenRect._minimum;
  double halfPuckSize = self->_halfPuckSize;
  *(double *)double v25 = self->_maxHeightDeltaChangeVertical;
  *(int8x16_t *)&v25[8] = vextq_s8((int8x16_t)minimum, (int8x16_t)minimum, 8uLL);
  *(double *)&v25[24] = halfPuckSize;
  p_depthNear = &self->_depthNear;
  unsigned long long v20 = __PAIR128__(*(unint64_t *)&halfPuckSize, *(unint64_t *)v25);
  float64x2_t v22 = (float64x2_t)minimum;
  if (self->_depthNear == -3.14159265
    && *(double *)&self->_leftHanded == -3.14159265
    && self->_cornerCoordinates[0].latitude._value == 0.0)
  {
    double v7 = 0.0;
  }
  else
  {
    gdc::ViewDataAccess::screenPointForCoordinate(*(double **)([(VKCameraController *)self mapDataAccess]+ 16), p_depthNear, (uint64_t *)&self->_cameraFrame);
    double v7 = fmax(sqrt((*(double *)&v20 - v6) * (*(double *)&v20 - v6)+ (halfPuckSize - minimum._e[0]) * (halfPuckSize - minimum._e[0])), 0.0);
    minimum._e[1] = v22.f64[1];
  }
  double v8 = minimum._e[1];
  double v9 = [(VKCameraController *)self mapDataAccess];
  p_cameraFrame = (uint64_t *)&self->_cameraFrame;
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v23, (uint64_t)v9, (uint64_t)&self->_cameraFrame, 0, v21);
  *(_OWORD *)p_depthNear = v23;
  *((void *)p_depthNear + 2) = v24;
  if (p_depthNear[3] != -3.14159265 || p_depthNear[4] != -3.14159265 || p_depthNear[5] != 0.0)
  {
    gdc::ViewDataAccess::screenPointForCoordinate(*(double **)([(VKCameraController *)self mapDataAccess] + 16), p_depthNear + 3, p_cameraFrame);
    double v7 = fmax(v7, sqrt((v21.f64[0] - v11) * (v21.f64[0] - v11) + (v8 - v12) * (v8 - v12)));
  }
  double v13 = [(VKCameraController *)self mapDataAccess];
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v23, (uint64_t)v13, (uint64_t)p_cameraFrame, 0, *(float64x2_t *)v25);
  *(_OWORD *)(p_depthNear + 3) = v23;
  *((void *)p_depthNear + 5) = v24;
  if (p_depthNear[6] != -3.14159265 || p_depthNear[7] != -3.14159265 || p_depthNear[8] != 0.0)
  {
    gdc::ViewDataAccess::screenPointForCoordinate(*(double **)([(VKCameraController *)self mapDataAccess] + 16), p_depthNear + 6, p_cameraFrame);
    double v7 = fmax(v7, sqrt((v22.f64[0] - v14) * (v22.f64[0] - v14) + (halfPuckSize - v15) * (halfPuckSize - v15)));
  }
  double v16 = [(VKCameraController *)self mapDataAccess];
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v23, (uint64_t)v16, (uint64_t)p_cameraFrame, 0, *(float64x2_t *)&v25[16]);
  *((_OWORD *)p_depthNear + 3) = v23;
  *((void *)p_depthNear + 8) = v24;
  if (p_depthNear[9] != -3.14159265 || p_depthNear[10] != -3.14159265 || p_depthNear[11] != 0.0)
  {
    gdc::ViewDataAccess::screenPointForCoordinate(*(double **)([(VKCameraController *)self mapDataAccess] + 16), p_depthNear + 9, p_cameraFrame);
    double v7 = fmax(v7, sqrt((v22.f64[0] - v17) * (v22.f64[0] - v17) + (v8 - v18) * (v8 - v18)));
  }
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v23, (uint64_t)[(VKCameraController *)self mapDataAccess], (uint64_t)p_cameraFrame, 0, v22);
  *(_OWORD *)(p_depthNear + 9) = v23;
  *((void *)p_depthNear + 11) = v24;
  return v7;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  double v8 = *(int8x8_t **)([WeakRetained mapEngine] + 1120);
  int8x8_t v9 = v8[2];
  if (!*(void *)&v9) {
    goto LABEL_21;
  }
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
  double v12 = *(void **)(*(void *)&v8[1] + 8 * v11);
  if (!v12 || (double v13 = (void *)*v12) == 0)
  {
LABEL_21:

    goto LABEL_22;
  }
  if (v10.u32[0] < 2uLL)
  {
    uint64_t v14 = *(void *)&v9 - 1;
    while (1)
    {
      uint64_t v16 = v13[1];
      if (v16 == 0x17767EADC5B287BLL)
      {
        if (v13[2] == 0x17767EADC5B287BLL) {
          goto LABEL_46;
        }
      }
      else if ((v16 & v14) != v11)
      {
        goto LABEL_21;
      }
      double v13 = (void *)*v13;
      if (!v13) {
        goto LABEL_21;
      }
    }
  }
  while (1)
  {
    unint64_t v15 = v13[1];
    if (v15 == 0x17767EADC5B287BLL) {
      break;
    }
    if (v15 >= *(void *)&v9) {
      v15 %= *(void *)&v9;
    }
    if (v15 != v11) {
      goto LABEL_21;
    }
LABEL_11:
    double v13 = (void *)*v13;
    if (!v13) {
      goto LABEL_21;
    }
  }
  if (v13[2] != 0x17767EADC5B287BLL) {
    goto LABEL_11;
  }
LABEL_46:
  uint64_t v26 = v13[5];

  if (v26) {
    *(_DWORD *)(v26 + 288) = 2;
  }
LABEL_22:
  if (!self->_isIgnoringStyleChange || self->_previousUpdateTime - self->_ignoreStyleChangeStartTime > 10.0) {
    [(VKNavCameraController *)self stopIgnoreStyleChange];
  }
  [(VKNavCameraController *)self _updateDidNavCameraTransition];
  [(VKNavCameraController *)self _updateCameraLimits];
  [(VKNavCameraController *)self _updateSceneQuery];
  [(VKNavCameraController *)self _updateSceneStyles:1 updatePitchLimitOnly:self->_isIgnoringStyleChange];
  [(VKNavCameraController *)self _updateStyles];
  [(VKNavCameraController *)self _updateZoomScaleLimts];
  double v17 = (void *)*((void *)a4 + 1);
  int8x8_t v18 = (int8x8_t)v17[1];
  if (v18)
  {
    uint8x8_t v19 = (uint8x8_t)vcnt_s8(v18);
    v19.i16[0] = vaddlv_u8(v19);
    if (v19.u32[0] > 1uLL)
    {
      unint64_t v20 = 0x8BD499FBD96FBB9ELL;
      if (*(void *)&v18 <= 0x8BD499FBD96FBB9ELL) {
        unint64_t v20 = 0x8BD499FBD96FBB9ELL % *(void *)&v18;
      }
    }
    else
    {
      unint64_t v20 = (*(void *)&v18 - 1) & 0x8BD499FBD96FBB9ELL;
    }
    float64x2_t v21 = *(void **)(*v17 + 8 * v20);
    if (v21)
    {
      float64x2_t v22 = (void *)*v21;
      if (v22)
      {
        if (v19.u32[0] < 2uLL)
        {
          uint64_t v23 = *(void *)&v18 - 1;
          while (1)
          {
            uint64_t v25 = v22[1];
            if (v25 == 0x8BD499FBD96FBB9ELL)
            {
              if (v22[2] == 0x8BD499FBD96FBB9ELL) {
                goto LABEL_48;
              }
            }
            else if ((v25 & v23) != v20)
            {
              goto LABEL_51;
            }
            float64x2_t v22 = (void *)*v22;
            if (!v22) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v24 = v22[1];
          if (v24 == 0x8BD499FBD96FBB9ELL)
          {
            if (v22[2] == 0x8BD499FBD96FBB9ELL)
            {
LABEL_48:
              uint64_t v27 = v22[5];
              if (*(void *)(v27 + 8) == 0x8BD499FBD96FBB9ELL)
              {
                double v28 = *(unsigned char **)(v27 + 32);
                if (v28) {
                  LOBYTE(self->_requesteDisplayRateSampler._count) = *v28;
                }
              }
              break;
            }
          }
          else
          {
            if (v24 >= *(void *)&v18) {
              v24 %= *(void *)&v18;
            }
            if (v24 != v20) {
              break;
            }
          }
          float64x2_t v22 = (void *)*v22;
        }
        while (v22);
      }
    }
  }
LABEL_51:
  [(VKNavCameraController *)self _updateSprings:a3];
  if (self->_needsUpdate
    || self->_isDetached
    || [(VKCameraController *)self edgeInsetsAnimating]
    || [(VKNavCameraController *)self _hasRunningAnimation])
  {
    Matrix<double, 2, 1> v29 = [(VKCameraController *)self cameraDelegate];
    [v29 mapLayerWillChangeRegionAnimated:0];

    id v30 = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    [v30 updateWithTimestamp:a4 withContext:a3];

    int64x2_t v67 = vdupq_n_s64(0xC00921FB54442D18);
    long long v68 = 0u;
    long long v69 = 0u;
    double value = 0.0;
    if (self->_isDetached && !self->_transitionAnimation)
    {
      transitionAnimation = 0;
    }
    else
    {
      [(VKNavCameraController *)self updateCameraState];
      [(VKNavCameraController *)self currentCameraFrame];
      long long v31 = v64;
      int64x2_t v67 = v63;
      long long v68 = v64;
      long long v32 = v65;
      long long v69 = v65;
      double v33 = v66;
      double value = v66;
      *(int64x2_t *)&self->_lastCalculatedCameraFrame._target.latitude._double value = v63;
      *(_OWORD *)&self->_lastCalculatedCameraFrame._target.altitude._double value = v31;
      *(_OWORD *)&self->_lastCalculatedCameraFrame._pitch._double value = v32;
      self->_lastCalculatedCameraFrame._roll._double value = v33;
      transitionAnimation = self->_transitionAnimation;
    }
    if ([(VKAnimation *)transitionAnimation running])
    {
      long long v35 = *(_OWORD *)&self->_transitionFrame._target.altitude._value;
      int64x2_t v67 = *(int64x2_t *)&self->_transitionFrame._target.latitude._value;
      long long v68 = v35;
      long long v69 = *(_OWORD *)&self->_transitionFrame._pitch._value;
      double value = self->_transitionFrame._roll._value;
    }
    else if (self->_isDetached)
    {
      [(VKCameraController *)self camera];
      long long v36 = *(_OWORD *)(v63.i64[0] + 24);
      int64x2_t v67 = *(int64x2_t *)(v63.i64[0] + 8);
      long long v68 = v36;
      long long v69 = *(_OWORD *)(v63.i64[0] + 40);
      double value = *(double *)(v63.i64[0] + 56);
      if (v63.i64[1])
      {
        if (!atomic_fetch_add((atomic_ullong *volatile)(v63.i64[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
        {
          (*(void (**)(uint64_t))(*(void *)v63.i64[1] + 16))(v63.i64[1]);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v63.i64[1]);
        }
      }
    }
    [(VKCameraController *)self camera];
    uint64_t v37 = v63.i64[0];
    long long v38 = v68;
    *(int64x2_t *)(v63.i64[0] + 8) = v67;
    *(_OWORD *)(v37 + ++*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v38;
    *(_OWORD *)(v37 + 40) = v69;
    *(double *)(v37 + 56) = value;
    if (v63.i64[1] && !atomic_fetch_add((atomic_ullong *volatile)(v63.i64[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(uint64_t))(*(void *)v63.i64[1] + 16))(v63.i64[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v63.i64[1]);
    }
    [(VKCameraController *)self camera];
    double v39 = gdc::CameraFrame<geo::Radians,double>::toRigidTransformMercator((double *)v63.i64, (double *)v67.i64, *(unsigned char *)buf == 0);
    float64x2_t v40 = (std::__shared_weak_count *)*((void *)&buf + 1);
    if (*((void *)&buf + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&buf + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *, double))v40->__on_zero_shared)(v40, v39);
      std::__shared_weak_count::__release_weak(v40);
    }
    uint64_t v41 = [(VKCameraController *)self vkCamera];
    [v41 setPosition:&v63];

    int64_t v42 = [(VKCameraController *)self vkCamera];
    [v42 setOrientation:(char *)&v64 + 8];

    [(VKNavCameraController *)self _updateClipPlanes];
    [(VKNavCameraController *)self _updateDebugOverlay];
    [(VKNavCameraController *)self _updateDebugText];
    BOOL v43 = [(VKCameraController *)self cameraDelegate];
    [v43 mapLayerDidChangeVisibleRegion];

    long long v44 = v68;
    *(int64x2_t *)&self->_cameraFrame._target.latitude._double value = v67;
    *(_OWORD *)&self->_cameraFrame._target.altitude._double value = v44;
    *(_OWORD *)&self->_cameraFrame._pitch._double value = v69;
    self->_cameraFrame._roll._double value = value;
    if ([(VKNavCameraController *)self _springsNeedUpdate]) {
      [(VKNavCameraController *)self _setNeedsUpdate];
    }
    else {
      self->_needsUpdate = 0;
    }
    double v45 = COERCE_DOUBLE([(VKNavCameraController *)self displayRate]);
    if (*(void *)&v45 != *(void *)&self->_requesteDisplayRateSampler._sum)
    {
      self->_requesteDisplayRateSampler._double sum = v45;
      if (GEOGetVectorKitVKNavCameraLog_onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_41);
      }
      double v46 = (id)GEOGetVectorKitVKNavCameraLog_log;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        double sum = self->_requesteDisplayRateSampler._sum;
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = sum;
        _os_log_impl(&dword_1A1780000, v46, OS_LOG_TYPE_INFO, "Requested display rate changed: %ld", (uint8_t *)&buf, 0xCu);
      }
    }
    double v48 = [(VKCameraController *)self runLoopController];
    uint64_t v49 = *(void *)&self->_requesteDisplayRateSampler._sum;
    v48->var1 = v49;
    uint64_t var0 = (uint64_t)v48->var0;
    if (var0 && !**(unsigned char **)(var0 + 1056)) {
      md::MapEngine::setDisplayRate(var0, v49);
    }
    [(VKCameraController *)self edgeInsets];
    LODWORD(self->_minCameraPitch._value) = v51;
    HIDWORD(self->_minCameraPitch._value) = v52;
    LODWORD(self->_maxCameraPitch._value) = v53;
    HIDWORD(self->_maxCameraPitch._value) = v54;
    double v55 = self->_requesteDisplayRateSampler._sum;
    double v56 = (double)*(uint64_t *)&v55;
    uint64_t v57 = &self->_pixelSamples._samples.__elems_[58];
    if (*(uint64_t *)&v55 <= 0) {
      double v56 = 60.0;
    }
    double avg = self->_requesteDisplayRateSampler._avg;
    if (avg == 0.0)
    {
      *uint64_t v57 = v56;
      self->_pixelSamples._samples.__elems_[59] = v56;
      unint64_t v62 = 1;
      self->_requesteDisplayRateSampler._min = v56;
    }
    else
    {
      double v59 = fmax(self->_pixelSamples._samples.__elems_[59], v56);
      *uint64_t v57 = fmin(*v57, v56);
      self->_pixelSamples._samples.__elems_[59] = v59;
      double v60 = (double)*(unint64_t *)&avg;
      double v61 = self->_requesteDisplayRateSampler._min + v56 / (double)*(unint64_t *)&avg;
      unint64_t v62 = *(void *)&avg + 1;
      double v56 = self->_requesteDisplayRateSampler._max + v56;
      self->_requesteDisplayRateSampler._min = v61 * v60 / (double)v62;
    }
    self->_requesteDisplayRateSampler._max = v56;
    *(void *)&self->_requesteDisplayRateSampler._double avg = v62;
  }
}

- (int64_t)displayRate
{
  float64x2_t v3 = +[VKDebugSettings sharedSettings];
  uint64_t v4 = [v3 navDisplayRate];

  if (v4)
  {
    if (v4 == 2)
    {
      return 30;
    }
    else if (v4 == 3)
    {
      return 60;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return [(VKNavCameraController *)self defaultDisplayRate];
  }
}

- (int64_t)defaultDisplayRate
{
  double v3 = self->_previousUpdateTime - self->_lastSARUpdateTime;
  if (BYTE2(self->_taskContext.__cntrl_))
  {
    [(VKNavCameraController *)self _calculateMaxPixelChangeAndUpdateCorners];
    double v5 = v4;
    p_longitude = &self->_cornerCoordinates[3].longitude;
    if (LOBYTE(self->_pixelSamples._avg))
    {
      double sum = self->_pixelSamples._sum;
      double v8 = &p_longitude[*(void *)&sum];
      double value = v8[6]._value;
      v8[6]._double value = v5;
      *(void *)&self->_pixelSamples._double sum = (*(void *)&sum + 1) % 0x3CuLL;
      double v10 = fmax(self->_cornerCoordinates[3].altitude._value, v5);
      p_longitude->_double value = fmin(p_longitude->_value, v5);
      self->_cornerCoordinates[3].altitude._double value = v10;
      double v11 = self->_pixelSamples._max - value + v5;
      self->_pixelSamples._double min = v11 * 0.0166666667;
      self->_pixelSamples._max = v11;
    }
    else
    {
      LOBYTE(self->_pixelSamples._avg) = 1;
      self->_pixelSamples._double sum = 0.0;
      p_longitude->_double value = v4;
      self->_cornerCoordinates[3].altitude._double value = v4;
      self->_pixelSamples._double min = v4;
      self->_pixelSamples._max = v4 * 60.0;
      *(double *)&self->_pixelSamples._idx._hasValue = v4;
      self->_pixelSamples._idx._value.type = v4;
      self->_pixelSamples._samples.__elems_[0] = v4;
      self->_pixelSamples._samples.__elems_[1] = v4;
      self->_pixelSamples._samples.__elems_[2] = v4;
      self->_pixelSamples._samples.__elems_[3] = v4;
      self->_pixelSamples._samples.__elems_[4] = v4;
      self->_pixelSamples._samples.__elems_[5] = v4;
      self->_pixelSamples._samples.__elems_[6] = v4;
      self->_pixelSamples._samples.__elems_[7] = v4;
      self->_pixelSamples._samples.__elems_[8] = v4;
      self->_pixelSamples._samples.__elems_[9] = v4;
      self->_pixelSamples._samples.__elems_[10] = v4;
      self->_pixelSamples._samples.__elems_[11] = v4;
      self->_pixelSamples._samples.__elems_[12] = v4;
      self->_pixelSamples._samples.__elems_[13] = v4;
      self->_pixelSamples._samples.__elems_[14] = v4;
      self->_pixelSamples._samples.__elems_[15] = v4;
      self->_pixelSamples._samples.__elems_[16] = v4;
      self->_pixelSamples._samples.__elems_[17] = v4;
      self->_pixelSamples._samples.__elems_[18] = v4;
      self->_pixelSamples._samples.__elems_[19] = v4;
      self->_pixelSamples._samples.__elems_[20] = v4;
      self->_pixelSamples._samples.__elems_[21] = v4;
      self->_pixelSamples._samples.__elems_[22] = v4;
      self->_pixelSamples._samples.__elems_[23] = v4;
      self->_pixelSamples._samples.__elems_[24] = v4;
      self->_pixelSamples._samples.__elems_[25] = v4;
      self->_pixelSamples._samples.__elems_[26] = v4;
      self->_pixelSamples._samples.__elems_[27] = v4;
      self->_pixelSamples._samples.__elems_[28] = v4;
      self->_pixelSamples._samples.__elems_[29] = v4;
      self->_pixelSamples._samples.__elems_[30] = v4;
      self->_pixelSamples._samples.__elems_[31] = v4;
      self->_pixelSamples._samples.__elems_[32] = v4;
      self->_pixelSamples._samples.__elems_[33] = v4;
      self->_pixelSamples._samples.__elems_[34] = v4;
      self->_pixelSamples._samples.__elems_[35] = v4;
      self->_pixelSamples._samples.__elems_[36] = v4;
      self->_pixelSamples._samples.__elems_[37] = v4;
      self->_pixelSamples._samples.__elems_[38] = v4;
      self->_pixelSamples._samples.__elems_[39] = v4;
      self->_pixelSamples._samples.__elems_[40] = v4;
      self->_pixelSamples._samples.__elems_[41] = v4;
      self->_pixelSamples._samples.__elems_[42] = v4;
      self->_pixelSamples._samples.__elems_[43] = v4;
      self->_pixelSamples._samples.__elems_[44] = v4;
      self->_pixelSamples._samples.__elems_[45] = v4;
      self->_pixelSamples._samples.__elems_[46] = v4;
      self->_pixelSamples._samples.__elems_[47] = v4;
      self->_pixelSamples._samples.__elems_[48] = v4;
      self->_pixelSamples._samples.__elems_[49] = v4;
      self->_pixelSamples._samples.__elems_[50] = v4;
      self->_pixelSamples._samples.__elems_[51] = v4;
      self->_pixelSamples._samples.__elems_[52] = v4;
      self->_pixelSamples._samples.__elems_[53] = v4;
      self->_pixelSamples._samples.__elems_[54] = v4;
      self->_pixelSamples._samples.__elems_[55] = v4;
      self->_pixelSamples._samples.__elems_[56] = v4;
      self->_pixelSamples._samples.__elems_[57] = v4;
    }
    int64_t v13 = [(VKCameraController *)self baseDisplayRate];
    if ([(VKNavCameraController *)self _hasRunningAnimation]
      || self->_isDetached
      || [(VKCameraController *)self edgeInsetsAnimating]
      || v3 < 3.1)
    {
      int64_t v13 = [(VKCameraController *)self maxDisplayRate];
      double min = self->_pixelSamples._min;
    }
    else
    {
      double min = self->_pixelSamples._min;
      cameraManager = (LabelMetrics *)self->_cameraManager;
      uint64_t v16 = self->_labelMetrics.__ptr_.__value_;
      if (cameraManager != v16)
      {
        while (*(double *)cameraManager <= min)
        {
          cameraManager = (LabelMetrics *)((char *)cameraManager + 16);
          if (cameraManager == v16) {
            goto LABEL_13;
          }
        }
        int64_t v13 = *((void *)cameraManager + 1);
      }
    }
LABEL_13:
    printf("pixelChange: %f, avg: %f. rate: %ld\n", v5, min, v13);
    return v13;
  }
  else if ([(VKNavCameraController *)self _hasRunningAnimation] {
         || self->_isDetached
  }
         || [(VKCameraController *)self edgeInsetsAnimating]
         || v3 < 3.1)
  {
    return [(VKCameraController *)self maxDisplayRate];
  }
  else
  {
    return [(VKCameraController *)self baseDisplayRate];
  }
}

- (void)_updateClipPlanes
{
  double v3 = self->_lastProjectedPosition._e[1];
  [(VKCameraController *)self camera];
  [(VKCameraController *)self camera];
  double v4 = *(double *)(v8 + 32);
  [(VKCameraController *)self camera];
  double v5 = fmax(*(double *)(v6 + 32) * v3, 600.0);
  *(double *)(v10 + 464) = fmax(v4 * 0.01, 0.01);
  *(double *)(v10 + 472) = v5;
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v7->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v7);
  }
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v9->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v9);
  }
  if (v11)
  {
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)resetSpringsToResting
{
  self->_pitchSpring._double position = self->_pitchSpring._restingPosition;
  self->_pitchSpring._double velocity = 0.0;
  self->_headingSpring._double position = self->_headingSpring._restingPosition;
  self->_headingSpring._double velocity = 0.0;
  self->_distanceFromTargetSpring._double position = self->_distanceFromTargetSpring._restingPosition;
  self->_distanceFromTargetSpring._double velocity = 0.0;
  self->_screenPositionSpring._double position = self->_screenPositionSpring._restingPosition;
  self->_screenPositionSpring._velocity._e[0] = 0.0;
  self->_screenPositionSpring._velocity._e[1] = 0.0;
}

- (void)updateCameraState
{
  if (self->_isIgnoringStyleChange)
  {
    [(VKNavCameraController *)self calculateHeading];
    self->_headingSpring._double restingPosition = v8;
    [(VKNavCameraController *)self _updateForAnimatedEdgeInsets];
  }
  else
  {
    [(VKNavCameraController *)self calculateViewableScreenRect];
    if (v5 >= v3 && v6 >= v4)
    {
      self->_double maxHeightDeltaChangeVertical = v3;
      self->_double halfPuckSize = v4;
      self->_viewableScreenRect._minimum._e[0] = v5;
      self->_viewableScreenRect._minimum._e[1] = v6;
    }
    if (self->_cameraType == 1)
    {
      [(VKNavCameraController *)self updateSpringsForFramingCamera];
    }
    else if (!self->_cameraType)
    {
      [(VKNavCameraController *)self updateSpringsForTrackingCamera];
    }
  }
}

- (BOOL)wantsTimerTick
{
  return self->_needsUpdate;
}

- (void)projectCoordinate:(id)a3 toPoint:(CGPoint *)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  objc_msgSend(WeakRetained, "convertCoordinateToPoint:", var0, var1);
  a4->x = v7;
  a4->y = v8;
}

- (void)updateLocation:(const void *)a3 andCourse:(const void *)a4
{
  p_puckCoordinate = &self->_puckCoordinate;
  if (*(double *)a3 != self->_puckCoordinate.latitude._value
    || *((double *)a3 + 1) != self->_puckCoordinate.longitude._value
    || *((double *)a3 + 2) != self->_puckCoordinate.altitude._value
    || *((float *)&self->_locationCoordinate.latitude + 1) < 0.0
    && ([*(id *)&self->_maxFramingDistance routeMatch],
        int v54 = objc_claimAutoreleasedReturnValue(),
        v54,
        v54))
  {
    long long v8 = *(_OWORD *)a3;
    p_puckCoordinate->altitude._double value = *((double *)a3 + 2);
    *(_OWORD *)&p_puckCoordinate->latitude._double value = v8;
    int8x8_t v9 = [*(id *)&self->_maxFramingDistance routeMatch];

    if (v9)
    {
      double value = p_puckCoordinate->latitude._value;
      double v11 = p_puckCoordinate->longitude._value;
      double v12 = [*(id *)&self->_maxFramingDistance route];
      int64_t v13 = [*(id *)&self->_maxFramingDistance routeMatch];
      uint64_t v14 = [v13 routeCoordinate];

      uint64_t v15 = [v12 routeCoordinateForDistance:v14 beforeRouteCoordinate:50.0];
      uint64_t v16 = [v12 routeCoordinateForDistance:v14 afterRouteCoordinate:50.0];
      double v17 = objc_msgSend(MEMORY[0x1E4F64868], "iteratorWithRange:", v15, v16);
      [v17 advance];
      objc_msgSend(v12, "pointAtRouteCoordinate:", objc_msgSend(v17, "previous"));
      double v19 = v18;
      double v21 = v20;
      double v56 = v11 * 57.2957795;
      double v57 = value * 57.2957795;
      double v22 = 1.79769313e308;
      for (int i = objc_msgSend(v17, "isCurrentValid", ((v18 - value * 57.2957795) * (v18 - value * 57.2957795)+ (v20 - v11 * 57.2957795) * (v20 - v11 * 57.2957795))* 0.000002); i; int i = objc_msgSend(v17, "isCurrentValid", *(void *)&v55))
      {
        objc_msgSend(v12, "pointAtRouteCoordinate:", objc_msgSend(v17, "current"));
        double v25 = v24;
        double v27 = v26;
        double v28 = v24 - v19;
        double v29 = v26 - v21;
        double v30 = v28 * v28 + v29 * v29;
        double v31 = 0.0;
        if (v30 > 1.0e-15) {
          double v31 = fmin(fmax((v28 * (v57 - v19) + v29 * (v56 - v21)) / v30, 0.0), 1.0);
        }
        uint64_t v32 = [v17 currentSegmentRange];
        if (v33 == v32 || v33 - 1 == v32 && fabsf(v34) <= 0.01)
        {
          float v35 = v31;
          float v36 = *((float *)&v32 + 1)
              + (float)((float)((float)(v34 + (float)(v33 - v32)) - *((float *)&v32 + 1)) * v35);
          unsigned int v37 = vcvtms_u32_f32(v36) + v32;
          float v38 = v36 - floorf(v36);
          if (v36 >= 1.0) {
            float v36 = v38;
          }
          else {
            unsigned int v37 = v32;
          }
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_fault_impl(&dword_1A1780000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: isSingleSegment", buf, 2u);
          }
          unsigned int v37 = *MEMORY[0x1E4F64198];
          float v36 = *(float *)(MEMORY[0x1E4F64198] + 4);
        }
        *(void *)&double v39 = v37 | ((unint64_t)LODWORD(v36) << 32);
        [v12 distanceBetweenRouteCoordinate:v14 andRouteCoordinate:*(void *)&v39];
        double v41 = (v57 - (v19 + v31 * v28)) * (v57 - (v19 + v31 * v28))
            + (v56 - (v21 + v31 * v29)) * (v56 - (v21 + v31 * v29))
            + v55 * fabs(v40);
        if (v41 < v22)
        {
          self->_locationCoordinate.latitude = v39;
          double v22 = v41;
        }
        [v17 advance];
        double v19 = v25;
        double v21 = v27;
      }
      int64_t v42 = [*(id *)&self->_maxFramingDistance route];
      [v42 pointWithAltitudeCorrectionAtRouteCoordinate:*(void *)&self->_locationCoordinate.latitude];
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;

      self->_framingDistanceAfterManeuver = v44;
      self->_navContext = v46;
      p_puckCoordinate->altitude._double value = v48;
    }
    else if ([(VKCameraController *)self mapDataAccess])
    {
      md::MapDataAccess::heightAtCoordinate((unsigned __int8 *)[(VKCameraController *)self mapDataAccess], p_puckCoordinate);
      if (v50) {
        double v51 = v49;
      }
      else {
        double v51 = 0.0;
      }
      p_puckCoordinate->altitude._double value = v51;
    }
    if (!LOBYTE(self->_requesteDisplayRateSampler._count)) {
      p_puckCoordinate->altitude._double value = 0.0;
    }
    [(VKNavCameraController *)self _setNeedsUpdate];
  }
  long double v52 = fmod(-*(double *)a4, 6.28318531);
  long double v53 = fmod(v52 + 6.28318531, 6.28318531);
  if (self->_puckCourse._value != v53)
  {
    self->_puckCourse._double value = v53;
    [(VKNavCameraController *)self _setNeedsUpdate];
  }
}

- (optional<double>)puckAnimator:(id)a3 getElevationWithCoordinate:(const void *)a4
{
  double v6 = [(VKCameraController *)self mapDataAccess];
  if (v6)
  {
    md::MapDataAccess::heightAtCoordinate((unsigned __int8 *)[(VKCameraController *)self mapDataAccess], a4);
    if (!v7) {
      double v6 = 0;
    }
    *(void *)&v8.type = 1;
  }
  else
  {
    v8.type = 0.0;
  }
  result._double value = v8;
  result._hasValue = (char)v6;
  return result;
}

- (void)puckAnimator:(id)a3 updatedPosition:(const void *)a4 course:(const void *)a5 polylineCoordinate:(PolylineCoordinate)a6
{
  id v12 = a3;
  [(VKNavCameraController *)self updateLocation:a4 andCourse:a5];
  [v12 lastProjectedPosition];
  self->_pixelChangeFrameRate.__end_ = v9;
  self->_pixelChangeFrameRate.__end_cap_.__value_ = v10;
  self->_lastProjectedPosition._e[0] = v11;
}

- (void)puckAnimator:(id)a3 runAnimation:(id)a4
{
  double v5 = (VKAnimation *)a4;
  md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], v5);
}

- (BOOL)isGesturing
{
  if (self->_panning) {
    return 1;
  }
  if (self->_zooming) {
    return 1;
  }
  if (self->_rotating) {
    return 1;
  }
  return self->_pitching;
}

- (BOOL)tapAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)stopPitchingWithFocusPoint:(CGPoint)a3
{
  if (self->_pitching)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "stopPitchingWithFocusPoint:", x, y);

    [(VKNavCameraController *)self _setNeedsUpdate];
    [(VKNavCameraController *)self returnToTrackingWithDelay:0 resetZoom:*((float *)self->_framingScreenRect._maximum._e + 1)];
    if (self->_isDetached) {
      [(VKNavCameraController *)self snapMapIfNecessary:1];
    }
    else {
      [(VKNavCameraController *)self _snapPitch];
    }
    self->_pitching = 0;
  }
}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 degrees:(double)a4
{
  if (self->_pitching)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "updatePitchWithFocusPoint:degrees:", x, y, a4);

    [(VKNavCameraController *)self _setNeedsUpdate];
  }
}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 translation:(double)a4
{
  if (self->_pitching)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "updatePitchWithFocusPoint:translation:", x, y, a4);

    [(VKNavCameraController *)self _setNeedsUpdate];
  }
}

- (void)startPitchingWithFocusPoint:(CGPoint)a3
{
  if (BYTE2(self->_framingScreenRect._maximum._e[0]))
  {
    double y = a3.y;
    double x = a3.x;
    [(VKNavCameraController *)self stopAnimations];
    self->_pitching = 1;
    [(VKNavCameraController *)self _setDetached:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "startPitchingWithFocusPoint:", x, y);

    [(VKNavCameraController *)self _setNeedsUpdate];
  }
}

- (void)stopRotatingWithFocusPoint:(CGPoint)a3
{
  if (self->_rotating)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "stopRotatingWithFocusPoint:", x, y);

    [(VKNavCameraController *)self _setNeedsUpdate];
    [(VKNavCameraController *)self returnToTrackingWithDelay:0 resetZoom:*((float *)self->_framingScreenRect._maximum._e + 1)];
    if (self->_isDetached)
    {
      [(VKNavCameraController *)self snapMapIfNecessary:1];
    }
    else
    {
      [(VKNavCameraController *)self _snapPitch];
      [(VKNavCameraController *)self _snapHeading];
    }
    self->_rotating = 0;
  }
}

- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4
{
  if (self->_rotating)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "updateRotationWithFocusPoint:newValue:", x, y, a4);

    [(VKNavCameraController *)self _setNeedsUpdate];
  }
}

- (void)startRotatingWithFocusPoint:(CGPoint)a3
{
  if (BYTE3(self->_framingScreenRect._maximum._e[0]))
  {
    double y = a3.y;
    double x = a3.x;
    [(VKNavCameraController *)self stopAnimations];
    self->_rotating = 1;
    [(VKNavCameraController *)self _setDetached:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "startRotatingWithFocusPoint:", x, y);

    [(VKNavCameraController *)self _setNeedsUpdate];
  }
}

- (void)stopPanningAtPoint:(CGPoint)a3
{
  if (self->_panning)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "stopPanningAtPoint:", x, y);

    [(VKNavCameraController *)self _setNeedsUpdate];
    [(VKNavCameraController *)self returnToTrackingWithDelay:0 resetZoom:*((float *)self->_framingScreenRect._maximum._e + 1)];
    self->_panning = 0;
    [(VKNavCameraController *)self startIgnoreStyleChangeTimer];
  }
}

- (void)updatePanWithTranslation:(CGPoint)a3
{
  if (self->_panning)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "updatePanWithTranslation:", x, y);

    [(VKNavCameraController *)self _setNeedsUpdate];
  }
}

- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4
{
  if (LOBYTE(self->_framingScreenRect._maximum._e[0]))
  {
    BOOL v4 = a4;
    double y = a3.y;
    double x = a3.x;
    if (!self->_zooming || self->_panning)
    {
      [(VKNavCameraController *)self stopAnimations];
      self->_panning = 1;
      [(VKNavCameraController *)self _setDetached:1];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
      objc_msgSend(WeakRetained, "startPanningAtPoint:panAtStartPoint:", v4, x, y);

      [(VKNavCameraController *)self _setNeedsUpdate];
    }
  }
}

- (void)_updateObserverCouldZoomIn:(BOOL)a3 couldZoomOut:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(VKNavCameraController *)self _canZoomIn];
  BOOL v8 = [(VKNavCameraController *)self _canZoomOut];
  double v9 = *(double *)&self->_lastTargetStyleIdentifier;
  double v10 = fabs(v9 + -1.0);
  BOOL v11 = v10 <= fabs(v9 + 1.0) * 2.22044605e-14;
  int v12 = v10 < 2.22507386e-308 || v11;
  if (v7 != v5)
  {
    int64_t v13 = [(VKCameraController *)self cameraDelegate];
    [v13 mapLayerCanZoomInDidChange:v7];
  }
  if (v8 != v4)
  {
    uint64_t v14 = [(VKCameraController *)self cameraDelegate];
    [v14 mapLayerCanZoomOutDidChange:v8];
  }
  if (v12)
  {
    if (!BYTE1(self->_taskContext.__cntrl_)) {
      return;
    }
    uint64_t v15 = [(VKCameraController *)self cameraDelegate];
    [v15 mapLayerNavigationCameraDidReturnToDefaultZoom];
    char v16 = 0;
  }
  else
  {
    if (BYTE1(self->_taskContext.__cntrl_)) {
      return;
    }
    uint64_t v15 = [(VKCameraController *)self cameraDelegate];
    [v15 mapLayerNavigationCameraDidLeaveDefaultZoom];
    char v16 = 1;
  }

  BYTE1(self->_taskContext.__cntrl_) = v16;
}

- (void)setZoomScale:(double)a3
{
  if (*(double *)&self->_lastTargetStyleIdentifier != a3)
  {
    BOOL v5 = [(VKNavCameraController *)self _canZoomIn];
    BOOL v6 = [(VKNavCameraController *)self _canZoomOut];
    *(double *)&self->_unint64_t lastTargetStyleIdentifier = a3;
    GEOConfigGetDouble();
    double v8 = fmin(fmax(v7, 10.0), 100000.0);
    if (*(double *)&self->_lastTargetStyleIdentifier > v8)
    {
      *(double *)&self->_unint64_t lastTargetStyleIdentifier = v8 * 0.5;
      [(VKNavCameraController *)self _setDetached:1];
    }
    [(VKNavCameraController *)self _updateObserverCouldZoomIn:v5 couldZoomOut:v6];
    [(VKNavCameraController *)self _setNeedsUpdate];
  }
}

- (void)stopPinchingWithFocusPoint:(CGPoint)a3
{
  if (self->_zooming)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "stopPinchingWithFocusPoint:", x, y);

    [(VKNavCameraController *)self _setNeedsUpdate];
    [(VKNavCameraController *)self returnToTrackingWithDelay:0 resetZoom:*((float *)self->_framingScreenRect._maximum._e + 1)];
    if (self->_isDetached)
    {
      [(VKNavCameraController *)self snapMapIfNecessary:1];
    }
    else
    {
      [(VKNavCameraController *)self _snapPitch];
      [(VKNavCameraController *)self _snapHeading];
    }
    [(VKNavCameraController *)self startIgnoreStyleChangeTimer];
    self->_zooming = 0;
  }
}

- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  if (self->_zooming)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "updatePinchWithFocusPoint:oldFactor:newFactor:", x, y, a4, a5);

    [(VKNavCameraController *)self _setNeedsUpdate];
  }
}

- (void)startPinchingWithFocusPoint:(CGPoint)a3
{
  if (BYTE1(self->_framingScreenRect._maximum._e[0]))
  {
    double y = a3.y;
    double x = a3.x;
    [(VKNavCameraController *)self stopAnimations];
    self->_zooming = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "startPinchingWithFocusPoint:", x, y);

    [(VKNavCameraController *)self _setNeedsUpdate];
  }
}

- (void)stopIgnoreStyleChange
{
  self->_isIgnoringStyleChange = 0;
}

- (void)startIgnoreStyleChangeTimer
{
  if (GEOGetVectorKitVKNavCameraLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_41);
  }
  double v3 = (id)GEOGetVectorKitVKNavCameraLog_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "startIgnoreStyleChange", v4, 2u);
  }

  self->_ignoreStyleChangeStartTime = self->_previousUpdateTime;
  self->_isIgnoringStyleChange = 1;
}

- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  if (BYTE1(self->_framingScreenRect._maximum._e[0]))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__VKNavCameraController_zoom_withFocusPoint_completionHandler___block_invoke;
    v11[3] = &unk_1E5A96BB0;
    v11[4] = self;
    id v12 = v9;
    objc_msgSend(WeakRetained, "zoom:withFocusPoint:completionHandler:", v11, a3, x, y);
  }
}

uint64_t __63__VKNavCameraController_zoom_withFocusPoint_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) returnToTrackingWithDelay:0 resetZoom:*(float *)(*(void *)(a1 + 32) + 956)];
  double v2 = *(unsigned char **)(a1 + 32);
  if (v2[584])
  {
    [v2 snapMapIfNecessary:1];
    uint64_t result = *(void *)(a1 + 40);
    if (!result) {
      return result;
    }
  }
  else
  {
    [v2 _snapPitch];
    [*(id *)(a1 + 32) _snapHeading];
    uint64_t result = *(void *)(a1 + 40);
    if (!result) {
      return result;
    }
  }
  BOOL v4 = *(uint64_t (**)(void))(result + 16);
  return v4();
}

- (void)_setDetached:(BOOL)a3
{
  if (self->_isDetached == a3)
  {
    obunint64_t j = 0;
  }
  else
  {
    self->_isDetached = a3;
    if (a3)
    {
      BOOL v4 = [(VKCameraController *)self cameraDelegate];
      [v4 mapLayerNavigationCameraHasStartedPanning];

      [(VKNavCameraController *)self _setNavCameraIsDetached:1];
      BOOL v5 = [(VKNavCameraController *)self _detachedGestureController];
    }
    else
    {
      BOOL v6 = [(VKCameraController *)self cameraDelegate];
      [v6 mapLayerNavigationCameraHasStoppedPanning];

      [(VKNavCameraController *)self resetSpringsToResting];
      [(VKNavCameraController *)self _setNavCameraIsDetached:0];
      BOOL v5 = self->_attachedGestureBehavior;
    }
    obunint64_t j = v5;
    id WeakRetained = (VKAttachedNavGestureCameraBehavior *)objc_loadWeakRetained((id *)&self->_gestureBehavior);

    if (obj != WeakRetained)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_gestureBehavior);
      [v8 transferGestureState:obj];

      objc_storeWeak((id *)&self->_gestureBehavior, obj);
      [(VKNavCameraController *)self updatePuckOffset:!self->_isDetached];
    }
    [(VKNavCameraController *)self _setNeedsUpdate];
  }
}

- (id)_detachedGestureController
{
  detachedGestureBehavior = self->_detachedGestureBehavior;
  if (!detachedGestureBehavior)
  {
    BOOL v4 = [[VKDetachedNavGestureCameraBehavior alloc] initWithNavCameraController:self];
    BOOL v5 = self->_detachedGestureBehavior;
    self->_detachedGestureBehavior = v4;

    detachedGestureBehavior = self->_detachedGestureBehavior;
  }
  return detachedGestureBehavior;
}

- (void)startWithPounce:(BOOL)a3 startLocation:(id)a4 startCourse:(double)a5 pounceCompletionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  BOOL v9 = a3;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  BOOL v11 = (void (**)(id, uint64_t))a6;
  if (BYTE4(self->_previousSearchItemCount))
  {
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_41);
    }
    id v12 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A1780000, v12, OS_LOG_TYPE_INFO, "Nav Camera Started With Pounce but is already tracking", buf, 2u);
    }

    if (v11) {
      v11[2](v11, 1);
    }
  }
  else
  {
    BYTE2(self->_taskContext.__cntrl_) = GEOConfigGetBOOL();
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_41);
    }
    int64_t v13 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = "NO";
      *(_DWORD *)long long buf = 136315907;
      if (v9) {
        uint64_t v14 = "YES";
      }
      *(void *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2049;
      *(double *)&buf[14] = var0;
      *(_WORD *)&buf[22] = 2049;
      *(double *)&buf[24] = var1;
      *(_WORD *)&buf[32] = 2048;
      *(double *)&buf[34] = a5;
      _os_log_impl(&dword_1A1780000, v13, OS_LOG_TYPE_INFO, "Nav Camera Started With Pounce:%s to lat:%{private}f lon:%{private}f with course:%f", buf, 0x2Au);
    }

    [(VKCameraController *)self edgeInsets];
    LODWORD(self->_minCameraPitch._value) = v15;
    HIDWORD(self->_minCameraPitch._value) = v16;
    LODWORD(self->_maxCameraPitch._value) = v17;
    HIDWORD(self->_maxCameraPitch._value) = v18;
    if (GEOConfigGetBOOL() && var0 <= 90.0 && var0 >= -90.0 && var1 <= 180.0 && var1 >= -180.0)
    {
      *(double *)long long buf = var0 * 0.0174532925;
      *(double *)&uint8_t buf[8] = var1 * 0.0174532925;
      *(void *)&uint8_t buf[16] = 0;
      double v56 = a5 * 0.0174532925;
      [(VKNavCameraController *)self updateLocation:buf andCourse:&v56];
    }
    [(VKAnimation *)self->_transitionAnimation stop];
    transitionAnimation = self->_transitionAnimation;
    self->_transitionAnimation = 0;

    [(VKNavCameraController *)self _setNavCameraIsDetached:0];
    id WeakRetained = (VKAttachedNavGestureCameraBehavior *)objc_loadWeakRetained((id *)&self->_gestureBehavior);
    BOOL v21 = WeakRetained == self->_attachedGestureBehavior;

    if (!v21)
    {
      id v22 = objc_loadWeakRetained((id *)&self->_gestureBehavior);
      [v22 transferGestureState:self->_attachedGestureBehavior];

      objc_storeWeak((id *)&self->_gestureBehavior, self->_attachedGestureBehavior);
    }
    uint64_t v23 = [(VKCameraController *)self cameraDelegate];
    [v23 mapLayerNavigationCameraHasStoppedPanning];

    self->_unint64_t lastTargetStyleIdentifier = 0x3FF0000000000000;
    BYTE4(self->_previousSearchItemCount) = 1;
    [*(id *)&self->_maxFramingDistance addObserver:self];
    [(VKNavCameraController *)self _updateSceneQuery];
    [(VKNavCameraController *)self _updateSceneStyles:0 updatePitchLimitOnly:0];
    [(VKCameraController *)self beginRegionChange:1];
    if (v9)
    {
      memset(&buf[24], 0, 32);
      double v24 = [(VKCameraController *)self vkCamera];
      [v24 groundPlaneIntersectionPoint];
      double v26 = v25;
      double v28 = v27;

      long double v29 = exp(v28 * 6.28318531 + -3.14159265);
      long double v30 = atan(v29) * 2.0 + -1.57079633;
      long double v31 = fmod(v26 * 6.28318531, 6.28318531);
      long double v32 = fmod(v31 + 6.28318531, 6.28318531);
      *(long double *)long long buf = v30;
      *(double *)&uint8_t buf[8] = v32 + -3.14159265;
      *(void *)&uint8_t buf[16] = 0;
      int v33 = [(VKCameraController *)self vkCamera];
      [v33 pitch];
      double v35 = v34;
      *(double *)&buf[32] = v34;

      float v36 = [(VKCameraController *)self vkCamera];
      [v36 yaw];
      double v38 = -v37;
      *(double *)&buf[40] = -v37;

      double v39 = [(VKCameraController *)self vkCamera];
      double v40 = *(double *)([v39 position] + 16);
      double v41 = [(VKCameraController *)self vkCamera];
      [v41 pitch];
      long double v43 = v40 * 40075017.0 / cos(v42);
      *(long double *)&buf[24] = v43;

      [(VKNavCameraController *)self calculateViewableScreenRect];
      if (v46 >= v44 && v47 >= v45)
      {
        self->_double maxHeightDeltaChangeVertical = v44;
        self->_double halfPuckSize = v45;
        self->_viewableScreenRect._minimum._e[0] = v46;
        self->_viewableScreenRect._minimum._e[1] = v47;
      }
      self->_distanceFromTargetSpring._double restingPosition = v43;
      self->_distanceFromTargetSpring._double position = v43;
      self->_distanceFromTargetSpring._double velocity = 0.0;
      [(VKNavCameraController *)self puckScreenPoint];
      self->_screenPositionSpring._restingPosition._e[0] = v48;
      self->_screenPositionSpring._restingPosition._e[1] = v49;
      self->_screenPositionSpring._position._e[0] = v48;
      self->_screenPositionSpring._position._e[1] = v49;
      self->_screenPositionSpring._velocity._e[0] = 0.0;
      self->_screenPositionSpring._velocity._e[1] = 0.0;
      self->_pitchSpring._double restingPosition = v35;
      self->_pitchSpring._double position = v35;
      self->_pitchSpring._double velocity = 0.0;
      self->_headingSpring._double restingPosition = v38;
      self->_headingSpring._double position = v38;
      self->_headingSpring._double velocity = 0.0;
      long long v50 = *(_OWORD *)&buf[16];
      *(_OWORD *)&self->_cameraFrame._target.latitude._double value = *(_OWORD *)buf;
      *(_OWORD *)&self->_cameraFrame._target.altitude._double value = v50;
      HIDWORD(v48) = *(_DWORD *)&buf[36];
      *(_OWORD *)&self->_cameraFrame._pitch._double value = *(_OWORD *)&buf[32];
      self->_cameraFrame._roll._double value = *(double *)&buf[48];
      LODWORD(v48) = 1.5;
      [(VKNavCameraController *)self animateCameraWithDuration:buf fromFrame:v11 completionHandler:v48];
    }
    else
    {
      self->_unint64_t lastTargetStyleIdentifier = 0x3FF0000000000000;
      *(int64x2_t *)&self->_routeCoordinate.indedouble x = vdupq_n_s64(0xC00921FB54442D18);
      self->_routeFocusCoordinate.latitude._double value = 0.0;
      double value = self->_puckCourse._value;
      self->_headingSpring._double restingPosition = value;
      self->_headingSpring._double position = value;
      self->_headingSpring._double velocity = 0.0;
      [(VKNavCameraController *)self updateCameraState];
      [(VKNavCameraController *)self resetSpringsToResting];
      [(VKNavCameraController *)self stopIgnoreStyleChange];
      [(VKNavCameraController *)self currentCameraFrame];
      long long v52 = *(_OWORD *)&buf[16];
      *(_OWORD *)&self->_cameraFrame._target.latitude._double value = *(_OWORD *)buf;
      *(_OWORD *)&self->_cameraFrame._target.altitude._double value = v52;
      *(_OWORD *)&self->_cameraFrame._pitch._double value = *(_OWORD *)&buf[32];
      self->_cameraFrame._roll._double value = *(double *)&buf[48];
      long long v54 = *(_OWORD *)&self->_cameraFrame._target.altitude._value;
      long long v53 = *(_OWORD *)&self->_cameraFrame._pitch._value;
      long long v55 = *(_OWORD *)&self->_cameraFrame._target.latitude._value;
      self->_lastCalculatedCameraFrame._roll._double value = self->_cameraFrame._roll._value;
      *(_OWORD *)&self->_lastCalculatedCameraFrame._target.altitude._double value = v54;
      *(_OWORD *)&self->_lastCalculatedCameraFrame._pitch._double value = v53;
      *(_OWORD *)&self->_lastCalculatedCameraFrame._target.latitude._double value = v55;
      if (v11) {
        v11[2](v11, 1);
      }
    }
    [(VKNavCameraController *)self updatePuckOffset:1];
  }
}

- (void)updatePuckOffset:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  uint64_t v6 = [WeakRetained mapEngine];

  if (!v6) {
    return;
  }
  double v7 = *(int8x8_t **)(v6 + 1120);
  if (!v7) {
    return;
  }
  int8x8_t v8 = v7[2];
  if (!*(void *)&v8) {
    goto LABEL_31;
  }
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    uint64_t v10 = 0x7173CF8D2BE8FE53;
    if (*(void *)&v8 <= 0x7173CF8D2BE8FE53uLL) {
      uint64_t v10 = 0x7173CF8D2BE8FE53uLL % *(void *)&v8;
    }
  }
  else
  {
    uint64_t v10 = (*(void *)&v8 - 1) & 0x7173CF8D2BE8FE53;
  }
  BOOL v11 = *(void **)(*(void *)&v7[1] + 8 * v10);
  if (!v11) {
    goto LABEL_31;
  }
  id v12 = (void *)*v11;
  if (!v12) {
    goto LABEL_31;
  }
  if (v9.u32[0] < 2uLL)
  {
    uint64_t v13 = *(void *)&v8 - 1;
    while (1)
    {
      uint64_t v15 = v12[1];
      if (v15 == 0x7173CF8D2BE8FE53)
      {
        if (v12[2] == 0x7173CF8D2BE8FE53) {
          goto LABEL_24;
        }
      }
      else if ((v15 & v13) != v10)
      {
        goto LABEL_31;
      }
      id v12 = (void *)*v12;
      if (!v12) {
        goto LABEL_31;
      }
    }
  }
  while (1)
  {
    unint64_t v14 = v12[1];
    if (v14 == 0x7173CF8D2BE8FE53) {
      break;
    }
    if (v14 >= *(void *)&v8) {
      v14 %= *(void *)&v8;
    }
    if (v14 != v10) {
      goto LABEL_31;
    }
LABEL_13:
    id v12 = (void *)*v12;
    if (!v12) {
      goto LABEL_31;
    }
  }
  if (v12[2] != 0x7173CF8D2BE8FE53) {
    goto LABEL_13;
  }
LABEL_24:
  uint64_t v16 = v12[5];
  if (!v16)
  {
LABEL_31:
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_41);
    }
    int v18 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A1780000, v18, OS_LOG_TYPE_ERROR, "updatePuckOffset with no RouteLineLogic", (uint8_t *)&buf, 2u);
    }

    return;
  }
  if (v3)
  {
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_41);
    }
    int v17 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A1780000, v17, OS_LOG_TYPE_INFO, "Reset puckZScale", (uint8_t *)&buf, 2u);
    }
    goto LABEL_50;
  }
  [(VKCameraController *)self camera];
  if (*((void *)&buf + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&buf + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**((void **)&buf + 1) + 16))(*((void *)&buf + 1));
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&buf + 1));
  }
  if ((void)buf)
  {
    [(VKCameraController *)self camera];
    unsigned int v19 = *(unsigned __int8 *)buf - 1;
    if (*((void *)&buf + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&buf + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(void))(**((void **)&buf + 1) + 16))(*((void *)&buf + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&buf + 1));
    }
    [(VKNavCameraController *)self cameraFrame];
    if (v19 >= 3)
    {
      __double2 v34 = __sincos_stret((v65 - v66) * 0.5);
      __double2 v35 = __sincos_stret(v64 * 0.5);
      double v36 = v34.__sinval * v35.__sinval;
      double v37 = v36 + v36;
      double v38 = v34.__cosval * v35.__sinval * -2.0;
      double v39 = -(v38 * (v34.__cosval * v35.__sinval) + 1.0 - (v36 + v36) * v36);
      __double2 v40 = __sincos_stret((v66 + v65) * 0.5);
      double v41 = v38 * (v40.__cosval * v35.__cosval) + v37 * (v40.__sinval * v35.__cosval);
      long double v42 = tan(v60 * 0.5 + 0.785398163);
      double v59 = log(v42);
      double v43 = -(v38 * (v40.__sinval * v35.__cosval) - v37 * (v40.__cosval * v35.__cosval)) * (v63 * 0.0000000249532021);
      double v44 = v41 * (v63 * 0.0000000249532021);
      double v45 = -(v39 * (v63 * 0.0000000249532021));
      double value = self->_puckCoordinate.longitude._value;
      double v47 = self->_puckCoordinate.altitude._value;
      long double v48 = tan(self->_puckCoordinate.latitude._value * 0.5 + 0.785398163);
      long double v49 = log(v48);
      double v50 = -(v45 + v62 * 0.0000000249532021 - v47 * 0.0000000249532021);
      double v32 = sqrt(-(v43 - (value - v61) * 0.159154943) * -(v43 - (value - v61) * 0.159154943)+ v50 * v50+ -(v44 - (v49 - v59) * 0.159154943) * -(v44 - (v49 - v59) * 0.159154943));
      double v33 = v43 * v43 + v44 * v44 + v45 * v45;
    }
    else
    {
      gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric((double *)&buf, &v60);
      double v20 = v61;
      double v21 = v62;
      __double2 v22 = __sincos_stret(v60);
      double sinval = v22.__sinval;
      double v23 = 6378137.0 / sqrt(1.0 - sinval * sinval * 0.00669437999);
      double v57 = (v23 + v21) * v22.__cosval;
      __double2 v24 = __sincos_stret(v20);
      long long v25 = buf;
      double v26 = v68;
      double v55 = self->_puckCoordinate.longitude._value;
      double v56 = v21 + v23 * 0.99330562;
      double v27 = self->_puckCoordinate.altitude._value;
      __double2 v28 = __sincos_stret(self->_puckCoordinate.latitude._value);
      double v29 = 6378137.0 / sqrt(1.0 - v28.__sinval * v28.__sinval * 0.00669437999);
      __double2 v30 = __sincos_stret(v55);
      double v31 = -(v26 - (v27 + v29 * 0.99330562) * v28.__sinval);
      double v32 = sqrt(-(*(double *)&v25 - (v29 + v27) * v28.__cosval * v30.__cosval)* -(*(double *)&v25 - (v29 + v27) * v28.__cosval * v30.__cosval)+ -(*((double *)&v25 + 1) - (v29 + v27) * v28.__cosval * v30.__sinval)* -(*((double *)&v25 + 1) - (v29 + v27) * v28.__cosval * v30.__sinval)+ v31 * v31);
      double v33 = -(*(double *)&v25 - v57 * v24.__cosval) * -(*(double *)&v25 - v57 * v24.__cosval)
          + -(*((double *)&v25 + 1) - v57 * v24.__sinval) * -(*((double *)&v25 + 1) - v57 * v24.__sinval)
          + -(v26 - v56 * sinval) * -(v26 - v56 * sinval);
    }
    double v51 = v32 / sqrt(v33);
    if (v51 < 0.4 || v51 > 2.0)
    {
      if (GEOGetVectorKitVKNavCameraLog_onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_41);
      }
      long long v53 = (id)GEOGetVectorKitVKNavCameraLog_log;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = v51;
        _os_log_impl(&dword_1A1780000, v53, OS_LOG_TYPE_ERROR, "out of range puckZScale:%.2f", (uint8_t *)&buf, 0xCu);
      }

      double v51 = 1.0;
    }
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_41);
    }
    long long v54 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v51;
      _os_log_impl(&dword_1A1780000, v54, OS_LOG_TYPE_INFO, "Set puckZScale:%.2f", (uint8_t *)&buf, 0xCu);
    }

    *(double *)(v16 + 208) = v51;
    *(unsigned char *)(v16 + 216) = 1;
  }
  else
  {
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_41);
    }
    int v17 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A1780000, v17, OS_LOG_TYPE_ERROR, "updatePuckOffset with no camera, reset puckZScale", (uint8_t *)&buf, 2u);
    }
LABEL_50:

    *(unsigned char *)(v16 + 208) = 0;
    *(unsigned char *)(v16 + 216) = 0;
  }
}

- (void)dealloc
{
  [(VKCameraController *)self setCameraDelegate:0];
  objc_storeWeak((id *)&self->_gestureBehavior, 0);
  attachedGestureBehavior = self->_attachedGestureBehavior;
  self->_attachedGestureBehavior = 0;

  detachedGestureBehavior = self->_detachedGestureBehavior;
  self->_detachedGestureBehavior = 0;

  davinciGestureCameraController = self->_davinciGestureCameraController;
  self->_davinciGestureCameraController = 0;

  int64_t requestedDisplayRate = self->_requestedDisplayRate;
  if (requestedDisplayRate)
  {
    (*(void (**)(int64_t))(*(void *)requestedDisplayRate + 8))(requestedDisplayRate);
    self->_int64_t requestedDisplayRate = 0;
  }
  [*(id *)&self->_maxFramingDistance removeObserver:self];
  double maxFramingDistance = self->_maxFramingDistance;
  self->_double maxFramingDistance = 0.0;

  [(VKAnimation *)self->_snapPitchAnimation stop];
  snapPitchAnimation = self->_snapPitchAnimation;
  self->_snapPitchAnimation = 0;

  [(VKAnimation *)self->_snapHeadingAnimation stop];
  snapHeadingAnimation = self->_snapHeadingAnimation;
  self->_snapHeadingAnimation = 0;

  [(VKAnimation *)self->_transitionAnimation stop];
  transitionAnimation = self->_transitionAnimation;
  self->_transitionAnimation = 0;

  objc_storeWeak((id *)&self->_cameraMode, 0);
  v11.receiver = self;
  v11.super_class = (Class)VKNavCameraController;
  [(VKNavCameraController *)&v11 dealloc];
}

- (VKNavCameraController)initWithTaskContext:(shared_ptr<md:(void *)a4 :(void *)a5 TaskContext>)a3 device:(AnimationRunner *)a6 mapDataAccess:(RunLoopController *)a7 animationRunner:(id)a8 runLoopController:cameraDelegate:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  v73.receiver = self;
  v73.super_class = (Class)VKNavCameraController;
  double v60 = a7;
  uint64_t v13 = -[VKCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](&v73, sel_initWithMapDataAccess_animationRunner_runLoopController_cameraDelegate_, a4, a5, a6);
  unint64_t v14 = v13;
  if (v13)
  {
    uint64_t v15 = (id **)(v13 + 1080);
    int v17 = *(id **)ptr;
    uint64_t v16 = *((void *)ptr + 1);
    if (v16) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 8), 1uLL, memory_order_relaxed);
    }
    int v18 = (std::__shared_weak_count *)*((void *)v13 + 136);
    *uint64_t v15 = v17;
    *((void *)v13 + 136) = v16;
    if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
    uint64_t v19 = *((void *)cntrl + 1);
    *((void *)v14 + 137) = *(void *)(v19 + 64);
    v14[1104] = *(unsigned char *)(v19 + 72);
    id v20 = **v15;
    unint64_t v84 = 0;
    double v66 = v14;
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::Monitorable((uint64_t)v85, &VectorKitDebugConfig_NavCameraEnableConsole, v20, v83);
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::operator=((uint64_t)(v14 + 1904), v85);
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)v85);
    if (v84 == v83)
    {
      (*(void (**)(void *))(v83[0] + 32))(v83);
    }
    else if (v84)
    {
      (*(void (**)(void *))(*v84 + 40))(v84);
    }

    id v21 = **v15;
    unint64_t v82 = 0;
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::Monitorable((uint64_t)v85, &VectorKitDebugConfig_NavCameraEnableOverlay, v21, v81);
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::operator=((uint64_t)(v14 + 1984), v85);
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)v85);
    if (v82 == v81)
    {
      (*(void (**)(void *))(v81[0] + 32))(v81);
    }
    else if (v82)
    {
      (*(void (**)(void *))(*v82 + 40))(v82);
    }

    id v22 = **v15;
    unint64_t v80 = 0;
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::Monitorable((uint64_t)v85, &VectorKitDebugConfig_NavCameraEnableAttributes, v22, v79);
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::operator=((uint64_t)(v14 + 2064), v85);
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)v85);
    if (v80 == v79)
    {
      (*(void (**)(void *))(v79[0] + 32))(v79);
    }
    else if (v80)
    {
      (*(void (**)(void))(*v80 + 40))();
    }

    id v23 = **v15;
    unint64_t v78 = 0;
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::Monitorable((uint64_t)v85, &VectorKitDebugConfig_NavCameraEnableProperties, v23, v77);
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::operator=((uint64_t)(v14 + 2144), v85);
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)v85);
    if (v78 == v77)
    {
      (*(void (**)(void *))(v77[0] + 32))(v77);
    }
    else if (v78)
    {
      (*(void (**)(void))(*v78 + 40))();
    }

    id v24 = **v15;
    uint64_t v76 = 0;
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::Monitorable((uint64_t)v85, &VectorKitDebugConfig_NavCameraEnableLegend, v24, v75);
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::operator=((uint64_t)(v14 + 2224), v85);
    md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)v85);
    if (v76 == v75)
    {
      (*(void (**)(void *))(v75[0] + 32))(v75);
    }
    else if (v76)
    {
      (*(void (**)(void))(*v76 + 40))();
    }

    long long v25 = [[VKAttachedNavGestureCameraBehavior alloc] initWithNavCameraController:v14];
    double v26 = (void *)*((void *)v14 + 70);
    *((void *)v14 + 70) = v25;

    objc_storeWeak((id *)v14 + 69, *((id *)v14 + 70));
    *((void *)v14 + 63) = 0;
    v14[136] = 1;
    *((_OWORD *)v14 + 28) = 0u;
    *((_OWORD *)v14 + 29) = 0u;
    *((_OWORD *)v14 + 27) = 0u;
    uint64_t v27 = *((void *)v14 + 63);
    *((void *)v14 + 41) = v27;
    *((void *)v14 + 39) = v27;
    *((void *)v14 + 40) = 0;
    *((void *)v14 + 45) = 0;
    *((void *)v14 + 46) = 0;
    *((void *)v14 + 44) = 0;
    *((void *)v14 + 62) = 0x407F400000000000;
    *((void *)v14 + 51) = 0x407F400000000000;
    *(_OWORD *)(v14 + 392) = xmmword_1A28FF790;
    v14[137] = 2;
    v14[720] = 1;
    v14[721] = 1;
    v14[722] = 0;
    v14[723] = 0;
    *((void *)v14 + 91) = 0x4059000000000000;
    GEOConfigGetDouble();
    *((void *)v14 + 92) = v28;
    *((void *)v14 + 93) = 0;
    *((void *)v14 + 94) = 0x3FF8DA7E39BAE2A3;
    *((void *)v14 + 22) = 0;
    *((void *)v14 + 23) = 0;
    *((void *)v14 + 97) = 0;
    *((void *)v14 + 98) = 0;
    *((void *)v14 + 99) = 0;
    *((void *)v14 + 100) = 0;
    *((void *)v14 + 101) = 0;
    *((void *)v14 + 102) = 0;
    *((void *)v14 + 110) = 0;
    *((void *)v14 + 106) = 0;
    *((void *)v14 + 107) = 0;
    *((void *)v14 + 108) = 0;
    *((void *)v14 + 109) = 0;
    *((void *)v14 + 103) = 0;
    *((void *)v14 + 104) = 0;
    *((void *)v14 + 105) = 0x3F0000003F000000;
    v14[952] = 1;
    v14[953] = 1;
    v14[954] = 1;
    v14[955] = 1;
    *((_DWORD *)v14 + 239) = 1069547520;
    v14[960] = 0;
    v14[961] = 0;
    *((void *)v14 + 121) = 0xBFF0000000000000;
    *((void *)v14 + 122) = 0;
    v14[1016] = 0;
    v14[1017] = 10;
    v14[1018] = 0;
    *((int64x2_t *)v14 + 64) = vdupq_n_s64(0xC00921FB54442D18);
    *((void *)v14 + 130) = 0;
    *((void *)v14 + 131) = 0;
    *((void *)v14 + 132) = 0;
    int64x2_t v29 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    int64x2_t v30 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    *(int64x2_t *)(v14 + 888) = v29;
    *(int64x2_t *)(v14 + 904) = v30;
    *(int64x2_t *)(v14 + 920) = v29;
    *(int64x2_t *)(v14 + 936) = v30;
    *((void *)v14 + 133) = 0x3FF0000000000000;
    *((_DWORD *)v14 + 268) = -1082130432;
    [v14 _updateZoomScaleLimts];
    [v14 setBaseDisplayRate:GEOConfigGetInteger()];
    [v14 setMaxDisplayRate:GEOConfigGetInteger()];
    double v31 = GEOConfigGetDictionary();
    double v65 = v31;
    if (v31)
    {
      double v32 = [MEMORY[0x1E4F1CA60] dictionary];
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __115__VKNavCameraController_initWithTaskContext_device_mapDataAccess_animationRunner_runLoopController_cameraDelegate___block_invoke;
      v71[3] = &unk_1E5A96B68;
      id v33 = v32;
      id v72 = v33;
      id v64 = v33;
      [v31 enumerateKeysAndObjectsUsingBlock:v71];
      __double2 v34 = [v33 allKeys];
      __double2 v35 = v34;
      if (v34)
      {
        [v34 sortedArrayUsingComparator:&__block_literal_global_42349];
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        obunint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v36 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
        if (v36)
        {
          double v62 = v35;
          uint64_t v63 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v68 != v63) {
                objc_enumerationMutation(obj);
              }
              id v38 = *(id *)(*((void *)&v67 + 1) + 8 * i);
              double v39 = [v33 objectForKey:v38];
              [v38 doubleValue];
              uint64_t v41 = v40;
              uint64_t v42 = [v39 integerValue];
              uint64_t v43 = v42;
              unint64_t v14 = v66;
              double v44 = (char **)(v66 + 1808);
              double v46 = (char *)*((void *)v66 + 227);
              unint64_t v45 = *((void *)v66 + 228);
              if ((unint64_t)v46 >= v45)
              {
                long double v48 = *v44;
                uint64_t v49 = (v46 - *v44) >> 4;
                unint64_t v50 = v49 + 1;
                if ((unint64_t)(v49 + 1) >> 60) {
                  abort();
                }
                uint64_t v51 = v45 - (void)v48;
                if (v51 >> 3 > v50) {
                  unint64_t v50 = v51 >> 3;
                }
                if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v52 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v52 = v50;
                }
                if (v52)
                {
                  if (v52 >> 60) {
                    std::__throw_bad_array_new_length[abi:nn180100]();
                  }
                  long long v53 = (char *)operator new(16 * v52);
                }
                else
                {
                  long long v53 = 0;
                }
                long long v54 = &v53[16 * v49];
                *(void *)long long v54 = v41;
                *((void *)v54 + 1) = v43;
                double v55 = v54;
                if (v46 == v48)
                {
                  unint64_t v14 = v66;
                }
                else
                {
                  unint64_t v14 = v66;
                  do
                  {
                    *((_OWORD *)v55 - 1) = *((_OWORD *)v46 - 1);
                    v55 -= 16;
                    v46 -= 16;
                  }
                  while (v46 != v48);
                  double v46 = *v44;
                }
                double v47 = v54 + 16;
                *double v44 = v55;
                *((void *)v66 + 227) = v54 + 16;
                *((void *)v66 + 228) = &v53[16 * v52];
                if (v46) {
                  operator delete(v46);
                }
              }
              else
              {
                *(void *)double v46 = v41;
                *((void *)v46 + 1) = v42;
                double v47 = v46 + 16;
              }
              id v33 = v64;
              double v31 = v65;
              __double2 v35 = v62;
              *((void *)v66 + 227) = v47;
            }
            uint64_t v36 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
          }
          while (v36);
        }
      }
    }
    v14[1076] = 0;
    v14[1105] = 0;
    v14[1106] = 0;
    int64x2_t v56 = vdupq_n_s64(0xC00921FB54442D18);
    *(int64x2_t *)(v14 + 1112) = v56;
    *(_OWORD *)(v14 + 1128) = xmmword_1A28FF780;
    *(_OWORD *)(v14 + 1144) = xmmword_1A28FEA70;
    *(int64x2_t *)(v14 + 1160) = v56;
    *(_OWORD *)(v14 + 1176) = xmmword_1A28FF780;
    *(_OWORD *)(v14 + 1192) = xmmword_1A28FEA70;
    v14[1784] = 0;
    GEOConfigGetDouble();
    *((void *)v14 + 232) = v57;
    *((void *)v14 + 65) = 0;
    [v14 stopIgnoreStyleChange];
    uint64_t v58 = v14;
  }
  return (VKNavCameraController *)v14;
}

void __115__VKNavCameraController_initWithTaskContext_device_mapDataAccess_animationRunner_runLoopController_cameraDelegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  double v7 = NSNumber;
  [v9 doubleValue];
  int8x8_t v8 = objc_msgSend(v7, "numberWithDouble:");
  [v6 setObject:v5 forKeyedSubscript:v8];
}

uint64_t __115__VKNavCameraController_initWithTaskContext_device_mapDataAccess_animationRunner_runLoopController_cameraDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (VKNavCameraController)init
{
  return 0;
}

@end