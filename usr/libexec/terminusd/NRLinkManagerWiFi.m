@interface NRLinkManagerWiFi
- (id)copyName;
- (id)copyStatusString;
- (void)cancel;
- (void)dealloc;
- (void)handleThermalStateUpdate;
- (void)invalidateManager;
- (void)linkDidReceiveData:(id)a3 data:(id)a4;
- (void)linkIsAvailable:(id)a3;
- (void)linkIsReady:(id)a3;
- (void)linkIsSuspended:(id)a3;
- (void)linkIsUnavailable:(id)a3;
@end

@implementation NRLinkManagerWiFi

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phsStateUpdateDelegates, 0);
  objc_storeStrong((id *)&self->_lastAssertionReport, 0);
  objc_storeStrong((id *)&self->_assertionClientDictionary, 0);
  objc_storeStrong((id *)&self->_assertionReasonDictionary, 0);
  objc_storeStrong((id *)&self->_directToCloudAgent, 0);
  objc_storeStrong((id *)&self->_wifiAutojoinClients, 0);
  objc_storeStrong((id *)&self->_directToCloudActivity, 0);
  objc_storeStrong((id *)&self->_backgroundActivity, 0);
  objc_storeStrong((id *)&self->_wowActivity, 0);
  objc_storeStrong((id *)&self->_coreWiFiHandle, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_destroyWeak((id *)&self->_wifiManagerDelegate);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_scdKeyMIS, 0);
  objc_storeStrong((id *)&self->_irInterfaceConfig, 0);
  objc_storeStrong((id *)&self->_nanInterfaceConfig, 0);
  objc_storeStrong((id *)&self->_awdlInterfaceConfig, 0);
  objc_storeStrong((id *)&self->_wifiInterfaceConfig, 0);
  objc_storeStrong((id *)&self->_peerWiFiSignature, 0);
  objc_storeStrong((id *)&self->_localWiFiSignature, 0);
  objc_storeStrong((id *)&self->_peerWiFiEndpoint, 0);
  objc_storeStrong((id *)&self->_localAWDLEndpoint, 0);

  objc_storeStrong((id *)&self->_localWiFiEndpoint, 0);
}

- (void)handleThermalStateUpdate
{
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  v4 = queue;
  dispatch_assert_queue_V2(v4);

  self;
  if (qword_1001F4A20 != -1) {
    dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
  }
  v5 = (id)qword_1001F4A18;
  if (v5 && (unsigned int v6 = v5[5], v5, v6 >= 0x1E))
  {
    if (self) {
      links = self->_links;
    }
    else {
      links = 0;
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = [(NSMutableSet *)links copy];
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v13, "subtype", (void)v14) == 102) {
            [v13 cancelWithReason:@"critical thermal state reached"];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  else
  {
    sub_10014D43C((uint64_t)self);
  }
}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self)
  {
    dispatch_assert_queue_V2(0);
    [0 reportEvent:2008];
    queue = 0;
    goto LABEL_10;
  }
  id v8 = self->super._queue;
  dispatch_assert_queue_V2((dispatch_queue_t)v8);

  [(NRLinkManager *)self reportEvent:2008];
  if (self->super._state != 1004)
  {
    queue = self->super._queue;
LABEL_10:
    id v10 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014DE9C;
    block[3] = &unk_1001C8868;
    block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v10, block);

    goto LABEL_11;
  }
  if (qword_1001F4DC0 != -1) {
    dispatch_once(&qword_1001F4DC0, &stru_1001C89F0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4DC0 != -1) {
      dispatch_once(&qword_1001F4DC0, &stru_1001C89F0);
    }
    _NRLogWithArgs();
  }
LABEL_11:
}

