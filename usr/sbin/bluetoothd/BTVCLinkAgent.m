@interface BTVCLinkAgent
+ (BTVCLinkAgent)sharedBTVCLinkAgent;
- (BOOL)_bleBTVCLinkAdvertiserShouldAdvertise;
- (BOOL)_bleBTVCLinkScannerShouldScan;
- (BOOL)_isAdvertisingEnabled;
- (BOOL)_isAdvertisingEnabled:(unsigned __int8)a3;
- (BOOL)isAdvertisingEnabled:(unsigned __int8)a3;
- (BOOL)isScanningEnabled;
- (BTVCLinkAgent)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)_getBTVCLinkAdvertiserSet:(unsigned __int8)a3;
- (id)advReportReceiveHandler;
- (id)description;
- (void)_activate;
- (void)_bleBTVCLinkAdvertiserEnsureStarted;
- (void)_bleBTVCLinkAdvertiserEnsureStopped;
- (void)_bleBTVCLinkScannerEnsureStarted;
- (void)_bleBTVCLinkScannerEnsureStopped;
- (void)_invalidate;
- (void)_receivedAdvReport:(int64_t)a3 withData:(id)a4 fromPeer:(id)a5 peerInfo:(id)a6;
- (void)_resetAdvertisingEnable;
- (void)_systemHasPoweredOn;
- (void)_systemWillSleep;
- (void)_update;
- (void)activate;
- (void)invalidate;
- (void)leSetAdvertisingSetRandomAddress:(unsigned __int8)a3 address:(id)a4;
- (void)leSetExtendedAdvertisingData:(unsigned __int8)a3 advertisingData:(id)a4;
- (void)leSetExtendedAdvertisingEnable:(BOOL)a3 numSets:(unsigned __int8)a4 advertisingHandles:(char *)a5;
- (void)leSetExtendedAdvertisingParameters:(unsigned __int8)a3 advertisingParameters:(id)a4;
- (void)leSetExtendedScanEnable:(BOOL)a3;
- (void)prefsChanged;
- (void)reset;
- (void)setAdvReportReceiveHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)update;
@end

@implementation BTVCLinkAgent

+ (BTVCLinkAgent)sharedBTVCLinkAgent
{
  if (qword_100A131A8 != -1) {
    dispatch_once(&qword_100A131A8, &stru_1009ACC78);
  }
  v2 = (void *)qword_100A19B20;

  return (BTVCLinkAgent *)v2;
}

- (BTVCLinkAgent)init
{
  v5.receiver = self;
  v5.super_class = (Class)BTVCLinkAgent;
  v2 = [(BTVCLinkAgent *)&v5 init];
  if (v2)
  {
    if (qword_100A131B8 != -1) {
      dispatch_once(&qword_100A131B8, &stru_1009ACC98);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)qword_100A131B0);
    v3 = v2;
  }

  return v2;
}

- (id)description
{
  NSAppendPrintF();
  id v3 = 0;
  v4 = v3;
  if (self->_bleBTVCLinkAdvertiser)
  {
    v8 = v3;
    NSAppendPrintF();
    id v5 = v8;

    v4 = v5;
  }
  if (self->_bleBTVCLinkScanner)
  {
    NSAppendPrintF();
    id v6 = v4;

    v4 = v6;
  }

  return v4;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003FCE2C;
  block[3] = &unk_100997450;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v3 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAgent] Activate\n", v14, 2u);
  }
  self->_activated = 1;
  self->_startTime = CFAbsoluteTimeGetCurrent();
  if (!self->_bleBTVCLinkAdvertiseSets)
  {
    int v4 = 6;
    id v5 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:6];
    bleBTVCLinkAdvertiseSets = self->_bleBTVCLinkAdvertiseSets;
    self->_bleBTVCLinkAdvertiseSets = v5;

    do
    {
      v7 = objc_alloc_init(BTVCLinkAdvertiseSet);
      v7->enable = 0;
      v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      address = v7->address;
      v7->address = v8;

      v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      parameters = v7->parameters;
      v7->parameters = v10;

      v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      data = v7->data;
      v7->data = v12;

      [(NSMutableArray *)self->_bleBTVCLinkAdvertiseSets addObject:v7];
      --v4;
    }
    while (v4);
  }
  [(BTVCLinkAgent *)self prefsChanged];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003FCFF8;
  block[3] = &unk_100997450;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v3 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAgent] Invalidate\n", v5, 2u);
  }
  [(BTVCLinkAgent *)self _bleBTVCLinkAdvertiserEnsureStopped];
  [(BTVCLinkAgent *)self _bleBTVCLinkScannerEnsureStopped];
  bleBTVCLinkAdvertiseSets = self->_bleBTVCLinkAdvertiseSets;
  self->_bleBTVCLinkAdvertiseSets = 0;

  self->_activated = 0;
}

