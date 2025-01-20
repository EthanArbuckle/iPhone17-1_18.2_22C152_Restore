@interface WiFiHotspotNANInterface
- (BOOL)checkDeviceNanCapabilities;
- (BOOL)isClientAssociated;
- (BOOL)isConnectedToSameNanNetwork:(__CFString *)a3;
- (BOOL)isSessionTerminated;
- (BOOL)isSubscriberStopped;
- (BOOL)subscriberHeldOffForPreviousDP;
- (BOOL)subscriberStoppedCallbackRcvd;
- (NSDictionary)curNetworkRecord;
- (NSMutableArray)pwdList;
- (NSMutableDictionary)wapDataSessionHandles;
- (NSString)lastAssociatedNetworkServiceName;
- (NSString)networkMacAddr;
- (NSString)networkMacAddrNext;
- (NSString)networkSsid;
- (NSString)networkSsidNext;
- (NSString)subscriber_ifname;
- (WiFiAwareDataSession)waDataSession;
- (WiFiAwareDiscoveryResult)waDiscoveryResult;
- (WiFiAwareDiscoveryResult)waDiscoveryResultCrashRecovery;
- (WiFiAwarePublishConfiguration)wapCfg;
- (WiFiAwarePublisher)wapPHSOverNAN;
- (WiFiAwarePublisherDataSessionHandle)wapDataSession;
- (WiFiAwareSubscribeConfiguration)wasCfg;
- (WiFiAwareSubscriber)wasPHSOverNAN;
- (WiFiHotspotNANInterface)init;
- (int)macRandomizationTransactionState;
- (int64_t)current_rssi;
- (unsigned)isAutoJoined;
- (unsigned)isHotspotDeviceSupportNAN:(__CFString *)a3 withCFStringRef:(__CFString *)a4;
- (unsigned)isNANPublisherStarted;
- (unsigned)nanPublisherState;
- (unsigned)subscriber_ifindex;
- (void)callbackContext;
- (void)createWAPConfig:(id)a3;
- (void)createWASConfig:(id)a3;
- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5;
- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)dataSession:(id)a3 updatedPeerRSSI:(int)a4;
- (void)dataSessionRequestStarted:(id)a3;
- (void)establishedLinkNetwork;
- (void)linkEstablishedCallbackContext;
- (void)linkTerminatedCallbackContext;
- (void)nanAssocData;
- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6;
- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5;
- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)publisherMetricsCallback;
- (void)publisherMetricsCallbackContext;
- (void)publisherStarted:(id)a3;
- (void)registerClientDatapathEstablishedCallback:(void *)a3 withContext:(void *)a4 withNetworkContext:(void *)a5 withAssocData:(void *)a6 isAutoJoined:(unsigned __int8)a7;
- (void)registerClientDatapathTerminatedCallback:(void *)a3 withContext:(void *)a4;
- (void)registerPublisherMetricCallback:(void *)a3 withContext:(void *)a4;
- (void)registerStaArriveCallback:(void *)a3 withContext:(void *)a4;
- (void)registerStaLeaveCallback:(void *)a3 withContext:(void *)a4;
- (void)registerSubscriberMetricCallback:(void *)a3 withContext:(void *)a4;
- (void)registerSubscriberTimerCancelCallback:(void *)a3 withContext:(void *)a4;
- (void)setCallbackContext:(void *)a3;
- (void)setClientAssociated:(BOOL)a3;
- (void)setCurNetworkRecord:(id)a3;
- (void)setDataPathSecCfgForPHSOverNAN:(int64_t)a3;
- (void)setDeviceNameForPHSOverNAN:(__CFString *)a3;
- (void)setEstablishedLinkNetwork:(void *)a3;
- (void)setIsAutoJoined:(unsigned __int8)a3;
- (void)setLastAssociatedNetworkServiceName:(id)a3;
- (void)setLastAssociatedServiceName:(id)a3;
- (void)setLinkEstablishedCallbackContext:(void *)a3;
- (void)setLinkTerminatedCallbackContext:(void *)a3;
- (void)setMacRandomizationTransactionState:(int)a3;
- (void)setNanAssocData:(void *)a3;
- (void)setNanPublisherState:(unsigned int)a3;
- (void)setNetworkMacAddr:(id)a3;
- (void)setNetworkMacAddrNext:(id)a3;
- (void)setNetworkSsid:(id)a3;
- (void)setNetworkSsidNext:(id)a3;
- (void)setPasswordForPHSOverNAN:(__CFString *)a3;
- (void)setPublisherMetricsCallback:(void *)a3;
- (void)setPublisherMetricsCallbackContext:(void *)a3;
- (void)setPwdList:(id)a3;
- (void)setSessionTerminated:(BOOL)a3;
- (void)setStaArrivecallback:(void *)a3;
- (void)setStaDatapathEstablishedcallback:(void *)a3;
- (void)setStaDatapathTerminatedcallback:(void *)a3;
- (void)setStaLeavecallback:(void *)a3;
- (void)setSubscriberCancelTimerCallback:(void *)a3;
- (void)setSubscriberCancelTimerCallbackContext:(void *)a3;
- (void)setSubscriberHeldOffForPreviousDP:(BOOL)a3;
- (void)setSubscriberMetricsCallback:(void *)a3;
- (void)setSubscriberMetricsCallbackContext:(void *)a3;
- (void)setSubscriberStopped:(BOOL)a3;
- (void)setSubscriberStoppedCallbackRcvd:(BOOL)a3;
- (void)setWaDataSession:(id)a3;
- (void)setWaDiscoveryResult:(id)a3;
- (void)setWaDiscoveryResultCrashRecovery:(id)a3;
- (void)setWapCfg:(id)a3;
- (void)setWapDataSession:(id)a3;
- (void)setWapDataSessionHandles:(id)a3;
- (void)setWapPHSOverNAN:(id)a3;
- (void)setWasCfg:(id)a3;
- (void)setWasPHSOverNAN:(id)a3;
- (void)staArrivecallback;
- (void)staDatapathEstablishedcallback;
- (void)staDatapathTerminatedcallback;
- (void)staLeavecallback;
- (void)startPublisherForPHSOverNAN;
- (void)startSubscriberForPHSOverNAN:(id)a3 networkMacAddress:(id)a4;
- (void)stopPublisherForPHSOverNAN;
- (void)stopSubscriberAsNoNetworkFound;
- (void)stopSubscriberForPHSOverNAN;
- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5;
- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4;
- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)subscriberCancelTimerCallback;
- (void)subscriberCancelTimerCallbackContext;
- (void)subscriberMetricsCallback;
- (void)subscriberMetricsCallbackContext;
- (void)subscriberStarted:(id)a3;
@end

