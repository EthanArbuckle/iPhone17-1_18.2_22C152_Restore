@interface TSPDirectoryPackageWriter
- (BOOL)writeData:(id)a3 toRelativePath:(id)a4 allowEncryption:(BOOL)a5 error:(id *)a6;
- (CGDataConsumer)newCGDataConsumerAtRelativePath:(id)a3;
- (TSPDirectoryPackageWriter)initWithURL:(id)a3 documentTargetURL:(id)a4 relativeURLForExternalData:(id)a5 packageIdentifier:(unsigned __int8)a6 documentProperties:(id)a7 documentMetadata:(id)a8 fileFormatVersion:(unint64_t)a9 updateType:(int64_t)a10 cloneMode:(BOOL)a11 documentSaveValidationPolicy:(id)a12 encryptionKey:(id)a13 originalDocumentPackage:(id)a14 originalSupportPackage:(id)a15 fileCoordinatorDelegate:(id)a16 progress:(id)a17 error:(id *)a18;
- (id)linkOrCopyData:(id)a3 fromURL:(id)a4 fromTemporaryLocation:(BOOL)a5 decryptionInfo:(id)a6 preferredFilename:(id)a7 error:(id *)a8;
- (id)newPackageWithPackageIdentifier:(unsigned __int8)a3 documentProperties:(id)a4 fileFormatVersion:(unint64_t)a5 decryptionKey:(id)a6 fileCoordinatorDelegate:(id)a7;
- (id)newRawComponentWriteChannelWithPackageLocator:(id)a3 storeOutsideObjectArchive:(BOOL)a4;
- (id)newRawDataWriteChannelForRelativePath:(id)a3 originalLastModificationDate:(id)a4 originalSize:(unint64_t)a5 originalCRC:(unsigned int)a6 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a7;
- (id)packageEntryInfoForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4 packageURL:(id)a5;
- (id)targetDataURLForPath:(id)a3;
@end

@implementation TSPDirectoryPackageWriter

