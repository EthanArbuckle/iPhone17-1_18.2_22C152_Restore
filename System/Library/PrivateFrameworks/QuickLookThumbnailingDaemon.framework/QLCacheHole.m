@interface QLCacheHole
+ (id)holeWithLocation:(unint64_t)a3 length:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (QLCacheHole)initWithLocation:(unint64_t)a3 length:(unint64_t)a4;
- (_NSRange)range;
- (id)description;
- (unint64_t)length;
- (unint64_t)location;
- (void)setLength:(unint64_t)a3;
- (void)setLocation:(unint64_t)a3;
- (void)setLocation:(unint64_t)a3 length:(unint64_t)a4;
- (void)setRange:(_NSRange)a3;
@end

@implementation QLCacheHole

+ (id)holeWithLocation:(unint64_t)a3 length:(unint64_t)a4
{
  v4 = [[QLCacheHole alloc] initWithLocation:a3 length:a4];
  return v4;
}

- (QLCacheHole)initWithLocation:(unint64_t)a3 length:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)QLCacheHole;
  result = [(QLCacheHole *)&v7 init];
  result->_location = a3;
  result->_length = a4;
  return result;
}

- (void)setLocation:(unint64_t)a3 length:(unint64_t)a4
{
  self->_length = a4;
}

- (_NSRange)range
{
  NSUInteger length = self->_length;
  NSUInteger location = self->_location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  [(QLCacheHole *)self setLocation:a3.location];
  [(QLCacheHole *)self setLength:length];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %llu %llu>", objc_opt_class(), self->_location, self->_length];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (QLCacheHole *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (unint64_t v5 = [(QLCacheHole *)self location], v5 == [(QLCacheHole *)v4 location]))
    {
      unint64_t v6 = [(QLCacheHole *)self length];
      BOOL v7 = v6 == [(QLCacheHole *)v4 length];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)location
{
  return self->_location;
}

- (void)setLocation:(unint64_t)a3
{
  self->_NSUInteger location = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_NSUInteger length = a3;
}

@end