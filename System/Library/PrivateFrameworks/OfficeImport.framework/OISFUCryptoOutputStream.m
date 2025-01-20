@interface OISFUCryptoOutputStream
+ (unint64_t)encodedLengthForDataLength:(unint64_t)a3 key:(id)a4;
- (BOOL)canCreateInputStream;
- (BOOL)canSeek;
- (id)closeLocalStream;
- (id)initForEncryptionWithOutputStream:(id)a3 key:(id)a4;
- (id)initForEncryptionWithOutputStream:(id)a3 key:(id)a4 computeCrc32:(BOOL)a5;
- (id)inputStream;
- (int64_t)offset;
- (unsigned)crc32;
- (void)close;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3 whence:(int)a4;
- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4;
@end

@implementation OISFUCryptoOutputStream

+ (unint64_t)encodedLengthForDataLength:(unint64_t)a3 key:(id)a4
{
  unsigned int v6 = 2 * +[OISFUCryptoUtils ivLengthForKey:a4];
  int v7 = [a4 keyType];
  LODWORD(v8) = v6 - (a3 & 0xF) + 16;
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v8;
  }
  if (__CFADD__(v8, a3)) {
    uint64_t v8 = 0;
  }
  return v8 + a3;
}

- (id)initForEncryptionWithOutputStream:(id)a3 key:(id)a4
{
  return [(OISFUCryptoOutputStream *)self initForEncryptionWithOutputStream:a3 key:a4 computeCrc32:0];
}

- (id)initForEncryptionWithOutputStream:(id)a3 key:(id)a4 computeCrc32:(BOOL)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = [(OISFUCryptoOutputStream *)self init];
  if (v8)
  {
    v8->mBaseStream = (SFUOutputStream *)a3;
    v8->mComputeCrc32 = a5;
    uInt v9 = +[OISFUCryptoUtils ivLengthForKey:a4];
    v10 = (const Bytef *)v14 - ((v9 + 15) & 0x1FFFFFFF0);
    if (!+[OISFUCryptoUtils generateRandomDataInBuffer:length:](OISFUCryptoUtils, "generateRandomDataInBuffer:length:", v10, v9))[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"Failed to generate IV"]; {
    v11 = [[OISFUCryptor alloc] initWithKey:a4 operation:0 iv:v10 ivLength:v9];
    }
    v8->mCryptor = v11;
    if (!v11) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"Failed to create SFUCryptor"];
    }
    [(SFUOutputStream *)v8->mBaseStream writeBuffer:v10 size:v9];
    if (v8->mComputeCrc32)
    {
      unsigned int v12 = crc32(0, 0, 0);
      v8->mCrc32 = v12;
      v8->mCrc32 = crc32(v12, v10, v9);
    }
    if (v9)
    {
      if (!+[OISFUCryptoUtils generateRandomDataInBuffer:length:](OISFUCryptoUtils, "generateRandomDataInBuffer:length:", v10, v9))[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"Failed to generate initial plaintext"]; {
      [(OISFUCryptoOutputStream *)v8 writeBuffer:v10 size:v9];
      }
    }
  }
  return v8;
}

- (void)dealloc
{
  if (!self->mIsClosed) {
    [(OISFUCryptoOutputStream *)self closeLocalStream];
  }

  v3.receiver = self;
  v3.super_class = (Class)OISFUCryptoOutputStream;
  [(OISFUCryptoOutputStream *)&v3 dealloc];
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  if (self->mIsClosed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Tried to write data to a closed SFUCryptoOutputStream."];
  }
  id v11 = 0;
  if (self->mComputeCrc32) {
    p_mCrc32 = &self->mCrc32;
  }
  else {
    p_mCrc32 = 0;
  }
  if (![(OISFUCryptor *)self->mCryptor cryptDataFromBuffer:a3 length:a4 toStream:self->mBaseStream finished:0 crc32:p_mCrc32 error:&v11])
  {
    uint64_t v8 = (void *)MEMORY[0x263EFF940];
    uint64_t v9 = *MEMORY[0x263EFF488];
    uint64_t v10 = [v11 localizedDescription];
    [v8 raise:v9, @"SFUCryptor failed. %@: %@", v10, objc_msgSend(v11, "localizedFailureReason") format];
  }
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  uint64_t v4 = objc_msgSend(NSString, "stringWithUTF8String:", "-[OISFUCryptoOutputStream seekToOffset:whence:]", *(void *)&a4);
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptoOutputStream.mm"], 121, 0, "SFUCryptoOutputStream cannot seek.");
  +[OITSUAssertionHandler logBacktraceThrottled];
}

- (int64_t)offset
{
  return [(SFUOutputStream *)self->mBaseStream offset];
}

- (BOOL)canCreateInputStream
{
  return 0;
}

- (id)inputStream
{
  uint64_t v2 = [NSString stringWithUTF8String:"-[OISFUCryptoOutputStream inputStream]"];
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptoOutputStream.mm"], 133, 0, "SFUCryptoOutputStream cannot create an input stream.");
  +[OITSUAssertionHandler logBacktraceThrottled];
  return 0;
}

- (unsigned)crc32
{
  if (!self->mComputeCrc32 || !self->mIsClosed)
  {
    uint64_t v3 = [NSString stringWithUTF8String:"-[OISFUCryptoOutputStream crc32]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptoOutputStream.mm"], 138, 0, "Can't call -crc32 unless the stream is closed and was asked to compute the CRC32.");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  return self->mCrc32;
}

- (void)close
{
  [(OISFUCryptoOutputStream *)self closeLocalStream];
  mBaseStream = self->mBaseStream;
  [(SFUOutputStream *)mBaseStream close];
}

- (id)closeLocalStream
{
  if (!self->mIsClosed)
  {
    self->mIsClosed = 1;
    id v10 = 0;
    mBaseStream = self->mBaseStream;
    mCryptor = self->mCryptor;
    if (self->mComputeCrc32) {
      p_mCrc32 = &self->mCrc32;
    }
    else {
      p_mCrc32 = 0;
    }
    if (![(OISFUCryptor *)mCryptor cryptDataFromBuffer:0 length:0 toStream:mBaseStream finished:1 crc32:p_mCrc32 error:&v10])
    {
      unsigned int v6 = (void *)MEMORY[0x263EFF940];
      uint64_t v7 = *MEMORY[0x263EFF488];
      uint64_t v8 = [v10 localizedDescription];
      [v6 raise:v7, @"SFUCryptor failed. %@: %@", v8, objc_msgSend(v10, "localizedFailureReason") format];
    }
  }
  return self->mBaseStream;
}

@end