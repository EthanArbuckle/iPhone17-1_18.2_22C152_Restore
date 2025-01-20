@interface NSError
+ (id)tsp_dataCorruptionErrorWithError:(id)a3 reason:(id)a4 data:(id)a5 dataProperties:(DataProperties *)a6 actualDataDigest:(id)a7 isLikelyOSCorruption:(BOOL)a8 isLikelyZeroBytesCorruption:(BOOL)a9;
+ (id)tsp_ensureCorruptedDocumentErrorWithError:(id)a3;
+ (id)tsp_ensureReadErrorWithError:(id)a3;
+ (id)tsp_ensureSaveErrorWithError:(id)a3;
+ (id)tsp_errorWithCode:(int64_t)a3;
+ (id)tsp_errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)tsp_errorWithCode:(int64_t)a3 userInfo:(id)a4 isRecoverable:(BOOL)a5;
+ (id)tsp_errorWithError:(id)a3 hints:(id)a4;
+ (id)tsp_readCorruptZipOfPackageErrorWithUserInfo:(id)a3;
+ (id)tsp_readCorruptedDocumentErrorWithUserInfo:(id)a3;
+ (id)tsp_readPOSIXErrorWithNumber:(int)a3 userInfo:(id)a4;
+ (id)tsp_recoverableErrorWithCode:(int64_t)a3;
+ (id)tsp_recoverableErrorWithError:(id)a3;
+ (id)tsp_saveDocumentErrorWithUserInfo:(id)a3;
+ (id)tsp_storageSpaceErrorWithUserInfo:(id)a3;
+ (id)tsp_unknownReadErrorWithUserInfo:(id)a3;
+ (id)tsp_unknownWriteErrorWithUserInfo:(id)a3;
+ (id)tsp_unsupportedVersionErrorWithUserInfo:(id)a3;
+ (id)tsp_userInfoWithUserInfo:(id)a3 additionalUserInfo:(id)a4;
+ (id)tsp_writePOSIXErrorWithNumber:(int)a3 userInfo:(id)a4;
+ (id)tsu_errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)tsu_errorWithDomain:(id)a3 code:(int64_t)a4 alertTitle:(id)a5 alertMessage:(id)a6;
+ (id)tsu_errorWithDomain:(id)a3 code:(int64_t)a4 alertTitle:(id)a5 alertMessage:(id)a6 userInfo:(id)a7;
+ (id)tsu_errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 recoverySuggestion:(id)a6;
+ (id)tsu_errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlyingError:(id)a6;
+ (id)tsu_errorWithError:(id)a3 alertTitle:(id)a4 alertMessage:(id)a5 additionalUserInfo:(id)a6;
+ (id)tsu_errorWithWarning:(id)a3;
+ (id)tsu_fileReadCorruptedFileErrorWithUserInfo:(id)a3;
+ (id)tsu_fileReadPOSIXErrorWithNumber:(int)a3 userInfo:(id)a4;
+ (id)tsu_fileReadUnknownErrorWithUserInfo:(id)a3;
+ (id)tsu_fileWritePOSIXErrorWithNumber:(int)a3 userInfo:(id)a4;
+ (id)tsu_fileWriteUnknownErrorWithUserInfo:(id)a3;
+ (id)tsu_userInfoWithErrorType:(int64_t)a3 userInfo:(id)a4;
- (BOOL)tsp_expectedDataDigestMatch;
- (BOOL)tsp_isCorruptZipOfPackageError;
- (BOOL)tsp_isCorruptedError;
- (BOOL)tsp_isDataCorruptionError;
- (BOOL)tsp_isDataDigestMismatchError;
- (BOOL)tsp_isDocumentTooNewError;
- (BOOL)tsp_isLikelyOSCorruption;
- (BOOL)tsp_isLikelyZeroBytesCorruption;
- (BOOL)tsp_isPasswordInputError;
- (BOOL)tsp_isRecoverable;
- (BOOL)tsp_isTSPError;
- (BOOL)tsp_isUnsupportedVersionError;
- (BOOL)tsp_isWriteError;
- (BOOL)tsu_isCancelError;
- (BOOL)tsu_isCorruptedError;
- (BOOL)tsu_isErrorPassingTest:(id)a3;
- (BOOL)tsu_isFeatureUnsupportedError;
- (BOOL)tsu_isFileExistsError;
- (BOOL)tsu_isNoPermissionError;
- (BOOL)tsu_isNoSuchFileError;
- (BOOL)tsu_isOutOfSpaceError;
- (BOOL)tsu_isReadError;
- (BOOL)tsu_isWriteError;
- (NSDate)tsp_dataCreationTime;
- (NSSet)tsp_hints;
- (NSString)tsp_actualDataDigest;
- (NSString)tsp_dataCreationVersion;
- (NSString)tsp_dataType;
- (NSString)tsp_dataValidationReason;
- (NSString)tsp_expectedDataDigest;
- (NSString)tsp_hintsDescription;
- (NSString)tsu_zipArchiveErrorDescription;
- (NSString)tsu_zipArchiveErrorEntryName;
- (id)tsu_errorPreservingAlertTitle;
- (id)tsu_errorPreservingCancel;
- (id)tsu_localizedAlertMessage;
- (id)tsu_localizedAlertTitle;
- (int64_t)tsp_dataIdentifier;
- (unint64_t)tsp_dataLength;
- (void)tsu_enumerateErrorUsingBlock:(id)a3;
@end

