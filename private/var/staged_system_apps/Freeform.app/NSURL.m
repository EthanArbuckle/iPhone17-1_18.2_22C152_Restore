@interface NSURL
+ (id)crl_URLWithStringDataOnPasteboard:(id)a3 itemSet:(id)a4 pasteboardType:(id)a5;
+ (id)crl_fileURLWithPath:(id)a3;
+ (id)crl_urlFromUserProvidedTelephoneString:(id)a3 withDataDetector:(id)a4;
- (BOOL)crl_canOpenURL;
- (BOOL)crl_conformsToAnyUTI:(id)a3;
- (BOOL)crl_conformsToUTI:(id)a3;
- (BOOL)crl_fileSize:(unint64_t *)a3 error:(id *)a4;
- (BOOL)crl_isFileUrlConformingToType:(id)a3;
- (BOOL)crl_isInTemporaryDirectory;
- (BOOL)crl_isInTrash;
- (BOOL)crl_matchesURL:(id)a3;
- (BOOL)crl_matchesURL:(id)a3 canCompareFileID:(BOOL)a4;
- (CRLSandboxedURL)sandboxedURL;
- (NSString)crl_UTI;
- (id)crl_URLExceptPrivate;
- (id)crl_fileTypeIdentifierHandlingFileCoordinationPromises;
- (id)crl_pathExceptPrivate;
- (id)crl_prettyStringFromTelephoneURL;
- (id)crl_reachableFileURLByDeletingUnreachablePathComponents;
- (unint64_t)crl_fileSize;
- (void)crl_removeCachedResourceValueForKeys:(id)a3;
@end

@implementation NSURL

- (NSString)crl_UTI
{
  v2 = [(NSURL *)self path];
  v3 = [v2 crl_pathUTI];

  return (NSString *)v3;
}

- (BOOL)crl_conformsToUTI:(id)a3
{
  id v4 = a3;
  v5 = [(NSURL *)self pathExtension];
  unsigned __int8 v6 = [v5 crl_pathExtensionConformsToUTI:v4];

  return v6;
}

- (BOOL)crl_conformsToAnyUTI:(id)a3
{
  id v4 = a3;
  v5 = [(NSURL *)self pathExtension];
  if (v5)
  {
    +[UTType typesWithTag:v5 tagClass:UTTagClassFilenameExtension conformingToType:0];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v29;
      id v23 = v4;
      uint64_t v21 = *(void *)v29;
      do
      {
        v10 = 0;
        id v22 = v8;
        do
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v10);
          if (([v11 isDynamic] & 1) == 0)
          {
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v12 = v4;
            id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v13)
            {
              id v14 = v13;
              uint64_t v15 = *(void *)v25;
              while (2)
              {
                for (i = 0; i != v14; i = (char *)i + 1)
                {
                  if (*(void *)v25 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
                  v18 = [v11 identifier];
                  LOBYTE(v17) = [v18 crl_conformsToUTI:v17];

                  if (v17)
                  {

                    BOOL v19 = 1;
                    id v4 = v23;
                    goto LABEL_23;
                  }
                }
                id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
                if (v14) {
                  continue;
                }
                break;
              }
            }

            id v8 = v22;
            id v4 = v23;
            uint64_t v9 = v21;
          }
          v10 = (char *)v10 + 1;
        }
        while (v10 != v8);
        id v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
        BOOL v19 = 0;
      }
      while (v8);
    }
    else
    {
      BOOL v19 = 0;
    }
LABEL_23:
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (unint64_t)crl_fileSize
{
  unint64_t v3 = 0;
  [(NSURL *)self crl_fileSize:&v3 error:0];
  return v3;
}

