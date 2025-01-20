@interface TSUCompressionReadChannel
- (TSUCompressionReadChannel)initWithReadChannel:(id)a3 compressionAlgorithm:(int)a4 operation:(int)a5;
- (void)close;
- (void)dealloc;
- (void)readWithHandler:(id)a3;
- (void)readWithHandlerAndWait:(id)a3;
@end

@implementation TSUCompressionReadChannel

- (TSUCompressionReadChannel)initWithReadChannel:(id)a3 compressionAlgorithm:(int)a4 operation:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TSUCompressionReadChannel;
  v10 = [(TSUCompressionReadChannel *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_readChannel, a3);
    v12 = [[TSUStreamCompression alloc] initWithAlgorithm:v6 operation:v5];
    compressor = v11->_compressor;
    v11->_compressor = v12;
  }
  return v11;
}

- (void)dealloc
{
  if (self->_readChannel)
  {
    int v3 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD6E0);
    }
    v4 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016777C(v3, v4);
    }
    uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUCompressionReadChannel dealloc]");
    uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUCompressionReadChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:31 isFatal:0 description:"Failed to close read channel prior to dealloc"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v7.receiver = self;
  v7.super_class = (Class)TSUCompressionReadChannel;
  [(TSUCompressionReadChannel *)&v7 dealloc];
}

- (void)close
{
  [(TSUStreamReadChannel *)self->_readChannel close];
  readChannel = self->_readChannel;
  self->_readChannel = 0;

  compressor = self->_compressor;
  self->_compressor = 0;
}

- (void)readWithHandler:(id)a3
{
  id v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 1;
  uint64_t v5 = self->_compressor;
  readChannel = self->_readChannel;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009BEB0;
  v9[3] = &unk_1001CD730;
  v12 = v13;
  objc_super v7 = v5;
  v10 = v7;
  id v8 = v4;
  id v11 = v8;
  [(TSUStreamReadChannel *)readChannel readWithHandler:v9];

  _Block_object_dispose(v13, 8);
}

- (void)readWithHandlerAndWait:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressor, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end