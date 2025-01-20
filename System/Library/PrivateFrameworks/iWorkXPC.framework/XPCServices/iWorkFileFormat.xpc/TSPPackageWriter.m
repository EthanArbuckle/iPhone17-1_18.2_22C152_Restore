@interface TSPPackageWriter
+ (id)newPackageWriterWithPackageType:(int64_t)a3 URL:(id)a4 documentTargetURL:(id)a5 relativeURLForExternalData:(id)a6 packageIdentifier:(unsigned __int8)a7 documentProperties:(id)a8 documentMetadata:(id)a9 fileFormatVersion:(unint64_t)a10 updateType:(int64_t)a11 cloneMode:(BOOL)a12 documentSaveValidationPolicy:(id)a13 encryptionKey:(id)a14 originalDocumentPackage:(id)a15 originalSupportPackage:(id)a16 fileCoordinatorDelegate:(id)a17 progress:(id)a18 error:(id *)a19;
- (BOOL)canLinkData;
- (BOOL)closeAndReturnError:(id *)a3;
- (BOOL)flushPendingWritesReturningError:(id *)a3;
- (BOOL)writeData:(id)a3 toRelativePath:(id)a4 allowEncryption:(BOOL)a5 error:(id *)a6;
- (CGDataConsumer)newCGDataConsumerAtRelativePath:(id)a3;
- (NSProgress)progress;
- (NSURL)URL;
- (NSURL)documentTargetURL;
- (NSURL)relativeURLForExternalData;
- (SFUCryptoKey)encryptionKey;
- (TSPDocumentSaveValidationPolicy)documentSaveValidationPolicy;
- (TSPPackage)originalPackage;
- (TSPPackageWriter)init;
- (TSPPackageWriter)initWithURL:(id)a3 documentTargetURL:(id)a4 relativeURLForExternalData:(id)a5 packageIdentifier:(unsigned __int8)a6 documentProperties:(id)a7 documentMetadata:(id)a8 fileFormatVersion:(unint64_t)a9 updateType:(int64_t)a10 cloneMode:(BOOL)a11 documentSaveValidationPolicy:(id)a12 encryptionKey:(id)a13 originalDocumentPackage:(id)a14 originalSupportPackage:(id)a15 fileCoordinatorDelegate:(id)a16 progress:(id)a17 error:(id *)a18;
- (TSUZipFileWriter)zipArchiveWriter;
- (id)copyData:(id)a3 withReadChannel:(id)a4 decryptionInfo:(id)a5 size:(unint64_t)a6 calculateCRC:(BOOL)a7 preferredFilename:(id)a8 error:(id *)a9;
- (id)dataForZipEntry:(id)a3 inDataToWrite:(id)a4;
- (id)filenameForData:(id)a3 preferredFilename:(id)a4;
- (id)linkOrCopyData:(id)a3 fromURL:(id)a4 fromTemporaryLocation:(BOOL)a5 decryptionInfo:(id)a6 preferredFilename:(id)a7 error:(id *)a8;
- (id)newComponentWriteChannelWithPackageLocator:(id)a3 compressionAlgorithm:(int64_t)a4 storeOutsideObjectArchive:(BOOL)a5;
- (id)newCompressionComponentWriteChannelWithComponentWriteChannel:(id)a3 compressionAlgorithm:(int64_t)a4;
- (id)newPackageWithPackageIdentifier:(unsigned __int8)a3 documentProperties:(id)a4 fileFormatVersion:(unint64_t)a5 decryptionKey:(id)a6 fileCoordinatorDelegate:(id)a7;
- (id)newRawComponentWriteChannelWithPackageLocator:(id)a3 storeOutsideObjectArchive:(BOOL)a4;
- (id)newRawDataWriteChannelForRelativePath:(id)a3 originalLastModificationDate:(id)a4 originalSize:(unint64_t)a5 originalCRC:(unsigned int)a6 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a7;
- (id)packageEntryInfoForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4 packageURL:(id)a5;
- (id)writtenPackageWithURL:(id)a3;
- (int64_t)updateType;
- (void)closeCurrentChannel;
- (void)closeWithQueue:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)finalizeComponentAndDataSectionWithCompletionHandler:(id)a3;
- (void)performReadUsingAccessor:(id)a3;
- (void)setError:(id)a3;
@end

@implementation TSPPackageWriter

+ (id)newPackageWriterWithPackageType:(int64_t)a3 URL:(id)a4 documentTargetURL:(id)a5 relativeURLForExternalData:(id)a6 packageIdentifier:(unsigned __int8)a7 documentProperties:(id)a8 documentMetadata:(id)a9 fileFormatVersion:(unint64_t)a10 updateType:(int64_t)a11 cloneMode:(BOOL)a12 documentSaveValidationPolicy:(id)a13 encryptionKey:(id)a14 originalDocumentPackage:(id)a15 originalSupportPackage:(id)a16 fileCoordinatorDelegate:(id)a17 progress:(id)a18 error:(id *)a19
{
  unsigned int v38 = a7;
  id v39 = a4;
  id v44 = a5;
  id v43 = a6;
  id v42 = a8;
  id v41 = a9;
  int64_t v23 = a3;
  id v40 = a13;
  id v24 = a14;
  id v25 = a15;
  id v26 = a16;
  id v27 = a17;
  id v28 = a18;
  if (a3 == 2)
  {
    v29 = v39;
    v33 = (objc_class *)objc_opt_class();
    BOOL v30 = a12;
LABEL_11:
    if (v33) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  v29 = v39;
  BOOL v30 = a12;
  if (v23 == 1)
  {
LABEL_9:
    v33 = (objc_class *)objc_opt_class();
    BOOL v30 = 0;
    goto LABEL_11;
  }
  if (!v23)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5198);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015F42C();
    }
    v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSPPackageWriter newPackageWriterWithPackageType:URL:documentTargetURL:relativeURLForExternalData:packageIdentifier:documentProperties:documentMetadata:fileFormatVersion:updateType:cloneMode:documentSaveValidationPolicy:encryptionKey:originalDocumentPackage:originalSupportPackage:fileCoordinatorDelegate:progress:error:]");
    v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v31 file:v32 lineNumber:97 isFatal:0 description:"Specify a package type other than TSPPackageTypeDefault for new package writer"];

    +[TSUAssertionHandler logBacktraceThrottled];
    goto LABEL_9;
  }
