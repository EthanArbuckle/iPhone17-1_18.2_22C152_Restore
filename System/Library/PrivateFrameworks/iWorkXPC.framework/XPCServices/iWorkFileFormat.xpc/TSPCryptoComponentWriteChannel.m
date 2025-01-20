@interface TSPCryptoComponentWriteChannel
- (BOOL)_finalizeBlockForClosing:(BOOL)a3;
- (BOOL)_initializeBlock;
- (BOOL)_resetBuffer;
- (TSPCryptoComponentWriteChannel)init;
- (TSPCryptoComponentWriteChannel)initWithWriteChannel:(id)a3 encryptionInfo:(id)a4;
- (TSPCryptoComponentWriteChannel)initWithWriteChannel:(id)a3 encryptionInfo:(id)a4 bufferSize:(unint64_t)a5;
- (void)_writeData:(id)a3 isDecryptedData:(BOOL)a4;
- (void)close;
- (void)dealloc;
- (void)writeData:(id)a3;
@end

@implementation TSPCryptoComponentWriteChannel

- (TSPCryptoComponentWriteChannel)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C5FA8);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPCryptoComponentWriteChannel init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoComponentWriteChannel.mm";
    __int16 v14 = 1024;
    int v15 = 40;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:40 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPCryptoComponentWriteChannel init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPCryptoComponentWriteChannel)initWithWriteChannel:(id)a3 encryptionInfo:(id)a4
{
  return [(TSPCryptoComponentWriteChannel *)self initWithWriteChannel:a3 encryptionInfo:a4 bufferSize:0x20000];
}

- (TSPCryptoComponentWriteChannel)initWithWriteChannel:(id)a3 encryptionInfo:(id)a4 bufferSize:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TSPCryptoComponentWriteChannel;
  v11 = [(TSPCryptoComponentWriteChannel *)&v28 init];
  __int16 v12 = v11;
  if (v11)
  {
    if (!v9)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C5FC8);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100160DA0();
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionInfo:bufferSize:]");
      __int16 v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 50, 0, "invalid nil value for '%{public}s'", "writeChannel");

      +[TSUAssertionHandler logBacktraceThrottled];
    }
    objc_storeStrong((id *)&v11->_writeChannel, a3);
    if (!v10)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C5FE8);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100160CF4();
      }
      int v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionInfo:bufferSize:]");
      v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 53, 0, "invalid nil value for '%{public}s'", "encryptionInfo");

      +[TSUAssertionHandler logBacktraceThrottled];
    }
    p_encryptionInfo = (id *)&v11->_encryptionInfo;
    objc_storeStrong(p_encryptionInfo, a4);
    [(TSPMutableCryptoInfo *)v12->_encryptionInfo reset];
    unint64_t v18 = 144;
    if (a5 > 0x90) {
      unint64_t v18 = a5;
    }
    v12->_bufferSize = v18;
    v19 = +[NSProcessInfo processInfo];
    unint64_t v20 = (unint64_t)[v19 physicalMemory];

    if (v20 / 0x64 / v12->_bufferSize <= 0x20) {
      intptr_t v21 = 32;
    }
    else {
      intptr_t v21 = v20 / 0x64 / v12->_bufferSize;
    }
    dispatch_semaphore_t v22 = dispatch_semaphore_create(v21);
    bufferSemaphore = v12->_bufferSemaphore;
    v12->_bufferSemaphore = (OS_dispatch_semaphore *)v22;

    if (v12->_writeChannel)
    {
      v24 = [*p_encryptionInfo cryptoKey];
      if (v24 && [(TSPCryptoComponentWriteChannel *)v12 _resetBuffer])
      {
        unsigned __int8 v25 = [(TSPCryptoComponentWriteChannel *)v12 _initializeBlock];

        if (v25) {
          goto LABEL_26;
        }
      }
      else
      {
      }
    }
    writeChannel = v12->_writeChannel;
    v12->_writeChannel = 0;

    __int16 v12 = 0;
  }
LABEL_26:

  return v12;
}

- (BOOL)_resetBuffer
{
  v3 = self->_bufferSemaphore;
  dispatch_semaphore_wait((dispatch_semaphore_t)v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (char *)malloc_type_malloc(self->_bufferSize, 0x8BFF41F4uLL);
  v5 = v4;
  if (v4)
  {
    self->_buffer = v4;
    size_t bufferSize = self->_bufferSize;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001770C;
    v14[3] = &unk_1001C6030;
    v16 = v4;
    int v15 = v3;
    id v7 = (OS_dispatch_data *)dispatch_data_create(v5, bufferSize, 0, v14);
    bufferDispatchData = self->_bufferDispatchData;
    self->_bufferDispatchData = v7;

    unint64_t v9 = self->_bufferSize;
    self->_bufferPosition = 0;
    self->_remainingBufferSize = v9;
    BOOL v10 = self->_bufferDispatchData != 0;
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)v3);
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6008);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100160E4C();
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel _resetBuffer]");
    __int16 v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:85 isFatal:0 description:"Failed to allocate space for encryption buffer"];

    +[TSUAssertionHandler logBacktraceThrottled];
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_initializeBlock
{
  v3 = [(TSPMutableCryptoInfo *)self->_encryptionInfo cryptoKey];
  v4 = malloc_type_malloc(0x10uLL, 0x34C747F3uLL);
  if (!v4 || SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v4))
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6050);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100160ED4();
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel _initializeBlock]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:109 isFatal:0 description:"Failed to generate IV"];

    +[TSUAssertionHandler logBacktraceThrottled];
