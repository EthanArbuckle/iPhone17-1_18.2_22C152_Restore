@interface NSURL
+ (id)tsp_iWorkAVAssetURLWithUUID:(id)a3 filename:(id)a4 contentTypeUTI:(id)a5;
+ (id)tsu_fileURLWithPath:(id)a3;
+ (id)tsu_privacyContactsURL;
+ (id)tsu_urlFromUserProvidedTelephoneString:(id)a3 withDataDetector:(id)a4;
- (BOOL)tsp_isIWorkAVAssetURL;
- (BOOL)tsp_matchesURL:(id)a3;
- (BOOL)tsp_matchesURL:(id)a3 canCompareFileID:(BOOL)a4;
- (BOOL)tsu_canOpenURL;
- (BOOL)tsu_conformsToAnyUTI:(id)a3;
- (BOOL)tsu_conformsToUTI:(id)a3;
- (BOOL)tsu_fileSize:(unint64_t *)a3 error:(id *)a4;
- (BOOL)tsu_isFileSizeLargerThanMaxFileSize:(unint64_t)a3;
- (BOOL)tsu_isFileSizeTooLargeForBookPublishing;
- (BOOL)tsu_isFileSizeTooLargeForSharing;
- (BOOL)tsu_isInTemporaryDirectory;
- (BOOL)tsu_isInTrash;
- (BOOL)tsu_isOnForeignVolume;
- (BOOL)tsu_isOnSameVolumeAs:(id)a3;
- (BOOL)tsu_isVolumeKnownToBeEjectable;
- (BOOL)tsu_isVolumeKnownToBeLocal;
- (BOOL)tsu_isVolumeKnownToBeRemovable;
- (BOOL)tsu_matchesURL:(id)a3;
- (BOOL)tsu_matchesURL:(id)a3 canCompareFileID:(BOOL)a4;
- (BOOL)tsu_setNeedsDocumentIdentifierAndReturnError:(id *)a3;
- (BOOL)tsu_volumeRenameOpenFail;
- (BOOL)tsu_volumeSupportsCloning;
- (CGImageSource)tsu_createImageSourceFromURLAfterForcingFileCoordination;
- (NSString)tsu_UTI;
- (id)tsp_embeddedUTI;
- (id)tsp_fileIdentifier;
- (id)tsp_queryDictionary;
- (id)tsu_URLExceptPrivate;
- (id)tsu_contentModificationDateWithLogContext:(id)a3;
- (id)tsu_documentIdentifier;
- (id)tsu_fileTypeIdentifierHandlingFileCoordinationPromises;
- (id)tsu_pathExceptPrivate;
- (id)tsu_prettyStringFromTelephoneURL;
- (id)tsu_reachableFileURLByDeletingUnreachablePathComponents;
- (unint64_t)tsu_fileSize;
- (void)tsu_removeCachedResourceValueForKeys:(id)a3;
@end

@implementation NSURL

- (BOOL)tsp_isIWorkAVAssetURL
{
  v2 = [(NSURL *)self scheme];
  unsigned __int8 v3 = [v2 isEqualToString:@"iWorkAVAsset"];

  return v3;
}

- (BOOL)tsp_matchesURL:(id)a3
{
  return [(NSURL *)self tsu_matchesURL:a3 canCompareFileID:1];
}

- (BOOL)tsp_matchesURL:(id)a3 canCompareFileID:(BOOL)a4
{
  return [(NSURL *)self tsu_matchesURL:a3 canCompareFileID:a4];
}

+ (id)tsp_iWorkAVAssetURLWithUUID:(id)a3 filename:(id)a4 contentTypeUTI:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSURLComponents);
  [v10 setScheme:@"iWorkAVAsset"];
  [v10 setHost:v9];

  v11 = [@"/" stringByAppendingString:v8];

  [v10 setPath:v11];
  v12 = [@"uti=" stringByAppendingString:v7];

  [v10 setQuery:v12];
  v13 = [v10 URL];

  return v13;
}

