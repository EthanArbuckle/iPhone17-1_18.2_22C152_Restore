@interface _TUIRunLoopAssertion
- (_TUIRunLoopAssertion)initWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)onInvalidate:(id)a3;
@end

@implementation _TUIRunLoopAssertion

- (_TUIRunLoopAssertion)initWithCompletion:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_TUIRunLoopAssertion;
  v5 = [(_TUIRunLoopAssertion *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    id v7 = [v4 copy];
    id completion = v6->_completion;
    v6->_id completion = v7;
  }
  return v6;
}

- (void)dealloc
{
  [(_TUIRunLoopAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_TUIRunLoopAssertion;
  [(_TUIRunLoopAssertion *)&v3 dealloc];
}

- (void)onInvalidate:(id)a3
{
  v6 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_completion)
  {
    id v4 = [v6 copy];
    id onInvalidate = self->_onInvalidate;
    self->_id onInvalidate = v4;

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    if (v6)
    {
      v6[2]();
    }
  }
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = (void (**)(void))objc_retainBlock(self->_completion);
  id v4 = (void (**)(void))objc_retainBlock(self->_onInvalidate);
  id completion = self->_completion;
  self->_id completion = 0;

  id onInvalidate = self->_onInvalidate;
  self->_id onInvalidate = 0;

  os_unfair_lock_unlock(p_lock);
  if (v7) {
    v7[2](v7);
  }
  if (v4) {
    v4[2](v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onInvalidate, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end