@implementation NSError

+ (id)tsp_errorWithCode:(int64_t)a3
{
  return objc_msgSend(a1, "tsp_errorWithCode:userInfo:isRecoverable:", a3, 0, 0);
}

+ (id)tsp_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  v4 = objc_msgSend(a1, "tsp_errorWithCode:userInfo:isRecoverable:", a3, a4, 0);
  return v4;
}

+ (id)tsp_errorWithCode:(int64_t)a3 userInfo:(id)a4 isRecoverable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  switch(a3)
  {
    case 2:
    case 3:
      v9 = UnsafePointer();
      v10 = [v9 localizedStringForKey:@"The document could not be autosaved." value:&stru_1001D3790 table:@"TSPersistence"];

      v11 = UnsafePointer();
      if (a3 == 2) {
        [v11 localizedStringForKey:@"Your most recent changes might be lost." value:&stru_1001D3790 table:@"TSPersistence"];
      }
      else {
      v12 = [v11 localizedStringForKey:@"The disk is full. Free up some space, then return to your document. Your most recent changes might be lost.", &stru_1001D3790, @"TSPersistence" value table];
      }
      goto LABEL_10;
    case 4:
    case 5:
    case 6:
      v11 = UnsafePointer();
      uint64_t v13 = [v11 localizedStringForKey:@"Encountered a critical error." value:&stru_1001D3790 table:@"TSPersistence"];
      goto LABEL_7;
    case 7:
      v11 = UnsafePointer();
      uint64_t v13 = [v11 localizedStringForKey:@"To open this document, download the latest version of the app from the App Store.", &stru_1001D3790, @"TSPersistence" value table];
LABEL_7:
      v10 = (void *)v13;
      v12 = 0;
LABEL_10:

      if (!v10) {
        goto LABEL_13;
      }
      if (v5) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
      v12 = 0;
LABEL_13:
      v15 = UnsafePointer();
      v10 = [v15 localizedStringForKey:@"An error occurred while reading the document." value:&stru_1001D3790 table:@"TSPersistence"];

      if (v5)
      {
LABEL_12:
        CFStringRef v19 = @"TSPErrorIsRecoverable";
        v20 = &__kCFBooleanTrue;
        v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      }
      else
      {
LABEL_14:
        v14 = 0;
      }
      v16 = objc_msgSend(a1, "tsp_userInfoWithUserInfo:additionalUserInfo:", v8, v14);
      v17 = objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:userInfo:", @"com.apple.iWork.TSPersistence", a3, v10, v12, v16);

      if (v5) {
      return v17;
      }
  }
}

