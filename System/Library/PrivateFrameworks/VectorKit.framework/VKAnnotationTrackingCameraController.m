@interface VKAnnotationTrackingCameraController
- ($FF918C85BF8E73478720C66798E418D4)behavior;
- (BOOL)hasUserSpecifiedZoomLevel;
- (BOOL)hasVehicleHeading;
- (BOOL)isAnimating;
- (BOOL)isTrackingHeading;
- (BOOL)shouldForceZoomToFit;
- (VKAnnotationTrackingCameraController)initWithMapDataAccess:(MapDataAccess *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6;
- (VKTrackableAnnotation)annotation;
- (int64_t)headingAnimationDisplayRate;
- (void)dealloc;
- (void)elevationLogic;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseAnimation;
- (void)resumeAnimation;
- (void)setBehavior:(id *)a3;
- (void)setElevationLogic:(void *)a3;
- (void)setGesturing:(BOOL)a3;
- (void)setHasUserSpecifiedZoomLevel:(BOOL)a3;
- (void)setHasVehicleHeading:(BOOL)a3;
- (void)setHeadingAnimationDisplayRate:(int64_t)a3;
- (void)startTrackingAnnotation:(id)a3 trackHeading:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7;
- (void)stopTrackingAnnotation;
- (void)updateFramerate;
@end

@implementation VKAnnotationTrackingCameraController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHeadingAnimation, 0);
  objc_storeStrong((id *)&self->_currentAnimation, 0);
  objc_storeStrong((id *)&self->_annotationPresentation, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
}

- (void)setElevationLogic:(void *)a3
{
  *(void *)&self->_hasVehicleHeading = a3;
}

- (void)elevationLogic
{
  return *(void **)&self->_hasVehicleHeading;
}

- (void)setHasVehicleHeading:(BOOL)a3
{
  *(&self->_hasUserSpecifiedZoomLevel + 3) = a3;
}

- (BOOL)hasVehicleHeading
{
  return *(&self->_hasUserSpecifiedZoomLevel + 3);
}

- (void)setHasUserSpecifiedZoomLevel:(BOOL)a3
{
  self->_hasUserSpecifiedZoomLevel = a3;
}

- (BOOL)hasUserSpecifiedZoomLevel
{
  return self->_hasUserSpecifiedZoomLevel;
}

- (void)setHeadingAnimationDisplayRate:(int64_t)a3
{
  self->_headingAnimationDisplayRate = a3;
}

- (int64_t)headingAnimationDisplayRate
{
  return self->_headingAnimationDisplayRate;
}

- (void)setBehavior:(id *)a3
{
  uint64_t v3 = *(void *)&a3->var2;
  *(_OWORD *)&self->_behavior.shouldZoomToFit = *(_OWORD *)&a3->var0;
  *(void *)&self->_behavior.shouldPreserveUserSpecifiedZoomLevel = v3;
}

- ($FF918C85BF8E73478720C66798E418D4)behavior
{
  *($F8852815F5307377C348AED5259C60F2 *)retstr = *($F8852815F5307377C348AED5259C60F2 *)((char *)self + 296);
  return self;
}

- (VKTrackableAnnotation)annotation
{
  return self->_annotation;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  v11 = (VKTrackableAnnotation *)a4;
  id v12 = a5;
  annotation = self->_annotation;
  if (annotation == v11)
  {
    if ([v10 isEqualToString:@"coordinate"])
    {
      double v15 = -1.0;
      if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0x400) != 0) {
        [(VKTrackableAnnotation *)self->_annotation expectedCoordinateUpdateInterval];
      }
    }
    else
    {
      annotation = self->_annotation;
      if (annotation != v11) {
        goto LABEL_2;
      }
      if (([v10 isEqualToString:@"accuracy"] & 1) == 0)
      {
        if (self->_annotation != v11) {
          goto LABEL_16;
        }
        goto LABEL_3;
      }
      double v15 = -1.0;
      if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0x400) != 0) {
        [(VKTrackableAnnotation *)self->_annotation expectedCoordinateUpdateInterval];
      }
    }
    [(VKAnnotationTrackingCameraController *)self _goToAnnotationAnimated:1 duration:0 timingFunction:0 isInitial:v15];
    goto LABEL_17;
  }
LABEL_2:
  if (annotation != v11)
  {
LABEL_16:
    v16.receiver = self;
    v16.super_class = (Class)VKAnnotationTrackingCameraController;
    [(VKAnnotationTrackingCameraController *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_17;
  }
LABEL_3:
  if (![v10 isEqualToString:@"heading"]) {
    goto LABEL_16;
  }
  if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0x800) != 0) {
    [(VKTrackableAnnotation *)self->_annotation expectedHeadingUpdateInterval];
  }
  else {
    double v14 = 0.4;
  }
  [(VKAnnotationTrackingCameraController *)self _rotateToHeadingAnimated:1 duration:v14];
LABEL_17:
}