- (TSPDirectoryPackageWriter)initWithURL:(id)a3 documentTargetURL:(id)a4 relativeURLForExternalData:(id)a5 packageIdentifier:(unsigned __int8)a6 documentProperties:(id)a7 documentMetadata:(id)a8 fileFormatVersion:(unint64_t)a9 updateType:(int64_t)a10 cloneMode:(BOOL)a11 documentSaveValidationPolicy:(id)a12 encryptionKey:(id)a13 originalDocumentPackage:(id)a14 originalSupportPackage:(id)a15 fileCoordinatorDelegate:(id)a16 progress:(id)a17 error:(id *)a18
{
  unsigned int v45 = a6;
  id v22 = a3;
  id v51 = a4;
  id v52 = a5;
  id v53 = a7;
  id v54 = a8;
  id v55 = a12;
  id v56 = a13;
  id v57 = a14;
  id v23 = a15;
  id v24 = a16;
  id v25 = a17;
  v26 = +[NSFileManager defaultManager];
  id v63 = 0;
  v27 = v22;
  LODWORD(v22) = [v26 createDirectoryAtURL:v22 withIntermediateDirectories:1 attributes:0 error:&v63];
  id v28 = v63;
  if (!v22)
  {
    if (UnsafePointer != -1) {
      dispatch_once(&UnsafePointer, &stru_1001C6940);
    }
    v29 = UnsafePointer;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      id v48 = (id)objc_claimAutoreleasedReturnValue();
      v36 = [v28 domain];
      id v37 = [v28 code];
      *(_DWORD *)buf = 138413314;
      v65 = v27;
      __int16 v66 = 2114;
      id v67 = v48;
      __int16 v68 = 2114;
      v69 = v36;
      __int16 v70 = 2048;
      id v71 = v37;
      __int16 v72 = 2112;
      id v73 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v29, OS_LOG_TYPE_ERROR, "Failed to create document directory. URL=%@, error=errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
    }
    goto LABEL_20;
  }
  v29 = [v27 URLByAppendingPathComponent:@"Data" isDirectory:1];

  id v62 = 0;
  unsigned __int8 v30 = [v26 createDirectoryAtURL:v29 withIntermediateDirectories:0 attributes:0 error:&v62];
  id v28 = v62;
  if ((v30 & 1) == 0)
  {
    if (UnsafePointer != -1) {
      dispatch_once(&UnsafePointer, &stru_1001C6920);
    }
    v38 = UnsafePointer;
    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
    {
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      id v49 = (id)objc_claimAutoreleasedReturnValue();
      v46 = [v28 domain];
      id v42 = [v28 code];
      *(_DWORD *)buf = 138413314;
      v65 = v29;
      __int16 v66 = 2114;
      id v67 = v49;
      __int16 v68 = 2114;
      v69 = v46;
      __int16 v70 = 2048;
      id v71 = v42;
      __int16 v72 = 2112;
      id v73 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v38, OS_LOG_TYPE_ERROR, "Failed to create data directory in document package. URL=%@, error=errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
    }
    goto LABEL_20;
  }

  v29 = [v27 URLByAppendingPathComponent:@"Metadata" isDirectory:1];

  id v61 = 0;
  unsigned __int8 v31 = [v26 createDirectoryAtURL:v29 withIntermediateDirectories:0 attributes:0 error:&v61];
  id v28 = v61;
  if ((v31 & 1) == 0)
  {
    if (UnsafePointer != -1) {
      dispatch_once(&UnsafePointer, &stru_1001C6960);
    }
    v39 = UnsafePointer;
    if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
    {
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      id v50 = (id)objc_claimAutoreleasedReturnValue();
      v47 = [v28 domain];
      id v44 = [v28 code];
      *(_DWORD *)buf = 138413314;
      v65 = v29;
      __int16 v66 = 2114;
      id v67 = v50;
      __int16 v68 = 2114;
      v69 = v47;
      __int16 v70 = 2048;
      id v71 = v44;
      __int16 v72 = 2112;
      id v73 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v39, OS_LOG_TYPE_ERROR, "Failed to create metadata directory in document package. URL=%@, error=errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
    }
LABEL_20:

    goto LABEL_21;
  }

  v59.receiver = self;
  v59.super_class = (Class)TSPDirectoryPackageWriter;
  id v60 = 0;
  v32 = -[TSPPackageWriter initWithURL:documentTargetURL:relativeURLForExternalData:packageIdentifier:documentProperties:documentMetadata:fileFormatVersion:updateType:cloneMode:documentSaveValidationPolicy:encryptionKey:originalDocumentPackage:originalSupportPackage:fileCoordinatorDelegate:progress:error:](&v59, "initWithURL:documentTargetURL:relativeURLForExternalData:packageIdentifier:documentProperties:documentMetadata:fileFormatVersion:updateType:cloneMode:documentSaveValidationPolicy:encryptionKey:originalDocumentPackage:originalSupportPackage:fileCoordinatorDelegate:progress:error:", v27, v51, v52, v45, v53, v54, a9, a10, a11, v55, v56, v57, v23, v24, v25,
          &v60);
  id v28 = v60;
  if (v32)
  {
    v33 = [[TSPDirectoryPackageDataWriter alloc] initWithURL:v27];
    dataWriter = v32->_dataWriter;
    v32->_dataWriter = v33;

    goto LABEL_24;
  }
LABEL_21:
  if (a18)
  {
    +[NSError tsp_ensureSaveErrorWithError:v28];
    v32 = 0;
    *a18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
LABEL_24:

  return v32;
}

