@interface VUARPController
- (BOOL)isPaused;
- (VUARPController)init;
- (uarpPlatformRemoteEndpoint)uarpRemoteEndpoint;
- (void)delegate;
- (void)pauseDataTransfer;
- (void)resumeDataTransfer;
- (void)setDelegate:(void *)a3;
@end

@implementation VUARPController

- (VUARPController)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUARPController;
  return [(VUARPController *)&v3 init];
}

- (uarpPlatformRemoteEndpoint)uarpRemoteEndpoint
{
  return &self->_uarpControllerInternal;
}

- (BOOL)isPaused
{
  return self->_pausedInternal;
}

- (void)pauseDataTransfer
{
  self->_pausedInternal = 1;
}

- (void)resumeDataTransfer
{
  self->_pausedInternal = 0;
}

- (void)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(void *)a3
{
  self->_delegate = a3;
}

@end