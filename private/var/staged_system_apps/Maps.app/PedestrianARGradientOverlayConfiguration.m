@interface PedestrianARGradientOverlayConfiguration
+ (PedestrianARGradientOverlayConfiguration)defaultConfiguration;
+ (PedestrianARGradientOverlayConfiguration)safetyViewConfiguration;
- (CGPoint)landscapeEndPoint;
- (CGPoint)landscapeStartPoint;
- (CGPoint)portraitEndPoint;
- (CGPoint)portraitStartPoint;
- (id)copy;
- (id)description;
- (void)setLandscapeEndPoint:(CGPoint)a3;
- (void)setLandscapeStartPoint:(CGPoint)a3;
- (void)setPortraitEndPoint:(CGPoint)a3;
- (void)setPortraitStartPoint:(CGPoint)a3;
@end

@implementation PedestrianARGradientOverlayConfiguration

+ (PedestrianARGradientOverlayConfiguration)defaultConfiguration
{
  v2 = objc_alloc_init(PedestrianARGradientOverlayConfiguration);
  -[PedestrianARGradientOverlayConfiguration setPortraitStartPoint:](v2, "setPortraitStartPoint:", 0.5, 0.5);
  -[PedestrianARGradientOverlayConfiguration setPortraitEndPoint:](v2, "setPortraitEndPoint:", 0.5, 1.0);
  -[PedestrianARGradientOverlayConfiguration setLandscapeStartPoint:](v2, "setLandscapeStartPoint:", 0.5, 0.2);
  -[PedestrianARGradientOverlayConfiguration setLandscapeEndPoint:](v2, "setLandscapeEndPoint:", 0.5, 1.0);

  return v2;
}

+ (PedestrianARGradientOverlayConfiguration)safetyViewConfiguration
{
  v2 = objc_alloc_init(PedestrianARGradientOverlayConfiguration);
  -[PedestrianARGradientOverlayConfiguration setPortraitStartPoint:](v2, "setPortraitStartPoint:", 0.5, 0.5);
  -[PedestrianARGradientOverlayConfiguration setPortraitEndPoint:](v2, "setPortraitEndPoint:", 0.5, 1.0);
  -[PedestrianARGradientOverlayConfiguration setLandscapeStartPoint:](v2, "setLandscapeStartPoint:", 0.5, 0.5);
  -[PedestrianARGradientOverlayConfiguration setLandscapeEndPoint:](v2, "setLandscapeEndPoint:", 0.5, 1.0);

  return v2;
}

- (id)copy
{
  v3 = objc_alloc_init(PedestrianARGradientOverlayConfiguration);
  -[PedestrianARGradientOverlayConfiguration setPortraitStartPoint:](v3, "setPortraitStartPoint:", self->_portraitStartPoint.x, self->_portraitStartPoint.y);
  -[PedestrianARGradientOverlayConfiguration setPortraitEndPoint:](v3, "setPortraitEndPoint:", self->_portraitEndPoint.x, self->_portraitEndPoint.y);
  -[PedestrianARGradientOverlayConfiguration setLandscapeStartPoint:](v3, "setLandscapeStartPoint:", self->_landscapeStartPoint.x, self->_landscapeStartPoint.y);
  -[PedestrianARGradientOverlayConfiguration setLandscapeEndPoint:](v3, "setLandscapeEndPoint:", self->_landscapeEndPoint.x, self->_landscapeEndPoint.y);
  return v3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = NSStringFromCGPoint(self->_portraitStartPoint);
  v6 = NSStringFromCGPoint(self->_portraitEndPoint);
  v7 = NSStringFromCGPoint(self->_landscapeStartPoint);
  v8 = NSStringFromCGPoint(self->_landscapeEndPoint);
  v9 = +[NSString stringWithFormat:@"<%@: %p, portraitStartPoint: %@, portraitEndPoint: %@, landscapeStartPoint: %@, landscapeEndPoint: %@>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (CGPoint)portraitStartPoint
{
  double x = self->_portraitStartPoint.x;
  double y = self->_portraitStartPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPortraitStartPoint:(CGPoint)a3
{
  self->_portraitStartPoint = a3;
}

- (CGPoint)portraitEndPoint
{
  double x = self->_portraitEndPoint.x;
  double y = self->_portraitEndPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPortraitEndPoint:(CGPoint)a3
{
  self->_portraitEndPoint = a3;
}

- (CGPoint)landscapeStartPoint
{
  double x = self->_landscapeStartPoint.x;
  double y = self->_landscapeStartPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLandscapeStartPoint:(CGPoint)a3
{
  self->_landscapeStartPoint = a3;
}

- (CGPoint)landscapeEndPoint
{
  double x = self->_landscapeEndPoint.x;
  double y = self->_landscapeEndPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLandscapeEndPoint:(CGPoint)a3
{
  self->_landscapeEndPoint = a3;
}

@end