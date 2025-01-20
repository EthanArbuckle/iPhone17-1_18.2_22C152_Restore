@interface OISFUMoveableFileOutputStream
- (BOOL)canCreateInputStream;
- (BOOL)canSeek;
- (BOOL)moveToPath:(id)a3;
- (OISFUMoveableFileOutputStream)initWithPath:(id)a3;
- (OISFUMoveableFileOutputStream)initWithTemporaryFile:(id)a3;
- (id)closeLocalStream;
- (id)inputStream;
- (id)path;
- (int64_t)offset;
- (void)close;
- (void)dealloc;
- (void)flush;
- (void)seekToOffset:(int64_t)a3 whence:(int)a4;
- (void)truncateToLength:(int64_t)a3;
- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4;
@end

@implementation OISFUMoveableFileOutputStream

- (OISFUMoveableFileOutputStream)initWithTemporaryFile:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)OISFUMoveableFileOutputStream;
  v4 = [(OISFUMoveableFileOutputStream *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->mFd = -1;
    uint64_t v6 = [a3 stringByAppendingString:@"XXXXXXXX"];
    v7 = [[(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:v6] UTF8String];
    v8 = strdup(v7);
    int v9 = mkstemp(v8);
    v5->mFd = v9;
    if (v9 == -1) {
      objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUMkstempError", @"Cannot create temporary file with template %@", v6);
    }
    v5->mPath = (NSString *)[[NSString alloc] initWithUTF8String:v8];
    free(v8);
  }
  return v5;
}

- (OISFUMoveableFileOutputStream)initWithPath:(id)a3
{
  v4 = [(OISFUMoveableFileOutputStream *)self init];
  v5 = v4;
  if (v4)
  {
    v4->mFd = -1;
    unlink((const char *)[a3 fileSystemRepresentation]);
    v5->mFd = SFUOpen(a3, 1537, 0x1B6u);
    v5->mPath = (NSString *)[a3 copy];
  }
  return v5;
}

- (void)dealloc
{
  int mFd = self->mFd;
  if (mFd != -1) {
    close(mFd);
  }

  v4.receiver = self;
  v4.super_class = (Class)OISFUMoveableFileOutputStream;
  [(OISFUMoveableFileOutputStream *)&v4 dealloc];
}

- (id)path
{
  return self->mPath;
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  int mFd = self->mFd;
  do
  {
    ssize_t v7 = write(mFd, a3, a4);
    if (v7 < 0) {
      objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUWriteError", @"Could not write");
    }
    a3 += v7;
    a4 -= v7;
  }
  while (a4);
}

- (int64_t)offset
{
  off_t v2 = lseek(self->mFd, 0, 1);
  if (v2 == -1) {
    objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUTellError", @"Could not tell");
  }
  return v2;
}

- (BOOL)canSeek
{
  return 1;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  if (lseek(self->mFd, a3, a4) == -1)
  {
    objc_super v4 = (void *)MEMORY[0x263EFF940];
    objc_msgSend(v4, "sfu_errnoRaise:format:", @"SFUSeekError", @"Could not seek");
  }
}

- (BOOL)moveToPath:(id)a3
{
  int mFd = self->mFd;
  if ((mFd & 0x80000000) == 0)
  {
    close(mFd);
    self->int mFd = -1;
  }
  int v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "moveItemAtPath:toPath:error:", self->mPath, a3, 0);
  if (v6)
  {
    ssize_t v7 = (NSString *)[a3 copy];

    self->mPath = v7;
    int v8 = SFUOpen(v7, 1, 0);
    self->int mFd = v8;
    if (lseek(v8, 0, 2) == -1) {
      objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUSeekError", @"Could not seek");
    }
  }
  return v6;
}

- (void)truncateToLength:(int64_t)a3
{
  [(OISFUMoveableFileOutputStream *)self seekToOffset:0 whence:2];
  if ([(OISFUMoveableFileOutputStream *)self offset] < a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"-[SFUMoveableFileOutputStream truncateToOffset:] does not allow expanding the file"];
  }
  [(OISFUMoveableFileOutputStream *)self seekToOffset:a3 whence:0];
  if (ftruncate(self->mFd, a3))
  {
    v5 = (void *)MEMORY[0x263EFF940];
    objc_msgSend(v5, "sfu_errnoRaise:format:", @"SFUTruncateError", @"Could not ftruncate.");
  }
}

- (void)flush
{
  if (fsync(self->mFd))
  {
    off_t v2 = (void *)MEMORY[0x263EFF940];
    objc_msgSend(v2, "sfu_errnoRaise:format:", @"SFUFlushError", @"Could not fsync.");
  }
}

- (BOOL)canCreateInputStream
{
  return 1;
}

- (id)inputStream
{
  [(OISFUMoveableFileOutputStream *)self flush];
  int64_t v3 = [(OISFUMoveableFileOutputStream *)self offset];
  [(OISFUMoveableFileOutputStream *)self seekToOffset:0 whence:2];
  int64_t v4 = [(OISFUMoveableFileOutputStream *)self offset];
  [(OISFUMoveableFileOutputStream *)self seekToOffset:v3 whence:0];
  v5 = [[OISFUFileInputStream alloc] initWithPath:self->mPath offset:0 length:v4];
  return v5;
}

- (void)close
{
  int mFd = self->mFd;
  if (mFd != -1)
  {
    close(mFd);
    self->int mFd = -1;
  }
}

- (id)closeLocalStream
{
  return 0;
}

@end