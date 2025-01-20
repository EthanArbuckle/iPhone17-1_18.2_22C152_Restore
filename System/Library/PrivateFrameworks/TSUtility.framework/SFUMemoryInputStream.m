@interface SFUMemoryInputStream
- (BOOL)canSeek;
- (BOOL)seekWithinBufferToOffset:(int64_t)a3;
- (SFUMemoryInputStream)initWithData:(id)a3;
- (SFUMemoryInputStream)initWithData:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5;
- (id)closeLocalStream;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation SFUMemoryInputStream

- (SFUMemoryInputStream)initWithData:(id)a3
{
  uint64_t v5 = [a3 length];
  return [(SFUMemoryInputStream *)self initWithData:a3 offset:0 length:v5];
}

- (SFUMemoryInputStream)initWithData:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)SFUMemoryInputStream;
  v8 = [(SFUMemoryInputStream *)&v14 init];
  v9 = v8;
  if (v8)
  {
    if (a3)
    {
      unint64_t v10 = [a3 length];
      if (v10 < a5 || v10 - a5 < a4)
      {

        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Bad data range."];
      }
      v11 = (NSData *)a3;
      v9->mData = v11;
      uint64_t v12 = [(NSData *)v11 bytes];
      v9->mStart = (const char *)(v12 + a4);
      v9->mCurrent = (const char *)(v12 + a4);
      v9->mEnd = (const char *)(v12 + a4 + a5);
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUMemoryInputStream;
  [(SFUMemoryInputStream *)&v3 dealloc];
}

- (int64_t)offset
{
  return self->mCurrent - self->mStart;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  mCurrent = self->mCurrent;
  if (self->mEnd - mCurrent >= a4) {
    size_t v6 = a4;
  }
  else {
    size_t v6 = self->mEnd - mCurrent;
  }
  memcpy(a3, mCurrent, v6);
  self->mCurrent += v6;
  return v6;
}

- (BOOL)canSeek
{
  return 1;
}

- (void)seekToOffset:(int64_t)a3
{
  mEnd = self->mEnd;
  mStart = self->mStart;
  int64_t v5 = mEnd - mStart;
  size_t v6 = &mStart[a3];
  if (v5 >= a3) {
    mEnd = v6;
  }
  self->mCurrent = mEnd;
}

- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4
{
  mCurrent = self->mCurrent;
  unint64_t v5 = self->mEnd - mCurrent;
  if (v5 >= a4) {
    unint64_t v5 = a4;
  }
  *a3 = mCurrent;
  self->mCurrent += v5;
  return v5;
}

- (BOOL)seekWithinBufferToOffset:(int64_t)a3
{
  int64_t v4 = self->mEnd - self->mStart;
  if (v4 >= a3) {
    [(SFUMemoryInputStream *)self seekToOffset:a3];
  }
  return v4 >= a3;
}

- (id)closeLocalStream
{
  return 0;
}

@end