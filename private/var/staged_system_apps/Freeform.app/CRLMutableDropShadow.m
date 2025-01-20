@interface CRLMutableDropShadow
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAngle:(double)a3;
- (void)setColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOffset:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setRadius:(double)a3;
@end

@implementation CRLMutableDropShadow

- (void)setAngle:(double)a3
{
  sub_100065C2C(a3);

  -[CRLShadow i_setAngle:](self, "i_setAngle:");
}

- (void)setOffset:(double)a3
{
  [(CRLShadow *)self clampOffset:a3];

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
    int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E71B0);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101093EDC(v5, v6);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E71D0);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v7, v5);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMutableDropShadow setColor:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShadowMutableMethods.h"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 34, 0, "invalid nil value for '%{public}s'", "color");
  }
  [(CRLShadow *)self i_setColor:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CRLDropShadow allocWithZone:a3];
  [(CRLShadow *)self angle];
  double v6 = v5;
  [(CRLShadow *)self offset];
  double v8 = v7;
  [(CRLShadow *)self radius];
  double v10 = v9;
  [(CRLShadow *)self opacity];
  double v12 = v11;
  v13 = [(CRLShadow *)self color];
  v14 = [(CRLDropShadow *)v4 initWithAngle:v13 offset:[(CRLShadow *)self isEnabled] radius:v6 opacity:v8 color:v10 enabled:v12];

  return v14;
}

@end