@interface CBDRemoteDeviceDiscovery
- (CBDDeviceDiscoveryDelegate)delegate;
- (CBDRemoteDeviceDiscovery)init;
- (OS_dispatch_queue)dispatchQueue;
- (OS_remote_device_browser)browser;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setBrowser:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CBDRemoteDeviceDiscovery

- (CBDRemoteDeviceDiscovery)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBDRemoteDeviceDiscovery;
  v2 = [(CBDRemoteDeviceDiscovery *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.checkerboard.easyrider.browse", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)resume
{
  dispatch_queue_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DeviceDiscovery: start", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4 = [(CBDRemoteDeviceDiscovery *)self dispatchQueue];
  objc_copyWeak(&v6, buf);
  started = (void *)remote_device_start_browsing();
  -[CBDRemoteDeviceDiscovery setBrowser:](self, "setBrowser:", started, _NSConcreteStackBlock, 3221225472, sub_100004FF8, &unk_100010400, self);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)invalidate
{
  dispatch_queue_t v3 = [(CBDRemoteDeviceDiscovery *)self browser];

  if (v3)
  {
    v4 = [(CBDRemoteDeviceDiscovery *)self browser];
    remote_device_browser_cancel();

    [(CBDRemoteDeviceDiscovery *)self setBrowser:0];
  }
}

- (void)dealloc
{
  [(CBDRemoteDeviceDiscovery *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CBDRemoteDeviceDiscovery;
  [(CBDRemoteDeviceDiscovery *)&v3 dealloc];
}

- (CBDDeviceDiscoveryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CBDDeviceDiscoveryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_remote_device_browser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_browser, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end