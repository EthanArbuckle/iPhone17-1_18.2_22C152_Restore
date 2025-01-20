@interface TSPDirectoryPackageConverter
- (BOOL)enumeratePackageEntriesWithZipArchive:(id)a3 needsReadChannel:(BOOL)a4 accessor:(id)a5;
- (BOOL)isValid;
- (BOOL)performAccessor:(id)a3 filePathCharacterIndex:(unint64_t)a4 fileURL:(id)a5 needsReadChannel:(BOOL)a6 zipArchive:(id)a7 error:(id *)a8;
- (unint64_t)progressTotalUnitCountWithZipArchive:(id)a3;
@end

@implementation TSPDirectoryPackageConverter

- (unint64_t)progressTotalUnitCountWithZipArchive:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)TSPDirectoryPackageConverter;
  v4 = [(TSPPackageConverter *)&v26 progressTotalUnitCountWithZipArchive:a3];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = +[NSFileManager defaultManager];
  v6 = [(TSPPackageConverter *)self URL];
  v27[0] = NSURLIsDirectoryKey;
  v27[1] = NSURLFileSizeKey;
  v7 = +[NSArray arrayWithObjects:v27 count:2];
  v8 = [v5 enumeratorAtURL:v6 includingPropertiesForKeys:v7 options:0 errorHandler:0];

  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v11);
        id v21 = 0;
        unsigned int v13 = [v12 getResourceValue:&v21 forKey:NSURLIsDirectoryKey error:0];
        id v14 = v21;
        v15 = v14;
        if (v13 && ([v14 BOOLValue] & 1) == 0)
        {
          id v20 = 0;
          unsigned int v16 = [v12 getResourceValue:&v20 forKey:NSURLFileSizeKey error:0];
          id v17 = v20;
          v18 = v17;
          if (v16) {
            v4 = &v4[(void)[v17 unsignedLongLongValue]];
          }
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }

  return (unint64_t)v4;
}

- (BOOL)performAccessor:(id)a3 filePathCharacterIndex:(unint64_t)a4 fileURL:(id)a5 needsReadChannel:(BOOL)a6 zipArchive:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = (uint64_t (**)(id, void *, id, id, void, os_log_t))a3;
  id v15 = a5;
  unsigned int v16 = [v15 path];
  id v17 = [v16 stringByStandardizingPath];
  v18 = [v17 precomposedStringWithCanonicalMapping];

  v19 = [v18 substringFromIndex:a4];
  if (([v19 isEqualToString:@"Index.zip"] & 1) != 0
    || [(TSPPackageConverter *)self isDocumentPropertiesPath:v19]
    || a7 && [(TSPPackageConverter *)self isObjectArchivePath:v19])
  {
    id v20 = 0;
    char v21 = 1;
    goto LABEL_6;
  }
  if (!v10)
  {
    id v20 = 0;
    long long v23 = 0;
    goto LABEL_16;
  }
  id v53 = 0;
  long long v23 = [[TSUFileIOChannel alloc] initForReadingURL:v15 error:&v53];
  id v20 = v53;
  if (v23)
  {
LABEL_16:
    os_log_t log = v23;
    id v52 = 0;
    id v51 = 0;
    unsigned __int8 v25 = [v15 getResourceValue:&v52 forKey:NSURLFileSizeKey error:&v51];
    id v26 = v52;
    id v27 = v51;
    if ((v25 & 1) == 0)
    {

      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001C6568);
      }
      v28 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
      {
        v42 = [v15 path];
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        v44 = [v27 domain];
        id v34 = [v27 code];
        *(_DWORD *)buf = 138413314;
        id v55 = v42;
        __int16 v56 = 2114;
        id v57 = v46;
        __int16 v58 = 2114;
        v59 = v44;
        __int16 v60 = 2048;
        id v61 = v34;
        __int16 v62 = 2112;
        id v63 = v27;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v28, OS_LOG_TYPE_ERROR, "Failed to retrieve file size for path: %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
      }
      id v26 = 0;
    }

    id v50 = 0;
    id v49 = 0;
    unsigned __int8 v29 = [v15 getResourceValue:&v50 forKey:NSURLContentModificationDateKey error:&v49];
    id v30 = v50;
    id v31 = v49;
    if ((v29 & 1) == 0)
    {

      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001C6588);
      }
      v32 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
      {
        v47 = [v15 path];
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        id v45 = (id)objc_claimAutoreleasedReturnValue();
        v43 = [v31 domain];
        id v36 = [v31 code];
        *(_DWORD *)buf = 138413314;
        id v55 = v47;
        __int16 v56 = 2114;
        id v57 = v45;
        __int16 v58 = 2114;
        v59 = v43;
        __int16 v60 = 2048;
        id v61 = v36;
        __int16 v62 = 2112;
        id v63 = v31;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_ERROR, "Failed to retrieve content modification date for path: %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
      }
      id v30 = 0;
    }
    char v21 = v14[2](v14, v19, v30, [v26 unsignedLongLongValue], 0, log);
    [log close];

    goto LABEL_29;
  }
  if (TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &stru_1001C65A8);
  }
  os_log_t v24 = TSUDefaultCat_log_t;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    os_log_t log = v24;
    id v37 = [v15 path];
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    v40 = [v20 domain];
    id v41 = [v20 code];
    *(_DWORD *)buf = 138413314;
    id v55 = v37;
    __int16 v56 = 2114;
    id v57 = v39;
    __int16 v58 = 2114;
    v59 = v40;
    __int16 v60 = 2048;
    id v61 = v41;
    __int16 v62 = 2112;
    id v63 = v20;
    _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to read file from document directory: %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);

    char v21 = 0;