+ (id)tsp_recoverableErrorWithCode:(int64_t)a3
{
  return objc_msgSend(a1, "tsp_errorWithCode:userInfo:isRecoverable:", a3, 0, 1);
}

+ (id)tsp_userInfoWithUserInfo:(id)a3 additionalUserInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (char *)objc_msgSend(v6, "count") + (void)objc_msgSend(v5, "count") + 1);
  id v8 = v7;
  if (v5) {
    [v7 addEntriesFromDictionary:v5];
  }
  if (v6) {
    [v8 addEntriesFromDictionary:v6];
  }
  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:@"TSPErrorIsTSPError"];

  return v8;
}

+ (id)tsp_recoverableErrorWithError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 domain];
    id v7 = [v5 code];
    id v8 = [v5 userInfo];
    CFStringRef v13 = @"TSPErrorIsRecoverable";
    v14 = &__kCFBooleanTrue;
    v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    v10 = objc_msgSend(a1, "tsp_userInfoWithUserInfo:additionalUserInfo:", v8, v9);
    v11 = [a1 errorWithDomain:v6 code:v7 userInfo:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)tsp_errorWithError:(id)a3 hints:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v15 = 0;
    goto LABEL_12;
  }
  v9 = (char *)[v7 count];
  if (!v9)
  {
    id v15 = v6;
    goto LABEL_12;
  }
  v10 = [v6 userInfo];
  v11 = [v10 objectForKeyedSubscript:@"TSPErrorHints"];

  id v12 = [v11 count];
  if (!v12)
  {
    id v14 = +[NSSet setWithArray:v8];
LABEL_10:
    v16 = [v6 domain];
    id v17 = [v6 code];
    v18 = [v6 userInfo];
    CFStringRef v22 = @"TSPErrorHints";
    id v23 = v14;
    CFStringRef v19 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v20 = objc_msgSend(a1, "tsp_userInfoWithUserInfo:additionalUserInfo:", v18, v19);
    id v15 = [a1 errorWithDomain:v16 code:v17 userInfo:v20];

    goto LABEL_11;
  }
  id v13 = [objc_alloc((Class)NSMutableSet) initWithCapacity:&v9[(void)v12]];
  [v13 unionSet:v11];
  [v13 addObjectsFromArray:v8];
  id v14 = v13;
  if (![v14 isEqualToSet:v11])
  {

    goto LABEL_10;
  }
  id v15 = v6;

LABEL_11:
LABEL_12:

  return v15;
}

+ (id)tsp_unknownReadErrorWithUserInfo:(id)a3
{
  id v4 = objc_msgSend(a1, "tsp_userInfoWithUserInfo:additionalUserInfo:", a3, 0);
  id v5 = objc_msgSend(a1, "tsu_fileReadUnknownErrorWithUserInfo:", v4);

  return v5;
}

+ (id)tsp_readCorruptedDocumentErrorWithUserInfo:(id)a3
{
  id v4 = objc_msgSend(a1, "tsp_userInfoWithUserInfo:additionalUserInfo:", a3, 0);
  id v5 = objc_msgSend(a1, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v4);

  return v5;
}

+ (id)tsp_readPOSIXErrorWithNumber:(int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = objc_msgSend(a1, "tsp_userInfoWithUserInfo:additionalUserInfo:", a4, 0);
  id v7 = objc_msgSend(a1, "tsu_fileReadPOSIXErrorWithNumber:userInfo:", v4, v6);

  return v7;
}

+ (id)tsp_unsupportedVersionErrorWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (char *)objc_msgSend(v4, "count") + 1);
  id v6 = v5;
  if (v4) {
    [v5 addEntriesFromDictionary:v4];
  }
  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:@"TSPIsUnsupportedVersionError"];
  id v7 = objc_msgSend(a1, "tsp_unknownReadErrorWithUserInfo:", v6);

  return v7;
}

