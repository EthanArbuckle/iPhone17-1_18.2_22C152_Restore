@interface _UIViewServiceReplyControlProxy
+ (id)proxyWithTarget:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (id)_awaitingReply;
- (id)_deliveringRepliesAsynchronously;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
@end

@implementation _UIViewServiceReplyControlProxy

+ (id)proxyWithTarget:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_UIViewServiceReplyControlProxy);
  id target = v4->_target;
  v4->_id target = v3;
  id v6 = v3;

  v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
  lock = v4->_lock;
  v4->_lock = v7;

  return v4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[self->_target methodSignatureForSelector:a3];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_target;
}

- (id)_awaitingReply
{
  [(NSLock *)self->_lock lock];
  if (!self->_awaitingTrampoline)
  {
    id v3 = +[_UITargetedProxy proxyWithTarget:self->_target];
    awaitingTrampoline = self->_awaitingTrampoline;
    self->_awaitingTrampoline = v3;
  }
  [(NSLock *)self->_lock unlock];
  v5 = self->_awaitingTrampoline;
  return v5;
}

- (id)_deliveringRepliesAsynchronously
{
  [(NSLock *)self->_lock lock];
  if (!self->_controlTrampoline)
  {
    id v3 = +[_UITargetedProxy proxyWithTarget:self->_target];
    controlTrampoline = self->_controlTrampoline;
    self->_controlTrampoline = v3;
  }
  [(NSLock *)self->_lock unlock];
  v5 = self->_controlTrampoline;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_awaitingTrampoline, 0);
  objc_storeStrong((id *)&self->_controlTrampoline, 0);
  objc_storeStrong(&self->_target, 0);
}

@end