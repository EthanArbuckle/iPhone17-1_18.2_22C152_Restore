@interface OISFUFileOutputStream
- (BOOL)canCreateInputStream;
- (BOOL)canSeek;
- (OISFUFileOutputStream)initWithPath:(id)a3;
- (id)closeLocalStream;
- (id)inputStream;
- (id)path;
- (int64_t)offset;
- (void)close;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3 whence:(int)a4;
- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4;
@end

@implementation OISFUFileOutputStream

- (OISFUFileOutputStream)initWithPath:(id)a3
{
  v4 = [(OISFUFileOutputStream *)self init];
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
  v4.super_class = (Class)OISFUFileOutputStream;
  [(OISFUFileOutputStream *)&v4 dealloc];
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
    uint64_t v8 = [NSString stringWithUTF8String:"-[OISFUFileOutputStream writeBuffer:size:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileOutputStream.m"], 55, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled];
    mFile = self->mFile;
  }
  if (fwrite(a3, 1uLL, a4, mFile) != a4)
  {
    v9 = (void *)MEMORY[0x263EFF940];
    objc_msgSend(v9, "sfu_errnoRaise:format:", @"SFUFileWriteError", @"Could not write");
  }
}

- (int64_t)offset
{
  mFile = self->mFile;
  if (!mFile)
  {
    uint64_t v4 = [NSString stringWithUTF8String:"-[OISFUFileOutputStream offset]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileOutputStream.m"], 60, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled];
    mFile = self->mFile;
  }
  off_t v5 = ftello(mFile);
  if (v5 == -1) {
    objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUFileTellError", @"Could not tell");
  }
  return v5;
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
    uint64_t v8 = [NSString stringWithUTF8String:"-[OISFUFileOutputStream seekToOffset:whence:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileOutputStream.m"], 70, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled];
    mFile = self->mFile;
  }
  if (fseeko(mFile, a3, a4))
  {
    v9 = (void *)MEMORY[0x263EFF940];
    objc_msgSend(v9, "sfu_errnoRaise:format:", @"SFUFileSeekError", @"Could not seek");
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