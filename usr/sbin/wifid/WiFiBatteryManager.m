@interface WiFiBatteryManager
- (BOOL)configureWiFiClientAndRegisterWithBatteryModule:(BOOL)a3 :(__WiFiManager *)a4 :(id)a5 :(id)a6;
- (BOOL)cpmsActive;
- (BOOL)cpmsContPowerSupport;
- (BOOL)isPowerResourceAvailable:(unint64_t)a3;
- (BOOL)setupDevice:(void *)deviceManager;
- (NSDate)asyncPPMBudgetTimestamp;
- (NSDictionary)dutyCycleToPowerTable100ms;
- (NSDictionary)powerToDutyCycleTable100ms;
- (NSDictionary)wifiDevicePowerLevels100ms;
- (NSMutableArray)pendingRequests;
- (NSMutableDictionary)cachedBudget;
- (WiFiBatteryManager)initWithContext:(void *)a3;
- (float)ratioDutyPower;
- (id)WiFiBatteryManagerPopulatePowerTable;
- (id)WiFiBatteryManagerPpmAdmissionResultHandler;
- (id)WiFiBatteryManagerPpmAsyncNotificationHandler;
- (id)cpmsAsyncNotificationCallback;
- (id)getDutyCycleForPowerNumber:(unint64_t)a3;
- (id)getPowerNumberForDutyCycle:(int)a3;
- (int)admissionCheck;
- (int)requestPowerResource:(unint64_t)a3 withDetails:(void *)a4;
- (int64_t)wifiCPMSHandle;
- (unint64_t)WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:(id)a3;
- (unint64_t)availableResource;
- (unint64_t)claimedResource;
- (unint64_t)dutyMin;
- (unint64_t)getClosestAllowedLowerPowerNumber:(unint64_t)a3;
- (unint64_t)minBatteryIndex;
- (unint64_t)pMax;
- (unint64_t)pMin;
- (unint64_t)pUnconstrained;
- (void)WiFiBatteryManagerCpmsCallbackConfiguration:(__WiFiManager *)a3;
- (void)WiFiBatteryManagerHandlePowerAdmissionResponse:(unint64_t)a3;
- (void)WiFiBatteryManagerPpmCallbackConfiguration:(__WiFiManager *)a3;
- (void)WiFiDeviceManagerHandleInterfaceAvailability:(unint64_t)a3;
- (void)WiFiDeviceManagerHandlePowerBudgetChange:(unint64_t)a3;
- (void)WiFiDeviceManagerHandlePowerUnchangedPowerBudget:(unint64_t)a3 :(id *)a4;
- (void)dealloc;
- (void)releasePowerResources;
- (void)resetDevice;
- (void)setAsyncPPMBudgetTimestamp:(id)a3;
- (void)setAvailableResource:(unint64_t)a3;
- (void)setCachedBudget:(id)a3;
- (void)setClaimedResource:(unint64_t)a3;
- (void)setCpmsActive:(BOOL)a3;
- (void)setCpmsAsyncNotificationCallback:(id)a3;
- (void)setCpmsContPowerSupport:(BOOL)a3;
- (void)setDutyCycleToPowerTable100ms:(id)a3;
- (void)setDutyMin:(unint64_t)a3;
- (void)setMinBatteryIndex:(unint64_t)a3;
- (void)setPMax:(unint64_t)a3;
- (void)setPMin:(unint64_t)a3;
- (void)setPUnconstrained:(unint64_t)a3;
- (void)setPendingRequests:(id)a3;
- (void)setPowerToDutyCycleTable100ms:(id)a3;
- (void)setRatioDutyPower:(float)a3;
- (void)setWiFiBatteryManagerPpmAdmissionResultHandler:(id)a3;
- (void)setWiFiBatteryManagerPpmAsyncNotificationHandler:(id)a3;
- (void)setWifiCPMSHandle:(int64_t)a3;
- (void)setWifiDevicePowerLevels100ms:(id)a3;
@end

@implementation WiFiBatteryManager

