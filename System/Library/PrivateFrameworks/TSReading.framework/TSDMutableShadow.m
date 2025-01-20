@interface TSDMutableShadow
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAngle:(double)a3;
- (void)setColor:(CGColor *)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOffset:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setRadius:(double)a3;
- (void)setTSUColor:(id)a3;
@end

@implementation TSDMutableShadow

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDMutableShadow copyWithZone:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow.m"), 663, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSDMutableShadow copyWithZone:]"), 0 reason userInfo]);
}

- (void)setAngle:(double)a3
{
  TSDNormalizeAngleInDegrees(a3);
  self->super.mAngle = v4;
}

- (void)setOffset:(double)a3
{
  [(TSDShadow *)self clampOffset:a3];
  self->super.mOffset = v4;
}

- (void)setRadius:(double)a3
{
  [(TSDShadow *)self clampRadius:a3];
  self->super.mRadius = v4;
}

- (void)setOpacity:(double)a3
{
  [(TSDShadow *)self clampOpacity:a3];
  self->super.mOpacity = v4;
}

- (void)setColor:(CGColor *)a3
{
  if (!a3)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDMutableShadow setColor:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow.m"), 689, @"invalid nil value for '%s'", "color");
  }
  mColor = self->super.mColor;
  if (mColor != a3)
  {
    CGColorRelease(mColor);
    self->super.mColor = CGColorRetain(a3);
  }
}

- (void)setTSUColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];

  [(TSDMutableShadow *)self setColor:v4];
}

- (void)setEnabled:(BOOL)a3
{
  self->super.mEnabled = a3;
}

@end