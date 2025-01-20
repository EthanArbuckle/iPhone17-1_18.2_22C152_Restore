@interface OISFUBufferedInputStream
- (BOOL)canSeek;
- (BOOL)seekWithinBufferToOffset:(int64_t)a3;
- (OISFUBufferedInputStream)initWithStream:(id)a3;
- (OISFUBufferedInputStream)initWithStream:(id)a3 bufferSize:(unint64_t)a4;
- (OISFUBufferedInputStream)initWithStream:(id)a3 dataLength:(int64_t)a4;
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

@implementation OISFUBufferedInputStream

- (OISFUBufferedInputStream)initWithStream:(id)a3
{
  return [(OISFUBufferedInputStream *)self initWithStream:a3 bufferSize:0x40000];
}

- (OISFUBufferedInputStream)initWithStream:(id)a3 bufferSize:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)OISFUBufferedInputStream;
  v6 = [(OISFUBufferedInputStream *)&v11 init];
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v6->mStream = (SFUInputStream *)a3;
      v7->mBufferSize = a4;
      v8 = (char *)malloc_type_malloc(a4, 0x22AE73CEuLL);
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

- (OISFUBufferedInputStream)initWithStream:(id)a3 dataLength:(int64_t)a4
{
  if ((unint64_t)a4 >= 0x40000) {
    a4 = 0x40000;
  }
  return [(OISFUBufferedInputStream *)self initWithStream:a3 bufferSize:a4];
}

- (void)dealloc
{
  free(self->mBuffer);

  v3.receiver = self;
  v3.super_class = (Class)OISFUBufferedInputStream;
  [(OISFUBufferedInputStream *)&v3 dealloc];
}

- (int64_t)offset
{
  return self->mBufferOffset + self->mBufferStart;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  __src = 0;
  size_t v5 = [(OISFUBufferedInputStream *)self readToOwnBuffer:&__src size:a4];
  memcpy(a3, __src, v5);
  return v5;
}

- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4
{
  if (!a3)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"-[OISFUBufferedInputStream readToOwnBuffer:size:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUBufferedInputStream.m"], 81, 0, "No buffer parameter");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  int64_t mBufferStart = self->mBufferStart;
  int64_t mBufferEnd = self->mBufferEnd;
  if (self->mBufferOffset + mBufferStart > mBufferEnd)
  {
    uint64_t v10 = [NSString stringWithUTF8String:"-[OISFUBufferedInputStream readToOwnBuffer:size:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUBufferedInputStream.m"], 82, 0, "Bad invariant");
    +[OITSUAssertionHandler logBacktraceThrottled];
    int64_t mBufferStart = self->mBufferStart;
    int64_t mBufferEnd = self->mBufferEnd;
  }
  unint64_t mBufferSize = self->mBufferSize;
  if (mBufferEnd - mBufferStart > (uint64_t)mBufferSize)
  {
    uint64_t v12 = [NSString stringWithUTF8String:"-[OISFUBufferedInputStream readToOwnBuffer:size:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUBufferedInputStream.m"], 83, 0, "Bad invariant");
    +[OITSUAssertionHandler logBacktraceThrottled];
    unint64_t mBufferSize = self->mBufferSize;
    int64_t mBufferStart = self->mBufferStart;
    int64_t mBufferEnd = self->mBufferEnd;
  }
  if (mBufferSize >= a4) {
    unint64_t v13 = a4;
  }
  else {
    unint64_t v13 = mBufferSize;
  }
  int64_t mBufferOffset = self->mBufferOffset;
  int64_t v15 = mBufferEnd - mBufferStart;
  unint64_t v16 = v15 - mBufferOffset;
  if (v13 > v15 - mBufferOffset)
  {
    memmove(self->mBuffer, &self->mBuffer[mBufferOffset], v15 - mBufferOffset);
    int64_t v17 = self->mBufferStart + self->mBufferOffset;
    self->int64_t mBufferOffset = 0;
    self->int64_t mBufferStart = v17;
    if ([(SFUInputStream *)self->mStream offset] != self->mBufferEnd)
    {
      if ([(SFUInputStream *)self->mStream canSeek])
      {
        [(SFUInputStream *)self->mStream seekToOffset:self->mBufferEnd];
      }
      else
      {
        uint64_t v18 = [NSString stringWithUTF8String:"-[OISFUBufferedInputStream readToOwnBuffer:size:]"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUBufferedInputStream.m"], 104, 0, "Detected a read from the stream beneath a buffered stream.");
        +[OITSUAssertionHandler logBacktraceThrottled];
      }
    }
    uint64_t v19 = [(SFUInputStream *)self->mStream readToBuffer:&self->mBuffer[v16] size:self->mBufferSize - v16];
    int64_t v20 = self->mBufferStart;
    int64_t v21 = self->mBufferEnd + v19;
    self->int64_t mBufferEnd = v21;
    int64_t mBufferOffset = self->mBufferOffset;
    unint64_t v16 = v21 - (v20 + mBufferOffset);
  }
  if (v13 >= v16) {
    unint64_t result = v16;
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
  if (![(OISFUBufferedInputStream *)self canSeek]) {
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