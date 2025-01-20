@interface MBConnectionManager
- (void)connection;
- (void)setConnection:(void *)a3;
@end

@implementation MBConnectionManager

- (void)connection
{
  return self->_connection;
}

- (void)setConnection:(void *)a3
{
  self->_connection = a3;
}

@end