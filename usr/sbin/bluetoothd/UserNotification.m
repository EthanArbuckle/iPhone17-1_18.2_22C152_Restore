@interface UserNotification
- (NSString)bundleID;
- (NSUUID)device;
- (UserNotification)initWithType:(int)a3 device:(id)a4 bundleID:(id)a5;
- (__CFRunLoopSource)runLoopSource;
- (__CFUserNotification)notification;
- (int)type;
- (void)dealloc;
- (void)setBundleID:(id)a3;
- (void)setDevice:(id)a3;
- (void)setNotification:(__CFUserNotification *)a3;
- (void)setRunLoopSource:(__CFRunLoopSource *)a3;
- (void)setType:(int)a3;
@end

@implementation UserNotification

- (UserNotification)initWithType:(int)a3 device:(id)a4 bundleID:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UserNotification;
  v11 = [(UserNotification *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_device, a4);
    objc_storeStrong((id *)&v12->_bundleID, a5);
    v12->_notification = 0;
    v12->_runLoopSource = 0;
  }

  return v12;
}

- (void)dealloc
{
  notification = self->_notification;
  if (notification)
  {
    CFUserNotificationCancel(notification);
    CFRelease(self->_notification);
  }
  if (self->_runLoopSource)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_runLoopSource, kCFRunLoopDefaultMode);
    CFRelease(self->_runLoopSource);
  }
  v5.receiver = self;
  v5.super_class = (Class)UserNotification;
  [(UserNotification *)&v5 dealloc];
}

- (__CFUserNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(__CFUserNotification *)a3
{
  notification = self->_notification;
  if (a3) {
    objc_super v5 = (__CFUserNotification *)CFRetain(a3);
  }
  else {
    objc_super v5 = 0;
  }
  self->_notification = v5;
  if (notification)
  {
    CFUserNotificationCancel(notification);
    CFRelease(notification);
  }
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  runLoopSource = self->_runLoopSource;
  if (a3) {
    v6 = (__CFRunLoopSource *)CFRetain(a3);
  }
  else {
    v6 = 0;
  }
  self->_runLoopSource = v6;
  if (runLoopSource)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, runLoopSource, kCFRunLoopDefaultMode);
    CFRelease(runLoopSource);
  }
  if (a3)
  {
    v8 = CFRunLoopGetMain();
    CFRunLoopAddSource(v8, a3, kCFRunLoopDefaultMode);
  }
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBundleID:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSUUID)device
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end