@interface EPDevice
+ (BOOL)isInRangeWithRSSI:(id)a3;
+ (BOOL)isProximateWithRSSI:(id)a3;
+ (id)newClassicDeviceWithInfo:(id)a3;
+ (id)newDeviceForClassicPairing;
+ (id)newDeviceWithInfo:(id)a3;
+ (id)newDeviceWithInfo:(id)a3 withAdvertisementData:(id)a4 withRSSI:(id)a5;
+ (id)stringFromCBPairingType:(int64_t)a3;
+ (int64_t)minRSSIInteger;
+ (int64_t)proxRSSIInteger;
- (BOOL)displayable;
- (BOOL)enableOOBPairing;
- (BOOL)enableOOBPairingIsSet;
- (BOOL)endingPairing;
- (BOOL)hasPairer;
- (BOOL)isDisplayabilityExpired;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (BOOL)isPairing;
- (BOOL)isPeripheral;
- (BOOL)isProximateExpired;
- (BOOL)oob;
- (BOOL)pendingPairingRequest;
- (BOOL)proximate;
- (BOOL)switchModes;
- (BOOL)updateWithPeer:(id)a3;
- (CBPeer)peer;
- (EPDevice)initWithInfo:(id)a3;
- (EPDevice)initWithInfo:(id)a3 withAdvertisementData:(id)a4 withRSSI:(id)a5;
- (EPDeviceDeviceInfoDelegate)delegate;
- (EPDeviceInfo)info;
- (EPPairerList)pairers;
- (EPPairingAgent)agent;
- (EPPeripheralConnectorManager)connectorManager;
- (EPResourceProtocol)pairingConnector;
- (EPResourceProtocol)pipe;
- (NSDictionary)parameters;
- (NSError)pairingError;
- (NSNumber)RSSI;
- (NSNumber)displayableRSSI;
- (NSNumber)lastPairingRequestPasskey;
- (NSString)btAddress;
- (NSString)description;
- (NSString)displayableName;
- (NSString)name;
- (NSUUID)uuid;
- (OS_dispatch_source)pairingTimer;
- (double)lastDiscoveredDate;
- (double)lastDisplayableDate;
- (double)lastPairingRequestDate;
- (double)lastProximateDate;
- (id)initBase;
- (id)initClassicDeviceWithInfo:(id)a3;
- (id)newClassicBTPairerWithDelegate:(id)a3;
- (id)newObserverWithDelegate:(id)a3;
- (id)newPairerWithDelegate:(id)a3;
- (id)newPairerWithDelegate:(id)a3 withParameters:(id)a4;
- (id)pairCompletion;
- (id)stringFromPairingPhase:(unint64_t)a3;
- (int64_t)lastPairingRequestType;
- (unint64_t)hash;
- (unint64_t)pairingPhase;
- (void)_reset;
- (void)_resetPairingTimeout:(double)a3;
- (void)cancelPairingWithError:(id)a3;
- (void)dealloc;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)reset;
- (void)setAgent:(id)a3;
- (void)setConnectorManager:(id)a3;
- (void)setEnableOOBPairing:(BOOL)a3;
- (void)setEnableOOBPairingIsSet:(BOOL)a3;
- (void)setEndingPairing:(BOOL)a3;
- (void)setLastPairingRequestPasskey:(id)a3;
- (void)setLastPairingRequestType:(int64_t)a3;
- (void)setOob:(BOOL)a3;
- (void)setPairCompletion:(id)a3;
- (void)setPairers:(id)a3;
- (void)setPairingConnector:(id)a3;
- (void)setPairingError:(id)a3;
- (void)setPairingPhase:(unint64_t)a3;
- (void)setPairingTimer:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPendingPairingRequest:(BOOL)a3;
- (void)setPipe:(id)a3;
- (void)setSwitchModes:(BOOL)a3;
- (void)update;
- (void)updateAndEnterState:(id)a3;
- (void)updateWithPeripheral:(id)a3 withAdvertisementData:(id)a4 withRSSI:(id)a5;
- (void)writeData:(id)a3 begin:(id)a4 completion:(id)a5;
@end

@implementation EPDevice

- (EPDeviceDeviceInfoDelegate)delegate
{
  return (EPDeviceDeviceInfoDelegate *)self->_info;
}

+ (id)stringFromCBPairingType:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"CBPairingTypeReserved";
  }
  else {
    return *(&off_100167AC8 + a3);
  }
}

- (CBPeer)peer
{
  return [(EPDeviceInfo *)self->_info peer];
}

- (id)initBase
{
  v3.receiver = self;
  v3.super_class = (Class)EPDevice;
  return [(EPDevice *)&v3 init];
}

+ (id)newDeviceWithInfo:(id)a3 withAdvertisementData:(id)a4 withRSSI:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithInfo:v10 withAdvertisementData:v9 withRSSI:v8];

  return v11;
}

