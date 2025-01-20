@interface TSPPackage
+ (BOOL)hasZipArchive;
+ (BOOL)isValidPackageAtURL:(id)a3;
+ (BOOL)isZeroLengthFileOrEmptyDirectory:(id)a3 isDirectory:(BOOL *)a4;
+ (id)dataEntryPathForFilename:(id)a3;
+ (id)newLazyPackageWithURL:(id)a3 packageIdentifier:(unsigned __int8)a4 decryptionKey:(id)a5 fileCoordinatorDelegate:(id)a6;
+ (id)newPackageWithURL:(id)a3 options:(unint64_t)a4 packageIdentifier:(unsigned __int8)a5 decryptionKey:(id)a6 fileCoordinatorDelegate:(id)a7 error:(id *)a8;
+ (id)objectArchiveEntryPathForPackageLocator:(id)a3;
+ (id)zipArchiveURLFromPackageURL:(id)a3;
+ (unint64_t)zipArchiveOptions;
- (BOOL)checkPassword:(id)a3;
- (BOOL)didReloadZipArchive:(id)a3 packageURL:(id)a4 error:(id *)a5;
- (BOOL)hasDataAtRelativePath:(id)a3;
- (BOOL)isClosed;
- (BOOL)isPasswordProtected;
- (BOOL)reloadZipArchiveIfNeededWithURLImpl:(id)a3 isLazyLoading:(BOOL)a4 forceReload:(BOOL)a5 error:(id *)a6;
- (NSData)passwordVerifier;
- (NSError)lastReloadError;
- (NSString)passwordHint;
- (SFUCryptoKey)decryptionKey;
- (TSPDocumentProperties)documentProperties;
- (TSPFileCoordinatorDelegate)fileCoordinatorDelegate;
- (TSPPackage)init;
- (TSPPackage)initWithPackageIdentifier:(unsigned __int8)a3 documentProperties:(id)a4 fileFormatVersion:(unint64_t)a5 decryptionKey:(id)a6 fileCoordinatorDelegate:(id)a7 isLazyLoading:(BOOL)a8;
- (TSPPackage)initWithURL:(id)a3 zipArchiveOrNil:(id)a4 zipArchiveOptions:(unint64_t)a5 packageIdentifier:(unsigned __int8)a6 documentProperties:(id)a7 decryptionKey:(id)a8 fileCoordinatorDelegate:(id)a9 error:(id *)a10;
- (TSUZipFileArchive)zipArchive;
- (id)componentLocators;
- (id)dataAtRelativePath:(id)a3 allowDecryption:(BOOL)a4 error:(id *)a5;
- (id)keyFromPassword:(id)a3;
- (id)keyFromPassword:(id)a3 passwordVerifier:(id)a4;
- (id)newCompressionReadChannelWithReadChannel:(id)a3 compressionAlgorithm:(int64_t)a4;
- (id)newDocumentPropertiesWithURL:(id)a3 zipProvider:(id)a4 error:(id *)a5;
- (id)newRawDataReadChannelAtRelativePath:(id)a3;
- (id)newRawReadChannelForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4 error:(id *)a5;
- (id)newReadChannelForComponentLocator:(id)a3 compressionAlgorithm:(int64_t)a4 isStoredOutsideObjectArchive:(BOOL)a5 error:(id *)a6;
- (id)newZipArchiveFromPackageURL:(id)a3 isLazyLoading:(BOOL)a4 error:(id *)a5;
- (id)packageEntryInfoAtRelativePath:(id)a3 error:(id *)a4;
- (id)packageEntryInfoForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4;
- (int64_t)packageType;
- (unint64_t)documentReadVersion;
- (unint64_t)fileFormatVersion;
- (unsigned)packageIdentifier;
- (void)copyComponent:(id)a3 toPackageURL:(id)a4 packageLocator:(id)a5 zipFileWriter:(id)a6 encryptionKey:(id)a7 canLink:(BOOL)a8 completion:(id)a9;
- (void)didCloseDocument;
- (void)didReadDocumentReadVersion:(unint64_t)a3;
- (void)didReadFileFormatVersion:(unint64_t)a3;
- (void)didReferenceData:(id)a3;
- (void)didRetrieveDecryptionKey:(id)a3;
- (void)enumerateDataUsingBlock:(id)a3;
- (void)peformSynchronousAccessToZipArchive:(id)a3;
- (void)prepareForDocumentReplacementWithSuccess:(BOOL)a3 forSafeSave:(BOOL)a4 originalURL:(id)a5;
- (void)setZipArchive:(id)a3 fileCoordinatorDelegate:(id)a4;
@end

@implementation TSPPackage

+ (BOOL)isValidPackageAtURL:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C6DC0);
  }
  v5 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 67110146;
    unsigned int v17 = v4;
    __int16 v18 = 2082;
    v19 = "+[TSPPackage isValidPackageAtURL:]";
    __int16 v20 = 2082;
    v21 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm";
    __int16 v22 = 1024;
    int v23 = 56;
    __int16 v24 = 2114;
    v25 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSPPackage isValidPackageAtURL:]");
  v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 56, 0, "Abstract method not overridden by %{public}@", v11);

  +[TSUAssertionHandler logBacktraceThrottled];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v13, "+[TSPPackage isValidPackageAtURL:]");
  id v15 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v14 userInfo:0];

  objc_exception_throw(v15);
}

+ (id)objectArchiveEntryPathForPackageLocator:(id)a3
{
  id v3 = [@"Index" stringByAppendingPathComponent:a3];
  unsigned int v4 = [v3 stringByAppendingPathExtension:@"iwa"];

  return v4;
}

