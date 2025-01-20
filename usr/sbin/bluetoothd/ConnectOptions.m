@interface ConnectOptions
+ (id)alertOptionsWithConnectionAlerts:(BOOL)a3 disconnectionAlerts:(BOOL)a4 notificationAlerts:(BOOL)a5 delay:(int64_t)a6 bridgeTransport:(BOOL)a7;
- (BOOL)ancsRequired;
- (BOOL)connectingToPANServices;
- (BOOL)connectionAlerts;
- (BOOL)disableLeGATT;
- (BOOL)disconnectionAlerts;
- (BOOL)enableAutoReconnect;
- (BOOL)enableControllerBTClockUpdates;
- (BOOL)enableScanCore;
- (BOOL)enableTransportBridging;
- (BOOL)hideFromBTSettings;
- (BOOL)isLatencyCritical;
- (BOOL)notificationAlerts;
- (BOOL)opportunistic;
- (BOOL)requiresLowLatency;
- (BOOL)resetDisconnectionHistory;
- (BOOL)waitForConnectionPoll;
- (BOOL)wantsObjectDiscoveryData;
- (ConnectOptions)initWithCoder:(id)a3;
- (NSArray)connectingClients;
- (NSArray)useCaseList;
- (NSData)temporaryIRK;
- (NSData)temporaryLTK;
- (NSString)clientBundleID;
- (NSString)clientProcessID;
- (NSString)temporaryIdentityAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)PHYOptions;
- (int64_t)delay;
- (int64_t)initPHYs;
- (int64_t)maxAllowedConnectionDelay;
- (int64_t)minRSSILevelForConnection;
- (int64_t)mrcEnable;
- (int64_t)txPowerAuxConnectReq;
- (int64_t)txPowerConnectInd;
- (unint64_t)connectionUseCase;
- (unint64_t)ctkdChosenTransport;
- (void)encodeWithCoder:(id)a3;
- (void)setAncsRequired:(BOOL)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientProcessID:(id)a3;
- (void)setConnectingClients:(id)a3;
- (void)setConnectingToPANServices:(BOOL)a3;
- (void)setConnectionAlerts:(BOOL)a3;
- (void)setConnectionUseCase:(unint64_t)a3;
- (void)setCtkdChosenTransport:(unint64_t)a3;
- (void)setDelay:(int64_t)a3;
- (void)setDisableLeGATT:(BOOL)a3;
- (void)setDisconnectionAlerts:(BOOL)a3;
- (void)setEnableAutoReconnect:(BOOL)a3;
- (void)setEnableControllerBTClockUpdates:(BOOL)a3;
- (void)setEnableScanCore:(BOOL)a3;
- (void)setEnableTransportBridging:(BOOL)a3;
- (void)setHideFromBTSettings:(BOOL)a3;
- (void)setInitPHYs:(int64_t)a3;
- (void)setIsLatencyCritical:(BOOL)a3;
- (void)setMaxAllowedConnectionDelay:(int64_t)a3;
- (void)setMinRSSILevelForConnection:(int64_t)a3;
- (void)setMrcEnable:(int64_t)a3;
- (void)setNotificationAlerts:(BOOL)a3;
- (void)setOpportunistic:(BOOL)a3;
- (void)setPHYOptions:(int64_t)a3;
- (void)setRequiresLowLatency:(BOOL)a3;
- (void)setResetDisconnectionHistory:(BOOL)a3;
- (void)setTemporaryIRK:(id)a3;
- (void)setTemporaryIdentityAddress:(id)a3;
- (void)setTemporaryLTK:(id)a3;
- (void)setTxPowerAuxConnectReq:(int64_t)a3;
- (void)setTxPowerConnectInd:(int64_t)a3;
- (void)setUseCaseList:(id)a3;
- (void)setWaitForConnectionPoll:(BOOL)a3;
- (void)setWantsObjectDiscoveryData:(BOOL)a3;
@end