- (void)prefsChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);

  [(BTVCLinkAgent *)self _update];
}

- (void)update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);

  [(BTVCLinkAgent *)self _update];
}

- (void)_update
{
  id v3 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[BTVCLinkAgent _update]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s\n", (uint8_t *)&v5, 0xCu);
  }
  if (self->_activated)
  {
    if ([(BTVCLinkAgent *)self _bleBTVCLinkAdvertiserShouldAdvertise]) {
      [(BTVCLinkAgent *)self _bleBTVCLinkAdvertiserEnsureStarted];
    }
    else {
      [(BTVCLinkAgent *)self _bleBTVCLinkAdvertiserEnsureStopped];
    }
    if ([(BTVCLinkAgent *)self _bleBTVCLinkScannerShouldScan]) {
      [(BTVCLinkAgent *)self _bleBTVCLinkScannerEnsureStarted];
    }
    else {
      [(BTVCLinkAgent *)self _bleBTVCLinkScannerEnsureStopped];
    }
  }
  else
  {
    int v4 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_ERROR)) {
      sub_10076395C(v4);
    }
  }
}

- (void)reset
{
  id v3 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[BTVCLinkAgent reset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s\n", (uint8_t *)&v5, 0xCu);
  }
  if (self->_activated)
  {
    if ([(BTVCLinkAgent *)self _isAdvertisingEnabled])
    {
      [self->_bleBTVCLinkAdvertiser advertisingEnable:0];
      [(BTVCLinkAgent *)self _resetAdvertisingEnable];
    }
    if (self->_bleBTVCLinkScanEnable) {
      [self->_bleBTVCLinkScanner scanEnable:0];
    }
  }
  else
  {
    int v4 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_ERROR)) {
      sub_1007639A0(v4);
    }
  }
}

- (BOOL)isAdvertisingEnabled:(unsigned __int8)a3
{
  return [(BTVCLinkAgent *)self _isAdvertisingEnabled:a3];
}

- (BOOL)_isAdvertisingEnabled:(unsigned __int8)a3
{
  if (self->_bleBTVCLinkAdvertiseSets) {
    return 0;
  }
  int v4 = [(BTVCLinkAgent *)self _getBTVCLinkAdvertiserSet:a3];
  if (!v4) {
    return 0;
  }
  BOOL v3 = v4[8] != 0;

  return v3;
}

- (BOOL)_isAdvertisingEnabled
{
  if (self->_bleBTVCLinkAdvertiseSets) {
    return 0;
  }
  int v3 = 0;
  while (1)
  {
    int v4 = [(BTVCLinkAgent *)self _getBTVCLinkAdvertiserSet:v3];
    if (v4) {
      break;
    }
    if (++v3 == 6) {
      return 0;
    }
  }
  BOOL v5 = v4[8] != 0;

  return v5;
}

- (void)_resetAdvertisingEnable
{
  if (!self->_bleBTVCLinkAdvertiseSets)
  {
    for (int i = 0; i != 6; ++i)
    {
      int v4 = [(BTVCLinkAgent *)self _getBTVCLinkAdvertiserSet:i];
      if (v4) {
        v4[8] = 0;
      }
    }
  }
}

- (BOOL)isScanningEnabled
{
  return self->_bleBTVCLinkScanEnable;
}

- (void)leSetAdvertisingSetRandomAddress:(unsigned __int8)a3 address:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    v11 = "-[BTVCLinkAgent leSetAdvertisingSetRandomAddress:address:]";
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, handle:%d address:%@", (uint8_t *)&v10, 0x1Cu);
  }
  uint64_t v8 = [(BTVCLinkAgent *)self _getBTVCLinkAdvertiserSet:v4];
  v9 = (void *)v8;
  if (v8) {
    [*(id *)(v8 + 16) addEntriesFromDictionary:v6];
  }
}

- (void)leSetExtendedAdvertisingParameters:(unsigned __int8)a3 advertisingParameters:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    v11 = "-[BTVCLinkAgent leSetExtendedAdvertisingParameters:advertisingParameters:]";
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, handle:%d advertisingParameters:%@", (uint8_t *)&v10, 0x1Cu);
  }
  uint64_t v8 = [(BTVCLinkAgent *)self _getBTVCLinkAdvertiserSet:v4];
  v9 = (void *)v8;
  if (v8) {
    [*(id *)(v8 + 24) addEntriesFromDictionary:v6];
  }
}

