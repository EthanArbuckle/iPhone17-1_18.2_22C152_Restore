@interface SFUCryptor
- (BOOL)cryptDataFromBuffer:(const char *)a3 length:(unint64_t)a4 toStream:(id)a5 finished:(BOOL)a6 crc32:(unsigned int *)a7 error:(id *)a8;
- (BOOL)cryptDataFromBuffer:(const char *)a3 length:(unint64_t)a4 toStream:(id)a5 finished:(BOOL)a6 error:(id *)a7;
- (BOOL)cryptDataFromStream:(id)a3 toBuffer:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7;
- (SFUCryptor)initWithKey:(id)a3 operation:(int)a4 iv:(const char *)a5 ivLength:(unint64_t)a6;
- (SFUCryptor)initWithKey:(id)a3 operation:(int)a4 iv:(const char *)a5 ivLength:(unint64_t)a6 usePKCS7Padding:(BOOL)a7;
- (void)dealloc;
@end

@implementation SFUCryptor

- (SFUCryptor)initWithKey:(id)a3 operation:(int)a4 iv:(const char *)a5 ivLength:(unint64_t)a6
{
  return [(SFUCryptor *)self initWithKey:a3 operation:*(void *)&a4 iv:a5 ivLength:a6 usePKCS7Padding:1];
}

- (SFUCryptor)initWithKey:(id)a3 operation:(int)a4 iv:(const char *)a5 ivLength:(unint64_t)a6 usePKCS7Padding:(BOOL)a7
{
  CCOptions v7 = a7;
  v19.receiver = self;
  v19.super_class = (Class)SFUCryptor;
  v12 = [(SFUCryptor *)&v19 init];
  if (!v12) {
    return v12;
  }
  if (!a3)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CDCA0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100168980();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptor.m"), 48, 0, "invalid nil value for '%{public}s'", "key");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (![a3 keyType])
  {
    if (a6 != 16)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CDCC0);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_1001688D0();
      }
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptor.m"), 62, 0, "Incorrect iv length (%lu, should be %d)", a6, 16);
      +[TSUAssertionHandler logBacktraceThrottled];
    }
    if (!a5)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CDCE0);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100168820();
      }
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptor.m"), 63, 0, "invalid nil value for '%{public}s'", "iv");
      +[TSUAssertionHandler logBacktraceThrottled];
    }
    uint64_t v14 = CCCryptorCreate(a4 == 1, 0, v7, [a3 keyData], (size_t)objc_msgSend(a3, "keyLength"), a5, &v12->mCryptor);
    if (v14)
    {
      uint64_t v15 = v14;
      int v16 = +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CDD00);
      }
      v17 = TSUAssertCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100168768(v16, v15, v17);
      }
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptor.m"), 67, 0, "CCCryptorCreate() failed: %d", v15);
      goto LABEL_35;
    }
    v12->mBlockSize = 16;
  }
  if (!v12->mCryptor)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CDD20);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001686E0();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptor.m"), 79, 0, "Failed to initialize SFUCommonCryptoCryptor.");
LABEL_35:
    +[TSUAssertionHandler logBacktraceThrottled];

    return 0;
  }
  v12->mOperation = a4;
  v13 = (char *)malloc_type_malloc(0x20000uLL, 0x310EC0B9uLL);
  v12->mOutputBuffer = v13;
  v12->mOutputBufferPos = v13;
  if (v12->mOperation == 1) {
    v12->mDecryptionInputBuffer = (char *)malloc_type_malloc(0x20000uLL, 0x2D77EB7EuLL);
  }
  return v12;
}

- (void)dealloc
{
  mCryptor = self->mCryptor;
  if (mCryptor)
  {
    CCCryptorRelease(mCryptor);
    self->mCryptor = 0;
  }
  free(self->mOutputBuffer);
  mDecryptionInputBuffer = self->mDecryptionInputBuffer;
  if (mDecryptionInputBuffer) {
    free(mDecryptionInputBuffer);
  }
  v5.receiver = self;
  v5.super_class = (Class)SFUCryptor;
  [(SFUCryptor *)&v5 dealloc];
}

