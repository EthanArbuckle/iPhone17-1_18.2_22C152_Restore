@interface HAPAccessoryServer
- (BOOL)hasAdvertisement;
- (BOOL)hasPairings;
- (BOOL)isAccessoryAssociatedWithControllerKey:(id)a3;
- (BOOL)isBLELinkConnected;
- (BOOL)isIncompatibleUpdate;
- (BOOL)isPaired;
- (BOOL)isPinging;
- (BOOL)isReachable;
- (BOOL)isSecuritySessionOpen;
- (BOOL)isSessionRestoreActive;
- (BOOL)matchesSetupID:(id)a3;
- (BOOL)matchesSetupID:(id)a3 serverIdentifier:(id)a4;
- (BOOL)notifyClients:(unint64_t)a3 withDictionary:(id)a4;
- (BOOL)pingSupported;
- (BOOL)reachabilityPingEnabled;
- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4;
- (BOOL)requiresTimedWrite:(id)a3;
- (BOOL)shouldDisconnectOnIdle;
- (BOOL)shouldRetryPVDueToAuthenticationError:(id)a3;
- (BOOL)stopPairingWithError:(id *)a3;
- (BOOL)supportsTimedWrite;
- (BOOL)supportsUnreachablePing;
- (BOOL)tryPairingPassword:(id)a3 error:(id *)a4;
- (BOOL)unitTest_useHH2;
- (BOOL)useHH2;
- (HAPAccessory)primaryAccessory;
- (HAPAccessoryPairingRequest)pairingRequest;
- (HAPAccessoryServer)init;
- (HAPAccessoryServer)initWithKeystore:(id)a3;
- (HAPAccessoryServerDelegate)delegate;
- (HAPDeviceID)deviceID;
- (HAPKeyBag)keyBag;
- (HAPKeyStore)keyStore;
- (HAPSuspendedAccessory)suspendedAccessory;
- (HMFActivity)pairingActivity;
- (HMFVersion)version;
- (NSArray)accessories;
- (NSData)setupHash;
- (NSDate)connectionStartTime;
- (NSHashTable)internalDelegates;
- (NSHashTable)notificationClients;
- (NSNumber)category;
- (NSString)identifier;
- (NSString)metric_pairVerifyReason;
- (NSString)name;
- (NSString)productData;
- (NSString)reachabilityChangedReason;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)internalDelegateQueue;
- (id)buildReachabilityNotificationDictionary:(id)a3 reachable:(BOOL)a4 linkType:(int64_t)a5 withError:(int64_t)a6;
- (id)getControllerUserName;
- (id)shortDescription;
- (int)failedPingCount;
- (int)successfulPingCount;
- (int64_t)communicationProtocol;
- (int64_t)linkType;
- (unint64_t)authMethod;
- (unint64_t)compatibilityFeatures;
- (unint64_t)configNumber;
- (unint64_t)metric_pairVerifyDurationInMS;
- (unint64_t)pairSetupType;
- (unint64_t)pendingRemovePairing;
- (unint64_t)stateNumber;
- (unint64_t)wakeNumber;
- (void)addInternalDelegate:(id)a3;
- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)associateAccessoryWithControllerKey:(id)a3 usingAccessoryPublicKey:(id)a4;
- (void)associateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3;
- (void)associateAccessoryWithControllerKeyUsingAccessoryPublicKey:(id)a3;
- (void)authenticateAccessory;
- (void)continueAuthAfterValidation:(BOOL)a3;
- (void)continuePairingAfterAuthPrompt;
- (void)continuePairingUsingWAC;
- (void)disassociateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3;
- (void)disconnect;
- (void)disconnectWithError:(id)a3;
- (void)discoverAccessories;
- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)enumerateInternalDelegatesUsingBlock:(id)a3;
- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4;
- (void)identifyWithCompletion:(id)a3;
- (void)incrementFailedPing;
- (void)incrementSuccessfulPing;
- (void)initializeKeyBagIfNecessary;
- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)provisionToken:(id)a3;
- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)refreshKeyBag;
- (void)registerForNotifications:(id)a3;
- (void)removeInternalDelegate:(id)a3;
- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)removePairingIdentifier:(id)a3 pairingPublicKey:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)securitySessionWillCloseWithResponseData:(id)a3 error:(id *)a4;
- (void)setAccessories:(id)a3;
- (void)setAuthMethod:(unint64_t)a3;
- (void)setCategory:(id)a3;
- (void)setCompatibilityFeatures:(unint64_t)a3;
- (void)setConfigNumber:(unint64_t)a3;
- (void)setConnectionStartTime:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setFailedPingCount:(int)a3;
- (void)setHasAdvertisement:(BOOL)a3;
- (void)setHasPairings:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIncompatibleUpdate:(BOOL)a3;
- (void)setKeyBag:(id)a3;
- (void)setMetric_pairVerifyDurationInMS:(unint64_t)a3;
- (void)setMetric_pairVerifyReason:(id)a3;
- (void)setName:(id)a3;
- (void)setNotificationClients:(id)a3;
- (void)setPairSetupType:(unint64_t)a3;
- (void)setPairingActivity:(id)a3;
- (void)setPairingRequest:(id)a3;
- (void)setPendingRemovePairing:(unint64_t)a3;
- (void)setPrimaryAccessory:(id)a3;
- (void)setProductData:(id)a3;
- (void)setReachabilityChangedReason:(id)a3;
- (void)setReachabilityPingEnabled:(BOOL)a3;
- (void)setReachable:(BOOL)a3;
- (void)setSecuritySessionOpen:(BOOL)a3;
- (void)setSessionRestoreActive:(BOOL)a3;
- (void)setSetupHash:(id)a3;
- (void)setShouldDisconnectOnIdle:(BOOL)a3;
- (void)setStateNumber:(unint64_t)a3;
- (void)setSuccessfulPingCount:(int)a3;
- (void)setSupportsTimedWrite:(BOOL)a3;
- (void)setSupportsUnreachablePing:(BOOL)a3;
- (void)setUnitTest_useHH2:(BOOL)a3;
- (void)setVersion:(id)a3;
- (void)setWakeNumber:(unint64_t)a3;
- (void)startPairingWithConsentRequired:(BOOL)a3 config:(id)a4 ownershipToken:(id)a5;
- (void)startPairingWithRequest:(id)a3;
- (void)startPing;
- (void)stopPing;
- (void)submitPairVerifyMetricWithError:(id)a3;
- (void)tearDownSessionOnAuthCompletion;
- (void)tryEstablishSecuritySession;
- (void)unregisterForNotifications:(id)a3;
- (void)updateAccessoryInfoDictionary:(id)a3;
- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)writeRawWithResponse:(id)a3 toCharacteristic:(id)a4 completionHandler:(id)a5;
- (void)writeWithoutResponse:(id)a3 toCharacteristic:(id)a4;
@end