- (WiFiBatteryManager)initWithContext:(void *)a3
{
  v31.receiver = self;
  v31.super_class = (Class)WiFiBatteryManager;
  v4 = [(WiFiBatteryManager *)&v31 init];
  v5 = v4;
  if (!v4)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: WiFiBatteryMgmt : unable to super initialize WiFiBatteryManagerClient.", @"-[WiFiBatteryManager initWithContext:]"];
    }
    goto LABEL_23;
  }
  v4->_manager = (__WiFiManager *)a3;
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: WiFiBatteryMgmt : null wifi manager ref!?.", "-[WiFiBatteryManager initWithContext:]"];
    }
    goto LABEL_23;
  }
  *(_WORD *)&v4->_wifiClientRegistered = 0;
  uint64_t v6 = +[NSDate dateWithTimeIntervalSince1970:0.0];
  asyncPPMBudgetTimestamp = v5->_asyncPPMBudgetTimestamp;
  v5->_asyncPPMBudgetTimestamp = (NSDate *)v6;

  v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  cachedBudget = v5->_cachedBudget;
  v5->_cachedBudget = v8;

  if (!objc_opt_class())
  {
    [(WiFiBatteryManager *)v5 setCpmsActive:0];
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  Error! CPMS FWK does not exist! ", "-[WiFiBatteryManager initWithContext:]")
    }
    goto LABEL_17;
  }
  unsigned int v10 = +[CPMSAgent isCPMSSupported];
  v5->_cpmsActive = v10;
  if (v10)
  {
    if (v5->_cpmsAgent)
    {
      if (qword_10027DD68) {
        [[(id)qword_10027DD68 WFLog:message:3, "%s: WiFiBatteryMgmt : cpms agent exists ", "-[WiFiBatteryManager initWithContext:]"];
      }
    }
    else
    {
      uint64_t v13 = +[CPMSAgent sharedCPMSAgent];
      cpmsAgent = v5->_cpmsAgent;
      v5->_cpmsAgent = (CPMSAgentProtocol *)v13;

      if (!v5->_cpmsAgent)
      {
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  Error: couldn't get sharedCPMSAgent", "-[WiFiBatteryManager initWithContext:]")
        }
        goto LABEL_23;
      }
      v5->_wifiCPMSHandle = 2;
    }
    uint64_t v15 = objc_opt_class();
    wifiClientDescriptionRef = v5->_wifiClientDescriptionRef;
    if (!v15)
    {
      v5->_wifiClientDescriptionRef = 0;

      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:message:3, "%s: WiFiBatteryMgmt :  Error: cpms is active but [CPMSClientDescription class] fails!", "-[WiFiBatteryManager initWithContext:]"];
      }
      goto LABEL_23;
    }
    if (!wifiClientDescriptionRef)
    {
      v17 = (CPMSClientDescription *)objc_alloc_init((Class)CPMSClientDescription);
      v18 = v5->_wifiClientDescriptionRef;
      v5->_wifiClientDescriptionRef = v17;

      if (!v5->_wifiClientDescriptionRef)
      {
        if (qword_10027DD68) {
          [((id)qword_10027DD68) WFLog:3, @"%s: WiFiBatteryMgmt :  Error: unable to alloc and init CPMSClientDescription", @"-[WiFiBatteryManager initWithContext:]"];
        }
        goto LABEL_23;
      }
    }
LABEL_17:
    if (v5->_cpmsActive) {
      goto LABEL_19;
    }
  }
  uint64_t v19 = +[PPMClient sharedInstanceWithClientRepresentation:@"com.apple.duet.ppm-attr.wifi" error:0];
  wifiPpmClientRef = v5->_wifiPpmClientRef;
  v5->_wifiPpmClientRef = (PPMClient *)v19;

  if (!v5->_wifiPpmClientRef)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: WiFiBatteryMgmt :  No PPM support.", @"-[WiFiBatteryManager initWithContext:]"];
    }
    goto LABEL_23;
  }
LABEL_19:
  *(_OWORD *)&v5->_availableResource = xmmword_1001CB6D0;
  v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  pendingRequests = v5->_pendingRequests;
  v5->_pendingRequests = v21;

  v23 = [(WiFiBatteryManager *)v5 pendingRequests];

  if (!v23)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  null pending requests!", "-[WiFiBatteryManager initWithContext:]");
    }
LABEL_23:
    v26 = v5->_pendingRequests;
    v5->_pendingRequests = 0;

    v27 = v5->_wifiClientDescriptionRef;
    v5->_wifiClientDescriptionRef = 0;

    v28 = v5->_cpmsAgent;
    v5->_cpmsAgent = 0;

    v29 = v5->_wifiPpmClientRef;
    v5->_wifiPpmClientRef = 0;

    v30 = v5->_cachedBudget;
    v5->_cachedBudget = 0;

    return 0;
  }
  return v5;
}

- (void)resetDevice
{
  self->_deviceManager = 0;
}