- (id)tsp_embeddedUTI
{
  if (![(NSURL *)self tsp_isIWorkAVAssetURL])
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C54F8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015FAA8();
    }
    unsigned __int8 v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSURL(TSPersistence) tsp_embeddedUTI]");
    v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/NSURL_TSPersistence.m"];
    +[TSUAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:46 isFatal:0 description:"UTIs only provided within iWork-internal URLs"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v5 = [(NSURL *)self absoluteString];
  v6 = (char *)[v5 rangeOfString:@"uti="];
  uint64_t v8 = v7;
  if (!v7)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5518);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015FA14();
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSURL(TSPersistence) tsp_embeddedUTI]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/NSURL_TSPersistence.m"];
    +[TSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:49 isFatal:0 description:"Expected UTI in iWork URL!"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v11 = [v5 substringFromIndex:&v6[v8]];

  return v11;
}

- (id)tsp_fileIdentifier
{
  id v3 = 0;
  if ([(NSURL *)self checkResourceIsReachableAndReturnError:0])
  {
    id v9 = 0;
    id v8 = 0;
    unsigned __int8 v4 = [(NSURL *)self getResourceValue:&v9 forKey:NSURLFileResourceIdentifierKey error:&v8];
    id v3 = v9;
    id v5 = v8;
    if ((v4 & 1) == 0)
    {
      if (TSUDocumentLifecycleCat_init_token != -1) {
        dispatch_once(&TSUDocumentLifecycleCat_init_token, &stru_1001C5538);
      }
      v6 = TSUDocumentLifecycleCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUDocumentLifecycleCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_10015FB3C(v6, self, v5);
      }

      id v5 = v3;
      id v3 = 0;
    }
  }
  return v3;
}

- (id)tsp_queryDictionary
{
  v2 = [(NSURL *)self query];
  id v3 = [v2 componentsSeparatedByString:@"&"];

  id v4 = [v3 count];
  if (v4)
  {
    id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v4];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v16 = v3;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) componentsSeparatedByString:@"="];
          if ([v10 count] == (id)2)
          {
            v11 = [v10 objectAtIndexedSubscript:0];
            v12 = [v4 objectForKeyedSubscript:v11];

            if (!v12)
            {
              v13 = [v10 objectAtIndexedSubscript:1];
              v14 = [v13 stringByRemovingPercentEncoding];
              [v4 setObject:v14 forKeyedSubscript:v11];
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    id v3 = v16;
  }

  return v4;
}

- (id)tsu_documentIdentifier
{
  id v5 = 0;
  unsigned __int8 v2 = [(NSURL *)self getResourceValue:&v5 forKey:NSURLDocumentIdentifierKey error:0];
  id v3 = v5;
  if ((v2 & 1) == 0)
  {

    id v3 = 0;
  }
  return v3;
}

- (BOOL)tsu_isFileSizeLargerThanMaxFileSize:(unint64_t)a3
{
  return [(NSURL *)self tsu_fileSize] > a3;
}

- (BOOL)tsu_isFileSizeTooLargeForSharing
{
  return [(NSURL *)self tsu_isFileSizeLargerThanMaxFileSize:0x40000000];
}

- (BOOL)tsu_isFileSizeTooLargeForBookPublishing
{
  return [(NSURL *)self tsu_isFileSizeLargerThanMaxFileSize:0x80000000];
}

- (unint64_t)tsu_fileSize
{
  unint64_t v3 = 0;
  [(NSURL *)self tsu_fileSize:&v3 error:0];
  return v3;
}

- (BOOL)tsu_fileSize:(unint64_t *)a3 error:(id *)a4
{
  id v5 = self;
  [(NSURL *)self removeCachedResourceValueForKey:NSURLFileSizeKey];
  id v37 = 0;
  v26 = v5;
  LODWORD(v5) = [(NSURL *)v5 getResourceValue:&v37 forKey:NSURLFileSizeKey error:0];
  id v6 = v37;
  id v7 = v6;
  uint64_t v8 = 0;
  if (v5) {
    uint64_t v8 = (char *)[v6 unsignedLongLongValue];
  }
  id v9 = +[NSFileManager defaultManager];
  id v10 = [v9 enumeratorAtURL:v26 includingPropertiesForKeys:0 options:0 errorHandler:0];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v33 objects:v48 count:16];
  if (!v12)
  {
    char v15 = 1;
    goto LABEL_24;
  }
  id v13 = v12;
  v30 = a4;
  uint64_t v14 = *(void *)v34;
  char v15 = 1;
  do
  {
    v16 = 0;
    do
    {
      long long v17 = v7;
      if (*(void *)v34 != v14) {
        objc_enumerationMutation(v11);
      }
      long long v18 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v16);
      [v18 removeCachedResourceValueForKey:NSURLFileSizeKey];
      id v31 = 0;
      id v32 = 0;
      LODWORD(v18) = [v18 getResourceValue:&v32 forKey:NSURLFileSizeKey error:&v31];
      id v7 = v32;

      id v19 = v31;
      if (v18)
      {
        uint64_t v8 = &v8[(void)[v7 unsignedLongLongValue]];
        goto LABEL_17;
      }
      if (v15)
      {
        if (TSUDefaultCat_init_token != -1) {
          dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBDB8);
        }
        char v15 = (char)v30;
        long long v20 = TSUDefaultCat_log_t;
        if (!os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR))
        {
          if (!v30) {
            goto LABEL_17;
          }
LABEL_15:
          char v15 = 0;
          id *v30 = v19;
          goto LABEL_17;
        }
        log = v20;
        v21 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v21);
        v27 = [v19 domain];
        id v22 = [v19 code];
        *(_DWORD *)buf = 138413314;
        v39 = v26;
        __int16 v40 = 2114;
        v41 = v29;
        __int16 v42 = 2114;
        v43 = v27;
        __int16 v44 = 2048;
        id v45 = v22;
        __int16 v46 = 2112;
        id v47 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to get NSURLFileSizeKey for URL: \"%@\". errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);

        if (v30) {
          goto LABEL_15;
        }
      }
      else
      {
        char v15 = 0;
      }
