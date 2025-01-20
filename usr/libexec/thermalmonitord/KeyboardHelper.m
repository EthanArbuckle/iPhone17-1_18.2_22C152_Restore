@interface KeyboardHelper
- (BOOL)isKeyboardConnected;
- (BOOL)isR18xKeyboardAttached;
- (KeyboardHelper)init;
- (void)dealloc;
- (void)getInitialFolioState;
- (void)registerForFolioEvents;
- (void)registerForKeyboardEvents;
- (void)updateFolioState:(BOOL)a3;
- (void)updateKeyboardState;
- (void)updateSensorExchangeKey;
@end

@implementation KeyboardHelper

- (KeyboardHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)KeyboardHelper;
  v2 = [(KeyboardHelper *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_cachedIsKeyboardAttached = 0;
    v2->_cachedIsFolioAttached = 0;
    v2->_keyboardPortConnect = 0;
    v2->_keyboardPortDisconnect = 0;
    if (byte_1000AA7A4)
    {
      uint64_t v6 = 0;
      qword_1000AA770 = (uint64_t)+[CLPCPolicyInterface createClient:&v6];
      id v4 = (id)qword_1000AA770;
      if (v6)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_10005CA00();
        }
      }
    }
    if (byte_1000AB0E0)
    {
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:28 forSMCKey:@"zETM" atSMCIndex:28];
      dword_1000AAE50 = 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  RunLoopSource = IONotificationPortGetRunLoopSource(self->_keyboardPortConnect);
  id v4 = IONotificationPortGetRunLoopSource(self->_keyboardPortDisconnect);
  CFRunLoopRemoveSource((CFRunLoopRef)qword_1000AA790, RunLoopSource, kCFRunLoopDefaultMode);
  CFRunLoopRemoveSource((CFRunLoopRef)qword_1000AA790, v4, kCFRunLoopDefaultMode);
  IONotificationPortDestroy(self->_keyboardPortConnect);
  IONotificationPortDestroy(self->_keyboardPortDisconnect);
  v5.receiver = self;
  v5.super_class = (Class)KeyboardHelper;
  [(KeyboardHelper *)&v5 dealloc];
}

- (void)registerForKeyboardEvents
{
  kern_return_t v12;
  IONotificationPort *v13;
  CFDictionaryRef v14;
  io_iterator_t keyboardIteratorDisconnect;
  uint64_t vars8;

  self->_keyboardPortConnect = IONotificationPortCreate(kIOMainPortDefault);
  v3 = IONotificationPortCreate(kIOMainPortDefault);
  self->_keyboardPortDisconnect = v3;
  keyboardPortConnect = self->_keyboardPortConnect;
  if (keyboardPortConnect) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005CA68();
    }
  }
  else
  {
    RunLoopSource = IONotificationPortGetRunLoopSource(keyboardPortConnect);
    CFRunLoopSourceRef v7 = IONotificationPortGetRunLoopSource(self->_keyboardPortDisconnect);
    if (RunLoopSource) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005CA9C();
      }
    }
    else
    {
      v9 = v7;
      CFRunLoopAddSource((CFRunLoopRef)qword_1000AA790, RunLoopSource, kCFRunLoopDefaultMode);
      CFRunLoopAddSource((CFRunLoopRef)qword_1000AA790, v9, kCFRunLoopDefaultMode);
      v10 = self->_keyboardPortConnect;
      CFDictionaryRef v11 = IOServiceMatching("AppleHIDKeyboardEventDriverV2");
      v12 = IOServiceAddMatchingNotification(v10, "IOServiceFirstMatch", v11, (IOServiceMatchingCallback)sub_100051538, self, &self->_keyboardIteratorConnect);
      v13 = self->_keyboardPortConnect;
      v14 = IOServiceMatching("AppleHIDKeyboardEventDriverV2");
      if (!(v12 | IOServiceAddMatchingNotification(v13, "IOServiceTerminate", v14, (IOServiceMatchingCallback)sub_100051538, self, &self->_keyboardIteratorDisconnect)))
      {
        sub_100051538(self, self->_keyboardIteratorConnect);
        keyboardIteratorDisconnect = self->_keyboardIteratorDisconnect;
        sub_100051538(self, keyboardIteratorDisconnect);
      }
    }
  }
}

