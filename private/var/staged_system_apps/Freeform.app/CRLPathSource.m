@interface CRLPathSource
+ (id)pathSourceForShapeType:(int64_t)a3 naturalSize:(CGSize)a4;
- (BOOL)canUseToChangeShape;
- (BOOL)hasHorizontalFlip;
- (BOOL)hasVerticalFlip;
- (BOOL)isCircular;
- (BOOL)isClosed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRectangular;
- (BOOL)isRectangularForever;
- (CGAffineTransform)pathFlipTransform;
- (CGSize)naturalSize;
- (CRLBezierPath)bezierPath;
- (CRLBezierPath)bezierPathWithoutFlips;
- (CRLBezierPath)interiorWrapPath;
- (Class)preferredControllerClass;
- (NSString)inferredAccessibilityDescription;
- (NSString)inferredAccessibilityDescriptionNoShapeNames;
- (NSString)inferredLocalizedAccessibilityDescriptionPlaceholder;
- (NSString)localizationKey;
- (NSString)name;
- (NSString)userDefinedIdentifier;
- (NSString)userDefinedName;
- (double)uniformScaleForScalingToNaturalSize:(CGSize)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)interiorWrapPathForInset:(double)a3 joinStyle:(unint64_t)a4;
- (unint64_t)hash;
- (void)setHasHorizontalFlip:(BOOL)a3;
- (void)setHasVerticalFlip:(BOOL)a3;
- (void)setLocalizationKey:(id)a3;
- (void)setNaturalSize:(CGSize)a3;
- (void)setUserDefinedIdentifier:(id)a3;
- (void)setUserDefinedName:(id)a3;
@end

@implementation CRLPathSource

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  if (v4)
  {
    [v4 setHasHorizontalFlip:[self hasHorizontalFlip]];
    [v4 setHasVerticalFlip:[self hasVerticalFlip]];
    v5 = [(CRLPathSource *)self localizationKey];
    [v4 setLocalizationKey:v5];

    v6 = [(CRLPathSource *)self userDefinedIdentifier];
    [v4 setUserDefinedIdentifier:v6];

    v7 = [(CRLPathSource *)self userDefinedName];
    [v4 setUserDefinedName:v7];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRLPathSource *)a3;
  if (v4 == self)
  {
    v7 = 0;
    LOBYTE(v6) = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      unsigned int v8 = [(CRLPathSource *)self hasHorizontalFlip];
      if (v8 == [(CRLPathSource *)v7 hasHorizontalFlip])
      {
        unsigned int v9 = [(CRLPathSource *)self hasVerticalFlip];
        unsigned int v6 = v9 ^ [(CRLPathSource *)v7 hasVerticalFlip] ^ 1;
      }
      else
      {
        LOBYTE(v6) = 0;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
      v7 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unsigned __int8 v6 = [(CRLPathSource *)self hasHorizontalFlip];
  unsigned __int8 v5 = [(CRLPathSource *)self hasVerticalFlip];
  uint64_t v3 = sub_1000C8048((char *)&v6, 1);
  return sub_1000C8080((char *)&v5, 1, v3);
}

- (BOOL)isRectangular
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF8F8);
  }
  uint64_t v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    unsigned __int8 v5 = (objc_class *)objc_opt_class();
    unsigned __int8 v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    v21 = "-[CRLPathSource isRectangular]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m";
    __int16 v24 = 1024;
    int v25 = 108;
    __int16 v26 = 2114;
    v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF918);
  }
  v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unsigned int v8 = v7;
    unsigned int v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathSource isRectangular]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m"];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 108, 0, "Abstract method not overridden by %{public}@", v13);

  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLPathSource isRectangular]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (BOOL)isRectangularForever
{
  return 0;
}

- (BOOL)isCircular
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF938);
  }
  uint64_t v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    unsigned __int8 v5 = (objc_class *)objc_opt_class();
    unsigned __int8 v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    v21 = "-[CRLPathSource isCircular]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m";
    __int16 v24 = 1024;
    int v25 = 118;
    __int16 v26 = 2114;
    v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF958);
  }
  v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unsigned int v8 = v7;
    unsigned int v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathSource isCircular]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m"];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 118, 0, "Abstract method not overridden by %{public}@", v13);

  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLPathSource isCircular]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (BOOL)isClosed
{
  return 1;
}

- (CRLBezierPath)bezierPath
{
  uint64_t v3 = [(CRLPathSource *)self bezierPathWithoutFlips];
  [(CRLPathSource *)self pathFlipTransform];
  [v3 transformUsingAffineTransform:&v5];

  return (CRLBezierPath *)v3;
}

