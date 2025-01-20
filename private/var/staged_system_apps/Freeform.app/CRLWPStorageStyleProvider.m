@interface CRLWPStorageStyleProvider
+ (id)styleProviderForStorage:(id)a3;
- (id)characterStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)dropCapStyleAtParIndex:(unint64_t)a3;
- (id)listStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
@end

@implementation CRLWPStorageStyleProvider

+ (id)styleProviderForStorage:(id)a3
{
  return sub_100246AC8(a3, 1, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)&OBJC_PROTOCOL___CRLWPStyleProvider);
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_101502140);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010C0B60();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_101502160);
  }
  uint64_t v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v4);
  }
  uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageStyleProvider paragraphStyleAtParIndex:effectiveRange:]");
  uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPStorageStyleProvider.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 20, 0, "Use the class method: styleProviderForStorage and do not allocate this class directly. Alternatively, provide your own implementation.");

  return 0;
}

- (id)characterStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_101502180);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010C0BE8();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1015021A0);
  }
  uint64_t v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v4);
  }
  uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageStyleProvider characterStyleAtCharIndex:effectiveRange:]");
  uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPStorageStyleProvider.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 25, 0, "Use the class method: styleProviderForStorage and do not allocate this class directly. Alternatively, provide your own implementation.");

  return 0;
}

- (id)listStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1015021C0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010C0C70();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1015021E0);
  }
  uint64_t v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v4);
  }
  uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageStyleProvider listStyleAtParIndex:effectiveRange:]");
  uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPStorageStyleProvider.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 30, 0, "Use the class method: styleProviderForStorage and do not allocate this class directly. Alternatively, provide your own implementation.");

  return 0;
}

- (id)dropCapStyleAtParIndex:(unint64_t)a3
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_101502200);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010C0CF8();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_101502220);
  }
  uint64_t v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v3);
  }
  uint64_t v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageStyleProvider dropCapStyleAtParIndex:]");
  uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPStorageStyleProvider.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 35, 0, "Use the class method: styleProviderForStorage and do not allocate this class directly. Alternatively, provide your own implementation.");

  return 0;
}

@end