LABEL_12:
  if (UnsafePointer != -1) {
    dispatch_once(&UnsafePointer, &stru_1001C51B8);
  }
  v34 = UnsafePointer;
  if (os_log_type_enabled((os_log_t)UnsafePointer, OS_LOG_TYPE_ERROR)) {
    sub_10015F3B4(v23, v34);
  }
  v33 = 0;
LABEL_17:
  LOBYTE(v37) = v30;
  id v35 = objc_msgSend([v33 alloc], "initWithURL:documentTargetURL:relativeURLForExternalData:packageIdentifier:documentProperties:documentMetadata:fileFormatVersion:updateType:cloneMode:documentSaveValidationPolicy:encryptionKey:originalDocumentPackage:originalSupportPackage:fileCoordinatorDelegate:progress:error:", v29, v44, v43, v38, v42, v41, a10, a11, v37, v40, v24, v25, v26, v27, v28,
          a19);

  return v35;
}

- (TSPPackageWriter)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C51D8);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPPackageWriter init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm";
    __int16 v14 = 1024;
    int v15 = 136;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageWriter init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:136 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPPackageWriter init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPPackageWriter)initWithURL:(id)a3 documentTargetURL:(id)a4 relativeURLForExternalData:(id)a5 packageIdentifier:(unsigned __int8)a6 documentProperties:(id)a7 documentMetadata:(id)a8 fileFormatVersion:(unint64_t)a9 updateType:(int64_t)a10 cloneMode:(BOOL)a11 documentSaveValidationPolicy:(id)a12 encryptionKey:(id)a13 originalDocumentPackage:(id)a14 originalSupportPackage:(id)a15 fileCoordinatorDelegate:(id)a16 progress:(id)a17 error:(id *)a18
{
  unsigned int v73 = a6;
  id v22 = a3;
  id v82 = a4;
  id v83 = a5;
  id v23 = a7;
  id v24 = a8;
  id v81 = v23;
  id v75 = a8;
  id v76 = a12;
  id v84 = a13;
  id v77 = a14;
  id v78 = a15;
  id obj = a16;
  id v79 = a17;
  v86 = v22;
  if ([v22 isFileURL])
  {
    v91.receiver = self;
    v91.super_class = (Class)TSPPackageWriter;
    id v25 = [(TSPPackageWriter *)&v91 init];
    if (!v25)
    {
      id v41 = 0;
LABEL_33:
      if (a18 && !v25)
      {
        *a18 = +[NSError tsp_ensureSaveErrorWithError:v41];
      }
      v45 = v25;

      v46 = v45;
      goto LABEL_37;
    }
    id v26 = (NSURL *)[v22 copy];
    URL = v25->_URL;
    v25->_URL = v26;

    id v28 = (NSURL *)[v82 copy];
    documentTargetURL = v25->_documentTargetURL;
    v25->_documentTargetURL = v28;

    BOOL v30 = (NSURL *)[v83 copy];
    relativeURLForExternalData = v25->_relativeURLForExternalData;
    v25->_relativeURLForExternalData = v30;

    objc_storeStrong((id *)&v25->_documentMetadata, v24);
    objc_storeStrong((id *)&v25->_documentSaveValidationPolicy, a12);
    objc_storeStrong((id *)&v25->_encryptionKey, a13);
    objc_storeStrong((id *)&v25->_originalDocumentPackage, a14);
    objc_storeStrong((id *)&v25->_originalSupportPackage, a15);
    objc_storeWeak((id *)&v25->_fileCoordinatorDelegate, obj);
    v32 = [(TSPPackageWriter *)v25 newPackageWithPackageIdentifier:v73 documentProperties:v81 fileFormatVersion:a9 decryptionKey:v84 fileCoordinatorDelegate:v25];
    writtenPackage = v25->_writtenPackage;
    v25->_writtenPackage = v32;

    v25->_updateType = a10;
    objc_storeStrong((id *)&v25->_progress, a17);
    v34 = [(id)objc_opt_class() zipArchiveURLFromPackageURL:v22];
    id v35 = v34;
    if (a11)
    {
      id v90 = 0;
      unsigned int v36 = [v34 checkResourceIsReachableAndReturnError:&v90];
      id v37 = v90;
      if (!v36)
      {
LABEL_25:
        id v87 = 0;
        v49 = [[TSUZipFileWriter alloc] initWithURL:v35 error:&v87];
        id v41 = v87;
        unsigned int v38 = 0;
        zipArchiveWriter = v25->_zipArchiveWriter;
        v25->_zipArchiveWriter = v49;
        id v39 = v37;
        goto LABEL_26;
      }
      id v89 = v37;
      unsigned int v38 = +[TSUZipFileArchive zipArchiveFromURL:v35 options:0 error:&v89];
      id v39 = v89;

      if (v38)
      {
        id v88 = 0;
        id v40 = [[TSUZipFileWriter alloc] initWithZipFileArchive:v38 error:&v88];
        id v41 = v88;
        zipArchiveWriter = v25->_zipArchiveWriter;
        v25->_zipArchiveWriter = v40;
LABEL_26:

        if (v25->_zipArchiveWriter)
        {
          v50 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          dispatch_queue_t v51 = dispatch_queue_create("TSPPackageWriter.Error", v50);
          errorQueue = v25->_errorQueue;
          v25->_errorQueue = (OS_dispatch_queue *)v51;

          v25->_isOpened = 1;
        }
        else
        {
          if (UnsafePointer != -1) {
            dispatch_once(&UnsafePointer, &stru_1001C5258);
          }
          v53 = UnsafePointer;
          if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_ERROR))
          {
            v74 = v35;
            v55 = (objc_class *)objc_opt_class();
            NSStringFromClass(v55);
            id v56 = (id)objc_claimAutoreleasedReturnValue();
            v57 = [v41 domain];
            id v58 = [v41 code];
            unsigned int v59 = objc_msgSend(v41, "tsp_isRecoverable");
            uint64_t v60 = objc_msgSend(v41, "tsp_hintsDescription");
            v61 = (void *)v60;
            CFStringRef v62 = &stru_1001D3790;
            *(_DWORD *)buf = 138413826;
            v93 = v74;
            BOOL v63 = v59 == 0;
            id v35 = v74;
            __int16 v94 = 2114;
            if (!v63) {
              CFStringRef v62 = @"recoverable=YES, ";
            }
            id v95 = v56;
            __int16 v96 = 2114;
            v97 = v57;
            __int16 v98 = 2048;
            id v99 = v58;
            __int16 v100 = 2114;
            CFStringRef v101 = v62;
            __int16 v102 = 2114;
            uint64_t v103 = v60;
            __int16 v104 = 2112;
            id v105 = v41;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v53, OS_LOG_TYPE_ERROR, "Failed to create ZIP archive writer. zipArchiveURL=%@, error=errorClass=%{public}@, domain=%{public}@, code=%zd, %{public}@hints=%{public}@ (%@) ", buf, 0x48u);
          }
          id v25 = 0;
        }

        goto LABEL_33;
      }
      if (v39)
      {
        if (UnsafePointer != -1) {
          dispatch_once(&UnsafePointer, &stru_1001C5238);
        }
        v47 = UnsafePointer;
        if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR))
        {
          v64 = (objc_class *)objc_opt_class();
          NSStringFromClass(v64);
          v65 = v35;
          id v66 = (id)objc_claimAutoreleasedReturnValue();
          v67 = [v39 domain];
          id v68 = [v39 code];
          unsigned int v69 = objc_msgSend(v39, "tsp_isRecoverable");
          uint64_t v70 = objc_msgSend(v39, "tsp_hintsDescription");
          v71 = (void *)v70;
          CFStringRef v72 = &stru_1001D3790;
          *(_DWORD *)buf = 138413826;
          v93 = v65;
          BOOL v63 = v69 == 0;
          id v35 = v65;
          __int16 v94 = 2114;
          if (!v63) {
            CFStringRef v72 = @"recoverable=YES, ";
          }
          id v95 = v66;
          __int16 v96 = 2114;
          v97 = v67;
          __int16 v98 = 2048;
          id v99 = v68;
          __int16 v100 = 2114;
          CFStringRef v101 = v72;
          __int16 v102 = 2114;
          uint64_t v103 = v70;
          __int16 v104 = 2112;
          id v105 = v39;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v47, OS_LOG_TYPE_ERROR, "Error reading zip archive, zipArchiveURL=%@, errorClass=%{public}@, domain=%{public}@, code=%zd, %{public}@hints=%{public}@ (%@) ", buf, 0x48u);
        }
        id v37 = v39;
        goto LABEL_25;
      }
      if (UnsafePointer != -1) {
        dispatch_once(&UnsafePointer, &stru_1001C5218);
      }
      v48 = UnsafePointer;
      if (os_log_type_enabled((os_log_t)UnsafePointer, OS_LOG_TYPE_ERROR)) {
        sub_10015F4B4((uint64_t)v35, v48);
      }
    }
    id v37 = 0;
    goto LABEL_25;
  }
  +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C51F8);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_10015F52C();
  }
  id v43 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageWriter initWithURL:documentTargetURL:relativeURLForExternalData:packageIdentifier:documentProperties:documentMetadata:fileFormatVersion:updateType:cloneMode:documentSaveValidationPolicy:encryptionKey:originalDocumentPackage:originalSupportPackage:fileCoordinatorDelegate:progress:error:]");
  id v44 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v43 file:v44 lineNumber:156 isFatal:0 description:"Don't support writing to non-file URLs"];

  +[TSUAssertionHandler logBacktraceThrottled];
  if (a18)
  {
    +[NSError tsp_saveDocumentErrorWithUserInfo:0];
    v45 = self;
    v46 = 0;
    *a18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = 0;
    v45 = self;
  }