- (CRLBezierPath)bezierPathWithoutFlips
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF978);
  }
  uint64_t v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    unsigned __int8 v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    v21 = "-[CRLPathSource bezierPathWithoutFlips]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m";
    __int16 v24 = 1024;
    int v25 = 133;
    __int16 v26 = 2114;
    v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF998);
  }
  v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unsigned int v8 = v7;
    unsigned int v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathSource bezierPathWithoutFlips]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m"];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 133, 0, "Abstract method not overridden by %{public}@", v13);

  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLPathSource bezierPathWithoutFlips]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (CRLBezierPath)interiorWrapPath
{
  uint64_t v3 = [(CRLPathSource *)self bezierPath];
  if ((uint64_t)[v3 elementCount] >= 5001)
  {
    [(CRLPathSource *)self naturalSize];
    uint64_t v4 = +[CRLBezierPath bezierPathWithRect:sub_100064070()];

    uint64_t v3 = (void *)v4;
  }

  return (CRLBezierPath *)v3;
}

- (id)interiorWrapPathForInset:(double)a3 joinStyle:(unint64_t)a4
{
  unsigned __int8 v6 = [(CRLPathSource *)self interiorWrapPath];
  v7 = [v6 bezierPathByRemovingSmallSubpathsForInteriorWrapsForInset:a3];

  [v7 bounds];
  double v10 = a3 + a3;
  if (a3 > 0.0 && v8 > v10 && v9 > v10)
  {
    uint64_t v13 = [v7 bezierPathByOffsettingPath:a4 joinStyle:-a3];

    v7 = (void *)v13;
  }

  return v7;
}

- (Class)preferredControllerClass
{
  return 0;
}

- (CGSize)naturalSize
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF9B8);
  }
  uint64_t v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    unsigned __int8 v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    v21 = "-[CRLPathSource naturalSize]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m";
    __int16 v24 = 1024;
    int v25 = 168;
    __int16 v26 = 2114;
    v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF9D8);
  }
  v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    double v8 = v7;
    double v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathSource naturalSize]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m"];
  v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 168, 0, "Abstract method not overridden by %{public}@", v13);

  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLPathSource naturalSize]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (void)setNaturalSize:(CGSize)a3
{
  unsigned int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF9F8);
  }
  uint64_t v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = v4;
    unsigned __int8 v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 67110146;
    unsigned int v20 = v3;
    __int16 v21 = 2082;
    __int16 v22 = "-[CRLPathSource setNaturalSize:]";
    __int16 v23 = 2082;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m";
    __int16 v25 = 1024;
    int v26 = 172;
    __int16 v27 = 2114;
    v28 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FFA18);
  }
  double v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    double v9 = v8;
    double v10 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v20 = v3;
    __int16 v21 = 2114;
    __int16 v22 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathSource setNaturalSize:]");
  v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m"];
  uint64_t v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 172, 0, "Abstract method not overridden by %{public}@", v14);

  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v16, "-[CRLPathSource setNaturalSize:]");
  id v18 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v17 userInfo:0];

  objc_exception_throw(v18);
}

- (double)uniformScaleForScalingToNaturalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CRLPathSource *)self naturalSize];
  double v7 = 1.0;
  if (v5 <= 1.0 || v6 <= 1.0) {
    return v7;
  }
  double v9 = width / v5;
  double v10 = height / v6;
  if (v9 >= 1.0 || v10 >= 1.0)
  {
    BOOL v12 = v10 <= 1.0 || v9 <= 1.0;
    double v13 = fmin(v9, v10);
    if (!v12) {
      return v13;
    }
    return v7;
  }
  return fmax(v9, v10);
}

