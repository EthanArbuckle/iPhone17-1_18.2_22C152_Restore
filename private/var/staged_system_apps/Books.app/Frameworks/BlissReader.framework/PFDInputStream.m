@interface PFDInputStream
- (BOOL)canSeek;
- (BOOL)seekWithinBufferToOffset:(int64_t)a3;
- (PFDInputStream)initWithInputStream:(id)a3 J00oNrNGGvbpr5VY2bUB:(id)a4;
- (id)closeLocalStream;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)disableSystemCaching;
- (void)enableSystemCaching;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation PFDInputStream

- (PFDInputStream)initWithInputStream:(id)a3 J00oNrNGGvbpr5VY2bUB:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PFDInputStream;
  v6 = [(PFDInputStream *)&v9 init];
  if (v6)
  {
    if (a3)
    {
      if (a4)
      {
        v6->mInputStream = (SFUInputStream *)a3;
        v6->mDecryptionSession = (BuLr3rwnVU31zt9OioJ56 *)a4;
        size_t v7 = +[BuLr3rwnVU31zt9OioJ56 dataChunkSize];
        v6->mBufferSize = v7;
        v6->mEncryptedBuffer = (char *)malloc_type_calloc(v7, 1uLL, 0x100004077774924uLL);
        v6->mBuffer = (char *)malloc_type_calloc(v6->mBufferSize, 1uLL, 0x100004077774924uLL);
        return v6;
      }
    }
    else
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFDInputStream initWithInputStream:J00oNrNGGvbpr5VY2bUB:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDInputStream.m") lineNumber:39 description:@"must have an input stream"];
      if (a4)
      {
LABEL_7:

        return 0;
      }
    }
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFDInputStream initWithInputStream:J00oNrNGGvbpr5VY2bUB:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDInputStream.m") lineNumber:40 description:@"must have a decryption session"];
    goto LABEL_7;
  }
  return v6;
}

- (void)dealloc
{
  mBuffer = self->mBuffer;
  if (mBuffer)
  {
    free(mBuffer);
    self->mBuffer = 0;
  }
  mEncryptedBuffer = self->mEncryptedBuffer;
  if (mEncryptedBuffer)
  {
    free(mEncryptedBuffer);
    self->mEncryptedBuffer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PFDInputStream;
  [(PFDInputStream *)&v5 dealloc];
}

- (int64_t)offset
{
  return self->mBufferOffset + self->mBufferStart;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  if (!a4) {
    return 0;
  }
  for (unint64_t i = 0; i < a4; i += v9)
  {
    __src = 0;
    size_t v8 = [(PFDInputStream *)self readToOwnBuffer:&__src size:a4 - i];
    if (!v8) {
      break;
    }
    size_t v9 = v8;
    memcpy(&a3[i], __src, v8);
  }
  return i;
}

- (BOOL)canSeek
{
  return [(SFUInputStream *)self->mInputStream canSeek];
}

- (void)seekToOffset:(int64_t)a3
{
  int64_t mBufferStart = self->mBufferStart;
  BOOL v4 = __OFSUB__(a3, mBufferStart);
  int64_t v5 = a3 - mBufferStart;
  if (v5 < 0 != v4 || self->mBufferEnd < a3)
  {
    int64_t v6 = a3 / self->mBufferSize * self->mBufferSize;
    int64_t v5 = a3 % self->mBufferSize;
    self->int64_t mBufferStart = v6;
    self->mBufferEnd = v6;
  }
  self->mBufferOffset = v5;
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
  return self->mInputStream;
}

- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4
{
  int64_t mBufferEnd = self->mBufferEnd;
  int64_t mBufferStart = self->mBufferStart;
  if (self->mBufferOffset == mBufferEnd - mBufferStart)
  {
    self->int64_t mBufferOffset = 0;
    self->int64_t mBufferStart = mBufferEnd;
  }
  else if (mBufferEnd != mBufferStart)
  {
    goto LABEL_14;
  }
  size_t v9 = (char *)[(SFUInputStream *)self->mInputStream offset];
  if (v9 != (char *)self->mBufferEnd)
  {
    if (([(SFUInputStream *)self->mInputStream canSeek] & 1) == 0) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFDInputStream readToOwnBuffer:size:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDInputStream.m") lineNumber:156 description:@"can't fix the offset if the input stream can't seek"];
    }
    [(SFUInputStream *)self->mInputStream seekToOffset:self->mBufferEnd];
    size_t v9 = (char *)self->mBufferEnd;
  }
  while (1)
  {
    unint64_t mBufferSize = self->mBufferSize;
    int64_t mBufferStart = self->mBufferStart;
    if (mBufferSize <= (unint64_t)&v9[-mBufferStart]) {
      break;
    }
    v11 = (char *)[(SFUInputStream *)self->mInputStream readToBuffer:&self->mEncryptedBuffer[(unint64_t)&v9[-mBufferStart]] size:mBufferSize - (void)&v9[-mBufferStart]];
    size_t v9 = &v11[self->mBufferEnd];
    self->int64_t mBufferEnd = (int64_t)v9;
    if (!v11)
    {
      int64_t mBufferStart = self->mBufferStart;
      break;
    }
  }
  if (v9)
  {
    [(BuLr3rwnVU31zt9OioJ56 *)self->mDecryptionSession BaSrRpzcWCyAjSdjbc8j:self->mEncryptedBuffer withSize:&v9[-mBufferStart] into:self->mBuffer error:0];
    int64_t mBufferStart = self->mBufferStart;
    int64_t mBufferEnd = self->mBufferEnd;
  }
  else
  {
    int64_t mBufferEnd = 0;
  }
LABEL_14:
  int64_t mBufferOffset = self->mBufferOffset;
  unint64_t v13 = mBufferEnd - (mBufferStart + mBufferOffset);
  if (v13 >= a4) {
    unint64_t result = a4;
  }
  else {
    unint64_t result = v13;
  }
  *a3 = &self->mBuffer[mBufferOffset];
  self->int64_t mBufferOffset = result + mBufferOffset;
  return result;
}

- (BOOL)seekWithinBufferToOffset:(int64_t)a3
{
  return 0;
}

@end