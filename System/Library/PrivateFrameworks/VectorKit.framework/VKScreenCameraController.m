@interface VKScreenCameraController
- ($FB7D626B10600DAA2A617849B22B1DA6)centerCoordinateDistanceRange;
- ($FF918C85BF8E73478720C66798E418D4)annotationTrackingBehavior;
- (BOOL)canEnter3DMode;
- (BOOL)hasVehicleHeading;
- (BOOL)isAnimating;
- (BOOL)isAnimatingToTrackAnnotation;
- (BOOL)isFlyoverTourStarted;
- (BOOL)isTrackingHeading;
- (BOOL)snapMapIfNecessary:(BOOL)a3;
- (BOOL)tapAtPoint:(CGPoint)a3;
- (BOOL)userChangedZoomSinceLastProgrammaticRegionChange;
- (VKCameraRegionRestriction)regionRestriction;
- (VKScreenCameraController)initWithMapDataAccess:(MapDataAccess *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6;
- (VKTrackableAnnotation)trackingAnnotation;
- (double)durationToAnimateToMapRegion:(id)a3;
- (int64_t)tileSize;
- (void)clampZoomLevelIfNecessary;
- (void)dealloc;
- (void)setAnnotationTrackingBehavior:(id *)a3;
- (void)setCamera:(shared_ptr<gdc::Camera>)a3;
- (void)setCenterCoordinateDistanceRange:(id *)a3;
- (void)setCenterCoordinateDistanceRange:(id *)a3 duration:(double)a4 timingFunction:(id)a5;
- (void)setEdgeInsets:(VKEdgeInsets)a3;
- (void)setHasVehicleHeading:(BOOL)a3;
- (void)setRegionRestriction:(id)a3;
- (void)setRegionRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5;
- (void)setUserChangedZoomSinceLastProgrammaticRegionChange:(BOOL)a3;
- (void)setVkCamera:(id)a3;
- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4;
- (void)startPinchingWithFocusPoint:(CGPoint)a3;
- (void)startPitchingWithFocusPoint:(CGPoint)a3;
- (void)startRotatingWithFocusPoint:(CGPoint)a3;
- (void)stopAnimations;
- (void)stopPanningAtPoint:(CGPoint)a3;
- (void)stopPinchingWithFocusPoint:(CGPoint)a3;
- (void)stopPitchingWithFocusPoint:(CGPoint)a3;
- (void)stopRegionAnimation;
- (void)stopRotatingWithFocusPoint:(CGPoint)a3;
- (void)stopSnappingAnimations;
- (void)stopTrackingAnnotation;
- (void)transferGestureState:(id)a3;
- (void)updatePanWithTranslation:(CGPoint)a3;
- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5;
- (void)updatePitchWithFocusPoint:(CGPoint)a3 degrees:(double)a4;
- (void)updatePitchWithFocusPoint:(CGPoint)a3 translation:(double)a4;
- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4;
- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4;
- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5;
@end

@implementation VKScreenCameraController

- (VKCameraRegionRestriction)regionRestriction
{
  return self->_regionRestriction;
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  ptr = a3.__ptr_;
  uint64_t v5 = *(void *)a3.__ptr_;
  if (!*(void *)a3.__ptr_)
  {
    [(VKScreenCameraController *)self stopAnimations];
    uint64_t v5 = *(void *)ptr;
  }
  v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
  uint64_t v9 = v5;
  v10 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v8.receiver = self;
  v8.super_class = (Class)VKScreenCameraController;
  -[VKCameraController setCamera:](&v8, sel_setCamera_, &v9, a3.__cntrl_);
  v7 = v10;
  if (v10)
  {
    if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (void)clampZoomLevelIfNecessary
{
}

- (void)setVkCamera:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [(VKScreenCameraController *)self stopAnimations];
  }
  v5.receiver = self;
  v5.super_class = (Class)VKScreenCameraController;
  [(VKCameraController *)&v5 setVkCamera:v4];
}

- (VKScreenCameraController)initWithMapDataAccess:(MapDataAccess *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6
{
  id v10 = a6;
  v21.receiver = self;
  v21.super_class = (Class)VKScreenCameraController;
  v11 = [(VKCameraController *)&v21 initWithMapDataAccess:a3 animationRunner:a4 runLoopController:a5 cameraDelegate:v10];
  if (v11)
  {
    v12 = [[VKCameraRegionRestriction alloc] initWithMapRegion:0];
    v13 = (void *)*((void *)v11 + 30);
    *((void *)v11 + 30) = v12;

    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v11 + 248) = _Q0;
    v11[264] = 0;
    v19 = v11;
  }

  return (VKScreenCameraController *)v11;
}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  float right = a3.right;
  float bottom = a3.bottom;
  float left = a3.left;
  float top = a3.top;
  v12.receiver = self;
  v12.super_class = (Class)VKScreenCameraController;
  -[VKCameraController setEdgeInsets:](&v12, sel_setEdgeInsets_);
  *(float *)&double v8 = top;
  *(float *)&double v9 = left;
  *(float *)&double v10 = bottom;
  *(float *)&double v11 = right;
  -[VKCameraController setEdgeInsets:](self->_annotationTrackingCameraController, "setEdgeInsets:", v8, v9, v10, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionRestriction, 0);
  objc_storeStrong((id *)&self->_gestureCameraControllerBehavior, 0);
  objc_storeStrong((id *)&self->_annotationTrackingCameraController, 0);
  objc_storeStrong((id *)&self->_moveToTourPositionAnimation, 0);
  objc_storeStrong((id *)&self->_flyoverAnimation, 0);
  objc_storeStrong((id *)&self->_regionAnimation, 0);
  objc_storeStrong((id *)&self->_rotationAnimation, 0);
  objc_storeStrong((id *)&self->_pitchAnimation, 0);
  objc_storeStrong((id *)&self->_zoomAnimation, 0);
}

