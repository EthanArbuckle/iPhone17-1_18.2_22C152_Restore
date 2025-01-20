@interface NSData
- (id)supd_gzipDeflate;
@end

@implementation NSData

- (id)supd_gzipDeflate
{
  if ([(NSData *)self length])
  {
    memset(&v11.total_out, 0, 72);
    v3 = self;
    v11.avail_in = [(NSData *)v3 length];
    v4 = 0;
    if (!deflateInit2_(&v11, 9, 8, 31, 9, 0, "1.2.12", 112))
    {
      v5 = +[NSMutableData dataWithLength:0x4000];
      do
      {
        uLong total_out = v11.total_out;
        if (total_out >= (unint64_t)[v5 length]) {
          [v5 increaseLengthBy:0x4000];
        }
        id v7 = v5;
        v8 = (char *)[v7 mutableBytes];
        v11.next_out = (Bytef *)&v8[v11.total_out];
        unsigned int v9 = [v7 length];
        v11.avail_out = v9 - LODWORD(v11.total_out);
        deflate(&v11, 4);
      }
      while (!v11.avail_out);
      deflateEnd(&v11);
      [v7 setLength:v11.total_out];
      if (v11.avail_in)
      {
        v4 = 0;
      }
      else
      {
        v4 = +[NSData dataWithData:v7];
      }
    }
  }
  else
  {
    v4 = self;
  }

  return v4;
}

@end