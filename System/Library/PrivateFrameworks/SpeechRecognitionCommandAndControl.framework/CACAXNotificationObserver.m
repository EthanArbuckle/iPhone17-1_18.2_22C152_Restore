@interface CACAXNotificationObserver
- (CACAXNotificationObserver)initWithNotifications:(id)a3;
- (CACAXNotificationObserverDelegate)delegate;
- (NSArray)notifications;
- (void)_didObserveNotification:(int)a3 notificationData:(void *)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CACAXNotificationObserver

- (CACAXNotificationObserver)initWithNotifications:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CACAXNotificationObserver;
  v5 = [(CACAXNotificationObserver *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__CACAXNotificationObserver_initWithNotifications___block_invoke;
    v8[3] = &unk_264D117C0;
    v9 = v5;
    id v10 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
  return v6;
}

void __51__CACAXNotificationObserver_initWithNotifications___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F21668] systemWideElement];
  AXError v3 = AXObserverCreate([v2 pid], (AXObserverCallback)_accessibilityNotificationCallback, (AXObserverRef *)(*(void *)(a1 + 32) + 8));

  if (v3)
  {
    id v4 = CACLogAccessibility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__CACAXNotificationObserver_initWithNotifications___block_invoke_cold_3(v3, v4);
    }
  }
  else
  {
    CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource(*(AXObserverRef *)(*(void *)(a1 + 32) + 8));
    if (RunLoopSource)
    {
      v6 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v6, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v4 = *(id *)(a1 + 40);
      uint64_t v8 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v4);
            }
            CFStringRef v12 = (const __CFString *)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "intValue", (void)v18);
            v13 = *(__AXObserver **)(*(void *)(a1 + 32) + 8);
            v14 = [MEMORY[0x263F21668] systemWideElement];
            v15 = [v14 uiElement];
            AXError v16 = AXObserverAddNotification(v13, (AXUIElementRef)[v15 axElement], v12, *(void **)(a1 + 32));

            if (v16)
            {
              v17 = CACLogAccessibility();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                __51__CACAXNotificationObserver_initWithNotifications___block_invoke_cold_2((int)v12, v16, v17);
              }

              goto LABEL_4;
            }
          }
          uint64_t v9 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      id v4 = CACLogAccessibility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __51__CACAXNotificationObserver_initWithNotifications___block_invoke_cold_1(v4);
      }
    }
  }
LABEL_4:
}

- (void)_didObserveNotification:(int)a3 notificationData:(void *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = [(CACAXNotificationObserver *)self delegate];
  [v7 observer:self didObserveNotification:v5 notificationData:a4];
}

- (CACAXNotificationObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACAXNotificationObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)notifications
{
  return self->_notifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__CACAXNotificationObserver_initWithNotifications___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_238377000, log, OS_LOG_TYPE_ERROR, "Unable to get observer run loop source", v1, 2u);
}

void __51__CACAXNotificationObserver_initWithNotifications___block_invoke_cold_2(int a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_238377000, log, OS_LOG_TYPE_ERROR, "Unable to register for notification %ld with error %d", (uint8_t *)&v3, 0x12u);
}

void __51__CACAXNotificationObserver_initWithNotifications___block_invoke_cold_3(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Error creating AXObserver: %ld", (uint8_t *)&v2, 0xCu);
}

@end