LABEL_37:

  return v46;
}

- (void)dealloc
{
  if (self->_isOpened)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5278);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015F5B4();
    }
    TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Didn't close", v2, v3, v4, v5, v6, v7, v8, (char)"-[TSPPackageWriter dealloc]");
    unsigned int v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageWriter dealloc]");
    __int16 v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:229 isFatal:1 description:"Didn't close"];

    TSUCrashBreakpoint();
    abort();
  }
  v11.receiver = self;
  v11.super_class = (Class)TSPPackageWriter;
  [(TSPPackageWriter *)&v11 dealloc];
}

- (BOOL)canLinkData
{
  return (unint64_t)(self->_updateType - 1) < 2;
}

- (TSPPackage)originalPackage
{
  unsigned int v3 = [(TSPPackage *)self->_writtenPackage packageIdentifier];
  if (v3 == 1)
  {
    uint64_t v4 = 16;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    uint64_t v4 = 24;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.isa + v4);
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:
  return (TSPPackage *)v5;
}

- (void)setError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    errorQueue = self->_errorQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100007864;
    v7[3] = &unk_1001C52A0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(errorQueue, v7);
  }
}

- (id)packageEntryInfoForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4 packageURL:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C52C0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015F6C4();
    }
    __int16 v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageWriter packageEntryInfoForComponentLocator:isStoredOutsideObjectArchive:packageURL:]");
    objc_super v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 269, 0, "Invalid parameter not satisfying: %{public}s", "locator");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (v6)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C52E0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015F63C();
    }
    __int16 v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageWriter packageEntryInfoForComponentLocator:isStoredOutsideObjectArchive:packageURL:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:270 isFatal:0 description:"Components outside the object archive are not supported"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  __int16 v14 = [(TSPPackageWriter *)self componentZipArchiveWriter];
  int v15 = +[TSPPackage objectArchiveEntryPathForPackageLocator:v8];
  v16 = [v14 entryWithName:v15];

  if (v16)
  {
    v17 = [TSPPackageEntryInfo alloc];
    id v18 = [v16 size];
    v19 = [v16 lastModificationDate];
    v20 = -[TSPPackageEntryInfo initWithEncodedLength:lastModificationDate:CRC:](v17, "initWithEncodedLength:lastModificationDate:CRC:", v18, v19, [v16 CRC]);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)closeCurrentChannel
{
  [(TSPComponentWriteChannel *)self->_componentWriteChannel close];
  componentWriteChannel = self->_componentWriteChannel;
  self->_componentWriteChannel = 0;
}

