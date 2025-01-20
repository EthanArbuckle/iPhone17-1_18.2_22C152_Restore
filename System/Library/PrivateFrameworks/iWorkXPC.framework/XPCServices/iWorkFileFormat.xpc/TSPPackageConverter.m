@interface TSPPackageConverter
+ (BOOL)convertDocumentAtURL:(id)a3 toPackageType:(int64_t)a4 removeEntriesMatchingFilter:(id)a5 error:(id *)a6;
+ (NSArray)regularRexpressionsForCachedCollaborationData;
+ (id)newPackageConverterWithURL:(id)a3 error:(id *)a4;
+ (id)newPackageConverterWithURL:(id)a3 preserveExtendedAttributes:(BOOL)a4 error:(id *)a5;
- (BOOL)checkPassword:(id)a3;
- (BOOL)enumeratePackageEntriesWithZipArchive:(id)a3 needsReadChannel:(BOOL)a4 accessor:(id)a5;
- (BOOL)hasEntriesMatchingFilter:(id)a3;
- (BOOL)isCancelled;
- (BOOL)isDataPath:(id)a3;
- (BOOL)isDocumentPropertiesPath:(id)a3;
- (BOOL)isObjectArchivePath:(id)a3;
- (BOOL)isPasswordProtected;
- (BOOL)isValid;
- (BOOL)path:(id)a3 matchesFilter:(id)a4;
- (BOOL)writeToURL:(id)a3 packageType:(int64_t)a4 removeEntriesMatchingFilter:(id)a5 error:(id *)a6;
- (NSURL)URL;
- (TSPPackage)package;
- (TSPPackageConverter)init;
- (TSPPackageConverter)initWithURL:(id)a3 package:(id)a4 fileCoordinatorDelegate:(id)a5 preserveExtendedAttributes:(BOOL)a6 error:(id *)a7;
- (id)newWriteChannelAtPath:(id)a3 lastModificationDate:(id)a4 size:(unint64_t)a5 CRC:(unsigned int)a6 packageWriter:(id)a7 error:(id *)a8;
- (int64_t)packageType;
- (unint64_t)progressTotalUnitCountWithZipArchive:(id)a3;
@end

@implementation TSPPackageConverter

