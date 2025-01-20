@interface MFFetchLimits
- (MFFetchLimits)init;
- (id)description;
- (unint64_t)fetchMaxBytes;
- (unint64_t)fetchMinBytes;
- (unint64_t)minBytesLeft;
- (void)setFetchMaxBytes:(unint64_t)a3;
- (void)setFetchMinBytes:(unint64_t)a3;
- (void)setMinBytesLeft:(unint64_t)a3;
@end

@implementation MFFetchLimits

- (MFFetchLimits)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFFetchLimits;
  result = [(MFFetchLimits *)&v3 init];
  if (result)
  {
    *(int64x2_t *)&result->_fetchMinBytes = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    result->_minBytesLeft = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> min=%lu, max=%lu, remaining=%lu", objc_opt_class(), self, self->_fetchMinBytes, self->_fetchMaxBytes, self->_minBytesLeft];
}

- (unint64_t)fetchMinBytes
{
  return self->_fetchMinBytes;
}

- (void)setFetchMinBytes:(unint64_t)a3
{
  self->_fetchMinBytes = a3;
}

- (unint64_t)fetchMaxBytes
{
  return self->_fetchMaxBytes;
}

- (void)setFetchMaxBytes:(unint64_t)a3
{
  self->_fetchMaxBytes = a3;
}

- (unint64_t)minBytesLeft
{
  return self->_minBytesLeft;
}

- (void)setMinBytesLeft:(unint64_t)a3
{
  self->_minBytesLeft = a3;
}

@end