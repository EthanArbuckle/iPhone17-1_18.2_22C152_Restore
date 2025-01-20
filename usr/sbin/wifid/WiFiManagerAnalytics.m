@interface WiFiManagerAnalytics
+ (id)sharedInstance;
- (BOOL)hasRegisteredWithDaemon;
- (OS_dispatch_queue)serialQ;
- (OS_dispatch_queue)wifiManagerQueue;
- (WAClient)waClient;
- (WiFiManagerAnalytics)init;
- (id)__copyHashOfSSID:(id)a3;
- (id)_initPrivate;
- (int)_getAssociationEventIDForEventTypeString:(id)a3;
- (void)_populateDPSAPInfoMessage:(__CFDictionary *)a3 andReply:(id)a4;
- (void)_populateDPSLinkStateChangeMessage:(id *)a3 andReply:(id)a4;
- (void)_populateDPSNotificationMessage:(__CFDictionary *)a3 andReply:(id)a4;
- (void)_populateDPSProbeResultMessage:(id *)a3 andReply:(id)a4;
- (void)_populateSlowWiFiNotificationMessage:(__CFDictionary *)a3 andReply:(id)a4;
- (void)_populateWiFiConnectionQualityMessageWithScorecard:(id)a3 andReply:(id)a4;
- (void)_register;
- (void)_runReplyBlock:(id)a3 withMessage:(id)a4 andError:(id)a5;
- (void)getDeviceAnalyticsConfigurationWithCompletion:(id)a3;
- (void)prepareMessageForSubmission:(unsigned int)a3 withData:(void *)a4 andReply:(id)a5;
- (void)setDeviceAnalyticsConfiguration:(id)a3;
- (void)setHasRegisteredWithDaemon:(BOOL)a3;
- (void)setSerialQ:(id)a3;
- (void)setWaClient:(id)a3;
- (void)setWiFiManagerQueue:(id)a3;
- (void)setWifiManagerQueue:(id)a3;
- (void)submitGeoServicesMessage:(id)a3;
- (void)submitWiFiAnalyticsMessage:(id)a3;
- (void)triggerDatapathDiagnosticsNoReply:(id)a3;
- (void)triggerDeviceAnalyticsStoreMigrationWithCompletion:(id)a3;
@end

@implementation WiFiManagerAnalytics

+ (id)sharedInstance
{
  if (qword_10027DC20 != -1) {
    dispatch_once(&qword_10027DC20, &stru_100242830);
  }
  if (([(id)qword_10027DC18 hasRegisteredWithDaemon] & 1) == 0) {
    [(id)qword_10027DC18 _register];
  }
  v2 = (void *)qword_10027DC18;

  return v2;
}

- (void)_register
{
  v3 = +[WAClient sharedClient];
  [v3 registerMessageGroup:2 andReply:&stru_100242850];

  v4 = +[WAClient sharedClient];
  [v4 registerMessageGroup:5 andReply:&stru_100242870];

  v5 = +[WAClient sharedClient];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001619D8;
  v6[3] = &unk_100242898;
  v6[4] = self;
  [v5 registerMessageGroup:4 andReply:v6];
}

- (void)setWiFiManagerQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 2, "%s WiFiManagerQueue was set", "-[WiFiManagerAnalytics setWiFiManagerQueue:]")
  }
  wifiManagerQueue = self->_wifiManagerQueue;
  self->_wifiManagerQueue = v4;
}

- (void)submitWiFiAnalyticsMessage:(id)a3
{
  id v8 = a3;
  v5 = (void *)qword_10027DD68;
  if (qword_10027DD68)
  {
    v6 = [v8 metricName];
    [v5 WFLog:3, "%s Received call to submit WiFi Analytics message with (%@) value", "-[WiFiManagerAnalytics submitWiFiAnalyticsMessage:]", v6 message];
  }
  v7 = [(WiFiManagerAnalytics *)self waClient];
  [v7 submitWiFiAnalyticsMessageAdvanced:v8];
}

- (void)submitGeoServicesMessage:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiManagerAnalytics *)self waClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100161C8C;
  v7[3] = &unk_1002428C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 submitMessage:v6 groupType:2 andReply:v7];
}

