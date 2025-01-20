@interface TSPFilePackageWriter
- (TSPFilePackageWriter)initWithURL:(id)a3 documentTargetURL:(id)a4 relativeURLForExternalData:(id)a5 packageIdentifier:(unsigned __int8)a6 documentProperties:(id)a7 documentMetadata:(id)a8 fileFormatVersion:(unint64_t)a9 updateType:(int64_t)a10 cloneMode:(BOOL)a11 documentSaveValidationPolicy:(id)a12 encryptionKey:(id)a13 originalDocumentPackage:(id)a14 originalSupportPackage:(id)a15 fileCoordinatorDelegate:(id)a16 progress:(id)a17 error:(id *)a18;
- (id)componentZipArchiveWriter;
- (id)newPackageWithPackageIdentifier:(unsigned __int8)a3 documentProperties:(id)a4 fileFormatVersion:(unint64_t)a5 decryptionKey:(id)a6 fileCoordinatorDelegate:(id)a7;
- (id)newRawDataWriteChannelForRelativePath:(id)a3 originalLastModificationDate:(id)a4 originalSize:(unint64_t)a5 originalCRC:(unsigned int)a6 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a7;
- (id)zipArchiveWriter;
- (void)closeWithQueue:(id)a3 completion:(id)a4;
- (void)finalizeComponentAndDataSectionWithCompletionHandler:(id)a3;
- (void)truncateZipAtFirstDeletedData:(id)a3;
- (void)willWriteData:(id)a3;
@end

@implementation TSPFilePackageWriter

