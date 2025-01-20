@interface OISFUCryptor
- (BOOL)cryptDataFromBuffer:(const char *)a3 length:(unint64_t)a4 toStream:(id)a5 finished:(BOOL)a6 crc32:(unsigned int *)a7 error:(id *)a8;
- (BOOL)cryptDataFromBuffer:(const char *)a3 length:(unint64_t)a4 toStream:(id)a5 finished:(BOOL)a6 error:(id *)a7;
- (BOOL)cryptDataFromStream:(id)a3 toBuffer:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7;
- (OISFUCryptor)initWithKey:(id)a3 operation:(int)a4 iv:(const char *)a5 ivLength:(unint64_t)a6;
- (OISFUCryptor)initWithKey:(id)a3 operation:(int)a4 iv:(const char *)a5 ivLength:(unint64_t)a6 usePKCS7Padding:(BOOL)a7;
- (void)dealloc;
@end

@implementation OISFUCryptor

- (OISFUCryptor)initWithKey:(id)a3 operation:(int)a4 iv:(const char *)a5 ivLength:(unint64_t)a6
{
  return [(OISFUCryptor *)self initWithKey:a3 operation:*(void *)&a4 iv:a5 ivLength:a6 usePKCS7Padding:1];
}

- (OISFUCryptor)initWithKey:(id)a3 operation:(int)a4 iv:(const char *)a5 ivLength:(unint64_t)a6 usePKCS7Padding:(BOOL)a7
{
  CCOptions v7 = a7;
  v22.receiver = self;
  v22.super_class = (Class)OISFUCryptor;
  v12 = [(OISFUCryptor *)&v22 init];
  if (!v12) {
    return v12;
  }
  if (!a3)
  {
    uint64_t v13 = [NSString stringWithUTF8String:"-[OISFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptor.m"], 48, 0, "invalid nil value for '%{public}s'", "key");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if (![a3 keyType])
  {
    if (a6 != 16)
    {
      uint64_t v15 = [NSString stringWithUTF8String:"-[OISFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptor.m"], 62, 0, "Incorrect iv length (%lu, should be %d)", a6, 16);
      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    if (!a5)
    {
      uint64_t v16 = [NSString stringWithUTF8String:"-[OISFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptor.m"], 63, 0, "invalid nil value for '%{public}s'", "iv");
      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    uint64_t v17 = CCCryptorCreate(a4 == 1, 0, v7, (const void *)[a3 keyData], objc_msgSend(a3, "keyLength"), a5, &v12->mCryptor);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = [NSString stringWithUTF8String:"-[OISFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptor.m"], 67, 0, "CCCryptorCreate() failed: %d", v18);
LABEL_15:
      +[OITSUAssertionHandler logBacktraceThrottled];

      return 0;
    }
    v12->mBlockSize = 16;
  }
  if (!v12->mCryptor)
  {
    uint64_t v20 = [NSString stringWithUTF8String:"-[OISFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptor.m"], 79, 0, "Failed to initialize SFUCommonCryptoCryptor.");
    goto LABEL_15;
  }
  v12->mOperation = a4;
  v14 = (char *)malloc_type_malloc(0x20000uLL, 0x310EC0B9uLL);
  v12->mOutputBuffer = v14;
  v12->mOutputBufferPos = v14;
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
  v5.super_class = (Class)OISFUCryptor;
  [(OISFUCryptor *)&v5 dealloc];
}

- (BOOL)cryptDataFromBuffer:(const char *)a3 length:(unint64_t)a4 toStream:(id)a5 finished:(BOOL)a6 error:(id *)a7
{
  return [(OISFUCryptor *)self cryptDataFromBuffer:a3 length:a4 toStream:a5 finished:a6 crc32:0 error:a7];
}

