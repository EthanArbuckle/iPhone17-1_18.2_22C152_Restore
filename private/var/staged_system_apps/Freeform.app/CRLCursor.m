@interface CRLCursor
+ (CRLCursor)cursorWithEffect:(id)a3 preview:(id)a4;
+ (CRLCursor)cursorWithEffect:(id)a3 preview:(id)a4 activeScaledRect:(CGRect)a5;
+ (CRLCursor)cursorWithShape:(id)a3 activeScaledRect:(CGRect)a4;
+ (CRLCursor)defaultCursor;
+ (CRLCursor)repContentPlatformViewPlaceholder;
+ (id)addPointCursorWithActiveScaledRect:(CGRect)a3;
+ (id)cursorForResizeType:(unint64_t)a3 activeScaledRect:(CGRect)a4;
+ (id)cursorForRotateType:(unint64_t)a3 activeScaledRect:(CGRect)a4;
+ (id)moveCursorWithActiveScaledRect:(CGRect)a3;
+ (id)tableResizeCursorForOrientation:(int)a3 activeScaledRect:(CGRect)a4;
- (CGRect)activeScaledRect;
- (CRLCursor)initWithEffect:(id)a3 preview:(id)a4 activeScaledRect:(CGRect)a5;
- (CRLCursor)initWithShape:(id)a3 activeScaledRect:(CGRect)a4;
- (NSString)identifierSuffix;
- (UIPointerEffect)effect;
- (UIPointerShape)shape;
- (UITargetedPreview)preview;
- (id)description;
- (id)initDefaultCursor;
- (id)initRepContentPlatformViewPlaceholder;
- (unint64_t)constrainedAxes;
- (void)setConstrainedAxes:(unint64_t)a3;
- (void)setIdentifierSuffix:(id)a3;
@end

@implementation CRLCursor

- (CRLCursor)initWithEffect:(id)a3 preview:(id)a4 activeScaledRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v12 = a3;
  id v13 = a4;
  if (v13)
  {
    if (v12) {
      goto LABEL_22;
    }
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EBF70);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10109BBF8();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EBF90);
  }
  v14 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v14);
  }
  v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCursor initWithEffect:preview:activeScaledRect:]");
  v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCursor.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 278, 0, "Invalid parameter not satisfying: %{public}s", "hoverPreview != nil");

  if (!v12)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBFB0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109BB64();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBFD0);
    }
    v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCursor initWithEffect:preview:activeScaledRect:]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCursor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 279, 0, "Invalid parameter not satisfying: %{public}s", "pointerEffect != nil");
  }
LABEL_22:
  v24.receiver = self;
  v24.super_class = (Class)CRLCursor;
  v20 = [(CRLCursor *)&v24 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_effect, a3);
    objc_storeStrong((id *)&v21->_preview, a4);
    v21->_activeScaledRect.origin.CGFloat x = x;
    v21->_activeScaledRect.origin.CGFloat y = y;
    v21->_activeScaledRect.size.CGFloat width = width;
    v21->_activeScaledRect.size.CGFloat height = height;
    identifierSuffiCGFloat x = v21->_identifierSuffix;
    v21->_identifierSuffiCGFloat x = (NSString *)&stru_101538650;
  }
  return v21;
}

+ (CRLCursor)cursorWithEffect:(id)a3 preview:(id)a4 activeScaledRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithEffect:v12 preview:v11 activeScaledRect:x, y, width, height];

  return (CRLCursor *)v13;
}

+ (CRLCursor)cursorWithEffect:(id)a3 preview:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v9 = [v6 view];
  [v9 frame];
  id v10 = [v8 initWithEffect:v7 preview:v6];

  return (CRLCursor *)v10;
}

- (CRLCursor)initWithShape:(id)a3 activeScaledRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBFF0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109BC8C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC010);
    }
    id v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCursor initWithShape:activeScaledRect:]");
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCursor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 298, 0, "Invalid parameter not satisfying: %{public}s", "shape != nil");
  }
  v18.receiver = self;
  v18.super_class = (Class)CRLCursor;
  v14 = [(CRLCursor *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_shape, a3);
    v15->_activeScaledRect.origin.CGFloat x = x;
    v15->_activeScaledRect.origin.CGFloat y = y;
    v15->_activeScaledRect.size.CGFloat width = width;
    v15->_activeScaledRect.size.CGFloat height = height;
    identifierSuffiCGFloat x = v15->_identifierSuffix;
    v15->_identifierSuffiCGFloat x = (NSString *)&stru_101538650;

    v15->_constrainedAxes = 0;
  }

  return v15;
}