@implementation ConnectOptions

+ (id)alertOptionsWithConnectionAlerts:(BOOL)a3 disconnectionAlerts:(BOOL)a4 notificationAlerts:(BOOL)a5 delay:(int64_t)a6 bridgeTransport:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  BOOL v10 = a4;
  BOOL v11 = a3;
  v12 = objc_alloc_init(ConnectOptions);
  [(ConnectOptions *)v12 setConnectionAlerts:v11];
  [(ConnectOptions *)v12 setDisconnectionAlerts:v10];
  [(ConnectOptions *)v12 setNotificationAlerts:v9];
  [(ConnectOptions *)v12 setDelay:a6];
  [(ConnectOptions *)v12 setEnableTransportBridging:v7];
  [(ConnectOptions *)v12 setDisableLeGATT:0];
  [(ConnectOptions *)v12 setCtkdChosenTransport:0];
  v13 = +[NSData data];
  [(ConnectOptions *)v12 setTemporaryLTK:v13];

  v14 = +[NSArray array];
  [(ConnectOptions *)v12 setConnectingClients:v14];

  [(ConnectOptions *)v12 setOpportunistic:0];
  [(ConnectOptions *)v12 setEnableAutoReconnect:0];
  [(ConnectOptions *)v12 setRequiresLowLatency:0];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[ConnectOptions allocWithZone:a3] init];
  [(ConnectOptions *)v4 setPHYOptions:[(ConnectOptions *)self PHYOptions]];
  [(ConnectOptions *)v4 setAncsRequired:[(ConnectOptions *)self ancsRequired]];
  v5 = [(ConnectOptions *)self clientBundleID];
  [(ConnectOptions *)v4 setClientBundleID:v5];

  [(ConnectOptions *)v4 setConnectionAlerts:[(ConnectOptions *)self connectionAlerts]];
  [(ConnectOptions *)v4 setDisconnectionAlerts:[(ConnectOptions *)self disconnectionAlerts]];
  [(ConnectOptions *)v4 setNotificationAlerts:[(ConnectOptions *)self notificationAlerts]];
  [(ConnectOptions *)v4 setDelay:[(ConnectOptions *)self delay]];
  [(ConnectOptions *)v4 setWantsObjectDiscoveryData:[(ConnectOptions *)self wantsObjectDiscoveryData]];
  [(ConnectOptions *)v4 setEnableTransportBridging:[(ConnectOptions *)self enableTransportBridging]];
  [(ConnectOptions *)v4 setDisableLeGATT:[(ConnectOptions *)self disableLeGATT]];
  [(ConnectOptions *)v4 setHideFromBTSettings:[(ConnectOptions *)self hideFromBTSettings]];
  [(ConnectOptions *)v4 setInitPHYs:[(ConnectOptions *)self initPHYs]];
  [(ConnectOptions *)v4 setEnableControllerBTClockUpdates:[(ConnectOptions *)self enableControllerBTClockUpdates]];
  v6 = [(ConnectOptions *)self clientProcessID];
  [(ConnectOptions *)v4 setClientProcessID:v6];

  [(ConnectOptions *)v4 setConnectionUseCase:[(ConnectOptions *)self connectionUseCase]];
  [(ConnectOptions *)v4 setMaxAllowedConnectionDelay:[(ConnectOptions *)self maxAllowedConnectionDelay]];
  [(ConnectOptions *)v4 setWaitForConnectionPoll:[(ConnectOptions *)self waitForConnectionPoll]];
  [(ConnectOptions *)v4 setMinRSSILevelForConnection:[(ConnectOptions *)self minRSSILevelForConnection]];
  [(ConnectOptions *)v4 setEnableScanCore:[(ConnectOptions *)self enableScanCore]];
  [(ConnectOptions *)v4 setIsLatencyCritical:[(ConnectOptions *)self isLatencyCritical]];
  [(ConnectOptions *)v4 setCtkdChosenTransport:[(ConnectOptions *)self ctkdChosenTransport]];
  BOOL v7 = [(ConnectOptions *)self temporaryLTK];
  [(ConnectOptions *)v4 setTemporaryLTK:v7];

  v8 = [(ConnectOptions *)self connectingClients];
  [(ConnectOptions *)v4 setConnectingClients:v8];

  [(ConnectOptions *)v4 setOpportunistic:[(ConnectOptions *)self opportunistic]];
  BOOL v9 = [(ConnectOptions *)self useCaseList];
  [(ConnectOptions *)v4 setUseCaseList:v9];

  [(ConnectOptions *)v4 setRequiresLowLatency:[(ConnectOptions *)self requiresLowLatency]];
  [(ConnectOptions *)v4 setTxPowerConnectInd:[(ConnectOptions *)self txPowerConnectInd]];
  [(ConnectOptions *)v4 setTxPowerAuxConnectReq:[(ConnectOptions *)self txPowerAuxConnectReq]];
  [(ConnectOptions *)v4 setMrcEnable:[(ConnectOptions *)self mrcEnable]];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBool:self->_connectionAlerts forKey:@"connectionAlerts"];
  [v4 encodeBool:self->_disconnectionAlerts forKey:@"disconnectionAlerts"];
  [v4 encodeBool:self->_notificationAlerts forKey:@"notificationAlerts"];
  [v4 encodeInteger:self->_delay forKey:@"delay"];
  [v4 encodeBool:self->_enableTransportBridging forKey:@"enableTransportBridging"];
}