LABEL_17:

      v16 = (char *)v16 + 1;
    }
    while (v13 != v16);
    id v23 = [v11 countByEnumeratingWithState:&v33 objects:v48 count:16];
    id v13 = v23;
  }
  while (v23);
LABEL_24:

  if (a3) {
    *a3 = (unint64_t)v8;
  }

  return v15 & 1;
}

- (BOOL)tsu_setNeedsDocumentIdentifierAndReturnError:(id *)a3
{
  int v4 = open([(NSURL *)self fileSystemRepresentation], 0x200000);
  if (v4 < 0)
  {
    int v6 = -1;
    if (!a3) {
      return v6 == 0;
    }
    goto LABEL_9;
  }
  int v5 = v4;
  memset(&v8, 0, sizeof(v8));
  int v6 = fstat(v4, &v8);
  if (!v6)
  {
    if ((v8.st_flags & 0x40) != 0) {
      int v6 = 0;
    }
    else {
      int v6 = fchflags(v5, v8.st_flags | 0x40);
    }
  }
  close(v5);
  if (a3)
  {
LABEL_9:
    if (v6)
    {
      *a3 = +[NSError tsu_fileReadPOSIXErrorWithNumber:*__error() userInfo:0];
    }
  }
  return v6 == 0;
}

- (id)tsu_fileTypeIdentifierHandlingFileCoordinationPromises
{
  id v4 = 0;
  [(NSURL *)self getResourceValue:&v4 forKey:NSURLTypeIdentifierKey error:0];
  id v2 = v4;
  return v2;
}

- (CGImageSource)tsu_createImageSourceFromURLAfterForcingFileCoordination
{
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  if (TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBDD8);
  }
  unint64_t v3 = TSUDefaultCat_log_t;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(NSURL *)self path];
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_INFO, "About to perform file coordination to create image source from %@:", buf, 0xCu);
  }
  id v5 = objc_alloc_init((Class)NSFileCoordinator);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100079FF0;
  v15[3] = &unk_1001CBE00;
  v15[4] = &v17;
  id v16 = 0;
  [v5 coordinateReadingItemAtURL:self options:0 error:&v16 byAccessor:v15];
  id v6 = v16;
  if (v6)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBE20);
    }
    id v7 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(NSURL *)self path];
      id v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v13 = [v6 domain];
      id v14 = [v6 code];
      *(_DWORD *)buf = 138413314;
      id v22 = v10;
      __int16 v23 = 2114;
      id v24 = v12;
      __int16 v25 = 2114;
      id v26 = v13;
      __int16 v27 = 2048;
      id v28 = v14;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_ERROR, "Failed to coordinate access to URL: %@ error: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
    }
  }
  stat v8 = (CGImageSource *)v18[3];

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (BOOL)tsu_isOnForeignVolume
{
  BOOL v3 = [(NSURL *)self isFileURL];
  if (v3)
  {
    memset(&v6, 0, 512);
    LOBYTE(v3) = !tsu_reachable_statfs(self, &v6)
              && (*(unsigned __int16 *)v6.f_fstypename == 26216 ? (BOOL v4 = v6.f_fstypename[2] == 115) : (BOOL v4 = 0), !v4)
              && (*(_DWORD *)v6.f_fstypename ^ 0x73667061 | v6.f_fstypename[4]) != 0;
  }
  return v3;
}

