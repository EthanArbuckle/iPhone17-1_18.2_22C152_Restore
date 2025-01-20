@interface UIResponder
- (int64_t)crl_textInputSource;
@end

@implementation UIResponder

- (int64_t)crl_textInputSource
{
  if (objc_opt_respondsToSelector())
  {
    return (int64_t)[(UIResponder *)self _textInputSource];
  }
  else
  {
    int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1F58);
    }
    v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101072194(v3, v4);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1F78);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v5, v3);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UIResponder(CRLAdditions) crl_textInputSource]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/UIResponder_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:19 isFatal:0 description:"Responder does not respond to _textInputSource."];

    return 0;
  }
}

@end