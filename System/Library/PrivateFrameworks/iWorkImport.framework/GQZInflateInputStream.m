@interface GQZInflateInputStream
- (GQZInflateInputStream)initWithInput:(id)a3;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)dealloc;
- (void)readToOwnBuffer:(const char *)a3 size:(unint64_t *)a4;
@end

@implementation GQZInflateInputStream

- (GQZInflateInputStream)initWithInput:(id)a3
{
  v4 = [(GQZInflateInputStream *)self init];
  if (v4)
  {
    v5 = (GQZEntryInputStream *)a3;
    v4->mInput = v5;
    v4->mStream.zfree = 0;
    v4->mStream.opaque = 0;
    v4->mStream.zalloc = 0;
    [(GQZEntryInputStream *)v5 readToOwnBuffer:&v4->mStream size:&v4->mStream.avail_in];
    uint64_t v6 = inflateInit2_(&v4->mStream, -15, "1.2.12", 112);
    if (v6) {
      +[GQZException raise:@"GQZInflateError", @"inflateInit2() failed: %d", v6 format];
    }
  }
  return v4;
}

- (void)dealloc
{
  inflateEnd(&self->mStream);

  v3.receiver = self;
  v3.super_class = (Class)GQZInflateInputStream;
  [(GQZInflateInputStream *)&v3 dealloc];
}

- (void)readToOwnBuffer:(const char *)a3 size:(unint64_t *)a4
{
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  self->mStream.avail_out = a4;
  self->mStream.next_out = (Bytef *)a3;
  next_out = a3;
  if (a4)
  {
    p_mStream = &self->mStream;
    p_avail_in = &self->mStream.avail_in;
    while (1)
    {
      if (!*p_avail_in) {
        [(GQZEntryInputStream *)self->mInput readToOwnBuffer:p_mStream size:p_avail_in];
      }
      uint64_t v9 = inflate(p_mStream, 0);
      if (v9 >= 2) {
        break;
      }
      if (v9 || !self->mStream.avail_out) {
        goto LABEL_10;
      }
    }
    +[GQZException raise:@"GQZInflateError", @"inflate() failed: %d", v9 format];
LABEL_10:
    next_out = self->mStream.next_out;
  }
  return next_out - a3;
}

@end