+ (BOOL)convertDocumentAtURL:(id)a3 toPackageType:(int64_t)a4 removeEntriesMatchingFilter:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = +[TSPPackageConverter newPackageConverterWithURL:v9 preserveExtendedAttributes:0 error:a6];
  v12 = v11;
  if (v11)
  {
    if ([v11 packageType] == (id)a4)
    {
      unsigned __int8 v13 = 1;
    }
    else
    {
      id v14 = [[TSUSafeSaveAssistant alloc] initForSavingToURL:v9 error:a6];
      v15 = v14;
      if (v14)
      {
        v16 = [v14 writeURL];
        id v17 = [v12 writeToURL:v16 packageType:a4 removeEntriesMatchingFilter:v10 error:a6];

        unsigned __int8 v13 = [v15 endSaveWithSuccess:v17 addingAttributes:0 error:a6];
      }
      else
      {
        unsigned __int8 v13 = 0;
      }
      [v9 removeAllCachedResourceValues];
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

+ (id)newPackageConverterWithURL:(id)a3 error:(id *)a4
{
  return [a1 newPackageConverterWithURL:a3 preserveExtendedAttributes:1 error:a4];
}

+ (id)newPackageConverterWithURL:(id)a3 preserveExtendedAttributes:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = [[TSPPackageConverterFileCoordinatorDelegate alloc] initWithURL:v7];
  id v9 = +[TSPPackage newLazyPackageWithURL:v7 packageIdentifier:1 decryptionKey:0 fileCoordinatorDelegate:v8];
  id v10 = v9;
  if (v9)
  {
    if ((unint64_t)[v9 packageType] >= 3) {
      id v11 = 0;
    }
    else {
      id v11 = (objc_class *)objc_opt_class();
    }
    id v12 = [[v11 alloc] initWithURL:v7 package:v10 fileCoordinatorDelegate:v8 preserveExtendedAttributes:v6 error:a5];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (TSPPackageConverter)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C63A0);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    id v11 = "-[TSPPackageConverter init]";
    __int16 v12 = 2082;
    unsigned __int8 v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageConverter.mm";
    __int16 v14 = 1024;
    int v15 = 122;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageConverter init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageConverter.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:122 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  BOOL v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPPackageConverter init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPPackageConverter)initWithURL:(id)a3 package:(id)a4 fileCoordinatorDelegate:(id)a5 preserveExtendedAttributes:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([v12 isFileURL])
  {
    v24.receiver = self;
    v24.super_class = (Class)TSPPackageConverter;
    int v15 = [(TSPPackageConverter *)&v24 init];
    if (!v15) {
      goto LABEL_5;
    }
    v16 = (NSURL *)[v12 copy];
    URL = v15->_URL;
    v15->_URL = v16;

    objc_storeStrong((id *)&v15->_package, a4);
    objc_storeStrong((id *)&v15->_fileCoordinatorDelegate, a5);
    if (!v8) {
      goto LABEL_5;
    }
    v18 = [TSUExtendedAttributeCollection alloc];
    v19 = [v12 path];
    v20 = [(TSUExtendedAttributeCollection *)v18 initWithPath:v19 options:0 error:a7];
    extendedAttributeCollection = v15->_extendedAttributeCollection;
    v15->_extendedAttributeCollection = v20;

    if (!v15->_extendedAttributeCollection)
    {
      v22 = 0;
      self = v15;
    }
    else
    {
LABEL_5:
      self = v15;
      v22 = self;
    }
  }
  else if (a7)
  {
    +[NSError errorWithDomain:NSURLErrorDomain code:-1000 userInfo:0];
    v22 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (NSArray)regularRexpressionsForCachedCollaborationData
{
  if (qword_1001EB328 != -1) {
    dispatch_once(&qword_1001EB328, &stru_1001C63C0);
  }
  unsigned int v2 = (void *)qword_1001EB320;
  return (NSArray *)v2;
}

- (int64_t)packageType
{
  return [(TSPPackage *)self->_package packageType];
}

- (BOOL)isValid
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C6420);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 67110146;
    unsigned int v15 = v2;
    __int16 v16 = 2082;
    id v17 = "-[TSPPackageConverter isValid]";
    __int16 v18 = 2082;
    v19 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageConverter.mm";
    __int16 v20 = 1024;
    int v21 = 173;
    __int16 v22 = 2114;
    v23 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  BOOL v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageConverter isValid]");
  id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageConverter.mm"];
  BOOL v8 = (objc_class *)objc_opt_class();
  unsigned int v9 = NSStringFromClass(v8);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 173, 0, "Abstract method not overridden by %{public}@", v9);

  +[TSUAssertionHandler logBacktraceThrottled];
  __int16 v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v11, "-[TSPPackageConverter isValid]");
  id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (BOOL)isPasswordProtected
{
  return [(TSPPackage *)self->_package isPasswordProtected];
}

- (BOOL)checkPassword:(id)a3
{
  return [(TSPPackage *)self->_package checkPassword:a3];
}