- (TSPFilePackageWriter)initWithURL:(id)a3 documentTargetURL:(id)a4 relativeURLForExternalData:(id)a5 packageIdentifier:(unsigned __int8)a6 documentProperties:(id)a7 documentMetadata:(id)a8 fileFormatVersion:(unint64_t)a9 updateType:(int64_t)a10 cloneMode:(BOOL)a11 documentSaveValidationPolicy:(id)a12 encryptionKey:(id)a13 originalDocumentPackage:(id)a14 originalSupportPackage:(id)a15 fileCoordinatorDelegate:(id)a16 progress:(id)a17 error:(id *)a18
{
  unsigned int v73 = a6;
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a7;
  id v65 = a8;
  id v26 = a12;
  id v27 = v22;
  id v28 = a13;
  id v29 = a14;
  id v30 = a15;
  id v31 = a16;
  v78.receiver = self;
  v78.super_class = (Class)TSPFilePackageWriter;
  id v79 = 0;
  id v67 = a17;
  v63 = v30;
  v64 = v31;
  id v60 = v30;
  v32 = v27;
  v62 = v29;
  v61 = v26;
  v72 = v24;
  v33 = -[TSPPackageWriter initWithURL:documentTargetURL:relativeURLForExternalData:packageIdentifier:documentProperties:documentMetadata:fileFormatVersion:updateType:cloneMode:documentSaveValidationPolicy:encryptionKey:originalDocumentPackage:originalSupportPackage:fileCoordinatorDelegate:progress:error:](&v78, "initWithURL:documentTargetURL:relativeURLForExternalData:packageIdentifier:documentProperties:documentMetadata:fileFormatVersion:updateType:cloneMode:documentSaveValidationPolicy:encryptionKey:originalDocumentPackage:originalSupportPackage:fileCoordinatorDelegate:progress:error:", v27, v23, v24, v73, v25, v65, a9, a10, a11, v26, v28, v29, v60, v31, v67,
          &v79);
  id v34 = v79;
  id v35 = v34;
  if (v33 && a11)
  {

    id v77 = 0;
    v36 = [[TSUSafeSaveAssistant alloc] initForSavingToURL:v32 error:&v77];
    id v37 = v77;
    safeSaveAssistant = v33->_safeSaveAssistant;
    v33->_safeSaveAssistant = v36;

    if (v33->_safeSaveAssistant)
    {
      v39 = [TSUZipFileWriter alloc];
      v40 = [(TSUSafeSaveAssistant *)v33->_safeSaveAssistant writeURL];
      id v76 = v37;
      v41 = [(TSUZipFileWriter *)v39 initWithURL:v40 error:&v76];
      id v35 = v76;

      delayedZipArchiveWriter = v33->_delayedZipArchiveWriter;
      v33->_delayedZipArchiveWriter = v41;

      if (v33->_delayedZipArchiveWriter) {
        goto LABEL_19;
      }
      if (UnsafePointer != -1) {
        dispatch_once(&UnsafePointer, &stru_1001C6640);
      }
      v43 = UnsafePointer;
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
      {
        v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        id v70 = (id)objc_claimAutoreleasedReturnValue();
        v45 = [v35 domain];
        id v68 = [v35 code];
        unsigned int v46 = objc_msgSend(v35, "tsp_isRecoverable");
        uint64_t v47 = objc_msgSend(v35, "tsp_hintsDescription");
        v48 = (void *)v47;
        CFStringRef v49 = &stru_1001D3790;
        *(_DWORD *)buf = 138544642;
        id v81 = v70;
        __int16 v82 = 2114;
        if (v46) {
          CFStringRef v49 = @"recoverable=YES, ";
        }
        v83 = v45;
        __int16 v84 = 2048;
        id v85 = v68;
        __int16 v86 = 2114;
        CFStringRef v87 = v49;
        __int16 v88 = 2114;
        uint64_t v89 = v47;
        __int16 v90 = 2112;
        id v91 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v43, OS_LOG_TYPE_ERROR, "Failed to create delayed zip writer. error=errorClass=%{public}@, domain=%{public}@, code=%zd, %{public}@hints=%{public}@ (%@) ", buf, 0x3Eu);
      }
    }
    else
    {
      if (UnsafePointer != -1) {
        dispatch_once(&UnsafePointer, &stru_1001C6660);
      }
      v43 = UnsafePointer;
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
      {
        v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        id v71 = (id)objc_claimAutoreleasedReturnValue();
        v55 = [v37 domain];
        id v69 = [v37 code];
        unsigned int v56 = objc_msgSend(v37, "tsp_isRecoverable");
        uint64_t v57 = objc_msgSend(v37, "tsp_hintsDescription");
        v58 = (void *)v57;
        CFStringRef v59 = &stru_1001D3790;
        *(_DWORD *)buf = 138544642;
        id v81 = v71;
        __int16 v82 = 2114;
        if (v56) {
          CFStringRef v59 = @"recoverable=YES, ";
        }
        v83 = v55;
        __int16 v84 = 2048;
        id v85 = v69;
        __int16 v86 = 2114;
        CFStringRef v87 = v59;
        __int16 v88 = 2114;
        uint64_t v89 = v57;
        __int16 v90 = 2112;
        id v91 = v37;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v43, OS_LOG_TYPE_ERROR, "Failed to create safe save assistant. error=errorClass=%{public}@, domain=%{public}@, code=%zd, %{public}@hints=%{public}@ (%@) ", buf, 0x3Eu);
      }
      id v35 = v37;
    }

    v50 = v33;
    v51 = dispatch_get_global_queue(0, 0);
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_10002003C;
    v74[3] = &unk_1001C66A8;
    v52 = v50;
    v75 = v52;
    [(TSPFilePackageWriter *)v52 closeWithQueue:v51 completion:v74];

    v33 = 0;
  }
  if (a18 && !v33)
  {
    +[NSError tsp_ensureSaveErrorWithError:v35];
    v33 = 0;
    *a18 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_19:

  return v33;
}

- (id)newPackageWithPackageIdentifier:(unsigned __int8)a3 documentProperties:(id)a4 fileFormatVersion:(unint64_t)a5 decryptionKey:(id)a6 fileCoordinatorDelegate:(id)a7
{
  uint64_t v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  v14 = [(TSPPackage *)[TSPFilePackage alloc] initWithPackageIdentifier:v10 documentProperties:v11 fileFormatVersion:a5 decryptionKey:v12 fileCoordinatorDelegate:v13 isLazyLoading:0];

  return v14;
}