- (EPPairerList)pairers
{
  pairers = self->_pairers;
  if (!pairers)
  {
    v4 = [[EPPairerList alloc] initWithDeviceInfo:self->_info withDelegate:self];
    v5 = self->_pairers;
    self->_pairers = v4;

    pairers = self->_pairers;
  }

  return pairers;
}

- (EPDevice)initWithInfo:(id)a3 withAdvertisementData:(id)a4 withRSSI:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(EPDevice *)self initBase];
  v13 = (EPDevice *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 23, a3);
    v14 = [v9 peer];
    [(EPDevice *)v13 updateWithPeripheral:v14 withAdvertisementData:v10 withRSSI:v11];
  }
  return v13;
}

+ (id)newDeviceWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithInfo:v4];

  return v5;
}

+ (id)newClassicDeviceWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initClassicDeviceWithInfo:v4];

  return v5;
}

+ (id)newDeviceForClassicPairing
{
  id v2 = objc_alloc((Class)a1);

  return [v2 initBase];
}

- (EPDevice)initWithInfo:(id)a3
{
  id v5 = a3;
  v6 = [(EPDevice *)self initBase];
  v7 = (EPDevice *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 23, a3);
    id v8 = [v5 peer];
    [(EPDevice *)v7 updateWithPeer:v8];
  }
  return v7;
}

- (id)initClassicDeviceWithInfo:(id)a3
{
  id v5 = a3;
  v6 = [(EPDevice *)self initBase];
  v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 23, a3);
  }

  return v7;
}

+ (int64_t)minRSSIInteger
{
  if (qword_1001A1188 != -1) {
    dispatch_once(&qword_1001A1188, &stru_100167A88);
  }
  return qword_1001A05E0;
}

+ (int64_t)proxRSSIInteger
{
  if (qword_1001A1190 != -1) {
    dispatch_once(&qword_1001A1190, &stru_100167AA8);
  }
  return qword_1001A05E8;
}

+ (BOOL)isInRangeWithRSSI:(id)a3
{
  uint64_t v4 = (uint64_t)[a3 integerValue];
  return v4 <= 20 && v4 > (uint64_t)[a1 minRSSIInteger];
}

+ (BOOL)isProximateWithRSSI:(id)a3
{
  uint64_t v4 = (uint64_t)[a3 integerValue];
  return v4 <= 20 && v4 > (uint64_t)[a1 proxRSSIInteger];
}

- (BOOL)displayable
{
  return (([(id)objc_opt_class() isInRangeWithRSSI:self->_RSSI] & 1) != 0
       || ![(EPDevice *)self isPeripheral])
      && [(NSString *)self->_name length] != 0;
}

- (BOOL)proximate
{
  return (([(id)objc_opt_class() isProximateWithRSSI:self->_RSSI] & 1) != 0
       || ![(EPDevice *)self isPeripheral])
      && [(NSString *)self->_name length] != 0;
}

- (void)updateWithPeripheral:(id)a3 withAdvertisementData:(id)a4 withRSSI:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  id v9 = [a4 objectForKeyedSubscript:CBAdvertisementDataLocalNameKey];
  if (!v9)
  {
    id v9 = [v10 name];
  }
  if ([(id)objc_opt_class() isInRangeWithRSSI:v8])
  {
    objc_storeStrong((id *)&self->_name, v9);
    objc_storeStrong((id *)&self->_RSSI, a5);
    self->_lastDiscoveredDate = CFAbsoluteTimeGetCurrent();
    if ([(EPDevice *)self displayable])
    {
      self->_lastDisplayableDate = self->_lastDiscoveredDate;
      objc_storeStrong((id *)&self->_displayableName, v9);
      objc_storeStrong((id *)&self->_displayableRSSI, a5);
    }
    if ([(EPDevice *)self proximate]) {
      self->_lastProximateDate = self->_lastDiscoveredDate;
    }
  }
}

- (BOOL)updateWithPeer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 name];
    name = self->_name;
    self->_name = v5;
  }
  self->_lastPairingRequestDate = CFAbsoluteTimeGetCurrent();
  if ([(EPDevice *)self displayable])
  {
    self->_lastDisplayableDate = self->_lastPairingRequestDate;
    objc_storeStrong((id *)&self->_displayableName, self->_name);
    objc_storeStrong((id *)&self->_displayableRSSI, self->_RSSI);
  }
  if ([(EPDevice *)self proximate]) {
    self->_lastProximateDate = self->_lastPairingRequestDate;
  }

  return 1;
}

- (void)dealloc
{
  objc_super v3 = sub_1000A3C58();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = sub_1000A3C58();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138412546;
      id v10 = v7;
      __int16 v11 = 2048;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "dealloc %@[%p]", buf, 0x16u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)EPDevice;
  [(EPDevice *)&v8 dealloc];
}

- (void)setEnableOOBPairing:(BOOL)a3
{
  if (self->_enableOOBPairing != a3)
  {
    self->_enableOOBPairing = a3;
    self->_enableOOBPairingIsSet = 0;
    [(EPDevice *)self update];
  }
}