- (id)packageEntryInfoForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4 packageURL:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v6)
  {
    v29.receiver = self;
    v29.super_class = (Class)TSPDirectoryPackageWriter;
    v21 = [(TSPPackageWriter *)&v29 packageEntryInfoForComponentLocator:v8 isStoredOutsideObjectArchive:0 packageURL:v9];
    goto LABEL_26;
  }
  if (!v8)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6980);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100161E84();
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDirectoryPackageWriter packageEntryInfoForComponentLocator:isStoredOutsideObjectArchive:packageURL:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackageWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 117, 0, "Invalid parameter not satisfying: %{public}s", "locator");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (!v9)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C69A0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100161DF0();
    }
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDirectoryPackageWriter packageEntryInfoForComponentLocator:isStoredOutsideObjectArchive:packageURL:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackageWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 118, 0, "Invalid parameter not satisfying: %{public}s", "packageURL");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v14 = +[TSPDirectoryPackage componentFileURLForPackageURL:v9 packageLocator:v8];
  id v33 = 0;
  id v32 = 0;
  unsigned int v15 = [v14 getResourceValue:&v33 forKey:NSURLFileSizeKey error:&v32];
  id v16 = v33;
  id v17 = v32;
  if (!v15)
  {
    id v19 = 0;
LABEL_20:
    if (UnsafePointer != -1) {
      dispatch_once(&UnsafePointer, &stru_1001C69C0);
    }
    id v22 = UnsafePointer;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
    {
      id v24 = [v14 path];
      id v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = [v17 domain];
      id v28 = [v17 code];
      *(_DWORD *)buf = 138413314;
      v35 = v24;
      __int16 v36 = 2114;
      id v37 = v26;
      __int16 v38 = 2114;
      v39 = v27;
      __int16 v40 = 2048;
      id v41 = v28;
      __int16 v42 = 2112;
      id v43 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_ERROR, "Failed to retrieve encoded length and last modification date for path: %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
    }
    v21 = 0;
    id v20 = v17;
    goto LABEL_25;
  }
  id v31 = 0;
  id v30 = 0;
  unsigned int v18 = [v14 getResourceValue:&v31 forKey:NSURLContentModificationDateKey error:&v30];
  id v19 = v31;
  id v20 = v30;

  if (!v18)
  {
    id v17 = v20;
    goto LABEL_20;
  }
  v21 = -[TSPPackageEntryInfo initWithEncodedLength:lastModificationDate:CRC:]([TSPPackageEntryInfo alloc], "initWithEncodedLength:lastModificationDate:CRC:", [v16 unsignedLongLongValue], v19, 0);
LABEL_25:

LABEL_26:
  return v21;
}

- (id)newRawComponentWriteChannelWithPackageLocator:(id)a3 storeOutsideObjectArchive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v4)
  {
    if (!v6)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C69E0);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100161F18();
      }
      id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDirectoryPackageWriter newRawComponentWriteChannelWithPackageLocator:storeOutsideObjectArchive:]");
      id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackageWriter.mm"];
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 140, 0, "invalid nil value for '%{public}s'", "packageLocator");

      +[TSUAssertionHandler logBacktraceThrottled];
    }
    v10 = [(TSPPackageWriter *)self URL];
    v11 = +[TSPDirectoryPackage componentFileURLForPackageURL:v10 packageLocator:v7];

    v12 = +[NSFileManager defaultManager];
    v13 = [v11 URLByDeletingLastPathComponent];
    id v25 = 0;
    unsigned int v14 = [v12 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v25];
    id v15 = v25;

    if (v14)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000233E4;
      v24[3] = &unk_1001C6A08;
      v24[4] = self;
      id v16 = [[TSPDirectoryPackageWriterComponentFileWriteChannel alloc] initWithURL:v11 handler:v24];
    }
    else
    {
      [(TSPPackageWriter *)self setError:v15];
      if (UnsafePointer != -1) {
        dispatch_once(&UnsafePointer, &stru_1001C6A28);
      }
      id v17 = UnsafePointer;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        id v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = [v15 domain];
        id v22 = [v15 code];
        *(_DWORD *)buf = 138413314;
        v27 = v7;
        __int16 v28 = 2114;
        id v29 = v20;
        __int16 v30 = 2114;
        id v31 = v21;
        __int16 v32 = 2048;
        id v33 = v22;
        __int16 v34 = 2112;
        id v35 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_ERROR, "Failed to create intermediate directories for component file %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
      }
      id v16 = 0;
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)TSPDirectoryPackageWriter;
    id v16 = [(TSPPackageWriter *)&v23 newRawComponentWriteChannelWithPackageLocator:v6 storeOutsideObjectArchive:0];
  }

  return v16;
}

