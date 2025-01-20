@interface OISFUOffsetInputStream
- (BOOL)canSeek;
- (OISFUOffsetInputStream)initWithInputStream:(id)a3;
- (OISFUOffsetInputStream)initWithInputStream:(id)a3 initialOffset:(int64_t)a4;
- (id)closeLocalStream;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)disableSystemCaching;
- (void)enableSystemCaching;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation OISFUOffsetInputStream

- (OISFUOffsetInputStream)initWithInputStream:(id)a3
{
  uint64_t v5 = [a3 offset];
  return [(OISFUOffsetInputStream *)self initWithInputStream:a3 initialOffset:v5];
}

- (OISFUOffsetInputStream)initWithInputStream:(id)a3 initialOffset:(int64_t)a4
{
  v6 = [(OISFUOffsetInputStream *)self init];
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
  v3.super_class = (Class)OISFUOffsetInputStream;
  [(OISFUOffsetInputStream *)&v3 dealloc];
}

- (int64_t)offset
{
  uint64_t v3 = [(SFUInputStream *)self->mInputStream offset];
  int64_t mInitialOffset = self->mInitialOffset;
  if (v3 < mInitialOffset)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"-[OISFUOffsetInputStream offset]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUOffsetInputStream.m"], 42, 0, "SFUOffsetInputStream points before its offset");
    +[OITSUAssertionHandler logBacktraceThrottled];
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