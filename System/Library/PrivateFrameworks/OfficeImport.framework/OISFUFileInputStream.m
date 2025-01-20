@interface OISFUFileInputStream
- (BOOL)canSeek;
- (OISFUFileInputStream)initWithFileDescriptor:(int)a3 offset:(int64_t)a4 length:(int64_t)a5;
- (OISFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4;
- (OISFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4 length:(int64_t)a5;
- (id)closeLocalStream;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)disableSystemCaching;
- (void)enableSystemCaching;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation OISFUFileInputStream

- (OISFUFileInputStream)initWithFileDescriptor:(int)a3 offset:(int64_t)a4 length:(int64_t)a5
{
  v8 = self;
  self->mFd = -1;
  v10.receiver = self;
  v10.super_class = (Class)OISFUFileInputStream;
  if (![(OISFUFileInputStream *)&v10 init]) {
    return 0;
  }
  if ((a5 | a4) < 0 || (a5 ^ 0x7FFFFFFFFFFFFFFFLL) < a4)
  {

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Offset and/or length invalid."];
  }
  v8->mFd = a3;
  v8->mStartOffset = a4;
  v8->mCurrentOffset = a4;
  v8->mEndOffset = a5 + a4;
  return v8;
}

- (OISFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4 length:(int64_t)a5
{
  self->mFd = -1;
  if (a3
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "isReadableFileAtPath:", a3) & 1) != 0)
  {
    uint64_t v9 = SFUOpen(a3, 0, 0);
    return [(OISFUFileInputStream *)self initWithFileDescriptor:v9 offset:a4 length:a5];
  }
  else
  {

    return 0;
  }
}

- (OISFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4
{
  self->mFd = -1;
  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "attributesOfItemAtPath:error:", a3, 0);
  if (v7
    && (v8 = (void *)[v7 objectForKey:*MEMORY[0x263F080B8]]) != 0
    && (uint64_t v9 = [v8 unsignedLongLongValue], v9 >= a4))
  {
    return [(OISFUFileInputStream *)self initWithPath:a3 offset:a4 length:v9 - a4];
  }
  else
  {

    return 0;
  }
}

- (void)dealloc
{
  [(OISFUFileInputStream *)self close];
  v3.receiver = self;
  v3.super_class = (Class)OISFUFileInputStream;
  [(OISFUFileInputStream *)&v3 dealloc];
}

- (int64_t)offset
{
  return self->mCurrentOffset - self->mStartOffset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  int mFd = self->mFd;
  if (mFd == -1)
  {
    uint64_t v8 = [NSString stringWithUTF8String:"-[OISFUFileInputStream readToBuffer:size:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileInputStream.m"], 98, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled];
    int mFd = self->mFd;
  }
  off_t mCurrentOffset = self->mCurrentOffset;
  if (self->mEndOffset - mCurrentOffset < a4) {
    a4 = self->mEndOffset - mCurrentOffset;
  }
  size_t v10 = a4;
  do
  {
    ssize_t v11 = pread(mFd, a3, v10, mCurrentOffset);
    ssize_t v12 = v11;
    if (v11 < 0 || v10 && !v11) {
      objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUPReadError", @"Could not pread");
    }
    mCurrentOffset += v12;
    a3 += v12;
    v10 -= v12;
  }
  while (v10);
  self->mCurrentOffset += a4;
  return a4;
}

- (BOOL)canSeek
{
  return 1;
}

- (void)seekToOffset:(int64_t)a3
{
  if (self->mFd == -1)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"-[OISFUFileInputStream seekToOffset:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileInputStream.m"], 116, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  int64_t v6 = self->mStartOffset + a3;
  int64_t mEndOffset = self->mEndOffset;
  if (v6 > mEndOffset)
  {
    uint64_t v8 = [NSString stringWithUTF8String:"-[OISFUFileInputStream seekToOffset:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileInputStream.m"], 119, 0, "Offset is too large.");
    +[OITSUAssertionHandler logBacktraceThrottled];
    int64_t mEndOffset = self->mEndOffset;
  }
  if (v6 < mEndOffset) {
    int64_t mEndOffset = v6;
  }
  self->off_t mCurrentOffset = mEndOffset;
}

- (void)disableSystemCaching
{
  int mFd = self->mFd;
  if (mFd != -1)
  {
    if (fcntl(mFd, 48, 1) == -1) {
      objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUFcntlError", @"Could not set F_NOCACHE on read stream.");
    }
    self->mIsCachingDisabled = 1;
  }
}

- (void)enableSystemCaching
{
  int mFd = self->mFd;
  if (mFd != -1)
  {
    if (fcntl(mFd, 48, 0) == -1) {
      objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUFcntlError", @"Could not unset F_NOCACHE on read stream.");
    }
    self->mIsCachingDisabled = 0;
  }
}

- (void)close
{
  int mFd = self->mFd;
  if (mFd != -1)
  {
    if (self->mIsCachingDisabled)
    {
      fcntl(mFd, 48, 0);
      self->mIsCachingDisabled = 0;
      int mFd = self->mFd;
    }
    if (close(mFd))
    {
      uint64_t v4 = [NSString stringWithUTF8String:"-[OISFUFileInputStream close]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileInputStream.m"], 155, 0, "Failed to close SFUFileInputStream %p, fd = %d, errno = %d", self, self->mFd, *__error());
      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    self->int mFd = -1;
  }
}

- (id)closeLocalStream
{
  return 0;
}

@end