@interface SCDANotifyStatePublisher
- (BOOL)_getState:(unint64_t *)a3 withToken:(int)a4;
- (BOOL)_setState:(unint64_t)a3 withToken:(int)a4;
- (SCDANotifyStatePublisher)initWithName:(id)a3 queue:(id)a4;
- (void)_notifyWithState:(unint64_t)a3;
- (void)_register;
- (void)_unregister;
- (void)dealloc;
- (void)invalidate;
- (void)publishState:(unint64_t)a3;
- (void)publishStateWithBlock:(id)a3;
@end

@implementation SCDANotifyStatePublisher

- (void).cxx_destruct
{
}

- (void)_unregister
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int registrationToken = self->_registrationToken;
  if (registrationToken != -1)
  {
    notify_cancel(registrationToken);
    self->_int registrationToken = -1;
    v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      name = self->_name;
      int v6 = 136315394;
      v7 = "-[SCDANotifyStatePublisher _unregister]";
      __int16 v8 = 2080;
      v9 = name;
      _os_log_impl(&dword_25C707000, v4, OS_LOG_TYPE_INFO, "%s Registration token of %s is invalidated.", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_register
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_registrationToken == -1)
  {
    int out_token = -1;
    uint32_t v3 = notify_register_check(self->_name, &out_token);
    if (v3)
    {
      uint32_t v4 = v3;
      v5 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        name = self->_name;
        *(_DWORD *)buf = 136315650;
        v12 = "-[SCDANotifyStatePublisher _register]";
        __int16 v13 = 2080;
        v14 = name;
        __int16 v15 = 1024;
        int v16 = v4;
        _os_log_error_impl(&dword_25C707000, v5, OS_LOG_TYPE_ERROR, "%s Failed to get registration token of %s (status = %u).", buf, 0x1Cu);
      }
    }
    else
    {
      int v7 = out_token;
      self->_int registrationToken = out_token;
      __int16 v8 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v9 = self->_name;
        *(_DWORD *)buf = 136315650;
        v12 = "-[SCDANotifyStatePublisher _register]";
        __int16 v13 = 2080;
        v14 = v9;
        __int16 v15 = 1024;
        int v16 = v7;
        _os_log_impl(&dword_25C707000, v8, OS_LOG_TYPE_INFO, "%s Registration token of %s is %d.", buf, 0x1Cu);
      }
    }
  }
}

- (BOOL)_getState:(unint64_t *)a3 withToken:(int)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3)
  {
    *a3 = 0;
    uint64_t state64 = 0;
    uint32_t state = notify_get_state(a4, &state64);
    if (!state)
    {
      *a3 = state64;
LABEL_7:
      LOBYTE(v9) = 1;
      return v9;
    }
  }
  else
  {
    uint64_t state64 = 0;
    uint32_t state = notify_get_state(a4, &state64);
    if (!state) {
      goto LABEL_7;
    }
  }
  __int16 v8 = SCDALogContextCore;
  BOOL v9 = os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    name = self->_name;
    *(_DWORD *)buf = 136315906;
    v14 = "-[SCDANotifyStatePublisher _getState:withToken:]";
    __int16 v15 = 2080;
    int v16 = name;
    __int16 v17 = 1024;
    int v18 = a4;
    __int16 v19 = 1024;
    uint32_t v20 = state;
    _os_log_error_impl(&dword_25C707000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get state of %s with token %d (status = %u).", buf, 0x22u);
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)_setState:(unint64_t)a3 withToken:(int)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint32_t v7 = notify_set_state(a4, a3);
  if (v7)
  {
    __int16 v8 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      name = self->_name;
      int v11 = 136316162;
      v12 = "-[SCDANotifyStatePublisher _setState:withToken:]";
      __int16 v13 = 2048;
      unint64_t v14 = a3;
      __int16 v15 = 2080;
      int v16 = name;
      __int16 v17 = 1024;
      int v18 = a4;
      __int16 v19 = 1024;
      uint32_t v20 = v7;
      _os_log_error_impl(&dword_25C707000, v8, OS_LOG_TYPE_ERROR, "%s Failed to set state to %llu of %s with token %d (status = %u).", (uint8_t *)&v11, 0x2Cu);
    }
  }
  return v7 == 0;
}

- (void)_notifyWithState:(unint64_t)a3
{
  if (self->_registrationToken != -1
    && -[SCDANotifyStatePublisher _setState:withToken:](self, "_setState:withToken:", a3))
  {
    name = self->_name;
    notify_post(name);
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SCDANotifyStatePublisher_invalidate__block_invoke;
  block[3] = &unk_2654B81C8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__SCDANotifyStatePublisher_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregister];
}

- (void)publishStateWithBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__SCDANotifyStatePublisher_publishStateWithBlock___block_invoke;
    v7[3] = &unk_2654B8100;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

_DWORD *__50__SCDANotifyStatePublisher_publishStateWithBlock___block_invoke(uint64_t a1)
{
  result = *(_DWORD **)(a1 + 32);
  if (result[6] != -1)
  {
    uint32_t v3 = 0;
    result = (_DWORD *)objc_msgSend(result, "_getState:withToken:", &v3);
    if (result)
    {
      result = (_DWORD *)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      if (result != v3)
      {
        result = (_DWORD *)[*(id *)(a1 + 32) _setState:result withToken:*(unsigned int *)(*(void *)(a1 + 32) + 24)];
        if (result) {
          return (_DWORD *)notify_post(*(const char **)(*(void *)(a1 + 32) + 16));
        }
      }
    }
  }
  return result;
}

- (void)publishState:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__SCDANotifyStatePublisher_publishState___block_invoke;
  v4[3] = &unk_2654B7CA8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __41__SCDANotifyStatePublisher_publishState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyWithState:*(void *)(a1 + 40)];
}

- (SCDANotifyStatePublisher)initWithName:(id)a3 queue:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SCDANotifyStatePublisher;
  id v8 = [(SCDANotifyStatePublisher *)&v17 init];
  BOOL v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    size_t v10 = [v6 maximumLengthOfBytesUsingEncoding:4] + 1;
    int v11 = (char *)malloc_type_malloc(v10, 0x422A99F9uLL);
    v9->_name = v11;
    if (([v6 getCString:v11 maxLength:v10 encoding:4] & 1) == 0)
    {
      v12 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v19 = "-[SCDANotifyStatePublisher initWithName:queue:]";
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_error_impl(&dword_25C707000, v12, OS_LOG_TYPE_ERROR, "%s Unable to get C string of name from %@.", buf, 0x16u);
      }
    }
    v9->_int registrationToken = -1;
    queue = v9->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__SCDANotifyStatePublisher_initWithName_queue___block_invoke;
    block[3] = &unk_2654B81C8;
    int v16 = v9;
    dispatch_async(queue, block);
  }
  return v9;
}

uint64_t __47__SCDANotifyStatePublisher_initWithName_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _register];
}

- (void)dealloc
{
  [(SCDANotifyStatePublisher *)self _unregister];
  name = self->_name;
  if (name)
  {
    free(name);
    self->_name = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCDANotifyStatePublisher;
  [(SCDANotifyStatePublisher *)&v4 dealloc];
}

@end