@interface TSUZipInflateReadChannel
- (BOOL)processData:(id)a3 inflateResult:(int *)a4 CRC:(unsigned int *)a5 isDone:(BOOL)a6 handler:(id)a7;
- (TSUZipInflateReadChannel)initWithReadChannel:(id)a3 uncompressedSize:(unint64_t)a4 CRC:(unsigned int)a5 validateCRC:(BOOL)a6;
- (void)close;
- (void)dealloc;
- (void)handleFailureWithHandler:(id)a3 error:(id)a4;
- (void)prepareBuffer;
- (void)readWithHandler:(id)a3;
- (void)readWithHandlerAndWait:(id)a3;
@end

@implementation TSUZipInflateReadChannel

- (TSUZipInflateReadChannel)initWithReadChannel:(id)a3 uncompressedSize:(unint64_t)a4 CRC:(unsigned int)a5 validateCRC:(BOOL)a6
{
  id v11 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TSUZipInflateReadChannel;
  v12 = [(TSUZipInflateReadChannel *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_readChannel, a3);
    v13->_stream.next_in = 0;
    v13->_remainingUncompressedSize = a4;
    v13->_CRC = a5;
    v13->_validateCRC = a6;
    v13->_stream.avail_in = 0;
    v13->_stream.avail_out = 0;
    v13->_stream.next_out = 0;
    v13->_stream.zfree = 0;
    v13->_stream.opaque = 0;
    v13->_stream.zalloc = 0;
    if (inflateInit2_(&v13->_stream, -15, "1.2.12", 112))
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001CDA08);
      }
      v14 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100167FFC(v14, v15, v16, v17, v18, v19, v20, v21);
      }

      v13 = 0;
    }
  }

  return v13;
}

- (void)dealloc
{
  [(TSUZipInflateReadChannel *)self close];
  inflateEnd(&self->_stream);
  free(self->_outBuffer);
  v3.receiver = self;
  v3.super_class = (Class)TSUZipInflateReadChannel;
  [(TSUZipInflateReadChannel *)&v3 dealloc];
}

- (void)prepareBuffer
{
  if (self->_outBuffer)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CDA28);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100168034();
    }
    objc_super v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipInflateReadChannel prepareBuffer]");
    v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipInflateReadChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 80, 0, "expected nil value for '%{public}s'", "_outBuffer");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  unint64_t remainingUncompressedSize = self->_remainingUncompressedSize;
  if (remainingUncompressedSize >= 0x40000) {
    unint64_t v6 = 0x40000;
  }
  else {
    unint64_t v6 = self->_remainingUncompressedSize;
  }
  if (remainingUncompressedSize) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = 0x40000;
  }
  self->_outBufferSize = v7;
  v8 = (char *)malloc_type_malloc(v7, 0x82AA38FFuLL);
  self->_outBuffer = v8;
  self->_stream.avail_out = self->_outBufferSize;
  self->_stream.next_out = (Bytef *)v8;
}

- (void)readWithHandler:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 1;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 1;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  int v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  int v14 = 0;
  int v14 = crc32(0, 0, 0);
  readChannel = self->_readChannel;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A2AA8;
  v7[3] = &unk_1001CDA50;
  v9 = v19;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  v10 = v15;
  id v11 = v17;
  v12 = v13;
  [(TSUStreamReadChannel *)readChannel readWithHandler:v7];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

- (void)readWithHandlerAndWait:(id)a3
{
}

- (BOOL)processData:(id)a3 inflateResult:(int *)a4 CRC:(unsigned int *)a5 isDone:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  v12 = a3;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_1000A2E08;
  applier[3] = &unk_1001CDAF8;
  v35 = &v38;
  v36 = a4;
  applier[4] = self;
  v37 = a5;
  id v13 = a7;
  id v34 = v13;
  dispatch_data_apply(v12, applier);
  int v14 = *((unsigned __int8 *)v39 + 24);
  if (!self->_validateCRC) {
    goto LABEL_10;
  }
  if (!*((unsigned char *)v39 + 24)) {
    goto LABEL_24;
  }
  if (v8)
  {
    if (!a5)
    {
LABEL_9:
      int v14 = 1;
LABEL_10:
      if (v14 && v8)
      {
        if (*a4 != 1)
        {
          if (TSUDefaultCat_init_token != -1) {
            dispatch_once(&TSUDefaultCat_init_token, &stru_1001CDB38);
          }
          int v16 = TSUDefaultCat_log_t;
          if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
            sub_1001680E0(v16, v17, v18, v19, v20, v21, v22, v23);
          }
LABEL_23:
          *((unsigned char *)v39 + 24) = 0;
          goto LABEL_24;
        }
        goto LABEL_18;
      }
      if (v14)
      {
LABEL_18:
        BOOL v15 = 1;
        goto LABEL_25;
      }
LABEL_24:
      [(TSUZipInflateReadChannel *)self handleFailureWithHandler:v13 error:0];
      BOOL v15 = *((unsigned char *)v39 + 24) != 0;
      goto LABEL_25;
    }
LABEL_8:
    if (self->_CRC != *a5)
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001CDB18);
      }
      v24 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100168118(v24, v25, v26, v27, v28, v29, v30, v31);
      }
      goto LABEL_23;
    }
    goto LABEL_9;
  }
  BOOL v15 = 1;
  if (a5 && *a4 == 1) {
    goto LABEL_8;
  }
LABEL_25:

  _Block_object_dispose(&v38, 8);
  return v15;
}

- (void)handleFailureWithHandler:(id)a3 error:(id)a4
{
  if (a4)
  {
    v5 = (void (*)(void))*((void *)a3 + 2);
    id v7 = a3;
    v5();
  }
  else
  {
    id v6 = a3;
    id v7 = +[NSError tsu_fileReadUnknownErrorWithUserInfo:0];
    (*((void (**)(id, uint64_t, void))a3 + 2))(v6, 1, 0);
  }
}

- (void)close
{
  [(TSUStreamReadChannel *)self->_readChannel close];
  readChannel = self->_readChannel;
  self->_readChannel = 0;
}

- (void).cxx_destruct
{
}

@end