- (BOOL)tsu_volumeSupportsCloning
{
  long long v8 = xmmword_10017F760;
  uint64_t v9 = 0;
  BOOL v3 = [(NSURL *)self isFileURL];
  if (v3)
  {
    memset(&v10, 0, 512);
    int v7 = 0;
    memset(v6, 0, sizeof(v6));
    int v4 = tsu_reachable_statfs(self, &v10);
    LOBYTE(v3) = 0;
    if (!v4)
    {
      if (getattrlist(v10.f_mntonname, &v8, v6, 0x24uLL, 0x21u)) {
        LOBYTE(v3) = 0;
      }
      else {
        LOBYTE(v3) = BYTE10(v6[0]) & 1;
      }
    }
  }
  return v3;
}

- (BOOL)tsu_volumeRenameOpenFail
{
  if (![(NSURL *)self isFileURL]) {
    goto LABEL_4;
  }
  memset(&v10, 0, 512);
  int v3 = tsu_reachable_statfs(self, &v10);
  LOBYTE(v4) = 0;
  long long v8 = xmmword_10017F760;
  uint64_t v9 = 0;
  int v7 = 0;
  memset(v6, 0, sizeof(v6));
  if (!v3)
  {
    if (getattrlist(v10.f_mntonname, &v8, v6, 0x24uLL, 0x21u))
    {
LABEL_4:
      LOBYTE(v4) = 0;
      return v4;
    }
    return (BYTE10(v6[0]) >> 4) & 1;
  }
  return v4;
}

- (id)tsu_reachableFileURLByDeletingUnreachablePathComponents
{
  if ([(NSURL *)self isFileURL])
  {
    int v3 = self;
    while (1)
    {
      BOOL v4 = [(NSURL *)v3 path];
      id v5 = [v4 length];

      if ((unint64_t)v5 < 3) {
        break;
      }
      if ([(NSURL *)v3 checkResourceIsReachableAndReturnError:0])
      {
        statfs v6 = v3;
        int v3 = v6;
        if (v6) {
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v7 = [(NSURL *)v3 URLByDeletingLastPathComponent];

        int v3 = (NSURL *)v7;
      }
    }
    statfs v6 = 0;
LABEL_10:
  }
  else
  {
    statfs v6 = 0;
  }
  return v6;
}

- (BOOL)tsu_isOnSameVolumeAs:(id)a3
{
  id v4 = a3;
  id v5 = [(NSURL *)self tsu_reachableFileURLByDeletingUnreachablePathComponents];
  statfs v6 = objc_msgSend(v4, "tsu_reachableFileURLByDeletingUnreachablePathComponents");
  if ([v5 isFileURL] && objc_msgSend(v6, "isFileURL"))
  {
    memset(&v27, 0, sizeof(v27));
    memset(&v26, 0, sizeof(v26));
    id v7 = [v5 path];
    long long v8 = (const char *)[v7 fileSystemRepresentation];

    if (v8)
    {
      int v9 = lstat(v8, &v27);
      if (v9 == -1)
      {
        if (TSUDefaultCat_init_token != -1) {
          dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBE40);
        }
        statfs v10 = TSUDefaultCat_log_t;
        if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_INFO))
        {
          id v11 = v10;
          id v12 = [(NSURL *)self path];
          id v13 = __error();
          id v14 = strerror(*v13);
          *(_DWORD *)buf = 138412546;
          __int16 v29 = v12;
          __int16 v30 = 2082;
          id v31 = v14;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Error retrieving the file system of path %@: %{public}s", buf, 0x16u);
        }
        int v9 = -1;
      }
    }
    else
    {
      int v9 = -2;
    }
    id v16 = [v6 path];
    uint64_t v17 = (const char *)[v16 fileSystemRepresentation];

    if (v17)
    {
      int v18 = lstat(v17, &v26);
      if (v18 == -1)
      {
        if (TSUDefaultCat_init_token != -1) {
          dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBE60);
        }
        uint64_t v19 = TSUDefaultCat_log_t;
        if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = v19;
          v21 = [v4 path];
          id v22 = __error();
          __int16 v23 = strerror(*v22);
          *(_DWORD *)buf = 138412546;
          __int16 v29 = v21;
          __int16 v30 = 2082;
          id v31 = v23;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Error retrieving the file system of path %@: %{public}s", buf, 0x16u);
        }
        int v18 = -1;
      }
    }
    else
    {
      int v18 = -2;
    }
    if (v18 | v9) {
      BOOL v24 = 0;
    }
    else {
      BOOL v24 = v27.st_dev == v26.st_dev;
    }
    BOOL v15 = v24;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)tsu_isVolumeKnownToBeEjectable
{
  id v8 = 0;
  id v7 = 0;
  unsigned __int8 v2 = [(NSURL *)self getPromisedItemResourceValue:&v8 forKey:NSURLVolumeIsEjectableKey error:&v7];
  id v3 = v8;
  id v4 = v7;
  if ((v2 & 1) == 0)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBE80);
    }
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100164484();
    }

    id v3 = &__kCFBooleanFalse;
  }
  unsigned __int8 v5 = [v3 BOOLValue];

  return v5;
}

