@interface CRLImage
+ (CRLImage)allocWithZone:(_NSZone *)a3;
+ (CRLImage)imageWithCGImage:(CGImage *)a3;
+ (CRLImage)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5;
+ (CRLImage)imageWithContentsOfFile:(id)a3;
+ (CRLImage)imageWithData:(id)a3;
+ (CRLImage)imageWithPrivateSystemImageNamed:(id)a3;
+ (CRLImage)imageWithPrivateSystemImageNamed:(id)a3 pointSize:(double)a4;
+ (CRLImage)imageWithSystemImageNamed:(id)a3;
+ (CRLImage)imageWithSystemImageNamed:(id)a3 pointSize:(double)a4;
+ (CRLImage)imageWithUIImage:(id)a3;
+ (id)crl_quickInspectorBundledImageNamed:(id)a3;
+ (id)crl_quickInspectorImageNamed:(id)a3;
+ (id)crl_quickInspectorImageNamed:(id)a3 isPrivateImage:(BOOL)a4;
+ (id)crl_quickInspectorImageNamed:(id)a3 isPrivateImage:(BOOL)a4 isBundledImage:(BOOL)a5;
+ (id)imageNamed:(id)a3;
- (BOOL)isEmpty;
- (CGImage)CGImage;
- (CGImage)CGImageForSize:(CGSize)a3;
- (CGImage)CGImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orContentsScaleProvider:(id)a5;
- (CGSize)size;
- (CRLImage)init;
- (CRLImage)initWithCGImage:(CGImage *)a3;
- (CRLImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5;
- (CRLImage)initWithContentsOfFile:(id)a3;
- (CRLImage)initWithData:(id)a3;
- (CRLImage)initWithImageSourceRef:(CGImageSource *)a3;
- (CRLImage)initWithPrivateSystemImageNamed:(id)a3;
- (CRLImage)initWithPrivateSystemImageNamed:(id)a3 pointSize:(double)a4;
- (CRLImage)initWithSystemImageNamed:(id)a3;
- (CRLImage)initWithSystemImageNamed:(id)a3 pointSize:(double)a4;
- (CRLImage)initWithUIImage:(id)a3;
- (NSString)crlaxDescription;
- (UIImage)UIImage;
- (double)scale;
- (id)JPEGRepresentationWithCompressionQuality:(double)a3;
- (id)PNGRepresentation;
- (id)TIFFRepresentation;
- (id)compositeImageWithOverlayImage:(id)a3 overlayTintColor:(id)a4;
- (id)compositedImageWithColor:(id)a3 alpha:(double)a4 blendMode:(int)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stretchedImageOfSize:(CGSize)a3 leftCapWidth:(double)a4 rightCapWidth:(double)a5 topCapHeight:(double)a6 bottomCapHeight:(double)a7;
- (int64_t)imageOrientation;
- (void)dealloc;
- (void)setCrlaxDescription:(id)a3;
@end

@implementation CRLImage

+ (CRLImage)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (CRLImage *)+[_CRLImageM allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___CRLImage;
    return (CRLImage *)[super allocWithZone:a3];
  }
}

+ (id)imageNamed:(id)a3
{
  return +[CRLUIImage imageNamed:a3];
}

+ (CRLImage)imageWithContentsOfFile:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithContentsOfFile:v4];

  return (CRLImage *)v5;
}

+ (CRLImage)imageWithData:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithData:v4];

  return (CRLImage *)v5;
}

+ (CRLImage)imageWithCGImage:(CGImage *)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCGImage:a3];

  return (CRLImage *)v3;
}

+ (CRLImage)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  id v5 = [objc_alloc((Class)a1) initWithCGImage:a3 scale:a5 orientation:a4];

  return (CRLImage *)v5;
}

+ (CRLImage)imageWithSystemImageNamed:(id)a3 pointSize:(double)a4
{
  id v5 = a3;
  objc_super v6 = [[CRLUIImage alloc] initWithSystemImageNamed:v5 pointSize:a4];

  return (CRLImage *)v6;
}

+ (CRLImage)imageWithSystemImageNamed:(id)a3
{
  id v3 = a3;
  id v4 = [[CRLUIImage alloc] initWithSystemImageNamed:v3];

  return (CRLImage *)v4;
}

+ (CRLImage)imageWithPrivateSystemImageNamed:(id)a3 pointSize:(double)a4
{
  id v5 = a3;
  objc_super v6 = [[CRLUIImage alloc] initWithPrivateSystemImageNamed:v5 pointSize:a4];

  return (CRLImage *)v6;
}

