@interface TSUFileIOChannel
+ (BOOL)shouldFullFsyncOnClose;
+ (void)setShouldFullFsyncOnClose:(BOOL)a3;
- (BOOL)isValid;
- (TSUFileIOChannel)initWithType:(unint64_t)a3 URL:(id)a4 oflag:(int)a5 mode:(unsigned __int16)a6 error:(id *)a7 cleanupHandler:(id)a8;
- (TSUFileIOChannel)initWithType:(unint64_t)a3 descriptor:(int)a4 cleanupHandler:(id)a5;
- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4;
- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5;
- (id)initForRandomWritingURL:(id)a3 error:(id *)a4;
- (id)initForRandomWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5;
- (id)initForReadingDescriptor:(int)a3 cleanupHandler:(id)a4;
- (id)initForReadingURL:(id)a3 error:(id *)a4;
- (id)initForReadingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5;
- (id)initForStreamWritingURL:(id)a3 error:(id *)a4;
- (id)initForStreamWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)dealloc;
- (void)flushWithCompletion:(id)a3;
- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)readFromOffsetAndWait:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)readWithHandler:(id)a3;
- (void)readWithHandlerAndWait:(id)a3;
- (void)setLowWater:(unint64_t)a3;
- (void)truncateToLength:(int64_t)a3 completion:(id)a4;
- (void)writeData:(id)a3 handler:(id)a4;
- (void)writeData:(id)a3 offset:(int64_t)a4 handler:(id)a5;
@end

@implementation TSUFileIOChannel

- (TSUFileIOChannel)initWithType:(unint64_t)a3 URL:(id)a4 oflag:(int)a5 mode:(unsigned __int16)a6 error:(id *)a7 cleanupHandler:(id)a8
{
  unsigned int v10 = a6;
  id v14 = a4;
  v15 = (void (**)(id, uint64_t))a8;
  if (!v14 || ([v14 isFileURL] & 1) == 0)
  {
    if (a7)
    {
      *a7 = +[NSError tsu_fileReadPOSIXErrorWithNumber:2 userInfo:0];
    }
    if (v15) {
      v15[2](v15, 2);
    }
    goto LABEL_19;
  }
  v44.receiver = self;
  v44.super_class = (Class)TSUFileIOChannel;
  v16 = [(TSUFileIOChannel *)&v44 init];
  if (!v16)
  {
    if (a7)
    {
      *a7 = +[NSError tsu_fileReadPOSIXErrorWithNumber:12 userInfo:0];
    }
    if (v15) {
      v15[2](v15, 12);
    }
    self = 0;
LABEL_19:
    v28 = 0;
    goto LABEL_20;
  }
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000A94B8;
  v39[3] = &unk_1001CDF48;
  v41 = v42;
  v17 = v15;
  v40 = v17;
  v35 = objc_retainBlock(v39);
  v16->_oflag = a5;
  id v18 = [v14 path];
  v19 = (const char *)[v18 fileSystemRepresentation];

  if (v19)
  {
    if ((a5 & 0x400) != 0) {
      unlink(v19);
    }
    dispatch_fd_t v20 = open(v19, a5, v10);
    if (v20 < 0)
    {
      v27 = +[NSError tsu_fileReadPOSIXErrorWithNumber:*__error() userInfo:0];
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001CDFB0);
      }
      v30 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
      {
        v31 = __error();
        v32 = strerror(*v31);
        sub_1001691A4((uint64_t)v32, buf, (uint64_t)v19, (os_log_t)v30);
      }

      v33 = __error();
      ((void (*)(void *, void))v35[2])(v35, *v33);
      goto LABEL_26;
    }
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("TSUFileIOChannel.IO", v21);
    ioQueue = v16->_ioQueue;
    v16->_ioQueue = (OS_dispatch_queue *)v22;

    v24 = v16->_ioQueue;
    cleanup_handler[0] = _NSConcreteStackBlock;
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = sub_1000A950C;
    cleanup_handler[3] = &unk_1001CDF90;
    dispatch_fd_t v38 = v20;
    v37 = v17;
    dispatch_io_t v25 = dispatch_io_create(a3, v20, v24, cleanup_handler);
    channel = v16->_channel;
    v16->_channel = (OS_dispatch_io *)v25;
  }
  v27 = 0;
