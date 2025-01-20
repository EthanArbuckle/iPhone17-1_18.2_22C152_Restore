@interface ISMainThreadInvocationRecorder
- (BOOL)waitUntilDone;
- (void)invokeInvocation:(id)a3;
- (void)setWaitUntilDone:(BOOL)a3;
@end

@implementation ISMainThreadInvocationRecorder

- (void)invokeInvocation:(id)a3
{
  [a3 retainArguments];
  BOOL waitUntilDone = self->_waitUntilDone;

  [a3 performSelectorOnMainThread:sel_invoke withObject:0 waitUntilDone:waitUntilDone];
}

- (BOOL)waitUntilDone
{
  return self->_waitUntilDone;
}

- (void)setWaitUntilDone:(BOOL)a3
{
  self->_BOOL waitUntilDone = a3;
}

@end