+ (id)tsp_unknownWriteErrorWithUserInfo:(id)a3
{
  id v4 = objc_msgSend(a1, "tsp_userInfoWithUserInfo:additionalUserInfo:", a3, 0);
  id v5 = objc_msgSend(a1, "tsu_fileWriteUnknownErrorWithUserInfo:", v4);

  return v5;
}

+ (id)tsp_saveDocumentErrorWithUserInfo:(id)a3
{
  v3 = objc_msgSend(a1, "tsp_errorWithCode:userInfo:", 2, a3);
  return v3;
}

+ (id)tsp_storageSpaceErrorWithUserInfo:(id)a3
{
  v3 = objc_msgSend(a1, "tsp_errorWithCode:userInfo:", 3, a3);
  return v3;
}

+ (id)tsp_readCorruptZipOfPackageErrorWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (char *)objc_msgSend(v4, "count") + 1);
  id v6 = v5;
  if (v4) {
    [v5 addEntriesFromDictionary:v4];
  }
  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:@"TSPIsCorruptZipOfPackageError"];
  id v7 = objc_msgSend(a1, "tsp_readCorruptedDocumentErrorWithUserInfo:", v6);

  return v7;
}

+ (id)tsp_writePOSIXErrorWithNumber:(int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = objc_msgSend(a1, "tsp_userInfoWithUserInfo:additionalUserInfo:", a4, 0);
  id v7 = objc_msgSend(a1, "tsu_fileWritePOSIXErrorWithNumber:userInfo:", v4, v6);

  return v7;
}

+ (id)tsp_ensureReadErrorWithError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    objc_msgSend(a1, "tsp_unknownReadErrorWithUserInfo:", 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    id v12 = v11;
    goto LABEL_17;
  }
  if ([v4 code] != (id)2 && objc_msgSend(v5, "code") != (id)3)
  {
    id v6 = [v5 domain];
    unsigned int v7 = [v6 isEqualToString:@"com.apple.iWork.TSPersistence"];

    if (v7) {
      goto LABEL_12;
    }
  }
  if (objc_msgSend(v5, "tsu_isCancelError"))
  {
    if ([v5 code] != (id)3072)
    {
      NSErrorDomain v9 = NSCocoaErrorDomain;
LABEL_15:
      NSErrorUserInfoKey v18 = NSUnderlyingErrorKey;
      CFStringRef v19 = v5;
      id v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v12 = +[NSError errorWithDomain:v9 code:3072 userInfo:v13];

      goto LABEL_17;
    }
    id v8 = [v5 domain];
    NSErrorDomain v9 = NSCocoaErrorDomain;
    unsigned __int8 v10 = [v8 isEqualToString:NSCocoaErrorDomain];

    if ((v10 & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if ((objc_msgSend(v5, "tsp_isReadError") & 1) != 0
    || (objc_msgSend(v5, "tsp_isCorruptedError") & 1) != 0)
  {
LABEL_12:
    id v11 = v5;
    goto LABEL_13;
  }
  NSErrorUserInfoKey v16 = NSUnderlyingErrorKey;
  id v17 = v5;
  id v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v12 = objc_msgSend(a1, "tsp_unknownReadErrorWithUserInfo:", v14);

LABEL_17:
  return v12;
}

+ (id)tsp_ensureCorruptedDocumentErrorWithError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    objc_msgSend(a1, "tsp_readCorruptedDocumentErrorWithUserInfo:", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "tsp_isCorruptedError"))
  {
    id v6 = v5;
LABEL_5:
    unsigned int v7 = v6;
    goto LABEL_7;
  }
  NSErrorUserInfoKey v10 = NSUnderlyingErrorKey;
  id v11 = v5;
  id v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  unsigned int v7 = objc_msgSend(a1, "tsp_readCorruptedDocumentErrorWithUserInfo:", v8);

LABEL_7:
  return v7;
}

