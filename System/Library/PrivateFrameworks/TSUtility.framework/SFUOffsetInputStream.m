@interface SFUOffsetInputStream
- (BOOL)canSeek;
- (SFUOffsetInputStream)initWithInputStream:(id)a3;
- (SFUOffsetInputStream)initWithInputStream:(id)a3 initialOffset:(int64_t)a4;
- (id)closeLocalStream;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)disableSystemCaching;
- (void)enableSystemCaching;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation SFUOffsetInputStream

- (SFUOffsetInputStream)initWithInputStream:(id)a3
{
  uint64_t v5 = [a3 offset];
  return [(SFUOffsetInputStream *)self initWithInputStream:a3 initialOffset:v5];
}

- (SFUOffsetInputStream)initWithInputStream:(id)a3 initialOffset:(int64_t)a4
{
  v6 = [(SFUOffsetInputStream *)self init];
  if (v6)
  {
    v7 = (SFUInputStream *)a3;
    v6->mInputStream = v7;
    v6->mInitialOffset = a4;
    [(SFUInputStream *)v7 seekToOffset:a4];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUOffsetInputStream;
  [(SFUOffsetInputStream *)&v3 dealloc];
}

- (int64_t)offset
{
  uint64_t v3 = [(SFUInputStream *)self->mInputStream offset];
  int64_t mInitialOffset = self->mInitialOffset;
  if (v3 < mInitialOffset)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[SFUOffsetInputStream offset]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUOffsetInputStream.m"), 44, @"SFUOffsetInputStream points before its offset");
    int64_t mInitialOffset = self->mInitialOffset;
  }
  return v3 - mInitialOffset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  return [(SFUInputStream *)self->mInputStream readToBuffer:a3 size:a4];
}

- (BOOL)canSeek
{
  return [(SFUInputStream *)self->mInputStream canSeek];
}

- (void)seekToOffset:(int64_t)a3
{
}

- (void)disableSystemCaching
{
}

- (void)enableSystemCaching
{
}

- (void)close
{
}

- (id)closeLocalStream
{
  return self->mInputStream;
}

@end