@interface CRLSwappableAxesGeometry
+ (id)geometryWithXAxisAlongEdge:(int)a3;
+ (id)standardAxesGeometry;
+ (id)swappedAxesGeometry;
- (BOOL)isFlipped;
- (BOOL)rect:(CGRect)a3 horizontallyOverlapsRect:(CGRect)a4;
- (BOOL)rect:(CGRect)a3 verticallyOverlapsRect:(CGRect)a4;
- (CGPoint)makePointWithX:(double)a3 Y:(double)a4;
- (CGRect)makeHorizontalSpacingRectBetweenRect:(CGRect)a3 andRect:(CGRect)a4;
- (CGRect)makeRectWithX:(double)a3 Y:(double)a4 width:(double)a5 height:(double)a6;
- (CGRect)makeVerticalSpacingRectBetweenRect:(CGRect)a3 andRect:(CGRect)a4;
- (double)pointX:(CGPoint)a3;
- (double)pointY:(CGPoint)a3;
- (double)rectHeight:(CGRect)a3;
- (double)rectMaxX:(CGRect)a3;
- (double)rectMaxY:(CGRect)a3;
- (double)rectMidX:(CGRect)a3;
- (double)rectMidY:(CGRect)a3;
- (double)rectMinX:(CGRect)a3;
- (double)rectMinY:(CGRect)a3;
- (double)rectWidth:(CGRect)a3;
- (id)description;
- (id)initFlipped:(BOOL)a3;
- (int)edgeForStandardRectEdge:(int)a3;
- (int)horizontalOrientation;
- (int)verticalOrientation;
- (unint64_t)knobTagForStandardKnobTag:(unint64_t)a3;
@end

@implementation CRLSwappableAxesGeometry

- (id)initFlipped:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLSwappableAxesGeometry;
  id result = [(CRLSwappableAxesGeometry *)&v5 init];
  if (result) {
    *((unsigned char *)result + 16) = a3;
  }
  return result;
}

+ (id)standardAxesGeometry
{
  v2 = (void *)qword_1016A8D78;
  if (!qword_1016A8D78)
  {
    id v3 = [[CRLSwappableAxesGeometry alloc] initFlipped:0];
    v4 = (void *)qword_1016A8D78;
    qword_1016A8D78 = (uint64_t)v3;

    v2 = (void *)qword_1016A8D78;
  }

  return v2;
}

+ (id)swappedAxesGeometry
{
  v2 = (void *)qword_1016A8D80;
  if (!qword_1016A8D80)
  {
    id v3 = [[CRLSwappableAxesGeometry alloc] initFlipped:1];
    v4 = (void *)qword_1016A8D80;
    qword_1016A8D80 = (uint64_t)v3;

    v2 = (void *)qword_1016A8D80;
  }

  return v2;
}

+ (id)geometryWithXAxisAlongEdge:(int)a3
{
  if ((a3 - 3) < 3)
  {
    id v3 = +[CRLSwappableAxesGeometry swappedAxesGeometry];
  }
  else if (a3 > 2)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = +[CRLSwappableAxesGeometry standardAxesGeometry];
  }

  return v3;
}

- (unint64_t)knobTagForStandardKnobTag:(unint64_t)a3
{
  if (self->mFlipped)
  {
    if (a3 < 0xA && ((0x3DFu >> a3) & 1) != 0)
    {
      return qword_101174D78[a3];
    }
    else
    {
      int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CB340);
      }
      v4 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066834(v3, v4);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CB360);
      }
      objc_super v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v5, v3);
      }
      v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSwappableAxesGeometry knobTagForStandardKnobTag:]");
      v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSwappableAxesGeometry.m"];
      +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:88 isFatal:0 description:"Unexpected knob tag"];

      return 0;
    }
  }
  return a3;
}

- (int)edgeForStandardRectEdge:(int)a3
{
  if (self->mFlipped)
  {
    if ((a3 - 1) > 4) {
      return 3;
    }
    else {
      return dword_101174DC8[a3 - 1];
    }
  }
  return a3;
}

- (int)horizontalOrientation
{
  return self->mFlipped;
}

- (int)verticalOrientation
{
  return !self->mFlipped;
}

