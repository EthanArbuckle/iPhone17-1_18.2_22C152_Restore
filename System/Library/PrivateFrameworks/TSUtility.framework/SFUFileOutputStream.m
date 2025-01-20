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
    id v8 = +[TSUAssertionHandler currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[SFUFileOutputStream writeBuffer:size:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileOutputStream.m"), 60, @"Using a closed stream");
    mFile = self->mFile;
  }
  if (fwrite(a3, 1uLL, a4, mFile) != a4)
  {
    v10 = (void *)MEMORY[0x263EFF940];
    [v10 errnoRaise:@"SFUFileWriteError" format:@"Could not write"];
  }
}

- (int64_t)offset
{
  mFile = self->mFile;
  if (!mFile)
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[SFUFileOutputStream offset]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileOutputStream.m"), 66, @"Using a closed stream");
    mFile = self->mFile;
  }
  off_t v6 = ftello(mFile);
  if (v6 == -1) {
    [MEMORY[0x263EFF940] errnoRaise:@"SFUFileTellError" format:@"Could not tell"];
  }
  return v6;
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
    id v8 = +[TSUAssertionHandler currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[SFUFileOutputStream seekToOffset:whence:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileOutputStream.m"), 78, @"Using a closed stream");
    mFile = self->mFile;
  }
  if (fseeko(mFile, a3, a4))
  {
    v10 = (void *)MEMORY[0x263EFF940];
    [v10 errnoRaise:@"SFUFileSeekError" format:@"Could not seek"];
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