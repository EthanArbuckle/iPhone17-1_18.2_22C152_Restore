@interface NSException(TSUAdditions)
+ (uint64_t)tsu_raiseWithError:()TSUAdditions;
- (uint64_t)tsu_error;
@end

@implementation NSException(TSUAdditions)

+ (uint64_t)tsu_raiseWithError:()TSUAdditions
{
  if (!a3)
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"+[NSException(TSUAdditions) tsu_raiseWithError:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSException_TSUAdditions.m"), 17, @"Invalid parameter not satisfying: %s", "error != nil");
  }
  v6 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", a3, @"TSUErrorExceptionUserInfoKey", 0);
  v7 = (void *)[MEMORY[0x263EFF940] exceptionWithName:@"TSUErrorException" reason:@"NSError exception" userInfo:v6];

  return [v7 raise];
}

- (uint64_t)tsu_error
{
  uint64_t v1 = objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKey:", @"TSUErrorExceptionUserInfoKey");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v1)
  {
    id v2 = +[TSUAssertionHandler currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[NSException(TSUAdditions) tsu_error]"];
    [v2 handleFailureInFunction:v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSException_TSUAdditions.m"), 38, @"Unexpected NSException value for TSUErrorExceptionUserInfoKey: %@", v1 file lineNumber description];
    return 0;
  }
  return v1;
}

@end