- (BOOL)setupDevice:(void *)deviceManager
{
  self->_deviceManager = (__WiFiDeviceManager *)deviceManager;
  if (!deviceManager)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: WiFiBatteryMgmt : null wifi device manager ref!?.", "-[WiFiBatteryManager setupDevice:]"];
    }
    goto LABEL_37;
  }
  if (!self->_wifiClientRegistered)
  {
    if (self->_cpmsActive)
    {
      uint64_t v4 = sub_100016E18((uint64_t)deviceManager);
      int v5 = sub_1000703E0(v4);
      if (self->_wifiChipPowerTable.dutyCycleTable[0] != 100
        || v5
        || self->_wifiChipPowerTable.powerTable[0] < self->_wifiChipPowerTable.powerTable[9])
      {
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  Error! Failed to read power duty cyle table from driver. Using presets. ", "-[WiFiBatteryManager setupDevice:]");
        }
        *(_DWORD *)&self->_wifiChipPowerTable.dutyCycleTable[10] = 0;
        *(_OWORD *)&self->_wifiChipPowerTable.version = xmmword_1001CB6E0;
        *(_OWORD *)&self->_wifiChipPowerTable.powerTable[6] = unk_1001CB6F0;
        *(_OWORD *)&self->_wifiChipPowerTable.dutyCycleTable[2] = xmmword_1001CB700;
      }
      self->_minBatteryIndex = self->_wifiChipPowerTable.dutyCycleTable[9];
      uint64_t v7 = sub_100016E18((uint64_t)self->_deviceManager);
      int v8 = sub_10007349C(v7);
      self->_cpmsContPowerSupport = v8 != 0;
      if (v8)
      {
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Continous CPMS power budget issupported  ", "-[WiFiBatteryManager setupDevice:]")
        }
        unint64_t v10 = self->_wifiChipPowerTable.dutyCycleTable[9];
        self->_pUnconstrained = self->_wifiChipPowerTable.powerTable[0];
        self->_dutyMin = v10;
        unint64_t v11 = self->_wifiChipPowerTable.powerTable[1];
        unint64_t v12 = self->_wifiChipPowerTable.powerTable[9];
        self->_pMin = v12;
        self->_pMax = v11;
        if (v11 != v12) {
          self->_ratioDutyPower = (float)(self->_wifiChipPowerTable.dutyCycleTable[1] - v10) / (float)(v11 - v12);
        }
      }
      else
      {
        unint64_t v13 = self->_wifiChipPowerTable.powerTable[0];
        self->_pMin = self->_wifiChipPowerTable.powerTable[9];
        self->_pMax = v13;
      }
      for (uint64_t i = 0; i != 10; ++i)
      {
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Power : %d    Duty Cycle : %d", "-[WiFiBatteryManager setupDevice:]", self->_wifiChipPowerTable.powerTable[i], self->_wifiChipPowerTable.dutyCycleTable[i]);
        }
      }
    }
    if ([(WiFiBatteryManager *)self configureWiFiClientAndRegisterWithBatteryModule:[(WiFiBatteryManager *)self cpmsActive] :self->_manager :self->_wifiPpmClientRef :self->_cpmsAgent])
    {
      self->_wifiClientRegistered = 1;
      deviceManager = self->_deviceManager;
      goto LABEL_22;
    }
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  init done and got cpms/ppm handle But registering with battery module fails!?", "-[WiFiBatteryManager setupDevice:]");
    }
LABEL_37:
    BOOL v20 = 0;
    goto LABEL_30;
  }
LABEL_22:
  uint64_t v16 = sub_100016E18((uint64_t)deviceManager);
  if (sub_100070214(v16, 0x64u))
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: WiFiBatteryMgmt :  Default Power index cannot be set!", "-[WiFiBatteryManager setupDevice:]"];
    }
  }
  uint64_t v18 = sub_100016E18((uint64_t)self->_deviceManager);
  if (!sub_10006FF30(v18, 0x64u)) {
    return 1;
  }
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:message:3, "%s: WiFiBatteryMgmt :  Default thermal index cannot be set!", "-[WiFiBatteryManager setupDevice:]"];
  }
  BOOL v20 = 1;
LABEL_30:
  return v20;
}

- (BOOL)configureWiFiClientAndRegisterWithBatteryModule:(BOOL)a3 :(__WiFiManager *)a4 :(id)a5 :(id)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  if (!self)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, "%s: WiFiBatteryMgmt :  self unintialized.?", "-[WiFiBatteryManager configureWiFiClientAndRegisterWithBatteryModule::::]"];
    }
    goto LABEL_12;
  }
  if (!v8)
  {
    [(WiFiBatteryManager *)self WiFiBatteryManagerPpmCallbackConfiguration:a4];
    unsigned __int8 v16 = [v10 registerForNotificationsWithError:0 handler:self->_WiFiBatteryManagerPpmAsyncNotificationHandler];
    unsigned int v15 = 0;
    goto LABEL_6;
  }
  if (!self->_wifiClientDescriptionRef)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  WiFiClient Configuration failed!", "-[WiFiBatteryManager configureWiFiClientAndRegisterWithBatteryModule::::]")
    }
LABEL_12:
    unsigned __int8 v16 = 0;
    BOOL v17 = 0;
LABEL_13:
    char v18 = v17 & v16;
    goto LABEL_14;
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  [(CPMSClientDescription *)self->_wifiClientDescriptionRef setIsContinuous:0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000C3B50;
  v22[3] = &unk_100241140;
  objc_copyWeak(&v23, &location);
  [(CPMSClientDescription *)self->_wifiClientDescriptionRef setGetCurrentPower:v22];
  [(CPMSClientDescription *)self->_wifiClientDescriptionRef setPowerBudgetUpdateMinimumPeriod:1000];
  unint64_t v12 = [(WiFiBatteryManager *)self WiFiBatteryManagerPopulatePowerTable];
  unint64_t v13 = +[NSDictionary dictionaryWithDictionary:v12];
  [(CPMSClientDescription *)self->_wifiClientDescriptionRef setPowerLevels:v13];

  [(CPMSClientDescription *)self->_wifiClientDescriptionRef setClientId:[(WiFiBatteryManager *)self wifiCPMSHandle]];
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  [(WiFiBatteryManager *)self WiFiBatteryManagerCpmsCallbackConfiguration:a4];
  v14 = [(WiFiBatteryManager *)self cpmsAsyncNotificationCallback];
  [(CPMSClientDescription *)self->_wifiClientDescriptionRef setNotificationCallback:v14];

  unsigned int v15 = [v11 registerClientWithDescription:self->_wifiClientDescriptionRef error:0];
  unsigned __int8 v16 = 0;
LABEL_6:
  BOOL v17 = !v8;
  if ((v15 & 1) == 0 && (v16 & 1) == 0)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  Registration with CPMS/PPM failed!", "-[WiFiBatteryManager configureWiFiClientAndRegisterWithBatteryModule::::]")
    }
  }
  if ((v15 & v8 & 1) == 0) {
    goto LABEL_13;
  }
  char v18 = 1;