- (BOOL)cryptDataFromBuffer:(const char *)a3 length:(unint64_t)a4 toStream:(id)a5 finished:(BOOL)a6 error:(id *)a7
{
  return [(SFUCryptor *)self cryptDataFromBuffer:a3 length:a4 toStream:a5 finished:a6 crc32:0 error:a7];
}

- (BOOL)cryptDataFromBuffer:(const char *)a3 length:(unint64_t)a4 toStream:(id)a5 finished:(BOOL)a6 crc32:(unsigned int *)a7 error:(id *)a8
{
  v8 = a8;
  BOOL v10 = a6;
  if (self->mOperation)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CDD40);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100168B40();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptor.m"), 118, 0, "Decryption to stream not supported");
    +[TSUAssertionHandler logBacktraceThrottled];
    v8 = a8;
  }
  if (a4)
  {
    while (1)
    {
      mCryptor = self->mCryptor;
      size_t v16 = a4 >= 0x20000 - self->mBlockSize ? 0x20000 - self->mBlockSize : a4;
      size_t dataOutMoved = 0;
      CCCryptorStatus v17 = CCCryptorUpdate(mCryptor, a3, v16, self->mOutputBuffer, 0x20000uLL, &dataOutMoved);
      if (v17) {
        break;
      }
      if (dataOutMoved)
      {
        objc_msgSend(a5, "writeBuffer:size:", self->mOutputBuffer);
        if (a7)
        {
          if (HIDWORD(dataOutMoved))
          {
            +[TSUAssertionHandler _atomicIncrementAssertCount];
            if (TSUAssertCat_init_token != -1) {
              dispatch_once(&TSUAssertCat_init_token, &stru_1001CDD60);
            }
            if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
              sub_100168AB8();
            }
            v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:]");
            v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptor.m"];
            v27 = v29;
            uint64_t v28 = 140;
            goto LABEL_40;
          }
          *a7 = crc32(*a7, (const Bytef *)self->mOutputBuffer, dataOutMoved);
        }
      }
      a3 += v16;
      a4 -= v16;
      if (!a4) {
        goto LABEL_17;
      }
    }
    if (!v8) {
      return 0;
    }
    NSErrorDomain v22 = NSOSStatusErrorDomain;
    uint64_t v23 = v17;
    goto LABEL_44;
  }
LABEL_17:
  if (v10)
  {
    size_t dataOutMoved = 0;
    mOutputBuffer = self->mOutputBuffer;
    if (CCCryptorFinal(self->mCryptor, mOutputBuffer, 0x20000uLL, &dataOutMoved) == -4301)
    {
      size_t OutputLength = CCCryptorGetOutputLength(self->mCryptor, 0, 1);
      v20 = (char *)malloc_type_malloc(OutputLength, 0x6CDC3A68uLL);
      if (!v20)
      {
        if (!v8) {
          return 0;
        }
        NSErrorDomain v22 = NSOSStatusErrorDomain;
        uint64_t v23 = -4301;
LABEL_44:
        id *v8 = +[NSError errorWithDomain:v22 code:v23 userInfo:0];
        return 0;
      }
      mOutputBuffer = v20;
      CCCryptorStatus v21 = CCCryptorFinal(self->mCryptor, v20, OutputLength, &dataOutMoved);
      if (v21)
      {
        if (v8) {
          id *v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v21 userInfo:0];
        }
        free(mOutputBuffer);
        return 0;
      }
      v24 = mOutputBuffer;
    }
    else
    {
      v24 = 0;
    }
    if (dataOutMoved)
    {
      objc_msgSend(a5, "writeBuffer:size:", mOutputBuffer);
      if (a7)
      {
        if (HIDWORD(dataOutMoved))
        {
          +[TSUAssertionHandler _atomicIncrementAssertCount];
          if (TSUAssertCat_init_token != -1) {
            dispatch_once(&TSUAssertCat_init_token, &stru_1001CDD80);
          }
          if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
            sub_100168A30();
          }
          v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:]");
          v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptor.m"];
          v27 = v25;
          uint64_t v28 = 180;
LABEL_40:
          +[TSUAssertionHandler handleFailureInFunction:v27 file:v26 lineNumber:v28 isFatal:0 description:"overflow in cryptDataFromBuffer:length:toStream:finished:crc32:error:"];
          +[TSUAssertionHandler logBacktraceThrottled];
          if (!v8) {
            return 0;
          }
          NSErrorDomain v22 = NSOSStatusErrorDomain;
          uint64_t v23 = -4302;
          goto LABEL_44;
        }
        *a7 = crc32(*a7, (const Bytef *)mOutputBuffer, dataOutMoved);
      }
    }
    if (v24) {
      free(v24);
    }
  }
  return 1;
}