- (id)newCompressionComponentWriteChannelWithComponentWriteChannel:(id)a3 compressionAlgorithm:(int64_t)a4
{
  id v5 = a3;
  BOOL v6 = v5;
  switch(a4)
  {
    case 0:
      uint64_t v7 = [[TSPSnappyComponentWriteChannel alloc] initWithWriteChannel:v5];
      goto LABEL_10;
    case 1:
      uint64_t v7 = (TSPSnappyComponentWriteChannel *)v5;
      goto LABEL_10;
    case 2:
      id v9 = [TSPCompressionComponentWriteChannel alloc];
      uint64_t v10 = 256;
      goto LABEL_9;
    case 3:
      id v9 = [TSPCompressionComponentWriteChannel alloc];
      uint64_t v10 = 517;
      goto LABEL_9;
    case 4:
      id v9 = [TSPCompressionComponentWriteChannel alloc];
      uint64_t v10 = 774;
      goto LABEL_9;
    case 5:
      id v9 = [TSPCompressionComponentWriteChannel alloc];
      uint64_t v10 = 2049;
LABEL_9:
      uint64_t v7 = [(TSPCompressionComponentWriteChannel *)v9 initWithWriteChannel:v6 compressionAlgorithm:v10 operation:0];
LABEL_10:
      id v8 = v7;
      break;
    default:
      id v8 = 0;
      break;
  }

  return v8;
}

- (id)newComponentWriteChannelWithPackageLocator:(id)a3 compressionAlgorithm:(int64_t)a4 storeOutsideObjectArchive:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(TSPPackageWriter *)self closeCurrentChannel];
  id v9 = [(TSPPackageWriter *)self newRawComponentWriteChannelWithPackageLocator:v8 storeOutsideObjectArchive:v5];
  if (v9
    && (!self->_encryptionKey
     || (v10 = [[TSPCryptoComponentWriteChannel alloc] initWithWriteChannel:v9 encryptionInfo:self->_encryptionKey], v9, (id v9 = v10) != 0)))
  {
    objc_super v11 = [(TSPPackageWriter *)self newCompressionComponentWriteChannelWithComponentWriteChannel:v9 compressionAlgorithm:a4];
  }
  else
  {
    objc_super v11 = 0;
  }
  componentWriteChannel = self->_componentWriteChannel;
  self->_componentWriteChannel = v11;
  v13 = v11;

  __int16 v14 = self->_componentWriteChannel;
  return v14;
}

- (id)newRawComponentWriteChannelWithPackageLocator:(id)a3 storeOutsideObjectArchive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5300);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015F7FC();
    }
    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageWriter newRawComponentWriteChannelWithPackageLocator:storeOutsideObjectArchive:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 330, 0, "invalid nil value for '%{public}s'", "packageLocator");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (v4)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5320);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015F774();
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageWriter newRawComponentWriteChannelWithPackageLocator:storeOutsideObjectArchive:]");
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:331 isFatal:0 description:"Components outside the object archive are not supported"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  objc_super v11 = [(TSPPackageWriter *)self originalPackage];
  __int16 v12 = [v11 packageEntryInfoForComponentLocator:v6 isStoredOutsideObjectArchive:v4];

  v13 = [(TSPPackageWriter *)self componentZipArchiveWriter];
  __int16 v14 = +[TSPPackage objectArchiveEntryPathForPackageLocator:v6];
  int v15 = [v12 lastModificationDate];
  objc_msgSend(v13, "beginEntryWithName:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:", v14, 1, v15, objc_msgSend(v12, "encodedLength"), objc_msgSend(v12, "CRC"), 1);

  v16 = [[TSPPackageWriterComponentWriteChannel alloc] initWithArchiveWriter:v13];
  return v16;
}

