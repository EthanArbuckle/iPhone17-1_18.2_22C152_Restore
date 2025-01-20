@interface _UIDefaultsInterfaceStyleObserver
- (_UIDefaultsInterfaceStyleObserver)initWithNotificationName:(id)a3 darwinNotification:(const char *)a4;
- (void)_didChange;
- (void)dealloc;
- (void)observeUserDefaults:(id)a3 key:(id)a4;
@end

@implementation _UIDefaultsInterfaceStyleObserver

- (_UIDefaultsInterfaceStyleObserver)initWithNotificationName:(id)a3 darwinNotification:(const char *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIDefaultsInterfaceStyleObserver;
  v8 = [(_UIDefaultsInterfaceStyleObserver *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationName, a3);
    v9->_notifyToken = -1;
    if (a4)
    {
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __81___UIDefaultsInterfaceStyleObserver_initWithNotificationName_darwinNotification___block_invoke;
      handler[3] = &unk_1E52E5DD8;
      v12 = v9;
      notify_register_dispatch(a4, &v9->_notifyToken, MEMORY[0x1E4F14428], handler);
    }
  }

  return v9;
}

- (void)observeUserDefaults:(id)a3 key:(id)a4
{
}

- (void)dealloc
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1) {
    notify_cancel(notifyToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIDefaultsInterfaceStyleObserver;
  [(_UIDefaultsInterfaceStyleObserver *)&v4 dealloc];
}

- (void)_didChange
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:self->_notificationName object:0];
}

- (void).cxx_destruct
{
}

@end