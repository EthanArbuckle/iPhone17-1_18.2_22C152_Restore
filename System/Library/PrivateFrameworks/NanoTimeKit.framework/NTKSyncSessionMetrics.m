@interface NTKSyncSessionMetrics
- (BOOL)didSucceed;
- (BOOL)isResetSync;
- (unint64_t)bytesSent;
- (unint64_t)changesSent;
- (void)setBytesSent:(unint64_t)a3;
- (void)setChangesSent:(unint64_t)a3;
- (void)setDidSucceed:(BOOL)a3;
- (void)setIsResetSync:(BOOL)a3;
@end

@implementation NTKSyncSessionMetrics

- (BOOL)isResetSync
{
  return self->_isResetSync;
}

- (void)setIsResetSync:(BOOL)a3
{
  self->_isResetSync = a3;
}

- (unint64_t)changesSent
{
  return self->_changesSent;
}

- (void)setChangesSent:(unint64_t)a3
{
  self->_changesSent = a3;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (void)setBytesSent:(unint64_t)a3
{
  self->_bytesSent = a3;
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

@end