@interface SFUFileInputStream
- (BOOL)canSeek;
- (SFUFileInputStream)initWithFileDescriptor:(int)a3 offset:(int64_t)a4 length:(int64_t)a5;
- (SFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4;
- (SFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4 length:(int64_t)a5;
- (id)closeLocalStream;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)disableSystemCaching;
- (void)enableSystemCaching;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation SFUFileInputStream

- (SFUFileInputStream)initWithFileDescriptor:(int)a3 offset:(int64_t)a4 length:(int64_t)a5
{
  v8 = self;
  self->mFd = -1;
  v10.receiver = self;
  v10.super_class = (Class)SFUFileInputStream;
  if (![(SFUFileInputStream *)&v10 init]) {
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

- (SFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4 length:(int64_t)a5
{
  self->mFd = -1;
  if (a3
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "isReadableFileAtPath:", a3) & 1) != 0)
  {
    uint64_t v9 = SFUOpen(a3, 0, 0);
    return [(SFUFileInputStream *)self initWithFileDescriptor:v9 offset:a4 length:a5];
  }
  else
  {

    return 0;
  }
}

- (SFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4
{
  self->mFd = -1;
  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "attributesOfItemAtPath:error:", a3, 0);
  if (v7
    && (v8 = (void *)[v7 objectForKey:*MEMORY[0x263F080B8]]) != 0
    && (uint64_t v9 = [v8 unsignedLongLongValue], v9 >= a4))
  {
    return [(SFUFileInputStream *)self initWithPath:a3 offset:a4 length:v9 - a4];
  }
  else
  {

    return 0;
  }
}

- (void)dealloc
{
  [(SFUFileInputStream *)self close];
  v3.receiver = self;
  v3.super_class = (Class)SFUFileInputStream;
  [(SFUFileInputStream *)&v3 dealloc];
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
    id v8 = +[TSUAssertionHandler currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[SFUFileInputStream readToBuffer:size:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileInputStream.m"), 111, @"Using a closed stream");
    int mFd = self->mFd;
  }
  off_t mCurrentOffset = self->mCurrentOffset;
  if (self->mEndOffset - mCurrentOffset < a4) {
    a4 = self->mEndOffset - mCurrentOffset;
  }
  size_t v11 = a4;
  do
  {
    ssize_t v12 = pread(mFd, a3, v11, mCurrentOffset);
    ssize_t v13 = v12;
    if (v12 < 0 || v11 && !v12) {
      [MEMORY[0x263EFF940] errnoRaise:@"SFUPReadError" format:@"Could not pread"];
    }
    mCurrentOffset += v13;
    a3 += v13;
    v11 -= v13;
  }
  while (v11);
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
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[SFUFileInputStream seekToOffset:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileInputStream.m"), 132, @"Using a closed stream");
  }
  int64_t v7 = self->mStartOffset + a3;
  int64_t mEndOffset = self->mEndOffset;
  if (v7 > mEndOffset)
  {
    id v9 = +[TSUAssertionHandler currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[SFUFileInputStream seekToOffset:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileInputStream.m"), 135, @"Offset is too large.");
    int64_t mEndOffset = self->mEndOffset;
  }
  if (v7 < mEndOffset) {
    int64_t mEndOffset = v7;
  }
  self->off_t mCurrentOffset = mEndOffset;
}

- (void)disableSystemCaching
{
  int mFd = self->mFd;
  if (mFd != -1)
  {
    if (fcntl(mFd, 48, 1) == -1) {
      [MEMORY[0x263EFF940] errnoRaise:@"SFUFcntlError" format:@"Could not set F_NOCACHE on read stream."];
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
      [MEMORY[0x263EFF940] errnoRaise:@"SFUFcntlError" format:@"Could not unset F_NOCACHE on read stream."];
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
      id v4 = +[TSUAssertionHandler currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[SFUFileInputStream close]"];
      [v4 handleFailureInFunction:v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileInputStream.m"), 180, @"Failed to close SFUFileInputStream %p, fd = %d, errno = %d", self, self->mFd, *__error() file lineNumber description];
    }
    self->int mFd = -1;
  }
}

- (id)closeLocalStream
{
  return 0;
}

@end