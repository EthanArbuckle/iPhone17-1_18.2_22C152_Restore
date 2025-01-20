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
  id v5 = [a3 offset];
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
  id v3 = [(SFUInputStream *)self->mInputStream offset];
  int64_t mInitialOffset = self->mInitialOffset;
  if ((uint64_t)v3 < mInitialOffset)
  {
    int v5 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CC2E0);
    }
    v6 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100164E6C(v5, v6);
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUOffsetInputStream *)NSString offset], 42, 0, "SFUOffsetInputStream points before its offset"");
    +[TSUAssertionHandler logBacktraceThrottled];
    int64_t mInitialOffset = self->mInitialOffset;
  }
  return (int64_t)v3 - mInitialOffset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  return (unint64_t)[(SFUInputStream *)self->mInputStream readToBuffer:a3 size:a4];
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