- (BOOL)flushPendingWritesReturningError:(id *)a3
{
  [(TSPPackageWriter *)self closeCurrentChannel];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1000083F0;
  v20 = sub_100008400;
  id v21 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(TSPPackageWriter *)self componentZipArchiveWriter];
  uint64_t v7 = dispatch_get_global_queue(0, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008408;
  v13[3] = &unk_1001C5348;
  int v15 = &v16;
  id v8 = v5;
  __int16 v14 = v8;
  [v6 flushCurrentEntryWithQueue:v7 completion:v13];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = v17;
  if (a3)
  {
    uint64_t v10 = (void *)v17[5];
    if (v10)
    {
      *a3 = v10;
      id v9 = v17;
    }
  }
  BOOL v11 = v9[5] == 0;

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (id)filenameForData:(id)a3 preferredFilename:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 stringByDeletingPathExtension];
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-%llu", [v5 identifier]);
  id v9 = [v6 pathExtension];
  id v10 = [v9 length];
  if ([(__CFString *)v7 hasPrefix:@"~"])
  {
    uint64_t v11 = [@"x" stringByAppendingString:v7];

    uint64_t v7 = (__CFString *)v11;
  }
  id v12 = [v8 length];
  if (v10) {
    uint64_t v13 = 247 - (void)v10;
  }
  else {
    uint64_t v13 = 248;
  }
  id v14 = [(__CFString *)v7 length];
  int v15 = @"data";
  if (v14) {
    int v15 = v7;
  }
  uint64_t v16 = v15;

  v17 = v16;
  uint64_t v18 = (const char *)[(__CFString *)v17 fileSystemRepresentation];
  if (v18)
  {
    v19 = +[NSFileManager defaultManager];
    v20 = [v19 stringWithFileSystemRepresentation:v18 length:strlen(v18)];
    uint64_t v21 = objc_msgSend(v20, "tsu_substringWithComposedCharacterSequencesTruncatedToLength:", v13 - (void)v12);

    v17 = (__CFString *)v21;
  }
  id v22 = [(__CFString *)v17 stringByAppendingString:v8];
  id v23 = v22;
  if (v10)
  {
    uint64_t v24 = [v22 stringByAppendingPathExtension:v9];

    id v23 = (void *)v24;
  }

  return v23;
}

- (id)linkOrCopyData:(id)a3 fromURL:(id)a4 fromTemporaryLocation:(BOOL)a5 decryptionInfo:(id)a6 preferredFilename:(id)a7 error:(id *)a8
{
  id v28 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [[TSUFileIOChannel alloc] initForReadingURL:v13 error:a8];
  if (v16)
  {
    id v30 = 0;
    id v29 = 0;
    unsigned __int8 v17 = [v13 getResourceValue:&v30 forKey:NSURLFileSizeKey error:&v29];
    id v18 = v30;
    id v19 = v29;
    if ((v17 & 1) == 0)
    {

      if (UnsafePointer != -1) {
        dispatch_once(&UnsafePointer, &stru_1001C5368);
      }
      v20 = UnsafePointer;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      {
        id v23 = [v13 path];
        uint64_t v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        id v26 = [v19 domain];
        id v25 = [v19 code];
        *(_DWORD *)buf = 138413314;
        id v32 = v23;
        __int16 v33 = 2114;
        id v34 = v27;
        __int16 v35 = 2114;
        unsigned int v36 = v26;
        __int16 v37 = 2048;
        id v38 = v25;
        __int16 v39 = 2112;
        id v40 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_ERROR, "Failed to retrieve file size for path: %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
      }
      id v18 = 0;
    }
    id v21 = -[TSPPackageWriter copyData:withReadChannel:decryptionInfo:size:calculateCRC:preferredFilename:error:](self, "copyData:withReadChannel:decryptionInfo:size:calculateCRC:preferredFilename:error:", v28, v16, v14, [v18 unsignedLongLongValue], 1, v15, a8);
    [v16 close];
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)copyData:(id)a3 withReadChannel:(id)a4 decryptionInfo:(id)a5 size:(unint64_t)a6 calculateCRC:(BOOL)a7 preferredFilename:(id)a8 error:(id *)a9
{
  BOOL v10 = a7;
  id v15 = a3;
  id v42 = a4;
  id v16 = a5;
  id v39 = a8;
  id v40 = v16;
  [(TSPPackageWriter *)self closeCurrentChannel];
  id v41 = [(TSPPackageWriter *)self filenameForData:v15 preferredFilename:v39];
  id v44 = [@"Data" stringByAppendingPathComponent:v41];
  if (UnsafePointer(v16, self->_encryptionKey, (id)0x100000))
  {
    UnsafePointer(self->_encryptionKey, 0x100000);
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v17 = 0;
    unint64_t v18 = 0;
  }
  else
  {
    id v43 = [v16 mutableCryptoInfoCopy];
    id v19 = [v15 storage];
    if (objc_opt_respondsToSelector()) {
      unsigned int v17 = [v19 CRC];
    }
    else {
      unsigned int v17 = 0;
    }

    unint64_t v18 = a6;
  }
  v20 = [(TSPPackageWriter *)self zipArchiveWriter];
  id v21 = [v20 entryWithName:v44];

  id v45 = [v21 size];
  id v22 = [v15 packageLocator];
  if (v22)
  {
    id v23 = [v15 packageLocator];
    unsigned int v24 = [v23 isEqualToString:v44];
    if (v21) {
      unsigned int v25 = v24;
    }
    else {
      unsigned int v25 = 0;
    }
    if (v25 == 1 && (id v26 = [v15 encodedLength], v26 == objc_msgSend(v21, "size")))
    {
      unsigned int v27 = [v21 CRC];

      if (v17 == v27)
      {
        if (UnsafePointer != -1) {
          dispatch_once(&UnsafePointer, &stru_1001C5388);
        }
        id v28 = UnsafePointer;
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEBUG))
        {
          id v29 = [v15 packageLocator];
          sub_10015F8AC(v29, buf, (os_log_t)v28);
        }

        goto LABEL_27;
      }
    }
    else
    {
    }
  }
  id v30 = [v15 lastModificationDate];
  if (v10) {
    uint64_t v31 = 0;
  }
  else {
    uint64_t v31 = v17;
  }
  id v32 = [(TSPPackageWriter *)self newRawDataWriteChannelForRelativePath:v44 originalLastModificationDate:v30 originalSize:v18 originalCRC:v31 forceCalculatingSizeAndCRCForPreservingLastModificationDate:0];

  __int16 v33 = v39;
  if (v32)
  {
    id v34 = v40;
    unsigned int v35 = +[TSPFileManager copyDataFromReadChannel:v42 decryptionInfo:v40 size:a6 toWriteChannel:v32 encryptionInfo:v43 encodedLength:&v45 error:a9];
  }
  else
  {
    unsigned int v35 = 0;
    id v34 = v40;
  }
  [v32 close];

  if (!v35)
  {
    __int16 v37 = 0;
    goto LABEL_29;
  }