@implementation HAPAccessoryServer

- (HAPAccessoryServer)init
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (HAPAccessoryServer)initWithKeystore:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HAPAccessoryServer;
  v5 = [(HAPAccessoryServer *)&v21 init];
  v6 = v5;
  if (v5)
  {
    v7 = (const char *)sub_100017B60(v5, @"clientQueue");
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v9;

    v11 = (const char *)sub_100017B60(v6, @"delegateQueue");
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    internalDelegateQueue = v6->_internalDelegateQueue;
    v6->_internalDelegateQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v6->_keyStore, v4);
    uint64_t v15 = +[NSHashTable weakObjectsHashTable];
    internalDelegates = v6->_internalDelegates;
    v6->_internalDelegates = (NSHashTable *)v15;

    *(_WORD *)&v6->_reachable = 1;
    v6->_authMethod = 5;
    v6->_reachabilityPingEnabled = 0;
    v6->_sessionRestoreActive = 0;
    uint64_t v17 = +[NSHashTable hashTableWithOptions:0];
    notificationClients = v6->_notificationClients;
    v6->_notificationClients = (NSHashTable *)v17;

    v6->_shouldDisconnectOnIdle = 0;
    v6->_successfulPingCount = 0;
    v6->_failedPingCount = 0;
    v6->_hasAdvertisement = 1;
    reachabilityChangedReason = v6->_reachabilityChangedReason;
    v6->_reachabilityChangedReason = (NSString *)@"Unknown";

    v6->_supportsUnreachablePing = 0;
  }

  return v6;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id obj = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  p_delegate = &self->_delegate;
  if (obj && v6)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v8 = (OS_dispatch_queue *)v6;
    delegateQueue = self->_delegateQueue;
    self->_delegateQueue = v8;
  }
  else
  {
    objc_storeWeak((id *)p_delegate, 0);
    delegateQueue = self->_delegateQueue;
    self->_delegateQueue = 0;
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (HAPAccessoryServerDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return (HAPAccessoryServerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_delegateQueue;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)isReachable
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setReachable:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_reachable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_reachable = v3;
    os_unfair_lock_unlock(p_lock);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = [(HAPAccessoryServer *)self accessories];
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) setReachable:v3];
        }
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)setShouldDisconnectOnIdle:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_shouldDisconnectOnIdle == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_shouldDisconnectOnIdle = v3;
    os_unfair_lock_unlock(p_lock);
    [(HAPAccessoryServer *)self disconnectOnIdleUpdated];
  }
}

- (BOOL)shouldDisconnectOnIdle
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_shouldDisconnectOnIdle;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAccessories:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  accessories = self->_accessories;
  self->_accessories = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)accessories
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSArray *)self->_accessories copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (BOOL)reachabilityPingEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachabilityPingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setReachabilityPingEnabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_reachabilityPingEnabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isSessionRestoreActive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_sessionRestoreActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSessionRestoreActive:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_sessionRestoreActive = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isSecuritySessionOpen
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_securitySessionOpen;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSecuritySessionOpen:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_securitySessionOpen = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)pendingRemovePairing
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t pendingRemovePairing = self->_pendingRemovePairing;
  os_unfair_lock_unlock(p_lock);
  return pendingRemovePairing;
}

- (void)setPendingRemovePairing:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t pendingRemovePairing = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasPairings
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasPairings;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasPairings:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int hasPairings = self->_hasPairings;
  if (hasPairings != v3) {
    self->_int hasPairings = v3;
  }
  if (self->_pendingRemovePairing)
  {
    self->_unint64_t pendingRemovePairing = 0;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    if (hasPairings == v3) {
      return;
    }
  }
  id v7 = [(HAPAccessoryServer *)self delegate];
  if (v7)
  {
    id v8 = [(HAPAccessoryServer *)self delegateQueue];

    if (v8)
    {
      uint64_t v9 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008A8AC;
      block[3] = &unk_100273150;
      id v11 = v7;
      long long v12 = self;
      char v13 = v3;
      dispatch_async(v9, block);
    }
  }
}

