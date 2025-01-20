@interface TSDMutableContactShadow
- (void)setColor:(CGColor *)a3;
- (void)setHeight:(double)a3;
- (void)setOffset:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setPerspective:(double)a3;
- (void)setRadius:(double)a3;
- (void)setTSUColor:(id)a3;
@end

@implementation TSDMutableContactShadow

- (void)setHeight:(double)a3
{
  self->super.mHeight = a3;
}

- (void)setPerspective:(double)a3
{
  self->super.mHeight = sin(a3 / 180.0 * 3.14159265);
}

- (void)setRadius:(double)a3
{
  [(TSDContactShadow *)self clampRadius:a3];
  self->super.super.mRadius = v4;
}

- (void)setOffset:(double)a3
{
  [(TSDContactShadow *)self clampOffset:a3];
  self->super.super.mOffset = v4;
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
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDMutableContactShadow setColor:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContactShadow.m"), 497, @"invalid nil value for '%s'", "color");
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

  [(TSDMutableContactShadow *)self setColor:v4];
}

@end