LABEL_27:
  unsigned int v36 = [TSPPackageWriterCopyDataResult alloc];
  __int16 v37 = [(TSPPackageWriterCopyDataResult *)v36 initWithFilename:v41 encryptionInfo:v43 encodedLength:v45];
  __int16 v33 = v39;
  id v34 = v40;
LABEL_29:

  return v37;
}

- (id)dataForZipEntry:(id)a3 inDataToWrite:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 name];
  id v8 = [v6 objectForKeyedSubscript:v7];

  id v9 = [v8 storage];
  if (objc_opt_respondsToSelector()) {
    unsigned int v10 = [v9 CRC];
  }
  else {
    unsigned int v10 = 0;
  }
  id v11 = [v8 lengthIfLocal];
  if (v11)
  {
    id v12 = [v8 encodedLength];
    if (v12 == [v5 size] && v10 == objc_msgSend(v5, "CRC")) {
      id v11 = v8;
    }
    else {
      id v11 = 0;
    }
  }
  id v13 = v11;

  return v13;
}

- (BOOL)writeData:(id)a3 toRelativePath:(id)a4 allowEncryption:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  [(TSPPackageWriter *)self closeCurrentChannel];
  if (v11)
  {
    if (v10)
    {
      id v12 = [(TSPPackageWriter *)self originalPackage];
      id v13 = v12;
      if (v7)
      {
        id v14 = [v12 decryptionKey];
        BOOL v15 = UnsafePointer(v14, self->_encryptionKey, (id)0x100000);
      }
      else
      {
        BOOL v15 = 0;
      }
      id v19 = 0;
      if (!v15 && v13)
      {
        id v38 = 0;
        uint64_t v20 = [v13 packageEntryInfoAtRelativePath:v11 error:&v38];
        id v21 = v38;
        id v22 = v21;
        if (!v20 && (objc_msgSend(v21, "tsu_isNoSuchFileError") & 1) == 0)
        {
          if (UnsafePointer != -1) {
            dispatch_once(&UnsafePointer, &stru_1001C53C8);
          }
          id v23 = UnsafePointer;
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
          {
            id v30 = (objc_class *)objc_opt_class();
            NSStringFromClass(v30);
            id v37 = (id)objc_claimAutoreleasedReturnValue();
            unsigned int v36 = [v22 domain];
            id v34 = [v22 code];
            unsigned int v31 = objc_msgSend(v22, "tsp_isRecoverable");
            uint64_t v32 = objc_msgSend(v22, "tsp_hintsDescription");
            CFStringRef v33 = &stru_1001D3790;
            *(_DWORD *)buf = 138413826;
            id v40 = v11;
            __int16 v41 = 2114;
            if (v31) {
              CFStringRef v33 = @"recoverable=YES, ";
            }
            id v42 = v37;
            __int16 v43 = 2114;
            id v44 = v36;
            __int16 v45 = 2048;
            id v46 = v34;
            __int16 v47 = 2114;
            CFStringRef v48 = v33;
            __int16 v49 = 2114;
            uint64_t v50 = v32;
            __int16 v51 = 2112;
            v52 = v22;
            unsigned int v35 = (void *)v32;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, "Failed to retrieve encoded length and last modification date, path=%@, errorClass=%{public}@, domain=%{public}@, code=%zd, %{public}@hints=%{public}@ (%@) ", buf, 0x48u);
          }
        }

        id v19 = (void *)v20;
      }
      unsigned int v24 = [[TSPMemoryReadChannel alloc] initWithNSData:v10];
      unsigned int v25 = [v19 lastModificationDate];
      id v26 = -[TSPPackageWriter newRawDataWriteChannelForRelativePath:originalLastModificationDate:originalSize:originalCRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:](self, "newRawDataWriteChannelForRelativePath:originalLastModificationDate:originalSize:originalCRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:", v11, v25, [v19 encodedLength], objc_msgSend(v19, "CRC"), 1);

      id v27 = [v10 length];
      if (v7) {
        encryptionKey = self->_encryptionKey;
      }
      else {
        encryptionKey = 0;
      }
      BOOL v18 = +[TSPFileManager copyDataFromReadChannel:v24 decryptionInfo:0 size:v27 toWriteChannel:v26 encryptionInfo:encryptionKey encodedLength:0 error:a6];
      [v26 close];
      [(TSPMemoryReadChannel *)v24 close];
    }
    else
    {
      BOOL v18 = 1;
    }
  }
  else
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C53A8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015F904();
    }
    id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageWriter writeData:toRelativePath:allowEncryption:error:]");
    unsigned int v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:704 isFatal:0 description:"Path should be defined."];

    +[TSUAssertionHandler logBacktraceThrottled];
    BOOL v18 = 0;
  }

  return v18;
}

