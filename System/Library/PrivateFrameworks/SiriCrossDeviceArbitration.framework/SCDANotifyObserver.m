@interface SCDANotifyObserver
- (NSString)name;
- (SCDANotifyObserver)initWithName:(id)a3 options:(unint64_t)a4 queue:(id)a5 delegate:(id)a6;
- (id)description;
- (unint64_t)state;
- (void)_handleNotificationWithToken:(int)a3;
- (void)_invalidate;
- (void)_updateStateWithToken:(int)a3;
- (void)dealloc;
- (void)getStateWithCompletion:(id)a3;
- (void)invalidate;
@end

@implementation SCDANotifyObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)_invalidate
{
  int registrationToken = self->_registrationToken;
  if (registrationToken != -1)
  {
    notify_cancel(registrationToken);
    self->_int registrationToken = -1;
  }
  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)_updateStateWithToken:(int)a3
{
  uint64_t state64 = 0;
  if (a3 != -1 && !notify_get_state(a3, &state64)
    || (int registrationToken = self->_registrationToken, registrationToken != -1)
    && !notify_get_state(registrationToken, &state64))
  {
    unint64_t state = self->_state;
    uint64_t v6 = state64;
    if (state != state64)
    {
      self->_unint64_t state = state64;
      if ((*(unsigned char *)&self->_flags & 2) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained notifyObserver:self didChangeStateFrom:state to:v6];
      }
    }
  }
}

- (void)_handleNotificationWithToken:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (*(unsigned char *)&self->_flags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained notifyObserver:self didReceiveNotificationWithToken:v3];
  }
  if (self->_options)
  {
    [(SCDANotifyObserver *)self _updateStateWithToken:v3];
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SCDANotifyObserver_invalidate__block_invoke;
  block[3] = &unk_2654B81C8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __32__SCDANotifyObserver_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)getStateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_options)
    {
      queue = self->_queue;
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __45__SCDANotifyObserver_getStateWithCompletion___block_invoke;
      v7[3] = &unk_2654B8100;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(queue, v7);
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

uint64_t __45__SCDANotifyObserver_getStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 40));
}

- (unint64_t)state
{
  unint64_t v2 = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  if (self->_options)
  {
    queue = self->_queue;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __27__SCDANotifyObserver_state__block_invoke;
    v5[3] = &unk_2654B81F0;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(queue, v5);
    unint64_t v2 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __27__SCDANotifyObserver_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (void)dealloc
{
  [(SCDANotifyObserver *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SCDANotifyObserver;
  [(SCDANotifyObserver *)&v3 dealloc];
}

- (SCDANotifyObserver)initWithName:(id)a3 options:(unint64_t)a4 queue:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SCDANotifyObserver;
  v13 = [(SCDANotifyObserver *)&v26 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v13->_options = a4;
    objc_storeStrong((id *)&v13->_queue, a5);
    id v16 = objc_storeWeak((id *)&v13->_delegate, v12);
    *(unsigned char *)&v13->_flags = *(unsigned char *)&v13->_flags & 0xFE | objc_opt_respondsToSelector() & 1;

    id WeakRetained = objc_loadWeakRetained((id *)&v13->_delegate);
    if (objc_opt_respondsToSelector()) {
      char v18 = 2;
    }
    else {
      char v18 = 0;
    }
    *(unsigned char *)&v13->_flags = *(unsigned char *)&v13->_flags & 0xFD | v18;

    objc_initWeak(&location, v13);
    queue = v13->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__SCDANotifyObserver_initWithName_options_queue_delegate___block_invoke;
    block[3] = &unk_2654B72C8;
    id v22 = v10;
    v23 = v13;
    objc_copyWeak(v24, &location);
    v24[1] = (id)a4;
    dispatch_async(queue, block);
    objc_destroyWeak(v24);

    objc_destroyWeak(&location);
  }

  return v13;
}

void __58__SCDANotifyObserver_initWithName_options_queue_delegate___block_invoke(uint64_t a1)
{
  int out_token = -1;
  unint64_t v2 = (const char *)[*(id *)(a1 + 32) UTF8String];
  objc_super v3 = *(NSObject **)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __58__SCDANotifyObserver_initWithName_options_queue_delegate___block_invoke_2;
  v7 = &unk_2654B72A0;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  if (!notify_register_dispatch(v2, &out_token, v3, &v4)) {
    *(_DWORD *)(*(void *)(a1 + 40) + 32) = out_token;
  }
  if (*(unsigned char *)(a1 + 56)) {
    objc_msgSend(*(id *)(a1 + 40), "_updateStateWithToken:", out_token, v4, v5, v6, v7);
  }
  objc_destroyWeak(&v8);
}

void __58__SCDANotifyObserver_initWithName_options_queue_delegate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleNotificationWithToken:a2];
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)SCDANotifyObserver;
  uint64_t v4 = [(SCDANotifyObserver *)&v7 description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@ {name = %@}", v4, self->_name];

  return v5;
}

@end