+ (CRLCursor)cursorWithShape:(id)a3 activeScaledRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithShape:v9 activeScaledRect:x, y, width, height];

  return (CRLCursor *)v10;
}

- (id)initDefaultCursor
{
  v3.receiver = self;
  v3.super_class = (Class)CRLCursor;
  return [(CRLCursor *)&v3 init];
}

+ (CRLCursor)defaultCursor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F2F14;
  block[3] = &unk_1014CC6D8;
  block[4] = a1;
  if (qword_1016A9608 != -1) {
    dispatch_once(&qword_1016A9608, block);
  }
  v2 = (void *)qword_1016A9600;

  return (CRLCursor *)v2;
}

+ (id)cursorForResizeType:(unint64_t)a3 activeScaledRect:(CGRect)a4
{
  if (a3 < 4)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    id v13 = (void *)qword_1016A9610;
    if (!qword_1016A9610)
    {
      v14 = +[NSMutableArray arrayWithCapacity:4];
      v15 = +[UIBezierPath bezierPath];
      [v15 moveToPoint:11.0, 11.0];
      [v15 addLineToPoint:1.0, 17.5];
      [v15 addLineToPoint:11.0, 24.0];
      [v15 addLineToPoint:11.0, 11.0];
      [v15 closePath];
      [v15 moveToPoint:24.0, 11.0];
      [v15 addLineToPoint:24.0, 24.0];
      [v15 addLineToPoint:34.0, 17.5];
      [v15 addLineToPoint:24.0, 11.0];
      [v15 closePath];
      CGAffineTransformMakeTranslation(&v26, -17.5, -17.5);
      [v15 applyTransform:&v26];
      id v16 = [v15 copy];
      [v14 setObject:v16 atIndexedSubscript:0];

      id v17 = [v15 copy];
      CGAffineTransformMakeRotation(&v25, -0.785398163);
      [v17 applyTransform:&v25];
      [v14 setObject:v17 atIndexedSubscript:1];
      id v18 = [v15 copy];
      CGAffineTransformMakeRotation(&v24, 1.57079633);
      [v18 applyTransform:&v24];
      [v14 setObject:v18 atIndexedSubscript:2];
      id v19 = [v15 copy];
      CGAffineTransformMakeRotation(&v23, 0.785398163);
      [v19 applyTransform:&v23];
      [v14 setObject:v19 atIndexedSubscript:3];
      uint64_t v20 = +[NSArray arrayWithArray:v14];
      v21 = (void *)qword_1016A9610;
      qword_1016A9610 = v20;

      id v13 = (void *)qword_1016A9610;
    }
    v5 = [v13 objectAtIndexedSubscript:a3];
    id v6 = +[UIPointerShape shapeWithPath:v5];
    id v7 = +[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v6, x, y, width, height);
    [v7 setConstrainedAxes:3];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC030);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109BD20();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC050);
    }
    v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCursor cursorForResizeType:activeScaledRect:]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCursor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:331 isFatal:0 description:"Asking for invalid cursor type"];
    id v7 = 0;
  }

  return v7;
}

