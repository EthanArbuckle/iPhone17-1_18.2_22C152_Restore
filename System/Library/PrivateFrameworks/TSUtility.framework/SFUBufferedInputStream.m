@interface SFUBufferedInputStream
- (BOOL)canSeek;
- (BOOL)seekWithinBufferToOffset:(int64_t)a3;
- (SFUBufferedInputStream)initWithStream:(id)a3;
- (SFUBufferedInputStream)initWithStream:(id)a3 bufferSize:(unint64_t)a4;
- (SFUBufferedInputStream)initWithStream:(id)a3 dataLength:(int64_t)a4;
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

@implementation SFUBufferedInputStream

- (SFUBufferedInputStream)initWithStream:(id)a3
{
  return [(SFUBufferedInputStream *)self initWithStream:a3 bufferSize:66560];
}

- (SFUBufferedInputStream)initWithStream:(id)a3 bufferSize:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SFUBufferedInputStream;
  v6 = [(SFUBufferedInputStream *)&v11 init];
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v6->mStream = (SFUInputStream *)a3;
      v7->mBufferSize = a4;
      v8 = (char *)malloc_type_malloc(a4, 0x6063BF5FuLL);
      v7->mBuffer = v8;
      if (!v8)
      {

        [MEMORY[0x263EFF940] raise:@"SFUBufferedInputStreamError" format:@"Could not create read buffer"];
      }
      uint64_t v9 = [(SFUInputStream *)v7->mStream offset];
      v7->mBufferStart = v9;
      v7->mBufferEnd = v9;
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (SFUBufferedInputStream)initWithStream:(id)a3 dataLength:(int64_t)a4
{
  if ((unint64_t)a4 >= 0x10400) {
    a4 = 66560;
  }
  return [(SFUBufferedInputStream *)self initWithStream:a3 bufferSize:a4];
}

- (void)dealloc
{
  free(self->mBuffer);

  v3.receiver = self;
  v3.super_class = (Class)SFUBufferedInputStream;
  [(SFUBufferedInputStream *)&v3 dealloc];
}

- (int64_t)offset
{
  return self->mBufferOffset + self->mBufferStart;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  __src = 0;
  size_t v5 = [(SFUBufferedInputStream *)self readToOwnBuffer:&__src size:a4];
  memcpy(a3, __src, v5);
  return v5;
}

- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4
{
  if (!a3)
  {
    id v7 = +[TSUAssertionHandler currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[SFUBufferedInputStream readToOwnBuffer:size:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUBufferedInputStream.m"), 92, @"No buffer parameter");
  }
  int64_t mBufferStart = self->mBufferStart;
  int64_t mBufferEnd = self->mBufferEnd;
  if (self->mBufferOffset + mBufferStart > mBufferEnd)
  {
    id v11 = +[TSUAssertionHandler currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[SFUBufferedInputStream readToOwnBuffer:size:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUBufferedInputStream.m"), 93, @"Bad invariant");
    int64_t mBufferStart = self->mBufferStart;
    int64_t mBufferEnd = self->mBufferEnd;
  }
  unint64_t mBufferSize = self->mBufferSize;
  if (mBufferEnd - mBufferStart > (uint64_t)mBufferSize)
  {
    id v14 = +[TSUAssertionHandler currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[SFUBufferedInputStream readToOwnBuffer:size:]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUBufferedInputStream.m"), 94, @"Bad invariant");
    unint64_t mBufferSize = self->mBufferSize;
    int64_t mBufferStart = self->mBufferStart;
    int64_t mBufferEnd = self->mBufferEnd;
  }
  if (mBufferSize >= a4) {
    unint64_t v16 = a4;
  }
  else {
    unint64_t v16 = mBufferSize;
  }
  int64_t mBufferOffset = self->mBufferOffset;
  int64_t v18 = mBufferEnd - mBufferStart;
  unint64_t v19 = v18 - mBufferOffset;
  if (v16 > v18 - mBufferOffset)
  {
    memmove(self->mBuffer, &self->mBuffer[mBufferOffset], v18 - mBufferOffset);
    int64_t v20 = self->mBufferStart + self->mBufferOffset;
    self->int64_t mBufferOffset = 0;
    self->int64_t mBufferStart = v20;
    if ([(SFUInputStream *)self->mStream offset] != self->mBufferEnd)
    {
      if ([(SFUInputStream *)self->mStream canSeek])
      {
        [(SFUInputStream *)self->mStream seekToOffset:self->mBufferEnd];
      }
      else
      {
        id v21 = +[TSUAssertionHandler currentHandler];
        uint64_t v22 = [NSString stringWithUTF8String:"-[SFUBufferedInputStream readToOwnBuffer:size:]"];
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUBufferedInputStream.m"), 121, @"Detected a read from the stream beneath a buffered stream.");
      }
    }
    uint64_t v23 = [(SFUInputStream *)self->mStream readToBuffer:&self->mBuffer[v19] size:self->mBufferSize - v19];
    int64_t v24 = self->mBufferStart;
    int64_t v25 = self->mBufferEnd + v23;
    self->int64_t mBufferEnd = v25;
    int64_t mBufferOffset = self->mBufferOffset;
    unint64_t v19 = v25 - (v24 + mBufferOffset);
  }
  if (v16 >= v19) {
    unint64_t result = v19;
  }
  else {
    unint64_t result = v16;
  }
  *a3 = &self->mBuffer[mBufferOffset];
  self->int64_t mBufferOffset = result + mBufferOffset;
  return result;
}

- (BOOL)seekWithinBufferToOffset:(int64_t)a3
{
  int64_t mBufferStart = self->mBufferStart;
  BOOL v4 = __OFSUB__(a3, mBufferStart);
  int64_t v5 = a3 - mBufferStart;
  if (v5 < 0 != v4 || self->mBufferEnd < a3) {
    return 0;
  }
  self->int64_t mBufferOffset = v5;
  return 1;
}

- (BOOL)canSeek
{
  return [(SFUInputStream *)self->mStream canSeek];
}

- (void)seekToOffset:(int64_t)a3
{
  if (![(SFUBufferedInputStream *)self canSeek]) {
    [MEMORY[0x263EFF940] raise:@"SFUBufferedInputStreamError" format:@"Can't seek"];
  }
  int64_t mBufferStart = self->mBufferStart;
  BOOL v6 = __OFSUB__(a3, mBufferStart);
  int64_t v7 = a3 - mBufferStart;
  if (v7 < 0 != v6 || self->mBufferEnd < a3)
  {
    self->int64_t mBufferOffset = 0;
    self->int64_t mBufferStart = a3;
    uint64_t v8 = 48;
  }
  else
  {
    uint64_t v8 = 32;
    a3 = v7;
  }
  *(Class *)((char *)&self->super.isa + v8) = (Class)a3;
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
  return self->mStream;
}

@end