- (CGAffineTransform)pathFlipTransform
{
  long long v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v23 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v22;
  long long v21 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v21;
  unsigned int v5 = [(CRLPathSource *)self hasHorizontalFlip];
  result = (CGAffineTransform *)[(CRLPathSource *)self hasVerticalFlip];
  int v7 = (int)result;
  if ((v5 & 1) != 0 || result)
  {
    if (v5) {
      double v8 = -1.0;
    }
    else {
      double v8 = 1.0;
    }
    CGFloat y = CGPointZero.y;
    [(CRLPathSource *)self naturalSize];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    v26.origin.x = CGPointZero.x;
    v26.origin.CGFloat y = y;
    v26.size.double width = v11;
    v26.size.double height = v13;
    double MidX = CGRectGetMidX(v26);
    v27.origin.x = CGPointZero.x;
    v27.origin.CGFloat y = y;
    v27.size.double width = v11;
    v27.size.double height = v13;
    double MidY = CGRectGetMidY(v27);
    *(_OWORD *)&v25.a = v23;
    *(_OWORD *)&v25.c = v22;
    *(_OWORD *)&v25.tx = v21;
    CGAffineTransformTranslate(retstr, &v25, MidX, MidY);
    if (v7) {
      double v16 = -1.0;
    }
    else {
      double v16 = 1.0;
    }
    long long v17 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v24.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v24.c = v17;
    *(_OWORD *)&v24.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v25, &v24, v8, v16);
    long long v18 = *(_OWORD *)&v25.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v25.a;
    *(_OWORD *)&retstr->c = v18;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v25.tx;
    long long v19 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v24.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v24.c = v19;
    *(_OWORD *)&v24.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformTranslate(&v25, &v24, -MidX, -MidY);
    long long v20 = *(_OWORD *)&v25.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v25.a;
    *(_OWORD *)&retstr->c = v20;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v25.tx;
  }
  return result;
}

+ (id)pathSourceForShapeType:(int64_t)a3 naturalSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a4.height / 100.0;
  switch(a3)
  {
    case 0:
    case 3:
      double v9 = +[CRLBezierPath bezierPathWithRect:sub_100064070()];
      uint64_t v4 = +[CRLBezierPathSource pathSourceWithBezierPath:v9];
      -[CRLEditableBezierPathSource setNaturalSize:](v4, "setNaturalSize:", width, height);
      goto LABEL_23;
    case 1:
    case 15:
    case 16:
    case 20:
      double v9 = +[CRLBezierPath bezierPathWithStart:end:](CRLBezierPath, "bezierPathWithStart:end:", CGPointZero.x, CGPointZero.y, sqrt(width * width + a4.height * a4.height), 0.0);
      goto LABEL_22;
    case 2:
    case 18:
    case 19:
      +[CRLConnectionLinePathSource pathSourceAtAngleOfSize:forType:](CRLConnectionLinePathSource, "pathSourceAtAngleOfSize:forType:", a3 == 18, width, a4.height);
      double v10 = (CRLEditableBezierPathSource *)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = v10;
      if (a3 == 2) {
        [(CRLEditableBezierPathSource *)v10 bend];
      }
      break;
    case 4:
      uint64_t v14 = +[CRLScalarPathSource roundedRectangleWithScalar:naturalSize:continuousCurve:](CRLScalarPathSource, "roundedRectangleWithScalar:naturalSize:continuousCurve:", 1, 15.0, width, a4.height);
      goto LABEL_16;
    case 5:
      v15 = +[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, width, a4.height);
      double v9 = v15;
      goto LABEL_21;
    case 6:
      double v9 = +[CRLBezierPath bezierPath];
      [v9 moveToPoint:width * 0.5, 0.0];
      [v9 lineToPoint:width, height];
      double v13 = 0.0;
      double v12 = v9;
      goto LABEL_18;
    case 7:
      double v9 = +[CRLBezierPath bezierPath];
      [v9 moveToPoint:0.0, 0.0];
      [v9 lineToPoint:0.0, width];
      double v12 = v9;
      double v13 = width;
LABEL_18:
      double v11 = height;
      goto LABEL_19;
    case 8:
      uint64_t v14 = +[CRLPointPathSource rightSingleArrowWithPoint:naturalSize:](CRLPointPathSource, "rightSingleArrowWithPoint:naturalSize:", v8 * 64.0, 0.34, width, a4.height);
      goto LABEL_16;
    case 9:
      uint64_t v14 = +[CRLPointPathSource doubleArrowWithPoint:naturalSize:](CRLPointPathSource, "doubleArrowWithPoint:naturalSize:", v8 * 44.0, 0.34, width, a4.height);
      goto LABEL_16;
    case 10:
      double v9 = +[CRLBezierPath bezierPath];
      [v9 moveToPoint:0.0, height * 0.5];
      [v9 lineToPoint:width * 0.5, height];
      [v9 lineToPoint:width height * 0.5];
      double v11 = 0.0;
      double v12 = v9;
      double v13 = width * 0.5;
LABEL_19:
      [v12 lineToPoint:v13, v11];
      v15 = v9;
LABEL_21:
      [v15 closePath];
LABEL_22:
      uint64_t v4 = +[CRLBezierPathSource pathSourceWithBezierPath:v9];
      goto LABEL_23;
    case 11:
      uint64_t v14 = +[CRLCalloutPathSource quoteBubbleWithTailPosition:tailSize:naturalSize:](CRLCalloutPathSource, "quoteBubbleWithTailPosition:tailSize:naturalSize:", v8, v8 * 96.0, v8 * 10.0, width, a4.height * 0.8);
      goto LABEL_16;
    case 12:
      uint64_t v14 = +[CRLCalloutPathSource calloutWithCornerRadius:tailPosition:tailSize:naturalSize:](CRLCalloutPathSource, "calloutWithCornerRadius:tailPosition:tailSize:naturalSize:", 5.0, v8 * -20.0, v8 * 50.0, v8 * 10.0, width, a4.height);
      goto LABEL_16;
    case 13:
      uint64_t v14 = +[CRLScalarPathSource regularPolygonWithScalar:naturalSize:](CRLScalarPathSource, "regularPolygonWithScalar:naturalSize:", 5.0, width, a4.height);
      goto LABEL_16;
    case 14:
      uint64_t v14 = +[CRLPointPathSource starWithPoint:naturalSize:](CRLPointPathSource, "starWithPoint:naturalSize:", 5.0, 0.382, width, a4.height);
LABEL_16:
      uint64_t v4 = (CRLEditableBezierPathSource *)v14;
      break;
    case 17:
      uint64_t v4 = objc_alloc_init(CRLEditableBezierPathSource);
      double v9 = +[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:", CGPointZero.x, CGPointZero.y);
      [(CRLEditableBezierPathSource *)v4 addNode:v9];
LABEL_23:

      break;
    case 21:
      int v17 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FFA38);
      }
      long long v18 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BC458(v17, v18);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FFA58);
      }
      long long v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v19, v17);
      }
      sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Should not be trying to get the path of a custom shape from here!", v20, v21, v22, v23, v24, v25, v26, (uint64_t)"+[CRLPathSource pathSourceForShapeType:naturalSize:]");
      CGRect v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPathSource pathSourceForShapeType:naturalSize:]");
      v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m"];
      +[CRLAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:309 isFatal:1 description:"Should not be trying to get the path of a custom shape from here!"];

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v29, v30);
      abort();
    default:
      break;
  }

  return v4;
}