- (BOOL)path:(id)a3 matchesFilter:(id)a4
{
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length", (void)v11)) != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (BOOL)hasEntriesMatchingFilter:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(TSPPackage *)self->_package zipArchive];
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001CCAC;
    v8[3] = &unk_1001C6448;
    v8[4] = self;
    id v9 = v4;
    __int16 v10 = &v11;
    [(TSPPackageConverter *)self enumeratePackageEntriesWithZipArchive:v5 needsReadChannel:0 accessor:v8];
  }
  char v6 = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)writeToURL:(id)a3 packageType:(int64_t)a4 removeEntriesMatchingFilter:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (([v10 isFileURL] & 1) == 0)
  {
    if (a6)
    {
      +[NSError errorWithDomain:NSURLErrorDomain code:-1000 userInfo:0];
      BOOL v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v15 = 0;
    }
    goto LABEL_37;
  }
  uint64_t v48 = 0;
  v49 = (id *)&v48;
  uint64_t v50 = 0x3032000000;
  v51 = sub_10001D2B8;
  v52 = sub_10001D2C8;
  id v53 = 0;
  long long v12 = [(TSPPackage *)self->_package zipArchive];
  if (!v12)
  {
    if (([(id)objc_opt_class() hasZipArchive] & 1) == 0) {
      goto LABEL_12;
    }
LABEL_24:
    id v18 = [(TSPPackage *)self->_package lastReloadError];
    id v23 = v18;
    if (!v18)
    {
      id v23 = +[NSError tsp_unknownReadErrorWithUserInfo:0];
    }
    objc_storeStrong(v49 + 5, v23);
    unsigned __int8 v27 = 0;
    BOOL v15 = 0;
    if (v18) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  uint64_t v13 = +[TSPPackage objectArchiveEntryPathForPackageLocator:@"Metadata"];
  char v14 = [v12 entryForName:v13];

  if (!v14)
  {
    if ((id)[(TSPPackageConverter *)self packageType] == (id)2)
    {
      __int16 v16 = [(TSPPackage *)self->_package componentZipArchive];
      id v17 = [v16 entryForName:v13];

      if (v17) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    goto LABEL_24;
  }

LABEL_12:
  id v37 = v11;
  id v18 = +[NSProgress currentProgress];

  if (v18)
  {
    id v18 = +[NSProgress progressWithTotalUnitCount:[(TSPPackageConverter *)self progressTotalUnitCountWithZipArchive:v12]];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10001D2D0;
    v47[3] = &unk_1001C56E8;
    v47[4] = self;
    [v18 setCancellationHandler:v47];
  }
  v19 = [(TSPPackage *)self->_package documentProperties];
  package = self->_package;
  fileCoordinatorDelegate = self->_fileCoordinatorDelegate;
  __int16 v22 = v49;
  id v46 = v49[5];
  LOBYTE(v36) = 0;
  id v23 = +[TSPPackageWriter newPackageWriterWithPackageType:URL:documentTargetURL:relativeURLForExternalData:packageIdentifier:documentProperties:documentMetadata:fileFormatVersion:updateType:cloneMode:documentSaveValidationPolicy:encryptionKey:originalDocumentPackage:originalSupportPackage:fileCoordinatorDelegate:progress:error:](TSPPackageWriter, "newPackageWriterWithPackageType:URL:documentTargetURL:relativeURLForExternalData:packageIdentifier:documentProperties:documentMetadata:fileFormatVersion:updateType:cloneMode:documentSaveValidationPolicy:encryptionKey:originalDocumentPackage:originalSupportPackage:fileCoordinatorDelegate:progress:error:", a4, v10, v10, v10, 1, v19, 0, 0, 2, v36, 0, 0, package, 0, fileCoordinatorDelegate,
          0,
          &v46);
  objc_storeStrong(v22 + 5, v46);

  if (v23)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10001D2E0;
    v41[3] = &unk_1001C6470;
    v41[4] = self;
    id v42 = v11;
    id v23 = v23;
    id v43 = v23;
    v45 = &v48;
    id v18 = v18;
    id v44 = v18;
    if ([(TSPPackageConverter *)self enumeratePackageEntriesWithZipArchive:v12 needsReadChannel:1 accessor:v41])
    {
      objc_super v24 = [(TSPPackage *)self->_package documentProperties];
      v25 = v49;
      id obj = v49[5];
      unsigned int v26 = [v24 writeToPackageWriter:v23 error:&obj];
      objc_storeStrong(v25 + 5, obj);
    }
    else
    {
      unsigned int v26 = 0;
    }
    v28 = v49;
    id v39 = v49[5];
    unsigned int v29 = [v23 closeAndReturnError:&v39];
    objc_storeStrong(v28 + 5, v39);
    if ((v29 & v26) == 1)
    {
      extendedAttributeCollection = self->_extendedAttributeCollection;
      if (extendedAttributeCollection)
      {
        v31 = [v10 path];
        v32 = v49;
        id v38 = v49[5];
        unsigned __int8 v27 = [(TSUExtendedAttributeCollection *)extendedAttributeCollection setAttributeCollectionToPath:v31 intent:2 options:0 error:&v38];
        objc_storeStrong(v32 + 5, v38);
      }
      else
      {
        unsigned __int8 v27 = 1;
      }
    }
    else
    {
      unsigned __int8 v27 = 0;
    }
    id v11 = v37;
  }
  else
  {
    unsigned __int8 v27 = 0;
  }
LABEL_30:

  BOOL v15 = v27;
LABEL_31:

  if (a6 && !v15)
  {
    id v33 = v49[5];
    if (v33)
    {
      *a6 = v33;
    }
    else
    {
      id v34 = +[NSError tsp_unknownWriteErrorWithUserInfo:0];
      *a6 = v34;
    }
  }

  _Block_object_dispose(&v48, 8);
LABEL_37:

  return v15;
}

