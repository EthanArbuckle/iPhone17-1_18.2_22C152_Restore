@interface WiFiManager
+ (id)sharedWiFiManager;
- (NSString)IPAddress;
- (WiFiManager)init;
- (id)_wifiInterfaceName;
- (int)clientType;
- (int64_t)_wifiClientTypeForManagerType:(int)a3;
- (void)_wifiClient;
- (void)dealloc;
- (void)setClientType:(int)a3;
@end

@implementation WiFiManager

- (WiFiManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)WiFiManager;
  v2 = [(WiFiManager *)&v4 init];
  if (v2) {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.WiFiManager", 0);
  }
  return v2;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  wifiClient = self->_wifiClient;
  if (wifiClient) {
    CFRelease(wifiClient);
  }
  v5.receiver = self;
  v5.super_class = (Class)WiFiManager;
  [(WiFiManager *)&v5 dealloc];
}

+ (id)sharedWiFiManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A4C94;
  block[3] = &unk_1003A33A8;
  block[4] = a1;
  if (qword_100401FF0 != -1) {
    dispatch_once(&qword_100401FF0, block);
  }
  return (id)qword_100401FE8;
}

- (int)clientType
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A4D64;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)IPAddress
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = sub_1001A4E68;
  v10 = sub_1001A4E78;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A4E84;
  v5[3] = &unk_1003A64B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setClientType:(int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001A4FF4;
  v4[3] = &unk_1003A8E88;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_wifiClient
{
  result = self->_wifiClient;
  if (!result)
  {
    [(WiFiManager *)self _wifiClientTypeForManagerType:self->_clientType];
    result = (void *)WiFiManagerClientCreate();
    self->_wifiClient = (__WiFiManagerClient *)result;
  }
  return result;
}

- (int64_t)_wifiClientTypeForManagerType:(int)a3
{
  return a3 == 2;
}

- (id)_wifiInterfaceName
{
  if ([(WiFiManager *)self _wifiClient]
    && (CFArrayRef v2 = (const __CFArray *)WiFiManagerClientCopyDevices()) != 0)
  {
    CFArrayRef v3 = v2;
    if (CFArrayGetCount(v2) < 1)
    {
      id v4 = 0;
    }
    else
    {
      CFArrayGetValueAtIndex(v3, 0);
      id v4 = (id)WiFiDeviceClientGetInterfaceName();
    }
    CFRelease(v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end