- (BOOL)cryptDataFromBuffer:(const char *)a3 length:(unint64_t)a4 toStream:(id)a5 finished:(BOOL)a6 crc32:(unsigned int *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  if (self->mOperation)
  {
    uint64_t v15 = [NSString stringWithUTF8String:"-[OISFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptor.m"], 118, 0, "Decryption to stream not supported");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if (a4)
  {
    while (1)
    {
      mCryptor = self->mCryptor;
      size_t v17 = a4 >= 0x20000 - self->mBlockSize ? 0x20000 - self->mBlockSize : a4;
      size_t dataOutMoved = 0;
      CCCryptorStatus v18 = CCCryptorUpdate(mCryptor, a3, v17, self->mOutputBuffer, 0x20000uLL, &dataOutMoved);
      if (v18) {
        break;
      }
      if (dataOutMoved)
      {
        objc_msgSend(a5, "writeBuffer:size:", self->mOutputBuffer);
        if (a7)
        {
          if (HIDWORD(dataOutMoved))
          {
            uint64_t v27 = [NSString stringWithUTF8String:"-[OISFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:]"];
            uint64_t v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptor.m"];
            uint64_t v29 = v27;
            uint64_t v30 = 140;
            goto LABEL_31;
          }
          *a7 = crc32(*a7, (const Bytef *)self->mOutputBuffer, dataOutMoved);
        }
      }
      a3 += v17;
      a4 -= v17;
      if (!a4) {
        goto LABEL_13;
      }
    }
    if (!a8) {
      return 0;
    }
    uint64_t v23 = *MEMORY[0x263F08410];
    uint64_t v24 = v18;
    v25 = (void *)MEMORY[0x263F087E8];
    goto LABEL_33;
  }
LABEL_13:
  if (v10)
  {
    size_t dataOutMoved = 0;
    mOutputBuffer = self->mOutputBuffer;
    if (CCCryptorFinal(self->mCryptor, mOutputBuffer, 0x20000uLL, &dataOutMoved) == -4301)
    {
      size_t OutputLength = CCCryptorGetOutputLength(self->mCryptor, 0, 1);
      v21 = (char *)malloc_type_malloc(OutputLength, 0x6CDC3A68uLL);
      if (!v21)
      {
        if (!a8) {
          return 0;
        }
        v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v23 = *MEMORY[0x263F08410];
        uint64_t v24 = -4301;
LABEL_33:
        *a8 = (id)[v25 errorWithDomain:v23 code:v24 userInfo:0];
        return 0;
      }
      mOutputBuffer = v21;
      CCCryptorStatus v22 = CCCryptorFinal(self->mCryptor, v21, OutputLength, &dataOutMoved);
      if (v22)
      {
        if (a8) {
          *a8 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v22 userInfo:0];
        }
        free(mOutputBuffer);
        return 0;
      }
      v26 = mOutputBuffer;
    }
    else
    {
      v26 = 0;
    }
    if (dataOutMoved)
    {
      objc_msgSend(a5, "writeBuffer:size:", mOutputBuffer);
      if (a7)
      {
        if (HIDWORD(dataOutMoved))
        {
          uint64_t v31 = [NSString stringWithUTF8String:"-[OISFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:]"];
          uint64_t v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptor.m"];
          uint64_t v29 = v31;
          uint64_t v30 = 180;
LABEL_31:
          +[OITSUAssertionHandler handleFailureInFunction:v29 file:v28 lineNumber:v30 isFatal:0 description:"overflow in cryptDataFromBuffer:length:toStream:finished:crc32:error:"];
          +[OITSUAssertionHandler logBacktraceThrottled];
          if (!a8) {
            return 0;
          }
          v25 = (void *)MEMORY[0x263F087E8];
          uint64_t v23 = *MEMORY[0x263F08410];
          uint64_t v24 = -4302;
          goto LABEL_33;
        }
        *a7 = crc32(*a7, (const Bytef *)mOutputBuffer, dataOutMoved);
      }
    }
    if (v26) {
      free(v26);
    }
  }
  return 1;
}

- (BOOL)cryptDataFromStream:(id)a3 toBuffer:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  if (self->mOperation != 1)
  {
    uint64_t v13 = [NSString stringWithUTF8String:"-[OISFUCryptor cryptDataFromStream:toBuffer:length:bytesRead:error:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptor.m"], 200, 0, "Encryption from stream not supported");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  unint64_t mOutputBufferAvailable = self->mOutputBufferAvailable;
  if (mOutputBufferAvailable)
  {
    if (mOutputBufferAvailable >= a5) {
      size_t v15 = a5;
    }
    else {
      size_t v15 = self->mOutputBufferAvailable;
    }
    memcpy(a4, self->mOutputBufferPos, v15);
    unint64_t v16 = self->mOutputBufferAvailable - v15;
    self->mOutputBufferPos += v15;
    self->unint64_t mOutputBufferAvailable = v16;
    size_t v17 = &a4[v15];
    a5 -= v15;
  }
  else
  {
    size_t v17 = a4;
  }
  if (self->mFinished)
  {
    unint64_t v18 = v17 - a4;
LABEL_11:
    *a6 = v18;
    return 1;
  }
  if (a5)
  {
    uint64_t v27 = a7;
    while (1)
    {
      size_t v20 = objc_msgSend(a3, "readToBuffer:size:", self->mDecryptionInputBuffer, 0x20000 - self->mBlockSize, v27);
      if (!v20) {
        break;
      }
      size_t dataOutMoved = 0;
      CCCryptorStatus v21 = CCCryptorUpdate(self->mCryptor, self->mDecryptionInputBuffer, v20, self->mOutputBuffer, 0x20000uLL, &dataOutMoved);
      if (v21)
      {
        a7 = v27;
        goto LABEL_36;
      }
      size_t v22 = dataOutMoved;
      if (a5 >= dataOutMoved) {
        size_t v23 = dataOutMoved;
      }
      else {
        size_t v23 = a5;
      }
      memcpy(v17, self->mOutputBuffer, v23);
      v17 += v23;
      a5 -= v23;
      self->mOutputBufferPos = &self->mOutputBuffer[v23];
      self->unint64_t mOutputBufferAvailable = v22 - v23;
      BOOL v24 = a5 != 0;
      if (!a5) {
        goto LABEL_24;
      }
    }
    BOOL v24 = 1;
LABEL_24:
    if (v20) {
      BOOL v24 = 0;
    }
    a7 = v27;
  }
  else
  {
    BOOL v24 = 0;
  }
  if (v17 != a4 && !v24)
  {
    *a6 = v17 - a4;
    return 1;
  }
  self->mFinished = 1;
  size_t dataOutMoved = 0;
  CCCryptorStatus v21 = CCCryptorFinal(self->mCryptor, self->mOutputBuffer, 0x20000uLL, &dataOutMoved);
  if (!v21)
  {
    if (a5 >= dataOutMoved) {
      size_t v25 = dataOutMoved;
    }
    else {
      size_t v25 = a5;
    }
    memcpy(v17, self->mOutputBuffer, v25);
    unint64_t v26 = dataOutMoved - v25;
    self->mOutputBufferPos = &self->mOutputBuffer[v25];
    self->unint64_t mOutputBufferAvailable = v26;
    unint64_t v18 = &v17[v25] - a4;
    goto LABEL_11;
  }
LABEL_36:
  if (a7) {
    *a7 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v21 userInfo:0];
  }
  return 0;
}

@end