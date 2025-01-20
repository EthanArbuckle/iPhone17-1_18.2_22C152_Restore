@interface MBError
+ (BOOL)_isAnyError:(id)a3 withCodes:(char *)a4;
+ (BOOL)_isCKError:(id)a3 withCodes:(char *)a4;
+ (BOOL)_isCKNetworkDisconnectedError:(id)a3;
+ (BOOL)isAssetNotAvailableError:(id)a3;
+ (BOOL)isAssetNotFoundError:(id)a3;
+ (BOOL)isAssetTooLargeError:(id)a3;
+ (BOOL)isCKError:(id)a3;
+ (BOOL)isCKError:(id)a3 matchingSubErrors:(BOOL)a4 withCodes:(int64_t)a5;
+ (BOOL)isCKError:(id)a3 withCode:(int64_t)a4;
+ (BOOL)isCKError:(id)a3 withCodes:(int64_t)a4;
+ (BOOL)isCKInternalError:(id)a3 withCode:(int64_t)a4;
+ (BOOL)isCKNotFoundError:(id)a3;
+ (BOOL)isCKPartialFailureError:(id)a3;
+ (BOOL)isNSFileNotFoundError:(id)a3;
+ (BOOL)isNetworkDisconnectedError:(id)a3;
+ (BOOL)isResumableCacheRefreshError:(id)a3;
+ (BOOL)isRetryableRestoreError:(id)a3;
+ (BOOL)isRetryableXPCError:(id)a3;
+ (BOOL)isTooManyOpenFilesError:(id)a3;
+ (BOOL)isXPCActivityDeferredError:(id)a3;
+ (BOOL)shouldReportLowDiskSpaceForError:(id)a3;
+ (id)sanitizedError:(id)a3;
+ (id)underlyingErrorFromCKCancelationError:(id)a3;
@end

@implementation MBError

+ (BOOL)isCKError:(id)a3
{
  v3 = [a3 domain];
  unsigned __int8 v4 = [v3 isEqualToString:CKErrorDomain];

  return v4;
}

+ (BOOL)_isAnyError:(id)a3 withCodes:(char *)a4
{
  do
  {
    v5 = a4;
    a4 += 8;
    id v6 = *(id *)v5;
  }
  while (*(void *)v5 && [a3 code] != v6);
  return v6 != 0;
}

