@interface TSPCompressionComponentWriteChannel
- (TSPCompressionComponentWriteChannel)initWithWriteChannel:(id)a3 compressionAlgorithm:(int)a4 operation:(int)a5;
- (void)close;
- (void)dealloc;
- (void)writeData:(id)a3;
@end

@implementation TSPCompressionComponentWriteChannel

- (TSPCompressionComponentWriteChannel)initWithWriteChannel:(id)a3 compressionAlgorithm:(int)a4 operation:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TSPCompressionComponentWriteChannel;
  v10 = [(TSPCompressionComponentWriteChannel *)&v17 init];
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("TSPCompressionComponentWriteChannel.Write", v11);
    writeQueue = v10->_writeQueue;
    v10->_writeQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_writeChannel, a3);
    v14 = [[TSUStreamCompression alloc] initWithAlgorithm:v6 operation:v5];
    compressor = v10->_compressor;
    v10->_compressor = v14;
  }
  return v10;
}

- (void)dealloc
{
  if (self->_writeChannel)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C9218);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100163B98();
    }
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCompressionComponentWriteChannel dealloc]");
    v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCompressionComponentWriteChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:29 isFatal:0 description:"Failed to close write channel prior to dealloc"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v5.receiver = self;
  v5.super_class = (Class)TSPCompressionComponentWriteChannel;
  [(TSPCompressionComponentWriteChannel *)&v5 dealloc];
}

- (void)close
{
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052B40;
  block[3] = &unk_1001C5A40;
  block[4] = self;
  dispatch_sync(writeQueue, block);
}

- (void)writeData:(id)a3
{
  id v4 = a3;
  writeQueue = self->_writeQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100052C3C;
  v7[3] = &unk_1001C92D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(writeQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressor, 0);
  objc_storeStrong((id *)&self->_writeChannel, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
}

@end