+ (CRLImage)imageWithPrivateSystemImageNamed:(id)a3
{
  id v3 = a3;
  id v4 = [[CRLUIImage alloc] initWithPrivateSystemImageNamed:v3];

  return (CRLImage *)v4;
}

+ (id)crl_quickInspectorImageNamed:(id)a3
{
  return +[CRLImage crl_quickInspectorImageNamed:a3 isPrivateImage:0 isBundledImage:0];
}

+ (id)crl_quickInspectorImageNamed:(id)a3 isPrivateImage:(BOOL)a4
{
  return +[CRLImage crl_quickInspectorImageNamed:a3 isPrivateImage:a4 isBundledImage:0];
}

+ (id)crl_quickInspectorBundledImageNamed:(id)a3
{
  return +[CRLImage crl_quickInspectorImageNamed:a3 isPrivateImage:0 isBundledImage:1];
}

+ (id)crl_quickInspectorImageNamed:(id)a3 isPrivateImage:(BOOL)a4 isBundledImage:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (!+[NSThread isMainThread])
  {
    int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9B40);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B2ABC(v9, v10);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9B60);
    }
    v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v11, v9);
    }
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLImage crl_quickInspectorImageNamed:isPrivateImage:isBundledImage:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:710 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (qword_1016A9B30 != -1) {
    dispatch_once(&qword_1016A9B30, &stru_1014F9B80);
  }
  v14 = [(id)qword_1016A9B28 objectForKeyedSubscript:v8];
  if (!v14)
  {
    if (v5)
    {
      uint64_t v15 = [a1 imageNamed:v8];
    }
    else
    {
      if (v6) {
        [a1 imageWithPrivateSystemImageNamed:v8];
      }
      else {
      uint64_t v15 = [a1 imageWithSystemImageNamed:v8];
      }
    }
    v14 = (void *)v15;
    [(id)qword_1016A9B28 setObject:v15 forKeyedSubscript:v8];
  }

  return v14;
}

- (CRLImage)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRLImage;
  v2 = [(CRLImage *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(CRLOnce);
    mImageSlicesOnce = v2->mImageSlicesOnce;
    v2->mImageSlicesOnce = v3;

    BOOL v5 = objc_alloc_init(CRLOnce);
    mCachedImageOnce = v2->mCachedImageOnce;
    v2->mCachedImageOnce = v5;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9BA0);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = v4;
    BOOL v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 67110146;
    unsigned int v20 = v3;
    __int16 v21 = 2082;
    v22 = "-[CRLImage copyWithZone:]";
    __int16 v23 = 2082;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v25 = 1024;
    int v26 = 744;
    __int16 v27 = 2114;
    v28 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9BC0);
  }
  objc_super v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    int v9 = v8;
    v10 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v20 = v3;
    __int16 v21 = 2114;
    v22 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage copyWithZone:]");
  v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 744, 0, "Abstract method not overridden by %{public}@", v14);

  uint64_t v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v16, "-[CRLImage copyWithZone:]");
  id v18 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v17 userInfo:0];

  objc_exception_throw(v18);
}

- (CRLImage)initWithContentsOfFile:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9BE0);
  }
  BOOL v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    BOOL v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 67110146;
    unsigned int v21 = v4;
    __int16 v22 = 2082;
    __int16 v23 = "-[CRLImage initWithContentsOfFile:]";
    __int16 v24 = 2082;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v26 = 1024;
    int v27 = 749;
    __int16 v28 = 2114;
    v29 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9C00);
  }
  int v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    v11 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v21 = v4;
    __int16 v22 = 2114;
    __int16 v23 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithContentsOfFile:]");
  v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 749, 0, "Abstract method not overridden by %{public}@", v15);

  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v17, "-[CRLImage initWithContentsOfFile:]");
  id v19 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v18 userInfo:0];

  objc_exception_throw(v19);
}

- (CRLImage)initWithData:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9C20);
  }
  BOOL v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    BOOL v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 67110146;
    unsigned int v21 = v4;
    __int16 v22 = 2082;
    __int16 v23 = "-[CRLImage initWithData:]";
    __int16 v24 = 2082;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v26 = 1024;
    int v27 = 754;
    __int16 v28 = 2114;
    v29 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9C40);
  }
  int v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    v11 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v21 = v4;
    __int16 v22 = 2114;
    __int16 v23 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithData:]");
  v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 754, 0, "Abstract method not overridden by %{public}@", v15);

  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v17, "-[CRLImage initWithData:]");
  id v19 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v18 userInfo:0];

  objc_exception_throw(v19);
}