- (void)setUserChangedZoomSinceLastProgrammaticRegionChange:(BOOL)a3
{
  self->_userChangedZoomSinceLastProgrammaticRegionChange = a3;
}

- (BOOL)userChangedZoomSinceLastProgrammaticRegionChange
{
  return self->_userChangedZoomSinceLastProgrammaticRegionChange;
}

- ($FB7D626B10600DAA2A617849B22B1DA6)centerCoordinateDistanceRange
{
  *($86C499896B48E8EBD2EEEC504ABFB400 *)retstr = *($86C499896B48E8EBD2EEEC504ABFB400 *)((char *)self + 248);
  return self;
}

- (BOOL)hasVehicleHeading
{
  return self->_hasVehicleHeading;
}

- ($FF918C85BF8E73478720C66798E418D4)annotationTrackingBehavior
{
  *($F8852815F5307377C348AED5259C60F2 *)retstr = *($F8852815F5307377C348AED5259C60F2 *)((char *)self + 200);
  return self;
}

- (BOOL)isFlyoverTourStarted
{
  return 0;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VKScreenCameraController;
  -[VKCameraController updateWithTimestamp:withContext:](&v7, sel_updateWithTimestamp_withContext_);
  [(VKGestureCameraBehavior *)self->_gestureCameraControllerBehavior updateWithTimestamp:a4 withContext:a3];
}

- (BOOL)canEnter3DMode
{
  return 0;
}

- (int64_t)tileSize
{
  return 0;
}

- (double)durationToAnimateToMapRegion:(id)a3
{
  return 0.0;
}

- (BOOL)tapAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)transferGestureState:(id)a3
{
}

- (void)stopPitchingWithFocusPoint:(CGPoint)a3
{
  -[VKGestureCameraBehavior stopPitchingWithFocusPoint:](self->_gestureCameraControllerBehavior, "stopPitchingWithFocusPoint:", a3.x, a3.y);
  [(VKScreenCameraController *)self clampZoomLevelIfNecessary];
  [(VKCameraController *)self endRegionChange];
  [(VKScreenCameraController *)self snapMapIfNecessary:1];
}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 degrees:(double)a4
{
}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 translation:(double)a4
{
}