- (CGDataConsumer)newCGDataConsumerAtRelativePath:(id)a3
{
  id v4 = a3;
  [(TSPPackageWriter *)self closeCurrentChannel];
  if (v4)
  {
    id v5 = [(TSPPackageWriter *)self originalPackage];
    id v6 = v5;
    if (v5)
    {
      id v25 = 0;
      BOOL v7 = [v5 packageEntryInfoAtRelativePath:v4 error:&v25];
      id v8 = v25;
      id v9 = v8;
      if (!v7 && (objc_msgSend(v8, "tsu_isNoSuchFileError") & 1) == 0)
      {
        if (UnsafePointer != -1) {
          dispatch_once(&UnsafePointer, &stru_1001C5408);
        }
        id v10 = UnsafePointer;
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
        {
          unsigned int v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          id v24 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v18 = [v9 domain];
          id v19 = [v9 code];
          unsigned int v20 = objc_msgSend(v9, "tsp_isRecoverable");
          uint64_t v21 = objc_msgSend(v9, "tsp_hintsDescription");
          id v22 = (void *)v21;
          CFStringRef v23 = &stru_1001D3790;
          *(_DWORD *)buf = 138413826;
          id v27 = v4;
          __int16 v28 = 2114;
          if (v20) {
            CFStringRef v23 = @"recoverable=YES, ";
          }
          id v29 = v24;
          __int16 v30 = 2114;
          unsigned int v31 = v18;
          __int16 v32 = 2048;
          id v33 = v19;
          __int16 v34 = 2114;
          CFStringRef v35 = v23;
          __int16 v36 = 2114;
          uint64_t v37 = v21;
          __int16 v38 = 2112;
          id v39 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "Failed to retrieve encoded length and last modification date, path=%@, errorClass=%{public}@, domain=%{public}@, code=%zd, %{public}@hints=%{public}@ (%@) ", buf, 0x48u);
        }
      }
    }
    else
    {
      BOOL v7 = 0;
    }
    id v14 = [v7 lastModificationDate];
    id v15 = -[TSPPackageWriter newRawDataWriteChannelForRelativePath:originalLastModificationDate:originalSize:originalCRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:](self, "newRawDataWriteChannelForRelativePath:originalLastModificationDate:originalSize:originalCRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:", v4, v14, [v7 encodedLength], objc_msgSend(v7, "CRC"), 1);

    id v13 = +[TSPCGDataConsumer newCGDataConsumerForWriteChannel:v15];
  }
  else
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C53E8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015F98C();
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageWriter newCGDataConsumerAtRelativePath:]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:740 isFatal:0 description:"Path should be defined."];

    +[TSUAssertionHandler logBacktraceThrottled];
    id v13 = 0;
  }

  return v13;
}

- (void)finalizeComponentAndDataSectionWithCompletionHandler:(id)a3
{
  unsigned int v3 = (void (**)(id, void))a3;
  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)closeWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(TSPPackageWriter *)self closeCurrentChannel];
  id v8 = objc_retainBlock(v7);
  if (v7)
  {
    uint64_t v19 = 0;
    unsigned int v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = sub_1000083F0;
    CFStringRef v23 = sub_100008400;
    id v24 = 0;
    errorQueue = self->_errorQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009C38;
    block[3] = &unk_1001C5430;
    block[4] = self;
    block[5] = &v19;
    dispatch_sync(errorQueue, block);
    if (v20[5])
    {
      id v12 = _NSConcreteStackBlock;
      uint64_t v13 = 3221225472;
      id v14 = sub_100009C4C;
      id v15 = &unk_1001C5458;
      id v16 = v7;
      unsigned int v17 = &v19;
      id v10 = objc_retainBlock(&v12);

      id v8 = v10;
    }
    _Block_object_dispose(&v19, 8);
  }
  id v11 = [(TSPPackageWriter *)self zipArchiveWriter];
  [v11 closeWithQueue:v6 completion:v8];

  self->_isOpened = 0;
}

