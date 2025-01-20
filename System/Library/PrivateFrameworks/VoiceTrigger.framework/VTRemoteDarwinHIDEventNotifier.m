@interface VTRemoteDarwinHIDEventNotifier
- (VTRemoteDarwinHIDEventNotifier)init;
- (__IOHIDManager)hidManager;
- (void)_registerHIDEventNotification;
- (void)setHidManager:(__IOHIDManager *)a3;
@end

@implementation VTRemoteDarwinHIDEventNotifier

- (void)setHidManager:(__IOHIDManager *)a3
{
  self->_hidManager = a3;
}

- (__IOHIDManager)hidManager
{
  return self->_hidManager;
}

- (void)_registerHIDEventNotification
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  self->_hidManager = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  Mutable = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t valuePtr = 65280;
  CFNumberRef v5 = CFNumberCreate(v3, kCFNumberLongType, &valuePtr);
  if (v5) {
    CFDictionarySetValue(Mutable, @"DeviceUsagePage", v5);
  }
  uint64_t valuePtr = 83;
  CFNumberRef v6 = CFNumberCreate(v3, kCFNumberLongType, &valuePtr);

  if (v6) {
    CFDictionarySetValue(Mutable, @"DeviceUsage", v6);
  }
  CFDictionarySetValue(Mutable, @"HIDRelayUSBInterface", @"SiriHIDDevice");
  IOHIDManagerRegisterDeviceMatchingCallback(self->_hidManager, (IOHIDDeviceCallback)__deviceCallback, (void *)1);
  IOHIDManagerRegisterDeviceRemovalCallback(self->_hidManager, (IOHIDDeviceCallback)__deviceCallback, 0);
  IOHIDManagerRegisterInputReportCallback(self->_hidManager, (IOHIDReportCallback)__deviceReportCallback, 0);
  hidManager = self->_hidManager;
  Main = CFRunLoopGetMain();
  IOHIDManagerScheduleWithRunLoop(hidManager, Main, (CFStringRef)*MEMORY[0x263EFFE88]);
  IOHIDManagerSetDeviceMatching(self->_hidManager, Mutable);
  IOHIDManagerOpen(self->_hidManager, 0);
}

- (VTRemoteDarwinHIDEventNotifier)init
{
  if (+[VTUtilities supportRemoteDarwinVoiceTrigger])
  {
    v5.receiver = self;
    v5.super_class = (Class)VTRemoteDarwinHIDEventNotifier;
    self = [(VTRemoteDarwinHIDEventNotifier *)&v5 init];
    CFAllocatorRef v3 = self;
  }
  else
  {
    CFAllocatorRef v3 = 0;
  }

  return v3;
}

@end