- (void)triggerDatapathDiagnosticsNoReply:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiManagerAnalytics *)self waClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100161E30;
  v7[3] = &unk_100242898;
  id v8 = v4;
  id v6 = v4;
  [v5 triggerDatapathDiagnosticsAndCollectUpdates:0 waMessage:v6 andReply:v7];
}

- (void)setDeviceAnalyticsConfiguration:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [(WiFiManagerAnalytics *)self waClient];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100162000;
  v6[3] = &unk_1002428E8;
  objc_copyWeak(&v7, &location);
  [v5 setDeviceAnalyticsConfiguration:v4 andReply:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)getDeviceAnalyticsConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiManagerAnalytics *)self waClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016216C;
  v7[3] = &unk_100242910;
  id v8 = v4;
  id v6 = v4;
  [v5 getDeviceAnalyticsConfigurationAndReply:v7];
}

- (void)triggerDeviceAnalyticsStoreMigrationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[WAClient sharedClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100162330;
  v7[3] = &unk_100242938;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 triggerDeviceAnalyticsStoreMigrationAndReply:v7];
}

- (void)_runReplyBlock:(id)a3 withMessage:(id)a4 andError:(id)a5
{
}

- (void)prepareMessageForSubmission:(unsigned int)a3 withData:(void *)a4 andReply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001626E4;
  v19[3] = &unk_100242988;
  unsigned int v21 = a3;
  id v8 = a5;
  v19[4] = self;
  id v20 = v8;
  v9 = objc_retainBlock(v19);
  if (v6)
  {
    wifiManagerQueue = self->_wifiManagerQueue;
    if (wifiManagerQueue)
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s Received call to prepare message with identifier: 0x%x", "-[WiFiManagerAnalytics prepareMessageForSubmission:withData:andReply:]", v6);
      }
      v12 = [(WiFiManagerAnalytics *)self serialQ];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001629D8;
      block[3] = &unk_1002429B0;
      int v18 = v6;
      block[4] = self;
      v17 = a4;
      v16 = v9;
      dispatch_async(v12, block);
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:4 message:@"Nobody set the _wifiManagerQueue, can't prepare metric with id: %u. Bailing", v6];
      }
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"Zero(0) message identifier, bail."];
    }
    v14 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9010 userInfo:0];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v14);
  }
}

- (WiFiManagerAnalytics)init
{
  +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, @"-[WAClient init] unavailable", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)_initPrivate
{
  v9.receiver = self;
  v9.super_class = (Class)WiFiManagerAnalytics;
  id v2 = [(WiFiManagerAnalytics *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[WAClient sharedClientWithIdentifier:@"wifid"];
    waClient = v2->_waClient;
    v2->_waClient = (WAClient *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.wifid.wifimanageranalytics.serialQ", v5);
    serialQ = v2->_serialQ;
    v2->_serialQ = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (id)__copyHashOfSSID:(id)a3
{
  id v3 = a3;
  v5 = +[LSApplicationWorkspace defaultWorkspace];
  dispatch_queue_t v6 = [v5 deviceIdentifierForVendor];

  if (v6)
  {
    id v7 = [v6 UUIDString];
    id v8 = (const char *)[v7 cStringUsingEncoding:4];

    objc_super v9 = (const char *)[v3 cStringUsingEncoding:4];
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    macOut[0] = v10;
    macOut[1] = v10;
    size_t v11 = strlen(v8);
    size_t v12 = strlen(v9);
    CCHmac(2u, v8, v11, v9, v12, macOut);
    id v13 = [objc_alloc((Class)NSMutableString) initWithCapacity:64];
    for (uint64_t i = 0; i != 32; ++i)
      [v13 appendFormat:@"%02x", *((unsigned __int8 *)macOut + i)];
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: failed to get deviceIdentifier", "-[WiFiManagerAnalytics __copyHashOfSSID:]");
    }
    id v13 = 0;
  }

  return v13;
}

- (void)_populateWiFiConnectionQualityMessageWithScorecard:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6 && v7)
  {
    objc_super v9 = +[WAClient sharedClient];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100162ED8;
    v11[3] = &unk_100242AA0;
    id v12 = v6;
    id v13 = self;
    v14 = v8;
    [v9 registerMessageGroup:2 andReply:v11];
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:@"%s NULL SCORECARD, bail" message:4];
    }
    v8[2](v8, 0, 0);
  }
}

