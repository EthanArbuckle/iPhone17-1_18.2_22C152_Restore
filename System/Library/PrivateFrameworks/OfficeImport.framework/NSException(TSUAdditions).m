@interface NSException(TSUAdditions)
+ (uint64_t)tsu_raiseWithError:()TSUAdditions;
- (uint64_t)tsu_error;
@end

@implementation NSException(TSUAdditions)

+ (uint64_t)tsu_raiseWithError:()TSUAdditions
{
  v9[1] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    uint64_t v4 = [NSString stringWithUTF8String:"+[NSException(TSUAdditions) tsu_raiseWithError:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSException_TSUAdditions.m"], 17, 0, "Invalid parameter not satisfying: %{public}s", "error != nil");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v5 = (__CFString *)[a3 localizedFailureReason];
  if (!v5)
  {
    uint64_t v6 = [a3 localizedDescription];
    if (v6) {
      v5 = (__CFString *)v6;
    }
    else {
      v5 = @"NSError exception";
    }
  }
  v8 = @"TSUErrorExceptionUserInfoKey";
  v9[0] = a3;
  return objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", @"TSUErrorException", v5, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1)), "raise");
}

- (uint64_t)tsu_error
{
  uint64_t v1 = objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKey:", @"TSUErrorExceptionUserInfoKey");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v1)
  {
    uint64_t v2 = [NSString stringWithUTF8String:"-[NSException(TSUAdditions) tsu_error]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSException_TSUAdditions.m"], 31, 0, "Unexpected NSException value for TSUErrorExceptionUserInfoKey: %@", v1);
    +[OITSUAssertionHandler logBacktraceThrottled];
    return 0;
  }
  return v1;
}

@end