LABEL_8:
    if (!v4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  uint64_t v7 = CCCryptorCreate(0, 0, 1u, [v3 keyData], (size_t)objc_msgSend(v3, "keyLength"), v4, &self->_cryptor);
  if (v7 || !self->_cryptor)
  {
    int v8 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6070);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100160F5C(v8);
    }
    unint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel _initializeBlock]");
    BOOL v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 115, 0, "CCCryptorCreate() failed: %d", v7);

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  else
  {
    *(_OWORD *)self->_ccHmacContext.ctx = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[88] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[92] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[80] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[84] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[72] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[76] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[64] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[68] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[56] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[60] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[48] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[52] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[40] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[44] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[32] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[36] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[24] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[28] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[16] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[20] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[8] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[12] = 0u;
    *(_OWORD *)&self->_ccHmacContext.ctx[4] = 0u;
    id v12 = [v3 passphrase];
    v13 = (const char *)[v12 cStringUsingEncoding:4];

    if (v13)
    {
      size_t v14 = strlen(v13);
      CCHmacInit((CCHmacContext *)&self->_ccHmacContext, 0, v13, v14);
      writeChannel = self->_writeChannel;
      dispatch_data_t v16 = dispatch_data_create(v4, 0x10uLL, 0, _dispatch_data_destructor_free);
      [(TSPComponentWriteChannel *)writeChannel writeData:v16];

      self->_encodedBlockLength += 16;
      v4 = malloc_type_malloc(0x10uLL, 0x673E2330uLL);
      if (v4 && !SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v4))
      {
        dispatch_data_t v21 = dispatch_data_create(v4, 0x10uLL, 0, _dispatch_data_destructor_free);
        [(TSPCryptoComponentWriteChannel *)self _writeData:v21 isDecryptedData:0];

        LOBYTE(v4) = 1;
        goto LABEL_17;
      }
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C60B0);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100161088();
      }
      v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel _initializeBlock]");
      unint64_t v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
      +[TSUAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:139 isFatal:0 description:"Failed to generate initial block of random plaintext"];

      +[TSUAssertionHandler logBacktraceThrottled];
      goto LABEL_8;
    }
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6090);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100161000();
    }
    v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel _initializeBlock]");
    unint64_t v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:124 isFatal:0 description:"Invalid passphrase"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
LABEL_16:
  free(v4);
  LOBYTE(v4) = 0;
LABEL_17:

  return (char)v4;
}

- (void)dealloc
{
  [(TSPCryptoComponentWriteChannel *)self close];
  cryptor = self->_cryptor;
  if (cryptor)
  {
    CCCryptorRelease(cryptor);
    self->_cryptor = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSPCryptoComponentWriteChannel;
  [(TSPCryptoComponentWriteChannel *)&v4 dealloc];
}

- (void)writeData:(id)a3
{
}

- (void)_writeData:(id)a3 isDecryptedData:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017F3C;
  v4[3] = &unk_1001C60F8;
  v4[4] = self;
  BOOL v5 = a4;
  dispatch_data_apply((dispatch_data_t)a3, v4);
}

- (void)close
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_writeChannel)
  {
    [(TSPCryptoComponentWriteChannel *)obj _finalizeBlockForClosing:1];
    [(TSPComponentWriteChannel *)obj->_writeChannel close];
    writeChannel = obj->_writeChannel;
    obj->_writeChannel = 0;
  }
  objc_sync_exit(obj);
}