- (CRLImage)initWithCGImage:(CGImage *)a3
{
  unsigned int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9C60);
  }
  unsigned int v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = v4;
    BOOL v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 67110146;
    unsigned int v20 = v3;
    __int16 v21 = 2082;
    __int16 v22 = "-[CRLImage initWithCGImage:]";
    __int16 v23 = 2082;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v25 = 1024;
    int v26 = 759;
    __int16 v27 = 2114;
    __int16 v28 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9C80);
  }
  objc_super v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    int v9 = v8;
    v10 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v20 = v3;
    __int16 v21 = 2114;
    __int16 v22 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithCGImage:]");
  v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 759, 0, "Abstract method not overridden by %{public}@", v14);

  uint64_t v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v16, "-[CRLImage initWithCGImage:]");
  id v18 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v17 userInfo:0];

  objc_exception_throw(v18);
}

- (CRLImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  unsigned int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9CA0);
  }
  BOOL v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    objc_super v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 67110146;
    unsigned int v22 = v5;
    __int16 v23 = 2082;
    __int16 v24 = "-[CRLImage initWithCGImage:scale:orientation:]";
    __int16 v25 = 2082;
    int v26 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v27 = 1024;
    int v28 = 764;
    __int16 v29 = 2114;
    v30 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9CC0);
  }
  v10 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v22 = v5;
    __int16 v23 = 2114;
    __int16 v24 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithCGImage:scale:orientation:]");
  v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  uint64_t v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 764, 0, "Abstract method not overridden by %{public}@", v16);

  v17 = (objc_class *)objc_opt_class();
  id v18 = NSStringFromClass(v17);
  id v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v18, "-[CRLImage initWithCGImage:scale:orientation:]");
  id v20 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v19 userInfo:0];

  objc_exception_throw(v20);
}

- (CRLImage)initWithImageSourceRef:(CGImageSource *)a3
{
  unsigned int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9CE0);
  }
  unsigned int v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unsigned int v5 = v4;
    BOOL v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 67110146;
    unsigned int v20 = v3;
    __int16 v21 = 2082;
    unsigned int v22 = "-[CRLImage initWithImageSourceRef:]";
    __int16 v23 = 2082;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v25 = 1024;
    int v26 = 769;
    __int16 v27 = 2114;
    int v28 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9D00);
  }
  objc_super v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    int v9 = v8;
    v10 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v20 = v3;
    __int16 v21 = 2114;
    unsigned int v22 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithImageSourceRef:]");
  v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 769, 0, "Abstract method not overridden by %{public}@", v14);

  uint64_t v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v16, "-[CRLImage initWithImageSourceRef:]");
  id v18 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v17 userInfo:0];

  objc_exception_throw(v18);
}

- (CRLImage)initWithSystemImageNamed:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9D20);
  }
  unsigned int v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    BOOL v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 67110146;
    unsigned int v21 = v4;
    __int16 v22 = 2082;
    __int16 v23 = "-[CRLImage initWithSystemImageNamed:]";
    __int16 v24 = 2082;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v26 = 1024;
    int v27 = 774;
    __int16 v28 = 2114;
    __int16 v29 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9D40);
  }
  int v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    v11 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v21 = v4;
    __int16 v22 = 2114;
    __int16 v23 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithSystemImageNamed:]");
  v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 774, 0, "Abstract method not overridden by %{public}@", v15);

  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v17, "-[CRLImage initWithSystemImageNamed:]");
  id v19 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v18 userInfo:0];

  objc_exception_throw(v19);
}

- (CRLImage)initWithSystemImageNamed:(id)a3 pointSize:(double)a4
{
  id v4 = a3;
  unsigned int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9D60);
  }
  BOOL v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    objc_super v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 67110146;
    unsigned int v22 = v5;
    __int16 v23 = 2082;
    __int16 v24 = "-[CRLImage initWithSystemImageNamed:pointSize:]";
    __int16 v25 = 2082;
    __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v27 = 1024;
    int v28 = 779;
    __int16 v29 = 2114;
    v30 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9D80);
  }
  v10 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v22 = v5;
    __int16 v23 = 2114;
    __int16 v24 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithSystemImageNamed:pointSize:]");
  v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  uint64_t v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 779, 0, "Abstract method not overridden by %{public}@", v16);

  v17 = (objc_class *)objc_opt_class();
  id v18 = NSStringFromClass(v17);
  id v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v18, "-[CRLImage initWithSystemImageNamed:pointSize:]");
  id v20 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v19 userInfo:0];

  objc_exception_throw(v20);
}

