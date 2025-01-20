@interface PVEffectDebugRect
- (BOOL)ignoreTransform;
- (CGRect)frame;
- (NSArray)lineDashPattern;
- (PVEffectDebugRect)init;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (double)lineDashPhase;
- (double)strokeWidth;
- (void)setFillColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIgnoreTransform:(BOOL)a3;
- (void)setLineDashPattern:(id)a3;
- (void)setLineDashPhase:(double)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeWidth:(double)a3;
@end

@implementation PVEffectDebugRect

- (PVEffectDebugRect)init
{
  v6.receiver = self;
  v6.super_class = (Class)PVEffectDebugRect;
  v2 = [(PVEffectDebugRect *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F428B8] clearColor];
    [(PVEffectDebugRect *)v2 setFillColor:v3];

    v4 = [MEMORY[0x1E4F428B8] clearColor];
    [(PVEffectDebugRect *)v2 setStrokeColor:v4];
  }
  return v2;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
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