LABEL_14:

  return v18;
}

- (id)WiFiBatteryManagerPopulatePowerTable
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:10];
  if (v3)
  {
    uint64_t v4 = 35;
    do
    {
      int v5 = +[NSNumber numberWithInt:*((unsigned __int16 *)&self->super.isa + v4)];
      [v3 addObject:v5];

      unint64_t v6 = v4 - 25;
      --v4;
    }
    while (v6 > 1);
  }
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:10];
  if (v7)
  {
    uint64_t v8 = 47;
    do
    {
      v9 = +[NSNumber numberWithInt:*((unsigned __int16 *)&self->super.isa + v8)];
      [v7 addObject:v9];

      unint64_t v10 = v8 - 37;
      --v8;
    }
    while (v10 > 1);
  }
  id v11 = +[NSDictionary dictionaryWithObjects:v3 forKeys:v7];
  [(WiFiBatteryManager *)self setDutyCycleToPowerTable100ms:v11];

  unint64_t v12 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v3];
  [(WiFiBatteryManager *)self setPowerToDutyCycleTable100ms:v12];

  unint64_t v13 = +[NSDictionary dictionaryWithObject:v3 forKey:kCPMSPowerTimeScale100ms];
  [(WiFiBatteryManager *)self setWifiDevicePowerLevels100ms:v13];

  v14 = [(WiFiBatteryManager *)self wifiDevicePowerLevels100ms];

  return v14;
}

- (void)WiFiBatteryManagerCpmsCallbackConfiguration:(__WiFiManager *)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C3DD8;
  v6[3] = &unk_100241190;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = objc_retainBlock(v6);
  id cpmsAsyncNotificationCallback = self->_cpmsAsyncNotificationCallback;
  self->_id cpmsAsyncNotificationCallback = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)WiFiBatteryManagerPpmCallbackConfiguration:(__WiFiManager *)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000C426C;
  v10[3] = &unk_100241190;
  objc_copyWeak(&v11, &location);
  uint64_t v4 = objc_retainBlock(v10);
  id WiFiBatteryManagerPpmAsyncNotificationHandler = self->_WiFiBatteryManagerPpmAsyncNotificationHandler;
  self->_id WiFiBatteryManagerPpmAsyncNotificationHandler = v4;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C45F0;
  v8[3] = &unk_1002411E0;
  objc_copyWeak(&v9, &location);
  unint64_t v6 = objc_retainBlock(v8);
  id WiFiBatteryManagerPpmAdmissionResultHandler = self->_WiFiBatteryManagerPpmAdmissionResultHandler;
  self->_id WiFiBatteryManagerPpmAdmissionResultHandler = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  id WiFiBatteryManagerPpmAsyncNotificationHandler = self->_WiFiBatteryManagerPpmAsyncNotificationHandler;
  self->_id WiFiBatteryManagerPpmAsyncNotificationHandler = 0;

  id WiFiBatteryManagerPpmAdmissionResultHandler = self->_WiFiBatteryManagerPpmAdmissionResultHandler;
  self->_id WiFiBatteryManagerPpmAdmissionResultHandler = 0;

  id cpmsAsyncNotificationCallback = self->_cpmsAsyncNotificationCallback;
  self->_id cpmsAsyncNotificationCallback = 0;

  powerToDutyCycleTable100ms = self->_powerToDutyCycleTable100ms;
  self->_powerToDutyCycleTable100ms = 0;

  dutyCycleToPowerTable100ms = self->_dutyCycleToPowerTable100ms;
  self->_dutyCycleToPowerTable100ms = 0;

  wifiDevicePowerLevels100ms = self->_wifiDevicePowerLevels100ms;
  self->_wifiDevicePowerLevels100ms = 0;

  cachedBudget = self->_cachedBudget;
  self->_cachedBudget = 0;

  pendingRequests = self->_pendingRequests;
  self->_pendingRequests = 0;

  cpmsAgent = self->_cpmsAgent;
  self->_cpmsAgent = 0;

  wifiPpmClientRef = self->_wifiPpmClientRef;
  self->_wifiPpmClientRef = 0;

  wifiClientDescriptionRef = self->_wifiClientDescriptionRef;
  self->_wifiClientDescriptionRef = 0;

  v14.receiver = self;
  v14.super_class = (Class)WiFiBatteryManager;
  [(WiFiBatteryManager *)&v14 dealloc];
}

