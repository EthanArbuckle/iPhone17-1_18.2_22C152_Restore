@interface CLDaemonSpringTrackingClientAdapter
- (BOOL)valid;
- (void)setValid:(BOOL)a3;
@end

@implementation CLDaemonSpringTrackingClientAdapter

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end