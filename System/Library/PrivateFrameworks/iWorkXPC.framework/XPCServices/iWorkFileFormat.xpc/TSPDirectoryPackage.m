@interface TSPDirectoryPackage
+ (BOOL)isValidPackageAtURL:(id)a3;
+ (id)componentFileURLForPackageURL:(id)a3 packageLocator:(id)a4;
+ (id)objectArchiveURLForPackageURL:(id)a3;
+ (id)zipArchiveURLFromPackageURL:(id)a3;
+ (unint64_t)zipArchiveOptions;
- (BOOL)hasDataAtRelativePath:(id)a3;
- (id)dataAtRelativePath:(id)a3 allowDecryption:(BOOL)a4 error:(id *)a5;
- (id)newDocumentPropertiesWithURL:(id)a3 zipProvider:(id)a4 error:(id *)a5;
- (id)newRawDataReadChannelAtRelativePath:(id)a3;
- (id)newRawReadChannelForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4 error:(id *)a5;
- (id)packageEntryInfoAtRelativePath:(id)a3 error:(id *)a4;
- (id)packageEntryInfoForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4;
- (int64_t)packageType;
- (void)copyComponent:(id)a3 toPackageURL:(id)a4 packageLocator:(id)a5 zipFileWriter:(id)a6 encryptionKey:(id)a7 canLink:(BOOL)a8 completion:(id)a9;
- (void)prepareForDocumentReplacementWithSuccess:(BOOL)a3 forSafeSave:(BOOL)a4 originalURL:(id)a5;
@end

@implementation TSPDirectoryPackage

+ (id)objectArchiveURLForPackageURL:(id)a3
{
  v3 = [a3 URLByAppendingPathComponent:@"Index.zip" isDirectory:0];
  return v3;
}

+ (id)componentFileURLForPackageURL:(id)a3 packageLocator:(id)a4
{
  id v5 = a3;
  v6 = [a4 stringByAppendingPathExtension:@"iwa"];
  v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

+ (BOOL)isValidPackageAtURL:(id)a3
{
  v3 = [a1 objectArchiveURLForPackageURL:a3];
  unsigned __int8 v4 = [v3 checkResourceIsReachableAndReturnError:0];

  return v4;
}

+ (id)zipArchiveURLFromPackageURL:(id)a3
{
  v3 = [a1 objectArchiveURLForPackageURL:a3];
  return v3;
}

+ (unint64_t)zipArchiveOptions
{
  return 0;
}

- (int64_t)packageType
{
  return 1;
}

- (id)packageEntryInfoForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_10000D7CC;
  v23 = sub_10000D7DC;
  id v24 = 0;
  if (v4)
  {
    if (!v6)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C57A0);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_10016002C();
      }
      v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDirectoryPackage packageEntryInfoForComponentLocator:isStoredOutsideObjectArchive:]");
      v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackage.mm"];
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 59, 0, "Invalid parameter not satisfying: %{public}s", "locator");

      +[TSUAssertionHandler logBacktraceThrottled];
    }
    v10 = [(TSPPackage *)self fileCoordinatorDelegate];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000D828;
    v16[3] = &unk_1001C57E8;
    id v17 = v7;
    v18 = &v19;
    [v10 performReadUsingAccessor:v16];

    v11 = v17;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)TSPDirectoryPackage;
    uint64_t v12 = [(TSPPackage *)&v15 packageEntryInfoForComponentLocator:v6 isStoredOutsideObjectArchive:0];
    v11 = (void *)v20[5];
    v20[5] = v12;
  }

  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (id)newRawReadChannelForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = v8;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_10000D7CC;
  v34 = sub_10000D7DC;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10000D7CC;
  v28 = sub_10000D7DC;
  id v29 = 0;
  if (v6)
  {
    if (!v8)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C5808);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_1001600C0();
      }
      v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDirectoryPackage newRawReadChannelForComponentLocator:isStoredOutsideObjectArchive:error:]");
      v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackage.mm"];
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 87, 0, "invalid nil value for '%{public}s'", "locator");

      +[TSUAssertionHandler logBacktraceThrottled];
    }
    uint64_t v12 = [(TSPPackage *)self fileCoordinatorDelegate];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000DEF4;
    v20[3] = &unk_1001C5850;
    id v21 = v9;
    v22 = &v30;
    v23 = &v24;
    [v12 performReadUsingAccessor:v20];

    id v13 = v21;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)TSPDirectoryPackage;
    id obj = 0;
    id v14 = [(TSPPackage *)&v18 newRawReadChannelForComponentLocator:v8 isStoredOutsideObjectArchive:0 error:&obj];
    objc_storeStrong(&v29, obj);
    id v13 = (void *)v31[5];
    v31[5] = (uint64_t)v14;
  }

  objc_super v15 = (void *)v31[5];
  if (a5 && !v15)
  {
    *a5 = (id) v25[5];
    objc_super v15 = (void *)v31[5];
  }
  id v16 = v15;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v16;
}

