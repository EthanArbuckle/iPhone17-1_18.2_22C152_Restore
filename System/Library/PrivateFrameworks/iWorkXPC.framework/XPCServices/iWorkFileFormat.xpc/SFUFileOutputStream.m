@interface SFUFileOutputStream
- (BOOL)canCreateInputStream;
- (BOOL)canSeek;
- (SFUFileOutputStream)initWithPath:(id)a3;
- (id)closeLocalStream;
- (id)inputStream;
- (id)path;
- (int64_t)offset;
- (void)close;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3 whence:(int)a4;
- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4;
@end

@implementation SFUFileOutputStream

- (SFUFileOutputStream)initWithPath:(id)a3
{
  v4 = [(SFUFileOutputStream *)self init];
  if (v4)
  {
    unlink((const char *)[a3 fileSystemRepresentation]);
    v4->mFile = SFUFileOpen(a3, "w");
    v4->mPath = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  mFile = self->mFile;
  if (mFile) {
    fclose(mFile);
  }

  v4.receiver = self;
  v4.super_class = (Class)SFUFileOutputStream;
  [(SFUFileOutputStream *)&v4 dealloc];
}

- (id)path
{
  return self->mPath;
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  mFile = self->mFile;
  if (!mFile)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CDE40);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100168DE8();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUFileOutputStream writeBuffer:size:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUFileOutputStream.m"), 55, 0, "Using a closed stream");
    +[TSUAssertionHandler logBacktraceThrottled];
    mFile = self->mFile;
  }
  if (fwrite(a3, 1uLL, a4, mFile) != a4) {
    +[NSException sfu_errnoRaise:@"SFUFileWriteError" format:@"Could not write"];
  }
}

- (int64_t)offset
{
  mFile = self->mFile;
  if (!mFile)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CDE60);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100168E70();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUFileOutputStream *)NSString offset], 60, 0, "Using a closed stream"");
    +[TSUAssertionHandler logBacktraceThrottled];
    mFile = self->mFile;
  }
  off_t v4 = ftello(mFile);
  if (v4 == -1) {
    +[NSException sfu_errnoRaise:@"SFUFileTellError" format:@"Could not tell"];
  }
  return v4;
}

- (BOOL)canSeek
{
  return 1;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  mFile = self->mFile;
  if (!mFile)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CDE80);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100168EF8();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUFileOutputStream seekToOffset:whence:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUFileOutputStream.m"), 70, 0, "Using a closed stream");
    +[TSUAssertionHandler logBacktraceThrottled];
    mFile = self->mFile;
  }
  if (fseeko(mFile, a3, a4)) {
    +[NSException sfu_errnoRaise:@"SFUFileSeekError" format:@"Could not seek"];
  }
}

- (BOOL)canCreateInputStream
{
  return 0;
}

- (id)inputStream
{
  return 0;
}

- (void)close
{
  mFile = self->mFile;
  if (mFile)
  {
    fclose(mFile);
    self->mFile = 0;
  }
}

- (id)closeLocalStream
{
  return 0;
}

@end