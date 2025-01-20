@interface OISFUZipArchiveFileDataRepresentation
- (BOOL)hasSameLocationAs:(id)a3;
- (BOOL)isEncrypted;
- (BOOL)isReadable;
- (OISFUZipArchiveFileDataRepresentation)initWithPath:(id)a3;
- (id)bufferedInputStreamWithOffset:(int64_t)a3 length:(int64_t)a4;
- (id)inputStream;
- (id)inputStreamWithOffset:(int64_t)a3 length:(int64_t)a4;
- (id)path;
- (int64_t)dataLength;
- (void)dealloc;
@end

@implementation OISFUZipArchiveFileDataRepresentation

- (OISFUZipArchiveFileDataRepresentation)initWithPath:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OISFUZipArchiveFileDataRepresentation;
  v4 = [(OISFUZipArchiveFileDataRepresentation *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->mFd = -1;
    int v6 = SFUOpen(a3, 0, 0);
    v5->mFd = v6;
    if (v6 == -1 || pread(v6, 0, 0, 0) == -1) {
      v7 = [[OISFUFileDataRepresentation alloc] initWithPath:a3];
    }
    else {
      v7 = [[OISFUFileDataRepresentation alloc] initWithPath:a3 sharedFileDescriptor:v5->mFd];
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
    uint64_t v4 = [NSString stringWithUTF8String:"-[OISFUZipArchiveFileDataRepresentation dealloc]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveFileDataRepresentation.m"], 50, 0, "close failed on fd = %d with errorno = %d", self->mFd, *__error());
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v5.receiver = self;
  v5.super_class = (Class)OISFUZipArchiveFileDataRepresentation;
  [(OISFUZipArchiveFileDataRepresentation *)&v5 dealloc];
}

- (BOOL)isReadable
{
  return [(OISFUFileDataRepresentation *)self->mFileRepresentation isReadable];
}

- (int64_t)dataLength
{
  return [(OISFUFileDataRepresentation *)self->mFileRepresentation dataLength];
}

- (BOOL)isEncrypted
{
  return 0;
}

- (id)inputStream
{
  return [(OISFUFileDataRepresentation *)self->mFileRepresentation inputStream];
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
  id v5 = [(OISFUFileDataRepresentation *)self->mFileRepresentation path];
  uint64_t v6 = [a3 path];
  return [v5 isEqualToString:v6];
}

- (id)path
{
  return [(OISFUFileDataRepresentation *)self->mFileRepresentation path];
}

- (id)inputStreamWithOffset:(int64_t)a3 length:(int64_t)a4
{
  int64_t v7 = [(OISFUFileDataRepresentation *)self->mFileRepresentation dataLength];
  if ((a4 | a3) < 0 || (v7 >= a4 ? (BOOL v8 = v7 - a4 < a3) : (BOOL v8 = 1), v8)) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Bad input stream range."];
  }
  int mFd = self->mFd;
  if (mFd == -1 || pread(mFd, 0, 0, 0) == -1) {
    v10 = [[OISFUFileInputStream alloc] initWithPath:[(OISFUFileDataRepresentation *)self->mFileRepresentation path] offset:a3 length:a4];
  }
  else {
    v10 = [[OISFUFileInputStream alloc] initWithFileDescriptor:SFUDup(self->mFd) offset:a3 length:a4];
  }
  return v10;
}

- (id)bufferedInputStreamWithOffset:(int64_t)a3 length:(int64_t)a4
{
  uint64_t v4 = -[OISFUBufferedInputStream initWithStream:dataLength:]([OISFUBufferedInputStream alloc], "initWithStream:dataLength:", -[OISFUZipArchiveFileDataRepresentation inputStreamWithOffset:length:](self, "inputStreamWithOffset:length:", a3), a4);
  return v4;
}

@end