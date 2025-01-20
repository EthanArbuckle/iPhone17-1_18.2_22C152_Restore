@interface SFUFileInputStream
- (BOOL)canSeek;
- (BOOL)p_configureWithFileDescriptor:(int)a3 offset:(int64_t)a4 length:(int64_t)a5;
- (BOOL)p_configureWithPath:(id)a3 offset:(int64_t)a4 length:(int64_t)a5;
- (SFUFileInputStream)initWithFileDescriptor:(int)a3 offset:(int64_t)a4 length:(int64_t)a5;
- (SFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4;
- (SFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4 length:(int64_t)a5;
- (id)closeLocalStream;
- (id)p_init;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)disableSystemCaching;
- (void)enableSystemCaching;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation SFUFileInputStream

- (id)p_init
{
  v3.receiver = self;
  v3.super_class = (Class)SFUFileInputStream;
  id result = [(SFUFileInputStream *)&v3 init];
  if (result) {
    *((_DWORD *)result + 2) = -1;
  }
  return result;
}

- (SFUFileInputStream)initWithFileDescriptor:(int)a3 offset:(int64_t)a4 length:(int64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  v8 = [(SFUFileInputStream *)self p_init];
  v9 = v8;
  if (v8
    && ![(SFUFileInputStream *)v8 p_configureWithFileDescriptor:v7 offset:a4 length:a5])
  {

    return 0;
  }
  return v9;
}

- (SFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4 length:(int64_t)a5
{
  v8 = [(SFUFileInputStream *)self p_init];
  v9 = v8;
  if (v8
    && ![(SFUFileInputStream *)v8 p_configureWithPath:a3 offset:a4 length:a5])
  {

    return 0;
  }
  return v9;
}

- (SFUFileInputStream)initWithPath:(id)a3 offset:(int64_t)a4
{
  v6 = [(SFUFileInputStream *)self p_init];
  if (v6)
  {
    uint64_t v7 = [+[NSFileManager defaultManager] attributesOfItemAtPath:a3 error:0];
    if (!v7
      || (id v8 = [(NSDictionary *)v7 objectForKey:NSFileSize]) == 0
      || (v9 = (char *)[v8 unsignedLongLongValue], (uint64_t)v9 < a4)
      || ![(SFUFileInputStream *)v6 p_configureWithPath:a3 offset:a4 length:&v9[-a4]])
    {

      return 0;
    }
  }
  return v6;
}

- (BOOL)p_configureWithFileDescriptor:(int)a3 offset:(int64_t)a4 length:(int64_t)a5
{
  BOOL v5 = (a5 | a4) < 0 || (a5 ^ 0x7FFFFFFFFFFFFFFFLL) < a4;
  BOOL v6 = !v5;
  if (v5)
  {
    +[NSException raise:NSInvalidArgumentException format:@"Offset and/or length invalid."];
  }
  else
  {
    self->mFd = a3;
    self->mStartOffset = a4;
    self->mCurrentOffset = a4;
    self->mEndOffset = a5 + a4;
  }
  return v6;
}

- (BOOL)p_configureWithPath:(id)a3 offset:(int64_t)a4 length:(int64_t)a5
{
  if (!a3
    || ![+[NSFileManager defaultManager] isReadableFileAtPath:a3])
  {
    return 0;
  }
  uint64_t v9 = SFUOpen(a3, 0, 0);
  return [(SFUFileInputStream *)self p_configureWithFileDescriptor:v9 offset:a4 length:a5];
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
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE748);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016A120();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUFileInputStream readToBuffer:size:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUFileInputStream.m"), 121, 0, "Using a closed stream");
    +[TSUAssertionHandler logBacktraceThrottled];
    int mFd = self->mFd;
  }
  off_t mCurrentOffset = self->mCurrentOffset;
  if (self->mEndOffset - mCurrentOffset < a4) {
    a4 = self->mEndOffset - mCurrentOffset;
  }
  size_t v9 = a4;
  do
  {
    ssize_t v10 = pread(mFd, a3, v9, mCurrentOffset);
    ssize_t v11 = v10;
    if (v10 < 0 || v9 && !v10) {
      +[NSException sfu_errnoRaise:@"SFUPReadError" format:@"Could not pread"];
    }
    mCurrentOffset += v11;
    a3 += v11;
    v9 -= v11;
  }
  while (v9);
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
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE768);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016A230();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUFileInputStream *)NSString seekToOffset:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUFileInputStream.m"], 139, 0, "Using a closed stream"");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  int64_t v5 = self->mStartOffset + a3;
  int64_t mEndOffset = self->mEndOffset;
  if (v5 > mEndOffset)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE788);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016A1A8();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUFileInputStream *)NSString seekToOffset:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUFileInputStream.m"], 142, 0, "Offset is too large."");
    +[TSUAssertionHandler logBacktraceThrottled];
    int64_t mEndOffset = self->mEndOffset;
  }
  if (v5 < mEndOffset) {
    int64_t mEndOffset = v5;
  }
  self->off_t mCurrentOffset = mEndOffset;
}

- (void)disableSystemCaching
{
  int mFd = self->mFd;
  if (mFd != -1)
  {
    if (fcntl(mFd, 48, 1) == -1) {
      +[NSException sfu_errnoRaise:@"SFUFcntlError" format:@"Could not set F_NOCACHE on read stream."];
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
      +[NSException sfu_errnoRaise:@"SFUFcntlError" format:@"Could not unset F_NOCACHE on read stream."];
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
      unsigned int v4 = +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CE7A8);
      }
      int64_t v5 = TSUAssertCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
      {
        int v6 = self->mFd;
        int v7 = *__error();
        *(_DWORD *)buf = 67110658;
        unsigned int v9 = v4;
        __int16 v10 = 2082;
        ssize_t v11 = "-[SFUFileInputStream close]";
        __int16 v12 = 2082;
        v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUFileInputStream.m";
        __int16 v14 = 1024;
        int v15 = 178;
        __int16 v16 = 2048;
        v17 = self;
        __int16 v18 = 1024;
        int v19 = v6;
        __int16 v20 = 1024;
        int v21 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Failed to close SFUFileInputStream %p, fd = %d, errno = %d", buf, 0x38u);
      }
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUFileInputStream *)NSString close], 178, 0, "Failed to close SFUFileInputStream %p, fd = %d, errno = %d"", self, self->mFd, *__error());
      +[TSUAssertionHandler logBacktraceThrottled];
    }
    self->int mFd = -1;
  }
}

- (id)closeLocalStream
{
  return 0;
}

@end