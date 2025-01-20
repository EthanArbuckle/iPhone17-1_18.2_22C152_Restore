@interface TFInterprocessNotificationCallback
- (NSString)notificationName;
- (TFInterprocessNotificationCallback)initWithNotificationName:(id)a3 callback:(id)a4;
- (id)callback;
- (void)dealloc;
- (void)setNotificationName:(id)a3;
@end

@implementation TFInterprocessNotificationCallback

- (TFInterprocessNotificationCallback)initWithNotificationName:(id)a3 callback:(id)a4
{
  v7 = (__CFString *)a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TFInterprocessNotificationCallback;
  v9 = [(TFInterprocessNotificationCallback *)&v14 init];
  if (v9)
  {
    v10 = _Block_copy(v8);
    id callback = v9->_callback;
    v9->_id callback = v10;

    objc_storeStrong((id *)&v9->_notificationName, a3);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)interprocessNotificationHandler, v7, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v9;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v4 = [(TFInterprocessNotificationCallback *)self notificationName];

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
  v5.receiver = self;
  v5.super_class = (Class)TFInterprocessNotificationCallback;
  [(TFInterprocessNotificationCallback *)&v5 dealloc];
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);

  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end