- (BOOL)isPeripheral
{
  id v2 = [(EPDeviceInfo *)self->_info peer];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isExpired
{
  objc_super v3 = [(EPDevice *)self peer];

  if (v3)
  {
    if ([(EPDevice *)self isPairing]) {
      return 0;
    }
    id v5 = +[EPPeripheralConnectorManagerFactory sharedConnectorManagerFactory];
    v6 = [(EPDevice *)self uuid];
    unsigned int v7 = [v5 isConnected:v6];

    if (v7)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      BOOL result = 0;
      self->_double lastDiscoveredDate = Current;
      return result;
    }
    if (self->_lastDiscoveredDate != 0.0 || self->_lastPairingRequestDate != 0.0)
    {
      double v9 = CFAbsoluteTimeGetCurrent();
      double lastDiscoveredDate = self->_lastDiscoveredDate;
      if (lastDiscoveredDate == 0.0
        || ((double v11 = lastDiscoveredDate - v9, v11 <= 0.0) ? (v12 = v11 < -5.0) : (v12 = 1), !v12))
      {
        double lastPairingRequestDate = self->_lastPairingRequestDate;
        if (lastPairingRequestDate == 0.0) {
          return 0;
        }
        double v14 = lastPairingRequestDate - v9;
        if (v14 <= 0.0 && v14 >= -60.0) {
          return 0;
        }
      }
    }
  }
  return 1;
}

- (BOOL)isDisplayabilityExpired
{
  if ([(EPDevice *)self isExpired])
  {
    objc_super v3 = nr_daemon_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (!v4) {
      return 1;
    }
    id v5 = nr_daemon_log();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:

      return 1;
    }
    int v21 = 136446210;
    v22 = "-[EPDevice isDisplayabilityExpired]";
    v6 = "%{public}s: isExpired.";
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v21, 0xCu);
    goto LABEL_6;
  }
  if ([(EPDevice *)self isPairing])
  {
    objc_super v8 = nr_daemon_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    BOOL result = 0;
    if (!v9) {
      return result;
    }
    id v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136446210;
      v22 = "-[EPDevice isDisplayabilityExpired]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s: isPairing.", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    if (self->_lastDisplayableDate == 0.0)
    {
      v19 = nr_daemon_log();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

      if (!v20) {
        return 1;
      }
      id v5 = nr_daemon_log();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
      int v21 = 136446210;
      v22 = "-[EPDevice isDisplayabilityExpired]";
      v6 = "%{public}s: _lastDisplayableDate not set.";
      goto LABEL_5;
    }
    double Current = CFAbsoluteTimeGetCurrent();
    BOOL v12 = nr_daemon_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      double v14 = nr_daemon_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        double lastDisplayableDate = self->_lastDisplayableDate;
        int v21 = 136446722;
        v22 = "-[EPDevice isDisplayabilityExpired]";
        __int16 v23 = 2048;
        double v24 = lastDisplayableDate;
        __int16 v25 = 2048;
        double v26 = Current;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: compare last display date (%f) with absolute time (%f).", (uint8_t *)&v21, 0x20u);
      }
    }
    double v16 = self->_lastDisplayableDate;
    if (v16 != 0.0)
    {
      double v17 = v16 - Current;
      if (v17 > 0.0 || v17 < -5.0) {
        return 1;
      }
    }
  }
  return 0;
}

- (BOOL)isProximateExpired
{
  if ([(EPDevice *)self isDisplayabilityExpired])
  {
    objc_super v3 = nr_daemon_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (!v4) {
      return 1;
    }
    id v5 = nr_daemon_log();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:

      return 1;
    }
    int v21 = 136446210;
    v22 = "-[EPDevice isProximateExpired]";
    v6 = "%{public}s: Displayability Expired.";
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v21, 0xCu);
    goto LABEL_6;
  }
  if ([(EPDevice *)self isPairing])
  {
    objc_super v8 = nr_daemon_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    BOOL result = 0;
    if (!v9) {
      return result;
    }
    id v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136446210;
      v22 = "-[EPDevice isProximateExpired]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s: isPairing.", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    if (self->_lastProximateDate == 0.0)
    {
      v19 = nr_daemon_log();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

      if (!v20) {
        return 1;
      }
      id v5 = nr_daemon_log();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
      int v21 = 136446210;
      v22 = "-[EPDevice isProximateExpired]";
      v6 = "%{public}s: last proximate date not set.";
      goto LABEL_5;
    }
    double Current = CFAbsoluteTimeGetCurrent();
    BOOL v12 = nr_daemon_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      double v14 = nr_daemon_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        double lastProximateDate = self->_lastProximateDate;
        int v21 = 136446722;
        v22 = "-[EPDevice isProximateExpired]";
        __int16 v23 = 2048;
        double v24 = lastProximateDate;
        __int16 v25 = 2048;
        double v26 = Current;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: compare last proximate date (%f) with absolute time (%f).", (uint8_t *)&v21, 0x20u);
      }
    }
    double v16 = self->_lastProximateDate;
    if (v16 != 0.0)
    {
      double v17 = v16 - Current;
      if (v17 > 0.0 || v17 < -5.0) {
        return 1;
      }
    }
  }
  return 0;
}