- (id)newRawDataWriteChannelForRelativePath:(id)a3 originalLastModificationDate:(id)a4 originalSize:(unint64_t)a5 originalCRC:(unsigned int)a6 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  if (!v12)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C66C8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100161A9C();
    }
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPFilePackageWriter newRawDataWriteChannelForRelativePath:originalLastModificationDate:originalSize:originalCRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]");
    v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPFilePackageWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 116, 0, "invalid nil value for '%{public}s'", "path");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v16 = [(TSPFilePackageWriter *)self zipArchiveWriter];
  [v16 beginEntryWithName:v12 force32BitSize:0 lastModificationDate:v13 size:a5 CRC:v8 forceCalculatingSizeAndCRCForPreservingLastModificationDate:v7];

  v17 = [TSPZipFileWriteChannel alloc];
  v18 = [(TSPFilePackageWriter *)self zipArchiveWriter];
  v19 = [(TSPZipFileWriteChannel *)v17 initWithArchiveWriter:v18];

  return v19;
}

- (id)componentZipArchiveWriter
{
  delayedZipArchiveWriter = self->_delayedZipArchiveWriter;
  if (delayedZipArchiveWriter)
  {
    v3 = delayedZipArchiveWriter;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSPFilePackageWriter;
    v3 = [(TSPPackageWriter *)&v5 componentZipArchiveWriter];
  }
  return v3;
}

- (id)zipArchiveWriter
{
  if (self->_onlyWriteToDelayedZipArchive)
  {
    delayedZipArchiveWriter = self->_delayedZipArchiveWriter;
    if (delayedZipArchiveWriter)
    {
      v3 = delayedZipArchiveWriter;
      goto LABEL_7;
    }
    [(TSPPackageWriter *)&v6 zipArchiveWriter];
  }
  else
  {
    [(TSPPackageWriter *)&v5 zipArchiveWriter];
  }
  v3 = (TSUZipFileWriter *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  return v3;
}

- (void)truncateZipAtFirstDeletedData:(id)a3
{
  id v4 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100020958;
  v20[3] = &unk_1001C6710;
  v20[4] = self;
  id v5 = [v4 mutableCopy];
  id v21 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v20];
  id v6 = v5;

  v19.receiver = self;
  v19.super_class = (Class)TSPFilePackageWriter;
  v18 = [(TSPPackageWriter *)&v19 zipArchiveWriter];
  id v7 = [v18 entriesCount];
  BOOL onlyWriteToDelayedZipArchive = self->_onlyWriteToDelayedZipArchive;
  v9 = [v18 sortedEntries];
  unint64_t v10 = 0;
  if (v7) {
    BOOL v11 = !onlyWriteToDelayedZipArchive;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v12 = 0;
  }
  while (v10 < (unint64_t)[v9 count] && v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = [v9 objectAtIndexedSubscript:v10];
    v14 = [(TSPPackageWriter *)self dataForZipEntry:v13 inDataToWrite:v6];
    BOOL v15 = v14 == 0;

    if (v15)
    {
      if (UnsafePointer != -1) {
        dispatch_once(&UnsafePointer, &stru_1001C6730);
      }
      v16 = UnsafePointer;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = [v13 name];
        *(_DWORD *)buf = 138412546;
        id v23 = v17;
        __int16 v24 = 2048;
        unint64_t v25 = v10;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEBUG, "TSPData %@ not found in existing zip, will truncate at index %lu", buf, 0x16u);
      }
      uint64_t v12 = v10;
    }
    else
    {
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }

    ++v10;
  }
  if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
    [v18 truncateToNumberOfEntries:v12 completion:&stru_1001C6770];
  }
}