+ (id)tsp_ensureSaveErrorWithError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  unsigned int v6 = [v5 isEqualToString:@"com.apple.iWork.TSPersistence"];

  if (!v4)
  {
    objc_msgSend(a1, "tsp_saveDocumentErrorWithUserInfo:", 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if ((v6 & 1) == 0 && objc_msgSend(v4, "tsu_isOutOfSpaceError"))
  {
    NSErrorUserInfoKey v16 = NSUnderlyingErrorKey;
    id v17 = v4;
    unsigned int v7 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v8 = objc_msgSend(a1, "tsp_storageSpaceErrorWithUserInfo:", v7);

    goto LABEL_16;
  }
  if ([v4 code] == (id)3) {
    unsigned int v9 = v6;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v9 == 1 || ([v4 code] == (id)2 ? (char v10 = v6) : (char v10 = 0), (v10 & 1) != 0))
  {
    id v11 = v4;
LABEL_15:
    id v8 = v11;
    goto LABEL_16;
  }
  NSErrorUserInfoKey v14 = NSUnderlyingErrorKey;
  id v15 = v4;
  id v13 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v8 = objc_msgSend(a1, "tsp_saveDocumentErrorWithUserInfo:", v13);

LABEL_16:
  return v8;
}

- (BOOL)tsp_isTSPError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001C5A80];
}

- (BOOL)tsp_isCorruptedError
{
  return [(NSError *)self tsu_isCorruptedError];
}

- (BOOL)tsp_isWriteError
{
  return [(NSError *)self tsu_isWriteError];
}

- (BOOL)tsp_isRecoverable
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001C5AA0];
}

- (NSSet)tsp_hints
{
  uint64_t v13 = 0;
  NSErrorUserInfoKey v14 = &v13;
  uint64_t v15 = 0x3032000000;
  NSErrorUserInfoKey v16 = sub_100011AC4;
  id v17 = sub_100011AD4;
  id v18 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = sub_100011AC4;
  id v11 = sub_100011AD4;
  id v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011ADC;
  v6[3] = &unk_1001C5AC8;
  v6[4] = &v13;
  v6[5] = &v7;
  [(NSError *)self tsu_enumerateErrorUsingBlock:v6];
  v2 = (void *)v8[5];
  if (v2 || (v2 = (void *)v14[5]) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = (id)objc_opt_new();
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return (NSSet *)v4;
}

- (NSString)tsp_hintsDescription
{
  id v3 = objc_opt_new();
  [v3 appendString:@"["];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(NSError *)self tsp_hints];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    char v7 = 1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ((v7 & 1) == 0) {
          [v3 appendString:@", "];
        }
        [v3 appendString:v9];
        char v7 = 0;
      }
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      char v7 = 0;
    }
    while (v5);
  }

  [v3 appendString:@"]"];
  return (NSString *)v3;
}

- (BOOL)tsp_isDocumentTooNewError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001C5AE8];
}

- (BOOL)tsp_isUnsupportedVersionError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001C5B08];
}

- (BOOL)tsp_isCorruptZipOfPackageError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001C5B28];
}

- (BOOL)tsp_isPasswordInputError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001C5B48];
}

- (BOOL)tsp_isDataCorruptionError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001C5B68];
}

- (NSString)tsp_dataValidationReason
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100011AC4;
  uint64_t v9 = sub_100011AD4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000120F4;
  v4[3] = &unk_1001C5B90;
  v4[4] = &v5;
  [(NSError *)self tsu_enumerateErrorUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (BOOL)tsp_isDataDigestMismatchError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001C5BB0];
}

- (int64_t)tsp_dataIdentifier
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100011AC4;
  uint64_t v9 = sub_100011AD4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001237C;
  v4[3] = &unk_1001C5B90;
  v4[4] = &v5;
  [(NSError *)self tsu_enumerateErrorUsingBlock:v4];
  id v2 = [(id)v6[5] longLongValue];
  _Block_object_dispose(&v5, 8);

  return (int64_t)v2;
}

