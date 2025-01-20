@interface TSPMemoryReadChannel
- (BOOL)isValid;
- (TSPMemoryReadChannel)init;
- (TSPMemoryReadChannel)initWithDispatchData:(id)a3;
- (TSPMemoryReadChannel)initWithNSData:(id)a3;
- (void)_close;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)readFromOffsetAndWait:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)readWithHandler:(id)a3;
- (void)readWithHandlerAndWait:(id)a3;
@end

@implementation TSPMemoryReadChannel

- (TSPMemoryReadChannel)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C59A0);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPMemoryReadChannel init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPMemoryReadChannel.m";
    __int16 v14 = 1024;
    int v15 = 19;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPMemoryReadChannel init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPMemoryReadChannel.m"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:19 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPMemoryReadChannel init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPMemoryReadChannel)initWithDispatchData:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TSPMemoryReadChannel;
  v6 = [(TSPMemoryReadChannel *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchData, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("TSPMemoryReadChannel.Read", v8);
    readQueue = v7->_readQueue;
    v7->_readQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_set_specific((dispatch_queue_t)v7->_readQueue, off_1001E9248, off_1001E9248, 0);
  }

  return v7;
}

- (TSPMemoryReadChannel)initWithNSData:(id)a3
{
  v4 = objc_msgSend(a3, "tsp_dispatchData");
  id v5 = [(TSPMemoryReadChannel *)self initWithDispatchData:v4];

  return v5;
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  readQueue = self->_readQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000101D8;
  v11[3] = &unk_1001C59C8;
  int64_t v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(readQueue, v11);
}

- (void)readFromOffsetAndWait:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
}

- (void)readWithHandler:(id)a3
{
  id v4 = a3;
  readQueue = self->_readQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010324;
  v7[3] = &unk_1001C59F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(readQueue, v7);
}

- (void)addBarrier:(id)a3
{
}

- (BOOL)isValid
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  readQueue = self->_readQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000103FC;
  v5[3] = &unk_1001C5A18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(readQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)close
{
  char v3 = off_1001E9248;
  if (dispatch_get_specific(off_1001E9248) == v3)
  {
    [(TSPMemoryReadChannel *)self _close];
  }
  else
  {
    readQueue = self->_readQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000104D0;
    block[3] = &unk_1001C5A40;
    block[4] = self;
    dispatch_sync(readQueue, block);
  }
}

- (void)readWithHandlerAndWait:(id)a3
{
}

- (void)_close
{
  self->_dispatchData = 0;
  _objc_release_x1();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_dispatchData, 0);
}

@end