- (void)startPitchingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  pitchAnimation = self->_pitchAnimation;
  if (pitchAnimation) {
    [(VKAnimation *)pitchAnimation stop];
  }
  [(VKCameraController *)self beginRegionChange:0];
  gestureCameraControllerBehavior = self->_gestureCameraControllerBehavior;
  -[VKGestureCameraBehavior startPitchingWithFocusPoint:](gestureCameraControllerBehavior, "startPitchingWithFocusPoint:", x, y);
}

- (void)stopRotatingWithFocusPoint:(CGPoint)a3
{
  -[VKGestureCameraBehavior stopRotatingWithFocusPoint:](self->_gestureCameraControllerBehavior, "stopRotatingWithFocusPoint:", a3.x, a3.y);
  [(VKCameraController *)self endRegionChange];
  [(VKScreenCameraController *)self snapMapIfNecessary:1];
}

- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4
{
}

- (void)startRotatingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(VKCameraController *)self beginRegionChange:0];
  gestureCameraControllerBehavior = self->_gestureCameraControllerBehavior;
  -[VKGestureCameraBehavior startRotatingWithFocusPoint:](gestureCameraControllerBehavior, "startRotatingWithFocusPoint:", x, y);
}

- (void)stopPanningAtPoint:(CGPoint)a3
{
  -[VKGestureCameraBehavior stopPanningAtPoint:](self->_gestureCameraControllerBehavior, "stopPanningAtPoint:", a3.x, a3.y);
  [(VKScreenCameraController *)self clampZoomLevelIfNecessary];
  [(VKCameraController *)self endRegionChange];
}

- (void)updatePanWithTranslation:(CGPoint)a3
{
  -[VKGestureCameraBehavior updatePanWithTranslation:](self->_gestureCameraControllerBehavior, "updatePanWithTranslation:", a3.x, a3.y);
  [(VKScreenCameraController *)self clampZoomLevelIfNecessary];
}

- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  [(VKCameraController *)self beginRegionChange:0];
  gestureCameraControllerBehavior = self->_gestureCameraControllerBehavior;
  -[VKGestureCameraBehavior startPanningAtPoint:panAtStartPoint:](gestureCameraControllerBehavior, "startPanningAtPoint:panAtStartPoint:", v4, x, y);
}

- (void)stopPinchingWithFocusPoint:(CGPoint)a3
{
  -[VKGestureCameraBehavior stopPinchingWithFocusPoint:](self->_gestureCameraControllerBehavior, "stopPinchingWithFocusPoint:", a3.x, a3.y);
  [(VKScreenCameraController *)self clampZoomLevelIfNecessaryAnimated:[(VKGestureCameraBehavior *)self->_gestureCameraControllerBehavior allowsZoomRubberbanding]];
  [(VKCameraController *)self endRegionChange];
  [(VKScreenCameraController *)self snapMapIfNecessary:1];
}

- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  -[VKGestureCameraBehavior updatePinchWithFocusPoint:oldFactor:newFactor:](self->_gestureCameraControllerBehavior, "updatePinchWithFocusPoint:oldFactor:newFactor:", a3.x, a3.y, a4, a5);
  self->_userChangedZoomSinceLastProgrammaticRegionChange = 1;
  annotationTrackingCameraController = self->_annotationTrackingCameraController;
  [(VKAnnotationTrackingCameraController *)annotationTrackingCameraController setHasUserSpecifiedZoomLevel:1];
}

- (void)startPinchingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  zoomAnimation = self->_zoomAnimation;
  if (zoomAnimation && [(VKAnimation *)zoomAnimation running])
  {
    if (!self->_zoomAnimationCanBeInterrupted) {
      return;
    }
    [(VKAnimation *)self->_zoomAnimation stop];
    objc_super v7 = self->_zoomAnimation;
    self->_zoomAnimation = 0;
  }
  [(VKCameraController *)self beginRegionChange:0];
  gestureCameraControllerBehavior = self->_gestureCameraControllerBehavior;
  -[VKGestureCameraBehavior startPinchingWithFocusPoint:](gestureCameraControllerBehavior, "startPinchingWithFocusPoint:", x, y);
}

- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  [(VKCameraController *)self beginRegionChange:1];
  -[VKGestureCameraBehavior zoom:withFocusPoint:completionHandler:](self->_gestureCameraControllerBehavior, "zoom:withFocusPoint:completionHandler:", v9, a3, x, y);
  [(VKCameraController *)self endRegionChange];
}

- (void)setRegionRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8 = a3;
  if (!-[VKCameraRegionRestriction isEqual:](self->_regionRestriction, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_regionRestriction, a3);
    objc_super v7 = [(VKCameraController *)self vkCamera];
    [v7 setRegionRestriction:v8];
  }
}

- (void)setRegionRestriction:(id)a3
{
}

- (void)setCenterCoordinateDistanceRange:(id *)a3 duration:(double)a4 timingFunction:(id)a5
{
  uint64_t v7 = *(void *)&a3->var2;
  *(_OWORD *)&self->_centerCoordinateDistanceRange.min = *(_OWORD *)&a3->var0;
  *(void *)&self->_centerCoordinateDistanceRange.allowRubberband = v7;
  -[VKGestureCameraBehavior setAllowsZoomRubberbanding:](self->_gestureCameraControllerBehavior, "setAllowsZoomRubberbanding:", a3->var2, a5);
  id v8 = [(VKCameraController *)self vkCamera];
  [v8 groundPoint];
  long double v10 = exp(v9 * 6.28318531 + -3.14159265);
  long double v11 = atan(v10) * 114.591559 + -90.0;
  long double v12 = cos(v11 * 0.034906585) * -559.82 + 111132.92;
  long double v13 = v12 + cos(v11 * 0.0698131701) * 1.175;
  long double v14 = v13 + cos(v11 * 0.104719755) * -0.0023;
  long double v15 = v11 * 0.00872664626;
  long double v16 = tan(v11 * 0.00872664626 + 0.78103484);
  double v17 = log(v16);
  long double v18 = tan(v15 + 0.789761487);
  double v19 = fabs((log(v18) - v17) * 0.159154943) / v14;

  v20 = [(VKCameraController *)self vkCamera];
  objc_super v21 = v20;
  double var1 = a3->var1;
  if (var1 < 0.0)
  {
    char v23 = 0;
  }
  else
  {
    double v30 = fmin(var1 * v19, 1.0);
    char v23 = 1;
  }
  v29[0] = v23;
  [v20 setMaxDistanceToGroundRestriction:v29];
  if (v29[0]) {
    v29[0] = 0;
  }

  v24 = [(VKCameraController *)self vkCamera];
  v25 = v24;
  if (a3->var0 < 0.0)
  {
    char v26 = 0;
  }
  else
  {
    double v28 = fmin(fmax(a3->var0 * v19, 0.0), 1.0);
    char v26 = 1;
  }
  v27[0] = v26;
  [v24 setMinDistanceToGroundRestriction:v27];
  if (v27[0]) {
    v27[0] = 0;
  }
}

- (void)setCenterCoordinateDistanceRange:(id *)a3
{
  $FB7D626B10600DAA2A617849B22B1DA6 v3 = *a3;
  [(VKScreenCameraController *)self setCenterCoordinateDistanceRange:&v3 duration:0 timingFunction:0.0];
}

- (BOOL)snapMapIfNecessary:(BOOL)a3
{
  return 0;
}

- (BOOL)isAnimating
{
  v4.receiver = self;
  v4.super_class = (Class)VKScreenCameraController;
  return [(VKCameraController *)&v4 isAnimating]
      || [(VKAnnotationTrackingCameraController *)self->_annotationTrackingCameraController isAnimating];
}