- (void)leSetExtendedAdvertisingData:(unsigned __int8)a3 advertisingData:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    v11 = "-[BTVCLinkAgent leSetExtendedAdvertisingData:advertisingData:]";
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, handle:%d advertisingData:%@", (uint8_t *)&v10, 0x1Cu);
  }
  uint64_t v8 = [(BTVCLinkAgent *)self _getBTVCLinkAdvertiserSet:v4];
  v9 = (void *)v8;
  if (v8) {
    [*(id *)(v8 + 32) addEntriesFromDictionary:v6];
  }
}

- (void)leSetExtendedAdvertisingEnable:(BOOL)a3 numSets:(unsigned __int8)a4 advertisingHandles:(char *)a5
{
  LODWORD(v6) = a4;
  BOOL v7 = a3;
  v9 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315650;
    v21 = "-[BTVCLinkAgent leSetExtendedAdvertisingEnable:numSets:advertisingHandles:]";
    __int16 v22 = 1024;
    *(_DWORD *)v23 = v7;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, enable:%d, numSets:%d", (uint8_t *)&v20, 0x18u);
  }
  if (self->_bleBTVCLinkAdvertiser)
  {
    if (v6)
    {
      uint64_t v6 = v6;
      do
      {
        int v10 = [(BTVCLinkAgent *)self _getBTVCLinkAdvertiserSet:*a5];
        if (v10) {
          v10[8] = v7;
        }

        ++a5;
        --v6;
      }
      while (v6);
    }
    else
    {
      for (int i = 0; i != 6; ++i)
      {
        int v13 = [(BTVCLinkAgent *)self _getBTVCLinkAdvertiserSet:i];
        if (v13) {
          v13[8] = 0;
        }
      }
    }
    if (v7)
    {
      id v14 = +[NSMutableArray array];
      if (v14)
      {
        for (int j = 0; j != 6; ++j)
        {
          uint64_t v16 = [(BTVCLinkAgent *)self _getBTVCLinkAdvertiserSet:j];
          v17 = (void *)v16;
          if (v16 && *(unsigned char *)(v16 + 8))
          {
            id v18 = objc_alloc_init((Class)NSMutableDictionary);
            [v18 addEntriesFromDictionary:v17[2]];
            [v18 addEntriesFromDictionary:v17[3]];
            [v18 addEntriesFromDictionary:v17[4]];
            [v14 addObject:v18];
          }
        }
      }
      v19 = qword_100A19FE8;
      if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315394;
        v21 = "-[BTVCLinkAgent leSetExtendedAdvertisingEnable:numSets:advertisingHandles:]";
        __int16 v22 = 2112;
        *(void *)v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s, payloadFields:%@", (uint8_t *)&v20, 0x16u);
      }
      [self->_bleBTVCLinkAdvertiser setPayloadFields:v14];
    }
    [self->_bleBTVCLinkAdvertiser advertisingEnable:v7];
    self->_bleBTVCLinkAdvertiseEnable = v7;
  }
  else
  {
    v11 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_ERROR)) {
      sub_1007639E4(v11);
    }
  }
}

- (void)leSetExtendedScanEnable:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[BTVCLinkAgent leSetExtendedScanEnable:]";
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s, enable:%d", (uint8_t *)&v8, 0x12u);
  }
  bleBTVCLinkScanner = self->_bleBTVCLinkScanner;
  if (bleBTVCLinkScanner)
  {
    [bleBTVCLinkScanner scanEnable:v3];
    self->_bleBTVCLinkScanEnable = v3;
  }
  else
  {
    BOOL v7 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_ERROR)) {
      sub_100763A68(v7);
    }
  }
}

- (id)_getBTVCLinkAdvertiserSet:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_bleBTVCLinkAdvertiseSets count] <= a3)
  {
    bleBTVCLinkAdvertiseSets = 0;
  }
  else
  {
    bleBTVCLinkAdvertiseSets = self->_bleBTVCLinkAdvertiseSets;
    if (bleBTVCLinkAdvertiseSets)
    {
      bleBTVCLinkAdvertiseSets = [bleBTVCLinkAdvertiseSets objectAtIndex:v3];
    }
  }

  return bleBTVCLinkAdvertiseSets;
}

