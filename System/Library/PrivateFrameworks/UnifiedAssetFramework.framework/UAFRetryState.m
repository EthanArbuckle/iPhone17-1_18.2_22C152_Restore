@interface UAFRetryState
- (BOOL)cancelled;
- (BOOL)pending;
- (unsigned)retryCount;
- (void)setCancelled:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)setRetryCount:(unsigned int)a3;
@end

@implementation UAFRetryState

- (unsigned)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unsigned int)a3
{
  self->_retryCount = a3;
}

- (BOOL)pending
{
  return self->_pending;
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

@end