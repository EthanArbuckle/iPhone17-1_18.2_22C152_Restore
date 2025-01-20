@interface CRLMutableCurvedShadow
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAngle:(double)a3;
- (void)setColor:(id)a3;
- (void)setCurve:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOffset:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setRadius:(double)a3;
@end

@implementation CRLMutableCurvedShadow

- (void)setAngle:(double)a3
{
  sub_100065C2C(a3);

  -[CRLShadow i_setAngle:](self, "i_setAngle:");
}

- (void)setOffset:(double)a3
{
  [(CRLCurvedShadow *)self clampOffset:a3];

  -[CRLShadow i_setOffset:](self, "i_setOffset:");
}

- (void)setRadius:(double)a3
{
  [(CRLShadow *)self clampRadius:a3];

  -[CRLShadow i_setRadius:](self, "i_setRadius:");
}

- (void)setOpacity:(double)a3
{
  [(CRLShadow *)self clampOpacity:a3];

  -[CRLShadow i_setOpacity:](self, "i_setOpacity:");
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAAC0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101099CA8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAAE0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMutableCurvedShadow setColor:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShadowMutableMethods.h"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 34, 0, "invalid nil value for '%{public}s'", "color");
  }
  [(CRLShadow *)self i_setColor:v4];
}

- (void)setCurve:(double)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CRLCurvedShadow allocWithZone:a3];
  [(CRLShadow *)self offset];
  double v6 = v5;
  [(CRLShadow *)self angle];
  double v8 = v7;
  [(CRLShadow *)self radius];
  double v10 = v9;
  [(CRLCurvedShadow *)self curve];
  double v12 = v11;
  [(CRLShadow *)self opacity];
  double v14 = v13;
  v15 = [(CRLShadow *)self color];
  v16 = [(CRLCurvedShadow *)v4 initWithOffset:v15 angle:[(CRLShadow *)self isEnabled] radius:v6 curve:v8 opacity:v10 color:v12 enabled:v14];

  return v16;
}

@end