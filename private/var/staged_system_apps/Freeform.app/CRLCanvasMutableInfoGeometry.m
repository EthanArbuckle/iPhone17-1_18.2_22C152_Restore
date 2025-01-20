@interface CRLCanvasMutableInfoGeometry
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

@implementation CRLCanvasMutableInfoGeometry

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CRLCanvasInfoGeometry alloc];
  $CB6DE01367A4C750E2FF2F6D92039807 flags = self->super._flags;
  double angle = self->super._angle;
  double x = self->super._position.x;
  double y = self->super._position.y;
  double width = self->super._size.width;
  double height = self->super._size.height;

  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](v4, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", *(unsigned char *)&flags & 1, (*(unsigned int *)&flags >> 1) & 1, (*(unsigned int *)&flags >> 2) & 1, (*(unsigned int *)&flags >> 3) & 1, x, y, width, height, angle);
}

- (void)setPosition:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if ((sub_100065BC8(a3.x, a3.y) & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC290);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109C09C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC2B0);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasMutableInfoGeometry setPosition:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasInfoGeometry.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:475 isFatal:0 description:"Attempted to set the position of a CRLCanvasInfoGeometry with a non-finite position"];

    CGFloat x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
  }
  self->super._position.CGFloat x = x;
  self->super._position.CGFloat y = y;
}

- (void)setSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (sub_100067C58())
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC2D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109C130();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC2F0);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasMutableInfoGeometry setSize:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasInfoGeometry.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:483 isFatal:0 description:"Attempted to set the size of a CRLCanvasInfoGeometry with NaNs"];

    double width = 1.0;
    double height = 1.0;
  }
  if (width < 0.0 || height < 0.0)
  {
    unsigned int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC310);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      unsigned int v15 = v9;
      __int16 v16 = 2082;
      v17 = "-[CRLCanvasMutableInfoGeometry setSize:]";
      __int16 v18 = 2082;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasInfoGeometry.m";
      __int16 v20 = 1024;
      int v21 = 487;
      __int16 v22 = 2048;
      double v23 = width;
      __int16 v24 = 2048;
      double v25 = height;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Attempted to set the size of a CRLCanvasInfoGeometry with a negative width or height (%f, %f)", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC330);
    }
    v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v11);
    }
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasMutableInfoGeometry setSize:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasInfoGeometry.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 487, 0, "Attempted to set the size of a CRLCanvasInfoGeometry with a negative width or height (%f, %f)", *(void *)&width, *(void *)&height);
  }
  self->super._size.double width = width;
  self->super._size.double height = height;
}

- (void)setAngle:(double)a3
{
  sub_100065C2C(a3);
  self->super._double angle = v4;
}

- (void)setWidthValid:(BOOL)a3
{
  *(unsigned char *)&self->super._$CB6DE01367A4C750E2FF2F6D92039807 flags = *(unsigned char *)&self->super._flags & 0xFE | a3;
}

- (void)setHeightValid:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->super._$CB6DE01367A4C750E2FF2F6D92039807 flags = *(unsigned char *)&self->super._flags & 0xFD | v3;
}

- (void)setHorizontalFlip:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->super._$CB6DE01367A4C750E2FF2F6D92039807 flags = *(unsigned char *)&self->super._flags & 0xFB | v3;
}

- (void)setVerticalFlip:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->super._$CB6DE01367A4C750E2FF2F6D92039807 flags = *(unsigned char *)&self->super._flags & 0xF7 | v3;
}

- (void)setCenter:(CGPoint)a3
{
  __asm { FMOV            V3.2D, #-0.5 }
  CGFloat y = a3.y;
  self->super._position = (CGPoint)vaddq_f64((float64x2_t)a3, vmulq_f64((float64x2_t)self->super._size, _Q3));
}

- (void)setTransformedBoundsOrigin:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLCanvasInfoGeometry *)self transformedBoundsOrigin];
  double v7 = sub_100064680(self->super._position.x, self->super._position.y, v6);
  self->super._position.double x = sub_100064698(x, y, v7);
  self->super._position.double y = v8;
}

@end