- (ConnectOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ConnectOptions;
  v5 = [(ConnectOptions *)&v7 init];
  if (v5)
  {
    v5->_connectionAlerts = [v4 decodeBoolForKey:@"connectionAlerts"];
    v5->_disconnectionAlerts = [v4 decodeBoolForKey:@"disconnectionAlerts"];
    v5->_notificationAlerts = [v4 decodeBoolForKey:@"notificationAlerts"];
    v5->_delay = (int64_t)[v4 decodeIntegerForKey:@"delay"];
    v5->_enableTransportBridging = [v4 decodeBoolForKey:@"enableTransportBridging"];
  }

  return v5;
}

- (id)description
{
  uint64_t v3 = sub_100017768();
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 8))(v3);
  BOOL connectionAlerts = self->_connectionAlerts;
  disBOOL connectionAlerts = self->_disconnectionAlerts;
  BOOL notificationAlerts = self->_notificationAlerts;
  int64_t delay = self->_delay;
  BOOL wantsObjectDiscoveryData = self->_wantsObjectDiscoveryData;
  BOOL enableTransportBridging = self->_enableTransportBridging;
  BOOL disableLeGATT = self->_disableLeGATT;
  BOOL ancsRequired = self->_ancsRequired;
  if (v4)
  {
    BOOL hideFromBTSettings = self->_hideFromBTSettings;
    int64_t initPHYs = self->_initPHYs;
    int64_t PHYOptions = self->_PHYOptions;
    BOOL enableControllerBTClockUpdates = self->_enableControllerBTClockUpdates;
    unint64_t connectionUseCase = self->_connectionUseCase;
    BOOL waitForConnectionPoll = self->_waitForConnectionPoll;
    int64_t minRSSILevelForConnection = self->_minRSSILevelForConnection;
    unint64_t ctkdChosenTransport = self->_ctkdChosenTransport;
    connectingClients = self->_connectingClients;
    BOOL opportunistic = self->_opportunistic;
    if (self->_requiresLowLatency) {
      CFStringRef v23 = @"YES";
    }
    else {
      CFStringRef v23 = @"NO";
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(connect:%d disconnect:%d notify:%d delay:%ld wantsObjectDiscoverData:%d transportBridging:%d disableLeGATT:%d ancsRequired:%d hideFromBTSettings:%d initPHYs:%ld PHYoptions:%ld enableControllerBTClockUpdates:%d connectionUseCase:%ld _minRSSILevelForConnection:%ld _waitForConnectionPoll:%d ctkdChosenTransport:%lu) connectingBundles:%@ opportunistic:%d requiresLowLatency:%@", connectionAlerts, disconnectionAlerts, notificationAlerts, delay, wantsObjectDiscoveryData, enableTransportBridging, disableLeGATT, ancsRequired, hideFromBTSettings, initPHYs, PHYOptions, enableControllerBTClockUpdates, connectionUseCase, minRSSILevelForConnection, waitForConnectionPoll, ctkdChosenTransport,
      connectingClients,
      opportunistic,
      v23);
  }
  else
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(connect:%d disconnect:%d notify:%d delay:%ld wantsObjectDiscoverData:%d transportBridging:%d disableLeGATT:%d ancsRequired:%d)", connectionAlerts, disconnectionAlerts, notificationAlerts, delay, wantsObjectDiscoveryData, enableTransportBridging, self->_disableLeGATT, ancsRequired, v26, v27, v28, v29, v30, v31, v32, v33,
      v34,
      v35,
      v36);
  v24 = };

  return v24;
}

