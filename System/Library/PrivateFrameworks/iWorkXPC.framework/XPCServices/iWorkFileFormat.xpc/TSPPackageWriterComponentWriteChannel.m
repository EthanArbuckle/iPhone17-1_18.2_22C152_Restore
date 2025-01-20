@interface TSPPackageWriterComponentWriteChannel
- (TSPPackageWriterComponentWriteChannel)initWithArchiveWriter:(id)a3;
- (void)close;
- (void)writeData:(id)a3;
@end

@implementation TSPPackageWriterComponentWriteChannel

- (TSPPackageWriterComponentWriteChannel)initWithArchiveWriter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSPPackageWriterComponentWriteChannel;
  v6 = [(TSPPackageWriterComponentWriteChannel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_archiveWriter, a3);
  }

  return v7;
}

- (void)writeData:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isClosed);
  id v17 = v4;
  if (v5)
  {
    int v6 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C61D8);
    }
    v7 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016145C(v6, v7);
    }
    TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Channel is closed", v8, v9, v10, v11, v12, v13, v14, (char)"-[TSPPackageWriterComponentWriteChannel writeData:]");
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageWriterComponentWriteChannel writeData:]");
    v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriterComponentWriteChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:30 isFatal:1 description:"Channel is closed"];

    TSUCrashBreakpoint();
    abort();
  }
  [(TSUZipWriter *)self->_archiveWriter addData:v4];
}

- (void)close
{
}

- (void).cxx_destruct
{
}

@end