- (void)linkIsUnavailable:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    [(NRLinkManager *)self reportEvent:2007];
    if (self)
    {
      if (self->super._state == 1004)
      {
        if (qword_1001F4DC0 != -1) {
          dispatch_once(&qword_1001F4DC0, &stru_1001C89F0);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4DC0 != -1) {
            dispatch_once(&qword_1001F4DC0, &stru_1001C89F0);
          }
          _NRLogWithArgs();
        }
        goto LABEL_14;
      }
      [(NSMutableSet *)self->_links removeObject:v4];
      id v7 = self->super._queue;
    }
    else
    {
      [0 removeObject:v4];
      id v7 = 0;
    }
    id v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014E144;
    block[3] = &unk_1001C8840;
    block[4] = self;
    id v13 = v4;
    dispatch_async(v8, block);

    goto LABEL_14;
  }
  id v9 = sub_10014E0F0();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v11 = sub_10014E0F0();
    _NRLogWithArgs();
  }
LABEL_14:
}

- (void)linkIsSuspended:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    [(NRLinkManager *)self reportEvent:2006];
    if (self)
    {
      if (self->super._state == 1004)
      {
        if (qword_1001F4DC0 != -1) {
          dispatch_once(&qword_1001F4DC0, &stru_1001C89F0);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4DC0 != -1) {
            dispatch_once(&qword_1001F4DC0, &stru_1001C89F0);
          }
          _NRLogWithArgs();
        }
        goto LABEL_14;
      }
      id v7 = self->super._queue;
    }
    else
    {
      id v7 = 0;
    }
    id v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100150868;
    block[3] = &unk_1001C8840;
    id v13 = v4;
    long long v14 = self;
    dispatch_async(v8, block);

    goto LABEL_14;
  }
  id v9 = sub_10014E0F0();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v11 = sub_10014E0F0();
    _NRLogWithArgs();
  }
LABEL_14:
}

- (void)linkIsReady:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    [(NRLinkManager *)self reportEvent:2005];
    if (self)
    {
      if (self->super._state == 1004)
      {
        if (qword_1001F4DC0 != -1) {
          dispatch_once(&qword_1001F4DC0, &stru_1001C89F0);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4DC0 != -1) {
            dispatch_once(&qword_1001F4DC0, &stru_1001C89F0);
          }
          _NRLogWithArgs();
        }
        goto LABEL_14;
      }
      id v7 = self->super._queue;
    }
    else
    {
      id v7 = 0;
    }
    id v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100150B5C;
    block[3] = &unk_1001C8840;
    id v13 = v4;
    long long v14 = self;
    dispatch_async(v8, block);

    goto LABEL_14;
  }
  id v9 = sub_10014E0F0();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v11 = sub_10014E0F0();
    _NRLogWithArgs();
  }
LABEL_14:
}

- (void)linkIsAvailable:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    [(NRLinkManager *)self reportEvent:2004];
    if (self)
    {
      if (self->super._state == 1004)
      {
        if (qword_1001F4DC0 != -1) {
          dispatch_once(&qword_1001F4DC0, &stru_1001C89F0);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4DC0 != -1) {
            dispatch_once(&qword_1001F4DC0, &stru_1001C89F0);
          }
          _NRLogWithArgs();
        }
        goto LABEL_14;
      }
      [(NSMutableSet *)self->_links addObject:v4];
      id v7 = self->super._queue;
    }
    else
    {
      [0 addObject:v4];
      id v7 = 0;
    }
    id v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100150E70;
    block[3] = &unk_1001C8840;
    id v13 = v4;
    long long v14 = self;
    dispatch_async(v8, block);

    goto LABEL_14;
  }
  id v9 = sub_10014E0F0();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v11 = sub_10014E0F0();
    _NRLogWithArgs();
  }
LABEL_14:
}