- (HAPDeviceID)deviceID
{
  int v3 = [HAPDeviceID alloc];
  id v4 = [(HAPAccessoryServer *)self identifier];
  v5 = [(HAPDeviceID *)v3 initWithDeviceIDString:v4];

  return v5;
}

- (NSString)identifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_identifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setIdentifier:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)setupHash
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_setupHash;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSetupHash:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSData *)[v6 copy];
  setupHash = self->_setupHash;
  self->_setupHash = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)authMethod
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t authMethod = self->_authMethod;
  os_unfair_lock_unlock(p_lock);
  return authMethod;
}

- (void)setAuthMethod:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t authMethod = a3;

  os_unfair_lock_unlock(p_lock);
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_name;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  os_unfair_lock_lock_with_options();
  if ([(NSString *)self->_name isEqualToString:v4])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_name, v5);
    os_unfair_lock_unlock(&self->_lock);
    id v6 = [(HAPAccessoryServer *)self delegate];
    if (v6)
    {
      id v7 = [(HAPAccessoryServer *)self delegateQueue];

      if (v7)
      {
        id v8 = [(HAPAccessoryServer *)self delegateQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10008ADA4;
        block[3] = &unk_100273418;
        id v10 = v6;
        id v11 = self;
        id v12 = v5;
        dispatch_async(v8, block);
      }
    }
  }
}

- (NSNumber)category
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_category;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setCategory:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  if ([(NSNumber *)self->_category isEqual:v5])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_category, a3);
    os_unfair_lock_unlock(&self->_lock);
    id v6 = [(HAPAccessoryServer *)self delegate];
    if (v6)
    {
      id v7 = [(HAPAccessoryServer *)self delegateQueue];

      if (v7)
      {
        id v8 = [(HAPAccessoryServer *)self delegateQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10008AF80;
        block[3] = &unk_100273418;
        id v10 = v6;
        id v11 = self;
        id v12 = v5;
        dispatch_async(v8, block);
      }
    }
  }
}

- (void)setProductData:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  productData = self->_productData;
  self->_productData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)productData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_productData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setConfigNumber:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_configNumber = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)configNumber
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t configNumber = self->_configNumber;
  os_unfair_lock_unlock(p_lock);
  return configNumber;
}

- (void)setWakeNumber:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_wakeNumber = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)wakeNumber
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t wakeNumber = self->_wakeNumber;
  os_unfair_lock_unlock(p_lock);
  return wakeNumber;
}

- (void)setStateNumber:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_stateNumber = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)stateNumber
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t stateNumber = self->_stateNumber;
  os_unfair_lock_unlock(p_lock);
  return stateNumber;
}

- (void)setCompatibilityFeatures:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_compatibilityFeatures = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)compatibilityFeatures
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t compatibilityFeatures = self->_compatibilityFeatures;
  os_unfair_lock_unlock(p_lock);
  return compatibilityFeatures;
}

- (void)setVersion:(id)a3
{
  id v4 = (HMFVersion *)a3;
  os_unfair_lock_lock_with_options();
  version = self->_version;
  self->_version = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMFVersion)version
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMFVersion *)self->_version copy];
  os_unfair_lock_unlock(p_lock);

  return (HMFVersion *)v4;
}

- (void)setPairSetupType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_pairSetupType = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)pairSetupType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t pairSetupType = self->_pairSetupType;
  os_unfair_lock_unlock(p_lock);
  return pairSetupType;
}

- (int64_t)communicationProtocol
{
  return 1;
}

- (BOOL)hasAdvertisement
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasAdvertisement;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasAdvertisement:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasAdvertisement = a3;

  os_unfair_lock_unlock(p_lock);
}

- (NSString)reachabilityChangedReason
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_reachabilityChangedReason;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setReachabilityChangedReason:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  reachabilityChangedReason = self->_reachabilityChangedReason;
  self->_reachabilityChangedReason = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setConnectionStartTime:(id)a3
{
  id v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  connectionStartTime = self->_connectionStartTime;
  self->_connectionStartTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)connectionStartTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_connectionStartTime;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)tryEstablishSecuritySession
{
  v2 = NSStringFromSelector(a2);
  int v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)writeWithoutResponse:(id)a3 toCharacteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSStringFromSelector(a2);
  uint64_t v9 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)writeRawWithResponse:(id)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = NSStringFromSelector(a2);
  id v12 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (id)shortDescription
{
  BOOL v3 = sub_100017D90();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(HAPAccessoryServer *)self identifier];
  id v6 = (void *)v5;
  if (v3)
  {
    id v7 = [(HAPAccessoryServer *)self name];
    id v8 = +[NSString stringWithFormat:@"%@ %@ %@", v4, v6, v7];
  }
  else
  {
    id v8 = +[NSString stringWithFormat:@"%@ %@", v4, v5];
  }

  return v8;
}

- (void)authenticateAccessory
{
  v2 = NSStringFromSelector(a2);
  BOOL v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  BOOL v3 = NSStringFromSelector(a2);
  id v4 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v3];
  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)provisionToken:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(a2);
  id v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)tearDownSessionOnAuthCompletion
{
  v2 = NSStringFromSelector(a2);
  BOOL v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (BOOL)isPaired
{
  v2 = NSStringFromSelector(a2);
  BOOL v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (BOOL)matchesSetupID:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self setupHash];
  id v6 = [(HAPAccessoryServer *)self identifier];
  unsigned __int8 v7 = sub_100017C44(v5, v6, v4);

  return v7;
}