- (id)newObserverWithDelegate:(id)a3
{
  info = self->_info;
  id v4 = a3;
  id v5 = [(EPDeviceInfo *)info peripheralFactory];
  id v6 = [v5 newObserverWithDelegate:v4];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EPDevice *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)EPDevice;
    if ([(EPDevice *)&v12 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      info = self->_info;
      id v6 = v4;
      unsigned int v7 = [(EPDeviceInfo *)info uuid];
      objc_super v8 = v6->_info;

      BOOL v9 = [(EPDeviceInfo *)v8 uuid];
      unsigned __int8 v10 = [v7 isEqual:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  id v2 = [(EPDeviceInfo *)self->_info uuid];
  objc_super v3 = (char *)[v2 hash] + 31;

  return (unint64_t)v3;
}

- (NSString)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(EPDevice *)self uuid];
  id v6 = [v5 UUIDString];
  unsigned int v7 = [(EPDevice *)self name];
  objc_super v8 = +[NSString stringWithFormat:@"%@[%p] %@ name=%@", v4, self, v6, v7];

  return (NSString *)v8;
}

- (void)reset
{
  if (!self->_pairingError)
  {
    objc_super v3 = +[NSError errorWithDomain:@"com.apple.nanoregistry.ExtensiblePair" code:555 userInfo:&off_100177A50];
    pairingError = self->_pairingError;
    self->_pairingError = v3;
  }
  self->_pairingPhase = 0;
  self->_endingPairing = 1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = self->_pairingConnector;
    [(EPResourceProtocol *)v5 setPeripheralConnectorShouldForceDisconnect];
    [(EPResourceProtocol *)v5 peripheralWasInvalidated];
  }
  [(EPResourceProtocol *)self->_pairingConnector invalidate];
  pairingConnector = self->_pairingConnector;
  self->_pairingConnector = 0;

  [(EPResourceProtocol *)self->_pipe invalidate];
  pipe = self->_pipe;
  self->_pipe = 0;

  [(EPDevice *)self _reset];
}

- (void)_reset
{
  pairingTimer = self->_pairingTimer;
  if (pairingTimer)
  {
    dispatch_source_cancel(pairingTimer);
    id v4 = self->_pairingTimer;
    self->_pairingTimer = 0;
  }
  unsigned int v5 = [(EPDevice *)self isPairing];
  id v6 = self->_pairingError;
  pairingError = self->_pairingError;
  self->_pairingError = 0;

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v8 = self->_pairingConnector;
      [(EPResourceProtocol *)v8 setPeripheralConnectorShouldForceDisconnect];
      [(EPResourceProtocol *)v8 peripheralWasInvalidated];
    }
    [(EPResourceProtocol *)self->_pairingConnector invalidate];
    pairingConnector = self->_pairingConnector;
    self->_pairingConnector = 0;

    [(EPResourceProtocol *)self->_pipe invalidate];
    pipe = self->_pipe;
    self->_pipe = 0;
  }
  self->_pendingPairingRequest = 0;
  self->_endingPairing = 0;
  self->_pairingPhase = 0;
  self->_double lastDisplayableDate = 0.0;
  self->_double lastProximateDate = 0.0;
  self->_double lastDiscoveredDate = 0.0;
  self->_double lastPairingRequestDate = 0.0;
  me = self->me;
  self->me = 0;

  if (v5)
  {
    objc_super v12 = [(EPDevice *)self pairers];
    [v12 pairer:0 completedWithError:v6];

    BOOL v13 = [(EPDevice *)self delegate];
    double v14 = [(EPDeviceInfo *)self->_info peer];
    [v13 device:self peerDidInvalidate:v14];

    v15 = +[EPFactory queue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10005BE9C;
    v18[3] = &unk_100165530;
    v19 = v6;
    BOOL v20 = self;
    dispatch_async(v15, v18);
  }
  else
  {
    double v16 = [(EPDevice *)self delegate];
    double v17 = [(EPDeviceInfo *)self->_info peer];
    [v16 device:self peerDidInvalidate:v17];
  }
}

- (NSString)btAddress
{
  return [(EPDeviceInfo *)self->_info btAddress];
}

- (void)_resetPairingTimeout:(double)a3
{
  pairingTimer = self->_pairingTimer;
  if (pairingTimer) {
    dispatch_source_cancel(pairingTimer);
  }
  id v6 = +[EPFactory queue];
  unsigned int v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);

  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10005C098;
  handler[3] = &unk_1001655F8;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(v7);
  BOOL v9 = self->_pairingTimer;
  self->_pairingTimer = (OS_dispatch_source *)v7;
  unsigned __int8 v10 = v7;
}

- (id)stringFromPairingPhase:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"EPPairingPhaseIdle";
  }
  else {
    return *(&off_100167AF8 + a3 - 1);
  }
}

