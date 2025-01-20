@interface CRLMetalShaderLibraryLoader
+ (id)loadDefaultLibraryWithDevice:(id)a3;
+ (id)loadLibraryWithDevice:(id)a3 bundle:(id)a4;
@end

@implementation CRLMetalShaderLibraryLoader

+ (id)loadDefaultLibraryWithDevice:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:a1];
  v6 = [a1 loadLibraryWithDevice:v4 bundle:v5];

  return v6;
}

+ (id)loadLibraryWithDevice:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0B18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101088EEC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0B38);
    }
    v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShaderLibraryLoader loadLibraryWithDevice:bundle:]");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    v14 = "Can't initialize shader library with nil device.";
    id v15 = v9;
    v16 = v11;
    uint64_t v17 = 34;
    goto LABEL_31;
  }
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0B58);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101088F74();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0B78);
    }
    v18 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v18);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShaderLibraryLoader loadLibraryWithDevice:bundle:]");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    v14 = "Can't initialize shader library with nil bundle.";
    id v15 = v9;
    v16 = v11;
    uint64_t v17 = 39;
LABEL_31:
    +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:v17 isFatal:0 description:v14];
    id v8 = 0;
    goto LABEL_32;
  }
  id v20 = 0;
  id v8 = [v5 newDefaultLibraryWithBundle:v6 error:&v20];
  id v9 = v20;
  if (v8) {
    goto LABEL_33;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E0B98);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101088FFC();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E0BB8);
  }
  v10 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v10);
  }
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShaderLibraryLoader loadLibraryWithDevice:bundle:]");
  v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
  +[CRLAssertionHandler handleFailureInFunction:v11, v12, 45, 0, "Failed to create library, error %@", v9 file lineNumber isFatal description];

LABEL_32:
LABEL_33:

  return v8;
}

@end