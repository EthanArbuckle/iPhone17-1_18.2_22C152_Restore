@interface SFAuthenticationStateChangesObserver
- (NSUUID)identifier;
- (OS_dispatch_queue)queue;
- (SFAuthenticationStateChangesObserver)initWithObserver:(id)a3 queue:(id)a4;
- (id)observer;
- (void)stateDidChange;
@end

@implementation SFAuthenticationStateChangesObserver

- (SFAuthenticationStateChangesObserver)initWithObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SFAuthenticationStateChangesObserver;
  v8 = [(SFAuthenticationStateChangesObserver *)&v14 init];
  if (v8)
  {
    v9 = _Block_copy(v6);
    id observer = v8->_observer;
    v8->_id observer = v9;

    objc_storeStrong((id *)&v8->_queue, a4);
    v11 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    identifier = v8->_identifier;
    v8->_identifier = v11;
  }
  return v8;
}

- (void)stateDidChange
{
  v3 = [(SFAuthenticationStateChangesObserver *)self observer];

  if (v3)
  {
    queue = [(SFAuthenticationStateChangesObserver *)self queue];
    v4 = [(SFAuthenticationStateChangesObserver *)self observer];
    dispatch_async(queue, v4);
  }
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)observer
{
  return self->_observer;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end