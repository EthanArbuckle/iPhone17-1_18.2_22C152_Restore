@interface UIWritingToolsCoordinatorAnimationParameters
- (UIWritingToolsCoordinatorAnimationParameters)initWithDelay:(double)a3 duration:(double)a4;
- (double)delay;
- (double)duration;
- (id)completionHandler;
- (id)progressHandler;
- (void)setCompletionHandler:(id)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation UIWritingToolsCoordinatorAnimationParameters

- (UIWritingToolsCoordinatorAnimationParameters)initWithDelay:(double)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIWritingToolsCoordinatorAnimationParameters;
  result = [(UIWritingToolsCoordinatorAnimationParameters *)&v7 init];
  if (result)
  {
    result->_delay = a3;
    result->_duration = a4;
  }
  return result;
}

- (double)delay
{
  return self->_delay;
}

- (double)duration
{
  return self->_duration;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

@end