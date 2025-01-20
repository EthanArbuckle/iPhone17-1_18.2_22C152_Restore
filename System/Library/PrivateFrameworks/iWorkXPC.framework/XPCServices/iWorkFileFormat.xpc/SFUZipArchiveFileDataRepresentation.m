@interface SFUZipArchiveFileDataRepresentation
- (BOOL)hasSameLocationAs:(id)a3;
- (BOOL)isEncrypted;
- (BOOL)isReadable;
- (SFUZipArchiveFileDataRepresentation)initWithPath:(id)a3;
- (id)bufferedInputStreamWithOffset:(int64_t)a3 length:(int64_t)a4;
- (id)inputStream;
- (id)inputStreamWithOffset:(int64_t)a3 length:(int64_t)a4;
- (id)path;
- (int64_t)dataLength;
- (void)dealloc;
@end

@implementation SFUZipArchiveFileDataRepresentation

- (SFUZipArchiveFileDataRepresentation)initWithPath:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SFUZipArchiveFileDataRepresentation;
  v4 = [(SFUZipArchiveFileDataRepresentation *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->mFd = -1;
    int v6 = SFUOpen(a3, 0, 0);
    v5->mFd = v6;
    if (v6 == -1 || pread(v6, 0, 0, 0) == -1) {
      v7 = [[SFUFileDataRepresentation alloc] initWithPath:a3];
    }
    else {
      v7 = [[SFUFileDataRepresentation alloc] initWithPath:a3 sharedFileDescriptor:v5->mFd];
    }
    v5->mFileRepresentation = v7;
  }
  return v5;
}

- (void)dealloc
{
  int mFd = self->mFd;
  if (mFd != -1 && close(mFd))
  {
    int v4 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD968);
    }
    v5 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100167E5C(&self->mFd, v4, v5);
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUZipArchiveFileDataRepresentation *)NSString dealloc], 50, 0, "close failed on fd = %d with errorno = %d"", self->mFd, *__error());
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v6.receiver = self;
  v6.super_class = (Class)SFUZipArchiveFileDataRepresentation;
  [(SFUZipArchiveFileDataRepresentation *)&v6 dealloc];
}

- (BOOL)isReadable
{
  return [(SFUFileDataRepresentation *)self->mFileRepresentation isReadable];
}

- (int64_t)dataLength
{
  return [(SFUFileDataRepresentation *)self->mFileRepresentation dataLength];
}

- (BOOL)isEncrypted
{
  return 0;
}

- (id)inputStream
{
  return [(SFUFileDataRepresentation *)self->mFileRepresentation inputStream];
}

- (BOOL)hasSameLocationAs:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a3 = (id)*((void *)a3 + 4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  if (!a3) {
    return 0;
  }
  id v5 = [(SFUFileDataRepresentation *)self->mFileRepresentation path];
  id v6 = [a3 path];
  return [v5 isEqualToString:v6];
}

- (id)path
{
  return [(SFUFileDataRepresentation *)self->mFileRepresentation path];
}

- (id)inputStreamWithOffset:(int64_t)a3 length:(int64_t)a4
{
  int64_t v7 = [(SFUFileDataRepresentation *)self->mFileRepresentation dataLength];
  if ((a4 | a3) < 0 || (v7 >= a4 ? (BOOL v8 = v7 - a4 < a3) : (BOOL v8 = 1), v8)) {
    +[NSException raise:NSInvalidArgumentException format:@"Bad input stream range."];
  }
  int mFd = self->mFd;
  if (mFd == -1 || pread(mFd, 0, 0, 0) == -1) {
    v10 = [[SFUFileInputStream alloc] initWithPath:[(SFUFileDataRepresentation *)self->mFileRepresentation path] offset:a3 length:a4];
  }
  else {
    v10 = [[SFUFileInputStream alloc] initWithFileDescriptor:SFUDup(self->mFd) offset:a3 length:a4];
  }
  return v10;
}

- (id)bufferedInputStreamWithOffset:(int64_t)a3 length:(int64_t)a4
{
  int v4 = -[SFUBufferedInputStream initWithStream:dataLength:]([SFUBufferedInputStream alloc], "initWithStream:dataLength:", -[SFUZipArchiveFileDataRepresentation inputStreamWithOffset:length:](self, "inputStreamWithOffset:length:", a3), a4);
  return v4;
}

@end