- (void)_bleBTVCLinkAdvertiserEnsureStarted
{
  if (!self->_bleBTVCLinkAdvertiser)
  {
    unsigned int v3 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAgent] BLE BTVCLink advertiser start\n", v6, 2u);
    }
    uint64_t v4 = [[BTVCLinkAdvertiser alloc] initWithType:2];
    bleBTVCLinkAdvertiser = self->_bleBTVCLinkAdvertiser;
    self->_bleBTVCLinkAdvertiser = v4;

    [self->_bleBTVCLinkAdvertiser setDispatchQueue:self->_dispatchQueue];
    self->_bleBTVCLinkAdvertiseEnable = 0;
    [self->_bleBTVCLinkAdvertiser activateWithCompletion:&stru_1009ACCB8];
  }
}

- (void)_bleBTVCLinkAdvertiserEnsureStopped
{
  if (self->_bleBTVCLinkAdvertiser)
  {
    unsigned int v3 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAgent] BLE BTVCLink advertiser stop\n", v6, 2u);
    }
    bleBTVCLinkAdvertiser = self->_bleBTVCLinkAdvertiser;
  }
  else
  {
    bleBTVCLinkAdvertiser = 0;
  }
  [bleBTVCLinkAdvertiser invalidate];
  self->_bleBTVCLinkAdvertiseEnable = 0;
  BOOL v5 = self->_bleBTVCLinkAdvertiser;
  self->_bleBTVCLinkAdvertiser = 0;
}

- (BOOL)_bleBTVCLinkAdvertiserShouldAdvertise
{
  return !self->_systemWillPowerDown;
}

- (void)_bleBTVCLinkScannerEnsureStarted
{
  if (self->_bleBTVCLinkScanner)
  {
    -[BTVCLinkAgent _bleUpdateScanner:](self, "_bleUpdateScanner:");
  }
  else
  {
    self->_bleBTVCLinkScanEnable = 0;
    id location = 0;
    objc_initWeak(&location, self);
    unsigned int v3 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAgent] BLE BTVCLink scanner start\n", buf, 2u);
    }
    uint64_t v4 = [[BTVCLinkScanner alloc] initWithType:2];
    bleBTVCLinkScanner = self->_bleBTVCLinkScanner;
    self->_bleBTVCLinkScanner = v4;

    [self->_bleBTVCLinkScanner setDispatchQueue:self->_dispatchQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1003FDF74;
    v6[3] = &unk_1009ACCE0;
    objc_copyWeak(&v7, &location);
    [self->_bleBTVCLinkScanner setAdvReportReceiveHandler:v6];
    [(BTVCLinkAgent *)self _bleUpdateScanner:self->_bleBTVCLinkScanner];
    [self->_bleBTVCLinkScanner activateWithCompletion:&stru_1009ACD00];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_bleBTVCLinkScannerEnsureStopped
{
  if (self->_bleBTVCLinkScanner)
  {
    unsigned int v3 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAgent] BLE BTVCLink scanner stop\n", v6, 2u);
    }
    bleBTVCLinkScanner = self->_bleBTVCLinkScanner;
  }
  else
  {
    bleBTVCLinkScanner = 0;
  }
  [bleBTVCLinkScanner invalidate];
  self->_bleBTVCLinkScanEnable = 0;
  BOOL v5 = self->_bleBTVCLinkScanner;
  self->_bleBTVCLinkScanner = 0;
}

- (BOOL)_bleBTVCLinkScannerShouldScan
{
  return !self->_systemWillPowerDown;
}