- (id)targetDataURLForPath:(id)a3
{
  id v4 = a3;
  v5 = [(TSPPackageWriter *)self URL];
  id v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:0];

  return v6;
}

- (id)linkOrCopyData:(id)a3 fromURL:(id)a4 fromTemporaryLocation:(BOOL)a5 decryptionInfo:(id)a6 preferredFilename:(id)a7 error:(id *)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v50 = a4;
  id v15 = a6;
  v47 = v14;
  id v48 = a7;
  id v16 = -[TSPPackageWriter filenameForData:preferredFilename:](self, "filenameForData:preferredFilename:", v14);
  [@"Data" stringByAppendingPathComponent:v16];
  id v49 = v17 = v11;
  unsigned int v18 = -[TSPDirectoryPackageWriter targetDataURLForPath:](self, "targetDataURLForPath:");
  uint64_t v53 = 0;
  id v19 = [(TSPPackageWriter *)self encryptionKey];
  if (UnsafePointer(v15, v19, (id)0x100000))
  {
    UnsafePointer(v19, 0x100000);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v20 = [v15 mutableCryptoInfoCopy];
  }
  v21 = v20;
  if (!+[TSPFileManager linkOrCopyItemAtURL:v50 decryptionInfo:v15 toURL:v18 encryptionInfo:v20 canLink:[(TSPPackageWriter *)self canLinkData] encodedLength:&v53 error:a8])goto LABEL_22; {
  id v22 = [(TSPPackageWriter *)self documentSaveValidationPolicy];
  }
  unsigned int v23 = [v22 updateDataModificationDate];

  if (v23)
  {
    id v24 = +[NSDate date];
    id v52 = 0;
    unsigned __int8 v25 = [v18 setResourceValue:v24 forKey:NSURLContentModificationDateKey error:&v52];
    id v45 = v52;

    if (v25)
    {
      int v26 = 1;
    }
    else
    {
      __int16 v28 = [(TSPPackageWriter *)self documentSaveValidationPolicy];
      unsigned int v29 = [v28 failToSaveIfUpdateDataModificationDateFails];

      if (v29)
      {
        int v26 = 0;
        if (a8) {
          *a8 = v45;
        }
      }
      else
      {
        int v26 = 1;
      }
      if (UnsafePointer != -1) {
        dispatch_once(&UnsafePointer, &stru_1001C6A48);
      }
      __int16 v30 = UnsafePointer;
      if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
      {
        id v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        id v43 = [v45 domain];
        id v38 = [v45 code];
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)id v55 = v26;
        *(_WORD *)&v55[4] = 2112;
        *(void *)&v55[6] = v18;
        *(_WORD *)&v55[14] = 2114;
        *(void *)&v55[16] = v44;
        *(_WORD *)&v55[24] = 2114;
        *(void *)&v55[26] = v43;
        *(_WORD *)&v55[34] = 2048;
        *(void *)&v55[36] = v38;
        *(_WORD *)&v55[44] = 2112;
        *(void *)&v55[46] = v45;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v30, OS_LOG_TYPE_ERROR, "Could not set modificationDate. success=%d targetURL=%@ errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x3Au);
      }
    }

    BOOL v27 = v26 != 0;
    if (!v26) {
      goto LABEL_21;
    }
  }
  else
  {
    BOOL v27 = 1;
  }
  if (v17 && (UnsafePointer(v15, v21) & 1) == 0)
  {
    id v51 = 0;
    unsigned __int8 v32 = [v18 setResourceValue:&__kCFBooleanFalse forKey:NSURLIsExcludedFromBackupKey error:&v51];
    id v33 = v51;
    if ((v32 & 1) == 0)
    {
      if (UnsafePointer != -1) {
        dispatch_once(&UnsafePointer, &stru_1001C6A68);
      }
      __int16 v34 = UnsafePointer;
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
      {
        v39 = [v18 path];
        __int16 v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        id v41 = [v33 domain];
        id v42 = [v33 code];
        *(_DWORD *)buf = 138413314;
        *(void *)id v55 = v39;
        *(_WORD *)&v55[8] = 2114;
        *(void *)&v55[10] = v46;
        *(_WORD *)&v55[18] = 2114;
        *(void *)&v55[20] = v41;
        *(_WORD *)&v55[28] = 2048;
        *(void *)&v55[30] = v42;
        *(_WORD *)&v55[38] = 2112;
        *(void *)&v55[40] = v33;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v34, OS_LOG_TYPE_ERROR, "Failed to update attributes for data at URL %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
      }
    }

    goto LABEL_30;
  }
