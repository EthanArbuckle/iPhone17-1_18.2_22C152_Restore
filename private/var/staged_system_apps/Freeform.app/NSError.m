@interface NSError
+ (id)crl_errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)crl_errorWithDomain:(id)a3 code:(int64_t)a4 alertTitle:(id)a5 alertMessage:(id)a6;
+ (id)crl_errorWithDomain:(id)a3 code:(int64_t)a4 alertTitle:(id)a5 alertMessage:(id)a6 userInfo:(id)a7;
+ (id)crl_errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 recoverySuggestion:(id)a6;
+ (id)crl_errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlyingError:(id)a6;
+ (id)crl_errorWithError:(id)a3 alertTitle:(id)a4 alertMessage:(id)a5 additionalUserInfo:(id)a6;
+ (id)crl_fileReadCorruptedFileErrorWithUserInfo:(id)a3;
+ (id)crl_fileReadPOSIXErrorWithNumber:(int)a3 userInfo:(id)a4;
+ (id)crl_fileReadUnknownErrorWithUserInfo:(id)a3;
+ (id)crl_fileWritePOSIXErrorWithNumber:(int)a3 userInfo:(id)a4;
+ (id)crl_fileWriteUnknownErrorWithUserInfo:(id)a3;
+ (id)crl_userInfoWithErrorType:(int64_t)a3 userInfo:(id)a4;
- (BOOL)crl_errorShouldAlwaysBeReportedDuringImport;
- (BOOL)crl_isCancelError;
- (BOOL)crl_isCorruptedError;
- (BOOL)crl_isErrorPassingTest:(id)a3;
- (BOOL)crl_isFeatureUnsupportedError;
- (BOOL)crl_isFileExistsError;
- (BOOL)crl_isNoPermissionError;
- (BOOL)crl_isNoSuchFileError;
- (BOOL)crl_isOutOfSpaceError;
- (BOOL)crl_isReadError;
- (BOOL)crl_isWriteError;
- (NSString)crl_zipArchiveErrorDescription;
- (NSString)crl_zipArchiveErrorEntryName;
- (id)crl_errorPreservingAlertTitle;
- (id)crl_errorPreservingCancel;
- (id)crl_localizedAlertMessage;
- (id)crl_localizedAlertTitle;
- (void)crl_enumerateErrorUsingBlock:(id)a3;
@end

@implementation NSError

- (NSString)crl_zipArchiveErrorDescription
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_100129688;
  v9 = sub_100129698;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10012AC90;
  v4[3] = &unk_1014D8198;
  v4[4] = &v5;
  [(NSError *)self crl_enumerateErrorUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (NSString)crl_zipArchiveErrorEntryName
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_100129688;
  v9 = sub_100129698;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10012AE3C;
  v4[3] = &unk_1014D8198;
  v4[4] = &v5;
  [(NSError *)self crl_enumerateErrorUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

+ (id)crl_errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 recoverySuggestion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  v14 = v13;
  if (v11) {
    [v13 setObject:v11 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  if (v12) {
    [v14 setObject:v12 forKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
  }
  v15 = [a1 errorWithDomain:v10 code:a4 userInfo:v14];

  return v15;
}

+ (id)crl_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  if ((unint64_t)a3 >= 3)
  {
    int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E46B8);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108F818(v7, v8);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E46D8);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v9, v7);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSError(CRLAdditions) crl_errorWithCode:userInfo:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSError_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:39 isFatal:0 description:"Bad error code"];
  }
  id v12 = [a1 errorWithDomain:@"com.apple.freeform" code:a3 userInfo:v6];

  return v12;
}

+ (id)crl_errorWithDomain:(id)a3 code:(int64_t)a4 alertTitle:(id)a5 alertMessage:(id)a6
{
  return [a1 crl_errorWithDomain:a3 code:a4 alertTitle:a5 alertMessage:a6 userInfo:0];
}

