@interface MKHTTPRange
- (MKHTTPRange)initWithHeaderValue:(id)a3;
- (MKHTTPRange)initWithOffset:(unint64_t)a3 length:(unint64_t)a4;
- (unint64_t)length;
- (unint64_t)offset;
- (void)setLength:(unint64_t)a3;
- (void)setOffset:(unint64_t)a3;
@end

@implementation MKHTTPRange

- (MKHTTPRange)initWithHeaderValue:(id)a3
{
  v4 = [a3 componentsSeparatedByString:@"bytes="];
  if ([v4 count] == 2)
  {
    v5 = [v4 objectAtIndexedSubscript:1];
    v6 = [v5 componentsSeparatedByString:@"-"];

    if ([v6 count] == 2)
    {
      v7 = [v6 objectAtIndexedSubscript:0];
      v8 = [v6 objectAtIndexedSubscript:1];
      if ([v7 length]) {
        uint64_t v9 = [v7 longLongValue];
      }
      else {
        uint64_t v9 = 0;
      }
      if ([v8 length]) {
        uint64_t v10 = [v8 longLongValue] - v9;
      }
      else {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    v6 = v4;
  }

  return [(MKHTTPRange *)self initWithOffset:v9 length:v10];
}

- (MKHTTPRange)initWithOffset:(unint64_t)a3 length:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MKHTTPRange;
  v6 = [(MKHTTPRange *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(MKHTTPRange *)v6 setOffset:a3];
    [(MKHTTPRange *)v7 setLength:a4];
  }
  return v7;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

@end