- (NSString)tsp_expectedDataDigest
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100011AC4;
  uint64_t v9 = sub_100011AD4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001255C;
  v4[3] = &unk_1001C5B90;
  v4[4] = &v5;
  [(NSError *)self tsu_enumerateErrorUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (NSString)tsp_actualDataDigest
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100011AC4;
  uint64_t v9 = sub_100011AD4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001273C;
  v4[3] = &unk_1001C5B90;
  v4[4] = &v5;
  [(NSError *)self tsu_enumerateErrorUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (BOOL)tsp_expectedDataDigestMatch
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001C5BD0];
}

- (BOOL)tsp_isLikelyOSCorruption
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001C5BF0];
}

- (BOOL)tsp_isLikelyZeroBytesCorruption
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001C5C10];
}

- (NSDate)tsp_dataCreationTime
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100011AC4;
  uint64_t v9 = sub_100011AD4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012B44;
  v4[3] = &unk_1001C5B90;
  v4[4] = &v5;
  [(NSError *)self tsu_enumerateErrorUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

- (NSString)tsp_dataCreationVersion
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100011AC4;
  uint64_t v9 = sub_100011AD4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012D24;
  v4[3] = &unk_1001C5B90;
  v4[4] = &v5;
  [(NSError *)self tsu_enumerateErrorUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (unint64_t)tsp_dataLength
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100011AC4;
  uint64_t v9 = sub_100011AD4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012EF4;
  v4[3] = &unk_1001C5B90;
  v4[4] = &v5;
  [(NSError *)self tsu_enumerateErrorUsingBlock:v4];
  id v2 = [(id)v6[5] unsignedLongLongValue];
  _Block_object_dispose(&v5, 8);

  return (unint64_t)v2;
}

- (NSString)tsp_dataType
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100011AC4;
  uint64_t v9 = sub_100011AD4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000130D4;
  v4[3] = &unk_1001C5B90;
  v4[4] = &v5;
  [(NSError *)self tsu_enumerateErrorUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

+ (id)tsp_dataCorruptionErrorWithError:(id)a3 reason:(id)a4 data:(id)a5 dataProperties:(DataProperties *)a6 actualDataDigest:(id)a7 isLikelyOSCorruption:(BOOL)a8 isLikelyZeroBytesCorruption:(BOOL)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:14];
  [v18 setObject:&__kCFBooleanTrue forKeyedSubscript:@"TSPIsDataCorruptionError"];
  CFStringRef v19 = +[NSNumber numberWithBool:a6->var0 == 1];
  [v18 setObject:v19 forKeyedSubscript:@"TSPExpectedDataDigestMatch"];

  v20 = +[NSNumber numberWithBool:v9];
  [v18 setObject:v20 forKeyedSubscript:@"TSPIsLikelyOSCorruption"];

  v21 = +[NSNumber numberWithBool:a9];
  [v18 setObject:v21 forKeyedSubscript:@"TSPIsLikelyZeroBytesCorruption"];

  if (v15) {
    [v18 setObject:v15 forKeyedSubscript:@"TSPDataValidationReason"];
  }
  CFStringRef v22 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v16 identifier]);
  [v18 setObject:v22 forKeyedSubscript:@"TSPDataIdentifier"];

  id v23 = [v16 digest];
  v24 = v23;
  if (v23)
  {
    v25 = [v23 digestString];
    [v18 setObject:v25 forKeyedSubscript:@"TSPExpectedDataDigest"];
  }
  if (v17)
  {
    v26 = [v17 digestString];
    [v18 setObject:v26 forKeyedSubscript:@"TSPActualDataDigest"];

    if (v24) {
      uint64_t v27 = [v24 isEqual:v17] ^ 1;
    }
    else {
      uint64_t v27 = 0;
    }
    v28 = +[NSNumber numberWithBool:v27];
    [v18 setObject:v28 forKeyedSubscript:@"TSPIsDataDigestMismatchError"];
  }
  id v29 = a6->var1;
  if (v29) {
    [v18 setObject:v29 forKeyedSubscript:@"TSPDataCreationTime"];
  }
  unint64_t var2 = a6->var2;
  if (var2)
  {
    v31 = NSStringFromTSPVersion(var2);
    [v18 setObject:v31 forKeyedSubscript:@"TSPDataCreationVersion"];
  }
  v32 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v16 length]);
  [v18 setObject:v32 forKeyedSubscript:@"TSPDataLength"];

  v33 = [v16 type];
  if (v33) {
    [v18 setObject:v33 forKeyedSubscript:@"TSPDataType"];
  }
  if (v14) {
    [v18 setObject:v14 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  v34 = objc_msgSend(a1, "tsp_readCorruptedDocumentErrorWithUserInfo:", v18);

  return v34;
}

- (NSString)tsu_zipArchiveErrorDescription
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10008E280;
  BOOL v9 = sub_10008E290;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008F5F4;
  v4[3] = &unk_1001CCDC0;
  v4[4] = &v5;
  [(NSError *)self tsu_enumerateErrorUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (NSString)tsu_zipArchiveErrorEntryName
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10008E280;
  BOOL v9 = sub_10008E290;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008F7A0;
  v4[3] = &unk_1001CCDC0;
  v4[4] = &v5;
  [(NSError *)self tsu_enumerateErrorUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

+ (id)tsu_errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 recoverySuggestion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  id v14 = v13;
  if (v11) {
    [v13 setObject:v11 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  if (v12) {
    [v14 setObject:v12 forKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
  }
  id v15 = [a1 errorWithDomain:v10 code:a4 userInfo:v14];

  return v15;
}

+ (id)tsu_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  if ((unint64_t)a3 >= 3)
  {
    int v7 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CCDE8);
    }
    id v8 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166144(v7, v8);
    }
    BOOL v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSError(TSUAdditions) tsu_errorWithCode:userInfo:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSError_TSUAdditions.m"];
    +[TSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:46 isFatal:0 description:"Bad error code"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  id v11 = [a1 errorWithDomain:@"com.apple.iWork.TSUtility" code:a3 userInfo:v6];

  return v11;
}

+ (id)tsu_errorWithDomain:(id)a3 code:(int64_t)a4 alertTitle:(id)a5 alertMessage:(id)a6
{
  return objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:userInfo:", a3, a4, a5, a6, 0);
}

+ (id)tsu_errorWithDomain:(id)a3 code:(int64_t)a4 alertTitle:(id)a5 alertMessage:(id)a6 userInfo:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (char *)objc_msgSend(v15, "count") + 4);
  id v17 = v16;
  if (v15) {
    [v16 addEntriesFromDictionary:v15];
  }
  if (v13)
  {
    [v17 setObject:v13 forKeyedSubscript:NSLocalizedDescriptionKey];
    [v17 setObject:v13 forKeyedSubscript:@"TSULocalizedErrorAlertTitle"];
  }
  if (v14)
  {
    [v17 setObject:v14 forKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
    [v17 setObject:v14 forKeyedSubscript:@"TSULocalizedErrorAlertMessage"];
    [v17 setObject:v14 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];
  }
  id v18 = [a1 errorWithDomain:v12 code:a4 userInfo:v17];

  return v18;
}

+ (id)tsu_errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlyingError:(id)a6
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

+ (id)tsu_errorWithError:(id)a3 alertTitle:(id)a4 alertMessage:(id)a5 additionalUserInfo:(id)a6
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
    id v17 = [v13 domain];
    id v18 = [v13 code];

    CFStringRef v19 = objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:userInfo:", v17, v18, v12, v11, v16);
  }
  else
  {
    CFStringRef v19 = 0;
  }

  return v19;
}