- (BOOL)matchesSetupID:(id)a3 serverIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    if (v7) {
      goto LABEL_6;
    }
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  if (![(HAPAccessoryServer *)self matchesSetupID:v6]) {
    goto LABEL_7;
  }
  if (v8)
  {
LABEL_6:
    id v10 = [(HAPAccessoryServer *)self identifier];
    char v9 = HMFEqualObjects();

    goto LABEL_8;
  }
  char v9 = 1;
LABEL_8:

  return v9;
}

- (void)continuePairingAfterAuthPrompt
{
  v2 = NSStringFromSelector(a2);
  BOOL v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)continuePairingUsingWAC
{
  v2 = NSStringFromSelector(a2);
  BOOL v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)startPairingWithRequest:(id)a3
{
}

- (void)startPairingWithConsentRequired:(BOOL)a3 config:(id)a4 ownershipToken:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  char v9 = NSStringFromSelector(a2);
  id v10 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (BOOL)tryPairingPassword:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = NSStringFromSelector(a2);
  id v7 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (BOOL)stopPairingWithError:(id *)a3
{
  BOOL v3 = NSStringFromSelector(a2);
  id v4 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v3];
  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = NSStringFromSelector(a2);
  id v12 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = NSStringFromSelector(a2);
  id v12 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSStringFromSelector(a2);
  id v9 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSStringFromSelector(a2);
  id v9 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)removePairingIdentifier:(id)a3 pairingPublicKey:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  long long v14 = [(HAPAccessoryServer *)self keyBag];
  uint64_t v15 = [v14 currentIdentity];
  v16 = [v15 identifier];
  unsigned __int8 v17 = [v16 isEqualToString:v13];

  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_10008C500;
  v27 = &unk_100274690;
  v29 = self;
  id v30 = v11;
  unsigned __int8 v31 = v17;
  id v28 = v10;
  id v18 = v11;
  id v19 = v10;
  v20 = objc_retainBlock(&v24);
  id v21 = objc_alloc((Class)HMFPairingKey);
  id v22 = [v21 initWithPairingKeyData:v12, v24, v25, v26, v27];

  v23 = [[HAPPairingIdentity alloc] initWithIdentifier:v13 publicKey:v22 privateKey:0 permissions:0];
  [(HAPAccessoryServer *)self removePairing:v23 completionQueue:v19 completionHandler:v20];
}

- (void)discoverAccessories
{
  v2 = NSStringFromSelector(a2);
  BOOL v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = NSStringFromSelector(a2);
  id v13 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v12];
  id v14 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = NSStringFromSelector(a2);
  id v13 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v12];
  id v14 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = NSStringFromSelector(a2);
  id v13 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v12];
  id v14 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (void)identifyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(a2);
  id v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSStringFromSelector(a2);
  id v9 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (BOOL)requiresTimedWrite:(id)a3
{
  id v4 = a3;
  if ([(HAPAccessoryServer *)self supportsTimedWrite])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v4;
    id v5 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v5)
    {
      id v6 = v5;
      id v22 = v4;
      id v7 = 0;
      id v8 = 0;
      uint64_t v9 = *(void *)v25;
LABEL_4:
      id v10 = 0;
      id v11 = v7;
      id v12 = v8;
      while (1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v10);
        id v8 = [v13 characteristic:v22];

        id v14 = [v8 service];
        uint64_t v15 = [v14 accessory];
        id v7 = [v15 instanceID];

        if (!v8 || v7 == 0) {
          break;
        }
        if (([v13 timedWrite] & 1) != 0
          || ([v8 properties] & 0x20) != 0)
        {
          BOOL v17 = 1;
LABEL_18:
          id v4 = v22;
          goto LABEL_23;
        }
        id v10 = (char *)v10 + 1;
        id v11 = v7;
        id v12 = v8;
        if (v6 == v10)
        {
          id v6 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
          if (v6) {
            goto LABEL_4;
          }
          BOOL v17 = 0;
          goto LABEL_18;
        }
      }
      id v18 = self;
      id v19 = sub_100083F74();
      id v4 = v22;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = sub_100083FD0(v18);
        *(_DWORD *)buf = 138543874;
        v29 = v20;
        __int16 v30 = 2112;
        unsigned __int8 v31 = v8;
        __int16 v32 = 2112;
        v33 = v7;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to check prepare characteristic write requests for characteristic '%@' with an accessory instance ID of '%@'", buf, 0x20u);
      }
      BOOL v17 = 0;
LABEL_23:
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)addInternalDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self internalDelegateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008CC50;
  v7[3] = &unk_100273040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeInternalDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self internalDelegateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008CD58;
  v7[3] = &unk_100273040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)enumerateInternalDelegatesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self internalDelegateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008CE60;
  v7[3] = &unk_100272F38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)pingSupported
{
  return 0;
}

- (void)startPing
{
  v2 = self;
  BOOL v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = sub_100083FD0(v2);
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@Ping called -- NOP", (uint8_t *)&v5, 0xCu);
  }
}

