@interface PeripheralConnectionInfo
- (NSDate)date;
- (unint64_t)tryCount;
- (void)setDate:(id)a3;
- (void)setTryCount:(unint64_t)a3;
@end

@implementation PeripheralConnectionInfo

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)tryCount
{
  return self->_tryCount;
}

- (void)setTryCount:(unint64_t)a3
{
  self->_tryCount = a3;
}

- (void).cxx_destruct
{
}

@end