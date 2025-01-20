@interface W5IOPowerSource
- (W5IOPowerSource)init;
- (double)estimatedTimeRemaining;
- (double)internalBatteryLevel;
- (id)lowBatteryCallback;
- (id)updatedPowerSourceCallback;
- (int)batteryWarningLevel;
- (int64_t)powerSourceType;
- (void)dealloc;
- (void)setLowBatteryCallback:(id)a3;
- (void)setUpdatedPowerSourceCallback:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation W5IOPowerSource

- (W5IOPowerSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)W5IOPowerSource;
  v2 = [(W5IOPowerSource *)&v5 init];
  if (v2
    && (v3 = dispatch_queue_create("com.apple.wifivelocityd.iops", 0), (v2->_queue = (OS_dispatch_queue *)v3) != 0))
  {
    dispatch_queue_set_specific(v3, &v2->_queue, (void *)1, 0);
  }
  else
  {

    return 0;
  }
  return v2;
}

- (void)setUpdatedPowerSourceCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedPowerSourceCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100036D14;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setLowBatteryCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_lowBatteryCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100036E10;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }

  v4.receiver = self;
  v4.super_class = (Class)W5IOPowerSource;
  [(W5IOPowerSource *)&v4 dealloc];
}

- (void)startEventMonitoring
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036F3C;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopEventMonitoring
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000374F8;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (double)internalBatteryLevel
{
  CFTypeRef v2 = IOPSCopyPowerSourcesInfo();
  if (!v2) {
    return 0.0;
  }
  v3 = v2;
  CFArrayRef v4 = IOPSCopyPowerSourcesList(v2);
  double v5 = 0.0;
  if (v4)
  {
    CFArrayRef v6 = v4;
    if (CFArrayGetCount(v4) && CFArrayGetCount(v6) >= 1)
    {
      CFIndex v7 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, v7);
        CFDictionaryRef v9 = IOPSGetPowerSourceDescription(v3, ValueAtIndex);
        if (v9)
        {
          CFDictionaryRef v10 = v9;
          Value = CFDictionaryGetValue(v9, @"Transport Type");
          if (Value)
          {
            if (CFEqual(Value, @"Internal")) {
              break;
            }
          }
        }
        if (CFArrayGetCount(v6) <= ++v7) {
          goto LABEL_12;
        }
      }
      int valuePtr = 0;
      CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(v10, @"Current Capacity");
      CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
      int v15 = 0;
      CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(v10, @"Max Capacity");
      CFNumberGetValue(v13, kCFNumberSInt32Type, &v15);
      double v5 = (double)valuePtr / (double)v15 * 100.0;
    }
LABEL_12:
    CFRelease(v3);
  }
  else
  {
    CFArrayRef v6 = (const __CFArray *)v3;
  }
  CFRelease(v6);
  return v5;
}

- (double)estimatedTimeRemaining
{
  uint64_t v6 = 0;
  CFIndex v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037764;
  block[3] = &unk_1000DD348;
  block[4] = &v6;
  dispatch_sync(queue, block);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)powerSourceType
{
  uint64_t v6 = 0;
  CFIndex v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003785C;
  block[3] = &unk_1000DD348;
  block[4] = &v6;
  dispatch_sync(queue, block);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)batteryWarningLevel
{
  uint64_t v6 = 0;
  CFIndex v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000379B0;
  block[3] = &unk_1000DD348;
  block[4] = &v6;
  dispatch_sync(queue, block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)updatedPowerSourceCallback
{
  return self->_updatedPowerSourceCallback;
}

- (id)lowBatteryCallback
{
  return self->_lowBatteryCallback;
}

@end