- (void)stopPing
{
  v2 = self;
  BOOL v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = sub_100083FD0(v2);
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@Stop ping called -- NOP", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)isPinging
{
  return 0;
}

- (void)registerForNotifications:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  notificationClients = self->_notificationClients;
  if (notificationClients)
  {
    [(NSHashTable *)notificationClients addObject:v4];
    os_unfair_lock_unlock(&self->_lock);
    id v6 = self;
    id v7 = sub_100083F74();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = sub_100083FD0(v6);
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Registering client for accessory server notification %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)unregisterForNotifications:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  notificationClients = self->_notificationClients;
  if (notificationClients) {
    [(NSHashTable *)notificationClients removeObject:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
  id v6 = self;
  id v7 = sub_100083F74();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = sub_100083FD0(v6);
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Removing client from accessory server notification %@", (uint8_t *)&v9, 0x16u);
  }
}

- (BOOL)notifyClients:(unint64_t)a3 withDictionary:(id)a4
{
  id v29 = a4;
  os_unfair_lock_lock_with_options();
  notificationClients = self->_notificationClients;
  if (notificationClients)
  {
    id v6 = [(NSHashTable *)notificationClients copy];
    os_unfair_lock_unlock(&self->_lock);
    if (v6)
    {
      __int16 v30 = self;
      id v7 = sub_100083F74();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = sub_100083FD0(v30);
        int v9 = [v6 count];
        id v10 = +[HAPNotification typeToString:a3];
        *(_DWORD *)buf = 138543874;
        v37 = v8;
        __int16 v38 = 2048;
        v39 = v9;
        __int16 v40 = 2112;
        v41 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying %ld clients for %@", buf, 0x20u);
      }
      if (v29)
      {
        __int16 v11 = [v29 hmf_numberForKey:@"HAPAccessoryInstanceID"];
      }
      else
      {
        __int16 v11 = 0;
      }
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id obj = (HAPAccessoryServer *)v6;
      id v13 = [(HAPAccessoryServer *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v13)
      {
        char v28 = 0;
        uint64_t v15 = *(void *)v32;
        *(void *)&long long v14 = 138543874;
        long long v25 = v14;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(obj);
            }
            BOOL v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              id v18 = [v17 hapInstanceId];
            }
            else
            {
              id v18 = 0;
            }
            id v19 = v30;
            v20 = sub_100083F74();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              id v21 = sub_100083FD0(v19);
              *(_DWORD *)buf = v25;
              v37 = v21;
              __int16 v38 = 2112;
              v39 = v11;
              __int16 v40 = 2112;
              v41 = v18;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@Attempt to notify client dictionary instanceID %@ clientInstanceId %@", buf, 0x20u);
            }
            if (v18) {
              BOOL v22 = v11 != 0;
            }
            else {
              BOOL v22 = 0;
            }
            if (!v22
              || (unsigned int v23 = [v18 intValue],
                  v23 == [v11 intValue]))
            {
              [v17 indicateNotificationFromServer:v19 notifyType:a3 withDictionary:v29];
              char v28 = 1;
            }
          }
          id v13 = [(HAPAccessoryServer *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v13);
      }
      else
      {
        char v28 = 0;
      }

      goto LABEL_33;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  id obj = self;
  __int16 v11 = sub_100083F74();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = sub_100083FD0(obj);
    *(_DWORD *)buf = 138543362;
    v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@Notification client does not exist", buf, 0xCu);
  }
  char v28 = 0;
LABEL_33:

  return v28 & 1;
}

- (id)buildReachabilityNotificationDictionary:(id)a3 reachable:(BOOL)a4 linkType:(int64_t)a5 withError:(int64_t)a6
{
  BOOL v8 = a4;
  v17[0] = @"HAPAccessoryReachable";
  id v9 = a3;
  id v10 = +[NSNumber numberWithBool:v8];
  v18[0] = v10;
  v18[1] = v9;
  v17[1] = @"HAPAccessoryInstance";
  v17[2] = @"HAPAccessoryIdentifier";
  __int16 v11 = [v9 identifier];
  v18[2] = v11;
  v17[3] = @"HAPAccessoryLinkType";
  id v12 = +[NSNumber numberWithInt:a5];
  v18[3] = v12;
  v17[4] = @"HAPAccessoryInstanceID";
  id v13 = [v9 instanceID];
  v18[4] = v13;
  v17[5] = @"HAPAccessoryError";
  long long v14 = +[NSNumber numberWithInt:a6];
  v18[5] = v14;
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:6];

  return v15;
}

- (void)incrementSuccessfulPing
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_successfulPingCount;

  os_unfair_lock_unlock(p_lock);
}

- (void)incrementFailedPing
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_failedPingCount;

  os_unfair_lock_unlock(p_lock);
}

- (void)updateAccessoryInfoDictionary:(id)a3
{
  id v11 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(NSArray *)self->_accessories count])
  {
    int v5 = [(NSArray *)self->_accessories objectAtIndexedSubscript:0];
    id v6 = [v5 manufacturer];
    id v7 = [v5 productData];
    BOOL v8 = self->_category;
    id v9 = [v5 firmwareVersion];

    os_unfair_lock_unlock(p_lock);
    if (v6) {
      [v11 setObject:v6 forKey:@"manufacturer"];
    }
    id v10 = v11;
    if (v7)
    {
      [v11 setObject:v7 forKey:@"product"];
      id v10 = v11;
    }
    if (v9)
    {
      [v11 setObject:v9 forKey:@"firmwareVersion"];
      id v10 = v11;
    }
    if (v8) {
      [v10 setObject:v8 forKey:@"category"];
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    BOOL v8 = 0;
    id v9 = 0;
    id v7 = 0;
    id v6 = 0;
  }
}

