@interface CRLZipFileWriteChannel
- (BOOL)isValid;
- (CRLZipFileWriteChannel)init;
- (CRLZipFileWriteChannel)initWithArchiveWriter:(id)a3;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)flushWithCompletion:(id)a3;
- (void)writeData:(id)a3 handler:(id)a4;
@end

@implementation CRLZipFileWriteChannel

- (CRLZipFileWriteChannel)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E9088);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 67110146;
    unsigned int v17 = v2;
    __int16 v18 = 2082;
    v19 = "-[CRLZipFileWriteChannel init]";
    __int16 v20 = 2082;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriteChannel.mm";
    __int16 v22 = 1024;
    int v23 = 20;
    __int16 v24 = 2114;
    v25 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E90A8);
  }
  v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
  {
    v7 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v17 = v2;
    __int16 v18 = 2114;
    v19 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriteChannel init]");
  v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriteChannel.mm"];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 20, 0, "Abstract method not overridden by %{public}@", v11);

  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v13, "-[CRLZipFileWriteChannel init]");
  id v15 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v14 userInfo:0];

  objc_exception_throw(v15);
}

- (CRLZipFileWriteChannel)initWithArchiveWriter:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLZipFileWriteChannel;
  v6 = [(CRLZipFileWriteChannel *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_archiveWriter, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("CRLZipFileWriteChannel.Writer", v8);
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
    int v13 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E90F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101096D2C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9110);
    }
    v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = +[CRLAssertionHandler packedBacktraceString];
      sub_101069C40(v15, (uint64_t)v30, v13);
    }

    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Channel is closed", v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[CRLZipFileWriteChannel writeData:handler:]");
    int v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriteChannel writeData:handler:]");
    __int16 v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriteChannel.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v23 file:v24 lineNumber:40 isFatal:1 description:"Channel is closed"];

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v25, v26);
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
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1002A88F4;
  v27[3] = &unk_1014E90D0;
  id v12 = v7;
  id v28 = v12;
  size_t v29 = size;
  [(CRLZipWriter *)archiveWriter addData:v6 queue:writerQueue completion:v27];
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
  int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E9130);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101096DC0();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E9150);
  }
  v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = +[CRLAssertionHandler packedBacktraceString];
    sub_101069C40(v7, (uint64_t)v13, v5);
  }

  unsigned __int8 v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileWriteChannel flushWithCompletion:]");
  dispatch_queue_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileWriteChannel.mm"];
  +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:57 isFatal:0 description:"Flushing ZIP write channel only adds a barrier."];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002A8CF0;
  v11[3] = &unk_1014DB0A0;
  id v10 = v4;
  id v12 = v10;
  [(CRLZipFileWriteChannel *)self addBarrier:v11];
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