- (void)willWriteData:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_delayedZipArchiveWriter)
  {
    id v18 = v4;
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    uint64_t v17 = 144;
    unint64_t v9 = 0;
    if (v8)
    {
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v13 = objc_msgSend(v12, "lengthIfLocal", v17);
          v14 = [v12 packageLocator];
          BOOL v15 = v14 == 0;

          if (!v15)
          {
            v16 = [v12 packageLocator];
            [v6 setObject:v12 forKeyedSubscript:v16];
          }
          v9 += (unint64_t)v13;
        }
        id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    if (v9 < (unint64_t)[*(id *)((char *)&self->super.super.isa + v17) archiveLength])
    {
      self->_BOOL onlyWriteToDelayedZipArchive = 1;
      [v6 removeAllObjects];
    }
    -[TSPFilePackageWriter truncateZipAtFirstDeletedData:](self, "truncateZipAtFirstDeletedData:", v6, v17);

    id v5 = v18;
  }
}

- (void)finalizeComponentAndDataSectionWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  [(TSPPackageWriter *)self closeCurrentChannel];
  delayedZipArchiveWriter = self->_delayedZipArchiveWriter;
  if (delayedZipArchiveWriter && [(TSUZipWriter *)delayedZipArchiveWriter entriesCount])
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    id v6 = [(TSPPackageWriter *)self progress];
    if (v6)
    {
      id v7 = [(TSPFilePackageWriter *)self componentZipArchiveWriter];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100021374;
      v21[3] = &unk_1001C67B8;
      v21[4] = self;
      v21[5] = &v22;
      [v7 enumerateEntriesUsingBlock:v21];

      if (self->_onlyWriteToDelayedZipArchive)
      {
        objc_msgSend(v6, "becomeCurrentWithPendingUnitCount:", objc_msgSend(v6, "tsu_pendingUnitCountForIncompleteProgress:", v23[3]));
        id v8 = +[NSProgress progressWithTotalUnitCount:1];
        [v8 setCompletedUnitCount:1];
        [v6 resignCurrent];

LABEL_9:
        v20.receiver = self;
        v20.super_class = (Class)TSPFilePackageWriter;
        unint64_t v9 = [(TSPPackageWriter *)&v20 zipArchiveWriter];
        id v10 = [v9 entriesCount];

        if (v10)
        {
          +[TSUAssertionHandler _atomicIncrementAssertCount];
          if (TSUAssertCat_init_token != -1) {
            dispatch_once(&TSUAssertCat_init_token, &stru_1001C67D8);
          }
          if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
            sub_100161B90();
          }
          BOOL v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPFilePackageWriter finalizeComponentAndDataSectionWithCompletionHandler:]");
          uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPFilePackageWriter.mm"];
          +[TSUAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:247 isFatal:0 description:"Only the delayed zip archive writer should have entries"];

          +[TSUAssertionHandler logBacktraceThrottled];
        }
        if (v4) {
          v4[2](v4, 0);
        }
        goto LABEL_18;
      }
    }
    else if (self->_onlyWriteToDelayedZipArchive)
    {
      goto LABEL_9;
    }
    id v13 = self->_delayedZipArchiveWriter;
    v14 = dispatch_get_global_queue(0, 0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000214B8;
    v15[3] = &unk_1001C6828;
    id v16 = v6;
    long long v19 = &v22;
    uint64_t v17 = self;
    id v18 = v4;
    [(TSUZipWriter *)v13 closeWithQueue:v14 completion:v15];

LABEL_18:
    _Block_object_dispose(&v22, 8);
    goto LABEL_19;
  }
  if (v4) {
    v4[2](v4, 0);
  }
LABEL_19:
}

- (void)closeWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000217F0;
  v12[3] = &unk_1001C68D8;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  v11.receiver = self;
  v11.super_class = (Class)TSPFilePackageWriter;
  id v9 = v6;
  id v10 = v7;
  [(TSPPackageWriter *)&v11 closeWithQueue:v8 completion:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeSaveAssistant, 0);
  objc_storeStrong((id *)&self->_delayedZipArchiveWriter, 0);
}

@end