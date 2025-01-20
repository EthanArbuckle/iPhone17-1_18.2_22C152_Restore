@interface TSDMutableCurvedShadow
- (void)setAngle:(double)a3;
- (void)setColor:(CGColor *)a3;
- (void)setCurve:(double)a3;
- (void)setOffset:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setRadius:(double)a3;
- (void)setTSUColor:(id)a3;
@end

@implementation TSDMutableCurvedShadow

- (void)setCurve:(double)a3
{
  self->super.mCurve = a3;
}

- (void)setOffset:(double)a3
{
  [(TSDCurvedShadow *)self clampOffset:a3];
  self->super.super.mOffset = v4;
}

- (void)setAngle:(double)a3
{
  self->super.super.mAngle = a3;
}

- (void)setRadius:(double)a3
{
  self->super.super.mRadius = a3;
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
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDMutableCurvedShadow setColor:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCurvedShadow.m"), 376, @"invalid nil value for '%s'", "color");
  }
  mColor = self->super.super.mColor;
  if (mColor != a3)
  {
    CGColorRelease(mColor);
    self->super.super.mColor = CGColorRetain(a3);
  }
}

- (void)setTSUColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];

  [(TSDMutableCurvedShadow *)self setColor:v4];
}

@end