- (BOOL)closeAndReturnError:(id *)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  unsigned int v17 = sub_1000083F0;
  BOOL v18 = sub_100008400;
  id v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009E5C;
  v11[3] = &unk_1001C5348;
  uint64_t v13 = &v14;
  id v7 = v5;
  id v12 = v7;
  [(TSPPackageWriter *)self closeWithQueue:v6 completion:v11];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (void *)v15[5];
  if (a3 && v8 && !*a3)
  {
    *a3 = v8;
    id v8 = (void *)v15[5];
  }
  BOOL v9 = v8 == 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)writtenPackageWithURL:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = objc_opt_class();
  id v6 = [TSUZipFileArchive alloc];
  id v7 = [(TSPPackageWriter *)self zipArchiveWriter];
  id v8 = [v5 zipArchiveURLFromPackageURL:v4];
  id v21 = 0;
  BOOL v9 = -[TSUZipFileArchive initWithWriter:forReadingFromURL:options:error:](v6, "initWithWriter:forReadingFromURL:options:error:", v7, v8, [v5 zipArchiveOptions], &v21);
  id v10 = v21;

  if (!v9)
  {
    if (UnsafePointer != -1) {
      dispatch_once(&UnsafePointer, &stru_1001C5478);
    }
    id v11 = UnsafePointer;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v4 path];
      unsigned int v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      id v19 = [v10 domain];
      id v20 = [v10 code];
      *(_DWORD *)buf = 138413314;
      id v23 = v16;
      __int16 v24 = 2114;
      id v25 = v18;
      __int16 v26 = 2114;
      id v27 = v19;
      __int16 v28 = 2048;
      id v29 = v20;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_ERROR, "Failed to load written zip archive: %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
    }
  }
  writtenPackage = self->_writtenPackage;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fileCoordinatorDelegate);
  [(TSPPackage *)writtenPackage setZipArchive:v9 fileCoordinatorDelegate:WeakRetained];

  uint64_t v14 = self->_writtenPackage;
  return v14;
}

- (void)performReadUsingAccessor:(id)a3
{
}

- (id)newPackageWithPackageIdentifier:(unsigned __int8)a3 documentProperties:(id)a4 fileFormatVersion:(unint64_t)a5 decryptionKey:(id)a6 fileCoordinatorDelegate:(id)a7
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a7;
  unsigned int v12 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C5498);
  }
  uint64_t v13 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 67110146;
    unsigned int v25 = v12;
    __int16 v26 = 2082;
    id v27 = "-[TSPPackageWriter newPackageWithPackageIdentifier:documentProperties:fileFormatVersion:decryptionKey:fileCoor"
          "dinatorDelegate:]";
    __int16 v28 = 2082;
    id v29 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm";
    __int16 v30 = 1024;
    int v31 = 833;
    __int16 v32 = 2114;
    id v33 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageWriter newPackageWithPackageIdentifier:documentProperties:fileFormatVersion:decryptionKey:fileCoordinatorDelegate:]");
  unsigned int v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm"];
  id v18 = (objc_class *)objc_opt_class();
  id v23 = NSStringFromClass(v18);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 833, 0, "Abstract method not overridden by %{public}@", v23);

  +[TSUAssertionHandler logBacktraceThrottled];
  id v19 = (objc_class *)objc_opt_class();
  id v20 = NSStringFromClass(v19);
  id v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v20, "-[TSPPackageWriter newPackageWithPackageIdentifier:documentProperties:fileFormatVersion:decryptionKey:fileCoordinatorDelegate:]");
  id v22 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v21 userInfo:0];

  objc_exception_throw(v22);
}

- (id)newRawDataWriteChannelForRelativePath:(id)a3 originalLastModificationDate:(id)a4 originalSize:(unint64_t)a5 originalCRC:(unsigned int)a6 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a7
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C54B8);
  }
  id v11 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
  {
    unsigned int v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 67110146;
    unsigned int v23 = v10;
    __int16 v24 = 2082;
    unsigned int v25 = "-[TSPPackageWriter newRawDataWriteChannelForRelativePath:originalLastModificationDate:originalSize:originalCRC"
          ":forceCalculatingSizeAndCRCForPreservingLastModificationDate:]";
    __int16 v26 = 2082;
    id v27 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm";
    __int16 v28 = 1024;
    int v29 = 837;
    __int16 v30 = 2114;
    int v31 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  uint64_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageWriter newRawDataWriteChannelForRelativePath:originalLastModificationDate:originalSize:originalCRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]");
  id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm"];
  id v16 = (objc_class *)objc_opt_class();
  unsigned int v17 = NSStringFromClass(v16);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 837, 0, "Abstract method not overridden by %{public}@", v17);

  +[TSUAssertionHandler logBacktraceThrottled];
  id v18 = (objc_class *)objc_opt_class();
  id v19 = NSStringFromClass(v18);
  id v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v19, "-[TSPPackageWriter newRawDataWriteChannelForRelativePath:originalLastModificationDate:originalSize:originalCRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]");
  id v21 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v20 userInfo:0];

  objc_exception_throw(v21);
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSURL)documentTargetURL
{
  return self->_documentTargetURL;
}

- (NSURL)relativeURLForExternalData
{
  return self->_relativeURLForExternalData;
}

- (int64_t)updateType
{
  return self->_updateType;
}

- (TSPDocumentSaveValidationPolicy)documentSaveValidationPolicy
{
  return self->_documentSaveValidationPolicy;
}

- (SFUCryptoKey)encryptionKey
{
  return self->_encryptionKey;
}

- (TSUZipFileWriter)zipArchiveWriter
{
  return self->_zipArchiveWriter;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_zipArchiveWriter, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_documentSaveValidationPolicy, 0);
  objc_storeStrong((id *)&self->_relativeURLForExternalData, 0);
  objc_storeStrong((id *)&self->_documentTargetURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_writtenPackage, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_errorQueue, 0);
  objc_storeStrong((id *)&self->_componentWriteChannel, 0);
  objc_destroyWeak((id *)&self->_fileCoordinatorDelegate);
  objc_storeStrong((id *)&self->_originalSupportPackage, 0);
  objc_storeStrong((id *)&self->_originalDocumentPackage, 0);
  objc_storeStrong((id *)&self->_documentMetadata, 0);
}

@end