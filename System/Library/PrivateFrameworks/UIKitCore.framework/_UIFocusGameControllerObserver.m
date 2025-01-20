@interface _UIFocusGameControllerObserver
- (BOOL)isActive;
- (_UIFocusGameControllerObserver)init;
- (void)_registerObserver;
- (void)_unregisterObserver;
- (void)dealloc;
@end

@implementation _UIFocusGameControllerObserver

- (_UIFocusGameControllerObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIFocusGameControllerObserver;
  v2 = [(_UIFocusStateObserver *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_UIFocusGameControllerObserver *)v2 _registerObserver];
  }
  return v3;
}

- (void)dealloc
{
  [(_UIFocusGameControllerObserver *)self _unregisterObserver];
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusGameControllerObserver;
  [(_UIFocusGameControllerObserver *)&v3 dealloc];
}

- (void)_registerObserver
{
  v13[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  v12[0] = @"DeviceUsagePage";
  v12[1] = @"DeviceUsage";
  v13[0] = &unk_1ED3F3918;
  v13[1] = &unk_1ED3F3930;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v11 = v4;
  CFArrayRef v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  IOHIDManagerSetDeviceMatchingMultiple(v3, v5);
  IOHIDManagerRegisterDeviceMatchingCallback(v3, (IOHIDDeviceCallback)deviceAddedCallback, self);
  IOHIDManagerRegisterDeviceRemovalCallback(v3, (IOHIDDeviceCallback)deviceRemovedCallback, self);
  Main = CFRunLoopGetMain();
  IOHIDManagerScheduleWithRunLoop(v3, Main, (CFStringRef)*MEMORY[0x1E4F1D418]);
  IOReturn v7 = IOHIDManagerOpen(v3, 0);
  if (v7)
  {
    IOReturn v8 = v7;
    v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("FocusSystem", &_registerObserver___s_category) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67240192;
      v10[1] = v8;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Unable to open HID manager to monitor for game controllers. Failed with error code (%{public}d).", (uint8_t *)v10, 8u);
    }
  }
  else
  {
    self->_hidManager = v3;
  }
}

- (void)_unregisterObserver
{
  hidManager = self->_hidManager;
  if (hidManager)
  {
    IOHIDManagerClose(hidManager, 0);
    CFRelease(self->_hidManager);
    self->_hidManager = 0;
  }
}

- (BOOL)isActive
{
  hidManager = self->_hidManager;
  if (!hidManager) {
    return 0;
  }
  CFSetRef v3 = IOHIDManagerCopyDevices(hidManager);
  if (!v3) {
    return 0;
  }
  CFSetRef v4 = v3;
  BOOL v5 = CFSetGetCount(v3) > 0;
  CFRelease(v4);
  return v5;
}

@end