@interface NSError(TSUAdditions)
+ (uint64_t)tsuErrorWithCode:()TSUAdditions;
+ (uint64_t)tsu_errorWithDomain:()TSUAdditions code:alertTitle:alertMessage:;
+ (uint64_t)tsu_errorWithDomain:()TSUAdditions code:alertTitle:alertMessage:underlyingError:;
+ (uint64_t)tsu_errorWithDomain:()TSUAdditions code:description:recoverySuggestion:;
- (uint64_t)tsu_isCancelError;
- (uint64_t)tsu_isOutOfSpaceError;
- (uint64_t)tsu_localizedAlertMessage;
- (uint64_t)tsu_localizedAlertTitle;
@end

@implementation NSError(TSUAdditions)

+ (uint64_t)tsu_errorWithDomain:()TSUAdditions code:description:recoverySuggestion:
{
  v11 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v12 = v11;
  if (a5) {
    [v11 setObject:a5 forKey:*MEMORY[0x263F08320]];
  }
  if (a6) {
    [v12 setObject:a6 forKey:*MEMORY[0x263F08348]];
  }
  return [a1 errorWithDomain:a3 code:a4 userInfo:v12];
}

+ (uint64_t)tsuErrorWithCode:()TSUAdditions
{
  if (a3 >= 3)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"+[NSError(TSUAdditions) tsuErrorWithCode:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSError_TSUAdditions.m"), 48, @"Bad error code");
  }
  return objc_msgSend(a1, "tsu_errorWithDomain:code:description:recoverySuggestion:", @"com.apple.iWork.TSUtility", a3, 0, 0);
}

+ (uint64_t)tsu_errorWithDomain:()TSUAdditions code:alertTitle:alertMessage:
{
  v11 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v12 = v11;
  if (a5)
  {
    [v11 setObject:a5 forKey:*MEMORY[0x263F08320]];
    [v12 setObject:a5 forKey:@"TSULocalizedErrorAlertTitle"];
  }
  if (a6) {
    [v12 setObject:a6 forKey:@"TSULocalizedErrorAlertMessage"];
  }
  return [a1 errorWithDomain:a3 code:a4 userInfo:v12];
}

+ (uint64_t)tsu_errorWithDomain:()TSUAdditions code:alertTitle:alertMessage:underlyingError:
{
  v13 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v14 = v13;
  if (a5)
  {
    [v13 setObject:a5 forKey:*MEMORY[0x263F08320]];
    [v14 setObject:a5 forKey:@"TSULocalizedErrorAlertTitle"];
  }
  if (a6) {
    [v14 setObject:a6 forKey:@"TSULocalizedErrorAlertMessage"];
  }
  if (a7) {
    [v14 setObject:a7 forKey:*MEMORY[0x263F08608]];
  }
  return [a1 errorWithDomain:a3 code:a4 userInfo:v14];
}

- (uint64_t)tsu_localizedAlertTitle
{
  v1 = (void *)[a1 userInfo];
  return [v1 objectForKey:@"TSULocalizedErrorAlertTitle"];
}

- (uint64_t)tsu_localizedAlertMessage
{
  v1 = (void *)[a1 userInfo];
  return [v1 objectForKey:@"TSULocalizedErrorAlertMessage"];
}

- (uint64_t)tsu_isOutOfSpaceError
{
  if (a1)
  {
    v1 = a1;
    uint64_t v2 = *MEMORY[0x263F07F70];
    uint64_t v3 = *MEMORY[0x263F08438];
    uint64_t v4 = *MEMORY[0x263F08608];
    while (1)
    {
      id v5 = (void *)[v1 domain];
      uint64_t v6 = [v1 code];
      if (v5)
      {
        uint64_t v7 = v6;
        if ([v5 isEqualToString:v2])
        {
          BOOL v8 = v7 == 640;
        }
        else
        {
          if (![v5 isEqualToString:v3])
          {
            unsigned int v10 = [v5 isEqualToString:@"com.apple.iWork.TSUtility"];
            if (v7 == 2) {
              uint64_t v9 = v10;
            }
            else {
              uint64_t v9 = 0;
            }
            goto LABEL_15;
          }
          BOOL v8 = v7 == 28;
        }
        uint64_t v9 = v8;
      }
      else
      {
        uint64_t v9 = 0;
      }
LABEL_15:
      uint64_t v11 = objc_msgSend((id)objc_msgSend(v1, "userInfo"), "objectForKey:", v4);
      if (v11)
      {
        v1 = (void *)v11;
        if (!v9) {
          continue;
        }
      }
      return v9;
    }
  }
  return 0;
}

- (uint64_t)tsu_isCancelError
{
  if (result)
  {
    v1 = (void *)result;
    uint64_t v2 = *MEMORY[0x263F07F70];
    uint64_t v3 = *MEMORY[0x263F08570];
    uint64_t v4 = *MEMORY[0x263F08608];
    do
    {
      uint64_t v5 = [v1 domain];
      uint64_t v6 = [v1 code];
      if (v5)
      {
        if (v6 == 3072)
        {
          uint64_t v7 = (void *)v5;
          uint64_t v8 = v2;
        }
        else
        {
          if (v6 != -999) {
            goto LABEL_9;
          }
          uint64_t v7 = (void *)v5;
          uint64_t v8 = v3;
        }
        if ([v7 isEqualToString:v8]) {
          return 1;
        }
      }
LABEL_9:
      result = objc_msgSend((id)objc_msgSend(v1, "userInfo"), "objectForKey:", v4);
      v1 = (void *)result;
    }
    while (result);
  }
  return result;
}

@end