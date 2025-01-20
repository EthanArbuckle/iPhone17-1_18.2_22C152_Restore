@interface TSPComponentWriteChannelAdapter
- (TSPComponentWriteChannelAdapter)initWithChannel:(id)a3 handler:(id)a4;
- (void)_close;
- (void)close;
- (void)setError:(id)a3;
- (void)writeData:(id)a3;
@end

@implementation TSPComponentWriteChannelAdapter

- (TSPComponentWriteChannelAdapter)initWithChannel:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C9410);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100163F20();
    }
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPComponentWriteChannelAdapter initWithChannel:handler:]");
    v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/NSData_TSPersistence.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 254, 0, "Invalid parameter not satisfying: %{public}s", "channel");

    +[TSUAssertionHandler logBacktraceThrottled];
    id v8 = 0;
    goto LABEL_9;
  }
  v18.receiver = self;
  v18.super_class = (Class)TSPComponentWriteChannelAdapter;
  id v8 = [(TSPComponentWriteChannelAdapter *)&v18 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("TSPComponentWriteChannelAdapter.Write", v9);
    v11 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v10;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v8 + 1), off_1001E9CB0, off_1001E9CB0, 0);
    id v12 = objc_retainBlock(v7);
    v13 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v12;

    id v14 = v6;
    self = (TSPComponentWriteChannelAdapter *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v14;
LABEL_9:
  }
  return (TSPComponentWriteChannelAdapter *)v8;
}

- (void)writeData:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005439C;
  v7[3] = &unk_1001C52A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setError:(id)a3
{
}

- (void)close
{
  v3 = off_1001E9CB0;
  if (dispatch_get_specific(off_1001E9CB0) == v3)
  {
    [(TSPComponentWriteChannelAdapter *)self _close];
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000546EC;
    block[3] = &unk_1001C56E8;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

- (void)_close
{
  (*((void (**)(void))self->_handler + 2))();
  [(TSUFileIOChannel *)self->_channel close];
  channel = self->_channel;
  self->_channel = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end