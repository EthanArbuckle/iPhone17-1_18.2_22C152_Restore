@interface _REActionInvocationData
- (BOOL)remote;
- (NSDate)date;
- (unint64_t)count;
- (void)setCount:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setRemote:(BOOL)a3;
@end

@implementation _REActionInvocationData

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (BOOL)remote
{
  return self->_remote;
}

- (void)setRemote:(BOOL)a3
{
  self->_remote = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
}

@end