- (BOOL)tsu_isVolumeKnownToBeRemovable
{
  id v8 = 0;
  id v7 = 0;
  unsigned __int8 v2 = [(NSURL *)self getPromisedItemResourceValue:&v8 forKey:NSURLVolumeIsRemovableKey error:&v7];
  id v3 = v8;
  id v4 = v7;
  if ((v2 & 1) == 0)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBEA0);
    }
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100164534();
    }

    id v3 = &__kCFBooleanFalse;
  }
  unsigned __int8 v5 = [v3 BOOLValue];

  return v5;
}

- (BOOL)tsu_isVolumeKnownToBeLocal
{
  id v8 = 0;
  id v7 = 0;
  unsigned __int8 v2 = [(NSURL *)self getPromisedItemResourceValue:&v8 forKey:NSURLVolumeIsLocalKey error:&v7];
  id v3 = v8;
  id v4 = v7;
  if ((v2 & 1) == 0)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBEC0);
    }
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001645E4();
    }

    id v3 = &__kCFBooleanTrue;
  }
  unsigned __int8 v5 = [v3 BOOLValue];

  return v5;
}

- (BOOL)tsu_isInTemporaryDirectory
{
  uint64_t v9 = 2;
  id v3 = +[NSFileManager defaultManager];
  id v4 = NSTemporaryDirectory();
  unsigned __int8 v5 = +[NSURL tsu_fileURLWithPath:v4];
  unsigned __int8 v6 = [v3 getRelationship:&v9 ofDirectoryAtURL:v5 toItemAtURL:self error:0];
  if (v9) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v6;
  }

  return v7;
}

- (BOOL)tsu_isInTrash
{
  id v3 = +[NSFileManager defaultManager];
  id v27 = 0;
  uint64_t v28 = 2;
  unsigned int v4 = [v3 getRelationship:&v28 ofDirectory:102 inDomain:0 toItemAtURL:self error:&v27];
  id v5 = v27;
  unsigned __int8 v6 = v5;
  if (v4)
  {
    BOOL v7 = v28 == 0;
    goto LABEL_22;
  }
  if (!v5) {
    goto LABEL_19;
  }
  if (!objc_msgSend(v5, "tsu_isFeatureUnsupportedError"))
  {
    if ((objc_msgSend(v6, "tsu_isNoSuchFileError") & 1) == 0)
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBEE0);
      }
      id v16 = TSUDefaultCat_log_t;
      BOOL v7 = 0;
      if (!os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      uint64_t v17 = v16;
      int v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      uint64_t v20 = [v6 domain];
      id v21 = [v6 code];
      *(_DWORD *)buf = 138413314;
      __int16 v30 = self;
      __int16 v31 = 2114;
      id v32 = v19;
      __int16 v33 = 2114;
      long long v34 = v20;
      __int16 v35 = 2048;
      id v36 = v21;
      __int16 v37 = 2112;
      v38 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to find relationship between URL and trash directory: %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
    }
LABEL_19:
    BOOL v7 = 0;
    goto LABEL_22;
  }
  id v8 = [(NSURL *)self URLByDeletingLastPathComponent];
  uint64_t v9 = [v8 pathComponents];
  statfs v10 = [v9 reverseObjectEnumerator];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v39 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        if (objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "isEqualToString:", @".Trash", (void)v23))
        {
          BOOL v7 = 1;
          goto LABEL_21;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v23 objects:v39 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 0;
LABEL_21:

LABEL_22:
  return v7;
}

