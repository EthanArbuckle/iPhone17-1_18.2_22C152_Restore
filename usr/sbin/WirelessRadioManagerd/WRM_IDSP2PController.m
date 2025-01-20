@interface WRM_IDSP2PController
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)wrm_IDSP2PControllerSingleton;
- (BOOL)DevicePaired;
- (BOOL)ServiceInitDone;
- (BOOL)isDevicePaired;
- (BOOL)isRemoteWiFiGood;
- (BOOL)updateDevicePairingState;
- (IDSService)service;
- (NSArray)ConnectedDevices;
- (NSString)CompanionBTRssi;
- (NSString)CompanionBTVersusWiFiRecommendation;
- (NSString)CompanionInternetConnectionAvailable;
- (NSString)CompanionWIFIRssi;
- (NSString)CompanionWifiStatus;
- (OS_dispatch_queue)queue;
- (WRM_IDSP2PController)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)retainCount;
- (unsigned)IsIDSInitDone;
- (void)InitService;
- (void)WrmSendp2pMessage:(id)a3 MessageBody:(id)a4 withOptions:(id)a5;
- (void)dealloc;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setCompanionBTRssi:(id)a3;
- (void)setCompanionBTVersusWiFiRecommendation:(id)a3;
- (void)setCompanionInternetConnectionAvailable:(id)a3;
- (void)setCompanionWIFIRssi:(id)a3;
- (void)setCompanionWifiStatus:(id)a3;
- (void)setConnectedDevices:(id)a3;
- (void)setDevicePaired:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceInitDone:(BOOL)a3;
@end

@implementation WRM_IDSP2PController

+ (id)wrm_IDSP2PControllerSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053F40;
  block[3] = &unk_10020D980;
  block[4] = a1;
  if (qword_10027D010 != -1) {
    dispatch_once(&qword_10027D010, block);
  }
  return (id)qword_10027D018;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = [a1 wrm_IDSP2PControllerSingleton:a3];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (unint64_t)retainCount
{
  return -1;
}

- (WRM_IDSP2PController)init
{
  v4.receiver = self;
  v4.super_class = (Class)WRM_IDSP2PController;
  v2 = [(WRM_IDSP2PController *)&v4 init];
  if (v2)
  {
    [(WRM_IDSP2PController *)v2 setQueue:dispatch_queue_create("com.apple.WirelessRadioManager.P2PIDS", 0)];
    +[WCM_Logging logLevel:27 message:@"IDSP2PSync: P2PSync module initialized"];
    [(WRM_IDSP2PController *)v2 setServiceInitDone:0];
    [(WRM_IDSP2PController *)v2 setConnectedDevices:objc_alloc_init((Class)NSArray)];
    [(WRM_IDSP2PController *)v2 setCompanionWifiStatus:objc_alloc_init((Class)NSString)];
    [(WRM_IDSP2PController *)v2 setCompanionWifiStatus:@"LinkUP"];
    [(WRM_IDSP2PController *)v2 setDevicePaired:0];
    [(WRM_IDSP2PController *)v2 setCompanionBTVersusWiFiRecommendation:objc_alloc_init((Class)NSString)];
    [(WRM_IDSP2PController *)v2 setCompanionBTVersusWiFiRecommendation:@"WIFI"];
    [(WRM_IDSP2PController *)v2 setCompanionInternetConnectionAvailable:objc_alloc_init((Class)NSString)];
    [(WRM_IDSP2PController *)v2 setCompanionInternetConnectionAvailable:@"YES"];
    [(WRM_IDSP2PController *)v2 setCompanionBTRssi:objc_alloc_init((Class)NSString)];
    [(WRM_IDSP2PController *)v2 setCompanionBTRssi:@"-40"];
    [(WRM_IDSP2PController *)v2 setCompanionWIFIRssi:objc_alloc_init((Class)NSString)];
    [(WRM_IDSP2PController *)v2 setCompanionWIFIRssi:@"-50"];
  }
  return v2;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:27 message:@"IDSP2PSync: Dealloc called for P2P IDS Manager"];
  if ([(WRM_IDSP2PController *)self ConnectedDevices]) {

  }
  if ([(WRM_IDSP2PController *)self CompanionWifiStatus]) {
  v3.receiver = self;
  }
  v3.super_class = (Class)WRM_IDSP2PController;
  [(WRM_IDSP2PController *)&v3 dealloc];
}

