@interface CRLBoardItemImporter
+ (BOOL)canImportRemoteURL:(id)a3;
+ (BOOL)isSupportedAnimatedImageFileType:(id)a3;
+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4;
+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4;
+ (BOOL)protected_canImportFromRemoteURL:(id)a3;
+ (CRLBoardItemImporter)allocWithZone:(_NSZone *)a3;
+ (Class)p_subclassForPreinsertionAssetWrapper:(id)a3;
+ (Class)p_subclassForURL:(id)a3;
+ (NSArray)protected_supportedAnimatedImageFileTypes;
+ (NSArray)protected_supportedAnimatedImageFileUTTypes;
+ (NSArray)protected_supportedFileTypes;
+ (NSArray)protected_supportedFileUTTypes;
+ (NSArray)protected_supportedRemoteURLSchemes;
+ (NSArray)supportedFileTypes;
+ (NSArray)supportedFileUTTypes;
+ (NSArray)supportedImageFileTypes;
+ (NSArray)supportedImageFileUTTypes;
+ (NSArray)supportedMovieFileUTTypes;
+ (NSArray)supportedRemoteURLSchemes;
+ (NSString)defaultPastedImageName;
+ (NSString)defaultPastedMovieName;
+ (void)p_enumerateRegisteredSubclassesUsingBlock:(id)a3;
+ (void)p_registerDefaultSubclassesIfNeeded;
+ (void)registerSubclass:(Class)a3;
- (BOOL)usesProgressDialog;
- (CRLBoardItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4;
- (CRLBoardItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4;
- (CRLBoardItemImporterDelegate)delegate;
- (CRLProgress)progress;
- (NSError)error;
- (NSString)suggestedName;
- (NSURL)URL;
- (_TtC8Freeform12CRLBoardItem)boardItem;
- (_TtC8Freeform19CRLBoardItemFactory)boardItemFactory;
- (_TtC8Freeform27CRLPreinsertionAssetWrapper)preinsertionAsset;
- (id)p_placeholderInit;
- (unint64_t)embeddedDataLength;
- (unint64_t)uploadDataLength;
- (void)cancel;
- (void)importBoardItemWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSuggestedName:(id)a3;
@end

@implementation CRLBoardItemImporter

+ (void)p_registerDefaultSubclassesIfNeeded
{
  if (!qword_1016A9818 && qword_1016A9820 != -1) {
    dispatch_once(&qword_1016A9820, &stru_1014F2B78);
  }
}

+ (void)registerSubclass:(Class)a3
{
  if (a3 != a1 && ([(objc_class *)a3 isSubclassOfClass:a1] & 1) != 0) {
    goto LABEL_16;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2B98);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A6D98();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2BB8);
  }
  v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v5);
  }
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBoardItemImporter registerSubclass:]");
  v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 70, 0, "Invalid parameter not satisfying: %{public}s", "(importerSubclass != self) && [importerSubclass isSubclassOfClass:self]");

  if (a3 != a1)
  {
LABEL_16:
    if ([(objc_class *)a3 isSubclassOfClass:a1])
    {
      [a1 p_registerDefaultSubclassesIfNeeded];
      [(id)qword_1016A9818 addObject:a3];
    }
  }
}

+ (void)p_enumerateRegisteredSubclassesUsingBlock:(id)a3
{
  id v4 = a3;
  [a1 p_registerDefaultSubclassesIfNeeded];
  v5 = (void *)qword_1016A9818;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100380F24;
  v7[3] = &unk_1014F2BE0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsWithOptions:2 usingBlock:v7];
}

+ (NSArray)supportedFileTypes
{
  +[NSMutableSet set];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100380FFC;
  v6[3] = &unk_1014F2C08;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v7;
  [a1 p_enumerateRegisteredSubclassesUsingBlock:v6];
  id v4 = [v3 allObjects];

  return (NSArray *)v4;
}

+ (NSArray)supportedFileUTTypes
{
  +[NSMutableSet set];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100381120;
  v6[3] = &unk_1014F2C08;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v7;
  [a1 p_enumerateRegisteredSubclassesUsingBlock:v6];
  id v4 = [v3 allObjects];

  return (NSArray *)v4;
}

+ (NSArray)supportedImageFileTypes
{
  return (NSArray *)+[CRLImageItemImporter protected_supportedFileTypes];
}

+ (NSArray)supportedImageFileUTTypes
{
  return (NSArray *)+[CRLImageItemImporter protected_supportedFileUTTypes];
}

+ (NSArray)supportedMovieFileUTTypes
{
  return (NSArray *)+[CRLMovieItemImporter protected_supportedFileUTTypes];
}

+ (BOOL)isSupportedAnimatedImageFileType:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableSet set];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100381278;
  v9[3] = &unk_1014F2C08;
  v9[4] = v5;
  [a1 p_enumerateRegisteredSubclassesUsingBlock:v9];
  id v6 = [v5 allObjects];
  unsigned __int8 v7 = [v4 crl_conformsToAnyUTI:v6];

  return v7;
}