+ (BOOL)_isCKError:(id)a3 withCodes:(char *)a4
{
  id v6 = a3;
  if ([a1 isCKError:v6]) {
    unsigned __int8 v7 = [a1 _isAnyError:v6 withCodes:a4];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

+ (BOOL)isCKError:(id)a3 withCodes:(int64_t)a4
{
  id v6 = a3;
  if ([a1 isCKError:v6])
  {
    if ([v6 code] == (id)a4) {
      unsigned __int8 v7 = 1;
    }
    else {
      unsigned __int8 v7 = [a1 _isAnyError:v6 withCodes:&v9];
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

+ (BOOL)isCKError:(id)a3 withCode:(int64_t)a4
{
  id v6 = a3;
  if ([v6 code] == (id)a4) {
    unsigned __int8 v7 = [a1 isCKError:v6];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

+ (BOOL)isCKError:(id)a3 matchingSubErrors:(BOOL)a4 withCodes:(int64_t)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v22 = &v24;
  if (v6 && +[MBError isCKPartialFailureError:v7])
  {
    v8 = [v7 userInfo];
    uint64_t v9 = [v8 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v10 = objc_msgSend(v9, "allValues", 0);
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (!+[MBError isCKPartialFailureError:v15]
            && (+[MBError isCKError:v15 withCode:a5]
             || +[MBError _isCKError:v15 withCodes:v22]))
          {
            BOOL v16 = 1;
            goto LABEL_18;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    BOOL v16 = 0;
LABEL_18:
  }
  else if (+[MBError isCKError:v7 withCode:a5])
  {
    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = +[MBError _isCKError:v7 withCodes:v22];
  }

  return v16;
}

+ (BOOL)isCKInternalError:(id)a3 withCode:(int64_t)a4
{
  id v6 = a3;
  if ([a1 isCKError:v6 withCode:1])
  {
    id v7 = [v6 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

    id v6 = (id)v8;
  }
  if ([v6 code] == (id)a4)
  {
    uint64_t v9 = [v6 domain];
    unsigned __int8 v10 = [v9 isEqualToString:CKInternalErrorDomain];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

+ (BOOL)isCKPartialFailureError:(id)a3
{
  return [a1 isCKError:a3 withCode:2];
}

+ (BOOL)isCKNotFoundError:(id)a3
{
  return objc_msgSend(a1, "isCKError:withCodes:", a3, 11, 26, 0);
}

+ (BOOL)_isCKNetworkDisconnectedError:(id)a3
{
  id v4 = a3;
  if (!+[MBError isCKPartialFailureError:v4])
  {
    if ([a1 isCKError:v4 withCode:3])
    {
      id v12 = [v4 userInfo];
      uint64_t v13 = [v12 objectForKeyedSubscript:NSUnderlyingErrorKey];
    }
    else
    {
      if (![a1 isCKError:v4 withCode:7])
      {
        uint64_t v13 = 0;
        goto LABEL_22;
      }
      v14 = [v4 userInfo];
      uint64_t v13 = [v14 objectForKeyedSubscript:NSUnderlyingErrorKey];

      if ([v13 code] != (id)2008
        || ([v13 domain],
            uint64_t v15 = objc_claimAutoreleasedReturnValue(),
            unsigned int v16 = [v15 isEqualToString:CKInternalErrorDomain],
            v15,
            !v16))
      {
LABEL_22:
        if ([v13 code] == (id)-1009)
        {
          long long v18 = [v13 domain];
          LOBYTE(v8) = [v18 isEqualToString:NSURLErrorDomain];
        }
        else
        {
          LOBYTE(v8) = 0;
        }

        goto LABEL_26;
      }
      id v12 = [v13 userInfo];
      uint64_t v17 = [v12 objectForKeyedSubscript:NSUnderlyingErrorKey];

      uint64_t v13 = (void *)v17;
    }

    goto LABEL_22;
  }
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = objc_msgSend(v6, "allValues", 0);
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (!+[MBError isCKPartialFailureError:v11]
          && ([a1 _isCKNetworkDisconnectedError:v11] & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_16;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_16:

LABEL_26:
  return (char)v8;
}

+ (id)underlyingErrorFromCKCancelationError:(id)a3
{
  id v3 = a3;
  if (+[MBError isCKError:v3 withCode:20])
  {
    id v4 = [v3 userInfo];
    v5 = [v4 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if (+[MBError isError:v5 withCode:202])
    {
      id v6 = [v5 userInfo];
      id v7 = [v6 objectForKeyedSubscript:NSUnderlyingErrorKey];

      if (v7) {
        goto LABEL_7;
      }
      v5 = 0;
    }
  }
  id v7 = v3;
LABEL_7:

  return v7;
}

+ (BOOL)isRetryableXPCError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:NSCocoaErrorDomain];

  if (v5) {
    BOOL v6 = (((unint64_t)[v3 code] - 4097) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)isNetworkDisconnectedError:(id)a3
{
  id v4 = a3;
  if ([a1 _isCKNetworkDisconnectedError:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = v4;
    if (+[MBError isError:v6 withCode:308])
    {
      id v7 = [v6 userInfo];
      uint64_t v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

      id v6 = (id)v8;
    }
    if ([v6 code] == (id)-1009)
    {
      uint64_t v9 = [v6 domain];
      unsigned __int8 v5 = [v9 isEqualToString:NSURLErrorDomain];
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }
  return v5;
}

+ (BOOL)isAssetTooLargeError:(id)a3
{
  id v4 = a3;
  if (![a1 isCKError:v4 withCode:25]) {
    goto LABEL_6;
  }
  unsigned __int8 v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:NSUnderlyingErrorKey];

  if ([v6 code] != (id)2038)
  {

    goto LABEL_6;
  }
  id v7 = [v6 domain];
  unsigned __int8 v8 = [v7 isEqualToString:CKInternalErrorDomain];

  if ((v8 & 1) == 0)
  {
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

+ (BOOL)isAssetNotFoundError:(id)a3
{
  id v4 = a3;
  if ([a1 isCKError:v4 withCode:16])
  {
    unsigned __int8 v5 = [v4 userInfo];
    id v6 = [v5 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if ([v6 code] == (id)3002)
    {
      id v7 = [v6 domain];
      unsigned __int8 v8 = [v7 isEqualToString:CKInternalErrorDomain];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

+ (BOOL)isAssetNotAvailableError:(id)a3
{
  return [a1 isCKError:a3 withCode:35];
}

+ (BOOL)isXPCActivityDeferredError:(id)a3
{
  id v3 = a3;
  if (+[MBError isCKError:v3 withCode:20])
  {
    id v4 = [v3 userInfo];

    id v3 = [v4 objectForKeyedSubscript:NSUnderlyingErrorKey];
  }
  BOOL v5 = +[MBError isCKError:v3 withCode:131];

  return v5;
}

+ (BOOL)isResumableCacheRefreshError:(id)a3
{
  id v3 = a3;
  if (+[MBError isCKError:withCodes:](MBError, "isCKError:withCodes:", v3, 4, 3, 6, 7, 0)
    || +[MBError isRetryableXPCError:v3])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    BOOL v5 = MBSanitizeError(v3);
    unsigned __int8 v4 = +[MBError isCancelledError:v5];
  }
  return v4;
}

+ (BOOL)shouldReportLowDiskSpaceForError:(id)a3
{
  id v3 = a3;
  if (+[MBError isRetryableXPCError:v3]
    || (+[MBError isError:withCodes:](MBError, "isError:withCodes:", v3, 100, 102, 105, 106, 0) & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [v3 domain];
    if ([v5 isEqualToString:PQLSqliteErrorDomain]) {
      BOOL v4 = [v3 code] == (id)13;
    }
    else {
      BOOL v4 = 0;
    }
  }
  return v4;
}

+ (BOOL)isRetryableRestoreError:(id)a3
{
  id v3 = a3;
  if (!v3) {
    __assert_rtn("+[MBError(Helpers) isRetryableRestoreError:]", "MBError+Helpers.m", 199, "error");
  }
  BOOL v4 = v3;
  if (+[MBError isCKError:v3 withCode:15])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = MBSanitizeError(v4);
    BOOL v5 = v6 && (+[MBError isTransientError:v6] & 1) != 0;
  }
  return v5;
}

+ (id)sanitizedError:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    BOOL v5 = MBSanitizeError(v3);

    id v6 = [v5 userInfo];
    id v7 = [v6 mutableCopy];

    [v7 removeObjectForKey:NSUnderlyingErrorKey];
    unsigned __int8 v8 = [v5 domain];
    BOOL v4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v8, [v5 code], v7);
  }
  return v4;
}

+ (BOOL)isNSFileNotFoundError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)4 || objc_msgSend(v3, "code") == (id)260)
  {
    BOOL v4 = [v3 domain];
    unsigned __int8 v5 = [v4 isEqualToString:NSCocoaErrorDomain];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (BOOL)isTooManyOpenFilesError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)24
    && ([v3 domain],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 isEqualToString:NSPOSIXErrorDomain],
        v4,
        (v5 & 1) != 0))
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    id v7 = [v3 userInfo];
    unsigned __int8 v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if (v8 && [v8 code] == (id)24)
    {
      BOOL v9 = [v8 domain];
      unsigned __int8 v6 = [v9 isEqualToString:NSPOSIXErrorDomain];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  return v6;
}

@end