@interface WiFiUtil
- (BOOL)isDisabled;
- (WiFiUtil)init;
- (WiFiUtilDelegate)delegate;
- (void)dealloc;
- (void)deviceAttached:(__WiFiDeviceClient *)a3;
- (void)invalidate;
- (void)notifyDevicePowerChanged;
- (void)onQueueDeregisterDevices;
- (void)onQueueDeregisterManager;
- (void)onQueueInvalidate;
- (void)onQueueReEnumerateDevices;
- (void)onQueueRegisterDevices;
- (void)onQueueRegisterManager;
- (void)setDelegate:(id)a3;
@end

@implementation WiFiUtil

- (WiFiUtil)init
{
  v7.receiver = self;
  v7.super_class = (Class)WiFiUtil;
  v2 = [(WiFiUtil *)&v7 init];
  if (v2)
  {
    uint64_t v3 = WiFiManagerClientCreate();
    v2->_wifiClient = (__WiFiManagerClient *)v3;
    if (!v3)
    {
      sub_1000AE4B0(v9, "");
      sub_10024F040("Failed to create connection to wifi daemon", &__p);
      sub_10016A2C4((uint64_t)v9, (uint64_t)&__p, 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v10 < 0) {
        operator delete(v9[0]);
      }
      sub_1000D11E0((uint64_t)&v8);
    }
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.pipelined.wifiutil", 0);
    q = v2->_q;
    v2->_q = (OS_dispatch_queue *)v4;

    [(WiFiUtil *)v2 onQueueReEnumerateDevices];
    CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop();
  }
  return v2;
}

- (void)invalidate
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100372D2C;
  block[3] = &unk_1004527B8;
  block[4] = self;
  dispatch_async(q, block);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WiFiUtil;
  [(WiFiUtil *)&v2 dealloc];
}

- (void)onQueueInvalidate
{
  if (self->_wifiClient)
  {
    [(WiFiUtil *)self onQueueDeregisterManager];
    CFRelease(self->_wifiClient);
    self->_wifiClient = 0;
  }
}

- (void)onQueueRegisterDevices
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  objc_super v2 = self->_wifiDevices;
  uint64_t v3 = (char *)[(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        WiFiDeviceClientRegisterPowerCallback();
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = (char *)[(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)onQueueDeregisterDevices
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  objc_super v2 = self->_wifiDevices;
  uint64_t v3 = (char *)[(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        WiFiDeviceClientRegisterPowerCallback();
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = (char *)[(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)onQueueDeregisterManager
{
}

- (void)onQueueRegisterManager
{
}

- (BOOL)isDisabled
{
  return WiFiManagerClientGetPower() == 0;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  q = self->_q;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003730E8;
  v7[3] = &unk_100452830;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(q, v7);
}

- (void)deviceAttached:(__WiFiDeviceClient *)a3
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003731C4;
  block[3] = &unk_1004527B8;
  block[4] = self;
  dispatch_async(q, block);
}

- (void)onQueueReEnumerateDevices
{
  [(WiFiUtil *)self onQueueDeregisterDevices];
  uint64_t v3 = (NSArray *)WiFiManagerClientCopyDevices();
  wifiDevices = self->_wifiDevices;
  self->_wifiDevices = v3;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    [(WiFiUtil *)self onQueueRegisterDevices];
  }
}

- (void)notifyDevicePowerChanged
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003732AC;
  block[3] = &unk_1004527B8;
  block[4] = self;
  dispatch_async(q, block);
}

- (WiFiUtilDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WiFiUtilDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wifiDevices, 0);

  objc_storeStrong((id *)&self->_q, 0);
}

@end