LABEL_29:
    os_log_t v24 = log;
    goto LABEL_30;
  }
  char v21 = 0;
LABEL_30:

LABEL_6:
  if (a8) {
    *a8 = v20;
  }

  return v21;
}

- (BOOL)enumeratePackageEntriesWithZipArchive:(id)a3 needsReadChannel:(BOOL)a4 accessor:(id)a5
{
  BOOL v67 = a4;
  id v68 = a3;
  id v69 = a5;
  v71 = self;
  v59 = [(TSPPackageConverter *)self URL];
  v7 = +[NSFileManager defaultManager];
  v98[0] = NSURLIsDirectoryKey;
  v98[1] = NSURLFileSizeKey;
  v98[2] = NSURLContentModificationDateKey;
  v8 = +[NSArray arrayWithObjects:v98 count:3];
  id v57 = [v7 enumeratorAtURL:v59 includingPropertiesForKeys:v8 options:0 errorHandler:0];

  id v9 = [v59 path];
  BOOL v10 = [v9 stringByStandardizingPath];
  __int16 v58 = [v10 precomposedStringWithCanonicalMapping];

  v11 = (char *)[v58 length];
  id v62 = objc_alloc_init((Class)NSMutableArray);
  id v61 = objc_alloc_init((Class)NSMutableArray);
  id v60 = objc_alloc_init((Class)NSMutableArray);
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id obj = v57;
  id v12 = [obj countByEnumeratingWithState:&v90 objects:v97 count:16];
  v70 = v11 + 1;
  unsigned int v13 = 0;
  if (v12)
  {
    id v65 = *(id *)v91;
    BOOL v14 = 1;
LABEL_3:
    uint64_t v15 = 0;
    id v64 = v12;
    while (1)
    {
      if (*(id *)v91 != v65) {
        objc_enumerationMutation(obj);
      }
      unsigned int v16 = *(void **)(*((void *)&v90 + 1) + 8 * v15);
      char v18 = [(TSPPackageConverter *)v71 isCancelled] || !v14;
      if (v18)
      {
        BOOL v14 = 0;
      }
      else
      {
        id v88 = 0;
        id v89 = 0;
        unsigned int v19 = [v16 getResourceValue:&v89 forKey:NSURLIsDirectoryKey error:&v88];
        id v20 = v89;
        id v21 = v88;

        if (v19 && ([v20 BOOLValue] & 1) == 0)
        {
          long long v22 = [v16 path];
          long long v23 = [v22 stringByStandardizingPath];
          os_log_t v24 = [v23 precomposedStringWithCanonicalMapping];

          unsigned __int8 v25 = [v24 substringFromIndex:v70];
          unsigned __int8 v26 = [(TSPPackageConverter *)v71 isDataPath:v25];
          id v27 = v62;
          if ((v26 & 1) == 0)
          {
            if ([(TSPPackageConverter *)v71 isObjectArchivePath:v25]) {
              id v27 = v61;
            }
            else {
              id v27 = v60;
            }
          }
          objc_msgSend(v27, "addObject:", v16, v57);
        }
        unsigned int v13 = v21;
      }
      if (v18) {
        break;
      }
      if (v64 == (id)++v15)
      {
        id v12 = [obj countByEnumeratingWithState:&v90 objects:v97 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    BOOL v14 = 1;
  }

  [v62 sortUsingComparator:&stru_1001C65E8];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v66 = v62;
  id v28 = [v66 countByEnumeratingWithState:&v84 objects:v96 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v85;
LABEL_23:
    uint64_t v30 = 0;
    while (1)
    {
      if (*(void *)v85 != v29) {
        objc_enumerationMutation(v66);
      }
      uint64_t v31 = *(void *)(*((void *)&v84 + 1) + 8 * v30);
      char v33 = [(TSPPackageConverter *)v71 isCancelled] || !v14;
      if (v33)
      {
        unsigned int v34 = 0;
      }
      else
      {
        id v83 = v13;
        unsigned int v34 = [(TSPDirectoryPackageConverter *)v71 performAccessor:v69 filePathCharacterIndex:v70 fileURL:v31 needsReadChannel:v67 zipArchive:v68 error:&v83];
        id v35 = v83;

        unsigned int v13 = v35;
      }
      BOOL v14 = v34 != 0;
      if (v33) {
        break;
      }
      if (v28 == (id)++v30)
      {
        id v28 = [v66 countByEnumeratingWithState:&v84 objects:v96 count:16];
        if (v28) {
          goto LABEL_23;
        }
        break;
      }
    }
  }

  if (v14)
  {
    v82.receiver = v71;
    v82.super_class = (Class)TSPDirectoryPackageConverter;
    unsigned int v36 = [(TSPPackageConverter *)&v82 enumeratePackageEntriesWithZipArchive:v68 needsReadChannel:v67 accessor:v69];
  }
  else
  {
    unsigned int v36 = 0;
  }
  long long v81 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v78 = 0u;
  id v37 = v61;
  id v38 = [v37 countByEnumeratingWithState:&v78 objects:v95 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v79;
LABEL_37:
    v40 = 0;
    while (1)
    {
      if (*(void *)v79 != v39) {
        objc_enumerationMutation(v37);
      }
      uint64_t v41 = *(void *)(*((void *)&v78 + 1) + 8 * (void)v40);
      char v43 = [(TSPPackageConverter *)v71 isCancelled] | v36 ^ 1;
      if (v43)
      {
        unsigned int v44 = 0;
      }
      else
      {
        id v77 = v13;
        unsigned int v44 = [(TSPDirectoryPackageConverter *)v71 performAccessor:v69 filePathCharacterIndex:v70 fileURL:v41 needsReadChannel:v67 zipArchive:v68 error:&v77];
        id v45 = v77;

        unsigned int v13 = v45;
      }
      if (v43) {
        break;
      }
      v40 = (char *)v40 + 1;
      LOBYTE(v36) = v44 != 0;
      if (v38 == v40)
      {
        id v38 = [v37 countByEnumeratingWithState:&v78 objects:v95 count:16];
        if (v38) {
          goto LABEL_37;
        }
        break;
      }
    }
  }
  else
  {
    unsigned int v44 = v36;
  }
  BOOL v46 = v44 != 0;

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v47 = v60;
  id v48 = [v47 countByEnumeratingWithState:&v73 objects:v94 count:16];
  if (v48)
  {
    uint64_t v49 = *(void *)v74;
LABEL_50:
    uint64_t v50 = 0;
    while (1)
    {
      if (*(void *)v74 != v49) {
        objc_enumerationMutation(v47);
      }
      uint64_t v51 = *(void *)(*((void *)&v73 + 1) + 8 * v50);
      char v53 = [(TSPPackageConverter *)v71 isCancelled] || !v46;
      if (v53)
      {
        unsigned int v54 = 0;
      }
      else
      {
        id v72 = v13;
        unsigned int v54 = [(TSPDirectoryPackageConverter *)v71 performAccessor:v69 filePathCharacterIndex:v70 fileURL:v51 needsReadChannel:v67 zipArchive:v68 error:&v72];
        id v55 = v72;

        unsigned int v13 = v55;
      }
      BOOL v46 = v54 != 0;
      if (v53) {
        break;
      }
      if (v48 == (id)++v50)
      {
        id v48 = [v47 countByEnumeratingWithState:&v73 objects:v94 count:16];
        if (v48) {
          goto LABEL_50;
        }
        break;
      }
    }
  }

  return v46;
}

- (BOOL)isValid
{
  v2 = [(TSPPackageConverter *)self URL];
  if (+[TSPDirectoryPackage isValidPackageAtURL:v2]) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = +[TSPExpandedDirectoryPackage isValidPackageAtURL:v2];
  }

  return v3;
}

@end