- (void)copyComponent:(id)a3 toPackageURL:(id)a4 packageLocator:(id)a5 zipFileWriter:(id)a6 encryptionKey:(id)a7 canLink:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if ([v15 isStoredOutsideObjectArchive])
  {
    id v27 = v18;
    v28 = [v15 locator];
    if (!v28)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C5870);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100160154();
      }
      id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDirectoryPackage copyComponent:toPackageURL:packageLocator:zipFileWriter:encryptionKey:canLink:completion:]");
      v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackage.mm"];
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 111, 0, "invalid nil value for '%{public}s'", "packageLocator");

      +[TSUAssertionHandler logBacktraceThrottled];
    }
    v23 = [(TSPPackage *)self fileCoordinatorDelegate];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10000E5BC;
    v39[3] = &unk_1001C58B8;
    id v24 = v20;
    id v40 = v24;
    v25 = objc_retainBlock(v39);
    uint64_t v26 = v25;
    if (v23)
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10000E738;
      v30[3] = &unk_1001C5920;
      id v31 = v28;
      id v32 = v16;
      id v33 = v17;
      v34 = self;
      id v35 = v19;
      BOOL v38 = v9;
      id v36 = v24;
      id v37 = v26;
      [v23 performReadUsingAccessor:v30];
    }
    else
    {
      ((void (*)(void *))v25[2])(v25);
    }

    id v18 = v27;
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)TSPDirectoryPackage;
    [(TSPPackage *)&v29 copyComponent:v15 toPackageURL:v16 packageLocator:v17 zipFileWriter:v18 encryptionKey:v19 canLink:v9 completion:v20];
  }
}

- (id)packageEntryInfoAtRelativePath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5940);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100160288();
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDirectoryPackage packageEntryInfoAtRelativePath:error:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackage.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 180, 0, "Invalid parameter not satisfying: %{public}s", "path");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_10000D7CC;
  v28 = sub_10000D7DC;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_10000D7CC;
  v22 = sub_10000D7DC;
  id v23 = 0;
  BOOL v9 = [(TSPPackage *)self fileCoordinatorDelegate];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000EF8C;
  v14[3] = &unk_1001C5850;
  id v10 = v6;
  id v15 = v10;
  id v16 = &v18;
  id v17 = &v24;
  [v9 performReadUsingAccessor:v14];

  v11 = (void *)v25[5];
  if (a4 && !v11)
  {
    *a4 = (id) v19[5];
    v11 = (void *)v25[5];
  }
  id v12 = v11;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (id)dataAtRelativePath:(id)a3 allowDecryption:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = sub_10000D7CC;
  v34 = sub_10000D7DC;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_10000D7CC;
  v28 = sub_10000D7DC;
  id v29 = 0;
  if (v6
    && ([(TSPPackage *)self decryptionKey],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v11 = (id *)(v25 + 5);
    id v10 = (void *)v25[5];
    v18.receiver = self;
    v18.super_class = (Class)TSPDirectoryPackage;
    id obj = v10;
    uint64_t v12 = [(TSPPackage *)&v18 dataAtRelativePath:v8 allowDecryption:1 error:&obj];
    objc_storeStrong(v11, obj);
    id v13 = (void *)v31[5];
    v31[5] = v12;
  }
  else
  {
    id v14 = [(TSPPackage *)self fileCoordinatorDelegate];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000F34C;
    v20[3] = &unk_1001C5850;
    id v21 = v8;
    v22 = &v30;
    id v23 = &v24;
    [v14 performReadUsingAccessor:v20];

    id v13 = v21;
  }

  id v15 = (void *)v31[5];
  if (a5 && !v15)
  {
    *a5 = (id) v25[5];
    id v15 = (void *)v31[5];
  }
  id v16 = v15;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v16;
}

