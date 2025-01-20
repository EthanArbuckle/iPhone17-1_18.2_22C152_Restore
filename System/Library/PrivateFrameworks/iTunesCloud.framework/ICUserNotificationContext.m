@interface ICUserNotificationContext
- (__CFRunLoopSource)runLoopSourceRef;
- (id)completionHandler;
- (void)clearRunLoop;
- (void)setCompletionHandler:(id)a3;
- (void)setRunLoopSourceRef:(__CFRunLoopSource *)a3;
@end

@implementation ICUserNotificationContext

- (void).cxx_destruct
{
}

- (void)setRunLoopSourceRef:(__CFRunLoopSource *)a3
{
  self->_runLoopSourceRef = a3;
}

- (__CFRunLoopSource)runLoopSourceRef
{
  return self->_runLoopSourceRef;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)clearRunLoop
{
  runLoopSourceRef = self->_runLoopSourceRef;
  if (runLoopSourceRef)
  {
    CFRelease(runLoopSourceRef);
    self->_runLoopSourceRef = 0;
  }
}

@end