- (void)WrmSendp2pMessage:(id)a3 MessageBody:(id)a4 withOptions:(id)a5
{
  v11[0] = @"msg.name";
  v11[1] = @"msg.body";
  v12[0] = a3;
  v12[1] = a4;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  +[WCM_Logging logLevel:message:](WCM_Logging, 27, @"IDSP2PSync: Sending hint to Gizmo '%s' having contents %s", [a3 UTF8String], [a4 UTF8String]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054374;
  block[3] = &unk_10020DE88;
  block[4] = self;
  void block[5] = v9;
  block[6] = a5;
  dispatch_async((dispatch_queue_t)[(WRM_IDSP2PController *)self queue], block);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  +[WCM_Logging logLevel:27, @"IDSP2PSync: Incoming message received", a5, a6, a7 message];
  id v10 = [a5 objectForKey:@"msg.body"];
  id v11 = [a5 objectForKey:@"msg.name"];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @" IDSP2PSync <= Incoming message '%s' with contents %@: %lu keys; from device '%s'",
    [v11 UTF8String],
    v10,
    [a5 count],
    [a6 UTF8String]);
  if ([v11 isEqualToString:@"WiFi status"])
  {
    if ([(WRM_IDSP2PController *)self CompanionWifiStatus]) {

    }
    -[WRM_IDSP2PController setCompanionWifiStatus:](self, "setCompanionWifiStatus:", [v10 copy]);
    +[WCM_Logging logLevel:27, @" IDSP2PSync Companion Wifi Status is %@", [(WRM_IDSP2PController *)self CompanionWifiStatus] message];
  }
  if ([v11 isEqualToString:@"BT versus WiFi pref"])
  {
    if ([(WRM_IDSP2PController *)self CompanionBTVersusWiFiRecommendation]) {

    }
    -[WRM_IDSP2PController setCompanionWifiStatus:](self, "setCompanionWifiStatus:", [v10 copy]);
    +[WCM_Logging logLevel:27, @" IDSP2PSync Companion BT versus WiFi recommendation is %@", [(WRM_IDSP2PController *)self CompanionBTVersusWiFiRecommendation] message];
  }
  if ([v11 isEqualToString:@"Internet Available"])
  {
    if ([(WRM_IDSP2PController *)self CompanionInternetConnectionAvailable]) {

    }
    -[WRM_IDSP2PController setCompanionInternetConnectionAvailable:](self, "setCompanionInternetConnectionAvailable:", [v10 copy]);
    +[WCM_Logging logLevel:27, @" IDSP2PSync Companion Internet available %@", [(WRM_IDSP2PController *)self CompanionInternetConnectionAvailable] message];
  }
  if ([v11 isEqualToString:@"BT RSSI"])
  {
    if ([(WRM_IDSP2PController *)self CompanionBTRssi]) {

    }
    -[WRM_IDSP2PController setCompanionBTRssi:](self, "setCompanionBTRssi:", [v10 copy]);
    +[WCM_Logging logLevel:27, @" IDSP2PSync Companion BT RSSI %@", [(WRM_IDSP2PController *)self CompanionBTRssi] message];
  }
  if ([v11 isEqualToString:@"WIFI RSSI"])
  {
    if ([(WRM_IDSP2PController *)self CompanionWIFIRssi]) {

    }
    -[WRM_IDSP2PController setCompanionWIFIRssi:](self, "setCompanionWIFIRssi:", [v10 copy]);
    +[WCM_Logging logLevel:27, @" IDSP2PSync Companion Wifi RSSI %@", [(WRM_IDSP2PController *)self CompanionWIFIRssi] message];
  }
  id v12 = +[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton];

  [v12 evaluateBTWiFiLinkForTerminus];
}