- (CRLImage)initWithPrivateSystemImageNamed:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9DA0);
  }
  unsigned int v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    BOOL v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 67110146;
    unsigned int v21 = v4;
    __int16 v22 = 2082;
    __int16 v23 = "-[CRLImage initWithPrivateSystemImageNamed:]";
    __int16 v24 = 2082;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v26 = 1024;
    int v27 = 784;
    __int16 v28 = 2114;
    __int16 v29 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9DC0);
  }
  int v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    v11 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v21 = v4;
    __int16 v22 = 2114;
    __int16 v23 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithPrivateSystemImageNamed:]");
  v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 784, 0, "Abstract method not overridden by %{public}@", v15);

  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v17, "-[CRLImage initWithPrivateSystemImageNamed:]");
  id v19 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v18 userInfo:0];

  objc_exception_throw(v19);
}

- (CRLImage)initWithPrivateSystemImageNamed:(id)a3 pointSize:(double)a4
{
  id v4 = a3;
  unsigned int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9DE0);
  }
  BOOL v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    objc_super v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 67110146;
    unsigned int v22 = v5;
    __int16 v23 = 2082;
    __int16 v24 = "-[CRLImage initWithPrivateSystemImageNamed:pointSize:]";
    __int16 v25 = 2082;
    __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v27 = 1024;
    int v28 = 789;
    __int16 v29 = 2114;
    v30 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9E00);
  }
  v10 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v22 = v5;
    __int16 v23 = 2114;
    __int16 v24 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage initWithPrivateSystemImageNamed:pointSize:]");
  v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  uint64_t v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 789, 0, "Abstract method not overridden by %{public}@", v16);

  v17 = (objc_class *)objc_opt_class();
  id v18 = NSStringFromClass(v17);
  id v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v18, "-[CRLImage initWithPrivateSystemImageNamed:pointSize:]");
  id v20 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v19 userInfo:0];

  objc_exception_throw(v20);
}

- (CGSize)size
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9E20);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    unsigned int v5 = (objc_class *)objc_opt_class();
    BOOL v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    unsigned int v21 = "-[CRLImage size]";
    __int16 v22 = 2082;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v24 = 1024;
    int v25 = 795;
    __int16 v26 = 2114;
    __int16 v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9E40);
  }
  v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    objc_super v8 = v7;
    int v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    unsigned int v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage size]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 795, 0, "Abstract method not overridden by %{public}@", v13);

  v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLImage size]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (double)scale
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9E60);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    unsigned int v5 = (objc_class *)objc_opt_class();
    BOOL v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    unsigned int v21 = "-[CRLImage scale]";
    __int16 v22 = 2082;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v24 = 1024;
    int v25 = 799;
    __int16 v26 = 2114;
    __int16 v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9E80);
  }
  v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    objc_super v8 = v7;
    int v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    unsigned int v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage scale]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 799, 0, "Abstract method not overridden by %{public}@", v13);

  v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLImage scale]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (void)dealloc
{
  CGImageRelease(self->mCachedSliceableImage);
  mImageSlices = self->mImageSlices;
  if (mImageSlices) {
    CFRelease(mImageSlices);
  }
  id mCachedSystemImage = self->mCachedSystemImage;
  self->id mCachedSystemImage = 0;

  mImageSlicesOnce = self->mImageSlicesOnce;
  self->mImageSlicesOnce = 0;

  mCachedImageOnce = self->mCachedImageOnce;
  self->mCachedImageOnce = 0;

  v7.receiver = self;
  v7.super_class = (Class)CRLImage;
  [(CRLImage *)&v7 dealloc];
}

- (CGImage)CGImageForSize:(CGSize)a3
{
  unsigned int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9EA0);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unsigned int v5 = v4;
    BOOL v6 = (objc_class *)objc_opt_class();
    objc_super v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 67110146;
    unsigned int v20 = v3;
    __int16 v21 = 2082;
    __int16 v22 = "-[CRLImage CGImageForSize:]";
    __int16 v23 = 2082;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v25 = 1024;
    int v26 = 813;
    __int16 v27 = 2114;
    int v28 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9EC0);
  }
  objc_super v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    int v9 = v8;
    v10 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v20 = v3;
    __int16 v21 = 2114;
    __int16 v22 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage CGImageForSize:]");
  v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 813, 0, "Abstract method not overridden by %{public}@", v14);

  uint64_t v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v16, "-[CRLImage CGImageForSize:]");
  id v18 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v17 userInfo:0];

  objc_exception_throw(v18);
}

