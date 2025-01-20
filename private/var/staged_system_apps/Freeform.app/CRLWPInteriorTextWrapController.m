@interface CRLWPInteriorTextWrapController
+ (id)sharedInteriorTextWrapController;
- (BOOL)checkForUnobstructedSpan:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5;
- (double)nextUnobstructedSpanStartingAt:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5;
- (id)beginWrappingToColumn:(id)a3 columnTransformFromWP:(CGAffineTransform *)a4 target:(id)a5 hasWrappables:(BOOL *)a6;
- (void)splitLine:(CGRect)a3 lineSegmentRects:(id)a4 wrappableAttachments:(id)a5 ignoreFloatingGraphics:(BOOL)a6 canvasCausedWrap:(BOOL *)a7 skipHint:(double *)a8 userInfo:(id)a9;
@end

@implementation CRLWPInteriorTextWrapController

+ (id)sharedInteriorTextWrapController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F4D30;
  block[3] = &unk_1014CC6D8;
  block[4] = a1;
  if (qword_1016A9650 != -1) {
    dispatch_once(&qword_1016A9650, block);
  }
  v2 = (void *)qword_1016A9648;

  return v2;
}

- (id)beginWrappingToColumn:(id)a3 columnTransformFromWP:(CGAffineTransform *)a4 target:(id)a5 hasWrappables:(BOOL *)a6
{
  id v9 = a5;
  id v10 = a3;
  v11 = objc_alloc_init(CRLWPInteriorCookie);
  [(CRLWPInteriorCookie *)v11 setLayout:v9];
  [(CRLWPInteriorCookie *)v11 setColumn:v10];

  long long v12 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v16.c = v12;
  *(_OWORD *)&v16.tx = *(_OWORD *)&a4->tx;
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformInvert(&v17, &v16);
  v13 = [v9 interiorWrapSegments];

  CGAffineTransform v16 = v17;
  v14 = [v13 wrapSegmentsByApplyingAffineTransform:&v16];
  [(CRLWPInteriorCookie *)v11 setInteriorWrapSegmentsInWrapSpace:v14];

  *a6 = 1;

  return v11;
}

- (void)splitLine:(CGRect)a3 lineSegmentRects:(id)a4 wrappableAttachments:(id)a5 ignoreFloatingGraphics:(BOOL)a6 canvasCausedWrap:(BOOL *)a7 skipHint:(double *)a8 userInfo:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a4;
  *a8 = 1.0;
  id v15 = a9;
  uint64_t v16 = objc_opt_class();
  CGAffineTransform v17 = sub_1002469D0(v16, v15);

  if (v17)
  {
    v18 = [v17 interiorWrapSegmentsInWrapSpace];
    +[CRLWPTextWrapper splitLine:lineSegmentRects:wrapSegments:type:skipHint:](CRLWPTextWrapper, "splitLine:lineSegmentRects:wrapSegments:type:skipHint:", v19, v18, 0, 0, x, y, width, height);
  }
}

- (double)nextUnobstructedSpanStartingAt:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  unsigned int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC150);
  }
  id v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v18 = v8;
    __int16 v19 = 2082;
    v20 = "-[CRLWPInteriorTextWrapController nextUnobstructedSpanStartingAt:wrappableAttachments:userInfo:]";
    __int16 v21 = 2082;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPInteriorTextWrapController.m";
    __int16 v23 = 1024;
    int v24 = 76;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC170);
  }
  id v10 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    long long v12 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v18 = v8;
    __int16 v19 = 2114;
    v20 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPInteriorTextWrapController nextUnobstructedSpanStartingAt:wrappableAttachments:userInfo:]");
  v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPInteriorTextWrapController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:76 isFatal:0 description:"Do not call method"];

  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLWPInteriorTextWrapController nextUnobstructedSpanStartingAt:wrappableAttachments:userInfo:]");
  id v16 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (BOOL)checkForUnobstructedSpan:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  unsigned int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC190);
  }
  id v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v18 = v8;
    __int16 v19 = 2082;
    v20 = "-[CRLWPInteriorTextWrapController checkForUnobstructedSpan:wrappableAttachments:userInfo:]";
    __int16 v21 = 2082;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPInteriorTextWrapController.m";
    __int16 v23 = 1024;
    int v24 = 82;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EC1B0);
  }
  id v10 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    long long v12 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v18 = v8;
    __int16 v19 = 2114;
    v20 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPInteriorTextWrapController checkForUnobstructedSpan:wrappableAttachments:userInfo:]");
  v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPInteriorTextWrapController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:82 isFatal:0 description:"Do not call method"];

  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLWPInteriorTextWrapController checkForUnobstructedSpan:wrappableAttachments:userInfo:]");
  id v16 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

@end