LABEL_26:
  if (!v16->_channel)
  {
    if (a7)
    {
      if (v27)
      {
        *a7 = v27;
      }
      else
      {
        id v34 = +[NSError tsu_fileReadPOSIXErrorWithNumber:2 userInfo:0];
        *a7 = v34;
      }
    }
    ((void (*)(void *, uint64_t))v35[2])(v35, 2);

    v16 = 0;
  }
  self = v16;

  _Block_object_dispose(v42, 8);
  v28 = self;
LABEL_20:

  return v28;
}

- (id)initForReadingURL:(id)a3 error:(id *)a4
{
  return [(TSUFileIOChannel *)self initForReadingURL:a3 error:a4 cleanupHandler:0];
}

- (id)initForReadingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return [(TSUFileIOChannel *)self initWithType:1 URL:a3 oflag:0 mode:0 error:a4 cleanupHandler:a5];
}

- (id)initForReadingDescriptor:(int)a3 cleanupHandler:(id)a4
{
  return [(TSUFileIOChannel *)self initWithType:1 descriptor:*(void *)&a3 cleanupHandler:a4];
}

- (id)initForStreamWritingURL:(id)a3 error:(id *)a4
{
  return [(TSUFileIOChannel *)self initForStreamWritingURL:a3 error:a4 cleanupHandler:0];
}

- (id)initForStreamWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return [(TSUFileIOChannel *)self initWithType:0 URL:a3 oflag:1537 mode:420 error:a4 cleanupHandler:a5];
}

- (id)initForRandomWritingURL:(id)a3 error:(id *)a4
{
  return [(TSUFileIOChannel *)self initForRandomWritingURL:a3 error:a4 cleanupHandler:0];
}

- (id)initForRandomWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return [(TSUFileIOChannel *)self initWithType:1 URL:a3 oflag:1537 mode:420 error:a4 cleanupHandler:a5];
}

- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4
{
  return [(TSUFileIOChannel *)self initForRandomReadingWritingURL:a3 error:a4 cleanupHandler:0];
}

- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return [(TSUFileIOChannel *)self initWithType:1 URL:a3 oflag:514 mode:420 error:a4 cleanupHandler:a5];
}

- (TSUFileIOChannel)initWithType:(unint64_t)a3 descriptor:(int)a4 cleanupHandler:(id)a5
{
  id v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TSUFileIOChannel;
  v9 = [(TSUFileIOChannel *)&v21 init];
  if (v9)
  {
    unsigned int v10 = v9;
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("TSUFileIOChannel.IO", v11);
    ioQueue = v10->_ioQueue;
    v10->_ioQueue = (OS_dispatch_queue *)v12;

    id v14 = v10->_ioQueue;
    cleanup_handler[0] = _NSConcreteStackBlock;
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = sub_1000A9838;
    cleanup_handler[3] = &unk_1001CDFF8;
    id v20 = v8;
    dispatch_io_t v15 = dispatch_io_create(a3, a4, v14, cleanup_handler);
    channel = v10->_channel;
    v10->_channel = (OS_dispatch_io *)v15;

    if (!v10->_channel)
    {

      unsigned int v10 = 0;
    }
    v17 = v10;
  }
  else
  {
    if (v8) {
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 12);
    }
    v17 = 0;
  }

  return v17;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if ((v3 & 1) == 0)
  {
    channel = self->_channel;
    if (channel) {
      dispatch_io_close(channel, 0);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)TSUFileIOChannel;
  [(TSUFileIOChannel *)&v5 dealloc];
}

+ (BOOL)shouldFullFsyncOnClose
{
  unsigned __int8 v2 = atomic_load(byte_1001EB968);
  return v2 & 1;
}

+ (void)setShouldFullFsyncOnClose:(BOOL)a3
{
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if (v9)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE018);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100169288();
    }
    unsigned int v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUFileIOChannel readFromOffset:length:handler:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUFileIOChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:215 isFatal:0 description:"Channel is closed"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  p_ioQueue = &self->_ioQueue;
  ioQueue = self->_ioQueue;
  v13 = p_ioQueue[1];
  io_handler[0] = _NSConcreteStackBlock;
  io_handler[1] = 3221225472;
  io_handler[2] = sub_1000A9B88;
  io_handler[3] = &unk_1001CE040;
  id v17 = v8;
  id v15 = v8;
  dispatch_io_read(v13, a3, a4, ioQueue, io_handler);
}

