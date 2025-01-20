@interface TSPSnappyComponentWriteChannel
- (TSPSnappyComponentWriteChannel)initWithWriteChannel:(id)a3;
- (void)close;
- (void)dealloc;
- (void)writeBlock;
- (void)writeData:(id)a3;
@end

@implementation TSPSnappyComponentWriteChannel

- (TSPSnappyComponentWriteChannel)initWithWriteChannel:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TSPSnappyComponentWriteChannel;
  v6 = [(TSPSnappyComponentWriteChannel *)&v11 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("TSPSnappyComponentWriteChannel.Write", v7);
    writeQueue = v6->_writeQueue;
    v6->_writeQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_writeChannel, a3);
  }

  return v6;
}

- (void)dealloc
{
  if (self->_writeChannel)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C73C8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100163020();
    }
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPSnappyComponentWriteChannel dealloc]");
    v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPSnappyComponentWriteChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:32 isFatal:0 description:"Didn't close"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v5.receiver = self;
  v5.super_class = (Class)TSPSnappyComponentWriteChannel;
  [(TSPSnappyComponentWriteChannel *)&v5 dealloc];
}

- (void)writeData:(id)a3
{
  id v4 = a3;
  writeQueue = self->_writeQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002F8B4;
  v7[3] = &unk_1001C52A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(writeQueue, v7);
}

- (void)writeBlock
{
  p_uncompressedLength = &self->_uncompressedLength;
  unint64_t v4 = snappy::MaxCompressedLength(self->_uncompressedLength);
  objc_super v5 = (char *)malloc_type_malloc(v4 + 4, 0x75682831uLL);
  unint64_t v6 = *p_uncompressedLength;
  v10[0] = off_1001D33C0;
  v10[1] = self->_uncompressedBuffer;
  v10[2] = v6;
  v9[0] = off_1001D3410;
  v9[1] = v5 + 4;
  int v7 = snappy::Compress((uint64_t)v10, (uint64_t)v9);
  *objc_super v5 = 0;
  *(_WORD *)(v5 + 1) = v7;
  v5[3] = BYTE2(v7);
  dispatch_data_t v8 = dispatch_data_create(v5, (v7 + 4), 0, _dispatch_data_destructor_free);
  [(id)p_uncompressedLength[1] writeData:v8];
  unint64_t *p_uncompressedLength = 0;

  snappy::UncheckedByteArraySink::~UncheckedByteArraySink((snappy::UncheckedByteArraySink *)v9);
  snappy::ByteArraySource::~ByteArraySource((snappy::ByteArraySource *)v10);
}

- (void)close
{
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FE6C;
  block[3] = &unk_1001C56E8;
  block[4] = self;
  dispatch_sync(writeQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeChannel, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
}

@end