- (id)tsu_errorPreservingAlertTitle
{
  id v3 = [(NSError *)self userInfo];
  id v4 = [v3 objectForKeyedSubscript:NSLocalizedDescriptionKey];
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [v3 objectForKeyedSubscript:@"TSULocalizedErrorAlertTitle"];
  id v6 = v5;
  if (!v5 || [v5 isEqualToString:v4])
  {

LABEL_5:
    int v7 = self;
    goto LABEL_7;
  }
  id v8 = [v3 mutableCopy];
  [v8 setObject:v6 forKeyedSubscript:NSLocalizedDescriptionKey];
  BOOL v9 = objc_opt_class();
  id v10 = [(NSError *)self domain];
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, -[NSError code](self, "code"), v8);
  int v7 = (NSError *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v7;
}

- (id)tsu_errorPreservingCancel
{
  id v2 = self;
  if ([(NSError *)v2 tsu_isCancelError])
  {
    if ((id)[(NSError *)v2 code] == (id)3072)
    {
      id v3 = [(NSError *)v2 domain];
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

- (id)tsu_localizedAlertTitle
{
  id v2 = [(NSError *)self userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"TSULocalizedErrorAlertTitle"];
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

- (id)tsu_localizedAlertMessage
{
  id v2 = [(NSError *)self userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"TSULocalizedErrorAlertMessage"];
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

- (BOOL)tsu_isOutOfSpaceError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001CCE08];
}

- (BOOL)tsu_isCancelError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001CCE28];
}

- (BOOL)tsu_isFileExistsError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001CCE48];
}

