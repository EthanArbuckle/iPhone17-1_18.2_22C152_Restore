@interface CLDaemonHealthClientAdapter
- (BOOL)valid;
- (void)setValid:(BOOL)a3;
@end

@implementation CLDaemonHealthClientAdapter

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end