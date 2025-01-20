@interface CRLFileIOChannel
+ (BOOL)shouldFullFsyncOnClose;
+ (void)setShouldFullFsyncOnClose:(BOOL)a3;
- (BOOL)isValid;
- (CRLFileIOChannel)initWithType:(unint64_t)a3 URL:(id)a4 oflag:(int)a5 mode:(unsigned __int16)a6 error:(id *)a7 cleanupHandler:(id)a8;
- (CRLFileIOChannel)initWithType:(unint64_t)a3 descriptor:(int)a4 cleanupHandler:(id)a5;
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

@implementation CRLFileIOChannel

- (CRLFileIOChannel)initWithType:(unint64_t)a3 URL:(id)a4 oflag:(int)a5 mode:(unsigned __int16)a6 error:(id *)a7 cleanupHandler:(id)a8
{
  unsigned int v10 = a6;
  id v14 = a4;
  v15 = (void (**)(id, uint64_t))a8;
  if (!v14 || ([v14 isFileURL] & 1) == 0)
  {
    if (a7)
    {
      *a7 = +[NSError crl_fileReadPOSIXErrorWithNumber:2 userInfo:0];
    }
    if (v15) {
      v15[2](v15, 2);
    }
    goto LABEL_19;
  }
  v44.receiver = self;
  v44.super_class = (Class)CRLFileIOChannel;
  v16 = [(CRLFileIOChannel *)&v44 init];
  if (!v16)
  {
    if (a7)
    {
      *a7 = +[NSError crl_fileReadPOSIXErrorWithNumber:12 userInfo:0];
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
  v39[2] = sub_1000A1774;
  v39[3] = &unk_1014D16A8;
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
      v27 = +[NSError crl_fileReadPOSIXErrorWithNumber:*__error() userInfo:0];
      if (qword_101719A68 != -1) {
        dispatch_once(&qword_101719A68, &stru_1014D1710);
      }
      v30 = off_10166B498;
      if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
      {
        v31 = __error();
        v32 = strerror(*v31);
        sub_1010710C0((uint64_t)v32, buf, (uint64_t)v19, (os_log_t)v30);
      }

      v33 = __error();
      ((void (*)(void *, void))v35[2])(v35, *v33);
      goto LABEL_26;
    }
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("CRLFileIOChannel.IO", v21);
    ioQueue = v16->_ioQueue;
    v16->_ioQueue = (OS_dispatch_queue *)v22;

    v24 = v16->_ioQueue;
    cleanup_handler[0] = _NSConcreteStackBlock;
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = sub_1000A17C8;
    cleanup_handler[3] = &unk_1014D16F0;
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
        id v34 = +[NSError crl_fileReadPOSIXErrorWithNumber:2 userInfo:0];
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
  return [(CRLFileIOChannel *)self initForReadingURL:a3 error:a4 cleanupHandler:0];
}

- (id)initForReadingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return [(CRLFileIOChannel *)self initWithType:1 URL:a3 oflag:0 mode:0 error:a4 cleanupHandler:a5];
}

- (id)initForReadingDescriptor:(int)a3 cleanupHandler:(id)a4
{
  return [(CRLFileIOChannel *)self initWithType:1 descriptor:*(void *)&a3 cleanupHandler:a4];
}

- (id)initForStreamWritingURL:(id)a3 error:(id *)a4
{
  return [(CRLFileIOChannel *)self initForStreamWritingURL:a3 error:a4 cleanupHandler:0];
}

- (id)initForStreamWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return [(CRLFileIOChannel *)self initWithType:0 URL:a3 oflag:1537 mode:420 error:a4 cleanupHandler:a5];
}

- (id)initForRandomWritingURL:(id)a3 error:(id *)a4
{
  return [(CRLFileIOChannel *)self initForRandomWritingURL:a3 error:a4 cleanupHandler:0];
}

- (id)initForRandomWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return [(CRLFileIOChannel *)self initWithType:1 URL:a3 oflag:1537 mode:420 error:a4 cleanupHandler:a5];
}

- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4
{
  return [(CRLFileIOChannel *)self initForRandomReadingWritingURL:a3 error:a4 cleanupHandler:0];
}

- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return [(CRLFileIOChannel *)self initWithType:1 URL:a3 oflag:514 mode:420 error:a4 cleanupHandler:a5];
}

