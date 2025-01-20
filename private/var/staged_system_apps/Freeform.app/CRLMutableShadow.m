@interface CRLMutableShadow
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAngle:(double)a3;
- (void)setColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOffset:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setRadius:(double)a3;
@end

@implementation CRLMutableShadow

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D9700);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 67110146;
    unsigned int v20 = v3;
    __int16 v21 = 2082;
    v22 = "-[CRLMutableShadow copyWithZone:]";
    __int16 v23 = 2082;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShadow.m";
    __int16 v25 = 1024;
    int v26 = 452;
    __int16 v27 = 2114;
    v28 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D9720);
  }
  v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v9 = v8;
    v10 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v20 = v3;
    __int16 v21 = 2114;
    v22 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMutableShadow copyWithZone:]");
  v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShadow.m"];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 452, 0, "Abstract method not overridden by %{public}@", v14);

  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v16, "-[CRLMutableShadow copyWithZone:]");
  id v18 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v17 userInfo:0];

  objc_exception_throw(v18);
}

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
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D9740);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107DE04();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D9760);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMutableShadow setColor:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShadowMutableMethods.h"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 34, 0, "invalid nil value for '%{public}s'", "color");
  }
  [(CRLShadow *)self i_setColor:v4];
}

@end