- (BOOL)tsu_isNoSuchFileError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001CCE68];
}

- (BOOL)tsu_isNoPermissionError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001CCE88];
}

- (BOOL)tsu_isFeatureUnsupportedError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001CCEA8];
}

- (void)tsu_enumerateErrorUsingBlock:(id)a3
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

        BOOL v9 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];
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

- (BOOL)tsu_isErrorPassingTest:(id)a3
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
    v8[2] = sub_100090784;
    v8[3] = &unk_1001CCED0;
    id v9 = v4;
    NSErrorUserInfoKey v10 = &v11;
    [(NSError *)self tsu_enumerateErrorUsingBlock:v8];

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

+ (id)tsu_errorWithWarning:(id)a3
{
  NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
  id v3 = [a3 message];
  uint64_t v8 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v5 = +[NSError errorWithDomain:@"com.apple.iWork.TSUWarningErrorDomain" code:0 userInfo:v4];

  return v5;
}

+ (id)tsu_userInfoWithErrorType:(int64_t)a3 userInfo:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (char *)objc_msgSend(v5, "count") + 1);
  NSErrorUserInfoKey v7 = v6;
  if (v5) {
    [v6 addEntriesFromDictionary:v5];
  }
  uint64_t v8 = +[NSNumber numberWithInteger:a3];
  [v7 setObject:v8 forKeyedSubscript:@"TSUIOErrorType"];

  return v7;
}

+ (id)tsu_fileReadUnknownErrorWithUserInfo:(id)a3
{
  id v3 = objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 1, a3);
  id v4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:256 userInfo:v3];

  return v4;
}

+ (id)tsu_fileReadCorruptedFileErrorWithUserInfo:(id)a3
{
  id v3 = objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 1, a3);
  id v4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:259 userInfo:v3];

  return v4;
}

+ (id)tsu_fileReadPOSIXErrorWithNumber:(int)a3 userInfo:(id)a4
{
  uint64_t v4 = a3;
  id v5 = objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 1, a4);
  id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v4 userInfo:v5];

  return v6;
}

+ (id)tsu_fileWriteUnknownErrorWithUserInfo:(id)a3
{
  id v3 = objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 2, a3);
  uint64_t v4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:512 userInfo:v3];

  return v4;
}

+ (id)tsu_fileWritePOSIXErrorWithNumber:(int)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)NSError);
  uint64_t v8 = objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 2, v6);

  id v9 = [v7 initWithDomain:NSPOSIXErrorDomain code:a3 userInfo:v8];
  return v9;
}

- (BOOL)tsu_isReadError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001CE278];
}

- (BOOL)tsu_isCorruptedError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001CE298];
}

- (BOOL)tsu_isWriteError
{
  return [(NSError *)self tsu_isErrorPassingTest:&stru_1001CE2B8];
}

@end