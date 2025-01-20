@interface TSPDataCopyProviderConcrete
- (NSInputStream)inputStream;
- (NSInputStream)inputStreamInternal;
- (NSURL)URL;
- (NSURL)URLInternal;
- (NSURL)directory;
- (TSPDataCopyProviderConcrete)initWithDocumentURL:(id)a3 error:(id *)a4;
- (TSUReadChannel)readChannel;
- (TSUReadChannel)readChannelInternal;
- (id)inputStreamForRange:(_NSRange)a3;
- (void)cleanUp;
- (void)setDirectory:(id)a3;
- (void)setInputStreamInternal:(id)a3;
- (void)setReadChannelInternal:(id)a3;
- (void)setURLInternal:(id)a3;
@end

@implementation TSPDataCopyProviderConcrete

- (TSPDataCopyProviderConcrete)initWithDocumentURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TSPDataCopyProviderConcrete;
  v7 = [(TSPDataCopyProviderConcrete *)&v24 init];
  if (!v7)
  {
    id v11 = 0;
    goto LABEL_14;
  }
  v8 = +[NSFileManager defaultManager];
  v9 = v8;
  if (v6)
  {
    id v23 = 0;
    v10 = [v8 URLForDirectory:99 inDomain:1 appropriateForURL:v6 create:1 error:&v23];
    id v11 = v23;

    if (v10)
    {
LABEL_4:
      directory = v7->_directory;
      v7->_directory = v10;
      v13 = v10;

      goto LABEL_14;
    }
  }
  else
  {
    id v22 = 0;
    v14 = [v8 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v22];
    id v15 = v22;

    if (!v14) {
      goto LABEL_10;
    }
    v16 = +[NSUUID UUID];
    v17 = [v16 UUIDString];
    v10 = [v14 URLByAppendingPathComponent:v17];

    if (v10)
    {
      v18 = +[NSFileManager defaultManager];
      id v21 = v15;
      unsigned __int8 v19 = [v18 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v21];
      id v11 = v21;

      if (v19) {
        goto LABEL_4;
      }
    }
    else
    {
LABEL_10:
      id v11 = v15;
    }
  }

  if (a4)
  {
    id v11 = v11;
    v7 = 0;
    *a4 = v11;
  }
  else
  {
    v7 = 0;
  }
LABEL_14:

  return v7;
}

- (void)cleanUp
{
  v3 = +[NSFileManager defaultManager];
  v4 = [(TSPDataCopyProviderConcrete *)self directory];
  [v3 removeItemAtURL:v4 error:0];

  [(TSPDataCopyProviderConcrete *)self setURLInternal:0];
  [(TSPDataCopyProviderConcrete *)self setReadChannelInternal:0];
  [(TSPDataCopyProviderConcrete *)self setInputStreamInternal:0];
}

- (NSURL)URL
{
  v2 = [(TSPDataCopyProviderConcrete *)self URLInternal];
  if (!v2)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5C30);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016031C();
    }
    TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v4, v5, v6, v7, v8, v9, v10, (char)"-[TSPDataCopyProviderConcrete URL]");
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDataCopyProviderConcrete URL]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDataCopyProvider.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 55, 1, "invalid nil value for '%{public}s'", "URL", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDataCopyProvider.m", 55, "URL");

    TSUCrashBreakpoint();
    abort();
  }
  return (NSURL *)v2;
}

- (TSUReadChannel)readChannel
{
  v2 = [(TSPDataCopyProviderConcrete *)self readChannelInternal];
  if (!v2)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5C50);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001603B0();
    }
    TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v4, v5, v6, v7, v8, v9, v10, (char)"-[TSPDataCopyProviderConcrete readChannel]");
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDataCopyProviderConcrete readChannel]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDataCopyProvider.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 61, 1, "invalid nil value for '%{public}s'", "readChannel", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDataCopyProvider.m", 61, "readChannel");

    TSUCrashBreakpoint();
    abort();
  }
  return (TSUReadChannel *)v2;
}

- (NSInputStream)inputStream
{
  v2 = [(TSPDataCopyProviderConcrete *)self inputStreamInternal];
  if (!v2)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5C70);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100160444();
    }
    TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v4, v5, v6, v7, v8, v9, v10, (char)"-[TSPDataCopyProviderConcrete inputStream]");
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDataCopyProviderConcrete inputStream]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDataCopyProvider.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 67, 1, "invalid nil value for '%{public}s'", "inputStream", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDataCopyProvider.m", 67, "inputStream");

    TSUCrashBreakpoint();
    abort();
  }
  return (NSInputStream *)v2;
}

- (id)inputStreamForRange:(_NSRange)a3
{
  NSUInteger location = a3.location;
  NSUInteger v5 = a3.location + a3.length;
  uint64_t v6 = [TSUReadChannelInputStreamAdapter alloc];
  uint64_t v7 = [(TSPDataCopyProviderConcrete *)self readChannelInternal];
  uint64_t v8 = [(TSUReadChannelInputStreamAdapter *)v6 initWithReadChannel:v7 length:v5 closeChannelOnClose:0];

  if (location)
  {
    uint64_t v9 = [[SFUOffsetInputStream alloc] initWithInputStream:v8 initialOffset:location];

    uint64_t v8 = (TSUReadChannelInputStreamAdapter *)v9;
  }
  uint64_t v10 = [[SFUReadChannelNSInputStreamAdaptor alloc] initWithSFUInputStream:v8];
  if (!v10)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5C90);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001604D8();
    }
    TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v13, v14, v15, v16, v17, v18, v19, (char)"-[TSPDataCopyProviderConcrete inputStreamForRange:]");
    v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDataCopyProviderConcrete inputStreamForRange:]");
    id v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDataCopyProvider.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 83, 1, "invalid nil value for '%{public}s'", "inputStream", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDataCopyProvider.m", 83, "inputStream");

    TSUCrashBreakpoint();
    abort();
  }
  id v11 = v10;

  return v11;
}

- (NSURL)directory
{
  return self->_directory;
}

- (void)setDirectory:(id)a3
{
}

- (NSURL)URLInternal
{
  return self->_URLInternal;
}

- (void)setURLInternal:(id)a3
{
}

- (TSUReadChannel)readChannelInternal
{
  return self->_readChannelInternal;
}

- (void)setReadChannelInternal:(id)a3
{
}

- (NSInputStream)inputStreamInternal
{
  return self->_inputStreamInternal;
}

- (void)setInputStreamInternal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputStreamInternal, 0);
  objc_storeStrong((id *)&self->_readChannelInternal, 0);
  objc_storeStrong((id *)&self->_URLInternal, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

@end