+ (id)tsu_fileURLWithPath:(id)a3
{
  if (a3)
  {
    unsigned int v4 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
  }
  else
  {
    unsigned int v4 = 0;
  }
  return v4;
}

- (void)tsu_removeCachedResourceValueForKeys:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSURL *)self removeCachedResourceValueForKey:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)tsu_contentModificationDateWithLogContext:(id)a3
{
  id v4 = a3;
  [(NSURL *)self removeCachedResourceValueForKey:NSURLContentModificationDateKey];
  id v17 = 0;
  id v18 = 0;
  unsigned __int8 v5 = [(NSURL *)self getPromisedItemResourceValue:&v18 forKey:NSURLContentModificationDateKey error:&v17];
  id v6 = v18;
  id v7 = v17;
  if ((v5 & 1) == 0)
  {

    if (v4)
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBF00);
      }
      id v8 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR))
      {
        long long v9 = v8;
        long long v10 = [v4 publicString];
        long long v11 = [v4 privateString];
        long long v12 = (objc_class *)objc_opt_class();
        id v13 = NSStringFromClass(v12);
        uint64_t v14 = [v7 domain];
        id v15 = [v7 code];
        *(_DWORD *)buf = 138544898;
        uint64_t v20 = v10;
        __int16 v21 = 2112;
        id v22 = v11;
        __int16 v23 = 2112;
        long long v24 = self;
        __int16 v25 = 2114;
        long long v26 = v13;
        __int16 v27 = 2114;
        uint64_t v28 = v14;
        __int16 v29 = 2048;
        id v30 = v15;
        __int16 v31 = 2112;
        id v32 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@ %@ Failed to get file modification date for URL=%@ error=errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x48u);
      }
    }
    else
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBF20);
      }
      if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100164694();
      }
    }
    id v6 = 0;
  }

  return v6;
}

- (id)tsu_pathExceptPrivate
{
  unsigned __int8 v2 = [(NSURL *)self path];
  uint64_t v3 = objc_msgSend(v2, "tsu_pathExceptPrivate");

  return v3;
}

- (id)tsu_URLExceptPrivate
{
  unsigned __int8 v2 = [(NSURL *)self tsu_pathExceptPrivate];
  uint64_t v3 = +[NSURL tsu_fileURLWithPath:v2];

  return v3;
}

- (BOOL)tsu_matchesURL:(id)a3
{
  return [(NSURL *)self tsu_matchesURL:a3 canCompareFileID:1];
}

- (BOOL)tsu_matchesURL:(id)a3 canCompareFileID:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (NSURL *)a3;
  id v7 = v6;
  unsigned __int8 v8 = self == v6;
  if (v6 && self != v6)
  {
    if ([(NSURL *)self isEqual:v6])
    {
      unsigned __int8 v8 = 1;
    }
    else
    {
      if ([(NSURL *)self isFileURL] && [(NSURL *)v7 isFileURL])
      {
        long long v9 = [(NSURL *)self tsu_pathExceptPrivate];
        long long v10 = [(NSURL *)v7 tsu_pathExceptPrivate];
        unsigned __int8 v8 = [v9 isEqualToString:v10];
      }
      else
      {
        unsigned __int8 v8 = 0;
      }
      if ((v8 & 1) == 0 && v4)
      {
        id v16 = 0;
        unsigned int v11 = [(NSURL *)self getResourceValue:&v16 forKey:NSURLFileResourceIdentifierKey error:0];
        id v12 = v16;
        uint64_t v15 = 0;
        unsigned int v13 = [(NSURL *)v7 getResourceValue:&v15 forKey:NSURLFileResourceIdentifierKey error:0];
        unsigned __int8 v8 = 0;
        if (v11 && v13) {
          unsigned __int8 v8 = [v12 isEqual:v15];
        }
      }
    }
  }

  return v8;
}

- (BOOL)tsu_canOpenURL
{
  uint64_t v3 = [(NSURL *)self scheme];
  BOOL v4 = [v3 lowercaseString];
  unsigned int v5 = [v4 isEqualToString:@"tel"];

  if (!v5) {
    return 1;
  }
  id v6 = [(NSURL *)self resourceSpecifier];
  id v7 = [v6 stringByRemovingPercentEncoding];

  unsigned __int8 v8 = +[NSCharacterSet alphanumericCharacterSet];
  long long v9 = [v8 invertedSet];
  long long v10 = objc_msgSend(v7, "tsu_stringByRemovingCharactersInSet:", v9);

  BOOL v11 = (unint64_t)[v10 length] > 2;
  return v11;
}