- (id)copyStatusString
{
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v4 = queue;
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc_init((Class)NSMutableString);
  id v6 = [(NRLinkManagerWiFi *)self copyName];
  [v5 appendFormat:@"\nName: %@", v6];

  StringFromNRLinkType = (void *)createStringFromNRLinkType();
  [v5 appendFormat:@"\nLinkManager type: %@", StringFromNRLinkType];

  if (self) {
    uint64_t state = self->super._state;
  }
  else {
    uint64_t state = 0;
  }
  id v9 = sub_1000AB278(state);
  [v5 appendFormat:@"\nState: %@", v9];

  if (self)
  {
    [v5 appendFormat:@"\nLinks: %@", self->_links];
    [v5 appendFormat:@"\nWiFi Interface config: %@", self->_wifiInterfaceConfig];
    [v5 appendFormat:@"\nAWDL Interface config: %@", self->_awdlInterfaceConfig];
    [v5 appendFormat:@"\nNAN Interface config: %@", self->_nanInterfaceConfig];
    [v5 appendFormat:@"\nIR Interface config: %@", self->_irInterfaceConfig];
    if (self->_wowActivity) {
      id v10 = "YES";
    }
    else {
      id v10 = "NO";
    }
    [v5 appendFormat:@"\nWiFi WoW Enabled: %s", v10];
    [v5 appendFormat:@"\nWiFi Client Type: %zd", self->_currentWiFiClientType];
    [v5 appendFormat:@"\nLocal WiFi Endpoint: %@", self->_localWiFiEndpoint];
    [v5 appendFormat:@"\nLocal WiFi Signature: %@", self->_localWiFiSignature];
    [v5 appendFormat:@"\nRemote WiFi Signature: %@", self->_peerWiFiSignature];
    wifiInterfaceConfig = self->_wifiInterfaceConfig;
    if (wifiInterfaceConfig) {
      wifiInterfaceConfig = (NRSCDInterfaceConfig *)wifiInterfaceConfig->_peerEndpointDictionary;
    }
    id v12 = wifiInterfaceConfig;
    [v5 appendFormat:@"\nRemote WiFi Endpoints: %@", v12];

    awdlInterfaceConfig = self->_awdlInterfaceConfig;
    if (awdlInterfaceConfig) {
      awdlInterfaceConfig = (NRSCDInterfaceConfig *)awdlInterfaceConfig->_peerEndpointDictionary;
    }
  }
  else
  {
    [v5 appendFormat:@"\nLinks: %@", 0];
    [v5 appendFormat:@"\nWiFi Interface config: %@", 0];
    [v5 appendFormat:@"\nAWDL Interface config: %@", 0];
    [v5 appendFormat:@"\nNAN Interface config: %@", 0];
    [v5 appendFormat:@"\nIR Interface config: %@", 0];
    [v5 appendFormat:@"\nWiFi WoW Enabled: %s", @"NO"];
    [v5 appendFormat:@"\nWiFi Client Type: %zd", 0];
    [v5 appendFormat:@"\nLocal WiFi Endpoint: %@", 0];
    [v5 appendFormat:@"\nLocal WiFi Signature: %@", 0];
    [v5 appendFormat:@"\nRemote WiFi Signature: %@", 0];
    [v5 appendFormat:@"\nRemote WiFi Endpoints: %@", 0];
    awdlInterfaceConfig = 0;
  }
  long long v14 = awdlInterfaceConfig;
  [v5 appendFormat:@"\nRemote AWDL EndpointDict: %@", v14];

  if (self)
  {
    nanInterfaceConfig = self->_nanInterfaceConfig;
    if (nanInterfaceConfig) {
      nanInterfaceConfig = (NRSCDInterfaceConfig *)nanInterfaceConfig->_peerEndpointDictionary;
    }
    long long v16 = nanInterfaceConfig;
    [v5 appendFormat:@"\nRemote NAN EndpointDict: %@", v16];

    irInterfaceConfig = self->_irInterfaceConfig;
    if (irInterfaceConfig) {
      irInterfaceConfig = (NRSCDInterfaceConfig *)irInterfaceConfig->_peerEndpointDictionary;
    }
  }
  else
  {
    [v5 appendFormat:@"\nRemote NAN EndpointDict: %@", 0];
    irInterfaceConfig = 0;
  }
  v18 = irInterfaceConfig;
  [v5 appendFormat:@"\nRemote IR EndpointDict: %@", v18];

  if (self)
  {
    [v5 appendFormat:@"\nPrefer WiFi asserts: %d", self->_preferWiFiAsserts];
    uint64_t clearedPreferWiFiAssertCounts = self->_clearedPreferWiFiAssertCounts;
  }
  else
  {
    [v5 appendFormat:@"\nPrefer WiFi asserts: %d", 0];
    uint64_t clearedPreferWiFiAssertCounts = 0;
  }
  [v5 appendFormat:@"\nCleared Prefer WiFi asserts: %d", clearedPreferWiFiAssertCounts];
  return v5;
}

