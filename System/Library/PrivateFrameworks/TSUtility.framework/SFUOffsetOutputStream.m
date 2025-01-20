@interface SFUOffsetOutputStream
- (BOOL)canCreateInputStream;
- (BOOL)canSeek;
- (SFUOffsetOutputStream)initWithOutputStream:(id)a3;
- (id)closeLocalStream;
- (id)inputStream;
- (int64_t)offset;
- (void)close;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3 whence:(int)a4;
- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4;
@end

@implementation SFUOffsetOutputStream

- (SFUOffsetOutputStream)initWithOutputStream:(id)a3
{
  v4 = [(SFUOffsetOutputStream *)self init];
  if (v4)
  {
    v4->mOutputStream = (SFUOutputStream *)a3;
    v4->mInitialOffset = [a3 offset];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUOffsetOutputStream;
  [(SFUOffsetOutputStream *)&v3 dealloc];
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
}

- (BOOL)canSeek
{
  return [(SFUOutputStream *)self->mOutputStream canSeek];
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  if (!a4) {
    a3 += self->mInitialOffset;
  }
  -[SFUOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", a3);
}

- (int64_t)offset
{
  uint64_t v3 = [(SFUOutputStream *)self->mOutputStream offset];
  int64_t mInitialOffset = self->mInitialOffset;
  if (v3 < mInitialOffset)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[SFUOffsetOutputStream offset]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUOffsetOutputStream.m"), 59, @"SFUOffsetOutputStream points before its offset");
    int64_t mInitialOffset = self->mInitialOffset;
  }
  return v3 - mInitialOffset;
}

- (BOOL)canCreateInputStream
{
  return [(SFUOutputStream *)self->mOutputStream canCreateInputStream];
}

- (id)inputStream
{
  if (![(SFUOffsetOutputStream *)self canCreateInputStream]) {
    return 0;
  }
  uint64_t v3 = [[SFUOffsetInputStream alloc] initWithInputStream:[(SFUOutputStream *)self->mOutputStream inputStream] initialOffset:self->mInitialOffset];
  return v3;
}

- (void)close
{
}

- (id)closeLocalStream
{
  return self->mOutputStream;
}

@end