+ (id)crl_errorWithDomain:(id)a3 code:(int64_t)a4 alertTitle:(id)a5 alertMessage:(id)a6 userInfo:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (char *)objc_msgSend(v15, "count") + 4);
  v17 = v16;
  if (v15) {
    [v16 addEntriesFromDictionary:v15];
  }
  if (v13)
  {
    [v17 setObject:v13 forKeyedSubscript:NSLocalizedDescriptionKey];
    [v17 setObject:v13 forKeyedSubscript:@"CRLLocalizedErrorAlertTitle"];
  }
  if (v14)
  {
    [v17 setObject:v14 forKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
    [v17 setObject:v14 forKeyedSubscript:@"CRLLocalizedErrorAlertMessage"];
    [v17 setObject:v14 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];
  }
  v18 = [a1 errorWithDomain:v12 code:a4 userInfo:v17];

  return v18;
}

+ (id)crl_errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlyingError:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  [v13 setObject:v12 forKeyedSubscript:NSLocalizedDescriptionKey];

  if (v11) {
    [v13 setObject:v11 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  id v14 = [a1 errorWithDomain:v10 code:a4 userInfo:v13];

  return v14;
}

+ (id)crl_errorWithError:(id)a3 alertTitle:(id)a4 alertMessage:(id)a5 additionalUserInfo:(id)a6
{
  id v10 = a6;
  if (a3)
  {
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id v14 = [v13 userInfo];
    id v15 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (char *)objc_msgSend(v10, "count") + (void)objc_msgSend(v14, "count") + 1);
    id v16 = v15;
    if (v14) {
      [v15 addEntriesFromDictionary:v14];
    }
    if (v10) {
      [v16 addEntriesFromDictionary:v10];
    }
    [v16 setObject:v13 forKeyedSubscript:NSUnderlyingErrorKey];
    v17 = [v13 domain];
    id v18 = [v13 code];

    v19 = [a1 crl_errorWithDomain:v17 code:v18 alertTitle:v12 alertMessage:v11 userInfo:v16];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)crl_errorPreservingAlertTitle
{
  v3 = [(NSError *)self userInfo];
  v4 = [v3 objectForKeyedSubscript:NSLocalizedDescriptionKey];
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [v3 objectForKeyedSubscript:@"CRLLocalizedErrorAlertTitle"];
  id v6 = v5;
  if (!v5 || [v5 isEqualToString:v4])
  {

LABEL_5:
    int v7 = self;
    goto LABEL_7;
  }
  id v8 = [v3 mutableCopy];
  [v8 setObject:v6 forKeyedSubscript:NSLocalizedDescriptionKey];
  v9 = objc_opt_class();
  id v10 = [(NSError *)self domain];
  [v9 errorWithDomain:v10 code:[self code] userInfo:v8];
  int v7 = (NSError *)objc_claimAutoreleasedReturnValue();

LABEL_7:

  return v7;
}

- (id)crl_errorPreservingCancel
{
  id v2 = self;
  if ([(NSError *)v2 crl_isCancelError])
  {
    if ((id)[(NSError *)v2 code] == (id)3072)
    {
      v3 = [(NSError *)v2 domain];
      NSErrorDomain v4 = NSCocoaErrorDomain;
      unsigned __int8 v5 = [v3 isEqualToString:NSCocoaErrorDomain];

      if (v5) {
        goto LABEL_7;
      }
    }
    else
    {
      NSErrorDomain v4 = NSCocoaErrorDomain;
    }
    id v6 = objc_opt_class();
    NSErrorUserInfoKey v10 = NSUnderlyingErrorKey;
    id v11 = v2;
    int v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v8 = [v6 errorWithDomain:v4 code:3072 userInfo:v7];

    id v2 = (NSError *)v8;
  }
LABEL_7:

  return v2;
}

- (id)crl_localizedAlertTitle
{
  id v2 = [(NSError *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"CRLLocalizedErrorAlertTitle"];
  NSErrorDomain v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 objectForKeyedSubscript:NSLocalizedDescriptionKey];
  }
  id v6 = v5;

  return v6;
}

- (id)crl_localizedAlertMessage
{
  id v2 = [(NSError *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"CRLLocalizedErrorAlertMessage"];
  NSErrorDomain v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 objectForKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
  }
  id v6 = v5;

  return v6;
}

- (BOOL)crl_isOutOfSpaceError
{
  return [(NSError *)self crl_isErrorPassingTest:&stru_1014E4718];
}

