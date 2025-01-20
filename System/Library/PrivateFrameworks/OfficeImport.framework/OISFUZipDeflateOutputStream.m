@interface OISFUZipDeflateOutputStream
- (BOOL)canCreateInputStream;
- (BOOL)canSeek;
- (OISFUZipDeflateOutputStream)initWithOutputStream:(id)a3;
- (id)closeLocalStream;
- (id)inputStream;
- (int64_t)offset;
- (void)close;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3 whence:(int)a4;
- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4;
@end

@implementation OISFUZipDeflateOutputStream

- (OISFUZipDeflateOutputStream)initWithOutputStream:(id)a3
{
  v4 = [(OISFUZipDeflateOutputStream *)self init];
  if (v4)
  {
    v4->mOutputStream = (SFUOutputStream *)a3;
    mOutBuffer = (char *)malloc_type_malloc(0x40000uLL, 0xEF661511uLL);
    v4->mOutBuffer = mOutBuffer;
    if (!mOutBuffer)
    {
      +[OISFUZipException raise:@"SFUZipDeflateError" format:@"Could not create deflate buffer"];
      mOutBuffer = v4->mOutBuffer;
    }
    v4->mDeflateStream.next_in = 0;
    v4->mDeflateStream.avail_in = 0;
    v4->mDeflateStream.zfree = 0;
    v4->mDeflateStream.opaque = 0;
    v4->mDeflateStream.zalloc = 0;
    v4->mDeflateStream.avail_out = 0x40000;
    v4->mDeflateStream.next_out = (Bytef *)mOutBuffer;
    if (deflateInit2_(&v4->mDeflateStream, 8, 8, -15, 9, 0, "1.2.12", 112)) {
      +[OISFUZipException raise:@"SFUZipDeflateError", @"deflateInit2() failed: %s", v4->mDeflateStream.msg format];
    }
  }
  return v4;
}

- (void)dealloc
{
  deflateEnd(&self->mDeflateStream);

  free(self->mOutBuffer);
  v3.receiver = self;
  v3.super_class = (Class)OISFUZipDeflateOutputStream;
  [(OISFUZipDeflateOutputStream *)&v3 dealloc];
}

- (id)closeLocalStream
{
  if (self->mDeflateStream.next_out)
  {
    do
    {
      int v3 = deflate(&self->mDeflateStream, 4);
      if (self->mDeflateStream.next_out <= (Bytef *)self->mOutBuffer) {
        int v4 = -5;
      }
      else {
        int v4 = 0;
      }
      if (v3 == -5) {
        int v5 = v4;
      }
      else {
        int v5 = v3;
      }
      -[SFUOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:");
      self->mDeflateStream.avail_out = 0x40000;
      self->mDeflateStream.next_out = (Bytef *)self->mOutBuffer;
    }
    while (!v5);
    self->mDeflateStream.avail_out = 0;
    self->mDeflateStream.next_out = 0;
    if (v5 != -5 && v5 != 1) {
      +[OISFUZipException raise:@"SFUZipDeflateError", @"deflate() failed: %s", self->mDeflateStream.msg format];
    }
  }
  return self->mOutputStream;
}

- (void)close
{
  id v2 = [(OISFUZipDeflateOutputStream *)self closeLocalStream];
  [v2 close];
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  if (!self->mDeflateStream.next_out)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"-[OISFUZipDeflateOutputStream writeBuffer:size:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipDeflateOutputStream.m"], 121, 0, "Stream is already closed.");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if (a4 >= 0xFFFFFFFF)
  {
    uint64_t v8 = [NSString stringWithUTF8String:"-[OISFUZipDeflateOutputStream writeBuffer:size:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipDeflateOutputStream.m"], 124, 0, "overflow in writeBuffer:size:");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  self->mDeflateStream.avail_in = a4;
  self->mDeflateStream.next_in = (Bytef *)a3;
  if (a4)
  {
    while (1)
    {
      if (!self->mDeflateStream.avail_out)
      {
        [(SFUOutputStream *)self->mOutputStream writeBuffer:self->mOutBuffer size:0x40000];
        self->mDeflateStream.avail_out = 0x40000;
        self->mDeflateStream.next_out = (Bytef *)self->mOutBuffer;
      }
      if (deflate(&self->mDeflateStream, 0)) {
        break;
      }
      if (!self->mDeflateStream.avail_in) {
        return;
      }
    }
    +[OISFUZipException raise:@"SFUZipDeflateError", @"deflate() failed: %s", self->mDeflateStream.msg format];
  }
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  uint64_t v4 = objc_msgSend(NSString, "stringWithUTF8String:", "-[OISFUZipDeflateOutputStream seekToOffset:whence:]", *(void *)&a4);
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipDeflateOutputStream.m"], 152, 0, "Not implemented.");
  +[OITSUAssertionHandler logBacktraceThrottled];
}

- (int64_t)offset
{
  return self->mDeflateStream.total_in;
}

- (BOOL)canCreateInputStream
{
  return 0;
}

- (id)inputStream
{
  return 0;
}

@end