+ (NSArray)supportedRemoteURLSchemes
{
  +[NSMutableSet set];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10038139C;
  v6[3] = &unk_1014F2C08;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v7;
  [a1 p_enumerateRegisteredSubclassesUsingBlock:v6];
  id v4 = [v3 allObjects];

  return (NSArray *)v4;
}

+ (BOOL)canImportRemoteURL:(id)a3
{
  return [a1 p_subclassForURL:a3] != 0;
}

+ (NSArray)protected_supportedFileTypes
{
  return (NSArray *)&__NSArray0__struct;
}

+ (NSArray)protected_supportedFileUTTypes
{
  return (NSArray *)&__NSArray0__struct;
}

+ (NSArray)protected_supportedAnimatedImageFileTypes
{
  return (NSArray *)&__NSArray0__struct;
}

+ (NSArray)protected_supportedAnimatedImageFileUTTypes
{
  return (NSArray *)&__NSArray0__struct;
}

+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4
{
  return 1;
}

+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4
{
  return 1;
}

+ (NSArray)protected_supportedRemoteURLSchemes
{
  return (NSArray *)&__NSArray0__struct;
}

+ (BOOL)protected_canImportFromRemoteURL:(id)a3
{
  return 0;
}

+ (Class)p_subclassForURL:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  uint64_t v20 = 0;
  unsigned int v5 = [v4 isFileURL];
  char v6 = v5;
  if (v5)
  {
    id v7 = [v4 crl_fileTypeIdentifierHandlingFileCoordinationPromises];
  }
  else
  {
    id v7 = 0;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003815B4;
  v12[3] = &unk_1014F2C30;
  char v16 = v6;
  id v8 = v7;
  id v13 = v8;
  id v9 = v4;
  id v14 = v9;
  v15 = &v17;
  [a1 p_enumerateRegisteredSubclassesUsingBlock:v12];
  id v10 = (id)v18[3];

  _Block_object_dispose(&v17, 8);

  return (Class)v10;
}

+ (Class)p_subclassForPreinsertionAssetWrapper:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2050000000;
  uint64_t v15 = 0;
  unsigned int v5 = [v4 type];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003818B8;
  v9[3] = &unk_1014F2C58;
  v9[4] = v5;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [a1 p_enumerateRegisteredSubclassesUsingBlock:v9];
  id v7 = (id)v13[3];

  _Block_object_dispose(&v12, 8);

  return (Class)v7;
}

+ (CRLBoardItemImporter)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (CRLBoardItemImporter *)+[CRLBoardItemImporterPlaceholder allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___CRLBoardItemImporter;
    return [super allocWithZone:a3];
  }
}

- (CRLBoardItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2C78);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A6E2C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2C98);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter initWithURL:boardItemFactory:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 266, 0, "Invalid parameter not satisfying: %{public}s", "URL != nil");
  }
  v15.receiver = self;
  v15.super_class = (Class)CRLBoardItemImporter;
  v11 = [(CRLBoardItemImporter *)&v15 init];
  if (v11)
  {
    uint64_t v12 = (NSURL *)[v6 copy];
    URL = v11->_URL;
    v11->_URL = v12;

    objc_storeStrong((id *)&v11->_boardItemFactory, a4);
  }

  return v11;
}

- (CRLBoardItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2CB8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A6EC0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2CD8);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter initWithData:boardItemFactory:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 279, 0, "Invalid parameter not satisfying: %{public}s", "assetWrapper != nil");
  }
  v15.receiver = self;
  v15.super_class = (Class)CRLBoardItemImporter;
  uint64_t v12 = [(CRLBoardItemImporter *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_preinsertionAsset, a3);
    objc_storeStrong((id *)&v13->_boardItemFactory, a4);
  }

  return v13;
}

- (id)p_placeholderInit
{
  uint64_t v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2CF8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A6F54();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2D18);
    }
    unsigned int v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter p_placeholderInit]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:295 isFatal:0 description:"Do not call method"];

    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLBoardItemImporter p_placeholderInit]");
    id v9 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v8 userInfo:0];

    objc_exception_throw(v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)CRLBoardItemImporter;
  return [(CRLBoardItemImporter *)&v10 init];
}

- (void)importBoardItemWithCompletionHandler:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2D38);
  }
  unsigned int v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v6 = v5;
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 67110146;
    unsigned int v21 = v4;
    __int16 v22 = 2082;
    v23 = "-[CRLBoardItemImporter importBoardItemWithCompletionHandler:]";
    __int16 v24 = 2082;
    v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m";
    __int16 v26 = 1024;
    int v27 = 302;
    __int16 v28 = 2114;
    v29 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2D58);
  }
  id v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    objc_super v10 = v9;
    v11 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v21 = v4;
    __int16 v22 = 2114;
    v23 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter importBoardItemWithCompletionHandler:]");
  id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"];
  uint64_t v14 = (objc_class *)objc_opt_class();
  objc_super v15 = NSStringFromClass(v14);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 302, 0, "Abstract method not overridden by %{public}@", v15);

  char v16 = (objc_class *)objc_opt_class();
  uint64_t v17 = NSStringFromClass(v16);
  v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v17, "-[CRLBoardItemImporter importBoardItemWithCompletionHandler:]");
  id v19 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v18 userInfo:0];

  objc_exception_throw(v19);
}

