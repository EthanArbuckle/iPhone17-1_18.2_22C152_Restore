@interface USBListener
- (BOOL)active;
- (BOOL)addDisconnectHandler:(id)a3;
- (BOOL)startOnQueue:(id)a3;
- (NSMutableArray)disconnectHandlers;
- (OS_os_log)log;
- (OS_remote_device_browser)browser;
- (USBListener)init;
- (void)dealloc;
- (void)dispatchDisconnectListeners;
- (void)setActive:(BOOL)a3;
- (void)setBrowser:(id)a3;
- (void)setDisconnectHandlers:(id)a3;
@end

@implementation USBListener

- (USBListener)init
{
  v11.receiver = self;
  v11.super_class = (Class)USBListener;
  v2 = [(USBListener *)&v11 init];
  v3 = v2;
  if (!v2)
  {
LABEL_6:

    return 0;
  }
  browser = v2->_browser;
  v2->_browser = 0;

  v3->_active = 0;
  os_log_t v5 = os_log_create("com.apple.dt.remotepairing", "usblistener");
  log = v3->_log;
  v3->_log = (OS_os_log *)v5;

  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  disconnectHandlers = v3->_disconnectHandlers;
  v3->_disconnectHandlers = v7;

  if (!v3->_disconnectHandlers)
  {
    v9 = [(USBListener *)v3 log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100072140();
    }

    goto LABEL_6;
  }
  return v3;
}

- (BOOL)startOnQueue:(id)a3
{
  id v4 = a3;
  os_log_t v5 = v4;
  if (!v4)
  {
    v9 = [(USBListener *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100072174();
    }
    goto LABEL_8;
  }
  id v11 = v4;
  started = (void *)remote_device_start_browsing();
  -[USBListener setBrowser:](self, "setBrowser:", started, _NSConcreteStackBlock, 3221225472, sub_100017A7C, &unk_10008AA30, self);

  v7 = [(USBListener *)self browser];

  if (!v7)
  {
    v9 = [(USBListener *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000721A8();
    }
LABEL_8:

    BOOL v8 = 0;
    goto LABEL_9;
  }
  BOOL v8 = 1;
  [(USBListener *)self setActive:1];
LABEL_9:

  return v8;
}

- (BOOL)addDisconnectHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_log_t v5 = [(USBListener *)self disconnectHandlers];
    objc_sync_enter(v5);
    v6 = [(USBListener *)self disconnectHandlers];
    id v7 = [v4 copy];
    id v8 = objc_retainBlock(v7);
    [v6 addObject:v8];

    objc_sync_exit(v5);
  }
  else
  {
    os_log_t v5 = [(USBListener *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100072174();
    }
  }

  return v4 != 0;
}

- (void)dispatchDisconnectListeners
{
  v3 = [(USBListener *)self disconnectHandlers];
  objc_sync_enter(v3);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(USBListener *)self disconnectHandlers];
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) + 16))();
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)dealloc
{
  self->_active = 0;
  remote_device_browser_cancel();
  v3.receiver = self;
  v3.super_class = (Class)USBListener;
  [(USBListener *)&v3 dealloc];
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (OS_remote_device_browser)browser
{
  return (OS_remote_device_browser *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBrowser:(id)a3
{
}

- (NSMutableArray)disconnectHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisconnectHandlers:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_disconnectHandlers, 0);

  objc_storeStrong((id *)&self->_browser, 0);
}

@end