@interface TUNotifyObserver
- (BOOL)isObserving;
- (NSString)notificationName;
- (OS_dispatch_queue)queue;
- (TUNotifyObserver)initWithNotificationName:(id)a3 queue:(id)a4;
- (TUNotifyObserver)initWithNotificationName:(id)a3 queue:(id)a4 callback:(id)a5;
- (id)callback;
- (int)token;
- (os_unfair_lock_s)lock;
- (unint64_t)state;
- (void)_endObserving;
- (void)beginObserving;
- (void)dealloc;
- (void)endObserving;
- (void)setCallback:(id)a3;
- (void)setNotificationName:(id)a3;
- (void)setToken:(int)a3;
@end

@implementation TUNotifyObserver

- (TUNotifyObserver)initWithNotificationName:(id)a3 queue:(id)a4
{
  return [(TUNotifyObserver *)self initWithNotificationName:a3 queue:a4 callback:0];
}

- (TUNotifyObserver)initWithNotificationName:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TUNotifyObserver;
  v11 = [(TUNotifyObserver *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    uint64_t v13 = [v8 copy];
    notificationName = v12->_notificationName;
    v12->_notificationName = (NSString *)v13;

    objc_storeStrong((id *)&v12->_queue, a4);
    uint64_t v15 = [v10 copy];
    id callback = v12->_callback;
    v12->_id callback = (id)v15;
  }
  return v12;
}

- (void)dealloc
{
  [(TUNotifyObserver *)self _endObserving];
  v3.receiver = self;
  v3.super_class = (Class)TUNotifyObserver;
  [(TUNotifyObserver *)&v3 dealloc];
}

- (id)callback
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = _Block_copy(self->_callback);
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setCallback:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_callback != v6)
  {
    v4 = (void *)[v6 copy];
    id callback = self->_callback;
    self->_id callback = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isObserving
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(TUNotifyObserver *)v2 token] > 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t state64 = 0;
  notify_get_state([(TUNotifyObserver *)self token], &state64);
  uint64_t v4 = state64;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)beginObserving
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_initWeak(&location, self);
  id v4 = [(TUNotifyObserver *)self notificationName];
  v5 = (const char *)[v4 UTF8String];
  id v6 = [(TUNotifyObserver *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__TUNotifyObserver_beginObserving__block_invoke;
  v7[3] = &unk_1E58E5F18;
  objc_copyWeak(&v8, &location);
  notify_register_dispatch(v5, &self->_token, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  os_unfair_lock_unlock(p_lock);
}

void __34__TUNotifyObserver_beginObserving__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained callback];

  if (v1)
  {
    v2 = [WeakRetained callback];
    v2[2]();
  }
}

- (void)endObserving
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(TUNotifyObserver *)self _endObserving];

  os_unfair_lock_unlock(p_lock);
}

- (void)_endObserving
{
  notify_cancel([(TUNotifyObserver *)self token]);

  [(TUNotifyObserver *)self setToken:0];
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_callback, 0);
}

@end