- (BOOL)_finalizeBlockForClosing:(BOOL)a3
{
  if (!self->_writeChannel)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6118);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100161198();
    }
    TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Tried to write data when already closed.", v28, v29, v30, v31, v32, v33, v34, (char)"-[TSPCryptoComponentWriteChannel _finalizeBlockForClosing:]");
    v35 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel _finalizeBlockForClosing:]");
    v36 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v35 file:v36 lineNumber:265 isFatal:1 description:"Tried to write data when already closed."];

    TSUCrashBreakpoint();
    abort();
  }
  size_t dataOutMoved = 0;
  if (CCCryptorFinal(self->_cryptor, &self->_buffer[self->_bufferPosition], self->_remainingBufferSize, &dataOutMoved) != -4301)
  {
    if (!dataOutMoved)
    {
      dispatch_data_t subrange = 0;
      BOOL v18 = 1;
      goto LABEL_25;
    }
    dispatch_data_t subrange = dispatch_data_create_subrange((dispatch_data_t)self->_bufferDispatchData, self->_bufferPosition, dataOutMoved);
    size_t v13 = dataOutMoved;
    unint64_t v14 = self->_bufferPosition + dataOutMoved;
    self->_bufferPosition = v14;
    if (v14 > self->_bufferSize)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C6178);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_10016134C();
      }
      TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Buffer overflow", v37, v38, v39, v40, v41, v42, v43, (char)"-[TSPCryptoComponentWriteChannel _finalizeBlockForClosing:]");
      v44 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel _finalizeBlockForClosing:]");
      v45 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
      +[TSUAssertionHandler handleFailureInFunction:v44 file:v45 lineNumber:296 isFatal:1 description:"Buffer overflow"];
    }
    else
    {
      unint64_t remainingBufferSize = self->_remainingBufferSize;
      BOOL v16 = remainingBufferSize >= v13;
      unint64_t v17 = remainingBufferSize - v13;
      if (v16)
      {
        self->_unint64_t remainingBufferSize = v17;
        goto LABEL_15;
      }
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C6198);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_1001613D4();
      }
      TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Buffer overflow", v46, v47, v48, v49, v50, v51, v52, (char)"-[TSPCryptoComponentWriteChannel _finalizeBlockForClosing:]");
      v44 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel _finalizeBlockForClosing:]");
      v45 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
      +[TSUAssertionHandler handleFailureInFunction:v44 file:v45 lineNumber:297 isFatal:1 description:"Buffer overflow"];
    }

    TSUCrashBreakpoint();
    abort();
  }
  size_t OutputLength = CCCryptorGetOutputLength(self->_cryptor, 0, 1);
  v6 = malloc_type_malloc(OutputLength, 0x853ABA00uLL);
  uint64_t v7 = v6;
  if (!v6)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6138);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100161220();
    }
    v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel _finalizeBlockForClosing:]");
    unint64_t v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:280 isFatal:0 description:"Failed to allocate buffer for finalizing encryption"];

    dispatch_data_t subrange = 0;
    +[TSUAssertionHandler logBacktraceThrottled];
    goto LABEL_22;
  }
  dispatch_data_t subrange = dispatch_data_create(v6, OutputLength, 0, _dispatch_data_destructor_free);
  size_t dataOutMoved = 0;
  uint64_t v9 = CCCryptorFinal(self->_cryptor, v7, OutputLength, &dataOutMoved);
  if (!v9)
  {
LABEL_15:
    BOOL v18 = 1;
    goto LABEL_23;
  }
  int v10 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C6158);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_1001612A8(v10);
  }
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel _finalizeBlockForClosing:]");
  id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 290, 0, "Finalizing encryption failed: CCCryptorFinal status %i", v9);

  +[TSUAssertionHandler logBacktraceThrottled];
LABEL_22:
  BOOL v18 = 0;
LABEL_23:
  if (dataOutMoved)
  {
    [(TSPComponentWriteChannel *)self->_writeChannel writeData:subrange];
    self->_encodedBlockLength += dataOutMoved;
  }
LABEL_25:
  dispatch_data_t v21 = malloc_type_calloc(0x14uLL, 1uLL, 0x100004077774924uLL);
  CCHmacFinal((CCHmacContext *)&self->_ccHmacContext, v21);
  writeChannel = self->_writeChannel;
  dispatch_data_t v23 = dispatch_data_create(v21, 0x14uLL, 0, _dispatch_data_destructor_free);
  [(TSPComponentWriteChannel *)writeChannel writeData:v23];

  self->_encodedBlockLength += 20;
  if ([(TSPMutableCryptoInfo *)self->_encryptionInfo preferredBlockSize] != (id)-1) {
    [(TSPMutableCryptoInfo *)self->_encryptionInfo incrementDecodedLengthBy:self->_decryptedBlockLength];
  }
  if (!a3)
  {
    encryptionInfo = self->_encryptionInfo;
    unsigned __int8 v25 = TSUEncodedBlockInfoCreate(self->_encodedBlockLength, self->_decryptedBlockLength);
    [(TSPMutableCryptoInfo *)encryptionInfo addBlockInfo:v25];

    self->_encodedBlockLength = 0;
    self->_decryptedBlockLength = 0;
    cryptor = self->_cryptor;
    if (cryptor)
    {
      CCCryptorRelease(cryptor);
      self->_cryptor = 0;
    }
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferDispatchData, 0);
  objc_storeStrong((id *)&self->_bufferSemaphore, 0);
  objc_storeStrong((id *)&self->_encryptionInfo, 0);
  objc_storeStrong((id *)&self->_writeChannel, 0);
}

@end