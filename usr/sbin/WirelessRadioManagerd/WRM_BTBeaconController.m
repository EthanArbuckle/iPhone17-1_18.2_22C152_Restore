@interface WRM_BTBeaconController
+ (id)WRM_BTBeaconControllerSingleton;
- (WRM_BTBeaconController)init;
- (id)clientCBDeviceHandler;
- (int)getRSSI;
- (void)onBleBeaconReceived:(id)a3;
- (void)setClientCBDeviceHandler:(id)a3;
@end

@implementation WRM_BTBeaconController

+ (id)WRM_BTBeaconControllerSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082C90;
  block[3] = &unk_10020DB30;
  block[4] = a1;
  if (qword_10027D0A8 != -1) {
    dispatch_once(&qword_10027D0A8, block);
  }
  v2 = (void *)qword_10027D0A0;

  return v2;
}

- (WRM_BTBeaconController)init
{
  v18.receiver = self;
  v18.super_class = (Class)WRM_BTBeaconController;
  v2 = [(WRM_BTBeaconController *)&v18 init];
  v2->mRSSI = -1;
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.WirelessRadioManager.BT", 0);
  mBTQueue = v2->mBTQueue;
  v2->mBTQueue = (OS_dispatch_queue *)v3;

  v5 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
  mDiscovery = v2->mDiscovery;
  v2->mDiscovery = v5;

  +[WCM_Logging logLevel:24 message:@"BTBeacon Controller::CBDiscovery: object initialized"];
  [(CBDiscovery *)v2->mDiscovery setDiscoveryFlags:0x100000000040];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100082E78;
  v16[3] = &unk_10020F228;
  v7 = v2;
  v17 = v7;
  [(CBDiscovery *)v2->mDiscovery setDeviceFoundHandler:v16];
  [(CBDiscovery *)v2->mDiscovery setDeviceLostHandler:&stru_10020F268];
  [(CBDiscovery *)v2->mDiscovery setDispatchQueue:v2->mBTQueue];
  v8 = v2->mDiscovery;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100082F1C;
  v14 = &unk_10020F290;
  v9 = v7;
  v15 = v9;
  [(CBDiscovery *)v8 activateWithCompletion:&v11];
  +[WCM_Logging logLevel:24, @"BTBeacon Controller Initialized", v11, v12, v13, v14 message];

  return v9;
}

- (void)onBleBeaconReceived:(id)a3
{
  id v11 = a3;
  if (([v11 deviceFlags] & 0x80) != 0)
  {
    id v4 = [v11 idsDeviceID];
    id v5 = [v4 UTF8String];
    id v6 = [v11 identifier];
    id v7 = [v6 UTF8String];
    id v8 = [v11 model];
    [WCM_Logging logLevel:24 message:@"BTBeacon Controller::onBleBeaconReceived: IDS ID %s, BT identifier %s, Model %s, RSSI %d", v5, v7, [v8 UTF8String], objc_msgSend(v11, "bleRSSI")];

    self->mRSSI = [v11 bleRSSI];
    v9 = [(WRM_BTBeaconController *)self clientCBDeviceHandler];

    if (v9)
    {
      v10 = [(WRM_BTBeaconController *)self clientCBDeviceHandler];
      ((void (**)(void, id))v10)[2](v10, v11);
    }
  }
}

- (int)getRSSI
{
  int result = self->mRSSI;
  if (result == -1)
  {
    +[WCM_Logging logLevel:24 message:@"BTBeacon Controller::getRSSI: RSSI Value has not been initialized."];
    return self->mRSSI;
  }
  return result;
}

- (id)clientCBDeviceHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setClientCBDeviceHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientCBDeviceHandler, 0);
  objc_storeStrong((id *)&self->mBTQueue, 0);

  objc_storeStrong((id *)&self->mDiscovery, 0);
}

@end