@interface _UIScrollViewAsyncScrollEventCompletionResult
- (BOOL)finishedDecelerating;
- (BOOL)handled;
- (double)lastUpdateTime;
- (double)updateTime;
- (void)setFinishedDecelerating:(BOOL)a3;
- (void)setHandled:(BOOL)a3;
- (void)setLastUpdateTime:(double)a3;
- (void)setUpdateTime:(double)a3;
@end

@implementation _UIScrollViewAsyncScrollEventCompletionResult

- (double)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void)setLastUpdateTime:(double)a3
{
  self->_lastUpdateTime = a3;
}

- (double)updateTime
{
  return self->_updateTime;
}

- (void)setUpdateTime:(double)a3
{
  self->_updateTime = a3;
}

- (BOOL)handled
{
  return self->_handled;
}

- (void)setHandled:(BOOL)a3
{
  self->_handled = a3;
}

- (BOOL)finishedDecelerating
{
  return self->_finishedDecelerating;
}

- (void)setFinishedDecelerating:(BOOL)a3
{
  self->_finishedDecelerating = a3;
}

@end