- (CGImage)CGImage
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9EE0);
  }
  unsigned int v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    unsigned int v5 = (objc_class *)objc_opt_class();
    BOOL v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    __int16 v21 = "-[CRLImage CGImage]";
    __int16 v22 = 2082;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v24 = 1024;
    int v25 = 817;
    __int16 v26 = 2114;
    __int16 v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9F00);
  }
  objc_super v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    objc_super v8 = v7;
    int v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    __int16 v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage CGImage]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 817, 0, "Abstract method not overridden by %{public}@", v13);

  v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLImage CGImage]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (int64_t)imageOrientation
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9F20);
  }
  unsigned int v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    unsigned int v5 = (objc_class *)objc_opt_class();
    BOOL v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    __int16 v21 = "-[CRLImage imageOrientation]";
    __int16 v22 = 2082;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v24 = 1024;
    int v25 = 821;
    __int16 v26 = 2114;
    __int16 v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9F40);
  }
  objc_super v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    objc_super v8 = v7;
    int v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    __int16 v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage imageOrientation]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 821, 0, "Abstract method not overridden by %{public}@", v13);

  v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLImage imageOrientation]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (BOOL)isEmpty
{
  unsigned int v2 = [(CRLImage *)self CGImage];

  return sub_10043EA70(v2);
}

- (id)TIFFRepresentation
{
  unsigned int v2 = [(CRLImage *)self CGImage];

  return sub_10047ED18(v2);
}

- (id)JPEGRepresentationWithCompressionQuality:(double)a3
{
  id v4 = [(CRLImage *)self CGImage];

  return sub_10047ECA0((uint64_t)v4, a3);
}

- (id)PNGRepresentation
{
  unsigned int v2 = [(CRLImage *)self CGImage];

  return sub_10047EC98(v2);
}

- (id)stretchedImageOfSize:(CGSize)a3 leftCapWidth:(double)a4 rightCapWidth:(double)a5 topCapHeight:(double)a6 bottomCapHeight:(double)a7
{
  double height = a3.height;
  double width = a3.width;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10043ECEC;
  v16[3] = &unk_1014F9F68;
  CGSize v17 = a3;
  v16[4] = self;
  double v18 = a6;
  double v19 = a7;
  double v20 = a4;
  double v21 = a5;
  v10 = objc_retainBlock(v16);
  uint64_t v11 = ((uint64_t (*)(void *, CGImage *, double))v10[2])(v10, -[CRLImage CGImageForSize:](self, "CGImageForSize:", width, height), 1.0);
  if (v11)
  {
    v12 = (CGImage *)v11;
    [(CRLImage *)self scale];
    v14 = +[CRLImage imageWithCGImage:v12 scale:[(CRLImage *)self imageOrientation] orientation:v13];
    CGImageRelease(v12);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)crlaxDescription
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCrlaxDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crlaxDescription, 0);
  objc_storeStrong((id *)&self->mCachedImageOnce, 0);
  objc_storeStrong(&self->mCachedSystemImage, 0);

  objc_storeStrong((id *)&self->mImageSlicesOnce, 0);
}

+ (CRLImage)imageWithUIImage:(id)a3
{
  id v3 = a3;
  id v4 = [[CRLUIImage alloc] initWithUIImage:v3];

  return (CRLImage *)v4;
}

- (CRLImage)initWithUIImage:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9F88);
  }
  unsigned int v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    BOOL v6 = v5;
    objc_super v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 67110146;
    unsigned int v21 = v4;
    __int16 v22 = 2082;
    __int16 v23 = "-[CRLImage(UIKitAdditions) initWithUIImage:]";
    __int16 v24 = 2082;
    int v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m";
    __int16 v26 = 1024;
    int v27 = 967;
    __int16 v28 = 2114;
    __int16 v29 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F9FA8);
  }
  int v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    uint64_t v11 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v21 = v4;
    __int16 v22 = 2114;
    __int16 v23 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage(UIKitAdditions) initWithUIImage:]");
  double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLImage.m"];
  v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 967, 0, "Abstract method not overridden by %{public}@", v15);

  v16 = (objc_class *)objc_opt_class();
  CGSize v17 = NSStringFromClass(v16);
  double v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v17, "-[CRLImage(UIKitAdditions) initWithUIImage:]");
  id v19 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v18 userInfo:0];

  objc_exception_throw(v19);
}

