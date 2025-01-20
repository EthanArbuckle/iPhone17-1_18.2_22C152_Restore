@interface NSException
+ (BOOL)crl_catchExceptionsInBlock:(id)a3 error:(id *)a4;
+ (void)crl_raiseWithError:(id)a3;
- (id)crl_error;
@end

@implementation NSException

+ (void)crl_raiseWithError:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0538);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106F0D8(v4, v5);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0558);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSException(CRLAdditions) crl_raiseWithError:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSException_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 14, 0, "Invalid parameter not satisfying: %{public}s", "error != nil");
  }
  v9 = [v3 localizedFailureReason];
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    uint64_t v12 = [v3 localizedDescription];
    v13 = (void *)v12;
    v14 = @"NSError exception";
    if (v12) {
      v14 = (__CFString *)v12;
    }
    v11 = v14;
  }
  CFStringRef v17 = @"CRLErrorExceptionUserInfoKey";
  id v18 = v3;
  v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v16 = +[NSException exceptionWithName:@"CRLErrorException" reason:v11 userInfo:v15];

  [v16 raise];
}

- (id)crl_error
{
  v2 = [(NSException *)self userInfo];
  id v3 = [v2 objectForKey:@"CRLErrorExceptionUserInfoKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    if (v3)
    {
      int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D0578);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106F194((uint64_t)v3, v5, v6);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D0598);
      }
      v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v7);
      }
      v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSException(CRLAdditions) crl_error]");
      v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSException_CRLAdditions.m"];
      +[CRLAssertionHandler handleFailureInFunction:v8, v9, 28, 0, "Unexpected NSException value for CRLErrorExceptionUserInfoKey: %@", v3 file lineNumber isFatal description];
    }
    id v4 = 0;
  }

  return v4;
}

+ (BOOL)crl_catchExceptionsInBlock:(id)a3 error:(id *)a4
{
  id v4 = (void (**)(void))a3;
  v4[2]();

  return 1;
}

@end