- (void)stopAnimations
{
  regionAnimation = self->_regionAnimation;
  if (regionAnimation)
  {
    [(VKAnimation *)regionAnimation stop];
    objc_super v4 = self->_regionAnimation;
    self->_regionAnimation = 0;
  }
  rotationAnimation = self->_rotationAnimation;
  if (rotationAnimation)
  {
    [(VKAnimation *)rotationAnimation stop];
    v6 = self->_rotationAnimation;
    self->_rotationAnimation = 0;
  }
  pitchAnimation = self->_pitchAnimation;
  if (pitchAnimation)
  {
    [(VKAnimation *)pitchAnimation stop];
    id v8 = self->_pitchAnimation;
    self->_pitchAnimation = 0;
  }
  zoomAnimation = self->_zoomAnimation;
  if (zoomAnimation)
  {
    [(VKAnimation *)zoomAnimation stop];
    long double v10 = self->_zoomAnimation;
    self->_zoomAnimation = 0;
  }
}

- (void)stopRegionAnimation
{
  [(VKAnimation *)self->_regionAnimation stop];
  regionAnimation = self->_regionAnimation;
  self->_regionAnimation = 0;
}

- (void)stopSnappingAnimations
{
  pitchAnimation = self->_pitchAnimation;
  if (pitchAnimation) {
    [(VKAnimation *)pitchAnimation stop];
  }
  rotationAnimation = self->_rotationAnimation;
  if (rotationAnimation)
  {
    [(VKAnimation *)rotationAnimation stop];
  }
}

- (void)setHasVehicleHeading:(BOOL)a3
{
  self->_hasVehicleHeading = a3;
  -[VKAnnotationTrackingCameraController setHasVehicleHeading:](self->_annotationTrackingCameraController, "setHasVehicleHeading:");
}

- (void)setAnnotationTrackingBehavior:(id *)a3
{
  uint64_t v3 = *(void *)&a3->var2;
  *(_OWORD *)&self->_annotationTrackingBehavior.shouldZoomToFit = *(_OWORD *)&a3->var0;
  *(void *)&self->_annotationTrackingBehavior.shouldPreserveUserSpecifiedZoomLevel = v3;
  $FF918C85BF8E73478720C66798E418D4 v4 = *a3;
  [(VKAnnotationTrackingCameraController *)self->_annotationTrackingCameraController setBehavior:&v4];
}

- (BOOL)isAnimatingToTrackAnnotation
{
  return [(VKAnnotationTrackingCameraController *)self->_annotationTrackingCameraController isAnimating];
}

- (BOOL)isTrackingHeading
{
  return [(VKAnnotationTrackingCameraController *)self->_annotationTrackingCameraController isTrackingHeading];
}

- (VKTrackableAnnotation)trackingAnnotation
{
  return [(VKAnnotationTrackingCameraController *)self->_annotationTrackingCameraController annotation];
}

- (void)stopTrackingAnnotation
{
  [(VKAnnotationTrackingCameraController *)self->_annotationTrackingCameraController stopTrackingAnnotation];
  if (self->_annotationTrackingBehavior.resetAfterTracking)
  {
    long long v3 = VKAnnotationTrackingBehaviorDefault;
    uint64_t v4 = 1;
    [(VKScreenCameraController *)self setAnnotationTrackingBehavior:&v3];
  }
}

- (void)dealloc
{
  [(VKCameraController *)self->_annotationTrackingCameraController setCameraDelegate:0];
  annotationTrackingCameraController = self->_annotationTrackingCameraController;
  self->_annotationTrackingCameraController = 0;

  [(VKAnimation *)self->_zoomAnimation stop];
  zoomAnimation = self->_zoomAnimation;
  self->_zoomAnimation = 0;

  [(VKAnimation *)self->_pitchAnimation stop];
  pitchAnimation = self->_pitchAnimation;
  self->_pitchAnimation = 0;

  [(VKAnimation *)self->_rotationAnimation stop];
  rotationAnimation = self->_rotationAnimation;
  self->_rotationAnimation = 0;

  [(VKAnimation *)self->_regionAnimation stop];
  regionAnimation = self->_regionAnimation;
  self->_regionAnimation = 0;

  regionRestriction = self->_regionRestriction;
  self->_regionRestriction = 0;

  v9.receiver = self;
  v9.super_class = (Class)VKScreenCameraController;
  [(VKScreenCameraController *)&v9 dealloc];
}

@end