- (UIImage)UIImage
{
  mCachedImageOnce = self->mCachedImageOnce;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10043F63C;
  v5[3] = &unk_1014CBBB0;
  v5[4] = self;
  [(CRLOnce *)mCachedImageOnce performBlockOnce:v5];
  return (UIImage *)self->mCachedSystemImage;
}

- (CGImage)CGImageForSize:(CGSize)a3 inContext:(CGContext *)a4 orContentsScaleProvider:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  v10 = v9;
  if (!a4)
  {
    if (v9)
    {
      [v9 contentsScale];
      double width = width * v23;
      [v10 contentsScale];
      double height = height * v24;
    }
    goto LABEL_17;
  }
  if (v9)
  {
    int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9FC8);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B2B68(v11, v12);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9FE8);
    }
    double v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v13, v11);
    }
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImage(RenderingAdditions) CGImageForSize:inContext:orContentsScaleProvider:]");
    uint64_t v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImage_RenderingAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:21 isFatal:0 description:"using context to determine requested image size. contents scale provider should be nil"];
  }
  double v16 = 2.0;
  if ((sub_100458174((uint64_t)a4) & 1) == 0 && (sub_1004583EC((uint64_t)a4) & 1) == 0)
  {
    double v17 = sub_100458664((uint64_t)a4);
    double v18 = sub_1000646A4(width, height, v17);
    double v20 = v19;
    CGContextGetCTM(&v29, a4);
    double v21 = sub_10007F808(&v29.a);
    double width = sub_1000646A4(v18, v20, v21);
    double height = v22;
LABEL_17:
    [(CRLImage *)self size];
    double v16 = 2.0;
    if (width <= v25)
    {
      [(CRLImage *)self size];
      if (height <= v26) {
        double v16 = 1.0;
      }
      else {
        double v16 = 2.0;
      }
    }
  }
  int v27 = [(CRLImage *)self CGImageForContentsScale:v16];

  return v27;
}

- (id)compositedImageWithColor:(id)a3 alpha:(double)a4 blendMode:(int)a5
{
  id v8 = a3;
  [(CRLImage *)self scale];
  double v10 = v9;
  [(CRLImage *)self size];
  double v13 = sub_1000646A4(v11, v12, v10);
  uint64_t v15 = sub_100455AA8(3, v13, v14);
  double v16 = sub_100064070();
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  double v23 = [(CRLImage *)self CGImageForContentsScale:v10];
  v29.origin.x = v16;
  v29.origin.y = v18;
  v29.size.double width = v20;
  v29.size.double height = v22;
  CGContextDrawImage(v15, v29, v23);
  double v24 = (CGColor *)[v8 CGColor];

  CGContextSetFillColorWithColor(v15, v24);
  CGContextSetAlpha(v15, a4);
  CGContextSetBlendMode(v15, (CGBlendMode)a5);
  v30.origin.x = v16;
  v30.origin.y = v18;
  v30.size.double width = v20;
  v30.size.double height = v22;
  CGContextFillRect(v15, v30);
  Image = CGBitmapContextCreateImage(v15);
  double v26 = +[CRLImage imageWithCGImage:Image scale:0 orientation:v10];
  CGImageRelease(Image);
  CGContextRelease(v15);

  return v26;
}

- (id)compositeImageWithOverlayImage:(id)a3 overlayTintColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CRLImage *)self scale];
  double v9 = v8;
  [(CRLImage *)self size];
  double v12 = sub_1000646A4(v10, v11, v9);
  double v14 = sub_100455AA8(3, v12, v13);
  double v15 = sub_100064070();
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v22 = [(CRLImage *)self CGImageForContentsScale:v9];
  v29.origin.x = v15;
  v29.origin.y = v17;
  v29.size.double width = v19;
  v29.size.double height = v21;
  CGContextDrawImage(v14, v29, v22);
  [v6 alphaComponent];
  double v23 = [v7 compositedImageWithColor:v6 alpha:20];

  double v24 = (CGImage *)[v23 CGImageForContentsScale:v9];
  v30.origin.x = v15;
  v30.origin.y = v17;
  v30.size.double width = v19;
  v30.size.double height = v21;
  CGContextDrawImage(v14, v30, v24);
  Image = CGBitmapContextCreateImage(v14);
  double v26 = +[CRLImage imageWithCGImage:Image scale:0 orientation:v9];
  CGImageRelease(Image);
  CGContextRelease(v14);

  return v26;
}

@end