+ (id)dataEntryPathForFilename:(id)a3
{
  id v3 = [@"Data" stringByAppendingPathComponent:a3];
  return v3;
}

+ (id)newPackageWithURL:(id)a3 options:(unint64_t)a4 packageIdentifier:(unsigned __int8)a5 decryptionKey:(id)a6 fileCoordinatorDelegate:(id)a7 error:(id *)a8
{
  uint64_t v11 = a5;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  if (!+[TSPDirectoryPackage isValidPackageAtURL:v13])
  {
    char v41 = 0;
    id v34 = v14;
    __int16 v20 = +[NSFileManager defaultManager];
    v21 = [v13 path];
    unsigned int v22 = [v20 fileExistsAtPath:v21 isDirectory:&v41];

    id v40 = 0;
    v16 = +[TSUZipFileArchive zipArchiveFromURL:v13 options:a4 | 5 error:&v40];
    id v17 = v40;
    if (v16)
    {
      if (+[TSPFilePackage isValidPackageAtZipArchive:v16])
      {
        id v39 = v17;
        int v23 = [[TSPDocumentProperties alloc] initWithFilePackageURL:v13 zipArchive:v16 allowMissingPropertyList:1 error:&v39];
        id v24 = v39;

        if (v23)
        {
          id v38 = v24;
          __int16 v18 = [(TSPPackage *)[TSPFilePackage alloc] initWithURL:v13 zipArchiveOrNil:v16 zipArchiveOptions:a4 packageIdentifier:v11 documentProperties:v23 decryptionKey:v34 fileCoordinatorDelegate:v15 error:&v38];
          v25 = v38;
LABEL_11:
          id v26 = v25;

          id v24 = v26;
LABEL_21:

          id v17 = v24;
          goto LABEL_22;
        }
        goto LABEL_20;
      }
      id v14 = v34;
      if ([(TSPDocumentProperties *)v16 hasNonEmptyEntries]) {
        goto LABEL_13;
      }
      int v23 = +[NSError tsp_readCorruptZipOfPackageErrorWithUserInfo:0];

      uint64_t v27 = +[NSError tsp_errorWithError:v23 hints:&off_1001D6F18];
    }
    else
    {
      if (+[TSPExpandedDirectoryPackage isValidPackageAtURL:v13])
      {
        id v37 = v17;
        int v23 = [[TSPDocumentProperties alloc] initWithDocumentURL:v13 allowMissingPropertyList:1 error:&v37];
        id v24 = v37;

        if (v23)
        {
          id v36 = v24;
          __int16 v18 = [(TSPPackage *)[TSPExpandedDirectoryPackage alloc] initWithURL:v13 zipArchiveOrNil:0 zipArchiveOptions:a4 packageIdentifier:v11 documentProperties:v23 decryptionKey:v34 fileCoordinatorDelegate:v15 error:&v36];
          v25 = v36;
          goto LABEL_11;
        }
LABEL_20:
        __int16 v18 = 0;
        goto LABEL_21;
      }
      __int16 v18 = 0;
      if ((objc_msgSend(v17, "tsu_isReadError") & v22) != 1 || v41) {
        goto LABEL_22;
      }
      if (+[TSUZipFileArchive isZipArchiveAtURL:v13 error:0])
      {
        __int16 v18 = 0;
LABEL_22:
        id v14 = v34;
        goto LABEL_23;
      }
      id v14 = v34;
      if (!+[TSUZipFileArchive isZipSignatureAllZerosAtURL:v13])goto LABEL_13; {
      v33 = [v17 userInfo];
      }
      int v23 = +[NSError tsp_readCorruptZipOfPackageErrorWithUserInfo:v33];

      uint64_t v27 = +[NSError tsp_errorWithError:v23 hints:&off_1001D6F30];
    }
    id v24 = (id)v27;
    goto LABEL_20;
  }
  id v43 = 0;
  v16 = [[TSPDocumentProperties alloc] initWithDocumentURL:v13 allowMissingPropertyList:1 error:&v43];
  id v17 = v43;
  if (!v16)
  {
LABEL_13:
    __int16 v18 = 0;
    goto LABEL_23;
  }
  id v42 = v17;
  __int16 v18 = [(TSPPackage *)[TSPDirectoryPackage alloc] initWithURL:v13 zipArchiveOrNil:0 zipArchiveOptions:a4 packageIdentifier:v11 documentProperties:v16 decryptionKey:v14 fileCoordinatorDelegate:v15 error:&v42];
  id v19 = v42;

  id v17 = v19;
LABEL_23:

  if (a8 && !v18)
  {
    char v41 = 0;
    if ((objc_msgSend(v17, "tsp_isCorruptZipOfPackageError") & 1) != 0
      || !+[TSPPackage isZeroLengthFileOrEmptyDirectory:v13 isDirectory:&v41])
    {
      if (v17) {
        goto LABEL_35;
      }
      id v35 = 0;
      unsigned int v31 = [v13 checkResourceIsReachableAndReturnError:&v35];
      id v17 = v35;
      if (!v31) {
        goto LABEL_35;
      }
      uint64_t v30 = +[NSError tsp_unknownReadErrorWithUserInfo:0];
      v28 = v17;
    }
    else
    {
      v28 = +[NSError tsp_readCorruptZipOfPackageErrorWithUserInfo:0];

      if (v41) {
        v29 = &off_1001D6F48;
      }
      else {
        v29 = &off_1001D6F60;
      }
      uint64_t v30 = +[NSError tsp_errorWithError:v28 hints:v29];
    }

    id v17 = (id)v30;
LABEL_35:
    id v17 = v17;
    *a8 = v17;
  }

  return v18;
}

