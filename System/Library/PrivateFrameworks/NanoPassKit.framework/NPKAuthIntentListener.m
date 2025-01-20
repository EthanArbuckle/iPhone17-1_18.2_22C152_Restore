@interface NPKAuthIntentListener
- (NPKAuthIntentListener)init;
- (__IOHIDEventSystemClient)hidSystemClient;
- (void)_handleButtonEvent:(__IOHIDEvent *)a3;
- (void)_initializeHIDClient;
- (void)dealloc;
- (void)setHidSystemClient:(__IOHIDEventSystemClient *)a3;
@end

@implementation NPKAuthIntentListener

- (NPKAuthIntentListener)init
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v4 = dispatch_queue_create("NPSButtonListener", v3);
  v8.receiver = self;
  v8.super_class = (Class)NPKAuthIntentListener;
  v5 = [(NPKButtonListener *)&v8 initWithHandlerQueue:v4];
  v6 = v5;
  if (v5) {
    [(NPKAuthIntentListener *)v5 _initializeHIDClient];
  }

  return v6;
}

- (void)dealloc
{
  hidSystemClient = self->_hidSystemClient;
  if (hidSystemClient)
  {
    IOHIDEventSystemClientUnregisterEventBlock();
    dispatch_queue_t v4 = [(NPKButtonListener *)self handlerQueue];
    MEMORY[0x223C363B0](hidSystemClient, v4);

    CFRelease(hidSystemClient);
    self->_hidSystemClient = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NPKAuthIntentListener;
  [(NPKAuthIntentListener *)&v5 dealloc];
}

- (void)_initializeHIDClient
{
  v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    objc_super v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: initializing HID client", (uint8_t *)buf, 2u);
    }
  }
  uint64_t v6 = IOHIDEventSystemClientCreate();
  if (v6)
  {
    uint64_t v7 = v6;
    IOHIDEventSystemClientSetMatching();
    objc_super v8 = [(NPKButtonListener *)self handlerQueue];
    IOHIDEventSystemClientScheduleWithDispatchQueue();

    objc_initWeak(buf, self);
    objc_copyWeak(&v12, buf);
    IOHIDEventSystemClientRegisterEventBlock();
    [(NPKAuthIntentListener *)self setHidSystemClient:v7];
    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
  else
  {
    v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_ERROR, "Error: ButtonController:IOHIDEventSystemClientCreate create failed\n", (uint8_t *)buf, 2u);
      }
    }
  }
}

void __45__NPKAuthIntentListener__initializeHIDClient__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleButtonEvent:a5];
}

- (void)_handleButtonEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v5 = IOHIDEventGetIntegerValue();
  uint64_t v6 = IOHIDEventGetIntegerValue();
  if (IntegerValue == 12 && v5 == 442 && v6)
  {
    kdebug_trace();
    uint64_t v7 = [(NPKButtonListener *)self _handlerQueue_buttonHandler];
    if (v7)
    {
      id v8 = v7;
      v7[2](v7, 0);
      uint64_t v7 = (void (**)(void, void))v8;
    }
  }
}

- (__IOHIDEventSystemClient)hidSystemClient
{
  return self->_hidSystemClient;
}

- (void)setHidSystemClient:(__IOHIDEventSystemClient *)a3
{
  self->_hidSystemClient = a3;
}

@end