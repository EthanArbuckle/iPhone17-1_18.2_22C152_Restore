@interface FCAssetHandleDownloadRequest
- (int64_t)relativePriority;
- (void)cancel;
- (void)setRelativePriority:(int64_t)a3;
@end

@implementation FCAssetHandleDownloadRequest

- (void)cancel
{
  if (self)
  {
    cancelHandler = (void (**)(void))self->_cancelHandler;
    if (cancelHandler) {
      cancelHandler[2]();
    }
  }
}

- (void)setRelativePriority:(int64_t)a3
{
  self->_relativePriority = a3;
  priorityHandler = (void (**)(void))self->_priorityHandler;
  if (priorityHandler) {
    priorityHandler[2]();
  }
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_priorityHandler, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
}

@end