@interface NSFileManager
- (BOOL)tsu_canCloneItemAtURL:(id)a3 toURL:(id)a4;
- (BOOL)tsu_grantUserWritePosixPermissionAtPath:(id)a3 error:(id *)a4;
- (BOOL)tsu_linkOrCopyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)tsu_makeWritableItemAtURL:(id)a3 permissionsOverride:(id)a4 resetCreationDate:(BOOL)a5 error:(id *)a6;
- (BOOL)tsu_replaceItemAtURL:(id)a3 withItemAtURL:(id)a4 backupItemName:(id)a5 options:(unint64_t)a6 resultingItemURL:(id *)a7 error:(id *)a8;
- (id)tsu_containerURLForDefaultSecurityApplicationGroupIdentifier;
- (void)tsu_removeContentsOfDirectoryAtURL:(id)a3 reason:(id)a4 urlsToExclude:(id)a5 logContext:(id)a6;
@end

@implementation NSFileManager

- (BOOL)tsu_canCloneItemAtURL:(id)a3 toURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CDB78);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_10016841C();
  }
  v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSFileManager(TSUAdditions) tsu_canCloneItemAtURL:toURL:]");
  v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSFileManager_TSUAdditions.m"];
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 15, 0, "Invalid parameter not satisfying: %{public}s", "srcURL");

  +[TSUAssertionHandler logBacktraceThrottled];
  if (!v7)
  {
LABEL_9:
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CDB98);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100168388();
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSFileManager(TSUAdditions) tsu_canCloneItemAtURL:toURL:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSFileManager_TSUAdditions.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 16, 0, "Invalid parameter not satisfying: %{public}s", "dstURL");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
LABEL_14:
  if (objc_msgSend(v5, "tsu_volumeSupportsCloning")) {
    unsigned __int8 v12 = objc_msgSend(v5, "tsu_isOnSameVolumeAs:", v7);
  }
  else {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (BOOL)tsu_linkOrCopyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CDBB8);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_100168544();
  }
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSFileManager(TSUAdditions) tsu_linkOrCopyItemAtURL:toURL:error:]");
  unsigned __int8 v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSFileManager_TSUAdditions.m"];
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 22, 0, "Invalid parameter not satisfying: %{public}s", "srcURL");

  +[TSUAssertionHandler logBacktraceThrottled];
  if (!v10)
  {
LABEL_9:
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CDBD8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001684B0();
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSFileManager(TSUAdditions) tsu_linkOrCopyItemAtURL:toURL:error:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSFileManager_TSUAdditions.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 23, 0, "Invalid parameter not satisfying: %{public}s", "dstURL");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
LABEL_14:
  if ([(NSFileManager *)self tsu_canCloneItemAtURL:v8 toURL:v10]
    || ![(NSFileManager *)self linkItemAtURL:v8 toURL:v10 error:0])
  {
    id v18 = 0;
    BOOL v16 = [(NSFileManager *)self copyItemAtURL:v8 toURL:v10 error:&v18];
    id v15 = v18;
    if (a5 && !v16)
    {
      id v15 = v15;
      BOOL v16 = 0;
      *a5 = v15;
    }
  }
  else
  {
    id v15 = 0;
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)tsu_replaceItemAtURL:(id)a3 withItemAtURL:(id)a4 backupItemName:(id)a5 options:(unint64_t)a6 resultingItemURL:(id *)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  NSURLResourceKey v27 = NSURLThumbnailDictionaryKey;
  BOOL v16 = +[NSArray arrayWithObjects:&v27 count:1];
  v17 = [v14 resourceValuesForKeys:v16 error:0];

  if (!v17)
  {
    NSURLResourceKey v26 = NSURLThumbnailDictionaryKey;
    id v18 = +[NSArray arrayWithObjects:&v26 count:1];
    v17 = [v13 resourceValuesForKeys:v18 error:0];
  }
  BOOL v19 = [(NSFileManager *)self replaceItemAtURL:v13 withItemAtURL:v14 backupItemName:v15 options:a6 resultingItemURL:a7 error:a8];
  if (v19 && v17)
  {
    id v25 = 0;
    unsigned __int8 v20 = [v13 setResourceValues:v17 error:&v25];
    id v21 = v25;
    if ((v20 & 1) == 0)
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001CDBF8);
      }
      v22 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_1001685D8((uint64_t)v17, v22, v21);
      }
    }
  }
  return v19;
}