- (void)WiFiBatteryManagerHandlePowerAdmissionResponse:(unint64_t)a3
{
  if (!self)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt :  Self uninitialized.", "-[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:]");
    }
    goto LABEL_31;
  }
  if ([(WiFiBatteryManager *)self availableResource] != a3)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Changed budget from battery module. Previous value :%lu and new value :%lu ", "-[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:]", -[WiFiBatteryManager availableResource](self, "availableResource"), a3)];
    }
    [(WiFiBatteryManager *)self setAvailableResource:a3];
    if (a3) {
      unint64_t v13 = [(WiFiBatteryManager *)self availableResource];
    }
    else {
      unint64_t v13 = 0;
    }
    [(WiFiBatteryManager *)self setClaimedResource:v13];
    [(WiFiBatteryManager *)self WiFiDeviceManagerHandleInterfaceAvailability:[(WiFiBatteryManager *)self availableResource]];
    [(WiFiBatteryManager *)self WiFiDeviceManagerHandlePowerBudgetChange:[(WiFiBatteryManager *)self availableResource]];
    goto LABEL_15;
  }
  int v5 = [(WiFiBatteryManager *)self pendingRequests];
  id v6 = [v5 count];

  if (!v6)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : No Pending Admission Request", "-[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:]");
    }
LABEL_31:
    return;
  }
  id v7 = [(WiFiBatteryManager *)self pendingRequests];
  id v21 = [v7 objectAtIndexedSubscript:0];

  if (v21)
  {
    id v8 = v21;
    id v9 = [v8 bytes];
    if (v9)
    {
      id v10 = v9;
      [(WiFiBatteryManager *)self setClaimedResource:[(WiFiBatteryManager *)self availableResource]];
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Claimed resource is %lu", "-[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:]", -[WiFiBatteryManager claimedResource](self, "claimedResource"));
      }
      [(WiFiBatteryManager *)self WiFiDeviceManagerHandlePowerUnchangedPowerBudget:[(WiFiBatteryManager *)self availableResource] :v10];

LABEL_15:
      objc_super v14 = [(WiFiBatteryManager *)self pendingRequests];
      id v15 = [v14 count];

      if (v15)
      {
        unsigned __int8 v16 = [(WiFiBatteryManager *)self pendingRequests];
        [v16 removeLastObject];
      }
      BOOL v17 = [(WiFiBatteryManager *)self pendingRequests];
      id v18 = [v17 count];

      if (v18)
      {
        [(WiFiBatteryManager *)self admissionCheck];
      }
      return;
    }
  }
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, @"%s: WiFiBatteryMgmt : NULL Request", @"-[WiFiBatteryManager WiFiBatteryManagerHandlePowerAdmissionResponse:]"];
  }
}

- (BOOL)isPowerResourceAvailable:(unint64_t)a3
{
  if (self)
  {
    if (a3 > 1)
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: WiFiBatteryMgmt : unknown resource type %@", "-[WiFiBatteryManager isPowerResourceAvailable:]", @"Unknown" message];
      }
      BOOL v5 = 0;
    }
    else
    {
      BOOL v5 = [(WiFiBatteryManager *)self claimedResource] != 0;
    }
  }
  else
  {
    BOOL v5 = 1;
  }
  id v8 = (void *)qword_10027DD68;
  if (qword_10027DD68)
  {
    if (v5) {
      id v9 = "available";
    }
    else {
      id v9 = "unavailable";
    }
    id v10 = @"Unknown";
    if (a3 == 1) {
      id v10 = @"Hosted Network";
    }
    if (!a3) {
      id v10 = @"AutoJoin";
    }
    id v11 = v10;
    [v8 WFLog:3, "%s: WiFiBatteryMgmt : resource is %s for type %@. claimedResource is %lu", "-[WiFiBatteryManager isPowerResourceAvailable:]", v9, v11, -[WiFiBatteryManager claimedResource](self, "claimedResource") message];
  }
  return v5;
}

- (int)requestPowerResource:(unint64_t)a3 withDetails:(void *)a4
{
  v19[0] = a3;
  v19[1] = a4;
  id v6 = [objc_alloc((Class)NSData) initWithBytes:v19 length:16];
  if (v6)
  {
    id v7 = [(WiFiBatteryManager *)self pendingRequests];
    [v7 addObject:v6];

    id v9 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      id v10 = @"Unknown";
      if (a3 == 1) {
        id v10 = @"Hosted Network";
      }
      if (!a3) {
        id v10 = @"AutoJoin";
      }
      id v11 = v10;
      unint64_t v12 = [(WiFiBatteryManager *)self pendingRequests];
      [v9 WFLog:3, "WiFiBatteryMgmt : %s: Power resource request for %@ added. Pending=%lu.", "-[WiFiBatteryManager requestPowerResource:withDetails:]", v11, [v12 count]];
    }
    unint64_t v13 = [(WiFiBatteryManager *)self pendingRequests];
    id v14 = [v13 count];

    if (v14 == (id)1)
    {
      int v15 = [(WiFiBatteryManager *)self admissionCheck];
      if (v15)
      {
        unsigned __int8 v16 = [(WiFiBatteryManager *)self pendingRequests];
        [v16 removeObjectAtIndex:0];
      }
    }
    else
    {
      int v15 = 0;
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: WiFiBatteryMgmt : null dataRef.", @"-[WiFiBatteryManager requestPowerResource:withDetails:]"];
    }
    int v15 = -3901;
  }

  return v15;
}

