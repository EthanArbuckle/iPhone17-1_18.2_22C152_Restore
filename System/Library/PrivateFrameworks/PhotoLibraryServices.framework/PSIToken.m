@interface PSIToken
- ($0AC6E346AE4835514AAA8AC86D8F4844)range;
- (BOOL)isEqual:(id)a3;
- (PSIToken)initWithString:(__CFString *)a3 range:(id)a4;
- (__CFString)string;
- (unint64_t)hash;
- (void)dealloc;
- (void)setRange:(id)a3;
- (void)setString:(__CFString *)a3;
@end

@implementation PSIToken

- (void)setRange:(id)a3
{
  self->_range = ($5CFEE62CA76FAE445C6F9DBCEE669C70)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)range
{
  int64_t length = self->_range.length;
  int64_t location = self->_range.location;
  result.var1 = length;
  result.var0 = location;
  return result;
}

- (void)setString:(__CFString *)a3
{
}

- (__CFString)string
{
  return self->_string;
}

- (void)dealloc
{
  [(PSIToken *)self setString:0];
  v3.receiver = self;
  v3.super_class = (Class)PSIToken;
  [(PSIToken *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int64_t location = self->_range.location;
  if (location == [v4 range])
  {
    int64_t length = self->_range.length;
    [v4 range];
    BOOL v8 = length == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return CFHash(self->_string);
}

- (PSIToken)initWithString:(__CFString *)a3 range:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  v9.receiver = self;
  v9.super_class = (Class)PSIToken;
  uint64_t v7 = [(PSIToken *)&v9 init];
  if (v7)
  {
    v7->_string = (__CFString *)CFRetain(a3);
    v7->_range.int64_t location = var0;
    v7->_range.int64_t length = var1;
  }
  return v7;
}

@end