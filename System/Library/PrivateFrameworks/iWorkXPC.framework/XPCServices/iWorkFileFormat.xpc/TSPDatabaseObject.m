@interface TSPDatabaseObject
+ (id)databaseObjectWithIdentifier:(int64_t)a3 classType:(int)a4 dataState:(int64_t)a5;
+ (id)databaseObjectWithIdentifier:(int64_t)a3 classType:(int)a4 fileState:(id)a5 packageURL:(id)a6;
- (BOOL)hasDataState;
- (BOOL)hasFileState;
- (NSString)fileState;
- (NSURL)fileURL;
- (TSPDatabaseObject)init;
- (TSPDatabaseObject)initWithIdentifier:(int64_t)a3 classType:(int)a4;
- (int)classType;
- (int64_t)dataState;
- (int64_t)identifier;
@end

@implementation TSPDatabaseObject

- (TSPDatabaseObject)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C9450);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPDatabaseObject init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabaseObject.mm";
    __int16 v14 = 1024;
    int v15 = 27;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabaseObject init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabaseObject.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:27 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPDatabaseObject init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPDatabaseObject)initWithIdentifier:(int64_t)a3 classType:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSPDatabaseObject;
  result = [(TSPDatabaseObject *)&v7 init];
  if (result)
  {
    result->_identifier = a3;
    result->_classType = a4;
  }
  return result;
}

+ (id)databaseObjectWithIdentifier:(int64_t)a3 classType:(int)a4 dataState:(int64_t)a5
{
  v5 = [[TSPDatabaseObjectWithDataState alloc] initWithIdentifier:a3 classType:*(void *)&a4 dataState:a5];
  return v5;
}

+ (id)databaseObjectWithIdentifier:(int64_t)a3 classType:(int)a4 fileState:(id)a5 packageURL:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a5;
  id v10 = a6;
  v11 = [[TSPDatabaseObjectWithFileState alloc] initWithIdentifier:a3 classType:v7 fileState:v9 packageURL:v10];

  return v11;
}

- (BOOL)hasDataState
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C9470);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 67110146;
    unsigned int v15 = v2;
    __int16 v16 = 2082;
    v17 = "-[TSPDatabaseObject hasDataState]";
    __int16 v18 = 2082;
    v19 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabaseObject.mm";
    __int16 v20 = 1024;
    int v21 = 49;
    __int16 v22 = 2114;
    v23 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabaseObject hasDataState]");
  uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabaseObject.mm"];
  v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 49, 0, "Abstract method not overridden by %{public}@", v9);

  +[TSUAssertionHandler logBacktraceThrottled];
  id v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  __int16 v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v11, "-[TSPDatabaseObject hasDataState]");
  id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (int64_t)dataState
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C9490);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 67110146;
    unsigned int v15 = v2;
    __int16 v16 = 2082;
    v17 = "-[TSPDatabaseObject dataState]";
    __int16 v18 = 2082;
    v19 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabaseObject.mm";
    __int16 v20 = 1024;
    int v21 = 53;
    __int16 v22 = 2114;
    v23 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabaseObject dataState]");
  uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabaseObject.mm"];
  v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 53, 0, "Abstract method not overridden by %{public}@", v9);

  +[TSUAssertionHandler logBacktraceThrottled];
  id v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  __int16 v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v11, "-[TSPDatabaseObject dataState]");
  id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (BOOL)hasFileState
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C94B0);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 67110146;
    unsigned int v15 = v2;
    __int16 v16 = 2082;
    v17 = "-[TSPDatabaseObject hasFileState]";
    __int16 v18 = 2082;
    v19 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabaseObject.mm";
    __int16 v20 = 1024;
    int v21 = 57;
    __int16 v22 = 2114;
    v23 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabaseObject hasFileState]");
  uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabaseObject.mm"];
  v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 57, 0, "Abstract method not overridden by %{public}@", v9);

  +[TSUAssertionHandler logBacktraceThrottled];
  id v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  __int16 v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v11, "-[TSPDatabaseObject hasFileState]");
  id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (NSString)fileState
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C94D0);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 67110146;
    unsigned int v15 = v2;
    __int16 v16 = 2082;
    v17 = "-[TSPDatabaseObject fileState]";
    __int16 v18 = 2082;
    v19 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabaseObject.mm";
    __int16 v20 = 1024;
    int v21 = 61;
    __int16 v22 = 2114;
    v23 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabaseObject fileState]");
  uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabaseObject.mm"];
  v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 61, 0, "Abstract method not overridden by %{public}@", v9);

  +[TSUAssertionHandler logBacktraceThrottled];
  id v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  __int16 v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v11, "-[TSPDatabaseObject fileState]");
  id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (NSURL)fileURL
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C94F0);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 67110146;
    unsigned int v15 = v2;
    __int16 v16 = 2082;
    v17 = "-[TSPDatabaseObject fileURL]";
    __int16 v18 = 2082;
    v19 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabaseObject.mm";
    __int16 v20 = 1024;
    int v21 = 65;
    __int16 v22 = 2114;
    v23 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabaseObject fileURL]");
  uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabaseObject.mm"];
  v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 65, 0, "Abstract method not overridden by %{public}@", v9);

  +[TSUAssertionHandler logBacktraceThrottled];
  id v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  __int16 v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v11, "-[TSPDatabaseObject fileURL]");
  id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (int)classType
{
  return self->_classType;
}

@end