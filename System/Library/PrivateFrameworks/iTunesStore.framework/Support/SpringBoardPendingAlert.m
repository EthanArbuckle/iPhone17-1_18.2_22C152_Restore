@interface SpringBoardPendingAlert
- (NSDictionary)options;
- (NSString)viewControllerName;
- (OS_dispatch_source)timeoutTimer;
- (id)completionBlock;
- (void)cancelTimeoutTimer;
- (void)dealloc;
- (void)setCompletionBlock:(id)a3;
- (void)setOptions:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setViewControllerName:(id)a3;
@end

@implementation SpringBoardPendingAlert

- (void)dealloc
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer) {
    dispatch_source_cancel((dispatch_source_t)timeoutTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)SpringBoardPendingAlert;
  [(SpringBoardPendingAlert *)&v4 dealloc];
}

- (void)cancelTimeoutTimer
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel((dispatch_source_t)timeoutTimer);
    objc_super v4 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (NSString)viewControllerName
{
  return self->_viewControllerName;
}

- (void)setViewControllerName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerName, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong(&self->_completionBlock, 0);
}

@end