- (int)_getAssociationEventIDForEventTypeString:(id)a3
{
  int v3 = 6;
  if (a3)
  {
    id v4 = a3;
    if ([v4 isEqualToString:@"AUTH"]) {
      int v5 = 0;
    }
    else {
      int v5 = 6;
    }
    if ([v4 isEqualToString:@"ASSOC"]) {
      int v5 = 1;
    }
    if ([v4 isEqualToString:@"ASSOC_DONE"]) {
      int v5 = 2;
    }
    if ([v4 isEqualToString:@"LINK STATUS EVENT"]) {
      int v5 = 3;
    }
    if ([v4 isEqualToString:@"LINK CHANGED"]) {
      int v6 = 4;
    }
    else {
      int v6 = v5;
    }
    unsigned int v7 = [v4 isEqualToString:@"SSID CHANGED"];

    if (v7) {
      return 5;
    }
    else {
      return v6;
    }
  }
  return v3;
}

- (void)_populateDPSNotificationMessage:(__CFDictionary *)a3 andReply:(id)a4
{
  id v5 = a4;
  int v6 = +[WAClient sharedClient];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100164CD4;
  v8[3] = &unk_100242AC8;
  id v9 = v5;
  long long v10 = a3;
  id v7 = v5;
  [v6 getNewMessageForKey:@"DPSN" groupType:4 andReply:v8];
}

- (void)_populateDPSProbeResultMessage:(id *)a3 andReply:(id)a4
{
  id v5 = a4;
  int v6 = +[WAClient sharedClient];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10016501C;
  v8[3] = &unk_100242AC8;
  id v9 = v5;
  long long v10 = a3;
  id v7 = v5;
  [v6 getNewMessageForKey:@"DPSAPS" groupType:4 andReply:v8];
}

- (void)_populateDPSLinkStateChangeMessage:(id *)a3 andReply:(id)a4
{
  id v5 = a4;
  int v6 = +[WAClient sharedClient];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001652C8;
  v8[3] = &unk_100242AC8;
  id v9 = v5;
  long long v10 = a3;
  id v7 = v5;
  [v6 getNewMessageForKey:@"WFAAWDWADAAD" groupType:4 andReply:v8];
}

- (void)_populateDPSAPInfoMessage:(__CFDictionary *)a3 andReply:(id)a4
{
  id v5 = a4;
  int v6 = +[WAClient sharedClient];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100165584;
  v8[3] = &unk_100242AC8;
  id v9 = v5;
  long long v10 = a3;
  id v7 = v5;
  [v6 getNewMessageForKey:@"WFAAWDWAAAPI" groupType:4 andReply:v8];
}

- (void)_populateSlowWiFiNotificationMessage:(__CFDictionary *)a3 andReply:(id)a4
{
  id v5 = a4;
  int v6 = +[WAClient sharedClient];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100165848;
  v8[3] = &unk_100242AC8;
  id v9 = v5;
  long long v10 = a3;
  id v7 = v5;
  [v6 getNewMessageForKey:@"WFAAWDSWFN" groupType:4 andReply:v8];
}

- (OS_dispatch_queue)wifiManagerQueue
{
  return self->_wifiManagerQueue;
}

- (void)setWifiManagerQueue:(id)a3
{
}

- (WAClient)waClient
{
  return self->_waClient;
}

- (void)setWaClient:(id)a3
{
}

- (BOOL)hasRegisteredWithDaemon
{
  return self->_hasRegisteredWithDaemon;
}

- (void)setHasRegisteredWithDaemon:(BOOL)a3
{
  self->_hasRegisteredWithDaemon = a3;
}

- (OS_dispatch_queue)serialQ
{
  return self->_serialQ;
}

- (void)setSerialQ:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQ, 0);
  objc_storeStrong((id *)&self->_waClient, 0);

  objc_storeStrong((id *)&self->_wifiManagerQueue, 0);
}

@end