- (BOOL)connectionAlerts
{
  return self->_connectionAlerts;
}

- (void)setConnectionAlerts:(BOOL)a3
{
  self->_BOOL connectionAlerts = a3;
}

- (BOOL)disconnectionAlerts
{
  return self->_disconnectionAlerts;
}

- (void)setDisconnectionAlerts:(BOOL)a3
{
  self->_disBOOL connectionAlerts = a3;
}

- (BOOL)notificationAlerts
{
  return self->_notificationAlerts;
}

- (void)setNotificationAlerts:(BOOL)a3
{
  self->_BOOL notificationAlerts = a3;
}

- (int64_t)delay
{
  return self->_delay;
}

- (void)setDelay:(int64_t)a3
{
  self->_int64_t delay = a3;
}

- (BOOL)wantsObjectDiscoveryData
{
  return self->_wantsObjectDiscoveryData;
}

- (void)setWantsObjectDiscoveryData:(BOOL)a3
{
  self->_BOOL wantsObjectDiscoveryData = a3;
}

- (BOOL)enableTransportBridging
{
  return self->_enableTransportBridging;
}

- (void)setEnableTransportBridging:(BOOL)a3
{
  self->_BOOL enableTransportBridging = a3;
}

- (BOOL)disableLeGATT
{
  return self->_disableLeGATT;
}

- (void)setDisableLeGATT:(BOOL)a3
{
  self->_BOOL disableLeGATT = a3;
}

- (BOOL)ancsRequired
{
  return self->_ancsRequired;
}

- (void)setAncsRequired:(BOOL)a3
{
  self->_BOOL ancsRequired = a3;
}

- (BOOL)hideFromBTSettings
{
  return self->_hideFromBTSettings;
}

- (void)setHideFromBTSettings:(BOOL)a3
{
  self->_BOOL hideFromBTSettings = a3;
}

- (int64_t)initPHYs
{
  return self->_initPHYs;
}

- (void)setInitPHYs:(int64_t)a3
{
  self->_int64_t initPHYs = a3;
}

- (int64_t)PHYOptions
{
  return self->_PHYOptions;
}

- (void)setPHYOptions:(int64_t)a3
{
  self->_int64_t PHYOptions = a3;
}

- (BOOL)enableControllerBTClockUpdates
{
  return self->_enableControllerBTClockUpdates;
}