LABEL_21:
  if (!v27)
  {
LABEL_22:
    id v31 = 0;
    goto LABEL_31;
  }
LABEL_30:
  id v35 = [TSPPackageWriterCopyDataResult alloc];
  id v31 = [(TSPPackageWriterCopyDataResult *)v35 initWithFilename:v16 encryptionInfo:v21 encodedLength:v53];
LABEL_31:

  return v31;
}

- (BOOL)writeData:(id)a3 toRelativePath:(id)a4 allowEncryption:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (v7
    && ([(TSPPackageWriter *)self encryptionKey],
        v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    v16.receiver = self;
    v16.super_class = (Class)TSPDirectoryPackageWriter;
    unsigned __int8 v13 = [(TSPPackageWriter *)&v16 writeData:v10 toRelativePath:v11 allowEncryption:1 error:a6];
  }
  else
  {
    unsigned __int8 v13 = [(TSPDirectoryPackageDataWriter *)self->_dataWriter writeData:v10 toRelativePath:v11 allowEncryption:v7 error:a6];
  }
  BOOL v14 = v13;

  return v14;
}

- (CGDataConsumer)newCGDataConsumerAtRelativePath:(id)a3
{
  return [(TSPDirectoryPackageDataWriter *)self->_dataWriter newCGDataConsumerAtRelativePath:a3];
}

- (id)newPackageWithPackageIdentifier:(unsigned __int8)a3 documentProperties:(id)a4 fileFormatVersion:(unint64_t)a5 decryptionKey:(id)a6 fileCoordinatorDelegate:(id)a7
{
  uint64_t v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  BOOL v14 = [(TSPPackage *)[TSPDirectoryPackage alloc] initWithPackageIdentifier:v10 documentProperties:v11 fileFormatVersion:a5 decryptionKey:v12 fileCoordinatorDelegate:v13 isLazyLoading:0];

  return v14;
}

- (id)newRawDataWriteChannelForRelativePath:(id)a3 originalLastModificationDate:(id)a4 originalSize:(unint64_t)a5 originalCRC:(unsigned int)a6 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a7
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6A88);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100161FAC();
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDirectoryPackageWriter newRawDataWriteChannelForRelativePath:originalLastModificationDate:originalSize:originalCRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackageWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 236, 0, "invalid nil value for '%{public}s'", "path");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  id v13 = [(TSPDirectoryPackageWriter *)self targetDataURLForPath:v9];
  BOOL v14 = [v13 URLByDeletingLastPathComponent];
  id v15 = +[NSFileManager defaultManager];
  id v25 = 0;
  unsigned int v16 = [v15 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:&v25];
  id v17 = v25;

  if (v16)
  {
    id v18 = [[TSUFileIOChannel alloc] initForStreamWritingURL:v13 error:0];
  }
  else
  {
    if (UnsafePointer != -1) {
      dispatch_once(&UnsafePointer, &stru_1001C6AA8);
    }
    id v19 = UnsafePointer;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v23 = [v17 domain];
      id v24 = [v17 code];
      *(_DWORD *)buf = 138413314;
      BOOL v27 = v14;
      __int16 v28 = 2114;
      id v29 = v22;
      __int16 v30 = 2114;
      id v31 = v23;
      __int16 v32 = 2048;
      id v33 = v24;
      __int16 v34 = 2112;
      id v35 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_ERROR, "Couldn't create directory at URL %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
    }
    id v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
}

@end