+ (id)tsu_urlFromUserProvidedTelephoneString:(id)a3 withDataDetector:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  unsigned __int8 v8 = [v5 stringByTrimmingCharactersInSet:v7];

  long long v9 = +[NSCharacterSet alphanumericCharacterSet];
  id v10 = [v5 rangeOfCharacterFromSet:v9];

  if ([v8 length]) {
    BOOL v11 = v10 == (id)0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    id v12 = 0;
    goto LABEL_16;
  }
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_10007B8D4;
  __int16 v31 = sub_10007B8E4;
  id v32 = 0;
  if ([v8 hasPrefix:@"tel:"])
  {
    uint64_t v13 = +[NSURL URLWithString:v8];
    uint64_t v14 = (void *)v28[5];
    v28[5] = v13;
  }
  else
  {
    if ([v8 containsString:@" "]) {
      goto LABEL_12;
    }
    uint64_t v14 = [@"tel:" stringByAppendingString:v8];
    uint64_t v15 = +[NSURL URLWithString:v14];
    id v16 = (void *)v28[5];
    v28[5] = v15;
  }
LABEL_12:
  id v17 = (void *)v28[5];
  if (!v17)
  {
    id v18 = objc_msgSend(v8, "tsu_range");
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10007B8EC;
    v26[3] = &unk_1001CBF68;
    v26[4] = &v27;
    objc_msgSend(v6, "enumerateMatchesInString:options:range:usingBlock:", v8, 0, v18, v19, v26);
    id v17 = (void *)v28[5];
    if (!v17)
    {
      uint64_t v20 = +[NSCharacterSet URLFragmentAllowedCharacterSet];
      __int16 v21 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:v20];
      id v22 = [@"tel:" stringByAppendingString:v21];
      uint64_t v23 = +[NSURL URLWithString:v22];
      long long v24 = (void *)v28[5];
      v28[5] = v23;

      id v17 = (void *)v28[5];
    }
  }
  id v12 = v17;
  _Block_object_dispose(&v27, 8);

LABEL_16:
  return v12;
}

- (id)tsu_prettyStringFromTelephoneURL
{
  unsigned __int8 v2 = [(NSURL *)self resourceSpecifier];
  uint64_t v3 = [v2 stringByRemovingPercentEncoding];

  if (v3) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = &stru_1001D3790;
  }
  id v5 = v4;

  return v5;
}

+ (id)tsu_privacyContactsURL
{
  return +[NSURL URLWithString:@"prefs:root=Privacy&path=CONTACTS"];
}

- (NSString)tsu_UTI
{
  unsigned __int8 v2 = [(NSURL *)self path];
  uint64_t v3 = objc_msgSend(v2, "tsu_pathUTI");

  return (NSString *)v3;
}

- (BOOL)tsu_conformsToUTI:(id)a3
{
  id v4 = a3;
  id v5 = [(NSURL *)self pathExtension];
  unsigned __int8 v6 = objc_msgSend(v5, "tsu_pathExtensionConformsToUTI:", v4);

  return v6;
}

- (BOOL)tsu_conformsToAnyUTI:(id)a3
{
  id v4 = a3;
  id v5 = [(NSURL *)self pathExtension];
  unsigned __int8 v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "tsu_allFilenameExtensionIdentifiersForTag");
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ((objc_msgSend(v12, "tsu_isDynamic") & 1) == 0)
          {
            long long v23 = 0u;
            long long v24 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            id v13 = v4;
            id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v14)
            {
              id v15 = v14;
              uint64_t v16 = *(void *)v22;
              while (2)
              {
                for (j = 0; j != v15; j = (char *)j + 1)
                {
                  if (*(void *)v22 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  if (objc_msgSend(v12, "tsu_conformsToUTI:", *(void *)(*((void *)&v21 + 1) + 8 * (void)j)))
                  {

                    BOOL v18 = 1;
                    goto LABEL_23;
                  }
                }
                id v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
                if (v15) {
                  continue;
                }
                break;
              }
            }

            uint64_t v10 = v20;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
        BOOL v18 = 0;
      }
      while (v9);
    }
    else
    {
      BOOL v18 = 0;
    }
LABEL_23:
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

@end