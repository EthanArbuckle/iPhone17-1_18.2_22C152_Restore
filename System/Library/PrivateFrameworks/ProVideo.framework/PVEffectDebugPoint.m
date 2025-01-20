@interface PVEffectDebugPoint
- (BOOL)ignoreTransform;
- (CGPoint)center;
- (NSArray)lineDashPattern;
- (PVEffectDebugPoint)init;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (double)lineDashPhase;
- (double)radius;
- (double)strokeWidth;
- (void)setCenter:(CGPoint)a3;
- (void)setFillColor:(id)a3;
- (void)setIgnoreTransform:(BOOL)a3;
- (void)setLineDashPattern:(id)a3;
- (void)setLineDashPhase:(double)a3;
- (void)setRadius:(double)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeWidth:(double)a3;
@end

@implementation PVEffectDebugPoint

- (PVEffectDebugPoint)init
{
  v6.receiver = self;
  v6.super_class = (Class)PVEffectDebugPoint;
  v2 = [(PVEffectDebugPoint *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F428B8] clearColor];
    [(PVEffectDebugPoint *)v2 setFillColor:v3];

    v4 = [MEMORY[0x1E4F428B8] clearColor];
    [(PVEffectDebugPoint *)v2 setStrokeColor:v4];
  }
  return v2;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
}

- (NSArray)lineDashPattern
{
  return self->_lineDashPattern;
}

- (void)setLineDashPattern:(id)a3
{
}

- (double)lineDashPhase
{
  return self->_lineDashPhase;
}

- (void)setLineDashPhase:(double)a3
{
  self->_lineDashPhase = a3;
}

- (BOOL)ignoreTransform
{
  return self->_ignoreTransform;
}

- (void)setIgnoreTransform:(BOOL)a3
{
  self->_ignoreTransform = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineDashPattern, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);

  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end