- (BOOL)isPairing
{
  return self->_pairingPhase || self->_endingPairing;
}

- (BOOL)hasPairer
{
  pairers = self->_pairers;
  if (pairers) {
    LOBYTE(pairers) = [(EPPairerList *)pairers hasPairer];
  }
  return (char)pairers;
}

- (void)cancelPairingWithError:(id)a3
{
  id v5 = a3;
  if (!self->_endingPairing && [(EPDevice *)self pairingPhase])
  {
    id v6 = sub_1000A3BC0();
    unsigned int v7 = v6;
    if (v5)
    {
      BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (!v8) {
        goto LABEL_11;
      }
      BOOL v9 = sub_1000A3BC0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000F93F0((uint64_t)v5, v9);
      }
    }
    else
    {
      BOOL v10 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

      if (!v10) {
        goto LABEL_11;
      }
      BOOL v9 = sub_1000A3BC0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Call to cancelPairingWithError: with no error", v14, 2u);
      }
    }

LABEL_11:
    objc_storeStrong((id *)&self->_pairingError, a3);
    self->_endingPairing = 1;
    if (v5)
    {
      double v11 = +[NRDataCollector sharedInstance];
      objc_super v12 = [v11 incrementCounterForKey:@"btPairingRetryCount"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v13 = self->_pairingConnector;
        [(EPResourceProtocol *)v13 setPeripheralConnectorShouldForceDisconnect];
        [(EPResourceProtocol *)v13 peripheralWasInvalidated];
      }
    }
    else
    {
      if (![(EPDevice *)self isPeripheral])
      {
LABEL_18:
        [(EPDevice *)self updateAndEnterState:&off_1001769E8];
        goto LABEL_19;
      }
      double v11 = [(EPDevice *)self peer];
      [v11 tag:@"IsAppleWatch"];
    }

    goto LABEL_18;
  }
LABEL_19:
}

- (id)newPairerWithDelegate:(id)a3
{
  return [(EPDevice *)self newPairerWithDelegate:a3 withParameters:0];
}

- (id)newPairerWithDelegate:(id)a3 withParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(EPDevice *)self hasPairer])
  {
    BOOL v8 = sub_1000A3BC0();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      BOOL v10 = sub_1000A3BC0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "newPairer called when pairing or ending pairing", v15, 2u);
      }
    }
    id v11 = 0;
  }
  else
  {
    objc_super v12 = [(EPDevice *)self pairers];
    id v11 = [v12 newPairerWithDelegate:v6 withParameters:v7];

    if (![(EPDevice *)self isPairing])
    {
      BOOL v13 = +[EPFactory queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005C4A4;
      block[3] = &unk_1001655F8;
      block[4] = self;
      dispatch_async(v13, block);
    }
  }

  return v11;
}

- (id)newClassicBTPairerWithDelegate:(id)a3
{
  id v4 = a3;
  if ([(EPDevice *)self hasPairer])
  {
    id v5 = sub_1000A3BC0();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (!v6)
    {
      id v8 = 0;
      goto LABEL_9;
    }
    id v7 = sub_1000A3BC0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "newPairer called when pairing or ending pairing", v13, 2u);
    }
    id v8 = 0;
  }
  else
  {
    BOOL v9 = [(EPDevice *)self pairers];
    id v10 = [v9 newPairerWithDelegate:v4 withParameters:0];

    id v11 = +[EPFactory queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005C664;
    block[3] = &unk_100165530;
    v15 = v4;
    id v8 = v10;
    id v16 = v8;
    dispatch_async(v11, block);

    id v7 = v15;
  }

LABEL_9:
  return v8;
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v13 = a6;
  id v10 = [a4 identifier];
  id v11 = [(EPDeviceInfo *)self->_info uuid];
  unsigned int v12 = [v10 isEqual:v11];

  if (v12)
  {
    self->_double lastPairingRequestDate = CFAbsoluteTimeGetCurrent();
    self->_pendingPairingRequest = 1;
    self->_lastPairingRequestType = a5;
    objc_storeStrong((id *)&self->_lastPairingRequestPasskey, a6);
    [(EPDevice *)self update];
  }
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v5 = [a4 identifier:a3];
  BOOL v6 = [(EPDeviceInfo *)self->_info uuid];
  unsigned int v7 = [v5 isEqual:v6];

  if (v7)
  {
    [(EPDevice *)self cancelPairingWithError:0];
  }
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v10 = a5;
  unsigned int v7 = [a4 identifier];
  id v8 = [(EPDeviceInfo *)self->_info uuid];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9) {
    [(EPDevice *)self cancelPairingWithError:v10];
  }
}

