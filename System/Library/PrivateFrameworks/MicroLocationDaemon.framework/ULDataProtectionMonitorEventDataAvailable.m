@interface ULDataProtectionMonitorEventDataAvailable
- (BOOL)dataAvailable;
- (void)setDataAvailable:(BOOL)a3;
@end

@implementation ULDataProtectionMonitorEventDataAvailable

- (BOOL)dataAvailable
{
  return self->_dataAvailable;
}

- (void)setDataAvailable:(BOOL)a3
{
  self->_dataAvailable = a3;
}

@end