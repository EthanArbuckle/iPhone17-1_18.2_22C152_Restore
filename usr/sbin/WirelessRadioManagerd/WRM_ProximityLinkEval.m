@interface WRM_ProximityLinkEval
- (WRM_ProximityLinkEval)init;
- (id)filterDevices:(id)a3;
- (id)nameForNetworkType:(id)a3;
- (id)submitMetrics;
- (id)submitMetrics:(id)a3;
- (void)evalWiFiVersusPHSLink:(int)a3;
- (void)session:(id)a3 updatedFoundDevices:(id)a4;
- (void)updateWiFiRadioMetrics:(int)a3 signalQuality:(int)a4 load:(int)a5 pointOFInterest:(int)a6;
@end

@implementation WRM_ProximityLinkEval

- (WRM_ProximityLinkEval)init
{
  v19.receiver = self;
  v19.super_class = (Class)WRM_ProximityLinkEval;
  v2 = [(WRM_ProximityLinkEval *)&v19 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.WirelessRadioManager.BT", 0);
    mLinkEvalManagerQueue = v2->mLinkEvalManagerQueue;
    v2->mLinkEvalManagerQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[WRM_BTBeaconController WRM_BTBeaconControllerSingleton];
    mBTBeaconController = v2->mBTBeaconController;
    v2->mBTBeaconController = (WRM_BTBeaconController *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    mRSSIDict = v2->mRSSIDict;
    v2->mRSSIDict = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    mHotspotDict = v2->mHotspotDict;
    v2->mHotspotDict = (NSMutableDictionary *)v9;

    v11 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithCapacity:2];
    mIPhoneIDSet = v2->mIPhoneIDSet;
    v2->mIPhoneIDSet = v11;

    objc_initWeak(&location, v2);
    v13 = v2->mBTBeaconController;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10009FD88;
    v15[3] = &unk_10020FD40;
    objc_copyWeak(&v17, &location);
    v16 = v2;
    [(WRM_BTBeaconController *)v13 setClientCBDeviceHandler:v15];
    +[WCM_Logging logLevel:24 message:@"Initialized ProximityLinkEval manager"];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)submitMetrics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->mHotspotDict valueForKey:v4];
  if (!v5)
  {
    uint64_t v5 = +[NSMutableDictionary dictionary];
  }
  v6 = [(NSMutableDictionary *)self->mRSSIDict valueForKey:v4];
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = [v6 valueForKey:@"btRssi"];
    [v5 setObject:v8 forKey:@"btRssi"];
  }
  if (![v5 count]) {
    +[WCM_Logging logLevel:24, @"ProximityLinkEval:submitMetrics: Metrics not collected for deviceID %@", v4 message];
  }
  id v11 = v5;
  AnalyticsSendEventLazy();
  +[WCM_Logging logLevel:24, @"ProximityLinkEval:submitMetrics: Metrics submitted for deviceID %@", v4 message];
  id v9 = v11;

  return v9;
}

- (id)submitMetrics
{
  dispatch_queue_t v3 = [(NSMutableSet *)self->mIPhoneIDSet anyObject];
  if (!v3) {
    +[WCM_Logging logLevel:24, @"ProximityLinkEval:submitMetrics: Metrics not collected for any iPhone device %@", self->mIPhoneIDSet message];
  }
  +[WCM_Logging logLevel:24, @"ProximityLinkEval:submitMetrics: Calling submitMetrics for deviceID %@", v3 message];
  id v4 = [(WRM_ProximityLinkEval *)self submitMetrics:v3];

  return v4;
}

- (id)filterDevices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->mRSSIDict allValues];
  v6 = +[NSPredicate predicateWithFormat:@"(model contains[cd] %@)", v4];
  uint64_t v7 = [v5 filteredArrayUsingPredicate:v6];

  v8 = [(NSMutableDictionary *)self->mHotspotDict allValues];
  id v9 = +[NSPredicate predicateWithFormat:@"(model contains[cd] %@)", v4];
  v10 = [v8 filteredArrayUsingPredicate:v9];

  id v11 = [objc_alloc((Class)NSMutableSet) initWithCapacity:2];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [(NSMutableDictionary *)self->mRSSIDict allKeysForObject:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        [v11 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v10;
  id v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [(NSMutableDictionary *)self->mHotspotDict allKeysForObject:*(void *)(*((void *)&v25 + 1) + 8 * (void)j)];
        [v11 addObject:v23];
      }
      id v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  +[WCM_Logging logLevel:24, @"ProximityLinkEval:filterDevices: For modelString: %@: deviceIDs: %@", v4, v11, (void)v25 message];

  return v11;
}

- (id)nameForNetworkType:(id)a3
{
  unsigned int v3 = [a3 intValue];
  if (v3 > 8) {
    return @"INVALID";
  }
  else {
    return off_10020FDB0[v3];
  }
}

- (void)evalWiFiVersusPHSLink:(int)a3
{
  +[WCM_Logging logLevel:24, @"ProximityLinkEval:evalWiFiVersusPHSLink: RSSI Statistics %@, callActive: %d", self->mRSSIDict, *(void *)&a3 message];
  +[WCM_Logging logLevel:24, @"ProximityLinkEval:evalWiFiVersusPHSLink: PHS Statistics %@", self->mHotspotDict message];
  id v4 = [(WRM_ProximityLinkEval *)self submitMetrics];
  +[WCM_Logging logLevel:24, @"ProimiyLinkEval:evalWiFiVersusPHSLink: submitMetrics test %@", v4 message];

  id v5 = [(WRM_ProximityLinkEval *)self filterDevices:@"mac"];
  id v6 = [(WRM_ProximityLinkEval *)self filterDevices:@"iphone"];
}

- (void)session:(id)a3 updatedFoundDevices:(id)a4
{
  id v5 = a4;
  +[WCM_Logging logLevel:24, @"Found hotspots %@", v5 message];
  objc_initWeak(&location, self);
  mLinkEvalManagerQueue = self->mLinkEvalManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A0AC0;
  block[3] = &unk_10020FD90;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(mLinkEvalManagerQueue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)updateWiFiRadioMetrics:(int)a3 signalQuality:(int)a4 load:(int)a5 pointOFInterest:(int)a6
{
  self->mWiFiRSSI = a3;
  self->mWiFiSNR = a4;
  self->mCCA = a5;
  self->mPOI = a6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mIPhoneIDSet, 0);
  objc_storeStrong((id *)&self->mBTBeaconController, 0);
  objc_storeStrong((id *)&self->mLinkEvalManagerQueue, 0);
  objc_storeStrong((id *)&self->mHotspotDict, 0);
  objc_storeStrong((id *)&self->mRSSIDict, 0);

  objc_storeStrong((id *)&self->mHotSpotSession, 0);
}

@end