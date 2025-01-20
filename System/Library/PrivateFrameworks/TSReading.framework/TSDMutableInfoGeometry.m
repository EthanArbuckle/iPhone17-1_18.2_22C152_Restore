@interface TSDMutableInfoGeometry
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAngle:(double)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setHeightValid:(BOOL)a3;
- (void)setHorizontalFlip:(BOOL)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setSize:(CGSize)a3;
- (void)setTransformedBoundsOrigin:(CGPoint)a3;
- (void)setVerticalFlip:(BOOL)a3;
- (void)setWidthValid:(BOOL)a3;
@end

@implementation TSDMutableInfoGeometry

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [TSDInfoGeometry alloc];
  $CB6DE01367A4C750E2FF2F6D92039807 mFlags = self->super.mFlags;
  double mAngle = self->super.mAngle;
  double x = self->super.mPosition.x;
  double y = self->super.mPosition.y;
  double width = self->super.mSize.width;
  double height = self->super.mSize.height;

  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](v4, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", *(unsigned char *)&mFlags & 1, (*(unsigned int *)&mFlags >> 1) & 1, (*(unsigned int *)&mFlags >> 2) & 1, (*(unsigned int *)&mFlags >> 3) & 1, x, y, width, height, mAngle);
}

- (void)setPosition:(CGPoint)a3
{
  self->super.mPosition = a3;
}

- (void)setSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (a3.width < 0.0 || a3.height < 0.0)
  {
    v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDMutableInfoGeometry setSize:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInfoGeometry.m"), 539, @"Attempted to set the size of a TSDInfoGeometry with a negative width or height");
  }
  self->super.mSize.CGFloat width = width;
  self->super.mSize.CGFloat height = height;
}

- (void)setAngle:(double)a3
{
  TSDNormalizeAngleInDegrees(a3);
  self->super.double mAngle = v4;
}

- (void)setWidthValid:(BOOL)a3
{
  *(unsigned char *)&self->super.$CB6DE01367A4C750E2FF2F6D92039807 mFlags = *(unsigned char *)&self->super.mFlags & 0xFE | a3;
}

- (void)setHeightValid:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->super.$CB6DE01367A4C750E2FF2F6D92039807 mFlags = *(unsigned char *)&self->super.mFlags & 0xFD | v3;
}

- (void)setHorizontalFlip:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->super.$CB6DE01367A4C750E2FF2F6D92039807 mFlags = *(unsigned char *)&self->super.mFlags & 0xFB | v3;
}

- (void)setVerticalFlip:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->super.$CB6DE01367A4C750E2FF2F6D92039807 mFlags = *(unsigned char *)&self->super.mFlags & 0xF7 | v3;
}

- (void)setCenter:(CGPoint)a3
{
  __asm { FMOV            V3.2D, #-0.5 }
  CGFloat y = a3.y;
  self->super.mPosition = (CGPoint)vaddq_f64((float64x2_t)a3, vmulq_f64((float64x2_t)self->super.mSize, _Q3));
}

- (void)setTransformedBoundsOrigin:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(TSDInfoGeometry *)self transformedBoundsOrigin];
  double v7 = TSDSubtractPoints(self->super.mPosition.x, self->super.mPosition.y, v6);
  self->super.mPosition.double x = TSDAddPoints(x, y, v7);
  self->super.mPosition.double y = v8;
}

@end