+ (id)newLazyPackageWithURL:(id)a3 packageIdentifier:(unsigned __int8)a4 decryptionKey:(id)a5 fileCoordinatorDelegate:(id)a6
{
  uint64_t v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (!+[TSPDirectoryPackage isValidPackageAtURL:v9]) {
    +[TSPExpandedDirectoryPackage isValidPackageAtURL:v9];
  }
  id v12 = [objc_alloc((Class)objc_opt_class()) initWithPackageIdentifier:v8 documentProperties:0 fileFormatVersion:0 decryptionKey:v10 fileCoordinatorDelegate:v11 isLazyLoading:1];

  return v12;
}

- (TSPPackage)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C6DE0);
  }
  id v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    id v11 = "-[TSPPackage init]";
    __int16 v12 = 2082;
    id v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm";
    __int16 v14 = 1024;
    int v15 = 168;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  unsigned int v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:168 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPPackage init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPPackage)initWithURL:(id)a3 zipArchiveOrNil:(id)a4 zipArchiveOptions:(unint64_t)a5 packageIdentifier:(unsigned __int8)a6 documentProperties:(id)a7 decryptionKey:(id)a8 fileCoordinatorDelegate:(id)a9 error:(id *)a10
{
  uint64_t v12 = a6;
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v21 = [(TSPPackage *)self initWithPackageIdentifier:v12 documentProperties:v18 fileFormatVersion:0 decryptionKey:v19 fileCoordinatorDelegate:v20 isLazyLoading:0];
  unsigned int v22 = v21;
  if (v21)
  {
    p_zipArchive = &v21->_zipArchive;
    objc_storeStrong((id *)&v21->_zipArchive, a4);
    v22->_additionalZipArchiveOptions = a5;
    if ([(id)objc_opt_class() hasZipArchive])
    {
      if ((id v24 = *p_zipArchive) == 0
        && (v25 = [(TSPPackage *)v22 newZipArchiveFromPackageURL:v16 isLazyLoading:0 error:a10], v26 = *p_zipArchive, *p_zipArchive = v25, v26, (id v24 = *p_zipArchive) == 0)|| ![(TSPPackage *)v22 didReloadZipArchive:v24 packageURL:v16 error:a10])
      {

        unsigned int v22 = 0;
      }
    }
  }

  return v22;
}

- (TSPPackage)initWithPackageIdentifier:(unsigned __int8)a3 documentProperties:(id)a4 fileFormatVersion:(unint64_t)a5 decryptionKey:(id)a6 fileCoordinatorDelegate:(id)a7 isLazyLoading:(BOOL)a8
{
  BOOL v8 = a8;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)TSPPackage;
  id v18 = [(TSPPackage *)&v26 init];
  if (v18)
  {
    id v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("TSPPackage.Access", v19);
    accessQueue = v18->_accessQueue;
    v18->_accessQueue = (OS_dispatch_queue *)v20;

    v18->_packageIdentifier = a3;
    objc_storeStrong((id *)&v18->_documentProperties, a4);
    v18->_fileFormatVersion = a5;
    objc_storeStrong((id *)&v18->_decryptionKey, a6);
    objc_storeWeak((id *)&v18->_fileCoordinatorDelegate, v17);
    unsigned int v22 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:512 capacity:0];
    packageDatas = v18->_packageDatas;
    v18->_packageDatas = v22;

    if (v8) {
      char v24 = 2;
    }
    else {
      char v24 = 0;
    }
    *(unsigned char *)&v18->_flags = v24 | v8 | *(unsigned char *)&v18->_flags & 0xFC;
  }

  return v18;
}

- (int64_t)packageType
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C6E00);
  }
  id v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    unsigned int v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 67110146;
    unsigned int v15 = v2;
    __int16 v16 = 2082;
    id v17 = "-[TSPPackage packageType]";
    __int16 v18 = 2082;
    id v19 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm";
    __int16 v20 = 1024;
    int v21 = 211;
    __int16 v22 = 2114;
    int v23 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage packageType]");
  id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
  BOOL v8 = (objc_class *)objc_opt_class();
  unsigned int v9 = NSStringFromClass(v8);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 211, 0, "Abstract method not overridden by %{public}@", v9);

  +[TSUAssertionHandler logBacktraceThrottled];
  __int16 v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v11, "-[TSPPackage packageType]");
  id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (TSPFileCoordinatorDelegate)fileCoordinatorDelegate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unsigned int v9 = sub_100029C54;
  __int16 v10 = sub_100029C64;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100029C6C;
  v5[3] = &unk_1001C5430;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (TSPFileCoordinatorDelegate *)v3;
}

- (TSPDocumentProperties)documentProperties
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unsigned int v9 = sub_100029C54;
  __int16 v10 = sub_100029C64;
  id v11 = 0;
  if (*(unsigned char *)&self->_flags)
  {
    accessQueue = self->_accessQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100029DC4;
    v5[3] = &unk_1001C6E78;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(accessQueue, v5);
  }
  else
  {
    objc_storeStrong(&v11, self->_documentProperties);
  }
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (TSPDocumentProperties *)v3;
}