- (void)resumeAnimation
{
  [(VKTimedAnimation *)self->_currentAnimation duration];
  if (*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1)) {
    double pendingChangeDuration = self->_pendingChangeDuration;
  }
  else {
    double pendingChangeDuration = v3;
  }
  [(VKAnimation *)self->_currentAnimation stop];
  currentAnimation = self->_currentAnimation;
  self->_currentAnimation = 0;

  [(VKAnimation *)self->_currentHeadingAnimation stop];
  currentHeadingAnimation = self->_currentHeadingAnimation;
  self->_currentHeadingAnimation = 0;

  *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) &= ~2u;
  [(VKAnnotationTrackingCameraController *)self _goToAnnotationAnimated:1 duration:0 timingFunction:0 isInitial:pendingChangeDuration];
  if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 4) != 0) {
    [(VKAnnotationTrackingCameraController *)self _rotateToHeadingAnimated:1 duration:0.4];
  }
  [(VKAnnotationTrackingCameraController *)self updateFramerate];
}

- (void)pauseAnimation
{
  [(VKTimedAnimation *)self->_currentAnimation pause];
  [(VKTimedAnimation *)self->_currentHeadingAnimation pause];
  *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) |= 2u;
  [(VKAnnotationTrackingCameraController *)self updateFramerate];
}

- (BOOL)isAnimating
{
  if ([(VKAnimation *)self->_currentAnimation running]
    || [(VKAnimation *)self->_currentHeadingAnimation running])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    return (*(unsigned __int16 *)(&self->_hasUserSpecifiedZoomLevel + 1) >> 5) & 1;
  }
  return v3;
}

- (BOOL)shouldForceZoomToFit
{
  if (!self->_behavior.shouldZoomToFit) {
    return 0;
  }
  if (self->_behavior.shouldPreserveUserSpecifiedZoomLevel) {
    return !self->_hasUserSpecifiedZoomLevel;
  }
  return 1;
}

- (void)setGesturing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKAnnotationTrackingCameraController;
  [(VKCameraController *)&v4 setGesturing:a3];
  if ([(VKCameraController *)self isGesturing]) {
    [(VKAnnotationTrackingCameraController *)self pauseAnimation];
  }
  else {
    [(VKAnnotationTrackingCameraController *)self resumeAnimation];
  }
}

- (void)stopTrackingAnnotation
{
  annotation = self->_annotation;
  if (annotation)
  {
    __int16 v4 = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1);
    if ((v4 & 0x80) != 0)
    {
      [(VKTrackableAnnotation *)annotation removeObserver:self forKeyPath:@"accuracy"];
      __int16 v4 = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1);
    }
    __int16 v5 = v4 & 0xFF7F;
    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = v4 & 0xFF7F;
    if ((v4 & 4) != 0)
    {
      [(VKTrackableAnnotation *)self->_annotation removeObserver:self forKeyPath:@"heading"];
      __int16 v5 = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1);
    }
    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = v5 & 0xFFFB;
    [(VKTrackableAnnotation *)self->_annotation removeObserver:self forKeyPath:@"coordinate"];
    v6 = self->_annotation;
    self->_annotation = 0;

    [(VKTrackableAnnotationPresentation *)self->_annotationPresentation setTracking:0];
    annotationPresentation = self->_annotationPresentation;
    self->_annotationPresentation = 0;

    currentAnimation = self->_currentAnimation;
    if (currentAnimation)
    {
      if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0x10) == 0)
      {
        [(VKAnimation *)currentAnimation stop];
        v9 = self->_currentAnimation;
        self->_currentAnimation = 0;
      }
    }
    [(VKAnimation *)self->_currentHeadingAnimation stop];
    currentHeadingAnimation = self->_currentHeadingAnimation;
    self->_currentHeadingAnimation = 0;

    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) &= 0xFDF6u;
  }
}

- (void)startTrackingAnnotation:(id)a3 trackHeading:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  v28 = (VKTrackableAnnotation *)a3;
  id v13 = a7;
  p_annotation = &self->_annotation;
  if (self->_annotation == v28)
  {
    if (!v28) {
      goto LABEL_36;
    }
    goto LABEL_22;
  }
  [(VKAnnotationTrackingCameraController *)self stopTrackingAnnotation];
  if (v28)
  {
    objc_storeStrong((id *)&self->_annotation, a3);
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 128;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0xFF7F | v15;
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = 256;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0xFEFF | v16;
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 512;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0xFDFF | v17;
    if (objc_opt_respondsToSelector()) {
      __int16 v18 = 1024;
    }
    else {
      __int16 v18 = 0;
    }
    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0xFBFF | v18;
    if (objc_opt_respondsToSelector()) {
      __int16 v19 = 2048;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0xF7FF | v19;
    [(VKTrackableAnnotation *)*p_annotation addObserver:self forKeyPath:@"coordinate" options:0 context:0];
    if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0x80) != 0) {
      [(VKTrackableAnnotation *)*p_annotation addObserver:self forKeyPath:@"accuracy" options:0 context:0];
    }
    v20 = [(VKCameraController *)self cameraDelegate];
    v21 = [v20 mapLayerPresentationForAnnotation:*p_annotation];
    annotationPresentation = self->_annotationPresentation;
    self->_annotationPresentation = v21;

    [(VKTrackableAnnotationPresentation *)self->_annotationPresentation setTracking:1];