@implementation WiFiHotspotNANInterface

- (BOOL)isClientAssociated
{
  return self->_clientAssociated;
}

- (WiFiHotspotNANInterface)init
{
  v20.receiver = self;
  v20.super_class = (Class)WiFiHotspotNANInterface;
  v2 = [(WiFiHotspotNANInterface *)&v20 init];
  v3 = v2;
  if (v2)
  {
    wapCfg = v2->_wapCfg;
    v2->_wapCfg = 0;

    wasCfg = v3->_wasCfg;
    v3->_wasCfg = 0;

    networkSsid = v3->_networkSsid;
    v3->_networkSsid = 0;

    networkMacAddr = v3->_networkMacAddr;
    v3->_networkMacAddr = 0;

    networkSsidNext = v3->_networkSsidNext;
    v3->_networkSsidNext = 0;

    networkMacAddrNext = v3->_networkMacAddrNext;
    v3->_networkMacAddrNext = 0;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pwdList = v3->_pwdList;
    v3->_pwdList = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    wapDataSessionHandles = v3->_wapDataSessionHandles;
    v3->_wapDataSessionHandles = v12;

    v3->_sessionTerminated = 1;
    wapDataSession = v3->_wapDataSession;
    v3->_wapDataSession = 0;

    v3->_clientAssociated = 0;
    v3->_subscriber_ifindex = 0;
    subscriber_ifname = v3->_subscriber_ifname;
    v3->_subscriber_ifname = 0;

    v3->_subscriberStopped = 1;
    lastAssociatedNetworkServiceName = v3->_lastAssociatedNetworkServiceName;
    v3->_lastAssociatedNetworkServiceName = 0;

    waDiscoveryResult = v3->_waDiscoveryResult;
    v3->_waDiscoveryResult = 0;

    v3->_current_rssi = -128;
    curNetworkRecord = v3->_curNetworkRecord;
    v3->_curNetworkRecord = 0;

    v3->_subscriberHeldOffForPreviousDP = 0;
    v3->_macRandomizationTransactionState = 0;
    v3->_nanPublisherState = 0;
    v3->_subscriberStoppedCallbackRcvd = 0;
  }
  return v3;
}

- (void)publisherStarted:(id)a3
{
  id v5 = a3;
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "WiFiAwarePublisher started with publisher=%@", v5 message];
  }
  self->_nanPublisherState = 2;
}

- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v7 = a3;
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:message:3, @"WiFiAwarePublisher failed to start with errorString=%d", a4];
  }
  self->_nanPublisherState = 0;
  if ([(WiFiHotspotNANInterface *)self publisherMetricsCallback]) {
    ((void (*)(void, void, void *))[(WiFiHotspotNANInterface *)self publisherMetricsCallback])(0, a4, [(WiFiHotspotNANInterface *)self publisherMetricsCallbackContext]);
  }
}

- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v7 = a3;
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "WiFiAwarePublisher terminated with reasonString=%d", a4);
  }
  self->_nanPublisherState = 0;
  if ([(WiFiHotspotNANInterface *)self publisherMetricsCallback]) {
    ((void (*)(uint64_t, void, void *))[(WiFiHotspotNANInterface *)self publisherMetricsCallback])(2, a4, [(WiFiHotspotNANInterface *)self publisherMetricsCallbackContext]);
  }
}

- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  objc_storeStrong((id *)&self->_wapDataSession, a4);
  self->_sessionTerminated = 0;
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3 message:"WiFiAwarePublisher data session confirmed "];
  }
  __int16 v24 = 0;
  int v23 = 0;
  v13 = [v10 initiatorDataAddress];
  id v14 = [v13 data];
  v15 = [v14 bytes];
  v16 = [v10 initiatorDataAddress];
  v17 = [v16 data];
  if ((unint64_t)[v17 length] >= 6)
  {
    __int16 v24 = v15[2];
    int v23 = *(_DWORD *)v15;
  }
  else
  {
    [v10 initiatorDataAddress];
    id v22 = v11;
    v19 = id v18 = v9;
    objc_super v20 = [v19 data];
    [v20 length];
    __memcpy_chk();

    id v9 = v18;
    id v11 = v22;
  }

  [v10 initiatorDataAddress];
  v21 = +[NSString stringWithFormat:@"%.2X:%.2X:%.2X:%.2X:%.2X:%.2X", v23, BYTE1(v23), BYTE2(v23), HIBYTE(v23), v24, HIBYTE(v24)];
  [(NSMutableDictionary *)self->_wapDataSessionHandles setObject:v10 forKey:v21];
  if ([(WiFiHotspotNANInterface *)self staArrivecallback]) {
    ((void (*)(id, void *, void *))-[WiFiHotspotNANInterface staArrivecallback](self, "staArrivecallback"))([v10 datapathID], v21, -[WiFiHotspotNANInterface callbackContext](self, "callbackContext"));
  }
}

- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:message:3, @"WiFiAwarePublisher data session terminated for reason %d \n", a5];
  }
  __int16 v24 = 0;
  int v23 = 0;
  id v11 = [v9 initiatorDataAddress];
  id v12 = [v11 data];
  v13 = [v12 bytes];
  id v14 = [v9 initiatorDataAddress];
  v15 = [v14 data];
  if ((unint64_t)[v15 length] >= 6)
  {
    __int16 v24 = v13[2];
    int v23 = *(_DWORD *)v13;
  }
  else
  {
    [v9 initiatorDataAddress];
    id v22 = v9;
    char v16 = a5;
    v17 = a5 = (int64_t)v8;
    id v18 = [v17 data];
    [v18 length];
    __memcpy_chk();

    id v8 = (id)a5;
    LOBYTE(a5) = v16;
    id v9 = v22;
  }

  v19 = +[NSString stringWithFormat:@"%.2X:%.2X:%.2X:%.2X:%.2X:%.2X", v23, BYTE1(v23), BYTE2(v23), HIBYTE(v23), v24, HIBYTE(v24)];
  objc_super v20 = [(NSMutableDictionary *)self->_wapDataSessionHandles objectForKey:v19];

  if (v20)
  {
    [(NSMutableDictionary *)self->_wapDataSessionHandles removeObjectForKey:v19];
    if ([(WiFiHotspotNANInterface *)self staLeavecallback]) {
      ((void (*)(id, void *, void *))-[WiFiHotspotNANInterface staLeavecallback](self, "staLeavecallback"))([v9 datapathID], v19, -[WiFiHotspotNANInterface callbackContext](self, "callbackContext"));
    }
  }
  if ([(WiFiHotspotNANInterface *)self publisherMetricsCallback]) {
    ((void (*)(uint64_t, void, void *))[(WiFiHotspotNANInterface *)self publisherMetricsCallback])(1, a5, [(WiFiHotspotNANInterface *)self publisherMetricsCallbackContext]);
  }
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "NANPHS: _wapDataSessionHandles count %ld", -[NSMutableDictionary count](self->_wapDataSessionHandles, "count"));
  }
}

- (void)registerStaLeaveCallback:(void *)a3 withContext:(void *)a4
{
  [(WiFiHotspotNANInterface *)self setStaLeavecallback:a3];

  [(WiFiHotspotNANInterface *)self setCallbackContext:a4];
}

- (void)registerStaArriveCallback:(void *)a3 withContext:(void *)a4
{
  [(WiFiHotspotNANInterface *)self setStaArrivecallback:a3];

  [(WiFiHotspotNANInterface *)self setCallbackContext:a4];
}

- (void)registerClientDatapathEstablishedCallback:(void *)a3 withContext:(void *)a4 withNetworkContext:(void *)a5 withAssocData:(void *)a6 isAutoJoined:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  [(WiFiHotspotNANInterface *)self setStaDatapathEstablishedcallback:a3];
  [(WiFiHotspotNANInterface *)self setLinkEstablishedCallbackContext:a4];
  [(WiFiHotspotNANInterface *)self setEstablishedLinkNetwork:a5];
  [(WiFiHotspotNANInterface *)self setNanAssocData:a6];

  [(WiFiHotspotNANInterface *)self setIsAutoJoined:v7];
}

- (void)registerPublisherMetricCallback:(void *)a3 withContext:(void *)a4
{
  [(WiFiHotspotNANInterface *)self setPublisherMetricsCallback:a3];

  [(WiFiHotspotNANInterface *)self setPublisherMetricsCallbackContext:a4];
}

- (void)registerSubscriberMetricCallback:(void *)a3 withContext:(void *)a4
{
  [(WiFiHotspotNANInterface *)self setSubscriberMetricsCallback:a3];

  [(WiFiHotspotNANInterface *)self setSubscriberMetricsCallbackContext:a4];
}

- (void)registerSubscriberTimerCancelCallback:(void *)a3 withContext:(void *)a4
{
  [(WiFiHotspotNANInterface *)self setSubscriberCancelTimerCallback:a3];

  [(WiFiHotspotNANInterface *)self setSubscriberCancelTimerCallbackContext:a4];
}

- (void)registerClientDatapathTerminatedCallback:(void *)a3 withContext:(void *)a4
{
  [(WiFiHotspotNANInterface *)self setStaDatapathTerminatedcallback:a3];

  [(WiFiHotspotNANInterface *)self setLinkTerminatedCallbackContext:a4];
}

- (BOOL)isConnectedToSameNanNetwork:(__CFString *)a3
{
  v6 = (void *)qword_10027DD68;
  if (qword_10027DD68)
  {
    uint64_t v7 = [(WiFiAwareDataSession *)self->_waDataSession discoveryResult];
    id v8 = [v7 serviceName];
    id v9 = [(WiFiAwareDiscoveryResult *)self->_waDiscoveryResult serviceName];
    [v6 WFLog:3 message:@"NANPHS: %d %d _clientAssociated %d \n", v8 == 0, v9 == 0, self->_clientAssociated];
  }
  if (self->_clientAssociated
    && ([(WiFiAwareDataSession *)self->_waDataSession discoveryResult],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 serviceName],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v13 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      id v14 = [(WiFiAwareDataSession *)self->_waDataSession discoveryResult];
      v15 = [v14 serviceName];
      [v13 WFLog:3, "NANPHS: serviceNameCurrent %@ serviceNameConnectedTo %@", a3, v15 message];
    }
    char v16 = [(WiFiAwareDataSession *)self->_waDataSession discoveryResult];
    v17 = [v16 serviceName];
    unsigned int v18 = [(__CFString *)a3 isEqualToString:v17];
  }
  else
  {
    unsigned int v18 = 0;
  }
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "NANPHS: isSameNetwork %d", v18);
  }
  return v18;
}

- (void)subscriberStarted:(id)a3
{
  id v4 = a3;
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "WiFiAwareSubscriber started with subscriber=%@", v4 message];
  }
}

- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v7 = a3;
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:message:3, @"WiFiAwareSubscriber failed to start with errorString=%d", a4];
  }
  if ([(WiFiHotspotNANInterface *)self subscriberMetricsCallback]) {
    ((void (*)(void, void, void *))[(WiFiHotspotNANInterface *)self subscriberMetricsCallback])(0, a4, [(WiFiHotspotNANInterface *)self subscriberMetricsCallbackContext]);
  }
}

- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v7 = a3;
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "WiFiAwareSubscriber terminated with reasonString=%d", a4);
  }
  *(_WORD *)&self->_subscriberStoppedCallbackRcvd = 257;
  if ([(WiFiHotspotNANInterface *)self subscriberMetricsCallback]) {
    ((void (*)(uint64_t, void, void *))[(WiFiHotspotNANInterface *)self subscriberMetricsCallback])(2, a4, [(WiFiHotspotNANInterface *)self subscriberMetricsCallbackContext]);
  }
}

- (void)stopSubscriberForPHSOverNAN
{
  if (![(WiFiHotspotNANInterface *)self isSessionTerminated])
  {
    [(WiFiAwareDataSession *)self->_waDataSession stop];
    self->_sessionTerminated = 1;
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3 message:"WiFiAwareSubscriber Stopped datasession over NAN Subscriber"];
    }
  }
  if (![(WiFiHotspotNANInterface *)self isSubscriberStopped])
  {
    [(WiFiAwareSubscriber *)self->_wasPHSOverNAN stop];
    *(_WORD *)&self->_subscriberStoppedCallbackRcvd = 256;
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3 message:"WiFiAwareSubscriber Stopped PHS over NAN Subscriber"];
    }
  }
}

- (void)stopSubscriberAsNoNetworkFound
{
  if (![(WiFiHotspotNANInterface *)self isSubscriberStopped])
  {
    [(WiFiAwareSubscriber *)self->_wasPHSOverNAN stop];
    *(_WORD *)&self->_subscriberStoppedCallbackRcvd = 256;
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3 message:"WiFiAwareSubscriber stopSubscriberAsNoNetworkFound"];
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    id v4 = objc_initWeak(&location, self);
    if ([(WiFiHotspotNANInterface *)self staDatapathEstablishedcallback]) {
      ((void (*)(void, void, void, void, void, void *, void *, void, void, int))[(WiFiHotspotNANInterface *)self staDatapathEstablishedcallback])(0, 0, 0, 0, 0, [(WiFiHotspotNANInterface *)self linkEstablishedCallbackContext], [(WiFiHotspotNANInterface *)self nanAssocData], [(WiFiHotspotNANInterface *)self isAutoJoined], 0, 3);
    }

    objc_destroyWeak(&location);
  }
}

- (BOOL)isSessionTerminated
{
  return self->_sessionTerminated;
}

- (BOOL)isSubscriberStopped
{
  return self->_subscriberStopped;
}

- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  if (self->_clientAssociated && !self->_subscriberStoppedCallbackRcvd && (wasPHSOverNAN = self->_wasPHSOverNAN) != 0)
  {
    [(WiFiAwareSubscriber *)wasPHSOverNAN stop];
  }
  else
  {
    id v8 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      id v9 = [v6 serviceSpecificInfo];
      id v10 = [v9 instanceName];
      id v11 = [v6 serviceName];
      [v8 WFLog:3, "WiFiAwareSubscriber receivedDiscoveryResult with instance name %@, service name %@", v10, v11 message];
    }
    pwdList = self->_pwdList;
    if (pwdList && [(NSMutableArray *)pwdList count])
    {
      v13 = [v26 configuration];
      id v14 = [v13 serviceName];
      v15 = [v6 serviceName];
      unsigned int v16 = [v14 isEqualToString:v15];

      if (v16)
      {
        objc_storeStrong((id *)&self->_waDiscoveryResult, a4);
        id v17 = objc_alloc((Class)WiFiAwareDataSession);
        waDiscoveryResult = self->_waDiscoveryResult;
        v19 = [(NSMutableArray *)self->_pwdList objectAtIndexedSubscript:0];
        objc_super v20 = (WiFiAwareDataSession *)[v17 initWithDiscoveryResult:waDiscoveryResult serviceType:1 serviceSpecificInfo:0 passphrase:v19];
        waDataSession = self->_waDataSession;
        self->_waDataSession = v20;

        id v22 = +[WiFiAwareInternetSharingConfiguration requestInterentFromResponder];
        [(WiFiAwareDataSession *)self->_waDataSession setInternetSharingConfiguration:v22];

        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:3 message:"WiFiAwareSubscriber requestedInternetFromResponder"];
        }
        [(WiFiAwareDataSession *)self->_waDataSession setDelegate:self];
        self->_current_rssi = (int64_t)[(WiFiAwareDiscoveryResult *)self->_waDiscoveryResult rssi];
        [(WiFiAwareDataSession *)self->_waDataSession start];
      }
    }
    else
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3 message:"WiFiAwareSubscriber require passphrase"];
      }
      [(WiFiHotspotNANInterface *)self stopSubscriberForPHSOverNAN];
    }
  }
}

- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3 message:"WiFiAwareSubscriber lostDiscoveryResult stopping Subscriber now!"];
  }
  [v9 stop];
  self->_subscriberStopped = 1;
}

- (void)dataSessionRequestStarted:(id)a3
{
  id v7 = a3;
  self->_sessionTerminated = 0;
  id v5 = (void *)qword_10027DD68;
  if (qword_10027DD68)
  {
    id v6 = [v7 localDataAddress];
    [v5 WFLog:3, "WiFiAwareDataSession started, self nan data macAddress %@", v6 message];
  }
}

- (void)dataSession:(id)a3 updatedPeerRSSI:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  self->_current_rssi = (int)v4;
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:message:3, @"WiFiAwareDataSession updated Peer RSSI:%d", v4];
  }
}

- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v7 = a3;
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:message:3, @"WiFiAwareDataSession failed to start with errorString=%d", a4];
  }
  [(WiFiAwareSubscriber *)self->_wasPHSOverNAN stop];
  *(_WORD *)&self->_subscriberStoppedCallbackRcvd = 256;
}

- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v16 = a3;
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:message:3, @"WiFiAwareDataSession terminated with reasonString=%d", a4];
  }
  self->_sessionTerminated = 1;
  if ([(WiFiHotspotNANInterface *)self staDatapathTerminatedcallback]) {
    ((void (*)(NSString *, NSString *, int64_t, NSString *, int64_t, void *))[(WiFiHotspotNANInterface *)self staDatapathTerminatedcallback])(self->_networkMacAddr, self->_networkSsid, self->_current_rssi, self->_subscriber_ifname, a4, [(WiFiHotspotNANInterface *)self linkTerminatedCallbackContext]);
  }
  self->_clientAssociated = 0;
  curNetworkRecord = self->_curNetworkRecord;
  self->_curNetworkRecord = 0;

  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "NANPHS: did we hold off for starting subscriber %d \n", self->_subscriberHeldOffForPreviousDP)];
  }
  if (self->_subscriberHeldOffForPreviousDP && self->_networkSsidNext && self->_networkMacAddrNext)
  {
    id v9 = (NSString *)[objc_alloc((Class)NSString) initWithString:self->_networkSsidNext];
    networkSsid = self->_networkSsid;
    self->_networkSsid = v9;

    id v11 = (NSString *)[objc_alloc((Class)NSString) initWithString:self->_networkMacAddrNext];
    networkMacAddr = self->_networkMacAddr;
    self->_networkMacAddr = v11;

    [(WiFiAwareSubscriber *)self->_wasPHSOverNAN start];
    self->_subscriberStopped = 0;
    v13 = [(WiFiAwareSubscribeConfiguration *)self->_wasCfg serviceName];
    lastAssociatedNetworkServiceName = self->_lastAssociatedNetworkServiceName;
    self->_lastAssociatedNetworkServiceName = v13;

    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "NANPHS: Started PHS over NAN Subscribe for SSID [%@] MacAddress [%@]", self->_networkSsid, self->_networkMacAddr message];
    }
    self->_subscriberHeldOffForPreviousDP = 0;
  }
}

- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3 message:"WiFiAwareDataSession confirmedForPeer"];
  }
  self->_clientAssociated = 1;
  curNetworkRecord = self->_curNetworkRecord;
  self->_curNetworkRecord = 0;

  __int16 v26 = 0;
  int v25 = 0;
  memset(cStr, 170, sizeof(cStr));
  id v13 = [v9 data];
  id v14 = [v13 bytes];
  v15 = [v9 data];
  if ((unint64_t)[v15 length] >= 6)
  {
    int v17 = *(_DWORD *)v14;
    __int16 v26 = v14[2];
    int v25 = v17;
  }
  else
  {
    id v16 = [v9 data];
    [v16 length];
    __memcpy_chk();
  }
  [(WiFiAwareSubscriber *)self->_wasPHSOverNAN stop];
  self->_subscriberStoppedCallbackRcvd = 0;
  if ([(WiFiHotspotNANInterface *)self subscriberCancelTimerCallback]) {
    ((void (*)(void *))[(WiFiHotspotNANInterface *)self subscriberCancelTimerCallback])([(WiFiHotspotNANInterface *)self subscriberCancelTimerCallbackContext]);
  }
  self->_subscriber_ifindex = [v8 localInterfaceIndex];
  if (if_indextoname([(WiFiHotspotNANInterface *)self subscriber_ifindex], cStr))
  {
    CFStringCreateWithCString(0, cStr, 0x600u);
    unsigned int v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    subscriber_ifname = self->_subscriber_ifname;
    self->_subscriber_ifname = v18;
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s if_indextoname() Failed to get ifname for index:%d \n", "-[WiFiHotspotNANInterface dataSession:confirmedForPeerDataAddress:serviceSpecificInfo:]", self->_subscriber_ifindex);
    }
  }
  [(WiFiAwareDataSession *)self->_waDataSession setWantsPeerRSSIUpdates:1 withCompletionHandler:&stru_100240F48];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  waDataSession = self->_waDataSession;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000C0BD4;
  v22[3] = &unk_100240F70;
  v22[4] = self;
  objc_copyWeak(&v23, &location);
  [(WiFiAwareDataSession *)waDataSession generateCurrentNetworkRecordForInternetSharingSession:v22];
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (unsigned)isHotspotDeviceSupportNAN:(__CFString *)a3 withCFStringRef:(__CFString *)a4
{
  id v6 = +[NSArray arrayWithObjects:@"iPhone10,6", @"iPhone11,8", @"iPhone12,5", @"iPhone13,2", @"iPhone13,4", 0];
  unsigned int v7 = [v6 containsObject:a3];
  if (qword_10027DD68)
  {
    if (v7) {
      id v9 = "Device model %@ with OS version %@ supports NAN based PHS ";
    }
    else {
      id v9 = "Device model %@ with OS version %@ does not support NAN based PHS ";
    }
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, v9, a3, a4);
  }

  return v7;
}

- (void)createWAPConfig:(id)a3
{
  id v8 = a3;
  uint64_t v4 = (WiFiAwarePublishConfiguration *)[objc_alloc((Class)WiFiAwarePublishConfiguration) initWithServiceName:v8];
  wapCfg = self->_wapCfg;
  self->_wapCfg = v4;

  if (self->_wapCfg)
  {
    id v6 = objc_alloc_init((Class)WiFiAwarePublishServiceSpecificInfo);
    [(WiFiAwarePublishConfiguration *)self->_wapCfg setServiceSpecificInfo:v6];
    [(WiFiAwarePublishConfiguration *)self->_wapCfg setFurtherServiceDiscoveryRequired:0];
    [(WiFiAwarePublishConfiguration *)self->_wapCfg setAuthenticationType:0];
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: failed to create WiFiAwarePublishConfiguration", "-[WiFiHotspotNANInterface createWAPConfig:]")];
    }
  }
}

