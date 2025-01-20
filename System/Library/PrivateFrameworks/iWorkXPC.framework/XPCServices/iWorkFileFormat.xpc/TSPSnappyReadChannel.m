@interface TSPSnappyReadChannel
- (BOOL)processData:(id *)a3 isDone:(BOOL)a4 handler:(id)a5;
- (TSPSnappyReadChannel)initWithReadChannel:(id)a3;
- (id)uncompressData:(id)a3;
- (id)uncompressDataFromSource:(SnappySource *)a3;
- (void)close;
- (void)dealloc;
- (void)readWithHandler:(id)a3;
- (void)readWithHandlerAndWait:(id)a3;
@end

@implementation TSPSnappyReadChannel

- (TSPSnappyReadChannel)initWithReadChannel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSPSnappyReadChannel;
  v6 = [(TSPSnappyReadChannel *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_readChannel, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  [(TSPSnappyReadChannel *)self close];
  v3.receiver = self;
  v3.super_class = (Class)TSPSnappyReadChannel;
  [(TSPSnappyReadChannel *)&v3 dealloc];
}

- (void)readWithHandler:(id)a3
{
  id v4 = a3;
  readChannel = self->_readChannel;
  if (!readChannel)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5558);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015FCC8();
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPSnappyReadChannel readWithHandler:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPSnappyReadChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:36 isFatal:0 description:"Already closed"];

    +[TSUAssertionHandler logBacktraceThrottled];
    readChannel = self->_readChannel;
  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_10000B744;
  v15[4] = sub_10000B754;
  id v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B75C;
  v9[3] = &unk_1001C5580;
  v11 = v13;
  id v8 = v4;
  v12 = v15;
  v9[4] = self;
  id v10 = v8;
  [(TSUStreamReadChannel *)readChannel readWithHandler:v9];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
}

- (void)close
{
  [(TSUStreamReadChannel *)self->_readChannel close];
  readChannel = self->_readChannel;
  self->_readChannel = 0;
}

- (void)readWithHandlerAndWait:(id)a3
{
}

- (BOOL)processData:(id *)a3 isDone:(BOOL)a4 handler:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(id, BOOL, void *, void))a5;
  id v9 = *a3;
  if (!*a3)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C55A0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015FD5C();
    }
    TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Should have data by now", v22, v23, v24, v25, v26, v27, v28, (char)"-[TSPSnappyReadChannel processData:isDone:handler:]");
    v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPSnappyReadChannel processData:isDone:handler:]");
    v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPSnappyReadChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v29 file:v30 lineNumber:67 isFatal:1 description:"Should have data by now"];

    TSUCrashBreakpoint();
    abort();
  }
  size_t size = dispatch_data_get_size((dispatch_data_t)*a3);
  TSP::SnappySource::SnappySource(v36, v9);
  v31 = (dispatch_data_t *)a3;
  unint64_t v11 = 0;
  if (size)
  {
    while ((unint64_t)TSP::SnappySource::Available((TSP::SnappySource *)v36) > 3)
    {
      for (unint64_t i = 0; i < 4; i += v14)
      {
        *(void *)buf = 0;
        v13 = (const void *)TSP::SnappySource::Peek((TSP::SnappySource *)v36, (unint64_t *)buf);
        if (4 - i >= *(void *)buf) {
          size_t v14 = *(void *)buf;
        }
        else {
          size_t v14 = 4 - i;
        }
        memcpy(&v33 + i, v13, v14);
        TSP::SnappySource::Skip((TSP::SnappySource *)v36, v14);
      }
      if (v33)
      {
        if (TSUDefaultCat_init_token != -1) {
          dispatch_once(&TSUDefaultCat_init_token, &stru_1001C5600);
        }
        v18 = TSUDefaultCat_log_t;
        if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
          sub_10015FE24(buf, &buf[1], v18);
        }
        goto LABEL_36;
      }
      unint64_t v15 = (v34 | (v35 << 16)) & 0xFFFFFFLL;
      if (TSP::SnappySource::Available((TSP::SnappySource *)v36) < v15)
      {
        if (!v5) {
          goto LABEL_37;
        }
        if (TSUDefaultCat_init_token != -1) {
          dispatch_once(&TSUDefaultCat_init_token, &stru_1001C55E0);
        }
        if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      unint64_t v11 = TSP::SnappySource::Offset((TSP::SnappySource *)v36) + v15;
      TSP::SnappySource::SetMaxOffset((uint64_t)v36, v11);
      id v16 = [(TSPSnappyReadChannel *)self uncompressDataFromSource:v36];
      if (v16)
      {
        BOOL v17 = v11 == size && v5;
        v8[2](v8, v17, v16, 0);
      }
      TSP::SnappySource::SetMaxOffset((uint64_t)v36, size);
      TSP::SnappySource::SetOffset((TSP::SnappySource *)v36, v11);

      if (!v16 || v11 >= size)
      {
        if (v16) {
          goto LABEL_19;
        }
        goto LABEL_36;
      }
    }
    if (!v5) {
      goto LABEL_37;
    }
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001C55C0);
    }
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
LABEL_35:
    }
      sub_10015FDF0();