- (BOOL)rect:(CGRect)a3 horizontallyOverlapsRect:(CGRect)a4
{
  if (self->mFlipped) {
    return sub_1000643E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
  else {
    return sub_1000644A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
}

- (BOOL)rect:(CGRect)a3 verticallyOverlapsRect:(CGRect)a4
{
  if (self->mFlipped) {
    return sub_1000644A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
  else {
    return sub_1000643E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
}

- (double)rectMinX:(CGRect)a3
{
  if (self->mFlipped) {
    return CGRectGetMinY(a3);
  }
  else {
    return CGRectGetMinX(a3);
  }
}

- (double)rectMinY:(CGRect)a3
{
  if (self->mFlipped) {
    return CGRectGetMinX(a3);
  }
  else {
    return CGRectGetMinY(a3);
  }
}

- (double)rectMidX:(CGRect)a3
{
  if (self->mFlipped) {
    return CGRectGetMidY(a3);
  }
  else {
    return CGRectGetMidX(a3);
  }
}

- (double)rectMidY:(CGRect)a3
{
  if (self->mFlipped) {
    return CGRectGetMidX(a3);
  }
  else {
    return CGRectGetMidY(a3);
  }
}

- (double)rectMaxX:(CGRect)a3
{
  if (self->mFlipped) {
    return CGRectGetMaxY(a3);
  }
  else {
    return CGRectGetMaxX(a3);
  }
}

- (double)rectMaxY:(CGRect)a3
{
  if (self->mFlipped) {
    return CGRectGetMaxX(a3);
  }
  else {
    return CGRectGetMaxY(a3);
  }
}

- (double)rectWidth:(CGRect)a3
{
  if (self->mFlipped) {
    return CGRectGetHeight(a3);
  }
  else {
    return CGRectGetWidth(a3);
  }
}

- (double)rectHeight:(CGRect)a3
{
  if (self->mFlipped) {
    return CGRectGetWidth(a3);
  }
  else {
    return CGRectGetHeight(a3);
  }
}

- (CGRect)makeRectWithX:(double)a3 Y:(double)a4 width:(double)a5 height:(double)a6
{
  if (self->mFlipped) {
    double v6 = a4;
  }
  else {
    double v6 = a3;
  }
  if (self->mFlipped)
  {
    a4 = a3;
    double v7 = a6;
  }
  else
  {
    double v7 = a5;
  }
  if (self->mFlipped) {
    a6 = a5;
  }
  double v8 = v6;
  double v9 = v7;
  result.size.height = a6;
  result.size.width = v9;
  result.origin.y = a4;
  result.origin.x = v8;
  return result;
}

- (CGRect)makeHorizontalSpacingRectBetweenRect:(CGRect)a3 andRect:(CGRect)a4
{
  if (self->mFlipped) {
    double v4 = sub_100065110(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
  else {
    double v4 = sub_100064FC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)makeVerticalSpacingRectBetweenRect:(CGRect)a3 andRect:(CGRect)a4
{
  if (self->mFlipped) {
    double v4 = sub_100064FC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
  else {
    double v4 = sub_100065110(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (double)pointX:(CGPoint)a3
{
  if (self->mFlipped) {
    a3.x = a3.y;
  }
  return a3.x;
}

- (double)pointY:(CGPoint)a3
{
  if (!self->mFlipped) {
    a3.x = a3.y;
  }
  return a3.x;
}

- (CGPoint)makePointWithX:(double)a3 Y:(double)a4
{
  if (self->mFlipped) {
    double v4 = a4;
  }
  else {
    double v4 = a3;
  }
  if (self->mFlipped) {
    a4 = a3;
  }
  double v5 = v4;
  result.y = a4;
  result.x = v5;
  return result;
}

- (id)description
{
  if (self->mFlipped) {
    CFStringRef v2 = @"YES";
  }
  else {
    CFStringRef v2 = @"NO";
  }
  return +[NSString stringWithFormat:@"<CRLSwappableAxesGeometry: %p isFlipped: %@>", self, v2];
}

- (BOOL)isFlipped
{
  return self->mFlipped;
}

- (void).cxx_destruct
{
}

@end