- (void)cancel
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2D78);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unsigned int v4 = v3;
    unsigned int v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    unsigned int v21 = "-[CRLBoardItemImporter cancel]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m";
    __int16 v24 = 1024;
    int v25 = 306;
    __int16 v26 = 2114;
    int v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2D98);
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    id v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    unsigned int v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  objc_super v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter cancel]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"];
  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 306, 0, "Abstract method not overridden by %{public}@", v13);

  uint64_t v14 = (objc_class *)objc_opt_class();
  objc_super v15 = NSStringFromClass(v14);
  char v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLBoardItemImporter cancel]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (BOOL)usesProgressDialog
{
  return 1;
}

- (CRLProgress)progress
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2DB8);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unsigned int v4 = v3;
    unsigned int v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    unsigned int v21 = "-[CRLBoardItemImporter progress]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m";
    __int16 v24 = 1024;
    int v25 = 314;
    __int16 v26 = 2114;
    int v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2DD8);
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    id v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    unsigned int v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  objc_super v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter progress]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"];
  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 314, 0, "Abstract method not overridden by %{public}@", v13);

  uint64_t v14 = (objc_class *)objc_opt_class();
  objc_super v15 = NSStringFromClass(v14);
  char v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLBoardItemImporter progress]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2DF8);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unsigned int v4 = v3;
    unsigned int v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    unsigned int v21 = "-[CRLBoardItemImporter boardItem]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m";
    __int16 v24 = 1024;
    int v25 = 320;
    __int16 v26 = 2114;
    int v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2E18);
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    id v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    unsigned int v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  objc_super v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter boardItem]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"];
  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 320, 0, "Abstract method not overridden by %{public}@", v13);

  uint64_t v14 = (objc_class *)objc_opt_class();
  objc_super v15 = NSStringFromClass(v14);
  char v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLBoardItemImporter boardItem]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (NSError)error
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2E38);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unsigned int v4 = v3;
    unsigned int v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    unsigned int v21 = "-[CRLBoardItemImporter error]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m";
    __int16 v24 = 1024;
    int v25 = 326;
    __int16 v26 = 2114;
    int v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2E58);
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    id v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    unsigned int v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  objc_super v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter error]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"];
  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 326, 0, "Abstract method not overridden by %{public}@", v13);

  uint64_t v14 = (objc_class *)objc_opt_class();
  objc_super v15 = NSStringFromClass(v14);
  char v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLBoardItemImporter error]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (unint64_t)uploadDataLength
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2E78);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unsigned int v4 = v3;
    unsigned int v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    unsigned int v21 = "-[CRLBoardItemImporter uploadDataLength]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m";
    __int16 v24 = 1024;
    int v25 = 332;
    __int16 v26 = 2114;
    int v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2E98);
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    id v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    unsigned int v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  objc_super v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter uploadDataLength]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"];
  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 332, 0, "Abstract method not overridden by %{public}@", v13);

  uint64_t v14 = (objc_class *)objc_opt_class();
  objc_super v15 = NSStringFromClass(v14);
  char v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLBoardItemImporter uploadDataLength]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (unint64_t)embeddedDataLength
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2EB8);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unsigned int v4 = v3;
    unsigned int v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    unsigned int v21 = "-[CRLBoardItemImporter embeddedDataLength]";
    __int16 v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m";
    __int16 v24 = 1024;
    int v25 = 338;
    __int16 v26 = 2114;
    int v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F2ED8);
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    id v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    unsigned int v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  objc_super v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter embeddedDataLength]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"];
  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 338, 0, "Abstract method not overridden by %{public}@", v13);

  uint64_t v14 = (objc_class *)objc_opt_class();
  objc_super v15 = NSStringFromClass(v14);
  char v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLBoardItemImporter embeddedDataLength]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

+ (NSString)defaultPastedImageName
{
  unsigned int v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"pasted-image" value:0 table:0];

  return (NSString *)v3;
}

+ (NSString)defaultPastedMovieName
{
  unsigned int v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"pasted-movie" value:0 table:0];

  return (NSString *)v3;
}

- (_TtC8Freeform19CRLBoardItemFactory)boardItemFactory
{
  return self->_boardItemFactory;
}

- (NSURL)URL
{
  return self->_URL;
}

- (_TtC8Freeform27CRLPreinsertionAssetWrapper)preinsertionAsset
{
  return self->_preinsertionAsset;
}

- (CRLBoardItemImporterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLBoardItemImporterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (void)setSuggestedName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preinsertionAsset, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_boardItemFactory, 0);
}

@end