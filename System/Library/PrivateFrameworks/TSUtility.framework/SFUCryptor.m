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
  v28.receiver = self;
  v28.super_class = (Class)SFUCryptor;
  v12 = [(SFUCryptor *)&v28 init];
  if (!v12) {
    return v12;
  }
  if (!a3)
  {
    id v13 = +[TSUAssertionHandler currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"), 49, @"invalid nil value for '%s'", "key");
  }
  if (![a3 keyType])
  {
    if (a6 != 16)
    {
      id v16 = +[TSUAssertionHandler currentHandler];
      uint64_t v17 = [NSString stringWithUTF8String:"-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"];
      [v16 handleFailureInFunction:v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"), 66, @"Incorrect iv length (%lu, should be %d)", a6, 16 file lineNumber description];
    }
    if (!a5)
    {
      id v18 = +[TSUAssertionHandler currentHandler];
      uint64_t v19 = [NSString stringWithUTF8String:"-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"];
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"), 67, @"invalid nil value for '%s'", "iv");
    }
    uint64_t v20 = CCCryptorCreate(a4 == 1, 0, v7, (const void *)[a3 keyData], objc_msgSend(a3, "keyLength"), a5, &v12->mCryptor);
    if (v20)
    {
      uint64_t v21 = v20;
      id v22 = +[TSUAssertionHandler currentHandler];
      uint64_t v23 = [NSString stringWithUTF8String:"-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"];
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"), 72, @"CCCryptorCreate() failed: %d", v21);
LABEL_15:

      return 0;
    }
    v12->mBlockSize = 16;
  }
  if (!v12->mCryptor)
  {
    id v24 = +[TSUAssertionHandler currentHandler];
    uint64_t v25 = [NSString stringWithUTF8String:"-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]"];
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"), 85, @"Failed to initialize SFUCommonCryptoCryptor.", v27);
    goto LABEL_15;
  }
  v12->mOperation = a4;
  v15 = (char *)malloc_type_malloc(0x20000uLL, 0x8E34A5F2uLL);
  v12->mOutputBuffer = v15;
  v12->mOutputBufferPos = v15;
  if (v12->mOperation == 1) {
    v12->mDecryptionInputBuffer = (char *)malloc_type_malloc(0x20000uLL, 0x83D4E232uLL);
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
  BOOL v10 = a6;
  if (self->mOperation)
  {
    id v15 = +[TSUAssertionHandler currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[SFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:]"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"), 130, @"Decryption to stream not supported");
  }
  if (a4)
  {
    while (1)
    {
      mCryptor = self->mCryptor;
      size_t v18 = a4 >= 0x20000 - self->mBlockSize ? 0x20000 - self->mBlockSize : a4;
      size_t dataOutMoved = 0;
      CCCryptorStatus v19 = CCCryptorUpdate(mCryptor, a3, v18, self->mOutputBuffer, 0x20000uLL, &dataOutMoved);
      if (v19) {
        break;
      }
      if (dataOutMoved)
      {
        objc_msgSend(a5, "writeBuffer:size:", self->mOutputBuffer);
        if (a7)
        {
          if (HIDWORD(dataOutMoved))
          {
            id v28 = +[TSUAssertionHandler currentHandler];
            uint64_t v29 = [NSString stringWithUTF8String:"-[SFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:]"];
            uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"];
            v31 = v28;
            uint64_t v32 = v29;
            uint64_t v33 = 157;
            goto LABEL_31;
          }
          *a7 = crc32(*a7, (const Bytef *)self->mOutputBuffer, dataOutMoved);
        }
      }
      a3 += v18;
      a4 -= v18;
      if (!a4) {
        goto LABEL_13;
      }
    }
    if (!a8) {
      return 0;
    }
    uint64_t v24 = *MEMORY[0x263F08410];
    uint64_t v25 = v19;
    v26 = (void *)MEMORY[0x263F087E8];
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
      id v22 = (char *)malloc_type_malloc(OutputLength, 0xE51D72ECuLL);
      if (!v22)
      {
        if (!a8) {
          return 0;
        }
        v26 = (void *)MEMORY[0x263F087E8];
        uint64_t v24 = *MEMORY[0x263F08410];
        uint64_t v25 = -4301;
LABEL_33:
        *a8 = (id)[v26 errorWithDomain:v24 code:v25 userInfo:0];
        return 0;
      }
      mOutputBuffer = v22;
      CCCryptorStatus v23 = CCCryptorFinal(self->mCryptor, v22, OutputLength, &dataOutMoved);
      if (v23)
      {
        if (a8) {
          *a8 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v23 userInfo:0];
        }
        free(mOutputBuffer);
        return 0;
      }
      uint64_t v27 = mOutputBuffer;
    }
    else
    {
      uint64_t v27 = 0;
    }
    if (dataOutMoved)
    {
      objc_msgSend(a5, "writeBuffer:size:", mOutputBuffer);
      if (a7)
      {
        if (HIDWORD(dataOutMoved))
        {
          id v34 = +[TSUAssertionHandler currentHandler];
          uint64_t v35 = [NSString stringWithUTF8String:"-[SFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:]"];
          uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"];
          v31 = v34;
          uint64_t v32 = v35;
          uint64_t v33 = 206;
LABEL_31:
          [v31 handleFailureInFunction:v32 file:v30 lineNumber:v33 description:@"overflow in cryptDataFromBuffer:length:toStream:finished:crc32:error:"];
          if (!a8) {
            return 0;
          }
          v26 = (void *)MEMORY[0x263F087E8];
          uint64_t v24 = *MEMORY[0x263F08410];
          uint64_t v25 = -4302;
          goto LABEL_33;
        }
        *a7 = crc32(*a7, (const Bytef *)mOutputBuffer, dataOutMoved);
      }
    }
    if (v27) {
      free(v27);
    }
  }
  return 1;
}