- (void)setPasswordForPHSOverNAN:(__CFString *)a3
{
  if (a3)
  {
    [(NSMutableArray *)self->_pwdList removeAllObjects];
    pwdList = self->_pwdList;
    [(NSMutableArray *)pwdList addObject:a3];
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: null password", "-[WiFiHotspotNANInterface setPasswordForPHSOverNAN:]")
    }
  }
}

- (void)setDataPathSecCfgForPHSOverNAN:(int64_t)a3
{
  id v6 = [objc_alloc((Class)WiFiAwarePublishDatapathSecurityConfiguration) initWithPMKList:&__NSArray0__struct passphraseList:self->_pwdList];
  id v5 = [objc_alloc((Class)WiFiAwarePublishDatapathConfiguration) initWithServiceType:a3 securityConfiguration:v6];
  [(WiFiAwarePublishConfiguration *)self->_wapCfg setDatapathConfiguration:v5];
}

- (void)setDeviceNameForPHSOverNAN:(__CFString *)a3
{
  uint64_t v4 = [(WiFiAwarePublishConfiguration *)self->_wapCfg serviceSpecificInfo];
  [v4 setInstanceName:a3];

  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "MIS deviceName set to %@ \n", a3 message];
  }
}

- (void)stopPublisherForPHSOverNAN
{
  v3 = [(NSMutableDictionary *)self->_wapDataSessionHandles allKeys];
  self->_nanPublisherState = 3;
  id v13 = v3;
  if ((int)[v3 count] >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      id v6 = (void *)qword_10027DD68;
      if (qword_10027DD68)
      {
        unsigned int v7 = [v13 objectAtIndexedSubscript:v4];
        [v6 WFLog:3, "NANPHS: Stopping NAN-DP of address: %@ ", v7 message];
      }
      wapPHSOverNAN = self->_wapPHSOverNAN;
      wapDataSessionHandles = self->_wapDataSessionHandles;
      id v10 = [v13 objectAtIndexedSubscript:v4];
      id v11 = [(NSMutableDictionary *)wapDataSessionHandles objectForKey:v10];
      [(WiFiAwarePublisher *)wapPHSOverNAN terminateDataSession:v11 completionHandler:0];

      ++v4;
    }
    while (v4 < (int)[v13 count]);
  }
  [(WiFiAwarePublisher *)self->_wapPHSOverNAN stop];
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3 message:"Stopping PHS over NAN Publish"];
  }
}

- (unsigned)isNANPublisherStarted
{
  return self->_nanPublisherState - 1 < 2;
}

- (void)startPublisherForPHSOverNAN
{
  self->_nanPublisherState = 1;
  v3 = +[WiFiAwareInternetSharingConfiguration provideInternetToInitiatorsFromInterface:@"pdp_ip0"];
  [(WiFiAwarePublishConfiguration *)self->_wapCfg setInternetSharingConfiguration:v3];

  uint64_t v4 = (WiFiAwarePublisher *)[objc_alloc((Class)WiFiAwarePublisher) initWithConfiguration:self->_wapCfg];
  wapPHSOverNAN = self->_wapPHSOverNAN;
  self->_wapPHSOverNAN = v4;

  [(WiFiAwarePublisher *)self->_wapPHSOverNAN setDelegate:self];
  [(WiFiAwarePublisher *)self->_wapPHSOverNAN start];
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3 message:"Starting PHS over NAN Publish"];
  }
}

- (void)createWASConfig:(id)a3
{
  id v8 = a3;
  uint64_t v4 = (WiFiAwareSubscribeConfiguration *)[objc_alloc((Class)WiFiAwareSubscribeConfiguration) initWithServiceName:v8];
  wasCfg = self->_wasCfg;
  self->_wasCfg = v4;

  id v6 = v8;
  if (!self->_wasCfg)
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3 message:"failed to create WiFiAwareSubscribeConfiguration"];
    }
    id v6 = v8;
  }
}

- (void)startSubscriberForPHSOverNAN:(id)a3 networkMacAddress:(id)a4
{
  id v40 = a3;
  id v6 = a4;
  if (!v40)
  {
    v38 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      v39 = "networkSsid is NULL";
LABEL_36:
      [v38 WFLog:3 message:v39];
    }
LABEL_37:
    v36 = v37;
LABEL_28:
    goto LABEL_29;
  }
  if (!v6)
  {
    v38 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      v39 = "networkMacAddr is NULL";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  [(WiFiAwareSubscribeConfiguration *)self->_wasCfg setAuthenticationType:0];
  unsigned int v7 = (WiFiAwareSubscriber *)[objc_alloc((Class)WiFiAwareSubscriber) initWithConfiguration:self->_wasCfg];
  wasPHSOverNAN = self->_wasPHSOverNAN;
  self->_wasPHSOverNAN = v7;

  [(WiFiAwareSubscriber *)self->_wasPHSOverNAN setDelegate:self];
  id v10 = (void *)qword_10027DD68;
  if (qword_10027DD68)
  {
    lastAssociatedNetworkServiceName = self->_lastAssociatedNetworkServiceName;
    id v12 = [(WiFiAwareSubscribeConfiguration *)self->_wasCfg serviceName];
    [v10 WFLog:3, "WiFiAwareSubscriber _lastAssociatedNetworkServiceName %@ currentServicename %@ ", lastAssociatedNetworkServiceName, v12 message];
  }
  if (self->_lastAssociatedNetworkServiceName
    && ([(WiFiAwareSubscribeConfiguration *)self->_wasCfg serviceName],
        id v13 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v14 = [v13 isEqualToString:self->_lastAssociatedNetworkServiceName],
        v13,
        (v14 & 1) != 0))
  {
    p_macRandomizationTransactionState = &self->_macRandomizationTransactionState;
    if ((self->_macRandomizationTransactionState | 2) != 2) {
      goto LABEL_21;
    }
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"WiFiAwareSubscriber Enabling mac randomization, starting P2P transaction"];
    }
    int v17 = +[WiFiP2PSPITransactionRequestor shared];
    unsigned int v18 = v17;
    v19 = &stru_100240FF0;
  }
  else
  {
    p_macRandomizationTransactionState = &self->_macRandomizationTransactionState;
    if ((self->_macRandomizationTransactionState | 2) == 2)
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3 message:@"WiFiAwareSubscriber Enabling mac randomization, starting P2P transaction"];
      }
      int v17 = +[WiFiP2PSPITransactionRequestor shared];
      unsigned int v18 = v17;
      v19 = &stru_100240F90;
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3 message:@"WiFiAwareSubscriber Disabling mac randomization, ending P2P transaction"];
      }
      id v22 = +[WiFiP2PSPITransactionRequestor shared];
      [v22 endTransaction:16 completionHandler:&stru_100240FB0];

      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:message:3, @"WiFiAwareSubscriber Enabling mac randomization, starting P2P transaction"];
      }
      int v17 = +[WiFiP2PSPITransactionRequestor shared];
      unsigned int v18 = v17;
      v19 = &stru_100240FD0;
    }
  }
  [v17 beginTransaction:16 completionHandler:v19];

  int *p_macRandomizationTransactionState = 1;