- (BOOL)isDocumentPropertiesPath:(id)a3
{
  id v3 = a3;
  id v4 = +[TSPDocumentProperties documentPropertiesRelativePath];
  if ([v3 isEqualToString:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    char v6 = +[TSPDocumentProperties shareIdentifierRelativePath];
    unsigned __int8 v5 = [v3 isEqualToString:v6];
  }
  return v5;
}

- (BOOL)isObjectArchivePath:(id)a3
{
  id v3 = a3;
  if (qword_1001EB338 != -1) {
    dispatch_once(&qword_1001EB338, &stru_1001C6490);
  }
  unsigned __int8 v4 = [v3 hasPrefix:qword_1001EB330];

  return v4;
}

- (BOOL)isDataPath:(id)a3
{
  id v3 = a3;
  if (qword_1001EB348 != -1) {
    dispatch_once(&qword_1001EB348, &stru_1001C64B0);
  }
  unsigned __int8 v4 = [v3 hasPrefix:qword_1001EB340];

  return v4;
}

- (unint64_t)progressTotalUnitCountWithZipArchive:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D768;
  v5[3] = &unk_1001C64D8;
  v5[4] = &v6;
  [a3 enumerateEntriesUsingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)enumeratePackageEntriesWithZipArchive:(id)a3 needsReadChannel:(BOOL)a4 accessor:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001D984;
  v19[3] = &unk_1001C6500;
  v19[4] = self;
  id v10 = [v8 sortedEntriesUsingComparator:v19];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001DB74;
  v14[3] = &unk_1001C6528;
  v14[4] = self;
  id v17 = &v20;
  BOOL v18 = a4;
  id v11 = v9;
  id v16 = v11;
  id v12 = v8;
  id v15 = v12;
  [v10 enumerateObjectsUsingBlock:v14];
  LOBYTE(v8) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

- (id)newWriteChannelAtPath:(id)a3 lastModificationDate:(id)a4 size:(unint64_t)a5 CRC:(unsigned int)a6 packageWriter:(id)a7 error:(id *)a8
{
  uint64_t v9 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (!v12)
  {
    int v15 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6548);
    }
    id v16 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001619E0(v15, v16);
    }
    id v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageConverter newWriteChannelAtPath:lastModificationDate:size:CRC:packageWriter:error:]");
    BOOL v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageConverter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 433, 0, "invalid nil value for '%{public}s'", "path");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v19 = [v14 zipArchiveWriter];
  [v19 beginEntryWithName:v12 force32BitSize:0 lastModificationDate:v13 size:a5 CRC:v9 forceCalculatingSizeAndCRCForPreservingLastModificationDate:0];
  uint64_t v20 = [[TSPZipFileWriteChannel alloc] initWithArchiveWriter:v19];

  return v20;
}

- (TSPPackage)package
{
  return self->_package;
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_extendedAttributeCollection, 0);
  objc_storeStrong((id *)&self->_fileCoordinatorDelegate, 0);
}

@end