- (int)admissionCheck
{
  id v3 = [(WiFiBatteryManager *)self pendingRequests];
  id v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [(WiFiBatteryManager *)self pendingRequests];
    id v6 = [v5 objectAtIndexedSubscript:0];

    if (v6 && (id v6 = v6, (v7 = [v6 bytes]) != 0))
    {
      id v8 = v7;
      if ([(WiFiBatteryManager *)self isPowerResourceAvailable:*v7])
      {
        if (qword_10027DD68)
        {
          CFStringRef v10 = @"Unknown";
          if (*v8 == 1) {
            CFStringRef v10 = @"Hosted Network";
          }
          if (*v8) {
            CFStringRef v11 = v10;
          }
          else {
            CFStringRef v11 = @"AutoJoin";
          }
          [(id)qword_10027DD68 WFLog:3, "%s: WiFiBatteryMgmt : resource is already known and available for %@ request type.", "-[WiFiBatteryManager admissionCheck]", v11 message];
        }
        [(WiFiBatteryManager *)self WiFiBatteryManagerHandlePowerAdmissionResponse:[(WiFiBatteryManager *)self availableResource]];
        goto LABEL_21;
      }
      if ([(WiFiBatteryManager *)self cpmsActive])
      {
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : requesting resource %d", "-[WiFiBatteryManager admissionCheck]", -[WiFiBatteryManager cpmsActive](self, "cpmsActive"));
        }
        uint64_t v24 = kCPMSPowerTimeScale100ms;
        id v14 = [(WiFiBatteryManager *)self getPowerNumberForDutyCycle:100];
        v25 = v14;
        int v15 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

        id v16 = [(CPMSAgentProtocol *)self->_cpmsAgent copyPowerBudgetForRequest:v15 forClient:self->_wifiCPMSHandle error:0];
        [(CPMSAgentProtocol *)self->_cpmsAgent acknowledgePowerBudget:v16 forClientId:self->_wifiCPMSHandle error:0];
        unint64_t v17 = [(WiFiBatteryManager *)self WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:v16];
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : WiFiBatteryMgmt Admission Handler being called properly! and minvalue is %lu", "-[WiFiBatteryManager admissionCheck]", v17);
        }
        [(WiFiBatteryManager *)self WiFiBatteryManagerHandlePowerAdmissionResponse:v17];

        goto LABEL_21;
      }
      if ([(PPMClient *)self->_wifiPpmClientRef admissionCheckWithLevel:&off_100262E30 options:0 error:0 handler:self->_WiFiBatteryManagerPpmAdmissionResultHandler])
      {
LABEL_21:
        int v12 = 0;
        goto LABEL_22;
      }
      if (qword_10027DD68)
      {
        CFStringRef v21 = @"Unknown";
        if (*v8 == 1) {
          CFStringRef v21 = @"Hosted Network";
        }
        if (*v8) {
          CFStringRef v22 = v21;
        }
        else {
          CFStringRef v22 = @"AutoJoin";
        }
        [(id)qword_10027DD68 WFLog:3, "%s: WiFiBatteryMgmt :  failed to perform admission check for resource type %@", "-[WiFiBatteryManager admissionCheck]", v22 message];
      }
      int v12 = -3906;
    }
    else
    {
      int v12 = -3901;
    }
  }
  else
  {
    if (qword_10027DD68) {
      [[(id)qword_10027DD68 WFLog:message:3, "%s: WiFiBatteryMgmt :  No pending requests, exiting", "-[WiFiBatteryManager admissionCheck]"];
    }
    int v12 = 0;
    id v6 = 0;
  }
LABEL_22:

  return v12;
}

- (void)releasePowerResources
{
  id v3 = [(WiFiBatteryManager *)self getPowerNumberForDutyCycle:[(WiFiBatteryManager *)self minBatteryIndex]];
  if (!v3)
  {
    id v3 = [(WiFiBatteryManager *)self getPowerNumberForDutyCycle:100];
  }
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Releasing battery power resource because of disassoc", "-[WiFiBatteryManager releasePowerResources]");
  }
  if ([(WiFiBatteryManager *)self cpmsActive])
  {
    unsigned int v5 = [(WiFiBatteryManager *)self cpmsActive];
    if (v5)
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: WiFiBatteryMgmt : Requesting minPower : %@ for resource release", "-[WiFiBatteryManager releasePowerResources]", v3 message];
      }
      uint64_t v9 = kCPMSPowerTimeScale100ms;
      CFStringRef v10 = v3;
      id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      id v8 = [(CPMSAgentProtocol *)self->_cpmsAgent copyPowerBudgetForRequest:v7 forClient:self->_wifiCPMSHandle error:0];
      [(CPMSAgentProtocol *)self->_cpmsAgent acknowledgePowerBudget:v8 forClientId:self->_wifiCPMSHandle error:0];
      [(WiFiBatteryManager *)self setClaimedResource:0];
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3, "%s: WiFiBatteryMgmt : Fatal error. No power modules active!? self should have been nil", "-[WiFiBatteryManager releasePowerResources]"];
      }
    }
  }
  else
  {
    [(PPMClient *)self->_wifiPpmClientRef activityStoppedWithLevel:0 options:0 error:0];
    [(WiFiBatteryManager *)self setClaimedResource:0];
  }
}

