@interface CRLRemoteDefaults
+ (id)sharedDefaults;
- (CRLRemoteDefaults)initWithRemoteURL:(id)a3 localURL:(id)a4;
- (id)initInternal;
- (id)objectForKey:(id)a3;
- (void)processPropertyList:(id)a3;
- (void)registerDefaults;
@end

@implementation CRLRemoteDefaults

+ (id)sharedDefaults
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004CC2C0;
  block[3] = &unk_1014CC6D8;
  block[4] = a1;
  if (qword_1016A9DA0 != -1) {
    dispatch_once(&qword_1016A9DA0, block);
  }
  v2 = (void *)qword_1016A9D98;

  return v2;
}

- (CRLRemoteDefaults)initWithRemoteURL:(id)a3 localURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FFC20);
  }
  v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v17 = v7;
    __int16 v18 = 2082;
    v19 = "-[CRLRemoteDefaults initWithRemoteURL:localURL:]";
    __int16 v20 = 2082;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRemoteDefaults.m";
    __int16 v22 = 1024;
    int v23 = 315;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FFC40);
  }
  v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    v11 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v17 = v7;
    __int16 v18 = 2114;
    v19 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLRemoteDefaults initWithRemoteURL:localURL:]");
  v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRemoteDefaults.m"];
  +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:315 isFatal:0 description:"Do not call method"];

  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLRemoteDefaults initWithRemoteURL:localURL:]");
  id v15 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v14 userInfo:0];

  objc_exception_throw(v15);
}

- (id)initInternal
{
  v3 = +[NSURL URLWithString:@"https://configuration.apple.com/configurations/internetservices/cloudkit/freeform-1.0.plist"];
  v6.receiver = self;
  v6.super_class = (Class)CRLRemoteDefaults;
  v4 = [(CRLRemotePropertyList *)&v6 initWithRemoteURL:v3 localURL:0];

  if (v4) {
    [(CRLRemoteDefaults *)v4 registerDefaults];
  }
  return v4;
}

- (void)registerDefaults
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 URLForResource:@"freeform-1.0" withExtension:@"plist"];

  if (v3)
  {
    v4 = +[NSDictionary dictionaryWithContentsOfURL:v3];
    if (v4)
    {
      id v5 = +[NSUserDefaults standardUserDefaults];
      CFStringRef v9 = @"CRLRemoteDefaults";
      v10 = v4;
      objc_super v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      [v5 registerDefaults:v6];
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FFC60);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BC8D4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FFC80);
      }
      v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v8);
      }
      id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLRemoteDefaults registerDefaults]");
      objc_super v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRemoteDefaults.m"];
      +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:347 isFatal:0 description:"Can't parse local defaults plist"];
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FFCA0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BC84C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FFCC0);
    }
    unsigned int v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLRemoteDefaults registerDefaults]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRemoteDefaults.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:356 isFatal:0 description:"Don't have local defaults plist"];
  }
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  objc_super v6 = [v5 dictionaryForKey:@"CRLRemoteDefaults"];
  unsigned int v7 = [v6 objectForKey:v4];

  if (!v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLRemoteDefaults;
    unsigned int v7 = [(CRLRemotePropertyList *)&v9 objectForKey:v4];
  }

  return v7;
}

- (void)processPropertyList:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setObject:v4 forKey:@"CRLRemoteDefaults"];

  v6.receiver = self;
  v6.super_class = (Class)CRLRemoteDefaults;
  [(CRLRemotePropertyList *)&v6 processPropertyList:v4];
}

@end