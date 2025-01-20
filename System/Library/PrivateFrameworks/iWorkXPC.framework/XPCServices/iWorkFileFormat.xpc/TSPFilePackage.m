@interface TSPFilePackage
+ (BOOL)isValidOrEmptyPackageOrTangierEditingFormatAtURL:(id)a3 hasNativeUTI:(BOOL)a4;
+ (BOOL)isValidPackageAtURL:(id)a3;
+ (BOOL)isValidPackageAtZipArchive:(id)a3;
+ (BOOL)isValidTangierEditingFormatAtURL:(id)a3;
+ (BOOL)isValidTangierEditingFormatAtZipArchive:(id)a3;
+ (id)zipArchiveURLFromPackageURL:(id)a3;
+ (unint64_t)zipArchiveOptions;
- (BOOL)didReloadZipArchive:(id)a3 packageURL:(id)a4 error:(id *)a5;
- (BOOL)hasDataAtRelativePath:(id)a3;
- (id)componentZipArchive;
- (id)newDocumentPropertiesWithURL:(id)a3 zipProvider:(id)a4 error:(id *)a5;
- (id)newRawDataReadChannelAtRelativePath:(id)a3;
- (id)packageEntryInfoAtRelativePath:(id)a3 error:(id *)a4;
- (int64_t)packageType;
@end

@implementation TSPFilePackage

+ (BOOL)isValidPackageAtZipArchive:(id)a3
{
  id v3 = a3;
  v4 = +[TSPPackage objectArchiveEntryPathForPackageLocator:@"Metadata"];
  v5 = [v3 entryForName:v4];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [v3 entryForName:@"Index.zip"];
    BOOL v6 = v7 != 0;
  }
  return v6;
}

+ (BOOL)isValidTangierEditingFormatAtZipArchive:(id)a3
{
  id v3 = [a3 entryForName:@"index.db"];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (BOOL)isValidPackageAtURL:(id)a3
{
  id v4 = a3;
  if ([v4 checkResourceIsReachableAndReturnError:0])
  {
    v5 = +[TSUZipFileArchive zipArchiveFromURL:v4 options:5 error:0];
    unsigned __int8 v6 = [a1 isValidPackageAtZipArchive:v5];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (BOOL)isValidTangierEditingFormatAtURL:(id)a3
{
  id v4 = a3;
  if ([v4 checkResourceIsReachableAndReturnError:0])
  {
    v5 = +[TSUZipFileArchive zipArchiveFromURL:v4 options:5 error:0];
    if (v5) {
      unsigned __int8 v6 = [a1 isValidTangierEditingFormatAtZipArchive:v5];
    }
    else {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (BOOL)isValidOrEmptyPackageOrTangierEditingFormatAtURL:(id)a3 hasNativeUTI:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 checkResourceIsReachableAndReturnError:0])
  {
    v7 = +[TSUZipFileArchive zipArchiveFromURL:v6 options:5 error:0];
    if (v7)
    {
      if ([a1 isValidPackageAtZipArchive:v7])
      {
        LOBYTE(v8) = 1;
      }
      else
      {
        unsigned int v8 = [a1 isValidTangierEditingFormatAtZipArchive:v7];
        if (((v8 | !v4) & 1) == 0) {
          unsigned int v8 = [v7 hasNonEmptyEntries] ^ 1;
        }
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)zipArchiveURLFromPackageURL:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (unint64_t)zipArchiveOptions
{
  return 1;
}

- (int64_t)packageType
{
  return 2;
}

- (BOOL)didReloadZipArchive:(id)a3 packageURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v46.receiver = self;
  v46.super_class = (Class)TSPFilePackage;
  id v47 = 0;
  BOOL v10 = [(TSPPackage *)&v46 didReloadZipArchive:v8 packageURL:v9 error:&v47];
  id v11 = v47;
  char v12 = !v10;
  if (!v8) {
    char v12 = 1;
  }
  if ((v12 & 1) == 0)
  {
    v13 = +[TSPPackage objectArchiveEntryPathForPackageLocator:@"Metadata"];
    v14 = [v8 entryForName:v13];
    BOOL v15 = v14 == 0;

    if (!v15)
    {
      v16 = (TSUZipArchive *)v8;
      componentZipArchive = self->_componentZipArchive;
      self->_componentZipArchive = v16;
LABEL_6:
      BOOL v10 = 1;
LABEL_32:

      goto LABEL_33;
    }
    v18 = [v8 entryForName:@"Index.zip"];
    componentZipArchive = v18;
    if (!v18)
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001C6238);
      }
      v30 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100161508(v30);
      }
      goto LABEL_31;
    }
    if ([(TSUZipArchive *)v18 isCompressed])
    {
      id v45 = v11;
      v19 = [[TSUTemporaryDirectory alloc] initWithError:&v45];
      id v20 = v45;

      componentZipArchiveTemporaryDirectory = self->_componentZipArchiveTemporaryDirectory;
      self->_componentZipArchiveTemporaryDirectory = v19;

      v22 = self->_componentZipArchiveTemporaryDirectory;
      if (v22)
      {
        v23 = [(TSUTemporaryDirectory *)v22 URL];
        v24 = [v23 URLByAppendingPathComponent:@"Index.zip"];

        if (UnsafePointer != -1) {
          dispatch_once(&UnsafePointer, &stru_1001C61F8);
        }
        v25 = UnsafePointer;
        if (os_log_type_enabled((os_log_t)UnsafePointer, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v49 = v9;
          __int16 v50 = 2112;
          v51 = v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Extracting compressed Index.zip from zipped package. url=%@, targetURL=%@", buf, 0x16u);
        }
        id v44 = v20;
        unsigned int v26 = objc_msgSend(v8, "tsp_writeZipEntry:toURL:validateCRC:error:", componentZipArchive, v24, 0, &v44, 104);
        id v27 = v44;

        if (v26)
        {
          id v43 = v27;
          v28 = +[TSUZipFileArchive zipArchiveFromURL:v24 options:0 error:&v43];
          id v11 = v43;

          if (v28)
          {
            v29 = self->_componentZipArchive;
            self->_componentZipArchive = v28;

            goto LABEL_6;
          }
        }
        else
        {
          id v11 = v27;
        }
        v33 = *(Class *)((char *)&self->super.super.isa + v41);
        *(Class *)((char *)&self->super.super.isa + v41) = 0;

        goto LABEL_26;
      }
    }
    else
    {
      id v42 = v11;
      v31 = [v8 containedZipArchiveForEntry:componentZipArchive options:0 error:&v42];
      id v20 = v42;

      if (v31)
      {
        v32 = self->_componentZipArchive;
        self->_componentZipArchive = v31;

        BOOL v10 = 1;
        id v11 = v20;
        goto LABEL_32;
      }
    }
    id v11 = v20;
LABEL_26:
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001C6218);
    }
    v34 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      v39 = [v11 domain];
      id v40 = [v11 code];
      *(_DWORD *)buf = 138544130;
      id v49 = v38;
      __int16 v50 = 2114;
      v51 = v39;
      __int16 v52 = 2048;
      id v53 = v40;
      __int16 v54 = 2112;
      id v55 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v34, OS_LOG_TYPE_ERROR, "Failed to load contained Index.zip with error: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x2Au);
    }
LABEL_31:
    BOOL v10 = 0;
    goto LABEL_32;
  }