- (void)submitPairVerifyMetricWithError:(id)a3
{
  id v11 = a3;
  if ([(HAPAccessoryServer *)self metric_pairVerifyDurationInMS])
  {
    id v4 = [(HAPAccessoryServer *)self metric_pairVerifyReason];

    if (v4)
    {
      int v5 = [HAPMetricsPairVerifyEvent alloc];
      id v6 = +[NSNumber numberWithInteger:[(HAPAccessoryServer *)self linkType]];
      unint64_t v7 = [(HAPAccessoryServer *)self metric_pairVerifyDurationInMS];
      BOOL v8 = [(HAPAccessoryServer *)self metric_pairVerifyReason];
      id v9 = [(HAPMetricsPairVerifyEvent *)v5 initWithAccessory:self forLinkType:v6 durationInMS:v7 reason:v8 pvError:v11];

      id v10 = +[HAPMetricsDispatcher sharedInstance];
      [v10 submitLogEvent:v9];
    }
  }
  [(HAPAccessoryServer *)self setMetric_pairVerifyDurationInMS:0];
  [(HAPAccessoryServer *)self setMetric_pairVerifyReason:0];
}

- (void)disconnectWithError:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(a2);
  id v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)disconnect
{
  v2 = NSStringFromSelector(a2);
  BOOL v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (id)getControllerUserName
{
  BOOL v3 = [(HAPAccessoryServer *)self keyBag];

  if (v3
    && ([(HAPAccessoryServer *)self keyBag],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 currentIdentity],
        id v5 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    id v6 = self;
    id v7 = sub_100083F74();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = sub_100083FD0(v6);
      id v9 = [v5 identifier];
      *(_DWORD *)buf = 138543618;
      BOOL v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Using controller username : %@", buf, 0x16u);
    }
    id v10 = [v5 identifier];
  }
  else
  {
    id v11 = [(HAPAccessoryServer *)self keyStore];
    id v20 = 0;
    id v12 = [(HAPAccessoryServer *)self identifier];
    id v19 = 0;
    [v11 getControllerPublicKey:0 secretKey:0 username:&v20 allowCreation:0 forAccessory:v12 error:&v19];
    id v13 = v20;
    id v5 = v19;

    if (v5) {
      long long v14 = 0;
    }
    else {
      long long v14 = v13;
    }
    id v10 = v14;

    uint64_t v15 = self;
    v16 = sub_100083F74();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      BOOL v17 = sub_100083FD0(v15);
      *(_DWORD *)buf = 138543618;
      BOOL v22 = v17;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@Using default controller username : %@", buf, 0x16u);
    }
  }

  return v10;
}

- (void)initializeKeyBagIfNecessary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_keyBag)
  {
    if (!self->_identifier)
    {
      _HMFPreconditionFailure();
      __break(1u);
      return;
    }
    id v4 = [HAPKeyBag alloc];
    identifier = self->_identifier;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_keyStore);
    id v7 = [(HAPKeyBag *)v4 initWithAccessoryIdentifier:identifier keyStore:WeakRetained];
    keyBag = self->_keyBag;
    self->_keyBag = v7;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)refreshKeyBag
{
  id v2 = [(HAPAccessoryServer *)self keyBag];
  [v2 refreshKeys];
}

- (BOOL)shouldRetryPVDueToAuthenticationError:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(HAPAccessoryServer *)self useHH2];
  BOOL v6 = 0;
  if (v4 && v5)
  {
    id v7 = self;
    BOOL v8 = sub_100083F74();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = sub_100083FD0(v7);
      int v27 = 138543618;
      char v28 = v9;
      __int16 v29 = 2112;
      id v30 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@PV failed with error: %@", (uint8_t *)&v27, 0x16u);
    }
    id v10 = [v4 userInfo];
    id v11 = [v10 objectForKeyedSubscript:NSUnderlyingErrorKey];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    if (v13
      && ([v13 domain],
          long long v14 = objc_claimAutoreleasedReturnValue(),
          int v15 = HMFEqualObjects(),
          v14,
          v15)
      && [v13 code] == (id)-6754)
    {
      v16 = [(HAPAccessoryServer *)v7 identifier];
      [(HAPAccessoryServer *)v7 disassociateAccessoryWithControllerKeyUsingAccessoryIdentifier:v16];

      BOOL v17 = [(HAPAccessoryServer *)v7 keyBag];
      id v18 = [v17 nextIdentity];

      BOOL v6 = v18 != 0;
      id v19 = v7;
      id v20 = sub_100083F74();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
      if (v18)
      {
        if (v21)
        {
          BOOL v22 = sub_100083FD0(v19);
          __int16 v23 = [(HAPAccessoryServer *)v19 keyBag];
          id v24 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v23 getCurrentIndexInBag]);
          int v27 = 138543874;
          char v28 = v22;
          __int16 v29 = 2112;
          id v30 = v24;
          __int16 v31 = 2112;
          long long v32 = v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@Going to retry PV with next pairing Identity [%@]: %@", (uint8_t *)&v27, 0x20u);
        }
      }
      else
      {
        if (v21)
        {
          long long v26 = sub_100083FD0(v19);
          int v27 = 138543362;
          char v28 = v26;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@Not retrying PV as exhausted all the keys from the key bag.", (uint8_t *)&v27, 0xCu);
        }
        [(HAPAccessoryServer *)v19 refreshKeyBag];
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (BOOL)isAccessoryAssociatedWithControllerKey:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(HAPAccessoryServer *)self keyStore];
  BOOL v6 = [(HAPAccessoryServer *)self identifier];
  id v11 = 0;
  unsigned int v7 = [v5 isAccessoryAssociatedWithControllerKey:v6 controllerID:&v11];
  id v8 = v11;

  if (v7) {
    unsigned __int8 v9 = [v4 isEqualToString:v8];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)associateAccessoryWithControllerKey:(id)a3 usingAccessoryPublicKey:(id)a4
{
  BOOL v6 = (HAPPairingIdentity *)a3;
  id v7 = a4;
  if ([(HAPAccessoryServer *)self useHH2])
  {
    [(HAPAccessoryServer *)self initializeKeyBagIfNecessary];
    id v8 = self;
    unsigned __int8 v9 = sub_100083F74();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = sub_100083FD0(v8);
      *(_DWORD *)buf = 138543618;
      id v24 = v10;
      __int16 v25 = 2112;
      long long v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Establishing relationship with controller key: [%@]", buf, 0x16u);
    }
    id v11 = [HAPPairingIdentity alloc];
    id v12 = [(HAPAccessoryServer *)v8 identifier];
    id v13 = [objc_alloc((Class)HMFPairingKey) initWithPairingKeyData:v7];
    long long v14 = [(HAPPairingIdentity *)v11 initWithIdentifier:v12 controllerKeyIdentifier:v6 publicKey:v13 privateKey:0 permissions:0];

    int v15 = [(HAPAccessoryServer *)v8 keyStore];
    id v22 = 0;
    unsigned int v16 = [v15 establishRelationshipBetweenAccessoryAndControllerKey:v14 error:&v22];
    id v17 = v22;

    if (!v16 || v17)
    {
      id v19 = v8;
      id v20 = sub_100083F74();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        BOOL v21 = sub_100083FD0(v19);
        *(_DWORD *)buf = 138543618;
        id v24 = v21;
        __int16 v25 = 2112;
        long long v26 = v14;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the accessory public key inside KeyChain: %@", buf, 0x16u);
      }
    }
    else
    {
      id v18 = [(HAPAccessoryServer *)v8 pairingRequest];

      if (v18) {
        [(HAPAccessoryServer *)v8 refreshKeyBag];
      }
    }
  }
}

