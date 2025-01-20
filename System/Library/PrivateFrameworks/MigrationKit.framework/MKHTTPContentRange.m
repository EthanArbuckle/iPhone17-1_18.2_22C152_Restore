@interface MKHTTPContentRange
- (MKHTTPContentRange)initWithHeaderValue:(id)a3;
- (MKHTTPContentRange)initWithOffset:(unint64_t)a3 length:(unint64_t)a4 total:(unint64_t)a5;
- (id)value;
- (unint64_t)length;
- (unint64_t)offset;
- (unint64_t)total;
- (void)setLength:(unint64_t)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setTotal:(unint64_t)a3;
@end

@implementation MKHTTPContentRange

- (MKHTTPContentRange)initWithHeaderValue:(id)a3
{
  v4 = [a3 componentsSeparatedByString:@"bytes"];
  if ([v4 count] == 2)
  {
    v5 = [v4 objectAtIndexedSubscript:1];
    v6 = [v5 componentsSeparatedByString:@"/"];

    if ([v6 count] == 2)
    {
      v7 = [v6 objectAtIndexedSubscript:1];
      uint64_t v8 = [v7 longLongValue];

      v9 = [v6 objectAtIndexedSubscript:0];
      v4 = [v9 componentsSeparatedByString:@"-"];

      if ([v4 count] == 2)
      {
        v10 = [v4 objectAtIndexedSubscript:0];
        uint64_t v11 = [v10 longLongValue];

        v12 = [v4 objectAtIndexedSubscript:1];
        uint64_t v13 = [v12 longLongValue];

        uint64_t v14 = v13 - v11 + 1;
      }
      else
      {
        uint64_t v11 = 0;
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v14 = 0;
      uint64_t v8 = 0;
      v4 = v6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v14 = 0;
    uint64_t v8 = 0;
  }

  return [(MKHTTPContentRange *)self initWithOffset:v11 length:v14 total:v8];
}

- (MKHTTPContentRange)initWithOffset:(unint64_t)a3 length:(unint64_t)a4 total:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MKHTTPContentRange;
  uint64_t v8 = [(MKHTTPContentRange *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MKHTTPContentRange *)v8 setOffset:a3];
    [(MKHTTPContentRange *)v9 setLength:a4];
    [(MKHTTPContentRange *)v9 setTotal:a5];
  }
  return v9;
}

- (id)value
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"bytes %lld-%lld/%lld", self->_offset, self->_length + self->_offset - 1, self->_total);
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

- (unint64_t)total
{
  return self->_total;
}

- (void)setTotal:(unint64_t)a3
{
  self->_total = a3;
}

@end