+ (id)cursorForRotateType:(unint64_t)a3 activeScaledRect:(CGRect)a4
{
  if (a3 < 8)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    id v13 = (void *)qword_1016A9618;
    if (!qword_1016A9618)
    {
      v14 = +[NSMutableArray arrayWithCapacity:8];
      v15 = +[UIBezierPath bezierPath];
      [v15 moveToPoint:17.84375, 2.40625];
      [v15 addLineToPoint:20.3125, 14.0625];
      [v15 addLineToPoint:23.84375, 10.53125];
      [v15 addCurveToPoint:24.21875 controlPoint1:10.875 controlPoint2:23.966935 controlPoint2:10.642287 controlPoint2:24.100128 controlPoint2:10.756378];
      [v15 addCurveToPoint:24.21875 controlPoint1:24.3125 controlPoint2:27.928727 14.58498 27.928731 20.602519];
      [v15 addCurveToPoint:24.03125 controlPoint1:24.5 controlPoint2:24.15933, 24.371917];
      [v15 addLineToPoint:23.84375, 24.65625];
      [v15 addLineToPoint:20.3125, 21.125];
      [v15 addLineToPoint:17.84375, 32.8125];
      [v15 addLineToPoint:29.53125, 30.34375];
      [v15 addLineToPoint:25.96875, 26.78125];
      [v15 addCurveToPoint:26.34375 controlPoint1:26.4375 controlPoint2:26.090566 26.668649 26.225413 26.555837];
      [v15 addCurveToPoint:26.34375 controlPoint1:8.75 controlPoint2:31.225304 controlPoint2:21.555948];
      [v15 addLineToPoint:26.15625, 8.59375];
      [v15 addLineToPoint:25.96875, 8.40625];
      [v15 addLineToPoint:29.53125, 4.875];
      [v15 addLineToPoint:17.84375, 2.40625];
      [v15 closePath];
      CGAffineTransformMakeTranslation(&v43, -17.5, -17.5);
      [v15 applyTransform:&v43];
      id v34 = [v15 copy];
      CGAffineTransformMakeRotation(&v42, 0.0);
      [v34 applyTransform:&v42];
      id v16 = [v34 copy];
      [v14 setObject:v16 atIndexedSubscript:0];

      id v33 = [v15 copy];
      CGAffineTransformMakeRotation(&v41, -0.785398163);
      [v33 applyTransform:&v41];
      id v17 = [v33 copy];
      [v14 setObject:v17 atIndexedSubscript:1];

      id v18 = [v15 copy];
      CGAffineTransformMakeRotation(&v40, -1.57079633);
      [v18 applyTransform:&v40];
      id v19 = [v18 copy];
      [v14 setObject:v19 atIndexedSubscript:2];

      id v20 = [v15 copy];
      CGAffineTransformMakeRotation(&v39, -2.35619449);
      [v20 applyTransform:&v39];
      id v21 = [v20 copy];
      [v14 setObject:v21 atIndexedSubscript:3];

      id v22 = [v15 copy];
      CGAffineTransformMakeRotation(&v38, -3.14159265);
      [v22 applyTransform:&v38];
      id v23 = [v22 copy];
      [v14 setObject:v23 atIndexedSubscript:4];

      id v24 = [v15 copy];
      CGAffineTransformMakeRotation(&v37, -3.92699082);
      [v24 applyTransform:&v37];
      id v25 = [v24 copy];
      [v14 setObject:v25 atIndexedSubscript:5];

      id v26 = [v15 copy];
      CGAffineTransformMakeRotation(&v36, -4.71238898);
      [v26 applyTransform:&v36];
      id v27 = [v26 copy];
      [v14 setObject:v27 atIndexedSubscript:6];

      id v28 = [v15 copy];
      CGAffineTransformMakeRotation(&v35, -5.49778714);
      [v28 applyTransform:&v35];
      id v29 = [v28 copy];
      [v14 setObject:v29 atIndexedSubscript:7];

      uint64_t v30 = +[NSArray arrayWithArray:v14];
      v31 = (void *)qword_1016A9618;
      qword_1016A9618 = v30;

      id v13 = (void *)qword_1016A9618;
    }
    v5 = [v13 objectAtIndexedSubscript:a3];
    id v6 = +[UIPointerShape shapeWithPath:v5];
    id v7 = +[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v6, x, y, width, height);
    [v7 setConstrainedAxes:3];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC070);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109BDA8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC090);
    }
    v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCursor cursorForRotateType:activeScaledRect:]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCursor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:387 isFatal:0 description:"Asking for invalid cursor type"];
    id v7 = 0;
  }

  return v7;
}

+ (id)moveCursorWithActiveScaledRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = (void *)qword_1016A9620;
  if (!qword_1016A9620)
  {
    id v8 = +[UIBezierPath bezierPath];
    [v8 moveToPoint:17.5, 2.0];
    [v8 addLineToPoint:12.0, 10.0];
    [v8 addLineToPoint:23.0, 10.0];
    [v8 addLineToPoint:17.5, 2.0];
    [v8 closePath];
    [v8 moveToPoint:10.0, 12.0];
    [v8 addLineToPoint:2.0, 17.5];
    [v8 addLineToPoint:10.0, 23.0];
    [v8 addLineToPoint:10.0, 12.0];
    [v8 closePath];
    [v8 moveToPoint:25.0, 12.0];
    [v8 addLineToPoint:25.0, 23.0];
    [v8 addLineToPoint:33.0, 17.5];
    [v8 addLineToPoint:25.0, 12.0];
    [v8 closePath];
    [v8 moveToPoint:12.0, 25.0];
    [v8 addLineToPoint:17.5, 33.0];
    [v8 addLineToPoint:23.0, 25.0];
    [v8 addLineToPoint:12.0, 25.0];
    [v8 closePath];
    [v8 bounds];
    double v13 = sub_100065738(v9, v10, v11, v12);
    CGAffineTransformMakeTranslation(&v20, -v13, -v14);
    [v8 applyTransform:&v20];
    v15 = (void *)qword_1016A9620;
    qword_1016A9620 = (uint64_t)v8;

    id v7 = (void *)qword_1016A9620;
  }
  id v16 = [v7 copy];
  id v17 = +[UIPointerShape shapeWithPath:v16];

  id v18 = +[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v17, x, y, width, height);
  [v18 setConstrainedAxes:3];

  return v18;
}

+ (id)addPointCursorWithActiveScaledRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = (void *)qword_1016A9628;
  if (!qword_1016A9628)
  {
    id v8 = +[UIBezierPath bezierPath];
    [v8 moveToPoint:17.5, 8.0];
    [v8 addCurveToPoint:8.0 controlPoint1:17.5 controlPoint2:12.291914, 7.999999];
    [v8 addCurveToPoint:17.5 controlPoint1:27.0 controlPoint2:8.0 22.708087 12.291914 27.0];
    [v8 addCurveToPoint:27.0 controlPoint1:17.5 controlPoint2:22.715134];
    [v8 addCurveToPoint:17.5 controlPoint1:8.0 controlPoint2:27.000001, 12.284866, 22.715134, 8.0];
    [v8 closePath];
    [v8 moveToPoint:17.5, 12.90625];
    [v8 addCurveToPoint:18.46875];
    [v8 addLineToPoint:18.46875, 16.53125];
    [v8 addLineToPoint:21.125, 16.53125];
    [v8 addCurveToPoint:22.125 controlPoint1:17.5 controlPoint2:21.724038 controlPoint2:16.53125 controlPoint2:22.125 controlPoint2:16.915059];
    [v8 addCurveToPoint:21.125 controlPoint1:18.46875 controlPoint2:22.125 controlPoint2:18.070845];
    [v8 addLineToPoint:18.46875, 18.46875];
    [v8 addLineToPoint:18.46875, 21.0];
    [v8 addCurveToPoint:17.5 controlPoint1:22.0 controlPoint2:18.468749, 21.584938, 18.077893, 22.0];
    [v8 addCurveToPoint:16.53125 controlPoint1:21.0 controlPoint2:16.922105, 22.000001];
    [v8 addLineToPoint:16.53125, 18.46875];
    [v8 addLineToPoint:13.875, 18.46875];
    [v8 addCurveToPoint:12.84375 controlPoint1:17.5 controlPoint2:13.290059 controlPoint2:18.468751];
    [v8 addCurveToPoint:13.875 controlPoint1:16.53125 controlPoint2:12.843751 controlPoint2:16.915059];
    [v8 addLineToPoint:16.53125, 16.53125];
    [v8 addLineToPoint:16.53125, 13.90625];
    [v8 addCurveToPoint:17.5 controlPoint1:12.90625 controlPoint2:16.531252];
    [v8 closePath];
    [v8 bounds];
    double v13 = sub_100065738(v9, v10, v11, v12);
    CGAffineTransformMakeTranslation(&v20, -v13, -v14);
    [v8 applyTransform:&v20];
    v15 = (void *)qword_1016A9628;
    qword_1016A9628 = (uint64_t)v8;

    id v7 = (void *)qword_1016A9628;
  }
  id v16 = [v7 copy];
  id v17 = +[UIPointerShape shapeWithPath:v16];

  id v18 = +[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v17, x, y, width, height);

  return v18;
}