- (BOOL)crl_fileSize:(unint64_t *)a3 error:(id *)a4
{
  v5 = self;
  [(NSURL *)self removeCachedResourceValueForKey:NSURLFileSizeKey];
  id v37 = 0;
  long long v26 = v5;
  LODWORD(v5) = [(NSURL *)v5 getResourceValue:&v37 forKey:NSURLFileSizeKey error:0];
  id v6 = v37;
  id v7 = v6;
  id v8 = 0;
  if (v5) {
    id v8 = (char *)[v6 unsignedLongLongValue];
  }
  uint64_t v9 = +[NSFileManager defaultManager];
  v10 = [v9 enumeratorAtURL:v26 includingPropertiesForKeys:0 options:0 errorHandler:0];

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
  long long v30 = a4;
  uint64_t v14 = *(void *)v34;
  char v15 = 1;
  do
  {
    v16 = 0;
    do
    {
      uint64_t v17 = v7;
      if (*(void *)v34 != v14) {
        objc_enumerationMutation(v11);
      }
      v18 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v16);
      [v18 removeCachedResourceValueForKey:NSURLFileSizeKey];
      id v31 = 0;
      id v32 = 0;
      LODWORD(v18) = [v18 getResourceValue:&v32 forKey:NSURLFileSizeKey error:&v31];
      id v7 = v32;

      id v19 = v31;
      if (v18)
      {
        id v8 = &v8[(void)[v7 unsignedLongLongValue]];
        goto LABEL_17;
      }
      if (v15)
      {
        if (qword_101719A68 != -1) {
          dispatch_once(&qword_101719A68, &stru_1014DE548);
        }
        char v15 = (char)v30;
        v20 = off_10166B498;
        if (!os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR))
        {
          if (!v30) {
            goto LABEL_17;
          }
LABEL_15:
          char v15 = 0;
          *long long v30 = v19;
          goto LABEL_17;
        }
        log = v20;
        uint64_t v21 = (objc_class *)objc_opt_class();
        long long v29 = NSStringFromClass(v21);
        long long v27 = [v19 domain];
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

- (id)crl_fileTypeIdentifierHandlingFileCoordinationPromises
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  unsigned __int8 v19 = 0;
  id v15 = 0;
  unsigned __int8 v3 = [(NSURL *)self getResourceValue:&v15 forKey:NSURLContentTypeKey error:0];
  id v4 = v15;
  unsigned __int8 v19 = v3;
  if (!*((unsigned char *)v17 + 24))
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = sub_1001B50A8;
    id v13 = sub_1001B50B8;
    id v14 = 0;
    id v5 = objc_alloc_init((Class)NSFileCoordinator);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001B50C0;
    v8[3] = &unk_1014DE570;
    v8[4] = &v16;
    v8[5] = &v9;
    [v5 coordinateReadingItemAtURL:self options:4 error:0 byAccessor:v8];
    if (*((unsigned char *)v17 + 24))
    {
      id v6 = (id)v10[5];

      id v4 = v6;
    }

    _Block_object_dispose(&v9, 8);
  }
  _Block_object_dispose(&v16, 8);

  return v4;
}

