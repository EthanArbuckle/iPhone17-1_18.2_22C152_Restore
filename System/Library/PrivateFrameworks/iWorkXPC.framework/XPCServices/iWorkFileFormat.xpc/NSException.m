@interface NSException
+ (BOOL)tsu_catchExceptionsInBlock:(id)a3 error:(id *)a4;
+ (void)tsu_raiseWithError:(id)a3;
- (id)tsu_error;
@end

@implementation NSException

+ (void)tsu_raiseWithError:(id)a3
{
  if (!a3)
  {
    int v4 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CEA08);
    }
    v5 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016A408(v4, v5);
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSException(TSUAdditions) tsu_raiseWithError:]"), +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSException_TSUAdditions.m"], 17, 0, "Invalid parameter not satisfying: %{public}s", "error != nil");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  CFStringRef v6 = (const __CFString *)[a3 localizedFailureReason];
  if (!v6)
  {
    CFStringRef v7 = (const __CFString *)[a3 localizedDescription];
    if (v7) {
      CFStringRef v6 = v7;
    }
    else {
      CFStringRef v6 = @"NSError exception";
    }
  }
  CFStringRef v8 = @"TSUErrorExceptionUserInfoKey";
  id v9 = a3;
  [+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", @"TSUErrorException", v6, +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1]) raise];
}

- (id)tsu_error
{
  id v2 = [(NSDictionary *)[(NSException *)self userInfo] objectForKey:@"TSUErrorExceptionUserInfoKey"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v2)
  {
    int v3 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CEA28);
    }
    int v4 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016A4C4((uint64_t)v2, v3, v4);
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:"[(NSException(TSUAdditions) *)NSString tsu_error], 31, 0, "Unexpected NSException value for TSUErrorExceptionUserInfoKey: %@"", v2];
    +[TSUAssertionHandler logBacktraceThrottled];
    return 0;
  }
  return v2;
}

+ (BOOL)tsu_catchExceptionsInBlock:(id)a3 error:(id *)a4
{
  return 1;
}

@end