- (id)newRawDataReadChannelAtRelativePath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10000D7CC;
  id v16 = sub_10000D7DC;
  id v17 = 0;
  id v5 = [(TSPPackage *)self fileCoordinatorDelegate];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000F560;
  v9[3] = &unk_1001C57E8;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 performReadUsingAccessor:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)hasDataAtRelativePath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(TSPPackage *)self fileCoordinatorDelegate];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F718;
  v8[3] = &unk_1001C57E8;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [v5 performReadUsingAccessor:v8];

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v4;
}

- (id)newDocumentPropertiesWithURL:(id)a3 zipProvider:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = [[TSPDocumentProperties alloc] initWithDocumentURL:v6 allowMissingPropertyList:0 error:a5];

  return v7;
}

- (void)prepareForDocumentReplacementWithSuccess:(BOOL)a3 forSafeSave:(BOOL)a4 originalURL:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  id v8 = v7;
  if (v5 && objc_msgSend(v7, "tsu_volumeRenameOpenFail"))
  {
    id v9 = [(TSPPackage *)self zipArchive];
    id v27 = 0;
    unsigned __int8 v10 = [v9 copyToTemporaryLocationRelativeToURL:v8 error:&v27];
    id v11 = v27;

    if ((v10 & 1) == 0)
    {
      unsigned int v12 = +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C5980);
      }
      uint64_t v13 = TSUAssertCat_log_t;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
        id v21 = +[TSPDirectoryPackage objectArchiveURLForPackageURL:v8];
        v22 = [v21 path];
        id v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = [v11 domain];
        id v26 = [v11 code];
        *(_DWORD *)buf = 67111170;
        unsigned int v29 = v12;
        __int16 v30 = 2082;
        id v31 = "-[TSPDirectoryPackage prepareForDocumentReplacementWithSuccess:forSafeSave:originalURL:]";
        __int16 v32 = 2082;
        id v33 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackage.mm";
        __int16 v34 = 1024;
        int v35 = 261;
        __int16 v36 = 2112;
        id v37 = v22;
        __int16 v38 = 2114;
        id v39 = v24;
        __int16 v40 = 2114;
        v41 = v25;
        __int16 v42 = 2048;
        id v43 = v26;
        __int16 v44 = 2112;
        id v45 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Failed to copy object archive %@ to temporary location. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x54u);
      }
      char v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDirectoryPackage prepareForDocumentReplacementWithSuccess:forSafeSave:originalURL:]");
      id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackage.mm"];
      id v16 = +[TSPDirectoryPackage objectArchiveURLForPackageURL:v8];
      id v17 = [v16 path];
      objc_super v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      uint64_t v20 = [v11 domain];
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 261, 0, "Failed to copy object archive %@ to temporary location. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", v17, v19, v20, [v11 code], v11);

      +[TSUAssertionHandler logBacktraceThrottled];
    }
  }
}

@end