- (void)didRetrieveDecryptionKey:(id)a3
{
  unsigned int v4 = (SFUCryptoKey *)a3;
  if (self->_decryptionKey)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6E98);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162878();
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage didRetrieveDecryptionKey:]");
    uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 264, 0, "expected nil value for '%{public}s'", "_decryptionKey");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (!v4)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6EB8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001627E4();
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage didRetrieveDecryptionKey:]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 265, 0, "invalid nil value for '%{public}s'", "decryptionKey");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  decryptionKey = self->_decryptionKey;
  self->_decryptionKey = v4;
}

- (void)didCloseDocument
{
  self->_isClosed = 1;
}

- (void)didReadFileFormatVersion:(unint64_t)a3
{
  if (self->_fileFormatVersion)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6ED8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016290C();
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage didReadFileFormatVersion:]");
    uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:275 isFatal:0 description:"File format version shouldn't have been set."];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  self->_fileFormatVersion = a3;
}

- (void)didReadDocumentReadVersion:(unint64_t)a3
{
  self->_documentReadVersion = a3;
}

+ (BOOL)hasZipArchive
{
  return 1;
}

+ (BOOL)isZeroLengthFileOrEmptyDirectory:(id)a3 isDirectory:(BOOL *)a4
{
  id v5 = a3;
  *a4 = 0;
  id v15 = 0;
  unsigned int v6 = [v5 getResourceValue:&v15 forKey:NSURLIsDirectoryKey error:0];
  id v7 = v15;
  uint64_t v8 = v7;
  if (v6)
  {
    *a4 = [v7 BOOLValue];
    if ([v8 BOOLValue])
    {
      unsigned int v9 = +[NSFileManager defaultManager];
      __int16 v10 = [v9 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:0 options:1 error:0];

      if (!v10)
      {
        LOBYTE(v6) = 0;
        goto LABEL_9;
      }
      id v11 = [v10 count];
    }
    else
    {
      id v14 = 0;
      unsigned int v6 = [v5 getResourceValue:&v14 forKey:NSURLFileSizeKey error:0];
      id v12 = v14;
      __int16 v10 = v12;
      if (!v6)
      {
LABEL_9:

        goto LABEL_10;
      }
      id v11 = [v12 longLongValue];
    }
    LOBYTE(v6) = v11 == 0;
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (id)newZipArchiveFromPackageURL:(id)a3 isLazyLoading:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  unsigned int v9 = [(id)objc_opt_class() zipArchiveURLFromPackageURL:v8];
  unint64_t v10 = (unint64_t)[(id)objc_opt_class() zipArchiveOptions] | self->_additionalZipArchiveOptions | 4;
  id v28 = 0;
  id v11 = +[TSUZipFileArchive zipArchiveFromURL:v9 options:v10 error:&v28];
  id v12 = v28;
  if (!v11)
  {
    if (!a4)
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001C6EF8);
      }
      id v14 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
      {
        char v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_super v26 = [v12 domain];
        id v27 = [v12 code];
        *(_DWORD *)buf = 138413314;
        uint64_t v30 = v9;
        __int16 v31 = 2114;
        id v32 = v25;
        __int16 v33 = 2114;
        id v34 = v26;
        __int16 v35 = 2048;
        id v36 = v27;
        __int16 v37 = 2112;
        id v38 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_ERROR, "Couldn't read zip file archive from URL %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
      }
      if (([v9 checkResourceIsReachableAndReturnError:0] & 1) == 0)
      {
        id v13 = +[NSError tsp_errorWithError:v12 hints:&off_1001D6F78];

LABEL_23:
        if (a5)
        {
          id v12 = v13;
          *a5 = v12;
        }
        else
        {
          id v12 = v13;
        }
        goto LABEL_26;
      }
      if (!objc_msgSend(v9, "tsu_fileSize"))
      {
        if (objc_msgSend(v12, "tsp_isReadError"))
        {
          int v21 = [v12 userInfo];
          uint64_t v22 = +[NSError tsp_readCorruptedDocumentErrorWithUserInfo:v21];

          id v12 = (id)v22;
        }
        id v13 = +[NSError tsp_errorWithError:v12 hints:&off_1001D6F90];

        goto LABEL_23;
      }
      if (!+[TSUZipFileArchive isZipArchiveAtURL:v9 error:0])
      {
        buf[0] = 0;
        id v15 = +[NSFileManager defaultManager];
        __int16 v16 = [v9 path];
        unsigned int v17 = [v15 fileExistsAtPath:v16 isDirectory:buf];

        if (buf[0]) {
          unsigned int v18 = 0;
        }
        else {
          unsigned int v18 = v17;
        }
        if (v18 == 1
          && +[TSUZipFileArchive isZipSignatureAllZerosAtURL:v9])
        {
          id v19 = [v12 userInfo];
          __int16 v20 = +[NSError tsp_readCorruptedDocumentErrorWithUserInfo:v19];

          id v13 = +[NSError tsp_errorWithError:v20 hints:&off_1001D6FA8];
        }
        else
        {
          id v13 = +[NSError tsp_errorWithError:v12 hints:&off_1001D6FC0];
          __int16 v20 = v12;
        }

        goto LABEL_23;
      }
    }
    id v13 = v12;
    goto LABEL_23;
  }
LABEL_26:

  return v11;
}

- (TSUZipFileArchive)zipArchive
{
  uint64_t v5 = 0;
  unsigned int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100029C54;
  unsigned int v9 = sub_100029C64;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002AB70;
  v4[3] = &unk_1001C6F20;
  v4[4] = &v5;
  [(TSPPackage *)self peformSynchronousAccessToZipArchive:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (TSUZipFileArchive *)v2;
}

- (void)peformSynchronousAccessToZipArchive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002AC28;
    v7[3] = &unk_1001C6F48;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(accessQueue, v7);
  }
}