- (void)registerForFolioEvents
{
  self->_hidClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
  v18[0] = @"PrimaryUsagePage";
  v18[1] = @"PrimaryUsage";
  v19[0] = +[NSNumber numberWithInt:11];
  v19[1] = +[NSNumber numberWithInt:1];
  +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  IOHIDEventSystemClientSetMatching();
  IOHIDEventSystemClientRegisterEventCallback();
  IOHIDEventSystemClientScheduleWithRunLoop();
  hidClient = self->_hidClient;
  if (hidClient)
  {
    CFArrayRef v4 = IOHIDEventSystemClientCopyServices(hidClient);
    if (v4)
    {
      CFArrayRef v5 = v4;
      if (CFArrayGetCount(v4) >= 1)
      {
        int Count = CFArrayGetCount(v5);
        if (Count >= 1)
        {
          CFIndex v7 = 0;
          uint64_t v8 = Count;
          do
          {
            if (CFArrayGetValueAtIndex(v5, v7))
            {
              KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
              if (!KeyboardEvent)
              {
                v10 = qword_1000AABC0;
                if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
                  sub_10005CB44(&v16, v17, v10);
                }
              }
              uint64_t v11 = IOHIDServiceClientCopyEvent();
              if (v11)
              {
                v12 = (const void *)v11;
                [(KeyboardHelper *)self updateFolioState:IOHIDEventGetIntegerValue() != 0];
                CFRelease(v12);
              }
              else
              {
                v13 = qword_1000AABC0;
                if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
                  sub_10005CB04(&buf, v15, v13);
                }
              }
              CFRelease(KeyboardEvent);
            }
            ++v7;
          }
          while (v8 != v7);
        }
      }
      CFRelease(v5);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005CAD0();
    }
  }
}

- (void)updateKeyboardState
{
  BOOL v3 = [(KeyboardHelper *)self isKeyboardConnected];
  if (self->_cachedIsKeyboardAttached != v3)
  {
    self->_cachedIsKeyboardAttached = v3;
    if (v3) {
      [(KeyboardHelper *)self isR18xKeyboardAttached];
    }
    [(KeyboardHelper *)self updateSensorExchangeKey];
  }
}

- (BOOL)isR18xKeyboardAttached
{
  if (!self->_cachedIsKeyboardAttached) {
    goto LABEL_6;
  }
  unsigned int v2 = sub_100037CD4("AppleOrionManager", 0, 0);
  if (v2)
  {
    io_object_t v3 = v2;
    if (!sub_100037FB4(v2, @"IOAccessoryDigitalID", v5, (id)6) || (v5[4] & 1) == 0)
    {
      IOObjectRelease(v3);
LABEL_6:
      LOBYTE(v2) = 0;
      return v2;
    }
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (BOOL)isKeyboardConnected
{
  io_registry_entry_t v2 = sub_100037CD4("AppleHIDKeyboardEventDriverV2", 0, 0);
  io_registry_entry_t v3 = sub_100037CD4("IOAccessoryIDBusHIDDevice", 0, 0);
  if (v2)
  {
    BOOL v4 = sub_100038064(v2, @"RequiresCompassResetOnConnect");
    if (v3) {
      return v4 | sub_100038064(v3, @"RequiresCompassResetOnConnect");
    }
  }
  else
  {
    CFArrayRef v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005CBFC(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    BOOL v4 = 0;
    if (v3) {
      return v4 | sub_100038064(v3, @"RequiresCompassResetOnConnect");
    }
  }
  v13 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005CB84(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  return v4;
}

- (void)updateFolioState:(BOOL)a3
{
  if (self->_cachedIsFolioAttached != a3)
  {
    self->_cachedIsFolioAttached = a3;
    [(KeyboardHelper *)self updateSensorExchangeKey];
  }
}

- (void)updateSensorExchangeKey
{
  unsigned int v2 = self->_cachedIsKeyboardAttached | (2 * self->_cachedIsFolioAttached);
  if (byte_1000AA7A0)
  {
    io_registry_entry_t v3 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v4) = 67109376;
      HIDWORD(v4) = v2;
      __int16 v5 = 1024;
      int v6 = dword_1000AA778;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<Notice> KeyboardHelper updating SDTK - NewValue: %u PreviousValue: %u", (uint8_t *)&v4, 0xEu);
    }
  }
  if (dword_1000AA778 != v2)
  {
    dword_1000AA778 = v2;
    *(float *)&dword_1000AAE50 = (float)v2;
    uint64_t v4 = 0;
    switch(v2)
    {
      case 2u:
        if (qword_1000AA770)
        {
          [(id)qword_1000AA770 setDockMode:1 options:2 error:&v4];
          if (v4)
          {
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
              sub_10005CD44();
            }
          }
        }
        break;
      case 1u:
        if (qword_1000AA770)
        {
          [(id)qword_1000AA770 setDockMode:1 options:1 error:&v4];
          if (v4)
          {
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
              sub_10005CCDC();
            }
          }
        }
        break;
      case 0u:
        if (qword_1000AA770)
        {
          [(id)qword_1000AA770 setDockMode:0 options:0 error:&v4];
          if (v4)
          {
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
              sub_10005CC74();
            }
          }
        }
        break;
    }
  }
}

- (void)getInitialFolioState
{
  qword_1000AB168 = IOHIDEventSystemCreate();
  if (!qword_1000AB168 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005CDAC();
  }
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
  uint64_t v4 = IOHIDEventSystemCopyEvent();
  if (v4)
  {
    __int16 v5 = (const void *)v4;
    [(KeyboardHelper *)self updateFolioState:IOHIDEventGetIntegerValue() != 0];
    CFRelease(v5);
  }
  CFRelease(KeyboardEvent);
}

@end