LABEL_22:
    double v23 = -1.0;
    if (a6 > 0.0) {
      double v23 = a6;
    }
    [(VKAnnotationTrackingCameraController *)self _goToAnnotationAnimated:v9 duration:v13 timingFunction:1 isInitial:v23];
  }
  if (*p_annotation)
  {
    if (((((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 4) == 0) ^ v10) & 1) == 0)
    {
      [(VKAnimation *)self->_currentHeadingAnimation stop];
      currentHeadingAnimation = self->_currentHeadingAnimation;
      self->_currentHeadingAnimation = 0;

      if ((*(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0x200) != 0)
      {
        if (v10) {
          __int16 v25 = 4;
        }
        else {
          __int16 v25 = 0;
        }
        *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1) & 0xFFFB | v25;
        v26 = *p_annotation;
        if (v10)
        {
          [(VKTrackableAnnotation *)v26 addObserver:self forKeyPath:@"heading" options:0 context:0];
          double v27 = 0.4;
          if (a6 > 0.0) {
            double v27 = a6;
          }
          [(VKAnnotationTrackingCameraController *)self _rotateToHeadingAnimated:v9 duration:v27];
        }
        else
        {
          [(VKTrackableAnnotation *)v26 removeObserver:self forKeyPath:@"heading"];
        }
      }
    }
  }
LABEL_36:
  [(VKAnnotationTrackingCameraController *)self updateFramerate];
}

- (void)updateFramerate
{
  __int16 v3 = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1);
  if ((v3 & 0x10) != 0)
  {
    __int16 v4 = [(VKCameraController *)self runLoopController];
    v6 = self;
    goto LABEL_9;
  }
  if ((v3 & 4) == 0
    || ![(VKAnimation *)self->_currentHeadingAnimation running]
    || !*(&self->_hasUserSpecifiedZoomLevel + 3))
  {
    BOOL v7 = [(VKAnimation *)self->_currentAnimation running];
    __int16 v4 = [(VKCameraController *)self runLoopController];
    v6 = self;
    if (v7)
    {
      uint64_t v5 = [(VKCameraController *)self baseDisplayRate];
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v5 = [(VKCameraController *)v6 maxDisplayRate];
    goto LABEL_10;
  }
  __int16 v4 = [(VKCameraController *)self runLoopController];
  uint64_t v5 = [(VKCameraController *)self baseDisplayRate];
LABEL_10:
  uint64_t v8 = v5;
  v4->var1 = v5;
  uint64_t var0 = (uint64_t)v4->var0;
  if (v4->var0 && !**(unsigned char **)(var0 + 1056))
  {
    md::MapEngine::setDisplayRate(var0, v8);
  }
}

- (BOOL)isTrackingHeading
{
  return (*(unsigned __int16 *)(&self->_hasUserSpecifiedZoomLevel + 1) >> 2) & 1;
}

- (void)dealloc
{
  annotation = self->_annotation;
  if (annotation)
  {
    __int16 v4 = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1);
    if ((v4 & 0x80) != 0)
    {
      [(VKTrackableAnnotation *)annotation removeObserver:self forKeyPath:@"accuracy"];
      __int16 v4 = *(_WORD *)(&self->_hasUserSpecifiedZoomLevel + 1);
      annotation = self->_annotation;
    }
    if ((v4 & 4) != 0)
    {
      [(VKTrackableAnnotation *)annotation removeObserver:self forKeyPath:@"heading"];
      annotation = self->_annotation;
    }
    [(VKTrackableAnnotation *)annotation removeObserver:self forKeyPath:@"coordinate"];
  }
  [(VKAnimation *)self->_currentAnimation stop];
  [(VKAnimation *)self->_currentHeadingAnimation stop];
  [(VKTrackableAnnotationPresentation *)self->_annotationPresentation setTracking:0];
  annotationPresentation = self->_annotationPresentation;
  self->_annotationPresentation = 0;

  v6.receiver = self;
  v6.super_class = (Class)VKAnnotationTrackingCameraController;
  [(VKAnnotationTrackingCameraController *)&v6 dealloc];
}

- (VKAnnotationTrackingCameraController)initWithMapDataAccess:(MapDataAccess *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)VKAnnotationTrackingCameraController;
  objc_super v6 = [(VKCameraController *)&v10 initWithMapDataAccess:a3 animationRunner:a4 runLoopController:a5 cameraDelegate:a6];
  BOOL v7 = v6;
  if (v6)
  {
    v6->_headingAnimationDisplayRate = -1;
    uint64_t v8 = v6;
  }

  return v7;
}

@end