- (BOOL)isRemoteWiFiGood
{
  v2 = [(WRM_IDSP2PController *)self CompanionWifiStatus];

  return [(NSString *)v2 isEqualToString:@"LinkUP"];
}

- (BOOL)isDevicePaired
{
  return [(WRM_IDSP2PController *)self DevicePaired];
}

- (BOOL)updateDevicePairingState
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(WRM_IDSP2PController *)self ConnectedDevices];
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    CFStringRef v6 = @"%s: Device is Paired!";
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v8 && ([v8 isLocallyPaired] & 1) != 0)
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
    BOOL v9 = 0;
    CFStringRef v6 = @"%s: Device is NOT Paired!";
  }
  else
  {
    BOOL v9 = 0;
    CFStringRef v6 = @"%s: Device is NOT Paired!";
  }
LABEL_13:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, v6, "-[WRM_IDSP2PController updateDevicePairingState]");
  return v9;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  +[WCM_Logging logLevel:27 message:@"IDSP2PSync: devicesChanged called"];
  id v6 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100054BD0;
  v8[3] = &unk_10020DAB0;
  v8[4] = a4;
  v8[5] = self;
  dispatch_async(queue, v8);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  +[WCM_Logging logLevel:27 message:@"IDSP2PSync: connectedDevicesChanged called"];
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054DFC;
  block[3] = &unk_10020D980;
  block[4] = a4;
  dispatch_async(queue, block);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  if (a6) {
    BOOL v9 = "true";
  }
  else {
    BOOL v9 = "false";
  }
  id v10 = [a5 UTF8String:a3, a4];
  if (a7) {
    [WCM_Logging logLevel:27 message:@"IDSP2PSync: -- didSendWithSuccess: %s identifier: %s error: %s", v9, v10, [objc_msgSend(objc_msgSend(a7, "description"), "UTF8String") UTF8String]];
  }
  else {
    +[WCM_Logging logLevel:27, @"IDSP2PSync:   -- didSendWithSuccess: %s identifier: %s", v9, v10, v11 message];
  }
}

- (unsigned)IsIDSInitDone
{
  return [(WRM_IDSP2PController *)self ServiceInitDone];
}

- (void)InitService
{
  +[WCM_Logging logLevel:27 message:@"IDSP2PSync: InitService called"];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054FA4;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async(queue, block);
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSArray)ConnectedDevices
{
  return self->_ConnectedDevices;
}

- (void)setConnectedDevices:(id)a3
{
}

- (BOOL)ServiceInitDone
{
  return self->_ServiceInitDone;
}

- (void)setServiceInitDone:(BOOL)a3
{
  self->_ServiceInitDone = a3;
}

- (BOOL)DevicePaired
{
  return self->_DevicePaired;
}

- (void)setDevicePaired:(BOOL)a3
{
  self->_DevicePaired = a3;
}

- (NSString)CompanionWifiStatus
{
  return self->_CompanionWifiStatus;
}

- (void)setCompanionWifiStatus:(id)a3
{
}

- (NSString)CompanionBTVersusWiFiRecommendation
{
  return self->_CompanionBTVersusWiFiRecommendation;
}

- (void)setCompanionBTVersusWiFiRecommendation:(id)a3
{
}

- (NSString)CompanionInternetConnectionAvailable
{
  return self->_CompanionInternetConnectionAvailable;
}

- (void)setCompanionInternetConnectionAvailable:(id)a3
{
}

- (NSString)CompanionBTRssi
{
  return self->_CompanionBTRssi;
}

- (void)setCompanionBTRssi:(id)a3
{
}

- (NSString)CompanionWIFIRssi
{
  return self->_CompanionWIFIRssi;
}

- (void)setCompanionWIFIRssi:(id)a3
{
}

@end