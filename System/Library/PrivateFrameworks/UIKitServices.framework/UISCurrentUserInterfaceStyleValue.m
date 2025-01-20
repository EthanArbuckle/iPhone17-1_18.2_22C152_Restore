@interface UISCurrentUserInterfaceStyleValue
- (UISCurrentUserInterfaceStyleValue)init;
- (UISCurrentUserInterfaceStyleValue)initWithChangesDeliveredOnQueue:(id)a3 toBlock:(id)a4;
- (int64_t)userInterfaceStyle;
- (void)dealloc;
@end

@implementation UISCurrentUserInterfaceStyleValue

- (UISCurrentUserInterfaceStyleValue)init
{
  return [(UISCurrentUserInterfaceStyleValue *)self initWithChangesDeliveredOnQueue:0 toBlock:0];
}

- (UISCurrentUserInterfaceStyleValue)initWithChangesDeliveredOnQueue:(id)a3 toBlock:(id)a4
{
  v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UISCurrentUserInterfaceStyleValue;
  v8 = [(UISCurrentUserInterfaceStyleValue *)&v16 init];
  v9 = v8;
  if (v8)
  {
    v8->_notificationToken = -1;
    if (v7)
    {
      if (!v6)
      {
        v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v6 = dispatch_queue_create("UISCurrentUserInterfaceStyleValue", v10);
      }
      objc_initWeak(&location, v9);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __77__UISCurrentUserInterfaceStyleValue_initWithChangesDeliveredOnQueue_toBlock___block_invoke;
      handler[3] = &unk_1E5735780;
      objc_copyWeak(&v14, &location);
      id v13 = v7;
      notify_register_dispatch("com.apple.UIKit.SystemUIServiceUserInterfaceStyleNotification", &v9->_notificationToken, v6, handler);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      notify_register_check("com.apple.UIKit.SystemUIServiceUserInterfaceStyleNotification", &v8->_notificationToken);
    }
  }

  return v9;
}

uint64_t __77__UISCurrentUserInterfaceStyleValue_initWithChangesDeliveredOnQueue_toBlock___block_invoke(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 40))) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_notificationToken)) {
    notify_cancel(self->_notificationToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)UISCurrentUserInterfaceStyleValue;
  [(UISCurrentUserInterfaceStyleValue *)&v3 dealloc];
}

- (int64_t)userInterfaceStyle
{
  uint64_t state64 = 0;
  if (notify_get_state(self->_notificationToken, &state64)) {
    return 0;
  }
  int64_t result = state64;
  if (state64 - 1 >= 2) {
    return 0;
  }
  return result;
}

@end