- (CRLFileIOChannel)initWithType:(unint64_t)a3 descriptor:(int)a4 cleanupHandler:(id)a5
{
  id v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CRLFileIOChannel;
  v9 = [(CRLFileIOChannel *)&v21 init];
  if (v9)
  {
    unsigned int v10 = v9;
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("CRLFileIOChannel.IO", v11);
    ioQueue = v10->_ioQueue;
    v10->_ioQueue = (OS_dispatch_queue *)v12;

    id v14 = v10->_ioQueue;
    cleanup_handler[0] = _NSConcreteStackBlock;
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = sub_1000A1AF4;
    cleanup_handler[3] = &unk_1014D1758;
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
  v5.super_class = (Class)CRLFileIOChannel;
  [(CRLFileIOChannel *)&v5 dealloc];
}

+ (BOOL)shouldFullFsyncOnClose
{
  unsigned __int8 v2 = atomic_load(byte_1016A8F95);
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
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1778);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010711A4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1798);
    }
    unsigned int v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFileIOChannel readFromOffset:length:handler:]");
    dispatch_queue_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLFileIOChannel.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:213 isFatal:0 description:"Channel is closed"];
  }
  p_ioQueue = &self->_ioQueue;
  ioQueue = self->_ioQueue;
  id v14 = p_ioQueue[1];
  io_handler[0] = _NSConcreteStackBlock;
  io_handler[1] = 3221225472;
  io_handler[2] = sub_1000A1ED0;
  io_handler[3] = &unk_1014D17C0;
  id v18 = v8;
  id v16 = v8;
  dispatch_io_read(v14, a3, a4, ioQueue, io_handler);
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
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D17E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107122C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1800);
    }
    v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    dispatch_queue_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFileIOChannel writeData:offset:handler:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLFileIOChannel.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:235 isFatal:0 description:"Channel is closed"];
  }
  if (!v8)
  {
    id v8 = &_dispatch_data_empty;
    id v14 = &_dispatch_data_empty;
  }
  size_t size = dispatch_data_get_size(v8);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  p_ioQueue = &self->_ioQueue;
  ioQueue = self->_ioQueue;
  v17 = p_ioQueue[1];
  io_handler[0] = _NSConcreteStackBlock;
  io_handler[1] = 3221225472;
  io_handler[2] = sub_1000A2264;
  io_handler[3] = &unk_1014D1828;
  dispatch_queue_t v22 = v24;
  size_t v23 = size;
  id v21 = v9;
  id v19 = v9;
  dispatch_io_write(v17, a4, v8, ioQueue, io_handler);

  _Block_object_dispose(v24, 8);
}

- (void)close
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_isClosed, 1u) & 1) == 0)
  {
    if (self->_channel) {
      goto LABEL_18;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1848);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010712B4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1868);
    }
    unsigned __int8 v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFileIOChannel close]");
    objc_super v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLFileIOChannel.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 259, 0, "invalid nil value for '%{public}s'", "_channel");

    if (self->_channel)
    {
LABEL_18:
      if (+[CRLFileIOChannel shouldFullFsyncOnClose])
      {
        if ((self->_oflag & 3) != 0)
        {
          dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
          channel = self->_channel;
          barrier[0] = _NSConcreteStackBlock;
          barrier[1] = 3221225472;
          barrier[2] = sub_1000A25E8;
          barrier[3] = &unk_1014CBE78;
          barrier[4] = self;
          dispatch_semaphore_t v10 = v6;
          id v8 = v6;
          dispatch_io_barrier(channel, barrier);
          dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
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
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D18E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010714DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1908);
    }
    dispatch_semaphore_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFileIOChannel setLowWater:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLFileIOChannel.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:291 isFatal:0 description:"Channel is closed"];
  }
  dispatch_io_set_low_water((dispatch_io_t)self->_channel, a3);
}

- (void)addBarrier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1928);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101071564();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1948);
    }
    dispatch_semaphore_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFileIOChannel addBarrier:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLFileIOChannel.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:297 isFatal:0 description:"Channel is closed"];
  }
  dispatch_io_barrier((dispatch_io_t)self->_channel, v4);
}

- (void)flushWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1968);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010715EC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1988);
    }
    dispatch_semaphore_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFileIOChannel flushWithCompletion:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLFileIOChannel.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:303 isFatal:0 description:"Channel is closed"];
  }
  channel = self->_channel;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A2EF4;
  v11[3] = &unk_1014D0AB0;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_io_barrier(channel, v11);
}

- (void)truncateToLength:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_isClosed);
  if (v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D19E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010716FC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1A08);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFileIOChannel truncateToLength:completion:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLFileIOChannel.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:321 isFatal:0 description:"Channel is closed"];
  }
  channel = self->_channel;
  barrier[0] = _NSConcreteStackBlock;
  barrier[1] = 3221225472;
  barrier[2] = sub_1000A3384;
  barrier[3] = &unk_1014CFF70;
  id v14 = v6;
  int64_t v15 = a3;
  barrier[4] = self;
  id v12 = v6;
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