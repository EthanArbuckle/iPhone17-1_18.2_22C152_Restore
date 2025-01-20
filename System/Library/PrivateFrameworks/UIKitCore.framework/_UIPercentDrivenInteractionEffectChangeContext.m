@interface _UIPercentDrivenInteractionEffectChangeContext
- (BOOL)ended;
- (double)maximumProgress;
- (double)progress;
- (void)setEnded:(BOOL)a3;
- (void)setMaximumProgress:(double)a3;
- (void)setProgress:(double)a3;
@end

@implementation _UIPercentDrivenInteractionEffectChangeContext

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)maximumProgress
{
  return self->_maximumProgress;
}

- (void)setMaximumProgress:(double)a3
{
  self->_maximumProgress = a3;
}

- (BOOL)ended
{
  return self->_ended;
}

- (void)setEnded:(BOOL)a3
{
  self->_ended = a3;
}

@end