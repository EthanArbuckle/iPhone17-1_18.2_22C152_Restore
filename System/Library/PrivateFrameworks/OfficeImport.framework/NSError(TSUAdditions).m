@interface NSError(TSUAdditions)
+ (id)tsu_errorWithCode:()TSUAdditions userInfo:;
+ (id)tsu_errorWithDomain:()TSUAdditions code:alertTitle:alertMessage:userInfo:;
+ (id)tsu_errorWithDomain:()TSUAdditions code:description:recoverySuggestion:;
+ (id)tsu_errorWithDomain:()TSUAdditions code:description:underlyingError:;
+ (id)tsu_errorWithError:()TSUAdditions alertTitle:alertMessage:additionalUserInfo:;
+ (uint64_t)tsu_errorWithDomain:()TSUAdditions code:alertTitle:alertMessage:;
- (id)tsu_errorPreservingAlertTitle;
- (id)tsu_errorPreservingCancel;
- (id)tsu_localizedAlertMessage;
- (id)tsu_localizedAlertTitle;
- (uint64_t)tsu_isCancelError;
- (uint64_t)tsu_isErrorPassingTest:()TSUAdditions;
- (uint64_t)tsu_isNoSuchFileError;
- (uint64_t)tsu_isOutOfSpaceError;
@end

@implementation NSError(TSUAdditions)

+ (id)tsu_errorWithDomain:()TSUAdditions code:description:recoverySuggestion:
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  v14 = v13;
  if (v11) {
    [v13 setObject:v11 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  if (v12) {
    [v14 setObject:v12 forKeyedSubscript:*MEMORY[0x263F08348]];
  }
  v15 = [a1 errorWithDomain:v10 code:a4 userInfo:v14];

  return v15;
}

+ (id)tsu_errorWithCode:()TSUAdditions userInfo:
{
  id v6 = a4;
  if (a3 >= 3)
  {
    v7 = [NSString stringWithUTF8String:"+[NSError(TSUAdditions) tsu_errorWithCode:userInfo:]"];
    v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSError_TSUAdditions.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:42 isFatal:0 description:"Bad error code"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v9 = [a1 errorWithDomain:@"com.apple.iWork.TSUtility" code:a3 userInfo:v6];

  return v9;
}

+ (uint64_t)tsu_errorWithDomain:()TSUAdditions code:alertTitle:alertMessage:
{
  return objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:userInfo:", a3, a4, a5, a6, 0);
}

+ (id)tsu_errorWithDomain:()TSUAdditions code:alertTitle:alertMessage:userInfo:
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v15, "count") + 4);
  v17 = v16;
  if (v15) {
    [v16 addEntriesFromDictionary:v15];
  }
  if (v13)
  {
    [v17 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08320]];
    [v17 setObject:v13 forKeyedSubscript:@"TSULocalizedErrorAlertTitle"];
  }
  if (v14)
  {
    [v17 setObject:v14 forKeyedSubscript:*MEMORY[0x263F08348]];
    [v17 setObject:v14 forKeyedSubscript:@"TSULocalizedErrorAlertMessage"];
    [v17 setObject:v14 forKeyedSubscript:*MEMORY[0x263F08338]];
  }
  v18 = [a1 errorWithDomain:v12 code:a4 userInfo:v17];

  return v18;
}

+ (id)tsu_errorWithDomain:()TSUAdditions code:description:underlyingError:
{
  id v10 = a3;
  id v11 = a6;
  id v12 = (objc_class *)MEMORY[0x263EFF9A0];
  id v13 = a5;
  id v14 = (void *)[[v12 alloc] initWithCapacity:2];
  [v14 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08320]];

  if (v11) {
    [v14 setObject:v11 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  id v15 = [a1 errorWithDomain:v10 code:a4 userInfo:v14];

  return v15;
}

+ (id)tsu_errorWithError:()TSUAdditions alertTitle:alertMessage:additionalUserInfo:
{
  id v10 = a6;
  if (a3)
  {
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id v14 = [v13 userInfo];
    id v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v14, "count") + objc_msgSend(v10, "count") + 1);
    v16 = v15;
    if (v14) {
      [v15 addEntriesFromDictionary:v14];
    }
    if (v10) {
      [v16 addEntriesFromDictionary:v10];
    }
    [v16 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08608]];
    v17 = [v13 domain];
    uint64_t v18 = [v13 code];

    v19 = objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:userInfo:", v17, v18, v12, v11, v16);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)tsu_errorPreservingAlertTitle
{
  v2 = [a1 userInfo];
  uint64_t v3 = *MEMORY[0x263F08320];
  v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F08320]];
  if (!v4) {
    goto LABEL_5;
  }
  v5 = [v2 objectForKeyedSubscript:@"TSULocalizedErrorAlertTitle"];
  id v6 = v5;
  if (!v5 || [v5 isEqualToString:v4])
  {

LABEL_5:
    id v7 = a1;
    goto LABEL_7;
  }
  v8 = (void *)[v2 mutableCopy];
  [v8 setObject:v6 forKeyedSubscript:v3];
  v9 = objc_opt_class();
  id v10 = [a1 domain];
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(a1, "code"), v8);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v7;
}

- (id)tsu_errorPreservingCancel
{
  v10[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (objc_msgSend(v1, "tsu_isCancelError"))
  {
    if ([v1 code] == 3072)
    {
      v2 = [v1 domain];
      uint64_t v3 = *MEMORY[0x263F07F70];
      char v4 = [v2 isEqualToString:*MEMORY[0x263F07F70]];

      if (v4) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v3 = *MEMORY[0x263F07F70];
    }
    v5 = objc_opt_class();
    uint64_t v9 = *MEMORY[0x263F08608];
    v10[0] = v1;
    id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v7 = [v5 errorWithDomain:v3 code:3072 userInfo:v6];

    id v1 = (id)v7;
  }
LABEL_7:
  return v1;
}

- (id)tsu_localizedAlertTitle
{
  id v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"TSULocalizedErrorAlertTitle"];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [v1 objectForKeyedSubscript:*MEMORY[0x263F08320]];
  }
  v5 = v4;

  return v5;
}

- (id)tsu_localizedAlertMessage
{
  id v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"TSULocalizedErrorAlertMessage"];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [v1 objectForKeyedSubscript:*MEMORY[0x263F08348]];
  }
  v5 = v4;

  return v5;
}

- (uint64_t)tsu_isOutOfSpaceError
{
  return objc_msgSend(a1, "tsu_isErrorPassingTest:", &__block_literal_global_26);
}

- (uint64_t)tsu_isCancelError
{
  return objc_msgSend(a1, "tsu_isErrorPassingTest:", &__block_literal_global_23);
}

- (uint64_t)tsu_isNoSuchFileError
{
  return objc_msgSend(a1, "tsu_isErrorPassingTest:", &__block_literal_global_25);
}

- (uint64_t)tsu_isErrorPassingTest:()TSUAdditions
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = a1;
    if (v5)
    {
      uint64_t v6 = *MEMORY[0x263F08608];
      while (1)
      {
        uint64_t v7 = [(id)v5 userInfo];
        v8 = [(id)v5 domain];
        char v9 = v4[2](v4, v8, [(id)v5 code], v7);

        if (v9) {
          break;
        }
        id v10 = [v7 objectForKeyedSubscript:v6];
        id v11 = v10;
        if (v10 != (void *)v5)
        {
          id v12 = v10;

          uint64_t v5 = (uint64_t)v12;
        }

        if (!v5) {
          goto LABEL_11;
        }
      }

      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_11:

  return v5;
}

@end