- (void)writeData:(id)a3 begin:(id)a4 completion:(id)a5
{
  info = self->_info;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(EPDeviceInfo *)info peripheralFactory];
  id v16 = [v11 newObserverWithDelegate:0];

  unsigned int v12 = [EPCharacteristicWriter alloc];
  id v13 = +[CBUUID UUIDWithString:@"9AA4730F-B25C-4CC3-B821-C931559FC196"];
  double v14 = +[CBUUID UUIDWithString:@"5F6C6A23-8AC8-400E-810B-017134943460"];
  v15 = [(EPCharacteristicWriter *)v12 initWithPeripheral:v16 serviceUUID:v13 characteristicUUID:v14];

  [(EPCharacteristicWriter *)v15 writeData:v10 begin:v9 completion:v8];
}

- (void)updateAndEnterState:(id)a3
{
  id v4 = a3;
  if ([(EPDeviceInfo *)self->_info hasClassicDevice]) {
    goto LABEL_85;
  }
  if (v4)
  {
    id v5 = [v4 integerValue];

    if (v5 != (id)[(EPDevice *)self pairingPhase])
    {
      BOOL v6 = sub_1000A3BC0();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

      if (v7)
      {
        id v8 = sub_1000A3BC0();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [(EPDevice *)self uuid];
          id v10 = [v9 UUIDString];
          id v11 = [(EPDevice *)self stringFromPairingPhase:[(EPDevice *)self pairingPhase]];
          unsigned int v12 = [(EPDevice *)self stringFromPairingPhase:v5];
          *(_DWORD *)buf = 138412802;
          CFStringRef v93 = v10;
          __int16 v94 = 2112;
          v95 = v11;
          __int16 v96 = 2112;
          v97 = v12;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: EPDevice updateAndEnterState %@ --> %@", buf, 0x20u);
        }
      }
      if ([(EPDevice *)self pairingPhase])
      {
        if (v5 != (id)3)
        {
          if (v5 != (id)2)
          {
            if (!v5)
            {
              pairingTimer = self->_pairingTimer;
              if (pairingTimer)
              {
                dispatch_source_cancel(pairingTimer);
                double v14 = self->_pairingTimer;
                self->_pairingTimer = 0;
              }
              goto LABEL_40;
            }
LABEL_46:
            [(EPDevice *)self setPairingPhase:v5];
            goto LABEL_47;
          }
          goto LABEL_23;
        }
      }
      else
      {
        if (self->_enableOOBPairing)
        {
          v15 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"bluetoothTimeout"];
          id v16 = v15;
          if (v15)
          {
            [v15 doubleValue];
            double v18 = v17;
          }
          else
          {
            double v18 = 14.0;
          }
        }
        else
        {
          double v18 = 120.0;
        }
        [(EPDevice *)self _resetPairingTimeout:v18];
        if (!v5)
        {
LABEL_40:
          self->_endingPairing = 1;
          [(EPDevice *)self _reset];
          goto LABEL_46;
        }
        if (v5 != (id)3)
        {
          if (v5 != (id)2) {
            goto LABEL_46;
          }
LABEL_23:
          if ([(EPDevice *)self isPeripheral])
          {
            if (!self->_enableOOBPairingIsSet)
            {
              self->_enableOOBPairingIsSet = 1;
              v19 = sub_1000A3BC0();
              BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

              if (v20)
              {
                int v21 = sub_1000A3BC0();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  if (self->_enableOOBPairing) {
                    CFStringRef v22 = @"YES";
                  }
                  else {
                    CFStringRef v22 = @"NO";
                  }
                  __int16 v23 = [(EPDevice *)self uuid];
                  double v24 = [v23 UUIDString];
                  *(_DWORD *)buf = 138412546;
                  CFStringRef v93 = v22;
                  __int16 v94 = 2112;
                  v95 = v24;
                  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Calling CoreBluetooth CBPairingAgent setOOBPairingEnabled:%@ forPeer:%@", buf, 0x16u);
                }
              }
              __int16 v25 = [(EPPairingAgent *)self->_agent agent];
              BOOL enableOOBPairing = self->_enableOOBPairing;
              v27 = [(EPDevice *)self peer];
              [v25 setOOBPairingEnabled:enableOOBPairing forPeer:v27];
            }
            v28 = [(EPDeviceInfo *)self->_info newConnectorWithDelegate:self];
            pairingConnector = self->_pairingConnector;
            self->_pairingConnector = v28;
          }
          else
          {
            pairingConnector = +[EPFactory sharedFactory];
            v40 = (EPResourceProtocol *)[pairingConnector newNullResourceWithDelegate:self];
            v41 = self->_pairingConnector;
            self->_pairingConnector = v40;
          }
          v42 = sub_1000A3BC0();
          BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

          if (!v43) {
            goto LABEL_46;
          }
          v39 = sub_1000A3BC0();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v44 = (objc_class *)objc_opt_class();
            NSStringFromClass(v44);
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v46 = self->_pairingConnector;
            *(_DWORD *)buf = 138412546;
            CFStringRef v93 = v45;
            __int16 v94 = 2048;
            v95 = v46;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Grabbed pairing connector %@[%p]", buf, 0x16u);
          }
          goto LABEL_45;
        }
      }
      v30 = [(EPDeviceInfo *)self->_info peer];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_46;
      }
      v32 = sub_1000A3BC0();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

      if (v33)
      {
        v34 = sub_1000A3BC0();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = [(EPDevice *)self uuid];
          v36 = [v35 UUIDString];
          *(_DWORD *)buf = 138412290;
          CFStringRef v93 = v36;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Calling CoreBluetooth CBPairingAgent pairPeer: on %@", buf, 0xCu);
        }
      }
      v37 = [(EPPairingAgent *)self->_agent agent];
      v38 = [(EPDeviceInfo *)self->_info peer];
      [v37 pairPeer:v38];

      v39 = [(EPDevice *)self pairers];
      [v39 pairerDidBeginToPair:0];
