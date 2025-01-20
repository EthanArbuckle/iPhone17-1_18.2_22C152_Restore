@interface SFUCryptoInputStream
- (BOOL)canSeek;
- (id)closeLocalStream;
- (id)initForDecryptionWithInputStream:(id)a3 key:(id)a4;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)disableSystemCaching;
- (void)enableSystemCaching;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation SFUCryptoInputStream

- (id)initForDecryptionWithInputStream:(id)a3 key:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  v6 = [(SFUCryptoInputStream *)self init];
  if (v6)
  {
    v6->mBaseStream = (SFUInputStream *)a3;
    unsigned int v7 = +[SFUCryptoUtils ivLengthForKey:a4];
    v8 = (char *)v11 - ((v7 + 15) & 0x1FFFFFFF0);
    if ([(SFUInputStream *)v6->mBaseStream readToBuffer:v8 size:v7] != v7) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"Failed to read IV"];
    }
    v9 = [[SFUCryptor alloc] initWithKey:a4 operation:1 iv:v8 ivLength:v7];
    v6->mCryptor = v9;
    if (!v9) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"Failed to create SFUCryptor"];
    }
    if (v7)
    {
      if ([(SFUCryptoInputStream *)v6 readToBuffer:v8 size:v7] != v7) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"Failed to read initial ciphertext"];
      }
      v6->mOffset = 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUCryptoInputStream;
  [(SFUCryptoInputStream *)&v3 dealloc];
}

- (int64_t)offset
{
  return self->mOffset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  unint64_t v9 = 0;
  id v10 = 0;
  if (![(SFUCryptor *)self->mCryptor cryptDataFromStream:self->mBaseStream toBuffer:a3 length:a4 bytesRead:&v9 error:&v10])
  {
    v5 = (void *)MEMORY[0x263EFF940];
    uint64_t v6 = *MEMORY[0x263EFF488];
    uint64_t v7 = [v10 localizedDescription];
    [v5 raise:v6, @"SFUCryptor failed. %@: %@", v7, objc_msgSend(v10, "localizedFailureReason") format];
  }
  unint64_t result = v9;
  self->mOffset += v9;
  return result;
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"-[SFUCryptoInputStream seekToOffset:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptoInputStream.mm"];
  [v3 handleFailureInFunction:v4 file:v5 lineNumber:96 description:@"SFUCryptoInputStream cannot seek."];
}

- (void)disableSystemCaching
{
}

- (void)enableSystemCaching
{
}

- (void)close
{
}

- (id)closeLocalStream
{
  return self->mBaseStream;
}

@end