- (void)setEnableControllerBTClockUpdates:(BOOL)a3
{
  self->_BOOL enableControllerBTClockUpdates = a3;
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClientBundleID:(id)a3
{
}

- (NSString)clientProcessID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setClientProcessID:(id)a3
{
}

- (unint64_t)connectionUseCase
{
  return self->_connectionUseCase;
}

- (void)setConnectionUseCase:(unint64_t)a3
{
  self->_unint64_t connectionUseCase = a3;
}

- (int64_t)maxAllowedConnectionDelay
{
  return self->_maxAllowedConnectionDelay;
}

- (void)setMaxAllowedConnectionDelay:(int64_t)a3
{
  self->_maxAllowedConnectionDelay = a3;
}

- (BOOL)waitForConnectionPoll
{
  return self->_waitForConnectionPoll;
}

- (void)setWaitForConnectionPoll:(BOOL)a3
{
  self->_BOOL waitForConnectionPoll = a3;
}

- (int64_t)minRSSILevelForConnection
{
  return self->_minRSSILevelForConnection;
}

- (void)setMinRSSILevelForConnection:(int64_t)a3
{
  self->_int64_t minRSSILevelForConnection = a3;
}

- (BOOL)enableScanCore
{
  return self->_enableScanCore;
}

- (void)setEnableScanCore:(BOOL)a3
{
  self->_enableScanCore = a3;
}

- (BOOL)isLatencyCritical
{
  return self->_isLatencyCritical;
}

- (void)setIsLatencyCritical:(BOOL)a3
{
  self->_isLatencyCritical = a3;
}

- (unint64_t)ctkdChosenTransport
{
  return self->_ctkdChosenTransport;
}

- (void)setCtkdChosenTransport:(unint64_t)a3
{
  self->_unint64_t ctkdChosenTransport = a3;
}

- (NSData)temporaryLTK
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTemporaryLTK:(id)a3
{
}

- (NSString)temporaryIdentityAddress
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTemporaryIdentityAddress:(id)a3
{
}

- (NSData)temporaryIRK
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTemporaryIRK:(id)a3
{
}

- (BOOL)resetDisconnectionHistory
{
  return self->_resetDisconnectionHistory;
}

- (void)setResetDisconnectionHistory:(BOOL)a3
{
  self->_resetDisconnectionHistory = a3;
}

- (BOOL)connectingToPANServices
{
  return self->_connectingToPANServices;
}

- (void)setConnectingToPANServices:(BOOL)a3
{
  self->_connectingToPANServices = a3;
}

- (NSArray)connectingClients
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setConnectingClients:(id)a3
{
}

- (NSArray)useCaseList
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUseCaseList:(id)a3
{
}

- (BOOL)opportunistic
{
  return self->_opportunistic;
}

- (void)setOpportunistic:(BOOL)a3
{
  self->_BOOL opportunistic = a3;
}

- (BOOL)enableAutoReconnect
{
  return self->_enableAutoReconnect;
}

- (void)setEnableAutoReconnect:(BOOL)a3
{
  self->_enableAutoReconnect = a3;
}

- (BOOL)requiresLowLatency
{
  return self->_requiresLowLatency;
}

- (void)setRequiresLowLatency:(BOOL)a3
{
  self->_requiresLowLatency = a3;
}

- (int64_t)txPowerConnectInd
{
  return self->_txPowerConnectInd;
}

- (void)setTxPowerConnectInd:(int64_t)a3
{
  self->_txPowerConnectInd = a3;
}

- (int64_t)txPowerAuxConnectReq
{
  return self->_txPowerAuxConnectReq;
}

- (void)setTxPowerAuxConnectReq:(int64_t)a3
{
  self->_txPowerAuxConnectReq = a3;
}

- (int64_t)mrcEnable
{
  return self->_mrcEnable;
}

- (void)setMrcEnable:(int64_t)a3
{
  self->_mrcEnable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCaseList, 0);
  objc_storeStrong((id *)&self->_connectingClients, 0);
  objc_storeStrong((id *)&self->_temporaryIRK, 0);
  objc_storeStrong((id *)&self->_temporaryIdentityAddress, 0);
  objc_storeStrong((id *)&self->_temporaryLTK, 0);
  objc_storeStrong((id *)&self->_clientProcessID, 0);

  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

@end