- (BOOL)crl_isCancelError
{
  return [(NSError *)self crl_isErrorPassingTest:&stru_1014E4738];
}

- (BOOL)crl_isFileExistsError
{
  return [(NSError *)self crl_isErrorPassingTest:&stru_1014E4758];
}

- (BOOL)crl_isNoSuchFileError
{
  return [(NSError *)self crl_isErrorPassingTest:&stru_1014E4778];
}

- (BOOL)crl_isNoPermissionError
{
  return [(NSError *)self crl_isErrorPassingTest:&stru_1014E4798];
}

- (BOOL)crl_isFeatureUnsupportedError
{
  return [(NSError *)self crl_isErrorPassingTest:&stru_1014E47B8];
}

- (void)crl_enumerateErrorUsingBlock:(id)a3
{
  NSErrorDomain v4 = (void (**)(id, void *, id, void *, unsigned char *))a3;
  if (v4)
  {
    id v5 = self;
    char v12 = 0;
    if (v5)
    {
      id v6 = v5;
      do
      {
        int v7 = [(NSError *)v6 userInfo];
        uint64_t v8 = [(NSError *)v6 domain];
        v4[2](v4, v8, (id)[(NSError *)v6 code], v7, &v12);

        v9 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];
        NSErrorUserInfoKey v10 = v9;
        if (v9 != v6)
        {
          id v11 = v9;

          id v6 = v11;
        }
      }
      while (v6 && !v12);
    }
  }
}

- (BOOL)crl_isErrorPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10023F4F8;
    v8[3] = &unk_1014E47E0;
    id v9 = v4;
    NSErrorUserInfoKey v10 = &v11;
    [(NSError *)self crl_enumerateErrorUsingBlock:v8];

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

+ (id)crl_userInfoWithErrorType:(int64_t)a3 userInfo:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (char *)objc_msgSend(v5, "count") + 1);
  int v7 = v6;
  if (v5) {
    [v6 addEntriesFromDictionary:v5];
  }
  uint64_t v8 = +[NSNumber numberWithInteger:a3];
  [v7 setObject:v8 forKeyedSubscript:@"CRLIOErrorType"];

  return v7;
}

+ (id)crl_fileReadUnknownErrorWithUserInfo:(id)a3
{
  v3 = [a1 crl_userInfoWithErrorType:1 userInfo:a3];
  id v4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:256 userInfo:v3];

  return v4;
}

+ (id)crl_fileReadCorruptedFileErrorWithUserInfo:(id)a3
{
  v3 = [a1 crl_userInfoWithErrorType:1 userInfo:a3];
  id v4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:259 userInfo:v3];

  return v4;
}

+ (id)crl_fileReadPOSIXErrorWithNumber:(int)a3 userInfo:(id)a4
{
  uint64_t v4 = a3;
  id v5 = [a1 crl_userInfoWithErrorType:1 userInfo:a4];
  id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v4 userInfo:v5];

  return v6;
}

+ (id)crl_fileWriteUnknownErrorWithUserInfo:(id)a3
{
  v3 = [a1 crl_userInfoWithErrorType:2 userInfo:a3];
  uint64_t v4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:512 userInfo:v3];

  return v4;
}

+ (id)crl_fileWritePOSIXErrorWithNumber:(int)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)NSError);
  uint64_t v8 = [a1 crl_userInfoWithErrorType:2 userInfo:v6];

  id v9 = [v7 initWithDomain:NSPOSIXErrorDomain code:a3 userInfo:v8];

  return v9;
}

- (BOOL)crl_isReadError
{
  return [(NSError *)self crl_isErrorPassingTest:&stru_1014EEE90];
}

- (BOOL)crl_isCorruptedError
{
  return [(NSError *)self crl_isErrorPassingTest:&stru_1014EEEB0];
}

- (BOOL)crl_isWriteError
{
  return [(NSError *)self crl_isErrorPassingTest:&stru_1014EEED0];
}

- (BOOL)crl_errorShouldAlwaysBeReportedDuringImport
{
  id v2 = self;
  char v3 = sub_100DCA34C();

  return v3 & 1;
}

@end