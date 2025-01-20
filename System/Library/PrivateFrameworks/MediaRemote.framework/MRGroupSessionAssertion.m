@interface MRGroupSessionAssertion
- (MRGroupSessionAssertion)initWithCancellationHandler:(id)a3;
- (id)handler;
- (void)cancel;
- (void)dealloc;
- (void)setHandler:(id)a3;
@end

@implementation MRGroupSessionAssertion

- (MRGroupSessionAssertion)initWithCancellationHandler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRGroupSessionAssertion;
  v5 = [(MRGroupSessionAssertion *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = MEMORY[0x1997190F0](v4);
    id handler = v6->_handler;
    v6->_id handler = (id)v7;
  }
  return v6;
}

- (void)dealloc
{
  [(MRGroupSessionAssertion *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)MRGroupSessionAssertion;
  [(MRGroupSessionAssertion *)&v3 dealloc];
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL cancelled = self->_cancelled;
  self->_BOOL cancelled = 1;
  os_unfair_lock_unlock(p_lock);
  if (!cancelled)
  {
    v5 = (void (*)(void))*((void *)self->_handler + 2);
    v5();
  }
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end