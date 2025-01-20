@interface _WTTextRangeChunk
- (_NSRange)range;
- (_WTTextRangeChunk)initWithRange:(_NSRange)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation _WTTextRangeChunk

- (_WTTextRangeChunk)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v9.receiver = self;
  v9.super_class = (Class)_WTTextRangeChunk;
  v5 = [(_WTTextChunk *)&v9 init];
  v6 = v5;
  if (v5)
  {
    -[_WTTextRangeChunk setRange:](v5, "setRange:", location, length);
    v7 = v6;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  uint64_t v5 = [(_WTTextRangeChunk *)self range];
  objc_msgSend(v4, "setRange:", v5, v6);
  return v4;
}

- (_NSRange)range
{
  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

@end