- (NSString)name
{
  return 0;
}

- (BOOL)canUseToChangeShape
{
  unsigned int v3 = [(CRLPathSource *)self bezierPath];
  if ([v3 isEmpty])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    unsigned int v5 = [(CRLPathSource *)self bezierPath];
    unsigned int v4 = [v5 isLineSegment] ^ 1;
  }
  return v4;
}

- (NSString)inferredAccessibilityDescription
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FFA78);
  }
  unsigned int v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unsigned int v4 = v3;
    unsigned int v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    uint64_t v21 = "-[CRLPathSource inferredAccessibilityDescription]";
    __int16 v22 = 2082;
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m";
    __int16 v24 = 1024;
    int v25 = 325;
    __int16 v26 = 2114;
    CGRect v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FFA98);
  }
  int v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    double v8 = v7;
    double v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    uint64_t v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathSource inferredAccessibilityDescription]");
  double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPathSource.m"];
  double v12 = (objc_class *)objc_opt_class();
  double v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 325, 0, "Abstract method not overridden by %{public}@", v13);

  uint64_t v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  double v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLPathSource inferredAccessibilityDescription]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (NSString)localizationKey
{
  return self->_localizationKey;
}

- (void)setLocalizationKey:(id)a3
{
}

- (NSString)userDefinedName
{
  return self->_name;
}

- (void)setUserDefinedName:(id)a3
{
}

- (NSString)userDefinedIdentifier
{
  return self->_identifier;
}

- (void)setUserDefinedIdentifier:(id)a3
{
}

- (BOOL)hasHorizontalFlip
{
  return self->_horizontalFlip;
}

- (void)setHasHorizontalFlip:(BOOL)a3
{
  self->_horizontalFlip = a3;
}

- (BOOL)hasVerticalFlip
{
  return self->_verticalFlip;
}

- (void)setHasVerticalFlip:(BOOL)a3
{
  self->_verticalFlip = a3;
}

- (NSString)inferredAccessibilityDescriptionNoShapeNames
{
  return self->_inferredAccessibilityDescriptionNoShapeNames;
}

- (NSString)inferredLocalizedAccessibilityDescriptionPlaceholder
{
  return self->_inferredLocalizedAccessibilityDescriptionPlaceholder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferredLocalizedAccessibilityDescriptionPlaceholder, 0);
  objc_storeStrong((id *)&self->_inferredAccessibilityDescriptionNoShapeNames, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_localizationKey, 0);
}

@end