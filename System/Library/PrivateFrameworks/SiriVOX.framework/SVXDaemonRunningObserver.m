@interface SVXDaemonRunningObserver
- (BOOL)isRunning;
- (void)setIsRunning:(BOOL)a3;
@end

@implementation SVXDaemonRunningObserver

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

@end