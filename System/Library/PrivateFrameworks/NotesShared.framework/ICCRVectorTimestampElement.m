@interface ICCRVectorTimestampElement
- (unint64_t)clock;
- (unint64_t)subclock;
- (void)setClock:(unint64_t)a3;
- (void)setSubclock:(unint64_t)a3;
@end

@implementation ICCRVectorTimestampElement

- (void)setClock:(unint64_t)a3
{
  self->_clock = a3;
}

- (unint64_t)clock
{
  return self->_clock;
}

- (unint64_t)subclock
{
  return self->_subclock;
}

- (void)setSubclock:(unint64_t)a3
{
  self->_subclock = a3;
}

@end