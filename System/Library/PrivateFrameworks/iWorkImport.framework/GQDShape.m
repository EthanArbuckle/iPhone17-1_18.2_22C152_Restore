@interface GQDShape
+ (const)stateForReading;
- (BOOL)isBlank;
- (BOOL)isRectangularAndAxisAlignedToAngle:(float)a3;
- (CGPath)createBezierPath;
- (GQDShape)initWithGraphic:(id)a3 path:(id)a4 geometry:(id)a5;
- (id)layoutFrame;
- (id)path;
- (void)dealloc;
@end

@implementation GQDShape

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9F4B0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDShape;
  [(GQDGraphic *)&v3 dealloc];
}

- (id)layoutFrame
{
  return self->mLayoutFrame;
}

- (BOOL)isBlank
{
  mLayoutFrame = self->mLayoutFrame;
  if (mLayoutFrame) {
    return [(GQDWPLayoutFrame *)mLayoutFrame isBlank];
  }
  else {
    return 1;
  }
}

- (BOOL)isRectangularAndAxisAlignedToAngle:(float)a3
{
  if (!self->mPath) {
    return 0;
  }
  mGeometry = self->super.super.mGeometry;
  if (mGeometry)
  {
    [(GQDAffineGeometry *)mGeometry angle];
    if (v6 != (double)(uint64_t)llround(v6) || fabsf((float)((uint64_t)llroundf(v6 - a3) % 90)) >= 0.1) {
      return 0;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  mPath = self->mPath;
  return [(GQDPath *)mPath isRectangular];
}

- (id)path
{
  return self->mPath;
}

- (CGPath)createBezierPath
{
  Mutable = CGPathCreateMutable();
  v4 = [(GQDPath *)self->mPath createBezierPath];
  memset(&v10, 0, sizeof(v10));
  [(GQDAffineGeometry *)self->super.super.mGeometry position];
  CGFloat v6 = v5;
  [(GQDAffineGeometry *)self->super.super.mGeometry position];
  CGAffineTransformMakeTranslation(&v10, v6, v7);
  v9[0] = Mutable;
  v9[1] = &v10;
  CGPathApply(v4, v9, (CGPathApplierFunction)sub_E4AC);
  CFRelease(v4);
  return Mutable;
}

- (GQDShape)initWithGraphic:(id)a3 path:(id)a4 geometry:(id)a5
{
  v8 = [(GQDShape *)self init];
  if (v8)
  {
    v8->super.mGraphicStyle = (GQDSStyle *)*((id *)a3 + 9);
    v8->super.super.mWrapPath = (GQDBezierPath *)*((id *)a3 + 4);
    v8->super.super.mWrapGeometry = (GQDAffineGeometry *)*((id *)a3 + 5);
    v9 = (__CFURL *)*((void *)a3 + 2);
    v8->super.super.mUrl = v9;
    if (v9) {
      CFRetain(v9);
    }
    v8->super.super.mUid = (char *)xmlStrdup(*((const xmlChar **)a3 + 3));
    v8->super.super.mInnerWrapPoints = 0;
    v8->super.super.mHasPagesOrder = *((unsigned char *)a3 + 56);
    v8->super.super.mPagesOrder = *((void *)a3 + 8);
    v8->mPath = (GQDPath *)a4;
    v8->super.super.mGeometry = (GQDAffineGeometry *)a5;
  }
  return v8;
}

@end