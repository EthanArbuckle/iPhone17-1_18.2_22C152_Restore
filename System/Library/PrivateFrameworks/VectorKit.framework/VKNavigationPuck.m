@interface VKNavigationPuck
- ($F24F406B2B787EFB06265DBA3D28CBD5)presentationCoordinate;
- (BOOL)animatingToCoordinate;
- (BOOL)enabled;
- (BOOL)isAnimatingAccuracy;
- (BOOL)showCourse;
- (BOOL)stale;
- (BOOL)tracking;
- (VKAnnotation)annotation;
- (VKEdgeInsets)annotationTrackingEdgeInsets;
- (VKNavigationPuck)initWithAnimationRunner:(AnimationRunner *)a3;
- (double)minimumAccuracy;
- (double)presentationAccuracy;
- (double)presentationCourse;
- (float)scale;
- (int)mode;
- (void)dealloc;
- (void)destroyAnimationRunner;
- (void)puck;
- (void)runAnimation:(id)a3;
- (void)setAnimatingAccuracy:(BOOL)a3;
- (void)setAnimatingToCoordinate:(BOOL)a3;
- (void)setAnnotation:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMode:(int)a3;
- (void)setPresentationAccuracy:(double)a3;
- (void)setPresentationCoordinate:(id)a3;
- (void)setPresentationCourse:(double)a3;
- (void)setScale:(float)a3;
- (void)setShowCourse:(BOOL)a3;
- (void)setStale:(BOOL)a3;
- (void)setTracking:(BOOL)a3;
@end

@implementation VKNavigationPuck

- (void)setAnimatingToCoordinate:(BOOL)a3
{
  if (self->_animatingToCoordinate != a3)
  {
    BOOL v3 = a3;
    [(VKNavigationPuck *)self presentationCoordinate];
    self->_animatingToCoordinate = v3;
    if (v3)
    {
      navigationPuck = (double *)self->_navigationPuck;
      navigationPuck[1] = v5 * 0.0174532925;
      navigationPuck[2] = v6 * 0.0174532925;
      navigationPuck[3] = 0.0;
    }
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)presentationCoordinate
{
  if (self->_tracking || self->_animatingToCoordinate)
  {
    navigationPuck = (double *)self->_navigationPuck;
    double v3 = navigationPuck[1] * 57.2957795;
    double v4 = navigationPuck[2] * 57.2957795;
  }
  else
  {
    [(VKAnnotation *)self->_annotation coordinate];
  }
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (void)setAnnotation:(id)a3
{
  double v5 = (VKAnnotation *)a3;
  if (self->_annotation != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_annotation, a3);
    navigationPuck = (double *)self->_navigationPuck;
    [(VKAnnotation *)self->_annotation coordinate];
    double v8 = v7;
    [(VKAnnotation *)self->_annotation coordinate];
    navigationPuck[1] = v8 * 0.0174532925;
    navigationPuck[2] = v9 * 0.0174532925;
    navigationPuck[3] = 0.0;
    double v5 = v10;
  }
}

- (void)setPresentationCourse:(double)a3
{
  *((double *)self->_navigationPuck + 4) = a3 * 0.0174532925;
}

- (void)setShowCourse:(BOOL)a3
{
  *((unsigned char *)self->_navigationPuck + 49) = a3;
}

- (void)setScale:(float)a3
{
  *((float *)self->_navigationPuck + 10) = a3;
}

- (void)setStale:(BOOL)a3
{
  if (self->_stale != a3)
  {
    if (a3) {
      uint64_t v5 = 4004;
    }
    else {
      uint64_t v5 = 4005;
    }
    [MEMORY[0x1E4F63E30] captureUserAction:v5 target:505 value:0];
    self->_stale = a3;
  }
}

- (void)setPresentationCoordinate:(id)a3
{
  navigationPuck = (double *)self->_navigationPuck;
  navigationPuck[1] = a3.var0 * 0.0174532925;
  navigationPuck[2] = a3.var1 * 0.0174532925;
  navigationPuck[3] = 0.0;
}

- (void)setMode:(int)a3
{
  *((_DWORD *)self->_navigationPuck + 11) = a3 != 0;
}

- (BOOL)enabled
{
  return *((unsigned char *)self->_navigationPuck + 48);
}

- (void)puck
{
  return self->_navigationPuck;
}

- (VKNavigationPuck)initWithAnimationRunner:(AnimationRunner *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VKNavigationPuck;
  double v4 = [(VKNavigationPuck *)&v6 init];
  if (v4)
  {
    v4->_animationRunner = a3;
    v4->_stale = 1;
    operator new();
  }

  return 0;
}

- (void)setTracking:(BOOL)a3
{
  if (self->_tracking != a3)
  {
    BOOL v3 = a3;
    [(VKNavigationPuck *)self presentationCoordinate];
    self->_tracking = v3;
    if (v3)
    {
      navigationPuck = (double *)self->_navigationPuck;
      navigationPuck[1] = v5 * 0.0174532925;
      navigationPuck[2] = v6 * 0.0174532925;
      navigationPuck[3] = 0.0;
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  navigationPuck = self->_navigationPuck;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  double v5 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v6 = "false";
    if (v3) {
      double v6 = "true";
    }
    int v7 = 136315138;
    double v8 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "NavigationPuck set enabled: %s", (uint8_t *)&v7, 0xCu);
  }

  navigationPuck[48] = v3;
}

- (void).cxx_destruct
{
}

- (void)setPresentationAccuracy:(double)a3
{
  self->_presentationAccuracy = a3;
}

- (double)presentationAccuracy
{
  return self->_presentationAccuracy;
}

- (void)setAnimatingAccuracy:(BOOL)a3
{
  self->_animatingAccuracy = a3;
}

- (BOOL)isAnimatingAccuracy
{
  return self->_animatingAccuracy;
}

- (BOOL)animatingToCoordinate
{
  return self->_animatingToCoordinate;
}

- (BOOL)stale
{
  return self->_stale;
}

- (VKAnnotation)annotation
{
  return self->_annotation;
}

- (BOOL)tracking
{
  return self->_tracking;
}

- (float)scale
{
  return *((float *)self->_navigationPuck + 10);
}

- (BOOL)showCourse
{
  return *((unsigned char *)self->_navigationPuck + 49);
}

- (double)presentationCourse
{
  return *((double *)self->_navigationPuck + 4) * 57.2957795;
}

- (int)mode
{
  return *((_DWORD *)self->_navigationPuck + 11) != 0;
}

- (double)minimumAccuracy
{
  return 0.0;
}

- (void)runAnimation:(id)a3
{
  double v5 = (VKAnimation *)a3;
  animationRunner = (md::MapEngine **)self->_animationRunner;
  if (animationRunner) {
    md::AnimationRunner::runAnimation(animationRunner, v5);
  }
}

- (void)destroyAnimationRunner
{
  self->_animationRunner = 0;
}

- (VKEdgeInsets)annotationTrackingEdgeInsets
{
  float v2 = 0.0;
  float v3 = 0.0;
  float v4 = 0.0;
  float v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)dealloc
{
  navigationPuck = self->_navigationPuck;
  if (navigationPuck) {
    MEMORY[0x1A6239270](navigationPuck, 0x1020C40E65606A5);
  }
  v4.receiver = self;
  v4.super_class = (Class)VKNavigationPuck;
  [(VKNavigationPuck *)&v4 dealloc];
}

@end