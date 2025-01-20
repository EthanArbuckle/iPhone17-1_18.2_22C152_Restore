@interface WiFiCloudAssetsClient
+ (id)sharedInstance;
- (BOOL)isWiFiHealthMonitorDisabled;
- (OS_dispatch_queue)queue;
- (__WiFiManager)wifiManager;
- (void)initializeWithManager:(__WiFiManager *)a3 queue:(id)a4;
- (void)runAssetQuery;
- (void)setIsWiFiHealthMonitorDisabled:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setWifiManager:(__WiFiManager *)a3;
@end

@implementation WiFiCloudAssetsClient

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026EE8;
  block[3] = &unk_10023EAF8;
  block[4] = a1;
  if (qword_10027D590 != -1) {
    dispatch_once(&qword_10027D590, block);
  }
  v2 = (void *)qword_10027D588;

  return v2;
}

- (void)runAssetQuery
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100026F98;
  v2[3] = &unk_10023EB48;
  v2[4] = self;
  +[WCAFetchWiFiBehaviorParameters fetchWiFiBehaviorWithCompletion:v2];
}

- (void)initializeWithManager:(__WiFiManager *)a3 queue:(id)a4
{
  id v6 = a4;
  [(WiFiCloudAssetsClient *)self setWifiManager:a3];
  [(WiFiCloudAssetsClient *)self setQueue:v6];
}

- (BOOL)isWiFiHealthMonitorDisabled
{
  return self->_isWiFiHealthMonitorDisabled;
}

- (void)setIsWiFiHealthMonitorDisabled:(BOOL)a3
{
  self->_isWiFiHealthMonitorDisabled = a3;
}

- (__WiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(__WiFiManager *)a3
{
  self->_wifiManager = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end