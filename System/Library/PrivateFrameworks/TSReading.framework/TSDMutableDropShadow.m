@interface TSDMutableDropShadow
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAngle:(double)a3;
- (void)setColor:(CGColor *)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOffset:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setRadius:(double)a3;
- (void)setTSUColor:(id)a3;
@end

@implementation TSDMutableDropShadow

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TSDDropShadow allocWithZone:a3];
  [(TSDShadow *)self angle];
  double v6 = v5;
  [(TSDShadow *)self offset];
  double v8 = v7;
  [(TSDShadow *)self radius];
  double v10 = v9;
  [(TSDShadow *)self opacity];
  double v12 = v11;
  v13 = [(TSDShadow *)self color];
  BOOL v14 = [(TSDShadow *)self isEnabled];

  return [(TSDDropShadow *)v4 initWithAngle:v13 offset:v14 radius:v6 opacity:v8 color:v10 enabled:v12];
}

- (void)setAngle:(double)a3
{
  TSDNormalizeAngleInDegrees(a3);
  self->super.super.mAngle = v4;
}

- (void)setOffset:(double)a3
{
  [(TSDShadow *)self clampOffset:a3];
  self->super.super.mOffset = v4;
}

- (void)setRadius:(double)a3
{
  [(TSDShadow *)self clampRadius:a3];
  self->super.super.mRadius = v4;
}

- (void)setOpacity:(double)a3
{
  [(TSDShadow *)self clampOpacity:a3];
  self->super.super.mOpacity = v4;
}

- (void)setColor:(CGColor *)a3
{
  if (!a3)
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDMutableDropShadow setColor:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDropShadow.m"), 314, @"invalid nil value for '%s'", "color");
  }
  mColor = self->super.super.mColor;
  if (mColor != a3)
  {
    CGColorRelease(mColor);
    self->super.super.mColor = CGColorRetain(a3);
  }
}

- (void)setEnabled:(BOOL)a3
{
  self->super.super.mEnabled = a3;
}

- (void)setTSUColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];

  [(TSDMutableDropShadow *)self setColor:v4];
}

@end