- (BOOL)reloadZipArchiveIfNeededWithURLImpl:(id)a3 isLazyLoading:(BOOL)a4 forceReload:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if ([(TSUZipFileArchive *)self->_zipArchive isValid]) {
    BOOL v11 = !v7;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11 || ([(id)objc_opt_class() hasZipArchive] & 1) == 0)
  {
    unsigned __int8 v14 = 1;
  }
  else
  {
    uint64_t v36 = 0;
    __int16 v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    uint64_t v30 = 0;
    __int16 v31 = &v30;
    uint64_t v32 = 0x3032000000;
    __int16 v33 = sub_100029C54;
    id v34 = sub_100029C64;
    id v35 = 0;
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = sub_100029C54;
    id v28 = sub_100029C64;
    id v29 = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002AF60;
    v22[3] = &unk_1001C7018;
    BOOL v23 = a4;
    v22[4] = self;
    v22[5] = &v30;
    v22[6] = &v36;
    v22[7] = &v24;
    id v12 = objc_retainBlock(v22);
    id v13 = v12;
    if (v10)
    {
      ((void (*)(void *, id))v12[2])(v12, v10);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_fileCoordinatorDelegate);
      [WeakRetained performReadUsingAccessor:v13];
    }
    __int16 v16 = v37;
    if (*((unsigned char *)v37 + 24))
    {
      zipArchive = self->_zipArchive;
      uint64_t v18 = v25[5];
      id v19 = (id *)(v31 + 5);
      id obj = (id)v31[5];
      unsigned __int8 v14 = [(TSPPackage *)self didReloadZipArchive:zipArchive packageURL:v18 error:&obj];
      objc_storeStrong(v19, obj);
      __int16 v16 = v37;
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
    *((unsigned char *)v16 + 24) = v14;
    if (a6 && (v14 & 1) == 0)
    {
      *a6 = (id) v31[5];
      unsigned __int8 v14 = *((unsigned char *)v37 + 24) != 0;
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }

  return v14;
}

- (void)setZipArchive:(id)a3 fileCoordinatorDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B800;
  block[3] = &unk_1001C7040;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

- (BOOL)didReloadZipArchive:(id)a3 packageURL:(id)a4 error:(id *)a5
{
  return 1;
}

- (NSError)lastReloadError
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100029C54;
  id v10 = sub_100029C64;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002B954;
  v5[3] = &unk_1001C5430;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (id)componentLocators
{
  id v2 = [(TSPPackage *)self componentZipArchive];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002BA70;
  v6[3] = &unk_1001C7068;
  id v3 = (id)objc_opt_new();
  id v7 = v3;
  [v2 enumerateEntriesUsingBlock:v6];
  id v4 = +[NSArray arrayWithArray:v3];

  return v4;
}

- (id)packageEntryInfoForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C7088);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162AF4();
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage packageEntryInfoForComponentLocator:isStoredOutsideObjectArchive:]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 504, 0, "Invalid parameter not satisfying: %{public}s", "locator");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (v4)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C70A8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162A6C();
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage packageEntryInfoForComponentLocator:isStoredOutsideObjectArchive:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:505 isFatal:0 description:"Components outside the object archive are not supported"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  id v11 = [(TSPPackage *)self componentZipArchive];
  id v12 = +[TSPPackage objectArchiveEntryPathForPackageLocator:v6];
  id v13 = [v11 entryForName:v12];
  if (v13)
  {
    unsigned __int8 v14 = [TSPPackageEntryInfo alloc];
    id v15 = [v13 size];
    __int16 v16 = [v13 lastModificationDate];
    unsigned int v17 = -[TSPPackageEntryInfo initWithEncodedLength:lastModificationDate:CRC:](v14, "initWithEncodedLength:lastModificationDate:CRC:", v15, v16, [v13 CRC]);
  }
  else
  {
    unsigned int v17 = 0;
  }

  return v17;
}

- (id)newCompressionReadChannelWithReadChannel:(id)a3 compressionAlgorithm:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  switch(a4)
  {
    case 0:
      id v7 = [[TSPSnappyReadChannel alloc] initWithReadChannel:v5];
      goto LABEL_10;
    case 1:
      id v7 = (TSPSnappyReadChannel *)v5;
      goto LABEL_10;
    case 2:
      id v9 = [TSUCompressionReadChannel alloc];
      uint64_t v10 = 256;
      goto LABEL_9;
    case 3:
      id v9 = [TSUCompressionReadChannel alloc];
      uint64_t v10 = 517;
      goto LABEL_9;
    case 4:
      id v9 = [TSUCompressionReadChannel alloc];
      uint64_t v10 = 774;
      goto LABEL_9;
    case 5:
      id v9 = [TSUCompressionReadChannel alloc];
      uint64_t v10 = 2049;
LABEL_9:
      id v7 = [(TSUCompressionReadChannel *)v9 initWithReadChannel:v6 compressionAlgorithm:v10 operation:1];
LABEL_10:
      uint64_t v8 = v7;
      break;
    default:
      uint64_t v8 = 0;
      break;
  }

  return v8;
}