+ (id)tableResizeCursorForOrientation:(int)a3 activeScaledRect:(CGRect)a4
{
  if (a3 < 2)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    double v13 = (void *)qword_1016A9630;
    if (!qword_1016A9630)
    {
      double v14 = +[NSMutableArray arrayWithCapacity:2];
      v15 = +[UIBezierPath bezierPath];
      [v15 moveToPoint:17.5, 8.0];
      [v15 addCurveToPoint:16.0 controlPoint1:9.5 controlPoint2:16.671572 controlPoint2:8.000001 controlPoint2:16.0 controlPoint2:8.671573];
      [v15 addLineToPoint:16.0, 24.5];
      [v15 addCurveToPoint:17.5 controlPoint1:26.0 controlPoint2:16.0 25.328428 16.671573 26.0];
      [v15 addCurveToPoint:19.0 controlPoint1:24.5 controlPoint2:18.328428 26.000002 19.0 25.328427];
      [v15 addLineToPoint:19.0, 9.5];
      [v15 addCurveToPoint:17.5 controlPoint1:8.0 controlPoint2:19.0];
      [v15 closePath];
      [v15 moveToPoint:12.0, 10.5];
      [v15 addLineToPoint:2.0, 17.0];
      [v15 addLineToPoint:12.0, 23.5];
      [v15 addLineToPoint:12.0, 10.5];
      [v15 closePath];
      [v15 moveToPoint:23.0, 10.5];
      [v15 addLineToPoint:23.0, 23.5];
      [v15 addLineToPoint:33.0, 17.0];
      [v15 addLineToPoint:23.0, 10.5];
      [v15 closePath];
      CGAffineTransformMakeTranslation(&v24, -17.5, -17.5);
      [v15 applyTransform:&v24];
      id v16 = [v15 copy];
      [v14 setObject:v16 atIndexedSubscript:0];

      id v17 = [v15 copy];
      CGAffineTransformMakeRotation(&v23, 1.57079633);
      [v17 applyTransform:&v23];
      id v18 = [v17 copy];
      [v14 setObject:v18 atIndexedSubscript:1];

      uint64_t v19 = +[NSArray arrayWithArray:v14];
      CGAffineTransform v20 = (void *)qword_1016A9630;
      qword_1016A9630 = v19;

      double v13 = (void *)qword_1016A9630;
    }
    v5 = [v13 objectAtIndexedSubscript:a3];
    id v21 = [v5 copy];
    id v6 = +[UIPointerShape shapeWithPath:v21];

    id v7 = +[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v6, x, y, width, height);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC0B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109BE30();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC0D0);
    }
    v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCursor tableResizeCursorForOrientation:activeScaledRect:]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCursor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:554 isFatal:0 description:"Asking for invalid cursor type"];
    id v7 = 0;
  }

  return v7;
}

+ (CRLCursor)repContentPlatformViewPlaceholder
{
  if (qword_1016A9640 != -1) {
    dispatch_once(&qword_1016A9640, &stru_1014EC0F0);
  }
  v2 = (void *)qword_1016A9638;

  return (CRLCursor *)v2;
}

- (id)initRepContentPlatformViewPlaceholder
{
  v3.receiver = self;
  v3.super_class = (Class)CRLCursor;
  return [(CRLCursor *)&v3 init];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(CRLCursor *)self activeScaledRect];
  v5 = NSStringFromCGRect(v12);
  id v6 = [(CRLCursor *)self effect];
  id v7 = [(CRLCursor *)self shape];
  id v8 = [(CRLCursor *)self identifierSuffix];
  CGFloat v9 = +[NSString stringWithFormat:@"<%@ %p activeScaledRect=%@ effect=%@ shape=%@ identifierSuffix=%@ constrainedAxes=%lu>", v4, self, v5, v6, v7, v8, [(CRLCursor *)self constrainedAxes]];

  return v9;
}

- (CGRect)activeScaledRect
{
  double x = self->_activeScaledRect.origin.x;
  double y = self->_activeScaledRect.origin.y;
  double width = self->_activeScaledRect.size.width;
  double height = self->_activeScaledRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIPointerEffect)effect
{
  return self->_effect;
}

- (UITargetedPreview)preview
{
  return self->_preview;
}

- (UIPointerShape)shape
{
  return self->_shape;
}

- (NSString)identifierSuffix
{
  return self->_identifierSuffix;
}

- (void)setIdentifierSuffix:(id)a3
{
}

- (unint64_t)constrainedAxes
{
  return self->_constrainedAxes;
}

- (void)setConstrainedAxes:(unint64_t)a3
{
  self->_constrainedAxes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierSuffix, 0);
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_preview, 0);

  objc_storeStrong((id *)&self->_effect, 0);
}

@end