- (BOOL)tsu_makeWritableItemAtURL:(id)a3 permissionsOverride:(id)a4 resetCreationDate:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  unsigned __int8 v12 = [v10 path];
  if (v12)
  {
    id v13 = [(NSFileManager *)self attributesOfItemAtPath:v12 error:a6];
    id v14 = v13;
    if (v13)
    {
      unint64_t v15 = (unint64_t)[v13 filePosixPermissions];
      unint64_t v16 = v15;
      if (v11) {
        unint64_t v15 = (unint64_t)[v11 unsignedIntegerValue];
      }
      uint64_t v18 = v15 | 0x80;
      unsigned __int8 v19 = [v14 fileIsImmutable];
      if (v16 != v18 || (v19 & 1) != 0 || v7)
      {
        if (v7)
        {
          unsigned __int8 v20 = +[NSDate date];
          v26[0] = NSFilePosixPermissions;
          id v21 = +[NSNumber numberWithUnsignedInteger:v18];
          v27[0] = v21;
          v27[1] = &__kCFBooleanFalse;
          v26[1] = NSFileImmutable;
          v26[2] = NSFileCreationDate;
          v26[3] = NSFileModificationDate;
          v27[2] = v20;
          v27[3] = v20;
          v22 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
        }
        else
        {
          v24[0] = NSFilePosixPermissions;
          unsigned __int8 v20 = +[NSNumber numberWithUnsignedInteger:v18];
          v24[1] = NSFileImmutable;
          v25[0] = v20;
          v25[1] = &__kCFBooleanFalse;
          v22 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
        }

        unsigned __int8 v17 = [(NSFileManager *)self sfu_setAttributes:v22 ofItemAtURL:v10 recursively:1 error:a6];
      }
      else
      {
        unsigned __int8 v17 = 1;
      }
    }
    else
    {
      unsigned __int8 v17 = 0;
    }
  }
  else if (a6)
  {
    +[NSError errorWithDomain:NSCocoaErrorDomain code:262 userInfo:0];
    unsigned __int8 v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (id)tsu_containerURLForDefaultSecurityApplicationGroupIdentifier
{
  return 0;
}

- (void)tsu_removeContentsOfDirectoryAtURL:(id)a3 reason:(id)a4 urlsToExclude:(id)a5 logContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init((Class)NSMutableSet);
  if (v10)
  {
    unint64_t v15 = [v10 path];
    unsigned int v16 = [(NSFileManager *)self fileExistsAtPath:v15];

    if (v16)
    {
      id v48 = 0;
      unsigned __int8 v17 = [(NSFileManager *)self contentsOfDirectoryAtURL:v10 includingPropertiesForKeys:0 options:0 error:&v48];
      id v18 = v48;
      unsigned __int8 v19 = v18;
      if (v17)
      {
        id v33 = v18;
        v35 = v17;
        id v37 = v12;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v20 = v17;
        id v21 = [v20 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v45;
          do
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v45 != v23) {
                objc_enumerationMutation(v20);
              }
              id v25 = [*(id *)(*((void *)&v44 + 1) + 8 * i) URLByStandardizingPath];
              [v14 addObject:v25];
            }
            id v22 = [v20 countByEnumeratingWithState:&v44 objects:v49 count:16];
          }
          while (v22);
        }

        id v12 = v37;
        [v14 minusSet:v37];
        unsigned __int8 v19 = v33;
        unsigned __int8 v17 = v35;
      }
      else
      {
        if (TSUDefaultCat_init_token != -1) {
          dispatch_once(&TSUDefaultCat_init_token, &stru_1001CDC18);
        }
        NSURLResourceKey v26 = TSUDefaultCat_log_t;
        if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR))
        {
          log = v26;
          v38 = [v13 publicString];
          v36 = [v13 privateString];
          v34 = [v10 path];
          v28 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v28);
          v29 = [v19 domain];
          id v30 = [v19 code];
          *(_DWORD *)buf = 138545154;
          v51 = v38;
          __int16 v52 = 2112;
          v53 = v36;
          __int16 v54 = 2112;
          v55 = v34;
          __int16 v56 = 2114;
          id v57 = v11;
          __int16 v58 = 2114;
          v59 = v31;
          __int16 v60 = 2114;
          v61 = v29;
          __int16 v62 = 2048;
          id v63 = v30;
          __int16 v64 = 2112;
          v65 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@ %@ Failed to enumerate the directory at '%@' due to '%{public}@ after error: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x52u);
        }
      }
    }
  }
  if ([v14 count])
  {
    NSURLResourceKey v27 = dispatch_get_global_queue(-2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A4E50;
    block[3] = &unk_1001CDC80;
    id v40 = v14;
    v41 = self;
    id v42 = v13;
    id v43 = v11;
    dispatch_async(v27, block);
  }
}