- (id)newReadChannelForComponentLocator:(id)a3 compressionAlgorithm:(int64_t)a4 isStoredOutsideObjectArchive:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  if (!v10)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C70C8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162B88();
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage newReadChannelForComponentLocator:compressionAlgorithm:isStoredOutsideObjectArchive:error:]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 540, 0, "Invalid parameter not satisfying: %{public}s", "locator");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  id v23 = 0;
  id v13 = [(TSPPackage *)self newRawReadChannelForComponentLocator:v10 isStoredOutsideObjectArchive:v7 error:&v23];
  id v14 = v23;
  if (!v13
    || self->_decryptionKey
    && (id v15 = [[TSPCryptoReadChannel alloc] initWithReadChannel:v13 decryptionKey:self->_decryptionKey blockInfos:0], v13, (v13 = v15) == 0)|| (v16 = [(TSPPackage *)self newCompressionReadChannelWithReadChannel:v13 compressionAlgorithm:a4], v13, !v16))
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001C70E8);
    }
    unsigned int v17 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      id v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      int v21 = [v14 domain];
      id v22 = [v14 code];
      *(_DWORD *)buf = 138544130;
      id v25 = v20;
      __int16 v26 = 2114;
      id v27 = v21;
      __int16 v28 = 2048;
      id v29 = v22;
      __int16 v30 = 2112;
      id v31 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_ERROR, "Error getting raw read channel errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x2Au);
    }
    id v16 = 0;
    if (a6) {
      *a6 = v14;
    }
  }

  return v16;
}

- (id)newRawReadChannelForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (!v8)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C7108);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162D74();
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage newRawReadChannelForComponentLocator:isStoredOutsideObjectArchive:error:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 568, 0, "Invalid parameter not satisfying: %{public}s", "locator");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (v6)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C7128);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162CEC();
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage newRawReadChannelForComponentLocator:isStoredOutsideObjectArchive:error:]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:569 isFatal:0 description:"Components outside the object archive are not supported"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  id v13 = [(TSPPackage *)self componentZipArchive];
  id v14 = +[TSPPackage objectArchiveEntryPathForPackageLocator:v8];
  id v15 = [v13 entryForName:v14];
  if (v15)
  {
    id v16 = [v13 streamReadChannelForEntry:v15];
    if (v16)
    {
      id v17 = 0;
      goto LABEL_27;
    }
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001C7148);
    }
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162C84();
    }
  }
  else
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001C7168);
    }
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162C1C();
    }
  }
  uint64_t v18 = +[NSError tsp_readCorruptedDocumentErrorWithUserInfo:0];
  id v17 = v18;
  if (a5)
  {
    id v17 = v18;
    id v16 = 0;
    *a5 = v17;
  }
  else
  {
    id v16 = 0;
  }
LABEL_27:

  return v16;
}

- (void)copyComponent:(id)a3 toPackageURL:(id)a4 packageLocator:(id)a5 zipFileWriter:(id)a6 encryptionKey:(id)a7 canLink:(BOOL)a8 completion:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v36 = a5;
  id v35 = a6;
  id v37 = a7;
  id v16 = (void (**)(id, void, id))a9;
  id v34 = v15;
  if (!v14)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C7188);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162F8C();
    }
    id v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage copyComponent:toPackageURL:packageLocator:zipFileWriter:encryptionKey:canLink:completion:]");
    uint64_t v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 598, 0, "Invalid parameter not satisfying: %{public}s", "component");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  id v19 = [v14 isStoredOutsideObjectArchive];
  if (v19)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C71A8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162F04();
    }
    id v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage copyComponent:toPackageURL:packageLocator:zipFileWriter:encryptionKey:canLink:completion:]");
    int v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:601 isFatal:0 description:"Components outside the object archive are not supported"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  id v22 = [v14 locator];
  if (!v22)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C71C8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162E70();
    }
    id v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage copyComponent:toPackageURL:packageLocator:zipFileWriter:encryptionKey:canLink:completion:]");
    uint64_t v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 604, 0, "invalid nil value for '%{public}s'", "packageLocator");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  id v25 = [(TSPPackage *)self componentZipArchive];
  __int16 v26 = +[TSPPackage objectArchiveEntryPathForPackageLocator:v22];
  uint64_t v27 = [v25 entryForName:v26];
  __int16 v28 = (void *)v27;
  if (!v25 || v27)
  {
    if (v25)
    {
      id v29 = [v25 streamReadChannelForEntry:v27];
      id v33 = 0;
      if (!v29) {
        goto LABEL_33;
      }
    }
    else
    {
      id v38 = 0;
      id v29 = [(TSPPackage *)self newRawReadChannelForComponentLocator:v22 isStoredOutsideObjectArchive:v19 error:&v38];
      id v33 = v38;
      if (!v29) {
        goto LABEL_33;
      }
    }
    if (SFUEqualCryptoKeys((unint64_t)v37, (unint64_t)self->_decryptionKey)
      || (__int16 v30 = [[TSPCryptoTranscodeReadChannel alloc] initWithReadChannel:v29 decryptionInfo:self->_decryptionKey encryptionInfo:v37], v29, v28, v28 = 0, (v29 = v30) != 0))
    {
      id v31 = +[TSPPackage objectArchiveEntryPathForPackageLocator:v36];
      uint64_t v32 = [v14 lastModificationDate];
      objc_msgSend(v35, "writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:completion:", v31, 1, v32, objc_msgSend(v28, "size"), objc_msgSend(v28, "CRC"), v29, v16);

      goto LABEL_38;
    }
LABEL_33:
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001C71E8);
    }
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR))
    {
      sub_100162E08();
      if (!v16) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
    if (v16) {
LABEL_37:
    }
      v16[2](v16, 0, v33);
LABEL_38:

    goto LABEL_39;
  }
  if (TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &stru_1001C7208);
  }
  if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR))
  {
    sub_100162C1C();
    if (!v16) {
      goto LABEL_39;
    }
    goto LABEL_25;
  }
  if (v16) {
LABEL_25:
  }
    v16[2](v16, 0, 0);
