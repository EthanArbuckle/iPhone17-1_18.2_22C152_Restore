@interface TSPZipFileWriteChannel
- (BOOL)isValid;
- (TSPZipFileWriteChannel)init;
- (TSPZipFileWriteChannel)initWithArchiveWriter:(id)a3;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)flushWithCompletion:(id)a3;
- (void)writeData:(id)a3 handler:(id)a4;
@end

@implementation TSPZipFileWriteChannel

- (TSPZipFileWriteChannel)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C6C98);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 67110146;
    unsigned int v15 = v2;
    __int16 v16 = 2082;
    v17 = "-[TSPZipFileWriteChannel init]";
    __int16 v18 = 2082;
    v19 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPZipFileWriteChannel.mm";
    __int16 v20 = 1024;
    int v21 = 20;
    __int16 v22 = 2114;
    v23 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPZipFileWriteChannel init]");
  v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPZipFileWriteChannel.mm"];
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 20, 0, "Abstract method not overridden by %{public}@", v9);

  +[TSUAssertionHandler logBacktraceThrottled];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v11, "-[TSPZipFileWriteChannel init]");
  id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (TSPZipFileWriteChannel)initWithArchiveWriter:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TSPZipFileWriteChannel;
  v6 = [(TSPZipFileWriteChannel *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_archiveWriter, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("TSPZipFileWriteChannel.Writer", v8);
    writerQueue = v7->_writerQueue;
    v7->_writerQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (void)writeData:(id)a3 handler:(id)a4
{
  v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if (v8)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6CE0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001626BC();
    }
    TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Channel is closed", v13, v14, v15, v16, v17, v18, v19, (char)"-[TSPZipFileWriteChannel writeData:handler:]");
    __int16 v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPZipFileWriteChannel writeData:handler:]");
    int v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPZipFileWriteChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:40 isFatal:1 description:"Channel is closed"];

    TSUCrashBreakpoint();
    abort();
  }
  if (v6) {
    size_t size = dispatch_data_get_size(v6);
  }
  else {
    size_t size = 0;
  }
  archiveWriter = self->_archiveWriter;
  writerQueue = self->_writerQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100027D00;
  v22[3] = &unk_1001C6CC0;
  id v12 = v7;
  id v23 = v12;
  size_t v24 = size;
  [(TSUZipWriter *)archiveWriter addData:v6 queue:writerQueue completion:v22];
}

- (void)close
{
}

- (void)addBarrier:(id)a3
{
}

- (void)flushWithCompletion:(id)a3
{
  id v4 = a3;
  +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C6D00);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_100162750();
  }
  id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPZipFileWriteChannel flushWithCompletion:]");
  v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPZipFileWriteChannel.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:57 isFatal:0 description:"Flushing ZIP write channel only adds a barrier."];

  +[TSUAssertionHandler logBacktraceThrottled];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027FDC;
  v8[3] = &unk_1001C58B8;
  id v7 = v4;
  id v9 = v7;
  [(TSPZipFileWriteChannel *)self addBarrier:v8];
}

- (BOOL)isValid
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writerQueue, 0);
  objc_storeStrong((id *)&self->_archiveWriter, 0);
}

@end