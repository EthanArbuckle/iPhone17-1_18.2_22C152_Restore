@interface ALSRecorder
+ (void)initialize;
- (CFTypeRef)sensorWriterDidStopMonitoring:(CFTypeRef *)result;
- (void)dealloc;
- (void)launchEventRunActivity:(id)a3;
- (void)sensorWriterWillStartMonitoring:(id)a3;
@end

@implementation ALSRecorder

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10002A9E0 = (uint64_t)os_log_create("com.apple.SensorKit", "SensorKitALSHelper");
  }
}

- (void)dealloc
{
  -[ALSRecorder sensorWriterDidStopMonitoring:]_0((CFTypeRef *)&self->super.isa);

  self->_sensorWriter = 0;
  self->_alsSenders = 0;
  objc_setProperty_nonatomic(self, v3, 0, 32);
  objc_setProperty_nonatomic(self, v4, 0, 40);
  v5.receiver = self;
  v5.super_class = (Class)ALSRecorder;
  [(ALSRecorder *)&v5 dealloc];
}

- (CFTypeRef)sensorWriterDidStopMonitoring:(CFTypeRef *)result
{
  if (result)
  {
    v1 = result;
    v2 = qword_10002A9E0;
    if (os_log_type_enabled((os_log_t)qword_10002A9E0, OS_LOG_TYPE_DEBUG))
    {
      v4[0] = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "stop recording", (uint8_t *)v4, 2u);
    }
    objc_sync_enter(v1);
    if (v1[3])
    {
      IOHIDEventSystemClientUnregisterEventCallback();
      IOHIDEventSystemClientUnscheduleFromDispatchQueue();
      CFRelease(v1[3]);
      v1[3] = 0;
    }
    objc_sync_exit(v1);
    SEL v3 = (void *)v1[5];
    CFStringRef v5 = @"com.apple.sensorkit.launchAlsRecorder";
    return (CFTypeRef *)[v3 unregisterForXPCActivities:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1)];
  }
  return result;
}

- (void)sensorWriterWillStartMonitoring:(id)a3
{
  if (self)
  {
    SEL v4 = qword_10002A9E0;
    if (os_log_type_enabled((os_log_t)qword_10002A9E0, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(keys[0]) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "start recording", (uint8_t *)keys, 2u);
    }
    objc_sync_enter(self);
    if (!self->_client)
    {
      CFStringRef v5 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
      self->_client = v5;
      if (v5)
      {
        int v14 = 4;
        int valuePtr = 65280;
        CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
        CFNumberRef v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v14);
        *(_OWORD *)keys = *(_OWORD *)&off_1000249B8;
        values[0] = v6;
        values[1] = v7;
        CFDictionaryRef v8 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFRelease(v6);
        CFRelease(v7);
        Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
        CFArrayAppendValue(Mutable, v8);
        CFRelease(v8);
        v12 = Mutable;
        v13 = @"DeviceUsagePairs";
        CFDictionaryRef v10 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&v13, (const void **)&v12, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFRelease(Mutable);
        IOHIDEventSystemClientSetMatching();
        IOHIDEventSystemClientScheduleWithDispatchQueue();
        IOHIDEventSystemClientRegisterEventCallback();
        CFRelease(v10);
      }
    }
    objc_sync_exit(self);
    launchEvents = self->_launchEvents;
    keys[0] = @"com.apple.sensorkit.launchAlsRecorder";
    [(RDLaunchEvents *)launchEvents registerForXPCActivities:+[NSArray arrayWithObjects:keys count:1]];
  }
}

- (void)launchEventRunActivity:(id)a3
{
}

@end