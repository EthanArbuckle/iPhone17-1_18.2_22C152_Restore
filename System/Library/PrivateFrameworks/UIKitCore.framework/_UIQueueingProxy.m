@interface _UIQueueingProxy
+ (id)proxyWithTarget:(id)a3;
+ (id)proxyWithTarget:(id)a3 shouldSuspendInvocationBlock:(id)a4;
- (BOOL)bypassSuspensionForSynchronousReply;
- (BOOL)respondsToSelector:(SEL)a3;
- (id)description;
- (void)_dispatchSuspendedMessages;
- (void)forwardInvocation:(id)a3;
- (void)removeAllEnqueuedInvocations;
- (void)resume;
- (void)setBypassSuspensionForSynchronousReply:(BOOL)a3;
- (void)suspend;
@end

@implementation _UIQueueingProxy

+ (id)proxyWithTarget:(id)a3 shouldSuspendInvocationBlock:(id)a4
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS____UIQueueingProxy;
  id v5 = a4;
  v6 = objc_msgSendSuper2(&v12, sel_proxyWithTarget_, a3);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v12.receiver, v12.super_class);
  v8 = (void *)v6[4];
  v6[4] = v7;

  uint64_t v9 = [v5 copy];
  v10 = (void *)v6[5];
  v6[5] = v9;

  return v6;
}

+ (id)proxyWithTarget:(id)a3
{
  return (id)[a1 proxyWithTarget:a3 shouldSuspendInvocationBlock:0];
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_suspensionCount
    || ((shouldSuspendInvocationBlock = (uint64_t (**)(id, id))self->_shouldSuspendInvocationBlock) == 0
      ? (int v6 = 1)
      : (int v6 = shouldSuspendInvocationBlock[2](shouldSuspendInvocationBlock, v4)),
        !self->_bypassSuspension ? (BOOL v7 = v6 == 0) : (BOOL v7 = 1),
        v7))
  {
    os_unfair_lock_unlock(&self->_lock);
    v13.receiver = self;
    v13.super_class = (Class)_UIQueueingProxy;
    [(_UITargetedProxy *)&v13 forwardInvocation:v4];
  }
  else
  {
    [v4 retainArguments];
    [(NSMutableArray *)self->_queuedInvocations addObject:v4];
    os_unfair_lock_unlock(&self->_lock);
    id v8 = [v4 methodSignature];
    int v9 = strcmp((const char *)[v8 methodReturnType], "v");

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3C8];
      objc_super v12 = NSStringFromSelector((SEL)[v4 selector]);
      [v10 raise:v11, @"%@ can only handle messages which do not have a return value when it is suspended. (%@)", self, v12 format];
    }
  }
}

- (void)suspend
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_suspensionCount;
  os_unfair_lock_unlock(p_lock);
}

- (void)_dispatchSuspendedMessages
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableArray *)self->_queuedInvocations copy];
  [(NSMutableArray *)self->_queuedInvocations removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v11.receiver = self;
        v11.super_class = (Class)_UIQueueingProxy;
        [(_UITargetedProxy *)&v11 forwardInvocation:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)resume
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = self->_suspensionCount - 1;
  self->_suspensionCount = v4;
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    [(_UIQueueingProxy *)self _dispatchSuspendedMessages];
  }
}

- (BOOL)bypassSuspensionForSynchronousReply
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_bypassSuspension;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setBypassSuspensionForSynchronousReply:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_bypassSuspension = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllEnqueuedInvocations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_queuedInvocations removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v3 = [(_UITargetedProxy *)self _target];
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (id)description
{
  v3 = NSString;
  char v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(_UITargetedProxy *)self _target];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; target: %@; suspension count: %ld>",
    v5,
    self,
    v6,
  uint64_t v7 = self->_suspensionCount);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldSuspendInvocationBlock, 0);
  objc_storeStrong((id *)&self->_queuedInvocations, 0);
}

@end