LABEL_39:
}

- (void)didReferenceData:(id)a3
{
}

- (void)enumerateDataUsingBlock:(id)a3
{
  BOOL v4 = (void (**)(id, void, char *))a3;
  if (v4)
  {
    char v13 = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = self->_packageDatas;
    id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v9 + 1) + 8 * v8), &v13);
        if (v13) {
          break;
        }
        if (v6 == (id)++v8)
        {
          id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (id)packageEntryInfoAtRelativePath:(id)a3 error:(id *)a4
{
  id v4 = a3;
  unsigned int v5 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C7228);
  }
  id v6 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 67110146;
    unsigned int v18 = v5;
    __int16 v19 = 2082;
    id v20 = "-[TSPPackage packageEntryInfoAtRelativePath:error:]";
    __int16 v21 = 2082;
    id v22 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm";
    __int16 v23 = 1024;
    int v24 = 662;
    __int16 v25 = 2114;
    __int16 v26 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  long long v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage packageEntryInfoAtRelativePath:error:]");
  long long v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
  long long v11 = (objc_class *)objc_opt_class();
  long long v12 = NSStringFromClass(v11);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 662, 0, "Abstract method not overridden by %{public}@", v12);

  +[TSUAssertionHandler logBacktraceThrottled];
  char v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v14, "-[TSPPackage packageEntryInfoAtRelativePath:error:]");
  id v16 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (id)dataAtRelativePath:(id)a3 allowDecryption:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v7 = -[TSPPackage newRawDataReadChannelAtRelativePath:](self, "newRawDataReadChannelAtRelativePath:", a3, a4, a5);
  if (v7 && v5)
  {
    if (!self->_decryptionKey)
    {
LABEL_6:
      long long v9 = +[TSPReadChannelUtils dataFromReadChannel:v7];
      goto LABEL_8;
    }
    uint64_t v8 = [[TSPCryptoTranscodeReadChannel alloc] initWithReadChannel:v7 decryptionInfo:self->_decryptionKey encryptionInfo:0];

    uint64_t v7 = v8;
  }
  if (v7) {
    goto LABEL_6;
  }
  long long v9 = 0;
LABEL_8:
  [(TSPCryptoTranscodeReadChannel *)v7 close];

  return v9;
}

- (BOOL)hasDataAtRelativePath:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C7248);
  }
  BOOL v5 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 67110146;
    unsigned int v17 = v4;
    __int16 v18 = 2082;
    __int16 v19 = "-[TSPPackage hasDataAtRelativePath:]";
    __int16 v20 = 2082;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm";
    __int16 v22 = 1024;
    int v23 = 684;
    __int16 v24 = 2114;
    __int16 v25 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage hasDataAtRelativePath:]");
  long long v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
  long long v10 = (objc_class *)objc_opt_class();
  long long v11 = NSStringFromClass(v10);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 684, 0, "Abstract method not overridden by %{public}@", v11);

  +[TSUAssertionHandler logBacktraceThrottled];
  long long v12 = (objc_class *)objc_opt_class();
  char v13 = NSStringFromClass(v12);
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v13, "-[TSPPackage hasDataAtRelativePath:]");
  id v15 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v14 userInfo:0];

  objc_exception_throw(v15);
}

- (BOOL)isPasswordProtected
{
  return [(TSPPackage *)self hasDataAtRelativePath:@".iwpv2"];
}

- (NSString)passwordHint
{
  id v2 = [(TSPPackage *)self dataAtRelativePath:@".iwph" allowDecryption:0 error:0];
  id v3 = +[SFUCryptoUtils decodePassphraseHint:v2];

  return (NSString *)v3;
}

- (NSData)passwordVerifier
{
  return (NSData *)[(TSPPackage *)self dataAtRelativePath:@".iwpv2" allowDecryption:0 error:0];
}

- (id)keyFromPassword:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TSPPackage *)self passwordVerifier];
  id v6 = [(TSPPackage *)self keyFromPassword:v4 passwordVerifier:v5];

  return v6;
}

- (id)keyFromPassword:(id)a3 passwordVerifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  id v8 = 0;
  if (v5 && v6)
  {
    long long v9 = [SFUCryptoKey alloc];
    uint64_t v10 = +[SFUCryptoUtils iterationCountFromPassphraseVerifier:v7];
    long long v11 = +[SFUCryptoUtils saltFromVerifier:v7 saltLength:16];
    id v8 = [(SFUCryptoKey *)v9 initAes128KeyFromPassphrase:v5 iterationCount:v10 saltData:v11];
  }
  return v8;
}

- (BOOL)checkPassword:(id)a3
{
  id v4 = a3;
  id v5 = [(TSPPackage *)self passwordVerifier];
  id v6 = [(TSPPackage *)self keyFromPassword:v4 passwordVerifier:v5];
  if (v6) {
    BOOL v7 = +[SFUCryptoUtils checkKey:v6 againstPassphraseVerifier:v5];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)zipArchiveURLFromPackageURL:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C7268);
  }
  id v5 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 67110146;
    unsigned int v17 = v4;
    __int16 v18 = 2082;
    __int16 v19 = "+[TSPPackage zipArchiveURLFromPackageURL:]";
    __int16 v20 = 2082;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm";
    __int16 v22 = 1024;
    int v23 = 726;
    __int16 v24 = 2114;
    __int16 v25 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSPPackage zipArchiveURLFromPackageURL:]");
  long long v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
  uint64_t v10 = (objc_class *)objc_opt_class();
  long long v11 = NSStringFromClass(v10);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 726, 0, "Abstract method not overridden by %{public}@", v11);

  +[TSUAssertionHandler logBacktraceThrottled];
  long long v12 = (objc_class *)objc_opt_class();
  char v13 = NSStringFromClass(v12);
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v13, "+[TSPPackage zipArchiveURLFromPackageURL:]");
  id v15 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v14 userInfo:0];

  objc_exception_throw(v15);
}