- (BOOL)cryptDataFromStream:(id)a3 toBuffer:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  if (self->mOperation != 1)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CDDA0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100168BC8();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUCryptor cryptDataFromStream:toBuffer:length:bytesRead:error:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptor.m"), 200, 0, "Encryption from stream not supported");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  unint64_t mOutputBufferAvailable = self->mOutputBufferAvailable;
  if (mOutputBufferAvailable)
  {
    if (mOutputBufferAvailable >= a5) {
      size_t v14 = a5;
    }
    else {
      size_t v14 = self->mOutputBufferAvailable;
    }
    memcpy(a4, self->mOutputBufferPos, v14);
    unint64_t v15 = self->mOutputBufferAvailable - v14;
    self->mOutputBufferPos += v14;
    self->unint64_t mOutputBufferAvailable = v15;
    size_t v16 = &a4[v14];
    a5 -= v14;
  }
  else
  {
    size_t v16 = a4;
  }
  if (self->mFinished)
  {
    unint64_t v17 = v16 - a4;
LABEL_15:
    *a6 = v17;
    return 1;
  }
  if (a5)
  {
    v26 = a7;
    while (1)
    {
      id v19 = objc_msgSend(a3, "readToBuffer:size:", self->mDecryptionInputBuffer, 0x20000 - self->mBlockSize, v26);
      if (!v19) {
        break;
      }
      size_t dataOutMoved = 0;
      CCCryptorStatus v20 = CCCryptorUpdate(self->mCryptor, self->mDecryptionInputBuffer, (size_t)v19, self->mOutputBuffer, 0x20000uLL, &dataOutMoved);
      if (v20)
      {
        a7 = v26;
        goto LABEL_40;
      }
      size_t v21 = dataOutMoved;
      if (a5 >= dataOutMoved) {
        size_t v22 = dataOutMoved;
      }
      else {
        size_t v22 = a5;
      }
      memcpy(v16, self->mOutputBuffer, v22);
      v16 += v22;
      a5 -= v22;
      self->mOutputBufferPos = &self->mOutputBuffer[v22];
      self->unint64_t mOutputBufferAvailable = v21 - v22;
      BOOL v23 = a5 != 0;
      if (!a5) {
        goto LABEL_28;
      }
    }
    BOOL v23 = 1;
LABEL_28:
    if (v19) {
      BOOL v23 = 0;
    }
    a7 = v26;
  }
  else
  {
    BOOL v23 = 0;
  }
  if (v16 != a4 && !v23)
  {
    *a6 = v16 - a4;
    return 1;
  }
  self->mFinished = 1;
  size_t dataOutMoved = 0;
  CCCryptorStatus v20 = CCCryptorFinal(self->mCryptor, self->mOutputBuffer, 0x20000uLL, &dataOutMoved);
  if (!v20)
  {
    if (a5 >= dataOutMoved) {
      size_t v24 = dataOutMoved;
    }
    else {
      size_t v24 = a5;
    }
    memcpy(v16, self->mOutputBuffer, v24);
    unint64_t v25 = dataOutMoved - v24;
    self->mOutputBufferPos = &self->mOutputBuffer[v24];
    self->unint64_t mOutputBufferAvailable = v25;
    unint64_t v17 = &v16[v24] - a4;
    goto LABEL_15;
  }
LABEL_40:
  if (a7) {
    *a7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v20 userInfo:0];
  }
  return 0;
}

@end