@interface XPCClientBackgroundTask
- (BKSProcessAssertion)processAssertion;
- (XPCClientBackgroundTask)initWithProcessAssertion:(id)a3 invalidationBlock:(id)a4;
- (id)invalidationBlock;
- (void)dealloc;
@end

@implementation XPCClientBackgroundTask

- (XPCClientBackgroundTask)initWithProcessAssertion:(id)a3 invalidationBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)XPCClientBackgroundTask;
  v9 = [(XPCClientBackgroundTask *)&v13 init];
  if (v9)
  {
    id v10 = [v8 copy];
    id invalidationBlock = v9->_invalidationBlock;
    v9->_id invalidationBlock = v10;

    objc_storeStrong((id *)&v9->_processAssertion, a3);
  }

  return v9;
}

- (void)dealloc
{
  [(BKSProcessAssertion *)self->_processAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)XPCClientBackgroundTask;
  [(XPCClientBackgroundTask *)&v3 dealloc];
}

- (id)invalidationBlock
{
  id v2 = objc_retainBlock(self->_invalidationBlock);

  return v2;
}

- (BKSProcessAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAssertion, 0);

  objc_storeStrong(&self->_invalidationBlock, 0);
}

@end