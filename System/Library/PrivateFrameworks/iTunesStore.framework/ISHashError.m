@interface ISHashError
- (NSString)actualHashString;
- (NSString)expectedHashString;
- (NSString)hashFailureHeaderString;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)rangeEnd;
- (int64_t)rangeStart;
- (void)dealloc;
- (void)setActualHashString:(id)a3;
- (void)setExpectedHashString:(id)a3;
- (void)setRangeEnd:(int64_t)a3;
- (void)setRangeStart:(int64_t)a3;
@end

@implementation ISHashError

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISHashError;
  [(ISHashError *)&v3 dealloc];
}

- (NSString)hashFailureHeaderString
{
  return (NSString *)[NSString stringWithFormat:@"bytes=%lld-%lld,md5=%@", self->_rangeStart, self->_rangeEnd, self->_actualHashString];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(NSString *)self->_actualHashString copyWithZone:a3];
  v5[2] = [(NSString *)self->_expectedHashString copyWithZone:a3];
  v5[3] = self->_rangeEnd;
  v5[4] = self->_rangeStart;
  return v5;
}

- (NSString)actualHashString
{
  return self->_actualHashString;
}

- (void)setActualHashString:(id)a3
{
}

- (NSString)expectedHashString
{
  return self->_expectedHashString;
}

- (void)setExpectedHashString:(id)a3
{
}

- (int64_t)rangeEnd
{
  return self->_rangeEnd;
}

- (void)setRangeEnd:(int64_t)a3
{
  self->_rangeEnd = a3;
}

- (int64_t)rangeStart
{
  return self->_rangeStart;
}

- (void)setRangeStart:(int64_t)a3
{
  self->_rangeStart = a3;
}

@end