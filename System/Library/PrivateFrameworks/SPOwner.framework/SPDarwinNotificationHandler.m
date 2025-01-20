@interface SPDarwinNotificationHandler
- (SPDarwinNotificationHandler)initWithNotificationName:(id)a3 changeBlock:(id)a4;
- (int)notifyToken;
- (void)dealloc;
- (void)setNotifyToken:(int)a3;
@end

@implementation SPDarwinNotificationHandler

- (SPDarwinNotificationHandler)initWithNotificationName:(id)a3 changeBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SPDarwinNotificationHandler;
  v8 = [(SPDarwinNotificationHandler *)&v16 init];
  if (v8)
  {
    id v9 = v6;
    v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_get_global_queue(21, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__SPDarwinNotificationHandler_initWithNotificationName_changeBlock___block_invoke;
    v13[3] = &unk_1E601C2B0;
    id v14 = v9;
    id v15 = v7;
    notify_register_dispatch(v10, &v8->_notifyToken, v11, v13);
  }
  return v8;
}

void __68__SPDarwinNotificationHandler_initWithNotificationName_changeBlock___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __68__SPDarwinNotificationHandler_initWithNotificationName_changeBlock___block_invoke_2;
  v2[3] = &unk_1E601B828;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  _os_activity_initiate(&dword_1B2FD8000, "SPDarwinNotificationHandler: Calling changeBlock()", OS_ACTIVITY_FLAG_DEFAULT, v2);
}

uint64_t __68__SPDarwinNotificationHandler_initWithNotificationName_changeBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPDarwinNotificationHandler handling %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  notify_cancel([(SPDarwinNotificationHandler *)self notifyToken]);
  v3.receiver = self;
  v3.super_class = (Class)SPDarwinNotificationHandler;
  [(SPDarwinNotificationHandler *)&v3 dealloc];
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

@end