- (void)associateAccessoryWithControllerKeyUsingAccessoryPublicKey:(id)a3
{
  id v9 = a3;
  if ([(HAPAccessoryServer *)self useHH2])
  {
    [(HAPAccessoryServer *)self initializeKeyBagIfNecessary];
    id v4 = [(HAPAccessoryServer *)self pairingRequest];
    uint64_t v5 = [v4 pairingIdentity];
    if (v5)
    {
      BOOL v6 = (void *)v5;
    }
    else
    {
      id v7 = [(HAPAccessoryServer *)self keyBag];
      BOOL v6 = [v7 currentIdentity];

      if (!v6) {
        goto LABEL_6;
      }
    }
    id v8 = [v6 identifier];
    [(HAPAccessoryServer *)self associateAccessoryWithControllerKey:v8 usingAccessoryPublicKey:v9];
  }
LABEL_6:
}

- (void)associateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3
{
  id v4 = a3;
  if ([(HAPAccessoryServer *)self useHH2])
  {
    [(HAPAccessoryServer *)self initializeKeyBagIfNecessary];
    uint64_t v5 = self;
    BOOL v6 = sub_100083F74();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = sub_100083FD0(v5);
      id v8 = [(HAPAccessoryServer *)v5 keyBag];
      id v9 = [v8 currentIdentity];
      *(_DWORD *)buf = 138543618;
      id v22 = v7;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@PV Succeeded using [%@]", buf, 0x16u);
    }
    id v10 = [(HAPAccessoryServer *)v5 keyBag];
    id v11 = [v10 currentIdentity];
    id v12 = [v11 identifier];
    unsigned __int8 v13 = [(HAPAccessoryServer *)v5 isAccessoryAssociatedWithControllerKey:v12];

    if ((v13 & 1) == 0)
    {
      long long v14 = [(HAPAccessoryServer *)v5 keyStore];
      id v20 = 0;
      int v15 = [v14 readPublicKeyForAccessoryName:v4 registeredWithHomeKit:0 error:&v20];
      id v16 = v20;

      if (!v15 || v16)
      {
        id v17 = v5;
        id v18 = sub_100083F74();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          id v19 = sub_100083FD0(v17);
          *(_DWORD *)buf = 138543618;
          id v22 = v19;
          __int16 v23 = 2112;
          id v24 = v16;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch accessory public key for accessory with error: %@", buf, 0x16u);
        }
      }
      else
      {
        [(HAPAccessoryServer *)v5 associateAccessoryWithControllerKeyUsingAccessoryPublicKey:v15];
      }
    }
  }
}

- (void)disassociateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3
{
  id v4 = a3;
  if ([(HAPAccessoryServer *)self useHH2])
  {
    [(HAPAccessoryServer *)self initializeKeyBagIfNecessary];
    uint64_t v5 = [(HAPAccessoryServer *)self keyBag];
    BOOL v6 = [v5 currentIdentity];
    id v7 = [v6 identifier];
    unsigned int v8 = [(HAPAccessoryServer *)self isAccessoryAssociatedWithControllerKey:v7];

    if (v8)
    {
      id v9 = [(HAPAccessoryServer *)self keyStore];
      id v15 = 0;
      id v10 = [v9 readPublicKeyForAccessoryName:v4 registeredWithHomeKit:0 error:&v15];
      id v11 = v15;

      if (!v10 || v11)
      {
        id v12 = self;
        unsigned __int8 v13 = sub_100083F74();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          long long v14 = sub_100083FD0(v12);
          *(_DWORD *)buf = 138543618;
          id v17 = v14;
          __int16 v18 = 2112;
          id v19 = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch accessory public key for accessory with error: %@", buf, 0x16u);
        }
      }
      else
      {
        [(HAPAccessoryServer *)self associateAccessoryWithControllerKey:0 usingAccessoryPublicKey:v10];
        [(HAPAccessoryServer *)self refreshKeyBag];
      }
    }
  }
}

- (void)securitySessionWillCloseWithResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 && [v6 length])
  {
    unsigned int v8 = [*a4 domain];
    if (![v8 isEqualToString:NSOSStatusErrorDomain])
    {
LABEL_13:

      goto LABEL_14;
    }
    id v9 = [*a4 code];

    if (v9 == (id)-6727)
    {
      unsigned int v8 = +[HAPTLVParser parserWithData:v7];
      id v10 = [v8 parseResponseForNumber:6];
      id v11 = [v8 parseResponseForNumber:7];
      if ((!v10 || [v10 unsignedIntValue] == 4)
        && ([v11 unsignedIntValue] == 2
         || [v11 unsignedIntValue] == 1))
      {
        *a4 = +[NSError errorWithOSStatus:4294960542];
        id v12 = self;
        unsigned __int8 v13 = sub_100083F74();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          long long v14 = sub_100083FD0(v12);
          id v15 = *a4;
          int v16 = 138543618;
          id v17 = v14;
          __int16 v18 = 2112;
          id v19 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@Overwriting the security session error code: %@", (uint8_t *)&v16, 0x16u);
        }
      }

      goto LABEL_13;
    }
  }
LABEL_14:
}

- (BOOL)useHH2
{
  return [(HAPAccessoryServer *)self unitTest_useHH2];
}

- (NSHashTable)notificationClients
{
  return self->_notificationClients;
}

- (void)setNotificationClients:(id)a3
{
}

- (int)successfulPingCount
{
  return self->_successfulPingCount;
}

- (void)setSuccessfulPingCount:(int)a3
{
  self->_successfulPingCount = a3;
}

- (int)failedPingCount
{
  return self->_failedPingCount;
}

- (void)setFailedPingCount:(int)a3
{
  self->_failedPingCount = a3;
}

- (BOOL)supportsUnreachablePing
{
  return self->_supportsUnreachablePing;
}

- (void)setSupportsUnreachablePing:(BOOL)a3
{
  self->_supportsUnreachablePing = a3;
}

- (HAPAccessory)primaryAccessory
{
  return self->_primaryAccessory;
}

- (void)setPrimaryAccessory:(id)a3
{
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (BOOL)supportsTimedWrite
{
  return self->_supportsTimedWrite;
}

- (void)setSupportsTimedWrite:(BOOL)a3
{
  self->_supportsTimedWrite = a3;
}

- (BOOL)isBLELinkConnected
{
  return self->_bleLinkConnected;
}

- (NSHashTable)internalDelegates
{
  return self->_internalDelegates;
}

- (OS_dispatch_queue)internalDelegateQueue
{
  return self->_internalDelegateQueue;
}

- (BOOL)unitTest_useHH2
{
  return self->_unitTest_useHH2;
}

- (void)setUnitTest_useHH2:(BOOL)a3
{
  self->_unitTest_useHH2 = a3;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HAPSuspendedAccessory)suspendedAccessory
{
  return self->_suspendedAccessory;
}

- (BOOL)isIncompatibleUpdate
{
  return self->_incompatibleUpdate;
}

- (void)setIncompatibleUpdate:(BOOL)a3
{
  self->_incompatibleUpdate = a3;
}

- (HAPKeyStore)keyStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyStore);

  return (HAPKeyStore *)WeakRetained;
}

- (HAPKeyBag)keyBag
{
  return self->_keyBag;
}

- (void)setKeyBag:(id)a3
{
}

- (HAPAccessoryPairingRequest)pairingRequest
{
  return self->_pairingRequest;
}

- (void)setPairingRequest:(id)a3
{
}

- (HMFActivity)pairingActivity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingActivity);

  return (HMFActivity *)WeakRetained;
}

- (void)setPairingActivity:(id)a3
{
}

- (unint64_t)metric_pairVerifyDurationInMS
{
  return self->_metric_pairVerifyDurationInMS;
}

- (void)setMetric_pairVerifyDurationInMS:(unint64_t)a3
{
  self->_metric_pairVerifyDurationInMS = a3;
}

- (NSString)metric_pairVerifyReason
{
  return self->_metric_pairVerifyReason;
}

- (void)setMetric_pairVerifyReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metric_pairVerifyReason, 0);
  objc_destroyWeak((id *)&self->_pairingActivity);
  objc_storeStrong((id *)&self->_pairingRequest, 0);
  objc_storeStrong((id *)&self->_keyBag, 0);
  objc_destroyWeak((id *)&self->_keyStore);
  objc_storeStrong((id *)&self->_suspendedAccessory, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalDelegateQueue, 0);
  objc_storeStrong((id *)&self->_internalDelegates, 0);
  objc_storeStrong((id *)&self->_primaryAccessory, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_connectionStartTime, 0);
  objc_storeStrong((id *)&self->_reachabilityChangedReason, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_notificationClients, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end