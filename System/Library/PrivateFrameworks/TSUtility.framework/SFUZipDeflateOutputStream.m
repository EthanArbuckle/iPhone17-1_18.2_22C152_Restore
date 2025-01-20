@interface SFUZipDeflateOutputStream
- (BOOL)canCreateInputStream;
- (BOOL)canSeek;
- (SFUZipDeflateOutputStream)initWithOutputStream:(id)a3;
- (id)closeLocalStream;
- (id)inputStream;
- (int64_t)offset;
- (void)close;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3 whence:(int)a4;
- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4;
@end

@implementation SFUZipDeflateOutputStream

- (SFUZipDeflateOutputStream)initWithOutputStream:(id)a3
{
  v4 = [(SFUZipDeflateOutputStream *)self init];
  if (v4)
  {
    v4->mOutputStream = (SFUOutputStream *)a3;
    mOutBuffer = (char *)malloc_type_malloc(0x40000uLL, 0xEF661511uLL);
    v4->mOutBuffer = mOutBuffer;
    if (!mOutBuffer)
    {
      +[SFUZipException raise:@"SFUZipDeflateError" format:@"Could not create deflate buffer"];
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
      +[SFUZipException raise:@"SFUZipDeflateError", @"deflateInit2() failed: %s", v4->mDeflateStream.msg format];
    }
  }
  return v4;
}

- (void)dealloc
{
  deflateEnd(&self->mDeflateStream);

  free(self->mOutBuffer);
  v3.receiver = self;
  v3.super_class = (Class)SFUZipDeflateOutputStream;
  [(SFUZipDeflateOutputStream *)&v3 dealloc];
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
      +[SFUZipException raise:@"SFUZipDeflateError", @"deflate() failed: %s", self->mDeflateStream.msg format];
    }
  }
  return self->mOutputStream;
}

- (void)close
{
  id v2 = [(SFUZipDeflateOutputStream *)self closeLocalStream];
  [v2 close];
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  if (!self->mDeflateStream.next_out)
  {
    id v7 = +[TSUAssertionHandler currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[SFUZipDeflateOutputStream writeBuffer:size:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipDeflateOutputStream.m"), 133, @"Stream is already closed.");
  }
  if (a4 >= 0xFFFFFFFF)
  {
    id v9 = +[TSUAssertionHandler currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[SFUZipDeflateOutputStream writeBuffer:size:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipDeflateOutputStream.m"), 136, @"overflow in writeBuffer:size:");
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
    +[SFUZipException raise:@"SFUZipDeflateError", @"deflate() failed: %s", self->mDeflateStream.msg format];
  }
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  id v4 = +[TSUAssertionHandler currentHandler];
  uint64_t v5 = [NSString stringWithUTF8String:"-[SFUZipDeflateOutputStream seekToOffset:whence:]"];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipDeflateOutputStream.m"];
  [v4 handleFailureInFunction:v5 file:v6 lineNumber:169 description:@"Not implemented."];
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