- (void)readFromOffsetAndWait:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
}

- (void)readWithHandler:(id)a3
{
}

- (void)writeData:(id)a3 handler:(id)a4
{
}

- (void)writeData:(id)a3 offset:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if (v10)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE060);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100169310();
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUFileIOChannel writeData:offset:handler:]");
    dispatch_queue_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUFileIOChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:237 isFatal:0 description:"Channel is closed"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (!v8)
  {
    id v8 = &_dispatch_data_empty;
    id v13 = &_dispatch_data_empty;
  }
  size_t size = dispatch_data_get_size(v8);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  p_ioQueue = &self->_ioQueue;
  ioQueue = self->_ioQueue;
  v16 = p_ioQueue[1];
  io_handler[0] = _NSConcreteStackBlock;
  io_handler[1] = 3221225472;
  io_handler[2] = sub_1000A9E90;
  io_handler[3] = &unk_1001CE088;
  objc_super v21 = v23;
  size_t v22 = size;
  id v20 = v9;
  id v18 = v9;
  dispatch_io_write(v16, a4, v8, ioQueue, io_handler);

  _Block_object_dispose(v23, 8);
}

- (void)close
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_isClosed, 1u) & 1) == 0)
  {
    if (self->_channel) {
      goto LABEL_14;
    }
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE0A8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100169398();
    }
    unsigned __int8 v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUFileIOChannel close]");
    v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUFileIOChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 261, 0, "invalid nil value for '%{public}s'", "_channel");

    +[TSUAssertionHandler logBacktraceThrottled];
    if (self->_channel)
    {
LABEL_14:
      if (+[TSUFileIOChannel shouldFullFsyncOnClose])
      {
        if ((self->_oflag & 3) != 0)
        {
          dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
          channel = self->_channel;
          barrier[0] = _NSConcreteStackBlock;
          barrier[1] = 3221225472;
          barrier[2] = sub_1000AA194;
          barrier[3] = &unk_1001C92D0;
          barrier[4] = self;
          v7 = v5;
          id v9 = v7;
          dispatch_io_barrier(channel, barrier);
          dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
        }
      }
      dispatch_io_close((dispatch_io_t)self->_channel, 0);
    }
  }
}

- (void)readWithHandlerAndWait:(id)a3
{
}

- (void)setLowWater:(unint64_t)a3
{
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if (v5)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE108);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001695C4();
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUFileIOChannel setLowWater:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUFileIOChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:293 isFatal:0 description:"Channel is closed"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  dispatch_io_set_low_water((dispatch_io_t)self->_channel, a3);
}

- (void)addBarrier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if (v5)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE128);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016964C();
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUFileIOChannel addBarrier:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUFileIOChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:299 isFatal:0 description:"Channel is closed"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  dispatch_io_barrier((dispatch_io_t)self->_channel, v4);
}

- (void)flushWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if (v5)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE148);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001696D4();
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUFileIOChannel flushWithCompletion:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUFileIOChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:305 isFatal:0 description:"Channel is closed"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  channel = self->_channel;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000AA880;
  v10[3] = &unk_1001C59F0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_io_barrier(channel, v10);
}

- (void)truncateToLength:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if (v7)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE188);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001697E4();
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUFileIOChannel truncateToLength:completion:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUFileIOChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:323 isFatal:0 description:"Channel is closed"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  channel = self->_channel;
  barrier[0] = _NSConcreteStackBlock;
  barrier[1] = 3221225472;
  barrier[2] = sub_1000AAC08;
  barrier[3] = &unk_1001CE1D0;
  id v13 = v6;
  int64_t v14 = a3;
  barrier[4] = self;
  id v11 = v6;
  dispatch_io_barrier(channel, barrier);
}

- (BOOL)isValid
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if (v2) {
    return 0;
  }
  dispatch_fd_t descriptor = dispatch_io_get_descriptor((dispatch_io_t)self->_channel);
  char v5 = 0;
  return read(descriptor, &v5, 0) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
}

@end