- (id)copyName
{
  return @"Link Manager - WiFi";
}

- (void)dealloc
{
  if (qword_1001F4DC0 != -1) {
    dispatch_once(&qword_1001F4DC0, &stru_1001C89F0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4DC0 != -1) {
      dispatch_once(&qword_1001F4DC0, &stru_1001C89F0);
    }
    id v3 = (id)qword_1001F4DB8;
    uint64_t v6 = 297;
    id v7 = [(NRLinkManagerWiFi *)self copyName];
    id v4 = "";
    id v5 = "-[NRLinkManagerWiFi dealloc]";
    _NRLogWithArgs();
  }
  [(NRLinkManagerWiFi *)self invalidateManager];
  v8.receiver = self;
  v8.super_class = (Class)NRLinkManagerWiFi;
  [(NRLinkManagerWiFi *)&v8 dealloc];
}

- (void)invalidateManager
{
  v19.receiver = self;
  v19.super_class = (Class)NRLinkManagerWiFi;
  [(NRLinkManager *)&v19 invalidateManager];
  if (self)
  {
    scdynamicStoreRef = self->_scdynamicStoreRef;
    if (scdynamicStoreRef)
    {
      SCDynamicStoreSetDispatchQueue(scdynamicStoreRef, 0);
      id v4 = self->_scdynamicStoreRef;
      if (v4)
      {
        CFRelease(v4);
        self->_scdynamicStoreRef = 0;
      }
    }
    coreWiFiHandle = self->_coreWiFiHandle;
    if (coreWiFiHandle)
    {
      uint64_t v6 = coreWiFiHandle;
      if (qword_1001F4DC8 != -1) {
        dispatch_once(&qword_1001F4DC8, &stru_1001C8A10);
      }
      id v7 = qword_1001F4DD0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100151724;
      block[3] = &unk_1001C8BA8;
      objc_super v8 = v6;
      v18 = v8;
      dispatch_async(v7, block);
      id v9 = self->_coreWiFiHandle;
      self->_coreWiFiHandle = 0;

      wowActivity = self->_wowActivity;
      self->_wowActivity = 0;

      backgroundActivity = self->_backgroundActivity;
      self->_backgroundActivity = 0;

      directToCloudActivity = self->_directToCloudActivity;
      self->_directToCloudActivity = 0;
    }
    sub_10015172C((uint64_t)self, 0);
    wifiAutojoinClients = self->_wifiAutojoinClients;
    self->_wifiAutojoinClients = 0;

    assertionReasonDictionary = self->_assertionReasonDictionary;
    self->_assertionReasonDictionary = 0;

    assertionClientDictionary = self->_assertionClientDictionary;
    self->_assertionClientDictionary = 0;

    lastAssertionReport = self->_lastAssertionReport;
    self->_lastAssertionReport = 0;

    sub_10014F76C((uint64_t)self);
  }
  else
  {
    sub_10015172C(0, 0);
  }
}

- (void)cancel
{
  if (self)
  {
    id v3 = self->super._queue;
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

    [(NRLinkManager *)self reportEvent:2003];
    if (self->super._state == 1004)
    {
      if (qword_1001F4DC0 != -1) {
        dispatch_once(&qword_1001F4DC0, &stru_1001C89F0);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4DC0 != -1) {
          dispatch_once(&qword_1001F4DC0, &stru_1001C89F0);
        }
        _NRLogWithArgs();
      }
      return;
    }
    self->super._uint64_t state = 1004;
    [(NRLinkManagerWiFi *)self invalidateManager];
    links = self->_links;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    [0 reportEvent:2003];
    [0 invalidateManager];
    links = 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSMutableSet *)links copy];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) cancelWithReason:@"Cancelling all links"];
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self) {
    id v10 = self->_links;
  }
  else {
    id v10 = 0;
  }
  [(NSMutableSet *)v10 removeAllObjects];
}

@end