LABEL_33:
  if (a5 && !v10)
  {
    if (v11)
    {
      *a5 = v11;
    }
    else
    {
      id v35 = +[NSError tsp_unknownReadErrorWithUserInfo:0];
      *a5 = v35;
    }
  }

  return v10;
}

- (id)componentZipArchive
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10001A0D8;
  id v9 = sub_10001A0E8;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001A0F0;
  v4[3] = &unk_1001C6260;
  v4[4] = self;
  v4[5] = &v5;
  [(TSPPackage *)self peformSynchronousAccessToZipArchive:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)packageEntryInfoAtRelativePath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    int v7 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6280);
    }
    id v8 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016154C(v7, v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPFilePackage packageEntryInfoAtRelativePath:error:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPFilePackage.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 186, 0, "Invalid parameter not satisfying: %{public}s", "path");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  id v11 = [(TSPPackage *)self zipArchive];
  char v12 = [v11 entryForName:v6];
  if (v12)
  {
    v13 = [TSPPackageEntryInfo alloc];
    id v14 = [v12 size];
    BOOL v15 = [v12 lastModificationDate];
    v16 = -[TSPPackageEntryInfo initWithEncodedLength:lastModificationDate:CRC:](v13, "initWithEncodedLength:lastModificationDate:CRC:", v14, v15, [v12 CRC]);
  }
  else if (a4)
  {
    +[NSError errorWithDomain:NSCocoaErrorDomain code:4 userInfo:0];
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)newRawDataReadChannelAtRelativePath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TSPPackage *)self zipArchive];
  id v6 = [v5 entryForName:v4];
  if (v6)
  {
    int v7 = [v5 streamReadChannelForEntry:v6];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (BOOL)hasDataAtRelativePath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TSPPackage *)self zipArchive];
  id v6 = [v5 entryForName:v4];
  BOOL v7 = v6 != 0;

  return v7;
}

- (id)newDocumentPropertiesWithURL:(id)a3 zipProvider:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, id *))a4;
  id v9 = v8[2](v8, a5);
  if (v9) {
    id v10 = [[TSPDocumentProperties alloc] initWithFilePackageURL:v7 zipArchive:v9 allowMissingPropertyList:0 error:a5];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentZipArchiveTemporaryDirectory, 0);
  objc_storeStrong((id *)&self->_componentZipArchive, 0);
}

@end