@interface MusicDarwinNotificationObserver
- (MusicDarwinNotificationObserver)initWithNotificationName:(id)a3 handler:(id)a4;
- (void)darwinNotificationReceived;
- (void)dealloc;
@end

@implementation MusicDarwinNotificationObserver

- (MusicDarwinNotificationObserver)initWithNotificationName:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MusicDarwinNotificationObserver;
  id v8 = [(MusicDarwinNotificationObserver *)&v15 init];
  if (v8)
  {
    id v9 = [v6 copy];
    v10 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v9;

    id v11 = objc_retainBlock(v7);
    v12 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v11;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)sub_1002D4FE4, *((CFStringRef *)v8 + 1), v8, CFNotificationSuspensionBehaviorDrop);
  }

  return (MusicDarwinNotificationObserver *)v8;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)self->_notificationName, 0);
  v4.receiver = self;
  v4.super_class = (Class)MusicDarwinNotificationObserver;
  [(MusicDarwinNotificationObserver *)&v4 dealloc];
}

- (void)darwinNotificationReceived
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end