- (id)getPowerNumberForDutyCycle:(int)a3
{
  dutyCycleToPowerTable100ms = self->_dutyCycleToPowerTable100ms;
  id v4 = +[NSNumber numberWithInt:*(void *)&a3];
  unsigned int v5 = [(NSDictionary *)dutyCycleToPowerTable100ms objectForKey:v4];

  return v5;
}

- (id)getDutyCycleForPowerNumber:(unint64_t)a3
{
  if (self->_cpmsContPowerSupport)
  {
    if (self->_pMax <= a3)
    {
      id v8 = &off_100262E30;
    }
    else
    {
      unint64_t pMin = self->_pMin;
      BOOL v4 = a3 >= pMin;
      unint64_t v5 = a3 - pMin;
      if (v4) {
        +[NSNumber numberWithInt:(LODWORD(self->_dutyMin) + (int)(float)(self->_ratioDutyPower * (float)v5))];
      }
      else {
      id v8 = +[NSNumber numberWithUnsignedInteger:self->_minBatteryIndex];
      }
    }
  }
  else
  {
    powerToDutyCycleTable100ms = self->_powerToDutyCycleTable100ms;
    id v7 = +[NSNumber numberWithInt:a3];
    id v8 = [(NSDictionary *)powerToDutyCycleTable100ms objectForKey:v7];
  }

  return v8;
}

- (unint64_t)getClosestAllowedLowerPowerNumber:(unint64_t)a3
{
  if (a3 && self->_pMin <= a3)
  {
    uint64_t v5 = 0;
    while (1)
    {
      unint64_t v6 = self->_wifiChipPowerTable.powerTable[v5];
      if (v6 <= a3) {
        break;
      }
      if (++v5 == 10) {
        return self->_pMin;
      }
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Ignoring invalid power value (%lu) and using max power instead.", "-[WiFiBatteryManager getClosestAllowedLowerPowerNumber:]", a3);
    }
    id v8 = [(WiFiBatteryManager *)self getPowerNumberForDutyCycle:100];
    unint64_t v6 = (int)[v8 intValue];
  }
  return v6;
}

- (unint64_t)WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kCPMSPowerTimeScale100ms;
  unint64_t v6 = [v4 objectForKey:kCPMSPowerTimeScale100ms];
  unint64_t v7 = (int)[v6 intValue];

  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : budget100ms : %lu", "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]", v7);
  }
  uint64_t v9 = kCPMSPowerTimeScale1s;
  CFStringRef v10 = [v4 objectForKey:kCPMSPowerTimeScale1s];
  unint64_t v11 = (int)[v10 intValue];

  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:message:3, "%s: WiFiBatteryMgmt : budget1s : %lu", "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]", v11];
  }
  if (!v11)
  {
    unint64_t v13 = [(WiFiBatteryManager *)self getPowerNumberForDutyCycle:100];
    unint64_t v11 = (int)[v13 intValue];
  }
  if (self->_cpmsContPowerSupport)
  {
    unint64_t pUnconstrained = self->_pUnconstrained;
    if (pUnconstrained < v7)
    {
      int v15 = [(WiFiBatteryManager *)self getPowerNumberForDutyCycle:100];
      unint64_t v7 = (int)[v15 intValue];

      unint64_t pUnconstrained = self->_pUnconstrained;
    }
    unint64_t pMin = self->_pMin;
    if (v7 <= pMin) {
      unint64_t v7 = self->_pMin;
    }
    if (v11 > pUnconstrained)
    {
      unint64_t v17 = [(WiFiBatteryManager *)self getPowerNumberForDutyCycle:100];
      unint64_t v11 = (int)[v17 intValue];

      unint64_t pMin = self->_pMin;
    }
    if (v11 <= pMin) {
      unint64_t v11 = pMin;
    }
  }
  else
  {
    id v18 = [(WiFiBatteryManager *)self getDutyCycleForPowerNumber:v7];
    unsigned int v19 = [v18 intValue];

    if (!v19)
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: WiFiBatteryMgmt : Illegal budget100ms value : %lu", "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]", v7);
      }
      unint64_t v7 = [(WiFiBatteryManager *)self getClosestAllowedLowerPowerNumber:v7];
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Closest lower legal budget100ms value : %lu", "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]", v7);
      }
    }
    CFStringRef v22 = [(WiFiBatteryManager *)self getDutyCycleForPowerNumber:v11];
    unsigned int v23 = [v22 intValue];

    if (!v23)
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: WiFiBatteryMgmt : Illegal budget1s value : %lu", "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]", v11);
      }
      unint64_t v11 = [(WiFiBatteryManager *)self getClosestAllowedLowerPowerNumber:v11];
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiBatteryMgmt : Closest lower legal budget1s value : %lu", "-[WiFiBatteryManager WiFiBatteryManagerHandleCpmsAllocatedBudgetReturnIndex:]", v11);
      }
    }
  }
  if (v7 >= v11) {
    unint64_t v26 = v11;
  }
  else {
    unint64_t v26 = v7;
  }
  v27 = [(WiFiBatteryManager *)self cachedBudget];
  v28 = +[NSNumber numberWithInt:v7];
  [v27 setObject:v28 forKey:v5];

  v29 = [(WiFiBatteryManager *)self cachedBudget];
  v30 = +[NSNumber numberWithInt:v11];
  [v29 setObject:v30 forKey:v9];

  objc_super v31 = [(WiFiBatteryManager *)self getDutyCycleForPowerNumber:v26];
  unint64_t v32 = (int)[v31 intValue];

  return v32;
}