- (void)_receivedAdvReport:(int64_t)a3 withData:(id)a4 fromPeer:(id)a5 peerInfo:(id)a6
{
  id v44 = a4;
  id v39 = a5;
  id v40 = a6;
  int v8 = (id)qword_100A19FE8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[BTVCLinkAgent _receivedAdvReport:withData:fromPeer:peerInfo:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v44 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s report count %d", buf, 0x12u);
  }

  if ([v44 count])
  {
    v9 = 0;
    unint64_t v10 = 0;
    while ((unint64_t)[v44 count] > v10)
    {
      uint64_t v11 = [v44 objectAtIndex:v10];
      unint64_t v43 = v10;

      v56 = (void *)v11;
      if (v11)
      {
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        memset(buf, 0, sizeof(buf));
        v62 = NSDictionaryGetNSNumber();
        v61 = NSDictionaryGetNSNumber();
        CFDataGetTypeID();
        CFDictionaryGetTypedValue();
        id v53 = (id)objc_claimAutoreleasedReturnValue();
        v55 = NSDictionaryGetNSNumber();
        v52 = NSDictionaryGetNSNumber();
        v51 = NSDictionaryGetNSNumber();
        v50 = NSDictionaryGetNSNumber();
        v49 = NSDictionaryGetNSNumber();
        v48 = NSDictionaryGetNSNumber();
        v47 = NSDictionaryGetNSNumber();
        v46 = NSDictionaryGetNSNumber();
        v45 = NSDictionaryGetNSNumber();
        CFDictionaryGetData();
        id v54 = v53;
        v42 = (uint64_t *)[v54 bytes];
        __int16 v12 = (id)qword_100A19FE8;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v59 = [v62 intValue];
          unsigned int v57 = [v61 intValue];
          uint64_t v13 = *v42;
          unsigned int v14 = [v55 intValue];
          unsigned int v15 = [v52 intValue];
          unsigned int v16 = [v51 intValue];
          unsigned int v17 = [v50 intValue];
          unsigned int v18 = [v49 intValue];
          unsigned int v19 = [v48 intValue];
          unsigned int v20 = [v47 intValue];
          id v21 = [v46 longLongValue];
          unsigned int v22 = [v45 intValue];
          *(_DWORD *)v63 = 136318210;
          v64 = "-[BTVCLinkAgent _receivedAdvReport:withData:fromPeer:peerInfo:]";
          __int16 v65 = 1024;
          unsigned int v66 = v59;
          __int16 v67 = 1024;
          unsigned int v68 = v57;
          __int16 v69 = 2048;
          uint64_t v70 = v13;
          __int16 v71 = 1024;
          unsigned int v72 = v14;
          __int16 v73 = 1024;
          unsigned int v74 = v15;
          __int16 v75 = 1024;
          unsigned int v76 = v16;
          __int16 v77 = 1024;
          unsigned int v78 = v17;
          __int16 v79 = 1024;
          unsigned int v80 = v18;
          __int16 v81 = 1024;
          unsigned int v82 = v19;
          __int16 v83 = 1024;
          unsigned int v84 = v20;
          __int16 v85 = 2048;
          id v86 = v21;
          __int16 v87 = 1024;
          unsigned int v88 = v22;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s EventType:0x%04X, AddressType:0x%02X, PeerAddress:%llX, primaryPHY:0x%02X, secondaryPHY:0x%02X, advertisingSID:0x%02X, txPower:0x%02X, rssi:0x%02X, periodicAdvInterval:0x%02X, directAddressType:0x%02X, directAddress:0x%llX, DataLength:%d", v63, 0x5Cu);
        }

        v23 = [(BTVCLinkAgent *)self advReportReceiveHandler];
        BOOL v24 = v23 == 0;

        if (!v24)
        {
          v25 = [(BTVCLinkAgent *)self advReportReceiveHandler];
          unsigned __int16 v26 = (unsigned __int16)[v62 intValue];
          unsigned __int8 v60 = [v61 intValue];
          uint64_t v58 = *v42;
          unsigned __int8 v27 = [v55 intValue];
          unsigned __int8 v28 = [v52 intValue];
          unsigned __int8 v29 = [v51 intValue];
          unsigned __int8 v30 = [v50 intValue];
          unsigned __int8 v31 = [v49 intValue];
          unsigned __int16 v32 = (unsigned __int16)[v48 intValue];
          unsigned __int8 v33 = [v47 intValue];
          id v34 = [v46 longLongValue];
          LOBYTE(v38) = [v45 intValue];
          BYTE4(v37) = v33;
          WORD1(v37) = v32;
          LOBYTE(v37) = v31;
          ((void (**)(void, void, void, uint64_t, void, void, void, void, uint64_t, id, int, uint8_t *, id, id))v25)[2](v25, v26, v60, v58, v27, v28, v29, v30, v37, v34, v38, buf, v39, v40);
        }
      }
      else
      {
        v35 = qword_100A19FE8;
        if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[BTVCLinkAgent _receivedAdvReport:withData:fromPeer:peerInfo:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v10;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s ADV data [%d] is empty", buf, 0x12u);
        }
      }
      unint64_t v10 = v43 + 1;
      v9 = v56;
    }
  }
  else
  {
    v36 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[BTVCLinkAgent _receivedAdvReport:withData:fromPeer:peerInfo:]";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s empty ADV set received", buf, 0xCu);
    }
    v9 = 0;
  }
}

- (void)_systemWillSleep
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003FEECC;
  block[3] = &unk_100997450;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_systemHasPoweredOn
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003FEF54;
  block[3] = &unk_100997450;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)advReportReceiveHandler
{
  return self->_advReportReceiveHandler;
}

- (void)setAdvReportReceiveHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_advReportReceiveHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bleBTVCLinkScanner, 0);
  objc_storeStrong((id *)&self->_bleBTVCLinkAdvertiseSets, 0);

  objc_storeStrong((id *)&self->_bleBTVCLinkAdvertiser, 0);
}

@end