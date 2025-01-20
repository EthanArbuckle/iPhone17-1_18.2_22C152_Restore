@interface TSPDirectoryPackageWriterComponentFileWriteChannel
- (TSPDirectoryPackageWriterComponentFileWriteChannel)initWithURL:(id)a3 handler:(id)a4;
- (void)close;
- (void)writeData:(id)a3;
@end

@implementation TSPDirectoryPackageWriterComponentFileWriteChannel

- (TSPDirectoryPackageWriterComponentFileWriteChannel)initWithURL:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TSPDirectoryPackageWriterComponentFileWriteChannel;
  v8 = [(TSPDirectoryPackageWriterComponentFileWriteChannel *)&v16 init];
  if (v8)
  {
    v9 = (NSURL *)[v6 copy];
    URL = v8->_URL;
    v8->_URL = v9;

    id v11 = [v7 copy];
    id handler = v8->_handler;
    v8->_id handler = v11;

    v13 = [[TSUFileIOChannel alloc] initForStreamWritingURL:v8->_URL error:0];
    writeChannel = v8->_writeChannel;
    v8->_writeChannel = v13;

    if (!v8->_writeChannel)
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)writeData:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if (v5)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6AC8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162040();
    }
    TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Already closed", v7, v8, v9, v10, v11, v12, v13, (char)"-[TSPDirectoryPackageWriterComponentFileWriteChannel writeData:]");
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDirectoryPackageWriterComponentFileWriteChannel writeData:]");
    v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackageWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:278 isFatal:1 description:"Already closed"];

    TSUCrashBreakpoint();
    abort();
  }
  writeChannel = self->_writeChannel;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000244CC;
  v16[3] = &unk_1001C6AF0;
  v16[4] = self;
  [(TSUFileIOChannel *)writeChannel writeData:v4 handler:v16];
}

- (void)close
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_isClosed, 1u) & 1) == 0)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    writeChannel = self->_writeChannel;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000245C8;
    v6[3] = &unk_1001C56E8;
    unsigned __int8 v5 = v3;
    uint64_t v7 = v5;
    [(TSUFileIOChannel *)writeChannel addBarrier:v6];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    [(TSUFileIOChannel *)self->_writeChannel close];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeChannel, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end