LABEL_21:
  if (!self->_clientAssociated)
  {
    v29 = (NSString *)[objc_alloc((Class)NSString) initWithString:v40];
    networkSsid = self->_networkSsid;
    self->_networkSsid = v29;

    v31 = (NSString *)[objc_alloc((Class)NSString) initWithString:v6];
    networkMacAddr = self->_networkMacAddr;
    self->_networkMacAddr = v31;

    [(WiFiAwareSubscriber *)self->_wasPHSOverNAN start];
    self->_subscriberStopped = 0;
    v33 = [(WiFiAwareSubscribeConfiguration *)self->_wasCfg serviceName];
    v34 = self->_lastAssociatedNetworkServiceName;
    self->_lastAssociatedNetworkServiceName = v33;

    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "NANPHS: Started PHS over NAN Subscribe for SSID [%@] MacAddress [%@]", self->_networkSsid, self->_networkMacAddr message];
    }
    v36 = v35;
    goto LABEL_28;
  }
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3 message:"NANPHS: holding off for starting subscriber until DP terminate \n"];
  }
  int v25 = (NSString *)[objc_alloc((Class)NSString) initWithString:v40];
  networkSsidNext = self->_networkSsidNext;
  self->_networkSsidNext = v25;

  v27 = (NSString *)[objc_alloc((Class)NSString) initWithString:v6];
  networkMacAddrNext = self->_networkMacAddrNext;
  self->_networkMacAddrNext = v27;

  self->_subscriberHeldOffForPreviousDP = 1;
LABEL_29:
}