LABEL_45:

      goto LABEL_46;
    }
  }
LABEL_47:
  if ([(EPDevice *)self isPairing] || [(EPDevice *)self hasPairer])
  {
    v47 = self;
    me = self->me;
    self->me = v47;
  }
  else
  {
    me = self->me;
    self->me = 0;
  }

  if (![(EPDevice *)self hasPairer])
  {
    [(EPResourceProtocol *)self->_pairingConnector invalidate];
    v49 = self->_pairingConnector;
    self->_pairingConnector = 0;

    [(EPResourceProtocol *)self->_pipe invalidate];
    pipe = self->_pipe;
    self->_pipe = 0;
  }
  if (self->_pairingPhase)
  {
    if (!self->_pipe)
    {
      if ([(EPDevice *)self hasPairer])
      {
        if (self->_pairingPhase != 2)
        {
          v51 = [(EPDevice *)self pairers];
          v52 = [v51 pairer:0 newEndpointWithDelegate:self];
          v53 = self->_pipe;
          self->_pipe = v52;

          if (!self->_pipe)
          {
            NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
            CFStringRef v91 = @"Pipe creation failed";
            v54 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
            v55 = +[NSError errorWithDomain:@"com.apple.nanoregistry.extensiblepair" code:777 userInfo:v54];

            v56 = +[EPFactory queue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10005D4F4;
            block[3] = &unk_100165530;
            void block[4] = self;
            id v85 = v55;
            id v57 = v55;
            dispatch_async(v56, block);
          }
        }
      }
    }
    if (![(EPDevice *)self hasPairer])
    {
      [(EPResourceProtocol *)self->_pipe invalidate];
      v58 = self->_pipe;
      self->_pipe = 0;
    }
    agent = self->_agent;
    if (!agent)
    {
      self->_enableOOBPairingIsSet = 0;
      v60 = +[EPFactory sharedFactory];
      v61 = [v60 agentManager];
      v62 = (EPPairingAgent *)[v61 newAgentWithDelegate:self fromCentral:-[EPDevice isPeripheral](self, "isPeripheral")];
      v63 = self->_agent;
      self->_agent = v62;

      agent = self->_agent;
    }
    if ((id)[(EPResource *)agent availability] != (id)1 && self->_pairingPhase == 3)
    {
      NSErrorUserInfoKey v88 = NSLocalizedDescriptionKey;
      CFStringRef v89 = @"Bluetooth restarted";
      v64 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
      v65 = +[NSError errorWithDomain:@"com.apple.nanoregistry.extensiblepair" code:727 userInfo:v64];
      pairingError = self->_pairingError;
      self->_pairingError = v65;

      v67 = +[EPFactory queue];
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3221225472;
      v83[2] = sub_10005D500;
      v83[3] = &unk_1001655F8;
      v83[4] = self;
      dispatch_async(v67, v83);
    }
    if ((id)[(EPResource *)self->_agent availability] == (id)1)
    {
      unint64_t pairingPhase = self->_pairingPhase;
      if (pairingPhase == 1)
      {
        v69 = +[EPFactory queue];
        v82[0] = _NSConcreteStackBlock;
        v82[1] = 3221225472;
        v82[2] = sub_10005D50C;
        v82[3] = &unk_1001655F8;
        v82[4] = self;
        dispatch_async(v69, v82);

        unint64_t pairingPhase = self->_pairingPhase;
      }
      if (pairingPhase == 2
        && [(EPResourceProtocol *)self->_pipe availability] == (id)1
        && [(EPResourceProtocol *)self->_pairingConnector availability] == (id)1)
      {
        v70 = +[EPFactory queue];
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472;
        v81[2] = sub_10005D51C;
        v81[3] = &unk_1001655F8;
        v81[4] = self;
        dispatch_async(v70, v81);
      }
    }
    if (self->_pairingPhase != 3) {
      goto LABEL_78;
    }
    v71 = [(EPDevice *)self pairers];
    [v71 update];
    goto LABEL_77;
  }
  v72 = self->_agent;
  self->_agent = 0;

  if (![(EPDevice *)self hasPairer])
  {
    v71 = self->_pipe;
    self->_pipe = 0;
LABEL_77:
  }
LABEL_78:
  if ([(EPDevice *)self hasPairer])
  {
    if ((id)[(EPResource *)self->_agent availability] == (id)1 && self->_pendingPairingRequest)
    {
      self->_pendingPairingRequest = 0;
      v73 = +[EPFactory queue];
      v80[0] = _NSConcreteStackBlock;
      v80[1] = 3221225472;
      v80[2] = sub_10005D52C;
      v80[3] = &unk_1001655F8;
      v80[4] = self;
      dispatch_async(v73, v80);
    }
  }
  else if ([(EPDevice *)self isPairing])
  {
    NSErrorUserInfoKey v86 = NSLocalizedDescriptionKey;
    CFStringRef v87 = @"Pairing aborted because the EPPairer object deallocated";
    v74 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    v75 = +[NSError errorWithDomain:@"com.apple.NanoRegistry" code:4567 userInfo:v74];

    v76 = +[EPFactory queue];
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_10005D588;
    v78[3] = &unk_100165530;
    v78[4] = self;
    id v79 = v75;
    id v77 = v75;
    dispatch_async(v76, v78);
  }
  id v4 = 0;
LABEL_85:
}