- (void)WiFiDeviceManagerHandleInterfaceAvailability:(unint64_t)a3
{
}

- (void)WiFiDeviceManagerHandlePowerBudgetChange:(unint64_t)a3
{
}

- (void)WiFiDeviceManagerHandlePowerUnchangedPowerBudget:(unint64_t)a3 :(id *)a4
{
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
}

- (NSDictionary)powerToDutyCycleTable100ms
{
  return self->_powerToDutyCycleTable100ms;
}

- (void)setPowerToDutyCycleTable100ms:(id)a3
{
}

- (NSDictionary)dutyCycleToPowerTable100ms
{
  return self->_dutyCycleToPowerTable100ms;
}

- (void)setDutyCycleToPowerTable100ms:(id)a3
{
}

- (NSDictionary)wifiDevicePowerLevels100ms
{
  return self->_wifiDevicePowerLevels100ms;
}

- (void)setWifiDevicePowerLevels100ms:(id)a3
{
}

- (int64_t)wifiCPMSHandle
{
  return self->_wifiCPMSHandle;
}

- (void)setWifiCPMSHandle:(int64_t)a3
{
  self->_wifiCPMSHandle = a3;
}

- (NSMutableDictionary)cachedBudget
{
  return self->_cachedBudget;
}

- (void)setCachedBudget:(id)a3
{
}

- (unint64_t)availableResource
{
  return self->_availableResource;
}

- (void)setAvailableResource:(unint64_t)a3
{
  self->_availableResource = a3;
}

- (unint64_t)claimedResource
{
  return self->_claimedResource;
}

- (void)setClaimedResource:(unint64_t)a3
{
  self->_claimedResource = a3;
}

- (unint64_t)minBatteryIndex
{
  return self->_minBatteryIndex;
}

- (void)setMinBatteryIndex:(unint64_t)a3
{
  self->_minBatteryIndex = a3;
}

- (float)ratioDutyPower
{
  return self->_ratioDutyPower;
}

- (void)setRatioDutyPower:(float)a3
{
  self->_ratioDutyPower = a3;
}

- (unint64_t)pMin
{
  return self->_pMin;
}

- (void)setPMin:(unint64_t)a3
{
  self->_unint64_t pMin = a3;
}

- (unint64_t)pMax
{
  return self->_pMax;
}

- (void)setPMax:(unint64_t)a3
{
  self->_pMax = a3;
}

- (unint64_t)pUnconstrained
{
  return self->_pUnconstrained;
}

- (void)setPUnconstrained:(unint64_t)a3
{
  self->_unint64_t pUnconstrained = a3;
}

- (unint64_t)dutyMin
{
  return self->_dutyMin;
}

- (void)setDutyMin:(unint64_t)a3
{
  self->_dutyMin = a3;
}

- (NSDate)asyncPPMBudgetTimestamp
{
  return self->_asyncPPMBudgetTimestamp;
}

- (void)setAsyncPPMBudgetTimestamp:(id)a3
{
}

- (BOOL)cpmsActive
{
  return self->_cpmsActive;
}

- (void)setCpmsActive:(BOOL)a3
{
  self->_cpmsActive = a3;
}

- (BOOL)cpmsContPowerSupport
{
  return self->_cpmsContPowerSupport;
}

- (void)setCpmsContPowerSupport:(BOOL)a3
{
  self->_cpmsContPowerSupport = a3;
}

- (id)WiFiBatteryManagerPpmAsyncNotificationHandler
{
  return self->_WiFiBatteryManagerPpmAsyncNotificationHandler;
}

- (void)setWiFiBatteryManagerPpmAsyncNotificationHandler:(id)a3
{
}

- (id)WiFiBatteryManagerPpmAdmissionResultHandler
{
  return self->_WiFiBatteryManagerPpmAdmissionResultHandler;
}

- (void)setWiFiBatteryManagerPpmAdmissionResultHandler:(id)a3
{
}

- (id)cpmsAsyncNotificationCallback
{
  return self->_cpmsAsyncNotificationCallback;
}

- (void)setCpmsAsyncNotificationCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cpmsAsyncNotificationCallback, 0);
  objc_storeStrong(&self->_WiFiBatteryManagerPpmAdmissionResultHandler, 0);
  objc_storeStrong(&self->_WiFiBatteryManagerPpmAsyncNotificationHandler, 0);
  objc_storeStrong((id *)&self->_asyncPPMBudgetTimestamp, 0);
  objc_storeStrong((id *)&self->_cachedBudget, 0);
  objc_storeStrong((id *)&self->_wifiDevicePowerLevels100ms, 0);
  objc_storeStrong((id *)&self->_dutyCycleToPowerTable100ms, 0);
  objc_storeStrong((id *)&self->_powerToDutyCycleTable100ms, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_cpmsAgent, 0);
  objc_storeStrong((id *)&self->_wifiPpmClientRef, 0);

  objc_storeStrong((id *)&self->_wifiClientDescriptionRef, 0);
}

@end