- (BOOL)cryptDataFromStream:(id)a3 toBuffer:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  if (self->mOperation != 1)
  {
    id v13 = +[TSUAssertionHandler currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[SFUCryptor cryptDataFromStream:toBuffer:length:bytesRead:error:]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"), 229, @"Encryption from stream not supported");
  }
  unint64_t mOutputBufferAvailable = self->mOutputBufferAvailable;
  if (mOutputBufferAvailable)
  {
    if (mOutputBufferAvailable >= a5) {
      size_t v16 = a5;
    }
    else {
      size_t v16 = self->mOutputBufferAvailable;
    }
    memcpy(a4, self->mOutputBufferPos, v16);
    unint64_t v17 = self->mOutputBufferAvailable - v16;
    self->mOutputBufferPos += v16;
    self->unint64_t mOutputBufferAvailable = v17;
    size_t v18 = &a4[v16];
    a5 -= v16;
  }
  else
  {
    size_t v18 = a4;
  }
  if (self->mFinished)
  {
    unint64_t v19 = v18 - a4;
LABEL_11:
    *a6 = v19;
    return 1;
  }
  if (a5)
  {
    id v28 = a7;
    while (1)
    {
      size_t v21 = objc_msgSend(a3, "readToBuffer:size:", self->mDecryptionInputBuffer, 0x20000 - self->mBlockSize, v28);
      if (!v21) {
        break;
      }
      size_t dataOutMoved = 0;
      CCCryptorStatus v22 = CCCryptorUpdate(self->mCryptor, self->mDecryptionInputBuffer, v21, self->mOutputBuffer, 0x20000uLL, &dataOutMoved);
      if (v22)
      {
        a7 = v28;
        goto LABEL_36;
      }
      size_t v23 = dataOutMoved;
      if (a5 >= dataOutMoved) {
        size_t v24 = dataOutMoved;
      }
      else {
        size_t v24 = a5;
      }
      memcpy(v18, self->mOutputBuffer, v24);
      v18 += v24;
      a5 -= v24;
      self->mOutputBufferPos = &self->mOutputBuffer[v24];
      self->unint64_t mOutputBufferAvailable = v23 - v24;
      BOOL v25 = a5 != 0;
      if (!a5) {
        goto LABEL_24;
      }
    }
    BOOL v25 = 1;
LABEL_24:
    if (v21) {
      BOOL v25 = 0;
    }
    a7 = v28;
  }
  else
  {
    BOOL v25 = 0;
  }
  if (v18 != a4 && !v25)
  {
    *a6 = v18 - a4;
    return 1;
  }
  self->mFinished = 1;
  size_t dataOutMoved = 0;
  CCCryptorStatus v22 = CCCryptorFinal(self->mCryptor, self->mOutputBuffer, 0x20000uLL, &dataOutMoved);
  if (!v22)
  {
    if (a5 >= dataOutMoved) {
      size_t v26 = dataOutMoved;
    }
    else {
      size_t v26 = a5;
    }
    memcpy(v18, self->mOutputBuffer, v26);
    unint64_t v27 = dataOutMoved - v26;
    self->mOutputBufferPos = &self->mOutputBuffer[v26];
    self->unint64_t mOutputBufferAvailable = v27;
    unint64_t v19 = &v18[v26] - a4;
    goto LABEL_11;
  }
LABEL_36:
  if (a7) {
    *a7 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v22 userInfo:0];
  }
  return 0;
}

@end