- (void)update
{
}

- (NSUUID)uuid
{
  return [(EPDeviceInfo *)self->_info uuid];
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)RSSI
{
  return self->_RSSI;
}

- (NSString)displayableName
{
  return self->_displayableName;
}

- (NSNumber)displayableRSSI
{
  return self->_displayableRSSI;
}

- (double)lastDisplayableDate
{
  return self->_lastDisplayableDate;
}

- (double)lastProximateDate
{
  return self->_lastProximateDate;
}

- (BOOL)pendingPairingRequest
{
  return self->_pendingPairingRequest;
}

- (void)setPendingPairingRequest:(BOOL)a3
{
  self->_pendingPairingRequest = a3;
}

- (BOOL)enableOOBPairing
{
  return self->_enableOOBPairing;
}

- (EPResourceProtocol)pairingConnector
{
  return self->_pairingConnector;
}

- (void)setPairingConnector:(id)a3
{
}

- (EPPairingAgent)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
}

- (EPResourceProtocol)pipe
{
  return self->_pipe;
}

- (void)setPipe:(id)a3
{
}

- (unint64_t)pairingPhase
{
  return self->_pairingPhase;
}

- (void)setPairingPhase:(unint64_t)a3
{
  self->_unint64_t pairingPhase = a3;
}

- (id)pairCompletion
{
  return self->_pairCompletion;
}

- (void)setPairCompletion:(id)a3
{
}

- (BOOL)oob
{
  return self->_oob;
}

- (void)setOob:(BOOL)a3
{
  self->_oob = a3;
}

- (NSError)pairingError
{
  return self->_pairingError;
}

- (void)setPairingError:(id)a3
{
}

- (BOOL)endingPairing
{
  return self->_endingPairing;
}

- (void)setEndingPairing:(BOOL)a3
{
  self->_endingPairing = a3;
}

- (OS_dispatch_source)pairingTimer
{
  return self->_pairingTimer;
}

- (void)setPairingTimer:(id)a3
{
}

- (BOOL)switchModes
{
  return self->_switchModes;
}

- (void)setSwitchModes:(BOOL)a3
{
  self->_switchModes = a3;
}

- (int64_t)lastPairingRequestType
{
  return self->_lastPairingRequestType;
}

- (void)setLastPairingRequestType:(int64_t)a3
{
  self->_lastPairingRequestType = a3;
}

- (NSNumber)lastPairingRequestPasskey
{
  return self->_lastPairingRequestPasskey;
}

- (void)setLastPairingRequestPasskey:(id)a3
{
}

- (void)setPairers:(id)a3
{
}

- (double)lastDiscoveredDate
{
  return self->_lastDiscoveredDate;
}

- (double)lastPairingRequestDate
{
  return self->_lastPairingRequestDate;
}

- (BOOL)enableOOBPairingIsSet
{
  return self->_enableOOBPairingIsSet;
}

- (void)setEnableOOBPairingIsSet:(BOOL)a3
{
  self->_enableOOBPairingIsSet = a3;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (EPPeripheralConnectorManager)connectorManager
{
  return self->_connectorManager;
}

- (void)setConnectorManager:(id)a3
{
}

- (EPDeviceInfo)info
{
  return self->_info;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_connectorManager, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_pairers, 0);
  objc_storeStrong((id *)&self->_lastPairingRequestPasskey, 0);
  objc_storeStrong((id *)&self->_pairingTimer, 0);
  objc_storeStrong((id *)&self->_pairingError, 0);
  objc_storeStrong(&self->_pairCompletion, 0);
  objc_storeStrong((id *)&self->_pipe, 0);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_pairingConnector, 0);
  objc_storeStrong((id *)&self->_displayableRSSI, 0);
  objc_storeStrong((id *)&self->_displayableName, 0);
  objc_storeStrong((id *)&self->_RSSI, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->me, 0);
}

@end