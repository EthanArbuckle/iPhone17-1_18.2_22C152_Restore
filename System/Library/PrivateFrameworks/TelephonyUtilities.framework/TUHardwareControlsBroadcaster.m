@interface TUHardwareControlsBroadcaster
- (NSString)eventTypeToIgnore;
- (TUHardwareControlsBroadcaster)init;
- (void)dealloc;
- (void)longPressTimerFired:(id)a3;
- (void)setEventTypeToIgnore:(id)a3;
@end

@implementation TUHardwareControlsBroadcaster

- (TUHardwareControlsBroadcaster)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUHardwareControlsBroadcaster;
  v2 = [(TUHardwareControlsBroadcaster *)&v8 init];
  if (v2)
  {
    v3 = TUDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "TUHardwareControlsBroadcaster starting to listen for hardware controls.", v7, 2u);
    }

    v2->_hidEventSystemClientRef = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    CFRunLoopGetCurrent();
    IOHIDEventSystemClientScheduleWithRunLoop();
    IOHIDEventSystemClientRegisterEventCallback();
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:&unk_1EED245A0 forKey:@"DeviceUsage"];
    [v4 addObject:v5];
    IOHIDEventSystemClientSetMatchingMultiple();
  }
  return v2;
}

- (void)dealloc
{
  v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "TUHardwareControlsBroadcaster deallocating - stopping listening for hardware controls.", buf, 2u);
  }

  CFRunLoopGetCurrent();
  IOHIDEventSystemClientUnscheduleWithRunLoop();
  CFRelease(self->_hidEventSystemClientRef);
  v4.receiver = self;
  v4.super_class = (Class)TUHardwareControlsBroadcaster;
  [(TUHardwareControlsBroadcaster *)&v4 dealloc];
}

- (void)longPressTimerFired:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__TUHardwareControlsBroadcaster_longPressTimerFired___block_invoke;
  v6[3] = &unk_1E58E5C08;
  id v7 = v4;
  objc_super v8 = self;
  id v5 = v4;
  TUGuaranteeExecutionOnMainThreadAsync(v6);
}

void __53__TUHardwareControlsBroadcaster_longPressTimerFired___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [MEMORY[0x1E4F28EA0] notificationWithName:@"TUCarPlayHardwareControlEventNotification" object:0 userInfo:v2];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotification:v3];

  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    objc_super v8 = v3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "TUHardwareControlsBroadcaster long press timer fired, posting: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = [v2 valueForKey:@"kTUCarPlayHardwareControlButtonNameKey"];

  if (v6 == @"kTUCarPlayHardwareControlButtonWhiteTelephoneLongPress") {
    [*(id *)(a1 + 40) setEventTypeToIgnore:@"kTUCarPlayHardwareControlButtonWhiteTelephone"];
  }
  [*(id *)(a1 + 32) invalidate];
}

- (NSString)eventTypeToIgnore
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEventTypeToIgnore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end