- (BOOL)checkDeviceNanCapabilities
{
  v2 = +[WiFiAwareDeviceCapabilities currentDeviceCapabilities];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setLastAssociatedServiceName:(id)a3
{
}

- (WiFiAwareSubscriber)wasPHSOverNAN
{
  return (WiFiAwareSubscriber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWasPHSOverNAN:(id)a3
{
}

- (WiFiAwareDataSession)waDataSession
{
  return (WiFiAwareDataSession *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWaDataSession:(id)a3
{
}

- (WiFiAwarePublisher)wapPHSOverNAN
{
  return (WiFiAwarePublisher *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWapPHSOverNAN:(id)a3
{
}

- (WiFiAwarePublishConfiguration)wapCfg
{
  return (WiFiAwarePublishConfiguration *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWapCfg:(id)a3
{
}

- (WiFiAwareSubscribeConfiguration)wasCfg
{
  return (WiFiAwareSubscribeConfiguration *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWasCfg:(id)a3
{
}

- (WiFiAwareDiscoveryResult)waDiscoveryResult
{
  return (WiFiAwareDiscoveryResult *)objc_getProperty(self, a2, 72, 1);
}

- (void)setWaDiscoveryResult:(id)a3
{
}

- (WiFiAwareDiscoveryResult)waDiscoveryResultCrashRecovery
{
  return (WiFiAwareDiscoveryResult *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWaDiscoveryResultCrashRecovery:(id)a3
{
}

- (WiFiAwarePublisherDataSessionHandle)wapDataSession
{
  return (WiFiAwarePublisherDataSessionHandle *)objc_getProperty(self, a2, 88, 1);
}

- (void)setWapDataSession:(id)a3
{
}

- (NSMutableDictionary)wapDataSessionHandles
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWapDataSessionHandles:(id)a3
{
}

- (NSMutableArray)pwdList
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPwdList:(id)a3
{
}

- (NSString)networkSsid
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setNetworkSsid:(id)a3
{
}

- (NSString)networkSsidNext
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNetworkSsidNext:(id)a3
{
}

- (NSString)networkMacAddrNext
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNetworkMacAddrNext:(id)a3
{
}

- (NSString)lastAssociatedNetworkServiceName
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLastAssociatedNetworkServiceName:(id)a3
{
}

- (NSString)networkMacAddr
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setNetworkMacAddr:(id)a3
{
}

- (unsigned)subscriber_ifindex
{
  return self->_subscriber_ifindex;
}

- (int64_t)current_rssi
{
  return self->_current_rssi;
}

- (NSString)subscriber_ifname
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSDictionary)curNetworkRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCurNetworkRecord:(id)a3
{
}

- (void)setSessionTerminated:(BOOL)a3
{
  self->_sessionTerminated = a3;
}

- (void)setClientAssociated:(BOOL)a3
{
  self->_clientAssociated = a3;
}

- (BOOL)subscriberStoppedCallbackRcvd
{
  return self->_subscriberStoppedCallbackRcvd;
}

- (void)setSubscriberStoppedCallbackRcvd:(BOOL)a3
{
  self->_subscriberStoppedCallbackRcvd = a3;
}

- (void)setSubscriberStopped:(BOOL)a3
{
  self->_subscriberStopped = a3;
}

- (BOOL)subscriberHeldOffForPreviousDP
{
  return self->_subscriberHeldOffForPreviousDP;
}

- (void)setSubscriberHeldOffForPreviousDP:(BOOL)a3
{
  self->_subscriberHeldOffForPreviousDP = a3;
}

- (int)macRandomizationTransactionState
{
  return self->_macRandomizationTransactionState;
}

- (void)setMacRandomizationTransactionState:(int)a3
{
  self->_macRandomizationTransactionState = a3;
}

- (unsigned)nanPublisherState
{
  return self->_nanPublisherState;
}

- (void)setNanPublisherState:(unsigned int)a3
{
  self->_nanPublisherState = a3;
}

- (void)staLeavecallback
{
  return self->_staLeavecallback;
}

- (void)setStaLeavecallback:(void *)a3
{
  self->_staLeavecallback = a3;
}

- (void)staArrivecallback
{
  return self->_staArrivecallback;
}

- (void)setStaArrivecallback:(void *)a3
{
  self->_staArrivecallback = a3;
}

- (void)publisherMetricsCallback
{
  return self->_publisherMetricsCallback;
}

- (void)setPublisherMetricsCallback:(void *)a3
{
  self->_publisherMetricsCallback = a3;
}

- (void)publisherMetricsCallbackContext
{
  return self->_publisherMetricsCallbackContext;
}

- (void)setPublisherMetricsCallbackContext:(void *)a3
{
  self->_publisherMetricsCallbackContext = a3;
}

- (void)subscriberMetricsCallback
{
  return self->_subscriberMetricsCallback;
}

- (void)setSubscriberMetricsCallback:(void *)a3
{
  self->_subscriberMetricsCallback = a3;
}

- (void)subscriberMetricsCallbackContext
{
  return self->_subscriberMetricsCallbackContext;
}

- (void)setSubscriberMetricsCallbackContext:(void *)a3
{
  self->_subscriberMetricsCallbackContext = a3;
}

- (void)subscriberCancelTimerCallback
{
  return self->_subscriberCancelTimerCallback;
}

- (void)setSubscriberCancelTimerCallback:(void *)a3
{
  self->_subscriberCancelTimerCallback = a3;
}

- (void)subscriberCancelTimerCallbackContext
{
  return self->_subscriberCancelTimerCallbackContext;
}

- (void)setSubscriberCancelTimerCallbackContext:(void *)a3
{
  self->_subscriberCancelTimerCallbackContext = a3;
}

- (void)staDatapathEstablishedcallback
{
  return self->_staDatapathEstablishedcallback;
}

- (void)setStaDatapathEstablishedcallback:(void *)a3
{
  self->_staDatapathEstablishedcallback = a3;
}

- (void)callbackContext
{
  return self->_callbackContext;
}

- (void)setCallbackContext:(void *)a3
{
  self->_callbackContext = a3;
}

- (void)linkEstablishedCallbackContext
{
  return self->_linkEstablishedCallbackContext;
}

- (void)setLinkEstablishedCallbackContext:(void *)a3
{
  self->_linkEstablishedCallbackContext = a3;
}

- (void)establishedLinkNetwork
{
  return self->_establishedLinkNetwork;
}

- (void)setEstablishedLinkNetwork:(void *)a3
{
  self->_establishedLinkNetwork = a3;
}

- (void)nanAssocData
{
  return self->_nanAssocData;
}

- (void)setNanAssocData:(void *)a3
{
  self->_nanAssocData = a3;
}

- (unsigned)isAutoJoined
{
  return self->_isAutoJoined;
}

- (void)setIsAutoJoined:(unsigned __int8)a3
{
  self->_isAutoJoined = a3;
}

- (void)staDatapathTerminatedcallback
{
  return self->_staDatapathTerminatedcallback;
}

- (void)setStaDatapathTerminatedcallback:(void *)a3
{
  self->_staDatapathTerminatedcallback = a3;
}

- (void)linkTerminatedCallbackContext
{
  return self->_linkTerminatedCallbackContext;
}

- (void)setLinkTerminatedCallbackContext:(void *)a3
{
  self->_linkTerminatedCallbackContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curNetworkRecord, 0);
  objc_storeStrong((id *)&self->_subscriber_ifname, 0);
  objc_storeStrong((id *)&self->_networkMacAddr, 0);
  objc_storeStrong((id *)&self->_lastAssociatedNetworkServiceName, 0);
  objc_storeStrong((id *)&self->_networkMacAddrNext, 0);
  objc_storeStrong((id *)&self->_networkSsidNext, 0);
  objc_storeStrong((id *)&self->_networkSsid, 0);
  objc_storeStrong((id *)&self->_pwdList, 0);
  objc_storeStrong((id *)&self->_wapDataSessionHandles, 0);
  objc_storeStrong((id *)&self->_wapDataSession, 0);
  objc_storeStrong((id *)&self->_waDiscoveryResultCrashRecovery, 0);
  objc_storeStrong((id *)&self->_waDiscoveryResult, 0);
  objc_storeStrong((id *)&self->_wasCfg, 0);
  objc_storeStrong((id *)&self->_wapCfg, 0);
  objc_storeStrong((id *)&self->_wapPHSOverNAN, 0);
  objc_storeStrong((id *)&self->_waDataSession, 0);

  objc_storeStrong((id *)&self->_wasPHSOverNAN, 0);
}

@end