+ (unint64_t)zipArchiveOptions
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C7288);
  }
  id v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    unsigned int v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 67110146;
    unsigned int v15 = v2;
    __int16 v16 = 2082;
    unsigned int v17 = "+[TSPPackage zipArchiveOptions]";
    __int16 v18 = 2082;
    __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm";
    __int16 v20 = 1024;
    int v21 = 730;
    __int16 v22 = 2114;
    int v23 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSPPackage zipArchiveOptions]");
  BOOL v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
  id v8 = (objc_class *)objc_opt_class();
  long long v9 = NSStringFromClass(v8);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 730, 0, "Abstract method not overridden by %{public}@", v9);

  +[TSUAssertionHandler logBacktraceThrottled];
  uint64_t v10 = (objc_class *)objc_opt_class();
  long long v11 = NSStringFromClass(v10);
  long long v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v11, "+[TSPPackage zipArchiveOptions]");
  id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (id)newRawDataReadChannelAtRelativePath:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C72A8);
  }
  id v5 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 67110146;
    unsigned int v17 = v4;
    __int16 v18 = 2082;
    __int16 v19 = "-[TSPPackage newRawDataReadChannelAtRelativePath:]";
    __int16 v20 = 2082;
    int v21 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm";
    __int16 v22 = 1024;
    int v23 = 740;
    __int16 v24 = 2114;
    __int16 v25 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage newRawDataReadChannelAtRelativePath:]");
  long long v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
  uint64_t v10 = (objc_class *)objc_opt_class();
  long long v11 = NSStringFromClass(v10);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 740, 0, "Abstract method not overridden by %{public}@", v11);

  +[TSUAssertionHandler logBacktraceThrottled];
  long long v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v13, "-[TSPPackage newRawDataReadChannelAtRelativePath:]");
  id v15 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v14 userInfo:0];

  objc_exception_throw(v15);
}

- (id)newDocumentPropertiesWithURL:(id)a3 zipProvider:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C72C8);
  }
  long long v9 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    long long v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 67110146;
    unsigned int v21 = v8;
    __int16 v22 = 2082;
    int v23 = "-[TSPPackage newDocumentPropertiesWithURL:zipProvider:error:]";
    __int16 v24 = 2082;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm";
    __int16 v26 = 1024;
    int v27 = 744;
    __int16 v28 = 2114;
    id v29 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  long long v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage newDocumentPropertiesWithURL:zipProvider:error:]");
  id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
  id v14 = (objc_class *)objc_opt_class();
  id v15 = NSStringFromClass(v14);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 744, 0, "Abstract method not overridden by %{public}@", v15);

  +[TSUAssertionHandler logBacktraceThrottled];
  __int16 v16 = (objc_class *)objc_opt_class();
  unsigned int v17 = NSStringFromClass(v16);
  __int16 v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v17, "-[TSPPackage newDocumentPropertiesWithURL:zipProvider:error:]");
  id v19 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v18 userInfo:0];

  objc_exception_throw(v19);
}

- (void)prepareForDocumentReplacementWithSuccess:(BOOL)a3 forSafeSave:(BOOL)a4 originalURL:(id)a5
{
  id v5 = a5;
  unsigned int v6 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C72E8);
  }
  id v7 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
  {
    unsigned int v8 = (objc_class *)objc_opt_class();
    long long v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v6;
    __int16 v20 = 2082;
    unsigned int v21 = "-[TSPPackage prepareForDocumentReplacementWithSuccess:forSafeSave:originalURL:]";
    __int16 v22 = 2082;
    int v23 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm";
    __int16 v24 = 1024;
    int v25 = 748;
    __int16 v26 = 2114;
    int v27 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackage prepareForDocumentReplacementWithSuccess:forSafeSave:originalURL:]");
  long long v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
  long long v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 748, 0, "Abstract method not overridden by %{public}@", v13);

  +[TSUAssertionHandler logBacktraceThrottled];
  id v14 = (objc_class *)objc_opt_class();
  id v15 = NSStringFromClass(v14);
  __int16 v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[TSPPackage prepareForDocumentReplacementWithSuccess:forSafeSave:originalURL:]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (unsigned)packageIdentifier
{
  return self->_packageIdentifier;
}

- (SFUCryptoKey)decryptionKey
{
  return self->_decryptionKey;
}

- (BOOL)isClosed
{
  return self->_isClosed;
}

- (unint64_t)fileFormatVersion
{
  return self->_fileFormatVersion;
}

- (unint64_t)documentReadVersion
{
  return self->_documentReadVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decryptionKey, 0);
  objc_destroyWeak((id *)&self->_fileCoordinatorDelegate);
  objc_storeStrong((id *)&self->_packageDatas, 0);
  objc_storeStrong((id *)&self->_lastReloadError, 0);
  objc_storeStrong((id *)&self->_zipArchive, 0);
  objc_storeStrong((id *)&self->_documentProperties, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end