- (id)crl_reachableFileURLByDeletingUnreachablePathComponents
{
  if ([(NSURL *)self isFileURL])
  {
    unsigned __int8 v3 = self;
    while (1)
    {
      id v4 = [(NSURL *)v3 path];
      id v5 = [v4 length];

      if ((unint64_t)v5 < 3) {
        break;
      }
      if ([(NSURL *)v3 checkResourceIsReachableAndReturnError:0])
      {
        id v6 = v3;
        unsigned __int8 v3 = v6;
        if (v6) {
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v7 = [(NSURL *)v3 URLByDeletingLastPathComponent];

        unsigned __int8 v3 = (NSURL *)v7;
      }
    }
    id v6 = 0;
LABEL_10:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)crl_isInTemporaryDirectory
{
  uint64_t v9 = 2;
  unsigned __int8 v3 = +[NSFileManager defaultManager];
  id v4 = NSTemporaryDirectory();
  id v5 = +[NSURL crl_fileURLWithPath:v4];
  unsigned __int8 v6 = [v3 getRelationship:&v9 ofDirectoryAtURL:v5 toItemAtURL:self error:0];
  if (v9) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v6;
  }

  return v7;
}

- (BOOL)crl_isInTrash
{
  unsigned __int8 v3 = +[NSFileManager defaultManager];
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
  if (!objc_msgSend(v5, "crl_isFeatureUnsupportedError"))
  {
    if ((objc_msgSend(v6, "crl_isNoSuchFileError") & 1) == 0)
    {
      if (qword_101719A68 != -1) {
        dispatch_once(&qword_101719A68, &stru_1014DE590);
      }
      uint64_t v16 = off_10166B498;
      BOOL v7 = 0;
      if (!os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      uint64_t v17 = v16;
      uint64_t v18 = (objc_class *)objc_opt_class();
      unsigned __int8 v19 = NSStringFromClass(v18);
      v20 = [v6 domain];
      id v21 = [v6 code];
      *(_DWORD *)buf = 138413314;
      long long v30 = self;
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
  v10 = [v9 reverseObjectEnumerator];

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

+ (id)crl_fileURLWithPath:(id)a3
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

- (void)crl_removeCachedResourceValueForKeys:(id)a3
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

- (id)crl_pathExceptPrivate
{
  v2 = [(NSURL *)self path];
  uint64_t v3 = [v2 crl_pathExceptPrivate];

  return v3;
}

- (id)crl_URLExceptPrivate
{
  uint64_t v3 = [(NSURL *)self crl_pathExceptPrivate];
  id v4 = +[NSURL fileURLWithPath:v3 isDirectory:[(NSURL *)self hasDirectoryPath]];

  return v4;
}

- (BOOL)crl_matchesURL:(id)a3
{
  return [(NSURL *)self crl_matchesURL:a3 canCompareFileID:1];
}

- (BOOL)crl_matchesURL:(id)a3 canCompareFileID:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (NSURL *)a3;
  uint64_t v7 = v6;
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
        long long v9 = [(NSURL *)self crl_pathExceptPrivate];
        long long v10 = [(NSURL *)v7 crl_pathExceptPrivate];
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

- (BOOL)crl_canOpenURL
{
  uint64_t v3 = [(NSURL *)self scheme];
  BOOL v4 = [v3 lowercaseString];
  unsigned int v5 = [v4 isEqualToString:@"tel"];

  if (!v5) {
    return 1;
  }
  id v6 = [(NSURL *)self resourceSpecifier];
  uint64_t v7 = [v6 stringByRemovingPercentEncoding];

  unsigned __int8 v8 = +[NSCharacterSet alphanumericCharacterSet];
  long long v9 = [v8 invertedSet];
  long long v10 = [v7 crl_stringByRemovingCharactersInSet:v9];

  BOOL v11 = (unint64_t)[v10 length] > 2;
  return v11;
}

- (BOOL)crl_isFileUrlConformingToType:(id)a3
{
  id v4 = a3;
  if ([(NSURL *)self isFileURL])
  {
    id v11 = 0;
    id v10 = 0;
    [(NSURL *)self getResourceValue:&v11 forKey:NSURLContentTypeKey error:&v10];
    id v5 = v11;
    id v6 = v10;
    if (v5)
    {
      unsigned __int8 v7 = [v5 conformsToType:v4];
    }
    else
    {
      if (qword_101719BC8 != -1) {
        dispatch_once(&qword_101719BC8, &stru_1014DE5B0);
      }
      unsigned __int8 v8 = off_10166B5F8;
      if (os_log_type_enabled((os_log_t)off_10166B5F8, OS_LOG_TYPE_ERROR)) {
        sub_101085094((uint64_t)self, v8, v6);
      }
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

+ (id)crl_urlFromUserProvidedTelephoneString:(id)a3 withDataDetector:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int8 v7 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
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
  long long v30 = sub_1001B50A8;
  __int16 v31 = sub_1001B50B8;
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
  uint64_t v17 = (void *)v28[5];
  if (!v17)
  {
    id v18 = [v8 crl_range];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001B5E00;
    v26[3] = &unk_1014DE618;
    v26[4] = &v27;
    [v6 enumerateMatchesInString:v8 options:0 range:v18 usingBlock:v26];
    uint64_t v17 = (void *)v28[5];
    if (!v17)
    {
      v20 = +[NSCharacterSet URLFragmentAllowedCharacterSet];
      id v21 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:v20];
      id v22 = [@"tel:" stringByAppendingString:v21];
      uint64_t v23 = +[NSURL URLWithString:v22];
      long long v24 = (void *)v28[5];
      v28[5] = v23;

      uint64_t v17 = (void *)v28[5];
    }
  }
  id v12 = v17;
  _Block_object_dispose(&v27, 8);

LABEL_16:

  return v12;
}

- (id)crl_prettyStringFromTelephoneURL
{
  v2 = [(NSURL *)self resourceSpecifier];
  uint64_t v3 = [v2 stringByRemovingPercentEncoding];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = &stru_101538650;
  }
  id v5 = v4;

  return v5;
}

+ (id)crl_URLWithStringDataOnPasteboard:(id)a3 itemSet:(id)a4 pasteboardType:(id)a5
{
  id v7 = a3;
  unsigned __int8 v8 = [v7 dataForPasteboardType:a5 inItemSet:a4];
  if ([v8 count])
  {
    if ([v8 count] != (id)1)
    {
      int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DE638);
      }
      id v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101085248(v10, v8, v9);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DE658);
      }
      BOOL v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v11);
      }
      id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSURL(CRLAdditions) crl_URLWithStringDataOnPasteboard:itemSet:pasteboardType:]");
      uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSURL_CRLAdditions.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 323, 0, "Only pasting first item of %lu on pasteboard", [v8 count]);
    }
    uint64_t v14 = [v8 firstObject];
    if (v14)
    {
      id v15 = [objc_alloc((Class)NSString) initWithData:v14 encoding:4];
      if ([v15 length])
      {
        id v16 = +[NSURL URLWithString:v15];
      }
      else
      {
        uint64_t v17 = [v7 URLs];
        id v16 = [v17 firstObject];
      }
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (CRLSandboxedURL)sandboxedURL
{
  v2 = [[CRLSandboxedURL alloc] initWithURL:self];

  return v2;
}

@end