LABEL_36:
    v19 = +[NSError tsp_readCorruptedDocumentErrorWithUserInfo:0];
    ((void (**)(id, BOOL, void *, void *))v8)[2](v8, 1, 0, v19);

    BOOL v20 = 0;
  }
  else
  {
LABEL_19:
    if (!size && v5) {
      v8[2](v8, 1, 0, 0);
    }
LABEL_37:
    BOOL v20 = 1;
    if (v11 && !v5) {
      dispatch_data_t *v31 = dispatch_data_create_subrange(*v31, v11, size - v11);
    }
  }
  TSP::SnappySource::~SnappySource((TSP::SnappySource *)v36);

  return v20;
}

- (id)uncompressDataFromSource:(SnappySource *)a3
{
  LODWORD(size) = 0;
  unint64_t v4 = TSP::SnappySource::Offset((TSP::SnappySource *)a3);
  if (snappy::GetUncompressedLength((snappy *)a3, (snappy::Source *)&size, v5))
  {
    TSP::SnappySource::SetOffset((TSP::SnappySource *)a3, v4);
    v6 = malloc_type_malloc(size, 0x85C438ADuLL);
    if (snappy::RawUncompress((snappy *)a3, (snappy::Source *)v6, v7))
    {
      dispatch_data_t v8 = dispatch_data_create(v6, size, 0, _dispatch_data_destructor_free);
      goto LABEL_14;
    }
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001C5620);
    }
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015FE64();
    }
    free(v6);
  }
  else
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001C5640);
    }
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015FE98();
    }
  }
  dispatch_data_t v8 = 0;
LABEL_14:
  return v8;
}

- (id)uncompressData:(id)a3
{
  id v3 = a3;
  unsigned int v10 = 0;
  TSP::SnappySource::SnappySource(v9, v3);
  if (snappy::GetUncompressedLength((snappy *)v9, (snappy::Source *)&v10, v4))
  {
    TSP::SnappySource::~SnappySource((TSP::SnappySource *)v9);
    TSP::SnappySource::SnappySource(v9, v3);
    BOOL v5 = malloc_type_malloc(v10, 0x733AFDCuLL);
    if (snappy::RawUncompress((snappy *)v9, (snappy::Source *)v5, v6))
    {
      dispatch_data_t v7 = dispatch_data_create(v5, v10, 0, _dispatch_data_destructor_free);
    }
    else
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001C5680);
      }
      if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_10015FE64();
      }
      free(v5);
      dispatch_data_t v7 = 0;
    }
    TSP::SnappySource::~SnappySource((TSP::SnappySource *)v9);
  }
  else
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001C5660);
    }
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015FE98();
    }
    TSP::SnappySource::~SnappySource((TSP::SnappySource *)v9);
    dispatch_data_t v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end