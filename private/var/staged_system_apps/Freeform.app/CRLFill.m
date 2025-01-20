@interface CRLFill
- (BOOL)canApplyToRenderable;
- (BOOL)drawsInOneStep;
- (BOOL)isClear;
- (BOOL)isNearlyWhite;
- (BOOL)isOpaque;
- (BOOL)requiresOutlineOnBackgroundWithAppearance:(unint64_t)a3;
- (BOOL)shouldBeReappliedToRenderable:(id)a3;
- (CRLColor)referenceColor;
- (int64_t)fillType;
- (void)applyToRenderable:(id)a3 withScale:(double)a4;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
@end

@implementation CRLFill

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v12);
  [(CRLFill *)self paintPath:Mutable inContext:a4];

  CGPathRelease(Mutable);
}

- (BOOL)canApplyToRenderable
{
  return 0;
}

- (BOOL)shouldBeReappliedToRenderable:(id)a3
{
  return 0;
}

- (void)applyToRenderable:(id)a3 withScale:(double)a4
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EBDF0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10109B76C();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EBE10);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v4);
  }
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFill applyToRenderable:withScale:]");
  v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLFill.m"];
  +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:72 isFatal:0 description:"called -applyToRenderable:withScale: on a CRLFill that can't"];
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)isNearlyWhite
{
  return 0;
}

- (BOOL)requiresOutlineOnBackgroundWithAppearance:(unint64_t)a3
{
  return 0;
}

- (BOOL)isClear
{
  return 0;
}

- (BOOL)drawsInOneStep
{
  return 0;
}

- (CRLColor)referenceColor
{
  return +[CRLColor clearColor];
}

- (int64_t)fillType
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EBE30);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10109B800();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EBE50);
  }
  v2 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v2);
  }
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFill fillType]");
  v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLFill.m"];
  +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:112 isFatal:0 description:"subclasses must override"];

  return 4;
}

@end