- (BOOL)tsu_grantUserWritePosixPermissionAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v39 = 0;
  BOOL v7 = [(NSFileManager *)self attributesOfItemAtPath:v6 error:&v39];
  id v8 = v39;
  id v9 = [v7 fileType];
  if (([v9 isEqualToString:NSFileTypeDirectory] & 1) == 0
    && ([v9 isEqualToString:NSFileTypeRegular] & 1) == 0
    && ![v9 isEqualToString:NSFileTypeSymbolicLink])
  {
    BOOL v24 = 1;
    goto LABEL_27;
  }
  v31 = a4;
  id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unint64_t)[v7 filePosixPermissions] | 0x80);
  id v11 = +[NSDictionary dictionaryWithObject:v10 forKey:NSFilePosixPermissions];
  id v38 = v8;
  unsigned int v12 = [(NSFileManager *)self setAttributes:v11 ofItemAtPath:v6 error:&v38];
  id v13 = v38;

  if (v12)
  {
    if (![v9 isEqualToString:NSFileTypeDirectory])
    {
      BOOL v24 = 1;
LABEL_26:
      id v8 = v13;
      goto LABEL_27;
    }
    id v30 = v9;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v33 = 0;
    unint64_t v15 = [(NSFileManager *)self contentsOfDirectoryAtPath:v6 error:&v33];
    id v16 = v33;
    id v17 = [v15 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v17)
    {
      id v18 = v17;
      NSURLResourceKey v27 = v14;
      v28 = v13;
      v29 = v7;
      uint64_t v19 = *(void *)v35;
      while (2)
      {
        id v20 = 0;
        id v21 = v16;
        do
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v15);
          }
          id v22 = [v6 stringByAppendingPathComponent:*(void *)(*((void *)&v34 + 1) + 8 * (void)v20)];
          id v32 = v21;
          unsigned __int8 v23 = [(NSFileManager *)self tsu_grantUserWritePosixPermissionAtPath:v22 error:&v32];
          id v16 = v32;

          if ((v23 & 1) == 0)
          {
            id v16 = v16;

            BOOL v24 = 0;
            id v13 = v16;
            BOOL v7 = v29;
            goto LABEL_18;
          }
          id v20 = (char *)v20 + 1;
          id v21 = v16;
        }
        while (v18 != v20);
        id v18 = [v15 countByEnumeratingWithState:&v34 objects:v40 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      BOOL v24 = 1;
      id v13 = v28;
      BOOL v7 = v29;
LABEL_18:
      id v14 = v27;
    }
    else
    {
      BOOL v24 = 1;
    }

    id v9 = v30;
  }
  else
  {
    BOOL v24 = 0;
  }
  if (!v31 || v24) {
    goto LABEL_26;
  }
  if (v13)
  {
    id v8 = v13;
    BOOL v24 = 0;
    id *v31 = v8;
  }
  else
  {
    id v26 = +[NSError tsu_fileWriteUnknownErrorWithUserInfo:0];
    id *v31 = v26;

    BOOL v24 = 0;
    id v8 = 0;
  }
LABEL_27:

  return v24;
}

@end